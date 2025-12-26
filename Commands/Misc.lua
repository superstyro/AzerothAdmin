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

function ToggleTransparencyCheckbox()
  -- Get the checkbox state and convert to boolean (checkbox returns 1 or nil, not true/false)
  local isChecked = ma_checktransparencybutton:GetChecked() and true or false

  -- Save the setting
  if isChecked then
    AzerothAdmin.db.account.style.transparency.backgrounds = 0.5
  else
    AzerothAdmin.db.account.style.transparency.backgrounds = 1.0
  end

  -- Apply immediately to background frames
  FrameLib:HandleGroup("bg", function(frame)
    if frame.texture then
      frame.texture:SetAlpha(AzerothAdmin.db.account.style.transparency.backgrounds)
    end
  end)

  -- Inform user that a UI reload is needed
  print(Locale["msg_transparency_saved"])
end

function ToggleLocalSearchStringsCheckbox()
  -- Get the checkbox state and convert to boolean (checkbox returns 1 or nil, not true/false)
  local isChecked = ma_checklocalsearchstringsbutton:GetChecked() and true or false

  -- Save the setting immediately
  AzerothAdmin.db.account.localesearchstring = isChecked

  -- Inform user that a UI reload is needed
  print(Locale["msg_localsearch_saved"])
end

function ToggleMinimenuCheckbox()
  -- Get the checkbox state and convert to boolean (checkbox returns 1 or nil, not true/false)
  local isChecked = ma_showminimenubutton:GetChecked() and true or false

  -- Save the setting
  AzerothAdmin.db.account.style.showminimenu = isChecked

  -- Toggle visibility immediately
  if isChecked then
    FrameLib:HandleGroup("minimenu", function(frame) frame:Show() end)
  else
    FrameLib:HandleGroup("minimenu", function(frame) frame:Hide() end)
  end

  print(Locale["msg_minimenu_saved"])
end

function ToggleTooltipsCheckbox()
  -- Get the checkbox state and convert to boolean (checkbox returns 1 or nil, not true/false)
  local isChecked = ma_showtooltipsbutton:GetChecked() and true or false

  -- Save the setting immediately
  AzerothAdmin.db.account.style.showtooltips = isChecked

  -- Inform user that a UI reload is needed
  print(Locale["msg_tooltip_saved"])
end

function ToggleShowChatOutputCheckbox()
  -- Get the checkbox state and convert to boolean (checkbox returns 1 or nil, not true/false)
  local isChecked = ma_showchatoutputbutton:GetChecked() and true or false

  -- Save the setting immediately
  AzerothAdmin.db.account.style.showchat = isChecked

  print(Locale["msg_chatoutput_saved"])
end

function UpdateChanges()
  if AzerothAdmin.db.account.style.color.buffer.backgrounds then
    AzerothAdmin.db.account.style.color.backgrounds = AzerothAdmin.db.account.style.color.buffer.backgrounds
  end
  if AzerothAdmin.db.account.style.color.buffer.frames then
    AzerothAdmin.db.account.style.color.frames = AzerothAdmin.db.account.style.color.buffer.frames
  end
  if AzerothAdmin.db.account.style.color.buffer.buttons then
    AzerothAdmin.db.account.style.color.buttons = AzerothAdmin.db.account.style.color.buffer.buttons
  end
  if AzerothAdmin.db.account.style.color.buffer.linkifier then
    AzerothAdmin.db.account.style.color.linkifier = AzerothAdmin.db.account.style.color.buffer.linkifier
  end
  if ma_checktransparencybutton:GetChecked() then
    AzerothAdmin.db.account.style.transparency.backgrounds = 0.5
  else
    AzerothAdmin.db.account.style.transparency.backgrounds = 1.0
  end
  AzerothAdmin.db.account.localesearchstring = ma_checklocalsearchstringsbutton:GetChecked()
  AzerothAdmin.db.account.style.showtooltips = ma_showtooltipsbutton:GetChecked()
  AzerothAdmin.db.account.style.showchat = ma_showchatoutputbutton:GetChecked()
  AzerothAdmin.db.account.style.showminimenu = ma_showminimenubutton:GetChecked()
  if ma_delayparam then
    AzerothAdmin.db.account.style.delayparam = ma_delayparam:GetText()
  end
  ReloadUI()
end

-- Protection function that wraps color picker child elements
local function ProtectColorPickerFromElvUI()
  local boxes = {"ColorPPBoxR", "ColorPPBoxG", "ColorPPBoxB", "ColorPPBoxA", "ColorPPBoxH"}

  for _, boxName in ipairs(boxes) do
    local box = _G[boxName]
    if box and not box.SetFormattedText then
      -- Create a working SetFormattedText that delegates to SetText
      box.SetFormattedText = function(self, formatString, ...)
        if self.SetText then
          -- Format the string and pass it to SetText
          local text = string.format(formatString, ...)
          self:SetText(text)
        end
      end
    end
  end
end

