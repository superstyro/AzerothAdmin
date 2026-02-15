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

function AzerothAdminCommands.DisplayAccountLevel()
  AzerothAdmin:ChatMsg(".account")
end

function AzerothAdminCommands.ToggleGMMode(value)
  AzerothAdmin:ChatMsg(".gm "..value)
  AzerothAdmin:ChatMsg(".gm chat "..value)
end

function AzerothAdminCommands.ToggleFlyMode(value)
  local player = UnitName("target") or UnitName("player")
  AzerothAdmin:ChatMsg(".gm fly "..value)
end

function AzerothAdminCommands.ToggleSpectatorMode(value)
  AzerothAdmin:ChatMsg(".gm spectator "..value)
end

function AzerothAdminCommands.ToggleWhisper(value)
  AzerothAdmin:ChatMsg(".whispers "..value)
end

function AzerothAdminCommands.ToggleVisible(value)
  AzerothAdmin:ChatMsg(".gm visible "..value)
  if value == "on" then
  else
  end
end

function AzerothAdminCommands.ToggleCheatTaxi(value)
  if AzerothAdmin:Selection("player") or AzerothAdmin:Selection("self") or AzerothAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".cheat taxi "..value) -- FIX 10
    if value == 1 then
    else
    end
  else
    AzerothAdmin:Print(Locale["selectionerror1"])
  end
end

function AzerothAdminCommands.KillSomething()
  local target = UnitName("target") or UnitName("player")
  AzerothAdmin:ChatMsg(".die")
end

function AzerothAdminCommands.InstantKill()
  AzerothAdmin.db.char.instantKillMode = ma_instantkillbutton:GetChecked()
end

function AzerothAdminCommands.ToggleInstantTeleport()
  AzerothAdmin.db.profile.instantTeleport = ma_instantteleportbutton:GetChecked()
end

function AzerothAdminCommands.SetSpeed()
  local value = string.format("%.1f", ma_speedslider:GetValue())
  if AzerothAdmin:Selection("player") or AzerothAdmin:Selection("self") or AzerothAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".mod speed all "..value)
  else
    AzerothAdmin:Print(Locale["selectionerror1"])
    ma_speedslider:SetValue(1)
  end
end

function AzerothAdminCommands.SetScale()
  local value = string.format("%.1f", ma_scaleslider:GetValue())
  if AzerothAdmin:Selection("player") or AzerothAdmin:Selection("self") or AzerothAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".modify scale "..value)
  else
    AzerothAdmin:Print(Locale["selectionerror1"])
    ma_scaleslider:SetValue(1)
  end
end

function AzerothAdminCommands.Screenie()
  UIParent:Hide()
  Screenshot()
  UIParent:Show()
end

function AzerothAdminCommands.ShowBank()
  AzerothAdmin:ChatMsg(".character check bank") -- FIX 10 Broken Bank button
end

function AzerothAdminCommands.DismountPlayer()
  if AzerothAdmin:Selection("player") or AzerothAdmin:Selection("self") or AzerothAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".dismount")
  else
    AzerothAdmin:Print(Locale["selectionerror1"])
  end
end

function AzerothAdminCommands.SetJail_A()
    AzerothAdmin:ChatMsg(".tele del ma_AllianceJail")
    AzerothAdmin:ChatMsg(".tele add ma_AllianceJail")
end

function AzerothAdminCommands.SetJail_H()
    AzerothAdmin:ChatMsg(".tele del ma_HordeJail")
    AzerothAdmin:ChatMsg(".tele add ma_HordeJail")
end

function AzerothAdminCommands.GridNavigate(x, y)
  local way = AzerothAdmin.db.char.nextGridWay
  if not x and not y then
    table.insert(AzerothAdmin.db.char.functionQueue, "GridNavigate")
    AzerothAdmin:ChatMsg(".gps")
  else
    local step = tonumber(ma_gridnavieditbox:GetText())
    if step then
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
    else
      AzerothAdmin:Print(Locale["numbererror"])
    end
  end
