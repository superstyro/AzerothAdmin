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
-- This script must be listed in the .toc after "MangFrames_SectionLog.lua"
-- Also some variables are globally taken from AzerothAdmin.lua

function AzerothAdmin:CreateCharSection()
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

  FrameLib:BuildFrame({
    type = "PlayerModel",
    name = "ma_modelframe",
    group = "char",
    parent = ma_midframe,
    size = {
      width = 140,
      height = 200
    },
    setpoint = {
      pos = "BOTTOMLEFT",
      offX = 0,
      offY = 0
    },
    inherits = nil
  })

  FrameLib:BuildButton({
    name = "ma_modelrotatelbutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_modelrotatelbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 25,
      height = 15
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 28,
      offY = -35
    },
    text = "<<="
  })

  FrameLib:BuildButton({
    name = "ma_modelrotaterbutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_modelrotaterbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 25,
      height = 15
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 54,
      offY = -35
    },
    text = "=>>"
  })

  FrameLib:BuildButton({
    name = "ma_modelzoominbutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_modelzoominbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 15,
      height = 15
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 81,
      offY = -35
    },
    text = "+"
  })

  FrameLib:BuildButton({
    name = "ma_modelzoomoutbutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_modelzoomoutbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 15,
      height = 15
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 97,
      offY = -35
    },
    text = "-"
  })

  FrameLib:BuildButton({
    name = "ma_killbutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_killbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 140, --charColOne
      offY = -30 --charRowOne
    },
    text = Locale["ma_KillButton"]
  })

  FrameLib:BuildButton({
    name = "ma_revivebutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_revivebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 140, --charColOne
      offY = -52 --charRowTwo
    },
    text = Locale["ma_ReviveButton"]
  })

  FrameLib:BuildButton({
    name = "ma_savebutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_savebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 140, --charColOne
      offY = -74  --charRowThree
    },
    text = Locale["ma_SaveButton"]
  })

  FrameLib:BuildButton({
    name = "ma_kickbutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_kickbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 140, --charColOne
      offY = -95 --charRowFour
    },
    text = Locale["ma_KickButton"]
  })

  FrameLib:BuildButton({
    name = "ma_cooldownbutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_cooldownbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 140, --charColOne
      offY = -117 --charRowFive
    },
    text = Locale["ma_CooldownButton"]
  })

  FrameLib:BuildButton({
    name = "ma_demorphbutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_demorphbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 222, --charColTwo
      offY = -117 --charRowFive
    },
    text = Locale["ma_DemorphButton"]
  })

  FrameLib:BuildButton({
    name = "ma_showmapsbutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_showmapsbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 303, --charColThree
      offY = -30 --charRowOne
    },
    text = Locale["ma_ShowMapsCharButton"]
  })

  FrameLib:BuildButton({
    name = "ma_hidemapsbutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_hidemapsbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 385, --charColFour offX = 303, --charColThree
      offY = -30 --charRowOne offY = -52 --charRowTwo
    },
    text = Locale["ma_HideMapsButton"]
  })

  FrameLib:BuildButton({
    name = "ma_gpsbutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_gpsbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 303, --charColThree
      offY = -74 --charRowThree
    },
    text = Locale["ma_GPSButton"]
  })

  FrameLib:BuildButton({
    name = "ma_guidbutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_guidbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 222, --charColTwo
      offY = -30 --charRowOne
    },
    text = Locale["ma_GUIDButton"]
  })

  FrameLib:BuildButton({
    name = "ma_pinfobutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_pinfobutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 222, --charColTwo
      offY = -52 --charRowTwo
    },
    text = Locale["ma_PinfoButton"]
  })

  FrameLib:BuildButton({
    name = "ma_distancebutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_distancebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 222, --charColTwo
      offY = -74 --charRowThree
    },
    text = Locale["ma_DistanceButton"]
  })

  FrameLib:BuildButton({
    name = "ma_recallbutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_recallbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 222, --charColTwo
      offY = -95 --charRowFour
    },
    text = Locale["ma_RecallButton"]
  })

  FrameLib:BuildFrame({
    name = "ma_learnlangdropdown",
    group = "char",
    parent = ma_midframe,
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = -15,
      offY = 0
    },
    inherits = "UIDropDownMenuTemplate"
  })

  FrameLib:BuildButton({
    name = "ma_learnlangbutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_learnlangbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 40,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 120,
      offY = -4
    },
    text = Locale["ma_Learn"]
  })

  FrameLib:BuildFrame({
    name = "ma_modifydropdown",
    group = "char",
    parent = ma_midframe,
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 315,
      offY = 0
    },
    inherits = "UIDropDownMenuTemplate"
  })

  FrameLib:BuildFrame({
    type = "EditBox",
    name = "ma_modifyeditbox",
    group = "char",
    parent = ma_midframe,
    size = {
      width = 30,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 455,
      offY = -4
    },
    inherits = "InputBoxTemplate"
  })

  FrameLib:BuildButton({
    name = "ma_modifybutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_modifybutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 40,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 485,
      offY = -4
    },
    text = Locale["ma_Modify"]
  })

  FrameLib:BuildFrame({
    name = "ma_resetdropdown",
    group = "char",
    parent = ma_midframe,
    size = {
      width = 40,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 150,
      offY = 0
    },
    inherits = "UIDropDownMenuTemplate"
  })

  FrameLib:BuildButton({
    name = "ma_resetbutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_resetbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 40,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 285,
      offY = -4
    },
    text = Locale["ma_Reset"]
  })

  FrameLib:BuildButton({
    name = "ma_charbindsight",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_charbindsight_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 303, --charColThree
      offY = -95 --charRowFour
    },
    text = Locale["ma_CharBindsight"]
  })

  FrameLib:BuildButton({
    name = "ma_charunbindsight",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_charunbindsight_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 303, --charColThree
      offY = -117 --charRowFive
    },
    text = Locale["ma_CharUnBindsight"]
  })

  FrameLib:BuildButton({
    name = "ma_charrenamebutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_charrenamebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 140, --charColOne
      offY = -139 --charRowSix
    },
    text = Locale["ma_charrename"]
  })

  FrameLib:BuildButton({
    name = "ma_charcustomizebutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_charcustomizebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 222, --charColTwo
      offY = -139 --charRowSix
    },
    text = Locale["ma_charcustomize"]
  })

  FrameLib:BuildButton({
    name = "ma_charchangeracebutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_charchangeracebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 303, --charColThree
      offY = -139 --charRowSix
    },
    text = Locale["ma_charchangerace"]
  })

  FrameLib:BuildButton({
    name = "ma_charchangefactionbutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_charchangefactionbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 140, --charColOne
      offY = -160 --charRowSeven
    },
    text = Locale["ma_charchnagefaction"]
  })

  FrameLib:BuildButton({
    name = "ma_charcombatstopbutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_charcombatstopbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 222, --charColTwo
      offY = -160 --charRowSeven
    },
    text = Locale["ma_charcombatstop"]
  })

  FrameLib:BuildButton({
    name = "ma_charmaxskillbutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_charmaxskillbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 303, --charColThree
      offY = -160 --charRowSeven
    },
    text = Locale["ma_charmaxskill"]
  })

  FrameLib:BuildButton({
    name = "ma_charfreezebutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_charfreezebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 140, --charColOne
      offY = -182 --charRowEight
    },
    text = Locale["ma_charfreeze"]
  })

  FrameLib:BuildButton({
    name = "ma_charunfreezebutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_charunfreezebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 222, --charColTwo
      offY = -182 --charRowEight
    },
    text = Locale["ma_charunfreeze"]
  })

  FrameLib:BuildButton({
    name = "ma_charlistfreezebutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_charlistfreezebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 303, --charColThree
      offY = -182 --charRowEight
    },
    text = Locale["ma_charlistfreeze"]
  })

  FrameLib:BuildButton({
    name = "ma_charpossessbutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_charpossessbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 140, --charColOne
      offY = -204 --charRowNine
    },
    text = Locale["ma_charpossess"]
  })

  FrameLib:BuildButton({
    name = "ma_charunpossessbutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_charunpossessbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 222, --charColTwo
      offY = -204 --charRowNine
    },
    text = Locale["ma_charunpossess"]
  })

  FrameLib:BuildButton({
    name = "ma_charrecallbutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_charrecallbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 303, --charColThree
      offY = -204 --charRowNine
    },
    text = Locale["ma_charrecall"]
  })

  FrameLib:BuildButton({
    name = "ma_charrepairitemsbutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_charreppairitemsbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 303, --charColThree
      offY = -52 --charRowTwo [[offY = -225 --charRowTen]]
    },
    text = Locale["ma_charrepair"]
  })

  --[[CHAR2 Tab Copy Over]]
  FrameLib:BuildButton({
    name = "ma_banbutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_banbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 385, --charColFour
      offY = -52 --charRowTwo
    },
    text = Locale["ma_banbutton"]
    })

 FrameLib:BuildButton({
    name = "ma_charmorphbutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_charmorphbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 385, --charColFour
      offY = -139 --charRowSix
    },
    text = Locale["ma_Morph"]
    })

 FrameLib:BuildButton({
    name = "ma_gonamebutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_gonamebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 467, --charColFive
      offY = -52 --charRowTwo
    },
    text = Locale["ma_gonamebutton"]
    })

 FrameLib:BuildButton({
    name = "ma_createguildbutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_createguildbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 548, --charColSix
      offY = -52 --charRowTwo
    },
    text = Locale["ma_createguildbutton"]
    })

 FrameLib:BuildButton({
    name = "ma_baninfobutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_baninfobutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 385, --charColFour
      offY = -74  --charRowThree
    },
    text = Locale["ma_baninfobutton"]
    })

 FrameLib:BuildButton({
    name = "ma_groupgobutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_groupgobutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 467, --charColFive
      offY = -74  --charRowThree
    },
    text = Locale["ma_groupgobutton"]
    })

 FrameLib:BuildButton({
    name = "ma_guildinvitebutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_guildinvitebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 548, --charColSix
      offY = -74  --charRowThree
    },
    text = Locale["ma_guildinvitebutton"]
    })

 FrameLib:BuildButton({
    name = "ma_banlistbutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_banlistbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 385, --charColFour
      offY = -95 --charRowFour
    },
    text = Locale["ma_banlistbutton"]
    })

 FrameLib:BuildButton({
    name = "ma_namegobutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_namegobutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 467, --charColFive
      offY = -95 --charRowFour
    },
    text = Locale["ma_namegobutton"]
    })

 FrameLib:BuildButton({
    name = "ma_guildrankbutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_guildrankbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 548, --charColSix
      offY = -95 --charRowFour
    },
    text = Locale["ma_guildrankbutton"]
    })

 FrameLib:BuildButton({
    name = "ma_telegroupbutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_telegroupbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 630, --charColSeven
      offY = -30 --charRowOne
    },
    text = Locale["ma_telegroupbutton"]
    })

 FrameLib:BuildButton({
    name = "ma_unbanbutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_unbanbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 385, --charColFour
      offY = -117 --charRowFive
    },
    text = Locale["ma_unbanbutton"]
    })

 FrameLib:BuildButton({
    name = "ma_guilddeletebutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_guilddeletebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 467, --charColFive
      offY = -117 --charRowFive
    },
    text = Locale["ma_guilddeletebutton"]
    })

 FrameLib:BuildButton({
    name = "ma_guilduninvitebutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_guilduninvitebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 548, --charColSix
      offY = -117 --charRowFive
    },
    text = Locale["ma_guilduninvitebutton"]
    })

 FrameLib:BuildButton({
    name = "ma_telenamebutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_telenamebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 630, --charColSeven
      offY = -52 --charRowTwo
    },
    text = Locale["ma_telenamebutton"]
    })

 FrameLib:BuildButton({
    name = "ma_mutebutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_mutebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 630, --charColSeven
      offY = -74  --charRowThree
    },
    text = Locale["ma_mutebutton"]
})

 FrameLib:BuildButton({
    name = "ma_charaurabutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_charaurabutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 467, --charColFive
      offY = -139 --charRowSix
    },
    text = Locale["ma_Aura"]
    })

 FrameLib:BuildButton({
    name = "ma_charunaurabutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_charunaurabutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 548, --charColSix
      offY = -139 --charRowSix
    },
    text = Locale["ma_UnAura"]
    })

 FrameLib:BuildButton({
    name = "ma_jailabutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_jailabutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 385, --charColFour
      offY = -160 --charRowSeven
    },
    text = Locale["ma_JailAButton"]
    })

 FrameLib:BuildButton({
    name = "ma_jailhbutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_jailhbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 467, --charColFive
      offY = -160 --charRowSeven
    },
    text = Locale["ma_JailHButton"]
  })

 FrameLib:BuildButton({
    name = "ma_unjailbutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_unjailbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 548, --charColSix
      offY = -160 --charRowSeven
    },
    text = Locale["ma_UnJailButton"]
  })

 FrameLib:BuildButton({
    name = "ma_unmutebutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_unmutebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 630, --charColSeven
      offY = -95 --charRowFour
    },
    text = Locale["ma_UnMuteButton"]
  })

 FrameLib:BuildButton({
    name = "ma_questaddbutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_questaddbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 385, --charColFour
      offY = -182 --charRowEight
    },
    text = Locale["ma_QuestAddButton"]
  })

 FrameLib:BuildButton({
    name = "ma_questcompletebutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_questcompletebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 467, --charColFive
      offY = -182 --charRowEight
    },
    text = Locale["ma_QuestCompleteButton"]
  })

 FrameLib:BuildButton({
    name = "ma_questremovebutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_questremovebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 548, --charColSix
      offY = -182 --charRowEight
    },
    text = Locale["ma_QuestRemoveButton"]
  })

 FrameLib:BuildButton({
    name = "ma_damagebutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_damagebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 385, --charColFour
      offY = -204 --charRowNine
    },
    text = Locale["ma_DamageButton"]
  })

 FrameLib:BuildButton({
    name = "ma_hideareabutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_hideareabutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 548, --charColSix
      offY = -30 --charRowOne
    },
    text = Locale["ma_HideAreaButton"]
  })

 FrameLib:BuildButton({
    name = "ma_showareabutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_showareabutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 467, --charColFive
      offY = -30 --charRowOne
    },
    text = Locale["ma_ShowAreaButton"]
  })

 FrameLib:BuildButton({
    name = "ma_honoraddbutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_honoraddbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 467, --charColFive
      offY = -204 --charRowNine
    },
    text = Locale["ma_HonorAddButton"]
  })

 FrameLib:BuildButton({
    name = "ma_honorupdatebutton",
    group = "char",
    parent = ma_midframe,
    texture = {
      name = "ma_honorupdatebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 548, --charColSix
      offY = -204 --charRowNine
    },
    text = Locale["ma_HonorUpdateButton"]
  })

  FrameLib:BuildFontString({
    name = "ma_parameterboxtext",
    group = "char",
    parent = ma_midframe,
    text = Locale["ma_parameters"],
    setpoint = {
      pos = "BOTTOMLEFT",
      offX = 218, --charColTwo
      offY = 8
    }
  })

  FrameLib:BuildFrame({
    type = "EditBox",
    name = "ma_charactertarget",
    group = "char",
    parent = ma_midframe,
    size = {
      width = 260,
      height = 20
    },
    setpoint = {
      pos = "BOTTOMLEFT",
      offX = 292,
      offY = 4
    },
    inherits = "InputBoxTemplate"
  })

end
