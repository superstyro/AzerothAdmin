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
1. Edit the first un-commented line below, which should resemble: function Return_frFR(). Change
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

local L = LibStub("AceLocale-3.0"):NewLocale("AzerothAdmin", "frFR")
if L then
  local translations = {
--[[General]]
  --[[Tooltips]]
    ["tt_Default"]                    = "Déplacez votre curseur sur un élément pour afficher l'info-bulle !",
    ["tt_LanguageButton"]             = "Recharger AzerothAdmin et appliquer la langue sélectionnée.",
    ["tt_RefreshButton"]              = "Actualiser les informations du serveur.",
  --[[Control Labels]]
    ["ma_LanguageButton"]             = "Recharger UI",
    ["ma_RefreshButton"]              = "Actualiser",
    ["ma_TopText"]                    = "toptext, you should not see this!",
    ["ma_Top2Text"]                   = "toptext, you should not see this!",
    ["ma_InfoOnlineText"]             = "Joueurs en ligne : ...",
    ["ma_InfoMaxOnlineText"]          = "Maximum en ligne : ...",
    ["ma_InfoUptimeText"]             = "Temps de fonctionnement : ...",
    ["ma_InfoRevisionText"]           = "Révision AzerothCore : ...",
    ["info_revision"]                 = "|cFF00FF00Révision AzerothCore :|r ",
    ["info_platform"]                 = "|cFF00FF00Plateforme du serveur :|r ",
    ["info_online"]                   = "|cFF00FF00Joueurs en ligne :|r ",
    ["info_maxonline"]                = "|cFF00FF00Maximum en ligne :|r ",
    ["info_uptime"]                   = "|cFF00FF00Temps de fonctionnement :|r ",
    ["ma_CloseWindow"]                = "X",
    ["tt_CloseWindow"]                = "Fermer la fenêtre",
  --[[Other]]
    ["slashcmds"]                     = { "/AzerothAdmin", "/aa" },
    ["lang"]                          = "Français",
    ["realm"]                         = "|cFF00FF00Royaume :|r "..GetCVar("realmName"),
    ["char"]                          = "|cFF00FF00Perso :|r "..UnitName("player"),
    ["guid"]                          = "|cFF00FF00Guid :|r ",
    ["tickets"]                       = "|cFF00FF00Tickets :|r ",
    ["selectionerror1"]               = "Veuillez sélectionner seulement vous-même, un autre joueur ou rien !",
    ["selectionerror2"]               = "Veuillez sélectionner seulement vous-même ou rien !",
    ["selectionerror3"]               = "Veuillez sélectionner seulement un autre joueur !",
    ["selectionerror4"]               = "Veuillez sélectionner seulement un PNJ !",
    ["numbererror"]                   = "La valeur doit être un nombre !",
    ["searchResults"]                 = "|cFF00FF00Résultats de recherche :|r ",
    ["ma_parameters"]                 = "Paramètre(s) :", --Used on multiple tabs



--[[GM tab]]
  --[[Name]]
    ["tabmenu_Main"]                  = "GM",
  --[[Tooltips]]
    ["tt_MainButton"]                 = "Ouvrir/Fermer la fenêtre principale d'AzerothAdmin.",
    ["tt_DisplayAccountLevel"]        = "Afficher le niveau de votre compte",
    ["tt_GMOnButton"]                 = "Activer votre mode GM.",
    ["tt_GMOffButton"]                = "Désactiver votre mode GM.",
    ["tt_FlyOnButton"]                = "Activer le mode Vol pour le personnage sélectionné.",
    ["tt_FlyOffButton"]               = "Désactiver le mode Vol pour le personnage sélectionné.",
    ["tt_HoverOnButton"]              = "Activer votre mode Lévitation.",
    ["tt_HoverOffButton"]             = "Désactiver votre mode Lévitation.",
    ["tt_WhispOnButton"]              = "Accepter les chuchotements des autres joueurs.",
    ["tt_WhispOffButton"]             = "Ne pas accepter les chuchotements des autres joueurs.",
    ["tt_InvisOnButton"]              = "Vous rendre invisible.",
    ["tt_InvisOffButton"]             = "Vous rendre visible.",
    ["tt_TaxiOnButton"]               = "Afficher tous les itinéraires de taxi au joueur sélectionné. Cette triche sera désactivée à la déconnexion.",
    ["tt_TaxiOffButton"]              = "Désactiver la triche de taxi et restaurer les itinéraires connus du joueur.",
    ["tt_ShowMapsButton"]             = "Révéler les cartes pour le personnage sélectionné.",
    ["tt_HideMapsButton"]             = "Masquer les cartes pour le personnage sélectionné.",
    ["tt_SpeedSlider"]                = "Augmenter ou diminuer la vitesse du personnage sélectionné.",
    ["tt_ScaleSlider"]                = "Augmenter ou diminuer la taille du personnage sélectionné.",
    ["tt_instakill"]                  = "Lorsque coché, cliquer sur une créature ennemie la tue instantanément.",
    ["tt_ScreenButton"]               = "Prendre une capture d'écran.",
    ["tt_BankButton"]                 = "Afficher votre banque.",
    ["tt_Dismount"]                   = "Vous fait descendre de votre monture si vous êtes monté",
    ["tt_SetJail_A_Button"]           = "Définir l'emplacement de la prison de l'Alliance à votre position actuelle.",
    ["tt_SetJail_H_Button"]           = "Définir l'emplacement de la prison de la Horde à votre position actuelle.",
    ["tt_N"]                          = "Naviguer vers le Nord",
    ["tt_S"]                          = "Naviguer vers le Sud",
    ["tt_E"]                          = "Naviguer vers l'Est",
    ["tt_W"]                          = "Naviguer vers l'Ouest",
  --["tt_chatonbutton"]               = "Activer le chat GM",
  --["tt_chatoffbutton"]              = "Désactiver le chat GM",
    ["tt_waterwalkonbutton"]          = "Activer Marche sur l'eau pour la créature sélectionnée"  ,
    ["tt_watewrwalkoffbutton"]        = "Désactiver Marche sur l'eau pour la créature sélectionnée",
    ["tt_accountlockonbutton"]        = "Verrouiller votre compte",
    ["tt_accountlockoffbutton"]       = "Déverrouiller votre compte",
    ["tt_DisplayAccountLvl"]          = "Afficher le niveau de votre compte.",
    ["tt_SpeedSliderReset"]           = "Réinitialiser la vitesse à 1.0",
    ["tt_ScaleSliderReset"]           = "Réinitialiser la taille à 1.0",
    ["tt_gmnotifybutton"]             = "Envoie le message $message à tous les GMs en ligne [[Paramètres : $message]]",
    ["tt_gmingamebutton"]             = "Affiche les GMs connectés.",
    ["tt_gmlistbutton"]               = "Affiche les comptes GM sur ce serveur",
    ["tt_petcreatebutton"]            = "Fait de l'ANIMAL sélectionné votre familier.",
    ["tt_petlearnbutton"]             = "Apprend un sort à votre familier [[Paramètre : #SPELLID]]",
    ["tt_petunlearnbutton"]           = "Fait désapprendre un sort à votre familier [[Paramètre : #SPELLID]]",
    ["tt_pettpbutton"]                = "Modifie les points d'entraînement du familier [[Paramètre : #points]]",
    ["tt_lookuptaxibutton"]           = "Rechercher un TaxiNode [[Paramètre : $Areanamepart]]",
    ["tt_gotaxinodebutton"]           = "Téléporte vers le TaxiNode spécifié [[Paramètre : #taxinode]]",
    ["tt_gotriggerbutton"]            = "Téléporte vers le déclencheur de zone spécifié [[Paramètre : #trigger_id]]",
    ["tt_goxybutton"]                 = "Téléporte aux coordonnées données au niveau du sol/eau sur MapID. Si MapID omis, carte actuelle [[Paramètres : #x #y [#mapid]]]",
    ["tt_goxyzbutton"]                = "Téléporte aux coordonnées données au niveau #z sur MapID. Si MapID omis, carte actuelle [[Paramètres : #x #y #z [#mapid]]]",
    ["tt_gozonexybutton"]             = "Téléporte aux coordonnées données au niveau du sol/eau dans ZoneID. Si ZoneID omis, zone actuelle [[Paramètres : #x #y [#zoneid]]]",
    ["tt_lookupzonebutton"]           = "Rechercher une zone. [[Paramètres : $Areanamepart]]",
    ["tt_castbutton"]                 = "Lancer un sort. [[Paramètres : #SpellID]]",
    ["tt_castbackbutton"]             = "La créature sélectionnée lance le sort [SpellID] sur VOUS. [[Paramètres : #SpellID]]",
    ["tt_castdistbutton"]             = "Vous lancez un sort [SpellID] à la distance [#Dist]. [[Paramètres : #SpellID #Dist]]",
    ["tt_castselfbutton"]             = "La créature sélectionnée lance le sort [SpellID] sur elle-même. [[Paramètres : #SpellID]]",
    ["tt_casttargetbutton"]           = "La créature sélectionnée lance le sort [SpellID] sur sa cible. [[Paramètres : #SpellID]]",
    ["tt_gmclearbutton"]              = "Efface la boîte de paramètres.",
    ["tt_listitembutton"]             = "Liste toutes les occurrences de [#itemID]. [[Paramètres : #ItemID]]",
    ["tt_acctcreatebutton"]           = "Crée un compte joueur [[Paramètres : $accountname $password]]",
    ["tt_acctdeletebutton"]           = "Supprime un compte joueur et tous les personnages [[Paramètres : $accountname]]",
    ["tt_acctaddonbutton"]            = "Définit $account pour utiliser #addon(0=WoW, 1=TBC, 2=WotLK) [[Paramètres : $accountname #addon]]",
    ["tt_acctgmlvlbutton"]            = "Définit $account au #gmlevel (0=Joueur, 1=Assistant, 2=Aide, 3=GM, 4=Admin) [[Paramètres : $accountname #gmlevel]]",
    ["tt_acctpasswdbutton"]           = "Définit le mot de passe de $account [[Paramètres : $accountname $password $password]]",
  --[[Control Labels]]
    ["ma_OffButton"]                  = "Off",
    ["ma_displaylevelbutton"]         = "Afficher niveau compte",
    ["ma_GMOnButton"]                 = "Mode GM activé",
    ["ma_FlyOnButton"]                = "Mode Vol activé",
    ["ma_HoverOnButton"]              = "Mode Lévitation activé",
    ["ma_WhisperOnButton"]            = "Chuchotements activés",
    ["ma_InvisOnButton"]              = "Invisibilité activée",
    ["ma_TaxiOnButton"]               = "Triche Taxi activée",
    ["ma_ShowMapsButton"]             = "Afficher cartes",
    ["ma_HideMapsButton"]             = "Masquer cartes",
    ["ma_instakill"]                  = "Tuer créatures instant.",
    ["ma_ScreenshotButton"]           = "Capture d'écran",
    ["ma_BankButton"]                 = "Banque",
    ["ma_DismountButton"]             = "Descendre",
    ["ma_SetJail_A_Button"]           = "Déf. Prison A",
    ["ma_SetJail_H_Button"]           = "Déf. Prison H",
    ["gridnavigator"]                 = "Navigateur-Grille",
    ["N"]                             = "N", --Abbreviation for North
    ["S"]                             = "S", --Abbreviation for South
    ["E"]                             = "E", --Abbreviation for East
    ["W"]                             = "O", --Abbreviation for West (Ouest)
    ["ma_chatbutton"]                 = "Chat GM activé",
    ["ma_mapsbutton"]                 = "Voir toutes cartes",
    ["ma_waterwalkbutton"]            = "Marche eau activée",
    ["ma_accountlockbutton"]          = "Verrouiller compte",
    ["ma_gmnotify"]                   = "Notifier GM",
    ["ma_gmingame"]                   = "GMs en jeu",
    ["ma_gmlist"]                     = "Liste GM",
    ["ma_petcreate"]                  = "Créer familier",
    ["ma_petlearn"]                   = "Apprendre familier",
    ["ma_petunlearn"]                 = "Désapprendre familier",
    ["ma_pettp"]                      = "TP familier",
    ["ma_lookuptaxi"]                 = "Rechercher Taxi",
    ["ma_gotaxinode"]                 = "Aller TaxiNode",
    ["ma_gotrigger"]                  = "Aller Déclencheur",
    ["ma_goxy"]                       = "Aller XY",
    ["ma_goxyz"]                      = "Aller XYZ",
    ["ma_gozonexy"]                   = "Aller ZoneXY",
    ["ma_lookupzone"]                 = "Rechercher Zone",
    ["ma_cast"]                       = "Lancer",
    ["ma_castback"]                   = "Lancer Retour",
    ["ma_castdist"]                   = "Lancer Distance",
    ["ma_castself"]                   = "Lancer Soi",
    ["ma_casttarget"]                 = "Lancer Cible",
    ["ma_listitem"]                   = "Lister Objet",
    ["ma_GmClear"]                    = "Effacer Params",
    ["ma_acctcreate"]                 = "Créer Compte",
    ["ma_acctdelete"]                 = "Suppr. Compte",
    ["ma_acctaddon"]                  = "Addon Compte",
    ["ma_acctgmlvl"]                  = "Niveau GM",
    ["ma_acctpasswd"]                 = "MdP Compte",
    ["ma_MiniMenuGM"]                 = "Gm",
    ["ma_MiniMenuChar"]               = "Cr",
    ["ma_MiniMenuNPC"]                = "Pn",
    ["ma_MiniMenuGO"]                 = "GO",
    ["ma_MiniMenuTele"]               = "Té",
    ["ma_MiniMenuTicket"]             = "Ti",
    ["ma_MiniMenuMisc"]               = "Di",
    ["ma_MiniMenuServer"]             = "Se",
    ["ma_MiniMenuLog"]                = "Jo",
    ["ma_MiniMenuRevive"]             = "RANIMER!",
  --[[Other]]



--[[Char Tab]]
  --[[Name]]
    ["tabmenu_Char"]                  = "PERSO",
    ["tt_CharButton"]                 = "Ouvrir/Fermer une fenêtre avec des actions spécifiques aux personnages.",
  --[[Tooltips]]
    ["tt_RotateLeft"]                 = "Tourner à gauche.",
    ["tt_RotateRight"]                = "Tourner à droite.",
    ["tt_killbutton"]                 = "Tue la créature/le joueur sélectionné",
    ["tt_reviveplayer"]               = "Ranime le joueur sélectionné",
    ["tt_saveplayer"]                 = "Sauvegarde le personnage du joueur sélectionné",
    ["tt_KickButton"]                 = "Expulse le joueur sélectionné du serveur.",
    ["tt_CooldownButton"]             = "Supprime/expire tous les temps de recharge des sorts sur le personnage sélectionné.",
    ["tt_GUIDButton"]                 = "Affiche le GUID du personnage sélectionné.",
    ["tt_PinfoButton"]                = "Obtenir des informations sur le JOUEUR sélectionné.",
    ["tt_DistanceButton"]             = "Obtenir la distance jusqu'à la créature sélectionnée.",
    ["tt_RecallButton"]               = "Rappelle la créature sélectionnée à sa position avant la dernière téléportation.",
    ["tt_DemorphButton"]              = "Supprime toutes les transformations sur le personnage sélectionné.",
    ["tt_ShowMapsCharButton"]         = "Révèle les cartes pour le personnage sélectionné.",
    ["tt_HideMapsCharButton"]         = "Masque les cartes pour le personnage sélectionné.",
    ["tt_learnlangbutton"]            = "Apprendre les sorts sélectionnés",
    ["tt_modifybutton"]               = "Modifier l'attribut sélectionné par la quantité saisie",
    ["tt_resetbutton"]                = "Réinitialiser l'attribut sélectionné",
    ["tt_modelzoominbutton"]          = "Zoomer sur le modèle sélectionné",
    ["tt_modelzoomoutbutton"]         = "Dézoomer le modèle sélectionné",
    ["tt_charbindsight"]              = "Lie votre vision à l'unité sélectionnée",
    ["tt_charunbindsight"]            = "Délie votre vision de l'unité sélectionnée",
    ["tt_charrename"]                 = "Active le renommage du personnage sélectionné à la prochaine connexion",
    ["tt_charcustomize"]              = "Active la personnalisation du personnage sélectionné à la prochaine connexion",
    ["tt_charchangerace"]             = "Active le changement de race du personnage sélectionné à la prochaine connexion",
    ["tt_charchnagefaction"]          = "Active le changement de faction du personnage sélectionné à la prochaine connexion",
    ["tt_charcombatstop"]             = "Arrête le combat pour le personnage sélectionné (ou vous-même)",
    ["tt_charmaxskill"]               = "Définit les compétences du personnage sélectionné au maximum pour son niveau",
    ["tt_charfreeze"]                 = "Gèle le joueur ciblé et désactive son chat",
    ["tt_charunfreeze"]               = "Dégèle le joueur sélectionné et restaure le chat",
    ["tt_charlistdeleted"]            = "Liste les personnages supprimés dans la fenêtre de chat",
    ["tt_chardeletedrestore"]         = "Paramètres = #guid|$nom [$nouveaunom] [#nouveau compte] [[Cette commande est en développement]",
    ["tt_charpossess"]                = "Possède indéfiniment la créature sélectionnée",
    ["tt_charunpossess"]              = "Cesse de posséder la créature sélectionnée",
    ["tt_charrecall"]                 = "Rappelle le joueur sélectionné à sa dernière position de téléportation",
    ["tt_charrepair"]                 = "Répare l'armure et les armes du joueur sélectionné",
    ["tt_banbutton"]                  = "Paramètres= <account|ip|character> $NomOuIp <-1|xxdyyhzzm> $raison   [[Bannir compte/IP & expulser. -1=ban perma, ou une chaîne comme 4d3h24m16s]]",
    ["tt_gonamebutton"]               = "Paramètre= $nompersonnage  [[Vous téléporte vers le personnage spécifié]]",
    ["tt_createguildbutton"]          = "Paramètres= $NomChefGuilde $NomGuilde  [[Crée une guilde nommée $NomGuilde, avec $NomChefGuilde comme chef]]",
    ["tt_teleaddbutton"]              = "Paramètre= $Nom  [[Ajoute un emplacement de téléportation .tele pour votre position actuelle avec le nom $Nom]]",
    ["tt_baninfobutton"]              = "Paramètre= <account|ip|character>  [[Afficher les détails sur les bannissements du compte/ip/personnage spécifié]]",
    ["tt_groupgobutton"]              = "Paramètre= $nompersonnage   [[Téléporte le personnage spécifié et son groupe à votre emplacement]]",
    ["tt_guildinvitebutton"]          = "Paramètres= $nompersonnage $nomguilde   [[Ajoute $nompersonnage à la guilde $nomguilde]]",
    ["tt_teledelbutton"]              = "Paramètre= $nomtele  [[Supprime l'emplacement nommé $nomtele de la liste des emplacements .tele]]",
    ["tt_banlistbutton"]              = "Paramètres= <account|ip> $NomOuIp   [[Recherche et renvoie les bannissements spécifiques correspondant aux paramètres]]",
    ["tt_namegobutton"]               = "Paramètre= $nompersonnage   [[Téléporte le personnage spécifié à votre emplacement]]",
    ["tt_guildrankbutton"]            = "Paramètres= $nompersonnage #numérorang   [[Définit le personnage spécifié au rang spécifié dans sa guilde]]",
    ["tt_telegroupbutton"]            = "Paramètre= $nomtele  [[Téléporte le personnage **sélectionné** et son groupe vers l'emplacement .tele nommé $nomtele]]",
    ["tt_unbanbutton"]                = "Paramètres= <account|ip|character> $NomOuIp  [[Débannit le compte/IP/personnage spécifié]]",
    ["tt_guilddeletebutton"]          = "Paramètre= $nomguilde  [[Supprime la guilde spécifiée]]",
    ["tt_guilduninvitebutton"]        = "Paramètre= $nompersonnage  [[Expulse le personnage spécifié de sa guilde]]",
    ["tt_telenamebutton"]             = "Paramètres= $nompersonnage $nomtele  [[Téléporte $nompersonnage vers $nomtele]]",
    ["tt_mutebutton"]                 = "Paramètres= $nompersonnage #minutes  [[Désactive le chat pour le compte entier de $nompersonnage pendant #minutes]]",
    ["tt_charmorphbutton"]            = "Paramètres = #DisplayID [[Entrez le DisplayID de la transformation que vous voulez appliquer]]",
    ["tt_charaurabutton"]             = "Paramètres = #AuraID [[Entrez l'AuraID de l'aura que vous voulez appliquer]]",
    ["tt_charunaurabutton"]           = "Paramètres = #AuraID [[Entrez l'AuraID de l'aura que vous voulez retirer]]",
    ["tt_JailAButton"]                = "Paramètre= $nompersonnage [[Envoie le personnage dont le nom apparaît dans cette case à la Prison de l'Alliance]]",
    ["tt_JailHButton"]                = "Paramètre= $nompersonnage [[Envoie le personnage dont le nom apparaît dans cette case à la Prison de la Horde]]",
    ["tt_UnJailButton"]               = "Paramètre= $nompersonnage [[Libère le personnage dont le nom apparaît dans cette case.]]",
    ["tt_UnMuteButton"]               = "Réactive le chat de $joueur.",
    ["tt_QuestAddButton"]             = "Ajoute #questid au joueur **sélectionné**.",
    ["tt_QuestCompleteButton"]        = "Marque #questid comme terminée pour le joueur **sélectionné**.",
    ["tt_QuestRemoveButton"]          = "Retire #questid du joueur **sélectionné**.",
    ["tt_DamageButton"]               = "Paramètre= #montant de dégâts à appliquer à la créature/au joueur **sélectionné**",
    ["tt_HideAreaButton"]             = "Masque #areaid du joueur **sélectionné**.",
    ["tt_ShowAreaButton"]             = "Affiche #areaid au joueur **sélectionné**.",
    ["tt_HonorAddButton"]             = "Ajoute #honorpoints au joueur **sélectionné**.",
    ["tt_HonorUpdateButton"]          = "Aucun paramètre requis. Sauvegarde l'honneur du joueur **sélectionné**.",
  --[[Control Labels]]
    ["ma_KillButton"]                 = "Tuer",
    ["ma_ReviveButton"]               = "Ranimer",
    ["ma_SaveButton"]                 = "Sauvegarder",
    ["ma_KickButton"]                 = "Expulser",
    ["ma_CooldownButton"]             = "Temps recharge",
    ["ma_GUIDButton"]                 = "Afficher GUID",
    ["ma_PinfoButton"]                = "Info JOUEUR",
    ["ma_DistanceButton"]             = "Distance",
    ["ma_RecallButton"]               = "Rappeler",
    ["ma_DemorphButton"]              = "Démorphoser",
    ["ma_ShowMapsCharButton"]         = "Afficher cartes",
    ["ma_HideMapsCharButton"]         = "Masquer cartes",
    ["ma_LearnLangButton"]            = "Toutes langues",
    ["ma_Learn"]                      = "Apprendre",
    ["ma_Modify"]                     = "Modifier",
    ["ma_Reset"]                      = "Réinitialiser",
    ["ma_CharBindsight"]              = "Lier vision",
    ["ma_CharUnBindsight"]            = "Délier vision",
    ["ma_charrename"]                 = "Renommer",
    ["ma_charcustomize"]              = "Personnaliser",
    ["ma_charchangerace"]             = "Changer race",
    ["ma_charchnagefaction"]          = "Changer faction",
    ["ma_charcombatstop"]             = "Arrêter combat",
    ["ma_charmaxskill"]               = "Compétences max",
    ["ma_charfreeze"]                 = "Geler",
    ["ma_charunfreeze"]               = "Dégeler",
    ["ma_charlistdeleted"]            = "Liste perso suppr.",
    ["ma_chardeletedrestore"]         = "Restaurer perso suppr.",
    ["ma_charpossess"]                = "Posséder",
    ["ma_charunpossess"]              = "Dé-posséder",
    ["ma_charrecall"]                 = "Rappeler",
    ["ma_charrepair"]                 = "Réparer",
    ["ma_banbutton"]                  = "Bannir",
    ["ma_gonamebutton"]               = "Apparaître",
    ["ma_createguildbutton"]          = "G Créer",
    ["ma_teleaddbutton"]              = "Télé Ajouter",
    ["ma_baninfobutton"]              = "Info ban",
    ["ma_groupgobutton"]              = "Groupe invoq.",
    ["ma_guildinvitebutton"]          = "G Inviter",
    ["ma_teledelbutton"]              = "Télé Suppr.",
    ["ma_banlistbutton"]              = "Liste ban",
    ["ma_namegobutton"]               = "Invoquer",
    ["ma_guildrankbutton"]            = "G Rang",
    ["ma_telegroupbutton"]            = "Télé groupe",
    ["ma_unbanbutton"]                = "Débannir",
    ["ma_guilddeletebutton"]          = "G Supprimer",
    ["ma_guilduninvitebutton"]        = "G Désinviter",
    ["ma_telenamebutton"]             = "Télé nom",
    ["ma_mutebutton"]                 = "Rendre muet",
    ["ma_Aura"]                       = "Aura",
    ["ma_UnAura"]                     = "Retirer aura",
    ["ma_Morph"]                      = "Morphose",
    ["ma_JailAButton"]                = "Prison (A)",
    ["ma_JailHButton"]                = "Prison (H)",
    ["ma_UnJailButton"]               = "Libérer prison",
    ["ma_UnMuteButton"]               = "Rendre parole",
    ["ma_QuestAddButton"]             = "Ajouter quête",
    ["ma_QuestCompleteButton"]        = "Terminer quête",
    ["ma_QuestRemoveButton"]          = "Retirer quête",
    ["ma_DamageButton"]               = "Dégâts",
    ["ma_HideAreaButton"]             = "Masquer zone",
    ["ma_ShowAreaButton"]             = "Afficher zone",
    ["ma_HonorAddButton"]             = "Ajouter honneur",
    ["ma_HonorUpdateButton"]          = "MàJ honneur",
    ["ma_CharRotateLeft"]             = "<<=",
    ["ma_CharRotateRight"]            = "=>>",
    ["ma_CharZoomIn"]                 = "+",
    ["ma_CharZoomOut"]                = "-",
  --[[Other]]
    ["ma_LevelUp"]                    = "Monter niveau",
    ["ma_LevelDown"]                  = "Baisser niveau",
    ["ma_Money"]                      = "Argent",
    ["ma_Energy"]                     = "Énergie",
    ["ma_Rage"]                       = "Rage",
    ["ma_Mana"]                       = "Mana",
    ["ma_Healthpoints"]               = "Points de vie",
    ["ma_Talents"]                    = "Talents",
    ["ma_Stats"]                      = "Stats",
    ["ma_Spells"]                     = "Sorts",
    ["ma_Honor"]                      = "Honneur",
    ["ma_Level"]                      = "Niveau",
    ["ma_AllLang"]                    = "Toutes langues",
    ["ma_AllGMSpells"]                = "Tous sorts GM",
    ["ma_AllCrafts"]                  = "Tous métiers",
    ["ma_AllDefault"]                 = "Tout par défaut",
    ["ma_AllMyClass"]                 = "Toute ma classe",
    ["ma_AllMyPetTalents"]            = "Tous talents familier",
    ["ma_AllMySpells"]                = "Tous mes sorts",
    ["ma_AllMyTalents"]               = "Tous mes talents",
    ["ma_AllRecipesAlchemy"]          = "Toutes recettes (Alchimie)",
    ["ma_AllRecipesBlacksmithing"]    = "Toutes recettes (Forge)",
    ["ma_AllRecipesCooking"]          = "Toutes recettes (Cuisine)",
    ["ma_AllRecipesEnchanting"]       = "Toutes recettes (Enchantement)",
    ["ma_AllRecipesEngineering"]      = "Toutes recettes (Ingénierie)",
    ["ma_AllRecipesFirstAid"]         = "Toutes recettes (Premiers soins)",
    ["ma_AllRecipesInscription"]      = "Toutes recettes (Calligraphie)",
    ["ma_AllRecipesJewelcrafting"]    = "Toutes recettes (Joaillerie)",
    ["ma_AllRecipesLeatherworking"]   = "Toutes recettes (Travail du cuir)",
    ["ma_AllRecipesTailoring"]        = "Toutes recettes (Couture)",
    ["ma_resetallspells"]             = "Sorts pour TOUS",
    ["ma_resetalltalents"]            = "Talents pour TOUS",
    ["ma_achievements"]               = "Hauts faits",
    ["ma_AllSpeeds"]                  = "Toutes vitesses",
    ["ma_Arena"]                      = "Arène",
    ["ma_BackWalk"]                   = "Marche arrière",
    ["ma_Drunk"]                      = "Ivre",
    ["ma_FlySpeed"]                   = "Vitesse vol",
    ["ma_Gender"]                     = "Sexe",
    ["ma_MountSpeed"]                 = "Vitesse monture",
    ["ma_Phase"]                      = "Phase",
    ["ma_RunicPower"]                 = "Puiss. runique",
    ["ma_Speed"]                      = "Vitesse",
    ["ma_StandState"]                 = "État posture",
    ["ma_SwimSpeed"]                  = "Vitesse nage",
    ["ma_TalentPoints"]               = "Points de talent",
    -- languages
    ["Common"]                        = "Commun",
    ["Orcish"]                        = "Orc",
    ["Taurahe"]                       = "Taurahe",
    ["Darnassian"]                    = "Darnassien",
    ["Dwarvish"]                      = "Nain",
    ["Thalassian"]                    = "Thalassien",
    ["Demonic"]                       = "Démoniaque",
    ["Draconic"]                      = "Draconique",
    ["Titan"]                         = "Titan",
    ["Kalimag"]                       = "Kalimag",
    ["Gnomish"]                       = "Gnome",
    ["Troll"]                         = "Trollien",
    ["Gutterspeak"]                   = "Guttural",
    ["Draenei"]                       = "Draeneï",



--[[NPC Tab]]
  --[[Name]]
    ["tabmenu_NPC"]                   = "PNJ",
    ["tt_NpcButton"]                  = "Ouvrir/Fermer une fenêtre avec les fonctions relatives aux PNJ.",
  --[[Tooltips]]
    ["tt_NPCRotateLeft"]              = "Tourner à gauche",
    ["tt_NPCRotateRight"]             = "Tourner à droite",
    ["tt_NPCKillButton"]              = "Tue la cible sélectionnée",
    ["tt_npcrespawn"]                 = "Fait réapparaître la créature sélectionnée, ou si aucune n'est sélectionnée, toutes les créatures à proximité",
    ["tt_NPCDistanceButton"]          = "Obtenir la distance jusqu'à la créature sélectionnée.",
    ["tt_NPCGUIDButton"]              = "Affiche le GUID du personnage sélectionné.",
    ["tt_NPCInfoButton"]              = "Obtenir des informations sur le PNJ sélectionné.",
    ["tt_NPCDemorph"]                 = "Démorphose le PNJ sélectionné",
    ["tt_NPCMove"]                    = "Déplace la créature sélectionnée à votre emplacement",
    ["tt_NPCDel"]                     = "Supprime la créature sélectionnée",
    ["tt_getguid"]                    = "Obtient le GUID et l'ID de la créature sélectionnée",
    ["tt_NPCClear"]                   = "Efface tous les champs d'info PNJ (GUID, ID PNJ, ID affichage, Distance)",
    ["tt_NPCAdd"]                     = "Ajoute une copie de ce PNJ à votre emplacement actuel.",
    ["tt_NPCGo"]                      = "Vous téléporte vers le PNJ dans la boîte GUID",
    ["tt_NPCMorph"]                   = "Paramètres = #DisplayID [[Entrez le DisplayID de la transformation que vous voulez appliquer]]",
    ["tt_NPCSay"]                     = "Fait dire [paramètres] au PNJ sélectionné",
    ["tt_NPCYell"]                    = "Fait crier [paramètres] au PNJ sélectionné",
    ["tt_NPCAura"]                    = "Paramètres = #AuraID [[Entrez l'AuraID de l'aura que vous voulez appliquer]]",
    ["tt_NPCUnaura"]                  = "Paramètres = #AuraID [[Entrez l'AuraID de l'aura que vous voulez retirer]]",
    ["tt_PlayEmote"]                  = "Jouer l'émote de la liste à gauche",
    ["tt_GPSButton"]                  = "Affiche les coordonnées du personnage sélectionné.",
    ["tt_DisplayUp"]                  = "Incrémenter le DisplayID du PNJ de 1",
    ["tt_DisplayDown"]                = "Décrémenter le DisplayID du PNJ de 1",
    ["tt_IDUp"]                       = "Incrémenter l'ID du PNJ de 1",
    ["tt_IDDown"]                     = "Décrémenter l'ID du PNJ de 1",
    ["tt_npcmodelzoominbutton"]       = "Zoomer sur le modèle sélectionné",
    ["tt_npcmodelzoomoutbutton"]      = "Dézoomer le modèle sélectionné",
    ["tt_npcbindsight"]               = "Lie votre vision au PNJ sélectionné",
    ["tt_npcunbindsight"]             = "Délie votre vision du PNJ sélectionné",
    ["tt_npccometome"]                = "Force le PNJ sélectionné à venir à votre emplacement. L'emplacement N'est PAS enregistré en BDD.",
    ["tt_npcpossess"]                 = "Possède indéfiniment la créature sélectionnée",
    ["tt_npcunpossess"]               = "Cesse de posséder la créature sélectionnée",
    ["tt_NPCFreezeButton"]            = "Arrête le mouvement du PNJ sélectionné, en sauvegardant les points de passage",
    ["tt_NPCFreezeDelButton"]         = "Arrête le mouvement du PNJ sélectionné, SANS sauvegarder les points de passage",
    ["tt_WayEndAdd"]                  = "Ajoute un point de passage à la fin de la pile existante",
    ["tt_NPCAddWay"]                  = "Ajoute un point de passage à la pile. Le GUID de la créature doit être dans la boîte ci-dessous",
    ["tt_WayMAdd"]                    = "Ajoute un point de passage à la pile de mouvements existante de la créature sélectionnée",
    ["tt_WayModifyDel"]               = "Supprime le point de passage sélectionné de la pile de mouvements existante de la créature",
    ["tt_WayShow0"]                   = "Arrête d'afficher les points de passage pour la créature sélectionnée.",
    ["tt_WayShow1"]                   = "Afficher les points de passage pour la créature sélectionnée.",
    ["tt_NPCAdd_WayShowOn"]           = "affiche les points de passage pour la créature sélectionnée",
    ["tt_NPCUnFreeze_RandomButton"]   = "Permet le mouvement aléatoire du PNJ sélectionné.",
    ["tt_NPCUnFreeze_WayButton"]      = "Permet le mouvement par points de passage du PNJ sélectionné.",
    ["tt_MoveStackButton"]            = "Affiche la pile de mouvements du personnage sélectionné.",
  --[[Control Labels]]
    ["Morph"]                         = "Morphose",
    ["ma_NPCKillButton"]              = "Tuer",
    ["ma_Respawn"]                    = "Réapparaître",
    ["ma_NPCDistanceButton"]          = "Distance",
    ["ma_NPCGUIDButton"]              = "Afficher GUID",
    ["ma_NPCInfoButton"]              = "Info PNJ",
    ["ma_NPCDemorph"]                 = "Démorphoser",
    ["ma_NPCMove"]                    = "Déplacer PNJ",
    ["ma_NPCDel"]                     = "Supprimer PNJ",
    ["ma_getguid"]                    = "Obtenir GUID",
    ["ma_NPCAdd"]                     = "Ajouter PNJ",
    ["ma_NPCGo"]                      = "Aller au PNJ",
    ["ma_NPCMorph"]                   = "Morphose",
    ["ma_NPCSay"]                     = "PNJ Dire",
    ["ma_NPCYell"]                    = "PNJ Crier",
    ["ma_NPCAura"]                    = "Aura PNJ",
    ["ma_NPCUnAura"]                  = "Retirer aura PNJ",
    ["ma_PlayEmote1"]                 = "Émote",
    ["ma_PlayEmote2"]                 = "Émote",
    ["ma_DistanceBox"]                = "Distance",
    ["ma_NPCBindsight"]               = "Lier vision",
    ["ma_NPCUnBindsight"]             = "Délier vision",
    ["ma_NPCComeToMe"]                = "Venir à moi",
    ["ma_npcpossess"]                 = "Posséder",
    ["ma_npcunpossess"]               = "Dé-posséder",
    ["ma_WayShow1"]                   = "Afficher points",
    ["ma_WayShow0"]                   = "Masquer points",
    ["ma_MoveStackButton"]            = "Afficher mouvts",
    ["ma_NPCFreezeButton"]            = "PNJ immobile",
    ["ma_WayAllDel"]                  = "PNJ immobile suppr.",
    ["ma_WayMAdd"]                    = "Ajouter point M",
    ["ma_NPCUnFreeze_RandomButton"]   = "Mouv aléatoire",
    ["ma_NPCUnFreeze_WayButton"]      = "Mouv points",
    ["ma_WayMDel"]                    = "Suppr point M",
    ["ma_WayEndAdd"]                  = "Ajouter point fin",
    ["ma_WayAdd"]                     = "Ajouter point",
    ["ma_WayShow"]                    = "Afficher points",
    ["ma_NPCRotateLeft"]              = "<<=",
    ["ma_NPCRotateRight"]             = "=>>",
    ["ma_NPCZoomIn"]                  = "+",
    ["ma_NPCZoomOut"]                 = "-",
    ["ma_NPCDisplayIDLabel"]          = "ID affichage :",
    ["ma_NPCIDLabel"]                 = "ID PNJ :",
    ["ma_NPCGUIDLabel"]               = "GUID :",
    ["ma_NPCDisplayDown"]             = "<<",
    ["ma_NPCDisplayUp"]               = ">>",
    ["ma_NPCIDUp"]                    = ">>",
    ["ma_NPCClearButton"]             = "Effacer",
  --[[Other]]



--[[GObjects Tab]]
  --[[Name]]
    ["tabmenu_GO"]                    = "OBJ",
    ["tt_GOButton"]                   = "Ouvrir/Fermer une fenêtre avec les fonctions d'objets de jeu.",
  --[[Tooltips]]
    ["tt_ObjGo"]                      = "Aller à l'objet sélectionné",
    ["tt_ObjAdd"]                     = "Ajouter une copie de l'objet ciblé à votre emplacement et orientation",
    ["tt_ObjMove"]                    = "Déplacer l'objet ciblé à votre emplacement",
    ["tt_ObjTurn"]                    = "Tourne l'objet ciblé pour correspondre à votre orientation",
    ["tt_ObjDel"]                     = "Supprime l'objet ciblé",
    ["tt_ObjNear"]                    = "Renvoie des informations sur les objets proches de vous",
    ["tt_ObjTarget"]                  = "Cible l'objet le plus proche et affiche les informations",
    ["tt_ObjActivate"]                = "Active l'objet ciblé",
    ["tt_ObjAddTemp"]                 = "Ajoute une copie temporaire de l'objet",
    ["tt_ObjInfo"]                    = "Obtient des informations détaillées sur l'objet",
    ["tt_ObjSetPhase"]                = "Définit la phase de l'objet",
    ["tt_ObjShowModel"]               = "Charger et afficher le modèle",
    ["tt_ObjUnloadModel"]             = "Décharger les modèles pour libérer la mémoire",
    ["tt_ObjMoveForward"]             = "Avancer",
    ["tt_ObjMoveBack"]                = "Reculer",
    ["tt_ObjMoveLeft"]                = "Aller à gauche",
    ["tt_ObjMoveRight"]               = "Aller à droite",
    ["tt_ObjMoveUp"]                  = "Monter",
    ["tt_ObjMoveDown"]                = "Descendre",
    ["tt_ObjSpawnHere"]               = "Faire apparaître ici",
  --[[Control Labels]]
    ["ma_OBJGo"]                      = "Aller obj",
    ["ma_OBJAdd"]                     = "Ajouter obj",
    ["ma_OBJMove"]                    = "Déplacer obj",
    ["ma_OBJTurn"]                    = "Tourner obj",
    ["ma_OBJDel"]                     = "Suppr obj",
    ["ma_OBJNear"]                    = "Obj proches",
    ["ma_OBJTarget"]                  = "Cibler obj",
    ["ma_OBJActivate"]                = "Activer obj",
    ["ma_OBJAddTemp"]                 = "Ajout obj temp",
    ["ma_OBJInfo"]                    = "Info obj",
    ["ma_OBJSetPhase"]                = "Phase obj",
    ["ma_GOGUIDLabel"]                = "GUID",
    ["ma_GOEntryIDLabel"]             = "ID entrée",
    ["ma_GODisplayIDLabel"]           = "ID affichage",
    ["ma_GORangeLabel"]               = "Portée",
    ["ma_GOAddOnMoveLabel"]           = "Ajouter au mouvement",
    ["ma_GOMoveOnMoveLabel"]          = "Déplacer au mouvement",
    ["ma_GOMoveDistancesLabel"]       = "Distances de mouvement",
    ["ma_GOFwdBackLabel"]             = "Avant/Arrière :",
    ["ma_GOLeftRightLabel"]           = "Gauche/Droite :",
    ["ma_GOUpDownLabel"]              = "Haut/Bas :",
    ["ma_GORotateLeft"]               = "<<",
    ["ma_GORotateRight"]              = ">>",
    ["ma_GOZoomIn"]                   = "+",
    ["ma_GOZoomOut"]                  = "-",
    ["ma_GOMoveForward"]              = "AVANT",
    ["ma_GOMoveLeft"]                 = "GAUCHE",
    ["ma_GOMoveRight"]                = "DROITE",
    ["ma_GOMoveBack"]                 = "ARRIÈRE",
    ["ma_GOSpawnHere"]                = "ICI",
    ["ma_GOMoveUp"]                   = "HAUT",
    ["ma_GOMoveDown"]                 = "BAS",
    ["ma_GOShowButton"]               = "Afficher",
    ["ma_GOUnloadButton"]             = "Décharger",
  --[[Other]]
    ["msg_toggle_maps_confirm"]       = "Êtes-vous sûr de vouloir basculer toutes les cartes ? Cela peut geler le client pendant quelques secondes.",
    ["msg_account_lock_confirm"]      = "Êtes-vous sûr de vouloir %s ce compte ?",
    ["msg_acct_create_confirm"]       = "Êtes-vous sûr de vouloir créer le compte '%s' ?",
    ["msg_acct_delete_confirm"]       = "Êtes-vous sûr de vouloir SUPPRIMER le compte '%s' ?",
    ["msg_tele_del_confirm"]          = "Êtes-vous sûr de vouloir supprimer la destination de téléportation '%s' ?",



--[[Tele Tab]]
  --[[Name]]
    ["tabmenu_Tele"]                  = "TÉLÉ",
    ["tt_TeleButton"]                 = "Ouvrir/Fermer une fenêtre avec les fonctions de téléportation.",
  --[[Tooltips]]
  --[[Control Labels]]
    ["Zone"]                          = "|cFF00FF00Zone :|r ",
    ["ma_ContinentSelection"]         = "Sélection du continent",
    ["ma_EasternKingdomsN"]           = "Royaumes de l'Est (N)",
    ["ma_EasternKingdomsS"]           = "Royaumes de l'Est (S)",
    ["ma_Kalimdor"]                   = "Kalimdor",
    ["ma_Outland"]                    = "Outreterre",
    ["ma_NorthrendAlliance"]          = "Norfendre-Alliance",
    ["ma_NorthrendHorde"]             = "Norfendre-Horde",
    ["ma_BattlegroundsArenas"]        = "Champs de bataille/Arènes",
    ["ma_InstancesEastern"]           = "Instances : Est",
    ["ma_InstancesKalimdor"]          = "Instances : Kalimdor",
    ["ma_InstancesOutland"]           = "Instances : Outreterre",
    ["ma_InstancesNorthrend"]         = "Instances : Norfendre",
    ["ma_Other"]                      = "Autre",
    ["ma_ZoneSelection"]              = "Sélection de zone",
    ["ma_SelectedSubzone"]            = "Sous-zone sélectionnée",
  --[[Other]]
    ["ma_NoZones"]                    = "Aucune zone !",
    ["ma_NoSubZones"]                 = "Aucune sous-zone !",



--[[Tickets Tab]]
  --[[Name]]
    ["tabmenu_ticket"]                = "TICKETS",
    ["tt_TicketButton"]               = "Ouvrir/Fermer une fenêtre qui affiche tous les tickets et vous permet de les administrer.",
  --[[Tooltips]]
    ["tt_TicketOn"]                   = "Annoncer les nouveaux tickets.",
    ["tt_TicketOff"]                  = "Ne pas annoncer les nouveaux tickets.",
    ["tt_ResetTickets"]               = "Réinitialiser les tickets chargés",
    ["tt_LoadAllTickets"]             = "Charger tous les tickets",
    ["tt_LoadOnlineTickets"]          = "Charger les tickets des joueurs en ligne",
    ["tt_DeleteTicket"]               = "Fermer le ticket et le retirer de la liste",
    ["tt_AnswerTicket"]               = "Répondre au ticket",
    ["tt_GetCharTicket"]              = "Invoquer le personnage du ticket",
    ["tt_GoCharTicket"]               = "Aller au personnage du ticket",
    ["tt_WhisperTicket"]              = "Chuchoter au personnage du ticket",
    ["tt_GoTicket"]                   = "Aller à l'emplacement du ticket",
    ["tt_ShowTickets"]                = "Afficher les tickets chargés",
  --[[Control Labels]]
    ["ma_ticketidlabel"]              = "|cFF00FF00Ticket :",
    ["ma_ticketcreatedbylabel"]       = "|cFF00FF00Créé par :",
    ["ma_tickettimecreatedlabel"]     = "|cFF00FF00Créé le :",
    ["ma_ticketlastchangelabel"]      = "|cFF00FF00Dernier changement :",
    ["ma_ticketmessagelabel"]         = "|cFF00FF00Message du ticket :",
    ["ma_LoadTicketsButton"]          = "Actualiser",
    ["ma_GetCharTicketButton"]        = "Invoquer",
    ["ma_GoCharTicketButton"]         = "Aller joueur",
    ["ma_AnswerButton"]               = "Courrier",
    ["ma_DeleteButton"]               = "Fermer",
    ["ma_ticketwhisperbutton"]        = "Chuchoter",
    ["ma_TicketCount"]                = "|cFF00FF00Tickets :|r ",
    ["ma_TicketsNoNew"]               = "Vous n'avez aucun nouveau ticket.",
    ["ma_TicketsNewNumber"]           = "Vous avez |cffeda55f%s|r nouveaux tickets !",
    ["ma_TicketsGoLast"]              = "Aller au créateur du dernier ticket (%s).",
    ["ma_TicketsGetLast"]             = "Amener %s à vous.",
    ["ma_TicketsInfoPlayer"]          = "|cFF00FF00Joueur :|r ",
    ["ma_TicketsInfoStatus"]          = "|cFF00FF00Statut :|r ",
    ["ma_TicketsInfoAccount"]         = "|cFF00FF00Compte :|r ",
    ["ma_TicketsInfoAccLevel"]        = "|cFF00FF00Niveau du compte :|r ",
    ["ma_TicketsInfoLastIP"]          = "|cFF00FF00Dernière IP :|r ",
    ["ma_TicketsInfoPlayedTime"]      = "|cFF00FF00Temps de jeu :|r ",
    ["ma_TicketsInfoLevel"]           = "|cFF00FF00Niveau :|r ",
    ["ma_TicketsInfoMoney"]           = "|cFF00FF00Argent :|r ",
    ["ma_TicketsInfoLatency"]         = "|cFF00FF00Latence :|r ",
    ["ma_TicketsNoInfo"]              = "Aucune information disponible",
    ["ma_TicketsNotLoaded"]           = "Aucun ticket chargé...",
    ["ma_TicketsNoTickets"]           = "Aucun ticket disponible !",
    ["ma_TicketResetButton"]          = "RÉINIT.",
    ["ma_TicketLoadAllButton"]        = "Charger tout",
    ["ma_TicketLoadOnlineButton"]     = "Charger en ligne",
    ["ma_TicketShowButton"]           = "AFFICHER",
    ["ma_TicketGoButton"]             = "Aller ticket",
    ["ma_TicketTicketLoaded"]         = "|cFF00FF00Ticket chargé N° :|r %s\n\nInformations du joueur\n\n",
    ["ma_Reload"]                     = "Recharger",
    ["ma_LoadMore"]                   = "Charger plus...",
  --[[Other]]



--[[Misc Tab]]
  --[[Name]]
    ["tabmenu_Misc"]                  = "DIVERS",
    ["tt_MiscButton"]                 = "Ouvrir/Fermer une fenêtre avec des actions diverses.",
  --[[Tooltips]]
    ["tt_FrmTrSlider"]                = "Modifier la transparence de la fenêtre",
    ["tt_BtnTrSlider"]                = "Modifier la transparence des boutons",
    ["tt_windowismovable"]            = "Autoriser une fenêtre déplaçable",
    ["tt_updatechanges"]              = "Appliquer les modifications apportées aux paramètres. Recharge l'UI.",
  --[[Control Labels]]
    ["cmd_toggle"]                    = "Basculer la fenêtre principale",
    ["cmd_transparency"]              = "Basculer la transparence de base (0.5 ou 1.0)",
    ["cmd_tooltip"]                   = "Basculer l'affichage des info-bulles de bouton ou non",
    ["ma_EnableTransparency"]         = "Activer la transparence",
    ["ma_EnableLocalizedSearch"]      = "Activer les chaînes de recherche localisées",
    ["ma_EnableMinimenu"]             = "Activer le minimenu/barre d'outils",
    ["ma_EnableTooltips"]             = "Activer les info-bulles",
    ["ma_ShowChatOutput"]             = "Afficher la sortie du chat",
    ["ma_ShowMinimapButton"]          = "Afficher le bouton de la minicarte",
    ["ma_FrameStrataLabel"]           = "Niveau de strate de fenêtre :",
    ["ma_FrameStrataBackground"]      = "Arrière-plan",
    ["ma_FrameStrataLow"]             = "Bas",
    ["ma_FrameStrataMedium"]          = "Moyen (Par défaut)",
    ["ma_FrameStrataHigh"]            = "Haut",
    ["ma_FrameStrataDialog"]          = "Dialogue",
    ["ma_FrameStrataFullscreen"]      = "Plein écran",
    ["ma_FrameStrataFullscreenDialog"] = "Dialogue Plein écran",
    ["ma_UpdateFrequencyLabel"]       = "Spécifie la fréquence de mise à jour du graphique Diff dans l'onglet Serveur.\n10000 = ~1 minute, 50000 = ~5 minutes",
    ["ma_BackgroundColorLabel"]       = "Couleur de fond",
    ["ma_FrameColorLabel"]            = "Couleur de cadre",
    ["ma_ButtonColorLabel"]           = "Couleur de bouton",
    ["ma_LinkifierColorLabel"]        = "MangLinkifier",
    ["ma_UpdateChangesButton"]        = "Appliquer les modifications",
  --[[Other]]
    ["ma_ApplyWeatherButton"]         = "Appliquer la météo",
    ["ma_WeatherFine"]                = "Beau",
    ["ma_WeatherFog"]                 = "Brouillard",
    ["ma_WeatherRain"]                = "Pluie",
    ["ma_WeatherSnow"]                = "Neige",
    ["ma_WeatherSand"]                = "Sable",
    ["msg_transparency_saved"]        = "|cff00ff00AzerothAdmin:|r Paramètre de transparence sauvegardé. Appliquez les modifications ou rechargez l'UI pour l'appliquer.",
    ["msg_localsearch_saved"]         = "|cff00ff00AzerothAdmin:|r Paramètre des chaînes de recherche localisées sauvegardé. Appliquez les modifications ou rechargez l'UI pour l'appliquer.",
    ["msg_minimenu_saved"]            = "|cff00ff00AzerothAdmin:|r Paramètre du minimenu sauvegardé.",
    ["msg_tooltip_saved"]             = "|cff00ff00AzerothAdmin:|r Paramètre des info-bulles sauvegardé. Appliquez les modifications ou rechargez l'UI pour l'appliquer.",
    ["msg_chatoutput_saved"]          = "|cff00ff00AzerothAdmin:|r Paramètre de sortie du chat sauvegardé.",



--[[Server Tab]]
    ["tabmenu_server"]                = "SERVEUR",
    ["tt_ServerButton"]               = "Afficher plusieurs informations sur le serveur et effectuer des actions concernant le serveur.",
  --[[Tooltips]]
    ["tt_AnnounceButton"]             = "Annoncer un message système.",
    ["tt_ShutdownButton"]             = "Arrêter le serveur dans le nombre de secondes du champ, si omis arrête immédiatement !",
    ["tt_CancelShutdownButton"]       = "Annuler le compte à rebours d'arrêt du serveur.",
  --[[Control Labels]]
    ["ma_AnnounceButton"]             = "Annoncer",
    ["ma_ShutdownButton"]             = "Arrêt serveur",
    ["ma_CancelShutdownButton"]       = "Annuler arrêt",
    ["ma_ReloadTableButton"]          = "Recharger table",
    ["ma_ReloadScriptsButton"]        = "Recharger scripts",
    ["ma_ServerLatencyLabel"]         = "|cFF00FF00^Latence serveur :|r",
    ["ma_UpdateDiffLabel"]            = "|cFF00FF00^Diff. de mise à jour :|r",
    ["ma_MeanLabel"]                  = "|cFF00FF00Moyenne :|r",
    ["ma_MedianLabel"]                = "|cFF00FF00Médiane :|r",
    ["ma_PercentilesLabel"]           = "|cFF00FF00Percentiles :|r",
  --[[Other]]
    ["msg_shutdown_time_required"]    = "Veuillez entrer le temps en secondes avant d'utiliser l'arrêt du serveur.",
    ["msg_shutdown_confirm"]          = "Êtes-vous sûr de vouloir arrêter le serveur dans %s secondes ?",



  --[[Tooltips]]
  --[[Control Labels]]
  --[[Other]]



--[[Pop UPs]]
  --[[General]]
  --[[ToolTips]]
    ["tt_ItemButton"]                 = "Ouvrir/Fermer une fenêtre popup avec la fonction de recherche d'objets et de gestion de vos favoris.",
    ["tt_ItemSetButton"]              = "Ouvrir/Fermer une fenêtre popup avec la fonction de recherche de sets d'objets et de gestion de vos favoris.",
    ["tt_SpellButton"]                = "Ouvrir/Fermer une fenêtre popup avec la fonction de recherche de sorts et de gestion de vos favoris.",
    ["tt_QuestButton"]                = "Ouvrir/Fermer une fenêtre popup avec la fonction de recherche de quêtes et de gestion de vos favoris.",
    ["tt_CreatureButton"]             = "Ouvrir/Fermer une fenêtre popup avec la fonction de recherche de créatures et de gestion de vos favoris.",
    ["tt_ObjectButton"]               = "Ouvrir/Fermer une fenêtre popup avec la fonction de recherche d'objets et de gestion de vos favoris.",
    ["tt_SearchDefault"]              = "Vous pouvez maintenant entrer un mot-clé et lancer la recherche.",
    ["tt_SkillButton"]                = "Ouvrir/Fermer une fenêtre popup avec la fonction de recherche de compétences et de gestion de vos favoris.",
  --[[Labels]]
    ["ma_PopupErrorTab"]              = "ERREUR",
    ["ma_PopupFavoritesTab"]          = "Favoris",
    ["ma_PopupTab3"]                  = "Onglet 3",
    ["ma_PopupAmountLabel"]           = "Quantité :",
    ["ma_PopupInvisibleText"]         = "Invisible",
    ["ma_ItemButton"]                 = "Recherche-Objet",
    ["ma_ItemSetButton"]              = "Recherche-Set",
    ["ma_SpellButton"]                = "Recherche-Sort",
    ["ma_QuestButton"]                = "Recherche-Quête",
    ["ma_CreatureButton"]             = "Recherche-Créature",
    ["ma_ObjectButton"]               = "Recherche-Objet",
    ["ma_TeleSearchButton"]           = "Recherche-Télé",
    ["ma_MailRecipient"]              = "Destinataire",
    ["ma_Mail"]                       = "Envoyer courrier",
    ["ma_Send"]                       = "Envoyer",
    ["ma_MailSubject"]                = "Sujet",
    ["ma_MailYourMsg"]                = "Votre message ici !",
    ["ma_SearchButton"]               = "Rechercher...",
    ["ma_ResetButton"]                = "Réinitialiser",
    ["ma_FavAdd"]                     = "Ajouter sélection",
    ["ma_FavRemove"]                  = "Retirer sélection",
    ["ma_SelectAllButton"]            = "Tout sélectionner",
    ["ma_DeselectAllButton"]          = "Tout désélectionner",
    ["ma_MailBytesLeft"]              = "Octets restants : ",
    ["ma_SkillButton"]                = "Recherche-Compétence",
    ["ma_SkillVar1Button"]            = "Compétence",
    ["ma_SkillVar2Button"]            = "Compétence max",
    ["ma_ItemVar1Button"]             = "Quantité",
    ["ma_ObjectVar1Button"]           = "Modèle de butin",
    ["ma_ObjectVar2Button"]           = "Temps d'apparition",
    ["ma_NoFavorites"]                = "Il n'y a actuellement aucun favori sauvegardé !",
    ["favoriteResults"]               = "|cFF00FF00Favoris :|r ",



    ["ma_LearnAllButton"]             = "Tous les sorts",
    ["ma_LearnCraftsButton"]          = "Toutes les professions et recettes",
    ["ma_LearnGMButton"]              = "Sorts GM par défaut",
    ["ma_LearnClassButton"]           = "Tous les sorts de classe",
    ["ma_GPSButton"]                  = "GPS",
    ["ma_Online"]                     = "En ligne",
    ["ma_Offline"]                    = "Hors ligne",



--[[Linkifier]]
    ["lfer_Spawn"]                    = "Faire apparaître",
    ["lfer_List"]                     = "Lister",
    ["lfer_Reload"]                   = "Recharger",
    ["lfer_Goto"]                     = "Aller à",
    ["lfer_Move"]                     = "Déplacer",
    ["lfer_Turn"]                     = "Tourner",
    ["lfer_Delete"]                   = "Supprimer",
    ["lfer_Teleport"]                 = "Téléporter",
    ["lfer_Morph"]                    = "Morphose",
    ["lfer_Add"]                      = "Ajouter",
    ["lfer_Remove"]                   = "Retirer",
    ["lfer_Learn"]                    = "Apprendre",
    ["lfer_Unlearn"]                  = "Désapprendre",
    ["lfer_Error"]                    = "Erreur : chaîne de recherche correspondante mais une erreur s'est produite ou type introuvable"

}
  for k,v in pairs(translations) do L[k] = v end
end
