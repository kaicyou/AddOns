-- $Id: Atlas_Transportation_DB.lua 29 2016-08-05 16:45:04Z arith $
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


local myDB = {
	TransAllianceBrokenIsles = {
		{ " A", 10038, 230, 357 }; --Greyfang Enclave
		{ " B", 10039, 237, 349 }; --Chamber of the Guardian
		{ " 1", 10001 , 249, 341 }; --Krasus' Landing
		{ " 2", 10002 , 151, 378 }; --Watchers' Aerie
		{ " 3", 10003 , 144, 363 }; --Wardens' Redoubt
		{ " 4", 10004 , 165, 336 }; --Shackle's Den
		{ " 5", 10005 , 130, 303 }; --Illidari Stand
		{ " 6", 10006 , 98, 314 }; --Illidari Perch
		{ " 7", 10007 , 191, 275 }; --Felblaze Ingress
		{ " 8", 10008 , 142, 273 }; --Azurewing Repose
		{ " 9", 10009 , 116, 238 }; --Challiane's Terrace
		{ "10", 10010, 222, 450 }; --Eye of Azshara
		{ "11", 10011, 147, 197 }; --Lorlathil
		{ "12", 10012, 75, 185 }; --Gloaming Reef
		{ "13", 10013, 117, 175 }; --Bradensbrook
		{ "14", 10014, 149, 177 }; --Garden of the Moon
		{ "15", 10015, 183, 163 }; --Starsong Refuge
		{ " 1", 10100, 110, 112 }; --The Dreamgrove
		{ "16", 10016, 246, 164 }; --Obsidian Overlook
		{ "17", 10017, 277, 164 }; --Ironhorn Enclave
		{ "18", 10018, 210, 126 }; --Sylvan Falls
		{ "19", 10019, 244, 116 }; --Thunder Totem
		{ "20", 10020, 286, 128 }; --Stonehoof Watch
		{ "21", 10021, 224, 97 }; --Nesingwary
		{ "22", 10022, 263, 84 }; --Skyhorn
		{ "23", 10023, 191, 68 }; --Felbane Camp
		{ "24", 10024, 217, 67 }; --The Witchwood
		{ "25", 10025, 279, 51 }; --Prepfoot
		{ "26", 10026, 228, 12 }; --Shipwreck Cove
		{ "27", 10027, 297, 152 }; --Skyfire Triage Camp (A)
		{ "28", 10028, 318, 176 }; --Lorna's Watch (A)
		{ "29", 10029, 344, 127 }; --Stormtorn Foothills
		{ "30", 10030, 369, 154 }; --Valdisdall
		{ "31", 10031, 404, 171 }; --Greywatch (A)
		{ "32", 10032, 442, 83 }; --Shield's Rest
		{ "33", 10033, 353, 223 }; --Hafr Fjall
		{ "34", 10034, 205, 198 }; --Irongrove Retreat
		{ "35", 10035, 225, 227 }; --Meredil
		{ "36", 10036, 291, 212 }; --Crimson Thicket
		{ "37", 10037, 301, 321 }; --Illidari Camp
	};
	TransHordeBrokenIsles = {
		{ " A", 10038, 239, 336 }; --Windrunner's Sanctuary
		{ " B", 10039, 237, 348 }; --Chamber of the Guardian
		{ " 1", 10001, 249, 342 }; --Krasus' Landing
		{ " 2", 10002 , 151, 378 }; --Watchers' Aerie
		{ " 3", 10003 , 144, 363 }; --Wardens' Redoubt
		{ " 4", 10004 , 165, 336 }; --Shackle's Den
		{ " 5", 10005 , 130, 303 }; --Illidari Stand
		{ " 6", 10006 , 98, 314 }; --Illidari Perch
		{ " 7", 10007 , 191, 275 }; --Felblaze Ingress
		{ " 8", 10008 , 142, 273 }; --Azurewing Repose
		{ " 9", 10009 , 116, 238 }; --Challiane's Terrace
		{ "10", 10010, 222, 450 }; --Eye of Azshara
		{ "11", 10011, 147, 197 }; --Lorlathil
		{ "12", 10012, 75, 185 }; --Gloaming Reef
		{ "13", 10013, 117, 175 }; --Bradensbrook
		{ "14", 10014, 149, 177 }; --Garden of the Moon
		{ "15", 10015, 183, 163 }; --Starsong Refuge
		{ " 1", 10100, 110, 112 }; --The Dreamgrove
		{ "16", 10016, 246, 164 }; --Obsidian Overlook
		{ "17", 10017, 277, 164 }; --Ironhorn Enclave
		{ "18", 10018, 210, 126 }; --Sylvan Falls
		{ "19", 10019, 244, 116 }; --Thunder Totem
		{ "20", 10020, 286, 128 }; --Stonehoof Watch
		{ "21", 10021, 224, 97 }; --Nesingwary
		{ "22", 10022, 263, 84 }; --Skyhorn
		{ "23", 10023, 191, 68 }; --Felbane Camp
		{ "24", 10024, 217, 67 }; --The Witchwood
		{ "25", 10025, 279, 51 }; --Prepfoot
		{ "26", 10026, 228, 12 }; --Shipwreck Cove
		{ "27", 10027, 311, 122 }; --Forsaken Foothold (H)
		{ "28", 10028, 327, 169 }; --Cullen's Post (H)
		{ "29", 10029, 344, 127 }; --Stormtorn Foothills
		{ "30", 10030, 369, 154 }; --Valdisdall
		{ "31", 10031, 355, 191 }; --Dreadwake's Landing (H)
		{ "32", 10032, 442, 83 }; --Shield's Rest
		{ "33", 10033, 353, 223 }; --Hafr Fjall
		{ "34", 10034, 205, 198 }; --Irongrove Retreat
		{ "35", 10035, 225, 227 }; --Meredil
		{ "36", 10036, 291, 212 }; --Crimson Thicket
		{ "37", 10037, 301, 321 }; --Illidari Camp
	};
	TransAllianceDraenor = {
		{ "A", 10052, 278, 259 }; -- Khadgar's Tower
		{ "A'", 10053, 450, 10 }; -- Darnassus
		{ "B'", 10054, 494, 60 }; -- Ironforge
		{ "C'", 10055, 493, 136 }; -- Stormwind City
		{ "1", 10001, 307, 302 }; -- Lunarfall
		{ "2", 10002, 337, 314 }; -- Exile's Rise
		{ "3", 10003, 338, 331 }; -- Embaari Village
		{ "4", 10004, 367, 339 }; -- Path of Light
		{ "5", 10005, 365, 320 }; -- Elodor
		{ "6", 10006, 389, 345 }; -- Tranquil Court
		{ "7", 10007, 365, 356 }; -- The Draakorium
		{ "8", 10008, 328, 355 }; -- Twilight Glade
		{ "9", 10009, 337, 382 }; -- Socrethar's Rise
		{ "10", 10010, 367, 393 }; -- Darktide Roost
		{ "11", 10011, 288, 337 }; -- Akeeta's Hovel
		{ "12", 10012, 283, 288 }; -- Anchorite's Sojourn
		{ "13", 10013, 260, 292 }; -- Terokkar Refuge
		{ "14", 10014, 229, 305 }; -- Exarch's Refuge
		{ "15", 10015, 210, 316 }; -- Retribution Point
		{ "16", 10016, 224, 274 }; -- Shattrath City
		{ "17", 10017, 245, 251 }; -- Redemption Rise
		{ "18", 10018, 260, 245 }; -- Fort Wrynn
		{ "19", 10019, 275, 248 }; -- Zangarra
		{ "20", 10020, 271, 218 }; -- Bastion Rise
		{ "21", 10021, 273, 190 }; -- Deeproot
		{ "22", 10022, 290, 165 }; -- Highpass
		{ "23", 10023, 317, 155 }; -- Wildwood Wash
		{ "24", 10024, 299, 139 }; -- Everbloom Wilds
		{ "25", 10025, 331, 109 }; -- Everbloom Overlook
		{ "26", 10026, 273, 152 }; -- Breaker's Crown
		{ "27", 10027, 259, 120 }; -- Skysea Point
		{ "28", 10028, 266, 95 }; -- Iron Docks
		{ "29", 10029, 237, 349 }; -- Apexis Excavation
		{ "30", 10030, 245, 395 }; -- Southport
		{ "31", 10031, 254, 372 }; -- Veil Terokk
		{ "32", 10032, 261, 355 }; -- Crow's Crook
		{ "33", 10033, 284, 370 }; -- Talon Watch
		{ "34", 10034, 281, 412 }; -- Pinchwhistle Gearworks
		{ "35", 10035, 171, 258 }; -- The Ring of Trials
		{ "36", 10036, 136, 278 }; -- Telaari Station
		{ "37", 10037, 111, 293 }; -- Nivek's Overlook
		{ "38", 10038, 138, 254 }; -- Yrel's Watch
		{ "39", 10039, 117, 240 }; -- Rilzit's Holdfast
		{ "40", 10040, 134, 239 }; -- Joz's Rylaks
		{ "41", 10041, 155, 237 }; -- Throne of the Elements
		{ "42", 10042, 243, 187 }; -- Iron Siegeworks
		{ "43", 10043, 177, 128 }; -- Bloodmaul Slag Mines
		{ "44", 10044, 431, 242 }; -- Stormshield
		{ "45", 10045, 279, 233 }; -- The Iron Front
		{ "46", 10046, 301, 244 }; -- Sha'naari Refuge
		{ "47", 10047, 335, 249 }; -- Malo's Lookout
		{ "48", 10048, 353, 240 }; -- Lion's Watch
		{ "49", 10049, 300, 221 }; -- Aktar's Post
		{ "50", 10050, 330, 223 }; -- Vault of the Earth
		{ "51", 10051, 352, 207 }; -- Throne of Kil'jaeden
	};
	TransHordeDraenor = {
		{ "A", 10051, 283, 260 }; -- Khadgar's Tower
		{ "A'", 10052, 488, 118 }; -- Orgrimmar
		{ "B'", 10053, 489, 245 }; -- Thunder Bluff
		{ "C'", 10054, 378, 4 }; -- Undercity
		{ "1", 10001, 171, 185 }; -- Frostwall Garrison
		{ "2", 10002, 120, 170 }; -- Wor'gol
		{ "3", 10003, 132, 148 }; -- Bladespire Fortress
		{ "4", 10004, 152, 165 }; -- Stonefang Outpost
		{ "5", 10005, 138, 116 }; -- Throm'Var
		{ "6", 10006, 177, 150 }; -- Darkspear's Edge
		{ "7", 10007, 178, 126 }; -- Bloodmaul Slag Mines
		{ "8", 10008, 219, 175 }; -- Wolf's Stand
		{ "9", 10009, 238, 173 }; -- Thunder Pass
		{ "10", 10010, 259, 208 }; -- Evermorn Springs
		{ "11", 10011, 274, 219 }; -- Bastion Rise
		{ "12", 10012, 277, 176 }; -- Beastwatch
		{ "13", 10013, 272, 151 }; -- Breaker's Crown
		{ "14", 10014, 259, 119 }; -- Skysea Point
		{ "15", 10015, 267, 91 }; -- Iron Docks
		{ "16", 10016, 308, 144 }; -- Everbloom Wilds
		{ "17", 10017, 331, 107 }; -- Everbloom Overlook
		{ "18", 10018, 277, 249 }; -- Zangarra
		{ "19", 10019, 262, 256 }; -- Vol'jin's Pride
		{ "20", 10020, 250, 233 }; -- Frostwolf Overlook
		{ "21", 10021, 235, 273 }; -- Durotan's Grasp
		{ "22", 10022, 219, 275 }; -- Shattrath City
		{ "23", 10023, 261, 293 }; -- Terokkar Refuge
		{ "24", 10024, 227, 306 }; -- Exarch's Refuge
		{ "25", 10025, 212, 315 }; -- Retribution Point
		{ "26", 10026, 245, 349 }; -- Apexis Excavation
		{ "27", 10027, 269, 360 }; -- Crow's Crook
		{ "28", 10028, 242, 375 }; -- Axefall
		{ "29", 10029, 262, 373 }; -- Veil Terokk
		{ "30", 10030, 284, 369 }; -- Talon Watch
		{ "31", 10031, 281, 409 }; -- Pinchwhistle Gearworks
		{ "32", 10032, 173, 258 }; -- Wor'var
		{ "33", 10033, 161, 268 }; -- The Ring of Trials
		{ "34", 10034, 156, 235 }; -- Throne of the Elements
		{ "35", 10035, 135, 242 }; -- Joz's Rylaks
		{ "36", 10036, 119, 240 }; -- Rilzit's Holdfast
		{ "37", 10037, 114, 266 }; -- Riverside Post
		{ "38", 10038, 113, 294 }; -- Nivek's Overlook
		{ "39", 10039, 288, 336 }; -- Akeeta's Hovel
		{ "40", 10040, 343, 312 }; -- Exile's Rise
		{ "41", 10041, 332, 382 }; -- Socrethar's Rise
		{ "42", 10042, 366, 392 }; -- Darktide Roost
		{ "43", 10043, 436, 196 }; -- Warspear
		{ "44", 10044, 279, 238 }; -- The Iron Front
		{ "45", 10045, 302, 244 }; -- Sha'naari Refuge
		{ "46", 10046, 334, 249 }; -- Vault of the Earth
		{ "47", 10047, 361, 227 }; -- Vol'mar
		{ "48", 10048, 300, 222 }; -- Aktar's Post
		{ "49", 10049, 331, 224 }; -- Malo's Lookout
		{ "50", 10001, 349, 207 }; -- Throne of Kil'jaeden
	};
	TransAllianceAshran = {
		{ "A", 10001, 153, 331 };
		{ "B", 10002, 187, 305 };
		{ "C", 10003, 258, 333 };
		{ "D", 10004, 306, 299 };
		{ "E", 10005, 328, 379 };
	};
	TransHordeAshran = {
		{ "A", 10001, 205, 135 };
		{ "B", 10002, 252, 169 };
		{ "C", 10003, 240, 98 };
		{ "D", 10004, 313, 91 };
		{ "E", 10005, 289, 202 };
	};
--[[
	TransAllianceEast = {
		{ "A'", 10001, x, y }; -- Valgarde
		{ "B'", 10001, x, y }; -- Valiance Keep
		{ "C'", 10001, x, y }; -- Rut'theran Village
		{ "D'", 10001, x, y }; -- Ratchet
		{ "E'", 10001, x, y }; -- Theramore
		{ "A", 10001, x, y }; -- Baradin Base Camp
		{ "B", 10001, x, y }; -- Baradin Hold
		{ "C", 10001, x, y }; -- Highbank
		{ "D", 10001, x, y }; -- Fuselight-by-the-Sea
		{ "A'", 10001, x, y }; -- Eventide Landing
		{ "B'", 10001, x, y }; -- Nordrassil
		{ "C'", 10001, x, y }; -- Ramkahen
		{ "D'", 10001, x, y }; -- The Stair of Destiny
		{ "E'", 10001, x, y }; -- Temple of Earth
		{ "F'", 10001, x, y }; -- Darkmoon Island
		{ "G'", 10001, x, y }; -- Paw'Don Village
		{ "1", 10001, x, y }; -- Shattered Sun Staging Area
		{ "2", 10001, x, y }; -- Zul'Aman
		{ "3", 10001, x, y }; -- Acherus: The Ebon Hold
		{ "4", 10001, x, y }; -- Light's Hope Chapel
		{ "5", 10001, x, y }; -- Eastwall Tower
		{ "6", 10001, x, y }; -- Northpass Tower
		{ "7", 10001, x, y }; -- Plaguewood Tower
		{ "8", 10001, x, y }; -- Light's Shield Tower
		{ "9", 10001, x, y }; -- Crown Guard Tower
		{ "10", 10001, x, y }; -- Thondroril River
		{ "11", 10001, x, y }; -- Hearthglen
		{ "12", 10001, x, y }; -- The Menders' Stead
		{ "13", 10001, x, y }; -- Andorhal
		{ "14", 10001, x, y }; -- Chillwind Camp
		{ "15", 10001, x, y }; -- Aerie Peak
		{ "16", 10001, x, y }; -- Stormfeather Outpost
		{ "17", 10001, x, y }; -- Refuge Pointe
		{ "18", 10001, x, y }; -- Dun Modr
		{ "19", 10001, x, y }; -- Whelgar's Retreat
		{ "20", 10001, x, y }; -- Greenwarden's Grove
		{ "21", 10001, x, y }; -- Menethil Harbor
		{ "22", 10001, x, y }; -- Slabchisel's Survey
		{ "23", 10001, x, y }; -- Vermillion Redoubt
		{ "24", 10001, x, y }; -- Thundermar
		{ "25", 10001, x, y }; -- Kirthaven
		{ "26", 10001, x, y }; -- Victor's Point
		{ "27", 10001, x, y }; -- Firebeard's Patrol
		{ "28", 10001, x, y }; -- Highbank
		{ "29", 10001, x, y }; -- Ironforge
		{ "30", 10001, x, y }; -- Kharanos
		{ "31", 10001, x, y }; -- Gol'Bolar Quarry
		{ "32", 10001, x, y }; -- Thelsamar
		{ "33", 10001, x, y }; -- Farstrider Lodge
		{ "34", 10001, x, y }; -- Thorium Point
		{ "35", 10001, x, y }; -- Iron Summit
		{ "36", 10001, x, y }; -- Dragon's Mouth
		{ "37", 10001, x, y }; -- Dustwind Dig
		{ "38", 10001, x, y }; -- Fuselight
		{ "39", 10001, x, y }; -- Chiselgrip
		{ "40", 10001, x, y }; -- Morgan's Vigil
		{ "41", 10001, x, y }; -- Flamestar Post
		{ "42", 10001, x, y }; -- Terror Wing Path
		{ "43", 10001, x, y }; -- Stormwind
		{ "44", 10001, x, y }; -- Goldshire
		{ "45", 10001, x, y }; -- Eastvale Logging Camp
		{ "46", 10001, x, y }; -- Lakeshire
		{ "47", 10001, x, y }; -- Camp Everstill
		{ "48", 10001, x, y }; -- Shalewind Canyon
		{ "49", 10001, x, y }; -- Furlbrow's Pumpkin Farm
		{ "50", 10001, x, y }; -- Moonbrook
		{ "51", 10001, x, y }; -- Sentinel Hill
		{ "52", 10001, x, y }; -- Raven Hill
		{ "53", 10001, x, y }; -- Darkshire
		{ "54", 10001, x, y }; -- The Harborage
		{ "55", 10001, x, y }; -- Marshtide Watch
		{ "56", 10001, x, y }; -- Bogpaddle
		{ "57", 10001, x, y }; -- Rebel Camp
		{ "58", 10001, x, y }; -- Fort Livingston
		{ "59", 10001, x, y }; -- Explorers' League Digsite
		{ "60", 10001, x, y }; -- Booty Bay
		{ "61", 10001, x, y }; -- Nethergarde Keep
		{ "62", 10001, x, y }; -- Shattered Beachhead
		{ "63", 10001, x, y }; -- Surwich
		{ "64", 10001, x, y }; -- Smuggler's Scar
		{ "65", 10001, x, y }; -- Sandy Beach
		{ "66", 10001, x, y }; -- Silver Tide Hollow
		{ "67", 10001, x, y }; -- Tranquil Wash
		{ "68", 10001, x, y }; -- Voldrin's Hold
		{ "69", 10001, x, y }; -- Darkbreak Cove
	};
]]
	TransAllianceStormwindCity = {
		{ "A", 10001, 59, 278 }; -- Rut'theran Village
		{ "B", 10002, 31, 142 }; -- Valiance Keep
		{ "A", 10003, 231, 422 }; -- The Stair of Destiny
		{ "B", 10004, 239, 412 }; -- Fuselight-by-the-Sea
		{ "C", 10005, 364, 109 }; -- Paw'Don Village
		{ "D", 10006, 394, 115 }; -- Baradin Base Camp
		{ "E", 10007, 399, 106 }; -- Darkbreak Cove
		{ "F", 10008, 414, 102 }; -- Highbank
		{ "G", 10009, 418, 114 }; -- Nordrassil
		{ "H", 10010, 413, 121 }; -- Ramkahen
		{ "I", 10011, 401, 124 }; -- Temple of Earth
		{ "J", 10012, 493, 187 }; -- Stormshield
		{ "1", 10013, 365, 361 }; -- Stormwind City
		{ "2", 10014, 353, 187 }; -- Ironforge
	};
--[[
	TransAllianceWest = {
		{ "A", 10001, x, y }; -- Valaar's Berth
		{ "A'", 10001, x, y }; -- Stormwind Harbor
		{ "B'", 10001, x, y }; -- Menethil Harbor
		{ "C'", 10001, x, y }; -- Booty Bay
		{ "3", 10001, x, y }; -- Rut'theran Village
		{ "A", 10001, x, y }; -- Shaper's Terrace
		{ "B", 10001, x, y }; -- Nordune Ridge
		{ "A'", 10001, x, y }; -- Waygate
		{ " B'", 10001, x, y }; -- Molten Front
		{ "C'", 10001, x, y }; -- Stormwind City
		{ "D'", 10001, x, y }; -- The Stair of Destiny
		{ " 1", 10001, x, y }; -- Dolanaar
		{ " 2", 10001, x, y }; -- Darnassus
		{ " 3", 10001, x, y }; -- Rut'theran Village
		{ " 4", 10001, x, y }; -- Azure Watch
		{ " 5", 10001, x, y }; -- The Exodar
		{ " 6", 10001, x, y }; -- Blood Watch
		{ " 7", 10001, x, y }; -- Lor'danel
		{ " 8", 10001, x, y }; -- Grove of the Ancients
		{ " 9", 10001, x, y }; -- Blackfathom Camp
		{ "10", 10001, x, y }; -- Astranaar
		{ "11", 10001, x, y }; -- Forest Song
		{ "12", 10001, x, y }; -- Stardust Spire
		{ "13", 10001, x, y }; -- Windshear Hold
		{ "14", 10001, x, y }; -- Mirkfallon Post
		{ "15", 10001, x, y }; -- Thal'darah Overlook
		{ "16", 10001, x, y }; -- Farwatcher's Glen
		{ "17", 10001, x, y }; -- Northwatch Expedition Base Camp
		{ "18", 10001, x, y }; -- Nijel's Point
		{ "19", 10001, x, y }; -- Thunk's Abode
		{ "20", 10001, x, y }; -- Karnum's Glade
		{ "21", 10001, x, y }; -- Ethel Rethor
		{ "22", 10001, x, y }; -- Thargad's Camp
		{ "23", 10001, x, y }; -- Dreamer's Rest
		{ "24", 10001, x, y }; -- Feathermoon
		{ "25", 10001, x, y }; -- Ruins of Feathermoon
		{ "26", 10001, x, y }; -- Tower of Estulan
		{ "27", 10001, x, y }; -- Shadebough
		{ "28", 10001, x, y }; -- Ratchet
		{ "29", 10001, x, y }; -- Honor's Stand
		{ "30", 10001, x, y }; -- Northwatch Hold
		{ "31", 10001, x, y }; -- Fort Triumph
		{ "32", 10001, x, y }; -- Theramore
		{ "33", 10001, x, y }; -- Mudsprocket
		{ "34", 10001, x, y }; -- Fizzle & Pozzik's Speedbarge
		{ "35", 10001, x, y }; -- Gadgetzan
		{ "36", 10001, x, y }; -- Bootlegger Outpost
		{ "37", 10001, x, y }; -- Gunstan's Dig
		{ "38", 10001, x, y }; -- Marshal's Stand
		{ "39", 10001, x, y }; -- Mossy Pile
		{ "40", 10001, x, y }; -- Cenarion Hold
		{ "41", 10001, x, y }; -- Emerald Sanctuary
		{ "42", 10001, x, y }; -- Wildheart Point
		{ "43", 10001, x, y }; -- Whisperwind Grove
		{ "44", 10001, x, y }; -- Talonbranch Glade
		{ "45", 10001, x, y }; -- Moonglade
		{ "46", 10001, x, y }; -- Nighthaven
		{ "47", 10001, x, y }; -- Everlook
		{ "48", 10001, x, y }; -- Nordrassil
		{ "49", 10001, x, y }; -- Shrine of Aviana
		{ "50", 10001, x, y }; -- Shrine of Aessina
		{ "51", 10001, x, y }; -- Sanctuary of Malorne
		{ "52", 10001, x, y }; -- Gates of Sothann
		{ "53", 10001, x, y }; -- Ramkahen
		{ "54", 10001, x, y }; -- Schnottz's Landing
		{ "55", 10001, x, y }; -- Oasis of Vir'sar
	};
	TransHordeEast = {
		{ "A'", 10001, x, y }; -- Vengeance Landing
		{ "B'", 10001, x, y }; -- Orgrimmar
		{ "C'", 10001, x, y }; -- Ratchet
		{ "19", 10001, x, y }; -- Brill
		{ "54", 10001, x, y }; -- Grom'gol Base Camp
		{ "56", 10001, x, y }; -- Booty Bay
		{ "A", 10001, x, y }; -- Hellscream's Grasp
		{ "B", 10001, x, y }; -- Baradin Hold
		{ "C", 10001, x, y }; -- Dragonmaw Port
		{ "D", 10001, x, y }; -- Fuselight-by-the-Sea
		{ "A'", 10001, x, y }; -- The Stair of Destiny
		{ "B'", 10001, x, y }; -- Orgrimmar
		{ BLUE..BZ["Isle of Quel'Danas"] };
		{ " 1", 10001, x, y }; -- Shattered Sun Staging Area
		{ " 2", 10001, x, y }; -- Falconwing Square
		{ " 3", 10001, x, y }; -- Silvermoon City
		{ " 4", 10001, x, y }; -- Fairbreeze Village
		{ " 5", 10001, x, y }; -- Tranquillien
		{ " 6", 10001, x, y }; -- Zul'Aman
		{ "7", 10001, x, y }; -- Acherus: The Ebon Hold
		{ " 8", 10001, x, y }; -- Light's Hope Chapel
		{ " 9", 10001, x, y }; -- Northpass Tower
		{ "10", 10001, x, y }; -- Plaguewood Tower
		{ "11", 10001, x, y }; -- Eastwall Tower
		{ "12", 10001, x, y }; -- Light's Shield Tower
		{ "13", 10001, x, y }; -- Crown Guard Tower
		{ "14", 10001, x, y }; -- Thondroril River
		{ "15", 10001, x, y }; -- The Menders' Stead
		{ "16", 10001, x, y }; -- Hearthglen
		{ "17", 10001, x, y }; -- Andorhal
		{ "18", 10001, x, y }; -- The Bulwark
		{ "19", 10001, x, y }; -- Brill
		{ "20", 10001, x, y }; -- Undercity
		{ "21", 10001, x, y }; -- Forsaken High Command
		{ "22", 10001, x, y }; -- Forsaken Rear Guard
		{ "23", 10001, x, y }; -- The Sepulcher
		{ "24", 10001, x, y }; -- The Forsaken Front
		{ "25", 10001, x, y }; -- Southpoint Gate
		{ "26", 10001, x, y }; -- Ruins of Southshore
		{ "27", 10001, x, y }; -- Eastpoint Tower
		{ "28", 10001, x, y }; -- Tarren Mill
		{ "29", 10001, x, y }; -- Strahnbrad
		{ "30", 10001, x, y }; -- Galen's Fall
		{ "31", 10001, x, y }; -- Hammerfall
		{ "32", 10001, x, y }; -- Hiri'watha Research Station
		{ "33", 10001, x, y }; -- Revantusk Village
		{ "34", 10001, x, y }; -- Vermillion Redoubt
		{ "35", 10001, x, y }; -- The Gullet
		{ "36", 10001, x, y }; -- Bloodgulch
		{ "37", 10001, x, y }; -- The Krazzworks
		{ "38", 10001, x, y }; -- Dragonmaw Port
		{ "39", 10001, x, y }; -- Crushblow
		{ "40", 10001, x, y }; -- Fuselight
		{ "41", 10001, x, y }; -- Bloodwatcher Point
		{ "42", 10001, x, y }; -- New Kargath
		{ "43", 10001, x, y }; -- Thorium Point
		{ "44", 10001, x, y }; -- Iron Summit
		{ "45", 10001, x, y }; -- Flame Crest
		{ "46", 10001, x, y }; -- Chiselgrip
		{ "47", 10001, x, y }; -- Flamestar Post
		{ "48", 10001, x, y }; -- Terror Wing Path
		{ "49", 10001, x, y }; -- Bogpaddle
		{ "50", 10001, x, y }; -- Stonard
		{ "51", 10001, x, y }; -- Dreadmaul Hold
		{ "52", 10001, x, y }; -- Shattered Landing
		{ "53", 10001, x, y }; -- Sunveil Excursion
		{ "54", 10001, x, y }; -- Bambala
		{ "55", 10001, x, y }; -- Grom'gol Base Camp
		{ "56", 10001, x, y }; -- Hardwrench Hideaway
		{ "57", 10001, x, y }; -- Booty Bay
		{ "58", 10001, x, y }; -- Smuggler's Scar
		{ "59", 10001, x, y }; -- Sandy Beach
		{ "60", 10001, x, y }; -- Silver Tide Hollow
		{ "61", 10001, x, y }; -- Legion's Rest
		{ "62", 10001, x, y }; -- Stygian Bounty
		{ "63", 10001, x, y }; -- Tenebrous Cavern
	};
	TransHordeWest = {
		{ "A'", 10001, x, y }; -- Warsong Hold
		{ "B'", 10001, x, y }; -- Undercity
		{ "C'", 10001, x, y }; -- Grom'gol Base Camp
		{ "D'", 10001, x, y }; -- Booty Bay
		{ "A", 10001, x, y }; -- Shaper's Terrace
		{ "B", 10001, x, y }; -- Nordune Ridge
		{ "A'", 10001, x, y }; -- Waygate
		{ " B'", 10001, x, y }; -- Molten Front
		{ "C'", 10001, x, y }; -- Temple of Earth
		{ "D'", 10001, x, y }; -- Hellscream's Grasp
		{ "E'", 10001, x, y }; -- Vashj'ir
		{ "F'", 10001, x, y }; -- Dragonmaw Port
		{ "G'", 10001, x, y }; -- The Stair of Destiny
		{ "H'", 10001, x, y }; -- Honeydew Village
		{ "I'", 10001, x, y }; -- Shattered Landing
		{ " J'", 10001, x, y }; -- Darkmoon Island
		{ "K'", 10001, x, y }; -- Glacier Bay
		{ " 1", 10001, x, y }; -- Bloodhoof Village
		{ " 2", 10001, x, y }; -- Thunder Bluff
		{ " 3", 10001, x, y }; -- Sen'jin Village
		{ " 4", 10001, x, y }; -- Razor Hill
		{ " 5", 10001, x, y }; -- Orgrimmar
		{ " 6", 10001, x, y }; -- Valormok
		{ " 7", 10001, x, y }; -- Southern Rocketway
		{ " 8", 10001, x, y }; -- Bilgewater Harbor
		{ " 9", 10001, x, y }; -- Northern Rocketway
		{ "10", 10001, x, y }; -- Nozzlepot's Outpost
		{ "11", 10001, x, y }; -- Crossroads
		{ "12", 10001, x, y }; -- Ratchet
		{ "13", 10001, x, y }; -- The Mor'Shan Ramparts
		{ "14", 10001, x, y }; -- Splintertree Post
		{ "15", 10001, x, y }; -- Silverwind Refuge
		{ "16", 10001, x, y }; -- Hellscream's Watch
		{ "17", 10001, x, y }; -- Zoram'gar Outpost
		{ "18", 10001, x, y }; -- Cliffwalker Post
		{ "19", 10001, x, y }; -- The Sludgewerks
		{ "20", 10001, x, y }; -- Sun Rock Retreat
		{ "21", 10001, x, y }; -- Krom'gar Fortress
		{ "22", 10001, x, y }; -- Malaka'jin
		{ "23", 10001, x, y }; -- Thunk's Abode
		{ "24", 10001, x, y }; -- Karnum's Glade
		{ "25", 10001, x, y }; -- Furien's Post
		{ "26", 10001, x, y }; -- Ethel Rethor
		{ "27", 10001, x, y }; -- Shadowprey Village
		{ "28", 10001, x, y }; -- Hunter's Hill
		{ "29", 10001, x, y }; -- Vendetta Point
		{ "30", 10001, x, y }; -- Desolation Hold
		{ "31", 10001, x, y }; -- Brackenwall Village
		{ "32", 10001, x, y }; -- Mudsprocket
		{ "33", 10001, x, y }; -- Camp Ataya
		{ "34", 10001, x, y }; -- Stonemaul Hold
		{ "35", 10001, x, y }; -- Camp Mojache
		{ "36", 10001, x, y }; -- Westreach Summit
		{ "37", 10001, x, y }; -- Fizzle & Pozzik's Speedbarge
		{ "38", 10001, x, y }; -- Gadgetzan
		{ "39", 10001, x, y }; -- Bootlegger Outpost
		{ "40", 10001, x, y }; -- Dawnrise Expedition
		{ "41", 10001, x, y }; -- Marshal's Stand
		{ "42", 10001, x, y }; -- Mossy Pile
		{ "43", 10001, x, y }; -- Cenarion Hold
		{ "44", 10001, x, y }; -- Emerald Sanctuary
		{ "45", 10001, x, y }; -- Wildheart Point
		{ "46", 10001, x, y }; -- Whisperwind Grove
		{ "47", 10001, x, y }; -- Irontree Clearing
		{ "48", 10001, x, y }; -- Moonglade
		{ "49", 10001, x, y }; -- Nighthaven
		{ "50", 10001, x, y }; -- Everlook
		{ "51", 10001, x, y }; -- Nordrassil
		{ "52", 10001, x, y }; -- Shrine of Aviana
		{ "53", 10001, x, y }; -- Shrine of Aessina
		{ "54", 10001, x, y }; -- Sanctuary of Malorne
		{ "55", 10001, x, y }; -- Gates of Sothann
		{ "56", 10001, x, y }; -- Ramkahen
		{ "57", 10001, x, y }; -- Schnottz's Landing
		{ "58", 10001, x, y }; -- Oasis of Vir'sar
	};
]]
	TransHordeOrgrimmar = {
		{ "A", 10001, 203, 310 }; -- Shattered Landing
		{ "B", 10002, 104, 350 }; -- The Stair of Destiny
		{ "B", 10002, 173, 298 }; -- The Stair of Destiny
		{ "C", 10003, 203, 185 }; -- Hellscream's Grasp
		{ "D", 10004, 216, 178 }; -- Ramkahen
		{ "E", 10005, 218, 165 }; -- Vashj'ir
		{ "F", 10006, 231, 162 }; -- Temple of Earth
		{ "G", 10007, 235, 175 }; -- Nordrassil
		{ "H", 10008, 228, 186 }; -- Dragonmaw Port
		{ "I", 10009, 380, 190 }; -- Honeydew Village
		{ "J", 10010, 208, 363 }; -- Warspear
		{ "A", 10011, 168, 321 }; -- Thunder Bluff
		{ "B", 10012, 182, 310 }; -- Warsong Hold
		{ "C", 10013, 234, 273 }; -- Undercity
		{ "D", 10014, 245, 261 }; -- Grom'gol Base Camp
		{ "1", 10015, 221, 294 }; -- Orgrimmar
	};
--[[
	TransAllianceOutland = {
		{ "A'", 10001, x, y }; -- Stormwind City
		{ "B'", 10001, x, y }; -- The Stair of Destiny
		{ "C'", 10001, x, y }; -- Sun's Reach Sanctum
		{ "D'", 10001, x, y }; -- Caverns of Time
		{ " 1", 10001, x, y }; -- The Stair of Destiny
		{ " 2", 10001, x, y }; -- Shatter Point
		{ " 3", 10001, x, y }; -- Honor Point
		{ " 4", 10001, x, y }; -- Honor Hold
		{ " 5", 10001, x, y }; -- Temple of Telhamat
		{ " 6", 10001, x, y }; -- Telredor
		{ " 7", 10001, x, y }; -- Orebor Harborage
		{ " 8", 10001, x, y }; -- Telaar
		{ " 9", 10001, x, y }; -- Shattrath City
		{ "10", 10001, x, y }; -- Allerian Stronghold
		{ "11", 10001, x, y }; -- Blackwind Landing
		{ "12", 10001, x, y }; -- Wildhammer Stronghold
		{ "13", 10001, x, y }; -- Altar of Sha'tar
		{ "14", 10001, x, y }; -- Sanctum of the Stars
		{ "15", 10001, x, y }; -- Sylvanaar
		{ "16", 10001, x, y }; -- Evergrove
		{ "17", 10001, x, y }; -- Toshley's Station
		{ "18", 10001, x, y }; -- Skyguard Outpost
		{ "19", 10001, x, y }; -- Area 52
		{ "20", 10001, x, y }; -- The Stormspire
		{ "21", 10001, x, y }; -- Cosmowrench
	};
	TransHordeOutland = {
		{ "A'", 10001, x, y }; -- Orgrimmar
		{ "B'", 10001, x, y }; -- The Stair of Destiny
		{ "C'", 10001, x, y }; -- Sun's Reach Sanctum
		{ "D'", 10001, x, y }; -- Caverns of Time
		{ " 1", 10001, x, y }; -- The Stair of Destiny
		{ " 2", 10001, x, y }; -- Thrallmar
		{ " 3", 10001, x, y }; -- Spinebreaker Post
		{ " 4", 10001, x, y }; -- Falcon Watch
		{ " 5", 10001, x, y }; -- Swamprat Post
		{ " 6", 10001, x, y }; -- Zabra'jin
		{ " 7", 10001, x, y }; -- Garadar
		{ " 8", 10001, x, y }; -- Shattrath City
		{ " 9", 10001, x, y }; -- Stonebreaker Hold
		{ "10", 10001, x, y }; -- Blackwind Landing
		{ "11", 10001, x, y }; -- Shadowmoon Village
		{ "12", 10001, x, y }; -- Altar of Sha'tar
		{ "13", 10001, x, y }; -- Sanctum of the Stars
		{ "14", 10001, x, y }; -- Thunderlord Stronghold
		{ "15", 10001, x, y }; -- Evergrove
		{ "16", 10001, x, y }; -- Mok'Nathal Village
		{ "17", 10001, x, y }; -- Skyguard Outpost
		{ "18", 10001, x, y }; -- Area 52
		{ "19", 10001, x, y }; -- The Stormspire
		{ "20", 10001, x, y }; -- Cosmowrench
	};
	TransAllianceNorthrend = {
		{ "A'", 10001, x, y }; -- Stormwind City
		{ "B'", 10001, x, y }; -- Menethil Harbor
		{ "A", 10001, x, y }; -- Waygate
		{ "B", 10001, x, y }; -- Wintergrasp Fortress
		{ "C", 10001, x, y }; -- Violet Stand
		{ "D", 10001, x, y }; -- Garm's Rise
		{ "A'", 10001, x, y }; -- Shaper's Terrace
		{ "B'", 10001, x, y }; -- Caverns of Time
		{ "C'", 10001, x, y }; -- Stormwind City
		{ " 1", 10001, x, y }; -- Valiance Keep
		{ " 2", 10001, x, y }; -- Amber Ledge
		{ " 3", 10001, x, y }; -- Transitus Shield
		{ " 4", 10001, x, y }; -- Fizzcrank Airstrip
		{ " 5", 10001, x, y }; -- Unu'pe
		{ " 6", 10001, x, y }; -- Nesingwary Base Camp
		{ " 7", 10001, x, y }; -- River's Heart
		{ " 8", 10001, x, y }; -- Stars' Rest
		{ " 9", 10001, x, y }; -- Moa'ki Harbor
		{ "10", 10001, x, y }; -- Fordragon Hold
		{ "11", 10001, x, y }; -- Wyrmrest Temple
		{ "12", 10001, x, y }; -- Wintergarde Keep
		{ "13", 10001, x, y }; -- Westguard Keep
		{ "14", 10001, x, y }; -- Kamagua
		{ "15", 10001, x, y }; -- Valgarde
		{ "16", 10001, x, y }; -- Fort Wildervar
		{ "17", 10001, x, y }; -- Amberpine Lodge
		{ "18", 10001, x, y }; -- Westfall Brigade Encampment
		{ "19", 10001, x, y }; -- Gundrak
		{ "20", 10001, x, y }; -- Zim'Torga
		{ "21", 10001, x, y }; -- The Argent Stand
		{ "22", 10001, x, y }; -- Light's Breach
		{ "23", 10001, x, y }; -- Ebon Watch
		{ "24", 10001, x, y }; -- Windrunner's Overlook
		{ "25", 10001, x, y }; -- Dalaran
		{ "26", 10001, x, y }; -- Frosthold
		{ "27", 10001, x, y }; -- K3
		{ "28", 10001, x, y }; -- Bouldercrag's Refuge
		{ "29", 10001, x, y }; -- Ulduar
		{ "30", 10001, x, y }; -- Dun Niffelem
		{ "31", 10001, x, y }; -- The Argent Vanguard
		{ "32", 10001, x, y }; -- Crusaders' Pinnacle
		{ "33", 10001, x, y }; -- Argent Tournament Grounds
		{ "34", 10001, x, y }; -- The Shadow Vault
		{ "35", 10001, x, y }; -- Death's Rise
		{ "36", 10001, x, y }; -- Valiance Landing Camp
	};
	TransHordeNorthrend = {
		{ "A'", 10001, x, y }; -- Orgrimmar
		{ "B'", 10001, x, y }; -- Undercity
		{ _RED..AL["Portals"].." / "..BZ["Waygate"] };
		{ "A", 10001, x, y }; -- Waygate
		{ "B", 10001, x, y }; -- Wintergrasp Fortress
		{ "C", 10001, x, y }; -- Violet Stand
		{ "D", 10001, x, y }; -- Garm's Rise
		{ "A'", 10001, x, y }; -- Shaper's Terrace
		{ "B'", 10001, x, y }; -- Caverns of Time
		{ "C'", 10001, x, y }; -- Orgrimmar
		{ " 1", 10001, x, y }; -- Warsong Hold
		{ " 2", 10001, x, y }; -- Amber Ledge
		{ " 3", 10001, x, y }; -- Transitus Shield
		{ " 4", 10001, x, y }; -- Bor'gorok Outpost
		{ " 5", 10001, x, y }; -- Taunka'le Village
		{ " 6", 10001, x, y }; -- Unu'pe
		{ " 7", 10001, x, y }; -- Nesingwary Base Camp
		{ " 8", 10001, x, y }; -- River's Heart
		{ " 9", 10001, x, y }; -- Agmar's Hammer
		{ "10", 10001, x, y }; -- Moa'ki Harbor
		{ "11", 10001, x, y }; -- Kor'kron Vanguard
		{ "12", 10001, x, y }; -- Wyrmrest Temple
		{ "13", 10001, x, y }; -- Venomspite
		{ "14", 10001, x, y }; -- Kamagua
		{ "15", 10001, x, y }; -- New Agamand
		{ "16", 10001, x, y }; -- Vengeance Landing
		{ "17", 10001, x, y }; -- Apothecary Camp
		{ "18", 10001, x, y }; -- Camp Winterhoof
		{ "19", 10001, x, y }; -- Conquest Hold
		{ "20", 10001, x, y }; -- Camp Oneqwah
		{ "21", 10001, x, y }; -- Gundrak
		{ "22", 10001, x, y }; -- Zim'Torga
		{ "23", 10001, x, y }; -- The Argent Stand
		{ "24", 10001, x, y }; -- Light's Breach
		{ "25", 10001, x, y }; -- Ebon Watch
		{ "26", 10001, x, y }; -- Sunreaver's Command
		{ "27", 10001, x, y }; -- Dalaran
		{ "28", 10001, x, y }; -- K3
		{ "29", 10001, x, y }; -- Camp Tunka'lo
		{ "30", 10001, x, y }; -- Grom'arsh Crash-Site
		{ "31", 10001, x, y }; -- Bouldercrag's Refuge
		{ "32", 10001, x, y }; -- Ulduar
		{ "33", 10001, x, y }; -- Dun Niffelem
		{ "34", 10001, x, y }; -- The Argent Vanguard
		{ "35", 10001, x, y }; -- Crusaders' Pinnacle
		{ "36", 10001, x, y }; -- Argent Tournament Grounds
		{ "37", 10001, x, y }; -- The Shadow Vault
		{ "38", 10001, x, y }; -- Death's Rise
		{ "39", 10001, x, y }; -- Warsong Camp
	};
	TransDeepholm = {
		{ " A", 10001, x, y }; -- Temple of Earth
		{ " B", 10001, x, y }; -- Therazane's Throne
		{ "A'", 10001, x, y }; -- Stormwind City
		{ "B'", 10001, x, y }; -- Orgrimmar
		
	};
	DarkmoonFaire = {
		{ " A) "..AL["Portals"].."\n"..INDENT.." -> "..BZ["Elwynn Forest"].."\n"..INDENT.." -> "..BZ["Mulgore"] };
	};
	TransAlliancePandaria = {
		{ "A", 10001, x, y }; -- Paw'Don Village
		{ "B", 10001, x, y }; -- Violet Rise
		{ "C", 10001, x, y }; -- Shan'ze Dao
		{ "D", 10001, x, y }; -- The Skyfire
		{ "A'", 10001, x, y }; -- Stormwind City
		{ "B'", 10001, x, y }; -- Ironforge
		{ "C'", 10001, x, y }; -- Dalaran
		{ "D'", 10001, x, y }; -- The Exodar
		{ "E'", 10001, x, y }; -- Darnassus
		{ "F'", 10001, x, y }; -- Ratchet
		{ "G'", 10001, x, y }; -- Shattrath City
		{ "A", 10001, x, y }; -- The Arboretum
		{ "B", 10001, x, y }; -- Thunder Hold
		{ "C", 10001, x, y }; -- Strongarm Airstrip
		{ "D", 10001, x, y }; -- Winds' Edge
		{ "E", 10001, x, y }; -- Whispercloud Rise
		{ "F", 10001, x, y }; -- Serpent's Spine
		{ " 1", 10001, x, y }; -- Paw'Don Village
		{ " 2", 10001, x, y }; -- Pearlfin Village
		{ " 3", 10001, x, y }; -- Serpent's Overlook
		{ " 4", 10001, x, y }; -- Jade Temple Grounds
		{ " 5", 10001, x, y }; -- Dawn's Blossom
		{ " 6", 10001, x, y }; -- The Arboretum
		{ " 7", 10001, x, y }; -- Tian Monastery
		{ " 8", 10001, x, y }; -- Emperor's Omen
		{ " 9", 10001, x, y }; -- Sri-La Village
		{ "10", 10001, x, y }; -- Pang's Stead
		{ "11", 10001, x, y }; -- Grassy Cline
		{ "12", 10001, x, y }; -- Halfhill
		{ "13", 10001, x, y }; -- Stoneplow
		{ "14", 10001, x, y }; -- Sentinel Basecamp
		{ "15", 10001, x, y }; -- Cradle of Chi-Ji
		{ "16", 10001, x, y }; -- Marista
		{ "17", 10001, x, y }; -- The Incursion
		{ "18", 10001, x, y }; -- Zhu's Watch
		{ "19", 10001, x, y }; -- Lion's Landing
		{ "20", 10001, x, y }; -- Tavern in the Mists
		{ "21", 10001, x, y }; -- Binan Village
		{ "22", 10001, x, y }; -- Westwind Rest
		{ "23", 10001, x, y }; -- Shado-Pan Fallback
		{ "24", 10001, x, y }; -- Kota Basecamp
		{ "25", 10001, x, y }; -- Winter's Blossom
		{ "26", 10001, x, y }; -- One Keg
		{ "27", 10001, x, y }; -- Temple of the White Tiger
		{ "28", 10001, x, y }; -- Zouchin Village
		{ "29", 10001, x, y }; -- Longying Outpost
		{ "30", 10001, x, y }; -- Gao-Ran Battlefront
		{ "31", 10001, x, y }; -- Rensai's Watchpost
		{ "32", 10001, x, y }; -- Shado-Pan Garrison
		{ "33", 10001, x, y }; -- The Sunset Brewgarden
		{ "34", 10001, x, y }; -- Klaxxi'vess
		{ "35", 10001, x, y }; -- The Lion's Redoubt
		{ "36", 10001, x, y }; -- The Briny Muck
		{ "37", 10001, x, y }; -- Soggy's Gamble
		{ "38", 10001, x, y }; -- Serpent's Spine
		{ "39", 10001, x, y }; -- Shrine of Seven Stars
		{ "40", 10001, x, y }; -- Beeble's Wreck
		{ "41", 10001, x, y }; -- Tushui Landing
	};
	TransHordePandaria = {
		{ "A", 10001, x, y }; -- Honeydew Village
		{ "B", 10001, x, y }; -- Dawnseeker Promontory
		{ "C", 10001, x, y }; -- Shan'ze Dao
		{ "D", 10001, x, y }; -- Sparkrocket Outpost
		{ "E", 10001, x, y }; -- Ruins of Ogudei
		{ "A'", 10001, x, y }; -- Orgrimmar
		{ "B'", 10001, x, y }; -- Thunder Bluff
		{ "C'", 10001, x, y }; -- Ratchet
		{ "D'", 10001, x, y }; -- Shattrath City
		{ "E'", 10001, x, y }; -- Dalaran
		{ "F'", 10001, x, y }; -- Silvermoon City
		{ "G'", 10001, x, y }; -- Undercity
		{ "A", 10001, x, y }; -- The Arboretum
		{ "B", 10001, x, y }; -- Thunder Hold
		{ "C", 10001, x, y }; -- Strongarm Airstrip
		{ "D", 10001, x, y }; -- Winds' Edge
		{ "E", 10001, x, y }; -- Whispercloud Rise
		{ "F", 10001, x, y }; -- Serpent's Spine
		{ " 1", 10001, x, y }; -- Honeydew Village
		{ " 2", 10001, x, y }; -- Tian Monastery
		{ " 3", 10001, x, y }; -- Emperor's Omen
		{ " 4", 10001, x, y }; -- Sri-La Village
		{ " 5", 10001, x, y }; -- Dawn's Blossom
		{ " 6", 10001, x, y }; -- The Arboretum
		{ " 7", 10001, x, y }; -- Jade Temple Grounds
		{ " 8", 10001, x, y }; -- Serpent's Overlook
		{ " 9", 10001, x, y }; -- Grookin Hill
		{ "10", 10001, x, y }; -- Pang's Stead
		{ "11", 10001, x, y }; -- Grassy Cline
		{ "12", 10001, x, y }; -- Halfhill
		{ "13", 10001, x, y }; -- Stoneplow
		{ "14", 10001, x, y }; -- Dawnchaser Retreat
		{ "15", 10001, x, y }; -- Cradle of Chi-Ji
		{ "16", 10001, x, y }; -- Marista
		{ "17", 10001, x, y }; -- Thunder Cleft
		{ "18", 10001, x, y }; -- Zhu's Watch
		{ "19", 10001, x, y }; -- Domination Point
		{ "20", 10001, x, y }; -- Tavern in the Mists
		{ "21", 10001, x, y }; -- Binan Village
		{ "22", 10001, x, y }; -- Eastwind Rest
		{ "23", 10001, x, y }; -- Shado-Pan Fallback
		{ "24", 10001, x, y }; -- Kota Basecamp
		{ "25", 10001, x, y }; -- Winter's Blossom
		{ "26", 10001, x, y }; -- One Keg
		{ "27", 10001, x, y }; -- Temple of the White Tiger
		{ "28", 10001, x, y }; -- Zouchin Village
		{ "29", 10001, x, y }; -- Serpent's Spine
		{ "30", 10001, x, y }; -- Longying Outpost
		{ "31", 10001, x, y }; -- Gao-Ran Battlefront
		{ "32", 10001, x, y }; -- Rensai's Watchpost
		{ "33", 10001, x, y }; -- Shado-Pan Garrison
		{ "34", 10001, x, y }; -- The Sunset Brewgarden
		{ "35", 10001, x, y }; -- Klaxxi'vess
		{ "36", 10001, x, y }; -- The Briny Muck
		{ "37", 10001, x, y }; -- Soggy's Gamble
		{ "38", 10001, x, y }; -- Serpent's Spine    
		{ "39", 10001, x, y }; -- Shrine of Two Moons
		{ "40", 10001, x, y }; -- Bozzle's Wreck
		{ "41", 10001, x, y }; -- Huojin Landing
	};
]]
	TransEmeraldDreamway = {
		{ "A", 10001, 234, 147 }; -- The Dreamgrove
		{ "B", 10002, 145, 175 }; -- Grizzly Hills
		{ "C", 10003, 79, 217 }; -- Dream Bough
		{ "D", 10004, 93, 410 }; -- Stormrage Barrow Dens
		{ "E", 10005, 196, 359 }; -- Twilight Grove
		{ "F", 10006, 276, 347 }; -- Seradane
		{ "G", 10007, 299, 285 }; -- Nordrassil
	
	};
};


for k, v in pairs(myDB) do
	AtlasMaps_NPC_DB[k] = v;
end
