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

local L = LibStub("AceLocale-3.0"):NewLocale("AzerothAdmin", "ptPT")
if L then
  local translations = {
--[[General]]
  --[[Tooltips]]
    ["tt_Default"]                    = "Mova o cursor sobre um elemento para alternar a dica!",
    ["tt_LanguageButton"]             = "Recarregar AzerothAdmin e aplicar idioma selecionado.",
    ["tt_RefreshButton"]              = "Atualizar informações do servidor.",
  --[[Control Labels]]
    ["ma_LanguageButton"]             = "Recarregar UI",
    ["ma_RefreshButton"]              = "Atualizar",
    ["ma_TopText"]                    = "toptext, you should not see this!",
    ["ma_Top2Text"]                   = "toptext, you should not see this!",
    ["ma_InfoOnlineText"]             = "Jogadores Online: ...",
    ["ma_InfoMaxOnlineText"]          = "Máximo Online: ...",
    ["ma_InfoUptimeText"]             = "Tempo Ativo do Servidor: ...",
    ["ma_InfoRevisionText"]           = "Revisão AzerothCore: ...",
    ["info_revision"]                 = "|cFF00FF00Revisão AzerothCore:|r ",
    ["info_platform"]                 = "|cFF00FF00Plataforma do Servidor:|r ",
    ["info_online"]                   = "|cFF00FF00Jogadores Online:|r ",
    ["info_maxonline"]                = "|cFF00FF00Máximo Online:|r ",
    ["info_uptime"]                   = "|cFF00FF00Tempo Ativo:|r ",
    ["ma_CloseWindow"]                = "X",
    ["tt_CloseWindow"]                = "Fechar Janela",
  --[[Other]]
    ["slashcmds"]                     = { "/AzerothAdmin", "/aa" },
    ["lang"]                          = "Português",
    ["realm"]                         = "|cFF00FF00Reino:|r "..GetCVar("realmName"),
    ["char"]                          = "|cFF00FF00Personagem:|r "..UnitName("player"),
    ["guid"]                          = "|cFF00FF00Guid:|r ",
    ["tickets"]                       = "|cFF00FF00Tickets:|r ",
    ["selectionerror1"]               = "Por favor selecione apenas você mesmo, outro jogador ou nada!",
    ["selectionerror2"]               = "Por favor selecione apenas você mesmo ou nada!",
    ["selectionerror3"]               = "Por favor selecione apenas outro jogador!",
    ["selectionerror4"]               = "Por favor selecione apenas um NPC!",
    ["numbererror"]                   = "O valor deve ser um número!",
    ["searchResults"]                 = "|cFF00FF00Resultados da Pesquisa:|r ",
    ["ma_parameters"]                 = "Parâmetro(s):", --Used on multiple tabs



--[[GM tab]]
  --[[Name]]
    ["tabmenu_Main"]                  = "GM",
  --[[Tooltips]]
    ["tt_MainButton"]                 = "Alternar janela principal do AzerothAdmin.",
    ["tt_DisplayAccountLevel"]        = "Mostrar o nível da sua conta",
    ["tt_GMOnButton"]                 = "Ativar o modo-GM.",
    ["tt_GMOffButton"]                = "Desativar o modo-GM.",
    ["tt_FlyOnButton"]                = "Ativar o modo-Voo para o personagem selecionado.",
    ["tt_FlyOffButton"]               = "Desativar o modo-Voo para o personagem selecionado.",
    ["tt_HoverOnButton"]              = "Ativar o modo-Flutuar.",
    ["tt_HoverOffButton"]             = "Desativar o modo-Flutuar.",
    ["tt_WhispOnButton"]              = "Aceitar sussurros de outros jogadores.",
    ["tt_WhispOffButton"]             = "Não aceitar sussurros de outros jogadores.",
    ["tt_InvisOnButton"]              = "Tornar-se invisível.",
    ["tt_InvisOffButton"]             = "Tornar-se visível.",
    ["tt_TaxiOnButton"]               = "Mostrar todas as rotas de táxi ao jogador selecionado. Esta batota será desativada ao desconectar.",
    ["tt_TaxiOffButton"]              = "Desativar a batota de táxi e restaurar as rotas conhecidas do jogador.",
    ["tt_ShowMapsButton"]             = "Revelar mapas para o personagem selecionado.",
    ["tt_HideMapsButton"]             = "Ocultar mapas para o personagem selecionado.",
    ["tt_SpeedSlider"]                = "Aumentar ou diminuir a velocidade do personagem selecionado.",
    ["tt_ScaleSlider"]                = "Aumentar ou diminuir a escala do personagem selecionado.",
    ["tt_instakill"]                  = "Quando marcado, clicar numa criatura inimiga mata-a.",
    ["tt_ScreenButton"]               = "Fazer uma captura de ecrã.",
    ["tt_BankButton"]                 = "Mostrar o seu banco.",
    ["tt_Dismount"]                   = "Desmonta-o, se estiver montado",
    ["tt_SetJail_A_Button"]           = "Define a localização da Prisão da Aliança para a sua localização atual.",
    ["tt_SetJail_H_Button"]           = "Define a localização da Prisão da Horda para a sua localização atual.",
    ["tt_N"]                          = "Navegar Norte",
    ["tt_S"]                          = "Navegar Sul",
    ["tt_E"]                          = "Navegar Este",
    ["tt_W"]                          = "Navegar Oeste",
  --["tt_chatonbutton"]               = "Turn GM Chat ON",
  --["tt_chatoffbutton"]              = "Turn GM Chat OFF",
    ["tt_waterwalkonbutton"]          = "Ativar Caminhar sobre Água para a criatura selecionada"  ,
    ["tt_watewrwalkoffbutton"]        = "Desativar Caminhar sobre Água para a criatura selecionada",
    ["tt_accountlockonbutton"]        = "Bloquear a sua conta",
    ["tt_accountlockoffbutton"]       = "Desbloquear a sua conta",
    ["tt_DisplayAccountLvl"]          = "Mostrar o nível da sua conta.",
    ["tt_SpeedSliderReset"]           = "Repor Velocidade para 1.0",
    ["tt_ScaleSliderReset"]           = "Repor Escala para 1.0",
    ["tt_gmnotifybutton"]             = "Envia mensagem $message a todos os GMs online [[Parâmetros: $message]]",
    ["tt_gmingamebutton"]             = "Mostra os GMs que estão conectados.",
    ["tt_gmlistbutton"]               = "Mostra as contas GM neste servidor",
    ["tt_petcreatebutton"]            = "Torna o ANIMAL selecionado o seu animal de estimação.",
    ["tt_petlearnbutton"]             = "Ensina um feitiço ao seu animal de estimação [[Parâmetro: #SPELLID]]",
    ["tt_petunlearnbutton"]           = "Remove um feitiço do seu animal de estimação [[Parâmetro: #SPELLID]]",
    ["tt_pettpbutton"]                = "Modifica os pontos de treino do animal de estimação [[Parâmetro: #points]]",
    ["tt_lookuptaxibutton"]           = "Procurar um TaxiNode [[Parâmetro: $Areanamepart]]",
    ["tt_gotaxinodebutton"]           = "Teletransporta para o TaxiNode indicado [[Parâmetro: #taxinode]]",
    ["tt_gotriggerbutton"]            = "Teletransporta para o acionador de área indicado [[Parâmetro: #trigger_id]]",
    ["tt_goxybutton"]                 = "Teletransporta para as coordenadas indicadas ao nível do solo/água no MapID. Se MapID omitido, mapa atual [[Parâmetros: #x #y [#mapid]]]",
    ["tt_goxyzbutton"]                = "Teletransporta para as coordenadas indicadas ao nível #z no MapID. Se MapID omitido, mapa atual [[Parâmetros: #x #y #z [#mapid]]]",
    ["tt_gozonexybutton"]             = "Teletransporta para as coordenadas indicadas ao nível do solo/água no ZoneID. Se ZoneID omitido, zona atual [[Parâmetros: #x #y [#zoneid]]]",
    ["tt_lookupzonebutton"]           = "Procurar uma Zona. [[Parâmetros: $Areanamepart]]",
    ["tt_castbutton"]                 = "Lançar um feitiço. [[Parâmetros: #SpellID]]",
    ["tt_castbackbutton"]             = "A criatura selecionada lançará o feitiço [SpellID] em SI. [[Parâmetros: #SpellID]]",
    ["tt_castdistbutton"]             = "Lança um feitiço [SpellID] à distância [#Dist]. [[Parâmetros: #SpellID #Dist]]",
    ["tt_castselfbutton"]             = "A criatura selecionada lança o feitiço [SpellID] em si mesma. [[Parâmetros: #SpellID]]",
    ["tt_casttargetbutton"]           = "A criatura selecionada lança o feitiço [SpellID] no seu alvo. [[Parâmetros: #SpellID]]",
    ["tt_gmclearbutton"]              = "Limpa a caixa de parâmetros.",
    ["tt_listitembutton"]             = "Lista todas as ocorrências de [#itemID]. [[Parâmetros: #ItemID]]",
    ["tt_acctcreatebutton"]           = "Cria uma conta de jogador [[Parâmetros: $accountname $password]]",
    ["tt_acctdeletebutton"]           = "Elimina uma conta de jogador e todos os personagens [[Parâmetros: $accountname]]",
    ["tt_acctaddonbutton"]            = "Define $account para usar #addon(0=WoW, 1=TBC, 2=WotLK) [[Parâmetros: $accountname #addon]]",
    ["tt_acctgmlvlbutton"]            = "Define $account para #gmlevel (0=Jogador, 1=Ajudante, 2=Assistente, 3=GM, 4=Admin) [[Parâmetros: $accountname #gmlevel]]",
    ["tt_acctpasswdbutton"]           = "Define $account $password [[Parâmetros: $accountname $password $password]]",
  --[[Control Labels]]
    ["ma_OffButton"]                  = "Desativar",
    ["ma_displaylevelbutton"]         = "Mostrar Nível de Conta",
    ["ma_GMOnButton"]                 = "Modo-GM ativo",
    ["ma_FlyOnButton"]                = "Modo-Voo ativo",
    ["ma_HoverOnButton"]              = "Modo-Flutuar ativo",
    ["ma_WhisperOnButton"]            = "Sussurros ativos",
    ["ma_InvisOnButton"]              = "Invisibilidade ativa",
    ["ma_TaxiOnButton"]               = "Batota Táxi ativa",
    ["ma_ShowMapsButton"]             = "Mostrar Mapas",
    ["ma_HideMapsButton"]             = "Ocultar Mapas",
    ["ma_instakill"]                  = "Matar criaturas instantaneamente",
    ["ma_ScreenshotButton"]           = "Captura de Ecrã",
    ["ma_BankButton"]                 = "Banco",
    ["ma_DismountButton"]             = "Desmontar",
    ["ma_SetJail_A_Button"]           = "DefPrisão A",
    ["ma_SetJail_H_Button"]           = "DefPrisão H",
    ["gridnavigator"]                 = "Navegador de Grelha",
    ["N"]                             = "N", --Abbreviation for North
    ["S"]                             = "S", --Abbreviation for South
    ["E"]                             = "E", --Abbreviation for East
    ["W"]                             = "W", --Abbreviation for West
    ["ma_chatbutton"]                 = "Chat GM Ativo",
    ["ma_mapsbutton"]                 = "Ver Todos os Mapas",
    ["ma_waterwalkbutton"]            = "Caminhar Água Ativo",
    ["ma_accountlockbutton"]          = "Bloquear Conta",
    ["ma_gmnotify"]                   = "Notificar GM",
    ["ma_gmingame"]                   = "GMs NoJogo",
    ["ma_gmlist"]                     = "Lista GM",
    ["ma_petcreate"]                  = "Criar Animal",
    ["ma_petlearn"]                   = "Aprender Animal",
    ["ma_petunlearn"]                 = "Desaprender Animal",
    ["ma_pettp"]                      = "TP Animal",
    ["ma_lookuptaxi"]                 = "Procurar Táxi",
    ["ma_gotaxinode"]                 = "Ir TaxiNode",
    ["ma_gotrigger"]                  = "Ir Acionador",
    ["ma_goxy"]                       = "Ir XY",
    ["ma_goxyz"]                      = "Ir XYZ",
    ["ma_gozonexy"]                   = "Ir ZonaXY",
    ["ma_lookupzone"]                 = "Procurar Zona",
    ["ma_cast"]                       = "Lançar",
    ["ma_castback"]                   = "Lançar Retorno",
    ["ma_castdist"]                   = "Lançar Dist",
    ["ma_castself"]                   = "Lançar Próprio",
    ["ma_casttarget"]                 = "Lançar Alvo",
    ["ma_listitem"]                   = "Listar Item",
    ["ma_GmClear"]                    = "Limpar Params",
    ["ma_acctcreate"]                 = "Criar Conta",
    ["ma_acctdelete"]                 = "Eliminar Conta",
    ["ma_acctaddon"]                  = "Addon Conta",
    ["ma_acctgmlvl"]                  = "NívelGM Conta",
    ["ma_acctpasswd"]                 = "Senha Conta",
    ["ma_MiniMenuGM"]                 = "Gm",
    ["ma_MiniMenuChar"]               = "Cr",
    ["ma_MiniMenuNPC"]                = "Np",
    ["ma_MiniMenuGO"]                 = "GO",
    ["ma_MiniMenuTele"]               = "Te",
    ["ma_MiniMenuTicket"]             = "Ti",
    ["ma_MiniMenuMisc"]               = "Mi",
    ["ma_MiniMenuServer"]             = "Se",
    ["ma_MiniMenuLog"]                = "Lo",
    ["ma_MiniMenuRevive"]             = "REVIVER!",
  --[[Other]]



--[[Char Tab]]
  --[[Name]]
    ["tabmenu_Char"]                  = "CHAR",
    ["tt_CharButton"]                 = "Alternar janela com ações específicas de personagem.",
  --[[Tooltips]]
    ["tt_RotateLeft"]                 = "Rodar à esquerda.",
    ["tt_RotateRight"]                = "Rodar à direita.",
    ["tt_killbutton"]                 = "Mata a criatura/jogador selecionado",
    ["tt_reviveplayer"]               = "Revive o jogador selecionado",
    ["tt_saveplayer"]                 = "Guarda o personagem do jogador selecionado",
    ["tt_KickButton"]                 = "Expulsar o jogador selecionado do servidor.",
    ["tt_CooldownButton"]             = "Remove/expira todos os tempos de espera de feitiços no personagem selecionado.",
    ["tt_GUIDButton"]                 = "Mostra o GUID do personagem selecionado.",
    ["tt_PinfoButton"]                = "Obter informações sobre o JOGADOR selecionado.",
    ["tt_DistanceButton"]             = "Obter distância à criatura selecionada.",
    ["tt_RecallButton"]               = "Retorna a criatura selecionada à localização antes do último teletransporte.",
    ["tt_DemorphButton"]              = "Remove quaisquer transformações no personagem selecionado.",
    ["tt_ShowMapsCharButton"]         = "Revela mapas para o personagem selecionado.",
    ["tt_HideMapsCharButton"]         = "Oculta mapas para o personagem selecionado.",
    ["tt_learnlangbutton"]            = "Aprender feitiços selecionados",
    ["tt_modifybutton"]               = "Modificar o atributo selecionado pela quantidade introduzida",
    ["tt_resetbutton"]                = "Repor o atributo selecionado",
    ["tt_modelzoominbutton"]          = "Aproximar o modelo selecionado",
    ["tt_modelzoomoutbutton"]         = "Afastar o modelo selecionado",
    ["tt_charbindsight"]              = "Liga a sua visão à Unidade selecionada",
    ["tt_charunbindsight"]            = "Desliga a sua visão da Unidade selecionada",
    ["tt_charrename"]                 = "Ativa a renomeação do personagem selecionado no próximo início de sessão",
    ["tt_charcustomize"]              = "Ativa a personalização do personagem selecionado no próximo início de sessão",
    ["tt_charchangerace"]             = "Ativa a mudança de raça do personagem selecionado no próximo início de sessão",
    ["tt_charchnagefaction"]          = "Ativa a mudança de fação do personagem selecionado no próximo início de sessão",
    ["tt_charcombatstop"]             = "Para o combate para o personagem selecionado (ou você mesmo)",
    ["tt_charmaxskill"]               = "Define as competências do personagem selecionado para o valor máximo do nível",
    ["tt_charfreeze"]                 = "Congela o jogador alvo e desativa o seu chat",
    ["tt_charunfreeze"]               = "Descongela o jogador selecionado e restaura o chat",
    ["tt_charlistdeleted"]            = "Lista personagens eliminados na janela de chat",
    ["tt_chardeletedrestore"]         = "Parâmetros= #guid|$name [$newname] [#new account] [[Este comando está em desenvolvimento]",
    ["tt_charpossess"]                = "Possui indefinidamente a criatura selecionada",
    ["tt_charunpossess"]              = "Deixa de possuir a criatura selecionada",
    ["tt_charrecall"]                 = "Retorna o jogador selecionado à última posição de teletransporte que tinha",
    ["tt_charrepair"]                 = "Repara a armadura e armas do jogador selecionado",
    ["tt_banbutton"]                  = "Parâmetros= <account|ip|character> $NameOrIp <-1|xxdyyhzzm> $reason   [[Banir conta/IP e expulsar. -1=banimento permanente, ou uma string como 4d3h24m16s]]",
    ["tt_gonamebutton"]               = "Parâmetro= $charactername  [[Teletransporta-o para o personagem especificado]]",
    ["tt_createguildbutton"]          = "Parâmetros= $GuildLeaderName $GuildName  [[Cria uma guilda chamada $GuildName, com $GuildLeaderName como líder]]",
    ["tt_teleaddbutton"]              = "Parâmetro= $Name  [[Adiciona uma localização de teletransporte .tele para a sua localização atual com o nome $Name]]",
    ["tt_baninfobutton"]              = "Parâmetro= <account|ip|character>  [[Ver informação detalhada sobre banimentos na conta/ip/personagem especificado]]",
    ["tt_groupgobutton"]              = "Parâmetro= $charactername   [[Teletransporta o personagem especificado e o seu grupo para a sua localização]]",
    ["tt_guildinvitebutton"]          = "Parâmetros= $charactername $guildname   [[Adiciona $charactername à guilda $guildname]]",
    ["tt_teledelbutton"]              = "Parâmetro= $telename  [[Remove a localização chamada $telename da lista de localizações .tele]]",
    ["tt_banlistbutton"]              = "Parâmetros= <account|ip> $NameOrIp   [[Procura e retorna banimentos específicos que correspondam aos parâmetros]]",
    ["tt_namegobutton"]               = "Parâmetro= $charactername   [[Teletransporta o personagem especificado para a sua localização]]",
    ["tt_guildrankbutton"]            = "Parâmetros= $charactername #ranknumber   [[Define o personagem especificado para o posto especificado na sua guilda]]",
    ["tt_telegroupbutton"]            = "Parâmetro= $telename  [[Teletransporta o personagem **selecionado** e o seu grupo para a localização .tele chamada $telename]]",
    ["tt_unbanbutton"]                = "Parâmetros= <account|ip|character> $NameOrIp  [[Remove o banimento da conta/IP/personagem especificado]]",
    ["tt_guilddeletebutton"]          = "Parâmetro= $guildname  [[Elimina a Guilda especificada]]",
    ["tt_guilduninvitebutton"]        = "Parâmetro= $charactername  [[Expulsa o personagem especificado da sua guilda]]",
    ["tt_telenamebutton"]             = "Parâmetros= $charactername $telename  [[Teletransporta $charactername para $telename]]",
    ["tt_mutebutton"]                 = "Parâmetros= $charactername #minutes  [[Desativa o chat para toda a conta de $charactername por #minutes]]",
    ["tt_charmorphbutton"]            = "Parâmetros = #DisplayID [[Introduza o DisplayID da transformação que deseja aplicar]]",
    ["tt_charaurabutton"]             = "Parâmetros = #AuraID [[Introduza o AuraID da aura que deseja aplicar]]",
    ["tt_charunaurabutton"]           = "Parâmetros = #AuraID [[Introduza o AuraID da aura que deseja remover]]",
    ["tt_JailAButton"]                = "Parâmetro= $charactername [[Envia o personagem cujo nome aparece nesta caixa para a Prisão da Aliança]]",
    ["tt_JailHButton"]                = "Parâmetro= $charactername [[Envia o personagem cujo nome aparece nesta caixa para a Prisão da Horda]]",
    ["tt_UnJailButton"]               = "Parâmetro= $charactername [[Liberta da prisão o personagem cujo nome aparece nesta caixa.]]",
    ["tt_UnMuteButton"]               = "Remove o silenciamento de $player.",
    ["tt_QuestAddButton"]             = "Adiciona #questid ao jogador **selecionado**.",
    ["tt_QuestCompleteButton"]        = "Marca #questid como completa para o jogador **selecionado**.",
    ["tt_QuestRemoveButton"]          = "Remove #questid do jogador **selecionado**.",
    ["tt_DamageButton"]               = "Parâmetro= #amount de dano a aplicar à criatura/jogador **selecionado**",
    ["tt_HideAreaButton"]             = "Oculta #areaid do jogador **selecionado**.",
    ["tt_ShowAreaButton"]             = "Mostra #areaid ao jogador **selecionado**.",
    ["tt_HonorAddButton"]             = "Adiciona #honorpoints ao jogador **selecionado**.",
    ["tt_HonorUpdateButton"]          = "Nenhum parâmetro necessário. Guarda Honra para o jogador **selecionado**.",
  --[[Control Labels]]
    ["ma_KillButton"]                 = "Matar",
    ["ma_ReviveButton"]               = "Reviver",
    ["ma_SaveButton"]                 = "Guardar",
    ["ma_KickButton"]                 = "Expulsar",
    ["ma_CooldownButton"]             = "Tempo Espera",
    ["ma_GUIDButton"]                 = "Mostrar GUID",
    ["ma_PinfoButton"]                = "Info JOGADOR",
    ["ma_DistanceButton"]             = "Distância",
    ["ma_RecallButton"]               = "Retornar",
    ["ma_DemorphButton"]              = "Remover Transform",
    ["ma_ShowMapsCharButton"]         = "Mostrar Mapas",
    ["ma_HideMapsCharButton"]         = "Ocultar Mapas",
    ["ma_LearnLangButton"]            = "Todos os idiomas",
    ["ma_Learn"]                      = "Aprender",
    ["ma_Modify"]                     = "Modificar",
    ["ma_Reset"]                      = "Repor",
    ["ma_CharBindsight"]              = "Ligar Visão",
    ["ma_CharUnBindsight"]            = "Desligar Visão",
    ["ma_charrename"]                 = "Renomear",
    ["ma_charcustomize"]              = "Personalizar",
    ["ma_charchangerace"]             = "Mud Raça",
    ["ma_charchnagefaction"]          = "Mud Fação",
    ["ma_charcombatstop"]             = "Parar Combate",
    ["ma_charmaxskill"]               = "Comp Máxima",
    ["ma_charfreeze"]                 = "Congelar",
    ["ma_charunfreeze"]               = "Descongelar",
    ["ma_charlistdeleted"]            = "ListarCharElim",
    ["ma_chardeletedrestore"]         = "RestaurarCharElim",
    ["ma_charpossess"]                = "Possuir",
    ["ma_charunpossess"]              = "Deixar Possuir",
    ["ma_charrecall"]                 = "Retornar",
    ["ma_charrepair"]                 = "Reparar",
    ["ma_banbutton"]                  = "Banir",
    ["ma_gonamebutton"]               = "Aparecer",
    ["ma_createguildbutton"]          = "G Criar",
    ["ma_teleaddbutton"]              = "TeleAdicionar",
    ["ma_baninfobutton"]              = "InfoBan",
    ["ma_groupgobutton"]              = "InvocarGrupo",
    ["ma_guildinvitebutton"]          = "G Convidar",
    ["ma_teledelbutton"]              = "TeleEliminar",
    ["ma_banlistbutton"]              = "ListaBan",
    ["ma_namegobutton"]               = "Invocar",
    ["ma_guildrankbutton"]            = "G Posto",
    ["ma_telegroupbutton"]            = "TeleGrupo",
    ["ma_unbanbutton"]                = "RemoverBan",
    ["ma_guilddeletebutton"]          = "G Eliminar",
    ["ma_guilduninvitebutton"]        = "G Expulsar",
    ["ma_telenamebutton"]             = "TeleNome",
    ["ma_mutebutton"]                 = "Silenciar",
    ["ma_Aura"]                       = "Aura",
    ["ma_UnAura"]                     = "Remover Aura",
    ["ma_Morph"]                      = "Transformar",
    ["ma_JailAButton"]                = "Prisão (A)",
    ["ma_JailHButton"]                = "Prisão (H)",
    ["ma_UnJailButton"]               = "Libertar",
    ["ma_UnMuteButton"]               = "Remover Silêncio",
    ["ma_QuestAddButton"]             = "AdicMissão",
    ["ma_QuestCompleteButton"]        = "ComplMissão",
    ["ma_QuestRemoveButton"]          = "RemMissão",
    ["ma_DamageButton"]               = "Dano",
    ["ma_HideAreaButton"]             = "OcultarÁrea",
    ["ma_ShowAreaButton"]             = "MostrarÁrea",
    ["ma_HonorAddButton"]             = "AdicHonra",
    ["ma_HonorUpdateButton"]          = "AtualizHonra",
    ["ma_CharRotateLeft"]             = "<<=",
    ["ma_CharRotateRight"]            = "=>>",
    ["ma_CharZoomIn"]                 = "+",
    ["ma_CharZoomOut"]                = "-",
  --[[Other]]
    ["ma_LevelUp"]                    = "Subir nível",
    ["ma_LevelDown"]                  = "Descer nível",
    ["ma_Money"]                      = "Dinheiro",
    ["ma_Energy"]                     = "Energia",
    ["ma_Rage"]                       = "Fúria",
    ["ma_Mana"]                       = "Mana",
    ["ma_Healthpoints"]               = "Pontos de Vida",
    ["ma_Talents"]                    = "Talentos",
    ["ma_Stats"]                      = "Estatísticas",
    ["ma_Spells"]                     = "Feitiços",
    ["ma_Honor"]                      = "Honra",
    ["ma_Level"]                      = "Nível",
    ["ma_AllLang"]                    = "Todos os Idiomas",
    ["ma_AllGMSpells"]                = "Todos os Feitiços GM",
    ["ma_AllCrafts"]                  = "Todas as Profissões",
    ["ma_AllDefault"]                 = "Tudo Padrão",
    ["ma_AllMyClass"]                 = "Toda a Minha Classe",
    ["ma_AllMyPetTalents"]            = "Todos os Talentos do Meu Animal",
    ["ma_AllMySpells"]                = "Todos os Meus Feitiços",
    ["ma_AllMyTalents"]               = "Todos os Meus Talentos",
    ["ma_AllRecipesAlchemy"]          = "Todas as Receitas (Alquimia)",
    ["ma_AllRecipesBlacksmithing"]    = "Todas as Receitas (Ferraria)",
    ["ma_AllRecipesCooking"]          = "Todas as Receitas (Culinária)",
    ["ma_AllRecipesEnchanting"]       = "Todas as Receitas (Encantamento)",
    ["ma_AllRecipesEngineering"]      = "Todas as Receitas (Engenharia)",
    ["ma_AllRecipesFirstAid"]         = "Todas as Receitas (Primeiros Socorros)",
    ["ma_AllRecipesInscription"]      = "Todas as Receitas (Escrita)",
    ["ma_AllRecipesJewelcrafting"]    = "Todas as Receitas (Joalharia)",
    ["ma_AllRecipesLeatherworking"]   = "Todas as Receitas (Couraria)",
    ["ma_AllRecipesTailoring"]        = "Todas as Receitas (Alfaiataria)",
    ["ma_resetallspells"]             = "Feitiços para TODOS",
    ["ma_resetalltalents"]            = "Talentos para TODOS",
    ["ma_achievements"]               = "Conquistas",
    ["ma_AllSpeeds"]                  = "TodasVelocidades",
    ["ma_Arena"]                      = "Arena",
    ["ma_BackWalk"]                   = "AndarTrás",
    ["ma_Drunk"]                      = "Embriagado",
    ["ma_FlySpeed"]                   = "VelocidadeVoo",
    ["ma_Gender"]                     = "Género",
    ["ma_MountSpeed"]                 = "VelocidadeMontada",
    ["ma_Phase"]                      = "Fase",
    ["ma_RunicPower"]                 = "PoderRúnico",
    ["ma_Speed"]                      = "Velocidade",
    ["ma_StandState"]                 = "EstadoPosição",
    ["ma_SwimSpeed"]                  = "VelocidadeNado",
    ["ma_TalentPoints"]               = "PontosTalento",
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
    ["tt_NpcButton"]                  = "Alternar janela com funções relacionadas com NPCs.",
  --[[Tooltips]]
    ["tt_NPCRotateLeft"]              = "Rodar à esquerda",
    ["tt_NPCRotateRight"]             = "Rodar à direita",
    ["tt_NPCKillButton"]              = "Mata o alvo selecionado",
    ["tt_npcrespawn"]                 = "Reaparece a criatura selecionada, ou se nenhuma selecionada, todas as criaturas próximas",
    ["tt_NPCDistanceButton"]          = "Obter distância à criatura selecionada.",
    ["tt_NPCGUIDButton"]              = "Mostra o GUID do personagem selecionado.",
    ["tt_NPCInfoButton"]              = "Obter informação sobre o NPC selecionado.",
    ["tt_NPCDemorph"]                 = "Remove a transformação do NPC selecionado",
    ["tt_NPCMove"]                    = "Move a criatura selecionada para a sua localização",
    ["tt_NPCDel"]                     = "Elimina a criatura selecionada",
    ["tt_getguid"]                    = "Obtém o GUID e ID da criatura selecionada",
    ["tt_NPCClear"]                   = "Limpa todos os campos de informação do NPC (GUID, NPC ID, Display ID, Distância)",
    ["tt_NPCAdd"]                     = "Adiciona uma cópia deste NPC na sua localização atual.",
    ["tt_NPCGo"]                      = "Teletransporta-o para o NPC na caixa GUID",
    ["tt_NPCMorph"]                   = "Parâmetros = #DisplayID [[Introduza o DisplayID da transformação que deseja aplicar]]",
    ["tt_NPCSay"]                     = "Fazer o NPC selecionado dizer [parâmetros]",
    ["tt_NPCYell"]                    = "Fazer o NPC selecionado gritar [parâmetros]",
    ["tt_NPCAura"]                    = "Parâmetros = #AuraID [[Introduza o AuraID da aura que deseja aplicar]]",
    ["tt_NPCUnaura"]                  = "Parâmetros = #AuraID [[Introduza o AuraID da aura que deseja remover]]",
    ["tt_PlayEmote"]                  = "Reproduzir Emote da lista à esquerda",
    ["tt_GPSButton"]                  = "Mostra coordenadas para o personagem selecionado.",
    ["tt_DisplayUp"]                  = "Incrementar DisplayID do NPC em 1",
    ["tt_DisplayDown"]                = "Decrementar DisplayID do NPC em 1",
    ["tt_IDUp"]                       = "Incrementar ID do NPC em 1",
    ["tt_IDDown"]                     = "Decrementar ID do NPC em 1",
    ["tt_npcmodelzoominbutton"]       = "Aproximar o modelo selecionado",
    ["tt_npcmodelzoomoutbutton"]      = "Afastar o modelo selecionado",
    ["tt_npcbindsight"]               = "Liga a sua visão ao NPC selecionado",
    ["tt_npcunbindsight"]             = "Desliga a sua visão do NPC selecionado",
    ["tt_npccometome"]                = "Força o NPC selecionado a vir para a sua localização. Localização NÃO guardada na BD.",
    ["tt_npcpossess"]                 = "Possui indefinidamente a criatura selecionada",
    ["tt_npcunpossess"]               = "Deixa de possuir a criatura selecionada",
    ["tt_NPCFreezeButton"]            = "Para o movimento do NPC selecionado, guardando Waypoints",
    ["tt_NPCFreezeDelButton"]         = "Para o movimento do NPC selecionado, SEM guardar Waypoints",
    ["tt_WayEndAdd"]                  = "Adiciona um waypoint ao fim da pilha existente",
    ["tt_NPCAddWay"]                  = "Adiciona um waypoint à pilha. O GUID da criatura deve estar na caixa abaixo",
    ["tt_WayMAdd"]                    = "Adiciona um waypoint à pilha de movimento existente da criatura selecionada",
    ["tt_WayModifyDel"]               = "Elimina o waypoint selecionado da pilha de movimento existente da criatura",
    ["tt_WayShow0"]                   = "Para de mostrar waypoints para a criatura selecionada.",
    ["tt_WayShow1"]                   = "Mostrar waypoints para a criatura selecionada.",
    ["tt_NPCAdd_WayShowOn"]           = "mostra waypoints para a criatura selecionada",
    ["tt_NPCUnFreeze_RandomButton"]   = "Permite movimento aleatório do NPC selecionado.",
    ["tt_NPCUnFreeze_WayButton"]      = "Permite movimento por waypoints do NPC selecionado.",
    ["tt_MoveStackButton"]            = "Mostra a pilha de movimento do personagem selecionado.",
  --[[Control Labels]]
    ["Morph"]                         = "Transformar",
    ["ma_NPCKillButton"]              = "Matar",
    ["ma_Respawn"]                    = "Reaparecer",
    ["ma_NPCDistanceButton"]          = "Distância",
    ["ma_NPCGUIDButton"]              = "Mostrar GUID",
    ["ma_NPCInfoButton"]              = "Info NPC",
    ["ma_NPCDemorph"]                 = "Remover Transform",
    ["ma_NPCMove"]                    = "Mover NPC",
    ["ma_NPCDel"]                     = "Eliminar NPC",
    ["ma_getguid"]                    = "Obter GUID",
    ["ma_NPCAdd"]                     = "Adicionar NPC",
    ["ma_NPCGo"]                      = "Ir NPC",
    ["ma_NPCMorph"]                   = "Transformar",
    ["ma_NPCSay"]                     = "NPC Dizer",
    ["ma_NPCYell"]                    = "NPC Gritar",
    ["ma_NPCAura"]                    = "Aura NPC",
    ["ma_NPCUnAura"]                  = "Remover Aura NPC",
    ["ma_PlayEmote1"]                 = "Emote",
    ["ma_PlayEmote2"]                 = "Emote",
    ["ma_DistanceBox"]                = "Distância",
    ["ma_NPCBindsight"]               = "Ligar Visão",
    ["ma_NPCUnBindsight"]             = "Desligar Visão",
    ["ma_NPCComeToMe"]                = "VirCáMim",
    ["ma_npcpossess"]                 = "Possuir",
    ["ma_npcunpossess"]               = "Deixar Possuir",
    ["ma_WayShow1"]                   = "MostrarWayOn",
    ["ma_WayShow0"]                   = "MostrarWayOff",
    ["ma_MoveStackButton"]            = "Mostrar Movs",
    ["ma_NPCFreezeButton"]            = "NPCFicar",
    ["ma_WayAllDel"]                  = "NPCFicarElim",
    ["ma_WayMAdd"]                    = "WayMAdicionar",
    ["ma_NPCUnFreeze_RandomButton"]   = "Mov Aleatório",
    ["ma_NPCUnFreeze_WayButton"]      = "Mov Waypt",
    ["ma_WayMDel"]                    = "WayMEliminar",
    ["ma_WayEndAdd"]                  = "WayFimAdic",
    ["ma_WayAdd"]                     = "WayAdicionar",
    ["ma_WayShow"]                    = "WayMostrar",
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
    ["ma_NPCClearButton"]             = "Limpar",
  --[[Other]]



--[[GObjects Tab]]
  --[[Name]]
    ["tabmenu_GO"]                    = "GOB",
    ["tt_GOButton"]                   = "Alternar janela com funções de GObject.",
  --[[Tooltips]]
    ["tt_ObjGo"]                      = "Ir para o objeto selecionado",
    ["tt_ObjAdd"]                     = "Adicionar uma cópia do objeto alvo na sua localização e orientação",
    ["tt_ObjMove"]                    = "Mover o objeto alvo para a sua localização",
    ["tt_ObjTurn"]                    = "Vira o objeto alvo para corresponder à sua orientação",
    ["tt_ObjDel"]                     = "Elimina o objeto alvo",
    ["tt_ObjNear"]                    = "Retorna informação sobre objetos perto de si",
    ["tt_ObjTarget"]                  = "Alveja o objeto mais próximo e mostra informação",
    ["tt_ObjActivate"]                = "Ativa o objeto alvo",
    ["tt_ObjAddTemp"]                 = "Adiciona uma cópia temporária do objeto",
    ["tt_ObjInfo"]                    = "Obtém informação estendida sobre o objeto",
    ["tt_ObjSetPhase"]                = "Define a fase do objeto",
    ["tt_ObjShowModel"]               = "Carregar e mostrar o modelo",
    ["tt_ObjUnloadModel"]             = "Descarregar modelos para libertar memória",
    ["tt_ObjMoveForward"]             = "Mover para a frente",
    ["tt_ObjMoveBack"]                = "Mover para trás",
    ["tt_ObjMoveLeft"]                = "Mover para a esquerda",
    ["tt_ObjMoveRight"]               = "Mover para a direita",
    ["tt_ObjMoveUp"]                  = "Mover para cima",
    ["tt_ObjMoveDown"]                = "Mover para baixo",
    ["tt_ObjSpawnHere"]               = "Aparecer aqui",
  --[[Control Labels]]
    ["ma_OBJGo"]                      = "Ir Obj",
    ["ma_OBJAdd"]                     = "Adic Obj",
    ["ma_OBJMove"]                    = "Mover Obj",
    ["ma_OBJTurn"]                    = "Virar Obj",
    ["ma_OBJDel"]                     = "Elim Obj",
    ["ma_OBJNear"]                    = "Obj Próximo",
    ["ma_OBJTarget"]                  = "Alvejar Obj",
    ["ma_OBJActivate"]                = "Ativar Obj",
    ["ma_OBJAddTemp"]                 = "Adic Obj Temp",
    ["ma_OBJInfo"]                    = "Info Obj",
    ["ma_OBJSetPhase"]                = "Fase Obj",
    ["ma_GOGUIDLabel"]                = "GUID",
    ["ma_GOEntryIDLabel"]             = "EntryID",
    ["ma_GODisplayIDLabel"]           = "DisplayID",
    ["ma_GORangeLabel"]               = "Alcance",
    ["ma_GOAddOnMoveLabel"]           = "Adic Ao Mover",
    ["ma_GOMoveOnMoveLabel"]          = "Mover Ao Mover",
    ["ma_GOMoveDistancesLabel"]       = "Distâncias Movimento",
    ["ma_GOFwdBackLabel"]             = "Frente/Trás:",
    ["ma_GOLeftRightLabel"]           = "Esq/Dir:",
    ["ma_GOUpDownLabel"]              = "Cima/Baixo:",
    ["ma_GORotateLeft"]               = "<<",
    ["ma_GORotateRight"]              = ">>",
    ["ma_GOZoomIn"]                   = "+",
    ["ma_GOZoomOut"]                  = "-",
    ["ma_GOMoveForward"]              = "FRENTE",
    ["ma_GOMoveLeft"]                 = "ESQUERDA",
    ["ma_GOMoveRight"]                = "DIREITA",
    ["ma_GOMoveBack"]                 = "TRÁS",
    ["ma_GOSpawnHere"]                = "AQUI",
    ["ma_GOMoveUp"]                   = "CIMA",
    ["ma_GOMoveDown"]                 = "BAIXO",
    ["ma_GOShowButton"]               = "Mostrar",
    ["ma_GOUnloadButton"]             = "Descarregar",
  --[[Other]]
    ["msg_toggle_maps_confirm"]       = "Tem certeza que deseja alternar todos os mapas? Isso pode congelar o cliente por alguns segundos.",
    ["msg_account_lock_confirm"]      = "Tem certeza que deseja %s este conta?",
    ["msg_acct_create_confirm"]       = "Tem certeza que deseja criar a conta '%s'?",
    ["msg_acct_delete_confirm"]       = "Tem certeza que deseja EXCLUIR a conta '%s'?",
    ["msg_tele_del_confirm"]          = "Tem certeza que deseja excluir o local de teletransporte '%s'?",



--[[Tele Tab]]
  --[[Name]]
    ["tabmenu_Tele"]                  = "TELE",
    ["tt_TeleButton"]                 = "Alternar janela com funções de teletransporte.",
  --[[Tooltips]]
  --[[Control Labels]]
    ["Zone"]                          = "|cFF00FF00Zona:|r ",
    ["ma_ContinentSelection"]         = "Seleção de Continente",
    ["ma_EasternKingdomsN"]           = "Reinos do Leste (N)",
    ["ma_EasternKingdomsS"]           = "Reinos do Leste (S)",
    ["ma_Kalimdor"]                   = "Kalimdor",
    ["ma_Outland"]                    = "Terras Exteriores",
    ["ma_NorthrendAlliance"]          = "Nortúndria-Aliança",
    ["ma_NorthrendHorde"]             = "Nortúndria-Horda",
    ["ma_BattlegroundsArenas"]        = "Campos de Batalha/Arenas",
    ["ma_InstancesEastern"]           = "Instâncias: Leste",
    ["ma_InstancesKalimdor"]          = "Instâncias: Kalimdor",
    ["ma_InstancesOutland"]           = "Instâncias: Terras Exteriores",
    ["ma_InstancesNorthrend"]         = "Instâncias: Nortúndria",
    ["ma_Other"]                      = "Outro",
    ["ma_ZoneSelection"]              = "Seleção de Zona",
    ["ma_SelectedSubzone"]            = "Subzona Selecionada",
  --[[Other]]
    ["ma_NoZones"]                    = "Sem zonas!",
    ["ma_NoSubZones"]                 = "Sem subzonas!",



--[[Tickets Tab]]
  --[[Name]]
    ["tabmenu_ticket"]                = "TICKETS",
    ["tt_TicketButton"]               = "Alternar janela que mostra todos os tickets e permite administrá-los.",
  --[[Tooltips]]
    ["tt_TicketOn"]                   = "Anunciar novos tickets.",
    ["tt_TicketOff"]                  = "Não anunciar novos tickets.",
    ["tt_ResetTickets"]               = "Repor tickets carregados",
    ["tt_LoadAllTickets"]             = "Carregar Todos os tickets",
    ["tt_LoadOnlineTickets"]          = "Carregar tickets de jogadores online",
    ["tt_DeleteTicket"]               = "Eliminar ticket",
    ["tt_AnswerTicket"]               = "Responder ticket",
    ["tt_GetCharTicket"]              = "Invocar personagem do ticket",
    ["tt_GoCharTicket"]               = "Ir para personagem do ticket",
    ["tt_WhisperTicket"]              = "Sussurrar ao personagem do ticket",
    ["tt_GoTicket"]                   = "Ir para localização do ticket",
    ["tt_ShowTickets"]                = "Mostrar tickets carregados",
  --[[Control Labels]]
    ["ma_ticketidlabel"]              = "|cFF00FF00Ticket:",
    ["ma_ticketcreatedbylabel"]       = "|cFF00FF00Criado por:",
    ["ma_tickettimecreatedlabel"]     = "|cFF00FF00Criado:",
    ["ma_ticketlastchangelabel"]      = "|cFF00FF00Última alteração:",
    ["ma_ticketmessagelabel"]         = "|cFF00FF00Mensagem do Ticket:",
    ["ma_LoadTicketsButton"]          = "Atualizar",
    ["ma_GetCharTicketButton"]        = "Invocar",
    ["ma_GoCharTicketButton"]         = "Ir Jogador",
    ["ma_AnswerButton"]               = "Correio",
    ["ma_DeleteButton"]               = "Fechar",
    ["ma_ticketwhisperbutton"]        = "Sussurrar",
    ["ma_TicketCount"]                = "|cFF00FF00Tickets:|r ",
    ["ma_TicketsNoNew"]               = "Não tem novos tickets.",
    ["ma_TicketsNewNumber"]           = "Tem |cffeda55f%s|r novos tickets!",
    ["ma_TicketsGoLast"]              = "Ir para o criador do último ticket (%s).",
    ["ma_TicketsGetLast"]             = "Trazer %s para si.",
    ["ma_TicketsInfoPlayer"]          = "|cFF00FF00Jogador:|r ",
    ["ma_TicketsInfoStatus"]          = "|cFF00FF00Estado:|r ",
    ["ma_TicketsInfoAccount"]         = "|cFF00FF00Conta:|r ",
    ["ma_TicketsInfoAccLevel"]        = "|cFF00FF00Nível-Conta:|r ",
    ["ma_TicketsInfoLastIP"]          = "|cFF00FF00Último IP:|r ",
    ["ma_TicketsInfoPlayedTime"]      = "|cFF00FF00Tempo jogado:|r ",
    ["ma_TicketsInfoLevel"]           = "|cFF00FF00Nível:|r ",
    ["ma_TicketsInfoMoney"]           = "|cFF00FF00Dinheiro:|r ",
    ["ma_TicketsInfoLatency"]         = "|cFF00FF00Latência:|r ",
    ["ma_TicketsNoInfo"]              = "Sem informação disponível",
    ["ma_TicketsNotLoaded"]           = "Nenhum ticket carregado...",
    ["ma_TicketsNoTickets"]           = "Sem tickets disponíveis!",
    ["ma_TicketResetButton"]          = "REPOR",
    ["ma_TicketLoadAllButton"]        = "Carregar Todos",
    ["ma_TicketLoadOnlineButton"]     = "Carregar Online",
    ["ma_TicketShowButton"]           = "MOSTRAR",
    ["ma_TicketGoButton"]             = "Ir Ticket",
    ["ma_TicketTicketLoaded"]         = "|cFF00FF00Ticket-Nr Carregado:|r %s\n\nInformação do Jogador\n\n",
    ["ma_Reload"]                     = "Recarregar",
    ["ma_LoadMore"]                   = "Carregar mais...",
  --[[Other]]



--[[Misc Tab]]
  --[[Name]]
    ["tabmenu_Misc"]                  = "MISC",
    ["tt_MiscButton"]                 = "Alternar janela com ações diversas.",
  --[[Tooltips]]
    ["tt_FrmTrSlider"]                = "Alterar transparência da moldura",
    ["tt_BtnTrSlider"]                = "Alterar transparência dos botões",
    ["tt_windowismovable"]            = "Permitir uma janela movível",
    ["tt_updatechanges"]              = "Aplicar alterações feitas às definições. Recarrega a UI.",
  --[[Control Labels]]
    ["cmd_toggle"]                    = "Alternar a janela principal",
    ["cmd_transparency"]              = "Alternar a transparência básica (0.5 ou 1.0)",
    ["cmd_tooltip"]                   = "Alternar se as dicas dos botões são mostradas ou não",
    ["ma_EnableTransparency"]         = "Ativar Transparência",
    ["ma_EnableLocalizedSearch"]      = "Ativar Strings de Pesquisa Localizadas",
    ["ma_EnableMinimenu"]             = "Ativar Minimenú/Barra de Ferramentas",
    ["ma_EnableTooltips"]             = "Ativar Dicas",
    ["ma_ShowChatOutput"]             = "Mostrar Saída do Chat",
    ["ma_FrameStrataLabel"]           = "Nível de Estrato da Moldura:",
    ["ma_FrameStrataBackground"]      = "Fundo",
    ["ma_FrameStrataLow"]             = "Baixo",
    ["ma_FrameStrataMedium"]          = "Médio (Padrão)",
    ["ma_FrameStrataHigh"]            = "Alto",
    ["ma_FrameStrataDialog"]          = "Diálogo",
    ["ma_FrameStrataFullscreen"]      = "Ecrã Completo",
    ["ma_FrameStrataFullscreenDialog"] = "Diálogo Ecrã Completo",
    ["ma_UpdateFrequencyLabel"]       = "Especifica a frequência de atualização do gráfico Diff no separador Servidor.\n10000 = ~1 minuto, 50000 = ~5 minutos",
    ["ma_BackgroundColorLabel"]       = "Cor de Fundo",
    ["ma_FrameColorLabel"]            = "Cor da Moldura",
    ["ma_ButtonColorLabel"]           = "Cor dos Botões",
    ["ma_LinkifierColorLabel"]        = "MangLinkifier",
    ["ma_UpdateChangesButton"]        = "Atualizar Alterações",
  --[[Other]]
    ["ma_ApplyWeatherButton"]         = "Aplicar Clima",
    ["ma_WeatherFine"]                = "Bom Tempo",
    ["ma_WeatherFog"]                 = "Nevoeiro",
    ["ma_WeatherRain"]                = "Chuva",
    ["ma_WeatherSnow"]                = "Neve",
    ["ma_WeatherSand"]                = "Areia",
    ["msg_transparency_saved"]        = "|cff00ff00AzerothAdmin:|r Definição de transparência guardada. Atualize Alterações ou Recarregue a UI para aplicar.",
    ["msg_localsearch_saved"]         = "|cff00ff00AzerothAdmin:|r Definição de strings de pesquisa localizadas guardada. Atualize Alterações ou Recarregue a UI para aplicar.",
    ["msg_minimenu_saved"]            = "|cff00ff00AzerothAdmin:|r Definição de minimenú guardada.",
    ["msg_tooltip_saved"]             = "|cff00ff00AzerothAdmin:|r Definição de dicas guardada. Atualize Alterações ou Recarregue a UI para aplicar.",
    ["msg_chatoutput_saved"]          = "|cff00ff00AzerothAdmin:|r Definição de saída do chat guardada.",



--[[Server Tab]]
    ["tabmenu_server"]                = "SERVER",
    ["tt_ServerButton"]               = "Mostrar várias informações do servidor e executar ações relativas ao servidor.",
  --[[Tooltips]]
    ["tt_AnnounceButton"]             = "Anunciar uma mensagem do sistema.",
    ["tt_ShutdownButton"]             = "Desligar o servidor na quantidade de segundos do campo, se omitido desliga imediatamente!",
    ["tt_CancelShutdownButton"]       = "Cancelar a contagem decrescente de desligamento do servidor.",
  --[[Control Labels]]
    ["ma_AnnounceButton"]             = "Anunciar",
    ["ma_ShutdownButton"]             = "Desligar Servidor",
    ["ma_CancelShutdownButton"]       = "Cancelar Desligamento",
    ["ma_ReloadTableButton"]          = "Recarregar Tabela",
    ["ma_ReloadScriptsButton"]        = "Recarregar Scripts",
    ["ma_ServerLatencyLabel"]         = "|cFF00FF00^Latência do Servidor:|r",
    ["ma_UpdateDiffLabel"]            = "|cFF00FF00^Update Diff:|r",
    ["ma_MeanLabel"]                  = "|cFF00FF00Média:|r",
    ["ma_MedianLabel"]                = "|cFF00FF00Mediana:|r",
    ["ma_PercentilesLabel"]           = "|cFF00FF00Percentis:|r",
  --[[Other]]
    ["msg_shutdown_time_required"]    = "Por favor introduza o tempo em segundos antes de usar o desligamento do servidor.",
    ["msg_shutdown_confirm"]          = "Tem a certeza de que quer desligar o servidor em %s segundos?",



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
    ["tt_ItemButton"]                 = "Alternar uma janela com a função de procurar itens e gerir os seus favoritos.",
    ["tt_ItemSetButton"]              = "Alternar uma janela com a função de procurar conjuntos de itens e gerir os seus favoritos.",
    ["tt_SpellButton"]                = "Alternar uma janela com a função de procurar feitiços e gerir os seus favoritos.",
    ["tt_QuestButton"]                = "Alternar uma janela com a função de procurar missões e gerir os seus favoritos.",
    ["tt_CreatureButton"]             = "Alternar uma janela com a função de procurar criaturas e gerir os seus favoritos.",
    ["tt_ObjectButton"]               = "Alternar uma janela com a função de procurar objetos e gerir os seus favoritos.",
    ["tt_SearchDefault"]              = "Agora pode introduzir uma palavra-chave e iniciar a pesquisa.",
    ["tt_SkillButton"]                = "Alternar uma janela com a função de procurar competências e gerir os seus favoritos.",
  --[[Labels]]
    ["ma_PopupErrorTab"]              = "ERRO",
    ["ma_PopupFavoritesTab"]          = "Favoritos",
    ["ma_PopupTab3"]                  = "Separador 3",
    ["ma_PopupAmountLabel"]           = "Quantidade:",
    ["ma_PopupInvisibleText"]         = "Invisível",
    ["ma_ItemButton"]                 = "Pesquisar-Item",
    ["ma_ItemSetButton"]              = "Pesquisar-ConjuntoItens",
    ["ma_SpellButton"]                = "Pesquisar-Feitiço",
    ["ma_QuestButton"]                = "Pesquisar-Missão",
    ["ma_CreatureButton"]             = "Pesquisar-Criatura",
    ["ma_ObjectButton"]               = "Pesquisar-Objeto",
    ["ma_TeleSearchButton"]           = "Pesquisar-Teletransporte",
    ["ma_MailRecipient"]              = "Destinatário",
    ["ma_Mail"]                       = "Enviar Correio",
    ["ma_Send"]                       = "Enviar",
    ["ma_MailSubject"]                = "Assunto",
    ["ma_MailYourMsg"]                = "Aqui a sua mensagem!",
    ["ma_SearchButton"]               = "Pesquisar...",
    ["ma_ResetButton"]                = "Repor",
    ["ma_FavAdd"]                     = "Adicionar selecionado",
    ["ma_FavRemove"]                  = "Remover selecionado",
    ["ma_SelectAllButton"]            = "Selecionar tudo",
    ["ma_DeselectAllButton"]          = "Desselecionar tudo",
    ["ma_MailBytesLeft"]              = "Bytes restantes: ",
    ["ma_SkillButton"]                = "Pesquisar-Competência",
    ["ma_SkillVar1Button"]            = "Competência",
    ["ma_SkillVar2Button"]            = "Competência Máxima",
    ["ma_ItemVar1Button"]             = "Quantidade",
    ["ma_ObjectVar1Button"]           = "Modelo de Saque",
    ["ma_ObjectVar2Button"]           = "Tempo de Aparecimento",
    ["ma_NoFavorites"]                = "Não existem favoritos guardados atualmente!",
    ["favoriteResults"]               = "|cFF00FF00Favoritos:|r ",



--[[Deprecated, but may be used again.]]
    ["ma_LearnAllButton"]             = "Todos os feitiços",
    ["ma_LearnCraftsButton"]          = "Todas as profissões e receitas",
    ["ma_LearnGMButton"]              = "Feitiços GM padrão",
    ["ma_LearnClassButton"]           = "Todos os feitiços de classe",
    ["ma_GPSButton"]                  = "GPS",
    ["ma_Online"]                     = "Online",
    ["ma_Offline"]                    = "Offline",



--[[Linkifier]]
    ["lfer_Spawn"]                    = "Aparecer",
    ["lfer_List"]                     = "Listar",
    ["lfer_Reload"]                   = "Recarregar",
    ["lfer_Goto"]                     = "Ir Para",
    ["lfer_Move"]                     = "Mover",
    ["lfer_Turn"]                     = "Virar",
    ["lfer_Delete"]                   = "Eliminar",
    ["lfer_Teleport"]                 = "Teletransportar",
    ["lfer_Morph"]                    = "Transformar",
    ["lfer_Add"]                      = "Adicionar",
    ["lfer_Remove"]                   = "Remover",
    ["lfer_Learn"]                    = "Aprender",
    ["lfer_Unlearn"]                  = "Desaprender",
    ["lfer_Error"]                    = "Erro String de Pesquisa Correspondeu mas ocorreu um erro ou não foi possível encontrar o tipo"

}
  for k,v in pairs(translations) do L[k] = v end
end
