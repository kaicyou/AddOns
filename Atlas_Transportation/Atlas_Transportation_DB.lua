-- $Id: Atlas_Transportation_DB.lua 56 2016-10-25 15:58:44Z arith $
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
	TransSuramar = {
		{ "A", 10001, 155, 248 }; -- Ruins of Elune'eth
		{ "B", 10002, 209, 175 }; -- Tel'anor
		{ "C", 10003,  24, 142 }; -- Falanaar
		{ "D", 10004, 103,  23 }; -- Moonfall Overlook
		{ "E", 10005, 182, 428 }; -- Felsoul Hold
		{ "F", 10006, 242, 357 }; -- Sanctum of Order
		{ "G", 10007, 220, 450 }; -- Lunastre Estate
		{ "H", 10008, 263, 464 }; -- The Waning Crescent
		{ "I", 10009, 414, 329 }; -- Twilight Vineyards
		{ "1", 10101,  58, 156 }; -- Irongrove Retreat
		{ "2", 10102, 134, 263 }; -- Meredil
		{ "3", 10103, 414, 216 }; -- Crimson Thicket
	};
	TransDalaran = {
		{ "A", 10014, 184, 279 }; -- Greyfang Enclave
		{ "B", 10015, 262, 145 }; -- Windrunner's Sanctuary
		{ "C", 10016, 234, 221 }; -- Chamber of the Guardian
		{ "1", 10013, 335, 232 }; -- Aludane Whitecloud <Flight Master>
		{ "A", 10001, 463, 288 }; -- Illidari Gateway
		{ "A", 10002, 345, 200 }; -- Talua <Eagle Keeper>
		{ "A", 10003, 288, 113 }; -- Portal to Sanctum of Light
		{ "B", 10004, 152, 294 }; -- Portal to Sanctum of Light
		{ "A", 10005, 296, 125 }; -- Portal to Netherlight Temple
		{ "B", 10006, 188, 254 }; -- Portal to Netherlight Temple
		{ "A", 10007, 242, 292 }; -- Glorious Goods
		{ "B", 10008, 256, 174 }; -- One More Glass
		{ "C", 10009, 210, 162 }; -- Tanks for Everything
		{ "A", 10010, 319, 222 }; -- Portal to the Maelstrom
		{ "A", 10011, 155, 204 }; -- Portal to Dreadscar Rift
		{ "A", 10012, 354, 217 }; -- Jump to Skyhold
	};
	TransAllianceBrokenIsles = {
		{ "A", 10038, 230, 357 }; -- Greyfang Enclave
		{ "B", 10039, 237, 349 }; -- Chamber of the Guardian
		{ "C", 10040, 290, 133 }; -- Portal to Dalaran
		{ "1", 10001, 249, 341 }; -- Krasus' Landing
		{ "2", 10002, 151, 378 }; -- Watchers' Aerie
		{ "3", 10003, 144, 363 }; -- Wardens' Redoubt
		{ "4", 10004, 165, 336 }; -- Shackle's Den
		{ "5", 10005, 130, 303 }; -- Illidari Stand
		{ "6", 10006, 98, 314 }; -- Illidari Perch
		{ "7", 10007, 191, 275 }; -- Felblaze Ingress
		{ "8", 10008, 138, 266 }; -- Azurewing Repose
		{ "9", 10009, 116, 238 }; -- Challiane's Terrace
		{ "10", 10010, 222, 450 }; -- Eye of Azshara
		{ "11", 10011, 147, 197 }; -- Lorlathil
		{ "12", 10012, 75, 185 }; -- Gloaming Reef
		{ "13", 10013, 117, 175 }; -- Bradensbrook
		{ "14", 10014, 149, 177 }; -- Garden of the Moon
		{ "15", 10015, 183, 163 }; -- Starsong Refuge
		{ "16", 10016, 246, 164 }; -- Obsidian Overlook
		{ "17", 10017, 277, 164 }; -- Ironhorn Enclave
		{ "18", 10018, 210, 126 }; -- Sylvan Falls
		{ "19", 10019, 244, 116 }; -- Thunder Totem
		{ "20", 10020, 283, 121 }; -- Stonehoof Watch
		{ "21", 10021, 224, 97 }; -- Nesingwary
		{ "22", 10022, 263, 84 }; -- Skyhorn
		{ "23", 10023, 191, 68 }; -- Felbane Camp
		{ "24", 10024, 217, 67 }; -- The Witchwood
		{ "25", 10025, 279, 51 }; -- Prepfoot
		{ "26", 10026, 228, 12 }; -- Shipwreck Cove
		{ "27", 10027, 297, 152 }; -- Skyfire Triage Camp (A)
		{ "28", 10028, 318, 176 }; -- Lorna's Watch (A)
		{ "29", 10029, 344, 127 }; -- Stormtorn Foothills
		{ "30", 10030, 369, 154 }; -- Valdisdall
		{ "31", 10031, 404, 171 }; -- Greywatch (A)
		{ "32", 10032, 442, 83 }; -- Shield's Rest
		{ "33", 10033, 353, 223 }; -- Hafr Fjall
		{ "34", 10034, 205, 198 }; -- Irongrove Retreat
		{ "35", 10035, 225, 227 }; -- Meredil
		{ "36", 10036, 291, 212 }; -- Crimson Thicket
		{ "37", 10037, 301, 321 }; -- Illidari Camp
		{ "1", 10100, 110, 112 }; -- The Dreamgrove
		{ "2", 10101, 193, 91}; -- Trueshot Lodge
		{ "3", 10102, 387, 365 }; -- Acherus: The Ebon Hold
		{ "1", 10201, 169, 245 }; -- Ley-Ruins of Zarkhenar
		{ "2", 10202, 193, 118 }; -- Sylvan Falls
		{ "3", 10203, 298, 170 }; -- Weeping Bluffs
		{ "4", 10204, 139, 172 }; -- Temple of Elune
		{ "5", 10205, 226, 238 }; -- Meredil
		{ "1", 10301, 123, 104 }; -- The Dreamgrove
		{ "2", 10302,  77, 301 }; -- Faronaar
		{ "3", 10303, 156, 371 }; -- Isle of the Watchers
		{ "4", 10304, 247, 282 }; -- Western Suramar
		{ "5", 10305, 316, 260 }; -- Eastern Suramar
		{ "6", 10306, 312, 204 }; -- Thorim's Peak
		{ "7", 10307, 333, 131 }; -- Nastrondir
		{ "8", 10308, 275, 130 }; -- Eastern Highmountain
	};
	TransHordeBrokenIsles = {
		{ "A", 10038, 239, 336 }; -- Windrunner's Sanctuary
		{ "B", 10039, 237, 348 }; -- Chamber of the Guardian
		{ "C", 10040, 290, 133 }; -- Portal to Dalaran
		{ "1", 10001, 249, 342 }; -- Krasus' Landing
		{ "2", 10002, 151, 378 }; -- Watchers' Aerie
		{ "3", 10003, 144, 363 }; -- Wardens' Redoubt
		{ "4", 10004, 165, 336 }; -- Shackle's Den
		{ "5", 10005, 130, 303 }; -- Illidari Stand
		{ "6", 10006, 98, 314 }; -- Illidari Perch
		{ "7", 10007, 191, 275 }; -- Felblaze Ingress
		{ "8", 10008, 138, 266 }; -- Azurewing Repose
		{ "9", 10009, 116, 238 }; -- Challiane's Terrace
		{ "10", 10010, 222, 450 }; -- Eye of Azshara
		{ "11", 10011, 147, 197 }; -- Lorlathil
		{ "12", 10012, 75, 185 }; -- Gloaming Reef
		{ "13", 10013, 117, 175 }; -- Bradensbrook
		{ "14", 10014, 149, 177 }; -- Garden of the Moon
		{ "15", 10015, 183, 163 }; -- Starsong Refuge
		{ "16", 10016, 246, 164 }; -- Obsidian Overlook
		{ "17", 10017, 277, 164 }; -- Ironhorn Enclave
		{ "18", 10018, 210, 126 }; -- Sylvan Falls
		{ "19", 10019, 244, 116 }; -- Thunder Totem
		{ "20", 10020, 283, 121 }; -- Stonehoof Watch
		{ "21", 10021, 224, 97 }; -- Nesingwary
		{ "22", 10022, 263, 84 }; -- Skyhorn
		{ "23", 10023, 191, 68 }; -- Felbane Camp
		{ "24", 10024, 217, 67 }; -- The Witchwood
		{ "25", 10025, 279, 51 }; -- Prepfoot
		{ "26", 10026, 228, 12 }; -- Shipwreck Cove
		{ "27", 10027, 311, 122 }; -- Forsaken Foothold (H)
		{ "28", 10028, 327, 169 }; -- Cullen's Post (H)
		{ "29", 10029, 344, 127 }; -- Stormtorn Foothills
		{ "30", 10030, 369, 154 }; -- Valdisdall
		{ "31", 10031, 355, 191 }; -- Dreadwake's Landing (H)
		{ "32", 10032, 442, 83 }; -- Shield's Rest
		{ "33", 10033, 353, 223 }; -- Hafr Fjall
		{ "34", 10034, 205, 198 }; -- Irongrove Retreat
		{ "35", 10035, 225, 227 }; -- Meredil
		{ "36", 10036, 291, 212 }; -- Crimson Thicket
		{ "37", 10037, 301, 321 }; -- Illidari Camp
		{ "1", 10100, 110, 112 }; -- The Dreamgrove
		{ "2", 10101, 193, 91}; -- Trueshot Lodge
		{ "3", 10102, 387, 365 }; -- Acherus: The Ebon Hold
		{ "1", 10201, 169, 245 }; -- Ley-Ruins of Zarkhenar
		{ "2", 10202, 193, 118 }; -- Sylvan Falls
		{ "3", 10203, 298, 170 }; -- Weeping Bluffs
		{ "4", 10204, 139, 172 }; -- Temple of Elune
		{ "5", 10205, 226, 238 }; -- Meredil
		{ "1", 10301, 123, 104 }; -- The Dreamgrove
		{ "2", 10302,  77, 301 }; -- Faronaar
		{ "3", 10303, 156, 371 }; -- Isle of the Watchers
		{ "4", 10304, 247, 282 }; -- Western Suramar
		{ "5", 10305, 316, 260 }; -- Eastern Suramar
		{ "6", 10306, 312, 204 }; -- Thorim's Peak
		{ "7", 10307, 333, 131 }; -- Nastrondir
		{ "8", 10308, 275, 130 }; -- Eastern Highmountain
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
	TransAllianceStormwindCity = {
		{ "A", 10001,  54, 273, 248, 372, "Orange" }; -- Rut'theran Village
		{ "B", 10002,  24, 140, 216, 203, "Orange" }; -- Valiance Keep
		{ "A", 10003, 228, 418, 466, 553, "Purple" }; -- The Stair of Destiny
		{ "B", 10004, 237, 406, 477, 540, "Purple" }; -- Fuselight-by-the-Sea
		{ "C", 10005, 358, 103, 635, 155, "Purple" }; -- Paw'Don Village
		{ "D", 10006, 389, 111, 671, 163, "Purple" }; -- Baradin Base Camp
		{ "E", 10007, 395,  99, 677, 149, "Purple" }; -- Darkbreak Cove
		{ "F", 10008, 408,  96, 691, 151, "Purple" }; -- Highbank
		{ "G", 10009, 415, 109, 704, 163, "Purple" }; -- Nordrassil
		{ "H", 10010, 411, 119, 699, 181, "Purple" }; -- Ramkahen
		{ "I", 10011, 399, 120, 686, 182, "Purple" }; -- Temple of Earth
		{ "J", 10012, 487, 182, 794, 260, "Purple" }; -- Stormshield
		{ "K", 10013, 441, 169, 736, 240, "Purple" }; -- Dalaran
		{ "1", 10014, 353, 178, 624, 250, "White" }; -- Ironforge
		{ "2", 10015, 374, 346, 656, 464, "White" }; -- Stormwind City
	};
	TransHordeOrgrimmar = {
		{ "A", 10001, 198, 321, 462, 414, "Purple"}; -- Shattered Landing
		{ "B", 10002, 177, 308, 436, 396, "Purple"}; -- The Stair of Destiny
		{ "B", 10002, 117, 352, 361, 445, "Purple"}; -- The Stair of Destiny
		{ "C", 10003, 201, 224, 462, 288, "Purple"}; -- Hellscream's Grasp
		{ "D", 10004, 209, 215, 475, 280, "Purple"}; -- Ramkahen
		{ "E", 10005, 211, 202, 476, 264, "Purple"}; -- Vashj'ir
		{ "F", 10006, 221, 200, 493, 264, "Purple"}; -- Temple of Earth
		{ "G", 10007, 227, 211, 497, 278, "Purple"}; -- Nordrassil
		{ "H", 10008, 219, 222, 486, 283, "Purple"}; -- Dragonmaw Port
		{ "I", 10009, 341, 224, 643, 293, "Purple"}; -- Honeydew Village
		{ "J", 10010, 198, 362, 463, 461, "Purple"}; -- Warspear
		{ "K", 10016, 188, 326, 451, 424, "Purple"}; -- Dalaran
		{ "A", 10011, 170, 329, 426, 424, "Orange" }; -- Thunder Bluff
		{ "B", 10012, 182, 322, 440, 410, "Orange" }; -- Warsong Hold
		{ "C", 10013, 224, 292, 492, 375, "Orange" }; -- Undercity
		{ "D", 10014, 232, 279, 506, 355, "Orange" }; -- Grom'gol Base Camp
		{ "1", 10015, 212, 308, 481, 393, "White" }; -- Wind Rider Master
		{ "A", 10017,  17, 362, 226, 463, "Blue" }; -- Northern Barrens
		{ "B", 10018, 221, 471, 486, 604, "Blue" }; -- Durota
		{ "C", 10019, 399,  27, 711,  44, "Blue" }; -- Azshara
	};
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
