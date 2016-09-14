-- $Id: Atlas_ScenariosDB.lua 27 2016-08-31 06:44:19Z arith $
--[[

	Atlas, a World of Warcraft instance map browser
	Copyright 2012 ~ 2016 - Arith Hsu, Atlas Team <atlas.addon@gmail.com>

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
	SC_BrokenShore = {
		{ "A", 10001, 257, 457, 413, 573, "Blue" }; -- Alliance Ships
		{ "B", 10002, 304, 436, 474, 544, "Blue" }; -- Horde Ships
		{ "C", 10003, 242, 439, 388, 552, "Blue" }; -- Beach
		{ "C", 10003, 300, 409, 456, 512, "Blue" }; -- Beach
		{ "1", 10004, 129, 254, 247, 305, "Green" }; -- King Varian Wrynn
		{ "2", 10005, 304, 290, 474, 358, "Green" }; -- Sylvanas and Baine
		{ "D", 10006, 136, 223, 254, 260, "Blue" }; -- Portal
		{ "D", 10006, 309, 262, 481, 320, "Blue" }; -- Portal
		{ "E", 10007, 194, 255, 334, 310, "Blue" }; -- The Black City
		{ "E", 10007, 337, 276, 523, 335, "Blue" }; -- The Black City
		{ "F", 10008, 315, 150, 491, 171, "Blue" }; -- Tomb Approach
		{ "F", 10008, 334, 178, 513, 202, "Blue" }; -- Tomb Approach
		{ "3", 10009, 339, 151, 518, 164, "Green" }; -- Highlord Tirion Fordring
		{ "1", 10010, 329, 160, 512, 180, "Red" }; -- Krosus
		{ "G", 10011, 345, 119, 530, 125, "Blue" }; -- Alliance's final stop
		{ "2", 10012, 362, 108, 558, 103, "Red" }; -- Gul'dan
		{ "H", 10013, 390, 135, 596, 149, "Blue" }; -- Horde's final stop
		{ "H", 10013, 427, 137, 632, 158, "Blue" }; -- Horde's final stop
	};
};

for k, v in pairs(myDB) do
	AtlasMaps_NPC_DB[k] = v;
end
