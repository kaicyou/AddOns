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


AQ_WORLDDUNGEONQUEST = "Dies ist eine Weltquest.  Wenn diese Aktiv ist (Du kannst das in der Map sehen ob diese aktiv ist), betrete die Dungeon.  Wenn Du die Instanz beendest , wird die Quest automatisch abgeschlossen.  Diese Quest gibt Dir Rufbelohnung und manchmal auch ein Gegenstand."

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
Inst157QAA = "6 Quests"
Inst157QAH = "6 Quests"

--Quest 1 Alliance
Inst157Quest1 = "1. Violette Festung"
Inst157Quest1_Aim = "Bezwingt den Anf�hrer des Sturms auf die Violette Festung."
Inst157Quest1_Location = "Violette Festung (Automatische Annahme)"
Inst157Quest1_Note = "Gebe die Quest in Deiner Ordenshalle ab."
Inst157Quest1_Prequest = "Nein"
Inst157Quest1_Folgequest = "Nein"
--
Inst157Quest1name1 = "Schmuggelwarenspind der Violetten Festung"

--Quest 2 Alliance
Inst157Quest2 = "2. Violette Festung (Heroisch)"
Inst157Quest2_Aim = "Bezwingt den Anf�hrer des Sturms auf die Violette Festung auf dem Schwierigkeitsgrad 'Heroisch' oder h�her."
Inst157Quest2_Location = Inst157Quest1_Location
Inst157Quest2_Note = Inst157Quest1_Location
Inst157Quest2_Prequest = "Nein"
Inst157Quest2_Folgequest = "Nein"
--
Inst157Quest2name1 = Inst157Quest1name1

--Quest 3 Alliance
Inst157Quest3 = "3. Violette Festung (Mythisch)"
Inst157Quest3_Aim = "Bezwingt den Anf�hrer des Sturms auf die Violette Festung auf dem Schwierigkeitsgrad 'Mythisch'."
Inst157Quest3_Location = Inst157Quest1_Location
Inst157Quest3_Note = Inst157Quest1_Location
Inst157Quest3_Prequest = "Nein"
Inst157Quest3_Folgequest = "Nein"
--
Inst157Quest3name1 = Inst157Quest1name1

--Quest 4 Alliance
Inst157Quest4 = "4. Fiasko in der Festung"
Inst157Quest4_Aim = "Schlagt den Sturm auf die Violette Festung zur�ck."
Inst157Quest4_Location = "Leutnant Sinclari (Dalaran - Die Violette Festung; "..YELLOW.."66.3, 68.0"..WHITE..")"
Inst157Quest4_Note = "Erledige die komplette Instanz und gebe die Quest am Eingang der Instanz wieder ab."
Inst157Quest4_Prequest = "Nein"
Inst157Quest4_Folgequest = "Nein"
-- Reward varies for each class

--Quest 5 Alliance
Inst157Quest5 = "5. Von der Schippe springen"
Inst157Quest5_Aim = "Stellt 2 Fehlschlagdetektorpylonen her. Besorgt dann in der Violetten Festung einen plasmatischen Laserriegel und bringt anschlie�end alles zu Didi Biegezange in Dalaran."
Inst157Quest5_Location = "Didi Biegezange (Dalaran - Handelsmarkt der Magier; "..YELLOW.."38.6, 25.0"..WHITE..")"
Inst157Quest5_Note = "Ingeneursquest.  Stelle 2 Fehlschlagdetektorpylonen her.  Der plasmatische Laserriegel ist in der R�ckseite der Zelle des zweiten Bosses (welches ein Random Boss ist).  Die Belohnung lehrt Dich eine neue Ingenieurvorlage."
Inst157Quest5_Prequest = "Nein"
Inst157Quest5_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 6 Alliance
Inst157Quest6 = "6. Befehle aufdecken"
Inst157Quest6_Aim = "Sammelt das Fragment der B�sartigkeit in der Rabenwehr (Mythisch), das Fragment der Macht in der Violetten Festung (Mythisch) und das Fragment der Folter im Verlies der W�chterinnen (Mythisch)."
Inst157Quest6_Location = "Erzmagier Khadgar (Dalaran - Violette Zitadelle; "..YELLOW.."28.8, 48.6"..WHITE..")"
Inst157Quest6_Note = "Karazhan Einstimmung Questreihe.  Kann nur auf dem Schwierigkeitsgrad Mythisch oder h�her abgeschlossen werden."
Inst157Quest6_Prequest = "Edikt des Gottk�nigs -> Unerw�nschte Beweise"
Inst157Quest6_Folgequest = "Aura der Ungewissheit"
Inst157Quest6PreQuest = "true"
--
Inst157Quest6name1 = "D�monische Befehlssplitter"


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

--Quest 6 Horde
Inst157Quest6_HORDE = Inst157Quest6
Inst157Quest6_HORDE_Aim = Inst157Quest6_Aim
Inst157Quest6_HORDE_Location = Inst157Quest6_Location
Inst157Quest6_HORDE_Note = Inst157Quest6_Note
Inst157Quest6_HORDE_Prequest = Inst157Quest6_Prequest
Inst157Quest6_HORDE_Folgequest = "Aura der Ungewissheit"
Inst157Quest6PreQuest_HORDE = "true"
--
Inst157Quest6name1_HORDE = Inst157Quest6name1



--------------- INST158 - Black Rook Hold ---------------

Inst158Caption = "Die Rabenwehr"
Inst158QAA = "10 Quests"
Inst158QAH = "10 Quests"

--Quest 1 Alliance
Inst158Quest1 = "1. Der Herr der Rabenwehr"
Inst158Quest1_Aim = "Bezwingt Kur'talos Rabenkrone in der Rabenwehr."
Inst158Quest1_Location = "Die Rabenwehr (Automatische Annahme)"
Inst158Quest1_Note = Inst157Quest1_Location
Inst158Quest1_Prequest = "Nein"
Inst158Quest1_Folgequest = "Nein"
--
Inst158Quest1name1 = "Heimgesuchtes Rabenkronenandenken"

--Quest 2 Alliance
Inst158Quest2 = "2. Der Herr der Rabenwehr (Heroisch)"
Inst158Quest2_Aim = "Bezwingt Kur'talos Rabenkrone in der Rabenwehr auf dem Schwierigkeitsgrad 'Heroisch' oder h�her."
Inst158Quest2_Location = Inst158Quest1_Location
Inst158Quest2_Note = Inst157Quest1_Location
Inst158Quest2_Prequest = "Nein"
Inst158Quest2_Folgequest = "Nein"
--
Inst158Quest2name1 = Inst158Quest1name1

--Quest 3 Alliance
Inst158Quest3 = "3. Der Herr der Rabenwehr (Mythisch)"
Inst158Quest3_Aim = "Bezwingt Kur'talos Rabenkrone in der Rabenwehr auf dem Schwierigkeitsgrad 'Mythisch'.."
Inst158Quest3_Location = Inst158Quest1_Location
Inst158Quest3_Note = Inst157Quest1_Location
Inst158Quest3_Prequest = "Nein"
Inst158Quest3_Folgequest = "Nein"
--
Inst158Quest3name1 = Inst158Quest1name1

--Quest 4 Alliance
Inst158Quest4 = "4. Die Rabenwehr: Schlimmer geht's nicht"
Inst158Quest4_Aim = "T�tet Braxas der Fleischschnitzer und Dantalionax."
Inst158Quest4_Location = ""
Inst158Quest4_Note = AQ_WORLDDUNGEONQUEST
Inst158Quest4_Prequest = "Nein"
Inst158Quest4_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 5 Alliance
Inst158Quest5 = "5. Die Rabenwehr: Tod des Verr�ters"
Inst158Quest5_Aim = "T�tet Kelorn Nachtklinge und Dantalionax."
Inst158Quest5_Location = ""
Inst158Quest5_Note = AQ_WORLDDUNGEONQUEST
Inst158Quest5_Prequest = "Nein"
Inst158Quest5_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 6 Alliance
Inst158Quest6 = "6. Die Rabenwehr: Der Kummer"
Inst158Quest6_Aim = "T�tet General Tel'arn, Waldl�ufergeneralin Feleor und Dantallionax."
Inst158Quest6_Location = ""
Inst158Quest6_Note = AQ_WORLDDUNGEONQUEST
Inst158Quest6_Prequest = "Nein"
Inst158Quest6_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 7 Alliance
Inst158Quest7 = "7. Die Rabenwehr: Der verr�ckte Arkanist"
Inst158Quest7_Aim = "T�tet Erzmagier Galeorn und Dantalionax."
Inst158Quest7_Location = ""
Inst158Quest7_Note = AQ_WORLDDUNGEONQUEST
Inst158Quest7_Prequest = "Nein"
Inst158Quest7_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 8 Alliance
Inst158Quest8 = "8. Die Rabenwehr: ...Mit Feuer!"
Inst158Quest8_Aim = "T�tet die Uralte Witwe und Dantalionax."
Inst158Quest8_Location = ""
Inst158Quest8_Note = AQ_WORLDDUNGEONQUEST
Inst158Quest8_Prequest = "Nein"
Inst158Quest8_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 9 Alliance
Inst158Quest9 = "9. Gr��ere Macht"
Inst158Quest9_Aim = "Besiegt Lord Kur'talos Rabenkrone und besorgt einen gro�en d�monischen Runenstein von Dantalionax in der Rabenwehr."
Inst158Quest9_Location = "Odyn (Himmelsfeste; "..YELLOW.."58.4, 82.8"..WHITE..")"
Inst158Quest9_Note = "Kriegerquest.  Diese bekommst Du nach Abschlu� der Quest D�monische Runen.  Lord Kur'talos Rabenkrone und Dantalionax sind die letzen Bosse der Instanz, bei "..YELLOW.."[4]"..WHITE.."."
Inst158Quest9_Prequest = "D�monische Runen"
Inst158Quest9_Folgequest = "Nein"
Inst158Quest9PreQuest = "true"
-- No Rewards for this quest

--Quest 10 Alliance
Inst158Quest10 = Inst157Quest6
Inst158Quest10_Aim = Inst157Quest6_Aim
Inst158Quest10_Location = Inst157Quest6_Location
Inst158Quest10_Note = Inst157Quest6_Note
Inst158Quest10_Prequest = Inst157Quest6_Prequest
Inst158Quest10_Folgequest = "Aura der Ungewissheit"
Inst158Quest10PreQuest = "true"
--
Inst158Quest10name1 = Inst157Quest6name1

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

--Quest 4 Horde
Inst158Quest4_HORDE = Inst158Quest4
Inst158Quest4_HORDE_Aim = Inst158Quest4_Aim
Inst158Quest4_HORDE_Location = Inst158Quest4_Location
Inst158Quest4_HORDE_Note = Inst158Quest4_Note
Inst158Quest4_HORDE_Prequest = "Nein"
Inst158Quest4_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 5 Horde
Inst158Quest5_HORDE = Inst158Quest5
Inst158Quest5_HORDE_Aim = Inst158Quest5_Aim
Inst158Quest5_HORDE_Location = Inst158Quest5_Location
Inst158Quest5_HORDE_Note = Inst158Quest5_Note
Inst158Quest5_HORDE_Prequest = "Nein"
Inst158Quest5_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 6 Horde
Inst158Quest6_HORDE = Inst158Quest6
Inst158Quest6_HORDE_Aim = Inst158Quest6_Aim
Inst158Quest6_HORDE_Location = Inst158Quest6_Location
Inst158Quest6_HORDE_Note = Inst158Quest6_Note
Inst158Quest6_HORDE_Prequest = "Nein"
Inst158Quest6_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 7 Horde
Inst158Quest7_HORDE = Inst158Quest7
Inst158Quest7_HORDE_Aim = Inst158Quest7_Aim
Inst158Quest7_HORDE_Location = Inst158Quest7_Location
Inst158Quest7_HORDE_Note = Inst158Quest7_Note
Inst158Quest7_HORDE_Prequest = "Nein"
Inst158Quest7_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 8 Horde
Inst158Quest8_HORDE = Inst158Quest8
Inst158Quest8_HORDE_Aim = Inst158Quest8_Aim
Inst158Quest8_HORDE_Location = Inst158Quest8_Location
Inst158Quest8_HORDE_Note = Inst158Quest8_Note
Inst158Quest8_HORDE_Prequest = "Nein"
Inst158Quest8_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 9 Horde
Inst158Quest9_HORDE = Inst158Quest9
Inst158Quest9_HORDE_Aim = Inst158Quest9_Aim
Inst158Quest9_HORDE_Location = Inst158Quest9_Location
Inst158Quest9_HORDE_Note = Inst158Quest9_Note
Inst158Quest9_HORDE_Prequest = Inst158Quest9_Prequest
Inst158Quest9_HORDE_Folgequest = "Nein"
Inst158Quest9PreQuest_HORDE = "D�monische Runen"
-- No Rewards for this quest

