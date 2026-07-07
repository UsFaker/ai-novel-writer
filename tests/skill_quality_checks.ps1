# Skill quality checks.
# All check data lives in tests/checks.json (UTF-8, human readable).
# This script is ASCII-only logic so it runs identically on PowerShell 5.1 and 7+.

$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
$configPath = Join-Path $PSScriptRoot "checks.json"

if (!(Test-Path -LiteralPath $configPath)) {
    Write-Output "Missing tests/checks.json"
    exit 1
}

$config = Get-Content -Raw -Encoding UTF8 -LiteralPath $configPath | ConvertFrom-Json
$skillRoot = Join-Path $root $config.skillRoot
$failures = New-Object System.Collections.Generic.List[string]

function Read-Utf8 {
    param([string] $Path)
    return Get-Content -Raw -Encoding UTF8 -LiteralPath $Path
}

# 1. Required files must exist.
foreach ($relative in $config.requiredFiles) {
    $path = Join-Path $root $relative
    if (!(Test-Path -LiteralPath $path)) {
        $failures.Add("Missing required file: $relative")
    }
}

# 2. Forbidden paths: legacy architecture files and root-level duplicates must not return.
foreach ($relative in $config.forbiddenPaths) {
    $path = Join-Path $root $relative
    if (Test-Path -LiteralPath $path) {
        $failures.Add("Forbidden path exists: $relative (legacy layer or root duplicate; the skill has a single source of truth under $($config.skillRoot))")
    }
}

# 3. Pattern checks: load-bearing mechanisms must not be silently dropped.
foreach ($check in $config.patternChecks) {
    $path = Join-Path $skillRoot $check.file
    if (!(Test-Path -LiteralPath $path)) {
        $failures.Add("Missing file for pattern check: $($check.file)")
        continue
    }
    $content = Read-Utf8 $path
    foreach ($pattern in $check.mustContain) {
        if (!$content.Contains($pattern)) {
            $failures.Add("$($check.file) lost required concept: '$pattern'")
        }
    }
}

# 4. Simplicity budgets: additions must be paid for with deletions.
foreach ($budget in $config.budgets) {
    $path = Join-Path $skillRoot $budget.file
    if (!(Test-Path -LiteralPath $path)) { continue }
    $lineCount = (Get-Content -Encoding UTF8 -LiteralPath $path).Count
    if ($lineCount -gt $budget.maxLines) {
        $failures.Add("$($budget.file) is $lineCount lines, over its budget of $($budget.maxLines). Cut before you add; raise the budget in tests/checks.json only as a deliberate decision.")
    }
}

foreach ($dirBudget in $config.fileCountBudgets) {
    $dirPath = Join-Path $skillRoot $dirBudget.dir
    if (!(Test-Path -LiteralPath $dirPath)) { continue }
    $count = @(Get-ChildItem -LiteralPath $dirPath -Filter *.md -File).Count
    if ($count -gt $dirBudget.maxMarkdownFiles) {
        $failures.Add("$($dirBudget.dir)/ has $count markdown files, over its budget of $($dirBudget.maxMarkdownFiles). A new file needs an old one removed - or a deliberate budget raise in tests/checks.json.")
    }
}

# 5. SKILL.md frontmatter.
$skillPath = Join-Path $skillRoot "SKILL.md"
if (Test-Path -LiteralPath $skillPath) {
    $skillContent = Read-Utf8 $skillPath
    if ($skillContent -notmatch "(?s)^---\s*\r?\n(.*?)\r?\n---") {
        $failures.Add("SKILL.md must start with YAML frontmatter.")
    } else {
        $frontmatter = $Matches[1]
        $nameMatch = [regex]::Match($frontmatter, "(?m)^name:\s*(.+?)\s*$")
        if (!$nameMatch.Success) {
            $failures.Add("SKILL.md frontmatter must include name.")
        } elseif ($nameMatch.Groups[1].Value -notmatch "^[a-z0-9][a-z0-9-]*$") {
            $failures.Add("SKILL.md frontmatter name must use lowercase letters, numbers, and hyphens only.")
        }
        $descriptionMatch = [regex]::Match($frontmatter, "(?m)^description:\s*(.+?)\s*$")
        if (!$descriptionMatch.Success) {
            $failures.Add("SKILL.md frontmatter must include description.")
        } elseif ($descriptionMatch.Groups[1].Value -notmatch "^Use when ") {
            $failures.Add("SKILL.md description must start with 'Use when'.")
        }
    }
}

# 6. README checks.
foreach ($readmeName in $config.readmeChecks.files) {
    $readmePath = Join-Path $root $readmeName
    if (!(Test-Path -LiteralPath $readmePath)) { continue }
    $readmeContent = Read-Utf8 $readmePath
    foreach ($pattern in $config.readmeChecks.mustContain) {
        if (!$readmeContent.Contains($pattern)) {
            $failures.Add("$readmeName must reference '$pattern'.")
        }
    }
    foreach ($pattern in $config.readmeChecks.mustNotContain) {
        if ($readmeContent.Contains($pattern)) {
            $failures.Add("$readmeName references removed legacy content: '$pattern'.")
        }
    }
}

# 7. Evaluation prompts.
$promptPath = Join-Path $root $config.testPrompts.file
if (Test-Path -LiteralPath $promptPath) {
    try {
        $prompts = Read-Utf8 $promptPath | ConvertFrom-Json
        if ($prompts.Count -lt $config.testPrompts.minEntries) {
            $failures.Add("$($config.testPrompts.file) must contain at least $($config.testPrompts.minEntries) evaluation prompts.")
        }
        foreach ($prompt in $prompts) {
            if ([string]::IsNullOrWhiteSpace($prompt.id) -or [string]::IsNullOrWhiteSpace($prompt.prompt) -or [string]::IsNullOrWhiteSpace($prompt.expected)) {
                $failures.Add("$($config.testPrompts.file) entries must include id, prompt, and expected.")
                break
            }
        }
    } catch {
        $failures.Add("$($config.testPrompts.file) must be valid JSON. $($_.Exception.Message)")
    }
}

if ($failures.Count -gt 0) {
    foreach ($failure in $failures) {
        Write-Output $failure
    }
    exit 1
}

Write-Host "Skill quality checks passed."
