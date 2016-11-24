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
-- 167 = RAID: The Emerald Nightmare
-- 168 = RAID: The Nighthold
-- 169 = DUNGEON: Karazhan (Legion)
-- 170 = RAID: Trial of Valor
-- 171 = RAID: Tomb of Sargeras


--
-- Using this since it'll be the same text for each Dungeon World Quest.  
-- I might move this to globals-enUS.lua eventually, but since World Quests only exist in Legion, I'll keep it with the Legion stuff for now.
-- 
AQ_WORLDDUNGEONQUEST = "This is a Dungeon World Quest.  When the quest is active (you can check your ingame map to see if it is available), enter the Dungeon to obtain it.  When you complete the dungeon it will be automatically turned in.  The quest will reward reputation and sometimes an item."


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
Inst157QAA = "6 Quests"
Inst157QAH = "6 Quests"

--Quest 1 Alliance
Inst157Quest1 = "1. Violet Hold"
Inst157Quest1_Aim = "Defeat the leader of the Assault on Violet Hold."
Inst157Quest1_Location = "Violet Hold (Auto-accept)"
Inst157Quest1_Note = "Turn in quest to an NPC in your class hall."
Inst157Quest1_Prequest = "None"
Inst157Quest1_Folgequest = "None"
--
Inst157Quest1name1 = "Violet Hold Contraband Locker"

--Quest 2 Alliance
Inst157Quest2 = "2. Violet Hold (Heroic)"
Inst157Quest2_Aim = "Defeat the leader of the Assault on Violet Hold on Heroic difficulty or higher."
Inst157Quest2_Location = "Violet Hold (Auto-accept)"
Inst157Quest2_Note = "Turn in quest to an NPC in your class hall."
Inst157Quest2_Prequest = "None"
Inst157Quest2_Folgequest = "None"
--
Inst157Quest2name1 = "Violet Hold Contraband Locker"

--Quest 3 Alliance
Inst157Quest3 = "3. Violet Hold (Mythic)"
Inst157Quest3_Aim = "Defeat the leader of the Assault on Violet Hold on Mythic difficulty."
Inst157Quest3_Location = "Violet Hold (Auto-accept)"
Inst157Quest3_Note = "Turn in quest to an NPC in your class hall."
Inst157Quest3_Prequest = "None"
Inst157Quest3_Folgequest = "None"
--
Inst157Quest3name1 = "Violet Hold Contraband Locker"

--Quest 4 Alliance
Inst157Quest4 = "4. Purple Pain"
Inst157Quest4_Aim = "Repel the Assault on Violet Hold."
Inst157Quest4_Location = "Lieutenant Sinclari (Dalaran - The Violet Hold; "..YELLOW.."66.3, 68.0"..WHITE..")"
Inst157Quest4_Note = "Simply complete the dungeon and turn the quest in to the same NPC outside the dungeon."
Inst157Quest4_Prequest = "None"
Inst157Quest4_Folgequest = "None"
-- Reward varies for each class

--Quest 5 Alliance
Inst157Quest5 = "5. Cheating Death"
Inst157Quest5_Aim = "Craft 2 Failure Detection Pylons. Go to the Violet Hold and recover a Plasmatic Laser Bolt and return everything to Didi the Wrench in Dalaran."
Inst157Quest5_Location = "Didi the Wrench (Dalaran - The Violet Hold; "..YELLOW.."38.6, 25.0"..WHITE..")"
Inst157Quest5_Note = "Engineering quest.  Craft the two Failure Detection Pylons.  The Plasmatic Laser Bolt is in the back of the cell of the first or second boss.  Go into the cell before the end of the instance to retrieve the item.   The reward teaches you a new Engineering Schematic."
Inst157Quest5_Prequest = "None"
Inst157Quest5_Folgequest = "None"
-- No Rewards for this quest

--Quest 6 Alliance
Inst157Quest6 = "6. Uncovering Orders"
Inst157Quest6_Aim = "Recover the Fragment of Spite from Blackrook Hold (Mythic), the Fragment of Power from Violet Hold (Mythic), and the Fragment of Torment from Vault of the Wardens (Mythic)."
Inst157Quest6_Location = "Archmage Khadgar (Dalaran - Violet Citadel; "..YELLOW.."28.8, 48.6"..WHITE..")"
Inst157Quest6_Note = "Karazhan attunement questline.  Can only be completed on Mythic or Mythic+ difficulty."
Inst157Quest6_Prequest = "Edict of the God-King -> Unwanted Evidence"
Inst157Quest6_Folgequest = "Aura of Uncertainty"
Inst157Quest6PreQuest = "true"
--
Inst157Quest6name1 = "Demonic Command Shards"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst157Quest1_HORDE = Inst157Quest1
Inst157Quest1_HORDE_Aim = Inst157Quest1_Aim
Inst157Quest1_HORDE_Location = Inst157Quest1_Location
Inst157Quest1_HORDE_Note = Inst157Quest1_Note
Inst157Quest1_HORDE_Prequest = Inst157Quest1_Prequest
Inst157Quest1_HORDE_Folgequest = Inst157Quest1_Folgequest
--
Inst157Quest1name1_HORDE = Inst157Quest1name1

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst157Quest2_HORDE = Inst157Quest2
Inst157Quest2_HORDE_Aim = Inst157Quest2_Aim
Inst157Quest2_HORDE_Location = Inst157Quest2_Location
Inst157Quest2_HORDE_Note = Inst157Quest2_Note
Inst157Quest2_HORDE_Prequest = Inst157Quest2_Prequest
Inst157Quest2_HORDE_Folgequest = Inst157Quest2_Folgequest
--
Inst157Quest2name1_HORDE = Inst157Quest2name1

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst157Quest3_HORDE = Inst157Quest3
Inst157Quest3_HORDE_Aim = Inst157Quest3_Aim
Inst157Quest3_HORDE_Location = Inst157Quest3_Location
Inst157Quest3_HORDE_Note = Inst157Quest3_Note
Inst157Quest3_HORDE_Prequest = Inst157Quest3_Prequest
Inst157Quest3_HORDE_Folgequest = Inst157Quest3_Folgequest
--
Inst157Quest3name1_HORDE = Inst157Quest3name1

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst157Quest4_HORDE = Inst157Quest4
Inst157Quest4_HORDE_Aim = Inst157Quest4_Aim
Inst157Quest4_HORDE_Location = Inst157Quest4_Location
Inst157Quest4_HORDE_Note = Inst157Quest4_Note
Inst157Quest4_HORDE_Prequest = Inst157Quest4_Prequest
Inst157Quest4_HORDE_Folgequest = Inst157Quest4_Folgequest
-- Reward varies for each class

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst157Quest5_HORDE = Inst157Quest5
Inst157Quest5_HORDE_Aim = Inst157Quest5_Aim
Inst157Quest5_HORDE_Location = Inst157Quest5_Location
Inst157Quest5_HORDE_Note = Inst157Quest5_Note
Inst157Quest5_HORDE_Prequest = Inst157Quest5_Prequest
Inst157Quest5_HORDE_Folgequest = Inst157Quest5_Folgequest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst157Quest6_HORDE = Inst157Quest6
Inst157Quest6_HORDE_Aim = Inst157Quest6_Aim
Inst157Quest6_HORDE_Location = Inst157Quest6_Location
Inst157Quest6_HORDE_Note = Inst157Quest6_Note
Inst157Quest6_HORDE_Prequest = Inst157Quest6_Prequest
Inst157Quest6_HORDE_Folgequest = Inst157Quest6_Folgequest
Inst157Quest6PreQuest_HORDE = Inst157Quest6PreQuest
--
Inst157Quest6name1_HORDE = Inst157Quest6name1



--------------- INST158 - Black Rook Hold ---------------

Inst158Caption = "Black Rook Hold"
Inst158QAA = "10 Quests"
Inst158QAH = "10 Quests"

--Quest 1 Alliance
Inst158Quest1 = "1. The Lord of Black Rook Hold"
Inst158Quest1_Aim = "Defeat Lord Kur'talos Ravencrest in Black Rook Hold."
Inst158Quest1_Location = "Black Rook Hold (Auto-accept)"
Inst158Quest1_Note = "Turn in quest to an NPC in your class hall."
Inst158Quest1_Prequest = "None"
Inst158Quest1_Folgequest = "None"
--
Inst158Quest1name1 = "Haunted Ravencrest Keepsake"

--Quest 2 Alliance
Inst158Quest2 = "2. The Lord of Black Rook Hold (Heroic)"
Inst158Quest2_Aim = "Defeat Kur'talos Ravencrest in the Black Rook Hold on Heroic difficulty or higher."
Inst158Quest2_Location = "Black Rook Hold (Auto-accept)"
Inst158Quest2_Note = "Turn in quest to an NPC in your class hall."
Inst158Quest2_Prequest = "None"
Inst158Quest2_Folgequest = "None"
--
Inst158Quest2name1 = "Haunted Ravencrest Keepsake"

--Quest 3 Alliance
Inst158Quest3 = "3. The Lord of Black Rook Hold (Mythic)"
Inst158Quest3_Aim = "Defeat Kur'talos Ravencrest in the Black Rook Hold on Mythic difficulty."
Inst158Quest3_Location = "Black Rook Hold (Auto-accept)"
Inst158Quest3_Note = "Turn in quest to an NPC in your class hall."
Inst158Quest3_Prequest = "None"
Inst158Quest3_Folgequest = "None"
--
Inst158Quest3name1 = "Haunted Ravencrest Keepsake"

--Quest 4 Alliance
Inst158Quest4 = "4. Black Rook Hold: Worst of the Worst"
Inst158Quest4_Aim = "Kill Braxas the Fleshcarver and Dantallionax in Black Rook Hold."
Inst158Quest4_Location = ""
Inst158Quest4_Note = AQ_WORLDDUNGEONQUEST
Inst158Quest4_Prequest = "None"
Inst158Quest4_Folgequest = "None"
-- No Rewards for this quest

--Quest 5 Alliance
Inst158Quest5 = "5. Black Rook Hold: Traitor's Demise"
Inst158Quest5_Aim = "Kill Kelorn Nightblade and Dantallionax in Black Rook Hold."
Inst158Quest5_Location = ""
Inst158Quest5_Note = AQ_WORLDDUNGEONQUEST
Inst158Quest5_Prequest = "None"
Inst158Quest5_Folgequest = "None"
-- No Rewards for this quest

--Quest 6 Alliance
Inst158Quest6 = "6. Black Rook Hold: The Sorrow"
Inst158Quest6_Aim = "Kill General Tel'arn, Ranger General Feleor and Dantallionax in Black Rook Hold."
Inst158Quest6_Location = ""
Inst158Quest6_Note = AQ_WORLDDUNGEONQUEST
Inst158Quest6_Prequest = "None"
Inst158Quest6_Folgequest = "None"
-- No Rewards for this quest

--Quest 7 Alliance
Inst158Quest7 = "7. Black Rook Hold: The Mad Arcanist"
Inst158Quest7_Aim = "Kill Archmage Galeorn and Dantallionax in Black Rook Hold."
Inst158Quest7_Location = ""
Inst158Quest7_Note = AQ_WORLDDUNGEONQUEST
Inst158Quest7_Prequest = "None"
Inst158Quest7_Folgequest = "None"
-- No Rewards for this quest

--Quest 8 Alliance
Inst158Quest8 = "8. Black Rook Hold: ... With Fire!"
Inst158Quest8_Aim = "Kill Ancient Widow and Dantallionax in Black Rook Hold."
Inst158Quest8_Location = ""
Inst158Quest8_Note = AQ_WORLDDUNGEONQUEST
Inst158Quest8_Prequest = "None"
Inst158Quest8_Folgequest = "None"
-- No Rewards for this quest

--Quest 9 Alliance
Inst158Quest9 = "9. Greater Power"
Inst158Quest9_Aim = "Defeat Lord Kur'talos Ravencrest and retrieve a Greater Demonic Runestone from Dantalionax in the Black Rook Hold Dungeon."
Inst158Quest9_Location = "Odyn (Skyhold; "..YELLOW.."58.4, 82.8"..WHITE..")"
Inst158Quest9_Note = "Warrior quest.  Becomes available after completing demonic runes.  Lord Kur'talos Ravencrest and Dantalionax are the last bosses of the dungeon, located at "..YELLOW.."[4]"..WHITE.."."
Inst158Quest9_Prequest = "Demonic Runes"
Inst158Quest9_Folgequest = "None"
Inst158Quest9PreQuest = "true"
-- No Rewards for this quest

