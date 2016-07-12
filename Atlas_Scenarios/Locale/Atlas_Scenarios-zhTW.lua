-- $Id: Atlas_Scenarios-zhTW.lua 12 2016-06-27 14:27:22Z arith $
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

local AceLocale = LibStub:GetLibrary("AceLocale-3.0");
local L = AceLocale:NewLocale("Atlas_Scenarios", "zhTW", false);

if L then
	for key, value in pairs(Atlas_ScenarioStepDB) do
		L[value[1]] = value[Atlas_ScenariosDB_Langs["zhTW"]];
	end

-- L["33 Deamons slain"] = ""
-- L["3 Lords slain"] = ""
-- L["3 Spires of Woe destroyed"] = ""
L["Abomination of Anger"] = "憎惡獸"
L["Achievement"] = "成就"
L["Admiral Hagman"] = "海格曼上將"
L["Admiral Hodgson"] = "霍森上將"
L["Admiral Taylor"] = "泰勒上將"
L["Alliance's final stop"] = "聯盟的最後停留點"
L["Alliance Ships"] = "聯盟船隻"
L["Amber Kearnen"] = "琥珀·吉爾妮"
L["Attackers"] = "攻擊者"
L["Baldruc and Gryphon"] = "巴德拉克和獅鷲獸"
L["Battery"] = "電池"
L["Beach"] = "海灘"
L["Brewing Cauldron"] = "釀酒鍋"
L["Brewmaster Boof"] = "釀酒大師布夫"
L["Broken Proto-Drake Egg"] = "Broken Proto-Drake Egg"
L["Broodmaster Noshi"] = "育主諾許"
L["Cannon Balls"] = "Cannon Balls"
L["Cave"] = "洞穴"
L["Commander Scargash"] = "指揮官疤口"
L["Commander Tel'vrak"] = "指揮官泰弗瑞克"
L["Cordfellow Hack"] = "Cordfellow Hack"
L["Crafty the Ambitious"] = "Crafty the Ambitious"
L["Daggin Windbeard"] = "達金·風鬚"
L["Darkhatched Lizard-Lord"] = "Darkhatched Lizard-Lord"
L["Dark Iron Mountaineers"] = "黑鐵巡山人"
L["Dark Shaman Xorenth"] = "Dark Shaman Xorenth"
L["Defeat Cloudbender Kobo"] = "殺死屈雲者·柯博"
L["Defeat Maki Waterblade"] = "殺死真樹·水刃"
L["Defeat Satay Byu"] = "殺死沙喋·鰾"
L["Defence Point"] = "防禦點"
-- L["Defend against each of the Legion's assaults on Azeroth during the Legion pre-launch events."] = ""
-- L["Defend against the Burning Legion by completing an invasion during the Legion pre-launch events."] = ""
-- L["Defender of Azeroth: Legion Invasions"] = ""
-- L["Demon Invasion"] = ""
L["Den Mother Moof"] = "巢母莫夫"
L["Docking"] = "Docking"
L["Door"] = "Door"
L["East Statue"] = "East Statue"
L["Echo of Y'Sharrj"] = "亞煞拉懼的分身"
L["Farastu"] = "Farastu"
L["Final Stage"] = "最後階段"
L["Flame Hound"] = "Flame Hound"
L["General Nazgrim"] = "納茲格寧姆將軍"
L["God-Hulk Gulkan"] = "God-Hulk Gulkan"
L["Grizzle Gearslip"] = "格里斯·輪滑"
L["Gul'dan"] = "古爾丹"
L["Hekima the Wise"] = "Hekima the Wise"
L["Highlord Tirion Fordring"] = "大領主提里奧‧弗丁"
L["High Marshal Twinbraid"] = "大元帥塔文布萊德"
L["Horde's final stop"] = "部落的最後停留點"
L["Horde Ships"] = "部落船隻"
L["Jaina"] = "珍娜"
L["Jin Ironfist"] = "鐵拳阿金"
L["Joan Lorraine"] = "Joan Lorraine"
L["Karsar the Bloodletter"] = "『放血者』卡爾薩"
L["King Varian Wrynn"] = "瓦里安·烏瑞恩國王"
L["Kor'kron Dire Soldier"] = "Kor'kron Dire Soldier"
L["Krosus"] = "克羅索斯"
L["Kyparite Quarry Sonic Control Towers"] = "Kyparite Quarry Sonic Control Towers"
L["Landing"] = "Landing"
L["Lever"] = "Lever"
L["Lieutenant Blasthammer"] = "Lieutenant Blasthammer"
L["Lieutenant Boltblaster"] = "Lieutenant Boltblaster"
L["Lieutenant Drak'on"] = "Lieutenant Drak'on"
L["Lieutenant Fizzboil"] = "Lieutenant Fizzboil"
L["Lieutenant Fizzel"] = "Lieutenant Fizzel"
L["Lieutenant Fuseblast"] = "Lieutenant Fuseblast"
L["Lieutenant Parker"] = "Lieutenant Parker"
L["Lieutenant Sparklighter"] = "Lieutenant Sparklighter"
L["Li Te"] = "李忒"
L["Mishka"] = "密西卡"
L["Norushen"] = "Norushen"
L["Overseer Elaglo"] = "Overseer Elaglo"
L["Pandaria Artifacts"] = "Pandaria Artifacts"
L["Pool of Life"] = "生命之池"
L["Pool Pony"] = "Pool Pony"
L["Portal"] = "傳送門"
L["Proto-drake Eggs"] = "Proto-drake Eggs"
L["Rak'gor Bloodrazor"] = "Rak'gor Bloodrazor"
L["Rivett Clutchpop"] = "Rivett Clutchpop"
L["Rope Pile"] = "Rope Pile"
L["Run to the top deck and swing away!"] = "Run to the top deck and swing away!"
L["Saurok Cave"] = "薩烏洛克洞穴"
L["Saurok Hatchery"] = "Saurok Hatchery"
L["Scenarios Maps"] = "情境地圖"
L["Scout Boldbrew"] = "斥候勇釀"
L["Scout Forgefellow"] = "斥候鍛扈"
L["Scout Stonebeard"] = "斥候石鬚"
L["Sealed Gate"] = "Sealed Gate"
L["Shademaster Kiryn"] = "Shademaster Kiryn"
L["Shokia"] = "Shokia"
L["Squad Leader Bosh"] = "Squad Leader Bosh"
L["Stage 1"] = "階段 1"
L["Stage 2"] = "階段 2"
L["Stage 3"] = "階段 3"
L["Stage 4"] = "階段 4"
L["Stage 5"] = "階段 5"
L["Stage 6"] = "階段 6"
L["Stage 7"] = "階段 7"
-- L["Stand Against the Legion"] = ""
L["Steal Explosives"] = "偷取炸藥"
L["Sully \"The Pickle\" McLeary"] = "『醃漬王』蘇利·麥拉利"
L["Supply Crates"] = "Supply Crates"
L["Sylvanas and Baine"] = "希瓦娜斯和貝恩"
L["Tanks"] = "坦克"
L["Tenwu of the Red Smoke"] = "Tenwu of the Red Smoke"
L["Thalen Songweaver"] = "塔倫織歌者"
L["Thaumaturge Saresse"] = "Thaumaturge Saresse"
L["The Flight MasterDP"] = "飛行管理員"
L["The Flight MasterLL"] = "飛行管理員"
L["The heart of ruined Theramore"] = "已被摧毀的塞拉摩中心"
L["The Spring Drifter"] = "The Spring Drifter"
L["Transport Cannon"] = "Transport Cannon"
L["Traps"] = "陷阱"
L["Treasure Urn"] = "藏寶罈"
L["Urtharges the Destroyer"] = "Urtharges the Destroyer"
L["Venomsting Pits Sonic Control Towers"] = "Venomsting Pits Sonic Control Towers"
L["Vol'jin"] = "沃金"
L["Warlord Bloodhilt"] = "督軍血柄"
L["Wave One"] = "第一波"
L["Wave Three"] = "第三波"
L["Wave Two"] = "第二波"
L["Weapons"] = "武器"
L["West Gate"] = "西門"
L["West Statue"] = "West Statue" -- Needs review
L["Whispering Stones Sonic Control Towers"] = "Whispering Stones Sonic Control Towers" -- Needs review
L["Wolf-Rider Gaja"] = "Wolf-Rider Gaja" -- Needs review
L["ToC/Description"] = "Atlas 史詩情境事件模式地圖插件"
L["ToC/Title"] = "|r|cFF0099FF[地圖]|rAtlas 情境地圖" -- Needs review




end
