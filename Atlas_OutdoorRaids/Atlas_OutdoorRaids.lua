-- $Id: Atlas_OutdoorRaids.lua 18 2016-08-16 15:12:56Z arith $
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
local L = LibStub("AceLocale-3.0"):GetLocale("Atlas_OutdoorRaids");
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

local myCategory = L["Outdoor Raid Encounters"];

local myData = {
	OR_DoomLordKazzak = {
		ZoneName = { Atlas_GetBossName("Doom Lord Kazzak") };
		Location = { BZ["Hellfire Peninsula"] };
		LevelRange = "70-80";
		PlayerLimit = "40";
		{ WHIT.."1) "..Atlas_GetBossName("Doom Lord Kazzak"), 10001 };
		{ WHIT.."2) "..BZ["Invasion Point: Annihilator"], 10002 };
		{ WHIT.."3) "..BZ["Forge Camp: Rage"], 10003 };
		{ WHIT.."4) "..BZ["Forge Camp: Mageddon"], 10004 };
		{ WHIT.."5) "..BZ["Thrallmar"], 10005 };
	};
	OR_Doomwalker = {
		ZoneName = { Atlas_GetBossName("Doomwalker") };
		Location = { BZ["Shadowmoon Valley"] };
		LevelRange = "70-80";
		PlayerLimit = "40";
		{ WHIT.."1) "..Atlas_GetBossName("Doomwalker"), 10001 };
	};
	OR_BrokenIsles = {
		ZoneName = { L["Broken Isles World Bosses"] };
		Location = { BZ["Broken Isles"] };
		LevelRange = "110+";
		PlayerLimit = "40";
		JournalInstanceID = "822";
		LargeMap = "OR_BrokenIsles";
		{ WHIT.." 1) "..Atlas_GetBossName("Calamir", 1774), 1774 };				-- (Azsuna)
		{ WHIT.." 2) "..Atlas_GetBossName("Withered J'im", 1796), 1796 };			-- (Azsuna)
		{ WHIT.." 3) "..Atlas_GetBossName("Levantus", 1769), 1769 };				-- (Stormheim? Looks to be in Azsuna)
		{ WHIT.." 4) "..Atlas_GetBossName("Humongris", 1770), 1770 };				-- (Val'sharah)
		{ WHIT.." 5) "..Atlas_GetBossName("Shar'thos", 1763), 1763 };				-- (Val'sharah)
		{ WHIT.." 6) "..Atlas_GetBossName("Drugon the Frostblood", 1789), 1789 };		-- (Highmountain)
		{ WHIT.." 7) "..Atlas_GetBossName("Flotsam", 1795), 1795 };				-- (Highmountain)
		{ WHIT.." 8) "..Atlas_GetBossName("Ana-Mouz", 1790), 1790 };				-- (Stormheim)
		{ WHIT.." 9) "..Atlas_GetBossName("The Soultakers", 1756), 1756 };			-- (Stormheim)
		{ INDENT..WHIT..Atlas_GetBossName("Soultrapper Mevra", 1756, 1), 1756 };
		{ INDENT..WHIT..Atlas_GetBossName("Captain Hring", 1756, 2), 1756 };
		{ INDENT..WHIT..Atlas_GetBossName("Reaver Jdorn", 1756, 3), 1756 };
		{ WHIT.."10) "..Atlas_GetBossName("Nithogg", 1749), 1749 };				-- (Stormheim)
		{ WHIT.."11) "..Atlas_GetBossName("Na'zak the Fiend", 1783), 1783 };			-- (Suramar)
	};
	OR_Draenor = {
		ZoneName = { L["Draenor World Bosses"] };
		Location = { BZ["Draenor"] };
		LevelRange = "100-110";
		PlayerLimit = "--";
		JournalInstanceID = "557";
		LargeMap = "OR_Draenor";
		{ WHIT.." 1) "..Atlas_GetBossName("Drov the Ruiner", 1291), 1291 };
		{ WHIT..INDENT..Atlas_GetBossName("Frenzied Rumbler", 1291, 2), 1291 };
		{ WHIT.." 2) "..Atlas_GetBossName("Tarlna the Ageless", 1211), 1211 };
		{ WHIT..INDENT..Atlas_GetBossName("Giant Lasher", 1211, 3), 1211 };
		{ WHIT..INDENT..Atlas_GetBossName("Untamed Mandragora", 1211, 2), 1211 };
		{ WHIT.." 3) "..Atlas_GetBossName("Rukhmar", 1262), 1262 };
		{ WHIT.." 4) "..Atlas_GetBossName("Supreme Lord Kazzak", 1452), 1452 };
	};
	OR_Pandaria = {
		ZoneName = { L["Pandaria World Bosses"] };
		Location = { BZ["Pandaria"] };
		LevelRange = "90-100";
		PlayerLimit = "--";
		JournalInstanceID = "322";
		LargeMap = "OR_Pandaria";
		{ WHIT.." 1) "..Atlas_GetBossName("Nalak, The Storm Lord", 814), 814 };
		{ WHIT.." 2) "..Atlas_GetBossName("Oondasta", 826), 826 };
		{ WHIT.." 3) "..Atlas_GetBossName("Sha of Anger", 691), 691 };
		{ WHIT.." 4) "..Atlas_GetBossName("Salyis's Warband", 725), 725 };
		{ WHIT..INDENT..Atlas_GetBossName("Galleon", 725, 1), 725 };
		{ WHIT..INDENT..Atlas_GetBossName("Chief Salyis", 725, 2), 725 };
		{ WHIT.." 5) "..Atlas_GetBossName("Ordos, Fire-God of the Yaungol", 861), 861 };
		{ WHIT.." 6) "..BF["The August Celestials"] };
		{ WHIT..INDENT..Atlas_GetBossName("Chi-Ji, The Red Crane", 857), 857 };
		{ WHIT..INDENT..Atlas_GetBossName("Niuzao, The Black Ox", 859), 859 };
		{ WHIT..INDENT..Atlas_GetBossName("Xuen, The White Tiger", 860), 860 };
		{ WHIT..INDENT..Atlas_GetBossName("Yu'lon, The Jade Serpent", 858), 858 };
	};
	OR_Skettis = {
		ZoneName = { BZ["Skettis"] };
		Location = { BZ["Blackwind Valley"]..", "..BZ["Terokkar Forest"] };
		LevelRange = "70-80";
		PlayerLimit = "40";
		{ WHIT.."1) "..BZ["Blackwind Landing"], 10001 };
		{ WHIT..INDENT..L["Sky Commander Adaris"] };
		{ WHIT..INDENT..L["Sky Sergeant Doryn"] };
		{ WHIT..INDENT..L["Skyguard Handler Deesak"] };
		{ WHIT..INDENT..L["Severin <Skyguard Medic>"] };
		{ WHIT..INDENT..L["Grella <Skyguard Quartermaster>"] };
		{ WHIT..INDENT..L["Hazzik"] };
		{ WHIT.."2) "..L["Ancient Skull Pile"], 10002 };
		{ WHIT..INDENT..L["Terokk"]..ALC["L-Parenthesis"]..ALC["Summon"]..ALC["R-Parenthesis"] };
		{ WHIT.."3) "..L["Sahaak <Keeper of Scrolls>"], 10003 };
		{ WHIT.."4) "..L["Skyguard Prisoner"]..ALC["L-Parenthesis"]..ALC["Random"]..ALC["R-Parenthesis"], 10004 };
		{ WHIT.."5) "..L["Talonpriest Ishaal"], 10005 };
		{ WHIT.."6) "..L["Talonpriest Skizzik"], 10006 };
		{ WHIT.."7) "..L["Talonpriest Zellek"], 10007 };
		{ WHIT.."8) "..L["Hazzik's Package"], 10008 };
		{ WHIT.."9) "..ALC["Graveyard"], 10009 };
		{ GREN.."1') "..L["Skull Pile"], 10010 };
		{ GREN..INDENT..L["Darkscreecher Akkarai"]..ALC["L-Parenthesis"]..ALC["Summon"]..ALC["R-Parenthesis"] };
		{ GREN..INDENT..L["Gezzarak the Huntress"]..ALC["L-Parenthesis"]..ALC["Summon"]..ALC["R-Parenthesis"] };
		{ GREN..INDENT..L["Karrog"]..ALC["L-Parenthesis"]..ALC["Summon"]..ALC["R-Parenthesis"] };
		{ GREN..INDENT..L["Vakkiz the Windrager"]..ALC["L-Parenthesis"]..ALC["Summon"]..ALC["R-Parenthesis"] };
	};
};

Atlas_RegisterPlugin("Atlas_OutdoorRaids", myCategory, myData);
