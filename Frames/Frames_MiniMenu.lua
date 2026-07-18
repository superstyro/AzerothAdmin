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

-- Initializing dynamic frames with LUA and FrameLib
-- This script must be listed in the .toc after "AzerothAdmin.lua"
-- Also some variables are globally taken from AzerothAdmin.lua

function AzerothAdmin:CreateMiniMenu()
  -- Validate dependencies
  if not FrameLib then
    error("AzerothAdmin: FrameLib not loaded")
    return
  end

  if not AzerothAdmin.db or not AzerothAdmin.db.profile or not AzerothAdmin.db.profile.style then
    error("AzerothAdmin: Style database not initialized")
    return
  end

  if not ROOT_PATH then
    error("AzerothAdmin: ROOT_PATH not defined")
    return
  end

  local transparency = {
    bg = AzerothAdmin.db.profile.style.transparency.backgrounds,
    btn = AzerothAdmin.db.profile.style.transparency.buttons,
    frm = AzerothAdmin.db.profile.style.transparency.frames
  }
  local color = {
    bg = AzerothAdmin.db.profile.style.color.backgrounds,
    btn = AzerothAdmin.db.profile.style.color.buttons,
    frm = AzerothAdmin.db.profile.style.color.frames
  }

  -- [[ MiniMenu Elements ]]
  FrameLib:BuildFrame({
    name = "ma_minibgframe",
    group = "minimenu",
    parent = UIParent,
    texture = {
      color = {color.bg.r, color.bg.g, color.bg.b, transparency.bg}
    },
    draggable = true,
    size = {
      width = 28,
      height = 244
    },
    setpoint = {
      pos = "RIGHT"
    },
    inherits = nil
  })

  -- Make mini menu draggable with left control modifier
  ma_minibgframe:SetMovable(true)
  ma_minibgframe:EnableMouse(true)
  ma_minibgframe:RegisterForDrag("LeftButton")
  ma_minibgframe:SetClampedToScreen(true)

  local function SaveMiniMenuPosition(frame)
    frame:StopMovingOrSizing()

    if AzerothAdmin.db.profile.style.minimenuFreeMove then
      -- Keep exact free placement and save bottom-left offsets
      local left = frame:GetLeft() or 0
      local bottom = frame:GetBottom() or 0
      frame:ClearAllPoints()
      frame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", left, bottom)
      AzerothAdmin.db.profile.minimenuPosition = {
        free = true,
        x = left,
        y = bottom
      }
      return
    end

    -- Snap to left or right screen edge
    local screenWidth = UIParent:GetWidth()
    local screenHeight = UIParent:GetHeight()
    local x, y = frame:GetCenter()
    if not x or not y then
      return
    end

    local side = (x < screenWidth / 2) and "LEFT" or "RIGHT"
    local yOffset = y - (screenHeight / 2)

    frame:ClearAllPoints()
    frame:SetPoint(side, UIParent, side, 0, yOffset)
    AzerothAdmin.db.profile.minimenuPosition = {
      side = side,
      yOffset = yOffset
    }
  end

  ma_minibgframe:SetScript("OnDragStart", function(self)
    if IsLeftControlKeyDown() then
      self:StartMoving()
    end
  end)

  ma_minibgframe:SetScript("OnDragStop", function(self)
    SaveMiniMenuPosition(self)
  end)

  FrameLib:BuildFrame({
    name = "ma_miniframe",
    group = "minimenu",
    parent = ma_minibgframe,
    texture = {
      color = {color.frm.r, color.frm.g, color.frm.b, transparency.frm}
    },
    size = {
      width = 24,
      height = 240
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 2,
      offY = -2
    },
    inherits = nil
  })

  FrameLib:BuildButton({
    name = "ma_mm_logoframe",
    group = "minimenu",
    parent = ma_miniframe,
    texture = {
      file = ROOT_PATH.."Textures\\icon"
    },
    size = {
      width = 16,
      height = 16
    },
    setpoint = {
      pos = "TOP",
      offY = -2
    },
    inherits = nil
  })

  FrameLib:BuildButton({
    name = "ma_mm_mainbutton",
    group = "minimenu",
    parent = ma_miniframe,
    texture = {
      name = "ma_mm_mainbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 20,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 2,
      offY = -20
    },
    text = Locale["ma_MiniMenuGM"]
  })

  FrameLib:BuildButton({
    name = "ma_mm_charbutton",
    group = "minimenu",
    parent = ma_miniframe,
    texture = {
      name = "ma_mm_charbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 20,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_mm_mainbutton",
      relPos = "BOTTOMLEFT",
      offX = 0,
      offY = -2
    },
    text = Locale["ma_MiniMenuChar"]
  })

  FrameLib:BuildButton({
    name = "ma_mm_npcbutton",
    group = "minimenu",
    parent = ma_miniframe,
    texture = {
      name = "ma_mm_npcbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 20,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_mm_charbutton",
      relPos = "BOTTOMLEFT",
      offX = 0,
      offY = -2
    },
    text = Locale["ma_MiniMenuNPC"]
  })

  FrameLib:BuildButton({
    name = "ma_mm_gobutton",
    group = "minimenu",
    parent = ma_miniframe,
    texture = {
      name = "ma_mm_gobutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 20,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_mm_npcbutton",
      relPos = "BOTTOMLEFT",
      offX = 0,
      offY = -2
    },
    text = Locale["ma_MiniMenuGO"]
  })


  FrameLib:BuildButton({
    name = "ma_mm_telebutton",
    group = "minimenu",
    parent = ma_miniframe,
    texture = {
      name = "ma_mm_telebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 20,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_mm_gobutton",
      relPos = "BOTTOMLEFT",
      offX = 0,
      offY = -2
    },
    text = Locale["ma_MiniMenuTele"]
  })

  FrameLib:BuildButton({
    name = "ma_mm_ticketbutton",
    group = "minimenu",
    parent = ma_miniframe,
    texture = {
      name = "ma_mm_ticketbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 20,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_mm_telebutton",
      relPos = "BOTTOMLEFT",
      offX = 0,
      offY = -2
    },
    text = Locale["ma_MiniMenuTicket"]
  })

  FrameLib:BuildButton({
    name = "ma_mm_miscbutton",
    group = "minimenu",
    parent = ma_miniframe,
    texture = {
      name = "ma_mm_miscbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 20,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_mm_ticketbutton",
      relPos = "BOTTOMLEFT",
      offX = 0,
      offY = -2
    },
    text = Locale["ma_MiniMenuMisc"]
  })

  FrameLib:BuildButton({
    name = "ma_mm_serverbutton",
    group = "minimenu",
    parent = ma_miniframe,
    texture = {
      name = "ma_mm_serverbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 20,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_mm_miscbutton",
      relPos = "BOTTOMLEFT",
      offX = 0,
      offY = -2
    },
    text = Locale["ma_MiniMenuServer"]
  })

  FrameLib:BuildButton({ --This button shows up in the center of the screen when you die!
    name = "ma_mm_revivebutton",
    group = "noneyet",
    parent = UIParent,
    texture = {
      name = "ma_mm_revivebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "CENTER",
      offY = 100
    },
    text = Locale["ma_MiniMenuRevive"]
  })

  -- Set up click handlers for menu buttons
  ma_mm_mainbutton:SetScript("OnClick", function()
    AzerothAdmin:ShowSection("main")
  end)

  ma_mm_charbutton:SetScript("OnClick", function()
    AzerothAdmin:ShowSection("char")
  end)

  ma_mm_npcbutton:SetScript("OnClick", function()
    AzerothAdmin:ShowSection("npc")
  end)

  ma_mm_gobutton:SetScript("OnClick", function()
    AzerothAdmin:ShowSection("go")
  end)

  ma_mm_telebutton:SetScript("OnClick", function()
    AzerothAdmin:ShowSection("tele")
  end)

  ma_mm_ticketbutton:SetScript("OnClick", function()
    AzerothAdmin:ShowSection("ticket")
  end)

  ma_mm_miscbutton:SetScript("OnClick", function()
    AzerothAdmin:ShowSection("misc")
  end)

  ma_mm_serverbutton:SetScript("OnClick", function()
    AzerothAdmin:ShowSection("server")
  end)

  -- Make logo button draggable (propagates to parent)
  ma_mm_logoframe:RegisterForDrag("LeftButton")

  ma_mm_logoframe:SetScript("OnDragStart", function(self)
    if IsLeftControlKeyDown() then
      ma_minibgframe:StartMoving()
    end
  end)

  ma_mm_logoframe:SetScript("OnDragStop", function(self)
    SaveMiniMenuPosition(ma_minibgframe)
  end)

  -- Logo button toggles the minimenu visibility
  ma_mm_logoframe:SetScript("OnClick", function()
    if IsShiftKeyDown() then
      ReloadUI()
    else
      AzerothAdmin:ToggleMiniMenu()
    end
  end)

  -- Add tooltip to logo button
  ma_mm_logoframe:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_LEFT")
    GameTooltip:SetText("AzerothAdmin Mini Menu", 1, 1, 1)
    GameTooltip:AddLine("Left-click to toggle main menu", nil, nil, nil, true)
    GameTooltip:AddLine("Shift-click to reload UI", nil, nil, nil, true)
    GameTooltip:AddLine("Ctrl+drag to move menu", nil, nil, nil, true)
    GameTooltip:Show()
  end)

  ma_mm_logoframe:SetScript("OnLeave", function(self)
    GameTooltip:Hide()
  end)

  -- Initialize revive button (hidden by default)
  ma_mm_revivebutton:Hide()

  -- Revive button click handler
  ma_mm_revivebutton:SetScript("OnClick", function()
    RepopMe()
    ma_mm_revivebutton:Hide()
  end)

  -- Event handler for player death/resurrection
  local reviveEventFrame = CreateFrame("Frame")
  reviveEventFrame:RegisterEvent("PLAYER_DEAD")
  reviveEventFrame:RegisterEvent("PLAYER_ALIVE")
  reviveEventFrame:RegisterEvent("PLAYER_UNGHOST")

  reviveEventFrame:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_DEAD" then
      ma_mm_revivebutton:Show()
    elseif event == "PLAYER_ALIVE" or event == "PLAYER_UNGHOST" then
      ma_mm_revivebutton:Hide()
    end
  end)

  -- Restore saved position
  if AzerothAdmin.db.profile.minimenuPosition then
    ma_minibgframe:ClearAllPoints()
    local pos = AzerothAdmin.db.profile.minimenuPosition
    local freeMove = AzerothAdmin.db.profile.style.minimenuFreeMove
    -- Handle old (string), edge-snap (side/yOffset), and free-move (x/y) formats
    if type(pos) == "string" then
      ma_minibgframe:SetPoint(pos, UIParent, pos, 0, 0)
    elseif freeMove and pos.free and pos.x and pos.y then
      ma_minibgframe:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", pos.x, pos.y)
    elseif pos.side then
      local side = pos.side or "RIGHT"
      local yOffset = pos.yOffset or 0
      ma_minibgframe:SetPoint(side, UIParent, side, 0, yOffset)
    elseif pos.free and pos.x and pos.y then
      -- Free position exists but free move is off: snap to nearest edge from saved coords
      local screenWidth = UIParent:GetWidth()
      local side = (pos.x < screenWidth / 2) and "LEFT" or "RIGHT"
      local yOffset = (pos.y + (ma_minibgframe:GetHeight() / 2)) - (UIParent:GetHeight() / 2)
      ma_minibgframe:SetPoint(side, UIParent, side, 0, yOffset)
    else
      ma_minibgframe:SetPoint("RIGHT", UIParent, "RIGHT", 0, 0)
    end
  end

  -- Apply visibility based on showminimenu setting
  if AzerothAdmin.db.profile.style.showminimenu == false then
    FrameLib:HandleGroup("minimenu", function(frame) frame:Hide() end)
  end
end
