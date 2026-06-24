# Changelog

All notable changes to this project are documented here.

## 1.1.8 - 2026-06-25

- Added an experimental side-by-side `Midnight Purple 2077 VS2026 Lab` package with a separate VSIX identity and theme GUID so it can be tested without replacing the public `1.1.7` Marketplace theme.
- Restored the Visual Studio 2026 Fluent `Shell` and `ShellInternal` categories using the same 7-token `Shell` and 10-token `ShellInternal` shape used by VS2026 built-in tinted themes.
- Added `scripts/Update-VS2026ShellLayer.ps1` to generate the binary `.pkgdef` shell data and validate that each category length header matches the actual byte count.
- Kept the legacy Visual Studio 2022 theme categories intact for side-by-side comparison.

## 1.1.7 - 2026-06-25

- Removed the `Shell` and `ShellInternal` `.pkgdef` categories after VS2026 still failed to create its main window with the minimal Fluent shell token set from `1.1.6`.
- Kept the VS2026 install target and the existing VS2022-compatible legacy theme categories so the extension can be installed safely while the VS2026 chrome-color path is investigated separately.

## 1.1.6 - 2026-06-25

- Replaced the expanded Visual Studio 2026 Fluent shell token set from `1.1.5` with the official minimal dark-theme starter set.
- Appended the `Shell` and `ShellInternal` categories at the end of the `.pkgdef`, matching Microsoft's migration guidance and avoiding VS2026 startup/window creation failures.
- Kept the Visual Studio 2022 color categories unchanged.

## 1.1.5 - 2026-06-25

- Added Visual Studio 2026 Fluent `Shell` and `ShellInternal` color tokens for the IDE chrome, including menu/command bars, tabs, buttons, borders, and status bar colors.
- Kept the existing Visual Studio 2022 token set intact so the VS2022 appearance and install range remain compatible.

## 1.1.4 - 2026-06-24

- Changed the command-line publish manifest category from `tools` to `coding`, because `VsixPublisher.exe` rejects `tools` with `VsixPub0006`.
- Kept the Marketplace `Themes` category guidance for web UI correction after CLI upload.

## 1.1.3 - 2026-06-24

- Added `vs-publish.json` for Visual Studio Marketplace command-line publishing.
- Added `scripts/Publish-Marketplace.ps1` to build the VSIX and publish it with `VsixPublisher.exe`.
- Documented terminal publishing and the Marketplace category caveat for theme extensions.

## 1.1.2 - 2026-06-24

- Restored the VSIX publisher identity to `Marcelino Jorge Romero` so updates target the existing Visual Studio Marketplace listing.
- Kept GitHub repository ownership and commit identity under `marselino-george`.

## 1.1.1 - 2026-06-24

- Set the VSIX publisher identity and assembly company to `marselino-george`.
- Kept Visual Studio 2022 and Visual Studio 2026 compatibility from `1.1.0`.

## 1.1.0 - 2026-06-24

- Added explicit Visual Studio 2022 17.x and Visual Studio 2026 18.x support with `[17.0,19.0)` manifest ranges.
- Added AMD64 and ARM64 installation targets.
- Updated Visual Studio SDK and VSSDK BuildTools packages to the latest 17.x line to keep VS2022 compatibility while building cleanly with current MSBuild.
- Added a 200x200 Marketplace preview asset.
- Packaged local `LICENSE.txt` and `ReleaseNotes.txt` files into the VSIX.
- Cleaned up Marketplace tags, description, release notes, and README guidance.
- Removed the large screenshot from the VSIX payload while keeping it available for the public repository README.

## 1.0.0 - 2023-04-18

- Initial Visual Studio theme package.
