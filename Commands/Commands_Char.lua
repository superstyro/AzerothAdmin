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
-- Repository: https://gitlab.superstyro.com/superstyro/azerothadmin
-------------------------------------------------------------------------------------------------------------

function ModelRotateLeft()
  ma_modelframe.rotation = ma_modelframe.rotation - 0.03
  ma_modelframe:SetRotation(ma_modelframe.rotation)
  PlaySound("igInventoryRotateCharacter")
end

function ModelRotateRight()
  ma_modelframe.rotation = ma_modelframe.rotation + 0.03
  ma_modelframe:SetRotation(ma_modelframe.rotation)
  PlaySound("igInventoryRotateCharacter")
end

function InitModelFrame()
  ma_modelframe:SetScript("OnUpdate", function() MangAdminModelOnUpdate(arg1) end)
  ma_modelframe.rotation = 0.61;
  ma_modelframe:SetRotation(ma_modelframe.rotation)
  ma_modelframe:SetUnit("player")

end

function MangAdminModelOnUpdate(elapsedTime)
  if ( ma_modelrotatelbutton:GetButtonState() == "PUSHED" ) then
    this.rotation = this.rotation + (elapsedTime * 2 * PI * ROTATIONS_PER_SECOND)
    if ( this.rotation < 0 ) then
      this.rotation = this.rotation + (2 * PI)
    end
    this:SetRotation(this.rotation);
  end
  if ( ma_modelrotaterbutton:GetButtonState() == "PUSHED" ) then
    this.rotation = this.rotation - (elapsedTime * 2 * PI * ROTATIONS_PER_SECOND)
    if ( this.rotation > (2 * PI) ) then
      this.rotation = this.rotation - (2 * PI)
    end
    this:SetRotation(this.rotation);
  end
end

function ModelChanged()
  if not MangAdmin:Selection("none") then
    ma_modelframe:SetUnit("target")
  else
    ma_modelframe:SetUnit("player")
  end
  ma_modelframe:RefreshUnit()
end

function RevivePlayer()
  if MangAdmin:Selection("player") or MangAdmin:Selection("self") or MangAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".revive")
    MangAdmin:LogAction("Revived player "..player..".")
  else
    MangAdmin:Print(Locale["selectionerror1"])
  end
end

function SavePlayer()
  if MangAdmin:Selection("player") or MangAdmin:Selection("self") or MangAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".save")
    MangAdmin:LogAction("Saved player "..player..".")
  else
    MangAdmin:Print(Locale["selectionerror1"])
  end
end

function KickPlayer()
  if MangAdmin:Selection("player") or MangAdmin:Selection("self") or MangAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".kick")
    MangAdmin:LogAction("Kicked player "..player..".")
  else
    MangAdmin:Print(Locale["selectionerror1"])
  end
end

function Cooldown()
  if MangAdmin:Selection("player") or MangAdmin:Selection("self") or MangAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".cooldown")
    MangAdmin:LogAction("Cooled player "..player..".")
  else
    MangAdmin:Print(Locale["selectionerror1"])
  end
end

function ShowGUID()
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".guid")
    MangAdmin:LogAction("Got GUID for player "..player..".")
end

function Pinfo()
  if MangAdmin:Selection("player") or MangAdmin:Selection("self") or MangAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".pinfo")
    MangAdmin:LogAction("Got Player Info for player "..player..".")
  else
    MangAdmin:Print(Locale["selectionerror1"])
  end
end

function Distance()
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".distance")
    MangAdmin:LogAction("Got distance to player "..player..".")
end

function Recall()
  if MangAdmin:Selection("player") or MangAdmin:Selection("self") or MangAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".recall")
    MangAdmin:LogAction("Recalled player "..player..".")
  else
    MangAdmin:Print(Locale["selectionerror1"])
  end
end

function Demorph()
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".morph reset")
    MangAdmin:LogAction("Demorphed player "..player..".")
end

function ToggleMapsChar(value)
  MangAdmin:ChatMsg(".explorecheat "..value)
  if value == 1 then
    MangAdmin:LogAction("Revealed all maps for selected player.")
  else
    MangAdmin:LogAction("Hide all unexplored maps for selected player.")
  end
end

function GPS()
  if MangAdmin:Selection("player") or MangAdmin:Selection("self") or MangAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".gps")
    MangAdmin:LogAction("Got GPS coordinates for player "..player..".")
  else
    MangAdmin:Print(Locale["selectionerror1"])
  end
end

