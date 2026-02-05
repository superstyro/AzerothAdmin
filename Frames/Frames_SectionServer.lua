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
-- This script must be listed in the .toc after "Frames_SectionMisc.lua"
-- Also some variables are globally taken from AzerothAdmin.lua

function AzerothAdmin:CreateServerSection()
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

  FrameLib:BuildFrame({
    name = "ma_netgraphframe",
    group = "server",
    parent = ma_midframe,
    texture = {
      color = {0,0,0,0.7}
    },
    size = {
      width = 152,
      height = 152
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 10,
      offY = -10
    },
    inherits = nil
  })

  FrameLib:BuildFontString({
    name = "ma_lagmetertext",
    group = "server",
    parent = ma_midframe,
    text = Locale["ma_ServerLatencyLabel"],
    setpoint = {
      pos = "TOPLEFT",
      offX = 8,
      offY = -169
    }
  })

  local LagGraph=Graph:CreateGraphRealtime("ma_netgraph_lag",ma_netgraphframe,"CENTER","CENTER",0,0,150,150)
  local g=LagGraph
  g:SetAutoScale(false)
  g:SetGridSpacing(1.0,10.0)
  g:SetYMax(120)
  g:SetXAxis(-10,0)
  g:SetMode("RAW")
  g:SetBarColors({0.0,1.0,0.0,1.0},{0.0,1.0,0.0,1.0}) -- GREEN
  --g:SetBarColors({0.2,0.0,0.0,0.4},{1.0,0.0,0.0,1.0}) -- RED
  local f = CreateFrame("Frame", "ma_lagmeter_frame", ma_netgraphframe)
  FrameLib:AddGroupFrame("server", f)
  f.frames=0
  f.NextUpdate=GetTime()
  f:SetScript("OnUpdate",function()
      if f.NextUpdate>GetTime() then
        return
      end
      -- Don't update graph if a dropdown menu is currently open
      -- Check both UIDROPDOWNMENU_OPEN_MENU and if any dropdown list frames are visible
      local dropdownOpen = UIDROPDOWNMENU_OPEN_MENU or (DropDownList1 and DropDownList1:IsShown())
      if not dropdownOpen then
          local down, up, lag = GetNetStats();
          g:AddBar(lag)
          ma_lagmetertext:SetText(Locale["ma_ServerLatencyLabel"].." "..lag.."ms")
      end
      f.NextUpdate=f.NextUpdate + 1
    end)
  f:Show()

  FrameLib:BuildFrame({
    type = "EditBox",
    name = "ma_announceeditbox",
    group = "server",
    parent = ma_midframe,
    size = {
      width = 460,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 15,
      offY = -226
    },
    inherits = "InputBoxTemplate"
  })

  FrameLib:BuildButton({
    name = "ma_announcebutton",
    group = "server",
    parent = ma_midframe,
    texture = {
      name = "ma_announcebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 100,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 480,
      offY = -226
    },
    text = Locale["ma_AnnounceButton"]
  })

  FrameLib:BuildButton({
    name = "ma_resetannouncebutton",
    group = "server",
    parent = ma_midframe,
    texture = {
      name = "ma_resetannouncebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 585,
      offY = -226
    },
    text = Locale["ma_ResetButton"]
  })

  FrameLib:BuildFrame({
    name = "ma_reloadtabledropdown",
    group = "server",
    parent = ma_midframe,
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPRIGHT",
      offX = -135,
      offY = -7
    },
    inherits = "UIDropDownMenuTemplate"
  })

  FrameLib:BuildButton({
    name = "ma_loadtablebutton",
    group = "server",
    parent = ma_midframe,
    texture = {
      name = "ma_loadtablebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 100,
      height = 20
    },
    setpoint = {
      pos = "TOPRIGHT",
      offX = -10,
      offY = -10
    },
    text = Locale["ma_ReloadTableButton"]
  })

  FrameLib:BuildButton({
    name = "ma_loadscriptsbutton",
    group = "server",
    parent = ma_midframe,
    texture = {
      name = "ma_loadscriptsbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 100,
      height = 20
    },
    setpoint = {
      pos = "TOPRIGHT",
      offX = -10,
      offY = -38
    },
    text = Locale["ma_ReloadScriptsButton"]
  })

  FrameLib:BuildFrame({
    type = "EditBox",
    name = "ma_shutdowneditbox",
    group = "server",
    parent = ma_midframe,
    size = {
      width = 30,
      height = 20
    },
    setpoint = {
      pos = "TOPRIGHT",
      offX = -115,
      offY = -65
    },
    inherits = "InputBoxTemplate"
  })

  FrameLib:BuildButton({
    name = "ma_shutdownbutton",
    group = "server",
    parent = ma_midframe,
    texture = {
      name = "ma_shutdownbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 100,
      height = 20
    },
    setpoint = {
      pos = "TOPRIGHT",
      offX = -10,
      offY = -65
    },
    text = Locale["ma_ShutdownButton"]
  })

  FrameLib:BuildButton({
    name = "ma_cancelshutdownbutton",
    group = "server_special",
    parent = ma_midframe,
    texture = {
      name = "ma_cancelshutdownbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 100,
      height = 20
    },
    setpoint = {
      pos = "TOPRIGHT",
      offX = -10,
      offY = -65
    },
    text = Locale["ma_CancelShutdownButton"]
  })
  ma_cancelshutdownbutton:Hide()

  FrameLib:BuildFrame({
    name = "ma_netgraphframe2",
    group = "server",
    parent = ma_midframe,
    texture = {
      color = {0,0,0,0.7}
    },
    size = {
      width = 152,
      height = 152
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 170,
      offY = -10
    },
    inherits = nil
  })

  FrameLib:BuildFontString({
    name = "ma_lagmetertext2",
    group = "server",
    parent = ma_midframe,
    text = Locale["ma_UpdateDiffLabel"],
    setpoint = {
      pos = "TOPLEFT",
      offX = 167,
      offY = -170
    }
  })

  FrameLib:BuildFontString({
    name = "ma_difftext",
    group = "server",
    parent = ma_midframe,
    text = "",
    setpoint = {
      pos = "LEFT",
      relTo = ma_lagmetertext2,
      relPos = "RIGHT",
      offX = 0,
      offY = 0
    }
  })

  FrameLib:BuildFontString({
    name = "ma_delayparamlabel2",
    group = "server",
    parent = ma_midframe,
    text = Locale["ma_UpdateFrequencyLabel"],
    setpoint = {
      pos = "BOTTOMLEFT",
      offX = 10,
      offY = 50
    }
  })

  FrameLib:BuildFrame({
    type = "EditBox",
    name = "ma_delayparam",
    group = "server",
    parent = ma_midframe,
    size = {
      width = 60,
      height = 20
    },
    setpoint = {
      pos = "BOTTOMLEFT",
      offX = 195,
      offY = 45
    },
    inherits = "InputBoxTemplate"
  })

  ma_delayparam:SetScript("OnEnter", function(self) GameTooltip:SetOwner(self, "ANCHOR_RIGHT"); GameTooltip:SetText(Locale["tt_UpdateFrequency"]); GameTooltip:Show() end)
  ma_delayparam:SetScript("OnLeave", function(self) GameTooltip:Hide() end)

  FrameLib:BuildButton({
    name = "ma_updatedelaybutton",
    group = "server",
    parent = ma_midframe,
    texture = {
      name = "ma_updatedelaybutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 60,
      height = 20
    },
    setpoint = {
      pos = "BOTTOMLEFT",
      offX = 260,
      offY = 45
    },
    text = Locale["ma_UpdateButton"]
  })

  FrameLib:BuildFontString({
    name = "ma_meantext",
    group = "server",
    parent = ma_midframe,
    text = Locale["ma_MeanLabel"],
    setpoint = {
      pos = "TOPLEFT",
      offX = 328,
      offY = -110
    }
  })

  FrameLib:BuildFontString({
    name = "ma_meantextoutput",
    group = "server",
    parent = ma_midframe,
    text = "",
    setpoint = {
      pos = "LEFT",
      relTo = ma_meantext,
      relPos = "RIGHT",
      offX = 0,
      offY = 0
    }
  })

  FrameLib:BuildFontString({
    name = "ma_mediantext",
    group = "server",
    parent = ma_midframe,
    text = Locale["ma_MedianLabel"],
    setpoint = {
      pos = "TOPLEFT",
      offX = 328,
      offY = -130
    }
  })

  FrameLib:BuildFontString({
    name = "ma_mediantextoutput",
    group = "server",
    parent = ma_midframe,
    text = "",
    setpoint = {
      pos = "LEFT",
      relTo = ma_mediantext,
      relPos = "RIGHT",
      offX = 0,
      offY = 0
    }
  })

  FrameLib:BuildFontString({
    name = "ma_percentilestext",
    group = "server",
    parent = ma_midframe,
    text = Locale["ma_PercentilesLabel"],
    setpoint = {
      pos = "TOPLEFT",
      offX = 328,
      offY = -150
    }
  })

  FrameLib:BuildFontString({
    name = "ma_percentilestextoutput",
    group = "server",
    parent = ma_midframe,
    text = "",
    setpoint = {
      pos = "LEFT",
      relTo = ma_percentilestext,
      relPos = "RIGHT",
      offX = 0,
      offY = 0
    }
  })

  local DiffGraph=Graph:CreateGraphRealtime("ma_netgraph_diff",ma_netgraphframe2,"CENTER","CENTER",0,0,150,150)
  local z=DiffGraph
  z:SetAutoScale(false)
  z:SetGridSpacing(1.0,10.0)
  z:SetYMax(300)
  z:SetXAxis(-10,0)
  z:SetMode("RAW")
  z:SetBarColors({0.2,0.0,0.0,0.4},{0.0,0.0,1.0,1.0})
  local x = CreateFrame("Frame", "ma_diff_frame", ma_netgraphframe2)
  FrameLib:AddGroupFrame("server", x)
  x.frames = 0
  x.NextUpdate=GetTime()
  local q = 0
  x:SetScript("OnUpdate",function()
      q = q + 1
      -- Check if ma_delayparam exists before using it
      local delayParam = ma_delayparam and tonumber(ma_delayparam:GetText())
      if delayParam and q > delayParam then --10000=approx 1 minute, 50000=approx 5 minutes FIX #13
          -- Don't update server info or graph if a dropdown menu is currently open
          -- Check both UIDROPDOWNMENU_OPEN_MENU and if any dropdown list frames are visible
          local dropdownOpen = UIDROPDOWNMENU_OPEN_MENU or (DropDownList1 and DropDownList1:IsShown())
          if not dropdownOpen then
              AzerothAdmin:ChatMsg(".server info")
              local diffValue = ma_difftext:GetText():gsub("ms", "")
              local s = tonumber(diffValue)
              if s then
                  local r = 100 -- Trinity says anything over 150 is bad
                  if s > r then
                      z:SetBarColors({1.0,0.0,0.0,1.0},{1.0,0.0,0.0,1.0}) -->100, turn red
                  else
                      z:SetBarColors({0.0,1.0,0.0,1.0},{0.0,1.0,0.0,1.0}) --otherwise green
                  end
                  z:AddBar(s)
              end
          end
          q = 0
      end
      if x.NextUpdate>GetTime() then
        return
      end
      x.NextUpdate=x.NextUpdate + 1
    end)
  x:Show()
end