--Quest 10 Alliance
Inst158Quest10 = "10. Uncovering Orders"
Inst158Quest10_Aim = "Recover the Fragment of Spite from Blackrook Hold (Mythic), the Fragment of Power from Violet Hold (Mythic), and the Fragment of Torment from Vault of the Wardens (Mythic)."
Inst158Quest10_Location = "Archmage Khadgar (Dalaran - Violet Citadel; "..YELLOW.."28.8, 48.6"..WHITE..")"
Inst158Quest10_Note = "Karazhan attunement questline.  Can only be completed on Mythic or Mythic+ difficulty."
Inst158Quest10_Prequest = "Edict of the God-King -> Unwanted Evidence"
Inst158Quest10_Folgequest = "Aura of Uncertainty"
Inst158Quest10PreQuest = "true"
--
Inst158Quest10name1 = "Demonic Command Shards"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst158Quest1_HORDE = Inst158Quest1
Inst158Quest1_HORDE_Aim = Inst158Quest1_Aim
Inst158Quest1_HORDE_Location = Inst158Quest1_Location
Inst158Quest1_HORDE_Note = Inst158Quest1_Note
Inst158Quest1_HORDE_Prequest = Inst158Quest1_Prequest
Inst158Quest1_HORDE_Folgequest = Inst158Quest1_Folgequest
--
Inst158Quest1name1_HORDE = Inst158Quest1name1

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst158Quest2_HORDE = Inst158Quest2
Inst158Quest2_HORDE_Aim = Inst158Quest2_Aim
Inst158Quest2_HORDE_Location = Inst158Quest2_Location
Inst158Quest2_HORDE_Note = Inst158Quest2_Note
Inst158Quest2_HORDE_Prequest = Inst158Quest2_Prequest
Inst158Quest2_HORDE_Folgequest = Inst158Quest2_Folgequest
--
Inst158Quest2name1_HORDE = Inst158Quest2name1

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst158Quest3_HORDE = Inst158Quest3
Inst158Quest3_HORDE_Aim = Inst158Quest3_Aim
Inst158Quest3_HORDE_Location = Inst158Quest3_Location
Inst158Quest3_HORDE_Note = Inst158Quest3_Note
Inst158Quest3_HORDE_Prequest = Inst158Quest3_Prequest
Inst158Quest3_HORDE_Folgequest = Inst158Quest3_Folgequest
--
Inst158Quest3name1_HORDE = Inst158Quest3name1

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst158Quest4_HORDE = Inst158Quest4
Inst158Quest4_HORDE_Aim = Inst158Quest4_Aim
Inst158Quest4_HORDE_Location = Inst158Quest4_Location
Inst158Quest4_HORDE_Note = Inst158Quest4_Note
Inst158Quest4_HORDE_Prequest = Inst158Quest4_Prequest
Inst158Quest4_HORDE_Folgequest = Inst158Quest4_Folgequest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst158Quest5_HORDE = Inst158Quest5
Inst158Quest5_HORDE_Aim = Inst158Quest5_Aim
Inst158Quest5_HORDE_Location = Inst158Quest5_Location
Inst158Quest5_HORDE_Note = Inst158Quest5_Note
Inst158Quest5_HORDE_Prequest = Inst158Quest5_Prequest
Inst158Quest5_HORDE_Folgequest = Inst158Quest5_Folgequest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst158Quest6_HORDE = Inst158Quest6
Inst158Quest6_HORDE_Aim = Inst158Quest6_Aim
Inst158Quest6_HORDE_Location = Inst158Quest6_Location
Inst158Quest6_HORDE_Note = Inst158Quest6_Note
Inst158Quest6_HORDE_Prequest = Inst158Quest6_Prequest
Inst158Quest6_HORDE_Folgequest = Inst158Quest6_Folgequest
-- No Rewards for this quest

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst158Quest7_HORDE = Inst158Quest7
Inst158Quest7_HORDE_Aim = Inst158Quest7_Aim
Inst158Quest7_HORDE_Location = Inst158Quest7_Location
Inst158Quest7_HORDE_Note = Inst158Quest7_Note
Inst158Quest7_HORDE_Prequest = Inst158Quest7_Prequest
Inst158Quest7_HORDE_Folgequest = Inst158Quest7_Folgequest
-- No Rewards for this quest

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst158Quest8_HORDE = Inst158Quest8
Inst158Quest8_HORDE_Aim = Inst158Quest8_Aim
Inst158Quest8_HORDE_Location = Inst158Quest8_Location
Inst158Quest8_HORDE_Note = Inst158Quest8_Note
Inst158Quest8_HORDE_Prequest = Inst158Quest8_Prequest
Inst158Quest8_HORDE_Folgequest = Inst158Quest8_Folgequest
-- No Rewards for this quest

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst158Quest9_HORDE = Inst158Quest9
Inst158Quest9_HORDE_Aim = Inst158Quest9_Aim
Inst158Quest9_HORDE_Location = Inst158Quest9_Location
Inst158Quest9_HORDE_Note = Inst158Quest9_Note
Inst158Quest9_HORDE_Prequest = Inst158Quest9_Prequest
Inst158Quest9_HORDE_Folgequest = Inst158Quest9_Folgequest
Inst158Quest9PreQuest_HORDE = Inst158Quest9PreQuest
-- No Rewards for this quest

--Quest 10 Horde  (same as Quest 10 Alliance)
Inst158Quest10_HORDE = Inst158Quest10
Inst158Quest10_HORDE_Aim = Inst158Quest10_Aim
Inst158Quest10_HORDE_Location = Inst158Quest10_Location
Inst158Quest10_HORDE_Note = Inst158Quest10_Note
Inst158Quest10_HORDE_Prequest = Inst158Quest10_Prequest
Inst158Quest10_HORDE_Folgequest = Inst158Quest10_Folgequest
Inst158Quest10PreQuest_HORDE = Inst158Quest10PreQuest
--
Inst158Quest10name1_HORDE = Inst158Quest10name1



--------------- INST159 - Court of Stars ---------------

Inst159Caption = "Court of Stars"
Inst159QAA = "6 Quests"
Inst159QAH = "6 Quests"

--Quest 1 Alliance
Inst159Quest1 = "1. Court of Stars (Mythic)"
Inst159Quest1_Aim = "Defeat Advisor Melandrus in Court of Stars on Mythic difficulty."
Inst159Quest1_Location = "Court of Stars (Auto-accept)"
Inst159Quest1_Note = "Turn in quest to an NPC in your class hall."
Inst159Quest1_Prequest = "None"
Inst159Quest1_Folgequest = "None"
--
Inst159Quest1name1 = "Nightborne Rucksack"

--Quest 2 Alliance
Inst159Quest2 = "2. Court of Stars: Bring Me the Eyes"
Inst159Quest2_Aim = "Kill Velimar and Advisor Melandrus in Court of Stars."
Inst159Quest2_Location = ""
Inst159Quest2_Note = AQ_WORLDDUNGEONQUEST
Inst159Quest2_Prequest = "None"
Inst159Quest2_Folgequest = "None"
-- No Rewards for this quest

--Quest 3 Alliance
Inst159Quest3 = "3. Court of Stars: Disarming the Watch"
Inst159Quest3_Aim = "Collect 6 Nightwatch Weaponry and kill Advisor Melandrus in Court of Stars."
Inst159Quest3_Location = ""
Inst159Quest3_Note = AQ_WORLDDUNGEONQUEST
Inst159Quest3_Prequest = "None"
Inst159Quest3_Folgequest = "None"
-- No Rewards for this quest

--Quest 4 Alliance
Inst159Quest4 = "4. Court of Stars: The Deceitful Student"
Inst159Quest4_Aim = "Kill Arcanist Malrodi and Advisor Melandrus in Court of Stars."
Inst159Quest4_Location = ""
Inst159Quest4_Note = AQ_WORLDDUNGEONQUEST
Inst159Quest4_Prequest = "None"
Inst159Quest4_Folgequest = "None"
-- No Rewards for this quest

--Quest 5 Alliance
Inst159Quest5 = "5. Beware the Fury of a Patient Elf"
Inst159Quest5_Aim = "Enter the Court of Stars dungeon and slay Advisor Melandrus. Collect his Spellstone and return it to Thalyssra."
Inst159Quest5_Location = "First Arcanist Thalyssra (Suramar - Meredii; "..YELLOW.."36.4, 46.8"..WHITE..")"
Inst159Quest5_Note = "Advisor Melandrus is located at "..YELLOW.."[3]"..WHITE.."."
Inst159Quest5_Prequest = "None"
Inst159Quest5_Folgequest = "None"
--
Inst159Quest5name1 = "Ancient Qiraji Idol"

--Quest 6 Alliance
Inst159Quest6 = "6. Revamping the Recoil"
Inst159Quest6_Aim = "Go into the Court of Stars and recover the Arcanic Compressor for Hobart."
Inst159Quest6_Location = "Hobart Grapplehammer (Dalaran; "..YELLOW.."38.6, 26.2"..WHITE..")"
Inst159Quest6_Note = "Engineering quest.  The Arcanic Compressor drops from Patrol Captain Gerdo at "..YELLOW.."[1]"..WHITE.."."
Inst159Quest6_Prequest = "None"
Inst159Quest6_Folgequest = "None"
--
Inst159Quest6name1 = "Schematic: Semi-Automagic Cranial Cannon"
Inst159Quest6name2 = "Schematic: Sawed-Off Cranial Cannon"
Inst159Quest6name3 = "Schematic: Double-Barreled Cranial Cannon"
Inst159Quest6name4 = "Schematic: Ironsight Cranial Cannon"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst159Quest1_HORDE = Inst159Quest1
Inst159Quest1_HORDE_Aim = Inst159Quest1_Aim
Inst159Quest1_HORDE_Location = Inst159Quest1_Location
Inst159Quest1_HORDE_Note = Inst159Quest1_Note
Inst159Quest1_HORDE_Prequest = Inst159Quest1_Prequest
Inst159Quest1_HORDE_Folgequest = Inst159Quest1_Folgequest
--
Inst159Quest1name1_HORDE = Inst159Quest1name1

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst159Quest2_HORDE = Inst159Quest2
Inst159Quest2_HORDE_Aim = Inst159Quest2_Aim
Inst159Quest2_HORDE_Location = Inst159Quest2_Location
Inst159Quest2_HORDE_Note = Inst159Quest2_Note
Inst159Quest2_HORDE_Prequest = Inst159Quest2_Prequest
Inst159Quest2_HORDE_Folgequest = Inst159Quest2_Folgequest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst159Quest3_HORDE = Inst159Quest3
Inst159Quest3_HORDE_Aim = Inst159Quest3_Aim
Inst159Quest3_HORDE_Location = Inst159Quest3_Location
Inst159Quest3_HORDE_Note = Inst159Quest3_Note
Inst159Quest3_HORDE_Prequest = Inst159Quest3_Prequest
Inst159Quest3_HORDE_Folgequest = Inst159Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst159Quest4_HORDE = Inst159Quest4
Inst159Quest4_HORDE_Aim = Inst159Quest4_Aim
Inst159Quest4_HORDE_Location = Inst159Quest4_Location
Inst159Quest4_HORDE_Note = Inst159Quest4_Note
Inst159Quest4_HORDE_Prequest = Inst159Quest4_Prequest
Inst159Quest4_HORDE_Folgequest = Inst159Quest4_Folgequest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst159Quest5_HORDE = Inst159Quest5
Inst159Quest5_HORDE_Aim = Inst159Quest5_Aim
Inst159Quest5_HORDE_Location = Inst159Quest5_Location
Inst159Quest5_HORDE_Note = Inst159Quest5_Note
Inst159Quest5_HORDE_Prequest = Inst159Quest5_Prequest
Inst159Quest5_HORDE_Folgequest = Inst159Quest5_Folgequest
--
Inst159Quest5name1_HORDE = Inst159Quest5name1

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst159Quest6_HORDE = Inst159Quest6
Inst159Quest6_HORDE_Aim = Inst159Quest6_Aim
Inst159Quest6_HORDE_Location = Inst159Quest6_Location
Inst159Quest6_HORDE_Note = Inst159Quest6_Note
Inst159Quest6_HORDE_Prequest = Inst159Quest6_Prequest
Inst159Quest6_HORDE_Folgequest = Inst159Quest6_Folgequest
Inst159Quest6PreQuest_HORDE = Inst159Quest6PreQuest
Inst159Quest6FQuest_HORDE = Inst159Quest6FQuest
--
Inst159Quest6name1_HORDE = Inst159Quest6name1
Inst159Quest6name2_HORDE = Inst159Quest6name2
Inst159Quest6name3_HORDE = Inst159Quest6name3
Inst159Quest6name4_HORDE = Inst159Quest6name4



--------------- INST160 - Darkheart Thicket ---------------

Inst160Caption = "Darkheart Thicket"
Inst160QAA = "9 Quests"
Inst160QAH = "9 Quests"

--Quest 1 Alliance
Inst160Quest1 = "1. Darkheart Thicket"
Inst160Quest1_Aim = "Defeat the Shade of Xavius in Darkheart Thicket."
Inst160Quest1_Location = "Darkheart Thicket (Auto-accept)"
Inst160Quest1_Note = "Turn in quest to an NPC in your class hall."
Inst160Quest1_Prequest = "None"
Inst160Quest1_Folgequest = "None"
--
Inst160Quest1name1 = "Despoiled Keeper's Cache"

--Quest 2 Alliance
Inst160Quest2 = "2. Darkheart Thicket (Heroic)"
Inst160Quest2_Aim = "Defeat the Shade of Xavius in Darkheart Thicket on Heroic difficulty or higher."
Inst160Quest2_Location = "Darkheart Thicket (Auto-accept)"
Inst160Quest2_Note = "Turn in quest to an NPC in your class hall."
Inst160Quest2_Prequest = "None"
Inst160Quest2_Folgequest = "None"
--
Inst160Quest2name1 = "Despoiled Keeper's Cache"

--Quest 3 Alliance
Inst160Quest3 = "3. Darkheart Thicket (Mythic)"
Inst160Quest3_Aim = "Defeat the Shade of Xavius in Darkheart Thicket on Mythic difficulty."
Inst160Quest3_Location = "Darkheart Thicket (Auto-accept)"
Inst160Quest3_Note = "Turn in quest to an NPC in your class hall."
Inst160Quest3_Prequest = "None"
Inst160Quest3_Folgequest = "None"
--
Inst160Quest3name1 = "Despoiled Keeper's Cache"

--Quest 4 Alliance
Inst160Quest4 = "4. Darkheart Thicket: A Burden to Bear"
Inst160Quest4_Aim = "Kill 9 Bears and defeat the Shade of Xavius in Darkheart Thicket."
Inst160Quest4_Location = ""
Inst160Quest4_Note = AQ_WORLDDUNGEONQUEST
Inst160Quest4_Prequest = "None"
Inst160Quest4_Folgequest = "None"
-- No Rewards for this quest

--Quest 5 Alliance
Inst160Quest5 = "5. Darkheart Thicket: Kudzilla"
Inst160Quest5_Aim = "Kill Kudzilla and Shade of Xavius in Darkheart Thicket."
Inst160Quest5_Location = ""
Inst160Quest5_Note = AQ_WORLDDUNGEONQUEST
Inst160Quest5_Prequest = "None"
Inst160Quest5_Folgequest = "None"
-- No Rewards for this quest

--Quest 6 Alliance
Inst160Quest6 = "6. Darkheart Thicket: Preserving the Preservers"
Inst160Quest6_Aim = "Revive 5 Preservers and defeat the Shade of Xavius in Darkheart Thicket."
Inst160Quest6_Location = ""
Inst160Quest6_Note = AQ_WORLDDUNGEONQUEST
Inst160Quest6_Prequest = "None"
Inst160Quest6_Folgequest = "None"
-- No Rewards for this quest

--Quest 7 Alliance
Inst160Quest7 = "7. Darkheart Thicket: Rage Rot"
Inst160Quest7_Aim = "Kill Rage Rot and Shade of Xavius in Darkheart Thicket."
Inst160Quest7_Location = ""
Inst160Quest7_Note = AQ_WORLDDUNGEONQUEST
Inst160Quest7_Prequest = "None"
Inst160Quest7_Folgequest = "None"
-- No Rewards for this quest

--Quest 8 Alliance
Inst160Quest8 = "8. Nal'ryssa's Sisters"
Inst160Quest8_Aim = "Go to the Darkheart Thicket and find Lyrelle's Signet Ring."
Inst160Quest8_Location = "Felsmith Nal'ryssa (Suramar; "..YELLOW.."30.0, 53.4"..WHITE..")"
Inst160Quest8_Note = "Mining quest. The Signet Ring drops from the Shade of Xavius at "..YELLOW.."[4]"..WHITE.."."
Inst160Quest8_Prequest = "The Felsmiths"
Inst160Quest8_Folgequest = "None"
Inst160Quest8PreQuest = "true"
--
Inst160Quest8name1 = "Nal'ryssa's Spare Mining Supplies"

