# _build Directory

This directory contains companion addons that are packaged together with AzerothAdmin in releases.

## AzerothAdmin_Models

**Size:** ~5.6 MB (45,640 lines)
**Type:** LoadOnDemand addon
**Purpose:** GameObject model database for the GO tab model viewer

### Why Separate?

Models.lua contains 100,000 model file paths and was the largest memory consumer in AzerothAdmin (consuming 5.6 MB at startup).

By moving it to a separate LoadOnDemand addon:
- Main addon memory reduced from 7.5 MB → 1.9 MB (74% reduction)
- Models only load when user clicks "Show Model" button in GO tab
- 99% of users who don't use the model viewer save 5.6 MB permanently
- Full functionality preserved when loaded

### Release Packaging

The GitHub Actions workflow (`../.github/workflows/release.yml`) automatically includes this addon in release zips:

```
AzerothAdmin-v14.zip
├── AzerothAdmin/         # Main addon (1.9 MB)
└── AzerothAdmin_Models/  # Model database (5.6 MB, LoadOnDemand)
```

Users extract one zip file and both addons are installed automatically.

### Updating Models

To update the Models.lua file:
1. Edit `_build/AzerothAdmin_Models/Models.lua`
2. Commit changes
3. Create release tag - workflow handles packaging automatically
