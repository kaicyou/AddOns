-- $Id: Atlas_Cataclysm_DB.lua 7 2016-05-11 10:14:28Z arith $
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
-- Cataclysm Instances
--************************************************
local myDB = {
	BaradinHold = {
		{ 1, 139, 425, 320 }; -- Argaloth
		{ 2, 140, 72, 319 }; -- Occu'thar
		{ 3, 339, 249, 139 }; -- Alizabal, Mistress of Hate
		{ "A", 10001, 252, 432 };
	};
	BlackrockCaverns = {
		{ 1, 105, 166, 311 }; -- Rom'ogg Bonecrusher
		{ 2, 106, 143, 102 }; -- Corla, Herald of Twilight
		{ 3, 107, 281, 301 }; -- Karsh Steelbender
		{ 4, 108, 363, 381 }; -- Beauty
		{ 5, 109, 377, 236 }; -- Ascendant Lord Obsidius
		{ "A", 10001, 14, 285 };
		{ "1'", 10002, 66, 299 };
		{ "2'", 10003, 245, 269 };
	};
	BlackwingDescent = {
		{ 1, 170, 132, 370 }; -- Magmaw
		{ 2, 169, 311, 372 }; -- Omnotron Defense System
		{ 3, 172, 77, 246 }; -- Chimaeron
		{ 4, 173, 364, 247 }; -- Maloriak
		{ 5, 171, 224, 109 }; -- Atramedes
		{ 6, 174, 223, 246 }; -- Nefarian's End
		{ "A", 10001, 190, 435 };
	};
	CoTDragonSoulA = {
		{ 1, 311, 250, 301 }; -- Morchok
		{ 5, 331, 248, 252 }; -- Ultraxion
		{ "A", 10001, 251, 372 };
		{ "B", 10002, 254, 268 };
	};
	CoTDragonSoulB = {
		{ 2, 324, 135, 132 }; -- Warlord Zon'ozz
		{ 3, 325, 302, 370 }; -- Yor'sahj the Unsleeping
		{ 4, 317, 393, 130 }; -- Hagara the Stormbinder
		{ "C", 10001, 30, 99 };
		{ "D", 10001, 346, 468 };
		{ "E", 10001, 396, 81 };
	};
	CoTDragonSoulC = {
		{ 6, 332, 101, 86 }; -- Warmaster Blackhorn
		{ 7, 318, 69, 345 }; -- Spine of Deathwing
		{ 8, 333, 333, 318 }; -- Madness of Deathwing	
	};
	CoTEndTime = {
		{ 1, 340, 94, 143 }; -- Echo of Baine
		{ 2, 285, 294, 409 }; -- Echo of Jaina
		{ 3, 323, 218, 259 }; -- Echo of Sylvanas
		{ 4, 283, 380, 467 }; -- Echo of Tyrande
		{ 5, 289, 475, 183 }; -- Murozond
		{ "A", 10001, 482, 270 };
		{ "1'", 10002, 133, 142 };
		{ "1'", 10002, 175, 251 };
		{ "1'", 10002, 284, 419 };
		{ "1'", 10002, 380, 432 };
		{ "1'", 10002, 467, 206 };
	};
	CoTHourOfTwilight = {
		{ 1, 322, 340, 101 }; -- Arcurion
		{ 2, 342, 187, 231 }; -- Asira Dawnslayer
		{ 3, 341, 270, 435 }; -- Archbishop Benedictus
		{ "A", 10001, 271, 41 };
	};
	CoTWellOfEternity = {
		{ 1, 290, 138, 311 }; -- Peroth'arn
		{ 2, 291, 241, 278 }; -- Queen Azshara
		{ 3, 292, 424, 314 }; -- Mannoroth and Varo'then
		{ "A", 10001, 159, 357 };
		{ "1'", 10002, 126, 374 };
		{ "1'", 10002, 364, 399 };
		{ "2'", 10003, 164, 265 };
		{ "2'", 10003, 231, 266 };
		{ "2'", 10003, 364, 417 };
	};
	Firelands = {
		{ 1, 192, 140, 320 }; -- Beth'tilac
		{ 2, 193, 336, 438 }; -- Lord Rhyolith
		{ 3, 194, 339, 330 }; -- Alysrazor
		{ 4, 195, 263, 353 }; -- Shannox
		{ 5, 196, 264, 308 }; -- Baleroc, the Gatekeeper
		{ 6, 197, 265, 190 }; -- Majordomo Staghelm
		{ 7, 198, 264, 56 }; -- Ragnaros
		{ "A", 10001, 161, 483 };
		{ "B", 10002, 123, 196 };
		{ "B", 10002, 174, 288 };
		{ "1'", 10003, 283, 237 };
		{ "1'", 10003, 194, 438 };
	};
	GrimBatol = {
		{ 1, 131, 176, 320 }; -- General Umbriss
		{ 2, 132, 238, 181 }; -- Forgemaster Throngus
		{ 3, 133, 336, 135 }; -- Drahga Shadowburner
		{ 4, 134, 429, 343 }; -- Erudax, the Duke of Below
		{ "A", 10001, 7, 275 };
		{ "1'", 10002, 61, 270 };
	};
	HallsOfOrigination = {
		{ 1, 124, 85, 290 }; -- Temple Guardian Anhuur
		{ 2, 125, 348, 230 }; -- Earthrager Ptah
		{ 3, 126, 72, 93 }; -- Anraphet
		{ 4, 127, 170, 382 }; -- Isiset, Construct of Magic
		{ 5, 128, 245, 454 }; -- Ammunae, Construct of Life
		{ 6, 129, 319, 382 }; -- Setesh, Construct of Destruction
		{ 7, 130, 242, 306 }; -- Rajh, Construct of Sun
		{ "A", 10001, 41, 418 };
		{ "1'", 10002, 32, 405 };
		{ "1'", 10002, 75, 44 };
		{ "1'", 10002, 148, 229 };
		{ "1'", 10002, 236, 376 };
		{ "1'", 10002, 468, 229 };
		{ "2'", 10003, 74, 206 };
		{ "3'", 10004, 23, 281 };
	};
	LostCityOfTolvir = {
		{ 1, 117, 234, 219 }; -- General Husam
		{ 2, 118, 379, 313 }; -- Lockmaw
		{ 3, 119, 183, 286 }; -- High Prophet Barim
		{ 4, 122, 248, 253 }; -- Siamat
		{ "A", 10001, 214, 146 };
		{ "1'", 10002, 210, 160 };
	};
	ShadowfangKeep = {
		{ 1, 96, 363, 408 }; -- Baron Ashbury
		{ 2, 97, 54, 339 }; -- Baron Silverlaine
		{ 3, 98, 171, 353 }; -- Commander Springvale
		{ 4, 99, 290, 173 }; -- Lord Walden
		{ 5, 100, 207, 51 }; -- Lord Godfrey
		{ "A", 10001, 383, 368 };
		{ "B", 10002, 163, 214 };
		{ "B", 10002, 219, 288 };
		{ "C", 10002, 43, 364 };
		{ "C", 10002, 106, 438 };
		{ "1", 10003, 226, 333 };
		{ "1'", 10004, 359, 361 };
		{ "2'", 10005, 392, 340 };
		{ "3'", 10006, 318, 372 };
	};
	TheBastionOfTwilight = {
		{ 1, 156, 154, 103 }; -- Halfus Wyrmbreaker
		{ 2, 157, 155, 280 }; -- Theralion and Valiona
		{ 3, 158, 112, 395 }; -- Ascendant Council
		{ 4, 167, 222, 458 }; -- Cho'gall
		{ 5, 168, 393, 302 }; -- Sinestra
		{ "A", 10001, 93, 210 };
		{ "B", 10002, 204, 457 };
		{ "B", 10002, 416, 394 };
		{ "1'", 10003, 77, 165 };
		{ "1'", 10003, 110, 165 };
	};
	TheDeadmines = {
		{ 1, 89, 113, 287 }; -- Glubtok
		{ 2, 90, 178, 399 }; -- Helix Gearbreaker
		{ 3, 91, 228, 300 }; -- Foe Reaper 5000 
		{ 4, 92, 397, 178 }; -- Admiral Ripsnarl
		{ "4", 93, 400, 190 }; -- "Captain"Cookie
		{ "4", 95, 416, 178 }; -- Vanessa VanCleef
		{ "A", 10001, 54, 109 };
		{ "B", 10002, 496, 234 };
		{ "1'", 10003, 70, 166 };
		{ "2'", 10004, 44, 159 };
		{ "2'", 10004, 158, 399 };
		{ "2'", 10004, 269, 291 };
		{ "2'", 10004, 391, 203 };
	};
	TheDeadminesEnt = {
		{ "A", 10001, 334, 20 }; -- Entrance
		{ "B", 10002, 79, 249 }; -- The Deadmines
		{ "1", 10003, 439, 204 }; -- Marisa du'Paige
		{ "1", 10003, 319, 324 }; -- Marisa du'Paige
		{ "2", 10004, 361, 363 }; -- Brainwashed Noble
		{ "3", 10005, 319, 449 }; -- Foreman Thistlenettle
	};
	TheStonecore = {
		{ 1, 110, 336, 289 }; -- Corborus
		{ 2, 111, 128, 219 }; -- Slabhide
		{ 3, 112, 221, 108 }; -- Ozruk
		{ 4, 113, 282, 197 }; -- High Priestess Azil
		{ "A", 10001, 271, 493 };
		{ "B", 10002, 374, 200 };
		{ "1'", 10003, 123, 203 };
		{ "1'", 10003, 260, 481 };
	};
	TheVortexPinnacle = {
		{ 1, 114, 341, 216 }; -- Grand Vizier Ertan
		{ 2, 115, 312, 455 }; -- Altairus
		{ 3, 116, 100, 171 }; -- Asaad, Caliph of Zephyrs
		{ "A", 10001, 343, 35 };
		{ "1'", 10002, 348, 15 };
		{ "1'", 10002, 325, 38 };
		{ "1'", 10002, 372, 236 };
		{ "1'", 10002, 292, 438 };
		{ "2'", 10003, 416, 124 };
	};
	ThroneOfTheFourWinds = {
		{ 1, 154, 134, 250 }; -- The Conclave of Wind
		{ 1, 154, 249, 137 }; -- The Conclave of Wind
		{ 1, 154, 364, 251 }; -- The Conclave of Wind
		{ 2, 155, 248, 250 }; -- Al'Akir
		{ "A", 10001, 250, 363 };
	};
	ThroneOfTheTides = {
		{ 1, 101, 249, 45 }; -- Lady Naz'jar
		{ 2, 102, 248, 119 }; -- Commander Ulthok, the Festering Prince
		{ 3, 103, 339, 253 }; -- Mindbender Ghur'sha
		{ 4, 104, 158, 254 }; -- Ozumat
		{ "A", 10001, 252, 479 };
		{ "B", 10002, 253, 293 };
		{ "B", 10002, 249, 250 };
		{ "1'", 10003, 255, 155 };
		{ "1'", 10003, 242, 464 };
	};
	ZulAman = {
		{ 1, 186, 117, 145 }; -- Akil'zon
		{ 2, 187, 147, 364 }; -- Nalorakk
		{ 3, 188, 240, 343 }; -- Jan'alai
		{ 4, 189, 254, 143 }; -- Halazzi
		{ 5, 190, 328, 268 }; -- Hex Lord Malacrass
		{ 6, 191, 452, 268 }; -- Daakara
		{ "A", 10001, 37, 266 };
		{ "1'", 10002, 305, 205 };
		{ "2'", 10003, 180, 282 };
	};	
	ZulGurub = {
		{ 1, 10005, 164, 236 };
		{ 2, 10006, 255, 254 };
		{ 3, 10007, 251, 220 };
		{ 4, 10008, 305, 272 };
		{ 5, 175, 323, 293 }; -- High Priest Venoxis
		{ 6, 10009, 283, 290 };
		{ 7, 10010, 349, 333 };
		{ 8, 10011, 379, 397 };
		{ 9, 176, 414, 445 }; -- Bloodlord Mandokir
		{ 10, 10013, 371, 289 };
		{ 11, 10015, 350, 269 };
		{ 12, 10016, 402, 231 };
		{ 13, 10017, 429, 151 };
		{ 14, 10018, 289, 104 };
		{ 15, 181, 288, 72 }; -- High Priestess Kilnara
		{ 16, 184, 141, 103 }; -- Zanzil
		{ 17, 185, 306, 194 }; -- Jin'do the Godbreaker
		{ "A", 10001, 125, 245 };
		{ "1'", 10002, 114, 258 };
		{ "2'", 10003, 138, 254 };
		{ "3'", 10004, 137, 234 };
		{ "4'", 10012, 387, 432 };
		{ "5'", 10014, 383, 268 };
		{ "6'", 10019, 200, 115 };
	};
};

for k, v in pairs(myDB) do
	AtlasMaps_NPC_DB[k] = v;
end
