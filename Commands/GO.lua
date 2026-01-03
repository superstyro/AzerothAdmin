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

function AzerothAdminCommands.OBJGo()
    local player = UnitName("target") or UnitName("player")
    local obj = ma_Obj_guidbutton:GetText()
    AzerothAdmin:ChatMsg(".go gameobject "..obj)
end

function AzerothAdminCommands.OBJAdd()
    local player = UnitName("target") or UnitName("player")
    local obj = ma_Obj_idbutton:GetText()
    AzerothAdmin:ChatMsg(".gobject add "..obj)
end

function AzerothAdminCommands.OBJMove()
    local player = UnitName("target") or UnitName("player")
    local obj = ma_Obj_guidbutton:GetText()
    AzerothAdmin:ChatMsg(".gobject move "..obj)
end

function AzerothAdminCommands.OBJTurn()
    local player = UnitName("target") or UnitName("player")
    local obj = ma_Obj_guidbutton:GetText()
    AzerothAdmin:ChatMsg(".gobject turn "..obj)
end

function AzerothAdminCommands.OBJDel()
    local player = UnitName("target") or UnitName("player")
    local obj = ma_Obj_guidbutton:GetText()
    AzerothAdmin:ChatMsg(".gobject delete "..obj)
end

function AzerothAdminCommands.OBJNear()
    local player = UnitName("target") or UnitName("player")
    local objguid = ma_Obj_guidbutton:GetText()
    local objid = ma_Obj_idbutton:GetText()
    local range = ma_gobnearrange:GetText()
    AzerothAdmin:ChatMsg(".gobject near "..range)
end

function AzerothAdminCommands.OBJTarget()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".gobject target")
end

function AzerothAdminCommands.OBJActivate()
    local player = UnitName("target") or UnitName("player")
    AzerothAdmin:ChatMsg(".gobject activate "..ma_Obj_guidbutton:GetText())
end

function AzerothAdminCommands.OBJAddTemp()
    local player = UnitName("target") or UnitName("player")
    local obj = ma_Obj_idbutton:GetText()
    AzerothAdmin:ChatMsg(".gobject add temp "..obj)
end

function AzerothAdminCommands.OBJInfo()
    local player = UnitName("target") or UnitName("player")
    local obj = ma_Obj_idbutton:GetText()
    AzerothAdmin:ChatMsg(".gobject info "..obj)
end

function AzerothAdminCommands.OBJSetPhase()
    local player = UnitName("target") or UnitName("player")
    local obj = ma_Obj_guidbutton:GetText()
    local phase = ma_gobsetphaseinput:GetText()
    AzerothAdmin:ChatMsg(".gobject set phase "..obj.." "..phase)
end

-- MEMORY OPTIMIZATION: Load Models addon on-demand (saves ~5.6 MB!)
local function EnsureModelsLoaded()
    if not IsAddOnLoaded("AzerothAdmin_Models") then
        local loaded, reason = LoadAddOn("AzerothAdmin_Models")
        if loaded then
            AzerothAdmin:Print("Loaded model database")
        else
            local reasons = {
                [0] = "Unknown error",
                [1] = "Addon disabled",
                [2] = "Addon missing",
                [3] = "Addon too old/new",
                [4] = "Addon dependency missing",
                [5] = "Addon insecure"
            }
            AzerothAdmin:Print("ERROR: Could not load Models addon - " .. (reasons[reason] or "Unknown"))
        end
    end
end

function AzerothAdminCommands.UnloadModels()
    if IsAddOnLoaded("AzerothAdmin_Models") then
        -- Clear the global ModelA table to free memory
        ModelA = nil
        -- Force garbage collection
        collectgarbage("collect")
        AzerothAdmin:Print("Model database unloaded. Use /reload to fully free memory")
    else
        AzerothAdmin:Print("Model database is not currently loaded")
    end
end

function AzerothAdminCommands.ShowGobModel()
    -- Load models database if not already loaded
    EnsureModelsLoaded()

    local Scale = UIParent:GetEffectiveScale();
    local Hypotenuse = ( ( GetScreenWidth() * Scale ) ^ 2 + ( GetScreenHeight() * Scale ) ^ 2 ) ^ 0.5;
    local CoordRight = ( ma_gobjectmodel:GetRight() - ma_gobjectmodel:GetLeft() ) / Hypotenuse
    local CoordTop = ( ma_gobjectmodel:GetTop() - ma_gobjectmodel:GetBottom() ) / Hypotenuse
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
        ma_gobinfoinfo:SetText("No data for this model")
    else
        ma_gobjectmodel:SetModel(tVar)
    end
