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
-- Repository: https://gitlab.superstyro.com/superstyro/azerothadmin
-------------------------------------------------------------------------------------------------------------

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
  if ma_checklocalsearchstringsbutton:GetChecked() then
    AzerothAdmin.db.account.localesearchstring = true
  else
    AzerothAdmin.db.account.localesearchstring = false
  end
  if ma_showtooltipsbutton:GetChecked() then
    AzerothAdmin.db.account.style.showtooltips = true
  else
    AzerothAdmin.db.account.style.showtooltips = false
  end
  if ma_showchatoutputbutton:GetChecked() then
    AzerothAdmin.db.account.style.showchat = true
  else
    AzerothAdmin.db.account.style.showchat = false
  end
  if ma_showminimenubutton:GetChecked() then
    AzerothAdmin.db.account.style.showminimenu = true
  else
    AzerothAdmin.db.account.style.showminimenu = false
  end
  if ma_delayparam then
    AzerothAdmin.db.account.style.delayparam = ma_delayparam:GetText()
  else
  end
  ReloadUI()
end

function ShowColorPicker(t)
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
      local r,g,b = ColorPickerFrame:GetColorRGB();
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
      local r,g,b = ColorPickerFrame:GetColorRGB();
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
    AzerothAdmin:LogAction("Changed weather ("..status..").")
  end
end
