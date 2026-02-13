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


local genv = getfenv(0)
local Mang = genv.Mang

local gettingGOBinfo=0
local gettingGOBinfoinfo=0

MAJOR_VERSION = "|cFF00FF00AzerothAdmin-3.3.5|r"
MINOR_VERSION = tonumber(GetAddOnMetadata("AzerothAdmin", "Version")) or 0
ROOT_PATH     = "Interface\\AddOns\\AzerothAdmin\\"
local cont = ""
-- Ace3 Initialization
AzerothAdmin = LibStub("AceAddon-3.0"):NewAddon("AzerothAdmin", "AceConsole-3.0", "AceEvent-3.0", "AceHook-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("AzerothAdmin", true)
Locale = L
Strings = LibStub("AceLocale-3.0"):GetLocale("AzerothAdmin-Strings", true)

-- FrameLib and other legacy libs (TODO: Port or Replace)
FrameLib     = LibStub("FrameLib-1.0")
Graph        = LibStub("Graph-1.0")
-- Tablet       = AceLibrary("Tablet-2.0")


AzerothAdmin.cWorking = 0
AzerothAdmin.cMap = 0
AzerothAdmin.cX = 0
AzerothAdmin.cY = 0
AzerothAdmin.cZ = 0
AzerothAdmin.incX = 0
AzerothAdmin.incY = 0
AzerothAdmin.incZ = 0
AzerothAdmin.fID = 0

local defaults = {
  char = {
    -- Was "char" defaults
    functionQueue = {},
    requests = {
      tpinfo = false,
      ticket = false,
      ticketbody = 0,
      item = false,
      favitem = false,
      itemset = false,
      spell = false,
      skill = false,
      quest = false,
      creature = false,
      object = false,
      tele = false,
      toggle = false
    },
    nextGridWay = "ahead",
    selectedZone = nil,
    newTicketQueue = {},
    instantKillMode = false,
    msgDeltaTime = time(),
  },
  profile = {
    -- Was "account" defaults
    language = nil,
    localesearchstring = true,
    instantTeleport = false,
    favorites = {
      items = {},
      itemsets = {},
      spells = {},
      skills = {},
      quests = {},
      creatures = {},
      objects = {},
      teles = {}
    },
    buffer = {
      tickets = {},
      items = {},
      itemsets = {},
      spells = {},
      skills = {},
      quests = {},
      creatures = {},
      objects = {},
      teles = {},
      counter = 0
    },
    tickets = {
      selected = 0,
      count = 0,
      requested = 0,
      playerinfo = {},
      loading = false
    },
    style = {
      delayparam = "50000", -- Default delay for diff graph updates (approx. 5 minutes)
      showtooltips = true,
      showchat = false,
      showminimenu = true,
      framestrata = "MEDIUM",
      transparency = {
        buttons = 1.0,
        frames = 0.7,
        backgrounds = 0.5
      },
      color = {
        buffer = {},
        buttons = {
          r = 33,
          g = 164,
          b = 210
        },
        frames = {
          r = 102,
          g = 102,
          b = 102
        },
        backgrounds = {
          r = 0,
          g = 0,
          b = 0
        },
        linkifier = {
          r = 0.8705882352941177,
          g = 0.3725490196078432,
          b = 0.1411764705882353
        }
      }
    }
  }
} -- End defaults

-- Register Translations (Managed by AceLocale-3.0 internally)
-- Use LibStub("AceLocale-3.0"):NewLocale in locale files.

AzerothAdmin.consoleOpts = {
  type = 'group',
  args = {
    toggle = {
      name = "toggle",
      desc = Locale["cmd_toggle"],
      type = 'execute',
      func = function() AzerothAdmin:OnClick() end
    },
    transparency = {
      name = "transparency",
      desc = Locale["cmd_transparency"],
      type = 'execute',
      func = function() AzerothAdmin:ToggleTransparency() end
    },
    tooltips = {
      name = "tooltips",
      desc = Locale["cmd_tooltip"],
      type = 'execute',
      func = function() AzerothAdmin:ToggleTooltips() end
    },
    minimenu = {
      name = "minimenu",
      desc = "Toggle the toolbar/minimenu",
      type = 'execute',
      func = function() AzerothAdmin:ToggleMinimenu() end
    },
    minimap = {
      name = "minimap",
      desc = "Toggle the minimap button visibility",
      type = 'execute',
      func = function() AzerothAdmin:ToggleMinimapButton() end
    }
  }
}

function AzerothAdmin:OnInitialize()
  -- initializing AzerothAdmin
  self.db = LibStub("AceDB-3.0"):New("AzerothAdminDb", defaults, true)

  self:SetLanguage()
  self:CreateFrames()
  
  -- Register Chat Commands (Ace3)
  self:RegisterChatCommand("aa", "OnClick")
  self:RegisterChatCommand("azerothadmin", "OnClick")
  
  -- Register options with AceConfig-3.0
  LibStub("AceConfig-3.0"):RegisterOptionsTable("AzerothAdmin", self.consoleOpts)


  self:InitButtons()  -- this prepares the actions and tooltips of nearly all AzerothAdmin buttons
  InitControls()
  self:SearchReset()

  -- make AzerothAdmin frames closable with escape key
  tinsert(UISpecialFrames,"ma_bgframe")
  tinsert(UISpecialFrames,"ma_popupframe")
  -- those all hook the AddMessage method of the chat frames.
  -- They will be redirected to AzerothAdmin:AddMessage(...)
  for i=1,NUM_CHAT_WINDOWS do
    local cf = _G["ChatFrame"..i]
    self:RawHook(cf, "AddMessage", "AddMessage", true)
  end
  -- initializing Frames, like DropDowns, Sliders, aso
  self:InitDropDowns()
  self:InitDropDownStyling()  -- Apply ElvUI-style dropdown styling
  self:InitSliders()
  self:InitScrollFrames()
  self:InitCheckButtons()
  ma_gobmovedistforwardback:SetText("1")
  ma_gobmovedistleftright:SetText("1")
  ma_gobmovedistupdown:SetText("1")
  --clear color buffer
  self.db.profile.style.color.buffer = {}
  --altering the function setitemref, to make it possible to click links
  MangLinkifier_SetItemRef_Original = SetItemRef
  SetItemRef = MangLinkifier_SetItemRef
  self.db.char.msgDeltaTime = time()
  -- hide minimenu if not enabled
  if not self.db.profile.style.showminimenu then
    FrameLib:HandleGroup("minimenu", function(frame) frame:Hide() end)
  end
end

function AzerothAdmin:OnEnable()
  -- self:SetDebugging(true) -- Deprecated in Ace3
  ma_toptext:SetText(Locale["char"].." "..Locale["guid"]..tonumber(UnitGUID("player"),16))
  ma_top2text:SetText(Locale["realm"])
  self:SearchReset()
  -- refresh server information
  self:ChatMsg(".server info")
  self:ChatMsg(".account onlinelist")
  -- register events
  --self:RegisterEvent("ZONE_CHANGED") -- for teleport list update
  self:RegisterEvent("PLAYER_TARGET_CHANGED")
  self:RegisterEvent("UNIT_MODEL_CHANGED")
  self:RegisterEvent("PLAYER_DEAD")
  self:RegisterEvent("PLAYER_ALIVE")
  self:PLAYER_TARGET_CHANGED() --init
  --ma_mm_revivebutton:Show()

  -- Dissable unusable options in Char tab WIP: FIX #9
  ma_mapsonbutton:Disable()
  ma_mapsoffbutton:Disable()
  ma_showmapsbutton:Disable()
  ma_hidemapsbutton:Disable()
end

--events
function AzerothAdmin:PLAYER_DEAD()
  ma_mm_revivebutton:Show()
end

function AzerothAdmin:PLAYER_ALIVE()
  ma_mm_revivebutton:Hide()
end

function AzerothAdmin:ZONE_CHANGED()
  --[[if hastranslationlocale then
    if not AzerothAdmin.db.char.selectedZone or AzerothAdmin.db.char.selectedZone ~= translate(GetZoneText()) then
      if translationfor(GetZoneText()) then
        AzerothAdmin.db.char.selectedZone = translate(GetZoneText())
        InlineScrollUpdate()
      end
    end
  end]]
end

function AzerothAdmin:UNIT_MODEL_CHANGED()
  if AzerothAdminCommands.ModelChanged then
    AzerothAdminCommands.ModelChanged()
  end
end

function AzerothAdmin:PLAYER_TARGET_CHANGED()
  if AzerothAdminCommands.ModelChanged then
    AzerothAdminCommands.ModelChanged()
  end
  if AzerothAdminCommands.NpcModelChanged then
    AzerothAdminCommands.NpcModelChanged()
  end
  if UnitIsPlayer("target") then
    ma_charactertarget:SetText(UnitName("target"))
    ma_savebutton:Enable()
    if UnitIsDead("target") then
      ma_revivebutton:Enable()
      ma_killbutton:Disable()
    else
      --ma_revivebutton:Disable()
      ma_killbutton:Enable()
    end
    if not UnitIsUnit("target", "player") then
      ma_kickbutton:Enable()
    else
      ma_kickbutton:Disable()
    end
    --ma_respawnbutton:Disable()
  elseif not UnitName("target") then
    ma_savebutton:Enable()
    --ma_revivebutton:Disable()
    ma_killbutton:Disable()
    ma_kickbutton:Disable()
    --ma_respawnbutton:Disable()
  else
    ma_savebutton:Disable()
    --ma_revivebutton:Disable()
    ma_kickbutton:Disable()
    if UnitIsDead("target") then
      --ma_respawnbutton:Enable()
      ma_killbutton:Disable()
    else
      if self.db.char.instantKillMode then
        if not UnitIsFriend("player", "target") then
          AzerothAdminCommands.KillSomething()
        end
      end
      --ma_respawnbutton:Disable()
      ma_killbutton:Enable()
    end
  end
end

function AzerothAdmin:OnDisable()
  -- called when the addon is disabled
  self:SearchReset()
end

function AzerothAdmin:OnClick()
  -- this toggles the AzerothAdmin frame when clicking on the mini icon
  if IsShiftKeyDown() then
    ReloadUI()
  elseif ma_bgframe:IsVisible() and not ma_popupframe:IsVisible() then
    FrameLib:HandleGroup("bg", function(frame) frame:Hide() end)
  elseif ma_bgframe:IsVisible() and ma_popupframe:IsVisible() then
    FrameLib:HandleGroup("bg", function(frame) frame:Hide() end)
    FrameLib:HandleGroup("popup", function(frame) frame:Hide() end)
  elseif not ma_bgframe:IsVisible() and ma_popupframe:IsVisible() then
    FrameLib:HandleGroup("bg", function(frame) frame:Show() end)
  else
    FrameLib:HandleGroup("bg", function(frame) frame:Show() end)
  end
end

function AzerothAdmin:ToggleTransparency()
  -- Toggle transparency for frames
  local currentAlpha = self.db.profile.style.transparency.frames
  if currentAlpha >= 0.9 then
    self.db.profile.style.transparency.frames = 0.5
    self.db.profile.style.transparency.backgrounds = 0.3
  else
    self.db.profile.style.transparency.frames = 1.0
    self.db.profile.style.transparency.backgrounds = 0.7
  end
  -- Apply transparency to all frames
  FrameLib:HandleGroup("bg", function(frame)
    if frame.SetAlpha then
      frame:SetAlpha(self.db.profile.style.transparency.frames)
    end
  end)
  self:Print("Transparency toggled")
end

function AzerothAdmin:ToggleTooltips()
  -- Toggle tooltip display
  self.db.profile.style.showtooltips = not self.db.profile.style.showtooltips
  if self.db.profile.style.showtooltips then
    self:Print("Tooltips enabled")
  else
    self:Print("Tooltips disabled")
  end
end

function AzerothAdmin:ToggleMinimenu()
  -- Toggle minimenu visibility
  self.db.profile.style.showminimenu = not self.db.profile.style.showminimenu
  if self.db.profile.style.showminimenu then
    FrameLib:HandleGroup("minimenu", function(frame) frame:Show() end)
    self:Print("Minimenu shown")
  else
    FrameLib:HandleGroup("minimenu", function(frame) frame:Hide() end)
    self:Print("Minimenu hidden")
  end
end

function AzerothAdmin:OnTooltipUpdate()
  -- TODO: Port to LibQTip or GameTooltip
  -- Tablet logic disabled for Ace3 migration
  --[[
  local tickets = self.db.char.newTicketQueue
  local ticketCount = 0
  for _ in pairs(tickets) do ticketCount = ticketCount + 1 end
  if ticketCount == 0 then
    local cat = Tablet:AddCategory("columns", 1)
    cat:AddLine("text", Locale["ma_TicketsNoNew"])
    AzerothAdmin:SetIcon(ROOT_PATH.."Textures\\icon")
  else
    local cat = Tablet:AddCategory(
      "columns", 1,
      "justify", "LEFT",
      "hideBlankLine", true,
      "showWithoutChildren", false,
      "child_textR", 1,
      "child_textG", 1,
      "child_textB", 1
    )
    cat:AddLine(
      "text", string.format(Locale["ma_TicketsNewNumber"], ticketCount),
      "func", function() AzerothAdmin:ShowTicketTab() end)
    local counter = 0
    local name
    for i, name in pairs(tickets) do
      counter = counter + 1
      if counter == ticketCount then
        cat:AddLine(
          "text", string.format(Locale["ma_TicketsGoLast"], name),
          "func", function(name) AzerothAdmin:TelePlayer("gochar", name) end,
          "arg1", name
        )
        cat:AddLine(
          "text", string.format(Locale["ma_TicketsGetLast"], name),
          "func", function(name) AzerothAdmin:TelePlayer("getchar", name) end,
          "arg1", name
        )
      end
    end
    AzerothAdmin:SetIcon(ROOT_PATH.."Textures\\icon2")
  end
  ]]
end

function AzerothAdmin:ToggleTabButton(group)
  --this modifies the look of tab buttons when clicked on them
  FrameLib:HandleGroup("tabbuttons",
  function(button)
    if button:GetName() == "ma_tabbutton_"..group then
      _G[button:GetName().."_texture"]:SetGradientAlpha("vertical", 102, 102, 102, 1, 102, 102, 102, 0.7)
    else
      _G[button:GetName().."_texture"]:SetGradientAlpha("vertical", 102, 102, 102, 0, 102, 102, 102, 0.7)
    end
  end)
end

function AzerothAdmin:ToggleContentGroup(group)
  --AzerothAdmin:LogAction("Toggled navigation point '"..group.."'.")
  self:HideAllGroups()
  FrameLib:HandleGroup(group, function(frame) 
    if frame and frame.Show then
      local status, err = pcall(frame.Show, frame)
      if not status then
        local name = frame.GetName and frame:GetName() or "<unnamed>"
        AzerothAdmin:Print("Error showing frame "..name..": "..tostring(err))
      end
    end
  end)
end

function AzerothAdmin:InstantGroupToggle(group)
  if group == "ticket" then
    self.db.char.requests.ticket = false
  end
  FrameLib:HandleGroup("bg", function(frame) frame:Show() end)
  AzerothAdmin:ToggleTabButton(group)
  AzerothAdmin:ToggleContentGroup(group)
end

function AzerothAdmin:TogglePopup(value, param)
  -- this toggles the AzerothAdmin Search Popup frame, toggling deactivated, popup will be overwritten
  --[[if ma_popupframe:IsVisible() then
    FrameLib:HandleGroup("popup", function(frame) frame:Hide()  end)
  else]]
  if value == "search" then
    FrameLib:HandleGroup("popup", function(frame) frame:Show() end)
    _G["ma_ptabbutton_1_texture"]:SetGradientAlpha("vertical", 102, 102, 102, 1, 102, 102, 102, 0.7)
    _G["ma_ptabbutton_2_texture"]:SetGradientAlpha("vertical", 102, 102, 102, 0, 102, 102, 102, 0.7)

    -- Hide mail-specific elements
    ma_ptabbutton_3:Hide()
    ma_mailscrollframe:Hide()
    ma_maileditbox:Hide()
    for i = 1, 12 do
      _G["ma_mailitemslot"..i]:Hide()
    end
    ma_mailmoneytext:Hide()
    ma_mailgoldeditbox:Hide()
    ma_mailgoldicon:Hide()
    ma_mailsilvereditbox:Hide()
    ma_mailsilvericon:Hide()
    ma_mailcoppereditbox:Hide()
    ma_mailcoppericon:Hide()

    ma_var1editbox:Hide()
    ma_var2editbox:Hide()
    ma_var1text:Hide()
    ma_var2text:Hide()
    ma_searchbutton:SetScript("OnClick", function() self:SearchStart(param.type, ma_searcheditbox:GetText()) end)
    ma_searcheditbox:SetScript("OnEnterPressed", function() self:SearchStart(param.type, ma_searcheditbox:GetText()) end)
    ma_searchbutton:SetText(Locale["ma_SearchButton"])
    ma_resetsearchbutton:SetScript("OnClick", function() AzerothAdmin:SearchReset() end)
    ma_resetsearchbutton:SetText(Locale["ma_ResetButton"])
    ma_resetsearchbutton:Enable()
    ma_ptabbutton_1:SetScript("OnClick", function() AzerothAdmin:TogglePopup("search", {type = param.type}) end)
    ma_ptabbutton_2:SetScript("OnClick", function() AzerothAdmin:TogglePopup("favorites", {type = param.type}) end)
    ma_ptabbutton_2:SetText("Favorites")
    ma_ptabbutton_2:Show()
    ma_selectallbutton:SetScript("OnClick", function() self:Favorites("select", param.type) end)
    ma_deselectallbutton:SetScript("OnClick", function() self:Favorites("deselect", param.type) end)
    ma_modfavsbutton:SetScript("OnClick", function() self:Favorites("add", param.type) end)
    ma_modfavsbutton:SetText(Locale["ma_FavAdd"])
    ma_modfavsbutton:Enable()
    -- Hide quest action buttons by default (shown only for quest searches)
    ma_questaddbutton:Hide()
    ma_questcompletebutton:Hide()
    ma_questremovebutton:Hide()
    ma_questrewardbutton:Hide()
    ma_queststatusbutton:Hide()
    self:SearchReset()
    self.db.char.requests.toggle = true
    if param.type == "item" then
      ma_ptabbutton_1:SetText(Locale["ma_ItemButton"])
      ma_var1editbox:Show()
      ma_var1text:Show()
      ma_var1text:SetText(Locale["ma_ItemVar1Button"])
    elseif param.type == "itemset" then
      ma_ptabbutton_1:SetText(Locale["ma_ItemSetButton"])
    elseif param.type == "spell" then
      ma_ptabbutton_1:SetText(Locale["ma_SpellButton"])
    elseif param.type == "skill" then
      ma_ptabbutton_1:SetText(Locale["ma_SkillButton"])
      ma_var1editbox:Show()
      ma_var2editbox:Show()
      ma_var1text:Show()
      ma_var2text:Show()
      ma_var1text:SetText(Locale["ma_SkillVar1Button"])
      ma_var2text:SetText(Locale["ma_SkillVar2Button"])
    elseif param.type == "quest" then
      ma_ptabbutton_1:SetText(Locale["ma_QuestButton"])
      -- Hide favorites tab for quest searches
      ma_ptabbutton_2:Hide()
      -- Hide select/deselect/add buttons for quests
      ma_selectallbutton:Hide()
      ma_deselectallbutton:Hide()
      ma_modfavsbutton:Hide()
      -- Show quest action buttons
      ma_questaddbutton:Show()
      ma_questcompletebutton:Show()
      ma_questremovebutton:Show()
      ma_questrewardbutton:Show()
      ma_queststatusbutton:Show()
      -- Initialize quest selection
      self.selectedQuest = nil
      -- Setup quest action button handlers
      self:SetupQuestActionButtons()
    elseif param.type == "creature" then
      ma_ptabbutton_1:SetText(Locale["ma_CreatureButton"])
    elseif param.type == "object" then
      ma_ptabbutton_1:SetText(Locale["ma_ObjectButton"])
      ma_var1editbox:Show()
      ma_var2editbox:Show()
      ma_var1text:Show()
      ma_var2text:Show()
      ma_var1text:SetText(Locale["ma_ObjectVar1Button"])
      ma_var2text:SetText(Locale["ma_ObjectVar2Button"])
    elseif param.type == "tele" then
      ma_ptabbutton_1:SetText(Locale["ma_TeleSearchButton"])
    elseif param.type == "ticket" then
      --[[ma_modfavsbutton:Hide()
      ma_selectallbutton:Hide()
      ma_deselectallbutton:Hide()
      ma_ptabbutton_2:Hide()
      ma_lookupresulttext:SetText(Locale["ma_TicketCount"].."0")
      ma_ptabbutton_1:SetText(Locale["ma_LoadTicketsButton"])
      ma_searchbutton:SetText(Locale["ma_Reload"])
      ma_searchbutton:SetScript("OnClick", function() self:LoadTickets() end)
      ma_resetsearchbutton:SetText(Locale["ma_LoadMore"])
      ma_resetsearchbutton:SetScript("OnClick", function() AzerothAdmin.db.profile.tickets.loading = true; self:LoadTickets(AzerothAdmin.db.profile.tickets.count) end)]]--
    end
  elseif value == "favorites" then
    self:SearchReset()
    _G["ma_ptabbutton_2_texture"]:SetGradientAlpha("vertical", 102, 102, 102, 1, 102, 102, 102, 0.7)
    _G["ma_ptabbutton_1_texture"]:SetGradientAlpha("vertical", 102, 102, 102, 0, 102, 102, 102, 0.7)

    -- Hide mail-specific elements
    ma_ptabbutton_3:Hide()
    ma_mailscrollframe:Hide()
    ma_maileditbox:Hide()
    for i = 1, 12 do
      _G["ma_mailitemslot"..i]:Hide()
    end
    ma_mailmoneytext:Hide()
    ma_mailgoldeditbox:Hide()
    ma_mailgoldicon:Hide()
    ma_mailsilvereditbox:Hide()
    ma_mailsilvericon:Hide()
    ma_mailcoppereditbox:Hide()
    ma_mailcoppericon:Hide()

    ma_modfavsbutton:SetScript("OnClick", function() self:Favorites("remove", param.type) end)
    ma_modfavsbutton:SetText(Locale["ma_FavRemove"])
    ma_modfavsbutton:Enable()
    self:Favorites("show", param.type)
  elseif value == "mail" then
    self:SetupMailPopup(param)
  end
end

function AzerothAdmin:HideAllGroups()
  FrameLib:HandleGroup("main", function(frame) frame:Hide() end)
  FrameLib:HandleGroup("char", function(frame) frame:Hide() end)
  FrameLib:HandleGroup("npc", function(frame) frame:Hide() end)
  FrameLib:HandleGroup("go", function(frame) frame:Hide() end)
  FrameLib:HandleGroup("tele", function(frame) frame:Hide() end)
  FrameLib:HandleGroup("ticket", function(frame) frame:Hide() end)
  FrameLib:HandleGroup("server", function(frame) frame:Hide() end)
  FrameLib:HandleGroup("misc", function(frame) frame:Hide() end)
end

--[[function WaitLoop(seconds)
    local stime = time() + seconds
    local deltatime = time()
    while deltatime < stime do
      deltatime = time()
  end
end

function AzerothAdmin:TicketHackTimer()
  if self.db.char.requests.ticket then
    if (time() - self.db.char.msgDeltaTime) > 0 then
      self.db.char.requests.ticketbody = 0
      self:RequestTickets()
    else
      self.db.char.msgDeltaTime = time()
      WaitLoop(1)
      self:TicketHackTimer()
    end
  end
end]]

function AzerothAdmin:AddMessage(frame, text, r, g, b, id)
  -- frame is the object that was hooked (one of the ChatFrames)
  local catchedSth = false
  local output = AzerothAdmin.db.profile.style.showchat
  if id == 1 then --make sure that the message comes from the server, message id = 1
    --Catches if Toggle is still on for some reason, but search frame is not up, and disables it so messages arent caught
    if self.db.char.requests.toggle and not ma_popupframe:IsVisible() then
      self.db.char.requests.toggle = false
    end
    if gettingGOBinfoinfo > 0 then
        if gettingGOBinfoinfo == 1 then
            ma_gobinfoinfo:SetText('')
            ma_gobinfoinfo:SetText(ma_gobinfoinfo:GetText()..text)
        else
            ma_gobinfoinfo:SetText(ma_gobinfoinfo:GetText().."\n"..text)
        end
        gettingGOBinfoinfo=gettingGOBinfoinfo+1
        if gettingGOBinfoinfo>=5 then
            gettingGOBinfoinfo=0
        end
    end
    if gettingGOBinfo > 0 then
        if gettingGOBinfo==1 then
            ma_gobtargetinfo:SetText("")
            ma_gobtargetinfo:SetText(ma_gobtargetinfo:GetText().."|cffffffff"..string.gsub(text, ']', ']\n|cffffffff'))
        else
            ma_gobtargetinfo:SetText(ma_gobtargetinfo:GetText().."\n|cffffffff"..string.gsub(text, ']', ']\n|cffffffff'))
        end
        gettingGOBinfo=gettingGOBinfo+1
        if gettingGOBinfo>=7 then
            gettingGOBinfo=0
            gettingGOBinfoinfo=1
        end
    end
    if AzerothAdmin.cWorking == 1 then
        local WorkString = string.gsub(text, '(|.........)', '') -- This removes any color formating
        --SendChatMessage("Workstring:"..WorkString)
        for mapID in string.gmatch(WorkString,'Map: %d')do
            --SendChatMessage("Mapo: "..mapID)
        end
        local t = {}
        local cnt = 1
         for cX, cY, cZ, cO in string.gmatch(WorkString, 'X: (.*) Y: (.*) Z: (.*) .*Orientation: (.*)') do
--[[            for w in string.gmatch(WorkString,'%s.%d*%p%d%d') do
                t[cnt] = string.gsub(w," ","")
                cnt = cnt + 1
            end
            cX = t[1]
            cY = t[2]
            cZ = t[3]
            cO = t[4] ]]
            --Calulate the new x y bassed on incX
        --SendChatMessage(cX)
        --SendChatMessage(cY)
        --SendChatMessage(cZ)
        --SendChatMessage(cO)
        local nX = cX + (math.cos(cO) * AzerothAdmin.incX)
        local nY = cY + (math.sin(cO) * AzerothAdmin.incX)
        --rotate the O so we can do some math
        local tD = math.deg(cO) + 90
        if tD > 360 then tD = tD - 360 end
        local nO = math.rad(tD)
        --Calulate the new x y bassed on incX
        nX = nX + (math.cos(nO) * AzerothAdmin.incY)
        nY = nY + (math.sin(nO) * AzerothAdmin.incY)
        --Send the port
        SendChatMessage('.go xyz '..' '..nX..' '..nY..' '..(cZ+AzerothAdmin.incZ))
        --console reloadui
        AzerothAdmin.incX = 0
        AzerothAdmin.incY = 0
        AzerothAdmin.incZ = 0
        local isChecked = ma_spawnonmovecheck:GetChecked()
        local isChecked2 = ma_moveonmovecheck:GetChecked()
        if isChecked == 1 then  --AddonMove
            local ObjectN = ma_Obj_idbutton:GetText()
            SendChatMessage('.gob add '..ObjectN)
        elseif isChecked2 == 1 then --MoveonMove
            SendChatMessage('.gob del '..ma_Obj_guidbutton:GetText())
            local ObjectN = ma_Obj_idbutton:GetText()
            SendChatMessage('.gob add '..ObjectN)
        else -- Just move player
        end
        AzerothAdmin.cWorking = 0
        end
        OBJTarget()
    end
    -- hook .gps for gridnavigation
    for x, y in string.gmatch(text, Strings["ma_GmatchGPS"]) do
      for k,v in pairs(self.db.char.functionQueue) do
        if v == "GridNavigate" then
          GridNavigate(string.format("%.1f", x), string.format("%.1f", y), nil)
          table.remove(self.db.char.functionQueue, k)
          break
        end
      end
    end
    if AzerothAdmin:ID_Setting_Start_Read() then
        -- Match GUID Low value from "Low: 544."
        local npc_guid_capture = string.match(text, "Low: (%d+)%.")
        if npc_guid_capture then
            AzerothAdmin:ID_Setting_Write(0, npc_guid_capture)
            ma_NPC_guidbutton:SetText(npc_guid_capture)
        end

        -- Match Entry ID from "Current Entry: 2470" or "Entry: 2470"
        local npc_entry_capture = string.match(text, "Entry: (%d+)")
        if npc_entry_capture then
            AzerothAdmin:ID_Setting_Write(1, npc_entry_capture)
            ma_NPC_idbutton:SetText(npc_entry_capture)
        end

        -- Match DisplayID from "DisplayID: 9232."
        local npc_displayid_capture = string.match(text, "DisplayID: (%d+)")
        if npc_displayid_capture then
            ma_npcdisplayid:SetText(npc_displayid_capture)
        end

        local npc_distance_capture = string.match(text, "%(Exact 3D%) ([%d%.]+)")
        if npc_distance_capture then
            ma_npc_distance_box:SetText(npc_distance_capture)
        end

        -- Reset listening state after processing all NPC info fields
        if npc_guid_capture or npc_entry_capture or npc_displayid_capture then
            AzerothAdmin:ID_Setting_Start_Write(0)
        end
    end

    if AzerothAdmin:OID_Setting_Start_Read() then
        local obj_guid_capture = string.match(text, "GUID: (%d+) ")
        if obj_guid_capture then
            AzerothAdmin:OID_Setting_Start_Write(0) -- Reset listening state after capturing GUID
            AzerothAdmin:OID_Setting_Write(0, obj_guid_capture)
            ma_Obj_guidbutton:SetText(obj_guid_capture)
        end

        local obj_entry_capture = string.match(text, " ID: (%d+)")
        if obj_entry_capture then
            ma_Obj_idbutton:SetText(obj_entry_capture)
        end

        local obj_displayid_capture = string.match(text, "DisplayID: (%d+)")
        if obj_displayid_capture then
            ma_gobdisplayid:SetText(obj_displayid_capture)
        end

        local obj_phasemask_capture = string.match(text, "Phasemask (%d+)")
        if obj_phasemask_capture then
            ma_gobsetphaseinput:SetText(obj_phasemask_capture)
        end
    end

    if AzerothAdmin:Way_Point_Add_Start_Read() then
        local b1,e1,pattern = string.find(text, "Waypoint (%d+)")
        if b1 then
            AzerothAdmin:Way_Point_Add_Start_Write(0)

            local wnpc =	ma_NPC_guidbutton:GetText()
            self:ChatMsg(".wp show on "..wnpc)
        else
        end
    end
    if self.db.char.requests.toggle then
      if self.db.char.requests.item then
        -- hook all item lookups
        for id, name in string.gmatch(text, Strings["ma_GmatchItem"]) do
            table.insert(self.db.profile.buffer.items, {itId = id, itName = name, checked = false})
            -- for item info in cache
            local itemName, itemLink, itemQuality, _, _, _, _, _, _ = GetItemInfo(id);
            if not itemName then
              GameTooltip:SetOwner(ma_popupframe, "ANCHOR_RIGHT")
              GameTooltip:SetHyperlink("item:"..id)
              GameTooltip:Hide()
            end
            PopupScrollUpdate()
            catchedSth = true
            output = AzerothAdmin.db.profile.style.showchat
        end
      elseif self.db.char.requests.itemset then
        -- hook all itemset lookups
        for id, name in string.gmatch(text, Strings["ma_GmatchItemSet"]) do
            table.insert(self.db.profile.buffer.itemsets, {isId = id, isName = name, checked = false})
            PopupScrollUpdate()
            catchedSth = true
            output = AzerothAdmin.db.profile.style.showchat
        end
      elseif self.db.char.requests.spell then
        -- hook all spell lookups
        for id, name in string.gmatch(text, Strings["ma_GmatchSpell"]) do
            table.insert(self.db.profile.buffer.spells, {spId = id, spName = name, checked = false})
            PopupScrollUpdate()
            catchedSth = true
            output = AzerothAdmin.db.profile.style.showchat
        end
      elseif self.db.char.requests.skill then
        -- hook all skill lookups
        for id, name in string.gmatch(text, Strings["ma_GmatchSkill"]) do
            table.insert(self.db.profile.buffer.skills, {skId = id, skName = name, checked = false})
            PopupScrollUpdate()
            catchedSth = true
            output = AzerothAdmin.db.profile.style.showchat
        end
      elseif self.db.char.requests.creature then
        -- hook all creature lookups
        for id, name in string.gmatch(text, Strings["ma_GmatchCreature"]) do
            table.insert(self.db.profile.buffer.creatures, {crId = id, crName = name, checked = false})
            PopupScrollUpdate()
            catchedSth = true
            output = AzerothAdmin.db.profile.style.showchat
        end
      elseif self.db.char.requests.object then
        -- hook all object lookups
        for id, name in string.gmatch(text, Strings["ma_GmatchGameObject"]) do
            table.insert(self.db.profile.buffer.objects, {objId = id, objName = name, checked = false})
            PopupScrollUpdate()
            catchedSth = true
            output = AzerothAdmin.db.profile.style.showchat
        end
      elseif self.db.char.requests.quest then
        -- hook all quest lookups
        local foundQuest = false
        -- Try primary pattern (hyperlink format)
        for id, name in string.gmatch(text, Strings["ma_GmatchQuest"]) do
            table.insert(self.db.profile.buffer.quests, {qsId = id, qsName = name, checked = false})
            PopupScrollUpdate()
            catchedSth = true
            foundQuest = true
            output = AzerothAdmin.db.profile.style.showchat
        end
        -- Fallback 1: Server format with status flags
        -- Matches: "1167 - [Quest Name]  [rewarded]" or "970 - [Quest Name]  [active]"
        if not foundQuest then
          for id, name, status in string.gmatch(text, "(%d+)%s*%-%s*%[(.-)%]%s*%[(.-)%]") do
            table.insert(self.db.profile.buffer.quests, {qsId = id, qsName = name, qsStatus = status, checked = false})
            PopupScrollUpdate()
            catchedSth = true
            foundQuest = true
            output = AzerothAdmin.db.profile.style.showchat
          end
        end
        -- Fallback 1b: Server format without status flags
        -- Matches: "11579 - [Quest Name]" (no status)
        if not foundQuest then
          for id, name in string.gmatch(text, "(%d+)%s*%-%s*%[(.-)%]") do
            table.insert(self.db.profile.buffer.quests, {qsId = id, qsName = name, qsStatus = nil, checked = false})
            PopupScrollUpdate()
            catchedSth = true
            foundQuest = true
            output = AzerothAdmin.db.profile.style.showchat
          end
        end
        -- Fallback 2: Plain text format "Quest 123: Quest Name"
        if not foundQuest then
          for id, name in string.gmatch(text, "Quest (%d+): (.+)") do
            table.insert(self.db.profile.buffer.quests, {qsId = id, qsName = name, checked = false})
            PopupScrollUpdate()
            catchedSth = true
            foundQuest = true
            output = AzerothAdmin.db.profile.style.showchat
          end
        end
        -- Fallback 3: Simple "ID - Name" format without brackets
        if not foundQuest then
          for id, name in string.gmatch(text, "^(%d+)%s*%-%s*(.+)$") do
            table.insert(self.db.profile.buffer.quests, {qsId = id, qsName = name, checked = false})
            PopupScrollUpdate()
            catchedSth = true
            foundQuest = true
            output = AzerothAdmin.db.profile.style.showchat
          end
        end
        -- Handle "No quests found!" message from server
        if not foundQuest and (string.find(text, "No quest") or string.find(text, "not found")) then
          PopupScrollUpdate()
          catchedSth = true
          output = AzerothAdmin.db.profile.style.showchat
        end
      elseif self.db.char.requests.tele then
        -- hook all tele lookups
        for id, name in string.gmatch(text, Strings["ma_GmatchTele"]) do
            table.insert(self.db.profile.buffer.teles, {tName = name, checked = false})
            PopupScrollUpdate()
            catchedSth = true
            output = AzerothAdmin.db.profile.style.showchat
        end
        --this is to hide the message shown before the teles
        if string.find(text, Strings["ma_GmatchTeleFound"]) then
          catchedSth = true
          output = AzerothAdmin.db.profile.style.showchat
        end
      end
    end

    for difftime in string.gmatch(text, Strings["ma_GmatchUpdateDiffTime"]) do --We just want the Diff time number value
      ma_difftext:SetText(difftime .. "ms")
      catchedSth = true
      output = AzerothAdmin.db.profile.style.showchat
    end

    -- hook Last 500 diff info from .server info
    for mean in string.gmatch(text, Strings["ma_GmatchMean"]) do
      ma_meantextoutput:SetText(mean .. "ms")
      catchedSth = true
      output = AzerothAdmin.db.profile.style.showchat
    end
    for median in string.gmatch(text, Strings["ma_GmatchMedian"]) do
      ma_mediantextoutput:SetText(median .. "ms")
      catchedSth = true
      output = AzerothAdmin.db.profile.style.showchat
    end
    for p95, p99, pmax in string.gmatch(text, Strings["ma_GmatchPercentiles"]) do
      --print("Matched percentiles:", p95, p99, pmax) -- Debug print
      --ma_percentilestextoutput:SetText("95th: " .. p95 .. "ms, 99th: " .. p99 .. "ms, Max: " .. pmax .. "ms")
      ma_percentilestextoutput:SetText("".. p95 .. "ms, " .. p99 .. "ms, " .. pmax .. "ms") -- simple output
      catchedSth = true
    end

    -- hook all new tickets
    for name in string.gmatch(text, Strings["ma_GmatchNewTicket"]) do
      PlaySoundFile(ROOT_PATH.."Sound\\mail.wav")
    end
    -- hook player account info
    for status, char, guid, account, id, level, ip, login, latency in string.gmatch(text, Strings["ma_GmatchAccountInfo"]) do
      if self.db.char.requests.tpinfo then
        if status == "" then
          status = Locale["ma_Online"]
        else
          status = Locale["ma_Offline"]
        end
        --table.insert(self.db.profile.buffer.tpinfo, {char = {pStatus = status, pGuid = guid, pAcc = account, pId = id, pLevel = level, pIp = ip}})
        ma_tpinfo_text:SetText(ma_tpinfo_text:GetText()..Locale["ma_TicketsInfoPlayer"]..char.." ("..guid..")\n"..Locale["ma_TicketsInfoStatus"]..status.."\n"..Locale["ma_TicketsInfoAccount"]..account.." ("..id..")\n"..Locale["ma_TicketsInfoAccLevel"]..level.."\n"..Locale["ma_TicketsInfoLastIP"]..ip.."\n"..Locale["ma_TicketsInfoLatency"]..latency)
        catchedSth = true
        output = AzerothAdmin.db.profile.style.showchat
      end
    end
    -- hook player account info
    for played, level, money in string.gmatch(text, Strings["ma_GmatchAccountInfo2"]) do
      if self.db.char.requests.tpinfo then
        ma_tpinfo_text:SetText(ma_tpinfo_text:GetText().."\n"..Locale["ma_TicketsInfoPlayedTime"]..played.."\n"..Locale["ma_TicketsInfoLevel"]..level.."\n"..Locale["ma_TicketsInfoMoney"]..money)
        catchedSth = true
        output = AzerothAdmin.db.profile.style.showchat
        self.db.char.requests.tpinfo = false
      end
    end
    --checking for .server info command to pull information for bottom right frame
    for revision in string.gmatch(text, Strings["ma_GmatchRevision"]) do
      ma_inforevisiontext:SetText(Locale["info_revision"]..revision)
      --ma_infoplatformtext:SetText(Locale["info_platform"]..platform)
        catchedSth = true
--        output = AzerothAdmin.db.profile.style.showchat
        output = AzerothAdmin.db.profile.style.showchat
    end
    for users in string.gmatch(text, Strings["ma_GmatchOnlinePlayers"]) do
      ma_infoonlinetext:SetText(Locale["info_online"]..users)
        catchedSth = true
--        output = AzerothAdmin.db.profile.style.showchat
        output = AzerothAdmin.db.profile.style.showchat
    end
    for maxConnections in string.gmatch(text, Strings ["ma_GmatchMaxConnections"]) do
      ma_infomaxonlinetext:SetText(Locale["info_maxonline"]..maxConnections)
        catchedSth = true
        output = AzerothAdmin.db.profile.style.showchat
    end
    for uptime in string.gmatch(text, Strings["ma_GmatchUptime"]) do
      ma_infouptimetext:SetText(Locale["info_uptime"]..uptime)
        catchedSth = true
--        output = AzerothAdmin.db.profile.style.showchat
        output = AzerothAdmin.db.profile.style.showchat
    end
    for match in string.gmatch(text, Strings["ma_GmatchActiveConnections"]) do
        catchedSth = true
--        output = AzerothAdmin.db.profile.style.showchat
        output = AzerothAdmin.db.profile.style.showchat
    end
    -- get results of ticket list. In Trinity, everything will be constructed off the list
    local foundTickets = false
    for id, char, create, update in string.gmatch(text, Strings["ma_GmatchTickets"]) do
        -- Clean up the ticket ID by removing non-numeric characters
        id = string.match(id, "%d+") or id
        -- Check if this ticket already exists to prevent duplicates
        local isDuplicate = false
        for _, ticket in ipairs(self.db.profile.buffer.tickets) do
            if ticket.tNumber == id then
                isDuplicate = true
                break
            end
        end
        if not isDuplicate then
            table.insert(AzerothAdmin.db.profile.buffer.tickets, {tNumber = id, tChar = char, tLCreate = create, tLUpdate = update, tMsg = ""})
            foundTickets = true
        end
        local ticketCount = 0
        for _ in pairs(AzerothAdmin.db.profile.buffer.tickets) do ticketCount = ticketCount + 1 end
        ticketCount = 0
        catchedSth = true
        output = AzerothAdmin.db.profile.style.showchat
        self.db.char.requests.ticketbody = id
        self.db.char.msgDeltaTime = time()
    end
    -- Update the display after parsing all tickets in this message
    if foundTickets and AzerothAdminCommands and AzerothAdminCommands.InlineScrollUpdate then
        AzerothAdminCommands.InlineScrollUpdate()
    end
    -- Match ticket message - handle messages that may span multiple chat lines
    if string.find(text, "Ticket Message") then
        -- Check if it's a complete single-line message first
        local singleLineMsg = string.match(text, "Ticket Message.-:%s*%[(.*)%]")
        if singleLineMsg then
            ma_ticketdetail.originalText = "|cffffff00"..singleLineMsg
            ma_ticketdetail:SetText("|cffffff00"..singleLineMsg)
            ma_ticketdetail:SetCursorPosition(0)
            ma_ticketdetail:ClearFocus()
            ma_ticketdetailscrollframe:SetVerticalScroll(0)
            catchedSth = true
            output = AzerothAdmin.db.profile.style.showchat
        else
            -- This is the start of a multiline ticket message, extract the beginning
            local ticketMsgStart = string.match(text, "Ticket Message.-:%s*%[(.*)$")
            if ticketMsgStart then
                -- Initialize the buffer with the first part
                if not AzerothAdmin.db.profile.buffer.ticketMessageBuffer then
                    AzerothAdmin.db.profile.buffer.ticketMessageBuffer = ""
                end
                AzerothAdmin.db.profile.buffer.ticketMessageBuffer = ticketMsgStart
                catchedSth = true
                output = AzerothAdmin.db.profile.style.showchat
            end
        end
    elseif AzerothAdmin.db.profile.buffer.ticketMessageBuffer then
        -- We're collecting a multi-line ticket message
        -- Check if this line ends the message (contains the closing bracket)
        -- Pattern stops at ] to handle WoW color codes like |r that may follow
        local endMatch = string.match(text, "^(.*)%]")
        if endMatch then
            -- This is the last line, append it and display the complete message
            local fullMessage = AzerothAdmin.db.profile.buffer.ticketMessageBuffer .. "\n" .. endMatch
            print("Server response - Setting ticket message:", fullMessage, "Length:", string.len(fullMessage))
            ma_ticketdetail.originalText = "|cffffff00"..fullMessage
            ma_ticketdetail:SetText("|cffffff00"..fullMessage)
            ma_ticketdetail:SetCursorPosition(0)
            ma_ticketdetail:ClearFocus()
            ma_ticketdetailscrollframe:SetVerticalScroll(0)
            print("EditBox text after server set:", ma_ticketdetail:GetText())
            -- Store the message in the tickets buffer
            local currentTicketId = ma_ticketid:GetText()
            if currentTicketId and currentTicketId ~= "" then
                for k, v in ipairs(AzerothAdmin.db.profile.buffer.tickets) do
                    if v.tNumber == currentTicketId then
                        AzerothAdmin.db.profile.buffer.tickets[k].tMsg = fullMessage
                        break
                    end
                end
            end
            -- Clear the buffer
            AzerothAdmin.db.profile.buffer.ticketMessageBuffer = nil
            catchedSth = true
            output = AzerothAdmin.db.profile.style.showchat
        else
            -- This is a middle line, append it to the buffer
            AzerothAdmin.db.profile.buffer.ticketMessageBuffer = AzerothAdmin.db.profile.buffer.ticketMessageBuffer .. "\n" .. text
            catchedSth = true
            output = AzerothAdmin.db.profile.style.showchat
        end
    end
    for eraseme in string.gmatch(text, "Showing list of open tickets") do
        catchedSth = true
        output = AzerothAdmin.db.profile.style.showchat
        -- Don't call InlineScrollUpdate here - it's called after each ticket is parsed
        -- This message appears BEFORE the ticket data, so calling it here would show 0 tickets
    end

 --[[
    -- get ticket content
    if self.db.char.requests.ticket then
      local delta = time() - self.db.char.msgDeltaTime
      if self.db.char.requests.ticketbody > 0 then
        if delta <= 300 then
          if not catchedSth then
            local ticketCount = 0
            for _ in pairs(AzerothAdmin.db.profile.buffer.tickets) do ticketCount = ticketCount + 1 end
            for k,v in ipairs(self.db.profile.buffer.tickets) do
              if k == ticketCount then
                local oldmsg = v.tMsg
                self.db.profile.buffer.tickets[k].tMsg = oldmsg..text.."\n"
              end
            end
            catchedSth = true
            output = false
          end
        else
          --self:RequestTickets()
        end
      end
    end
]]
    -- Check for possible UrlModification
    if catchedSth then
      if output == false then
        -- don't output anything
      elseif output == true then
        text = MangLinkifier_Decompose(text)
        self.hooks[frame].AddMessage(frame, text, r, g, b, id)
      end
    else
      text = MangLinkifier_Decompose(text)
      self.hooks[frame].AddMessage(frame, text, r, g, b, id)
    end
  else
    -- message is not from server
    --Linkifier should be used on non server messages as well to catch links such as items in chat
    text = MangLinkifier_Decompose(text)
    -- Returns the message to the client, or else the chat frame never shows it
    self.hooks[frame].AddMessage(frame, text, r, g, b, id)
  end