--Quest 9 Alliance
Inst160Quest9 = "9. Enter the Nightmare"
Inst160Quest9_Aim = "Enter Darkheart Thicket and Slay the Shade of Xavius."
Inst160Quest9_Location = "Tyrande Whisperwind (Val'sharah - Temple of Elune; "..YELLOW.."53.6, 55.8"..WHITE..")"
Inst160Quest9_Note = "This quest becomes available after completing the quests involving Ysera and Malfurion.  The Shade of Xavius is at "..YELLOW.."[4]"..WHITE.."."
Inst160Quest9_Prequest = "The Fate of Val'sharah"
Inst160Quest9_Folgequest = "None"
Inst160Quest9PreQuest = "true"
-- Reward varies for each class


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst160Quest1_HORDE = Inst160Quest1
Inst160Quest1_HORDE_Aim = Inst160Quest1_Aim
Inst160Quest1_HORDE_Location = Inst160Quest1_Location
Inst160Quest1_HORDE_Note = Inst160Quest1_Note
Inst160Quest1_HORDE_Prequest = Inst160Quest1_Prequest
Inst160Quest1_HORDE_Folgequest = Inst160Quest1_Folgequest
--
Inst160Quest1name1_HORDE = Inst160Quest1name1

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst160Quest2_HORDE = Inst160Quest2
Inst160Quest2_HORDE_Aim = Inst160Quest2_Aim
Inst160Quest2_HORDE_Location = Inst160Quest2_Location
Inst160Quest2_HORDE_Note = Inst160Quest2_Note
Inst160Quest2_HORDE_Prequest = Inst160Quest2_Prequest
Inst160Quest2_HORDE_Folgequest = Inst160Quest2_Folgequest
--
Inst160Quest2name1_HORDE = Inst160Quest2name1

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst160Quest3_HORDE = Inst160Quest3
Inst160Quest3_HORDE_Aim = Inst160Quest3_Aim
Inst160Quest3_HORDE_Location = Inst160Quest3_Location
Inst160Quest3_HORDE_Note = Inst160Quest3_Note
Inst160Quest3_HORDE_Prequest = Inst160Quest3_Prequest
Inst160Quest3_HORDE_Folgequest = Inst160Quest3_Folgequest
--
Inst160Quest3name1_HORDE = Inst160Quest3name1

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst160Quest4_HORDE = Inst160Quest4
Inst160Quest4_HORDE_Aim = Inst160Quest4_Aim
Inst160Quest4_HORDE_Location = Inst160Quest4_Location
Inst160Quest4_HORDE_Note = Inst160Quest4_Note
Inst160Quest4_HORDE_Prequest = Inst160Quest4_Prequest
Inst160Quest4_HORDE_Folgequest = Inst160Quest4_Folgequest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst160Quest5_HORDE = Inst160Quest5
Inst160Quest5_HORDE_Aim = Inst160Quest5_Aim
Inst160Quest5_HORDE_Location = Inst160Quest5_Location
Inst160Quest5_HORDE_Note = Inst160Quest5_Note
Inst160Quest5_HORDE_Prequest = Inst160Quest5_Prequest
Inst160Quest5_HORDE_Folgequest = Inst160Quest5_Folgequest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst160Quest6_HORDE = Inst160Quest6
Inst160Quest6_HORDE_Aim = Inst160Quest6_Aim
Inst160Quest6_HORDE_Location = Inst160Quest6_Location
Inst160Quest6_HORDE_Note = Inst160Quest6_Note
Inst160Quest6_HORDE_Prequest = Inst160Quest6_Prequest
Inst160Quest6_HORDE_Folgequest = Inst160Quest6_Folgequest
-- No Rewards for this quest

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst160Quest7_HORDE = Inst160Quest7
Inst160Quest7_HORDE_Aim = Inst160Quest7_Aim
Inst160Quest7_HORDE_Location = Inst160Quest7_Location
Inst160Quest7_HORDE_Note = Inst160Quest7_Note
Inst160Quest7_HORDE_Prequest = Inst160Quest7_Prequest
Inst160Quest7_HORDE_Folgequest = Inst160Quest7_Folgequest
-- No Rewards for this quest

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst160Quest8_HORDE = Inst160Quest8
Inst160Quest8_HORDE_Aim = Inst160Quest8_Aim
Inst160Quest8_HORDE_Location = Inst160Quest8_Location
Inst160Quest8_HORDE_Note = Inst160Quest8_Note
Inst160Quest8_HORDE_Prequest = Inst160Quest8_Prequest
Inst160Quest8_HORDE_Folgequest = Inst160Quest8_Folgequest
Inst160Quest8PreQuest_HORDE = Inst160Quest8PreQuest
--
Inst160Quest8name1_HORDE = Inst160Quest8name1

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst160Quest9_HORDE = Inst160Quest9
Inst160Quest9_HORDE_Aim = Inst160Quest9_Aim
Inst160Quest9_HORDE_Location = Inst160Quest9_Location
Inst160Quest9_HORDE_Note = Inst160Quest9_Note
Inst160Quest9_HORDE_Prequest = Inst160Quest9_Prequest
Inst160Quest9_HORDE_Folgequest = Inst160Quest9_Folgequest
Inst160Quest9PreQuest_HORDE = Inst160Quest9PreQuest
-- Reward varies for each class



--------------- INST161 - Eye of Azshara ---------------

Inst161Caption = "Eye of Azshara"
Inst161QAA = "8 Quests"
Inst161QAH = "8 Quests"

--Quest 1 Alliance
Inst161Quest1 = "1. Eye of Azshara: Termination Claws"
Inst161Quest1_Aim = "Kill Gom Crabbar and defeat the Wrath of Azshara."
Inst161Quest1_Location = ""
Inst161Quest1_Note = AQ_WORLDDUNGEONQUEST
Inst161Quest1_Prequest = "None"
Inst161Quest1_Folgequest = "None"
-- No Rewards for this quest

--Quest 2 Alliance
Inst161Quest2 = "2. Eye of Azshara: Slug It Out"
Inst161Quest2_Aim = "Kill Shellmaw and defeat the Wrath of Azshara."
Inst161Quest2_Location = ""
Inst161Quest2_Note = AQ_WORLDDUNGEONQUEST
Inst161Quest2_Prequest = "None"
Inst161Quest2_Folgequest = "None"
-- No Rewards for this quest

--Quest 3 Alliance
Inst161Quest3 = "3. Eye of Azshara: Dread End"
Inst161Quest3_Aim = "Dread Captain Thedon and defeat the Wrath of Azshara."
Inst161Quest3_Location = ""
Inst161Quest3_Note = AQ_WORLDDUNGEONQUEST
Inst161Quest3_Prequest = "None"
Inst161Quest3_Folgequest = "None"
-- No Rewards for this quest

--Quest 4 Alliance
Inst161Quest4 = "4. Eye of Azshara: Azsunian Pearls"
Inst161Quest4_Aim = "Collect 5 Massive Azsunian Pearl and defeat the Wrath of Azshara."
Inst161Quest4_Location = ""
Inst161Quest4_Note = AQ_WORLDDUNGEONQUEST
Inst161Quest4_Prequest = "None"
Inst161Quest4_Folgequest = "None"
-- No Rewards for this quest

--Quest 5 Alliance
Inst161Quest5 = "5. Wrath of Azshara"
Inst161Quest5_Aim = "Enter the Eye of Azshara, then defeat Warlord Parjesh and the Wrath of Azshara."
Inst161Quest5_Location = "Prince Farondis (Azsuna; "..YELLOW.."61.6, 41.0"..WHITE..")"
Inst161Quest5_Note = "The prequest will be available after completing certain quests in Azsuna."
Inst161Quest5_Prequest = "The Head of the Snake"
Inst161Quest5_Folgequest = "The Tidestone of Golganneth"
Inst161Quest5PreQuest = "true"
--
Inst161Quest5name1 = "Tidestone Sliver"

--Quest 6 Alliance
Inst161Quest6 = "6. The Tidestone of Golganneth"
Inst161Quest6_Aim = "Use the central teleporter in Dalaran and then place the Tidestone of Golganneth in the Portrait Room of the Chamber of the Guardian."
Inst161Quest6_Location = "Tidestone of Golganneth (Wrath of Azshara; "..YELLOW.."[5]"..WHITE..")"
Inst161Quest6_Note = "The Portrait Room is in the upper tower of Dalaran, accessible by running over a portal in the middle of the city."
Inst161Quest6_Prequest = "Wrath of Azshara"
Inst161Quest6_Folgequest = "None"
Inst161Quest6FQuest = "true"
-- Reward varies for each class

--Quest 7 Alliance
Inst161Quest7 = "7. Cleansing the Dreamway"
Inst161Quest7_Aim = "Collect 25 Rarefied Water from the naga in the Eye of Azshara."
Inst161Quest7_Location = "Brightwing (Flies around the Emerald Dreamway)."
Inst161Quest7_Note = "Druid quest.  All Naga in the dungeon should be able to drop the Rarefied Water.  The quest turns in to Brightwing."
Inst161Quest7_Prequest = "Wrath of Azshara"
Inst161Quest7_Folgequest = "None"
Inst161Quest7FQuest = "true"
-- Reward varies for each class

--Quest 8 Alliance
Inst161Quest8 = "8. The Heart of Zin-Azshari"
Inst161Quest8_Aim = "Retrieve the Heart of Zin-Azshari and defeat the Wrath of Azshara in the Eye of Azshara on Mythic difficulty."
Inst161Quest8_Location = "Senegos (Azsuna - Azurewing Repose; "..YELLOW.."48.2, 25.6"..WHITE..")"
Inst161Quest8_Note = "This quest can only be completed on Mythic difficulty without a keystone.   It is part of your Artifact weapon questline.  The Heart of Zin'Azshari drops the final boss, at "..YELLOW.."[5]"..WHITE.."."
Inst161Quest8_Prequest = "None"
Inst161Quest8_Folgequest = "None"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst161Quest1_HORDE = Inst161Quest1
Inst161Quest1_HORDE_Aim = Inst161Quest1_Aim
Inst161Quest1_HORDE_Location = Inst161Quest1_Location
Inst161Quest1_HORDE_Note = Inst161Quest1_Note
Inst161Quest1_HORDE_Prequest = Inst161Quest1_Prequest
Inst161Quest1_HORDE_Folgequest = Inst161Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst161Quest2_HORDE = Inst161Quest2
Inst161Quest2_HORDE_Aim = Inst161Quest2_Aim
Inst161Quest2_HORDE_Location = Inst161Quest2_Location
Inst161Quest2_HORDE_Note = Inst161Quest2_Note
Inst161Quest2_HORDE_Prequest = Inst161Quest2_Prequest
Inst161Quest2_HORDE_Folgequest = Inst161Quest2_Folgequest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst161Quest3_HORDE = Inst161Quest3
Inst161Quest3_HORDE_Aim = Inst161Quest3_Aim
Inst161Quest3_HORDE_Location = Inst161Quest3_Location
Inst161Quest3_HORDE_Note = Inst161Quest3_Note
Inst161Quest3_HORDE_Prequest = Inst161Quest3_Prequest
Inst161Quest3_HORDE_Folgequest = Inst161Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst161Quest4_HORDE = Inst161Quest4
Inst161Quest4_HORDE_Aim = Inst161Quest4_Aim
Inst161Quest4_HORDE_Location = Inst161Quest4_Location
Inst161Quest4_HORDE_Note = Inst161Quest4_Note
Inst161Quest4_HORDE_Prequest = Inst161Quest4_Prequest
Inst161Quest4_HORDE_Folgequest = Inst161Quest4_Folgequest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst161Quest5_HORDE = Inst161Quest5
Inst161Quest5_HORDE_Aim = Inst161Quest5_Aim
Inst161Quest5_HORDE_Location = Inst161Quest5_Location
Inst161Quest5_HORDE_Note = Inst161Quest5_Note
Inst161Quest5_HORDE_Prequest = Inst161Quest5_Prequest
Inst161Quest5_HORDE_Folgequest = Inst161Quest5_Folgequest
Inst161Quest5PreQuest_HORDE = Inst161Quest5PreQuest
--
Inst161Quest5name1_HORDE = Inst161Quest5name1

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst161Quest6_HORDE = Inst161Quest6
Inst161Quest6_HORDE_Aim = Inst161Quest6_Aim
Inst161Quest6_HORDE_Location = Inst161Quest6_Location
Inst161Quest6_HORDE_Note = Inst161Quest6_Note
Inst161Quest6_HORDE_Prequest = Inst161Quest6_Prequest
Inst161Quest6_HORDE_Folgequest = Inst161Quest6_Folgequest
Inst161Quest6FQuest_HORDE = Inst161Quest6FQuest
-- Reward varies for each class

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst161Quest7_HORDE = Inst161Quest7
Inst161Quest7_HORDE_Aim = Inst161Quest7_Aim
Inst161Quest7_HORDE_Location = Inst161Quest7_Location
Inst161Quest7_HORDE_Note = Inst161Quest7_Note
Inst161Quest7_HORDE_Prequest = Inst161Quest7_Prequest
Inst161Quest7_HORDE_Folgequest = Inst161Quest7_Folgequest
Inst161Quest7FQuest_HORDE = Inst161Quest7FQuest
-- Reward varies for each class

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst161Quest8_HORDE = Inst161Quest8
Inst161Quest8_HORDE_Aim = Inst161Quest8_Aim
Inst161Quest8_HORDE_Location = Inst161Quest8_Location
Inst161Quest8_HORDE_Note = Inst161Quest8_Note
Inst161Quest8_HORDE_Prequest = Inst161Quest8_Prequest
Inst161Quest8_HORDE_Folgequest = Inst161Quest8_Folgequest
-- No Rewards for this quest



--------------- INST162 - Halls of Valor ---------------

Inst162Caption = "Halls of Valor"
Inst162QAA = "14 Quests"
Inst162QAH = "14 Quests"

--Quest 1 Alliance
Inst162Quest1 = "1. Odyn's Challenge"
Inst162Quest1_Aim = "Defeat Odyn in the Halls of Valor on Normal difficulty."
Inst162Quest1_Location = "Halls of Valor (Auto-accept)"
Inst162Quest1_Note = "Turn in quest to an NPC in your class hall."
Inst162Quest1_Prequest = "None"
Inst162Quest1_Folgequest = "None"
--
Inst162Quest1name1 = "Challenger's Spoils"

--Quest 2 Alliance
Inst162Quest2 = "2. Odyn's Challenge (Heroic)"
Inst162Quest2_Aim = "Defeat Odyn in the Halls of Valor on Heroic difficulty or higher."
Inst162Quest2_Location = "Halls of Valor (Auto-accept)"
Inst162Quest2_Note = "Turn in quest to an NPC in your class hall."
Inst162Quest2_Prequest = "None"
Inst162Quest2_Folgequest = "None"
--
Inst162Quest2name1 = "Challenger's Spoils"

