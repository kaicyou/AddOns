-- $Id: Atlas_Battlegrounds.lua 1538 2016-08-07 15:57:11Z arith $
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

local BZ = Atlas_GetLocaleLibBabble("LibBabble-SubZone-3.0");
local BF = Atlas_GetLocaleLibBabble("LibBabble-Faction-3.0");
local L = LibStub("AceLocale-3.0"):GetLocale("Atlas_Battlegrounds");
local ALC = LibStub("AceLocale-3.0"):GetLocale("Atlas");

local BLUE = "|cff6666ff";
local GREN = "|cff66cc33";
local LBLU = "|cff33cccc";
local _RED = "|cffcc3333";
local ORNG = "|cffcc9933";
local PINK = "|ccfcc33cc";
local PURP = "|cff9900ff";
local WHIT = "|cffffffff";
local YLOW = "|cffcccc33";
local INDENT = "      ";
local BULLET = " - ";

local myCategory = L["Battleground Maps"];

local myData = {
	AlteracValleyNorth = {
		ZoneName = { BZ["Alterac Valley"]..ALC["L-Parenthesis"]..ALC["North"]..ALC["Comma"]..FACTION_ALLIANCE..ALC["R-Parenthesis"] };
		Location = { BZ["Alterac Mountains"] };
		LevelRange = "45-84"..ALC["L-Parenthesis"]..L["Span of 5"]..ALC["R-Parenthesis"]..ALC["Slash"].."85";
		MinLevel = "45";
		PlayerLimit = "40";
		Acronym = L["AV"];
		WorldMapID = "401";
		{ ORNG..REPUTATION..ALC["Colon"]..BF["Stormpike Guard"] };
		{ BLUE.."A) "..ALC["Entrance"], 10001 };
		{ BLUE.."B) "..BZ["Dun Baldar"], 10002 };
		{ GREN..INDENT..L["Vanndar Stormpike <Stormpike General>"] };
		{ GREN..INDENT..L["Prospector Stonehewer"] };
		{ _RED.."1) "..L["Dun Baldar North Bunker"], 10003 };
		{ GREN..INDENT..L["Wing Commander Mulverick"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"] };
		{ _RED.."2) "..L["Dun Baldar South Bunker"], 10004 };
		{ GREN..INDENT..L["Gaelden Hammersmith <Stormpike Supply Officer>"] };
		{ _RED.."3) "..BZ["Icewing Cavern"], 10005 };
		{ GREN..INDENT..L["Stormpike Banner"] };
		{ _RED.."4) "..L["Stormpike Lumber Yard"], 10006 };
		{ GREN..INDENT..L["Wing Commander Jeztor"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"] };
		{ _RED.."5) "..BZ["Icewing Bunker"], 10007 };
		{ GREN..INDENT..L["Wing Commander Guse"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"] };
		{ _RED.."6) "..BZ["Stonehearth Outpost"], 10008 };
		{ GREN..INDENT..L["Captain Balinda Stonehearth <Stormpike Captain>"] };
		{ _RED.."7) "..BZ["Stonehearth Bunker"], 10009 };
		{ _RED.."8) "..L["Western Crater"], 10010 };
		{ GREN..INDENT..L["Vipore's Beacon"] };
		{ GREN..INDENT..L["Jeztor's Beacon"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"] };
		{ _RED.."9) "..L["Eastern Crater"], 10011 };
		{ GREN..INDENT..L["Slidore's Beacon"] };
		{ GREN..INDENT..L["Guse's Beacon"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"] };
		{ GREN.."1) "..BZ["Irondeep Mine"], 10012 };
		{ GREN.."1') "..L["Arch Druid Renferal"], 10013 };
		{ GREN.."2') "..L["Murgot Deepforge"], 10014 };
		{ GREN..INDENT..L["Lana Thunderbrew <Blacksmithing Supplies>"] };
		{ GREN.."3') "..L["Stormpike Stable Master <Stable Master>"], 10015 };
		{ GREN..INDENT..L["Stormpike Ram Rider Commander"] };
		{ GREN..INDENT..L["Svalbrad Farmountain <Trade Goods>"] };
		{ GREN..INDENT..L["Kurdrum Barleybeard <Reagents & Poison Supplies>"] };
		{ GREN.."4') "..L["Stormpike Quartermaster"], 10016 };
		{ GREN..INDENT..L["Jonivera Farmountain <General Goods>"] };
		{ GREN..INDENT..L["Brogus Thunderbrew <Food & Drink>"] };
		{ GREN.."5') "..L["Wing Commander Ichman"]..ALC["L-Parenthesis"]..L["Rescued"]..ALC["R-Parenthesis"], 10017 };
		{ GREN..INDENT..L["Wing Commander Slidore"]..ALC["L-Parenthesis"]..L["Rescued"]..ALC["R-Parenthesis"] };
		{ GREN..INDENT..L["Wing Commander Vipore"]..ALC["L-Parenthesis"]..L["Rescued"]..ALC["R-Parenthesis"] };
		{ GREN.."6') "..L["Stormpike Ram Rider Commander"], 10018 };
		{ GREN.."7') "..L["Ivus the Forest Lord"]..ALC["L-Parenthesis"]..ALC["Summon"]..ALC["R-Parenthesis"], 10019 };
		{ ORNG.."1) "..L["Stormpike Aid Station"], 10020 };
		{ ORNG.."2) "..BZ["Stormpike Graveyard"], 10021 };
		{ ORNG.."3) "..BZ["Stonehearth Graveyard"], 10022 };
		{ ORNG.."4) "..BZ["Snowfall Graveyard"], 10023 };
		{ GREN..INDENT..L["Ichman's Beacon"] };
		{ GREN..INDENT..L["Mulverick's Beacon"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"] };
	};
	AlteracValleySouth = {
		ZoneName = { BZ["Alterac Valley"]..ALC["L-Parenthesis"]..ALC["South"]..ALC["Comma"]..FACTION_HORDE..ALC["R-Parenthesis"] };
		Location = { BZ["Hillsbrad Foothills"] };
		LevelRange = "45-84"..ALC["L-Parenthesis"]..L["Span of 5"]..ALC["R-Parenthesis"]..ALC["Slash"].."85";
		MinLevel = "45";
		PlayerLimit = "40";
		Acronym = L["AV"];
		WorldMapID = "401";
		{ ORNG..REPUTATION..ALC["Colon"]..BF["Frostwolf Clan"] };
		{ BLUE.."A) "..ALC["Entrance"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"], 10001 };
		{ BLUE.."B) "..BZ["Frostwolf Keep"], 10002 };
		{ GREN..INDENT..L["Drek'Thar <Frostwolf General>"] };
		{ _RED.."1) "..BZ["Iceblood Garrison"], 10003 };
		{ GREN..INDENT..L["Captain Galvangar <Frostwolf Captain>"] };
		{ _RED.."2) "..L["Iceblood Tower"], 10004 };
		{ _RED.."3) "..L["Tower Point"], 10005 };
		{ GREN..INDENT..L["Wing Commander Slidore"]..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"] };
		{ _RED.."4) "..L["West Frostwolf Tower"], 10006 };
		{ GREN..INDENT..L["Wing Commander Ichman"]..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"] };
		{ _RED.."5) "..L["East Frostwolf Tower"], 10007 };
		{ _RED.."6) "..BZ["Wildpaw Cavern"], 10008 };
		{ GREN..INDENT..L["Frostwolf Banner"] };
		{ GREN.."1) "..BZ["Coldtooth Mine"], 10009 };
		{ GREN.."1') "..L["Lokholar the Ice Lord"]..ALC["L-Parenthesis"]..ALC["Summon"]..ALC["R-Parenthesis"], 10010 };
		{ GREN.."2') "..L["Wing Commander Vipore"]..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"], 10011 };
		{ GREN..INDENT..L["Jotek"] };
		{ GREN..INDENT..L["Smith Regzar"] };
		{ GREN..INDENT..L["Primalist Thurloga"] };
		{ GREN.."3') "..L["Frostwolf Stable Master <Stable Master>"], 10012 };
		{ GREN..INDENT..L["Frostwolf Wolf Rider Commander"] };
		{ GREN.."4') "..L["Frostwolf Quartermaster"], 10013 };
		{ GREN.."5') "..L["Wing Commander Guse"]..ALC["L-Parenthesis"]..L["Rescued"]..ALC["R-Parenthesis"], 10014 };
		{ GREN..INDENT..L["Wing Commander Jeztor"]..ALC["L-Parenthesis"]..L["Rescued"]..ALC["R-Parenthesis"] };
		{ GREN..INDENT..L["Wing Commander Mulverick"]..ALC["L-Parenthesis"]..L["Rescued"]..ALC["R-Parenthesis"] };
		{ ORNG.."1) "..BZ["Iceblood Graveyard"], 10015 };
		{ ORNG.."2) "..BZ["Frostwolf Graveyard"], 10016 };
		{ ORNG.."3) "..L["Frostwolf Relief Hut"], 10017 };
	};
	ArathiBasin = {
		ZoneName = { BZ["Arathi Basin"] };
		Location = { BZ["Arathi Highlands"] };
		LevelRange = "10-84"..ALC["L-Parenthesis"]..L["Span of 5"]..ALC["R-Parenthesis"]..ALC["Slash"].."85";
		MinLevel = "10";
		PlayerLimit = "15";
		Acronym = L["AB"];
		WorldMapID = "461";
		{ ORNG..REPUTATION..ALC["Colon"]..BF["The League of Arathor"]..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"] };
		{ ORNG..REPUTATION..ALC["Colon"]..BF["The Defilers"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"] };
		{ BLUE.."A) "..BZ["Trollbane Hall"]..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"], 10001 };
		{ BLUE.."B) "..BZ["Defiler's Den"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"], 10002 };
		{ GREN.."1) "..BZ["Stables"], 10003 };
		{ GREN.."2) "..BZ["Gold Mine"], 10004 };
		{ GREN.."3) "..BZ["Blacksmith"], 10005 };
		{ GREN.."4) "..BZ["Lumber Mill"], 10006 };
		{ GREN.."5) "..BZ["Farm"], 10007 };
	};
	WarsongGulch = {
		ZoneName = { BZ["Warsong Gulch"] };
		Location = { BZ["Ashenvale"]..ALC["Slash"]..BZ["Northern Barrens"] };
		LevelRange = "10-84"..ALC["L-Parenthesis"]..L["Span of 5"]..ALC["R-Parenthesis"]..ALC["Slash"].."85";
		MinLevel = "10";
		PlayerLimit = "10";
		Acronym = L["WSG"];
		WorldMapID = "443";
		{ ORNG..REPUTATION..ALC["Colon"]..BF["Silverwing Sentinels"]..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"] };
		{ ORNG..REPUTATION..ALC["Colon"]..BF["Warsong Outriders"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"] };
		{ BLUE.."A) "..BZ["Silverwing Hold"]..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"], 10001 };
		{ BLUE.."B) "..BZ["Warsong Lumber Mill"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"], 10002 };
	};
	SilithystMustFlow = {
		ZoneName = { BZ["Silithus"]..ALC["Hyphen"]..L["The Silithyst Must Flow"] };
		--Location = { BZ["Silithus"] };
		LevelRange = "55-85";
		MinLevel = "55";
		WorldMapID = "261";
		{ ORNG..PVP..ALC["Colon"]..L["The Silithyst Must Flow"] };
		{ BLUE.."A) "..BZ["Cenarion Hold"], 10001 };
		{ BLUE.."B) "..L["Alliance's Camp"], 10002 };
		{ BLUE.."C) "..L["Horde's Camp"], 10003 };
	};
	EyeOfTheStorm = {
		ZoneName = { BZ["Eye of the Storm"] };
		Location = { BZ["Netherstorm"] };
		LevelRange = "35-84"..ALC["L-Parenthesis"]..L["Span of 5"]..ALC["R-Parenthesis"]..ALC["Slash"].."85";
		MinLevel = "35";
		PlayerLimit = "15";
		Acronym = L["EotS"];
		WorldMapID = "482";
		{ BLUE.."A) "..ALC["Entrance"]..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"], 10001 };
		{ BLUE.."B) "..ALC["Entrance"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"], 10002 };
		{ _RED.."1) "..L["Flag"], 10003 };
		{ GREN.."1) "..BZ["Mage Tower"], 10004 };
		{ GREN.."2) "..BZ["Draenei Ruins"], 10005 };
		{ GREN.."3) "..BZ["Fel Reaver Ruins"], 10006 };
		{ GREN.."4) "..BZ["Blood Elf Tower"], 10007 };
		{ ORNG.."1) "..ALC["Graveyard"], 10008 };
	};
	HalaaPvP = {
		ZoneName = { BZ["Nagrand"]..ALC["Hyphen"]..BZ["Halaa"] };
		Location = { BZ["Nagrand"] };
		LevelRange = "64-85";
		MinLevel = "64";
		WorldMapID = "477";
		{ ORNG..PVP..ALC["Colon"]..BZ["Halaa"] };
		{ GREN.."1) "..BZ["Halaa"], 10001 };
		{ GREN..INDENT..FACTION_ALLIANCE };
		{ GREN..INDENT..BULLET..L["Quartermaster Davian Vaclav"] };
		{ GREN..INDENT..BULLET..L["Chief Researcher Kartos"] };
		{ GREN..INDENT..BULLET..L["Aldraan <Blade Merchant>"] };
		{ GREN..INDENT..BULLET..L["Cendrii <Food & Drink>"] };
		{ GREN..INDENT..FACTION_HORDE };
		{ GREN..INDENT..BULLET..L["Quartermaster Jaffrey Noreliqe"] };
		{ GREN..INDENT..BULLET..L["Chief Researcher Amereldine"] };
		{ GREN..INDENT..BULLET..L["Coreiel <Blade Merchant>"] };
		{ GREN..INDENT..BULLET..L["Embelar <Food & Drink>"] };
		{ GREN.."2) "..L["Wyvern Camp"], 10002 };
	};
	HellfirePeninsulaPvP = {
		ZoneName = { BZ["Hellfire Peninsula"]..ALC["Hyphen"]..L["Hellfire Fortifications"] };
		Location = { BZ["Hellfire Peninsula"] };
		LevelRange = "58-85";
		MinLevel = "58";
		WorldMapID = "465";
		{ ORNG..PVP..ALC["Colon"]..L["Hellfire Fortifications"] };
		{ GREN.."1) "..BZ["The Stadium"], 10001 };
		{ GREN.."2) "..BZ["The Overlook"], 10002 };
		{ GREN.."3) "..BZ["Broken Hill"], 10003 };
	};
	TerokkarForestPvP = {
		ZoneName = { BZ["Terokkar Forest"]..ALC["Hyphen"]..L["Spirit Towers"] };
		Location = { BZ["The Bone Wastes"]..ALC["Comma"]..BZ["Terokkar Forest"] };
		LevelRange = "62-85";
		MinLevel = "62";
		WorldMapID = "478";
		{ ORNG..PVP..ALC["Colon"]..BZ["Auchindoun"].." "..L["Spirit Towers"] };
		{ GREN.."1) "..L["Spirit Towers"], 10001 };
	};
	ZangarmarshPvP = {
		ZoneName = { BZ["Zangarmarsh"]..ALC["Hyphen"]..BZ["Twin Spire Ruins"] };
		Location = { BZ["Zangarmarsh"] };
		LevelRange = "60-85";
		MinLevel = "60";
		WorldMapID = "467";
		{ ORNG..PVP..ALC["Colon"]..BZ["Twin Spire Ruins"] };
		{ GREN.."1) "..L["West Beacon"], 10001 };
		{ GREN.."2) "..L["East Beacon"], 10002 };
		{ GREN.."1') "..L["Horde Field Scout"], 10003 };
		{ GREN.."2') "..L["Alliance Field Scout"], 10004 };
		{ ORNG.."1) "..L["Twinspire Graveyard"], 10005 };
	};
	IsleOfConquest = {
		ZoneName = { BZ["Isle of Conquest"] };
		Location = { BZ["Icecrown"] };
		LevelRange = "75-84"..ALC["L-Parenthesis"]..L["Span of 5"]..ALC["R-Parenthesis"]..ALC["Slash"].."85";
		MinLevel = "75";
		PlayerLimit = "40";
		Acronym = L["IoC"];
		WorldMapID = "540";
		{ ORNG..L["Gates are marked with red bars."] };
		{ BLUE.."A) "..ALC["Start"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"], 10001 };
		{ GREN..INDENT..L["Overlord Agmar"] };
		{ BLUE.."B) "..ALC["Start"]..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"], 10002 };
		{ GREN..INDENT..L["High Commander Halford Wyrmbane <7th Legion>"] };
		{ GREN.."1) "..L["The Refinery"], 10003 };
		{ GREN.."2) "..L["The Docks"], 10004 };
		{ GREN.."3) "..L["The Workshop"], 10005 };
		{ GREN.."4) "..L["The Hangar"], 10006 };
		{ GREN.."5) "..L["The Quarry"], 10007 };
		{ ORNG.."1) "..L["Contested Graveyards"], 10008 };
		{ ORNG.."2) "..L["Horde Graveyard"], 10009 };
		{ ORNG.."3) "..L["Alliance Graveyard"], 10010 };
	};
	StrandOfTheAncients = {
		ZoneName = { BZ["Strand of the Ancients"] };
		Location = { BZ["Dragonblight"] };
		LevelRange = "65-84"..ALC["L-Parenthesis"]..L["Span of 5"]..ALC["R-Parenthesis"]..ALC["Slash"].."85";
		MinLevel = "65";
		PlayerLimit = "15";
		Acronym = L["SotA"];
		WorldMapID = "512";
		{ ORNG..L["Gates are marked with their colors."] };
		{ BLUE.."A) "..ALC["Start"]..ALC["L-Parenthesis"]..L["Attacking Team"]..ALC["R-Parenthesis"], 10001 };
		{ BLUE.."B) "..ALC["Start"]..ALC["L-Parenthesis"]..L["Defending Team"]..ALC["R-Parenthesis"], 10002 };
		{ _RED.."1) "..L["Massive Seaforium Charge"], 10003 };
		{ _RED.."2) "..L["Titan Relic"], 10004 };
		{ GREN.."1) "..L["Battleground Demolisher"], 10005 };
		{ GREN.."2) "..L["Graveyard Flag"], 10006 };
		{ ORNG.."1) "..L["Resurrection Point"], 10007 };
	};
	WintergraspPvP = {
		ZoneName = { BZ["Wintergrasp"] };
		--Location = { BZ["Wintergrasp"] };
		LevelRange = "73-85";
		MinLevel = "73";
		WorldMapID = "501";
		{ ORNG..PVP..ALC["Colon"]..BZ["Wintergrasp"] };
		{ BLUE.."A) "..BZ["Wintergrasp Fortress"], 10001 };
		{ BLUE..INDENT..BZ["Vault of Archavon"] };
		{ BLUE.."B) "..BZ["Valiance Landing Camp"], 10002 };
		{ BLUE.."C) "..BZ["Warsong Camp"], 10003 };
		{ GREN.."1) "..BZ["Wintergrasp Fortress"], 10004 };
		{ GREN..INDENT..L["Fortress Vihecal Workshop (E)"] };
		{ GREN..INDENT..L["Fortress Vihecal Workshop (W)"] };
		{ GREN.."2) "..BZ["The Sunken Ring"], 10005 };
		{ GREN..INDENT..L["Sunken Ring Vihecal Workshop"] };
		{ GREN.."3) "..BZ["The Broken Temple"], 10006 };
		{ GREN..INDENT..L["Broken Temple Vihecal Workshop"] };
		{ GREN.."4) "..BZ["Eastspark Workshop"], 10007 };
		{ GREN..INDENT..L["Eastspark Vihecale Workshop"] };
		{ GREN.."5) "..BZ["Westspark Workshop"], 10008 };
		{ GREN..INDENT..L["Westspark Vihecale Workshop"] };
		{ _RED.."1) "..BZ["Flamewatch Tower"], 10009 };
		{ _RED.."2) "..BZ["Winter's Edge Tower"], 10010 };
		{ _RED.."3) "..BZ["Shadowsight Tower"], 10011 };
		{ ORNG.."1) "..L["Wintergrasp Graveyard"], 10012 };
		{ ORNG.."2) "..L["Sunken Ring Graveyard"], 10013 };
		{ ORNG.."3) "..L["Broken Temple Graveyard"], 10014 };
		{ ORNG.."4) "..L["Southeast Graveyard"], 10015 };
		{ ORNG.."5) "..L["Southwest Graveyard"], 10016 };
	};
	TheBattleForGilneas = {
		ZoneName = { BZ["Gilneas"]..ALC["Hyphen"]..BZ["The Battle for Gilneas"] };
		--Location = { BZ["Gilneas"] };
		LevelRange = "85+";
		MinLevel = "85";
		WorldMapID = "736";
		{ BLUE.."A) "..BZ["Gilnean Stronghold"]..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"], 10001 };
		{ ORNG..INDENT..L["Alliance Graveyard"] };
		{ BLUE.."B) "..BZ["Horde Landing"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"], 10002 };
		{ GREN.."1) "..BZ["Mines"], 10003 };
		{ GREN.."2) "..BZ["Lighthouse"], 10004 };
		{ GREN.."3) "..BZ["Waterworks"], 10005 };
		{ ORNG.."1) "..L["Horde Graveyard"], 10006 };
		{ ORNG.."2) "..L["Contested Graveyards"], 10007 };
	};
	TolBarad = {
		ZoneName = { BZ["Tol Barad"] };
		--Location = { BZ["Tol Barad"] };
		LevelRange = "80-85";
		MinLevel = "80";
		WorldMapID = "708";
		{ ORNG..REPUTATION..ALC["Colon"]..BF["Baradin's Wardens"]..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"] };
		{ ORNG..REPUTATION..ALC["Colon"]..BF["Hellscream's Reach"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"] };
		{ BLUE.."A) "..L["Attackers"], 10001 };
		{ BLUE.."B) "..BZ["Baradin Hold"], 10002 };
		{ GREN..INDENT..FACTION_ALLIANCE };
		{ GREN..INDENT..BULLET..L["Sergeant Parker <Baradin's Wardens>"]};
		{ GREN..INDENT..BULLET..L["2nd Lieutenant Wansworth <Baradin's Wardens>"]};
		{ GREN..INDENT..BULLET..L["Commander Stevens <Baradin's Wardens>"]};
		{ GREN..INDENT..BULLET..L["Marshal Fallows <Baradin's Wardens>"]};
		{ GREN..INDENT..FACTION_HORDE };
		{ GREN..INDENT..BULLET..L["Commander Zanoth <Hellscream's Reach>"] };
		{ GREN..INDENT..BULLET..L["Drillmaster Razgoth <Hellscream's Reach>"] };
		{ GREN..INDENT..BULLET..L["Private Garnoth <Hellscream's Reach>"] };
		{ GREN..INDENT..BULLET..L["Staff Sergeant Lazgar <Hellscream's Reach>"] };
		{ GREN.."1) "..BZ["Ironclad Garrison"], 10003 };
		{ GREN.."2) "..BZ["Warden's Vigil"], 10004 };
		{ GREN.."3) "..BZ["Slagworks"], 10005 };
		{ GREN.."1') "..ALC["Meeting Stone"], 10006 };
		{ _RED.."1) "..BZ["West Spire"], 10007 };
		{ _RED.."2) "..BZ["East Spire"], 10008 };
		{ _RED.."3) "..BZ["South Spire"], 10009 };
		{ ORNG.."1) "..ALC["Graveyard"], 10010 };
		{ ORNG.."2) "..BZ["Cursed Depths"], 10011 };
		{ ORNG.."3) "..BZ["The Hole"], 10012 };
		{ ORNG.."4) "..BZ["D-Block"], 10013 };
	};
	TwinPeaks = {
		ZoneName = { BZ["Twin Peaks"] };
		Location = { BZ["Twilight Highlands"] };
		LevelRange = "85+";
		MinLevel = "85";
		WorldMapID = "626";
		{ ORNG..REPUTATION..ALC["Colon"]..BF["Wildhammer Clan"]..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"] };
		{ ORNG..REPUTATION..ALC["Colon"]..BF["Dragonmaw Clan"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"] };
		{ BLUE.."A) "..L["Wildhammer Longhouse"]..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"], 10001 };
		{ BLUE.."B) "..L["Dragonmaw Clan Compound"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"], 10002 };
		{ ORNG.."1) "..L["Alliance Graveyard"], 10003 };
		{ ORNG.."2) "..L["Horde Graveyard"], 10004 };
	};
	SilvershardMines = {
		ZoneName = { BZ["Silvershard Mines"] };
		Location = { BZ["Stranglethorn Vale"]..ALC["Comma"]..BZ["Eastern Kingdoms"] };
		LevelRange = "90";
		MinLevel = "90";
		PlayerLimit = "10";
		WorldMapID = "860";
		{ BLUE.."A) "..ALC["Start"]..ALC["Hyphen"]..FACTION_ALLIANCE, 10001 };
		{ BLUE.."B) "..ALC["Start"]..ALC["Hyphen"]..FACTION_HORDE, 10002 };
		{ GREN.."1) "..L["Mine Cart Spawn Point"], 10003 };
		{ GREN.."2) "..L["Mine Cart Depot"], 10004 };
	};
	TempleofKotmogu = {
		ZoneName = { BZ["Temple of Kotmogu"] };
		Location = { BZ["Vale of Eternal Blossoms"]..ALC["Comma"]..BZ["Pandaria"] };
		LevelRange = "90";
		MinLevel = "90";
		PlayerLimit = "10";
		WorldMapID = "856";
		{ BLUE.."A) "..ALC["Start"]..ALC["Hyphen"]..FACTION_ALLIANCE, 10001 };
		{ BLUE.."B) "..ALC["Start"]..ALC["Hyphen"]..FACTION_HORDE, 10002 };
		{ GREN.."1) "..L["Orb of Power"], 10003 };
		{ GREN.."2) "..L["Center Point (Maximum Points)"], 10004 };
	};
	DeepwindGorge = {
		ZoneName = { BZ["Deepwind Gorge"] };
		Location = { BZ["Valley of the Four Winds"]..ALC["Comma"]..BZ["Pandaria"] };
		LevelRange = "90";
		MinLevel = "90";
		PlayerLimit = "15";
		WorldMapID = "935";
		{ BLUE.."A) "..ALC["Start"]..ALC["Hyphen"]..FACTION_HORDE, 10001 };
		{ BLUE.."B) "..ALC["Start"]..ALC["Hyphen"]..FACTION_ALLIANCE, 10002 };
		{ GREN.."1) "..BZ["Pandaren Mine"], 10003 };
		{ GREN.."2) "..L["Center Mine"], 10004 };
		{ GREN.."3) "..BZ["Goblin Mine"], 10005 };
	};
	Ashran = {
		ZoneName = { BZ["Ashran"] };
		Location = { BZ["Draenor"] };
		LevelRange = "100";
		MinLevel = "100";
		PlayerLimit = "100";
		WorldMapID = "978";
		{ BLUE.."A) "..BZ["Warspear"]..ALC["Hyphen"]..FACTION_HORDE, 10001 };
		{ BLUE.."B) "..BZ["Stormshield"]..ALC["Hyphen"]..FACTION_ALLIANCE, 10002 };
		{ GREN.."1) "..BZ["Amphitheater of Annihilation"], 10003 };
		{ GREN.."2) "..BZ["Emberfall Tower"], 10004 };
		{ GREN.."3) "..BZ["Brute's Rise"], 10005 };
		{ GREN.."4) "..BZ["The Dark Woods"], 10006 };
		{ GREN.."5) "..BZ["Ring of Conquest"], 10007 };
		{ GREN.."6) "..BZ["Seat of Kor'lok"], 10008 };
		{ GREN.."7) "..BZ["Ashmaul Burial Grounds"], 10009 };
		{ GREN.."8) "..BZ["Molten Quarry"], 10010 };
	};
};

Atlas_RegisterPlugin("Atlas_Battlegrounds", myCategory, myData);
