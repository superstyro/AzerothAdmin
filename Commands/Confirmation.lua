-------------------------------------------------------------------------------------------------------------
--
-- AzerothAdmin Version 3.x
-- AzerothAdmin is a derivative of TrinityAdmin/MangAdmin.
--
-- Copyright (C) 2007 Free Software Foundation, Inc.
-- License GPLv3+: GNU GPL version 3 or later <https://www.gnu.org/licenses/gpl-3.0.en.html>
-- This is free software: you are free to change and redistribute it.
-- There is NO WARRANTY, to the extent permitted by law.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
--
-- Repository: https://github.com/superstyro/AzerothAdmin
--
-------------------------------------------------------------------------------------------------------------

-- Confirmation dialog infrastructure for destructive operations
-- This provides a foundation for implementing confirmation dialogs for operations
-- such as account deletion, teleport location deletion, and map reveals.

AzerothAdminCommands = AzerothAdminCommands or {}

if not StaticPopupDialogs["AZEROTHADMIN_CONFIRM_DIALOG"] then
  StaticPopupDialogs["AZEROTHADMIN_CONFIRM_DIALOG"] = {
    text = "",
    button1 = "Confirm",
    button2 = "Cancel",
    OnAccept = function()
      -- This will be set dynamically when the dialog is shown
    end,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
    preferredIndex = 3,
  }
end

-- Helper function to show confirmation dialog
function AzerothAdmin:ShowConfirmDialog(message, onConfirmFunc)
  local dialog = StaticPopupDialogs["AZEROTHADMIN_CONFIRM_DIALOG"]
  dialog.text = message
  dialog.OnAccept = onConfirmFunc
  StaticPopup_Show("AZEROTHADMIN_CONFIRM_DIALOG")
end

-- Confirmed version of teleport location deletion (called after confirmation)
function AzerothAdminCommands.TeleDelButton_Confirmed()
  local cname = ma_parameter:GetText()
  if cname == "" then
    AzerothAdmin:Print("Error: Parameter cannot be empty")
    return
  end
  AzerothAdmin:ChatMsg(".tele del "..cname)
end

-- Confirmed version of account lock toggle (called after confirmation)
function AzerothAdminCommands.ToggleAccountlock_Confirmed(value)
  AzerothAdmin:ChatMsg(".account lock "..value)
end

-- Confirmed version of account creation (called after confirmation)
function AzerothAdminCommands.AcctCreate_Confirmed()
  local param = ma_parameter:GetText()
  if param == "" then
    AzerothAdmin:Print("Error: Parameter cannot be empty")
    return
  end
  AzerothAdmin:ChatMsg(".account create "..param)
end

-- NOTE: To enable confirmation dialogs, replace the direct function calls in Commands_Main.lua
-- with calls to AzerothAdmin:ShowConfirmDialog(). For example:
--
-- Instead of:
--   function AcctDelete()
--     local param = ma_parameter:GetText()
--     AzerothAdmin:ChatMsg(".account delete "..param)
--   end
--
-- Use:
--   function AcctDelete()
--     AzerothAdmin:ShowConfirmDialog("Delete account '"..ma_parameter:GetText().."'?", AcctDelete_Confirmed)
--   end
