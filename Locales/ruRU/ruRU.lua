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
1. Edit the first un-commented line below, which should resemble: function Return_ruRU(). Change
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

local L = LibStub("AceLocale-3.0"):NewLocale("AzerothAdmin", "ruRU")
if L then
  local translations = {
--[[General]]
  --[[Tooltips]]
    ["tt_Default"]                    = "Наведите курсор на элемент, чтобы увидеть подсказку!",
    ["tt_LanguageButton"]             = "Перезагрузить AzerothAdmin и применить выбранный язык.",
    ["tt_RefreshButton"]              = "Обновить информацию о сервере.",
  --[[Control Labels]]
    ["ma_LanguageButton"]             = "Перезагрузить UI",
    ["ma_RefreshButton"]              = "Обновить",
    ["ma_TopText"]                    = "toptext, you should not see this!",
    ["ma_Top2Text"]                   = "toptext, you should not see this!",
    ["ma_InfoOnlineText"]             = "Игроков онлайн: ...",
    ["ma_InfoMaxOnlineText"]          = "Максимум онлайн: ...",
    ["ma_InfoUptimeText"]             = "Время работы сервера: ...",
    ["ma_InfoRevisionText"]           = "Ревизия AzerothCore: ...",
    ["info_revision"]                 = "|cFF00FF00Ревизия AzerothCore:|r ",
    ["info_platform"]                 = "|cFF00FF00Платформа сервера:|r ",
    ["info_online"]                   = "|cFF00FF00Игроков онлайн:|r ",
    ["info_maxonline"]                = "|cFF00FF00Максимум онлайн:|r ",
    ["info_uptime"]                   = "|cFF00FF00Время работы:|r ",
    ["ma_CloseWindow"]                = "X",
    ["tt_CloseWindow"]                = "Закрыть окно",
  --[[Other]]
    ["slashcmds"]                     = { "/AzerothAdmin", "/aa" },
    ["lang"]                          = "Русский",
    ["realm"]                         = "|cFF00FF00Реалм:|r "..GetCVar("realmName"),
    ["char"]                          = "|cFF00FF00Персонаж:|r "..UnitName("player"),
    ["guid"]                          = "|cFF00FF00Guid:|r ",
    ["tickets"]                       = "|cFF00FF00Тикеты:|r ",
    ["selectionerror1"]               = "Пожалуйста, выберите только себя, другого игрока или ничего!",
    ["selectionerror2"]               = "Пожалуйста, выберите только себя или ничего!",
    ["selectionerror3"]               = "Пожалуйста, выберите только другого игрока!",
    ["selectionerror4"]               = "Пожалуйста, выберите только NPC!",
    ["numbererror"]                   = "Значение должно быть числом!",
    ["searchResults"]                 = "|cFF00FF00Результаты поиска:|r ",
    ["ma_parameters"]                 = "Параметр(ы):", --Used on multiple tabs



--[[GM tab]]
  --[[Name]]
    ["tabmenu_Main"]                  = "GM",
  --[[Tooltips]]
    ["tt_MainButton"]                 = "Переключить главное окно AzerothAdmin.",
    ["tt_DisplayAccountLevel"]        = "Показать уровень вашего аккаунта",
    ["tt_GMOnButton"]                 = "Активировать GM-режим.",
    ["tt_GMOffButton"]                = "Деактивировать GM-режим.",
    ["tt_FlyOnButton"]                = "Активировать режим полета для выбранного персонажа.",
    ["tt_FlyOffButton"]               = "Деактивировать режим полета для выбранного персонажа.",
    ["tt_HoverOnButton"]              = "Активировать режим парения.",
    ["tt_HoverOffButton"]             = "Деактивировать режим парения.",
    ["tt_WhispOnButton"]              = "Принимать шепот от других игроков.",
    ["tt_WhispOffButton"]             = "Не принимать шепот от других игроков.",
    ["tt_InvisOnButton"]              = "Сделать вас невидимым.",
    ["tt_InvisOffButton"]             = "Сделать вас видимым.",
    ["tt_TaxiOnButton"]               = "Показать все маршруты такси выбранному игроку. Этот чит деактивируется при выходе.",
    ["tt_TaxiOffButton"]              = "Деактивировать чит такси и восстановить известные маршруты.",
    ["tt_ShowMapsButton"]             = "Открыть карты для выбранного персонажа.",
    ["tt_HideMapsButton"]             = "Скрыть карты для выбранного персонажа.",
    ["tt_SpeedSlider"]                = "Увеличить или уменьшить скорость выбранного персонажа.",
    ["tt_ScaleSlider"]                = "Увеличить или уменьшить размер выбранного персонажа.",
    ["tt_instakill"]                  = "Когда активно, клик по враждебному существу убивает его.",
    ["tt_ScreenButton"]               = "Сделать скриншот.",
    ["tt_BankButton"]                 = "Показать ваш банк.",
    ["tt_Dismount"]                   = "Спешиться, если вы верхом",
    ["tt_SetJail_A_Button"]           = "Установить местоположение тюрьмы Альянса в вашей текущей позиции.",
    ["tt_SetJail_H_Button"]           = "Установить местоположение тюрьмы Орды в вашей текущей позиции.",
    ["tt_N"]                          = "Навигация на север",
    ["tt_S"]                          = "Навигация на юг",
    ["tt_E"]                          = "Навигация на восток",
    ["tt_W"]                          = "Навигация на запад",
  --["tt_chatonbutton"]               = "Turn GM Chat ON",
  --["tt_chatoffbutton"]              = "Turn GM Chat OFF",
    ["tt_waterwalkonbutton"]          = "Включить хождение по воде для выбранного существа"  ,
    ["tt_watewrwalkoffbutton"]        = "Отключить хождение по воде для выбранного существа",
    ["tt_accountlockonbutton"]        = "Заблокировать ваш аккаунт",
    ["tt_accountlockoffbutton"]       = "Разблокировать ваш аккаунт",
    ["tt_DisplayAccountLvl"]          = "Показать уровень вашего аккаунта.",
    ["tt_SpeedSliderReset"]           = "Сбросить скорость на 1.0",
    ["tt_ScaleSliderReset"]           = "Сбросить размер на 1.0",
    ["tt_gmnotifybutton"]             = "Отправить сообщение $message всем GM онлайн [[Параметры: $message]]",
    ["tt_gmingamebutton"]             = "Показать GM, которые в игре.",
    ["tt_gmlistbutton"]               = "Показать GM аккаунты на этом сервере",
    ["tt_petcreatebutton"]            = "Сделать выбранное ЖИВОТНОЕ вашим питомцем.",
    ["tt_petlearnbutton"]             = "Обучить вашего питомца заклинанию [[Параметр: #SPELLID]]",
    ["tt_petunlearnbutton"]           = "Разучить заклинание вашего питомца [[Параметр: #SPELLID]]",
    ["tt_pettpbutton"]                = "Изменить очки тренировки питомца [[Параметр: #points]]",
    ["tt_lookuptaxibutton"]           = "Найти узел такси [[Параметр: $Areanamepart]]",
    ["tt_gotaxinodebutton"]           = "Телепортироваться к узлу такси [[Параметр: #taxinode]]",
    ["tt_gotriggerbutton"]            = "Телепортироваться к триггеру области [[Параметр: #trigger_id]]",
    ["tt_goxybutton"]                 = "Телепортироваться к координатам на уровне земли/воды на MapID. Если MapID опущен, текущая карта [[Параметры: #x #y [#mapid]]]",
    ["tt_goxyzbutton"]                = "Телепортироваться к координатам на уровне #z на MapID. Если MapID опущен, текущая карта [[Параметры: #x #y #z [#mapid]]]",
    ["tt_gozonexybutton"]             = "Телепортироваться к координатам на уровне земли/воды в ZoneID. Если ZoneID опущен, текущая зона [[Параметры: #x #y [#zoneid]]]",
    ["tt_lookupzonebutton"]           = "Найти зону. [[Параметры: $Areanamepart]]",
    ["tt_castbutton"]                 = "Сотворить заклинание. [[Параметры: #SpellID]]",
    ["tt_castbackbutton"]             = "Выбранное существо сотворит заклинание [SpellID] на ВАС. [[Параметры: #SpellID]]",
    ["tt_castdistbutton"]             = "Вы сотворяете заклинание [SpellID] на расстоянии [#Dist]. [[Параметры: #SpellID #Dist]]",
    ["tt_castselfbutton"]             = "Выбранное существо сотворит заклинание [SpellID] на себя. [[Параметры: #SpellID]]",
    ["tt_casttargetbutton"]           = "Выбранное существо сотворит заклинание [SpellID] на свою цель. [[Параметры: #SpellID]]",
    ["tt_gmclearbutton"]              = "Очистить поле параметров.",
    ["tt_listitembutton"]             = "Список всех вхождений [#itemID]. [[Параметры: #ItemID]]",
    ["tt_acctcreatebutton"]           = "Создать аккаунт игрока [[Параметры: $accountname $password]]",
    ["tt_acctdeletebutton"]           = "Удалить аккаунт игрока и всех персонажей [[Параметры: $accountname]]",
    ["tt_acctaddonbutton"]            = "Установить $account для использования #addon(0=WoW, 1=TBC, 2=WotLK) [[Параметры: $accountname #addon]]",
    ["tt_acctgmlvlbutton"]            = "Установить $account уровень #gmlevel (0=Игрок, 1=Помощник, 2=Ассистент, 3=GM, 4=Админ) [[Параметры: $accountname #gmlevel]]",
    ["tt_acctpasswdbutton"]           = "Установить $account пароль $password [[Параметры: $accountname $password $password]]",
  --[[Control Labels]]
    ["ma_OffButton"]                  = "Выкл",
    ["ma_displaylevelbutton"]         = "Показать уровень аккаунта",
    ["ma_GMOnButton"]                 = "GM-режим вкл",
    ["ma_FlyOnButton"]                = "Полет вкл",
    ["ma_HoverOnButton"]              = "Парение вкл",
    ["ma_WhisperOnButton"]            = "Шепот вкл",
    ["ma_InvisOnButton"]              = "Невидимость вкл",
    ["ma_TaxiOnButton"]               = "Чит Такси вкл",
    ["ma_ShowMapsButton"]             = "Показать карты",
    ["ma_HideMapsButton"]             = "Скрыть карты",
    ["ma_instakill"]                  = "Мгновенное убийство существ",
    ["ma_ScreenshotButton"]           = "Скриншот",
    ["ma_BankButton"]                 = "Банк",
    ["ma_DismountButton"]             = "Спешиться",
    ["ma_SetJail_A_Button"]           = "Установить тюрьму А",
    ["ma_SetJail_H_Button"]           = "Установить тюрьму О",
    ["gridnavigator"]                 = "Сетка-навигатор",
    ["N"]                             = "С", --Abbreviation for North
    ["S"]                             = "Ю", --Abbreviation for South
    ["E"]                             = "В", --Abbreviation for East
    ["W"]                             = "З", --Abbreviation for West
    ["ma_chatbutton"]                 = "GM Чат вкл",
    ["ma_mapsbutton"]                 = "Просмотр всех карт",
    ["ma_waterwalkbutton"]            = "Хождение по воде вкл",
    ["ma_accountlockbutton"]          = "Блокировка аккаунта",
    ["ma_gmnotify"]                   = "GM Уведомление",
    ["ma_gmingame"]                   = "GM в игре",
    ["ma_gmlist"]                     = "Список GM",
    ["ma_petcreate"]                  = "Создать питомца",
    ["ma_petlearn"]                   = "Обучить питомца",
    ["ma_petunlearn"]                 = "Разучить питомца",
    ["ma_pettp"]                      = "ОТ питомца",
    ["ma_lookuptaxi"]                 = "Найти такси",
    ["ma_gotaxinode"]                 = "К узлу такси",
    ["ma_gotrigger"]                  = "К триггеру",
    ["ma_goxy"]                       = "К XY",
    ["ma_goxyz"]                      = "К XYZ",
    ["ma_gozonexy"]                   = "К зоне XY",
    ["ma_lookupzone"]                 = "Найти зону",
    ["ma_cast"]                       = "Применить",
    ["ma_castback"]                   = "Применить назад",
    ["ma_castdist"]                   = "Применить на расст",
    ["ma_castself"]                   = "Применить на себя",
    ["ma_casttarget"]                 = "Применить на цель",
    ["ma_listitem"]                   = "Список предметов",
    ["ma_GmClear"]                    = "Очистить парам",
    ["ma_acctcreate"]                 = "Создать акк",
    ["ma_acctdelete"]                 = "Удалить акк",
    ["ma_acctaddon"]                  = "Аддон акк",
    ["ma_acctgmlvl"]                  = "GMУровень акк",
    ["ma_acctpasswd"]                 = "Пароль акк",
    ["ma_MiniMenuGM"]                 = "Gm",
    ["ma_MiniMenuChar"]               = "Пр",
    ["ma_MiniMenuNPC"]                = "Np",
    ["ma_MiniMenuGO"]                 = "GO",
    ["ma_MiniMenuTele"]               = "Тп",
    ["ma_MiniMenuTicket"]             = "Тк",
    ["ma_MiniMenuMisc"]               = "Рз",
    ["ma_MiniMenuServer"]             = "Св",
    ["ma_MiniMenuLog"]                = "Лг",
    ["ma_MiniMenuRevive"]             = "ВОСКРЕСИТЬ!",
  --[[Other]]



--[[Char Tab]]
  --[[Name]]
    ["tabmenu_Char"]                  = "ПЕРСОНАЖ",
    ["tt_CharButton"]                 = "Переключить окно с действиями для персонажа.",
  --[[Tooltips]]
    ["tt_RotateLeft"]                 = "Повернуть влево.",
    ["tt_RotateRight"]                = "Повернуть вправо.",
    ["tt_killbutton"]                 = "Убить выбранное существо/игрока",
    ["tt_reviveplayer"]               = "Воскресить выбранного игрока",
    ["tt_saveplayer"]                 = "Сохранить персонажа выбранного игрока",
    ["tt_KickButton"]                 = "Выгнать выбранного игрока с сервера.",
    ["tt_CooldownButton"]             = "Удалить/истечь все откаты заклинаний выбранного персонажа.",
    ["tt_GUIDButton"]                 = "Показать GUID выбранного персонажа.",
    ["tt_PinfoButton"]                = "Получить информацию о выбранном ИГРОКЕ.",
    ["tt_DistanceButton"]             = "Получить расстояние до выбранного существа.",
    ["tt_RecallButton"]               = "Вернуть выбранное существо в позицию до последнего телепорта.",
    ["tt_DemorphButton"]              = "Удалить любые морфы с выбранного персонажа.",
    ["tt_ShowMapsCharButton"]         = "Открыть карты для выбранного персонажа.",
    ["tt_HideMapsCharButton"]         = "Скрыть карты для выбранного персонажа.",
    ["tt_learnlangbutton"]            = "Изучить выбранные заклинания",
    ["tt_modifybutton"]               = "Изменить выбранный атрибут на введенное количество",
    ["tt_resetbutton"]                = "Сбросить выбранный атрибут",
    ["tt_modelzoominbutton"]          = "Увеличить выбранную модель",
    ["tt_modelzoomoutbutton"]         = "Уменьшить выбранную модель",
    ["tt_charbindsight"]              = "Привязать ваше зрение к выбранному юниту",
    ["tt_charunbindsight"]            = "Отвязать ваше зрение от выбранного юнита",
    ["tt_charrename"]                 = "Переключить выбранного персонажа для переименования при следующем входе",
    ["tt_charcustomize"]              = "Переключить выбранного персонажа для кастомизации при следующем входе",
    ["tt_charchangerace"]             = "Переключить выбранного персонажа для смены расы при следующем входе",
    ["tt_charchnagefaction"]          = "Переключить выбранного персонажа для смены фракции при следующем входе",
    ["tt_charcombatstop"]             = "Остановить бой для выбранного персонажа (или для себя)",
    ["tt_charmaxskill"]               = "Установить навыки выбранного персонажа на максимум для уровня",
    ["tt_charfreeze"]                 = "Заморозить целевого игрока и отключить его чат",
    ["tt_charunfreeze"]               = "Разморозить выбранного игрока и восстановить чат",
    ["tt_charlistdeleted"]            = "Список удаленных персонажей в окне чата",
    ["tt_chardeletedrestore"]         = "Параметры= #guid|$name [$newname] [#new account] [[Эта команда в разработке]",
    ["tt_charpossess"]                = "Вечно контролировать выбранное существо",
    ["tt_charunpossess"]              = "Прекратить контроль выбранного существа",
    ["tt_charrecall"]                 = "Вернуть выбранного игрока в последнюю позицию телепорта",
    ["tt_charrepair"]                 = "Отремонтировать броню и оружие выбранного игрока",
    ["tt_banbutton"]                  = "Параметры= <account|ip|character> $NameOrIp <-1|xxdyyhzzm> $reason   [[Забанить акк/IP и выкинуть. -1=перманентный бан, или строка типа 4d3h24m16s]]",
    ["tt_gonamebutton"]               = "Параметр= $charactername  [[Телепортирует вас к указанному персонажу]]",
    ["tt_createguildbutton"]          = "Параметры= $GuildLeaderName $GuildName  [[Создает гильдию с именем $GuildName, с лидером $GuildLeaderName]]",
    ["tt_teleaddbutton"]              = "Параметр= $Name  [[Добавляет местоположение телепорта .tele для вашей текущей позиции с именем $Name]]",
    ["tt_baninfobutton"]              = "Параметр= <account|ip|character>  [[Посмотреть детальную информацию о банах указанного аккаунта/ip/персонажа]]",
    ["tt_groupgobutton"]              = "Параметр= $charactername   [[Телепортирует указанного персонажа и его/её группу к вашей позиции]]",
    ["tt_guildinvitebutton"]          = "Параметры= $charactername $guildname   [[Добавляет $charactername в гильдию $guildname]]",
    ["tt_teledelbutton"]              = "Параметр= $telename  [[Удаляет местоположение с именем $telename из списка .tele]]",
    ["tt_banlistbutton"]              = "Параметры= <account|ip> $NameOrIp   [[Ищет и возвращает определенные баны, соответствующие параметрам]]",
    ["tt_namegobutton"]               = "Параметр= $charactername   [[Телепортирует указанного персонажа к вашей позиции]]",
    ["tt_guildrankbutton"]            = "Параметры= $charactername #ranknumber   [[Устанавливает указанному персонажу указанный ранг в его/её гильдии]]",
    ["tt_telegroupbutton"]            = "Параметр= $telename  [[Телепортирует **выбранного** персонажа и его/её группу в .tele местоположение с именем $telename]]",
    ["tt_unbanbutton"]                = "Параметры= <account|ip|character> $NameOrIp  [[Разбанивает указанный акк/IP/персонажа]]",
    ["tt_guilddeletebutton"]          = "Параметр= $guildname  [[Удаляет указанную гильдию]]",
    ["tt_guilduninvitebutton"]        = "Параметр= $charactername  [[Выгоняет указанного персонажа из его/её гильдии]]",
    ["tt_telenamebutton"]             = "Параметры= $charactername $telename  [[Телепортирует $charactername к $telename]]",
    ["tt_mutebutton"]                 = "Параметры= $charactername #minutes  [[Отключает чат для всего аккаунта $charactername на #minutes минут]]",
    ["tt_charmorphbutton"]            = "Параметры = #DisplayID [[Введите DisplayID морфа, который хотите применить]]",
    ["tt_charaurabutton"]             = "Параметры = #AuraID [[Введите AuraID ауры, которую хотите применить]]",
    ["tt_charunaurabutton"]           = "Параметры = #AuraID [[Введите AuraID ауры, которую хотите удалить]]",
    ["tt_JailAButton"]                = "Параметр= $charactername [[Отправляет персонажа, чье имя в этом поле, в тюрьму Альянса]]",
    ["tt_JailHButton"]                = "Параметр= $charactername [[Отправляет персонажа, чье имя в этом поле, в тюрьму Орды]]",
    ["tt_UnJailButton"]               = "Параметр= $charactername [[Освобождает персонажа, чье имя в этом поле, из тюрьмы.]]",
    ["tt_UnMuteButton"]               = "Размутить $player.",
    ["tt_QuestAddButton"]             = "Добавляет #questid **выбранному** игроку.",
    ["tt_QuestCompleteButton"]        = "Отмечает #questid как выполненный для **выбранного** игрока.",
    ["tt_QuestRemoveButton"]          = "Удаляет #questid у **выбранного** игрока.",
    ["tt_DamageButton"]               = "Параметр= #amount урона для применения к **выбранному** существу/игроку",
    ["tt_HideAreaButton"]             = "Скрывает #areaid от **выбранного** игрока.",
    ["tt_ShowAreaButton"]             = "Показывает #areaid **выбранному** игроку.",
    ["tt_HonorAddButton"]             = "Добавляет #honorpoints **выбранному** игроку.",
    ["tt_HonorUpdateButton"]          = "Параметр не требуется. Сохраняет честь для **выбранного** игрока.",
  --[[Control Labels]]
    ["ma_KillButton"]                 = "Убить",
    ["ma_ReviveButton"]               = "Воскресить",
    ["ma_SaveButton"]                 = "Сохранить",
    ["ma_KickButton"]                 = "Выгнать",
    ["ma_CooldownButton"]             = "Откаты",
    ["ma_GUIDButton"]                 = "Показать GUID",
    ["ma_PinfoButton"]                = "Инфо ИГРОКА",
    ["ma_DistanceButton"]             = "Расстояние",
    ["ma_RecallButton"]               = "Вернуть",
    ["ma_DemorphButton"]              = "Убрать морф",
    ["ma_ShowMapsCharButton"]         = "Показать карты",
    ["ma_HideMapsCharButton"]         = "Скрыть карты",
    ["ma_LearnLangButton"]            = "Все языки",
    ["ma_Learn"]                      = "Изучить",
    ["ma_Modify"]                     = "Изменить",
    ["ma_Reset"]                      = "Сбросить",
    ["ma_CharBindsight"]              = "Привязать зрение",
    ["ma_CharUnBindsight"]            = "Отвязать зрение",
    ["ma_charrename"]                 = "Переименовать",
    ["ma_charcustomize"]              = "Кастомизация",
    ["ma_charchangerace"]             = "Смена расы",
    ["ma_charchnagefaction"]          = "Смена фракции",
    ["ma_charcombatstop"]             = "Стоп бой",
    ["ma_charmaxskill"]               = "Макс навык",
    ["ma_charfreeze"]                 = "Заморозить",
    ["ma_charunfreeze"]               = "Разморозить",
    ["ma_charlistdeleted"]            = "Список удал.",
    ["ma_chardeletedrestore"]         = "Восстановить",
    ["ma_charpossess"]                = "Контроль",
    ["ma_charunpossess"]              = "Снять контроль",
    ["ma_charrecall"]                 = "Вернуть",
    ["ma_charrepair"]                 = "Ремонт",
    ["ma_banbutton"]                  = "Бан",
    ["ma_gonamebutton"]               = "Явиться",
    ["ma_createguildbutton"]          = "Создать Г",
    ["ma_teleaddbutton"]              = "Добавить Тп",
    ["ma_baninfobutton"]              = "Инфо бана",
    ["ma_groupgobutton"]              = "Призвать группу",
    ["ma_guildinvitebutton"]          = "Пригласить Г",
    ["ma_teledelbutton"]              = "Удалить Тп",
    ["ma_banlistbutton"]              = "Список банов",
    ["ma_namegobutton"]               = "Призвать",
    ["ma_guildrankbutton"]            = "Ранг Г",
    ["ma_telegroupbutton"]            = "Тп группу",
    ["ma_unbanbutton"]                = "Разбанить",
    ["ma_guilddeletebutton"]          = "Удалить Г",
    ["ma_guilduninvitebutton"]        = "Выгнать из Г",
    ["ma_telenamebutton"]             = "Тп по имени",
    ["ma_mutebutton"]                 = "Мут",
    ["ma_Aura"]                       = "Аура",
    ["ma_UnAura"]                     = "Убрать ауру",
    ["ma_Morph"]                      = "Морф",
    ["ma_JailAButton"]                = "Тюрьма (А)",
    ["ma_JailHButton"]                = "Тюрьма (О)",
    ["ma_UnJailButton"]               = "Освободить",
    ["ma_UnMuteButton"]               = "Размутить",
    ["ma_QuestAddButton"]             = "Добавить квест",
    ["ma_QuestCompleteButton"]        = "Завершить квест",
    ["ma_QuestRemoveButton"]          = "Удалить квест",
    ["ma_DamageButton"]               = "Урон",
    ["ma_HideAreaButton"]             = "Скрыть зону",
    ["ma_ShowAreaButton"]             = "Показать зону",
    ["ma_HonorAddButton"]             = "Добавить честь",
    ["ma_HonorUpdateButton"]          = "Обновить честь",
    ["ma_CharRotateLeft"]             = "<<=",
    ["ma_CharRotateRight"]            = "=>>",
    ["ma_CharZoomIn"]                 = "+",
    ["ma_CharZoomOut"]                = "-",
  --[[Other]]
    ["ma_LevelUp"]                    = "Повысить уровень",
    ["ma_LevelDown"]                  = "Понизить уровень",
    ["ma_Money"]                      = "Деньги",
    ["ma_Energy"]                     = "Энергия",
    ["ma_Rage"]                       = "Ярость",
    ["ma_Mana"]                       = "Мана",
    ["ma_Healthpoints"]               = "Здоровье",
    ["ma_Talents"]                    = "Таланты",
    ["ma_Stats"]                      = "Характеристики",
    ["ma_Spells"]                     = "Заклинания",
    ["ma_Honor"]                      = "Честь",
    ["ma_Level"]                      = "Уровень",
    ["ma_AllLang"]                    = "Все языки",
    ["ma_AllGMSpells"]                = "Все GM заклинания",
    ["ma_AllCrafts"]                  = "Все профессии",
    ["ma_AllDefault"]                 = "Все базовые",
    ["ma_AllMyClass"]                 = "Все моего класса",
    ["ma_AllMyPetTalents"]            = "Все таланты питомца",
    ["ma_AllMySpells"]                = "Все мои заклинания",
    ["ma_AllMyTalents"]               = "Все мои таланты",
    ["ma_AllRecipesAlchemy"]          = "Все рецепты (Алхимия)",
    ["ma_AllRecipesBlacksmithing"]    = "Все рецепты (Кузнечное дело)",
    ["ma_AllRecipesCooking"]          = "Все рецепты (Кулинария)",
    ["ma_AllRecipesEnchanting"]       = "Все рецепты (Наложение чар)",
    ["ma_AllRecipesEngineering"]      = "Все рецепты (Инженерное дело)",
    ["ma_AllRecipesFirstAid"]         = "Все рецепты (Первая помощь)",
    ["ma_AllRecipesInscription"]      = "Все рецепты (Начертание)",
    ["ma_AllRecipesJewelcrafting"]    = "Все рецепты (Ювелирное дело)",
    ["ma_AllRecipesLeatherworking"]   = "Все рецепты (Кожевничество)",
    ["ma_AllRecipesTailoring"]        = "Все рецепты (Портняжное дело)",
    ["ma_resetallspells"]             = "Заклинания для ВСЕХ",
    ["ma_resetalltalents"]            = "Таланты для ВСЕХ",
    ["ma_achievements"]               = "Достижения",
    ["ma_AllSpeeds"]                  = "Все скорости",
    ["ma_Arena"]                      = "Арена",
    ["ma_BackWalk"]                   = "Ходьба назад",
    ["ma_Drunk"]                      = "Пьяный",
    ["ma_FlySpeed"]                   = "Скорость полета",
    ["ma_Gender"]                     = "Пол",
    ["ma_MountSpeed"]                 = "Скорость маунта",
    ["ma_Phase"]                      = "Фаза",
    ["ma_RunicPower"]                 = "Сила рун",
    ["ma_Speed"]                      = "Скорость",
    ["ma_StandState"]                 = "Состояние позы",
    ["ma_SwimSpeed"]                  = "Скорость плавания",
    ["ma_TalentPoints"]               = "Очки талантов",
    -- languages
    ["Common"]                        = "Всеобщий",
    ["Orcish"]                        = "Орочий",
    ["Taurahe"]                       = "Таурахе",
    ["Darnassian"]                    = "Дарнасский",
    ["Dwarvish"]                      = "Дварфийский",
    ["Thalassian"]                    = "Талассийский",
    ["Demonic"]                       = "Демонический",
    ["Draconic"]                      = "Драконий",
    ["Titan"]                         = "Титанский",
    ["Kalimag"]                       = "Калимаг",
    ["Gnomish"]                       = "Гномий",
    ["Troll"]                         = "Троллий",
    ["Gutterspeak"]                   = "Наречие Проклятых",
    ["Draenei"]                       = "Дренейский",



--[[NPC Tab]]
  --[[Name]]
    ["tabmenu_NPC"]                   = "NPC",
    ["tt_NpcButton"]                  = "Переключить окно с функциями для NPC.",
  --[[Tooltips]]
    ["tt_NPCRotateLeft"]              = "Повернуть влево",
    ["tt_NPCRotateRight"]             = "Повернуть вправо",
    ["tt_NPCKillButton"]              = "Убивает выбранную цель",
    ["tt_npcrespawn"]                 = "Возродить выбранное существо, или если не выбрано, все ближайшие существа",
    ["tt_NPCDistanceButton"]          = "Получить расстояние до выбранного существа.",
    ["tt_NPCGUIDButton"]              = "Показать GUID выбранного персонажа.",
    ["tt_NPCInfoButton"]              = "Получить информацию о выбранном NPC.",
    ["tt_NPCDemorph"]                 = "Убрать морф с выбранного NPC",
    ["tt_NPCMove"]                    = "Переместить выбранное существо к вашей позиции",
    ["tt_NPCDel"]                     = "Удаляет выбранное существо",
    ["tt_getguid"]                    = "Получает GUID и ID выбранного существа",
    ["tt_NPCClear"]                   = "Очистить все поля информации NPC (GUID, NPC ID, Display ID, Расстояние)",
    ["tt_NPCAdd"]                     = "Добавляет копию этого NPC в вашей текущей позиции.",
    ["tt_NPCGo"]                      = "Телепортирует вас к NPC в поле GUID",
    ["tt_NPCMorph"]                   = "Параметры = #DisplayID [[Введите DisplayID морфа, который хотите применить]]",
    ["tt_NPCSay"]                     = "Заставить выбранного npc сказать [параметры]",
    ["tt_NPCYell"]                    = "Заставить выбранного npc крикнуть [параметры]",
    ["tt_NPCAura"]                    = "Параметры = #AuraID [[Введите AuraID ауры, которую хотите применить]]",
    ["tt_NPCUnaura"]                  = "Параметры = #AuraID [[Введите AuraID ауры, которую хотите удалить]]",
    ["tt_PlayEmote"]                  = "Воспроизвести эмоцию из списка слева",
    ["tt_GPSButton"]                  = "Показывает координаты выбранного персонажа.",
    ["tt_DisplayUp"]                  = "Увеличить DisplayID NPC на 1",
    ["tt_DisplayDown"]                = "Уменьшить DisplayID NPC на 1",
    ["tt_IDUp"]                       = "Увеличить ID NPC на 1",
    ["tt_IDDown"]                     = "Уменьшить ID NPC на 1",
    ["tt_npcmodelzoominbutton"]       = "Увеличить выбранную модель",
    ["tt_npcmodelzoomoutbutton"]      = "Уменьшить выбранную модель",
    ["tt_npcbindsight"]               = "Привязать ваше зрение к выбранному NPC",
    ["tt_npcunbindsight"]             = "Отвязать ваше зрение от выбранного NPC",
    ["tt_npccometome"]                = "Заставляет выбранного NPC придти к вашей позиции. Позиция НЕ сохраняется в БД.",
    ["tt_npcpossess"]                 = "Вечно контролировать выбранное существо",
    ["tt_npcunpossess"]               = "Прекратить контроль выбранного существа",
    ["tt_NPCFreezeButton"]            = "Останавливает движение выбранного NPC, сохраняя путевые точки",
    ["tt_NPCFreezeDelButton"]         = "Останавливает движение выбранного NPC, НЕ сохраняя путевые точки",
    ["tt_WayEndAdd"]                  = "Добавляет путевую точку в конец существующего стека",
    ["tt_NPCAddWay"]                  = "Добавляет путевую точку в стек. GUID существа должен быть в поле ниже",
    ["tt_WayMAdd"]                    = "Добавляет путевую точку в существующий стек движения выбранного существа",
    ["tt_WayModifyDel"]               = "Удаляет выбранную путевую точку из существующего стека движения существа",
    ["tt_WayShow0"]                   = "Прекратить показывать путевые точки для выбранного существа.",
    ["tt_WayShow1"]                   = "Показать путевые точки для выбранного существа.",
    ["tt_NPCAdd_WayShowOn"]           = "показывает путевые точки для выбранного существа",
    ["tt_NPCUnFreeze_RandomButton"]   = "Разрешает случайное движение выбранного NPC.",
    ["tt_NPCUnFreeze_WayButton"]      = "Разрешает движение по путевым точкам выбранного NPC.",
    ["tt_MoveStackButton"]            = "Показывает стек движения выбранного персонажа.",
  --[[Control Labels]]
    ["Morph"]                         = "Морф",
    ["ma_NPCKillButton"]              = "Убить",
    ["ma_Respawn"]                    = "Возродить",
    ["ma_NPCDistanceButton"]          = "Расстояние",
    ["ma_NPCGUIDButton"]              = "Показать GUID",
    ["ma_NPCInfoButton"]              = "Инфо NPC",
    ["ma_NPCDemorph"]                 = "Убрать морф",
    ["ma_NPCMove"]                    = "Переместить NPC",
    ["ma_NPCDel"]                     = "Удалить NPC",
    ["ma_getguid"]                    = "Получить GUID",
    ["ma_NPCAdd"]                     = "Добавить NPC",
    ["ma_NPCGo"]                      = "К NPC",
    ["ma_NPCMorph"]                   = "Морф",
    ["ma_NPCSay"]                     = "NPC Сказать",
    ["ma_NPCYell"]                    = "NPC Крикнуть",
    ["ma_NPCAura"]                    = "NPC Аура",
    ["ma_NPCUnAura"]                  = "NPC Убрать ауру",
    ["ma_PlayEmote1"]                 = "Эмоция",
    ["ma_PlayEmote2"]                 = "Эмоция",
    ["ma_DistanceBox"]                = "Расстояние",
    ["ma_NPCBindsight"]               = "Привязать зрение",
    ["ma_NPCUnBindsight"]             = "Отвязать зрение",
    ["ma_NPCComeToMe"]                = "Ко мне",
    ["ma_npcpossess"]                 = "Контроль",
    ["ma_npcunpossess"]               = "Снять контроль",
    ["ma_WayShow1"]                   = "Показ путей вкл",
    ["ma_WayShow0"]                   = "Показ путей выкл",
    ["ma_MoveStackButton"]            = "Показать движения",
    ["ma_NPCFreezeButton"]            = "NPC Стой",
    ["ma_WayAllDel"]                  = "NPC Стой удал",
    ["ma_WayMAdd"]                    = "Добавить путь",
    ["ma_NPCUnFreeze_RandomButton"]   = "Дв случайное",
    ["ma_NPCUnFreeze_WayButton"]      = "Дв путевые",
    ["ma_WayMDel"]                    = "Удалить путь",
    ["ma_WayEndAdd"]                  = "Конец пути",
    ["ma_WayAdd"]                     = "Доб путь",
    ["ma_WayShow"]                    = "Показ пути",
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
    ["ma_NPCClearButton"]             = "Очистить",
  --[[Other]]



--[[GObjects Tab]]
  --[[Name]]
    ["tabmenu_GO"]                    = "ОБЪЕКТЫ",
    ["tt_GOButton"]                   = "Переключить окно с функциями для объектов.",
  --[[Tooltips]]
    ["tt_ObjGo"]                      = "Перейти к выбранному объекту",
    ["tt_ObjAdd"]                     = "Добавить копию целевого объекта в вашей позиции и ориентации",
    ["tt_ObjMove"]                    = "Переместить целевой объект к вашей позиции",
    ["tt_ObjTurn"]                    = "Повернуть целевой объект в соответствии с вашей ориентацией",
    ["tt_ObjDel"]                     = "Удаляет целевой объект",
    ["tt_ObjNear"]                    = "Возвращает информацию об объектах рядом с вами",
    ["tt_ObjTarget"]                  = "Выбирает ближайший объект и показывает информацию",
    ["tt_ObjActivate"]                = "Активирует целевой объект",
    ["tt_ObjAddTemp"]                 = "Добавляет временную копию объекта",
    ["tt_ObjInfo"]                    = "Получает расширенную информацию об объекте",
    ["tt_ObjSetPhase"]                = "Устанавливает фазу объекта",
    ["tt_ObjShowModel"]               = "Загрузить и показать модель",
    ["tt_ObjUnloadModel"]             = "Выгрузить модели для освобождения памяти",
    ["tt_ObjMoveForward"]             = "Переместить вперед",
    ["tt_ObjMoveBack"]                = "Переместить назад",
    ["tt_ObjMoveLeft"]                = "Переместить влево",
    ["tt_ObjMoveRight"]               = "Переместить вправо",
    ["tt_ObjMoveUp"]                  = "Переместить вверх",
    ["tt_ObjMoveDown"]                = "Переместить вниз",
    ["tt_ObjSpawnHere"]               = "Создать здесь",
  --[[Control Labels]]
    ["ma_OBJGo"]                      = "К объекту",
    ["ma_OBJAdd"]                     = "Добавить объект",
    ["ma_OBJMove"]                    = "Перем объект",
    ["ma_OBJTurn"]                    = "Повернуть объект",
    ["ma_OBJDel"]                     = "Удалить объект",
    ["ma_OBJNear"]                    = "Объекты рядом",
    ["ma_OBJTarget"]                  = "Цель объект",
    ["ma_OBJActivate"]                = "Активировать",
    ["ma_OBJAddTemp"]                 = "Добавить врем",
    ["ma_OBJInfo"]                    = "Инфо объект",
    ["ma_OBJSetPhase"]                = "Фаза объект",
    ["ma_GOGUIDLabel"]                = "GUID",
    ["ma_GOEntryIDLabel"]             = "EntryID",
    ["ma_GODisplayIDLabel"]           = "DisplayID",
    ["ma_GORangeLabel"]               = "Дальность",
    ["ma_GOAddOnMoveLabel"]           = "Добавить при движении",
    ["ma_GOMoveOnMoveLabel"]          = "Перем при движении",
    ["ma_GOMoveDistancesLabel"]       = "Расстояния движения",
    ["ma_GOFwdBackLabel"]             = "Вперед/Назад:",
    ["ma_GOLeftRightLabel"]           = "Влево/Вправо:",
    ["ma_GOUpDownLabel"]              = "Вверх/Вниз:",
    ["ma_GORotateLeft"]               = "<<",
    ["ma_GORotateRight"]              = ">>",
    ["ma_GOZoomIn"]                   = "+",
    ["ma_GOZoomOut"]                  = "-",
    ["ma_GOMoveForward"]              = "ВПЕРЕД",
    ["ma_GOMoveLeft"]                 = "ВЛЕВО",
    ["ma_GOMoveRight"]                = "ВПРАВО",
    ["ma_GOMoveBack"]                 = "НАЗАД",
    ["ma_GOSpawnHere"]                = "ЗДЕСЬ",
    ["ma_GOMoveUp"]                   = "ВВЕРХ",
    ["ma_GOMoveDown"]                 = "ВНИЗ",
    ["ma_GOShowButton"]               = "Показать",
    ["ma_GOUnloadButton"]             = "Выгрузить",
  --[[Other]]
    ["msg_toggle_maps_confirm"]       = "Вы уверены, что хотите переключить все карты? Это может заморозить клиент на несколько секунд.",
    ["msg_account_lock_confirm"]      = "Вы уверены, что хотите %s эту учетную запись?",
    ["msg_acct_create_confirm"]       = "Вы уверены, что хотите создать учетную запись '%s'?",
    ["msg_acct_delete_confirm"]       = "Вы уверены, что хотите УДАЛИТЬ учетную запись '%s'?",
    ["msg_tele_del_confirm"]          = "Вы уверены, что хотите удалить место телепортации '%s'?",



--[[Tele Tab]]
  --[[Name]]
    ["tabmenu_Tele"]                  = "ТЕЛЕПОРТ",
    ["tt_TeleButton"]                 = "Переключить окно с функциями телепортации.",
  --[[Tooltips]]
  --[[Control Labels]]
    ["Zone"]                          = "|cFF00FF00Зона:|r ",
    ["ma_ContinentSelection"]         = "Выбор континента",
    ["ma_EasternKingdomsN"]           = "Восточные королевства (С)",
    ["ma_EasternKingdomsS"]           = "Восточные королевства (Ю)",
    ["ma_Kalimdor"]                   = "Калимдор",
    ["ma_Outland"]                    = "Запределье",
    ["ma_NorthrendAlliance"]          = "Нордскол-Альянс",
    ["ma_NorthrendHorde"]             = "Нордскол-Орда",
    ["ma_BattlegroundsArenas"]        = "Поля боя/Арены",
    ["ma_InstancesEastern"]           = "Подземелья: Восточные",
    ["ma_InstancesKalimdor"]          = "Подземелья: Калимдор",
    ["ma_InstancesOutland"]           = "Подземелья: Запределье",
    ["ma_InstancesNorthrend"]         = "Подземелья: Нордскол",
    ["ma_Other"]                      = "Другое",
    ["ma_ZoneSelection"]              = "Выбор зоны",
    ["ma_SelectedSubzone"]            = "Выбранная подзона",
  --[[Other]]
    ["ma_NoZones"]                    = "Нет зон!",
    ["ma_NoSubZones"]                 = "Нет подзон!",



--[[Tickets Tab]]
  --[[Name]]
    ["tabmenu_ticket"]                = "ТИКЕТЫ",
    ["tt_TicketButton"]               = "Переключить окно, которое показывает все тикеты и позволяет управлять ими.",
  --[[Tooltips]]
    ["tt_TicketOn"]                   = "Объявлять о новых тикетах.",
    ["tt_TicketOff"]                  = "Не объявлять о новых тикетах.",
    ["tt_ResetTickets"]               = "Сбросить загруженные тикеты",
    ["tt_LoadAllTickets"]             = "Загрузить все тикеты",
    ["tt_LoadOnlineTickets"]          = "Загрузить тикеты игроков онлайн",
    ["tt_DeleteTicket"]               = "Удалить тикет",
    ["tt_AnswerTicket"]               = "Ответить на тикет",
    ["tt_GetCharTicket"]              = "Призвать персонажа тикета",
    ["tt_GoCharTicket"]               = "Перейти к персонажу тикета",
    ["tt_WhisperTicket"]              = "Шепнуть персонажу тикета",
    ["tt_GoTicket"]                   = "Перейти к местоположению тикета",
    ["tt_ShowTickets"]                = "Показать загруженные тикеты",
  --[[Control Labels]]
    ["ma_ticketidlabel"]              = "|cFF00FF00Тикет:",
    ["ma_ticketcreatedbylabel"]       = "|cFF00FF00Создан:",
    ["ma_tickettimecreatedlabel"]     = "|cFF00FF00Время создания:",
    ["ma_ticketlastchangelabel"]      = "|cFF00FF00Последнее изменение:",
    ["ma_ticketmessagelabel"]         = "|cFF00FF00Сообщение тикета:",
    ["ma_LoadTicketsButton"]          = "Обновить",
    ["ma_GetCharTicketButton"]        = "Призвать",
    ["ma_GoCharTicketButton"]         = "К игроку",
    ["ma_AnswerButton"]               = "Почта",
    ["ma_DeleteButton"]               = "Закрыть",
    ["ma_ticketwhisperbutton"]        = "Шепот",
    ["ma_TicketCount"]                = "|cFF00FF00Тикеты:|r ",
    ["ma_TicketsNoNew"]               = "У вас нет новых тикетов.",
    ["ma_TicketsNewNumber"]           = "У вас |cffeda55f%s|r новых тикетов!",
    ["ma_TicketsGoLast"]              = "Перейти к последнему создателю тикета (%s).",
    ["ma_TicketsGetLast"]             = "Привести %s к вам.",
    ["ma_TicketsInfoPlayer"]          = "|cFF00FF00Игрок:|r ",
    ["ma_TicketsInfoStatus"]          = "|cFF00FF00Статус:|r ",
    ["ma_TicketsInfoAccount"]         = "|cFF00FF00Аккаунт:|r ",
    ["ma_TicketsInfoAccLevel"]        = "|cFF00FF00Уровень аккаунта:|r ",
    ["ma_TicketsInfoLastIP"]          = "|cFF00FF00Последний IP:|r ",
    ["ma_TicketsInfoPlayedTime"]      = "|cFF00FF00Время игры:|r ",
    ["ma_TicketsInfoLevel"]           = "|cFF00FF00Уровень:|r ",
    ["ma_TicketsInfoMoney"]           = "|cFF00FF00Деньги:|r ",
    ["ma_TicketsInfoLatency"]         = "|cFF00FF00Задержка:|r ",
    ["ma_TicketsNoInfo"]              = "Информация недоступна",
    ["ma_TicketsNotLoaded"]           = "Тикет не загружен...",
    ["ma_TicketsNoTickets"]           = "Нет доступных тикетов!",
    ["ma_TicketResetButton"]          = "СБРОС",
    ["ma_TicketLoadAllButton"]        = "Загрузить все",
    ["ma_TicketLoadOnlineButton"]     = "Загрузить онлайн",
    ["ma_TicketShowButton"]           = "ПОКАЗАТЬ",
    ["ma_TicketGoButton"]             = "К тикету",
    ["ma_TicketTicketLoaded"]         = "|cFF00FF00Загружен тикет №:|r %s\n\nИнформация об игроке\n\n",
    ["ma_Reload"]                     = "Перезагрузить",
    ["ma_LoadMore"]                   = "Загрузить еще...",
  --[[Other]]



--[[Misc Tab]]
  --[[Name]]
    ["tabmenu_Misc"]                  = "РАЗНОЕ",
    ["tt_MiscButton"]                 = "Переключить окно с различными действиями.",
  --[[Tooltips]]
    ["tt_FrmTrSlider"]                = "Изменить прозрачность фрейма",
    ["tt_BtnTrSlider"]                = "Изменить прозрачность кнопок",
    ["tt_windowismovable"]            = "Разрешить перемещаемое окно",
    ["tt_updatechanges"]              = "Применить изменения настроек. Перезагружает UI.",
  --[[Control Labels]]
    ["cmd_toggle"]                    = "Переключить главное окно",
    ["cmd_transparency"]              = "Переключить базовую прозрачность (0.5 или 1.0)",
    ["cmd_tooltip"]                   = "Переключить показ подсказок кнопок",
    ["ma_EnableTransparency"]         = "Включить прозрачность",
    ["ma_EnableLocalizedSearch"]      = "Включить локализованные строки поиска",
    ["ma_EnableMinimenu"]             = "Включить минименю/панель",
    ["ma_EnableTooltips"]             = "Включить подсказки",
    ["ma_ShowChatOutput"]             = "Показывать вывод чата",
    ["ma_FrameStrataLabel"]           = "Уровень слоя фрейма:",
    ["ma_FrameStrataBackground"]      = "Фон",
    ["ma_FrameStrataLow"]             = "Низкий",
    ["ma_FrameStrataMedium"]          = "Средний (По умолчанию)",
    ["ma_FrameStrataHigh"]            = "Высокий",
    ["ma_FrameStrataDialog"]          = "Диалог",
    ["ma_FrameStrataFullscreen"]      = "Полный экран",
    ["ma_FrameStrataFullscreenDialog"] = "Диалог полного экрана",
    ["ma_UpdateFrequencyLabel"]       = "Указывает частоту обновления графика Diff на вкладке Сервер.\n10000 = ~1 минута, 50000 = ~5 минут",
    ["ma_BackgroundColorLabel"]       = "Цвет фона",
    ["ma_FrameColorLabel"]            = "Цвет фрейма",
    ["ma_ButtonColorLabel"]           = "Цвет кнопок",
    ["ma_LinkifierColorLabel"]        = "MangLinkifier",
    ["ma_UpdateChangesButton"]        = "Обновить изменения",
  --[[Other]]
    ["ma_ApplyWeatherButton"]         = "Применить погоду",
    ["ma_WeatherFine"]                = "Ясно",
    ["ma_WeatherFog"]                 = "Туман",
    ["ma_WeatherRain"]                = "Дождь",
    ["ma_WeatherSnow"]                = "Снег",
    ["ma_WeatherSand"]                = "Песок",
    ["msg_transparency_saved"]        = "|cff00ff00AzerothAdmin:|r Настройка прозрачности сохранена. Обновите изменения или перезагрузите UI для применения.",
    ["msg_localsearch_saved"]         = "|cff00ff00AzerothAdmin:|r Настройка локализованных строк поиска сохранена. Обновите изменения или перезагрузите UI для применения.",
    ["msg_minimenu_saved"]            = "|cff00ff00AzerothAdmin:|r Настройка минименю сохранена.",
    ["msg_tooltip_saved"]             = "|cff00ff00AzerothAdmin:|r Настройка подсказок сохранена. Обновите изменения или перезагрузите UI для применения.",
    ["msg_chatoutput_saved"]          = "|cff00ff00AzerothAdmin:|r Настройка вывода чата сохранена.",



--[[Server Tab]]
    ["tabmenu_server"]                = "СЕРВЕР",
    ["tt_ServerButton"]               = "Показать информацию о сервере и выполнить действия с сервером.",
  --[[Tooltips]]
    ["tt_AnnounceButton"]             = "Объявить системное сообщение.",
    ["tt_ShutdownButton"]             = "Выключить сервер через указанное количество секунд, если пропущено - выключить немедленно!",
    ["tt_CancelShutdownButton"]       = "Отменить обратный отсчет выключения сервера.",
  --[[Control Labels]]
    ["ma_AnnounceButton"]             = "Объявление",
    ["ma_ShutdownButton"]             = "Выключить сервер",
    ["ma_CancelShutdownButton"]       = "Отменить выключение",
    ["ma_ReloadTableButton"]          = "Перезагрузить таблицу",
    ["ma_ReloadScriptsButton"]        = "Перезагрузить скрипты",
    ["ma_ServerLatencyLabel"]         = "|cFF00FF00^Задержка сервера:|r",
    ["ma_UpdateDiffLabel"]            = "|cFF00FF00^Разница обновления:|r",
    ["ma_MeanLabel"]                  = "|cFF00FF00Среднее:|r",
    ["ma_MedianLabel"]                = "|cFF00FF00Медиана:|r",
    ["ma_PercentilesLabel"]           = "|cFF00FF00Процентили:|r",
  --[[Other]]
    ["msg_shutdown_time_required"]    = "Пожалуйста, введите время в секундах перед использованием выключения сервера.",
    ["msg_shutdown_confirm"]          = "Вы уверены, что хотите выключить сервер через %s секунд?",



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
    ["tt_ItemButton"]                 = "Переключить всплывающее окно с функцией поиска предметов и управления избранным.",
    ["tt_ItemSetButton"]              = "Переключить всплывающее окно с функцией поиска наборов предметов и управления избранным.",
    ["tt_SpellButton"]                = "Переключить всплывающее окно с функцией поиска заклинаний и управления избранным.",
    ["tt_QuestButton"]                = "Переключить всплывающее окно с функцией поиска квестов и управления избранным.",
    ["tt_CreatureButton"]             = "Переключить всплывающее окно с функцией поиска существ и управления избранным.",
    ["tt_ObjectButton"]               = "Переключить всплывающее окно с функцией поиска объектов и управления избранным.",
    ["tt_SearchDefault"]              = "Теперь вы можете ввести ключевое слово и начать поиск.",
    ["tt_SkillButton"]                = "Переключить всплывающее окно с функцией поиска навыков и управления избранным.",
  --[[Labels]]
    ["ma_PopupErrorTab"]              = "ОШИБКА",
    ["ma_PopupFavoritesTab"]          = "Избранное",
    ["ma_PopupTab3"]                  = "Вкладка 3",
    ["ma_PopupAmountLabel"]           = "Количество:",
    ["ma_PopupInvisibleText"]         = "Невидимый",
    ["ma_ItemButton"]                 = "Поиск предмета",
    ["ma_ItemSetButton"]              = "Поиск набора",
    ["ma_SpellButton"]                = "Поиск заклинания",
    ["ma_QuestButton"]                = "Поиск квеста",
    ["ma_CreatureButton"]             = "Поиск существа",
    ["ma_ObjectButton"]               = "Поиск объекта",
    ["ma_TeleSearchButton"]           = "Поиск телепорта",
    ["ma_MailRecipient"]              = "Получатель",
    ["ma_Mail"]                       = "Отправить почту",
    ["ma_Send"]                       = "Отправить",
    ["ma_MailSubject"]                = "Тема",
    ["ma_MailYourMsg"]                = "Здесь ваше сообщение!",
    ["ma_SearchButton"]               = "Поиск...",
    ["ma_ResetButton"]                = "Сброс",
    ["ma_FavAdd"]                     = "Добавить выбранное",
    ["ma_FavRemove"]                  = "Удалить выбранное",
    ["ma_SelectAllButton"]            = "Выбрать все",
    ["ma_DeselectAllButton"]          = "Снять все",
    ["ma_MailBytesLeft"]              = "Осталось байт: ",
    ["ma_SkillButton"]                = "Поиск навыка",
    ["ma_SkillVar1Button"]            = "Навык",
    ["ma_SkillVar2Button"]            = "Макс навык",
    ["ma_ItemVar1Button"]             = "Количество",
    ["ma_ObjectVar1Button"]           = "Шаблон добычи",
    ["ma_ObjectVar2Button"]           = "Время появления",
    ["ma_NoFavorites"]                = "В данный момент нет сохраненного избранного!",
    ["favoriteResults"]               = "|cFF00FF00Избранное:|r ",



--[[Deprecated, but may be used again.]]
    ["ma_LearnAllButton"]             = "Все заклинания",
    ["ma_LearnCraftsButton"]          = "Все профессии и рецепты",
    ["ma_LearnGMButton"]              = "Базовые GM заклинания",
    ["ma_LearnClassButton"]           = "Все заклинания класса",
    ["ma_GPSButton"]                  = "GPS",
    ["ma_Online"]                     = "Онлайн",
    ["ma_Offline"]                    = "Оффлайн",



--[[Linkifier]]
    ["lfer_Spawn"]                    = "Создать",
    ["lfer_List"]                     = "Список",
    ["lfer_Reload"]                   = "Перезагрузить",
    ["lfer_Goto"]                     = "Перейти",
    ["lfer_Move"]                     = "Переместить",
    ["lfer_Turn"]                     = "Повернуть",
    ["lfer_Delete"]                   = "Удалить",
    ["lfer_Teleport"]                 = "Телепорт",
    ["lfer_Morph"]                    = "Морф",
    ["lfer_Add"]                      = "Добавить",
    ["lfer_Remove"]                   = "Удалить",
    ["lfer_Learn"]                    = "Изучить",
    ["lfer_Unlearn"]                  = "Разучить",
    ["lfer_Error"]                    = "Ошибка: строка поиска совпала, но произошла ошибка или не удается найти тип"

}
  for k,v in pairs(translations) do L[k] = v end
end
