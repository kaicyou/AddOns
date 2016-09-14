-- $Id: Atlas_WarlordsofDraenor.lua 33 2016-09-05 14:53:54Z arith $
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
local L = LibStub("AceLocale-3.0"):GetLocale("Atlas_WarlordsofDraenor");
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
	Auchindoun = {
		ZoneName = { BZ["Auchindoun"] };
		Location = { BZ["Talador"] };
		DungeonID = "820";
		DungeonHeroicID = "845";
		DungeonMythicID = "1008";
		Acronym = ALC["Auch"]; -- taken from BC
		WorldMapID = "984";
		JournalInstanceID = "547";
		Module = "Atlas_WarlordsofDraenor";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ WHIT.." 1) "..Atlas_GetBossName("Vigilant Kaathar", 1185), 1185 };
		{ WHIT.." 2) "..Atlas_GetBossName("Soulbinder Nyami", 1186), 1186 };
		{ WHIT.." 3) "..Atlas_GetBossName("Azzakel", 1216), 1216 };
		{ WHIT..INDENT..Atlas_GetBossName("Blazing Trickster", 1216, 4), 1216 };
		{ WHIT..INDENT..Atlas_GetBossName("Cackling Pyromaniac", 1216, 2), 1216 };
		{ WHIT..INDENT..Atlas_GetBossName("Felguard", 1216, 3), 1216 };
		{ WHIT.." 4) "..Atlas_GetBossName("Teron'gor", 1225), 1225 };
	};
	BlackrockFoundryA = {
		ZoneName = { BZ["Blackrock Foundry"]..ALC["MapA"] };
		Location = { BZ["Gorgrond"] };
		DungeonID = "898";
		DungeonHeroicID = "899";
		DungeonMythicID = "900";
		Acronym = L["BRF"];
		PlayerLimit = "10-30";
		WorldMapID = "988";
		JournalInstanceID = "457";
		Module = "Atlas_WarlordsofDraenor";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ BLUE.." B-C) "..ALC["Connection"], 10002 };
		{ WHIT.." 1) "..Atlas_GetBossName("Gruul", 1161)..ALC["L-Parenthesis"]..ALC["Upper"]..ALC["R-Parenthesis"], 1161 };
		{ WHIT.." 2) "..Atlas_GetBossName("Oregorger the Devourer", 1202, 1)..ALC["L-Parenthesis"]..ALC["Upper"]..ALC["R-Parenthesis"], 1202 };
		{ WHIT.." 3) "..Atlas_GetBossName("Beastlord Darmac", 1122), 1122 };
		{ WHIT..INDENT..Atlas_GetBossName("Cruelfang", 1122, 2), 1122 };
		{ WHIT..INDENT..Atlas_GetBossName("Dreadwing", 1122, 3), 1122 };
		{ WHIT..INDENT..Atlas_GetBossName("Faultline", 1122, 5), 1122 };
		{ WHIT..INDENT..Atlas_GetBossName("Ironcrusher", 1122, 4), 1122 };
		{ WHIT.." 6) "..Atlas_GetBossName("Operator Thogar", 1147), 1147 };
		{ WHIT.." 7) "..Atlas_GetBossName("The Blast Furnace", 1154)..ALC["L-Parenthesis"]..ALC["Lower"]..ALC["R-Parenthesis"], 1154 };
		{ WHIT..INDENT..Atlas_GetBossName("Bellows Operator", 1154, 4), 1154 };
		{ WHIT..INDENT..Atlas_GetBossName("Firecaller", 1154, 6), 1154 };
		{ WHIT..INDENT..Atlas_GetBossName("Foreman Feldspar", 1154, 1), 1154 };
		{ WHIT..INDENT..Atlas_GetBossName("Furnace Engineer", 1154, 3), 1154 };
		{ WHIT..INDENT..Atlas_GetBossName("Heart of the Mountain", 1154, 8), 1154 };
		{ WHIT..INDENT..Atlas_GetBossName("Primal Elementalist", 1154, 5), 1154 };
		{ WHIT..INDENT..Atlas_GetBossName("Security Guard", 1154, 2), 1154 };
		{ WHIT..INDENT..Atlas_GetBossName("Slag Elemental", 1154, 7), 1154 };
		{ WHIT.." 10) "..Atlas_GetBossName("Blackhand", 959)..ALC["L-Parenthesis"]..ALC["Upper"]..ALC["R-Parenthesis"], 959 };
	};
	BlackrockFoundryB = {
		ZoneName = { BZ["Blackrock Foundry"]..ALC["MapB"] };
		Location = { BZ["Gorgrond"] };
		DungeonID = "898";
		DungeonHeroicID = "899";
		DungeonMythicID = "900";
		Acronym = L["BRF"];
		PlayerLimit = "10-30";
		WorldMapID = "988";
		JournalInstanceID = "457";
		Module = "Atlas_WarlordsofDraenor";
		{ BLUE.." C) "..ALC["Connection"], 10001 };
		{ WHIT.." 4) "..Atlas_GetBossName("Flamebender Ka'graz", 1123), 1123 };
		{ WHIT..INDENT..Atlas_GetBossName("Aknor Steelbringer", 1123, 2), 1123 };
		{ WHIT..INDENT..Atlas_GetBossName("Cinder Wolf", 1123, 3), 1123 };
		{ WHIT.." 5) "..Atlas_GetBossName("Hans'gar and Franzok", 1155), 1155 };
		{ WHIT..INDENT..Atlas_GetBossName("Franzok", 1155, 1), 1155 };
		{ WHIT..INDENT..Atlas_GetBossName("Hans'gar", 1155, 2), 1155 };
		{ WHIT.." 8) "..Atlas_GetBossName("Kromog", 1162), 1162 };
		{ WHIT.." 9) "..Atlas_GetBossName("The Iron Maidens", 1203), 1203 };
		{ WHIT..INDENT..Atlas_GetBossName("Admiral Gar'an", 1203, 1), 1203 };
		{ WHIT..INDENT..Atlas_GetBossName("Enforcer Sorka", 1203, 2), 1203 };
		{ WHIT..INDENT..Atlas_GetBossName("Marak the Blooded", 1203, 3), 1203 };
	};
	BloodmaulSlagMines = {
		ZoneName = { BZ["Bloodmaul Slag Mines"] };
		Location = { BZ["Frostfire Ridge"] };
		DungeonID = "787";
		DungeonHeroicID = "859";
		DungeonMythicID = "1005";
		Acronym = L["BSM"];
		WorldMapID = "964";
		JournalInstanceID = "385";
		Module = "Atlas_WarlordsofDraenor";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ WHIT.." 1) "..Atlas_GetBossName("Magmolatus", 893), 893 };
		{ WHIT..INDENT..Atlas_GetBossName("Forgemaster Gog'duh", 893, 1), 893 };
		{ WHIT.." 2) "..Atlas_GetBossName("Slave Watcher Crushto", 888), 888 };
		{ WHIT.." 3) "..Atlas_GetBossName("Roltall", 887), 887 };
		{ WHIT.." 4) "..Atlas_GetBossName("Gug'rokk", 889), 889 };

	};
	TheEverbloomA = {
		ZoneName = { BZ["The Everbloom"]..ALC["MapA"] };
		Location = { BZ["Gorgrond"] };
		DungeonID = "824";
		DungeonHeroicID = "866";
		DungeonMythicID = "1003";
		Acronym = L["EB"];
		WorldMapID = "1008";
		JournalInstanceID = "556";
		Module = "Atlas_WarlordsofDraenor";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ BLUE.." B) "..ALC["Connection"].. ALC["L-Parenthesis"]..ALC["Portal"]..ALC["R-Parenthesis"], 10002 };
		{ WHIT.." 1) "..Atlas_GetBossName("Witherbark", 1214), 1214 };
		{ WHIT.." 2) "..Atlas_GetBossName("Ancient Protectors", 1207), 1207 };
		{ WHIT..INDENT..Atlas_GetBossName("Dulhu", 1207, 1), 1207 };
		{ WHIT..INDENT..Atlas_GetBossName("Earthshaper Telu", 1207, 2), 1207 };
		{ WHIT..INDENT..Atlas_GetBossName("Life Warden Gola", 1207, 3), 1207 };
		{ WHIT.." 3) "..Atlas_GetBossName("Archmage Sol", 1208), 1208 };
		{ WHIT.." 4) "..Atlas_GetBossName("Xeri'tac", 1209)..ALC["L-Parenthesis"]..ALC["Lower"]..ALC["R-Parenthesis"], 1209 };
	};
	TheEverbloomB = {
		ZoneName = { BZ["The Everbloom"]..ALC["MapB"] };
		Location = { BZ["Gorgrond"] };
		DungeonID = "824";
		DungeonHeroicID = "866";
		DungeonMythicID = "1003";
		Acronym = L["EB"];
		WorldMapID = "1008";
		JournalInstanceID = "556";
		Module = "Atlas_WarlordsofDraenor";
		{ BLUE.." B) "..ALC["Connection"].. ALC["L-Parenthesis"]..ALC["Portal"]..ALC["R-Parenthesis"], 10001 };
		{ WHIT.." 5) "..Atlas_GetBossName("Yalnu", 1210), 1210 };
	};
	GrimrailDepot = {
		ZoneName = { BZ["Grimrail Depot"] };
		Location = { BZ["Gorgrond"] };
		DungeonID = "822";
		DungeonHeroicID = "858";
		DungeonMythicID = "1006";
		Acronym = L["GD"];
		WorldMapID = "993";
		JournalInstanceID = "536";
		Module = "Atlas_WarlordsofDraenor";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ BLUE.." B) "..L["Train Ride"]..ALC["L-Parenthesis"]..ALC["Event"]..ALC["R-Parenthesis"], 10002 };
		{ WHIT.." 1) "..Atlas_GetBossName("Rocketspark and Borka", 1138), 1138 };
		{ WHIT..INDENT..Atlas_GetBossName("Borka the Brute", 1138, 2), 1138 };
		{ WHIT..INDENT..Atlas_GetBossName("Railmaster Rocketspark", 1138, 1), 1138 };
		{ WHIT.." 2) "..Atlas_GetBossName("Nitrogg Thundertower", 1163), 1163 };
		{ WHIT..INDENT..Atlas_GetBossName("Assault Cannon", 1163, 2), 1163 };
		{ WHIT.." 3) "..Atlas_GetBossName("Skylord Tovra", 1133), 1133 };
	};
	HellfireA = {
		ZoneName = { BZ["Hellfire Citadel"]..ALC["MapA"] };
		Location = { BZ["Tanaan Jungle"] };
		DungeonID = "987";
		DungeonHeroicID = "988";
		DungeonMythicID = "989";
		Acronym = L["HC"];
		PlayerLimit = "10-30";
		WorldMapID = "1026";
		JournalInstanceID = "669";
		Module = "Atlas_WarlordsofDraenor";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ BLUE.." B) "..ALC["Connection"], 10002 };
		{ WHIT.." 1) "..Atlas_GetBossName("Hellfire Assault", 1426), 1426 };			-- 1
		{ WHIT..INDENT..Atlas_GetBossName("Siegemaster Mar'tak", 1426, 1), 1426 };
		{ WHIT..INDENT..Atlas_GetBossName("Hellfire Cannon", 1426, 2), 1426 };
		{ WHIT.." 2) "..Atlas_GetBossName("Iron Reaver", 1425), 1425 };			-- 2
	};
	HellfireB = {
		ZoneName = { BZ["Hellfire Citadel"]..ALC["MapB"] };
		Location = { BZ["Tanaan Jungle"] };
		DungeonID = "987";
		DungeonHeroicID = "988";
		DungeonMythicID = "989";
		Acronym = L["HC"];
		PlayerLimit = "10-30";
		WorldMapID = "1026";
		JournalInstanceID = "669";
		Module = "Atlas_WarlordsofDraenor";
		{ BLUE.." B/C) "..ALC["Connection"], 10001 };
		{ WHIT.." 3) "..Atlas_GetBossName("Gorefiend", 1372), 1372 };				-- 3
		{ WHIT.." 4) "..Atlas_GetBossName("Kilrogg Deadeye", 1396), 1396 };			-- 4
		{ WHIT.." 5) "..Atlas_GetBossName("Hellfire High Council", 1432), 1432 };		-- 5
		{ WHIT..INDENT..Atlas_GetBossName("Dia Darkwhisper", 1432, 3), 1432 };
		{ WHIT..INDENT..Atlas_GetBossName("Gurtogg Bloodboil", 1432, 1), 1432 };
		{ WHIT..INDENT..Atlas_GetBossName("Blademaster Jubei'thos", 1432, 2), 1432 };
	};
	HellfireC = {
		ZoneName = { BZ["Hellfire Citadel"]..ALC["MapC"] };
		Location = { BZ["Tanaan Jungle"] };
		DungeonID = "987";
		DungeonHeroicID = "988";
		DungeonMythicID = "989";
		Acronym = L["HC"];
		PlayerLimit = "10-30";
		WorldMapID = "1026";
		JournalInstanceID = "669";
		Module = "Atlas_WarlordsofDraenor";
		{ BLUE.." C) "..ALC["Connection"], 10001 };
		{ WHIT.." 6) "..Atlas_GetBossName("Kormrok", 1392), 1392 };				-- 6
	};
	HellfireD = {
		ZoneName = { BZ["Hellfire Citadel"]..ALC["MapD"] };
		Location = { BZ["Tanaan Jungle"] };
		DungeonID = "987";
		DungeonHeroicID = "988";
		DungeonMythicID = "989";
		Acronym = L["HC"];
		PlayerLimit = "10-30";
		WorldMapID = "1026";
		JournalInstanceID = "669";
		Module = "Atlas_WarlordsofDraenor";
		{ BLUE.." B/C) "..ALC["Connection"], 10001 };
		{ WHIT.." 7) "..Atlas_GetBossName("Shadow-Lord Iskar", 1433), 1433 };			-- 7
		{ WHIT..INDENT..Atlas_GetBossName("Fel Raven", 1433, 2), 1433 };
		{ WHIT..INDENT..Atlas_GetBossName("Shadowfel Warden", 1433, 3), 1433 };
		{ WHIT..INDENT..Atlas_GetBossName("Corrupted PRIEST of Terokk", 1433, 4), 1433 };
		{ WHIT..INDENT..Atlas_GetBossName("Illusionary Outcast", 1433, 5), 1433 };
		{ WHIT.." 8) "..Atlas_GetBossName("Fel Lord Zakuun", 1391), 1391 };			-- 8
		{ WHIT.." 9) "..Atlas_GetBossName("Xhul'horac", 1447), 1447 };			-- 9
		{ WHIT.."10) "..Atlas_GetBossName("Socrethar the Eternal", 1427), 1427 };		-- 10
		{ WHIT.."11) "..Atlas_GetBossName("Tyrant Velhari", 1394), 1394 };			-- 11
	};
	HellfireE = {
		ZoneName = { BZ["Hellfire Citadel"]..ALC["MapE"] };
		Location = { BZ["Tanaan Jungle"] };
		DungeonID = "987";
		DungeonHeroicID = "988";
		DungeonMythicID = "989";
		Acronym = L["HC"];
		PlayerLimit = "10-30";
		WorldMapID = "1026";
		JournalInstanceID = "669";
		Module = "Atlas_WarlordsofDraenor";
		{ WHIT.."12) "..Atlas_GetBossName("Mannoroth", 1395), 1395 };				-- 12
	};
	HellfireF = { 
		ZoneName = { BZ["Hellfire Citadel"]..ALC["MapF"] };
		Location = { BZ["Tanaan Jungle"] };
		DungeonID = "987";
		DungeonHeroicID = "988";
		DungeonMythicID = "989";
		Acronym = L["HC"];
		PlayerLimit = "10-30";
		WorldMapID = "1026";
		JournalInstanceID = "669";
		Module = "Atlas_WarlordsofDraenor";
		{ BLUE.." D) "..ALC["Connection"], 10001 };
		{ WHIT.."13) "..Atlas_GetBossName("Archimonde", 1438), 1438 };			-- 13 
	};
	HighmaulA = {
		ZoneName = { BZ["Highmaul"]..ALC["MapA"] };
		Location = { BZ["Nagrand"] };
		DungeonID = "895";
		DungeonHeroicID = "896";
		DungeonMythicID = "897";
		Acronym = L["HM"];
		PlayerLimit = "10-30";
		WorldMapID = "994";
		JournalInstanceID = "477";
		Module = "Atlas_WarlordsofDraenor";
		{ BLUE.." A) "..ALC["Entrance"]..ALC["L-Parenthesis"]..ALC["Lower"]..ALC["R-Parenthesis"], 10001 };
		{ BLUE.." B) "..ALC["Connection"].. ALC["L-Parenthesis"]..ALC["Portal"]..ALC["R-Parenthesis"], 10002 };
		{ WHIT.." 1) "..Atlas_GetBossName("Kargath Bladefist", 1128), 1128 };
		{ WHIT.." 2) "..Atlas_GetBossName("The Butcher", 971), 971 };
		{ WHIT.." 3) "..Atlas_GetBossName("Tectus", 1195), 1195 };
		{ WHIT.." 4) "..Atlas_GetBossName("Brackenspore", 1196), 1196 };
		{ WHIT..INDENT..Atlas_GetBossName("Fungal Flesh-Eater", 1196, 2), 1196 };
	};
	HighmaulB = {
		ZoneName = { BZ["Highmaul"]..ALC["MapB"] };
		Location = { BZ["Nagrand"] };
		DungeonID = "895";
		DungeonHeroicID = "896";
		DungeonMythicID = "897";
		Acronym = L["HM"];
		PlayerLimit = "10-30";
		WorldMapID = "994";
		JournalInstanceID = "477";
		Module = "Atlas_WarlordsofDraenor";
		{ BLUE.." B-D) "..ALC["Connection"], 10001 };
		{ WHIT.." 5) "..Atlas_GetBossName("Twin Ogron", 1148), 1148 };
		{ WHIT..INDENT..Atlas_GetBossName("Phemos", 1148, 2), 1148 };
		{ WHIT..INDENT..Atlas_GetBossName("Pol", 1148, 1), 1148 };
		{ WHIT.." 6) "..Atlas_GetBossName("Ko'ragh", 1153), 1153 };
		{ WHIT.." 7) "..Atlas_GetBossName("Imperator Mar'gok", 1197), 1197 };
	};
	IronDocks = {
		ZoneName = { BZ["Iron Docks"] };
		Location = { BZ["Gorgrond"] };
		DungeonID = "821";
		DungeonHeroicID = "857";
		DungeonMythicID = "1007";
		Acronym = L["ID"];
		WorldMapID = "987";
		JournalInstanceID = "558";
		Module = "Atlas_WarlordsofDraenor";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ WHIT.." 1) "..Atlas_GetBossName("Fleshrender Nok'gar", 1235), 1235 };
		{ WHIT..INDENT..Atlas_GetBossName("Dreadfang", 1235, 2), 1235 };
		{ WHIT.." 2) "..Atlas_GetBossName("Grimrail Enforcers", 1236), 1236 };
		{ WHIT..INDENT..Atlas_GetBossName("Ahri'ok Dugru", 1236, 1), 1236 };
		{ WHIT..INDENT..Atlas_GetBossName("Makogg Emberblade", 1236, 2), 1236 };
		{ WHIT..INDENT..Atlas_GetBossName("Nesa \"Hightower\" Nox", 1236, 3), 1236 };
		{ WHIT.." 3) "..Atlas_GetBossName("Oshir", 1237), 1237 };
		{ WHIT.." 4) "..Atlas_GetBossName("Skulloc", 1238), 1238 };
		{ WHIT..INDENT..Atlas_GetBossName("Koramar", 1238, 3), 1238 };
		{ WHIT..INDENT..Atlas_GetBossName("Zoggosh", 1238, 2), 1238 };
	};
	ShadowmoonBurialGrounds = {
		ZoneName = { BZ["Shadowmoon Burial Grounds"] };
		Location = { BZ["Shadowmoon Valley"] };
		DungeonID = "783";
		DungeonHeroicID = "784";
		DungeonMythicID = "1009";
		Acronym = L["SBG"];
		WorldMapID = "969";
		JournalInstanceID = "537";
		Module = "Atlas_WarlordsofDraenor";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ BLUE.." B) "..ALC["Connection"].. ALC["L-Parenthesis"]..ALC["Portal"]..ALC["R-Parenthesis"], 10002 };
		{ WHIT.." 1) "..Atlas_GetBossName("Sadana Bloodfury", 1139), 1139 };
		{ WHIT.." 2) "..Atlas_GetBossName("Nhallish", 1168), 1168 };
		{ WHIT.." 3) "..Atlas_GetBossName("Bonemaw", 1140), 1140 };
		{ WHIT..INDENT..Atlas_GetBossName("Carrion Worm", 1140, 2), 1140 };
		{ WHIT.." 4) "..Atlas_GetBossName("Ner'zhul", 1160), 1160 };
		{ WHIT..INDENT..Atlas_GetBossName("Ritual of Bones", 1160, 2), 1160 };
	};
	Skyreach = {
		ZoneName = { BZ["Skyreach"] };
		Location = { BZ["Spires of Arak"] };
		DungeonID = "779";
		DungeonHeroicID = "780";
		DungeonMythicID = "1010";
		Acronym = L["SR"];
		WorldMapID = "989";
		JournalInstanceID = "476";
		Module = "Atlas_WarlordsofDraenor";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ WHIT.." 1) "..Atlas_GetBossName("Ranjit", 965), 965 };
		{ WHIT.." 2) "..Atlas_GetBossName("Araknath", 966), 966 };
		{ WHIT..INDENT..Atlas_GetBossName("Arakkoa Sun Construct Prototype", 966, 2), 966 };
		{ WHIT.." 3) "..Atlas_GetBossName("Rukhran", 967), 967 };
		{ WHIT..INDENT..Atlas_GetBossName("Solar Flare", 967, 2), 967 };
		{ WHIT.." 4) "..Atlas_GetBossName("High Sage Viryx", 968)..ALC["L-Parenthesis"]..ALC["Upper"]..ALC["R-Parenthesis"], 968 };
		{ WHIT..INDENT..Atlas_GetBossName("Arakkoa Shield Construct", 968, 3), 968 };
		{ WHIT..INDENT..Atlas_GetBossName("Arakkoa Solar Zealot", 968, 2), 968 };
	};
	UpperBlackrockSpire = {
		ZoneName = { BZ["Blackrock Mountain"]..ALC["Colon"]..BZ["Upper Blackrock Spire"] };
		Location = { BZ["Searing Gorge"]..ALC["Slash"]..BZ["Burning Steppes"] };
		DungeonID = "828";
		DungeonHeroicID = "860";
		DungeonMythicID = "1004";
		Acronym = L["UBRS"];
		WorldMapID = "995";
		JournalInstanceID = "559";
		Module = "Atlas_WarlordsofDraenor";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ BLUE.." B-C) "..ALC["Connection"], 10002 };
		{ WHIT.." 1) "..Atlas_GetBossName("Orebender Gor'ashan", 1226), 1226 };
		{ WHIT.." 2) "..Atlas_GetBossName("Kyrak", 1227), 1227 };
		{ WHIT..INDENT..Atlas_GetBossName("Drakonid Monstrosity", 1227, 2), 1227 };
		{ WHIT.." 3) "..Atlas_GetBossName("Commander Tharbek", 1228), 1228 };
		{ WHIT..INDENT..Atlas_GetBossName("Black Iron Guard", 1228, 3), 1228 };
		{ WHIT..INDENT..Atlas_GetBossName("Ironbarb Skyreaver", 1228, 2), 1228 };
		{ WHIT.." 4) "..Atlas_GetBossName("Ragewing the Untamed", 1229), 1229 };
		{ WHIT..INDENT..Atlas_GetBossName("Ragewind Whelp", 1229, 2), 1229 };
		{ WHIT.." 5) "..Atlas_GetBossName("Warlord Zaela", 1234), 1234 };
	};
};

for k, v in pairs(myMaps) do
	AtlasMaps[k] = v;
end
