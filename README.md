# Midnight Purple 2077 Theme

A neon-purple dark theme for Visual Studio, inspired by Midnight Purple 2077 and tuned for late-night coding.

![Midnight Purple 2077 in Visual Studio](vspreview1.png)

## Compatibility

| Visual Studio | Version range | Architecture |
| --- | --- | --- |
| Visual Studio 2022 | 17.x | AMD64, ARM64 |
| Visual Studio 2026 | 18.x | AMD64, ARM64 |

The VSIX manifest intentionally targets `[17.0,19.0)` so the package supports Visual Studio 2022 and Visual Studio 2026 without claiming compatibility with future major versions that have not been tested.

## Install

Once published, install the theme from Visual Studio Marketplace.

For local testing, build the project and open:

```text
bin\Release\MidnightPurple2077Theme.vsix
```

Then restart Visual Studio and select the theme from:

```text
Tools > Theme > Midnight Purple 2077
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

## Package Contents

The VSIX contains only the theme `.pkgdef`, marketplace icon, 200x200 preview image, license, and release notes. It does not include telemetry, network calls, commands, tool windows, or a runtime extension assembly.

## Marketplace Notes

- Marketplace publisher: `Marcelino-Jorge-Romero`
- GitHub repository owner: `marselino-george`
- Type: Tools
- Category: Theme
- Tags: `color-theme`, `dark-theme`, `cyberpunk`, `midnight-purple`, `visual-studio-theme`
- License: MIT, included as `LICENSE.txt`
- Version: update `source.extension.vsixmanifest`, `Properties/AssemblyInfo.cs`, `ReleaseNotes.txt`, and `CHANGELOG.md` together.

Recommended publish flow:

1. Build `Release`.
2. Install the generated VSIX locally in Visual Studio 2022 and Visual Studio 2026.
3. Confirm the theme appears under `Tools > Theme`.
4. Upload `bin\Release\MidnightPurple2077Theme.vsix` to Visual Studio Marketplace.
5. Mark the listing public after the Marketplace preview looks correct.

## Release Notes

See [CHANGELOG.md](CHANGELOG.md).

## Credits

Original VS Code theme credit belongs to cyber samurai. This repository packages the converted Visual Studio theme as a VSIX.

## License

MIT. See [LICENSE.txt](LICENSE.txt).
