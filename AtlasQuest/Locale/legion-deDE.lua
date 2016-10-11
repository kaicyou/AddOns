--[[

	AtlasQuest, a World of Warcraft addon.
	Email me at mystery8@gmail.com

	This file is part of AtlasQuest.

	AtlasQuest is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	AtlasQuest is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with AtlasQuest; if not, write to the Free Software
	Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

--]]


------------  LEGION  ------------

-- 157 = DUNGEON: Assault on Violet Hold
-- 158 = DUNGEON: Black Rook Hold
-- 159 = DUNGEON: Court of Stars
-- 160 = DUNGEON: Darkheart Thicket
-- 161 = DUNGEON: Eye of Azshara
-- 162 = DUNGEON: Halls of Valor
-- 163 = DUNGEON: Maw of Souls
-- 164 = DUNGEON: Neltharion's Lair
-- 165 = DUNGEON: The Arcway
-- 166 = DUNGEON: Vault of the Wardens
-- 167 = RAID: Broken Isles
-- 168 = RAID: The Emerald Nightmare
-- 169 = RAID: The Nighthold


-- German localisation by Asurn
-- updated by Guldukat Realm [EU] Antonidas


if ( GetLocale() == "deDE" ) then

---------------
--- COLOURS ---
---------------

local GREY = "|cff999999";
local RED = "|cffff0000";
local ATLAS_RED = "|cffcc3333";
local WHITE = "|cffFFFFFF";
local GREEN = "|cff66cc33";
local PURPLE = "|cff9F3FFF";
local BLUE = "|cff0070dd";
local ORANGE = "|cffFF8400";
local DARKYELLOW = "|cffcc9933";  -- Atlas uses this color for some things.
local YELLOW = "|cffFFd200";   -- Ingame Yellow




--------------- INST157 - Assault on Violet Hold ---------------

Inst157Caption = "Assault on Violet Hold"
Inst157QAA = "3 Quests"
Inst157QAH = "3 Quests"

--Quest 1 Alliance
Inst157Quest1 = "1. Violette Festung"
Inst157Quest1_Aim = "Defeat the leader of the Assault on Violet Hold."
Inst157Quest1_Location = "Violet Hold (Automatische Annahme)"
Inst157Quest1_Note = ""
Inst157Quest1_Prequest = "Nein"
Inst157Quest1_Folgequest = "Nein"
--
Inst157Quest1name1 = "Schmuggelwarenspind der Violetten Festung"

--Quest 2 Alliance
Inst157Quest2 = "2. Violette Festung (Heroisch)"
Inst157Quest2_Aim = "Defeat the leader of the Assault on Violet Hold auf dem Schwierigkeitsgrad 'Heroisch' oder h�her."
Inst157Quest2_Location = Inst157Quest1_Location
Inst157Quest2_Note = ""
Inst157Quest2_Prequest = "Nein"
Inst157Quest2_Folgequest = "Nein"
--
Inst157Quest2name1 = Inst157Quest1name1

--Quest 3 Alliance
Inst157Quest3 = "3. Violette Festung (Mythisch)"
Inst157Quest3_Aim = "Defeat the leader of the Assault on Violet Hold auf dem Schwierigkeitsgrad 'Mythisch'."
Inst157Quest3_Location = Inst157Quest1_Location
Inst157Quest3_Note = ""
Inst157Quest3_Prequest = "Nein"
Inst157Quest3_Folgequest = "Nein"
--
Inst157Quest3name1 = Inst157Quest1name1


--Quest 1 Horde
Inst157Quest1_HORDE = Inst157Quest1
Inst157Quest1_HORDE_Aim = Inst157Quest1_Aim
Inst157Quest1_HORDE_Location = Inst157Quest1_Location
Inst157Quest1_HORDE_Note = Inst157Quest1_Note
Inst157Quest1_HORDE_Prequest = "Nein"
Inst157Quest1_HORDE_Folgequest = "Nein"
--
Inst157Quest1name1_HORDE = Inst157Quest1name1

