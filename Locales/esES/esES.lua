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

--[[
How to add a localised string:
1. Look below and find the functional area(Tab) your string belongs in.
2. In that section, find the appropriate type of string (Tooltip, Label, Other)
3. Each line is an assignment equation. On the left side is the 'token' which represents the string. The token is used
  in the source code, and is replaced by the actual string at runtime. The token is quoted, and contained in square brackets ([]).
  Eaxample: ["strength"]
4. Now assign a value to the token for the language you are working with. For example, if I am editing the enUS file, I want to
  assign the value, in US English, to the token:
  ["strength"] = "Strength",
  Please note the line is terminated with a comma (,).
5. A given token must exist in all supported languages. If we edit the deDE file, we would use:
  ["strength"] = "Stärke",
6. Some of these lines also contain color codes (example: |cFF00FF00 and |r) Don't alter these, please.

AzerothAdmin Locale Team:
You have received this file which currently contains enUS strings, but will actually be the file for your
selected language.
1. Edit the first un-commented line below, which should resemble: function Return_esES(). Change
  the 'enUS' to the four letter code for your locale (example: deDE).
2. Proceed to localisation by examining each line in the file, and altering the US English strings on
  the RIGHT of each equation to your selected language. DO NOT alter anything on the LEFT sides
  (the tokens). Example: ["token_do_not_edit"] = "Edit this string to your language",
3. Some text includes color codes:     ["info_revision"] = "|cFF00FF00Azeroth Revision:|r ",
  The Color code should NOT be localised/edited. The color code is a tag, with an opening element
  and a closing element. The opening element is "|c" followed by 8 numbers. The closing element
  is "|r". In the example above, "|cFF00FF00" and "|r" are the color code and should NOT be changed.
  That leaves "Azeroth Revision:" as the string to edit in the above example.
4. Some strings may not be edited at all because they are used in code or contain code. They
  are marked.
5. Please do not edit comments. In LUA, the programming language we use here, code comments are seperated from code by the
  use of "" (makes anything AFTER it a comment, to the end of the line) or comments can be enclosed between.

If you have any questions, contact iotech.

Color List:

LIGHTRED       |cffff6060
LIGHTBLUE      |cff00ccff
TORQUISEBLUE	 |cff00C78C
SPRINGGREEN	   |cff00FF7F
GREENYELLOW    |cffADFF2F
BLUE           |cff0000ff
PURPLE		     |cffDA70D6
GREEN	         |cff00ff00
RED            |cffff0000
GOLD           |cffffcc00
GOLD2			     |cffFFC125
GREY           |cff888888
WHITE          |cffffffff
SUBWHITE       |cffbbbbbb
MAGENTA        |cffff00ff
YELLOW         |cffffff00
ORANGEY		     |cffFF4500
CHOCOLATE		   |cffCD661D
CYAN           |cff00ffff
IVORY			     |cff8B8B83
LIGHTYELLOW	   |cffFFFFE0
SEXGREEN		   |cff71C671
SEXTEAL		     |cff388E8E
SEXPINK		     |cffC67171
SEXBLUE		     |cff00E5EE
SEXHOTPINK	   |cffFF6EB4

]]--

