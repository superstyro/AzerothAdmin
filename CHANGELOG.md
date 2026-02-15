# AzerothAdmin Changelog

## -=[ Version 21 - 02/14/2026]=-

- FIX GO tab movement buttons (FWD, BACK, LEFT, RIGHT, UP, DOWN, HERE) failing due to undefined variables
- ADD mouse wheel support for Speed and Scale sliders on Main tab
- ADD mouse wheel support for Transparency sliders on Misc tab
- FIX Show/Unload button states on GO tab to reflect model database status
  - Show button displays "Load" when models are not loaded, switches to "Show" after loading
  - Unload button starts disabled and enables only after models are loaded
  - Unload now shows a confirmation dialog and reloads the UI to fully free memory
- CHANGE moved Obj Info button under Obj Target on GO tab
- ADD Clear Info button on GO tab to clear GUID, EntryID, Range, DisplayID and Phase fields
- ADD confirmation dialog when deleting a game object on GO tab
- CHANGE swapped Obj Add and Obj Del button positions on GO tab
- CHANGE moved ComeToMe button below Mov Random on NPC tab

- REPLACE Hover-mode with Spectator mode on Main tab
  - Replaced non-functional Hover-mode buttons with Spectator mode (.gm spectator on/off)
  - Added tooltip explaining usage and zone reload requirement

- REMOVE non-functional buttons from Main tab
  - Removed Acct Create, Acct Delete, and Acct Passwd buttons
  - Removed View All Maps, Show/Hide Maps, and Account Lock buttons
  - Reorganized remaining buttons to fill gaps

- ADD Acct Change button to Main tab
  - New button for .character changeaccount command

- ADD Clear Params button to Char and NPC tabs
  - Added Clear Params button inline with the Parameters input box on Char and NPC tabs
  - Repositioned existing Clear Params button on Main tab to match

- ADD Check Bags and Check Profession buttons to Char tab

- ADD Ban type dropdown to Char tab
  - Moved Ban, BanInfo, BanList, and UnBan buttons to their own column

- REORGANIZE Char tab layout
  - Moved Bank from Main tab to Char tab
  - Moved TeleName and TeleGroup buttons from Char tab to Tele tab
  - Removed Quest and Honor buttons
  - Removed Dismount button
  - Swapped Summon/Appear button positions for better flow
  - General column and row cleanup for a cleaner layout

- REORGANIZE Main tab layout
  - Swapped GM List and GM Notify button positions
  - Moved GMs InGame, GM List, TeleAdd, and TeleDel buttons into better positions

- FIX GridNavigate nil global error in grid navigation buttons

- FIX target change overwriting parameter box while typing
  - PLAYER_TARGET_CHANGED no longer overwrites the parameter input if the user is actively typing

- REMOVE Docs folder (no longer needed)

## -=[ Version 20 - 01/20/2026]=-

**NOTE:** Ace3 localization system automatically detects and uses your WoW client's language setting. No manual configuration needed - your language is set automatically in version 20 and newer.

- MIGRATE Complete Ace2 to Ace3 library migration
  - Removed deprecated Ace2 libraries from codebase
  - Added Ace3 libraries (Release r960) for modern WoW addon development
  - Migrated all core files to use Ace3 framework (Init.lua, AzerothAdmin.lua)
  - Migrated all command modules to Ace3 (Main.lua, Tele.lua, Char.lua, Ticket.lua, Misc.lua, Server.lua, NPC.lua, GO.lua)
  - Migrated all frame modules to Ace3 architecture
  - Migrated localization system to use AceLocale-3.0
  - Updated TOC file with Ace3 dependencies and new library structure
  - Ensures compatibility with modern addon ecosystem and better performance

- FIX Deprecated function usage for WoW 3.3.5 compatibility
  - Replaced deprecated 'this' references with proper self parameters in frame scripts
  - Replaced deprecated 'arg1' references with proper function parameters
  - Improved code quality and eliminated deprecation warnings
  - Affects multiple frame and command files

- FIX Killsomething function
  - Corrected function implementation to work properly with server commands
  - Fixed bugs preventing proper execution

- IMPROVE Ticket system UI and functionality
  - Enhanced ticket interface with better layout and organization
  - Improved ticket message display and handling
  - Better user experience for ticket management

- ADD Enhanced quest search functionality
  - Added new quest search window with improved interface
  - Added confirmation dialogs for quest operations to prevent accidental actions
  - Added new action buttons for better quest management workflow
  - Provides safer and more user-friendly quest search experience

- ADD Teleport confirmation and warnings
  - Added dialog warning system for teleport operations
  - Added confirmation option before executing teleports
  - Prevents accidental teleportation and improves safety

