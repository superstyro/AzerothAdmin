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
-- This script must be listed in the .toc after "Frames_SectionChar.lua"
-- Also some variables are globally taken from AzerothAdmin.lua

function AzerothAdmin:CreateTicketSection()
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

  FrameLib:BuildButton({
    name = "ma_resetticketsbutton",
    group = "ticket",
    parent = ma_midframe,
    texture = {
        name = "ma_loadticketsbutton_texture",
        color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
        width = 70,
        height = 20
    },
    setpoint = {
        pos = "TOPLEFT",
        offX = 5,
        offY = -226
    },
    text = Locale["ma_TicketLoadButton"]
})


  FrameLib:BuildButton({
    name = "ma_goticketbutton",
    group = "ticket",
    parent = ma_midframe,
    texture = {
      name = "ma_goticketbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 80,
      offY = -226
    },
    text = Locale["ma_TicketGoButton"]
  })

  FrameLib:BuildButton({
    name = "ma_whisperticketbutton",
    group = "ticket",
    parent = ma_midframe,
    texture = {
      name = "ma_whisperticketbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 165,
      offY = -226
    },
    text = Locale["ma_ticketwhisperbutton"]
  })

  FrameLib:BuildButton({
    name = "ma_getcharticketbutton",
    group = "ticket",
    parent = ma_midframe,
    texture = {
      name = "ma_getcharticketbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 250,
      offY = -226
    },
    text = Locale["ma_GetCharTicketButton"]
  })

  FrameLib:BuildButton({
    name = "ma_gocharticketbutton",
    group = "ticket",
    parent = ma_midframe,
    texture = {
      name = "ma_gocharticketbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 335,
      offY = -226
    },
    text = Locale["ma_GoCharTicketButton"]
  })

  FrameLib:BuildButton({
    name = "ma_answerticketbutton",
    group = "ticket",
    parent = ma_midframe,
    texture = {
      name = "ma_answerticketbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 420,
      offY = -226
    },
    text = Locale["ma_AnswerButton"]
  })

  FrameLib:BuildButton({
    name = "ma_deleteticketbutton",
    group = "ticket",
    parent = ma_midframe,
    texture = {
      name = "ma_deleteticketbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 505,
      offY = -226
    },
    text = Locale["ma_DeleteButton"]
  })

  FrameLib:BuildFrame({
    type = "ScrollFrame",
    name = "ma_ticketscrollframe",
    group = "ticket",
    parent = ma_midframe,
    texture = {
      color = {0,0,0,0.7}
    },
    size = {
      width = 300,
      height = 215
    },
    setpoint = {
      pos = "TOPRIGHT",
      offX = -25,
      offY = -5
    },
    --[[setpoint2 = {
      pos = "BOTTOMRIGHT",
      offX = -30,
      offY = 34
    },]]
    inherits = "FauxScrollFrameTemplate"
--    inherits = "UIPanelScrollFrameTemplate"
  })

  FrameLib:BuildFontString({
    name = "ma_ticketidlabel",
    group = "ticket",
    parent = ma_midframe,
    text = Locale["ma_ticketidlabel"],
    setpoint = {
      pos = "TOPLEFT",
      offX = 5,
      offY = -5
    }
  })

  FrameLib:BuildFontString({
    name = "ma_ticketid",
    group = "ticket",
    parent = ma_midframe,
    text = "",
    setpoint = {
      pos = "LEFT",
      relTo = "ma_ticketidlabel",
      relPos = "RIGHT",
      offX = 5,
      offY = 0
    }
  })

  FrameLib:BuildFontString({
    name = "ma_ticketcreatedbylabel",
    group = "ticket",
    parent = ma_midframe,
    text = Locale["ma_ticketcreatedbylabel"],
    setpoint = {
      pos = "TOPLEFT",
      offX = 5,
      offY = -20
    }
  })

  FrameLib:BuildFontString({
    name = "ma_ticketcreatedby",
    group = "ticket",
    parent = ma_midframe,
    text = "",
    setpoint = {
      pos = "LEFT",
      relTo = "ma_ticketcreatedbylabel",
      relPos = "RIGHT",
      offX = 5,
      offY = 0
    }
  })

  FrameLib:BuildFontString({
    name = "ma_tickettimecreatedlabel",
    group = "ticket",
    parent = ma_midframe,
    text = Locale["ma_tickettimecreatedlabel"],
    setpoint = {
      pos = "TOPLEFT",
      offX = 5,
      offY = -35
    }
  })

  FrameLib:BuildFontString({
    name = "ma_tickettimecreated",
    group = "ticket",
    parent = ma_midframe,
    text = "",
    setpoint = {
      pos = "LEFT",
      relTo = "ma_tickettimecreatedlabel",
      relPos = "RIGHT",
      offX = 5,
      offY = 0
    }
  })

  FrameLib:BuildFrame({
    type = "ScrollFrame",
    name = "ma_ticketdetailscrollframe",
    group = "ticket",
    parent = ma_midframe,
    texture = {
      color = {0,0,0,0.7}
    },
    size = {
      width = 380,
      height = 170
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 5,
      offY = -50
    },
    inherits = "UIPanelScrollFrameTemplate"
  })

  FrameLib:BuildFrame({
    type = "EditBox",
    name = "ma_ticketdetail",
    group = "ticket",
    parent = ma_ticketdetailscrollframe,
    size = {
      width = 360,
      height = 500  -- Make it much taller than the scroll frame to ensure text appears
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 0,
      offY = 0
    },
    maxletters = 623,
    multiline = true,
    autoFocus = false,
    script = {
      {"OnEscapePressed", function(self) self:ClearFocus() end}
    }
  })

  -- Make the EditBox non-editable by preventing all text changes
  ma_ticketdetail.originalText = ""
  ma_ticketdetail:SetScript("OnTextChanged", function(self, userInput)
    if userInput then
      self:SetText(self.originalText)
    end
  end)
  ma_ticketdetail:SetScript("OnEditFocusGained", function(self)
    self:HighlightText()
  end)

  -- Set text color to white to ensure visibility
  ma_ticketdetail:SetTextColor(1, 1, 1, 1)
  -- Set text to align at top-left
  ma_ticketdetail:SetJustifyH("LEFT")
  ma_ticketdetail:SetJustifyV("TOP")
  -- Add text insets to ensure text is visible (left, right, top, bottom)
  ma_ticketdetail:SetTextInsets(5, 5, 5, 5)
  -- Set the EditBox as the scroll child
  ma_ticketdetailscrollframe:SetScrollChild(ma_ticketdetail)

  FrameLib:BuildButton({
    name = "ma_ticketscrollframe1",
    JustifyH = "LEFT",
    group = "ticket",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPRIGHT",
      relTo = "ma_ticketscrollframe",
      relPos = "TOPRIGHT",
      offX = -20,
      offY = -1
    },
    text = "",
    size = {
      width = 270,
      height = 16
    },
    script = {{"OnShow", function(self) self:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ticketscrollframe2",
    group = "ticket",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPRIGHT",
      relTo = "ma_ticketscrollframe1",
      relPos = "BOTTOMRIGHT",
      offY = -1
    },
    text = "",
    size = {
      width = 270,
      height = 16
    },
    script = {{"OnShow", function(self) self:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ticketscrollframe3",
    group = "ticket",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPRIGHT",
      relTo = "ma_ticketscrollframe2",
      relPos = "BOTTOMRIGHT",
      offY = -1
    },
    text = "",
    size = {
      width = 270,
      height = 16
    },
    script = {{"OnShow", function(self) self:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ticketscrollframe4",
    group = "ticket",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPRIGHT",
      relTo = "ma_ticketscrollframe3",
      relPos = "BOTTOMRIGHT",
      offY = -1
    },
    text = "",
    size = {
      width = 270,
      height = 16
    },
    script = {{"OnShow", function(self) self:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ticketscrollframe5",
    group = "ticket",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPRIGHT",
      relTo = "ma_ticketscrollframe4",
      relPos = "BOTTOMRIGHT",
      offY = -1
    },
    text = "",
    size = {
      width = 270,
      height = 16
    },
    script = {{"OnShow", function(self) self:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ticketscrollframe6",
    group = "ticket",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPRIGHT",
      relTo = "ma_ticketscrollframe5",
      relPos = "BOTTOMRIGHT",
      offY = -1
    },
    text = "",
    size = {
      width = 270,
      height = 16
    },
    script = {{"OnShow", function(self) self:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ticketscrollframe7",
    group = "ticket",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPRIGHT",
      relTo = "ma_ticketscrollframe6",
      relPos = "BOTTOMRIGHT",
      offY = -1
    },
    text = "",
    size = {
      width = 270,
      height = 16
    },
    script = {{"OnShow", function(self) self:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ticketscrollframe8",
    group = "ticket",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPRIGHT",
      relTo = "ma_ticketscrollframe7",
      relPos = "BOTTOMRIGHT",
      offY = -1
    },
    text = "",
    size = {
      width = 270,
      height = 16
    },
    script = {{"OnShow", function(self) self:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ticketscrollframe9",
    group = "ticket",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPRIGHT",
      relTo = "ma_ticketscrollframe8",
      relPos = "BOTTOMRIGHT",
      offY = -1
    },
    text = "",
    size = {
      width = 270,
      height = 16
    },
    script = {{"OnShow", function(self) self:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ticketscrollframe10",
    group = "ticket",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPRIGHT",
      relTo = "ma_ticketscrollframe9",
      relPos = "BOTTOMRIGHT",
      offY = -1
    },
    text = "",
    size = {
      width = 270,
      height = 16
    },
    script = {{"OnShow", function(self) self:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ticketscrollframe11",
    group = "ticket",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPRIGHT",
      relTo = "ma_ticketscrollframe10",
      relPos = "BOTTOMRIGHT",
      offY = -1
    },
    text = "",
    size = {
      width = 270,
      height = 16
    },
    script = {{"OnShow", function(self) self:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ticketscrollframe12",
    group = "ticket",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPRIGHT",
      relTo = "ma_ticketscrollframe11",
      relPos = "BOTTOMRIGHT",
      offY = -1
    },
    text = "",
    size = {
      width = 270,
      height = 16
    },
    script = {{"OnShow", function(self) self:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

end
