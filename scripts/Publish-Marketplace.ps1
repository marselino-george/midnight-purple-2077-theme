[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [string]$PersonalAccessToken,
    [string]$VsixPublisherPath,
    [string]$Configuration = "Release",
    [string]$Platform = "AnyCPU",
    [switch]$SkipBuild,
    [switch]$SkipClean
)

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$projectPath = Join-Path $repoRoot "MidnightPurple2077Theme.csproj"
$publishManifestPath = Join-Path $repoRoot "vs-publish.json"
$vsixPath = Join-Path $repoRoot "bin\$Configuration\MidnightPurple2077Theme.vsix"
$vsixManifestPath = Join-Path $repoRoot "source.extension.vsixmanifest"

function Find-VsixPublisher {
    param([string]$ExplicitPath)

    if ($ExplicitPath) {
        if (-not (Test-Path -LiteralPath $ExplicitPath)) {
            throw "VsixPublisher.exe was not found at '$ExplicitPath'."
        }

        return (Resolve-Path -LiteralPath $ExplicitPath).Path
    }

    $vswhere = "${env:ProgramFiles(x86)}\Microsoft Visual Studio\Installer\vswhere.exe"
    if (Test-Path -LiteralPath $vswhere) {
        $found = & $vswhere -latest -products * -requires Microsoft.VisualStudio.Component.VSSDK -find "VSSDK\VisualStudioIntegration\Tools\Bin\VsixPublisher.exe"
        if ($found) {
            return $found | Select-Object -First 1
        }
    }

    $fallbacks = @(
        "$env:ProgramFiles\Microsoft Visual Studio\18\Community\VSSDK\VisualStudioIntegration\Tools\Bin\VsixPublisher.exe",
        "$env:ProgramFiles\Microsoft Visual Studio\2022\Enterprise\VSSDK\VisualStudioIntegration\Tools\Bin\VsixPublisher.exe",
        "${env:ProgramFiles(x86)}\Microsoft Visual Studio\2022\Community\VSSDK\VisualStudioIntegration\Tools\Bin\VsixPublisher.exe"
    )

    foreach ($candidate in $fallbacks) {
        if (Test-Path -LiteralPath $candidate) {
            return $candidate
        }
    }

    throw "VsixPublisher.exe was not found. Install the Visual Studio extension development workload or pass -VsixPublisherPath."
}

if (-not $SkipBuild) {
    if (-not $SkipClean) {
        & dotnet msbuild $projectPath /t:Clean /p:Configuration=$Configuration /p:Platform=$Platform
    }

    & dotnet msbuild $projectPath /restore /p:Configuration=$Configuration /p:Platform=$Platform /p:DeployExtension=false
}

if (-not (Test-Path -LiteralPath $vsixPath)) {
    throw "VSIX package was not found at '$vsixPath'. Build the project first or check -Configuration."
}

$vsixManifest = Get-Content -LiteralPath $vsixManifestPath -Raw
if ($vsixManifest -match "VS2026 Lab" -and -not $WhatIfPreference) {
    throw "This branch builds the side-by-side VS2026 Lab package. Do not publish it to the public Marketplace listing."
}

$publisher = Find-VsixPublisher -ExplicitPath $VsixPublisherPath
$publishArgs = @(
    "publish",
    "-payload", $vsixPath,
    "-publishManifest", $publishManifestPath
)

if ($PersonalAccessToken) {
    $publishArgs += @("-personalAccessToken", $PersonalAccessToken)
}

if ($PSCmdlet.ShouldProcess($vsixPath, "Publish VSIX to Visual Studio Marketplace")) {
    & $publisher @publishArgs
}