--Quest 2 Horde
Inst157Quest2_HORDE = Inst157Quest2
Inst157Quest2_HORDE_Aim = Inst157Quest2_Aim
Inst157Quest2_HORDE_Location = Inst157Quest2_Location
Inst157Quest2_HORDE_Note = Inst157Quest2_Note
Inst157Quest2_HORDE_Prequest = "Nein"
Inst157Quest2_HORDE_Folgequest = "Nein"
--
Inst157Quest2name1_HORDE = Inst157Quest1name1

--Quest 3 Horde
Inst157Quest3_HORDE = Inst157Quest3
Inst157Quest3_HORDE_Aim = Inst157Quest3_Aim
Inst157Quest3_HORDE_Location = Inst157Quest3_Location
Inst157Quest3_HORDE_Note = Inst157Quest3_Note
Inst157Quest3_HORDE_Prequest = "Nein"
Inst157Quest3_HORDE_Folgequest = "Nein"
--
Inst157Quest3name1_HORDE = Inst157Quest1name1



--------------- INST158 - Black Rook Hold ---------------

Inst158Caption = "Die Rabenwehr"
Inst158QAA = "3 Quests"
Inst158QAH = "3 Quests"

--Quest 1 Alliance
Inst158Quest1 = "1. The Lord of Black Rook Hold"
Inst158Quest1_Aim = "Defeat Lord Kur'talos Ravencrest in Black Rook Hold."
Inst158Quest1_Location = "Black Rook Hold (Automatische Annahme)"
Inst158Quest1_Note = ""
Inst158Quest1_Prequest = "Nein"
Inst158Quest1_Folgequest = "Nein"
--
Inst158Quest1name1 = "Haunted Ravencrest Keepsake"

--Quest 2 Alliance
Inst158Quest2 = "2. The Lord of Black Rook Hold (Heroic)"
Inst158Quest2_Aim = "Defeat Kur'talos Ravencrest in the Black Rook Hold auf dem Schwierigkeitsgrad 'Heroisch' oder h�her."
Inst158Quest2_Location = Inst158Quest1_Location
Inst158Quest2_Note = ""
Inst158Quest2_Prequest = "Nein"
Inst158Quest2_Folgequest = "Nein"
--
Inst158Quest2name1 = "Haunted Ravencrest Keepsake"

--Quest 3 Alliance
Inst158Quest3 = "3. The Lord of Black Rook Hold (Mythic)"
Inst158Quest3_Aim = "Defeat Kur'talos Ravencrest in the Black Rook Hold auf dem Schwierigkeitsgrad 'Mythisch'."
Inst158Quest3_Location = Inst158Quest1_Location
Inst158Quest3_Note = ""
Inst158Quest3_Prequest = "Nein"
Inst158Quest3_Folgequest = "Nein"
--
Inst158Quest3name1 = "Haunted Ravencrest Keepsake"


--Quest 1 Horde
Inst158Quest1_HORDE = Inst158Quest1
Inst158Quest1_HORDE_Aim = Inst158Quest1_Aim
Inst158Quest1_HORDE_Location = Inst158Quest1_Location
Inst158Quest1_HORDE_Note = Inst158Quest1_Note
Inst158Quest1_HORDE_Prequest = "Nein"
Inst158Quest1_HORDE_Folgequest = "Nein"
--
Inst158Quest1name1_HORDE = Inst158Quest1name1

--Quest 2 Horde
Inst158Quest2_HORDE = Inst158Quest2
Inst158Quest2_HORDE_Aim = Inst158Quest2_Aim
Inst158Quest2_HORDE_Location = Inst158Quest2_Location
Inst158Quest2_HORDE_Note = Inst158Quest2_Note
Inst158Quest2_HORDE_Prequest = "Nein"
Inst158Quest2_HORDE_Folgequest = "Nein"
--
Inst158Quest2name1_HORDE = Inst158Quest2name1