--Quest 10 Horde
Inst158Quest10_HORDE = Inst157Quest6
Inst158Quest10_HORDE_Aim = Inst157Quest6_Aim
Inst158Quest10_HORDE_Location = Inst157Quest6_Location
Inst158Quest10_HORDE_Note = Inst157Quest6_Note
Inst158Quest10_HORDE_Prequest = Inst157Quest6_Prequest
Inst158Quest10_HORDE_Folgequest = "Aura der Ungewissheit"
Inst158Quest10PreQuest_HORDE = "true"
--
Inst158Quest10name1_HORDE = Inst157Quest6name1


--------------- INST159 - Court of Stars ---------------

Inst159Caption = "Der Hof der Sterne"
Inst159QAA = "6 Quests"
Inst159QAH = "6 Quests"

--Quest 1 Alliance
Inst159Quest1 = "1. Der Hof der Sterne (Mythisch)"
Inst159Quest1_Aim = "Bezwingt Berater Melandrus im Hof der Sterne auf dem Schwierigkeitsgrad 'Mythisch'."
Inst159Quest1_Location = ""
Inst159Quest1_Note = Inst157Quest1_Location
Inst159Quest1_Prequest = "Nein"
Inst159Quest1_Folgequest = "Nein"
--
Inst159Quest1name1 = "Nightborne Rucksack"

--Quest 2 Alliance
Inst159Quest2 = "2. Der Hof der Sterne: Bringt mir die Augen"
Inst159Quest2_Aim = "T�tet Velimar und Berater Melandrus."
Inst159Quest2_Location = ""
Inst159Quest2_Note = AQ_WORLDDUNGEONQUEST
Inst159Quest2_Prequest = "Nein"
Inst159Quest2_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 3 Alliance
Inst159Quest3 = "3. Der Hof der Sterne: Entwaffnung der Wache"
Inst159Quest3_Aim = "Sammelt 6 Bewaffnung der Nachtw�chter und t�tet Berater Melandrus."
Inst159Quest3_Location = ""
Inst159Quest3_Note = AQ_WORLDDUNGEONQUEST
Inst159Quest3_Prequest = "Nein"
Inst159Quest3_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 4 Alliance
Inst159Quest4 = "4. Der Hof der Sterne: Die hinterlistige Sch�lerin"
Inst159Quest4_Aim = "T�tet Arkanistin Malrodi und Berater Melandrus."
Inst159Quest4_Location = ""
Inst159Quest4_Note = AQ_WORLDDUNGEONQUEST
Inst159Quest4_Prequest = "Nein"
Inst159Quest4_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 5 Alliance
Inst159Quest5 = "5. F�rchtet den Zorn eines geduldigen Elfen"
Inst159Quest5_Aim = "Betretet die Dungeon 'Der Hof der Sterne' und t�tet Berater Melandrus. Nehmt ihm seinen Zauberstein ab und bringt ihn Thalyssra."
Inst159Quest5_Location = "Erste Arkanistin Thalyssra (Suramar - Meredii; "..YELLOW.."36.4, 46.8"..WHITE..")"
Inst159Quest5_Note = "Berater Melandrus ist bei "..YELLOW.."[3]"..WHITE.."."
Inst159Quest5_Prequest = "Nein"
Inst159Quest5_Folgequest = "Nein"
--
Inst159Quest5name1 = "Uralter Qirajig�tze"

--Quest 6 Alliance
Inst159Quest6 = "6. R�ckschlagd�mpfung"
Inst159Quest6_Aim = "Geht zum Hof der Sterne und besorgt den arkanen Kompressor f�r Hobart."
Inst159Quest6_Location = "Hobart Wurfhammer (Dalaran; "..YELLOW.."38.6, 26.2"..WHITE..")"
Inst159Quest6_Note = "Ingineursquest.  Der arkane Kompressor droppt vom Patrouillenoffizier Gerdo  bei "..YELLOW.."[1]"..WHITE.."."
Inst159Quest6_Prequest = "Nein"
Inst159Quest6_Folgequest = "Nein"
--
Inst159Quest6name1 = "Bauplan: Halbautomagische Kranialkanone"
Inst159Quest6name2 = "Bauplan: Abges�gte Kranialkanone"
Inst159Quest6name3 = "Bauplan: Doppell�ufige Kranialkanone "
Inst159Quest6name4 = "Bauplan: Fadenkreuzkranialkanone"


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
-- No Rewards for this quest

--Quest 3 Horde
Inst159Quest3_HORDE = Inst159Quest3
Inst159Quest3_HORDE_Aim = Inst159Quest3_Aim
Inst159Quest3_HORDE_Location = Inst159Quest3_Location
Inst159Quest3_HORDE_Note = Inst159Quest3_Note
Inst159Quest3_HORDE_Prequest = "Nein"
Inst159Quest3_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 4 Horde
Inst159Quest4_HORDE = Inst159Quest4
Inst159Quest4_HORDE_Aim = Inst159Quest4_Aim
Inst159Quest4_HORDE_Location = Inst159Quest4_Location
Inst159Quest4_HORDE_Note = Inst159Quest4_Note
Inst159Quest4_HORDE_Prequest = "Nein"
Inst159Quest4_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 5 Horde
Inst159Quest5_HORDE = Inst159Quest5
Inst159Quest5_HORDE_Aim = Inst159Quest5_Aim
Inst159Quest5_HORDE_Location = Inst159Quest5_Location
Inst159Quest5_HORDE_Note = Inst159Quest5_Note
Inst159Quest5_HORDE_Prequest = "Nein"
Inst159Quest5_HORDE_Folgequest = "Nein"
--
Inst159Quest5name1_HORDE = Inst159Quest5name1

--Quest 6 Horde
Inst159Quest6_HORDE = Inst159Quest6
Inst159Quest6_HORDE_Aim = Inst159Quest6_Aim
Inst159Quest6_HORDE_Location = Inst159Quest6_Location
Inst159Quest6_HORDE_Note = Inst159Quest6_Note
Inst159Quest6_HORDE_Prequest = Inst159Quest6_Prequest
Inst159Quest6_HORDE_Folgequest = Inst159Quest6_Folgequest
Inst159Quest6PreQuest_HORDE = "Nein"
Inst159Quest6FQuest_HORDE = "Nein"
--
Inst159Quest6name1_HORDE = Inst159Quest6name1
Inst159Quest6name2_HORDE = Inst159Quest6name2
Inst159Quest6name3_HORDE = Inst159Quest6name3
Inst159Quest6name4_HORDE = Inst159Quest6name4



--------------- INST160 - Darkheart Thicket ---------------

Inst160Caption = "Das Finsterherzdickicht"
Inst160QAA = "9 Quests"
Inst160QAH = "9 Quests"

--Quest 1 Alliance
Inst160Quest1 = "1. Finsterherzdickicht"
Inst160Quest1_Aim = "Bezwingt den Schemen von Xavius im Finsterherzdickicht."
Inst160Quest1_Location = "Finsterherzdickicht (Automatische Annahme)"
Inst160Quest1_Note = Inst157Quest1_Location
Inst160Quest1_Prequest = "Nein"
Inst160Quest1_Folgequest = "Nein"
--
Inst160Quest1name1 = "Truhe des besudelten H�ters"

--Quest 2 Alliance
Inst160Quest2 = "2. Finsterherzdickicht (Heroisch)"
Inst160Quest2_Aim = "Bezwingt den Schemen von Xavius im Finsterherzdickicht auf dem Schwierigkeitsgrad 'Heroisch' oder h�her."
Inst160Quest2_Location = Inst160Quest1_Location
Inst160Quest2_Note = Inst157Quest1_Location
Inst160Quest2_Prequest = "Nein"
Inst160Quest2_Folgequest = "Nein"
--
Inst160Quest2name1 = Inst160Quest1name1

--Quest 3 Alliance
Inst160Quest3 = "3. Finsterherzdickicht (Mythisch)"
Inst160Quest3_Aim = "Bezwingt den Schemen von Xavius im Finsterherzdickicht auf dem Schwierigkeitsgrad 'Mythisch'."
Inst160Quest3_Location = Inst160Quest1_Location
Inst160Quest3_Note = Inst157Quest1_Location
Inst160Quest3_Prequest = "Nein"
Inst160Quest3_Folgequest = "Nein"
--
Inst160Quest3name1 = Inst160Quest1name1

--Quest 4 Alliance
Inst160Quest4 = "4. Das Finsterherzdickicht: B�rendienst"
Inst160Quest4_Aim = "T�tet 9 B�ren und das Schemen von Xavius."
Inst160Quest4_Location = ""
Inst160Quest4_Note = AQ_WORLDDUNGEONQUEST
Inst160Quest4_Prequest = "Nein"
Inst160Quest4_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 5 Alliance
Inst160Quest5 = "5. Das Finsterherzdickicht: Kudzilla"
Inst160Quest5_Aim = "T�tet Kudzilla und das Schemen von Xavius."
Inst160Quest5_Location = ""
Inst160Quest5_Note = AQ_WORLDDUNGEONQUEST
Inst160Quest5_Prequest = "Nein"
Inst160Quest5_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 6 Alliance
Inst160Quest6 = "6. Das Finsterherzdickicht: Bewahrung der Bewahrer"
Inst160Quest6_Aim = "Belebt 5 Bewahrer wieder und t�tet das Schemen von Xavius."
Inst160Quest6_Location = ""
Inst160Quest6_Note = AQ_WORLDDUNGEONQUEST
Inst160Quest6_Prequest = "Nein"
Inst160Quest6_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 7 Alliance
Inst160Quest7 = "7. Das Finsterherzdickicht: Zornf�ule"
Inst160Quest7_Aim = "T�tet Zornf�ule und das Schemen von Xavius."
Inst160Quest7_Location = ""
Inst160Quest7_Note = AQ_WORLDDUNGEONQUEST
Inst160Quest7_Prequest = "Nein"
Inst160Quest7_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 8 Alliance
Inst160Quest8 = "8. Nal'ryssas Schwestern"
Inst160Quest8_Aim = "Findet Lyrelles Siegelring beim Finsterherzdickicht."
Inst160Quest8_Location = "Teufelsschmiedin Nal'ryssa (Suramar; "..YELLOW.."30.0, 53.4"..WHITE..")"
Inst160Quest8_Note = "Bergbauquest. Der Siegelring droppt vom Schemen von Xavius bei "..YELLOW.."[4]"..WHITE.."."
Inst160Quest8_Prequest = "Die Teufelsschmiedemeisterin"
Inst160Quest8_Folgequest = "Nein"
Inst160Quest8PreQuest = "true"
--
Inst160Quest8name1 = "Nal'ryssas �berz�hliger Bergbaubedarf"

--Quest 9 Alliance
Inst160Quest9 = "9. Den Alptraum betreten"
Inst160Quest9_Aim = "Begebt Euch in das Finsterherzdickicht und t�tet den Schemen von Xavius."
Inst160Quest9_Location = "Tyrande Wisperwind (Val'sharah - Der Tempel der Elune; "..YELLOW.."53.6, 55.8"..WHITE..")"
Inst160Quest9_Note = "Diese Quest bekommst Du nach Beendigung der Questreihe von Ysera und Malfurion.  Das Schemen von Xavius ist bei "..YELLOW.."[4]"..WHITE.."."
Inst160Quest9_Prequest = "Das Schicksal von Val'sharah"
Inst160Quest9_Folgequest = "Nein"
Inst160Quest9PreQuest = "true"
-- Reward varies for each class


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

--Quest 4 Horde
Inst160Quest4_HORDE = Inst160Quest4
Inst160Quest4_HORDE_Aim = Inst160Quest4_Aim
Inst160Quest4_HORDE_Location = Inst160Quest4_Location
Inst160Quest4_HORDE_Note = Inst160Quest4_Note
Inst160Quest4_HORDE_Prequest = "Nein"
Inst160Quest4_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 5 Horde
Inst160Quest5_HORDE = Inst160Quest5
Inst160Quest5_HORDE_Aim = Inst160Quest5_Aim
Inst160Quest5_HORDE_Location = Inst160Quest5_Location
Inst160Quest5_HORDE_Note = Inst160Quest5_Note
Inst160Quest5_HORDE_Prequest = "Nein"
Inst160Quest5_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 6 Horde
Inst160Quest6_HORDE = Inst160Quest6
Inst160Quest6_HORDE_Aim = Inst160Quest6_Aim
Inst160Quest6_HORDE_Location = Inst160Quest6_Location
Inst160Quest6_HORDE_Note = Inst160Quest6_Note
Inst160Quest6_HORDE_Prequest = "Nein"
Inst160Quest6_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 7 Horde
Inst160Quest7_HORDE = Inst160Quest7
Inst160Quest7_HORDE_Aim = Inst160Quest7_Aim
Inst160Quest7_HORDE_Location = Inst160Quest7_Location
Inst160Quest7_HORDE_Note = Inst160Quest7_Note
Inst160Quest7_HORDE_Prequest = "Nein"
Inst160Quest7_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 8 Horde
Inst160Quest8_HORDE = Inst160Quest8
Inst160Quest8_HORDE_Aim = Inst160Quest8_Aim
Inst160Quest8_HORDE_Location = Inst160Quest8_Location
Inst160Quest8_HORDE_Note = Inst160Quest8_Note
Inst160Quest8_HORDE_Prequest = Inst160Quest8_Prequest
Inst160Quest8_HORDE_Folgequest = "Nein"
Inst160Quest8PreQuest_HORDE = "true"
--
Inst160Quest8name1_HORDE = Inst160Quest8name1

