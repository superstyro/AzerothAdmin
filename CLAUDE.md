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

### UI Grid Layout (Char Tab)

Buttons in `Frames/Frames_Section*.lua` are positioned using `offX` (column) and `offY` (row) offsets from `TOPLEFT` of `ma_midframe`. The Char tab uses this grid:

| Column   | offX |
|----------|------|
| ColOne   | 140  |
| ColTwo   | 222  |
| ColThree | 303  |
| ColFour  | 385  |
| ColFive  | 467  |
| ColSix   | 548  |
| ColSeven | 630  |

| Row      | offY |
|----------|------|
| RowOne   | -30  |
| RowTwo   | -52  |
| RowThree | -74  |
| RowFour  | -95  |
| RowFive  | -117 |
| RowSix   | -139 |
| RowSeven | -160 |
| RowEight | -182 |
| RowNine  | -204 |

Standard button size is 80x20. Columns 1-3 overlap with the player model area (bottom-left). The parameter box and clear button sit at `offY = -231`.

### Char Tab Button Map

Current button positions (Label = locale display text):

| Position     | Col1 (140)   | Col2 (222)   | Col3 (303)    | Col4 (385)  | Col5 (467)  | Col6 (548)  | Col7 (630)  |
|--------------|--------------|--------------|---------------|-------------|-------------|-------------|-------------|
| Row1 (-30)   | Kill         | Revive       | GPS           | Jail (A)    | Jail (H)    | UnJail      | Ban         |
| Row2 (-52)   | Show GUID    | PLAYER Info  | Distance      |             | Appear      | G Create    | BanInfo     |
| Row3 (-74)   | MaxSkill     | Repair       | CombatStop    |             | Recall      | G Invite    | BanList     |
| Row4 (-95)   | Kick         | BindSight    | UnBindSight   |             | Summon      | G Rank      | UnBan       |
| Row5 (-117)  | Cooldown     | Morph        | Demorph       |             | GroupSumn   | G UnInv     |             |
| Row6 (-139)  | Rename       | Aura         | UnAura        | Mute        | Bank        | G Delete    |             |
| Row7 (-160)  | Chng Faction | Freeze       | UnFreeze      | UnMute      | Dismount    |             |             |
| Row8 (-182)  | Chng Race    | Possess      | UnPossess     | Damage      |             |             |             |
| Row9 (-204)  | Customize    | ShowArea     | HideArea      | Save        |             |             |             |

Top bar (offY -1 to -4): LearnLang dropdown + Learn button, Reset dropdown + Reset button, Modify dropdown + EditBox + Modify button, Ban type dropdown.
Bottom bar (offY -231): Parameter label, EditBox (240x20), Clear button.

### UI Grid Layouts (Other Tabs)

Most tabs use free-form positioning rather than a strict grid. Key patterns:

- **Main Tab:** Left sidebar (offX 10-134) for GM toggles and display controls. Right columns (offX 333-660) for command buttons. Speed/Scale sliders at offX 205. No strict grid.
- **Tele Tab:** Three-column scroll list layout (offX 5/220/420) with FauxScrollFrames. Action buttons at offX 660. Vertical chaining with offY -2 gaps.
- **Ticket Tab:** Horizontal bottom button bar at offY -226 (offX 5-505 in 85px steps). Top area has scroll lists and detail panels.
- **Misc Tab:** Left-aligned settings column (offX 6-160) with checkboxes, sliders, color swatches. Dropdowns at TOPRIGHT/BOTTOMRIGHT.
- **Server Tab:** Left area with network graphs (offX 10, 170). Right sidebar buttons at TOPRIGHT. Bottom bar for announce/settings.
- **NPC Tab:** Uses same grid system as Char tab (same column/row offsets). Has model viewer at BOTTOMLEFT, emote dropdowns at top. ColFive is 498, ColSix is 585 (different from Char).
- **GO Tab:** Three zones — left controls (offX 5-105), center model (offX 182-262), right movement panel (offX 584-706). Free-form positioning throughout.

### Button Name-to-Label Mapping

Button frame names (e.g., `ma_namegobutton`) often do not match their visible UI labels (e.g., "Summon"). The source of truth for button labels is `Locales/enUS/enUS.lua`, where locale keys map to display text. When looking for a button by its visible label, search the locale file first, then trace the locale key back to the frame definition in `Frames_Section*.lua`.

Common non-obvious mappings:

- `ma_namegobutton` = "Summon" (`.summon` command)
- `ma_gonamebutton` = "Appear" (`.appear` command)
- `ma_groupgobutton` = "GroupSumn" (`.groupsummon` command)
- `ma_charchnagefaction` = "Chng Faction" (note: typo in key name is intentional/legacy)

### Button Enable/Disable Logic

Some buttons (Kill, Kick, Revive, Save) are dynamically enabled/disabled in `Core/AzerothAdmin.lua` via the `PLAYER_TARGET_CHANGED` event based on target state (alive/dead, player/NPC, self/other).

## Adding a New Command Button

Four steps:

1. Add localized tooltip and button text in `Locales/<locale>/<locale>.lua`
2. Write the command function in `Commands/<section>.lua`
3. Register the button, function, text, and tooltip in `Core/Init.lua`
4. Draw the button in `Frames/Frames_Section<section>.lua`

## Conventions

- **Locale strings** use two files per language: `<locale>.lua` (UI text) and `strings_<locale>.lua` (command strings). enUS is always the default fallback.
- **Backslash paths** in the `.toc` file — WoW requires backslash separators in `.toc` load lists.
- **Interface version** is `30300` (WoW 3.3.5). Do not change this.
- Commands are sent to the server by writing to the chat frame (e.g., `SendChatMessage(".gm on")`).

## Changelog Maintenance

Always update `CHANGELOG.md` before committing. Follow the existing format:

- Use category prefixes: ADD, REMOVE, FIX, IMPROVE, REPLACE, REORGANIZE, CHANGE, MIGRATE, OPTIMIZE
- Keep entries concise and user-facing — omit internal details like frame names, offX values, or file lists
- Group related changes into a single entry with sub-bullets only when needed for clarity
- Minor changes (typo fixes, internal cleanup) get a single line with no sub-bullets

A PreToolUse hook will block commits that don't include `CHANGELOG.md` changes.

## AzerothCore Command References

- **GM Commands:** <https://www.azerothcore.org/wiki/gm-commands>
- **Wiki Home:** <https://www.azerothcore.org/wiki/home>
