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
-- This script must be listed in the .toc after "MangFrames_Start.lua"
-- Also some variables are globally taken from MangAdmin.lua

function MangAdmin:CreateTabs()
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

  -- [[ Tab Buttons ]]
  FrameLib:BuildButton({
    name = "ma_tabbutton_main",
    group = "tabbuttons",
    parent = ma_topframe,
    texture = {
      name = "ma_tabbutton_main_texture",
      color = {color.bg.r, color.bg.g, color.bg.b, transparency.bg},
      gradient = {
        orientation = "vertical",
        min = {102,102,102,1},
        max = {color.bg.r, color.bg.g, color.bg.b, transparency.bg}
      }
    },
    size = {
      width = 35,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_menubgframe",
      relPos = "TOPLEFT",
      offX = 0,
      offY = -4
    },
    text = Locale["tabmenu_Main"]
  })

  FrameLib:BuildButton({
    name = "ma_tabbutton_char",
    group = "tabbuttons",
    parent = ma_topframe,
    texture = {
      name = "ma_tabbutton_char_texture",
      color = {color.bg.r, color.bg.g, color.bg.b, transparency.bg},
      gradient = {
        orientation = "vertical",
        min = {102,102,102,0},
        max = {color.bg.r, color.bg.g, color.bg.b, transparency.bg}
      }
    },
    size = {
      width = 30,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_tabbutton_main",
      relPos = "TOPRIGHT",
      offX = 2
    },
    text = Locale["tabmenu_Char"]
  })

  FrameLib:BuildButton({
    name = "ma_tabbutton_npc",
    group = "tabbuttons",
    parent = ma_topframe,
    texture = {
      name = "ma_tabbutton_npc_texture",
      color = {color.bg.r, color.bg.g, color.bg.b, transparency.bg},
      gradient = {
        orientation = "vertical",
        min = {102,102,102,0},
        max = {color.bg.r, color.bg.g, color.bg.b, transparency.bg}
      }
    },
    size = {
      width = 30,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_tabbutton_char",
      relPos = "TOPRIGHT",
      offX = 2
    },
    text = Locale["tabmenu_NPC"]
  })

  FrameLib:BuildButton({
    name = "ma_tabbutton_go",
    group = "tabbuttons",
    parent = ma_topframe,
    texture = {
      name = "ma_tabbutton_go_texture",
      color = {color.bg.r, color.bg.g, color.bg.b, transparency.bg},
      gradient = {
        orientation = "vertical",
        min = {102,102,102,0},
        max = {color.bg.r, color.bg.g, color.bg.b, transparency.bg}
      }
    },
    size = {
      width = 30,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_tabbutton_npc",
      relPos = "TOPRIGHT",
      offX = 2
    },
    text = Locale["tabmenu_GO"]
  })


  FrameLib:BuildButton({
    name = "ma_tabbutton_tele",
    group = "tabbuttons",
    parent = ma_topframe,
    texture = {
      name = "ma_tabbutton_tele_texture",
      color = {color.bg.r, color.bg.g, color.bg.b, transparency.bg},
      gradient = {
        orientation = "vertical",
        min = {102,102,102,0},
        max = {color.bg.r, color.bg.g, color.bg.b, transparency.bg}
      }
    },
    size = {
      width = 35,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_tabbutton_go",
      relPos = "TOPRIGHT",
      offX = 2
    },
    text = Locale["tabmenu_Tele"]
  })

  FrameLib:BuildButton({
    name = "ma_tabbutton_ticket",
    group = "tabbuttons",
    parent = ma_topframe,
    texture = {
      name = "ma_tabbutton_ticket_texture",
      color = {color.bg.r, color.bg.g, color.bg.b, transparency.bg},
      gradient = {
        orientation = "vertical",
        min = {102,102,102,0},
        max = {color.bg.r, color.bg.g, color.bg.b, transparency.bg}
      }
    },
    size = {
      width = 40,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_tabbutton_tele",
      relPos = "TOPRIGHT",
      offX = 2
    },
    text = Locale["tabmenu_ticket"]
  })

  FrameLib:BuildButton({
    name = "ma_tabbutton_misc",
    group = "tabbuttons",
    parent = ma_topframe,
    texture = {
      name = "ma_tabbutton_misc_texture",
      color = {color.bg.r, color.bg.g, color.bg.b, transparency.bg},
      gradient = {
        orientation = "vertical",
        min = {102,102,102,0},
        max = {color.bg.r, color.bg.g, color.bg.b, transparency.bg}
      }
    },
    size = {
      width = 30,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_tabbutton_ticket",
      relPos = "TOPRIGHT",
      offX = 2
    },
    text = Locale["tabmenu_Misc"]
  })

  FrameLib:BuildButton({
    name = "ma_tabbutton_server",
    group = "tabbuttons",
    parent = ma_topframe,
    texture = {

      name = "ma_tabbutton_server_texture",
      color = {color.bg.r, color.bg.g, color.bg.b, transparency.bg},
      gradient = {
        orientation = "vertical",
        min = {102,102,102,0},
        max = {color.bg.r, color.bg.g, color.bg.b, transparency.bg}
      }
    },
    size = {
      width = 40,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_tabbutton_misc",
      relPos = "TOPRIGHT",
      offX = 2
    },
    text = Locale["tabmenu_server"]
  })

  FrameLib:BuildButton({
    name = "ma_tabbutton_log",
    group = "tabbuttons",
    parent = ma_topframe,
    texture = {
      name = "ma_tabbutton_log_texture",
      color = {color.bg.r, color.bg.g, color.bg.b, transparency.bg},
      gradient = {
        orientation = "vertical",
        min = {102,102,102,0},
        max = {color.bg.r, color.bg.g, color.bg.b, transparency.bg}
      }
    },
    size = {
      width = 30,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_tabbutton_server",
      relPos = "TOPRIGHT",
      offX = 2
    },
    text = Locale["tabmenu_log"]
  })

  FrameLib:BuildButton({
    name = "ma_tabbutton_who",
    group = "tabbuttons",
    parent = ma_topframe,
    texture = {
      name = "ma_tabbutton_who_texture",
      color = {color.bg.r, color.bg.g, color.bg.b, transparency.bg},
      gradient = {
        orientation = "vertical",
        min = {102,102,102,0},
        max = {color.bg.r, color.bg.g, color.bg.b, transparency.bg}
      }
    },
    size = {
      width = 35,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_tabbutton_log",
      relPos = "TOPRIGHT",
      offX = 2
    },
    text = Locale["tabmenu_who"]
  })

--  FrameLib:BuildButton({
--    name = "ma_tabbutton_changelog",
--    group = "tabbuttons",
--    parent = ma_topframe,
--    texture = {
--      name = "ma_tabbutton_who_texture",
--      color = {color.bg.r, color.bg.g, color.bg.b, transparency.bg},
--      gradient = {
--        orientation = "vertical",
--        min = {102,102,102,0},
--        max = {color.bg.r, color.bg.g, color.bg.b, transparency.bg}
--      }
--    },
--    size = {
--      width = 55,
--      height = 20
--    },
--    setpoint = {
--      pos = "TOPLEFT",
--      relTo = "ma_tabbutton_who",
--      relPos = "TOPRIGHT",
--      offX = 2
--    },
--    text = Locale["tabmenu_changelog"]
--  })
end
