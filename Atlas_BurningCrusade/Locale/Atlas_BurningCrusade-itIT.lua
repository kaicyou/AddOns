﻿-- $Id: Atlas_BurningCrusade-itIT.lua 12 2016-09-05 14:43:26Z arith $
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
local L = AceLocale:NewLocale("Atlas_BurningCrusade", "itIT", false);

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
-- L["Abbendis"] = ""
-- L["AC"] = ""
-- L["Advance Scout Chadwick"] = ""
-- L["Aged Dalaran Wizard"] = ""
-- L["Aluyen <Reagents>"] = ""
-- L["Ambassador Pax'ivi"] = ""
-- L["Apoko"] = ""
-- L["Apprentice Darius"] = ""
-- L["Arca"] = ""
-- L["Archmage Alturus"] = ""
-- L["Archmage Leryda"] = ""
-- L["Artificer Morphalius"] = ""
-- L["Auch"] = ""
-- L["Avatar of the Martyred"] = ""
-- L["Barkeep Kelly <Bartender>"] = ""
-- L["Barnes <The Stage Manager>"] = ""
-- L["Baroness Dorothea Millstipe"] = ""
-- L["Baron Rafe Dreuger"] = ""
-- L["Bennett <The Sergeant at Arms>"] = ""
-- L["Berthold <The Doorman>"] = ""
-- L["BF"] = ""
-- L["Bilger the Straight-laced"] = ""
-- L["Bota"] = ""
-- L["Brazen"] = ""
-- L["Broken Stairs"] = ""
-- L["BT"] = ""
-- L["Calliard <The Nightman>"] = ""
-- L["Captain Alina"] = ""
-- L["Captain Boneshatter"] = ""
-- L["Captain Edward Hanes"] = ""
-- L["\"Captain\" Kaftiz"] = ""
-- L["Captain Sanders"] = ""
-- L["Caza'rez"] = ""
-- L["Charred Bone Fragment"] = ""
-- L["Chef Jessen <Speciality Meat & Slop>"] = ""
-- L["Clarissa"] = ""
-- L["Commander Mograine"] = ""
-- L["CoT"] = ""
-- L["CoT1"] = ""
-- L["CoT2"] = ""
-- L["CoT3"] = ""
-- L["CR"] = ""
-- L["Cryo-Engineer Sha'heen"] = ""
-- L["Dealer Tariq <Shady Dealer>"] = ""
-- L["Dealer Vijaad"] = ""
-- L["Don Carlos"] = ""
-- L["D'ore"] = ""
-- L["Draenei Spirit"] = ""
-- L["Drisella"] = ""
-- L["Earthbinder Rayge"] = ""
-- L["Ebonlocke <The Noble>"] = ""
-- L["Echo of Medivh"] = ""
-- L["Ellrys Duskhallow"] = ""
-- L["Eramas Brightblaze"] = ""
-- L["Erozion"] = ""
-- L["Ethereal Transporter Control Panel"] = ""
-- L["Exarch Larethor"] = ""
-- L["Fairbanks"] = ""
-- L["Farmer Kent"] = ""
-- L["Fel Crystals"] = ""
-- L["Field Commander Mahfuun"] = ""
-- L["First Fragment Guardian"] = ""
-- L["Fizzle"] = ""
-- L["Frances Lin <Barmaid>"] = ""
-- L["Garaxxas"] = ""
-- L["GL"] = ""
-- L["Gradav <The Warlock>"] = ""
-- L["Greatfather Aldrimus"] = ""
-- L["Guerrero"] = ""
-- L["Gunny"] = ""
-- L["Ha'lei"] = ""
-- L["Hal McAllister"] = ""
-- L["Hastings <The Caretaker>"] = ""
-- L["HC"] = ""
-- L["Helcular"] = ""
-- L["Herod the Bully"] = ""
-- L["Horvon the Armorer <Armorsmith>"] = ""
-- L["Indormi <Keeper of Ancient Gem Lore>"] = ""
-- L["Innkeeper Monica"] = ""
-- L["Isfar"] = ""
-- L["Isillien"] = ""
-- L["Jay Lemieux"] = ""
-- L["Jerry Carter"] = ""
-- L["Jonathan Revah"] = ""
-- L["Julie Honeywell"] = ""
-- L["Kagani Nightstrike"] = ""
-- L["Kamsis <The Conjurer>"] = ""
-- L["Kara"] = ""
-- L["Keanna's Log"] = ""
-- L["Korag Proudmane"] = ""
-- L["Koren <The Blacksmith>"] = ""
-- L["Lady Catriona Von'Indi"] = ""
-- L["Lady Jaina Proudmoore"] = ""
-- L["Lady Keira Berrybuck"] = ""
-- L["Lakka"] = ""
-- L["Landing Spot"] = ""
-- L["Little Jimmy Vishas"] = ""
-- L["Lord Crispin Ference"] = ""
-- L["Lord Robin Daris"] = ""
-- L["Madrigosa"] = ""
-- L["Mag"] = ""
-- L["Magistrate Henry Maleb"] = ""
-- L["Main Chambers Access Panel"] = ""
-- L["Mamdy the \"Ologist\""] = ""
-- L["MaT"] = ""
-- L["Mech"] = ""
-- L["Meeting Stone of Hellfire Citadel"] = ""
-- L["Meeting Stone of Magtheridon's Lair"] = ""
-- L["Millhouse Manastorm"] = ""
-- L["Mortog Steamhead"] = ""
-- L["MT"] = ""
-- L["Mysterious Bookshelf"] = ""
-- L["Nahuud"] = ""
-- L["Nathanos Marris"] = ""
-- L["Nat Pagle"] = ""
-- L["Naturalist Bite"] = ""
-- L["Nexus-Prince Haramad"] = ""
-- L["Okuno <Ashtongue Deathsworn Quartermaster>"] = ""
-- L["Overcharged Manacell"] = ""
-- L["Overwatch Mark 0 <Protector>"] = ""
-- L["Path to the Broken Stairs"] = ""
-- L["Path to the Hellfire Ramparts and Shattered Halls"] = ""
-- L["Phin Odelic <The Kirin Tor>"] = ""
-- L["Private Jacint"] = ""
-- L["Provisioner Tsaalt"] = ""
-- L["Raleigh the True"] = ""
-- L["Ramdor the Mad"] = ""
-- L["Ramp"] = ""
-- L["Ramp down to the Gamesman's Hall"] = ""
-- L["Ramp to Guardian's Library"] = ""
-- L["Ramp to Medivh's Chamber"] = ""
-- L["Ramp up to the Celestial Watch"] = ""
-- L["Randy Whizzlesprocket"] = ""
-- L["Red Riding Hood"] = ""
-- L["Reinforced Fel Iron Chest"] = ""
-- L["Renault Mograine"] = ""
-- L["Rifleman Brownbeard"] = ""
-- L["Sa'at <Keepers of Time>"] = ""
-- L["Sally Whitemane"] = ""
-- L["Scout Orgarr"] = ""
-- L["Scrying Orb"] = ""
-- L["Sebastian <The Organist>"] = ""
-- L["Second Fragment Guardian"] = ""
-- L["Seer Kanai"] = ""
-- L["Seer Olum"] = ""
-- L["Servant Quarters"] = ""
-- L["Seth"] = ""
-- L["SH"] = ""
-- L["Shadow Lord Xiraxis"] = ""
-- L["Shattered Hand Executioner"] = ""
-- L["Skar'this the Heretic"] = ""
-- L["SL"] = ""
-- L["\"Slim\" <Shady Dealer>"] = ""
-- L["Sliver <Garaxxas' Pet>"] = ""
-- L["Southshore Inn"] = ""
-- L["SP"] = ""
-- L["Spiral Stairs to Netherspace"] = ""
-- L["Spirit of Olum"] = ""
-- L["Spirit of Udalo"] = ""
-- L["Spy Grik'tha"] = ""
-- L["Spy To'gun"] = ""
-- L["SSC"] = ""
-- L["Stairs to Underground Pond"] = ""
-- L["Stairs to Underground Well"] = ""
-- L["Stalvan Mistmantle"] = ""
-- L["Steps and path to the Blood Furnace"] = ""
-- L["Stone Guard Stok'ton"] = ""
-- L["SuP"] = ""
-- L["SV"] = ""
-- L["Taelan"] = ""
-- L["Taretha"] = ""
-- L["The Codex of Blood"] = ""
-- L["The Master's Terrace"] = ""
-- L["The Saga of Terokk"] = ""
-- L["The Underspore"] = ""
-- L["Third Fragment Guardian"] = ""
-- L["Thomas Yance <Travelling Salesman>"] = ""
-- L["Thrall"] = ""
-- L["Thrall <Warchief>"] = ""
-- L["TK"] = ""
-- L["Tormented Soulpriest"] = ""
-- L["Towards Illidan Stormrage"] = ""
-- L["Towards Reliquary of Souls"] = ""
-- L["Towards Teron Gorefiend"] = ""
-- L["T'shu"] = ""
-- L["Tydormu <Keeper of Lost Artifacts>"] = ""
-- L["Tyrande Whisperwind <High Priestess of Elune>"] = ""
-- L["Tyrith"] = ""
-- L["UB"] = ""
-- L["Udalo"] = ""
-- L["Warlord Salaris"] = ""
-- L["Watcher Jhang"] = ""
-- L["Weeder Greenthumb"] = ""
-- L["Windcaller Claw"] = ""
-- L["Wizard of Oz"] = ""
-- L["Wravien <The Mage>"] = ""
-- L["Yazzai"] = ""
-- L["Young Blanchy"] = ""
-- L["Ythyar"] = ""
-- L["Zelfan"] = ""
-- L["Zixil <Aspiring Merchant>"] = ""
-- L["ToC/Description"] = ""
-- L["ToC/Title"] = ""

end