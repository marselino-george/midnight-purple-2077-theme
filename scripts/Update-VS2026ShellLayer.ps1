param(
    [string]$PkgdefPath = (Join-Path (Split-Path -Parent $PSScriptRoot) "Midnight Purple 2077.pkgdef")
)

$ErrorActionPreference = "Stop"

$themeGuid = "585b8664-ccd6-44fd-b1f7-0fb7a6f13eea"
$themeName = "Midnight Purple 2077"
$darkFallbackGuid = "1ded0138-47ce-435e-84ef-9ec1f439b749"

$shellGuid = "73708ded-2d56-4aad-b8eb-73b20d3f4bff"
$shellInternalGuid = "5af241b7-5627-4d12-bfb1-2b67d11127d7"

$shellTokenColors = [ordered]@{
    AccentFillAlt = "#FF9F69E8"
    AccentFillDefault = "#FF8D51D7"
    AccentFillDisabled = "#66613795"
    AccentFillSecondary = "#E58D51D7"
    AccentFillSelectedTextBackground = "#FF613795"
    AccentFillSelectedTextBackgroundSubtle = "#99613795"
    AccentFillSenary = "#557C41C4"
    AccentFillTertiary = "#CC7C41C4"
    AccentTextFillDisabled = "#668D51D7"
    AccentTextFillPrimary = "#FFC2E7FF"
    AccentTextFillSecondary = "#E5C2E7FF"
    AccentTextFillTertiary = "#B3C2E7FF"
    CardBackgroundFillDefault = "#FF1A0F2A"
    CardBackgroundFillSecondary = "#FF211335"
    CardBackgroundFillTertiary = "#FF27163C"
    CardStrokeDefault = "#667C41C4"
    CardStrokeDefaultSolid = "#FF4C2C75"
    CardStrokeDefaultSolidAlt = "#FF613795"
    ControlAltFillDisabled = "#1AFFFFFF"
    ControlAltFillQuaternary = "#334B2B73"
    ControlAltFillSecondary = "#2627153D"
    ControlAltFillTertiary = "#332E1A47"
    ControlAltFillTransparent = "#00000000"
    ControlFillActiveInput = "#FF211335"
    ControlFillDefault = "#FF24153A"
    ControlFillDisabled = "#2627153D"
    ControlFillQuaternary = "#FF3A2159"
    ControlFillSecondary = "#FF2B1944"
    ControlFillTertiary = "#FF321D50"
    ControlFillTransparent = "#00000000"
    ControlOnImageFillDefault = "#CC130B1E"
    ControlOnImageFillDisabled = "#4D130B1E"
    ControlOnImageFillSecondary = "#99130B1E"
    ControlOnImageFillTertiary = "#80130B1E"
    ControlSolidFillDefault = "#FFF4F4F4"
    ControlStrokeDefault = "#997C41C4"
    ControlStrokeForStrongFillWhenOnImage = "#FFFFFFFF"
    ControlStrokeOnAccentDefault = "#FFFFFFFF"
    ControlStrokeOnAccentDisabled = "#66FFFFFF"
    ControlStrokeOnAccentSecondary = "#B3FFFFFF"
    ControlStrokeOnAccentTertiary = "#80FFFFFF"
    ControlStrokeSecondary = "#667C41C4"
    ControlStrokeTransparent = "#00000000"
    ControlStrongFillDefault = "#FF8D51D7"
    ControlStrongFillDisabled = "#667C41C4"
    ControlStrongStrokeDefault = "#FFE8D7FF"
    ControlStrongStrokeDisabled = "#667C41C4"
    DividerStrokeDefault = "#667C41C4"
    FocusStrokeInner = "#FFF4F4F4"
    FocusStrokeOuter = "#FF8D51D7"
    HyperlinkFillDisabled = "#668D51D7"
    HyperlinkFillPrimary = "#FFC2E7FF"
    HyperlinkFillSecondary = "#FFE8D7FF"
    HyperlinkFillTertiary = "#FF9F69E8"
    LayerFillAlt = "#3327153D"
    LayerFillDefault = "#4D3A2159"
    ShadowFlyout = "#66000000"
    SmokeFillDefault = "#66000000"
    SmokeFillInverse = "#B2130B1E"
    SolidBackgroundFillBase = "#FF130B1E"
    SolidBackgroundFillBaseAlt = "#FF0E0816"
    SolidBackgroundFillQuaternary = "#FF211335"
    SolidBackgroundFillQuinary = "#FF2A1841"
    SolidBackgroundFillSecondary = "#FF160D24"
    SolidBackgroundFillSenary = "#FF33204F"
    SolidBackgroundFillTertiary = "#FF1A0F2A"
    SubtleFillDisabled = "#00000000"
    SubtleFillSecondary = "#267C41C4"
    SubtleFillTertiary = "#407C41C4"
    SubtleFillTransparent = "#00000000"
    SurfaceBackgroundFillDefault = "#FF1D112D"
    SurfaceStrokeDefault = "#667C41C4"
    SurfaceStrokeFlyout = "#994C2C75"
    SystemFillAttention = "#FF8D51D7"
    SystemFillAttentionBackground = "#2627153D"
    SystemFillCaution = "#FFFFD166"
    SystemFillCautionBackground = "#FF3A2A17"
    SystemFillCritical = "#FFFF6B8A"
    SystemFillCriticalBackground = "#FF3A1722"
    SystemFillNeutral = "#B3F4F4F4"
    SystemFillNeutralBackground = "#2627153D"
    SystemFillSolidAttentionBackground = "#FF2A1841"
    SystemFillSolidNeutral = "#FF9B8AB8"
    SystemFillSolidNeutralBackground = "#FF24153A"
    SystemFillSuccess = "#FF6EE7B7"
    SystemFillSuccessBackground = "#FF16362C"
    TextFillDisabled = "#66F4F4F4"
    TextFillPrimary = "#FFF4F4F4"
    TextFillSecondary = "#D9F4F4F4"
    TextFillTertiary = "#A6F4F4F4"
    TextOnAccentFillDisabled = "#B3FFFFFF"
    TextOnAccentFillPrimary = "#FFFFFFFF"
    TextOnAccentFillSecondary = "#E6FFFFFF"
    TextOnAccentFillSelectedText = "#FFFFFFFF"
}

