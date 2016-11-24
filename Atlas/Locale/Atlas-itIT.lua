-- $Id: Atlas-itIT.lua 31 2016-06-23 07:30:35Z arith $
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
local L = AceLocale:NewLocale("Atlas", "itIT", false);

-- Atlas Spanish Localization
if ( GetLocale() == "itIT" ) then
-- Define the leading strings to be ignored while sorting
-- Ex: The Stockade
AtlasSortIgnore = {
	--"the (.+)",
};

-- Syntax: ["real_zone_name"] = "localized map zone name"
AtlasZoneSubstitutions = {
--	["Ahn'Qiraj"] = "Templo de Ahn'Qiraj";
--	["The Temple of Atal'Hakkar"] = "El Templo de Atal'Hakkar";
--	["Throne of Tides"] = "Fauce Abisal: Trono de las Mareas";
};
end


if L then
-- L["Adult"] = ""
-- L["AKA"] = ""
-- L["Alexston Chrome <Tavern of Time>"] = ""
-- L["Alurmi <Keepers of Time Quartermaster>"] = ""
-- L["Anachronos <Keepers of Time>"] = ""
-- L["Andormu <Keepers of Time>"] = ""
-- L["Arazmodu <The Scale of Sands>"] = ""
-- L["Arcane Container"] = ""
-- L["Arms Warrior"] = ""
-- L["ATLAS_BUTTON_CLOSE"] = ""
-- L["ATLAS_CLICK_TO_OPEN"] = ""
-- L["ATLAS_COLLAPSE_BUTTON"] = ""
-- L["ATLAS_DDL_CONTINENT"] = ""
-- L["ATLAS_DDL_CONTINENT_BROKENISLES"] = ""
-- L["ATLAS_DDL_CONTINENT_DEEPHOLM"] = ""
-- L["ATLAS_DDL_CONTINENT_DRAENOR"] = ""
-- L["ATLAS_DDL_CONTINENT_EASTERN"] = ""
-- L["ATLAS_DDL_CONTINENT_KALIMDOR"] = ""
-- L["ATLAS_DDL_CONTINENT_NORTHREND"] = ""
-- L["ATLAS_DDL_CONTINENT_OUTLAND"] = ""
-- L["ATLAS_DDL_CONTINENT_PANDARIA"] = ""
-- L["ATLAS_DDL_EXPANSION"] = ""
-- L["ATLAS_DDL_EXPANSION_BC"] = ""
-- L["ATLAS_DDL_EXPANSION_CATA"] = ""
-- L["ATLAS_DDL_EXPANSION_LEGION"] = ""
-- L["ATLAS_DDL_EXPANSION_MOP"] = ""
-- L["ATLAS_DDL_EXPANSION_OLD_AO"] = ""
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
-- L["ATLAS_DDL_LEVEL_85TO90"] = ""
-- L["ATLAS_DDL_LEVEL_90TO100"] = ""
-- L["ATLAS_DDL_LEVEL_UNDER45"] = ""
-- L["ATLAS_DDL_PARTYSIZE"] = ""
-- L["ATLAS_DDL_PARTYSIZE_10_AN"] = ""
-- L["ATLAS_DDL_PARTYSIZE_10_OZ"] = ""
-- L["ATLAS_DDL_PARTYSIZE_20TO40AH"] = ""
-- L["ATLAS_DDL_PARTYSIZE_20TO40IZ"] = ""
-- L["ATLAS_DDL_PARTYSIZE_5_AE"] = ""
-- L["ATLAS_DDL_PARTYSIZE_5_FS"] = ""
-- L["ATLAS_DDL_PARTYSIZE_5_TZ"] = ""
-- L["ATLAS_DDL_TYPE"] = ""
-- L["ATLAS_DDL_TYPE_ENTRANCE"] = ""
-- L["ATLAS_DDL_TYPE_INSTANCE_AB"] = ""
-- L["ATLAS_DDL_TYPE_INSTANCE_CF"] = ""
-- L["ATLAS_DDL_TYPE_INSTANCE_GM"] = ""
-- L["ATLAS_DDL_TYPE_INSTANCE_NS"] = ""
-- L["ATLAS_DDL_TYPE_INSTANCE_TZ"] = ""
-- L["ATLAS_DEP_MSG1"] = ""
-- L["ATLAS_DEP_MSG2"] = ""
-- L["ATLAS_DEP_MSG3"] = ""
-- L["ATLAS_DEP_OK"] = ""
-- L["ATLAS_ENTRANCE_BUTTON"] = ""
-- L["ATLAS_EXPAND_BUTTON"] = ""
-- L["ATLAS_INFO"] = ""
-- L["ATLAS_INFO_12200"] = ""
-- L["ATLAS_INFO_12201"] = ""
-- L["ATLAS_INSTANCE_BUTTON"] = ""
-- L["ATLAS_LDB_HINT"] = ""
-- L["ATLAS_MINIMAPLDB_HINT"] = ""
-- L["ATLAS_MISSING_MODULE"] = ""
-- L["ATLAS_OPEN_ADDON_LIST"] = ""
-- L["ATLAS_OPEN_ADVENTURE"] = ""
-- L["ATLAS_OPEN_WOWMAP_WINDOW"] = ""
-- L["ATLAS_OPTIONS_ACRONYMS"] = ""
-- L["ATLAS_OPTIONS_ACRONYMS_TIP"] = ""
-- L["ATLAS_OPTIONS_AUTOSEL"] = ""
-- L["ATLAS_OPTIONS_AUTOSEL_TIP"] = ""
-- L["ATLAS_OPTIONS_BOSS_DESC"] = ""
-- L["ATLAS_OPTIONS_BOSS_DESC_SCALE"] = ""
-- L["ATLAS_OPTIONS_BOSS_DESC_TIP"] = ""
-- L["ATLAS_OPTIONS_BUTPOS"] = ""
-- L["ATLAS_OPTIONS_BUTRAD"] = ""
-- L["ATLAS_OPTIONS_BUTTON"] = ""
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
-- L["ATLAS_SLASH"] = ""
-- L["ATLAS_SLASH_OPTIONS"] = ""
-- L["ATLAS_STRING_CLEAR"] = ""
-- L["ATLAS_STRING_LEVELRANGE"] = ""
-- L["ATLAS_STRING_LOCATION"] = ""
-- L["ATLAS_STRING_MINGEARLEVEL"] = ""
-- L["ATLAS_STRING_MINLEVEL"] = ""
-- L["ATLAS_STRING_PLAYERLIMIT"] = ""
-- L["ATLAS_STRING_RECLEVELRANGE"] = ""
-- L["ATLAS_STRING_SEARCH"] = ""
-- L["ATLAS_STRING_SELECT_CAT"] = ""
-- L["ATLAS_STRING_SELECT_MAP"] = ""
-- L["ATLAS_TITLE"] = ""
-- L["ATLAS_TOGGLE_LOOT"] = ""
-- L["Attunement Required"] = ""
-- L["Back"] = ""
-- L["Basement"] = ""
-- L["BINDING_HEADER_ATLAS_TITLE"] = ""
-- L["BINDING_NAME_ATLAS_AUTOSEL"] = ""
-- L["BINDING_NAME_ATLAS_OPTIONS"] = ""
-- L["BINDING_NAME_ATLAS_TOGGLE"] = ""
-- L["Blacksmithing Plans"] = ""
-- L["Bodley"] = ""
-- L["Bortega <Reagents & Poison Supplies>"] = ""
-- L["Brewfest"] = ""
-- L["Child"] = ""
-- L["Colon"] = ""
-- L["Comma"] = ""
-- L["Connection"] = ""
-- L["East"] = ""
-- L["Elevator"] = ""
-- L["End"] = ""
-- L["Engineer"] = ""
-- L["Entrance"] = ""
-- L["Event"] = ""
-- L["Exalted"] = ""
-- L["Exit"] = ""
-- L["Fourth Stop"] = ""
-- L["Front"] = ""
-- L["Galgrom <Provisioner>"] = ""
-- L["Ghost"] = ""
-- L["Graveyard"] = ""
-- L["Hallow's End"] = ""
-- L["Heroic"] = ""
-- L["Heroic_Symbol"] = ""
-- L["Holy Paladin"] = ""
-- L["Holy Priest"] = ""
-- L["Hyphen"] = ""
-- L["Imp"] = ""
-- L["Key"] = ""
-- L["L-DQuote"] = ""
-- L["Lothos Riftwaker"] = ""
-- L["Love is in the Air"] = ""
-- L["Lower"] = ""
-- L["L-Parenthesis"] = ""
-- L["L-SBracket"] = ""
-- L["Lunar Festival"] = ""
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
-- L["Meeting Stone"] = ""
-- L["Middle"] = ""
-- L["Midsummer Festival"] = ""
-- L["Moonwell"] = ""
-- L["Mythic"] = ""
-- L["Mythic_Symbol"] = ""
-- L["North"] = ""
-- L["Nozari <Keepers of Time>"] = ""
-- L["Optional"] = ""
-- L["Orange"] = ""
-- L["Orb of Command"] = ""
-- L["Outside"] = ""
-- L["Period"] = ""
-- L["Portal"] = ""
-- L["PossibleMissingModule"] = ""
-- L["Protection Warrior"] = ""
-- L["Purple"] = ""
-- L["Random"] = ""
-- L["Rare"] = ""
-- L["R-DQuote"] = ""
-- L["Repair"] = ""
-- L["Retribution Paladin"] = ""
-- L["Rewards"] = ""
-- L["R-Parenthesis"] = ""
-- L["R-SBracket"] = ""
-- L["Scarshield Quartermaster <Scarshield Legion>"] = ""
-- L["Second Stop"] = ""
-- L["Semicolon"] = ""
-- L["Shadow Priest"] = ""
-- L["Slash"] = ""
-- L["Soridormi <The Scale of Sands>"] = ""
-- L["South"] = ""
-- L["Spawn Point"] = ""
-- L["Start"] = ""
-- L["Steward of Time <Keepers of Time>"] = ""
-- L["Summon"] = ""
-- L["Teleporter"] = ""
-- L["Teleporter destination"] = ""
-- L["The Behemoth"] = ""
-- L["Third Stop"] = ""
-- L["Top"] = ""
-- L["Transport"] = ""
-- L["Tunnel"] = ""
-- L["Underwater"] = ""
-- L["Upper"] = ""
-- L["Varies"] = ""
-- L["Wanders"] = ""
-- L["Wave 10"] = ""
-- L["Wave 12"] = ""
-- L["Wave 18"] = ""
-- L["Wave 5"] = ""
-- L["Wave 6"] = ""
-- L["West"] = ""
-- L["Yarley <Armorer>"] = ""
-- L["Zaladormu"] = ""
-- L["ToC/Description"] = ""
-- L["ToC/Title"] = ""

end