end

function AzerothAdminCommands.GobModelRotateLeft()
  ma_gobjectmodel.rotation = ma_gobjectmodel.rotation - 0.3
  ma_gobjectmodel:SetRotation(ma_gobjectmodel.rotation)
  PlaySound("igInventoryRotateCharacter")
end

function AzerothAdminCommands.GobModelRotateRight()
  ma_gobjectmodel.rotation = ma_gobjectmodel.rotation + 0.3
  ma_gobjectmodel:SetRotation(ma_gobjectmodel.rotation)
  PlaySound("igInventoryRotateCharacter")
end

--ma_gobjectmodel:SetRotation((RotValSlider:GetValue() * Radian))

function AzerothAdminCommands.InitGobModelFrame()
  ma_gobjectmodel:SetScript("OnUpdate", function() AzerothAdminCommands.AzerothAdminModelOnUpdate(arg1) end)
  ma_gobjectmodel.rotation = 0.61
  ma_gobjectmodel:SetRotation(0.61)
  --ma_gobjectmodel:SetUnit("player")

end

function AzerothAdminCommands.GobModelZoomIn()
    --ma_gobjectmodel:SetCamera(0)
    ma_gobjectmodel:SetModelScale(ma_gobjectmodel:GetModelScale() + .1)
    --ma_modelframe:SetPosition(1,ma_modelframe:GetModelScale()*3,0)
    --ma_modelframe:RefreshUnit()
end

function AzerothAdminCommands.GobModelZoomOut()
    --ma_gobjectmodel:SetCamera(1)
    --ma_gobjectmodel:RefreshUnit()
   -- ma_modelframe:SetCamera(2)
    ma_gobjectmodel:SetModelScale(ma_gobjectmodel:GetModelScale() - .1)
    --ma_modelframe:SetPosition(0,0,0)
    --ma_modelframe:RefreshUnit()
end

function AzerothAdminCommands.CheckToggle(action)
    if action == "spawn" then
        ma_moveonmovecheck:SetChecked(false)
    elseif action == "move" then
        ma_spawnonmovecheck:SetChecked(false)
    end
end

function AzerothAdminCommands.DMUP()
    if AzerothAdmin.cWorking == 0 then
        AzerothAdmin.cWorking = 1
        AzerothAdmin.incZ = ma_gobmovedistupdown:GetText()
        SendChatMessage(GPS)
    end
end

function AzerothAdminCommands.DMDown()
    if AzerothAdmin.cWorking == 0 then
        AzerothAdmin.cWorking = 1
        AzerothAdmin.incZ = 0 - ma_gobmovedistupdown:GetText()
        SendChatMessage(GPS)
    end
end

function AzerothAdminCommands.DMLeft()
    if AzerothAdmin.cWorking == 0 then
        AzerothAdmin.cWorking = 1
        AzerothAdmin.incY = ma_gobmovedistleftright:GetText()
        SendChatMessage(GPS)
    end
end

function AzerothAdminCommands.DMRight()
    if AzerothAdmin.cWorking == 0 then
        AzerothAdmin.cWorking = 1
        AzerothAdmin.incY = 0 - ma_gobmovedistleftright:GetText()
        SendChatMessage(GPS)
    end
end

function AzerothAdminCommands.DMSS()
    if AzerothAdmin.cWorking == 0 then
        AzerothAdmin.cWorking = 1
        SendChatMessage(GPS)
    end
end

function AzerothAdminCommands.DMSS2()
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
        AzerothAdminCommands.OBJTarget()
end

function AzerothAdminCommands.DMFront()
    if AzerothAdmin.cWorking == 0 then
        AzerothAdmin.cWorking = 1
        AzerothAdmin.incX = ma_gobmovedistforwardback:GetText()
        SendChatMessage(GPS)
    end
end

function AzerothAdminCommands.DMBack()
    if AzerothAdmin.cWorking == 0 then
        AzerothAdmin.cWorking = 1
        AzerothAdmin.incX = 0 - ma_gobmovedistforwardback:GetText()
        SendChatMessage(GPS)
    end
end
