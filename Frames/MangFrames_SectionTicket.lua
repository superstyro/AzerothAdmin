-------------------------------------------------------------------------------------------------------------
--
-- AzerothAdmin Version 3.x
-- AzerothAdmin is a derivative of TrinityAdmin/MangAdmin.
--
-- Copyright (C) 2022 Free Software Foundation, Inc.
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
-- This script must be listed in the .toc after "MangFrames_SectionChar.lua"
-- Also some variables are globally taken from MangAdmin.lua

function MangAdmin:CreateTicketSection()
  local transparency = {
    bg = MangAdmin.db.account.style.transparency.backgrounds,
    btn = MangAdmin.db.account.style.transparency.buttons,
    frm = MangAdmin.db.account.style.transparency.frames
  }
  local color = {
    bg = MangAdmin.db.account.style.color.backgrounds,
    btn = MangAdmin.db.account.style.color.buttons,
    frm = MangAdmin.db.account.style.color.frames
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
        width = 60,
        height = 15
    },
    setpoint = {
        pos = "TOPLEFT",
        offX = 10,
        offY = -5
    },
    text = "1.RESET"
})

  FrameLib:BuildButton({
    name = "ma_loadallticktsbutton",
    group = "ticket",
    parent = ma_midframe,
    texture = {
        name = "ma_loadticketsbutton_texture",
        color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
        width = 100,
        height = 15
    },
    setpoint = {
        pos = "TOPLEFT",
        offX = 80,
        offY = 0
    },
    text = "2.Load All or"
})

  FrameLib:BuildButton({
    name = "ma_loadonlineticketsbutton",
    group = "ticket",
    parent = ma_midframe,
    texture = {
        name = "ma_loadticketsbutton_texture",
        color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
        width = 100,
        height = 15
    },
    setpoint = {
        pos = "TOPLEFT",
        offX = 80,
        offY = -15
    },
    text = "2.Load Online"
})

  FrameLib:BuildButton({
    name = "ma_showbutton",
    group = "ticket",
    parent = ma_midframe,
    texture = {
        name = "ma_showbutton_texture",
        color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
        width = 60,
        height = 15
    },
    setpoint = {
        pos = "TOPLEFT",
        offX = 200,
        offY = -5
    },
    text = "3.SHOW"
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
      offX = 240,
      offY = -226
    },
    text = "Go Ticket"
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
      offX = 325,
      offY = -226
    },
    text = "Whisper" --Locale["ma_WhisperButton"]
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
      offX = 410,
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
      offX = 495,
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
      offX = 580,
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
      offX = 665,
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
      width = 450,
      height = 200
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 270,
      offY = -10
    },
    --[[setpoint2 = {
      pos = "BOTTOMRIGHT",
      offX = -30,
      offY = 34
    },]]
    inherits = "FauxScrollFrameTemplate"