--Quest 9 Horde
Inst160Quest9_HORDE = Inst160Quest9
Inst160Quest9_HORDE_Aim = Inst160Quest9_Aim
Inst160Quest9_HORDE_Location = Inst160Quest9_Location
Inst160Quest9_HORDE_Note = Inst160Quest9_Note
Inst160Quest9_HORDE_Prequest = Inst160Quest9_Prequest
Inst160Quest9_HORDE_Folgequest = "Nein"
Inst160Quest9PreQuest_HORDE = "true"
-- Reward varies for each class



--------------- INST161 - Eye of Azshara ---------------

Inst161Caption = "Das Auge Azsharas"
Inst161QAA = "8 Quests"
Inst161QAH = "8 Quests"

--Quest 1 Alliance
Inst161Quest1 = "1. Das Auge Azsharas: Verzwickte Lage"
Inst161Quest1_Aim = "T�tet Gom Krabbar und Azsharas Zorn."
Inst161Quest1_Location = ""
Inst161Quest1_Note = AQ_WORLDDUNGEONQUEST
Inst161Quest1_Prequest = "Nein"
Inst161Quest1_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 2 Alliance
Inst161Quest2 = "2. Das Auge Azsharas: Schneckentempo"
Inst161Quest2_Aim = "T�tet Panzermaul und Azsharas Zorn."
Inst161Quest2_Location = ""
Inst161Quest2_Note = AQ_WORLDDUNGEONQUEST
Inst161Quest2_Prequest = "Nein"
Inst161Quest2_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 3 Alliance
Inst161Quest3 = "3. Das Auge Azsharas: Abgewrackt"
Inst161Quest3_Aim = "T�tet Schreckenskapit�n Thedon und Azsharas Zorn."
Inst161Quest3_Location = ""
Inst161Quest3_Note = AQ_WORLDDUNGEONQUEST
Inst161Quest3_Prequest = "Nein"
Inst161Quest3_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 4 Alliance
Inst161Quest4 = "4. Das Auge Azsharas: Azsunianische Perlen"
Inst161Quest4_Aim = "Sammelt 5 Riesige Azsunaperle und t�tet Azsharas Zorn."
Inst161Quest4_Location = ""
Inst161Quest4_Note = AQ_WORLDDUNGEONQUEST
Inst161Quest4_Prequest = "Nein"
Inst161Quest4_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 5 Alliance
Inst162Quest5 = "5. Azsharas Zorn"
Inst162Quest5_Aim = "Begebt Euch in das Auge Azsharas und besiegt dann Kriegsherr Parjesh und Azsharas Zorn."
Inst162Quest5_Location = "Prinz Farondis (Aszuna - Das Wegekreuz; "..YELLOW.."61.6, 41.0"..WHITE..")"
Inst161Quest5_Note = "Die Vorquest bekommst Du nachdem Du bestimmte Questen in Aszuna erledigt hast."
Inst161Quest5_Prequest = "Der Kopf der Schlange"
Inst161Quest5_Folgequest = "Golganneths Gezeitenstein"
Inst161Quest5PreQuest = "true"
--
Inst161Quest5name1 = "Gezeitensteinsplitter"

--Quest 6 Alliance
Inst161Quest6 = "6. Golganneths Gezeitenstein"
Inst161Quest6_Aim = "Verwendet den zentralen Teleporter in Dalaran und platziert Golganneths Gezeitenstein dann in in der Portr�tgalerie der Kammer des W�chters."
Inst161Quest6_Location = "Golganneths Gezeitenstein (Azsharas Zorn; "..YELLOW.."[5]"..WHITE..")"
Inst161Quest6_Note = "Die Portr�tgalerie befindet sich unterhalb von Dalaran und kannst diesen Ort erreichen in dem Du in der Mitte von Dalaran �ber das Portal l�ufst."
Inst161Quest6_Prequest = "Azsharas Zorn"
Inst161Quest6_Folgequest = "Nein"
Inst161Quest6FQuest = "true"
-- Reward varies for each class

--Quest 7 Alliance
Inst161Quest7 = "7. S�uberung des Traumpfads"
Inst161Quest7_Aim = "Sammelt 25 Einheiten verfeinertes Wasser von den Naga im Auge Azsharas."
Inst161Quest7_Location = "Funkelchen (fliegt um den Smaragdgr�ne Traumpfad)."
Inst161Quest7_Note = "Druidenquest.  Alle Naga in der Dungeon k�nnen das verfeinertes Wasser droppen.  Die Quest bringt Dich zur�ck zu Funkelchen."
Inst161Quest7_Prequest = "Azsharas Zorn"
Inst161Quest7_Folgequest = "Nein"
Inst161Quest7FQuest = "true"
-- Reward varies for each class

--Quest 8 Alliance
Inst161Quest8 = "8. Das Herz von Zin-Azshari"
Inst161Quest8_Aim = "Besorgt das Herz von Zin-Azshari und besiegt Azsharas Zorn im Auge Azsharas auf dem Schwierigkeitsgrad 'Mythisch'."
Inst161Quest8_Location = "Senegos (Azsuna - Azurschwingen Rast; "..YELLOW.."48.2, 25.6"..WHITE..")"
Inst161Quest8_Note = "Diese Quest kann nur auf dem Schwierigkeitsgrad Mythisch erledigt werden.   Dies ist ein Teil der Artefaktwaffe Questreihe.  Das Herz von Zin'Azshari droppt vom Endboss, bei "..YELLOW.."[5]"..WHITE.."."
Inst161Quest8_Prequest = "Nein"
Inst161Quest8_Folgequest = "Nein"
-- No Rewards for this quest


--Quest 1 Horde
Inst161Quest1_HORDE = Inst161Quest1
Inst161Quest1_HORDE_Aim = Inst161Quest1_Aim
Inst161Quest1_HORDE_Location = Inst161Quest1_Location
Inst161Quest1_HORDE_Note = Inst161Quest1_Note
Inst161Quest1_HORDE_Prequest = "Nein"
Inst161Quest1_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 2 Horde
Inst161Quest2_HORDE = Inst161Quest2
Inst161Quest2_HORDE_Aim = Inst161Quest2_Aim
Inst161Quest2_HORDE_Location = Inst161Quest2_Location
Inst161Quest2_HORDE_Note = Inst161Quest2_Note
Inst161Quest2_HORDE_Prequest = "Nein"
Inst161Quest2_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 3 Horde
Inst161Quest3_HORDE = Inst161Quest3
Inst161Quest3_HORDE_Aim = Inst161Quest3_Aim
Inst161Quest3_HORDE_Location = Inst161Quest3_Location
Inst161Quest3_HORDE_Note = Inst161Quest3_Note
Inst161Quest3_HORDE_Prequest = "Nein"
Inst161Quest3_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 4 Horde
Inst161Quest4_HORDE = Inst161Quest4
Inst161Quest4_HORDE_Aim = Inst161Quest4_Aim
Inst161Quest4_HORDE_Location = Inst161Quest4_Location
Inst161Quest4_HORDE_Note = Inst161Quest4_Note
Inst161Quest4_HORDE_Prequest = "Nein"
Inst161Quest4_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 5 Horde
Inst161Quest5_HORDE = Inst161Quest5
Inst161Quest5_HORDE_Aim = Inst161Quest5_Aim
Inst161Quest5_HORDE_Location = Inst161Quest5_Location
Inst161Quest5_HORDE_Note = Inst161Quest5_Note
Inst161Quest5_HORDE_Prequest = Inst161Quest5_Prequest
Inst161Quest5_HORDE_Folgequest = Inst161Quest5_Folgequest
Inst161Quest5PreQuest_HORDE = "true"
--
Inst161Quest5name1_HORDE = Inst161Quest5name1

--Quest 6 Horde
Inst161Quest6_HORDE = Inst161Quest6
Inst161Quest6_HORDE_Aim = Inst161Quest6_Aim
Inst161Quest6_HORDE_Location = Inst161Quest6_Location
Inst161Quest6_HORDE_Note = Inst161Quest6_Note
Inst161Quest6_HORDE_Prequest = "Azsharas Zorn"
Inst161Quest6_HORDE_Folgequest = "Nein"
Inst161Quest6FQuest_HORDE = "true"
-- Reward varies for each class

--Quest 7 Horde
Inst161Quest7_HORDE = Inst161Quest7
Inst161Quest7_HORDE_Aim = Inst161Quest7_Aim
Inst161Quest7_HORDE_Location = Inst161Quest7_Location
Inst161Quest7_HORDE_Note = Inst161Quest7_Note
Inst161Quest7_HORDE_Prequest = "Azsharas Zorn"
Inst161Quest7_HORDE_Folgequest = "Nein"
Inst161Quest7FQuest_HORDE = "true"
-- Reward varies for each class

--Quest 8 Horde
Inst161Quest8_HORDE = Inst161Quest8
Inst161Quest8_HORDE_Aim = Inst161Quest8_Aim
Inst161Quest8_HORDE_Location = Inst161Quest8_Location
Inst161Quest8_HORDE_Note = Inst161Quest8_Note
Inst161Quest8_HORDE_Prequest = "Nein"
Inst161Quest8_HORDE_Folgequest = "Nein"
-- No Rewards for this quest



--------------- INST162 - Halls of Valor ---------------

Inst162Caption = "Die Hallen der Tapferkeit"
Inst162QAA = "14 Quests"
Inst162QAH = "14 Quests"

--Quest 1 Alliance
Inst162Quest1 = "1. Odyns Herausforderung"
Inst162Quest1_Aim = "Bezwingt Odyn in den Hallen der Tapferkeit."
Inst162Quest1_Location = "Die Hallen der Tapferkeit (Automatische Annahme)"
Inst162Quest1_Note = Inst157Quest1_Location
Inst162Quest1_Prequest = "Nein"
Inst162Quest1_Folgequest = "Nein"
--
Inst162Quest1name1 = "Sch�tze des Herausforderers"

--Quest 2 Alliance
Inst162Quest2 = "2. Odyns Herausforderung (Heroisch)"
Inst162Quest2_Aim = "Bezwingt Odyn in den Hallen der Tapferkeit auf dem Schwierigkeitsgrad 'Heroisch' oder h�her."
Inst162Quest2_Location = Inst162Quest1_Location
Inst162Quest2_Note = Inst157Quest1_Location
Inst162Quest2_Prequest = "Nein"
Inst162Quest2_Folgequest = "Nein"
--
Inst162Quest2name1 = Inst162Quest1name1

--Quest 3 Alliance
Inst162Quest3 = "3. Odyns Herausforderung (Mythisch)"
Inst162Quest3_Aim = "Bezwingt Odyn in den Hallen der Tapferkeit auf dem Schwierigkeitsgrad 'Mythisch'."
Inst162Quest3_Location = Inst162Quest1_Location
Inst162Quest3_Note = Inst157Quest1_Location
Inst162Quest3_Prequest = "Nein"
Inst162Quest3_Folgequest = "Nein"
--
Inst162Quest3name1 = Inst162Quest1name1