--Quest 3 Alliance
Inst162Quest3 = "3. Odyn's Challenge (Mythic)"
Inst162Quest3_Aim = "Defeat Odyn in the Halls of Valor on Mythic difficulty."
Inst162Quest3_Location = "Halls of Valor (Auto-accept)"
Inst162Quest3_Note = "Turn in quest to an NPC in your class hall."
Inst162Quest3_Prequest = "None"
Inst162Quest3_Folgequest = "None"
--
Inst162Quest3name1 = "Challenger's Spoils"

--Quest 4 Alliance
Inst162Quest4 = "4. Halls of Valor: A Worthy Challenge"
Inst162Quest4_Aim = "Defeat Volynd Stormbringer and Odyn in Halls of Valor."
Inst162Quest4_Location = ""
Inst162Quest4_Note = AQ_WORLDDUNGEONQUEST
Inst162Quest4_Prequest = "None"
Inst162Quest4_Folgequest = "None"
-- No Rewards for this quest

--Quest 5 Alliance
Inst162Quest5 = "5. Halls of Valor: Deeds of the Past"
Inst162Quest5_Aim = "Collect 3 Book of Exalted Deeds and defeat Odyn in Halls of Valor."
Inst162Quest5_Location = ""
Inst162Quest5_Note = AQ_WORLDDUNGEONQUEST
Inst162Quest5_Prequest = "None"
Inst162Quest5_Folgequest = "None"
-- No Rewards for this quest

--Quest 6 Alliance
Inst162Quest6 = "6. Halls of Valor: Ponderous Poaching"
Inst162Quest6_Aim = "Defeat Earlnoc the Beastbreaker and Odyn in Halls of Valor."
Inst162Quest6_Location = ""
Inst162Quest6_Note = AQ_WORLDDUNGEONQUEST
Inst162Quest6_Prequest = "None"
Inst162Quest6_Folgequest = "None"
-- No Rewards for this quest

--Quest 7 Alliance
Inst162Quest7 = "7. Halls of Valor: The Bear King"
Inst162Quest7_Aim = "Defeat Arthfael and Odyn in Halls of Valor."
Inst162Quest7_Location = ""
Inst162Quest7_Note = AQ_WORLDDUNGEONQUEST
Inst162Quest7_Prequest = "None"
Inst162Quest7_Folgequest = "None"
-- No Rewards for this quest

--Quest 8 Alliance
Inst162Quest8 = "8. The Brewmaster"
Inst162Quest8_Aim = "Speak to Melba in the Halls of Valor."
Inst162Quest8_Location = "Broken Temple Brewmaster (location unknown)"
Inst162Quest8_Note = "Turn this in to Melba in the Halls of Valor dungeon."
Inst162Quest8_Prequest = "None"
Inst162Quest8_Folgequest = "Odyn's Cauldron"
-- No Rewards for this quest

--Quest 9 Alliance
Inst162Quest9 = "9. Odyn's Cauldron"
Inst162Quest9_Aim = "Collect Odyn's Cauldron from the Halls of Valor."
Inst162Quest9_Location = "Melba (Halls of Valor; "..YELLOW.."??"..WHITE..")"
Inst162Quest9_Note = "Monk only quest.  Odyn's Cauldron is in the Heart of Revelry, a room with long tables.  Turn the quest in to Iron-Body Ponshu (Wandering Isle - Temple of Five Dawns; "..YELLOW.."51.4, 48.6"..WHITE..")."
Inst162Quest9_Prequest = "The Brewmaster"
Inst162Quest9_Folgequest = "Storm Brew"
Inst162Quest9FQuest = "true"
-- No Rewards for this quest

--Quest 10 Alliance
Inst162Quest10 = "10. Securing the Aegis"
Inst162Quest10_Aim = "Defeat God-King Skovald in the Halls of Valor and claim the Aegis of Aggramar."
Inst162Quest10_Location = "Havi (Stormheim - Halls of Valor; "..YELLOW.."70.2, 69.2"..WHITE..")"
Inst162Quest10_Note = "Claim the Aegis of Aggramar at the end of the dungeon at "..YELLOW.."[5]"..WHITE..".  The quest turns in inside the dungeon.  If you leave before turning it in, you will have to restart it."
Inst162Quest10_Prequest = "Stormheim's Salvation"
Inst162Quest10_Folgequest = "The Aegis of Aggramar"
Inst162Quest10PreQuest = "true"
--
Inst162Quest10name1 = "Odyn's Watchful Gaze"

--Quest 11 Alliance
Inst162Quest11 = "11. The Aegis of Aggramar"
Inst162Quest11_Aim = "Secure the Aegis of Aggramar in the Chamber of the Guardian in Dalaran."
Inst162Quest11_Location = "The Aegis of Aggramar (Halls of Valor; "..YELLOW.."[5]"..WHITE..")"
Inst162Quest11_Note = "After completing the previous quest, you will be able to start this quest at the Aegis of Aggramar.  Complete this quest in the Portrait room in the upper level of Dalaran, accessible via the teleporter in the middle of the city."
Inst162Quest11_Prequest = "Securing the Aegis"
Inst162Quest11_Folgequest = "None"
Inst162Quest11FQuest = "true"
-- Reward varies for each class

--Quest 12 Alliance
Inst162Quest12 = "12. Trigger Happy"
Inst162Quest12_Aim = "Obtain the Runestone of Vitality from Odyn in the Halls of Valor."
Inst162Quest12_Location = "Hobart Grapplehammer (Dalaran; "..YELLOW.."38.4, 25.0"..WHITE..")"
Inst162Quest12_Note = "Engineering quest.  Becomes accessible after completing other engineering quests.  Odyn is the final boss, located at "..YELLOW.."[5]"..WHITE..".  The reward teaches you a new Engineering Schematic."
Inst162Quest12_Prequest = "None"
Inst162Quest12_Folgequest = "None"
-- No Rewards for this quest

--Quest 13 Alliance
Inst162Quest13 = "13. Edict of the God-King"
Inst162Quest13_Aim = "Defeat God-King Skovald in Halls of Valor on Mythic difficulty."
Inst162Quest13_Location = "Archmage Khadgar (Dalaran - Violet Citadel; "..YELLOW.."28.8, 48.6"..WHITE..")"
Inst162Quest13_Note = "Karazhan attunement questline.  Requires Mythic or Mythic+ difficulty.  God-King Skovald is at "..YELLOW.."[4]"..WHITE.."."
Inst162Quest13_Prequest = "None"
Inst162Quest13_Folgequest = "Unwanted Evidence"
-- No Rewards for this quest

--Quest 14 Alliance
Inst162Quest14 = "14. Unwanted Evidence"
Inst162Quest14_Aim = "Bring the Fel Crystal Fragment to Archmage Khadgar in Dalaran."
Inst162Quest14_Location = "Halls of Valor; "..YELLOW.."[4]"
Inst162Quest14_Note = "Karazhan attunement questline.  Archmage Khadgar is at Dalaran - Violet Citadel; "..YELLOW.."28.8, 48.6"..WHITE.."."
Inst162Quest14_Prequest = "Edict of the God-King"
Inst162Quest14_Folgequest = "Uncovering Orders"
Inst162Quest14FQuest = "true"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst162Quest1_HORDE = Inst162Quest1
Inst162Quest1_HORDE_Aim = Inst162Quest1_Aim
Inst162Quest1_HORDE_Location = Inst162Quest1_Location
Inst162Quest1_HORDE_Note = Inst162Quest1_Note
Inst162Quest1_HORDE_Prequest = Inst162Quest1_Prequest
Inst162Quest1_HORDE_Folgequest = Inst162Quest1_Folgequest
--
Inst162Quest1name1_HORDE = Inst162Quest1name1

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst162Quest2_HORDE = Inst162Quest2
Inst162Quest2_HORDE_Aim = Inst162Quest2_Aim
Inst162Quest2_HORDE_Location = Inst162Quest2_Location
Inst162Quest2_HORDE_Note = Inst162Quest2_Note
Inst162Quest2_HORDE_Prequest = Inst162Quest2_Prequest
Inst162Quest2_HORDE_Folgequest = Inst162Quest2_Folgequest
--
Inst162Quest2name1_HORDE = Inst162Quest2name1

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst162Quest3_HORDE = Inst162Quest3
Inst162Quest3_HORDE_Aim = Inst162Quest3_Aim
Inst162Quest3_HORDE_Location = Inst162Quest3_Location
Inst162Quest3_HORDE_Note = Inst162Quest3_Note
Inst162Quest3_HORDE_Prequest = Inst162Quest3_Prequest
Inst162Quest3_HORDE_Folgequest = Inst162Quest3_Folgequest
--
Inst162Quest3name1_HORDE = Inst162Quest3name1

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst162Quest4_HORDE = Inst162Quest4
Inst162Quest4_HORDE_Aim = Inst162Quest4_Aim
Inst162Quest4_HORDE_Location = Inst162Quest4_Location
Inst162Quest4_HORDE_Note = Inst162Quest4_Note
Inst162Quest4_HORDE_Prequest = Inst162Quest4_Prequest
Inst162Quest4_HORDE_Folgequest = Inst162Quest4_Folgequest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst162Quest5_HORDE = Inst162Quest5
Inst162Quest5_HORDE_Aim = Inst162Quest5_Aim
Inst162Quest5_HORDE_Location = Inst162Quest5_Location
Inst162Quest5_HORDE_Note = Inst162Quest5_Note
Inst162Quest5_HORDE_Prequest = Inst162Quest5_Prequest
Inst162Quest5_HORDE_Folgequest = Inst162Quest5_Folgequest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst162Quest6_HORDE = Inst162Quest6
Inst162Quest6_HORDE_Aim = Inst162Quest6_Aim
Inst162Quest6_HORDE_Location = Inst162Quest6_Location
Inst162Quest6_HORDE_Note = Inst162Quest6_Note
Inst162Quest6_HORDE_Prequest = Inst162Quest6_Prequest
Inst162Quest6_HORDE_Folgequest = Inst162Quest6_Folgequest
-- No Rewards for this quest

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst162Quest7_HORDE = Inst162Quest7
Inst162Quest7_HORDE_Aim = Inst162Quest7_Aim
Inst162Quest7_HORDE_Location = Inst162Quest7_Location
Inst162Quest7_HORDE_Note = Inst162Quest7_Note
Inst162Quest7_HORDE_Prequest = Inst162Quest7_Prequest
Inst162Quest7_HORDE_Folgequest = Inst162Quest7_Folgequest
-- No Rewards for this quest

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst162Quest8_HORDE = Inst162Quest8
Inst162Quest8_HORDE_Aim = Inst162Quest8_Aim
Inst162Quest8_HORDE_Location = Inst162Quest8_Location
Inst162Quest8_HORDE_Note = Inst162Quest8_Note
Inst162Quest8_HORDE_Prequest = Inst162Quest8_Prequest
Inst162Quest8_HORDE_Folgequest = Inst162Quest8_Folgequest
-- No Rewards for this quest

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst162Quest9_HORDE = Inst162Quest9
Inst162Quest9_HORDE_Aim = Inst162Quest9_Aim
Inst162Quest9_HORDE_Location = Inst162Quest9_Location
Inst162Quest9_HORDE_Note = Inst162Quest9_Note
Inst162Quest9_HORDE_Prequest = Inst162Quest9_Prequest
Inst162Quest9_HORDE_Folgequest = Inst162Quest9_Folgequest
Inst162Quest9FQuest_HORDE = Inst162Quest9FQuest
-- No Rewards for this quest

--Quest 10 Horde  (same as Quest 10 Alliance)
Inst162Quest10_HORDE = Inst162Quest10
Inst162Quest10_HORDE_Aim = Inst162Quest10_Aim
Inst162Quest10_HORDE_Location = Inst162Quest10_Location
Inst162Quest10_HORDE_Note = Inst162Quest10_Note
Inst162Quest10_HORDE_Prequest = Inst162Quest10_Prequest
Inst162Quest10_HORDE_Folgequest = Inst162Quest10_Folgequest
Inst162Quest10PreQuest_HORDE = Inst162Quest10PreQuest
--
Inst162Quest10name1_HORDE = Inst162Quest10name1

--Quest 11 Horde  (same as Quest 11 Alliance)
Inst162Quest11_HORDE = Inst162Quest11
Inst162Quest11_HORDE_Aim = Inst162Quest11_Aim
Inst162Quest11_HORDE_Location = Inst162Quest11_Location
Inst162Quest11_HORDE_Note = Inst162Quest11_Note
Inst162Quest11_HORDE_Prequest = Inst162Quest11_Prequest
Inst162Quest11_HORDE_Folgequest = Inst162Quest11_Folgequest
Inst162Quest11FQuest_HORDE = Inst162Quest11FQuest
-- Reward varies for each class

--Quest 12 Horde  (same as Quest 12 Alliance)
Inst162Quest12_HORDE = Inst162Quest12
Inst162Quest12_HORDE_Aim = Inst162Quest12_Aim
Inst162Quest12_HORDE_Location = Inst162Quest12_Location
Inst162Quest12_HORDE_Note = Inst162Quest12_Note
Inst162Quest12_HORDE_Prequest = Inst162Quest12_Prequest
Inst162Quest12_HORDE_Folgequest = Inst162Quest12_Folgequest
-- No Rewards for this quest

--Quest 13 Horde  (same as Quest 13 Alliance)
Inst162Quest13_HORDE = Inst162Quest13
Inst162Quest13_HORDE_Aim = Inst162Quest13_Aim
Inst162Quest13_HORDE_Location = Inst162Quest13_Location
Inst162Quest13_HORDE_Note = Inst162Quest13_Note
Inst162Quest13_HORDE_Prequest = Inst162Quest13_Prequest
Inst162Quest13_HORDE_Folgequest = Inst162Quest13_Folgequest
-- No Rewards for this quest

--Quest 14 Horde  (same as Quest 14 Alliance)
Inst162Quest14_HORDE = Inst162Quest14
Inst162Quest14_HORDE_Aim = Inst162Quest14_Aim
Inst162Quest14_HORDE_Location = Inst162Quest14_Location
Inst162Quest14_HORDE_Note = Inst162Quest14_Note
Inst162Quest14_HORDE_Prequest = Inst162Quest14_Prequest
Inst162Quest14_HORDE_Folgequest = Inst162Quest14_Folgequest
Inst162Quest14FQuest_HORDE = Inst162Quest14FQuest
-- No Rewards for this quest



--------------- INST163 - Maw of Souls ---------------

Inst163Caption = "Maw of Souls"
Inst163QAA = "10 Quests"
Inst163QAH = "10 Quests"

