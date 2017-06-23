local L = LibStub( "AceLocale-3.0" ):NewLocale( "ArkInventory", "frFR" )
if not L then return end

-- post updated translations at http://groups.google.com/group/wow-arkinventory (modify this file and include as an attachment)
-- note: when creating a new locale do not leave any english translations in your file, comment them out by placing -- at the start of the line


-- Translated by: Mahrak











--	wow zone names - must match exactly what is in game
--	L["WOW_ZONE_AHNQIRAJ"] = ""
--	L["WOW_ZONE_VASHJIR"] = ""
	L["WOW_ZONE_KELPTHAR_FOREST"] = "Forêt de Varech'thar"
	L["WOW_ZONE_SHIMMERING_EXPANSE"] = "Étendues Chatoyantes"
	L["WOW_ZONE_ABYSSAL_DEPTHS"] = "Profondeurs Abyssales"
	
	
--	wow tooltip text - must match exactly what is in game
	L["WOW_ITEM_TOOLTIP_FOOD"] = "Vous devez rester assis pendant que vous mangez"
	L["WOW_ITEM_TOOLTIP_DRINK"] = "Vous devez rester assis pendant que vous buvez"
	L["WOW_ITEM_TOOLTIP_POTION_HEAL"] = "Rend %d+ point de vie en %d+ sec"
	L["WOW_ITEM_TOOLTIP_POTION_MANA"] = "Rend %d+ point de mana en %d+ sec"
	L["WOW_ITEM_TOOLTIP_ELIXIR_BATTLE"] = "Elixir de bataille"
	L["WOW_ITEM_TOOLTIP_ELIXIR_GUARDIAN"] = "Elixir du gardien"
	
	
--	location names
--	L["LOCATION_ACCOUNT"] = ""
	L["LOCATION_WEARING"] = "Vêtements"
	
	
--	subframe names
	L["SUBFRAME_NAME_TITLE"] = "Titre"
	L["SUBFRAME_NAME_BAGCHANGER"] = "Echangeur de sac"
	
	
-- status bar/bag text
	L["STATUS_NO_DATA"] = "Aucune information"
	L["STATUS_PURCHASE"] = "Acheté"
	
	
--	restack
	L["RESTACK"] = "Empiler les objets"
	L["RESTACK_TEXT"] = "Empiler les objets pouvant l'être et essai de remplir les emplacements vide des sacs spéciaux"
	L["RESTACK_FAIL_WAIT"] = "Une opération d'empilage est en cours, veuillez attendre qu'elle se termine"
	L["RESTACK_FAIL_ACCESS"] = "Vous n'avez pas l'autorisation pour empiler le casier %2$s de la %1$s"
--	L["RESTACK_FAIL_CLOSED"] = ""
--	L["RESTACK_TYPE"] = ""
--	L["RESTACK_CLEANUP_DEPOSIT"] = ""
--	L["RESTACK_TOPUP_FROM_BAGS"] = ""
--	L["RESTACK_TOPUP_FROM_BAGS_TEXT"] = ""
--	L["RESTACK_FILL_FROM_BAGS_TEXT"] = ""
--	L["RESTACK_REFRESH_WHEN_COMPLETE"] = ""
	
	
--	vault tab tooltips
	L["VAULT_TAB_ACCESS_NONE"] = "Pas d'accès"
	L["VAULT_TAB_NAME"] = "Casier: |cffffffff%1$s - %2$s|r"
	L["VAULT_TAB_ACCESS"] = "Accès: |cffffffff%1$s|r"
	L["VAULT_TAB_REMAINING_WITHDRAWALS"] = "Retrait journalier restant: |cffffffff%1$s|r"
	
	
--	system category descriptions
	L["CATEGORY_SYSTEM_CORE_MATS"] = "Matière première"
--	L["CATEGORY_SYSTEM_MYTHIC_KEYSTONE"] = ""
	
	
--	consumable category descriptions
	L["CATEGORY_CONSUMABLE_FOOD_PET"] = "Nourriture pour familier"
	L["CATEGORY_CONSUMABLE_POTION_MANA"] = "Mana (Potion/Gemme)"
	L["CATEGORY_CONSUMABLE_POTION_HEAL"] = "Soin (Potion/Pierre de soins)"
	L["CATEGORY_CONSUMABLE_ELIXIR_BATTLE"] = "Elixir de bataille"
	L["CATEGORY_CONSUMABLE_ELIXIR_GUARDIAN"] = "Elixir du gardien"
	
	
--	bag names - used to name the empty slots in the status frame
	L["STATUS_SHORTNAME_BAG"] = "Sac"
--	L["STATUS_SHORTNAME_COOKING"] = ""
	L["STATUS_SHORTNAME_CRITTER"] = "Comp"
	L["STATUS_SHORTNAME_ENCHANTING"] = "Ench"
	L["STATUS_SHORTNAME_ENGINEERING"] = "Ing"
	L["STATUS_SHORTNAME_GEAR"] = "Equip"
	L["STATUS_SHORTNAME_GEM"] = "Gemme"
--	L["STATUS_SHORTNAME_HEIRLOOM"] = ""
	L["STATUS_SHORTNAME_HERB"] = "Herbe"
	L["STATUS_SHORTNAME_INSCRIPTION"] = "Calli"
	L["STATUS_SHORTNAME_KEY"] = "Clé"
	L["STATUS_SHORTNAME_LEATHERWORKING"] = "Cuir"
	L["STATUS_SHORTNAME_MAIL"] = "Courrier"
	L["STATUS_SHORTNAME_MINING"] = "Minerai"
	L["STATUS_SHORTNAME_MOUNT"] = "Monture"
--	L["STATUS_SHORTNAME_REAGENTBANK"] = ""
--	L["STATUS_SHORTNAME_TACKLE"] = ""
	L["STATUS_SHORTNAME_TOKEN"] = "Insigne"
--	L["STATUS_SHORTNAME_TOY"] = ""
	
	
--	main menu
--	L["MENU"] = ""
	
	L["MENU_CHARACTER_SWITCH"] = "Changer de personnage"
	L["MENU_CHARACTER_SWITCH_TEXT"] = "Afficher le contenu d'un autre personnage"
	L["MENU_CHARACTER_SWITCH_CHOOSE_NONE"] = "Pas de données d'autres personnages"
	L["MENU_CHARACTER_SWITCH_CHOOSE_TEXT"] = "Changer l'affichage actuel pour %1$s"
	L["MENU_CHARACTER_SWITCH_ERASE"] = "Effacer les données de %s"
	L["MENU_CHARACTER_SWITCH_ERASE_TEXT"] = "Effacer les données de %1$s pour %2$s"
	
	L["MENU_LOCATION_SWITCH"] = "Autres emplacements"
	L["MENU_LOCATION_SWITCH_TEXT"] = "Ouvrir la fenêtre de %1$s"
	
	
--	actions menu
--	L["MENU_ACTION"] = ""
	L["MENU_ACTION_REFRESH_TEXT"] = "Réactualiser la fenêtre"
