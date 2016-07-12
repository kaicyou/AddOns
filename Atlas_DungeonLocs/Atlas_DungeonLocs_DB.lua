-- $Id: Atlas_DungeonLocs_DB.lua 10 2016-05-17 05:34:59Z arith $
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
	DLEast = {
		{ " 1",  10001, 349, 6 }; -- Sunwell Plateau
		{ " 2",  10002, 335, 12 }; -- Magisters' Terrace
		{ " 3",  10003, 361, 123 }; -- Zul'Aman
		{ " 4",  10004, 327, 142 }; -- Stratholme
		{ " 5",  10005, 267, 151 }; -- Scarlet Monastery
		{ " 6",  10006, 304, 179 }; -- Scholomance
		{ " 7",  10007, 222, 212 }; -- Shadowfang Keep
		{ " 8",  10008, 181, 264 }; -- Baradin Hold
		{ " 9",  10009, 324, 286 }; -- Grim Batol
		{ "10",  10010, 335, 303 }; -- The Bastion of Twilight
		{ "11",  10011, 240, 306 }; -- Gnomeregan
		{ "12",  10012, 150, 321 }; -- The Abyssal Maw
		{ "13",  10013, 316, 325 }; -- Uldaman
		{ "14",  10014, 274, 355 }; -- Blackrock Mountain
		{ "15",  10015, 237, 374 }; -- The Stockade
		{ "16",  10016, 326, 411 }; -- Sunken Temple
		{ "17",  10017, 223, 420 }; -- The Deadmines
		{ "18",  10018, 291, 422 }; -- Karazhan
		{ "19",  10019, 279, 439 }; -- Zul'Gurub
		{ " 1'", 10020, 261, 206 }; -- Alterac Valley
		{ " 2'", 10021, 324, 221 }; -- Arathi Basin
		{ " 2'", 10021, 304, 231 }; -- Arathi Basin
		{ " 3'", 10022, 177, 252 }; -- Tol Barad
	};
	DLWest = {
		{ " 1",  10001, 304, 165 }; -- Firelands
		{ " 2",  10002, 225, 164 }; -- Blackfathom Deeps
		{ " 3",  10003, 335, 210 }; -- Ragefire Chasm
		{ " 4",  10004, 285, 264 }; -- Wailing Caverns
		{ " 5",  10005, 180, 277 }; -- Maraudon
		{ " 6",  10006, 219, 326 }; -- Dire Maul
		{ " 7",  10007, 278, 343 }; -- Razorfen Kraul
		{ " 8",  10008, 296, 345 }; -- Razorfen Downs
		{ " 9",  10009, 321, 348 }; -- Onyxia's Lair
		{ "10",  10010, 305, 392 }; -- Zul'Farrak
		{ "11",  10011, 340, 419 }; -- Caverns of Time
		{ "12",  10012, 206, 425 }; -- Ahn'Qiraj
		{ "13",  10013, 283, 464 }; -- Halls of Origination
		{ "14",  10014, 269, 476 }; -- Lost City of the Tol'vir
		{ "15",  10015, 239, 487 }; -- Throne of the Four Winds
		{ "16",  10016, 290, 491 }; -- The Vortex Pinnacle
		{ " 1'", 10017, 283, 217 }; -- Warsong Gulch
		{ " 1'", 10017, 287, 227 }; -- Warsong Gulch
	};
	DLOutland = {
		{ " 1", 10001, 224, 78 }; -- Gruul's Lair
		{ " 2", 10002, 410, 102 }; -- Tempest Keep
		{ " 3", 10003, 146, 219 }; -- Coilfang Reservoir
		{ " 4", 10004, 324, 259 }; -- Hellfire Citadel
		{ " 5", 10005, 239, 400 }; -- Auchindoun
		{ " 6", 10006, 449, 411 }; -- Black Temple
	};
	DLNorthrend = {
		{ " 1",  10001, 307, 114 }; -- Ulduar
		{ " 2",  10002, 242, 129 }; -- Crusaders' Coliseum
		{ " 3",  10003, 422, 187 }; -- Gundrak
		{ " 4",  10004, 198, 218 }; -- Icecrown Citadel
		{ " 5",  10005, 252, 223 }; -- The Violet Hold
		{ " 6",  10006, 174, 237 }; -- Vault of Archavon
		{ " 7",  10007, 337, 256 }; -- Drak'Tharon Keep
		{ " 8",  10008, 34, 287 }; -- The Nexus
		{ " 9",  10009, 195, 291 }; -- Azjol-Nerub
		{ "10",  10010, 258, 297 }; -- Wyrmrest Temple
		{ "11",  10011, 309, 287 }; -- Naxxramas
		{ "12",  10012, 432, 377 }; -- Utgarde Keep
		{ " 1'", 10013, 176, 268 }; -- Wintergrasp
	};
	DLDeepholm = {
		{ " 1", 10001, 298, 311  }; -- The Stonecore
	};
	DLPandaria = {
		{ " 1",  10001, 67, 80 }; -- Throne of Thunder
		{ " 2",  10002, 167, 157 }; -- Shado-Pan Monastery
		{ " 3",  10003, 222, 154 }; -- Mogu'shan Vaults
		{ " 4",  10004, 90, 217 }; -- Siege of Niuzao Temple
		{ " 5",  10005, 180, 266 }; -- Gate of the Setting Sun
		{ " 6",  10006, 242, 253 }; -- Siege of Orgrimmar
		{ " 7",  10007, 254, 250 }; -- Mogu'shan Palace
		{ " 8",  10008, 278, 263 }; -- Terrace of Endless Spring
		{ " 9",  10009, 365, 267 }; -- Temple of the Jade Serpent
		{ "10",  10010, 116, 298 }; -- Heart of Fear
		{ "11",  10011, 221, 329 }; -- Stormstout Brewery
		{ " 1'", 10012, 246, 312 }; -- Deepwind Gorge
	};
	DLDraenor = {
		{ " 1", 10001, 293, 72 }; -- Iron Docks
		{ " 2", 10002, 298, 89 }; -- Blackrock Foundry
		{ " 3", 10003, 308, 101 }; -- Grimrail Depot
		{ " 4", 10004, 174, 125 }; -- Bloodmaul Slag Mines
		{ " 5", 10005, 317, 128 }; -- The Everbloom
		{ " 6", 10006, 80, 254 }; -- Highmaul
		{ " 7", 10007, 216, 316 }; -- Auchindoun
		{ " 8", 10008, 322, 343 }; -- Shadowmoon Burial Grounds
		{ " 9", 10009, 240, 363 }; -- Skyreach
		{ "10", 10010, 336, 235 }; -- Hellfire Citadel
		{ "1'", 10011, 460, 195 }; -- Ashran
		{ "1'", 10011, 460, 240 }; -- Ashran
	};
};


for k, v in pairs(myDB) do
	AtlasMaps_NPC_DB[k] = v;
end