function LearnSpell(value, state)
  if MangAdmin:Selection("player") or MangAdmin:Selection("self") or MangAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    local class = UnitClass("target") or UnitClass("player")
    local command = ".learn"
    local logcmd = "Learned"
    if state == "RightButton" then
      command = ".unlearn"
      logcmd = "Unlearned"
    end
    if type(value) == "string" then
      if value == "all" then
        MangAdmin:ChatMsg(command.." all")
        MangAdmin:LogAction(logcmd.." all spells to "..player..".")
      elseif value == "all_crafts" then
        MangAdmin:ChatMsg(command.." all_crafts")
        MangAdmin:LogAction(logcmd.." all professions and recipes to "..player..".")
      elseif value == "all_gm" then
        MangAdmin:ChatMsg(command.." all_gm")
        MangAdmin:LogAction(logcmd.." all default spells for Game Masters to "..player..".")
      elseif value == "all_lang" then
        MangAdmin:ChatMsg(command.." all_lang")
        MangAdmin:LogAction(logcmd.." all languages to "..player..".")
      elseif value == "all_myclass" then
        MangAdmin:ChatMsg(command.." all_myclass")
        MangAdmin:LogAction(logcmd.." all spells available to the "..class.."-class to "..player..".")
      else
        MangAdmin:ChatMsg(command.." "..value)
        MangAdmin:LogAction(logcmd.." spell "..value.." to "..player..".")
      end
    elseif type(value) == "table" then
      for k,v in pairs(value) do
        MangAdmin:ChatMsg(command.." "..v)
        MangAdmin:LogAction(logcmd.." spell "..v.." to "..player..".")
      end
    end
  else
    MangAdmin:Print(Locale["selectionerror1"])
  end
end

function Modify(case, value)
  if MangAdmin:Selection("player") or MangAdmin:Selection("self") or MangAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    if case == "money" then
      MangAdmin:ChatMsg(".modify money "..value)
      MangAdmin:LogAction("Give player "..player.." "..value.." copper).")
    elseif case == "levelup" then
      MangAdmin:ChatMsg(".levelup "..value)
      MangAdmin:LogAction("Leveled up player "..player.." by "..value.." levels.")
    elseif case == "leveldown" then
      MangAdmin:ChatMsg(".levelup "..value*(-1))
      MangAdmin:LogAction("Leveled down player "..player.." by "..value.." levels.")
    elseif case == "energy" then
      MangAdmin:ChatMsg(".modify energy "..value)
      MangAdmin:LogAction("Modified energy for "..player.." to "..value.." energy.")
    elseif case == "rage" then
      MangAdmin:ChatMsg(".modify rage "..value)
      MangAdmin:LogAction("Modified rage for "..player.." to "..value.." rage.")
    elseif case == "health" then
      MangAdmin:ChatMsg(".modify hp "..value)
      MangAdmin:LogAction("Modified hp for "..player.." to "..value.." healthpoints")
    elseif case == "mana" then
      MangAdmin:ChatMsg(".modify mana "..value)
      MangAdmin:LogAction("Modified mana for "..player.." to "..value.." mana")
    elseif case == "aspeed" then
      MangAdmin:ChatMsg(".modify aspeed "..value)
      MangAdmin:LogAction("Modified AllSpeeds for "..player.." to "..value.." mana")
    elseif case == "arena" then
      MangAdmin:ChatMsg(".modify arena "..value)
      MangAdmin:LogAction("Modified Arena Points for "..player.." to "..value.." mana")
    elseif case == "bwalk" then
      MangAdmin:ChatMsg(".modify bwalk "..value)
      MangAdmin:LogAction("Modified BackWalk for "..player.." to "..value.." mana")
    elseif case == "drunk" then
      MangAdmin:ChatMsg(".modify drunk "..value)
      MangAdmin:LogAction("Modified Drunk for "..player.." to "..value.." mana")
    elseif case == "fly" then
      MangAdmin:ChatMsg(".modify fly "..value)
      MangAdmin:LogAction("Modified FlySpeed for "..player.." to "..value.." mana")
    elseif case == "gender" then
      MangAdmin:ChatMsg(".modify gender "..value)
      MangAdmin:LogAction("Modified Gender for "..player.." to "..value.." mana")
    elseif case == "honor" then
      MangAdmin:ChatMsg(".modify honor "..value)
      MangAdmin:LogAction("Modified Honor for "..player.." to "..value.." mana")
    elseif case == "mount" then
      MangAdmin:ChatMsg(".modify mount "..value)
      MangAdmin:LogAction("Modified MountSpeed for "..player.." to "..value.." mana")
    elseif case == "phase" then
      MangAdmin:ChatMsg(".modify phase "..value)
      MangAdmin:LogAction("Modified Phase for "..player.." to "..value.." mana")
    elseif case == "runicpower" then
      MangAdmin:ChatMsg(".modify runicpower "..value)
      MangAdmin:LogAction("Modified RunicPower for "..player.." to "..value.." mana")
    elseif case == "speed" then
      MangAdmin:ChatMsg(".modify speed "..value)
      MangAdmin:LogAction("Modified Speed for "..player.." to "..value.." mana")
    elseif case == "standstate" then
      MangAdmin:ChatMsg(".modify standstate "..value)
      MangAdmin:LogAction("Modified StandState for "..player.." to "..value.." mana")
    elseif case == "swim" then
      MangAdmin:ChatMsg(".modify swim "..value)
      MangAdmin:LogAction("Modified SwimSpeed for "..player.." to "..value.." mana")
    elseif case == "tp" then
      MangAdmin:ChatMsg(".modify tp "..value)
      MangAdmin:LogAction("Modified TalentPoints for "..player.." to "..value.." mana")
    end
  else
    MangAdmin:Print(Locale["selectionerror1"])
  end