--Quest 1 Alliance
Inst163Quest1 = "1. Maw of Souls"
Inst163Quest1_Aim = "Defeat Helya in Maw of Souls."
Inst163Quest1_Location = "Maw of Souls (Auto-accept)"
Inst163Quest1_Note = "Turn in quest to an NPC in your class hall."
Inst163Quest1_Prequest = "None"
Inst163Quest1_Folgequest = "None"
--
Inst163Quest1name1 = "Seaweed-Encrusted Satchel"

--Quest 2 Alliance
Inst163Quest2 = "2. Maw of Souls (Heroic)"
Inst163Quest2_Aim = "Defeat Helya in Maw of Souls on Heroic difficulty or higher."
Inst163Quest2_Location = "Maw of Souls (Auto-accept)"
Inst163Quest2_Note = "Turn in quest to an NPC in your class hall."
Inst163Quest2_Prequest = "None"
Inst163Quest2_Folgequest = "None"
--
Inst163Quest2name1 = "Seaweed-Encrusted Satchel"

--Quest 3 Alliance
Inst163Quest3 = "3. Maw of Souls (Mythic)"
Inst163Quest3_Aim = "Defeat Helya in Maw of Souls on Mythic difficulty."
Inst163Quest3_Location = "Maw of Souls (Auto-accept)"
Inst163Quest3_Note = "Turn in quest to an NPC in your class hall."
Inst163Quest3_Prequest = "None"
Inst163Quest3_Folgequest = "None"
--
Inst163Quest3name1 = "Seaweed-Encrusted Satchel"

--Quest 4 Alliance
Inst163Quest4 = "4. Maw of Souls: From Hell's Mouth"
Inst163Quest4_Aim = "Defeat Plaguemaw and Helya in the Maw of Souls."
Inst163Quest4_Location = ""
Inst163Quest4_Note = AQ_WORLDDUNGEONQUEST
Inst163Quest4_Prequest = "None"
Inst163Quest4_Folgequest = "None"
-- No Rewards for this quest

--Quest 5 Alliance
Inst163Quest5 = "5. Maw of Souls: Menace of the Seas"
Inst163Quest5_Aim = "Defeat Soulfiend Tagerma and Helya in the Maw of Souls."
Inst163Quest5_Location = ""
Inst163Quest5_Note = AQ_WORLDDUNGEONQUEST
Inst163Quest5_Prequest = "None"
Inst163Quest5_Folgequest = "None"
-- No Rewards for this quest

--Quest 6 Alliance
Inst163Quest6 = "6. Maw of Souls: Return of the Beast"
Inst163Quest6_Aim = "Defeat Shroudseeker and Helya in the Maw of Souls."
Inst163Quest6_Location = ""
Inst163Quest6_Note = AQ_WORLDDUNGEONQUEST
Inst163Quest6_Prequest = "None"
Inst163Quest6_Folgequest = "None"
-- No Rewards for this quest

--Quest 7 Alliance
Inst163Quest7 = "7. Message to Helya"
Inst163Quest7_Aim = "Defeat Helya inside the Maw of Souls dungeon."
Inst163Quest7_Location = "Odyn (Skyhold; "..YELLOW.."58.4, 82.8"..WHITE..")"
Inst163Quest7_Note = "Warrior quest. Part of the Class Hall questline. Helya is the final boss in Maw of Souls, located at "..YELLOW.."[3]"..WHITE.."."
Inst163Quest7_Prequest = "None"
Inst163Quest7_Folgequest = "None"
-- No Rewards for this quest

--Quest 8 Alliance
Inst163Quest8 = "8. Ymiron's Broken Blade"
Inst163Quest8_Aim = "Return to Skyhold and convince Odyn to raise King Ymiron."
Inst163Quest8_Location = "Drops from Ymiron (Maw of Souls; "..YELLOW.."[1]"..WHITE..")"
Inst163Quest8_Note = "Warrior quest. Turns in to Odyn (Skyhold; "..YELLOW.."58.4, 82.8"..WHITE..").  The reward is Ymiron as a Follower in your Class Hall."
Inst163Quest8_Prequest = "None"
Inst163Quest8_Folgequest = "None"
-- Follower reward.

--Quest 9 Alliance
Inst163Quest9 = "9. Ancient Vrykul Legends"
Inst163Quest9_Aim = "Gather a group and take an etching of the Raven's Eye Tablet on the ship of the dead, The Naglfar, in the Maw of Souls."
Inst163Quest9_Location = "Valeera Sanguinar (Dalaran - Rogue Class Hall; "..YELLOW.."40.6, 76.0"..WHITE..")"
Inst163Quest9_Note = "Rogue quest.  You can obtain the etching in the hold of the ship.  Be sure to get it before you attack the last boss, Helya, because you will not be able to go back to it after."
Inst163Quest9_Prequest = "Blood for the Wolfe"
Inst163Quest9_Folgequest = "The Raven's Eye"
Inst163Quest9PreQuest = "true"
--
-- Awards Order Resources

--Quest 10 Alliance
Inst163Quest10 = "10. Piercing the Mists"
Inst163Quest10_Aim = "Defeat Helya in the Maw of Souls dungeon, then return to Havi in Valdisdall"
Inst163Quest10_Location = "Havi (Stormheim - Valdisdall; "..YELLOW.."60.2, 50.8"..WHITE..")"
Inst163Quest10_Note = "Helya is the final boss in Maw of Souls, located at "..YELLOW.."[3]"..WHITE.."."
Inst163Quest10_Prequest = "None"
Inst163Quest10_Folgequest = "None"
-- Reward varies for each class


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst163Quest1_HORDE = Inst163Quest1
Inst163Quest1_HORDE_Aim = Inst163Quest1_Aim
Inst163Quest1_HORDE_Location = Inst163Quest1_Location
Inst163Quest1_HORDE_Note = Inst163Quest1_Note
Inst163Quest1_HORDE_Prequest = Inst163Quest1_Prequest
Inst163Quest1_HORDE_Folgequest = Inst163Quest1_Folgequest
--
Inst163Quest1name1_HORDE = Inst163Quest1name1

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst163Quest2_HORDE = Inst163Quest2
Inst163Quest2_HORDE_Aim = Inst163Quest2_Aim
Inst163Quest2_HORDE_Location = Inst163Quest2_Location
Inst163Quest2_HORDE_Note = Inst163Quest2_Note
Inst163Quest2_HORDE_Prequest = Inst163Quest2_Prequest
Inst163Quest2_HORDE_Folgequest = Inst163Quest2_Folgequest
--
Inst163Quest2name1_HORDE = Inst163Quest2name1

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst163Quest3_HORDE = Inst163Quest3
Inst163Quest3_HORDE_Aim = Inst163Quest3_Aim
Inst163Quest3_HORDE_Location = Inst163Quest3_Location
Inst163Quest3_HORDE_Note = Inst163Quest3_Note
Inst163Quest3_HORDE_Prequest = Inst163Quest3_Prequest
Inst163Quest3_HORDE_Folgequest = Inst163Quest3_Folgequest
--
Inst163Quest3name1_HORDE = Inst163Quest3name1

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst163Quest4_HORDE = Inst163Quest4
Inst163Quest4_HORDE_Aim = Inst163Quest4_Aim
Inst163Quest4_HORDE_Location = Inst163Quest4_Location
Inst163Quest4_HORDE_Note = Inst163Quest4_Note
Inst163Quest4_HORDE_Prequest = Inst163Quest4_Prequest
Inst163Quest4_HORDE_Folgequest = Inst163Quest4_Folgequest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst163Quest5_HORDE = Inst163Quest5
Inst163Quest5_HORDE_Aim = Inst163Quest5_Aim
Inst163Quest5_HORDE_Location = Inst163Quest5_Location
Inst163Quest5_HORDE_Note = Inst163Quest5_Note
Inst163Quest5_HORDE_Prequest = Inst163Quest5_Prequest
Inst163Quest5_HORDE_Folgequest = Inst163Quest5_Folgequest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst163Quest6_HORDE = Inst163Quest6
Inst163Quest6_HORDE_Aim = Inst163Quest6_Aim
Inst163Quest6_HORDE_Location = Inst163Quest6_Location
Inst163Quest6_HORDE_Note = Inst163Quest6_Note
Inst163Quest6_HORDE_Prequest = Inst163Quest6_Prequest
Inst163Quest6_HORDE_Folgequest = Inst163Quest6_Folgequest
-- No Rewards for this quest

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst163Quest7_HORDE = Inst163Quest7
Inst163Quest7_HORDE_Aim = Inst163Quest7_Aim
Inst163Quest7_HORDE_Location = Inst163Quest7_Location
Inst163Quest7_HORDE_Note = Inst163Quest7_Note
Inst163Quest7_HORDE_Prequest = Inst163Quest7_Prequest
Inst163Quest7_HORDE_Folgequest = Inst163Quest7_Folgequest
-- No Rewards for this quest

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst163Quest8_HORDE = Inst163Quest8
Inst163Quest8_HORDE_Aim = Inst163Quest8_Aim
Inst163Quest8_HORDE_Location = Inst163Quest8_Location
Inst163Quest8_HORDE_Note = Inst163Quest8_Note
Inst163Quest8_HORDE_Prequest = Inst163Quest8_Prequest
Inst163Quest8_HORDE_Folgequest = Inst163Quest8_Folgequest
-- No Rewards for this quest

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst163Quest9_HORDE = Inst163Quest9
Inst163Quest9_HORDE_Aim = Inst163Quest9_Aim
Inst163Quest9_HORDE_Location = Inst163Quest9_Location
Inst163Quest9_HORDE_Note = Inst163Quest9_Note
Inst163Quest9_HORDE_Prequest = Inst163Quest9_Prequest
Inst163Quest9_HORDE_Folgequest = Inst163Quest9_Folgequest
Inst163Quest9PreQuest_HORDE = Inst163Quest9PreQuest
--
-- Awards Order Resources

--Quest 10 Horde  (same as Quest 10 Alliance)
Inst163Quest10_HORDE = Inst163Quest10
Inst163Quest10_HORDE_Aim = Inst163Quest10_Aim
Inst163Quest10_HORDE_Location = Inst163Quest10_Location
Inst163Quest10_HORDE_Note = Inst163Quest10_Note
Inst163Quest10_HORDE_Prequest = Inst163Quest10_Prequest
Inst163Quest10_HORDE_Folgequest = Inst163Quest10_Folgequest
-- Reward varies for each class



--------------- INST164 - Neltharion's Lair ---------------

Inst164Caption = "Neltharion's Lair"
Inst164QAA = "8 Quests"
Inst164QAH = "8 Quests"

--Quest 1 Alliance
Inst164Quest1 = "1. Neltharion's Lair"
Inst164Quest1_Aim = "Defeat Dargrul in Neltharion's Lair."
Inst164Quest1_Location = "Neltharion's Lair (Auto-accept)"
Inst164Quest1_Note = "Turn in quest to an NPC in your class hall."
Inst164Quest1_Prequest = "None"
Inst164Quest1_Folgequest = "None"
--
Inst164Quest1name1 = "Cache of the Black Dragon"

--Quest 2 Alliance
Inst164Quest2 = "2. Neltharion's Lair (Heroic)"
Inst164Quest2_Aim = "Defeat Dargrul in Neltharion's Lair on Heroic difficulty or higher."
Inst164Quest2_Location = "Neltharion's Lair (Auto-accept)"
Inst164Quest2_Note = "Turn in quest to an NPC in your class hall."
Inst164Quest2_Prequest = "None"
Inst164Quest2_Folgequest = "None"
--
Inst164Quest2name1 = "Cache of the Black Dragon"

--Quest 3 Alliance
Inst164Quest3 = "3. Neltharion's Lair (Mythic)"
Inst164Quest3_Aim = "Defeat Dargrul in Neltharion's Lair on Mythic difficulty."
Inst164Quest3_Location = "Neltharion's Lair (Auto-accept)"
Inst164Quest3_Note = "Turn in quest to an NPC in your class hall."
Inst164Quest3_Prequest = "None"
Inst164Quest3_Folgequest = "None"
--
Inst164Quest3name1 = "Cache of the Black Dragon"

--Quest 4 Alliance
Inst164Quest4 = "4. Neltharion's Lair: Blighted Bat"
Inst164Quest4_Aim = "Defeat Ragoul and Dargrul the Underking slain in the Maw of Souls."
Inst164Quest4_Location = ""
Inst164Quest4_Note = AQ_WORLDDUNGEONQUEST
Inst164Quest4_Prequest = "None"
Inst164Quest4_Folgequest = "None"
-- No Rewards for this quest

--Quest 5 Alliance
Inst164Quest5 = "5. Neltharion's Lair: Stonedark Slaves"
Inst164Quest5_Aim = "Kill 5 Understone Lashers and defeat Dargrul the Underking slain in the Maw of Souls."
Inst164Quest5_Location = ""
Inst164Quest5_Note = AQ_WORLDDUNGEONQUEST
Inst164Quest5_Prequest = "None"
Inst164Quest5_Folgequest = "None"
-- No Rewards for this quest

--Quest 6 Alliance
Inst164Quest6 = "6. Neltharion's Lair"
Inst164Quest6_Aim = "Recover the Hammer of Khaz'goroth."
Inst164Quest6_Location = "Mayla Highmountain (Highmountain - Thunder Totem; "..YELLOW.."52.5, 65.8"..WHITE..")"
Inst164Quest6_Note = "The Hammer of Khaz'goroth is after the final boss, at "..YELLOW.."[4]"..WHITE.."."
Inst164Quest6_Prequest = "None"
Inst164Quest6_Folgequest = "The Hammer of Khaz'goroth"
--
Inst164Quest6name1 = "Underking's Fist"

--Quest 7 Alliance
Inst164Quest7 = "7. The Hammer of Khaz'goroth"
Inst164Quest7_Aim = "Use the central teleporter in Dalaran and then place the Hammer of Khaz'goroth in Aegwynn's Gallery."
Inst164Quest7_Location = "Hammer of Khaz'goroth (Neltharion's Lair; "..YELLOW.."[4]"..WHITE..")"
Inst164Quest7_Note = "Complete this quest in the Portrait room in the upper level of Dalaran, accessible via the teleporter in the middle of the city."
Inst164Quest7_Prequest = "Neltharion's Lair"
Inst164Quest7_Folgequest = "None"
Inst164Quest7FQuest = "true"
-- Reward varies for each class