end

--[[ function AzerothAdmin:GetValueCallHandler(guid, field, value)
  -- checks for specific actions and calls functions by checking the function-order
  local called = self.db.char.getValueCallHandler.calledGetGuid
  local realGuid = self.db.char.getValueCallHandler.realGuid
  -- case checking
  if guid == value and field == "0" and not called then
    -- getting GUID and setting db variables and logged text
    self.db.char.getValueCallHandler.calledGetGuid = true
    self.db.char.getValueCallHandler.realGuid = value
    ma_toptext:SetText(Locale["char"]..Locale["guid"]..tonumber(UnitGUID("player"),16))
    return false
  elseif guid == realGuid then
    return true
  else
    AzerothAdmin:LogAction("DEBUG: Getvalues are: GUID = "..guid.."; field = "..field.."; value = "..value..";")
    return true
  end
end ]]

function AzerothAdmin:ChatMsg(msg, msgt, recipient)
  if not msgt then msgt = "say" end
  if msgt == "addon" then
    if recipient then
      SendAddonMessage("", msg, "WHISPER", recipient)
    else
      SendAddonMessage("", msg, "GUILD")
    end
  else
    if recipient then
      SendChatMessage(msg, "WHISPER", nil, recipient)
    else
      SendChatMessage(msg, msgt, nil, nil)
    end
  end
