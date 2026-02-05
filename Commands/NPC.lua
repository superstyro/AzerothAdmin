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

function AzerothAdminCommands.InitModelFrameNPC()
  ma_npcmodelframe:SetScript("OnUpdate", function(self, elapsed) AzerothAdminCommands.AzerothAdminNpcModelOnUpdate(self, elapsed) end)
  ma_npcmodelframe.rotation = 0.61;
  ma_npcmodelframe:SetRotation(ma_npcmodelframe.rotation)
  ma_npcmodelframe:SetUnit("player")

end

function AzerothAdminCommands.NpcModelRotateLeft()
  ma_npcmodelframe.rotation = ma_npcmodelframe.rotation - 0.03
  ma_npcmodelframe:SetRotation(ma_npcmodelframe.rotation)
  PlaySound("igInventoryRotateCharacter")
end

function AzerothAdminCommands.NpcModelRotateRight()
  ma_npcmodelframe.rotation = ma_npcmodelframe.rotation + 0.03
  ma_npcmodelframe:SetRotation(ma_npcmodelframe.rotation)
  PlaySound("igInventoryRotateCharacter")
end

function AzerothAdminCommands.AzerothAdminNpcModelOnUpdate(frame, elapsedTime)
  if ( ma_npcmodelrotatelbutton:GetButtonState() == "PUSHED" ) then
    frame.rotation = frame.rotation + (elapsedTime * 2 * PI * ROTATIONS_PER_SECOND)
    if ( frame.rotation < 0 ) then
      frame.rotation = frame.rotation + (2 * PI)
    end
    frame:SetRotation(frame.rotation);
  end
  if ( ma_npcmodelrotaterbutton:GetButtonState() == "PUSHED" ) then
    frame.rotation = frame.rotation - (elapsedTime * 2 * PI * ROTATIONS_PER_SECOND)
    if ( frame.rotation > (2 * PI) ) then
      frame.rotation = frame.rotation - (2 * PI)
    end
    frame:SetRotation(frame.rotation);
  end
end

function AzerothAdminCommands.NpcModelChanged()
  if not ma_npcmodelframe then
    return -- Frame not created yet
  end
  if not AzerothAdmin:Selection("none") then
    ma_npcmodelframe:SetUnit("target")
  else
    ma_npcmodelframe:SetUnit("player")
  end
  ma_npcmodelframe:RefreshUnit()
end

function AzerothAdminCommands.NPCKillSomething()
  local target = UnitName("target") or UnitName("player")
  AzerothAdmin:ChatMsg(".die")
end

function AzerothAdminCommands.Respawn()
  AzerothAdmin:ChatMsg(".respawn")
end

function AzerothAdminCommands.NPCDistance()
    -- Check if a target exists
    if UnitExists("target") then
        AzerothAdmin:ID_Setting_Start_Write(1)
        local player = UnitName("target") or UnitName("player")
        AzerothAdmin:ChatMsg(".distance")
    else
        print("Target NPC to use distance command")
    end
end

function AzerothAdminCommands.NPCShowGUID()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".guid")
end

function AzerothAdminCommands.NPCInfo()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".npc info")
end

function AzerothAdminCommands.NPCDemorph()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".demorph")
end


function AzerothAdminCommands.NPCMove()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".npc move")
end



function AzerothAdminCommands.NPCDel()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".npc del")
end

function AzerothAdminCommands.NPC_GUID_Get()
	AzerothAdmin:ID_Setting_Start_Write(1)
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".npc info")
end

function AzerothAdminCommands.NPC_Add()
    local player = UnitName("target") or UnitName("player")
    local npc = ma_NPC_idbutton:GetText()
    AzerothAdmin:ChatMsg(".npc add "..npc)
end

function AzerothAdminCommands.NPCGo()
    local player = UnitName("target") or UnitName("player")
    local npc =	ma_NPC_guidbutton:GetText()
    AzerothAdmin:ChatMsg(".go creature "..npc)
end

function AzerothAdminCommands.NPCMorph()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  AzerothAdmin:ChatMsg(".modify morph "..npccname)
end