--Quest 3 Horde
Inst158Quest3_HORDE = Inst158Quest3
Inst158Quest3_HORDE_Aim = Inst158Quest3_Aim
Inst158Quest3_HORDE_Location = Inst158Quest3_Location
Inst158Quest3_HORDE_Note = Inst158Quest3_Note
Inst158Quest3_HORDE_Prequest = "Nein"
Inst158Quest3_HORDE_Folgequest = "Nein"
--
Inst158Quest3name1_HORDE = Inst158Quest3name1



--------------- INST159 - Court of Stars ---------------

Inst159Caption = "Der Hof der Sterne"
Inst159QAA = "3 Quests"
Inst159QAH = "3 Quests"

--Quest 1 Alliance
Inst159Quest1 = "1. Der Hof der Sterne"
Inst159Quest1_Aim = "Bezwingt Berater Melandrus im Hof der Sterne."
Inst159Quest1_Location = "Der Hof der Sterne (Automatische Annahme)"
Inst159Quest1_Note = ""
Inst159Quest1_Prequest = "Nein"
Inst159Quest1_Folgequest = "Nein"
--
Inst159Quest1name1 = "Nightborne Rucksack"

--Quest 2 Alliance
Inst159Quest2 = "2. Der Hof der Sterne (Heroisch)"
Inst159Quest2_Aim = "Bezwingt Berater Melandrus im Hof der Sterne auf dem Schwierigkeitsgrad 'Heroisch' oder h�her."
Inst159Quest2_Location = Inst159Quest1_Note
Inst159Quest2_Note = ""
Inst159Quest2_Prequest = "Nein"
Inst159Quest2_Folgequest = "Nein"
--
Inst159Quest2name1 = "Nightborne Rucksack"

--Quest 3 Alliance
Inst159Quest3 = "3. Der Hof der Sterne (Mythisch)"
Inst159Quest3_Aim = "Bezwingt Berater Melandrus im Hof der Sterne auf dem Schwierigkeitsgrad 'Mythisch'."
Inst159Quest3_Location = Inst159Quest1_Note
Inst159Quest3_Note = ""
Inst159Quest3_Prequest = "Nein"
Inst159Quest3_Folgequest = "Nein"
--
Inst159Quest3name1 = "Nightborne Rucksack"


--Quest 1 Horde
Inst159Quest1_HORDE = Inst159Quest1
Inst159Quest1_HORDE_Aim = Inst159Quest1_Aim
Inst159Quest1_HORDE_Location = Inst159Quest1_Location
Inst159Quest1_HORDE_Note = Inst159Quest1_Note
Inst159Quest1_HORDE_Prequest = "Nein"
Inst159Quest1_HORDE_Folgequest = "Nein"
--
Inst159Quest1name1_HORDE = Inst159Quest1name1

--Quest 2 Horde
Inst159Quest2_HORDE = Inst159Quest2
Inst159Quest2_HORDE_Aim = Inst159Quest2_Aim
Inst159Quest2_HORDE_Location = Inst159Quest2_Location
Inst159Quest2_HORDE_Note = Inst159Quest2_Note
Inst159Quest2_HORDE_Prequest = "Nein"
Inst159Quest2_HORDE_Folgequest = "Nein"
--
Inst159Quest2name1_HORDE = Inst159Quest2name1

--Quest 3 Horde
Inst159Quest3_HORDE = Inst159Quest3
Inst159Quest3_HORDE_Aim = Inst159Quest3_Aim
Inst159Quest3_HORDE_Location = Inst159Quest3_Location
Inst159Quest3_HORDE_Note = Inst159Quest3_Note
Inst159Quest3_HORDE_Prequest = "Nein"
Inst159Quest3_HORDE_Folgequest = "Nein"
--
Inst159Quest3name1_HORDE = Inst159Quest3name1



--------------- INST160 - Darkheart Thicket ---------------

Inst160Caption = "Das Finsterherzdickicht"
Inst160QAA = "3 Quests"
Inst160QAH = "3 Quests"

