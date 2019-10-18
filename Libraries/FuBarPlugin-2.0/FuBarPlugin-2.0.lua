--[[
Name: FuBarPlugin-2.0
Revision: $Rev: 48629 $
Author: Cameron Kenneth Knight (ckknight@gmail.com)
Website: http://wiki.wowace.com/index.php/FuBarPlugin-2.0
Documentation: http://wiki.wowace.com/index.php/FuBarPlugin-2.0
SVN: svn://svn.wowace.com/wowace/trunk/FuBarPlugin-2.0/FuBarPlugin-2.0/
Description: Plugin for FuBar.
Dependencies: AceLibrary, AceOO-2.0, AceEvent-2.0, (optional) Tablet-2.0, Dewdrop-2.0
License: LGPL v2.1

Notes: When embeding this library, FuBar should be set as an optional dependency.
]]

local MAJOR_VERSION = "FuBarPlugin-2.0"
local MINIMAPCONTAINER_MAJOR_VERSION = "FuBarPlugin-MinimapContainer-2.0"
local MINOR_VERSION = "$Revision: 48629 $"

-- This ensures the code is only executed if the libary doesn't already exist, or is a newer version
if not AceLibrary then error(MAJOR_VERSION .. " requires AceLibrary.") end
if not AceLibrary:IsNewVersion(MAJOR_VERSION, MINOR_VERSION) then return end

if not AceLibrary:HasInstance("AceOO-2.0") then error(MAJOR_VERSION .. " requires AceOO-2.0.") end

local AceEvent = AceLibrary:HasInstance("AceEvent-2.0") and AceLibrary("AceEvent-2.0")
local Tablet = AceLibrary:HasInstance("Tablet-2.0") and AceLibrary("Tablet-2.0")
local Dewdrop = AceLibrary:HasInstance("Dewdrop-2.0") and AceLibrary("Dewdrop-2.0")
local AceAddon

local epsilon = 1e-5
local _G = getfenv(0)

local SHOW_ICON = "Show icon"
local SHOW_ICON_DESC = "Show the plugins icon on the panel."
local SHOW_TEXT = "Show text"
local SHOW_TEXT_DESC = "Show the plugins text on the panel."
local SHOW_COLORED_TEXT = "Show colored text"
local SHOW_COLORED_TEXT_DESC = "Allow the plugin to color its text."
local DETACH_TOOLTIP = "Detach tooltip"
local DETACH_TOOLTIP_DESC = "Detach the tooltip from the panel."
local LOCK_TOOLTIP = "Lock tooltip"
local LOCK_TOOLTIP_DESC = "Lock the tooltips position. When the tooltip is locked, you must use Alt to access it with your mouse."
local POSITION = "Position"
local POSITION_DESC = "Position the plugin on the panel."
local POSITION_LEFT = "Left"
local POSITION_RIGHT = "Right"
local POSITION_CENTER = "Center"
local ATTACH_TO_MINIMAP = "Attach to minimap"
local ATTACH_TO_MINIMAP_DESC = "Attach the plugin to the minimap instead of the panel."
local HIDE_FUBAR_PLUGIN = "Hide plugin"
local HIDE_FUBAR_PLUGIN_CMD = "Hidden"
local HIDE_FUBAR_PLUGIN_DESC = "Hide the plugin from the panel or minimap, leaving the addon running."
local OTHER = "Other"
local CLOSE = "Close"
local CLOSE_DESC = "Close the menu."

if GetLocale() == "koKR" then
	SHOW_ICON = "아이콘 표시"
	SHOW_ICON_DESC = "패널에 플러그인 아이콘을 표시합니다."
	SHOW_TEXT = "텍스트 표시"
	SHOW_TEXT_DESC = "페널에 플러그인 텍스트를 표시합니다."
	SHOW_COLORED_TEXT = "색상화된 텍스트 표시"
	SHOW_COLORED_TEXT_DESC = "플러그인의 텍스트 색상을 허용합니다."
	DETACH_TOOLTIP = "툴팁 분리"
	DETACH_TOOLTIP_DESC = "패널에서 툴팁을 분리 합니다."
	LOCK_TOOLTIP = "툴팁 고정"
	LOCK_TOOLTIP_DESC = "툴팁 위치를 고정합니다."
	POSITION = "위치"
	POSITION_DESC = "패널에서 플러그인의 위치를 설정합니다."
	POSITION_LEFT = "왼쪽"
	POSITION_RIGHT = "오른쪽"
	POSITION_CENTER = "가운데"
	ATTACH_TO_MINIMAP = "미니맵에 표시"
	ATTACH_TO_MINIMAP_DESC = "플러그인을 패널 대신 미니맵에 표시합니다."
	HIDE_FUBAR_PLUGIN = "FuBar 플러그인 숨기기"
	HIDE_FUBAR_PLUGIN_CMD = "숨겨짐"
	HIDE_FUBAR_PLUGIN_DESC = "패널에서 플러그인을 숨깁니다."
	OTHER = "기타"
	CLOSE = "닫기"
	CLOSE_DESC = "메뉴 닫기."
elseif GetLocale() == "deDE" then
	SHOW_ICON = "Zeige Icon"
	SHOW_ICON_DESC = "Zeige das Plugin-Icon auf der Leiste."
	SHOW_TEXT = "Zeige Text"
	SHOW_TEXT_DESC = "Zeige den Plugin-Text auf der Leiste."
	SHOW_COLORED_TEXT = "Zeige gef\195\164rbten Text"
	SHOW_COLORED_TEXT_DESC = "Dem Plugin erlauben sein Text zu f\195\164rben."
	DETACH_TOOLTIP = "Tooltip l\195\182sen"
	DETACH_TOOLTIP_DESC = "Tooltip von der Leiste l\195\182sen."
	LOCK_TOOLTIP = "Tooltip sperren"
	LOCK_TOOLTIP_DESC = "Tooltip an der Position sperren."
	POSITION = "Position"
	POSITION_DESC = "Positioniert das Plugin auf der Leiste."
	POSITION_LEFT = "Links"
	POSITION_RIGHT = "Rechts"
	POSITION_CENTER = "Mitte"
	ATTACH_TO_MINIMAP = "An der Minimap anbringen"
	ATTACH_TO_MINIMAP_DESC = "Bringt das Plugin an der Minimap anstelle der Leiste an."
	HIDE_FUBAR_PLUGIN = "Versteckt das FuBar Plugin"
	HIDE_FUBAR_PLUGIN_CMD = "Verstecken"
	HIDE_FUBAR_PLUGIN_DESC = "Versteckt das Plugin von der Leiste."
	CLOSE = "Schlie\195\159en"
	CLOSE_DESC = "Men\195\188 schlie\195\159en."
elseif GetLocale() == "frFR" then
	SHOW_ICON = "Afficher l'ic\195\180ne"
	SHOW_ICON_DESC = "Afficher l'ic\195\180ne du plugin sur le panneau."
	SHOW_TEXT = "Afficher le texte"
	SHOW_TEXT_DESC = "Afficher le texte du plugin sur le panneau."
	SHOW_COLORED_TEXT = "Afficher la couleur du texte"
	SHOW_COLORED_TEXT_DESC = "Permet au plugin de colorer le texte."
	DETACH_TOOLTIP = "D\195\169tacher le tooltip"
	DETACH_TOOLTIP_DESC = "Permet de d\195\169tacher le tooltip du panneau."
	LOCK_TOOLTIP = "Bloquer le tooltip"
	LOCK_TOOLTIP_DESC = "Permet de bloquer le tooltip \195\160 sa position actuelle. Une fois le tooltip bloqu\195\169, vous devez utiliser la touche Alt pour le d\195\169placer avec votre souris."
	POSITION = "Position"
	POSITION_DESC = "Permet de changer la position du plugin dans le panneau."
	POSITION_LEFT = "Gauche"
	POSITION_RIGHT = "Droite"
	POSITION_CENTER = "Centre"
	ATTACH_TO_MINIMAP = "Attacher \195\160 la minicarte"
	ATTACH_TO_MINIMAP_DESC = "Attache l'ic\195\180ne du plugin \195\160 la minicarte."
	HIDE_FUBAR_PLUGIN = "Masquer le plugin"
	HIDE_FUBAR_PLUGIN_CMD = "Masqu\195\169"
	HIDE_FUBAR_PLUGIN_DESC = "Permet de masquer compl\195\168tement le plugin du panneau, mais laisse l'addon fonctionner."
	OTHER = "Autre"
	CLOSE = "Fermer"
	CLOSE_DESC = "Ferme le menu."
