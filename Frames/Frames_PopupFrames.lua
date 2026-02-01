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
-- This script must be listed in the .toc after "Frames_LookupButtons.lua"
-- Also some variables are globally taken from AzerothAdmin.lua

function AzerothAdmin:CreatePopupFrames()
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

  -- [[Popup Frame]]
  -- Calculate popup strata to be one level above main frame
  local strataOrder = {"BACKGROUND", "LOW", "MEDIUM", "HIGH", "DIALOG", "FULLSCREEN", "FULLSCREEN_DIALOG"}
  local mainStrata = AzerothAdmin.db.profile.style.framestrata or "MEDIUM"
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
    text = Locale["ma_PopupErrorTab"]
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
    text = Locale["ma_PopupFavoritesTab"]
  })

  FrameLib:BuildButton({
    name = "ma_ptabbutton_3",
    group = "popup",
    parent = ma_popuptopframe,
    texture = {
      name = "ma_ptabbutton_3_texture",
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
      relTo = "ma_ptabbutton_2",
      relPos = "TOPRIGHT",
      offX = 2
    },
    text = Locale["ma_PopupTab3"]
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

  -- [[Mail Item Slots - for Send Items tab]]
  -- Create 12 item slots in a 2x6 grid layout (centered in bottom frame)
  for i = 1, 12 do
    local row = math.floor((i - 1) / 6)  -- 0 for first row, 1 for second row
    local col = (i - 1) % 6  -- 0-5 for column position

    -- Calculate centered position with smaller icons
    -- 6 slots * 30 width + 5 gaps * 5 spacing = 180 + 25 = 205 total width
    -- Center in 435 width frame: (435 - 205) / 2 = 115 offset
    local xOffset = 115 + (col * 35)  -- 35 = 30 slot + 5 spacing
    local yOffset = -7 - (row * 35)  -- 35 = 30 slot + 5 spacing

    FrameLib:BuildButton({
      name = "ma_mailitemslot"..i,
      group = "popup",
      parent = ma_popupbottomframe,
      texture = {
        name = "ma_mailitemslot"..i.."_texture",
        color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
      },
      size = {
        width = 30,
        height = 30
      },
      setpoint = {
        pos = "TOPLEFT",
        offX = xOffset,
        offY = yOffset
      },
      inherits = "ItemButtonTemplate"
    })
  end

  -- [[Mail Money Input Fields - for Send Money tab (moved to bottom frame)]]
  FrameLib:BuildFontString({
    name = "ma_mailmoneytext",
    group = "popup",
    parent = ma_popupbottomframe,
    text = Locale["ma_PopupAmountLabel"],
    setpoint = {
      pos = "TOPLEFT",
      offX = 10,
      offY = -15
    }
  })

  FrameLib:BuildFrame({
    type = "EditBox",
    name = "ma_mailgoldeditbox",
    group = "popup",
    parent = ma_popupbottomframe,
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 10,
      offY = -10
    },
    inherits = "InputBoxTemplate"
  })

  -- Gold coin icon
  local ma_mailgoldicon = ma_popupbottomframe:CreateTexture("ma_mailgoldicon", "ARTWORK")
  ma_mailgoldicon:SetTexture("Interface\\MoneyFrame\\UI-GoldIcon")
  ma_mailgoldicon:SetSize(14, 14)
  ma_mailgoldicon:SetPoint("TOPLEFT", ma_popupbottomframe, "TOPLEFT", 95, -12)

  FrameLib:BuildFrame({
    type = "EditBox",
    name = "ma_mailsilvereditbox",
    group = "popup",
    parent = ma_popupbottomframe,
    size = {
      width = 35,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 135,
      offY = -10
    },
    inherits = "InputBoxTemplate"
  })

  -- Silver coin icon
  local ma_mailsilvericon = ma_popupbottomframe:CreateTexture("ma_mailsilvericon", "ARTWORK")
  ma_mailsilvericon:SetTexture("Interface\\MoneyFrame\\UI-SilverIcon")
  ma_mailsilvericon:SetSize(14, 14)
  ma_mailsilvericon:SetPoint("TOPLEFT", ma_popupbottomframe, "TOPLEFT", 175, -12)

  FrameLib:BuildFrame({
    type = "EditBox",
    name = "ma_mailcoppereditbox",
    group = "popup",
    parent = ma_popupbottomframe,
    size = {
      width = 35,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 215,
      offY = -10
    },
    inherits = "InputBoxTemplate"
  })

  -- Copper coin icon
  local ma_mailcoppericon = ma_popupbottomframe:CreateTexture("ma_mailcoppericon", "ARTWORK")
  ma_mailcoppericon:SetTexture("Interface\\MoneyFrame\\UI-CopperIcon")
  ma_mailcoppericon:SetSize(14, 14)
  ma_mailcoppericon:SetPoint("TOPLEFT", ma_popupbottomframe, "TOPLEFT", 255, -12)

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
    text = Locale["ma_PopupInvisibleText"]
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

  -- Quest Action Buttons (5 buttons in bottom frame)
  FrameLib:BuildButton({
    name = "ma_questaddbutton",
    group = "popup",
    parent = ma_popupbottomframe,
    texture = {
      name = "ma_questaddbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 104,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 10,
      offY = -10
    },
    text = Locale["ma_QuestAddButton"]
  })

  FrameLib:BuildButton({
    name = "ma_questremovebutton",
    group = "popup",
    parent = ma_popupbottomframe,
    texture = {
      name = "ma_questremovebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 104,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 118,
      offY = -10
    },
    text = Locale["ma_QuestRemoveButton"]
  })

  
  FrameLib:BuildButton({
    name = "ma_questcompletebutton",
    group = "popup",
    parent = ma_popupbottomframe,
    texture = {
      name = "ma_questcompletebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 104,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 10,
      offY = -34
    },
    text = Locale["ma_QuestCompleteButton"]
  })

  FrameLib:BuildButton({
    name = "ma_questrewardbutton",
    group = "popup",
    parent = ma_popupbottomframe,
    texture = {
      name = "ma_questrewardbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 104,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 118,
      offY = -34
    },
    text = Locale["ma_QuestRewardButton"]
  })

  FrameLib:BuildButton({
    name = "ma_queststatusbutton",
    group = "popup",
    parent = ma_popupbottomframe,
    texture = {
      name = "ma_queststatusbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 104,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 226,
      offY = -34
    },
    text = Locale["ma_QuestStatusButton"]
  })
end

-- Setup Mail Popup UI
function AzerothAdmin:SetupMailPopup(param)
  -- Initialize with tab 1 (Send Mail) as default
  local currentTab = param.tab or 1

  FrameLib:HandleGroup("popup", function(frame) frame:Show() end)

  -- Hide search entries
  for n = 1,7 do
    _G["ma_PopupScrollBarEntry"..n]:Hide()
  end

  -- Hide default elements
  ma_resetsearchbutton:Hide()
  ma_PopupScrollBar:Hide()
  ma_modfavsbutton:Hide()
  ma_selectallbutton:Hide()
  ma_deselectallbutton:Hide()
  ma_var2editbox:Hide()
  ma_var2text:Hide()

  -- Hide quest action buttons (not used in mail mode)
  ma_questaddbutton:Hide()
  ma_questcompletebutton:Hide()
  ma_questremovebutton:Hide()
  ma_questrewardbutton:Hide()
  ma_queststatusbutton:Hide()

  -- Setup tab buttons
  ma_ptabbutton_1:SetText("Send Mail")
  ma_ptabbutton_2:SetText("Send Items")
  ma_ptabbutton_3:SetText("Send Money")
  ma_ptabbutton_2:Show()
  ma_ptabbutton_3:Show()

  -- Setup tab click handlers (preserve message body when switching)
  ma_ptabbutton_1:SetScript("OnClick", function()
    param.body = ma_maileditbox:GetText()
    AzerothAdmin:SwitchMailTab(1, param)
  end)
  ma_ptabbutton_2:SetScript("OnClick", function()
    param.body = ma_maileditbox:GetText()
    AzerothAdmin:SwitchMailTab(2, param)
  end)
  ma_ptabbutton_3:SetScript("OnClick", function()
    param.body = ma_maileditbox:GetText()
    AzerothAdmin:SwitchMailTab(3, param)
  end)

  -- Setup recipient field with auto-clear on focus
  if param.recipient then
    ma_searcheditbox:SetText(param.recipient)
  else
    ma_searcheditbox:SetText(Locale["ma_MailRecipient"])
  end

  ma_searcheditbox:SetScript("OnEditFocusGained", function(self)
    if self:GetText() == Locale["ma_MailRecipient"] then
      self:SetText("")
    end
    self:HighlightText()
  end)

  ma_searcheditbox:SetScript("OnEditFocusLost", function(self)
    if self:GetText() == "" then
      self:SetText(Locale["ma_MailRecipient"])
    end
  end)

  -- Setup tab key to move to subject
  ma_searcheditbox:SetScript("OnTabPressed", function()
    ma_var1editbox:SetFocus()
  end)

  -- Setup subject field with auto-clear on focus
  if param.subject then
    ma_var1editbox:SetText(param.subject)
  else
    ma_var1editbox:SetText(Locale["ma_MailSubject"])
  end
  ma_var1text:SetText(Locale["ma_MailSubject"])

  ma_var1editbox:SetScript("OnEditFocusGained", function(self)
    if self:GetText() == Locale["ma_MailSubject"] then
      self:SetText("")
    end
    self:HighlightText()
  end)

  ma_var1editbox:SetScript("OnEditFocusLost", function(self)
    if self:GetText() == "" then
      self:SetText(Locale["ma_MailSubject"])
    end
  end)

  -- Setup tab key to move to message body
  ma_var1editbox:SetScript("OnTabPressed", function()
    ma_maileditbox:SetFocus()
  end)

  -- Setup message body field with auto-clear on focus
  ma_maileditbox:SetScript("OnEditFocusGained", function(self)
    if self:GetText() == Locale["ma_MailYourMsg"] then
      self:SetText("")
    end
  end)

  ma_maileditbox:SetScript("OnEditFocusLost", function(self)
    if self:GetText() == "" then
      self:SetText(Locale["ma_MailYourMsg"])
    end
  end)

  ma_maileditbox:SetScript("OnEscapePressed", function(self)
    self:ClearFocus()
  end)

  -- Switch to the requested tab
  self:SwitchMailTab(currentTab, param)
end

-- Switch between mail tabs
function AzerothAdmin:SwitchMailTab(tabNum, param)
  -- Store current tab for other functions to reference
  self.currentMailTab = tabNum

  -- Update tab button highlights
  if tabNum == 1 then
    _G["ma_ptabbutton_1_texture"]:SetGradientAlpha("vertical", 102, 102, 102, 1, 102, 102, 102, 0.7)
    _G["ma_ptabbutton_2_texture"]:SetGradientAlpha("vertical", 102, 102, 102, 0, 102, 102, 102, 0.7)
    _G["ma_ptabbutton_3_texture"]:SetGradientAlpha("vertical", 102, 102, 102, 0, 102, 102, 102, 0.7)
  elseif tabNum == 2 then
    _G["ma_ptabbutton_1_texture"]:SetGradientAlpha("vertical", 102, 102, 102, 0, 102, 102, 102, 0.7)
    _G["ma_ptabbutton_2_texture"]:SetGradientAlpha("vertical", 102, 102, 102, 1, 102, 102, 102, 0.7)
    _G["ma_ptabbutton_3_texture"]:SetGradientAlpha("vertical", 102, 102, 102, 0, 102, 102, 102, 0.7)
  elseif tabNum == 3 then
    _G["ma_ptabbutton_1_texture"]:SetGradientAlpha("vertical", 102, 102, 102, 0, 102, 102, 102, 0.7)
    _G["ma_ptabbutton_2_texture"]:SetGradientAlpha("vertical", 102, 102, 102, 0, 102, 102, 102, 0.7)
    _G["ma_ptabbutton_3_texture"]:SetGradientAlpha("vertical", 102, 102, 102, 1, 102, 102, 102, 0.7)
  end

  -- Hide all tab-specific elements
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

  -- Show common elements
  ma_searcheditbox:Show()
  ma_var1editbox:Show()
  ma_var1text:Show()
  ma_lookupresulttext:Show()

  -- Tab 1: Send Mail (regular mail with message body)
  if tabNum == 1 then
    -- Setup text change handlers for byte count
    ma_searcheditbox:SetScript("OnTextChanged", function() AzerothAdmin:UpdateMailBytesLeft() end)
    ma_var1editbox:SetScript("OnTextChanged", function() AzerothAdmin:UpdateMailBytesLeft() end)

    ma_lookupresulttext:SetText(Locale["ma_MailBytesLeft"].."246")

    -- Setup body field (use persistent body from param)
    if param.body and param.body ~= "" and param.body ~= Locale["ma_MailYourMsg"] then
      ma_maileditbox:SetText(param.body)
    else
      ma_maileditbox:SetText(Locale["ma_MailYourMsg"])
    end

    ma_maileditbox:Show()
    ma_maileditbox:SetScript("OnTextChanged", function() AzerothAdmin:UpdateMailBytesLeft() end)

    -- Enable send button for Tab 1
    if not ma_searchbutton.cooldownActive then
      ma_searchbutton:Enable()
    end

    ma_searchbutton:SetText(Locale["ma_Send"])
    ma_searchbutton:SetScript("OnClick", function()
      if not ma_searchbutton.cooldownActive then
        self:SendMail(ma_searcheditbox:GetText(), ma_var1editbox:GetText(), ma_maileditbox:GetText())

        -- Set cooldown
        ma_searchbutton.cooldownActive = true
        ma_searchbutton:Disable()
        ma_searchbutton.countdown = 5
        ma_searchbutton:SetText("Sent! (5s)")

        -- Create OnUpdate frame for countdown
        if not ma_searchbutton.cooldownFrame then
          ma_searchbutton.cooldownFrame = CreateFrame("Frame")
        end

        ma_searchbutton.cooldownFrame.elapsed = 0
        ma_searchbutton.cooldownFrame:SetScript("OnUpdate", function(self, elapsed)
          self.elapsed = self.elapsed + elapsed
          if self.elapsed >= 1 then
            self.elapsed = 0
            ma_searchbutton.countdown = ma_searchbutton.countdown - 1
            if ma_searchbutton.countdown > 0 then
              ma_searchbutton:SetText("Sent! ("..ma_searchbutton.countdown.."s)")
            else
              ma_searchbutton:SetText(Locale["ma_Send"])
              ma_searchbutton:Enable()
              ma_searchbutton.cooldownActive = false
              self:SetScript("OnUpdate", nil)
            end
          end
        end)
      end
    end)

  -- Tab 2: Send Items
  elseif tabNum == 2 then
    -- Show item slots
    for i = 1, 12 do
      local slot = _G["ma_mailitemslot"..i]
      slot:Show()
      slot:SetScript("OnReceiveDrag", function()
        AzerothAdmin:MailItemSlotReceiveDrag(i)
      end)
      slot:SetScript("OnClick", function(self, button)
        if button == "RightButton" then
          -- Right-click to clear slot
          AzerothAdmin:MailItemSlotClear(i)
        elseif IsShiftKeyDown() then
          -- Shift+click to drag from cursor
          AzerothAdmin:MailItemSlotReceiveDrag(i)
        end
      end)
      slot:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    end

    -- Setup body field (use persistent body from param)
    if param.body and param.body ~= "" and param.body ~= Locale["ma_MailYourMsg"] then
      ma_maileditbox:SetText(param.body)
    else
      ma_maileditbox:SetText(Locale["ma_MailYourMsg"])
    end
    ma_maileditbox:Show()

    -- Update button state based on current items
    self:UpdateMailItemsSendButton()

    ma_searchbutton:SetText(Locale["ma_Send"])
    ma_searchbutton:SetScript("OnClick", function()
      if not ma_searchbutton.cooldownActive then
        self:SendMailWithItems(ma_searcheditbox:GetText(), ma_var1editbox:GetText(), ma_maileditbox:GetText())

        -- Set cooldown
        ma_searchbutton.cooldownActive = true
        ma_searchbutton:Disable()
        ma_searchbutton.countdown = 5
        ma_searchbutton:SetText("Sent! (5s)")

        -- Create OnUpdate frame for countdown
        if not ma_searchbutton.cooldownFrame then
          ma_searchbutton.cooldownFrame = CreateFrame("Frame")
        end

        ma_searchbutton.cooldownFrame.elapsed = 0
        ma_searchbutton.cooldownFrame:SetScript("OnUpdate", function(self, elapsed)
          self.elapsed = self.elapsed + elapsed
          if self.elapsed >= 1 then
            self.elapsed = 0
            ma_searchbutton.countdown = ma_searchbutton.countdown - 1
            if ma_searchbutton.countdown > 0 then
              ma_searchbutton:SetText("Sent! ("..ma_searchbutton.countdown.."s)")
            else
              ma_searchbutton:SetText(Locale["ma_Send"])
              ma_searchbutton:Enable()
              ma_searchbutton.cooldownActive = false
              self:SetScript("OnUpdate", nil)
            end
          end
        end)
      end
    end)

  -- Tab 3: Send Money
  elseif tabNum == 3 then
    -- Show money input fields
    ma_mailmoneytext:Hide()
    ma_mailgoldeditbox:Show()
    ma_mailgoldicon:Show()
    ma_mailsilvereditbox:Show()
    ma_mailsilvericon:Show()
    ma_mailcoppereditbox:Show()
    ma_mailcoppericon:Show()

    -- Set default values
    ma_mailgoldeditbox:SetText("0")
    ma_mailsilvereditbox:SetText("0")
    ma_mailcoppereditbox:SetText("0")

    -- Function to update button state based on money amount
    local function UpdateMoneySendButton()
      local copper = tonumber(ma_mailcoppereditbox:GetText()) or 0
      local silver = tonumber(ma_mailsilvereditbox:GetText()) or 0
      local gold = tonumber(ma_mailgoldeditbox:GetText()) or 0

      local totalCopper = copper + (silver * 100) + (gold * 10000)

      if totalCopper > 0 then
        if not ma_searchbutton.cooldownActive then
          ma_searchbutton:Enable()
        end
        ma_lookupresulttext:SetText("Ready to send money")
      else
        ma_searchbutton:Disable()
        ma_lookupresulttext:SetText("Enter money amount to send")
      end
    end

    -- Limit and validate currency input
    local function ValidateCurrency()
      local copperText = ma_mailcoppereditbox:GetText()
      local silverText = ma_mailsilvereditbox:GetText()
      local goldText = ma_mailgoldeditbox:GetText()

      -- Limit silver and copper to 2 characters max
      if string.len(copperText) > 2 then
        copperText = string.sub(copperText, 1, 2)
        ma_mailcoppereditbox:SetText(copperText)
      end

      if string.len(silverText) > 2 then
        silverText = string.sub(silverText, 1, 2)
        ma_mailsilvereditbox:SetText(silverText)
      end

      -- Ensure non-negative values and limit gold to max safe value
      local copper = tonumber(copperText) or 0
      local silver = tonumber(silverText) or 0
      local gold = tonumber(goldText) or 0

      -- Maximum gold cap (214748 gold = ~2.1 billion copper, safe for unsigned int)
      local MAX_GOLD = 214748

      if copper < 0 then
        ma_mailcoppereditbox:SetText("0")
      end
      if silver < 0 then
        ma_mailsilvereditbox:SetText("0")
      end
      if gold < 0 then
        ma_mailgoldeditbox:SetText("0")
      elseif gold > MAX_GOLD then
        ma_mailgoldeditbox:SetText(tostring(MAX_GOLD))
      end

      -- Update button state
      UpdateMoneySendButton()
    end

    -- Add validation on text change
    ma_mailcoppereditbox:SetScript("OnTextChanged", function()
      ValidateCurrency()
    end)

    ma_mailsilvereditbox:SetScript("OnTextChanged", function()
      ValidateCurrency()
    end)

    ma_mailgoldeditbox:SetScript("OnTextChanged", function()
      ValidateCurrency()
    end)

    -- Setup body field (use persistent body from param)
    if param.body and param.body ~= "" and param.body ~= Locale["ma_MailYourMsg"] then
      ma_maileditbox:SetText(param.body)
    else
      ma_maileditbox:SetText(Locale["ma_MailYourMsg"])
    end
    ma_maileditbox:Show()

    -- Initial button state (disabled until money is entered)
    UpdateMoneySendButton()

    ma_searchbutton:SetText(Locale["ma_Send"])
    ma_searchbutton:SetScript("OnClick", function()
      if not ma_searchbutton.cooldownActive then
        local gold = tonumber(ma_mailgoldeditbox:GetText()) or 0
        local silver = tonumber(ma_mailsilvereditbox:GetText()) or 0
        local copper = tonumber(ma_mailcoppereditbox:GetText()) or 0
        self:SendMailWithMoney(ma_searcheditbox:GetText(), ma_var1editbox:GetText(), gold, silver, copper, ma_maileditbox:GetText())

        -- Set cooldown
        ma_searchbutton.cooldownActive = true
        ma_searchbutton:Disable()
        ma_searchbutton.countdown = 5
        ma_searchbutton:SetText("Sent! (5s)")

        -- Create OnUpdate frame for countdown
        if not ma_searchbutton.cooldownFrame then
          ma_searchbutton.cooldownFrame = CreateFrame("Frame")
        end

        ma_searchbutton.cooldownFrame.elapsed = 0
        ma_searchbutton.cooldownFrame:SetScript("OnUpdate", function(self, elapsed)
          self.elapsed = self.elapsed + elapsed
          if self.elapsed >= 1 then
            self.elapsed = 0
            ma_searchbutton.countdown = ma_searchbutton.countdown - 1
            if ma_searchbutton.countdown > 0 then
              ma_searchbutton:SetText("Sent! ("..ma_searchbutton.countdown.."s)")
            else
              ma_searchbutton:SetText(Locale["ma_Send"])
              ma_searchbutton:Enable()
              ma_searchbutton.cooldownActive = false
              self:SetScript("OnUpdate", nil)
            end
          end
        end)
      end
    end)
  end
end
