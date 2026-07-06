$ErrorActionPreference = "Stop"

function Convert-HexStringToText {
    param([string] $Codes)

    return -join ($Codes -split " " | ForEach-Object {
        if ($_ -eq "X" -or $_ -eq "Y") {
            $_
        } else {
            [char][Convert]::ToInt32($_, 16)
        }
    })
}

$root = Split-Path -Parent $PSScriptRoot

$checks = @(
    @{
        File = "SKILL.md"
        Pattern = Convert-HexStringToText "53D9 4E8B 89C6 89D2 5951 7EA6"
        Message = "SKILL.md must require a narrative POV contract before drafting."
    },
    @{
        File = "SKILL.md"
        Pattern = Convert-HexStringToText "8D44 6599 53EA 4F5C 4E3A 7EA6 675F"
        Message = "SKILL.md must demote outline/status material to constraints, not prose source."
    },
    @{
        File = "rules/writing_rules.md"
        Pattern = Convert-HexStringToText "89C6 89D2 951A 5B9A"
        Message = "writing_rules.md must require POV anchoring."
    },
    @{
        File = "rules/writing_rules.md"
        Pattern = Convert-HexStringToText "8BFB 8005 95EE 9898"
        Message = "writing_rules.md must track the reader-facing question."
    },
    @{
        File = "rules/review_rules.md"
        Pattern = Convert-HexStringToText "8D44 6599 6269 5199 75D5 8FF9"
        Message = "review_rules.md must reject material-expansion prose."
    },
    @{
        File = "rules/review_rules.md"
        Pattern = Convert-HexStringToText "4E0D 662F X FF0C 662F Y"
        Message = "review_rules.md must catch repetitive negative-definition style."
    },
    @{
        File = "rules/next_chapter_direction_rules.md"
        Pattern = Convert-HexStringToText "65B9 5411 6587 6863 4E0D 662F 6B63 6587 7D20 6750"
        Message = "next_chapter_direction_rules.md must prevent direction prose from becoming chapter prose."
    },
    @{
        File = "SKILL.md"
        Pattern = Convert-HexStringToText "5199 524D 4E0A 4E0B 6587 6E05 5355"
        Message = "SKILL.md must include the pre-write context checklist."
    },
    @{
        File = "SKILL.md"
        Pattern = Convert-HexStringToText "98CE 683C 4E0E 89C4 8303 63A2 6D4B"
        Message = "SKILL.md must detect style and requirement constraints."
    },
    @{
        File = "rules/writing_rules.md"
        Pattern = Convert-HexStringToText "573A 666F 002D 7EED 573A 94FE"
        Message = "writing_rules.md must require scene-sequel structure."
    },
    @{
        File = "rules/tracking_rules.md"
        Pattern = Convert-HexStringToText "957F 671F 8FFD 8E2A 7D22 5F15"
        Message = "tracking_rules.md must define long-term tracking indexes."
    },
    @{
        File = "SKILL.md"
        Pattern = Convert-HexStringToText "957F 7BC7 7ED3 6784 7D22 5F15"
        Message = "SKILL.md must require a long-form structure index for million-word projects."
    },
    @{
        File = "prompts\00_story_blueprint.md"
        Pattern = Convert-HexStringToText "5BB9 91CF 9884 7B97"
        Message = "00_story_blueprint.md must require capacity budgeting before arc/volume planning."
    },
    @{
        File = "prompts\03_emotion_outline.md"
        Pattern = Convert-HexStringToText "6279 6B21 751F 6210"
        Message = "03_emotion_outline.md must require batch generation for long-form chapter beats."
    },
    @{
        File = "prompts\00a_longform_structure_index.md"
        Pattern = Convert-HexStringToText "957F 7BC7 7ED3 6784 7D22 5F15"
        Message = "long-form structure index template must exist."
    },
    @{
        File = "rules/tracking_rules.md"
        Pattern = Convert-HexStringToText "6545 4E8B 7EBF 4E8B 4EF6 8FFD 8E2A 8868"
        Message = "tracking_rules.md must define event-based storyline tracking."
    },
    @{
        File = "rules/review_rules.md"
        Pattern = Convert-HexStringToText "9057 5FD8 5143 7D20 5BA1 67E5"
        Message = "review_rules.md must check forgotten story elements."
    },
    @{
        File = "prompts\00a_longform_structure_index.md"
        Pattern = Convert-HexStringToText "4E0D 5F97 628A 89C4 5212 7AE0 8282 5F53 6210 5DF2 5B8C 6210 8FDB 5EA6"
        Message = "long-form structure index prompt must prevent planned chapters from becoming progress."
    },
    @{
        File = "prompts\03_emotion_outline.md"
        Pattern = Convert-HexStringToText "7AE0 8282 8303 56F4 786C 6821 9A8C"
        Message = "emotion outline prompt must require hard chapter-range consistency checks against the structure index."
    },
    @{
        File = "SKILL.md"
        Pattern = Convert-HexStringToText "8282 62CD 002D 7ED3 6784 4E00 81F4 6027 68C0 67E5"
        Message = "SKILL.md must require beat/structure consistency checks before chapter writing."
    },
    @{
        File = "prompts\03_emotion_outline.md"
        Pattern = Convert-HexStringToText "6279 6B21 4EFB 52A1 767D 540D 5355"
        Message = "emotion outline prompt must require a batch-task whitelist before generating beats."
    },
    @{
        File = "prompts\03_emotion_outline.md"
        Pattern = Convert-HexStringToText "7981 6B62 628A 5F53 524D 5377 5173 952E 4E8B 4EF6 6539 5199 6210 5F53 524D 6279 6B21 4E8B 4EF6"
        Message = "emotion outline prompt must forbid turning volume-level key events into current-batch events."
    },
    @{
        File = "prompts\03_emotion_outline.md"
        Pattern = Convert-HexStringToText "4E0B 4E00 6279 5165 53E3 53EA 80FD 4F5C 4E3A 7AE0 672B 94A9 5B50"
        Message = "emotion outline prompt must keep the next-batch entrance as a hook only."
    },
    @{
        File = "prompts\03b_batch_context_pack.md"
        Pattern = Convert-HexStringToText "6279 6B21 4E0A 4E0B 6587 5305"
        Message = "03B batch context pack prompt must exist and name the batch context pack."
    },
    @{
        File = "prompts\03b_batch_context_pack.md"
        Pattern = Convert-HexStringToText "7981 6B62 590D 5236 5168 4E66 8D44 4EA7 539F 6587"
        Message = "03B batch context pack must forbid copying full-book asset source text."
    },
    @{
        File = "prompts\03b_batch_context_pack.md"
        Pattern = Convert-HexStringToText "4F0F 7B14 72B6 6001 673A"
        Message = "03B batch context pack must use a foreshadowing state machine."
    },
    @{
        File = "prompts\03b_batch_context_pack.md"
        Pattern = Convert-HexStringToText "6545 4E8B 7EBF 4E0B 4E00 6B65 52A8 4F5C"
        Message = "03B batch context pack must reduce storylines to next allowed actions."
    },
    @{
        File = "prompts\03b_batch_context_pack.md"
        Pattern = Convert-HexStringToText "8282 62CD 63A5 529B 5361"
        Message = "03B batch context pack must output a beat handoff card."
    },
    @{
        File = "prompts\03_emotion_outline.md"
        Pattern = Convert-HexStringToText "53EA 63A5 53D7 6279 6B21 4E0A 4E0B 6587 5305"
        Message = "03 emotion outline must accept only the batch context pack as planning input."
    },
    @{
        File = "prompts\03_emotion_outline.md"
        Pattern = Convert-HexStringToText "7981 6B62 7C98 8D34 5168 4E66 8D44 4EA7 539F 6587"
        Message = "03 emotion outline must forbid pasting full-book asset source text."
    },
    @{
        File = "prompts\00a_longform_structure_index.md"
        Pattern = Convert-HexStringToText "5377 6BB5"
        Message = "long-form structure index must support volume segments for very large volumes."
    },
    @{
        File = "rules\tracking_rules.md"
        Pattern = Convert-HexStringToText "4F0F 7B14 72B6 6001 673A"
        Message = "tracking rules must define the foreshadowing state machine."
    },
    @{
        File = "rules\asset_permission_rules.md"
        Pattern = Convert-HexStringToText "6743 9650 6458 8981"
        Message = "asset permission rules must require current-batch permission summaries."
    },
    @{
        File = "rules\next_chapter_direction_rules.md"
        Pattern = Convert-HexStringToText "53EA 5141 8BB8 4F7F 7528 6279 6B21 4E0A 4E0B 6587 5305"
        Message = "next chapter direction rules must use only the batch context pack as the planning input."
    },
    @{
        File = "rules\next_chapter_direction_rules.md"
        Pattern = Convert-HexStringToText "7981 6B62 6253 5F00 5168 4E66 8D44 4EA7 539F 6587"
        Message = "next chapter direction rules must forbid opening full-book asset source text."
    },
    @{
        File = "SKILL.md"
        Pattern = Convert-HexStringToText "9636 6BB5 0033 0042"
        Message = "SKILL.md must route outline generation through stage 3B."
    },
    @{
        File = "SKILL.md"
        Pattern = Convert-HexStringToText "4E0A 4E00 7AE0 672A 89E3 51B3 95EE 9898"
        Message = "SKILL.md must require carrying unresolved pressure from the previous chapter into the next chapter."
    },
    @{
        File = "rules\writing_rules.md"
        Pattern = Convert-HexStringToText "8FDE 7EED 7AE0 8282 63A5 529B"
        Message = "writing_rules.md must define continuous chapter handoff rules."
    },
    @{
        File = "rules\writing_rules.md"
        Pattern = Convert-HexStringToText "72EC 7ACB 77ED 7BC7 5316"
        Message = "writing_rules.md must forbid chapters from reading like isolated short stories."
    },
    @{
        File = "rules\review_rules.md"
        Pattern = Convert-HexStringToText "72EC 7ACB 77ED 7BC7 5316 5BA1 67E5"
        Message = "review_rules.md must review for isolated-short-story chapter structure."
    },
    @{
        File = "rules\next_chapter_direction_rules.md"
        Pattern = Convert-HexStringToText "627F 63A5 4E0A 4E00 7AE0 538B 529B"
        Message = "next chapter direction rules must put previous-chapter pressure before standalone chapter structure."
    }
)

