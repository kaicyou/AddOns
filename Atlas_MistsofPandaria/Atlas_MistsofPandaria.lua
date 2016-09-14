-- $Id: Atlas_MistsofPandaria.lua 10 2016-09-05 14:52:18Z arith $
--[[

	Atlas, a World of Warcraft instance map browser
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


local BZ = Atlas_GetLocaleLibBabble("LibBabble-SubZone-3.0");
local BF = Atlas_GetLocaleLibBabble("LibBabble-Faction-3.0");
local L = LibStub("AceLocale-3.0"):GetLocale("Atlas_MistsofPandaria");
local ALC = LibStub("AceLocale-3.0"):GetLocale("Atlas");

local BLUE = "|cff6666ff";
local GREN = "|cff66cc33";
local GREY = "|cff999999";
local LBLU = "|cff33cccc";
local _RED = "|cffcc3333";
local ORNG = "|cffcc9933";
local PINK = "|ccfcc33cc";
local PURP = "|cff9900ff";
local WHIT = "|cffffffff";
local YLOW = "|cffcccc33";
local INDENT = "      ";

local myMaps = {
--************************************************
-- Mists of Pandaria Instances
--************************************************
	GateoftheSettingSun = {
		ZoneName = { BZ["Gate of the Setting Sun"] };
		Location = { BZ["Dread Wastes"]..ALC["Slash"]..BZ["Vale of Eternal Blossoms"] };
		DungeonID = "631";
		DungeonHeroicID = "471"; -- yes, it's weird that heroic ID is smaller than normal dungeon ID
		Acronym = L["GSS"];
		WorldMapID = "875";
		JournalInstanceID = "303";
		Module = "Atlas_MistsofPandaria";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ GREN..INDENT..L["Bowmistress Li <Guard Captain>"] };
		{ BLUE.." B) "..ALC["Exit"], 10002 };
		{ WHIT.." 1) "..Atlas_GetBossName("Saboteur Kip'tilak", 655), 655 };
		{ WHIT.." 2) "..Atlas_GetBossName("Striker Ga'dok", 675)..ALC["L-Parenthesis"]..ALC["Upper"]..ALC["R-Parenthesis"], 675 };
		{ WHIT.." 3) "..Atlas_GetBossName("Commander Ri'mok", 676), 676 };
		{ WHIT.." 4) "..Atlas_GetBossName("Raigonn", 649), 649 };
	};
	HeartofFear = {
		ZoneName = { BZ["Heart of Fear"] };
		Location = { BZ["Dread Wastes"] };
		DungeonID = "533";
		DungeonHeroicID = "534";
		Acronym = L["HoF"];
		PlayerLimit = "10/25";
		WorldMapID = "897";
		JournalInstanceID = "330";
		Module = "Atlas_MistsofPandaria";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ BLUE.." B) "..ALC["Connection"], 10002 };
		{ WHIT.." 1) "..Atlas_GetBossName("Imperial Vizier Zor'lok", 745), 745 };
		{ WHIT.." 2) "..Atlas_GetBossName("Blade Lord Ta'yak", 744), 744 };
		{ WHIT.." 3) "..Atlas_GetBossName("Garalon", 713), 713 };
		{ WHIT.." 4) "..Atlas_GetBossName("Wind Lord Mel'jarak", 741), 741 };
		{ WHIT.." 5) "..Atlas_GetBossName("Amber-Shaper Un'sok", 737), 737 };
		{ WHIT..INDENT..Atlas_GetBossName("Amber Monstrosity", 737, 2), 737 };
		{ WHIT.." 6) "..Atlas_GetBossName("Grand Empress Shek'zeer", 743), 743 };
	};
	MoguShanPalace = {
		ZoneName = { BZ["Mogu'shan Palace"] };
		Location = { BZ["Vale of Eternal Blossoms"] };
		DungeonID = "467";
		DungeonHeroicID = "519";
		Acronym = L["MP"];
		WorldMapID = "885";
		JournalInstanceID = "321";
		Module = "Atlas_MistsofPandaria";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ BLUE.." B-C) "..ALC["Connection"], 10002 };
		{ WHIT.." 1) "..Atlas_GetBossName("Trial of the King", 708), 708 };
		{ WHIT..INDENT..Atlas_GetBossName("Haiyan the Unstoppable", 708, 3), 708 };
		{ WHIT..INDENT..Atlas_GetBossName("Kuai the Brute", 708, 1), 708 };
		{ WHIT..INDENT..Atlas_GetBossName("Ming the Cunning", 708, 2), 708 };
		{ WHIT.." 2) "..Atlas_GetBossName("Gekkan", 690), 690 };
		{ WHIT.." 3) "..Atlas_GetBossName("Xin the Weaponmaster", 698), 698 };
		{ GREN.." 1') "..L["Sinan the Dreamer"], 10003 };
	};
	MoguShanVaults = {
		ZoneName = { BZ["Mogu'shan Vaults"] };
		Location = { BZ["Kun-Lai Summit"] };
		DungeonID = "531";
		DungeonHeroicID = "532";
		Acronym = L["MV"];
		PlayerLimit = "10/25";
		WorldMapID = "896";
		JournalInstanceID = "317";
		Module = "Atlas_MistsofPandaria";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ BLUE.." B) "..ALC["Connection"], 10002 };
		{ WHIT.." 1) "..Atlas_GetBossName("The Stone Guard", 679), 679 };
		{ WHIT..INDENT..Atlas_GetBossName("Amethyst Guardian", 679, 1), 679 };
		{ WHIT..INDENT..Atlas_GetBossName("Cobalt Guardian", 679, 2), 679 };
		{ WHIT..INDENT..Atlas_GetBossName("Jade Guardian", 679, 3), 679 };
		{ WHIT..INDENT..Atlas_GetBossName("Jasper Guardian", 679, 4), 679 };
		{ WHIT.." 2) "..Atlas_GetBossName("Feng the Accursed", 689), 689 };
		{ WHIT.." 3) "..Atlas_GetBossName("Gara'jal the Spiritbinder", 682), 682 };
		{ WHIT.." 4) "..Atlas_GetBossName("The Spirit Kings", 687), 687 };
		{ WHIT..INDENT..Atlas_GetBossName("Meng the Demented", 687, 1), 687 };
		{ WHIT..INDENT..Atlas_GetBossName("Qiang the Merciless", 687, 2), 687 };
		{ WHIT..INDENT..Atlas_GetBossName("Subetai the Swift", 687, 3), 687 };
		{ WHIT..INDENT..Atlas_GetBossName("Zian of the Endless Shadow", 687, 4), 687 };
		{ WHIT.." 5) "..Atlas_GetBossName("Elegon", 726), 726 };
		{ WHIT.." 6) "..Atlas_GetBossName("Will of the Emperor", 677), 677 };
		{ WHIT..INDENT..Atlas_GetBossName("Jan-xi", 677, 1), 677 };
		{ WHIT..INDENT..Atlas_GetBossName("Qin-xi", 677, 2), 677 };
	};
	ScarletMonasteryEnt = {
		ZoneName = { BZ["Scarlet Monastery"]..ALC["L-Parenthesis"]..ALC["Entrance"]..ALC["R-Parenthesis"] };
		Location = { BZ["Tirisfal Glades"] };
		LevelRange = "28-40 / 90";
		MinLevel = "26";
		PlayerLimit = "5";
		Acronym = L["SM"];
		Module = "Atlas_MistsofPandaria";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ BLUE.." B) "..BZ["Scarlet Monastery"], 10002 };
		{ BLUE.." C) "..BZ["Scarlet Halls"], 10003 };
	};
	ScarletHalls = {
		ZoneName = { BZ["Scarlet Monastery"]..ALC["Colon"]..BZ["Scarlet Halls"] };
		Location = { BZ["Tirisfal Glades"] };
		DungeonID = "163";
		DungeonHeroicID = "473";
		Acronym = L["Halls"];
		WorldMapID = "874";
		JournalInstanceID = "311";
		Module = "Atlas_MistsofPandaria";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ WHIT.." 1) "..L["Commander Lindon"], 10002 };
		{ WHIT.." 2) "..Atlas_GetBossName("Houndmaster Braun", 660), 660 };
		{ WHIT.." 3) "..Atlas_GetBossName("Armsmaster Harlan", 654), 654 };
		{ WHIT.." 4) "..Atlas_GetBossName("Flameweaver Koegler", 656), 656 };
		{ GREN.." 1') "..L["Hooded Crusader"], 10003 };
		{ INDENT..GREN..L["Bucket of Meaty Dog Food"] };
		{ GREN.." 2') "..L["Reinforced Archery Target"], 10004 };
		{ GREN.." 3') "..L["Bucket of Meaty Dog Food"], 10005 };
	};
	ScarletMonastery = {
		ZoneName = { BZ["Scarlet Monastery"]..ALC["Colon"]..BZ["Scarlet Monastery"] };
		Location = { BZ["Tirisfal Glades"] };
		DungeonID = "164";
		DungeonHeroicID = "474";
		Acronym = L["SM"];
		WorldMapID = "874";
		JournalInstanceID = "316";
		Module = "Atlas_MistsofPandaria";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ GREN.." 1') "..L["Hooded Crusader"], 10002 };
		{ WHIT.." 1) "..Atlas_GetBossName("Thalnos the Soulrender", 688), 688 };
		{ WHIT.." 2) "..Atlas_GetBossName("Brother Korloff", 671), 671 };
		{ WHIT.." 3) "..Atlas_GetBossName("High Inquisitor Whitemane", 674), 674 };
		{ WHIT..INDENT..Atlas_GetBossName("Commander Durand", 674, 2), 674 };
		{ ORNG.." 1) "..Atlas_GetBossName("Headless Horseman")..ALC["L-Parenthesis"]..ALC["Hallow's End"]..ALC["R-Parenthesis"], 10003 };
	};
	Scholomance = {
		ZoneName = { BZ["Scholomance"] };
		Location = { BZ["Western Plaguelands"] };
		DungeonID = "2";
		DungeonHeroicID = "472";
		Acronym = L["Scholo"];
		WorldMapID = "898";
		JournalInstanceID = "246";
		Module = "Atlas_MistsofPandaria";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ BLUE.." B-D) "..ALC["Connection"], 10002 };
		{ WHIT.." 1) "..Atlas_GetBossName("Instructor Chillheart", 659), 659 };
		{ WHIT..INDENT..L["Instructor Chillheart's Phylactery"] };
		{ WHIT.." 2) "..Atlas_GetBossName("Jandice Barov", 663), 663 };
		{ WHIT.." 3) "..Atlas_GetBossName("Rattlegore", 665), 665 };
		{ WHIT.." 4) "..Atlas_GetBossName("Lilian Voss", 666), 666 };
		{ WHIT.." 5) "..L["Professor Slate"], 10003 };
		{ GREN..INDENT..L["Polyformic Acid Potion"] };
		{ WHIT.." 6) "..Atlas_GetBossName("Darkmaster Gandling", 684), 684 };
		{ GREN.." 1') "..L["Talking Skull"], 10004 };
		{ GREN.." 2') "..L["In the Shadow of the Light"], 10005 };
		{ GREN.." 3') "..L["Kel'Thuzad's Deep Knowledge"], 10006 };
		{ GREN.." 4') "..L["Forbidden Rites and other Rituals Necromantic"], 10007 };
		{ GREN.." 5') "..L["Coffer of Forgotten Souls"], 10008 };
		{ GREN.." 6') "..L["The Dark Grimoire"], 10009 };
	};
	ShadoPanMonasteryA = {
		ZoneName = { BZ["Shado-Pan Monastery"]..ALC["MapA"] };
		Location = { BZ["Kun-Lai Summit"] };
		DungeonID = "466";
		DungeonHeroicID = "470";
		Acronym = L["SPM"];
		WorldMapID = "877";
		JournalInstanceID = "312";
		Module = "Atlas_MistsofPandaria";
		{ BLUE.." B-H) "..ALC["Connection"], 10001 };
		{ WHIT.." 1) "..Atlas_GetBossName("Gu Cloudstrike", 673), 673 };
		{ WHIT..INDENT..Atlas_GetBossName("Azure Serpent", 673, 2), 673 };
		{ WHIT.." 4) "..Atlas_GetBossName("Taran Zhu", 686), 686 };
	};
	ShadoPanMonasteryB = {
		ZoneName = { BZ["Shado-Pan Monastery"]..ALC["MapB"] };
		Location = { BZ["Kun-Lai Summit"] };
		DungeonID = "466";
		DungeonHeroicID = "470";
		Acronym = L["SPM"];
		WorldMapID = "877";
		JournalInstanceID = "312";
		Module = "Atlas_MistsofPandaria";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ BLUE.." B-H) "..ALC["Connection"], 10002 };
		{ WHIT.." 2) "..Atlas_GetBossName("Master Snowdrift", 657), 657 };
		{ WHIT.." 3) "..Atlas_GetBossName("Sha of Violence", 685), 685 };
		{ GREN.." 1') "..L["Ban Bearheart"], 10003 };
	};
	SiegeofNiuzaoTempleA = {
		ZoneName = { BZ["Siege of Niuzao Temple"]..ALC["MapA"] };
		Location = { BZ["Townlong Steppes"] };
		DungeonID = "554";
		DungeonHeroicID = "630";
		Acronym = L["SNT"];
		WorldMapID = "887";
		JournalInstanceID = "324";
		Module = "Atlas_MistsofPandaria";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ BLUE.." B-C) "..ALC["Connection"], 10002 };
		{ WHIT.." 1) "..Atlas_GetBossName("Vizier Jin'bak", 693), 693 };
		{ GREN.." 1') "..L["Shado-Master Chum Kiu"], 10003 };
	};
	SiegeofNiuzaoTempleB = {
		ZoneName = { BZ["Siege of Niuzao Temple"]..ALC["MapB"] };
		Location = { BZ["Townlong Steppes"] };
		DungeonID = "554";
		DungeonHeroicID = "630";
		Acronym = L["SNT"];
		WorldMapID = "887";
		JournalInstanceID = "324";
		Module = "Atlas_MistsofPandaria";
		{ BLUE.." C) "..ALC["Connection"], 10001 };
		{ WHIT.." 2) "..Atlas_GetBossName("Commander Vo'jak", 738), 738 };
		{ WHIT.." 3) "..Atlas_GetBossName("General Pa'valak", 692), 692 };
		{ WHIT.." 4) "..Atlas_GetBossName("Wing Leader Ner'onok", 727), 727 };
	};
	SiegeofOrgrimmarA = {
		ZoneName = { BZ["Siege of Orgrimmar"]..ALC["MapA"] };
		Location = { BZ["Vale of Eternal Blossoms"]..ALC["Slash"]..BZ["Orgrimmar"] };
		DungeonID = "714";
		DungeonHeroicID = "715";
		Acronym = L["SoO"];
		PlayerLimit = "10-30";
		WorldMapID = "953";
		JournalInstanceID = "369";
		Module = "Atlas_MistsofPandaria";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ BLUE.." B-D) "..ALC["Connection"], 10002 };
		{ WHIT.." 1) "..Atlas_GetBossName("Immerseus", 852), 852 };
		{ WHIT.." 3) "..Atlas_GetBossName("Norushen", 866), 866 };
		{ WHIT..INDENT..Atlas_GetBossName("Amalgam of Corruption", 866, 2), 866 };
		{ WHIT.." 4) "..Atlas_GetBossName("Sha of Pride", 867), 867 };
	};
	SiegeofOrgrimmarB = {
		ZoneName = { BZ["Siege of Orgrimmar"]..ALC["MapB"] };
		Location = { BZ["Vale of Eternal Blossoms"]..ALC["Slash"]..BZ["Orgrimmar"] };
		DungeonID = "714";
		DungeonHeroicID = "715";
		Acronym = L["SoO"];
		PlayerLimit = "10-30";
		WorldMapID = "953";
		JournalInstanceID = "369";
		Module = "Atlas_MistsofPandaria";
		{ BLUE.." B-C) "..ALC["Connection"], 10001 };
		{ WHIT.." 2) "..Atlas_GetBossName("The Fallen Protectors", 849), 849 };
		{ WHIT..INDENT..Atlas_GetBossName("He Softfoot", 849, 2), 849 };
		{ WHIT..INDENT..Atlas_GetBossName("Rook Stonetoe", 849, 1), 849 };
		{ WHIT..INDENT..Atlas_GetBossName("Sun Tenderheart", 849, 3), 849 };
	};
	SiegeofOrgrimmarC = {
		ZoneName = { BZ["Siege of Orgrimmar"]..ALC["MapC"] };
		Location = { BZ["Vale of Eternal Blossoms"]..ALC["Slash"]..BZ["Orgrimmar"] };
		DungeonID = "714";
		DungeonHeroicID = "715";
		Acronym = L["SoO"];
		PlayerLimit = "10-30";
		WorldMapID = "953";
		JournalInstanceID = "369";
		Module = "Atlas_MistsofPandaria";
		{ BLUE.." D-E) "..ALC["Connection"], 10001 };
		{ WHIT.." 5) "..Atlas_GetBossName("Galakras", 868), 868 };
		{ WHIT.." 6) "..Atlas_GetBossName("Iron Juggernaut", 864), 864 };
		{ WHIT.." 7) "..Atlas_GetBossName("Kor'kron Dark Shaman", 856), 856 };
		{ WHIT..INDENT..Atlas_GetBossName("Earthbreaker Haromm", 856, 1), 856 };
		{ WHIT..INDENT..Atlas_GetBossName("Wavebinder Kardris", 856, 2), 856 };
	};
	SiegeofOrgrimmarD = {
		ZoneName = { BZ["Siege of Orgrimmar"]..ALC["MapD"] };
		Location = { BZ["Vale of Eternal Blossoms"]..ALC["Slash"]..BZ["Orgrimmar"] };
		DungeonID = "714";
		DungeonHeroicID = "715";
		Acronym = L["SoO"];
		PlayerLimit = "10-30";
		WorldMapID = "953";
		JournalInstanceID = "369";
		Module = "Atlas_MistsofPandaria";
		{ BLUE.." E) "..ALC["Connection"], 10001 };
		{ WHIT.." 8) "..Atlas_GetBossName("General Nazgrim", 850), 850 };
		{ WHIT.." 9) "..Atlas_GetBossName("Malkorok", 846), 846 };
		{ WHIT.."10) "..Atlas_GetBossName("Spoils of Pandaria", 870), 870 };
		{ WHIT..INDENT..Atlas_GetBossName("Secured Stockpile of Pandaren Spoils", 870, 1), 870 };
		{ WHIT.."11) "..Atlas_GetBossName("Thok the Bloodthirsty", 851), 851 };
		{ WHIT..INDENT..Atlas_GetBossName("Kor'kron Jailer", 851, 2), 851 };
		{ WHIT.."12) "..Atlas_GetBossName("Siegecrafter Blackfuse", 865), 865 };
		{ WHIT.."13) "..Atlas_GetBossName("Paragons of the Klaxxi", 853), 853 };
		{ WHIT..INDENT..Atlas_GetBossName("Hisek the Swarmkeeper", 853, 2), 853 };
		{ WHIT..INDENT..Atlas_GetBossName("Iyyokuk the Lucid", 853, 8), 853 };
		{ WHIT..INDENT..Atlas_GetBossName("Ka'roz the Locust", 853, 3), 853 };
		{ WHIT..INDENT..Atlas_GetBossName("Kaz'tik the Manipulator", 853, 5), 853 };
		{ WHIT..INDENT..Atlas_GetBossName("Kil'ruk the Wind-Reaver", 853, 9), 853 };
		{ WHIT..INDENT..Atlas_GetBossName("Korven the Prime", 853, 4), 853 };
		{ WHIT..INDENT..Atlas_GetBossName("Rik'kal the Dissector", 853, 7), 853 };
		{ WHIT..INDENT..Atlas_GetBossName("Skeer the Bloodseeker", 853, 1), 853 };
		{ WHIT..INDENT..Atlas_GetBossName("Xaril the Poisoned Mind", 853, 6), 853 };
		{ WHIT.."14) "..Atlas_GetBossName("Garrosh Hellscream", 869), 869 };
	};
	StormstoutBrewery = {
		ZoneName = { BZ["Stormstout Brewery"] };
		Location = { BZ["Valley of the Four Winds"] };
		DungeonID = "465";
		DungeonHeroicID = "469";
		Acronym = L["SB"];
		WorldMapID = "876";
		JournalInstanceID = "302";
		Module = "Atlas_MistsofPandaria";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ BLUE.." B-E) "..ALC["Connection"], 10002 };
		{ WHIT.." 1) "..Atlas_GetBossName("Ook-Ook", 668), 668 };
		{ WHIT.." 2) "..Atlas_GetBossName("Hoptallus", 669), 669 };
		{ WHIT.." 3) "..Atlas_GetBossName("Yan-Zhu the Uncasked", 670), 670 };
		{ GREN.." 1') "..L["Auntie Stormstout"], 10003 };
		{ GREN..INDENT..L["Chen Stormstout"] };
	};
	TempleOfTheJadeSerpent = {
		ZoneName = { BZ["Temple of the Jade Serpent"] };
		Location = { BZ["The Jade Forest"] };
		DungeonID = "464";
		DungeonHeroicID = "468";
		Acronym = L["TJS"];
		WorldMapID = "867";
		JournalInstanceID = "313";
		Module = "Atlas_MistsofPandaria";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ WHIT.." 1) "..Atlas_GetBossName("Wise Mari", 672), 672 };
		{ WHIT.." 2) "..Atlas_GetBossName("Lorewalker Stonestep", 664), 664 };
		{ WHIT.." 3) "..Atlas_GetBossName("Liu Flameheart", 658), 658 };
		{ WHIT.." 4) "..Atlas_GetBossName("Sha of Doubt", 335), 335 };
		{ GREN.." 1') "..L["Master Windstrong"], 10002 };
		{ GREN..INDENT..L["Priestess Summerpetal"] };
	};
	TerraceofEndlessSpring = {
		ZoneName = { BZ["Terrace of Endless Spring"] };
		Location = { BZ["The Veiled Stair"] };
		DungeonID = "535"; -- 10 players
--		DungeonHeroicID = "536"; -- -- 10 players
--		DungeonID = "526"; -- 25 players
		DungeonHeroicID = "834"; -- -- 25 players
		Acronym = L["TES"];
		PlayerLimit = "10/25";
		WorldMapID = "1059";
		JournalInstanceID = "320";
		Module = "Atlas_MistsofPandaria";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ WHIT.." 1) "..Atlas_GetBossName("Protectors of the Endless", 683), 683 };
		{ WHIT..INDENT..Atlas_GetBossName("Elder Asani", 683, 3), 683 };
		{ WHIT..INDENT..Atlas_GetBossName("Elder Regail", 683, 2), 683 };
		{ WHIT..INDENT..Atlas_GetBossName("Protector Kaolan", 683, 1), 683 };
		{ WHIT.." 2) "..Atlas_GetBossName("Tsulong", 742), 742 };
		{ WHIT.." 3) "..Atlas_GetBossName("Lei Shi", 729), 729 };
		{ WHIT.." 4) "..Atlas_GetBossName("Sha of Fear", 709), 709 };
	};
	ThroneofThunderA = {
		ZoneName = { BZ["Throne of Thunder"]..ALC["MapA"] };
		Location = { BZ["Isle of Thunder"] };
		DungeonID = "633";
		DungeonHeroicID = "634";
		Acronym = L["ToT"];
		PlayerLimit = "10/25";
		WorldMapID = "930";
		JournalInstanceID = "362";
		Module = "Atlas_MistsofPandaria";
		{ ORNG..REPUTATION..ALC["Colon"]..BF["Shado-Pan Assault"] };
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ BLUE.." B) "..ALC["Connection"], 10002 };
		{ WHIT.." 1) "..Atlas_GetBossName("Jin'rokh the Breaker", 827), 827 };
		{ WHIT.." 2) "..Atlas_GetBossName("Horridon", 819), 819 };
		{ WHIT.." 3) "..Atlas_GetBossName("Council of Elders", 816), 816 };
		{ WHIT..INDENT..Atlas_GetBossName("Frost King Malakk", 816, 3), 816 };
		{ WHIT..INDENT..Atlas_GetBossName("High PRIESTess Mar'li", 816, 4), 816 };
		{ WHIT..INDENT..Atlas_GetBossName("Kazra'jin", 816, 1), 816 };
		{ WHIT..INDENT..Atlas_GetBossName("Sul the Sandcrawler", 816, 2), 816 };
		{ ORNG.." 1) "..L["Monara <The Last Queen>"]..ALC["L-Parenthesis"]..ALC["Rare"]..ALC["R-Parenthesis"], 10003 };
		{ ORNG.." 2) "..L["No'ku Stormsayer <Lord of Tempest>"]..ALC["L-Parenthesis"]..ALC["Rare"]..ALC["R-Parenthesis"], 10004 };
	};
	ThroneofThunderB = {
		ZoneName = { BZ["Throne of Thunder"]..ALC["MapB"] };
		Location = { BZ["Isle of Thunder"] };
		DungeonID = "633";
		DungeonHeroicID = "634";
		Acronym = L["ToT"];
		PlayerLimit = "10/25";
		WorldMapID = "930";
		JournalInstanceID = "362";
		Module = "Atlas_MistsofPandaria";
		{ ORNG..REPUTATION..ALC["Colon"]..BF["Shado-Pan Assault"] };
		{ BLUE.." B-C) "..ALC["Connection"], 10001 };
		{ WHIT.." 4) "..Atlas_GetBossName("Tortos", 825), 825 };
		{ WHIT.." 5) "..Atlas_GetBossName("Megaera", 821), 821 };
		{ WHIT.." 6) "..Atlas_GetBossName("Ji-Kun", 828), 828 };
		{ ORNG.." 3) "..L["Rocky Horror"]..ALC["L-Parenthesis"]..ALC["Rare"]..ALC["R-Parenthesis"], 10002 };
	};
	ThroneofThunderC = {
		ZoneName = { BZ["Throne of Thunder"]..ALC["MapC"] };
		Location = { BZ["Isle of Thunder"] };
		DungeonID = "633";
		DungeonHeroicID = "634";
		Acronym = L["ToT"];
		PlayerLimit = "10/25";
		WorldMapID = "930";
		JournalInstanceID = "362";
		Module = "Atlas_MistsofPandaria";
		{ ORNG..REPUTATION..ALC["Colon"]..BF["Shado-Pan Assault"] };
		{ BLUE.." C-E) "..ALC["Connection"], 10001 };
		{ WHIT.." 7) "..Atlas_GetBossName("Durumu the Forgotten", 818), 818 };
		{ ORNG..INDENT..L["Focused Eye"]..ALC["L-Parenthesis"]..ALC["Rare"]..ALC["R-Parenthesis"] };
		{ ORNG..INDENT..L["Unblinking Eye"]..ALC["L-Parenthesis"]..ALC["Rare"]..ALC["R-Parenthesis"] };
		{ WHIT.." 8) "..Atlas_GetBossName("Primordius", 820), 820 };
		{ WHIT.." 9) "..Atlas_GetBossName("Dark Animus", 824), 824 };
		{ ORNG.." 4) "..L["Archritualist Kelada"]..ALC["L-Parenthesis"]..ALC["Rare"]..ALC["R-Parenthesis"], 10002 };
		{ ORNG.." 5) "..L["Flesh'rok the Diseased <Primordial Saurok Horror>"]..ALC["L-Parenthesis"]..ALC["Rare"]..ALC["R-Parenthesis"], 10003 };
	};
	ThroneofThunderD = {
		ZoneName = { BZ["Throne of Thunder"]..ALC["MapD"] };
		Location = { BZ["Isle of Thunder"] };
		DungeonID = "633";
		DungeonHeroicID = "634";
		Acronym = L["ToT"];
		PlayerLimit = "10/25";
		WorldMapID = "930";
		JournalInstanceID = "362";
		Module = "Atlas_MistsofPandaria";
		{ ORNG..REPUTATION..ALC["Colon"]..BF["Shado-Pan Assault"] };
		{ BLUE.." D-F) "..ALC["Connection"], 10001 };
		{ WHIT.." 10) "..Atlas_GetBossName("Iron Qon", 817), 817 };
		{ WHIT..INDENT..Atlas_GetBossName("Dam'ren", 817, 4), 817 };
		{ WHIT..INDENT..Atlas_GetBossName("Quet'zal", 817, 3), 817 };
		{ WHIT..INDENT..Atlas_GetBossName("Ro'shak", 817, 2), 817 };
		{ WHIT.." 11) "..Atlas_GetBossName("Twin Consorts", 829), 829 };
		{ WHIT..INDENT..Atlas_GetBossName("Lu'lin", 829, 1), 829 };
		{ WHIT..INDENT..Atlas_GetBossName("Suen", 829, 2), 829 };
		{ WHIT.." 12) "..Atlas_GetBossName("Lei Shen", 832), 832 };
		{ WHIT.." 13) "..Atlas_GetBossName("Ra-den", 831)..ALC["L-Parenthesis"]..ALC["Heroic"]..ALC["R-Parenthesis"], 831 };
		{ ORNG.." 6) "..L["Zao'cho <The Emperor's Shield>"]..ALC["L-Parenthesis"]..ALC["Rare"]..ALC["R-Parenthesis"], 10002 };
	};
};

for k, v in pairs(myMaps) do
	AtlasMaps[k] = v;
end
