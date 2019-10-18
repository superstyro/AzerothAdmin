-------------------------------------------------------------------------------------------------------------
--
-- TrinityAdmin Version 3.x
-- TrinityAdmin is a derivative of MangAdmin.
--
-- Copyright (C) 2018 Free Software Foundation, Inc.
-- License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
-- This is free software: you are free to change and redistribute it.
-- There is NO WARRANTY, to the extent permitted by law.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
--
-- Official Forums: http://groups.google.com/group/trinityadmin
-- GoogleCode Website: http://code.google.com/p/trinityadmin/
-- Subversion Repository: http://trinityadmin.googlecode.com/svn/
-- Dev Blog: http://trinityadmin.blogspot.com/
-------------------------------------------------------------------------------------------------------------

function InitModelFrameNPC()
  ma_npcmodelframe:SetScript("OnUpdate", function() MangAdminNpcModelOnUpdate(arg1) end)
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

function MangAdminNpcModelOnUpdate(elapsedTime)
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
  if not MangAdmin:Selection("none") then
    ma_npcmodelframe:SetUnit("target")
  else
    ma_npcmodelframe:SetUnit("player")
  end
  ma_npcmodelframe:RefreshUnit()
end

function NPCKillSomething()
  local target = UnitName("target") or UnitName("player")
  MangAdmin:ChatMsg(".die")
  MangAdmin:LogAction("Killed "..target..".")
end

function Respawn()
  MangAdmin:ChatMsg(".respawn")
  MangAdmin:LogAction("Respawned creatures near you.")
end

function NPCDistance()
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".distance")
    MangAdmin:LogAction("Got distance to player "..player..".")
end

function NPCShowGUID()
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".guid")
    MangAdmin:LogAction("Got GUID for player "..player..".")
end

function NPCInfo()
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".npc info")
    MangAdmin:LogAction("Got NPC info for player "..player..".")
end

function NPCDemorph()
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".demorph")
    MangAdmin:LogAction("Demorphed player "..player..".")
end


function NPCMove()
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".npc move")
    MangAdmin:LogAction("Set NPC move for player "..player..".")
end



function NPCDel()
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".npc del")
    MangAdmin:LogAction("Set NPC deleted for player "..player..".")
end

function NPC_GUID_Get()
	MangAdmin:ID_Setting_Start_Write(1)
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".npc info")
    MangAdmin:LogAction("Got NPC_GUID_Get for player "..player..".")
end

function NPC_Add()
    local player = UnitName("target") or UnitName("player")
    local npc = ma_NPC_idbutton:GetText()
    MangAdmin:ChatMsg(".npc add "..npc)
    MangAdmin:LogAction("NPC Spawn mob "..npc..".")
end

function NPCGo()
    local player = UnitName("target") or UnitName("player")
    local npc =	ma_NPC_guidbutton:GetText()
    MangAdmin:ChatMsg(".go creature "..npc)
    MangAdmin:LogAction("Go NPC for player "..player..".")
end

function NPCMorph()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  MangAdmin:ChatMsg(".modify morph "..npccname)
  MangAdmin:LogAction(".modify morph "..npccname..".")
end

function NPCSay()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  MangAdmin:ChatMsg(".npc say "..npccname)
  MangAdmin:LogAction(".npc say "..npccname..".")
end

function NPCYell()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  MangAdmin:ChatMsg(".npc yell "..npccname)
  MangAdmin:LogAction(".npc yell "..npccname..".")
end

function NPCAura()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  MangAdmin:ChatMsg(".aura "..npccname)
  MangAdmin:LogAction(".aura "..npccname..".")
end

function NPCUnaura()
  local cname = ma_charactertarget:GetText()
  local npccname = ma_npccharactertarget:GetText()
  MangAdmin:ChatMsg(".unaura "..npccname)
  MangAdmin:LogAction(".unaura "..npccname..".")
end

function NpcEmote(emote)
    MangAdmin:ChatMsg(".npc playemote "..emote)
    MangAdmin:LogAction("Played emote ("..emote..").")
end

function NPCBindSight()
    local npccname = ma_npccharactertarget:GetText()
    MangAdmin:ChatMsg(".bindsight")
    MangAdmin:LogAction("Sight bound to "..npccname)