--Quest 1 Alliance
Inst160Quest1 = "1. Finsterherzdickicht"
Inst160Quest1_Aim = "Bezwingt den Schemen von Xavius im Finsterherzdickicht."
Inst160Quest1_Location = "Darkheart Thicket (Automatische Annahme)"
Inst160Quest1_Note = ""
Inst160Quest1_Prequest = "Nein"
Inst160Quest1_Folgequest = "Nein"
--
Inst160Quest1name1 = "Despoiled Keeper's Cache"

--Quest 2 Alliance
Inst160Quest2 = "2. Finsterherzdickicht (Heroisch)"
Inst160Quest2_Aim = "Bezwingt den Schemen von Xavius im Finsterherzdickicht auf dem Schwierigkeitsgrad 'Heroisch' oder h�her."
Inst160Quest2_Location = Inst160Quest1_Location
Inst160Quest2_Note = ""
Inst160Quest2_Prequest = "Nein"
Inst160Quest2_Folgequest = "Nein"
--
Inst160Quest2name1 = "Despoiled Keeper's Cache"

--Quest 3 Alliance
Inst160Quest3 = "3. Finsterherzdickicht (Mythisch)"
Inst160Quest3_Aim = "Bezwingt den Schemen von Xavius im Finsterherzdickicht auf dem Schwierigkeitsgrad 'Mythisch'."
Inst160Quest3_Location = Inst160Quest1_Location
Inst160Quest3_Note = ""
Inst160Quest3_Prequest = "Nein"
Inst160Quest3_Folgequest = "Nein"
--
Inst160Quest3name1 = "Despoiled Keeper's Cache"


--Quest 1 Horde
Inst160Quest1_HORDE = Inst160Quest1
Inst160Quest1_HORDE_Aim = Inst160Quest1_Aim
Inst160Quest1_HORDE_Location = Inst160Quest1_Location
Inst160Quest1_HORDE_Note = Inst160Quest1_Note
Inst160Quest1_HORDE_Prequest = "Nein"
Inst160Quest1_HORDE_Folgequest = "Nein"
--
Inst160Quest1name1_HORDE = Inst160Quest1name1

--Quest 2 Horde
Inst160Quest2_HORDE = Inst160Quest2
Inst160Quest2_HORDE_Aim = Inst160Quest2_Aim
Inst160Quest2_HORDE_Location = Inst160Quest2_Location
Inst160Quest2_HORDE_Note = Inst160Quest2_Note
Inst160Quest2_HORDE_Prequest = "Nein"
Inst160Quest2_HORDE_Folgequest = "Nein"
--
Inst160Quest2name1_HORDE = Inst160Quest2name1

--Quest 3 Horde
Inst160Quest3_HORDE = Inst160Quest3
Inst160Quest3_HORDE_Aim = Inst160Quest3_Aim
Inst160Quest3_HORDE_Location = Inst160Quest3_Location
Inst160Quest3_HORDE_Note = Inst160Quest3_Note
Inst160Quest3_HORDE_Prequest = "Nein"
Inst160Quest3_HORDE_Folgequest = "Nein"
--
Inst160Quest3name1_HORDE = Inst160Quest3name1



--------------- INST161 - Eye of Azshara ---------------

Inst161Caption = "Eye of Azshara"
Inst161QAA = "6 Quests"
Inst161QAH = "6 Quests"




--------------- INST162 - Halls of Valor ---------------

Inst162Caption = "Die Hallen der Tapferkeit"
Inst162QAA = "3 Quests"
Inst162QAH = "3 Quests"

--Quest 1 Alliance
Inst162Quest1 = "1. Odyn's Challenge"
Inst162Quest1_Aim = "Bezwingt Odyn in den Hallen der Tapferkeit."
Inst162Quest1_Location = "Halls of Valor (Automatische Annahme)"
Inst162Quest1_Note = ""
Inst162Quest1_Prequest = "Nein"
Inst162Quest1_Folgequest = "Nein"
--
Inst162Quest1name1 = "Challenger's Spoils"