$failures = New-Object System.Collections.Generic.List[string]

function Get-FileText {
    param([string] $RelativePath)

    $path = Join-Path $root $RelativePath
    if (!(Test-Path -LiteralPath $path)) {
        $failures.Add("Missing file: $RelativePath")
        return $null
    }

    return Get-Content -Raw -Encoding UTF8 -LiteralPath $path
}

foreach ($check in $checks) {
    $path = Join-Path $root $check.File
    if (!(Test-Path -LiteralPath $path)) {
        $failures.Add("Missing file: $($check.File)")
        continue
    }

    $content = Get-Content -Raw -Encoding UTF8 -LiteralPath $path
    if (!$content.Contains($check.Pattern)) {
        $failures.Add("$($check.Message) Missing pattern: '$($check.Pattern)'")
    }
}

$skillContent = Get-FileText "SKILL.md"
if ($null -ne $skillContent) {
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

    if ($skillContent.Contains("rules/writing_rules.md")) {
        $writingRules = Get-FileText "rules/writing_rules.md"
        if ($null -ne $writingRules) {
            $requiredWritingSections = @(
                Convert-HexStringToText "5C0F 8BF4 611F 4E0E 53D9 4E8B 89C6 89D2"
                Convert-HexStringToText "60C5 7EEA 6267 884C 89C4 5219"
                Convert-HexStringToText "7981 6B62 4E8B 9879"
                Convert-HexStringToText "5FC5 987B 4E8B 9879"
            )

            foreach ($section in $requiredWritingSections) {
                if (!$writingRules.Contains("## $section")) {
                    $failures.Add("rules/writing_rules.md must define section '$section' referenced by SKILL.md.")
                }
            }

            $bodyStructure = Convert-HexStringToText "6B63 6587 7ED3 6784"
            if ($skillContent.Contains($bodyStructure) -and !$writingRules.Contains("## $bodyStructure")) {
                $failures.Add("SKILL.md references missing rules/writing_rules.md section '$bodyStructure'.")
            }
        }
    }
}

