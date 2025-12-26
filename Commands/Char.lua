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
  ma_modelframe:SetScript("OnUpdate", function() AzerothAdminModelOnUpdate(arg1) end)
  ma_modelframe.rotation = 0.61;
  ma_modelframe:SetRotation(ma_modelframe.rotation)
  ma_modelframe:SetUnit("player")

end

function AzerothAdminModelOnUpdate(elapsedTime)
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
  if not AzerothAdmin:Selection("none") then
    ma_modelframe:SetUnit("target")
  else
    ma_modelframe:SetUnit("player")
  end
  ma_modelframe:RefreshUnit()
end

function RevivePlayer()
  if AzerothAdmin:Selection("player") or AzerothAdmin:Selection("self") or AzerothAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".revive")
  else
    AzerothAdmin:Print(Locale["selectionerror1"])
  end
end

function SavePlayer()
  if AzerothAdmin:Selection("player") or AzerothAdmin:Selection("self") or AzerothAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".save")
  else
    AzerothAdmin:Print(Locale["selectionerror1"])
  end
end

function KickPlayer()
  if AzerothAdmin:Selection("player") or AzerothAdmin:Selection("self") or AzerothAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".kick")
  else
    AzerothAdmin:Print(Locale["selectionerror1"])
  end
end

function Cooldown()
  if AzerothAdmin:Selection("player") or AzerothAdmin:Selection("self") or AzerothAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".cooldown")
  else
    AzerothAdmin:Print(Locale["selectionerror1"])
  end
end

function ShowGUID()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".guid")
end

function Pinfo()
  if AzerothAdmin:Selection("player") or AzerothAdmin:Selection("self") or AzerothAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".pinfo")
  else
    AzerothAdmin:Print(Locale["selectionerror1"])
  end
end

function Distance()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".distance")
end

function Recall()
  if AzerothAdmin:Selection("player") or AzerothAdmin:Selection("self") or AzerothAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".recall")
  else
    AzerothAdmin:Print(Locale["selectionerror1"])
  end
end

function Demorph()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".morph reset")
end

function ToggleMapsChar(value)
  AzerothAdmin:ChatMsg(".explorecheat "..value)
end

function GPS()
  if AzerothAdmin:Selection("player") or AzerothAdmin:Selection("self") or AzerothAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".gps")
  else
    AzerothAdmin:Print(Locale["selectionerror1"])
  end
end

function LearnSpell(value, state)
  if AzerothAdmin:Selection("player") or AzerothAdmin:Selection("self") or AzerothAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    local class = UnitClass("target") or UnitClass("player")
    if type(value) == "string" then
      if value == "all" then
        AzerothAdmin:ChatMsg(".learn all")
      elseif value == "all_crafts" then
        AzerothAdmin:ChatMsg(".learn all crafts")
      elseif value == "all_default" then
        AzerothAdmin:ChatMsg(".learn all default")
      elseif value == "all_gm" then
        AzerothAdmin:ChatMsg(".learn all gm")
      elseif value == "all_lang" then
        AzerothAdmin:ChatMsg(".learn all lang")
      elseif value == "all_myclass" then
        AzerothAdmin:ChatMsg(".learn all my class")
      elseif value == "all_mypettalents" then
        AzerothAdmin:ChatMsg(".learn all my pettalents")
      elseif value == "all_myspells" then
        AzerothAdmin:ChatMsg(".learn all my spells")
      elseif value == "all_mytalents" then
        AzerothAdmin:ChatMsg(".learn all my talents")
      elseif value == "all_recipes_alchemy" then
        AzerothAdmin:ChatMsg(".learn all recipes alchemy")
      elseif value == "all_recipes_blacksmithing" then
        AzerothAdmin:ChatMsg(".learn all recipes blacksmithing")
      elseif value == "all_recipes_cooking" then
        AzerothAdmin:ChatMsg(".learn all recipes cooking")
      elseif value == "all_recipes_enchanting" then
        AzerothAdmin:ChatMsg(".learn all recipes enchanting")
      elseif value == "all_recipes_engineering" then
        AzerothAdmin:ChatMsg(".learn all recipes engineering")
      elseif value == "all_recipes_firstaid" then
        AzerothAdmin:ChatMsg(".learn all recipes firstaid")
      elseif value == "all_recipes_inscription" then
        AzerothAdmin:ChatMsg(".learn all recipes inscription")
      elseif value == "all_recipes_jewelcrafting" then
        AzerothAdmin:ChatMsg(".learn all recipes jewelcrafting")
      elseif value == "all_recipes_leatherworking" then
        AzerothAdmin:ChatMsg(".learn all recipes leatherworking")
      elseif value == "all_recipes_tailoring" then
        AzerothAdmin:ChatMsg(".learn all recipes tailoring")
      else
        AzerothAdmin:ChatMsg(".learn "..value)
      end
    elseif type(value) == "table" then
      for k,v in pairs(value) do
        AzerothAdmin:ChatMsg(".learn "..v)
      end
    end
  else
    AzerothAdmin:Print(Locale["selectionerror1"])
  end