--Quest 2 Alliance
Inst162Quest2 = "2. Odyn's Challenge (Heroic)"
Inst162Quest2_Aim = "Bezwingt Odyn in den Hallen der Tapferkeit auf dem Schwierigkeitsgrad 'Heroisch' oder h�her."
Inst162Quest2_Location = Inst162Quest1_Location
Inst162Quest2_Note = ""
Inst162Quest2_Prequest = "Nein"
Inst162Quest2_Folgequest = "Nein"
--
Inst162Quest2name1 = "Challenger's Spoils"

--Quest 3 Alliance
Inst162Quest3 = "3. Odyn's Challenge (Mythic)"
Inst162Quest3_Aim = "Bezwingt Odyn in den Hallen der Tapferkeit auf dem Schwierigkeitsgrad 'Mythisch'."
Inst162Quest3_Location = Inst162Quest1_Location
Inst162Quest3_Note = ""
Inst162Quest3_Prequest = "Nein"
Inst162Quest3_Folgequest = "Nein"
--
Inst162Quest3name1 = "Challenger's Spoils"


--Quest 1 Horde
Inst162Quest1_HORDE = Inst162Quest1
Inst162Quest1_HORDE_Aim = Inst162Quest1_Aim
Inst162Quest1_HORDE_Location = Inst162Quest1_Location
Inst162Quest1_HORDE_Note = Inst162Quest1_Note
Inst162Quest1_HORDE_Prequest = "Nein"
Inst162Quest1_HORDE_Folgequest = "Nein"
--
Inst162Quest1name1_HORDE = Inst162Quest1name1

--Quest 2 Horde
Inst162Quest2_HORDE = Inst162Quest2
Inst162Quest2_HORDE_Aim = Inst162Quest2_Aim
Inst162Quest2_HORDE_Location = Inst162Quest2_Location
Inst162Quest2_HORDE_Note = Inst162Quest2_Note
Inst162Quest2_HORDE_Prequest = "Nein"
Inst162Quest2_HORDE_Folgequest = "Nein"
--
Inst162Quest2name1_HORDE = Inst162Quest2name1

--Quest 3 Horde
Inst162Quest3_HORDE = Inst162Quest3
Inst162Quest3_HORDE_Aim = Inst162Quest3_Aim
Inst162Quest3_HORDE_Location = Inst162Quest3_Location
Inst162Quest3_HORDE_Note = Inst162Quest3_Note
Inst162Quest3_HORDE_Prequest = "Nein"
Inst162Quest3_HORDE_Folgequest = "Nein"
--
Inst162Quest3name1_HORDE = Inst162Quest3name1



--------------- INST163 - Maw of Souls ---------------

Inst163Caption = "Der Seelenschlund"
Inst163QAA = "3 Quests"
Inst163QAH = "3 Quests"

--Quest 1 Alliance
Inst163Quest1 = "1. Der Seelenschlund"
Inst163Quest1_Aim = "Bezwingt Helya im Seelenschlund."
Inst163Quest1_Location = "Maw of Souls (Automatische Annahme)"
Inst163Quest1_Note = ""
Inst163Quest1_Prequest = "Nein"
Inst163Quest1_Folgequest = "Nein"
--
Inst163Quest1name1 = "Seaweed-Encrusted Satchel"

--Quest 2 Alliance
Inst163Quest2 = "2. Der Seelenschlund (Heroisch)"
Inst163Quest2_Aim = "Bezwingt Helya im Seelenschlund auf dem Schwierigkeitsgrad 'Heroisch' oder h�her."
Inst163Quest2_Location = Inst163Quest1_Location
Inst163Quest2_Note = ""
Inst163Quest2_Prequest = "Nein"
Inst163Quest2_Folgequest = "Nein"
--
Inst163Quest2name1 = "Seaweed-Encrusted Satchel"

--Quest 3 Alliance
Inst163Quest3 = "3. Der Seelenschlund (Mythisch)"
Inst163Quest3_Aim = "Bezwingt Helya im Seelenschlund auf dem Schwierigkeitsgrad 'Mythisch'."
Inst163Quest3_Location = Inst163Quest1_Location
Inst163Quest3_Note = ""
Inst163Quest3_Prequest = "Nein"
Inst163Quest3_Folgequest = "Nein"
--
Inst163Quest3name1 = "Seaweed-Encrusted Satchel"


