-- $Id: Atlas_DungeonLocs.lua 10 2016-05-17 05:34:59Z arith $
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
local AL = LibStub("AceLocale-3.0"):GetLocale("Atlas_DungeonLocs");
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

local myCategory = AL["Dungeon Locations"];

local myData = {
	DLEast = {
		ZoneName = { BZ["Eastern Kingdoms"] };
		{ WHIT.." 1) "..BZ["Sunwell Plateau"]..", ".._RED..BZ["Isle of Quel'Danas"], 10001 };
		{ WHIT.." 2) "..BZ["Magisters' Terrace"]..", ".._RED..BZ["Isle of Quel'Danas"], 10002 };
		{ WHIT.." 3) "..BZ["Zul'Aman"]..", ".._RED..BZ["Ghostlands"], 10003 };
		{ WHIT.." 4) "..BZ["Stratholme"]..", ".._RED..BZ["Eastern Plaguelands"], 10004 };
		{ WHIT..INDENT..BZ["Stratholme"].." - "..BZ["Crusaders' Square"] };
		{ WHIT..INDENT..BZ["Stratholme"].." - "..BZ["The Gauntlet"] };
		{ WHIT.." 5) "..BZ["Scarlet Monastery"]..", ".._RED..BZ["Tirisfal Glades"], 10005 };
		{ WHIT..INDENT..BZ["Scarlet Halls"] };
		{ WHIT..INDENT..BZ["Scarlet Monastery"] };
		{ WHIT.." 6) "..BZ["Scholomance"]..", ".._RED..BZ["Western Plaguelands"], 10006 };
		{ WHIT.." 7) "..BZ["Shadowfang Keep"]..", ".._RED..BZ["Silverpine Forest"], 10007 };
		{ WHIT.." 8) "..BZ["Baradin Hold"]..", ".._RED..BZ["Tol Barad"], 10008 };
		{ WHIT.." 9) "..BZ["Grim Batol"]..", ".._RED..BZ["Twilight Highlands"], 10009 };
		{ WHIT.."10) "..BZ["The Bastion of Twilight"]..", ".._RED..BZ["Twilight Highlands"], 10010 };
		{ WHIT.."11) "..BZ["Gnomeregan"]..", ".._RED..BZ["Dun Morogh"], 10011 };
		{ WHIT.."12) "..BZ["The Abyssal Maw"]..", ".._RED..BZ["Abyssal Depths"], 10012 };
		{ WHIT.."13) "..BZ["Uldaman"]..", ".._RED..BZ["Badlands"], 10013 };
		{ WHIT.."14) "..BZ["Blackrock Mountain"]..", ".._RED..BZ["Searing Gorge"].." / "..BZ["Burning Steppes"], 10014 };
		{ WHIT..INDENT..BZ["Blackrock Caverns"] };
		{ WHIT..INDENT..BZ["Blackrock Depths"] };
		{ WHIT..INDENT..BZ["Blackwing Descent"] };
		{ WHIT..INDENT..BZ["Blackwing Lair"]..", ".._RED..BZ["Upper Blackrock Spire"] };
		{ WHIT..INDENT..BZ["Lower Blackrock Spire"] };
		{ WHIT..INDENT..BZ["The Molten Core"]..", ".._RED..BZ["Blackrock Depths"] };
		{ WHIT..INDENT..BZ["Upper Blackrock Spire"] };
		{ WHIT.."15) "..BZ["The Stockade"]..", ".._RED..BZ["Stormwind City"], 10015 };
		{ WHIT.."16) "..BZ["Sunken Temple"]..", ".._RED..BZ["Swamp of Sorrows"], 10016 };
		{ WHIT.."17) "..BZ["The Deadmines"]..", ".._RED..BZ["Westfall"], 10017 };
		{ WHIT.."18) "..BZ["Karazhan"]..", ".._RED..BZ["Deadwind Pass"], 10018 };
		{ WHIT.."19) "..BZ["Zul'Gurub"]..", ".._RED..BZ["Northern Stranglethorn"], 10019 };
		{ GREN.." 1') "..BZ["Alterac Valley"]..", ".._RED..BZ["Hillsbrad Foothills"], 10020 };
		{ GREN.." 2') "..BZ["Arathi Basin"]..", ".._RED..BZ["Arathi Highlands"], 10021 };
		{ GREN.." 3') "..BZ["Tol Barad"]..", ".._RED..BZ["Tol Barad"], 10022 };
		{ "" };
		{ WHIT..AL["White"]..": "..ORNG..AL["Instances"] };
		{ GREN..AL["Green"]..": "..ORNG..BATTLEGROUNDS };
	};
	DLWest = {
		ZoneName = { BZ["Kalimdor"] };
		{ WHIT.." 1) "..BZ["Firelands"]..", ".._RED..BZ["Mount Hyjal"], 10001 };
		{ WHIT.." 2) "..BZ["Blackfathom Deeps"]..", ".._RED..BZ["Ashenvale"], 10002 };
		{ WHIT.." 3) "..BZ["Ragefire Chasm"]..", ".._RED..BZ["Orgrimmar"], 10003 };
		{ WHIT.." 4) "..BZ["Wailing Caverns"]..", ".._RED..BZ["Northern Barrens"], 10004 };
		{ WHIT.." 5) "..BZ["Maraudon"]..", ".._RED..BZ["Desolace"], 10005 };
		{ WHIT.." 6) "..BZ["Dire Maul"]..", ".._RED..BZ["Feralas"], 10006 };
		{ WHIT.." 7) "..BZ["Razorfen Kraul"]..", ".._RED..BZ["Southern Barrens"], 10007 };
		{ WHIT.." 8) "..BZ["Razorfen Downs"]..", ".._RED..BZ["Thousand Needles"], 10008 };
		{ WHIT.." 9) "..BZ["Onyxia's Lair"]..", ".._RED..BZ["Dustwallow Marsh"], 10009 };
		{ WHIT.."10) "..BZ["Zul'Farrak"]..", ".._RED..BZ["Tanaris"], 10010 };
		{ WHIT.."11) "..BZ["Caverns of Time"]..", ".._RED..BZ["Tanaris"], 10011 };
		{ WHIT..INDENT..BZ["Old Hillsbrad Foothills"] };
		{ WHIT..INDENT..BZ["The Black Morass"] };
		{ WHIT..INDENT..BZ["Hyjal Summit"] };
		{ WHIT..INDENT..BZ["The Culling of Stratholme"] };
		{ WHIT..INDENT..BZ["End Time"] };
		{ WHIT..INDENT..BZ["Well of Eternity"] };
		{ WHIT..INDENT..BZ["Hour of Twilight"] };
		{ WHIT..INDENT..BZ["Dragon Soul"] };
		{ WHIT.."12) "..BZ["Ahn'Qiraj"]..", ".._RED..BZ["Ahn'Qiraj: The Fallen Kingdom"], 10012 };
		{ WHIT..INDENT..BZ["Ruins of Ahn'Qiraj"] };
		{ WHIT..INDENT..BZ["Temple of Ahn'Qiraj"] };
		{ WHIT.."13) "..BZ["Halls of Origination"]..", ".._RED..BZ["Uldum"], 10013 };
		{ WHIT.."14) "..BZ["Lost City of the Tol'vir"]..", ".._RED..BZ["Uldum"], 10014 };
		{ WHIT.."15) "..BZ["Throne of the Four Winds"]..", ".._RED..BZ["Uldum"], 10015 };
		{ WHIT.."16) "..BZ["The Vortex Pinnacle"]..", ".._RED..BZ["Uldum"], 10016 };
		{ GREN.." 1') "..BZ["Warsong Gulch"]..", ".._RED..BZ["Ashenvale"], 10017 };
		{ "" };
		{ WHIT..AL["White"]..": "..ORNG..AL["Instances"] };
		{ GREN..AL["Green"]..": "..ORNG..BATTLEGROUNDS };
	};
	DLOutland = {
		ZoneName = { BZ["Outland"] };
		{ WHIT.." 1) "..BZ["Gruul's Lair"]..", ".._RED..BZ["Blade's Edge Mountains"], 10001 };
		{ WHIT.." 2) "..BZ["Tempest Keep"]..", ".._RED..BZ["Netherstorm"], 10002 };
		{ WHIT..INDENT..BZ["The Mechanar"] };
		{ WHIT..INDENT..BZ["The Botanica"] };
		{ WHIT..INDENT..BZ["The Arcatraz"] };
		{ WHIT..INDENT..BZ["Tempest Keep"] };
		{ WHIT.." 3) "..BZ["Coilfang Reservoir"]..", ".._RED..BZ["Zangarmarsh"], 10003 };
		{ WHIT..INDENT..BZ["The Slave Pens"] };
		{ WHIT..INDENT..BZ["The Underbog"] };
		{ WHIT..INDENT..BZ["The Steamvault"] };
		{ WHIT..INDENT..BZ["Serpentshrine Cavern"] };
		{ WHIT.." 4) "..BZ["Hellfire Citadel"]..", ".._RED..BZ["Hellfire Peninsula"], 10004 };
		{ WHIT..INDENT..BZ["Hellfire Ramparts"] };
		{ WHIT..INDENT..BZ["The Blood Furnace"] };
		{ WHIT..INDENT..BZ["The Shattered Halls"] };
		{ WHIT..INDENT..BZ["Magtheridon's Lair"] };
		{ WHIT.." 5) "..BZ["Auchindoun"]..", ".._RED..BZ["Terokkar Forest"], 10005 };
		{ WHIT..INDENT..BZ["Mana-Tombs"] };
		{ WHIT..INDENT..BZ["Auchenai Crypts"] };
		{ WHIT..INDENT..BZ["Sethekk Halls"] };
		{ WHIT..INDENT..BZ["Shadow Labyrinth"] };
		{ WHIT.." 6) "..BZ["Black Temple"]..", ".._RED..BZ["Shadowmoon Valley"], 10006 };
	};
	DLNorthrend = {
		ZoneName = { BZ["Northrend"] };
		{ WHIT.." 1) "..BZ["Ulduar"]..", ".._RED..BZ["The Storm Peaks"], 10001 };
		{ WHIT..INDENT..BZ["Ulduar"] };
		{ WHIT..INDENT..BZ["Halls of Stone"] };
		{ WHIT..INDENT..BZ["Halls of Lightning"] };
		{ WHIT.." 2) "..ALC["Crusaders' Coliseum"]..", ".._RED..BZ["Icecrown"], 10002 };
		{ WHIT..INDENT..BZ["Trial of the Crusader"] };
		{ WHIT..INDENT..BZ["Trial of the Champion"] };
		{ WHIT.." 3) "..BZ["Gundrak"]..", ".._RED..BZ["Zul'Drak"], 10003 };
		{ WHIT.." 4) "..BZ["Icecrown Citadel"]..", ".._RED..BZ["Icecrown"], 10004 };
		{ WHIT..INDENT..BZ["Icecrown Citadel"] };
		{ WHIT..INDENT..BZ["The Frozen Halls"] };		
		{ WHIT..INDENT..INDENT..BZ["The Forge of Souls"] };
		{ WHIT..INDENT..INDENT..BZ["Pit of Saron"] };
		{ WHIT..INDENT..INDENT..BZ["Halls of Reflection"] };
		{ WHIT.." 5) "..BZ["The Violet Hold"]..", ".._RED..BZ["Dalaran"], 10005 };
		{ WHIT.." 6) "..BZ["Vault of Archavon"]..", ".._RED..BZ["Wintergrasp"], 10006 };
		{ WHIT.." 7) "..BZ["Drak'Tharon Keep"]..", ".._RED..BZ["Grizzly Hills"], 10007 };
		{ WHIT.." 8) "..BZ["The Nexus"]..", ".._RED..BZ["Coldarra"], 10008 };
		{ WHIT..INDENT..BZ["The Nexus"] };
		{ WHIT..INDENT..BZ["The Oculus"] };
		{ WHIT..INDENT..BZ["The Eye of Eternity"] };
		{ WHIT.." 9) "..BZ["Azjol-Nerub"]..", ".._RED..BZ["Dragonblight"], 10009 };
		{ WHIT..INDENT..BZ["Azjol-Nerub"] };
		{ WHIT..INDENT..BZ["Ahn'kahet: The Old Kingdom"] };
		{ WHIT.."10) "..BZ["Wyrmrest Temple"]..", ".._RED..BZ["Dragonblight"], 10010 };
		{ WHIT..INDENT..BZ["The Obsidian Sanctum"] };
		{ WHIT..INDENT..BZ["The Ruby Sanctum"] };
		{ WHIT.."11) "..BZ["Naxxramas"]..", ".._RED..BZ["Dragonblight"], 10011 };
		{ WHIT.."12) "..BZ["Utgarde Keep"]..", ".._RED..BZ["Howling Fjord"], 10012 };
		{ WHIT..INDENT..BZ["Utgarde Keep"] };
		{ WHIT..INDENT..BZ["Utgarde Pinnacle"] };
		{ GREN.." 1') "..BZ["Wintergrasp"]..", ".._RED..BZ["Wintergrasp"], 10013 };
		{ "" };
		{ WHIT..AL["White"]..": "..ORNG..AL["Instances"] };
		{ GREN..AL["Green"]..": "..ORNG..BATTLEGROUNDS };
	};
	DLDeepholm = {
		ZoneName = { BZ["Deepholm"] };
		{ WHIT.." 1) "..BZ["The Stonecore"], 10001 };
	};
	DLPandaria = {
		ZoneName = { BZ["Pandaria"] };
		{ WHIT.." 1) "..BZ["Throne of Thunder"]..", ".._RED..BZ["Isle of Thunder"], 10001 };
		{ WHIT.." 2) "..BZ["Shado-Pan Monastery"]..", ".._RED..BZ["Kun-Lai Summit"], 10002 };
		{ WHIT.." 3) "..BZ["Mogu'shan Vaults"]..", ".._RED..BZ["Kun-Lai Summit"], 10003 };
		{ WHIT.." 4) "..BZ["Siege of Niuzao Temple"]..", ".._RED..BZ["Townlong Steppes"], 10004 };
		{ WHIT.." 5) "..BZ["Gate of the Setting Sun"]..", ".._RED..BZ["Dread Wastes"].." / ".._RED..BZ["Vale of Eternal Blossoms"], 10005 };
		{ WHIT.." 6) "..BZ["Siege of Orgrimmar"]..", ".._RED..BZ["Vale of Eternal Blossoms"], 10006 };
		{ WHIT.." 7) "..BZ["Mogu'shan Palace"]..", ".._RED..BZ["Vale of Eternal Blossoms"], 10007 };
		{ WHIT.." 8) "..BZ["Terrace of Endless Spring"]..", ".._RED..BZ["The Veiled Stair"], 10008 };
		{ WHIT.." 9) "..BZ["Temple of the Jade Serpent"]..", ".._RED..BZ["The Jade Forest"], 10009 };
		{ WHIT.."10) "..BZ["Heart of Fear"]..", ".._RED..BZ["Dread Wastes"], 10010 };
		{ WHIT.."11) "..BZ["Stormstout Brewery"]..", ".._RED..BZ["Valley of the Four Winds"], 10011 };
		{ GREN.." 1') "..BZ["Deepwind Gorge"]..", ".._RED..BZ["Valley of the Four Winds"], 10012 };
		{ "" };
		{ WHIT..AL["White"]..": "..ORNG..AL["Instances"] };
		{ GREN..AL["Green"]..": "..ORNG..BATTLEGROUNDS };
	};
	DLDraenor = {
		ZoneName = { BZ["Draenor"] };
		{ WHIT.." 1) "..BZ["Iron Docks"]..", ".._RED..BZ["Gorgrond"], 10001 };
		{ WHIT.." 2) "..BZ["Blackrock Foundry"]..", ".._RED..BZ["Gorgrond"], 10002 };
		{ WHIT.." 3) "..BZ["Grimrail Depot"]..", ".._RED..BZ["Gorgrond"], 10003 };
		{ WHIT.." 4) "..BZ["Bloodmaul Slag Mines"]..", ".._RED..BZ["Frostfire Ridge"], 10004 };
		{ WHIT.." 5) "..BZ["The Everbloom"]..", ".._RED..BZ["Gorgrond"], 10005 };
		{ WHIT.." 6) "..BZ["Highmaul"]..", ".._RED..BZ["Nagrand"], 10006 };
		{ WHIT.." 7) "..BZ["Auchindoun"]..", ".._RED..BZ["Talador"], 10007 };
		{ WHIT.." 8) "..BZ["Shadowmoon Burial Grounds"]..", ".._RED..BZ["Shadowmoon Valley"], 10008 };
		{ WHIT.." 9) "..BZ["Skyreach"]..", ".._RED..BZ["Spires of Arak"], 10009 };
		{ WHIT.."10) "..BZ["Hellfire Citadel"]..", ".._RED..BZ["Tanaan Jungle"], 10010 };
		{ GREN.." 1') "..BZ["Ashran"]..", ".._RED..BZ["Ashran"], 10011 };
		{ "" };
		{ WHIT..AL["White"]..": "..ORNG..AL["Instances"] };
		{ GREN..AL["Green"]..": "..ORNG..BATTLEGROUNDS };
	};
};

Atlas_RegisterPlugin("Atlas_DungeonLocs", myCategory, myData);