--	L["MENU_ACTION_REFRESH_CLEAR_CACHE"] = ""
--	L["MENU_ACTION_REFRESH_CLEAR_CACHE_TEXT"] = ""
	L["MENU_ACTION_RELOAD_TEXT"] = "Recharger la fenêtre."
	L["MENU_ACTION_EDITMODE"] = "Mode édition"
	L["MENU_ACTION_EDITMODE_TEXT"] = "Basculer en mode édition, ce qui vous permet de changer la catégorie des objets"
	L["MENU_ACTION_BAGCHANGER"] = "Echangeur de sacs"
	L["MENU_ACTION_BAGCHANGER_TEXT"] = "Basculer vers l'afficher les sacs, ce qui vous permet d'en ajouter et de les remplacer"
	
	
--	item menu
	L["MENU_ITEM_TITLE"] = "Options des objets"
	L["MENU_ITEM_ITEM"] = "Objet"
	L["MENU_ITEM_DEFAULT_RESET"] = "Remettre valeur par défaut"
	L["MENU_ITEM_DEFAULT_RESET_TEXT"] = "Cliquer pour remettre la catégorie de cette objet à sa valeur par défaut (ne modifie pas les règles)"
	L["MENU_ITEM_ASSIGN_CHOICES"] = "Catégories assignable"
	L["MENU_ITEM_ASSIGN_THIS"] = "Assigner la catégorie"
	L["MENU_ITEM_ASSIGN_THIS_TEXT"] = "Assigner cette objet à une catégorie spécifique"
	L["MENU_ITEM_RULE_NEW"] = "Créer une nouvelle règle"
	L["MENU_ITEM_RULE_ADD"] = "Ajouter un objet à cette règle"
	L["MENU_ITEM_CUSTOM_NEW"] = "Créer une nouvelle catégorie personnelle"
	L["MENU_ITEM_DEBUG"] = "Info de déboguage"
	L["MENU_ITEM_DEBUG_BAG"] = "Sac"
	L["MENU_ITEM_DEBUG_SLOT"] = "Emplacement"
--	L["MENU_ITEM_DEBUG_BAG_TYPE"] = ""
--	L["MENU_ITEM_DEBUG_PET_ID"] = ""
--	L["MENU_ITEM_DEBUG_PET_SPECIES"] = ""
	L["MENU_ITEM_DEBUG_AI_ID_SHORT"] = "ID court"
	L["MENU_ITEM_DEBUG_CACHE"] = "ID cache"
	L["MENU_ITEM_DEBUG_AI_ID_RULE"] = "ID de règle"
	L["MENU_ITEM_DEBUG_AI_ID_CATEGORY"] = "ID catégorie"
	L["MENU_ITEM_DEBUG_LVL_ITEM"] = "Niveau de l'objet (stat)"
	L["MENU_ITEM_DEBUG_LVL_USE"] = "Niveau de l'objet (utilisation)"
--	L["MENU_ITEM_DEBUG_TYPE"] = ""
	L["MENU_ITEM_DEBUG_SUBTYPE"] = "Sous-type"
	L["MENU_ITEM_DEBUG_EQUIP"] = "Emplacement"
	L["MENU_ITEM_DEBUG_ID"] = "ID Blizzard"
	L["MENU_ITEM_DEBUG_FAMILY"] = "Famille"
--	L["MENU_ITEM_DEBUG_PT"] = ""
--	L["MENU_ITEM_DEBUG_PT_TEXT"] = ""
--	L["MENU_ITEM_DEBUG_PT_NONE"] = ""
--	L["MENU_ITEM_DEBUG_PT_TITLE"] = ""
--	L["MENU_ITEM_DEBUG_SOURCE"] = ""
--	L["MENU_ITEM_DEBUG_BONUS"] = ""
--	L["MENU_ITEM_DEBUG_ITEMSTRING"] = ""
	
	
--	bar menu
	L["MENU_BAR_TITLE"] = "Groupe %1$s"
	L["MENU_BAR_CATEGORY_TEXT"] = "Assigner la catégorie %1$s à ce groupe"
	L["MENU_BAR_CATEGORY_CURRENT"] = "Assignation actuel"
	L["MENU_BAR_CATEGORY_ASSIGN"] = "Catégories assignables"
	L["MENU_BAR_CATEGORY_REMOVE_TEXT"] = "Cliquer pour supprimer %1$s du groupe %2$s et la remettre dans le groupe par défaut"
	L["MENU_BAR_CATEGORY_HIDDEN_TEXT"] = "Cliquer pour changer le status cacher de la catégorie.\n\nLes objets dans la catégorie cachée n'apparaitront pas en mode normal"
--	L["MENU_BAR_CATEGORY_MOVE_START_TEXT"] = ""
--	L["MENU_BAR_CATEGORY_MOVE_COMPLETE_TEXT"] = ""
--	L["MENU_BAR_CATEGORY_ENABLE_TEXT"] = ""
--	L["MENU_BAR_CATEGORY_DISABLE_TEXT"] = ""
--	L["MENU_BAR_CATEGORY_STATUS"] = ""
--	L["MENU_BAR_CATEGORY_STATUS_TEXT"] = ""
--	L["MENU_BAR_CATEGORY_JUNK_TEXT"] = ""
--	L["MENU_BAR_BAG_ASSIGN_TEXT"] = ""
	L["MENU_BAR_OPTIONS"] = "Options des groupes"
	L["MENU_BAR_RESET_TEXT"] = "Supprimer toutes les catégories assignées actuellement à ce groupe sauf la catégorie par défaut"
	L["MENU_BAR_INSERT_TEXT"] = "Insérer un groupe vide ici en déplacant toutes les catégories d'un groupe vers le haut"
	L["MENU_BAR_DELETE_TEXT"] = "Remettre toutes les catégories de ce groupe vers le groupe par défaut et déplacer tous les groupes au-dessus de celui-ci d'un groupe vers le bas.\n\nSi la catégorie par défaut est dans ce groupe elle va retourner vers le groupe 1"
--	L["MENU_BAR_MOVE_START_TEXT"] = ""
--	L["MENU_BAR_MOVE_COMPLETE_TEXT"] = ""
--	L["MENU_BAR_MOVE_FAIL_OUTSIDE"] = ""
--	L["MENU_BAR_MOVE_FAIL_SAME"] = ""
--	L["MENU_BAR_SORTKEY_TEXT"] = ""
--	L["MENU_BAR_SORTKEY_DEFAULT_RESET_TEXT"] = ""
--	L["MENU_BAR_COLOUR_BORDER_DEFAULT_TEXT"] = ""
--	L["MENU_BAR_COLOUR_BORDER_CUSTOM_TEXT"] = ""
--	L["MENU_BAR_COLOUR_BORDER_TEXT"] = ""
--	L["MENU_BAR_COLOUR_BACKGROUND_DEFAULT_TEXT"] = ""
--	L["MENU_BAR_COLOUR_BACKGROUND_CUSTOM_TEXT"] = ""
--	L["MENU_BAR_COLOUR_BACKGROUND_TEXT"] = ""
--	L["MENU_BAR_COLOUR_NAME_DEFAULT_TEXT"] = ""
--	L["MENU_BAR_COLOUR_NAME_CUSTOM_TEXT"] = ""
--	L["MENU_BAR_COLOUR_NAME_TEXT"] = ""
--	L["MENU_LOCKED_TEXT"] = ""
	
	
--	changer bag menu
	L["MENU_BAG_TITLE"] = "Options de sac"
	L["MENU_BAG_SHOW"] = "Affichage"
	L["MENU_BAG_SHOW_TEXT"] = "Afficher le contenu de ce sac"
	L["MENU_BAG_ISOLATE"] = "Isoler"
	L["MENU_BAG_ISOLATE_TEXT"] = "Afficher seulement le contenu de ce sac"
	L["MENU_BAG_SHOWALL"] = "Afficher tous"
	L["MENU_BAG_SHOWALL_TEXT"] = "Afficher le contenu de tous les sacs de cette emplacement"