--Quest 4 Alliance
Inst162Quest4 = "4. Die Hallen der Tapferkeit: Eine w�rdige Herausforderung"
Inst162Quest4_Aim = "Besiegt Volynd Sturmbringer und Odyn."
Inst162Quest4_Location = ""
Inst162Quest4_Note = AQ_WORLDDUNGEONQUEST
Inst162Quest4_Prequest = "Nein"
Inst162Quest4_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 5 Alliance
Inst162Quest5 = "5. Die Hallen der Tapferkeit: Taten der Vergangenheit"
Inst162Quest5_Aim = "Sammelt 3 B�cher der gepriesenen Taten und besiegt Odyn."
Inst162Quest5_Location = ""
Inst162Quest5_Note = AQ_WORLDDUNGEONQUEST
Inst162Quest5_Prequest = "Nein"
Inst162Quest5_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 6 Alliance
Inst162Quest6 = "6. Die Hallen der Tapferkeit: Schwerf�llige Wilderei"
Inst162Quest6_Aim = "Besiegt Earlnoc den Bestienbrecher und Odyn."
Inst162Quest6_Location = ""
Inst162Quest6_Note = AQ_WORLDDUNGEONQUEST
Inst162Quest6_Prequest = "Nein"
Inst162Quest6_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 7 Alliance
Inst162Quest7 = "7. Die Hallen der Tapferkeit: Der B�renk�nig"
Inst162Quest7_Aim = "Besiegt Arthfael und Odyn."
Inst162Quest7_Location = ""
Inst162Quest7_Note = AQ_WORLDDUNGEONQUEST
Inst162Quest7_Prequest = "Nein"
Inst162Quest7_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 8 Alliance
Inst162Quest8 = "8. Die Braumeisterin"
Inst162Quest8_Aim = "Sprecht mit Melba in den Hallen der Tapferkeit."
Inst162Quest8_Location = "Broken Temple Brewmaster (location unknown)"
Inst162Quest8_Note = "Bringt Dich zu Melba in den Hallen der Tapferkeit."
Inst162Quest8_Prequest = "Nein"
Inst162Quest8_Folgequest = "Odyns Kessel"
-- No Rewards for this quest

--Quest 9 Alliance
Inst162Quest9 = "9. Odyns Kessel"
Inst162Quest9_Aim = "Holt Odyns Kessel aus den Hallen der Tapferkeit."
Inst162Quest9_Location = "Melba (Hallen der Tapferkeit; "..YELLOW.."??"..WHITE..")"
Inst162Quest9_Note = "M�nchquest.  Odyn's Cauldron is in the Heart of Revelry, a room with long tables.  Turn the quest in to Iron-Body Ponshu (Wandering Isle - Temple of Five Dawns; "..YELLOW.."51.4, 48.6"..WHITE..")."
Inst162Quest9_Prequest = "Die Braumeisterin"
Inst162Quest9_Folgequest = "Sturmgebr�u"
Inst162Quest9FQuest = "true"
-- No Rewards for this quest

--Quest 10 Alliance
Inst162Quest10 = "10. Die Aegis sichern"
Inst162Quest10_Aim = "Besiegt den Gottk�nig Skovald in den Hallen der Tapferkeit und sichert die Aegis von Aggramar."
Inst162Quest10_Location = "Havi (Sturmheim - Die Hallen der Tapferkeit; "..YELLOW.."70.2, 69.2"..WHITE..")"
Inst162Quest10_Note = "Besiegt die Aegis von Aggramar am Ende der Instant bei "..YELLOW.."[5]"..WHITE..".  Wenn Du die Instant verl�sst bevor Du die Aegis bestiegen hast, musst Du die Instant von vorne beginnen."
Inst162Quest10_Prequest = "Sturmheims Rettung"
Inst162Quest10_Folgequest = "Die Aegis von Aggramar"
Inst162Quest10FQuest = "true"
--
Inst162Quest10name1 = "Odyns wachsamer Blick"

--Quest 11 Alliance
Inst162Quest11 = "11. Die Aegis von Aggramar"
Inst162Quest11_Aim = "Bringt die Aegis von Aggramar zur sicheren Verwahrung in die Kammer des W�chters in Dalaran."
Inst162Quest11_Location = "Die Aegis von Aggramar (Die Hallen der Tapferkeit; "..YELLOW.."[5]"..WHITE..")"
Inst162Quest11_Note = "After completing the previous quest, you will be able to start this quest at the Aegis of Aggramar.  Complete this quest in the Portrait room in the upper level of Dalaran, accessible via the teleporter in the middle of the city."
Inst162Quest11_Prequest = "Die Aegis sichern"
Inst162Quest11_Folgequest = "Nein"
Inst162Quest11PreQuest = "true"
-- Reward varies for each class

--Quest 12 Alliance
Inst162Quest12 = "12. Trigger Happy"
Inst162Quest12_Aim = "Obtain the Runestone of Vitality from Odyn in the Halls of Valor."
Inst162Quest12_Location = "Hobart Grapplehammer (Dalaran; "..YELLOW.."38.4, 25.0"..WHITE..")"
Inst162Quest12_Note = "Engineering quest.  Becomes accessible after completing other engineering quests.  Odyn is the final boss, located at "..YELLOW.."[5]"..WHITE..".  The reward teaches you a new Engineering Schematic."
Inst162Quest12_Prequest = "Nein"
Inst162Quest12_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 13 Alliance
Inst162Quest13 = "13. Edikt des Gottk�nigs"
Inst162Quest13_Aim = "Bezwingt Gottk�nig Skovald in den Hallen der Tapferkeit auf dem Schwierigkeitsgrad 'Mythisch'."
Inst162Quest13_Location = Inst157Quest6_Note
Inst162Quest13_Note = "Karazhan Einstimmungsquestreihe.  Ben�tigt Mythisch oder Mythisch+ Schwierigkeit.  Gottk�nig Skovald ist bei "..YELLOW.."[4]"..WHITE.."."
Inst162Quest13_Prequest = "Nein"
Inst162Quest13_Folgequest = "Unerw�nschte Beweise"
-- No Rewards for this quest

--Quest 14 Alliance
Inst162Quest14 = "14. Unerw�nschte Beweise"
Inst162Quest14_Aim = "Bringt das Teufelskristallfragment zu Erzmagier Khadgar in Dalaran."
Inst162Quest14_Location = "Hallen der Tapferkeit; "..YELLOW.."[4]"
Inst162Quest14_Note = "Karazhan Einstimmungsquestreihe.  Erzmagier Khadgar ist in Dalaran - Violette Zitadelle; "..YELLOW.."28.8, 48.6"..WHITE.."."
Inst162Quest14_Prequest = "Edikt des Gottk�nigs"
Inst162Quest14_Folgequest = "Befehle aufdecken"
Inst162Quest14FQuest = "true"
-- No Rewards for this quest


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

--Quest 4 Horde
Inst162Quest4_HORDE = Inst162Quest4
Inst162Quest4_HORDE_Aim = Inst162Quest4_Aim
Inst162Quest4_HORDE_Location = Inst162Quest4_Location
Inst162Quest4_HORDE_Note = Inst162Quest4_Note
Inst162Quest4_HORDE_Prequest = "Nein"
Inst162Quest4_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 5 Horde
Inst162Quest5_HORDE = Inst162Quest5
Inst162Quest5_HORDE_Aim = Inst162Quest5_Aim
Inst162Quest5_HORDE_Location = Inst162Quest5_Location
Inst162Quest5_HORDE_Note = Inst162Quest5_Note
Inst162Quest5_HORDE_Prequest = "Nein"
Inst162Quest5_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 6 Horde
Inst162Quest6_HORDE = Inst162Quest6
Inst162Quest6_HORDE_Aim = Inst162Quest6_Aim
Inst162Quest6_HORDE_Location = Inst162Quest6_Location
Inst162Quest6_HORDE_Note = Inst162Quest6_Note
Inst162Quest6_HORDE_Prequest = "Nein"
Inst162Quest6_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 7 Horde
Inst162Quest7_HORDE = Inst162Quest7
Inst162Quest7_HORDE_Aim = Inst162Quest7_Aim
Inst162Quest7_HORDE_Location = Inst162Quest7_Location
Inst162Quest7_HORDE_Note = Inst162Quest7_Note
Inst162Quest7_HORDE_Prequest = "Nein"
Inst162Quest7_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 8 Horde
Inst162Quest8_HORDE = Inst162Quest8
Inst162Quest8_HORDE_Aim = Inst162Quest8_Aim
Inst162Quest8_HORDE_Location = Inst162Quest8_Location
Inst162Quest8_HORDE_Note = Inst162Quest8_Note
Inst162Quest8_HORDE_Prequest = "Nein"
Inst162Quest8_HORDE_Folgequest = "Odyns Kessel"
-- No Rewards for this quest

--Quest 9 Horde
Inst162Quest9_HORDE = Inst162Quest9
Inst162Quest9_HORDE_Aim = Inst162Quest9_Aim
Inst162Quest9_HORDE_Location = Inst162Quest9_Location
Inst162Quest9_HORDE_Note = Inst162Quest9_Note
Inst162Quest9_HORDE_Prequest = "Die Braumeisterin"
Inst162Quest9_HORDE_Folgequest = "Sturmgebr�u"
Inst162Quest9FQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 10 Horde
Inst162Quest10_HORDE = Inst162Quest10
Inst162Quest10_HORDE_Aim = Inst162Quest10_Aim
Inst162Quest10_HORDE_Location = Inst162Quest10_Location
Inst162Quest10_HORDE_Note = Inst162Quest10_Note
Inst162Quest10_HORDE_Prequest = Inst162Quest10_Prequest
Inst162Quest10_HORDE_Folgequest = Inst162Quest10_Folgequest
Inst162Quest10FQuest_HORDE = "true"
--
Inst162Quest10name1_HORDE = Inst162Quest10name1

--Quest 11 Horde
Inst162Quest11_HORDE = Inst162Quest11
Inst162Quest11_HORDE_Aim = Inst162Quest11_Aim
Inst162Quest11_HORDE_Location = Inst162Quest11_Location
Inst162Quest11_HORDE_Note = Inst162Quest11_Note
Inst162Quest11_HORDE_Prequest = "Die Aegis sichern"
Inst162Quest11_HORDE_Folgequest = "Nein"
Inst162Quest11PreQuest_HORDE = "true"
-- Reward varies for each class

--Quest 12 Horde
Inst162Quest12_HORDE = Inst162Quest12
Inst162Quest12_HORDE_Aim = Inst162Quest12_Aim
Inst162Quest12_HORDE_Location = Inst162Quest12_Location
Inst162Quest12_HORDE_Note = Inst162Quest12_Note
Inst162Quest12_HORDE_Prequest = "Nein"
Inst162Quest12_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 13 Horde
Inst162Quest13_HORDE = Inst162Quest13
Inst162Quest13_HORDE_Aim = Inst162Quest13_Aim
Inst162Quest13_HORDE_Location = Inst162Quest13_Location
Inst162Quest13_HORDE_Note = Inst162Quest13_Note
Inst162Quest13_HORDE_Prequest = "Nein"
Inst162Quest13_HORDE_Folgequest = "Unerw�nschte Beweise"
-- No Rewards for this quest

--Quest 14 Horde
Inst162Quest14_HORDE = Inst162Quest14
Inst162Quest14_HORDE_Aim = Inst162Quest14_Aim
Inst162Quest14_HORDE_Location = Inst162Quest14_Location
Inst162Quest14_HORDE_Note = Inst162Quest14_Note
Inst162Quest14_HORDE_Prequest = "Edikt des Gottk�nigs"
Inst162Quest14_HORDE_Folgequest = "Befehle aufdecken"
Inst162Quest14FQuest_HORDE = "true"
-- No Rewards for this quest



--------------- INST163 - Maw of Souls ---------------

Inst163Caption = "Der Seelenschlund"
Inst163QAA = "10 Quests"
Inst163QAH = "10 Quests"

--Quest 1 Alliance
Inst163Quest1 = "1. Der Seelenschlund"
Inst163Quest1_Aim = "Bezwingt Helya im Seelenschlund."
Inst163Quest1_Location = "Maw of Souls (Automatische Annahme)"
Inst163Quest1_Note = Inst157Quest1_Location
Inst163Quest1_Prequest = "Nein"
Inst163Quest1_Folgequest = "Nein"
--
Inst163Quest1name1 = "Seetangverkrustetes S�ckchen"

--Quest 2 Alliance
Inst163Quest2 = "2. Der Seelenschlund (Heroisch)"
Inst163Quest2_Aim = "Bezwingt Helya im Seelenschlund auf dem Schwierigkeitsgrad 'Heroisch' oder h�her."
Inst163Quest2_Location = Inst163Quest1_Location
Inst163Quest2_Note = Inst157Quest1_Location
Inst163Quest2_Prequest = "Nein"
Inst163Quest2_Folgequest = "Nein"
--
Inst163Quest2name1 = Inst163Quest1name1

--Quest 3 Alliance
Inst163Quest3 = "3. Der Seelenschlund (Mythisch)"
Inst163Quest3_Aim = "Bezwingt Helya im Seelenschlund auf dem Schwierigkeitsgrad 'Mythisch'."
Inst163Quest3_Location = Inst163Quest1_Location
Inst163Quest3_Note = Inst157Quest1_Location
Inst163Quest3_Prequest = "Nein"
Inst163Quest3_Folgequest = "Nein"
--
Inst163Quest3name1 = Inst163Quest1name1

