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
-- This script must be listed in the .toc after "Frames_SectionMisc.lua"
-- Also some variables are globally taken from AzerothAdmin.lua

function AzerothAdmin:CreateServerSection()
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
      offX = 10,
      offY = -170
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
          ma_lagmetertext:SetText("^Server Latency: "..lag.." ms")
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
      offX = 170,
      offY = -170
    }
  })

  FrameLib:BuildFontString({
    name = "ma_difftext",
    group = "server",
    parent = ma_midframe,
    text = "",
    setpoint = {
      pos = "TOPLEFT",
      offX = 236, --Original 250
      offY = -170 --Original -170
    }
  })

  FrameLib:BuildFontString({
    name = "ma_meantext",
    group = "server",
    parent = ma_midframe,
    text = Locale["ma_MeanLabel"],
    setpoint = {
      pos = "TOPLEFT",
      offX = 270,
      offY = -170
    }
  })

  FrameLib:BuildFontString({
    name = "ma_meantextoutput",
    group = "server",
    parent = ma_midframe,
    text = "",
    setpoint = {
      pos = "TOPLEFT",
      offX = 305,
      offY = -170
    }
  })

  FrameLib:BuildFontString({
    name = "ma_mediantext",
    group = "server",
    parent = ma_midframe,
    text = Locale["ma_MedianLabel"],
    setpoint = {
      pos = "TOPLEFT",
      offX = 260,
      offY = -185
    }
  })

  FrameLib:BuildFontString({
    name = "ma_mediantextoutput",
    group = "server",
    parent = ma_midframe,
    text = "",
    setpoint = {
      pos = "TOPLEFT",
      offX = 305,
      offY = -185
    }
  })

  FrameLib:BuildFontString({
    name = "ma_percentilestext",
    group = "server",
    parent = ma_midframe,
    text = Locale["ma_PercentilesLabel"],
    setpoint = {
      pos = "TOPLEFT",
      offX = 240,
      offY = -200
    }
  })

  FrameLib:BuildFontString({
    name = "ma_percentilestextoutput",
    group = "server",
    parent = ma_midframe,
    text = "",
    setpoint = {
      pos = "TOPLEFT",
      offX = 305,
      offY = -200
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
              --TODO: Change the way the value of 'ma_difftext' is set to be able to add 'ms' to the end of the value
              local s = tonumber(ma_difftext:GetText())
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
