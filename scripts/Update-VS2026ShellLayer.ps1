param(
    [string]$PkgdefPath = (Join-Path (Split-Path -Parent $PSScriptRoot) "Midnight Purple 2077.pkgdef")
)

$ErrorActionPreference = "Stop"

$oldThemeGuid = "585b8664-ccd6-44fd-b1f7-0fb7a6f13eea"
$themeGuid = "8db7c767-3ded-4c92-befa-c40152c6ac12"
$themeName = "Midnight Purple 2077 VS2026 Lab"
$darkFallbackGuid = "1ded0138-47ce-435e-84ef-9ec1f439b749"

$shellGuid = "73708ded-2d56-4aad-b8eb-73b20d3f4bff"
$shellInternalGuid = "5af241b7-5627-4d12-bfb1-2b67d11127d7"

$shellTokens = @(
    @{ Name = "AccentFillDefault"; Background = "#FF7C41C4" },
    @{ Name = "AccentFillSecondary"; Background = "#E58D51D7" },
    @{ Name = "AccentFillTertiary"; Background = "#CC613795" },
    @{ Name = "SolidBackgroundFillTertiary"; Background = "#FF27163C" },
    @{ Name = "SolidBackgroundFillQuaternary"; Background = "#FF2E1A47" },
    @{ Name = "SurfaceBackgroundFillDefault"; Background = "#FF1D112D" },
    @{ Name = "TextFillSecondary"; Background = "#D9F4F4F4" }
)

$shellInternalTokens = @(
    @{ Name = "EnvironmentBackground"; Background = "#FF130B1E" },
    @{ Name = "EnvironmentBody"; Background = "#FF130B1E" },
    @{ Name = "EnvironmentBorder"; Background = "#FF7C41C4" },
    @{ Name = "EnvironmentHeader"; Background = "#FF1A0F2A" },
    @{ Name = "EnvironmentHeaderInactive"; Background = "#FF160D24" },
    @{ Name = "EnvironmentIndicator"; Background = "#997C41C4" },
    @{ Name = "EnvironmentLayeredBackground"; Background = "#4D3A2159" },
    @{ Name = "EnvironmentLogo"; Background = "#FF7C41C4" },
    @{ Name = "EnvironmentTab"; Background = "#FF1D112D" },
    @{ Name = "EnvironmentTabInactive"; Background = "#FF160D24" }
)

function Add-Int32 {
    param(
        [System.Collections.Generic.List[byte]]$Bytes,
        [int]$Value
    )

    $Bytes.AddRange([BitConverter]::GetBytes($Value))
}

function Add-GuidBytes {
    param(
        [System.Collections.Generic.List[byte]]$Bytes,
        [string]$Value
    )

    $Bytes.AddRange(([Guid]$Value).ToByteArray())
}

function Add-RawColor {
    param(
        [System.Collections.Generic.List[byte]]$Bytes,
        [string]$Color
    )

    $hex = $Color.TrimStart("#")
    if ($hex.Length -ne 8) {
        throw "Color '$Color' must use #AARRGGBB format."
    }

    $a = [Convert]::ToByte($hex.Substring(0, 2), 16)
    $r = [Convert]::ToByte($hex.Substring(2, 2), 16)
    $g = [Convert]::ToByte($hex.Substring(4, 2), 16)
    $b = [Convert]::ToByte($hex.Substring(6, 2), 16)

    $Bytes.Add(1)
    $Bytes.Add($r)
    $Bytes.Add($g)
    $Bytes.Add($b)
    $Bytes.Add($a)
}

function Add-EmptyColor {
    param([System.Collections.Generic.List[byte]]$Bytes)

    $Bytes.Add(0)
}

function New-ThemeCategoryData {
    param(
        [string]$CategoryGuid,
        [object[]]$Tokens
    )

    $bytes = [System.Collections.Generic.List[byte]]::new()
    Add-Int32 $bytes 0
    Add-Int32 $bytes 11
    Add-Int32 $bytes 1
    Add-GuidBytes $bytes $CategoryGuid
    Add-Int32 $bytes $Tokens.Count

    foreach ($token in $Tokens) {
        $nameBytes = [Text.Encoding]::ASCII.GetBytes($token.Name)
        Add-Int32 $bytes $nameBytes.Length
        $bytes.AddRange($nameBytes)
        Add-RawColor $bytes $token.Background
        Add-EmptyColor $bytes
    }

    $data = $bytes.ToArray()
    [BitConverter]::GetBytes($data.Length).CopyTo($data, 0)
    return ($data | ForEach-Object { $_.ToString("x2") }) -join ","
}

