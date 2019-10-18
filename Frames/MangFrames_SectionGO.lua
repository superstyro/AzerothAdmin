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
-- This script must be listed in the .toc after "MangFrames_SectionTele.lua"
-- Also some variables are globally taken from MangAdmin.lua

function MangAdmin:CreateGOSection()
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
    name = "ma_objgobutton",
    group = "go",
    parent = ma_midframe,
    texture = {
      name = "ma_objgobutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 12,
      offY = -102
    },
    text = Locale["ma_OBJGo"]
  })

  FrameLib:BuildButton({
    name = "ma_objaddbutton",
    group = "go",
    parent = ma_midframe,
    texture = {
      name = "ma_objaddbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 96,
      offY = -102
    },
    text = Locale["ma_OBJAdd"]
  })

  FrameLib:BuildButton({
    name = "ma_objmovebutton",
    group = "go",
    parent = ma_midframe,
    texture = {
      name = "ma_objmovebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 12,
      offY = -128
    },
    text = Locale["ma_OBJMove"]
  })

  FrameLib:BuildButton({
    name = "ma_objturnbutton",
    group = "go",
    parent = ma_midframe,
    texture = {
      name = "ma_objturnbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 96,
      offY = -128
    },
    text = Locale["ma_OBJTurn"]
  })

  FrameLib:BuildButton({
    name = "ma_objdelbutton",
    group = "go",
    parent = ma_midframe,
    texture = {
      name = "ma_objdelbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 12,
      offY = -154
    },
    text = Locale["ma_OBJDel"]
  })

  FrameLib:BuildButton({
    name = "ma_objnearbutton",
    group = "go",
    parent = ma_midframe,
    texture = {
      name = "ma_objnearbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 12,
      offY = -12
    },
    text = Locale["ma_OBJNear"]
  })

  FrameLib:BuildButton({
    name = "ma_objtargetbutton",
    group = "go",
    parent = ma_midframe,
    texture = {
      name = "ma_objtargetbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 96,
      offY = -12
    },
    text = Locale["ma_OBJTarget"]
  })

  FrameLib:BuildFontString({
    name = "ma_gobguidlabel",
    group = "go",
    parent = ma_midframe,
    text = "GOb GUID",
    setpoint = {
      pos = "TOPLEFT",
      offX = 12,
      offY = -37
    },
  })

  FrameLib:BuildFontString({
    name = "ma_gobentrylabel",
    group = "go",
    parent = ma_midframe,
    text = "GOb EntryID",
    setpoint = {
      pos = "TOPLEFT",
      offX = 93,
      offY = -37
    },
  })

  FrameLib:BuildFrame({
    type = "EditBox",
    name = "ma_Obj_guidbutton",
    group = "go",
    parent = ma_midframe,
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 12,
      offY = -53
    },
    maxLetters = 10,
    multiline = false,
    inherits = "InputBoxTemplate"
  })

  FrameLib:BuildFrame({
    type = "EditBox",
    name = "ma_Obj_idbutton",
    group = "go",
    parent = ma_midframe,
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 96,
      offY = -53
    },
    maxLetters = 10,
    multiline = false,
    inherits = "InputBoxTemplate"
  })

  FrameLib:BuildButton({
    name = "ma_gobactivatebutton",
    group = "go",
    parent = ma_midframe,
    texture = {
      name = "ma_gobactivatebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 96,
      offY = -154
    },
    text = Locale["ma_OBJActivate"]
  })

  FrameLib:BuildButton({
    name = "ma_gobaddtempbutton",
    group = "go",
    parent = ma_midframe,
    texture = {
      name = "ma_gobaddtempbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 12,
      offY = -180
    },
    text = Locale["ma_OBJAddTemp"]
  })

  FrameLib:BuildButton({
    name = "ma_gobinfobutton",
    group = "go",
    parent = ma_midframe,
    texture = {
      name = "ma_gobinfobutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 96,
      offY = -180
    },
    text = Locale["ma_OBJInfo"]
  })

  FrameLib:BuildButton({
    name = "ma_gobsetphasebutton",
    group = "go",
    parent = ma_midframe,
    texture = {
      name = "ma_gobsetphasebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 12,
      offY = -206
    },
    text = Locale["ma_OBJSetPhase"]
  })

  FrameLib:BuildFrame({
    type = "EditBox",
    name = "ma_gobsetphaseinput",
    group = "go",
    parent = ma_midframe,
    size = {
      width = 40,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 98,
      offY = -207
    },
    maxLetters = 5,
    multiline = false,
    inherits = "InputBoxTemplate"
  })

    FrameLib:BuildButton({
    name = "ma_gobmodelrotatelbutton",
    group = "go",
    parent = ma_midframe,
    texture = {
      name = "ma_gobmodelrotatelbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 30,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 191,
      offY = -12
    },
    text = "<<"
  })

  FrameLib:BuildButton({
    name = "ma_gobmodelrotaterbutton",
    group = "go",
    parent = ma_midframe,
    texture = {
      name = "ma_gobmodelrotaterbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 30,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 227,
      offY = -12
    },
    text = ">>"
  })

  FrameLib:BuildButton({
    name = "ma_gobmodelzoominbutton",
    group = "go",
    parent = ma_midframe,
    texture = {
      name = "ma_gobmodelzoominbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 15,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 261,
      offY = -12
    },
    text = "+"
  })

  FrameLib:BuildButton({
    name = "ma_gobmodelzoomoutbutton",
    group = "go",
    parent = ma_midframe,
    texture = {
      name = "ma_gobmodelzoomoutbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 15,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 282,
      offY = -12
    },
    text = "-"
  })

  FrameLib:BuildFrame({
    type = "PlayerModel",
    name = "ma_gobjectmodel",
    group = "go",
    parent = ma_midframe,
    size = {
      width = 210,
      height = 210
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 182,
      offY = -38
    },
    inherits = nil
  })

  FrameLib:BuildFrame({
    type = "EditBox",
    name = "ma_gobtargetinfo",
    group = "go",
    parent = ma_midframe,
    texture = {
      name = "ma_gobtargetinfo_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 180,
      height = 80
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 398,
      offY = 0
    },
    maxLetters = 1000,
    multiline = true,
    textcolor = {1, 1, 1, 1.0}
  })

  FrameLib:BuildFrame({
    type = "EditBox",
    name = "ma_gobinfoinfo",
    group = "go",
    parent = ma_midframe,
    texture = {
      name = "ma_gobinfoinfo_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 180,
      height = 80
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 398,
      offY = -145
    },
    maxLetters = 1000,
    multiline = true,
    textcolor = {1, 1, 1, 1.0}
  })

  FrameLib:BuildFrame({
    type = "EditBox",
    name = "ma_gobdisplayid",
    group = "go",
    parent = ma_midframe,
    size = {
      width = 60,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 116,
      offY = -79
    },
    maxLetters = 10,
    multiline = false,
    inherits = "InputBoxTemplate"
  })

  FrameLib:BuildFontString({
    name = "ma_gobdisplayidlabel",
    group = "go",
    parent = ma_midframe,
    text = "DisplayID:",
    setpoint = {
      pos = "TOPLEFT",
      offX = 42,
      offY = -82
    },
  })

  FrameLib:BuildButton({
    name = "ma_gobmoveforwardbutton",
    group = "go",
    parent = ma_midframe,
    texture = {
      name = "ma_gobmoveforwardbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 50,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 640,
      offY = -12
    },
    text = "FWD"
  })

  FrameLib:BuildButton({
    name = "ma_gobmoveleftbutton",
    group = "go",
    parent = ma_midframe,
    texture = {
      name = "ma_gobmoveleftbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 50,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 584,
      offY = -38
    },
    text = "LEFT"
  })

  FrameLib:BuildButton({
    name = "ma_gobmoverightbutton",
    group = "go",
    parent = ma_midframe,
    texture = {
      name = "ma_gobmoverightbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 50,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 696,
      offY = -38
    },
    text = "RIGHT"
  })

  FrameLib:BuildButton({
    name = "ma_gobmovebackbutton",
    group = "go",
    parent = ma_midframe,
    texture = {
      name = "ma_gobmovebackbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 50,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 640,
      offY = -64
    },
    text = "BACK"
  })

  FrameLib:BuildButton({
    name = "ma_gobspawnherebutton",
    group = "go",
    parent = ma_midframe,
    texture = {
      name = "ma_gobspawnherebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 50,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 640,
      offY = -38
    },
    text = "HERE"
  })

  FrameLib:BuildButton({
    name = "ma_gobmoveupbutton",
    group = "go",
    parent = ma_midframe,
    texture = {
      name = "ma_gobmoveupbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 40,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 706,
      offY = -12
    },
    text = "UP"
  })

  FrameLib:BuildButton({
    name = "ma_gobmovedownbutton",
    group = "go",
    parent = ma_midframe,
    texture = {
      name = "ma_gobmovedownbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 40,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 706,
      offY = -64
    },
    text = "DOWN"
  })

  FrameLib:BuildButton({
    type = "CheckButton",
    name = "ma_spawnonmovecheck",
    group = "go",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      offX = 615,
      offY = -80
    },
    text = "Add On Move",
    inherits = "OptionsCheckButtonTemplate"
  })

  FrameLib:BuildButton({
    type = "CheckButton",
    name = "ma_moveonmovecheck",
    group = "go",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      offX = 615,
      offY = -105
    },
    text = "Move on Move",
    inherits = "OptionsCheckButtonTemplate"
  })

  FrameLib:BuildFrame({
    type = "EditBox",
    name = "ma_gobmovedistforwardback",
    group = "go",
    parent = ma_midframe,
    size = {
      width = 50,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 696,
      offY = -155
    },
    maxLetters = 10,
    multiline = false,
    inherits = "InputBoxTemplate"
  })

  FrameLib:BuildFrame({
    type = "EditBox",
    name = "ma_gobmovedistleftright",
    group = "go",
    parent = ma_midframe,
    size = {
      width = 50,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 696,
      offY = -181
    },
    maxLetters = 10,
    multiline = false,
    inherits = "InputBoxTemplate"
  })

  FrameLib:BuildFrame({
    type = "EditBox",
    name = "ma_gobmovedistupdown",
    group = "go",
    parent = ma_midframe,
    size = {
      width = 50,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 696,
      offY = -207
    },
    maxLetters = 10,
    multiline = false,
    inherits = "InputBoxTemplate"
  })

  FrameLib:BuildFontString({
    name = "ma_gobmovedistanceslabel",
    group = "go",
    parent = ma_midframe,
    text = "Move Distances",
    setpoint = {
      pos = "TOPLEFT",
      offX = 602,
      offY = -131
    },
  })

  FrameLib:BuildFontString({
    name = "ma_gobmovedistforwardbacklabel",
    group = "go",
    parent = ma_midframe,
    text = "Fwd/Back:",
    setpoint = {
      pos = "TOPLEFT",
      offX = 605,
      offY = -158
    },
  })

  FrameLib:BuildFontString({
    name = "ma_gobmovedistleftrightlabel",
    group = "go",
    parent = ma_midframe,
    text = "Left/Right:",
    setpoint = {
      pos = "TOPLEFT",
      offX = 605,
      offY = -184
    },
  })

  FrameLib:BuildFontString({
    name = "ma_gobmovedistupdownlabel",
    group = "go",
    parent = ma_midframe,
    text = "Up/Down:",
    setpoint = {
      pos = "TOPLEFT",
      offX = 605,
      offY = -210
    },
  })

  FrameLib:BuildButton({
    name = "ma_gobshowmodel",
    group = "go",
    parent = ma_midframe,
    texture = {
      name = "ma_gobshowmodel_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 60,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 303,
      offY = -12
    },
    text = "Show"
  })

 --[[ FrameLib:BuildFrame({
    type = "Slider",
    name = "ma_cameraleftrightslider",
    group = "go",
    parent = ma_midframe,
    size = {
      width = 190,
      height = 10
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 182,
      offY = -223
    },
    inherits = "OptionsSliderTemplate",
    orientation="HORIZONTAL"
  })

  FrameLib:BuildFrame({
    type = "Slider",
    name = "ma_cameraupdownslider",
    group = "go",
    parent = ma_midframe,
    size = {
      width = 10,
      height = 190
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 376,
      offY = -37
    },
    inherits = "OptionsSliderTemplate",
    orientation="VERTICAL"
  })]]

end