--Quest 4 Alliance
Inst163Quest4 = "4. Der Seelenschlund: Aus dem Schlund der H�lle"
Inst163Quest4_Aim = "T�tet Seuchenschlund und Helya."
Inst163Quest4_Location = ""
Inst163Quest4_Note = AQ_WORLDDUNGEONQUEST
Inst163Quest4_Prequest = "Nein"
Inst163Quest4_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 5 Alliance
Inst163Quest5 = "5. Der Seelenschlund: Bedrohung der See"
Inst163Quest5_Aim = "Besiegt Tagerma die Seelens�chtige und Helya."
Inst163Quest5_Location = ""
Inst163Quest5_Note = AQ_WORLDDUNGEONQUEST
Inst163Quest5_Prequest = "Nein"
Inst163Quest5_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 6 Alliance
Inst163Quest6 = "6. Der Seelenschlund: Die R�ckkehr der Bestie"
Inst163Quest6_Aim = "Besiegt H�llensucher get�tet und Helya."
Inst163Quest6_Location = ""
Inst163Quest6_Note = AQ_WORLDDUNGEONQUEST
Inst163Quest6_Prequest = "Nein"
Inst163Quest6_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 7 Alliance
Inst163Quest7 = "7. Nachricht f�r Helya"
Inst163Quest7_Aim = "Bezwingt Helya im Dungeon Der Seelenschlund."
Inst163Quest7_Location = "Odyn (Die Himmelsfeste; "..YELLOW.."58.4, 82.8"..WHITE..")"
Inst163Quest7_Note = "Kriegerquest. Teil der Ordenshallenquestreihe. Helya ist der Endboss bei "..YELLOW.."[3]"..WHITE.."."
Inst163Quest7_Prequest = "Nein"
Inst163Quest7_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 8 Alliance
Inst163Quest8 = "8. Ymirons zerbrochene Klinge"
Inst163Quest8_Aim = "Kehrt zur Himmelsfeste zur�ck und �berzeugt Odyn, K�nig Ymiron zu erwecken."
Inst163Quest8_Location = "Droppt vom K�nig Ymiron (Der Seelenschlund; "..YELLOW.."[1]"..WHITE..")"
Inst163Quest8_Note = "Kriegerquest. Kehrt zu Odyn zur�ck (Die Himmelsfeste; "..YELLOW.."58.4, 82.8"..WHITE..").  The reward is Ymiron as a Follower in your Class Hall."
Inst163Quest8_Prequest = "Nein"
Inst163Quest8_Folgequest = "Nein"
-- Follower reward.

--Quest 9 Alliance
Inst163Quest9 = "9. Uralte Vrykullegenden"
Inst163Quest9_Aim = "Stellt eine Gruppe zusammen und bringt einen Abdruck der Rabenaugentafel mit auf die Naglfar, das Schiff der Toten, im Seelenschlund."
Inst163Quest9_Location = "Valeera Sanguinar (Dalaran - Ordenshalle der Schurken; "..YELLOW.."40.6, 76.0"..WHITE..")"
Inst163Quest9_Note = "Schurkenquest.  You can obtain the etching in the hold of the ship.  Be sure to get it before you attack the last boss, Helya, because you will not be able to go back to it after."
Inst163Quest9_Prequest = "Blut f�r den Wolf"
Inst163Quest9_Folgequest = "Das Rabenauge"
Inst163Quest9PreQuest = "true"
--
-- Awards Order Resources

--Quest 10 Alliance
Inst163Quest10 = "10. Im Nebel stochern"
Inst163Quest10_Aim = "Besiegt Helya im Dungeon 'Der Seelenschlund' und kehrt danach zu Havi in Valdisdall zur�ck"
Inst163Quest10_Location = "Havi (Sturmheim - Valdisdall; "..YELLOW.."60.2, 50.8"..WHITE..")"
Inst163Quest10_Note = "Helya ist der Endboss in der Seelenschmiede bei "..YELLOW.."[3]"..WHITE.."."
Inst163Quest10_Prequest = "Nein"
Inst163Quest10_Folgequest = "Nein"
-- Reward varies for each class


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

--Quest 4 Horde
Inst163Quest4_HORDE = Inst163Quest4
Inst163Quest4_HORDE_Aim = Inst163Quest4_Aim
Inst163Quest4_HORDE_Location = Inst163Quest4_Location
Inst163Quest4_HORDE_Note = Inst163Quest4_Note
Inst163Quest4_HORDE_Prequest = "Nein"
Inst163Quest4_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 5 Horde
Inst163Quest5_HORDE = Inst163Quest5
Inst163Quest5_HORDE_Aim = Inst163Quest5_Aim
Inst163Quest5_HORDE_Location = Inst163Quest5_Location
Inst163Quest5_HORDE_Note = Inst163Quest5_Note
Inst163Quest5_HORDE_Prequest = "Nein"
Inst163Quest5_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 6 Horde
Inst163Quest6_HORDE = Inst163Quest6
Inst163Quest6_HORDE_Aim = Inst163Quest6_Aim
Inst163Quest6_HORDE_Location = Inst163Quest6_Location
Inst163Quest6_HORDE_Note = Inst163Quest6_Note
Inst163Quest6_HORDE_Prequest = "Nein"
Inst163Quest6_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 7 Horde
Inst163Quest7_HORDE = Inst163Quest7
Inst163Quest7_HORDE_Aim = Inst163Quest7_Aim
Inst163Quest7_HORDE_Location = Inst163Quest7_Location
Inst163Quest7_HORDE_Note = Inst163Quest7_Note
Inst163Quest7_HORDE_Prequest = "Nein"
Inst163Quest7_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 8 Horde
Inst163Quest8_HORDE = Inst163Quest8
Inst163Quest8_HORDE_Aim = Inst163Quest8_Aim
Inst163Quest8_HORDE_Location = Inst163Quest8_Location
Inst163Quest8_HORDE_Note = Inst163Quest8_Note
Inst163Quest8_HORDE_Prequest = "Nein"
Inst163Quest8_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 9 Horde
Inst163Quest9_HORDE = Inst163Quest9
Inst163Quest9_HORDE_Aim = Inst163Quest9_Aim
Inst163Quest9_HORDE_Location = Inst163Quest9_Location
Inst163Quest9_HORDE_Note = Inst163Quest9_Note
Inst163Quest9_HORDE_Prequest = "Blut f�r den Wolf"
Inst163Quest9_HORDE_Folgequest = "Das Rabenauge"
Inst163Quest9PreQuest_HORDE = "true"
--
-- Awards Order Resources

--Quest 10 Horde
Inst163Quest10_HORDE = Inst163Quest10
Inst163Quest10_HORDE_Aim = Inst163Quest10_Aim
Inst163Quest10_HORDE_Location = Inst163Quest10_Location
Inst163Quest10_HORDE_Note = Inst163Quest10_Note
Inst163Quest10_HORDE_Prequest = "Nein"
Inst163Quest10_HORDE_Folgequest = "Nein"
-- Reward varies for each class



--------------- INST164 - Neltharion's Lair ---------------

Inst164Caption = "Neltharions Hort"
Inst164QAA = "8 Quests"
Inst164QAH = "8 Quests"

--Quest 1 Alliance
Inst164Quest1 = "1. Neltharions Hort"
Inst164Quest1_Aim = "Defeat Dargrul in Neltharion's Lair."
Inst164Quest1_Location = "Neltharions Hort (Automatische Annahme)"
Inst164Quest1_Note = Inst157Quest1_Location
Inst164Quest1_Prequest = "Nein"
Inst164Quest1_Folgequest = "Nein"
--
Inst164Quest1name1 = "Truhe des schwarzen Gro�drachen"

--Quest 2 Alliance
Inst164Quest2 = "2. Neltharions Hort (Heroisch)"
Inst164Quest2_Aim = "Defeat Dargrul in Neltharions Hort auf dem Schwierigkeitsgrad 'Heroisch' oder h�her."
Inst164Quest2_Location = Inst164Quest1_Location
Inst164Quest2_Note = Inst157Quest1_Location
Inst164Quest2_Prequest = "Nein"
Inst164Quest2_Folgequest = "Nein"
--
Inst164Quest2name1 = Inst164Quest1name1

--Quest 3 Alliance
Inst164Quest3 = "3. Neltharions Hort (Mythisch)"
Inst164Quest3_Aim = "Defeat Dargrul in Neltharions Hort auf dem Schwierigkeitsgrad 'Mythisch'."
Inst164Quest3_Location = Inst164Quest1_Location
Inst164Quest3_Note = Inst157Quest1_Location
Inst164Quest3_Prequest = "Nein"
Inst164Quest3_Folgequest = "Nein"
--
Inst164Quest3name1 = Inst164Quest1name1

--Quest 4 Alliance
Inst164Quest4 = "4. Neltharions Hort: Verseuchte Fledermaus"
Inst164Quest4_Aim = "Besiegt Ragoul get�tet und Dargrul den Unterk�nig."
Inst164Quest4_Location = ""
Inst164Quest4_Note = AQ_WORLDDUNGEONQUEST
Inst164Quest4_Prequest = "Nein"
Inst164Quest4_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 5 Alliance
Inst164Quest5 = "5. Neltharions Hort: Dunkelsteinsklaven"
Inst164Quest5_Aim = "T�tet 5 Peitscher des Tiefgesteins und Dargrul den Unterk�nig."
Inst164Quest5_Location = ""
Inst164Quest5_Note = AQ_WORLDDUNGEONQUEST
Inst164Quest5_Prequest = "Nein"
Inst164Quest5_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 6 Alliance
Inst164Quest6 = "6. Neltharions Hort"
Inst164Quest6_Aim = "Beschafft den Hammer von Khaz'goroth zur�ck."
Inst164Quest6_Location = "Mayla Hochberg (Hochberg - Donnertotem; "..YELLOW.."52.5, 65.8"..WHITE..")"
Inst164Quest6_Note = "Der Hammer von Khaz'goroth ist hinter dem Endboss bei "..YELLOW.."[4]"..WHITE.."."
Inst164Quest6_Prequest = "Nein"
Inst164Quest6_Folgequest = "Der Hammer von Khaz'goroth"
Inst164Quest6FQuest = "true"
--
Inst164Quest6name1 = "Faust des Unterk�nigs"

--Quest 7 Alliance
Inst164Quest7 = "7. Hammer von Khaz'goroth"
Inst164Quest7_Aim = "Verwendet den zentralen Teleporter in Dalaran und platziert den Hammer von Khaz'goroth dann in Aegwynns Galerie."
Inst164Quest7_Location = "Hammer von Khaz'goroth (Neltharions Hort; "..YELLOW.."[]"..WHITE..")"
Inst164Quest7_Note = "Vervollst�ndige die Quest im Portraitraum im unteren Abschnitt von Dalaran, benutzt den Teleporter in der Mitte von Dalaran."
Inst164Quest7_Prequest = "Neltharions Hort"
Inst164Quest7_Folgequest = "Nein"
Inst164Quest7PreQuest = "true"
-- Reward varies for each class

--Quest 8 Alliance
Inst164Quest8 = "8. Fehlgeleitet"
Inst164Quest8_Aim = "Begebt Euch zu Neltharions Hort und bergt das uralte Hochbergartefakt."
Inst164Quest8_Location = "Lessah Mondwasser (Hochberg - Donnertotem; "..YELLOW.."45.8, 44.4"..WHITE..")"
Inst164Quest8_Note = "Arch�ologiequest. Das Artefakt ist im Raum vom Endboss bei "..YELLOW.."[4]"..WHITE.."."
Inst164Quest8_Prequest = "Die Geschichte des Hochbergs -> Forschungsnachhilfe"
Inst164Quest8_Folgequest = "Nein"
Inst164Quest8PreQuest = "true"
Inst164Quest8FQuest = "true"
--
Inst164Quest8name1 = "Rethus Speer"


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

--Quest 4 Horde
Inst164Quest4_HORDE = Inst164Quest4
Inst164Quest4_HORDE_Aim = Inst164Quest4_Aim
Inst164Quest4_HORDE_Location = Inst164Quest4_Location
Inst164Quest4_HORDE_Note = Inst164Quest4_Note
Inst164Quest4_HORDE_Prequest = "Nein"
Inst164Quest4_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 5 Horde
Inst164Quest5_HORDE = Inst164Quest5
Inst164Quest5_HORDE_Aim = Inst164Quest5_Aim
Inst164Quest5_HORDE_Location = Inst164Quest5_Location
Inst164Quest5_HORDE_Note = Inst164Quest5_Note
Inst164Quest5_HORDE_Prequest = "Nein"
Inst164Quest5_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 6 Horde
Inst164Quest6_HORDE = Inst164Quest6
Inst164Quest6_HORDE_Aim = Inst164Quest6_Aim
Inst164Quest6_HORDE_Location = Inst164Quest6_Location
Inst164Quest6_HORDE_Note = Inst164Quest6_Note
Inst164Quest6_HORDE_Prequest = "Nein"
Inst164Quest6_HORDE_Folgequest = Inst164Quest6_Folgequest
Inst164Quest6FQuest_HORDE = "true"
--
Inst164Quest6name1_HORDE = Inst164Quest6name1

