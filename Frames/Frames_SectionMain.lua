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
-- This script must be listed in the .toc after "Frames_PopupFrames.lua"
-- Global dependencies: ma_midframe, Locale, FrameLib (loaded from AzerothAdmin.lua)

function AzerothAdmin:CreateMainSection()
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

  FrameLib:BuildButton({
    name = "ma_displaylevelbutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_displaylevelbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
      --file = "Interface\\Buttons\\UI-Panel-Button-Up"
    },
    size = {
      width = 164,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 10,
      offY = -10
    },
    text = Locale["ma_displaylevelbutton"]
  })

  FrameLib:BuildButton({
    name = "ma_gmonbutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_gmonbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 120,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 10,
      offY = -30
    },
    text = Locale["ma_GMOnButton"]
  })

  FrameLib:BuildButton({
    name = "ma_gmoffbutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_gmoffbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 40,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 134,
      offY = -30
    },
    text = Locale["ma_OffButton"]
  })

  FrameLib:BuildButton({
    name = "ma_flyonbutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_flyonbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 120,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 10,
      offY = -50
    },
    text = Locale["ma_FlyOnButton"]
  })

  FrameLib:BuildButton({
    name = "ma_flyoffbutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_flyoffbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 40,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 134,
      offY = -50
    },
    text = Locale["ma_OffButton"]
  })

  FrameLib:BuildButton({
    name = "ma_hoveronbutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_hoveronbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 120,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 10,
      offY = -70
    },
    text = Locale["ma_HoverOnButton"]
  })

  FrameLib:BuildButton({
    name = "ma_hoveroffbutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_hoveroffbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 40,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 134,
      offY = -70
    },
    text = Locale["ma_OffButton"]
  })

  FrameLib:BuildButton({
    name = "ma_whisperonbutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_whisperonbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 120,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 10,
      offY = -90
    },
    text = Locale["ma_WhisperOnButton"]
  })

  FrameLib:BuildButton({
    name = "ma_whisperoffbutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_whisperoffbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 40,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 134,
      offY = -90
    },
    text = Locale["ma_OffButton"]
  })

  FrameLib:BuildButton({
    name = "ma_invisibleonbutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_invisibleonbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 120,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 10,
      offY = -110
    },
    text = Locale["ma_InvisOnButton"]
  })

  FrameLib:BuildButton({
    name = "ma_invisibleoffbutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_invisibleoffbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 40,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 134,
      offY = -110
    },
    text = Locale["ma_OffButton"]
  })

  FrameLib:BuildButton({
    name = "ma_cheattaxionbutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_cheattaxionbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 120,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 10,
      offY = -130
    },
    text = Locale["ma_TaxiOnButton"]
  })

  FrameLib:BuildButton({
    name = "ma_cheattaxioffbutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_cheattaxioffbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 40,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 134,
      offY = -130
    },
    text = Locale["ma_OffButton"]
  })

  FrameLib:BuildButton({
    name = "ma_mapsonbutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_mapsonbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 120,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 10,
      offY = -150
    },
    text = Locale["ma_mapsbutton"]
  })

  FrameLib:BuildButton({
    name = "ma_mapsoffbutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_mapsoffbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 40,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 134,
      offY = -150
    },
    text = Locale["ma_OffButton"]
  })

  FrameLib:BuildButton({
    name = "ma_waterwalkonbutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_waterwalkonbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 120,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 10,
      offY = -170
    },
    text = Locale["ma_waterwalkbutton"]
  })

  FrameLib:BuildButton({
    name = "ma_waterwalkoffbutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_waterwalkoffbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 40,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 134,
      offY = -170
    },
    text = Locale["ma_OffButton"]
  })

  FrameLib:BuildButton({
    name = "ma_accountlockonbutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_accountlockonbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 120,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 10,
      offY = -190
    },
    text = Locale["ma_accountlockbutton"]
  })

  FrameLib:BuildButton({
    name = "ma_accountlockoffbutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_accountlockoffbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 40,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 134,
      offY = -190
    },
    text = Locale["ma_OffButton"]
  })

  FrameLib:BuildButton({
    name = "ma_screenshotbutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_screenshotbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 660,
      offY = -10
    },
    text = Locale["ma_ScreenshotButton"]
  })

  FrameLib:BuildButton({
    name = "ma_bankbutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_bankbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 660,
      offY = -32
    },
    text = Locale["ma_BankButton"]
  })

  FrameLib:BuildButton({
    name = "ma_dismountbutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_dismountbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 660,
      offY = -54
    },
    text = Locale["ma_DismountButton"]
  })

  FrameLib:BuildButton({
    name = "ma_setjail_a_button",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_setjail_a_button_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 660,
      offY = -75
    },
    text = Locale["ma_SetJail_A_Button"]
  })

  FrameLib:BuildButton({
    name = "ma_setjail_h_button",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_setjail_h_button_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 660,
      offY = -97
    },
    text = Locale["ma_SetJail_H_Button"]
  })

  FrameLib:BuildButton({
    type = "CheckButton",
    name = "ma_instantkillbutton",
    group = "main",
    parent = ma_midframe,
    setpoint = {
      pos = "TOPLEFT",
      offX = 180,
      offY = -10
    },
    text = Locale["ma_instakill"],
    inherits = "OptionsCheckButtonTemplate"
  })

  FrameLib:BuildFrame({
    type = "Slider",
    name = "ma_speedslider",
    group = "main",
    parent = ma_midframe,
    size = {
      width = 80
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 205,
      offY = -50
    },
    inherits = "OptionsSliderTemplate"
  })

  FrameLib:BuildButton({
    name = "ma_speedsliderreset_button",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_speedsliderreset_button_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 15,
      height = 15
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 288,
      offY = -50
    },
    text = "R"
  })

  FrameLib:BuildFrame({
    type = "Slider",
    name = "ma_scaleslider",
    group = "main",
    parent = ma_midframe,
    size = {
      width = 80
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 205,
      offY = -95
    },
    inherits = "OptionsSliderTemplate"
  })

  FrameLib:BuildButton({
    name = "ma_scalesliderreset_button",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_scalesliderreset_button_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 15,
      height = 15
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 288,
      offY = -95
    },
    text = "R"
  })

  FrameLib:BuildFontString({
    name = "ma_gridnavigatortext",
    group = "main",
    parent = ma_midframe,
    text = Locale["gridnavigator"],
    setpoint = {
      pos = "BOTTOMRIGHT",
      offX = -5,
      offY = 5
    }
  })

  FrameLib:BuildFrame({
    type = "EditBox",
    name = "ma_gridnavieditbox",
    group = "main",
    parent = ma_midframe,
    size = {
      width = 20,
      height = 20
    },
    setpoint = {
      pos = "BOTTOMRIGHT",
      offX = -29,
      offY = 41
    },
    maxLetters = 2,
    inherits = "InputBoxTemplate"
  })

  FrameLib:BuildButton({
    name = "ma_gridnaviaheadbutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_gridnaviaheadbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 20,
      height = 20
    },
    setpoint = {
      pos = "BOTTOMRIGHT",
      offX = -32,
      offY = 62
    },
    text = Locale["N"]
  })

  FrameLib:BuildButton({
    name = "ma_gridnavibackbutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_gridnavibackbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 20,
      height = 20
    },
    setpoint = {
      pos = "BOTTOMRIGHT",
      offX = -32,
      offY = 20
    },
    text = Locale["S"]
  })

  FrameLib:BuildButton({
    name = "ma_gridnavirightbutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_gridnavirightbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 20,
      height = 20
    },
    setpoint = {
      pos = "BOTTOMRIGHT",
      offX = -55,
      offY = 41
    },
    text = Locale["E"]
  })

  FrameLib:BuildButton({
    name = "ma_gridnavileftbutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_gridnavileftbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 20,
      height = 20
    },
    setpoint = {
      pos = "BOTTOMRIGHT",
      offX = -8,
      offY = 41
    },
    text = Locale["W"]
  })

  FrameLib:BuildFontString({
    name = "ma_parametertext",
    group = "main",
    parent = ma_midframe,
    text = Locale["ma_parameters"],
    setpoint = {
      pos = "TOPLEFT",
      offX = 142, --charColOne
      offY = -232
    }
  })

  --[[Parameter Box Input]]
  FrameLib:BuildFrame({
    type = "EditBox",
    name = "ma_parameter",
    group = "main",
    parent = ma_midframe,
    size = {
      width = 240,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 226,
      offY = -231 --charRowTen
    },
    inherits = "InputBoxTemplate"
  })

  FrameLib:BuildButton({
    name = "ma_gmingamebutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_gmingamebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 578,
      offY = -10
    },
    text = Locale["ma_gmingame"]
  })

  FrameLib:BuildButton({
    name = "ma_gmlistbutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_gmlistbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 578,
      offY = -32
    },
    text = Locale["ma_gmlist"]
  })

  FrameLib:BuildButton({
    name = "ma_petcreatebutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_petcreatebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 578,
      offY = -54
    },
    text = Locale["ma_petcreate"]
  })

  FrameLib:BuildButton({
    name = "ma_petlearnbutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_petlearnbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 578,
      offY = -75
    },
    text = Locale["ma_petlearn"]
  })

  FrameLib:BuildButton({
    name = "ma_petunlearnbutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_petunlearnbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 578,
      offY = -97
    },
    text = Locale["ma_petunlearn"]
  })

  FrameLib:BuildButton({
    name = "ma_pettpbutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_pettpbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 578,
      offY = -119
    },
    text = Locale["ma_pettp"]
  })

  FrameLib:BuildButton({
    name = "ma_lookuptaxibutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_lookuptaxibutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 497,
      offY = -10
    },
    text = Locale["ma_lookuptaxi"]
  })

  FrameLib:BuildButton({
    name = "ma_gotaxinodebutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_gotaxinodebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 497,
      offY = -32
    },
    text = Locale["ma_gotaxinode"]
  })

  FrameLib:BuildButton({
    name = "ma_gotriggerbutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_gotriggerbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 497,
      offY = -54
    },
    text = Locale["ma_gotrigger"]
  })

  FrameLib:BuildButton({
    name = "ma_goxybutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_goxybutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 497,
      offY = -75
    },
    text = Locale["ma_goxy"]
  })

  FrameLib:BuildButton({
    name = "ma_goxyzbutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_goxyzbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 497,
      offY = -97
    },
    text = Locale["ma_goxyz"]
  })

  FrameLib:BuildButton({
    name = "ma_gozonexybutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_gozonexybutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 497,
      offY = -119
    },
    text = Locale["ma_gozonexy"]
  })

  FrameLib:BuildButton({
    name = "ma_lookupzonebutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_lookupzonebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 497,
      offY = -140
    },
    text = Locale["ma_lookupzone"]
  })

  FrameLib:BuildButton({
    name = "ma_castbutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_castbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 415,
      offY = -10
    },
    text = Locale["ma_cast"]
  })

  FrameLib:BuildButton({
    name = "ma_castbackbutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_castbackbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 415,
      offY = -32
    },
    text = Locale["ma_castback"]
  })

  FrameLib:BuildButton({
    name = "ma_castdistbutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_castdistbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 415,
      offY = -54
    },
    text = Locale["ma_castdist"]
  })

  FrameLib:BuildButton({
    name = "ma_castselfbutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_castselfbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 415,
      offY = -75
    },
    text = Locale["ma_castself"]
  })

  FrameLib:BuildButton({
    name = "ma_casttargetbutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_casttargetbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 415,
      offY = -97
    },
    text = Locale["ma_casttarget"]
  })

  FrameLib:BuildButton({
    name = "ma_listitembutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_listitembutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 415,
      offY = -119
    },
    text = Locale["ma_listitem"]
  })

  FrameLib:BuildButton({
    name = "ma_gmclearbutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_gmclearbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 578,
      offY = -140
    },
    text = Locale["ma_GmClear"]
  })

  FrameLib:BuildButton({
    name = "ma_acctcreatebutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_acctcreatebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 333,
      offY = -10
    },
    text = Locale["ma_acctcreate"]
  })

  FrameLib:BuildButton({
    name = "ma_acctdeletebutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_acctdeletebutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 333,
      offY = -32
    },
    text = Locale["ma_acctdelete"]
  })

  FrameLib:BuildButton({
    name = "ma_acctaddonbutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_acctaddonbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 333,
      offY = -54
    },
    text = Locale["ma_acctaddon"]
  })

  FrameLib:BuildButton({
    name = "ma_acctgmlvlbutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_acctgmlvlbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 333,
      offY = -75
    },
    text = Locale["ma_acctgmlvl"]
  })

  FrameLib:BuildButton({
    name = "ma_acctpasswdbutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_acctpasswdbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 333,
      offY = -97
    },
    text = Locale["ma_acctpasswd"]
  })

  FrameLib:BuildButton({
    name = "ma_gmnotifybutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_gmnotifybutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 333,
      offY = -119
    },
    text = Locale["ma_gmnotify"]
  })

  FrameLib:BuildButton({
    name = "ma_teleaddbutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_teleaddbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 333,
      offY = -140
    },
    text = Locale["ma_teleaddbutton"]
    })

  FrameLib:BuildButton({
    name = "ma_teledelbutton",
    group = "main",
    parent = ma_midframe,
    texture = {
      name = "ma_teledelbutton_texture",
      color = {color.btn.r, color.btn.g, color.btn.b, transparency.btn}
    },
    size = {
      width = 80,
      height = 20
    },
    setpoint = {
      pos = "TOPLEFT",
      offX = 415,
      offY = -140
    },
    text = Locale["ma_teledelbutton"]
    })

end
