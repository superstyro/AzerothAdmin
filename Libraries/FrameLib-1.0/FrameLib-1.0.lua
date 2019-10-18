-------------------------------------------------------------------------------------------------------------
--
-- MangAdmin Version 1.0
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
-- Official Forums: http://www.manground.org/forum/
-- GoogleCode Website: http://code.google.com/p/mangadmin/
-- Subversion Repository: http://mangadmin.googlecode.com/svn/
--
-------------------------------------------------------------------------------------------------------------

local MAJOR_VERSION = "FrameLib-1.0"
local MINOR_VERSION = "$Revision: 1 $"

if not AceLibrary then error(MAJOR_VERSION .. " requires AceLibrary.") end
if not AceLibrary:IsNewVersion(MAJOR_VERSION, MINOR_VERSION) then return end

local FrameLib = { group = {} }

--[[ADD FRAME TO GROUP]]
function FrameLib:AddGroupFrame(group, frame)
  if type(self.group[group]) ~= "table" then
    self.group[group] = {}
  end
  tinsert(self.group[group], frame)	
end

--[[HANDLE GROUP]]
function FrameLib:HandleGroup(group, func)
  if group then
    if type(self.group[group]) ~= "table" then
      self:error("No frame group with the name '"..group.."' is available!")
      return
    else
      for k, v in pairs(self.group[group]) do
        func(v)
      end
    end
  else
    self:error("Argument 'group' not given!")
    return
  end
end