end

function AzerothAdminCommands.ToggleChat(value)
  AzerothAdmin:ChatMsg(".gm chat "..value)
end

function AzerothAdminCommands.ToggleWaterwalk(value)
  AzerothAdmin:ChatMsg(".cheat waterwalk "..value)
end

function AzerothAdminCommands.ToggleCheatCastTime(value)
  AzerothAdmin:ChatMsg(".cheat casttime "..value)
end

function AzerothAdminCommands.ToggleCheatCooldown(value)
  AzerothAdmin:ChatMsg(".cheat cooldown "..value)
end

function AzerothAdminCommands.ToggleCheatGod(value)
  AzerothAdmin:ChatMsg(".cheat god "..value)
end

function AzerothAdminCommands.ToggleCheatPower(value)
  AzerothAdmin:ChatMsg(".cheat power "..value)
end

function AzerothAdminCommands.CheatStatus()
  AzerothAdmin:ChatMsg(".cheat status")
end

function AzerothAdminCommands.ToggleAccountlock(value)
  local state = (value == "on") and "lock" or "unlock"
  local confirmMsg = string.format(Locale["msg_account_lock_confirm"] or "Are you sure you want to %s this account?", state)
  AzerothAdmin:ShowConfirmDialog(confirmMsg, function()
    AzerothAdminCommands.ToggleAccountlock_Confirmed(value)
  end)
end

function AzerothAdminCommands.GMInGame()
  AzerothAdmin:ChatMsg(".gm ingame")
end

function AzerothAdminCommands.GMList()
  AzerothAdmin:ChatMsg(".gm list")
end

function AzerothAdminCommands.PetCreate()
  AzerothAdmin:ChatMsg(".pet create")
end

function AzerothAdminCommands.PetLearn()
  local param = ma_parameter:GetText()
  if param == "" then
    AzerothAdmin:Print("Error: Parameter cannot be empty")
    return
  end
  AzerothAdmin:ChatMsg(".pet learn "..param)
end

function AzerothAdminCommands.PetUnLearn()
  local param = ma_parameter:GetText()
  if param == "" then
    AzerothAdmin:Print("Error: Parameter cannot be empty")
    return
  end
  AzerothAdmin:ChatMsg(".pet unlearn "..param)
end

function AzerothAdminCommands.PetTP()
  local param = ma_parameter:GetText()
  if param == "" then
    AzerothAdmin:Print("Error: Parameter cannot be empty")
    return
  end
  AzerothAdmin:ChatMsg(".pet tp "..param)
end

function AzerothAdminCommands.LookupTaxi()
  local param = ma_parameter:GetText()
  AzerothAdmin:ChatMsg(".lookup taxi "..param)
end

function AzerothAdminCommands.GoTaxiNode()
  local param = ma_parameter:GetText()
  AzerothAdmin:ChatMsg(".go taxinode "..param)
end

function AzerothAdminCommands.GoTrigger()
  local param = ma_parameter:GetText()
  AzerothAdmin:ChatMsg(".go trigger "..param)
end

function AzerothAdminCommands.GoXY()
  local param = ma_parameter:GetText()
  AzerothAdmin:ChatMsg(".go xy "..param)
end

function AzerothAdminCommands.GoXYZ()
  local param = ma_parameter:GetText()
  AzerothAdmin:ChatMsg(".go xyz "..param)
end

function AzerothAdminCommands.GoZoneXY()
  local param = ma_parameter:GetText()
  AzerothAdmin:ChatMsg(".go zonexy "..param)
end

function AzerothAdminCommands.LookupZone()
  local param = ma_parameter:GetText()
  AzerothAdmin:ChatMsg(".lookup area "..param)
end

function AzerothAdminCommands.Cast()
  local param = ma_parameter:GetText()
  AzerothAdmin:ChatMsg(".cast "..param)
end