end

function AzerothAdmin:Selection(selection)
  if selection == "player" then
    if UnitIsPlayer("target") then
      return true
    end
  elseif selection == "self" then
    if UnitIsUnit("target", "player") then
      return true
    end
  elseif selection == "none" then
    if not UnitName("target") then
      return true
    end
  else
    error("Argument 'selection' can be 'player','self', or 'none'!")
    return false
  end
end

function AzerothAdmin:AndBit(value, test)
  return mod(value, test*2) >= test
end

--================================--
  --AzerothAdmin Commands functions--
--================================--
function AzerothAdmin:SetLanguage()
  -- In Ace3, locale is automatically determined by client language
  -- We can store the preference but can't dynamically change it
  if not self.db.profile.language then
    -- Get the current client locale
    local clientLocale = GetLocale()
    self.db.profile.language = clientLocale
  end
  -- Note: Locale and Strings are already set to the correct language
  -- via LibStub("AceLocale-3.0"):GetLocale() at addon load time
end

function AzerothAdmin:ChangeLanguage(locale)
  self.db.profile.localesearchstring = ma_checklocalsearchstringsbutton:GetChecked()
  self.db.profile.language = locale
  ReloadUI()
end

function AzerothAdmin:SetSkill(value, skill_arg, maxskill_arg) -- Renamed skill, maxskill to avoid conflict with editbox values
  if self:Selection("player") or self:Selection("self") or self:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    local class = UnitClass("target") or UnitClass("player")

    local skill_text = ma_var1editbox:GetText()
    local maxskill_text = ma_var2editbox:GetText()

    local skill_val
    if skill_text == "" then
        skill_val = 375
    else
        skill_val = tonumber(skill_text)
        if not skill_val then
            return
        end
    end

    local maxskill_val
    if maxskill_text == "" then
        maxskill_val = 375
    else
        maxskill_val = tonumber(maxskill_text)
        if not maxskill_val then
            return
        end
    end

    -- value here is the skill ID or table of skill IDs
    if type(value) == "string" then
      self:ChatMsg(".setskill "..value.." "..skill_val.." "..maxskill_val)
    elseif type(value) == "table" then
      for k,v_id in pairs(value) do -- Renamed 'v' to 'v_id'
        self:ChatMsg(".setskill "..v_id.." "..skill_val.." "..maxskill_val)
      end
    end
  else
    self:Print(Locale["selectionerror1"])
  end
end

function AzerothAdmin:Quest(value, state)
  if self:Selection("player") or self:Selection("self") or self:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    local class = UnitClass("target") or UnitClass("player")
    local command = ".quest add"
    local logcmd = "Added"
    local logcmd2 = "to"
    if state == "RightButton" then
      command = ".quest remove"
      logcmd = "Removed"
      logcmd2 = "from"
    end
    if type(value) == "string" then
      self:ChatMsg(command.." "..value)
    elseif type(value) == "table" then
      for k,v in pairs(value) do
        self:ChatMsg(command.." "..v)
      end
    elseif type(value) == "number" then
      self:ChatMsg(command.." "..value)
    end
  else
    self:Print(Locale["selectionerror1"])
  end
end

-- Setup quest action button handlers
function AzerothAdmin:SetupQuestActionButtons()
  -- Disable all buttons initially (until quest is selected)
  ma_questaddbutton:Disable()
  ma_questcompletebutton:Disable()
  ma_questremovebutton:Disable()
  ma_questrewardbutton:Disable()
  ma_queststatusbutton:Disable()

  -- Add Quest button
  ma_questaddbutton:SetScript("OnClick", function()
    if self.selectedQuest then
      self:QuestActionWithConfirm("add", self.selectedQuest)
    else
      self:Print(Locale["ma_QuestSelectFirst"])
    end
  end)

  -- Complete Quest button
  ma_questcompletebutton:SetScript("OnClick", function()
    if self.selectedQuest then
      self:QuestActionWithConfirm("complete", self.selectedQuest)
    else
      self:Print(Locale["ma_QuestSelectFirst"])
    end
  end)

  -- Abandon/Remove Quest button
  ma_questremovebutton:SetScript("OnClick", function()
    if self.selectedQuest then
      self:QuestActionWithConfirm("remove", self.selectedQuest)
    else
      self:Print(Locale["ma_QuestSelectFirst"])
    end
  end)

  -- Reward Quest button
  ma_questrewardbutton:SetScript("OnClick", function()
    if self.selectedQuest then
      self:QuestActionWithConfirm("reward", self.selectedQuest)
    else
      self:Print(Locale["ma_QuestSelectFirst"])
    end
  end)

  -- Quest Status button
  ma_queststatusbutton:SetScript("OnClick", function()
    if self.selectedQuest then
      self:QuestActionWithConfirm("status", self.selectedQuest)
    else
      self:Print(Locale["ma_QuestSelectFirst"])
    end
  end)
