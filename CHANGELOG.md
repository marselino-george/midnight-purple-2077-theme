# Changelog

All notable changes to this project are documented here.

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