--	L["MENU_BAG_EMPTY_TEXT"] = ""
	
	
--	configuration options
	L["CONFIG"] = "Config"
	L["CONFIG_TEXT"] = "Menu de configuration"
	
--	configuration options > system
	L["CONFIG_SYSTEM_TEXT"] = "Options système"
	
	L["CONFIG_SYSTEM_FONT_TEXT"] = "Sélectionner la police de caractère à utiliser"
	
--	L["CONFIG_SYSTEM_FRAMESTRATA"] = ""
--	L["CONFIG_SYSTEM_FRAMESTRATA_TEXT"] = ""
--	L["CONFIG_SYSTEM_FRAMESTRATA_LEVEL_LOW"] = ""
--	L["CONFIG_SYSTEM_FRAMESTRATA_LEVEL_MEDIUM"] = ""
--	L["CONFIG_SYSTEM_FRAMESTRATA_LEVEL_HIGH"] = ""
	
--	L["CONFIG_SYSTEM_REPOSITION_ONSHOW"] = ""
--	L["CONFIG_SYSTEM_REPOSITION_ONSHOW_TEXT"] = ""
	
--	L["CONFIG_SORTING_WHEN"] = ""
--	L["CONFIG_SORTING_WHEN_TEXT"] = ""
--	L["CONFIG_SORTING_WHEN_INSTANT"] = ""
--	L["CONFIG_SORTING_WHEN_INSTANT_TEXT"] = ""
--	L["CONFIG_SORTING_WHEN_OPEN"] = ""
--	L["CONFIG_SORTING_WHEN_OPEN_TEXT"] = ""
--	L["CONFIG_SORTING_WHEN_MANUAL"] = ""
--	L["CONFIG_SORTING_WHEN_MANUAL_TEXT"] = ""
	
	L["CONFIG_SYSTEM_TOOLTIP"] = "Bulle d'information"
	L["CONFIG_SYSTEM_TOOLTIP_ENABLE_TEXT"] = "Montrer les informations supplémentaires dans la bulle d'information"
	L["CONFIG_SYSTEM_TOOLTIP_EMPTY_ADD"] = "Ligne vide"
	L["CONFIG_SYSTEM_TOOLTIP_EMPTY_ADD_TEXT"] = "Mettre une ligne vide entre le texte de base de la bulle d'information et le texte personnalisé à ajouter"
	L["CONFIG_SYSTEM_TOOLTIP_ITEMCOUNT_ADD"] = "Quantité d'objet"
	L["CONFIG_SYSTEM_TOOLTIP_ITEMCOUNT_ADD_TEXT"] = "Montrer la quantité d'objets dans la bulle d'information"
	L["CONFIG_SYSTEM_TOOLTIP_ITEMCOUNT_COLOUR_TEXT"] = "Définir la couleur du texte pour la quantité d'objets"
