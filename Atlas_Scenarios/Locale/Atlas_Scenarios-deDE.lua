-- $Id: Atlas_Scenarios-deDE.lua 12 2016-06-27 14:27:22Z arith $
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
local L = AceLocale:NewLocale("Atlas_Scenarios", "deDE", false);

if L then
	for key, value in pairs(Atlas_ScenarioStepDB) do
		L[value[1]] = value[Atlas_ScenariosDB_Langs["deDE"]];
	end

-- L["33 Deamons slain"] = ""
-- L["3 Lords slain"] = ""
-- L["3 Spires of Woe destroyed"] = ""
L["Abomination of Anger"] = "Monstrosität des Zorns"
L["Achievement"] = "Erfolg"
L["Admiral Hagman"] = "Admiral Hagman"
L["Admiral Hodgson"] = "Admiral Hodgson"
L["Admiral Taylor"] = "Admiral Taylor"
-- L["Alliance's final stop"] = ""
L["Alliance Ships"] = "Allianz-Schiffe"
L["Amber Kearnen"] = "Amber Kearnen"
L["Attackers"] = "Angreifer"
L["Baldruc and Gryphon"] = "Baldruc und Greif"
L["Battery"] = "Batterie"
-- L["Beach"] = ""
L["Brewing Cauldron"] = "Braukessel"
L["Brewmaster Boof"] = "Braumeister Boof"
L["Broken Proto-Drake Egg"] = "Zerbrochenes Protodrachenei"
L["Broodmaster Noshi"] = "Brutmeister Noshi"
L["Cannon Balls"] = "Kanonenkugeln"
L["Cave"] = "Höhle"
L["Commander Scargash"] = "Kommandant Schlitznarbe"
L["Commander Tel'vrak"] = "Kommandant Tel'vrak"
L["Cordfellow Hack"] = "Kabelfreund Hack"
L["Crafty the Ambitious"] = "Pfiffikus der Clevere"
L["Daggin Windbeard"] = "Daggin Windbart"
L["Darkhatched Lizard-Lord"] = "Echsenlord der Schattennester"
L["Dark Iron Mountaineers"] = "Dunkeleisengebirgsjäger"
L["Dark Shaman Xorenth"] = "Dunkelschamane Xorenth"
L["Defeat Cloudbender Kobo"] = "Bezwingt Wolkenformer Kobo"
L["Defeat Maki Waterblade"] = "Bezwingt Maki Wasserklinge"
L["Defeat Satay Byu"] = "Bezwingt Satay Byu"
L["Defence Point"] = "Verteidigungspunkt"
-- L["Demon Invasion"] = ""
L["Den Mother Moof"] = "Höhlenmutter Muuf"
L["Docking"] = "Andocken"
L["Door"] = "Tür"
L["East Statue"] = "Östliche Statue"
L["Echo of Y'Sharrj"] = "Echo von Y'Sharrj"
L["Farastu"] = "Farastu"
L["Final Stage"] = "Letzte Phase"
L["Flame Hound"] = "Flammenhund"
L["General Nazgrim"] = "General Nazgrim"
L["God-Hulk Gulkan"] = "Gottkoloss Gulkan"
L["Grizzle Gearslip"] = "Grizzle Radflutsch"
L["Gul'dan"] = "Gul'dan"
L["Hekima the Wise"] = "Hekima der Weise"
L["Highlord Tirion Fordring"] = "Hochlord Tirion Fordring"
L["High Marshal Twinbraid"] = "Hochmarschall Doppelzopf"
-- L["Horde's final stop"] = ""
L["Horde Ships"] = "Horde-Schiffe"
L["Jaina"] = "Jaina"
L["Jin Ironfist"] = "Jin Eisenfaust"
L["Joan Lorraine"] = "Joan Lorraine"
L["Karsar the Bloodletter"] = "Karsar der Blutvergießer"
L["King Varian Wrynn"] = "König Varian Wrynn"
L["Kor'kron Dire Soldier"] = "Terrorsoldat der Kor'kron"
-- L["Krosus"] = ""
L["Kyparite Quarry Sonic Control Towers"] = "Schallsteuerungstürme des Kyparitsteinbruchs"
L["Landing"] = "Landung"
L["Lever"] = "Hebel"
L["Lieutenant Blasthammer"] = "Leutnant Sprenghammer"
L["Lieutenant Boltblaster"] = "Leutnant Bolzenspreng"
L["Lieutenant Drak'on"] = "Leutnant Drak'on"
L["Lieutenant Fizzboil"] = "Leutnant Zischelzünd"
L["Lieutenant Fizzel"] = "Leutnant Zischel"
L["Lieutenant Fuseblast"] = "Leutnant Luntenschuss"
L["Lieutenant Parker"] = "Leutnant Parker"
L["Lieutenant Sparklighter"] = "Leutnant Zündfunken"
L["Li Te"] = "Li Te"
L["Mishka"] = "Mishka"
L["Norushen"] = "Norushen"
L["Overseer Elaglo"] = "Aufseher Elaglo"
L["Pandaria Artifacts"] = "Pandarianische Artefakte"
L["Pool of Life"] = "Teich des Lebens"
L["Pool Pony"] = "Poolpony"
-- L["Portal"] = ""
L["Proto-drake Eggs"] = "Protodracheneier"
L["Rak'gor Bloodrazor"] = "Rak'gor Blutklinge"
L["Rivett Clutchpop"] = "Nieti Kuppelplopp"
L["Rope Pile"] = "Seilhaufen"
L["Run to the top deck and swing away!"] = "Lauft aufs Oberdeck und schwingt Euch vom Schiff!"
L["Saurok Cave"] = "Saurok-Höhle"
L["Saurok Hatchery"] = "Saurok-Brutstätte"
L["Scenarios Maps"] = "Szenariokarten"
L["Scout Boldbrew"] = "Späherin Kühnbräu"
L["Scout Forgefellow"] = "Späher Schmiedebalg"
L["Scout Stonebeard"] = "Späher Steinbart"
L["Sealed Gate"] = "Versiegeltes Tor"
L["Shademaster Kiryn"] = "Schattenmeisterin Kiryn"
L["Shokia"] = "Shokia"
L["Squad Leader Bosh"] = "Schwadronsführer Bosh"
L["Stage 1"] = "Phase 1"
L["Stage 2"] = "Phase 2"
L["Stage 3"] = "Phase 3"
L["Stage 4"] = "Phase 4"
L["Stage 5"] = "Phase 5"
L["Stage 6"] = "Phase 6"
L["Stage 7"] = "Phase 7"
L["Steal Explosives"] = "Sprengladungen stehlen"
L["Sully \"The Pickle\" McLeary"] = "Sully \"Die Gurke\" McLeary"
L["Supply Crates"] = "Vorratskisten"
-- L["Sylvanas and Baine"] = ""
L["Tanks"] = "Panzer"
L["Tenwu of the Red Smoke"] = "Tenwu der Rote Rauch"
L["Thalen Songweaver"] = "Thalen Sangweber"
L["Thaumaturge Saresse"] = "Thaumaturgin Saresse"
L["The Flight MasterDP"] = "Die Flugmeisterin"
L["The Flight MasterLL"] = "Der Flugmeister"
L["The heart of ruined Theramore"] = "Herz der Ruinen von Theramore"
L["The Spring Drifter"] = "Die Frühlingsbummler"
L["Transport Cannon"] = "Transportkanone"
L["Traps"] = "Fallen"
L["Treasure Urn"] = "Schatzurne"
L["Urtharges the Destroyer"] = "Urtharges der Zerstörer"
L["Venomsting Pits Sonic Control Towers"] = "Schallsteuerungstürme der Giftstechergruben"
L["Vol'jin"] = "Vol'jin"
L["Warlord Bloodhilt"] = "Kriegsfürst Blutheft"
L["Wave One"] = "Welle eins"
L["Wave Three"] = "Welle drei"
L["Wave Two"] = "Welle zwei"
L["Weapons"] = "Waffen"
L["West Gate"] = "Westtor"
L["West Statue"] = "Westliche Statue"
L["Whispering Stones Sonic Control Towers"] = "Schallsteuerungstürme der Flüsternden Steine"
L["Wolf-Rider Gaja"] = "Wolfsreiterin Gaja"
L["ToC/Description"] = "Szenariokarten"
L["ToC/Title"] = "Atlas |r|cFF0099FF[Szenarien]|r"


end