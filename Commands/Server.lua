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
  AzerothAdmin:LogAction("Announced message: "..value)
end

function Shutdown(value)
  if value == "" then
    AzerothAdmin:ChatMsg(".server shutdown 0")
    AzerothAdmin:LogAction("Shut down server instantly.")
  else
    AzerothAdmin:ChatMsg(".server shutdown "..value)
    AzerothAdmin:LogAction("Shut down server in "..value.." seconds.")
  end
end

function ReloadTable(tablename)
  if tablename ~= "" then
    AzerothAdmin:ChatMsg(".reload "..tablename)
    if tablename == "all" then
      AzerothAdmin:LogAction("Reloaded all reloadable AzerothCore database tables.")
    else
      AzerothAdmin:LogAction("Reloaded the table "..tablename..".")
    end
  end
end

function ReloadScripts()
  AzerothAdmin:ChatMsg(".reload smart_scripts")
  AzerothAdmin:LogAction("Reload Smart Scripts.")
end