--Quest 8 Alliance
Inst164Quest8 = "8. Misdirected"
Inst164Quest8_Aim = "Go to Neltharion's Lair and recover the Ancient Highmountain Artifact."
Inst164Quest8_Location = "Lessah Moonwater (Highmountain - Thunder Totem; "..YELLOW.."45.8, 44.4"..WHITE..")"
Inst164Quest8_Note = "Archaeology quest. The artifact is in the room with the last boss at "..YELLOW.."[4]"..WHITE.."."
Inst164Quest8_Prequest = "History of Highmountain -> Surveying Student"
Inst164Quest8_Folgequest = "None"
Inst164Quest8PreQuest = "true"
Inst164Quest8FQuest = "true"
--
Inst164Quest8name1 = "Spear of Rethu"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst164Quest1_HORDE = Inst164Quest1
Inst164Quest1_HORDE_Aim = Inst164Quest1_Aim
Inst164Quest1_HORDE_Location = Inst164Quest1_Location
Inst164Quest1_HORDE_Note = Inst164Quest1_Note
Inst164Quest1_HORDE_Prequest = Inst164Quest1_Prequest
Inst164Quest1_HORDE_Folgequest = Inst164Quest1_Folgequest
--
Inst164Quest1name1_HORDE = Inst164Quest1name1

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst164Quest2_HORDE = Inst164Quest2
Inst164Quest2_HORDE_Aim = Inst164Quest2_Aim
Inst164Quest2_HORDE_Location = Inst164Quest2_Location
Inst164Quest2_HORDE_Note = Inst164Quest2_Note
Inst164Quest2_HORDE_Prequest = Inst164Quest2_Prequest
Inst164Quest2_HORDE_Folgequest = Inst164Quest2_Folgequest
--
Inst164Quest2name1_HORDE = Inst164Quest2name1

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst164Quest3_HORDE = Inst164Quest3
Inst164Quest3_HORDE_Aim = Inst164Quest3_Aim
Inst164Quest3_HORDE_Location = Inst164Quest3_Location
Inst164Quest3_HORDE_Note = Inst164Quest3_Note
Inst164Quest3_HORDE_Prequest = Inst164Quest3_Prequest
Inst164Quest3_HORDE_Folgequest = Inst164Quest3_Folgequest
--
Inst164Quest3name1_HORDE = Inst164Quest3name1

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst164Quest4_HORDE = Inst164Quest4
Inst164Quest4_HORDE_Aim = Inst164Quest4_Aim
Inst164Quest4_HORDE_Location = Inst164Quest4_Location
Inst164Quest4_HORDE_Note = Inst164Quest4_Note
Inst164Quest4_HORDE_Prequest = Inst164Quest4_Prequest
Inst164Quest4_HORDE_Folgequest = Inst164Quest4_Folgequest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst164Quest5_HORDE = Inst164Quest5
Inst164Quest5_HORDE_Aim = Inst164Quest5_Aim
Inst164Quest5_HORDE_Location = Inst164Quest5_Location
Inst164Quest5_HORDE_Note = Inst164Quest5_Note
Inst164Quest5_HORDE_Prequest = Inst164Quest5_Prequest
Inst164Quest5_HORDE_Folgequest = Inst164Quest5_Folgequest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst164Quest6_HORDE = Inst164Quest6
Inst164Quest6_HORDE_Aim = Inst164Quest6_Aim
Inst164Quest6_HORDE_Location = Inst164Quest6_Location
Inst164Quest6_HORDE_Note = Inst164Quest6_Note
Inst164Quest6_HORDE_Prequest = Inst164Quest6_Prequest
Inst164Quest6_HORDE_Folgequest = Inst164Quest6_Folgequest
--
Inst164Quest6name1_HORDE = Inst164Quest6name1

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst164Quest7_HORDE = Inst164Quest7
Inst164Quest7_HORDE_Aim = Inst164Quest7_Aim
Inst164Quest7_HORDE_Location = Inst164Quest7_Location
Inst164Quest7_HORDE_Note = Inst164Quest7_Note
Inst164Quest7_HORDE_Prequest = Inst164Quest7_Prequest
Inst164Quest7_HORDE_Folgequest = Inst164Quest7_Folgequest
Inst164Quest7FQuest_HORDE = Inst164Quest7FQuest
-- Reward varies for each class

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst164Quest8_HORDE = Inst164Quest8
Inst164Quest8_HORDE_Aim = Inst164Quest8_Aim
Inst164Quest8_HORDE_Location = Inst164Quest8_Location
Inst164Quest8_HORDE_Note = Inst164Quest8_Note
Inst164Quest8_HORDE_Prequest = Inst164Quest8_Prequest
Inst164Quest8_HORDE_Folgequest = Inst164Quest8_Folgequest
Inst164Quest8PreQuest_HORDE = Inst164Quest8PreQuest
--
Inst164Quest8name1_HORDE = Inst164Quest8name1



--------------- INST165 - The Arcway ---------------

Inst165Caption = "The Arcway"
Inst165QAA = "6 Quests"
Inst165QAH = "6 Quests"

--Quest 1 Alliance
Inst165Quest1 = "1. The Arcway (Mythic)"
Inst165Quest1_Aim = "Defeat Advisor Vandros in The Arcway on Mythic difficulty."
Inst165Quest1_Location = "The Arcway (Auto-accept)"
Inst165Quest1_Note = "Turn in quest to an NPC in your class hall."
Inst165Quest1_Prequest = "None"
Inst165Quest1_Folgequest = "None"
--
Inst165Quest1name1 = "Unmarked Suramar Vault Crate"

--Quest 2 Alliance
Inst165Quest2 = "2. The Arcway: Clogged Drain"
Inst165Quest2_Aim = "Defeat Sludge Face and Advisor Vandros in The Arcway."
Inst165Quest2_Location = ""
Inst165Quest2_Note = AQ_WORLDDUNGEONQUEST
Inst165Quest2_Prequest = "None"
Inst165Quest2_Folgequest = "None"
-- No Rewards for this quest

--Quest 3 Alliance
Inst165Quest3 = "3. The Arcway: Silver Serpent"
Inst165Quest3_Aim = "Defeat Silver Serpent and Advisor Vandros in The Arcway."
Inst165Quest3_Location = ""
Inst165Quest3_Note = AQ_WORLDDUNGEONQUEST
Inst165Quest3_Prequest = "None"
Inst165Quest3_Folgequest = "None"
-- No Rewards for this quest

--Quest 4 Alliance
Inst165Quest4 = "4. The Arcway: Wandering Plague"
Inst165Quest4_Aim = "Defeat The Rat King and Advisor Vandros in The Arcway."
Inst165Quest4_Location = ""
Inst165Quest4_Note = AQ_WORLDDUNGEONQUEST
Inst165Quest4_Prequest = "None"
Inst165Quest4_Folgequest = "None"
-- No Rewards for this quest

--Quest 5 Alliance
Inst165Quest5 = "5. Opening the Arcway"
Inst165Quest5_Aim = "Slay Advisor Vandros in the Arcway."
Inst165Quest5_Location = "First Arcanist Thalyssra (Suramar - Shal'aran; "..YELLOW.."36.8, 46.6"..WHITE..")"
Inst165Quest5_Note = "This quest will become available after reaching at least Honored and 8000 reputation with The Nightfallen and complete the questline up to Ly'leth's Champion.  It requires Mythic difficulty.\n\nAdvisor Vandros is the final boss, at "..YELLOW.."[5]"..WHITE.."."
Inst165Quest5_Prequest = "Ly'leth's Champion"
Inst165Quest5_Folgequest = "None"
Inst165Quest5PreQuest = "true"
--
Inst165Quest5name1 = "Tome of Dimensional Awareness"

--Quest 6 Alliance
Inst165Quest6 = "6. Long Buried Knowledge"
Inst165Quest6_Aim = "Acquire the Suramar Leyline Map from the Arcway."
Inst165Quest6_Location = "Arcanist Valtrois (Suramar - Shal'aran; "..YELLOW.."37.0, 46.2"..WHITE..")"
Inst165Quest6_Note = "This quest will become available after reaching at least Honored and 8000 reputation with The Nightfallen and complete the questline up to Ly'leth's Champion.  It requires Mythic difficulty."
Inst165Quest6_Prequest = "Ly'leth's Champion"
Inst165Quest6_Folgequest = "None"
Inst165Quest6PreQuest = "true"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst165Quest1_HORDE = Inst165Quest1
Inst165Quest1_HORDE_Aim = Inst165Quest1_Aim
Inst165Quest1_HORDE_Location = Inst165Quest1_Location
Inst165Quest1_HORDE_Note = Inst165Quest1_Note
Inst165Quest1_HORDE_Prequest = Inst165Quest1_Prequest
Inst165Quest1_HORDE_Folgequest = Inst165Quest1_Folgequest
--
Inst165Quest1name1_HORDE = Inst165Quest1name1

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst165Quest2_HORDE = Inst165Quest2
Inst165Quest2_HORDE_Aim = Inst165Quest2_Aim
Inst165Quest2_HORDE_Location = Inst165Quest2_Location
Inst165Quest2_HORDE_Note = Inst165Quest2_Note
Inst165Quest2_HORDE_Prequest = Inst165Quest2_Prequest
Inst165Quest2_HORDE_Folgequest = Inst165Quest2_Folgequest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst165Quest3_HORDE = Inst165Quest3
Inst165Quest3_HORDE_Aim = Inst165Quest3_Aim
Inst165Quest3_HORDE_Location = Inst165Quest3_Location
Inst165Quest3_HORDE_Note = Inst165Quest3_Note
Inst165Quest3_HORDE_Prequest = Inst165Quest3_Prequest
Inst165Quest3_HORDE_Folgequest = Inst165Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst165Quest4_HORDE = Inst165Quest4
Inst165Quest4_HORDE_Aim = Inst165Quest4_Aim
Inst165Quest4_HORDE_Location = Inst165Quest4_Location
Inst165Quest4_HORDE_Note = Inst165Quest4_Note
Inst165Quest4_HORDE_Prequest = Inst165Quest4_Prequest
Inst165Quest4_HORDE_Folgequest = Inst165Quest4_Folgequest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst165Quest5_HORDE = Inst165Quest5
Inst165Quest5_HORDE_Aim = Inst165Quest5_Aim
Inst165Quest5_HORDE_Location = Inst165Quest5_Location
Inst165Quest5_HORDE_Note = Inst165Quest5_Note
Inst165Quest5_HORDE_Prequest = Inst165Quest5_Prequest
Inst165Quest5_HORDE_Folgequest = Inst165Quest5_Folgequest
Inst165Quest5PreQuest_HORDE = Inst165Quest5PreQuest
--
Inst165Quest5name1_HORDE = Inst165Quest5name1

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst165Quest6_HORDE = Inst165Quest6
Inst165Quest6_HORDE_Aim = Inst165Quest6_Aim
Inst165Quest6_HORDE_Location = Inst165Quest6_Location
Inst165Quest6_HORDE_Note = Inst165Quest6_Note
Inst165Quest6_HORDE_Prequest = Inst165Quest6_Prequest
Inst165Quest6_HORDE_Folgequest = Inst165Quest6_Folgequest
Inst165Quest6PreQuest_HORDE = Inst165Quest6PreQuest
-- No Rewards for this quest



--------------- INST166 - Vault of the Wardens ---------------

Inst166Caption = "Vault of the Wardens"
Inst166QAA = "12 Quests"
Inst166QAH = "12 Quests"

--Quest 1 Alliance
Inst166Quest1 = "1. Vault of the Wardens"
Inst166Quest1_Aim = "Defeat Cordana Felsong in Vault of the Wardens."
Inst166Quest1_Location = "Vault of the Wardens (Auto-accept)"
Inst166Quest1_Note = "Turn in quest to an NPC in your class hall."
Inst166Quest1_Prequest = "None"
Inst166Quest1_Folgequest = "None"
--
Inst166Quest1name1 = "Bag of Confiscated Materials"

--Quest 2 Alliance
Inst166Quest2 = "2. Vault of the Wardens (Heroic)"
Inst166Quest2_Aim = "Defeat Cordana Felsong in Vault of the Wardens on Heroic difficulty or higher."
Inst166Quest2_Location = "Vault of the Wardens (Auto-accept)"
Inst166Quest2_Note = "Turn in quest to an NPC in your class hall."
Inst166Quest2_Prequest = "None"
Inst166Quest2_Folgequest = "None"
--
Inst166Quest2name1 = "Bag of Confiscated Materials"

--Quest 3 Alliance
Inst166Quest3 = "3. Vault of the Wardens (Mythic)"
Inst166Quest3_Aim = "Defeat Cordana Felsong in Vault of the Wardens on Mythic difficulty."
Inst166Quest3_Location = "Vault of the Wardens (Auto-accept)"
Inst166Quest3_Note = "Turn in quest to an NPC in your class hall."
Inst166Quest3_Prequest = "None"
Inst166Quest3_Folgequest = "None"
--
Inst166Quest3name1 = "Bag of Confiscated Materials"

--Quest 4 Alliance
Inst166Quest4 = "4. Vault of the Wardens: How'd He Get Up There?"
Inst166Quest4_Aim = "Defeat the Construct and Cordana in the Vault of the Wardens."
Inst166Quest4_Location = ""
Inst166Quest4_Note = AQ_WORLDDUNGEONQUEST
Inst166Quest4_Prequest = "None"
Inst166Quest4_Folgequest = "None"
-- No Rewards for this quest

--Quest 5 Alliance
Inst166Quest5 = "5. Fel-Ravaged Tome"
Inst166Quest5_Aim = "Bring the Fel-Ravaged Tome to Robert Newhearth in Dalaran."
Inst166Quest5_Location = "Fel-Ravaged Tome (Vault of the Wardens - Vault of the Betrayer; "..YELLOW.."[5]"..WHITE..")"
Inst166Quest5_Note = "The Fel-Ravaged Tome is in the caves on the way to the final boss.  The quest turns into Robert Newhearth at Dalaran - The Violet Citadel ("..YELLOW.."25.6, 45.0"..WHITE..")."
Inst166Quest5_Prequest = "None"
Inst166Quest5_Folgequest = "None"
-- No Rewards for this quest

--Quest 6 Alliance
Inst166Quest6 = "6. Demon's Bile"
Inst166Quest6_Aim = "Craft a Skaggldrynk, then go to the Vault of the Wardens and bathe the crucible in the bile of Grimoira."
Inst166Quest6_Location = "Deucus Valdera (Dalaran; "..YELLOW.."41.6, 32.8"..WHITE..")"
Inst166Quest6_Note = "Alchemy quest.  Take a Skaggldrynk potion with you.  Its made by an Alchemist.  Kill the first two bosses and use the potion after Inquisitor Tormentorum "..YELLOW.."[2]"..WHITE.." near the door.  The door will open and you can kill Grimoira."
Inst166Quest6_Prequest = "Lining the Crucible"
Inst166Quest6_Folgequest = "None"
Inst166Quest6PreQuest = "true"
-- No Rewards for this quest

