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

function InitModelFrameNPC()
  ma_npcmodelframe:SetScript("OnUpdate", function() AzerothAdminNpcModelOnUpdate(arg1) end)
  ma_npcmodelframe.rotation = 0.61;
  ma_npcmodelframe:SetRotation(ma_npcmodelframe.rotation)
  ma_npcmodelframe:SetUnit("player")

end

function NpcModelRotateLeft()
  ma_npcmodelframe.rotation = ma_npcmodelframe.rotation - 0.03
  ma_npcmodelframe:SetRotation(ma_npcmodelframe.rotation)
  PlaySound("igInventoryRotateCharacter")
end

function NpcModelRotateRight()
  ma_npcmodelframe.rotation = ma_npcmodelframe.rotation + 0.03
  ma_npcmodelframe:SetRotation(ma_npcmodelframe.rotation)
  PlaySound("igInventoryRotateCharacter")
end

function AzerothAdminNpcModelOnUpdate(elapsedTime)
  if ( ma_npcmodelrotatelbutton:GetButtonState() == "PUSHED" ) then
    this.rotation = this.rotation + (elapsedTime * 2 * PI * ROTATIONS_PER_SECOND)
    if ( this.rotation < 0 ) then
      this.rotation = this.rotation + (2 * PI)
    end
    this:SetRotation(this.rotation);
  end
  if ( ma_npcmodelrotaterbutton:GetButtonState() == "PUSHED" ) then
    this.rotation = this.rotation - (elapsedTime * 2 * PI * ROTATIONS_PER_SECOND)
    if ( this.rotation > (2 * PI) ) then
      this.rotation = this.rotation - (2 * PI)
    end
    this:SetRotation(this.rotation);
  end
end

function NpcModelChanged()
  if not AzerothAdmin:Selection("none") then
    ma_npcmodelframe:SetUnit("target")
  else
    ma_npcmodelframe:SetUnit("player")
  end
  ma_npcmodelframe:RefreshUnit()
end

function NPCKillSomething()
  local target = UnitName("target") or UnitName("player")
  AzerothAdmin:ChatMsg(".die")
end

function Respawn()
  AzerothAdmin:ChatMsg(".respawn")
end

function NPCDistance()
    -- Check if a target exists
    if UnitExists("target") then
        AzerothAdmin:ID_Setting_Start_Write(1)
        local player = UnitName("target") or UnitName("player")
        AzerothAdmin:ChatMsg(".distance")
    else
        print("Target NPC to use distance command")
    end
end

function NPCShowGUID()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".guid")
end

function NPCInfo()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".npc info")
end

function NPCDemorph()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".demorph")
end


function NPCMove()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".npc move")
end



function NPCDel()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".npc del")
end

function NPC_GUID_Get()
	AzerothAdmin:ID_Setting_Start_Write(1)
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".npc info")
end

function NPC_Add()
    local player = UnitName("target") or UnitName("player")
    local npc = ma_NPC_idbutton:GetText()
    AzerothAdmin:ChatMsg(".npc add "..npc)
end

function NPCGo()
    local player = UnitName("target") or UnitName("player")
    local npc =	ma_NPC_guidbutton:GetText()
    AzerothAdmin:ChatMsg(".go creature "..npc)
end

function NPCMorph()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  AzerothAdmin:ChatMsg(".modify morph "..npccname)
end

function NPCSay()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  AzerothAdmin:ChatMsg(".npc say "..npccname)
end

function NPCYell()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  AzerothAdmin:ChatMsg(".npc yell "..npccname)
end

function NPCAura()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  AzerothAdmin:ChatMsg(".aura "..npccname)
end

function NPCUnaura()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  AzerothAdmin:ChatMsg(".unaura "..npccname)
end

function NpcEmote(emote)
    AzerothAdmin:ChatMsg(".npc playemote "..emote)
end

function NPCBindSight()
    local npccname = ma_npccharactertarget:GetText()
    AzerothAdmin:ChatMsg(".bindsight")
end

function NPCUnBindSight()
    local npccname = ma_npccharactertarget:GetText()
    AzerothAdmin:ChatMsg(".unbindsight")
end

