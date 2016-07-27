-- $Id: Atlas_OutdoorRaids_DB.lua 15 2016-07-25 14:23:32Z arith $
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
	OR_DoomLordKazzak = {
		{ 1, 10001, 296, 206 };
		{ 2, 10002, 139, 334 };
		{ 3, 10003, 234, 369 };
		{ 4, 10004, 326, 357 };
		{ 5, 10005, 158, 430 };
	};
	OR_Doomwalker = {
		{ 1, 10001, 271, 247 };
	};
	OR_BrokenIsles = {
		{  1, 1774, 168, 351 }; --Calamir
		{  2, 1796, 152, 375 }; --Withered J'im
		{  3, 1769, 130, 347 }; --Levantus
		{  4, 1770, 78, 201 }; --Humongris
		{  5, 1763, 149, 159 }; --Shar'thos
		{  6, 1789, 274, 150 }; --Drugon the Frostblood
		{  7, 1795, 249, 22 }; --Flotsam
--		{  8, 1790,  }; --Ana-Mouz
		{  9, 1756, 405, 98 }; --The Soultakers
		{ 10, 1749, 323, 133 }; --Nithogg
		{ 11, 1783, 180, 232 }; --Na'zak the Fiend
	};
	OR_Draenor = {
		{ 1, 1291, 271, 119 }; -- Drov the Ruiner
		{ 2, 1211, 286, 207 }; -- Tarlna the Ageless
		{ 3, 1262, 274, 424 }; -- Rukhmar
		{ 4, 1452, 351, 203 }; -- Supreme Lord Kazzak
	};
	OR_Pandaria = {
		{ 1, 814, 58, 81 }; -- Nalak, The Storm Lord
		{ 2, 826, 219, 70 }; -- Oondasta
		{ 3, 691, 240, 211 }; -- Sha of Anger
		{ 4, 725, 270, 324 }; -- Salyis's Warband
		{ 5, 861, 463, 310 }; -- Ordos, Fire-God of the Yaungol
		{ 6, 857, 450, 321 }; -- Chi-Ji, The Red Crane
		{ 6, 859, 464, 321 }; -- Niuzao, The Black Ox
		{ 6, 860, 450, 337 }; -- Xuen, The White Tiger
		{ 6, 858, 464, 337 }; -- Yu'lon, The Jade Serpent
	};
	OR_Skettis = { 
		{ 1, 10001, 187, 67 };
		{ 2, 10002, 244, 270 };
		{ 3, 10003, 264, 308 };
		{ 4, 10004, 113, 235 };
		{ 4, 10004, 305, 211 };
		{ 4, 10004, 477, 428 };
		{ 5, 10005, 322, 286 };
		{ 6, 10006, 335, 345 };
		{ 7, 10007, 345, 213 };
		{ 8, 10008, 463, 316 };
		{ 9, 10009, 148, 339 };
		{ "1'", 10010, 137, 223 };
		{ "1'", 10010, 119, 284 };
		{ "1'", 10010, 337, 226 };
		{ "1'", 10010, 347, 307 };
		{ "1'", 10010, 349, 375 };
		{ "1'", 10010, 433, 329 };
		{ "1'", 10010, 401, 457 };
		{ "1'", 10010, 479, 337 };
		{ "1'", 10010, 466, 447 };
	};
};

for k, v in pairs(myDB) do
	AtlasMaps_NPC_DB[k] = v;
end

