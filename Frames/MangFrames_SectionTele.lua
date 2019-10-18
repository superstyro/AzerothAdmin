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
-- This script must be listed in the .toc after "MangFrames_SectionMain.lua"
-- Also some variables are globally taken from MangAdmin.lua

function MangAdmin:CreateTeleSection()
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

  FrameLib:BuildFontString({
    name = "ma_teleconttext",
    group = "tele",
    parent = ma_midframe,
    text = "Continent Selection",
    setpoint = {
      pos = "TOPLEFT",
      offX = 5,
      offY = -10
    }
  })

  FrameLib:BuildFrame({
    type = "ScrollFrame",
    name = "ma_ContScrollBar",
    group = "tele",
    parent = ma_midframe,
    texture = {
      color = {0,0,0,0.7}
    },
    size = {
      width = 185,
      height = 225
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 5,
      offY = -25
    },
    inherits = "FauxScrollFrameTemplate"
  })

  FrameLib:BuildButton({
    name = "ma_ContScrollBarEntry1",
    group = "tele",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_ContScrollBar",
      relPos = "TOPLEFT",
      offX = 2,
      offY = -2
    },
    texture = {
      name = "ma_ContScrollBarEntry1_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    text = "Eastern Kingdoms (N)",
    size = {
      width = 181,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ContScrollBarEntry2",
    group = "tele",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_ContScrollBarEntry1",
      relPos = "BOTTOMLEFT",
      offY = -2
    },
    texture = {
      name = "ma_ContScrollBarEntry2_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    text = "Eastern Kingdoms (S)",
    size = {
      width = 181,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ContScrollBarEntry3",
    group = "tele",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_ContScrollBarEntry2",
      relPos = "BOTTOMLEFT",
      offY = -2
    },
    texture = {
      name = "ma_ContScrollBarEntry3_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    text = "Kalimdor",
    size = {
      width = 181,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ContScrollBarEntry4",
    group = "tele",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_ContScrollBarEntry3",
      relPos = "BOTTOMLEFT",
      offY = -2
    },
    texture = {
      name = "ma_ContScrollBarEntry4_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    text = "Outland",
    size = {
      width = 181,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ContScrollBarEntry5",
    group = "tele",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_ContScrollBarEntry4",
      relPos = "BOTTOMLEFT",
      offY = -2
    },
    texture = {
      name = "ma_ContScrollBarEntry5_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    text = "Northrend-Alliance",
    size = {
      width = 181,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ContScrollBarEntry6",
    group = "tele",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_ContScrollBarEntry5",
      relPos = "BOTTOMLEFT",
      offY = -2
    },
    texture = {
      name = "ma_ContScrollBarEntry6_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    text = "Northrend-Horde",
    size = {
      width = 181,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ContScrollBarEntry7",
    group = "tele",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_ContScrollBarEntry6",
      relPos = "BOTTOMLEFT",
      offY = -2
    },
    texture = {
      name = "ma_ContScrollBarEntry7_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    text = "Battlegrounds/Arenas",
    size = {
      width = 181,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ContScrollBarEntry8",
    group = "tele",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_ContScrollBarEntry7",
      relPos = "BOTTOMLEFT",
      offY = -2
    },
    texture = {
      name = "ma_ContScrollBarEntry8_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    text = "Instances: Eastern",
    size = {
      width = 181,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ContScrollBarEntry9",
    group = "tele",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_ContScrollBarEntry8",
      relPos = "BOTTOMLEFT",
      offY = -2
    },
    texture = {
      name = "ma_ContScrollBarEntry9_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    text = "Instances: Kalimdor",
    size = {
      width = 181,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ContScrollBarEntry10",
    group = "tele",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_ContScrollBarEntry9",
      relPos = "BOTTOMLEFT",
      offY = -2
    },
    texture = {
      name = "ma_ContScrollBarEntry10_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    text = "Instances: Outland",
    size = {
      width = 181,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ContScrollBarEntry11",
    group = "tele",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_ContScrollBarEntry10",
      relPos = "BOTTOMLEFT",
      offY = -2
    },
    texture = {
      name = "ma_ContScrollBarEntry11_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    text = "Instances: Northrend",
    size = {
      width = 181,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ContScrollBarEntry12",
    group = "tele",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_ContScrollBarEntry11",
      relPos = "BOTTOMLEFT",
      offY = -2
    },
    texture = {
      name = "ma_ContScrollBarEntry12_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    text = "Other",
    size = {
      width = 181,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildFontString({
    name = "ma_telezonetext",
    group = "tele",
    parent = ma_midframe,
    text = "Zone Selection",
    setpoint = {
      pos = "TOPLEFT",
      offX = 220,
      offY = -10
    }
  })

  FrameLib:BuildFrame({
    type = "ScrollFrame",
    name = "ma_ZoneScrollBar",
    group = "tele",
    parent = ma_midframe,
    texture = {
      color = {0,0,0,0.7}
    },
    size = {
      width = 174,
      height = 225
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 220,
      offY = -25
    },
    inherits = "FauxScrollFrameTemplate"
  })

  FrameLib:BuildButton({
    name = "ma_ZoneScrollBarEntry1",
    group = "tele",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_ZoneScrollBar",
      relPos = "TOPLEFT",
      offX = 2,
      offY = -2
    },
    texture = {
      name = "ma_ZoneScrollBarEntry1_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 170,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ZoneScrollBarEntry2",
    group = "tele",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_ZoneScrollBarEntry1",
      relPos = "BOTTOMLEFT",
      offY = -2
    },
    texture = {
      name = "ma_ZoneScrollBarEntry2_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 170,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ZoneScrollBarEntry3",
    group = "tele",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_ZoneScrollBarEntry2",
      relPos = "BOTTOMLEFT",
      offY = -2
    },
    texture = {
      name = "ma_ZoneScrollBarEntry3_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 170,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ZoneScrollBarEntry4",
    group = "tele",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_ZoneScrollBarEntry3",
      relPos = "BOTTOMLEFT",
      offY = -2
    },
    texture = {
      name = "ma_ZoneScrollBarEntry4_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 170,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ZoneScrollBarEntry5",
    group = "tele",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_ZoneScrollBarEntry4",
      relPos = "BOTTOMLEFT",
      offY = -2
    },
    texture = {
      name = "ma_ZoneScrollBarEntry5_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 170,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ZoneScrollBarEntry6",
    group = "tele",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_ZoneScrollBarEntry5",
      relPos = "BOTTOMLEFT",
      offY = -2
    },
    texture = {
      name = "ma_ZoneScrollBarEntry6_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 170,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ZoneScrollBarEntry7",
    group = "tele",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_ZoneScrollBarEntry6",
      relPos = "BOTTOMLEFT",
      offY = -2
    },
    texture = {
      name = "ma_ZoneScrollBarEntry7_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 170,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ZoneScrollBarEntry8",
    group = "tele",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_ZoneScrollBarEntry7",
      relPos = "BOTTOMLEFT",
      offY = -2
    },
    texture = {
      name = "ma_ZoneScrollBarEntry8_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 170,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ZoneScrollBarEntry9",
    group = "tele",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_ZoneScrollBarEntry8",
      relPos = "BOTTOMLEFT",
      offY = -2
    },
    texture = {
      name = "ma_ZoneScrollBarEntry9_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 170,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ZoneScrollBarEntry10",
    group = "tele",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_ZoneScrollBarEntry9",
      relPos = "BOTTOMLEFT",
      offY = -2
    },
    texture = {
      name = "ma_ZoneScrollBarEntry10_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 170,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ZoneScrollBarEntry11",
    group = "tele",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_ZoneScrollBarEntry10",
      relPos = "BOTTOMLEFT",
      offY = -2
    },
    texture = {
      name = "ma_ZoneScrollBarEntry11_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 170,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_ZoneScrollBarEntry12",
    group = "tele",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_ZoneScrollBarEntry11",
      relPos = "BOTTOMLEFT",
      offY = -2
    },
    texture = {
      name = "ma_ZoneScrollBarEntry12_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 170,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildFontString({
    name = "ma_telesubzonetext",
    group = "tele",
    parent = ma_midframe,
    text = "Selected Subzone",
    setpoint = {
      pos = "TOPLEFT",
      offX = 420,
      offY = -10
    }
  })

  FrameLib:BuildFrame({
    type = "ScrollFrame",
    name = "ma_SubzoneScrollBar",
    group = "tele",
    parent = ma_midframe,
    texture = {
      color = {0,0,0,0.7}
    },
    size = {
      width = 224,
      height = 225
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 420,
      offY = -25
    },
    inherits = "FauxScrollFrameTemplate"
  })

  FrameLib:BuildButton({
    name = "ma_SubzoneScrollBarEntry1",
    group = "tele",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_SubzoneScrollBar",
      relPos = "TOPLEFT",
      offX = 2,
      offY = -2
    },
    texture = {
      name = "ma_SubzoneScrollBarEntry1_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 220,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_SubzoneScrollBarEntry2",
    group = "tele",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_SubzoneScrollBarEntry1",
      relPos = "BOTTOMLEFT",
      offY = -2
    },
    texture = {
      name = "ma_SubzoneScrollBarEntry2_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 220,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_SubzoneScrollBarEntry3",
    group = "tele",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_SubzoneScrollBarEntry2",
      relPos = "BOTTOMLEFT",
      offY = -2
    },
    texture = {
      name = "ma_SubzoneScrollBarEntry3_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 220,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_SubzoneScrollBarEntry4",
    group = "tele",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_SubzoneScrollBarEntry3",
      relPos = "BOTTOMLEFT",
      offY = -2
    },
    texture = {
      name = "ma_SubzoneScrollBarEntry4_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 220,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_SubzoneScrollBarEntry5",
    group = "tele",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_SubzoneScrollBarEntry4",
      relPos = "BOTTOMLEFT",
      offY = -2
    },
    texture = {
      name = "ma_SubzoneScrollBarEntry5_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 220,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_SubzoneScrollBarEntry6",
    group = "tele",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_SubzoneScrollBarEntry5",
      relPos = "BOTTOMLEFT",
      offY = -2
    },
    texture = {
      name = "ma_SubzoneScrollBarEntry6_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 220,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_SubzoneScrollBarEntry7",
    group = "tele",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_SubzoneScrollBarEntry6",
      relPos = "BOTTOMLEFT",
      offY = -2
    },
    texture = {
      name = "ma_SubzoneScrollBarEntry7_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 220,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_SubzoneScrollBarEntry8",
    group = "tele",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_SubzoneScrollBarEntry7",
      relPos = "BOTTOMLEFT",
      offY = -2
    },
    texture = {
      name = "ma_SubzoneScrollBarEntry8_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 220,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_SubzoneScrollBarEntry9",
    group = "tele",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_SubzoneScrollBarEntry8",
      relPos = "BOTTOMLEFT",
      offY = -2
    },
    texture = {
      name = "ma_SubzoneScrollBarEntry9_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 220,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_SubzoneScrollBarEntry10",
    group = "tele",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_SubzoneScrollBarEntry9",
      relPos = "BOTTOMLEFT",
      offY = -2
    },
    texture = {
      name = "ma_SubzoneScrollBarEntry10_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 220,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_SubzoneScrollBarEntry11",
    group = "tele",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_SubzoneScrollBarEntry10",
      relPos = "BOTTOMLEFT",
      offY = -2
    },
    texture = {
      name = "ma_SubzoneScrollBarEntry11_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 220,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_SubzoneScrollBarEntry12",
    group = "tele",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_SubzoneScrollBarEntry11",
      relPos = "BOTTOMLEFT",
      offY = -2
    },
    texture = {
      name = "ma_SubzoneScrollBarEntry12_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 220,
      height = 16
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

end
