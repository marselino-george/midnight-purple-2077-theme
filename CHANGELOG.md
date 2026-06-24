# Changelog

All notable changes to this project are documented here.

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
