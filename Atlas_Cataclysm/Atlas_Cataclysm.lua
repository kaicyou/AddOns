-- $Id: Atlas_Cataclysm.lua 11 2016-09-05 14:50:29Z arith $
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
local L = LibStub("AceLocale-3.0"):GetLocale("Atlas_Cataclysm");
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
-- Cataclysm Instances
--************************************************

	BaradinHold = {
		ZoneName = { BZ["Baradin Hold"] };
		Location = { BZ["Tol Barad"] };
		DungeonID = "328";
		DungeonHeroicID = "329";
		Acronym = L["BH"];
		PlayerLimit = "10/25";
		WorldMapID = "752";
		JournalInstanceID = "75";
		Module = "Atlas_Cataclysm";
		{ ORNG..REPUTATION..ALC["Colon"]..BF["Baradin's Wardens"]..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"] };
		{ ORNG..REPUTATION..ALC["Colon"]..BF["Hellscream's Reach"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"] };
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ WHIT.." 1) "..Atlas_GetBossName("Argaloth", 139), 139 };
		{ WHIT.." 2) "..Atlas_GetBossName("Occu'thar", 140), 140 };
		{ WHIT.." 3) "..Atlas_GetBossName("Alizabal, Mistress of Hate", 339), 339 };
	};
	BlackrockCaverns = {
		ZoneName = { BZ["Blackrock Mountain"]..ALC["Colon"]..BZ["Blackrock Caverns"] };
		Location = { BZ["Searing Gorge"]..ALC["Slash"]..BZ["Burning Steppes"] };
		DungeonID = "303";
		DungeonHeroicID = "323";
		Acronym = L["BRC"];
		WorldMapID = "753";
		JournalInstanceID = "66";
		Module = "Atlas_Cataclysm";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ WHIT.." 1) "..Atlas_GetBossName("Rom'ogg Bonecrusher", 105), 105 };
		{ WHIT.." 2) "..Atlas_GetBossName("Corla, Herald of Twilight", 106), 106 };
		{ WHIT.." 3) "..Atlas_GetBossName("Karsh Steelbender", 107), 107 };
		{ WHIT.." 4) "..Atlas_GetBossName("Beauty", 108), 108 };
		{ WHIT.." 5) "..Atlas_GetBossName("Ascendant Lord Obsidius", 109), 109 };
		{ GREN.." 1') "..L["Finkle Einhorn"], 10002 };
		{ GREN..INDENT..ALC["Teleporter"] };
		{ GREN.." 2') "..ALC["Teleporter"], 10003 };
	};
	BlackwingDescent = {
		ZoneName = { BZ["Blackrock Mountain"]..ALC["Colon"]..BZ["Blackwing Descent"] };
		Location = { BZ["Searing Gorge"]..ALC["Slash"]..BZ["Burning Steppes"] };
		DungeonID = "313";
		DungeonHeroicID = "314";
		Acronym = L["BWD"];
		PlayerLimit = "10/25";
		WorldMapID = "754";
		JournalInstanceID = "73";
		Module = "Atlas_Cataclysm";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ WHIT.." 1) "..Atlas_GetBossName("Magmaw", 170), 170 };
		{ WHIT.." 2) "..Atlas_GetBossName("Omnotron Defense System", 169), 169 };
		{ WHIT.." 3) "..Atlas_GetBossName("Chimaeron", 172), 172 };
		{ WHIT.." 4) "..Atlas_GetBossName("Maloriak", 173), 173 };
		{ WHIT.." 5) "..Atlas_GetBossName("Atramedes", 171), 171 };
		{ WHIT.." 6) "..Atlas_GetBossName("Nefarian's End", 174), 174 };
	};
	CoTDragonSoulA = {
		ZoneName = { BZ["Caverns of Time"]..ALC["Colon"]..BZ["Dragon Soul"]..ALC["MapA"] };
		Location = { BZ["Tanaris"] };
		DungeonID = "447";
		DungeonHeroicID = "448";
		Acronym = L["CoT-DS"];
		PlayerLimit = "10/25";
		WorldMapID = "824";
		JournalInstanceID = "187";
		Module = "Atlas_Cataclysm";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ BLUE.." B) "..ALC["Portal"], 10002 };
		{ WHIT.." 1) "..Atlas_GetBossName("Morchok", 311), 311 };
		{ WHIT.." 5) "..Atlas_GetBossName("Ultraxion", 331)..ALC["L-Parenthesis"]..ALC["Upper"]..ALC["R-Parenthesis"], 331 };
		{ GREN..INDENT..L["Dasnurimi <Geologist & Conservator>"]..ALC["L-Parenthesis"]..ALC["Lower"]..ALC["R-Parenthesis"] };
		{ GREN..INDENT..L["Lord Afrasastrasz"]..ALC["L-Parenthesis"]..ALC["Lower"]..ALC["R-Parenthesis"] };
	};
	CoTDragonSoulB = {
		ZoneName = { BZ["Caverns of Time"]..ALC["Colon"]..BZ["Dragon Soul"]..ALC["MapB"] };
		Location = { BZ["Tanaris"] };
		DungeonID = "447";
		DungeonHeroicID = "448";
		Acronym = L["CoT-DS"];
		PlayerLimit = "10/25";
		WorldMapID = "824";
		JournalInstanceID = "187";
		Module = "Atlas_Cataclysm";
		{ BLUE.." C-E) "..ALC["Portal"], 10001 };
		{ WHIT.." 2) "..Atlas_GetBossName("Warlord Zon'ozz", 324), 324 };
		{ WHIT.." 3) "..Atlas_GetBossName("Yor'sahj the Unsleeping", 325), 325 };
		{ WHIT.." 4) "..Atlas_GetBossName("Hagara the Stormbinder", 317), 317 };
	};
	CoTDragonSoulC = {
		ZoneName = { BZ["Caverns of Time"]..ALC["Colon"]..BZ["Dragon Soul"]..ALC["MapC"] };
		Location = { BZ["Tanaris"] };
		DungeonID = "447";
		DungeonHeroicID = "448";
		Acronym = L["CoT-DS"];
		PlayerLimit = "10/25";
		WorldMapID = "824";
		JournalInstanceID = "187";
		Module = "Atlas_Cataclysm";
		{ WHIT.." 6) "..Atlas_GetBossName("Warmaster Blackhorn", 332), 332 };
		{ WHIT.." 7) "..Atlas_GetBossName("Spine of Deathwing", 318), 318 };
		{ WHIT.." 8) "..Atlas_GetBossName("Madness of Deathwing", 333), 333 };
	};
	CoTEndTime = {
		ZoneName = { BZ["Caverns of Time"]..ALC["Colon"]..BZ["End Time"] };
		Location = { BZ["Tanaris"] };
		DungeonID = "435";
		Acronym = L["CoT-ET"];
		WorldMapID = "820";
		JournalInstanceID = "184";
		Module = "Atlas_Cataclysm";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ GREN..INDENT..L["Alurmi"] };
		{ GREN..INDENT..L["Nozdormu"] };
		{ GREN..INDENT..ALC["Teleporter"] };
		{ WHIT.." 1) "..Atlas_GetBossName("Echo of Baine", 340)..ALC["L-Parenthesis"]..ALC["Random"]..ALC["R-Parenthesis"], 340 };
		{ WHIT.." 2) "..Atlas_GetBossName("Echo of Jaina", 285)..ALC["L-Parenthesis"]..ALC["Random"]..ALC["R-Parenthesis"], 285 };
		{ WHIT.." 3) "..Atlas_GetBossName("Echo of Sylvanas", 323)..ALC["L-Parenthesis"]..ALC["Random"]..ALC["R-Parenthesis"], 323 };
		{ WHIT.." 4) "..Atlas_GetBossName("Echo of Tyrande", 283)..ALC["L-Parenthesis"]..ALC["Random"]..ALC["R-Parenthesis"], 283 };
		{ WHIT.." 5) "..Atlas_GetBossName("Murozond", 289), 289 };
		{ GREN.." 1') "..ALC["Teleporter"], 10002 };
	};
	CoTHourOfTwilight = {
		ZoneName = { BZ["Caverns of Time"]..ALC["Colon"]..BZ["Hour of Twilight"] };
		Location = { BZ["Tanaris"] };
		DungeonID = "439";
		Acronym = L["CoT-HoT"];
		WorldMapID = "819";
		JournalInstanceID = "186";
		Module = "Atlas_Cataclysm";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ GREN..INDENT..L["Thrall"] };
		{ GREN..INDENT..ALC["Teleporter"] };
		{ WHIT.." 1) "..Atlas_GetBossName("Arcurion", 322), 322 };
		{ WHIT.." 2) "..Atlas_GetBossName("Asira Dawnslayer", 342), 342 };
		{ WHIT.." 3) "..Atlas_GetBossName("Archbishop Benedictus", 341), 341 };
		{ BLUE..INDENT..ALC["Portal"]..ALC["L-Parenthesis"]..BZ["Stormwind"]..ALC["Slash"]..BZ["Orgrimmar"]..ALC["R-Parenthesis"] };
	};
	CoTWellOfEternity = {
		ZoneName = { BZ["Caverns of Time"]..ALC["Colon"]..BZ["Well of Eternity"] };
		Location = { BZ["Tanaris"] };
		DungeonID = "437";
		Acronym = L["CoT-WoE"];
		WorldMapID = "816";
		JournalInstanceID = "185";
		Module = "Atlas_Cataclysm";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ GREN..INDENT..L["Alurmi"] };
		{ GREN..INDENT..L["Nozdormu"] };
		{ GREN..INDENT..ALC["Teleporter"] };
		{ WHIT.." 1) "..Atlas_GetBossName("Peroth'arn", 290), 290 };
		{ WHIT.." 2) "..Atlas_GetBossName("Queen Azshara", 291), 291 };
		{ WHIT.." 3) "..Atlas_GetBossName("Mannoroth and Varo'then", 292), 292 };
		{ GREN..INDENT..L["Chromie"] };
		{ GREN.." 1') "..Atlas_GetBossName("Illidan Stormrage"), 10002 };
		{ GREN.." 2') "..ALC["Teleporter"], 10003 };
	};
	Firelands = {
		ZoneName = { BZ["Firelands"] };
		Location = { BZ["Mount Hyjal"] };
		DungeonID = "361";
		DungeonHeroicID = "362";
		Acronym = L["FL"];
		PlayerLimit = "10/25";
		WorldMapID = "800";
		JournalInstanceID = "78";
		Module = "Atlas_Cataclysm";
		{ ORNG..REPUTATION..ALC["Colon"]..BF["Avengers of Hyjal"] };
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ GREN..INDENT..L["Lurah Wrathvine <Crystallized Firestone Collector>"] };
		{ GREN..INDENT..L["Naresir Stormfury <Avengers of Hyjal Quartermaster>"] };
		{ BLUE.." B) "..ALC["Connection"]..ALC["L-Parenthesis"]..ALC["Portal"]..ALC["R-Parenthesis"], 10002 };
		{ WHIT.." 1) "..Atlas_GetBossName("Beth'tilac", 192), 192 };
		{ WHIT.." 2) "..Atlas_GetBossName("Lord Rhyolith", 193), 193 };
		{ WHIT.." 3) "..Atlas_GetBossName("Alysrazor", 194), 194 };
		{ WHIT.." 4) "..Atlas_GetBossName("Shannox", 195), 195 };
		{ WHIT.." 5) "..Atlas_GetBossName("Baleroc, the Gatekeeper", 196), 196 };
		{ WHIT.." 6) "..Atlas_GetBossName("Majordomo Staghelm", 197), 197 };
		{ WHIT.." 7) "..Atlas_GetBossName("Ragnaros", 198), 198 };
		{ GREN.." 1') "..ALC["Teleporter"], 10003 };
	};
	GrimBatol = {
		ZoneName = { BZ["Grim Batol"] };
		Location = { BZ["Twilight Highlands"] };
		DungeonID = "304";
		DungeonHeroicID = "322";
		Acronym = L["GB"];
		WorldMapID = "757";
		JournalInstanceID = "71";
		Module = "Atlas_Cataclysm";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ WHIT.." 1) "..Atlas_GetBossName("General Umbriss", 131), 131 };
		{ WHIT.." 2) "..Atlas_GetBossName("Forgemaster Throngus", 132), 132 };
		{ WHIT.." 3) "..Atlas_GetBossName("Drahga Shadowburner", 133).." & "..Atlas_GetBossName("Valiona", 133, 2), 133 };
		{ WHIT.." 4) "..Atlas_GetBossName("Erudax, the Duke of Below", 134), 134 };
		{ GREN.." 1') "..L["Baleflame"], 10002 };
		{ GREN..INDENT..L["Farseer Tooranu <The Earthen Ring>"] };
		{ GREN..INDENT..L["Velastrasza"] };
	};
	HallsOfOrigination = {
		ZoneName = { BZ["Halls of Origination"] };
		Location = { BZ["Uldum"] };
		DungeonID = "305";
		DungeonHeroicID = "321";
		Acronym = L["HoO"];
		WorldMapID = "759";
		JournalInstanceID = "70";
		Module = "Atlas_Cataclysm";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ WHIT.." 1) "..Atlas_GetBossName("Temple Guardian Anhuur", 124), 124 };
		{ WHIT.." 2) "..Atlas_GetBossName("Earthrager Ptah", 125), 125 };
		{ WHIT.." 3) "..Atlas_GetBossName("Anraphet", 126), 126 };
		{ WHIT.." 4) "..Atlas_GetBossName("Isiset, Construct of Magic", 127), 127 };
		{ WHIT.." 5) "..Atlas_GetBossName("Ammunae, Construct of Life", 128), 128 };
		{ WHIT.." 6) "..Atlas_GetBossName("Setesh, Construct of Destruction", 129), 129 };
		{ WHIT.." 7) "..Atlas_GetBossName("Rajh, Construct of Sun", 130), 130 };
		{ GREN.." 1') "..ALC["Teleporter"], 10002 };
		{ GREN.." 2') "..L["Brann Bronzebeard"], 10003 };
		{ GREN.." 3') "..L["Large Stone Obelisk"], 10004 };
	};
	LostCityOfTolvir = {
		ZoneName = { BZ["Lost City of the Tol'vir"] };
		Location = { BZ["Uldum"] };
		DungeonID = "312";
		DungeonHeroicID = "325";
		Acronym = L["LCoT"];
		WorldMapID = "747";
		JournalInstanceID = "69";
		Module = "Atlas_Cataclysm";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ GREN..INDENT..L["Captain Hadan"] };
		{ WHIT.." 1) "..Atlas_GetBossName("General Husam", 117), 117 };
		{ WHIT.." 2) "..Atlas_GetBossName("Lockmaw", 118), 118 };
		{ WHIT..INDENT..Atlas_GetBossName("Augh", 118, 2), 118 };
		{ WHIT.." 3) "..Atlas_GetBossName("High Prophet Barim", 119), 119 };
		{ WHIT.." 4) "..Atlas_GetBossName("Siamat", 122), 122 };
		{ GREN.." 1') "..L["Tol'vir Grave"], 10002 };
	};
	ShadowfangKeep = {
		ZoneName = { BZ["Shadowfang Keep"] };
		Location = { BZ["Silverpine Forest"] };
		DungeonID = "8";
		DungeonHeroicID = "327";
		Acronym = L["SFK"];
		WorldMapID = "764";
		JournalInstanceID = "64";
		Module = "Atlas_Cataclysm";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ BLUE.." B-C) "..ALC["Connection"], 10002 };
		{ WHIT.." 1) "..Atlas_GetBossName("Baron Ashbury", 96), 96 };
		{ WHIT.." 2) "..Atlas_GetBossName("Baron Silverlaine", 97), 97 };
		{ WHIT..INDENT..Atlas_GetBossName("Odo the Blindwatcher")..ALC["L-Parenthesis"]..ALC["Random"]..ALC["Comma"]..ALC["Summon"]..ALC["R-Parenthesis"] };
		{ WHIT..INDENT..Atlas_GetBossName("Razorclaw the Butcher")..ALC["L-Parenthesis"]..ALC["Random"]..ALC["Comma"]..ALC["Summon"]..ALC["R-Parenthesis"] };
		{ WHIT..INDENT..Atlas_GetBossName("Rethilgore")..ALC["L-Parenthesis"]..ALC["Random"]..ALC["Comma"]..ALC["Summon"]..ALC["R-Parenthesis"] };
		{ WHIT..INDENT..Atlas_GetBossName("Wolf Master Nandos")..ALC["L-Parenthesis"]..ALC["Random"]..ALC["Comma"]..ALC["Summon"]..ALC["R-Parenthesis"] };
		{ WHIT.." 3) "..Atlas_GetBossName("Commander Springvale", 98), 98 };
		{ WHIT.." 4) "..Atlas_GetBossName("Lord Walden", 99), 99 };
		{ WHIT.." 5) "..Atlas_GetBossName("Lord Godfrey", 100), 100 };
		{ ORNG.." 1) "..L["Apothecary Trio"]..ALC["L-Parenthesis"]..ALC["Love is in the Air"]..ALC["R-Parenthesis"], 10003 };
		{ ORNG..INDENT..L["Apothecary Hummel <Crown Chemical Co.>"] };
		{ ORNG..INDENT..L["Apothecary Baxter <Crown Chemical Co.>"] };
		{ ORNG..INDENT..L["Apothecary Frye <Crown Chemical Co.>"] };
		{ GREN.." 1') "..L["Packleader Ivar Bloodfang"]..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"], 10004 };
		{ GREN..INDENT..L["Deathstalker Commander Belmont"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"] };
		{ GREN.." 2') "..L["Haunted Stable Hand"]..ALC["L-Parenthesis"]..ALC["Teleporter"]..ALC["R-Parenthesis"], 10005 };
		{ GREN.." 3') "..L["Investigator Fezzen Brasstacks"]..ALC["L-Parenthesis"]..ALC["Love is in the Air"]..ALC["R-Parenthesis"], 10006 };
	};
	TheBastionOfTwilight = {
		ZoneName = { BZ["The Bastion of Twilight"] };
		Location = { BZ["Twilight Highlands"] };
		DungeonID = "315";
		DungeonHeroicID = "316";
		Acronym = L["BoT"];
		PlayerLimit = "10/25";
		WorldMapID = "758";
		JournalInstanceID = "72";
		Module = "Atlas_Cataclysm";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ BLUE.." B) "..ALC["Connection"], 10002 };
		{ WHIT.." 1) "..Atlas_GetBossName("Halfus Wyrmbreaker", 156), 156 };
		{ WHIT.." 2) "..Atlas_GetBossName("Theralion and Valiona", 157), 157 };
		{ GREN..INDENT..ALC["Teleporter destination"] };
		{ WHIT.." 3) "..Atlas_GetBossName("Ascendant Council", 158), 158 };
		{ GREN..INDENT..ALC["Teleporter destination"] };
		{ WHIT.." 4) "..Atlas_GetBossName("Cho'gall", 167), 167 };
		{ WHIT.." 5) "..Atlas_GetBossName("Sinestra", 168)..ALC["L-Parenthesis"]..ALC["Heroic"]..ALC["R-Parenthesis"], 168 };
		{ GREN.." 1') "..ALC["Teleporter"], 10003 };
	};
	TheDeadminesEnt = {
		ZoneName = { BZ["The Deadmines"]..ALC["L-Parenthesis"]..ALC["Entrance"]..ALC["R-Parenthesis"] };
		Location = { BZ["Westfall"] };
		LevelRange = "15-16 / 85";
		MinLevel = "15";
		PlayerLimit = "5";
		Acronym = L["VC"];
		WorldMapID = "756";
		JournalInstanceID = "63";
		Module = "Atlas_Cataclysm";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ GREN..INDENT..ALC["Meeting Stone"] };
		{ BLUE.." B) "..BZ["The Deadmines"], 10002 };
		{ ORNG.." 1) "..Atlas_GetBossName("Marisa du'Paige")..ALC["L-Parenthesis"]..ALC["Rare"]..ALC["Comma"]..ALC["Varies"]..ALC["R-Parenthesis"], 10003 };
		{ ORNG.." 2) "..Atlas_GetBossName("Brainwashed Noble")..ALC["L-Parenthesis"]..ALC["Rare"]..ALC["R-Parenthesis"], 10004 };
		{ ORNG.." 3) "..Atlas_GetBossName("Foreman Thistlenettle"), 10005 };
	};
	TheDeadmines = {
		ZoneName = { BZ["The Deadmines"] };
		Location = { BZ["Westfall"] };
		DungeonID = "6";
		DungeonHeroicID = "326";
		Acronym = L["VC"];
		WorldMapID = "756";
		JournalInstanceID = "63";
		Module = "Atlas_Cataclysm";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ BLUE.." B) "..ALC["Exit"], 10002 };
		{ WHIT.." 1) "..Atlas_GetBossName("Glubtok", 89), 89 };
		{ WHIT.." 2) "..Atlas_GetBossName("Lumbering Oaf", 90, 2), 90 };
		{ WHIT..INDENT..Atlas_GetBossName("Helix Gearbreaker", 90), 90 };
		{ WHIT.." 3) "..Atlas_GetBossName("Foe Reaper 5000", 91), 91 };
		{ WHIT.." 4) "..Atlas_GetBossName("Admiral Ripsnarl", 92), 92 };
		{ WHIT..INDENT..Atlas_GetBossName("\"Captain\" Cookie", 93), 93 };
		{ WHIT..INDENT..Atlas_GetBossName("Vanessa VanCleef", 95)..ALC["L-Parenthesis"]..ALC["Heroic"]..ALC["R-Parenthesis"], 95 };
		{ GREN.." 1') "..L["Lieutenant Horatio Laine"]..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"], 10003 };
		{ GREN..INDENT..L["Quartermaster Lewis <Quartermaster>"]..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"] };
		{ GREN..INDENT..L["Slinky Sharpshiv"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"] };
		{ GREN..INDENT..L["Kagtha"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"] };
		{ GREN..INDENT..L["Miss Mayhem"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"] };
		{ GREN..INDENT..L["Vend-O-Tron D-Luxe"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"] };
		{ GREN.." 2') "..ALC["Teleporter"], 10004 };
	};
	TheStonecore = {
		ZoneName = { BZ["The Stonecore"] };
		Location = { BZ["Deepholm"] };
		DungeonID = "307";
		DungeonHeroicID = "320";
		Acronym = L["TSC"];
		WorldMapID = "768";
		JournalInstanceID = "67";
		Module = "Atlas_Cataclysm";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ GREN..INDENT..L["Earthwarden Yrsa <The Earthen Ring>"] };
		{ BLUE.." B) "..ALC["Exit"], 10002 };
		{ WHIT.." 1) "..Atlas_GetBossName("Corborus", 110), 110 };
		{ WHIT.." 2) "..Atlas_GetBossName("Slabhide", 111), 111 };
		{ WHIT.." 3) "..Atlas_GetBossName("Ozruk", 112), 112 };
		{ WHIT.." 4) "..Atlas_GetBossName("High PRIESTess Azil", 113), 113 };
		{ GREN.." 1') "..ALC["Teleporter"], 10003 };
	};
	TheVortexPinnacle = {
		ZoneName = { BZ["The Vortex Pinnacle"] };
		Location = { BZ["Uldum"] };
		DungeonID = "311";
		DungeonHeroicID = "319";
		Acronym = L["VP"];
		WorldMapID = "769";
		JournalInstanceID = "68";
		Module = "Atlas_Cataclysm";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ GREN..INDENT..L["Itesh"] };
		{ WHIT.." 1) "..Atlas_GetBossName("Grand Vizier Ertan", 114), 114 };
		{ WHIT.." 2) "..Atlas_GetBossName("Altairus", 115), 115 };
		{ WHIT.." 3) "..Atlas_GetBossName("Asaad, Caliph of Zephyrs", 116), 116 };
		{ GREN.." 1') "..ALC["Teleporter"], 10002 };
		{ GREN.." 2') "..L["Magical Brazier"], 10003 };
	};
	ThroneOfTheFourWinds = {
		ZoneName = { BZ["Throne of the Four Winds"] };
		Location = { BZ["Uldum"] };
		DungeonID = "317";
		DungeonHeroicID = "318";
		Acronym = L["TWT"];
		PlayerLimit = "10/25";
		WorldMapID = "773";
		JournalInstanceID = "74";
		Module = "Atlas_Cataclysm";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ WHIT.." 1) "..Atlas_GetBossName("The Conclave of Wind", 154), 154 };
		{ WHIT..INDENT..Atlas_GetBossName("Anshal", 154, 1)..ALC["L-Parenthesis"]..ALC["West"]..ALC["R-Parenthesis"], 154 };
		{ WHIT..INDENT..Atlas_GetBossName("Nezir", 154, 2)..ALC["L-Parenthesis"]..ALC["North"]..ALC["R-Parenthesis"], 154 };
		{ WHIT..INDENT..Atlas_GetBossName("Rohash", 154, 3)..ALC["L-Parenthesis"]..ALC["East"]..ALC["R-Parenthesis"], 154 };
		{ WHIT.." 2) "..Atlas_GetBossName("Al'Akir", 155), 155 };
	};
	ThroneOfTheTides = {
		ZoneName = { BZ["The Abyssal Maw"]..ALC["Colon"]..BZ["Throne of the Tides"] };
		Location = { BZ["Abyssal Depths"]..ALC["Slash"]..BZ["The Abyssal Maw"] };
		DungeonID = "302";
		DungeonHeroicID = "324";
		Acronym = L["ToTT"];
		WorldMapID = "767";
		JournalInstanceID = "65";
		Module = "Atlas_Cataclysm";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ GREN..INDENT..L["Captain Taylor"]..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"] };
		{ GREN..INDENT..L["Legionnaire Nazgrim"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"] };
		{ BLUE.." B) "..ALC["Connection"], 10002 };
		{ WHIT.." 1) "..Atlas_GetBossName("Lady Naz'jar", 101), 101 };
		{ WHIT.." 2) "..Atlas_GetBossName("Commander Ulthok, the Festering Prince", 102), 102 };
		{ WHIT.." 3) "..Atlas_GetBossName("Erunak Stonespeaker").." & "..Atlas_GetBossName("Mindbender Ghur'sha", 103), 103 };
		{ WHIT.." 4) "..Atlas_GetBossName("Ozumat", 104), 104 };
		{ GREN..INDENT..L["Neptulon"] };
		{ GREN.." 1') "..ALC["Teleporter"], 10003 };
	};
	ZulAman = {
		ZoneName = { BZ["Zul'Aman"] };
		Location = { BZ["Ghostlands"] };
		DungeonID = "340";
		Acronym = L["ZA"];
		WorldMapID = "781";
		JournalInstanceID = "77";
		Module = "Atlas_Cataclysm";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ GREN..INDENT..L["Vol'jin"] };
		{ GREN..INDENT..L["Witch Doctor T'wansi"] };
		{ GREN..INDENT..L["Blood Guard Hakkuz <Darkspear Elite>"] };
		{ GREN..INDENT..L["Voodoo Pile"] };
		{ WHIT.." 1) "..Atlas_GetBossName("Akil'zon", 186), 186 };
		{ GREN..INDENT..L["Bakkalzu"] };
		{ WHIT.." 2) "..Atlas_GetBossName("Nalorakk", 187), 187 };
		{ GREN..INDENT..L["Hazlek"] };
		{ GREN..INDENT..L["The Map of Zul'Aman"] };
		{ WHIT.." 3) "..Atlas_GetBossName("Jan'alai", 188), 188 };
		{ GREN..INDENT..L["Norkani"] };
		{ WHIT.." 4) "..Atlas_GetBossName("Halazzi", 189), 189 };
		{ GREN..INDENT..L["Kasha"] };
		{ WHIT.." 5) "..Atlas_GetBossName("Hex Lord Malacrass", 190), 190 };
		{ WHIT..INDENT..L["Thurg"]..ALC["L-Parenthesis"]..ALC["Random"]..ALC["R-Parenthesis"] };
		{ WHIT..INDENT..L["Gazakroth"]..ALC["L-Parenthesis"]..ALC["Random"]..ALC["R-Parenthesis"] };
		{ WHIT..INDENT..L["Lord Raadan"]..ALC["L-Parenthesis"]..ALC["Random"]..ALC["R-Parenthesis"] };
		{ WHIT..INDENT..L["Darkheart"]..ALC["L-Parenthesis"]..ALC["Random"]..ALC["R-Parenthesis"] };
		{ WHIT..INDENT..L["Alyson Antille"]..ALC["L-Parenthesis"]..ALC["Random"]..ALC["R-Parenthesis"] };
		{ WHIT..INDENT..L["Slither"]..ALC["L-Parenthesis"]..ALC["Random"]..ALC["R-Parenthesis"] };
		{ WHIT..INDENT..L["Fenstalker"]..ALC["L-Parenthesis"]..ALC["Random"]..ALC["R-Parenthesis"] };
		{ WHIT..INDENT..L["Koragg"]..ALC["L-Parenthesis"]..ALC["Random"]..ALC["R-Parenthesis"] };
		{ WHIT.." 6) "..Atlas_GetBossName("Daakara", 191), 191 };
		{ GREN.." 1') "..L["Zungam"], 10002 };
		{ GREN.." 2') "..L["Forest Frogs"], 10003 };
		{ GREN..INDENT..L["Eulinda <Reagents>"] };
		{ GREN..INDENT..L["Harald <Food Vendor>"] };
		{ GREN..INDENT..L["Arinoth"] };
		{ GREN..INDENT..L["Kaldrick"] };
		{ GREN..INDENT..L["Lenzo"] };
		{ GREN..INDENT..L["Mawago"] };
		{ GREN..INDENT..L["Melasong"] };
		{ GREN..INDENT..L["Melissa"] };
		{ GREN..INDENT..L["Micah"] };
		{ GREN..INDENT..L["Relissa"] };
		{ GREN..INDENT..L["Rosa"] };
		{ GREN..INDENT..L["Tyllan"] };
	};	
	ZulGurub = {
		ZoneName = { BZ["Zul'Gurub"] };
		Location = { BZ["Northern Stranglethorn"] };
		DungeonID = "334";
		Acronym = L["ZG"];
		WorldMapID = "793";
		JournalInstanceID = "76";
		Module = "Atlas_Cataclysm";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ GREN.." 1') "..ALC["Meeting Stone"], 10002 };
		{ GREN.." 2') "..L["Briney Boltcutter <Blackwater Financial Interests>"], 10003 };
		{ GREN.." 3') "..L["Vehini <Assault Provisions>"], 10004 };
		{ GREN..INDENT..L["Overseer Blingbang"] };
		{ GREN..INDENT..L["Bloodslayer T'ara <Darkspear Veteran>"] };
		{ GREN..INDENT..L["Bloodslayer Vaena <Darkspear Veteran>"] };
		{ GREN..INDENT..L["Bloodslayer Zala <Darkspear Veteran>"] };
		{ GREN..INDENT..L["Helpful Jungle Monkey"] };
		{ GREN..INDENT..L["Voodoo Pile"] };
		{ WHIT.." 1) "..L["Venomancer Mauri <The Snake's Whisper>"], 10005 };
		{ GREN..INDENT..L["Zanzil's Cauldron of Toxic Torment"] };
		{ WHIT.." 2) "..L["Tiki Lord Mu'Loa"], 10006 };
		{ WHIT.." 3) "..L["Gub <Destroyer of Fish>"], 10007 };
		{ WHIT.." 4) "..L["Venomancer T'Kulu <The Toxic Bite>"], 10008 };
		{ GREN..INDENT..L["Zanzil's Cauldron of Toxic Torment"] };
		{ WHIT.." 5) "..Atlas_GetBossName("High PRIEST Venoxis", 175), 175 };
		{ WHIT.." 6) "..L["Tor-Tun <The Slumberer>"], 10009 };
		{ WHIT.." 7) "..L["Kaulema the Mover"], 10010 };
		{ WHIT.." 8) "..L["Berserking Boulder Roller"], 10011 };
		{ GREN.." 4') "..L["Zanzil's Cauldron of Frostburn Formula"], 10012 };
		{ WHIT.." 9) "..Atlas_GetBossName("Bloodlord Mandokir", 176), 176 };
		{ WHIT.."10) "..L["Mor'Lek the Dismantler"], 10013 };
		{ WHIT.."11) "..L["Witch Doctor Qu'in <Medicine Woman>"], 10014 };
		{ GREN.." 5') "..L["Zanza the Restless"], 10015 };
		{ WHIT.."12) "..BZ["The Cache of Madness"], 10016 };
		{ WHIT..INDENT..Atlas_GetBossName("Gri'lek", 177)..ALC["L-Parenthesis"]..ALC["Random"]..ALC["R-Parenthesis"], 177 };
		{ WHIT..INDENT..Atlas_GetBossName("Hazza'rah", 178)..ALC["L-Parenthesis"]..ALC["Random"]..ALC["R-Parenthesis"], 178 };
		{ WHIT..INDENT..Atlas_GetBossName("Renataki", 179)..ALC["L-Parenthesis"]..ALC["Random"]..ALC["R-Parenthesis"], 179 };
		{ WHIT..INDENT..Atlas_GetBossName("Wushoolay", 180)..ALC["L-Parenthesis"]..ALC["Random"]..ALC["R-Parenthesis"], 180 };
		{ WHIT.."13) "..L["Mortaxx <The Tolling Bell>"], 10017 };
		{ WHIT.."14) "..L["Tiki Lord Zim'wae"], 10018 };
		{ GREN..INDENT..L["Zanzil's Cauldron of Burning Blood"] };
		{ WHIT.."15) "..Atlas_GetBossName("High PRIESTess Kilnara", 181)..ALC["L-Parenthesis"]..ALC["Basement"]..ALC["R-Parenthesis"], 181 };
		{ GREN.." 6') "..L["Zanzil's Cauldron of Frostburn Formula"], 10019 };
		{ WHIT.."16) "..Atlas_GetBossName("Zanzil", 184), 184 };
		{ GREN..INDENT..L["Zanzil's Cauldron of Toxic Torment"] };
		{ GREN..INDENT..L["Zanzil's Cauldron of Frostburn Formula"] };
		{ GREN..INDENT..L["Zanzil's Cauldron of Burning Blood"] };
		{ WHIT.."17) "..Atlas_GetBossName("Jin'do the Godbreaker", 185), 185 };
	};
};

for k, v in pairs(myMaps) do
	AtlasMaps[k] = v;
end
