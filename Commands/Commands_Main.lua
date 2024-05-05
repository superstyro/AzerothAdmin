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
  MangAdmin:ChatMsg(".account")
end

function ToggleGMMode(value)
  MangAdmin:ChatMsg(".gm "..value)
  MangAdmin:LogAction("Turned GM-mode to "..value..".")
  MangAdmin:ChatMsg(".gm chat "..value)
  MangAdmin:LogAction("Turned Gm-Chat to "..value..".")
end

function ToggleFlyMode(value)
  --if self:Selection("player") or self:Selection("self") or self:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".gm fly "..value)
    MangAdmin:LogAction("Turned Fly-mode "..value.." for "..player..".")
  --[[else
    self:Print(Locale["selectionerror1"])
  end]]
end

function ToggleHoverMode(value)
  MangAdmin:ChatMsg("hover command not used "..value) --TODO: Change to another function.
  local status
  if value == 1 then
    status = "on"
  else
    status = "off"
  end
  MangAdmin:LogAction("Hover mode not an option "..status..".")
end

function ToggleWhisper(value)
  MangAdmin:ChatMsg(".whispers "..value)
  MangAdmin:LogAction("Turned accepting whispers to "..value..".")
end

function ToggleVisible(value)
  MangAdmin:ChatMsg(".gm visible "..value)
  if value == "on" then
    MangAdmin:LogAction("Turned you visible.")
  else
    MangAdmin:LogAction("Turned you invisible.")
  end
end

function ToggleCheatTaxi(value)
  if MangAdmin:Selection("player") or MangAdmin:Selection("self") or MangAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".cheat taxi "..value) -- FIX 10
    if value == 1 then
      MangAdmin:LogAction("Activated cheat taxi to "..player..".")
    else
      MangAdmin:LogAction("Disabled cheat taxi to "..player..".")
    end
  else
    MangAdmin:Print(Locale["selectionerror1"])
  end
end

function ToggleMaps(value) --TODO: Add confirm diaglog when attempting to perform action
  MangAdmin:ChatMsg(".explorecheat "..value)
  if value == 1 then
    MangAdmin:LogAction("Revealed all maps for selected player.")
  else
    MangAdmin:LogAction("Hide all unexplored maps for selected player.")
  end
end

function KillSomething()
  local target = UnitName("target") or UnitName("player")
  MangAdmin:ChatMsg(".die")
  MangAdmin:LogAction("Killed "..target..".")
end

function InstantKill()
  MangAdmin.db.char.instantKillMode = ma_instantkillbutton:GetChecked()
end

function SetSpeed()
  local value = string.format("%.1f", ma_speedslider:GetValue())
  if MangAdmin:Selection("player") or MangAdmin:Selection("self") or MangAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    --self:ChatMsg(".modify speed "..value)
    --self:ChatMsg(".modify fly "..value)
    --self:ChatMsg(".modify swim "..value)
    MangAdmin:ChatMsg(".mod speed all "..value)
    MangAdmin:LogAction("Set all speed of "..player.." to "..value..".")
  else
    MangAdmin:Print(Locale["selectionerror1"])
    ma_speedslider:SetValue(1)
  end
end

function SetScale()
  local value = string.format("%.1f", ma_scaleslider:GetValue())
  if MangAdmin:Selection("player") or MangAdmin:Selection("self") or MangAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".modify scale "..value)
    MangAdmin:LogAction("Set scale of "..player.." to "..value..".")
  else
    MangAdmin:Print(Locale["selectionerror1"])
    ma_scaleslider:SetValue(1)
  end
end

function Screenie()
  UIParent:Hide()
  Screenshot()
  UIParent:Show()
end

function ShowBank()
  MangAdmin:ChatMsg(".bank")
end

function DismountPlayer()
  if MangAdmin:Selection("player") or MangAdmin:Selection("self") or MangAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".dismount")
    MangAdmin:LogAction("Dismounted player "..player..".")
  else
    MangAdmin:Print(Locale["selectionerror1"])
  end
end

function SetJail_A()
    MangAdmin:ChatMsg(".tele del ma_AllianceJail")
    local i = 1
    while i<100 do
        i=i+1
        MangAdmin:ChatMsg(".")
    end
    MangAdmin:ChatMsg(".tele add ma_AllianceJail")
    MangAdmin:LogAction("Set location of Alliance Jail")
end

function SetJail_H()
    MangAdmin:ChatMsg(".tele del ma_HordeJail")
    local i = 1
    while i<100 do
        i=i+1
        MangAdmin:ChatMsg(".")
    end
    MangAdmin:ChatMsg(".tele add ma_HordeJail")
    MangAdmin:LogAction("Set location of Horde Jail")
end

function GridNavigate(x, y)
  local way = MangAdmin.db.char.nextGridWay
  if not x and not y then
    table.insert(MangAdmin.db.char.functionQueue, "GridNavigate")
    MangAdmin:ChatMsg(".gps")
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
      else  --Wast
        newy = y + step
        newx = x
      end
      MangAdmin:ChatMsg(".go xy "..newx.." "..newy)
      MangAdmin:LogAction("Teleported to grid position: X: "..newx.." Y: "..newy)
    else
      MangAdmin:Print(Locale["numbererror"])
    end
  end
end

function ToggleChat(value)
  MangAdmin:ChatMsg(".gm chat "..value)
  MangAdmin:LogAction("Turned GM-Chat to "..value..".")
end

function ToggleWaterwalk(value)
  MangAdmin:ChatMsg(".cheat waterwalk "..value)
  MangAdmin:LogAction("Turned Waterwalk to "..value..".")
end

function ToggleAccountlock(value) --TODO: Add confirm diaglog when attempting to perform action
  MangAdmin:ChatMsg(".account lock "..value)
  MangAdmin:LogAction("Turned GM account lock to "..value..".")
