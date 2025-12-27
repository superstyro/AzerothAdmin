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
1. Edit the first un-commented line below, which should resemble: function Return_ptPT(). Change
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

function Return_ptPT()
  return {
--[[General]]
  --[[Tooltips]]
    ["tt_Default"]                    = "Move your cursor over an element to toggle the tooltip!",
    ["tt_LanguageButton"]             = "Reload AzerothAdmin and apply selected language.",
    ["tt_RefreshButton"]              = "Refresh server information.",
  --[[Control Labels]]
    ["ma_LanguageButton"]             = "Reload UI",
    ["ma_RefreshButton"]              = "Refresh",
    ["ma_TopText"]                    = "toptext, you should not see this!",
    ["ma_Top2Text"]                   = "toptext, you should not see this!",
    ["ma_InfoOnlineText"]             = "Players Online: ...",
    ["ma_InfoMaxOnlineText"]          = "Maximum Online: ...",
    ["ma_InfoUptimeText"]             = "Server Uptime: ...",
    ["ma_InfoRevisionText"]           = "AzerothCore Revision: ...",
    ["info_revision"]                 = "|cFF00FF00AzerothCore rev.|r ",
    ["info_platform"]                 = "|cFF00FF00Server Platform:|r ",
    ["info_online"]                   = "|cFF00FF00Players Online:|r ",
    ["info_maxonline"]                = "|cFF00FF00Maximum Online:|r ",
    ["info_uptime"]                   = "|cFF00FF00Uptime:|r ",
    ["ma_CloseWindow"]                = "X",
    ["tt_CloseWindow"]                = "Close Window",
  --[[Other]]
    ["slashcmds"]                     = { "/AzerothAdmin", "/aa" },
    ["lang"]                          = "Português",
    ["realm"]                         = "|cFF00FF00Realm:|r "..GetCVar("realmName"), 
    ["char"]                          = "|cFF00FF00Char:|r "..UnitName("player"), 
    ["guid"]                          = "|cFF00FF00Guid:|r ",
    ["tickets"]                       = "|cFF00FF00Tickets:|r ",
    ["selectionerror1"]               = "Please select only yourself, another player or nothing!",
    ["selectionerror2"]               = "Please select only yourself or nothing!",
    ["selectionerror3"]               = "Please select only another player!",
    ["selectionerror4"]               = "Please select only a NPC!",
    ["numbererror"]                   = "Value must be a number!",
    ["searchResults"]                 = "|cFF00FF00Search-Results:|r ",
    ["ma_parameters"]                 = "Parameter(s):", --Used on multiple tabs



--[[GM tab]]
  --[[Name]]
    ["tabmenu_Main"]                  = "GM",
  --[[Tooltips]]
    ["tt_MainButton"]                 = "Toggle AzerothAdmins Mainframe.",
    ["tt_DisplayAccountLevel"]        = "Display your account level",
    ["tt_GMOnButton"]                 = "Activate your GM-mode.",
    ["tt_GMOffButton"]                = "Deactivate your GM-mode.",
    ["tt_FlyOnButton"]                = "Activate the Fly-mode for the selected character.",
    ["tt_FlyOffButton"]               = "Deactivate the Fly-mode for the selected character.",
    ["tt_HoverOnButton"]              = "Activate your Hover-mode.",
    ["tt_HoverOffButton"]             = "Deactivate your Hover-mode.",
    ["tt_WhispOnButton"]              = "Accept whispers from other players.",
    ["tt_WhispOffButton"]             = "Do not accept whispers from other players.",
    ["tt_InvisOnButton"]              = "Make you invisible.",
    ["tt_InvisOffButton"]             = "Make you visible.",
    ["tt_TaxiOnButton"]               = "Show all taxi-routes to the selected player. This cheat will be deactivated on logout.",
    ["tt_TaxiOffButton"]              = "Deactivate the taxi-cheat and restore the players known taxi-routes.",
    ["tt_ShowMapsButton"]             = "Reveals maps for the selected character.",
    ["tt_HideMapsButton"]             = "Hides maps for the selected character.",
    ["tt_SpeedSlider"]                = "Increase or decrease the speed for the selected character.",
    ["tt_ScaleSlider"]                = "Increase or decrease the scale for the selected character.",
    ["tt_instakill"]                  = "When checked, clicking an enemy creature kills it.",
    ["tt_ScreenButton"]               = "Make a screenshot.",
    ["tt_BankButton"]                 = "Show your bank.",
    ["tt_Dismount"]                   = "Dismounts you, if you are mounted",
    ["tt_SetJail_A_Button"]           = "Sets the location of the Alliance Jail to your current location.",
    ["tt_SetJail_H_Button"]           = "Sets the location of the Horde Jail to your current location.",
    ["tt_N"]                          = "Navigate North",
    ["tt_S"]                          = "Navigate South",
    ["tt_E"]                          = "Navigate East",
    ["tt_W"]                          = "Navigate West",
  --["tt_chatonbutton"]               = "Turn GM Chat ON",
  --["tt_chatoffbutton"]              = "Turn GM Chat OFF",
    ["tt_waterwalkonbutton"]          = "Turn Waterwalk ON for the selected creature"  ,
    ["tt_watewrwalkoffbutton"]        = "Turn Waterwalk OFF for the selected creature",
    ["tt_accountlockonbutton"]        = "Lock your account",
    ["tt_accountlockoffbutton"]       = "UnLock your account",
    ["tt_DisplayAccountLvl"]          = "Display your account level.",
    ["tt_SpeedSliderReset"]           = "Reset Speed to 1.0",
    ["tt_ScaleSliderReset"]           = "Reset Scale to 1.0",
    ["tt_gmnotifybutton"]             = "Sends message $message to all online GMs [[Parameters: $message]]",
    ["tt_gmingamebutton"]             = "Shows GMs who are logged in.",
    ["tt_gmlistbutton"]               = "Shows the GM accounts on this server",
    ["tt_petcreatebutton"]            = "Makes the selected ANIMAL your pet.",
    ["tt_petlearnbutton"]             = "Teaches your pet spell [[Parameter: #SPELLID]]",
    ["tt_petunlearnbutton"]           = "Un-Teaches your pet spell [[Parameter: #SPELLID]]",
    ["tt_pettpbutton"]                = "Modifies pet's training points [[Parameter: #points]]",
    ["tt_lookuptaxibutton"]           = "Lookup a TaxiNode [[Parameter: $Areanamepart]]",
    ["tt_gotaxinodebutton"]           = "Teleports to given TaxiNode [[Parameter: #taxinode]]",
    ["tt_gotriggerbutton"]            = "Teleports to given area trigger [[Parameter: #trigger_id]]",
    ["tt_goxybutton"]                 = "Teleports to given coordinates at ground/water level on MapID. If MapID omitted, current map [[Parameters: #x #y [#mapid]]]",
    ["tt_goxyzbutton"]                = "Teleports to given coordinates at #z level on MapID. If MapID omitted, current map [[Parameters: #x #y #z [#mapid]]]",
    ["tt_gozonexybutton"]             = "Teleports to given coordinates at ground/water level in ZoneID. If ZoneID omitted, current zone [[Parameters: #x #y [#zoneid]]]",
    ["tt_lookupzonebutton"]           = "Lookup a Zone. [[Parameters: $Areanamepart]]",
    ["tt_castbutton"]                 = "Cast a spell. [[Parameters: #SpellID]]",
    ["tt_castbackbutton"]             = "Selected creature will cast spell [SpellID] at YOU. [[Parameters: #SpellID]]",
    ["tt_castdistbutton"]             = "You cast a spell [SpellID] at distance [#Dist]. [[Parameters: #SpellID #Dist]]",
    ["tt_castselfbutton"]             = "Selected creature casts spell [SpellID] at itself. [[Parameters: #SpellID]]",
    ["tt_casttargetbutton"]           = "Selected creature casts spell [SpellID] at it's target. [[Parameters: #SpellID]]",
    ["tt_gmclearbutton"]              = "Clears the parameter box.",
    ["tt_listitembutton"]             = "Lists all occurences of [#itemID]. [[Parameters: #ItemID]]",
    ["tt_acctcreatebutton"]           = "Creates a player account [[Parameters: $accountname $password]]",
    ["tt_acctdeletebutton"]           = "Deletes a player account and all characters [[Parameters: $accountname]]",
    ["tt_acctaddonbutton"]            = "Sets $account to use #addon(0=WoW, 1=TBC, 2=WotLK) [[Parameters: $accountname #addon]]",
    ["tt_acctgmlvlbutton"]            = "Sets $account to #gmlevel (0=Player, 1=Helper, 2=Assistant, 3=GM, 4=Admin) [[Parameters: $accountname #gmlevel]]",
    ["tt_acctpasswdbutton"]           = "Sets $account $password [[Parameters: $accountname $password $password]]",
  --[[Control Labels]]
    ["ma_OffButton"]                  = "Off",
    ["ma_displaylevelbutton"]         = "Display Account Level",
    ["ma_GMOnButton"]                 = "GM-mode on",
    ["ma_FlyOnButton"]                = "Fly-mode on",
    ["ma_HoverOnButton"]              = "Hover-mode on",
    ["ma_WhisperOnButton"]            = "Whisper on",
    ["ma_InvisOnButton"]              = "Invisibility on",
    ["ma_TaxiOnButton"]               = "Cheat Taxi on",
    ["ma_ShowMapsButton"]             = "Show Maps",
    ["ma_HideMapsButton"]             = "Hide Maps",
    ["ma_instakill"]                  = "Insta-kill creatures",
    ["ma_ScreenshotButton"]           = "Screenshot",
    ["ma_BankButton"]                 = "Bank",
    ["ma_DismountButton"]             = "Dismount",
    ["ma_SetJail_A_Button"]           = "SetJail A",
    ["ma_SetJail_H_Button"]           = "SetJail H",
    ["gridnavigator"]                 = "Grid-Navigator",
    ["N"]                             = "N", --Abbreviation for North
    ["S"]                             = "S", --Abbreviation for South
    ["E"]                             = "E", --Abbreviation for East
    ["W"]                             = "W", --Abbreviation for West
    ["ma_chatbutton"]                 = "GM Chat On",
    ["ma_mapsbutton"]                 = "View All Maps",
    ["ma_waterwalkbutton"]            = "Waterwalk On",
    ["ma_accountlockbutton"]          = "Account Lock",
    ["ma_gmnotify"]                   = "GM Notify",
    ["ma_gmingame"]                   = "GMs InGame",
    ["ma_gmlist"]                     = "GM List",
    ["ma_petcreate"]                  = "Pet Create",
    ["ma_petlearn"]                   = "Pet Learn",
    ["ma_petunlearn"]                 = "Pet UnLearn",
    ["ma_pettp"]                      = "Pet TP",
    ["ma_lookuptaxi"]                 = "Lookup Taxi",
    ["ma_gotaxinode"]                 = "Go TaxiNode",
    ["ma_gotrigger"]                  = "Go Trigger",
    ["ma_goxy"]                       = "Go XY",
    ["ma_goxyz"]                      = "Go XYZ",
    ["ma_gozonexy"]                   = "Go ZoneXY",
    ["ma_lookupzone"]                 = "Lookup Zone",
    ["ma_cast"]                       = "Cast",
    ["ma_castback"]                   = "Cast Back",
    ["ma_castdist"]                   = "Cast Dist",
    ["ma_castself"]                   = "Cast Self",
    ["ma_casttarget"]                 = "Cast Target",
    ["ma_listitem"]                   = "List Item",
    ["ma_GmClear"]                    = "Clear Params",
    ["ma_acctcreate"]                 = "Acct Create",
    ["ma_acctdelete"]                 = "Acct Delete",
    ["ma_acctaddon"]                  = "Acct Addon",
    ["ma_acctgmlvl"]                  = "Acct GMLvl",
    ["ma_acctpasswd"]                 = "Acct Passwd",
    ["ma_MiniMenuGM"]                 = "Gm",
    ["ma_MiniMenuChar"]               = "Cr",
    ["ma_MiniMenuNPC"]                = "Np",
    ["ma_MiniMenuGO"]                 = "GO",
    ["ma_MiniMenuTele"]               = "Te",
    ["ma_MiniMenuTicket"]             = "Ti",
    ["ma_MiniMenuMisc"]               = "Mi",
    ["ma_MiniMenuServer"]             = "Se",
    ["ma_MiniMenuLog"]                = "Lo",
    ["ma_MiniMenuRevive"]             = "REVIVE!",
  --[[Other]]



--[[Char Tab]]
  --[[Name]]
    ["tabmenu_Char"]                  = "CHAR",
    ["tt_CharButton"]                 = "Toggle a window with character-specific actions.",
  --[[Tooltips]]
    ["tt_RotateLeft"]                 = "Rotate left.",
    ["tt_RotateRight"]                = "Rotate right.",
    ["tt_killbutton"]                 = "Kills selected creature/player",
    ["tt_reviveplayer"]               = "Revives the selected player",
    ["tt_saveplayer"]                 = "Saves the selected player's character",
    ["tt_KickButton"]                 = "Kick the selected player from the server.",
    ["tt_CooldownButton"]             = "Removes/expires all spell affect cooldowns on the selected character.",
    ["tt_GUIDButton"]                 = "Shows the GUID of the selected character.",
    ["tt_PinfoButton"]                = "Get information on the selected PLAYER.",
    ["tt_DistanceButton"]             = "Get distance to the selected creature.",
    ["tt_RecallButton"]               = "Recalls selected creature to location before last teleport.",
    ["tt_DemorphButton"]              = "Removes any morphs on the selected character.",
    ["tt_ShowMapsCharButton"]         = "Reveals maps for the selected character.",
    ["tt_HideMapsCharButton"]         = "Hides maps for the selected character.",
    ["tt_learnlangbutton"]            = "Learn selected spells",
    ["tt_modifybutton"]               = "Modify the selected attribute by the entered amount",
    ["tt_resetbutton"]                = "Reset the selected attribute",
    ["tt_modelzoominbutton"]          = "Zoom in the selected model",
    ["tt_modelzoomoutbutton"]         = "Zoom out the selected model",
    ["tt_charbindsight"]              = "Binds your vision to the selected Unit",
    ["tt_charunbindsight"]            = "UnBinds your vision to the selected Unit",
    ["tt_charrename"]                 = "Toggles selected character for rename at next login",
    ["tt_charcustomize"]              = "Toggles selected character for customization at next login",
    ["tt_charchangerace"]             = "Toggles selected character for race change at next login",
    ["tt_charchnagefaction"]          = "Toggles selected character for faction change at next login",
    ["tt_charcombatstop"]             = "Stops combat for the selected character (or yourself)",
    ["tt_charmaxskill"]               = "Sets the selected characters skills to max value for level",
    ["tt_charfreeze"]                 = "Freezes targeted player and disables their chat",
    ["tt_charunfreeze"]               = "UnFreezes selected player and restores chat",
    ["tt_charlistdeleted"]            = "Lists deleted characters in chat window",
    ["tt_chardeletedrestore"]         = "Parameters= #guid|$name [$newname] [#new account] [[This command is WIP]",
    ["tt_charpossess"]                = "Indefinitely possesses the selected creature",
    ["tt_charunpossess"]              = "Unpossesses the selected creature",
    ["tt_charrecall"]                 = "Recalls the selected player to the last teleport position they had",
    ["tt_charrepair"]                 = "Repairs the selected player's armor and weapons",
    ["tt_banbutton"]                  = "Parameters= <account|ip|character> $NameOrIp <-1|xxdyyhzzm> $reason   [[Ban acct/IP & kick. -1=permban, or a string like 4d3h24m16s]]",
    ["tt_gonamebutton"]               = "Parameter= $charactername  [[Teleports you to the specified character]]",
    ["tt_createguildbutton"]          = "Parameters= $GuildLeaderName $GuildName  [[Creates a guild named $GuildName, with $GuildLeaderName as leader]]",
    ["tt_teleaddbutton"]              = "Parameter= $Name  [[Adds a teleport location .tele command for your current location with the name $Name]]",
    ["tt_baninfobutton"]              = "Parameter= <account|ip|character>  [[View detailed info about bans on the specified account/ip/character]]",
    ["tt_groupgobutton"]              = "Parameter= $charactername   [[Teleports the specified character and his/her group to your location]]",
    ["tt_guildinvitebutton"]          = "Parameters= $charactername $guildname   [[Adds $charactername to the guild $guildname]]",
    ["tt_teledelbutton"]              = "Parameter= $telename  [[Removes the location named $telename from the .tele locations list]]",
    ["tt_banlistbutton"]              = "Parameters= <account|ip> $NameOrIp   [[Searches and returns for specific bans matching the parameters]]",
    ["tt_namegobutton"]               = "Parameter= $charactername   [[Teleports the specified character to your location]]",
    ["tt_guildrankbutton"]            = "Parameters= $charactername #ranknumber   [[Sets the character specified to the rank specified in his/her guild]]",
    ["tt_telegroupbutton"]            = "Parameter= $telename  [[Teleports the **selected** character and his/her group to the .tele location named $telename]]",
    ["tt_unbanbutton"]                = "Parameters= <account|ip|character> $NameOrIp  [[Unbans the specified acct/IP/character]]",
    ["tt_guilddeletebutton"]          = "Parameter= $guildname  [[Deletes the specified Guild]]",
    ["tt_guilduninvitebutton"]        = "Parameter= $charactername  [[Kicks the specified character out of his/her guild]]",
    ["tt_telenamebutton"]             = "Parameters= $charactername $telename  [[Teleports $charactername to $telename]]",
    ["tt_mutebutton"]                 = "Parameters= $charactername #minutes  [[Disables chat for $charactername's entire account for #minutes]]",
    ["tt_charmorphbutton"]            = "Parameters = #DisplayID [[Enter the DisplayID of the morph you want to apply]]",
    ["tt_charaurabutton"]             = "Parameters = #AuraID [[Enter the AuraID of the aura you want to apply]]",
    ["tt_charunaurabutton"]           = "Parameters = #AuraID [[Enter the AuraID of the aura you want to remove]]",
    ["tt_JailAButton"]                = "Parameter= $charactername [[Sends the character whose name appears in this box to the Alliance Jail]]",
    ["tt_JailHButton"]                = "Parameter= $charactername [[Sends the character whose name appears in this box to the Horde Jail]]",
    ["tt_UnJailButton"]               = "Parameter= $charactername [[Unjails the character whose name appears in this box.]]",
    ["tt_UnMuteButton"]               = "Unmutes $player.",
    ["tt_QuestAddButton"]             = "Adds #questid to **selected** player.",
    ["tt_QuestCompleteButton"]        = "Marks #questid as complete for **selected** player.",
    ["tt_QuestRemoveButton"]          = "Removes #questid from **selected** player.",
    ["tt_DamageButton"]               = "Parameter= #amount of damage to apply to **selected** creature/player",
    ["tt_HideAreaButton"]             = "Hides #areaid from **selected** player.",
    ["tt_ShowAreaButton"]             = "Shows #areaid to **selected** player.",
    ["tt_HonorAddButton"]             = "Adds #honorpoints to **selected** player.",
    ["tt_HonorUpdateButton"]          = "No parameter required. Saves Honor for **selected** player.",
  --[[Control Labels]]
    ["ma_KillButton"]                 = "Kill",
    ["ma_ReviveButton"]               = "Revive",
    ["ma_SaveButton"]                 = "Save",
    ["ma_KickButton"]                 = "Kick",
    ["ma_CooldownButton"]             = "Cooldown",
    ["ma_GUIDButton"]                 = "Show GUID",
    ["ma_PinfoButton"]                = "PLAYER Info",
    ["ma_DistanceButton"]             = "Distance",
    ["ma_RecallButton"]               = "Recall",
    ["ma_DemorphButton"]              = "Demorph",
    ["ma_ShowMapsCharButton"]         = "Show Maps",
    ["ma_HideMapsCharButton"]         = "Hide Maps",
    ["ma_LearnLangButton"]            = "All languages",
    ["ma_Learn"]                      = "Learn",
    ["ma_Modify"]                     = "Modify",
    ["ma_Reset"]                      = "Reset",
    ["ma_CharBindsight"]              = "BindSight",
    ["ma_CharUnBindsight"]            = "UnBindSight",
    ["ma_charrename"]                 = "Rename",
    ["ma_charcustomize"]              = "Customize",
    ["ma_charchangerace"]             = "Chng Race",
    ["ma_charchnagefaction"]          = "Chng Faction",
    ["ma_charcombatstop"]             = "CombatStop",
    ["ma_charmaxskill"]               = "MaxSkill",
    ["ma_charfreeze"]                 = "Freeze",
    ["ma_charunfreeze"]               = "UnFreeze",
    ["ma_charlistdeleted"]            = "ListDelChar",
    ["ma_chardeletedrestore"]         = "DelChrRestore",
    ["ma_charpossess"]                = "Possess",
    ["ma_charunpossess"]              = "UnPossess",
    ["ma_charrecall"]                 = "Recall",
    ["ma_charrepair"]                 = "Repair",
    ["ma_banbutton"]                  = "Ban",
    ["ma_gonamebutton"]               = "Appear",
    ["ma_createguildbutton"]          = "G Create",
    ["ma_teleaddbutton"]              = "TeleAdd",
    ["ma_baninfobutton"]              = "BanInfo",
    ["ma_groupgobutton"]              = "GroupSumn",
    ["ma_guildinvitebutton"]          = "G Invite",
    ["ma_teledelbutton"]              = "TeleDel",
    ["ma_banlistbutton"]              = "BanList",
    ["ma_namegobutton"]               = "Summon",
    ["ma_guildrankbutton"]            = "G Rank",
    ["ma_telegroupbutton"]            = "TeleGroup",
    ["ma_unbanbutton"]                = "UnBan",
    ["ma_guilddeletebutton"]          = "G Delete",
    ["ma_guilduninvitebutton"]        = "G UnInv",
    ["ma_telenamebutton"]             = "TeleName",
    ["ma_mutebutton"]                 = "Mute",
    ["ma_Aura"]                       = "Aura",
    ["ma_UnAura"]                     = "UnAura",
    ["ma_Morph"]                      = "Morph",
    ["ma_JailAButton"]                = "Jail (A)",
    ["ma_JailHButton"]                = "Jail (H)",
    ["ma_UnJailButton"]               = "UnJail",
    ["ma_UnMuteButton"]               = "UnMute",
    ["ma_QuestAddButton"]             = "QuestAdd",
    ["ma_QuestCompleteButton"]        = "QuestCompl",
    ["ma_QuestRemoveButton"]          = "QuestRem",
    ["ma_DamageButton"]               = "Damage",
    ["ma_HideAreaButton"]             = "HideArea",
    ["ma_ShowAreaButton"]             = "ShowArea",
    ["ma_HonorAddButton"]             = "HonorAdd",
    ["ma_HonorUpdateButton"]          = "HonorUpdt",
    ["ma_CharRotateLeft"]             = "<<=",
    ["ma_CharRotateRight"]            = "=>>",
    ["ma_CharZoomIn"]                 = "+",
    ["ma_CharZoomOut"]                = "-",
  --[[Other]]
    ["ma_LevelUp"]                    = "Level up",
    ["ma_LevelDown"]                  = "Level down",
    ["ma_Money"]                      = "Money",
    ["ma_Energy"]                     = "Energy",
    ["ma_Rage"]                       = "Rage",
    ["ma_Mana"]                       = "Mana",
    ["ma_Healthpoints"]               = "Healthpoints",
    ["ma_Talents"]                    = "Talents",
    ["ma_Stats"]                      = "Stats",
    ["ma_Spells"]                     = "Spells",
    ["ma_Honor"]                      = "Honor",
    ["ma_Level"]                      = "Level",
    ["ma_AllLang"]                    = "All Languages",
    ["ma_AllGMSpells"]                = "All GM Spells",
    ["ma_AllCrafts"]                  = "All Crafts",
    ["ma_AllDefault"]                 = "All Default",
    ["ma_AllMyClass"]                 = "All My Class",
    ["ma_AllMyPetTalents"]            = "All My Pet Talents",
    ["ma_AllMySpells"]                = "All My Spells",
    ["ma_AllMyTalents"]               = "All My Talents",
    ["ma_AllRecipesAlchemy"]          = "All Recipes (Alchemy)",
    ["ma_AllRecipesBlacksmithing"]    = "All Recipes (Blacksmithing)",
    ["ma_AllRecipesCooking"]          = "All Recipes (Cooking)",
    ["ma_AllRecipesEnchanting"]       = "All Recipes (Enchanting)",
    ["ma_AllRecipesEngineering"]      = "All Recipes (Engineering)",
    ["ma_AllRecipesFirstAid"]         = "All Recipes (First Aid)",
    ["ma_AllRecipesInscription"]      = "All Recipes (Inscription)",
    ["ma_AllRecipesJewelcrafting"]    = "All Recipes (Jewelcrafting)",
    ["ma_AllRecipesLeatherworking"]   = "All Recipes (Leatherworking)",
    ["ma_AllRecipesTailoring"]        = "All Recipes (Tailoring)",
    ["ma_resetallspells"]             = "Spells for ALL",
    ["ma_resetalltalents"]            = "Talents for ALL",
    ["ma_achievements"]               = "Achievements",
    ["ma_AllSpeeds"]                  = "AllSpeeds",
    ["ma_Arena"]                      = "Arena",
    ["ma_BackWalk"]                   = "BackWalk",
    ["ma_Drunk"]                      = "Drunk",
    ["ma_FlySpeed"]                   = "FlySpeed",
    ["ma_Gender"]                     = "Gender",
    ["ma_MountSpeed"]                 = "MountSpeed",
    ["ma_Phase"]                      = "Phase",
    ["ma_RunicPower"]                 = "RunicPower",
    ["ma_Speed"]                      = "Speed",
    ["ma_StandState"]                 = "StandState",
    ["ma_SwimSpeed"]                  = "SwimSpeed",
    ["ma_TalentPoints"]               = "TalentPoints",
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
    ["tt_NpcButton"]                  = "Toggle a window with npc related functions.",
  --[[Tooltips]]
    ["tt_NPCRotateLeft"]              = "Rotate left",
    ["tt_NPCRotateRight"]             = "Rotate right",
    ["tt_NPCKillButton"]              = "Kills the selected target",
    ["tt_npcrespawn"]                 = "Respawns selected creasture, or if none selected, all nearby creatures",
    ["tt_NPCDistanceButton"]          = "Get distance to the selected creature.",
    ["tt_NPCGUIDButton"]              = "Shows the GUID of the selected character.",
    ["tt_NPCInfoButton"]              = "Get information on the selected NPC.",
    ["tt_NPCDemorph"]                 = "Demorphs selected NPC",
    ["tt_NPCMove"]                    = "Move the selected creature to your location",
    ["tt_NPCDel"]                     = "Deletes the selected creature",
    ["tt_getguid"]                    = "Gets the selected creatures GUID and ID",
    ["tt_NPCClear"]                   = "Clears all NPC info fields (GUID, NPC ID, Display ID, Distance)",
    ["tt_NPCAdd"]                     = "Adds a copy of this NPC at your current location.",
    ["tt_NPCGo"]                      = "Teleports you to the NPC in the GUID box",
    ["tt_NPCMorph"]                   = "Parameters = #DisplayID [[Enter the DisplayID of the morph you want to apply]]",
    ["tt_NPCSay"]                     = "Make selected npc say [parameters]",
    ["tt_NPCYell"]                    = "Make selected npc yell [parameters]",
    ["tt_NPCAura"]                    = "Parameters = #AuraID [[Enter the AuraID of the aura you want to apply]]",
    ["tt_NPCUnaura"]                  = "Parameters = #AuraID [[Enter the AuraID of the aura you want to remove]]",
    ["tt_PlayEmote"]                  = "Play Emote from list at left",
    ["tt_GPSButton"]                  = "Shows coordinates for the selected character.",
    ["tt_DisplayUp"]                  = "Increment NPC DisplayID UP by 1",
    ["tt_DisplayDown"]                = "Decrement NPC DisplayID DOWN by 1",
    ["tt_IDUp"]                       = "Increment NPC ID UP by 1",
    ["tt_IDDown"]                     = "Decrement NPC ID DOWN by 1",
    ["tt_npcmodelzoominbutton"]       = "Zoom in the selected model",
    ["tt_npcmodelzoomoutbutton"]      = "Zoom out the selected model",
    ["tt_npcbindsight"]               = "Binds your vision to the selected NPC",
    ["tt_npcunbindsight"]             = "UnBinds your vision to the selected NPC",
    ["tt_npccometome"]                = "Forces the selected NPC to come to your location. Location NOT stored in DB.",
    ["tt_npcpossess"]                 = "Indefinitely possesses the selected creature",
    ["tt_npcunpossess"]               = "Unpossesses the selected creature",
    ["tt_NPCFreezeButton"]            = "Stops movement of the selected NPC, saving Waypoints",
    ["tt_NPCFreezeDelButton"]         = "Stops movement of the selected NPC, NOT saving Waypoints",
    ["tt_WayEndAdd"]                  = "Adds a waypoint to the end of the existing stack",
    ["tt_NPCAddWay"]                  = "Adds a waypoint to the stack. Creature GUID must be in below box",
    ["tt_WayMAdd"]                    = "Adds a waypoint to selected creatures existing move stack",
    ["tt_WayModifyDel"]               = "Deletes the selected waypoint from creatures existing move stack",
    ["tt_WayShow0"]                   = "Stops showing waypoints for selected creature.",
    ["tt_WayShow1"]                   = "Show waypoints for selected creature.",
    ["tt_NPCAdd_WayShowOn"]           = "shows waypoints for the selected creature",
    ["tt_NPCUnFreeze_RandomButton"]   = "Allows random movement of the selected NPC.",
    ["tt_NPCUnFreeze_WayButton"]      = "Allows waypoint movement of the selected NPC.",
    ["tt_MoveStackButton"]            = "Shows movement stack of the selected character.",
  --[[Control Labels]]
    ["Morph"]                         = "Morph",
    ["ma_NPCKillButton"]              = "Kill",
    ["ma_Respawn"]                    = "Respawn",
    ["ma_NPCDistanceButton"]          = "Distance",
    ["ma_NPCGUIDButton"]              = "Show GUID",
    ["ma_NPCInfoButton"]              = "NPC Info",
    ["ma_NPCDemorph"]                 = "Demorph",
    ["ma_NPCMove"]                    = "NPC Move",
    ["ma_NPCDel"]                     = "NPC Del",
    ["ma_getguid"]                    = "Get GUID",
    ["ma_NPCAdd"]                     = "NPC Add",
    ["ma_NPCGo"]                      = "NPC Go",
    ["ma_NPCMorph"]                   = "Morph",
    ["ma_NPCSay"]                     = "NPC Say",
    ["ma_NPCYell"]                    = "NPC Yell",
    ["ma_NPCAura"]                    = "NPC Aura",
    ["ma_NPCUnAura"]                  = "NPC Unaura",
    ["ma_PlayEmote1"]                 = "Emote",
    ["ma_PlayEmote2"]                 = "Emote",
    ["ma_DistanceBox"]                = "Distance",
    ["ma_NPCBindsight"]               = "BindSight",
    ["ma_NPCUnBindsight"]             = "UnBindSight",
    ["ma_NPCComeToMe"]                = "ComeToMe",
    ["ma_npcpossess"]                 = "Possess",
    ["ma_npcunpossess"]               = "UnPossess",
    ["ma_WayShow1"]                   = "WayShowOn",
    ["ma_WayShow0"]                   = "WayShowOff",
    ["ma_MoveStackButton"]            = "Show Moves",
    ["ma_NPCFreezeButton"]            = "NPCStay",
    ["ma_WayAllDel"]                  = "NPCStayDel",
    ["ma_WayMAdd"]                    = "WayMAdd",
    ["ma_NPCUnFreeze_RandomButton"]   = "Mov Random",
    ["ma_NPCUnFreeze_WayButton"]      = "Mov Waypt",
    ["ma_WayMDel"]                    = "WayMDel",
    ["ma_WayEndAdd"]                  = "WayEndAdd",
    ["ma_WayAdd"]                     = "WayAdd",
    ["ma_WayShow"]                    = "WayShow",
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
    ["ma_NPCClearButton"]             = "Clear",
  --[[Other]]



--[[GObjects Tab]]
  --[[Name]]
    ["tabmenu_GO"]                    = "GOB",
    ["tt_GOButton"]                   = "Toggle a window with GObject functions.",
  --[[Tooltips]]
    ["tt_ObjGo"]                      = "Go to the selected object",
    ["tt_ObjAdd"]                     = "Add a copy of the targeted object at your location and orientation",
    ["tt_ObjMove"]                    = "Move the targeted object to your location",
    ["tt_ObjTurn"]                    = "Turns the targeted object to match your orientation",
    ["tt_ObjDel"]                     = "Deletes the targeted object",
    ["tt_ObjNear"]                    = "Returns info on objects near you",
    ["tt_ObjTarget"]                  = "Targets the nearest object and shows info",
    ["tt_ObjActivate"]                = "Activates the targeted object",
    ["tt_ObjAddTemp"]                 = "Adds a temporary copy of the object",
    ["tt_ObjInfo"]                    = "Gets extended info about the object",
    ["tt_ObjSetPhase"]                = "Sets the phase of the object",
    ["tt_ObjShowModel"]               = "Load and show the model",
    ["tt_ObjUnloadModel"]             = "Unload models to free memory",
    ["tt_ObjMoveForward"]             = "Move forward",
    ["tt_ObjMoveBack"]                = "Move back",
    ["tt_ObjMoveLeft"]                = "Move left",
    ["tt_ObjMoveRight"]               = "Move right",
    ["tt_ObjMoveUp"]                  = "Move up",
    ["tt_ObjMoveDown"]                = "Move down",
    ["tt_ObjSpawnHere"]               = "Spawn here",
  --[[Control Labels]]
    ["ma_OBJGo"]                      = "Obj Go",
    ["ma_OBJAdd"]                     = "Obj Add",
    ["ma_OBJMove"]                    = "Obj Move",
    ["ma_OBJTurn"]                    = "Obj Turn",
    ["ma_OBJDel"]                     = "Obj Del",
    ["ma_OBJNear"]                    = "Obj Near",
    ["ma_OBJTarget"]                  = "Obj Target",
    ["ma_OBJActivate"]                = "Obj Activate",
    ["ma_OBJAddTemp"]                 = "Obj Add Tmp",
    ["ma_OBJInfo"]                    = "Obj Info",
    ["ma_OBJSetPhase"]                = "Obj Phase",
    ["ma_GOGUIDLabel"]                = "GUID",
    ["ma_GOEntryIDLabel"]             = "EntryID",
    ["ma_GODisplayIDLabel"]           = "DisplayID",
    ["ma_GORangeLabel"]               = "Range",
    ["ma_GOAddOnMoveLabel"]           = "Add On Move",
    ["ma_GOMoveOnMoveLabel"]          = "Move on Move",
    ["ma_GOMoveDistancesLabel"]       = "Move Distances",
    ["ma_GOFwdBackLabel"]             = "Fwd/Back:",
    ["ma_GOLeftRightLabel"]           = "Left/Right:",
    ["ma_GOUpDownLabel"]              = "Up/Down:",
    ["ma_GORotateLeft"]               = "<<",
    ["ma_GORotateRight"]              = ">>",
    ["ma_GOZoomIn"]                   = "+",
    ["ma_GOZoomOut"]                  = "-",
    ["ma_GOMoveForward"]              = "FWD",
    ["ma_GOMoveLeft"]                 = "LEFT",
    ["ma_GOMoveRight"]                = "RIGHT",
    ["ma_GOMoveBack"]                 = "BACK",
    ["ma_GOSpawnHere"]                = "HERE",
    ["ma_GOMoveUp"]                   = "UP",
    ["ma_GOMoveDown"]                 = "DOWN",
    ["ma_GOShowButton"]               = "Show",
    ["ma_GOUnloadButton"]             = "Unload",
  --[[Other]]



--[[Tele Tab]]
  --[[Name]]
    ["tabmenu_Tele"]                  = "TELE",
    ["tt_TeleButton"]                 = "Toggle a window with teleport-functions.",
  --[[Tooltips]]
  --[[Control Labels]]
    ["Zone"]                          = "|cFF00FF00Zone:|r ",
    ["ma_ContinentSelection"]         = "Continent Selection",
    ["ma_EasternKingdomsN"]           = "Eastern Kingdoms (N)",
    ["ma_EasternKingdomsS"]           = "Eastern Kingdoms (S)",
    ["ma_Kalimdor"]                   = "Kalimdor",
    ["ma_Outland"]                    = "Outland",
    ["ma_NorthrendAlliance"]          = "Northrend-Alliance",
    ["ma_NorthrendHorde"]             = "Northrend-Horde",
    ["ma_BattlegroundsArenas"]        = "Battlegrounds/Arenas",
    ["ma_InstancesEastern"]           = "Instances: Eastern",
    ["ma_InstancesKalimdor"]          = "Instances: Kalimdor",
    ["ma_InstancesOutland"]           = "Instances: Outland",
    ["ma_InstancesNorthrend"]         = "Instances: Northrend",
    ["ma_Other"]                      = "Other",
    ["ma_ZoneSelection"]              = "Zone Selection",
    ["ma_SelectedSubzone"]            = "Selected Subzone",
  --[[Other]]
    ["ma_NoZones"]                    = "No zones!",
    ["ma_NoSubZones"]                 = "No subzones!",



--[[Tickets Tab]]
  --[[Name]]
    ["tabmenu_ticket"]                = "TICKETS",
    ["tt_TicketButton"]               = "Toggle a window which shows all tickets and lets you administrate them.",
  --[[Tooltips]]
    ["tt_TicketOn"]                   = "Announce new tickets.",
    ["tt_TicketOff"]                  = "Don't announce new tickets.",
    ["tt_ResetTickets"]               = "Reset loaded tickets",
    ["tt_LoadAllTickets"]             = "Load All tickets",
    ["tt_LoadOnlineTickets"]          = "Load online player tickets",
    ["tt_DeleteTicket"]               = "Delete ticket",
    ["tt_AnswerTicket"]               = "Answer ticket",
    ["tt_GetCharTicket"]              = "Summon ticket character",
    ["tt_GoCharTicket"]               = "Go to ticket character",
    ["tt_WhisperTicket"]              = "Whisper ticket character",
    ["tt_GoTicket"]                   = "Go to ticket location",
    ["tt_ShowTickets"]                = "Show loaded tickets",
  --[[Control Labels]]
    ["ma_ticketidlabel"]              = "|cFF00FF00Ticket:",
    ["ma_ticketcreatedbylabel"]       = "|cFF00FF00Created by:",
    ["ma_tickettimecreatedlabel"]     = "|cFF00FF00Created:",
    ["ma_ticketlastchangelabel"]      = "|cFF00FF00Last change:",
    ["ma_ticketmessagelabel"]         = "|cFF00FF00Ticket Message:",
    ["ma_LoadTicketsButton"]          = "Refresh",
    ["ma_GetCharTicketButton"]        = "Summon",
    ["ma_GoCharTicketButton"]         = "Go Player",
    ["ma_AnswerButton"]               = "Mail",
    ["ma_DeleteButton"]               = "Close",
    ["ma_ticketwhisperbutton"]        = "Whisper",
    ["ma_TicketCount"]                = "|cFF00FF00Tickets:|r ",
    ["ma_TicketsNoNew"]               = "You have no new tickets.",
    ["ma_TicketsNewNumber"]           = "You have |cffeda55f%s|r new tickets!",
    ["ma_TicketsGoLast"]              = "Go to last ticket creator (%s).",
    ["ma_TicketsGetLast"]             = "Bring %s to you.",
    ["ma_TicketsInfoPlayer"]          = "|cFF00FF00Player:|r ",
    ["ma_TicketsInfoStatus"]          = "|cFF00FF00Status:|r ",
    ["ma_TicketsInfoAccount"]         = "|cFF00FF00Account:|r ",
    ["ma_TicketsInfoAccLevel"]        = "|cFF00FF00Account-Level:|r ",
    ["ma_TicketsInfoLastIP"]          = "|cFF00FF00Last IP:|r ",
    ["ma_TicketsInfoPlayedTime"]      = "|cFF00FF00Played time:|r ",
    ["ma_TicketsInfoLevel"]           = "|cFF00FF00Level:|r ",
    ["ma_TicketsInfoMoney"]           = "|cFF00FF00Money:|r ",
    ["ma_TicketsInfoLatency"]         = "|cFF00FF00Latency:|r ",
    ["ma_TicketsNoInfo"]              = "No info available",
    ["ma_TicketsNotLoaded"]           = "No ticket loaded...",
    ["ma_TicketsNoTickets"]           = "No tickets available!",
    ["ma_TicketResetButton"]          = "RESET",
    ["ma_TicketLoadAllButton"]        = "Load All",
    ["ma_TicketLoadOnlineButton"]     = "Load Online",
    ["ma_TicketShowButton"]           = "SHOW",
    ["ma_TicketGoButton"]             = "Go Ticket",
    ["ma_TicketTicketLoaded"]         = "|cFF00FF00Loaded Ticket-Nr:|r %s\n\nPlayer Information\n\n",
    ["ma_Reload"]                     = "Reload",
    ["ma_LoadMore"]                   = "Load more...",
  --[[Other]]



--[[Misc Tab]]
  --[[Name]]
    ["tabmenu_Misc"]                  = "MISC",
    ["tt_MiscButton"]                 = "Toggle a window with miscellaneous actions.",
  --[[Tooltips]]
    ["tt_FrmTrSlider"]                = "Change frame transparency",
    ["tt_BtnTrSlider"]                = "Change button transparency",
    ["tt_windowismovable"]            = "Allow a movable window",
    ["tt_updatechanges"]              = "Apply changes made to settings. Reloads UI.",
  --[[Control Labels]]
    ["cmd_toggle"]                    = "Toggle the main window",
    ["cmd_transparency"]              = "Toggle the basic transparency (0.5 or 1.0)",
    ["cmd_tooltip"]                   = "Toggle wether the button tooltips are shown or not",
    ["ma_EnableTransparency"]         = "Enable Transparency",
    ["ma_EnableLocalizedSearch"]      = "Enable Localized Search Strings",
    ["ma_EnableMinimenu"]             = "Enable Minimenu/Toolbar",
    ["ma_EnableTooltips"]             = "Enable Tooltips",
    ["ma_ShowChatOutput"]             = "Show Chat Output",
    ["ma_FrameStrataLabel"]           = "Frame Strata Level:",
    ["ma_UpdateFrequencyLabel"]       = "Specifies update frequency of Diff graph on Server tab.\n10000 = ~1 minute, 50000 = ~5 minutes",
    ["ma_BackgroundColorLabel"]       = "Backgroundcolor",
    ["ma_FrameColorLabel"]            = "Framecolor",
    ["ma_ButtonColorLabel"]           = "Buttoncolor",
    ["ma_LinkifierColorLabel"]        = "MangLinkifier",
    ["ma_UpdateChangesButton"]        = "Update Changes",
  --[[Other]]
    ["ma_ApplyWeatherButton"]         = "Apply Weather",
    ["ma_WeatherFine"]                = "Fine",
    ["ma_WeatherFog"]                 = "Fog",
    ["ma_WeatherRain"]                = "Rain",
    ["ma_WeatherSnow"]                = "Snow",
    ["ma_WeatherSand"]                = "Sand",
    ["msg_transparency_saved"]        = "|cff00ff00AzerothAdmin:|r Transparency setting saved. Update Changes or Reload UI to apply.",
    ["msg_localsearch_saved"]         = "|cff00ff00AzerothAdmin:|r Localized search strings setting saved. Update Changes or Reload UI to apply.",
    ["msg_minimenu_saved"]            = "|cff00ff00AzerothAdmin:|r Minimenu setting saved.",
    ["msg_tooltip_saved"]             = "|cff00ff00AzerothAdmin:|r Tooltip setting saved. Update Changes or Reload UI to apply.",
    ["msg_chatoutput_saved"]          = "|cff00ff00AzerothAdmin:|r Chat output setting saved.",



--[[Server Tab]]
    ["tabmenu_server"]                = "SERVER",
    ["tt_ServerButton"]               = "Show several server informations and do actions concerning the server.",
  --[[Tooltips]]
    ["tt_AnnounceButton"]             = "Announce a system message.",
    ["tt_ShutdownButton"]             = "Shut down the server in the amount of seconds from the field, if omitted shut down immediately!",
    ["tt_CancelShutdownButton"]       = "Cancel the server shutdown countdown.",
  --[[Control Labels]]
    ["ma_AnnounceButton"]             = "Announce",
    ["ma_ShutdownButton"]             = "Server Shutdown",
    ["ma_CancelShutdownButton"]       = "Cancel Shutdown",
    ["ma_ReloadTableButton"]          = "Reload Table",
    ["ma_ReloadScriptsButton"]        = "Reload Scripts",
    ["ma_ServerLatencyLabel"]         = "|cFF00FF00^Server Latency:|r",
    ["ma_UpdateDiffLabel"]            = "|cFF00FF00^Update Diff:|r",
    ["ma_MeanLabel"]                  = "|cFF00FF00Mean:|r",
    ["ma_MedianLabel"]                = "|cFF00FF00Median:|r",
    ["ma_PercentilesLabel"]           = "|cFF00FF00Percentiles:|r",
  --[[Other]]
    ["msg_shutdown_time_required"]    = "Please enter the time in seconds before using server shutdown.",
    ["msg_shutdown_confirm"]          = "Are you sure you want to shut down the server in %s seconds?",



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
    ["tt_ItemButton"]                 = "Toggle a popup with the function to search for items and manage your favorites.",
    ["tt_ItemSetButton"]              = "Toggle a popup with the function to search for itemsets and manage your favorites.",
    ["tt_SpellButton"]                = "Toggle a popup with the function to search for spells and manage your favorites.",
    ["tt_QuestButton"]                = "Toggle a popup with the function to search for quests and manage your favorites.",
    ["tt_CreatureButton"]             = "Toggle a popup with the function to search for creatures and manage your favorites.",
    ["tt_ObjectButton"]               = "Toggle a popup with the function to search for objects and manage your favorites.",
    ["tt_SearchDefault"]              = "Now you can enter a keyword and start the search.",
    ["tt_SkillButton"]                = "Toggle a popup with the function to search for skills and manage your favorites.",
  --[[Labels]]
    ["ma_PopupErrorTab"]              = "ERROR",
    ["ma_PopupFavoritesTab"]          = "Favorites",
    ["ma_PopupTab3"]                  = "Tab 3",
    ["ma_PopupAmountLabel"]           = "Amount:",
    ["ma_PopupInvisibleText"]         = "Invisible",
    ["ma_ItemButton"]                 = "Item-Search",
    ["ma_ItemSetButton"]              = "ItemSet-Search",
    ["ma_SpellButton"]                = "Spell-Search",
    ["ma_QuestButton"]                = "Quest-Search",
    ["ma_CreatureButton"]             = "Creature-Search",
    ["ma_ObjectButton"]               = "Object-Search",
    ["ma_TeleSearchButton"]           = "Teleport-Search",
    ["ma_MailRecipient"]              = "Recipient",
    ["ma_Mail"]                       = "Send Mail",
    ["ma_Send"]                       = "Send",
    ["ma_MailSubject"]                = "Subject",
    ["ma_MailYourMsg"]                = "Here your message!",
    ["ma_SearchButton"]               = "Search...",
    ["ma_ResetButton"]                = "Reset",
    ["ma_FavAdd"]                     = "Add selected",
    ["ma_FavRemove"]                  = "Remove selected",
    ["ma_SelectAllButton"]            = "Select all",
    ["ma_DeselectAllButton"]          = "Deselect all",
    ["ma_MailBytesLeft"]              = "Bytes left: ",
    ["ma_SkillButton"]                = "Skill-Search",
    ["ma_SkillVar1Button"]            = "Skill",
    ["ma_SkillVar2Button"]            = "Max Skill",
    ["ma_ItemVar1Button"]             = "Amount",
    ["ma_ObjectVar1Button"]           = "Loot Template",
    ["ma_ObjectVar2Button"]           = "Spawn Time",
    ["ma_NoFavorites"]                = "There are currently no saved favorites!",
    ["favoriteResults"]               = "|cFF00FF00Favorites:|r ",



--[[Deprecated, but may be used again.]]
    ["ma_LearnAllButton"]             = "All spells",
    ["ma_LearnCraftsButton"]          = "All professions and recipes",
    ["ma_LearnGMButton"]              = "Default GM spells",
    ["ma_LearnClassButton"]           = "All class-spells",
    ["ma_GPSButton"]                  = "GPS",
    ["ma_Online"]                     = "Online",
    ["ma_Offline"]                    = "Offline",



--[[Linkifier]]
    ["lfer_Spawn"]                    = "Spawn",
    ["lfer_List"]                     = "List",
    ["lfer_Reload"]                   = "Reload",
    ["lfer_Goto"]                     = "Goto",
    ["lfer_Move"]                     = "Move",
    ["lfer_Turn"]                     = "Turn",
    ["lfer_Delete"]                   = "Delete",
    ["lfer_Teleport"]                 = "Teleport",
    ["lfer_Morph"]                    = "Morph",
    ["lfer_Add"]                      = "Add",
    ["lfer_Remove"]                   = "Remove",
    ["lfer_Learn"]                    = "Learn",
    ["lfer_Unlearn"]                  = "Unlearn",
    ["lfer_Error"]                    = "Error Search String Matched but an error occured or unable to find type"

}
end
