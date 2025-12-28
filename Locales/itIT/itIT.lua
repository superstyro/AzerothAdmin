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
1. Edit the first un-commented line below, which should resemble: function Return_itIT(). Change
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

function Return_itIT()
  return {
--[[General]]
  --[[Tooltips]]
    ["tt_Default"]                    = "Muovi il cursore su un elemento per attivare il tooltip!",
    ["tt_LanguageButton"]             = "Ricarica AzerothAdmin e applica la lingua selezionata.",
    ["tt_RefreshButton"]              = "Aggiorna le informazioni del server.",
  --[[Control Labels]]
    ["ma_LanguageButton"]             = "Ricarica UI",
    ["ma_RefreshButton"]              = "Aggiorna",
    ["ma_TopText"]                    = "toptext, non dovresti vedere questo!",
    ["ma_Top2Text"]                   = "toptext, non dovresti vedere questo!",
    ["ma_InfoOnlineText"]             = "Giocatori Online: ...",
    ["ma_InfoMaxOnlineText"]          = "Massimo Online: ...",
    ["ma_InfoUptimeText"]             = "Uptime Server: ...",
    ["ma_InfoRevisionText"]           = "Revisione AzerothCore: ...",
    ["info_revision"]                 = "|cFF00FF00Revisione AzerothCore:|r ",
    ["info_platform"]                 = "|cFF00FF00Piattaforma Server:|r ",
    ["info_online"]                   = "|cFF00FF00Giocatori Online:|r ",
    ["info_maxonline"]                = "|cFF00FF00Massimo Online:|r ",
    ["info_uptime"]                   = "|cFF00FF00Uptime:|r ",
    ["ma_CloseWindow"]                = "X",
    ["tt_CloseWindow"]                = "Chiudi Finestra",
  --[[Other]]
    ["slashcmds"]                     = { "/AzerothAdmin", "/aa" },
    ["lang"]                          = "Italiano",
    ["realm"]                         = "|cFF00FF00Regno:|r "..GetCVar("realmName"),
    ["char"]                          = "|cFF00FF00Personaggio:|r "..UnitName("player"),
    ["guid"]                          = "|cFF00FF00Guid:|r ",
    ["tickets"]                       = "|cFF00FF00Ticket:|r ",
    ["selectionerror1"]               = "Seleziona solo te stesso, un altro giocatore o nulla!",
    ["selectionerror2"]               = "Seleziona solo te stesso o nulla!",
    ["selectionerror3"]               = "Seleziona solo un altro giocatore!",
    ["selectionerror4"]               = "Seleziona solo un NPC!",
    ["numbererror"]                   = "Il valore deve essere un numero!",
    ["searchResults"]                 = "|cFF00FF00Risultati Ricerca:|r ",
    ["ma_parameters"]                 = "Parametro/i:", --Used on multiple tabs



--[[GM tab]]
  --[[Name]]
    ["tabmenu_Main"]                  = "GM",
  --[[Tooltips]]
    ["tt_MainButton"]                 = "Attiva/disattiva il pannello principale di AzerothAdmin.",
    ["tt_DisplayAccountLevel"]        = "Mostra il livello del tuo account",
    ["tt_GMOnButton"]                 = "Attiva la modalità GM.",
    ["tt_GMOffButton"]                = "Disattiva la modalità GM.",
    ["tt_FlyOnButton"]                = "Attiva la modalità Volo per il personaggio selezionato.",
    ["tt_FlyOffButton"]               = "Disattiva la modalità Volo per il personaggio selezionato.",
    ["tt_HoverOnButton"]              = "Attiva la modalità Levitazione.",
    ["tt_HoverOffButton"]             = "Disattiva la modalità Levitazione.",
    ["tt_WhispOnButton"]              = "Accetta i sussurri da altri giocatori.",
    ["tt_WhispOffButton"]             = "Non accettare i sussurri da altri giocatori.",
    ["tt_InvisOnButton"]              = "Ti rende invisibile.",
    ["tt_InvisOffButton"]             = "Ti rende visibile.",
    ["tt_TaxiOnButton"]               = "Mostra tutte le rotte dei taxi al giocatore selezionato. Questo trucco verrà disattivato al logout.",
    ["tt_TaxiOffButton"]              = "Disattiva il trucco taxi e ripristina le rotte dei taxi conosciute dal giocatore.",
    ["tt_ShowMapsButton"]             = "Rivela le mappe per il personaggio selezionato.",
    ["tt_HideMapsButton"]             = "Nascondi le mappe per il personaggio selezionato.",
    ["tt_SpeedSlider"]                = "Aumenta o diminuisci la velocità del personaggio selezionato.",
    ["tt_ScaleSlider"]                = "Aumenta o diminuisci la scala del personaggio selezionato.",
    ["tt_instakill"]                  = "Quando selezionato, cliccando su una creatura nemica la uccidi.",
    ["tt_ScreenButton"]               = "Fai uno screenshot.",
    ["tt_BankButton"]                 = "Mostra la tua banca.",
    ["tt_Dismount"]                   = "Smonta, se sei in sella",
    ["tt_SetJail_A_Button"]           = "Imposta la posizione della Prigione dell'Alleanza alla tua posizione attuale.",
    ["tt_SetJail_H_Button"]           = "Imposta la posizione della Prigione dell'Orda alla tua posizione attuale.",
    ["tt_N"]                          = "Naviga verso Nord",
    ["tt_S"]                          = "Naviga verso Sud",
    ["tt_E"]                          = "Naviga verso Est",
    ["tt_W"]                          = "Naviga verso Ovest",
  --["tt_chatonbutton"]               = "Turn GM Chat ON",
  --["tt_chatoffbutton"]              = "Turn GM Chat OFF",
    ["tt_waterwalkonbutton"]          = "Attiva Camminata sull'Acqua per la creatura selezionata"  ,
    ["tt_watewrwalkoffbutton"]        = "Disattiva Camminata sull'Acqua per la creatura selezionata",
    ["tt_accountlockonbutton"]        = "Blocca il tuo account",
    ["tt_accountlockoffbutton"]       = "Sblocca il tuo account",
    ["tt_DisplayAccountLvl"]          = "Mostra il livello del tuo account.",
    ["tt_SpeedSliderReset"]           = "Ripristina Velocità a 1.0",
    ["tt_ScaleSliderReset"]           = "Ripristina Scala a 1.0",
    ["tt_gmnotifybutton"]             = "Invia messaggio $message a tutti i GM online [[Parametri: $message]]",
    ["tt_gmingamebutton"]             = "Mostra i GM che sono connessi.",
    ["tt_gmlistbutton"]               = "Mostra gli account GM su questo server",
    ["tt_petcreatebutton"]            = "Rende l'ANIMALE selezionato il tuo famiglio.",
    ["tt_petlearnbutton"]             = "Insegna al tuo famiglio l'incantesimo [[Parametro: #SPELLID]]",
    ["tt_petunlearnbutton"]           = "Rimuove l'incantesimo dal tuo famiglio [[Parametro: #SPELLID]]",
    ["tt_pettpbutton"]                = "Modifica i punti addestramento del famiglio [[Parametro: #points]]",
    ["tt_lookuptaxibutton"]           = "Cerca un TaxiNode [[Parametro: $Areanamepart]]",
    ["tt_gotaxinodebutton"]           = "Teletrasporta al TaxiNode specificato [[Parametro: #taxinode]]",
    ["tt_gotriggerbutton"]            = "Teletrasporta al trigger d'area specificato [[Parametro: #trigger_id]]",
    ["tt_goxybutton"]                 = "Teletrasporta alle coordinate specificate a livello terra/acqua sulla MapID. Se MapID è omessa, mappa attuale [[Parametri: #x #y [#mapid]]]",
    ["tt_goxyzbutton"]                = "Teletrasporta alle coordinate specificate al livello #z sulla MapID. Se MapID è omessa, mappa attuale [[Parametri: #x #y #z [#mapid]]]",
    ["tt_gozonexybutton"]             = "Teletrasporta alle coordinate specificate a livello terra/acqua nella ZoneID. Se ZoneID è omessa, zona attuale [[Parametri: #x #y [#zoneid]]]",
    ["tt_lookupzonebutton"]           = "Cerca una Zona. [[Parametri: $Areanamepart]]",
    ["tt_castbutton"]                 = "Lancia un incantesimo. [[Parametri: #SpellID]]",
    ["tt_castbackbutton"]             = "La creatura selezionata lancerà l'incantesimo [SpellID] su di TE. [[Parametri: #SpellID]]",
    ["tt_castdistbutton"]             = "Lanci un incantesimo [SpellID] alla distanza [#Dist]. [[Parametri: #SpellID #Dist]]",
    ["tt_castselfbutton"]             = "La creatura selezionata lancia l'incantesimo [SpellID] su se stessa. [[Parametri: #SpellID]]",
    ["tt_casttargetbutton"]           = "La creatura selezionata lancia l'incantesimo [SpellID] sul suo bersaglio. [[Parametri: #SpellID]]",
    ["tt_gmclearbutton"]              = "Cancella il campo parametri.",
    ["tt_listitembutton"]             = "Elenca tutte le occorrenze di [#itemID]. [[Parametri: #ItemID]]",
    ["tt_acctcreatebutton"]           = "Crea un account giocatore [[Parametri: $accountname $password]]",
    ["tt_acctdeletebutton"]           = "Elimina un account giocatore e tutti i personaggi [[Parametri: $accountname]]",
    ["tt_acctaddonbutton"]            = "Imposta $account per usare #addon(0=WoW, 1=TBC, 2=WotLK) [[Parametri: $accountname #addon]]",
    ["tt_acctgmlvlbutton"]            = "Imposta $account al #gmlevel (0=Giocatore, 1=Helper, 2=Assistente, 3=GM, 4=Admin) [[Parametri: $accountname #gmlevel]]",
    ["tt_acctpasswdbutton"]           = "Imposta $account $password [[Parametri: $accountname $password $password]]",
  --[[Control Labels]]
    ["ma_OffButton"]                  = "Off",
    ["ma_displaylevelbutton"]         = "Mostra Livello Account",
    ["ma_GMOnButton"]                 = "Modalità GM on",
    ["ma_FlyOnButton"]                = "Modalità Volo on",
    ["ma_HoverOnButton"]              = "Modalità Levitazione on",
    ["ma_WhisperOnButton"]            = "Sussurro on",
    ["ma_InvisOnButton"]              = "Invisibilità on",
    ["ma_TaxiOnButton"]               = "Trucco Taxi on",
    ["ma_ShowMapsButton"]             = "Mostra Mappe",
    ["ma_HideMapsButton"]             = "Nascondi Mappe",
    ["ma_instakill"]                  = "Uccisione istantanea creature",
    ["ma_ScreenshotButton"]           = "Screenshot",
    ["ma_BankButton"]                 = "Banca",
    ["ma_DismountButton"]             = "Smonta",
    ["ma_SetJail_A_Button"]           = "ImpostaPrigione A",
    ["ma_SetJail_H_Button"]           = "ImpostaPrigione H",
    ["gridnavigator"]                 = "Navigatore-Griglia",
    ["N"]                             = "N", --Abbreviation for North
    ["S"]                             = "S", --Abbreviation for South
    ["E"]                             = "E", --Abbreviation for East
    ["W"]                             = "O", --Abbreviation for West
    ["ma_chatbutton"]                 = "Chat GM On",
    ["ma_mapsbutton"]                 = "Vedi Tutte Mappe",
    ["ma_waterwalkbutton"]            = "Camminata Acqua On",
    ["ma_accountlockbutton"]          = "Blocco Account",
    ["ma_gmnotify"]                   = "Notifica GM",
    ["ma_gmingame"]                   = "GM InGame",
    ["ma_gmlist"]                     = "Lista GM",
    ["ma_petcreate"]                  = "Crea Famiglio",
    ["ma_petlearn"]                   = "Impara Famiglio",
    ["ma_petunlearn"]                 = "Dimentica Famiglio",
    ["ma_pettp"]                      = "TP Famiglio",
    ["ma_lookuptaxi"]                 = "Cerca Taxi",
    ["ma_gotaxinode"]                 = "Vai TaxiNode",
    ["ma_gotrigger"]                  = "Vai Trigger",
    ["ma_goxy"]                       = "Vai XY",
    ["ma_goxyz"]                      = "Vai XYZ",
    ["ma_gozonexy"]                   = "Vai ZonaXY",
    ["ma_lookupzone"]                 = "Cerca Zona",
    ["ma_cast"]                       = "Lancia",
    ["ma_castback"]                   = "Lancia Indietro",
    ["ma_castdist"]                   = "Lancia Dist",
    ["ma_castself"]                   = "Lancia Self",
    ["ma_casttarget"]                 = "Lancia Target",
    ["ma_listitem"]                   = "Lista Oggetto",
    ["ma_GmClear"]                    = "Cancella Param",
    ["ma_acctcreate"]                 = "Crea Account",
    ["ma_acctdelete"]                 = "Elimina Account",
    ["ma_acctaddon"]                  = "Addon Account",
    ["ma_acctgmlvl"]                  = "Livello GM Account",
    ["ma_acctpasswd"]                 = "Password Account",
    ["ma_MiniMenuGM"]                 = "Gm",
    ["ma_MiniMenuChar"]               = "Cr",
    ["ma_MiniMenuNPC"]                = "Np",
    ["ma_MiniMenuGO"]                 = "GO",
    ["ma_MiniMenuTele"]               = "Te",
    ["ma_MiniMenuTicket"]             = "Ti",
    ["ma_MiniMenuMisc"]               = "Mi",
    ["ma_MiniMenuServer"]             = "Se",
    ["ma_MiniMenuLog"]                = "Lo",
    ["ma_MiniMenuRevive"]             = "RIANIMA!",
  --[[Other]]



--[[Char Tab]]
  --[[Name]]
    ["tabmenu_Char"]                  = "PERS",
    ["tt_CharButton"]                 = "Attiva/disattiva una finestra con azioni specifiche per il personaggio.",
  --[[Tooltips]]
    ["tt_RotateLeft"]                 = "Ruota a sinistra.",
    ["tt_RotateRight"]                = "Ruota a destra.",
    ["tt_killbutton"]                 = "Uccide la creatura/giocatore selezionato",
    ["tt_reviveplayer"]               = "Rianima il giocatore selezionato",
    ["tt_saveplayer"]                 = "Salva il personaggio del giocatore selezionato",
    ["tt_KickButton"]                 = "Espelli il giocatore selezionato dal server.",
    ["tt_CooldownButton"]             = "Rimuove/scade tutti i cooldown degli effetti incantesimi sul personaggio selezionato.",
    ["tt_GUIDButton"]                 = "Mostra il GUID del personaggio selezionato.",
    ["tt_PinfoButton"]                = "Ottieni informazioni sul GIOCATORE selezionato.",
    ["tt_DistanceButton"]             = "Ottieni la distanza dalla creatura selezionata.",
    ["tt_RecallButton"]               = "Richiama la creatura selezionata alla posizione prima dell'ultimo teletrasporto.",
    ["tt_DemorphButton"]              = "Rimuove qualsiasi trasformazione sul personaggio selezionato.",
    ["tt_ShowMapsCharButton"]         = "Rivela le mappe per il personaggio selezionato.",
    ["tt_HideMapsCharButton"]         = "Nascondi le mappe per il personaggio selezionato.",
    ["tt_learnlangbutton"]            = "Impara gli incantesimi selezionati",
    ["tt_modifybutton"]               = "Modifica l'attributo selezionato della quantità inserita",
    ["tt_resetbutton"]                = "Ripristina l'attributo selezionato",
    ["tt_modelzoominbutton"]          = "Zoom avanti sul modello selezionato",
    ["tt_modelzoomoutbutton"]         = "Zoom indietro sul modello selezionato",
    ["tt_charbindsight"]              = "Lega la tua visione all'Unità selezionata",
    ["tt_charunbindsight"]            = "Slega la tua visione dall'Unità selezionata",
    ["tt_charrename"]                 = "Attiva/disattiva la rinomina del personaggio selezionato al prossimo login",
    ["tt_charcustomize"]              = "Attiva/disattiva la personalizzazione del personaggio selezionato al prossimo login",
    ["tt_charchangerace"]             = "Attiva/disattiva il cambio razza del personaggio selezionato al prossimo login",
    ["tt_charchnagefaction"]          = "Attiva/disattiva il cambio fazione del personaggio selezionato al prossimo login",
    ["tt_charcombatstop"]             = "Ferma il combattimento per il personaggio selezionato (o te stesso)",
    ["tt_charmaxskill"]               = "Imposta le abilità del personaggio selezionato al valore massimo per il livello",
    ["tt_charfreeze"]                 = "Congela il giocatore bersaglio e disabilita la sua chat",
    ["tt_charunfreeze"]               = "Scongela il giocatore selezionato e ripristina la chat",
    ["tt_charlistdeleted"]            = "Elenca i personaggi eliminati nella finestra di chat",
    ["tt_chardeletedrestore"]         = "Parametri= #guid|$name [$newname] [#new account] [[Questo comando è WIP]",
    ["tt_charpossess"]                = "Possiede indefinitamente la creatura selezionata",
    ["tt_charunpossess"]              = "Rilascia il possesso della creatura selezionata",
    ["tt_charrecall"]                 = "Richiama il giocatore selezionato all'ultima posizione di teletrasporto",
    ["tt_charrepair"]                 = "Ripara l'armatura e le armi del giocatore selezionato",
    ["tt_banbutton"]                  = "Parametri= <account|ip|character> $NameOrIp <-1|xxdyyhzzm> $reason   [[Banna acct/IP & espelli. -1=permaban, o una stringa come 4d3h24m16s]]",
    ["tt_gonamebutton"]               = "Parametro= $charactername  [[Ti teletrasporta dal personaggio specificato]]",
    ["tt_createguildbutton"]          = "Parametri= $GuildLeaderName $GuildName  [[Crea una gilda chiamata $GuildName, con $GuildLeaderName come leader]]",
    ["tt_teleaddbutton"]              = "Parametro= $Name  [[Aggiunge una posizione di teletrasporto .tele per la tua posizione attuale con il nome $Name]]",
    ["tt_baninfobutton"]              = "Parametro= <account|ip|character>  [[Visualizza informazioni dettagliate sui ban dell'account/ip/personaggio specificato]]",
    ["tt_groupgobutton"]              = "Parametro= $charactername   [[Teletrasporta il personaggio specificato e il suo gruppo alla tua posizione]]",
    ["tt_guildinvitebutton"]          = "Parametri= $charactername $guildname   [[Aggiunge $charactername alla gilda $guildname]]",
    ["tt_teledelbutton"]              = "Parametro= $telename  [[Rimuove la posizione chiamata $telename dalla lista posizioni .tele]]",
    ["tt_banlistbutton"]              = "Parametri= <account|ip> $NameOrIp   [[Cerca e restituisce ban specifici corrispondenti ai parametri]]",
    ["tt_namegobutton"]               = "Parametro= $charactername   [[Teletrasporta il personaggio specificato alla tua posizione]]",
    ["tt_guildrankbutton"]            = "Parametri= $charactername #ranknumber   [[Imposta il personaggio specificato al rango specificato nella sua gilda]]",
    ["tt_telegroupbutton"]            = "Parametro= $telename  [[Teletrasporta il personaggio **selezionato** e il suo gruppo alla posizione .tele chiamata $telename]]",
    ["tt_unbanbutton"]                = "Parametri= <account|ip|character> $NameOrIp  [[Rimuove il ban dall'acct/IP/personaggio specificato]]",
    ["tt_guilddeletebutton"]          = "Parametro= $guildname  [[Elimina la Gilda specificata]]",
    ["tt_guilduninvitebutton"]        = "Parametro= $charactername  [[Espelle il personaggio specificato dalla sua gilda]]",
    ["tt_telenamebutton"]             = "Parametri= $charactername $telename  [[Teletrasporta $charactername a $telename]]",
    ["tt_mutebutton"]                 = "Parametri= $charactername #minutes  [[Disabilita la chat per l'intero account di $charactername per #minutes]]",
    ["tt_charmorphbutton"]            = "Parametri = #DisplayID [[Inserisci il DisplayID della trasformazione che vuoi applicare]]",
    ["tt_charaurabutton"]             = "Parametri = #AuraID [[Inserisci l'AuraID dell'aura che vuoi applicare]]",
    ["tt_charunaurabutton"]           = "Parametri = #AuraID [[Inserisci l'AuraID dell'aura che vuoi rimuovere]]",
    ["tt_JailAButton"]                = "Parametro= $charactername [[Invia il personaggio il cui nome appare in questa casella alla Prigione dell'Alleanza]]",
    ["tt_JailHButton"]                = "Parametro= $charactername [[Invia il personaggio il cui nome appare in questa casella alla Prigione dell'Orda]]",
    ["tt_UnJailButton"]               = "Parametro= $charactername [[Libera dalla prigione il personaggio il cui nome appare in questa casella.]]",
    ["tt_UnMuteButton"]               = "Rimuovi il silenziamento a $player.",
    ["tt_QuestAddButton"]             = "Aggiunge #questid al giocatore **selezionato**.",
    ["tt_QuestCompleteButton"]        = "Segna #questid come completata per il giocatore **selezionato**.",
    ["tt_QuestRemoveButton"]          = "Rimuove #questid dal giocatore **selezionato**.",
    ["tt_DamageButton"]               = "Parametro= #amount di danno da applicare alla creatura/giocatore **selezionato**",
    ["tt_HideAreaButton"]             = "Nascondi #areaid dal giocatore **selezionato**.",
    ["tt_ShowAreaButton"]             = "Mostra #areaid al giocatore **selezionato**.",
    ["tt_HonorAddButton"]             = "Aggiunge #honorpoints al giocatore **selezionato**.",
    ["tt_HonorUpdateButton"]          = "Nessun parametro richiesto. Salva l'Onore per il giocatore **selezionato**.",
  --[[Control Labels]]
    ["ma_KillButton"]                 = "Uccidi",
    ["ma_ReviveButton"]               = "Rianima",
    ["ma_SaveButton"]                 = "Salva",
    ["ma_KickButton"]                 = "Espelli",
    ["ma_CooldownButton"]             = "Cooldown",
    ["ma_GUIDButton"]                 = "Mostra GUID",
    ["ma_PinfoButton"]                = "Info GIOCATORE",
    ["ma_DistanceButton"]             = "Distanza",
    ["ma_RecallButton"]               = "Richiama",
    ["ma_DemorphButton"]              = "Rimuovi Trasf",
    ["ma_ShowMapsCharButton"]         = "Mostra Mappe",
    ["ma_HideMapsCharButton"]         = "Nascondi Mappe",
    ["ma_LearnLangButton"]            = "Tutte le lingue",
    ["ma_Learn"]                      = "Impara",
    ["ma_Modify"]                     = "Modifica",
    ["ma_Reset"]                      = "Ripristina",
    ["ma_CharBindsight"]              = "LegaVisione",
    ["ma_CharUnBindsight"]            = "SlegaVisione",
    ["ma_charrename"]                 = "Rinomina",
    ["ma_charcustomize"]              = "Personalizza",
    ["ma_charchangerace"]             = "Cambia Razza",
    ["ma_charchnagefaction"]          = "Cambia Fazione",
    ["ma_charcombatstop"]             = "FermaCombattimento",
    ["ma_charmaxskill"]               = "AbilitàMax",
    ["ma_charfreeze"]                 = "Congela",
    ["ma_charunfreeze"]               = "Scongela",
    ["ma_charlistdeleted"]            = "ListaPersCancellati",
    ["ma_chardeletedrestore"]         = "RipristinaPersCancellato",
    ["ma_charpossess"]                = "Possiedi",
    ["ma_charunpossess"]              = "RilasciaPossesso",
    ["ma_charrecall"]                 = "Richiama",
    ["ma_charrepair"]                 = "Ripara",
    ["ma_banbutton"]                  = "Ban",
    ["ma_gonamebutton"]               = "Appari",
    ["ma_createguildbutton"]          = "Crea G",
    ["ma_teleaddbutton"]              = "AggiungiTele",
    ["ma_baninfobutton"]              = "InfoBan",
    ["ma_groupgobutton"]              = "EvocaGruppo",
    ["ma_guildinvitebutton"]          = "Invita G",
    ["ma_teledelbutton"]              = "EliminaTele",
    ["ma_banlistbutton"]              = "ListaBan",
    ["ma_namegobutton"]               = "Evoca",
    ["ma_guildrankbutton"]            = "Rango G",
    ["ma_telegroupbutton"]            = "TeleGruppo",
    ["ma_unbanbutton"]                = "RimuoviBan",
    ["ma_guilddeletebutton"]          = "Elimina G",
    ["ma_guilduninvitebutton"]        = "RimuoviInv G",
    ["ma_telenamebutton"]             = "TeleNome",
    ["ma_mutebutton"]                 = "Silenzia",
    ["ma_Aura"]                       = "Aura",
    ["ma_UnAura"]                     = "RimuoviAura",
    ["ma_Morph"]                      = "Trasforma",
    ["ma_JailAButton"]                = "Prigione (A)",
    ["ma_JailHButton"]                = "Prigione (H)",
    ["ma_UnJailButton"]               = "Libera",
    ["ma_UnMuteButton"]               = "RimuoviSilenzio",
    ["ma_QuestAddButton"]             = "AggiungiQuest",
    ["ma_QuestCompleteButton"]        = "CompletaQuest",
    ["ma_QuestRemoveButton"]          = "RimuoviQuest",
    ["ma_DamageButton"]               = "Danno",
    ["ma_HideAreaButton"]             = "NascondiArea",
    ["ma_ShowAreaButton"]             = "MostraArea",
    ["ma_HonorAddButton"]             = "AggiungiOnore",
    ["ma_HonorUpdateButton"]          = "AggiornOnore",
    ["ma_CharRotateLeft"]             = "<<=",
    ["ma_CharRotateRight"]            = "=>>",
    ["ma_CharZoomIn"]                 = "+",
    ["ma_CharZoomOut"]                = "-",
  --[[Other]]
    ["ma_LevelUp"]                    = "Aumenta livello",
    ["ma_LevelDown"]                  = "Diminuisci livello",
    ["ma_Money"]                      = "Denaro",
    ["ma_Energy"]                     = "Energia",
    ["ma_Rage"]                       = "Rabbia",
    ["ma_Mana"]                       = "Mana",
    ["ma_Healthpoints"]               = "Punti Salute",
    ["ma_Talents"]                    = "Talenti",
    ["ma_Stats"]                      = "Statistiche",
    ["ma_Spells"]                     = "Incantesimi",
    ["ma_Honor"]                      = "Onore",
    ["ma_Level"]                      = "Livello",
    ["ma_AllLang"]                    = "Tutte le Lingue",
    ["ma_AllGMSpells"]                = "Tutti Incantesimi GM",
    ["ma_AllCrafts"]                  = "Tutte le Professioni",
    ["ma_AllDefault"]                 = "Tutto Default",
    ["ma_AllMyClass"]                 = "Tutta la Mia Classe",
    ["ma_AllMyPetTalents"]            = "Tutti Talenti Famiglio",
    ["ma_AllMySpells"]                = "Tutti i Miei Incantesimi",
    ["ma_AllMyTalents"]               = "Tutti i Miei Talenti",
    ["ma_AllRecipesAlchemy"]          = "Tutte Ricette (Alchimia)",
    ["ma_AllRecipesBlacksmithing"]    = "Tutte Ricette (Forgiatura)",
    ["ma_AllRecipesCooking"]          = "Tutte Ricette (Cucina)",
    ["ma_AllRecipesEnchanting"]       = "Tutte Ricette (Incantamento)",
    ["ma_AllRecipesEngineering"]      = "Tutte Ricette (Ingegneria)",
    ["ma_AllRecipesFirstAid"]         = "Tutte Ricette (Pronto Soccorso)",
    ["ma_AllRecipesInscription"]      = "Tutte Ricette (Runografia)",
    ["ma_AllRecipesJewelcrafting"]    = "Tutte Ricette (Oreficeria)",
    ["ma_AllRecipesLeatherworking"]   = "Tutte Ricette (Conciatura)",
    ["ma_AllRecipesTailoring"]        = "Tutte Ricette (Sartoria)",
    ["ma_resetallspells"]             = "Incantesimi per TUTTI",
    ["ma_resetalltalents"]            = "Talenti per TUTTI",
    ["ma_achievements"]               = "Imprese",
    ["ma_AllSpeeds"]                  = "TutteVelocità",
    ["ma_Arena"]                      = "Arena",
    ["ma_BackWalk"]                   = "CamminataIndietro",
    ["ma_Drunk"]                      = "Ubriaco",
    ["ma_FlySpeed"]                   = "VelocitàVolo",
    ["ma_Gender"]                     = "Sesso",
    ["ma_MountSpeed"]                 = "VelocitàCavalcatura",
    ["ma_Phase"]                      = "Fase",
    ["ma_RunicPower"]                 = "PotereRunico",
    ["ma_Speed"]                      = "Velocità",
    ["ma_StandState"]                 = "StatoPosizione",
    ["ma_SwimSpeed"]                  = "VelocitàNuoto",
    ["ma_TalentPoints"]               = "PuntiTalento",
    -- languages
    ["Common"]                        = "Comune",
    ["Orcish"]                        = "Orchesco",
    ["Taurahe"]                       = "Taurahe",
    ["Darnassian"]                    = "Darnassiano",
    ["Dwarvish"]                      = "Nanico",
    ["Thalassian"]                    = "Thalassiano",
    ["Demonic"]                       = "Demoniaco",
    ["Draconic"]                      = "Draconico",
    ["Titan"]                         = "Titano",
    ["Kalimag"]                       = "Kalimag",
    ["Gnomish"]                       = "Gnomesco",
    ["Troll"]                         = "Troll",
    ["Gutterspeak"]                   = "Gutterspeak",
    ["Draenei"]                       = "Draenei",



--[[NPC Tab]]
  --[[Name]]
    ["tabmenu_NPC"]                   = "NPC",
    ["tt_NpcButton"]                  = "Attiva/disattiva una finestra con funzioni relative agli NPC.",
  --[[Tooltips]]
    ["tt_NPCRotateLeft"]              = "Ruota a sinistra",
    ["tt_NPCRotateRight"]             = "Ruota a destra",
    ["tt_NPCKillButton"]              = "Uccide il bersaglio selezionato",
    ["tt_npcrespawn"]                 = "Fa respawnare la creatura selezionata, o se nessuna è selezionata, tutte le creature vicine",
    ["tt_NPCDistanceButton"]          = "Ottieni la distanza dalla creatura selezionata.",
    ["tt_NPCGUIDButton"]              = "Mostra il GUID del personaggio selezionato.",
    ["tt_NPCInfoButton"]              = "Ottieni informazioni sull'NPC selezionato.",
    ["tt_NPCDemorph"]                 = "Rimuove la trasformazione dall'NPC selezionato",
    ["tt_NPCMove"]                    = "Muovi la creatura selezionata alla tua posizione",
    ["tt_NPCDel"]                     = "Elimina la creatura selezionata",
    ["tt_getguid"]                    = "Ottieni il GUID e l'ID della creatura selezionata",
    ["tt_NPCClear"]                   = "Cancella tutti i campi info NPC (GUID, NPC ID, Display ID, Distanza)",
    ["tt_NPCAdd"]                     = "Aggiunge una copia di questo NPC alla tua posizione attuale.",
    ["tt_NPCGo"]                      = "Ti teletrasporta all'NPC nella casella GUID",
    ["tt_NPCMorph"]                   = "Parametri = #DisplayID [[Inserisci il DisplayID della trasformazione che vuoi applicare]]",
    ["tt_NPCSay"]                     = "Fai dire all'NPC selezionato [parametri]",
    ["tt_NPCYell"]                    = "Fai gridare all'NPC selezionato [parametri]",
    ["tt_NPCAura"]                    = "Parametri = #AuraID [[Inserisci l'AuraID dell'aura che vuoi applicare]]",
    ["tt_NPCUnaura"]                  = "Parametri = #AuraID [[Inserisci l'AuraID dell'aura che vuoi rimuovere]]",
    ["tt_PlayEmote"]                  = "Riproduci Emote dalla lista a sinistra",
    ["tt_GPSButton"]                  = "Mostra le coordinate del personaggio selezionato.",
    ["tt_DisplayUp"]                  = "Incrementa DisplayID NPC SU di 1",
    ["tt_DisplayDown"]                = "Decrementa DisplayID NPC GIÙ di 1",
    ["tt_IDUp"]                       = "Incrementa ID NPC SU di 1",
    ["tt_IDDown"]                     = "Decrementa ID NPC GIÙ di 1",
    ["tt_npcmodelzoominbutton"]       = "Zoom avanti sul modello selezionato",
    ["tt_npcmodelzoomoutbutton"]      = "Zoom indietro sul modello selezionato",
    ["tt_npcbindsight"]               = "Lega la tua visione all'NPC selezionato",
    ["tt_npcunbindsight"]             = "Slega la tua visione dall'NPC selezionato",
    ["tt_npccometome"]                = "Forza l'NPC selezionato a venire alla tua posizione. Posizione NON salvata nel DB.",
    ["tt_npcpossess"]                 = "Possiede indefinitamente la creatura selezionata",
    ["tt_npcunpossess"]               = "Rilascia il possesso della creatura selezionata",
    ["tt_NPCFreezeButton"]            = "Ferma il movimento dell'NPC selezionato, salvando i Waypoint",
    ["tt_NPCFreezeDelButton"]         = "Ferma il movimento dell'NPC selezionato, NON salvando i Waypoint",
    ["tt_WayEndAdd"]                  = "Aggiunge un waypoint alla fine dello stack esistente",
    ["tt_NPCAddWay"]                  = "Aggiunge un waypoint allo stack. Il GUID della creatura deve essere nella casella sotto",
    ["tt_WayMAdd"]                    = "Aggiunge un waypoint allo stack di movimento esistente della creatura selezionata",
    ["tt_WayModifyDel"]               = "Elimina il waypoint selezionato dallo stack di movimento esistente della creatura",
    ["tt_WayShow0"]                   = "Smetti di mostrare i waypoint per la creatura selezionata.",
    ["tt_WayShow1"]                   = "Mostra i waypoint per la creatura selezionata.",
    ["tt_NPCAdd_WayShowOn"]           = "mostra i waypoint per la creatura selezionata",
    ["tt_NPCUnFreeze_RandomButton"]   = "Consente movimento casuale dell'NPC selezionato.",
    ["tt_NPCUnFreeze_WayButton"]      = "Consente movimento waypoint dell'NPC selezionato.",
    ["tt_MoveStackButton"]            = "Mostra lo stack di movimento del personaggio selezionato.",
  --[[Control Labels]]
    ["Morph"]                         = "Trasforma",
    ["ma_NPCKillButton"]              = "Uccidi",
    ["ma_Respawn"]                    = "Respawn",
    ["ma_NPCDistanceButton"]          = "Distanza",
    ["ma_NPCGUIDButton"]              = "Mostra GUID",
    ["ma_NPCInfoButton"]              = "Info NPC",
    ["ma_NPCDemorph"]                 = "Rimuovi Trasf",
    ["ma_NPCMove"]                    = "Muovi NPC",
    ["ma_NPCDel"]                     = "Elimina NPC",
    ["ma_getguid"]                    = "Ottieni GUID",
    ["ma_NPCAdd"]                     = "Aggiungi NPC",
    ["ma_NPCGo"]                      = "Vai NPC",
    ["ma_NPCMorph"]                   = "Trasforma",
    ["ma_NPCSay"]                     = "NPC Dice",
    ["ma_NPCYell"]                    = "NPC Grida",
    ["ma_NPCAura"]                    = "Aura NPC",
    ["ma_NPCUnAura"]                  = "Rimuovi Aura NPC",
    ["ma_PlayEmote1"]                 = "Emote",
    ["ma_PlayEmote2"]                 = "Emote",
    ["ma_DistanceBox"]                = "Distanza",
    ["ma_NPCBindsight"]               = "LegaVisione",
    ["ma_NPCUnBindsight"]             = "SlegaVisione",
    ["ma_NPCComeToMe"]                = "VieniDaMe",
    ["ma_npcpossess"]                 = "Possiedi",
    ["ma_npcunpossess"]               = "RilasciaPossesso",
    ["ma_WayShow1"]                   = "MostraWayOn",
    ["ma_WayShow0"]                   = "MostraWayOff",
    ["ma_MoveStackButton"]            = "Mostra Movimenti",
    ["ma_NPCFreezeButton"]            = "NPCFermo",
    ["ma_WayAllDel"]                  = "NPCFermoElimina",
    ["ma_WayMAdd"]                    = "AggiungiWayM",
    ["ma_NPCUnFreeze_RandomButton"]   = "Mov Casuale",
    ["ma_NPCUnFreeze_WayButton"]      = "Mov Waypt",
    ["ma_WayMDel"]                    = "EliminaWayM",
    ["ma_WayEndAdd"]                  = "AggFineWay",
    ["ma_WayAdd"]                     = "AggWay",
    ["ma_WayShow"]                    = "MostraWay",
    ["ma_NPCRotateLeft"]              = "<<=",
    ["ma_NPCRotateRight"]             = "=>>",
    ["ma_NPCZoomIn"]                  = "+",
    ["ma_NPCZoomOut"]                 = "-",
    ["ma_NPCDisplayIDLabel"]          = "Display ID:",
    ["ma_NPCIDLabel"]                 = "NPC ID:",
    ["ma_NPCGUIDLabel"]               = "GUID:",
    ["ma_NPCDisplayDown"]             = "<<",
    ["ma_NPCDisplayUp"]               = ">>",
    ["ma_NPCIDUp"]                    = ">>",
    ["ma_NPCClearButton"]             = "Cancella",
  --[[Other]]



--[[GObjects Tab]]
  --[[Name]]
    ["tabmenu_GO"]                    = "GOB",
    ["tt_GOButton"]                   = "Attiva/disattiva una finestra con funzioni GObject.",
  --[[Tooltips]]
    ["tt_ObjGo"]                      = "Vai all'oggetto selezionato",
    ["tt_ObjAdd"]                     = "Aggiungi una copia dell'oggetto bersaglio alla tua posizione e orientamento",
    ["tt_ObjMove"]                    = "Muovi l'oggetto bersaglio alla tua posizione",
    ["tt_ObjTurn"]                    = "Ruota l'oggetto bersaglio per corrispondere al tuo orientamento",
    ["tt_ObjDel"]                     = "Elimina l'oggetto bersaglio",
    ["tt_ObjNear"]                    = "Restituisce info sugli oggetti vicino a te",
    ["tt_ObjTarget"]                  = "Bersaglia l'oggetto più vicino e mostra le info",
    ["tt_ObjActivate"]                = "Attiva l'oggetto bersaglio",
    ["tt_ObjAddTemp"]                 = "Aggiunge una copia temporanea dell'oggetto",
    ["tt_ObjInfo"]                    = "Ottieni informazioni estese sull'oggetto",
    ["tt_ObjSetPhase"]                = "Imposta la fase dell'oggetto",
    ["tt_ObjShowModel"]               = "Carica e mostra il modello",
    ["tt_ObjUnloadModel"]             = "Scarica i modelli per liberare memoria",
    ["tt_ObjMoveForward"]             = "Muovi avanti",
    ["tt_ObjMoveBack"]                = "Muovi indietro",
    ["tt_ObjMoveLeft"]                = "Muovi a sinistra",
    ["tt_ObjMoveRight"]               = "Muovi a destra",
    ["tt_ObjMoveUp"]                  = "Muovi su",
    ["tt_ObjMoveDown"]                = "Muovi giù",
    ["tt_ObjSpawnHere"]               = "Spawna qui",
  --[[Control Labels]]
    ["ma_OBJGo"]                      = "Vai Ogg",
    ["ma_OBJAdd"]                     = "Aggiungi Ogg",
    ["ma_OBJMove"]                    = "Muovi Ogg",
    ["ma_OBJTurn"]                    = "Ruota Ogg",
    ["ma_OBJDel"]                     = "Elimina Ogg",
    ["ma_OBJNear"]                    = "Ogg Vicini",
    ["ma_OBJTarget"]                  = "Bersaglia Ogg",
    ["ma_OBJActivate"]                = "Attiva Ogg",
    ["ma_OBJAddTemp"]                 = "Aggiungi Ogg Tmp",
    ["ma_OBJInfo"]                    = "Info Ogg",
    ["ma_OBJSetPhase"]                = "Fase Ogg",
    ["ma_GOGUIDLabel"]                = "GUID",
    ["ma_GOEntryIDLabel"]             = "EntryID",
    ["ma_GODisplayIDLabel"]           = "DisplayID",
    ["ma_GORangeLabel"]               = "Raggio",
    ["ma_GOAddOnMoveLabel"]           = "Aggiungi al Movimento",
    ["ma_GOMoveOnMoveLabel"]          = "Muovi al Movimento",
    ["ma_GOMoveDistancesLabel"]       = "Distanze Movimento",
    ["ma_GOFwdBackLabel"]             = "Avanti/Indietro:",
    ["ma_GOLeftRightLabel"]           = "Sinistra/Destra:",
    ["ma_GOUpDownLabel"]              = "Su/Giù:",
    ["ma_GORotateLeft"]               = "<<",
    ["ma_GORotateRight"]              = ">>",
    ["ma_GOZoomIn"]                   = "+",
    ["ma_GOZoomOut"]                  = "-",
    ["ma_GOMoveForward"]              = "AVANTI",
    ["ma_GOMoveLeft"]                 = "SINISTRA",
    ["ma_GOMoveRight"]                = "DESTRA",
    ["ma_GOMoveBack"]                 = "INDIETRO",
    ["ma_GOSpawnHere"]                = "QUI",
    ["ma_GOMoveUp"]                   = "SU",
    ["ma_GOMoveDown"]                 = "GIÙ",
    ["ma_GOShowButton"]               = "Mostra",
    ["ma_GOUnloadButton"]             = "Scarica",
  --[[Other]]



--[[Tele Tab]]
  --[[Name]]
    ["tabmenu_Tele"]                  = "TELE",
    ["tt_TeleButton"]                 = "Attiva/disattiva una finestra con funzioni di teletrasporto.",
  --[[Tooltips]]
  --[[Control Labels]]
    ["Zone"]                          = "|cFF00FF00Zona:|r ",
    ["ma_ContinentSelection"]         = "Selezione Continente",
    ["ma_EasternKingdomsN"]           = "Regni Orientali (N)",
    ["ma_EasternKingdomsS"]           = "Regni Orientali (S)",
    ["ma_Kalimdor"]                   = "Kalimdor",
    ["ma_Outland"]                    = "Outland",
    ["ma_NorthrendAlliance"]          = "Nordania-Alleanza",
    ["ma_NorthrendHorde"]             = "Nordania-Orda",
    ["ma_BattlegroundsArenas"]        = "Campi di Battaglia/Arene",
    ["ma_InstancesEastern"]           = "Istanze: Orientali",
    ["ma_InstancesKalimdor"]          = "Istanze: Kalimdor",
    ["ma_InstancesOutland"]           = "Istanze: Outland",
    ["ma_InstancesNorthrend"]         = "Istanze: Nordania",
    ["ma_Other"]                      = "Altro",
    ["ma_ZoneSelection"]              = "Selezione Zona",
    ["ma_SelectedSubzone"]            = "Sottozona Selezionata",
  --[[Other]]
    ["ma_NoZones"]                    = "Nessuna zona!",
    ["ma_NoSubZones"]                 = "Nessuna sottozona!",



--[[Tickets Tab]]
  --[[Name]]
    ["tabmenu_ticket"]                = "TICKET",
    ["tt_TicketButton"]               = "Attiva/disattiva una finestra che mostra tutti i ticket e ti permette di amministrarli.",
  --[[Tooltips]]
    ["tt_TicketOn"]                   = "Annuncia nuovi ticket.",
    ["tt_TicketOff"]                  = "Non annunciare nuovi ticket.",
    ["tt_ResetTickets"]               = "Ripristina i ticket caricati",
    ["tt_LoadAllTickets"]             = "Carica tutti i ticket",
    ["tt_LoadOnlineTickets"]          = "Carica i ticket dei giocatori online",
    ["tt_DeleteTicket"]               = "Elimina ticket",
    ["tt_AnswerTicket"]               = "Rispondi al ticket",
    ["tt_GetCharTicket"]              = "Evoca il personaggio del ticket",
    ["tt_GoCharTicket"]               = "Vai al personaggio del ticket",
    ["tt_WhisperTicket"]              = "Sussurra al personaggio del ticket",
    ["tt_GoTicket"]                   = "Vai alla posizione del ticket",
    ["tt_ShowTickets"]                = "Mostra i ticket caricati",
  --[[Control Labels]]
    ["ma_ticketidlabel"]              = "|cFF00FF00Ticket:",
    ["ma_ticketcreatedbylabel"]       = "|cFF00FF00Creato da:",
    ["ma_tickettimecreatedlabel"]     = "|cFF00FF00Creato:",
    ["ma_ticketlastchangelabel"]      = "|cFF00FF00Ultima modifica:",
    ["ma_ticketmessagelabel"]         = "|cFF00FF00Messaggio Ticket:",
    ["ma_LoadTicketsButton"]          = "Aggiorna",
    ["ma_GetCharTicketButton"]        = "Evoca",
    ["ma_GoCharTicketButton"]         = "Vai Giocatore",
    ["ma_AnswerButton"]               = "Posta",
    ["ma_DeleteButton"]               = "Chiudi",
    ["ma_ticketwhisperbutton"]        = "Sussurra",
    ["ma_TicketCount"]                = "|cFF00FF00Ticket:|r ",
    ["ma_TicketsNoNew"]               = "Non hai nuovi ticket.",
    ["ma_TicketsNewNumber"]           = "Hai |cffeda55f%s|r nuovi ticket!",
    ["ma_TicketsGoLast"]              = "Vai all'ultimo creatore di ticket (%s).",
    ["ma_TicketsGetLast"]             = "Porta %s da te.",
    ["ma_TicketsInfoPlayer"]          = "|cFF00FF00Giocatore:|r ",
    ["ma_TicketsInfoStatus"]          = "|cFF00FF00Stato:|r ",
    ["ma_TicketsInfoAccount"]         = "|cFF00FF00Account:|r ",
    ["ma_TicketsInfoAccLevel"]        = "|cFF00FF00Livello Account:|r ",
    ["ma_TicketsInfoLastIP"]          = "|cFF00FF00Ultimo IP:|r ",
    ["ma_TicketsInfoPlayedTime"]      = "|cFF00FF00Tempo giocato:|r ",
    ["ma_TicketsInfoLevel"]           = "|cFF00FF00Livello:|r ",
    ["ma_TicketsInfoMoney"]           = "|cFF00FF00Denaro:|r ",
    ["ma_TicketsInfoLatency"]         = "|cFF00FF00Latenza:|r ",
    ["ma_TicketsNoInfo"]              = "Nessuna info disponibile",
    ["ma_TicketsNotLoaded"]           = "Nessun ticket caricato...",
    ["ma_TicketsNoTickets"]           = "Nessun ticket disponibile!",
    ["ma_TicketResetButton"]          = "RIPRISTINA",
    ["ma_TicketLoadAllButton"]        = "Carica Tutti",
    ["ma_TicketLoadOnlineButton"]     = "Carica Online",
    ["ma_TicketShowButton"]           = "MOSTRA",
    ["ma_TicketGoButton"]             = "Vai Ticket",
    ["ma_TicketTicketLoaded"]         = "|cFF00FF00Ticket Caricato-Nr:|r %s\n\nInformazioni Giocatore\n\n",
    ["ma_Reload"]                     = "Ricarica",
    ["ma_LoadMore"]                   = "Carica altro...",
  --[[Other]]



--[[Misc Tab]]
  --[[Name]]
    ["tabmenu_Misc"]                  = "VARIE",
    ["tt_MiscButton"]                 = "Attiva/disattiva una finestra con azioni varie.",
  --[[Tooltips]]
    ["tt_FrmTrSlider"]                = "Cambia trasparenza cornice",
    ["tt_BtnTrSlider"]                = "Cambia trasparenza pulsante",
    ["tt_windowismovable"]            = "Permetti una finestra mobile",
    ["tt_updatechanges"]              = "Applica le modifiche apportate alle impostazioni. Ricarica l'UI.",
  --[[Control Labels]]
    ["cmd_toggle"]                    = "Attiva/disattiva la finestra principale",
    ["cmd_transparency"]              = "Attiva/disattiva la trasparenza di base (0.5 o 1.0)",
    ["cmd_tooltip"]                   = "Attiva/disattiva se i tooltip dei pulsanti sono mostrati o meno",
    ["ma_EnableTransparency"]         = "Abilita Trasparenza",
    ["ma_EnableLocalizedSearch"]      = "Abilita Stringhe di Ricerca Localizzate",
    ["ma_EnableMinimenu"]             = "Abilita Minimenu/Toolbar",
    ["ma_EnableTooltips"]             = "Abilita Tooltip",
    ["ma_ShowChatOutput"]             = "Mostra Output Chat",
    ["ma_FrameStrataLabel"]           = "Livello Strato Cornice:",
    ["ma_FrameStrataBackground"]      = "Sfondo",
    ["ma_FrameStrataLow"]             = "Basso",
    ["ma_FrameStrataMedium"]          = "Medio (Predefinito)",
    ["ma_FrameStrataHigh"]            = "Alto",
    ["ma_FrameStrataDialog"]          = "Dialogo",
    ["ma_FrameStrataFullscreen"]      = "Schermo Intero",
    ["ma_FrameStrataFullscreenDialog"] = "Dialogo Schermo Intero",
    ["ma_UpdateFrequencyLabel"]       = "Specifica la frequenza di aggiornamento del grafico Diff sulla scheda Server.\n10000 = ~1 minuto, 50000 = ~5 minuti",
    ["ma_BackgroundColorLabel"]       = "Colore Sfondo",
    ["ma_FrameColorLabel"]            = "Colore Cornice",
    ["ma_ButtonColorLabel"]           = "Colore Pulsante",
    ["ma_LinkifierColorLabel"]        = "MangLinkifier",
    ["ma_UpdateChangesButton"]        = "Aggiorna Modifiche",
  --[[Other]]
    ["ma_ApplyWeatherButton"]         = "Applica Meteo",
    ["ma_WeatherFine"]                = "Bello",
    ["ma_WeatherFog"]                 = "Nebbia",
    ["ma_WeatherRain"]                = "Pioggia",
    ["ma_WeatherSnow"]                = "Neve",
    ["ma_WeatherSand"]                = "Sabbia",
    ["msg_transparency_saved"]        = "|cff00ff00AzerothAdmin:|r Impostazione trasparenza salvata. Aggiorna Modifiche o Ricarica UI per applicare.",
    ["msg_localsearch_saved"]         = "|cff00ff00AzerothAdmin:|r Impostazione stringhe di ricerca localizzate salvata. Aggiorna Modifiche o Ricarica UI per applicare.",
    ["msg_minimenu_saved"]            = "|cff00ff00AzerothAdmin:|r Impostazione minimenu salvata.",
    ["msg_tooltip_saved"]             = "|cff00ff00AzerothAdmin:|r Impostazione tooltip salvata. Aggiorna Modifiche o Ricarica UI per applicare.",
    ["msg_chatoutput_saved"]          = "|cff00ff00AzerothAdmin:|r Impostazione output chat salvata.",



--[[Server Tab]]
    ["tabmenu_server"]                = "SERVER",
    ["tt_ServerButton"]               = "Mostra diverse informazioni sul server ed esegui azioni relative al server.",
  --[[Tooltips]]
    ["tt_AnnounceButton"]             = "Annuncia un messaggio di sistema.",
    ["tt_ShutdownButton"]             = "Spegni il server nella quantità di secondi dal campo, se omesso spegni immediatamente!",
    ["tt_CancelShutdownButton"]       = "Annulla il conto alla rovescia dello spegnimento del server.",
  --[[Control Labels]]
    ["ma_AnnounceButton"]             = "Annuncia",
    ["ma_ShutdownButton"]             = "Spegnimento Server",
    ["ma_CancelShutdownButton"]       = "Annulla Spegnimento",
    ["ma_ReloadTableButton"]          = "Ricarica Tabella",
    ["ma_ReloadScriptsButton"]        = "Ricarica Script",
    ["ma_ServerLatencyLabel"]         = "|cFF00FF00^Latenza Server:|r",
    ["ma_UpdateDiffLabel"]            = "|cFF00FF00^Update Diff:|r",
    ["ma_MeanLabel"]                  = "|cFF00FF00Media:|r",
    ["ma_MedianLabel"]                = "|cFF00FF00Mediana:|r",
    ["ma_PercentilesLabel"]           = "|cFF00FF00Percentili:|r",
  --[[Other]]
    ["msg_shutdown_time_required"]    = "Inserisci il tempo in secondi prima di usare lo spegnimento del server.",
    ["msg_shutdown_confirm"]          = "Sei sicuro di voler spegnere il server tra %s secondi?",



  --[[Tooltips]]
  --[[Control Labels]]
  --[[Other]]



--[[ChangeLog Tab]]  --Place holder for future update*
  --["tabmenu_changelog"] = "ChangeLog",
  --[[Tooltips]]
  --[[Control Labels]]
  --[[Other]]



--[[Pop UPs]]
  --[[General]]
  --[[ToolTips]]
    ["tt_ItemButton"]                 = "Attiva/disattiva un popup con la funzione per cercare oggetti e gestire i tuoi preferiti.",
    ["tt_ItemSetButton"]              = "Attiva/disattiva un popup con la funzione per cercare set di oggetti e gestire i tuoi preferiti.",
    ["tt_SpellButton"]                = "Attiva/disattiva un popup con la funzione per cercare incantesimi e gestire i tuoi preferiti.",
    ["tt_QuestButton"]                = "Attiva/disattiva un popup con la funzione per cercare missioni e gestire i tuoi preferiti.",
    ["tt_CreatureButton"]             = "Attiva/disattiva un popup con la funzione per cercare creature e gestire i tuoi preferiti.",
    ["tt_ObjectButton"]               = "Attiva/disattiva un popup con la funzione per cercare oggetti e gestire i tuoi preferiti.",
    ["tt_SearchDefault"]              = "Ora puoi inserire una parola chiave e avviare la ricerca.",
    ["tt_SkillButton"]                = "Attiva/disattiva un popup con la funzione per cercare abilità e gestire i tuoi preferiti.",
  --[[Labels]]
    ["ma_PopupErrorTab"]              = "ERRORE",
    ["ma_PopupFavoritesTab"]          = "Preferiti",
    ["ma_PopupTab3"]                  = "Tab 3",
    ["ma_PopupAmountLabel"]           = "Quantità:",
    ["ma_PopupInvisibleText"]         = "Invisibile",
    ["ma_ItemButton"]                 = "Ricerca-Oggetti",
    ["ma_ItemSetButton"]              = "Ricerca-SetOggetti",
    ["ma_SpellButton"]                = "Ricerca-Incantesimi",
    ["ma_QuestButton"]                = "Ricerca-Missioni",
    ["ma_CreatureButton"]             = "Ricerca-Creature",
    ["ma_ObjectButton"]               = "Ricerca-Oggetti",
    ["ma_TeleSearchButton"]           = "Ricerca-Teletrasporto",
    ["ma_MailRecipient"]              = "Destinatario",
    ["ma_Mail"]                       = "Invia Posta",
    ["ma_Send"]                       = "Invia",
    ["ma_MailSubject"]                = "Oggetto",
    ["ma_MailYourMsg"]                = "Qui il tuo messaggio!",
    ["ma_SearchButton"]               = "Cerca...",
    ["ma_ResetButton"]                = "Ripristina",
    ["ma_FavAdd"]                     = "Aggiungi selezionato",
    ["ma_FavRemove"]                  = "Rimuovi selezionato",
    ["ma_SelectAllButton"]            = "Seleziona tutto",
    ["ma_DeselectAllButton"]          = "Deseleziona tutto",
    ["ma_MailBytesLeft"]              = "Byte rimanenti: ",
    ["ma_SkillButton"]                = "Ricerca-Abilità",
    ["ma_SkillVar1Button"]            = "Abilità",
    ["ma_SkillVar2Button"]            = "Abilità Max",
    ["ma_ItemVar1Button"]             = "Quantità",
    ["ma_ObjectVar1Button"]           = "Template Bottino",
    ["ma_ObjectVar2Button"]           = "Tempo Spawn",
    ["ma_NoFavorites"]                = "Attualmente non ci sono preferiti salvati!",
    ["favoriteResults"]               = "|cFF00FF00Preferiti:|r ",



--[[Deprecated, but may be used again.]]
    ["ma_LearnAllButton"]             = "Tutti gli incantesimi",
    ["ma_LearnCraftsButton"]          = "Tutte le professioni e ricette",
    ["ma_LearnGMButton"]              = "Incantesimi GM predefiniti",
    ["ma_LearnClassButton"]           = "Tutti gli incantesimi di classe",
    ["ma_GPSButton"]                  = "GPS",
    ["ma_Online"]                     = "Online",
    ["ma_Offline"]                    = "Offline",



--[[Linkifier]]
    ["lfer_Spawn"]                    = "Spawna",
    ["lfer_List"]                     = "Lista",
    ["lfer_Reload"]                   = "Ricarica",
    ["lfer_Goto"]                     = "Vai a",
    ["lfer_Move"]                     = "Muovi",
    ["lfer_Turn"]                     = "Ruota",
    ["lfer_Delete"]                   = "Elimina",
    ["lfer_Teleport"]                 = "Teletrasporto",
    ["lfer_Morph"]                    = "Trasforma",
    ["lfer_Add"]                      = "Aggiungi",
    ["lfer_Remove"]                   = "Rimuovi",
    ["lfer_Learn"]                    = "Impara",
    ["lfer_Unlearn"]                  = "Dimentica",
    ["lfer_Error"]                    = "Errore Stringa di Ricerca Corrispondente ma si è verificato un errore o impossibile trovare il tipo"

}
end
