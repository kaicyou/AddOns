-- $Id: Atlas_Scenarios-ruRU.lua 12 2016-06-27 14:27:22Z arith $
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
local L = AceLocale:NewLocale("Atlas_Scenarios", "ruRU", false);

if L then
	for key, value in pairs(Atlas_ScenarioStepDB) do
		L[value[1]] = value[Atlas_ScenariosDB_Langs["ruRU"]];
	end

-- L["33 Deamons slain"] = ""
-- L["3 Lords slain"] = ""
-- L["3 Spires of Woe destroyed"] = ""
L["Abomination of Anger"] = "Порождение Гнева"
-- L["Achievement"] = ""
L["Admiral Hagman"] = "Адмирал Хагман"
L["Admiral Hodgson"] = "Адмирал Ходжсон"
L["Admiral Taylor"] = "Адмирал Тейлор"
-- L["Alliance's final stop"] = ""
L["Alliance Ships"] = "Корабли Альянса"
L["Amber Kearnen"] = "Эмбер Кеарнен"
L["Attackers"] = "Attackers"
L["Baldruc and Gryphon"] = "Бальдрук и грифон"
L["Battery"] = "Батарея"
-- L["Beach"] = ""
L["Brewing Cauldron"] = "Хмелевареный котел"
L["Brewmaster Boof"] = "Хмелевар Буф"
L["Broken Proto-Drake Egg"] = "Разбитое яйцо протодракона"
L["Broodmaster Noshi"] = "Праматерь Ноши"
L["Cannon Balls"] = "Пушечные ядра"
L["Cave"] = "Пещера"
L["Commander Scargash"] = "Командир Глубокий Шрам"
L["Commander Tel'vrak"] = "Командир Тел'врак"
L["Cordfellow Hack"] = "Каблик Хак"
L["Crafty the Ambitious"] = "Хитрюга Амбициозный"
L["Daggin Windbeard"] = "Даггин Ветробород"
L["Darkhatched Lizard-Lord"] = "Чеуйчатый повелитель Темной Кладки"
L["Dark Iron Mountaineers"] = "Горный пехотинец Черного Железа"
L["Dark Shaman Xorenth"] = "Темный шаман Ксорент"
L["Defeat Cloudbender Kobo"] = "Убейте Сокрушителя облаков Кобо"
L["Defeat Maki Waterblade"] = "Убейте Маки Водореза"
L["Defeat Satay Byu"] = "Убейте Сатай Бюй"
L["Defence Point"] = "Точка обороны"
-- L["Demon Invasion"] = ""
L["Den Mother Moof"] = "Мать логова Муф"
L["Docking"] = "Швартовка"
L["Door"] = "Двери"
L["East Statue"] = "Статуя - Восток"
L["Echo of Y'Sharrj"] = "Эхо И'Шараджа"
L["Farastu"] = "Фарасту"
L["Final Stage"] = "Последний этап"
L["Flame Hound"] = "Гончая пламени"
L["General Nazgrim"] = "Генерал Назгрим"
L["God-Hulk Gulkan"] = "Бог-исполин Гулкан"
L["Grizzle Gearslip"] = "Гриззл Скрипетол"
-- L["Gul'dan"] = ""
L["Hekima the Wise"] = "Хекима Мудрый"
-- L["Highlord Tirion Fordring"] = ""
L["High Marshal Twinbraid"] = "Верховный маршал Двукосса"
-- L["Horde's final stop"] = ""
L["Horde Ships"] = "Корабли Орды"
L["Jaina"] = "Джайна"
L["Jin Ironfist"] = "Цзинь Железный Кулак"
L["Joan Lorraine"] = "Джоан Лоррейн"
L["Karsar the Bloodletter"] = "Карсар Кровопускатель"
-- L["King Varian Wrynn"] = ""
L["Kor'kron Dire Soldier"] = "Кор'кронский яростный воин"
-- L["Krosus"] = ""
L["Kyparite Quarry Sonic Control Towers"] = "Кипаритовый карьер - Звуковая колонна"
L["Landing"] = "Плацдарм"
L["Lever"] = "Рычаг"
L["Lieutenant Blasthammer"] = "Лейтенант Взрывчер"
L["Lieutenant Boltblaster"] = "Лейтенант Стрелобам"
L["Lieutenant Drak'on"] = "Лейтенант Драк'он"
L["Lieutenant Fizzboil"] = "Лейтенант Шипокипун"
L["Lieutenant Fizzel"] = "Лейтенант Быщ"
L["Lieutenant Fuseblast"] = "Лейтенант Бумфитиль"
L["Lieutenant Parker"] = "Лейтенант Паркер"
L["Lieutenant Sparklighter"] = "Лейтенант Искрожгунстер"
L["Li Te"] = "Ли Тэ"
L["Mishka"] = "Мишка"
L["Norushen"] = "Норусхен"
L["Overseer Elaglo"] = "Надзиратель Элагло"
L["Pandaria Artifacts"] = "Артефакты Пандарии"
L["Pool of Life"] = "Источник жизни"
L["Pool Pony"] = "Надувной пони"
-- L["Portal"] = ""
L["Proto-drake Eggs"] = "Яйца протодракона"
L["Rak'gor Bloodrazor"] = "Рак'гор Кровавая Бритва"
L["Rivett Clutchpop"] = "Риветт Сталехват"
L["Rope Pile"] = "Моток веревки"
L["Run to the top deck and swing away!"] = "Беги на верхнюю палубу и спасайся!"
L["Saurok Cave"] = "Пещера сауроков"
L["Saurok Hatchery"] = "Кладка яиц сауроков"
L["Scenarios Maps"] = "Карты сценариев"
L["Scout Boldbrew"] = "Разведчица Резковар"
L["Scout Forgefellow"] = "Разведчик Кузнебрат"
L["Scout Stonebeard"] = "Разведчик Камнебород"
L["Sealed Gate"] = "Закрытые врата"
L["Shademaster Kiryn"] = "Темный мастер Кирин"
L["Shokia"] = "Шокиа"
L["Squad Leader Bosh"] = "Командир роты Бош"
L["Stage 1"] = "1 этап"
L["Stage 2"] = "2 этап"
L["Stage 3"] = "3 этап"
L["Stage 4"] = "4 этап"
L["Stage 5"] = "5 этап"
L["Stage 6"] = "6 этап"
L["Stage 7"] = "7 этап"
L["Steal Explosives"] = "Украдите взрывчатку"
L["Sully \"The Pickle\" McLeary"] = "Салли \"Рассольный\" Маклири"
L["Supply Crates"] = "Ящики с припасами"
-- L["Sylvanas and Baine"] = ""
L["Tanks"] = "Танки"
L["Tenwu of the Red Smoke"] = "Тэнь-у Красный Дым"
L["Thalen Songweaver"] = "Тален Созвучие Песни"
L["Thaumaturge Saresse"] = "Чародейка Саресс"
L["The Flight MasterDP"] = "Распорядитель полетов"
L["The Flight MasterLL"] = "Распорядитель полетов"
L["The heart of ruined Theramore"] = "Руины Терамора"
L["The Spring Drifter"] = "\"Весенняя лодка\""
L["Transport Cannon"] = "Пушка для перелетов"
L["Traps"] = "Ловушки"
L["Treasure Urn"] = "Гробница Забытых Королей"
L["Urtharges the Destroyer"] = "Уртардж Разрушитель"
L["Venomsting Pits Sonic Control Towers"] = "Ямы ядохвостов - Звуковая колонна"
L["Vol'jin"] = "Вол'джин"
L["Warlord Bloodhilt"] = "Полководец Кровавый Эфес"
L["Wave One"] = "1-ая волна"
L["Wave Three"] = "3-ая волна"
L["Wave Two"] = "2-ая волна"
L["Weapons"] = "Оружие"
L["West Gate"] = "Западные ворота"
L["West Statue"] = "Статуя - Запад"
L["Whispering Stones Sonic Control Towers"] = "Шепчущие камни - Звуковая колонна"
L["Wolf-Rider Gaja"] = "Наездница Гайа"
L["ToC/Description"] = "Карты сценариев"
L["ToC/Title"] = "Atlas |r|cFF0099FF[Сценарии]|r"


end