elseif GetLocale() == "zhCN" then
	SHOW_ICON = "显示图标"
	SHOW_ICON_DESC = "在面板上显示插件图标."
	SHOW_TEXT = "显示文字"
	SHOW_TEXT_DESC = "在面板上显示文字标题."
	SHOW_COLORED_TEXT = "显示彩色文字"
	SHOW_COLORED_TEXT_DESC = "允许插件显示彩色文字."
	DETACH_TOOLTIP = "独立提示信息"
	DETACH_TOOLTIP_DESC = "从面板上独立提示信息."
	LOCK_TOOLTIP = "锁定提示信息"
	LOCK_TOOLTIP_DESC = "锁定提示信息位置."
	POSITION = "位置"
	POSITION_DESC = "插件在面板上的位置."
	POSITION_LEFT = "居左"
	POSITION_RIGHT = "居右"
	POSITION_CENTER = "居中"
	ATTACH_TO_MINIMAP = "依附在小地图"
	ATTACH_TO_MINIMAP_DESC = "插件图标依附在小地图而不显示在面板上."
	HIDE_FUBAR_PLUGIN = "隐藏FuBar插件"
	HIDE_FUBAR_PLUGIN_CMD = "Hidden"
	HIDE_FUBAR_PLUGIN_DESC = "在面板上隐藏该插件."
elseif GetLocale() == "zhTW" then
	SHOW_ICON = "顯示圖示"
	SHOW_ICON_DESC = "在面板上顯示插件圖示。"
	SHOW_TEXT = "顯示文字"
	SHOW_TEXT_DESC = "在面板上顯示文字。"
	SHOW_COLORED_TEXT = "顯示彩色文字"
	SHOW_COLORED_TEXT_DESC = "允許插件顯示彩色文字。"
	DETACH_TOOLTIP = "獨立提示訊息"
	DETACH_TOOLTIP_DESC = "從面板上獨立提示訊息。"
	LOCK_TOOLTIP = "鎖定提示訊息"
	LOCK_TOOLTIP_DESC = "鎖定提示訊息位置。當提示訊息鎖定時，需要用Alt鍵使用提示訊息的功能。"
	POSITION = "位置"
	POSITION_DESC = "插件在面板上的位置。"
	POSITION_LEFT = "靠左"
	POSITION_RIGHT = "靠右"
	POSITION_CENTER = "置中"
	ATTACH_TO_MINIMAP = "依附在小地圖"
	ATTACH_TO_MINIMAP_DESC = "插件圖標依附在小地圖而不顯示在面板上。"
	HIDE_FUBAR_PLUGIN = "隱藏插件"
	HIDE_FUBAR_PLUGIN_CMD = "隱藏"
	HIDE_FUBAR_PLUGIN_DESC = "在面板上隱藏該插件，但保持運行狀態。"
	OTHER = "其他"
	CLOSE = "關閉"
	CLOSE_DESC = "關閉選單。"
elseif GetLocale() == "esES" then
	SHOW_ICON = "Mostrar icono"
	SHOW_ICON_DESC = "Muestra el icono del plugin en el panel"
	SHOW_TEXT = "Mostrar texto"
	SHOW_TEXT_DESC = "Muestra el texto del plugin en el panel"
	SHOW_COLORED_TEXT = "Mostrar el texto en color"
	SHOW_COLORED_TEXT_DESC = "Permite al plugin colorear su texto"
	DETACH_TOOLTIP = "Separar tooltip"
	DETACH_TOOLTIP_DESC = "Separa el tooltip del panel"
	LOCK_TOOLTIP = "Bloquear tooltip"
	LOCK_TOOLTIP_DESC = "Bloquea la posici\195\179n de los tooltips. Cuando el tooltip est\195\161 bloqueado debes usar Alt para acceder a \195\169l con el rat\195\179n"
	POSITION = "Posici\195\179n"
	POSITION_DESC = "Posici\195\179n del plugin en el panel"
	POSITION_LEFT = "Izquierda"
	POSITION_RIGHT = "Derecha"
	POSITION_CENTER = "Centro"
	ATTACH_TO_MINIMAP = "Adjuntar al minimapa"
	ATTACH_TO_MINIMAP_DESC = "Adjunta el plugin al minimapa en vez de al panel."
	HIDE_FUBAR_PLUGIN = "Ocultar plugin"
	HIDE_FUBAR_PLUGIN_CMD = "Oculto"
	HIDE_FUBAR_PLUGIN_DESC = "Oculta el plugin del panel o minimapa, dejando el accesorio funcionando."
	OTHER = "Otros"
	CLOSE = "Cerrar"
	CLOSE_DESC = "Cierra el men\195\186."
end

local AceOO = AceLibrary("AceOO-2.0")
local FuBarPlugin = AceOO.Mixin {
	"GetTitle",
	"GetName",
	"GetCategory",
	"SetFontSize",
	"GetFrame",
	"Show",
	"Hide",
	"GetPanel",
	"IsTextColored",
	"ToggleTextColored",
	"IsMinimapAttached",
	"ToggleMinimapAttached",
	"Update",
	"UpdateDisplay",
	"UpdateData",
	"UpdateText",
	"UpdateTooltip",
	"SetIcon",
	"GetIcon",
	"CheckWidth",
	"SetText",
	"GetText",
	"IsIconShown",
	"ToggleIconShown",
	"ShowIcon",
	"HideIcon",
	"IsTextShown",
	"ToggleTextShown",
	"ShowText",
	"HideText",
	"IsTooltipDetached",
	"ToggleTooltipDetached",
	"DetachTooltip",
	"ReattachTooltip",
	"GetDefaultPosition",
	"SetPanel",
	"IsLoadOnDemand",
	"IsDisabled",
	"CreateBasicPluginFrame",
	"CreatePluginChildFrame",
	"OpenMenu",
	"AddImpliedMenuOptions",
}
local MinimapContainer

local good = nil
local function CheckFuBar()
	if not good then
		good = FuBar and tonumber(FuBar.version:sub(1, 3)) and tonumber(FuBar.version:sub(1, 3)) >= 2 and true
	end
	return good
end

function FuBarPlugin:GetTitle()
	local name = self.title or self.name
	if not name then
		FuBarPlugin:error("You must provide self.title or self.name")
	end
	local title = select(3, name:find("FuBar %- (.-)%s*$"))
	if not title then
		title = name
	end
	return title:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", "")
end

function FuBarPlugin:GetName()
	return self.name
end

function FuBarPlugin:GetCategory()
	return self.category or OTHER
end

function FuBarPlugin:GetFrame()
	return self.frame
end

function FuBarPlugin:GetPanel()
	return self.panel
end

function FuBarPlugin:IsTextColored()
	return not self.db or not self.db.profile or not self.db.profile.uncolored
end

function FuBarPlugin:ToggleTextColored()
	if not self.db then
		FuBarPlugin:error("Cannot change text color if self.db is not available. (" .. self:GetTitle() .. ")")
	end
	self.db.profile.uncolored = not self.db.profile.uncolored or nil
	self:UpdateText()
end

function FuBarPlugin:ToggleMinimapAttached()
	if CheckFuBar() and not self.cannotAttachToMinimap then
		local value = self:IsMinimapAttached()
		if value then
			if self.panel then
				self.panel:RemovePlugin(self)
			end
			if self.defaultPosition == "MINIMAP" then
				FuBar:GetPanel(1):AddPlugin(self, nil, "LEFT")
			else
				FuBar:GetPanel(1):AddPlugin(self, nil, self.defaultPosition)
			end
		else
			if self.panel then
				self.panel:RemovePlugin(self)
			end
			MinimapContainer:AddPlugin(self)
		end
	end
	Dewdrop:Close()
end

function FuBarPlugin:IsMinimapAttached()
	if not CheckFuBar() then
		return true
	end
	return self.panel == MinimapContainer
end

function FuBarPlugin:Update()
	self:UpdateData()
	self:UpdateText()
	self:UpdateTooltip()
end

function FuBarPlugin:UpdateDisplay()
	self:UpdateText()
	self:UpdateTooltip()
end

function FuBarPlugin:UpdateData()
	if type(self.OnDataUpdate) == "function" then
		if not self:IsDisabled() then
			self:OnDataUpdate()
		end
	end
end

function FuBarPlugin:UpdateText()
	if type(self.OnTextUpdate) == "function" then
		if not self:IsDisabled() then
			self:OnTextUpdate()
		end
	elseif self:IsTextShown() then
		self:SetText(self:GetTitle())
	end