function ShowColorPicker(t)
  -- Hook the ColorPickerFrame's OnShow to protect against ElvUI
  if not ColorPickerFrame.elvUIProtectionHooked then
    ColorPickerFrame:HookScript("OnShow", function()
      ProtectColorPickerFromElvUI()
    end)
    ColorPickerFrame.elvUIProtectionHooked = true
  end

  -- Also protect immediately in case boxes already exist
  ProtectColorPickerFromElvUI()

  if t == "bg" then
    local r,g,b
    if AzerothAdmin.db.account.style.color.buffer.backgrounds then
      r = AzerothAdmin.db.account.style.color.buffer.backgrounds.r
      g = AzerothAdmin.db.account.style.color.buffer.backgrounds.g
      b = AzerothAdmin.db.account.style.color.buffer.backgrounds.b
    else
      r = AzerothAdmin.db.account.style.color.backgrounds.r
      g = AzerothAdmin.db.account.style.color.backgrounds.g
      b = AzerothAdmin.db.account.style.color.backgrounds.b
    end
    ColorPickerFrame.cancelFunc = function(prev)
      local r,g,b = unpack(prev)
      ma_bgcolorshowbutton_texture:SetTexture(r,g,b)
    end
    ColorPickerFrame.func = function()
      local r,g,b = ColorPickerFrame:GetColorRGB()
      ma_bgcolorshowbutton_texture:SetTexture(r,g,b)
      AzerothAdmin.db.account.style.color.buffer.backgrounds = {}
      AzerothAdmin.db.account.style.color.buffer.backgrounds.r = r
      AzerothAdmin.db.account.style.color.buffer.backgrounds.g = g
      AzerothAdmin.db.account.style.color.buffer.backgrounds.b = b
    end
    ColorPickerFrame:SetColorRGB(r,g,b)
    ColorPickerFrame.previousValues = {r,g,b}
  elseif t == "frm" then
    local r,g,b
    if AzerothAdmin.db.account.style.color.buffer.frames then
      r = AzerothAdmin.db.account.style.color.buffer.frames.r
      g = AzerothAdmin.db.account.style.color.buffer.frames.g
      b = AzerothAdmin.db.account.style.color.buffer.frames.b
    else
      r = AzerothAdmin.db.account.style.color.frames.r
      g = AzerothAdmin.db.account.style.color.frames.g
      b = AzerothAdmin.db.account.style.color.frames.b
    end
    ColorPickerFrame.cancelFunc = function(prev)
      local r,g,b = unpack(prev)
      ma_frmcolorshowbutton_texture:SetTexture(r,g,b)
    end
    ColorPickerFrame.func = function()
      local r,g,b = ColorPickerFrame:GetColorRGB()
      ma_frmcolorshowbutton_texture:SetTexture(r,g,b)
      AzerothAdmin.db.account.style.color.buffer.frames = {}
      AzerothAdmin.db.account.style.color.buffer.frames.r = r
      AzerothAdmin.db.account.style.color.buffer.frames.g = g
      AzerothAdmin.db.account.style.color.buffer.frames.b = b
    end
    ColorPickerFrame:SetColorRGB(r,g,b)
    ColorPickerFrame.previousValues = {r,g,b}
  elseif t == "btn" then
    local r,g,b
    if AzerothAdmin.db.account.style.color.buffer.buttons then
      r = AzerothAdmin.db.account.style.color.buffer.buttons.r
      g = AzerothAdmin.db.account.style.color.buffer.buttons.g
      b = AzerothAdmin.db.account.style.color.buffer.buttons.b
    else
      r = AzerothAdmin.db.account.style.color.buttons.r
      g = AzerothAdmin.db.account.style.color.buttons.g
      b = AzerothAdmin.db.account.style.color.buttons.b
    end
    ColorPickerFrame.cancelFunc = function(prev)
      local r,g,b = unpack(prev)
      ma_btncolorshowbutton_texture:SetTexture(r,g,b)
    end
    ColorPickerFrame.func = function()
      local r,g,b = ColorPickerFrame:GetColorRGB()
      ma_btncolorshowbutton_texture:SetTexture(r,g,b)
      AzerothAdmin.db.account.style.color.buffer.buttons = {}
      AzerothAdmin.db.account.style.color.buffer.buttons.r = r
      AzerothAdmin.db.account.style.color.buffer.buttons.g = g
      AzerothAdmin.db.account.style.color.buffer.buttons.b = b
    end
    ColorPickerFrame:SetColorRGB(r,g,b)
    ColorPickerFrame.previousValues = {r,g,b}
  elseif t == "linkifier" then
    local r,g,b
    if AzerothAdmin.db.account.style.color.buffer.linkifier then
      r = AzerothAdmin.db.account.style.color.buffer.linkifier.r
      g = AzerothAdmin.db.account.style.color.buffer.linkifier.g
      b = AzerothAdmin.db.account.style.color.buffer.linkifier.b
    else
      r = AzerothAdmin.db.account.style.color.linkifier.r
      g = AzerothAdmin.db.account.style.color.linkifier.g
      b = AzerothAdmin.db.account.style.color.linkifier.b
    end
    ColorPickerFrame.cancelFunc = function(prev)
      local r,g,b = unpack(prev)
      ma_linkifiercolorbutton_texture:SetTexture(r,g,b)
    end
    ColorPickerFrame.func = function()
      local r,g,b = ColorPickerFrame:GetColorRGB()
      ma_linkifiercolorbutton_texture:SetTexture(r,g,b)
      AzerothAdmin.db.account.style.color.buffer.linkifier = {}
      AzerothAdmin.db.account.style.color.buffer.linkifier.r = r
      AzerothAdmin.db.account.style.color.buffer.linkifier.g = g
      AzerothAdmin.db.account.style.color.buffer.linkifier.b = b
    end
    ColorPickerFrame:SetColorRGB(r,g,b)
    ColorPickerFrame.previousValues = {r,g,b}
  end
  ColorPickerFrame.hasOpacity = false
  ColorPickerFrame:Show()
end

function ChangeWeather(status)
  if not (status == "") then
    AzerothAdmin:ChatMsg(".wchange "..status)
  end
end
