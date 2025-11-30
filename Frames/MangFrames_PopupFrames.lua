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
-- This script must be listed in the .toc after "MangFrames_LookupButtons.lua"
-- Also some variables are globally taken from AzerothAdmin.lua

function AzerothAdmin:CreatePopupFrames()
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

  -- [[Popup Frame]]
  -- Calculate popup strata to be one level above main frame
  local strataOrder = {"BACKGROUND", "LOW", "MEDIUM", "HIGH", "DIALOG", "FULLSCREEN", "FULLSCREEN_DIALOG"}
  local mainStrata = AzerothAdmin.db.account.style.framestrata or "MEDIUM"
  local popupStrata = "DIALOG" -- Default fallback
  local popupFrameLevel = nil

  for i, strata in ipairs(strataOrder) do
    if strata == mainStrata then
      -- Set popup to next level up
      if i < #strataOrder then
        popupStrata = strataOrder[i + 1]
      else
        -- If main frame is already at max strata (FULLSCREEN_DIALOG),
        -- use same strata but higher frame level to ensure popup stays on top
        popupStrata = "FULLSCREEN_DIALOG"
        popupFrameLevel = 100 -- Higher frame level within same strata
      end
      break
    end
  end

  FrameLib:BuildFrame({
    name = "ma_popupframe",
    group = "popup",
    parent = UIParent,
    texture = {
      color = {color.bg.r, color.bg.g, color.bg.b, transparency.bg}
    },
    draggable = true,
    size = {
      width = 440,
      height = 460
    },
    setpoint = {
      pos = "CENTER"
    },
    frameStrata = popupStrata,
    frameLevel = popupFrameLevel,
    inherits = nil
  })

  FrameLib:BuildFrame({
    name = "ma_popmenubgframe",
    group = "popup",
    parent = ma_popupframe,
    texture = {
      color = {color.bg.r, color.bg.g, color.bg.b, transparency.bg}
    },
    size = {
      width = 230,
      height = 22
    },
    setpoint = {
      pos = "TOPLEFT",
      offY = 22,
      offX = 4
    },
    inherits = nil
  })

  FrameLib:BuildFrame({
    name = "ma_popuptopframe",
    group = "popup",
    parent = ma_popupframe,
    texture = {
      color = {color.frm.r, color.frm.g, color.frm.b, transparency.frm}
    },
    size = {
      width = 435,
      height = 80
    },
    setpoint = {
      pos = "TOP",
      offY = -2
    },
    inherits = nil
  })

  FrameLib:BuildFrame({
    name = "ma_popupmidframe",
    group = "popup",
    parent = ma_popupframe,
    texture = {
      color = {color.frm.r, color.frm.g, color.frm.b, transparency.frm}
    },
    size = {
      width = 435,
      height = 294
    },
    setpoint = {
      pos = "TOP",
      offY = -83
    },
    inherits = nil
  })

  FrameLib:BuildFrame({
    name = "ma_popupbottomframe",
    group = "popup",
    parent = ma_popupframe,
    texture = {
      color = {color.frm.r, color.frm.g, color.frm.b, transparency.frm}
    },
    size = {
      width = 435,
      height = 80
    },
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_popupmidframe",
      relPos = "BOTTOMLEFT",
      offY = -1
    },
    inherits = nil
  })

  FrameLib:BuildButton({ --Close Window button
    name = "ma_popupclosebutton",
    group = "popup",
    parent = ma_popuptopframe,
    texture = {
      name = "ma_popupclosebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 10,
      height = 10
    },
    setpoint = {
      pos = "BOTTOMRIGHT",
      offX = -10,
      offY = 10
    },
    text = Locale["ma_CloseWindow"] --"X"
  })

  FrameLib:BuildButton({
    name = "ma_ptabbutton_1",
    group = "popup",
    parent = ma_popuptopframe,
    texture = {
      name = "ma_ptabbutton_1_texture",
      color = {color.frm.r, color.frm.g, color.frm.b, transparency.frm},
      gradient = {
        orientation = "vertical",
        min = {102,102,102,1},
        max = {color.frm.r, color.frm.g, color.frm.b, transparency.frm}
      }
    },
    size = {
      width = 120,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_popmenubgframe",
      relPos = "TOPLEFT",
      offX = 4,
      offY = -4
    },
    text = "ERROR"
  })

  FrameLib:BuildButton({
    name = "ma_ptabbutton_2",
    group = "popup",
    parent = ma_popuptopframe,
    texture = {
      name = "ma_ptabbutton_2_texture",
      color = {color.frm.r, color.frm.g, color.frm.b, transparency.frm},
      gradient = {
        orientation = "vertical",
        min = {102,102,102,1},
        max = {color.frm.r, color.frm.g, color.frm.b, transparency.frm}
      }
    },
    size = {
      width = 100,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_ptabbutton_1",
      relPos = "TOPRIGHT",
      offX = 2
    },
    text = "Favorites"
  })

  -- Popup Editbox and Searchbutton
  FrameLib:BuildFontString({
    name = "ma_lookupresulttext",
    group = "popup",
    parent = ma_popuptopframe,
    text = Locale["searchResults"].."0",
    setpoint = {
      pos = "TOPRIGHT",
      offX = -10,
      offY = -10
    }
  })

  FrameLib:BuildFrame({
    type = "EditBox",
    name = "ma_searcheditbox",
    group = "popup",
    parent = ma_popuptopframe,
    size = {
      width = 250,
      height = 20
    },
    setpoint = {
      pos = "BOTTOMLEFT",
      offX = 10,
      offY = 28
    },
    inherits = "InputBoxTemplate"
  })

  -- Multi-purpose action button
  -- Search mode: "Search" button - triggers search functionality
  -- Mail mode: "Send" button - sends mail and closes popup
  FrameLib:BuildButton({
    name = "ma_searchbutton",  -- mail 'Send' button
    group = "popup",
    parent = ma_popuptopframe,
    texture = {
      name = "ma_searchbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "BOTTOMRIGHT",
      offX = -5,
      offY = 28
    },
    text = Locale["ma_SearchButton"]
  })

  FrameLib:BuildButton({
    name = "ma_resetsearchbutton",
    group = "popup",
    parent = ma_popuptopframe,
    texture = {
      name = "ma_resetsearchbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "BOTTOMRIGHT",
      offX = -90,
      offY = 28
    },
    text = Locale["ma_ResetButton"]
  })

  FrameLib:BuildFrame({
    type = "EditBox",
    name = "ma_var1editbox",
    group = "popup",
    parent = ma_popuptopframe,
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "BOTTOMLEFT",
      offX = 94,
      offY = 4
    },
    inherits = "InputBoxTemplate"
  })

  FrameLib:BuildFontString({
    name = "ma_var1text",  -- Left text label
    group = "popup",
    parent = ma_popuptopframe,
    text = "You should not see this text!",
    setpoint = {
      pos = "BOTTOMRIGHT",
      relTo = "ma_var1editbox",
      relPos = "BOTTOMLEFT",
      offX = -10,
      offY = 4
    },
    justifyH = "RIGHT"
  })

  FrameLib:BuildFontString({
    name = "ma_var2text", -- Right text label
    group = "popup",
    parent = ma_popuptopframe,
    text = "You should not see this text!",
    setpoint = {
      pos = "BOTTOMRIGHT",
      offX = -160,
      offY = 8
    }
  })

  FrameLib:BuildFrame({
    type = "EditBox",
    name = "ma_var2editbox",
    group = "popup",
    parent = ma_popuptopframe,
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "BOTTOMLEFT",
      offX = 284,
      offY = 4
    },
    inherits = "InputBoxTemplate"
  })

  -- Popup Search ScrollFrame
  FrameLib:BuildFrame({
    type = "ScrollFrame",
    name = "ma_PopupScrollBar",
    group = "popup",
    parent = ma_popupmidframe,
    texture = {
      color = {0,0,0,0.7}
    },
    size = {
      width = 400,
      height = 274
    },
    setpoint = {
      pos = "TOP",
      offX = -10,
      offY = -10
    },
    inherits = "FauxScrollFrameTemplate"
  })

  FrameLib:BuildButton({
    name = "ma_PopupScrollBarEntry1",
    group = "popup",
    parent = ma_popupmidframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_PopupScrollBar",
      relPos = "TOPLEFT",
      offX = 10,
      offY = -8
    },
    texture = {
      name = "ma_PopupScrollBarEntry1_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 380,
      height = 30
    },
    script = {{"OnShow", function(self) self:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_PopupScrollBarEntryIcon1",
    group = "popup",
    parent = ma_PopupScrollBarEntry1,
    setpoint = {
      pos = "LEFT",
      offX = -2,
    },
    size = {
      width = 37,
      height = 37
    },
    inherits = "ItemButtonTemplate"
  })

  FrameLib:BuildButton({
    type = "CheckButton",
    name = "ma_PopupScrollBarEntry1ChkBtn",
    group = "popup",
    parent = ma_PopupScrollBarEntry1,
    setpoint = {
      pos = "RIGHT",
      offX = -4
    },
    inherits = "UICheckButtonTemplate"
  })

  FrameLib:BuildButton({
    name = "ma_PopupScrollBarEntry2",
    group = "popup",
    parent = ma_popupmidframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_PopupScrollBarEntry1",
      relPos = "BOTTOMLEFT",
      offY = -8
    },
    texture = {
      name = "ma_PopupScrollBarEntry2_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 380,
      height = 30
    },
    script = {{"OnShow", function(self) self:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_PopupScrollBarEntryIcon2",
    group = "popup",
    parent = ma_PopupScrollBarEntry2,
    setpoint = {
      pos = "LEFT",
      offX = -2,
    },
    size = {
      width = 37,
      height = 37
    },
    inherits = "ItemButtonTemplate"
  })

  FrameLib:BuildButton({
    type = "CheckButton",
    name = "ma_PopupScrollBarEntry2ChkBtn",
    group = "popup",
    parent = ma_PopupScrollBarEntry2,
    setpoint = {
      pos = "RIGHT",
      offX = -4
    },
    inherits = "UICheckButtonTemplate"
  })

  FrameLib:BuildButton({
    name = "ma_PopupScrollBarEntry3",
    group = "popup",
    parent = ma_popupmidframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_PopupScrollBarEntry2",
      relPos = "BOTTOMLEFT",
      offY = -8
    },
    texture = {
      name = "ma_PopupScrollBarEntry3_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 380,
      height = 30
    },
    script = {{"OnShow", function(self) self:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_PopupScrollBarEntryIcon3",
    group = "popup",
    parent = ma_PopupScrollBarEntry3,
    setpoint = {
      pos = "LEFT",
      offX = -2,
    },
    size = {
      width = 37,
      height = 37
    },
    inherits = "ItemButtonTemplate"
  })

  FrameLib:BuildButton({
    type = "CheckButton",
    name = "ma_PopupScrollBarEntry3ChkBtn",
    group = "popup",
    parent = ma_PopupScrollBarEntry3,
    setpoint = {
      pos = "RIGHT",
      offX = -4
    },
    inherits = "UICheckButtonTemplate"
  })

  FrameLib:BuildButton({
    name = "ma_PopupScrollBarEntry4",
    group = "popup",
    parent = ma_popupmidframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_PopupScrollBarEntry3",
      relPos = "BOTTOMLEFT",
      offY = -8
    },
    texture = {
      name = "ma_PopupScrollBarEntry4_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 380,
      height = 30
    },
    script = {{"OnShow", function(self) self:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_PopupScrollBarEntryIcon4",
    group = "popup",
    parent = ma_PopupScrollBarEntry4,
    setpoint = {
      pos = "LEFT",
      offX = -2,
    },
    size = {
      width = 37,
      height = 37
    },
    inherits = "ItemButtonTemplate"
  })

  FrameLib:BuildButton({
    type = "CheckButton",
    name = "ma_PopupScrollBarEntry4ChkBtn",
    group = "popup",
    parent = ma_PopupScrollBarEntry4,
    setpoint = {
      pos = "RIGHT",
      offX = -4
    },
    inherits = "UICheckButtonTemplate"
  })

  FrameLib:BuildButton({
    name = "ma_PopupScrollBarEntry5",
    group = "popup",
    parent = ma_popupmidframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_PopupScrollBarEntry4",
      relPos = "BOTTOMLEFT",
      offY = -8
    },
    texture = {
      name = "ma_PopupScrollBarEntry5_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 380,
      height = 30
    },
    script = {{"OnShow", function(self) self:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_PopupScrollBarEntryIcon5",
    group = "popup",
    parent = ma_PopupScrollBarEntry5,
    setpoint = {
      pos = "LEFT",
      offX = -2,
    },
    size = {
      width = 37,
      height = 37
    },
    inherits = "ItemButtonTemplate"
  })

  FrameLib:BuildButton({
    type = "CheckButton",
    name = "ma_PopupScrollBarEntry5ChkBtn",
    group = "popup",
    parent = ma_PopupScrollBarEntry5,
    setpoint = {
      pos = "RIGHT",
      offX = -4
    },
    inherits = "UICheckButtonTemplate"
  })

  FrameLib:BuildButton({
    name = "ma_PopupScrollBarEntry6",
    group = "popup",
    parent = ma_popupmidframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_PopupScrollBarEntry5",
      relPos = "BOTTOMLEFT",
      offY = -8
    },
    texture = {
      name = "ma_PopupScrollBarEntry6_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 380,
      height = 30
    },
    script = {{"OnShow", function(self) self:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_PopupScrollBarEntryIcon6",
    group = "popup",
    parent = ma_PopupScrollBarEntry6,
    setpoint = {
      pos = "LEFT",
      offX = -2,
    },
    size = {
      width = 37,
      height = 37
    },
    inherits = "ItemButtonTemplate"
  })

  FrameLib:BuildButton({
    type = "CheckButton",
    name = "ma_PopupScrollBarEntry6ChkBtn",
    group = "popup",
    parent = ma_PopupScrollBarEntry6,
    setpoint = {
      pos = "RIGHT",
      offX = -4
    },
    inherits = "UICheckButtonTemplate"
  })

  FrameLib:BuildButton({
    name = "ma_PopupScrollBarEntry7",
    group = "popup",
    parent = ma_popupmidframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_PopupScrollBarEntry6",
      relPos = "BOTTOMLEFT",
      offY = -8
    },
    texture = {
      name = "ma_PopupScrollBarEntry7_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 380,
      height = 30
    },
    script = {{"OnShow", function(self) self:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_PopupScrollBarEntryIcon7",
    group = "popup",
    parent = ma_PopupScrollBarEntry7,
    setpoint = {
      pos = "LEFT",
      offX = -2,
    },
    size = {
      width = 37,
      height = 37
    },
    inherits = "ItemButtonTemplate"
  })

  FrameLib:BuildButton({
    type = "CheckButton",
    name = "ma_PopupScrollBarEntry7ChkBtn",
    group = "popup",
    parent = ma_PopupScrollBarEntry7,
    setpoint = {
      pos = "RIGHT",
      offX = -4
    },
    inherits = "UICheckButtonTemplate"
  })

  -- [[Mail Popup]]
  FrameLib:BuildFrame({
    type = "ScrollFrame",
    name = "ma_mailscrollframe",
    group = "popup",
    parent = ma_popupmidframe,
    size = {
      width = 400,
      height = 274
    },
    setpoint = {
      pos = "TOP",
      offX = -10,
      offY = -10
    },
    inherits = "FauxScrollFrameTemplate"
    --inherits = "UIPanelScrollFrameTemplate"
  })

  FrameLib:BuildFrame({
    type = "EditBox",
    name = "ma_maileditbox",
    group = "popup",
    parent = ma_mailscrollframe,
    texture = {
      name = "ma_maileditbox_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 400,
      --height = 200
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 0,
      offY = 0
    },
    setpoint2 = {
      pos = "BOTTOMRIGHT",
      offX = 0,
      offY = 0
    },
    maxletters = 100000,
    multiline = true,
    textcolor = {0, 0, 0, 1.0}
  })

  FrameLib:BuildButton({
    name = "ma_modfavsbutton",
    group = "popup",
    parent = ma_popupbottomframe,
    texture = {
      name = "ma_modfavsbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 100,
      height = 20
    },
    setpoint = {
      pos = "TOPRIGHT",
      offX = -10,
      offY = -10
    },
    text = "Invisible"
  })

  FrameLib:BuildButton({
    name = "ma_selectallbutton",
    group = "popup",
    parent = ma_popupbottomframe,
    texture = {
      name = "ma_selectallbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPRIGHT",
      offX = -114,
      offY = -10
    },
    text = Locale["ma_SelectAllButton"]
  })

  FrameLib:BuildButton({
    name = "ma_deselectallbutton",
    group = "popup",
    parent = ma_popupbottomframe,
    texture = {
      name = "ma_deselectallbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPRIGHT",
      offX = -198,
      offY = -10
    },
    text = Locale["ma_DeselectAllButton"]
  })
end

-- Setup Mail Popup UI
function AzerothAdmin:SetupMailPopup(param)
  _G["ma_ptabbutton_1_texture"]:SetGradientAlpha("vertical", 102, 102, 102, 1, 102, 102, 102, 0.7)
  _G["ma_ptabbutton_2_texture"]:SetGradientAlpha("vertical", 102, 102, 102, 0, 102, 102, 102, 0.7)
  FrameLib:HandleGroup("popup", function(frame) frame:Show() end)

  -- Hide search entries
  for n = 1,7 do
    _G["ma_PopupScrollBarEntry"..n]:Hide()
  end

  -- Show/hide relevant elements
  ma_lookupresulttext:SetText(Locale["ma_MailBytesLeft"].."246")
  ma_lookupresulttext:Show()
  ma_resetsearchbutton:Hide()
  ma_PopupScrollBar:Hide()
  ma_modfavsbutton:Hide()
  ma_selectallbutton:Hide()
  ma_deselectallbutton:Hide()
  ma_ptabbutton_2:Hide()
  ma_var2editbox:Hide()
  ma_var2text:Hide()

  -- Setup text change handlers for byte count
  ma_searcheditbox:SetScript("OnTextChanged", function() AzerothAdmin:UpdateMailBytesLeft() end)
  ma_var1editbox:SetScript("OnTextChanged", function() AzerothAdmin:UpdateMailBytesLeft() end)

  -- Setup recipient field
  if param.recipient then
    ma_searcheditbox:SetText(param.recipient)
  else
    ma_searcheditbox:SetText(Locale["ma_MailRecipient"])
  end

  -- Setup body field
  if param.body then
    ma_maileditbox:SetText(param.body)
  else
    ma_maileditbox:SetText(Locale["ma_MailYourMsg"])
  end

  -- Setup subject field
  if param.subject then
    ma_var1editbox:SetText(param.subject)
  else
    ma_var1editbox:SetText(Locale["ma_MailSubject"])
  end
  ma_var1editbox:Show()
  ma_var1text:SetText(Locale["ma_MailSubject"])
  ma_var1text:Show()

  -- Setup buttons
  ma_ptabbutton_1:SetText(Locale["ma_Mail"])
  ma_searchbutton:SetText(Locale["ma_Send"])
  ma_searchbutton:SetScript("OnClick", function()
    self:SendMail(ma_searcheditbox:GetText(), ma_var1editbox:GetText(), ma_maileditbox:GetText())
    ma_popupframe:Hide()
  end)

  -- Show mail editbox
  ma_maileditbox:Show()
end