- ADD Server diff graph update controls
  - Added setting to control diff graph update frequency on Server tab
  - Added manual update button for on-demand diff graph refresh
  - Gives users control over performance vs real-time data trade-off
  - Settings properly organized on Server tab

- FIX Spell search learning functionality
  - Fixed spell learning from search window after Ace3 migration
  - Corrected LearnSpell function call to use proper AzerothAdminCommands namespace
  - Spell search results now properly execute learn commands when clicked

- FIX Character target name not populating on player select
  - Fixed PLAYER_TARGET_CHANGED handler not setting ma_charactertarget text field
  - Buttons relying on character name (Summon, Appear, Recall, etc.) now work correctly when a player is targeted
  - Commands were sending empty player name, causing server to return syntax help instead of executing

- IMPROVE Minimap button settings organization
  - Moved minimap button settings from Misc tab to appropriate location
  - Moved frame strata settings to Misc tab for better organization
  - Corrected minimap setting text in locale files
  - Improved overall settings layout and discoverability

## -=[ Version 19 - 12/28/2025]=-

- ADD Multi-language support system
  - Added comprehensive localization framework for all UI text
  - Created locale file structure in Locales/ directory with 11 language files
  - All hardcoded UI text now uses Locale["..."] reference system
  - Enables full translation of addon interface to multiple languages

- ADD Support for 10 additional languages
  - Spanish (Spain) - esES.lua
  - Spanish (Mexico) - esMX.lua
  - French - frFR.lua
  - German - deDE.lua
  - Italian - itIT.lua
  - Portuguese (Portugal) - ptPT.lua
  - Portuguese (Brazil) - ptBR.lua
  - Russian - ruRU.lua
  - Korean - koKR.lua
  - Chinese (Simplified) - zhCN.lua
  - Chinese (Traditional) - zhTW.lua
  - All languages ready for community translation contributions

- IMPROVE Locale system documentation
  - Added comprehensive README in Locales/ directory
  - Documented translation guidelines and special cases
  - Provided instructions for finding chat output strings in addon
  - Clarified which strings should and shouldn't be translated

- FIX Dynamic UI positioning for multi-language support
  - Updated fontstring positions to dynamically adjust for different locale text lengths
  - Fixed ticket tab text location and positioning for better locale compatibility
  - Improved alignment and spacing to accommodate varying text widths across languages

- IMPROVE Locale file maintenance
  - Removed unused ticket message string from all locale files
  - Cleaned up misleading comments from locale files
  - Removed extraneous lines and special case comments for cleaner code
  - Added missing local assignment for frame strata settings dropdown on MISC tab

- FIX Ticket multi-line message display
  - Improved ticket message text handling for proper multi-line display
  - Better formatting for long ticket messages

## -=[ Version 18 - 12/26/2025]=-

- REMOVE Log Tab feature
  - Purged entire Log Tab functionality from addon (deprecated/non-functional feature)
  - Removed LogAction tracking and storage across all command files
  - Cleaned up Commands files: removed LogAction() calls from Char.lua, Server.lua, Ticket.lua, NPC.lua, GO.lua, Tele.lua, Misc.lua, Main.lua, and Confirmation.lua
  - Removed Frames/Frames_SectionLog.lua and all log-related UI code
  - Removed log tab button and references from frame initialization
  - Space savings: Significantly reduced addon complexity and unused data storage

- REMOVE Who Tab feature
  - Removed entire Who Tab functionality including UI, buttons, and all associated functions
  - Deleted Commands/Who.lua (137 lines) and Frames/MangFrames_SectionWho.lua (729 lines)
  - Removed 33 locale strings and all who-related tooltips from enUS.lua
  - Removed who tab and mini menu buttons from UI
  - Cleaned up message parsing code for who-related server responses
  - Reduces addon size and complexity by removing unused/non-functional feature
  - Space savings: ~860+ lines of code removed

- ADD Server shutdown notification and cancel feature
  - Added shutdown status monitoring with countdown display
  - Shows real-time shutdown timer with time remaining
  - Added "Cancel Shutdown" button to abort scheduled shutdowns
  - Automatic status updates every second when shutdown is active
  - Provides clear visual feedback for shutdown state

- FIX Dropdown menus closing unexpectedly during server updates
  - Fixed race condition where OnUpdate handlers would close dropdown menus during periodic server information updates
  - Added dual-check for dropdown state (UIDROPDOWNMENU_OPEN_MENU and DropDownList1:IsShown())
  - Protected latency graph and server info/diff graph OnUpdate handlers from updating while dropdown is open
  - Fixes issue where first click would close dropdown, requiring second click to actually open it