--Quest 1 Horde
Inst163Quest1_HORDE = Inst163Quest1
Inst163Quest1_HORDE_Aim = Inst163Quest1_Aim
Inst163Quest1_HORDE_Location = Inst163Quest1_Location
Inst163Quest1_HORDE_Note = Inst163Quest1_Note
Inst163Quest1_HORDE_Prequest = "Nein"
Inst163Quest1_HORDE_Folgequest = "Nein"
--
Inst163Quest1name1_HORDE = Inst163Quest1name1

--Quest 2 Horde
Inst163Quest2_HORDE = Inst163Quest2
Inst163Quest2_HORDE_Aim = Inst163Quest2_Aim
Inst163Quest2_HORDE_Location = Inst163Quest2_Location
Inst163Quest2_HORDE_Note = Inst163Quest2_Note
Inst163Quest2_HORDE_Prequest = "Nein"
Inst163Quest2_HORDE_Folgequest = "Nein"
--
Inst163Quest2name1_HORDE = Inst163Quest2name1

--Quest 3 Horde
Inst163Quest3_HORDE = Inst163Quest3
Inst163Quest3_HORDE_Aim = Inst163Quest3_Aim
Inst163Quest3_HORDE_Location = Inst163Quest3_Location
Inst163Quest3_HORDE_Note = Inst163Quest3_Note
Inst163Quest3_HORDE_Prequest = "Nein"
Inst163Quest3_HORDE_Folgequest = "Nein"
--
Inst163Quest3name1_HORDE = Inst163Quest3name1



--------------- INST164 - Neltharion's Lair ---------------

Inst164Caption = "Neltharion's Lair"
Inst164QAA = "3 Quests"
Inst164QAH = "3 Quests"

--Quest 1 Alliance
Inst164Quest1 = "1. Neltharion's Lair"
Inst164Quest1_Aim = "Defeat Dargrul in Neltharion's Lair."
Inst164Quest1_Location = "Neltharion's Lair (Automatische Annahme)"
Inst164Quest1_Note = ""
Inst164Quest1_Prequest = "Nein"
Inst164Quest1_Folgequest = "Nein"
--
Inst164Quest1name1 = "Truhe des schwarzen Gro�drachen"

--Quest 2 Alliance
Inst164Quest2 = "2. Neltharion's Lair (Heroic)"
Inst164Quest2_Aim = "Defeat Dargrul in Neltharion's Lair auf dem Schwierigkeitsgrad 'Heroisch' oder h�her."
Inst164Quest2_Location = Inst164Quest1_Location
Inst164Quest2_Note = ""
Inst164Quest2_Prequest = "Nein"
Inst164Quest2_Folgequest = "Nein"
--
Inst164Quest2name1 = Inst164Quest1name1

--Quest 3 Alliance
Inst164Quest3 = "3. Neltharion's Lair (Mythic)"
Inst164Quest3_Aim = "Defeat Dargrul in Neltharion's Lair auf dem Schwierigkeitsgrad 'Mythisch'."
Inst164Quest3_Location = Inst164Quest1_Location
Inst164Quest3_Note = ""
Inst164Quest3_Prequest = "Nein"
Inst164Quest3_Folgequest = "Nein"
--
Inst164Quest3name1 = Inst164Quest1name1


--Quest 1 Horde
Inst164Quest1_HORDE = Inst164Quest1
Inst164Quest1_HORDE_Aim = Inst164Quest1_Aim
Inst164Quest1_HORDE_Location = Inst164Quest1_Location
Inst164Quest1_HORDE_Note = Inst164Quest1_Note
Inst164Quest1_HORDE_Prequest = "Nein"
Inst164Quest1_HORDE_Folgequest = "Nein"
--
Inst164Quest1name1_HORDE = Inst164Quest1name1

