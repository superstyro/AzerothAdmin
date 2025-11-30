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

-- ElvUI-style dropdown styling for AzerothAdmin
-- This module applies modern styling to WoW's default dropdown menus

local AzerothAdminDropDownStyle = {}

-- Style constants matching ElvUI aesthetics
local DROPDOWN_STYLE = {
  -- Main dropdown button
  button = {
    bgColor = {0.1, 0.1, 0.1, 0.9},
    borderColor = {0.3, 0.3, 0.3, 1},
    textColor = {1, 1, 1},
    highlightColor = {0.2, 0.5, 0.8, 0.3}
  },
  -- Dropdown menu panel
  menu = {
    bgColor = {0.1, 0.1, 0.1, 0.95},
    borderColor = {0.3, 0.3, 0.3, 1},
    backdropInsets = 3
  },
  -- Menu buttons
  menuButton = {
    textColor = {1, 1, 1},
    highlightColor = {0.2, 0.5, 0.8, 0.3},
    checkedColor = {0.3, 0.6, 1, 0.5}
  }
}

-- Backdrop template for modern look
local MODERN_BACKDROP = {
  bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background-Dark",
  edgeFile = "Interface\\Buttons\\WHITE8X8",
  tile = false,
  tileSize = 16,
  edgeSize = 1,
  insets = {left = 1, right = 1, top = 1, bottom = 1}
}

-- Style a dropdown button (the main clickable part)
function AzerothAdminDropDownStyle:StyleDropDownButton(dropdown)
  if not dropdown then return end

  local dropdownName = dropdown:GetName()
  if not dropdownName then return end

  -- Get the button components
  local button = _G[dropdownName.."Button"]
  local text = _G[dropdownName.."Text"]
  local icon = _G[dropdownName.."Icon"]

  if button then
    -- Hide default textures
    local left = _G[dropdownName.."Left"]
    local middle = _G[dropdownName.."Middle"]
    local right = _G[dropdownName.."Right"]

    if left and left.SetTexture then left:SetTexture(nil) end
    if middle and middle.SetTexture then middle:SetTexture(nil) end
    if right and right.SetTexture then right:SetTexture(nil) end

    -- Create backdrop for button
    if not dropdown.styledBackdrop and dropdown.SetBackdrop then
      dropdown:SetBackdrop(MODERN_BACKDROP)
      if dropdown.SetBackdropColor then
        dropdown:SetBackdropColor(unpack(DROPDOWN_STYLE.button.bgColor))
      end
      if dropdown.SetBackdropBorderColor then
        dropdown:SetBackdropBorderColor(unpack(DROPDOWN_STYLE.button.borderColor))
      end
      dropdown.styledBackdrop = true
    end

    -- Style the arrow button
    if button.SetNormalTexture then button:SetNormalTexture(nil) end
    if button.SetPushedTexture then button:SetPushedTexture(nil) end
    if button.SetHighlightTexture then button:SetHighlightTexture(nil) end
    if button.SetDisabledTexture then button:SetDisabledTexture(nil) end

    -- Create custom arrow
    if not button.arrow and button.CreateFontString then
      button.arrow = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
      if button.arrow then
        button.arrow:SetText("v")
        button.arrow:SetTextColor(0.8, 0.8, 0.8)
        button.arrow:SetPoint("CENTER", button, "CENTER", 10, 0)
      end
    end

    -- Style hover effect
    if not button.hoverTexture and button.CreateTexture then
      button.hoverTexture = button:CreateTexture(nil, "HIGHLIGHT")
      if button.hoverTexture then
        button.hoverTexture:SetAllPoints(dropdown)
        button.hoverTexture:SetTexture(1, 1, 1, 0.1)
      end
    end
  end

  -- Style text
  if text then
    if text.SetTextColor then
      text:SetTextColor(unpack(DROPDOWN_STYLE.button.textColor))
    end
    if text.SetFontObject then
      text:SetFontObject(GameFontNormalLarge)
    end

    -- Reposition text to the left
    if text.ClearAllPoints and text.SetPoint then
      text:ClearAllPoints()
      text:SetPoint("LEFT", dropdown, "LEFT", 5, 0)
      text:SetPoint("RIGHT", button, "LEFT", -2, 0)
      if text.SetJustifyH then
        text:SetJustifyH("LEFT")
      end
    end
  end

  -- Scale down to reduce height
  if dropdown.SetScale then
    dropdown:SetScale(0.85)
  end
end