--Quest 7 Alliance
Inst166Quest7 = "7. Bendy Glass Tubes"
Inst166Quest7_Aim = "Bring the Bendy Glass Tubes to Deucus Valdera in Dalaran."
Inst166Quest7_Location = "Grimoira (Vault of the Wardens; "..YELLOW.."[2]"..WHITE..")"
Inst166Quest7_Note = "Alchemy quest.  After killing Grimoira in the secret area (detailed in the previous quest, Demon's Bile), you will be able to obtain this quest from her.  It turns in to Deucus Valdera in Dalaran ("..YELLOW.."41.4, 32.8"..WHITE..")."
Inst166Quest7_Prequest = "None"
Inst166Quest7_Folgequest = "None"
-- No Rewards for this quest

--Quest 8 Alliance
Inst166Quest8 = "8. Vault of the Wardens: Startup Sequence"
Inst166Quest8_Aim = "Complete the startup sequence and defeat Cordana."
Inst166Quest8_Location = ""
Inst166Quest8_Note = AQ_WORLDDUNGEONQUEST
Inst166Quest8_Prequest = "None"
Inst166Quest8_Folgequest = "None"
-- No Rewards for this quest

--Quest 9 Alliance
Inst166Quest9 = "9. More Than Just A Food Vendor"
Inst166Quest9_Aim = "Eradicate 15 demons and give your conjured food to 10 starving prisoners."
Inst166Quest9_Location = "Kalecgos (Suramar; "..YELLOW.."34.2, 83.6"..WHITE..")"
Inst166Quest9_Note = "Mage quest.  Use your Conjure Food ability to make food to feed the starving prisoners.  Use Kalec's Image Crystal to summon Kalecgos and turn in the quest."
Inst166Quest9_Prequest = "None"
Inst166Quest9_Folgequest = "None"
-- No Rewards for this quest

--Quest 10 Alliance
Inst166Quest10 = "10. The Enemy of My Enemy..."
Inst166Quest10_Aim = "Find Millhouse Manastorm."
Inst166Quest10_Location = ""
Inst166Quest10_Note = "Mage quest.  Questline begins with Final Exit."
Inst166Quest10_Prequest = "Final Exit -> Not A Toothless Dragon"
Inst166Quest10_Folgequest = "None"
Inst166Quest10PreQuest = "true"
-- No Rewards for this quest

--Quest 11 Alliance
Inst166Quest11 = "11. Unleashing Judgment"
Inst166Quest11_Aim = "Use your built up Unstable Holy Energy to destroy the Surge Needles in Coldarra."
Inst166Quest11_Location = "Image of Kalec (Dalaran; "..YELLOW..""..WHITE..")"
Inst166Quest11_Note = "Priest Quest.  Missing information for this quest."
Inst166Quest11_Prequest = "The Light's Wrath -> Harnessing the Holy Fire"
Inst166Quest11_Folgequest = "The Nexus Vault"
Inst166Quest11PreQuest = "true"
-- No Rewards for this quest

--Quest 12 Alliance
Inst166Quest12 = "12. Uncovering Orders"
Inst166Quest12_Aim = "Recover the Fragment of Spite from Blackrook Hold (Mythic), the Fragment of Power from Violet Hold (Mythic), and the Fragment of Torment from Vault of the Wardens (Mythic)."
Inst166Quest12_Location = "Archmage Khadgar (Dalaran - Violet Citadel; "..YELLOW.."28.8, 48.6"..WHITE..")"
Inst166Quest12_Note = "Karazhan attunement questline.  Can only be completed on Mythic or Mythic+ difficulty."
Inst166Quest12_Prequest = "Edict of the God-King -> Unwanted Evidence"
Inst166Quest12_Folgequest = "Aura of Uncertainty"
Inst166Quest12PreQuest = "true"
--
Inst166Quest12name1 = "Demonic Command Shards"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst166Quest1_HORDE = Inst166Quest1
Inst166Quest1_HORDE_Aim = Inst166Quest1_Aim
Inst166Quest1_HORDE_Location = Inst166Quest1_Location
Inst166Quest1_HORDE_Note = Inst166Quest1_Note
Inst166Quest1_HORDE_Prequest = Inst166Quest1_Prequest
Inst166Quest1_HORDE_Folgequest = Inst166Quest1_Folgequest
--
Inst166Quest1name1_HORDE = Inst166Quest1name1

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst166Quest2_HORDE = Inst166Quest2
Inst166Quest2_HORDE_Aim = Inst166Quest2_Aim
Inst166Quest2_HORDE_Location = Inst166Quest2_Location
Inst166Quest2_HORDE_Note = Inst166Quest2_Note
Inst166Quest2_HORDE_Prequest = Inst166Quest2_Prequest
Inst166Quest2_HORDE_Folgequest = Inst166Quest2_Folgequest
--
Inst166Quest2name1_HORDE = Inst166Quest2name1

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst166Quest3_HORDE = Inst166Quest3
Inst166Quest3_HORDE_Aim = Inst166Quest3_Aim
Inst166Quest3_HORDE_Location = Inst166Quest3_Location
Inst166Quest3_HORDE_Note = Inst166Quest3_Note
Inst166Quest3_HORDE_Prequest = Inst166Quest3_Prequest
Inst166Quest3_HORDE_Folgequest = Inst166Quest3_Folgequest
--
Inst166Quest3name1_HORDE = Inst166Quest3name1

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst166Quest4_HORDE = Inst166Quest4
Inst166Quest4_HORDE_Aim = Inst166Quest4_Aim
Inst166Quest4_HORDE_Location = Inst166Quest4_Location
Inst166Quest4_HORDE_Note = Inst166Quest4_Note
Inst166Quest4_HORDE_Prequest = Inst166Quest4_Prequest
Inst166Quest4_HORDE_Folgequest = Inst166Quest4_Folgequest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst166Quest5_HORDE = Inst166Quest5
Inst166Quest5_HORDE_Aim = Inst166Quest5_Aim
Inst166Quest5_HORDE_Location = Inst166Quest5_Location
Inst166Quest5_HORDE_Note = Inst166Quest5_Note
Inst166Quest5_HORDE_Prequest = Inst166Quest5_Prequest
Inst166Quest5_HORDE_Folgequest = Inst166Quest5_Folgequest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst166Quest6_HORDE = Inst166Quest6
Inst166Quest6_HORDE_Aim = Inst166Quest6_Aim
Inst166Quest6_HORDE_Location = Inst166Quest6_Location
Inst166Quest6_HORDE_Note = Inst166Quest6_Note
Inst166Quest6_HORDE_Prequest = Inst166Quest6_Prequest
Inst166Quest6_HORDE_Folgequest = Inst166Quest6_Folgequest
Inst166Quest6PreQuest_HORDE = Inst166Quest6PreQuest
-- No Rewards for this quest

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst166Quest7_HORDE = Inst166Quest7
Inst166Quest7_HORDE_Aim = Inst166Quest7_Aim
Inst166Quest7_HORDE_Location = Inst166Quest7_Location
Inst166Quest7_HORDE_Note = Inst166Quest7_Note
Inst166Quest7_HORDE_Prequest = Inst166Quest7_Prequest
Inst166Quest7_HORDE_Folgequest = Inst166Quest7_Folgequest
-- No Rewards for this quest

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst166Quest8_HORDE = Inst166Quest8
Inst166Quest8_HORDE_Aim = Inst166Quest8_Aim
Inst166Quest8_HORDE_Location = Inst166Quest8_Location
Inst166Quest8_HORDE_Note = Inst166Quest8_Note
Inst166Quest8_HORDE_Prequest = Inst166Quest8_Prequest
Inst166Quest8_HORDE_Folgequest = Inst166Quest8_Folgequest
-- No Rewards for this quest

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst166Quest9_HORDE = Inst166Quest9
Inst166Quest9_HORDE_Aim = Inst166Quest9_Aim
Inst166Quest9_HORDE_Location = Inst166Quest9_Location
Inst166Quest9_HORDE_Note = Inst166Quest9_Note
Inst166Quest9_HORDE_Prequest = Inst166Quest9_Prequest
Inst166Quest9_HORDE_Folgequest = Inst166Quest9_Folgequest
-- No Rewards for this quest

--Quest 10 Horde  (same as Quest 10 Alliance)
Inst166Quest10_HORDE = Inst166Quest10
Inst166Quest10_HORDE_Aim = Inst166Quest10_Aim
Inst166Quest10_HORDE_Location = Inst166Quest10_Location
Inst166Quest10_HORDE_Note = Inst166Quest10_Note
Inst166Quest10_HORDE_Prequest = Inst166Quest10_Prequest
Inst166Quest10_HORDE_Folgequest = Inst166Quest10_Folgequest
Inst166Quest10PreQuest_HORDE = Inst166Quest10PreQuest
-- No Rewards for this quest

--Quest 11 Horde  (same as Quest 11 Alliance)
Inst166Quest11_HORDE = Inst166Quest11
Inst166Quest11_HORDE_Aim = Inst166Quest11_Aim
Inst166Quest11_HORDE_Location = Inst166Quest11_Location
Inst166Quest11_HORDE_Note = Inst166Quest11_Note
Inst166Quest11_HORDE_Prequest = Inst166Quest11_Prequest
Inst166Quest11_HORDE_Folgequest = Inst166Quest11_Folgequest
Inst166Quest11PreQuest_HORDE = Inst166Quest11PreQuest
-- No Rewards for this quest

--Quest 12 Horde  (same as Quest 12 Alliance)
Inst166Quest12_HORDE = Inst166Quest12
Inst166Quest12_HORDE_Aim = Inst166Quest12_Aim
Inst166Quest12_HORDE_Location = Inst166Quest12_Location
Inst166Quest12_HORDE_Note = Inst166Quest12_Note
Inst166Quest12_HORDE_Prequest = Inst166Quest12_Prequest
Inst166Quest12_HORDE_Folgequest = Inst166Quest12_Folgequest
Inst166Quest12PreQuest_HORDE = Inst166Quest12PreQuest
--
Inst166Quest12name1_HORDE = Inst166Quest12name1



--------------- INST167 - The Emerald Nightmare ---------------

Inst167Caption = "The Emerald Nightmare"
Inst167QAA = "4 Quests"
Inst167QAH = "4 Quests"

--Quest 1 Alliance
Inst167Quest1 = "1. Piercing the Veil (Normal)"
Inst167Quest1_Aim = "Collect 4 Essences of Clarity from Cenarius in The Emerald Nightmare on Normal difficulty."
Inst167Quest1_Location = "Malfurion Stormrage (Emerald Nightmare; "..GREEN.."[1']"..WHITE..")"
Inst167Quest1_Note = "Normal difficulty.  Defeat Cenarius at "..YELLOW.."[6]"..WHITE.." to collect an Essence of Clarity.  After collecting 4, turn them in to Malfurion to give you the ability to skip the earlier bosses and go straight to Cenarius."
Inst167Quest1_Prequest = "None"
Inst167Quest1_Folgequest = "None"
-- No Rewards for this quest

--Quest 2 Alliance
Inst167Quest2 = "2. Piercing the Veil (Heroic)"
Inst167Quest2_Aim = "Collect 4 Essences of Clarity from Cenarius in The Emerald Nightmare on Heroic difficulty."
Inst167Quest2_Location = "Malfurion Stormrage (Emerald Nightmare; "..GREEN.."[1']"..WHITE..")"
Inst167Quest2_Note = "Heroic difficulty.  Defeat Cenarius at "..YELLOW.."[6]"..WHITE.." to collect an Essence of Clarity.  After collecting 4, turn them in to Malfurion to give you the ability to skip the earlier bosses and go straight to Cenarius."
Inst167Quest2_Prequest = "None"
Inst167Quest2_Folgequest = "None"
-- No Rewards for this quest

--Quest 3 Alliance
Inst167Quest3 = "3. Piercing the Veil (Mythic)"
Inst167Quest3_Aim = "Collect 4 Essences of Clarity from Cenarius in The Emerald Nightmare on Mythic difficulty."
Inst167Quest3_Location = "Malfurion Stormrage (Emerald Nightmare; "..GREEN.."[1']"..WHITE..")"
Inst167Quest3_Note = "Mythic difficulty.  Defeat Cenarius at "..YELLOW.."[6]"..WHITE.." to collect an Essence of Clarity.  After collecting 4, turn them in to Malfurion to give you the ability to skip the earlier bosses and go straight to Cenarius."
Inst167Quest3_Prequest = "None"
Inst167Quest3_Folgequest = "None"
-- No Rewards for this quest

--Quest 4 Alliance
Inst167Quest4 = "4. The Stuff of Dreams"
Inst167Quest4_Aim = "Collect Purified Life Essence from the Emerald Dream, hidden inside the Emerald Nightmare Raid."
Inst167Quest4_Location = "Valewalker Farodin (Suramar; "..YELLOW.."36.8, 46.6"..WHITE..")"
Inst167Quest4_Note = "The Purified Life Essence will drop from Xavius at "..YELLOW.."[7]"..WHITE..".  Must be at least 7000 points into Revered with The Nightfallen to obtain this quest."
Inst167Quest4_Prequest = "None"
Inst167Quest4_Folgequest = "None"
--
Inst167Quest4name1 = "Dream Tear"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst167Quest1_HORDE = Inst167Quest1
Inst167Quest1_HORDE_Aim = Inst167Quest1_Aim
Inst167Quest1_HORDE_Location = Inst167Quest1_Location
Inst167Quest1_HORDE_Note = Inst167Quest1_Note
Inst167Quest1_HORDE_Prequest = Inst167Quest1_Prequest
Inst167Quest1_HORDE_Folgequest = Inst167Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst167Quest2_HORDE = Inst167Quest2
Inst167Quest2_HORDE_Aim = Inst167Quest2_Aim
Inst167Quest2_HORDE_Location = Inst167Quest2_Location
Inst167Quest2_HORDE_Note = Inst167Quest2_Note
Inst167Quest2_HORDE_Prequest = Inst167Quest2_Prequest
Inst167Quest2_HORDE_Folgequest = Inst167Quest2_Folgequest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst167Quest3_HORDE = Inst167Quest3
Inst167Quest3_HORDE_Aim = Inst167Quest3_Aim
Inst167Quest3_HORDE_Location = Inst167Quest3_Location
Inst167Quest3_HORDE_Note = Inst167Quest3_Note
Inst167Quest3_HORDE_Prequest = Inst167Quest3_Prequest
Inst167Quest3_HORDE_Folgequest = Inst167Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst167Quest4_HORDE = Inst167Quest4
Inst167Quest4_HORDE_Aim = Inst167Quest4_Aim
Inst167Quest4_HORDE_Location = Inst167Quest4_Location
Inst167Quest4_HORDE_Note = Inst167Quest4_Note
Inst167Quest4_HORDE_Prequest = Inst167Quest4_Prequest
Inst167Quest4_HORDE_Folgequest = Inst167Quest4_Folgequest
--
Inst167Quest4name1_HORDE = Inst167Quest4name1