$packagedSkill = Join-Path $root "skills\ai-novel-writer\SKILL.md"
$rootSkill = Join-Path $root "SKILL.md"
if ((Test-Path -LiteralPath $rootSkill) -and (Test-Path -LiteralPath $packagedSkill)) {
    $rootHash = (Get-FileHash -Algorithm SHA256 -LiteralPath $rootSkill).Hash
    $packagedHash = (Get-FileHash -Algorithm SHA256 -LiteralPath $packagedSkill).Hash
    if ($rootHash -ne $packagedHash) {
        $failures.Add("Packaged skills/ai-novel-writer/SKILL.md must stay in sync with root SKILL.md.")
    }
}

foreach ($relativeRule in @(
    "rules\writing_rules.md",
    "rules\review_rules.md",
    "rules\tracking_rules.md",
    "rules\next_chapter_direction_rules.md"
)) {
    $rootRule = Join-Path $root $relativeRule
    $packagedRule = Join-Path $root "skills\ai-novel-writer\$relativeRule"
    if ((Test-Path -LiteralPath $rootRule) -and (Test-Path -LiteralPath $packagedRule)) {
        $rootRuleHash = (Get-FileHash -Algorithm SHA256 -LiteralPath $rootRule).Hash
        $packagedRuleHash = (Get-FileHash -Algorithm SHA256 -LiteralPath $packagedRule).Hash
        if ($rootRuleHash -ne $packagedRuleHash) {
            $failures.Add("Packaged skills/ai-novel-writer/$relativeRule must stay in sync with root $relativeRule.")
        }
    }
}