end

function FuBarPlugin:RegisterTablet()
	if self.blizzardTooltip or self.overrideTooltip or not Tablet then
		return
	end

	if not Tablet:IsRegistered(self.frame) then
		if self.db and self.db.profile and not self.db.profile.detachedTooltip then
			self.db.profile.detachedTooltip = {}
		end
		Tablet:Register(self.frame,
			'children', function()
				Tablet:SetTitle(self:GetTitle())
				if type(self.OnTooltipUpdate) == "function" then
					if not self:IsDisabled() then
						self:OnTooltipUpdate()
					end
				end
			end,
			'clickable', self.clickableTooltip,
			'data', CheckFuBar() and FuBar.db.profile.tooltip or self.db and self.db.profile.detachedTooltip or {},
			'detachedData', self.db and self.db.profile.detachedTooltip or {},
			'point', function(frame)
				if frame:GetTop() > GetScreenHeight() / 2 then
					local x = frame:GetCenter()
					if x < GetScreenWidth() / 3 then
						return "TOPLEFT", "BOTTOMLEFT"
					elseif x < GetScreenWidth() * 2 / 3 then
						return "TOP", "BOTTOM"
					else
						return "TOPRIGHT", "BOTTOMRIGHT"
					end
				else
					local x = frame:GetCenter()
					if x < GetScreenWidth() / 3 then
						return "BOTTOMLEFT", "TOPLEFT"
					elseif x < GetScreenWidth() * 2 / 3 then
						return "BOTTOM", "TOP"
					else
						return "BOTTOMRIGHT", "TOPRIGHT"
					end
				end
			end,
			'menu', self.OnMenuRequest and function(level, value, valueN_1, valueN_2, valueN_3, valueN_4)
				if level == 1 then
					local name = tostring(self)
					if not name:find('^table:') then
						name = name:gsub("|c%x%x%x%x%x%x%x%x(.-)|r", "%1")
						Dewdrop:AddLine(
							'text', name,
							'isTitle', true
						)
					end
				end
				if type(self.OnMenuRequest) == "function" then
					self:OnMenuRequest(level, value, true, valueN_1, valueN_2, valueN_3, valueN_4)
				elseif type(self.OnMenuRequest) == "table" then
					Dewdrop:FeedAceOptionsTable(self.OnMenuRequest)
				end
			end,
			'hideWhenEmpty', self.tooltipHiddenWhenEmpty
		)
		local func = self.frame:GetScript("OnEnter")
		local function newFunc(...)
			func(...)

			if FuBar and FuBar.IsHidingTooltipsInCombat and FuBar:IsHidingTooltipsInCombat() and InCombatLockdown() then
				local frame = this.self.frame
				if self.blizzardTooltip then
					if GameTooltip:IsOwned(self:IsMinimapAttached() and self.minimapFrame or self.frame) then
						GameTooltip:Hide()
					end
				elseif self.overrideTooltip and type(self.CloseTooltip) == "function" then
					self:CloseTooltip()
				elseif not self.overrideTooltip and Tablet and Tablet:IsAttached(frame) then
					Tablet:Close(frame)
				end
			end
		end
		self.frame:SetScript("OnEnter", newFunc)
	end
end

function FuBarPlugin:UpdateTooltip()
	if self.blizzardTooltip then
		if GameTooltip:IsOwned(self:IsMinimapAttached() and self.minimapFrame or self.frame) then
			GameTooltip:Hide()
			
			local frame = self:IsMinimapAttached() and self.minimapFrame or self.frame
			local anchor
			if frame:GetTop() > GetScreenHeight() / 2 then
				local x = frame:GetCenter()
				if x < GetScreenWidth() / 2 then
					anchor = "ANCHOR_BOTTOMRIGHT"
				else
					anchor = "ANCHOR_BOTTOMLEFT"
				end
			else
				local x = frame:GetCenter()
				if x < GetScreenWidth() / 2 then
					anchor = "ANCHOR_TOPLEFT"
				else
					anchor = "ANCHOR_TOPRIGHT"
				end
			end
			GameTooltip:SetOwner(frame, anchor)
			if type(self.OnTooltipUpdate) == "function" and not self:IsDisabled() then
				self:OnTooltipUpdate()
			end
			GameTooltip:Show()
		end
		return
	elseif self.overrideTooltip then
		if type(self.OnTooltipUpdate) == "function" and not self:IsDisabled() then
			self:OnTooltipUpdate()
		end
		return
	end
	if not Tablet then return end

	FuBarPlugin.RegisterTablet(self)
	if self:IsMinimapAttached() and not self:IsTooltipDetached() and self.minimapFrame then
		Tablet:Refresh(self.minimapFrame)
	else
		Tablet:Refresh(self.frame)
	end
end

function FuBarPlugin:OnProfileEnable()
	self:Update()
end

function FuBarPlugin:Show(panelId)
	if self.frame:IsShown() or (self.minimapFrame and self.minimapFrame:IsShown()) then
		return
	end
	if panelId ~= false then
		if self.db then
			self.db.profile.hidden = nil
		end
	end
	if self.IsActive and not self:IsActive() then
		self.panelIdTmp = panelId
		self:ToggleActive()
		self.panelIdTmp = nil
		if self.db then
			self.db.profile.disabled = nil
		end
	elseif not self.db or not self.db.profile.hidden then
		if panelId == 0 or not CheckFuBar() then
			MinimapContainer:AddPlugin(self)
		else
			FuBar:ShowPlugin(self, panelId or self.panelIdTmp)
		end
		if not self.userDefinedFrame then
			if not self:IsTextShown() then
				self.textFrame:SetText("")
				self.textFrame:SetWidth(epsilon)
				self.textFrame:Hide()
			end
			if not self:IsIconShown() then
				self.iconFrame:SetWidth(epsilon)
				self.iconFrame:Hide()
			end
		end
		if AceOO.inherits(self, "AceAddon-2.0") then
			if not AceAddon then
				AceAddon = AceLibrary("AceAddon-2.0")
			end
			if AceAddon.addonsEnabled and not AceAddon.addonsEnabled[self] then
				return
			end
		end
		self:Update()
	end
end

function FuBarPlugin:Hide(check)
	if not self.frame:IsShown() and (not self.minimapFrame or not self.minimapFrame:IsShown()) then
		return
	end
	if self.hideWithoutStandby and self.db and check ~= false then
		self.db.profile.hidden = true
	end
	if not self.hideWithoutStandby then
		if self.db and not self.overrideTooltip and not self.blizzardTooltip and not self.cannotDetachTooltip and self:IsTooltipDetached() and self.db.profile.detachedTooltip and self.db.profile.detachedTooltip.detached then
			self:ReattachTooltip()
			self.db.profile.detachedTooltip.detached = true
		end
		if self.IsActive and self:IsActive() and self.ToggleActive and (not CheckFuBar() or not FuBar:IsChangingProfile()) then
			self:ToggleActive()
		end
	end
	if self.panel then
		self.panel:RemovePlugin(self)
	end
	self.frame:Hide()
	if self.minimapFrame then
		self.minimapFrame:Hide()
	end

	if Dewdrop:IsOpen(self.frame) or (self.minimapFrame and Dewdrop:IsOpen(self.minimapFrame)) then
		Dewdrop:Close()
	end
end

function FuBarPlugin:SetIcon(path)
	if not path then
		return
	end
	FuBarPlugin:argCheck(path, 2, "string", "boolean")
	if not self.hasIcon then
		FuBarPlugin:error("Cannot set icon unless self.hasIcon is set. (" .. self:GetTitle() .. ")")
	end
	if not self.iconFrame then
		return
	end
	if type(path) ~= "string" then
		path = format("Interface\\AddOns\\%s\\icon", FuBarPlugin.folderNames[self] or self.folderName)
	elseif not path:find('^Interface[\\/]') then
		path = format("Interface\\AddOns\\%s\\%s", FuBarPlugin.folderNames[self] or self.folderName, path)
	end
	if path:sub(1, 16) == "Interface\\Icons\\" then
		self.iconFrame:SetTexCoord(0.05, 0.95, 0.05, 0.95)
	else
		self.iconFrame:SetTexCoord(0, 1, 0, 1)
	end
	self.iconFrame:SetTexture(path)
	if self.minimapIcon then
		if path:sub(1, 16) == "Interface\\Icons\\" then
			self.minimapIcon:SetTexCoord(0.05, 0.95, 0.05, 0.95)
		else
			self.minimapIcon:SetTexCoord(0, 1, 0, 1)
		end
		self.minimapIcon:SetTexture(path)
	end