end

-- Quest action with confirmation dialog
function AzerothAdmin:QuestActionWithConfirm(action, questData)
  if not self:Selection("player") and not self:Selection("self") and not self:Selection("none") then
    self:Print(Locale["selectionerror1"])
    return
  end

  local player = UnitName("target") or UnitName("player")
  local questId = questData.qsId
  local questName = questData.qsName
  local confirmMsg = ""

  -- Build confirmation message based on action
  if action == "add" then
    confirmMsg = string.format(Locale["ma_QuestConfirmAdd"], questName, player)
  elseif action == "complete" then
    confirmMsg = string.format(Locale["ma_QuestConfirmComplete"], questName, player)
  elseif action == "remove" then
    confirmMsg = string.format(Locale["ma_QuestConfirmRemove"], questName, player)
  elseif action == "reward" then
    confirmMsg = string.format(Locale["ma_QuestConfirmReward"], questName, player)
  elseif action == "status" then
    confirmMsg = string.format(Locale["ma_QuestConfirmStatus"], questName, player)
  end

  -- Show confirmation dialog
  StaticPopupDialogs["AZEROTH_ADMIN_QUEST_CONFIRM"] = {
    text = confirmMsg,
    button1 = "Yes",
    button2 = "No",
    OnAccept = function()
      AzerothAdmin:ExecuteQuestAction(action, questId)
    end,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
    preferredIndex = 3,
  }
  StaticPopup_Show("AZEROTH_ADMIN_QUEST_CONFIRM")
end

-- Execute quest action after confirmation
function AzerothAdmin:ExecuteQuestAction(action, questId)
  local command = ""

  if action == "add" then
    command = ".quest add "..questId
  elseif action == "complete" then
    command = ".quest complete "..questId
  elseif action == "remove" then
    command = ".quest remove "..questId
  elseif action == "reward" then
    command = ".quest reward "..questId
  elseif action == "status" then
    command = ".quest status "..questId
  end

  if command ~= "" then
    self:ChatMsg(command)
  end
end

-- Select a quest and enable action buttons
function AzerothAdmin:SelectQuest(questData)
  self.selectedQuest = questData

  -- Enable all quest action buttons
  ma_questaddbutton:Enable()
  ma_questcompletebutton:Enable()
  ma_questremovebutton:Enable()
  ma_questrewardbutton:Enable()
  ma_queststatusbutton:Enable()

  -- Update the display to show the selected quest with highlighting
  PopupScrollUpdate()

  -- Update status text to show selected quest
  ma_lookupresulttext:SetText("Selected: "..questData.qsName)
end

function AzerothAdmin:Creature(value, state)
    local command = ".npc add"
    local logcmd = "Spawned"
    if state == "RightButton" then
      command = ".list creature"
      logcmd = "Listed"
    end
    if type(value) == "string" then
      self:ChatMsg(command.." "..value)
    elseif type(value) == "table" then
      for k,v in pairs(value) do
        self:ChatMsg(command.." "..v)
      end
    elseif type(value) == "number" then
      self:ChatMsg(command.." "..value)
    end
end

function AzerothAdmin:AddItem(value, state)
  if self:Selection("player") or self:Selection("self") or self:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    local amount = ma_var1editbox:GetText()
    if state == "RightButton" then
      if amount == "" then
        self:ChatMsg(".additem "..value.." -1")
      else
        local amt_num = tonumber(amount)
        if not amt_num then
          return
        end
        if amt_num > 0 then
           amt_num = amt_num * -1
        end
        self:ChatMsg(".additem "..value.." "..tostring(amt_num))
      end
    else
      if amount == "" then
        self:ChatMsg(".additem "..value)
      else
        local amt_num = tonumber(amount)
        if not amt_num then
          return
        end
        if amt_num <= 0 then
           return
        end
        self:ChatMsg(".additem "..value.." "..tostring(amt_num))
      end
    end
  else
    self:Print(Locale["selectionerror1"])
  end
end

function AzerothAdmin:AddItemSet(value)
  if self:Selection("player") or self:Selection("self") or self:Selection("none") then
    local player = UnitName("target") or UnitName("player")
    self:ChatMsg(".additem set "..value)
  else
    self:Print(Locale["selectionerror1"])
  end
end

function AzerothAdmin:AddObject(value, state)
  local loot = ma_var1editbox:GetText()
  local _time = ma_var2editbox:GetText()
  if state == "RightButton" then
    self:ChatMsg(".gobject add "..value.." "..value)
  else
    if loot ~= "" and _time == "" then
      self:ChatMsg(".gobject add "..value.. " "..loot)
    elseif loot ~= "" and _time ~= "" then
      self:ChatMsg(".gobject add "..value.. " "..loot.." ".._time)
    else
      self:ChatMsg(".gobject add "..value)
    end
  end
end

function AzerothAdmin:TelePlayer(value, player)
  if value == "gochar" then
    self:ChatMsg(".appear "..player)
  elseif value == "getchar" then
    self:ChatMsg(".summon "..player)
  end
end

local mang_Waypoint_start = 0
local mang_ID_start = 0
local mang_ID_guid = ""
local mang_ID_entryid = ""
local mang_OID_start = 0
local mang_OID_guid = ""
local mang_OID_entryid = ""

function AzerothAdmin:Way_Point_Add_Start_Write(num)
    mang_Waypoint_start = num
end

function AzerothAdmin:Way_Point_Add_Start_Read()
    return mang_Waypoint_start
end

function AzerothAdmin:ID_Setting_Start_Write(num)
    mang_ID_start = num
end

function AzerothAdmin:ID_Setting_Start_Read()
    return mang_ID_start
end

function AzerothAdmin:ID_Setting_Write(num,val)
    if num == 0 then
    -- GUID
    	mang_ID_guid = val
    elseif num == 1 then
    -- ID
    	mang_ID_entryid = val
    end
end

function AzerothAdmin:ID_Setting_Read(num)
local val = ""
    if num == 0 then
    -- GUID
    	val = mang_ID_guid
    elseif num == 1 then
    -- ID
    	val = mang_ID_entryid
    end
    return val
end

function AzerothAdmin:OID_Setting_Start_Write(num)
    mang_OID_start = num
end

function AzerothAdmin:OID_Setting_Start_Read()
    return mang_OID_start
end

function AzerothAdmin:OID_Setting_Write(num,val)

    if num == 0 then
    -- GUID
    	mang_OID_guid = val
    elseif num == 1 then
    -- ID
    	mang_OID_entryid = val
    end
end

function AzerothAdmin:OID_Setting_Read(num)
local val = ""
    if num == 0 then
    -- GUID
    	val = mang_OID_guid
    elseif num == 1 then
    -- ID
    	val = mang_OID_entryid
    end
    return val
end

function AzerothAdmin:NPCAdd_Way_o()
    local player = UnitName("target") or UnitName("player")
    local npc =	ma_NPC_guidbutton:GetText()
    self:ChatMsg(".wp add "..npc)
    self:ChatMsg(".wp show on "..npc)
end

function AzerothAdmin:WayModify()
    local player = UnitName("target") or UnitName("player")
    self:ChatMsg(".npc info")
end

function AzerothAdmin:NPC_GUID_Get_org()
    local player = UnitName("target") or UnitName("player")

    --local val1 = UnitGUID("target")
    -- F13000002E013D79 -> Object GUID is lowpart 81273  highpart F130
    --local val2 = string.sub(tostring(val1),13,18)
    -- 013D79 -> string.sub(myString, start, end)
    --local str1 = string.format("0x%s",val2)
    -- 0x013D79
    --local str2 = tonumber(str1)

    local str1 = ID_Setting_Read(0)
    ma_NPC_guidbutton:SetText(str1)

    local str2 = ID_Setting_Read(1)
    ma_NPC_idbutton:SetText(str2)
end

function AzerothAdmin:CreateGuild(leader, name)
  self:ChatMsg(".guild create "..leader.." "..name)
end

function AzerothAdmin:SendMail(recipient, subject, body)  --[TODO]:Mail-Update this to allow sending with items(mail) command
  recipient = string.gsub(recipient, " ", "")
  subject = string.gsub(subject, " ", "")
  body = string.gsub(body, "\n", " ")
  subject = '"'..subject..'"'
  body = '"'..body..'"'
  self:ChatMsg(".send mail "..recipient.." "..subject.." "..body)
end

function AzerothAdmin:UpdateMailBytesLeft()
  local bleft = 246 - strlen(ma_searcheditbox:GetText()) - strlen(ma_var1editbox:GetText()) - strlen(ma_maileditbox:GetText())
  if bleft >= 0 then
    ma_lookupresulttext:SetText(Locale["ma_MailBytesLeft"].."|cff00ff00"..bleft.."|r")
  else
    ma_lookupresulttext:SetText(Locale["ma_MailBytesLeft"].."|cffff0000"..bleft.."|r")
  end
end

-- Initialize mail item slots storage
if not AzerothAdmin.mailItemSlots then
  AzerothAdmin.mailItemSlots = {}
end

-- Handle dragging items into mail slots
function AzerothAdmin:MailItemSlotReceiveDrag(slotNum)
  local cursorType, itemId, itemLink = GetCursorInfo()

  if cursorType == "item" then
    -- Extract item ID from item link (format: |cffffffff|Hitem:12345:0:0:0:0:0:0:0|h[Item Name]|h|r)
    local extractedItemId = itemLink and itemLink:match("item:(%d+):")

    if extractedItemId then
      extractedItemId = tonumber(extractedItemId)

      -- For items on cursor, we treat them as count 1
      -- (WoW's GetCursorInfo doesn't return stack count for items)
      local count = 1

      -- Check if adding this item would exceed 12 total items
      local currentTotal = self:GetTotalMailItems()
      if currentTotal - (self.mailItemSlots[slotNum] and self.mailItemSlots[slotNum].count or 0) + count > 12 then
        self:Print("Cannot add item: Maximum 12 total items allowed!")
        ClearCursor()
        return
      end

      -- Get item info
      local itemName, _, _, _, _, _, _, _, _, texture = GetItemInfo(extractedItemId)

      if itemName and texture then
        -- Store item info with count
        self.mailItemSlots[slotNum] = {
          itemId = extractedItemId,
          itemLink = itemLink,
          itemName = itemName,
          texture = texture,
          count = count
        }

        -- Update slot icon texture
        local slot = _G["ma_mailitemslot"..slotNum]
        if slot then
          -- Create or reuse icon texture
          if not slot.iconTexture then
            slot.iconTexture = slot:CreateTexture(nil, "ARTWORK")
            slot.iconTexture:SetAllPoints(slot)
          end
          slot.iconTexture:SetTexture(texture)
          slot.iconTexture:SetTexCoord(0.07, 0.93, 0.07, 0.93)  -- Crop borders for clean display

          -- Create or reuse count text
          if not slot.countText then
            slot.countText = slot:CreateFontString(nil, "OVERLAY", "NumberFontNormal")
            slot.countText:SetPoint("BOTTOMRIGHT", -2, 2)
          end

          if count and count > 1 then
            slot.countText:SetText(count)
            slot.countText:Show()
          else
            slot.countText:SetText("")
            slot.countText:Hide()
          end
        end

        ClearCursor()

        -- Update send button state
        self:UpdateMailItemsSendButton()
      end
    end
  end
end

-- Clear a mail item slot
function AzerothAdmin:MailItemSlotClear(slotNum)
  self.mailItemSlots[slotNum] = nil
  local slot = _G["ma_mailitemslot"..slotNum]
  if slot then
    -- Clear icon texture
    if slot.iconTexture then
      slot.iconTexture:SetTexture(nil)
    end

    -- Clear count display
    if slot.countText then
      slot.countText:SetText("")
      slot.countText:Hide()
    end
  end

  -- Update send button state
  self:UpdateMailItemsSendButton()
end

-- Get total item count (including stacks)
function AzerothAdmin:GetTotalMailItems()
  local total = 0
  for i = 1, 12 do
    if self.mailItemSlots[i] and self.mailItemSlots[i].count then
      total = total + self.mailItemSlots[i].count
    end
  end
  return total
end

-- Update send button state based on item count (only for tab 2)
function AzerothAdmin:UpdateMailItemsSendButton()
  -- Only update if we're on the Items tab
  if not self.currentMailTab or self.currentMailTab ~= 2 then
    return
  end

  local total = self:GetTotalMailItems()
  if total > 12 then
    ma_searchbutton:Disable()
    ma_lookupresulttext:SetText("Too many items! ("..total.."/12) - Right-click to remove")
  elseif total == 0 then
    ma_searchbutton:Disable()
    ma_lookupresulttext:SetText("Drop items into slots (0/12)")
  else
    if not ma_searchbutton.cooldownActive then
      ma_searchbutton:Enable()
    end
    ma_lookupresulttext:SetText("Items ready to send ("..total.."/12)")
  end
end

-- Send mail with items
function AzerothAdmin:SendMailWithItems(recipient, subject, body)
  recipient = string.gsub(recipient, " ", "")
  subject = string.gsub(subject, " ", "")
  body = string.gsub(body, "\n", " ")
  subject = '"'..subject..'"'
  body = '"'..body..'"'

  -- Collect item IDs with counts from slots
  local itemEntries = {}
  for i = 1, 12 do
    if self.mailItemSlots[i] and self.mailItemSlots[i].itemId then
      local itemId = self.mailItemSlots[i].itemId
      local count = self.mailItemSlots[i].count or 1
      -- Format: itemid:count
      table.insert(itemEntries, itemId..":"..count)
    end
  end

  if #itemEntries == 0 then
    self:Print("No items selected to send!")
    return
  end

  -- Build item list with space separation
  local itemList = table.concat(itemEntries, " ")

  -- Send mail with items using .send items command
  self:ChatMsg(".send items "..recipient.." "..subject.." "..body.." "..itemList)

  -- Clear item slots
  for i = 1, 12 do
    self:MailItemSlotClear(i)
  end
end

-- Send mail with money
function AzerothAdmin:SendMailWithMoney(recipient, subject, gold, silver, copper, body)
  recipient = string.gsub(recipient, " ", "")
  subject = string.gsub(subject, " ", "")
  body = string.gsub(body, "\n", " ")
  subject = '"'..subject..'"'
  body = '"'..body..'"'

  -- Convert to total copper
  local totalCopper = (gold * 10000) + (silver * 100) + copper

  if totalCopper <= 0 then
    self:Print("No money amount specified!")
    return
  end

  -- Send mail with money using .send money command
  self:ChatMsg(".send money "..recipient.." "..subject.." "..body.." "..totalCopper)
end

