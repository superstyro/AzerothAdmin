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

function OBJGo()
    local player = UnitName("target") or UnitName("player")
    local obj =	ma_Obj_guidbutton:GetText()
    MangAdmin:ChatMsg(".go object "..obj)
    MangAdmin:LogAction("Go Object for player "..player..".")
end

function OBJAdd()
    local player = UnitName("target") or UnitName("player")
    local obj =	ma_Obj_idbutton:GetText()
    MangAdmin:ChatMsg(".gobject add "..obj)
    MangAdmin:LogAction("Object Add for player "..player..".")
end

function OBJMove()
    local player = UnitName("target") or UnitName("player")
    local obj =	ma_Obj_guidbutton:GetText()
    MangAdmin:ChatMsg(".gobject move "..obj)
    MangAdmin:LogAction("Object Move for player "..player..".")
end

function OBJTurn()
    local player = UnitName("target") or UnitName("player")
    local obj =	ma_Obj_guidbutton:GetText()
    MangAdmin:ChatMsg(".gobject turn "..obj)
    MangAdmin:LogAction("Object Turn for player "..player..".")
end

function OBJDel()
    local player = UnitName("target") or UnitName("player")
    local obj =	ma_Obj_guidbutton:GetText()
    MangAdmin:ChatMsg(".gobject delete "..obj)
    MangAdmin:LogAction("Object Delete for player "..player..".")
end

function OBJNear()
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".gobject near")
    MangAdmin:LogAction("Object Near for player "..player..".")
end

function OBJTarget()
	if gettingGOBinfo == 0 and gettingGOBinfoinfo == 0 then
        gettingGOBinfo=1
        --ma_gobtargetinfo:SetText("|cffffffff")
        --ma_gobinfoinfo:SetText("|cffffffff")

        local player =  UnitName("player")
        MangAdmin:ChatMsg(".gobject target")
        MangAdmin:LogAction("Object Target for player "..player..".")
        --gettingGOBinfoinfo=1
        MangAdmin:ChatMsg(".gobject info")
        --ShowGobModel()
    end
end

function OBJActivate()
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".gobject activate "..ma_Obj_guidbutton:GetText())
    MangAdmin:LogAction("Object "..ma_Obj_guidbutton:GetText().." activated for player "..player..".")
end

function OBJAddTemp()
    local player = UnitName("target") or UnitName("player")
    local obj =	ma_Obj_idbutton:GetText()
    MangAdmin:ChatMsg(".gobject add temp "..obj)
    MangAdmin:LogAction("Object Add(Temp) for player "..player..".")
end

function OBJInfo()
    local player = UnitName("target") or UnitName("player")
    MangAdmin:ChatMsg(".gobject info")
    MangAdmin:LogAction("Object "..ma_Obj_guidbutton:GetText().." info obtained for player "..player..".")
end

function OBJSetPhase()
    local player = UnitName("target") or UnitName("player")
    local obj =	ma_Obj_guidbutton:GetText()
    local phase = ma_gobsetphaseinput:GetText()
    MangAdmin:ChatMsg(".gobject set phase "..obj.." "..phase)
    MangAdmin:LogAction("Object "..obj.." phase set to "..phase.." for player "..player..".")
end

function ShowGobModel()
    local Scale = UIParent:GetEffectiveScale();
    local Hypotenuse = ( ( GetScreenWidth() * Scale ) ^ 2 + ( GetScreenHeight() * Scale ) ^ 2 ) ^ 0.5;
    local CoordRight = ( ma_gobjectmodel:GetRight() - ma_gobjectmodel:GetLeft() ) / Hypotenuse
    local CoordTop = ( ma_gobjectmodel:GetTop() - ma_gobjectmodel:GetBottom() ) / Hypotenuse
    local Radian = 0.0174532925
    local gobdisplay = ma_gobdisplayid:GetText()
    local fu = tonumber(gobdisplay)
    ma_gobjectmodel:SetSequence(0)
	ma_gobjectmodel:SetCamera(2)
    ma_gobjectmodel:SetModelScale(0.5)
    ma_gobjectmodel:SetPosition((CoordRight/2),(CoordTop/2),0)
    ma_gobjectmodel:SetLight(1, 0, 0, -0.707, -0.707, 0.7, 1.0, 1.0, 1.0, 0.8, 1.0, 1.0, 0.8)
    tVar=""
    tVar = ModelA[fu]
    if not tVar then
        ma_gobinfoinfo="No data for this model"
    else
        ma_gobjectmodel:SetModel(tVar)
    end
end

function GobModelRotateLeft()
  ma_gobjectmodel.rotation = ma_gobjectmodel.rotation - 0.3
  ma_gobjectmodel:SetRotation(ma_gobjectmodel.rotation)
  PlaySound("igInventoryRotateCharacter")
end

