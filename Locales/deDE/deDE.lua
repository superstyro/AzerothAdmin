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
1. Edit the first un-commented line below, which should resemble: function Return_deDE(). Change
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

local L = LibStub("AceLocale-3.0"):NewLocale("AzerothAdmin", "deDE")
if L then
  local translations = {
--[[General]]
  --[[Tooltips]]
    ["tt_Default"]                    = "Bewegen Sie den Cursor über ein Element, um den Tooltip anzuzeigen!",
    ["tt_LanguageButton"]             = "AzerothAdmin neu laden und ausgewählte Sprache anwenden.",
    ["tt_RefreshButton"]              = "Serverinformationen aktualisieren.",
  --[[Control Labels]]
    ["ma_LanguageButton"]             = "UI neu laden",
    ["ma_RefreshButton"]              = "Aktualisieren",
    ["ma_TopText"]                    = "toptext, you should not see this!",
    ["ma_Top2Text"]                   = "toptext, you should not see this!",
    ["ma_InfoOnlineText"]             = "Spieler Online: ...",
    ["ma_InfoMaxOnlineText"]          = "Maximal Online: ...",
    ["ma_InfoUptimeText"]             = "Server-Laufzeit: ...",
    ["ma_InfoRevisionText"]           = "AzerothCore Revision: ...",
    ["info_revision"]                 = "|cFF00FF00AzerothCore Rev.|r ",
    ["info_platform"]                 = "|cFF00FF00Server-Plattform:|r ",
    ["info_online"]                   = "|cFF00FF00Spieler Online:|r ",
    ["info_maxonline"]                = "|cFF00FF00Maximal Online:|r ",
    ["info_uptime"]                   = "|cFF00FF00Laufzeit:|r ",
    ["ma_CloseWindow"]                = "X",
    ["tt_CloseWindow"]                = "Fenster schließen",
  --[[Other]]
    ["slashcmds"]                     = { "/AzerothAdmin", "/aa" },
    ["lang"]                          = "Deutsch",
    ["realm"]                         = "|cFF00FF00Realm:|r "..GetCVar("realmName"),
    ["char"]                          = "|cFF00FF00Char:|r "..UnitName("player"),
    ["guid"]                          = "|cFF00FF00Guid:|r ",
    ["tickets"]                       = "|cFF00FF00Tickets:|r ",
    ["selectionerror1"]               = "Bitte wählen Sie nur sich selbst, einen anderen Spieler oder nichts aus!",
    ["selectionerror2"]               = "Bitte wählen Sie nur sich selbst oder nichts aus!",
    ["selectionerror3"]               = "Bitte wählen Sie nur einen anderen Spieler aus!",
    ["selectionerror4"]               = "Bitte wählen Sie nur einen NPC aus!",
    ["numbererror"]                   = "Der Wert muss eine Zahl sein!",
    ["searchResults"]                 = "|cFF00FF00Suchergebnisse:|r ",
    ["ma_parameters"]                 = "Parameter:", --Used on multiple tabs



--[[GM tab]]
  --[[Name]]
    ["tabmenu_Main"]                  = "GM",
  --[[Tooltips]]
    ["tt_MainButton"]                 = "AzerothAdmin Hauptfenster umschalten.",
    ["tt_DisplayAccountLevel"]        = "Ihre Account-Stufe anzeigen",
    ["tt_GMOnButton"]                 = "GM-Modus aktivieren.",
    ["tt_GMOffButton"]                = "GM-Modus deaktivieren.",
    ["tt_FlyOnButton"]                = "Flugmodus für den ausgewählten Charakter aktivieren.",
    ["tt_FlyOffButton"]               = "Flugmodus für den ausgewählten Charakter deaktivieren.",
    ["tt_SpectatorOnButton"]           = "Erfordert .gm on, erlaubt dem GM-Charakter /follow bei Mitgliedern der gegnerischen Fraktion. Hinweis: Möglicherweise müssen Sie in eine andere Zone teleportieren / ein neues Gebiet laden, es aktualisiert sich nicht sofort.",
    ["tt_SpectatorOffButton"]          = "Zuschauer-Modus deaktivieren.",
    ["tt_WhispOnButton"]              = "Flüsternachrichten von anderen Spielern akzeptieren.",
    ["tt_WhispOffButton"]             = "Flüsternachrichten von anderen Spielern nicht akzeptieren.",
    ["tt_InvisOnButton"]              = "Unsichtbar machen.",
    ["tt_InvisOffButton"]             = "Sichtbar machen.",
    ["tt_TaxiOnButton"]               = "Alle Flugrouten für den ausgewählten Spieler anzeigen. Dieser Cheat wird beim Ausloggen deaktiviert.",
    ["tt_TaxiOffButton"]              = "Flug-Cheat deaktivieren und bekannte Flugrouten des Spielers wiederherstellen.",
    ["tt_SpeedSlider"]                = "Geschwindigkeit für den ausgewählten Charakter erhöhen oder verringern.",
    ["tt_ScaleSlider"]                = "Größe für den ausgewählten Charakter erhöhen oder verringern.",
    ["tt_instakill"]                  = "Wenn aktiviert, tötet das Anklicken einer feindlichen Kreatur diese sofort.",
    ["tt_ScreenButton"]               = "Screenshot erstellen.",
    ["tt_BankButton"]                 = "Bank anzeigen.",
    ["tt_Dismount"]                   = "Absteigen, wenn Sie aufgesessen sind",
    ["tt_SetJail_A_Button"]           = "Setzt den Standort des Allianz-Gefängnisses auf Ihre aktuelle Position.",
    ["tt_SetJail_H_Button"]           = "Setzt den Standort des Horden-Gefängnisses auf Ihre aktuelle Position.",
    ["tt_N"]                          = "Nach Norden navigieren",
    ["tt_S"]                          = "Nach Süden navigieren",
    ["tt_E"]                          = "Nach Osten navigieren",
    ["tt_W"]                          = "Nach Westen navigieren",
  --["tt_chatonbutton"]               = "Turn GM Chat ON",
  --["tt_chatoffbutton"]              = "Turn GM Chat OFF",
    ["tt_waterwalkonbutton"]          = "Wasserwandeln für die ausgewählte Kreatur aktivieren"  ,
    ["tt_watewrwalkoffbutton"]        = "Wasserwandeln für die ausgewählte Kreatur deaktivieren",
    ["tt_DisplayAccountLvl"]          = "Ihre Account-Stufe anzeigen.",
    ["tt_SpeedSliderReset"]           = "Geschwindigkeit auf 1.0 zurücksetzen",
    ["tt_ScaleSliderReset"]           = "Größe auf 1.0 zurücksetzen",
    ["tt_gmnotifybutton"]             = "Sendet Nachricht $message an alle Online-GMs [[Parameter: $message]]",
    ["tt_gmingamebutton"]             = "Zeigt eingeloggte GMs an.",
    ["tt_gmlistbutton"]               = "Zeigt die GM-Accounts auf diesem Server an",
    ["tt_petcreatebutton"]            = "Macht das ausgewählte TIER zu Ihrem Begleiter.",
    ["tt_petlearnbutton"]             = "Lehrt Ihrem Begleiter einen Zauber [[Parameter: #SPELLID]]",
    ["tt_petunlearnbutton"]           = "Entfernt einen Zauber von Ihrem Begleiter [[Parameter: #SPELLID]]",
    ["tt_pettpbutton"]                = "Ändert Trainingspunkte des Begleiters [[Parameter: #points]]",
    ["tt_lookuptaxibutton"]           = "Sucht einen Flugpunkt [[Parameter: $Areanamepart]]",
    ["tt_gotaxinodebutton"]           = "Teleportiert zum angegebenen Flugpunkt [[Parameter: #taxinode]]",
    ["tt_gotriggerbutton"]            = "Teleportiert zum angegebenen Gebietsauslöser [[Parameter: #trigger_id]]",
    ["tt_goxybutton"]                 = "Teleportiert zu den angegebenen Koordinaten auf Boden-/Wasserebene auf MapID. Wenn MapID weggelassen, aktuelle Karte [[Parameter: #x #y [#mapid]]]",
    ["tt_goxyzbutton"]                = "Teleportiert zu den angegebenen Koordinaten auf #z Ebene auf MapID. Wenn MapID weggelassen, aktuelle Karte [[Parameter: #x #y #z [#mapid]]]",
    ["tt_gozonexybutton"]             = "Teleportiert zu den angegebenen Koordinaten auf Boden-/Wasserebene in ZoneID. Wenn ZoneID weggelassen, aktuelle Zone [[Parameter: #x #y [#zoneid]]]",
    ["tt_lookupzonebutton"]           = "Sucht eine Zone. [[Parameter: $Areanamepart]]",
    ["tt_castbutton"]                 = "Wirkt einen Zauber. [[Parameter: #SpellID]]",
    ["tt_castbackbutton"]             = "Ausgewählte Kreatur wirkt Zauber [SpellID] auf SIE. [[Parameter: #SpellID]]",
    ["tt_castdistbutton"]             = "Sie wirken einen Zauber [SpellID] in Entfernung [#Dist]. [[Parameter: #SpellID #Dist]]",
    ["tt_castselfbutton"]             = "Ausgewählte Kreatur wirkt Zauber [SpellID] auf sich selbst. [[Parameter: #SpellID]]",
    ["tt_casttargetbutton"]           = "Ausgewählte Kreatur wirkt Zauber [SpellID] auf ihr Ziel. [[Parameter: #SpellID]]",
    ["tt_gmclearbutton"]              = "Löscht das Parameterfeld.",
    ["tt_listitembutton"]             = "Listet alle Vorkommen von [#itemID] auf. [[Parameter: #ItemID]]",
    ["tt_acctaddonbutton"]            = "Setzt $account auf #addon (0=WoW, 1=TBC, 2=WotLK) [[Parameter: $accountname #addon]]",
    ["tt_acctgmlvlbutton"]            = "Setzt $account auf #gmlevel (0=Spieler, 1=Helfer, 2=Assistent, 3=GM, 4=Admin) [[Parameter: $accountname #gmlevel]]",
    ["tt_acctpasswdbutton"]           = "Setzt Passwort für $account [[Parameter: $accountname $password $password]]",
  --[[Control Labels]]
    ["ma_OffButton"]                  = "Aus",
    ["ma_displaylevelbutton"]         = "Account-Stufe anzeigen",
    ["ma_GMOnButton"]                 = "GM-Modus an",
    ["ma_FlyOnButton"]                = "Flugmodus an",
    ["ma_SpectatorOnButton"]           = "Zuschauer-Modus an",
    ["ma_WhisperOnButton"]            = "Flüstern an",
    ["ma_InvisOnButton"]              = "Unsichtbarkeit an",
    ["ma_TaxiOnButton"]               = "Taxi-Cheat an",
    ["ma_instakill"]                  = "Kreaturen sofort töten",
    ["ma_ScreenshotButton"]           = "Screenshot",
    ["ma_BankButton"]                 = "Bank",
    ["ma_DismountButton"]             = "Absteigen",
    ["ma_SetJail_A_Button"]           = "Gefängnis A setzen",
    ["ma_SetJail_H_Button"]           = "Gefängnis H setzen",
    ["gridnavigator"]                 = "Raster-Navigator",
    ["N"]                             = "N", --Abbreviation for North
    ["S"]                             = "S", --Abbreviation for South
    ["E"]                             = "O", --Abbreviation for East (Osten)
    ["W"]                             = "W", --Abbreviation for West
    ["ma_chatbutton"]                 = "GM-Chat an",
    ["ma_waterwalkbutton"]            = "Wasserwandeln an",
    ["ma_gmnotify"]                   = "GM benachrichtigen",
    ["ma_gmingame"]                   = "GMs im Spiel",
    ["ma_gmlist"]                     = "GM-Liste",
    ["ma_petcreate"]                  = "Begleiter erstellen",
    ["ma_petlearn"]                   = "Begleiter lernen",
    ["ma_petunlearn"]                 = "Begleiter verlernen",
    ["ma_pettp"]                      = "Begleiter TP",
    ["ma_lookuptaxi"]                 = "Flugpunkt suchen",
    ["ma_gotaxinode"]                 = "Zu Flugpunkt",
    ["ma_gotrigger"]                  = "Zu Auslöser",
    ["ma_goxy"]                       = "Zu XY",
    ["ma_goxyz"]                      = "Zu XYZ",
    ["ma_gozonexy"]                   = "Zu Zone XY",
    ["ma_lookupzone"]                 = "Zone suchen",
    ["ma_cast"]                       = "Wirken",
    ["ma_castback"]                   = "Zurückwirken",
    ["ma_castdist"]                   = "Distanz wirken",
    ["ma_castself"]                   = "Selbst wirken",
    ["ma_casttarget"]                 = "Ziel wirken",
    ["ma_listitem"]                   = "Gegenstand auflisten",
    ["ma_GmClear"]                    = "Parameter löschen",
    ["ma_acctaddon"]                  = "Account Addon",
    ["ma_acctgmlvl"]                  = "Account GM-Stufe",
    ["ma_acctpasswd"]                 = "Account Passwort",
    ["ma_MiniMenuGM"]                 = "GM",
    ["ma_MiniMenuChar"]               = "Ch",
    ["ma_MiniMenuNPC"]                = "NPC",
    ["ma_MiniMenuGO"]                 = "GO",
    ["ma_MiniMenuTele"]               = "Te",
    ["ma_MiniMenuTicket"]             = "Ti",
    ["ma_MiniMenuMisc"]               = "Mi",
    ["ma_MiniMenuServer"]             = "Sv",
    ["ma_MiniMenuLog"]                = "Lo",
    ["ma_MiniMenuRevive"]             = "BELEBEN!",
  --[[Other]]



--[[Char Tab]]
  --[[Name]]
    ["tabmenu_Char"]                  = "CHAR",
    ["tt_CharButton"]                 = "Fenster mit charakterspezifischen Aktionen umschalten.",
  --[[Tooltips]]
    ["tt_RotateLeft"]                 = "Nach links drehen.",
    ["tt_RotateRight"]                = "Nach rechts drehen.",
    ["tt_killbutton"]                 = "Tötet ausgewählte Kreatur/Spieler",
    ["tt_reviveplayer"]               = "Belebt den ausgewählten Spieler wieder",
    ["tt_saveplayer"]                 = "Speichert den Charakter des ausgewählten Spielers",
    ["tt_KickButton"]                 = "Wirft den ausgewählten Spieler vom Server.",
    ["tt_CooldownButton"]             = "Entfernt alle Zauber-Abklingzeiten des ausgewählten Charakters.",
    ["tt_GUIDButton"]                 = "Zeigt die GUID des ausgewählten Charakters an.",
    ["tt_PinfoButton"]                = "Informationen über den ausgewählten SPIELER abrufen.",
    ["tt_DistanceButton"]             = "Entfernung zur ausgewählten Kreatur ermitteln.",
    ["tt_RecallButton"]               = "Ruft ausgewählten Spieler zum Ort vor dem letzten Teleport zurück.",
    ["tt_DemorphButton"]              = "Entfernt alle Verwandlungen des ausgewählten Charakters.",
    ["tt_learnlangbutton"]            = "Ausgewählte Zauber lernen",
    ["tt_modifybutton"]               = "Ausgewähltes Attribut um den eingegebenen Betrag ändern",
    ["tt_resetbutton"]                = "Ausgewähltes Attribut zurücksetzen",
    ["tt_modelzoominbutton"]          = "Ausgewähltes Modell vergrößern",
    ["tt_modelzoomoutbutton"]         = "Ausgewähltes Modell verkleinern",
    ["tt_charbindsight"]              = "Bindet Ihre Sicht an die ausgewählte Einheit",
    ["tt_charunbindsight"]            = "Hebt Sichtbindung zur ausgewählten Einheit auf",
    ["tt_charrename"]                 = "Ermöglicht Umbenennung des Charakters beim nächsten Login",
    ["tt_charcustomize"]              = "Ermöglicht Anpassung des Charakters beim nächsten Login",
    ["tt_charchangerace"]             = "Ermöglicht Rassenwechsel des Charakters beim nächsten Login",
    ["tt_charchnagefaction"]          = "Ermöglicht Fraktionswechsel des Charakters beim nächsten Login",
    ["tt_charcombatstop"]             = "Stoppt Kampf für den ausgewählten Charakter (oder Sie selbst)",
    ["tt_charmaxskill"]               = "Setzt Fertigkeiten des Charakters auf Maximalwert für Stufe",
    ["tt_charfreeze"]                 = "Friert Zielspieler ein und deaktiviert dessen Chat",
    ["tt_charunfreeze"]               = "Hebt Einfrieren des Spielers auf und stellt Chat wieder her",
    ["tt_charlistdeleted"]            = "Listet gelöschte Charaktere im Chatfenster auf",
    ["tt_chardeletedrestore"]         = "Parameter= #guid|$name [$newname] [#new account] [[Dieser Befehl ist in Entwicklung]",
    ["tt_charpossess"]                = "Übernimmt dauerhaft die Kontrolle über die ausgewählte Kreatur",
    ["tt_charunpossess"]              = "Gibt Kontrolle über die ausgewählte Kreatur auf",
    ["tt_charrecall"]                 = "Ruft den Spieler zur letzten Teleportposition zurück",
    ["tt_charrepair"]                 = "Repariert Rüstung und Waffen des ausgewählten Spielers",
    ["tt_banbutton"]                  = "Parameter= <account|ip|character> $NameOrIp <-1|xxdyyhzzm> $reason [[Account/IP sperren & kicken. -1=dauerhaft, oder String wie 4d3h24m16s]]",
    ["tt_gonamebutton"]               = "Parameter= $charactername [[Teleportiert Sie zum angegebenen Charakter]]",
    ["tt_createguildbutton"]          = "Parameter= $GuildLeaderName $GuildName [[Erstellt Gilde $GuildName mit $GuildLeaderName als Anführer]]",
    ["tt_teleaddbutton"]              = "Parameter= $Name [[Fügt Teleportort mit Namen $Name für Ihre aktuelle Position hinzu]]",
    ["tt_baninfobutton"]              = "Parameter= <account|ip|character> [[Zeigt detaillierte Informationen über Sperren des angegebenen Accounts/IP/Charakters]]",
    ["tt_groupgobutton"]              = "Parameter= $charactername [[Teleportiert den angegebenen Charakter und seine Gruppe zu Ihnen]]",
    ["tt_guildinvitebutton"]          = "Parameter= $charactername $guildname [[Fügt $charactername der Gilde $guildname hinzu]]",
    ["tt_teledelbutton"]              = "Parameter= $telename [[Entfernt Ort $telename aus der .tele-Ortsliste]]",
    ["tt_banlistbutton"]              = "Parameter= <account|ip> $NameOrIp [[Sucht und gibt spezifische Sperren zurück, die den Parametern entsprechen]]",
    ["tt_namegobutton"]               = "Parameter= $charactername [[Teleportiert den angegebenen Charakter zu Ihnen]]",
    ["tt_guildrankbutton"]            = "Parameter= $charactername #ranknumber [[Setzt den angegebenen Charakter auf den angegebenen Rang in seiner Gilde]]",
    ["tt_telegroupbutton"]            = "Parameter= $telename [[Teleportiert den **ausgewählten** Charakter und seine Gruppe zum .tele-Ort $telename]]",
    ["tt_unbanbutton"]                = "Parameter= <account|ip|character> $NameOrIp [[Hebt Sperre des angegebenen Accounts/IP/Charakters auf]]",
    ["tt_guilddeletebutton"]          = "Parameter= $guildname [[Löscht die angegebene Gilde]]",
    ["tt_guilduninvitebutton"]        = "Parameter= $charactername [[Wirft den angegebenen Charakter aus seiner Gilde]]",
    ["tt_telenamebutton"]             = "Parameter= $charactername $telename [[Teleportiert $charactername zu $telename]]",
    ["tt_mutebutton"]                 = "Parameter= $charactername #minutes [[Deaktiviert Chat für den gesamten Account von $charactername für #minutes Minuten]]",
    ["tt_charmorphbutton"]            = "Parameter= #DisplayID [[Geben Sie die DisplayID der gewünschten Verwandlung ein]]",
    ["tt_charaurabutton"]             = "Parameter= #AuraID [[Geben Sie die AuraID der gewünschten Aura ein]]",
    ["tt_charunaurabutton"]           = "Parameter= #AuraID [[Geben Sie die AuraID der zu entfernenden Aura ein]]",
    ["tt_JailAButton"]                = "Parameter= $charactername [[Sendet den Charakter zum Allianz-Gefängnis]]",
    ["tt_JailHButton"]                = "Parameter= $charactername [[Sendet den Charakter zum Horden-Gefängnis]]",
    ["tt_UnJailButton"]               = "Parameter= $charactername [[Befreit den Charakter aus dem Gefängnis]]",
    ["tt_UnMuteButton"]               = "Hebt Stummschaltung von $player auf.",
    ["tt_DamageButton"]               = "Parameter= #amount Schadensmenge, die auf **ausgewählte** Kreatur/Spieler angewendet wird",
    ["tt_HideAreaButton"]             = "Verbirgt #areaid vom **ausgewählten** Spieler.",
    ["tt_ShowAreaButton"]             = "Zeigt #areaid dem **ausgewählten** Spieler.",
  --[[Control Labels]]
    ["ma_KillButton"]                 = "Töten",
    ["ma_ReviveButton"]               = "Wiederbeleben",
    ["ma_SaveButton"]                 = "Speichern",
    ["ma_KickButton"]                 = "Kicken",
    ["ma_CooldownButton"]             = "Abklingzeit",
    ["ma_GUIDButton"]                 = "GUID zeigen",
    ["ma_PinfoButton"]                = "SPIELER-Info",
    ["ma_DistanceButton"]             = "Entfernung",
    ["ma_RecallButton"]               = "Zurückrufen",
    ["ma_DemorphButton"]              = "Verwandlung aufheben",
    ["ma_LearnLangButton"]            = "Alle Sprachen",
    ["ma_Learn"]                      = "Lernen",
    ["ma_Modify"]                     = "Ändern",
    ["ma_Reset"]                      = "Zurücksetzen",
    ["ma_CharBindsight"]              = "Sicht binden",
    ["ma_CharUnBindsight"]            = "Sicht lösen",
    ["ma_charrename"]                 = "Umbenennen",
    ["ma_charcustomize"]              = "Anpassen",
    ["ma_charchangerace"]             = "Rasse ändern",
    ["ma_charchnagefaction"]          = "Fraktion ändern",
    ["ma_charcombatstop"]             = "Kampf stoppen",
    ["ma_charmaxskill"]               = "Max. Fertigkeit",
    ["ma_charfreeze"]                 = "Einfrieren",
    ["ma_charunfreeze"]               = "Auftauen",
    ["ma_charlistdeleted"]            = "Gel. Char auflisten",
    ["ma_chardeletedrestore"]         = "Gel. Char wiederherstellen",
    ["ma_charpossess"]                = "Übernehmen",
    ["ma_charunpossess"]              = "Freigeben",
    ["ma_charrecall"]                 = "Zurückrufen",
    ["ma_charrepair"]                 = "Reparieren",
    ["ma_banbutton"]                  = "Sperren",
    ["ma_gonamebutton"]               = "Erscheinen",
    ["ma_createguildbutton"]          = "G Erstellen",
    ["ma_teleaddbutton"]              = "Tele hinzufügen",
    ["ma_baninfobutton"]              = "Sperr-Info",
    ["ma_groupgobutton"]              = "Gruppe beschwören",
    ["ma_guildinvitebutton"]          = "G Einladen",
    ["ma_teledelbutton"]              = "Tele löschen",
    ["ma_banlistbutton"]              = "Sperrliste",
    ["ma_namegobutton"]               = "Beschwören",
    ["ma_guildrankbutton"]            = "G Rang",
    ["ma_telegroupbutton"]            = "TeleGruppe",
    ["ma_unbanbutton"]                = "Entsperren",
    ["ma_guilddeletebutton"]          = "G Löschen",
    ["ma_guilduninvitebutton"]        = "G Rauswerfen",
    ["ma_telenamebutton"]             = "TeleName",
    ["ma_mutebutton"]                 = "Stumm",
    ["ma_Aura"]                       = "Aura",
    ["ma_UnAura"]                     = "Aura aufheben",
    ["ma_Morph"]                      = "Verwandeln",
    ["ma_JailAButton"]                = "Gefängnis (A)",
    ["ma_JailHButton"]                = "Gefängnis (H)",
    ["ma_UnJailButton"]               = "Befreien",
    ["ma_UnMuteButton"]               = "Stummsch. aufheben",
    ["ma_QuestAddButton"]             = "Quest hinzuf.",
    ["ma_QuestCompleteButton"]        = "Quest abschl.",
    ["ma_QuestRemoveButton"]          = "Quest entf.",
    ["ma_DamageButton"]               = "Schaden",
    ["ma_HideAreaButton"]             = "Gebiet verbergen",
    ["ma_ShowAreaButton"]             = "Gebiet zeigen",
    ["ma_CharRotateLeft"]             = "<<=",
    ["ma_CharRotateRight"]            = "=>>",
    ["ma_CharZoomIn"]                 = "+",
    ["ma_CharZoomOut"]                = "-",
  --[[Other]]
    ["ma_LevelUp"]                    = "Stufe erhöhen",
    ["ma_LevelDown"]                  = "Stufe senken",
    ["ma_Money"]                      = "Geld",
    ["ma_Energy"]                     = "Energie",
    ["ma_Rage"]                       = "Wut",
    ["ma_Mana"]                       = "Mana",
    ["ma_Healthpoints"]               = "Lebenspunkte",
    ["ma_Talents"]                    = "Talente",
    ["ma_Stats"]                      = "Attribute",
    ["ma_Spells"]                     = "Zauber",
    ["ma_Honor"]                      = "Ehre",
    ["ma_Level"]                      = "Stufe",
    ["ma_AllLang"]                    = "Alle Sprachen",
    ["ma_AllGMSpells"]                = "Alle GM-Zauber",
    ["ma_AllCrafts"]                  = "Alle Berufe",
    ["ma_AllDefault"]                 = "Alle Standard",
    ["ma_AllMyClass"]                 = "Alle meiner Klasse",
    ["ma_AllMyPetTalents"]            = "Alle Begleiter-Talente",
    ["ma_AllMySpells"]                = "Alle meine Zauber",
    ["ma_AllMyTalents"]               = "Alle meine Talente",
    ["ma_AllRecipesAlchemy"]          = "Alle Rezepte (Alchemie)",
    ["ma_AllRecipesBlacksmithing"]    = "Alle Rezepte (Schmiedekunst)",
    ["ma_AllRecipesCooking"]          = "Alle Rezepte (Kochkunst)",
    ["ma_AllRecipesEnchanting"]       = "Alle Rezepte (Verzauberkunst)",
    ["ma_AllRecipesEngineering"]      = "Alle Rezepte (Ingenieurskunst)",
    ["ma_AllRecipesFirstAid"]         = "Alle Rezepte (Erste Hilfe)",
    ["ma_AllRecipesInscription"]      = "Alle Rezepte (Inschriftenkunde)",
    ["ma_AllRecipesJewelcrafting"]    = "Alle Rezepte (Juwelenschleifen)",
    ["ma_AllRecipesLeatherworking"]   = "Alle Rezepte (Lederverarbeitung)",
    ["ma_AllRecipesTailoring"]        = "Alle Rezepte (Schneiderei)",
    ["ma_resetallspells"]             = "Zauber für ALLE",
    ["ma_resetalltalents"]            = "Talente für ALLE",
    ["ma_achievements"]               = "Erfolge",
    ["ma_AllSpeeds"]                  = "Alle Geschwindigkeiten",
    ["ma_Arena"]                      = "Arena",
    ["ma_BackWalk"]                   = "Rückwärtslauf",
    ["ma_Drunk"]                      = "Betrunken",
    ["ma_FlySpeed"]                   = "Fluggeschwindigkeit",
    ["ma_Gender"]                     = "Geschlecht",
    ["ma_MountSpeed"]                 = "Reitgeschwindigkeit",
    ["ma_Phase"]                      = "Phase",
    ["ma_RunicPower"]                 = "Runenmacht",
    ["ma_Speed"]                      = "Geschwindigkeit",
    ["ma_StandState"]                 = "Standzustand",
    ["ma_SwimSpeed"]                  = "Schwimmgeschwindigkeit",
    ["ma_TalentPoints"]               = "Talentpunkte",
    -- languages
    ["Common"]                        = "Common",
    ["Orcish"]                        = "Orcish",
    ["Taurahe"]                       = "Taurahe",
    ["Darnassian"]                    = "Darnassian",
    ["Dwarvish"]                      = "Dwarvish",
    ["Thalassian"]                    = "Thalassian",
    ["Demonic"]                       = "Demonic",
    ["Draconic"]                      = "Draconic",
    ["Titan"]                         = "Titan",
    ["Kalimag"]                       = "Kalimag",
    ["Gnomish"]                       = "Gnomish",
    ["Troll"]                         = "Troll",
    ["Gutterspeak"]                   = "Gutterspeak",
    ["Draenei"]                       = "Draenei",



--[[NPC Tab]]
  --[[Name]]
    ["tabmenu_NPC"]                   = "NPC",
    ["tt_NpcButton"]                  = "Fenster mit NPC-bezogenen Funktionen umschalten.",
  --[[Tooltips]]
    ["tt_NPCRotateLeft"]              = "Nach links drehen",
    ["tt_NPCRotateRight"]             = "Nach rechts drehen",
    ["tt_NPCKillButton"]              = "Tötet das ausgewählte Ziel",
    ["tt_npcrespawn"]                 = "Lässt ausgewählte Kreatur respawnen, oder wenn keine ausgewählt, alle Kreaturen in der Nähe",
    ["tt_NPCDistanceButton"]          = "Entfernung zur ausgewählten Kreatur ermitteln.",
    ["tt_NPCGUIDButton"]              = "Zeigt die GUID des ausgewählten Charakters an.",
    ["tt_NPCInfoButton"]              = "Informationen über den ausgewählten NPC abrufen.",
    ["tt_NPCDemorph"]                 = "Hebt Verwandlung des ausgewählten NPCs auf",
    ["tt_NPCMove"]                    = "Bewegt die ausgewählte Kreatur zu Ihrer Position",
    ["tt_NPCDel"]                     = "Löscht die ausgewählte Kreatur",
    ["tt_getguid"]                    = "Ermittelt GUID und ID der ausgewählten Kreatur",
    ["tt_NPCClear"]                   = "Löscht alle NPC-Infofelder (GUID, NPC-ID, Display-ID, Entfernung)",
    ["tt_NPCAdd"]                     = "Fügt eine Kopie dieses NPCs an Ihrer aktuellen Position hinzu.",
    ["tt_NPCGo"]                      = "Teleportiert Sie zum NPC im GUID-Feld",
    ["tt_NPCMorph"]                   = "Parameter= #DisplayID [[Geben Sie die DisplayID der gewünschten Verwandlung ein]]",
    ["tt_NPCSay"]                     = "Lässt ausgewählten NPC [Parameter] sagen",
    ["tt_NPCYell"]                    = "Lässt ausgewählten NPC [Parameter] rufen",
    ["tt_NPCAura"]                    = "Parameter= #AuraID [[Geben Sie die AuraID der gewünschten Aura ein]]",
    ["tt_NPCUnaura"]                  = "Parameter= #AuraID [[Geben Sie die AuraID der zu entfernenden Aura ein]]",
    ["tt_PlayEmote"]                  = "Emote aus Liste links abspielen",
    ["tt_GPSButton"]                  = "Zeigt Koordinaten für den ausgewählten Charakter an.",
    ["tt_DisplayUp"]                  = "Erhöht NPC DisplayID um 1",
    ["tt_DisplayDown"]                = "Verringert NPC DisplayID um 1",
    ["tt_IDUp"]                       = "Erhöht NPC-ID um 1",
    ["tt_IDDown"]                     = "Verringert NPC-ID um 1",
    ["tt_npcmodelzoominbutton"]       = "Ausgewähltes Modell vergrößern",
    ["tt_npcmodelzoomoutbutton"]      = "Ausgewähltes Modell verkleinern",
    ["tt_npcbindsight"]               = "Bindet Ihre Sicht an den ausgewählten NPC",
    ["tt_npcunbindsight"]             = "Hebt Sichtbindung zum ausgewählten NPC auf",
    ["tt_npccometome"]                = "Zwingt den ausgewählten NPC zu Ihrer Position zu kommen. Position wird NICHT in DB gespeichert.",
    ["tt_npcpossess"]                 = "Übernimmt dauerhaft die Kontrolle über die ausgewählte Kreatur",
    ["tt_npcunpossess"]               = "Gibt Kontrolle über die ausgewählte Kreatur auf",
    ["tt_NPCFreezeButton"]            = "Stoppt Bewegung des ausgewählten NPCs, speichert Wegpunkte",
    ["tt_NPCFreezeDelButton"]         = "Stoppt Bewegung des ausgewählten NPCs, speichert Wegpunkte NICHT",
    ["tt_WayEndAdd"]                  = "Fügt einen Wegpunkt am Ende des bestehenden Stapels hinzu",
    ["tt_NPCAddWay"]                  = "Fügt einen Wegpunkt zum Stapel hinzu. Kreaturen-GUID muss im Feld unten sein",
    ["tt_WayMAdd"]                    = "Fügt einen Wegpunkt zum bestehenden Bewegungsstapel der Kreatur hinzu",
    ["tt_WayModifyDel"]               = "Löscht den ausgewählten Wegpunkt aus dem Bewegungsstapel der Kreatur",
    ["tt_WayShow0"]                   = "Hört auf, Wegpunkte für ausgewählte Kreatur anzuzeigen.",
    ["tt_WayShow1"]                   = "Zeigt Wegpunkte für ausgewählte Kreatur an.",
    ["tt_NPCAdd_WayShowOn"]           = "Zeigt Wegpunkte für die ausgewählte Kreatur an",
    ["tt_NPCUnFreeze_RandomButton"]   = "Erlaubt zufällige Bewegung des ausgewählten NPCs.",
    ["tt_NPCUnFreeze_WayButton"]      = "Erlaubt Wegpunktbewegung des ausgewählten NPCs.",
    ["tt_MoveStackButton"]            = "Zeigt Bewegungsstapel des ausgewählten Charakters an.",
  --[[Control Labels]]
    ["Morph"]                         = "Verwandeln",
    ["ma_NPCKillButton"]              = "Töten",
    ["ma_Respawn"]                    = "Respawn",
    ["ma_NPCDistanceButton"]          = "Entfernung",
    ["ma_NPCGUIDButton"]              = "GUID zeigen",
    ["ma_NPCInfoButton"]              = "NPC-Info",
    ["ma_NPCDemorph"]                 = "Verwandlung aufheben",
    ["ma_NPCMove"]                    = "NPC bewegen",
    ["ma_NPCDel"]                     = "NPC löschen",
    ["ma_getguid"]                    = "GUID abrufen",
    ["ma_NPCAdd"]                     = "NPC hinzufügen",
    ["ma_NPCGo"]                      = "Zu NPC",
    ["ma_NPCMorph"]                   = "Verwandeln",
    ["ma_NPCSay"]                     = "NPC sagen",
    ["ma_NPCYell"]                    = "NPC rufen",
    ["ma_NPCAura"]                    = "NPC Aura",
    ["ma_NPCUnAura"]                  = "NPC Aura aufheben",
    ["ma_PlayEmote1"]                 = "Emote",
    ["ma_PlayEmote2"]                 = "Emote",
    ["ma_DistanceBox"]                = "Entfernung",
    ["ma_NPCBindsight"]               = "Sicht binden",
    ["ma_NPCUnBindsight"]             = "Sicht lösen",
    ["ma_NPCComeToMe"]                = "Zu mir",
    ["ma_npcpossess"]                 = "Übernehmen",
    ["ma_npcunpossess"]               = "Freigeben",
    ["ma_WayShow1"]                   = "Wegpkt. an",
    ["ma_WayShow0"]                   = "Wegpkt. aus",
    ["ma_MoveStackButton"]            = "Bewegungen zeigen",
    ["ma_NPCFreezeButton"]            = "NPC anhalten",
    ["ma_WayAllDel"]                  = "NPC anhalten & löschen",
    ["ma_WayMAdd"]                    = "Wegpkt. hinzuf.",
    ["ma_NPCUnFreeze_RandomButton"]   = "Bew. zufällig",
    ["ma_NPCUnFreeze_WayButton"]      = "Bew. Wegpkt.",
    ["ma_WayMDel"]                    = "Wegpkt. löschen",
    ["ma_WayEndAdd"]                  = "Wegpkt. Ende hinzuf.",
    ["ma_WayAdd"]                     = "Wegpkt. hinzuf.",
    ["ma_WayShow"]                    = "Wegpkt. zeigen",
    ["ma_NPCRotateLeft"]              = "<<=",
    ["ma_NPCRotateRight"]             = "=>>",
    ["ma_NPCZoomIn"]                  = "+",
    ["ma_NPCZoomOut"]                 = "-",
    ["ma_NPCDisplayIDLabel"]          = "Display-ID:",
    ["ma_NPCIDLabel"]                 = "NPC-ID:",
    ["ma_NPCGUIDLabel"]               = "GUID:",
    ["ma_NPCDisplayDown"]             = "<<",
    ["ma_NPCDisplayUp"]               = ">>",
    ["ma_NPCIDUp"]                    = ">>",
    ["ma_NPCClearButton"]             = "Löschen",
  --[[Other]]



--[[GObjects Tab]]
  --[[Name]]
    ["tabmenu_GO"]                    = "OBJ",
    ["tt_GOButton"]                   = "Fenster mit Spielobjekt-Funktionen umschalten.",
  --[[Tooltips]]
    ["tt_ObjGo"]                      = "Zum ausgewählten Objekt gehen",
    ["tt_ObjAdd"]                     = "Kopie des anvisierten Objekts an Ihrer Position und Ausrichtung hinzufügen",
    ["tt_ObjMove"]                    = "Anvisiertes Objekt zu Ihrer Position bewegen",
    ["tt_ObjTurn"]                    = "Dreht das anvisierte Objekt entsprechend Ihrer Ausrichtung",
    ["tt_ObjDel"]                     = "Löscht das anvisierte Objekt",
    ["tt_ObjNear"]                    = "Gibt Informationen über Objekte in Ihrer Nähe zurück",
    ["tt_ObjTarget"]                  = "Zielt auf das nächste Objekt und zeigt Informationen an",
    ["tt_ObjActivate"]                = "Aktiviert das anvisierte Objekt",
    ["tt_ObjAddTemp"]                 = "Fügt eine temporäre Kopie des Objekts hinzu",
    ["tt_ObjInfo"]                    = "Ruft erweiterte Informationen über das Objekt ab",
    ["tt_ObjSetPhase"]                = "Setzt die Phase des Objekts",
    ["tt_ObjShowModel"]               = "Modell laden und anzeigen",
    ["tt_ObjUnloadModel"]             = "Modelle entladen um Speicher freizugeben",
    ["tt_ObjMoveForward"]             = "Vorwärts bewegen",
    ["tt_ObjMoveBack"]                = "Rückwärts bewegen",
    ["tt_ObjMoveLeft"]                = "Nach links bewegen",
    ["tt_ObjMoveRight"]               = "Nach rechts bewegen",
    ["tt_ObjMoveUp"]                  = "Nach oben bewegen",
    ["tt_ObjMoveDown"]                = "Nach unten bewegen",
    ["tt_ObjSpawnHere"]               = "Hier spawnen",
  --[[Control Labels]]
    ["ma_OBJGo"]                      = "Zu Obj",
    ["ma_OBJAdd"]                     = "Obj hinzuf.",
    ["ma_OBJMove"]                    = "Obj bewegen",
    ["ma_OBJTurn"]                    = "Obj drehen",
    ["ma_OBJDel"]                     = "Obj löschen",
    ["ma_OBJNear"]                    = "Obj in Nähe",
    ["ma_OBJTarget"]                  = "Obj anvisieren",
    ["ma_OBJActivate"]                = "Obj aktivieren",
    ["ma_OBJAddTemp"]                 = "Obj temp. hinzuf.",
    ["ma_OBJInfo"]                    = "Obj-Info",
    ["ma_OBJSetPhase"]                = "Obj-Phase",
    ["ma_GOGUIDLabel"]                = "GUID",
    ["ma_GOEntryIDLabel"]             = "EntryID",
    ["ma_GODisplayIDLabel"]           = "DisplayID",
    ["ma_GORangeLabel"]               = "Reichweite",
    ["ma_GOAddOnMoveLabel"]           = "Bei Bewegung hinzuf.",
    ["ma_GOMoveOnMoveLabel"]          = "Bei Bewegung bewegen",
    ["ma_GOMoveDistancesLabel"]       = "Bewegungsdistanzen",
    ["ma_GOFwdBackLabel"]             = "Vor/Zurück:",
    ["ma_GOLeftRightLabel"]           = "Links/Rechts:",
    ["ma_GOUpDownLabel"]              = "Hoch/Runter:",
    ["ma_GORotateLeft"]               = "<<",
    ["ma_GORotateRight"]              = ">>",
    ["ma_GOZoomIn"]                   = "+",
    ["ma_GOZoomOut"]                  = "-",
    ["ma_GOMoveForward"]              = "VOR",
    ["ma_GOMoveLeft"]                 = "LINKS",
    ["ma_GOMoveRight"]                = "RECHTS",
    ["ma_GOMoveBack"]                 = "ZURÜCK",
    ["ma_GOSpawnHere"]                = "HIER",
    ["ma_GOMoveUp"]                   = "HOCH",
    ["ma_GOMoveDown"]                 = "RUNTER",
    ["ma_GOShowButton"]               = "Anzeigen",
    ["ma_GOUnloadButton"]             = "Entladen",
  --[[Other]]
    ["msg_account_lock_confirm"]      = "Seid Ihr sicher, dass Ihr diesen Account %s wollt?",
    ["msg_acct_create_confirm"]       = "Seid Ihr sicher, dass Ihr den Account '%s' erstellen wollt?",
    ["msg_tele_del_confirm"]          = "Seid Ihr sicher, dass Ihr den Teleport-Ort '%s' löschen wollt?",



--[[Tele Tab]]
  --[[Name]]
    ["tabmenu_Tele"]                  = "TELE",
    ["tt_TeleButton"]                 = "Fenster mit Teleport-Funktionen umschalten.",
  --[[Tooltips]]
  --[[Control Labels]]
    ["Zone"]                          = "|cFF00FF00Zone:|r ",
    ["ma_ContinentSelection"]         = "Kontinentauswahl",
    ["ma_EasternKingdomsN"]           = "Östliche Königreiche (N)",
    ["ma_EasternKingdomsS"]           = "Östliche Königreiche (S)",
    ["ma_Kalimdor"]                   = "Kalimdor",
    ["ma_Outland"]                    = "Scherbenwelt",
    ["ma_NorthrendAlliance"]          = "Nordend-Allianz",
    ["ma_NorthrendHorde"]             = "Nordend-Horde",
    ["ma_BattlegroundsArenas"]        = "Schlachtfelder/Arenen",
    ["ma_InstancesEastern"]           = "Instanzen: Östliche Königreiche",
    ["ma_InstancesKalimdor"]          = "Instanzen: Kalimdor",
    ["ma_InstancesOutland"]           = "Instanzen: Scherbenwelt",
    ["ma_InstancesNorthrend"]         = "Instanzen: Nordend",
    ["ma_Other"]                      = "Sonstiges",
    ["ma_ZoneSelection"]              = "Zonenauswahl",
    ["ma_SelectedSubzone"]            = "Ausgewählte Unterzone",
  --[[Other]]
    ["ma_NoZones"]                    = "Keine Zonen!",
    ["ma_NoSubZones"]                 = "Keine Unterzonen!",



--[[Tickets Tab]]
  --[[Name]]
    ["tabmenu_ticket"]                = "TICKETS",
    ["tt_TicketButton"]               = "Fenster umschalten, das alle Tickets anzeigt und verwalten lässt.",
  --[[Tooltips]]
    ["tt_TicketOn"]                   = "Neue Tickets ankündigen.",
    ["tt_TicketOff"]                  = "Neue Tickets nicht ankündigen.",
    ["tt_ResetTickets"]               = "Geladene Tickets zurücksetzen",
    ["tt_LoadAllTickets"]             = "Alle Tickets laden",
    ["tt_LoadOnlineTickets"]          = "Tickets von Online-Spielern laden",
    ["tt_DeleteTicket"]               = "Ticket schließen und aus der Liste entfernen",
    ["tt_AnswerTicket"]               = "Ticket beantworten",
    ["tt_GetCharTicket"]              = "Ticket-Charakter beschwören",
    ["tt_GoCharTicket"]               = "Zu Ticket-Charakter gehen",
    ["tt_WhisperTicket"]              = "Ticket-Charakter anflüstern",
    ["tt_GoTicket"]                   = "Zu Ticket-Ort gehen",
    ["tt_ShowTickets"]                = "Geladene Tickets anzeigen",
  --[[Control Labels]]
    ["ma_ticketidlabel"]              = "|cFF00FF00Ticket:",
    ["ma_ticketcreatedbylabel"]       = "|cFF00FF00Erstellt von:",
    ["ma_tickettimecreatedlabel"]     = "|cFF00FF00Erstellt:",
    ["ma_ticketlastchangelabel"]      = "|cFF00FF00Letzte Änderung:",
    ["ma_ticketmessagelabel"]         = "|cFF00FF00Ticket-Nachricht:",
    ["ma_LoadTicketsButton"]          = "Aktualisieren",
    ["ma_GetCharTicketButton"]        = "Beschwören",
    ["ma_GoCharTicketButton"]         = "Zu Spieler",
    ["ma_AnswerButton"]               = "Mail",
    ["ma_DeleteButton"]               = "Schließen",
    ["ma_ticketwhisperbutton"]        = "Flüstern",
    ["ma_TicketCount"]                = "|cFF00FF00Tickets:|r ",
    ["ma_TicketsNoNew"]               = "Sie haben keine neuen Tickets.",
    ["ma_TicketsNewNumber"]           = "Sie haben |cffeda55f%s|r neue Tickets!",
    ["ma_TicketsGoLast"]              = "Zum letzten Ticket-Ersteller gehen (%s).",
    ["ma_TicketsGetLast"]             = "%s zu Ihnen bringen.",
    ["ma_TicketsInfoPlayer"]          = "|cFF00FF00Spieler:|r ",
    ["ma_TicketsInfoStatus"]          = "|cFF00FF00Status:|r ",
    ["ma_TicketsInfoAccount"]         = "|cFF00FF00Account:|r ",
    ["ma_TicketsInfoAccLevel"]        = "|cFF00FF00Account-Stufe:|r ",
    ["ma_TicketsInfoLastIP"]          = "|cFF00FF00Letzte IP:|r ",
    ["ma_TicketsInfoPlayedTime"]      = "|cFF00FF00Spielzeit:|r ",
    ["ma_TicketsInfoLevel"]           = "|cFF00FF00Stufe:|r ",
    ["ma_TicketsInfoMoney"]           = "|cFF00FF00Geld:|r ",
    ["ma_TicketsInfoLatency"]         = "|cFF00FF00Latenz:|r ",
    ["ma_TicketsNoInfo"]              = "Keine Informationen verfügbar",
    ["ma_TicketsNotLoaded"]           = "Kein Ticket geladen...",
    ["ma_TicketsNoTickets"]           = "Keine Tickets verfügbar!",
    ["ma_TicketResetButton"]          = "ZURÜCKSETZEN",
    ["ma_TicketLoadAllButton"]        = "Alle laden",
    ["ma_TicketLoadOnlineButton"]     = "Online laden",
    ["ma_TicketShowButton"]           = "ANZEIGEN",
    ["ma_TicketGoButton"]             = "Zu Ticket",
    ["ma_TicketTicketLoaded"]         = "|cFF00FF00Geladenes Ticket-Nr:|r %s\n\nSpieler-Informationen\n\n",
    ["ma_Reload"]                     = "Neu laden",
    ["ma_LoadMore"]                   = "Mehr laden...",
  --[[Other]]



--[[Misc Tab]]
  --[[Name]]
    ["tabmenu_Misc"]                  = "VERSCH",
    ["tt_MiscButton"]                 = "Fenster mit verschiedenen Aktionen umschalten.",
  --[[Tooltips]]
    ["tt_FrmTrSlider"]                = "Fenster-Transparenz ändern",
    ["tt_BtnTrSlider"]                = "Button-Transparenz ändern",
    ["tt_windowismovable"]            = "Bewegbares Fenster erlauben",
    ["tt_updatechanges"]              = "Änderungen an Einstellungen übernehmen. Lädt UI neu.",
    ["tt_UpdateFrequency"]            = "10000 = ~1 Minute, 50000 = ~5 Minuten",
  --[[Control Labels]]
    ["cmd_toggle"]                    = "Hauptfenster umschalten",
    ["cmd_transparency"]              = "Basistransparenz umschalten (0.5 oder 1.0)",
    ["cmd_tooltip"]                   = "Umschalten, ob Button-Tooltips angezeigt werden oder nicht",
    ["ma_EnableTransparency"]         = "Transparenz aktivieren",
    ["ma_EnableLocalizedSearch"]      = "Lokalisierte Suchstrings aktivieren",
    ["ma_EnableMinimenu"]             = "Minimenü/Toolbar aktivieren",
    ["ma_EnableTooltips"]             = "Tooltips aktivieren",
    ["ma_ShowChatOutput"]             = "Chat-Ausgabe anzeigen",
    ["ma_ShowMinimapButton"]          = "Minimap-Schaltfläche anzeigen",
    ["ma_InstantTeleport"]            = "Keine Warnung vor Teleportation",
    ["ma_FrameStrataLabel"]           = "Fenster-Strata-Stufe:",
    ["ma_FrameStrataBackground"]      = "Hintergrund",
    ["ma_FrameStrataLow"]             = "Niedrig",
    ["ma_FrameStrataMedium"]          = "Mittel (Standard)",
    ["ma_FrameStrataHigh"]            = "Hoch",
    ["ma_FrameStrataDialog"]          = "Dialog",
    ["ma_FrameStrataFullscreen"]      = "Vollbild",
    ["ma_FrameStrataFullscreenDialog"] = "Vollbild-Dialog",
    ["ma_UpdateFrequencyLabel"]       = "Aktualisierungsfrequenz des Diff-Graphen:",
    ["ma_BackgroundColorLabel"]       = "Hintergrundfarbe",
    ["ma_FrameColorLabel"]            = "Fensterfarbe",
    ["ma_ButtonColorLabel"]           = "Button-Farbe",
    ["ma_LinkifierColorLabel"]        = "MangLinkifier",
    ["ma_UpdateChangesButton"]        = "Änderungen übernehmen",
  --[[Other]]
    ["ma_ApplyWeatherButton"]         = "Wetter anwenden",
    ["ma_WeatherFine"]                = "Schön",
    ["ma_WeatherFog"]                 = "Nebel",
    ["ma_WeatherRain"]                = "Regen",
    ["ma_WeatherSnow"]                = "Schnee",
    ["ma_WeatherSand"]                = "Sand",
    ["msg_transparency_saved"]        = "|cff00ff00AzerothAdmin:|r Transparenz-Einstellung gespeichert. Änderungen übernehmen oder UI neu laden zum Anwenden.",
    ["msg_localsearch_saved"]         = "|cff00ff00AzerothAdmin:|r Lokalisierte Suchstrings-Einstellung gespeichert. Änderungen übernehmen oder UI neu laden zum Anwenden.",
    ["msg_minimenu_saved"]            = "|cff00ff00AzerothAdmin:|r Minimenü-Einstellung gespeichert.",
    ["msg_tooltip_saved"]             = "|cff00ff00AzerothAdmin:|r Tooltip-Einstellung gespeichert. Änderungen übernehmen oder UI neu laden zum Anwenden.",
    ["msg_chatoutput_saved"]          = "|cff00ff00AzerothAdmin:|r Chat-Ausgabe-Einstellung gespeichert.",



--[[Server Tab]]
    ["tabmenu_server"]                = "SERVER",
    ["tt_ServerButton"]               = "Verschiedene Server-Informationen anzeigen und Server-Aktionen ausführen.",
  --[[Tooltips]]
    ["tt_AnnounceButton"]             = "System-Nachricht ankündigen.",
    ["tt_ShutdownButton"]             = "Server in der angegebenen Anzahl Sekunden herunterfahren, falls weggelassen sofort herunterfahren!",
    ["tt_CancelShutdownButton"]       = "Server-Herunterfahren-Countdown abbrechen.",
  --[[Control Labels]]
    ["ma_AnnounceButton"]             = "Ankündigen",
    ["ma_ShutdownButton"]             = "Server herunterfahren",
    ["ma_CancelShutdownButton"]       = "Herunterfahren abbrechen",
    ["ma_ReloadTableButton"]          = "Tabelle neu laden",
    ["ma_ReloadScriptsButton"]        = "Skripte neu laden",
    ["ma_UpdateButton"]               = "Aktualisieren",
    ["ma_ServerLatencyLabel"]         = "|cFF00FF00^Server-Latenz:|r",
    ["ma_UpdateDiffLabel"]            = "|cFF00FF00^Update Diff:|r",
    ["ma_MeanLabel"]                  = "|cFF00FF00Mittelwert:|r",
    ["ma_MedianLabel"]                = "|cFF00FF00Median:|r",
    ["ma_PercentilesLabel"]           = "|cFF00FF00Perzentile:|r",
  --[[Other]]
    ["msg_shutdown_time_required"]    = "Bitte geben Sie die Zeit in Sekunden ein, bevor Sie Server herunterfahren verwenden.",
    ["msg_shutdown_confirm"]          = "Sind Sie sicher, dass Sie den Server in %s Sekunden herunterfahren möchten?",



  --[[Tooltips]]
  --[[Control Labels]]
  --[[Other]]



--[[Pop UPs]]
  --[[General]]
  --[[ToolTips]]
    ["tt_ItemButton"]                 = "Popup umschalten mit Funktion zum Suchen von Gegenständen und Verwalten Ihrer Favoriten.",
    ["tt_ItemSetButton"]              = "Popup umschalten mit Funktion zum Suchen von Gegenstandssets und Verwalten Ihrer Favoriten.",
    ["tt_SpellButton"]                = "Popup umschalten mit Funktion zum Suchen von Zaubern und Verwalten Ihrer Favoriten.",
    ["tt_QuestButton"]                = "Popup umschalten mit Funktion zum Suchen von Quests und Verwalten Ihrer Favoriten.",
    ["tt_CreatureButton"]             = "Popup umschalten mit Funktion zum Suchen von Kreaturen und Verwalten Ihrer Favoriten.",
    ["tt_ObjectButton"]               = "Popup umschalten mit Funktion zum Suchen von Objekten und Verwalten Ihrer Favoriten.",
    ["tt_SearchDefault"]              = "Jetzt können Sie ein Stichwort eingeben und die Suche starten.",
    ["tt_SkillButton"]                = "Popup umschalten mit Funktion zum Suchen von Fertigkeiten und Verwalten Ihrer Favoriten.",
  --[[Labels]]
    ["ma_PopupErrorTab"]              = "FEHLER",
    ["ma_PopupFavoritesTab"]          = "Favoriten",
    ["ma_PopupTab3"]                  = "Tab 3",
    ["ma_PopupAmountLabel"]           = "Anzahl:",
    ["ma_PopupInvisibleText"]         = "Unsichtbar",
    ["ma_ItemButton"]                 = "Gegenstand-Suche",
    ["ma_ItemSetButton"]              = "Gegenstandsset-Suche",
    ["ma_SpellButton"]                = "Zauber-Suche",
    ["ma_QuestButton"]                = "Quest-Suche",
    ["ma_CreatureButton"]             = "Kreatur-Suche",
    ["ma_ObjectButton"]               = "Objekt-Suche",
    ["ma_TeleSearchButton"]           = "Teleport-Suche",
    ["ma_MailRecipient"]              = "Empfänger",
    ["ma_Mail"]                       = "Mail senden",
    ["ma_Send"]                       = "Senden",
    ["ma_MailSubject"]                = "Betreff",
    ["ma_MailYourMsg"]                = "Hier Ihre Nachricht!",
    ["ma_SearchButton"]               = "Suchen...",
    ["ma_ResetButton"]                = "Zurücksetzen",
    ["ma_FavAdd"]                     = "Ausgewählte hinzufügen",
    ["ma_FavRemove"]                  = "Ausgewählte entfernen",
    ["ma_SelectAllButton"]            = "Alle auswählen",
    ["ma_DeselectAllButton"]          = "Alle abwählen",
    ["ma_MailBytesLeft"]              = "Bytes übrig: ",
    ["ma_SkillButton"]                = "Fertigkeit-Suche",
    ["ma_SkillVar1Button"]            = "Fertigkeit",
    ["ma_SkillVar2Button"]            = "Max. Fertigkeit",
    ["ma_ItemVar1Button"]             = "Anzahl",
    ["ma_ObjectVar1Button"]           = "Beute-Vorlage",
    ["ma_ObjectVar2Button"]           = "Spawn-Zeit",
    ["ma_NoFavorites"]                = "Es sind derzeit keine Favoriten gespeichert!",
    ["favoriteResults"]               = "|cFF00FF00Favoriten:|r ",



    ["ma_LearnAllButton"]             = "Alle Zauber",
    ["ma_LearnCraftsButton"]          = "Alle Berufe und Rezepte",
    ["ma_LearnGMButton"]              = "Standard GM-Zauber",
    ["ma_LearnClassButton"]           = "Alle Klassenzauber",
    ["ma_GPSButton"]                  = "GPS",
    ["ma_Online"]                     = "Online",
    ["ma_Offline"]                    = "Offline",



--[[Linkifier]]
    ["lfer_Spawn"]                    = "Spawnen",
    ["lfer_List"]                     = "Auflisten",
    ["lfer_Reload"]                   = "Neu laden",
    ["lfer_Goto"]                     = "Gehe zu",
    ["lfer_Move"]                     = "Bewegen",
    ["lfer_Turn"]                     = "Drehen",
    ["lfer_Delete"]                   = "Löschen",
    ["lfer_Teleport"]                 = "Teleportieren",
    ["lfer_Morph"]                    = "Verwandeln",
    ["lfer_Add"]                      = "Hinzufügen",
    ["lfer_Remove"]                   = "Entfernen",
    ["lfer_Learn"]                    = "Lernen",
    ["lfer_Unlearn"]                  = "Verlernen",
    ["lfer_Error"]                    = "Fehler: Suchstring gefunden, aber ein Fehler trat auf oder Typ konnte nicht gefunden werden"

}
  for k,v in pairs(translations) do L[k] = v end
end