function AzerothAdmin:Favorites(value, searchtype)
  if value == "add" then
    if searchtype == "item" then
      for k,v in pairs(self.db.profile.buffer.items) do if v["checked"] then table.insert(self.db.profile.favorites.items, {itId = v["itId"], itName = v["itName"], checked = false}) end end
    elseif searchtype == "itemset" then
      for k,v in pairs(self.db.profile.buffer.itemsets) do if v["checked"] then table.insert(self.db.profile.favorites.itemsets, {isId = v["isId"], isName = v["isName"], checked = false}) end end
    elseif searchtype == "spell" then
      for k,v in pairs(self.db.profile.buffer.spells) do if v["checked"] then table.insert(self.db.profile.favorites.spells, {spId = v["spId"], spName = v["spName"], checked = false}) end end
    elseif searchtype == "skill" then
      for k,v in pairs(self.db.profile.buffer.skills) do if v["checked"] then table.insert(self.db.profile.favorites.skills, {skId = v["skId"], skName = v["skName"], checked = false}) end end
    elseif searchtype == "quest" then
      for k,v in pairs(self.db.profile.buffer.quests) do if v["checked"] then table.insert(self.db.profile.favorites.quests, {qsId = v["qsId"], qsName = v["qsName"], checked = false}) end end
    elseif searchtype == "creature" then
      for k,v in pairs(self.db.profile.buffer.creatures) do if v["checked"] then table.insert(self.db.profile.favorites.creatures, {crId = v["crId"], crName = v["crName"], checked = false}) end end
    elseif searchtype == "object" then
      for k,v in pairs(self.db.profile.buffer.objects) do if v["checked"] then table.insert(self.db.profile.favorites.objects, {objId = v["objId"], objName = v["objName"], checked = false}) end end
    elseif searchtype == "tele" then
      for k,v in pairs(self.db.profile.buffer.teles) do if v["checked"] then table.insert(self.db.profile.favorites.teles, {tName = v["tName"], checked = false}) end end
    end
  elseif value == "remove" then
    if searchtype == "item" then
      for i = #self.db.profile.favorites.items, 1, -1 do
        if self.db.profile.favorites.items[i]["checked"] then
          table.remove(self.db.profile.favorites.items, i)
        end
      end
    elseif searchtype == "itemset" then
      for i = #self.db.profile.favorites.itemsets, 1, -1 do
        if self.db.profile.favorites.itemsets[i]["checked"] then
          table.remove(self.db.profile.favorites.itemsets, i)
        end
      end
    elseif searchtype == "spell" then
      for i = #self.db.profile.favorites.spells, 1, -1 do
        if self.db.profile.favorites.spells[i]["checked"] then
          table.remove(self.db.profile.favorites.spells, i)
        end
      end
    elseif searchtype == "skill" then
      for i = #self.db.profile.favorites.skills, 1, -1 do
        if self.db.profile.favorites.skills[i]["checked"] then
          table.remove(self.db.profile.favorites.skills, i)
        end
      end
    elseif searchtype == "quest" then
      for i = #self.db.profile.favorites.quests, 1, -1 do
        if self.db.profile.favorites.quests[i]["checked"] then
          table.remove(self.db.profile.favorites.quests, i)
        end
      end
    elseif searchtype == "creature" then
      for i = #self.db.profile.favorites.creatures, 1, -1 do
        if self.db.profile.favorites.creatures[i]["checked"] then
          table.remove(self.db.profile.favorites.creatures, i)
        end
      end
    elseif searchtype == "object" then
      for i = #self.db.profile.favorites.objects, 1, -1 do
        if self.db.profile.favorites.objects[i]["checked"] then
          table.remove(self.db.profile.favorites.objects, i)
        end
      end
    elseif searchtype == "tele" then
      for i = #self.db.profile.favorites.teles, 1, -1 do
        if self.db.profile.favorites.teles[i]["checked"] then
          table.remove(self.db.profile.favorites.teles, i)
        end
      end
    end
    PopupScrollUpdate()
  elseif value == "show" then
    if searchtype == "item" then
      self.db.char.requests.favitem = true
    elseif searchtype == "itemset" then
      self.db.char.requests.favitemset = true
    elseif searchtype == "spell" then
      self.db.char.requests.favspell = true
    elseif searchtype == "skill" then
      self.db.char.requests.favskill = true
    elseif searchtype == "quest" then
      self.db.char.requests.favquest = true
    elseif searchtype == "creature" then
      self.db.char.requests.favcreature = true
    elseif searchtype == "object" then
      self.db.char.requests.favobject = true
    elseif searchtype == "tele" then
      self.db.char.requests.favtele = true
    end
    PopupScrollUpdate()
  elseif value == "select" or value == "deselect" then
    local selected = true
    if value == "deselect" then
      selected = false
    end
    if searchtype == "item" then
      if AzerothAdmin.db.char.requests.item then
        for k,v in pairs(self.db.profile.buffer.items) do self.db.profile.buffer.items[k].checked = selected end
      elseif AzerothAdmin.db.char.requests.favitem then
        for k,v in pairs(self.db.profile.favorites.items) do self.db.profile.favorites.items[k].checked = selected end
      end
    elseif searchtype == "itemset" then
      if AzerothAdmin.db.char.requests.itemset then
        for k,v in pairs(self.db.profile.buffer.itemsets) do self.db.profile.buffer.itemsets[k].checked = selected end
      elseif AzerothAdmin.db.char.requests.favitemset then
        for k,v in pairs(self.db.profile.favorites.itemsets) do self.db.profile.favorites.itemsets[k].checked = selected end
      end
    elseif searchtype == "spell" then
      if AzerothAdmin.db.char.requests.spell then
        for k,v in pairs(self.db.profile.buffer.spells) do self.db.profile.buffer.spells[k].checked = selected end
      elseif AzerothAdmin.db.char.requests.favspell then
        for k,v in pairs(self.db.profile.favorites.spells) do self.db.profile.favorites.spells[k].checked = selected end
      end
    elseif searchtype == "skill" then
      if AzerothAdmin.db.char.requests.skill then
        for k,v in pairs(self.db.profile.buffer.skills) do self.db.profile.buffer.skills[k].checked = selected end
      elseif AzerothAdmin.db.char.requests.favskill then
        for k,v in pairs(self.db.profile.favorites.skills) do self.db.profile.favorites.skills[k].checked = selected end
      end
    elseif searchtype == "quest" then
      if AzerothAdmin.db.char.requests.quest then
        for k,v in pairs(self.db.profile.buffer.quests) do self.db.profile.buffer.quests[k].checked = selected end
      elseif AzerothAdmin.db.char.requests.favquest then
        for k,v in pairs(self.db.profile.favorites.quests) do self.db.profile.favorites.quests[k].checked = selected end
      end
    elseif searchtype == "creature" then
      if AzerothAdmin.db.char.requests.creature then
        for k,v in pairs(self.db.profile.buffer.creatures) do self.db.profile.buffer.creatures[k].checked = selected end
      elseif AzerothAdmin.db.char.requests.favcreature then
        for k,v in pairs(self.db.profile.favorites.creatures) do self.db.profile.favorites.creatures[k].checked = selected end
      end
    elseif searchtype == "object" then
      if AzerothAdmin.db.char.requests.object then
        for k,v in pairs(self.db.profile.buffer.objects) do self.db.profile.buffer.objects[k].checked = selected end
      elseif AzerothAdmin.db.char.requests.favobject then
        for k,v in pairs(self.db.profile.favorites.objects) do self.db.profile.favorites.objects[k].checked = selected end
      end
    elseif searchtype == "tele" then
      if AzerothAdmin.db.char.requests.tele then
        for k,v in pairs(self.db.profile.buffer.teles) do self.db.profile.buffer.teles[k].checked = selected end
      elseif AzerothAdmin.db.char.requests.favtele then
        for k,v in pairs(self.db.profile.favorites.teles) do self.db.profile.favorites.teles[k].checked = selected end
      end
    end
    PopupScrollUpdate()
  end
end

function AzerothAdmin:SearchStart(var, value)
  self.db.char.requests.toggle = true
  if var == "item" then
    self.db.char.requests.item = true
    self.db.profile.buffer.items = {}
    self:ChatMsg(".lookup item "..value)
  elseif var == "itemset" then
    self.db.char.requests.itemset = true
    self.db.profile.buffer.itemsets = {}
    self:ChatMsg(".lookup item set "..value)
  elseif var == "spell" then
    self.db.char.requests.spell = true
    self.db.profile.buffer.spells = {}
    self:ChatMsg(".lookup spell "..value)
  elseif var == "skill" then
    self.db.char.requests.skill = true
    self.db.profile.buffer.skills = {}
    self:ChatMsg(".lookup skill "..value)
  elseif var == "quest" then
    self.db.char.requests.quest = true
    self.db.profile.buffer.quests = {}
    self:ChatMsg(".lookup quest "..value)
  elseif var == "creature" then
    self.db.char.requests.creature = true
    self.db.profile.buffer.creatures = {}
    self:ChatMsg(".lookup creature "..value)
  elseif var == "object" then
    self.db.char.requests.object = true
    self.db.profile.buffer.objects = {}
    self:ChatMsg(".lookup object "..value)
  elseif var == "tele" then
    self.db.char.requests.tele = true
    self.db.profile.buffer.teles = {}
    self:ChatMsg(".lookup tele "..value)
  end
  self.db.profile.buffer.counter = 0
end

function AzerothAdmin:SearchReset()
  ma_searcheditbox:SetScript("OnTextChanged", function() end)
  ma_var1editbox:SetScript("OnTextChanged", function() end)
  ma_searcheditbox:SetText("")
  ma_var1editbox:SetText("")
  ma_var2editbox:SetText("")
  ma_lookupresulttext:SetText(Locale["searchResults"].."0")
  self.db.char.requests.item = false
  self.db.char.requests.favitem = false
  self.db.char.requests.itemset = false
  self.db.char.requests.favitemset = false
  self.db.char.requests.spell = false
  self.db.char.requests.favspell = false
  self.db.char.requests.skill = false
  self.db.char.requests.favskill = false
  self.db.char.requests.quest = false
  self.db.char.requests.favquest = false
  self.db.char.requests.creature = false
  self.db.char.requests.favcreature = false
  self.db.char.requests.object = false
  self.db.char.requests.favobject = false
  self.db.char.requests.tele = false
  self.db.char.requests.favtele = false
  self.db.char.requests.toggle = false
  self.db.profile.buffer.items = {}
  self.db.profile.buffer.itemsets = {}
  self.db.profile.buffer.spells = {}
  self.db.profile.buffer.skills = {}
  self.db.profile.buffer.quests = {}
  self.db.profile.buffer.creatures = {}
  self.db.profile.buffer.objects = {}
  self.db.profile.buffer.teles = {}
  self.db.profile.buffer.counter = 0
  PopupScrollUpdate()
end

function AzerothAdmin:PrepareScript(object, text, script)
  if object then
    if text then
      if self.db.profile.style.showtooltips then
        object:SetScript("OnEnter", function(self) GameTooltip:SetOwner(self, "ANCHOR_RIGHT"); GameTooltip:SetText(text); GameTooltip:Show() end)
        object:SetScript("OnLeave", function(self) GameTooltip:SetOwner(self, "ANCHOR_RIGHT"); GameTooltip:Hide() end)
      end
    end
    if type(script) == "function" then
      object:SetScript("OnClick", script)
    elseif type(script) == "table" then
      for k,v in pairs(script) do
        object:SetScript(unpack(v))
      end
    end
  end
end

--[[INITIALIZION FUNCTIONS]]
function AzerothAdmin:InitButtons()
  -- start tab buttons
  self:PrepareScript(ma_tabbutton_main       , Locale["tt_MainButton"]         , function() AzerothAdmin:InstantGroupToggle("main") end)
  self:PrepareScript(ma_tabbutton_char       , Locale["tt_CharButton"]         , function() AzerothAdmin:InstantGroupToggle("char") end)
  self:PrepareScript(ma_tabbutton_npc        , Locale["tt_NpcButton"]          , function() AzerothAdmin:InstantGroupToggle("npc"); end)
  self:PrepareScript(ma_tabbutton_go         , Locale["tt_GOButton"]           , function() AzerothAdmin:InstantGroupToggle("go"); end)
  self:PrepareScript(ma_tabbutton_tele       , Locale["tt_TeleButton"]         , function() AzerothAdmin:InstantGroupToggle("tele"); end)
  self:PrepareScript(ma_tabbutton_misc       , Locale["tt_MiscButton"]         , function() AzerothAdmin:InstantGroupToggle("misc") end)
  self:PrepareScript(ma_tabbutton_server     , Locale["tt_ServerButton"]       , function() AzerothAdmin:InstantGroupToggle("server") end)
  --end tab buttons
  -- start mini buttons
  self:PrepareScript(ma_mm_logoframe         , nil                             , function() AzerothAdmin:OnClick() end)
  self:PrepareScript(ma_mm_mainbutton        , Locale["tt_MainButton"]         , function() AzerothAdmin:InstantGroupToggle("main") end)
  self:PrepareScript(ma_mm_charbutton        , Locale["tt_CharButton"]         , function() AzerothAdmin:InstantGroupToggle("char") end)
  self:PrepareScript(ma_mm_npcbutton         , Locale["tt_NpcButton"]          , function() AzerothAdmin:InstantGroupToggle("npc") end)
  self:PrepareScript(ma_mm_gobutton          , Locale["tt_GOButton"]           , function() AzerothAdmin:InstantGroupToggle("go") end)
  self:PrepareScript(ma_mm_telebutton        , Locale["tt_TeleButton"]         , function() AzerothAdmin:InstantGroupToggle("tele") end)
  self:PrepareScript(ma_mm_ticketbutton      , Locale["tt_TicketButton"]       , function() AzerothAdminCommands.ShowTicketTab() end)
  self:PrepareScript(ma_mm_miscbutton        , Locale["tt_MiscButton"]         , function() AzerothAdmin:InstantGroupToggle("misc") end)
  self:PrepareScript(ma_mm_serverbutton      , Locale["tt_ServerButton"]       , function() AzerothAdmin:InstantGroupToggle("server") end)
  --end mini buttons
  self:PrepareScript(ma_languagebutton       , Locale["tt_LanguageButton"]     , function() AzerothAdmin:ChangeLanguage(UIDropDownMenu_GetSelectedValue(ma_languagedropdown)) end)
  self:PrepareScript(ma_itembutton           , Locale["tt_ItemButton"]         , function() AzerothAdmin:TogglePopup("search", {type = "item"}) end)
  self:PrepareScript(ma_itemsetbutton        , Locale["tt_ItemSetButton"]      , function() AzerothAdmin:TogglePopup("search", {type = "itemset"}) end)
  self:PrepareScript(ma_spellbutton          , Locale["tt_SpellButton"]        , function() AzerothAdmin:TogglePopup("search", {type = "spell"}) end)
  self:PrepareScript(ma_skillbutton          , Locale["tt_SkillButton"]        , function() AzerothAdmin:TogglePopup("search", {type = "skill"}) end)
  self:PrepareScript(ma_questbutton          , Locale["tt_QuestButton"]        , function() AzerothAdmin:TogglePopup("search", {type = "quest"}) end)
  self:PrepareScript(ma_creaturebutton       , Locale["tt_CreatureButton"]     , function() AzerothAdmin:TogglePopup("search", {type = "creature"}) end)
  self:PrepareScript(ma_objectbutton         , Locale["tt_ObjectButton"]       , function() AzerothAdmin:TogglePopup("search", {type = "object"}) end)
  self:PrepareScript(ma_telesearchbutton     , Locale["ma_TeleSearchButton"]   , function() AzerothAdmin:TogglePopup("search", {type = "tele"}) end)
  self:PrepareScript(ma_sendmailbutton       , Locale["ma_Mail"]               , function() AzerothAdmin:TogglePopup("mail", {}) end)
  self:PrepareScript(ma_searchbutton         , nil                             , function() AzerothAdmin:SearchStart("item", ma_searcheditbox:GetText()) end)
  self:PrepareScript(ma_resetsearchbutton    , nil                             , function() AzerothAdmin:SearchReset() end)
  self:PrepareScript(ma_closebutton          , Locale["tt_CloseWindow"]        , function() AzerothAdmin:CloseButton("bg") end)
  self:PrepareScript(ma_popupclosebutton     , Locale["tt_CloseWindow"]        , function() AzerothAdmin:CloseButton("popup") end)
  self:PrepareScript(ma_popup2closebutton    , Locale["tt_CloseWindow"]        , function() AzerothAdmin:CloseButton("popup2") end)
  self:PrepareScript(ma_inforefreshbutton    , Locale["tt_RefreshButton"]      , function() AzerothAdmin:ChatMsg(".server info") end)
  self:PrepareScript(ma_frmtrslider          , Locale["tt_FrmTrSlider"]        , {{"OnMouseUp", function() AzerothAdmin:ChangeTransparency("frames") end},{"OnValueChanged", function() ma_frmtrsliderText:SetText(string.format("%.2f", ma_frmtrslider:GetValue())) end}})
  self:PrepareScript(ma_btntrslider          , Locale["tt_BtnTrSlider"]        , {{"OnMouseUp", function() AzerothAdmin:ChangeTransparency("buttons") end},{"OnValueChanged", function() ma_btntrsliderText:SetText(string.format("%.2f", ma_btntrslider:GetValue())) end}})
  self:PrepareScript(ma_mm_revivebutton      , nil                             , function() SendChatMessage(".revive", "GUILD", nil, nil) end)
end