--	L["CONFIG_SYSTEM_TOOLTIP_ITEMCOUNT_VAULT_TABS"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_ITEMCOUNT_VAULT_TABS_TEXT"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_SCALE_TEXT"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_CLASSCOLOUR_TEXT"] = ""
	L["CONFIG_SYSTEM_TOOLTIP_SELF_ONLY"] = "Personnage seul"
	L["CONFIG_SYSTEM_TOOLTIP_SELF_ONLY_TEXT"] = "Montrer la quantité d'objets seulement pour ce personnage"
--	L["CONFIG_SYSTEM_TOOLTIP_HIGHLIGHT"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_HIGHLIGHT_TEXT"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_FACTION_ONLY"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_FACTION_ONLY_TEXT"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_REALM_ONLY"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_REALM_ONLY_TEXT"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_CROSSREALM"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_CROSSREALM_TEXT"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_VAULT_TEXT"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_BATTLEPET_SOURCE_TEXT"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_BATTLEPET_DESCRIPTION_TEXT"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_BATTLEPET_CUSTOM_ENABLE_TEXT"] = ""
--	L["CONFIG_SYSTEM_TOOLTIP_BATTLEPET_MOUSEOVER_ENABLE_TEXT"] = ""
	
--	L["CONFIG_SYSTEM_WORKAROUND"] = ""
	L["CONFIG_SYSTEM_WORKAROUND_TEXT"] = "Activer le code pour corriger ou contourner ce problème"
	L["CONFIG_SYSTEM_WORKAROUND_FRAMELEVEL"] = "FrameLevel"
	L["CONFIG_SYSTEM_WORKAROUND_FRAMELEVEL_TEXT"] = "Un bogue dans l'API CreateFrame de Blizzard peut faire apparaitre le fond des cadres devant l'avant-plan, les fenêtres d'aide des objets n'apparaissent pas et il est impossible de cliquer sur quelque chose dans la fenêtre."
	L["CONFIG_SYSTEM_WORKAROUND_FRAMELEVEL_ALERT_TEXT"] = "Définir comment sont afficher les alertes de la correction du bogue de FrameLevel"
	L["CONFIG_SYSTEM_WORKAROUND_FRAMELEVEL_ALERT_STYLE0"] = "Désactivée"
	L["CONFIG_SYSTEM_WORKAROUND_FRAMELEVEL_ALERT_STYLE0_TEXT"] = "Les alertes de la correction du bogue ne seront pas affichées"
	L["CONFIG_SYSTEM_WORKAROUND_FRAMELEVEL_ALERT_STYLE1"] = "Courte"
	L["CONFIG_SYSTEM_WORKAROUND_FRAMELEVEL_ALERT_STYLE1_TEXT"] = "Afficher un court texte des alertes de la correction du bogue"
	L["CONFIG_SYSTEM_WORKAROUND_FRAMELEVEL_ALERT_STYLE2"] = "Complète"
	L["CONFIG_SYSTEM_WORKAROUND_FRAMELEVEL_ALERT_STYLE2_TEXT"] = "Afficher le texte complet des alertes de la correction du bogue"
--	L["CONFIG_SYSTEM_WORKAROUND_ZEROSIZEBAG"] = ""
--	L["CONFIG_SYSTEM_WORKAROUND_ZEROSIZEBAG_TEXT"] = ""
--	L["CONFIG_SYSTEM_WORKAROUND_ZEROSIZEBAG_ALERT_TEXT"] = ""
--	L["CONFIG_SYSTEM_WORKAROUND_COMBAT_YIELD"] = ""
--	L["CONFIG_SYSTEM_WORKAROUND_COMBAT_YIELD_ENABLED_TEXT"] = ""
--	L["CONFIG_SYSTEM_WORKAROUND_COMBAT_YIELD_COUNT_TEXT"] = ""
--	L["BUGFIX_TAINTED_ALERT_MOUSEOVER_TEXT"] = ""
--	L["BUGFIX_TAINTED_ALERT_OPEN_TEXT"] = ""
	
--	L["CONFIG_SYSTEM_MESSAGES"] = ""
--	L["CONFIG_SYSTEM_MESSAGES_RESTACK_TEXT"] = ""
--	L["CONFIG_SYSTEM_MESSAGES_TRANSLATION"] = ""
--	L["CONFIG_SYSTEM_MESSAGES_TRANSLATION_INTERIM"] = ""
--	L["CONFIG_SYSTEM_MESSAGES_TRANSLATION_INTERIM_TEXT"] = ""
--	L["CONFIG_SYSTEM_MESSAGES_TRANSLATION_FINAL"] = ""
--	L["CONFIG_SYSTEM_MESSAGES_TRANSLATION_FINAL_TEXT"] = ""
--	L["CONFIG_SYSTEM_MESSAGES_BATTLEPET_OPPONENT"] = ""
--	L["CONFIG_SYSTEM_MESSAGES_BATTLEPET_OPPONENT_TEXT"] = ""
--	L["CONFIG_SYSTEM_MESSAGES_BAG_UNKNOWN"] = ""
--	L["CONFIG_SYSTEM_MESSAGES_BAG_UNKNOWN_TEXT"] = ""
--	L["CONFIG_SYSTEM_MESSAGES_RULES_HOOKED"] = ""
--	L["CONFIG_SYSTEM_MESSAGES_RULES_HOOKED_TEXT"] = ""
--	L["CONFIG_SYSTEM_MESSAGES_RULES_REGISTRATION"] = ""
--	L["CONFIG_SYSTEM_MESSAGES_RULES_REGISTRATION_TEXT"] = ""
	
--	L["CONFIG_SYSTEM_TIMERS"] = ""
--	L["CONFIG_SYSTEM_TIMERS_TEXT"] = ""
	
	
--	configuration options > auto
	L["CONFIG_AUTO"] = "Ouvrir/Fermer automatique"
	
--	L["CONFIG_AUTO_OPEN"] = "Ouvre le %2$s %1$s quand vous ouvrez %3$s"
	L["CONFIG_AUTO_OPEN_BANK"] = "la banque"
	L["CONFIG_AUTO_OPEN_VAULT"] = "la banque de guilde"
	L["CONFIG_AUTO_OPEN_MAIL"] = "une boîte aux lettres"
	L["CONFIG_AUTO_OPEN_MERCHANT"] = "un marchand/vendeur"
	L["CONFIG_AUTO_OPEN_TRADE"] = "la fenêtre d'échange"
	L["CONFIG_AUTO_OPEN_AUCTION"] = "un hotel des ventes"
--	L["CONFIG_AUTO_OPEN_VOID"] = ""
	
--	L["CONFIG_AUTO_CLOSE"] = "Fermer le %2$s %1$s quand vous fermez %3$s"
	L["CONFIG_AUTO_CLOSE_BANK"] = "la banque"
	L["CONFIG_AUTO_CLOSE_VAULT"] = "la banque de guilde"
	L["CONFIG_AUTO_CLOSE_MAIL"] = "une boîte aux lettres"
	L["CONFIG_AUTO_CLOSE_MERCHANT"] = "un marchand/vendeur"
	L["CONFIG_AUTO_CLOSE_TRADE"] = "la fenêtre d'échange"
	L["CONFIG_AUTO_CLOSE_AUCTION"] = "un hotel des ventes"
--	L["CONFIG_AUTO_CLOSE_VOID"] = ""
	L["CONFIG_AUTO_CLOSE_COMBAT"] = "entrez en combat"
	
	
--	configuration options > control
	L["CONFIG_CONTROL_MONITOR"] = "Surveiller"
	L["CONFIG_CONTROL_MONITOR_TEXT"] = "Surveiller les changements dans les données de %1$s pour le personnage (%2$s)"
	L["CONFIG_CONTROL_SAVE_TEXT"] = "Sauver les données de %1$s pour le personnage (%2$s) pour que vous puissiez le voir depuis un autre personnage"
--	L["CONFIG_CONTROL_NOTIFY_ERASE_TEXT"] = ""
	L["CONFIG_CONTROL_OVERRIDE"] = "Remplacer"
	L["CONFIG_CONTROL_OVERRIDE_TEXT"] = "Remplacer le %2$s original de Blizzard pour qu'%1$s le contrôle\n\nDésactiver cette option vous fera revenir aux fonctionnalitées de %2$s standards de Blizzard\n\nIl sera toujours possible d'ouvrir le %2$s d'%1$s quand cette option est désactivée mais vous devrez configurer et utiliser une combinaison de touche à la place"
--	L["CONFIG_CONTROL_SPECIAL_TEXT"] = ""
	L["CONFIG_CONTROL_ANCHOR_LOCK_TEXT"] = "Vérrouiller la fenêtre %1$s pour qu'elle ne puisse plus être déplacée"
--	L["CONFIG_CONTROL_REPOSITION_NOW"] = ""
--	L["CONFIG_CONTROL_REPOSITION_NOW_TEXT"] = ""
	L["CONFIG_CONTROL_BLUEPRINT_TEXT"] = "Sélectionner quels paramètres utiliser lors de la génération de la fenêtre %1$s"
	
	
--	configuration settings > design
--	L["CONFIG_DESIGN"] = ""
--	L["CONFIG_DESIGN_PLURAL"] = ""
	
--	L["CONFIG_STYLE"] = ""
--	L["CONFIG_STYLE_PLURAL"] = ""
--	L["CONFIG_STYLE_DESCRIPTION"] = ""
	
--	L["CONFIG_LAYOUT"] = ""
--	L["CONFIG_LAYOUT_PLURAL"] = ""
--	L["CONFIG_LAYOUT_DESCRIPTION"] = ""
	
	L["CONFIG_DESIGN_WINDOW"] = "Fenêtre"
	L["CONFIG_DESIGN_WINDOW_SCALE_TEXT"] = "Définir l'échelle. Agrandie ou diminue la taille de la fenêtre"
	L["CONFIG_DESIGN_WINDOW_PADDING_TEXT"] = "Définir l'espace entre le bord de la fenêtre et les groupes"
	L["CONFIG_DESIGN_WINDOW_WIDTH_TEXT"] = "Définir le nombre maximum d'objets à afficher sur une ligne"
--	L["CONFIG_DESIGN_WINDOW_HEIGHT_TEXT"] = ""
	L["CONFIG_DESIGN_WINDOW_BACKGROUND_COLOUR_TEXT"] = "Définir la couleur de fond de la fenêtre principale"
	L["CONFIG_DESIGN_WINDOW_BORDER_SHOW_TEXT"] = "Afficher une bordure autour de la fenêtre principale"
	L["CONFIG_DESIGN_WINDOW_BORDER_STYLE_TEXT"] = "Définir le style de la bordure de la fenêtre principale"
	L["CONFIG_DESIGN_WINDOW_BORDER_COLOUR_TEXT"] = "Définir la couleur de la bordure de la fenêtre principale"
	
--	L["CONFIG_DESIGN_FRAME_HIDE_TEXT"] = ""
	
	L["CONFIG_DESIGN_FRAME_CHANGER_HIGHLIGHT"] = "Couleur de surbrillance du sac"
--	L["CONFIG_DESIGN_FRAME_CHANGER_HIGHLIGHT_TEXT"] = ""
	L["CONFIG_DESIGN_FRAME_CHANGER_HIGHLIGHT_COLOUR_TEXT"] = "Définir la couleur utilisée pour mettre en surbrillance les emplacements quand la souris passe sur un sac"
	L["CONFIG_DESIGN_FRAME_CHANGER_FREE"] = "Compteur d'emplacement vide"
	L["CONFIG_DESIGN_FRAME_CHANGER_FREE_TEXT"] = "Montrer le compteur d'emplacements vides sur les sacs"
	L["CONFIG_DESIGN_FRAME_CHANGER_FREE_COLOUR_TEXT"] = "Définir la couleur du texte du compteur d'emplacements vides"
	
--	L["CONFIG_DESIGN_FRAME_STATUS_EMPTY"] = ""
--	L["CONFIG_DESIGN_FRAME_STATUS_EMPTY_TEXT"] = ""
	
--	L["CONFIG_DESIGN_FRAME_SEARCH_LABEL_COLOUR_TEXT"] = ""
--	L["CONFIG_DESIGN_FRAME_SEARCH_TEXT_COLOUR_TEXT"] = ""
	
--	L["CONFIG_DESIGN_FRAME_TITLE_SIZE_NORMAL"] = ""
--	L["CONFIG_DESIGN_FRAME_TITLE_SIZE_THIN"] = ""
--	L["CONFIG_DESIGN_FRAME_TITLE_ONLINE_COLOUR_TEXT"] = ""
--	L["CONFIG_DESIGN_FRAME_TITLE_OFFLINE_COLOUR_TEXT"] = ""
	
	L["CONFIG_DESIGN_BAR"] = "Groupes"
	L["CONFIG_DESIGN_BAR_PER_ROW"] = "Nombre par Ligne"
	L["CONFIG_DESIGN_BAR_PER_ROW_TEXT"] = "Définir le nombre de groupes à afficher pour chaque ligne"
	L["CONFIG_DESIGN_BAR_BACKGROUND_TEXT"] = "Définir la couleur de fond des groupes"
	L["CONFIG_DESIGN_BAR_COMPACT"] = "Compacte"
	L["CONFIG_DESIGN_BAR_COMPACT_TEXT"] = "Afficher tous les groupes non vides par ordre séquentiel"
	L["CONFIG_DESIGN_BAR_SHOW_EMPTY"] = "Afficher quand vides"
	L["CONFIG_DESIGN_BAR_SHOW_EMPTY_TEXT"] = "Afficher les groupes vides"
	L["CONFIG_DESIGN_BAR_PADDING_INTERNAL_TEXT"] = "Définir l'espace entre le groupe et les objets"
	L["CONFIG_DESIGN_BAR_PADDING_EXTERNAL_TEXT"] = "Définir l'espace entre les groupes"
	L["CONFIG_DESIGN_BAR_BORDER_TEXT"] = "Afficher une bordure autour de chaque groupe"
	L["CONFIG_DESIGN_BAR_BORDER_STYLE_TEXT"] = "Définir le style de bordure des groupes"
	L["CONFIG_DESIGN_BAR_BORDER_COLOUR_TEXT"] = "Définir la couleur de la bordure des groupes"
	L["CONFIG_DESIGN_BAR_NAME_TEXT"] = "Définir le nom de ce groupe"
	L["CONFIG_DESIGN_BAR_NAME_SHOW_TEXT"] = "Afficher le nom des groupes"
	L["CONFIG_DESIGN_BAR_NAME_COLOUR_TEXT"] = "Définir la couleur du nom de groupe"
--	L["CONFIG_DESIGN_BAR_NAME_HEIGHT_TEXT"] = ""
--	L["CONFIG_DESIGN_BAR_NAME_ANCHOR_TEXT"] = ""
	
	L["CONFIG_DESIGN_ITEM_PADDING_TEXT"] = "Définir le nombre d'espace entre les emplacements d'objet"
	L["CONFIG_DESIGN_ITEM_HIDDEN"] = "Montrer caché"
	L["CONFIG_DESIGN_ITEM_HIDDEN_TEXT"] = "Montrer les catégories cachées"
	L["CONFIG_DESIGN_ITEM_FADE"] = "Assombrir inaccessible"
	L["CONFIG_DESIGN_ITEM_FADE_TEXT"] = "Assombrir les objets inaccessibles"
	L["CONFIG_DESIGN_ITEM_TINT_USABLE"] = "Teinter inutilisable"
	L["CONFIG_DESIGN_ITEM_TINT_USABLE_TEXT"] = "Teinter les objets inutilisables en rouge"
--	L["CONFIG_DESIGN_ITEM_ITEMLEVEL_SHOW"] = ""
--	L["CONFIG_DESIGN_ITEM_ITEMLEVEL_SHOW_TEXT"] = ""
--	L["CONFIG_DESIGN_ITEM_COMPRESS"] = ""
--	L["CONFIG_DESIGN_ITEM_COMPRESS_TEXT"] = ""
--	L["CONFIG_DESIGN_ITEM_ITEMCOUNT_SHOW"] = ""
--	L["CONFIG_DESIGN_ITEM_ITEMCOUNT_SHOW_TEXT"] = ""
--	L["CONFIG_DESIGN_ITEM_UPGRADE"] = ""
--	L["CONFIG_DESIGN_ITEM_UPGRADE_TEXT"] = ""
--	L["CONFIG_DESIGN_ITEM_SIZE"] = ""
--	L["CONFIG_DESIGN_ITEM_SIZE_TEXT"] = ""
	
--	L["CONFIG_DESIGN_ITEM_COOLDOWN_SHOW_TEXT"] = ""
--	L["CONFIG_DESIGN_ITEM_COOLDOWN_GLOBAL"] = ""
--	L["CONFIG_DESIGN_ITEM_COOLDOWN_GLOBAL_TEXT"] = ""
--	L["CONFIG_DESIGN_ITEM_COOLDOWN_COMBAT"] = ""
--	L["CONFIG_DESIGN_ITEM_COOLDOWN_COMBAT_TEXT"] = ""
	
	L["CONFIG_DESIGN_ITEM_BORDER_SHOW_TEXT"] = "Montrer une bordure autour des objets"
	L["CONFIG_DESIGN_ITEM_BORDER_STYLE_TEXT"] = "Définir le style de bordure des objets"
	L["CONFIG_DESIGN_ITEM_BORDER_RARITY"] = "Couleur de rareté"
	L["CONFIG_DESIGN_ITEM_BORDER_RARITY_TEXT"] = "Colorer la bordure des objets en fonction de leurs raretés (Commun, Rare, Epique, etc)"
--	L["CONFIG_DESIGN_ITEM_BORDER_RARITY_CUTOFF"] = ""
--	L["CONFIG_DESIGN_ITEM_BORDER_RARITY_CUTOFF_TEXT"] = ""
	L["CONFIG_DESIGN_ITEM_BORDER_TEXTURE_OFFSET_TEXT"] = "Définir le nombre de pixels entre le bord extérieur des images et l'intérieur de la bordure (Utiliser pour réaligner la bordure sur la texture des objets)"
	
--	L["CONFIG_DESIGN_ITEM_NEW"] = ""
--	L["CONFIG_DESIGN_ITEM_NEW_ENABLED_TEXT"] = ""
--	L["CONFIG_DESIGN_ITEM_NEW_CUTOFF_TEXT"] = ""
--	L["CONFIG_DESIGN_ITEM_NEW_RESET_TEXT"] = ""

	L["CONFIG_DESIGN_ITEM_AGE"] = "Nouveaux objets"
	L["CONFIG_DESIGN_ITEM_AGE_SHOW_TEXT"] = "Basculer l'afficher de l'indicateur de nouvel objet pour la fenêtre de %s"
	L["CONFIG_DESIGN_ITEM_AGE_COLOUR_TEXT"] = "Définir la couleur de texte de l'indicateur de nouveaux objets"
--	L["CONFIG_DESIGN_ITEM_AGE_CUTOFF_TEXT"] = ""
	
	L["CONFIG_DESIGN_ITEM_EMPTY"] = "Emplacements vide"
	L["CONFIG_DESIGN_ITEM_EMPTY_ICON_TEXT"] = "Utiliser une icône comme fond des emplacements vides"
	L["CONFIG_DESIGN_ITEM_EMPTY_CLUMP"] = "Remplir"
	L["CONFIG_DESIGN_ITEM_EMPTY_CLUMP_TEXT"] = "Remplir les emplacements vides avec la couleur des emplacements non vide"
	L["CONFIG_DESIGN_ITEM_EMPTY_BORDER"] = "Bordures colorées"
	L["CONFIG_DESIGN_ITEM_EMPTY_BORDER_TEXT"] = "Colorer la bordure des emplacements vides avec la couleur du type de sac"
	L["CONFIG_DESIGN_ITEM_EMPTY_COLOUR"] = "Couleurs d'emplacement"
	L["CONFIG_DESIGN_ITEM_EMPTY_COLOUR_TEXT"] = "Définir la couleur de bordure et de fond des emplacements %1$s"
--	L["CONFIG_DESIGN_ITEM_EMPTY_ALPHA"] = ""
--	L["CONFIG_DESIGN_ITEM_EMPTY_ALPHA_TEXT"] = ""
--	L["CONFIG_DESIGN_ITEM_EMPTY_STATUS"] = ""
--	L["CONFIG_DESIGN_ITEM_EMPTY_FIRST"] = ""
--	L["CONFIG_DESIGN_ITEM_EMPTY_FIRST_TEXT"] = ""
--	L["CONFIG_DESIGN_ITEM_EMPTY_POSITION"] = ""
--	L["CONFIG_DESIGN_ITEM_EMPTY_POSITION_TEXT"] = ""
	
	
-- junk
--	L["CONFIG_JUNK"] = ""
--	L["CONFIG_JUNK_SELL"] = ""
--	L["CONFIG_JUNK_SELL_TEXT"] = ""
--	L["CONFIG_JUNK_SELL_NOTIFY_SOLD"] = ""
--	L["CONFIG_JUNK_SELL_NOTIFY_DESTROYED"] = ""
--	L["CONFIG_JUNK_SELL_NOTIFY_LIMIT"] = ""
--	L["CONFIG_JUNK_LIMIT"] = ""
--	L["CONFIG_JUNK_LIMIT_TEXT"] = ""
--	L["CONFIG_JUNK_DELETE_TEXT"] = ""
--	L["CONFIG_JUNK_NOTIFY_TEXT"] = ""
--	L["CONFIG_JUNK_RARITY_CUTOFF_TEXT"] = ""
--	L["CONFIG_JUNK_CATEGORY_TEXT"] = ""
--	L["CONFIG_JUNK_LIST_TEXT"] = ""
--	L["CONFIG_JUNK_LIST_SELL_TEXT"] = ""
--	L["CONFIG_JUNK_LIST_DESTROY_TEXT"] = ""
--	L["CONFIG_JUNK_TEST_TEXT"] = ""
--	L["CONFIG_JUNK_TEST_ALERT"] = ""
	
	
-- sorting
--	L["CONFIG_SORTING"] = ""
	
	L["CONFIG_SORTING_SORT"] = "Tri"
	
--	L["CONFIG_SORTING_METHOD"] = ""
--	L["CONFIG_SORTING_METHOD_PLURAL"] = ""
	L["CONFIG_SORTING_METHOD_TEXT"] = "Choisir comment vous voulez trier vos objets"
	L["CONFIG_SORTING_METHOD_BAGSLOT"] = "Sac / Emplacement"
	L["CONFIG_SORTING_METHOD_BAGSLOT_TEXT"] = "Trier vos objets par sac et numéro d'emplacement"
	L["CONFIG_SORTING_METHOD_USER"] = "Défini par l'utilisateur"
	L["CONFIG_SORTING_METHOD_USER_TEXT"] = "Trier vos objets selon l'odre que vous avez défini"
	
--	L["CONFIG_SORTING_BAG"] = ""
--	L["CONFIG_SORTING_BAGS"] = ""
--	L["CONFIG_SORTING_BAG_TEXT"] = ""
	
	L["CONFIG_SORTING_INCLUDE_NAME"] = "Nom d'objet"
	L["CONFIG_SORTING_INCLUDE_NAME_TEXT"] = "Inclure le nom de l'objet dans le tri de l'inventaire"
	L["CONFIG_SORTING_INCLUDE_NAME_REVERSE"] = "Ordre inversé des noms"
	L["CONFIG_SORTING_INCLUDE_NAME_REVERSE_TEXT"] = "Utiliser l'ordre inverser des noms pour trier l'inventaire.\n\nex. Potion de Soins Majeure devient Majeure Soins de Potion"
	L["CONFIG_SORTING_INCLUDE_QUALITY"] = "Rareté des objets"
	L["CONFIG_SORTING_INCLUDE_QUALITY_TEXT"] = "Inclure la rareté des objets pour trier l'inventaire"
	L["CONFIG_SORTING_INCLUDE_LOCATION"] = "Localisation d'équipement"
	L["CONFIG_SORTING_INCLUDE_LOCATION_TEXT"] = "Inclure l'emplacement d'équipement des objets pour trier l'inventaire.\n\nNote : Affecte seulement les objets qui peuvent être équiper"
	L["CONFIG_SORTING_INCLUDE_ITEMTYPE"] = "Type et sous-type d'objet"
	L["CONFIG_SORTING_INCLUDE_ITEMTYPE_TEXT"] = "Inclure les type et sous-type des objets pour trier l'inventaire"
	L["CONFIG_SORTING_INCLUDE_CATEGORY"] = "Catégorie d'objet"
	L["CONFIG_SORTING_INCLUDE_CATEGORY_TEXT"] = "Inclure la catégorie des objets pour trier l'inventaire"
	L["CONFIG_SORTING_INCLUDE_ITEMUSELEVEL"] = "Niveau utilisable d'objet"
	L["CONFIG_SORTING_INCLUDE_ITEMUSELEVEL_TEXT"] = "Inclure le niveau utilisable des objets pour trier l'inventaire"
	L["CONFIG_SORTING_INCLUDE_ITEMSTATLEVEL"] = "Niveau statistique d'objet"
	L["CONFIG_SORTING_INCLUDE_ITEMSTATLEVEL_TEXT"] = "Inclure le niveau statistique des objets pour trier l'inventaire"
--	L["CONFIG_SORTING_INCLUDE_ITEMAGE"] = ""
--	L["CONFIG_SORTING_INCLUDE_ITEMAGE_TEXT"] = ""
	L["CONFIG_SORTING_INCLUDE_VENDORPRICE"] = "Prix du vendeur"
	L["CONFIG_SORTING_INCLUDE_VENDORPRICE_TEXT"] = "inclure le prix des vendeurs (par taille de pile) pour trier l'inventaire"
--	L["CONFIG_SORTING_INCLUDE_ID"] = ""
--	L["CONFIG_SORTING_INCLUDE_ID_TEXT"] = ""
--	L["CONFIG_SORTING_INCLUDE_SLOTTYPE"] = ""
--	L["CONFIG_SORTING_INCLUDE_SLOTTYPE_TEXT"] = ""
	
	L["CONFIG_SORTING_DIRECTION_TEXT"] = "Définir dans quel sens vous voulez trier vos objets"
	L["CONFIG_SORTING_ORDER"] = "Ordre de tri"
	L["CONFIG_SORTING_MOVE_UP_TEXT"] = "Déplacer %1$s vers le haut dans l'ordre de tri"
	L["CONFIG_SORTING_MOVE_DOWN_TEXT"] = "Déplacer %1$s vers le bas dans l'ordre de tri"
	L["CONFIG_SORTING_NOT_INCLUDED"] = "* Pas inclus actuellement dans le tri *"
	
--	L["CONFIG_LIST_ADD_TEXT"] = ""
--	L["CONFIG_LIST_ADD_LIMIT_TEXT"] = ""
--	L["CONFIG_LIST_ADD_UPGRADE_TEXT"] = ""
--	L["CONFIG_LIST_DELETE_TEXT"] = ""
--	L["CONFIG_LIST_RESTORE_TEXT"] = ""
--	L["CONFIG_LIST_RENAME_TEXT"] = ""
--	L["CONFIG_LIST_COPY_TEXT"] = ""
--	L["CONFIG_LIST_PURGE_TEXT"] = ""
--	L["CONFIG_LIST_IMPORT_TEXT"] = ""
--	L["CONFIG_LIST_EXPORT_TEXT"] = ""
	
	
	
--	L["CONFIG_CATEGORY"] = ""
--	L["CONFIG_CATEGORY_PLURAL"] = ""
	
	L["CATEGORY_RULE"] = "Règle"
	L["CONFIG_RULE_PLURAL"] = "Règles"
	
	L["CONFIG_RULE_SHOWDISABLED"] = "Afficher les règles désactivées"
	L["CONFIG_RULE_SHOWDISABLED_TEXT"] = "Basculer vers l'affichage des règles désactivées"
	
--	L["CONFIG_CATEGORY_CUSTOM"] = ""
	L["CONFIG_CATEGORY_CUSTOM_PLURAL"] = "Catégories personnelles"
	
--	L["CONFIG_CATEGORY_SET"] = ""
--	L["CONFIG_CATEGORY_SET_PLURAL"] = ""
--	L["CONFIG_CATEGORY_SET_DESCRIPTION"] = ""
	
--	L["CONFIG_LAYOUT"] = ""
--	L["CONFIG_LAYOUT_PLURAL"] = ""
--	L["CONFIG_LAYOUT_DESCRIPTION"] = ""
	
--	L["CONFIG_PROFILE"] = ""
--	L["CONFIG_PROFILE_PLURAL"] = ""
--	L["CONFIG_PROFILE_CURRENT"] = ""
	
	
--	L["CONFIG_OBJECT_DELETED"] = ""
	
	
--	configuration options > debug
	L["CONFIG_DEBUG"] = "Mode de déboguage"
	L["CONFIG_DEBUG_TEXT"] = "Activer le mode de déboguage"
	
	
--	configuration options > generic
--	L["CONFIG_BORDER_SCALE_TEXT"] = ""
	L["CONFIG_BORDER_TEXTURE_TEXT"] = "Options de texture de bordure"
	L["CONFIG_BORDER_TEXTURE_FILE_TEXT"] = "La texture à utiliser pour la bordure"
	L["CONFIG_BORDER_TEXTURE_HEIGHT_TEXT"] = "La hauteur (en pixels) de la texture"
	
	
--	rules frame
	L["RULE"] = "Règle"
	L["RULE_HIDDEN"] = "Caché"
	L["RULE_FORMULA"] = "Formule"
	L["RULE_LIST_ENABLED"] = "Utilisé"
	L["RULE_LIST_DAMAGED"] = "Emdommagé"
	L["RULE_LIST_ID"] = "Règle"
	
	L["RULE_DAMAGED"] = "La règle %s est marquée comme emdommagée et ne sera plus utilisée avant d'être réparée"
--	L["RULE_DAMAGED_TEXT"] = ""
--	L["RULE_FAILED"] = ""
	L["RULE_FAILED_KEY_NIL"] = "La clé passé est vide"
	L["RULE_FAILED_DATA_NIL"] = "La donné passé est vide"
	L["RULE_FAILED_DESCRIPTION_NIL"] = "La description est manquante"
	L["RULE_FAILED_FORMULA_NIL"] = "La formule est manquante"
--	L["RULE_FAILED_FORMULA_BAD"] = ""
--	L["RULE_FAILED_ARGUMENT_IS_NIL"] = ""
--	L["RULE_FAILED_ARGUMENT_IS_NOT"] = ""
--	L["RULE_FAILED_ARGUMENT_IS_INVALID"] = ""
--	L["RULE_FAILED_ARGUMENT_NONE_SPECIFIED"] = ""
	
	
--	new item indicators
--	L["NEW_ITEM_INCREASE"] = ""
--	L["NEW_ITEM_DECREASE"] = ""
--	L["NEW_ITEM_GLOW"] = ""
	
	
--	slash commands
--	L["SLASH_UI"] = ""
	L["SLASH_UI_TEXT"] = "Option d'interface."
--	L["SLASH_UI_RESET"] = ""
	L["SLASH_UI_RESET_TEXT"] = "Centre l'interface à l'écran."
	L["SLASH_UI_RESET_COMPLETE_TEXT"] = "Toutes les fenêtres sont centrées à l'écran."
--	L["SLASH_DB"] = ""
	L["SLASH_DB_TEXT"] = "Options de base de données."
--	L["SLASH_DB_RESET"] = ""
	L["SLASH_DB_RESET_TEXT"] = "Remet toutes les options à défaut."
--	L["SLASH_DB_RESET_CONFIRM"] = ""
	L["SLASH_DB_RESET_CONFIRM_TEXT"] = "Confirme la remise à zéro des options."
	L["SLASH_DB_RESET_COMPLETE_TEXT"] = "Le profile a été remis à zéro. Toutes les options ont été remises à zéro."
--	L["SLASH_CACHE"] = ""
	L["SLASH_CACHE_TEXT"] = "Options de cache"
--	L["SLASH_CACHE_ERASE"] = ""
	L["SLASH_CACHE_ERASE_TEXT"] = "Efface toutes les données du cache."
--	L["SLASH_CACHE_ERASE_CONFIRM"] = ""
	L["SLASH_CACHE_ERASE_CONFIRM_TEXT"] = "Confirme l'effacement des données du cache."
	L["SLASH_CACHE_ERASE_COMPLETE_TEXT"] = "Toutes les données de tous les personnages ont été effacées."
--	L["SLASH_MISC"] = ""
	L["SLASH_MISC_TEXT"] = "Options diverses."
--	L["SLASH_TRACK"] = ""
--	L["SLASH_TRACK_TEXT"] = ""
--	L["SLASH_TRACK_ADD_TEXT"] = ""
--	L["SLASH_TRACK_REMOVE_TEXT"] = ""
	
	
--	misc chat stuff
	L["UPGRADE_PROFILE"] = "Mise à jour des données de profile pour [%1$s] vers v%2$d"
	L["UPGRADE_GLOBAL"] = "Mise à jour global des données de %1$s vers v%2$d"
--	L["UPGRADE_CHAR"] = ""
	
	L["MISC_ALERT"] = "Alerte !"
	L["MISC_ALERT_FRAMELEVEL_1"] = "Correction de bogue complète"
	L["MISC_ALERT_FRAMELEVEL_2"] = "Le FrameLevel pour la fenêtre %1$s est actuellement a %2$s et a été réinitialisé a %3$s pour être sur qu'il reste fonctionnel. Désolé pour le temps pris pour la correction de ce bogue."
	
--	L["BATTLEPET_OPPONENT_IMMUNE"] = ""
--	L["BATTLEPET_OPPONENT_KNOWN_MAX"] = ""
--	L["BATTLEPET_OPPONENT_UPGRADE"] = ""
--	L["BATTLEPET_OPPONENT_FORMAT_STRONG"] = ""
--	L["BATTLEPET_OPPONENT_FORMAT_WEAK"] = ""
--	L["BATTLEPET_OPPONENT_FORMAT_ABILITY1"] = ""
--	L["BATTLEPET_OPPONENT_FORMAT_ABILITY2"] = ""
	
	
--	item count tooltip
--	L["TOOLTIP_VAULT_TABS"] = ""
--	L["TOOLTIP_GOLD_AMOUNT"] = ""
	
	
--	generic text
--	L["AUTOMATIC"] = ""
	L["BOTTOMLEFT"] = "Bas Gauche"
	L["BOTTOMRIGHT"] = "Bas Droite"
	L["TOPLEFT"] = "Haut Gauche"
	L["TOPRIGHT"] = "Haut Droite"
--	L["TOP"] = ""
--	L["BOTTOM"] = ""
--	L["LEFT"] = ""
--	L["RIGHT"] = ""
--	L["HORIZONTAL"] = ""
--	L["VERTICAL"] = ""
	L["CLOSE_MENU"] = "Fermer Menu"
	L["ANCHOR"] = "Point d'ancrage"
	L["ANCHOR_TEXT1"] = "Définir le point d'ancrage pour la fenêtre %1$s"
	L["ANCHOR_TEXT2"] = "Définir le point d'ancrage pour %1$s"
	L["BORDER_TEXT"] = "Options de bordures"
	L["FILE"] = "Fichier"
	L["HEIGHT"] = "Hauteur"
	L["SCALE"] = "Echelle"
--	L["TEXTURE"] = ""
	L["FONT"] = "Police de caractères"
	L["BACKGROUND_COLOUR"] = "Couleur de fond"
--	L["STYLE"] = ""
	L["ALERT"] = "Alerte"
	L["PADDING"] = "Contour"
	L["INTERNAL"] = "Interne"
	L["EXTERNAL"] = "Externe"
	L["WIDTH"] = "Largeur"
	L["DIRECTION"] = "Sens"
	L["ASCENDING"] = "Ascendant"
	L["DECENDING"] = "Descendant"
	L["LOCATION"] = "Emplacement"
	L["CLEAR"] = "Nettoyer"
--	L["DHMS"] = ""
--	L["OPEN"] = ""
--	L["RANDOM"] = ""
--	L["RELOAD"] = ""
	L["MOVE_UP"] = "Déplacer vers le haut"
	L["MOVE_DOWN"] = "Déplacer vers le bas"
--	L["SORT_METHOD"] = ""
--	L["SORT_BY_NAME"] = ""
--	L["SORT_BY_NUMBER"] = ""
	L["INSERT"] = "Ajouter un groupe vide"
	L["CURRENT"] = "actuel"
	L["OFFSET"] = "Décallage"
--	L["NUMBER"] = ""
--	L["STRING"] = ""
--	L["COOLDOWN"] = ""
--	L["FRAMES"] = ""
--	L["CLICK_TO_SELECT"] = ""
--	L["CLICK_TO_DESELECT"] = ""
--	L["CLICK_TO_IGNORE"] = ""	
	L["ORDER"] = "Ordre"
--	L["MOUSEOVER"] = ""
--	L["NO_DATA_AVAILABLE"] = ""
--	L["TOOLTIP_PURCHASE_BANK_BAG_SLOT"] = ""
--	L["TOOLTIP_PURCHASE_BANK_TAB_REAGENT"] = ""
--	L["LABEL"] = ""
--	L["ABORTED"] = ""
--	L["RESTORE"] = ""
--	L["PURGE"] = ""
--	L["COPY_FROM"] = ""
--	L["DELETED"] = ""
--	L["IMPORT"] = ""
--	L["EXPORT"] = ""
--	L["NOTIFY"] = ""
--	L["ACTION"] = ""
--	L["FIRST"] = ""
--	L["LAST"] = ""
--	L["NONE_USABLE"] = ""
--	L["NONE_OWNED"] = ""
--	L["TEST"] = ""
--	L["LIST"] = ""
	
	
-- libdatabroker
--	L["LDB"] = ""
--	L["LDB_BAGS_COLOUR_USE"] = ""
--	L["LDB_BAGS_COLOUR_USE_TEXT"] = ""
--	L["LDB_BAGS_STYLE"] = ""
--	L["LDB_BAGS_STYLE_TEXT"] = ""
--	L["LDB_BAGS_INCLUDE_TYPE"] = ""
--	L["LDB_BAGS_INCLUDE_TYPE_TEXT"] = ""
--	L["LDB_TRACKING_CURRENCY"] = ""
--	L["LDB_PETS_SUMMON"] = ""
--	L["LDB_MOUNTS_NOT_HERE"] = ""
--	L["LDB_MOUNTS_TYPE_L"] = ""
--	L["LDB_MOUNTS_TYPE_U"] = ""
--	L["LDB_MOUNTS_TYPE_S"] = ""
--	L["LDB_MOUNTS_TYPE_X"] = ""
--	L["LDB_MOUNTS_FLYING_USEFORLAND"] = ""
--	L["LDB_MOUNTS_FLYING_USEFORLAND_TEXT"] = ""
--	L["LDB_MOUNTS_FLYING_DISMOUNT"] = ""
--	L["LDB_MOUNTS_FLYING_DISMOUNT_TEXT"] = ""
--	L["LDB_MOUNTS_FLYING_DISMOUNT_WARNING"] = ""
--	L["LDB_MOUNTS_SUMMON"] = ""
--	L["LDB_MOUNTS_NODATA"] = ""
--	L["LDB_MOUNTS_TOOLTIP_SELECTION"] = ""
--	L["LDB_MOUNTS_TRAVEL_FORM"] = ""
--	L["LDB_MOUNTS_TRAVEL_FORM_TEXT"] = ""
--	L["LDB_COMPANION_MISSING"] = ""
--	L["LDB_COMPANION_NONE"] = ""
--	L["LDB_COMPANION_RESTRICTED"] = ""
--	L["LDB_COMPANION_RESTRICTED_ZONE"] = ""
--	L["LDB_COMPANION_RESTRICTED_ITEM"] = ""
--	L["LDB_COMPANION_RESTRICTED_EVENT"] = ""
--	L["LDB_COMPANION_RESTRICTED_UNKNOWN"] = ""
--	L["LDB_COMPANION_NODATA_TEXT"] = ""
--	L["LDB_COMPANION_SELECT"] = ""
--	L["LDB_COMPANION_DESELECT"] = ""
--	L["LDB_COMPANION_IGNORE"] = ""
