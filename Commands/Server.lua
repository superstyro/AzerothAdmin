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

function Announce(value)
  AzerothAdmin:ChatMsg(".announce "..value)
end

function Shutdown(value)
  if value == "" then
    AzerothAdmin:Print("Please enter the time in seconds before using server shutdown.")
    return
  end

  local confirmMsg = "Are you sure you want to shut down the server in "..value.." seconds?"

  AzerothAdmin:ShowConfirmDialog(confirmMsg, function()
    Shutdown_Confirmed(value)
  end)
end

function Shutdown_Confirmed(value)
  AzerothAdmin:ChatMsg(".server shutdown "..value)
  -- Show the cancel button and hide the shutdown button
  ma_shutdownbutton:Hide()
  ma_cancelshutdownbutton:Show()
end

function CancelShutdown()
  AzerothAdmin:ChatMsg(".server shutdown cancel")
  -- Hide the cancel button and show the shutdown button
  ma_cancelshutdownbutton:Hide()
  ma_shutdownbutton:Show()
end

function ReloadTable(tablename)
  if tablename ~= "" then
    AzerothAdmin:ChatMsg(".reload "..tablename)
  end
end

function ReloadScripts()
  AzerothAdmin:ChatMsg(".reload smart_scripts")
end