--    inherits = "UIPanelScrollFrameTemplate"
  })

  FrameLib:BuildFrame({
    type = "EditBox",
    name = "ma_ticketdetail",
    group = "ticket",
    parent = ma_midframe,
    texture = {
      name = "ma_ticketeditbox_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 260,
      height = 165
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 2,
      offY = -55
    },
    maxletters = 623,
    multiline = true
  })

  FrameLib:BuildFontString({
    name = "ma_ticketidlabel",
    group = "ticket",
    parent = ma_midframe,
    text = "Ticket:",
    setpoint = {
      pos = "TOPLEFT",
      offX = 2,
      offY = -30
    }
  })

  FrameLib:BuildFontString({
    name = "ma_ticketid",
    group = "ticket",
    parent = ma_midframe,
    text = "",
    setpoint = {
      pos = "TOPLEFT",
      offX = 35,
      offY = -30
    }
  })

  FrameLib:BuildFontString({
    name = "ma_ticketcreatedbylabel",
    group = "ticket",
    parent = ma_midframe,
    text = "Created by:",
    setpoint = {
      pos = "TOPLEFT",
      offX = 2,
      offY = -40
    }
  })

  FrameLib:BuildFontString({
    name = "ma_ticketcreatedby",
    group = "ticket",
    parent = ma_midframe,
    text = "",
    setpoint = {
      pos = "TOPLEFT",
      offX = 57,  
      offY = -40
    }
  })

  FrameLib:BuildFontString({
    name = "ma_tickettimecreatedlabel",
    group = "ticket",
    parent = ma_midframe,
    text = "Created:",
    setpoint = {
      pos = "TOPLEFT",
      offX = 115,
      offY = -30
    }
  })

  FrameLib:BuildFontString({
    name = "ma_tickettimecreated",
    group = "ticket",
    parent = ma_midframe,
    text = "",
    setpoint = {
      pos = "TOPLEFT",
      offX = 156,
      offY = -30
    }
  })

  FrameLib:BuildFontString({
    name = "ma_ticketlastchangelabel",
    group = "ticket",
    parent = ma_midframe,
    text = "Last Change:",
    setpoint = {
      pos = "TOPLEFT",
      offX = 115,
      offY = -40
    }
  })

  FrameLib:BuildFontString({
    name = "ma_ticketlastchange",
    group = "ticket",
    parent = ma_midframe,
    text = "",
    setpoint = {
      pos = "TOPLEFT",
      offX = 177,
      offY = -40
    }
  })

  FrameLib:BuildButton({
    name = "ma_ticketscrollframe1",
    JustifyH = "LEFT",
    group = "ticket",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_ticketscrollframe",
      relPos = "TOPLEFT",
      offY = -1
    },
    texture = {
      name = "ma_ticketeditbox_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    text = "",
    size = {
      width = 440,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ticketscrollframe2",
    group = "ticket",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_ticketscrollframe1",
      relPos = "BOTTOMLEFT",
      offY = -1
    },
    texture = {
      name = "ma_ticketeditbox_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    text = "",
    size = {
      width = 440,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ticketscrollframe3",
    group = "ticket",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_ticketscrollframe2",
      relPos = "BOTTOMLEFT",
      offY = -1
    },
    texture = {
      name = "ma_ticketeditbox_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    text = "",
    size = {
      width = 440,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ticketscrollframe4",
    group = "ticket",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_ticketscrollframe3",
      relPos = "BOTTOMLEFT",
      offY = -1
    },
    texture = {
      name = "ma_ticketeditbox_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    text = "",
    size = {
      width = 440,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ticketscrollframe5",
    group = "ticket",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_ticketscrollframe4",
      relPos = "BOTTOMLEFT",
      offY = -1
    },
    texture = {
      name = "ma_ticketeditbox_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    text = "",
    size = {
      width = 440,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ticketscrollframe6",
    group = "ticket",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_ticketscrollframe5",
      relPos = "BOTTOMLEFT",
      offY = -1
    },
    texture = {
      name = "ma_ticketeditbox_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    text = "",
    size = {
      width = 440,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ticketscrollframe7",
    group = "ticket",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_ticketscrollframe6",
      relPos = "BOTTOMLEFT",
      offY = -1
    },
    texture = {
      name = "ma_ticketeditbox_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    text = "",
    size = {
      width = 440,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ticketscrollframe8",
    group = "ticket",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_ticketscrollframe7",
      relPos = "BOTTOMLEFT",
      offY = -1
    },
    texture = {
      name = "ma_ticketeditbox_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    text = "",
    size = {
      width = 440,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ticketscrollframe9",
    group = "ticket",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_ticketscrollframe8",
      relPos = "BOTTOMLEFT",
      offY = -1
    },
    texture = {
      name = "ma_ticketeditbox_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    text = "",
    size = {
      width = 440,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ticketscrollframe10",
    group = "ticket",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_ticketscrollframe9",
      relPos = "BOTTOMLEFT",
      offY = -1
    },
    texture = {
      name = "ma_ticketeditbox_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    text = "",
    size = {
      width = 440,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ticketscrollframe11",
    group = "ticket",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_ticketscrollframe10",
      relPos = "BOTTOMLEFT",
      offY = -1
    },
    texture = {
      name = "ma_ticketeditbox_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    text = "",
    size = {
      width = 440,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ticketscrollframe12",
    group = "ticket",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_ticketscrollframe11",
      relPos = "BOTTOMLEFT",
      offY = -1
    },
    texture = {
      name = "ma_ticketeditbox_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    text = "",
    size = {
      width = 440,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

end
