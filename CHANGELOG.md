# AzerothAdmin Changelog

## -=[ Version 16 - 12/20/2025]=-

- IMPROVE Mail system with expanded slots and bug fixes
  - Expanded mail item slots from 7 to 12 in a 2x6 grid layout
  - Reduced slot size from 37x37 to 30x30 pixels for better fit
  - Centered item grid horizontally in bottom frame
  - Fixed bug where adding a single item incorrectly showed "Maximum 12 items" error
  - Corrected item count logic (WoW API doesn't provide stack count from cursor, defaults to 1)
  - Added 3-tab interface: "Send Mail", "Send Items", "Send Money"
  - Added ESC key support to remove focus from message editbox
  - Fixed UI element visibility to prevent mail-specific tabs showing in other popup types (Item/Spell/etc. searches)
  - Ensured "Favorites" tab text displays correctly for non-mail search popups

- FIX Language learning system
  - Reverted complex language learning implementation from PR #44
  - Fixed broken command: Changed `.learn all_lang` to `.learn all lang` (space instead of underscore)
  - Restored simple "All Languages" dropdown approach
  - Removed individual language entries from dropdown
  - Removed toggle-based Learn/Unlearn button logic
  - Removed language spell ID lookup table and detection code
  - Now uses correct server command syntax: `.learn all lang`

## -=[ Version 15 - 12/16/2025]=-

- IMPROVE NPC section UI and functionality
  - Fixed 'Get GUID' button to correctly populate GUID, NPC ID, and Display ID fields
  - Added labels for GUID, NPC ID, and Display ID text boxes for better clarity
  - Made all info boxes read-only (GUID, NPC ID, Display ID, Distance) to prevent manual editing
  - Updated pattern matching to work with actual server output format
    - GUID now captures Low value from server response
    - Entry ID pattern updated to match "Entry:" format
    - Display ID pattern simplified for compatibility
  - Added validation to Distance button (requires valid target)
  - Added validation to increment/decrement buttons (requires target and populated fields)
  - Replaced Distance label with Clear button to clear all NPC info fields
  - Added tooltip for Clear button functionality

## -=[ Version 14 - 12/06/2025]=-

- OPTIMIZE Memory usage with massive 74% reduction (7.5 MB → 1.9 MB)
  - Converted DBC.lua from 2,408 if-elseif chains to efficient hash table lookups
  - Improved map/zone name lookup performance from O(n) to O(1)
  - Moved Models.lua (100,000 model paths, 45,640 lines) to separate LoadOnDemand addon
  - Created AzerothAdmin_Models companion addon that loads only when needed
  - Added "Show" button in GO tab to load model database on-demand
  - Added "Unload" button in GO tab to free model memory without full reload
  - Changed model load messages from character speech to addon chat output
  - Memory savings: ~5.6 MB for users who don't use GameObject model viewer
  - GameObject model viewer functionality remains fully intact when loaded
- IMPROVE Data structure optimization
  - TeleportTable.lua already uses efficient continent-based lazy loading
  - Added optimization comments documenting memory-saving approaches
- IMPROVE Internationalization support
  - Refactored hardcoded tooltip strings to use locale system
  - Added 19 new locale entries for GameObject and Ticket tooltips
  - Standardized tooltip approach for better translation support

## -=[ Version 13 - 11/30/2025]=-

- FIX [[#36](https://github.com/superstyro/AzerothAdmin/issues/36)] Item set search and add commands
  - Changed item set lookup command from `.lookup itemset` to `.lookup item set`
  - Changed item set add command from `.additemset` to `.additem set`
  - Added Enter key press handler to search editbox to trigger search automatically
- FIX [[#34](https://github.com/superstyro/AzerothAdmin/issues/34)] ElvUI color picker compatibility
  - Added compatibility layer for ElvUI's ColorPickerFrame hooks
  - Created SetFormattedText method for ColorPicker child elements (ColorPPBoxR, ColorPPBoxG, ColorPPBoxB, etc.)
  - Color picker now works seamlessly with ElvUI without errors
  - RGB values display correctly and all sliders function properly

## -=[ Version 12 - 11/30/2025]=-

- ADD draggable mini menu functionality
  - Ctrl+drag to reposition mini menu anywhere on screen
  - Automatically snaps to left or right side of screen
  - Saves position to account settings
  - Position persists across sessions
- IMPROVE minimap button with LibDBIcon support
  - Added LibDBIcon-1.0 library integration for better minimap button management
  - Draggable minimap button (when using LibDBIcon)
  - Right-click minimap button to toggle mini menu
  - Shift-click minimap button to reload UI
  - Fallback to manual button if LibDBIcon not available
- ADD new UI settings checkboxes in MISC tab
  - Toggle transparency on/off with immediate visual feedback
  - Toggle localized search strings
  - Toggle mini menu visibility with instant show/hide
  - Toggle tooltips on/off
  - Toggle chat output on/off
  - All settings save immediately with user feedback messages
- ADD enhanced mini menu logo button functionality
  - Shift-click logo to reload UI
  - Ctrl+drag logo to move entire mini menu
  - Added tooltip with usage instructions
- ADD LibStub library to support future library integrations
- IMPROVE CHANGELOG formatting
  - Converted version headers to proper markdown (## format)
  - Better readability and parsing for automated tools

## -=[ Version 11 - 11/29/2025]=-

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

## -=[ Version 10 - 11/27/2025]=-

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

## -=[ Version 9 - 11/27/2025]=-

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

## -=[ Version 8 - 12/23/2024]=-

- FIX [[#12](https://github.com/superstyro/AzerothAdmin/issues/12)]
- REMOVE FuBarPlugin
- Add Libs for future minimap rework

## -=[ Version 7 - 12/23/2024]=-

- FIX [#22](https://github.com/superstyro/AzerothAdmin/issues/22)
- ADD BuildFontStrings for 'Mean', 'Median', and 'Percentiles' in MangFrames_SectionServer.lua
- FIX string pattern for matching percentiles in strings.lua
  - ADD pattern to match '|- Percentiles (95, 99, max): 3ms, 4ms, 4ms'
- UPDATE CHANGELOG.md to follow addon Version number

## -=[ Version 6 - 12/15/2024]=-

- FIX duplicate `lfer_GOtargguid1` entry in strings.lua
- FIX duplicate `ma_Honor` entry in Locals\enUS.lua
- FIX parameter assignment issue in AceEvent-2.0.lua
  - Corrected the assignment of `once` and `method` parameters to avoid potential errors
- FIX #14 Update AzerothAdminLogOnUpdate function
  - Added handling for log scroll buttons in AzerothAdminLogOnUpdate function
- FIX #15 Update ticket message handling
  - Improved the logic for adding text to ticket messages in the database

## -=[ Version 5 - 5/04/2024]=-

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

## -=[ Version 4 - 4/29/2024]=-

- FIX [ADD] [ITEM] buttons
  - TODO: Correct [ADD] item count default to 1 in chat window

## -=[ Version 3 - 1/24/2022]=-

- Updated Copyright year 2022
- FIX Ticket TAB
  - Ticket Message text was black and difficult to read
  - Updated ticket list information to include 'Last change'
  - Changed Id to 'Ticket'
  - Added Created Label
  - Added Last Change Label
  - Lots off little things added.
  - I am bad at keeping this changelog updated.

## -=[ Version 2 - 10/20/2019]=-

- FIX GM tab
  - Typo in GM-mode on/off
  - Speed Slider: Affect all speeds

## -=[ Version 1 - 10/18/2019]=-

- FIX Server info tab
  - Updated strings to match AzerothCore
- FIX Diff Graph LUA error
- Update MiniMenu Icon
- Update Logo

## -=[ Version 0 - 10/18/2019]=-

- Initial Commit for AzerothAdmin (Ported from TrinityAdmin/MangAdmin)
- Version specific build AzerothCore 3.3.5
- Changed TrinityAdmin>AzerothAdmin
- Updated CREDITS.md
- Removed old Screenshots
- [TODO] Add New Screenshot Images
- [TODO] Update Logo Image
