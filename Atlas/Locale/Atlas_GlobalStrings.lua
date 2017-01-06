-- $Id: Atlas_GlobalStrings.lua 126 2016-12-27 17:45:39Z arith $
--[[

	Atlas, a World of Warcraft instance map browser
	Copyright 2005 ~ 2010 - Dan Gilbert <dan.b.gilbert@gmail.com>
	Copyright 2010 - Lothaer <lothayer@gmail.com>, Atlas Team
	Copyright 2011 ~ 2017 - Arith Hsu, Atlas Team <atlas.addon at gmail dot com>

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

local L = LibStub("AceLocale-3.0"):GetLocale("Atlas");

--[[
************************************************************************************************
Global Atlas Strings

    Define the string IDs hear so that we can easily use them in UI XML.
    Translation should still be kept in translation file.
************************************************************************************************
--]]
ATLAS_TITLE			= L["ATLAS_TITLE"];

ATLAS_VERSION_TEXT		= "v"..GetAddOnMetadata("Atlas", "Version");

BINDING_HEADER_ATLAS_TITLE	= L["BINDING_HEADER_ATLAS_TITLE"];
BINDING_NAME_ATLAS_TOGGLE	= L["BINDING_NAME_ATLAS_TOGGLE"];
BINDING_NAME_ATLAS_OPTIONS	= L["BINDING_NAME_ATLAS_OPTIONS"];
BINDING_NAME_ATLAS_AUTOSEL	= L["BINDING_NAME_ATLAS_AUTOSEL"];

ATLAS_SLASH			= L["ATLAS_SLASH"];
ATLAS_SLASH_OPTIONS		= L["ATLAS_SLASH_OPTIONS"];

ATLAS_STRING_LOCATION		= L["ATLAS_STRING_LOCATION"];
ATLAS_STRING_LEVELRANGE		= L["ATLAS_STRING_LEVELRANGE"];
ATLAS_STRING_RECLEVELRANGE	= L["ATLAS_STRING_RECLEVELRANGE"];
ATLAS_STRING_PLAYERLIMIT	= L["ATLAS_STRING_PLAYERLIMIT"];
ATLAS_STRING_SELECT_CAT		= L["ATLAS_STRING_SELECT_CAT"];
ATLAS_STRING_SELECT_MAP		= L["ATLAS_STRING_SELECT_MAP"];
ATLAS_STRING_SEARCH		= L["ATLAS_STRING_SEARCH"];
ATLAS_STRING_CLEAR		= L["ATLAS_STRING_CLEAR"];
ATLAS_STRING_MINLEVEL		= L["ATLAS_STRING_MINLEVEL"];

ATLAS_OPTIONS_BUTTON		= L["ATLAS_OPTIONS_BUTTON"];
ATLAS_OPTIONS_SHOWBUT		= L["ATLAS_OPTIONS_SHOWBUT"];
ATLAS_OPTIONS_SHOWBUT_TIP	= L["ATLAS_OPTIONS_SHOWBUT_TIP"];
ATLAS_OPTIONS_AUTOSEL		= L["ATLAS_OPTIONS_AUTOSEL"];
ATLAS_OPTIONS_AUTOSEL_TIP	= L["ATLAS_OPTIONS_AUTOSEL_TIP"];
ATLAS_OPTIONS_BUTPOS		= L["ATLAS_OPTIONS_BUTPOS"];
ATLAS_OPTIONS_LOCK		= L["ATLAS_OPTIONS_LOCK"];
ATLAS_OPTIONS_LOCK_TIP		= L["ATLAS_OPTIONS_LOCK_TIP"];
ATLAS_OPTIONS_TRANS		= L["ATLAS_OPTIONS_TRANS"];
ATLAS_OPTIONS_RCLICK		= L["ATLAS_OPTIONS_RCLICK"];
ATLAS_OPTIONS_RCLICK_TIP	= L["ATLAS_OPTIONS_RCLICK_TIP"];
ATLAS_OPTIONS_RESETPOS		= L["ATLAS_OPTIONS_RESETPOS"];
ATLAS_OPTIONS_ACRONYMS		= L["ATLAS_OPTIONS_ACRONYMS"];
ATLAS_OPTIONS_ACRONYMS_TIP	= L["ATLAS_OPTIONS_ACRONYMS_TIP"];
ATLAS_OPTIONS_SCALE		= L["ATLAS_OPTIONS_SCALE"];
ATLAS_OPTIONS_BOSS_DESC		= L["ATLAS_OPTIONS_BOSS_DESC"];
ATLAS_OPTIONS_BOSS_DESC_TIP	= L["ATLAS_OPTIONS_BOSS_DESC_TIP"];
ATLAS_OPTIONS_BOSS_DESC_SCALE	= L["ATLAS_OPTIONS_BOSS_DESC_SCALE"];
ATLAS_OPTIONS_BUTRAD		= L["ATLAS_OPTIONS_BUTRAD"];
ATLAS_OPTIONS_CLAMPED		= L["ATLAS_OPTIONS_CLAMPED"];
ATLAS_OPTIONS_CLAMPED_TIP	= L["ATLAS_OPTIONS_CLAMPED_TIP"];
ATLAS_OPTIONS_CTRL		= L["ATLAS_OPTIONS_CTRL"];
ATLAS_OPTIONS_CTRL_TIP		= L["ATLAS_OPTIONS_CTRL_TIP"];
ATLAS_OPTIONS_DONTSHOWAGAIN 	= L["ATLAS_OPTIONS_DONTSHOWAGAIN"];
ATLAS_OPTIONS_CHECKMODULE	= L["ATLAS_OPTIONS_CHECKMODULE"];
ATLAS_OPTIONS_CHECKMODULE_TIP	= L["ATLAS_OPTIONS_CHECKMODULE_TIP"];
ATLAS_OPTIONS_COLORINGDROPDOWN		= L["ATLAS_OPTIONS_COLORINGDROPDOWN"];
ATLAS_OPTIONS_COLORINGDROPDOWN_TIP	= L["ATLAS_OPTIONS_COLORINGDROPDOWN_TIP"];

ATLAS_BUTTON_CLOSE		= L["ATLAS_BUTTON_CLOSE"];
ATLAS_BUTTON_TOOLTIP_TITLE	= L["ATLAS_BUTTON_TOOLTIP_TITLE"];
ATLAS_BUTTON_TOOLTIP_HINT	= L["ATLAS_BUTTON_TOOLTIP_HINT"];
ATLAS_LDB_HINT			= L["ATLAS_LDB_HINT"];
ATLAS_MINIMAPLDB_HINT		= L["ATLAS_MINIMAPLDB_HINT"];

ATLAS_OPTIONS_CATDD		= L["ATLAS_OPTIONS_CATDD"];
ATLAS_DDL_CONTINENT		= L["ATLAS_DDL_CONTINENT"];
ATLAS_DDL_CONTINENT_EASTERN	= L["ATLAS_DDL_CONTINENT_EASTERN"];
ATLAS_DDL_CONTINENT_EASTERN1	= L["ATLAS_DDL_CONTINENT_EASTERN"].." 1/2";
ATLAS_DDL_CONTINENT_EASTERN2	= L["ATLAS_DDL_CONTINENT_EASTERN"].." 2/2";
ATLAS_DDL_CONTINENT_KALIMDOR	= L["ATLAS_DDL_CONTINENT_KALIMDOR"];
ATLAS_DDL_CONTINENT_OUTLAND	= L["ATLAS_DDL_CONTINENT_OUTLAND"];
ATLAS_DDL_CONTINENT_NORTHREND	= L["ATLAS_DDL_CONTINENT_NORTHREND"];
ATLAS_DDL_CONTINENT_DEEPHOLM	= L["ATLAS_DDL_CONTINENT_DEEPHOLM"];
ATLAS_DDL_CONTINENT_PANDARIA	= L["ATLAS_DDL_CONTINENT_PANDARIA"];
ATLAS_DDL_CONTINENT_DRAENOR	= L["ATLAS_DDL_CONTINENT_DRAENOR"];
ATLAS_DDL_CONTINENT_BROKENISLES	= L["ATLAS_DDL_CONTINENT_BROKENISLES"];
ATLAS_DDL_LEVEL			= L["ATLAS_DDL_LEVEL"];
ATLAS_DDL_LEVEL_UNDER45		= L["ATLAS_DDL_LEVEL_UNDER45"];
ATLAS_DDL_LEVEL_45TO60		= L["ATLAS_DDL_LEVEL_45TO60"];
ATLAS_DDL_LEVEL_60TO70		= L["ATLAS_DDL_LEVEL_60TO70"];
ATLAS_DDL_LEVEL_70TO80		= L["ATLAS_DDL_LEVEL_70TO80"];
ATLAS_DDL_LEVEL_80TO85		= L["ATLAS_DDL_LEVEL_80TO85"];
ATLAS_DDL_LEVEL_85TO90		= L["ATLAS_DDL_LEVEL_85TO90"];
ATLAS_DDL_LEVEL_90TO100		= L["ATLAS_DDL_LEVEL_90TO100"];
ATLAS_DDL_LEVEL_100PLUS		= L["ATLAS_DDL_LEVEL_100PLUS"];
ATLAS_DDL_LEVEL_100TO110	= L["ATLAS_DDL_LEVEL_100TO110"];
ATLAS_DDL_LEVEL_110PLUS		= L["ATLAS_DDL_LEVEL_110PLUS"];
ATLAS_DDL_PARTYSIZE		= L["ATLAS_DDL_PARTYSIZE"];
ATLAS_DDL_PARTYSIZE_5_AE	= L["ATLAS_DDL_PARTYSIZE_5_AE"];
ATLAS_DDL_PARTYSIZE_5_FS	= L["ATLAS_DDL_PARTYSIZE_5_FS"];
ATLAS_DDL_PARTYSIZE_5_TZ	= L["ATLAS_DDL_PARTYSIZE_5_TZ"];
ATLAS_DDL_PARTYSIZE_10_AN	= L["ATLAS_DDL_PARTYSIZE_10_AN"];
ATLAS_DDL_PARTYSIZE_10_OZ	= L["ATLAS_DDL_PARTYSIZE_10_OZ"];
ATLAS_DDL_PARTYSIZE_20TO40AH	= L["ATLAS_DDL_PARTYSIZE_20TO40AH"];
ATLAS_DDL_PARTYSIZE_20TO40IZ	= L["ATLAS_DDL_PARTYSIZE_20TO40IZ"];
ATLAS_DDL_EXPANSION		= L["ATLAS_DDL_EXPANSION"];
ATLAS_DDL_EXPANSION_OLD_AO	= L["ATLAS_DDL_EXPANSION_OLD_AO"];
ATLAS_DDL_EXPANSION_OLD_PZ	= L["ATLAS_DDL_EXPANSION_OLD_PZ"];
ATLAS_DDL_EXPANSION_BC		= L["ATLAS_DDL_EXPANSION_BC"];
ATLAS_DDL_EXPANSION_WOTLK	= L["ATLAS_DDL_EXPANSION_WOTLK"];
ATLAS_DDL_EXPANSION_CATA	= L["ATLAS_DDL_EXPANSION_CATA"];
ATLAS_DDL_EXPANSION_MOP		= L["ATLAS_DDL_EXPANSION_MOP"];
ATLAS_DDL_EXPANSION_WOD		= L["ATLAS_DDL_EXPANSION_WOD"];
ATLAS_DDL_EXPANSION_LEGION	= L["ATLAS_DDL_EXPANSION_LEGION"];
ATLAS_DDL_TYPE			= L["ATLAS_DDL_TYPE"];
ATLAS_DDL_TYPE_INSTANCE_AB	= L["ATLAS_DDL_TYPE_INSTANCE_AB"];
ATLAS_DDL_TYPE_INSTANCE_CF	= L["ATLAS_DDL_TYPE_INSTANCE_CF"];
ATLAS_DDL_TYPE_INSTANCE_GM	= L["ATLAS_DDL_TYPE_INSTANCE_GM"];
ATLAS_DDL_TYPE_INSTANCE_NS	= L["ATLAS_DDL_TYPE_INSTANCE_NS"];
ATLAS_DDL_TYPE_INSTANCE_TZ	= L["ATLAS_DDL_TYPE_INSTANCE_TZ"];
ATLAS_DDL_TYPE_ENTRANCE		= L["ATLAS_DDL_TYPE_ENTRANCE"];

ATLAS_INSTANCE_BUTTON		= L["ATLAS_INSTANCE_BUTTON"];
ATLAS_ENTRANCE_BUTTON		= L["ATLAS_ENTRANCE_BUTTON"];
ATLAS_SEARCH_UNAVAIL		= L["ATLAS_SEARCH_UNAVAIL"];

ATLAS_DEP_MSG1			= L["ATLAS_DEP_MSG1"];
ATLAS_DEP_MSG2			= L["ATLAS_DEP_MSG2"];
ATLAS_DEP_MSG3			= L["ATLAS_DEP_MSG3"];
ATLAS_DEP_OK			= L["ATLAS_DEP_OK"];

ATLAS_INFO			= L["ATLAS_INFO"];
ATLAS_INFO_MSG			= L["ATLAS_INFO"].." - v1.22.01\n\n"..L["ATLAS_INFO_12201"];

ATLAS_OPEN_ADVENTURE		= L["ATLAS_OPEN_ADVENTURE"];
ATLAS_CLICK_TO_OPEN		= L["ATLAS_CLICK_TO_OPEN"];
ATLAS_OPEN_WOWMAP_WINDOW	= L["ATLAS_OPEN_WOWMAP_WINDOW"];
ATLAS_COLLAPSE_BUTTON		= L["ATLAS_COLLAPSE_BUTTON"];
ATLAS_EXPAND_BUTTON		= L["ATLAS_EXPAND_BUTTON"];
ATLAS_TOGGLE_LOOT		= L["ATLAS_TOGGLE_LOOT"];