end

function FuBarPlugin:GetIcon()
	if self.hasIcon then
		return self.iconFrame:GetTexture()
	end
end

function FuBarPlugin:CheckWidth(force)
	FuBarPlugin:argCheck(force, 2, "boolean", "nil")
	if (self.iconFrame and self.iconFrame:IsShown()) or (self.textFrame and self.textFrame:IsShown()) then
		if (self.db and self.db.profile and not self:IsIconShown()) or not self.hasIcon then
			self.iconFrame:SetWidth(epsilon)
		end
		local width
		if not self.hasNoText then
			self.textFrame:SetHeight(0)
			self.textFrame:SetWidth(500)
			width = self.textFrame:GetStringWidth() + 1
			self.textFrame:SetWidth(width)
			self.textFrame:SetHeight(self.textFrame:GetHeight())
		end
		if self.hasNoText or not self.textFrame:IsShown() then
			self.frame:SetWidth(self.iconFrame:GetWidth())
			if self.panel and self.panel:GetPluginSide(self) == "CENTER" then
				self.panel:UpdateCenteredPosition()
			end
		elseif force or not self.textWidth or self.textWidth < width or self.textWidth - 8 > width then
			self.textWidth = width
			self.textFrame:SetWidth(width)
			if self.iconFrame and self.iconFrame:IsShown() then
				self.frame:SetWidth(width + self.iconFrame:GetWidth())
			else
				self.frame:SetWidth(width)
			end
			if self.panel and self.panel:GetPluginSide(self) == "CENTER" then
				self.panel:UpdateCenteredPosition()
			end
		end
	end
end

function FuBarPlugin:SetText(text)
	if not self.textFrame then
		return
	end
	if self.hasNoText then
		FuBarPlugin:error("Cannot set text if self.hasNoText has been set. (" .. self:GetTitle() .. ")")
	end
	FuBarPlugin:argCheck(text, 2, "string", "number")
	if text == "" then
		if self.hasIcon then
			self:ShowIcon()
		else
			text = self:GetTitle()
		end
	end
	if not self:IsTextColored() then
		text = text:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", "")
	end
	self.textFrame:SetText(text)
	self:CheckWidth()
end

function FuBarPlugin:GetText()
	if not self.textFrame then
		FuBarPlugin:error("Cannot get text without a self.textFrame (" .. self:GetTitle() .. ")")
	end
	if not self.hasNoText then
		return self.textFrame:GetText() or ""
	end
end

function FuBarPlugin:IsIconShown()
	if not self.hasIcon then
		return false
	elseif self.hasNoText then
		return true
	elseif not self.db then
		return true
	elseif self.db and self.db.profile.showIcon == nil then
		return true
	else
		return (self.db and (self.db.profile.showIcon == 1 or self.db.profile.showIcon == true)) and true or false
	end
end

function FuBarPlugin:ToggleIconShown()
	if not self.iconFrame then
		FuBarPlugin:error("Cannot toggle icon without a self.iconFrame (" .. self:GetTitle() .. ")")
	end
	if not self.hasIcon then
		FuBarPlugin:error("Cannot show icon unless self.hasIcon is set. (" .. self:GetTitle() .. ")")
	end
	if self.hasNoText then
		FuBarPlugin:error("Cannot hide icon if self.hasNoText is set. (" .. self:GetTitle() .. ")")
	end
	if not self.textFrame then
		FuBarPlugin:error("Cannot hide icon if self.textFrame is not set. (" .. self:GetTitle() .. ")")
	end
	if not self.iconFrame then
		FuBarPlugin:error("Cannot hide icon if self.iconFrame is not set. (" .. self:GetTitle() .. ")")
	end
	if not self.db then
		FuBarPlugin:error("Cannot hide icon if self.db is not available. (" .. self:GetTitle() .. ")")
	end
	local value = not self:IsIconShown()
	self.db.profile.showIcon = value
	if value then
		if not self:IsTextShown() and self.textFrame:IsShown() and self.textFrame:GetText() == self:GetTitle() then
			self.textFrame:Hide()
			self.textFrame:SetText("")
		end
		self.iconFrame:Show()
		self.iconFrame:SetWidth(self.iconFrame:GetHeight())
	else
		if not self.textFrame:IsShown() or not self.textFrame:GetText() then
			self.textFrame:Show()
			self.textFrame:SetText(self:GetTitle())
		end
		self.iconFrame:Hide()
		self.iconFrame:SetWidth(epsilon)
	end
	self:CheckWidth(true)
	return value
end

function FuBarPlugin:ShowIcon()
	if not self:IsIconShown() then
		self:ToggleIconShown()
	end
end

function FuBarPlugin:HideIcon()
	if self:IsIconShown() then
		self:ToggleIconShown()
	end
end

function FuBarPlugin:IsTextShown()
	if self.hasNoText then
		return false
	elseif not self.hasIcon then
		return true
	elseif not self.db then
		return true
	elseif self.db and self.db.profile.showText == nil then
		return true
	else
		return (self.db and (self.db.profile.showText == 1 or self.db.profile.showText == true)) and true or false
	end
end

function FuBarPlugin:ToggleTextShown()
	if self.cannotHideText then
		FuBarPlugin:error("Cannot hide text unless self.cannotHideText is unset. (" .. self:GetTitle() .. ")")
	end
	if not self.hasIcon then
		FuBarPlugin:error("Cannot show text unless self.hasIcon is set. (" .. self:GetTitle() .. ")")
	end
	if self.hasNoText then
		FuBarPlugin:error("Cannot hide text if self.hasNoText is set. (" .. self:GetTitle() .. ")")
	end
	if not self.textFrame then
		FuBarPlugin:error("Cannot hide text if self.textFrame is not set. (" .. self:GetTitle() .. ")")
	end
	if not self.iconFrame then
		FuBarPlugin:error("Cannot hide text if self.iconFrame is not set. (" .. self:GetTitle() .. ")")
	end
	if not self.db then
		FuBarPlugin:error("Cannot hide text if self.db is not available. (" .. self:GetTitle() .. ")")
	end
	local value = not self:IsTextShown()
	self.db.profile.showText = value
	if value then
		self.textFrame:Show()
		self:UpdateText()
	else
		self.textFrame:SetText("")
		self.textFrame:SetWidth(epsilon)
		self.textFrame:Hide()
		if not self:IsIconShown() then
			DropDownList1:Hide()
		end
		self:ShowIcon()
	end
	self:CheckWidth(true)
	return value
end

function FuBarPlugin:ShowText()
	if not self:IsTextShown() then
		self:ToggleTextShown()
	end
end

function FuBarPlugin:HideText()
	if self:IsTextShown() then
		self:ToggleTextShown()
	end
end

function FuBarPlugin:IsTooltipDetached()
	if self.blizzardTooltip or self.overrideTooltip or not Tablet then return end

	FuBarPlugin.RegisterTablet(self)
	return not Tablet:IsAttached(self.frame)
end

function FuBarPlugin:ToggleTooltipDetached()
	if self.blizzardTooltip or self.overrideTooltip or not Tablet then return end

	FuBarPlugin.RegisterTablet(self)
	if self:IsTooltipDetached() then
		Tablet:Attach(self.frame)
	else
		Tablet:Detach(self.frame)
	end
	if Dewdrop then Dewdrop:Close() end
end

function FuBarPlugin:DetachTooltip()
	if self.blizzardTooltip or self.overrideTooltip or not Tablet then return end

	FuBarPlugin.RegisterTablet(self)
	Tablet:Detach(self.frame)
end

function FuBarPlugin:ReattachTooltip()
	if self.blizzardTooltip or self.overrideTooltip or not Tablet then return end

	FuBarPlugin.RegisterTablet(self)
	Tablet:Attach(self.frame)
end

function FuBarPlugin:GetDefaultPosition()
	return self.defaultPosition or "LEFT"
end

local function IsCorrectPanel(panel)
	if type(panel) ~= "table" then
		return false
	elseif type(panel.AddPlugin) ~= "function" then
		return false
	elseif type(panel.RemovePlugin) ~= "function" then
		return false
	elseif type(panel.GetNumPlugins) ~= "function" then
		return false
	elseif type(panel:GetNumPlugins()) ~= "number" then
		return false
	elseif type(panel.GetPlugin) ~= "function" then
		return false
	elseif type(panel.HasPlugin) ~= "function" then
		return false
	elseif type(panel.GetPluginSide) ~= "function" then
		return false
	end
	return true
end

