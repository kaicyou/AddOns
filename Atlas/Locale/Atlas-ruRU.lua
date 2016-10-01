-- $Id: Atlas-ruRU.lua 97 2016-09-05 14:59:04Z arith $
--[[

	Atlas, a World of Warcraft instance map browser
	Copyright 2005 ~ 2010 - Dan Gilbert <dan.b.gilbert@gmail.com>
	Copyright 2010 - Lothaer <lothayer@gmail.com>, Atlas Team
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

local AceLocale = LibStub:GetLibrary("AceLocale-3.0");
local L = AceLocale:NewLocale("Atlas", "ruRU", false);

-- Atlas Russian Localization
-- Compiled by Eugene Filatov, bigoblin, StingerSoft
-- Last Update: 23.01.2011
-- $Date: 2016-09-05 14:59:04 +0000 (Mon, 05 Sep 2016) $
-- $Revision: 97 $

if ( GetLocale() == "ruRU" ) then
-- Define the leading strings to be ignored while sorting
-- Ex: The Stockade
AtlasSortIgnore = {"(.+)"};

-- Syntax: ["real_zone_name"] = "localized map zone name"
AtlasZoneSubstitutions = {
	["Ahn'Qiraj"] = "Ан'Кираж";
	["The Temple of Atal'Hakkar"] = "Храм Атал'Хаккара";
--	["Throne of Tides"] = "Бездонная пучина: Трон Приливов";
};
end


if L then
L["Adult"] = "Взрослый"
L["AKA"] = "AKA" -- Needs review
L["Alexston Chrome <Tavern of Time>"] = "Алекстон Хром <Таверна Времени>"
L["Alurmi <Keepers of Time Quartermaster>"] = "Алурми <Начальник снабжения Хранителей Времени>"
L["Anachronos <Keepers of Time>"] = "Анахронос <Хранители Времени>"
L["Andormu <Keepers of Time>"] = "Андорму <Хранители Времени>"
L["Arazmodu <The Scale of Sands>"] = "Аразмоду <Песчаная Чешуя>"
L["Arcane Container"] = "Волшебный контейнер"
L["Arms Warrior"] = "Воин-Оружия"
L["ATLAS_BUTTON_CLOSE"] = "Закрыть"
-- L["ATLAS_CLICK_TO_OPEN"] = ""
-- L["ATLAS_COLLAPSE_BUTTON"] = ""
L["ATLAS_DDL_CONTINENT"] = "Континенту" -- Needs review
-- L["ATLAS_DDL_CONTINENT_BROKENISLES"] = ""
L["ATLAS_DDL_CONTINENT_DEEPHOLM"] = "Подземелья Подземья"
L["ATLAS_DDL_CONTINENT_DRAENOR"] = "Подземелья Дренорский"
L["ATLAS_DDL_CONTINENT_EASTERN"] = "Подземелья Восточных королевств"
L["ATLAS_DDL_CONTINENT_KALIMDOR"] = "Подземелья Калимдора"
L["ATLAS_DDL_CONTINENT_NORTHREND"] = "Подземелья Нордскола"
L["ATLAS_DDL_CONTINENT_OUTLAND"] = "Подземелья Запределья"
L["ATLAS_DDL_CONTINENT_PANDARIA"] = "Подземелья Пандории"
L["ATLAS_DDL_EXPANSION"] = "Дополнению" -- Needs review
L["ATLAS_DDL_EXPANSION_BC"] = "Подземелья Пылающего Крестового Похода"
L["ATLAS_DDL_EXPANSION_CATA"] = "Подземелья Cataclysm"
-- L["ATLAS_DDL_EXPANSION_LEGION"] = ""
L["ATLAS_DDL_EXPANSION_MOP"] = "Подземелья Mists of Pandaria"
L["ATLAS_DDL_EXPANSION_OLD_AO"] = "Подземелья Старого Мира A-O"
L["ATLAS_DDL_EXPANSION_OLD_PZ"] = "Подземелья Старого Мира P-Z"
L["ATLAS_DDL_EXPANSION_WOD"] = "Подземелья Warlords of Draenor"
L["ATLAS_DDL_EXPANSION_WOTLK"] = "Подземелья Wrath of the Lich King"
L["ATLAS_DDL_LEVEL"] = "Уровню" -- Needs review
L["ATLAS_DDL_LEVEL_100PLUS"] = "Подземелья уровня 100+"
-- L["ATLAS_DDL_LEVEL_100TO110"] = ""
-- L["ATLAS_DDL_LEVEL_110PLUS"] = ""
L["ATLAS_DDL_LEVEL_45TO60"] = "Подземелья уровня 45-60"
L["ATLAS_DDL_LEVEL_60TO70"] = "Подземелья уровня 60-70"
L["ATLAS_DDL_LEVEL_70TO80"] = "Подземелья уровня 70-80"
L["ATLAS_DDL_LEVEL_80TO85"] = "Подземелья уровня 80-85"
L["ATLAS_DDL_LEVEL_85TO90"] = "Подземелья уровня 85-90"
L["ATLAS_DDL_LEVEL_90TO100"] = "Подземелья уровня 90-100"
L["ATLAS_DDL_LEVEL_UNDER45"] = "Подземелья уровня ниже 45"
L["ATLAS_DDL_PARTYSIZE"] = "Размеру группы" -- Needs review
L["ATLAS_DDL_PARTYSIZE_10_AN"] = "Подземелья на 10 игроков A-N"
L["ATLAS_DDL_PARTYSIZE_10_OZ"] = "Подземелья на 10 игроков O-Z"
L["ATLAS_DDL_PARTYSIZE_20TO40AH"] = "Подземелья на 20-40 игроков A-H"
L["ATLAS_DDL_PARTYSIZE_20TO40IZ"] = "Подземелья на 20-40 игроков I-Z"
L["ATLAS_DDL_PARTYSIZE_5_AE"] = "Подземелья на 5 игроков A-E"
L["ATLAS_DDL_PARTYSIZE_5_FS"] = "Подземелья на 5 игроков F-S"
L["ATLAS_DDL_PARTYSIZE_5_TZ"] = "Подземелья на 5 игроков T-Z"
L["ATLAS_DDL_TYPE"] = "Типу" -- Needs review
L["ATLAS_DDL_TYPE_ENTRANCE"] = "Входы"
L["ATLAS_DDL_TYPE_INSTANCE_AB"] = "Подземелья A-B"
L["ATLAS_DDL_TYPE_INSTANCE_CF"] = "Подземелья C-F"
L["ATLAS_DDL_TYPE_INSTANCE_GM"] = "Подземелья G-M"
L["ATLAS_DDL_TYPE_INSTANCE_NS"] = "Подземелья N-S"
L["ATLAS_DDL_TYPE_INSTANCE_TZ"] = "Подземелья T-Z"
L["ATLAS_DEP_MSG1"] = "Атлас обнаружил устаревший(е) модуль(и)."
L["ATLAS_DEP_MSG2"] = "Они будут отключены для данного персонажа."
L["ATLAS_DEP_MSG3"] = "Удалите их из вашей папки аддонов."
L["ATLAS_DEP_OK"] = "Ok"
L["ATLAS_ENTRANCE_BUTTON"] = "Вход"
-- L["ATLAS_EXPAND_BUTTON"] = ""
L["ATLAS_INFO"] = "Atlas информация"
L["ATLAS_INFO_12200"] = [=[Важное уведомление:

В связи с проблемой увеличение размеров файлов модификации, мы разделили
 модификацию на отдельные модули подземелий.

Пользователи, которые скачивают нашу модификацию с известных веб-сайтов,
 в основном получают только основное ядро, которое включает в себя все
 функции ядра Атласа и карты подземелий Cataclysm'а.

Пользователи, которые хотят загрузить все старые карты подземелий и все
 модули Атласа, сделанные нами, могут их скачать по отдельности.

Для получения дополнительной информации прочтите следующий топик:
|cff6666ffhttp://www.atlasmod.com/phpBB3/viewtopic.php?t=1522|cffffffff

Или посетите наш сайт, чтобы узнать где скачать:
|cff6666ffhttp://www.atlasmod.com/|cffffffff]=]
L["ATLAS_INFO_12201"] = [=[Обратите внимание, что мы создали новый плагин - |cff6666ffAtlas Сценарии|cffffffff, который 
обеспечивает совершенно новыми картыми сценарий, введенных в 5.0. 

Для более подробной информации посетите наш веб-сайт, и не забудьте скачать / 
установить его отдельно.
|cff6666ffhttp://www.atlasmod.com/|cffffffff]=]
L["ATLAS_INSTANCE_BUTTON"] = "Подземелье"
L["ATLAS_LDB_HINT"] = [=[[ЛКМ] - открывает Атлас.
[ПКМ] - открывает настройки Атласа.]=]
L["ATLAS_MINIMAPLDB_HINT"] = [=[[ЛКМ] - открывает Атлас.
[ПКМ] + открывает настройки Атласа.
[ЛКМ] + [перемещение] - изменяет позицию кнопки.]=]
L["ATLAS_MISSING_MODULE"] = "Atlas обнаружил недостоющие модули / плагины: " -- Needs review
-- L["ATLAS_OPEN_ADDON_LIST"] = ""
L["ATLAS_OPEN_ADVENTURE"] = "[ЛКМ] - открывает окно журнала подземелий." -- Needs review
-- L["ATLAS_OPEN_WOWMAP_WINDOW"] = ""
L["ATLAS_OPTIONS_ACRONYMS"] = "Короткие названия"
L["ATLAS_OPTIONS_ACRONYMS_TIP"] = "Будут отображаться сокрощенные названия подземелий в информации о карте."
L["ATLAS_OPTIONS_AUTOSEL"] = "Автоматический выбор поздемелья"
L["ATLAS_OPTIONS_AUTOSEL_TIP"] = "Автоматический выбор карты поздемелья, Атлас будет определить ваше местоположение, чтобы выбрать лучшую карту подземелья для вас."
L["ATLAS_OPTIONS_BOSS_DESC"] = "Показать описание босса (если доступно)"
L["ATLAS_OPTIONS_BOSS_DESC_SCALE"] = "Размер подсказки описания босса на карте"
L["ATLAS_OPTIONS_BOSS_DESC_TIP"] = "При наведении курсора мышки над номером босса, будет показано описание босса, если такая информация доступна."
L["ATLAS_OPTIONS_BUTPOS"] = "Расположение кнопки"
L["ATLAS_OPTIONS_BUTRAD"] = "Радиус расположения кнопки"
L["ATLAS_OPTIONS_BUTTON"] = "Настройки"
L["ATLAS_OPTIONS_CATDD"] = "Сортировать подземелья по:"
L["ATLAS_OPTIONS_CHECKMODULE"] = "Напоминать о недостоющих модулях / плагинах."
L["ATLAS_OPTIONS_CHECKMODULE_TIP"] = "Выполнение проверки после загрузки WoW, на наличие недостающих модулей / плагинов Atlas'а."
L["ATLAS_OPTIONS_CLAMPED"] = "Не заходить за размеры экрана"
L["ATLAS_OPTIONS_CLAMPED_TIP"] = "Фиксировать окно Атласа на экране, отключение позволит перемещать окно Атласа за пределы игрового экрана."
L["ATLAS_OPTIONS_COLORINGDROPDOWN"] = "Цвет ур. сложности подземелья"
L["ATLAS_OPTIONS_COLORINGDROPDOWN_TIP"] = "Полагаясь на предложенный минимальный уровень подземелья и уровень игрока, окрашивать названия подземелий с учетом их уровня сложности."
L["ATLAS_OPTIONS_CTRL"] = "Удерживайте клавишу [CTRL] для сравнений"
L["ATLAS_OPTIONS_CTRL_TIP"] = "Включить/отключить отображение подсказки при удерживании клавиши CTRL и наведении курсора мышки на информационной карте. Полезно тогда, когда текст слишком длинный, для отображения в окне."
L["ATLAS_OPTIONS_DONTSHOWAGAIN"] = "Не отображать одинаковую информацию снова."
L["ATLAS_OPTIONS_LOCK"] = "Закрепить окно Атласа"
L["ATLAS_OPTIONS_LOCK_TIP"] = "Закрепить / освободить окно Атласа."
L["ATLAS_OPTIONS_RCLICK"] = "[ПКМ] для карты мира"
L["ATLAS_OPTIONS_RCLICK_TIP"] = "Включает отображение мировой карты при нажатии ПКМ в окне Атласа."
L["ATLAS_OPTIONS_RESETPOS"] = "Сбросить позиции"
L["ATLAS_OPTIONS_SCALE"] = "Размер"
L["ATLAS_OPTIONS_SHOWBUT"] = "Показывать кнопку у мини-карты"
L["ATLAS_OPTIONS_SHOWBUT_TIP"] = "Отображать кнопку Атласа у мини-карты."
L["ATLAS_OPTIONS_TRANS"] = "Прозрачность"
L["ATLAS_SEARCH_UNAVAIL"] = "Поиск недоступен"
L["ATLAS_SLASH"] = "/atlas"
L["ATLAS_SLASH_OPTIONS"] = "options"
L["ATLAS_STRING_CLEAR"] = "Сбросить"
L["ATLAS_STRING_LEVELRANGE"] = "Уровень" -- Needs review
L["ATLAS_STRING_LOCATION"] = "Расположение"
L["ATLAS_STRING_MINLEVEL"] = "Минимальный уровень"
L["ATLAS_STRING_PLAYERLIMIT"] = "Лимит игроков"
L["ATLAS_STRING_RECLEVELRANGE"] = "Реком. уровень" -- Needs review
L["ATLAS_STRING_SEARCH"] = "Поиск"
L["ATLAS_STRING_SELECT_CAT"] = "Выбор категории"
L["ATLAS_STRING_SELECT_MAP"] = "Выбор карты"
L["ATLAS_TITLE"] = "Атлас"
L["Attunement Required"] = "Необходима подготавка"
L["Back"] = "Назад"
L["Basement"] = "Подвал"
L["BINDING_HEADER_ATLAS_TITLE"] = "Сопоставления кнопок"
L["BINDING_NAME_ATLAS_AUTOSEL"] = "Авто-выбор поздемелья"
L["BINDING_NAME_ATLAS_OPTIONS"] = "Настройки Атласа"
L["BINDING_NAME_ATLAS_TOGGLE"] = "Атлас"
L["Blacksmithing Plans"] = "Чертежи кузнечного дела"
L["Bodley"] = "Бодли"
L["Bortega <Reagents & Poison Supplies>"] = "Бортега <Реагенты и яды>"
L["Brewfest"] = "Праздника пива"
L["Child"] = "Ребенок"
L["Colon"] = ": " -- Needs review
-- L["Comma"] = ""
L["Connection"] = "Связан"
L["East"] = "Восток"
L["Elevator"] = "Лифт"
L["End"] = "Конец"
L["Engineer"] = "Инженер"
L["Entrance"] = "Вход"
L["Event"] = "Событие"
L["Exalted"] = "Превознесение"
L["Exit"] = "Выход"
L["Fourth Stop"] = "Четвертая остановка"
L["Front"] = "Передний"
L["Galgrom <Provisioner>"] = "Гальгром <Поставщик>"
L["Ghost"] = "Призрак"
L["Graveyard"] = "Кладбище"
L["Hallow's End"] = "Тыква"
L["Heroic"] = "Героический"
-- L["Heroic_Symbol"] = ""
L["Holy Paladin"] = "Паладин-Света"
L["Holy Priest"] = "Жрец-Света"
-- L["Hyphen"] = ""
L["Imp"] = "Бесс"
L["Key"] = "Ключ"
-- L["L-DQuote"] = ""
L["Lothos Riftwaker"] = "Лотос Хранитель Портала"
L["Love is in the Air"] = "Любовная лихорадка"
L["Lower"] = "Нижний"
-- L["L-Parenthesis"] = ""
-- L["L-SBracket"] = ""
L["Lunar Festival"] = "Лунный фестиваль"
-- L["MapA"] = ""
-- L["MapB"] = ""
-- L["MapC"] = ""
-- L["MapD"] = ""
-- L["MapE"] = ""
-- L["MapF"] = ""
-- L["MapG"] = ""
-- L["MapH"] = ""
-- L["MapI"] = ""
-- L["MapJ"] = ""
L["MapsNotFound"] = [=[Текущее выбранное подземелье не имеет 
соответствующего изображения карты. 

Пожалуйста, убедитесь, что вы установили 
соответствующий модуль(и) карт Atlas'а.]=]
L["Meeting Stone"] = "Камень встреч"
L["Middle"] = "Центр"
L["Midsummer Festival"] = "Огненный солнцеворот"
L["Moonwell"] = "Лунный колодец"
-- L["Mythic"] = ""
-- L["Mythic_Symbol"] = ""
L["North"] = "Север"
L["Nozari <Keepers of Time>"] = "Нозари <Хранители Времени>"
L["Optional"] = "Необяз."
L["Orange"] = "Оранжевый"
L["Orb of Command"] = "Сфера Приказа"
L["Outside"] = "Снаружи"
-- L["Period"] = ""
L["Portal"] = "Портал"
L["PossibleMissingModule"] = "Вполне вероятно, эта карта из этого модуля: "
L["Protection Warrior"] = "Воин-Защиты"
L["Purple"] = "Пурпурный"
L["Random"] = "Случайный"
L["Rare"] = "Редкий"
-- L["R-DQuote"] = ""
L["Repair"] = "Починка"
L["Retribution Paladin"] = "Паладин-Возмездия"
L["Rewards"] = "Награды"
-- L["R-Parenthesis"] = ""
-- L["R-SBracket"] = ""
L["Scarshield Quartermaster <Scarshield Legion>"] = "Интендант из легиона Изрубленного Щита"
L["Second Stop"] = "Вторая остановка"
-- L["Semicolon"] = ""
L["Shadow Priest"] = "Жрец-Темной магии"
-- L["Slash"] = ""
L["Soridormi <The Scale of Sands>"] = "Соридорми <Песчаная Чешуя>"
L["South"] = "Юг"
L["Spawn Point"] = "Точка рождения"
L["Start"] = "Начало"
L["Steward of Time <Keepers of Time>"] = "Распорядитель времени <Хранители Времени>"
L["Summon"] = "Вызов"
L["Teleporter"] = "Телепорт"
L["Teleporter destination"] = "Назначение телепорта"
L["The Behemoth"] = "Чудище"
L["Third Stop"] = "Третья остановка"
L["Top"] = "Верхний"
-- L["Transport"] = ""
L["Tunnel"] = "Туннель"
L["Underwater"] = "Подводный"
L["Upper"] = "Верхний"
L["Varies"] = "Изменяется"
L["Wanders"] = "Странник"
L["Wave 10"] = "10-ая волна"
L["Wave 12"] = "12-ая волна"
L["Wave 18"] = "18-ая волна"
L["Wave 5"] = "5-ая волна"
L["Wave 6"] = "6-ая волна"
L["West"] = "Запад"
L["Yarley <Armorer>"] = "Ярли <Бронник>"
L["Zaladormu"] = "Заладорму"
L["ToC/Description"] = "Обозреватель подземелий"
-- L["ToC/Title"] = ""



end