--Quest 7 Horde
Inst164Quest7_HORDE = Inst164Quest7
Inst164Quest7_HORDE_Aim = Inst164Quest7_Aim
Inst164Quest7_HORDE_Location = Inst164Quest7_Location
Inst164Quest7_HORDE_Note = Inst164Quest7_Note
Inst164Quest7_HORDE_Prequest = Inst164Quest7_Prequest
Inst164Quest7_HORDE_Folgequest = "Nein"
Inst164Quest7PreQuest_HORDE = "true"
-- Reward varies for each class

--Quest 8 Horde
Inst164Quest8_HORDE = Inst164Quest8
Inst164Quest8_HORDE_Aim = Inst164Quest8_Aim
Inst164Quest8_HORDE_Location = Inst164Quest8_Location
Inst164Quest8_HORDE_Note = Inst164Quest8_Note
Inst164Quest8_HORDE_Prequest = Inst164Quest8_Prequest
Inst164Quest8_HORDE_Folgequest = "Nein"
Inst164Quest8PreQuest_HORDE = "true"
--
Inst164Quest8name1_HORDE = "Rethus Speer"



--------------- INST165 - The Arcway ---------------

Inst165Caption = "Der Arkus"
Inst165QAA = "6 Quests"
Inst165QAH = "6 Quests"

--Quest 1 Alliance
Inst165Quest1 = "1. Der Arkus (Mythisch)"
Inst165Quest1_Aim = "Bezwingt Berater Vandros im Arkus auf dem Schwierigkeitsgrad 'Mythisch'."
Inst165Quest1_Location = "Der Arkus (Automatische Annahme)"
Inst165Quest1_Note = Inst157Quest1_Location
Inst165Quest1_Prequest = "Nein"
Inst165Quest1_Folgequest = "Nein"
--
Inst165Quest1name1 = "Nicht gekennzeichnete Truhe aus der Schatzkammer von Suramar"

--Quest 2 Alliance
Inst165Quest2 = "2. The Arcway: Clogged Drain"
Inst165Quest2_Aim = "Defeat Sludge Face and Advisor Vandros in The Arcway."
Inst165Quest2_Location = ""
Inst165Quest2_Note = AQ_WORLDDUNGEONQUEST
Inst165Quest2_Prequest = "Nein"
Inst165Quest2_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 3 Alliance
Inst165Quest3 = "3. Der Arkus: Silberschlange"
Inst165Quest3_Aim = "T�tet Silberschlange und Berater Vandros."
Inst165Quest3_Location = ""
Inst165Quest3_Note = AQ_WORLDDUNGEONQUEST
Inst165Quest3_Prequest = "Nein"
Inst165Quest3_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 4 Alliance
Inst165Quest4 = "4. Der Arkus: Wandernde Seuche"
Inst165Quest4_Aim = "T�tet den Rattenk�nig und Berater Vandros."
Inst165Quest4_Location = ""
Inst165Quest4_Note = AQ_WORLDDUNGEONQUEST
Inst165Quest4_Prequest = "Nein"
Inst165Quest4_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 5 Alliance
Inst165Quest5 = "5. Den Arkus �ffnen"
Inst165Quest5_Aim = "T�tet Berater Vandros im Arkus."
Inst165Quest5_Location = "Erste Arkanistin Thalyssra (Suramar - Shal'aran; "..YELLOW.."36.8, 46.6"..WHITE..")"
Inst165Quest5_Note = "Diese Quest bekommst Du erst wenn Du einen Ruf von 8000 Wohlwollend bei den Nachts�chtigen hast und die Questreihe bis zum Ly'leths Champion gemacht hast.  Nur auf dem Schwierigkeitsgrad Mytisch.\n\nBerater Vandros ist der finale Endboss, bei "..YELLOW.."[5]"..WHITE.."."
Inst165Quest5_Prequest = "Ly'leths Champion"
Inst165Quest5_Folgequest = "Nein"
Inst165Quest5PreQuest = "true"
--
Inst165Quest5name1 = "Foliant des dimensionalen Bewusstseins"

--Quest 6 Alliance
Inst165Quest6 = "6. Lang begrabenes Wissen"
Inst165Quest6_Aim = "Besorgt die Leylinienkarte von Suramar aus dem Arkus."
Inst165Quest6_Location = "Arkanistin Valtrois (Suramar - Shal'aran; "..YELLOW.."37.0, 46.2"..WHITE..")"
Inst165Quest6_Note = "Diese Quest bekommst Du erst wenn Du einen Ruf von 8000 Wohlwollend bei den Nachts�chtigen hast und die Questreihe bis zum Ly'leths Champion gemacht hast.  Nur auf dem Schwierigkeitsgrad Mytisch."
Inst165Quest6_Prequest = "Ly'leths Champion"
Inst165Quest6_Folgequest = "Nein"
Inst165Quest6PreQuest = "true"
-- No Rewards for this quest


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
-- No Rewards for this quest

--Quest 3 Horde
Inst165Quest3_HORDE = Inst165Quest3
Inst165Quest3_HORDE_Aim = Inst165Quest3_Aim
Inst165Quest3_HORDE_Location = Inst165Quest3_Location
Inst165Quest3_HORDE_Note = Inst165Quest3_Note
Inst165Quest3_HORDE_Prequest = "Nein"
Inst165Quest3_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 4 Horde
Inst165Quest4_HORDE = Inst165Quest4
Inst165Quest4_HORDE_Aim = Inst165Quest4_Aim
Inst165Quest4_HORDE_Location = Inst165Quest4_Location
Inst165Quest4_HORDE_Note = Inst165Quest4_Note
Inst165Quest4_HORDE_Prequest = "Nein"
Inst165Quest4_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 5 Horde
Inst165Quest5_HORDE = Inst165Quest5
Inst165Quest5_HORDE_Aim = Inst165Quest5_Aim
Inst165Quest5_HORDE_Location = Inst165Quest5_Location
Inst165Quest5_HORDE_Note = Inst165Quest5_Note
Inst165Quest5_HORDE_Prequest = "Ly'leths Champion"
Inst165Quest5_HORDE_Folgequest = "Nein"
Inst165Quest5PreQuest_HORDE = "true"
--
Inst165Quest5name1_HORDE = Inst165Quest5name1

--Quest 6 Horde
Inst165Quest6_HORDE = Inst165Quest6
Inst165Quest6_HORDE_Aim = Inst165Quest6_Aim
Inst165Quest6_HORDE_Location = Inst165Quest6_Location
Inst165Quest6_HORDE_Note = Inst165Quest6_Note
Inst165Quest6_HORDE_Prequest = "Ly'leths Champion"
Inst165Quest6_HORDE_Folgequest = "Nein"
Inst165Quest6PreQuest_HORDE = "true"
-- No Rewards for this quest



--------------- INST166 - Vault of the Wardens ---------------

Inst166Caption = "Das Verlies der W�chterinnen"
Inst166QAA = "7 Quests"
Inst166QAH = "7 Quests"

--Quest 1 Alliance
Inst166Quest1 = "1. Das Verlies der W�chterinnen"
Inst166Quest1_Aim = "Bezwingt Cordana Teufelsang im Verlies der W�chterinnen."
Inst166Quest1_Location = "Das Verlies der W�chterinnen (Automatische Annahme)"
Inst166Quest1_Note = Inst157Quest1_Location
Inst166Quest1_Prequest = "Nein"
Inst166Quest1_Folgequest = "Nein"
--
Inst166Quest1name1 = "Tasche mit konfiszierten Materialien"

--Quest 2 Alliance
Inst166Quest2 = "2. Das Verlies der W�chterinnen (Heroisch)"
Inst166Quest2_Aim = "Bezwingt Cordana Teufelsang im Verlies der W�chterinnen auf dem Schwierigkeitsgrad 'Heroisch' oder h�her."
Inst166Quest2_Location = Inst166Quest1_Location
Inst166Quest2_Note = Inst157Quest1_Location
Inst166Quest2_Prequest = "Nein"
Inst166Quest2_Folgequest = "Nein"
--
Inst166Quest2name1 = Inst166Quest1name1

--Quest 3 Alliance
Inst166Quest3 = "3. Das Verlies der W�chterinnen (Mythisch)"
Inst166Quest3_Aim = "Bezwingt Cordana Teufelsang im Verlies der W�chterinnen auf dem Schwierigkeitsgrad 'Mythisch'."
Inst166Quest3_Location = Inst166Quest1_Location
Inst166Quest3_Note = Inst157Quest1_Location
Inst166Quest3_Prequest = "Nein"
Inst166Quest3_Folgequest = "Nein"
--
Inst166Quest3name1 = Inst166Quest1name1

--Quest 4 Alliance
Inst166Quest4 = "4. Vault of the Wardens: How'd He Get Up There?"
Inst166Quest4_Aim = "Defeat the Construct and Cordana in the Vault of the Wardens."
Inst166Quest4_Location = ""
Inst166Quest4_Note = AQ_WORLDDUNGEONQUEST
Inst166Quest4_Prequest = "Nein"
Inst166Quest4_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 5 Alliance
Inst166Quest5 = "5. Teufelsversehrter Foliant"
Inst166Quest5_Aim = "Bringt den teufelsversehrten Folianten zu Robert Newhearth in Dalaran."
Inst166Quest5_Location = "Teufelsversehrter Foliant (Das Verlies der W�chterinnen - K�rker des Verr�ters; "..YELLOW.."[5]"..WHITE..")"
Inst166Quest5_Note = "Kehre zur�ck zu Robert Newhearth in Dalaran - Die Violette Zitadelle ("..YELLOW.."25.6, 45.0"..WHITE..")."
Inst166Quest5_Prequest = "Nein"
Inst166Quest5_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 6 Alliance
Inst166Quest6 = "6. D�monengalle"
Inst166Quest6_Aim = "Stellt einen Skaggldrynk her, geht dann zum Verlies der W�chterinnen und taucht den Tiegel in Grimoiras Galle ein."
Inst166Quest6_Location = "Deucus Valdera (Dalaran; "..YELLOW.."41.6, 32.8"..WHITE..")"
Inst166Quest6_Note = "Alchemiequest.  Nimm eine Portion Skaggldrynk mit Dir.  Wird von einem Alchemisten hergestellt.  T�te die ersten beiden Bosse und benutze dann den Tiegel hinter Inquisitor Foltyrium "..YELLOW.."[2]"..WHITE.." N�he der T�r.  Die T�r �ffnet sich und Du kannst dann Grimoira t�ten."
Inst166Quest6_Prequest = "Neue Beschichtung f�r den Tiegel"
Inst166Quest6_Folgequest = "Nein"
Inst166Quest6PreQuest = "true"
-- No Rewards for this quest

--Quest 7 Alliance
Inst166Quest7 = "7. Biegsame Glasr�hren"
Inst166Quest7_Aim = "Bringt die biegsamen Glasr�hren zu Deucus Valdera in Dalaran."
Inst166Quest7_Location = "Grimoira (Das Verlies der W�chterinnen; "..YELLOW.."[2]"..WHITE..")"
Inst166Quest7_Note = "Alchemiequest.  Nach der T�tung von Grimoira hinter der geheimen T�r, wirst Du dies Quest von Grimoira erhalten.  Diese bringt Dich zur�ck zu Deucus Valdera in Dalaran ("..YELLOW.."41.4, 32.8"..WHITE..")."
Inst166Quest7_Prequest = "Nein"
Inst166Quest7_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 8 Alliance
Inst166Quest8 = "8. Vault of the Wardens: Startup Sequence"
Inst166Quest8_Aim = "Complete the startup sequence and defeat Cordana."
Inst166Quest8_Location = ""
Inst166Quest8_Note = AQ_WORLDDUNGEONQUEST
Inst166Quest8_Prequest = "Nein"
Inst166Quest8_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 9 Alliance
Inst166Quest9 = "9. Essen f�r alle"
Inst166Quest9_Aim = "L�scht 15 D�monen aus und gebt 10 fast verhungerten Gefangenen Eure herbeigezauberten Lebensmittel."
Inst166Quest9_Location = "Kalecgos (Suramar; "..YELLOW.."34.2, 83.6"..WHITE..")"
Inst166Quest9_Note = "Magierquest.  Benutze dein Zauber Essen herbeizaubern um Essen zu machen und gebe es dann den Gefangen.  Benutze Kalec's Abbildkristall um die Quest abzugeben."
Inst166Quest9_Prequest = "Nein"
Inst166Quest9_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 10 Alliance
Inst166Quest10 = "10. Der Feind meines Feindes..."
Inst166Quest10_Aim = "Findet Millhaus Manasturm."
Inst166Quest10_Location = ""
Inst166Quest10_Note = "Magierquest.  Questreihe beginnt mit Final Exit."
Inst166Quest10_Prequest = "Final Exit -> Kein zahnloser Drache"
Inst166Quest10_Folgequest = "Nein"
Inst166Quest10PreQuest = "true"
-- No Rewards for this quest