end

function GMInGame()
  MangAdmin:ChatMsg(".gm ingame")
  MangAdmin:LogAction("Listed GMs in-game.")
end

function GMList()
  MangAdmin:ChatMsg(".gm list")
  MangAdmin:LogAction("Listed GM accounts.")
end

function PetCreate()
  MangAdmin:ChatMsg(".pet create")
  MangAdmin:LogAction("Created a pet.")
end

function PetLearn()
  local param = ma_parameter:GetText()
  MangAdmin:ChatMsg(".pet learn "..param)
  MangAdmin:LogAction("Taught pet spell "..param)
end

function PetUnLearn()
  local param = ma_parameter:GetText()
  MangAdmin:ChatMsg(".pet unlearn "..param)
  MangAdmin:LogAction("Un-taught pet spell "..param)
end

function PetTP()
  local param = ma_parameter:GetText()
  MangAdmin:ChatMsg(".pet tp "..param)
  MangAdmin:LogAction("Modified pet training points by "..param)
end

function LookupTaxi()
  local param = ma_parameter:GetText()
  MangAdmin:ChatMsg(".lookup taxi  "..param)
  MangAdmin:LogAction("Looked up Taxinode "..param)
end

function GoTaxiNode()
  local param = ma_parameter:GetText()
  MangAdmin:ChatMsg(".go taxinode "..param)
  MangAdmin:LogAction("Teleported to TaxiNode "..param)
end

function GoTrigger()
  local param = ma_parameter:GetText()
  MangAdmin:ChatMsg(".go trigger "..param)
  MangAdmin:LogAction("Teleported to Trigger "..param)
end

function GoXY()
  local param = ma_parameter:GetText()
  MangAdmin:ChatMsg(".go xy "..param)
  MangAdmin:LogAction("Teleported to XY "..param)
end

function GoXYZ()
  local param = ma_parameter:GetText()
  MangAdmin:ChatMsg(".go xyz "..param)
  MangAdmin:LogAction("Teleported to XYZ "..param)
end

function GoZoneXY()
  local param = ma_parameter:GetText()
  MangAdmin:ChatMsg(".go zonexy "..param)
  MangAdmin:LogAction("Teleported to ZoneXY "..param)
end

function LookupZone()
  local param = ma_parameter:GetText()
  MangAdmin:ChatMsg(".lookup area "..param)
  MangAdmin:LogAction("Looked up Zone "..param)
end

function Cast()
  local param = ma_parameter:GetText()
  MangAdmin:ChatMsg(".cast "..param)
  MangAdmin:LogAction("Cast spell "..param)
end

function CastBack()
  local param = ma_parameter:GetText()
  MangAdmin:ChatMsg(".cast back "..param)
  MangAdmin:LogAction("Cast Back spell "..param)
end

function CastDist()
  local param = ma_parameter:GetText()
  MangAdmin:ChatMsg(".cast dist "..param)
  MangAdmin:LogAction("Cast Dist spell "..param)
end

function CastSelf()
  local param = ma_parameter:GetText()
  MangAdmin:ChatMsg(".cast self "..param)
  MangAdmin:LogAction("Cast Self spell "..param)
end

function CastTarget()
  local param = ma_parameter:GetText()
  MangAdmin:ChatMsg(".cast target "..param)
  MangAdmin:LogAction("Cast Target spell "..param)
end

function ListItem()
  local param = ma_parameter:GetText()
  MangAdmin:ChatMsg(".list item "..param)
  MangAdmin:LogAction("Listed Item "..param)
end

function GmClear()
  ma_parameter:SetText("")
end

function AcctCreate() --TODO: Add confirm diaglog when attempting to perform action
  local param = ma_parameter:GetText()
  MangAdmin:ChatMsg(".account create "..param)
  MangAdmin:LogAction("Created account: "..param)
end

function AcctDelete() --TODO: Add confirm diaglog when attempting to perform action
  local param = ma_parameter:GetText()
  MangAdmin:ChatMsg(".account delete "..param)
  MangAdmin:LogAction("Deleted account: "..param)
end

function AcctAddon()
  local param = ma_parameter:GetText()
  MangAdmin:ChatMsg(".account set addon "..param)
  MangAdmin:LogAction("Set account addon: "..param)
end

function AcctGMLvl()
  local param = ma_parameter:GetText()
  MangAdmin:ChatMsg(".account set gmlevel "..param)
  MangAdmin:LogAction("Set account gmlevel: "..param)
end

function AcctPasswd()
  local param = ma_parameter:GetText()
  MangAdmin:ChatMsg(".account set password "..param)
  MangAdmin:LogAction("Set account password: "..param)
end

function GMNotify()
  local param = ma_parameter:GetText()
  MangAdmin:ChatMsg(".gmnotify "..param)
  MangAdmin:LogAction("GM Notify: "..param)
end

function TeleAddButton()
  local cname = ma_parameter:GetText()
  MangAdmin:ChatMsg(".tele add "..cname)
  MangAdmin:LogAction("Added .tele location: "..cname..".")

end

function TeleDelButton() --TODO: Add confirm diaglog when attempting to perform action
  local cname = ma_parameter:GetText()
  MangAdmin:ChatMsg(".tele del "..cname)
  MangAdmin:LogAction("Deleted .tele location: "..cname..".")

end

function ResetSpeed()
    ma_speedslider:SetValue(1)
    ma_speedsliderText:SetText("Speed: 1.0")
    MangAdmin:ChatMsg(".mod speed all 1")

end

function ResetScale()
  ma_scaleslider:SetValue(1)
  ma_scalesliderText:SetText("Scale: 1.0")
  MangAdmin:ChatMsg(".mod scale 1")
end
