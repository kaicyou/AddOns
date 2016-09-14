-- $Id: Atlas_DungeonLocs_DB.lua 25 2016-09-06 06:58:49Z arith $
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

--[[ /////////////////////////////////////////
 Atlas Map NPC Description Data
 zoneID = {
	{ ID or letter mark, encounterID or customizedID, x, y, x_largeMap, y_largeMap, color of the letter mark };
	{ "A", 10001, 241, 460 };
	{ 1, 1694, 373, 339 };
 };
/////////////////////////////////////////////]]
local myDB = {
	DLEast = {
		{  "1",  10001, 349,   6, 559,  17, "Raid" }; -- Sunwell Plateau
		{  "2",  10002, 335,  12, 541,  27, "Dungeon" }; -- Magisters' Terrace
		{  "3",  10003, 361, 123, 601, 162, "Dungeon" }; -- Zul'Aman
		{  "4",  10004, 327, 142, 521, 175, "Dungeon" }; -- Stratholme
		{  "5",  10005, 267, 151, 458, 196, "Dungeon" }; -- Scarlet Monastery
		{  "6",  10006, 304, 179, 501, 235, "Dungeon" }; -- Scholomance
		{  "7",  10007, 222, 212, 403, 276, "Dungeon" }; -- Shadowfang Keep
		{  "8",  10008, 181, 264, 345, 338, "Raid" }; -- Baradin Hold
		{  "9",  10009, 324, 286, 523, 364, "Dungeon" }; -- Grim Batol
		{ "10",  10010, 335, 303, 551, 389, "Raid" }; -- The Bastion of Twilight
		{ "11",  10011, 240, 306, 428, 397, "Dungeon" }; -- Gnomeregan
		{ "12",  10012, 150, 321, 307, 407, "Dungeon" }; -- The Abyssal Maw
		{ "13",  10013, 316, 325, 520, 420, "Dungeon" }; -- Uldaman
		{ "14",  10014, 274, 355, 465, 456, "Raid" }; -- Blackrock Mountain
		{ "15",  10015, 237, 374, 424, 474, "Dungeon" }; -- The Stockade
		{ "16",  10016, 326, 411, 534, 523, "Dungeon" }; -- Sunken Temple
		{ "17",  10017, 223, 420, 400, 541, "Dungeon" }; -- The Deadmines
		{ "18",  10018, 291, 422, 484, 539, "Raid" }; -- Karazhan
		{ "19",  10019, 279, 439, 475, 554, "Dungeon" }; -- Zul'Gurub
		{ "1'",  10020, 261, 206, 448, 260, "Battlegrounds" }; -- Alterac Valley
		{ "2'",  10021, 324, 221, 528, 283, "Battlegrounds" }; -- Arathi Basin
		{ "2'",  10021, 304, 231, 507, 291, "Battlegrounds" }; -- Arathi Basin
		{ "3'",  10022, 177, 252, 336, 319, "Battlegrounds" }; -- Tol Barad
	};
	DLWest = {
		{  "1",  10001, 280, 183, 523, 224, "Raid" }; -- Firelands
		{  "2",  10002, 216, 183, 431, 220, "Dungeon" }; -- Blackfathom Deeps
		{  "3",  10003, 312, 225, 566, 281, "Dungeon" }; -- Ragefire Chasm
		{  "4",  10004, 265, 282, 505, 357, "Dungeon" }; -- Wailing Caverns
		{  "5",  10005, 167, 291, 370, 371, "Dungeon" }; -- Maraudon
		{  "6",  10006, 201, 339, 422, 432, "Dungeon" }; -- Dire Maul
		{  "7",  10007, 257, 346, 494, 449, "Dungeon" }; -- Razorfen Kraul
		{  "8",  10008, 274, 355, 516, 480, "Dungeon" }; -- Razorfen Downs
		{  "9",  10009, 298, 354, 551, 457, "Raid" }; -- Onyxia's Lair
		{ "10",  10010, 279, 386, 527, 501, "Dungeon" }; -- Zul'Farrak
		{ "11",  10011, 315, 422, 577, 551, "Raid" }; -- Caverns of Time
		{ "12",  10012, 194, 425, 408, 555, "Raid" }; -- Ahn'Qiraj
		{ "13",  10013, 263, 459, 500, 604, "Dungeon" }; -- Halls of Origination
		{ "14",  10014, 254, 471, 486, 623, "Dungeon" }; -- Lost City of the Tol'vir
		{ "15",  10015, 223, 483, 446, 635, "Raid" }; -- Throne of the Four Winds
		{ "16",  10016, 271, 485, 509, 638, "Dungeon" }; -- The Vortex Pinnacle
		{ "1'",  10017, 269, 236, 507, 297, "Battlegrounds" }; -- Warsong Gulch
	};
	DLOutland = {
		{ "1", 10001, 224,  78, 424, 116, "Raid" }; -- Gruul's Lair
		{ "2", 10002, 410, 102, 659, 148, "Raid" }; -- Tempest Keep
		{ "3", 10003, 146, 219, 336, 292, "Raid" }; -- Coilfang Reservoir
		{ "4", 10004, 324, 259, 555, 340, "Raid" }; -- Hellfire Citadel
		{ "5", 10005, 239, 400, 448, 515, "Raid" }; -- Auchindoun
		{ "6", 10006, 449, 411, 714, 529, "Raid" }; -- Black Temple
	};
	DLNorthrend = {
		{ "1",   10001, 307, 114, 577, 107, "Raid" }; -- Ulduar
		{ "2",   10002, 242, 129, 470, 131, "Raid" }; -- Crusaders' Coliseum
		{ "3",   10003, 422, 187, 778, 220, "Dungeon" }; -- Gundrak
		{ "4",   10004, 198, 218, 403, 290, "Raid" }; -- Icecrown Citadel
		{ "5",   10005, 252, 223, 479, 287, "Dungeon" }; -- The Violet Hold
		{ "6",   10006, 174, 237, 355, 307, "Raid" }; -- Vault of Archavon
		{ "7",   10007, 337, 256, 628, 345, "Dungeon" }; -- Drak'Tharon Keep
		{ "8",   10008,  34, 287, 126, 392, "Raid" }; -- The Nexus
		{ "9",   10009, 195, 291, 389, 401, "Dungeon" }; -- Azjol-Nerub
		{ "10",  10010, 258, 297, 500, 407, "Raid" }; -- Wyrmrest Temple
		{ "11",  10011, 309, 287, 586, 399, "Raid" }; -- Naxxramas
		{ "12",  10012, 432, 377, 786, 546, "Dungeon" }; -- Utgarde Keep
		{ "1'",  10013, 176, 268, 356, 340, "Battlegrounds" }; -- Wintergrasp
	};
	DLDeepholm = {
		{ "1", 10001, 298, 311  }; -- The Stonecore
	};
	DLPandaria = {
		{ "1",  10001,  67,  80, 219,  68, "Raid" }; -- Throne of Thunder
		{ "2",  10002, 167, 157, 378, 207, "Dungeon" }; -- Shado-Pan Monastery
		{ "3",  10003, 222, 154, 467, 200, "Raid" }; -- Mogu'shan Vaults
		{ "4",  10004,  90, 217, 248, 304, "Dungeon" }; -- Siege of Niuzao Temple
		{ "5",  10005, 180, 266, 401, 384, "Dungeon" }; -- Gate of the Setting Sun
		{ "6",  10006, 242, 253, 496, 368, "Raid" }; -- Siege of Orgrimmar
		{ "7",  10007, 254, 250, 510, 358, "Dungeon" }; -- Mogu'shan Palace
		{ "8",  10008, 278, 263, 554, 384, "Raid" }; -- Terrace of Endless Spring
		{ "9",  10009, 365, 267, 702, 385, "Dungeon" }; -- Temple of the Jade Serpent
		{ "10", 10010, 116, 298, 300, 435, "Raid" }; -- Heart of Fear
		{ "11", 10011, 221, 329, 461, 488, "Dungeon" }; -- Stormstout Brewery
		{ "1'", 10012, 246, 312, 513, 457, "Battlegrounds" }; -- Deepwind Gorge
	};
	DLDraenor = {
		{ "1",  10001, 293, 72, 544, 87, "Dungeon" }; -- Iron Docks
		{ "2",  10002, 298, 89, 551, 108, "Raid" }; -- Blackrock Foundry
		{ "3",  10003, 308, 101, 566, 124, "Dungeon" }; -- Grimrail Depot
		{ "4",  10004, 174, 125, 365, 157, "Dungeon" }; -- Bloodmaul Slag Mines
		{ "5",  10005, 317, 128, 582, 179, "Dungeon" }; -- The Everbloom
		{ "6",  10006,  80, 254, 239, 350, "Raid" }; -- Highmaul
		{ "7",  10007, 216, 316, 443, 438, "Dungeon" }; -- Auchindoun
		{ "8",  10008, 322, 343, 586, 479, "Dungeon" }; -- Shadowmoon Burial Grounds
		{ "9",  10009, 240, 363, 480, 512, "Dungeon" }; -- Skyreach
		{ "10", 10010, 336, 235, 610, 323, "Raid" }; -- Hellfire Citadel
		{ "1'", 10011, 460, 195, 799, 300, "Battlegrounds" }; -- Ashran
		{ "1'", 10011, 460, 240 }; -- Ashran
	};
	DLBrokenIsles = {
		{ "1",  10001, 238, 338, 490, 438, "Dungeon" }; -- Assault on Violet Hold
		{ "2",  10002, 142, 373, 361, 493, "Dungeon" }; -- Vault of the Wardens
		{ "3",  10003, 235, 443, 479, 580, "Dungeon" }; -- Eye of Azshara
		{ "3'", 100031, 181, 299, 412, 393, "White" }; -- Eye of Azshara meeting stone
		{ "4",  10004, 109, 170, 323, 227, "Dungeon" }; -- Black Rook Hold
		{ "5",  10005, 147, 150, 369, 207, "Raid" }; -- The Emerald Nightmare
		{ "6",  10006, 155, 141, 378, 190, "Dungeon" }; -- Darkheart Thicket
		{ "7",  10007, 257, 146, 511, 193, "Dungeon" }; -- Neltharion's Lair
		{ "8",  10008, 335, 162, 613, 211, "Dungeon" }; -- Maw of Souls
		{ "9",  10009, 383, 199, 675, 265, "Dungeon" }; -- Halls of Valor
		{ "10", 10010, 235, 259, 491, 342, "Dungeon" }; -- The Arcway
		{ "11", 10011, 255, 256, 515, 343, "Dungeon" }; -- Court of Stars
		{ "12", 10012, 245, 244, 512, 320, "Raid" }; -- The Nighthold
	};
};


for k, v in pairs(myDB) do
	AtlasMaps_NPC_DB[k] = v;
end