end

function Reset(value)
  if MangAdmin:Selection("player") or MangAdmin:Selection("self") or MangAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".reset "..value)
    MangAdmin:LogAction("Reset "..value.."' for player "..player..".")
  else
    MangAdmin:Print(Locale["selectionerror1"])
  end
end

  -- LEARN LANG
function LearnLangDropDownInitialize()
    local level = 1
    local info = UIDropDownMenu_CreateInfo()
    local buttons = {
      {Locale["ma_AllLang"],"all_lang"},
      {Locale["Common"],"668"},
      {Locale["Orcish"],"669"},
      {Locale["Taurahe"],"670"},
      {Locale["Darnassian"],"671"},
      {Locale["Dwarvish"],"672"},
      {Locale["Thalassian"],"813"},
      {Locale["Demonic"],"815"},
      {Locale["Draconic"],"814"},
      {Locale["Titan"],"816"},
      {Locale["Kalimag"],"817"},
      {Locale["Gnomish"],"7340"},
      {Locale["Troll"],"7341"},
      {Locale["Gutterspeak"],"17737"},
      {Locale["Draenei"],"29932"}
    }
    for k,v in pairs(buttons) do
      info.text = v[1]
      info.value = v[2]
      info.func = function() UIDropDownMenu_SetSelectedValue(ma_learnlangdropdown, this.value) end
      info.checked = nil
      info.icon = nil
      info.keepShownOnClick = nil
      UIDropDownMenu_AddButton(info, level)
    end
    UIDropDownMenu_SetSelectedValue(ma_learnlangdropdown, "all_lang")
end

  -- MODIFY
function ModifyDropDownInitialize()
    local level = 1
    local info = UIDropDownMenu_CreateInfo()
    local buttons = {
      {Locale["ma_AllSpeeds"],"aspeed"},
      {Locale["ma_Arena"],"arena"},
      {Locale["ma_BackWalk"],"bwalk"},
      {Locale["ma_Drunk"],"drunk"},
      {Locale["ma_Energy"],"energy"},
      {Locale["ma_FlySpeed"],"fly"},
      {Locale["ma_Gender"],"gender"},
      {Locale["ma_Healthpoints"],"health"},
      {Locale["ma_Honor"],"honor"},
      {Locale["ma_LevelUp"],"levelup"},
      {Locale["ma_LevelDown"],"leveldown"},
      {Locale["ma_Mana"],"mana"},
      {Locale["ma_Money"],"money"},
      {Locale["ma_MountSpeed"],"mount"},
      {Locale["ma_Phase"],"phase"},
      {Locale["ma_Rage"],"rage"},
      {Locale["ma_RunicPower"],"runicpower"},
      {Locale["ma_Speed"],"speed"},
      {Locale["ma_StandSate"],"standstate"},
      {Locale["ma_SwimSpeed"],"swim"},
      {Locale["ma_TalentPoints"],"tp"}
    }
    for k,v in pairs(buttons) do
      info.text = v[1]
      info.value = v[2]
      info.func = function() UIDropDownMenu_SetSelectedValue(ma_modifydropdown, this.value) end
      info.checked = nil
      info.icon = nil
      info.keepShownOnClick = nil
      UIDropDownMenu_AddButton(info, level)
    end
    UIDropDownMenu_SetSelectedValue(ma_modifydropdown, "levelup")
end

  -- RESET