--Quest 11 Alliance
Inst166Quest11 = "11. Entfesselte Gerechtigkeit"
Inst166Quest11_Aim = "Nutzt Eure gesammelte instabile heilige Energie, um die Sognadeln in Kaltarra zu vernichten."
Inst166Quest11_Location = "Abbild von Kalec (Dalaran; "..YELLOW..""..WHITE..")"
Inst166Quest11_Note = "Priesterquest.  Missing information for this quest."
Inst166Quest11_Prequest = "Der Zorn des Lichts -> B�ndigung des heiligen Feuers"
Inst166Quest11_Folgequest = "Die Nexuskammer"
Inst166Quest11PreQuest = "true"
-- No Rewards for this quest

--Quest 12 Alliance
Inst166Quest12 = "12. Befehle aufdecken"
Inst166Quest12_Aim = Inst157Quest6_Aim
Inst166Quest12_Location = Inst157Quest6_Location
Inst166Quest12_Note = Inst157Quest6_Note
Inst166Quest12_HORDE_Prequest = Inst157Quest6_Prequest
Inst166Quest12_Folgequest = "Aura der Ungewissheit"
Inst166Quest12PreQuest = "true"
--
Inst166Quest12name1 = Inst157Quest6name1


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

--Quest 4 Horde
Inst166Quest4_HORDE = Inst166Quest4
Inst166Quest4_HORDE_Aim = Inst166Quest4_Aim
Inst166Quest4_HORDE_Location = Inst166Quest4_Location
Inst166Quest4_HORDE_Note = Inst166Quest4_Note
Inst166Quest4_HORDE_Prequest = "Nein"
Inst166Quest4_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 5 Horde
Inst166Quest5_HORDE = Inst166Quest5
Inst166Quest5_HORDE_Aim = Inst166Quest5_Aim
Inst166Quest5_HORDE_Location = Inst166Quest5_Location
Inst166Quest5_HORDE_Note = Inst166Quest5_Note
Inst166Quest5_HORDE_Prequest = "Nein"
Inst166Quest5_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 6 Horde
Inst166Quest6_HORDE = Inst166Quest6
Inst166Quest6_HORDE_Aim = Inst166Quest6_Aim
Inst166Quest6_HORDE_Location = Inst166Quest6_Location
Inst166Quest6_HORDE_Note = Inst166Quest6_Note
Inst166Quest6_HORDE_Prequest = Inst166Quest6_Prequest
Inst166Quest6_HORDE_Folgequest = "Nein"
Inst166Quest6PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 7 Horde
Inst166Quest7_HORDE = Inst166Quest7
Inst166Quest7_HORDE_Aim = Inst166Quest7_Aim
Inst166Quest7_HORDE_Location = Inst166Quest7_Location
Inst166Quest7_HORDE_Note = Inst166Quest7_Note
Inst166Quest7_HORDE_Prequest = "Nein"
Inst166Quest7_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 8 Horde
Inst166Quest8_HORDE = Inst166Quest8
Inst166Quest8_HORDE_Aim = Inst166Quest8_Aim
Inst166Quest8_HORDE_Location = Inst166Quest8_Location
Inst166Quest8_HORDE_Note = Inst166Quest8_Note
Inst166Quest8_HORDE_Prequest = Nein
Inst166Quest8_HORDE_Folgequest = Nein
-- No Rewards for this quest

--Quest 9 Horde
Inst166Quest9_HORDE = Inst166Quest9
Inst166Quest9_HORDE_Aim = Inst166Quest9_Aim
Inst166Quest9_HORDE_Location = Inst166Quest9_Location
Inst166Quest9_HORDE_Note = Inst166Quest9_Note
Inst166Quest9_HORDE_Prequest = Nein
Inst166Quest9_HORDE_Folgequest = Nein
-- No Rewards for this quest

--Quest 10 Horde
Inst166Quest10_HORDE = Inst166Quest10
Inst166Quest10_HORDE_Aim = Inst166Quest10_Aim
Inst166Quest10_HORDE_Location = Inst166Quest10_Location
Inst166Quest10_HORDE_Note = Inst166Quest10_Note
Inst166Quest10_HORDE_Prequest = Inst166Quest10_Prequest
Inst166Quest10_HORDE_Folgequest = Nein
Inst166Quest10PreQuest_HORDE = Inst166Quest10PreQuest
-- No Rewards for this quest

--Quest 11 Horde
Inst166Quest11_HORDE = Inst166Quest11
Inst166Quest11_HORDE_Aim = Inst166Quest11_Aim
Inst166Quest11_HORDE_Location = Inst166Quest11_Location
Inst166Quest11_HORDE_Note = Inst166Quest11_Note
Inst166Quest11_HORDE_Prequest = Inst166Quest11_Prequest
Inst166Quest11_HORDE_Folgequest = Inst166Quest11_Folgequest
Inst166Quest11PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 12 Horde
Inst166Quest12_HORDE = Inst166Quest12
Inst166Quest12_HORDE_Aim = Inst166Quest12_Aim
Inst166Quest12_HORDE_Location = Inst166Quest12_Location
Inst166Quest12_HORDE_Note = Inst166Quest12_Note
Inst166Quest12_HORDE_Prequest = Inst166Quest12_Prequest
Inst166Quest12_HORDE_Folgequest = Inst166Quest12_Folgequest
Inst166Quest12PreQuest_HORDE = "true"
--
Inst166Quest12name1_HORDE = Inst166Quest12name1



--------------- INST167 - The Emerald Nightmare ---------------

Inst167Caption = "Der Smaragdgr�ne Alptraum"
Inst167QAA = "4 Quests"
Inst167QAH = "4 Quests"

--Quest 1 Alliance
Inst167Quest1 = "1. Den Schleier l�ften (Normal)"
Inst167Quest1_Aim = "Sammelt 4 Essenzen der Klarheit von Cenarius im Smaragdgr�nen Alptraum auf dem Schwierigkeitsgrad Normal."
Inst167Quest1_Location = "Malfurion Sturmgrimm (Der Smaragdgr�ne Alptraum; "..GREEN.."[1']"..WHITE..")"
Inst167Quest1_Note = "Besiege Cenarius bei "..YELLOW.."[6]"..WHITE.." um eine Essenz der Klarheit zu sammeln.  Nach dem sammeln von 4 Essenzen, kannst du bei Malfurion die F�higkeit einschalten alle Bosse zu �berspringen und gleich zu Cenarius zu gelangen."
Inst167Quest1_Prequest = "Nein"
Inst167Quest1_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 2 Alliance
Inst167Quest2 = "2. Den Schleier l�ften (Heroisch)"
Inst167Quest2_Aim = "Sammelt 4 Essenzen der Klarheit von Cenarius im Smaragdgr�nen Alptraum auf dem Schwierigkeitsgrad Heroisch."
Inst167Quest2_Location = Inst167Quest1_Location
Inst167Quest2_Note = Inst167Quest1_Note
Inst167Quest2_Prequest = "Nein"
Inst167Quest2_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 3 Alliance
Inst167Quest3 = "3. Den Schleier l�ften (Mythisch)"
Inst167Quest3_Aim = "Sammelt 4 Essenzen der Klarheit von Cenarius im Smaragdgr�nen Alptraum auf dem Schwierigkeitsgrad Mythisch."
Inst167Quest3_Location = Inst167Quest1_Location
Inst167Quest3_Note = Inst167Quest1_Note
Inst167Quest3_Prequest = "Nein"
Inst167Quest3_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 4 Alliance
Inst167Quest4 = "4. Der Stoff der Tr�ume"
Inst167Quest4_Aim = "Sammelt gel�uterte Lebensessenz w�hrend eines Schlachtzugs im Smaragdgr�nen Alptraum."
Inst167Quest4_Location = "Talwandler Farodin (Suramar; "..YELLOW.."36.8, 46.6"..WHITE..")"
Inst167Quest4_Note = "Die gel�uterte Lebensessenzen drppen von Xavius bei "..YELLOW.."[7]"..WHITE..".  Um diese Quest machen zu k�nnen musst Du vorher 7000 Rufpunkte auf Respektvoll gesammelt haben bei der Fraktion Die Nachts�chtigen."
Inst167Quest4_Prequest = "Nein"
Inst167Quest4_Folgequest = "Nein"
--
Inst167Quest4name1 = "Traumtr�ne"


--Quest 1 Horde
Inst167Quest1_HORDE = Inst167Quest1
Inst167Quest1_HORDE_Aim = Inst167Quest1_Aim
Inst167Quest1_HORDE_Location = Inst167Quest1_Location
Inst167Quest1_HORDE_Note = Inst167Quest1_Note
Inst167Quest1_HORDE_Prequest = "Nein"
Inst167Quest1_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 2 Horde
Inst167Quest2_HORDE = Inst167Quest2
Inst167Quest2_HORDE_Aim = Inst167Quest2_Aim
Inst167Quest2_HORDE_Location = Inst167Quest2_Location
Inst167Quest2_HORDE_Note = Inst167Quest2_Note
Inst167Quest2_HORDE_Prequest = "Nein"
Inst167Quest2_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 3 Horde
Inst167Quest3_HORDE = Inst167Quest3
Inst167Quest3_HORDE_Aim = Inst167Quest3_Aim
Inst167Quest3_HORDE_Location = Inst167Quest3_Location
Inst167Quest3_HORDE_Note = Inst167Quest3_Note
Inst167Quest3_HORDE_Prequest = "Nein"
Inst167Quest3_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 4 Horde
Inst167Quest4_HORDE = Inst167Quest4
Inst167Quest4_HORDE_Aim = Inst167Quest4_Aim
Inst167Quest4_HORDE_Location = Inst167Quest4_Location
Inst167Quest4_HORDE_Note = Inst167Quest4_Note
Inst167Quest4_HORDE_Prequest = "Nein"
Inst167Quest4_HORDE_Folgequest = "Nein"
--
Inst167Quest4name1_HORDE = "Traumtr�ne"


--------------- INST168 - The Nighthold ---------------

Inst168Caption = "The Nighthold"
Inst168QAA = "Keine Quests"
Inst168QAH = "Keine Quests"



--------------- INST169 - Karazhan (Legion) ---------------

Inst169Caption = "Karazhan"
Inst169QAA = "9 Quests"
Inst169QAH = "9 Quests"

--Quest 1 Alliance
Inst169Quest1 = "1. Im Auge des Betrachters"
Inst169Quest1_Aim = "Bezwingt Viz'aduum den Beobachter in Karazhan."
Inst169Quest1_Location = "Erzmagier Khadgar (Gebirgspass der Totenwinde - Karazhan; "..YELLOW.."47.0, 75.4"..WHITE..")"
Inst169Quest1_Note = "Viz'aduum der Beobchter ist bei "..YELLOW.."[10]"..WHITE..".  Erzmagier Khadgar erscheint nachdem der Boss besiegt wurde um die Quest dann abgeben zu k�nnen."
Inst169Quest1_Prequest = "Nein"
Inst169Quest1_Folgequest = "Nein"
--
Inst169Quest1name1 = "Viz'aduums Auge"

--Quest 2 Alliance
Inst169Quest2 = "2. Fragmente der Vergangenheit"
Inst169Quest2_Aim = "Sammelt die Seelenfragmente aus den G�stezimmern, dem Bankettsaal, den Bedienstetenunterk�nften, dem Opernsaal und der Menagerie in Karazhan."
Inst169Quest2_Location = Inst169Quest1_Location
Inst169Quest2_Note = "Die Fragmente sind �berall verteilt in der Dungeon.  Ein Klick und Du hast es gesammelt.  Erzmagier Khadgar erscheint nachdem der Endboss besiegt wurde und kannst die Quest dann abgeben."
Inst169Quest2_Prequest = "Nein"
Inst169Quest2_Folgequest = "Nein"
--
Inst169Quest2name1 = "Violetter Siegelring des Erzmagiers "

--Quest 3 Alliance
Inst169Quest3 = "3. B�cherwyrms"
Inst169Quest3_Aim = "Hebt B�cher in der Bibliothek von Karazhan auf."
Inst169Quest3_Location = "Magier Darius (Gebirgspass der Totenwinde - Karazhan; "..YELLOW.."47.0, 75.4"..WHITE..")"
Inst169Quest3_Note = ""
Inst169Quest3_Prequest = "Nein"
Inst169Quest3_Folgequest = "Neustart des Aufr�umers"
-- No Rewards for this quest

