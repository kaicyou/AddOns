-- $Id: Atlas_Scenarios.lua 22 2016-07-19 13:56:02Z arith $
--[[

	Atlas, a World of Warcraft instance map browser
	Copyright 2012 ~ 2016 - Arith Hsu, Atlas Team <atlas.addon@gmail.com>

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
local L = LibStub("AceLocale-3.0"):GetLocale("Atlas_Scenarios");
local ALC = LibStub("AceLocale-3.0"):GetLocale("Atlas");
local ALIL = Atlas_IngameLocales;

local BLUE = "|cff6666ff";
local GREN = "|cff66cc33";
local _RED = "|cffcc3333";
local ORNG = "|cffcc9933";
local PURP = "|cff9900ff";
local WHIT = "|cffffffff";
local CYAN = "|cff00ffff";
local GREY = "|cff999999";
local YELL = "|cffcccc00";
local INDENT = "      ";

local myCategory = L["Scenarios Maps"];

local function Atlas_GetAchievementName(achievementID, eng_desc)
	local _, name = GetAchievementInfo(achievementID);

	if (name) then
		return name;
	else
		return eng_desc;
	end
end

local function Atlas_GetAchievementDesc(achievementID, eng_desc)
	local _, _, _, _, _, _, _, description = GetAchievementInfo(achievementID);

	if (description) then
		return description;
	else
		return eng_desc;
	end
end


local myData = {
--************************************************
-- Scenarios
--************************************************
	SC_ABrewingStorm = {
		ZoneName = { BZ["A Brewing Storm"] };
		Location = { BZ["Thunderpaw Overlook"]..ALC["Comma"]..BZ["The Jade Forest"] };
		LevelRange = "90";
		MinLevel = "90";
		PlayerLimit = "3";
		{ BLUE.." A) "..BZ["Thunderpaw Overlook"]..ALC["Hyphen"]..ALC["Start"] };
		{ INDENT..YELL.."- "..L["Stage 1"]..ALC["Hyphen"]..L["Make Boomer's Brew"] };
		{ INDENT..INDENT..GREY..L["Assist Blanche in brewing her famous Boomer's Brew."] };
		{ INDENT..YELL.."- "..L["Stage 2"]..ALC["Hyphen"]..L["Road to Thunderpaw"] };
		{ INDENT..INDENT..GREY..L["Escort Blanche down Thunderpaw Road."] };
		{ BLUE.." B) "..BZ["Thunderpaw Refuge"]..ALC["Hyphen"]..ALC["End"] };
		{ INDENT..YELL.."- "..L["Final Stage"]..ALC["Hyphen"]..L["Save Thunderpaw Refuge"] };
		{ INDENT..INDENT..GREY..L["Defeat Borokhula the Destroyer."] };
	};
	SC_ALittlePatience = {
		ZoneName = { BZ["A Little Patience"] };
		Location = { BZ["The Deepwild"]..ALC["Comma"]..BZ["Krasarang Wilds"] };
		LevelRange = "90";
		MinLevel = "90";
		PlayerLimit = "3";
		{ BLUE.." A) "..ALC["Start"] };
		{ INDENT..YELL.."- "..L["Stage 1"]..ALC["Hyphen"]..L["Prepare the Defenses"] };
		{ INDENT..INDENT..GREY..L["Assist the two groups of laborers in the construction of their defenses."] };
		{ INDENT..BLUE.." B) "..L["Traps"] };
		{ BLUE.." C) "..L["Commander Scargash"] };
		{ INDENT..YELL.."- "..L["Final Stage"]..ALC["Hyphen"]..L["Kill Commander Scargash"] };
		{ INDENT..INDENT..GREY..L["Defeat Commander Scargash and reclaim the Temple of the Red Crane."] };
	}; 
	SC_ArenaOfAnnihilation = {
		ZoneName = { BZ["Arena of Annihilation"] };
		Location = { BZ["Temple of the White Tiger"]..ALC["Comma"]..BZ["Kun-Lai Summit"] };
		LevelRange = "90";
		MinLevel = "90";
		PlayerLimit = "3";
		{ BLUE.." A) "..ALC["Summon"] };
		{ INDENT..YELL.."- "..L["Stage 1"]..ALC["Hyphen"]..L["Scar-Shell"] };
		{ INDENT..INDENT..GREY..L["Summon and defeat the mighty dragon turtle, Scar-Shell."] };
		{ INDENT..YELL.."- "..L["Stage 2"]..ALC["Hyphen"]..L["Jol'Grum"] };
		{ INDENT..INDENT..GREY..L["Summon and defeat the grummle-eating, snow-stalking horror, Jol'Grum."] };
		{ INDENT..YELL.."- "..L["Stage 3"]..ALC["Hyphen"]..L["Little Liuyang"] };
		{ INDENT..INDENT..GREY..L["Summon and defeat the playful fire spirit, Liuyang."] };
		{ INDENT..YELL.."- "..L["Stage 4"]..ALC["Hyphen"]..L["Chagan Firehoof"] };
		{ INDENT..INDENT..GREY..L["Summon and defeat the wandering yaungol warrior, Chagan Firehoof."] };
		{ INDENT..YELL.."- "..L["Final Stage"]..ALC["Hyphen"]..L["Defeat the Final Challenger!"]..ALC["L-Parenthesis"]..ALC["Random"]..ALC["R-Parenthesis"] };
		{ INDENT..INDENT..GREY..L["Summon and defeat the final challenger and then claim your reward from Wodin!"] };
		{ INDENT..INDENT..YELL..L["Defeat Maki Waterblade"] };
		{ INDENT..INDENT..YELL..L["Defeat Satay Byu"] };
		{ INDENT..INDENT..YELL..L["Defeat Cloudbender Kobo"] };
	};
	SC_AssaultonZanvess = {
		ZoneName = { BZ["Assault on Zan'vess"] };
		Location = { BZ["Zan'vess"]..ALC["Comma"]..BZ["Dread Wastes"] };
		LevelRange = "90";
		MinLevel = "90";
		PlayerLimit = "3";
		{ BLUE.."A) "..ALC["Start"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"] };
		{ BLUE.."B) "..ALC["Start"]..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"] };
		{ YELL.."- "..L["Stage 1"]..ALC["Hyphen"]..L["Assault on Zan'vess"] };
		{ INDENT..GREY..L["Launch an assault on the island of Zan'vess."] };
		{ YELL.."- "..L["Stage 2"]..ALC["Hyphen"]..L["Defenses of Zan'vess"] };
		{ BLUE.."C) "..L["Kyparite Quarry Sonic Control Towers"] };
		{ BLUE.."D) "..L["Whispering Stones Sonic Control Towers"] };
		{ BLUE.."E) "..L["Venomsting Pits Sonic Control Towers"] };
		{ INDENT..GREY..L["Destroy the Sonic Towers and deactivate the Zan'vess Defense Shield."] };
		{ BLUE.."F) "..L["Landing"] };
		{ YELL.."- "..L["Stage 3"]..ALC["Hyphen"]..BZ["Heart of Zan'vess"] };
		{ INDENT..GREY..L["Storm the beach and reach the Heart of Zan'vess."] };
		{ INDENT..WHIT.."1) "..L["Squad Leader Bosh"] };
		{ BLUE.."G) "..BZ["Heart of Zan'vess"] };
		{ YELL.."- "..L["Final Stage"]..ALC["Hyphen"]..L["Weapons of Zan'vess"] };
		{ INDENT..GREY..L["Defeat Commander Tel'vrak and retrieve the Mantid weapon cache."] };
		{ INDENT..WHIT.."- "..L["Commander Tel'vrak"] };
	};
	SC_BattleontheHighSeasAlliance = {
		ZoneName = { BZ["Battle on the High Seas"]..ALC["Hyphen"]..FACTION_ALLIANCE };
		LevelRange = "90";
		MinLevel = "90";
		PlayerLimit = "3";
		{ BLUE.." A) "..ALC["Start"] };
		{ INDENT..YELL.."- "..L["Stage 1"]..ALC["Hyphen"]..L["Boarding Party!"] };
		{ INDENT..INDENT..GREY..L["Protect the Ship!  Defeat the Horde Boarding party."] };
		{ INDENT..INDENT..WHIT.."- "..L["Lieutenant Drak'on"] };
		{ INDENT..BLUE.."B) "..L["Transport Cannon"] };
		{ BLUE.." C) "..L["Rope Pile"] };
		{ BLUE.." D) "..L["Steal Explosives"] };
		{ INDENT..YELL.."- "..L["Stage 2"]..ALC["Hyphen"]..L["Explosives Acquisition"] };
		{ INDENT..INDENT..GREY..L["Steal Explosives from enemy Demolitionists."] };
		{ INDENT..INDENT..WHIT.."- "..L["Lieutenant Sparklighter"] };
		{ INDENT..INDENT..WHIT.."- "..L["Lieutenant Fizzel"] };
		{ INDENT..INDENT..WHIT.."- "..L["Lieutenant Blasthammer"] };
		{ INDENT..YELL.."- "..L["Stage 3"]..ALC["Hyphen"]..L["To Smithereens!"] };
		{ INDENT..INDENT..GREY..L["Plant explosives on the Horde Ship to destroy it!"] };
		{ INDENT..INDENT.._RED..L["Run to the top deck and swing away!"] };
		{ INDENT..BLUE.."E) "..L["Rope Pile"] };
		{ INDENT..BLUE.."F) "..L["Transport Cannon"] };
		{ BLUE.." G) "..L["Admiral Hagman"] };
		{ INDENT..YELL.."- "..L["Final Stage"]..ALC["Hyphen"]..L["Defeat the Admiral!"] };
		{ INDENT..INDENT..GREY..L["Defeat Admiral Hagman."] };
		{ INDENT..INDENT.."- "..L["Admiral Hagman"] };
	};
	SC_BattleontheHighSeasHorde = {
		ZoneName = { BZ["Battle on the High Seas"]..ALC["Hyphen"]..FACTION_HORDE };
		LevelRange = "90";
		MinLevel = "90";
		PlayerLimit = "3";
		{ BLUE.." A) "..ALC["Start"] };
		{ INDENT..YELL.."- "..L["Stage 1"]..ALC["Hyphen"]..L["Boarding Party!"] };
		{ INDENT..INDENT..GREY..L["Protect the Ship!  Defeat the Alliance Boarding party."] };
		{ INDENT..INDENT..WHIT.."- "..L["Lieutenant Parker"] };
		{ INDENT..BLUE.."B) "..L["Transport Cannon"] };
		{ BLUE.." C) "..L["Rope Pile"] };
		{ BLUE.." D) "..L["Steal Explosives"] };
		{ INDENT..YELL.."- "..L["Stage 2"]..ALC["Hyphen"]..L["Explosives Acquisition"] };
		{ INDENT..INDENT..GREY..L["Steal Explosives from enemy Demolitionists."] };
		{ INDENT..INDENT..WHIT.."- "..L["Lieutenant Fuseblast"] };
		{ INDENT..INDENT..WHIT.."- "..L["Lieutenant Fizzboil"] };
		{ INDENT..INDENT..WHIT.."- "..L["Lieutenant Boltblaster"] };
		{ INDENT..YELL.."- "..L["Stage 3"]..ALC["Hyphen"]..L["To Smithereens!"] };
		{ INDENT..INDENT..GREY..L["Plant explosives on the Alliance Ship to destroy it!"] };
		{ INDENT..INDENT.._RED..L["Run to the top deck and swing away!"] };
		{ INDENT..BLUE.."E) "..L["Rope Pile"] };
		{ INDENT..BLUE.."F) "..L["Transport Cannon"] };
		{ BLUE.." G) "..L["Admiral Hodgson"] };
		{ INDENT..YELL.."- "..L["Final Stage"]..ALC["Hyphen"]..L["Defeat the Admiral!"] };
		{ INDENT..INDENT..GREY..L["Defeat Admiral Hodgson."] };
		{ INDENT..INDENT.."- "..L["Admiral Hodgson"] };
	};
	SC_BloodintheSnow = {
		ZoneName = { BZ["Blood in the Snow"] };
		Location = { BZ["Shimmer Ridge"]..ALC["Comma"]..BZ["Dun Morogh"] };
		LevelRange = "90";
		MinLevel = "90";
		PlayerLimit = "3";
		{ BLUE.." A) "..ALC["Start"] };
		{ YELL.."- "..L["Stage 1"]..ALC["Hyphen"]..L["The Mountaineers"] };
		{ INDENT..GREY..L["Contact the Dark Iron Mountaineers atop Shimmer Ridge and find a way to stop the storm."] };
		{ INDENT..GREN.."1) "..L["Dark Iron Mountaineers"] };
		{ YELL.."- "..L["Stage 2"]..ALC["Hyphen"]..L["Save Scout Stonebeard"] };
		{ INDENT..GREY..L["Free Scout Stonebeard from the trolls' roasting spit."] };
		{ INDENT..GREN.."2) "..L["Scout Stonebeard"] };
		{ YELL.."- "..L["Stage 3"]..ALC["Hyphen"]..L["Save Scout Boldbrew"] };
		{ INDENT..GREY..L["Slay the trolls trying to cook Scout Boldbrew."] };
		{ INDENT..GREN.."3) "..L["Scout Boldbrew"] };
		{ YELL.."- "..L["Stage 4"]..ALC["Hyphen"]..L["Save Scout Forgefellow"] };
		{ INDENT..GREY..L["Slay the trolls about to sacrifice Scout Forgefellow."] };
		{ INDENT..GREN.."4) "..L["Scout Forgefellow"] };
		{ YELL.."- "..L["Stage 5"]..ALC["Hyphen"]..L["The Cold Cave"] };
		{ INDENT..GREY..L["Slay the elemental spirit in the ice cave to end the snowstorm."] };
		{ INDENT..WHIT.."1) "..L["Farastu"] };
		{ YELL.."- "..L["Final Stage"]..ALC["Hyphen"]..L["Victory or Death"] };
		{ INDENT..GREY..L["Join Moira's forces, slay the Zandalari leader, and captures the Frostmane village."] };
		{ INDENT..WHIT.."2) "..L["Hekima the Wise"] };
	};
	SC_BrewmoonFestival = {
		ZoneName = { BZ["Brewmoon Festival"] };
		Location = { BZ["Binan Village"]..ALC["Comma"]..BZ["Kun-Lai Summit"] };
		LevelRange = "90";
		MinLevel = "90";
		PlayerLimit = "3";
		{ BLUE.." A) "..ALC["Start"] };
		{ INDENT..YELL.."- "..L["Stage 1"]..ALC["Hyphen"]..L["The Brewmoon Festival!"] };
		{ INDENT..INDENT..GREY..L["Help Brewmaster Boof's assistants gather the ingredients for the Kun-Lai Kicker."] };
		{ INDENT..INDENT..WHIT.." 1) "..L["Den Mother Moof"] };
		{ INDENT..INDENT..WHIT.." 2) "..L["Li Te"] };
		{ INDENT..INDENT..WHIT.." 3) "..L["Karsar the Bloodletter"] };
		{ INDENT..INDENT..GREN.." 4) "..L["Brewmaster Boof"] };
		{ BLUE.." B) "..L["Defence Point"] };
		{ INDENT..YELL.."- "..L["Stage 2"]..ALC["Hyphen"]..L["The Scouts Report."] };
		{ INDENT..INDENT..GREY..L["Investigate the Yaungol sightings."] };
		{ INDENT..YELL.."- "..L["Stage 3"]..ALC["Hyphen"]..L["The Yaungol attack!"] };
		{ INDENT..INDENT..GREY..L["Stop the Bataari invasion on Binan Village."] };
		{ BLUE.." C) "..L["Final Stage"] };
		{ INDENT..YELL.."- "..L["Final Stage"]..ALC["Hyphen"]..L["Warbringer Qobi"] };
		{ INDENT..INDENT..GREY..L["Defeat Warbringer Qobi."] };
	};
	SC_CryptofForgottenKings = {
		ZoneName = { BZ["Crypt of Forgotten Kings"] };
		Location = { BZ["Guo-Lai Halls"]..ALC["Comma"]..BZ["Vale of Eternal Blossoms"] };
		LevelRange = "90";
		MinLevel = "90";
		PlayerLimit = "3";
		{ BLUE.." A) "..ALC["Start"] };
		{ INDENT..YELL.."- "..L["Stage 1"]..ALC["Hyphen"]..L["End the Terror"] };
		{ INDENT..INDENT..GREY..L["Defeat the corrupted Shado-Pan Leader."] };
		{ INDENT..INDENT..WHIT.." 1) "..L["Jin Ironfist"] };
		{ BLUE.." B) "..L["Pool of Life"] };
		{ INDENT..YELL.."- "..L["Stage 2"]..ALC["Hyphen"]..L["The Pool of Life"] };
		{ INDENT..INDENT..GREY..L["Cleanse the Sha corruption from the Pool of Life."] };
		{ BLUE.." C) "..L["Treasure Urn"] };
		{ BLUE.." D) "..ALC["Connection"] };
		{ INDENT..YELL.."- "..L["Stage 3"]..ALC["Hyphen"]..L["Search the Crypt"] };
		{ INDENT..INDENT..GREY..L["Delve deeper into the crypt and search the bottom level."] };
		{ INDENT..YELL.."- "..L["Final Stage"]..ALC["Hyphen"]..L["Destroy the Sha"] };
		{ INDENT..INDENT..GREY..L["Destroy the Abomination of Anger."] };
		{ INDENT..INDENT..WHIT.." 2) "..L["Abomination of Anger"] };
	};
	SC_DaggerintheDark = {
		ZoneName = { BZ["Dagger in the Dark"] };
		Location = { BZ["The Veiled Stair"] };
		LevelRange = "90";
		MinLevel = "90";
		PlayerLimit = "3";
		{ BLUE.."A) "..ALC["Start"] };
		{ YELL.."- "..L["Stage 1"]..ALC["Hyphen"]..L["The Mission..."] };
		{ INDENT..GREY..L["Speak with Vol'jin to begin the search for the Saurok cave."] };
		{ INDENT..GREN.."- "..L["Vol'jin"] };
		{ BLUE.."B) "..L["Saurok Cave"] };
		{ YELL.."- "..L["Stage 2"]..ALC["Hyphen"]..L["We Ride!"] };
		{ INDENT..GREY..L["Find the entrance to the Saurok Cave."] };
		{ YELL.."- "..L["Stage 3"]..ALC["Hyphen"]..L["Guards!"] };
		{ INDENT..GREY..L["Defeat the Saurok guarding the cave."] };
		{ INDENT..WHIT.."1) "..L["Darkhatched Lizard-Lord"] };
		{ BLUE.."C) "..L["Cave"] };
		{ YELL.."- "..L["Stage 4"]..ALC["Hyphen"]..L["Into the Cave"] };
		{ INDENT..GREY..L["Make your way deeper into the cave."] };
		{ INDENT..GREN.."1') "..L["The Spring Drifter"] };
		{ INDENT..BLUE.."D) "..L["Docking"] };
		{ BLUE.."E) "..L["Saurok Hatchery"] };
		{ YELL.."- "..L["Stage 5"]..ALC["Hyphen"]..L["The Source"] };
		{ INDENT..GREY..L["Find the source of the Saurok."] };
		{ YELL.."- "..L["Stage 6"]..ALC["Hyphen"]..L["The Broodmaster"] };
		{ INDENT..GREY..L["Defeat Broodmaster Noshi."] };
		{ INDENT..WHIT.."2) "..L["Broodmaster Noshi"] };
		{ YELL.."- "..L["Stage 7"]..ALC["Hyphen"]..L["Investigation"] };
		{ INDENT..GREY..L["Investigate the Mogu Statues."] };
		{ INDENT..GREN.."2') "..L["West Statue"] };
		{ INDENT..GREN.."3') "..L["East Statue"] };
		{ YELL.."- "..L["Final Stage"]..ALC["Hyphen"]..L["Ambush!"] };
		{ INDENT..GREY..L["Fend off the Kor'kron ambush."] };
		{ INDENT..WHIT.."2) "..L["Rak'gor Bloodrazor"] };
	};
	SC_DarkHeartofPandaria = {
		ZoneName = { BZ["Dark Heart of Pandaria"] };
		Location = { BZ["Big Blossom Excavation"]..ALC["Comma"]..BZ["Vale of Eternal Blossoms"] };
		LevelRange = "90";
		MinLevel = "90";
		PlayerLimit = "3";
		{ BLUE.."A) "..ALC["Start"] };
		{ YELL.."- "..L["Stage 1"]..ALC["Hyphen"]..L["Talk to the Boss"] };
		{ INDENT..GREY..L["Speak with Grizzle Gearslip."] };
		{ INDENT..GREN.."1) "..L["Grizzle Gearslip"] };
		{ YELL.."- "..L["Stage 2"]..ALC["Hyphen"]..L["Rock Grinding"] };
		{ INDENT..GREY..L["Destroy the greater elemental ravaging the Big Blossom Excavation site."] };
		{ INDENT..WHIT.."1) "..L["Urtharges the Destroyer"]..ALC["L-Parenthesis"]..ALC["Wanders"] };
		{ YELL.."- "..L["Stage 3"]..ALC["Hyphen"]..L["Economic Recovery"] };
		{ INDENT..GREY..L["Collect artifacts for Gearslip while his workers clear the mine entrance."] };
		{ BLUE.."B) "..ALC["Tunnel"] };
		{ YELL.."- "..L["Stage 4"]..ALC["Hyphen"]..L["End of the Mine"] };
		{ INDENT..GREY..L["Travel deep into the Big Blossom Mine and blast open the wall."] };
		{ INDENT..GREN.."2) "..L["Crafty the Ambitious"] };
		{ YELL.."- "..L["Final Stage"]..ALC["Hyphen"]..L["Heartbreak"] };
		{ INDENT..GREY..L["Destroy the Echo of Y'Sharrj."] };
		{ INDENT..WHIT.."2) "..L["Echo of Y'Sharrj"] };
		{ INDENT..GREN.."3) "..L["Norushen"] };
	};
	SC_DominationPoint = {
		ZoneName = { BZ["Domination Point"] };
		Location = { BZ["Krasarang Wilds"] };
		LevelRange = "90";
		MinLevel = "90";
		PlayerLimit = "3";
		{ BLUE.."A) "..ALC["Start"] };
		{ YELL.."- "..L["Stage 1"]..ALC["Hyphen"]..L["The Flight MasterDP"] };
		{ INDENT..GREY..L["Join up with Kromthar."] };
		{ YELL.."- "..L["Stage 2"]..ALC["Hyphen"]..L["A.C.E.s High"] };
		{ INDENT..GREY..L["Fight your way through the burning refinery to General Nazgrim."] };
		{ INDENT..GREN.."1) "..L["General Nazgrim"] };
		{ YELL.."- "..L["Stage 3"]..ALC["Hyphen"]..L["Reclaim the Court!"] };
		{ INDENT..GREY..L["Defeat the Alliance forces assaulting the keep."] };
		{ INDENT..BLUE.."B) "..L["Attackers"] };
		{ YELL.."- "..L["Stage 4"]..ALC["Hyphen"]..L["The Warlord"] };
		{ INDENT..GREY..L["Locate Warlord Bloodhilt and help repel the Alliance assault."] };
		{ INDENT..GREN.."- "..L["Warlord Bloodhilt"] };
		{ INDENT..WHIT.."- "..L["Cordfellow Hack"] };
		{ YELL.."- "..L["Stage 5"]..ALC["Hyphen"]..L["Legwork"] };
		{ INDENT..GREY..L["Gather information about the Alliance and Horde forces."] };
		{ INDENT..GREN.."2) "..L["Rivett Clutchpop"] };
		{ INDENT..GREN.."3) "..L["Shademaster Kiryn"] };
		{ INDENT..GREN.."4) "..L["Shokia"] };
		{ YELL.."- "..L["Stage 6"]..ALC["Hyphen"]..L["Setting Up"] };
		{ INDENT..GREY..L["Set up Rivett's weapons and prepare to defend the keep!"] };
		{ INDENT..BLUE.."C) "..L["Weapons"] };
		{ YELL.."- "..L["Final Stage"]..ALC["Hyphen"]..L["Hold the Line!"] };
		{ INDENT..GREY..L["Hold the gate against waves of Alliance invaders and their commander."] };
		{ INDENT..WHIT.."- "..L["Wave One"] };
		{ INDENT..WHIT.."- "..L["Wave Two"] };
		{ INDENT..WHIT.."- "..L["Wave Three"] };
		{ INDENT..WHIT.."- "..L["Joan Lorraine"] };
	};
	SC_GreenstoneVillage = {
		ZoneName = { BZ["Greenstone Village"] };
		Location = { BZ["Greenstone Village"]..ALC["Comma"]..BZ["The Jade Forest"] };
		LevelRange = "90";
		MinLevel = "90";
		PlayerLimit = "3";
		{ BLUE.." A) "..ALC["Start"] };
		{ INDENT..YELL.."- "..L["Stage 1"]..ALC["Hyphen"]..L["Rescue the Villagers"] };
		{ INDENT..INDENT..GREY..L["Defeat the monsters attacking the Greenstone villagers."] };
		{ BLUE.." B) "..BZ["Greenstone Dojo"] };
		{ INDENT..YELL.."- "..L["Stage 2"]..ALC["Hyphen"]..L["Rescue the Dojo"] };
		{ INDENT..INDENT..GREY..L["Defeat the monsters attacking Greenstone's dojo."] };
		{ INDENT..YELL.."- "..L["Stage 3"]..ALC["Hyphen"]..L["Recover Burgled Barrels"] };
		{ INDENT..INDENT..GREY..L["Find burgled brew barrels in the forest and return them to the village dojo."] };
		{ BLUE.." C) "..BZ["Greenstone Masons' Quarter"] };
		{ INDENT..YELL.."- "..L["Stage 4"]..ALC["Hyphen"]..L["Rescue Greenstone Masons"] };
		{ INDENT..INDENT..GREY..L["Travel to the Masons' Quarter and awaken the unconscious villagers."] };
		{ INDENT..YELL.."- "..L["Final Stage"]..ALC["Hyphen"]..L["Defeat Vengeful Hui"] };
		{ INDENT..INDENT..GREY..L["Defeat Vengeful Hui."] };
	};
	SC_LionsLanding = {
		ZoneName = { BZ["Lion's Landing"] };
		Location = { BZ["Krasarang Cove"]..ALC["Comma"]..BZ["Krasarang Wilds"] };
		LevelRange = "90";
		MinLevel = "90";
		PlayerLimit = "3";
		{ BLUE.." A) "..ALC["Start"] };
		{ YELL.."- "..L["Stage 1"]..ALC["Hyphen"]..L["The Flight MasterLL"] };
		{ INDENT..GREY..L["Join up with Daggin Windbeard."] };
		{ INDENT..GREN.."1) "..L["Daggin Windbeard"] };
		{ YELL.."- "..L["Stage 2"]..ALC["Hyphen"]..L["Death on the Docks"] };
		{ INDENT..GREY..L["Fight your way through the docks to Admiral Taylor."] };
		{ INDENT..GREN.."2) "..L["Admiral Taylor"] };
		{ YELL.."- "..L["Stage 3"]..ALC["Hyphen"]..L["Reclaim the Court!"] };
		{ INDENT..GREY..L["Defeat the Horde forces assaulting the keep."] };
		{ INDENT..BLUE.."B) "..L["Attackers"] };
		{ YELL.."- "..L["Stage 4"]..ALC["Hyphen"]..L["The High Marshal"] };
		{ INDENT..GREY..L["Locate High Marshal Twinbraid and help repel the Horde assault."] };
		{ INDENT..GREN.."3) "..L["High Marshal Twinbraid"] };
		{ INDENT..WHIT.."- "..L["Wolf-Rider Gaja"] };
		{ YELL.."- "..L["Stage 5"]..ALC["Hyphen"]..L["Legwork"] };
		{ INDENT..GREY..L["Gather information from the SI:7 team."] };
		{ INDENT..GREN.."4) "..L["Amber Kearnen"] };
		{ INDENT..GREN.."5) "..L["Sully \"The Pickle\" McLeary"] };
		{ INDENT..GREN.."6) "..L["Mishka"] };
		{ YELL.."- "..L["Stage 6"]..ALC["Hyphen"]..L["Setting Up"] };
		{ INDENT..GREY..L["Set up Sully's weapons and prepare to defend the keep!"] };
		{ INDENT..BLUE.."C) "..L["Weapons"] };
		{ YELL.."- "..L["Final Stage"]..ALC["Hyphen"]..L["Hold the Line!"] };
		{ INDENT..GREY..L["Hold the keep against waves of Horde invaders and their commander."] };
		{ INDENT..WHIT.."- "..L["Wave One"] };
		{ INDENT..WHIT.."- "..L["Wave Two"] };
		{ INDENT..WHIT.."- "..L["Wave Three"] };
		{ INDENT..WHIT.."- "..L["Thaumaturge Saresse"] };
	};
	SC_TheSecretsofRagefire = {
		ZoneName = { BZ["The Secrets of Ragefire"] };
		Location = { BZ["Ragefire Chasm"] };
		LevelRange = "90";
		MinLevel = "90";
		PlayerLimit = "3";
		{ BLUE.." A) "..ALC["Start"] };
		{ YELL.."- "..L["Stage 1"]..ALC["Hyphen"]..L["Infiltration"] };
		{ INDENT..GREY..L["Breach the main chamber and stop the abductions."] };
		{ INDENT..BLUE.."B) "..L["Door"] };
		{ INDENT..WHIT.."1) "..L["Dark Shaman Xorenth"] };
		{ YELL.."- "..L["Stage 2"]..ALC["Hyphen"]..L["Reconnaissance"] };
		{ INDENT..GREY..L["Investigate the main chamber."] };
		{ INDENT..GREN.."1) "..L["Supply Crates"] };
		{ INDENT..GREN.."2) "..L["Proto-drake Eggs"] };
		{ INDENT..GREN.."3) "..L["Pandaria Artifacts"] };
		{ YELL.."- "..L["Stage 3"]..ALC["Hyphen"]..L["The Sealed Gate"] };
		{ INDENT..GREY..L["Help Ticker build a device to open the next gate."] };
		{ INDENT..BLUE.."C) "..L["Sealed Gate"] };
		{ INDENT..GREN.."1) "..L["Battery"]..ALC["Comma"]..L["Pool Pony"] };
		{ INDENT..GREN.."2) "..L["Broken Proto-Drake Egg"] };
		{ INDENT..GREN.."3) "..L["Cannon Balls"] };
		{ YELL.."- "..L["Final Stage"]..ALC["Hyphen"]..L["Holdout"] };
		{ INDENT..GREY..L["Defend the Gob Squad while Patch establishes an escape route."] };
		{ INDENT..WHIT.."1) "..L["Flame Hound"] };
		{ INDENT..INDENT..WHIT..L["Kor'kron Dire Soldier"] };
		{ INDENT..INDENT..WHIT..L["Overseer Elaglo"] };
	};
	SC_TheramoresFallAlliance = {
		ZoneName = { BZ["Theramore's Fall"]..ALC["Hyphen"]..FACTION_ALLIANCE };
		Location = { BZ["Theramore"]..ALC["Comma"]..BZ["Dustwallow Marsh"] };
		LevelRange = "90";
		MinLevel = "90";
		PlayerLimit = "3";
		{ BLUE.." A) "..ALC["Start"] };
		{ INDENT..YELL.."- "..L["Stage 1"]..ALC["Hyphen"]..L["Welcome to Theramore"] };
		{ INDENT..INDENT..GREY..L["Defend the ship from oncoming Horde."] };
		{ BLUE.." B) "..L["Horde Ships"] };
		{ INDENT..YELL.."- "..L["Stage 2"]..ALC["Hyphen"]..L["Sweep the Harbor"] };
		{ INDENT..INDENT..GREY..L["Defeat the Horde in the harbor."] };
		{ BLUE.." C) "..L["The heart of ruined Theramore"] };
		{ INDENT..YELL.."- "..L["Stage 3"]..ALC["Hyphen"]..L["Into the Ruins"] };
		{ INDENT..INDENT..GREY..L["Fight past the enemy into the heart of ruined Theramore."] };
		{ BLUE.." D) "..L["Jaina"] };
		{ INDENT..YELL.."- "..L["Stage 4"]..ALC["Hyphen"]..L["The Lady Proudmoore"] };
		{ INDENT..INDENT..GREY..L["Locate Jaina in the Mana Bomb crater."] };
		{ BLUE.." E) "..L["West Gate"] };
		{ INDENT..YELL.."- "..L["Stage 5"]..ALC["Hyphen"]..L["Destroy the Destroyer"] };
		{ INDENT..INDENT..GREY..L["Destroy the siege engine at the west gate and recover the stolen standards."] };
		{ BLUE.." D) "..L["Jaina"] };
		{ INDENT..YELL.."- "..L["Final Stage"]..ALC["Hyphen"]..L["The Last Stand"] };
		{ INDENT..INDENT..GREY..L["Protect Jaina while she attunes to the Focusing Iris."] };
	};
	SC_TheramoresFallHorde = {
		ZoneName = { BZ["Theramore's Fall"]..ALC["Hyphen"]..FACTION_HORDE };
		Location = { BZ["Theramore"]..ALC["Comma"]..BZ["Dustwallow Marsh"] };
		LevelRange = "90";
		MinLevel = "90";
		PlayerLimit = "3";
		{ BLUE.." A) "..ALC["Start"] };
		{ BLUE.." B) "..L["Alliance Ships"] };
		{ INDENT..YELL.."- "..L["Stage 1"]..ALC["Hyphen"]..L["To the Waterline!"] };
		{ INDENT..INDENT..GREY..L["Slay Alliance captains and rig powder barrels on all ships."] };
		{ GREN.." C) "..L["The Blastmaster"] };
		{ INDENT..YELL.."- "..L["Stage 2"]..ALC["Hyphen"]..L["The Blastmaster"] };
		{ INDENT..INDENT..GREY..L["Inform Blastmaster Sparkfuse of your success."] };
		{ BLUE.." D) "..L["Baldruc and Gryphon"] };
		{ INDENT..YELL.."- "..L["Stage 3"]..ALC["Hyphen"]..L["Gryphon, Down"] };
		{ INDENT..INDENT..GREY..L["Slay Baldruc and his gryphons."] };
		{ BLUE.." E) "..L["Tanks"] };
		{ INDENT..YELL.."- "..L["Stage 4"]..ALC["Hyphen"]..L["Tanks for Nothing!"] };
		{ INDENT..INDENT..GREY..L["Destroy Big Bessa and sabotage any unmanned tanks."] };
		{ BLUE.." F) "..L["Thalen Songweaver"] };
		{ INDENT..YELL.."- "..L["Stage 5"]..ALC["Hyphen"]..L["Fly, Spy!"] };
		{ INDENT..INDENT..GREY..L["Slay Hedric Evencane and free Thalen Songweaver from Foothold Citadel."] };
	};
	SC_TrovesoftheThunderKing = {
		ZoneName = { BZ["Troves of the Thunder King"] };
		Location = { BZ["Thunder King's Citadel"]..ALC["Comma"]..BZ["Isle of Thunder"] };
		LevelRange = "90";
		MinLevel = "90";
		PlayerLimit = "1";
		{ ORNG..ALC["Key"]..ALC["Colon"]..ALIL["Key to the Palace of Lei Shen"] };
		{ ORNG..ALC["Key"]..ALC["Colon"]..ALIL["Burial Trove Key"] };
		{ BLUE.." A) "..ALC["Start"] };
		{ INDENT..YELL.."- "..L["Stage 1"]..ALC["Hyphen"]..L["Speak to Taoshi"] };
		{ INDENT..INDENT..GREY..L["You will only have a limited amount of time to gather as much treasure as you can.  Speak to Taoshi when you're ready to begin."] };
		{ INDENT..YELL.."- "..L["Final Stage"]..ALC["Hyphen"]..L["Reach the Exit"] };
		{ INDENT..INDENT..GREY..L["Grab as much treasure as you can and reach the exit before the timer expires."] };
		{ INDENT..INDENT..WHIT.." 1) "..L["God-Hulk Gulkan"] };
		{ INDENT..INDENT..GREN.." 1') "..L["Lever"] };
		{ INDENT..INDENT..GREN.." 2') "..L["Tenwu of the Red Smoke"] };
	};
	SC_UngaIngoo = {
		ZoneName = { BZ["Unga Ingoo"] };
		Location = { BZ["Unga Ingoo"]..ALC["Comma"]..BZ["Krasarang Wilds"] };
		LevelRange = "90";
		MinLevel = "90";
		PlayerLimit = "3";
		{ BLUE.." A) "..ALC["Start"] };
		{ INDENT..YELL.."- "..L["Stage 1"]..ALC["Hyphen"]..L["Escort Brewmaster Bo"] };
		{ INDENT..INDENT..GREY..L["Bring Brewmaster Bo to the Unga Ingoo Brewing Cauldron."] };
		{ BLUE.." B) "..L["Brewing Cauldron"]..ALC["Slash"]..ALC["End"] };
		{ INDENT..YELL.."- "..L["Stage 2"]..ALC["Hyphen"]..L["Fill the Brewing Cauldron"] };
		{ INDENT..INDENT..GREY..L["Bring 200 Unga Jungle Brew to the Brewing Cauldron."] };
		{ INDENT..YELL.."- "..L["Final Stage"]..ALC["Hyphen"]..L["Defeat Captain Ook"] };
		{ INDENT..INDENT..GREY..L["Defeat Captain Ook."] };
	};
	SC_BrokenShore = {
		ZoneName = { BZ["The Battle for Broken Shore"] };
		Location = { BZ["Broken Isles"] };
		LevelRange = "100";
		MinLevel = "100";
		{ YELL.."- "..L["Stage 1"]..ALC["Hyphen"]..L["The Broken Shore"] };
		{ INDENT..GREY..L["Travel to the Broken Shore."] };
		{ INDENT..BLUE.." A) "..L["Alliance Ships"] };
		{ INDENT..BLUE.." B) "..L["Horde Ships"] };
		{ BLUE.." C) "..L["Beach"] };
		{ INDENT..YELL.."- "..L["Stage 2"]..ALC["Hyphen"]..L["Storm The Beach"] };
		{ INDENT..INDENT..GREY..L["Destroy all demons and structures on the beach."] };
		{ INDENT..INDENT..INDENT..GREY..L["33 Deamons slain"] };
		{ INDENT..INDENT..INDENT..GREY..L["3 Lords slain"] };
		{ INDENT..INDENT..INDENT..GREY..L["3 Spires of Woe destroyed"] };
		{ INDENT..YELL.."- "..L["Stage 3"]..ALC["Hyphen"]..L["Defeat the Commander"] };
		{ INDENT..INDENT..GREY..L["Slay Dread Commander Arganoth."]..ALC["Slash"] };
		{ INDENT..INDENT..GREY..L["Slay Fel Commander Azgalor."] };
		{ YELL.."- "..L["Stage 4"]..ALC["Hyphen"]..L["Find Varian"]..ALC["Slash"]..L["Find The Others"] };
		{ INDENT..GREY..L["Locate King Varian Wrynn."]..ALC["Slash"] };
		{ INDENT..GREY..L["Locate Sylvanas and Baine."] };
		{ INDENT..GREN.." 1) "..L["King Varian Wrynn"] };
		{ INDENT..GREN.." 2) "..L["Sylvanas and Baine"] };
		{ YELL.."- "..L["Stage 5"]..ALC["Hyphen"]..L["Destroy the Portal"] };
		{ INDENT..GREY..L["Destroy the demon portal to stop reinforcements."] };
		{ INDENT..BLUE.." D) "..L["Portal"] };
		{ YELL.."- "..L["Stage 6"]..ALC["Hyphen"]..L["Raze the Black City"] };
		{ INDENT..GREY..L["Assault the demon city."] };
		{ INDENT..BLUE.." E) "..BZ["The Black City"] };
		{ BLUE.." F) "..BZ["Tomb Approach"] };
		{ INDENT..YELL.."- "..L["Stage 7"]..ALC["Hyphen"]..L["The Highlord"] };
		{ INDENT..INDENT..GREY..L["Get to Tirion."] };
		{ INDENT..INDENT..GREN.." 3) "..L["Highlord Tirion Fordring"] };
		{ INDENT..YELL.."- "..L["Stage 8"]..ALC["Hyphen"]..L["Krosus"] };
		{ INDENT..INDENT..GREY..L["Kill Krosus."] };
		{ INDENT..INDENT.._RED.." 1) "..L["Krosus"] };
		{ YELL.."- "..L["Final Stage"]..ALC["Hyphen"]..L["Stop Gul'dan"]..ALC["Slash"]..L["Hold The Ridge"] };
		{ INDENT..GREY..L["Stop Gul'dan from summoning the Legion."]..ALC["Slash"] };
		{ INDENT..GREY..L["Hold the ridge until the Alliance have stopped Gul'dan."] };
		{ INDENT..BLUE.." G) "..L["Alliance's final stop"] };
		{ INDENT..BLUE.." H) "..L["Horde's final stop"] };
		{ INDENT.._RED.." 2) "..L["Gul'dan"] };
	};
	SC_Demon_Invasion = {
		ZoneName = { L["Demon Invasion"] };
		Location = { BZ["Eastern Kingdoms"]..ALC["Slash"]..BZ["Kalimdor"] };
		{ ORNG..L["Demon Invasion"] };
		{ "" };
		{ _RED..ACHIEVEMENTS..ALC["Colon"] };
		{ GREN..Atlas_GetAchievementName(11200, "Stand Against the Legion") };
		{ INDENT..GREY..Atlas_GetAchievementDesc(11200, "Defend against the Burning Legion by completing an invasion during the Legion pre-launch events.") };
		{ GREN..Atlas_GetAchievementName(11201, "Defender of Azeroth: Legion Invasions") };
		{ INDENT..GREY..Atlas_GetAchievementDesc(11201, "Defend against each of the Legion's assaults on Azeroth during the Legion pre-launch events.") };
		{ "" };
		{ WHIT.." 1) "..BZ["Azshara"] };
		{ YELL..BZ["Invasion: Azshara"] };
		{ INDENT..YELL..L["Stage 1"]..ALC["Hyphen"]..L["Defend the Rear Gate"] };
		{ INDENT..INDENT..GREY..L["Defend against the Legion threat at the Orgrimmar Rear Gate."] };
		{ INDENT..YELL..L["Stage 2"]..ALC["Hyphen"]..L["Defeat the Demon Commander"] };
		{ INDENT..INDENT..GREY..L["Defeat the Legion Commander threatening Orgrimmar Rear Gate."] };
		{ INDENT..YELL..L["Stage 3"]..ALC["Hyphen"]..L["Repel the Legion Forces"] };
		{ INDENT..INDENT..GREY..L["Repel the Legion's forces throughout Azshara."] };
		{ INDENT..YELL..L["Stage 4"]..ALC["Hyphen"]..L["Defeat the Demon Lord"] };
		{ INDENT..INDENT..GREY..L["Defeat the demon lord commanding the invasion at the Orgrimmar Rear Gate."] };
		{ "" };
		{ WHIT.." 2) "..BZ["Northern Barrens"] };
		{ YELL..BZ["Invasion: Northern Barrens"] };
		{ INDENT..YELL..L["Stage 1"]..ALC["Hyphen"]..L["Defend the Crossroads"] };
		{ INDENT..INDENT..GREY..L["Defend against the Legion threat at the Crossroads."] };
		{ INDENT..YELL..L["Stage 2"]..ALC["Hyphen"]..L["Defeat the Demon Commander"] };
		{ INDENT..INDENT..GREY..L["Defeat the Legion Commander threatening the Crossroads."] };
		{ INDENT..YELL..L["Stage 3"]..ALC["Hyphen"]..L["Repel the Legion Forces"] };
		{ INDENT..INDENT..GREY..L["Repel the Legion's forces throughout Northern Barrens."] };
		{ INDENT..YELL..L["Stage 4"]..ALC["Hyphen"]..L["Defeat the Demon Lord"] };
		{ INDENT..INDENT..GREY..L["Defeat the demon lord commanding the invasion at the Crossroads."] };
		{ "" };
		{ WHIT.." 3) "..BZ["Tanaris"] };
		{ YELL..BZ["Invasion: Tanaris"] };
		{ INDENT..YELL..L["Stage 1"]..ALC["Hyphen"]..L["Defend Gadgetzan"] };
		{ INDENT..INDENT..GREY..L["Defend against the Legion threat at Gadgetzan."] };
		{ INDENT..YELL..L["Stage 2"]..ALC["Hyphen"]..L["Defeat the Demon Commanders"] };
		{ INDENT..INDENT..GREY..L["Defeat the Legion Commanders threatening Gadgetzan."] };
		{ INDENT..YELL..L["Stage 3"]..ALC["Hyphen"]..L["Repel the Legion Forces"] };
		{ INDENT..INDENT..GREY..L["Repel the Legion's forces throughout Tanaris."] };
		{ INDENT..YELL..L["Stage 4"]..ALC["Hyphen"]..L["Defeat the Demon Lord"] };
		{ INDENT..INDENT..GREY..L["Defeat the demon lord commanding the invasion at Gadgetzan."] };
		{ "" };
		{ WHIT.." 4) "..BZ["Hillsbrad Foothills"] };
		{ YELL..BZ["Invasion: Hillsbrad Foothills"] };
		{ INDENT..YELL..L["Stage 1"]..ALC["Hyphen"]..L["Defend Tarren Mill"] };
		{ INDENT..INDENT..GREY..L["Defend against the Legion threat at Tarren Mill."] };
		{ INDENT..YELL..L["Stage 2"]..ALC["Hyphen"]..L["Defeat the Demon Commander"] };
		{ INDENT..INDENT..GREY..L["Defeat the Legion Commander threatening Tarren Mill."] };
		{ INDENT..YELL..L["Stage 3"]..ALC["Hyphen"]..L["Repel the Legion Forces"] };
		{ INDENT..INDENT..GREY..L["Repel the Legion's forces throughout Hillsbrad Foothills."] };
		{ INDENT..YELL..L["Stage 4"]..ALC["Hyphen"]..L["Defeat the Demon Lord"] };
		{ INDENT..INDENT..GREY..L["Defeat the demon lord commanding the invasion at Tarren Mill."] };
		{ "" };
		{ WHIT.." 5) "..BZ["Dun Morogh"] };
		{ YELL..BZ["Invasion: Dun Morogh"] };
		{ INDENT..YELL..L["Stage 1"]..ALC["Hyphen"]..L["Defend Kharanos"] };
		{ INDENT..INDENT..GREY..L["Defend against the Legion threat at Kharanos."] };
		{ INDENT..YELL..L["Stage 2"]..ALC["Hyphen"]..L["Defeat the Demon Commander"] };
		{ INDENT..INDENT..GREY..L["Defeat the Legion Commander threatening Kharanos."] };
		{ INDENT..YELL..L["Stage 3"]..ALC["Hyphen"]..L["Repel the Legion Forces"] };
		{ INDENT..INDENT..GREY..L["Repel the Legion's forces throughout Dun Morogh."] };
		{ INDENT..YELL..L["Stage 4"]..ALC["Hyphen"]..L["Defeat the Demon Lord"] };
		{ INDENT..INDENT..GREY..L["Defeat the demon lord commanding the invasion at Kharanos."] };
		{ "" };
		{ WHIT.." 6) "..BZ["Westfall"] };
		{ YELL..BZ["Invasion: Westfall"] };
		{ INDENT..YELL..L["Stage 1"]..ALC["Hyphen"]..L["Defend Sentinel Hill"] };
		{ INDENT..INDENT..GREY..L["Defend against the Legion threat at the Sentinel Hill."] };
		{ INDENT..YELL..L["Stage 2"]..ALC["Hyphen"]..L["Defeat the Demon Commander"] };
		{ INDENT..INDENT..GREY..L["Defeat the Legion Commander threatening Sentinel Hill."] };
		{ INDENT..YELL..L["Stage 3"]..ALC["Hyphen"]..L["Repel the Legion Forces"] };
		{ INDENT..INDENT..GREY..L["Repel the Legion's forces throughout Westfall."] };
		{ INDENT..YELL..L["Stage 4"]..ALC["Hyphen"]..L["Defeat the Demon Lord"] };
		{ INDENT..INDENT..GREY..L["Defeat the Demon Lord commanding the invasion."] };
	};
};

Atlas_RegisterPlugin("Atlas_Scenarios", myCategory, myData);