--Quest 2 Horde
Inst164Quest2_HORDE = Inst164Quest2
Inst164Quest2_HORDE_Aim = Inst164Quest2_Aim
Inst164Quest2_HORDE_Location = Inst164Quest2_Location
Inst164Quest2_HORDE_Note = Inst164Quest2_Note
Inst164Quest2_HORDE_Prequest = "Nein"
Inst164Quest2_HORDE_Folgequest = "Nein"
--
Inst164Quest2name1_HORDE = Inst164Quest1name1

--Quest 3 Horde
Inst164Quest3_HORDE = Inst164Quest3
Inst164Quest3_HORDE_Aim = Inst164Quest3_Aim
Inst164Quest3_HORDE_Location = Inst164Quest3_Location
Inst164Quest3_HORDE_Note = Inst164Quest3_Note
Inst164Quest3_HORDE_Prequest = "Nein"
Inst164Quest3_HORDE_Folgequest = "Nein"
--
Inst164Quest3name1_HORDE = Inst164Quest1name1



--------------- INST165 - The Arcway ---------------

Inst165Caption = "Der Arkus"
Inst165QAA = "3 Quests"
Inst165QAH = "3 Quests"

--Quest 1 Alliance
Inst165Quest1 = "1. Der Arkus"
Inst165Quest1_Aim = "Bezwingt Berater Vandros im Arkus."
Inst165Quest1_Location = "The Arcway (Automatische Annahme)"
Inst165Quest1_Note = ""
Inst165Quest1_Prequest = "Nein"
Inst165Quest1_Folgequest = "Nein"
--
Inst165Quest1name1 = "Unmarked Suramar Vault Crate"

--Quest 2 Alliance
Inst165Quest2 = "2. Der Arkus (Heroisch)"
Inst165Quest2_Aim = "Bezwingt Berater Vandros im Arkus auf dem Schwierigkeitsgrad 'Heroisch' oder h�her."
Inst165Quest2_Location = Inst165Quest1_Location
Inst165Quest2_Note = ""
Inst165Quest2_Prequest = "Nein"
Inst165Quest2_Folgequest = "Neine"
--
Inst165Quest2name1 = "Unmarked Suramar Vault Crate"

--Quest 3 Alliance
Inst165Quest3 = "3. Der Arkus (Mythisch)"
Inst165Quest3_Aim = "Bezwingt Berater Vandros im Arkus auf dem Schwierigkeitsgrad 'Mythisch'."
Inst165Quest3_Location = Inst165Quest1_Location
Inst165Quest3_Note = ""
Inst165Quest3_Prequest = "Nein"
Inst165Quest3_Folgequest = "Nein"
--
Inst165Quest3name1 = "Unmarked Suramar Vault Crate"


--Quest 1 Horde
Inst165Quest1_HORDE = Inst165Quest1
Inst165Quest1_HORDE_Aim = Inst165Quest1_Aim
Inst165Quest1_HORDE_Location = Inst165Quest1_Location
Inst165Quest1_HORDE_Note = Inst165Quest1_Note
Inst165Quest1_HORDE_Prequest = "Nein"
Inst165Quest1_HORDE_Folgequest = "Nein"
--
Inst165Quest1name1_HORDE = Inst165Quest1name1

--Quest 2 Horde
Inst165Quest2_HORDE = Inst165Quest2
Inst165Quest2_HORDE_Aim = Inst165Quest2_Aim
Inst165Quest2_HORDE_Location = Inst165Quest2_Location
Inst165Quest2_HORDE_Note = Inst165Quest2_Note
Inst165Quest2_HORDE_Prequest = "Nein"
Inst165Quest2_HORDE_Folgequest = "Nein"
--
Inst165Quest2name1_HORDE = Inst165Quest2name1

--Quest 3 Horde
Inst165Quest3_HORDE = Inst165Quest3
Inst165Quest3_HORDE_Aim = Inst165Quest3_Aim
Inst165Quest3_HORDE_Location = Inst165Quest3_Location
Inst165Quest3_HORDE_Note = Inst165Quest3_Note
Inst165Quest3_HORDE_Prequest = "Nein"
Inst165Quest3_HORDE_Folgequest = "Nein"
--
Inst165Quest3name1_HORDE = Inst165Quest3name1



