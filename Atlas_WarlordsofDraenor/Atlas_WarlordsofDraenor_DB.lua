-- $Id: Atlas_WarlordsofDraenor_DB.lua 29 2016-08-05 16:13:17Z arith $
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
-- Warlords of Draenor Instances
--************************************************
	Auchindoun = {
		{ 1, 1185, 70, 153 }; -- Vigilant Kaathar
		{ 2, 1186, 250, 348 }; -- Soulbinder Nyami
		{ 3, 1216, 428, 152 }; -- Azzakel
		{ 4, 1225, 250, 153 }; -- Teron'gor
		{ "A", 10001, 258, 491};
	};
	BlackrockFoundryA = {
		{ 1, 1161, 349, 158 }; -- Gruul
		{ 2, 1202, 341, 351 }; -- Oregorger
		{ 3, 1122, 241, 269 }; -- Beastlord Darmac
		{ 6, 1147, 153, 128 }; -- Operator Thogar
		{ 7, 1154, 383, 262 }; -- The Blast Furnace
		{ 10, 959, 44, 139 }; -- Blackhand
		{ "A", 10001, 92, 432 };
		{ "B", 10002, 128, 368 };
		{ "B", 10002, 469, 266 };
		{ "C", 10002, 50, 333 };
	};
	BlackrockFoundryB = {
		{ 4, 1123, 32, 370 }; -- Flamebender Ka'graz
		{ 5, 1155, 217, 369 }; -- Hans'gar and Franzok
		{ 8, 1162, 127, 231 }; -- Kromog
		{ 9, 1203, 437, 166 }; -- The Iron Maidens
		{ "C", 10001, 222, 294};
	};
	BloodmaulSlagMines = {
		{ 1, 893, 31, 307 }; -- Magmolatus
		{ 2, 888, 321, 331 }; -- Slave Watcher Crushto
		{ 3, 887, 232, 186 }; -- Roltall
		{ 4, 889, 371, 115 }; -- Gug'rokk
		{ "A", 10001, 269, 488};
	};
	TheEverbloomA = {
		{ 1, 1214, 201, 303 }; -- Witherbark
		{ 2, 1207, 316, 118 }; -- Ancient Protectors
		{ 3, 1208, 232, 187 }; -- Archmage Sol
		{ 4, 1209, 260, 52 }; -- Xeri'tac
		{ "A", 10001, 381, 302};
		{ "B", 10002, 142, 183}; 
	};
	TheEverbloomB = {
		{ 5, 1210, 225, 356 }; -- Yalnu
		{ "B", 10001, 235, 429};
	};
	GrimrailDepot = {
		{ 1, 1138, 413, 207 }; -- Rocketspark and Borka
		{ 2, 1163, 257, 417 }; -- Nitrogg Thundertower
		{ 3, 1133, 159, 417 }; -- Skylord Tovra
		{ "A", 10001, 182, 75};
		{ "B", 10002, 422, 283};
		{ "B", 10002, 463, 419};
	};
	HellfireA = {
		{ 1, 1426, 276, 233}; -- Hellfire Assault
		{ 2, 1425, 150, 249}; -- Iron Reaver
		{ "A", 10001, 369, 227}; 
		{ "B", 10002, 118, 257};
	};
	HellfireB = {
		{ 3, 1372, 142, 184 };	-- Gorefiend
		{ 4, 1396, 239, 334 };	-- Kilrogg Deadeye
		{ 5, 1432, 319, 428 };	-- Hellfire High Council
		{ "B", 10001, 448, 190};
		{ "C", 10001, 325, 7};
	};
	HellfireC = {
		{ 6, 1392, 279, 247 }; -- Kormrok
		{ "C", 10001, 322, 346}; 
	};
	HellfireD = {
		{ 7, 1433, 103, 196 };	-- Shadow-Lord Iskar
		{ 8, 1391, 138, 51 };	-- Fel Lord Zakuun
		{ 9, 1447, 355, 132 };	-- Xhul'horac
		{ 10, 1427, 259, 350 };	-- Socrethar the Eternal
		{ 11, 1394, 124, 345 };	-- Tyrant Velhari
		{ "B", 10001, 184, 156};
		{ "C", 10001, 184, 192};
	};
	HellfireE = {
		{ 12, 1395, 276, 313 };	-- Mannoroth
	};
	HellfireF = { 
		{ 13, 1438, 297, 262 }; -- Archimonde
		{ "D", 10001, 121, 261}; 
	};
	HighmaulA = {
		{ 1, 1128, 347, 430 }; -- Kargath Bladefist
		{ 2, 971, 290, 272 }; -- The Butcher
		{ 3, 1195, 133, 377 }; -- Tectus
		{ 4, 1196, 238, 68 }; -- Brackenspore
		{ "A", 10001, 309, 398};
		{ "B", 10002, 138, 84};
	};
	HighmaulB = {
		{ 5, 1148, 162, 86 }; -- Twin Ogron
		{ 6, 1153, 94, 161 }; -- Ko'ragh
		{ 7, 1197, 390, 375 }; -- Imperator Mar'gok
		{ "B", 10001, 288, 231};
		{ "C", 10001, 60, 126};
		{ "C", 10001, 66, 448};
		{ "D", 10001, 143, 281};
		{ "D", 10001, 410, 179};
	};
	IronDocks = {
		{ 1, 1235, 231, 240 }; -- Fleshrender Nok'gar
		{ 2, 1236, 410, 391 }; -- Grimrail Enforcers
		{ 3, 1237, 410, 182 }; -- Oshir
		{ 4, 1238, 351, 273 }; -- Skulloc
		{ "A", 10001, 148, 275};
	};
	ShadowmoonBurialGrounds = {
		{ 1, 1139, 116, 205 }; -- Sadana Bloodfury
		{ 2, 1168, 187, 246 }; -- Nhallish
		{ 3, 1140, 318, 190 }; -- Bonemaw
		{ 4, 1160, 244, 370 }; -- Ner'zhul
		{ "A", 10001, 12, 240};
		{ "B", 10002, 249, 398};
		{ "B", 10002, 445, 239};
	};
	Skyreach = {
		{ 1, 965, 311, 164 }; -- Ranjit
		{ 2, 966, 233, 276 }; -- Araknath
		{ 3, 967, 177, 358 }; -- Rukhran
		{ 4, 968, 275, 214 }; -- High Sage Viryx
		{ "A", 10001, 303, 107};
	};
	UpperBlackrockSpire = {
		{ 1, 1226, 193, 87 }; -- Orebender Gor'ashan
		{ 2, 1227, 251, 144 }; -- Kyrak
		{ 3, 1228, 361, 233 }; -- Commander Tharbek
		{ 4, 1229, 340, 331 }; -- Ragewing the Untamed
		{ 5, 1234, 110, 342 }; -- Warlord Zaela
		{ "A", 10001, 100, 192};
		{ "B", 10002, 50, 111};
		{ "B", 10002, 200, 37};
		{ "C", 10002, 192, 164};
		{ "C", 10002, 225, 313};
	};
};

for k, v in pairs(myDB) do
	AtlasMaps_NPC_DB[k] = v;
end