function AzerothAdmin:InitDropDowns()
  -- RELOAD TABLES
  local function ReloadTableDropDownInitialize()
    local level = 1
    local info = UIDropDownMenu_CreateInfo()
    local buttons = { -- data taken from source code
      {"All","all"},
      {"All gossips","all gossips"},
      {"All item","all item"},
      {"All locales","all locales"},
      {"All loot","all loot"},
      {"All_npc","all npc"},
      {"All_quest","all quest"},
      {"All scripts","all scripts"},
      {"All spell","all spell"},
      {"acore_string","acore_string"},
      {"areatrigger_tavern","areatrigger_tavern"},
      {"areatrigger_teleport","areatrigger_teleport"},
      {"autobroadcast","autobroadcast"},
      {"command","command"},
      {"conditions","conditions"},
      {"config","config"},
      {"creature_linked_respawn","creature_linked_respawn"},
      {"creature_onkill_reputation","creature_onkill_reputation"},
      {"creature_template","creature_template"},
      {"creature_text","creature_text"},
      {"disables","disables"},
      {"game_graveyard","game_graveyard"},
      {"game_tele","game_tele"},
      {"graveyard_zone","graveyard_zone"},
      {"item_set_names","item_set_names"},
      {"lfg_dungeon_rewards","lfg_dungeon_rewards"},
      {"reserved_name","reserved_name"},
      {"skill_discovery_template","skill_discovery_template"},
      {"skill_extra_item_template","skill_extra_item_template"},
      {"skill_fishing_base_level","skill_fishing_base_level"},
    }
    for k,v in pairs(buttons) do
      info.text = v[1]
      info.value = v[2]
      info.checked = (UIDropDownMenu_GetSelectedValue(ma_reloadtabledropdown) == v[2])
      info.func = function(self) UIDropDownMenu_SetSelectedValue(ma_reloadtabledropdown, self.value) end
      info.icon = nil
      info.keepShownOnClick = nil
      UIDropDownMenu_AddButton(info, level)
    end
  end
  UIDropDownMenu_Initialize(ma_reloadtabledropdown, ReloadTableDropDownInitialize)
  UIDropDownMenu_SetWidth(ma_reloadtabledropdown, 70)
  UIDropDownMenu_SetButtonWidth(ma_reloadtabledropdown, 20)
  UIDropDownMenu_SetSelectedValue(ma_reloadtabledropdown, "all")

  -- WEATHER
  local function WeatherDropDownInitialize()
    local level = 1
    local info = UIDropDownMenu_CreateInfo()
    local buttons = {
      {Locale["ma_WeatherFine"],"0 0"},
      {Locale["ma_WeatherFog"],"0 1"},
      {Locale["ma_WeatherRain"],"1 1"},
      {Locale["ma_WeatherSnow"],"2 1"},
      {Locale["ma_WeatherSand"],"3 1"}
    }
    for k,v in pairs(buttons) do
      info.text = v[1]
      info.value = v[2]
      info.func = function(self) UIDropDownMenu_SetSelectedValue(ma_weatherdropdown, self.value) end
      info.checked = (UIDropDownMenu_GetSelectedValue(ma_weatherdropdown) == v[2])
      --info.notCheckable = true
      info.icon = nil
      info.keepShownOnClick = nil
      UIDropDownMenu_AddButton(info, level)
    end
  end
  UIDropDownMenu_Initialize(ma_weatherdropdown, WeatherDropDownInitialize)
  UIDropDownMenu_SetWidth(ma_weatherdropdown, 70)
  UIDropDownMenu_SetButtonWidth(ma_weatherdropdown, 20)
  UIDropDownMenu_SetSelectedValue(ma_weatherdropdown, "0 0")

  --NPC EMOTE
  local function NpcEmoteDropDownInitialize()
    local level = 1
    local info = UIDropDownMenu_CreateInfo()
    local buttons = {
      {"None","0"},
      {"Talk","1"},
      {"Bow","2"},
      {"Wave","3"},
      {"Cheer","4"},
      {"Exclamation","5"},
      {"Question","6"},
      {"Eat","7"},
      {"Dance","10"},
      {"Laugh","11"},
      {"Sleep","12"},
      {"Rude","14"},
      {"Roar","15"},
      {"Kneel","16"},
      {"Kiss","17"},
      {"Cry","18"},
      {"Chicken","19"},
      {"Beg","20"},
      {"Applaud","21"},
      {"Shout","22"},
      {"Flex","23"},
      {"Shy","24"},
      {"Point","25"},
      {"Stand","26"},
      {"ReadyUnarmed","27"},
      {"Work","28"},
      {"Point","29"},
      {"None","30"},
      {"Wound","33"},
      {"WoundCritical","34"},
      {"AttackUnarmed","35"},
      {"Attack1H","36"},
      {"Attack2H","37"},
    }
    for k,v in pairs(buttons) do
      info.text = v[1]
      info.value = v[2]
      info.func = function(self) UIDropDownMenu_SetSelectedValue(ma_npcemotedropdown, self.value) end
      info.checked = (UIDropDownMenu_GetSelectedValue(ma_npcemotedropdown) == v[2])
      --info.notCheckable = true
      info.icon = nil
      info.keepShownOnClick = nil
      UIDropDownMenu_AddButton(info, level)
    end
  end
  UIDropDownMenu_Initialize(ma_npcemotedropdown, NpcEmoteDropDownInitialize)
  UIDropDownMenu_SetWidth(ma_npcemotedropdown, 85)
  UIDropDownMenu_SetButtonWidth(ma_npcemotedropdown, 20)
  UIDropDownMenu_SetSelectedValue(ma_npcemotedropdown, "0")

  --NPC EMOTE
  local function NpcEmoteDropDownInitialize()
    local level = 1
    local info = UIDropDownMenu_CreateInfo()
    local buttons = {
      {"None","0"},
      {"Attack2H","38"},
      {"ParryUnarmed","39"},
      {"ParryShield","43"},
      {"ReadyUnarmed","44"},
      {"Ready1H","45"},
      {"ReadyBow","48"},
      {"SpellCast","51"},
      {"Battleroar","53"},
      {"SpecialAttack1H","54"},
      {"Kick","60"},
      {"AttackThrow","61"},
      {"Stun","64"},
      {"Salute","66"},
      {"UseStand","69"},
      {"CheerArmed","71"},
      {"EatArmed","92"},
      {"StunArmed","93"},
      {"Dance","94"},
      {"SaluteArmed","113"},
      {"UseArmed","133"},
      {"LaughArmed","153"},
      {"WorkArmed","173"},
      {"ReadyRifle","213"},
      {"MineArmed","233"},
      {"ChopArmed","234"},
      {"GolfClap","253"},
      {"Yes","273"},
      {"No","274"},
      {"Train","275"},
      {"Ready1H","333"},
      {"AtEase","313"},
      {"SpellKneel","353"}
    }
    for k,v in pairs(buttons) do
      info.text = v[1]
      info.value = v[2]
      info.func = function(self) UIDropDownMenu_SetSelectedValue(ma_npcemotedropdown_a, self.value) end
      info.checked = (UIDropDownMenu_GetSelectedValue(ma_npcemotedropdown_a) == v[2])
      --info.notCheckable = true
      info.icon = nil
      info.keepShownOnClick = nil
      UIDropDownMenu_AddButton(info, level)
    end
  end
  UIDropDownMenu_Initialize(ma_npcemotedropdown_a, NpcEmoteDropDownInitialize)
  UIDropDownMenu_SetWidth(ma_npcemotedropdown_a, 85)
  UIDropDownMenu_SetButtonWidth(ma_npcemotedropdown_a, 20)
  UIDropDownMenu_SetSelectedValue(ma_npcemotedropdown_a, "0")

  --LANGUAGE
  local function LangDropDownInitialize()
    local level = 1
    local info = UIDropDownMenu_CreateInfo()
    local buttons = {
      {"Deutsch","deDE"},
      {"English","enUS"},
      {"Español","esES"},
      {"Español (México)","esMX"},
      {"Français","frFR"},
      {"Italiano","itIT"},
      {"Português (Brasil)","ptBR"},
      {"Português","ptPT"},
      {"Russian","ruRU"},               -- instead of "Русский"
      {"Korean","koKR"},                -- instead of "한국어"
      {"Chinese (Simplified)","zhCN"},  -- instead of "简体中文"
      {"Chinese (Traditional)","zhTW"}  -- instead of "繁體中文"
    }
    for k,v in pairs(buttons) do
      info.text = v[1]
      info.value = v[2]
      info.func = function(self) UIDropDownMenu_SetSelectedValue(ma_languagedropdown, self.value) end
      info.checked = (UIDropDownMenu_GetSelectedValue(ma_languagedropdown) == v[2])
      --info.notCheckable = true
      info.icon = nil
      info.keepShownOnClick = nil
      UIDropDownMenu_AddButton(info, level)
    end
  end
  UIDropDownMenu_Initialize(ma_languagedropdown, LangDropDownInitialize)
  UIDropDownMenu_SetWidth(ma_languagedropdown, 70)
  UIDropDownMenu_SetButtonWidth(ma_languagedropdown, 20)
  UIDropDownMenu_SetSelectedValue(ma_languagedropdown, GetLocale())

  -- Add tooltip to language dropdown
  if self.db.profile.style.showtooltips then
    ma_languagedropdown:SetScript("OnEnter", function(self)
      GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
      GameTooltip:SetText("Language Locale future update planned")
      GameTooltip:Show()
    end)
    ma_languagedropdown:SetScript("OnLeave", function(self)
      GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
      GameTooltip:Hide()
    end)
  end

  -- FRAME STRATA DROPDOWN
  local function FrameStrataDropDownInitialize()
    local level = 1
    local info = {}
    local strataLevels = {
      {value = "BACKGROUND", text = Locale["ma_FrameStrataBackground"]},
      {value = "LOW", text = Locale["ma_FrameStrataLow"]},
      {value = "MEDIUM", text = Locale["ma_FrameStrataMedium"]},
      {value = "HIGH", text = Locale["ma_FrameStrataHigh"]},
      {value = "DIALOG", text = Locale["ma_FrameStrataDialog"]},
      {value = "FULLSCREEN", text = Locale["ma_FrameStrataFullscreen"]},
      {value = "FULLSCREEN_DIALOG", text = Locale["ma_FrameStrataFullscreenDialog"]}
    }
    for _, strata in ipairs(strataLevels) do
      info.text = strata.text
      info.value = strata.value
      info.func = function()
        AzerothAdmin:ChangeFrameStrata(strata.value)
        UIDropDownMenu_SetSelectedValue(ma_framestratadropdown, strata.value)
      end
      info.checked = (AzerothAdmin.db.profile.style.framestrata == strata.value)
      info.icon = nil
      info.keepShownOnClick = nil
      UIDropDownMenu_AddButton(info, level)
    end
  end
  UIDropDownMenu_Initialize(ma_framestratadropdown, FrameStrataDropDownInitialize)
  UIDropDownMenu_SetWidth(ma_framestratadropdown, 100)
  UIDropDownMenu_SetButtonWidth(ma_framestratadropdown, 20)
  UIDropDownMenu_SetSelectedValue(ma_framestratadropdown, AzerothAdmin.db.profile.style.framestrata)

end

function AzerothAdmin:InitSliders()
  -- Frame Transparency Slider
  ma_frmtrslider:SetOrientation("HORIZONTAL")
  ma_frmtrslider:SetMinMaxValues(0.1, 1.0)
  ma_frmtrslider:SetValueStep(0.05)
  ma_frmtrslider:SetValue(AzerothAdmin.db.profile.style.transparency.frames)
  ma_frmtrsliderText:SetText(string.format("%.2f", AzerothAdmin.db.profile.style.transparency.frames))
  -- Button Transparency Slider
  ma_btntrslider:SetOrientation("HORIZONTAL")
  ma_btntrslider:SetMinMaxValues(0.1, 1.0)
  ma_btntrslider:SetValueStep(0.05)
  ma_btntrslider:SetValue(AzerothAdmin.db.profile.style.transparency.buttons)
  ma_btntrsliderText:SetText(string.format("%.2f", AzerothAdmin.db.profile.style.transparency.buttons))
end

function AzerothAdmin:InitScrollFrames()
  cont = AzerothAdmin.db.char.selectedCont
  ma_PopupScrollBar:SetScript("OnVerticalScroll", function(self, offset) FauxScrollFrame_OnVerticalScroll(self, offset, 30, PopupScrollUpdate) end)
  ma_PopupScrollBar:SetScript("OnShow", function() PopupScrollUpdate() end)
  --local zoneupdate = function() Mang:TeleScrollUpdate() end
  ma_ZoneScrollBar:SetScript("OnVerticalScroll", function(self, offset) FauxScrollFrame_OnVerticalScroll(self, offset, 16, AzerothAdminCommands.TeleScrollUpdate) end)
  ma_ZoneScrollBar:SetScript("OnShow", function() AzerothAdminCommands.TeleScrollUpdate() end)
  ma_SubzoneScrollBar:SetScript("OnVerticalScroll", function(self, offset) FauxScrollFrame_OnVerticalScroll(self, offset, 16, AzerothAdminCommands.SubzoneScrollUpdate) end)
  ma_SubzoneScrollBar:SetScript("OnShow", function() AzerothAdminCommands.SubzoneScrollUpdate() end)
  --ma_ticketscrollframe:SetScrollChild(ma_ticketeditbox)
  --ma_ticketscrollframe1:SetText("No Data")
--  ma_ticketscrollframe:SetScript("OnVerticalScroll", InlineScrollUpdate("onlinelist"), function(self, offset) FauxScrollFrame_OnVerticalScroll(self, offset-1, 16, InlineScrollUpdate("onlinelist")) end)
--  ma_ticketscrollframe:SetScript("OnShow", function() InlineScrollUpdate("onlinelist") end)

  --ma_ticketeditbox:SetScript("OnTextChanged", function() ScrollingEdit_OnTextChanged(self, ma_ticketeditbox) end)
  --ma_ticketeditbox:SetScript("OnCursorChanged", function() ScrollingEdit_OnCursorChanged(self, x, y, w, h) end)
 -- ma_ticketeditbox:SetScript("OnUpdate", function() ScrollingEdit_OnUpdate(self, 10, ma_ticketeditbox) end)
--[[  self:PrepareScript(ma_ticketeditbox, nil, {{"OnTextChanged", function() ScrollingEdit_OnTextChanged(self, ma_ticketeditbox) end},
    {"OnCursorChanged", function() ScrollingEdit_OnCursorChanged(self, x, y, w, h) end},
    {"OnUpdate", function() ScrollingEdit_OnUpdate(self, 0, ma_ticketeditbox) end}}) ]]
  ma_mailscrollframe:SetScrollChild(ma_maileditbox)
  ma_maileditbox:SetScript("OnTextChanged", function() AzerothAdmin:UpdateMailBytesLeft() end)
  ma_maileditbox:SetScript("OnCursorChanged", function() ScrollingEdit_OnCursorChanged(self, x, y, w, h) end)
--  ma_maileditbox:SetScript("OnUpdate", function() ScrollingEdit_OnUpdate(self, 0, ma_maileditbox) end)
--[[  self:PrepareScript(ma_maileditbox, nil, {{"OnTextChanged", function() ScrollingEdit_OnTextChanged(self, ma_maileditbox); AzerothAdmin:UpdateMailBytesLeft() end},
    {"OnCursorChanged", function() ScrollingEdit_OnCursorChanged(self, x, y, w, h) end},
    {"OnUpdate", function() ScrollingEdit_OnUpdate(self, 0, ma_maileditbox) end}})
]]
end

function AzerothAdmin:NoResults(var)
  if var == "ticket" then
    -- Reset list and make an entry "No Tickets"
    --ma_ticketeditbox:SetText(Locale["ma_TicketsNoTickets"])
    FauxScrollFrame_Update(ma_ZoneScrollBar,12,12,30);
    for line = 1,12 do
      _G["ma_ZoneScrollBarEntry"..line]:Disable()
      if line == 1 then
        _G["ma_ZoneScrollBarEntry"..line]:SetText(Locale["ma_TicketsNoTickets"])
        _G["ma_ZoneScrollBarEntry"..line]:Show()
      else
        _G["ma_ZoneScrollBarEntry"..line]:Hide()
      end
    end
  elseif var == "search" then
    ma_lookupresulttext:SetText(Locale["searchResults"].."0")
    FauxScrollFrame_Update(ma_PopupScrollBar,7,7,30);
    for line = 1,7 do
      _G["ma_PopupScrollBarEntryIcon"..line]:Hide()
      _G["ma_PopupScrollBarEntry"..line]:Disable()
      _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:Disable()
      _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:Hide()
      if line == 1 then
        _G["ma_PopupScrollBarEntry"..line]:SetText(Locale["tt_SearchDefault"])
        _G["ma_PopupScrollBarEntry"..line]:Show()
      else
        _G["ma_PopupScrollBarEntry"..line]:Hide()
      end
    end
  elseif var == "favorites" then
    ma_lookupresulttext:SetText(Locale["favoriteResults"].."0")
    FauxScrollFrame_Update(ma_PopupScrollBar,7,7,30);
    for line = 1,7 do
      _G["ma_PopupScrollBarEntryIcon"..line]:Hide()
      _G["ma_PopupScrollBarEntry"..line]:Disable()
      _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:Disable()
      _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:Hide()
      if line == 1 then
        _G["ma_PopupScrollBarEntry"..line]:SetText(Locale["ma_NoFavorites"])
        _G["ma_PopupScrollBarEntry"..line]:Show()
      else
        _G["ma_PopupScrollBarEntry"..line]:Hide()
      end
    end
  elseif var == "zones" then
    FauxScrollFrame_Update(ma_ZoneScrollBar,12,12,16);
    for line = 1,12 do
      _G["ma_ZoneScrollBarEntry"..line]:Disable()
      if line == 1 then
        _G["ma_ZoneScrollBarEntry"..line]:SetText(Locale["ma_NoZones"])
        _G["ma_ZoneScrollBarEntry"..line]:Show()
      else
        _G["ma_ZoneScrollBarEntry"..line]:Hide()
      end
    end
  elseif var == "subzones" then
    FauxScrollFrame_Update(ma_SubzoneScrollBar,12,12,16);
    for line = 1,12 do
      _G["ma_SubzoneScrollBarEntry"..line]:Disable()
      if line == 1 then
        _G["ma_SubzoneScrollBarEntry"..line]:SetText(Locale["ma_NoSubZones"])
        _G["ma_SubzoneScrollBarEntry"..line]:Show()
      else
        _G["ma_SubzoneScrollBarEntry"..line]:Hide()
      end
    end
  end
end

