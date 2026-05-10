param(
    [string]$Destination = (Join-Path $env:USERPROFILE ".codex\skills\ai4s-workspace"),
    [string]$Repo = "https://github.com/JoeyHu-coding/ai4s-workspace-skill.git",
    [string]$SourcePath = ""
)

$ErrorActionPreference = "Stop"

function Get-Timestamp {
    Get-Date -Format "yyyyMMdd-HHmmss"
}

function Copy-SkillPackage {
    param(
        [string]$Source,
        [string]$Target
    )

    if (Test-Path -LiteralPath $Target) {
        $backup = "$Target.backup-$(Get-Timestamp)"
        Move-Item -LiteralPath $Target -Destination $backup
        Write-Host "Existing skill moved to: $backup"
    }

    New-Item -ItemType Directory -Force -Path $Target | Out-Null

    $exclude = @(".git", "development-workspace")
    Get-ChildItem -LiteralPath $Source -Force | Where-Object {
        $exclude -notcontains $_.Name
    } | ForEach-Object {
        Copy-Item -LiteralPath $_.FullName -Destination $Target -Recurse -Force
    }
}

if ([string]::IsNullOrWhiteSpace($Destination)) {
    throw "Destination cannot be empty."
}

$parent = Split-Path -Parent $Destination
New-Item -ItemType Directory -Force -Path $parent | Out-Null

if (-not [string]::IsNullOrWhiteSpace($SourcePath)) {
    $resolvedSource = (Resolve-Path -LiteralPath $SourcePath).Path
    Copy-SkillPackage -Source $resolvedSource -Target $Destination
} else {
    $git = Get-Command git -ErrorAction SilentlyContinue

    if ($git) {
        if ((Test-Path -LiteralPath (Join-Path $Destination ".git"))) {
            git -C $Destination pull --ff-only
        } else {
            if (Test-Path -LiteralPath $Destination) {
                $backup = "$Destination.backup-$(Get-Timestamp)"
                Move-Item -LiteralPath $Destination -Destination $backup
                Write-Host "Existing skill moved to: $backup"
            }

            git clone $Repo $Destination
        }
    } else {
        $zipUrl = $Repo -replace "\.git$", "/archive/refs/heads/main.zip"
        $tempRoot = Join-Path ([System.IO.Path]::GetTempPath()) "ai4s-workspace-install-$(Get-Timestamp)"
        $zipPath = Join-Path $tempRoot "repo.zip"
        New-Item -ItemType Directory -Force -Path $tempRoot | Out-Null

        Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath
        Expand-Archive -LiteralPath $zipPath -DestinationPath $tempRoot -Force
        $expanded = Get-ChildItem -LiteralPath $tempRoot -Directory | Select-Object -First 1
        if (-not $expanded) {
            throw "Could not find expanded repository in $tempRoot."
        }

        Copy-SkillPackage -Source $expanded.FullName -Target $Destination
        Remove-Item -LiteralPath $tempRoot -Recurse -Force
    }
}

$skillFile = Join-Path $Destination "SKILL.md"
if (-not (Test-Path -LiteralPath $skillFile)) {
    throw "Install completed but SKILL.md was not found at $skillFile."
}

Write-Host "AI4S Workspace skill installed at: $Destination"
