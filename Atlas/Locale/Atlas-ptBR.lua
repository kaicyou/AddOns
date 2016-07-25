﻿-- $Id: Atlas-ptBR.lua 31 2016-06-23 07:30:35Z arith $
--[[

	Atlas, a World of Warcraft instance map browser
	Copyright 2005 ~ 2010 - Dan Gilbert <dan.b.gilbert@gmail.com>
	Copyright 2010 - Lothaer <lothayer@gmail.com>, Atlas Team
	Copyright 2011 ~ 2016 - Arith Hsu, Atlas Team <atlas.addon@gmail.com>

	This file is part of Atlas.

	Atlas is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	Atlas is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with Atlas; if not, write to the Free Software
	Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

--]]

local AceLocale = LibStub:GetLibrary("AceLocale-3.0");
local L = AceLocale:NewLocale("Atlas", "ptBR", false);
-- Localize file must set above to false, for example:
--    local AL = AceLocale:NewLocale("Atlas", "deDE", false);

-- Atlas English Localization
if ( GetLocale() == "ptBR" ) then
-- Define the leading strings to be ignored while sorting
-- Ex: The Stockade
--AtlasSortIgnore = {"the (.+)"};

-- Syntax: ["real_zone_name"] = "localized map zone name"
AtlasZoneSubstitutions = {
--	["Ahn'Qiraj"] = "Temple of Ahn'Qiraj";
--	["The Temple of Atal'Hakkar"] = "Sunken Temple";
--	["Throne of Tides"] = "The Abyssal Maw: Throne of the Tides";
};
end


