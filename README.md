# Midnight Purple 2077 VS2026 Lab

Experimental side-by-side Visual Studio 2026 chrome color test build for the Midnight Purple 2077 theme.

![Midnight Purple 2077 in Visual Studio](vspreview1.png)

## Compatibility

| Visual Studio | Version range | Architecture |
| --- | --- | --- |
| Visual Studio 2022 | 17.x | AMD64, ARM64 |
| Visual Studio 2026 | 18.x | AMD64, ARM64 |

The VSIX manifest intentionally targets `[17.0,19.0)` so the package supports Visual Studio 2022 and Visual Studio 2026 without claiming compatibility with future major versions that have not been tested.

This branch builds a lab VSIX with a separate extension identity and theme GUID from the public Marketplace package. It can be installed next to the public `Midnight Purple 2077 Theme` release for testing, and it appears in Visual Studio as `Midnight Purple 2077 VS2026 Lab`.

Visual Studio 2026 uses Fluent `Shell` and `ShellInternal` color tokens for IDE chrome surfaces such as the main window frame, command bars, tabs, buttons, status bar, and tool window headers. This lab build now uses the full 94-token `Shell` and 28-token `ShellInternal` palette, with corrected binary `.pkgdef` length headers.

## Install

Once published, install the theme from Visual Studio Marketplace.

For local testing, build the project and open:

```text
bin\Release\MidnightPurple2077Theme.vsix
```

Then restart Visual Studio and select the lab theme from:

```text
Tools > Theme > Midnight Purple 2077 VS2026 Lab
```

## Build

Requirements:

- Visual Studio 2022 or Visual Studio 2026
- Visual Studio extension development workload
- .NET Framework 4.7.2 targeting pack

Open `MidnightPurple2077Theme.sln` in Visual Studio, then build `Release`.

Command line:

```powershell
dotnet msbuild MidnightPurple2077Theme.csproj /restore /p:Configuration=Release /p:Platform=AnyCPU /p:DeployExtension=false
```

The packaged theme is created at:

```text
bin\Release\MidnightPurple2077Theme.vsix
```

## Regenerate VS2026 Shell Layer

After changing the VS2026 chrome palette, regenerate and validate the binary `.pkgdef` shell data:

```powershell
.\scripts\Update-VS2026ShellLayer.ps1
```

The script validates the generated categories before it exits:

```text
Shell            94  3091
ShellInternal    28  1008
```

## Publish From Terminal

Do not publish this lab branch to the public Marketplace listing. The `Publish-Marketplace.ps1` script refuses a real publish while the VSIX manifest contains `VS2026 Lab`.

Use the stable `master` branch for Marketplace updates. Once the VS2026 Lab package is tested locally, port the shell layer back to the public package, bump the public version, build, and publish from that stable branch.

For the stable branch, Visual Studio Marketplace can be updated from the command line with `VsixPublisher.exe`. Create a Visual Studio Marketplace/Azure DevOps PAT with Marketplace management permission, then run:

```powershell
.\scripts\Publish-Marketplace.ps1 -PersonalAccessToken "<PAT>"
```

The script clean-builds `Release`, finds `VsixPublisher.exe`, and publishes:

```text
bin\Release\MidnightPurple2077Theme.vsix
```

You can also login once and omit the PAT:

```powershell
VsixPublisher.exe login -publisherName "Marcelino-Jorge-Romero" -personalAccessToken "<PAT>"
.\scripts\Publish-Marketplace.ps1
```

To validate the build and command setup without publishing:

```powershell
.\scripts\Publish-Marketplace.ps1 -WhatIf
```

The command-line publish manifest uses the existing Marketplace internal name:

```text
Marcelino-Jorge-Romero.midnight-purple-2077-theme
```

Note: `VsixPublisher.exe` supports command-line categories such as `coding`, but not always the Marketplace UI's `Themes` category. If the Marketplace category changes after a CLI upload, restore `Themes` once from the web UI.

## Package Contents

The VSIX contains only the theme `.pkgdef`, marketplace icon, 200x200 preview image, license, and release notes. It does not include telemetry, network calls, commands, tool windows, or a runtime extension assembly. The `.pkgdef` carries the legacy Visual Studio color categories used by VS2022 plus the experimental VS2026 `Shell` and `ShellInternal` layer.

## Marketplace Notes

- Lab VSIX identity: `MidnightPurple2077Theme.VS2026Lab.8db7c767-3ded-4c92-befa-c40152c6ac12`
- Lab theme name: `Midnight Purple 2077 VS2026 Lab`
- Stable Marketplace publisher: `Marcelino-Jorge-Romero`
- GitHub repository owner: `marselino-george`
- Type: Tools
- Category: Theme
- Tags: `color-theme`, `dark-theme`, `cyberpunk`, `midnight-purple`, `visual-studio-theme`
- License: MIT, included as `LICENSE.txt`
- Version: update `source.extension.vsixmanifest`, `Properties/AssemblyInfo.cs`, `ReleaseNotes.txt`, and `CHANGELOG.md` together.

Recommended test flow:

1. Build `Release`.
2. Install the generated VSIX locally in Visual Studio 2026.
3. Confirm `Midnight Purple 2077 VS2026 Lab` appears under `Tools > Theme`.
4. Check the main menu, command bars, document tabs, status bar, and tool window headers.
5. If the lab package opens cleanly and looks right, port the shell layer to the stable Marketplace identity and bump the public release version.

## Release Notes

See [CHANGELOG.md](CHANGELOG.md).

## Credits

Original VS Code theme credit belongs to cyber samurai. This repository packages the converted Visual Studio theme as a VSIX.

## License

MIT. See [LICENSE.txt](LICENSE.txt).