- FIX Modify dropdown command syntax errors
  - Changed "modify tp" to "modify talentpoints" to match correct server command syntax
  - Fixed speed-related commands to use proper "modify speed" syntax:
    - All Speeds: "modify aspeed" → "modify speed all"
    - BackWalk: "modify bwalk" → "modify speed backwalk"
    - Fly Speed: "modify fly" → "modify speed fly"
    - Walk Speed: "modify speed" → "modify speed walk"
    - Swim Speed: "modify swim" → "modify speed swim"

- FIX Reload Table dropdown with invalid AzerothCore commands
  - Changed "trinity_string" to "acore_string" (correct AzerothCore command)
  - Split "game_graveyard_zone" into "game_graveyard" and "graveyard_zone" (separate commands)
  - Removed "gm_tickets" (not a valid reload command)
  - Removed "lfg_dungeon_encounters" (invalid, lfg_dungeon_rewards already exists)
  - All commands now match valid AzerothCore cs_reload.cpp commands

- CHANGE Modify and Reset dropdown default selections
  - Modify dropdown now defaults to "All Speeds" instead of "Level Up"
  - Reset dropdown now defaults to "Honor" instead of "Talents"
  - More logical defaults for common use cases

- ADD Comprehensive localization system for all UI text
  - Added 80+ new locale entries to enUS.lua organized by tab/section
  - Replaced all hardcoded display text with Locale["..."] references across 10 frame files
  - Covered all tabs: Misc, Tele, NPC, GameObject, Tickets, Server, Char, MiniMenu, and Popup frames
  - Preserved debug text and internal strings (not user-facing)
  - Enables easy multi-language support for future translations
  - Migrated additional hardcoded UI text to locale entries for chat output messages
  - Modified files: MangFrames_SectionMisc.lua, MangFrames_SectionTele.lua, MangFrames_SectionNpc.lua, MangFrames_SectionGO.lua, MangFrames_SectionTicket.lua, MangFrames_SectionServer.lua, MangFrames_SectionChar.lua, MangFrames_MiniMenu.lua, MangFrames_PopupFrames.lua

- ADD Localization for buttons without locale entries
  - Added locale entry for "Refresh" button with tooltip "Refresh server information"
  - Added locale entry for "Apply Weather" button
  - Ensures all user-facing buttons use consistent localization system

- IMPROVE UI text formatting and positioning
  - Updated string color schemes for better visibility
  - Corrected difftime format display (added missing 'ms' suffix)
  - Adjusted text positions for better alignment
  - Improved overall visual consistency
  - Added space to left side of GM tab to match other tabs

- IMPROVE Documentation
  - Enhanced README installation instructions
  - Updated GNU General Public License information and links
  - Fixed markdown formatting issues throughout documentation
  - Corrected addon derivation timeline for historical accuracy
  - Fixed various typos and improved layout

## -=[ Version 17 - 12/22/2025]=-

- FIX [[#51](https://github.com/superstyro/AzerothAdmin/issues/51)] Reset command not working on Char tab
  - Added player name parameter to reset command for proper targeting
  - Removed unused reset options (all spells, all talents, achievements) from dropdown menu
  - Reset functionality now works correctly with proper command syntax

- ADD [[#45](https://github.com/superstyro/AzerothAdmin/issues/45)] Expanded learn command options
  - Added new learn commands: All Crafts, All Default, All My Class, All My Pet Talents, All My Spells, All My Talents
  - Added individual profession recipe options (Alchemy, Blacksmithing, Cooking, Enchanting, Engineering, First Aid, Inscription, Jewelcrafting, Leatherworking, Tailoring)
  - Removed right-click unlearn functionality from Learn button
  - Changed default selection from "All GM Spells" to "All Crafts"
  - All dropdown entries are now in alphabetical order

- ADD [[#46](https://github.com/superstyro/AzerothAdmin/issues/46)] All GM Spells learning option
  - Added "All GM Spells" option to learn dropdown
  - Updated command from `.learn all_gm` to `.learn all gm` (correct syntax)
  - Renamed LearnLangDropDownInitialize to LearnDropDownInitialize
  - Removed individual language options, keeping only "All Languages"
  - Updated tooltip from "Learn selected langauge(s)" to "Learn selected spells" (fixed typo)

- FIX Dropdown menu selection and checkmark behavior
  - Fixed dropdown menus resetting to default values when clicked
  - Fixed checkmarks not updating to reflect current selection
  - Moved default value initialization out of initialize functions to prevent reset on dropdown open
  - Applied fix to all dropdowns: Learn, Modify, Reset, ReloadTable, Weather, NpcEmote, Language, and FrameStrata
  - Dropdown selections now persist across interactions

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
