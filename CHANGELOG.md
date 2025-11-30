# AzerothAdmin Changelog

### -=[ Version 011 - 11/29/2025]=-
- ADD frame strata level configuration feature
  - New dropdown in MISC tab to control window layering (Background to Fullscreen Dialog)
  - Saved to account settings with default "MEDIUM" strata
  - Allows users to control whether addon windows appear above/below other UI elements
- ADD ElvUI-style dropdown styling system (Core/DropDownStyle.lua)
  - Modernized appearance for all dropdown menus
  - Consistent visual style across the addon
- IMPROVE dropdown positioning and sizing across all tabs
  - Adjusted widths for better text visibility
  - Fixed alignment issues in CHAR, NPC, MISC, and SERVER tabs
  - Repositioned elements to prevent overlapping
- FIX NPC emote dropdown initialization
  - Changed default selection from locale string to "0" (proper emote ID)
- UPDATE layout improvements in weather and language controls
  - Better spacing and alignment for cleaner UI
  - Repositioned "Apply Weather" button to top-right corner
- CHANGE Revision to Version in CHANGELOG to follow new versioning

### -=[ Version 10 - 11/27/2025]=-
- RESTRUCTURE addon to modular directory organization
  - Created new directory structure (Core, Data, Modules, Frames folders)
  - Moved data files (DBC.lua, Models.lua, TeleportTable.lua) to Data/
  - Moved core files to Core/ (AzerothAdmin.lua, Init.lua)
  - Moved MangLinkifier.lua to Modules/Linkifier.lua
  - Moved MangFrames.lua to Frames/
  - Renamed all Commands files to remove "Commands_" prefix
  - Updated AzerothAdmin.toc with new file paths and version 10
  - Removed reference to non-existent Commands_Log.lua from .toc
- FIX critical nil comparison crashes in server info OnUpdate handler
  - Added nil check for delayParam before comparison
  - Added nil check for diff value before using in graph
  - Prevents "attempt to compare number with nil" error spam
- FIX table iteration bug in favorites removal (Core/AzerothAdmin.lua)
  - Changed from pairs() with table.remove() to reverse iteration
  - Affects all 8 favorite categories (items, itemsets, spells, skills, quests, creatures, objects, teles)
- FIX incorrect string.gmatch usage in teleport filtering
  - Changed to string.find() which correctly returns nil when pattern not found
  - Fixes broken teleport message hiding logic

### -=[ Version 9 - 11/27/2025]=-
- FIX WoW 3.3.5 compatibility issues across multiple files
  - Replace deprecated `getglobal()` with `_G[]` notation
  - Replace deprecated `table.foreachi()` with `pairs()`
  - Replace deprecated `this` with `self` in OnShow scripts
  - Fix invalid SetScript OnVerticalScroll syntax
  - Fix `UnitGUID()` missing parameter
- REMOVE UTF-8 BOM characters from all Lua files
- ADD Commands_Confirmation.lua for confirmation dialog infrastructure
- ADD automated version management by reading from TOC file
- FIX texture name typos and inconsistencies across UI frames
- FIX gradient alpha inconsistencies in tab buttons
- FIX MiniMenu functionality with proper event handlers and click handlers
- FIX locale handling and parameter positioning in UI
- FIX teleport zone display with proper separator and improved logic
- FIX multiple typos in commands (StandState, NPC movement, taxi lookup)
- IMPROVE code quality with validation, error handling, and refactoring
- IMPROVE indentation consistency and remove redundant code
- UPDATE TOC file metadata for WoW 3.3.5 compatibility
- UPDATE locale strings for server reload buttons

### -=[ Version 8 - 12/23/2024]=-
- FIX [[#12](https://github.com/superstyro/AzerothAdmin/issues/12)]
- REMOVE FuBarPlugin
- Add Libs for future minimap rework

### -=[ Version 7 - 12/23/2024]=-
- FIX [#22](https://github.com/superstyro/AzerothAdmin/issues/22)
- ADD BuildFontStrings for 'Mean', 'Median', and 'Percentiles' in MangFrames_SectionServer.lua
- FIX string pattern for matching percentiles in strings.lua
  - ADD pattern to match '|- Percentiles (95, 99, max): 3ms, 4ms, 4ms'
- UPDATE CHANGELOG.md to follow addon Version number

### -=[ Version 6 - 12/15/2024]=-
- FIX duplicate `lfer_GOtargguid1` entry in strings.lua
- FIX duplicate `ma_Honor` entry in Locals\enUS.lua
- FIX parameter assignment issue in AceEvent-2.0.lua
  - Corrected the assignment of `once` and `method` parameters to avoid potential errors
- FIX #14 Update AzerothAdminLogOnUpdate function
  - Added handling for log scroll buttons in AzerothAdminLogOnUpdate function
- FIX #15 Update ticket message handling
  - Improved the logic for adding text to ticket messages in the database

### -=[ Version 5 - 5/04/2024]=-
- FIX #11 Hide WHO buttons
  - Cannot use level 4 account unless manually set in server console
- FIX #13 Correct server update frequency to be more accurate
- FIX #10 GM TAB Buttons
  - Disable Hover-mode buttons
  - Correct Taxicheat buttons function
  - Disable View All Maps (Could not find a replacment command, yet)
  - Correct Waterwalking buttons function
  - Disable AcctCreate button (Needs account level 4)
  - Disable AcctDelete button (Needs account level 4)
  - Correct Bank button function
- FIX #9 CHAR TAB Buttons/Functions
  - Correct demorph button function
  - Disable Show/Hide maps buttons (No command available)
  - Correct Repair button function
  - Correct GPS button function
  - Disable ListFreeze button (No command available)
  - Correct HonorUpdt button function (Output is in LOG tab)

### -=[ Version 4 - 4/29/2024]=-
- FIX [ADD] [ITEM] buttons
  - TODO: Correct [ADD] item count default to 1 in chat window

### -=[ Version 3 - 1/24/2022]=-
- Updated Copyright year 2022
- FIX Ticket TAB
  - Ticket Message text was black and difficult to read
  - Updated ticket list information to include 'Last change'
  - Changed Id to 'Ticket'
  - Added Created Label
  - Added Last Change Label
  - Lots off little things added.
  - I am bad at keeping this changelog updated.

### -=[ Version 2 - 10/20/2019]=-
- FIX GM tab
  - Typo in GM-mode on/off
  - Speed Slider: Affect all speeds

### -=[ Version 1 - 10/18/2019]=-
- FIX Server info tab
  - Updated strings to match AzerothCore
- FIX Diff Graph LUA error
- Update MiniMenu Icon
- Update Logo

### -=[ Version 0 - 10/18/2019]=-
- Initial Commit for AzerothAdmin (Ported from TrinityAdmin/MangAdmin)
- Version specific build AzerothCore 3.3.5
- Changed TrinityAdmin>AzerothAdmin
- Updated CREDITS.md
- Removed old Screenshots
- [TODO] Add New Screenshot Images
- [TODO] Update Logo Image
