-- $Id: Atlas_ClassicWoW_DB.lua 10 2016-08-05 16:16:09Z arith $
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
local myDB = {
--************************************************
-- Eastern Kingdoms Instances (Classic)
--************************************************
	BlackrockDepths = {
		{ 1, 369, 360, 407 }; -- High Interrogator Gerstahn
		{ 2, 370, 411, 263 }; -- Lord Roccor
		{ 3, 371, 381, 279 }; -- Houndmaster Grebmar
		{ 4, 377, 216, 234 }; -- Bael'Gar
		{ 5, 374, 419, 142 }; -- Lord Incendius
		{ 6, 376, 462, 97 }; -- Fineous Darkvire
		{ 7, 375, 202, 327 }; -- Warder Stilgiss
		{ 8, 373, 152, 464 }; -- Pyromancer Loregrain
		{ 9, 372, 123, 433 }; -- Ring of Law
		{ 10, 378, 20, 399 }; -- General Angerforge
		{ 11, 379, 21, 309 }; -- Golem Lord Argelmach
		{ 12, 380, 105, 283 }; -- Hurley Blackbreath
		{ 13, 382, 111, 301 }; -- Ribbly Screwspigot
		{ 14, 381, 131, 300 }; -- Phalanx
		{ 15, 384, 151, 230 }; -- Ambassador Flamelash
		{ 16, 385, 160, 107 }; -- The Seven
		{ 17, 386, 340, 50 }; -- Magmus
		{ 18, 387, 429, 49 }; -- Emperor Dagran Thaurissan
		{ "A", 10001, 274, 350 };
		{ "B", 10002, 388, 307 };
		{ "B", 10002, 121, 466 };
		{ "C", 10002, 60, 454 };
		{ "C", 10002, 310, 295 };
		{ "D", 10002, 225, 287 };
		{ "D", 10002, 472, 144 };
		{ "E", 10003, 264, 195 };
		{ "1'", 10004, 110, 171 };
		{ "1'", 10005 , 291, 348 };
		{ "2'", 10006 , 340, 354 };
		{ "3'", 10007 , 321, 301 };
		{ "4'", 10008 , 158, 338 };
		{ "5'", 10009 , 63, 429 };
		{ "6'", 10010, 10, 383 };
		{ "7'", 10011, 102, 317 };
		{ "8'", 10012, 126, 283 };
		{ "9'", 10013, 172, 271 };
		{ "10'", 10014, 136, 253 };
		{ "11'", 10015, 194, 95 };
		{ "12'", 10016, 240, 126 };
		{ "13'", 10017, 259, 172 };
		{ "14'", 10018, 284, 31 };
		{ "14'", 10018, 284, 79 };
	};
	BlackwingLair = {
		{ "A", 10001, 333, 360 };
		{ "B", 10002, 338, 319 };
		{ "B", 10002, 201, 480 };
		{ "C", 10002, 246, 245 };
		{ "C", 10002, 90, 267 };
		{ "1", 10003 , 251, 391 };
		{ 2, 1529, 250, 328 };
		{ 3, 1530, 154, 331 };
		{ 4, 1531, 388, 201 };
		{ 5, 1532, 320, 182 };
		{ 6, 1533, 53, 209 };
		{ 7, 1534, 48, 145 };
		{ 8, 1535, 170, 201 };
		{ 9, 1536, 262, 59 };
	};
	GnomereganEnt = {
		{ "A", 10001, 500, 436 }; -- Entrance
		{ "B", 10002, 26, 413 }; -- Gnomeregan, Front
		{ "C", 10003, 129, 21 }; -- Gnomeregan, Back
		{ "1'", 10004, 403, 435 }; -- Elevator
		{ "2'", 10005, 86, 132 }; -- Mail Box
	};
	Gnomeregan = {
		{ 1, 419, 196, 175 }; -- Grubbis
		{ 2, 420, 454, 53 }; -- Viscous Fallout
		{ 3, 421, 260, 109 }; -- Electrocutioner 6000
		{ 4, 418, 110, 483 }; -- Crowd Pummeler 9-60
		{ 5, 422, 291, 229 }; -- Mekgineer Thermaplugg
		{ "A", 10001, 140, 70 };
		{ "B", 10002, 310, 371 };
		{ "C", 10003, 17, 174 };
		{ "C", 10003, 404, 95 };
		{ "D", 10003, 74, 228 };
		{ "D", 10003, 450, 148 };
		{ "E", 10003, 333, 156 };
		{ "E", 10003, 127, 351 };
		{ "F", 10003, 36, 353 };
		{ "F", 10003, 375, 286 };
		{ "1'", 10004, 134, 88 };
		{ "2'", 10005, 420, 102 };
		{ "3'", 10006, 421, 55 };
		{ "4'", 10007, 30, 340 };
		{ "5'", 10008, 311, 195 };
	};
	LowerBlackrockSpire = {
		{ 1, 388, 111, 143 }; -- Highlord Omokk
		{ 2, 389, 297, 321 }; -- Shadow Hunter Vosh'gajin
		{ 3, 390, 368, 354 }; -- War Master Voone
		{ 4, 391, 444, 472 }; -- Mother Smolderweb
		{ 5, 392, 251, 366 }; -- Urok Doomhowl
		{ 6, 393, 196, 392 }; -- Quartermaster Zigris
		{ 7, 394, 43, 387 }; -- Halycon
		{ 8, 396, 202, 223 }; -- Overlord Wyrmthalak
		{ "A", 10001, 127, 61 };
		{ "B", 10002, 15, 48 };
		{ "C", 10003, 128, 6 };
		{ "D", 10004, 271, 125 };
		{ "D", 10004, 279, 208 };
		{ "E", 10004, 333, 277 };
		{ "E", 10004, 434, 412 };
		{ "F", 10004, 356, 477 };
		{ "F", 10004, 297, 480 };
		{ "G", 10004, 231, 495 };
		{ "G", 10004, 90, 347 };
		{ "1", 10005, 387, 61 };
		{ "2", 10006, 267, 153 };
		{ "3", 10007, 139, 161 };
		{ "4", 10008, 324, 406 };
		{ "5", 10009, 475, 464 };
		{ "6", 10010, 25, 327 };
		{ "1'", 10011, 135, 106 };
		{ "2'", 10012, 345, 45 };
		{ "3'", 10013, 396, 152 };
	};
	MoltenCore = {
		{ "A", 10001, 14, 91 };
		{ 1, 1519, 320, 178 };
		{ 2, 1520, 356, 88 };
		{ 3, 1521, 67, 231 };
		{ 4, 1522, 40, 357 };
		{ 5, 1523, 237, 420 };
		{ 6, 1524, 218, 386 };
		{ 7, 1526, 347, 292 };
		{ 8, 1525, 456, 412 };
		{ 9, 1527, 462, 314 };
		{ 10, 1528, 239, 268 };
	};
	StratholmeCrusader = {
		{ 1, 450, 387, 151 }; -- The Unforgiven
		{ 2, 445, 180, 173 }; -- Timmy the Cruel
		{ 3, 749, 151, 228 }; -- Commander Malor
		{ 4, 446, 11, 268 }; -- Willey Hopebreaker
		{ 5, 448, 137, 352 }; -- Instructor Galford
		{ 6, 449, 99, 378 }; -- Balnazzar
		{ "A", 10001, 353, 405 };
		{ "1", 10002, 289, 335 };
		{ "2", 10003, 317, 202 };
		{ "2", 10003, 452, 250 };
		{ "3", 10004, 54, 259 };
		{ "1'", 10005, 337, 272 };
		{ "2'", 10006, 425, 193 };
		{ "3'", 10007, 425, 141 };
		{ "4'", 10008, 372, 181 };
	};
	StratholmeGauntlet = {
		{ 1, 451, 400, 248 }; -- Baroness Anastari
		{ 2, 452, 241, 247 }; -- Nerub'enkan
		{ 3, 453, 340, 96 }; -- Maleki the Pallid
		{ 4, 454, 316, 414 }; -- Magistrate Barthilas
		{ 5, 455, 144, 96 }; -- Ramstein the Gorger
		{ 6, 456, 91, 96 }; -- Lord Aurius Rivendare
		{ "A", 10001, 321, 485 };
		{ "1'", 10002, 339, 398 };
		{ "1", 10003, 378, 274 };
	};
	TheStockade = {
		{ 1, 466, 257, 182 }; -- Randolph Moloch
		{ 2, 464, 58, 198 }; -- Hogger
		{ 3, 465, 443, 298 }; -- Lord Overheat
		{ "A", 10001, 252, 366 };
		{ "1'", 10002, 250, 350 };
		{ "2'", 10003, 211, 323 };
		{ "3'", 10004, 294, 323 };
	};
	TheSunkenTemple = {
		{ 1, 457, 52, 220 }; -- Avatar of Hakkar
		{ 2, 458, 448, 176 }; -- Jammal'an the Prophet
		{ 3, 459, 252, 221 }; -- Dreamscythe
		{ 4, 459, 254, 430 }; -- Hazzas
		{ 5, 463, 408, 429 }; -- Shade of Eranikus
		{ "A", 10001, 252, 50 };
		{ "1'", 10002, 251, 78 };
		{ "2'", 10003, 356, 162 };
	};
	TheSunkenTempleEnt = {
		{ "A", 10001, 87, 447 }; -- Entrance
		{ "B", 10002, 304, 166 }; -- Sunken Temple
		{ "1", 10003, 253, 282 }; -- Priestess Udum'bra
		{ "2", 10004, 354, 176 }; -- Gomora the Bloodletter
		{ 3, 458, 304, 62 }; -- Jammal'an the Prophet
		{ "1", 10006, 248, 179 }; -- Captain Wyrmak
	};
	Uldaman = {
		{ 1, 468, 370, 485 }; -- The Lost Dwarves
		{ 2, 467, 323, 368 }; -- Revelosh
		{ 3, 469, 193, 376 }; -- Ironaya
		{ 4, 748, 126, 309 }; -- Obsidian Sentinel
		{ 5, 470, 277, 208 }; -- Ancient Stone Keeper
		{ 6, 471, 104, 169 }; -- Galgann Firehammer
		{ 7, 472, 68, 112 }; -- Grimlok
		{ 8, 473, 343, 65 }; -- Archaedas
		{ "A", 10001, 442, 370 };
		{ "B", 10002, 146, 357 };
		{ "C", 10003, 395, 59 };
		{ "C", 10003, 280, 64 };
		{ "1'", 10004, 410, 369 };
		{ "2'", 10005, 324, 21 };
	};
	UldamanEnt = {
		{ "A", 10001, 494, 167 }; -- Entrance
		{ "B", 10002, 163, 117 }; -- Uldaman
	};
--************************************************
-- Kalimdor Instances (Classic)
--************************************************

	BlackfathomDeeps = {
		{ 1, 368, 190, 183 }; -- Ghamoo-ra
		{ 2, 436, 76, 111 }; -- Domina
		{ 3, 426, 305, 171 }; -- Subjugator Kor'ul
		{ 4, 1145, 311, 366 }; -- Thruk
		{ 5, 447, 417, 360 }; -- Guardian of the Deep
		{ 6, 1144, 355, 375 }; -- Executioner Gore
		{ 7, 437, 245, 449 }; -- Twilight Lord Bathiel
		{ 8, 444, 458, 465 }; -- Aku'mai
		{ "A", 10001, 256, 12};
		{ "B", 10002, 377, 413 };
		{ "B", 10002, 211, 454 };
	};
	BlackfathomDeepsEnt = {
		{ "A", 10001, 176, 395 }; -- Entrance
		{ "B", 10002, 358, 227 }; -- Blackfathom Deeps
	};
	DireMaulEnt = {
		{ "A", 10001, 131, 495 }; -- Entrance
		{ "B", 10002, 348, 360 }; -- Dire Maul, East
		{ "B", 10002, 324, 228}; -- Dire Maul, East
		{ "C", 10003, 255, 124 }; -- Dire Maul, North
		{ "D", 10004, 169, 244 }; -- Dire Maul, West
		{ "D", 10004, 169, 278 }; -- Dire Maul, West
		{ "1'", 10005, 131, 377 }; -- Dire Pool
		{ "2'", 10006, 246, 238 }; -- Dire Maul Arena
	};
	DireMaulEast = {
		{ 1, 404, 212, 109 }; -- Lethtendris
		{ 2, 403, 352, 401 }; -- Hydrospawn
		{ 3, 402, 384, 415 }; -- Zevrim Thornhoof
		{ 4, 405, 376, 213 }; -- Alzzin the Wildshaper
		{ "A", 10001, 12, 86 };
		{ "B", 10002, 43, 260 };
		{ "C", 10003, 495, 119 };
		{ "D", 10004, 234, 165 };
		{ "D", 10004, 402, 452 };
		{ "E", 10005, 190, 330 };
		{ "1'", 10006, 45, 60 };
		{ "2'", 10007, 387, 101 };
		{ "3'", 10008, 265, 427 };
	};
	DireMaulNorth = {
		{ 1, 411, 406, 365 }; -- Guard Mol'dar
		{ 2, 412, 348, 318 }; -- Stomper Kreeg
		{ 3, 413, 240, 383 }; -- Guard Fengus
		{ 4, 414, 50, 253 }; -- Guard Slip'kik
		{ 5, 415, 88, 225 }; -- Captain Kromcrush
		{ 6, 417, 88, 91 }; -- King Gordok
		{ "A", 10001, 418, 471 };
	};
	DireMaulWest = {
		{ 1, 406, 287, 347 }; -- Tendris Warpwood
		{ 2, 408, 386, 127 }; -- Magister Kalendris
		{ 3, 407, 245, 410 }; -- Illyanna Ravenoak
		{ 4, 409, 102, 218 }; -- Immol'thar
		{ 5, 410, 231, 111 }; -- Prince Tortheldrin
		{ "A", 10001, 495, 340 };
		{ "A", 10001, 495, 378 };
		{ "B", 10002, 299, 162 };
		{ "B", 10002, 280, 323 };
		{ "C", 10002, 288, 391 };
		{ "C", 10002, 441, 198 };
		{ "D", 10002, 467, 104 };
		{ "D", 10002, 327, 300 };
		{ "E", 10002, 411, 75 };
		{ "E", 10002, 261, 270 };
		{ "1", 10008, 393, 85 };
		{ "1'", 10003, 475, 337 };
		{ "2'", 10004, 422, 350 };
		{ "2'", 10004, 320, 280 };
		{ "2'", 10004, 320, 413 };
		{ "2'", 10004, 150, 146 };
		{ "2'", 10004, 150, 296 };
		{ "3'", 10005, 408, 364 };
		{ "4'", 10006, 346, 345 };
		{ "5'", 10007, 327, 115 };
	};
	Maraudon = {
		{ 1, 423, 264, 13 }; -- Noxxion
		{ 2, 424, 193, 73 }; -- Razorlash
		{ 3, 427, 271, 159 }; -- Lord Vyletongue
		{ 4, 425, 316, 124 }; -- Tinkerer Gizlock
		{ 5, 428, 160, 164 }; -- Celebras the Cursed
		{ 6, 429, 262, 306 }; -- Landslide
		{ 7, 430, 266, 440 }; -- Rotgrip
		{ 8, 431, 169, 430 }; -- Princess Theradras
		{ "A", 10001, 362, 65 };
		{ "B", 10002, 425, 157 };
		{ "C", 10003, 182, 285 };
		{ "1", 10004, 223, 183 };
		{ "1'", 10005, 327, 487 };
	};
	MaraudonEnt = {
		{ "A", 10001, 126, 291 }; -- Entrance
		{ "B", 10002, 223, 63 }; -- Maraudon, Purple
		{ "C", 10003, 429, 387 }; -- Maraudon, Orange
		{ "D", 10004, 135, 238 }; -- Maraudon, Portal, Lower
		{ "1'", 10005, 57, 298 }; -- Kherrah, Lower
	};
	RagefireChasm = {
		{ 1, 694, 429, 342 }; -- Adarogg
		{ 2, 695, 277, 151 }; -- Dark Shaman Koranthal
		{ 3, 696, 182, 299 }; -- Slagmaw
		{ 4, 697, 153, 444 }; -- Lava Guard Gordoth
		{ "A", 10001, 352, 10 };
		{ "1'", 10002, 436, 39 };
		{ "2'", 10003, 132, 425 };
	};
	RazorfenDowns = {
		{ 1, 1142, 260, 184 }; -- Aarux
		{ 2, 433, 430, 241 }; -- Mordresh Fire Eye
		{ 3, 1143, 93, 328 }; -- Mushlump
		{ 4, 1146, 165, 290 }; -- Death Speaker Blackthorn
		{ 5, 1141, 165, 306 }; -- Amnennar the Coldbringer
		{ "A", 10001, 30, 120 };
	};
	RazorfenKraul = {
		{ 1, 896, 432, 260 }; -- Hunter Bonetusk
		{ 2, 895, 471, 213 }; -- Roogug
		{ 3, 899, 301, 165 }; -- Warlord Ramtusk
		{ 4, 900, 28, 249 }; -- Groyat, the Blind Hunter
		{ 5, 901, 109, 165 }; -- Charlga Razorflank
		{ "A", 10001, 377, 366 };
		{ "1", 10002, 350, 213 };
		{ "1'", 10003, 76, 183 };
	};
	TheRuinsofAhnQiraj = {
		{ "A", 10001, 318, 18 };
		{ 1, 1537, 282, 151 };
		{ 2, 1538, 306, 222 };
		{ 3, 1539, 90, 144 };
		{ 4, 1540, 397, 294 };
		{ 5, 1541, 327, 448 };
		{ 6, 1542, 168, 345 };
		{ "1'", 10008, 329, 361 };
	};
	TheTempleofAhnQiraj = {
		{ "A", 10001, 95, 67 };
		{ "B", 10002, 73, 160 };
		{ "B", 10002, 149, 41 };
		{ "C", 10002, 152, 137 };
		{ "C", 10002, 112, 261 };
		{ "D", 10002, 135, 218 };
		{ "D", 10002, 460, 193 };
		{ 1, 1543, 51, 101 }; -- The Prophet Skeram
		{ "2", 10004, 78, 247 }; -- The Bug Family
		{ 3, 1544, 225, 157 }; -- Battleguard Sartura
		{ 4, 1545, 380, 91 }; -- Fankriss the Unyielding
		{ 5, 1548, 466, 66 }; -- Viscidus
		{ 6, 1546, 212, 249 }; -- Princess Huhuran
		{ 7, 1549, 358, 373 }; -- The Twin Emperors
		{ 8, 1550, 84, 433 }; -- Ouro
		{ 9, 1551, 430, 225 }; -- C'Thun
		{ "1'", 10012, 100, 158 };
		{ "2'", 10013, 412, 269 };
	};
	WailingCaverns = {
		{ 1, 474, 196, 229 }; -- Lady Anacondra
		{ 2, 476, 121, 225 }; -- Lord Pythas
		{ 3, 475, 99, 306 }; -- Lord Cobrahn
		{ 4, 478, 395, 335 }; -- Skum
		{ 5, 479, 424, 255 }; -- Lord Serpentis
		{ 6, 480, 370, 231 }; -- Verdan the Everliving
		{ 7, 481, 212, 116 }; -- Mutanus the Devourer
		{ "1", 477, 234, 194 };
		{ "A", 10001, 297, 301 };
		{ "2", 10002, 359, 316 };
		{ "1'", 10003, 306, 281 };
		
	};
	WailingCavernsEnt = {
		{ "A", 10001, 52, 394 }; -- Entrance
		{ "B", 10002, 263, 325 }; -- Wailing Caverns
		{ "1", 10003, 332, 190 }; -- Trigore the Lasher
	};
	ZulFarrak = {
		{ 1, 483, 178, 218 }; -- Gahz'rilla
		{ 3, 487, 166, 112 }; -- Nekrum Gutchewer and Shadow Priest Sezz'ziz
		{ 4, 489, 260, 190 }; -- Chief Ukorz Sandscalp
		{ 5, 486, 259, 101 }; -- Witch Doctor Zum'rah
		{ 6, 484, 399, 147 }; -- Antu'sul
		{ 2, 482, 160, 197 }; -- Hydromancer Velratha
		{ 3, 485, 324, 150 }; -- Theka the Martyr
		{ "A", 10001, 338, 424 };
		{ "1", 10002, 264, 261 };
		{ "4", 10003, 183, 114 };
		{ "5", 10004, 296, 219 };
		{ "1'", 10005, 197, 206 };
	};
};

for k, v in pairs(myDB) do
	AtlasMaps_NPC_DB[k] = v;
end
