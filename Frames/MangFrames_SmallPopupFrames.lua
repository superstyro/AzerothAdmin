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
-- This script must be listed in the .toc after "MangFrames_LookupButtons.lua"
-- Also some variables are globally taken from MangAdmin.lua

function MangAdmin:CreateSmallPopupFrames()
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

  -- [[popup2 Frame]]
  FrameLib:BuildFrame({
    name = "ma_popup2frame",
    group = "popup2",
    parent = UIParent,
    texture = {
      color = {color.bg.r, color.bg.g, color.bg.b, transparency.bg}
    },
    draggable = true,
    size = {
      width = 160,
      height = 260
    },
    setpoint = {
      pos = "CENTER"
    },
    frameStrata = "HIGH",
    inherits = nil
  })

  FrameLib:BuildFrame({
    name = "ma_popup2cframe",
    group = "popup2",
    parent = ma_popup2frame,
    texture = {
      color = {color.frm.r, color.frm.g, color.frm.b, transparency.frm}
    },
    size = {
      width = 156,
      height = 256
    },
    setpoint = {
      pos = "TOPLEFT",
      offY = -2,
      offX = 2
    },
    inherits = nil
  })

  FrameLib:BuildButton({  --Close Window button
    name = "ma_popup2closebutton",
    group = "popup2",
    parent = ma_popup2cframe,
    texture = {
      name = "ma_popup2closebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 10,
      height = 10
    },
    setpoint = {
      pos = "TOPRIGHT",
      offX = -10,
      offY = -10
    },
    text = Locale["ma_CloseWindow"] --"X"
  })

  FrameLib:BuildFontString({
    name = "ma_tpinfo_text",
    group = "popup2",
    parent = ma_popup2cframe,
    text = "You should not see this text!",
    setpoint = {
      pos = "TOPLEFT",
      offX = 10,
      offY = -20
    }
  })
  -- popup2 Search ScrollFrame
  --[[FrameLib:BuildFrame({
    type = "ScrollFrame",
    name = "ma_popup2ScrollBar",
    group = "popup2",
    parent = ma_popup2midframe,
    texture = {
      color = {0,0,0,0.7}
    },
    size = {
      width = 400,
      height = 274
    },
    setpoint = {
      pos = "TOP",
      offX = -10,
      offY = -10
    },
    inherits = "FauxScrollFrameTemplate"
  })

  FrameLib:BuildButton({
    name = "ma_popup2ScrollBarEntry1",
    group = "popup2",
    parent = ma_popup2midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_popup2ScrollBar",
      relPos = "TOPLEFT",
      offX = 10,
      offY = -8
    },
    texture = {
      name = "ma_popup2ScrollBarEntry1_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 380,
      height = 30
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_popup2ScrollBarEntry2",
    group = "popup2",
    parent = ma_popup2midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_popup2ScrollBarEntry1",
      relPos = "BOTTOMLEFT",
      offY = -8
    },
    texture = {
      name = "ma_popup2ScrollBarEntry2_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 380,
      height = 30
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_popup2ScrollBarEntry3",
    group = "popup2",
    parent = ma_popup2midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_popup2ScrollBarEntry2",
      relPos = "BOTTOMLEFT",
      offY = -8
    },
    texture = {
      name = "ma_popup2ScrollBarEntry3_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 380,
      height = 30
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_popup2ScrollBarEntry4",
    group = "popup2",
    parent = ma_popup2midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_popup2ScrollBarEntry3",
      relPos = "BOTTOMLEFT",
      offY = -8
    },
    texture = {
      name = "ma_popup2ScrollBarEntry4_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 380,
      height = 30
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_popup2ScrollBarEntry5",
    group = "popup2",
    parent = ma_popup2midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_popup2ScrollBarEntry4",
      relPos = "BOTTOMLEFT",
      offY = -8
    },
    texture = {
      name = "ma_popup2ScrollBarEntry5_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 380,
      height = 30
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_popup2ScrollBarEntry6",
    group = "popup2",
    parent = ma_popup2midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_popup2ScrollBarEntry5",
      relPos = "BOTTOMLEFT",
      offY = -8
    },
    texture = {
      name = "ma_popup2ScrollBarEntry6_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 380,
      height = 30
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })

  FrameLib:BuildButton({
    name = "ma_popup2ScrollBarEntry7",
    group = "popup2",
    parent = ma_popup2midframe,
    setpoint = {
      pos = "TOPLEFT",
      relTo = "ma_popup2ScrollBarEntry6",
      relPos = "BOTTOMLEFT",
      offY = -8
    },
    texture = {
      name = "ma_popup2ScrollBarEntry7_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 380,
      height = 30
    },
    script = {{"OnShow", function() this:RegisterForClicks("LeftButtonDown", "RightButtonDown") end}}
  })]]
end