function PopupScrollUpdate()
  local line -- 1 through 7 of our window to scroll
  local lineplusoffset -- an index into our data calculated from the scroll offset
  if AzerothAdmin.db.char.requests.item or AzerothAdmin.db.char.requests.favitem then --get items
    local count = 0
    if AzerothAdmin.db.char.requests.item then
      for _ in pairs(AzerothAdmin.db.profile.buffer.items) do count = count + 1 end
    elseif AzerothAdmin.db.char.requests.favitem then
      for _ in pairs(AzerothAdmin.db.profile.favorites.items) do count = count + 1 end
    end
    if count > 0 then
      ma_lookupresulttext:SetText(Locale["searchResults"]..count)
      FauxScrollFrame_Update(ma_PopupScrollBar,count,7,30);
      for line = 1,7 do
        lineplusoffset = line + FauxScrollFrame_GetOffset(ma_PopupScrollBar)
        if lineplusoffset <= count then
          local item
          if AzerothAdmin.db.char.requests.item then
            item = AzerothAdmin.db.profile.buffer.items[lineplusoffset]
          elseif AzerothAdmin.db.char.requests.favitem then
            item = AzerothAdmin.db.profile.favorites.items[lineplusoffset]
          end
          local key = lineplusoffset
          --item icons
          _G["ma_PopupScrollBarEntryIcon"..line.."IconTexture"]:SetTexture(GetItemIcon(item["itId"]))
          _G["ma_PopupScrollBarEntryIcon"..line]:SetScript("OnEnter", function(self) GameTooltip:SetOwner(self, "ANCHOR_RIGHT"); GameTooltip:SetHyperlink("item:"..item["itId"]); GameTooltip:Show() end)
          _G["ma_PopupScrollBarEntryIcon"..line]:SetScript("OnLeave", function(self) GameTooltip:SetOwner(self, "ANCHOR_RIGHT"); GameTooltip:Hide() end)
          _G["ma_PopupScrollBarEntryIcon"..line]:SetScript("OnClick", function(self, button) AzerothAdmin:AddItem(item["itId"], button) end)
          _G["ma_PopupScrollBarEntryIcon"..line]:Show()
          --item description
          _G["ma_PopupScrollBarEntry"..line]:SetText("Id: |cffffffff"..item["itId"].."|r Name: |cffffffff"..item["itName"].."|r")
          _G["ma_PopupScrollBarEntry"..line]:SetScript("OnClick", function(self, button) AzerothAdmin:AddItem(item["itId"], button) end)
          _G["ma_PopupScrollBarEntry"..line]:SetScript("OnEnter", function(self) GameTooltip:SetOwner(self, "ANCHOR_RIGHT"); GameTooltip:SetHyperlink("item:"..item["itId"]); GameTooltip:Show() end)
          _G["ma_PopupScrollBarEntry"..line]:SetScript("OnLeave", function(self) GameTooltip:SetOwner(self, "ANCHOR_RIGHT"); GameTooltip:Hide() end)
          _G["ma_PopupScrollBarEntry"..line]:Enable()
          _G["ma_PopupScrollBarEntry"..line]:Show()
          if AzerothAdmin.db.char.requests.item then
            if item["checked"] then
              _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:SetScript("OnClick", function() AzerothAdmin.db.profile.buffer.items[key]["checked"] = false; PopupScrollUpdate() end)
            else
              _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:SetScript("OnClick", function() AzerothAdmin.db.profile.buffer.items[key]["checked"] = true; PopupScrollUpdate() end)
            end
          elseif AzerothAdmin.db.char.requests.favitem then
            if item["checked"] then
              _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:SetScript("OnClick", function() AzerothAdmin.db.profile.favorites.items[key]["checked"] = false; PopupScrollUpdate() end)
            else
              _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:SetScript("OnClick", function() AzerothAdmin.db.profile.favorites.items[key]["checked"] = true; PopupScrollUpdate() end)
            end
          end
          _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:SetChecked(item["checked"])
          _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:Enable()
          _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:Show()
        else
          _G["ma_PopupScrollBarEntryIcon"..line]:Hide()
          _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:Hide()
          _G["ma_PopupScrollBarEntry"..line]:Hide()
        end
      end
    else
      if AzerothAdmin.db.char.requests.item then
        AzerothAdmin:NoResults("search")
      elseif AzerothAdmin.db.char.requests.favitem then
        AzerothAdmin:NoResults("favorites")
      end
    end

  elseif AzerothAdmin.db.char.requests.itemset or AzerothAdmin.db.char.requests.favitemset then --get itemsets
    local count = 0
    if AzerothAdmin.db.char.requests.itemset then
      for _ in pairs(AzerothAdmin.db.profile.buffer.itemsets) do count = count + 1 end
    elseif AzerothAdmin.db.char.requests.favitemset then
      for _ in pairs(AzerothAdmin.db.profile.favorites.itemsets) do count = count + 1 end
    end
    if count > 0 then
      ma_lookupresulttext:SetText(Locale["searchResults"]..count)
      FauxScrollFrame_Update(ma_PopupScrollBar,count,7,30);
      for line = 1,7 do
        _G["ma_PopupScrollBarEntryIcon"..line]:Hide()
        lineplusoffset = line + FauxScrollFrame_GetOffset(ma_PopupScrollBar)
        if lineplusoffset <= count then
          local itemset
          if AzerothAdmin.db.char.requests.itemset then
            itemset = AzerothAdmin.db.profile.buffer.itemsets[lineplusoffset]
          elseif AzerothAdmin.db.char.requests.favitemset then
            itemset = AzerothAdmin.db.profile.favorites.itemsets[lineplusoffset]
          end
          local key = lineplusoffset
          _G["ma_PopupScrollBarEntry"..line]:SetText("Id: |cffffffff"..itemset["isId"].."|r Name: |cffffffff"..itemset["isName"].."|r")
          _G["ma_PopupScrollBarEntry"..line]:SetScript("OnClick", function() AzerothAdmin:AddItemSet(itemset["isId"]) end)
          _G["ma_PopupScrollBarEntry"..line]:SetScript("OnEnter", function() --[[Do nothing]] end)
          _G["ma_PopupScrollBarEntry"..line]:SetScript("OnLeave", function() --[[Do nothing]] end)
          _G["ma_PopupScrollBarEntry"..line]:Enable()
          _G["ma_PopupScrollBarEntry"..line]:Show()
          if AzerothAdmin.db.char.requests.itemset then
            if itemset["checked"] then
              _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:SetScript("OnClick", function() AzerothAdmin.db.profile.buffer.itemsets[key]["checked"] = false; PopupScrollUpdate() end)
            else
              _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:SetScript("OnClick", function() AzerothAdmin.db.profile.buffer.itemsets[key]["checked"] = true; PopupScrollUpdate() end)
            end
          elseif AzerothAdmin.db.char.requests.favitemset then
            if itemset["checked"] then
              _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:SetScript("OnClick", function() AzerothAdmin.db.profile.favorites.itemsets[key]["checked"] = false; PopupScrollUpdate() end)
            else
              _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:SetScript("OnClick", function() AzerothAdmin.db.profile.favorites.itemsets[key]["checked"] = true; PopupScrollUpdate() end)
            end
          end
          _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:SetChecked(itemset["checked"])
          _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:Enable()
          _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:Show()
        else
          _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:Hide()
          _G["ma_PopupScrollBarEntry"..line]:Hide()
        end
      end
    else
      if AzerothAdmin.db.char.requests.itemset then
        AzerothAdmin:NoResults("search")
      elseif AzerothAdmin.db.char.requests.favitemset then
        AzerothAdmin:NoResults("favorites")
      end
    end

  elseif AzerothAdmin.db.char.requests.quest or AzerothAdmin.db.char.requests.favquest then --get quests
    local count = 0
    if AzerothAdmin.db.char.requests.quest then
      for _ in pairs(AzerothAdmin.db.profile.buffer.quests) do count = count + 1 end
    elseif AzerothAdmin.db.char.requests.favquest then
      for _ in pairs(AzerothAdmin.db.profile.favorites.quests) do count = count + 1 end
    end
    if count > 0 then
      ma_lookupresulttext:SetText(Locale["searchResults"]..count)
      FauxScrollFrame_Update(ma_PopupScrollBar,count,7,30);
      for line = 1,7 do
        _G["ma_PopupScrollBarEntryIcon"..line]:Hide()
        lineplusoffset = line + FauxScrollFrame_GetOffset(ma_PopupScrollBar)
        if lineplusoffset <= count then
          local quest
          if AzerothAdmin.db.char.requests.quest then
            quest = AzerothAdmin.db.profile.buffer.quests[lineplusoffset]
          elseif AzerothAdmin.db.char.requests.favquest then
            quest = AzerothAdmin.db.profile.favorites.quests[lineplusoffset]
          end
          local key = lineplusoffset
          -- Build display text with status flags
          local displayText = "Id: |cffffffff"..quest["qsId"].."|r Name: |cffffffff"..quest["qsName"].."|r"

          -- Add status flag with color coding
          if quest["qsStatus"] then
            if quest["qsStatus"] == "rewarded" then
              displayText = displayText .. " |cff808080[rewarded]|r"  -- Gray for rewarded quests
            elseif quest["qsStatus"] == "active" then
              displayText = displayText .. " |cffffff00[active]|r"  -- Yellow for active quests
            elseif quest["qsStatus"] == "complete" then
              displayText = displayText .. " |cff00ff00[complete]|r"  -- Green for completed quests (ready to turn in)
            else
              displayText = displayText .. " |cffaaaaaa["..quest["qsStatus"].."]|r"  -- Light gray for other statuses
            end
          end

          -- Highlight selected quest
          if AzerothAdmin.selectedQuest and AzerothAdmin.selectedQuest.qsId == quest["qsId"] then
            displayText = "|cff00ff00> " .. displayText .. " <|r"  -- Green highlight for selected quest
          end
          _G["ma_PopupScrollBarEntry"..line]:SetText(displayText)
          -- Click to select quest (no longer auto-adds)
          _G["ma_PopupScrollBarEntry"..line]:SetScript("OnClick", function(self, button)
            AzerothAdmin:SelectQuest(quest)
          end)
          _G["ma_PopupScrollBarEntry"..line]:SetScript("OnEnter", function() --[[Do nothing]] end)
          _G["ma_PopupScrollBarEntry"..line]:SetScript("OnLeave", function() --[[Do nothing]] end)
          _G["ma_PopupScrollBarEntry"..line]:Enable()
          _G["ma_PopupScrollBarEntry"..line]:Show()
          -- Hide checkboxes for quest searches (no favorites system)
          _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:Hide()
        else
          _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:Hide()
          _G["ma_PopupScrollBarEntry"..line]:Hide()
        end
      end
    else
      if AzerothAdmin.db.char.requests.quest then
        AzerothAdmin:NoResults("search")
      elseif AzerothAdmin.db.char.requests.favquest then
        AzerothAdmin:NoResults("favorites")
      end
    end

  elseif AzerothAdmin.db.char.requests.creature or AzerothAdmin.db.char.requests.favcreature then --get creatures
    local count = 0
    if AzerothAdmin.db.char.requests.creature then
      for _ in pairs(AzerothAdmin.db.profile.buffer.creatures) do count = count + 1 end
    elseif AzerothAdmin.db.char.requests.favcreature then
      for _ in pairs(AzerothAdmin.db.profile.favorites.creatures) do count = count + 1 end
    end
    if count > 0 then
      ma_lookupresulttext:SetText(Locale["searchResults"]..count)
      FauxScrollFrame_Update(ma_PopupScrollBar,count,7,30);
      for line = 1,7 do
        _G["ma_PopupScrollBarEntryIcon"..line]:Hide()
        lineplusoffset = line + FauxScrollFrame_GetOffset(ma_PopupScrollBar)
        if lineplusoffset <= count then
          local creature
          if AzerothAdmin.db.char.requests.creature then
            creature = AzerothAdmin.db.profile.buffer.creatures[lineplusoffset]
          elseif AzerothAdmin.db.char.requests.favcreature then
            creature = AzerothAdmin.db.profile.favorites.creatures[lineplusoffset]
          end
          local key = lineplusoffset
          _G["ma_PopupScrollBarEntry"..line]:SetText("Id: |cffffffff"..creature["crId"].."|r Name: |cffffffff"..creature["crName"].."|r")
          _G["ma_PopupScrollBarEntry"..line]:SetScript("OnClick", function(self, button) AzerothAdmin:Creature(creature["crId"], button) end)
          _G["ma_PopupScrollBarEntry"..line]:SetScript("OnEnter", function() --[[Do nothing]] end)
          _G["ma_PopupScrollBarEntry"..line]:SetScript("OnLeave", function() --[[Do nothing]] end)
          _G["ma_PopupScrollBarEntry"..line]:Enable()
          _G["ma_PopupScrollBarEntry"..line]:Show()
          if AzerothAdmin.db.char.requests.creature then
            if creature["checked"] then
              _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:SetScript("OnClick", function() AzerothAdmin.db.profile.buffer.creatures[key]["checked"] = false; PopupScrollUpdate() end)
            else
              _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:SetScript("OnClick", function() AzerothAdmin.db.profile.buffer.creatures[key]["checked"] = true; PopupScrollUpdate() end)
            end
          elseif AzerothAdmin.db.char.requests.favcreature then
            if creature["checked"] then
              _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:SetScript("OnClick", function() AzerothAdmin.db.profile.favorites.creatures[key]["checked"] = false; PopupScrollUpdate() end)
            else
              _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:SetScript("OnClick", function() AzerothAdmin.db.profile.favorites.creatures[key]["checked"] = true; PopupScrollUpdate() end)
            end
          end
          _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:SetChecked(creature["checked"])
          _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:Enable()
          _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:Show()
        else
          _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:Hide()
          _G["ma_PopupScrollBarEntry"..line]:Hide()
        end
      end
    else
      if AzerothAdmin.db.char.requests.creature then
        AzerothAdmin:NoResults("search")
      elseif AzerothAdmin.db.char.requests.favcreature then
        AzerothAdmin:NoResults("favorites")
      end
    end

  elseif AzerothAdmin.db.char.requests.spell or AzerothAdmin.db.char.requests.favspell then --get spells
    local count = 0
    if AzerothAdmin.db.char.requests.spell then
      for _ in pairs(AzerothAdmin.db.profile.buffer.spells) do count = count + 1 end
    elseif AzerothAdmin.db.char.requests.favspell then
      for _ in pairs(AzerothAdmin.db.profile.favorites.spells) do count = count + 1 end
    end
    if count > 0 then
      ma_lookupresulttext:SetText(Locale["searchResults"]..count)
      FauxScrollFrame_Update(ma_PopupScrollBar,count,7,30);
      for line = 1,7 do
        _G["ma_PopupScrollBarEntryIcon"..line]:Hide()
        lineplusoffset = line + FauxScrollFrame_GetOffset(ma_PopupScrollBar)
        if lineplusoffset <= count then
          local spell
          if AzerothAdmin.db.char.requests.spell then
            spell = AzerothAdmin.db.profile.buffer.spells[lineplusoffset]
          elseif AzerothAdmin.db.char.requests.favspell then
            spell = AzerothAdmin.db.profile.favorites.spells[lineplusoffset]
          end
          local key = lineplusoffset
          --spell icon
          --_G["ma_PopupScrollBarEntryIcon"..line.."IconTexture"]:SetTexture(GetSpellTexture(spell["spId"],BOOKTYPE_SPELL))
          --spell info
          _G["ma_PopupScrollBarEntry"..line]:SetText("Id: |cffffffff"..spell["spId"].."|r Name: |cffffffff"..spell["spName"].."|r")
          _G["ma_PopupScrollBarEntry"..line]:SetScript("OnEnter", function() --[[Do nothing]] end)
          _G["ma_PopupScrollBarEntry"..line]:SetScript("OnLeave", function() --[[Do nothing]] end)
          _G["ma_PopupScrollBarEntry"..line]:SetScript("OnClick", function(self, button) AzerothAdminCommands.LearnSpell(spell["spId"], button) end)
          _G["ma_PopupScrollBarEntry"..line]:Enable()
          _G["ma_PopupScrollBarEntry"..line]:Show()
          if AzerothAdmin.db.char.requests.spell then
            if spell["checked"] then
              _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:SetScript("OnClick", function() AzerothAdmin.db.profile.buffer.spells[key]["checked"] = false; PopupScrollUpdate() end)
            else
              _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:SetScript("OnClick", function() AzerothAdmin.db.profile.buffer.spells[key]["checked"] = true; PopupScrollUpdate() end)
            end
          elseif AzerothAdmin.db.char.requests.favspell then
            if spell["checked"] then
              _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:SetScript("OnClick", function() AzerothAdmin.db.profile.favorites.spells[key]["checked"] = false; PopupScrollUpdate() end)
            else
              _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:SetScript("OnClick", function() AzerothAdmin.db.profile.favorites.spells[key]["checked"] = true; PopupScrollUpdate() end)
            end
          end
          _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:SetChecked(spell["checked"])
          _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:Enable()
          _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:Show()
        else
          _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:Hide()
          _G["ma_PopupScrollBarEntry"..line]:Hide()
        end
      end
    else
      if AzerothAdmin.db.char.requests.spell then
        AzerothAdmin:NoResults("search")
      elseif AzerothAdmin.db.char.requests.favspell then
        AzerothAdmin:NoResults("favorites")
      end
    end

  elseif AzerothAdmin.db.char.requests.skill or AzerothAdmin.db.char.requests.favskill then --get skills
    local count = 0
    if AzerothAdmin.db.char.requests.skill then
      for _ in pairs(AzerothAdmin.db.profile.buffer.skills) do count = count + 1 end
    elseif AzerothAdmin.db.char.requests.favskill then
      for _ in pairs(AzerothAdmin.db.profile.favorites.skills) do count = count + 1 end
    end
    if count > 0 then
      ma_lookupresulttext:SetText(Locale["searchResults"]..count)
      FauxScrollFrame_Update(ma_PopupScrollBar,count,7,30);
      for line = 1,7 do
        _G["ma_PopupScrollBarEntryIcon"..line]:Hide()
        lineplusoffset = line + FauxScrollFrame_GetOffset(ma_PopupScrollBar)
        if lineplusoffset <= count then
          local skill
          if AzerothAdmin.db.char.requests.skill then
            skill = AzerothAdmin.db.profile.buffer.skills[lineplusoffset]
          elseif AzerothAdmin.db.char.requests.favskill then
            skill = AzerothAdmin.db.profile.favorites.skills[lineplusoffset]
          end
          local key = lineplusoffset
          _G["ma_PopupScrollBarEntry"..line]:SetText("Id: |cffffffff"..skill["skId"].."|r Name: |cffffffff"..skill["skName"].."|r")
          _G["ma_PopupScrollBarEntry"..line]:SetScript("OnEnter", function() --[[Do nothing]] end)
          _G["ma_PopupScrollBarEntry"..line]:SetScript("OnLeave", function() --[[Do nothing]] end)
          _G["ma_PopupScrollBarEntry"..line]:SetScript("OnClick", function() AzerothAdmin:SetSkill(skill["skId"], nil, nil) end)
          _G["ma_PopupScrollBarEntry"..line]:Enable()
          _G["ma_PopupScrollBarEntry"..line]:Show()
          if AzerothAdmin.db.char.requests.skill then
            if skill["checked"] then
              _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:SetScript("OnClick", function() AzerothAdmin.db.profile.buffer.skills[key]["checked"] = false; PopupScrollUpdate() end)
            else
              _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:SetScript("OnClick", function() AzerothAdmin.db.profile.buffer.skills[key]["checked"] = true; PopupScrollUpdate() end)
            end
          elseif AzerothAdmin.db.char.requests.favskill then
            if skill["checked"] then
              _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:SetScript("OnClick", function() AzerothAdmin.db.profile.favorites.skills[key]["checked"] = false; PopupScrollUpdate() end)
            else
              _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:SetScript("OnClick", function() AzerothAdmin.db.profile.favorites.skills[key]["checked"] = true; PopupScrollUpdate() end)
            end
          end
          _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:SetChecked(skill["checked"])
          _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:Enable()
          _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:Show()
        else
          _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:Hide()
          _G["ma_PopupScrollBarEntry"..line]:Hide()
        end
      end
    else
      if AzerothAdmin.db.char.requests.skill then
        AzerothAdmin:NoResults("search")
      elseif AzerothAdmin.db.char.requests.favskill then
        AzerothAdmin:NoResults("favorites")
      end
    end

  elseif AzerothAdmin.db.char.requests.object or AzerothAdmin.db.char.requests.favobject then --get objects
    local count = 0
    if AzerothAdmin.db.char.requests.object then
      for _ in pairs(AzerothAdmin.db.profile.buffer.objects) do count = count + 1 end
    elseif AzerothAdmin.db.char.requests.favobject then
      for _ in pairs(AzerothAdmin.db.profile.favorites.objects) do count = count + 1 end
    end
    if count > 0 then
      ma_lookupresulttext:SetText(Locale["searchResults"]..count)
      FauxScrollFrame_Update(ma_PopupScrollBar,count,7,30);
      for line = 1,7 do
        _G["ma_PopupScrollBarEntryIcon"..line]:Hide()
        lineplusoffset = line + FauxScrollFrame_GetOffset(ma_PopupScrollBar)
        if lineplusoffset <= count then
          local object
          if AzerothAdmin.db.char.requests.object then
            object = AzerothAdmin.db.profile.buffer.objects[lineplusoffset]
          elseif AzerothAdmin.db.char.requests.favobject then
            object = AzerothAdmin.db.profile.favorites.objects[lineplusoffset]
          end
          local key = lineplusoffset
          _G["ma_PopupScrollBarEntry"..line]:SetText("Id: |cffffffff"..object["objId"].."|r Name: |cffffffff"..object["objName"].."|r")
          _G["ma_PopupScrollBarEntry"..line]:SetScript("OnClick", function(self, button) AzerothAdmin:AddObject(object["objId"], button) end)
          _G["ma_PopupScrollBarEntry"..line]:SetScript("OnEnter", function() --[[Do nothing]] end)
          _G["ma_PopupScrollBarEntry"..line]:SetScript("OnLeave", function() --[[Do nothing]] end)
          _G["ma_PopupScrollBarEntry"..line]:Enable()
          _G["ma_PopupScrollBarEntry"..line]:Show()
          if AzerothAdmin.db.char.requests.object then
            if object["checked"] then
              _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:SetScript("OnClick", function() AzerothAdmin.db.profile.buffer.objects[key]["checked"] = false; PopupScrollUpdate() end)
            else
              _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:SetScript("OnClick", function() AzerothAdmin.db.profile.buffer.objects[key]["checked"] = true; PopupScrollUpdate() end)
            end
          elseif AzerothAdmin.db.char.requests.favobject then
            if object["checked"] then
              _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:SetScript("OnClick", function() AzerothAdmin.db.profile.favorites.objects[key]["checked"] = false; PopupScrollUpdate() end)
            else
              _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:SetScript("OnClick", function() AzerothAdmin.db.profile.favorites.objects[key]["checked"] = true; PopupScrollUpdate() end)
            end
          end
          _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:SetChecked(object["checked"])
          _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:Enable()
          _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:Show()
        else
          _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:Hide()
          _G["ma_PopupScrollBarEntry"..line]:Hide()
        end
      end
    else
      if AzerothAdmin.db.char.requests.object then
        AzerothAdmin:NoResults("search")
      elseif AzerothAdmin.db.char.requests.favobject then
        AzerothAdmin:NoResults("favorites")
      end
    end

  elseif AzerothAdmin.db.char.requests.tele or AzerothAdmin.db.char.requests.favtele then --get teles
    local count = 0
    if AzerothAdmin.db.char.requests.tele then
      for _ in pairs(AzerothAdmin.db.profile.buffer.teles) do count = count + 1 end
    elseif AzerothAdmin.db.char.requests.favtele then
      for _ in pairs(AzerothAdmin.db.profile.favorites.teles) do count = count + 1 end
    end
    if count > 0 then
      ma_lookupresulttext:SetText(Locale["searchResults"]..count)
      FauxScrollFrame_Update(ma_PopupScrollBar,count,7,30);
      for line = 1,7 do
        _G["ma_PopupScrollBarEntryIcon"..line]:Hide()
        lineplusoffset = line + FauxScrollFrame_GetOffset(ma_PopupScrollBar)
        if lineplusoffset <= count then
          local tele
          if AzerothAdmin.db.char.requests.tele then
            tele = AzerothAdmin.db.profile.buffer.teles[lineplusoffset]
          elseif AzerothAdmin.db.char.requests.favtele then
            tele = AzerothAdmin.db.profile.favorites.teles[lineplusoffset]
          end
          local key = lineplusoffset
          _G["ma_PopupScrollBarEntry"..line]:SetText("Name: |cffffffff"..tele["tName"].."|r")
          _G["ma_PopupScrollBarEntry"..line]:SetScript("OnClick", function() AzerothAdmin:ChatMsg(".tele "..tele["tName"]) end)
          _G["ma_PopupScrollBarEntry"..line]:SetScript("OnEnter", function() --[[Do nothing]] end)
          _G["ma_PopupScrollBarEntry"..line]:SetScript("OnLeave", function() --[[Do nothing]] end)
          _G["ma_PopupScrollBarEntry"..line]:Enable()
          _G["ma_PopupScrollBarEntry"..line]:Show()
          if AzerothAdmin.db.char.requests.tele then
            if tele["checked"] then
              _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:SetScript("OnClick", function() AzerothAdmin.db.profile.buffer.teles[key]["checked"] = false; PopupScrollUpdate() end)
            else
              _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:SetScript("OnClick", function() AzerothAdmin.db.profile.buffer.teles[key]["checked"] = true; PopupScrollUpdate() end)
            end
          elseif AzerothAdmin.db.char.requests.favtele then
            if tele["checked"] then
              _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:SetScript("OnClick", function() AzerothAdmin.db.profile.favorites.teles[key]["checked"] = false; PopupScrollUpdate() end)
            else
              _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:SetScript("OnClick", function() AzerothAdmin.db.profile.favorites.teles[key]["checked"] = true; PopupScrollUpdate() end)
            end
          end
          _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:SetChecked(tele["checked"])
          _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:Enable()
          _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:Show()
        else
          _G["ma_PopupScrollBarEntry"..line.."ChkBtn"]:Hide()
          _G["ma_PopupScrollBarEntry"..line]:Hide()
        end
      end
    else
      if AzerothAdmin.db.char.requests.tele then
        AzerothAdmin:NoResults("search")
      elseif AzerothAdmin.db.char.requests.favtele then
        AzerothAdmin:NoResults("favorites")
      end
    end

  else
    AzerothAdmin:NoResults("search")
  end
