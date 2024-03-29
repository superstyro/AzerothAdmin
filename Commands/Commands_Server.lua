﻿-------------------------------------------------------------------------------------------------------------
--
-- AzerothAdmin Version 3.x
-- AzerothAdmin is a derivative of TrinityAdmin/MangAdmin.
--
-- Copyright (C) 2022 Free Software Foundation, Inc.
-- License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
-- This is free software: you are free to change and redistribute it.
-- There is NO WARRANTY, to the extent permitted by law.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
--
-- Repository: https://gitlab.superstyro.com/superstyro/azerothadmin
-------------------------------------------------------------------------------------------------------------

function Announce(value)
  MangAdmin:ChatMsg(".announce "..value)
  MangAdmin:LogAction("Announced message: "..value)
end

function Shutdown(value)
  if value == "" then
    MangAdmin:ChatMsg(".server shutdown 0")
    MangAdmin:LogAction("Shut down server instantly.")
  else
    MangAdmin:ChatMsg(".server shutdown "..value)
    MangAdmin:LogAction("Shut down server in "..value.." seconds.")
  end
end

function ReloadTable(tablename)
  if not (tablename == "") then
    MangAdmin:ChatMsg(".reload "..tablename)
    if tablename == "all" then
      MangAdmin:LogAction("Reloaded all reloadable AzerothCore database tables.")
    else
      MangAdmin:LogAction("Reloaded the table "..tablename..".")
    end
  end
end

function ReloadScripts()
  MangAdmin:ChatMsg(".reload smart_scripts")
  MangAdmin:LogAction("Reload Smart Scripts.")
end