local L = LibStub("AceLocale-3.0"):NewLocale("AzerothAdmin", "esES")
if L then
  local translations = {
--[[General]]
  --[[Tooltips]]
    ["tt_Default"]                    = "¡Mueve el cursor sobre un elemento para mostrar la información!",
    ["tt_LanguageButton"]             = "Recargar AzerothAdmin y aplicar el idioma seleccionado.",
    ["tt_RefreshButton"]              = "Actualizar información del servidor.",
  --[[Control Labels]]
    ["ma_LanguageButton"]             = "Recargar IU",
    ["ma_RefreshButton"]              = "Refrescar",
    ["ma_TopText"]                    = "toptext, you should not see this!",
    ["ma_Top2Text"]                   = "toptext, you should not see this!",
    ["ma_InfoOnlineText"]             = "Jugadores Conectados: ...",
    ["ma_InfoMaxOnlineText"]          = "Máximo Conectados: ...",
    ["ma_InfoUptimeText"]             = "Tiempo Activo: ...",
    ["ma_InfoRevisionText"]           = "Revisión AzerothCore: ...",
    ["info_revision"]                 = "|cFF00FF00Revisión AzerothCore:|r ",
    ["info_platform"]                 = "|cFF00FF00Plataforma del Servidor:|r ",
    ["info_online"]                   = "|cFF00FF00Jugadores Conectados:|r ",
    ["info_maxonline"]                = "|cFF00FF00Máximo Conectados:|r ",
    ["info_uptime"]                   = "|cFF00FF00Tiempo Activo:|r ",
    ["ma_CloseWindow"]                = "X",
    ["tt_CloseWindow"]                = "Cerrar Ventana",
  --[[Other]]
    ["slashcmds"]                     = { "/AzerothAdmin", "/aa" }, -- Do not change these for locale
    ["lang"]                          = "Español",
    ["realm"]                         = "|cFF00FF00Reino:|r "..GetCVar("realmName"),
    ["char"]                          = "|cFF00FF00Personaje:|r "..UnitName("player"),
    ["guid"]                          = "|cFF00FF00Guid:|r ",
    ["tickets"]                       = "|cFF00FF00Tickets:|r ",
    ["selectionerror1"]               = "¡Por favor selecciona solo a ti mismo, otro jugador o nada!",
    ["selectionerror2"]               = "¡Por favor selecciona solo a ti mismo o nada!",
    ["selectionerror3"]               = "¡Por favor selecciona solo a otro jugador!",
    ["selectionerror4"]               = "¡Por favor selecciona solo un NPC!",
    ["numbererror"]                   = "¡El valor debe ser un número!",
    ["searchResults"]                 = "|cFF00FF00Resultados de Búsqueda:|r ",
    ["ma_parameters"]                 = "Parámetro(s):", --Used on multiple tabs



--[[GM tab]]
  --[[Name]]
    ["tabmenu_Main"]                  = "GM",
  --[[Tooltips]]
    ["tt_MainButton"]                 = "Mostrar/Ocultar ventana principal de AzerothAdmin.",
    ["tt_DisplayAccountLevel"]        = "Mostrar tu nivel de cuenta",
    ["tt_GMOnButton"]                 = "Activar tu modo GM.",
    ["tt_GMOffButton"]                = "Desactivar tu modo GM.",
    ["tt_FlyOnButton"]                = "Activar el modo vuelo para el personaje seleccionado.",
    ["tt_FlyOffButton"]               = "Desactivar el modo vuelo para el personaje seleccionado.",
    ["tt_SpectatorOnButton"]           = "Requiere .gm on, permite al personaje GM usar /follow en miembros de la facción opuesta. Nota: Es posible que necesites teletransportarte a otra zona / cargar una nueva área, no se actualiza sobre la marcha.",
    ["tt_SpectatorOffButton"]          = "Desactivar modo Espectador.",
    ["tt_WhispOnButton"]              = "Aceptar susurros de otros jugadores.",
    ["tt_WhispOffButton"]             = "No aceptar susurros de otros jugadores.",
    ["tt_InvisOnButton"]              = "Hacerte invisible.",
    ["tt_InvisOffButton"]             = "Hacerte visible.",
    ["tt_TaxiOnButton"]               = "Mostrar todas las rutas de vuelo al jugador seleccionado. Este truco se desactivará al salir.",
    ["tt_TaxiOffButton"]              = "Desactivar el truco de vuelo y restaurar las rutas conocidas del jugador.",
    ["tt_ShowMapsButton"]             = "Revelar mapas para el personaje seleccionado.",
    ["tt_HideMapsButton"]             = "Ocultar mapas para el personaje seleccionado.",
    ["tt_SpeedSlider"]                = "Aumentar o disminuir la velocidad del personaje seleccionado.",
    ["tt_ScaleSlider"]                = "Aumentar o disminuir la escala del personaje seleccionado.",
    ["tt_instakill"]                  = "Cuando está marcado, hacer clic en una criatura enemiga la mata.",
    ["tt_ScreenButton"]               = "Hacer una captura de pantalla.",
    ["tt_BankButton"]                 = "Mostrar tu banco.",
    ["tt_Dismount"]                   = "Te desmonta, si estás montado",
    ["tt_SetJail_A_Button"]           = "Establece la ubicación de la prisión de la Alianza en tu ubicación actual.",
    ["tt_SetJail_H_Button"]           = "Establece la ubicación de la prisión de la Horda en tu ubicación actual.",
    ["tt_N"]                          = "Navegar Norte",
    ["tt_S"]                          = "Navegar Sur",
    ["tt_E"]                          = "Navegar Este",
    ["tt_W"]                          = "Navegar Oeste",
    ["tt_waterwalkonbutton"]          = "Activar caminar sobre agua para la criatura seleccionada"  ,
    ["tt_watewrwalkoffbutton"]        = "Desactivar caminar sobre agua para la criatura seleccionada",
    ["tt_accountlockonbutton"]        = "Bloquear tu cuenta",
    ["tt_accountlockoffbutton"]       = "Desbloquear tu cuenta",
    ["tt_DisplayAccountLvl"]          = "Mostrar tu nivel de cuenta.",
    ["tt_SpeedSliderReset"]           = "Restablecer Velocidad a 1.0",
    ["tt_ScaleSliderReset"]           = "Restablecer Escala a 1.0",
    ["tt_gmnotifybutton"]             = "Envía mensaje $message a todos los GMs conectados [[Parámetros: $message]]",
    ["tt_gmingamebutton"]             = "Muestra los GMs que están conectados.",
    ["tt_gmlistbutton"]               = "Muestra las cuentas GM en este servidor",
    ["tt_petcreatebutton"]            = "Hace que el ANIMAL seleccionado sea tu mascota.",
    ["tt_petlearnbutton"]             = "Enseña un hechizo a tu mascota [[Parámetro: #SPELLID]]",
    ["tt_petunlearnbutton"]           = "Desenseña un hechizo de tu mascota [[Parámetro: #SPELLID]]",
    ["tt_pettpbutton"]                = "Modifica los puntos de entrenamiento de la mascota [[Parámetro: #points]]",
    ["tt_lookuptaxibutton"]           = "Buscar un TaxiNode [[Parámetro: $Areanamepart]]",
    ["tt_gotaxinodebutton"]           = "Teletransportarse al TaxiNode dado [[Parámetro: #taxinode]]",
    ["tt_gotriggerbutton"]            = "Teletransportarse al área de activación dada [[Parámetro: #trigger_id]]",
    ["tt_goxybutton"]                 = "Teletransportarse a las coordenadas dadas a nivel de suelo/agua en MapID. Si se omite MapID, mapa actual [[Parámetros: #x #y [#mapid]]]",
    ["tt_goxyzbutton"]                = "Teletransportarse a las coordenadas dadas a nivel #z en MapID. Si se omite MapID, mapa actual [[Parámetros: #x #y #z [#mapid]]]",
    ["tt_gozonexybutton"]             = "Teletransportarse a las coordenadas dadas a nivel de suelo/agua en ZoneID. Si se omite ZoneID, zona actual [[Parámetros: #x #y [#zoneid]]]",
    ["tt_lookupzonebutton"]           = "Buscar una Zona. [[Parámetros: $Areanamepart]]",
    ["tt_castbutton"]                 = "Lanzar un hechizo. [[Parámetros: #SpellID]]",
    ["tt_castbackbutton"]             = "La criatura seleccionada lanzará el hechizo [SpellID] sobre TI. [[Parámetros: #SpellID]]",
    ["tt_castdistbutton"]             = "Lanzas un hechizo [SpellID] a distancia [#Dist]. [[Parámetros: #SpellID #Dist]]",
    ["tt_castselfbutton"]             = "La criatura seleccionada lanza el hechizo [SpellID] sobre sí misma. [[Parámetros: #SpellID]]",
    ["tt_casttargetbutton"]           = "La criatura seleccionada lanza el hechizo [SpellID] sobre su objetivo. [[Parámetros: #SpellID]]",
    ["tt_gmclearbutton"]              = "Limpia el cuadro de parámetros.",
    ["tt_listitembutton"]             = "Lista todas las apariciones de [#itemID]. [[Parámetros: #ItemID]]",
    ["tt_acctaddonbutton"]            = "Establece $account para usar #addon(0=WoW, 1=TBC, 2=WotLK) [[Parámetros: $accountname #addon]]",
    ["tt_acctgmlvlbutton"]            = "Establece $account a #gmlevel (0=Jugador, 1=Ayudante, 2=Asistente, 3=GM, 4=Admin) [[Parámetros: $accountname #gmlevel]]",
    ["tt_acctpasswdbutton"]           = "Establece $account $password [[Parámetros: $accountname $password $password]]",
  --[[Control Labels]]
    ["ma_OffButton"]                  = "Apagar",
    ["ma_displaylevelbutton"]         = "Nivel de Cuenta",
    ["ma_GMOnButton"]                 = "Modo GM",
    ["ma_FlyOnButton"]                = "Modo Vuelo",
    ["ma_SpectatorOnButton"]           = "Modo Espectador",
    ["ma_WhisperOnButton"]            = "Susurros",
    ["ma_InvisOnButton"]              = "Invisibilidad",
    ["ma_TaxiOnButton"]               = "Truco Taxi",
    ["ma_ShowMapsButton"]             = "Ver Mapas",
    ["ma_HideMapsButton"]             = "Ocultar",
    ["ma_instakill"]                  = "Matar Instantáneo",
    ["ma_ScreenshotButton"]           = "Captura",
    ["ma_BankButton"]                 = "Banco",
    ["ma_DismountButton"]             = "Desmontar",
    ["ma_SetJail_A_Button"]           = "Prisión A",
    ["ma_SetJail_H_Button"]           = "Prisión H",
    ["gridnavigator"]                 = "Navegador-Cuadrícula",
    ["N"]                             = "N", --Abbreviation for North
    ["S"]                             = "S", --Abbreviation for South
    ["E"]                             = "E", --Abbreviation for East
    ["W"]                             = "O", --Abbreviation for West
    ["ma_chatbutton"]                 = "Chat GM Activado",
    ["ma_mapsbutton"]                 = "Ver Todos los Mapas",
    ["ma_waterwalkbutton"]            = "Caminar Agua",
    ["ma_accountlockbutton"]          = "Bloquear Cuenta",
    ["ma_gmnotify"]                   = "Notificar GM",
    ["ma_gmingame"]                   = "GMs EnJuego",
    ["ma_gmlist"]                     = "Lista GM",
    ["ma_petcreate"]                  = "Crear Mascota",
    ["ma_petlearn"]                   = "Aprender Mascota",
    ["ma_petunlearn"]                 = "Desaprender Mascota",
    ["ma_pettp"]                      = "TP Mascota",
    ["ma_lookuptaxi"]                 = "Buscar Taxi",
    ["ma_gotaxinode"]                 = "Ir TaxiNode",
    ["ma_gotrigger"]                  = "Ir Activador",
    ["ma_goxy"]                       = "Ir XY",
    ["ma_goxyz"]                      = "Ir XYZ",
    ["ma_gozonexy"]                   = "Ir ZonaXY",
    ["ma_lookupzone"]                 = "Buscar Zona",
    ["ma_cast"]                       = "Lanzar",
    ["ma_castback"]                   = "Lanzar Devuelta",
    ["ma_castdist"]                   = "Lanzar Dist",
    ["ma_castself"]                   = "Lanzar Sí Mismo",
    ["ma_casttarget"]                 = "Lanzar Objetivo",
    ["ma_listitem"]                   = "Listar Objeto",
    ["ma_GmClear"]                    = "Limpiar Params",
    ["ma_acctaddon"]                  = "Addon Cuenta",
    ["ma_acctgmlvl"]                  = "GM Lvl Cuenta",
    ["ma_acctpasswd"]                 = "Pass Cuenta",
    ["ma_MiniMenuGM"]                 = "Gm",
    ["ma_MiniMenuChar"]               = "Pj",
    ["ma_MiniMenuNPC"]                = "Np",
    ["ma_MiniMenuGO"]                 = "GO",
    ["ma_MiniMenuTele"]               = "Tl",
    ["ma_MiniMenuTicket"]             = "Tk",
    ["ma_MiniMenuMisc"]               = "Vs",
    ["ma_MiniMenuServer"]             = "Sv",
    ["ma_MiniMenuLog"]                = "Lg",
    ["ma_MiniMenuRevive"]             = "¡REVIVIR!",
  --[[Other]]



--[[Char Tab]]
  --[[Name]]
    ["tabmenu_Char"]                  = "CHAR",
    ["tt_CharButton"]                 = "Mostrar/Ocultar ventana con acciones específicas de personaje.",
  --[[Tooltips]]
    ["tt_RotateLeft"]                 = "Rotar a la izquierda.",
    ["tt_RotateRight"]                = "Rotar a la derecha.",
    ["tt_killbutton"]                 = "Mata la criatura/jugador seleccionado",
    ["tt_reviveplayer"]               = "Revive al jugador seleccionado",
    ["tt_saveplayer"]                 = "Guarda el personaje del jugador seleccionado",
    ["tt_KickButton"]                 = "Expulsa al jugador seleccionado del servidor.",
    ["tt_CooldownButton"]             = "Elimina/expira todos los tiempos de reutilización de hechizos en el personaje seleccionado.",
    ["tt_GUIDButton"]                 = "Muestra el GUID del personaje seleccionado.",
    ["tt_PinfoButton"]                = "Obtener información sobre el JUGADOR seleccionado.",
    ["tt_DistanceButton"]             = "Obtener distancia a la criatura seleccionada.",
    ["tt_RecallButton"]               = "Devuelve al jugador seleccionado a la ubicación antes del último teletransporte.",
    ["tt_DemorphButton"]              = "Elimina cualquier transformación del personaje seleccionado.",
    ["tt_ShowMapsCharButton"]         = "Revela mapas para el personaje seleccionado.",
    ["tt_HideMapsCharButton"]         = "Oculta mapas para el personaje seleccionado.",
    ["tt_learnlangbutton"]            = "Aprender hechizos seleccionados",
    ["tt_modifybutton"]               = "Modificar el atributo seleccionado por la cantidad introducida",
    ["tt_resetbutton"]                = "Restablecer el atributo seleccionado",
    ["tt_modelzoominbutton"]          = "Acercar el modelo seleccionado",
    ["tt_modelzoomoutbutton"]         = "Alejar el modelo seleccionado",
    ["tt_charbindsight"]              = "Vincula tu visión a la Unidad seleccionada",
    ["tt_charunbindsight"]            = "Desvincula tu visión de la Unidad seleccionada",
    ["tt_charrename"]                 = "Marca el personaje seleccionado para renombrar en el próximo inicio de sesión",
    ["tt_charcustomize"]              = "Marca el personaje seleccionado para personalización en el próximo inicio de sesión",
    ["tt_charchangerace"]             = "Marca el personaje seleccionado para cambio de raza en el próximo inicio de sesión",
    ["tt_charchnagefaction"]          = "Marca el personaje seleccionado para cambio de facción en el próximo inicio de sesión",
    ["tt_charcombatstop"]             = "Detiene el combate para el personaje seleccionado (o tú mismo)",
    ["tt_charmaxskill"]               = "Establece las habilidades del personaje seleccionado al valor máximo para su nivel",
    ["tt_charfreeze"]                 = "Congela al jugador objetivo y deshabilita su chat",
    ["tt_charunfreeze"]               = "Descongela al jugador seleccionado y restaura el chat",
    ["tt_charlistdeleted"]            = "Lista los personajes eliminados en la ventana de chat",
    ["tt_chardeletedrestore"]         = "Parámetros= #guid|$name [$newname] [#new account] [[Este comando está en desarrollo]",
    ["tt_charpossess"]                = "Posee indefinidamente a la criatura seleccionada",
    ["tt_charunpossess"]              = "Deja de poseer a la criatura seleccionada",
    ["tt_charrecall"]                 = "Devuelve al jugador seleccionado a la última posición de teletransporte que tuvo",
    ["tt_charrepair"]                 = "Repara la armadura y armas del jugador seleccionado",
    ["tt_banbutton"]                  = "Parámetros= <account|ip|character> $NameOrIp <-1|xxdyyhzzm> $reason   [[Banea cuenta/IP y expulsa. -1=baneo permanente, o cadena como 4d3h24m16s]]",
    ["tt_gonamebutton"]               = "Parámetro= $charactername  [[Te teletransporta al personaje especificado]]",
    ["tt_createguildbutton"]          = "Parámetros= $GuildLeaderName $GuildName  [[Crea una hermandad llamada $GuildName, con $GuildLeaderName como líder]]",
    ["tt_teleaddbutton"]              = "Parámetro= $Name  [[Añade una ubicación de teletransporte con comando .tele para tu ubicación actual con el nombre $Name]]",
    ["tt_baninfobutton"]              = "Parámetro= <account|ip|character>  [[Ver información detallada sobre baneos en la cuenta/ip/personaje especificado]]",
    ["tt_groupgobutton"]              = "Parámetro= $charactername   [[Teletransporta al personaje especificado y su grupo a tu ubicación]]",
    ["tt_guildinvitebutton"]          = "Parámetros= $charactername $guildname   [[Añade $charactername a la hermandad $guildname]]",
    ["tt_teledelbutton"]              = "Parámetro= $telename  [[Elimina la ubicación llamada $telename de la lista de ubicaciones .tele]]",
    ["tt_banlistbutton"]              = "Parámetros= <account|ip> $NameOrIp   [[Busca y devuelve baneos específicos que coincidan con los parámetros]]",
    ["tt_namegobutton"]               = "Parámetro= $charactername   [[Teletransporta al personaje especificado a tu ubicación]]",
    ["tt_guildrankbutton"]            = "Parámetros= $charactername #ranknumber   [[Establece al personaje especificado al rango especificado en su hermandad]]",
    ["tt_telegroupbutton"]            = "Parámetro= $telename  [[Teletransporta al personaje **seleccionado** y su grupo a la ubicación .tele llamada $telename]]",
    ["tt_unbanbutton"]                = "Parámetros= <account|ip|character> $NameOrIp  [[Desbanea la cuenta/IP/personaje especificado]]",
    ["tt_guilddeletebutton"]          = "Parámetro= $guildname  [[Elimina la Hermandad especificada]]",
    ["tt_guilduninvitebutton"]        = "Parámetro= $charactername  [[Expulsa al personaje especificado de su hermandad]]",
    ["tt_telenamebutton"]             = "Parámetros= $charactername $telename  [[Teletransporta $charactername a $telename]]",
    ["tt_mutebutton"]                 = "Parámetros= $charactername #minutes  [[Deshabilita el chat para toda la cuenta de $charactername durante #minutes]]",
    ["tt_charmorphbutton"]            = "Parámetros = #DisplayID [[Introduce el DisplayID de la transformación que quieres aplicar]]",
    ["tt_charaurabutton"]             = "Parámetros = #AuraID [[Introduce el AuraID del aura que quieres aplicar]]",
    ["tt_charunaurabutton"]           = "Parámetros = #AuraID [[Introduce el AuraID del aura que quieres eliminar]]",
    ["tt_JailAButton"]                = "Parámetro= $charactername [[Envía al personaje cuyo nombre aparece en este cuadro a la Prisión de la Alianza]]",
    ["tt_JailHButton"]                = "Parámetro= $charactername [[Envía al personaje cuyo nombre aparece en este cuadro a la Prisión de la Horda]]",
    ["tt_UnJailButton"]               = "Parámetro= $charactername [[Libera de la prisión al personaje cuyo nombre aparece en este cuadro.]]",
    ["tt_UnMuteButton"]               = "Quita el silencio a $player.",
    ["tt_QuestAddButton"]             = "Añade #questid al jugador **seleccionado**.",
    ["tt_QuestCompleteButton"]        = "Marca #questid como completada para el jugador **seleccionado**.",
    ["tt_QuestRemoveButton"]          = "Elimina #questid del jugador **seleccionado**.",
    ["tt_DamageButton"]               = "Parámetro= #amount cantidad de daño a aplicar a la criatura/jugador **seleccionado**",
    ["tt_HideAreaButton"]             = "Oculta #areaid del jugador **seleccionado**.",
    ["tt_ShowAreaButton"]             = "Muestra #areaid al jugador **seleccionado**.",
    ["tt_HonorAddButton"]             = "Añade #honorpoints al jugador **seleccionado**.",
    ["tt_HonorUpdateButton"]          = "No se requiere parámetro. Guarda el Honor para el jugador **seleccionado**.",
  --[[Control Labels]]
    ["ma_KillButton"]                 = "Matar",
    ["ma_ReviveButton"]               = "Revivir",
    ["ma_SaveButton"]                 = "Guardar",
    ["ma_KickButton"]                 = "Expulsar",
    ["ma_CooldownButton"]             = "Cooldown",
    ["ma_GUIDButton"]                 = "Ver GUID",
    ["ma_PinfoButton"]                = "Info JUGADOR",
    ["ma_DistanceButton"]             = "Distancia",
    ["ma_RecallButton"]               = "Devolver",
    ["ma_DemorphButton"]              = "Desmorfar",
    ["ma_ShowMapsCharButton"]         = "Ver Mapas",
    ["ma_HideMapsCharButton"]         = "Ocultar",
    ["ma_LearnLangButton"]            = "Todos Idiomas",
    ["ma_Learn"]                      = "Aprender",
    ["ma_Modify"]                     = "Modificar",
    ["ma_Reset"]                      = "Restablecer",
    ["ma_CharBindsight"]              = "Vincular Vista",
    ["ma_CharUnBindsight"]            = "Desvincular Vista",
    ["ma_charrename"]                 = "Renombrar",
    ["ma_charcustomize"]              = "Personalizar",
    ["ma_charchangerace"]             = "Cambiar Raza",
    ["ma_charchnagefaction"]          = "Cambiar Facción",
    ["ma_charcombatstop"]             = "Detener Combate",
    ["ma_charmaxskill"]               = "Habilidad Máx",
    ["ma_charfreeze"]                 = "Congelar",
    ["ma_charunfreeze"]               = "Descongelar",
    ["ma_charlistdeleted"]            = "ListarPjElim",
    ["ma_chardeletedrestore"]         = "RestaurarPjElim",
    ["ma_charpossess"]                = "Poseer",
    ["ma_charunpossess"]              = "Dejar Poseer",
    ["ma_charrecall"]                 = "Devolver",
    ["ma_charrepair"]                 = "Reparar",
    ["ma_banbutton"]                  = "Banear",
    ["ma_gonamebutton"]               = "Aparecer",
    ["ma_createguildbutton"]          = "Crear H",
    ["ma_teleaddbutton"]              = "Añadir Tele",
    ["ma_baninfobutton"]              = "Info Baneo",
    ["ma_groupgobutton"]              = "Invocar Grupo",
    ["ma_guildinvitebutton"]          = "Invitar H",
    ["ma_teledelbutton"]              = "Elim Tele",
    ["ma_banlistbutton"]              = "Lista Baneos",
    ["ma_namegobutton"]               = "Invocar",
    ["ma_guildrankbutton"]            = "Rango H",
    ["ma_telegroupbutton"]            = "Tele Grupo",
    ["ma_unbanbutton"]                = "Desbanear",
    ["ma_guilddeletebutton"]          = "Eliminar H",
    ["ma_guilduninvitebutton"]        = "Expulsar H",
    ["ma_telenamebutton"]             = "Tele Nombre",
    ["ma_mutebutton"]                 = "Silenciar",
    ["ma_Aura"]                       = "Aura",
    ["ma_UnAura"]                     = "Quitar Aura",
    ["ma_Morph"]                      = "Morfar",
    ["ma_JailAButton"]                = "Prisión (A)",
    ["ma_JailHButton"]                = "Prisión (H)",
    ["ma_UnJailButton"]               = "Liberar",
    ["ma_UnMuteButton"]               = "Quitar Silencio",
    ["ma_QuestAddButton"]             = "Añadir Misión",
    ["ma_QuestCompleteButton"]        = "Completar Misión",
    ["ma_QuestRemoveButton"]          = "Eliminar Misión",
    ["ma_DamageButton"]               = "Daño",
    ["ma_HideAreaButton"]             = "Ocultar Área",
    ["ma_ShowAreaButton"]             = "Mostrar Área",
    ["ma_HonorAddButton"]             = "Añad Honor",
    ["ma_HonorUpdateButton"]          = "Actual Honor",
    ["ma_CharRotateLeft"]             = "<<=",
    ["ma_CharRotateRight"]            = "=>>",
    ["ma_CharZoomIn"]                 = "+",
    ["ma_CharZoomOut"]                = "-",
  --[[Other]]
    ["ma_LevelUp"]                    = "Subir nivel",
    ["ma_LevelDown"]                  = "Bajar nivel",
    ["ma_Money"]                      = "Dinero",
    ["ma_Energy"]                     = "Energía",
    ["ma_Rage"]                       = "Ira",
    ["ma_Mana"]                       = "Maná",
    ["ma_Healthpoints"]               = "Ptos Salud",
    ["ma_Talents"]                    = "Talentos",
    ["ma_Stats"]                      = "Estadísticas",
    ["ma_Spells"]                     = "Hechizos",
    ["ma_Honor"]                      = "Honor",
    ["ma_Level"]                      = "Nivel",
    ["ma_AllLang"]                    = "Todos Idiomas",
    ["ma_AllGMSpells"]                = "Todos GM Spells",
    ["ma_AllCrafts"]                  = "Todas Profesiones",
    ["ma_AllDefault"]                 = "Todo Defecto",
    ["ma_AllMyClass"]                 = "Toda Mi Clase",
    ["ma_AllMyPetTalents"]            = "Talentos Mascota",
    ["ma_AllMySpells"]                = "Mis Hechizos",
    ["ma_AllMyTalents"]               = "Todos Mis Talentos",
    ["ma_AllRecipesAlchemy"]          = "Todas las Recetas (Alquimia)",
    ["ma_AllRecipesBlacksmithing"]    = "Todas las Recetas (Herrería)",
    ["ma_AllRecipesCooking"]          = "Todas las Recetas (Cocina)",
    ["ma_AllRecipesEnchanting"]       = "Todas las Recetas (Encantamiento)",
    ["ma_AllRecipesEngineering"]      = "Todas las Recetas (Ingeniería)",
    ["ma_AllRecipesFirstAid"]         = "Recetas (Prim Aux)",
    ["ma_AllRecipesInscription"]      = "Todas las Recetas (Inscripción)",
    ["ma_AllRecipesJewelcrafting"]    = "Todas las Recetas (Joyería)",
    ["ma_AllRecipesLeatherworking"]   = "Todas las Recetas (Peletería)",
    ["ma_AllRecipesTailoring"]        = "Todas las Recetas (Sastrería)",
    ["ma_resetallspells"]             = "Hechizos para TODOS",
    ["ma_resetalltalents"]            = "Talentos para TODOS",
    ["ma_achievements"]               = "Logros",
    ["ma_AllSpeeds"]                  = "Todas Velocidades",
    ["ma_Arena"]                      = "Arena",
    ["ma_BackWalk"]                   = "Caminar Atrás",
    ["ma_Drunk"]                      = "Borrachera",
    ["ma_FlySpeed"]                   = "Velocidad Vuelo",
    ["ma_Gender"]                     = "Sexo",
    ["ma_MountSpeed"]                 = "Velocidad Montura",
    ["ma_Phase"]                      = "Fase",
    ["ma_RunicPower"]                 = "Poder Rúnico",
    ["ma_Speed"]                      = "Velocidad",
    ["ma_StandState"]                 = "Estado Postura",
    ["ma_SwimSpeed"]                  = "Veloc Nado",
    ["ma_TalentPoints"]               = "Puntos Talento",
    -- languages
    ["Common"]                        = "Común",
    ["Orcish"]                        = "Órquico",
    ["Taurahe"]                       = "Taurahe",
    ["Darnassian"]                    = "Darnassiano",
    ["Dwarvish"]                      = "Enánico",
    ["Thalassian"]                    = "Thalassiano",
    ["Demonic"]                       = "Demoniaco",
    ["Draconic"]                      = "Dracónico",
    ["Titan"]                         = "Titánico",
    ["Kalimag"]                       = "Kalimag",
    ["Gnomish"]                       = "Gnómico",
    ["Troll"]                         = "Trol",
    ["Gutterspeak"]                   = "Páramo",
    ["Draenei"]                       = "Draeneico",



--[[NPC Tab]]
  --[[Name]]
    ["tabmenu_NPC"]                   = "NPC",
    ["tt_NpcButton"]                  = "Mostrar/Ocultar ventana con funciones relacionadas con NPCs.",
  --[[Tooltips]]
    ["tt_NPCRotateLeft"]              = "Rotar a la izquierda",
    ["tt_NPCRotateRight"]             = "Rotar a la derecha",
    ["tt_NPCKillButton"]              = "Mata el objetivo seleccionado",
    ["tt_npcrespawn"]                 = "Reaparece la criatura seleccionada, o si no hay ninguna seleccionada, todas las criaturas cercanas",
    ["tt_NPCDistanceButton"]          = "Obtener distancia a la criatura seleccionada.",
    ["tt_NPCGUIDButton"]              = "Muestra el GUID del personaje seleccionado.",
    ["tt_NPCInfoButton"]              = "Obtener información sobre el NPC seleccionado.",
    ["tt_NPCDemorph"]                 = "Desmorfar NPC seleccionado",
    ["tt_NPCMove"]                    = "Mover la criatura seleccionada a tu ubicación",
    ["tt_NPCDel"]                     = "Elimina la criatura seleccionada",
    ["tt_getguid"]                    = "Obtiene el GUID e ID de la criatura seleccionada",
    ["tt_NPCClear"]                   = "Limpia todos los campos de información del NPC (GUID, ID NPC, ID Visualización, Distancia)",
    ["tt_NPCAdd"]                     = "Añade una copia de este NPC en tu ubicación actual.",
    ["tt_NPCGo"]                      = "Te teletransporta al NPC en el cuadro GUID",
    ["tt_NPCMorph"]                   = "Parámetros = #DisplayID [[Introduce el DisplayID de la transformación que quieres aplicar]]",
    ["tt_NPCSay"]                     = "Hacer que el NPC seleccionado diga [parámetros]",
    ["tt_NPCYell"]                    = "Hacer que el NPC seleccionado grite [parámetros]",
    ["tt_NPCAura"]                    = "Parámetros = #AuraID [[Introduce el AuraID del aura que quieres aplicar]]",
    ["tt_NPCUnaura"]                  = "Parámetros = #AuraID [[Introduce el AuraID del aura que quieres eliminar]]",
    ["tt_PlayEmote"]                  = "Reproducir Emote de la lista de la izquierda",
    ["tt_GPSButton"]                  = "Muestra las coordenadas del personaje seleccionado.",
    ["tt_DisplayUp"]                  = "Incrementar DisplayID del NPC en 1",
    ["tt_DisplayDown"]                = "Decrementar DisplayID del NPC en 1",
    ["tt_IDUp"]                       = "Incrementar ID del NPC en 1",
    ["tt_IDDown"]                     = "Decrementar ID del NPC en 1",
    ["tt_npcmodelzoominbutton"]       = "Acercar el modelo seleccionado",
    ["tt_npcmodelzoomoutbutton"]      = "Alejar el modelo seleccionado",
    ["tt_npcbindsight"]               = "Vincula tu visión al NPC seleccionado",
    ["tt_npcunbindsight"]             = "Desvincula tu visión del NPC seleccionado",
    ["tt_npccometome"]                = "Fuerza al NPC seleccionado a venir a tu ubicación. Ubicación NO guardada en BD.",
    ["tt_npcpossess"]                 = "Posee indefinidamente a la criatura seleccionada",
    ["tt_npcunpossess"]               = "Deja de poseer a la criatura seleccionada",
    ["tt_NPCFreezeButton"]            = "Detiene el movimiento del NPC seleccionado, guardando Puntos de Ruta",
    ["tt_NPCFreezeDelButton"]         = "Detiene el movimiento del NPC seleccionado, SIN guardar Puntos de Ruta",
    ["tt_WayEndAdd"]                  = "Añade un punto de ruta al final de la pila existente",
    ["tt_NPCAddWay"]                  = "Añade un punto de ruta a la pila. El GUID de la criatura debe estar en el cuadro inferior",
    ["tt_WayMAdd"]                    = "Añade un punto de ruta a la pila de movimiento existente de la criatura seleccionada",
    ["tt_WayModifyDel"]               = "Elimina el punto de ruta seleccionado de la pila de movimiento existente de la criatura",
    ["tt_WayShow0"]                   = "Dejar de mostrar puntos de ruta para la criatura seleccionada.",
    ["tt_WayShow1"]                   = "Mostrar puntos de ruta para la criatura seleccionada.",
    ["tt_NPCAdd_WayShowOn"]           = "muestra puntos de ruta para la criatura seleccionada",
    ["tt_NPCUnFreeze_RandomButton"]   = "Permite movimiento aleatorio del NPC seleccionado.",
    ["tt_NPCUnFreeze_WayButton"]      = "Permite movimiento por puntos de ruta del NPC seleccionado.",
    ["tt_MoveStackButton"]            = "Muestra la pila de movimiento del personaje seleccionado.",
  --[[Control Labels]]
    ["Morph"]                         = "Morfar",
    ["ma_NPCKillButton"]              = "Matar",
    ["ma_Respawn"]                    = "Respawn",
    ["ma_NPCDistanceButton"]          = "Distancia",
    ["ma_NPCGUIDButton"]              = "Ver GUID",
    ["ma_NPCInfoButton"]              = "Info NPC",
    ["ma_NPCDemorph"]                 = "Desmorfar",
    ["ma_NPCMove"]                    = "Mover NPC",
    ["ma_NPCDel"]                     = "Elim NPC",
    ["ma_getguid"]                    = "Get GUID",
    ["ma_NPCAdd"]                     = "Añad NPC",
    ["ma_NPCGo"]                      = "Ir NPC",
    ["ma_NPCMorph"]                   = "Morfar",
    ["ma_NPCSay"]                     = "Decir NPC",
    ["ma_NPCYell"]                    = "Gritar NPC",
    ["ma_NPCAura"]                    = "Aura NPC",
    ["ma_NPCUnAura"]                  = "Quitar Aura NPC",
    ["ma_PlayEmote1"]                 = "Emote",
    ["ma_PlayEmote2"]                 = "Emote",
    ["ma_DistanceBox"]                = "Distancia",
    ["ma_NPCBindsight"]               = "Vincular Vista",
    ["ma_NPCUnBindsight"]             = "Desvincular Vista",
    ["ma_NPCComeToMe"]                = "Ven Aquí",
    ["ma_npcpossess"]                 = "Poseer",
    ["ma_npcunpossess"]               = "Dejar Poseer",
    ["ma_WayShow1"]                   = "Mostrar Ruta",
    ["ma_WayShow0"]                   = "Ocultar Ruta",
    ["ma_MoveStackButton"]            = "Mostrar Movs",
    ["ma_NPCFreezeButton"]            = "Detener NPC",
    ["ma_WayAllDel"]                  = "Detener NPCSinGuard",
    ["ma_WayMAdd"]                    = "Añadir PuntoRuta",
    ["ma_NPCUnFreeze_RandomButton"]   = "Mov Aleatorio",
    ["ma_NPCUnFreeze_WayButton"]      = "Mov PuntRuta",
    ["ma_WayMDel"]                    = "Elim PuntoRuta",
    ["ma_WayEndAdd"]                  = "Añadir RutaFinal",
    ["ma_WayAdd"]                     = "Añadir Ruta",
    ["ma_WayShow"]                    = "Mostrar Ruta",
    ["ma_NPCRotateLeft"]              = "<<=",
    ["ma_NPCRotateRight"]             = "=>>",
    ["ma_NPCZoomIn"]                  = "+",
    ["ma_NPCZoomOut"]                 = "-",
    ["ma_NPCDisplayIDLabel"]          = "ID Visual:",
    ["ma_NPCIDLabel"]                 = "ID NPC:",
    ["ma_NPCGUIDLabel"]               = "GUID:",
    ["ma_NPCDisplayDown"]             = "<<",
    ["ma_NPCDisplayUp"]               = ">>",
    ["ma_NPCIDUp"]                    = ">>",
    ["ma_NPCClearButton"]             = "Limpiar",
  --[[Other]]



--[[GObjects Tab]]
  --[[Name]]
    ["tabmenu_GO"]                    = "GOB",
    ["tt_GOButton"]                   = "Mostrar/Ocultar ventana con funciones de Objetos del Juego.",
  --[[Tooltips]]
    ["tt_ObjGo"]                      = "Ir al objeto seleccionado",
    ["tt_ObjAdd"]                     = "Añadir una copia del objeto objetivo en tu ubicación y orientación",
    ["tt_ObjMove"]                    = "Mover el objeto objetivo a tu ubicación",
    ["tt_ObjTurn"]                    = "Gira el objeto objetivo para coincidir con tu orientación",
    ["tt_ObjDel"]                     = "Elimina el objeto objetivo",
    ["tt_ObjNear"]                    = "Devuelve información sobre objetos cercanos",
    ["tt_ObjTarget"]                  = "Selecciona el objeto más cercano y muestra información",
    ["tt_ObjActivate"]                = "Activa el objeto objetivo",
    ["tt_ObjAddTemp"]                 = "Añade una copia temporal del objeto",
    ["tt_ObjInfo"]                    = "Obtiene información extendida sobre el objeto",
    ["tt_ObjSetPhase"]                = "Establece la fase del objeto",
    ["tt_ObjShowModel"]               = "Cargar y mostrar el modelo",
    ["tt_ObjUnloadModel"]             = "Descargar modelos para liberar memoria",
    ["tt_ObjMoveForward"]             = "Mover adelante",
    ["tt_ObjMoveBack"]                = "Mover atrás",
    ["tt_ObjMoveLeft"]                = "Mover izquierda",
    ["tt_ObjMoveRight"]               = "Mover derecha",
    ["tt_ObjMoveUp"]                  = "Mover arriba",
    ["tt_ObjMoveDown"]                = "Mover abajo",
    ["tt_ObjSpawnHere"]               = "Aparecer aquí",
  --[[Control Labels]]
    ["ma_OBJGo"]                      = "Ir Obj",
    ["ma_OBJAdd"]                     = "Añad Obj",
    ["ma_OBJMove"]                    = "Mover Obj",
    ["ma_OBJTurn"]                    = "Girar Obj",
    ["ma_OBJDel"]                     = "Elim Obj",
    ["ma_OBJNear"]                    = "Obj Cercano",
    ["ma_OBJTarget"]                  = "Select Obj",
    ["ma_OBJActivate"]                = "Activar Obj",
    ["ma_OBJAddTemp"]                 = "Añad Obj Tmp",
    ["ma_OBJInfo"]                    = "Info Obj",
    ["ma_OBJSetPhase"]                = "Fase Obj",
    ["ma_GOGUIDLabel"]                = "GUID",
    ["ma_GOEntryIDLabel"]             = "ID Entrada",
    ["ma_GODisplayIDLabel"]           = "ID Visualización",
    ["ma_GORangeLabel"]               = "Rango",
    ["ma_GOAddOnMoveLabel"]           = "Añadir al Mover",
    ["ma_GOMoveOnMoveLabel"]          = "Mover al Mover",
    ["ma_GOMoveDistancesLabel"]       = "Distancias de Movimiento",
    ["ma_GOFwdBackLabel"]             = "Adelante/Atrás:",
    ["ma_GOLeftRightLabel"]           = "Izq/Dcha:",
    ["ma_GOUpDownLabel"]              = "Arriba/Abajo:",
    ["ma_GORotateLeft"]               = "<<",
    ["ma_GORotateRight"]              = ">>",
    ["ma_GOZoomIn"]                   = "+",
    ["ma_GOZoomOut"]                  = "-",
    ["ma_GOMoveForward"]              = "ADELANTE",
    ["ma_GOMoveLeft"]                 = "IZQUIERDA",
    ["ma_GOMoveRight"]                = "DERECHA",
    ["ma_GOMoveBack"]                 = "ATRÁS",
    ["ma_GOSpawnHere"]                = "AQUÍ",
    ["ma_GOMoveUp"]                   = "ARRIBA",
    ["ma_GOMoveDown"]                 = "ABAJO",
    ["ma_GOShowButton"]               = "Ver",
    ["ma_GOUnloadButton"]             = "Descargar",
  --[[Other]]
    ["msg_toggle_maps_confirm"]       = "¿Estás seguro de que quieres cambiar todos los mapas? Esto puede congelar el cliente por unos segundos.",
    ["msg_account_lock_confirm"]      = "¿Estás seguro de que quieres %s esta cuenta?",
    ["msg_acct_create_confirm"]       = "¿Estás seguro de que quieres crear la cuenta '%s'?",
    ["msg_tele_del_confirm"]          = "¿Estás seguro de que quieres eliminar la ubicación de teletransporte '%s'?",



--[[Tele Tab]]
  --[[Name]]
    ["tabmenu_Tele"]                  = "TELE",
    ["tt_TeleButton"]                 = "Mostrar/Ocultar ventana con funciones de teletransporte.",
  --[[Tooltips]]
  --[[Control Labels]]
    ["Zone"]                          = "|cFF00FF00Zona:|r ",
    ["ma_ContinentSelection"]         = "Sel Continente",
    ["ma_EasternKingdomsN"]           = "Reinos del Este (N)",
    ["ma_EasternKingdomsS"]           = "Reinos del Este (S)",
    ["ma_Kalimdor"]                   = "Kalimdor",
    ["ma_Outland"]                    = "Terrallende",
    ["ma_NorthrendAlliance"]          = "Rasganorte-Alianza",
    ["ma_NorthrendHorde"]             = "Rasganorte-Horda",
    ["ma_BattlegroundsArenas"]        = "Campos Batalla/Arenas",
    ["ma_InstancesEastern"]           = "Mazmorras: Este",
    ["ma_InstancesKalimdor"]          = "Mazmorras: Kalimdor",
    ["ma_InstancesOutland"]           = "Mazmorras: Terrallende",
    ["ma_InstancesNorthrend"]         = "Mazmorras: Rasganorte",
    ["ma_Other"]                      = "Otros",
    ["ma_ZoneSelection"]              = "Sel de Zona",
    ["ma_SelectedSubzone"]            = "Subzona Selec",
  --[[Other]]
    ["ma_NoZones"]                    = "¡No hay zonas!",
    ["ma_NoSubZones"]                 = "¡No hay subzonas!",



--[[Tickets Tab]]
  --[[Name]]
    ["tabmenu_ticket"]                = "TICKETS",
    ["tt_TicketButton"]               = "Mostrar/Ocultar ventana que muestra todos los tickets y permite administrarlos.",
  --[[Tooltips]]
    ["tt_TicketOn"]                   = "Anunciar nuevos tickets.",
    ["tt_TicketOff"]                  = "No anunciar nuevos tickets.",
    ["tt_ResetTickets"]               = "Restablecer tickets cargados",
    ["tt_LoadAllTickets"]             = "Cargar todos los tickets",
    ["tt_LoadOnlineTickets"]          = "Cargar tickets de jugadores conectados",
    ["tt_DeleteTicket"]               = "Cerrar ticket y eliminar de la lista",
    ["tt_AnswerTicket"]               = "Responder ticket",
    ["tt_GetCharTicket"]              = "Invocar personaje del ticket",
    ["tt_GoCharTicket"]               = "Ir al personaje del ticket",
    ["tt_WhisperTicket"]              = "Susurrar al personaje del ticket",
    ["tt_GoTicket"]                   = "Ir a la ubicación del ticket",
    ["tt_ShowTickets"]                = "Mostrar tickets cargados",
  --[[Control Labels]]
    ["ma_ticketidlabel"]              = "|cFF00FF00Ticket:",
    ["ma_ticketcreatedbylabel"]       = "|cFF00FF00Creado por:",
    ["ma_tickettimecreatedlabel"]     = "|cFF00FF00Creado:",
    ["ma_ticketlastchangelabel"]      = "|cFF00FF00Último cambio:",
    ["ma_ticketmessagelabel"]         = "|cFF00FF00Mensaje del Ticket:",
    ["ma_LoadTicketsButton"]          = "Refrescar",
    ["ma_GetCharTicketButton"]        = "Invocar",
    ["ma_GoCharTicketButton"]         = "Ir Jugador",
    ["ma_AnswerButton"]               = "Correo",
    ["ma_DeleteButton"]               = "Cerrar",
    ["ma_ticketwhisperbutton"]        = "Susurrar",
    ["ma_TicketCount"]                = "|cFF00FF00Tickets:|r ",
    ["ma_TicketsNoNew"]               = "No tienes tickets nuevos.",
    ["ma_TicketsNewNumber"]           = "¡Tienes |cffeda55f%s|r tickets nuevos!",
    ["ma_TicketsGoLast"]              = "Ir al creador del último ticket (%s).",
    ["ma_TicketsGetLast"]             = "Traer %s a ti.",
    ["ma_TicketsInfoPlayer"]          = "|cFF00FF00Jugador:|r ",
    ["ma_TicketsInfoStatus"]          = "|cFF00FF00Estado:|r ",
    ["ma_TicketsInfoAccount"]         = "|cFF00FF00Cuenta:|r ",
    ["ma_TicketsInfoAccLevel"]        = "|cFF00FF00Nivel de Cuenta:|r ",
    ["ma_TicketsInfoLastIP"]          = "|cFF00FF00Última IP:|r ",
    ["ma_TicketsInfoPlayedTime"]      = "|cFF00FF00Tiempo jugado:|r ",
    ["ma_TicketsInfoLevel"]           = "|cFF00FF00Nivel:|r ",
    ["ma_TicketsInfoMoney"]           = "|cFF00FF00Dinero:|r ",
    ["ma_TicketsInfoLatency"]         = "|cFF00FF00Latencia:|r ",
    ["ma_TicketsNoInfo"]              = "No hay información disponible",
    ["ma_TicketsNotLoaded"]           = "No se ha cargado ningún ticket...",
    ["ma_TicketsNoTickets"]           = "¡No hay tickets disponibles!",
    ["ma_TicketResetButton"]          = "RESET",
    ["ma_TicketLoadAllButton"]        = "Cargar Todo",
    ["ma_TicketLoadOnlineButton"]     = "Cargar Online",
    ["ma_TicketShowButton"]           = "MOSTRAR",
    ["ma_TicketGoButton"]             = "Ir Ticket",
    ["ma_TicketTicketLoaded"]         = "|cFF00FF00Ticket-Nº Cargado:|r %s\n\nInformación del Jugador\n\n",
    ["ma_Reload"]                     = "Recargar",
    ["ma_LoadMore"]                   = "Cargar más...",
  --[[Other]]



--[[Misc Tab]]
  --[[Name]]
    ["tabmenu_Misc"]                  = "MISC",
    ["tt_MiscButton"]                 = "Mostrar/Ocultar ventana con acciones varias.",
  --[[Tooltips]]
    ["tt_FrmTrSlider"]                = "Cambiar transparencia del marco",
    ["tt_BtnTrSlider"]                = "Cambiar transparencia de los botones",
    ["tt_windowismovable"]            = "Permitir que la ventana sea movible",
    ["tt_updatechanges"]              = "Aplicar cambios realizados en la configuración. Recarga la IU.",
    ["tt_UpdateFrequency"]            = "10000 = ~1 minuto, 50000 = ~5 minutos",
  --[[Control Labels]]
    ["cmd_toggle"]                    = "Mostrar/Ocultar la ventana principal",
    ["cmd_transparency"]              = "Alternar la transparencia básica (0.5 o 1.0)",
    ["cmd_tooltip"]                   = "Alternar si se muestran las descripciones de los botones o no",
    ["ma_EnableTransparency"]         = "Activar Transparencia",
    ["ma_EnableLocalizedSearch"]      = "Activar Búsqueda Local",
    ["ma_EnableMinimenu"]             = "Activar Minimenú",
    ["ma_EnableTooltips"]             = "Activar Tooltips",
    ["ma_ShowChatOutput"]             = "Mostrar Chat Out",
    ["ma_ShowMinimapButton"]          = "Mostrar Botón del Minimapa",
    ["ma_InstantTeleport"]            = "Sin advertencia antes de teletransportarse",
    ["ma_FrameStrataLabel"]           = "Nivel Estrato Marco:",
    ["ma_FrameStrataBackground"]      = "Fondo",
    ["ma_FrameStrataLow"]             = "Bajo",
    ["ma_FrameStrataMedium"]          = "Medio (Predeterminado)",
    ["ma_FrameStrataHigh"]            = "Alto",
    ["ma_FrameStrataDialog"]          = "Diálogo",
    ["ma_FrameStrataFullscreen"]      = "Pantalla Completa",
    ["ma_FrameStrataFullscreenDialog"] = "Diálogo Pantalla Completa",
    ["ma_UpdateFrequencyLabel"]       = "Frecuencia de actualización del gráfico Diff:",
    ["ma_BackgroundColorLabel"]       = "Color de Fondo",
    ["ma_FrameColorLabel"]            = "Color del Marco",
    ["ma_ButtonColorLabel"]           = "Color de Botones",
    ["ma_LinkifierColorLabel"]        = "MangLinkifier",
    ["ma_UpdateChangesButton"]        = "Actualizar Cambios",
  --[[Other]]
    ["ma_ApplyWeatherButton"]         = "Aplicar Clima",
    ["ma_WeatherFine"]                = "Desp",
    ["ma_WeatherFog"]                 = "Niebla",
    ["ma_WeatherRain"]                = "Lluvia",
    ["ma_WeatherSnow"]                = "Nieve",
    ["ma_WeatherSand"]                = "Arena",
    ["msg_transparency_saved"]        = "|cff00ff00AzerothAdmin:|r Configuración de transparencia guardada. Actualiza Cambios o Recarga la IU para aplicar.",
    ["msg_localsearch_saved"]         = "|cff00ff00AzerothAdmin:|r Configuración de cadenas de búsqueda localizadas guardada. Actualiza Cambios o Recarga la IU para aplicar.",
    ["msg_minimenu_saved"]            = "|cff00ff00AzerothAdmin:|r Configuración de minimenú guardada.",
    ["msg_tooltip_saved"]             = "|cff00ff00AzerothAdmin:|r Configuración de descripciones emergentes guardada. Actualiza Cambios o Recarga la IU para aplicar.",
    ["msg_chatoutput_saved"]          = "|cff00ff00AzerothAdmin:|r Configuración de salida del chat guardada.",



--[[Server Tab]]
    ["tabmenu_server"]                = "SERVER", 
    ["tt_ServerButton"]               = "Mostrar información variada del servidor y realizar acciones relacionadas con el servidor.",
  --[[Tooltips]]
    ["tt_AnnounceButton"]             = "Anunciar un mensaje del sistema.",
    ["tt_ShutdownButton"]             = "Apagar el servidor en la cantidad de segundos del campo, si se omite ¡apagar inmediatamente!",
    ["tt_CancelShutdownButton"]       = "Cancelar la cuenta atrás de apagado del servidor.",
  --[[Control Labels]]
    ["ma_AnnounceButton"]             = "Anunciar",
    ["ma_ShutdownButton"]             = "Apagar Servidor",
    ["ma_CancelShutdownButton"]       = "Cancelar Apagado",
    ["ma_ReloadTableButton"]          = "Recargar Tabla",
    ["ma_ReloadScriptsButton"]        = "Recargar Scripts",
    ["ma_UpdateButton"]               = "Actualizar",
    ["ma_ServerLatencyLabel"]         = "|cFF00FF00^Latencia del Servidor:|r",
    ["ma_UpdateDiffLabel"]            = "|cFF00FF00^Diferencia de Actualización:|r",
    ["ma_MeanLabel"]                  = "|cFF00FF00Media:|r",
    ["ma_MedianLabel"]                = "|cFF00FF00Mediana:|r",
    ["ma_PercentilesLabel"]           = "|cFF00FF00Percentiles:|r",
  --[[Other]]
    ["msg_shutdown_time_required"]    = "Por favor introduce el tiempo en segundos antes de usar el apagado del servidor.",
    ["msg_shutdown_confirm"]          = "¿Estás seguro de que quieres apagar el servidor en %s segundos?",



  --[[Tooltips]]
  --[[Control Labels]]
  --[[Other]]

--[[Pop UPs]]
  --[[General]]
  --[[ToolTips]]
    ["tt_ItemButton"]                 = "Mostrar/Ocultar una ventana emergente con la función de buscar objetos y gestionar tus favoritos.",
    ["tt_ItemSetButton"]              = "Mostrar/Ocultar una ventana emergente con la función de buscar sets de objetos y gestionar tus favoritos.",
    ["tt_SpellButton"]                = "Mostrar/Ocultar una ventana emergente con la función de buscar hechizos y gestionar tus favoritos.",
    ["tt_QuestButton"]                = "Mostrar/Ocultar una ventana emergente con la función de buscar misiones y gestionar tus favoritos.",
    ["tt_CreatureButton"]             = "Mostrar/Ocultar una ventana emergente con la función de buscar criaturas y gestionar tus favoritos.",
    ["tt_ObjectButton"]               = "Mostrar/Ocultar una ventana emergente con la función de buscar objetos y gestionar tus favoritos.",
    ["tt_SearchDefault"]              = "Ahora puedes introducir una palabra clave e iniciar la búsqueda.",
    ["tt_SkillButton"]                = "Mostrar/Ocultar una ventana emergente con la función de buscar habilidades y gestionar tus favoritos.",
  --[[Labels]]
    ["ma_PopupErrorTab"]              = "ERROR",
    ["ma_PopupFavoritesTab"]          = "Favoritos",
    ["ma_PopupTab3"]                  = "Pestaña 3",
    ["ma_PopupAmountLabel"]           = "Cantidad:",
    ["ma_PopupInvisibleText"]         = "Invisible",
    ["ma_ItemButton"]                 = "Buscar Objeto",
    ["ma_ItemSetButton"]              = "Buscar Set",
    ["ma_SpellButton"]                = "Buscar Hechizo",
    ["ma_QuestButton"]                = "Buscar Misión",
    ["ma_CreatureButton"]             = "Buscar Criatura",
    ["ma_ObjectButton"]               = "Buscar Objeto",
    ["ma_TeleSearchButton"]           = "Buscar Tele",
    ["ma_MailRecipient"]              = "Destinatario",
    ["ma_Mail"]                       = "Enviar Correo",
    ["ma_Send"]                       = "Enviar",
    ["ma_MailSubject"]                = "Asunto",
    ["ma_MailYourMsg"]                = "¡Aquí tu mensaje!",
    ["ma_SearchButton"]               = "Buscar...",
    ["ma_ResetButton"]                = "Restablecer",
    ["ma_FavAdd"]                     = "Añadir seleccionado",
    ["ma_FavRemove"]                  = "Eliminar seleccionado",
    ["ma_SelectAllButton"]            = "Seleccionar todo",
    ["ma_DeselectAllButton"]          = "Deseleccionar todo",
    ["ma_MailBytesLeft"]              = "Bytes restantes: ",
    ["ma_SkillButton"]                = "Buscar Habilidad",
    ["ma_SkillVar1Button"]            = "Habilidad",
    ["ma_SkillVar2Button"]            = "Habilidad Máx",
    ["ma_ItemVar1Button"]             = "Cantidad",
    ["ma_ObjectVar1Button"]           = "Plant Botín",
    ["ma_ObjectVar2Button"]           = "Tiempo Aparición",
    ["ma_NoFavorites"]                = "¡Actualmente no hay favoritos guardados!",
    ["favoriteResults"]               = "|cFF00FF00Favoritos:|r ",



--[[Not Categorized]]
    ["ma_LearnAllButton"]             = "Todos hechizos",
    ["ma_LearnCraftsButton"]          = "Profesiones y recetas",
    ["ma_LearnGMButton"]              = "GM spells defecto",
    ["ma_LearnClassButton"]           = "Hechizos de clase",
    ["ma_GPSButton"]                  = "GPS",
    ["ma_Online"]                     = "Conectado",
    ["ma_Offline"]                    = "Desconectado",



--[[Linkifier]]
    ["lfer_Spawn"]                    = "Aparecer",
    ["lfer_List"]                     = "Lista",
    ["lfer_Reload"]                   = "Recargar",
    ["lfer_Goto"]                     = "Ir a",
    ["lfer_Move"]                     = "Mover",
    ["lfer_Turn"]                     = "Girar",
    ["lfer_Delete"]                   = "Eliminar",
    ["lfer_Teleport"]                 = "Teletransporte",
    ["lfer_Morph"]                    = "Morfar",
    ["lfer_Add"]                      = "Añadir",
    ["lfer_Remove"]                   = "Eliminar",
    ["lfer_Learn"]                    = "Aprender",
    ["lfer_Unlearn"]                  = "Desaprender",
    ["lfer_Error"]                    = "Error: La cadena de búsqueda coincidió pero ocurrió un error o no se pudo encontrar el tipo"

}
  for k,v in pairs(translations) do L[k] = v end
end
