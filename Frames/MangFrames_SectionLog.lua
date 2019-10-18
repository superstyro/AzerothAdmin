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

function MangAdmin:CreateLogSection()
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

  FrameLib:BuildFrame({
    type = "ScrollingMessageFrame",
    name = "ma_logframe",
    group = "log",
    parent = ma_midframe,
    texture = {
      color = {10,10,10,0.7},
      gradient = {
        orientation = "horizontal",
        min = {10,10,10,0.7},
        max = {10,10,10,0}
      }
    },
    size = {
      width = 400,
      height = 234
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 10,
      offY = -10
    },
    justify = {
      h = "LEFT",
      v = "TOP"
    },
    fading = false,
    scrollMouseWheel = true
  })

  FrameLib:BuildButton({
    name = "ma_logscrollupbutton",
    group = "log",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPRIGHT",
      offX = -10,
      offY = -10
    },
    inherits = "UIPanelScrollUpButtonTemplate",
    --script = function() ma_logframe:ScrollUp() end
  })

  FrameLib:BuildButton({
    name = "ma_logscrolldownbutton",
    group = "log",
    parent = ma_midframe,
    setpoint = {
      pos = "BOTTOMRIGHT",
      offX = -10,
      offY = 10
    },
    inherits = "UIPanelScrollDownButtonTemplate",
    --script = function() ma_logframe:ScrollDown() end
  })
end