function AzerothAdminCommands.CastBack()
  local param = ma_parameter:GetText()
  AzerothAdmin:ChatMsg(".cast back "..param)
end

function AzerothAdminCommands.CastDist()
  local param = ma_parameter:GetText()
  AzerothAdmin:ChatMsg(".cast dist "..param)
end

function AzerothAdminCommands.CastSelf()
  local param = ma_parameter:GetText()
  AzerothAdmin:ChatMsg(".cast self "..param)
end

function AzerothAdminCommands.CastTarget()
  local param = ma_parameter:GetText()
  AzerothAdmin:ChatMsg(".cast target "..param)
end

function AzerothAdminCommands.ListItem()
  local param = ma_parameter:GetText()
  AzerothAdmin:ChatMsg(".list item "..param)
end

function AzerothAdminCommands.GmClear()
  ma_parameter:SetText("")
end

function AzerothAdminCommands.AcctCreate()
  local param = ma_parameter:GetText()
  if param == "" then
    AzerothAdmin:Print("Error: Parameter cannot be empty")
    return
  end
  local confirmMsg = string.format(Locale["msg_acct_create_confirm"] or "Are you sure you want to create account '%s'?", param)
  AzerothAdmin:ShowConfirmDialog(confirmMsg, function()
    AzerothAdminCommands.AcctCreate_Confirmed()
  end)
end

function AzerothAdminCommands.AcctAddon()
  local param = ma_parameter:GetText()
  if param == "" then
    AzerothAdmin:Print("Error: Parameter cannot be empty")
    return
  end
  AzerothAdmin:ChatMsg(".account set addon "..param)
end

function AzerothAdminCommands.AcctGMLvl()
  local param = ma_parameter:GetText()
  if param == "" then
    AzerothAdmin:Print("Error: Parameter cannot be empty")
    return
  end
  AzerothAdmin:ChatMsg(".account set gmlevel "..param)
end

function AzerothAdminCommands.AcctPasswd()
  local param = ma_parameter:GetText()
  if param == "" then
    AzerothAdmin:Print("Error: Parameter cannot be empty")
    return
  end
  AzerothAdmin:ChatMsg(".account set password "..param)
end

function AzerothAdminCommands.AcctChange()
  local param = ma_parameter:GetText()
  if param == "" then
    AzerothAdmin:Print("Error: Parameter cannot be empty")
    return
  end
  AzerothAdmin:ChatMsg(".character changeaccount "..param)
end

function AzerothAdminCommands.GMNotify()
  local param = ma_parameter:GetText()
  if param == "" then
    AzerothAdmin:Print("Error: Parameter cannot be empty")
    return
  end
  AzerothAdmin:ChatMsg(".gmnotify "..param)
end

function AzerothAdminCommands.TeleAddButton()
  local cname = ma_parameter:GetText()
  if cname == "" then
    AzerothAdmin:Print("Error: Parameter cannot be empty")
    return
  end
  AzerothAdmin:ChatMsg(".tele add "..cname)

end

function AzerothAdminCommands.TeleDelButton()
  local cname = ma_parameter:GetText()
  if cname == "" then
    AzerothAdmin:Print("Error: Parameter cannot be empty")
    return
  end
  local confirmMsg = string.format(Locale["msg_tele_del_confirm"] or "Are you sure you want to delete teleport location '%s'?", cname)
  AzerothAdmin:ShowConfirmDialog(confirmMsg, function()
    AzerothAdminCommands.TeleDelButton_Confirmed()
  end)
end

function AzerothAdminCommands.ResetSpeed()
    ma_speedslider:SetValue(1)
    ma_speedsliderText:SetText("Speed: 1.0")
    AzerothAdmin:ChatMsg(".mod speed all 1")

end

function AzerothAdminCommands.ResetScale()
  ma_scaleslider:SetValue(1)
  ma_scalesliderText:SetText("Scale: 1.0")
  AzerothAdmin:ChatMsg(".mod scale 1")
end