function AzerothAdminCommands.NPCSay()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  AzerothAdmin:ChatMsg(".npc say "..npccname)
end

function AzerothAdminCommands.NPCYell()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  AzerothAdmin:ChatMsg(".npc yell "..npccname)
end

function AzerothAdminCommands.NPCAura()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  AzerothAdmin:ChatMsg(".aura "..npccname)
end

function AzerothAdminCommands.NPCUnaura()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  AzerothAdmin:ChatMsg(".unaura "..npccname)
end

function AzerothAdminCommands.NpcEmote(emote)
    AzerothAdmin:ChatMsg(".npc playemote "..emote)
end

function AzerothAdminCommands.NPCBindSight()
    local npccname = ma_npccharactertarget:GetText()
    AzerothAdmin:ChatMsg(".bindsight")
end

function AzerothAdminCommands.NPCUnBindSight()
    local npccname = ma_npccharactertarget:GetText()
    AzerothAdmin:ChatMsg(".unbindsight")
end

function AzerothAdminCommands.NPCComeToMe()
    local npccname = ma_npccharactertarget:GetText()
    AzerothAdmin:ChatMsg(".cometome 1")

end

function AzerothAdminCommands.DisplayUP()
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

function AzerothAdminCommands.DisplayDown()
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

function AzerothAdminCommands.ID_UP()
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

function AzerothAdminCommands.ID_DOWN()
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

function AzerothAdminCommands.NPCClear()
    -- Clear all NPC info text boxes
    ma_NPC_guidbutton:SetText("")
    ma_NPC_idbutton:SetText("")
    ma_npcdisplayid:SetText("")
    ma_npc_distance_box:SetText("")
end

function AzerothAdminCommands.NPCModelZoomIn()
    ma_npcmodelframe:SetCamera(0)
--    ma_modelframe:SetModelScale(ma_modelframe:GetModelScale() + .1)
    --ma_modelframe:SetPosition(1,ma_modelframe:GetModelScale()*3,0)
    --ma_modelframe:RefreshUnit()
end

function AzerothAdminCommands.NPCModelZoomOut()
    ma_npcmodelframe:SetCamera(1)
    ma_npcmodelframe:RefreshUnit()

   -- ma_modelframe:SetCamera(2)
    --ma_modelframe:SetModelScale(ma_modelframe:GetModelScale() * .5)
    --ma_modelframe:SetPosition(0,0,0)
    --ma_modelframe:RefreshUnit()

end

function AzerothAdminCommands.NPCPossess()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".possess")

end
function AzerothAdminCommands.NPCUnPossess()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".unpossess")

end

function AzerothAdminCommands.NPCFreeze()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".npc set movetype stay NODEL")
end

function AzerothAdminCommands.NPCFreezeDEL()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".npc set movetype stay")
end

function AzerothAdminCommands.WayEndAdd()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".wp add")
end

function AzerothAdminCommands.NPCAdd_Way()
    local player = UnitName("target") or UnitName("player")
    local npc =	ma_NPC_guidbutton:GetText()
    AzerothAdmin:ChatMsg(".wp add "..npc)
    --AzerothAdmin:Way_Point_Add_Start_Write(1)
    AzerothAdmin:ChatMsg(".wp show on "..npc)
end

function AzerothAdminCommands.WayModifyAdd()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".wp modify add")
end

function AzerothAdminCommands.WayModifyDel()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".wp modify del")
end

function AzerothAdminCommands.NPCAdd_WayShowOn()
    local player = UnitName("target") or UnitName("player")
    local npc =	ma_NPC_guidbutton:GetText()
    AzerothAdmin:ChatMsg(".wp show on "..npc)
end

function AzerothAdminCommands.WayShowOn()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".wp show on")
end

function AzerothAdminCommands.WayShowOff()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".wp show off")
end

function AzerothAdminCommands.NPCUnFreeze_Way()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".npc set movetype way NODEL")
end

function AzerothAdminCommands.ShowMove()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".movegens")
end