--[[BUILD FRAME]]
function FrameLib:BuildFrame(def)
  local frame = CreateFrame(def.type or "Frame", def.name, def.parent, def.inherits)	
  self:AddGroupFrame(def.group, frame)
  
  if def.size then
    if def.size.width then frame:SetWidth(def.size.width) end
    if def.size.height then frame:SetHeight(def.size.height) end
    frame:SetScale(def.size.scale or 1)
  end
  
  if def.hidden then frame:Hide() end
  
  t = def.hitRectInsets
  if t then frame:SetHitRectInsets(t[1] or t.minX or t.left,t[2] or t.maxX or t.right, t[3] or t.maxY or t.top, t[4] or t.minY or t.bottom) end	
  
  t = def.backdrop
  if t then frame:SetBackdrop(t) end	
  
  t = def.backdropColor
  if t then frame:SetBackdropColor(t[1] or t.r,t[2] or t.g, t[3] or t.b,t[4] or t.a) end	
  
  t = def.backdropBorderColor
  if t then frame:SetBackdropBorderColor(t[1] or t.r,t[2] or t.g, t[3] or t.b,t[4] or t.a) end	
  
  --frame:EnableKeyboard(def.enableKeyboard)
  --frame:EnableMouseWheel(def.enableMouseWheel)	
  
  t = def.texture
  if t then
    local texture = frame:CreateTexture(nil, "BACKGROUND")
    if t.color then
      texture:SetTexture(t.color[1] or t.color.r, t.color[2] or t.color.g, t.color[3] or t.color.g, t.color[4] or t.color.a)
    elseif t.file then
      texture:SetTexture(t.file)
    end
    if t.blendMode then
      texture:SetBlendMode(t.blendMode)
    end
    local c = t.coord
    if c then
      if c.minX or c.left then
        texture:SetTexCoord(c.minX or c.left, c.maxX or c.right, c.minY or c.bottom, c.maxY or c.top)
      else
        texture:SetTexCoord(c.ULx, c.ULy, c.LLx, c.LLy, c.URx, c.URy, c.LRx, c.LRy)
      end
    else
      texture:SetAllPoints(frame)
    end
    if t.gradient then
      local min = t.gradient.min
      local max = t.gradient.max
      texture:SetGradientAlpha(t.gradient.orientation, min.r or min[1], min.g or min[2], min.b or min[3], min.a or min[4] or 1, max.r or max[2], max.g or max[2], max.b or max[3], max.a or max[4] or 1)
    end
  end
  
  if def.clear then frame:ClearAllPoints() end
  
  if def.setpoint then
    frame:SetPoint(def.setpoint.pos or "CENTER", def.setpoint.relTo or frame:GetParent() or UIParent, def.setpoint.relPos or def.setpoint.pos or "CENTER", def.setpoint.offX or 0, def.setpoint.offY or 0)
  end
  if def.setpoint2 then
    frame:SetPoint(def.setpoint2.pos or "CENTER", def.setpoint2.relTo or frame:GetParent() or UIParent, def.setpoint2.relPos or def.setpoint2.pos or "CENTER", def.setpoint2.offX or 0, def.setpoint2.offY or 0)
  end
  
  if def.draggable then
    frame:EnableMouse(true)
    frame:SetMovable(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", function() this:StartMoving() end)
    frame:SetScript("OnDragStop", function() this:StopMovingOrSizing() end)
  end	
  
  if def.clickable then
    frame:EnableMouse(true)
  end
  
  t = def.resizable
  if t then
    frame:SetResizable(true)
    t = def.resizableMinBounds
    if t then frame:SetMinResizeBounds(t[1] or t.width,t[2] or t.height) end
    t = def.resizableMaxBounds
    if t then frame:SetMaxResizeBounds(t[1] or t.width,t[2] or t.height) end
  end
  
  t = def.frameStrata
  if t then frame:SetFrameStrata(t) end	
  
  t = def.frameLevel
  if t then frame:SetFrameLevel(t) end	

  if def.id then frame:SetID(def.id) end	
  
  if def.type == "ScrollingMessageFrame" then
    if def.fading then 
      frame:SetFading(true)
      frame:SetFadeDuration(def.fading.duration)
      frame:SetTimeVisible(def.fading.seconds)
    else
      frame:SetFading(nil)
    end
    frame:SetFontObject(def.font or ChatFontNormal)
    frame:SetJustifyH(def.justify.h or "LEFT")
    frame:SetJustifyV(def.justify.v or "TOP")
    frame:SetMaxLines(def.maxLines or 1000000)
  end
  
  if def.type == "Slider" then
    if def.orientation == "HORIZONTAL" then
        frame:SetOrientation("HORIZONTAL")
    elseif def.orientation == "VERTICAL" then
        frame:SetOrientation("VERTICAL")
    end
  end
  
  if def.type == "PlayerModel" then
        frame:SetResizable(false)
  
  end
  
  if def.type == "EditBox" then
    frame:SetAutoFocus(false)
    frame:ClearFocus()
    --frame:SetScript("OnEnter", function() frame:SetFocus() end)
    --frame:SetScript("OnLeave", function() frame:ClearFocus() end)
    frame:SetFontObject(def.fontObj or "ChatFontNormal")
    if def.multiline then frame:SetMultiLine(def.multiline) end
    if def.maxletters then frame:SetMaxLetters(def.maxletters) end
    if def.keyboard then frame:EnableKeyboard(def.keyboard) end
    if def.textcolor then frame:SetTextColor(def.textcolor) end
  end
  
  return frame
end

--[[BUILD BUTTON]]
function FrameLib:BuildButton(def)
  local button = CreateFrame(def.type or "Button", def.name, def.parent, def.inherits)
  self:AddGroupFrame(def.group, button)
  if def.size then
    button:SetWidth(def.size.width or 100)
    button:SetHeight(def.size.height or 100)
  end
  button:SetNormalFontObject(def.NormalFontObject or GameFontNormal)
  button:SetHighlightFontObject(def.HighlightFontObject or GameFontHighlight)
  button:SetDisabledFontObject(def.DisabledFontObject or GameFontDisable)	
  button:ClearAllPoints()
  button:SetPoint(def.setpoint.pos or "CENTER", def.setpoint.relTo or button:GetParent() or UIParent, def.setpoint.relPos or def.setpoint.pos or "CENTER", def.setpoint.offX or 0, def.setpoint.offY or 0)
  t = def.pushedTextOffset 
  if type(t) == "table" then
    button:SetPushedTextOffset(t[1] or t.x or t.xOffset,t[2] or t.y or t.yOffset)
  elseif type(t) == "number" then
    button:SetPushedTextOffset(0,t)
  end
  if def.clicks then button:RegisterForClicks(def.clicks) end
  local t = def.text
  if t then
    if def.type == "CheckButton" and def.inherits == "OptionsCheckButtonTemplate" then
      getglobal(button:GetName().."Text"):SetText(t)
    else
      button:SetText(t)
    end
  end
  t = def.texture
  if t then
    local texture = button:CreateTexture(t.name or nil, "BACKGROUND")
    if t.color then
      texture:SetTexture(t.color[1] or t.color.r, t.color[2] or t.color.g, t.color[3] or t.color.g, t.color[4] or t.color.a)
    elseif t.file then
      texture:SetTexture(t.file)
    end
    if t.blendMode then
      texture:SetBlendMode(t.blendMode)
    end
    local c = t.coord
    if c then
      if c.minX or c.left then
        texture:SetTexCoord(c.minX or c.left, c.maxX or c.right, c.minY or c.bottom, c.maxY or c.top)
      else
        texture:SetTexCoord(c.ULx, c.ULy, c.LLx, c.LLy, c.URx, c.URy, c.LRx, c.LRy)
      end
    else
      texture:SetAllPoints(button)
    end
    if t.gradient then
      local min = t.gradient.min
      local max = t.gradient.max
      texture:SetGradientAlpha(t.gradient.orientation, min.r or min[1], min.g or min[2], min.b or min[3], min.a or min[4] or 1, max.r or max[2], max.g or max[2], max.b or max[3], max.a or max[4] or 1)
    end
  end 
  if def.disabled then button:Disable() end
  t = def.script
  if type(t) == "function" then
    button:SetScript("OnClick", t)
  elseif type(t) == "table" then
    for k,v in pairs(t) do
      button:SetScript(unpack(v))
    end
  elseif type(t) ~= "nil" then
    error("Unreachable Code")
  end
  return button
end

--[[BUILD FONTSTRING]]
function FrameLib:BuildFontString(def)
  local fontstr = def.parent:CreateFontString(def.name, def.level or "ARTWORK", def.object or "GameFontNormal")
  self:AddGroupFrame(def.group, fontstr)
  local t = def.color	
  if t then 
    fontstr:SetTextColor(t.r or t[1], t.g or t[2], t.b or t[3], t.a or t[4] or 1) 
  end	
  if def.setpoint then
    fontstr:ClearAllPoints()
    fontstr:SetPoint(def.setpoint.pos or "CENTER", def.setpoint.relTo or fontstr:GetParent() or UIParent, def.setpoint.relPos or def.setpoint.pos or "CENTER", def.setpoint.offX or 0, def.setpoint.offY or 0)
  else
    fontstr:SetAllPoints()
  end
  t = def.font
  if t then
    fontstr:SetFont(def.object or "GameFontNormal", t.size or 14, t.flags or nil)
  end
  t = def.justifyH
  if t then fontstr:SetJustifyH(def.justifyH) end
  t = def.justifyV
  if t then fontstr:SetJustifyV(def.justfyV) end
  fontstr:SetNonSpaceWrap(def.nonSpaceWrap)	
  t = def.alphaGradient
  if t then fontstr:SetAlphaGradient(def.alphaGradient.start,def.alphaGradient.length) end
  if def.text then fontstr:SetText(def.text) end
  return fontstr
end


--maybe not going--

--[[BUILD TEXTURE]]
function FrameLib:BuildTexture(def)
  local texture = def.parent:CreateTexture(def.name, def.level or "BACKGROUND")
  self:AddGroupFrame(def.group, texture)
  local t = def.file
  if t then texture:SetTexture(t) end
  t = def.blendMode
  if t then texture:SetBlendMode(t) end
  t = def.color	
  if t then texture:SetTexture(t[1] or t.r, t[2] or t.g, t[3] or t.g, t[4] or t.a) end
  local t = def.size
  if t then
    texture:SetWidth(t.width or 100)
    texture:SetHeight(t.height or 100)
  end
  t = def.gradient
  if t then
    local min = t.min
    local max = t.max
    texture:SetGradientAlpha(t.orientation, min.r or min[1], min.g or min[2], min.b or min[3], min.a or min[4] or 1, max.r or max[2], max.g or max[2], max.b or max[3], max.a or max[4] or 1)
  end
  local c = def.texCoord
  if c then
    if c.minX or c.left then
      texture:SetTexCoord(c.minX or c.left, c.maxX or c.right, c.minY or c.bottom, c.maxY or c.top)
    else
      texture:SetTexCoord(c.ULx, c.ULy, c.LLx, c.LLy, c.URx, c.URy, c.LRx, c.LRy)
    end
  end
  texture:ClearAllPoints()
  texture:SetPoint(def.setpoint.pos or "CENTER", def.setpoint.relTo or texture:GetParent() or UIParent, def.setpoint.relPos or def.setpoint.pos or "CENTER", def.setpoint.offX or 0, def.setpoint.offY or 0)
  return texture
end

--[[BUILD EDITBOX]]
function FrameLib:BuildEditBox(def)	
  local editbox = CreateFrame("MessageFrame", def.name, def.parent, "InputBoxTemplate")
  self:AddGroupFrame(def.group, editbox)
  editbox:SetAutoFocus(def.autofocus)
  editbox:SetMaxLetters(def.maxLetters)
  editbox:SetMultiLine(def.multiline)
  local t = def.size
  if t then
    editbox:SetWidth(t.width or 100)
    editbox:SetHeight(t.height or 100)
  end
  editbox:SetPoint(def.setpoint.pos or "CENTER", def.setpoint.relTo or editbox:GetParent() or UIParent, def.setpoint.relPos or def.setpoint.pos or "CENTER", def.setpoint.offX or 0, def.setpoint.offY or 0)
  editbox:CreateFontString(nil, "ARTWORK", def.fontString or "GameFontNormal")
  t = def.text
  if t then	editbox:SetText(t) end
  return editbox
end

-- register this lib
AceLibrary:Register(FrameLib, MAJOR_VERSION, MINOR_VERSION, activate)
FrameLib = nil