function FuBarPlugin:SetPanel(panel)
	if panel and not IsCorrectPanel(panel) then
		FuBarPlugin:error("Bad argument #2 to `SetPanel'. Panel does not have the correct API.")
	end
	self.panel = panel
end

function FuBarPlugin:SetFontSize(size)
	if self.userDefinedFrame then
		FuBarPlugin:error((self.name and self.name .. ": " or "") .. "You must provide a SetFontSize(size) method if you provide your own frame.")
	end
	if self.hasIcon then
		if not self.iconFrame then
			FuBarPlugin:error((self.name and self.name .. ": " or "") .. "No iconFrame found")
		end
		self.iconFrame:SetWidth(size + 3)
		self.iconFrame:SetHeight(size + 3)
	end
	if not self.hasNoText then
		if not self.textFrame then
			FuBarPlugin:error((self.name and self.name .. ": " or "") .. "No textFrame found")
		end
		local font, _, flags = self.textFrame:GetFont()
		self.textFrame:SetFont(font, size, flags)
	end
	self:CheckWidth()
end

function FuBarPlugin:IsLoadOnDemand()
	return IsAddOnLoadOnDemand(FuBarPlugin.folderNames[self] or self.folderName)
end

function FuBarPlugin:IsDisabled()
	return self.IsActive and not self:IsActive() or false
end

function FuBarPlugin:OnInstanceInit(target)
	if not AceEvent then
		self:error(MAJOR_VERSION .. " requires AceEvent-2.0.")
	elseif not Dewdrop then
		self:error(MAJOR_VERSION .. " requires Dewdrop-2.0.")
	end
	self.registry[target] = true

	local folderName
	for i = 6, 3, -1 do
		folderName = debugstack(i, 1, 0):match("\\AddOns\\(.*)\\")
		if folderName then
			break
		end
	end
	target.folderName = folderName
	self.folderNames[target] = folderName
end
FuBarPlugin.OnManualEmbed = FuBarPlugin.OnInstanceInit

local frame_OnClick, frame_OnDoubleClick, frame_OnMouseDown, frame_OnMouseUp, frame_OnReceiveDrag, frame_OnEnter, frame_OnLeave
function FuBarPlugin:CreateBasicPluginFrame(name)
	local frame = CreateFrame("Button", name, UIParent)
	frame:SetFrameStrata("HIGH")
	frame:SetFrameLevel(7)
	frame:EnableMouse(true)
	frame:EnableMouseWheel(true)
	frame:SetMovable(true)
	frame:SetWidth(150)
	frame:SetHeight(24)
	frame:SetPoint("CENTER", UIParent, "CENTER")
	frame.self = self
	if not frame_OnEnter then
		function frame_OnEnter()
			local self = this.self
			if self.blizzardTooltip then
				GameTooltip:SetOwner(self:IsMinimapAttached() and self.minimapFrame or self.frame, "ANCHOR_CURSOR")
				self:UpdateTooltip()
			end
			if type(self.OnEnter) == "function" then
				self:OnEnter()
			end
		end
	end
	frame:SetScript("OnEnter", frame_OnEnter)
	if not frame_OnLeave then
		function frame_OnLeave()
			local self = this.self
			if type(self.OnLeave) == "function" then
				self:OnLeave()
			end
			if self.blizzardTooltip and GameTooltip:IsOwned(self:IsMinimapAttached() and self.minimapFrame or self.frame) then
				GameTooltip:Hide()
			end
		end
	end
	frame:SetScript("OnLeave", frame_OnLeave)
	if not frame_OnClick then
	function frame_OnClick()
			if this.self:IsMinimapAttached() and this.dragged then return end
			if type(this.self.OnClick) == "function" then
				this.self:OnClick(arg1)
			end
		end
	end
	frame:SetScript("OnClick", frame_OnClick)
	if not frame_OnDoubleClick then
		function frame_OnDoubleClick()
			if type(this.self.OnDoubleClick) == "function" then
				this.self:OnDoubleClick(arg1)
			end
		end
	end
	frame:SetScript("OnDoubleClick", frame_OnDoubleClick)
	if not frame_OnMouseDown then
		function frame_OnMouseDown()
			if arg1 == "RightButton" and not IsShiftKeyDown() and not IsControlKeyDown() and not IsAltKeyDown() then
				this.self:OpenMenu()
				return
			else
				HideDropDownMenu(1)
				if type(this.self.OnMouseDown) == "function" then
					this.self:OnMouseDown(arg1)
				end
			end
		end
	end
	frame:SetScript("OnMouseDown", frame_OnMouseDown)
	if not frame_OnMouseUp then
		function frame_OnMouseUp()
			if type(this.self.OnMouseUp) == "function" then
				this.self:OnMouseUp(arg1)
			end
		end
	end
	frame:SetScript("OnMouseUp", frame_OnMouseUp)
	if not frame_OnReceiveDrag then
		function frame_OnReceiveDrag()
			if (this.self:IsMinimapAttached() and not this.dragged) and type(this.self.OnReceiveDrag) == "function" then
				this.self:OnReceiveDrag()
			end
		end
	end
	frame:SetScript("OnReceiveDrag", frame_OnReceiveDrag)
	return frame
end

local child_OnEnter, child_OnLeave, child_OnClick, child_OnDoubleClick, child_OnMouseDown, child_OnMouseUp, child_OnReceiveDrag
function FuBarPlugin:CreatePluginChildFrame(frameType, name, parent)
	if not self.frame then
		FuBarPlugin:error((self.name and self.name .. ": " or "") .. "You must have self.frame declared in order to add child frames")
	end
	FuBarPlugin:argCheck(frameType, 1, "string")
	local child = CreateFrame(frameType, name, parent)
	if parent then
		child:SetFrameLevel(parent:GetFrameLevel() + 2)
	end
	child.self = self
	if not child_OnEnter then
		function child_OnEnter(...)
			if this.self.frame:GetScript("OnEnter") then
				this.self.frame:GetScript("OnEnter")(...)
			end
		end
	end
	child:SetScript("OnEnter", child_OnEnter)
	if not child_OnLeave then
		function child_OnLeave(...)
			if this.self.frame:GetScript("OnLeave") then
				this.self.frame:GetScript("OnLeave")(...)
			end
		end
	end
	child:SetScript("OnLeave", child_OnLeave)
	if child:HasScript("OnClick") then
		if not child_OnClick then
			function child_OnClick(...)
				if this.self.frame:HasScript("OnClick") and this.self.frame:GetScript("OnClick") then
					this.self.frame:GetScript("OnClick")(...)
				end
			end
		end
		child:SetScript("OnClick", child_OnClick)
	end
	if child:HasScript("OnDoubleClick") then
		if not child_OnDoubleClick then
			function child_OnDoubleClick(...)
				if this.self.frame:HasScript("OnDoubleClick") and this.self.frame:GetScript("OnDoubleClick") then
					this.self.frame:GetScript("OnDoubleClick")(...)
				end
			end
		end
		child:SetScript("OnDoubleClick", child_OnDoubleClick)
	end
	if not child_OnMouseDown then
		function child_OnMouseDown(...)
			if this.self.frame:HasScript("OnMouseDown") and this.self.frame:GetScript("OnMouseDown") then
				this.self.frame:GetScript("OnMouseDown")(...)
			end
		end
	end
	child:SetScript("OnMouseDown", child_OnMouseDown)
	if not child_OnMouseUp then
		function child_OnMouseUp(...)
			if this.self.frame:HasScript("OnMouseUp") and this.self.frame:GetScript("OnMouseUp") then
				this.self.frame:GetScript("OnMouseUp")(...)
			end
		end
	end
	child:SetScript("OnMouseUp", child_OnMouseUp)
	if not child_OnReceiveDrag then
		function child_OnReceiveDrag(this)
			if this.self.frame:HasScript("OnReceiveDrag") and this.self.frame:GetScript("OnReceiveDrag") then
				this.self.frame:GetScript("OnReceiveDrag")()
			end
		end
	end
	child:SetScript("OnReceiveDrag", child_OnReceiveDrag)
	return child
end