--------------- INST166 - Vault of the Wardens ---------------

Inst166Caption = "Das Verlies der W�chterinnen"
Inst166QAA = "3 Quests"
Inst166QAH = "3 Quests"

--Quest 1 Alliance
Inst166Quest1 = "1. Das Verlies der W�chterinnen"
Inst166Quest1_Aim = "Bezwingt Cordana Teufelsang im Verlies der W�chterinnen."
Inst166Quest1_Location = "Das Verlies der W�chterinnen (Automatische Annahme)"
Inst166Quest1_Note = ""
Inst166Quest1_Prequest = "Nein"
Inst166Quest1_Folgequest = "Nein"
--
Inst166Quest1name1 = "Bag of Confiscated Materials"

--Quest 2 Alliance
Inst166Quest2 = "2. Das Verlies der W�chterinnen (Heroisch)"
Inst166Quest2_Aim = "Bezwingt Cordana Teufelsang im Verlies der W�chterinnen auf dem Schwierigkeitsgrad 'Heroisch' oder h�her."
Inst166Quest2_Location = Inst166Quest1_Location
Inst166Quest2_Note = ""
Inst166Quest2_Prequest = "Nein"
Inst166Quest2_Folgequest = "Nein"
--
Inst166Quest2name1 = "Bag of Confiscated Materials"

--Quest 3 Alliance
Inst166Quest3 = "3. Das Verlies der W�chterinnen (Mythisch)"
Inst166Quest3_Aim = "Bezwingt Cordana Teufelsang im Verlies der W�chterinnen auf dem Schwierigkeitsgrad 'Mythisch'."
Inst166Quest3_Location = Inst166Quest1_Location
Inst166Quest3_Note = ""
Inst166Quest3_Prequest = "Nein"
Inst166Quest3_Folgequest = "Nein"
--
Inst166Quest3name1 = "Bag of Confiscated Materials"


--Quest 1 Horde
Inst166Quest1_HORDE = Inst166Quest1
Inst166Quest1_HORDE_Aim = Inst166Quest1_Aim
Inst166Quest1_HORDE_Location = Inst166Quest1_Location
Inst166Quest1_HORDE_Note = Inst166Quest1_Note
Inst166Quest1_HORDE_Prequest = "Nein"
Inst166Quest1_HORDE_Folgequest = "Nein"
--
Inst166Quest1name1_HORDE = Inst166Quest1name1

--Quest 2 Horde
Inst166Quest2_HORDE = Inst166Quest2
Inst166Quest2_HORDE_Aim = Inst166Quest2_Aim
Inst166Quest2_HORDE_Location = Inst166Quest2_Location
Inst166Quest2_HORDE_Note = Inst166Quest2_Note
Inst166Quest2_HORDE_Prequest = "Nein"
Inst166Quest2_HORDE_Folgequest = "Nein"
--
Inst166Quest2name1_HORDE = Inst166Quest2name1

--Quest 3 Horde
Inst166Quest3_HORDE = Inst166Quest3
Inst166Quest3_HORDE_Aim = Inst166Quest3_Aim
Inst166Quest3_HORDE_Location = Inst166Quest3_Location
Inst166Quest3_HORDE_Note = Inst166Quest3_Note
Inst166Quest3_HORDE_Prequest = "Nein"
Inst166Quest3_HORDE_Folgequest = "Nein"
--
Inst166Quest3name1_HORDE = Inst166Quest3name1



--------------- INST167 - Broken Isles ---------------

Inst167Caption = "Broken Isles"
Inst167QAA = "6 Quests"
Inst167QAH = "6 Quests"




--------------- INST168 - The Emerald Nightmare ---------------

Inst168Caption = "The Emerald Nightmare"
Inst168QAA = "6 Quests"
Inst168QAH = "6 Quests"




--------------- INST169 - The Nighthold ---------------

Inst169Caption = "The Nighthold"
Inst169QAA = "6 Quests"
Inst169QAH = "6 Quests"











end
-- End of File