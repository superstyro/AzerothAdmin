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
1. Edit the first un-commented line below, which should resemble: function Return_zhTW(). Change
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

local L = LibStub("AceLocale-3.0"):NewLocale("AzerothAdmin", "zhTW")
if L then
  local translations = {
--[[General]]
  --[[Tooltips]]
    ["tt_Default"]                    = "將游標移動到元素上以切換工具提示！",
    ["tt_LanguageButton"]             = "重新載入AzerothAdmin並套用所選語言。",
    ["tt_RefreshButton"]              = "重新整理伺服器資訊。",
  --[[Control Labels]]
    ["ma_LanguageButton"]             = "重載介面",
    ["ma_RefreshButton"]              = "重新整理",
    ["ma_TopText"]                    = "頂部文字，你不應該看到這個！",
    ["ma_Top2Text"]                   = "頂部文字，你不應該看到這個！",
    ["ma_InfoOnlineText"]             = "線上玩家: ...",
    ["ma_InfoMaxOnlineText"]          = "最高線上: ...",
    ["ma_InfoUptimeText"]             = "伺服器運行時間: ...",
    ["ma_InfoRevisionText"]           = "AzerothCore版本: ...",
    ["info_revision"]                 = "|cFF00FF00AzerothCore版本:|r ",
    ["info_platform"]                 = "|cFF00FF00伺服器平台:|r ",
    ["info_online"]                   = "|cFF00FF00線上玩家:|r ",
    ["info_maxonline"]                = "|cFF00FF00最高線上:|r ",
    ["info_uptime"]                   = "|cFF00FF00運行時間:|r ",
    ["ma_CloseWindow"]                = "X",
    ["tt_CloseWindow"]                = "關閉視窗",
  --[[Other]]
    ["slashcmds"]                     = { "/AzerothAdmin", "/aa" },
    ["lang"]                          = "繁體中文",
    ["realm"]                         = "|cFF00FF00伺服器:|r "..GetCVar("realmName"),
    ["char"]                          = "|cFF00FF00角色:|r "..UnitName("player"),
    ["guid"]                          = "|cFF00FF00GUID:|r ",
    ["tickets"]                       = "|cFF00FF00工單:|r ",
    ["selectionerror1"]               = "請只選擇你自己、另一個玩家或不選擇任何對象！",
    ["selectionerror2"]               = "請只選擇你自己或不選擇任何對象！",
    ["selectionerror3"]               = "請只選擇另一個玩家！",
    ["selectionerror4"]               = "請只選擇一個NPC！",
    ["numbererror"]                   = "值必須是數字！",
    ["searchResults"]                 = "|cFF00FF00搜尋結果:|r ",
    ["ma_parameters"]                 = "參數:", --Used on multiple tabs



--[[GM tab]]
  --[[Name]]
    ["tabmenu_Main"]                  = "GM",
  --[[Tooltips]]
    ["tt_MainButton"]                 = "切換AzerothAdmin主框架。",
    ["tt_DisplayAccountLevel"]        = "顯示你的帳號等級",
    ["tt_GMOnButton"]                 = "啟動你的GM模式。",
    ["tt_GMOffButton"]                = "關閉你的GM模式。",
    ["tt_FlyOnButton"]                = "為所選角色啟動飛行模式。",
    ["tt_FlyOffButton"]               = "為所選角色關閉飛行模式。",
    ["tt_HoverOnButton"]              = "啟動你的懸浮模式。",
    ["tt_HoverOffButton"]             = "關閉你的懸浮模式。",
    ["tt_WhispOnButton"]              = "接受其他玩家的密語。",
    ["tt_WhispOffButton"]             = "不接受其他玩家的密語。",
    ["tt_InvisOnButton"]              = "使你隱形。",
    ["tt_InvisOffButton"]             = "使你可見。",
    ["tt_TaxiOnButton"]               = "向所選玩家顯示所有飛行路線。此作弊將在登出時被停用。",
    ["tt_TaxiOffButton"]              = "停用飛行路線作弊並恢復玩家已知的飛行路線。",
    ["tt_ShowMapsButton"]             = "為所選角色顯示地圖。",
    ["tt_HideMapsButton"]             = "為所選角色隱藏地圖。",
    ["tt_SpeedSlider"]                = "增加或減少所選角色的速度。",
    ["tt_ScaleSlider"]                = "增加或減少所選角色的體型。",
    ["tt_instakill"]                  = "勾選後，點擊敵對生物即可殺死它。",
    ["tt_ScreenButton"]               = "截圖。",
    ["tt_BankButton"]                 = "顯示你的銀行。",
    ["tt_Dismount"]                   = "下坐騎（如果你正在騎乘）",
    ["tt_SetJail_A_Button"]           = "將聯盟監獄的位置設定為你目前的位置。",
    ["tt_SetJail_H_Button"]           = "將部落監獄的位置設定為你目前的位置。",
    ["tt_N"]                          = "向北導航",
    ["tt_S"]                          = "向南導航",
    ["tt_E"]                          = "向東導航",
    ["tt_W"]                          = "向西導航",
  --["tt_chatonbutton"]               = "開啟GM聊天",
  --["tt_chatoffbutton"]              = "關閉GM聊天",
    ["tt_waterwalkonbutton"]          = "為所選生物開啟水上行走"  ,
    ["tt_watewrwalkoffbutton"]        = "為所選生物關閉水上行走",
    ["tt_accountlockonbutton"]        = "鎖定你的帳號",
    ["tt_accountlockoffbutton"]       = "解鎖你的帳號",
    ["tt_DisplayAccountLvl"]          = "顯示你的帳號等級。",
    ["tt_SpeedSliderReset"]           = "將速度重置為1.0",
    ["tt_ScaleSliderReset"]           = "將體型重置為1.0",
    ["tt_gmnotifybutton"]             = "向所有線上GM發送訊息$message [[參數: $message]]",
    ["tt_gmingamebutton"]             = "顯示已登入的GM。",
    ["tt_gmlistbutton"]               = "顯示此伺服器上的GM帳號",
    ["tt_petcreatebutton"]            = "使所選的動物成為你的寵物。",
    ["tt_petlearnbutton"]             = "教給你的寵物法術 [[參數: #SPELLID]]",
    ["tt_petunlearnbutton"]           = "移除你的寵物法術 [[參數: #SPELLID]]",
    ["tt_pettpbutton"]                = "修改寵物的訓練點數 [[參數: #points]]",
    ["tt_lookuptaxibutton"]           = "查找飛行點 [[參數: $Areanamepart]]",
    ["tt_gotaxinodebutton"]           = "傳送到指定的飛行點 [[參數: #taxinode]]",
    ["tt_gotriggerbutton"]            = "傳送到指定的區域觸發器 [[參數: #trigger_id]]",
    ["tt_goxybutton"]                 = "傳送到MapID上地面/水面級別的指定座標。如果省略MapID，則為目前地圖 [[參數: #x #y [#mapid]]]",
    ["tt_goxyzbutton"]                = "傳送到MapID上#z級別的指定座標。如果省略MapID，則為目前地圖 [[參數: #x #y #z [#mapid]]]",
    ["tt_gozonexybutton"]             = "傳送到ZoneID中地面/水面級別的指定座標。如果省略ZoneID，則為目前區域 [[參數: #x #y [#zoneid]]]",
    ["tt_lookupzonebutton"]           = "查找區域。 [[參數: $Areanamepart]]",
    ["tt_castbutton"]                 = "施放法術。 [[參數: #SpellID]]",
    ["tt_castbackbutton"]             = "所選生物將對你施放法術[SpellID]。 [[參數: #SpellID]]",
    ["tt_castdistbutton"]             = "你在距離[#Dist]處施放法術[SpellID]。 [[參數: #SpellID #Dist]]",
    ["tt_castselfbutton"]             = "所選生物對自己施放法術[SpellID]。 [[參數: #SpellID]]",
    ["tt_casttargetbutton"]           = "所選生物對其目標施放法術[SpellID]。 [[參數: #SpellID]]",
    ["tt_gmclearbutton"]              = "清空參數框。",
    ["tt_listitembutton"]             = "列出所有[#itemID]的出現。 [[參數: #ItemID]]",
    ["tt_acctcreatebutton"]           = "建立玩家帳號 [[參數: $accountname $password]]",
    ["tt_acctdeletebutton"]           = "刪除玩家帳號及所有角色 [[參數: $accountname]]",
    ["tt_acctaddonbutton"]            = "設定$account使用#addon(0=WoW, 1=TBC, 2=WotLK) [[參數: $accountname #addon]]",
    ["tt_acctgmlvlbutton"]            = "設定$account為#gmlevel (0=玩家, 1=助手, 2=協助者, 3=GM, 4=管理員) [[參數: $accountname #gmlevel]]",
    ["tt_acctpasswdbutton"]           = "設定$account密碼 [[參數: $accountname $password $password]]",
  --[[Control Labels]]
    ["ma_OffButton"]                  = "關閉",
    ["ma_displaylevelbutton"]         = "顯示帳號等級",
    ["ma_GMOnButton"]                 = "開啟GM模式",
    ["ma_FlyOnButton"]                = "開啟飛行模式",
    ["ma_HoverOnButton"]              = "開啟懸浮模式",
    ["ma_WhisperOnButton"]            = "開啟密語",
    ["ma_InvisOnButton"]              = "開啟隱形",
    ["ma_TaxiOnButton"]               = "開啟飛行路線作弊",
    ["ma_ShowMapsButton"]             = "顯示地圖",
    ["ma_HideMapsButton"]             = "隱藏地圖",
    ["ma_instakill"]                  = "秒殺生物",
    ["ma_ScreenshotButton"]           = "截圖",
    ["ma_BankButton"]                 = "銀行",
    ["ma_DismountButton"]             = "下坐騎",
    ["ma_SetJail_A_Button"]           = "設定聯盟監獄",
    ["ma_SetJail_H_Button"]           = "設定部落監獄",
    ["gridnavigator"]                 = "網格導航器",
    ["N"]                             = "北", --Abbreviation for North
    ["S"]                             = "南", --Abbreviation for South
    ["E"]                             = "東", --Abbreviation for East
    ["W"]                             = "西", --Abbreviation for West
    ["ma_chatbutton"]                 = "開啟GM聊天",
    ["ma_mapsbutton"]                 = "檢視所有地圖",
    ["ma_waterwalkbutton"]            = "開啟水上行走",
    ["ma_accountlockbutton"]          = "鎖定帳號",
    ["ma_gmnotify"]                   = "GM通知",
    ["ma_gmingame"]                   = "線上GM",
    ["ma_gmlist"]                     = "GM清單",
    ["ma_petcreate"]                  = "建立寵物",
    ["ma_petlearn"]                   = "寵物學習",
    ["ma_petunlearn"]                 = "寵物遺忘",
    ["ma_pettp"]                      = "寵物訓練點",
    ["ma_lookuptaxi"]                 = "查找飛行點",
    ["ma_gotaxinode"]                 = "前往飛行點",
    ["ma_gotrigger"]                  = "前往觸發器",
    ["ma_goxy"]                       = "前往XY",
    ["ma_goxyz"]                      = "前往XYZ",
    ["ma_gozonexy"]                   = "前往區域XY",
    ["ma_lookupzone"]                 = "查找區域",
    ["ma_cast"]                       = "施法",
    ["ma_castback"]                   = "反向施法",
    ["ma_castdist"]                   = "距離施法",
    ["ma_castself"]                   = "自我施法",
    ["ma_casttarget"]                 = "目標施法",
    ["ma_listitem"]                   = "列出物品",
    ["ma_GmClear"]                    = "清空參數",
    ["ma_acctcreate"]                 = "建立帳號",
    ["ma_acctdelete"]                 = "刪除帳號",
    ["ma_acctaddon"]                  = "帳號資料片",
    ["ma_acctgmlvl"]                  = "帳號GM等級",
    ["ma_acctpasswd"]                 = "帳號密碼",
    ["ma_MiniMenuGM"]                 = "Gm",
    ["ma_MiniMenuChar"]               = "角",
    ["ma_MiniMenuNPC"]                = "Np",
    ["ma_MiniMenuGO"]                 = "GO",
    ["ma_MiniMenuTele"]               = "傳",
    ["ma_MiniMenuTicket"]             = "單",
    ["ma_MiniMenuMisc"]               = "雜",
    ["ma_MiniMenuServer"]             = "服",
    ["ma_MiniMenuLog"]                = "誌",
    ["ma_MiniMenuRevive"]             = "復活!",
  --[[Other]]



--[[Char Tab]]
  --[[Name]]
    ["tabmenu_Char"]                  = "角色",
    ["tt_CharButton"]                 = "切換角色專用操作視窗。",
  --[[Tooltips]]
    ["tt_RotateLeft"]                 = "向左旋轉。",
    ["tt_RotateRight"]                = "向右旋轉。",
    ["tt_killbutton"]                 = "殺死所選生物/玩家",
    ["tt_reviveplayer"]               = "復活所選玩家",
    ["tt_saveplayer"]                 = "儲存所選玩家的角色",
    ["tt_KickButton"]                 = "將所選玩家踢出伺服器。",
    ["tt_CooldownButton"]             = "移除/過期所選角色的所有法術影響冷卻。",
    ["tt_GUIDButton"]                 = "顯示所選角色的GUID。",
    ["tt_PinfoButton"]                = "獲取所選玩家的資訊。",
    ["tt_DistanceButton"]             = "獲取到所選生物的距離。",
    ["tt_RecallButton"]               = "將所選生物召回到上次傳送前的位置。",
    ["tt_DemorphButton"]              = "移除所選角色的任何變形。",
    ["tt_ShowMapsCharButton"]         = "為所選角色顯示地圖。",
    ["tt_HideMapsCharButton"]         = "為所選角色隱藏地圖。",
    ["tt_learnlangbutton"]            = "學習所選法術",
    ["tt_modifybutton"]               = "按輸入的數量修改所選屬性",
    ["tt_resetbutton"]                = "重置所選屬性",
    ["tt_modelzoominbutton"]          = "放大所選模型",
    ["tt_modelzoomoutbutton"]         = "縮小所選模型",
    ["tt_charbindsight"]              = "將你的視野綁定到所選單位",
    ["tt_charunbindsight"]            = "解除你的視野與所選單位的綁定",
    ["tt_charrename"]                 = "切換所選角色在下次登入時重新命名",
    ["tt_charcustomize"]              = "切換所選角色在下次登入時自訂外觀",
    ["tt_charchangerace"]             = "切換所選角色在下次登入時更改種族",
    ["tt_charchnagefaction"]          = "切換所選角色在下次登入時更改陣營",
    ["tt_charcombatstop"]             = "停止所選角色（或你自己）的戰鬥",
    ["tt_charmaxskill"]               = "將所選角色的技能設定為等級最大值",
    ["tt_charfreeze"]                 = "凍結目標玩家並禁用其聊天",
    ["tt_charunfreeze"]               = "解凍所選玩家並恢復聊天",
    ["tt_charlistdeleted"]            = "在聊天視窗列出已刪除的角色",
    ["tt_chardeletedrestore"]         = "參數= #guid|$name [$newname] [#new account] [[此指令正在開發中]",
    ["tt_charpossess"]                = "無限期占據所選生物",
    ["tt_charunpossess"]              = "解除對所選生物的占據",
    ["tt_charrecall"]                 = "將所選玩家召回到他們上次傳送的位置",
    ["tt_charrepair"]                 = "修理所選玩家的裝備和武器",
    ["tt_banbutton"]                  = "參數= <account|ip|character> $NameOrIp <-1|xxdyyhzzm> $reason   [[封鎖帳號/IP並踢出。-1=永久封鎖，或使用如4d3h24m16s的字串]]",
    ["tt_gonamebutton"]               = "參數= $charactername  [[傳送你到指定的角色]]",
    ["tt_createguildbutton"]          = "參數= $GuildLeaderName $GuildName  [[建立名為$GuildName的公會，$GuildLeaderName為會長]]",
    ["tt_teleaddbutton"]              = "參數= $Name  [[為你目前位置新增名為$Name的傳送位置.tele指令]]",
    ["tt_baninfobutton"]              = "參數= <account|ip|character>  [[檢視指定帳號/ip/角色的封鎖詳細資訊]]",
    ["tt_groupgobutton"]              = "參數= $charactername   [[將指定角色及其隊伍傳送到你的位置]]",
    ["tt_guildinvitebutton"]          = "參數= $charactername $guildname   [[將$charactername新增到公會$guildname]]",
    ["tt_teledelbutton"]              = "參數= $telename  [[從.tele位置清單中移除名為$telename的位置]]",
    ["tt_banlistbutton"]              = "參數= <account|ip> $NameOrIp   [[搜尋並傳回符合參數的特定封鎖]]",
    ["tt_namegobutton"]               = "參數= $charactername   [[將指定角色傳送到你的位置]]",
    ["tt_guildrankbutton"]            = "參數= $charactername #ranknumber   [[將指定角色設定為其公會中指定的等級]]",
    ["tt_telegroupbutton"]            = "參數= $telename  [[將**所選**角色及其隊伍傳送到名為$telename的.tele位置]]",
    ["tt_unbanbutton"]                = "參數= <account|ip|character> $NameOrIp  [[解封指定的帳號/IP/角色]]",
    ["tt_guilddeletebutton"]          = "參數= $guildname  [[刪除指定的公會]]",
    ["tt_guilduninvitebutton"]        = "參數= $charactername  [[將指定角色踢出其公會]]",
    ["tt_telenamebutton"]             = "參數= $charactername $telename  [[將$charactername傳送到$telename]]",
    ["tt_mutebutton"]                 = "參數= $charactername #minutes  [[禁用$charactername整個帳號的聊天功能#minutes分鐘]]",
    ["tt_charmorphbutton"]            = "參數 = #DisplayID [[輸入你想套用的變形DisplayID]]",
    ["tt_charaurabutton"]             = "參數 = #AuraID [[輸入你想套用的光環AuraID]]",
    ["tt_charunaurabutton"]           = "參數 = #AuraID [[輸入你想移除的光環AuraID]]",
    ["tt_JailAButton"]                = "參數= $charactername [[將此框中顯示名字的角色送入聯盟監獄]]",
    ["tt_JailHButton"]                = "參數= $charactername [[將此框中顯示名字的角色送入部落監獄]]",
    ["tt_UnJailButton"]               = "參數= $charactername [[將此框中顯示名字的角色從監獄釋放。]]",
    ["tt_UnMuteButton"]               = "解除$player的禁言。",
    ["tt_QuestAddButton"]             = "將#questid新增到**所選**玩家。",
    ["tt_QuestCompleteButton"]        = "將#questid標記為**所選**玩家已完成。",
    ["tt_QuestRemoveButton"]          = "從**所選**玩家移除#questid。",
    ["tt_DamageButton"]               = "參數= #amount 對**所選**生物/玩家造成的傷害量",
    ["tt_HideAreaButton"]             = "對**所選**玩家隱藏#areaid。",
    ["tt_ShowAreaButton"]             = "對**所選**玩家顯示#areaid。",
    ["tt_HonorAddButton"]             = "為**所選**玩家新增#honorpoints榮譽點。",
    ["tt_HonorUpdateButton"]          = "無需參數。為**所選**玩家儲存榮譽。",
  --[[Control Labels]]
    ["ma_KillButton"]                 = "殺死",
    ["ma_ReviveButton"]               = "復活",
    ["ma_SaveButton"]                 = "儲存",
    ["ma_KickButton"]                 = "踢出",
    ["ma_CooldownButton"]             = "冷卻",
    ["ma_GUIDButton"]                 = "顯示GUID",
    ["ma_PinfoButton"]                = "玩家資訊",
    ["ma_DistanceButton"]             = "距離",
    ["ma_RecallButton"]               = "召回",
    ["ma_DemorphButton"]              = "解除變形",
    ["ma_ShowMapsCharButton"]         = "顯示地圖",
    ["ma_HideMapsCharButton"]         = "隱藏地圖",
    ["ma_LearnLangButton"]            = "所有語言",
    ["ma_Learn"]                      = "學習",
    ["ma_Modify"]                     = "修改",
    ["ma_Reset"]                      = "重置",
    ["ma_CharBindsight"]              = "綁定視野",
    ["ma_CharUnBindsight"]            = "解除綁定視野",
    ["ma_charrename"]                 = "重新命名",
    ["ma_charcustomize"]              = "自訂外觀",
    ["ma_charchangerace"]             = "更改種族",
    ["ma_charchnagefaction"]          = "更改陣營",
    ["ma_charcombatstop"]             = "停止戰鬥",
    ["ma_charmaxskill"]               = "最大技能",
    ["ma_charfreeze"]                 = "凍結",
    ["ma_charunfreeze"]               = "解凍",
    ["ma_charlistdeleted"]            = "列出已刪角色",
    ["ma_chardeletedrestore"]         = "恢復已刪角色",
    ["ma_charpossess"]                = "占據",
    ["ma_charunpossess"]              = "解除占據",
    ["ma_charrecall"]                 = "召回",
    ["ma_charrepair"]                 = "修理",
    ["ma_banbutton"]                  = "封鎖",
    ["ma_gonamebutton"]               = "傳送至",
    ["ma_createguildbutton"]          = "公會建立",
    ["ma_teleaddbutton"]              = "傳送新增",
    ["ma_baninfobutton"]              = "封鎖資訊",
    ["ma_groupgobutton"]              = "召喚隊伍",
    ["ma_guildinvitebutton"]          = "公會邀請",
    ["ma_teledelbutton"]              = "傳送刪除",
    ["ma_banlistbutton"]              = "封鎖清單",
    ["ma_namegobutton"]               = "召喚",
    ["ma_guildrankbutton"]            = "公會等級",
    ["ma_telegroupbutton"]            = "傳送隊伍",
    ["ma_unbanbutton"]                = "解封",
    ["ma_guilddeletebutton"]          = "公會刪除",
    ["ma_guilduninvitebutton"]        = "公會踢出",
    ["ma_telenamebutton"]             = "傳送玩家",
    ["ma_mutebutton"]                 = "禁言",
    ["ma_Aura"]                       = "光環",
    ["ma_UnAura"]                     = "移除光環",
    ["ma_Morph"]                      = "變形",
    ["ma_JailAButton"]                = "監獄(聯)",
    ["ma_JailHButton"]                = "監獄(部)",
    ["ma_UnJailButton"]               = "釋放",
    ["ma_UnMuteButton"]               = "解除禁言",
    ["ma_QuestAddButton"]             = "新增任務",
    ["ma_QuestCompleteButton"]        = "完成任務",
    ["ma_QuestRemoveButton"]          = "移除任務",
    ["ma_DamageButton"]               = "傷害",
    ["ma_HideAreaButton"]             = "隱藏區域",
    ["ma_ShowAreaButton"]             = "顯示區域",
    ["ma_HonorAddButton"]             = "新增榮譽",
    ["ma_HonorUpdateButton"]          = "更新榮譽",
    ["ma_CharRotateLeft"]             = "<<=",
    ["ma_CharRotateRight"]            = "=>>",
    ["ma_CharZoomIn"]                 = "+",
    ["ma_CharZoomOut"]                = "-",
  --[[Other]]
    ["ma_LevelUp"]                    = "升級",
    ["ma_LevelDown"]                  = "降級",
    ["ma_Money"]                      = "金錢",
    ["ma_Energy"]                     = "能量",
    ["ma_Rage"]                       = "怒氣",
    ["ma_Mana"]                       = "法力",
    ["ma_Healthpoints"]               = "生命值",
    ["ma_Talents"]                    = "天賦",
    ["ma_Stats"]                      = "屬性",
    ["ma_Spells"]                     = "法術",
    ["ma_Honor"]                      = "榮譽",
    ["ma_Level"]                      = "等級",
    ["ma_AllLang"]                    = "所有語言",
    ["ma_AllGMSpells"]                = "所有GM法術",
    ["ma_AllCrafts"]                  = "所有專業",
    ["ma_AllDefault"]                 = "所有預設",
    ["ma_AllMyClass"]                 = "所有職業法術",
    ["ma_AllMyPetTalents"]            = "所有寵物天賦",
    ["ma_AllMySpells"]                = "所有我的法術",
    ["ma_AllMyTalents"]               = "所有我的天賦",
    ["ma_AllRecipesAlchemy"]          = "所有配方(鍊金術)",
    ["ma_AllRecipesBlacksmithing"]    = "所有配方(鍛造)",
    ["ma_AllRecipesCooking"]          = "所有配方(烹飪)",
    ["ma_AllRecipesEnchanting"]       = "所有配方(附魔)",
    ["ma_AllRecipesEngineering"]      = "所有配方(工程學)",
    ["ma_AllRecipesFirstAid"]         = "所有配方(急救)",
    ["ma_AllRecipesInscription"]      = "所有配方(銘文)",
    ["ma_AllRecipesJewelcrafting"]    = "所有配方(珠寶加工)",
    ["ma_AllRecipesLeatherworking"]   = "所有配方(製皮)",
    ["ma_AllRecipesTailoring"]        = "所有配方(裁縫)",
    ["ma_resetallspells"]             = "重置所有法術",
    ["ma_resetalltalents"]            = "重置所有天賦",
    ["ma_achievements"]               = "成就",
    ["ma_AllSpeeds"]                  = "所有速度",
    ["ma_Arena"]                      = "競技場",
    ["ma_BackWalk"]                   = "後退速度",
    ["ma_Drunk"]                      = "醉酒",
    ["ma_FlySpeed"]                   = "飛行速度",
    ["ma_Gender"]                     = "性別",
    ["ma_MountSpeed"]                 = "坐騎速度",
    ["ma_Phase"]                      = "相位",
    ["ma_RunicPower"]                 = "符文能量",
    ["ma_Speed"]                      = "速度",
    ["ma_StandState"]                 = "站立狀態",
    ["ma_SwimSpeed"]                  = "游泳速度",
    ["ma_TalentPoints"]               = "天賦點",
    -- languages
    ["Common"]                        = "通用語",
    ["Orcish"]                        = "獸人語",
    ["Taurahe"]                       = "牛頭人語",
    ["Darnassian"]                    = "達納蘇斯語",
    ["Dwarvish"]                      = "矮人語",
    ["Thalassian"]                    = "薩拉斯語",
    ["Demonic"]                       = "惡魔語",
    ["Draconic"]                      = "龍語",
    ["Titan"]                         = "泰坦語",
    ["Kalimag"]                       = "卡利姆多語",
    ["Gnomish"]                       = "地精語",
    ["Troll"]                         = "食人妖語",
    ["Gutterspeak"]                   = "亡靈語",
    ["Draenei"]                       = "德萊尼語",



--[[NPC Tab]]
  --[[Name]]
    ["tabmenu_NPC"]                   = "NPC",
    ["tt_NpcButton"]                  = "切換NPC相關功能視窗。",
  --[[Tooltips]]
    ["tt_NPCRotateLeft"]              = "向左旋轉",
    ["tt_NPCRotateRight"]             = "向右旋轉",
    ["tt_NPCKillButton"]              = "殺死所選目標",
    ["tt_npcrespawn"]                 = "重生所選生物，如果未選擇則重生附近所有生物",
    ["tt_NPCDistanceButton"]          = "獲取到所選生物的距離。",
    ["tt_NPCGUIDButton"]              = "顯示所選角色的GUID。",
    ["tt_NPCInfoButton"]              = "獲取所選NPC的資訊。",
    ["tt_NPCDemorph"]                 = "解除所選NPC的變形",
    ["tt_NPCMove"]                    = "將所選生物移動到你的位置",
    ["tt_NPCDel"]                     = "刪除所選生物",
    ["tt_getguid"]                    = "獲取所選生物的GUID和ID",
    ["tt_NPCClear"]                   = "清除所有NPC資訊欄位（GUID、NPC ID、顯示ID、距離）",
    ["tt_NPCAdd"]                     = "在你目前位置新增此NPC的副本。",
    ["tt_NPCGo"]                      = "傳送你到GUID框中的NPC",
    ["tt_NPCMorph"]                   = "參數 = #DisplayID [[輸入你想套用的變形DisplayID]]",
    ["tt_NPCSay"]                     = "使所選NPC說[參數]",
    ["tt_NPCYell"]                    = "使所選NPC喊[參數]",
    ["tt_NPCAura"]                    = "參數 = #AuraID [[輸入你想套用的光環AuraID]]",
    ["tt_NPCUnaura"]                  = "參數 = #AuraID [[輸入你想移除的光環AuraID]]",
    ["tt_PlayEmote"]                  = "播放左側清單中的表情",
    ["tt_GPSButton"]                  = "顯示所選角色的座標。",
    ["tt_DisplayUp"]                  = "將NPC顯示ID增加1",
    ["tt_DisplayDown"]                = "將NPC顯示ID減少1",
    ["tt_IDUp"]                       = "將NPC ID增加1",
    ["tt_IDDown"]                     = "將NPC ID減少1",
    ["tt_npcmodelzoominbutton"]       = "放大所選模型",
    ["tt_npcmodelzoomoutbutton"]      = "縮小所選模型",
    ["tt_npcbindsight"]               = "將你的視野綁定到所選NPC",
    ["tt_npcunbindsight"]             = "解除你的視野與所選NPC的綁定",
    ["tt_npccometome"]                = "強制所選NPC來到你的位置。位置不會儲存在資料庫中。",
    ["tt_npcpossess"]                 = "無限期占據所選生物",
    ["tt_npcunpossess"]               = "解除對所選生物的占據",
    ["tt_NPCFreezeButton"]            = "停止所選NPC的移動，儲存路徑點",
    ["tt_NPCFreezeDelButton"]         = "停止所選NPC的移動，不儲存路徑點",
    ["tt_WayEndAdd"]                  = "在現有堆疊末尾新增路徑點",
    ["tt_NPCAddWay"]                  = "向堆疊新增路徑點。生物GUID必須在下面的框中",
    ["tt_WayMAdd"]                    = "向所選生物現有移動堆疊新增路徑點",
    ["tt_WayModifyDel"]               = "從生物現有移動堆疊刪除所選路徑點",
    ["tt_WayShow0"]                   = "停止顯示所選生物的路徑點。",
    ["tt_WayShow1"]                   = "顯示所選生物的路徑點。",
    ["tt_NPCAdd_WayShowOn"]           = "顯示所選生物的路徑點",
    ["tt_NPCUnFreeze_RandomButton"]   = "允許所選NPC隨機移動。",
    ["tt_NPCUnFreeze_WayButton"]      = "允許所選NPC路徑點移動。",
    ["tt_MoveStackButton"]            = "顯示所選角色的移動堆疊。",
  --[[Control Labels]]
    ["Morph"]                         = "變形",
    ["ma_NPCKillButton"]              = "殺死",
    ["ma_Respawn"]                    = "重生",
    ["ma_NPCDistanceButton"]          = "距離",
    ["ma_NPCGUIDButton"]              = "顯示GUID",
    ["ma_NPCInfoButton"]              = "NPC資訊",
    ["ma_NPCDemorph"]                 = "解除變形",
    ["ma_NPCMove"]                    = "NPC移動",
    ["ma_NPCDel"]                     = "NPC刪除",
    ["ma_getguid"]                    = "獲取GUID",
    ["ma_NPCAdd"]                     = "NPC新增",
    ["ma_NPCGo"]                      = "NPC前往",
    ["ma_NPCMorph"]                   = "變形",
    ["ma_NPCSay"]                     = "NPC說",
    ["ma_NPCYell"]                    = "NPC喊",
    ["ma_NPCAura"]                    = "NPC光環",
    ["ma_NPCUnAura"]                  = "NPC移除光環",
    ["ma_PlayEmote1"]                 = "表情",
    ["ma_PlayEmote2"]                 = "表情",
    ["ma_DistanceBox"]                = "距離",
    ["ma_NPCBindsight"]               = "綁定視野",
    ["ma_NPCUnBindsight"]             = "解除綁定視野",
    ["ma_NPCComeToMe"]                = "過來",
    ["ma_npcpossess"]                 = "占據",
    ["ma_npcunpossess"]               = "解除占據",
    ["ma_WayShow1"]                   = "顯示路徑",
    ["ma_WayShow0"]                   = "隱藏路徑",
    ["ma_MoveStackButton"]            = "顯示移動",
    ["ma_NPCFreezeButton"]            = "NPC停留",
    ["ma_WayAllDel"]                  = "NPC停留刪",
    ["ma_WayMAdd"]                    = "路徑新增",
    ["ma_NPCUnFreeze_RandomButton"]   = "隨機移動",
    ["ma_NPCUnFreeze_WayButton"]      = "路徑移動",
    ["ma_WayMDel"]                    = "路徑刪除",
    ["ma_WayEndAdd"]                  = "路徑末添",
    ["ma_WayAdd"]                     = "路徑新增",
    ["ma_WayShow"]                    = "路徑顯示",
    ["ma_NPCRotateLeft"]              = "<<=",
    ["ma_NPCRotateRight"]             = "=>>",
    ["ma_NPCZoomIn"]                  = "+",
    ["ma_NPCZoomOut"]                 = "-",
    ["ma_NPCDisplayIDLabel"]          = "顯示ID:",
    ["ma_NPCIDLabel"]                 = "NPC ID:",
    ["ma_NPCGUIDLabel"]               = "GUID:",
    ["ma_NPCDisplayDown"]             = "<<",
    ["ma_NPCDisplayUp"]               = ">>",
    ["ma_NPCIDUp"]                    = ">>",
    ["ma_NPCClearButton"]             = "清空",
  --[[Other]]



--[[GObjects Tab]]
  --[[Name]]
    ["tabmenu_GO"]                    = "物體",
    ["tt_GOButton"]                   = "切換遊戲物體功能視窗。",
  --[[Tooltips]]
    ["tt_ObjGo"]                      = "前往所選物體",
    ["tt_ObjAdd"]                     = "在你的位置和朝向新增目標物體的副本",
    ["tt_ObjMove"]                    = "將目標物體移動到你的位置",
    ["tt_ObjTurn"]                    = "轉動目標物體以符合你的朝向",
    ["tt_ObjDel"]                     = "刪除目標物體",
    ["tt_ObjNear"]                    = "傳回你附近物體的資訊",
    ["tt_ObjTarget"]                  = "選定最近的物體並顯示資訊",
    ["tt_ObjActivate"]                = "啟動目標物體",
    ["tt_ObjAddTemp"]                 = "新增物體的臨時副本",
    ["tt_ObjInfo"]                    = "獲取物體的擴充資訊",
    ["tt_ObjSetPhase"]                = "設定物體的相位",
    ["tt_ObjShowModel"]               = "載入並顯示模型",
    ["tt_ObjUnloadModel"]             = "卸載模型以釋放記憶體",
    ["tt_ObjMoveForward"]             = "向前移動",
    ["tt_ObjMoveBack"]                = "向後移動",
    ["tt_ObjMoveLeft"]                = "向左移動",
    ["tt_ObjMoveRight"]               = "向右移動",
    ["tt_ObjMoveUp"]                  = "向上移動",
    ["tt_ObjMoveDown"]                = "向下移動",
    ["tt_ObjSpawnHere"]               = "在此生成",
  --[[Control Labels]]
    ["ma_OBJGo"]                      = "物體前往",
    ["ma_OBJAdd"]                     = "物體新增",
    ["ma_OBJMove"]                    = "物體移動",
    ["ma_OBJTurn"]                    = "物體轉向",
    ["ma_OBJDel"]                     = "物體刪除",
    ["ma_OBJNear"]                    = "附近物體",
    ["ma_OBJTarget"]                  = "物體目標",
    ["ma_OBJActivate"]                = "物體啟動",
    ["ma_OBJAddTemp"]                 = "物體臨時新增",
    ["ma_OBJInfo"]                    = "物體資訊",
    ["ma_OBJSetPhase"]                = "物體相位",
    ["ma_GOGUIDLabel"]                = "GUID",
    ["ma_GOEntryIDLabel"]             = "條目ID",
    ["ma_GODisplayIDLabel"]           = "顯示ID",
    ["ma_GORangeLabel"]               = "範圍",
    ["ma_GOAddOnMoveLabel"]           = "移動時新增",
    ["ma_GOMoveOnMoveLabel"]          = "移動時移動",
    ["ma_GOMoveDistancesLabel"]       = "移動距離",
    ["ma_GOFwdBackLabel"]             = "前/後:",
    ["ma_GOLeftRightLabel"]           = "左/右:",
    ["ma_GOUpDownLabel"]              = "上/下:",
    ["ma_GORotateLeft"]               = "<<",
    ["ma_GORotateRight"]              = ">>",
    ["ma_GOZoomIn"]                   = "+",
    ["ma_GOZoomOut"]                  = "-",
    ["ma_GOMoveForward"]              = "前",
    ["ma_GOMoveLeft"]                 = "左",
    ["ma_GOMoveRight"]                = "右",
    ["ma_GOMoveBack"]                 = "後",
    ["ma_GOSpawnHere"]                = "此處",
    ["ma_GOMoveUp"]                   = "上",
    ["ma_GOMoveDown"]                 = "下",
    ["ma_GOShowButton"]               = "顯示",
    ["ma_GOUnloadButton"]             = "卸載",
  --[[Other]]
    ["msg_toggle_maps_confirm"]       = "你確定要切換所有地圖嗎？這可能會導致客戶端凍結幾秒鐘。",
    ["msg_account_lock_confirm"]      = "你確定要 %s 這個帳號嗎？",
    ["msg_acct_create_confirm"]       = "你確定要創建帳號 '%s' 嗎？",
    ["msg_acct_delete_confirm"]       = "你確定要刪除帳號 '%s' 嗎？",
    ["msg_tele_del_confirm"]          = "你確定要刪除傳送點 '%s' 嗎？",



--[[Tele Tab]]
  --[[Name]]
    ["tabmenu_Tele"]                  = "傳送",
    ["tt_TeleButton"]                 = "切換傳送功能視窗。",
  --[[Tooltips]]
  --[[Control Labels]]
    ["Zone"]                          = "|cFF00FF00區域:|r ",
    ["ma_ContinentSelection"]         = "大陸選擇",
    ["ma_EasternKingdomsN"]           = "東部王國(北)",
    ["ma_EasternKingdomsS"]           = "東部王國(南)",
    ["ma_Kalimdor"]                   = "卡林多",
    ["ma_Outland"]                    = "外域",
    ["ma_NorthrendAlliance"]          = "北裂境-聯盟",
    ["ma_NorthrendHorde"]             = "北裂境-部落",
    ["ma_BattlegroundsArenas"]        = "戰場/競技場",
    ["ma_InstancesEastern"]           = "副本:東部",
    ["ma_InstancesKalimdor"]          = "副本:卡林多",
    ["ma_InstancesOutland"]           = "副本:外域",
    ["ma_InstancesNorthrend"]         = "副本:北裂境",
    ["ma_Other"]                      = "其他",
    ["ma_ZoneSelection"]              = "區域選擇",
    ["ma_SelectedSubzone"]            = "已選子區域",
  --[[Other]]
    ["ma_NoZones"]                    = "無區域！",
    ["ma_NoSubZones"]                 = "無子區域！",



--[[Tickets Tab]]
  --[[Name]]
    ["tabmenu_ticket"]                = "工單",
    ["tt_TicketButton"]               = "切換顯示所有工單並允許你管理它們的視窗。",
  --[[Tooltips]]
    ["tt_TicketOn"]                   = "通告新工單。",
    ["tt_TicketOff"]                  = "不通告新工單。",
    ["tt_ResetTickets"]               = "重置已載入的工單",
    ["tt_LoadAllTickets"]             = "載入所有工單",
    ["tt_LoadOnlineTickets"]          = "載入線上玩家工單",
    ["tt_DeleteTicket"]               = "關閉工單並從清單中移除",
    ["tt_AnswerTicket"]               = "回覆工單",
    ["tt_GetCharTicket"]              = "召喚工單角色",
    ["tt_GoCharTicket"]               = "前往工單角色",
    ["tt_WhisperTicket"]              = "密語工單角色",
    ["tt_GoTicket"]                   = "前往工單位置",
    ["tt_ShowTickets"]                = "顯示已載入的工單",
  --[[Control Labels]]
    ["ma_ticketidlabel"]              = "|cFF00FF00工單:",
    ["ma_ticketcreatedbylabel"]       = "|cFF00FF00建立者:",
    ["ma_tickettimecreatedlabel"]     = "|cFF00FF00建立時間:",
    ["ma_ticketlastchangelabel"]      = "|cFF00FF00最後修改:",
    ["ma_ticketmessagelabel"]         = "|cFF00FF00工單資訊:",
    ["ma_LoadTicketsButton"]          = "重新整理",
    ["ma_GetCharTicketButton"]        = "召喚",
    ["ma_GoCharTicketButton"]         = "前往玩家",
    ["ma_AnswerButton"]               = "郵件",
    ["ma_DeleteButton"]               = "關閉",
    ["ma_ticketwhisperbutton"]        = "密語",
    ["ma_TicketCount"]                = "|cFF00FF00工單:|r ",
    ["ma_TicketsNoNew"]               = "你沒有新工單。",
    ["ma_TicketsNewNumber"]           = "你有 |cffeda55f%s|r 個新工單！",
    ["ma_TicketsGoLast"]              = "前往最後一個工單建立者 (%s)。",
    ["ma_TicketsGetLast"]             = "將 %s 帶到你這裡。",
    ["ma_TicketsInfoPlayer"]          = "|cFF00FF00玩家:|r ",
    ["ma_TicketsInfoStatus"]          = "|cFF00FF00狀態:|r ",
    ["ma_TicketsInfoAccount"]         = "|cFF00FF00帳號:|r ",
    ["ma_TicketsInfoAccLevel"]        = "|cFF00FF00帳號等級:|r ",
    ["ma_TicketsInfoLastIP"]          = "|cFF00FF00最後IP:|r ",
    ["ma_TicketsInfoPlayedTime"]      = "|cFF00FF00遊戲時間:|r ",
    ["ma_TicketsInfoLevel"]           = "|cFF00FF00等級:|r ",
    ["ma_TicketsInfoMoney"]           = "|cFF00FF00金錢:|r ",
    ["ma_TicketsInfoLatency"]         = "|cFF00FF00延遲:|r ",
    ["ma_TicketsNoInfo"]              = "無可用資訊",
    ["ma_TicketsNotLoaded"]           = "未載入工單...",
    ["ma_TicketsNoTickets"]           = "無可用工單！",
    ["ma_TicketResetButton"]          = "重置",
    ["ma_TicketLoadAllButton"]        = "載入全部",
    ["ma_TicketLoadOnlineButton"]     = "載入線上",
    ["ma_TicketShowButton"]           = "顯示",
    ["ma_TicketGoButton"]             = "前往工單",
    ["ma_TicketTicketLoaded"]         = "|cFF00FF00已載入工單號:|r %s\n\n玩家資訊\n\n",
    ["ma_Reload"]                     = "重新載入",
    ["ma_LoadMore"]                   = "載入更多...",
  --[[Other]]



--[[Misc Tab]]
  --[[Name]]
    ["tabmenu_Misc"]                  = "雜項",
    ["tt_MiscButton"]                 = "切換雜項操作視窗。",
  --[[Tooltips]]
    ["tt_FrmTrSlider"]                = "更改框架透明度",
    ["tt_BtnTrSlider"]                = "更改按鈕透明度",
    ["tt_windowismovable"]            = "允許移動視窗",
    ["tt_updatechanges"]              = "套用設定更改。重新載入介面。",
  --[[Control Labels]]
    ["cmd_toggle"]                    = "切換主視窗",
    ["cmd_transparency"]              = "切換基礎透明度(0.5或1.0)",
    ["cmd_tooltip"]                   = "切換是否顯示按鈕工具提示",
    ["ma_EnableTransparency"]         = "啟用透明度",
    ["ma_EnableLocalizedSearch"]      = "啟用本地化搜尋字串",
    ["ma_EnableMinimenu"]             = "啟用迷你選單/工具列",
    ["ma_EnableTooltips"]             = "啟用工具提示",
    ["ma_ShowChatOutput"]             = "顯示聊天輸出",
    ["ma_ShowMinimapButton"]          = "顯示小地圖按鈕",
    ["ma_InstantTeleport"]            = "傳送前顯示警告",
    ["ma_FrameStrataLabel"]           = "框架層級:",
    ["ma_FrameStrataBackground"]      = "背景",
    ["ma_FrameStrataLow"]             = "低",
    ["ma_FrameStrataMedium"]          = "中 (預設)",
    ["ma_FrameStrataHigh"]            = "高",
    ["ma_FrameStrataDialog"]          = "對話框",
    ["ma_FrameStrataFullscreen"]      = "全螢幕",
    ["ma_FrameStrataFullscreenDialog"] = "全螢幕對話框",
    ["ma_UpdateFrequencyLabel"]       = "指定伺服器標籤上差異圖的更新頻率。\n10000 = ~1分鐘, 50000 = ~5分鐘",
    ["ma_BackgroundColorLabel"]       = "背景顏色",
    ["ma_FrameColorLabel"]            = "框架顏色",
    ["ma_ButtonColorLabel"]           = "按鈕顏色",
    ["ma_LinkifierColorLabel"]        = "MangLinkifier",
    ["ma_UpdateChangesButton"]        = "更新更改",
  --[[Other]]
    ["ma_ApplyWeatherButton"]         = "套用天氣",
    ["ma_WeatherFine"]                = "晴朗",
    ["ma_WeatherFog"]                 = "霧",
    ["ma_WeatherRain"]                = "雨",
    ["ma_WeatherSnow"]                = "雪",
    ["ma_WeatherSand"]                = "沙塵",
    ["msg_transparency_saved"]        = "|cff00ff00AzerothAdmin:|r 透明度設定已儲存。更新更改或重新載入介面以套用。",
    ["msg_localsearch_saved"]         = "|cff00ff00AzerothAdmin:|r 本地化搜尋字串設定已儲存。更新更改或重新載入介面以套用。",
    ["msg_minimenu_saved"]            = "|cff00ff00AzerothAdmin:|r 迷你選單設定已儲存。",
    ["msg_tooltip_saved"]             = "|cff00ff00AzerothAdmin:|r 工具提示設定已儲存。更新更改或重新載入介面以套用。",
    ["msg_chatoutput_saved"]          = "|cff00ff00AzerothAdmin:|r 聊天輸出設定已儲存。",



--[[Server Tab]]
    ["tabmenu_server"]                = "伺服器",
    ["tt_ServerButton"]               = "顯示多個伺服器資訊並對伺服器執行操作。",
  --[[Tooltips]]
    ["tt_AnnounceButton"]             = "通告系統訊息。",
    ["tt_ShutdownButton"]             = "在欄位中指定的秒數後關閉伺服器，如果省略則立即關閉！",
    ["tt_CancelShutdownButton"]       = "取消伺服器關閉倒數計時。",
  --[[Control Labels]]
    ["ma_AnnounceButton"]             = "通告",
    ["ma_ShutdownButton"]             = "伺服器關閉",
    ["ma_CancelShutdownButton"]       = "取消關閉",
    ["ma_ReloadTableButton"]          = "重載表",
    ["ma_ReloadScriptsButton"]        = "重載指令碼",
    ["ma_ServerLatencyLabel"]         = "|cFF00FF00^伺服器延遲:|r",
    ["ma_UpdateDiffLabel"]            = "|cFF00FF00^更新差異:|r",
    ["ma_MeanLabel"]                  = "|cFF00FF00平均值:|r",
    ["ma_MedianLabel"]                = "|cFF00FF00中位數:|r",
    ["ma_PercentilesLabel"]           = "|cFF00FF00百分位數:|r",
  --[[Other]]
    ["msg_shutdown_time_required"]    = "使用伺服器關閉前請輸入秒數。",
    ["msg_shutdown_confirm"]          = "你確定要在%s秒後關閉伺服器嗎？",



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
    ["tt_ItemButton"]                 = "切換彈出視窗以搜尋物品並管理你的收藏。",
    ["tt_ItemSetButton"]              = "切換彈出視窗以搜尋物品套裝並管理你的收藏。",
    ["tt_SpellButton"]                = "切換彈出視窗以搜尋法術並管理你的收藏。",
    ["tt_QuestButton"]                = "切換彈出視窗以搜尋任務並管理你的收藏。",
    ["tt_CreatureButton"]             = "切換彈出視窗以搜尋生物並管理你的收藏。",
    ["tt_ObjectButton"]               = "切換彈出視窗以搜尋物體並管理你的收藏。",
    ["tt_SearchDefault"]              = "現在你可以輸入關鍵字並開始搜尋。",
    ["tt_SkillButton"]                = "切換彈出視窗以搜尋技能並管理你的收藏。",
  --[[Labels]]
    ["ma_PopupErrorTab"]              = "錯誤",
    ["ma_PopupFavoritesTab"]          = "收藏",
    ["ma_PopupTab3"]                  = "標籤3",
    ["ma_PopupAmountLabel"]           = "數量:",
    ["ma_PopupInvisibleText"]         = "隱形",
    ["ma_ItemButton"]                 = "物品搜尋",
    ["ma_ItemSetButton"]              = "套裝搜尋",
    ["ma_SpellButton"]                = "法術搜尋",
    ["ma_QuestButton"]                = "任務搜尋",
    ["ma_CreatureButton"]             = "生物搜尋",
    ["ma_ObjectButton"]               = "物體搜尋",
    ["ma_TeleSearchButton"]           = "傳送搜尋",
    ["ma_MailRecipient"]              = "收件人",
    ["ma_Mail"]                       = "發送郵件",
    ["ma_Send"]                       = "發送",
    ["ma_MailSubject"]                = "主旨",
    ["ma_MailYourMsg"]                = "這裡是你的訊息！",
    ["ma_SearchButton"]               = "搜尋...",
    ["ma_ResetButton"]                = "重置",
    ["ma_FavAdd"]                     = "新增所選",
    ["ma_FavRemove"]                  = "移除所選",
    ["ma_SelectAllButton"]            = "全選",
    ["ma_DeselectAllButton"]          = "取消全選",
    ["ma_MailBytesLeft"]              = "剩餘位元組: ",
    ["ma_SkillButton"]                = "技能搜尋",
    ["ma_SkillVar1Button"]            = "技能",
    ["ma_SkillVar2Button"]            = "最大技能",
    ["ma_ItemVar1Button"]             = "數量",
    ["ma_ObjectVar1Button"]           = "掉落模板",
    ["ma_ObjectVar2Button"]           = "重生時間",
    ["ma_NoFavorites"]                = "目前沒有儲存的收藏！",
    ["favoriteResults"]               = "|cFF00FF00收藏:|r ",



--[[Deprecated, but may be used again.]]
    ["ma_LearnAllButton"]             = "所有法術",
    ["ma_LearnCraftsButton"]          = "所有專業和配方",
    ["ma_LearnGMButton"]              = "預設GM法術",
    ["ma_LearnClassButton"]           = "所有職業法術",
    ["ma_GPSButton"]                  = "GPS",
    ["ma_Online"]                     = "線上",
    ["ma_Offline"]                    = "離線",



--[[Linkifier]]
    ["lfer_Spawn"]                    = "生成",
    ["lfer_List"]                     = "清單",
    ["lfer_Reload"]                   = "重載",
    ["lfer_Goto"]                     = "前往",
    ["lfer_Move"]                     = "移動",
    ["lfer_Turn"]                     = "轉向",
    ["lfer_Delete"]                   = "刪除",
    ["lfer_Teleport"]                 = "傳送",
    ["lfer_Morph"]                    = "變形",
    ["lfer_Add"]                      = "新增",
    ["lfer_Remove"]                   = "移除",
    ["lfer_Learn"]                    = "學習",
    ["lfer_Unlearn"]                  = "遺忘",
    ["lfer_Error"]                    = "錯誤：搜尋字串符合但發生錯誤或無法找到類型"

}
  for k,v in pairs(translations) do L[k] = v end
end
