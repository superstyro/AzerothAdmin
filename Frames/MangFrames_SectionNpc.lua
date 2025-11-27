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
-- This script must be listed in the .toc after "MangFrames_SectionTele.lua"
-- Also some variables are globally taken from AzerothAdmin.lua

function AzerothAdmin:CreateNpcSection()
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
    name = "ma_npcmodelframe",
    group = "npc",
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
    name = "ma_npcmodelrotatelbutton",
    group = "npc",
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
    name = "ma_npcmodelrotaterbutton",
    group = "npc",
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
    name = "ma_npcmodelzoominbutton",
    group = "npc",
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
    name = "ma_npcmodelzoomoutbutton",
    group = "npc",
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
    name = "ma_npckillbutton",
    group = "npc",
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
    text = Locale["ma_NPCKillButton"]
  })

  FrameLib:BuildButton({
    name = "ma_respawnbutton",
    group = "npc",
    parent = ma_midframe,
    texture = {
      name = "ma_respawnbutton_texture",
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
    text = Locale["ma_Respawn"]
  })

  FrameLib:BuildButton({
    name = "ma_npcdistancebutton",
    group = "npc",
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
      offX = 140, --charColOne
      offY = -160 --charRowSeven
    },
    text = Locale["ma_NPCDistanceButton"]
  })

  FrameLib:BuildButton({
    name = "ma_npcguidbutton",
    group = "npc",
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
      offX = 548, --charColSix
      offY = -160 --charRowSeven
    },
    text = Locale["ma_NPCGUIDButton"]
  })

  FrameLib:BuildButton({
    name = "ma_npcinfobutton",
    group = "npc",
    parent = ma_midframe,
    texture = {
      name = "ma_npcinfobutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 303, --charColThree
      offY = -52 --charRowTwo
    },
    text = Locale["ma_NPCInfoButton"]
  })

  FrameLib:BuildButton({
    name = "ma_npcmovebutton",
    group = "npc",
    parent = ma_midframe,
    texture = {
      name = "ma_npcmovebutton_texture",
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
    text = Locale["ma_NPCMove"]
  })

  FrameLib:BuildButton({
    name = "ma_npcdelbutton",
    group = "npc",
    parent = ma_midframe,
    texture = {
      name = "ma_npcdelbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 303, --charColThree
      offY = -74  --charRowThree
    },
    text = Locale["ma_NPCDel"]
  })

  FrameLib:BuildButton({
    name = "ma_npcgobutton",
    group = "npc",
    parent = ma_midframe,
    texture = {
      name = "ma_npcgobutton_texture",
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
    text = Locale["ma_NPCGo"]
  })

  --[[First Dropdown Menu]]--
  FrameLib:BuildFrame({
    name = "ma_npcemotedropdown",
    group = "npc",
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

  --[[First Dropdown Menu Button]]
  FrameLib:BuildButton({
    name = "ma_npcemotebutton", --Button
    group = "npc",
    parent = ma_midframe,
    texture = {
      name = "ma_npcemotebutton_texture",
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
    text = Locale["ma_PlayEmote1"]
  })

  --[[Second Dropdown Menu]]
  FrameLib:BuildFrame({
    name = "ma_npcemotedropdown_a",
    group = "npc",
    parent = ma_midframe,
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 150,
      offY = 0
    },
    inherits = "UIDropDownMenuTemplate"
  })

  --[[Second Dropdown Menu Button]]
  FrameLib:BuildButton({
    name = "ma_npcemotebutton_a", -- Button
    group = "npc",
    parent = ma_midframe,
    texture = {
      name = "ma_npcemotebutton_a_texture",
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
    text = Locale["ma_PlayEmote2"]
  })

  FrameLib:BuildButton({
    name = "ma_npcdisplaydownbutton",
    group = "npc",
    parent = ma_midframe,
    texture = {
      name = "ma_npcdisplaydownbutton_texture",
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
    text = "<<"
    })

  FrameLib:BuildFrame({
    type = "EditBox",
    name = "ma_npcdisplayid",
    group = "npc",
    parent = ma_midframe,
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 467, --charColFive
      offY = -204 --charRowNine
    },
    inherits = "InputBoxTemplate"
  })

  FrameLib:BuildButton({
    name = "ma_npcdisplayupbutton",
    group = "npc",
    parent = ma_midframe,
    texture = {
      name = "ma_npcdisplayupbutton_texture",
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
    text = ">>"
    })

  FrameLib:BuildFrame({
    type = "EditBox",
    name = "ma_NPC_idbutton",
    group = "npc",
    parent = ma_midframe,
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 467, --charColFive
      offY = -182 --charRowEight
    },
    inherits = "InputBoxTemplate"
  })

  FrameLib:BuildButton({
    name = "ma_npcID_UPbutton",
    group = "npc",
    parent = ma_midframe,
    texture = {
      name = "ma_npcID_UPbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 39,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 589,
      offY = -182 --charRowEight
    },
    text = ">>"
  })

  FrameLib:BuildButton({
    name = "ma_npcID_DOWNbutton",
    group = "npc",
    parent = ma_midframe,
    texture = {
      name = "ma_npcID_DOWNbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 40,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 548,
      offY = -182 --charRowEight
    },
    text = "<<"
  })

  FrameLib:BuildButton({
    name = "ma_NPC_addbutton",
    group = "npc",
    parent = ma_midframe,
    texture = {
      name = "ma_NPC_addbutton_texture",
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
    text = Locale["ma_NPCAdd"]
  })

  FrameLib:BuildButton({
    name = "ma_NPC_guidgetbutton",
    group = "npc",
    parent = ma_midframe,
    texture = {
      name = "ma_NPC_guidgetbutton_texture",
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
    text = Locale["ma_getguid"]
  })

  FrameLib:BuildFrame({
    type = "EditBox",
    name = "ma_NPC_guidbutton",
    group = "npc",
    parent = ma_midframe,
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 467, --charColFive
      offY = -160 --charRowSeven
    },
    inherits = "InputBoxTemplate"
  })

  FrameLib:BuildFontString({
    name = "ma_npcparameterboxtext",
    group = "npc",
    parent = ma_midframe,
    text = Locale["ma_ParameterBox"],
    setpoint = {
      pos = "TOPLEFT",
      offX = 140, --charColOne
      offY = -231
    }
  })

  --[[Parameter Box Input]]
  FrameLib:BuildFrame({
    type = "EditBox",
    name = "ma_npccharactertarget",
    group = "npc",
    parent = ma_midframe,
    size = {
      width = 120,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 180,
      offY = -225 --charRowTen
    },
    inherits = "InputBoxTemplate"
  })

  FrameLib:BuildButton({ --Morph
    name = "ma_npcmorphbutton",
    group = "npc",
    parent = ma_midframe,
    texture = {
      name = "ma_npcmorphbutton_texture",
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
    text = Locale["ma_NPCMorph"]
  })

  FrameLib:BuildButton({ --Demorph
    name = "ma_npcdemorphbutton",
    group = "npc",
    parent = ma_midframe,
    texture = {
      name = "ma_npcdemorphbutton_texture",
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
    text = Locale["ma_NPCDemorph"]
  })

  FrameLib:BuildButton({
    name = "ma_npcsaybutton",
    group = "npc",
    parent = ma_midframe,
    texture = {
      name = "ma_npcsaybutton_texture",
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
    text = Locale["ma_NPCSay"]
    })

  FrameLib:BuildButton({
    name = "ma_npcyellbutton",
    group = "npc",
    parent = ma_midframe,
    texture = {
      name = "ma_npcyellbutton_texture",
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
    text = Locale["ma_NPCYell"]
    })

  FrameLib:BuildButton({
    name = "ma_npcaurabutton",
    group = "npc",
    parent = ma_midframe,
    texture = {
      name = "ma_npcaurabutton_texture",
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
    text = Locale["ma_NPCAura"]
    })

  FrameLib:BuildButton({
    name = "ma_npcunaurabutton",
    group = "npc",
    parent = ma_midframe,
    texture = {
      name = "ma_npcunaurabutton_texture",
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
    text = Locale["ma_NPCUnAura"]
    })

  FrameLib:BuildButton({
    name = "ma_npcbindsight",
    group = "npc",
    parent = ma_midframe,
    texture = {
      name = "ma_npcbindsight_texture",
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
    text = Locale["ma_NPCBindsight"]
  })

  FrameLib:BuildButton({
    name = "ma_npcunbindsight",
    group = "npc",
    parent = ma_midframe,
    texture = {
      name = "ma_npcunbindsight_texture",
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
    text = Locale["ma_NPCUnBindsight"]
  })

  FrameLib:BuildButton({
    name = "ma_npccometomebutton",
    group = "npc",
    parent = ma_midframe,
    texture = {
      name = "ma_npccometomebutton_texture",
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
    text = Locale["ma_NPCComeToMe"]
  })

  FrameLib:BuildButton({
    name = "ma_npcpossessbutton",
    group = "npc",
    parent = ma_midframe,
    texture = {
      name = "ma_npcpossessbutton_texture",
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
    text = Locale["ma_npcpossess"]
  })

  FrameLib:BuildButton({
    name = "ma_npcunpossessbutton",
    group = "npc",
    parent = ma_midframe,
    texture = {
      name = "ma_npcunpossessbutton_texture",
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
    text = Locale["ma_npcunpossess"]
  })


  --[[npc copy over]]--

  FrameLib:BuildButton({
    name = "ma_npcfreezebutton",
    group = "npc",
    parent = ma_midframe,
    texture = {
      name = "ma_npcfreezebutton_texture",
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
    text = Locale["ma_NPCFreezeButton"]
  })

  FrameLib:BuildButton({
    name = "ma_npcfreezedelbutton",
    group = "npc",
    parent = ma_midframe,
    texture = {
      name = "ma_npcfreezedelbutton_texture",
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
    --text = "NPCStayDEL"
    text = Locale["ma_WayAllDel"]
  })

  FrameLib:BuildButton({
    name = "ma_way_endaddbutton",
    group = "npc",
    parent = ma_midframe,
    texture = {
      name = "ma_way_endaddbutton_texture",
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
    text = Locale["ma_WayEndAdd"]
  })

  FrameLib:BuildButton({
    name = "ma_npcunfreeze_addwaybutton",
    group = "npc",
    parent = ma_midframe,
    texture = {
      name = "ma_npcunfreeze_addwaybutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 140, --charColOne
      offY = -74 --charRowThree
    },
    text = Locale["ma_WayAdd"]
  })

  FrameLib:BuildButton({
    name = "ma_way_modifyaddbutton",
    group = "npc",
    parent = ma_midframe,
    texture = {
      name = "ma_way_modifyaddbutton_texture",
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
    text = Locale["ma_WayMAdd"]
  })

  FrameLib:BuildButton({
    name = "ma_way_modifydelbutton",
    group = "npc",
    parent = ma_midframe,
    texture = {
      name = "ma_way_modifydelbutton_texture",
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
    text = Locale["ma_WayMDel"]
  })

  FrameLib:BuildButton({
    name = "ma_way_showonbutton",
    group = "npc",
    parent = ma_midframe,
    texture = {
      name = "ma_way_showonbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 222, --charColTwo
      offY = -74  --charRowThree
    },
    text = Locale["ma_WayShow1"]
  })

  FrameLib:BuildButton({
    name = "ma_way_showoffbutton",
    group = "npc",
    parent = ma_midframe,
    texture = {
      name = "ma_way_showoffbutton_texture",
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
    text = Locale["ma_WayShow0"]
  })

  FrameLib:BuildButton({
    name = "ma_npcunfreeze_addway_showonbutton",
    group = "npc",
    parent = ma_midframe,
    texture = {
      name = "ma_npcunfreeze_addway_showonbutton_texture",
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
    text = Locale["ma_WayShow"]
  })

  FrameLib:BuildButton({
    name = "ma_npcunfreeze_waybutton",
    group = "npc",
    parent = ma_midframe,
    texture = {
      name = "ma_npcunfreeze_waybutton_texture",
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
    text = Locale["ma_NPCUnFreeze_WayButton"]
  })

  FrameLib:BuildButton({
    name = "ma_npcunfreeze_randombutton",
    group = "npc",
    parent = ma_midframe,
    texture = {
      name = "ma_npcunfreeze_randombutton_texture",
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
    text = Locale["ma_NPCUnFreeze_RandomButton"]
  })

  FrameLib:BuildFrame({
    type = "EditBox",
    name = "ma_npcunfreeze_random_distancebutton",	-- ma_npccharactertarget
    group = "npc",
    parent = ma_midframe,
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 467, --charColFive
      offY = -139 --charRowSix
    },
    inherits = "InputBoxTemplate"
  })

  FrameLib:BuildButton({
    name = "ma_movestackbutton",
    group = "npc",
    parent = ma_midframe,
    texture = {
      name = "ma_movestackbutton_texture",
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
    text = Locale["ma_MoveStackButton"]
  })

  FrameLib:BuildFontString({
    name = "ma_npcdistanceboxtext",
    group = "npc",
    parent = ma_midframe,
    text = Locale["ma_DistanceBox"],
    setpoint = {
      pos = "TOPLEFT",
      offX = 548, --charColSix
      offY = -144
    }
  })

end
