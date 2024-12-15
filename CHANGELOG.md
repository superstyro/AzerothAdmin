# AzerothAdmin Changelog

### -=[ Revision 06 - 12/15/2024]=-
- FIX duplicate `lfer_GOtargguid1` entry in strings.lua
- FIX duplicate `ma_Honor` entry in Locals\enUS.lua
- FIX parameter assignment issue in AceEvent-2.0.lua
  - Corrected the assignment of `once` and `method` parameters to avoid potential errors
- FIX #14 Update AzerothAdminLogOnUpdate function
  - Added handling for log scroll buttons in AzerothAdminLogOnUpdate function
- FIX #15 Update ticket message handling
  - Improved the logic for adding text to ticket messages in the database

### -=[ Revision 05 - 5/04/2024]=-
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

### -=[ Revision 04 - 4/29/2024]=-
- FIX [ADD] [ITEM] buttons
  - TODO: Correct [ADD] item count default to 1 in chat window

### -=[ Revision 03 - 1/24/2022]=-
- Updated Copyright year 2022
- FIX Ticket TAB
  - Ticket Message text was black and difficult to read
  - Updated ticket list information to include 'Last change'
  - Changed Id to 'Ticket'
  - Added Created Label
  - Added Last Change Label
  - Lots off little things added.
  - I am bad at keeping this changelog updated.

### -=[ Revision 02 - 10/20/2019]=-
- FIX GM tab
  - Typo in GM-mode on/off
  - Speed Slider: Affect all speeds

### -=[ Revision 01 - 10/18/2019]=-
- FIX Server info tab
  - Updated strings to match AzerothCore
- FIX Diff Graph LUA error
- Update MiniMenu Icon
- Update Logo

### -=[ Revision 01 - 10/18/2019]=-
- Initial Commit for AzerothAdmin (Ported from TrinityAdmin/MangAdmin)
- Version specific build AzerothCore 3.3.5
- Changed TrinityAdmin>AzerothAdmin
- Updated CREDITS.md
- Removed old Screenshots
- [TODO] Add New Screenshot Images
- [TODO] Update Logo Image