function NPCComeToMe()
    local npccname = ma_npccharactertarget:GetText()
    AzerothAdmin:ChatMsg(".cometome 1")

end

function DisplayUP()
    -- Check if display ID exists
    local guid = ma_NPC_guidbutton:GetText()
    local displayid = ma_npcdisplayid:GetText()

    if UnitExists("target") and guid ~= "" and displayid ~= "" then
        local currentid = ma_npcdisplayid:GetText()
        currentid = currentid + 1
        ma_npcdisplayid:SetText(currentid)
        AzerothAdmin:ChatMsg(".npc set model "..currentid)
    else
        print("Target NPC and use 'Get GUID' first")
    end
end

function DisplayDown()
    -- Check if display ID exists
    local guid = ma_NPC_guidbutton:GetText()
    local displayid = ma_npcdisplayid:GetText()

    if UnitExists("target") and guid ~= "" and displayid ~= "" then
        local currentid = ma_npcdisplayid:GetText()
        currentid = currentid - 1
        ma_npcdisplayid:SetText(currentid)
        AzerothAdmin:ChatMsg(".npc set model "..currentid)
    else
        print("Target NPC and use 'Get GUID' first")
    end
end

function ID_UP()
    -- Check if ID exists
    local guid = ma_NPC_guidbutton:GetText()
    local npcid = ma_NPC_idbutton:GetText()

    if UnitExists("target") and guid ~= "" and npcid ~= "" then
        local currentid = ma_NPC_idbutton:GetText()
        currentid = currentid + 1
        ma_NPC_idbutton:SetText(currentid)
    else
        print("Target NPC and use 'Get GUID' first")
    end
end

function ID_DOWN()
    -- Check if ID exists
    local guid = ma_NPC_guidbutton:GetText()
    local npcid = ma_NPC_idbutton:GetText()

    if UnitExists("target") and guid ~= "" and npcid ~= "" then
        local currentid = ma_NPC_idbutton:GetText()
        currentid = currentid - 1
        ma_NPC_idbutton:SetText(currentid)
    else
        print("Target NPC and use 'Get GUID' first")
    end
end

function NPCClear()
    -- Clear all NPC info text boxes
    ma_NPC_guidbutton:SetText("")
    ma_NPC_idbutton:SetText("")
    ma_npcdisplayid:SetText("")
    ma_npc_distance_box:SetText("")
end

function NPCModelZoomIn()
    ma_npcmodelframe:SetCamera(0)
--    ma_modelframe:SetModelScale(ma_modelframe:GetModelScale() + .1)
    --ma_modelframe:SetPosition(1,ma_modelframe:GetModelScale()*3,0)
    --ma_modelframe:RefreshUnit()
end

function NPCModelZoomOut()
    ma_npcmodelframe:SetCamera(1)
    ma_npcmodelframe:RefreshUnit()

   -- ma_modelframe:SetCamera(2)
    --ma_modelframe:SetModelScale(ma_modelframe:GetModelScale() * .5)
    --ma_modelframe:SetPosition(0,0,0)
    --ma_modelframe:RefreshUnit()

end

function NPCPossess()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".possess")

end
function NPCUnPossess()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".unpossess")

end

function NPCFreeze()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".npc set movetype stay NODEL")
end

function NPCFreezeDEL()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".npc set movetype stay")
end

function WayEndAdd()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".wp add")
end

function NPCAdd_Way()
    local player = UnitName("target") or UnitName("player")
    local npc =	ma_NPC_guidbutton:GetText()
    AzerothAdmin:ChatMsg(".wp add "..npc)
    --AzerothAdmin:Way_Point_Add_Start_Write(1)
    AzerothAdmin:ChatMsg(".wp show on "..npc)
end

function WayModifyAdd()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".wp modify add")
end

function WayModifyDel()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".wp modify del")
end

function NPCAdd_WayShowOn()
    local player = UnitName("target") or UnitName("player")
    local npc =	ma_NPC_guidbutton:GetText()
    AzerothAdmin:ChatMsg(".wp show on "..npc)
end

function WayShowOn()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".wp show on")
end

function WayShowOff()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".wp show off")
end

function NPCUnFreeze_Way()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".npc set movetype way NODEL")
end

function ShowMove()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".movegens")
end
