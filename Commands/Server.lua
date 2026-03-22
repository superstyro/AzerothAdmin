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

AzerothAdminCommands = AzerothAdminCommands or {}

function AzerothAdminCommands.Announce(value)
  AzerothAdmin:ChatMsg(".announce "..value)
end

function AzerothAdminCommands.Restart(value)
  if value == "" then
    AzerothAdmin:Print(Locale["msg_restart_time_required"])
    return
  end

  local confirmMsg = string.format(Locale["msg_restart_confirm"], value)

  AzerothAdmin:ShowConfirmDialog(confirmMsg, function()
    AzerothAdminCommands.Restart_Confirmed(value)
  end)
end

function AzerothAdminCommands.Restart_Confirmed(value)
  AzerothAdmin:ChatMsg(".server restart "..value)
  ma_restartbutton:Disable()
  ma_shutdownbutton:Disable()
  ma_shutdowneditbox:ClearFocus()
  ma_shutdowneditbox:EnableMouse(false)
  ma_shutdowneditbox:EnableKeyboard(false)
  ma_cancelshutdownbutton:Show()
  AzerothAdmin.db.char.serverRestartState = "restart"
end

function AzerothAdminCommands.Shutdown(value)
  if value == "" then
    AzerothAdmin:Print(Locale["msg_shutdown_time_required"])
    return
  end

  local confirmMsg = string.format(Locale["msg_shutdown_confirm"], value)

  AzerothAdmin:ShowConfirmDialog(confirmMsg, function()
    AzerothAdminCommands.Shutdown_Confirmed(value)
  end)
end

function AzerothAdminCommands.Shutdown_Confirmed(value)
  AzerothAdmin:ChatMsg(".server shutdown "..value)
  ma_restartbutton:Disable()
  ma_shutdownbutton:Disable()
  ma_shutdowneditbox:ClearFocus()
  ma_shutdowneditbox:EnableMouse(false)
  ma_shutdowneditbox:EnableKeyboard(false)
  ma_cancelshutdownbutton:Show()
  AzerothAdmin.db.char.serverRestartState = "shutdown"
end

function AzerothAdminCommands.CancelShutdown()
  AzerothAdmin:ChatMsg(".server shutdown cancel")
  ma_cancelshutdownbutton:Hide()
  ma_restartbutton:Enable()
  ma_shutdownbutton:Enable()
  ma_shutdowneditbox:EnableMouse(true)
  ma_shutdowneditbox:EnableKeyboard(true)
  AzerothAdmin.db.char.serverRestartState = nil
end

function AzerothAdminCommands.ReloadTable(tablename)
  if tablename ~= "" then
    AzerothAdmin:ChatMsg(".reload "..tablename)
  end
end

function AzerothAdminCommands.ReloadScripts()
  AzerothAdmin:ChatMsg(".reload smart_scripts")
end
