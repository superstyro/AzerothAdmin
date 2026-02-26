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
-- This script must be listed in the .toc after "Frames_SectionTele.lua"
-- Also some variables are globally taken from AzerothAdmin.lua

function AzerothAdmin:CreateGOSection()
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
      offX = 5,
      offY = -130
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
      offX = 5,
      offY = -180
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
      offX = 5,
      offY = -155
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
      offX = 90,
      offY = -155
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
      offX = 90,
      offY = -130
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
      offX = 5,
      offY = -5
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
      offX = 90,
      offY = -5
    },
    text = Locale["ma_OBJTarget"]
  })

  FrameLib:BuildFontString({
    name = "ma_gobguidlabel",
    group = "go",
    parent = ma_midframe,
    text = Locale["ma_GOGUIDLabel"],
    setpoint = {
      pos = "TOPLEFT",
      offX = 30,
      offY = -57
    }
  })

  FrameLib:BuildFontString({
    name = "ma_gobentrylabel",
    group = "go",
    parent = ma_midframe,
    text = Locale["ma_GOEntryIDLabel"],
    setpoint = {
      pos = "TOPLEFT",
      offX = 105,
      offY = -57
    }
  })

  FrameLib:BuildFrame({
    type = "EditBox",
    name = "ma_Obj_guidbutton",
    group = "go",
    parent = ma_midframe,
    size = {
      width = 75,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 10,
      offY = -70
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
      width = 75,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 95,
      offY = -70
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
      offX = 90,
      offY = -180
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
      offX = 5,
      offY = -205
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
      offX = 90,
      offY = -30
    },
    text = Locale["ma_OBJInfo"]
  })

  FrameLib:BuildButton({
    name = "ma_gobclearinfobutton",
    group = "go",
    parent = ma_midframe,
    texture = {
      name = "ma_gobclearinfobutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 90,
      offY = -205
    },
    text = Locale["ma_OBJClearInfo"]
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
      offX = 5,
      offY = -230
    },
    text = Locale["ma_OBJSetPhase"]
  })

  FrameLib:BuildFrame({
    type = "EditBox",
    name = "ma_gobsetphaseinput",
    group = "go",
    parent = ma_midframe,
    size = {
      width = 75,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 95,
      offY = -230
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
      width = 28,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 183,
      offY = -5
    },
    text = Locale["ma_GORotateLeft"]
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
      width = 28,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 213,
      offY = -5
    },
    text = Locale["ma_GORotateRight"]
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
      offX = 245,
      offY = -5
    },
    text = Locale["ma_GOZoomIn"]
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
      offX = 262,
      offY = -5
    },
    text = Locale["ma_GOZoomOut"]
  })

  FrameLib:BuildFrame({
    type = "PlayerModel",
    name = "ma_gobjectmodel",
    group = "go",
    parent = ma_midframe,
    size = {
      width = 220,
      height = 220
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 182,
      offY = -30
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
      width = 165,
      height = 80
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 410,
      offY = -5
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
      width = 165,
      height = 80
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 410,
      offY = -145
    },
    maxLetters = 1000,
    multiline = true,
    textcolor = {1, 1, 1, 1.0}
  })

  FrameLib:BuildFontString({
    name = "ma_gobdisplayidlabel",
    group = "go",
    parent = ma_midframe,
    text = Locale["ma_GODisplayIDLabel"],
    setpoint = {
      pos = "TOPLEFT",
      offX = 103,
      offY = -92
    }
  })

  FrameLib:BuildFrame({
    type = "EditBox",
    name = "ma_gobdisplayid",
    group = "go",
    parent = ma_midframe,
    size = {
      width = 75,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 95,
      offY = -106
    },
    maxLetters = 10,
    multiline = false,
    inherits = "InputBoxTemplate"
  })

    FrameLib:BuildFrame({
    type = "EditBox",
    name = "ma_gobnearrange",
    group = "go",
    parent = ma_midframe,
    size = {
      width = 75,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 10,
      offY = -106
    },
    maxLetters = 10,
    multiline = false,
    inherits = "InputBoxTemplate"
  })

  FrameLib:BuildFontString({
    name = "ma_gobrangelabel",
    group = "go",
    parent = ma_midframe,
    text = Locale["ma_GORangeLabel"],
    setpoint = {
      pos = "TOPLEFT",
      offX = 25,
      offY = -92
    }
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
      offY = -5
    },
    text = Locale["ma_GOMoveForward"]
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
      offY = -31
    },
    text = Locale["ma_GOMoveLeft"]
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
      offY = -31
    },
    text = Locale["ma_GOMoveRight"]
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
      offY = -57
    },
    text = Locale["ma_GOMoveBack"]
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
      offY = -31
    },
    text = Locale["ma_GOSpawnHere"]
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
      offY = -5
    },
    text = Locale["ma_GOMoveUp"]
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
      offY = -57
    },
    text = Locale["ma_GOMoveDown"]
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
    text = Locale["ma_GOAddOnMoveLabel"],
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
    text = Locale["ma_GOMoveOnMoveLabel"],
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
    text = Locale["ma_GOMoveDistancesLabel"],
    setpoint = {
      pos = "TOPRIGHT",
      offX = -20,
      offY = -140
    }
  })

  FrameLib:BuildFontString({
    name = "ma_gobmovedistforwardbacklabel",
    group = "go",
    parent = ma_midframe,
    text = Locale["ma_GOFwdBackLabel"],
    setpoint = {
      pos = "TOPRIGHT",
      offX = -65,
      offY = -158
    }
  })

  FrameLib:BuildFontString({
    name = "ma_gobmovedistleftrightlabel",
    group = "go",
    parent = ma_midframe,
    text = Locale["ma_GOLeftRightLabel"],
    setpoint = {
      pos = "TOPRIGHT",
      offX = -65,
      offY = -184
    }
  })

  FrameLib:BuildFontString({
    name = "ma_gobmovedistupdownlabel",
    group = "go",
    parent = ma_midframe,
    text = Locale["ma_GOUpDownLabel"],
    setpoint = {
      pos = "TOPRIGHT",
      offX = -65,
      offY = -210
    }
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
      offX = 280,
      offY = -5
    },
    text = Locale["ma_GOLoadButton"]
  })

  -- MEMORY OPTIMIZATION: Unload Models button (frees ~5.6 MB)
  FrameLib:BuildButton({
    name = "ma_gobunloadmodel",
    group = "go",
    parent = ma_midframe,
    texture = {
      name = "ma_gobunloadmodel_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 60,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 342,
      offY = -5
    },
    text = Locale["ma_GOUnloadButton"]
  })
  ma_gobunloadmodel:Disable()

end