function FuBarPlugin:OpenMenu(frame)
	if not frame then
		frame = self:IsMinimapAttached() and self.minimapFrame or self.frame
	end
	if not frame:IsVisible() then
		frame = UIParent
	end
	if not frame or not self:GetFrame() or Dewdrop:IsOpen(frame) then
		Dewdrop:Close()
		return
	end
	if self.blizzardTooltip then
		if GameTooltip:IsOwned(frame) then
			GameTooltip:Hide()
		end
	elseif self.overrideTooltip and type(self.CloseTooltip) == "function" then
		self:CloseTooltip()
	elseif not self.overrideTooltip and Tablet then
		Tablet:Close()
	end

	if not Dewdrop:IsRegistered(self:GetFrame()) then
		if type(self.OnMenuRequest) == "table" and (not self.OnMenuRequest.handler or self.OnMenuRequest.handler == self) and self.OnMenuRequest.type == "group" then
			Dewdrop:InjectAceOptionsTable(self, self.OnMenuRequest)
			if self.OnMenuRequest.args and CheckFuBar() and not self.independentProfile then
				self.OnMenuRequest.args.profile = nil
			end
		end
		Dewdrop:Register(self:GetFrame(),
			'children', type(self.OnMenuRequest) == "table" and self.OnMenuRequest or function(level, value, valueN_1, valueN_2, valueN_3, valueN_4)
				if level == 1 then
					if not self.hideMenuTitle then
						Dewdrop:AddLine(
							'text', self:GetTitle(),
							'isTitle', true
						)
					end

					if self.OnMenuRequest then
						self:OnMenuRequest(level, value, false, valueN_1, valueN_2, valueN_3, valueN_4)
					end

					if not self.overrideMenu then
						if self.MenuSettings and not self.hideMenuTitle then
							Dewdrop:AddLine()
						end
						self:AddImpliedMenuOptions()
					end
				else
					if not self.overrideMenu and self:AddImpliedMenuOptions() then
					else
						if self.OnMenuRequest then
							self:OnMenuRequest(level, value, false, valueN_1, valueN_2, valueN_3, valueN_4)
						end
					end
				end
				if level == 1 then
					Dewdrop:AddLine(
						'text', CLOSE,
						'tooltipTitle', CLOSE,
						'tooltipText', CLOSE_DESC,
						'func', Dewdrop.Close,
						'arg1', Dewdrop
					)
				end
			end,
			'point', function(frame)
				local x, y = frame:GetCenter()
				local leftRight
				if x < GetScreenWidth() / 2 then
					leftRight = "LEFT"
				else
					leftRight = "RIGHT"
				end
				if y < GetScreenHeight() / 2 then
					return "BOTTOM" .. leftRight, "TOP" .. leftRight
				else
					return "TOP" .. leftRight, "BOTTOM" .. leftRight
				end
			end,
			'dontHook', true
		)
	end
	if frame == self:GetFrame() then
		Dewdrop:Open(self:GetFrame())
	elseif frame ~= UIParent then
		Dewdrop:Open(frame, self:GetFrame())
	else
		Dewdrop:Open(frame, self:GetFrame(), 'cursorX', true, 'cursorY', true)
	end
end

local impliedMenuOptions
function FuBarPlugin:AddImpliedMenuOptions(level)
	FuBarPlugin:argCheck(level, 2, "number", "nil")
	if not impliedMenuOptions then
		impliedMenuOptions = {}
	end
	if not impliedMenuOptions[self] then
		impliedMenuOptions[self] = { type = 'group', args = {} }
		Dewdrop:InjectAceOptionsTable(self, impliedMenuOptions[self])
		if impliedMenuOptions[self].args and CheckFuBar() and not self.independentProfile then
			impliedMenuOptions[self].args.profile = nil
		end
	end
	return Dewdrop:FeedAceOptionsTable(impliedMenuOptions[self], level and level - 1)
end

function FuBarPlugin.OnEmbedInitialize(FuBarPlugin, self)
	if not self.frame then
		local name = "FuBarPlugin" .. self:GetTitle() .. "Frame"
		local frame = _G[name]
		if not frame or not _G[name .. "Text"] or not _G[name .. "Icon"] then
			frame = self:CreateBasicPluginFrame(name)

			local icon = frame:CreateTexture(name .. "Icon", "ARTWORK")
			icon:SetWidth(16)
			icon:SetHeight(16)
			icon:SetPoint("LEFT", frame, "LEFT")

			local text = frame:CreateFontString(name .. "Text", "ARTWORK")
			text:SetWidth(134)
			text:SetHeight(24)
			text:SetPoint("LEFT", icon, "RIGHT", 0, 1)
			text:SetFontObject(GameFontNormal)
		end
		self.frame = frame
		self.textFrame = _G[name .. "Text"]
		self.iconFrame = _G[name .. "Icon"]
	else
		self.userDefinedFrame = true
	end

	self.frame.plugin = self
	self.frame:SetParent(UIParent)
	self.frame:SetPoint("RIGHT", UIParent, "LEFT", -5, 0)
	self.frame:Hide()

	if self.hasIcon then
		self:SetIcon(self.hasIcon)
	end

	if CheckFuBar() then
		FuBar:RegisterPlugin(self)
	end
end

local CheckShow = function(self, panelId)
	if not self.frame:IsShown() and (not self.minimapFrame or not self.minimapFrame:IsShown()) then
		self:Show(panelId)
		Dewdrop:Refresh(2)
	end
end

local recheckPlugins
local AceConsole
function FuBarPlugin.OnEmbedEnable(FuBarPlugin, self)
	if not self.userDefinedFrame then
		if self:IsIconShown() then
			self.iconFrame:Show()
		else
			self.iconFrame:Hide()
		end
	end
	self:CheckWidth(true)

	if not self.hideWithoutStandby or (self.db and not self.db.profile.hidden) then
		if FuBarPlugin.enabledPlugins[self] then
			CheckShow(self, self.panelIdTmp)
		else
			FuBarPlugin:ScheduleEvent("FuBarPlugin-CheckShow-" .. tostring(self), CheckShow, 0, self, self.panelIdTmp)
		end
	end
	FuBarPlugin.enabledPlugins[self] = true

	if not self.blizzardTooltip and not self.overrideTooltip and not self.cannotDetachTooltip and self.db and self.db.profile.detachedTooltip and self.db.profile.detachedTooltip.detached then
		FuBarPlugin:ScheduleEvent("FuBarPlugin-DetachTooltip-" .. tostring(self), self.DetachTooltip, 0, self)
	end

	if self:IsLoadOnDemand() and CheckFuBar() then
		if not FuBar.db.profile.loadOnDemand then
			FuBar.db.profile.loadOnDemand = {}
		end
		if not FuBar.db.profile.loadOnDemand[FuBarPlugin.folderNames[self] or self.folderName] then
			FuBar.db.profile.loadOnDemand[FuBarPlugin.folderNames[self] or self.folderName] = {}
		end
		FuBar.db.profile.loadOnDemand[FuBarPlugin.folderNames[self] or self.folderName].disabled = nil
	end

	if CheckFuBar() and AceLibrary:HasInstance("AceConsole-2.0") then
		if not recheckPlugins then
			if not AceConsole then
				AceConsole = AceLibrary("AceConsole-2.0")
			end
			recheckPlugins = function()
				for k,v in pairs(AceConsole.registry) do
					if type(v) == "table" and v.args and AceOO.inherits(v.handler, FuBarPlugin) and not v.handler.independentProfile then
						v.args.profile = nil
					end
				end
			end
		end
		FuBarPlugin:ScheduleEvent("FuBarPlugin-recheckPlugins", recheckPlugins, 0)
	end
end

function FuBarPlugin.OnEmbedDisable(FuBarPlugin, self)
	self:Hide(false)

	if self:IsLoadOnDemand() and CheckFuBar() then
		if not FuBar.db.profile.loadOnDemand then
			FuBar.db.profile.loadOnDemand = {}
		end
		if not FuBar.db.profile.loadOnDemand[FuBarPlugin.folderNames[self] or self.folderName] then
			FuBar.db.profile.loadOnDemand[FuBarPlugin.folderNames[self] or self.folderName] = {}
		end
		FuBar.db.profile.loadOnDemand[FuBarPlugin.folderNames[self] or self.folderName].disabled = true
	end
end

function FuBarPlugin.OnEmbedProfileEnable(FuBarPlugin, self)
	self:Update()
	if self.db and self.db.profile then
		if not self.db.profile.detachedTooltip then
			self.db.profile.detachedTooltip = {}
		end
		if not self.blizzardTooltip and not self.overrideTooltip and Tablet then
			if Tablet.registry[self.frame] then
				Tablet:UpdateDetachedData(self.frame, self.db.profile.detachedTooltip)
			else
				FuBarPlugin.RegisterTablet(self)
			end
		end
		if MinimapContainer:HasPlugin(self) then
			MinimapContainer:ReadjustLocation(self)
		end
	end
end