$shellInternalTokenColors = [ordered]@{
    CaptionControlCloseFillPrimary = "#FFC42B1C"
    CaptionControlCloseFillSecondary = "#E6C42B1C"
    CaptionControlCloseTextFillPrimary = "#FFFFFFFF"
    CaptionControlCloseTextFillSecondary = "#B3FFFFFF"
    EnvironmentBackground = "#FF130B1E"
    EnvironmentBadge = "#337C41C4"
    EnvironmentBody = "#FF130B1E"
    EnvironmentBodyText = "#FFF4F4F4"
    EnvironmentBorder = "#FF7C41C4"
    EnvironmentBorderInactive = "#FF3A2159"
    EnvironmentHeader = "#FF1A0F2A"
    EnvironmentHeaderInactive = "#FF130B1E"
    EnvironmentIndicator = "#997C41C4"
    EnvironmentLayeredBackground = "#4D3A2159"
    EnvironmentLayeredBorder = "#804C2C75"
    EnvironmentLogo = "#FF8D51D7"
    EnvironmentTab = "#FF1D112D"
    EnvironmentTabInactive = "#FF160D24"
    StatusBarBackgroundFillBuilding = "#FF5D2F9A"
    StatusBarBackgroundFillDebugging = "#FF7A2101"
    StatusBarBackgroundFillRest = "#FF27163C"
    StatusBarBackgroundFillSolutionLoading = "#FF3A2159"
    StatusBarControlFillSecondary = "#337C41C4"
    StatusBarTextFillBuilding = "#FFFFFFFF"
    StatusBarTextFillDebugging = "#FFFFFFFF"
    StatusBarTextFillDisabled = "#90FFFFFF"
    StatusBarTextFillRest = "#FFFFFFFF"
    StatusBarTextFillSolutionLoading = "#FFFFFFFF"
}

$shellTokens = @($shellTokenColors.GetEnumerator() | ForEach-Object { @{ Name = $_.Key; Background = $_.Value } })
$shellInternalTokens = @($shellInternalTokenColors.GetEnumerator() | ForEach-Object { @{ Name = $_.Key; Background = $_.Value } })

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
