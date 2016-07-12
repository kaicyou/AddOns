-- $Id: Atlas_BurningCrusade_DB.lua 8 2016-05-11 10:05:41Z arith $
--[[

	Atlas, a World of Warcraft instance map browser
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


-- Atlas Map NPC Description Data
--************************************************
-- Burning Crusade Instances
--************************************************
local myDB = {
	AuchindounEnt = {
		{ "A", 10001, 52, 255 }; -- Auchenai Crypts
		{ "B", 10002, 251, 53 }; -- Mana-Tombs
		{ "C", 10003, 450, 251 }; -- Sethekk Halls
		{ "D", 10004, 251, 451 }; -- Shadow Labyrinth
		{ "E", 10005, 97, 97 }; -- Entrance
		{ "E", 10005, 405, 100 }; -- Entrance
		{ "E", 10005, 97, 406 }; -- Entrance
		{ "E", 10005, 405, 406 }; -- Entrance
		{ "1'", 10006, 88, 250 }; -- Clarissa
		{ "2'", 10007, 253, 88 }; -- Nexus-Prince Haramad
		{ "3'", 10008, 419, 253 }; -- Dealer Tariq <Shady Dealer>
		{ "3'", 10008, 253, 414 }; -- Dealer Tariq <Shady Dealer>
		{ "4'", 10009, 253, 251 }; -- Meeting Stone
	};
	AuchAuchenaiCrypts = {
		{ 1, 523, 220, 362 }; -- Shirrak the Dead Watcher
		{ 2, 524, 448, 227 }; -- Exarch Maladaar
		{ "A", 10001, 104, 400 };
		{ "1'", 10002, 260, 66 };
	};
	AuchManaTombs = {
		{ 1, 534, 253, 142 }; -- Pandemonius
		{ 2, 535, 357, 394 }; -- Tavarok
		{ 3, 537, 127, 266 }; -- Nexus-Prince Shaffar
		{ "A", 10001, 87, 12 };
		{ "1'", 10002, 359, 66 };
		{ "2'", 10003, 211, 429 };
	};
	AuchSethekkHalls = {
		{ 1, 541, 230, 317 }; -- Darkweaver Syth
		{ 2, 542, 91, 253 }; -- Anzu
		{ 3, 543, 95, 88 }; -- Talon King Ikiss
		{ "A", 10001, 498, 231 };
	};
	AuchShadowLabyrinth = {
		{ 1, 544, 60, 217 }; -- Ambassador Hellmaw
		{ 2, 545, 95, 363 }; -- Blackheart the Inciter
		{ 3, 546, 272, 293 }; -- Grandmaster Vorpil
		{ 4, 547, 456, 216 }; -- Murmur
		{ "A", 10001, 24, 40 };
		{ "1", 10002, 470, 186 };
		{ "1'", 10003, 21, 156 };
	};
	BlackTempleStart = {
		{ "A", 10001, 92, 477 };
		{ "B", 10002, 492, 119 };
		{ "C", 10003, 496, 256 };
		{ "D", 10004, 240, 95 };
		{ "1", 10005, 246, 306 };
		{ "2", 10006, 214, 191 };
		{ "3", 10007, 334, 357 };
		{ "1'", 10008, 83, 459 };
		{ "2'", 10009, 464, 189 };
	};
	BlackTempleBasement = {
		{ "B", 10001, 337, 161 };
		{ "C", 10002, 294, 268 };
		{ "4", 10003, 270, 207 };
		{ "5", 10004, 359, 429 };
		{ "6", 10005, 72, 266 };
	};
	BlackTempleTop = {
		{ "D", 10001, 48, 120 };
		{ "E", 10002, 82, 263 };
		{ "E", 10002, 280, 252 };
		{ "7", 10003, 430, 60 };
		{ "8", 10004, 277, 294 };
		{ "9", 10005, 82, 386 };
	};
	CFRSerpentshrineCavern = {
		{ "A", 10001, 10, 333 };
		{ "B", 10002, 49, 268 };
		{ "B", 10002, 93, 319 };
		{ "1", 10003, 190, 379 };
		{ "2", 10004, 212, 270 };
		{ "3", 10005, 225, 137 };
		{ "4", 10006, 256, 85 };
		{ "5", 10007, 334, 136 };
		{ "6", 10008, 411, 277 };
	};
	CFRTheSlavePens = {
		{ 1, 570, 243, 167 }; -- Mennu the Betrayer
		{ 2, 571, 288, 220 }; -- Rokmar the Crackler
		{ 3, 572, 401, 369 }; -- Quagmirran
		{ "A", 10001, 116, 103 };
		{ "1", 10002, 160, 249 };
		{ "1'", 10003, 245, 345 };
		{ "2'", 10004, 292, 366 };
		{ "3'", 10005, 488, 309 };
	};
	CFRTheSteamvault = {
		{ 1, 573, 270, 80 }; -- Hydromancer Thespia
		{ 2, 574, 123, 401 }; -- Mekgineer Steamrigger
		{ 3, 575, 470, 217 }; -- Warlord Kalithresh
		{ "A", 10001, 5, 176 };
		{ "1", 10002, 264, 125 };
	};
	CFRTheUnderbog = {
		{ 1, 576, 360, 423 }; -- Hungarfen
		{ 2, 577, 414, 169 }; -- Ghaz'an
		{ 3, 578, 195, 148 }; -- Swamplord Musel'ek
		{ 4, 579, 101, 230 }; -- The Black Stalker
		{ "A", 10001, 118, 340 };
		{ "1'", 10002, 359, 149 };
	};
	CoilfangReservoirEnt = {
		{ "A", 10001, 79, 321 }; -- The Slave Pens
		{ "B", 10002, 139, 230 }; -- The Steamvault
		{ "C", 10003, 241, 224 }; -- Serpentshrine Cavern
		{ "D", 10004, 349, 292 }; -- The Underbog
		{ "E", 10005, 241, 378 }; -- Entrance - Underwater
		{ "1'", 10006, 251, 321 }; -- Meeting Stone
		{ "2'", 10007, 227, 308 }; -- Mortog Steamhead
	};
	CoTBlackMorass = {
		{ "A", 10001, 255, 123 };
		{ "X", 10002, 262, 243 };
		{ "X", 10002, 226, 271 };
		{ "X", 10002, 307, 279 };
		{ "X", 10002, 305, 314 };
		{ "1'", 10003, 249, 346 };
	};
	CoTHyjal = {
		{ "A", 10001, 102, 252 };
		{ "B", 10002, 281, 189 };
		{ "C", 10003, 374, 238 };
		{ "1", 10004, 120, 241 };
		{ "2", 10005, 120, 262 };
		{ "3", 10006, 298, 178 };
		{ "4", 10007, 298, 199 };
		{ "5", 10008, 409, 167 };
	};
	CoTHyjalEnt = {
		{ "A", 10001, 380, 303 }; -- Entrance
		{ "B", 10002, 298, 410 }; -- Alliance Base
		{ "C", 10003, 221, 124 }; -- Horde Encampment
		{ "D", 10004, 143, 254 }; -- Night Elf Village
		{ "1'", 10005, 249, 268 }; -- Indormi <Keeper of Ancient Gem Lore>
	};
	CoTOldHillsbrad = {
		{ 1, 538, 402, 286 }; -- Lieutenant Drake
		{ 2, 539, 355, 298 }; -- Captain Skarloc
		{ 3, 540, 220, 123 }; -- Epoch Hunter
		{ "A", 10001, 67, 201 };
		{ "B", 10002, 339, 297 };
		{ "C", 10003, 114, 349 };
		{ "D", 10004, 218, 150 };
		{ "1'", 10005, 392, 251 };
		{ "2'", 10006, 237, 176 };
		{ "4", 10007, 182, 228 };
		{ "3'", 10008, 152, 228 };
	};
	GruulsLair = {
		{ "A", 10001, 458, 407 };
		{ "1", 10002, 274, 243 };
		{ "2", 10003, 91, 129 };
	};
	HCBloodFurnace = {
		{ 1, 555, 138, 191 }; -- The Maker
		{ 2, 556, 198, 80 }; -- Broggok
		{ 3, 557, 323, 191 }; -- Keli'dan the Breaker
		{ "A", 10001, 232, 472 };
	};
	HCHellfireRamparts = {
		{ 1, 527, 392, 143 }; -- Watchkeeper Gargolmar
		{ 2, 528, 106, 80 }; -- Omor the Unscarred
		{ 3, 529, 77, 418 }; -- Vazruden the Herald
		{ "A", 10001, 197, 354 };
	};
	HCMagtheridonsLair = {
		{ "A", 10001, 111, 67 };
		{ "1", 10002, 269, 359 };
	};
	HCTheShatteredHalls = {
		{ 1, 566, 114, 328 }; -- Grand Warlock Nethekurse
		{ 2, 728, 69, 47 }; -- Blood Guard Porung
		{ 3, 568, 283, 166 }; -- Warbringer O'mrogg
		{ 4, 569, 401, 287 }; -- Warchief Kargath Bladefist
		{ "A", 10001, 331, 488 };
		{ "1'", 10002, 114, 375 };
	};
	HellfireCitadelEnt = {
		{ "A", 10001, 275, 306 }; -- Hellfire Ramparts
		{ "B", 10002, 305, 253 }; -- The Shattered Halls
		{ "C", 10003, 201, 249 }; -- The Blood Furnace
		{ "D", 10004, 210, 286 }; -- Magtheridon's Lair
		{ "1'", 10005, 190, 344 }; -- Meeting Stone of Magtheridon's Lair
		{ "2'", 10006, 309, 283 }; -- Meeting Stone of Hellfire Citadel
		{ "3'", 10007, 205, 489 }; -- Steps and path to the Blood Furnace
		{ "4'", 10008, 331, 377 }; -- Path to the Hellfire Ramparts and Shattered Halls
		{ "4'", 10008, 326, 134 }; -- Path to the Hellfire Ramparts and Shattered Halls
	};
	KarazhanStart = {
		{ "A", 10001, 138, 207 };
		{ "B", 10002, 100, 156 };
		{ "B", 10002, 112, 342 };
		{ "C", 10002, 45, 215 };
		{ "C", 10002, 66, 438 };
		{ "D", 10002, 28, 30 };
		{ "D", 10002, 313, 275 };
		{ "E", 10002, 155, 251 };
		{ "E", 10002, 427, 309 };
		{ "F", 10002, 235, 207 };
		{ "F", 10002, 224, 320 };
		{ "G", 10002, 283, 16 };
		{ "G", 10002, 286, 137 };
		{ "H", 10002, 410, 141 };
		{ "H", 10002, 399, 384 };
		{ "I", 10002, 363, 179 };
		{ "I", 10002, 352, 421 };
		{ "J", 10002, 436, 164 };
		{ "J", 10002, 426, 409 };
		{ "1", 10003, 75, 218 };
		{ "2", 10004, 36, 310 };
		{ "3", 10005, 473, 313 };
		{ "4", 10006, 205, 300 };
		{ "5", 10007, 349, 493 };
		{ "1", 10008, 145, 62 };
		{ "1'", 10009, 141, 169 };
		{ "2'", 10010, 101, 170 };
		{ "3'", 10011, 105, 211 };
		{ "4'", 10012, 59, 193 };
		{ "5'", 10013, 56, 406 };
		{ "6'", 10014, 411, 239 };
		{ "7'", 10015, 359, 361 };
		{ "8'", 10016, 233, 332 };
		{ "9'", 10017, 221, 281 };
	};
	KarazhanEnd = {
		{ "I", 10001, 210, 39 };
		{ "J", 10002, 179, 44 };
		{ "K", 10003, 39, 227 };
		{ "K", 10003, 172, 385 };
		{ "L", 10004, 193, 312 };
		{ "M", 10005, 189, 406 };
		{ "M", 10005, 356, 227 };
		{ "N", 10006, 422, 142 };
		{ "N", 10006, 419, 14 };
		{ "O", 10007, 497, 65 };
		{ "O", 10007, 497, 304 };
		{ "O", 10007, 497, 205 };
		{ "O", 10007, 486, 492 };
		{ "7", 10008, 96, 80 };
		{ "8", 10009, 115, 389 };
		{ "9", 10010, 290, 296 };
		{ "10", 10011, 232, 154 };
		{ "11", 10012, 429, 51 };
		{ "12", 10013, 463, 399 };
		{ "10'", 10014, 75, 149 };
		{ "11'", 10015, 21, 162 };
		{ "12'", 10016, 22, 210 };
		{ "13'", 10017, 401, 117 };
		{ "14'", 10018, 404, 75 };
	};
	KarazhanEnt = {
		{ "A", 10001, 279, 289 }; -- Karazhan, Front
		{ "B", 10002, 327, 192 }; -- Karazhan, Back
		{ "1'", 10003, 290, 304 }; -- Archmage Leryda
		{ "2'", 10004, 300, 355 }; -- Stairs to Underground Pond
		{ "3'", 10005, 325, 365 }; -- Stairs to Underground Well
		{ "4'", 10006, 226, 364 }; -- Charred Bone Fragment
		{ "5'", 10007, 274, 315 }; -- Meeting Stone
		{ "6'", 10008, 94, 288 }; -- Graveyard
	};
	MagistersTerrace = {
		{ 1, 530, 210, 123 }; -- Selin Fireheart
		{ 2, 531, 424, 153 }; -- Vexallus
		{ 3, 532, 190, 257 }; -- Priestess Delrissa
		{ 4, 533, 34, 236 }; -- Kael'thas Sunstrider
		{ "A", 10001, 212, 397 };
		{ "B", 10002, 10, 238 };
		{ "1'", 10003, 313, 149 };
		{ "2'", 10004, 487, 154 };
	};
	SunwellPlateau = {
		{ "A", 10001, 174, 90 };
		{ "1", 10002, 174, 162 };
		{ "2", 10003, 338, 273 };
		{ "3", 10004, 319, 106 };
		{ "4", 10005, 320, 164 };
	};
	TempestKeepArcatraz = {
		{ 1, 548, 331, 234 }; -- Zereketh the Unbound
		{ 2, 549, 142, 353 }; -- Dalliah the Doomsayer
		{ 3, 550, 65, 353 }; -- Wrath-Scryer Soccothrates
		{ 4, 551, 364, 81 }; -- Harbinger Skyriss
		{ "A", 10001, 187, 490 };
		{ "1", 10002, 238, 179 };
		{ "1'", 10003, 199, 75 };
	};
	TempestKeepBotanica = {
		{ 1, 558, 221, 144 }; -- Commander Sarannis
		{ 2, 559, 114, 144 }; -- High Botanist Freywinn
		{ 3, 560, 31, 235 }; -- Thorngrin the Tender
		{ 4, 561, 167, 352 }; -- Laj
		{ 5, 562, 168, 197 }; -- Warp Splinter
		{ "A", 10001, 495, 211 };
		{ "B", 10002, 168, 134 };
	};
	TempestKeepEnt = {
		{ "A", 10001, 233, 354 }; -- The Mechanar
		{ "B", 10002, 266, 127 }; -- The Botanica
		{ "C", 10003, 332, 165 }; -- The Arcatraz
		{ "D", 10004, 257, 258 }; -- Tempest Keep
	};
	TempestKeepMechanar = {
		{ 1, 10003, 227, 281 };
		{ 2, 10004, 331, 256 };
		{ 3, 563, 295, 175 }; -- Mechano-Lord Capacitus
		{ 4, 564, 234, 25 }; -- Nethermancer Sepethrea
		{ 5, 565, 82, 232 }; -- Pathaleon the Calculator	
		{ "A", 10001, 205, 482 };
		{ "B", 10002, 46, 359 };
		{ "1'", 10005, 162, 153 };
	};
	TempestKeepTheEye = {
		{ "A", 10001, 230, 481 };
		{ "1", 10002, 250, 283 };
		{ "2", 10003, 61, 233 };
		{ "3", 10004, 438, 231 };
		{ "4", 10005, 251, 52 };
	};
};

for k, v in pairs(myDB) do
	AtlasMaps_NPC_DB[k] = v;
end