function FuBarPlugin.GetAceOptionsDataTable(FuBarPlugin, self)
	return {
		icon = {
			type = "toggle",
			name = SHOW_ICON,
			desc = SHOW_ICON_DESC,
			set = "ToggleIconShown",
			get = "IsIconShown",
			hidden = function()
				return not self.hasIcon or self.hasNoText or self:IsDisabled() or self:IsMinimapAttached() or not self.db
			end,
			order = -13.7,
			handler = self,
		},
		text = {
			type = "toggle",
			name = SHOW_TEXT,
			desc = SHOW_TEXT_DESC,
			set = "ToggleTextShown",
			get = "IsTextShown",
			hidden = function()
				return self.cannotHideText or not self.hasIcon or self.hasNoText or self:IsDisabled() or self:IsMinimapAttached() or not self.db
			end,
			order = -13.6,
			handler = self,
		},
		colorText = {
			type = "toggle",
			name = SHOW_COLORED_TEXT,
			desc = SHOW_COLORED_TEXT_DESC,
			set = "ToggleTextColored",
			get = "IsTextColored",
			hidden = function()
				return self.userDefinedFrame or self.hasNoText or self.hasNoColor or self:IsDisabled() or self:IsMinimapAttached() or not self.db
			end,
			order = -13.5,
			handler = self,
		},
		detachTooltip = {
			type = "toggle",
			name = DETACH_TOOLTIP,
			desc = DETACH_TOOLTIP_DESC,
			get = "IsTooltipDetached",
			set = "ToggleTooltipDetached",
			hidden = function()
				return not Tablet or self.blizzardTooltip or self.overrideTooltip or self.cannotDetachTooltip or self:IsDisabled()
			end,
			order = -13.4,
			handler = self,
		},
		lockTooltip = {
			type = "toggle",
			name = LOCK_TOOLTIP,
			desc = LOCK_TOOLTIP_DESC,
			get = function()
				return Tablet:IsLocked(self.frame)
			end,
			set = function()
				return Tablet:ToggleLocked(self.frame)
			end,
			disabled = function()
				return not self:IsTooltipDetached()
			end,
			hidden = function()
				return not Tablet or self.blizzardTooltip or self.overrideTooltip or self.cannotDetachTooltip or self:IsDisabled()
			end,
			order = -13.3,
			handler = self,
		},
		position = {
			type = "text",
			name = POSITION,
			desc = POSITION_DESC,
			validate = {
				LEFT = POSITION_LEFT,
				CENTER = POSITION_CENTER,
				RIGHT = POSITION_RIGHT
			},
			get = function()
				return self.panel and self.panel:GetPluginSide(self)
			end,
			set = function(value)
				if self.panel then
					self.panel:SetPluginSide(self, value)
				end
			end,
			hidden = function()
				return self:IsMinimapAttached() or self:IsDisabled() or not self.panel
			end,
			order = -13.2,
			handler = self,
		},
		minimapAttach = {
			type = "toggle",
			name = ATTACH_TO_MINIMAP,
			desc = ATTACH_TO_MINIMAP_DESC,
			get = "IsMinimapAttached",
			set = "ToggleMinimapAttached",
			hidden = function()
				return (self.cannotAttachToMinimap and not self:IsMinimapAttached()) or not CheckFuBar() or self:IsDisabled()
			end,
			order = -13.1,
			handler = self,
		},
		hide = {
			type = "toggle",
			cmdName = HIDE_FUBAR_PLUGIN_CMD,
			guiName = HIDE_FUBAR_PLUGIN,
			desc = HIDE_FUBAR_PLUGIN_DESC,
			get = function()
				return not self.frame:IsShown() and (not self.minimapFrame or not self.minimapFrame:IsShown())
			end,
			set = function()
				if not self.frame:IsShown() and (not self.minimapFrame or not self.minimapFrame:IsShown()) then
					self:Show()
				else
					self:Hide()
				end
			end,
			hidden = function()
				return not self.hideWithoutStandby or self:IsDisabled()
			end,
			order = -13,
			handler = self,
		},
	}
end

local function activate(self, oldLib, oldDeactivate)
	FuBarPlugin = self

	if oldLib then
		self.registry = oldLib.registry
		self.folderNames = oldLib.folderNames
		self.enabledPlugins = oldLib.enabledPlugins
	end

	if not self.registry then
		self.registry = {}
	end
	if not self.folderNames then
		self.folderNames = {}
	end
	if not self.enabledPlugins then
		self.enabledPlugins = {}
	end

	FuBarPlugin.activate(self, oldLib, oldDeactivate)

	if oldDeactivate then
		oldDeactivate(oldLib)
	end
end

local function external(self, major, instance)
	if major == "AceEvent-2.0" then
		AceEvent = instance
		AceEvent:embed(self)
	elseif major == "Tablet-2.0" then
		Tablet = instance
	elseif major == "Dewdrop-2.0" then
		Dewdrop = instance
	end
end

AceLibrary:Register(FuBarPlugin, MAJOR_VERSION, MINOR_VERSION, activate, nil, external)

MinimapContainer = {}

local minimap_OnMouseDown, minimap_OnMouseUp
function MinimapContainer:AddPlugin(plugin)
	if CheckFuBar() and FuBar:IsChangingProfile() then
		return
	end
	if plugin.panel ~= nil then
		plugin.panel:RemovePlugin(plugin)
	end
	plugin.panel = self
	if not plugin.minimapFrame then
		local frame = CreateFrame("Button", plugin.frame:GetName() .. "MinimapButton", Minimap)
		plugin.minimapFrame = frame
		frame.plugin = plugin
		frame:SetWidth(31)
		frame:SetHeight(31)
		frame:SetFrameStrata("BACKGROUND")
		frame:SetFrameLevel(4)
		frame:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")
		local icon = frame:CreateTexture(frame:GetName() .. "Icon", "BACKGROUND")
		plugin.minimapIcon = icon
		local path = plugin:GetIcon() or (plugin.iconFrame and plugin.iconFrame:GetTexture()) or "Interface\\Icons\\INV_Misc_QuestionMark"
		icon:SetTexture(path)
		if path:sub(1, 16) == "Interface\\Icons\\" then
			icon:SetTexCoord(0.05, 0.95, 0.05, 0.95)
		else
			icon:SetTexCoord(0, 1, 0, 1)
		end
		icon:SetWidth(20)
		icon:SetHeight(20)
		icon:SetPoint("TOPLEFT", frame, "TOPLEFT", 7, -5)
		local overlay = frame:CreateTexture(frame:GetName() .. "Overlay","OVERLAY")
		overlay:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
		overlay:SetWidth(53)
		overlay:SetHeight(53)
		overlay:SetPoint("TOPLEFT",frame,"TOPLEFT")
		frame:EnableMouse(true)
		frame:RegisterForClicks("LeftButtonUp")

		frame.self = plugin
		if not frame_OnEnter then
			function frame_OnEnter()
				if type(this.self.OnEnter) == "function" then
					this.self:OnEnter()
				end
			end
		end
		frame:SetScript("OnEnter", frame_OnEnter)
		if not frame_OnLeave then
			function frame_OnLeave()
				if type(this.self.OnLeave) == "function" then
					this.self:OnLeave()
				end
			end
		end
		frame:SetScript("OnLeave", frame_OnLeave)
		if not frame_OnClick then
			function frame_OnClick()
				if this.self:IsMinimapAttached() and this.dragged then return end
				if type(this.self.OnClick) == "function" then
					this.self:OnClick(arg1)
				end
			end
		end
		frame:SetScript("OnClick", frame_OnClick)
		if not frame_OnDoubleClick then
			function frame_OnDoubleClick()
				if type(this.self.OnDoubleClick) == "function" then
					this.self:OnDoubleClick(arg1)
				end
			end
		end
		frame:SetScript("OnDoubleClick", frame_OnDoubleClick)
		if not frame_OnReceiveDrag then
			function frame_OnReceiveDrag()
				if (this.self:IsMinimapAttached() and not this.dragged) and type(this.self.OnReceiveDrag) == "function" then
					this.self:OnReceiveDrag()
				end
			end
		end
		frame:SetScript("OnReceiveDrag", frame_OnReceiveDrag)
		if not minimap_OnMouseDown then
			function minimap_OnMouseDown()
				this.dragged = false
				if arg1 == "LeftButton" and not IsShiftKeyDown() and not IsControlKeyDown() and not IsAltKeyDown() then
					HideDropDownMenu(1)
					if type(this.self.OnMouseDown) == "function" then
						this.self:OnMouseDown(arg1)
					end
				elseif arg1 == "RightButton" and not IsShiftKeyDown() and not IsControlKeyDown() and not IsAltKeyDown() then
					this.self:OpenMenu(this)
				else
					HideDropDownMenu(1)
					if type(this.self.OnMouseDown) == "function" then
						this.self:OnMouseDown(arg1)
					end
				end
				if this.self.OnClick or this.self.OnMouseDown or this.self.OnMouseUp or this.self.OnDoubleClick then
					if this.self.minimapIcon:GetTexture():sub(1, 16) == "Interface\\Icons\\" then
						this.self.minimapIcon:SetTexCoord(0.14, 0.86, 0.14, 0.86)
					else
						this.self.minimapIcon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
					end
				end
			end
		end
		frame:SetScript("OnMouseDown", minimap_OnMouseDown)
		if not minimap_OnMouseUp then
			function minimap_OnMouseUp()
				if not this.dragged and type(this.self.OnMouseUp) == "function" then
					this.self:OnMouseUp(arg1)
				end
				if this.self.minimapIcon:GetTexture():sub(1, 16) == "Interface\\Icons\\" then
					this.self.minimapIcon:SetTexCoord(0.05, 0.95, 0.05, 0.95)
				else
					this.self.minimapIcon:SetTexCoord(0, 1, 0, 1)
				end
			end
		end
		frame:SetScript("OnMouseUp", minimap_OnMouseUp)
		frame:RegisterForDrag("LeftButton")
		frame:SetScript("OnDragStart", self.OnDragStart)
		frame:SetScript("OnDragStop", self.OnDragStop)

		if not plugin.blizzardTooltip and not plugin.overrideTooltip and Tablet then
			-- Note that we have to do this after :SetScript("OnEnter"), etc,
			-- so that Tablet-2.0 can override it properly.
			FuBarPlugin.RegisterTablet(plugin)
			Tablet:Register(frame, plugin.frame)
		end
	end
	plugin.frame:Hide()
	plugin.minimapFrame:Show()
	self:ReadjustLocation(plugin)
	table.insert(self.plugins, plugin)
	local exists = false
	return true
