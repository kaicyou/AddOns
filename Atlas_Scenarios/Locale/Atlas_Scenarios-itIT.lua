-- $Id: Atlas_Scenarios-itIT.lua 12 2016-06-27 14:27:22Z arith $
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

local AceLocale = LibStub:GetLibrary("AceLocale-3.0");
local L = AceLocale:NewLocale("Atlas_Scenarios", "itIT", false);

if L then
	for key, value in pairs(Atlas_ScenarioStepDB) do
		L[value[1]] = value[Atlas_ScenariosDB_Langs["itIT"]];
	end

-- L["33 Deamons slain"] = ""
-- L["3 Lords slain"] = ""
-- L["3 Spires of Woe destroyed"] = ""
-- L["Abomination of Anger"] = ""
-- L["Achievement"] = ""
-- L["Admiral Hagman"] = ""
-- L["Admiral Hodgson"] = ""
-- L["Admiral Taylor"] = ""
-- L["Alliance's final stop"] = ""
-- L["Alliance Ships"] = ""
-- L["Amber Kearnen"] = ""
-- L["Attackers"] = ""
-- L["Baldruc and Gryphon"] = ""
-- L["Battery"] = ""
-- L["Beach"] = ""
-- L["Brewing Cauldron"] = ""
-- L["Brewmaster Boof"] = ""
-- L["Broken Proto-Drake Egg"] = ""
-- L["Broodmaster Noshi"] = ""
-- L["Cannon Balls"] = ""
-- L["Cave"] = ""
-- L["Commander Scargash"] = ""
-- L["Commander Tel'vrak"] = ""
-- L["Cordfellow Hack"] = ""
-- L["Crafty the Ambitious"] = ""
-- L["Daggin Windbeard"] = ""
-- L["Darkhatched Lizard-Lord"] = ""
-- L["Dark Iron Mountaineers"] = ""
-- L["Dark Shaman Xorenth"] = ""
-- L["Defeat Cloudbender Kobo"] = ""
-- L["Defeat Maki Waterblade"] = ""
-- L["Defeat Satay Byu"] = ""
-- L["Defence Point"] = ""
-- L["Demon Invasion"] = ""
-- L["Den Mother Moof"] = ""
-- L["Docking"] = ""
-- L["Door"] = ""
-- L["East Statue"] = ""
-- L["Echo of Y'Sharrj"] = ""
-- L["Farastu"] = ""
-- L["Final Stage"] = ""
-- L["Flame Hound"] = ""
-- L["General Nazgrim"] = ""
-- L["God-Hulk Gulkan"] = ""
-- L["Grizzle Gearslip"] = ""
-- L["Gul'dan"] = ""
-- L["Hekima the Wise"] = ""
-- L["Highlord Tirion Fordring"] = ""
-- L["High Marshal Twinbraid"] = ""
-- L["Horde's final stop"] = ""
-- L["Horde Ships"] = ""
-- L["Jaina"] = ""
-- L["Jin Ironfist"] = ""
-- L["Joan Lorraine"] = ""
-- L["Karsar the Bloodletter"] = ""
-- L["King Varian Wrynn"] = ""
-- L["Kor'kron Dire Soldier"] = ""
-- L["Krosus"] = ""
-- L["Kyparite Quarry Sonic Control Towers"] = ""
-- L["Landing"] = ""
-- L["Lever"] = ""
-- L["Lieutenant Blasthammer"] = ""
-- L["Lieutenant Boltblaster"] = ""
-- L["Lieutenant Drak'on"] = ""
-- L["Lieutenant Fizzboil"] = ""
-- L["Lieutenant Fizzel"] = ""
-- L["Lieutenant Fuseblast"] = ""
-- L["Lieutenant Parker"] = ""
-- L["Lieutenant Sparklighter"] = ""
-- L["Li Te"] = ""
-- L["Mishka"] = ""
-- L["Norushen"] = ""
-- L["Overseer Elaglo"] = ""
-- L["Pandaria Artifacts"] = ""
-- L["Pool of Life"] = ""
-- L["Pool Pony"] = ""
-- L["Portal"] = ""
-- L["Proto-drake Eggs"] = ""
-- L["Rak'gor Bloodrazor"] = ""
-- L["Rivett Clutchpop"] = ""
-- L["Rope Pile"] = ""
-- L["Run to the top deck and swing away!"] = ""
-- L["Saurok Cave"] = ""
-- L["Saurok Hatchery"] = ""
-- L["Scenarios Maps"] = ""
-- L["Scout Boldbrew"] = ""
-- L["Scout Forgefellow"] = ""
-- L["Scout Stonebeard"] = ""
-- L["Sealed Gate"] = ""
-- L["Shademaster Kiryn"] = ""
-- L["Shokia"] = ""
-- L["Squad Leader Bosh"] = ""
-- L["Stage 1"] = ""
-- L["Stage 2"] = ""
-- L["Stage 3"] = ""
-- L["Stage 4"] = ""
-- L["Stage 5"] = ""
-- L["Stage 6"] = ""
-- L["Stage 7"] = ""
-- L["Steal Explosives"] = ""
-- L["Sully \"The Pickle\" McLeary"] = ""
-- L["Supply Crates"] = ""
-- L["Sylvanas and Baine"] = ""
-- L["Tanks"] = ""
-- L["Tenwu of the Red Smoke"] = ""
-- L["Thalen Songweaver"] = ""
-- L["Thaumaturge Saresse"] = ""
-- L["The Flight MasterDP"] = ""
-- L["The Flight MasterLL"] = ""
-- L["The heart of ruined Theramore"] = ""
-- L["The Spring Drifter"] = ""
-- L["Transport Cannon"] = ""
-- L["Traps"] = ""
-- L["Treasure Urn"] = ""
-- L["Urtharges the Destroyer"] = ""
-- L["Venomsting Pits Sonic Control Towers"] = ""
-- L["Vol'jin"] = ""
-- L["Warlord Bloodhilt"] = ""
-- L["Wave One"] = ""
-- L["Wave Three"] = ""
-- L["Wave Two"] = ""
-- L["Weapons"] = ""
-- L["West Gate"] = ""
-- L["West Statue"] = ""
-- L["Whispering Stones Sonic Control Towers"] = ""
-- L["Wolf-Rider Gaja"] = ""
-- L["ToC/Description"] = ""
-- L["ToC/Title"] = ""


end
