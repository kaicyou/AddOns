 -- $Id: Atlas_Scenarios-frFR.lua 12 2016-06-27 14:27:22Z arith $
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
local L = AceLocale:NewLocale("Atlas_Scenarios", "frFR", false);

if L then
	for key, value in pairs(Atlas_ScenarioStepDB) do
		L[value[1]] = value[Atlas_ScenariosDB_Langs["frFR"]];
	end

-- L["33 Deamons slain"] = ""
-- L["3 Lords slain"] = ""
-- L["3 Spires of Woe destroyed"] = ""
L["Abomination of Anger"] = "Abomination de colère"
-- L["Achievement"] = ""
-- L["Admiral Hagman"] = ""
-- L["Admiral Hodgson"] = ""
-- L["Admiral Taylor"] = ""
-- L["Alliance's final stop"] = ""
L["Alliance Ships"] = "Navires de l’Alliance"
-- L["Amber Kearnen"] = ""
-- L["Attackers"] = ""
L["Baldruc and Gryphon"] = "Baldruc et  Griffon"
-- L["Battery"] = ""
-- L["Beach"] = ""
L["Brewing Cauldron"] = "Chaudron de brassage"
L["Brewmaster Boof"] = "Maître brasseur Giclette"
-- L["Broken Proto-Drake Egg"] = ""
-- L["Broodmaster Noshi"] = ""
-- L["Cannon Balls"] = ""
-- L["Cave"] = ""
L["Commander Scargash"] = "Commandant Coupentaille"
-- L["Commander Tel'vrak"] = ""
-- L["Cordfellow Hack"] = ""
-- L["Crafty the Ambitious"] = ""
-- L["Daggin Windbeard"] = ""
-- L["Darkhatched Lizard-Lord"] = ""
-- L["Dark Iron Mountaineers"] = ""
-- L["Dark Shaman Xorenth"] = ""
L["Defeat Cloudbender Kobo"] = "Vaincre Maki Lame-d’Eau"
L["Defeat Maki Waterblade"] = "Vaincre Maki Lame-d’Eau"
L["Defeat Satay Byu"] = "Vaincre Satay Byu"
L["Defence Point"] = "Point de défense"
-- L["Demon Invasion"] = ""
L["Den Mother Moof"] = "Mère de la tanière Mouf"
-- L["Docking"] = ""
-- L["Door"] = ""
-- L["East Statue"] = ""
-- L["Echo of Y'Sharrj"] = ""
-- L["Farastu"] = ""
L["Final Stage"] = "Dernière phase"
-- L["Flame Hound"] = ""
-- L["General Nazgrim"] = ""
-- L["God-Hulk Gulkan"] = ""
-- L["Grizzle Gearslip"] = ""
-- L["Gul'dan"] = ""
-- L["Hekima the Wise"] = ""
-- L["Highlord Tirion Fordring"] = ""
-- L["High Marshal Twinbraid"] = ""
-- L["Horde's final stop"] = ""
L["Horde Ships"] = "Navire de la Horde"
L["Jaina"] = "Jaina"
L["Jin Ironfist"] = "Jin Poing de Fer"
-- L["Joan Lorraine"] = ""
L["Karsar the Bloodletter"] = "Karsar le Saigneur"
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
L["Li Te"] = "Li Te"
-- L["Mishka"] = ""
-- L["Norushen"] = ""
-- L["Overseer Elaglo"] = ""
-- L["Pandaria Artifacts"] = ""
L["Pool of Life"] = "Bassin de la vie"
-- L["Pool Pony"] = ""
-- L["Portal"] = ""
-- L["Proto-drake Eggs"] = ""
-- L["Rak'gor Bloodrazor"] = ""
-- L["Rivett Clutchpop"] = ""
-- L["Rope Pile"] = ""
-- L["Run to the top deck and swing away!"] = ""
-- L["Saurok Cave"] = ""
-- L["Saurok Hatchery"] = ""
L["Scenarios Maps"] = "Cartes des scénarios"
-- L["Scout Boldbrew"] = ""
-- L["Scout Forgefellow"] = ""
-- L["Scout Stonebeard"] = ""
-- L["Sealed Gate"] = ""
-- L["Shademaster Kiryn"] = ""
-- L["Shokia"] = ""
-- L["Squad Leader Bosh"] = ""
L["Stage 1"] = "Phase 1"
L["Stage 2"] = "Phase 2"
L["Stage 3"] = "Phase 3"
L["Stage 4"] = "Phase 4"
L["Stage 5"] = "Phase 5"
L["Stage 6"] = "Phase 6"
L["Stage 7"] = "Phase 7"
-- L["Steal Explosives"] = ""
-- L["Sully \"The Pickle\" McLeary"] = ""
-- L["Supply Crates"] = ""
-- L["Sylvanas and Baine"] = ""
L["Tanks"] = "Tanks"
L["Tenwu of the Red Smoke"] = "Tenwu de la Fumée rouge"
L["Thalen Songweaver"] = "Thalen Tissechant"
-- L["Thaumaturge Saresse"] = ""
L["The Flight MasterDP"] = "Le maître de vol"
L["The Flight MasterLL"] = "Le maître de vol"
L["The heart of ruined Theramore"] = "Cœur des ruines de Theramore"
-- L["The Spring Drifter"] = ""
-- L["Transport Cannon"] = ""
L["Traps"] = "Pièges"
L["Treasure Urn"] = "Urne au trésor"
-- L["Urtharges the Destroyer"] = ""
-- L["Venomsting Pits Sonic Control Towers"] = ""
-- L["Vol'jin"] = ""
-- L["Warlord Bloodhilt"] = ""
-- L["Wave One"] = ""
-- L["Wave Three"] = ""
-- L["Wave Two"] = ""
-- L["Weapons"] = ""
L["West Gate"] = "Porte Ouest"
-- L["West Statue"] = ""
-- L["Whispering Stones Sonic Control Towers"] = ""
-- L["Wolf-Rider Gaja"] = ""
-- L["ToC/Description"] = ""
-- L["ToC/Title"] = ""


end