end

function MinimapContainer:RemovePlugin(index)
	if CheckFuBar() and FuBar:IsChangingProfile() then
		return
	end
	if type(index) == "table" then
		index = self:IndexOfPlugin(index)
		if not index then
			return
		end
	end
	local t = self.plugins
	local plugin = t[index]
	assert(plugin.panel == self, "Plugin has improper panel field")
	plugin:SetPanel(nil)
	table.remove(t, index)
	return true
end

function MinimapContainer:ReadjustLocation(plugin)
	local frame = plugin.minimapFrame
	if plugin.db and plugin.db.profile.minimapPositionWild then
		frame:SetPoint("CENTER", UIParent, "BOTTOMLEFT", plugin.db.profile.minimapPositionX, plugin.db.profile.minimapPositionY)
	elseif not plugin.db and plugin.minimapPositionWild then
		frame:SetPoint("CENTER", UIParent, "BOTTOMLEFT", plugin.minimapPositionX, plugin.minimapPositionY)
	else
		local position
		if plugin.db then
			position = plugin.db.profile.minimapPosition or plugin.defaultMinimapPosition or math.random(1, 360)
		else
			position = plugin.minimapPosition or plugin.defaultMinimapPosition or math.random(1, 360)
		end
		local angle = math.rad(position or 0)
		local x,y
		local minimapShape = GetMinimapShape and GetMinimapShape() or "ROUND"
		local cos = math.cos(angle)
		local sin = math.sin(angle)
		
		local round = true
		if minimapShape == "ROUND" then
			-- do nothing
		elseif minimapShape == "SQUARE" then
			round = false
		elseif minimapShape == "CORNER-TOPRIGHT" then
			if cos < 0 or sin < 0 then
				round = false
			end
		elseif minimapShape == "CORNER-TOPLEFT" then
			if cos > 0 or sin < 0 then
				round = false
			end
		elseif minimapShape == "CORNER-BOTTOMRIGHT" then
			if cos < 0 or sin > 0 then
				round = false
			end
		elseif minimapShape == "CORNER-BOTTOMLEFT" then
			if cos > 0 or sin > 0 then
				round = false
			end
		elseif minimapShape == "SIDE-LEFT" then
			if cos > 0 then
				round = false
			end
		elseif minimapShape == "SIDE-RIGHT" then
			if cos < 0 then
				round = false
			end
		elseif minimapShape == "SIDE-TOP" then
			if sin > 0 then
				round = false
			end
		elseif minimapShape == "SIDE-BOTTOM" then
			if sin < 0 then
				round = false
			end
		elseif minimapShape == "TRICORNER-TOPRIGHT" then
			if cos < 0 and sin > 0 then
				round = false
			end
		elseif minimapShape == "TRICORNER-TOPLEFT" then
			if cos > 0 and sin > 0 then
				round = false
			end
		elseif minimapShape == "TRICORNER-BOTTOMRIGHT" then
			if cos < 0 and sin < 0 then
				round = false
			end
		elseif minimapShape == "TRICORNER-BOTTOMLEFT" then
			if cos > 0 and sin < 0 then
				round = false
			end
		end
		
		if round then
			x = cos * 80
			y = sin * 80
		else
			x = 110 * cos
			y = 110 * sin
			x = math.max(-82, math.min(x, 84))
			y = math.max(-86, math.min(y, 82))
		end
		frame:SetPoint("CENTER", Minimap, "CENTER", x, y)
	end
end

function MinimapContainer:GetPlugin(index)
	return self.plugins[index]
end

function MinimapContainer:GetNumPlugins()
	return #self.plugins
end

function MinimapContainer:IndexOfPlugin(plugin)
	for i,p in ipairs(self.plugins) do
		if p == plugin then
			return i, "MINIMAP"
		end
	end
end

function MinimapContainer:HasPlugin(plugin)
	return self:IndexOfPlugin(plugin) ~= nil
end

function MinimapContainer:GetPluginSide(plugin)
	local index = self:IndexOfPlugin(plugin)
	assert(index, "Plugin not in panel")
	return "MINIMAP"
end

function MinimapContainer.OnDragStart()
	this.dragged = true
	this:LockHighlight()
	this:SetScript("OnUpdate", MinimapContainer.OnUpdate)
	if this.self.minimapIcon:GetTexture():sub(1, 16) == "Interface\\Icons\\" then
		this.self.minimapIcon:SetTexCoord(0.05, 0.95, 0.05, 0.95)
	else
		this.self.minimapIcon:SetTexCoord(0, 1, 0, 1)
	end
end

function MinimapContainer.OnDragStop()
	this:SetScript("OnUpdate", nil)
	this:UnlockHighlight()
end

function MinimapContainer.OnUpdate()
	if not IsAltKeyDown() then
		local mx, my = Minimap:GetCenter()
		local px, py = GetCursorPosition()
		local scale = UIParent:GetEffectiveScale()
		px, py = px / scale, py / scale
		local position = math.deg(math.atan2(py - my, px - mx))
		if position <= 0 then
			position = position + 360
		elseif position > 360 then
			position = position - 360
		end
		if this.self.db then
			this.self.db.profile.minimapPosition = position
			this.self.db.profile.minimapPositionX = nil
			this.self.db.profile.minimapPositionY = nil
			this.self.db.profile.minimapPositionWild = nil
		else
			this.self.minimapPosition = position
			this.self.minimapPositionX = nil
			this.self.minimapPositionY = nil
			this.self.minimapPositionWild = nil
		end
	else
		local px, py = GetCursorPosition()
		local scale = UIParent:GetEffectiveScale()
		px, py = px / scale, py / scale
		if this.self.db then
			this.self.db.profile.minimapPositionX = px
			this.self.db.profile.minimapPositionY = py
			this.self.db.profile.minimapPosition = nil
			this.self.db.profile.minimapPositionWild = true
		else
			this.self.minimapPositionX = px
			this.self.minimapPositionY = py
			this.self.minimapPosition = nil
			this.self.minimapPositionWild = true
		end
	end
	MinimapContainer:ReadjustLocation(this.self)
end

local function activate(self, oldLib, oldDeactivate)
	MinimapContainer = self

	if oldLib then
		self.plugins = oldLib.plugins
	end

	if not self.plugins then
		self.plugins = {}
	end

	if oldDeactivate then
		oldDeactivate(oldLib)
	end
end

AceLibrary:Register(MinimapContainer, MINIMAPCONTAINER_MAJOR_VERSION, MINOR_VERSION, activate)
