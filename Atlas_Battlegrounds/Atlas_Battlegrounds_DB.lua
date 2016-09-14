-- $Id: Atlas_Battlegrounds_DB.lua 1541 2016-08-31 05:17:16Z arith $
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
	AlteracValleyNorth = {
		{  "A", 10001, 368, 25 }; -- Entrance
		{  "B", 10002, 166, 65 }; -- Dun Baldar
		{  "1", 10003, 217, 69 }; -- Dun Baldar North Bunker
		{  "2", 10004, 197, 120 }; -- Dun Baldar South Bunker
		{  "3", 10005, 180, 229 }; -- Icewing Cavern
		{  "4", 10006, 371, 218 }; -- Stormpike Lumber Yard
		{  "5", 10007, 315, 268 }; -- Icewing Bunker
		{  "6", 10008, 282, 372 }; -- Stonehearth Outpost
		{  "7", 10009, 350, 427 }; -- Stonehearth Bunker
		{  "8", 10010, 268, 459 }; -- Western Crater
		{  "9", 10011, 294, 482 }; -- Eastern Crater
		{  "1", 10012, 297, 14 }; -- Irondeep Mine
		{ "1'", 10013, 194, 48 }; -- Arch Druid Renferal
		{ "2'", 10014, 186, 83 }; -- Murgot Deepforge
		{ "3'", 10015, 159, 102 }; -- Stormpike Stable Master <Stable Master>
		{ "4'", 10016, 178, 105 }; -- Stormpike Quartermaster
		{ "5'", 10017, 178, 120 }; -- Wing Commander Ichman
		{ "6'", 10018, 301, 353 }; -- Stormpike Ram Rider Commander
		{ "7'", 10019, 309, 445 }; -- Ivus the Forest Lord
		{  "1", 10020, 138, 82 }; -- Stormpike Aid Station
		{  "2", 10021, 318, 73 }; -- Stormpike Graveyard
		{  "3", 10022, 371, 328 }; -- Stonehearth Graveyard
		{  "4", 10023, 144, 428 }; -- Snowfall Graveyard
	};
	AlteracValleySouth = {
		{  "A", 10001, 355, 427 }; -- Entrance
		{  "B", 10002, 220, 426 }; -- Frostwolf Keep
		{  "1", 10003, 197, 65 }; -- Iceblood Garrison
		{  "2", 10004, 237, 81 }; -- Iceblood Tower
		{  "3", 10005, 281, 166 }; -- Tower Point
		{  "4", 10006, 241, 395 }; -- West Frostwolf Tower
		{  "5", 10007, 260, 395 }; -- East Frostwolf Tower
		{  "6", 10008, 323, 436 }; -- Wildpaw Cavern
		{  "1", 10009, 206, 244 }; -- Coldtooth Mine
		{ "1'", 10010, 168, 5 }; -- Lokholar the Ice Lord
		{ "2'", 10011, 276, 366 }; -- Wing Commander Vipore
		{ "3'", 10012, 402, 375 }; -- Frostwolf Stable Master <Stable Master>
		{ "4'", 10013, 204, 390 }; -- Frostwolf Quartermaster
		{ "5'", 10014, 268, 413 }; -- Wing Commander Guse
		{  "1", 10015, 299, 65 }; -- Iceblood Graveyard
		{  "2", 10016, 234, 303 }; -- Frostwolf Graveyard
		{  "3", 10017, 265, 476 }; -- Frostwolf Relief Hut
	};
	ArathiBasin = {
		{ "A", 10001, 95, 93 }; -- Trollbane Hall
		{ "B", 10002, 409, 400 }; -- Defiler's Den
		{ "1", 10003, 164, 156 }; -- Stables
		{ "2", 10004, 340, 157 }; -- Gold Mine
		{ "3", 10005, 255, 248 }; -- Blacksmith
		{ "4", 10006, 164, 336 }; -- Lumber Mill
		{ "5", 10007, 329, 334 }; -- Farm
	};
	WarsongGulch = {
		{ "A", 10001, 238, 96 }; -- Silverwing Hold
		{ "B", 10002, 256, 365 }; -- Warsong Lumber Mill
	};
	SilithystMustFlow = {
		{ "A", 10001, 289, 173 }; -- Cenarion Hold
		{ "B", 10002, 153, 242 }; -- Alliance's Camp
		{ "C", 10003, 291, 329 }; -- Horde's Camp
	};
	EyeOfTheStorm = {
		{ "A", 10001, 238, 82 }; -- Entrance
		{ "B", 10002, 266, 408 }; -- Entrance
		{ "1", 10003, 251, 247 }; -- Flag
		{ "1", 10004, 163, 196 }; -- Mage Tower
		{ "2", 10005, 347, 204 }; -- Draenei Ruins
		{ "3", 10006, 165, 304 }; -- Fel Reaver Ruins
		{ "4", 10007, 341, 301 }; -- Blood Elf Tower
		{ "1", 10008, 200, 162 }; -- Graveyard
		{ "1", 10008, 304, 161 }; -- Graveyard
		{ "1", 10008, 201, 319 }; -- Graveyard
		{ "1", 10008, 299, 316 }; -- Graveyard
	};
	HalaaPvP = {
		{ "1", 10001, 252, 247 }; -- Halaa
		{ "2", 10002, 184, 207 }; -- Wyvern Camp
		{ "2", 10002, 215, 367 }; -- Wyvern Camp
		{ "2", 10002, 323, 164 }; -- Wyvern Camp
		{ "2", 10002, 358, 298 }; -- Wyvern Camp
	};
	HellfirePeninsulaPvP = {
		{ "1", 10001, 181, 228 }; -- The Stadium
		{ "2", 10002, 295, 183 }; -- The Overlook
		{ "3", 10003, 302, 312 }; -- Broken Hill
	};
	TerokkarForestPvP = {
		{ "1", 10001, 56, 104 }; -- Spirit Towers
		{ "1", 10001, 314, 42 }; -- Spirit Towers
		{ "1", 10001, 482, 148 }; -- Spirit Towers
		{ "1", 10001, 434, 355 }; -- Spirit Towers
		{ "1", 10001, 261, 453 }; -- Spirit Towers
	};
	ZangarmarshPvP = {
		{ "1", 10001, 184, 208 }; -- West Beacon
		{ "2", 10002, 321, 214 }; -- East Beacon
		{ "1'", 10003, 56, 233 }; -- Horde Field Scout
		{ "2'", 10004, 491, 199 }; -- Alliance Field Scout
		{ "1", 10005, 253, 245 }; -- Twinspire Graveyard
	};
	IsleOfConquest = {
		{ "A", 10001, 239, 90 }; -- Start
		{ "B", 10002, 260, 428 }; -- Start
		{ "1", 10003, 107, 93 }; -- The Refinery
		{ "2", 10004, 105, 265 }; -- The Docks
		{ "3", 10005, 254, 264 }; -- The Workshop
		{ "4", 10006, 305, 251 }; -- The Hangar
		{ "5", 10007, 365, 429 }; -- The Quarry
		{ "1", 10008, 82, 302 }; -- Contested Graveyards
		{ "1", 10008, 260, 89 }; -- Contested Graveyards
		{ "1", 10008, 281, 425 }; -- Contested Graveyards
		{ "1", 10008, 205, 261 }; -- Contested Graveyards
		{ "1", 10008, 352, 254 }; -- Contested Graveyards
		{ "2", 10009, 390, 141 }; -- Horde Graveyard
		{ "3", 10010, 94, 374 }; -- Alliance Graveyard
	};
	StrandOfTheAncients = {
		{ "A", 10001, 202, 44 }; -- Start
		{ "A", 10001, 264, 53 }; -- Start
		{ "B", 10002, 251, 264 }; -- Start
		{ "1", 10003, 186, 54 }; -- Massive Seaforium Charge
		{ "1", 10003, 282, 56 }; -- Massive Seaforium Charge
		{ "1", 10003, 119, 176 }; -- Massive Seaforium Charge
		{ "1", 10003, 363, 172 }; -- Massive Seaforium Charge
		{ "1", 10003, 210, 343 }; -- Massive Seaforium Charge
		{ "2", 10004, 269, 443 }; -- Titan Relic
		{ "1", 10005, 172, 68 }; -- Battleground Demolisher
		{ "1", 10005, 294, 66 }; -- Battleground Demolisher
		{ "1", 10005, 131, 183 }; -- Battleground Demolisher
		{ "1", 10005, 349, 176 }; -- Battleground Demolisher
		{ "2", 10006, 186, 191 }; -- Graveyard Flag
		{ "2", 10006, 290, 191 }; -- Graveyard Flag
		{ "2", 10006, 252, 244 }; -- Graveyard Flag
		{ "1", 10007, 245, 131 }; -- Resurrection Point
		{ "1", 10007, 132, 165 }; -- Resurrection Point
		{ "1", 10007, 354, 158 }; -- Resurrection Point
		{ "1", 10007, 197, 291 }; -- Resurrection Point
		{ "1", 10007, 315, 361 }; -- Resurrection Point
	};
	WintergraspPvP = {
		{ "A", 10001, 237, 101, 508, 98, "Blue" }; -- Wintergrasp Fortress
		{ "B", 10002, 414, 179, 794, 233, "Blue" }; -- Valiance Landing Camp
		{ "C", 10003,   9, 198, 148, 260, "Blue" }; -- Warsong Camp
		{ "1", 10004, 238, 130, 509, 148, "Green" }; -- Wintergrasp Fortress
		{ "2", 10005, 361, 224, 706, 298, "Green" }; -- The Sunken Ring
		{ "3", 10006,  90, 216, 275, 292, "Green" }; -- The Broken Temple
		{ "4", 10007, 366, 380, 725, 551, "Green" }; -- Eastspark Workshop
		{ "5", 10008, 111, 379, 307, 552, "Green" }; -- Westspark Workshop
		{ "1", 10009, 476, 352, 896, 508, "Red" }; -- Flamewatch Tower
		{ "2", 10010, 240, 368, 518, 535, "Red" }; -- Winter's Edge Tower
		{ "3", 10011,  27, 325, 170, 465, "Red" }; -- Shadowsight Tower
		{ "1", 10012, 223,  61, 486,  40, "Orange" }; -- Wintergrasp Graveyard
		{ "2", 10013, 378, 178, 732, 235, "Orange" }; -- Sunken Ring Graveyard
		{ "3", 10014,  75, 192, 243, 251, "Orange" }; -- Broken Temple Graveyard
		{ "4", 10015, 350, 385, 695, 557, "Orange" }; -- Southeast Graveyard
		{ "5", 10016, 131, 385, 323, 561, "Orange" }; -- Southwest Graveyard
	};
	TheBattleForGilneas = {
		{ "A", 10001, 200, 409 }; -- Gilnean Stronghold
		{ "B", 10002, 381, 131 }; -- Horde Landing
		{ "1", 10003, 414, 217 }; -- Mines
		{ "2", 10004, 228, 340 }; -- Lighthouse
		{ "3", 10005, 404, 362 }; -- Waterworks
		{ "1", 10006, 419, 154 }; -- Horde Graveyard
		{ "2", 10007, 446, 235 }; -- Contested Graveyards
		{ "2", 10007, 203, 333 }; -- Contested Graveyards
		{ "2", 10007, 375, 424 }; -- Contested Graveyards
	};
	TolBarad = {
		{  "A", 10001, 178, 117 }; -- Attackers
		{  "B", 10002, 251, 274 }; -- Baradin Hold
		{  "1", 10003, 252, 151 }; -- Ironclad Garrison
		{  "2", 10004, 129, 367 }; -- Warden's Vigil
		{  "3", 10005, 374, 361 }; -- Slagworks
		{ "1'", 10006, 214, 252 }; -- Meeting Stone
		{  "1", 10007, 79, 171 }; -- West Spire
		{  "2", 10008, 409, 196 }; -- East Spire
		{  "3", 10009, 261, 410 }; -- South Spire
		{  "1", 10010, 215, 182 }; -- Graveyard
		{  "1", 10010, 186, 385 }; -- Graveyard
		{  "1", 10010, 390, 311 }; -- Graveyard
		{  "2", 10011, 189, 221 }; -- Cursed Depths
		{  "3", 10012, 209, 362 }; -- The Hole
		{  "4", 10013, 320, 279 }; -- D-Block
	};
	TwinPeaks = {
		{ "A", 10001, 298, 118 }; -- Wildhammer Longhouse
		{ "B", 10002, 230, 366 }; -- Dragonmaw Clan Compound
		{ "1", 10003, 179, 221 }; -- Alliance Graveyard
		{ "2", 10004, 319, 252 }; -- Horde Graveyard
	};
	SilvershardMines = {
		{ "A", 10001, 365, 249 }; -- Start
		{ "B", 10002, 306, 387 }; -- Start
		{ "1", 10003, 329, 314 }; -- Mine Cart Spawn Point
		{ "2", 10004, 138, 288 }; -- Mine Cart Depot
		{ "2", 10004, 240, 425 }; -- Mine Cart Depot
		{ "2", 10004, 445, 201 }; -- Mine Cart Depot
		{ "2", 10004, 402, 392 }; -- Mine Cart Depot
	};
	TempleofKotmogu = {
		{ "A", 10001, 388, 248 }; -- Start
		{ "B", 10002, 99, 250 }; -- Start
		{ "1", 10003, 190, 206 }; -- Orb of Power
		{ "1", 10003, 297, 206 }; -- Orb of Power
		{ "1", 10003, 190, 292 }; -- Orb of Power
		{ "1", 10003, 297, 292 }; -- Orb of Power
		{ "2", 10004, 246, 248 }; -- Center Point (Maximum Points)
	};
	DeepwindGorge = {
		{ "A", 10001, 100, 209 }; -- Start
		{ "B", 10002, 408, 282 }; -- Start
		{ "1", 10003, 291, 135 }; -- Pandaren Mine
		{ "2", 10004, 254, 247 }; -- Center Mine
		{ "3", 10005, 220, 357 }; -- Goblin Mine
	};
	Ashran = {
		{ "A", 10001, 202, 54 }; -- Warspear
		{ "B", 10002, 176, 441 }; -- Stormshield
		{ "1", 10003, 148, 182 }; -- Amphitheater of Annihilation
		{ "2", 10004, 241, 189 }; -- Emberfall Tower
		{ "3", 10005, 323, 144 }; -- Brute's Rise
		{ "4", 10006, 308, 205 }; -- The Dark Woods
		{ "5", 10007, 124, 246 }; -- Ring of Conquest
		{ "6", 10008, 281, 246 }; -- Seat of Kor'lok
		{ "7", 10009, 154, 303 }; -- Ashmaul Burial Grounds
		{ "8", 10010, 298, 338 }; -- Molten Quarry
	};
};

for k, v in pairs(myDB) do
	AtlasMaps_NPC_DB[k] = v;
end
