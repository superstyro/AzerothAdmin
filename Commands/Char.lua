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

function AzerothAdminCommands.ModelRotateLeft()
  ma_modelframe.rotation = ma_modelframe.rotation - 0.03
  ma_modelframe:SetRotation(ma_modelframe.rotation)
  PlaySound("igInventoryRotateCharacter")
end

function AzerothAdminCommands.ModelRotateRight()
  ma_modelframe.rotation = ma_modelframe.rotation + 0.03
  ma_modelframe:SetRotation(ma_modelframe.rotation)
  PlaySound("igInventoryRotateCharacter")
end

function AzerothAdminCommands.AzerothAdminModelOnUpdate(frame, elapsedTime)
  if ( ma_modelrotatelbutton:GetButtonState() == "PUSHED" ) then
    frame.rotation = frame.rotation + (elapsedTime * 2 * PI * ROTATIONS_PER_SECOND)
    if ( frame.rotation < 0 ) then
      frame.rotation = frame.rotation + (2 * PI)
    end
    frame:SetRotation(frame.rotation);
  end
  if ( ma_modelrotaterbutton:GetButtonState() == "PUSHED" ) then
    frame.rotation = frame.rotation - (elapsedTime * 2 * PI * ROTATIONS_PER_SECOND)
    if ( frame.rotation > (2 * PI) ) then
      frame.rotation = frame.rotation - (2 * PI)
    end
    frame:SetRotation(frame.rotation);
  end
end

function AzerothAdminCommands.InitModelFrame()
  ma_modelframe:SetScript("OnUpdate", function(self, elapsed) AzerothAdminCommands.AzerothAdminModelOnUpdate(self, elapsed) end)
  ma_modelframe.rotation = 0.61;
  ma_modelframe:SetRotation(ma_modelframe.rotation)
  ma_modelframe:SetUnit("player")

end

function AzerothAdminCommands.ModelChanged()
  if not AzerothAdmin:Selection("none") then
    ma_modelframe:SetUnit("target")
  else
    ma_modelframe:SetUnit("player")
  end
  ma_modelframe:RefreshUnit()
end

function AzerothAdminCommands.RevivePlayer()
  if AzerothAdmin:Selection("player") or AzerothAdmin:Selection("self") or AzerothAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".revive")
  else
    AzerothAdmin:Print(Locale["selectionerror1"])
  end
end

function AzerothAdminCommands.SavePlayer()
  if AzerothAdmin:Selection("player") or AzerothAdmin:Selection("self") or AzerothAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".save")
  else
    AzerothAdmin:Print(Locale["selectionerror1"])
  end
end

function AzerothAdminCommands.KickPlayer()
  if AzerothAdmin:Selection("player") or AzerothAdmin:Selection("self") or AzerothAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".kick")
  else
    AzerothAdmin:Print(Locale["selectionerror1"])
  end
end

function AzerothAdminCommands.Cooldown()
  if AzerothAdmin:Selection("player") or AzerothAdmin:Selection("self") or AzerothAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".cooldown")
  else
    AzerothAdmin:Print(Locale["selectionerror1"])
  end
end

function AzerothAdminCommands.ShowGUID()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".guid")
end

function AzerothAdminCommands.Pinfo()
  if AzerothAdmin:Selection("player") or AzerothAdmin:Selection("self") or AzerothAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".pinfo")
  else
    AzerothAdmin:Print(Locale["selectionerror1"])
  end
end

function AzerothAdminCommands.Distance()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".distance")
end

function AzerothAdminCommands.Recall()
  if AzerothAdmin:Selection("player") or AzerothAdmin:Selection("self") or AzerothAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".recall")
  else
    AzerothAdmin:Print(Locale["selectionerror1"])
  end
end

function AzerothAdminCommands.Demorph()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".morph reset")
end

function AzerothAdminCommands.GPS()
  if AzerothAdmin:Selection("player") or AzerothAdmin:Selection("self") or AzerothAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".gps")
  else
    AzerothAdmin:Print(Locale["selectionerror1"])
  end
end

function AzerothAdminCommands.LearnSpell(value, state)
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

function AzerothAdminCommands.Modify(case, value)
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

function AzerothAdminCommands.Reset(value)
  if AzerothAdmin:Selection("player") or AzerothAdmin:Selection("self") or AzerothAdmin:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".reset "..value.." "..player)
  else
    AzerothAdmin:Print(Locale["selectionerror1"])
  end
end

  -- LEARN LANG
function AzerothAdminCommands.LearnDropDownInitialize()
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
      info.func = function(self) UIDropDownMenu_SetSelectedValue(ma_learnlangdropdown, self.value) end
      info.checked = (UIDropDownMenu_GetSelectedValue(ma_learnlangdropdown) == v[2])
      info.icon = nil
      info.keepShownOnClick = nil
      UIDropDownMenu_AddButton(info, level)
    end
end

  -- MODIFY
function AzerothAdminCommands.ModifyDropDownInitialize()
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
      info.func = function(self) UIDropDownMenu_SetSelectedValue(ma_modifydropdown, self.value) end
      info.checked = (UIDropDownMenu_GetSelectedValue(ma_modifydropdown) == v[2])
      info.icon = nil
      info.keepShownOnClick = nil
      UIDropDownMenu_AddButton(info, level)
    end
end

  -- RESET
function AzerothAdminCommands.ResetDropDownInitialize()
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
      info.func = function(self) UIDropDownMenu_SetSelectedValue(ma_resetdropdown, self.value) end
      info.checked = (UIDropDownMenu_GetSelectedValue(ma_resetdropdown) == v[2])
      info.icon = nil
      info.keepShownOnClick = nil
      UIDropDownMenu_AddButton(info, level)
    end