--------------- INST168 - The Nighthold ---------------

Inst168Caption = "The Nighthold"
Inst168QAA = "No Quests"
Inst168QAH = "No Quests"






--------------- INST169 - Karazhan (Legion) ---------------

Inst169Caption = "Karazhan"
Inst169QAA = "9 Quests"
Inst169QAH = "9 Quests"

--Quest 1 Alliance
Inst169Quest1 = "1. In the Eye of the Beholder"
Inst169Quest1_Aim = "Defeat Viz'aduum the Watcher in Karazhan."
Inst169Quest1_Location = "Archmage Khadgar (Deadwind Pass - Karazhan; "..YELLOW.."47.0, 75.4"..WHITE..")"
Inst169Quest1_Note = "Viz'aduum the Watcher is at "..YELLOW.."[10]"..WHITE..".  Archmage Khadgar will appear after defeating him to complete the quest."
Inst169Quest1_Prequest = "None"
Inst169Quest1_Folgequest = "None"
--
Inst169Quest1name1 = "Viz'aduum's Eye"

--Quest 2 Alliance
Inst169Quest2 = "2. Fragments of the Past"
Inst169Quest2_Aim = "Collect the Soul Fragments from the Guest Chambers, Banquet Hall, Servant Quarters, Opera Hall and the Menagerie inside Karazhan."
Inst169Quest2_Location = "Archmage Khadgar (Deadwind Pass - Karazhan; "..YELLOW.."47.0, 75.4"..WHITE..")"
Inst169Quest2_Note = "The fragments are spread around the dungeon.  Once clicked they will disappear.  Make sure all party members are present when clicked so that everyone on the quest receives credit.  Archmage Khadgar should appear after defeating the final boss to complete the quest."
Inst169Quest2_Prequest = "None"
Inst169Quest2_Folgequest = "None"
--
Inst169Quest2name1 = "Violet Seal of the Archmage"

--Quest 3 Alliance
Inst169Quest3 = "3. Book Wyrms"
Inst169Quest3_Aim = "Pick up books in the Karazhan Library."
Inst169Quest3_Location = "Mage Darius (Deadwind Pass - Karazhan; "..YELLOW.."47.0, 75.4"..WHITE..")"
Inst169Quest3_Note = ""
Inst169Quest3_Prequest = "None"
Inst169Quest3_Folgequest = "Rebooting the Cleaner"
-- No Rewards for this quest

--Quest 4 Alliance
Inst169Quest4 = "4. Rebooting the Cleaner"
Inst169Quest4_Aim = "Disable the Curator and find the Box of Spare Motivator Crystals."
Inst169Quest4_Location = ""
Inst169Quest4_Note = "The Box of Spare Motivator Crystals is in the back left side of the room after defeating the Curator, at "..YELLOW.."[6]"..WHITE.."."
Inst169Quest4_Prequest = "Book Wyrms"
Inst169Quest4_Folgequest = "New Shoes"
Inst169Quest4FQuest = "true"
--
Inst169Quest4name1 = "Violet Seal of the Archmage"

--Quest 5 Alliance
Inst169Quest5 = "5. New Shoes"
Inst169Quest5_Aim = "Deliver the Box of 'New' Horseshoes to Koren the Blacksmith in Karazhan."
Inst169Quest5_Location = ""
Inst169Quest5_Note = ""
Inst169Quest5_Prequest = "Rebooting the Cleaner"
Inst169Quest5_Folgequest = "High Stress Hiatus"
Inst169Quest5FQuest = "true"
-- No Rewards for this quest

--Quest 6 Alliance
Inst169Quest6 = "6. High Stress Hiatus"
Inst169Quest6_Aim = "Help Darius soothe the old casts egos by finding a Positive Review amongst the audience members to simmer tensions between Romulo and Julianne, stealing a Bouquet of Roses from one of the new acts for Tinhead's vanity and finding where the understudy stashed Little Red's cape in the Chess room."
Inst169Quest6_Location = ""
Inst169Quest6_Note = ""
Inst169Quest6_Prequest = "New Shoes"
Inst169Quest6_Folgequest = "Clearing Out the Cobwebs"
Inst169Quest6FQuest = "true"
--
Inst169Quest6name1 = "Violet Seal of the Archmage"

--Quest 7 Alliance
Inst169Quest7 = "7. Clearing Out the Cobwebs"
Inst169Quest7_Aim = "Clean out spiders from the Servant's Quarters."
Inst169Quest7_Location = ""
Inst169Quest7_Note = "After completing this quest, Kill Nightbane at "..YELLOW.."[]"..WHITE.." and pickup an item off him to start the next quest."
Inst169Quest7_Prequest = "High Stress Hiatus"
Inst169Quest7_Folgequest = "No Bones About It"
Inst169Quest7FQuest = "true"
-- No Rewards for this quest

--Quest 8 Alliance
Inst169Quest8 = "8. No Bones About It"
Inst169Quest8_Aim = "Take the Charred Bone Fragments to Darius."
Inst169Quest8_Location = ""
Inst169Quest8_Note = ""
Inst169Quest8_Prequest = "Clearing Out the Cobwebs"
Inst169Quest8_Folgequest = "None"
Inst169Quest8FQuest = "true"
--
Inst169Quest8name1 = "Violet Seal of the Grand Magus"

--Quest 9 Alliance
Inst169Quest9 = "9. The Tower of Power"
Inst169Quest9_Aim = "Defeat Viz'aduum the Watcher in Karazhan on Mythic difficulty."
Inst169Quest9_Location = "Obtained from Order Hall mission."
Inst169Quest9_Note = "Viz'aduum the Watcher is at "..YELLOW.."[10]"..WHITE..".  Turn in the completed quest in your Order Hall."
Inst169Quest9_Prequest = "None"
Inst169Quest9_Folgequest = "None"
--
Inst169Quest9name1 = "Glittering Pack"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst169Quest1_HORDE = Inst169Quest1
Inst169Quest1_HORDE_Aim = Inst169Quest1_Aim
Inst169Quest1_HORDE_Location = Inst169Quest1_Location
Inst169Quest1_HORDE_Note = Inst169Quest1_Note
Inst169Quest1_HORDE_Prequest = Inst169Quest1_Prequest
Inst169Quest1_HORDE_Folgequest = Inst169Quest1_Folgequest
--
Inst169Quest1name1_HORDE = Inst169Quest1name1

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst169Quest2_HORDE = Inst169Quest2
Inst169Quest2_HORDE_Aim = Inst169Quest2_Aim
Inst169Quest2_HORDE_Location = Inst169Quest2_Location
Inst169Quest2_HORDE_Note = Inst169Quest2_Note
Inst169Quest2_HORDE_Prequest = Inst169Quest2_Prequest
Inst169Quest2_HORDE_Folgequest = Inst169Quest2_Folgequest
--
Inst169Quest2name1_HORDE = Inst169Quest2name1

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst169Quest3_HORDE = Inst169Quest3
Inst169Quest3_HORDE_Aim = Inst169Quest3_Aim
Inst169Quest3_HORDE_Location = Inst169Quest3_Location
Inst169Quest3_HORDE_Note = Inst169Quest3_Note
Inst169Quest3_HORDE_Prequest = Inst169Quest3_Prequest
Inst169Quest3_HORDE_Folgequest = Inst169Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst169Quest4_HORDE = Inst169Quest4
Inst169Quest4_HORDE_Aim = Inst169Quest4_Aim
Inst169Quest4_HORDE_Location = Inst169Quest4_Location
Inst169Quest4_HORDE_Note = Inst169Quest4_Note
Inst169Quest4_HORDE_Prequest = Inst169Quest4_Prequest
Inst169Quest4_HORDE_Folgequest = Inst169Quest4_Folgequest
Inst169Quest4FQuest_HORDE = Inst169Quest4FQuest
--
Inst169Quest4name1_HORDE = Inst169Quest4name1

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst169Quest5_HORDE = Inst169Quest5
Inst169Quest5_HORDE_Aim = Inst169Quest5_Aim
Inst169Quest5_HORDE_Location = Inst169Quest5_Location
Inst169Quest5_HORDE_Note = Inst169Quest5_Note
Inst169Quest5_HORDE_Prequest = Inst169Quest5_Prequest
Inst169Quest5_HORDE_Folgequest = Inst169Quest5_Folgequest
Inst169Quest5FQuest_HORDE = Inst169Quest5FQuest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst169Quest6_HORDE = Inst169Quest6
Inst169Quest6_HORDE_Aim = Inst169Quest6_Aim
Inst169Quest6_HORDE_Location = Inst169Quest6_Location
Inst169Quest6_HORDE_Note = Inst169Quest6_Note
Inst169Quest6_HORDE_Prequest = Inst169Quest6_Prequest
Inst169Quest6_HORDE_Folgequest = Inst169Quest6_Folgequest
Inst169Quest6FQuest_HORDE = Inst169Quest6FQuest
--
Inst169Quest6name1_HORDE = Inst169Quest6name1

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst169Quest7_HORDE = Inst169Quest7
Inst169Quest7_HORDE_Aim = Inst169Quest7_Aim
Inst169Quest7_HORDE_Location = Inst169Quest7_Location
Inst169Quest7_HORDE_Note = Inst169Quest7_Note
Inst169Quest7_HORDE_Prequest = Inst169Quest7_Prequest
Inst169Quest7_HORDE_Folgequest = Inst169Quest7_Folgequest
Inst169Quest7FQuest_HORDE = Inst169Quest7FQuest
-- No Rewards for this quest

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst169Quest8_HORDE = Inst169Quest8
Inst169Quest8_HORDE_Aim = Inst169Quest8_Aim
Inst169Quest8_HORDE_Location = Inst169Quest8_Location
Inst169Quest8_HORDE_Note = Inst169Quest8_Note
Inst169Quest8_HORDE_Prequest = Inst169Quest8_Prequest
Inst169Quest8_HORDE_Folgequest = Inst169Quest8_Folgequest
Inst169Quest8FQuest_HORDE = Inst169Quest8FQuest
--
Inst169Quest8name1_HORDE = Inst169Quest8name1

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst169Quest9_HORDE = Inst169Quest9
Inst169Quest9_HORDE_Aim = Inst169Quest9_Aim
Inst169Quest9_HORDE_Location = Inst169Quest9_Location
Inst169Quest9_HORDE_Note = Inst169Quest9_Note
Inst169Quest9_HORDE_Prequest = Inst169Quest9_Prequest
Inst169Quest9_HORDE_Folgequest = Inst169Quest9_Folgequest
--
Inst169Quest9name1_HORDE = Inst169Quest9name1



--------------- INST170 - Trial of Valor ---------------

Inst170Caption = "Trial of Valor"
Inst170QAA = "3 Quests"
Inst170QAH = "3 Quests"

--Quest 1 Alliance
Inst170Quest1 = "1. Odyn's Favor"
Inst170Quest1_Aim = "Gain Odyn's favor within the Trial of Valor Raid."
Inst170Quest1_Location = "Havi (Stormheim - Valdisdall; "..YELLOW.."60.2, 50.8"..WHITE..")"
Inst170Quest1_Note = "Defeat Odyn at "..YELLOW.."[3]"..WHITE.." to gain his favor and complete the quest.  Requires Normal difficulty or higher.  The quest turns in to him."
Inst170Quest1_Prequest = "A Call to Action -> Helya's Conquest"
Inst170Quest1_Folgequest = "Odyn's Judgement"
Inst170Quest1PreQuest = "true"
--
Inst170Quest1name1 = "Titan's Boon"

--Quest 2 Alliance
Inst170Quest2 = "2. Odyn's Judgement"
Inst170Quest2_Aim = "Defeat Helya within the Trial of Valor Raid."
Inst170Quest2_Location = "Odyn (Trial of Valor; "..YELLOW.."[3]"..WHITE..")"
Inst170Quest2_Note = "Helya is located at "..YELLOW.."[5]"..WHITE..".  Requires Normal difficulty or higher."
Inst170Quest2_Prequest = "Odyn's Favor"
Inst170Quest2_Folgequest = "None"
Inst170Quest2FQuest = "true"
--
Inst170Quest2name1 = "Plume of the Fallen Val'kyr"

--Quest 3 Alliance
Inst170Quest3 = "3. The Lost Army"
Inst170Quest3_Aim = "Gather 1000 Valarjar Soul Fragments within the Trial of Valor Raid."
Inst170Quest3_Location = "Odyn (Trial of Valor; "..YELLOW.."[3]"..WHITE..")"
Inst170Quest3_Note = "These drop from Helya's minions and Helya herself.  Requires Normal difficulty or higher."
Inst170Quest3_Prequest = "None"
Inst170Quest3_Folgequest = "None"
-- Reward varies for each class


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst170Quest1_HORDE = Inst170Quest1
Inst170Quest1_HORDE_Aim = Inst170Quest1_Aim
Inst170Quest1_HORDE_Location = Inst170Quest1_Location
Inst170Quest1_HORDE_Note = Inst170Quest1_Note
Inst170Quest1_HORDE_Prequest = Inst170Quest1_Prequest
Inst170Quest1_HORDE_Folgequest = Inst170Quest1_Folgequest
Inst170Quest1PreQuest_HORDE = Inst170Quest1PreQuest
--
Inst170Quest1name1_HORDE = Inst170Quest1name1

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst170Quest2_HORDE = Inst170Quest2
Inst170Quest2_HORDE_Aim = Inst170Quest2_Aim
Inst170Quest2_HORDE_Location = Inst170Quest2_Location
Inst170Quest2_HORDE_Note = Inst170Quest2_Note
Inst170Quest2_HORDE_Prequest = Inst170Quest2_Prequest
Inst170Quest2_HORDE_Folgequest = Inst170Quest2_Folgequest
Inst170Quest2FQuest_HORDE = Inst170Quest2FQuest
--
Inst170Quest2name1_HORDE = Inst170Quest2name1

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst170Quest3_HORDE = Inst170Quest3
Inst170Quest3_HORDE_Aim = Inst170Quest3_Aim
Inst170Quest3_HORDE_Location = Inst170Quest3_Location
Inst170Quest3_HORDE_Note = Inst170Quest3_Note
Inst170Quest3_HORDE_Prequest = Inst170Quest3_Prequest
Inst170Quest3_HORDE_Folgequest = Inst170Quest3_Folgequest
-- Reward varies for each class



--------------- INST171 - Tomb of Sargeras ---------------

Inst171Caption = "Tomb of Sargeras"
Inst171QAA = "No Quests"
Inst171QAH = "No Quests"









-- End of File
