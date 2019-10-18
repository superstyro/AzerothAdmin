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
-- This script must be listed in the .toc after "MangFrames_Tabs.lua"
-- Also some variables are globally taken from MangAdmin.lua

function MangAdmin:CreateLookupButtons()
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

  --[[Lookup Buttons]]
  FrameLib:BuildButton({
    name = "ma_itembutton",
    group = "bg",
    parent = ma_leftframe,
    texture = {
      name = "ma_itembutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 100,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 10,
      offY = -10
    },
    text = Locale["ma_ItemButton"]
  })

  FrameLib:BuildButton({
    name = "ma_itemsetbutton",
    group = "bg",
    parent = ma_leftframe,
    texture = {
      name = "ma_itemsetbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 100,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 114,
      offY = -10
    },
    text = Locale["ma_ItemSetButton"]
  })

  FrameLib:BuildButton({
    name = "ma_spellbutton",
    group = "bg",
    parent = ma_leftframe,
    texture = {
      name = "ma_spellbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 100,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 218,
      offY = -10
    },
    text = Locale["ma_SpellButton"]
  })

  FrameLib:BuildButton({
    name = "ma_skillbutton",
    group = "bg",
    parent = ma_leftframe,
    texture = {
      name = "ma_skillbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 100,
      height = 20
    },
    setpoint = {
      pos = "BOTTOMLEFT",
      offX = 10,
      offY = 40
    },
    text = Locale["ma_SkillButton"]
  })

  FrameLib:BuildButton({
    name = "ma_questbutton",
    group = "bg",
    parent = ma_leftframe,
    texture = {
      name = "ma_questbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 100,
      height = 20
    },
    setpoint = {
      pos = "BOTTOMLEFT",
      offX = 114,
      offY = 40
    },
    text = Locale["ma_QuestButton"]
  })

  FrameLib:BuildButton({
    name = "ma_objectbutton",
    group = "bg",
    parent = ma_leftframe,
    texture = {
      name = "ma_objectbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 100,
      height = 20
    },
    setpoint = {
      pos = "BOTTOMLEFT",
      offX = 218,
      offY = 40
    },
    text = Locale["ma_ObjectButton"]
  })

  FrameLib:BuildButton({
    name = "ma_creaturebutton",
    group = "bg",
    parent = ma_leftframe,
    texture = {
      name = "ma_creaturebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 100,
      height = 20
    },
    setpoint = {
      pos = "BOTTOMLEFT",
      offX = 10,
      offY = 10
    },
    text = Locale["ma_CreatureButton"]
  })

  FrameLib:BuildButton({
    name = "ma_telesearchbutton",
    group = "bg",
    parent = ma_leftframe,
    texture = {
      name = "ma_telesearchbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 100,
      height = 20
    },
    setpoint = {
      pos = "BOTTOMLEFT",
      offX = 114,
      offY = 10
    },
    text = Locale["ma_TeleSearchButton"]
  })

  FrameLib:BuildButton({
    name = "ma_sendmailbutton",
    group = "bg",
    parent = ma_leftframe,
    texture = {
      name = "ma_sendmailbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 100,
      height = 20
    },
    setpoint = {
      pos = "BOTTOMLEFT",
      offX = 218,
      offY = 10
    },
    text = Locale["ma_Mail"]
  })

  FrameLib:BuildButton({
    name = "ma_closebutton",
    group = "bg",
    parent = ma_rightframe,
    texture = {
      name = "ma_languagebutton_texture",
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
    text = "X"
  })
end
