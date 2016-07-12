﻿-- $Id: Atlas_WorldEvents-ptBR.lua 85 2016-07-06 15:08:55Z arith $
--[[

	Atlas World Events, a World of Warcraft map browser for world events
	Copyright 2011 ~ 2016 Arith Hsu

	This file is a plugin of Atlas.

	Atlas World Events is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	Atlas World Events is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with Atlas; if not, write to the Free Software
	Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

--]]

local AceLocale = LibStub:GetLibrary("AceLocale-3.0");
local L = AceLocale:NewLocale("Atlas_WorldEvents", "ptBR", false);

if L then
-- L["A Cloudlet of Classy Cologne"] = ""
-- L["A Friendly Chat..."] = ""
-- L["A gift for a Lord of Ironforge"] = ""
-- L["A gift for a Lord of Stormwind"] = ""
-- L["A Gift for the Banshee Queen"] = ""
-- L["A Gift for the High Chieftain"] = ""
-- L["A Gift for the High Priestess of Elune"] = ""
-- L["A Gift for the Prophet"] = ""
-- L["A Gift for the Regent Lord of Quel'Thalas"] = ""
-- L["A Gift for the Warchief"] = ""
-- L["Aimee <Pie, Pastry & Cakes>"] = ""
-- L["Alliance Questline"] = ""
-- L["A New Supplier of Souvenirs"] = ""
-- L["A Perfect Puff of Perfume"] = ""
-- L["A Smokywood Pastures' Thank You!"] = ""
-- L["Baine Bloodhoof"] = ""
-- L["Bark for Drohn's Distillery!"] = ""
-- L["Bark for T'chali's Voodoo Brewery!"] = ""
-- L["Bark for the Barleybrews!"] = ""
-- L["Bark for the Thunderbrews!"] = ""
-- L["Baruma <Replica Armor Prizes>"] = ""
-- L["Barum <Replica Armor Prizes>"] = ""
-- L["Becan Barleybrew"] = ""
-- L["Belbi Quikswitch"] = ""
-- L["Bizzle Quicklift"] = ""
-- L["Blix Fixwidget"] = ""
-- L["Blood Elf Commoner"] = ""
L["Blue: "] = "Azul:" -- Needs review
-- L["Bok Dropcertain"] = ""
-- L["Bonbon Blitz"] = ""
-- L["Boomie Sparks <Fireworks>"] = ""
-- L["Boxey Boltspinner"] = ""
L["Brewfest"] = "CervaFest" -- Needs review
L["Brewfest!"] = "CervaFest!" -- Needs review
-- L["Brewfest_Date"] = ""
-- L["Brew For Brewfest"] = ""
-- L["Brew of the Month Club"] = ""
-- L["Candy Buckets"] = ""
-- L["Catch the Wild Wolpertinger!"] = ""
-- L["Chronos <He Who Never Forgets!>"] = ""
-- L["Chug and Chuck!"] = ""
-- L["Cort Gorestein"] = ""
-- L["Costumed Orphan Matron"] = ""
-- L["Crushing the Crown"] = ""
-- L["Daenrand Dawncrest <Heirloom Prizes>"] = ""
-- L["Daily Group"] = ""
-- L["Daily Quest"] = ""
-- L["Daran Thunderbrew"] = ""
-- L["Darkfeather the Elder"] = ""
-- L["Dark Iron Mole Machine Wreckage"] = ""
-- L["Darkspear Gumdrop"] = ""
-- L["Darnassus Marzipan"] = ""
-- L["Detective Snap Snagglebolt"] = ""
-- L["Draenei Commoner"] = ""
-- L["Driz Tumblequick"] = ""
-- L["Dwarf Commoner"] = ""
L["Elder Arp"] = "Ancião Arp" -- Needs review
L["Elder Beldak"] = "Elder Beldak" -- Needs review
L["Elder Bellowrage"] = "Ancião Vocifúria" -- Needs review
L["Elder Bladeleaf"] = "Ancião Folhâmina" -- Needs review
L["Elder Bladesing"] = "Anciã Chialâmina" -- Needs review
L["Elder Bladeswift"] = "Ancião Açolesto" -- Needs review
L["Elder Bloodhoof"] = "Ancião Casco Sangrento" -- Needs review
L["Elder Bluewolf"] = "Ancião Lobo Azul" -- Needs review
L["Elder Brightspear"] = "Anciã Setalume" -- Needs review
L["Elder Bronzebeard"] = "Ancião Barbabronze" -- Needs review
L["Elder Chogan'gada"] = "Ancião Chogan'gada" -- Needs review
L["Elder Darkcore"] = "Ancião Negrocerne" -- Needs review
L["Elder Darkhorn"] = "Anciã Chifre Preto" -- Needs review
L["Elder Dawnstrider"] = "Anciã Andarilha da Aurora" -- Needs review
-- L["Elder Deepforge"] = ""
L["Elder Dreamseer"] = "Vidente Onírico Ancião" -- Needs review
L["Elder Ezra Wheathoof"] = "Ancião Ezra Casco de Trigo" -- Needs review
L["Elder Fargal"] = "Ancião Fargal" -- Needs review
L["Elder Farwhisper"] = "Ancião Murmulonge" -- Needs review
L["Elder Goldwell"] = "Ancião Poçodouro" -- Needs review
L["Elder Graveborn"] = "Ancião Nascitumba" -- Needs review
L["Elder Graymane"] = "Ancião Pelo Pardo" -- Needs review
L["Elder Hammershout"] = "Ancião Malhogrito" -- Needs review
L["Elder High Mountain"] = "Ancião Monte Alto" -- Needs review
L["Elder Highpeak"] = "Ancião Topoalto" -- Needs review
L["Elder Igasho"] = "Ancião Igasho" -- Needs review
L["Elder Ironband"] = "Ancião Bandaferro" -- Needs review
L["Elder Jarten"] = "Ancião Jarten" -- Needs review
L["Elder Kilias"] = "Ancião Kilias" -- Needs review
L["Elder Lunaro"] = "Ancião Lunaro" -- Needs review
L["Elder Meadowrun"] = "Anciã Correcampo" -- Needs review
L["Elder Mistwalker"] = "Anciã Andanévoa" -- Needs review
L["Elder Moonstrike"] = "Anciã Raioluna" -- Needs review
L["Elder Moonwarden"] = "Ancião Velaluna" -- Needs review
L["Elder Morndeep"] = "Ancião Alvafunda" -- Needs review
L["Elder Morningdew"] = "Anciã Serenalva" -- Needs review
L["Elder Morthie"] = "Ancião Morthie" -- Needs review
L["Elder Muraco"] = "Ancião Muraco" -- Needs review
L["Elder Nightwind"] = "Ancião Noctéolas" -- Needs review
L["Elder Northal"] = "Ancião Northal" -- Needs review
L["Elder Nurgen"] = "Ancião Nurgen" -- Needs review
L["Elder Obsidian"] = "Ancião Obsidiano" -- Needs review
L["Elder Ohanzee"] = "Ancião Ohanzi" -- Needs review
-- L["Elder Pamuya"] = ""
-- L["Elder Primestone"] = ""
-- L["Elder Ragetotem"] = ""
-- L["Elder Riversong"] = ""
-- L["Elder Rumblerock"] = ""
-- L["Elder Sandrene"] = ""
-- L["Elder Sardis"] = ""
-- L["Elder Silvervein"] = ""
-- L["Elder Skychaser"] = ""
-- L["Elder Skygleam"] = ""
-- L["Elder Skyseer"] = ""
-- L["Elder Skywarden"] = ""
-- L["Elder Snowcrown"] = ""
-- L["Elder Splitrock"] = ""
-- L["Elder Starglade"] = ""
-- L["Elder Starsong"] = ""
-- L["Elder Starweave"] = ""
-- L["Elder Stonebeard"] = ""
-- L["Elder Stonebrand"] = ""
-- L["Elder Stonefort"] = ""
-- L["Elder Stonespire"] = ""
-- L["Elder Stormbrow"] = ""
-- L["Elder Tauros"] = ""
-- L["Elder Thoim"] = ""
-- L["Elder Thunderhorn"] = ""
-- L["Elder Wanikaya"] = ""
-- L["Elder Whurain"] = ""
-- L["Elder Wildmane"] = ""
-- L["Elder Windrun"] = ""
-- L["Elder Windtotem"] = ""
-- L["Elder Winterhoof"] = ""
-- L["Elder Yurauk"] = ""
-- L["End"] = ""
-- L["Entrance (Transported)"] = ""
-- L["Evershade the Elder"] = ""
-- L["Faded Lovely Greeting Card"] = ""
-- L["Fariel Starsong"] = ""
-- L["Feast of Winter Veil"] = ""
-- L["Finlay Coolshot <Tonk Challenge>"] = ""
-- L["Firebeard the Elder"] = ""
-- L["Fire Brigade Practice"] = ""
-- L["Fire Training"] = ""
-- L["Fireworks At The Gilded Rose"] = ""
-- L["Flynn Firebrew"] = ""
-- L["Forsaken Commoner"] = ""
-- L["Furmund"] = ""
-- L["Gelvas Grimegate <Souvenir & Toy Prizes>"] = ""
-- L["Glodrak Huntsniper"] = ""
-- L["Gnome Commoner"] = ""
-- L["Gnomeregan Gumdrop"] = ""
-- L["Goldark Snipehunter"] = ""
-- L["Goli Krumn"] = ""
-- L["Gotri's Traveling Gear"] = ""
-- L["Great-father Winter"] = ""
-- L["Greatfather Winter"] = ""
-- L["Great-father Winter is Here!"] = ""
-- L["Greatfather Winter is Here!"] = ""
-- L["Grimtotem Elder"] = ""
-- L["Hallow_Date"] = ""
-- L["Hallow's End"] = ""
-- L["Hallow's End Treats for Jesper!"] = ""
-- L["Hallow's End Treats for Spoops!"] = ""
-- L["Harvest_Date"] = ""
-- L["Harvest Festival"] = ""
-- L["He Shoots, He Scores!"] = ""
-- L["Historian Karnik"] = ""
-- L["Honoring a Hero"] = ""
-- L["Horde Questline"] = ""
-- L["Hot On The Trail"] = ""
-- L["Human Commoner"] = ""
-- L["Innkeeper Allison"] = ""
-- L["Innkeeper Firebrew"] = ""
-- L["Innkeeper Gryshka"] = ""
-- L["Innkeeper Norman"] = ""
-- L["Innkeeper Pala"] = ""
-- L["Innkeeper Saelienne"] = ""
L["(Inside the fortress)"] = "dentro da fortaleza" -- Needs review
-- L["Inspector Snip Snagglebolt"] = ""
-- L["Ipfelkofer Ironkeg"] = ""
-- L["Ironforge Mint"] = ""
-- L["It's Hammer Time"] = ""
-- L["Jan. 23 ~ Feb. 13"] = ""
-- L["Ja'ron"] = ""
-- L["Javnir Nashak"] = ""
-- L["Jesper"] = ""
-- L["Jessica Rogers <Ring Toss>"] = ""
-- L["Jun. 21 ~ Jul. 4"] = ""
-- L["June 21 ~ July 4"] = ""
-- L["June 21 - July 4"] = ""
-- L["Junior Detective"] = ""
-- L["Kali Remik"] = ""
-- L["Kaymard Copperpinch"] = ""
-- L["Keeping the Faire Sparkling"] = ""
-- L["Kerri Hicks <The Strongest Woman Alive!>"] = ""
-- L["King Varian Wrynn"] = ""
-- L["Korgol Crushskull <The Pit Master>"] = ""
-- L["Kwee Q. Peddlefeet"] = ""
-- L["L90ETC Concert"] = ""
-- L["Lady Sylvanas Windrunner"] = ""
-- L["Larkin Thunderbrew"] = ""
-- L["\"Let the Fires Come!\""] = ""
-- L["Lhara <Pet & Mount Prizes>"] = ""
-- L["Lor'themar Theron"] = ""
-- L["Love_Date"] = ""
-- L["Love is in the Air"] = ""
-- L["Lower"] = ""
-- L["Lunar_Date"] = ""
-- L["Lunar Festival"] = ""
-- L["Major Cities"] = ""
-- L["Marion Sutton"] = ""
-- L["Masked Orphan Matron"] = ""
-- L["Maxima Blastenheimer <Darkmoon Faire Cannoneer>"] = ""
-- L["Menkhaf the Elder"] = ""
-- L["Midsummer_Date"] = ""
-- L["Midsummer Fire Festival"] = ""
-- L["Mola <Whack-a-Mole>"] = ""
-- L["Moonlance the Elder"] = ""
-- L["Muradin Bronzebeard"] = ""
-- L["Neill Ramstein"] = ""
L["(Next to the flight master)"] = "Próximo ao mestre de voo" -- Needs review
-- L["Night Elf Commoner"] = ""
-- L["Now This is Ram Racing... Almost."] = ""
-- L["Oct. 18 ~ Oct. 31"] = ""
-- L["October 18 ~ October 31"] = ""
-- L["Omen"] = ""
L["(On the ground)"] = "No chão" -- Needs review
L["(On the roof of the bank)"] = "No telhado do banco" -- Needs review
-- L["Orange: "] = ""
-- L["Orc Commoner"] = ""
-- L["Orgrimmar Nougat"] = ""
L["(Outside the city gate)"] = "Fora do portão da cidade" -- Needs review
L["(Outside the gate)"] = "Fora do portão" -- Needs review
-- L["Petting Zoo"] = ""
-- L["Pilfering Perfume"] = ""
-- L["Pink Elekks On Parade"] = ""
-- L["Pol Amberstill"] = ""
-- L["Portals"] = ""
-- L["Professor Thaddeus Paleo <Darkmoon Cards>"] = ""
-- L["Prophet Velen"] = ""
-- L["Public Relations Agent"] = ""
-- L["Purple: "] = ""
-- L["Putting the Carnies Back Together Again"] = ""
-- L["Putting the Crunch in the Frog"] = ""
-- L["Putting Trash to Good Use"] = ""
-- L["Quest: "] = ""
-- L["Quest Destination"] = ""
-- L["Quest: Elune's Blessing"] = ""
L["Ram Master Ray"] = "Mestre de Carneiros Ray" -- Needs review
L["Ray'ma"] = "Ray'ma" -- Needs review
-- L["Red: "] = ""
-- L["Rinling"] = ""
-- L["Roka"] = ""
-- L["Rona Greenteeth"] = ""
-- L["Runetotem the Elder"] = ""
-- L["Sagorne Creststrider"] = ""
-- L["Sayge"] = ""
-- L["Sazz Coincatcher <Game Tokens>"] = ""
-- L["Sekhemi the Elder"] = ""
-- L["Selina Dourman <Darkmoon Faire Information>"] = ""
L["Sep. 28 ~ Oct. 13"] = "28 de Set. ~ 13 de Out." -- Needs review
-- L["Snivel's Sweetheart"] = ""
-- L["Something is in the Air (and it Ain't Love)"] = ""
-- L["Something Stinks"] = ""
-- L["Southeast coast of the Lake Elune'ara"] = ""
-- L["Spoops"] = ""
-- L["Stamp Thunderhorn <Food Vendor>"] = ""
-- L["Start"] = ""
-- L["Steven Stagnaro <Fishing Trainer>"] = ""
-- L["Stop the Fires!"] = ""
-- L["Stormwind Nougat"] = ""
-- L["Sylannia <Drink Vendor>"] = ""
-- L["Talvash del Kissel"] = ""
L["Tapper Swindlekeg"] = "Torneiro Barrilantra" -- Needs review
-- L["Target: Turtle"] = ""
-- L["Tatia Brine <Fishing Supplies>"] = ""
L["Tauren Commoner"] = "Plebeu Tauren" -- Needs review
-- L["Teleportologist Fozlebub <Gone Fishin'>"] = ""
-- L["Test Your Strength"] = ""
-- L["The Abominable Greench"] = ""
-- L["The Feast of Winter Veil"] = ""
-- L["The first Sunday each month, last for a week"] = ""
-- L["The Gilded Rose"] = ""
-- L["The Humanoid Cannonball"] = ""
L["There and Back Again"] = "Lá e de volta outra vez" -- Needs review
-- L["The Reason for the Season"] = ""
-- L["(The roof of Scholomance, outside the dungeon)"] = ""
L["This One Time, When I Was Drunk..."] = "Certa vez, quando eu estava bêbado..." -- Needs review
-- L["Thunder Bluff Marzipan"] = ""
-- L["Tonk Commander"] = ""
-- L["Treats for Great-father Winter"] = ""
-- L["Treats for Greatfather Winter"] = ""
-- L["Trick: "] = ""
-- L["Trixi Sharpworth <Game Tokens>"] = ""
L["Troll Commoner"] = "Plebeu Troll" -- Needs review
-- L["Tyrande Whisperwind"] = ""
-- L["Uncommon Scents"] = ""
-- L["Undercity Mint"] = ""
-- L["Valadar Starsong"] = ""
-- L["Wagner Hammerstrike"] = ""
-- L["Windsong the Elder"] = ""
-- L["Winter_Date"] = ""
-- L["World Events Maps"] = ""
-- L["Wulmort Jinglepocket"] = ""
-- L["You're a Mean One..."] = ""
-- L["Zina Sharpworth <Game Tokens>"] = ""
-- L["ToC/Description"] = ""
-- L["ToC/Title"] = ""

end