end

function AzerothAdminCommands.CharModelZoomIn()
    ma_modelframe:SetCamera(0)
    --ma_modelframe:SetModelScale(ma_modelframe:GetModelScale() + .1)
    --ma_modelframe:SetPosition(1,ma_modelframe:GetModelScale()*3,0)
    --ma_modelframe:RefreshUnit()
end

function AzerothAdminCommands.CharModelZoomOut()
    ma_modelframe:SetCamera(1)
    ma_modelframe:RefreshUnit()
   -- ma_modelframe:SetCamera(2)
    --ma_modelframe:SetModelScale(ma_modelframe:GetModelScale() * .5)
    --ma_modelframe:SetPosition(0,0,0)
    --ma_modelframe:RefreshUnit()
end

function AzerothAdminCommands.CharBindSight()
    local cname = ma_charactertarget:GetText()
    AzerothAdmin:ChatMsg(".bindsight")
end

function AzerothAdminCommands.CharUnBindSight()
    local cname = ma_charactertarget:GetText()
    AzerothAdmin:ChatMsg(".unbindsight")
end

function AzerothAdminCommands.CharRename()
    local cname = ma_charactertarget:GetText()
    AzerothAdmin:ChatMsg(".character rename")
end

function AzerothAdminCommands.CharCustomize()
    local cname = ma_charactertarget:GetText()
    AzerothAdmin:ChatMsg(".character customize")
end

function AzerothAdminCommands.CharChangeRace()
    local cname = ma_charactertarget:GetText()
    AzerothAdmin:ChatMsg(".character changerace")
end

function AzerothAdminCommands.CharChangeFaction()
    local cname = ma_charactertarget:GetText()
    AzerothAdmin:ChatMsg(".character changefaction")
end

function AzerothAdminCommands.CharCombatStop()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".combatstop")
end

function AzerothAdminCommands.CharMaxSkill()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".maxskill")
end

function AzerothAdminCommands.CharFreeze()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".freeze")
end

function AzerothAdminCommands.CharUnFreeze()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".unfreeze")
end

function AzerothAdminCommands.CharListDeleted()
    local cname = ma_charactertarget:GetText()
    AzerothAdmin:ChatMsg(".character deleted list")
end

function AzerothAdminCommands.CharDeletedRestore()
    local cname = ma_charactertarget:GetText()
    AzerothAdmin:ChatMsg(".character deleted restore "..cname)
end

function AzerothAdminCommands.CharPossess()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".possess")
end

function AzerothAdminCommands.CharUnPossess()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".unpossess")
end

function AzerothAdminCommands.CharRecall()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".recall")
end

function AzerothAdminCommands.CharRepair()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".gear repair")
end

function AzerothAdminCommands.BanButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".ban "..cname)

end

function AzerothAdminCommands.GoNameButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".appear "..cname)

end

function AzerothAdminCommands.CreateGuildButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".guild create "..cname)

end

function AzerothAdminCommands.BanInfoButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".baninfo "..cname)

end

function AzerothAdminCommands.GroupGoButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".groupsummon "..cname)

end

function AzerothAdminCommands.GuildInviteButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".guild invite "..cname)

end

function AzerothAdminCommands.BanlistButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".banlist "..cname)

end

function AzerothAdminCommands.NameGoButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".summon "..cname)

end

function AzerothAdminCommands.GuildRankButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".guild rank "..cname)

end

function AzerothAdminCommands.TeleGroupButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".tele group "..cname)

end

function AzerothAdminCommands.UnBanButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".unban "..cname)

end

function AzerothAdminCommands.GuildDeleteButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".guild delete "..cname)

end

function AzerothAdminCommands.GuildUninviteButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".guild uninvite "..cname)

end

function AzerothAdminCommands.TeleNameButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".tele name "..cname)

end

function AzerothAdminCommands.MuteButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".mute "..cname)

end

function AzerothAdminCommands.CharMorphButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".modify morph "..cname)

end

function AzerothAdminCommands.CharAuraButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".aura "..cname)

end

function AzerothAdminCommands.CharUnAuraButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".unaura "..cname)

end

function AzerothAdminCommands.JailA()
    local cname = ma_charactertarget:GetText()
    AzerothAdmin:ChatMsg(".tele name "..cname.." ma_AllianceJail")
    AzerothAdmin:ChatMsg(".notify "..cname.." has been found guilty and jailed.")
end

function AzerothAdminCommands.JailH()
    local cname = ma_charactertarget:GetText()
    --self:ChatMsg("Selected "..cname)
    AzerothAdmin:ChatMsg(".tele name "..cname.." ma_HordeJail")
    AzerothAdmin:ChatMsg(".notify "..cname.." has been found guilty and jailed.")
end

function AzerothAdminCommands.UnJail()
    local cname = ma_charactertarget:GetText()
    AzerothAdmin:ChatMsg(".recall "..cname)
    AzerothAdmin:ChatMsg(".notify "..cname.." has been pardoned and released from jail.")
end

function AzerothAdminCommands.UnMuteButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".unmute "..cname)

end

function AzerothAdminCommands.DamageButton ()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".damage "..cname)

end

function AzerothAdminCommands.HideAreaButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".hidearea "..cname)
end

function AzerothAdminCommands.ShowAreaButton()
  local cname = ma_charactertarget:GetText()
  AzerothAdmin:ChatMsg(".showarea "..cname)
end

function AzerothAdminCommands.CharClearParams()
  ma_charactertarget:SetText("")
end