end

function AzerothAdmin:InlineScrollUpdate_temp()
    ma_ticketscrollframe:Hide()
    AzerothAdmin:ChatMsg(".ticket list")
    local ticketCount = 0
    for _ in pairs(AzerothAdmin.db.profile.buffer.tickets) do ticketCount = ticketCount + 1 end
    if ticketCount > 0 then
        AzerothAdmin:ChatMsg("TickCount"..ticketCount)
        ma_ticketscrollframe1:SetText("Loading")
        local lineplusoffset
        local line
        ma_ticketscrollframe:Show()
        FauxScrollFrame_Update(ma_ticketscrollframe,ticketCount,12,16);
    end
end

function pairsByKeys(t, f)
  if t == Nil then
  else
    local a = {}
    for n in pairs(t) do table.insert(a, n) end
    table.sort(a, f)
    local i = 0      -- iterator variable
    local iter = function ()   -- iterator function
        i = i + 1
        if a[i] == nil then return nil
        else return a[i], t[a[i]]
        end
    end
    return iter
  end
end

-- STYLE FUNCTIONS
function AzerothAdmin:ToggleTransparency()
  if self.db.profile.style.transparency.backgrounds < 1.0 then
    self.db.profile.style.transparency.backgrounds = 1.0
  else
    self.db.profile.style.transparency.backgrounds = 0.5
  end
  ReloadUI()
end

function AzerothAdmin:ChangeTransparency(element)
  if element == "frames" then
    AzerothAdmin.db.profile.style.transparency.frames = string.format("%.2f", ma_frmtrslider:GetValue())
  elseif element == "buttons" then
    AzerothAdmin.db.profile.style.transparency.buttons = string.format("%.2f", ma_btntrslider:GetValue())
  end
end

function AzerothAdmin:ToggleTooltips()
  if self.db.profile.style.showtooltips then
    self.db.profile.style.showtooltips = false
  else
    self.db.profile.style.showtooltips = true
  end
  ReloadUI()
end

function AzerothAdmin:ToggleMinimenu()
  if self.db.profile.style.showminimenu then
    self.db.profile.style.showminimenu = false
  else
    self.db.profile.style.showminimenu = true
  end
  ReloadUI()
end

function AzerothAdmin:ChangeFrameStrata(strata)
  -- Save the new frame strata setting
  self.db.profile.style.framestrata = strata
  -- Apply it immediately to the main frame
  if ma_bgframe then
    ma_bgframe:SetFrameStrata(strata)
  end

  -- Update popup frame strata to always be one level above main frame
  if ma_popupframe then
    local strataOrder = {"BACKGROUND", "LOW", "MEDIUM", "HIGH", "DIALOG", "FULLSCREEN", "FULLSCREEN_DIALOG"}
    local popupStrata = "DIALOG" -- Default fallback

    for i, strataLevel in ipairs(strataOrder) do
      if strataLevel == strata then
        -- Set popup to next level up
        if i < #strataOrder then
          popupStrata = strataOrder[i + 1]
        else
          -- If main frame is already at max strata (FULLSCREEN_DIALOG),
          -- use same strata but higher frame level to ensure popup stays on top
          popupStrata = "FULLSCREEN_DIALOG"
          ma_popupframe:SetFrameLevel(100) -- Higher frame level within same strata
        end
        break
      end
    end

    ma_popupframe:SetFrameStrata(popupStrata)
  end
end

function AzerothAdmin:ToggleMiniMenu()
  if ma_minibgframe and ma_miniframe then
    if ma_minibgframe:IsVisible() then
      FrameLib:HandleGroup("minimenu", function(frame) frame:Hide() end)
    else
      FrameLib:HandleGroup("minimenu", function(frame) frame:Show() end)
    end
  end
end

function AzerothAdmin:ShowSection(section)
  if section and ma_bgframe then
    self:ShowMainScreen(section)
  end
end

function AzerothAdmin:InitCheckButtons()
  if self.db.profile.style.transparency.backgrounds < 1.0 then
    ma_checktransparencybutton:SetChecked(true)
  else
    ma_checktransparencybutton:SetChecked(false)
  end
  ma_instantkillbutton:SetChecked(self.db.char.instantKillMode)
  ma_checklocalsearchstringsbutton:SetChecked(self.db.profile.localesearchstring)
  ma_showminimenubutton:SetChecked(self.db.profile.style.showminimenu)
  ma_showtooltipsbutton:SetChecked(self.db.profile.style.showtooltips)
  ma_showchatoutputbutton:SetChecked(self.db.profile.style.showchat)
  ma_instantteleportbutton:SetChecked(self.db.profile.instantTeleport)
  -- Set minimap button checkbox state (inverted: hide=false means show=true)
  if AzerothAdminDb.minimap then
    ma_showminimapbutton:SetChecked(not AzerothAdminDb.minimap.hide)
  else
    ma_showminimapbutton:SetChecked(true) -- Default to shown
  end
  local dp = AzerothAdmin.db.profile.style.delayparam
  if dp == nil or dp == "" then dp = "50000" end --50k is approx 5 minutes of in-game time
  ma_delayparam:SetText(dp)
end

function AzerothAdmin:CloseButton(name)
  if name == "bg" then
    AzerothAdmin:SearchReset()
    FrameLib:HandleGroup("bg", function(frame) frame:Hide() end)
  elseif name == "popup" then
    AzerothAdmin:SearchReset()
    FrameLib:HandleGroup("popup", function(frame) frame:Hide()  end)
  elseif name == "popup2" then
    FrameLib:HandleGroup("popup2", function(frame) frame:Hide()  end)
  end
end

function AzerothAdmin:ToggleMainScreen()
if ma_bgframe:IsVisible() and not ma_popupframe:IsVisible() then
    FrameLib:HandleGroup("bg", function(frame) frame:Hide() end)
  elseif ma_bgframe:IsVisible() and ma_popupframe:IsVisible() then
    FrameLib:HandleGroup("bg", function(frame) frame:Hide() end)
    FrameLib:HandleGroup("popup", function(frame) frame:Hide() end)
  elseif not ma_bgframe:IsVisible() and ma_popupframe:IsVisible() then
    FrameLib:HandleGroup("bg", function(frame) frame:Show() end)
  else
    FrameLib:HandleGroup("bg", function(frame) frame:Show() end)
  end
end

-- MINIMAP BUTTON FUNCTIONS

-- Initialize saved variables
if not AzerothAdminDb then
    AzerothAdminDb = {}
end

-- Delay minimap button creation until PLAYER_LOGIN to ensure all libraries are loaded
local function CreateMinimapButton()
    -- Try to use LibDBIcon if available (provided by other addons like ElvUI or our own libraries)
    local ldb = LibStub and LibStub("LibDataBroker-1.1", true)
    local icon = LibStub and LibStub("LibDBIcon-1.0", true)

    if ldb and icon then
    -- Using LibDBIcon for minimap button management
    if not AzerothAdminDb.minimap then
        AzerothAdminDb.minimap = { hide = false }
    end

    -- Create LibDataBroker data object
    local AzerothAdminLDB = ldb:NewDataObject("AzerothAdmin", {
        type = "launcher",
        text = "AzerothAdmin",
        icon = "Interface\\AddOns\\AzerothAdmin\\Textures\\MinimapIcon",
        OnClick = function(self, button)
            if button == "LeftButton" then
                if IsShiftKeyDown() then
                    ReloadUI()
                else
                    AzerothAdmin:OnClick()
                end
            elseif button == "RightButton" then
                AzerothAdmin:ToggleMiniMenu()
            end
        end,
        OnTooltipShow = function(tooltip)
            tooltip:SetText("AzerothAdmin", 1, 1, 1)
            tooltip:AddLine("Left-click to toggle the main window", nil, nil, nil, true)
            tooltip:AddLine("Right-click to toggle the mini menu", nil, nil, nil, true)
            tooltip:AddLine("Shift-click to reload UI", nil, nil, nil, true)
            tooltip:AddLine("Drag to move the button", nil, nil, nil, true)
        end,
    })

    -- Register with LibDBIcon
    icon:Register("AzerothAdmin", AzerothAdminLDB, AzerothAdminDb.minimap)

    -- Respect the hide setting
    if AzerothAdminDb.minimap.hide then
        icon:Hide("AzerothAdmin")
    end
else
    -- Fallback: Create manual minimap button
    local minimapButton = CreateFrame("Button", "AzerothAdminMinimapButton", Minimap)
    minimapButton:SetFrameStrata("MEDIUM")
    minimapButton:SetSize(32, 32)
    minimapButton:SetFrameLevel(8)
    minimapButton:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")
    minimapButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")

    -- Set the minimap button icon
    local buttonIcon = minimapButton:CreateTexture(nil, "BACKGROUND")
    buttonIcon:SetTexture("Interface\\AddOns\\AzerothAdmin\\Textures\\MinimapIcon")
    buttonIcon:SetSize(20, 20)
    buttonIcon:SetPoint("CENTER")

    -- Set the minimap button position (fixed)
    minimapButton:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 52 - (80 * cos(45)), (80 * sin(45)) - 52)

    -- Add event handlers for the minimap button
    minimapButton:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
            if IsShiftKeyDown() then
                ReloadUI()
            else
                AzerothAdmin:OnClick()
            end
        elseif button == "RightButton" then
            AzerothAdmin:ToggleMiniMenu()
        end
    end)

    minimapButton:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_LEFT")
        GameTooltip:SetText("AzerothAdmin", 1, 1, 1)
        GameTooltip:AddLine("Left-click to toggle the main window", nil, nil, nil, true)
        GameTooltip:AddLine("Right-click to toggle the mini menu", nil, nil, nil, true)
        GameTooltip:AddLine("Shift-click to reload UI", nil, nil, nil, true)
        GameTooltip:Show()
    end)

    minimapButton:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
    end)

    -- Respect the hide setting for fallback button
    if AzerothAdminDb.minimap and AzerothAdminDb.minimap.hide then
        minimapButton:Hide()
    end
    end
end

-- Function to toggle minimap button visibility
function AzerothAdmin:ToggleMinimapButton()
    local icon = LibStub and LibStub("LibDBIcon-1.0", true)

    if icon and icon:IsRegistered("AzerothAdmin") then
        -- Using LibDBIcon
        if AzerothAdminDb.minimap.hide then
            icon:Show("AzerothAdmin")
            AzerothAdminDb.minimap.hide = false
            self:Print("Minimap button shown")
        else
            icon:Hide("AzerothAdmin")
            AzerothAdminDb.minimap.hide = true
            self:Print("Minimap button hidden")
        end
    else
        -- Fallback for manual minimap button
        local minimapButton = _G["AzerothAdminMinimapButton"]
        if minimapButton then
            if minimapButton:IsShown() then
                minimapButton:Hide()
                if not AzerothAdminDb.minimap then
                    AzerothAdminDb.minimap = {}
                end
                AzerothAdminDb.minimap.hide = true
                self:Print("Minimap button hidden")
            else
                minimapButton:Show()
                if not AzerothAdminDb.minimap then
                    AzerothAdminDb.minimap = {}
                end
                AzerothAdminDb.minimap.hide = false
                self:Print("Minimap button shown")
            end
        else
            self:Print("Minimap button not found")
        end
    end
end

-- Register event to create minimap button after all addons are loaded
local minimapFrame = CreateFrame("Frame")
minimapFrame:RegisterEvent("PLAYER_LOGIN")
minimapFrame:SetScript("OnEvent", function()
    CreateMinimapButton()
end)
