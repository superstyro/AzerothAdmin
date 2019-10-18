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

function ApplyStyleChanges()
  if MangAdmin.db.account.style.color.buffer.backgrounds then
    MangAdmin.db.account.style.color.backgrounds = MangAdmin.db.account.style.color.buffer.backgrounds
  end
  if MangAdmin.db.account.style.color.buffer.frames then
    MangAdmin.db.account.style.color.frames = MangAdmin.db.account.style.color.buffer.frames
  end
  if MangAdmin.db.account.style.color.buffer.buttons then
    MangAdmin.db.account.style.color.buttons = MangAdmin.db.account.style.color.buffer.buttons
  end
  if MangAdmin.db.account.style.color.buffer.linkifier then
    MangAdmin.db.account.style.color.linkifier = MangAdmin.db.account.style.color.buffer.linkifier
  end
  if ma_checktransparencybutton:GetChecked() then
    MangAdmin.db.account.style.transparency.backgrounds = 0.5
  else
    MangAdmin.db.account.style.transparency.backgrounds = 1.0
  end
  if ma_checklocalsearchstringsbutton:GetChecked() then
    MangAdmin.db.account.localesearchstring = true
  else
    MangAdmin.db.account.localesearchstring = false
  end
  if ma_showtooltipsbutton:GetChecked() then
    MangAdmin.db.account.style.showtooltips = true
  else
    MangAdmin.db.account.style.showtooltips = false
  end
  if ma_showchatoutputbutton:GetChecked() then
    MangAdmin.db.account.style.showchat = true
  else
    MangAdmin.db.account.style.showchat = false
  end
  if ma_showminimenubutton:GetChecked() then
    MangAdmin.db.account.style.showminimenu = true
  else
    MangAdmin.db.account.style.showminimenu = false
  end
  if ma_delayparam then
    MangAdmin.db.account.style.delayparam = ma_delayparam:GetText()
  else
  end
  ReloadUI()
end

function ShowColorPicker(t)
  if t == "bg" then
    local r,g,b
    if MangAdmin.db.account.style.color.buffer.backgrounds then
      r = MangAdmin.db.account.style.color.buffer.backgrounds.r
      g = MangAdmin.db.account.style.color.buffer.backgrounds.g
      b = MangAdmin.db.account.style.color.buffer.backgrounds.b
    else
      r = MangAdmin.db.account.style.color.backgrounds.r
      g = MangAdmin.db.account.style.color.backgrounds.g
      b = MangAdmin.db.account.style.color.backgrounds.b
    end
    ColorPickerFrame.cancelFunc = function(prev)
      local r,g,b = unpack(prev)
      ma_bgcolorshowbutton_texture:SetTexture(r,g,b)
    end
    ColorPickerFrame.func = function()
      local r,g,b = ColorPickerFrame:GetColorRGB()
      ma_bgcolorshowbutton_texture:SetTexture(r,g,b)
      MangAdmin.db.account.style.color.buffer.backgrounds = {}
      MangAdmin.db.account.style.color.buffer.backgrounds.r = r
      MangAdmin.db.account.style.color.buffer.backgrounds.g = g
      MangAdmin.db.account.style.color.buffer.backgrounds.b = b
    end
    ColorPickerFrame:SetColorRGB(r,g,b)
    ColorPickerFrame.previousValues = {r,g,b}
  elseif t == "frm" then
    local r,g,b
    if MangAdmin.db.account.style.color.buffer.frames then
      r = MangAdmin.db.account.style.color.buffer.frames.r
      g = MangAdmin.db.account.style.color.buffer.frames.g
      b = MangAdmin.db.account.style.color.buffer.frames.b
    else
      r = MangAdmin.db.account.style.color.frames.r
      g = MangAdmin.db.account.style.color.frames.g
      b = MangAdmin.db.account.style.color.frames.b
    end
    ColorPickerFrame.cancelFunc = function(prev)
      local r,g,b = unpack(prev)
      ma_frmcolorshowbutton_texture:SetTexture(r,g,b)
    end
    ColorPickerFrame.func = function()
      local r,g,b = ColorPickerFrame:GetColorRGB()
      ma_frmcolorshowbutton_texture:SetTexture(r,g,b)
      MangAdmin.db.account.style.color.buffer.frames = {}
      MangAdmin.db.account.style.color.buffer.frames.r = r
      MangAdmin.db.account.style.color.buffer.frames.g = g
      MangAdmin.db.account.style.color.buffer.frames.b = b
    end
    ColorPickerFrame:SetColorRGB(r,g,b)
    ColorPickerFrame.previousValues = {r,g,b}
  elseif t == "btn" then
    local r,g,b
    if MangAdmin.db.account.style.color.buffer.buttons then
      r = MangAdmin.db.account.style.color.buffer.buttons.r
      g = MangAdmin.db.account.style.color.buffer.buttons.g
      b = MangAdmin.db.account.style.color.buffer.buttons.b
    else
      r = MangAdmin.db.account.style.color.buttons.r
      g = MangAdmin.db.account.style.color.buttons.g
      b = MangAdmin.db.account.style.color.buttons.b
    end
    ColorPickerFrame.cancelFunc = function(prev)
      local r,g,b = unpack(prev)
      ma_btncolorshowbutton_texture:SetTexture(r,g,b)
    end
    ColorPickerFrame.func = function()
      local r,g,b = ColorPickerFrame:GetColorRGB();
      ma_btncolorshowbutton_texture:SetTexture(r,g,b)
      MangAdmin.db.account.style.color.buffer.buttons = {}
      MangAdmin.db.account.style.color.buffer.buttons.r = r
      MangAdmin.db.account.style.color.buffer.buttons.g = g
      MangAdmin.db.account.style.color.buffer.buttons.b = b
    end
    ColorPickerFrame:SetColorRGB(r,g,b)
    ColorPickerFrame.previousValues = {r,g,b}
  elseif t == "linkifier" then
    local r,g,b
    if MangAdmin.db.account.style.color.buffer.linkifier then
      r = MangAdmin.db.account.style.color.buffer.linkifier.r
      g = MangAdmin.db.account.style.color.buffer.linkifier.g
      b = MangAdmin.db.account.style.color.buffer.linkifier.b
    else
      r = MangAdmin.db.account.style.color.linkifier.r
      g = MangAdmin.db.account.style.color.linkifier.g
      b = MangAdmin.db.account.style.color.linkifier.b
    end
    ColorPickerFrame.cancelFunc = function(prev)
      local r,g,b = unpack(prev)
      ma_linkifiercolorbutton_texture:SetTexture(r,g,b)
    end
    ColorPickerFrame.func = function()
      local r,g,b = ColorPickerFrame:GetColorRGB();
      ma_linkifiercolorbutton_texture:SetTexture(r,g,b)
      MangAdmin.db.account.style.color.buffer.linkifier = {}
      MangAdmin.db.account.style.color.buffer.linkifier.r = r
      MangAdmin.db.account.style.color.buffer.linkifier.g = g
      MangAdmin.db.account.style.color.buffer.linkifier.b = b
    end
    ColorPickerFrame:SetColorRGB(r,g,b)
    ColorPickerFrame.previousValues = {r,g,b}
  end
  ColorPickerFrame.hasOpacity = false
  ColorPickerFrame:Show()
end

function ChangeWeather(status)
  if not (status == "") then
    MangAdmin:ChatMsg(".wchange "..status)
    MangAdmin:LogAction("Changed weather ("..status..").")
  end
end