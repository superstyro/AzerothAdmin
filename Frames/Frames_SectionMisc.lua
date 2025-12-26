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
-- This script must be listed in the .toc after "Frames_SectionTicket.lua"
-- Also some variables are globally taken from AzerothAdmin.lua

function AzerothAdmin:CreateMiscSection()
  local transparency = {
    bg = AzerothAdmin.db.account.style.transparency.backgrounds,
    btn = AzerothAdmin.db.account.style.transparency.buttons,
    frm = AzerothAdmin.db.account.style.transparency.frames
  }
  local color = {
    bg = AzerothAdmin.db.account.style.color.backgrounds,
    btn = AzerothAdmin.db.account.style.color.buttons,
    frm = AzerothAdmin.db.account.style.color.frames,
    linkifier = AzerothAdmin.db.account.style.color.linkifier
  }

  FrameLib:BuildButton({
    type = "CheckButton",
    name = "ma_checktransparencybutton",
    group = "misc",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      offX = 6,
      offY = -4
    },
    text = Locale["ma_EnableTransparency"],
    inherits = "OptionsCheckButtonTemplate"
  })

  FrameLib:BuildButton({
    type = "CheckButton",
    name = "ma_checklocalsearchstringsbutton",
    group = "misc",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      offX = 160,
      offY = -4
    },
    text = Locale["ma_EnableLocalizedSearch"],
    inherits = "OptionsCheckButtonTemplate"
  })

  FrameLib:BuildButton({
    type = "CheckButton",
    name = "ma_showminimenubutton",
    group = "misc",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      offX = 160,
      offY = -34
    },
    text = Locale["ma_EnableMinimenu"],
    inherits = "OptionsCheckButtonTemplate"
  })

  FrameLib:BuildButton({
    type = "CheckButton",
    name = "ma_showtooltipsbutton",
    group = "misc",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      offX = 160,
      offY = -64
    },
    text = Locale["ma_EnableTooltips"],
    inherits = "OptionsCheckButtonTemplate"
  })

  FrameLib:BuildButton({
    type = "CheckButton",
    name = "ma_showchatoutputbutton",
    group = "misc",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      offX = 160,
      offY = -94
    },
    text = Locale["ma_ShowChatOutput"],
    inherits = "OptionsCheckButtonTemplate"
  })

  FrameLib:BuildFontString({
    name = "ma_framestratalabel",
    group = "misc",
    parent = ma_midframe,
    text = Locale["ma_FrameStrataLabel"],
    setpoint = {
      pos = "TOPLEFT",
      offX = 165,
      offY = -125
    }
  })

  FrameLib:BuildFrame({
    name = "ma_framestratadropdown",
    group = "misc",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      offX = 327,
      offY = -140
    },
    inherits = "UIDropDownMenuTemplate"
  })

  FrameLib:BuildFontString({
    name = "ma_delayparamlabel2",
    group = "misc",
    parent = ma_midframe,
    text = Locale["ma_UpdateFrequencyLabel"], -- FIX #13
    setpoint = {
      pos = "TOPLEFT",
      offX = 165,
      offY = -155
    }
  })

  FrameLib:BuildFrame({
    type = "EditBox",
    name = "ma_delayparam",
    group = "misc",
    parent = ma_midframe,
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 195,
      offY = -180
    },
    inherits = "InputBoxTemplate"
  })

  FrameLib:BuildFrame({
    type = "Slider",
    name = "ma_frmtrslider",
    group = "misc",
    parent = ma_midframe,
    size = {
      width = 80
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 15,
      offY = -40
    },
    inherits = "OptionsSliderTemplate"
  })
  ma_frmtrslider:SetMinMaxValues(0, 1)
  ma_frmtrslider:SetValueStep(0.01)
  ma_frmtrslider:SetValue(transparency.frm)
  getglobal(ma_frmtrslider:GetName().."Low"):SetText("0%")
  getglobal(ma_frmtrslider:GetName().."High"):SetText("100%")
  getglobal(ma_frmtrslider:GetName().."Text"):SetText("Frame Transparency")

  FrameLib:BuildFrame({
    type = "Slider",
    name = "ma_btntrslider",
    group = "misc",
    parent = ma_midframe,
    size = {
      width = 80
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 15,
      offY = -80
    },
    inherits = "OptionsSliderTemplate"
  })
  ma_btntrslider:SetMinMaxValues(0, 1)
  ma_btntrslider:SetValueStep(0.01)
  ma_btntrslider:SetValue(transparency.btn)
  getglobal(ma_btntrslider:GetName().."Low"):SetText("0%")
  getglobal(ma_btntrslider:GetName().."High"):SetText("100%")
  getglobal(ma_btntrslider:GetName().."Text"):SetText("Button Transparency")

  FrameLib:BuildButton({
    name = "ma_bgcolorshowbutton",
    group = "misc",
    parent = ma_midframe,
    texture = {
      name = "ma_bgcolorshowbutton_texture",
      color = {color.bg.r, color.bg.g, color.bg.b, 1.0}
    },
    size = {
      width = 20,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 10,
      offY = -114
    }
  })

  FrameLib:BuildFontString({
    name = "ma_bgcolorshowtext",
    group = "misc",
    parent = ma_midframe,
    text = Locale["ma_BackgroundColorLabel"],
    setpoint = {
      pos = "TOPLEFT",
      offX = 35,
      offY = -114
    }
  })

  FrameLib:BuildButton({
    name = "ma_frmcolorshowbutton",
    group = "misc",
    parent = ma_midframe,
    texture = {
      name = "ma_frmcolorshowbutton_texture",
      color = {color.frm.r, color.frm.g, color.frm.b, 1.0}
    },
    size = {
      width = 20,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 10,
      offY = -138
    }
  })

  FrameLib:BuildFontString({
    name = "ma_frmcolorshowtext",
    group = "misc",
    parent = ma_midframe,
    text = Locale["ma_FrameColorLabel"],
    setpoint = {
      pos = "TOPLEFT",
      offX = 35,
      offY = -138
    }
  })

  FrameLib:BuildButton({
    name = "ma_btncolorshowbutton",
    group = "misc",
    parent = ma_midframe,
    texture = {
      name = "ma_btncolorshowbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, 1.0}
    },
    size = {
      width = 20,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 10,
      offY = -162
    }
  })

  FrameLib:BuildFontString({
    name = "ma_btncolorshowtext",
    group = "misc",
    parent = ma_midframe,
    text = Locale["ma_ButtonColorLabel"],
    setpoint = {
      pos = "TOPLEFT",
      offX = 35,
      offY = -162
    }
  })

  FrameLib:BuildButton({
    name = "ma_linkifiercolorbutton",
    group = "misc",
    parent = ma_midframe,
    texture = {
      name = "ma_linkifiercolorbutton_texture",
      color = {color.linkifier.r, color.linkifier.g, color.linkifier.b, 1.0}
    },
    size = {
      width = 20,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 10,
      offY = -186
    }
  })

  FrameLib:BuildFontString({
    name = "ma_linkifiercolortext",
    group = "misc",
    parent = ma_midframe,
    text = Locale["ma_LinkifierColorLabel"],
    setpoint = {
      pos = "TOPLEFT",
      offX = 35,
      offY = -186
    }
  })

  FrameLib:BuildButton({
    name = "ma_updatechangesbutton",
    group = "misc",
    parent = ma_midframe,
    texture = {
      name = "ma_updatechangesbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 100,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 10,
      offY = -225
    },
    text = Locale["ma_UpdateChangesButton"]
  })

  -- Weather dropdown (initialized in AzerothAdmin.lua)
  FrameLib:BuildFrame({
    name = "ma_weatherdropdown",
    group = "misc",
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
    name = "ma_changeweatherbutton",
    group = "misc",
    parent = ma_midframe,
    texture = {
      name = "ma_changeweatherbutton_texture",
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
    text = Locale["ma_ApplyWeatherButton"]
  })
end
