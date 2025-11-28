-------------------------------------------------------------------------------------------------------------
--
-- AzerothAdmin Version 3.x
-- AzerothAdmin is a derivative of TrinityAdmin/MangAdmin.
--
-- Copyright (C) 2024 Free Software Foundation, Inc.
-- License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
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

function DisplayAccountLevel()
  AzerothAdmin:ChatMsg(".account")
end

function ToggleGMMode(value)
  AzerothAdmin:ChatMsg(".gm "..value)
  AzerothAdmin:LogAction("Turned GM-mode to "..value..".")
  AzerothAdmin:ChatMsg(".gm chat "..value)
  AzerothAdmin:LogAction("Turned Gm-Chat to "..value..".")
end

function ToggleFlyMode(value)
  local player = UnitName("target") or UnitName("player")
  AzerothAdmin:ChatMsg(".gm fly "..value)
  AzerothAdmin:LogAction("Turned Fly-mode "..value.." for "..player..".")
end

function ToggleHoverMode(value)
  AzerothAdmin:ChatMsg("hover command not used "..value) --TODO: Change to another function.
  local status
  if value == 1 then
    status = "on"
  else
    status = "off"
  end
  AzerothAdmin:LogAction("Hover mode not an option "..status..".")
end

function ToggleWhisper(value)
  AzerothAdmin:ChatMsg(".whispers "..value)
  AzerothAdmin:LogAction("Turned accepting whispers to "..value..".")
end

function ToggleVisible(value)
  AzerothAdmin:ChatMsg(".gm visible "..value)
  if value == "on" then
    AzerothAdmin:LogAction("Turned you visible.")
  else
    AzerothAdmin:LogAction("Turned you invisible.")
  end
end

function ToggleCheatTaxi(value)
  if AzerothAdmin:Selection("player") or AzerothAdmin:Selection("self") or AzerothAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".cheat taxi "..value) -- FIX 10
    if value == 1 then
      AzerothAdmin:LogAction("Activated cheat taxi to "..player..".")
    else
      AzerothAdmin:LogAction("Disabled cheat taxi to "..player..".")
    end
  else
    AzerothAdmin:Print(Locale["selectionerror1"])
  end
end

function ToggleMaps(value) --TODO: Add confirm diaglog when attempting to perform action
  AzerothAdmin:ChatMsg(".explorecheat "..value)
  if value == 1 then
    AzerothAdmin:LogAction("Revealed all maps for selected player.")
  else
    AzerothAdmin:LogAction("Hide all unexplored maps for selected player.")
  end
end

function KillSomething()
  local target = UnitName("target") or UnitName("player")
  AzerothAdmin:ChatMsg(".die")
  AzerothAdmin:LogAction("Killed "..target..".")
end

function InstantKill()
  AzerothAdmin.db.char.instantKillMode = ma_instantkillbutton:GetChecked()
end

function SetSpeed()
  local value = string.format("%.1f", ma_speedslider:GetValue())
  if AzerothAdmin:Selection("player") or AzerothAdmin:Selection("self") or AzerothAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".mod speed all "..value)
    AzerothAdmin:LogAction("Set all speed of "..player.." to "..value..".")
  else
    AzerothAdmin:Print(Locale["selectionerror1"])
    ma_speedslider:SetValue(1)
  end
end

function SetScale()
  local value = string.format("%.1f", ma_scaleslider:GetValue())
  if AzerothAdmin:Selection("player") or AzerothAdmin:Selection("self") or AzerothAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".modify scale "..value)
    AzerothAdmin:LogAction("Set scale of "..player.." to "..value..".")
  else
    AzerothAdmin:Print(Locale["selectionerror1"])
    ma_scaleslider:SetValue(1)
  end
end

function Screenie()
  UIParent:Hide()
  Screenshot()
  UIParent:Show()
end

function ShowBank()
  AzerothAdmin:ChatMsg(".character check bank") -- FIX 10 Broken Bank button
end

function DismountPlayer()
  if AzerothAdmin:Selection("player") or AzerothAdmin:Selection("self") or AzerothAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".dismount")
    AzerothAdmin:LogAction("Dismounted player "..player..".")
  else
    AzerothAdmin:Print(Locale["selectionerror1"])
  end
end

function SetJail_A()
    AzerothAdmin:ChatMsg(".tele del ma_AllianceJail")
    AzerothAdmin:ChatMsg(".tele add ma_AllianceJail")
    AzerothAdmin:LogAction("Set location of Alliance Jail")
end

