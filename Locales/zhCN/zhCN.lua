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
1. Edit the first un-commented line below, which should resemble: function Return_zhCN(). Change
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

local L = LibStub("AceLocale-3.0"):NewLocale("AzerothAdmin", "zhCN")
if L then
  local translations = {
--[[General]]
  --[[Tooltips]]
    ["tt_Default"]                    = "将光标移动到元素上以切换工具提示！",
    ["tt_LanguageButton"]             = "重新加载AzerothAdmin并应用所选语言。",
    ["tt_RefreshButton"]              = "刷新服务器信息。",
  --[[Control Labels]]
    ["ma_LanguageButton"]             = "重载界面",
    ["ma_RefreshButton"]              = "刷新",
    ["ma_TopText"]                    = "顶部文本，你不应该看到这个！",
    ["ma_Top2Text"]                   = "顶部文本，你不应该看到这个！",
    ["ma_InfoOnlineText"]             = "在线玩家: ...",
    ["ma_InfoMaxOnlineText"]          = "最高在线: ...",
    ["ma_InfoUptimeText"]             = "服务器运行时间: ...",
    ["ma_InfoRevisionText"]           = "AzerothCore版本: ...",
    ["info_revision"]                 = "|cFF00FF00AzerothCore版本:|r ",
    ["info_platform"]                 = "|cFF00FF00服务器平台:|r ",
    ["info_online"]                   = "|cFF00FF00在线玩家:|r ",
    ["info_maxonline"]                = "|cFF00FF00最高在线:|r ",
    ["info_uptime"]                   = "|cFF00FF00运行时间:|r ",
    ["ma_CloseWindow"]                = "X",
    ["tt_CloseWindow"]                = "关闭窗口",
  --[[Other]]
    ["slashcmds"]                     = { "/AzerothAdmin", "/aa" },
    ["lang"]                          = "简体中文",
    ["realm"]                         = "|cFF00FF00服务器:|r "..GetCVar("realmName"),
    ["char"]                          = "|cFF00FF00角色:|r "..UnitName("player"),
    ["guid"]                          = "|cFF00FF00GUID:|r ",
    ["tickets"]                       = "|cFF00FF00工单:|r ",
    ["selectionerror1"]               = "请只选择你自己、另一个玩家或不选择任何对象！",
    ["selectionerror2"]               = "请只选择你自己或不选择任何对象！",
    ["selectionerror3"]               = "请只选择另一个玩家！",
    ["selectionerror4"]               = "请只选择一个NPC！",
    ["numbererror"]                   = "值必须是数字！",
    ["searchResults"]                 = "|cFF00FF00搜索结果:|r ",
    ["ma_parameters"]                 = "参数:", --Used on multiple tabs



--[[GM tab]]
  --[[Name]]
    ["tabmenu_Main"]                  = "GM",
  --[[Tooltips]]
    ["tt_MainButton"]                 = "切换AzerothAdmin主框架。",
    ["tt_DisplayAccountLevel"]        = "显示你的账号等级",
    ["tt_GMOnButton"]                 = "激活你的GM模式。",
    ["tt_GMOffButton"]                = "关闭你的GM模式。",
    ["tt_FlyOnButton"]                = "为所选角色激活飞行模式。",
    ["tt_FlyOffButton"]               = "为所选角色关闭飞行模式。",
    ["tt_HoverOnButton"]              = "激活你的悬浮模式。",
    ["tt_HoverOffButton"]             = "关闭你的悬浮模式。",
    ["tt_WhispOnButton"]              = "接受其他玩家的密语。",
    ["tt_WhispOffButton"]             = "不接受其他玩家的密语。",
    ["tt_InvisOnButton"]              = "使你隐形。",
    ["tt_InvisOffButton"]             = "使你可见。",
    ["tt_TaxiOnButton"]               = "向所选玩家显示所有飞行路线。此作弊将在登出时被停用。",
    ["tt_TaxiOffButton"]              = "停用飞行路线作弊并恢复玩家已知的飞行路线。",
    ["tt_ShowMapsButton"]             = "为所选角色显示地图。",
    ["tt_HideMapsButton"]             = "为所选角色隐藏地图。",
    ["tt_SpeedSlider"]                = "增加或减少所选角色的速度。",
    ["tt_ScaleSlider"]                = "增加或减少所选角色的体型。",
    ["tt_instakill"]                  = "勾选后，点击敌对生物即可杀死它。",
    ["tt_ScreenButton"]               = "截图。",
    ["tt_BankButton"]                 = "显示你的银行。",
    ["tt_Dismount"]                   = "下坐骑（如果你正在骑乘）",
    ["tt_SetJail_A_Button"]           = "将联盟监狱的位置设置为你当前的位置。",
    ["tt_SetJail_H_Button"]           = "将部落监狱的位置设置为你当前的位置。",
    ["tt_N"]                          = "向北导航",
    ["tt_S"]                          = "向南导航",
    ["tt_E"]                          = "向东导航",
    ["tt_W"]                          = "向西导航",
  --["tt_chatonbutton"]               = "开启GM聊天",
  --["tt_chatoffbutton"]              = "关闭GM聊天",
    ["tt_waterwalkonbutton"]          = "为所选生物开启水上行走"  ,
    ["tt_watewrwalkoffbutton"]        = "为所选生物关闭水上行走",
    ["tt_accountlockonbutton"]        = "锁定你的账号",
    ["tt_accountlockoffbutton"]       = "解锁你的账号",
    ["tt_DisplayAccountLvl"]          = "显示你的账号等级。",
    ["tt_SpeedSliderReset"]           = "将速度重置为1.0",
    ["tt_ScaleSliderReset"]           = "将体型重置为1.0",
    ["tt_gmnotifybutton"]             = "向所有在线GM发送消息$message [[参数: $message]]",
    ["tt_gmingamebutton"]             = "显示已登录的GM。",
    ["tt_gmlistbutton"]               = "显示此服务器上的GM账号",
    ["tt_petcreatebutton"]            = "使所选的动物成为你的宠物。",
    ["tt_petlearnbutton"]             = "教给你的宠物法术 [[参数: #SPELLID]]",
    ["tt_petunlearnbutton"]           = "移除你的宠物法术 [[参数: #SPELLID]]",
    ["tt_pettpbutton"]                = "修改宠物的训练点数 [[参数: #points]]",
    ["tt_lookuptaxibutton"]           = "查找飞行点 [[参数: $Areanamepart]]",
    ["tt_gotaxinodebutton"]           = "传送到指定的飞行点 [[参数: #taxinode]]",
    ["tt_gotriggerbutton"]            = "传送到指定的区域触发器 [[参数: #trigger_id]]",
    ["tt_goxybutton"]                 = "传送到MapID上地面/水面级别的指定坐标。如果省略MapID，则为当前地图 [[参数: #x #y [#mapid]]]",
    ["tt_goxyzbutton"]                = "传送到MapID上#z级别的指定坐标。如果省略MapID，则为当前地图 [[参数: #x #y #z [#mapid]]]",
    ["tt_gozonexybutton"]             = "传送到ZoneID中地面/水面级别的指定坐标。如果省略ZoneID，则为当前区域 [[参数: #x #y [#zoneid]]]",
    ["tt_lookupzonebutton"]           = "查找区域。 [[参数: $Areanamepart]]",
    ["tt_castbutton"]                 = "施放法术。 [[参数: #SpellID]]",
    ["tt_castbackbutton"]             = "所选生物将对你施放法术[SpellID]。 [[参数: #SpellID]]",
    ["tt_castdistbutton"]             = "你在距离[#Dist]处施放法术[SpellID]。 [[参数: #SpellID #Dist]]",
    ["tt_castselfbutton"]             = "所选生物对自己施放法术[SpellID]。 [[参数: #SpellID]]",
    ["tt_casttargetbutton"]           = "所选生物对其目标施放法术[SpellID]。 [[参数: #SpellID]]",
    ["tt_gmclearbutton"]              = "清空参数框。",
    ["tt_listitembutton"]             = "列出所有[#itemID]的出现。 [[参数: #ItemID]]",
    ["tt_acctcreatebutton"]           = "创建玩家账号 [[参数: $accountname $password]]",
    ["tt_acctdeletebutton"]           = "删除玩家账号及所有角色 [[参数: $accountname]]",
    ["tt_acctaddonbutton"]            = "设置$account使用#addon(0=WoW, 1=TBC, 2=WotLK) [[参数: $accountname #addon]]",
    ["tt_acctgmlvlbutton"]            = "设置$account为#gmlevel (0=玩家, 1=助手, 2=协助者, 3=GM, 4=管理员) [[参数: $accountname #gmlevel]]",
    ["tt_acctpasswdbutton"]           = "设置$account密码 [[参数: $accountname $password $password]]",
  --[[Control Labels]]
    ["ma_OffButton"]                  = "关闭",
    ["ma_displaylevelbutton"]         = "显示账号等级",
    ["ma_GMOnButton"]                 = "开启GM模式",
    ["ma_FlyOnButton"]                = "开启飞行模式",
    ["ma_HoverOnButton"]              = "开启悬浮模式",
    ["ma_WhisperOnButton"]            = "开启密语",
    ["ma_InvisOnButton"]              = "开启隐形",
    ["ma_TaxiOnButton"]               = "开启飞行路线作弊",
    ["ma_ShowMapsButton"]             = "显示地图",
    ["ma_HideMapsButton"]             = "隐藏地图",
    ["ma_instakill"]                  = "秒杀生物",
    ["ma_ScreenshotButton"]           = "截图",
    ["ma_BankButton"]                 = "银行",
    ["ma_DismountButton"]             = "下坐骑",
    ["ma_SetJail_A_Button"]           = "设置联盟监狱",
    ["ma_SetJail_H_Button"]           = "设置部落监狱",
    ["gridnavigator"]                 = "网格导航器",
    ["N"]                             = "北", --Abbreviation for North
    ["S"]                             = "南", --Abbreviation for South
    ["E"]                             = "东", --Abbreviation for East
    ["W"]                             = "西", --Abbreviation for West
    ["ma_chatbutton"]                 = "开启GM聊天",
    ["ma_mapsbutton"]                 = "查看所有地图",
    ["ma_waterwalkbutton"]            = "开启水上行走",
    ["ma_accountlockbutton"]          = "锁定账号",
    ["ma_gmnotify"]                   = "GM通知",
    ["ma_gmingame"]                   = "在线GM",
    ["ma_gmlist"]                     = "GM列表",
    ["ma_petcreate"]                  = "创建宠物",
    ["ma_petlearn"]                   = "宠物学习",
    ["ma_petunlearn"]                 = "宠物遗忘",
    ["ma_pettp"]                      = "宠物训练点",
    ["ma_lookuptaxi"]                 = "查找飞行点",
    ["ma_gotaxinode"]                 = "前往飞行点",
    ["ma_gotrigger"]                  = "前往触发器",
    ["ma_goxy"]                       = "前往XY",
    ["ma_goxyz"]                      = "前往XYZ",
    ["ma_gozonexy"]                   = "前往区域XY",
    ["ma_lookupzone"]                 = "查找区域",
    ["ma_cast"]                       = "施法",
    ["ma_castback"]                   = "反向施法",
    ["ma_castdist"]                   = "距离施法",
    ["ma_castself"]                   = "自我施法",
    ["ma_casttarget"]                 = "目标施法",
    ["ma_listitem"]                   = "列出物品",
    ["ma_GmClear"]                    = "清空参数",
    ["ma_acctcreate"]                 = "创建账号",
    ["ma_acctdelete"]                 = "删除账号",
    ["ma_acctaddon"]                  = "账号资料片",
    ["ma_acctgmlvl"]                  = "账号GM等级",
    ["ma_acctpasswd"]                 = "账号密码",
    ["ma_MiniMenuGM"]                 = "Gm",
    ["ma_MiniMenuChar"]               = "角",
    ["ma_MiniMenuNPC"]                = "Np",
    ["ma_MiniMenuGO"]                 = "GO",
    ["ma_MiniMenuTele"]               = "传",
    ["ma_MiniMenuTicket"]             = "单",
    ["ma_MiniMenuMisc"]               = "杂",
    ["ma_MiniMenuServer"]             = "服",
    ["ma_MiniMenuLog"]                = "志",
    ["ma_MiniMenuRevive"]             = "复活!",
  --[[Other]]



--[[Char Tab]]
  --[[Name]]
    ["tabmenu_Char"]                  = "角色",
    ["tt_CharButton"]                 = "切换角色专用操作窗口。",
  --[[Tooltips]]
    ["tt_RotateLeft"]                 = "向左旋转。",
    ["tt_RotateRight"]                = "向右旋转。",
    ["tt_killbutton"]                 = "杀死所选生物/玩家",
    ["tt_reviveplayer"]               = "复活所选玩家",
    ["tt_saveplayer"]                 = "保存所选玩家的角色",
    ["tt_KickButton"]                 = "将所选玩家踢出服务器。",
    ["tt_CooldownButton"]             = "移除/过期所选角色的所有法术影响冷却。",
    ["tt_GUIDButton"]                 = "显示所选角色的GUID。",
    ["tt_PinfoButton"]                = "获取所选玩家的信息。",
    ["tt_DistanceButton"]             = "获取到所选生物的距离。",
    ["tt_RecallButton"]               = "将所选生物召回到上次传送前的位置。",
    ["tt_DemorphButton"]              = "移除所选角色的任何变形。",
    ["tt_ShowMapsCharButton"]         = "为所选角色显示地图。",
    ["tt_HideMapsCharButton"]         = "为所选角色隐藏地图。",
    ["tt_learnlangbutton"]            = "学习所选法术",
    ["tt_modifybutton"]               = "按输入的数量修改所选属性",
    ["tt_resetbutton"]                = "重置所选属性",
    ["tt_modelzoominbutton"]          = "放大所选模型",
    ["tt_modelzoomoutbutton"]         = "缩小所选模型",
    ["tt_charbindsight"]              = "将你的视野绑定到所选单位",
    ["tt_charunbindsight"]            = "解除你的视野与所选单位的绑定",
    ["tt_charrename"]                 = "切换所选角色在下次登录时重命名",
    ["tt_charcustomize"]              = "切换所选角色在下次登录时自定义外观",
    ["tt_charchangerace"]             = "切换所选角色在下次登录时更改种族",
    ["tt_charchnagefaction"]          = "切换所选角色在下次登录时更改阵营",
    ["tt_charcombatstop"]             = "停止所选角色（或你自己）的战斗",
    ["tt_charmaxskill"]               = "将所选角色的技能设置为等级最大值",
    ["tt_charfreeze"]                 = "冻结目标玩家并禁用其聊天",
    ["tt_charunfreeze"]               = "解冻所选玩家并恢复聊天",
    ["tt_charlistdeleted"]            = "在聊天窗口列出已删除的角色",
    ["tt_chardeletedrestore"]         = "参数= #guid|$name [$newname] [#new account] [[此命令正在开发中]",
    ["tt_charpossess"]                = "无限期占据所选生物",
    ["tt_charunpossess"]              = "解除对所选生物的占据",
    ["tt_charrecall"]                 = "将所选玩家召回到他们上次传送的位置",
    ["tt_charrepair"]                 = "修理所选玩家的装备和武器",
    ["tt_banbutton"]                  = "参数= <account|ip|character> $NameOrIp <-1|xxdyyhzzm> $reason   [[封禁账号/IP并踢出。-1=永久封禁，或使用如4d3h24m16s的字符串]]",
    ["tt_gonamebutton"]               = "参数= $charactername  [[传送你到指定的角色]]",
    ["tt_createguildbutton"]          = "参数= $GuildLeaderName $GuildName  [[创建名为$GuildName的公会，$GuildLeaderName为会长]]",
    ["tt_teleaddbutton"]              = "参数= $Name  [[为你当前位置添加名为$Name的传送位置.tele命令]]",
    ["tt_baninfobutton"]              = "参数= <account|ip|character>  [[查看指定账号/ip/角色的封禁详细信息]]",
    ["tt_groupgobutton"]              = "参数= $charactername   [[将指定角色及其队伍传送到你的位置]]",
    ["tt_guildinvitebutton"]          = "参数= $charactername $guildname   [[将$charactername添加到公会$guildname]]",
    ["tt_teledelbutton"]              = "参数= $telename  [[从.tele位置列表中移除名为$telename的位置]]",
    ["tt_banlistbutton"]              = "参数= <account|ip> $NameOrIp   [[搜索并返回匹配参数的特定封禁]]",
    ["tt_namegobutton"]               = "参数= $charactername   [[将指定角色传送到你的位置]]",
    ["tt_guildrankbutton"]            = "参数= $charactername #ranknumber   [[将指定角色设置为其公会中指定的等级]]",
    ["tt_telegroupbutton"]            = "参数= $telename  [[将**所选**角色及其队伍传送到名为$telename的.tele位置]]",
    ["tt_unbanbutton"]                = "参数= <account|ip|character> $NameOrIp  [[解封指定的账号/IP/角色]]",
    ["tt_guilddeletebutton"]          = "参数= $guildname  [[删除指定的公会]]",
    ["tt_guilduninvitebutton"]        = "参数= $charactername  [[将指定角色踢出其公会]]",
    ["tt_telenamebutton"]             = "参数= $charactername $telename  [[将$charactername传送到$telename]]",
    ["tt_mutebutton"]                 = "参数= $charactername #minutes  [[禁用$charactername整个账号的聊天功能#minutes分钟]]",
    ["tt_charmorphbutton"]            = "参数 = #DisplayID [[输入你想应用的变形DisplayID]]",
    ["tt_charaurabutton"]             = "参数 = #AuraID [[输入你想应用的光环AuraID]]",
    ["tt_charunaurabutton"]           = "参数 = #AuraID [[输入你想移除的光环AuraID]]",
    ["tt_JailAButton"]                = "参数= $charactername [[将此框中显示名字的角色送入联盟监狱]]",
    ["tt_JailHButton"]                = "参数= $charactername [[将此框中显示名字的角色送入部落监狱]]",
    ["tt_UnJailButton"]               = "参数= $charactername [[将此框中显示名字的角色从监狱释放。]]",
    ["tt_UnMuteButton"]               = "解除$player的禁言。",
    ["tt_QuestAddButton"]             = "将#questid添加到**所选**玩家。",
    ["tt_QuestCompleteButton"]        = "将#questid标记为**所选**玩家已完成。",
    ["tt_QuestRemoveButton"]          = "从**所选**玩家移除#questid。",
    ["tt_DamageButton"]               = "参数= #amount 对**所选**生物/玩家造成的伤害量",
    ["tt_HideAreaButton"]             = "对**所选**玩家隐藏#areaid。",
    ["tt_ShowAreaButton"]             = "对**所选**玩家显示#areaid。",
    ["tt_HonorAddButton"]             = "为**所选**玩家添加#honorpoints荣誉点。",
    ["tt_HonorUpdateButton"]          = "无需参数。为**所选**玩家保存荣誉。",
  --[[Control Labels]]
    ["ma_KillButton"]                 = "杀死",
    ["ma_ReviveButton"]               = "复活",
    ["ma_SaveButton"]                 = "保存",
    ["ma_KickButton"]                 = "踢出",
    ["ma_CooldownButton"]             = "冷却",
    ["ma_GUIDButton"]                 = "显示GUID",
    ["ma_PinfoButton"]                = "玩家信息",
    ["ma_DistanceButton"]             = "距离",
    ["ma_RecallButton"]               = "召回",
    ["ma_DemorphButton"]              = "解除变形",
    ["ma_ShowMapsCharButton"]         = "显示地图",
    ["ma_HideMapsCharButton"]         = "隐藏地图",
    ["ma_LearnLangButton"]            = "所有语言",
    ["ma_Learn"]                      = "学习",
    ["ma_Modify"]                     = "修改",
    ["ma_Reset"]                      = "重置",
    ["ma_CharBindsight"]              = "绑定视野",
    ["ma_CharUnBindsight"]            = "解除绑定视野",
    ["ma_charrename"]                 = "重命名",
    ["ma_charcustomize"]              = "自定义外观",
    ["ma_charchangerace"]             = "更改种族",
    ["ma_charchnagefaction"]          = "更改阵营",
    ["ma_charcombatstop"]             = "停止战斗",
    ["ma_charmaxskill"]               = "最大技能",
    ["ma_charfreeze"]                 = "冻结",
    ["ma_charunfreeze"]               = "解冻",
    ["ma_charlistdeleted"]            = "列出已删角色",
    ["ma_chardeletedrestore"]         = "恢复已删角色",
    ["ma_charpossess"]                = "占据",
    ["ma_charunpossess"]              = "解除占据",
    ["ma_charrecall"]                 = "召回",
    ["ma_charrepair"]                 = "修理",
    ["ma_banbutton"]                  = "封禁",
    ["ma_gonamebutton"]               = "传送至",
    ["ma_createguildbutton"]          = "公会创建",
    ["ma_teleaddbutton"]              = "传送添加",
    ["ma_baninfobutton"]              = "封禁信息",
    ["ma_groupgobutton"]              = "召唤队伍",
    ["ma_guildinvitebutton"]          = "公会邀请",
    ["ma_teledelbutton"]              = "传送删除",
    ["ma_banlistbutton"]              = "封禁列表",
    ["ma_namegobutton"]               = "召唤",
    ["ma_guildrankbutton"]            = "公会等级",
    ["ma_telegroupbutton"]            = "传送队伍",
    ["ma_unbanbutton"]                = "解封",
    ["ma_guilddeletebutton"]          = "公会删除",
    ["ma_guilduninvitebutton"]        = "公会踢出",
    ["ma_telenamebutton"]             = "传送玩家",
    ["ma_mutebutton"]                 = "禁言",
    ["ma_Aura"]                       = "光环",
    ["ma_UnAura"]                     = "移除光环",
    ["ma_Morph"]                      = "变形",
    ["ma_JailAButton"]                = "监狱(联)",
    ["ma_JailHButton"]                = "监狱(部)",
    ["ma_UnJailButton"]               = "释放",
    ["ma_UnMuteButton"]               = "解除禁言",
    ["ma_QuestAddButton"]             = "添加任务",
    ["ma_QuestCompleteButton"]        = "完成任务",
    ["ma_QuestRemoveButton"]          = "移除任务",
    ["ma_DamageButton"]               = "伤害",
    ["ma_HideAreaButton"]             = "隐藏区域",
    ["ma_ShowAreaButton"]             = "显示区域",
    ["ma_HonorAddButton"]             = "添加荣誉",
    ["ma_HonorUpdateButton"]          = "更新荣誉",
    ["ma_CharRotateLeft"]             = "<<=",
    ["ma_CharRotateRight"]            = "=>>",
    ["ma_CharZoomIn"]                 = "+",
    ["ma_CharZoomOut"]                = "-",
  --[[Other]]
    ["ma_LevelUp"]                    = "升级",
    ["ma_LevelDown"]                  = "降级",
    ["ma_Money"]                      = "金钱",
    ["ma_Energy"]                     = "能量",
    ["ma_Rage"]                       = "怒气",
    ["ma_Mana"]                       = "法力",
    ["ma_Healthpoints"]               = "生命值",
    ["ma_Talents"]                    = "天赋",
    ["ma_Stats"]                      = "属性",
    ["ma_Spells"]                     = "法术",
    ["ma_Honor"]                      = "荣誉",
    ["ma_Level"]                      = "等级",
    ["ma_AllLang"]                    = "所有语言",
    ["ma_AllGMSpells"]                = "所有GM法术",
    ["ma_AllCrafts"]                  = "所有专业",
    ["ma_AllDefault"]                 = "所有默认",
    ["ma_AllMyClass"]                 = "所有职业法术",
    ["ma_AllMyPetTalents"]            = "所有宠物天赋",
    ["ma_AllMySpells"]                = "所有我的法术",
    ["ma_AllMyTalents"]               = "所有我的天赋",
    ["ma_AllRecipesAlchemy"]          = "所有配方(炼金术)",
    ["ma_AllRecipesBlacksmithing"]    = "所有配方(锻造)",
    ["ma_AllRecipesCooking"]          = "所有配方(烹饪)",
    ["ma_AllRecipesEnchanting"]       = "所有配方(附魔)",
    ["ma_AllRecipesEngineering"]      = "所有配方(工程学)",
    ["ma_AllRecipesFirstAid"]         = "所有配方(急救)",
    ["ma_AllRecipesInscription"]      = "所有配方(铭文)",
    ["ma_AllRecipesJewelcrafting"]    = "所有配方(珠宝加工)",
    ["ma_AllRecipesLeatherworking"]   = "所有配方(制皮)",
    ["ma_AllRecipesTailoring"]        = "所有配方(裁缝)",
    ["ma_resetallspells"]             = "重置所有法术",
    ["ma_resetalltalents"]            = "重置所有天赋",
    ["ma_achievements"]               = "成就",
    ["ma_AllSpeeds"]                  = "所有速度",
    ["ma_Arena"]                      = "竞技场",
    ["ma_BackWalk"]                   = "后退速度",
    ["ma_Drunk"]                      = "醉酒",
    ["ma_FlySpeed"]                   = "飞行速度",
    ["ma_Gender"]                     = "性别",
    ["ma_MountSpeed"]                 = "坐骑速度",
    ["ma_Phase"]                      = "相位",
    ["ma_RunicPower"]                 = "符文能量",
    ["ma_Speed"]                      = "速度",
    ["ma_StandState"]                 = "站立状态",
    ["ma_SwimSpeed"]                  = "游泳速度",
    ["ma_TalentPoints"]               = "天赋点",
    -- languages
    ["Common"]                        = "通用语",
    ["Orcish"]                        = "兽人语",
    ["Taurahe"]                       = "牛头人语",
    ["Darnassian"]                    = "达纳苏斯语",
    ["Dwarvish"]                      = "矮人语",
    ["Thalassian"]                    = "萨拉斯语",
    ["Demonic"]                       = "恶魔语",
    ["Draconic"]                      = "龙语",
    ["Titan"]                         = "泰坦语",
    ["Kalimag"]                       = "卡利姆多语",
    ["Gnomish"]                       = "侏儒语",
    ["Troll"]                         = "巨魔语",
    ["Gutterspeak"]                   = "亡灵语",
    ["Draenei"]                       = "德莱尼语",



--[[NPC Tab]]
  --[[Name]]
    ["tabmenu_NPC"]                   = "NPC",
    ["tt_NpcButton"]                  = "切换NPC相关功能窗口。",
  --[[Tooltips]]
    ["tt_NPCRotateLeft"]              = "向左旋转",
    ["tt_NPCRotateRight"]             = "向右旋转",
    ["tt_NPCKillButton"]              = "杀死所选目标",
    ["tt_npcrespawn"]                 = "重生所选生物，如果未选择则重生附近所有生物",
    ["tt_NPCDistanceButton"]          = "获取到所选生物的距离。",
    ["tt_NPCGUIDButton"]              = "显示所选角色的GUID。",
    ["tt_NPCInfoButton"]              = "获取所选NPC的信息。",
    ["tt_NPCDemorph"]                 = "解除所选NPC的变形",
    ["tt_NPCMove"]                    = "将所选生物移动到你的位置",
    ["tt_NPCDel"]                     = "删除所选生物",
    ["tt_getguid"]                    = "获取所选生物的GUID和ID",
    ["tt_NPCClear"]                   = "清除所有NPC信息字段（GUID、NPC ID、显示ID、距离）",
    ["tt_NPCAdd"]                     = "在你当前位置添加此NPC的副本。",
    ["tt_NPCGo"]                      = "传送你到GUID框中的NPC",
    ["tt_NPCMorph"]                   = "参数 = #DisplayID [[输入你想应用的变形DisplayID]]",
    ["tt_NPCSay"]                     = "使所选NPC说[参数]",
    ["tt_NPCYell"]                    = "使所选NPC喊[参数]",
    ["tt_NPCAura"]                    = "参数 = #AuraID [[输入你想应用的光环AuraID]]",
    ["tt_NPCUnaura"]                  = "参数 = #AuraID [[输入你想移除的光环AuraID]]",
    ["tt_PlayEmote"]                  = "播放左侧列表中的表情",
    ["tt_GPSButton"]                  = "显示所选角色的坐标。",
    ["tt_DisplayUp"]                  = "将NPC显示ID增加1",
    ["tt_DisplayDown"]                = "将NPC显示ID减少1",
    ["tt_IDUp"]                       = "将NPC ID增加1",
    ["tt_IDDown"]                     = "将NPC ID减少1",
    ["tt_npcmodelzoominbutton"]       = "放大所选模型",
    ["tt_npcmodelzoomoutbutton"]      = "缩小所选模型",
    ["tt_npcbindsight"]               = "将你的视野绑定到所选NPC",
    ["tt_npcunbindsight"]             = "解除你的视野与所选NPC的绑定",
    ["tt_npccometome"]                = "强制所选NPC来到你的位置。位置不会存储在数据库中。",
    ["tt_npcpossess"]                 = "无限期占据所选生物",
    ["tt_npcunpossess"]               = "解除对所选生物的占据",
    ["tt_NPCFreezeButton"]            = "停止所选NPC的移动，保存路径点",
    ["tt_NPCFreezeDelButton"]         = "停止所选NPC的移动，不保存路径点",
    ["tt_WayEndAdd"]                  = "在现有堆栈末尾添加路径点",
    ["tt_NPCAddWay"]                  = "向堆栈添加路径点。生物GUID必须在下面的框中",
    ["tt_WayMAdd"]                    = "向所选生物现有移动堆栈添加路径点",
    ["tt_WayModifyDel"]               = "从生物现有移动堆栈删除所选路径点",
    ["tt_WayShow0"]                   = "停止显示所选生物的路径点。",
    ["tt_WayShow1"]                   = "显示所选生物的路径点。",
    ["tt_NPCAdd_WayShowOn"]           = "显示所选生物的路径点",
    ["tt_NPCUnFreeze_RandomButton"]   = "允许所选NPC随机移动。",
    ["tt_NPCUnFreeze_WayButton"]      = "允许所选NPC路径点移动。",
    ["tt_MoveStackButton"]            = "显示所选角色的移动堆栈。",
  --[[Control Labels]]
    ["Morph"]                         = "变形",
    ["ma_NPCKillButton"]              = "杀死",
    ["ma_Respawn"]                    = "重生",
    ["ma_NPCDistanceButton"]          = "距离",
    ["ma_NPCGUIDButton"]              = "显示GUID",
    ["ma_NPCInfoButton"]              = "NPC信息",
    ["ma_NPCDemorph"]                 = "解除变形",
    ["ma_NPCMove"]                    = "NPC移动",
    ["ma_NPCDel"]                     = "NPC删除",
    ["ma_getguid"]                    = "获取GUID",
    ["ma_NPCAdd"]                     = "NPC添加",
    ["ma_NPCGo"]                      = "NPC前往",
    ["ma_NPCMorph"]                   = "变形",
    ["ma_NPCSay"]                     = "NPC说",
    ["ma_NPCYell"]                    = "NPC喊",
    ["ma_NPCAura"]                    = "NPC光环",
    ["ma_NPCUnAura"]                  = "NPC移除光环",
    ["ma_PlayEmote1"]                 = "表情",
    ["ma_PlayEmote2"]                 = "表情",
    ["ma_DistanceBox"]                = "距离",
    ["ma_NPCBindsight"]               = "绑定视野",
    ["ma_NPCUnBindsight"]             = "解除绑定视野",
    ["ma_NPCComeToMe"]                = "过来",
    ["ma_npcpossess"]                 = "占据",
    ["ma_npcunpossess"]               = "解除占据",
    ["ma_WayShow1"]                   = "显示路径",
    ["ma_WayShow0"]                   = "隐藏路径",
    ["ma_MoveStackButton"]            = "显示移动",
    ["ma_NPCFreezeButton"]            = "NPC停留",
    ["ma_WayAllDel"]                  = "NPC停留删",
    ["ma_WayMAdd"]                    = "路径添加",
    ["ma_NPCUnFreeze_RandomButton"]   = "随机移动",
    ["ma_NPCUnFreeze_WayButton"]      = "路径移动",
    ["ma_WayMDel"]                    = "路径删除",
    ["ma_WayEndAdd"]                  = "路径末添",
    ["ma_WayAdd"]                     = "路径添加",
    ["ma_WayShow"]                    = "路径显示",
    ["ma_NPCRotateLeft"]              = "<<=",
    ["ma_NPCRotateRight"]             = "=>>",
    ["ma_NPCZoomIn"]                  = "+",
    ["ma_NPCZoomOut"]                 = "-",
    ["ma_NPCDisplayIDLabel"]          = "显示ID:",
    ["ma_NPCIDLabel"]                 = "NPC ID:",
    ["ma_NPCGUIDLabel"]               = "GUID:",
    ["ma_NPCDisplayDown"]             = "<<",
    ["ma_NPCDisplayUp"]               = ">>",
    ["ma_NPCIDUp"]                    = ">>",
    ["ma_NPCClearButton"]             = "清空",
  --[[Other]]



--[[GObjects Tab]]
  --[[Name]]
    ["tabmenu_GO"]                    = "物体",
    ["tt_GOButton"]                   = "切换游戏物体功能窗口。",
  --[[Tooltips]]
    ["tt_ObjGo"]                      = "前往所选物体",
    ["tt_ObjAdd"]                     = "在你的位置和朝向添加目标物体的副本",
    ["tt_ObjMove"]                    = "将目标物体移动到你的位置",
    ["tt_ObjTurn"]                    = "转动目标物体以匹配你的朝向",
    ["tt_ObjDel"]                     = "删除目标物体",
    ["tt_ObjNear"]                    = "返回你附近物体的信息",
    ["tt_ObjTarget"]                  = "选定最近的物体并显示信息",
    ["tt_ObjActivate"]                = "激活目标物体",
    ["tt_ObjAddTemp"]                 = "添加物体的临时副本",
    ["tt_ObjInfo"]                    = "获取物体的扩展信息",
    ["tt_ObjSetPhase"]                = "设置物体的相位",
    ["tt_ObjShowModel"]               = "加载并显示模型",
    ["tt_ObjUnloadModel"]             = "卸载模型以释放内存",
    ["tt_ObjMoveForward"]             = "向前移动",
    ["tt_ObjMoveBack"]                = "向后移动",
    ["tt_ObjMoveLeft"]                = "向左移动",
    ["tt_ObjMoveRight"]               = "向右移动",
    ["tt_ObjMoveUp"]                  = "向上移动",
    ["tt_ObjMoveDown"]                = "向下移动",
    ["tt_ObjSpawnHere"]               = "在此生成",
  --[[Control Labels]]
    ["ma_OBJGo"]                      = "物体前往",
    ["ma_OBJAdd"]                     = "物体添加",
    ["ma_OBJMove"]                    = "物体移动",
    ["ma_OBJTurn"]                    = "物体转向",
    ["ma_OBJDel"]                     = "物体删除",
    ["ma_OBJNear"]                    = "附近物体",
    ["ma_OBJTarget"]                  = "物体目标",
    ["ma_OBJActivate"]                = "物体激活",
    ["ma_OBJAddTemp"]                 = "物体临时添加",
    ["ma_OBJInfo"]                    = "物体信息",
    ["ma_OBJSetPhase"]                = "物体相位",
    ["ma_GOGUIDLabel"]                = "GUID",
    ["ma_GOEntryIDLabel"]             = "条目ID",
    ["ma_GODisplayIDLabel"]           = "显示ID",
    ["ma_GORangeLabel"]               = "范围",
    ["ma_GOAddOnMoveLabel"]           = "移动时添加",
    ["ma_GOMoveOnMoveLabel"]          = "移动时移动",
    ["ma_GOMoveDistancesLabel"]       = "移动距离",
    ["ma_GOFwdBackLabel"]             = "前/后:",
    ["ma_GOLeftRightLabel"]           = "左/右:",
    ["ma_GOUpDownLabel"]              = "上/下:",
    ["ma_GORotateLeft"]               = "<<",
    ["ma_GORotateRight"]              = ">>",
    ["ma_GOZoomIn"]                   = "+",
    ["ma_GOZoomOut"]                  = "-",
    ["ma_GOMoveForward"]              = "前",
    ["ma_GOMoveLeft"]                 = "左",
    ["ma_GOMoveRight"]                = "右",
    ["ma_GOMoveBack"]                 = "后",
    ["ma_GOSpawnHere"]                = "此处",
    ["ma_GOMoveUp"]                   = "上",
    ["ma_GOMoveDown"]                 = "下",
    ["ma_GOShowButton"]               = "显示",
    ["ma_GOUnloadButton"]             = "卸载",
  --[[Other]]
    ["msg_toggle_maps_confirm"]       = "你确定要切换所有地图吗？这可能会导致客户端冻结几秒钟。",
    ["msg_account_lock_confirm"]      = "你确定要 %s 这个账号吗？",
    ["msg_acct_create_confirm"]       = "你确定要创建账号 '%s' 吗？",
    ["msg_acct_delete_confirm"]       = "你确定要删除账号 '%s' 吗？",
    ["msg_tele_del_confirm"]          = "你确定要删除传送点 '%s' 吗？",



--[[Tele Tab]]
  --[[Name]]
    ["tabmenu_Tele"]                  = "传送",
    ["tt_TeleButton"]                 = "切换传送功能窗口。",
  --[[Tooltips]]
  --[[Control Labels]]
    ["Zone"]                          = "|cFF00FF00区域:|r ",
    ["ma_ContinentSelection"]         = "大陆选择",
    ["ma_EasternKingdomsN"]           = "东部王国(北)",
    ["ma_EasternKingdomsS"]           = "东部王国(南)",
    ["ma_Kalimdor"]                   = "卡利姆多",
    ["ma_Outland"]                    = "外域",
    ["ma_NorthrendAlliance"]          = "诺森德-联盟",
    ["ma_NorthrendHorde"]             = "诺森德-部落",
    ["ma_BattlegroundsArenas"]        = "战场/竞技场",
    ["ma_InstancesEastern"]           = "副本:东部",
    ["ma_InstancesKalimdor"]          = "副本:卡利姆多",
    ["ma_InstancesOutland"]           = "副本:外域",
    ["ma_InstancesNorthrend"]         = "副本:诺森德",
    ["ma_Other"]                      = "其他",
    ["ma_ZoneSelection"]              = "区域选择",
    ["ma_SelectedSubzone"]            = "已选子区域",
  --[[Other]]
    ["ma_NoZones"]                    = "无区域！",
    ["ma_NoSubZones"]                 = "无子区域！",



--[[Tickets Tab]]
  --[[Name]]
    ["tabmenu_ticket"]                = "工单",
    ["tt_TicketButton"]               = "切换显示所有工单并允许你管理它们的窗口。",
  --[[Tooltips]]
    ["tt_TicketOn"]                   = "通告新工单。",
    ["tt_TicketOff"]                  = "不通告新工单。",
    ["tt_ResetTickets"]               = "重置已加载的工单",
    ["tt_LoadAllTickets"]             = "加载所有工单",
    ["tt_LoadOnlineTickets"]          = "加载在线玩家工单",
    ["tt_DeleteTicket"]               = "关闭工单并从列表中删除",
    ["tt_AnswerTicket"]               = "回复工单",
    ["tt_GetCharTicket"]              = "召唤工单角色",
    ["tt_GoCharTicket"]               = "前往工单角色",
    ["tt_WhisperTicket"]              = "密语工单角色",
    ["tt_GoTicket"]                   = "前往工单位置",
    ["tt_ShowTickets"]                = "显示已加载的工单",
  --[[Control Labels]]
    ["ma_ticketidlabel"]              = "|cFF00FF00工单:",
    ["ma_ticketcreatedbylabel"]       = "|cFF00FF00创建者:",
    ["ma_tickettimecreatedlabel"]     = "|cFF00FF00创建时间:",
    ["ma_ticketlastchangelabel"]      = "|cFF00FF00最后修改:",
    ["ma_ticketmessagelabel"]         = "|cFF00FF00工单信息:",
    ["ma_LoadTicketsButton"]          = "刷新",
    ["ma_GetCharTicketButton"]        = "召唤",
    ["ma_GoCharTicketButton"]         = "前往玩家",
    ["ma_AnswerButton"]               = "邮件",
    ["ma_DeleteButton"]               = "关闭",
    ["ma_ticketwhisperbutton"]        = "密语",
    ["ma_TicketCount"]                = "|cFF00FF00工单:|r ",
    ["ma_TicketsNoNew"]               = "你没有新工单。",
    ["ma_TicketsNewNumber"]           = "你有 |cffeda55f%s|r 个新工单！",
    ["ma_TicketsGoLast"]              = "前往最后一个工单创建者 (%s)。",
    ["ma_TicketsGetLast"]             = "将 %s 带到你这里。",
    ["ma_TicketsInfoPlayer"]          = "|cFF00FF00玩家:|r ",
    ["ma_TicketsInfoStatus"]          = "|cFF00FF00状态:|r ",
    ["ma_TicketsInfoAccount"]         = "|cFF00FF00账号:|r ",
    ["ma_TicketsInfoAccLevel"]        = "|cFF00FF00账号等级:|r ",
    ["ma_TicketsInfoLastIP"]          = "|cFF00FF00最后IP:|r ",
    ["ma_TicketsInfoPlayedTime"]      = "|cFF00FF00游戏时间:|r ",
    ["ma_TicketsInfoLevel"]           = "|cFF00FF00等级:|r ",
    ["ma_TicketsInfoMoney"]           = "|cFF00FF00金钱:|r ",
    ["ma_TicketsInfoLatency"]         = "|cFF00FF00延迟:|r ",
    ["ma_TicketsNoInfo"]              = "无可用信息",
    ["ma_TicketsNotLoaded"]           = "未加载工单...",
    ["ma_TicketsNoTickets"]           = "无可用工单！",
    ["ma_TicketResetButton"]          = "重置",
    ["ma_TicketLoadAllButton"]        = "加载全部",
    ["ma_TicketLoadOnlineButton"]     = "加载在线",
    ["ma_TicketShowButton"]           = "显示",
    ["ma_TicketGoButton"]             = "前往工单",
    ["ma_TicketTicketLoaded"]         = "|cFF00FF00已加载工单号:|r %s\n\n玩家信息\n\n",
    ["ma_Reload"]                     = "重新加载",
    ["ma_LoadMore"]                   = "加载更多...",
  --[[Other]]



--[[Misc Tab]]
  --[[Name]]
    ["tabmenu_Misc"]                  = "杂项",
    ["tt_MiscButton"]                 = "切换杂项操作窗口。",
  --[[Tooltips]]
    ["tt_FrmTrSlider"]                = "更改框架透明度",
    ["tt_BtnTrSlider"]                = "更改按钮透明度",
    ["tt_windowismovable"]            = "允许移动窗口",
    ["tt_updatechanges"]              = "应用设置更改。重新加载界面。",
    ["tt_UpdateFrequency"]            = "10000 = ~1分钟, 50000 = ~5分钟",
  --[[Control Labels]]
    ["cmd_toggle"]                    = "切换主窗口",
    ["cmd_transparency"]              = "切换基础透明度(0.5或1.0)",
    ["cmd_tooltip"]                   = "切换是否显示按钮工具提示",
    ["ma_EnableTransparency"]         = "启用透明度",
    ["ma_EnableLocalizedSearch"]      = "启用本地化搜索字符串",
    ["ma_EnableMinimenu"]             = "启用迷你菜单/工具栏",
    ["ma_EnableTooltips"]             = "启用工具提示",
    ["ma_ShowChatOutput"]             = "显示聊天输出",
    ["ma_ShowMinimapButton"]          = "显示小地图按钮",
    ["ma_InstantTeleport"]            = "传送前无警告",
    ["ma_FrameStrataLabel"]           = "框架层级:",
    ["ma_FrameStrataBackground"]      = "背景",
    ["ma_FrameStrataLow"]             = "低",
    ["ma_FrameStrataMedium"]          = "中 (默认)",
    ["ma_FrameStrataHigh"]            = "高",
    ["ma_FrameStrataDialog"]          = "对话框",
    ["ma_FrameStrataFullscreen"]      = "全屏",
    ["ma_FrameStrataFullscreenDialog"] = "全屏对话框",
    ["ma_UpdateFrequencyLabel"]       = "差异图更新频率：",
    ["ma_BackgroundColorLabel"]       = "背景颜色",
    ["ma_FrameColorLabel"]            = "框架颜色",
    ["ma_ButtonColorLabel"]           = "按钮颜色",
    ["ma_LinkifierColorLabel"]        = "MangLinkifier",
    ["ma_UpdateChangesButton"]        = "更新更改",
  --[[Other]]
    ["ma_ApplyWeatherButton"]         = "应用天气",
    ["ma_WeatherFine"]                = "晴朗",
    ["ma_WeatherFog"]                 = "雾",
    ["ma_WeatherRain"]                = "雨",
    ["ma_WeatherSnow"]                = "雪",
    ["ma_WeatherSand"]                = "沙尘",
    ["msg_transparency_saved"]        = "|cff00ff00AzerothAdmin:|r 透明度设置已保存。更新更改或重新加载界面以应用。",
    ["msg_localsearch_saved"]         = "|cff00ff00AzerothAdmin:|r 本地化搜索字符串设置已保存。更新更改或重新加载界面以应用。",
    ["msg_minimenu_saved"]            = "|cff00ff00AzerothAdmin:|r 迷你菜单设置已保存。",
    ["msg_tooltip_saved"]             = "|cff00ff00AzerothAdmin:|r 工具提示设置已保存。更新更改或重新加载界面以应用。",
    ["msg_chatoutput_saved"]          = "|cff00ff00AzerothAdmin:|r 聊天输出设置已保存。",



--[[Server Tab]]
    ["tabmenu_server"]                = "服务器",
    ["tt_ServerButton"]               = "显示多个服务器信息并对服务器执行操作。",
  --[[Tooltips]]
    ["tt_AnnounceButton"]             = "通告系统消息。",
    ["tt_ShutdownButton"]             = "在字段中指定的秒数后关闭服务器，如果省略则立即关闭！",
    ["tt_CancelShutdownButton"]       = "取消服务器关闭倒计时。",
  --[[Control Labels]]
    ["ma_AnnounceButton"]             = "通告",
    ["ma_ShutdownButton"]             = "服务器关闭",
    ["ma_CancelShutdownButton"]       = "取消关闭",
    ["ma_ReloadTableButton"]          = "重载表",
    ["ma_ReloadScriptsButton"]        = "重载脚本",
    ["ma_UpdateButton"]               = "更新",
    ["ma_ServerLatencyLabel"]         = "|cFF00FF00^服务器延迟:|r",
    ["ma_UpdateDiffLabel"]            = "|cFF00FF00^更新差异:|r",
    ["ma_MeanLabel"]                  = "|cFF00FF00平均值:|r",
    ["ma_MedianLabel"]                = "|cFF00FF00中位数:|r",
    ["ma_PercentilesLabel"]           = "|cFF00FF00百分位数:|r",
  --[[Other]]
    ["msg_shutdown_time_required"]    = "使用服务器关闭前请输入秒数。",
    ["msg_shutdown_confirm"]          = "你确定要在%s秒后关闭服务器吗？",



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
    ["tt_ItemButton"]                 = "切换弹出窗口以搜索物品并管理你的收藏。",
    ["tt_ItemSetButton"]              = "切换弹出窗口以搜索物品套装并管理你的收藏。",
    ["tt_SpellButton"]                = "切换弹出窗口以搜索法术并管理你的收藏。",
    ["tt_QuestButton"]                = "切换弹出窗口以搜索任务并管理你的收藏。",
    ["tt_CreatureButton"]             = "切换弹出窗口以搜索生物并管理你的收藏。",
    ["tt_ObjectButton"]               = "切换弹出窗口以搜索物体并管理你的收藏。",
    ["tt_SearchDefault"]              = "现在你可以输入关键字并开始搜索。",
    ["tt_SkillButton"]                = "切换弹出窗口以搜索技能并管理你的收藏。",
  --[[Labels]]
    ["ma_PopupErrorTab"]              = "错误",
    ["ma_PopupFavoritesTab"]          = "收藏",
    ["ma_PopupTab3"]                  = "标签3",
    ["ma_PopupAmountLabel"]           = "数量:",
    ["ma_PopupInvisibleText"]         = "隐形",
    ["ma_ItemButton"]                 = "物品搜索",
    ["ma_ItemSetButton"]              = "套装搜索",
    ["ma_SpellButton"]                = "法术搜索",
    ["ma_QuestButton"]                = "任务搜索",
    ["ma_CreatureButton"]             = "生物搜索",
    ["ma_ObjectButton"]               = "物体搜索",
    ["ma_TeleSearchButton"]           = "传送搜索",
    ["ma_MailRecipient"]              = "收件人",
    ["ma_Mail"]                       = "发送邮件",
    ["ma_Send"]                       = "发送",
    ["ma_MailSubject"]                = "主题",
    ["ma_MailYourMsg"]                = "这里是你的消息！",
    ["ma_SearchButton"]               = "搜索...",
    ["ma_ResetButton"]                = "重置",
    ["ma_FavAdd"]                     = "添加所选",
    ["ma_FavRemove"]                  = "移除所选",
    ["ma_SelectAllButton"]            = "全选",
    ["ma_DeselectAllButton"]          = "取消全选",
    ["ma_MailBytesLeft"]              = "剩余字节: ",
    ["ma_SkillButton"]                = "技能搜索",
    ["ma_SkillVar1Button"]            = "技能",
    ["ma_SkillVar2Button"]            = "最大技能",
    ["ma_ItemVar1Button"]             = "数量",
    ["ma_ObjectVar1Button"]           = "掉落模板",
    ["ma_ObjectVar2Button"]           = "刷新时间",
    ["ma_NoFavorites"]                = "当前没有保存的收藏！",
    ["favoriteResults"]               = "|cFF00FF00收藏:|r ",



--[[Deprecated, but may be used again.]]
    ["ma_LearnAllButton"]             = "所有法术",
    ["ma_LearnCraftsButton"]          = "所有专业和配方",
    ["ma_LearnGMButton"]              = "默认GM法术",
    ["ma_LearnClassButton"]           = "所有职业法术",
    ["ma_GPSButton"]                  = "GPS",
    ["ma_Online"]                     = "在线",
    ["ma_Offline"]                    = "离线",



--[[Linkifier]]
    ["lfer_Spawn"]                    = "生成",
    ["lfer_List"]                     = "列表",
    ["lfer_Reload"]                   = "重载",
    ["lfer_Goto"]                     = "前往",
    ["lfer_Move"]                     = "移动",
    ["lfer_Turn"]                     = "转向",
    ["lfer_Delete"]                   = "删除",
    ["lfer_Teleport"]                 = "传送",
    ["lfer_Morph"]                    = "变形",
    ["lfer_Add"]                      = "添加",
    ["lfer_Remove"]                   = "移除",
    ["lfer_Learn"]                    = "学习",
    ["lfer_Unlearn"]                  = "遗忘",
    ["lfer_Error"]                    = "错误：搜索字符串匹配但发生错误或无法找到类型"

}
  for k,v in pairs(translations) do L[k] = v end
end