end

function NPCUnBindSight()
    local npccname = ma_npccharactertarget:GetText()
    MangAdmin:ChatMsg(".unbindsight")
    MangAdmin:LogAction("Sight unbound to "..npccname)
end

function NPCComeToMe()
    local npccname = ma_npccharactertarget:GetText()
    MangAdmin:ChatMsg(".cometome 1")
    MangAdmin:LogAction("Forced "..npccname.." using ComeToMe")

end

function DisplayUP()
    local currentid = ma_npcdisplayid:GetText()
    currentid = currentid + 1
    ma_npcdisplayid:SetText(currentid)
    MangAdmin:ChatMsg(".npc set model "..currentid)
end
function DisplayDown()
    local currentid = ma_npcdisplayid:GetText()
    currentid = currentid - 1
    ma_npcdisplayid:SetText(currentid)
    MangAdmin:ChatMsg(".npc set model "..currentid)
end

function ID_UP()
    local currentid = ma_NPC_idbutton:GetText()
    currentid = currentid + 1
    ma_NPC_idbutton:SetText(currentid)
--    MangAdmin:ChatMsg(".npc set model "..currentid)
end

function ID_DOWN()
    local currentid = ma_NPC_idbutton:GetText()
    currentid = currentid - 1
    ma_NPC_idbutton:SetText(currentid)
--    MangAdmin:ChatMsg(".npc set model "..currentid)
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
    MangAdmin:ChatMsg(".possess")
    MangAdmin:LogAction("Possessed "..player)

end
function NPCUnPossess()
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".unpossess")
    MangAdmin:LogAction("UnPossessed "..player)

end

function NPCFreeze()
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".npc set movetype stay NODEL")
    MangAdmin:LogAction("Set NPC movement to STAY for player "..player..".")
end

function NPCFreezeDEL()
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".npc set movetype stay")
    MangAdmin:LogAction("Set NPC movement to STAY for player "..player..".")
end

function WayEndAdd()
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".wp add")
    MangAdmin:LogAction("WayPoint Add for player "..player..".")
end

function NPCAdd_Way()
    local player = UnitName("target") or UnitName("player")
    local npc =	ma_NPC_guidbutton:GetText()
    MangAdmin:ChatMsg(".wp add "..npc)
    --MangAdmin:Way_Point_Add_Start_Write(1)
    MangAdmin:ChatMsg(".wp show on "..npc)
    MangAdmin:LogAction("WayPoint Add for player "..player..".")
end

function WayModifyAdd()
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".wp modify add")
    MangAdmin:LogAction("WayPoint(Modify) Add for player "..player..".")
end

function WayModifyDel()
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".wp modify del")
    MangAdmin:LogAction("WayPoint(Modify) Del for player "..player..".")
end

function NPCAdd_WayShowOn()
    local player = UnitName("target") or UnitName("player")
    local npc =	ma_NPC_guidbutton:GetText()
    MangAdmin:ChatMsg(".wp show on "..npc)
    MangAdmin:LogAction("WayPoint Show On for player "..player..".")
end

function WayShowOn()
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".wp show on")
    MangAdmin:LogAction("WayPoint Show On for player "..player..".")
end

function WayShowOff()
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".wp show off")
    MangAdmin:LogAction("WayPoint Show Off for player "..player..".")
end

function NPCUnFreeze_Way()
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".npc set movetype way NODEL")
    MangAdmin:LogAction("Set NPC movement type to WAYPOINT for player "..player..".")
end

function NPCUnFreeze_Random()
    local player = UnitName("target") or UnitName("player")
    local rdistancecname = ma_npcunfreeze_random_distancebutton:GetText()
    MangAdmin:ChatMsg(".npc set spawndist "..rdistancecname)
    MangAdmin:LogAction("Set NPC spawndist "..rdistancecname..".")
    MangAdmin:ChatMsg(".npc setm ovetype random NODEL")
    MangAdmin:LogAction("Set NPC movement type to RANDOM for player "..player..".")
    MangAdmin:ChatMsg(".respawn")

end

function ShowMove()
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".movegens")
    MangAdmin:LogAction("Got Movement Stack for player "..player..".")
end