function SetJail_H()
    AzerothAdmin:ChatMsg(".tele del ma_HordeJail")
    AzerothAdmin:ChatMsg(".tele add ma_HordeJail")
    AzerothAdmin:LogAction("Set location of Horde Jail")
end

function GridNavigate(x, y)
  local way = AzerothAdmin.db.char.nextGridWay
  if not x and not y then
    table.insert(AzerothAdmin.db.char.functionQueue, "GridNavigate")
    AzerothAdmin:ChatMsg(".gps")
  else
    if pcall(function() return ma_gridnavieditbox:GetText() + 10 end) then
      local step = ma_gridnavieditbox:GetText()
      local newy
      local newx
      if way == "east" then  --East
        newy = y - step
        newx = x
      elseif way == "north" then --North
        newy = y
        newx = x + step
      elseif way == "south" then  --South
        newy = y
        newx = x - step
      else  --West
        newy = y + step
        newx = x
      end
      AzerothAdmin:ChatMsg(".go xy "..newx.." "..newy)
      AzerothAdmin:LogAction("Teleported to grid position: X: "..newx.." Y: "..newy)
    else
      AzerothAdmin:Print(Locale["numbererror"])
    end
  end
end

function ToggleChat(value)
  AzerothAdmin:ChatMsg(".gm chat "..value)
  AzerothAdmin:LogAction("Turned GM-Chat to "..value..".")
end

function ToggleWaterwalk(value)
  AzerothAdmin:ChatMsg(".cheat waterwalk "..value)
  AzerothAdmin:LogAction("Turned Waterwalk to "..value..".")
end

function ToggleAccountlock(value) --TODO: Add confirm diaglog when attempting to perform action
  AzerothAdmin:ChatMsg(".account lock "..value)
  AzerothAdmin:LogAction("Turned GM account lock to "..value..".")
end

function GMInGame()
  AzerothAdmin:ChatMsg(".gm ingame")
  AzerothAdmin:LogAction("Listed GMs in-game.")
end

function GMList()
  AzerothAdmin:ChatMsg(".gm list")
  AzerothAdmin:LogAction("Listed GM accounts.")
end

function PetCreate()
  AzerothAdmin:ChatMsg(".pet create")
  AzerothAdmin:LogAction("Created a pet.")
end

function PetLearn()
  local param = ma_parameter:GetText()
  if param == "" then
    AzerothAdmin:Print("Error: Parameter cannot be empty")
    return
  end
  AzerothAdmin:ChatMsg(".pet learn "..param)
  AzerothAdmin:LogAction("Taught pet spell "..param)
end

function PetUnLearn()
  local param = ma_parameter:GetText()
  if param == "" then
    AzerothAdmin:Print("Error: Parameter cannot be empty")
    return
  end
  AzerothAdmin:ChatMsg(".pet unlearn "..param)
  AzerothAdmin:LogAction("Un-taught pet spell "..param)
end

function PetTP()
  local param = ma_parameter:GetText()
  if param == "" then
    AzerothAdmin:Print("Error: Parameter cannot be empty")
    return
  end
  AzerothAdmin:ChatMsg(".pet tp "..param)
  AzerothAdmin:LogAction("Modified pet training points by "..param)
end

function LookupTaxi()
  local param = ma_parameter:GetText()
  AzerothAdmin:ChatMsg(".lookup taxi "..param)
  AzerothAdmin:LogAction("Looked up Taxinode "..param)
end

function GoTaxiNode()
  local param = ma_parameter:GetText()
  AzerothAdmin:ChatMsg(".go taxinode "..param)
  AzerothAdmin:LogAction("Teleported to TaxiNode "..param)
end

function GoTrigger()
  local param = ma_parameter:GetText()
  AzerothAdmin:ChatMsg(".go trigger "..param)
  AzerothAdmin:LogAction("Teleported to Trigger "..param)
end

function GoXY()
  local param = ma_parameter:GetText()
  AzerothAdmin:ChatMsg(".go xy "..param)
  AzerothAdmin:LogAction("Teleported to XY "..param)
end

function GoXYZ()
  local param = ma_parameter:GetText()
  AzerothAdmin:ChatMsg(".go xyz "..param)
  AzerothAdmin:LogAction("Teleported to XYZ "..param)
end

function GoZoneXY()
  local param = ma_parameter:GetText()
  AzerothAdmin:ChatMsg(".go zonexy "..param)
  AzerothAdmin:LogAction("Teleported to ZoneXY "..param)
end