-- Style the dropdown menu list
function AzerothAdminDropDownStyle:StyleDropDownList(level)
  level = level or 1
  local listFrame = _G["DropDownList"..level]

  if not listFrame then return end

  -- Style the menu backdrop
  if not listFrame.styledBackdrop then
    -- Hide default backdrop elements
    local backdrop = _G["DropDownList"..level.."Backdrop"]
    local menuBackdrop = _G["DropDownList"..level.."MenuBackdrop"]

    if backdrop and backdrop.SetTexture then
      backdrop:SetTexture(nil)
    end
    if menuBackdrop and menuBackdrop.SetTexture then
      menuBackdrop:SetTexture(nil)
    end

    -- Apply modern backdrop
    if listFrame.SetBackdrop then
      listFrame:SetBackdrop(MODERN_BACKDROP)
    end
    if listFrame.SetBackdropColor then
      listFrame:SetBackdropColor(unpack(DROPDOWN_STYLE.menu.bgColor))
    end
    if listFrame.SetBackdropBorderColor then
      listFrame:SetBackdropBorderColor(unpack(DROPDOWN_STYLE.menu.borderColor))
    end

    listFrame.styledBackdrop = true
  end

  -- Style menu buttons
  for i = 1, UIDROPDOWNMENU_MAXBUTTONS do
    local button = _G["DropDownList"..level.."Button"..i]
    if button then
      self:StyleMenuButton(button, level)
    end
  end
end

-- Style individual menu buttons
function AzerothAdminDropDownStyle:StyleMenuButton(button, level)
  if not button or button.styled then return end

  local buttonName = button:GetName()
  if not buttonName then return end

  -- Hide default textures
  local normalTexture = _G[buttonName.."NormalTexture"]
  local highlight = _G[buttonName.."Highlight"]

  if normalTexture and normalTexture.SetTexture then
    normalTexture:SetTexture(nil)
  end

  -- Create modern highlight
  if highlight and highlight.SetTexture then
    highlight:SetTexture(1, 1, 1)
    if highlight.SetVertexColor then
      highlight:SetVertexColor(unpack(DROPDOWN_STYLE.menuButton.highlightColor))
    end
    if highlight.SetAllPoints then
      highlight:SetAllPoints(button)
    end
  end

  -- Style check mark
  local check = _G[buttonName.."Check"]
  if check and check.SetTexture then
    check:SetTexture("Interface\\Buttons\\UI-CheckBox-Check")
    if check.SetVertexColor then
      check:SetVertexColor(0.3, 0.6, 1, 1)
    end
  end

  -- Style uncheck texture
  local uncheck = _G[buttonName.."UnCheck"]
  if uncheck and uncheck.SetTexture then
    uncheck:SetTexture(nil)
  end

  -- Style icon
  local icon = _G[buttonName.."Icon"]
  if icon and icon.SetTexCoord then
    icon:SetTexCoord(0.1, 0.9, 0.1, 0.9) -- Crop icon edges
  end

  -- Style expand arrow
  local expandArrow = _G[buttonName.."ExpandArrow"]
  if expandArrow then
    if expandArrow.SetTexture then
      expandArrow:SetTexture(nil)
    end
    if not expandArrow.text and expandArrow.CreateFontString then
      expandArrow.text = expandArrow:CreateFontString(nil, "OVERLAY", "GameFontNormal")
      if expandArrow.text then
        expandArrow.text:SetText(">")
        expandArrow.text:SetTextColor(0.8, 0.8, 0.8)
        expandArrow.text:SetPoint("CENTER", expandArrow, "CENTER", 0, 0)
      end
    end
  end

  -- Style invisible button
  local invisibleButton = _G[buttonName.."InvisibleButton"]
  if invisibleButton and invisibleButton.SetHighlightTexture then
    invisibleButton:SetHighlightTexture(nil)
  end

  button.styled = true
end

-- Hook into UIDropDownMenu_Initialize to style menus as they're created
local function HookDropDownMenuShow(level)
  AzerothAdminDropDownStyle:StyleDropDownList(level or 1)
end

-- Apply styling to all existing dropdowns
function AzerothAdminDropDownStyle:ApplyToAll()
  -- Hook the menu creation
  hooksecurefunc("UIDropDownMenu_CreateFrames", function(level, index)
    HookDropDownMenuShow(level)
  end)

  -- Also hook when menus are shown
  hooksecurefunc("ToggleDropDownMenu", function(level)
    HookDropDownMenuShow(level or 1)
  end)
end

-- Initialize the styling system
function AzerothAdmin:InitDropDownStyling()
  AzerothAdminDropDownStyle:ApplyToAll()

  -- Style all AzerothAdmin dropdowns on creation
  local dropdowns = {
    "ma_languagedropdown",
    "ma_weatherdropdown",
    "ma_framestratadropdown",
    "ma_reloadtabledropdown",
    "ma_npcemotedropdown",
    "ma_npcemotedropdown_a",
    "ma_learnlangdropdown",
    "ma_modifydropdown",
    "ma_resetdropdown"
  }

  for _, name in ipairs(dropdowns) do
    local dropdown = _G[name]
    if dropdown then
      AzerothAdminDropDownStyle:StyleDropDownButton(dropdown)
    end
  end
end

-- Make the style module globally available
_G.AzerothAdminDropDownStyle = AzerothAdminDropDownStyle
