-- $Id: Atlas_MistsofPandaria_DB.lua 6 2016-05-11 10:06:58Z arith $
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
-- Mists of Pandaria Instances
--************************************************
local myDB = {
	GateoftheSettingSun = {
		{ 1, 655, 235, 400 }; -- Saboteur Kip'tilak
		{ 2, 675, 235, 169 }; -- Striker Ga'dok
		{ 3, 676, 235, 138 }; -- Commander Ri'mok
		{ 4, 649, 229, 284 }; -- Raigonn
		{ "A", 10001, 327, 401 };
		{ "B", 10002, 309, 291 };
	};
	HeartofFear = {
		{ 1, 745, 318, 250 }; -- Imperial Vizier Zor'lok
		{ 2, 744, 269, 74 }; -- Blade Lord Ta'yak
		{ 3, 713, 428, 46 }; -- Garalon
		{ 4, 741, 427, 124 }; -- Wind Lord Mel'jarak
		{ 5, 737, 225, 377 }; -- Amber-Shaper Un'sok
		{ 6, 743, 64, 377 }; -- Grand Empress Shek'zeer
		{ "A", 10001, 161, 289 };
		{ "B", 10002, 151, 64 };
		{ "B", 10002, 433, 82 };
	};
	MoguShanPalace = {
		{ 1, 708, 203, 454 }; -- Trial of the King
		{ 2, 690, 83, 247 }; -- Gekkan
		{ 3, 698, 379, 309 }; -- Xin the Weaponmaster
		{ "A", 10001, 7, 61 };
		{ "B", 10002, 135, 268 };
		{ "B", 10002, 263, 340 };
		{ "C", 10002, 310, 459 };
		{ "C", 10002, 430, 59 };
		{ "1'", 10003, 34, 52 };
	};
	MoguShanVaults = {
		{ 1, 679, 364, 315 }; -- The Stone Guard
		{ 2, 689, 316, 240 }; -- Feng the Accursed
		{ 3, 682, 318, 116 }; -- Gara'jal the Spiritbinder
		{ 4, 687, 181, 142 }; -- The Spirit Kings
		{ 5, 726, 46, 303 }; -- Elegon
		{ 6, 677, 236, 382 }; -- Will of the Emperor
		{ "A", 10001, 474, 344 };
		{ "B", 10002, 216, 165 };
		{ "B", 10002, 229, 197 };
	};
	ScarletHalls = {
		{ 1, 10002, 230, 384 }; -- Commander Lindon
		{ 2, 660, 260, 308 }; -- Houndmaster Braun
		{ 3, 654, 326, 113 }; -- Armsmaster Harlan
		{ 4, 656, 223, 21 }; -- Flameweaver Koegler
		{ "A", 10001, 153, 496 };
		{ "1'", 10003, 158, 477 };
		{ "2'", 10004, 241, 453 }; 
		{ "3'", 10005, 269, 287 };
	};
	ScarletMonastery = {
		{ 1, 688, 131, 61 }; -- Thalnos the Soulrender
		{ 2, 671, 231, 332 }; -- Brother Korloff
		{ 3, 674, 226, 439 }; -- High Inquisitor Whitemane
		{ "A", 10001, 382, 62 };
		{ "1'", 10002, 304, 62 };
		{ "1", 10003, 227, 87 };
	};
	ScarletMonasteryEnt = {
		{ "A", 10001, 93, 359 }; -- Entrance
		{ "B", 10002, 286, 176 }; -- Scarlet Monastery
		{ "C", 10003, 350, 285 }; -- Scarlet Halls
	};
	Scholomance = {
		{ 1, 659, 140, 133 }; -- Instructor Chillheart
		{ 2, 663, 394, 57 }; -- Jandice Barov
		{ 3, 665, 329, 90 }; -- Rattlegore
		{ 4, 666, 356, 165 }; -- Lilian Voss
		{ 5, 10003, 360, 291 }; --Professor Slate
		{ 6, 684, 286, 391 }; -- Darkmaster Gandling
		{ "A", 10001, 6, 165 }; 
		{ "B", 10002, 201, 61 };
		{ "B", 10002, 500, 90 };
		{ "C", 10002, 136, 213 };
		{ "C", 10002, 393, 344 };
		{ "D", 10002, 136, 243 };
		{ "D", 10002, 287, 372 };
		{ "1'", 10004, 36, 130 };
		{ "2'", 10005, 111, 125 };
		{ "3'", 10006, 463, 96 };
		{ "4'", 10007, 317, 153 };
		{ "5'", 10008, 343, 203 };
		{ "6'", 10009, 344, 226 };
		
	};
	ShadoPanMonasteryA = {
		{ 1, 673, 329, 310 }; -- Gu Cloudstrike
		{ 4, 686, 366, 236 }; -- Taran Zhu
		{ "B", 10001, 374, 311 };
		{ "C", 10001, 301, 345 };
		{ "D", 10001, 287, 369 };
		{ "E", 10001, 183, 351 };
		{ "F", 10001, 120, 310 };
		{ "G", 10001, 159, 195 };
		{ "H", 10001, 222, 210 };
	};
	ShadoPanMonasteryB = {
		{ 2, 657, 55, 307 }; -- Master Snowdrift
		{ 3, 685, 373, 373 }; -- Sha of Violence
		{ "A", 10001, 216, 174 };
		{ "B", 10002, 40, 164 };
		{ "C", 10002, 407, 45 };
		{ "D", 10002, 318, 194 };
		{ "E", 10002, 203, 454 };
		{ "F", 10002, 41, 282 };
		{ "G", 10002, 270, 479 };
		{ "H", 10002, 418, 419 };
		{ "1'", 10003, 189, 160 };
	};
	SiegeofNiuzaoTempleA = {
		{ 1, 693, 143, 158 }; -- Vizier Jin'bak
		{ "A", 10001, 212, 323 };
		{ "B", 10002, 150, 250 };
		{ "B", 10002, 379, 443 };
		{ "C", 10002, 263, 346 };
		{ "1'", 10003, 189, 251 };
	};
	SiegeofNiuzaoTempleB = {
		{ 2, 738, 205, 325 }; -- Commander Vo'jak
		{ 3, 692, 304, 236 }; -- General Pa'valak
		{ 4, 727, 301, 141 }; -- Wing Leader Ner'onok
		{ "C", 10001, 261, 313 };
	};
	SiegeofOrgrimmarA = {
		{ 1, 852, 208, 101 }; -- Immerseus
		{ 3, 866, 272, 349 }; -- Norushen
		{ 4, 867, 129, 380 }; -- Sha of Pride
		{ "A", 10001, 465, 100 };
		{ "B", 10002, 61, 184 };
		{ "C", 10002, 319, 183 };
		{ "D", 10002, 78, 345 };
		{ "D", 10002, 99, 439 };
	};
	SiegeofOrgrimmarB = {
		{ 2, 849, 168, 195 }; -- The Fallen Protectors
		{ "B", 10001, 178, 181 };
		{ "C", 10001, 236, 323 };
	};
	SiegeofOrgrimmarC = {
		{ 5, 868, 430, 266 }; -- Galakras
		{ 6, 864, 185, 308 }; -- Iron Juggernaut
		{ 7, 856, 169, 158 }; -- Kor'kron Dark Shaman
		{ "D", 10001, 496, 264 };
		{ "E", 10001, 239, 49 };
	};
	SiegeofOrgrimmarD = {
		{ 8, 850, 127, 282 }; -- General Nazgrim
		{ 9, 846, 197, 180 }; -- Malkorok
		{ 10, 870, 266, 252 }; -- Spoils of Pandaria
		{ 11, 851, 286, 380 }; -- Thok the Bloodthirsty
		{ 12, 865, 389, 130 }; -- Siegecrafter Blackfuse
		{ 13, 853, 434, 235 }; -- Paragons of the Klaxxi
		{ 14, 869, 451, 410 }; -- Garrosh Hellscream
		{ "E", 10001, 62, 214 };
	};
	StormstoutBrewery = {
		{ 1, 668, 175, 340 }; -- Ook-Ook
		{ 2, 669, 314, 280 }; -- Hoptallus
		{ 3, 670, 430, 400 }; -- Yan-Zhu the Uncasked
		{ "A", 10001, 374, 72 };
		{ "B", 10002, 96, 75 };
		{ "B", 10002, 13, 341 };
		{ "C", 10002, 250, 447 };
		{ "C", 10002, 283, 405 };
		{ "D", 10002, 323, 232 };
		{ "D", 10002, 421, 85 };
		{ "E", 10002, 499, 226 };
		{ "E", 10002, 494, 334 };
		{ "1'", 10003, 353, 55 };
	};
	TempleOfTheJadeSerpent = {
		{ 1, 672, 218, 68 }; -- Wise Mari
		{ 2, 664, 65, 380 }; -- Lorewalker Stonestep
		{ 3, 658, 213, 252 }; -- Liu Flameheart
		{ 4, 335, 355, 296 }; -- Sha of Doubt
		{ "A", 10001, 81, 211 };
		{ "1'", 10002, 141, 213 };
	};
	TerraceofEndlessSpring = {
		{ 1, 683, 398, 265 }; -- Protectors of the Endless
		{ 2, 742, 360, 265 }; -- Tsulong
		{ 3, 729, 296, 265 }; -- Lei Shi
		{ 4, 709, 204, 265 }; -- Sha of Fear
		{ "A", 10001, 456, 265 };
	};
	ThroneofThunderA = {
		{ 1, 827, 111, 196 }; -- Jin'rokh the Breaker
		{ 2, 819, 266, 335 }; -- Horridon
		{ 3, 816, 372, 149 }; -- Council of Elders
		{ "A", 10001, 6, 196 };
		{ "B", 10002, 496, 149 };
		{ "1", 10003, 115, 337 };
		{ "2", 10004, 270, 152 };
	};
	ThroneofThunderB = {
		{ 4, 825, 88, 359 }; -- Tortos
		{ 5, 821, 296, 185 }; -- Megaera
		{ 6, 828, 406, 308 }; -- Ji-Kun
		{ "B", 10001, 27, 359 };
		{ "C", 10001, 366, 340 };
		{ "3", 10002, 192, 250 };
	};
	ThroneofThunderC = {
		{ 7, 818, 392, 173 }; -- Durumu the Forgotten
		{ 8, 820, 235, 414 }; -- Primordius
		{ 9, 824, 156, 304 }; -- Dark Animus
		{ "C", 10001, 465, 21 };
		{ "D", 10001, 283, 415 };
		{ "E", 10001, 194, 94 };
		{ "4", 10002, 161, 364 };
		{ "5", 10003, 258, 133 };
	};
	ThroneofThunderD = {
		{ 10, 817, 146, 160 }; -- Iron Qon
		{ 11, 829, 405, 79 }; -- Twin Consorts
		{ 12, 832, 118, 339 }; -- Lei Shen
		{ 13, 831, 370, 453 }; -- Ra-den
		{ "D", 10001, 370, 247 };
		{ "E", 10001, 126, 210 };
		{ "F", 10001, 108, 243 };
		{ "F", 10001, 467, 220 };
		{ "6", 10002, 477, 144 };
	};
};

for k, v in pairs(myDB) do
	AtlasMaps_NPC_DB[k] = v;
end