foreach ($relativePrompt in @(
    "prompts\00_story_blueprint.md",
    "prompts\00a_longform_structure_index.md",
    "prompts\00b_story_constitution.md",
    "prompts\00c_asset_permission_system.md",
    "prompts\03a_outline_constraints.md",
    "prompts\03b_batch_context_pack.md",
    "prompts\03_emotion_outline.md"
)) {
    $rootPrompt = Join-Path $root $relativePrompt
    $packagedPrompt = Join-Path $root "skills\ai-novel-writer\$relativePrompt"
    if ((Test-Path -LiteralPath $rootPrompt) -and (Test-Path -LiteralPath $packagedPrompt)) {
        $rootPromptHash = (Get-FileHash -Algorithm SHA256 -LiteralPath $rootPrompt).Hash
        $packagedPromptHash = (Get-FileHash -Algorithm SHA256 -LiteralPath $packagedPrompt).Hash
        if ($rootPromptHash -ne $packagedPromptHash) {
            $failures.Add("Packaged skills/ai-novel-writer/$relativePrompt must stay in sync with root $relativePrompt.")
        }
    }
}

foreach ($readme in @("README.md", "README_zh.md")) {
    $readmeContent = Get-FileText $readme
    if ($null -ne $readmeContent) {
        if ($readmeContent.Contains(".agents/skills/ai-novel-writing")) {
            $failures.Add("$readme must not reference stale .agents/skills/ai-novel-writing paths.")
        }

        if (!$readmeContent.Contains("skills/ai-novel-writer/SKILL.md")) {
            $failures.Add("$readme must link to the packaged skills/ai-novel-writer/SKILL.md.")
        }
    }
}

foreach ($promptFile in @("test-prompts.json", "skills\ai-novel-writer\test-prompts.json")) {
    $promptPath = Join-Path $root $promptFile
    if (!(Test-Path -LiteralPath $promptPath)) {
        $failures.Add("$promptFile must exist for repeatable skill evaluation.")
        continue
    }

    try {
        $prompts = Get-Content -Raw -Encoding UTF8 -LiteralPath $promptPath | ConvertFrom-Json
        if ($prompts.Count -lt 3) {
            $failures.Add("$promptFile must contain at least 3 evaluation prompts.")
        }

        foreach ($prompt in $prompts) {
            if ([string]::IsNullOrWhiteSpace($prompt.id) -or [string]::IsNullOrWhiteSpace($prompt.prompt) -or [string]::IsNullOrWhiteSpace($prompt.expected)) {
                $failures.Add("$promptFile entries must include id, prompt, and expected.")
                break
            }
        }
    } catch {
        $failures.Add("$promptFile must be valid JSON. $($_.Exception.Message)")
    }
}

$rootPromptPath = Join-Path $root "test-prompts.json"
$packagedPromptPath = Join-Path $root "skills\ai-novel-writer\test-prompts.json"
if ((Test-Path -LiteralPath $rootPromptPath) -and (Test-Path -LiteralPath $packagedPromptPath)) {
    $rootPromptHash = (Get-FileHash -Algorithm SHA256 -LiteralPath $rootPromptPath).Hash
    $packagedPromptHash = (Get-FileHash -Algorithm SHA256 -LiteralPath $packagedPromptPath).Hash
    if ($rootPromptHash -ne $packagedPromptHash) {
        $failures.Add("Packaged skills/ai-novel-writer/test-prompts.json must stay in sync with root test-prompts.json.")
    }
}

if ($failures.Count -gt 0) {
    foreach ($failure in $failures) {
        Write-Output $failure
    }
    exit 1
}

Write-Host "Skill quality checks passed."
