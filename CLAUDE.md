# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

AzerothAdmin is a World of Warcraft 3.3.5 (Wrath of the Lich King) addon for AzerothCore server administrators and Game Masters. It provides an in-game GUI for executing GM commands. Written entirely in Lua using the Ace3 addon framework.

## Build & Release

There is no traditional build system. This is a pure Lua addon loaded directly by the WoW client.

- **Release packaging:** Automated via `.github/workflows/release.yml`, triggered by pushing version tags (`v*`)
- **Release output:** ZIP containing two addons: `AzerothAdmin/` (main) and `AzerothAdmin_Models/` (on-demand model data from `_build/AzerothAdmin_Models/`)
- **Installation:** Extract ZIP to `World of Warcraft/Interface/AddOns/`
- **No tests:** Testing is done manually in-game on a 3.3.5 client

## Architecture

### Load Order (defined in AzerothAdmin.toc)

1. **Libraries** — Ace3 framework + FrameLib, Graph
2. **Locales** — 12 languages (enUS is the default/fallback)
3. **Commands** — Server command functions (Main, Tele, Char, Ticket, Misc, Server, NPC, GO)
4. **Data** — DBC constants, teleport locations
5. **Core** — Init.lua (button registration), AzerothAdmin.lua (main addon class), DropDownStyle
6. **Modules** — Linkifier (chat link parsing)
7. **Frames** — UI layout definitions, loaded last since they reference everything above

### Key Files

- **`Core/AzerothAdmin.lua`** — Main addon class (Ace3 addon), database defaults, event handlers, core logic (~3300 lines)
- **`Core/Init.lua`** — Registers all button scripts and control handlers
- **`Frames/Frames.lua`** — Orchestrates UI creation, calls all `Frames_Section*.lua` builders
- **`Commands/*.lua`** — Each file corresponds to a tab and contains functions that send server commands via chat
- **`Data/DBC.lua`** — Game database constants (items, spells, creatures)
- **`Data/TeleportTable.lua`** — Predefined teleport location database

### Core Patterns

- **Ace3 addon:** Created via `LibStub("AceAddon-3.0"):NewAddon("AzerothAdmin", "AceConsole-3.0", "AceEvent-3.0", "AceHook-3.0")`
- **Two locale namespaces:** `AzerothAdmin` (UI labels/tooltips) and `AzerothAdmin-Strings` (command strings/messages)
- **FrameLib:** Custom library wrapping WoW's `CreateFrame` API for cleaner frame definitions
- **Database:** AceDB-3.0 with `char` (per-character) and `profile` (account-wide) scopes. Saved as `AzerothAdminDb` / `AzerothAdminDbPerChar`
- **Models addon:** `Data/Models.lua` was moved to a separate LoadOnDemand addon (`_build/AzerothAdmin_Models/`) to save ~5.6 MB of memory

### UI Structure

The addon has 8 tabs, each with a matching `Frames/Frames_Section*.lua` (layout) and `Commands/*.lua` (logic): Main, Tele, Char, Ticket, Misc, Server, NPC, GO. There is also a Log tab (Frames only, no Commands file).

## Adding a New Command Button

Four steps (see `Docs/Adding.txt`):
1. Add localized tooltip and button text in `Locales/<locale>/<locale>.lua`
2. Write the command function in `Commands/<section>.lua`
3. Register the button, function, text, and tooltip in `Core/Init.lua`
4. Draw the button in `Frames/Frames_Section<section>.lua`

## Conventions

- **Locale strings** use two files per language: `<locale>.lua` (UI text) and `strings_<locale>.lua` (command strings). enUS is always the default fallback.
- **Backslash paths** in the `.toc` file — WoW requires backslash separators in `.toc` load lists.
- **Interface version** is `30300` (WoW 3.3.5). Do not change this.
- Commands are sent to the server by writing to the chat frame (e.g., `SendChatMessage(".gm on")`).