end

function Modify(case, value)
  if AzerothAdmin:Selection("player") or AzerothAdmin:Selection("self") or AzerothAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    if case == "money" then
      AzerothAdmin:ChatMsg(".modify money "..value)
    elseif case == "levelup" then
      AzerothAdmin:ChatMsg(".levelup "..value)
    elseif case == "leveldown" then
      AzerothAdmin:ChatMsg(".levelup "..(-value))
    elseif case == "energy" then
      AzerothAdmin:ChatMsg(".modify energy "..value)
    elseif case == "rage" then
      AzerothAdmin:ChatMsg(".modify rage "..value)
    elseif case == "health" then
      AzerothAdmin:ChatMsg(".modify hp "..value)
    elseif case == "mana" then
      AzerothAdmin:ChatMsg(".modify mana "..value)
    elseif case == "aspeed" then
      AzerothAdmin:ChatMsg(".modify speed all "..value)
    elseif case == "arena" then
      AzerothAdmin:ChatMsg(".modify arena "..value)
    elseif case == "bwalk" then
      AzerothAdmin:ChatMsg(".modify speed backwalk "..value)
    elseif case == "drunk" then
      AzerothAdmin:ChatMsg(".modify drunk "..value)
    elseif case == "fly" then
      AzerothAdmin:ChatMsg(".modify speed fly "..value)
    elseif case == "gender" then
      AzerothAdmin:ChatMsg(".modify gender "..value)
    elseif case == "honor" then
      AzerothAdmin:ChatMsg(".modify honor "..value)
    elseif case == "mount" then
      AzerothAdmin:ChatMsg(".modify mount "..value)
    elseif case == "phase" then
      AzerothAdmin:ChatMsg(".modify phase "..value)
    elseif case == "runicpower" then
      AzerothAdmin:ChatMsg(".modify runicpower "..value)
    elseif case == "speed" then
      AzerothAdmin:ChatMsg(".modify speed walk "..value)
    elseif case == "standstate" then
      AzerothAdmin:ChatMsg(".modify standstate "..value)
    elseif case == "swim" then
      AzerothAdmin:ChatMsg(".modify speed swim "..value)
    elseif case == "tp" then
      AzerothAdmin:ChatMsg(".modify talentpoints "..value)
    end
  else
    AzerothAdmin:Print(Locale["selectionerror1"])
  end
end

function Reset(value)
  if AzerothAdmin:Selection("player") or AzerothAdmin:Selection("self") or AzerothAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".reset "..value.." "..player)
  else
    AzerothAdmin:Print(Locale["selectionerror1"])
  end
end

  -- LEARN LANG
function LearnDropDownInitialize()
    local level = 1
    local info = UIDropDownMenu_CreateInfo()
    local buttons = {
      {Locale["ma_AllCrafts"],"all_crafts"},
      {Locale["ma_AllDefault"],"all_default"},
      {Locale["ma_AllGMSpells"],"all_gm"},
      {Locale["ma_AllLang"],"all_lang"},
      {Locale["ma_AllMyClass"],"all_myclass"},
      {Locale["ma_AllMyPetTalents"],"all_mypettalents"},
      {Locale["ma_AllMySpells"],"all_myspells"},
      {Locale["ma_AllMyTalents"],"all_mytalents"},
      {Locale["ma_AllRecipesAlchemy"],"all_recipes_alchemy"},
      {Locale["ma_AllRecipesBlacksmithing"],"all_recipes_blacksmithing"},
      {Locale["ma_AllRecipesCooking"],"all_recipes_cooking"},
      {Locale["ma_AllRecipesEnchanting"],"all_recipes_enchanting"},
      {Locale["ma_AllRecipesEngineering"],"all_recipes_engineering"},
      {Locale["ma_AllRecipesFirstAid"],"all_recipes_firstaid"},
      {Locale["ma_AllRecipesInscription"],"all_recipes_inscription"},
      {Locale["ma_AllRecipesJewelcrafting"],"all_recipes_jewelcrafting"},
      {Locale["ma_AllRecipesLeatherworking"],"all_recipes_leatherworking"},
      {Locale["ma_AllRecipesTailoring"],"all_recipes_tailoring"}
    }
    for k,v in pairs(buttons) do
      info.text = v[1]
      info.value = v[2]
      info.func = function() UIDropDownMenu_SetSelectedValue(ma_learnlangdropdown, this.value) end
      info.checked = (UIDropDownMenu_GetSelectedValue(ma_learnlangdropdown) == v[2])
      info.icon = nil
      info.keepShownOnClick = nil
      UIDropDownMenu_AddButton(info, level)
    end
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
      {Locale["ma_StandState"],"standstate"},
      {Locale["ma_SwimSpeed"],"swim"},
      {Locale["ma_TalentPoints"],"tp"}
    }
    for k,v in pairs(buttons) do
      info.text = v[1]
      info.value = v[2]
      info.func = function() UIDropDownMenu_SetSelectedValue(ma_modifydropdown, this.value) end
      info.checked = (UIDropDownMenu_GetSelectedValue(ma_modifydropdown) == v[2])
      info.icon = nil
      info.keepShownOnClick = nil
      UIDropDownMenu_AddButton(info, level)
    end
