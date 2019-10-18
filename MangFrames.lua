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
-- This script must be listed in the .toc after all other Frames/MangFrames files!!!
-- Also some variables are globally taken from MangAdmin.lua

function MangAdmin:CreateFrames()
  -- These need to be called in TOC order
  self:CreateStartFrames()
  self:CreateTabs()
  self:CreateMiniMenu()
  self:CreateLookupButtons()
  self:CreatePopupFrames()
  self:CreateSmallPopupFrames()
  self:CreateMainSection()
  self:CreateTeleSection()
  self:CreateLogSection()
  self:CreateCharSection()
  self:CreateTicketSection()
  self:CreateMiscSection()
  self:CreateServerSection()
  self:CreateNpcSection()
  self:CreateGOSection()
  self:CreateWhoSection()


  --FrameLib:HandleGroup("bg", function(frame) frame:Hide() end)
  --FrameLib:HandleGroup("main", function(frame) frame:Hide() end)
  FrameLib:HandleGroup("char", function(frame) frame:Hide() end)
  FrameLib:HandleGroup("ticket", function(frame) frame:Hide() end)
  FrameLib:HandleGroup("server", function(frame) frame:Hide() end)
  FrameLib:HandleGroup("npc", function(frame) frame:Hide() end)
  FrameLib:HandleGroup("go", function(frame) frame:Hide() end)
  FrameLib:HandleGroup("tele", function(frame) frame:Hide() end)
  FrameLib:HandleGroup("log", function(frame) frame:Hide() end)
  FrameLib:HandleGroup("misc", function(frame) frame:Hide() end)
  FrameLib:HandleGroup("popup", function(frame) frame:Hide() end)
  FrameLib:HandleGroup("popup2", function(frame) frame:Hide() end)
  FrameLib:HandleGroup("who", function(frame) frame:Hide() end)
  ma_mm_revivebutton:Hide()
end
