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
1. Edit the first un-commented line below, which should resemble: function Return_koKR(). Change
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

local L = LibStub("AceLocale-3.0"):NewLocale("AzerothAdmin", "koKR")
if L then
  local translations = {
--[[General]]
  --[[Tooltips]]
    ["tt_Default"]                    = "요소 위에 커서를 올려 툴팁을 토글하세요!",
    ["tt_LanguageButton"]             = "AzerothAdmin을 다시 로드하고 선택한 언어를 적용합니다.",
    ["tt_RefreshButton"]              = "서버 정보를 새로고침합니다.",
  --[[Control Labels]]
    ["ma_LanguageButton"]             = "UI 새로고침",
    ["ma_RefreshButton"]              = "새로고침",
    ["ma_TopText"]                    = "이 텍스트는 표시되지 않아야 합니다!",
    ["ma_Top2Text"]                   = "이 텍스트는 표시되지 않아야 합니다!",
    ["ma_InfoOnlineText"]             = "접속 중인 플레이어: ...",
    ["ma_InfoMaxOnlineText"]          = "최대 접속자 수: ...",
    ["ma_InfoUptimeText"]             = "서버 가동 시간: ...",
    ["ma_InfoRevisionText"]           = "AzerothCore 리비전: ...",
    ["info_revision"]                 = "|cFF00FF00AzerothCore rev.|r ",
    ["info_platform"]                 = "|cFF00FF00서버 플랫폼:|r ",
    ["info_online"]                   = "|cFF00FF00접속 중인 플레이어:|r ",
    ["info_maxonline"]                = "|cFF00FF00최대 접속자 수:|r ",
    ["info_uptime"]                   = "|cFF00FF00가동 시간:|r ",
    ["ma_CloseWindow"]                = "X",
    ["tt_CloseWindow"]                = "창 닫기",
  --[[Other]]
    ["slashcmds"]                     = { "/AzerothAdmin", "/aa" },
    ["lang"]                          = "한국어",
    ["realm"]                         = "|cFF00FF00서버:|r "..GetCVar("realmName"),
    ["char"]                          = "|cFF00FF00캐릭터:|r "..UnitName("player"),
    ["guid"]                          = "|cFF00FF00Guid:|r ",
    ["tickets"]                       = "|cFF00FF00티켓:|r ",
    ["selectionerror1"]               = "자신, 다른 플레이어 또는 아무것도 선택하지 마세요!",
    ["selectionerror2"]               = "자신 또는 아무것도 선택하지 마세요!",
    ["selectionerror3"]               = "다른 플레이어만 선택하세요!",
    ["selectionerror4"]               = "NPC만 선택하세요!",
    ["numbererror"]                   = "값은 숫자여야 합니다!",
    ["searchResults"]                 = "|cFF00FF00검색 결과:|r ",
    ["ma_parameters"]                 = "매개변수:", --Used on multiple tabs



--[[GM tab]]
  --[[Name]]
    ["tabmenu_Main"]                  = "GM",
  --[[Tooltips]]
    ["tt_MainButton"]                 = "AzerothAdmin 메인 프레임을 토글합니다.",
    ["tt_DisplayAccountLevel"]        = "계정 레벨을 표시합니다",
    ["tt_GMOnButton"]                 = "GM 모드를 활성화합니다.",
    ["tt_GMOffButton"]                = "GM 모드를 비활성화합니다.",
    ["tt_FlyOnButton"]                = "선택한 캐릭터의 비행 모드를 활성화합니다.",
    ["tt_FlyOffButton"]               = "선택한 캐릭터의 비행 모드를 비활성화합니다.",
    ["tt_SpectatorOnButton"]           = ".gm on이 필요합니다. GM 캐릭터가 상대 진영 멤버에게 /follow를 사용할 수 있게 합니다. 참고: 다른 지역으로 순간이동 / 새로운 지역을 로드해야 할 수 있으며, 즉시 업데이트되지 않습니다.",
    ["tt_SpectatorOffButton"]          = "관전 모드를 비활성화합니다.",
    ["tt_WhispOnButton"]              = "다른 플레이어의 귓속말을 받습니다.",
    ["tt_WhispOffButton"]             = "다른 플레이어의 귓속말을 받지 않습니다.",
    ["tt_InvisOnButton"]              = "투명 상태가 됩니다.",
    ["tt_InvisOffButton"]             = "가시 상태가 됩니다.",
    ["tt_TaxiOnButton"]               = "선택한 플레이어에게 모든 택시 경로를 표시합니다. 이 치트는 로그아웃 시 비활성화됩니다.",
    ["tt_TaxiOffButton"]              = "택시 치트를 비활성화하고 플레이어가 알고 있는 택시 경로를 복원합니다.",
    ["tt_SpeedSlider"]                = "선택한 캐릭터의 속도를 증가 또는 감소시킵니다.",
    ["tt_ScaleSlider"]                = "선택한 캐릭터의 크기를 증가 또는 감소시킵니다.",
    ["tt_instakill"]                  = "체크하면 적 생명체를 클릭하여 죽입니다.",
    ["tt_ScreenButton"]               = "스크린샷을 찍습니다.",
    ["tt_BankButton"]                 = "은행을 표시합니다.",
    ["tt_Dismount"]                   = "탑승 중이면 내립니다",
    ["tt_SetJail_A_Button"]           = "얼라이언스 감옥의 위치를 현재 위치로 설정합니다.",
    ["tt_SetJail_H_Button"]           = "호드 감옥의 위치를 현재 위치로 설정합니다.",
    ["tt_N"]                          = "북쪽으로 이동",
    ["tt_S"]                          = "남쪽으로 이동",
    ["tt_E"]                          = "동쪽으로 이동",
    ["tt_W"]                          = "서쪽으로 이동",
  --["tt_chatonbutton"]               = "GM 채팅 켜기",
  --["tt_chatoffbutton"]              = "GM 채팅 끄기",
    ["tt_waterwalkonbutton"]          = "선택한 생명체의 물 위 걷기를 켭니다"  ,
    ["tt_watewrwalkoffbutton"]        = "선택한 생명체의 물 위 걷기를 끕니다",
    ["tt_DisplayAccountLvl"]          = "계정 레벨을 표시합니다.",
    ["tt_SpeedSliderReset"]           = "속도를 1.0으로 초기화",
    ["tt_ScaleSliderReset"]           = "크기를 1.0으로 초기화",
    ["tt_gmnotifybutton"]             = "모든 온라인 GM에게 메시지 $message를 보냅니다 [[매개변수: $message]]",
    ["tt_gmingamebutton"]             = "로그인한 GM을 표시합니다.",
    ["tt_gmlistbutton"]               = "이 서버의 GM 계정을 표시합니다",
    ["tt_petcreatebutton"]            = "선택한 동물을 펫으로 만듭니다.",
    ["tt_petlearnbutton"]             = "펫에게 주문을 가르칩니다 [[매개변수: #SPELLID]]",
    ["tt_petunlearnbutton"]           = "펫의 주문을 제거합니다 [[매개변수: #SPELLID]]",
    ["tt_pettpbutton"]                = "펫의 훈련 포인트를 수정합니다 [[매개변수: #points]]",
    ["tt_lookuptaxibutton"]           = "택시노드를 검색합니다 [[매개변수: $Areanamepart]]",
    ["tt_gotaxinodebutton"]           = "지정된 택시노드로 순간이동합니다 [[매개변수: #taxinode]]",
    ["tt_gotriggerbutton"]            = "지정된 지역 트리거로 순간이동합니다 [[매개변수: #trigger_id]]",
    ["tt_goxybutton"]                 = "MapID의 지면/수면 레벨에서 지정된 좌표로 순간이동합니다. MapID가 생략되면 현재 맵 [[매개변수: #x #y [#mapid]]]",
    ["tt_goxyzbutton"]                = "MapID의 #z 레벨에서 지정된 좌표로 순간이동합니다. MapID가 생략되면 현재 맵 [[매개변수: #x #y #z [#mapid]]]",
    ["tt_gozonexybutton"]             = "ZoneID의 지면/수면 레벨에서 지정된 좌표로 순간이동합니다. ZoneID가 생략되면 현재 지역 [[매개변수: #x #y [#zoneid]]]",
    ["tt_lookupzonebutton"]           = "지역을 검색합니다. [[매개변수: $Areanamepart]]",
    ["tt_castbutton"]                 = "주문을 시전합니다. [[매개변수: #SpellID]]",
    ["tt_castbackbutton"]             = "선택한 생명체가 당신에게 주문 [SpellID]를 시전합니다. [[매개변수: #SpellID]]",
    ["tt_castdistbutton"]             = "거리 [#Dist]에서 주문 [SpellID]를 시전합니다. [[매개변수: #SpellID #Dist]]",
    ["tt_castselfbutton"]             = "선택한 생명체가 자신에게 주문 [SpellID]를 시전합니다. [[매개변수: #SpellID]]",
    ["tt_casttargetbutton"]           = "선택한 생명체가 대상에게 주문 [SpellID]를 시전합니다. [[매개변수: #SpellID]]",
    ["tt_gmclearbutton"]              = "매개변수 상자를 지웁니다.",
    ["tt_listitembutton"]             = "[#itemID]의 모든 발생을 나열합니다. [[매개변수: #ItemID]]",
    ["tt_acctaddonbutton"]            = "$account를 #addon(0=WoW, 1=TBC, 2=WotLK)으로 설정합니다 [[매개변수: $accountname #addon]]",
    ["tt_acctgmlvlbutton"]            = "$account를 #gmlevel (0=플레이어, 1=도우미, 2=보조, 3=GM, 4=관리자)로 설정합니다 [[매개변수: $accountname #gmlevel]]",
    ["tt_acctpasswdbutton"]           = "$account $password를 설정합니다 [[매개변수: $accountname $password $password]]",
  --[[Control Labels]]
    ["ma_OffButton"]                  = "끄기",
    ["ma_displaylevelbutton"]         = "계정 레벨 표시",
    ["ma_GMOnButton"]                 = "GM 모드 켜기",
    ["ma_FlyOnButton"]                = "비행 모드 켜기",
    ["ma_SpectatorOnButton"]           = "관전 모드 켜기",
    ["ma_WhisperOnButton"]            = "귓속말 켜기",
    ["ma_InvisOnButton"]              = "투명 켜기",
    ["ma_TaxiOnButton"]               = "택시 치트 켜기",
    ["ma_instakill"]                  = "즉시 처치 생명체",
    ["ma_ScreenshotButton"]           = "스크린샷",
    ["ma_BankButton"]                 = "은행",
    ["ma_DismountButton"]             = "탈것 내리기",
    ["ma_SetJail_A_Button"]           = "감옥 설정 A",
    ["ma_SetJail_H_Button"]           = "감옥 설정 H",
    ["gridnavigator"]                 = "그리드 네비게이터",
    ["N"]                             = "북", --Abbreviation for North
    ["S"]                             = "남", --Abbreviation for South
    ["E"]                             = "동", --Abbreviation for East
    ["W"]                             = "서", --Abbreviation for West
    ["ma_chatbutton"]                 = "GM 채팅 켜기",
    ["ma_waterwalkbutton"]            = "물 위 걷기 켜기",
    ["ma_gmnotify"]                   = "GM 알림",
    ["ma_gmingame"]                   = "게임 내 GM",
    ["ma_gmlist"]                     = "GM 목록",
    ["ma_petcreate"]                  = "펫 생성",
    ["ma_petlearn"]                   = "펫 학습",
    ["ma_petunlearn"]                 = "펫 학습 취소",
    ["ma_pettp"]                      = "펫 TP",
    ["ma_lookuptaxi"]                 = "택시 검색",
    ["ma_gotaxinode"]                 = "택시노드 이동",
    ["ma_gotrigger"]                  = "트리거 이동",
    ["ma_goxy"]                       = "XY 이동",
    ["ma_goxyz"]                      = "XYZ 이동",
    ["ma_gozonexy"]                   = "지역XY 이동",
    ["ma_lookupzone"]                 = "지역 검색",
    ["ma_cast"]                       = "시전",
    ["ma_castback"]                   = "역시전",
    ["ma_castdist"]                   = "거리 시전",
    ["ma_castself"]                   = "자신 시전",
    ["ma_casttarget"]                 = "대상 시전",
    ["ma_listitem"]                   = "아이템 목록",
    ["ma_GmClear"]                    = "매개변수 지우기",
    ["ma_acctaddon"]                  = "계정 애드온",
    ["ma_acctgmlvl"]                  = "계정 GM레벨",
    ["ma_acctpasswd"]                 = "계정 비밀번호",
    ["ma_MiniMenuGM"]                 = "Gm",
    ["ma_MiniMenuChar"]               = "Cr",
    ["ma_MiniMenuNPC"]                = "Np",
    ["ma_MiniMenuGO"]                 = "GO",
    ["ma_MiniMenuTele"]               = "Te",
    ["ma_MiniMenuTicket"]             = "Ti",
    ["ma_MiniMenuMisc"]               = "Mi",
    ["ma_MiniMenuServer"]             = "Se",
    ["ma_MiniMenuLog"]                = "Lo",
    ["ma_MiniMenuRevive"]             = "부활!",
  --[[Other]]



--[[Char Tab]]
  --[[Name]]
    ["tabmenu_Char"]                  = "캐릭터",
    ["tt_CharButton"]                 = "캐릭터 관련 작업이 있는 창을 토글합니다.",
  --[[Tooltips]]
    ["tt_RotateLeft"]                 = "왼쪽으로 회전합니다.",
    ["tt_RotateRight"]                = "오른쪽으로 회전합니다.",
    ["tt_killbutton"]                 = "선택한 생명체/플레이어를 죽입니다",
    ["tt_reviveplayer"]               = "선택한 플레이어를 부활시킵니다",
    ["tt_saveplayer"]                 = "선택한 플레이어의 캐릭터를 저장합니다",
    ["tt_KickButton"]                 = "선택한 플레이어를 서버에서 추방합니다.",
    ["tt_CooldownButton"]             = "선택한 캐릭터의 모든 주문 효과 재사용 대기시간을 제거/만료시킵니다.",
    ["tt_GUIDButton"]                 = "선택한 캐릭터의 GUID를 표시합니다.",
    ["tt_PinfoButton"]                = "선택한 플레이어의 정보를 가져옵니다.",
    ["tt_DistanceButton"]             = "선택한 생명체까지의 거리를 가져옵니다.",
    ["tt_RecallButton"]               = "선택한 플레이어를 마지막 순간이동 전 위치로 소환합니다.",
    ["tt_DemorphButton"]              = "선택한 캐릭터의 모든 변신을 제거합니다.",
    ["tt_learnlangbutton"]            = "선택한 주문을 배웁니다",
    ["tt_modifybutton"]               = "선택한 속성을 입력한 양만큼 수정합니다",
    ["tt_resetbutton"]                = "선택한 속성을 초기화합니다",
    ["tt_modelzoominbutton"]          = "선택한 모델을 확대합니다",
    ["tt_modelzoomoutbutton"]         = "선택한 모델을 축소합니다",
    ["tt_charbindsight"]              = "선택한 유닛에 시야를 연결합니다",
    ["tt_charunbindsight"]            = "선택한 유닛에서 시야 연결을 해제합니다",
    ["tt_charrename"]                 = "다음 로그인 시 선택한 캐릭터의 이름 변경을 토글합니다",
    ["tt_charcustomize"]              = "다음 로그인 시 선택한 캐릭터의 외형 변경을 토글합니다",
    ["tt_charchangerace"]             = "다음 로그인 시 선택한 캐릭터의 종족 변경을 토글합니다",
    ["tt_charchnagefaction"]          = "다음 로그인 시 선택한 캐릭터의 진영 변경을 토글합니다",
    ["tt_charcombatstop"]             = "선택한 캐릭터(또는 자신)의 전투를 중지합니다",
    ["tt_charmaxskill"]               = "선택한 캐릭터의 기술을 레벨에 맞는 최대 값으로 설정합니다",
    ["tt_charfreeze"]                 = "대상 플레이어를 얼리고 채팅을 비활성화합니다",
    ["tt_charunfreeze"]               = "선택한 플레이어를 얼리기 해제하고 채팅을 복원합니다",
    ["tt_charlistdeleted"]            = "삭제된 캐릭터를 채팅 창에 나열합니다",
    ["tt_chardeletedrestore"]         = "매개변수= #guid|$name [$newname] [#new account] [[이 명령은 작업 중입니다]",
    ["tt_charpossess"]                = "선택한 생명체를 무기한으로 빙의합니다",
    ["tt_charunpossess"]              = "선택한 생명체의 빙의를 해제합니다",
    ["tt_charrecall"]                 = "선택한 플레이어를 마지막 순간이동 위치로 소환합니다",
    ["tt_charrepair"]                 = "선택한 플레이어의 갑옷과 무기를 수리합니다",
    ["tt_banbutton"]                  = "매개변수= <account|ip|character> $NameOrIp <-1|xxdyyhzzm> $reason   [[계정/IP 차단 및 추방. -1=영구 차단, 또는 4d3h24m16s와 같은 문자열]]",
    ["tt_gonamebutton"]               = "매개변수= $charactername  [[지정된 캐릭터에게 순간이동합니다]]",
    ["tt_createguildbutton"]          = "매개변수= $GuildLeaderName $GuildName  [[$GuildLeaderName을 리더로 하는 $GuildName 길드를 생성합니다]]",
    ["tt_teleaddbutton"]              = "매개변수= $Name  [[현재 위치에 $Name이라는 이름의 .tele 명령어 순간이동 위치를 추가합니다]]",
    ["tt_baninfobutton"]              = "매개변수= <account|ip|character>  [[지정된 계정/ip/캐릭터의 차단에 대한 상세 정보를 봅니다]]",
    ["tt_groupgobutton"]              = "매개변수= $charactername   [[지정된 캐릭터와 그의/그녀의 그룹을 당신의 위치로 순간이동시킵니다]]",
    ["tt_guildinvitebutton"]          = "매개변수= $charactername $guildname   [[$charactername을 $guildname 길드에 추가합니다]]",
    ["tt_teledelbutton"]              = "매개변수= $telename  [[.tele 위치 목록에서 $telename이라는 위치를 제거합니다]]",
    ["tt_banlistbutton"]              = "매개변수= <account|ip> $NameOrIp   [[매개변수와 일치하는 특정 차단을 검색하고 반환합니다]]",
    ["tt_namegobutton"]               = "매개변수= $charactername   [[지정된 캐릭터를 당신의 위치로 순간이동시킵니다]]",
    ["tt_guildrankbutton"]            = "매개변수= $charactername #ranknumber   [[지정된 캐릭터를 그의/그녀의 길드에서 지정된 계급으로 설정합니다]]",
    ["tt_telegroupbutton"]            = "매개변수= $telename  [[**선택한** 캐릭터와 그의/그녀의 그룹을 $telename이라는 .tele 위치로 순간이동시킵니다]]",
    ["tt_unbanbutton"]                = "매개변수= <account|ip|character> $NameOrIp  [[지정된 계정/IP/캐릭터의 차단을 해제합니다]]",
    ["tt_guilddeletebutton"]          = "매개변수= $guildname  [[지정된 길드를 삭제합니다]]",
    ["tt_guilduninvitebutton"]        = "매개변수= $charactername  [[지정된 캐릭터를 그의/그녀의 길드에서 추방합니다]]",
    ["tt_telenamebutton"]             = "매개변수= $charactername $telename  [[$charactername을 $telename으로 순간이동시킵니다]]",
    ["tt_mutebutton"]                 = "매개변수= $charactername #minutes  [[$charactername의 전체 계정에 대한 채팅을 #분 동안 비활성화합니다]]",
    ["tt_charmorphbutton"]            = "매개변수 = #DisplayID [[적용할 변신의 DisplayID를 입력하세요]]",
    ["tt_charaurabutton"]             = "매개변수 = #AuraID [[적용할 오라의 AuraID를 입력하세요]]",
    ["tt_charunaurabutton"]           = "매개변수 = #AuraID [[제거할 오라의 AuraID를 입력하세요]]",
    ["tt_JailAButton"]                = "매개변수= $charactername [[이 상자에 나타난 이름의 캐릭터를 얼라이언스 감옥으로 보냅니다]]",
    ["tt_JailHButton"]                = "매개변수= $charactername [[이 상자에 나타난 이름의 캐릭터를 호드 감옥으로 보냅니다]]",
    ["tt_UnJailButton"]               = "매개변수= $charactername [[이 상자에 나타난 이름의 캐릭터를 감옥에서 풀어줍니다.]]",
    ["tt_UnMuteButton"]               = "$player의 채팅 금지를 해제합니다.",
    ["tt_DamageButton"]               = "매개변수= **선택한** 생명체/플레이어에게 적용할 피해량",
    ["tt_HideAreaButton"]             = "**선택한** 플레이어로부터 #areaid를 숨깁니다.",
    ["tt_ShowAreaButton"]             = "**선택한** 플레이어에게 #areaid를 표시합니다.",
  --[[Control Labels]]
    ["ma_KillButton"]                 = "죽이기",
    ["ma_ReviveButton"]               = "부활",
    ["ma_SaveButton"]                 = "저장",
    ["ma_KickButton"]                 = "추방",
    ["ma_CooldownButton"]             = "재사용 대기시간",
    ["ma_GUIDButton"]                 = "GUID 표시",
    ["ma_PinfoButton"]                = "플레이어 정보",
    ["ma_DistanceButton"]             = "거리",
    ["ma_RecallButton"]               = "소환",
    ["ma_DemorphButton"]              = "변신 해제",
    ["ma_LearnLangButton"]            = "모든 언어",
    ["ma_Learn"]                      = "배우기",
    ["ma_Modify"]                     = "수정",
    ["ma_Reset"]                      = "초기화",
    ["ma_CharBindsight"]              = "시야 연결",
    ["ma_CharUnBindsight"]            = "시야 연결 해제",
    ["ma_charrename"]                 = "이름 변경",
    ["ma_charcustomize"]              = "외형 변경",
    ["ma_charchangerace"]             = "종족 변경",
    ["ma_charchnagefaction"]          = "진영 변경",
    ["ma_charcombatstop"]             = "전투 중지",
    ["ma_charmaxskill"]               = "최대 기술",
    ["ma_charfreeze"]                 = "얼리기",
    ["ma_charunfreeze"]               = "얼리기 해제",
    ["ma_charlistdeleted"]            = "삭제된 캐릭터 목록",
    ["ma_chardeletedrestore"]         = "삭제된 캐릭터 복원",
    ["ma_charpossess"]                = "빙의",
    ["ma_charunpossess"]              = "빙의 해제",
    ["ma_charrecall"]                 = "소환",
    ["ma_charrepair"]                 = "수리",
    ["ma_banbutton"]                  = "차단",
    ["ma_gonamebutton"]               = "나타나기",
    ["ma_createguildbutton"]          = "길드 생성",
    ["ma_teleaddbutton"]              = "순간이동 추가",
    ["ma_baninfobutton"]              = "차단 정보",
    ["ma_groupgobutton"]              = "그룹 소환",
    ["ma_guildinvitebutton"]          = "길드 초대",
    ["ma_teledelbutton"]              = "순간이동 삭제",
    ["ma_banlistbutton"]              = "차단 목록",
    ["ma_namegobutton"]               = "소환",
    ["ma_guildrankbutton"]            = "길드 계급",
    ["ma_telegroupbutton"]            = "그룹 순간이동",
    ["ma_unbanbutton"]                = "차단 해제",
    ["ma_guilddeletebutton"]          = "길드 삭제",
    ["ma_guilduninvitebutton"]        = "길드 추방",
    ["ma_telenamebutton"]             = "이름 순간이동",
    ["ma_mutebutton"]                 = "채팅 금지",
    ["ma_Aura"]                       = "오라",
    ["ma_UnAura"]                     = "오라 제거",
    ["ma_Morph"]                      = "변신",
    ["ma_JailAButton"]                = "감옥 (A)",
    ["ma_JailHButton"]                = "감옥 (H)",
    ["ma_UnJailButton"]               = "감옥 해제",
    ["ma_UnMuteButton"]               = "채팅 금지 해제",
    ["ma_QuestAddButton"]             = "퀘스트 추가",
    ["ma_QuestCompleteButton"]        = "퀘스트 완료",
    ["ma_QuestRemoveButton"]          = "퀘스트 제거",
    ["ma_DamageButton"]               = "피해",
    ["ma_HideAreaButton"]             = "지역 숨기기",
    ["ma_ShowAreaButton"]             = "지역 표시",
    ["ma_CharRotateLeft"]             = "<<=",
    ["ma_CharRotateRight"]            = "=>>",
    ["ma_CharZoomIn"]                 = "+",
    ["ma_CharZoomOut"]                = "-",
  --[[Other]]
    ["ma_LevelUp"]                    = "레벨 업",
    ["ma_LevelDown"]                  = "레벨 다운",
    ["ma_Money"]                      = "골드",
    ["ma_Energy"]                     = "기력",
    ["ma_Rage"]                       = "분노",
    ["ma_Mana"]                       = "마나",
    ["ma_Healthpoints"]               = "생명력",
    ["ma_Talents"]                    = "특성",
    ["ma_Stats"]                      = "능력치",
    ["ma_Spells"]                     = "주문",
    ["ma_Honor"]                      = "명예",
    ["ma_Level"]                      = "레벨",
    ["ma_AllLang"]                    = "모든 언어",
    ["ma_AllGMSpells"]                = "모든 GM 주문",
    ["ma_AllCrafts"]                  = "모든 전문 기술",
    ["ma_AllDefault"]                 = "모든 기본",
    ["ma_AllMyClass"]                 = "내 직업 모두",
    ["ma_AllMyPetTalents"]            = "내 펫 특성 모두",
    ["ma_AllMySpells"]                = "내 주문 모두",
    ["ma_AllMyTalents"]               = "내 특성 모두",
    ["ma_AllRecipesAlchemy"]          = "모든 제조법 (연금술)",
    ["ma_AllRecipesBlacksmithing"]    = "모든 제조법 (대장기술)",
    ["ma_AllRecipesCooking"]          = "모든 제조법 (요리)",
    ["ma_AllRecipesEnchanting"]       = "모든 제조법 (마법부여)",
    ["ma_AllRecipesEngineering"]      = "모든 제조법 (기계공학)",
    ["ma_AllRecipesFirstAid"]         = "모든 제조법 (응급치료)",
    ["ma_AllRecipesInscription"]      = "모든 제조법 (주문각인)",
    ["ma_AllRecipesJewelcrafting"]    = "모든 제조법 (보석세공)",
    ["ma_AllRecipesLeatherworking"]   = "모든 제조법 (가죽세공)",
    ["ma_AllRecipesTailoring"]        = "모든 제조법 (재봉술)",
    ["ma_resetallspells"]             = "모든 주문 초기화",
    ["ma_resetalltalents"]            = "모든 특성 초기화",
    ["ma_achievements"]               = "업적",
    ["ma_AllSpeeds"]                  = "모든 속도",
    ["ma_Arena"]                      = "투기장",
    ["ma_BackWalk"]                   = "뒤로 걷기",
    ["ma_Drunk"]                      = "취함",
    ["ma_FlySpeed"]                   = "비행 속도",
    ["ma_Gender"]                     = "성별",
    ["ma_MountSpeed"]                 = "탈것 속도",
    ["ma_Phase"]                      = "위상",
    ["ma_RunicPower"]                 = "룬 마력",
    ["ma_Speed"]                      = "속도",
    ["ma_StandState"]                 = "상태",
    ["ma_SwimSpeed"]                  = "수영 속도",
    ["ma_TalentPoints"]               = "특성 포인트",
    -- languages
    ["Common"]                        = "공용어",
    ["Orcish"]                        = "오크어",
    ["Taurahe"]                       = "타우렌어",
    ["Darnassian"]                    = "다르나서스어",
    ["Dwarvish"]                      = "드워프어",
    ["Thalassian"]                    = "쏠라시안",
    ["Demonic"]                       = "악마어",
    ["Draconic"]                      = "용족어",
    ["Titan"]                         = "타이탄어",
    ["Kalimag"]                       = "칼리마그",
    ["Gnomish"]                       = "노움어",
    ["Troll"]                         = "트롤어",
    ["Gutterspeak"]                   = "구울어",
    ["Draenei"]                       = "드레나이어",



--[[NPC Tab]]
  --[[Name]]
    ["tabmenu_NPC"]                   = "NPC",
    ["tt_NpcButton"]                  = "NPC 관련 기능이 있는 창을 토글합니다.",
  --[[Tooltips]]
    ["tt_NPCRotateLeft"]              = "왼쪽으로 회전",
    ["tt_NPCRotateRight"]             = "오른쪽으로 회전",
    ["tt_NPCKillButton"]              = "선택한 대상을 죽입니다",
    ["tt_npcrespawn"]                 = "선택한 생명체를 다시 생성하거나, 선택되지 않은 경우 근처의 모든 생명체를 다시 생성합니다",
    ["tt_NPCDistanceButton"]          = "선택한 생명체까지의 거리를 가져옵니다.",
    ["tt_NPCGUIDButton"]              = "선택한 캐릭터의 GUID를 표시합니다.",
    ["tt_NPCInfoButton"]              = "선택한 NPC의 정보를 가져옵니다.",
    ["tt_NPCDemorph"]                 = "선택한 NPC의 변신을 해제합니다",
    ["tt_NPCMove"]                    = "선택한 생명체를 당신의 위치로 이동시킵니다",
    ["tt_NPCDel"]                     = "선택한 생명체를 삭제합니다",
    ["tt_getguid"]                    = "선택한 생명체의 GUID와 ID를 가져옵니다",
    ["tt_NPCClear"]                   = "모든 NPC 정보 필드를 지웁니다 (GUID, NPC ID, Display ID, 거리)",
    ["tt_NPCAdd"]                     = "현재 위치에 이 NPC의 복사본을 추가합니다.",
    ["tt_NPCGo"]                      = "GUID 상자의 NPC로 순간이동합니다",
    ["tt_NPCMorph"]                   = "매개변수 = #DisplayID [[적용할 변신의 DisplayID를 입력하세요]]",
    ["tt_NPCSay"]                     = "선택한 npc가 [매개변수]를 말하게 합니다",
    ["tt_NPCYell"]                    = "선택한 npc가 [매개변수]를 외치게 합니다",
    ["tt_NPCAura"]                    = "매개변수 = #AuraID [[적용할 오라의 AuraID를 입력하세요]]",
    ["tt_NPCUnaura"]                  = "매개변수 = #AuraID [[제거할 오라의 AuraID를 입력하세요]]",
    ["tt_PlayEmote"]                  = "왼쪽 목록에서 감정 표현을 재생합니다",
    ["tt_GPSButton"]                  = "선택한 캐릭터의 좌표를 표시합니다.",
    ["tt_DisplayUp"]                  = "NPC DisplayID를 1 증가시킵니다",
    ["tt_DisplayDown"]                = "NPC DisplayID를 1 감소시킵니다",
    ["tt_IDUp"]                       = "NPC ID를 1 증가시킵니다",
    ["tt_IDDown"]                     = "NPC ID를 1 감소시킵니다",
    ["tt_npcmodelzoominbutton"]       = "선택한 모델을 확대합니다",
    ["tt_npcmodelzoomoutbutton"]      = "선택한 모델을 축소합니다",
    ["tt_npcbindsight"]               = "선택한 NPC에 시야를 연결합니다",
    ["tt_npcunbindsight"]             = "선택한 NPC에서 시야 연결을 해제합니다",
    ["tt_npccometome"]                = "선택한 NPC를 강제로 당신의 위치로 오게 합니다. 위치는 DB에 저장되지 않습니다.",
    ["tt_npcpossess"]                 = "선택한 생명체를 무기한으로 빙의합니다",
    ["tt_npcunpossess"]               = "선택한 생명체의 빙의를 해제합니다",
    ["tt_NPCFreezeButton"]            = "선택한 NPC의 이동을 중지하고 경유지를 저장합니다",
    ["tt_NPCFreezeDelButton"]         = "선택한 NPC의 이동을 중지하고 경유지를 저장하지 않습니다",
    ["tt_WayEndAdd"]                  = "기존 스택의 끝에 경유지를 추가합니다",
    ["tt_NPCAddWay"]                  = "스택에 경유지를 추가합니다. 생명체 GUID가 아래 상자에 있어야 합니다",
    ["tt_WayMAdd"]                    = "선택한 생명체의 기존 이동 스택에 경유지를 추가합니다",
    ["tt_WayModifyDel"]               = "생명체의 기존 이동 스택에서 선택한 경유지를 삭제합니다",
    ["tt_WayShow0"]                   = "선택한 생명체의 경유지 표시를 중지합니다.",
    ["tt_WayShow1"]                   = "선택한 생명체의 경유지를 표시합니다.",
    ["tt_NPCAdd_WayShowOn"]           = "선택한 생명체의 경유지를 표시합니다",
    ["tt_NPCUnFreeze_RandomButton"]   = "선택한 NPC의 무작위 이동을 허용합니다.",
    ["tt_NPCUnFreeze_WayButton"]      = "선택한 NPC의 경유지 이동을 허용합니다.",
    ["tt_MoveStackButton"]            = "선택한 캐릭터의 이동 스택을 표시합니다.",
  --[[Control Labels]]
    ["Morph"]                         = "변신",
    ["ma_NPCKillButton"]              = "죽이기",
    ["ma_Respawn"]                    = "재생성",
    ["ma_NPCDistanceButton"]          = "거리",
    ["ma_NPCGUIDButton"]              = "GUID 표시",
    ["ma_NPCInfoButton"]              = "NPC 정보",
    ["ma_NPCDemorph"]                 = "변신 해제",
    ["ma_NPCMove"]                    = "NPC 이동",
    ["ma_NPCDel"]                     = "NPC 삭제",
    ["ma_getguid"]                    = "GUID 가져오기",
    ["ma_NPCAdd"]                     = "NPC 추가",
    ["ma_NPCGo"]                      = "NPC 이동",
    ["ma_NPCMorph"]                   = "변신",
    ["ma_NPCSay"]                     = "NPC 말하기",
    ["ma_NPCYell"]                    = "NPC 외치기",
    ["ma_NPCAura"]                    = "NPC 오라",
    ["ma_NPCUnAura"]                  = "NPC 오라 제거",
    ["ma_PlayEmote1"]                 = "감정 표현",
    ["ma_PlayEmote2"]                 = "감정 표현",
    ["ma_DistanceBox"]                = "거리",
    ["ma_NPCBindsight"]               = "시야 연결",
    ["ma_NPCUnBindsight"]             = "시야 연결 해제",
    ["ma_NPCComeToMe"]                = "나에게 오기",
    ["ma_npcpossess"]                 = "빙의",
    ["ma_npcunpossess"]               = "빙의 해제",
    ["ma_WayShow1"]                   = "경유지 표시",
    ["ma_WayShow0"]                   = "경유지 숨기기",
    ["ma_MoveStackButton"]            = "이동 표시",
    ["ma_NPCFreezeButton"]            = "NPC 정지",
    ["ma_WayAllDel"]                  = "NPC 정지 삭제",
    ["ma_WayMAdd"]                    = "경유지M추가",
    ["ma_NPCUnFreeze_RandomButton"]   = "무작위 이동",
    ["ma_NPCUnFreeze_WayButton"]      = "경유지 이동",
    ["ma_WayMDel"]                    = "경유지M삭제",
    ["ma_WayEndAdd"]                  = "경유지 끝 추가",
    ["ma_WayAdd"]                     = "경유지 추가",
    ["ma_WayShow"]                    = "경유지 표시",
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
    ["ma_NPCClearButton"]             = "지우기",
  --[[Other]]



--[[GObjects Tab]]
  --[[Name]]
    ["tabmenu_GO"]                    = "오브젝트",
    ["tt_GOButton"]                   = "게임 오브젝트 기능이 있는 창을 토글합니다.",
  --[[Tooltips]]
    ["tt_ObjGo"]                      = "선택한 오브젝트로 이동합니다",
    ["tt_ObjAdd"]                     = "대상 오브젝트의 복사본을 당신의 위치와 방향에 추가합니다",
    ["tt_ObjMove"]                    = "대상 오브젝트를 당신의 위치로 이동시킵니다",
    ["tt_ObjTurn"]                    = "대상 오브젝트를 당신의 방향과 일치하도록 회전시킵니다",
    ["tt_ObjDel"]                     = "대상 오브젝트를 삭제합니다",
    ["tt_ObjNear"]                    = "근처 오브젝트에 대한 정보를 반환합니다",
    ["tt_ObjTarget"]                  = "가장 가까운 오브젝트를 대상으로 지정하고 정보를 표시합니다",
    ["tt_ObjActivate"]                = "대상 오브젝트를 활성화합니다",
    ["tt_ObjAddTemp"]                 = "오브젝트의 임시 복사본을 추가합니다",
    ["tt_ObjInfo"]                    = "오브젝트에 대한 확장 정보를 가져옵니다",
    ["tt_ObjSetPhase"]                = "오브젝트의 위상을 설정합니다",
    ["tt_ObjShowModel"]               = "모델을 로드하고 표시합니다",
    ["tt_ObjUnloadModel"]             = "메모리를 확보하기 위해 모델을 언로드합니다",
    ["tt_ObjMoveForward"]             = "앞으로 이동",
    ["tt_ObjMoveBack"]                = "뒤로 이동",
    ["tt_ObjMoveLeft"]                = "왼쪽으로 이동",
    ["tt_ObjMoveRight"]               = "오른쪽으로 이동",
    ["tt_ObjMoveUp"]                  = "위로 이동",
    ["tt_ObjMoveDown"]                = "아래로 이동",
    ["tt_ObjSpawnHere"]               = "여기에 생성",
  --[[Control Labels]]
    ["ma_OBJGo"]                      = "오브젝트 이동",
    ["ma_OBJAdd"]                     = "오브젝트 추가",
    ["ma_OBJMove"]                    = "오브젝트 이동",
    ["ma_OBJTurn"]                    = "오브젝트 회전",
    ["ma_OBJDel"]                     = "오브젝트 삭제",
    ["ma_OBJNear"]                    = "근처 오브젝트",
    ["ma_OBJTarget"]                  = "오브젝트 대상",
    ["ma_OBJActivate"]                = "오브젝트 활성화",
    ["ma_OBJAddTemp"]                 = "임시 오브젝트 추가",
    ["ma_OBJInfo"]                    = "오브젝트 정보",
    ["ma_OBJSetPhase"]                = "오브젝트 위상",
    ["ma_GOGUIDLabel"]                = "GUID",
    ["ma_GOEntryIDLabel"]             = "EntryID",
    ["ma_GODisplayIDLabel"]           = "DisplayID",
    ["ma_GORangeLabel"]               = "범위",
    ["ma_GOAddOnMoveLabel"]           = "이동 시 추가",
    ["ma_GOMoveOnMoveLabel"]          = "이동 시 이동",
    ["ma_GOMoveDistancesLabel"]       = "이동 거리",
    ["ma_GOFwdBackLabel"]             = "앞/뒤:",
    ["ma_GOLeftRightLabel"]           = "왼쪽/오른쪽:",
    ["ma_GOUpDownLabel"]              = "위/아래:",
    ["ma_GORotateLeft"]               = "<<",
    ["ma_GORotateRight"]              = ">>",
    ["ma_GOZoomIn"]                   = "+",
    ["ma_GOZoomOut"]                  = "-",
    ["ma_GOMoveForward"]              = "앞",
    ["ma_GOMoveLeft"]                 = "왼쪽",
    ["ma_GOMoveRight"]                = "오른쪽",
    ["ma_GOMoveBack"]                 = "뒤",
    ["ma_GOSpawnHere"]                = "여기",
    ["ma_GOMoveUp"]                   = "위",
    ["ma_GOMoveDown"]                 = "아래",
    ["ma_GOShowButton"]               = "표시",
    ["ma_GOUnloadButton"]             = "언로드",
  --[[Other]]
    ["msg_account_lock_confirm"]      = "이 계정을 %s 하시겠습니까?",
    ["msg_acct_create_confirm"]       = "계정 '%s'을(를) 생성하시겠습니까?",
    ["msg_tele_del_confirm"]          = "텔레포트 위치 '%s'을(를) 삭제하시겠습니까?",



--[[Tele Tab]]
  --[[Name]]
    ["tabmenu_Tele"]                  = "순간이동",
    ["tt_TeleButton"]                 = "순간이동 기능이 있는 창을 토글합니다.",
  --[[Tooltips]]
  --[[Control Labels]]
    ["Zone"]                          = "|cFF00FF00지역:|r ",
    ["ma_ContinentSelection"]         = "대륙 선택",
    ["ma_EasternKingdomsN"]           = "동부 왕국 (북)",
    ["ma_EasternKingdomsS"]           = "동부 왕국 (남)",
    ["ma_Kalimdor"]                   = "칼림도어",
    ["ma_Outland"]                    = "아웃랜드",
    ["ma_NorthrendAlliance"]          = "노스렌드-얼라이언스",
    ["ma_NorthrendHorde"]             = "노스렌드-호드",
    ["ma_BattlegroundsArenas"]        = "전장/투기장",
    ["ma_InstancesEastern"]           = "인스턴스: 동부",
    ["ma_InstancesKalimdor"]          = "인스턴스: 칼림도어",
    ["ma_InstancesOutland"]           = "인스턴스: 아웃랜드",
    ["ma_InstancesNorthrend"]         = "인스턴스: 노스렌드",
    ["ma_Other"]                      = "기타",
    ["ma_ZoneSelection"]              = "지역 선택",
    ["ma_SelectedSubzone"]            = "선택된 하위 지역",
  --[[Other]]
    ["ma_NoZones"]                    = "지역 없음!",
    ["ma_NoSubZones"]                 = "하위 지역 없음!",



--[[Tickets Tab]]
  --[[Name]]
    ["tabmenu_ticket"]                = "티켓",
    ["tt_TicketButton"]               = "모든 티켓을 표시하고 관리할 수 있는 창을 토글합니다.",
  --[[Tooltips]]
    ["tt_TicketOn"]                   = "새 티켓을 알립니다.",
    ["tt_TicketOff"]                  = "새 티켓을 알리지 않습니다.",
    ["tt_ResetTickets"]               = "로드된 티켓을 초기화합니다",
    ["tt_LoadAllTickets"]             = "모든 티켓을 로드합니다",
    ["tt_LoadOnlineTickets"]          = "온라인 플레이어 티켓을 로드합니다",
    ["tt_DeleteTicket"]               = "티켓을 닫고 목록에서 제거합니다",
    ["tt_AnswerTicket"]               = "티켓에 답변합니다",
    ["tt_GetCharTicket"]              = "티켓 캐릭터를 소환합니다",
    ["tt_GoCharTicket"]               = "티켓 캐릭터에게 이동합니다",
    ["tt_WhisperTicket"]              = "티켓 캐릭터에게 귓속말합니다",
    ["tt_GoTicket"]                   = "티켓 위치로 이동합니다",
    ["tt_ShowTickets"]                = "로드된 티켓을 표시합니다",
  --[[Control Labels]]
    ["ma_ticketidlabel"]              = "|cFF00FF00티켓:",
    ["ma_ticketcreatedbylabel"]       = "|cFF00FF00작성자:",
    ["ma_tickettimecreatedlabel"]     = "|cFF00FF00작성됨:",
    ["ma_ticketlastchangelabel"]      = "|cFF00FF00마지막 변경:",
    ["ma_ticketmessagelabel"]         = "|cFF00FF00티켓 메시지:",
    ["ma_LoadTicketsButton"]          = "새로고침",
    ["ma_GetCharTicketButton"]        = "소환",
    ["ma_GoCharTicketButton"]         = "플레이어에게 이동",
    ["ma_AnswerButton"]               = "우편",
    ["ma_DeleteButton"]               = "닫기",
    ["ma_ticketwhisperbutton"]        = "귓속말",
    ["ma_TicketCount"]                = "|cFF00FF00티켓:|r ",
    ["ma_TicketsNoNew"]               = "새 티켓이 없습니다.",
    ["ma_TicketsNewNumber"]           = "|cffeda55f%s|r개의 새 티켓이 있습니다!",
    ["ma_TicketsGoLast"]              = "마지막 티켓 작성자(%s)에게 이동합니다.",
    ["ma_TicketsGetLast"]             = "%s를 당신에게 데려옵니다.",
    ["ma_TicketsInfoPlayer"]          = "|cFF00FF00플레이어:|r ",
    ["ma_TicketsInfoStatus"]          = "|cFF00FF00상태:|r ",
    ["ma_TicketsInfoAccount"]         = "|cFF00FF00계정:|r ",
    ["ma_TicketsInfoAccLevel"]        = "|cFF00FF00계정 레벨:|r ",
    ["ma_TicketsInfoLastIP"]          = "|cFF00FF00마지막 IP:|r ",
    ["ma_TicketsInfoPlayedTime"]      = "|cFF00FF00플레이 시간:|r ",
    ["ma_TicketsInfoLevel"]           = "|cFF00FF00레벨:|r ",
    ["ma_TicketsInfoMoney"]           = "|cFF00FF00골드:|r ",
    ["ma_TicketsInfoLatency"]         = "|cFF00FF00지연 시간:|r ",
    ["ma_TicketsNoInfo"]              = "사용 가능한 정보 없음",
    ["ma_TicketsNotLoaded"]           = "로드된 티켓 없음...",
    ["ma_TicketsNoTickets"]           = "사용 가능한 티켓 없음!",
    ["ma_TicketResetButton"]          = "초기화",
    ["ma_TicketLoadAllButton"]        = "모두 로드",
    ["ma_TicketLoadOnlineButton"]     = "온라인 로드",
    ["ma_TicketShowButton"]           = "표시",
    ["ma_TicketGoButton"]             = "티켓 이동",
    ["ma_TicketTicketLoaded"]         = "|cFF00FF00로드된 티켓 번호:|r %s\n\n플레이어 정보\n\n",
    ["ma_Reload"]                     = "새로고침",
    ["ma_LoadMore"]                   = "더 로드...",
  --[[Other]]



--[[Misc Tab]]
  --[[Name]]
    ["tabmenu_Misc"]                  = "기타",
    ["tt_MiscButton"]                 = "기타 작업이 있는 창을 토글합니다.",
  --[[Tooltips]]
    ["tt_FrmTrSlider"]                = "프레임 투명도 변경",
    ["tt_BtnTrSlider"]                = "버튼 투명도 변경",
    ["tt_windowismovable"]            = "이동 가능한 창 허용",
    ["tt_updatechanges"]              = "설정 변경 사항을 적용합니다. UI를 다시 로드합니다.",
    ["tt_UpdateFrequency"]            = "10000 = ~1분, 50000 = ~5분",
  --[[Control Labels]]
    ["cmd_toggle"]                    = "메인 창 토글",
    ["cmd_transparency"]              = "기본 투명도 토글 (0.5 또는 1.0)",
    ["cmd_tooltip"]                   = "버튼 툴팁 표시 여부 토글",
    ["ma_EnableTransparency"]         = "투명도 활성화",
    ["ma_EnableLocalizedSearch"]      = "지역화된 검색 문자열 활성화",
    ["ma_EnableMinimenu"]             = "미니메뉴/도구 모음 활성화",
    ["ma_EnableTooltips"]             = "툴팁 활성화",
    ["ma_ShowChatOutput"]             = "채팅 출력 표시",
    ["ma_ShowMinimapButton"]          = "미니맵 버튼 표시",
    ["ma_InstantTeleport"]            = "순간이동 전 경고 없음",
    ["ma_FrameStrataLabel"]           = "프레임 계층 레벨:",
    ["ma_FrameStrataBackground"]      = "배경",
    ["ma_FrameStrataLow"]             = "낮음",
    ["ma_FrameStrataMedium"]          = "중간 (기본값)",
    ["ma_FrameStrataHigh"]            = "높음",
    ["ma_FrameStrataDialog"]          = "대화 상자",
    ["ma_FrameStrataFullscreen"]      = "전체 화면",
    ["ma_FrameStrataFullscreenDialog"] = "전체 화면 대화 상자",
    ["ma_UpdateFrequencyLabel"]       = "차이 그래프 업데이트 빈도:",
    ["ma_BackgroundColorLabel"]       = "배경색",
    ["ma_FrameColorLabel"]            = "프레임색",
    ["ma_ButtonColorLabel"]           = "버튼색",
    ["ma_LinkifierColorLabel"]        = "MangLinkifier",
    ["ma_UpdateChangesButton"]        = "변경 사항 업데이트",
  --[[Other]]
    ["ma_ApplyWeatherButton"]         = "날씨 적용",
    ["ma_WeatherFine"]                = "맑음",
    ["ma_WeatherFog"]                 = "안개",
    ["ma_WeatherRain"]                = "비",
    ["ma_WeatherSnow"]                = "눈",
    ["ma_WeatherSand"]                = "모래바람",
    ["msg_transparency_saved"]        = "|cff00ff00AzerothAdmin:|r 투명도 설정이 저장되었습니다. 변경 사항 업데이트 또는 UI 다시 로드하여 적용하세요.",
    ["msg_localsearch_saved"]         = "|cff00ff00AzerothAdmin:|r 지역화된 검색 문자열 설정이 저장되었습니다. 변경 사항 업데이트 또는 UI 다시 로드하여 적용하세요.",
    ["msg_minimenu_saved"]            = "|cff00ff00AzerothAdmin:|r 미니메뉴 설정이 저장되었습니다.",
    ["msg_tooltip_saved"]             = "|cff00ff00AzerothAdmin:|r 툴팁 설정이 저장되었습니다. 변경 사항 업데이트 또는 UI 다시 로드하여 적용하세요.",
    ["msg_chatoutput_saved"]          = "|cff00ff00AzerothAdmin:|r 채팅 출력 설정이 저장되었습니다.",



--[[Server Tab]]
    ["tabmenu_server"]                = "서버",
    ["tt_ServerButton"]               = "여러 서버 정보를 표시하고 서버와 관련된 작업을 수행합니다.",
  --[[Tooltips]]
    ["tt_AnnounceButton"]             = "시스템 메시지를 알립니다.",
    ["tt_ShutdownButton"]             = "필드의 초 단위 시간 후에 서버를 종료하며, 생략하면 즉시 종료됩니다!",
    ["tt_CancelShutdownButton"]       = "서버 종료 카운트다운을 취소합니다.",
  --[[Control Labels]]
    ["ma_AnnounceButton"]             = "알림",
    ["ma_ShutdownButton"]             = "서버 종료",
    ["ma_CancelShutdownButton"]       = "종료 취소",
    ["ma_ReloadTableButton"]          = "테이블 다시 로드",
    ["ma_ReloadScriptsButton"]        = "스크립트 다시 로드",
    ["ma_UpdateButton"]               = "업데이트",
    ["ma_ServerLatencyLabel"]         = "|cFF00FF00^서버 지연 시간:|r",
    ["ma_UpdateDiffLabel"]            = "|cFF00FF00^업데이트 차이:|r",
    ["ma_MeanLabel"]                  = "|cFF00FF00평균:|r",
    ["ma_MedianLabel"]                = "|cFF00FF00중앙값:|r",
    ["ma_PercentilesLabel"]           = "|cFF00FF00백분위수:|r",
  --[[Other]]
    ["msg_shutdown_time_required"]    = "서버 종료를 사용하기 전에 초 단위로 시간을 입력하세요.",
    ["msg_shutdown_confirm"]          = "정말로 %s초 후에 서버를 종료하시겠습니까?",



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
    ["tt_ItemButton"]                 = "아이템을 검색하고 즐겨찾기를 관리하는 기능이 있는 팝업을 토글합니다.",
    ["tt_ItemSetButton"]              = "아이템 세트를 검색하고 즐겨찾기를 관리하는 기능이 있는 팝업을 토글합니다.",
    ["tt_SpellButton"]                = "주문을 검색하고 즐겨찾기를 관리하는 기능이 있는 팝업을 토글합니다.",
    ["tt_QuestButton"]                = "퀘스트를 검색하고 즐겨찾기를 관리하는 기능이 있는 팝업을 토글합니다.",
    ["tt_CreatureButton"]             = "생명체를 검색하고 즐겨찾기를 관리하는 기능이 있는 팝업을 토글합니다.",
    ["tt_ObjectButton"]               = "오브젝트를 검색하고 즐겨찾기를 관리하는 기능이 있는 팝업을 토글합니다.",
    ["tt_SearchDefault"]              = "이제 키워드를 입력하고 검색을 시작할 수 있습니다.",
    ["tt_SkillButton"]                = "기술을 검색하고 즐겨찾기를 관리하는 기능이 있는 팝업을 토글합니다.",
  --[[Labels]]
    ["ma_PopupErrorTab"]              = "오류",
    ["ma_PopupFavoritesTab"]          = "즐겨찾기",
    ["ma_PopupTab3"]                  = "탭 3",
    ["ma_PopupAmountLabel"]           = "수량:",
    ["ma_PopupInvisibleText"]         = "보이지 않음",
    ["ma_ItemButton"]                 = "아이템 검색",
    ["ma_ItemSetButton"]              = "아이템 세트 검색",
    ["ma_SpellButton"]                = "주문 검색",
    ["ma_QuestButton"]                = "퀘스트 검색",
    ["ma_CreatureButton"]             = "생명체 검색",
    ["ma_ObjectButton"]               = "오브젝트 검색",
    ["ma_TeleSearchButton"]           = "순간이동 검색",
    ["ma_MailRecipient"]              = "받는 사람",
    ["ma_Mail"]                       = "우편 보내기",
    ["ma_Send"]                       = "보내기",
    ["ma_MailSubject"]                = "제목",
    ["ma_MailYourMsg"]                = "여기에 메시지를 입력하세요!",
    ["ma_SearchButton"]               = "검색...",
    ["ma_ResetButton"]                = "초기화",
    ["ma_FavAdd"]                     = "선택 항목 추가",
    ["ma_FavRemove"]                  = "선택 항목 제거",
    ["ma_SelectAllButton"]            = "모두 선택",
    ["ma_DeselectAllButton"]          = "모두 선택 해제",
    ["ma_MailBytesLeft"]              = "남은 바이트: ",
    ["ma_SkillButton"]                = "기술 검색",
    ["ma_SkillVar1Button"]            = "기술",
    ["ma_SkillVar2Button"]            = "최대 기술",
    ["ma_ItemVar1Button"]             = "수량",
    ["ma_ObjectVar1Button"]           = "전리품 템플릿",
    ["ma_ObjectVar2Button"]           = "생성 시간",
    ["ma_NoFavorites"]                = "현재 저장된 즐겨찾기가 없습니다!",
    ["favoriteResults"]               = "|cFF00FF00즐겨찾기:|r ",



--[[Deprecated, but may be used again.]]
    ["ma_LearnAllButton"]             = "모든 주문",
    ["ma_LearnCraftsButton"]          = "모든 전문 기술 및 제조법",
    ["ma_LearnGMButton"]              = "기본 GM 주문",
    ["ma_LearnClassButton"]           = "모든 직업 주문",
    ["ma_GPSButton"]                  = "GPS",
    ["ma_Online"]                     = "온라인",
    ["ma_Offline"]                    = "오프라인",



--[[Linkifier]]
    ["lfer_Spawn"]                    = "생성",
    ["lfer_List"]                     = "목록",
    ["lfer_Reload"]                   = "다시 로드",
    ["lfer_Goto"]                     = "이동",
    ["lfer_Move"]                     = "이동",
    ["lfer_Turn"]                     = "회전",
    ["lfer_Delete"]                   = "삭제",
    ["lfer_Teleport"]                 = "순간이동",
    ["lfer_Morph"]                    = "변신",
    ["lfer_Add"]                      = "추가",
    ["lfer_Remove"]                   = "제거",
    ["lfer_Learn"]                    = "배우기",
    ["lfer_Unlearn"]                  = "배우기 취소",
    ["lfer_Error"]                    = "오류 검색 문자열이 일치했지만 오류가 발생했거나 유형을 찾을 수 없습니다"

}
  for k,v in pairs(translations) do L[k] = v end
end