function GobModelRotateRight()
  ma_gobjectmodel.rotation = ma_gobjectmodel.rotation + 0.3
  ma_gobjectmodel:SetRotation(ma_gobjectmodel.rotation)
  PlaySound("igInventoryRotateCharacter")
end

--ma_gobjectmodel:SetRotation((RotValSlider:GetValue() * Radian))

function InitGobModelFrame()
  ma_gobjectmodel:SetScript("OnUpdate", function() MangAdminModelOnUpdate(arg1) end)
  ma_gobjectmodel.rotation = 0.61
  ma_gobjectmodel:SetRotation(0.61)
  --ma_gobjectmodel:SetUnit("player")

end

function GobModelZoomIn()
    --ma_gobjectmodel:SetCamera(0)
    ma_gobjectmodel:SetModelScale(ma_gobjectmodel:GetModelScale() + .1)
    --ma_modelframe:SetPosition(1,ma_modelframe:GetModelScale()*3,0)
    --ma_modelframe:RefreshUnit()
end

function GobModelZoomOut()
    --ma_gobjectmodel:SetCamera(1)
    --ma_gobjectmodel:RefreshUnit()
   -- ma_modelframe:SetCamera(2)
    ma_gobjectmodel:SetModelScale(ma_gobjectmodel:GetModelScale() - .1)
    --ma_modelframe:SetPosition(0,0,0)
    --ma_modelframe:RefreshUnit()
end

--[[function CHAT_MSG_SYSTEM()

    if string.find(arg1,"Selected object") ~= nil then
        if fID == 1 then
            SendChatMessage('.gob info')
            fID = 2
        end
    end
    if string.find(arg1,"GUID:") ~= nil then
        if fID == 2 then
            WorkString = string.gsub(arg1, '(|.........)', '')
            WorkString = string.gsub(WorkString, 'GUID:', '')
            ObjectIDTxT:SetText(WorkString)
            fID = 3
        end
    end
    if string.find(arg1,"Model:") ~= nil then
        if fID == 3 then
            WorkString = string.gsub(arg1, '(|.........)', '')
            WorkString = string.gsub(WorkString, 'Model:', '')
            ObjectMTxt:SetText(WorkString)
            fID = 0
        end
    end
    if string.find(arg1,"Model:") ~= nil then
        WorkString = string.gsub(arg1, '(|.........)', '')
        WorkString = string.match(WorkString, '%d*%d')
        --ObjectPlay:LoadModel(WorkString)
    end
    if string.find(arg1,"No inrange GameObject") ~= nil then
        if fID == 1 then
            fID = 0
        end
    end
end ]]

function CheckToggle(action)
    if action == "spawn" then
        ma_moveonmovecheck:SetChecked(false)
    elseif action == "move" then
        ma_spawnonmovecheck:SetChecked(false)
    else
    end

--[[    isChecked = ma_spawnonmovecheck:GetChecked()
    if isChecked == 1 then
        ma_spawnonmovecheck:SetChecked(false)
    else
        ma_spawnonmovecheck:SetChecked(true)
    end]]
end

--[[function GetOID()
    if fID == 0 then
        fID = 1
        SendChatMessage('.gob near')
    end
end]]

function DMUP()
    if cWorking == 0 then
        cWorking = 1
        incZ = ma_gobmovedistupdown:GetText()
        SendChatMessage(GPS)
    end
end

function DMDown()
    if cWorking == 0 then
        cWorking = 1
        incZ = 0 - ma_gobmovedistupdown:GetText()
        SendChatMessage(GPS)
    end
end

function DMLeft()
    if cWorking == 0 then
        cWorking = 1
        incY = ma_gobmovedistleftright:GetText()
        SendChatMessage(GPS)
    end
end

function DMRight()
    if cWorking == 0 then
        cWorking = 1
        incY = 0 - ma_gobmovedistleftright:GetText()
        SendChatMessage(GPS)
    end
end

function DMSS()
    if cWorking == 0 then
        cWorking = 1
        SendChatMessage(GPS)
    end
end

function DMSS2()
        isChecked = ma_spawnonmovecheck:GetChecked()
        isChecked2 = ma_moveonmovecheck:GetChecked()
        if isChecked == 1 then  --AddonMove
            ObjectN = ma_Obj_idbutton:GetText()
            SendChatMessage('.gob add '..ObjectN)
        elseif isChecked2 == 1 then --MoveonMove
            SendChatMessage('.gob del '..ma_Obj_guidbutton:GetText())
            ObjectN = ma_Obj_idbutton:GetText()
            SendChatMessage('.gob add '..ObjectN)
        else
        end
        OBJTarget()
end

function DMFront()
    if cWorking == 0 then
        cWorking = 1
        incX = ma_gobmovedistforwardback:GetText()
        SendChatMessage(GPS)
    end
end

function DMBack()
    if cWorking == 0 then
        cWorking = 1
        incX = 0 - ma_gobmovedistforwardback:GetText()
        SendChatMessage(GPS)
    end
end