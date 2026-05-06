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
    }
)

$failures = New-Object System.Collections.Generic.List[string]

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

if ($failures.Count -gt 0) {
    foreach ($failure in $failures) {
        Write-Output $failure
    }
    exit 1
}

Write-Host "Skill quality checks passed."