if L then
-- L["Abandonded Mole Machine"] = ""
-- L["Abbendis"] = ""
-- L["AC"] = ""
-- L["Acride <Scarshield Legion>"] = ""
-- L["Adult"] = ""
-- L["Advance Scout Chadwick"] = ""
-- L["Aged Dalaran Wizard"] = ""
-- L["Ahn'kahet Brazier"] = ""
-- L["AKA"] = ""
-- L["AK, Kahet"] = ""
-- L["Alexi Barov <House of Barov>"] = ""
-- L["Alexston Chrome <Tavern of Time>"] = ""
-- L["Alliance Base"] = ""
-- L["Altar of Blood"] = ""
-- L["Altar of the Deeps"] = ""
-- L["Alurmi"] = ""
-- L["Alurmi <Keepers of Time Quartermaster>"] = ""
-- L["Aluyen <Reagents>"] = ""
-- L["Alyson Antille"] = ""
L["\"Ambassador\" Dagg'thol"] = "\"Embaixador\" Dagg'thol" -- Needs review
-- L["Ambassador Pax'ivi"] = ""
-- L["Ambrose Boltspark"] = ""
-- L["Amnennar's Phylactery"] = ""
-- L["Anachronos <Keepers of Time>"] = ""
-- L["Ancient Equine Spirit"] = ""
-- L["Ancient Treasure"] = ""
-- L["Andorgos <Brood of Malygos>"] = ""
-- L["Andormu <Keepers of Time>"] = ""
-- L["AN, Nerub"] = ""
-- L["Aoren Sunglow <The Reliquary>"] = ""
-- L["Apoko"] = ""
-- L["Apothecary Baxter <Crown Chemical Co.>"] = ""
-- L["Apothecary Frye <Crown Chemical Co.>"] = ""
-- L["Apothecary Hummel <Crown Chemical Co.>"] = ""
-- L["Apothecary Trio"] = ""
-- L["Apprentice Darius"] = ""
L["AQ"] = "AQ"
-- L["AQ10"] = ""
L["AQ20"] = "AQ20"
L["AQ40"] = "AQ40"
-- L["Arazmodu <The Scale of Sands>"] = ""
-- L["Arca"] = ""
-- L["Arcane Container"] = ""
-- L["Archivum Console"] = ""
-- L["Archmage Alturus"] = ""
-- L["Archmage Angela Dosantos <Brotherhood of the Light>"] = ""
-- L["Archmage Elandra <Kirin Tor>"] = ""
-- L["Archmage Koreln <Kirin Tor>"] = ""
-- L["Archmage Leryda"] = ""
-- L["Archritualist Kelada"] = ""
-- L["Arinoth"] = ""
-- L["Armory"] = ""
-- L["Arms Warrior"] = ""
-- L["Artificer Morphalius"] = ""
-- L["Arygos"] = ""
-- L["Ashelan Northwood"] = ""
-- L["ATLAS_BUTTON_CLOSE"] = ""
L["ATLAS_BUTTON_TOOLTIP_HINT"] = [=[Botão esquerdo para abrir o Atlas
Botão do meio para opções do Atlas
Botão direito e arraste para mover este botão]=] -- Needs review
L["ATLAS_BUTTON_TOOLTIP_TITLE"] = "Atlas"
L["ATLAS_DDL_CONTINENT"] = "Continente" -- Needs review
-- L["ATLAS_DDL_CONTINENT_BROKENISLES"] = ""
L["ATLAS_DDL_CONTINENT_DEEPHOLM"] = "Masmorras de Geodomo" -- Needs review
-- L["ATLAS_DDL_CONTINENT_DRAENOR"] = ""
L["ATLAS_DDL_CONTINENT_EASTERN"] = "Masmorras dos Reinos do Leste" -- Needs review
L["ATLAS_DDL_CONTINENT_KALIMDOR"] = "Masmorras de Kalimdor" -- Needs review
L["ATLAS_DDL_CONTINENT_NORTHREND"] = "Masmorras de Nortúndria" -- Needs review
L["ATLAS_DDL_CONTINENT_OUTLAND"] = "Masmorras de Terralém" -- Needs review
-- L["ATLAS_DDL_CONTINENT_PANDARIA"] = ""
L["ATLAS_DDL_EXPANSION"] = "Expansão" -- Needs review
L["ATLAS_DDL_EXPANSION_BC"] = "Masmorras de Burning Crusade" -- Needs review
L["ATLAS_DDL_EXPANSION_CATA"] = "Masmorras do Cataclisma" -- Needs review
-- L["ATLAS_DDL_EXPANSION_LEGION"] = ""
-- L["ATLAS_DDL_EXPANSION_MOP"] = ""
L["ATLAS_DDL_EXPANSION_OLD_AO"] = "Masmorras do mundo Antigo A-O" -- Needs review
-- L["ATLAS_DDL_EXPANSION_OLD_PZ"] = ""
-- L["ATLAS_DDL_EXPANSION_WOD"] = ""
-- L["ATLAS_DDL_EXPANSION_WOTLK"] = ""
-- L["ATLAS_DDL_LEVEL"] = ""
-- L["ATLAS_DDL_LEVEL_100PLUS"] = ""
-- L["ATLAS_DDL_LEVEL_100TO110"] = ""
-- L["ATLAS_DDL_LEVEL_110PLUS"] = ""
-- L["ATLAS_DDL_LEVEL_45TO60"] = ""
-- L["ATLAS_DDL_LEVEL_60TO70"] = ""
-- L["ATLAS_DDL_LEVEL_70TO80"] = ""
-- L["ATLAS_DDL_LEVEL_80TO85"] = ""
-- L["ATLAS_DDL_LEVEL_85PLUS"] = ""
-- L["ATLAS_DDL_LEVEL_85TO90"] = ""
-- L["ATLAS_DDL_LEVEL_90TO100"] = ""
-- L["ATLAS_DDL_LEVEL_UNDER45"] = ""
-- L["ATLAS_DDL_PARTYSIZE"] = ""
-- L["ATLAS_DDL_PARTYSIZE_10_AN"] = ""
-- L["ATLAS_DDL_PARTYSIZE_10_OZ"] = ""
-- L["ATLAS_DDL_PARTYSIZE_20TO40"] = ""
-- L["ATLAS_DDL_PARTYSIZE_20TO40AH"] = ""
-- L["ATLAS_DDL_PARTYSIZE_20TO40IZ"] = ""
-- L["ATLAS_DDL_PARTYSIZE_5_AE"] = ""
-- L["ATLAS_DDL_PARTYSIZE_5_FS"] = ""
-- L["ATLAS_DDL_PARTYSIZE_5_TZ"] = ""
L["ATLAS_DDL_TYPE"] = "Tipo" -- Needs review
L["ATLAS_DDL_TYPE_ENTRANCE"] = "Entradas"
-- L["ATLAS_DDL_TYPE_INSTANCE_AB"] = ""
-- L["ATLAS_DDL_TYPE_INSTANCE_AC"] = ""
-- L["ATLAS_DDL_TYPE_INSTANCE_CF"] = ""
-- L["ATLAS_DDL_TYPE_INSTANCE_DR"] = ""
-- L["ATLAS_DDL_TYPE_INSTANCE_GM"] = ""
-- L["ATLAS_DDL_TYPE_INSTANCE_NS"] = ""
-- L["ATLAS_DDL_TYPE_INSTANCE_SZ"] = ""
-- L["ATLAS_DDL_TYPE_INSTANCE_TZ"] = ""
-- L["ATLAS_DEP_MSG1"] = ""
-- L["ATLAS_DEP_MSG2"] = ""
-- L["ATLAS_DEP_MSG3"] = ""
-- L["ATLAS_DEP_OK"] = ""
L["ATLAS_ENTRANCE_BUTTON"] = "Entrada"
-- L["ATLAS_INFO"] = ""
-- L["ATLAS_INFO_12200"] = ""
-- L["ATLAS_INFO_12201"] = ""
-- L["ATLAS_INSTANCE_BUTTON"] = ""
-- L["ATLAS_LDB_HINT"] = ""
-- L["ATLAS_MINIMAPLDB_HINT"] = ""
-- L["ATLAS_MISSING_MODULE"] = ""
-- L["ATLAS_OPEN_ADDON_LIST"] = ""
-- L["ATLAS_OPTIONS_ACRONYMS"] = ""
-- L["ATLAS_OPTIONS_ACRONYMS_TIP"] = ""
-- L["ATLAS_OPTIONS_AUTOSEL"] = ""
-- L["ATLAS_OPTIONS_AUTOSEL_TIP"] = ""
-- L["ATLAS_OPTIONS_BOSS_DESC"] = ""
-- L["ATLAS_OPTIONS_BOSS_DESC_SCALE"] = ""
-- L["ATLAS_OPTIONS_BOSS_DESC_TIP"] = ""
L["ATLAS_OPTIONS_BUTPOS"] = "Poisção do botão"
-- L["ATLAS_OPTIONS_BUTRAD"] = ""
L["ATLAS_OPTIONS_BUTTON"] = "Opções"
-- L["ATLAS_OPTIONS_CATDD"] = ""
-- L["ATLAS_OPTIONS_CHECKMODULE"] = ""
-- L["ATLAS_OPTIONS_CHECKMODULE_TIP"] = ""
-- L["ATLAS_OPTIONS_CLAMPED"] = ""
-- L["ATLAS_OPTIONS_CLAMPED_TIP"] = ""
-- L["ATLAS_OPTIONS_COLORINGDROPDOWN"] = ""
-- L["ATLAS_OPTIONS_COLORINGDROPDOWN_TIP"] = ""
-- L["ATLAS_OPTIONS_CTRL"] = ""
-- L["ATLAS_OPTIONS_CTRL_TIP"] = ""
-- L["ATLAS_OPTIONS_DONTSHOWAGAIN"] = ""
-- L["ATLAS_OPTIONS_LOCK"] = ""
-- L["ATLAS_OPTIONS_LOCK_TIP"] = ""
-- L["ATLAS_OPTIONS_RCLICK"] = ""
-- L["ATLAS_OPTIONS_RCLICK_TIP"] = ""
-- L["ATLAS_OPTIONS_RESETPOS"] = ""
-- L["ATLAS_OPTIONS_SCALE"] = ""
-- L["ATLAS_OPTIONS_SHOWBUT"] = ""
-- L["ATLAS_OPTIONS_SHOWBUT_TIP"] = ""
-- L["ATLAS_OPTIONS_TRANS"] = ""
-- L["ATLAS_SEARCH_UNAVAIL"] = ""
L["ATLAS_SLASH"] = "/atlas"
-- L["ATLAS_SLASH_OPTIONS"] = ""
L["ATLAS_STRING_CLEAR"] = "Claro"
-- L["ATLAS_STRING_LEVELRANGE"] = ""
L["ATLAS_STRING_LOCATION"] = "Localização"
-- L["ATLAS_STRING_MINLEVEL"] = ""
-- L["ATLAS_STRING_PLAYERLIMIT"] = ""
-- L["ATLAS_STRING_RECLEVELRANGE"] = ""
L["ATLAS_STRING_SEARCH"] = "Pesquisa"
-- L["ATLAS_STRING_SELECT_CAT"] = ""
-- L["ATLAS_STRING_SELECT_MAP"] = ""
L["ATLAS_TITLE"] = "Atlas"
-- L["Attunement Required"] = ""
-- L["Auch"] = ""
-- L["Augh"] = ""
-- L["Auld Stonespire"] = ""
-- L["Auntie Stormstout"] = ""
-- L["Avatar of the Martyred"] = ""
-- L["Back"] = ""
-- L["Baelog's Chest"] = ""
-- L["Bakkalzu"] = ""
-- L["Baleflame"] = ""
-- L["Ban Bearheart"] = ""
-- L["Barkeep Kelly <Bartender>"] = ""
-- L["Barnes <The Stage Manager>"] = ""
-- L["Baroness Dorothea Millstipe"] = ""
-- L["Baron Rafe Dreuger"] = ""
-- L["Basement"] = ""
-- L["Battle for Mount Hyjal"] = ""
-- L["B.E Barechus <S.A.F.E.>"] = ""
-- L["Belgaristrasz"] = ""
-- L["Belnistrasz"] = ""
-- L["Bennett <The Sergeant at Arms>"] = ""
-- L["Berinand's Research"] = ""
-- L["Berserking Boulder Roller"] = ""
-- L["Berthold <The Doorman>"] = ""
-- L["BF"] = ""
-- L["BFD"] = ""
-- L["BH"] = ""
-- L["Bilger the Straight-laced"] = ""
-- L["BINDING_HEADER_ATLAS_TITLE"] = ""
-- L["BINDING_NAME_ATLAS_AUTOSEL"] = ""
-- L["BINDING_NAME_ATLAS_OPTIONS"] = ""
-- L["BINDING_NAME_ATLAS_TOGGLE"] = ""
-- L["Black Dragonflight Chamber"] = ""
-- L["Blacksmithing Plans"] = ""
-- L["Blastmaster Emi Shortfuse"] = ""
-- L["Blood Guard Hakkuz <Darkspear Elite>"] = ""
-- L["Blood of Innocents"] = ""
-- L["Bloodslayer T'ara <Darkspear Veteran>"] = ""
-- L["Bloodslayer Vaena <Darkspear Veteran>"] = ""
-- L["Bloodslayer Zala <Darkspear Veteran>"] = ""
-- L["Bodley"] = ""
-- L["Bortega <Reagents & Poison Supplies>"] = ""
-- L["BoT"] = ""
-- L["Bota"] = ""
-- L["Bovaal Whitehorn"] = ""
-- L["Bowmistress Li <Guard Captain>"] = ""
-- L["Brann Bronzebeard"] = ""
-- L["Brazen"] = ""
-- L["BRC"] = ""
-- L["BRD"] = ""
-- L["Brewfest"] = ""
-- L["BRF"] = ""
-- L["Brigg Smallshanks"] = ""
-- L["Briney Boltcutter <Blackwater Financial Interests>"] = ""
-- L["BRM"] = ""
-- L["Broken Stairs"] = ""
-- L["BSM"] = ""
-- L["BT"] = ""
-- L["Bucket of Meaty Dog Food"] = ""
-- L["BWD"] = ""
-- L["BWL"] = ""
-- L["Cache of Eregos"] = ""
-- L["Caelestrasz"] = ""
-- L["Calliard <The Nightman>"] = ""
-- L["Captain Alina"] = ""
-- L["Captain Boneshatter"] = ""
-- L["Captain Drenn"] = ""
-- L["Captain Edward Hanes"] = ""
-- L["Captain Hadan"] = ""
L["\"Captain\" Kaftiz"] = "\"Capitão\" Kaftiz" -- Needs review
-- L["Captain Qeez"] = ""
-- L["Captain Sanders"] = ""
-- L["Captain Taylor"] = ""
-- L["Captain Tuubid"] = ""
-- L["Captain Wyrmak"] = ""
-- L["Captain Xurrem"] = ""
-- L["Cath"] = ""
-- L["Cathedral"] = ""
-- L["Cavern Entrance"] = ""
-- L["Caza'rez"] = ""
-- L["Celebras the Redeemed"] = ""
-- L["Centrifuge Construct"] = ""
-- L["Champ"] = ""
-- L["Champions of the Alliance"] = ""
-- L["Champions of the Horde"] = ""
-- L["Charred Bone Fragment"] = ""
-- L["Chase Begins"] = ""
-- L["Chase Ends"] = ""
-- L["Chef Jessen <Speciality Meat & Slop>"] = ""
-- L["Chen Stormstout"] = ""
-- L["Chester Copperpot <General & Trade Supplies>"] = ""
-- L["Chief Engineer Bilgewhizzle <Gadgetzan Water Co.>"] = ""
-- L["Child"] = ""
-- L["Chomper"] = ""
-- L["Chromie"] = ""
-- L["Chronicler Bah'Kini"] = ""
-- L["Clarissa"] = ""
-- L["Click to open Dungeon Journal window."] = ""
-- L["Coffer of Forgotten Souls"] = ""
-- L["Colon"] = ""
-- L["Colonel Zerran"] = ""
-- L["Colosos"] = ""
-- L["Comma"] = ""
-- L["Commander Bagran"] = ""
-- L["Commander Lindon"] = ""
-- L["Commander Mograine"] = ""
-- L["Compendium of the Fallen"] = ""
-- L["Connection"] = ""
-- L["Core Fragment"] = ""
-- L["CoT"] = ""
-- L["CoT1"] = ""
-- L["CoT2"] = ""
-- L["CoT3"] = ""
-- L["CoT-DS"] = ""
-- L["CoT-ET"] = ""
-- L["CoT-HoT"] = ""
-- L["CoT-Strat"] = ""
-- L["CoT-WoE"] = ""
-- L["CR"] = ""
-- L["Crus"] = ""
-- L["Crusade Commander Eligor Dawnbringer <Brotherhood of the Light>"] = ""
-- L["Crusade Commander Korfax <Brotherhood of the Light>"] = ""
-- L["Crusaders' Coliseum"] = ""
-- L["Crusaders' Square Postbox"] = ""
-- L["Cryo-Engineer Sha'heen"] = ""
-- L["Cursed Centaur"] = ""
-- L["Dantalionax"] = ""
-- L["Darkheart"] = ""
-- L["Dark Keeper Key"] = ""
-- L["Dark Ranger Kalira"] = ""
-- L["Dark Ranger Loralen"] = ""
-- L["Dark Ranger Marrah"] = ""
-- L["Dark Ranger Velonara"] = ""
-- L["Dasnurimi <Geologist & Conservator>"] = ""
-- L["Dealer Tariq <Shady Dealer>"] = ""
-- L["Dealer Vijaad"] = ""
-- L["Deathstalker Commander Belmont"] = ""
-- L["Defender Mordun"] = ""
-- L["Dire Maul Arena"] = ""
-- L["Dire Pool"] = ""
-- L["Divination Scryer"] = ""
-- L["DM"] = ""
-- L["Dominic"] = ""
-- L["Don Carlos"] = ""
-- L["D'ore"] = ""
-- L["Draenei Spirit"] = ""
-- L["Drakkisath's Brand"] = ""
-- L["Drakuru's Brazier"] = ""
-- L["Drisella"] = ""
-- L["Druid of the Talon"] = ""
-- L["DTK"] = ""
-- L["Earthbinder Rayge"] = ""
-- L["Earthwarden Yrsa <The Earthen Ring>"] = ""
-- L["East"] = ""
-- L["EB"] = ""
-- L["Ebonlocke <The Noble>"] = ""
-- L["Ebru <Disciple of Naralex>"] = ""
-- L["Echoing Horn of the Damned"] = ""
-- L["Echo of Medivh"] = ""
-- L["Elder Chogan'gada"] = ""
-- L["Elder Farwhisper"] = ""
-- L["Elder Igasho"] = ""
-- L["Elder Jarten"] = ""
-- L["Elder Kilias"] = ""
-- L["Elder Mistwalker"] = ""
-- L["Elder Morndeep"] = ""
-- L["Elder Nurgen"] = ""
-- L["Elder Ohanzee"] = ""
-- L["Elder Splitrock"] = ""
-- L["Elders' Square Postbox"] = ""
-- L["Elder Starsong"] = ""
-- L["Elder Stonefort"] = ""
-- L["Elder Wildmane"] = ""
-- L["Elder Yurauk"] = ""
-- L["Elevator"] = ""
-- L["Ellrys Duskhallow"] = ""
-- L["End"] = ""
-- L["Engineer"] = ""
-- L["Entrance"] = ""
-- L["Eramas Brightblaze"] = ""
-- L["Erozion"] = ""
-- L["Escape from Durnholde Keep"] = ""
-- L["Estulan <The Highborne>"] = ""
-- L["Eternos"] = ""
-- L["Ethereal Transporter Control Panel"] = ""
-- L["Eulinda <Reagents>"] = ""
-- L["Eva Sarkhoff"] = ""
-- L["Event"] = ""
-- L["Exalted"] = ""
-- L["Exarch Larethor"] = ""
-- L["Exit"] = ""
-- L["Face <S.A.F.E.>"] = ""
-- L["Fairbanks"] = ""
-- L["Falrin Treeshaper"] = ""
-- L["Farmer Kent"] = ""
-- L["Farseer Tooranu <The Earthen Ring>"] = ""
-- L["Father Flame"] = ""
-- L["Fathom Stone"] = ""
-- L["Fel Crystals"] = ""
-- L["Fenstalker"] = ""
-- L["Ferra"] = ""
-- L["Festival Lane Postbox"] = ""
-- L["FH1"] = ""
-- L["FH2"] = ""
-- L["FH3"] = ""
-- L["Field Commander Mahfuun"] = ""
-- L["Finkle Einhorn"] = ""
-- L["Fire of Aku'mai"] = ""
-- L["First Fragment Guardian"] = ""
-- L["Fizzle"] = ""
-- L["FL"] = ""
-- L["Flaming Eradicator"] = ""
-- L["Flesh'rok the Diseased <Primordial Saurok Horror>"] = ""
-- L["Focused Eye"] = ""
-- L["Forbidden Rites and other Rituals Necromantic"] = ""
-- L["Forest Frogs"] = ""
-- L["FoS"] = ""
-- L["Four Kaldorei Elites"] = ""
-- L["Fourth Stop"] = ""
-- L["Frances Lin <Barmaid>"] = ""
-- L["Fras Siabi's Postbox"] = ""
-- L["From previous map"] = ""
-- L["Front"] = ""
-- L["Frostwyrm Lair"] = ""
-- L["Furgus Warpwood"] = ""
-- L["Galamav the Marksman <Kargath Expeditionary Force>"] = ""
-- L["Galgrom <Provisioner>"] = ""
-- L["Garaxxas"] = ""
-- L["Gazakroth"] = ""
-- L["GB"] = ""
-- L["GD"] = ""
-- L["Ghost"] = ""
-- L["GL"] = ""
-- L["Gnome"] = ""
-- L["Gomora the Bloodletter"] = ""
-- L["Gorkun Ironskull"] = ""
-- L["Gradav <The Warlock>"] = ""
-- L["Graveyard"] = ""
-- L["Greatfather Aldrimus"] = ""
-- L["GSS"] = ""
-- L["Guardian of Time"] = ""
-- L["Gub <Destroyer of Fish>"] = ""
-- L["Guerrero"] = ""
-- L["Gun"] = ""
-- L["Gunny"] = ""
-- L["GY"] = ""
-- L["Ha'lei"] = ""
-- L["Ha'Lei"] = ""
-- L["Hallow's End"] = ""
-- L["Halls"] = ""
-- L["Hal McAllister"] = ""
-- L["Hann Ibal <S.A.F.E.>"] = ""
-- L["Harald <Food Vendor>"] = ""
-- L["Hastings <The Caretaker>"] = ""
-- L["Haunted Stable Hand"] = ""
-- L["Hazlek"] = ""
-- L["HC"] = ""
-- L["Helcular"] = ""
-- L["Helpful Jungle Monkey"] = ""
-- L["Herod the Bully"] = ""
-- L["Heroic"] = ""
-- L["Heroic_Symbol"] = ""
-- L["Heroic: Trial of the Grand Crusader"] = ""
-- L["Hierophant Theodora Mulvadania <Kargath Expeditionary Force>"] = ""
-- L["High Examiner Tae'thelan Bloodwatcher <The Reliquary>"] = ""
-- L["High Justice Grimstone"] = ""
-- L["HM"] = ""
-- L["HoF"] = ""
-- L["HoL"] = ""
-- L["Holy Paladin"] = ""
-- L["Holy Priest"] = ""
-- L["HoO"] = ""
-- L["Hooded Crusader"] = ""
-- L["HoR"] = ""
-- L["Horde Encampment"] = ""
-- L["Horvon the Armorer <Armorsmith>"] = ""
-- L["HoS"] = ""
-- L["Hunter"] = ""
-- L["Hyphen"] = ""
-- L["IC"] = ""
-- L["ID"] = ""
-- L["Image of Argent Confessor Paletress"] = ""
-- L["Image of Drakuru"] = ""
-- L["Imp"] = ""
-- L["Indormi <Keeper of Ancient Gem Lore>"] = ""
-- L["Innkeeper Monica"] = ""
-- L["Instructor Chillheart's Phylactery"] = ""
-- L["In the Shadow of the Light"] = ""
-- L["Investigator Fezzen Brasstacks"] = ""
-- L["Invoker Xorenth"] = ""
-- L["Ironbark the Redeemed"] = ""
-- L["Isfar"] = ""
-- L["Isillien"] = ""
-- L["Itesh"] = ""
-- L["Jaelyne Evensong"] = ""
-- L["Jalinda Sprig <Morgan's Militia>"] = ""
-- L["Jay Lemieux"] = ""
-- L["J'eevee's Jar"] = ""
-- L["Je'neu Sancrea <The Earthen Ring>"] = ""
-- L["Jerry Carter"] = ""
-- L["Jonathan Revah"] = ""
-- L["Joseph the Awakened"] = ""
-- L["Joseph the Crazed"] = ""
-- L["Joseph the Insane <Scarlet Champion>"] = ""
-- L["Julie Honeywell"] = ""
-- L["Kagani Nightstrike"] = ""
-- L["Kagtha"] = ""
-- L["Kaldir Ironbane"] = ""
-- L["Kaldrick"] = ""
-- L["Kamsis <The Conjurer>"] = ""
-- L["Kandrostrasz <Brood of Alexstrasza>"] = ""
-- L["Kand Sandseeker <Explorer's League>"] = ""
-- L["Kara"] = ""
-- L["Kasha"] = ""
-- L["Kaulema the Mover"] = ""
-- L["Keanna's Log"] = ""
-- L["Kel'Thuzad's Deep Knowledge"] = ""
-- L["Kevin Dawson <Morgan's Militia>"] = ""
-- L["Key"] = ""
-- L["Kherrah"] = ""
-- L["King Bjorn"] = ""
-- L["King Haldor"] = ""
-- L["King Ranulf"] = ""
-- L["King's Square Postbox"] = ""
-- L["King Tor"] = ""
-- L["Knot Thimblejack"] = ""
-- L["Koragg"] = ""
-- L["Korag Proudmane"] = ""
-- L["Koren <The Blacksmith>"] = ""
-- L["Koristrasza"] = ""
-- L["Kurzel"] = ""
-- L["Lady Catriona Von'Indi"] = ""
-- L["Lady Jaina Proudmoore"] = ""
-- L["Lady Keira Berrybuck"] = ""
-- L["Lady Sylvanas Windrunner <Banshee Queen>"] = ""
-- L["Lakka"] = ""
-- L["Lana Stouthammer"] = ""
-- L["Landing Spot"] = ""
-- L["Large Stone Obelisk"] = ""
-- L["LBRS"] = ""
-- L["LCoT"] = ""
-- L["L-DQuote"] = ""
-- L["Lead Prospector Durdin <Explorer's League>"] = ""
-- L["Legionnaire Nazgrim"] = ""
-- L["Lenzo"] = ""
-- L["Lexlort <Kargath Expeditionary Force>"] = ""
-- L["Lib"] = ""
-- L["Library"] = ""
-- L["Lidia Sunglow <The Reliquary>"] = ""
-- L["Lieutenant Horatio Laine"] = ""
-- L["Lieutenant Sinclari"] = ""
-- L["Little Jimmy Vishas"] = ""
-- L["Lokhtos Darkbargainer <The Thorium Brotherhood>"] = ""
-- L["Lord Afrasastrasz"] = ""
-- L["Lord Crispin Ference"] = ""
-- L["Lord Itharius"] = ""
-- L["Lord Raadan"] = ""
-- L["Lord Robin Daris"] = ""
-- L["Lorekeeper Javon"] = ""
-- L["Lorekeeper Kildrath"] = ""
-- L["Lorekeeper Lydros"] = ""
-- L["Lorekeeper Mykos"] = ""
-- L["Lorgalis Manuscript"] = ""
-- L["Lothos Riftwaker"] = ""
-- L["Love is in the Air"] = ""
-- L["Lower"] = ""
-- L["L-Parenthesis"] = ""
-- L["L-SBracket"] = ""
-- L["Lucien Sarkhoff"] = ""
-- L["Lumbering Oaf"] = ""
-- L["Lunar Festival"] = ""
-- L["Lurah Wrathvine <Crystallized Firestone Collector>"] = ""
-- L["Madrigosa"] = ""
-- L["Mag"] = ""
-- L["Mage"] = ""
-- L["Magical Brazier"] = ""
-- L["Magistrate Henry Maleb"] = ""
-- L["Mail Box"] = ""
-- L["Main Chambers Access Panel"] = ""
-- L["Major Pakkon"] = ""
-- L["Major Yeggeth"] = ""
-- L["Mamdy the \"Ologist\""] = ""
-- L["MapA"] = ""
-- L["MapB"] = ""
-- L["MapC"] = ""
-- L["MapD"] = ""
-- L["MapE"] = ""
-- L["MapF"] = ""
-- L["MapG"] = ""
-- L["MapH"] = ""
-- L["MapI"] = ""
-- L["MapJ"] = ""
-- L["MapsNotFound"] = ""
-- L["Mara"] = ""
-- L["Market Row Postbox"] = ""
-- L["Marshal Jacob Alerius"] = ""
-- L["Marshal Maxwell <Morgan's Militia>"] = ""
-- L["Martin Victus"] = ""
-- L["Master Craftsman Wilhelm <Brotherhood of the Light>"] = ""
-- L["Master Elemental Shaper Krixix"] = ""
-- L["Master Windstrong"] = ""
-- L["MaT"] = ""
-- L["Mawago"] = ""
-- L["Maxwort Uberglint"] = ""
-- L["Mayara Brightwing <Morgan's Militia>"] = ""
-- L["Mazoga's Spirit"] = ""
-- L["MC"] = ""
-- L["Mech"] = ""
-- L["Meeting Stone"] = ""
-- L["Meeting Stone of Hellfire Citadel"] = ""
-- L["Meeting Stone of Magtheridon's Lair"] = ""
-- L["Melasong"] = ""
-- L["Melissa"] = ""
-- L["Merithra of the Dream"] = ""
-- L["Micah"] = ""
-- L["Middle"] = ""
-- L["Midsummer Festival"] = ""
-- L["Millhouse Manastorm"] = ""
-- L["Miss Mayhem"] = ""
-- L["Mistress Nagmara"] = ""
-- L["Monara <The Last Queen>"] = ""
-- L["Monk"] = ""
-- L["Moonwell"] = ""
-- L["Mor'Lek the Dismantler"] = ""
-- L["Mortaxx <The Tolling Bell>"] = ""
-- L["Mortog Steamhead"] = ""
-- L["Mountaineer Orfus <Morgan's Militia>"] = ""
-- L["MP"] = ""
-- L["Mr. Bigglesworth"] = ""
-- L["MT"] = ""
-- L["Murd Doc <S.A.F.E.>"] = ""
-- L["Muyoh <Disciple of Naralex>"] = ""
-- L["MV"] = ""
-- L["Mysterious Bookshelf"] = ""
-- L["Mythic"] = ""
-- L["Mythic_Symbol"] = ""
-- L["Nahuud"] = ""
-- L["Nalpak <Disciple of Naralex>"] = ""
-- L["Naralex"] = ""
-- L["Naresir Stormfury <Avengers of Hyjal Quartermaster>"] = ""
-- L["Nathanos Marris"] = ""
-- L["Nat Pagle"] = ""
-- L["Naturalist Bite"] = ""
-- L["Nax"] = ""
-- L["Neptulon"] = ""
-- L["Nex, Nexus"] = ""
-- L["Nexus-Prince Haramad"] = ""
-- L["Night Elf Village"] = ""
-- L["No'ku Stormsayer <Lord of Tempest>"] = ""
-- L["Norkani"] = ""
-- L["North"] = ""
-- L["Nozari <Keepers of Time>"] = ""
-- L["Nozdormu"] = ""
-- L["Nurse Lillian"] = ""
-- L["Ocu"] = ""
-- L["Okuno <Ashtongue Deathsworn Quartermaster>"] = ""
-- L["Old Ironbark"] = ""
-- L["Olga Runesworn <Explorer's League>"] = ""
-- L["Ony"] = ""
-- L["Opening of the Dark Portal"] = ""
-- L["Optional"] = ""
-- L["Oralius <Morgan's Militia>"] = ""
-- L["Orange"] = ""
-- L["Orb of Command"] = ""
-- L["Orb of Domination"] = ""
-- L["OS"] = ""
-- L["Outside"] = ""
-- L["Overcharged Manacell"] = ""
-- L["Overseer Blingbang"] = ""
-- L["Overwatch Mark 0 <Protector>"] = ""
-- L["Packleader Ivar Bloodfang"] = ""
-- L["Packmaster Stonebruiser <Brotherhood of the Light>"] = ""
-- L["Paladin"] = ""
-- L["Path to the Broken Stairs"] = ""
-- L["Path to the Hellfire Ramparts and Shattered Halls"] = ""
-- L["Period"] = ""
-- L["Phin Odelic <The Kirin Tor>"] = ""
-- L["Polyformic Acid Potion"] = ""
-- L["Portal"] = ""
-- L["PoS"] = ""
-- L["PossibleMissingModule"] = ""
-- L["Precious"] = ""
-- L["Priest"] = ""
-- L["Priestess Summerpetal"] = ""
-- L["Priestess Udum'bra"] = ""
-- L["Private Jacint"] = ""
-- L["Private Rocknot"] = ""
-- L["Professor Slate"] = ""
-- L["Prospector Doren"] = ""
-- L["Prospector Seymour <Morgan's Militia>"] = ""
-- L["Protection Warrior"] = ""
-- L["Provisioner Tsaalt"] = ""
-- L["Pumpkin Shrine"] = ""
-- L["Purple"] = ""
-- L["Pylons"] = ""
-- L["Quartermaster Lewis <Quartermaster>"] = ""
-- L["Raleigh the True"] = ""
-- L["Ramdor the Mad"] = ""
-- L["Ramp"] = ""
-- L["Ramp down to the Gamesman's Hall"] = ""
-- L["Ramp to Guardian's Library"] = ""
-- L["Ramp to Medivh's Chamber"] = ""
-- L["Ramp up to the Celestial Watch"] = ""
-- L["Random"] = ""
-- L["Randy Whizzlesprocket"] = ""
-- L["Rare"] = ""
-- L["Raven"] = ""
-- L["Razal'blade <Kargath Expeditionary Force>"] = ""
-- L["Razorfen Spearhide"] = ""
-- L["R-DQuote"] = ""
-- L["Reclaimer A'zak"] = ""
-- L["Red Dragonflight Chamber"] = ""
-- L["Red Riding Hood"] = ""
-- L["Reinforced Archery Target"] = ""
-- L["Reinforced Fel Iron Chest"] = ""
-- L["Relic Coffer Key"] = ""
-- L["Relissa"] = ""
-- L["Relwyn Shadestar"] = ""
-- L["Renault Mograine"] = ""
-- L["Repair"] = ""
-- L["Reputation"] = ""
-- L["Retribution Paladin"] = ""
-- L["Rewards"] = ""
-- L["RFC"] = ""
-- L["RFD"] = ""
-- L["RFK"] = ""
-- L["Rifle Commander Coe"] = ""
-- L["Rifleman Brownbeard"] = ""
-- L["Rimefang"] = ""
-- L["Rocky Horror"] = ""
-- L["Rogue"] = ""
-- L["Rosa"] = ""
-- L["Roughshod Pike"] = ""
-- L["R-Parenthesis"] = ""
-- L["RS"] = ""
-- L["R-SBracket"] = ""
-- L["Sa'at <Keepers of Time>"] = ""
-- L["Safe Room"] = ""
-- L["Sally Whitemane"] = ""
-- L["SB"] = ""
-- L["SBG"] = ""
-- L["SC"] = ""
-- L["Scarshield Quartermaster <Scarshield Legion>"] = ""
-- L["Schematic: Field Repair Bot 74A"] = ""
-- L["Scholo"] = ""
-- L["Scourge Invasion Points"] = ""
-- L["Scout Cage"] = ""
-- L["Scout Orgarr"] = ""
-- L["Scout Thaelrid"] = ""
-- L["Scrying Orb"] = ""
-- L["Sebastian <The Organist>"] = ""
-- L["Second Fragment Guardian"] = ""
-- L["Second Stop"] = ""
-- L["Seer Ixit"] = ""
-- L["Seer Kanai"] = ""
-- L["Seer Olum"] = ""
-- L["Semicolon"] = ""
-- L["Sentinel Aluwyn"] = ""
-- L["Sentinel-trainee Issara"] = ""
-- L["Servant Quarters"] = ""
-- L["Seth"] = ""
-- L["SFK"] = ""
-- L["SH"] = ""
-- L["Shado-Master Chum Kiu"] = ""
-- L["Shadowforge Brazier"] = ""
-- L["Shadow Lord Xiraxis"] = ""
-- L["Shadow Priest"] = ""
-- L["Shaman"] = ""
-- L["Shattered Hand Executioner"] = ""
-- L["Shavalius the Fancy <Flight Master>"] = ""
-- L["Shen'dralar Ancient"] = ""
-- L["Shen'dralar Provisioner"] = ""
-- L["Shen'dralar Watcher"] = ""
-- L["Shrine of Gelihast"] = ""
-- L["Sif"] = ""
-- L["Sinan the Dreamer"] = ""
-- L["Sindragosa's Lair"] = ""
-- L["Sister Svalna"] = ""
-- L["Skar'this the Heretic"] = ""
-- L["SL"] = ""
-- L["Slash"] = ""
L["\"Slim\" <Shady Dealer>"] = "\"Magriço\" <Negociante Escuso>" -- Needs review
-- L["Slinky Sharpshiv"] = ""
-- L["Slither"] = ""
-- L["Sliver <Garaxxas' Pet>"] = ""
-- L["Slosh <Food & Drink>"] = ""
-- L["SM"] = ""
-- L["SNT"] = ""
-- L["SoO"] = ""
-- L["Soridormi <The Scale of Sands>"] = ""
-- L["South"] = ""
-- L["Southshore Inn"] = ""
-- L["SP"] = ""
-- L["Spawn Point"] = ""
-- L["Spinestalker"] = ""
-- L["Spiral Stairs to Netherspace"] = ""
-- L["Spirit of Agamaggan <Ancient>"] = ""
-- L["Spirit of Olum"] = ""
-- L["Spirit of Udalo"] = ""
-- L["SPM"] = ""
-- L["Spoils of Blackfathom"] = ""
-- L["Spy Grik'tha"] = ""
-- L["Spy To'gun"] = ""
-- L["SR"] = ""
-- L["SSC"] = ""
-- L["ST"] = ""
-- L["Stairs to Underground Pond"] = ""
-- L["Stairs to Underground Well"] = ""
-- L["Stalvan Mistmantle"] = ""
-- L["Start"] = ""
-- L["Steps and path to the Blood Furnace"] = ""
-- L["Steward of Time <Keepers of Time>"] = ""
-- L["Stinky"] = ""
-- L["Stocks"] = ""
-- L["Stone Guard Kurjack"] = ""
-- L["Stone Guard Stok'ton"] = ""
-- L["Stonemaul Ogre"] = ""
-- L["Stormherald Eljrrin"] = ""
-- L["Strat"] = ""
-- L["Stratholme Courier"] = ""
-- L["Summon"] = ""
-- L["Summoner's Tomb"] = ""
-- L["SuP"] = ""
-- L["Suspicious Bookshelf"] = ""
-- L["SV"] = ""
-- L["Taelan"] = ""
-- L["Talking Skull"] = ""
-- L["Taretha"] = ""
-- L["Teleporter"] = ""
-- L["Teleporter destination"] = ""
-- L["Teleporter to Middle"] = ""
-- L["TEoE"] = ""
-- L["TES"] = ""
-- L["Thal'trak Proudtusk <Kargath Expeditionary Force>"] = ""
-- L["The Behemoth"] = ""
-- L["The Black Anvil"] = ""
-- L["The Black Forge"] = ""
-- L["The Captain's Chest"] = ""
-- L["The Codex of Blood"] = ""
-- L["The Culling of Stratholme"] = ""
-- L["The Dark Grimoire"] = ""
-- L["The Dark Portal"] = ""
-- L["The Deed to Brill"] = ""
-- L["The Deed to Caer Darrow"] = ""
-- L["The Deed to Southshore"] = ""
-- L["The Deed to Tarren Mill"] = ""
-- L["The Discs of Norgannon"] = ""
-- L["The Eye of Haramad"] = ""
-- L["The Keepers"] = ""
-- L["The Map of Zul'Aman"] = ""
-- L["The Master's Terrace"] = ""
-- L["The Nameless Prophet"] = ""
-- L["The Saga of Terokk"] = ""
-- L["The Shadowforge Lock"] = ""
-- L["The Siege"] = ""
-- L["The Sparklematic 5200"] = ""
-- L["The Underspore"] = ""
-- L["The Vault"] = ""
-- L["Third Fragment Guardian"] = ""
-- L["Third Stop"] = ""
-- L["Thomas Yance <Travelling Salesman>"] = ""
-- L["Thrall"] = ""
-- L["Thrall <Warchief>"] = ""
-- L["Thunderheart <Kargath Expeditionary Force>"] = ""
-- L["Thurg"] = ""
-- L["Tiki Lord Mu'Loa"] = ""
-- L["Tiki Lord Zim'wae"] = ""
-- L["Tinkee Steamboil"] = ""
-- L["Tink Sprocketwhistle <Engineering Supplies>"] = ""
-- L["TJS"] = ""
-- L["TK"] = ""
-- L["Tol'mar"] = ""
-- L["Tol'vir Grave"] = ""
-- L["To next map"] = ""
-- L["Top"] = ""
-- L["Torben Zapblast <Teleportation Specialist>"] = ""
-- L["Torch Lever"] = ""
-- L["Tormented Soulpriest"] = ""
-- L["Tor-Tun <The Slumberer>"] = ""
-- L["ToT"] = ""
-- L["ToTT"] = ""
-- L["Towards Illidan Stormrage"] = ""
-- L["Towards Reliquary of Souls"] = ""
-- L["Towards Teron Gorefiend"] = ""
-- L["Tower of Flame"] = ""
-- L["Tower of Frost"] = ""
-- L["Tower of Life"] = ""
-- L["Tower of Storms"] = ""
-- L["Train Ride"] = ""
-- L["Tran'rek"] = ""
-- L["Transport"] = ""
-- L["Tribunal Chest"] = ""
-- L["TSC"] = ""
-- L["T'shu"] = ""
-- L["Tunnel"] = ""
-- L["TWT"] = ""
-- L["Tydormu <Keeper of Lost Artifacts>"] = ""
-- L["Tyllan"] = ""
-- L["Tyrande Whisperwind <High Priestess of Elune>"] = ""
-- L["Tyrith"] = ""
-- L["UB"] = ""
-- L["UBRS"] = ""
-- L["Udalo"] = ""
-- L["UK, Keep"] = ""
-- L["Ulda"] = ""
-- L["Uldu"] = ""
-- L["Unblinking Eye"] = ""
-- L["Underwater"] = ""
-- L["Upper"] = ""
-- L["Upper Spire"] = ""
-- L["UP, Pinn"] = ""
-- L["Urok's Tribute Pile"] = ""
-- L["Varies"] = ""
-- L["VC"] = ""
-- L["Vehini <Assault Provisions>"] = ""
-- L["Velastrasza"] = ""
-- L["Vend-O-Tron D-Luxe"] = ""
-- L["Venomancer Mauri <The Snake's Whisper>"] = ""
-- L["Venomancer T'Kulu <The Toxic Bite>"] = ""
-- L["Verdisa"] = ""
-- L["Vethsera <Brood of Ysera>"] = ""
-- L["VH"] = ""
-- L["VoA"] = ""
-- L["Vol'jin"] = ""
-- L["Voodoo Pile"] = ""
-- L["Vorrel Sengutz"] = ""
-- L["VP"] = ""
-- L["Wanders"] = ""
-- L["Warden Thelwater"] = ""
-- L["Warlock"] = ""
-- L["Warlord Goretooth <Kargath Expeditionary Force>"] = ""
-- L["Warlord Salaris"] = ""
-- L["Warmage Kaitlyn"] = ""
-- L["Warrior"] = ""
-- L["Watcher Gashra"] = ""
-- L["Watcher Jhang"] = ""
-- L["Watcher Narjil"] = ""
-- L["Watcher Silthik"] = ""
-- L["Watchman Doomgrip"] = ""
-- L["Wave 10"] = ""
-- L["Wave 12"] = ""
-- L["Wave 18"] = ""
-- L["Wave 5"] = ""
-- L["Wave 6"] = ""
-- L["WC"] = ""
-- L["Weeder Greenthumb"] = ""
-- L["Weegli Blastfuse"] = ""
-- L["Weldon Barov <House of Barov>"] = ""
-- L["West"] = ""
-- L["Willix the Importer"] = ""
-- L["Windcaller Claw"] = ""
-- L["Witch Doctor Qu'in <Medicine Woman>"] = ""
-- L["Witch Doctor T'wansi"] = ""
-- L["Wizard of Oz"] = ""
-- L["Wrath of the Lich King"] = ""
L["Wravien <The Mage>"] = "Wravien <O Mago>" -- Needs review
L["Yarley <Armorer>"] = "Yarley <Armoraria>" -- Needs review
L["Yazzai"] = "Yazzai" -- Needs review
L["Young Blanchy"] = "Young Blanchy" -- Needs review
L["Ythyar"] = "Ythyar" -- Needs review
L["Yuka Screwspigot <Engineering Supplies>"] = "Yuka Parafuseta <Suprimentos de Engenharia>" -- Needs review
L["ZA"] = "ZA" -- Needs review
L["Zaladormu"] = "Zaladormu" -- Needs review
L["Zanza the Restless"] = "Zanza, o Incansável" -- Needs review
L["Zanzil's Cauldron of Burning Blood"] = "Caldeirão de sangue fervilhante do Zanzil" -- Needs review
L["Zanzil's Cauldron of Frostburn Formula"] = "Caldeirão da fórmula queimagélida do Zanzil" -- Needs review
L["Zanzil's Cauldron of Toxic Torment"] = "Caldeirão de Tormento Tóxico do Zanzil" -- Needs review
-- L["Zao'cho <The Emperor's Shield>"] = ""
L["Zelfan"] = "Zelfan" -- Needs review
L["Zeya"] = "Zeya" -- Needs review
L["ZF"] = "ZF" -- Needs review
L["ZG"] = "ZG" -- Needs review
L["Zixil <Aspiring Merchant>"] = "Zixil <Mercador Aspirante>" -- Needs review
L["Zungam"] = "Zungam" -- Needs review
-- L["ToC/Description"] = ""
-- L["ToC/Title"] = ""

end