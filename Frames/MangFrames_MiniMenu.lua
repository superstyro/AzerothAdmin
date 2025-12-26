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

  if not AzerothAdmin.db or not AzerothAdmin.db.account or not AzerothAdmin.db.account.style then
    error("AzerothAdmin: Style database not initialized")
    return
  end

  if not ROOT_PATH then
    error("AzerothAdmin: ROOT_PATH not defined")
    return
  end

  local transparency = {
    bg = AzerothAdmin.db.account.style.transparency.backgrounds,
    btn = AzerothAdmin.db.account.style.transparency.buttons,
    frm = AzerothAdmin.db.account.style.transparency.frames
  }
  local color = {
    bg = AzerothAdmin.db.account.style.color.backgrounds,
    btn = AzerothAdmin.db.account.style.color.buttons,
    frm = AzerothAdmin.db.account.style.color.frames
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

  ma_minibgframe:SetScript("OnDragStart", function(self)
    if IsLeftControlKeyDown() then
      self:StartMoving()
    end
  end)

  ma_minibgframe:SetScript("OnDragStop", function(self)
    self:StopMovingOrSizing()

    -- Determine if we should position on left or right
    local screenWidth = UIParent:GetWidth()
    local screenHeight = UIParent:GetHeight()
    local x, y = self:GetCenter()
    local side

    if x < screenWidth / 2 then
      -- Snap to left side
      side = "LEFT"
    else
      -- Snap to right side
      side = "RIGHT"
    end

    -- Calculate offset from center
    local yOffset = y - (screenHeight / 2)

    -- Snap to the edge and save position
    self:ClearAllPoints()
    self:SetPoint(side, UIParent, side, 0, yOffset)

    -- Save position to database (create new table or replace old string)
    AzerothAdmin.db.account.minimenuPosition = {
      side = side,
      yOffset = yOffset
    }
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

  FrameLib:BuildButton({
    name = "ma_mm_logbutton",
    group = "minimenu",
    parent = ma_miniframe,
    texture = {
      name = "ma_mm_logbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 20,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_mm_serverbutton",
      relPos = "BOTTOMLEFT",
      offX = 0,
      offY = -2
    },
    text = Locale["ma_MiniMenuLog"]
  })

  FrameLib:BuildButton({
    name = "ma_mm_whobutton",
    group = "minimenu",
    parent = ma_miniframe,
    texture = {
      name = "ma_mm_whobutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 20,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_mm_logbutton",
      relPos = "BOTTOMLEFT",
      offX = 0,
      offY = -2
    },
    text = Locale["ma_MiniMenuWho"]
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

  ma_mm_logbutton:SetScript("OnClick", function()
    AzerothAdmin:ShowSection("log")
  end)

  ma_mm_whobutton:SetScript("OnClick", function()
    AzerothAdmin:ShowSection("who")
  end)

  -- Make logo button draggable (propagates to parent)
  ma_mm_logoframe:RegisterForDrag("LeftButton")

  ma_mm_logoframe:SetScript("OnDragStart", function(self)
    if IsLeftControlKeyDown() then
      ma_minibgframe:StartMoving()
    end
  end)

  ma_mm_logoframe:SetScript("OnDragStop", function(self)
    ma_minibgframe:StopMovingOrSizing()

    -- Determine if we should position on left or right
    local screenWidth = UIParent:GetWidth()
    local screenHeight = UIParent:GetHeight()
    local x, y = ma_minibgframe:GetCenter()
    local side

    if x < screenWidth / 2 then
      side = "LEFT"
    else
      side = "RIGHT"
    end

    -- Calculate offset from center
    local yOffset = y - (screenHeight / 2)

    -- Snap to the edge and save position
    ma_minibgframe:ClearAllPoints()
    ma_minibgframe:SetPoint(side, UIParent, side, 0, yOffset)

    -- Save position to database
    AzerothAdmin.db.account.minimenuPosition = {
      side = side,
      yOffset = yOffset
    }
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
  if AzerothAdmin.db.account.minimenuPosition then
    ma_minibgframe:ClearAllPoints()
    -- Handle both old (string) and new (table) format
    if type(AzerothAdmin.db.account.minimenuPosition) == "string" then
      -- Old format: just "LEFT" or "RIGHT"
      ma_minibgframe:SetPoint(AzerothAdmin.db.account.minimenuPosition, UIParent, AzerothAdmin.db.account.minimenuPosition, 0, 0)
    else
      -- New format: table with side and yOffset
      local side = AzerothAdmin.db.account.minimenuPosition.side or "RIGHT"
      local yOffset = AzerothAdmin.db.account.minimenuPosition.yOffset or 0
      ma_minibgframe:SetPoint(side, UIParent, side, 0, yOffset)
    end
  end

  -- Apply visibility based on showminimenu setting
  if AzerothAdmin.db.account.style.showminimenu == false then
    FrameLib:HandleGroup("minimenu", function(frame) frame:Hide() end)
  end
end