function LookupZone()
  local param = ma_parameter:GetText()
  AzerothAdmin:ChatMsg(".lookup area "..param)
  AzerothAdmin:LogAction("Looked up Zone "..param)
end

function Cast()
  local param = ma_parameter:GetText()
  AzerothAdmin:ChatMsg(".cast "..param)
  AzerothAdmin:LogAction("Cast spell "..param)
end

function CastBack()
  local param = ma_parameter:GetText()
  AzerothAdmin:ChatMsg(".cast back "..param)
  AzerothAdmin:LogAction("Cast Back spell "..param)
end

function CastDist()
  local param = ma_parameter:GetText()
  AzerothAdmin:ChatMsg(".cast dist "..param)
  AzerothAdmin:LogAction("Cast Dist spell "..param)
end

function CastSelf()
  local param = ma_parameter:GetText()
  AzerothAdmin:ChatMsg(".cast self "..param)
  AzerothAdmin:LogAction("Cast Self spell "..param)
end

function CastTarget()
  local param = ma_parameter:GetText()
  AzerothAdmin:ChatMsg(".cast target "..param)
  AzerothAdmin:LogAction("Cast Target spell "..param)
end

function ListItem()
  local param = ma_parameter:GetText()
  AzerothAdmin:ChatMsg(".list item "..param)
  AzerothAdmin:LogAction("Listed Item "..param)
end

function GmClear()
  ma_parameter:SetText("")
end

function AcctCreate() --TODO: Add confirm diaglog when attempting to perform action
  local param = ma_parameter:GetText()
  if param == "" then
    AzerothAdmin:Print("Error: Parameter cannot be empty")
    return
  end
  AzerothAdmin:ChatMsg(".account create "..param)
  AzerothAdmin:LogAction("Created account: "..param)
end

function AcctDelete() --TODO: Add confirm diaglog when attempting to perform action
  local param = ma_parameter:GetText()
  if param == "" then
    AzerothAdmin:Print("Error: Parameter cannot be empty")
    return
  end
  AzerothAdmin:ChatMsg(".account delete "..param)
  AzerothAdmin:LogAction("Deleted account: "..param)
end

function AcctAddon()
  local param = ma_parameter:GetText()
  if param == "" then
    AzerothAdmin:Print("Error: Parameter cannot be empty")
    return
  end
  AzerothAdmin:ChatMsg(".account set addon "..param)
  AzerothAdmin:LogAction("Set account addon: "..param)
end

function AcctGMLvl()
  local param = ma_parameter:GetText()
  if param == "" then
    AzerothAdmin:Print("Error: Parameter cannot be empty")
    return
  end
  AzerothAdmin:ChatMsg(".account set gmlevel "..param)
  AzerothAdmin:LogAction("Set account gmlevel: "..param)
end

function AcctPasswd()
  local param = ma_parameter:GetText()
  if param == "" then
    AzerothAdmin:Print("Error: Parameter cannot be empty")
    return
  end
  AzerothAdmin:ChatMsg(".account set password "..param)
  AzerothAdmin:LogAction("Set account password: "..param)
end

function GMNotify()
  local param = ma_parameter:GetText()
  if param == "" then
    AzerothAdmin:Print("Error: Parameter cannot be empty")
    return
  end
  AzerothAdmin:ChatMsg(".gmnotify "..param)
  AzerothAdmin:LogAction("GM Notify: "..param)
end

function TeleAddButton()
  local cname = ma_parameter:GetText()
  if cname == "" then
    AzerothAdmin:Print("Error: Parameter cannot be empty")
    return
  end
  AzerothAdmin:ChatMsg(".tele add "..cname)
  AzerothAdmin:LogAction("Added .tele location: "..cname..".")

end

function TeleDelButton() --TODO: Add confirm diaglog when attempting to perform action
  local cname = ma_parameter:GetText()
  if cname == "" then
    AzerothAdmin:Print("Error: Parameter cannot be empty")
    return
  end
  AzerothAdmin:ChatMsg(".tele del "..cname)
  AzerothAdmin:LogAction("Deleted .tele location: "..cname..".")

end

function ResetSpeed()
    ma_speedslider:SetValue(1)
    ma_speedsliderText:SetText("Speed: 1.0")
    AzerothAdmin:ChatMsg(".mod speed all 1")

end

function ResetScale()
  ma_scaleslider:SetValue(1)
  ma_scalesliderText:SetText("Scale: 1.0")
  AzerothAdmin:ChatMsg(".mod scale 1")
end