function Test-ThemeCategoryData {
    param(
        [string]$Content,
        [string]$Category,
        [int]$ExpectedCount
    )

    $pattern = '(?ms)\[\$RootKey\$\\Themes\\\{' + [regex]::Escape($themeGuid) + '\}\\' + [regex]::Escape($Category) + '\]\s*[\r\n]+\s*"Data"=hex:(?<hex>[0-9a-fA-F,]+)'
    $match = [regex]::Match($Content, $pattern)
    if (-not $match.Success) {
        throw "Missing VS2026 $Category category."
    }

    [byte[]]$bytes = @($match.Groups["hex"].Value -split "," | ForEach-Object { [Convert]::ToByte($_, 16) })
    $position = 0
    $declaredBytes = [BitConverter]::ToInt32($bytes, $position)
    $position += 4
    $version = [BitConverter]::ToInt32($bytes, $position)
    $position += 4
    $kind = [BitConverter]::ToInt32($bytes, $position)
    $position += 4
    $position += 16
    $count = [BitConverter]::ToInt32($bytes, $position)
    $position += 4

    if ($declaredBytes -ne $bytes.Length) {
        throw "$Category has invalid length header: declared $declaredBytes, actual $($bytes.Length)."
    }

    if ($version -ne 11 -or $kind -ne 1) {
        throw "$Category has unexpected header values: version $version, kind $kind."
    }

    if ($count -ne $ExpectedCount) {
        throw "$Category has unexpected token count: expected $ExpectedCount, actual $count."
    }

    [pscustomobject]@{
        Category = $Category
        Count = $count
        Bytes = $bytes.Length
    }
}

$pkgdef = Get-Content -LiteralPath $PkgdefPath -Raw
$pkgdef = $pkgdef.Replace("{$oldThemeGuid}", "{$themeGuid}")

$registrationPattern = '(?ms)\[\$RootKey\$\\Themes\\\{' + [regex]::Escape($themeGuid) + '\}\]\s*[\r\n]+@="[^"]*"\s*[\r\n]+"Name"="[^"]*"\s*[\r\n]+"FallbackId"="\{[0-9a-fA-F-]+\}"'
$registration = @(
    ('[$RootKey$\Themes\{' + $themeGuid + '}]')
    ('@="' + $themeName + '"')
    ('"Name"="' + $themeName + '"')
    ('"FallbackId"="{' + $darkFallbackGuid + '}"')
) -join "`r`n"
$pkgdef = [regex]::Replace($pkgdef, $registrationPattern, $registration, 1)

foreach ($category in @("Shell", "ShellInternal")) {
    $categoryPattern = '(?ms)\s*\[\$RootKey\$\\Themes\\\{' + [regex]::Escape($themeGuid) + '\}\\' + $category + '\]\s*[\r\n]+"Data"=hex:[0-9a-fA-F,]+\s*'
    $pkgdef = [regex]::Replace($pkgdef, $categoryPattern, "`r`n", 1)
}

$shellData = New-ThemeCategoryData -CategoryGuid $shellGuid -Tokens $shellTokens
$shellInternalData = New-ThemeCategoryData -CategoryGuid $shellInternalGuid -Tokens $shellInternalTokens

$shellLayer = @(
    ('[$RootKey$\Themes\{' + $themeGuid + '}\Shell]')
    ('"Data"=hex:' + $shellData)
    ''
    ('[$RootKey$\Themes\{' + $themeGuid + '}\ShellInternal]')
    ('"Data"=hex:' + $shellInternalData)
) -join "`r`n"

$pkgdef = $pkgdef.TrimEnd() + "`r`n`r`n" + $shellLayer
Set-Content -LiteralPath $PkgdefPath -Value $pkgdef -Encoding utf8

$updated = Get-Content -LiteralPath $PkgdefPath -Raw
Test-ThemeCategoryData -Content $updated -Category "Shell" -ExpectedCount $shellTokens.Count
Test-ThemeCategoryData -Content $updated -Category "ShellInternal" -ExpectedCount $shellInternalTokens.Count