function ResetDropDownInitialize()
    local level = 1
    local info = UIDropDownMenu_CreateInfo()
    local buttons = {
      {Locale["ma_resetallspells"],"all spells"},
      {Locale["ma_resetalltalents"],"all talents"},
      {Locale["ma_achievements"],"achievements"},
      {Locale["ma_Honor"],"honor"},
      {Locale["ma_Level"],"level"},
      {Locale["ma_Spells"],"spells"},
      {Locale["ma_Stats"],"stats"},
      {Locale["ma_Talents"],"talents"}
    }
    for k,v in pairs(buttons) do
      info.text = v[1]
      info.value = v[2]
      info.func = function() UIDropDownMenu_SetSelectedValue(ma_resetdropdown, this.value) end
      info.checked = nil
      info.icon = nil
      info.keepShownOnClick = nil
      UIDropDownMenu_AddButton(info, level)
    end
    UIDropDownMenu_SetSelectedValue(ma_resetdropdown, "talents")
end

function CharModelZoomIn()
    ma_modelframe:SetCamera(0)
    --ma_modelframe:SetModelScale(ma_modelframe:GetModelScale() + .1)
    --ma_modelframe:SetPosition(1,ma_modelframe:GetModelScale()*3,0)
    --ma_modelframe:RefreshUnit()
end

function CharModelZoomOut()
    ma_modelframe:SetCamera(1)
    ma_modelframe:RefreshUnit()
   -- ma_modelframe:SetCamera(2)
    --ma_modelframe:SetModelScale(ma_modelframe:GetModelScale() * .5)
    --ma_modelframe:SetPosition(0,0,0)
    --ma_modelframe:RefreshUnit()
end

function CharBindSight()
    local cname = ma_charactertarget:GetText()
    MangAdmin:ChatMsg(".bindsight")
    MangAdmin:LogAction("Sight bound to "..cname)
end

function CharUnBindSight()
    local cname = ma_charactertarget:GetText()
    MangAdmin:ChatMsg(".unbindsight")
    MangAdmin:LogAction("Sight unbound to "..cname)
end

function CharRename()
    local cname = ma_charactertarget:GetText()
    MangAdmin:ChatMsg(".character rename")
    MangAdmin:LogAction("Forced rename of "..cname)
end

function CharCustomize()
    local cname = ma_charactertarget:GetText()
    MangAdmin:ChatMsg(".character customize")
    MangAdmin:LogAction("Forced customization of "..cname)
end

function CharChangeRace()
    local cname = ma_charactertarget:GetText()
    MangAdmin:ChatMsg(".character changerace")
    MangAdmin:LogAction("Forced race change of "..cname)
end

function CharChangeFaction()
    local cname = ma_charactertarget:GetText()
    MangAdmin:ChatMsg(".character changefaction")
    MangAdmin:LogAction("Forced faction change of "..cname)
end

function CharCombatStop()
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".combatstop")
    MangAdmin:LogAction("Forced combat stop on "..player)
end

function CharMaxSkill()
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".maxskill")
    MangAdmin:LogAction("Set player MaxSkill for "..player)
end

function CharFreeze()
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".freeze")
    MangAdmin:LogAction("Set Freeze for "..player)
end

function CharUnFreeze()
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".unfreeze")
    MangAdmin:LogAction("UnFroze "..player)
end

function CharListFreeze()
    MangAdmin:ChatMsg(".listfreeze")
    MangAdmin:LogAction("Listed Frozen players")
end

function CharPossess()
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".possess")
    MangAdmin:LogAction("Possessed "..player)
end

function CharUnPossess()
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".unpossess")
    MangAdmin:LogAction("UnPossessed "..player)
end

function CharRecall()
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".recall")
    MangAdmin:LogAction("Recalled "..player)
end

function CharRepair()
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".gear repair")
    MangAdmin:LogAction("Repaired  "..player.."'s items")
end

--[[CHAR2 TAB Copy Over]]
function BanButton()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  MangAdmin:ChatMsg(".ban "..cname)
  MangAdmin:LogAction("Banned player: "..cname..".")

end

function GoNameButton()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  MangAdmin:ChatMsg(".appear "..cname)
  MangAdmin:LogAction("Teleported TO player: "..cname..".")

end

function CreateGuildButton()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  MangAdmin:ChatMsg(".guild create "..cname)
  MangAdmin:LogAction("Created Guild: "..cname..".")

end

function BanInfoButton()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  MangAdmin:ChatMsg(".baninfo "..cname)
  MangAdmin:LogAction("Listed .baninfo: "..cname..".")

end

function GroupGoButton()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  MangAdmin:ChatMsg(".groupsummon "..cname)
  MangAdmin:LogAction("Teleported "..cname.." and his/her group to me.")