--Quest 4 Alliance
Inst169Quest4 = "4. Neustart des Aufr�umers"
Inst169Quest4_Aim = "Deaktiviert den Kurator und sucht nach der Kiste mit �briggebliebenen Motivationskristallen."
Inst169Quest4_Location = ""
Inst169Quest4_Note = "The Box of Spare Motivator Crystals is in the back left side of the room after defeating the Curator, at "..YELLOW.."[6]"..WHITE.."."
Inst169Quest4_Prequest = "B�cherwyrms"
Inst169Quest4_Folgequest = "Hei�e Eisen"
Inst169Quest4FQuest = "true"
--
Inst169Quest4name1 = "Violetter Siegelring des Erzmagiers "

--Quest 5 Alliance
Inst169Quest5 = "5. Hei�e Eisen"
Inst169Quest5_Aim = "Bringt die Kiste mit 'neuen' Hufeisen zu Koren dem Schmied in Karazhan."
Inst169Quest5_Location = ""
Inst169Quest5_Note = ""
Inst169Quest5_Prequest = "Neustart des Aufr�umers"
Inst169Quest5_Folgequest = "Palaver in der Pause"
Inst169Quest5FQuest = "true"
-- No Rewards for this quest

--Quest 6 Alliance
Inst169Quest6 = "6. Palaver in der Pause"
Inst169Quest6_Aim = "Helft Darius, die verletzten Egos der alten Ensemblemitglieder zu beruhigen. Treibt eine positive Kritik eines Zuschauers auf, um die Spannungen zwischen Romulo und Julianne zu beruhigen, stehlt ein Rosenbouquet von einem der neuen St�cke, um dem Blechkopf wieder etwas Selbstvertrauen zu geben und findet heraus, wo Rotk�ppchens Vertretung ihr K�ppchen im Schachsaal versteckt hat."
Inst169Quest6_Location = ""
Inst169Quest6_Note = ""
Inst169Quest6_Prequest = "Hei�e Eisen"
Inst169Quest6_Folgequest = "Schluss mit der Spinnerei"
Inst169Quest6FQuest = "true"
--
Inst169Quest6name1 = Inst169Quest2name1

--Quest 7 Alliance
Inst169Quest7 = "7. Schluss mit der Spinnerei"
Inst169Quest7_Aim = "T�tet die Spinnen in den Bedienstetenunterk�nften."
Inst169Quest7_Location = ""
Inst169Quest7_Note = "Nach Beendigung der Quest, t�te Schrecken der Nacht bei "..YELLOW.."[]"..WHITE.." und nehme den Gegenstandand von ihm ab um die n�chste Quest zu starten."
Inst169Quest7_Prequest = "Palaver in der Pause"
Inst169Quest7_Folgequest = "No Bones About It"
Inst169Quest7FQuest = "true"
-- No Rewards for this quest

--Quest 8 Alliance
Inst169Quest8 = "8. No Bones About It"
Inst169Quest8_Aim = "Bring das Verkohlte Knochenfragmente zu Darius."
Inst169Quest8_Location = ""
Inst169Quest8_Note = ""
Inst169Quest8_Prequest = "Schluss mit der Spinnerei"
Inst169Quest8_Folgequest = "Nein"
Inst169Quest8FQuest = "true"
--
Inst169Quest8name1 = "Violetter Siegelring des Gro�magus"

--Quest 9 Alliance
Inst169Quest9 = "9. Der Turm der Macht"
Inst169Quest9_Aim = "Bezwingt Viz'aduum den Beobachter in Karazhan auf dem Schwierigkeitsgrad Mythisch."
Inst169Quest9_Location = "Obtained from Order Hall mission."
Inst169Quest9_Note = "Viz'aduum the Watcher is at "..YELLOW.."[10]"..WHITE..".  Turn in the completed quest in your Order Hall."
Inst169Quest9_Prequest = "Nein"
Inst169Quest9_Folgequest = "Nein"
--
Inst169Quest9name1 = "Schimmerndes B�ndel"


--Quest 1 Horde
Inst169Quest1_HORDE = Inst169Quest1
Inst169Quest1_HORDE_Aim = Inst169Quest1_Aim
Inst169Quest1_HORDE_Location = Inst169Quest1_Location
Inst169Quest1_HORDE_Note = Inst169Quest1_Note
Inst169Quest1_HORDE_Prequest = "Nein"
Inst169Quest1_HORDE_Folgequest = "Nein"
--
Inst169Quest1name1_HORDE = Inst169Quest1name1

--Quest 2 Horde
Inst169Quest2_HORDE = Inst169Quest2
Inst169Quest2_HORDE_Aim = Inst169Quest2_Aim
Inst169Quest2_HORDE_Location = Inst169Quest2_Location
Inst169Quest2_HORDE_Note = Inst169Quest2_Note
Inst169Quest2_HORDE_Prequest = "Nein"
Inst169Quest2_HORDE_Folgequest = "Nein"
--
Inst169Quest2name1_HORDE = Inst169Quest2name1

--Quest 3 Horde
Inst169Quest3_HORDE = Inst169Quest3
Inst169Quest3_HORDE_Aim = Inst169Quest3_Aim
Inst169Quest3_HORDE_Location = Inst169Quest3_Location
Inst169Quest3_HORDE_Note = Inst169Quest3_Note
Inst169Quest3_HORDE_Prequest = "Nein"
Inst169Quest3_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 4 Horde
Inst169Quest4_HORDE = Inst169Quest4
Inst169Quest4_HORDE_Aim = Inst169Quest4_Aim
Inst169Quest4_HORDE_Location = Inst169Quest4_Location
Inst169Quest4_HORDE_Note = Inst169Quest4_Note
Inst169Quest4_HORDE_Prequest = "B�cherwyrms"
Inst169Quest4_HORDE_Folgequest = "Hei�e Eisen"
Inst169Quest4FQuest_HORDE = "true"
--
Inst169Quest4name1_HORDE = Inst169Quest4name1

--Quest 5 Horde
Inst169Quest5_HORDE = Inst169Quest5
Inst169Quest5_HORDE_Aim = Inst169Quest5_Aim
Inst169Quest5_HORDE_Location = Inst169Quest5_Location
Inst169Quest5_HORDE_Note = Inst169Quest5_Note
Inst169Quest5_HORDE_Prequest = Inst169Quest5_Prequest
Inst169Quest5_HORDE_Folgequest = Inst169Quest5_Folgequest
Inst169Quest5FQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 6 Horde
Inst169Quest6_HORDE = Inst169Quest6
Inst169Quest6_HORDE_Aim = Inst169Quest6_Aim
Inst169Quest6_HORDE_Location = Inst169Quest6_Location
Inst169Quest6_HORDE_Note = Inst169Quest6_Note
Inst169Quest6_HORDE_Prequest = "Hei�e Eisen"
Inst169Quest6_HORDE_Folgequest = Inst169Quest6_Folgequest
Inst169Quest6FQuest_HORDE = "true"
--
Inst169Quest6name1_HORDE = Inst169Quest6name1

--Quest 7 Horde
Inst169Quest7_HORDE = Inst169Quest7
Inst169Quest7_HORDE_Aim = Inst169Quest7_Aim
Inst169Quest7_HORDE_Location = Inst169Quest7_Location
Inst169Quest7_HORDE_Note = Inst169Quest7_Note
Inst169Quest7_HORDE_Prequest = Inst169Quest7_Prequest
Inst169Quest7_HORDE_Folgequest = Inst169Quest7_Folgequest
Inst169Quest7FQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 8 Horde
Inst169Quest8_HORDE = Inst169Quest8
Inst169Quest8_HORDE_Aim = Inst169Quest8_Aim
Inst169Quest8_HORDE_Location = Inst169Quest8_Location
Inst169Quest8_HORDE_Note = Inst169Quest8_Note
Inst169Quest8_HORDE_Prequest = Inst169Quest8_Prequest
Inst169Quest8_HORDE_Folgequest = "Nein"
Inst169Quest8FQuest_HORDE = "true"
--
Inst169Quest8name1_HORDE = Inst169Quest8name1

--Quest 9 Horde
Inst169Quest9_HORDE = Inst169Quest9
Inst169Quest9_HORDE_Aim = Inst169Quest9_Aim
Inst169Quest9_HORDE_Location = Inst169Quest9_Location
Inst169Quest9_HORDE_Note = Inst169Quest9_Note
Inst169Quest9_HORDE_Prequest = "Nein"
Inst169Quest9_HORDE_Folgequest = "Nein"
--
Inst169Quest9name1_HORDE = Inst169Quest9name1



--------------- INST170 - Trial of Valor ---------------

Inst170Caption = "Pr�fung der Tapferkeit"
Inst170QAA = "3 Quests"
Inst170QAH = "3 Quests"

--Quest 1 Alliance
Inst170Quest1 = "1. Odyns Gunst"
Inst170Quest1_Aim = "Sichert Euch Odyns Gunst im Schlachtzug 'Die Pr�fung der Tapferkeit'."
Inst170Quest1_Location = "Havi (Sturmheim - Valdisdall; "..YELLOW.."60.2, 50.8"..WHITE..")"
Inst170Quest1_Note = "Besiege Odyn bei "..YELLOW.."[3]"..WHITE.." um seine Gunst zu erlangen und diese Quest zu beenden.  Kann auf jeder Schwierigkeit abgeschlossen werden."
Inst170Quest1_Prequest = "Zum Handeln gezwungen -> Helyas Eroberung"
Inst170Quest1_Folgequest = "Odyns Urteil"
Inst170Quest1PreQuest = "true"
--
Inst170Quest1name1 = "Gnade des Titanen"

--Quest 2 Alliance
Inst170Quest2 = "2. Odyns Urteil"
Inst170Quest2_Aim = "Bezwingt Helya im Schlachtzug 'Die Pr�fung der Tapferkeit'."
Inst170Quest2_Location = "Odyn (Pr�fung der Tapferkeit; "..YELLOW.."[3]"..WHITE..")"
Inst170Quest2_Note = "Helya ist bei "..YELLOW.."[5]"..WHITE..".  Kann auf jeder Schwierigkeit abgeschlossen werden."
Inst170Quest2_Prequest = "Odyns Gunst"
Inst170Quest2_Folgequest = "Nein"
Inst170Quest2FQuest = "true"
--
Inst170Quest2name1 = "Daune der gefallenen Val'kyr"

--Quest 3 Alliance
Inst170Quest3 = "3. Die verlorene Armee"
Inst170Quest3_Aim = "Sammelt 1000 Seelenfragmente der Valarjar innerhalb des Schlachtzugs 'Die Pr�fung der Tapferkeit'."
Inst170Quest3_Location = "Odyn (Pr�fung der Tapferkeit; "..YELLOW.."[3]"..WHITE..")"
Inst170Quest3_Note = "Diese droppen von Helyas Schergen und von Helya selbst.  Ben�tigt normale oder h�here Schwierigkeit."
Inst170Quest3_Prequest = "Nein"
Inst170Quest3_Folgequest = "Nein"
-- Reward varies for each class


--Quest 1 Horde
Inst170Quest1_HORDE = Inst170Quest1
Inst170Quest1_HORDE_Aim = Inst170Quest1_Aim
Inst170Quest1_HORDE_Location = Inst170Quest1_Location
Inst170Quest1_HORDE_Note = Inst170Quest1_Note
Inst170Quest1_HORDE_Prequest = Inst170Quest1_Prequest
Inst170Quest1_HORDE_Folgequest = "Odyns Urteil"
Inst170Quest1PreQuest_HORDE = "true"
--
Inst170Quest1name1_HORDE = Inst170Quest1name1

--Quest 2 Horde
Inst170Quest2_HORDE = Inst170Quest2
Inst170Quest2_HORDE_Aim = Inst170Quest2_Aim
Inst170Quest2_HORDE_Location = Inst170Quest2_Location
Inst170Quest2_HORDE_Note = Inst170Quest2_Note
Inst170Quest2_HORDE_Prequest = "Odyns Gunst"
Inst170Quest2_HORDE_Folgequest = "Nein"
Inst170Quest2FQuest_HORDE = "true"
--
Inst170Quest2name1_HORDE = Inst170Quest2name1

--Quest 3 Horde
Inst170Quest3_HORDE = Inst170Quest3
Inst170Quest3_HORDE_Aim = Inst170Quest3_Aim
Inst170Quest3_HORDE_Location = Inst170Quest3_Location
Inst170Quest3_HORDE_Note = Inst170Quest3_Note
Inst170Quest3_HORDE_Prequest = "Nein"
Inst170Quest3_HORDE_Folgequest = "Nein"
-- Reward varies for each class



--------------- INST171 - Tomb of Sargeras ---------------

Inst171Caption = "Tomb of Sargeras"
Inst171QAA = "Keine Quests"
Inst171QAH = "Keine Quests"








end
-- End of File
