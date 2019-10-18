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

-- Initializing dynamic frames with LUA and FrameLib
-- This script must be listed in the .toc after "MangFrames_SectionTicket.lua"
-- Also some variables are globally taken from MangAdmin.lua

function MangAdmin:CreateWhoSection()
  local transparency = {
    bg = MangAdmin.db.account.style.transparency.backgrounds,
    btn = MangAdmin.db.account.style.transparency.buttons,
    frm = MangAdmin.db.account.style.transparency.frames
  }
  local color = {
    bg = MangAdmin.db.account.style.color.backgrounds,
    btn = MangAdmin.db.account.style.color.buttons,
    frm = MangAdmin.db.account.style.color.frames,
    linkifier = MangAdmin.db.account.style.color.linkifier
  }

  FrameLib:BuildButton({ --Refesh Button
    name = "ma_showwhobutton",
    group = "who",
    parent = ma_midframe,
    texture = {
      name = "ma_showwhobutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 100,
      height = 15
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 10,
      offY = -15
    },
    text = Locale["ma_ShowWhoButton"]
  })

  FrameLib:BuildButton({ --Reset Button
    name = "ma_resetwhobutton",
    group = "who",
    parent = ma_midframe,
    texture = {
      name = "ma_resetwhobutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 100,
      height = 15
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 120,
      offY = -15
    },
    text = Locale["ma_resetwhobutton"]
  })

  FrameLib:BuildButton({
    name = "ma_whisperwhobutton",
    group = "who",
    parent = ma_midframe,
    texture = {
      name = "ma_whisperticketbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 15
    },
    setpoint = {
      pos = "TOPRIGHT",
      offX = -10,
      offY = -15
    },
    text = Locale["ma_whisperbutton"]
  })

  FrameLib:BuildButton({
    name = "ma_summonwhobutton",
    group = "who",
    parent = ma_midframe,
    texture = {
      name = "ma_getcharticketbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 15
    },
    setpoint = {
      pos = "TOPRIGHT",
      offX = -10,
      offY = -30
    },
    text = Locale["ma_SummonWhoButton"]
  })

  FrameLib:BuildButton({
    name = "ma_gocharwhobutton",
    group = "who",
    parent = ma_midframe,
    texture = {
      name = "ma_gocharwhobutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 15
    },
    setpoint = {
      pos = "TOPRIGHT",
      offX = -10,
      offY = -45
    },
    text = Locale["ma_GoCharWhoButton"]
  })

  FrameLib:BuildButton({ --Mail
    name = "ma_answerwhobutton",
    group = "who",
    parent = ma_midframe,
    texture = {
      name = "ma_answerticketbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 15
    },
    setpoint = {
      pos = "TOPRIGHT",
      offX = -10,
      offY = -60
    },
    text = Locale["ma_AnswerWhoButton"]
  })

  FrameLib:BuildButton({
    name = "ma_who_customizebutton",
    group = "who",
    parent = ma_midframe,
    texture = {
      name = "ma_who_customizebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 15
    },
    setpoint = {
      pos = "TOPRIGHT",
      offX = -10,
      offY = -75
    },
    text = Locale["ma_who_customize"]
  })

  FrameLib:BuildButton({
    name = "ma_who_chardeletebutton",
    group = "who",
    parent = ma_midframe,
    texture = {
      name = "ma_who_chardeletebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 15
    },
    setpoint = {
      pos = "TOPRIGHT",
      offX = -10,
      offY = -90
    },
    text = Locale["ma_who_chardelete"]
  })

  FrameLib:BuildButton({
    name = "ma_who_charrenamebutton",
    group = "who",
    parent = ma_midframe,
    texture = {
      name = "ma_who_charrenamebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 15
    },
    setpoint = {
      pos = "TOPRIGHT",
      offX = -10,
      offY = -105
    },
    text = Locale["ma_who_charrename"]
  })

  FrameLib:BuildButton({--Kick
    name = "ma_deletewhobutton",
    group = "who",
    parent = ma_midframe,
    texture = {
      name = "ma_deletewhobutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 15
    },
    setpoint = {
      pos = "TOPRIGHT",
      offX = -10,
      offY = -120
    },
    text = Locale["ma_DeleteWhoButton"]
  })

  FrameLib:BuildButton({
    name = "ma_who_1daybanbutton",
    group = "who",
    parent = ma_midframe,
    texture = {
      name = "ma_who_1daybanbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 15
    },
    setpoint = {
      pos = "TOPRIGHT",
      offX = -10,
      offY = -135
    },
    text = Locale["ma_who_1daybanbutton"]
  })

  FrameLib:BuildButton({
    name = "ma_who_permbanbutton",
    group = "who",
    parent = ma_midframe,
    texture = {
      name = "ma_who_permbanbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 15
    },
    setpoint = {
      pos = "TOPRIGHT",
      offX = -10,
      offY = -150
    },
    text = Locale["ma_who_permbanbutton"]
  })

  FrameLib:BuildButton({
    name = "ma_who_jailabutton",
    group = "who",
    parent = ma_midframe,
    texture = {
      name = "ma_who_jailabutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 15
    },
    setpoint = {
      pos = "TOPRIGHT",
      offX = -10,
      offY = -165
    },
    text = Locale["ma_who_jailabutton"]
  })

  FrameLib:BuildButton({
    name = "ma_who_jailhbutton",
    group = "who",
    parent = ma_midframe,
    texture = {
      name = "ma_who_jailhbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 15
    },
    setpoint = {
      pos = "TOPRIGHT",
      offX = -10,
      offY = -180
    },
    text = Locale["ma_who_jailhbutton"]
  })

  FrameLib:BuildButton({
    name = "ma_who_unjailbutton",
    group = "who",
    parent = ma_midframe,
    texture = {
      name = "ma_who_unjailbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 15
    },
    setpoint = {
      pos = "TOPRIGHT",
      offX = -10,
      offY = -195
    },
    text = Locale["ma_who_unjailbutton"]
  })

  FrameLib:BuildFrame({ --Main Scroll Body
    type = "ScrollFrame",
    name = "ma_whoscrollframe",
    group = "who",
    parent = ma_midframe,
    texture = {
      color = {0,0,0,0.7}
    },
    size = {
      width = 375,
      height = 200
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 240,
      offY = -15
    },
    inherits = "FauxScrollFrameTemplate"
--    inherits = "UIPanelScrollFrameTemplate"
  })

  FrameLib:BuildFrame({  --Weird Editbox, left side, top
    type = "EditBox",
    name = "ma_whodetail",
    group = "who",
    parent = ma_midframe,
    texture = {
      name = "ma_whodetail_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 220,
      height = 85
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 10,
      offY = -65
    },
    maxletters = 100000,
    multiline = true,
    textcolor = {1, 1, 1, 1.0}
  })

  FrameLib:BuildFrame({ --Weird Editbox, left side, bottom
    type = "EditBox",
    name = "ma_whodetail2",
    group = "who",
    parent = ma_midframe,
    texture = {
      name = "ma_whodetail2_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 220,
      height = 110
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 10,
      offY = -140
    },
    maxletters = 100000,
    multiline = true,
    textcolor = {1, 1, 1, 1.0}
  })

  FrameLib:BuildFontString({
    name = "ma_whoidlabel",
    group = "who",
    parent = ma_midframe,
    text = Locale["ma_acctdetail"],
    setpoint = {
      pos = "TOPLEFT",
      offX = 10,
      offY = -30
    }
  })

  FrameLib:BuildFontString({
    name = "ma_whoid",
    group = "who",
    parent = ma_midframe,
    text = "",
    setpoint = {
      pos = "TOPLEFT",
      offX = 40,
      offY = -30
    }
  })

  FrameLib:BuildFontString({
    name = "ma_whowhere",
    group = "who",
    parent = ma_midframe,
    text = "",
    setpoint = {
      pos = "TOPLEFT",
      offX = 40,
      offY = -30
    }
  })

  FrameLib:BuildFontString({
    name = "ma_wholabel",
    group = "who",
    parent = ma_midframe,
    text = Locale["ma_chardetail"],
    setpoint = {
      pos = "TOPLEFT",
      offX = 120,
      offY = -30
    }
  })

  FrameLib:BuildFontString({
    name = "ma_who",
    group = "who",
    parent = ma_midframe,
    text = "",
    setpoint = {
      pos = "TOPLEFT",
      offX = 150,
      offY = -30
    }
  })

  FrameLib:BuildButton({
    name = "ma_whoscrollframe1",
    JustifyH = "LEFT",
    group = "who",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_whoscrollframe",
      relPos = "TOPLEFT",
      offY = -1
    },
    texture = {
      name = "ma_whoscrollframe_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    text = "",
    size = {
      width = 390,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

    FrameLib:BuildButton({
    name = "ma_whoscrollframe2",
    group = "who",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_whoscrollframe1",
      relPos = "BOTTOMLEFT",
      offY = -1
    },
    texture = {
      name = "ma_whoscrollframe_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    text = "",
    size = {
      width = 390,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

    FrameLib:BuildButton({
    name = "ma_whoscrollframe3",
    group = "who",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_whoscrollframe2",
      relPos = "BOTTOMLEFT",
      offY = -1
    },
    texture = {
      name = "ma_whoscrollframe_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    text = "",
    size = {
      width = 390,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

    FrameLib:BuildButton({
    name = "ma_whoscrollframe4",
    group = "who",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_whoscrollframe3",
      relPos = "BOTTOMLEFT",
      offY = -1
    },
    texture = {
      name = "ma_whoscrollframe_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    text = "",
    size = {
      width = 390,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

    FrameLib:BuildButton({
    name = "ma_whoscrollframe5",
    group = "who",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_whoscrollframe4",
      relPos = "BOTTOMLEFT",
      offY = -1
    },
    texture = {
      name = "ma_whoscrollframe_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    text = "",
    size = {
      width = 390,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

    FrameLib:BuildButton({
    name = "ma_whoscrollframe6",
    group = "who",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_whoscrollframe5",
      relPos = "BOTTOMLEFT",
      offY = -1
    },
    texture = {
      name = "ma_whoscrollframe_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    text = "",
    size = {
      width = 390,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

    FrameLib:BuildButton({
    name = "ma_whoscrollframe7",
    group = "who",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_whoscrollframe6",
      relPos = "BOTTOMLEFT",
      offY = -1
    },
    texture = {
      name = "ma_whoscrollframe_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    text = "",
    size = {
      width = 390,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

    FrameLib:BuildButton({
    name = "ma_whoscrollframe8",
    group = "who",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_whoscrollframe7",
      relPos = "BOTTOMLEFT",
      offY = -1
    },
    texture = {
      name = "ma_whoscrollframe_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    text = "",
    size = {
      width = 390,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

    FrameLib:BuildButton({
    name = "ma_whoscrollframe9",
    group = "who",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_whoscrollframe8",
      relPos = "BOTTOMLEFT",
      offY = -1
    },
    texture = {
      name = "ma_whoscrollframe_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    text = "",
    size = {
      width = 390,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

    FrameLib:BuildButton({
    name = "ma_whoscrollframe10",
    group = "who",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_whoscrollframe9",
      relPos = "BOTTOMLEFT",
      offY = -1
    },
    texture = {
      name = "ma_whoscrollframe_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    text = "",
    size = {
      width = 390,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

    FrameLib:BuildButton({
    name = "ma_whoscrollframe11",
    group = "who",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_whoscrollframe10",
      relPos = "BOTTOMLEFT",
      offY = -1
    },
    texture = {
      name = "ma_whoscrollframe_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    text = "",
    size = {
      width = 390,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

    FrameLib:BuildButton({
    name = "ma_whoscrollframe12",
    group = "who",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_whoscrollframe11",
      relPos = "BOTTOMLEFT",
      offY = -1
    },
    texture = {
      name = "ma_whoscrollframe_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    text = "",
    size = {
      width = 390,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

end