end

function GuildInviteButton()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  MangAdmin:ChatMsg(".guild invite "..cname)
  MangAdmin:LogAction("Guild invitation: "..cname..".")

end

function BanlistButton()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  MangAdmin:ChatMsg(".banlist "..cname)
  MangAdmin:LogAction("Listed bans matching: "..cname..".")

end

function NameGoButton()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  MangAdmin:ChatMsg(".summon "..cname)
  MangAdmin:LogAction("Teleported "..cname.." TO me.")

end

function GuildRankButton()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  MangAdmin:ChatMsg(".guild rank "..cname)
  MangAdmin:LogAction("Guild rank change: "..cname..".")

end

function TeleGroupButton()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  MangAdmin:ChatMsg(".tele group "..cname)
  MangAdmin:LogAction("Group teleported: "..cname..".")

end

function UnBanButton()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  MangAdmin:ChatMsg(".unban "..cname)
  MangAdmin:LogAction("Unbanned "..cname..".")

end

function GuildDeleteButton()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  MangAdmin:ChatMsg(".guild delete "..cname)
  MangAdmin:LogAction("Deleted guild: "..cname..".")

end

function GuildUninviteButton()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  MangAdmin:ChatMsg(".guild uninvite "..cname)
  MangAdmin:LogAction("Removed from guild: "..cname..".")

end

function TeleNameButton()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
    self:ChatMsg(".tele name "..cname)
    self:LogAction("Teleported: "..cname..".")

end

function MuteButton()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  MangAdmin:ChatMsg(".mute "..cname)
  MangAdmin:LogAction("Muted "..cname..".")

end

function CharMorphButton()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  MangAdmin:ChatMsg(".modify morph "..cname)
  MangAdmin:LogAction(".modify morph "..cname..".")

end

function CharAuraButton()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  MangAdmin:ChatMsg(".aura "..cname)
  MangAdmin:LogAction(".aura "..cname..".")

end

function CharUnAuraButton()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  MangAdmin:ChatMsg(".unaura "..cname)
  MangAdmin:LogAction(".unaura "..cname..".")

end

function JailA()
    cname=ma_charactertarget:GetText()
    MangAdmin:ChatMsg(".tele name "..cname.." ma_AllianceJail")
    MangAdmin:LogAction("Jailed player "..cname..".")
    MangAdmin:ChatMsg(".notify "..cname.." has been found guilty and jailed.")
end

function JailH()
    cname=ma_charactertarget:GetText()
    --self:ChatMsg("Selected "..cname)
    MangAdmin:ChatMsg(".tele name "..cname.." ma_HordeJail")
    MangAdmin:LogAction("Jailed player "..cname..".")
    MangAdmin:ChatMsg(".notify "..cname.." has been found guilty and jailed.")
end

function UnJail()
    cname=ma_charactertarget:GetText()
    MangAdmin:ChatMsg(".recall "..cname)
    MangAdmin:LogAction("UnJailed player "..cname..".")
    MangAdmin:ChatMsg(".notify "..cname.." has been pardoned and released from jail.")
end

function UnMuteButton()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  MangAdmin:ChatMsg(".unmute "..cname)
  MangAdmin:LogAction(".unmute "..cname..".")

end

function QuestAddButton()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  MangAdmin:ChatMsg(".quest add "..cname)
  MangAdmin:LogAction(".quest add "..cname..".")

end

function QuestCompleteButton()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  MangAdmin:ChatMsg(".quest complete "..cname)
  MangAdmin:LogAction(".quest complete "..cname..".")

end

function QuestRemoveButton()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  MangAdmin:ChatMsg(".quest remove "..cname)
  MangAdmin:LogAction(".quest remove "..cname..".")

end

function DamageButton ()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  MangAdmin:ChatMsg(".damage "..cname)
  MangAdmin:LogAction(".damage "..cname..".")

end

function HideAreaButton()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  MangAdmin:ChatMsg(".hidearea "..cname)
  MangAdmin:LogAction(".hidearea "..cname..".")
end

function ShowAreaButton()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  MangAdmin:ChatMsg(".showarea "..cname)
  MangAdmin:LogAction(".showarea "..cname..".")
end

function HonorAddButton()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  MangAdmin:ChatMsg(".honor add "..cname)
  MangAdmin:LogAction("Honor add "..cname..".")
end

function HonorUpdateButton()
  if MangAdmin:Selection("player") or MangAdmin:Selection("self") or MangAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".honor update ")
    MangAdmin:LogAction("Honor updated for "..player..".")
  else
    MangAdmin:Print(Locale["selectionerror1"])
  end
end