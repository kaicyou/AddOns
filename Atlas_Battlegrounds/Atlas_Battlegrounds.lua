-- $Id: Atlas_Battlegrounds.lua 1532 2016-05-18 06:26:42Z arith $
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
local AL = LibStub("AceLocale-3.0"):GetLocale("Atlas_Battlegrounds");
local ALC = LibStub("AceLocale-3.0"):GetLocale("Atlas");
local ALIL = Atlas_IngameLocales;

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

local myCategory = AL["Battleground Maps"];

local myData = {
	AlteracValleyNorth = {
		ZoneName = { BZ["Alterac Valley"].." ("..ALC["North"]..", "..FACTION_ALLIANCE..")" };
		Location = { BZ["Alterac Mountains"] };
		LevelRange = "45-84 ("..AL["Span of 5"]..") / 85";
		MinLevel = "45";
		PlayerLimit = "40";
		Acronym = AL["AV"];
		{ ORNG..REPUTATION..": "..ALIL["Stormpike Guard"] };
		{ BLUE.."A) "..ALC["Entrance"], 10001 };
		{ BLUE.."B) "..BZ["Dun Baldar"], 10002 };
		{ GREN..INDENT..AL["Vanndar Stormpike <Stormpike General>"] };
		{ GREN..INDENT..AL["Prospector Stonehewer"] };
		{ _RED.."1) "..AL["Dun Baldar North Bunker"], 10003 };
		{ GREN..INDENT..AL["Wing Commander Mulverick"].." ("..FACTION_HORDE..")" };
		{ _RED.."2) "..AL["Dun Baldar South Bunker"], 10004 };
		{ GREN..INDENT..AL["Gaelden Hammersmith <Stormpike Supply Officer>"] };
		{ _RED.."3) "..BZ["Icewing Cavern"], 10005 };
		{ GREN..INDENT..AL["Stormpike Banner"] };
		{ _RED.."4) "..AL["Stormpike Lumber Yard"], 10006 };
		{ GREN..INDENT..AL["Wing Commander Jeztor"].." ("..FACTION_HORDE..")" };
		{ _RED.."5) "..BZ["Icewing Bunker"], 10007 };
		{ GREN..INDENT..AL["Wing Commander Guse"].." ("..FACTION_HORDE..")" };
		{ _RED.."6) "..BZ["Stonehearth Outpost"], 10008 };
		{ GREN..INDENT..AL["Captain Balinda Stonehearth <Stormpike Captain>"] };
		{ _RED.."7) "..BZ["Stonehearth Bunker"], 10009 };
		{ _RED.."8) "..AL["Western Crater"], 10010 };
		{ GREN..INDENT..AL["Vipore's Beacon"] };
		{ GREN..INDENT..AL["Jeztor's Beacon"].." ("..FACTION_HORDE..")" };
		{ _RED.."9) "..AL["Eastern Crater"], 10011 };
		{ GREN..INDENT..AL["Slidore's Beacon"] };
		{ GREN..INDENT..AL["Guse's Beacon"].." ("..FACTION_HORDE..")" };
		{ GREN.."1) "..BZ["Irondeep Mine"], 10012 };
		{ GREN.."1') "..AL["Arch Druid Renferal"], 10013 };
		{ GREN.."2') "..AL["Murgot Deepforge"], 10014 };
		{ GREN..INDENT..AL["Lana Thunderbrew <Blacksmithing Supplies>"] };
		{ GREN.."3') "..AL["Stormpike Stable Master <Stable Master>"], 10015 };
		{ GREN..INDENT..AL["Stormpike Ram Rider Commander"] };
		{ GREN..INDENT..AL["Svalbrad Farmountain <Trade Goods>"] };
		{ GREN..INDENT..AL["Kurdrum Barleybeard <Reagents & Poison Supplies>"] };
		{ GREN.."4') "..AL["Stormpike Quartermaster"], 10016 };
		{ GREN..INDENT..AL["Jonivera Farmountain <General Goods>"] };
		{ GREN..INDENT..AL["Brogus Thunderbrew <Food & Drink>"] };
		{ GREN.."5') "..AL["Wing Commander Ichman"].." ("..AL["Rescued"]..")", 10017 };
		{ GREN..INDENT..AL["Wing Commander Slidore"].." ("..AL["Rescued"]..")" };
		{ GREN..INDENT..AL["Wing Commander Vipore"].." ("..AL["Rescued"]..")" };
		{ GREN.."6') "..AL["Stormpike Ram Rider Commander"], 10018 };
		{ GREN.."7') "..AL["Ivus the Forest Lord"].." ("..ALC["Summon"]..")", 10019 };
		{ ORNG.."1) "..AL["Stormpike Aid Station"], 10020 };
		{ ORNG.."2) "..BZ["Stormpike Graveyard"], 10021 };
		{ ORNG.."3) "..BZ["Stonehearth Graveyard"], 10022 };
		{ ORNG.."4) "..BZ["Snowfall Graveyard"], 10023 };
		{ GREN..INDENT..AL["Ichman's Beacon"] };
		{ GREN..INDENT..AL["Mulverick's Beacon"].." ("..FACTION_HORDE..")" };
	};
	AlteracValleySouth = {
		ZoneName = { BZ["Alterac Valley"].." ("..ALC["South"]..", "..FACTION_HORDE..")" };
		Location = { BZ["Hillsbrad Foothills"] };
		LevelRange = "45-84 ("..AL["Span of 5"]..") / 85";
		MinLevel = "45";
		PlayerLimit = "40";
		Acronym = AL["AV"];
		{ ORNG..REPUTATION..": "..ALIL["Frostwolf Clan"] };
		{ BLUE.."A) "..ALC["Entrance"].." ("..FACTION_HORDE..")", 10001 };
		{ BLUE.."B) "..BZ["Frostwolf Keep"], 10002 };
		{ GREN..INDENT..AL["Drek'Thar <Frostwolf General>"] };
		{ _RED.."1) "..BZ["Iceblood Garrison"], 10003 };
		{ GREN..INDENT..AL["Captain Galvangar <Frostwolf Captain>"] };
		{ _RED.."2) "..AL["Iceblood Tower"], 10004 };
		{ _RED.."3) "..AL["Tower Point"], 10005 };
		{ GREN..INDENT..AL["Wing Commander Slidore"].." ("..FACTION_ALLIANCE..")" };
		{ _RED.."4) "..AL["West Frostwolf Tower"], 10006 };
		{ GREN..INDENT..AL["Wing Commander Ichman"].." ("..FACTION_ALLIANCE..")" };
		{ _RED.."5) "..AL["East Frostwolf Tower"], 10007 };
		{ _RED.."6) "..BZ["Wildpaw Cavern"], 10008 };
		{ GREN..INDENT..AL["Frostwolf Banner"] };
		{ GREN.."1) "..BZ["Coldtooth Mine"], 10009 };
		{ GREN.."1') "..AL["Lokholar the Ice Lord"].." ("..ALC["Summon"]..")", 10010 };
		{ GREN.."2') "..AL["Wing Commander Vipore"].." ("..FACTION_ALLIANCE..")", 10011 };
		{ GREN..INDENT..AL["Jotek"] };
		{ GREN..INDENT..AL["Smith Regzar"] };
		{ GREN..INDENT..AL["Primalist Thurloga"] };
		{ GREN.."3') "..AL["Frostwolf Stable Master <Stable Master>"], 10012 };
		{ GREN..INDENT..AL["Frostwolf Wolf Rider Commander"] };
		{ GREN.."4') "..AL["Frostwolf Quartermaster"], 10013 };
		{ GREN.."5') "..AL["Wing Commander Guse"].." ("..AL["Rescued"]..")", 10014 };
		{ GREN..INDENT..AL["Wing Commander Jeztor"].." ("..AL["Rescued"]..")" };
		{ GREN..INDENT..AL["Wing Commander Mulverick"].." ("..AL["Rescued"]..")" };
		{ ORNG.."1) "..BZ["Iceblood Graveyard"], 10015 };
		{ ORNG.."2) "..BZ["Frostwolf Graveyard"], 10016 };
		{ ORNG.."3) "..AL["Frostwolf Relief Hut"], 10017 };
	};
	ArathiBasin = {
		ZoneName = { BZ["Arathi Basin"] };
		Location = { BZ["Arathi Highlands"] };
		LevelRange = "10-84 ("..AL["Span of 5"]..") / 85";
		MinLevel = "10";
		PlayerLimit = "15";
		Acronym = AL["AB"];
		{ ORNG..REPUTATION..": "..ALIL["The League of Arathor"].." ("..FACTION_ALLIANCE..")" };
		{ ORNG..REPUTATION..": "..ALIL["The Defilers"].." ("..FACTION_HORDE..")" };
		{ BLUE.."A) "..BZ["Trollbane Hall"].." ("..FACTION_ALLIANCE..")", 10001 };
		{ BLUE.."B) "..BZ["Defiler's Den"].." ("..FACTION_HORDE..")", 10002 };
		{ GREN.."1) "..BZ["Stables"], 10003 };
		{ GREN.."2) "..BZ["Gold Mine"], 10004 };
		{ GREN.."3) "..BZ["Blacksmith"], 10005 };
		{ GREN.."4) "..BZ["Lumber Mill"], 10006 };
		{ GREN.."5) "..BZ["Farm"], 10007 };
	};
	WarsongGulch = {
		ZoneName = { BZ["Warsong Gulch"] };
		Location = { BZ["Ashenvale"].." / "..BZ["Northern Barrens"] };
		LevelRange = "10-84 ("..AL["Span of 5"]..") / 85";
		MinLevel = "10";
		PlayerLimit = "10";
		Acronym = AL["WSG"];
		{ ORNG..REPUTATION..": "..ALIL["Silverwing Sentinels"].." ("..FACTION_ALLIANCE..")" };
		{ ORNG..REPUTATION..": "..ALIL["Warsong Outriders"].." ("..FACTION_HORDE..")" };
		{ BLUE.."A) "..BZ["Silverwing Hold"].." ("..FACTION_ALLIANCE..")", 10001 };
		{ BLUE.."B) "..BZ["Warsong Lumber Mill"].." ("..FACTION_HORDE..")", 10002 };
	};
	SilithystMustFlow = {
		ZoneName = { BZ["Silithus"].." - "..AL["The Silithyst Must Flow"] };
		--Location = { BZ["Silithus"] };
		LevelRange = "55-85";
		MinLevel = "55";
		{ ORNG.."PvP: "..AL["The Silithyst Must Flow"] };
		{ BLUE.."A) "..BZ["Cenarion Hold"], 10001 };
		{ BLUE.."B) "..AL["Alliance's Camp"], 10002 };
		{ BLUE.."C) "..AL["Horde's Camp"], 10003 };
	};
	EyeOfTheStorm = {
		ZoneName = { BZ["Eye of the Storm"] };
		Location = { BZ["Netherstorm"] };
		LevelRange = "35-84 ("..AL["Span of 5"]..") / 85";
		MinLevel = "35";
		PlayerLimit = "15";
		Acronym = AL["EotS"];
		{ BLUE.."A) "..ALC["Entrance"].." ("..FACTION_ALLIANCE..")", 10001 };
		{ BLUE.."B) "..ALC["Entrance"].." ("..FACTION_HORDE..")", 10002 };
		{ _RED.."1) "..AL["Flag"], 10003 };
		{ GREN.."1) "..BZ["Mage Tower"], 10004 };
		{ GREN.."2) "..BZ["Draenei Ruins"], 10005 };
		{ GREN.."3) "..BZ["Fel Reaver Ruins"], 10006 };
		{ GREN.."4) "..BZ["Blood Elf Tower"], 10007 };
		{ ORNG.."1) "..ALC["Graveyard"], 10008 };
	};
	HalaaPvP = {
		ZoneName = { BZ["Nagrand"].." - "..BZ["Halaa"] };
		Location = { BZ["Nagrand"] };
		LevelRange = "64-85";
		MinLevel = "64";
		{ ORNG.."PvP: "..BZ["Halaa"] };
		{ GREN.."1) "..BZ["Halaa"], 10001 };
		{ GREN..INDENT..FACTION_ALLIANCE };
		{ GREN..INDENT..BULLET..AL["Quartermaster Davian Vaclav"] };
		{ GREN..INDENT..BULLET..AL["Chief Researcher Kartos"] };
		{ GREN..INDENT..BULLET..AL["Aldraan <Blade Merchant>"] };
		{ GREN..INDENT..BULLET..AL["Cendrii <Food & Drink>"] };
		{ GREN..INDENT..FACTION_HORDE };
		{ GREN..INDENT..BULLET..AL["Quartermaster Jaffrey Noreliqe"] };
		{ GREN..INDENT..BULLET..AL["Chief Researcher Amereldine"] };
		{ GREN..INDENT..BULLET..AL["Coreiel <Blade Merchant>"] };
		{ GREN..INDENT..BULLET..AL["Embelar <Food & Drink>"] };
		{ GREN.."2) "..AL["Wyvern Camp"], 10002 };
	};
	HellfirePeninsulaPvP = {
		ZoneName = { BZ["Hellfire Peninsula"].." - "..AL["Hellfire Fortifications"] };
		Location = { BZ["Hellfire Peninsula"] };
		LevelRange = "58-85";
		MinLevel = "58";
		{ ORNG.."PvP: "..AL["Hellfire Fortifications"] };
		{ GREN.."1) "..BZ["The Stadium"], 10001 };
		{ GREN.."2) "..BZ["The Overlook"], 10002 };
		{ GREN.."3) "..BZ["Broken Hill"], 10003 };
	};
	TerokkarForestPvP = {
		ZoneName = { BZ["Terokkar Forest"].." - "..AL["Spirit Towers"] };
		Location = { BZ["The Bone Wastes"]..", "..BZ["Terokkar Forest"] };
		LevelRange = "62-85";
		MinLevel = "62";
		{ ORNG.."PvP: "..BZ["Auchindoun"].." "..AL["Spirit Towers"] };
		{ GREN.."1) "..AL["Spirit Towers"], 10001 };
	};
	ZangarmarshPvP = {
		ZoneName = { BZ["Zangarmarsh"].." - "..BZ["Twin Spire Ruins"] };
		Location = { BZ["Zangarmarsh"] };
		LevelRange = "60-85";
		MinLevel = "60";
		{ ORNG.."PvP: "..BZ["Twin Spire Ruins"] };
		{ GREN.."1) "..AL["West Beacon"], 10001 };
		{ GREN.."2) "..AL["East Beacon"], 10002 };
		{ GREN.."1') "..AL["Horde Field Scout"], 10003 };
		{ GREN.."2') "..AL["Alliance Field Scout"], 10004 };
		{ ORNG.."1) "..AL["Twinspire Graveyard"], 10005 };
	};
	IsleOfConquest = {
		ZoneName = { BZ["Isle of Conquest"] };
		Location = { BZ["Icecrown"] };
		LevelRange = "75-84 ("..AL["Span of 5"]..") / 85";
		MinLevel = "75";
		PlayerLimit = "40";
		Acronym = AL["IoC"];
		{ ORNG..AL["Gates are marked with red bars."] };
		{ BLUE.."A) "..ALC["Start"].." ("..FACTION_HORDE..")", 10001 };
		{ GREN..INDENT..AL["Overlord Agmar"] };
		{ BLUE.."B) "..ALC["Start"].." ("..FACTION_ALLIANCE..")", 10002 };
		{ GREN..INDENT..AL["High Commander Halford Wyrmbane <7th Legion>"] };
		{ GREN.."1) "..AL["The Refinery"], 10003 };
		{ GREN.."2) "..AL["The Docks"], 10004 };
		{ GREN.."3) "..AL["The Workshop"], 10005 };
		{ GREN.."4) "..AL["The Hangar"], 10006 };
		{ GREN.."5) "..AL["The Quarry"], 10007 };
		{ ORNG.."1) "..AL["Contested Graveyards"], 10008 };
		{ ORNG.."2) "..AL["Horde Graveyard"], 10009 };
		{ ORNG.."3) "..AL["Alliance Graveyard"], 10010 };
	};
	StrandOfTheAncients = {
		ZoneName = { BZ["Strand of the Ancients"] };
		Location = { BZ["Dragonblight"] };
		LevelRange = "65-84 ("..AL["Span of 5"]..") / 85";
		MinLevel = "65";
		PlayerLimit = "15";
		Acronym = AL["SotA"];
		{ ORNG..AL["Gates are marked with their colors."] };
		{ BLUE.."A) "..ALC["Start"].." ("..AL["Attacking Team"]..")", 10001 };
		{ BLUE.."B) "..ALC["Start"].." ("..AL["Defending Team"]..")", 10002 };
		{ _RED.."1) "..AL["Massive Seaforium Charge"], 10003 };
		{ _RED.."2) "..AL["Titan Relic"], 10004 };
		{ GREN.."1) "..AL["Battleground Demolisher"], 10005 };
		{ GREN.."2) "..AL["Graveyard Flag"], 10006 };
		{ ORNG.."1) "..AL["Resurrection Point"], 10007 };
	};
	WintergraspPvP = {
		ZoneName = { BZ["Wintergrasp"] };
		--Location = { BZ["Wintergrasp"] };
		LevelRange = "73-85";
		MinLevel = "73";
		{ ORNG.."PvP: "..BZ["Wintergrasp"] };
		{ BLUE.."A) "..BZ["Wintergrasp Fortress"], 10001 };
		{ BLUE..INDENT..BZ["Vault of Archavon"] };
		{ BLUE.."B) "..BZ["Valiance Landing Camp"], 10002 };
		{ BLUE.."C) "..BZ["Warsong Camp"], 10003 };
		{ GREN.."1) "..BZ["Wintergrasp Fortress"], 10004 };
		{ GREN..INDENT..AL["Fortress Vihecal Workshop (E)"] };
		{ GREN..INDENT..AL["Fortress Vihecal Workshop (W)"] };
		{ GREN.."2) "..BZ["The Sunken Ring"], 10005 };
		{ GREN..INDENT..AL["Sunken Ring Vihecal Workshop"] };
		{ GREN.."3) "..BZ["The Broken Temple"], 10006 };
		{ GREN..INDENT..AL["Broken Temple Vihecal Workshop"] };
		{ GREN.."4) "..BZ["Eastspark Workshop"], 10007 };
		{ GREN..INDENT..AL["Eastspark Vihecale Workshop"] };
		{ GREN.."5) "..BZ["Westspark Workshop"], 10008 };
		{ GREN..INDENT..AL["Westspark Vihecale Workshop"] };
		{ _RED.."1) "..BZ["Flamewatch Tower"], 10009 };
		{ _RED.."2) "..BZ["Winter's Edge Tower"], 10010 };
		{ _RED.."3) "..BZ["Shadowsight Tower"], 10011 };
		{ ORNG.."1) "..AL["Wintergrasp Graveyard"], 10012 };
		{ ORNG.."2) "..AL["Sunken Ring Graveyard"], 10013 };
		{ ORNG.."3) "..AL["Broken Temple Graveyard"], 10014 };
		{ ORNG.."4) "..AL["Southeast Graveyard"], 10015 };
		{ ORNG.."5) "..AL["Southwest Graveyard"], 10016 };
	};
	TheBattleForGilneas = {
		ZoneName = { BZ["Gilneas"].." - "..BZ["The Battle for Gilneas"] };
		--Location = { BZ["Gilneas"] };
		LevelRange = "85+";
		MinLevel = "85";
		{ BLUE.."A) "..BZ["Gilnean Stronghold"].." ("..FACTION_ALLIANCE..")", 10001 };
		{ ORNG..INDENT..AL["Alliance Graveyard"] };
		{ BLUE.."B) "..BZ["Horde Landing"].." ("..FACTION_HORDE..")", 10002 };
		{ GREN.."1) "..BZ["Mines"], 10003 };
		{ GREN.."2) "..BZ["Lighthouse"], 10004 };
		{ GREN.."3) "..BZ["Waterworks"], 10005 };
		{ ORNG.."1) "..AL["Horde Graveyard"], 10006 };
		{ ORNG.."2) "..AL["Contested Graveyards"], 10007 };
	};
	TolBarad = {
		ZoneName = { BZ["Tol Barad"] };
		--Location = { BZ["Tol Barad"] };
		LevelRange = "80-85";
		MinLevel = "80";
		{ ORNG..REPUTATION..": "..ALIL["Baradin's Wardens"].." ("..FACTION_ALLIANCE..")" };
		{ ORNG..REPUTATION..": "..ALIL["Hellscream's Reach"].." ("..FACTION_HORDE..")" };
		{ BLUE.."A) "..AL["Attackers"], 10001 };
		{ BLUE.."B) "..BZ["Baradin Hold"], 10002 };
		{ GREN..INDENT..FACTION_ALLIANCE };
		{ GREN..INDENT..BULLET..AL["Sergeant Parker <Baradin's Wardens>"]};
		{ GREN..INDENT..BULLET..AL["2nd Lieutenant Wansworth <Baradin's Wardens>"]};
		{ GREN..INDENT..BULLET..AL["Commander Stevens <Baradin's Wardens>"]};
		{ GREN..INDENT..BULLET..AL["Marshal Fallows <Baradin's Wardens>"]};
		{ GREN..INDENT..FACTION_HORDE };
		{ GREN..INDENT..BULLET..AL["Commander Zanoth <Hellscream's Reach>"] };
		{ GREN..INDENT..BULLET..AL["Drillmaster Razgoth <Hellscream's Reach>"] };
		{ GREN..INDENT..BULLET..AL["Private Garnoth <Hellscream's Reach>"] };
		{ GREN..INDENT..BULLET..AL["Staff Sergeant Lazgar <Hellscream's Reach>"] };
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
		{ ORNG..REPUTATION..": "..ALIL["Wildhammer Clan"].." ("..FACTION_ALLIANCE..")" };
		{ ORNG..REPUTATION..": "..ALIL["Dragonmaw Clan"].." ("..FACTION_HORDE..")" };
		{ BLUE.."A) "..AL["Wildhammer Longhouse"].." ("..FACTION_ALLIANCE..")", 10001 };
		{ BLUE.."B) "..AL["Dragonmaw Clan Compound"].." ("..FACTION_HORDE..")", 10002 };
		{ ORNG.."1) "..AL["Alliance Graveyard"], 10003 };
		{ ORNG.."2) "..AL["Horde Graveyard"], 10004 };
	};
	SilvershardMines = {
		ZoneName = { BZ["Silvershard Mines"] };
		Location = { BZ["Stranglethorn Vale"]..", "..BZ["Eastern Kingdoms"] };
		LevelRange = "90";
		MinLevel = "90";
		PlayerLimit = "10";
		{ BLUE.."A) "..ALC["Start"].." - "..FACTION_ALLIANCE, 10001 };
		{ BLUE.."B) "..ALC["Start"].." - "..FACTION_HORDE, 10002 };
		{ GREN.."1) "..AL["Mine Cart Spawn Point"], 10003 };
		{ GREN.."2) "..AL["Mine Cart Depot"], 10004 };
	};
	TempleofKotmogu = {
		ZoneName = { BZ["Temple of Kotmogu"] };
		Location = { BZ["Vale of Eternal Blossoms"]..", "..BZ["Pandaria"] };
		LevelRange = "90";
		MinLevel = "90";
		PlayerLimit = "10";
		{ BLUE.."A) "..ALC["Start"].." - "..FACTION_ALLIANCE, 10001 };
		{ BLUE.."B) "..ALC["Start"].." - "..FACTION_HORDE, 10002 };
		{ GREN.."1) "..AL["Orb of Power"], 10003 };
		{ GREN.."2) "..AL["Center Point (Maximum Points)"], 10004 };
	};
	DeepwindGorge = {
		ZoneName = { BZ["Deepwind Gorge"] };
		Location = { BZ["Valley of the Four Winds"]..", "..BZ["Pandaria"] };
		LevelRange = "90";
		MinLevel = "90";
		PlayerLimit = "15";
		{ BLUE.."A) "..ALC["Start"].." - "..FACTION_HORDE, 10001 };
		{ BLUE.."B) "..ALC["Start"].." - "..FACTION_ALLIANCE, 10002 };
		{ GREN.."1) "..BZ["Pandaren Mine"], 10003 };
		{ GREN.."2) "..AL["Center Mine"], 10004 };
		{ GREN.."3) "..BZ["Goblin Mine"], 10005 };
	};
	Ashran = {
		ZoneName = { BZ["Ashran"] };
		Location = { BZ["Draenor"] };
		LevelRange = "100";
		MinLevel = "100";
		PlayerLimit = "100";
		{ BLUE.."A) "..BZ["Warspear"].." - "..FACTION_HORDE, 10001 };
		{ BLUE.."B) "..BZ["Stormshield"].." - "..FACTION_ALLIANCE, 10002 };
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
