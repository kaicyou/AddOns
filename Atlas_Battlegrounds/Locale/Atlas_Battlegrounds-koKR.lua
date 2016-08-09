-- $Id: Atlas_Battlegrounds-koKR.lua 1538 2016-08-07 15:57:11Z arith $
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
local L = AceLocale:NewLocale("Atlas_Battlegrounds", "koKR", false);

-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
-- Translation now being managed on curseforge: http://wow.curseforge.com/addons/atlas-battlegrounds/localization/
-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////

if L then
-- L["2nd Lieutenant Wansworth <Baradin's Wardens>"] = ""
-- L["AB"] = ""
-- L["Aldraan <Blade Merchant>"] = ""
-- L["Alliance Field Scout"] = ""
-- L["Alliance Graveyard"] = ""
-- L["Alliance's Camp"] = ""
-- L["Arch Druid Renferal"] = ""
-- L["Attackers"] = ""
-- L["Attacking Team"] = ""
-- L["AV"] = ""
-- L["Battleground Demolisher"] = ""
-- L["Battleground Maps"] = ""
-- L["Brogus Thunderbrew <Food & Drink>"] = ""
-- L["Broken Temple Graveyard"] = ""
-- L["Broken Temple Vihecal Workshop"] = ""
-- L["Captain Balinda Stonehearth <Stormpike Captain>"] = ""
-- L["Captain Galvangar <Frostwolf Captain>"] = ""
-- L["Cendrii <Food & Drink>"] = ""
-- L["Center Mine"] = ""
-- L["Center Point (Maximum Points)"] = ""
-- L["Chief Researcher Amereldine"] = ""
-- L["Chief Researcher Kartos"] = ""
-- L["Commander Stevens <Baradin's Wardens>"] = ""
-- L["Commander Zanoth <Hellscream's Reach>"] = ""
-- L["Contested Graveyards"] = ""
-- L["Coreiel <Blade Merchant>"] = ""
-- L["Defending Team"] = ""
-- L["Dragonmaw Clan Compound"] = ""
-- L["Drek'Thar <Frostwolf General>"] = ""
-- L["Drillmaster Razgoth <Hellscream's Reach>"] = ""
-- L["Dun Baldar North Bunker"] = ""
-- L["Dun Baldar South Bunker"] = ""
-- L["East Beacon"] = ""
-- L["Eastern Crater"] = ""
-- L["East Frostwolf Tower"] = ""
-- L["Eastspark Vihecale Workshop"] = ""
-- L["Embelar <Food & Drink>"] = ""
-- L["EotS"] = ""
-- L["Flag"] = ""
-- L["Fortress Vihecal Workshop (E)"] = ""
-- L["Fortress Vihecal Workshop (W)"] = ""
-- L["Frostwolf Banner"] = ""
-- L["Frostwolf Quartermaster"] = ""
-- L["Frostwolf Relief Hut"] = ""
-- L["Frostwolf Stable Master <Stable Master>"] = ""
-- L["Frostwolf Wolf Rider Commander"] = ""
-- L["Gaelden Hammersmith <Stormpike Supply Officer>"] = ""
-- L["Gates are marked with red bars."] = ""
-- L["Gates are marked with their colors."] = ""
-- L["Graveyard Flag"] = ""
-- L["Guse's Beacon"] = ""
-- L["Hellfire Fortifications"] = ""
-- L["High Commander Halford Wyrmbane <7th Legion>"] = ""
-- L["Horde Field Scout"] = ""
-- L["Horde Graveyard"] = ""
-- L["Horde's Camp"] = ""
-- L["Iceblood Tower"] = ""
-- L["Ichman's Beacon"] = ""
-- L["IoC"] = ""
-- L["Ivus the Forest Lord"] = ""
-- L["Jeztor's Beacon"] = ""
-- L["Jonivera Farmountain <General Goods>"] = ""
-- L["Jotek"] = ""
-- L["Kurdrum Barleybeard <Reagents & Poison Supplies>"] = ""
-- L["Lana Thunderbrew <Blacksmithing Supplies>"] = ""
-- L["Lokholar the Ice Lord"] = ""
-- L["Marshal Fallows <Baradin's Wardens>"] = ""
-- L["Massive Seaforium Charge"] = ""
-- L["Mine Cart Depot"] = ""
-- L["Mine Cart Spawn Point"] = ""
-- L["Mulverick's Beacon"] = ""
-- L["Murgot Deepforge"] = ""
-- L["Orb of Power"] = ""
-- L["Overlord Agmar"] = ""
-- L["Primalist Thurloga"] = ""
-- L["Private Garnoth <Hellscream's Reach>"] = ""
-- L["Prospector Stonehewer"] = ""
-- L["Quartermaster Davian Vaclav"] = ""
-- L["Quartermaster Jaffrey Noreliqe"] = ""
-- L["Rescued"] = ""
-- L["Resurrection Point"] = ""
-- L["Sergeant Parker <Baradin's Wardens>"] = ""
-- L["Slidore's Beacon"] = ""
-- L["Smith Regzar"] = ""
-- L["SotA"] = ""
-- L["Southeast Graveyard"] = ""
-- L["Southwest Graveyard"] = ""
-- L["Span of 5"] = ""
-- L["Spirit Towers"] = ""
-- L["Staff Sergeant Lazgar <Hellscream's Reach>"] = ""
-- L["Stormpike Aid Station"] = ""
-- L["Stormpike Banner"] = ""
-- L["Stormpike Lumber Yard"] = ""
-- L["Stormpike Quartermaster"] = ""
-- L["Stormpike Ram Rider Commander"] = ""
-- L["Stormpike Stable Master <Stable Master>"] = ""
-- L["Sunken Ring Graveyard"] = ""
-- L["Sunken Ring Vihecal Workshop"] = ""
-- L["Svalbrad Farmountain <Trade Goods>"] = ""
-- L["The Docks"] = ""
-- L["The Hangar"] = ""
-- L["The Quarry"] = ""
-- L["The Refinery"] = ""
-- L["The Silithyst Must Flow"] = ""
-- L["The Workshop"] = ""
-- L["Titan Relic"] = ""
-- L["Tower Point"] = ""
-- L["Twinspire Graveyard"] = ""
-- L["Vanndar Stormpike <Stormpike General>"] = ""
-- L["Vipore's Beacon"] = ""
-- L["West Beacon"] = ""
-- L["Western Crater"] = ""
-- L["West Frostwolf Tower"] = ""
-- L["Westspark Vihecale Workshop"] = ""
-- L["Wildhammer Longhouse"] = ""
-- L["Wing Commander Guse"] = ""
-- L["Wing Commander Ichman"] = ""
-- L["Wing Commander Jeztor"] = ""
-- L["Wing Commander Mulverick"] = ""
-- L["Wing Commander Slidore"] = ""
-- L["Wing Commander Vipore"] = ""
-- L["Wintergrasp Graveyard"] = ""
-- L["WSG"] = ""
-- L["Wyvern Camp"] = ""
L["ToC/Description"] = "전장 지도"
-- L["ToC/Title"] = ""

end