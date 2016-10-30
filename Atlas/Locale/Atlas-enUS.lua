-- $Id: Atlas-enUS.lua 112 2016-10-27 14:30:34Z arith $
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
local L = AceLocale:NewLocale("Atlas", "enUS", true, true);
-- Localize file must set above to false, for example:
--    local AL = AceLocale:NewLocale("Atlas", "deDE", false);

-- Atlas English Localization
--if ( GetLocale() ==	"enUS" ) then
-- Define the leading strings to be ignored while sorting
-- Ex: The Stockade
AtlasSortIgnore = {"the (.+)"};

-- Syntax: ["real_zone_name"] = "localized map zone name"
AtlasZoneSubstitutions = {
	["Ahn'Qiraj"] = "Temple of Ahn'Qiraj";
	["The Temple of Atal'Hakkar"] = "Sunken Temple";
--	["Throne of Tides"] = "The Abyssal Maw: Throne of the Tides";
};
--end


if L then
L["Adult"] = "Adult"
L["AKA"] = "AKA"
L["Alexston Chrome <Tavern of Time>"] = "Alexston Chrome <Tavern of Time>"
L["Alurmi <Keepers of Time Quartermaster>"] = "Alurmi <Keepers of Time Quartermaster>"
L["Anachronos <Keepers of Time>"] = "Anachronos <Keepers of Time>"
L["Andormu <Keepers of Time>"] = "Andormu <Keepers of Time>"
L["Arazmodu <The Scale of Sands>"] = "Arazmodu <The Scale of Sands>"
L["Arcane Container"] = "Arcane Container"
L["Arms Warrior"] = "Arms Warrior"
L["ATLAS_BUTTON_CLOSE"] = "Close"
L["ATLAS_CLICK_TO_OPEN"] = "Click to open Atlas map window."
L["ATLAS_COLLAPSE_BUTTON"] = "Click to close Atlas' legend panel."
L["ATLAS_DDL_CONTINENT"] = "Continent"
L["ATLAS_DDL_CONTINENT_BROKENISLES"] = "Broken Isles Instances"
L["ATLAS_DDL_CONTINENT_DEEPHOLM"] = "Deepholm Instances"
L["ATLAS_DDL_CONTINENT_DRAENOR"] = "Draenor Instances"
L["ATLAS_DDL_CONTINENT_EASTERN"] = "Eastern Kingdoms Instances"
L["ATLAS_DDL_CONTINENT_KALIMDOR"] = "Kalimdor Instances"
L["ATLAS_DDL_CONTINENT_NORTHREND"] = "Northrend Instances"
L["ATLAS_DDL_CONTINENT_OUTLAND"] = "Outland Instances"
L["ATLAS_DDL_CONTINENT_PANDARIA"] = "Pandaria Instances"
L["ATLAS_DDL_EXPANSION"] = "Expansion"
L["ATLAS_DDL_EXPANSION_BC"] = "Burning Crusade Instances"
L["ATLAS_DDL_EXPANSION_CATA"] = "Cataclysm Instances"
L["ATLAS_DDL_EXPANSION_LEGION"] = "Legion Instances"
L["ATLAS_DDL_EXPANSION_MOP"] = "Mists of Pandaria Instances"
L["ATLAS_DDL_EXPANSION_OLD_AO"] = "Old World Instances A-O"
L["ATLAS_DDL_EXPANSION_OLD_PZ"] = "Old World Instances P-Z"
L["ATLAS_DDL_EXPANSION_WOD"] = "Warlords of Draenor Instances"
L["ATLAS_DDL_EXPANSION_WOTLK"] = "Wrath of the Lich King Instances"
L["ATLAS_DDL_LEVEL"] = "Level"
L["ATLAS_DDL_LEVEL_100PLUS"] = "Instances Level 100+"
L["ATLAS_DDL_LEVEL_100TO110"] = "Instances Level 100-110"
L["ATLAS_DDL_LEVEL_110PLUS"] = "Instances Level 110+"
L["ATLAS_DDL_LEVEL_45TO60"] = "Instances Level 45-60"
L["ATLAS_DDL_LEVEL_60TO70"] = "Instances Level 60-70"
L["ATLAS_DDL_LEVEL_70TO80"] = "Instances Level 70-80"
L["ATLAS_DDL_LEVEL_80TO85"] = "Instances Level 80-85"
L["ATLAS_DDL_LEVEL_85TO90"] = "Instances Level 85-90"
L["ATLAS_DDL_LEVEL_90TO100"] = "Instances Level 90-100"
L["ATLAS_DDL_LEVEL_UNDER45"] = "Instances Under Level 45"
L["ATLAS_DDL_PARTYSIZE"] = "Party Size"
L["ATLAS_DDL_PARTYSIZE_10_AN"] = "Instances for 10 Players A-N"
L["ATLAS_DDL_PARTYSIZE_10_OZ"] = "Instances for 10 Players O-Z"
L["ATLAS_DDL_PARTYSIZE_20TO40AH"] = "Instances for 20-40 Players A-H"
L["ATLAS_DDL_PARTYSIZE_20TO40IZ"] = "Instances for 20-40 Players I-Z"
L["ATLAS_DDL_PARTYSIZE_5_AE"] = "Instances for 5 Players A-E"
L["ATLAS_DDL_PARTYSIZE_5_FS"] = "Instances for 5 Players F-S"
L["ATLAS_DDL_PARTYSIZE_5_TZ"] = "Instances for 5 Players T-Z"
L["ATLAS_DDL_TYPE"] = "Type"
L["ATLAS_DDL_TYPE_ENTRANCE"] = "Entrances"
L["ATLAS_DDL_TYPE_INSTANCE_AB"] = "Instances A-B"
L["ATLAS_DDL_TYPE_INSTANCE_CF"] = "Instances C-F"
L["ATLAS_DDL_TYPE_INSTANCE_GM"] = "Instances G-M"
L["ATLAS_DDL_TYPE_INSTANCE_NS"] = "Instances N-S"
L["ATLAS_DDL_TYPE_INSTANCE_TZ"] = "Instances T-Z"
L["ATLAS_DEP_MSG1"] = "Atlas has detected outdated module(s)."
L["ATLAS_DEP_MSG2"] = "They have been disabled for this character."
L["ATLAS_DEP_MSG3"] = "Delete them from your AddOns folder."
L["ATLAS_DEP_OK"] = "Ok"
L["ATLAS_ENTRANCE_BUTTON"] = "Entrance"
L["ATLAS_EXPAND_BUTTON"] = "Click to open Atlas' legend panel."
L["ATLAS_INFO"] = "Atlas Information"
L["ATLAS_INFO_12200"] = [=[Important Notice:

Due to the concern of increasing addon file size, we have moved out 
part of our dungeon maps and built-in plug-ins into separated addon package.

Users who download our addons from some of the famous game web sites 
may only get our core addon which only include the Atlas core function 
and the latest WoW expansion maps.

If you also want to see all the old expansions' maps, and also want all those 
Atlas plug-ins made by us, you have to download and install them separately.

Read below forum topic for more information:
|cff6666ffhttp://www.atlasmod.com/phpBB3/viewtopic.php?t=1522|cffffffff

Or visit our website to see where to download:
|cff6666ffhttp://www.atlasmod.com/|cffffffff]=]
L["ATLAS_INFO_12201"] = [=[Please be advised that we have created a new plug-in - |cff6666ffAtlas Scenarios|cffffffff, to 
provide the brand-new Scenarios maps introduced in WoW 5.0. 

Check out our web site for more details, and don't forget to download / 
install it separately.
|cff6666ffhttp://www.atlasmod.com/|cffffffff]=]
L["ATLAS_INSTANCE_BUTTON"] = "Instance"
L["ATLAS_LDB_HINT"] = [=[Left-Click to open Atlas.
Right-Click for Atlas options.]=]
L["ATLAS_MINIMAPLDB_HINT"] = [=[Left-Click to open Atlas.
Right-Click for Atlas options.
Left-click and drag to move this button.]=]
L["ATLAS_MISSING_MODULE"] = [=[Atlas has detected some missing module(s) / plugin(s). 

It could be you had outdated module(s) / plugin(s) which had been disabled by Atlas. 
If you have now installed all latest ones, go to your addon list to see if all of them have been enabled. 

If you are sure that you don't need those "missing" module(s) / plugin(s) and do not want to see this message again, you can go to option panel to disable the notification. 

List of missing module(s) / plugin(s): 
]=]
L["ATLAS_OPEN_ADDON_LIST"] = "Open addon list"
L["ATLAS_OPEN_ADVENTURE"] = "Click to open Adventure Journal window."
L["ATLAS_OPEN_WOWMAP_WINDOW"] = "Click to open Adventure Journal Map window."
L["ATLAS_OPTIONS_ACRONYMS"] = "Display Acronyms"
L["ATLAS_OPTIONS_ACRONYMS_TIP"] = "Display the instance's acronym in the map details."
L["ATLAS_OPTIONS_AUTOSEL"] = "Auto-Select Instance Map"
L["ATLAS_OPTIONS_AUTOSEL_TIP"] = "Auto-select instance map, Atlas will detect your location to choose the best instance map for you."
L["ATLAS_OPTIONS_BOSS_DESC"] = "Show boss description when available"
L["ATLAS_OPTIONS_BOSS_DESC_SCALE"] = "Boss Description Map ToolTip Scale"
L["ATLAS_OPTIONS_BOSS_DESC_TIP"] = "When mouse hover the boss number, display the boss description when relative information is available."
L["ATLAS_OPTIONS_BUTPOS"] = "Button Position"
L["ATLAS_OPTIONS_BUTRAD"] = "Button Radius"
L["ATLAS_OPTIONS_BUTTON"] = "Options"
L["ATLAS_OPTIONS_CATDD"] = "Sort Instance Maps by:"
L["ATLAS_OPTIONS_CHECKMODULE"] = "Remind me for missing module(s) / plug-in(s)."
L["ATLAS_OPTIONS_CHECKMODULE_TIP"] = "Enable to perform checking if any missing Atlas module / plug-in after WoW loaded."
L["ATLAS_OPTIONS_CLAMPED"] = "Clamp window to screen"
L["ATLAS_OPTIONS_CLAMPED_TIP"] = "Clamp Atlas window to screen, disable to allow Atlas window can be dragged outside the game screen."
L["ATLAS_OPTIONS_COLORINGDROPDOWN"] = "Show dungeon dropdown in colors"
L["ATLAS_OPTIONS_COLORINGDROPDOWN_TIP"] = "Based on the dungeon's recommended minimul level and player's level, to show the dungeon with difficulty colors."
L["ATLAS_OPTIONS_CTRL"] = "Hold down Control for tooltips"
L["ATLAS_OPTIONS_CTRL_TIP"] = "Enable to show tooltips text while hold down control key and mouse over the map info. Useful when the text is too long to be displayed in the window."
L["ATLAS_OPTIONS_DONTSHOWAGAIN"] = "Don't show the same information again."
L["ATLAS_OPTIONS_LOCK"] = "Lock Atlas window"
L["ATLAS_OPTIONS_LOCK_TIP"] = "Toggle lock / unlock of Atlas window."
L["ATLAS_OPTIONS_RCLICK"] = "Right-Click for World Map"
L["ATLAS_OPTIONS_RCLICK_TIP"] = "Enable the Right-Click in Atlas window to switch to WoW World Map."
L["ATLAS_OPTIONS_RESETPOS"] = "Reset Position"
L["ATLAS_OPTIONS_SCALE"] = "Atlas Frame Scale"
L["ATLAS_OPTIONS_SHOWBUT"] = "Show Button on Minimap"
L["ATLAS_OPTIONS_SHOWBUT_TIP"] = "Show Atlas button around the minimap."
L["ATLAS_OPTIONS_TRANS"] = "Transparency"
L["ATLAS_SEARCH_UNAVAIL"] = "Search Unavailable"
L["ATLAS_SLASH"] = "/atlas"
L["ATLAS_SLASH_OPTIONS"] = "options"
L["ATLAS_STRING_CLEAR"] = "Clear"
L["ATLAS_STRING_LEVELRANGE"] = "Level Range"
L["ATLAS_STRING_LOCATION"] = "Location"
L["ATLAS_STRING_MINGEARLEVEL"] = "Minimum Gear Level"
L["ATLAS_STRING_MINLEVEL"] = "Minimum Level"
L["ATLAS_STRING_PLAYERLIMIT"] = "Player Limit"
L["ATLAS_STRING_RECLEVELRANGE"] = "Recommended Level"
L["ATLAS_STRING_SEARCH"] = "Search"
L["ATLAS_STRING_SELECT_CAT"] = "Select Category"
L["ATLAS_STRING_SELECT_MAP"] = "Select Map"
L["ATLAS_TITLE"] = "Atlas"
L["Attunement Required"] = "Attunement Required"
L["Back"] = "Back"
L["Basement"] = "Basement"
L["BINDING_HEADER_ATLAS_TITLE"] = "Atlas Bindings"
L["BINDING_NAME_ATLAS_AUTOSEL"] = "Auto-Select"
L["BINDING_NAME_ATLAS_OPTIONS"] = "Toggle Options"
L["BINDING_NAME_ATLAS_TOGGLE"] = "Toggle Atlas"
L["Blacksmithing Plans"] = "Blacksmithing Plans"
L["Bodley"] = "Bodley"
L["Bortega <Reagents & Poison Supplies>"] = "Bortega <Reagents & Poison Supplies>"
L["Brewfest"] = "Brewfest"
L["Child"] = "Child"
L["Colon"] = ": "
L["Comma"] = ", "
L["Connection"] = "Connection"
L["East"] = "East"
L["Elevator"] = "Elevator"
L["End"] = "End"
L["Engineer"] = "Engineer"
L["Entrance"] = "Entrance"
L["Event"] = "Event"
L["Exalted"] = "Exalted"
L["Exit"] = "Exit"
L["Fourth Stop"] = "Fourth Stop"
L["Front"] = "Front"
L["Galgrom <Provisioner>"] = "Galgrom <Provisioner>"
L["Ghost"] = "Ghost"
L["Graveyard"] = "Graveyard"
L["Hallow's End"] = "Hallow's End"
L["Heroic"] = "Heroic"
L["Heroic_Symbol"] = "(H)"
L["Holy Paladin"] = "Holy Paladin"
L["Holy Priest"] = "Holy Priest"
L["Hyphen"] = " - "
L["Imp"] = "Imp"
L["Key"] = "Key"
L["L-DQuote"] = "\""
L["Lothos Riftwaker"] = "Lothos Riftwaker"
L["Love is in the Air"] = "Love is in the Air"
L["Lower"] = "Lower"
L["L-Parenthesis"] = " ("
L["L-SBracket"] = "["
L["Lunar Festival"] = "Lunar Festival"
L["MapA"] = " [A]"
L["MapB"] = " [B]"
L["MapC"] = " [C]"
L["MapD"] = " [D]"
L["MapE"] = " [E]"
L["MapF"] = " [F]"
L["MapG"] = " [G]"
L["MapH"] = " [H]"
L["MapI"] = " [I]"
L["MapJ"] = " [J]"
L["MapsNotFound"] = [=[Current selected dungeon does not have a 
corresponding map image associated with. 

Please make sure you have installed 
the corresponding Atlas map module(s).]=]
L["Meeting Stone"] = "Meeting Stone"
L["Middle"] = "Middle"
L["Midsummer Festival"] = "Midsummer Festival"
L["Moonwell"] = "Moonwell"
L["Mythic"] = "Mythic"
L["Mythic_Symbol"] = "(M)"
L["North"] = "North"
L["Nozari <Keepers of Time>"] = "Nozari <Keepers of Time>"
L["Optional"] = "Optional"
L["Orange"] = "Orange"
L["Orb of Command"] = "Orb of Command"
L["Outside"] = "Outside"
L["Period"] = ". "
L["Portal"] = "Portal"
L["PossibleMissingModule"] = "It is likely this map is from this module: "
L["Protection Warrior"] = "Protection Warrior"
L["Purple"] = "Purple"
L["Random"] = "Random"
L["Rare"] = "Rare"
L["R-DQuote"] = "\""
L["Repair"] = "Repair"
L["Retribution Paladin"] = "Retribution Paladin"
L["Rewards"] = "Rewards"
L["R-Parenthesis"] = ") "
L["R-SBracket"] = "]"
L["Scarshield Quartermaster <Scarshield Legion>"] = "Scarshield Quartermaster <Scarshield Legion>"
L["Second Stop"] = "Second Stop"
L["Semicolon"] = "; "
L["Shadow Priest"] = "Shadow Priest"
L["Slash"] = " / "
L["Soridormi <The Scale of Sands>"] = "Soridormi <The Scale of Sands>"
L["South"] = "South"
L["Spawn Point"] = "Spawn Point"
L["Start"] = "Start"
L["Steward of Time <Keepers of Time>"] = "Steward of Time <Keepers of Time>"
L["Summon"] = "Summon"
L["Teleporter"] = "Teleporter"
L["Teleporter destination"] = "Teleporter destination"
L["The Behemoth"] = "The Behemoth"
L["Third Stop"] = "Third Stop"
L["Top"] = "Top"
L["Transport"] = "Transport"
L["Tunnel"] = "Tunnel"
L["Underwater"] = "Underwater"
L["Upper"] = "Upper"
L["Varies"] = "Varies"
L["Wanders"] = "Wanders"
L["Wave 10"] = "Wave 10"
L["Wave 12"] = "Wave 12"
L["Wave 18"] = "Wave 18"
L["Wave 5"] = "Wave 5"
L["Wave 6"] = "Wave 6"
L["West"] = "West"
L["Yarley <Armorer>"] = "Yarley <Armorer>"
L["Zaladormu"] = "Zaladormu"
L["ToC/Description"] = "Instance Map Browser"
L["ToC/Title"] = "Atlas"

--************************************************
-- UI terms and common strings
--************************************************
	L["ATLAS_TITLE"] = "Atlas";

	L["BINDING_HEADER_ATLAS_TITLE"] = "Atlas Bindings";
	L["BINDING_NAME_ATLAS_TOGGLE"] = "Toggle Atlas";
	L["BINDING_NAME_ATLAS_OPTIONS"] = "Toggle Options";
	L["BINDING_NAME_ATLAS_AUTOSEL"] = "Auto-Select";

	L["ATLAS_SLASH"] = "/atlas";
	L["ATLAS_SLASH_OPTIONS"] = "options";

	L["ATLAS_STRING_LOCATION"] = "Location";
	L["ATLAS_STRING_LEVELRANGE"] = "Level Range"; 
	L["ATLAS_STRING_RECLEVELRANGE"] = "Recommended Level";
	L["ATLAS_STRING_PLAYERLIMIT"] = "Player Limit";
	L["ATLAS_STRING_SELECT_CAT"] = "Select Category";
	L["ATLAS_STRING_SELECT_MAP"] = "Select Map";
	L["ATLAS_STRING_SEARCH"] = "Search";
	L["ATLAS_STRING_CLEAR"] = "Clear";
	L["ATLAS_STRING_MINLEVEL"] = "Minimum Level";
	L["ATLAS_STRING_MINGEARLEVEL"] = "Minimum Gear Level";

	L["ATLAS_OPTIONS_BUTTON"] = "Options";
	L["ATLAS_OPTIONS_SHOWBUT"] = "Show Button on Minimap";
	L["ATLAS_OPTIONS_SHOWBUT_TIP"] = "Show Atlas button around the minimap.";
	L["ATLAS_OPTIONS_AUTOSEL"] = "Auto-Select Instance Map";
	L["ATLAS_OPTIONS_AUTOSEL_TIP"] = "Auto-select instance map, Atlas will detect your location to choose the best instance map for you.";
	L["ATLAS_OPTIONS_BUTPOS"] = "Button Position";
	L["ATLAS_OPTIONS_LOCK"] = "Lock Atlas window";
	L["ATLAS_OPTIONS_LOCK_TIP"] = "Toggle lock / unlock of Atlas window.";
	L["ATLAS_OPTIONS_TRANS"] = "Transparency";
	L["ATLAS_OPTIONS_RCLICK"] = "Right-Click for World Map";
	L["ATLAS_OPTIONS_RCLICK_TIP"] = "Enable the Right-Click in Atlas window to switch to WoW World Map.";
	L["ATLAS_OPTIONS_RESETPOS"] = "Reset Position";
	L["ATLAS_OPTIONS_ACRONYMS"] = "Display Acronyms";
	L["ATLAS_OPTIONS_ACRONYMS_TIP"] = "Display the instance's acronym in the map details.";
	L["ATLAS_OPTIONS_SCALE"] = "Atlas Frame Scale";
	L["ATLAS_OPTIONS_BOSS_DESC"] = "Show boss description when available";
	L["ATLAS_OPTIONS_BOSS_DESC_TIP"] = "When mouse hover the boss number, display the boss description when relative information is available.";
	L["ATLAS_OPTIONS_BOSS_DESC_SCALE"] = "Boss Description Map ToolTip Scale";
	L["ATLAS_OPTIONS_BUTRAD"] = "Button Radius";
	L["ATLAS_OPTIONS_CLAMPED"] = "Clamp window to screen";
	L["ATLAS_OPTIONS_CLAMPED_TIP"] = "Clamp Atlas window to screen, disable to allow Atlas window can be dragged outside the game screen.";
	L["ATLAS_OPTIONS_CTRL"] = "Hold down Control for tooltips";
	L["ATLAS_OPTIONS_CTRL_TIP"] = "Enable to show tooltips text while hold down control key and mouse over the map info. Useful when the text is too long to be displayed in the window.";
	L["ATLAS_OPTIONS_DONTSHOWAGAIN"] = "Don't show the same information again.";
	L["ATLAS_OPTIONS_CHECKMODULE"] = "Remind me for missing module(s) / plug-in(s).";
	L["ATLAS_OPTIONS_CHECKMODULE_TIP"] = "Enable to perform checking if any missing Atlas module / plug-in after WoW loaded.";
	L["ATLAS_OPTIONS_COLORINGDROPDOWN"] = "Show dungeon dropdown in colors";
	L["ATLAS_OPTIONS_COLORINGDROPDOWN_TIP"] = "Based on the dungeon's recommended minimul level and player's level, to show the dungeon with difficulty colors.";

	L["ATLAS_BUTTON_CLOSE"] = "Close";
	L["ATLAS_LDB_HINT"] = "Left-Click to open Atlas.\nRight-Click for Atlas options.";
	L["ATLAS_MINIMAPLDB_HINT"] = "Left-Click to open Atlas.\nRight-Click for Atlas options.\nLeft-click and drag to move this button.";

	L["ATLAS_OPTIONS_CATDD"] = "Sort Instance Maps by:";
	L["ATLAS_DDL_CONTINENT"] = "Continent";	-- Sort Instance Maps by: Continent
	L["ATLAS_DDL_CONTINENT_EASTERN"] = "Eastern Kingdoms Instances";
	L["ATLAS_DDL_CONTINENT_KALIMDOR"] = "Kalimdor Instances";
	L["ATLAS_DDL_CONTINENT_OUTLAND"] = "Outland Instances";
	L["ATLAS_DDL_CONTINENT_NORTHREND"] = "Northrend Instances";
	L["ATLAS_DDL_CONTINENT_DEEPHOLM"] = "Deepholm Instances";
	L["ATLAS_DDL_CONTINENT_PANDARIA"] = "Pandaria Instances";
	L["ATLAS_DDL_CONTINENT_DRAENOR"] = "Draenor Instances";
	L["ATLAS_DDL_CONTINENT_BROKENISLES"] = "Broken Isles Instances";
	L["ATLAS_DDL_LEVEL"] = "Level";		-- Sort Instance Maps by: Level
	L["ATLAS_DDL_LEVEL_UNDER45"] = "Instances Under Level 45";
	L["ATLAS_DDL_LEVEL_45TO60"] = "Instances Level 45-60";
	L["ATLAS_DDL_LEVEL_60TO70"] = "Instances Level 60-70";
	L["ATLAS_DDL_LEVEL_70TO80"] = "Instances Level 70-80";
	L["ATLAS_DDL_LEVEL_80TO85"] = "Instances Level 80-85";
	L["ATLAS_DDL_LEVEL_85TO90"] = "Instances Level 85-90";
	L["ATLAS_DDL_LEVEL_90TO100"] = "Instances Level 90-100";
	L["ATLAS_DDL_LEVEL_100PLUS"] = "Instances Level 100+";
	L["ATLAS_DDL_LEVEL_100TO110"] = "Instances Level 100-110";
	L["ATLAS_DDL_LEVEL_110PLUS"] = "Instances Level 110+";
	L["ATLAS_DDL_PARTYSIZE"] = "Party Size";	-- Sort Instance Maps by: Party Size
	L["ATLAS_DDL_PARTYSIZE_5_AE"] = "Instances for 5 Players A-E";
	L["ATLAS_DDL_PARTYSIZE_5_FS"] = "Instances for 5 Players F-S";
	L["ATLAS_DDL_PARTYSIZE_5_TZ"] = "Instances for 5 Players T-Z";
	L["ATLAS_DDL_PARTYSIZE_10_AN"] = "Instances for 10 Players A-N";
	L["ATLAS_DDL_PARTYSIZE_10_OZ"] = "Instances for 10 Players O-Z";
	L["ATLAS_DDL_PARTYSIZE_20TO40AH"] = "Instances for 20-40 Players A-H";
	L["ATLAS_DDL_PARTYSIZE_20TO40IZ"] = "Instances for 20-40 Players I-Z";
	L["ATLAS_DDL_EXPANSION"] = "Expansion";	-- Sort Instance Maps by: Expansion
	L["ATLAS_DDL_EXPANSION_OLD_AO"] = "Old World Instances A-O";
	L["ATLAS_DDL_EXPANSION_OLD_PZ"] = "Old World Instances P-Z";
	L["ATLAS_DDL_EXPANSION_BC"] = "Burning Crusade Instances";
	L["ATLAS_DDL_EXPANSION_WOTLK"] = "Wrath of the Lich King Instances";
	L["ATLAS_DDL_EXPANSION_CATA"] = "Cataclysm Instances";
	L["ATLAS_DDL_EXPANSION_MOP"] = "Mists of Pandaria Instances";
	L["ATLAS_DDL_EXPANSION_WOD"] = "Warlords of Draenor Instances";
	L["ATLAS_DDL_EXPANSION_LEGION"] = "Legion Instances";
	L["ATLAS_DDL_TYPE"] = "Type";			-- -- Sort Instance Maps by: Map Type
	L["ATLAS_DDL_TYPE_INSTANCE_AB"] = "Instances A-B";
	L["ATLAS_DDL_TYPE_INSTANCE_CF"] = "Instances C-F";
	L["ATLAS_DDL_TYPE_INSTANCE_GM"] = "Instances G-M";
	L["ATLAS_DDL_TYPE_INSTANCE_NS"] = "Instances N-S";
	L["ATLAS_DDL_TYPE_INSTANCE_TZ"] = "Instances T-Z";
	L["ATLAS_DDL_TYPE_ENTRANCE"] = "Entrances";

	L["ATLAS_INSTANCE_BUTTON"] = "Instance";
	L["ATLAS_ENTRANCE_BUTTON"] = "Entrance";
	L["ATLAS_SEARCH_UNAVAIL"] = "Search Unavailable";

	L["ATLAS_DEP_MSG1"] = "Atlas has detected outdated module(s).";
	L["ATLAS_DEP_MSG2"] = "They have been disabled for this character.";
	L["ATLAS_DEP_MSG3"] = "Delete them from your AddOns folder.";
	L["ATLAS_DEP_OK"] = "Ok";

	L["ATLAS_INFO"] = "Atlas Information";
	L["ATLAS_INFO_12200"] = "Important Notice:\n\nDue to the concern of increasing addon file size, we have moved out \npart of our dungeon maps and built-in plug-ins into separated addon package.\n\nUsers who download our addons from some of the famous game web sites \nmay only get our core addon which only include the Atlas core function \nand the latest WoW expansion maps.\n\nIf you also want to see all the old expansions' maps, and also want all those \nAtlas plug-ins made by us, you have to download and install them separately.\n\nRead below forum topic for more information:\n|cff6666ffhttp://www.atlasmod.com/phpBB3/viewtopic.php?t=1522|cffffffff\n\nOr visit our website to see where to download:\n|cff6666ffhttp://www.atlasmod.com/|cffffffff";
	L["ATLAS_INFO_12201"] = "Please be advised that we have created a new plug-in - |cff6666ffAtlas Scenarios|cffffffff, to \nprovide the brand-new Scenarios maps introduced in WoW 5.0. \n\nCheck out our web site for more details, and don't forget to download / \ninstall it separately.\n|cff6666ffhttp://www.atlasmod.com/|cffffffff";

	L["ATLAS_MISSING_MODULE"] = "Atlas has detected some missing module(s) / plugin(s). \n\nIt could be you had outdated module(s) / plugin(s) which had been disabled by Atlas. \nIf you have now installed all latest ones, go to your addon list to see if all of them have been enabled. \n\nIf you are sure that you don't need those \"missing\" module(s) / plugin(s) and do not want to see this message again, you can go to option panel to disable the notification. \n\nList of missing module(s) / plugin(s): \n";
	L["ATLAS_OPEN_ADDON_LIST"] = "Open addon list";

	L["ATLAS_OPEN_ADVENTURE"] = "Click to open Adventure Journal window.";
	L["ATLAS_CLICK_TO_OPEN"] = "Click to open Atlas map window.";
	L["ATLAS_OPEN_WOWMAP_WINDOW"] = "Click to open Adventure Journal Map window.";
	L["ATLAS_COLLAPSE_BUTTON"] = "Click to close Atlas' legend panel.";
	L["ATLAS_EXPAND_BUTTON"] = "Click to open Atlas' legend panel.";

--************************************************
-- Zone Names, Acronyms, and Common Strings
--************************************************

	--Common strings
	L["East"] = "East";
	L["North"] = "North";
	L["South"] = "South";
	L["West"] = "West";

	--World Events, Festival
	L["Brewfest"] = "Brewfest";
	L["Hallow's End"] = "Hallow's End";
	L["Love is in the Air"] = "Love is in the Air";
	L["Lunar Festival"] = "Lunar Festival";
	L["Midsummer Festival"] = "Midsummer Festival";

	--Instance Difficulties
	L["Heroic_Symbol"] = "(H)";
	L["Mythic_Symbol"] = "(M)";
	--Misc strings
		--Symbols
		L["Colon"] = ": "; -- The colon symbol to be used in string, ex: "Zone: Firelands
		L["Semicolon"] = "; ";
		L["L-Parenthesis"] = " (";
		L["R-Parenthesis"] = ") ";
		L["Comma"] = ", ";
		L["Period"] = ". ";
		L["Hyphen"] = " - ";
		L["Slash"] = " / ";
		L["L-SBracket"] = "[";
		L["R-SBracket"] = "]";
		L["L-DQuote"] = "\"";
		L["R-DQuote"] = "\"";
	L["Adult"] = "Adult";
	L["AKA"] = "AKA"; -- As Known As
	L["Arcane Container"] = "Arcane Container";
	L["Arms Warrior"] = "Arms Warrior";
	L["Attunement Required"] = "Attunement Required";
	L["Back"] = "Back";
	L["Basement"] = "Basement";
	L["Blacksmithing Plans"] = "Blacksmithing Plans";
	L["Child"] = "Child";
	L["Connection"] = "Connection";
	L["Elevator"] = "Elevator";
	L["End"] = "End";
	L["Engineer"] = "Engineer";
	L["Entrance"] = "Entrance";
	L["Event"] = "Event";
	L["Exalted"] = "Exalted";
	L["Exit"] = "Exit";
	L["Fourth Stop"] = "Fourth Stop";
	L["Front"] = "Front";
	L["Ghost"] = "Ghost";
	L["Graveyard"] = "Graveyard";
	L["Heroic"] = "Heroic";
	L["Mythic"] = "Mythic";
	L["Holy Paladin"] = "Holy Paladin";
	L["Holy Priest"] = "Holy Priest";
	L["Imp"] = "Imp";
	L["Key"] = "Key";
	L["Lower"] = "Lower";
	L["Meeting Stone"] = "Meeting Stone";
	L["Middle"] = "Middle";
	L["Moonwell"] = "Moonwell";
	L["Optional"] = "Optional";
	L["Orange"] = "Orange";
	L["Outside"] = "Outside";
	L["Portal"] = "Portal";
	L["Protection Warrior"] = "Protection Warrior";
	L["Purple"] = "Purple";
	L["Random"] = "Random";
	L["Rare"] = "Rare";
	L["Repair"] = "Repair";
	L["Retribution Paladin"] = "Retribution Paladin";
	L["Rewards"] = "Rewards";
	L["Second Stop"] = "Second Stop";
	L["Shadow Priest"] = "Shadow Priest";
	L["Spawn Point"] = "Spawn Point";
	L["Start"] = "Start";
	L["Summon"] = "Summon";
	L["Teleporter"] = "Teleporter";
	L["Teleporter destination"] = "Teleporter destination";
	L["Third Stop"] = "Third Stop";
	L["Top"] = "Top";
	L["Tunnel"] = "Tunnel";
	L["Underwater"] = "Underwater";
	L["Upper"] = "Upper";
	L["Varies"] = "Varies";
	L["Wanders"] = "Wanders";
	L["Wave 5"] = "Wave 5";
	L["Wave 6"] = "Wave 6";
	L["Wave 10"] = "Wave 10";
	L["Wave 12"] = "Wave 12";
	L["Wave 18"] = "Wave 18";
	L["MapsNotFound"] = "Current selected dungeon does not have a \ncorresponding map image associated with. \n\nPlease make sure you have installed \nthe corresponding Atlas map module(s).";
	L["PossibleMissingModule"] = "It is likely this map is from this module: ";
	L["Transport"] = "Transport";

	--Map sections
	L["MapA"] = " [A]"; -- For example: Shado-Pan Monastery [A]
	L["MapB"] = " [B]";
	L["MapC"] = " [C]";
	L["MapD"] = " [D]";
	L["MapE"] = " [E]";
	L["MapF"] = " [F]";
	L["MapG"] = " [G]";
	L["MapH"] = " [H]";
	L["MapI"] = " [I]";
	L["MapJ"] = " [J]";

--************************************************
-- Instance Entrance Maps
--************************************************
	--Blackrock Mountain (Entrance)
	L["Bodley"] = "Bodley";
	L["Lothos Riftwaker"] = "Lothos Riftwaker";
	L["Orb of Command"] = "Orb of Command";
	L["Scarshield Quartermaster <Scarshield Legion>"] = "Scarshield Quartermaster <Scarshield Legion>";
	L["The Behemoth"] = "The Behemoth";

	--Caverns of Time (Entrance)
	L["Steward of Time <Keepers of Time>"] = "Steward of Time <Keepers of Time>";
	L["Alexston Chrome <Tavern of Time>"] = "Alexston Chrome <Tavern of Time>";
	L["Yarley <Armorer>"] = "Yarley <Armorer>";
	L["Bortega <Reagents & Poison Supplies>"] = "Bortega <Reagents & Poison Supplies>";
	L["Alurmi <Keepers of Time Quartermaster>"] = "Alurmi <Keepers of Time Quartermaster>";
	L["Galgrom <Provisioner>"] = "Galgrom <Provisioner>";
	L["Zaladormu"] = "Zaladormu";
	L["Soridormi <The Scale of Sands>"] = "Soridormi <The Scale of Sands>";
	L["Arazmodu <The Scale of Sands>"] = "Arazmodu <The Scale of Sands>";
	L["Andormu <Keepers of Time>"] = "Andormu <Keepers of Time>";
	L["Nozari <Keepers of Time>"] = "Nozari <Keepers of Time>";
	L["Anachronos <Keepers of Time>"] = "Anachronos <Keepers of Time>";

end