end

  -- RESET
function ResetDropDownInitialize()
    local level = 1
    local info = UIDropDownMenu_CreateInfo()
    local buttons = {
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
      info.checked = (UIDropDownMenu_GetSelectedValue(ma_resetdropdown) == v[2])
      info.icon = nil
      info.keepShownOnClick = nil
      UIDropDownMenu_AddButton(info, level)
    end
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
    AzerothAdmin:ChatMsg(".bindsight")
end

function CharUnBindSight()
    local cname = ma_charactertarget:GetText()
    AzerothAdmin:ChatMsg(".unbindsight")
end

function CharRename()
    local cname = ma_charactertarget:GetText()
    AzerothAdmin:ChatMsg(".character rename")
end

function CharCustomize()
    local cname = ma_charactertarget:GetText()
    AzerothAdmin:ChatMsg(".character customize")
end

function CharChangeRace()
    local cname = ma_charactertarget:GetText()
    AzerothAdmin:ChatMsg(".character changerace")
end

function CharChangeFaction()
    local cname = ma_charactertarget:GetText()
    AzerothAdmin:ChatMsg(".character changefaction")
end

function CharCombatStop()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".combatstop")
end

function CharMaxSkill()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".maxskill")
end

function CharFreeze()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".freeze")
end

function CharUnFreeze()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".unfreeze")
end

function CharListDeleted()
    local cname = ma_charactertarget:GetText()
    AzerothAdmin:ChatMsg(".character deleted list")
end

function CharDeletedRestore()
    local cname = ma_charactertarget:GetText()
    AzerothAdmin:ChatMsg(".character deleted restore "..cname)
end

function CharPossess()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".possess")
end

function CharUnPossess()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".unpossess")
end

function CharRecall()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".recall")
end

function CharRepair()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".gear repair")
end

function BanButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".ban "..cname)

end

function GoNameButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".appear "..cname)

end

function CreateGuildButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".guild create "..cname)

end

function BanInfoButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".baninfo "..cname)

end

function GroupGoButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".groupsummon "..cname)

end

function GuildInviteButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".guild invite "..cname)

end

function BanlistButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".banlist "..cname)

end

function NameGoButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".summon "..cname)

end

function GuildRankButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".guild rank "..cname)

end

function TeleGroupButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".tele group "..cname)

end

function UnBanButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".unban "..cname)

end

function GuildDeleteButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".guild delete "..cname)

end

function GuildUninviteButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".guild uninvite "..cname)

end

function TeleNameButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".tele name "..cname)

end

function MuteButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".mute "..cname)

end

function CharMorphButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".modify morph "..cname)

end

function CharAuraButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".aura "..cname)

end

function CharUnAuraButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".unaura "..cname)

end

function JailA()
    local cname = ma_charactertarget:GetText()
    AzerothAdmin:ChatMsg(".tele name "..cname.." ma_AllianceJail")
    AzerothAdmin:ChatMsg(".notify "..cname.." has been found guilty and jailed.")
end

function JailH()
    local cname = ma_charactertarget:GetText()
    --self:ChatMsg("Selected "..cname)
    AzerothAdmin:ChatMsg(".tele name "..cname.." ma_HordeJail")
    AzerothAdmin:ChatMsg(".notify "..cname.." has been found guilty and jailed.")
end

function UnJail()
    local cname = ma_charactertarget:GetText()
    AzerothAdmin:ChatMsg(".recall "..cname)
    AzerothAdmin:ChatMsg(".notify "..cname.." has been pardoned and released from jail.")
end

function UnMuteButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".unmute "..cname)

end

function QuestAddButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".quest add "..cname)

end

function QuestCompleteButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".quest complete "..cname)

end

function QuestRemoveButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".quest remove "..cname)

end

function DamageButton ()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".damage "..cname)

end

function HideAreaButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".hidearea "..cname)
end

function ShowAreaButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".showarea "..cname)
end

function HonorAddButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".honor add "..cname)
end

function HonorUpdateButton()
  if AzerothAdmin:Selection("player") or AzerothAdmin:Selection("self") or AzerothAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".honor update ")
  else
    AzerothAdmin:Print(Locale["selectionerror1"])
  end
end
