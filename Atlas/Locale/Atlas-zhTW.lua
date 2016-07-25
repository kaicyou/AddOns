﻿-- $Id: Atlas-zhTW.lua 56 2016-07-23 13:42:16Z arith $
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
local L = AceLocale:NewLocale("Atlas", "zhTW", false);

if ( GetLocale() == "zhTW" ) then
-- Define the leading strings to be ignored while sorting
-- Ex: The Stockade
AtlasSortIgnore = {};

-- Syntax: ["real_zone_name"] = "localized map zone name"
AtlasZoneSubstitutions = {
	["Ahn'Qiraj"] = "安其拉：安其拉神廟";
	["Karazhan"] = "卡拉贊 - 1.開始";
};
end


if L then
L["Abandonded Mole Machine"] = "棄置的鑽地機"
L["Abbendis"] = "阿比迪斯"
L["AC"] = "AC"
L["Acride <Scarshield Legion>"] = "裂盾滲透者 <裂盾軍團>"
L["Adult"] = "成年"
L["Advance Scout Chadwick"] = "先遣斥候查德威克"
L["Aged Dalaran Wizard"] = "年邁的達拉然法師"
L["Ahn'kahet Brazier"] = "安卡罕特火盆"
L["AKA"] = "又稱"
L["AK, Kahet"] = "AK/安卡"
L["Alexi Barov <House of Barov>"] = "阿萊克斯·巴羅夫 <巴羅夫家族>"
L["Alexston Chrome <Tavern of Time>"] = "艾力克斯頓·科洛米 <時間酒館>"
L["Alliance Base"] = "聯盟營地"
L["Altar of Blood"] = "血祭談"
L["Altar of the Deeps"] = "瑪塞斯特拉祭壇"
L["Alurmi"] = "阿勒米"
L["Alurmi <Keepers of Time Quartermaster>"] = "阿勒米 <時光守望者軍需官>"
L["Aluyen <Reagents>"] = "阿魯焰 <施法材料>"
L["Alyson Antille"] = "艾利森·安第列"
L["\"Ambassador\" Dagg'thol"] = "達格索大使"
L["Ambassador Pax'ivi"] = "帕克西維大使"
L["Ambrose Boltspark"] = "安布羅斯·拴炫"
L["Amnennar's Phylactery"] = "亞門納爾的骨匣"
L["Anachronos <Keepers of Time>"] = "安納克羅斯 <時光守望者>"
L["Ancient Equine Spirit"] = "上古聖馬之魂"
L["Ancient Treasure"] = "古代寶藏"
L["Andorgos <Brood of Malygos>"] = "安多葛斯 <瑪里苟斯的後裔>"
L["Andormu <Keepers of Time>"] = "安杜姆 <時光守望者>"
L["AN, Nerub"] = "AN/奈幽"
L["Aoren Sunglow <The Reliquary>"] = "安歐連·日耀"
L["Apoko"] = "阿波考"
L["Apothecary Baxter <Crown Chemical Co.>"] = "藥劑師巴克斯特 <王冠化學製藥公司>"
L["Apothecary Frye <Crown Chemical Co.>"] = "藥劑師弗萊伊 <王冠化學製藥公司>"
L["Apothecary Hummel <Crown Chemical Co.>"] = "藥劑師胡默爾 <王冠化學製藥公司>"
L["Apothecary Trio"] = "藥劑師三人組"
L["Apprentice Darius"] = "學徒達瑞爾斯"
L["AQ"] = "AQ"
L["AQ10"] = "AQ10"
L["AQ20"] = "AQ20"
L["AQ40"] = "AQ40"
L["Arazmodu <The Scale of Sands>"] = "阿拉斯莫杜 <流沙之鱗>"
L["Arca"] = "Arca/亞克"
L["Arcane Container"] = "秘法容器"
L["Archivum Console"] = "大資料庫控制臺"
L["Archmage Alturus"] = "大法師艾特羅斯"
L["Archmage Angela Dosantos <Brotherhood of the Light>"] = "大法師安琪拉·多桑杜 <聖光兄弟會>"
L["Archmage Elandra <Kirin Tor>"] = "大法師伊蘭卓 <祈倫托>"
L["Archmage Koreln <Kirin Tor>"] = "大法師寇瑞倫 <祈倫托>"
L["Archmage Leryda"] = "大法師利瑞達"
L["Archritualist Kelada"] = "大祭儀師凱烈德"
L["Arinoth"] = "阿瑞諾斯"
L["Armory"] = "軍械庫"
L["Arms Warrior"] = "武戰"
L["Artificer Morphalius"] = "工匠莫法利厄司"
L["Arygos"] = "亞雷戈斯"
L["Ashelan Northwood"] = "阿謝蘭·北木"
L["ATLAS_BUTTON_CLOSE"] = "關閉"
L["ATLAS_BUTTON_TOOLTIP_HINT"] = [=[左鍵開啟 Atlas.
中鍵開啟 Atlas 選項.
右鍵並拖曳以移動圖示按鈕位置.]=]
L["ATLAS_BUTTON_TOOLTIP_TITLE"] = "Atlas 副本地圖"
L["ATLAS_DDL_CONTINENT"] = "依不同大陸分類"
L["ATLAS_DDL_CONTINENT_BROKENISLES"] = "破碎群島副本"
L["ATLAS_DDL_CONTINENT_DEEPHOLM"] = "地深之源副本"
L["ATLAS_DDL_CONTINENT_DRAENOR"] = "德拉諾副本"
L["ATLAS_DDL_CONTINENT_EASTERN"] = "東部王國副本"
L["ATLAS_DDL_CONTINENT_KALIMDOR"] = "卡林多副本"
L["ATLAS_DDL_CONTINENT_NORTHREND"] = "北裂境副本"
L["ATLAS_DDL_CONTINENT_OUTLAND"] = "外域副本"
L["ATLAS_DDL_CONTINENT_PANDARIA"] = "潘達利亞副本"
L["ATLAS_DDL_EXPANSION"] = "依資料片分類"
L["ATLAS_DDL_EXPANSION_BC"] = "燃燒的遠征副本"
L["ATLAS_DDL_EXPANSION_CATA"] = "浩劫與重生副本"
L["ATLAS_DDL_EXPANSION_LEGION"] = "君臨天下副本"
L["ATLAS_DDL_EXPANSION_MOP"] = "潘達利亞之謎副本"
L["ATLAS_DDL_EXPANSION_OLD_AO"] = "舊世界副本 1/2"
L["ATLAS_DDL_EXPANSION_OLD_PZ"] = "舊世界副本 2/2"
L["ATLAS_DDL_EXPANSION_WOD"] = "德拉諾之霸副本"
L["ATLAS_DDL_EXPANSION_WOTLK"] = "巫妖王之怒副本"
L["ATLAS_DDL_LEVEL"] = "依等級分類"
L["ATLAS_DDL_LEVEL_100PLUS"] = "副本等級大於 100"
L["ATLAS_DDL_LEVEL_100TO110"] = "副本等級介於 100-110"
L["ATLAS_DDL_LEVEL_110PLUS"] = "副本等級大於 110"
L["ATLAS_DDL_LEVEL_45TO60"] = "副本等級介於 45-60"
L["ATLAS_DDL_LEVEL_60TO70"] = "副本等級介於 60-70"
L["ATLAS_DDL_LEVEL_70TO80"] = "副本等級介於 70-80"
L["ATLAS_DDL_LEVEL_80TO85"] = "副本等級介於 80-85"
L["ATLAS_DDL_LEVEL_85PLUS"] = "副本等級大於 85"
L["ATLAS_DDL_LEVEL_85TO90"] = "副本等級介於 85-90"
L["ATLAS_DDL_LEVEL_90TO100"] = "副本等級介於 90-100"
L["ATLAS_DDL_LEVEL_UNDER45"] = "副本等級低於 45"
L["ATLAS_DDL_PARTYSIZE"] = "依隊伍人數分類"
L["ATLAS_DDL_PARTYSIZE_10_AN"] = "10 人副本 1/2"
L["ATLAS_DDL_PARTYSIZE_10_OZ"] = "10 人副本 2/2"
L["ATLAS_DDL_PARTYSIZE_20TO40"] = "20-40 人副本"
L["ATLAS_DDL_PARTYSIZE_20TO40AH"] = "20-40 人副本 1/2"
L["ATLAS_DDL_PARTYSIZE_20TO40IZ"] = "20-40 人副本 2/2"
L["ATLAS_DDL_PARTYSIZE_5_AE"] = "5 人副本 1/3"
L["ATLAS_DDL_PARTYSIZE_5_FS"] = "5 人副本 2/3"
L["ATLAS_DDL_PARTYSIZE_5_TZ"] = "5 人副本 3/3"
L["ATLAS_DDL_TYPE"] = "依地圖類型分類"
L["ATLAS_DDL_TYPE_ENTRANCE"] = "副本入口"
L["ATLAS_DDL_TYPE_INSTANCE_AB"] = "副本 1/5"
L["ATLAS_DDL_TYPE_INSTANCE_AC"] = "副本 1/3"
L["ATLAS_DDL_TYPE_INSTANCE_CF"] = "副本 2/5"
L["ATLAS_DDL_TYPE_INSTANCE_DR"] = "副本 2/3"
L["ATLAS_DDL_TYPE_INSTANCE_GM"] = "副本 3/5"
L["ATLAS_DDL_TYPE_INSTANCE_NS"] = "副本 4/5"
L["ATLAS_DDL_TYPE_INSTANCE_SZ"] = "副本 3/3"
L["ATLAS_DDL_TYPE_INSTANCE_TZ"] = "副本 5/5"
L["ATLAS_DEP_MSG1"] = "Atlas 偵測到過期的模組"
L["ATLAS_DEP_MSG2"] = "這些模組已從這個角色被停用"
L["ATLAS_DEP_MSG3"] = "請將這些模組從 AddOns 目錄移除"
L["ATLAS_DEP_OK"] = "OK"
L["ATLAS_ENTRANCE_BUTTON"] = "入口"
L["ATLAS_INFO"] = "Atlas 訊息"
L["ATLAS_INFO_12200"] = [=[重要提示：

由於副本插件檔案大小日益增加，我們已獨立出部分副本地圖和內建插件
到單獨的模組。

您從各大遊戲插件網站所下載的 Atlas 插件，可能只包含了主要的核心功能
與最新資料片裡的副本地圖。

若您想要取得包含舊的資料片的所有地圖，以及 Atlas 團隊所開發的其他
模組，您必須分別下載這些獨立模組的壓縮檔並分別進行安裝。

請詳讀我們論壇的這個討論串以了解更多詳情：
|cff6666ffhttp://www.atlasmod.com/phpBB3/viewtopic.php?t=1522|cffffffff
或造訪我們的首頁：
|cff6666ffhttp://www.atlasmod.com/|cffffffff]=]
L["ATLAS_INFO_12201"] = [=[我們最近新增了一個新的 Atlas 插件 - |cff6666ffAtlas 情境地圖|cffffffff，用以提供 WoW 5.0 
起新增的情境事件的地圖。

請參見我們的網站以取得更詳細的資訊，並請記得分別下載並安裝此插件。
|cff6666ffhttp://www.atlasmod.com/|cffffffff]=]
L["ATLAS_INSTANCE_BUTTON"] = "副本"
L["ATLAS_LDB_HINT"] = [=[左鍵開啟 Atlas.
中鍵開啟 Atlas 選項.
右鍵打開顯示選單.]=]
L["ATLAS_MINIMAPLDB_HINT"] = [=[左鍵開啟 Atlas.
右鍵開啟 Atlas 選項.
左鍵並拖曳以移動圖示按鈕位置.]=]
L["ATLAS_MISSING_MODULE"] = [=[Atlas 已偵測到遺失的模組／插件。

這有可能是因為先前您有過期的模組／插件而被 Atlas 停用。
如果您現在已經將所有的模組／插件安裝到最新版，請到插件列表裡確認是否所有的項目都已被啟用。

如果您確認您不需要這些「遺失」的插件並且不想繼續看到這樣的通知，您可以到選項視窗去關閉通知。

以下是遺失的模組／插件列表：
]=] -- Needs review
L["ATLAS_OPEN_ADDON_LIST"] = "開啟插件列表"
L["ATLAS_OPTIONS_ACRONYMS"] = "顯示副本縮寫"
L["ATLAS_OPTIONS_ACRONYMS_TIP"] = "在地圖的詳盡敘述中顯示副本的縮寫"
L["ATLAS_OPTIONS_AUTOSEL"] = "自動選擇副本地圖"
L["ATLAS_OPTIONS_AUTOSEL_TIP"] = "Atlas 可偵測您目前所在的副區域以顯示一個最佳的副本地圖"
L["ATLAS_OPTIONS_BOSS_DESC"] = "當首領資訊可獲取時, 顯示該資訊"
L["ATLAS_OPTIONS_BOSS_DESC_SCALE"] = "首領資訊提示視窗大小比率"
L["ATLAS_OPTIONS_BOSS_DESC_TIP"] = "當滑鼠游標移動到地圖上首領的標號時, 並且首領資訊可獲取時, 顯示該首領的相關資訊."
L["ATLAS_OPTIONS_BUTPOS"] = "按鈕位置"
L["ATLAS_OPTIONS_BUTRAD"] = "按鈕半徑範圍"
L["ATLAS_OPTIONS_BUTTON"] = "選項"
L["ATLAS_OPTIONS_CATDD"] = "副本地圖分類方式:"
L["ATLAS_OPTIONS_CHECKMODULE"] = "提醒我是否有遺失的模組或插件"
L["ATLAS_OPTIONS_CHECKMODULE_TIP"] = "勾選以在每次登入 WoW 時檢查是否有遺失的 Atlas 模組或插件。"
L["ATLAS_OPTIONS_CLAMPED"] = "使 Atlas 視窗不超出遊戲畫面"
L["ATLAS_OPTIONS_CLAMPED_TIP"] = "使 Atlas 視窗被拖曳時不會超出遊戲主畫面的邊界, 關閉此選項則可將 Atlas 視窗拖曳並超出遊戲畫面邊界"
L["ATLAS_OPTIONS_COLORINGDROPDOWN"] = "副本清單以難易度色彩顯示"
L["ATLAS_OPTIONS_COLORINGDROPDOWN_TIP"] = "依據副本建議的最低進入等級、以及玩家現今等級的差異，將副本清單以難易度色彩顯示。"
L["ATLAS_OPTIONS_CTRL"] = "按住 Ctrl 鍵以顯示工具提示"
L["ATLAS_OPTIONS_CTRL_TIP"] = "勾選後, 當滑鼠移到地圖資訊欄位時, 按下 Ctrl 控制鍵, 則會將資訊的完整資訊以提示型態顯示. 當資訊過長而被截斷時很有用."
L["ATLAS_OPTIONS_DONTSHOWAGAIN"] = "不再顯示相同訊息。"
L["ATLAS_OPTIONS_LOCK"] = "鎖定 Atlas 視窗位置"
L["ATLAS_OPTIONS_LOCK_TIP"] = "設定將 Atlas 視窗位置鎖定或不鎖定"
L["ATLAS_OPTIONS_RCLICK"] = "滑鼠右鍵開啟世界地圖"
L["ATLAS_OPTIONS_RCLICK_TIP"] = "啟用在 Atlas 視窗中按下滑鼠右鍵自動切換到魔獸的世界地圖"
L["ATLAS_OPTIONS_RESETPOS"] = "重設位置"
L["ATLAS_OPTIONS_SCALE"] = "Atlas 視窗大小比率"
L["ATLAS_OPTIONS_SHOWBUT"] = "在小地圖旁顯示 Atlas 按鈕"
L["ATLAS_OPTIONS_SHOWBUT_TIP"] = "在小地圖旁顯示 Atlas 按鈕"
L["ATLAS_OPTIONS_TRANS"] = "透明度"
L["ATLAS_SEARCH_UNAVAIL"] = "搜尋功能停用"
L["ATLAS_SLASH"] = "/atlas"
L["ATLAS_SLASH_OPTIONS"] = "options"
L["ATLAS_STRING_CLEAR"] = "清除"
L["ATLAS_STRING_LEVELRANGE"] = "等級範圍"
L["ATLAS_STRING_LOCATION"] = "所在位置"
L["ATLAS_STRING_MINLEVEL"] = "最低等級"
L["ATLAS_STRING_PLAYERLIMIT"] = "人數上限"
L["ATLAS_STRING_RECLEVELRANGE"] = "建議等級"
L["ATLAS_STRING_SEARCH"] = "搜尋"
L["ATLAS_STRING_SELECT_CAT"] = "選擇類別"
L["ATLAS_STRING_SELECT_MAP"] = "選擇地圖"
L["ATLAS_TITLE"] = "Atlas 地圖集"
L["Attunement Required"] = "需完成傳送門/鑰匙前置任務"
L["Auch"] = "Auch"
L["Augh"] = "奧各"
L["Auld Stonespire"] = "奧爾德·石塔"
L["Auntie Stormstout"] = "風暴烈酒姑媽"
L["Avatar of the Martyred"] = "馬丁瑞德的化身"
L["Back"] = "後方"
L["Baelog's Chest"] = "巴爾洛戈的箱子"
L["Bakkalzu"] = "巴卡祖"
L["Baleflame"] = "罪火"
L["Ban Bearheart"] = "班·熊心"
L["Barkeep Kelly <Bartender>"] = "酒吧老闆凱利 <酒保>"
L["Barnes <The Stage Manager>"] = "巴奈斯 <舞台管理員>"
L["Baroness Dorothea Millstipe"] = "女爵朵洛希·米爾斯泰普"
L["Baron Rafe Dreuger"] = "男爵洛夫·崔克爾"
L["Basement"] = "地下室"
L["Battle for Mount Hyjal"] = "海加爾山戰場"
L["B.E Barechus <S.A.F.E.>"] = "怪怪頭 <S.A.F.E.>"
L["Belgaristrasz"] = "貝加瑞斯塔茲"
L["Belnistrasz"] = "貝尼斯特拉茲"
L["Bennett <The Sergeant at Arms>"] = "班尼特 <待命中的中士>"
L["Berinand's Research"] = "貝瑞那德的研究"
L["Berserking Boulder Roller"] = "狂暴巨礫滾動者"
L["Berthold <The Doorman>"] = "勃特霍德 <看門人>"
L["BF"] = "BF"
L["BFD"] = "BFD/黑淵"
L["BH"] = "BH"
L["Bilger the Straight-laced"] = "嚴厲者畢歐吉"
L["BINDING_HEADER_ATLAS_TITLE"] = "Atlas 按鍵設定"
L["BINDING_NAME_ATLAS_AUTOSEL"] = "自動選擇"
L["BINDING_NAME_ATLAS_OPTIONS"] = "切換設定"
L["BINDING_NAME_ATLAS_TOGGLE"] = "開啟/關閉 Atlas"
L["Black Dragonflight Chamber"] = "黑龍軍團密室"
L["Blacksmithing Plans"] = "黑鐵鍛造圖樣"
L["Blastmaster Emi Shortfuse"] = "爆破專家艾米·短線"
L["Blood Guard Hakkuz <Darkspear Elite>"] = "血衛士哈庫茲 <暗矛精英>"
L["Blood of Innocents"] = "鑰匙: 無辜者之血"
L["Bloodslayer T'ara <Darkspear Veteran>"] = "血腥殺戮者特亞拉 <暗矛精兵>"
L["Bloodslayer Vaena <Darkspear Veteran>"] = "血腥殺戮者瓦那 <暗矛精兵>"
L["Bloodslayer Zala <Darkspear Veteran>"] = "血腥殺戮者札拉 <暗矛精兵>"
L["Bodley"] = "布德利"
L["Bortega <Reagents & Poison Supplies>"] = "伯特卡 <施法材料和毒藥供應商>"
L["BoT"] = "BoT"
L["Bota"] = "Bota/波塔"
L["Bovaal Whitehorn"] = "波瓦爾·白角"
L["Bowmistress Li <Guard Captain>"] = "女弓手李 <守衛隊長>"
L["Brann Bronzebeard"] = "布萊恩·銅鬚"
L["Brazen"] = "布瑞茲恩"
L["BRC"] = "BRC"
L["BRD"] = "BRD/黑石淵"
L["Brewfest"] = "啤酒節"
L["BRF"] = "BRF"
L["Brigg Smallshanks"] = "布里格·細柄"
L["Briney Boltcutter <Blackwater Financial Interests>"] = "布蘭尼·破壞剪 <黑水金融>"
L["BRM"] = "BRM/黑石山"
L["Broken Stairs"] = "損壞的階梯"
L["BSM"] = "BSM"
L["BT"] = "BT/黑廟"
L["Bucket of Meaty Dog Food"] = "一桶豐盛狗食"
L["BWD"] = "BWD"
L["BWL"] = "BWL/黑翼"
L["Cache of Eregos"] = "伊瑞茍斯的貯藏箱"
L["Caelestrasz"] = "凱雷斯特拉茲"
L["Calliard <The Nightman>"] = "卡利卡 <夜間工作者>"
L["Captain Alina"] = "隊長阿蓮娜"
L["Captain Boneshatter"] = "隊長碎骨"
L["Captain Drenn"] = "德蘭上尉"
L["Captain Edward Hanes"] = "隊長艾德華·漢尼斯"
L["Captain Hadan"] = "哈丹隊長"
L["\"Captain\" Kaftiz"] = "隊長卡夫提茲"
L["Captain Qeez"] = "奎茲上尉"
L["Captain Sanders"] = "桑德斯船長"
L["Captain Taylor"] = "泰勒隊長"
L["Captain Tuubid"] = "圖畢德上尉"
L["Captain Wyrmak"] = "維爾瑪克隊長"
L["Captain Xurrem"] = "瑟瑞姆上尉"
L["Cath"] = "教堂"
L["Cathedral"] = "大教堂"
L["Cavern Entrance"] = "洞穴入口"
L["Caza'rez"] = "卡沙瑞斯"
L["Celebras the Redeemed"] = "贖罪的塞雷布拉斯"
L["Centrifuge Construct"] = "離心傀儡"
L["Champ"] = "勇士"
L["Champions of the Alliance"] = "聯盟大勇士"
L["Champions of the Horde"] = "部落大勇士"
L["Charred Bone Fragment"] = "燒焦的白骨碎片"
L["Chase Begins"] = "追逐開始"
L["Chase Ends"] = "追逐結束"
L["Chef Jessen <Speciality Meat & Slop>"] = "廚師傑森 <特殊肉品和食物>"
L["Chen Stormstout"] = "老陳·風暴烈酒"
L["Chester Copperpot <General & Trade Supplies>"] = "查斯特·銅壺 <一般與貿易供應商>"
L["Chief Engineer Bilgewhizzle <Gadgetzan Water Co.>"] = "首席工程師膨嘯 <加基森水業公司>"
L["Child"] = "幼年"
L["Chomper"] = "咀嚼者"
L["Chromie"] = "克羅米"
L["Chronicler Bah'Kini"] = "撰史者巴琪妮"
L["Clarissa"] = "克萊瑞莎"
L["Click to open Dungeon Journal window."] = "按下以開啟地城導覽視窗."
L["Coffer of Forgotten Souls"] = "遺忘靈魂的法櫃"
L["Colon"] = "："
L["Colonel Zerran"] = "澤朗上校"
L["Colosos"] = "克羅索斯"
L["Comma"] = "，"
L["Commander Bagran"] = "指揮官巴格仁"
L["Commander Lindon"] = "指揮官林敦"
L["Commander Mograine"] = "指揮官莫格萊尼"
L["Compendium of the Fallen"] = "墮落者綱要"
L["Connection"] = "通道"
L["Core Fragment"] = "熔核碎片"
L["CoT"] = "CoT"
L["CoT1"] = "CoT1/舊址"
L["CoT2"] = "CoT2/黑沼"
L["CoT3"] = "CoT3/海山"
L["CoT-DS"] = "CoT-DS"
L["CoT-ET"] = "CoT-ET"
L["CoT-HoT"] = "CoT-HoT"
L["CoT-Strat"] = "CoT斯坦"
L["CoT-WoE"] = "CoT-WoE"
L["CR"] = "CR/盤牙"
L["Crus"] = "十字軍"
L["Crusade Commander Eligor Dawnbringer <Brotherhood of the Light>"] = "指揮官艾利格·黎明使者 <聖光兄弟會>"
L["Crusade Commander Korfax <Brotherhood of the Light>"] = "『聖光勇士』柯菲斯 <聖光兄弟會>"
L["Crusaders' Coliseum"] = "銀白大競技場"
L["Crusaders' Square Postbox"] = "十字軍廣場郵箱"
L["Cryo-Engineer Sha'heen"] = "工程師薩希恩"
L["Cursed Centaur"] = "被詛咒的半人馬"
L["Dantalionax"] = "丹塔利翁斯"
L["Darkheart"] = "黑心"
L["Dark Keeper Key"] = "黑暗守衛者鑰匙"
L["Dark Ranger Kalira"] = "黑暗遊俠卡麗菈"
L["Dark Ranger Loralen"] = "黑暗遊俠洛拉倫"
L["Dark Ranger Marrah"] = "黑暗遊俠瑪拉"
L["Dark Ranger Velonara"] = "黑暗遊俠薇蘿娜拉"
L["Dasnurimi <Geologist & Conservator>"] = "達斯魯黎米 <地理學家與護存者>"
L["Dealer Tariq <Shady Dealer>"] = "商人塔爾利奎 <黑市商人>"
L["Dealer Vijaad"] = "商人維傑"
L["Deathstalker Commander Belmont"] = "亡靈哨兵指揮官貝爾蒙特"
L["Defender Mordun"] = "防衛者摩丹"
L["Dire Maul Arena"] = "厄運競技場"
L["Dire Pool"] = "厄運之池"
L["Divination Scryer"] = "鑰匙: 預言水晶球"
L["DM"] = "DM/厄運"
L["Dominic"] = "多明尼克"
L["Don Carlos"] = "卡洛斯大爺"
L["D'ore"] = "迪歐瑞"
L["Draenei Spirit"] = "德萊尼靈魂"
L["Drakkisath's Brand"] = "達基薩斯徽記"
L["Drakuru's Brazier"] = "德拉庫魯的火盆"
L["Drisella"] = "崔賽拉"
L["Druid of the Talon"] = "猛禽德魯伊"
L["DTK"] = "DTK/德拉克"
L["Earthbinder Rayge"] = "縛地者瑞吉"
L["Earthwarden Yrsa <The Earthen Ring>"] = "大地守望者伊爾薩 <陶土議會>"
L["East"] = "東"
L["EB"] = "EB"
L["Ebonlocke <The Noble>"] = "埃伯洛克 <貴族>"
L["Ebru <Disciple of Naralex>"] = "厄布魯 <納拉雷克斯的侍徒>"
-- L["Echoing Horn of the Damned"] = ""
L["Echo of Medivh"] = "麥迪文的回音"
L["Elder Chogan'gada"] = "修干加達長者"
L["Elder Farwhisper"] = "遙語長者"
L["Elder Igasho"] = "伊加修長者"
L["Elder Jarten"] = "加坦長者"
L["Elder Kilias"] = "奇里亞斯長者"
L["Elder Mistwalker"] = "霧行長者"
L["Elder Morndeep"] = "深晨長者"
L["Elder Nurgen"] = "訥金長者"
L["Elder Ohanzee"] = "歐漢茲長者"
L["Elder Splitrock"] = "劈石長者"
L["Elders' Square Postbox"] = "長者廣場郵箱"
L["Elder Starsong"] = "星歌長者"
L["Elder Stonefort"] = "石壘長者"
L["Elder Wildmane"] = "蠻鬃長者"
L["Elder Yurauk"] = "由羅克長者"
L["Elevator"] = "電梯"
L["Ellrys Duskhallow"] = "艾爾里斯·聖暮"
L["End"] = "結束"
L["Engineer"] = "工程師"
L["Entrance"] = "入口"
L["Eramas Brightblaze"] = "依拉瑪·火光"
L["Erozion"] = "伊洛森"
L["Escape from Durnholde Keep"] = "逃離敦霍爾德"
L["Estulan <The Highborne>"] = "艾斯圖蘭"
L["Eternos"] = "伊特諾斯"
L["Ethereal Transporter Control Panel"] = "虛空傳送者控制面板"
L["Eulinda <Reagents>"] = "尤琳達 <施法材料>"
L["Eva Sarkhoff"] = "伊娃·薩克霍夫"
L["Event"] = "事件"
L["Exalted"] = "崇拜"
L["Exarch Larethor"] = "主教雷索爾"
L["Exit"] = "出口"
L["Face <S.A.F.E.>"] = "小白臉 <S.A.F.E.>"
L["Fairbanks"] = "費爾班克"
L["Falrin Treeshaper"] = "法琳·樹形者"
L["Farmer Kent"] = "農夫肯特"
L["Farseer Tooranu <The Earthen Ring>"] = "先知圖拉奴 <陶土議會>"
L["Father Flame"] = "烈焰之父"
L["Fathom Stone"] = "深淵之石"
L["Fel Crystals"] = "惡魔水晶"
L["Fenstalker"] = "沼群巡者"
L["Ferra"] = "費拉"
L["Festival Lane Postbox"] = "節日小道郵箱"
L["FH1"] = "FH1"
L["FH2"] = "FH2"
L["FH3"] = "FH3"
L["Field Commander Mahfuun"] = "戰場元帥瑪赫范"
L["Finkle Einhorn"] = "芬克·恩霍爾"
L["Fire of Aku'mai"] = "阿庫麥爾之火"
L["First Fragment Guardian"] = "第一碎片守衛者"
L["Fizzle"] = "費索"
L["FL"] = "FL"
L["Flaming Eradicator"] = "火焰根除者"
L["Flesh'rok the Diseased <Primordial Saurok Horror>"] = "『瘟疫獸』血腐洛克 <原生薩烏洛克的恐怖>"
L["Focused Eye"] = "集束之眼"
L["Forbidden Rites and other Rituals Necromantic"] = "禁忌儀式與其他死靈儀式"
L["Forest Frogs"] = "森林樹蛙"
L["FoS"] = "FoS/熔爐"
L["Four Kaldorei Elites"] = "四個卡多雷精英"
L["Fourth Stop"] = "第四停留點"
L["Frances Lin <Barmaid>"] = "法蘭斯·林 <酒吧女服務員>"
L["Fras Siabi's Postbox"] = "弗拉斯·希亞比的郵箱"
L["From previous map"] = "到前一個地圖"
L["Front"] = "前方"
L["Frostwyrm Lair"] = "冰霜巨龍的巢穴"
L["Furgus Warpwood"] = "佛格斯·扭木"
L["Galamav the Marksman <Kargath Expeditionary Force>"] = "『神射手』賈拉瑪弗 <卡加斯遠征軍>"
L["Galgrom <Provisioner>"] = "卡葛隆姆 <物資供應者>"
L["Garaxxas"] = "卡拉克薩斯"
L["Gazakroth"] = "葛薩克羅司"
L["GB"] = "GB"
L["GD"] = "GD"
L["Ghost"] = "鬼魂"
L["GL"] = "GL/戈魯爾"
L["Gnome"] = "Gnome/諾姆"
L["Gomora the Bloodletter"] = "『放血者』高摩拉"
L["Gorkun Ironskull"] = "葛剛·鐵顱"
L["Gradav <The Warlock>"] = "葛瑞戴 <術士>"
L["Graveyard"] = "墓地"
L["Greatfather Aldrimus"] = "大祖父阿爾崔瑪斯"
L["GSS"] = "GSS"
L["Guardian of Time"] = "時光守護者"
L["Gub <Destroyer of Fish>"] = "古布 <魚類滅殺者>"
L["Guerrero"] = "葛雷洛"
L["Gun"] = "Gun/剛德"
L["Gunny"] = "甘尼"
L["GY"] = "GY"
L["Ha'lei"] = "哈勒"
L["Ha'Lei"] = "哈勒"
L["Hallow's End"] = "萬鬼節"
L["Halls"] = "Halls/大廳"
L["Hal McAllister"] = "哈爾·馬克奧里斯特"
L["Hann Ibal <S.A.F.E.>"] = "漢·泥巴 <S.A.F.E.>"
L["Harald <Food Vendor>"] = "哈拉德 <食物商人>"
L["Hastings <The Caretaker>"] = "哈斯丁 <照料者>"
L["Haunted Stable Hand"] = "鬼怪獸欄僕人"
L["Hazlek"] = "哈茲雷克"
L["HC"] = "HC/火堡"
L["Helcular"] = "赫爾庫拉"
L["Helpful Jungle Monkey"] = "好幫手叢林猴"
L["Herod the Bully"] = "流氓希洛特"
L["Heroic"] = "英雄"
L["Heroic_Symbol"] = "(英雄)"
L["Heroic: Trial of the Grand Crusader"] = "英雄: 大十字軍試煉"
L["Hierophant Theodora Mulvadania <Kargath Expeditionary Force>"] = "祭師塞朵拉·穆瓦丹尼 <卡加斯遠征軍>"
L["High Examiner Tae'thelan Bloodwatcher <The Reliquary>"] = "高階審查員泰瑟連·血腥看守者 <聖匣守護者>"
L["High Justice Grimstone"] = "裁決者格里斯通"
L["HM"] = "HM"
L["HoF"] = "HoF"
L["HoL"] = "HoL/雷光"
L["Holy Paladin"] = "神聖聖騎"
L["Holy Priest"] = "神聖牧師"
L["HoO"] = "HoO"
L["Hooded Crusader"] = "戴頭罩的十字軍"
L["HoR"] = "HoR/倒影"
L["Horde Encampment"] = "部落營地"
L["Horvon the Armorer <Armorsmith>"] = "護甲匠霍沃 <護甲鍛造師>"
L["HoS"] = "HoS/石廳"
L["Hunter"] = "獵人"
L["Hyphen"] = "－"
L["IC"] = "ICC/冰冠"
L["ID"] = "ID"
L["Image of Argent Confessor Paletress"] = "銀白告解者帕爾璀絲的影像"
L["Image of Drakuru"] = "德拉庫魯的影像"
L["Imp"] = "小鬼"
L["Indormi <Keeper of Ancient Gem Lore>"] = "隱多米 <寶石傳說的守護者>"
L["Innkeeper Monica"] = "旅店老闆莫妮卡"
L["Instructor Chillheart's Phylactery"] = "講師冷心的骨匣"
L["In the Shadow of the Light"] = "在聖光的陰影之中"
L["Investigator Fezzen Brasstacks"] = "調查員菲贊·銅釘"
L["Invoker Xorenth"] = "塑能師索倫斯"
L["Ironbark the Redeemed"] = "贖罪的鐵朴"
L["Isfar"] = "伊斯法"
L["Isillien"] = "伊斯利恩"
L["Itesh"] = "伊塔許"
L["Jaelyne Evensong"] = "潔琳·晚歌"
L["Jalinda Sprig <Morgan's Militia>"] = "加琳達 <摩根的民兵>"
L["Jay Lemieux"] = "杰·黎米厄斯"
L["J'eevee's Jar"] = "耶維爾的瓶子"
L["Je'neu Sancrea <The Earthen Ring>"] = "耶努薩克雷 <陶土議會>"
L["Jerry Carter"] = "傑瑞·卡特"
L["Jonathan Revah"] = "強納森·瑞瓦"
L["Joseph the Awakened"] = "甦醒的約瑟夫"
L["Joseph the Crazed"] = "發瘋的約瑟夫"
L["Joseph the Insane <Scarlet Champion>"] = "瘋掉的約瑟夫 <血色勇士>"
L["Julie Honeywell"] = "喬莉·哈妮威爾"
L["Kagani Nightstrike"] = "卡嘉尼·夜擊"
L["Kagtha"] = "卡格薩"
L["Kaldir Ironbane"] = "卡迪爾·鐵禍"
L["Kaldrick"] = "卡爾崔克"
L["Kamsis <The Conjurer>"] = "康席斯 <咒術師>"
L["Kandrostrasz <Brood of Alexstrasza>"] = "坎多斯塔茲 <雅立史卓莎的後裔>"
L["Kand Sandseeker <Explorer's League>"] = "坎德·覓沙 <探險者協會>"
L["Kara"] = "Kara/卡拉"
L["Kasha"] = "卡沙"
L["Kaulema the Mover"] = "移石者考勒瑪"
L["Keanna's Log"] = "琪安娜的日誌"
L["Kel'Thuzad's Deep Knowledge"] = "科爾蘇加德的深層知識"
L["Kevin Dawson <Morgan's Militia>"] = "凱文·多森 <摩根的民兵>"
L["Key"] = "鑰匙"
L["Kherrah"] = "凱拉"
-- L["King Bjorn"] = ""
-- L["King Haldor"] = ""
-- L["King Ranulf"] = ""
L["King's Square Postbox"] = "國王廣場郵箱"
-- L["King Tor"] = ""
L["Knot Thimblejack"] = "諾特·希姆加克"
L["Koragg"] = "可拉格"
L["Korag Proudmane"] = "科洛特·波特曼"
L["Koren <The Blacksmith>"] = "卡爾侖 <鐵匠>"
L["Koristrasza"] = "柯莉史卓莎"
L["Kurzel"] = "庫賽爾"
L["Lady Catriona Von'Indi"] = "凱崔娜·瓦映迪女士"
L["Lady Jaina Proudmoore"] = "珍娜·普勞德摩爾女士"
L["Lady Keira Berrybuck"] = "凱伊拉·拜瑞巴克女士"
L["Lady Sylvanas Windrunner <Banshee Queen>"] = "希瓦娜斯·風行者女士 <女妖之王>"
L["Lakka"] = "拉卡"
L["Lana Stouthammer"] = "菈娜·頑錘"
L["Landing Spot"] = "降落點"
L["Large Stone Obelisk"] = "大型石板"
L["LBRS"] = "LBRS/黑下"
L["LCoT"] = "LCoT"
L["L-DQuote"] = "「"
L["Lead Prospector Durdin <Explorer's League>"] = "首席勘察員杜爾丁 <探險者協會>"
L["Legionnaire Nazgrim"] = "軍團士兵納茲格寧姆"
L["Lenzo"] = "蘭佐"
L["Lexlort <Kargath Expeditionary Force>"] = "雷克斯洛特 <卡加斯遠征軍>"
L["Lib"] = "Lib"
L["Library"] = "圖書館"
L["Lidia Sunglow <The Reliquary>"] = "莉蒂雅·日耀"
L["Lieutenant Horatio Laine"] = "何瑞修·萊恩中尉"
L["Lieutenant Sinclari"] = "辛克拉麗中尉"
L["Little Jimmy Vishas"] = "小吉米·維希斯"
L["Lokhtos Darkbargainer <The Thorium Brotherhood>"] = "羅克圖斯·暗契 <瑟銀兄弟會>"
L["Lord Afrasastrasz"] = "艾弗薩斯塔茲領主"
L["Lord Crispin Ference"] = "貴族克利斯平·費蘭斯"
L["Lord Itharius"] = "伊薩里奧斯領主"
L["Lord Raadan"] = "領主雷阿登"
L["Lord Robin Daris"] = "貴族羅賓·達利斯"
L["Lorekeeper Javon"] = "博學者亞沃"
L["Lorekeeper Kildrath"] = "博學者基爾達斯"
L["Lorekeeper Lydros"] = "博學者萊德羅斯"
L["Lorekeeper Mykos"] = "博學者麥庫斯"
L["Lorgalis Manuscript"] = "洛迦里斯手稿"
L["Lothos Riftwaker"] = "洛索斯·天痕"
L["Love is in the Air"] = "愛就在身邊"
L["Lower"] = "下層"
L["L-Parenthesis"] = "（"
L["L-SBracket"] = "【"
L["Lucien Sarkhoff"] = "盧森·薩克霍夫"
L["Lumbering Oaf"] = "笨重的歐弗"
L["Lunar Festival"] = "新年慶典"
L["Lurah Wrathvine <Crystallized Firestone Collector>"] = "盧拉·怒藤 <晶化火石收集者>"
L["Madrigosa"] = "瑪德里茍沙"
L["Mag"] = "Mag/瑪瑟"
L["Mage"] = "法師"
L["Magical Brazier"] = "魔法火盆"
L["Magistrate Henry Maleb"] = "赫尼·馬雷布鎮長"
L["Mail Box"] = "鎖甲箱"
L["Main Chambers Access Panel"] = "主房間通道面板"
L["Major Pakkon"] = "帕康少校"
L["Major Yeggeth"] = "葉吉斯少校"
L["Mamdy the \"Ologist\""] = "『學家』瑪姆迪"
L["MapA"] = " [1]"
L["MapB"] = " [2]"
L["MapC"] = " [3]"
L["MapD"] = " [4]"
L["MapE"] = " [5]"
L["MapF"] = " [6]"
L["MapG"] = " [7]"
L["MapH"] = " [8]"
L["MapI"] = " [9]"
L["MapJ"] = " [10]"
L["MapsNotFound"] = [=[目前的副本找不到對應的地圖影像檔.

請確認您是否有安裝 Atlas 相關的副本地圖模組.]=]
L["Mara"] = "Mara/瑪拉"
L["Market Row Postbox"] = "市場郵箱"
L["Marshal Jacob Alerius"] = "傑科布·亞雷瑞斯元帥"
L["Marshal Maxwell <Morgan's Militia>"] = "麥斯威爾元帥 <摩根的民兵>"
L["Martin Victus"] = "馬汀·維特斯"
L["Master Craftsman Wilhelm <Brotherhood of the Light>"] = "工匠大師維爾海姆 <聖光兄弟會>"
L["Master Elemental Shaper Krixix"] = "大元素師克里希克"
L["Master Windstrong"] = "風強大師"
L["MaT"] = "MT/博學"
L["Mawago"] = "瑪哇苟"
L["Maxwort Uberglint"] = "麥克斯沃特·尤柏格林"
L["Mayara Brightwing <Morgan's Militia>"] = "瑪亞拉·亮翼 <摩根的民兵>"
L["Mazoga's Spirit"] = "瑪柔伽的靈魂"
L["MC"] = "MC"
L["Mech"] = "Mech/麥克"
L["Meeting Stone"] = "集合石"
L["Meeting Stone of Hellfire Citadel"] = "集合石 - 地獄火堡壘"
L["Meeting Stone of Magtheridon's Lair"] = "集合石 - 瑪瑟里頓的巢穴"
L["Melasong"] = "馬拉頌"
L["Melissa"] = "梅麗莎"
L["Merithra of the Dream"] = "夢境之龍麥琳瑟拉"
L["Micah"] = "米迦"
L["Middle"] = "中間"
L["Midsummer Festival"] = "仲夏節慶"
L["Millhouse Manastorm"] = "米歐浩斯·曼納斯頓"
L["Miss Mayhem"] = "暴行小姐"
L["Mistress Nagmara"] = "娜瑪拉小姐"
L["Monara <The Last Queen>"] = "魔娜菈 <魔古的末代皇后>"
L["Monk"] = "僧侶"
L["Moonwell"] = "月井"
L["Mor'Lek the Dismantler"] = "拆卸人摩勒克"
L["Mortaxx <The Tolling Bell>"] = "莫爾塔克斯 <鐘鳴者>"
L["Mortog Steamhead"] = "莫塔格·史提海德"
L["Mountaineer Orfus <Morgan's Militia>"] = "巡山人歐弗斯 <摩根的民兵>"
L["MP"] = "MP"
L["Mr. Bigglesworth"] = "畢勾沃斯先生"
L["MT"] = "MT/法力"
L["Murd Doc <S.A.F.E.>"] = "哮·狼的護腿 <S.A.F.E.>"
L["Muyoh <Disciple of Naralex>"] = "繆幽 <納拉雷克斯的侍徒>"
L["MV"] = "MV"
L["Mysterious Bookshelf"] = "神秘的書架"
-- L["Mythic"] = ""
L["Mythic_Symbol"] = "(傳奇)"
L["Nahuud"] = "納霍德"
L["Nalpak <Disciple of Naralex>"] = "納爾派克 <納拉雷克斯的侍徒>"
L["Naralex"] = "納拉雷克斯"
L["Naresir Stormfury <Avengers of Hyjal Quartermaster>"] = "那瑞希爾·風暴之怒 <海加爾復仇者軍需官>"
L["Nathanos Marris"] = "納薩諾斯·瑪瑞斯"
L["Nat Pagle"] = "納特·帕格"
L["Naturalist Bite"] = "自然學家拜特"
L["Nax"] = "Nax/納克"
L["Neptulon"] = "奈普圖隆"
L["Nex, Nexus"] = "Nex/奧心"
L["Nexus-Prince Haramad"] = "奈薩斯王子哈拉瑪德"
L["Night Elf Village"] = "夜精靈村"
L["No'ku Stormsayer <Lord of Tempest>"] = "諾庫·風暴預言者 <風暴之王>"
L["Norkani"] = "諾卡尼"
L["North"] = "北"
L["Nozari <Keepers of Time>"] = "諾札瑞 <時光守望者>"
L["Nozdormu"] = "諾茲多姆"
L["Nurse Lillian"] = "護士莉蓮"
L["Ocu"] = "Ocu/奧眼"
L["Okuno <Ashtongue Deathsworn Quartermaster>"] = "歐庫諾 <灰舌死亡誓言者軍需官>"
L["Old Ironbark"] = "埃隆巴克"
L["Olga Runesworn <Explorer's League>"] = "歐嘉·符誓 <探險者協會>"
L["Ony"] = "Ony/黑龍"
L["Opening of the Dark Portal"] = "開啟黑暗之門"
L["Optional"] = "可選擇"
L["Oralius <Morgan's Militia>"] = "奧拉留斯 <摩根的民兵>"
L["Orange"] = "橙"
L["Orb of Command"] = "命令寶珠"
L["Orb of Domination"] = "統禦寶珠"
L["OS"] = "OS/黑曜"
L["Outside"] = "戶外"
L["Overcharged Manacell"] = "滿溢的法力容器"
L["Overseer Blingbang"] = "監督者閃砰"
L["Overwatch Mark 0 <Protector>"] = "守候者零型 <保衛者>"
L["Packleader Ivar Bloodfang"] = "狼群首領伊瓦·血牙"
L["Packmaster Stonebruiser <Brotherhood of the Light>"] = "軍需籌備官石漢 <聖光兄弟會>"
L["Paladin"] = "聖騎士"
L["Path to the Broken Stairs"] = "通往損壞的階梯的通道"
L["Path to the Hellfire Ramparts and Shattered Halls"] = "通往地獄火壁壘與破碎大廳的通道"
L["Period"] = "。"
L["Phin Odelic <The Kirin Tor>"] = "費恩·奧德利克 <祈倫托>"
L["Polyformic Acid Potion"] = "變體蟻酸藥水"
L["Portal"] = "入口/傳送門"
L["PoS"] = "PoS"
L["PossibleMissingModule"] = "遺失的地圖應是來自以下的模組: "
L["Precious"] = "普萊瑟斯"
L["Priest"] = "牧師"
L["Priestess Summerpetal"] = "女司祭夏瓣"
L["Priestess Udum'bra"] = "女祭師烏丹姆布拉"
L["Private Jacint"] = "士兵賈辛特"
L["Private Rocknot"] = "羅克諾特下士"
L["Professor Slate"] = "史雷特教授"
L["Prospector Doren"] = "勘察員多倫"
L["Prospector Seymour <Morgan's Militia>"] = "勘查員希摩爾 <摩根的民兵>"
L["Protection Warrior"] = "防戰"
L["Provisioner Tsaalt"] = "糧食供應者·茲索特"
L["Pumpkin Shrine"] = "無頭騎士南瓜"
L["Purple"] = "紫"
L["Pylons"] = "水晶塔"
L["Quartermaster Lewis <Quartermaster>"] = "軍需官路易斯 <軍需官>"
L["Raleigh the True"] = "純真者洛歐欸"
L["Ramdor the Mad"] = "瘋狂者藍姆多"
L["Ramp"] = "Ramp"
L["Ramp down to the Gamesman's Hall"] = "通往投機者大廳的斜坡"
L["Ramp to Guardian's Library"] = "通往管理員圖書館的斜坡"
L["Ramp to Medivh's Chamber"] = "通往麥迪文房間的斜坡"
L["Ramp up to the Celestial Watch"] = "通往天文觀測台的斜坡"
L["Random"] = "隨機"
L["Randy Whizzlesprocket"] = "藍迪·威索洛克"
L["Rare"] = "稀有"
L["Raven"] = "拉文"
L["Razal'blade <Kargath Expeditionary Force>"] = "拉札布雷德 <卡加斯遠征軍>"
L["Razorfen Spearhide"] = "剃刀沼澤刺鬃守衛"
L["R-DQuote"] = "」"
L["Reclaimer A'zak"] = "回收者阿札克"
L["Red Dragonflight Chamber"] = "紅龍軍團密室"
L["Red Riding Hood"] = "小紅帽"
L["Reinforced Archery Target"] = "強化箭靶"
L["Reinforced Fel Iron Chest"] = "強化惡魔鐵箱"
L["Relic Coffer Key"] = "古物寶庫鑰匙"
L["Relissa"] = "瑞麗莎"
L["Relwyn Shadestar"] = "芮爾溫·影星"
L["Renault Mograine"] = "雷諾·莫根尼"
L["Repair"] = "修理"
L["Reputation"] = "聲望"
L["Retribution Paladin"] = "懲戒聖騎"
L["Rewards"] = "獎勵"
L["RFC"] = "RFC/怒焰"
L["RFD"] = "RFD"
L["RFK"] = "RFK"
L["Rifle Commander Coe"] = "步槍指揮官寇伊"
L["Rifleman Brownbeard"] = "槍兵伯朗畢爾"
L["Rimefang"] = "霜牙"
L["Rocky Horror"] = "磐石駭獸"
L["Rogue"] = "盜賊"
L["Rosa"] = "羅莎"
L["Roughshod Pike"] = "尖銳長矛"
L["R-Parenthesis"] = "）"
L["RS"] = "RS/晶紅"
L["R-SBracket"] = "】"
L["Sa'at <Keepers of Time>"] = "塞特 <時光守望者>"
L["Safe Room"] = "安全的空間"
L["Sally Whitemane"] = "莎麗·白鬃"
L["SB"] = "SB"
L["SBG"] = "SBG"
L["SC"] = "SC/毒蛇"
L["Scarshield Quartermaster <Scarshield Legion>"] = "裂盾軍需官 <裂盾軍團>"
L["Schematic: Field Repair Bot 74A"] = "結構圖:戰地修理機器人74A型"
L["Scholo"] = "Scholo/通靈"
L["Scourge Invasion Points"] = "天譴軍團地點"
L["Scout Cage"] = "斥侯牢籠"
L["Scout Orgarr"] = "斥候歐卡爾"
L["Scout Thaelrid"] = "斥候塞爾瑞德"
L["Scrying Orb"] = "索蘭尼亞的占卜寶珠"
L["Sebastian <The Organist>"] = "塞巴斯汀 <風琴演奏家>"
L["Second Fragment Guardian"] = "第二碎片守衛者"
L["Second Stop"] = "第二停留點"
L["Seer Ixit"] = "先知伊須特"
L["Seer Kanai"] = "先知卡奈"
L["Seer Olum"] = "先知歐蘭"
L["Semicolon"] = "；"
L["Sentinel Aluwyn"] = "哨兵阿露溫"
L["Sentinel-trainee Issara"] = "哨兵受訓員伊薩拉"
L["Servant Quarters"] = "伺從區"
L["Seth"] = "Seth/塞司克"
L["SFK"] = "SFK/影牙"
L["SH"] = "SH/破碎"
L["Shado-Master Chum Kiu"] = "影潘宗師成樵"
L["Shadowforge Brazier"] = "暗爐火盆"
L["Shadow Lord Xiraxis"] = "暗影領主希瑞西斯"
L["Shadow Priest"] = "暗影牧師"
L["Shaman"] = "薩滿"
L["Shattered Hand Executioner"] = "破碎之手劊子手"
L["Shavalius the Fancy <Flight Master>"] = "『狂想』夏瓦利厄斯 <飛行管理員>"
L["Shen'dralar Ancient"] = "辛德拉古靈"
L["Shen'dralar Provisioner"] = "辛德拉聖職者"
L["Shen'dralar Watcher"] = "辛德拉看守者"
L["Shrine of Gelihast"] = "格里哈斯特神殿"
L["Sif"] = "希芙"
L["Sinan the Dreamer"] = "『夢旅者』司南"
L["Sindragosa's Lair"] = "辛德拉苟莎之巢"
L["Sister Svalna"] = "絲瓦娜姐妹"
L["Skar'this the Heretic"] = "異教徒司卡利斯"
L["SL"] = "SL/迷宮"
L["Slash"] = "／"
L["\"Slim\" <Shady Dealer>"] = "『瘦子』 <黑市商人>"
L["Slinky Sharpshiv"] = "史琳琪·利刀"
L["Slither"] = "史立塞"
L["Sliver <Garaxxas' Pet>"] = "割裂者 <卡拉克薩斯的寵物>"
L["Slosh <Food & Drink>"] = "斯洛許 <食物和飲料>"
L["SM"] = "SM/血色"
L["SNT"] = "SNT"
L["SoO"] = "SoO"
L["Soridormi <The Scale of Sands>"] = "索芮朵蜜 <流沙之鱗>"
L["South"] = "南"
L["Southshore Inn"] = "南海鎮旅館"
L["SP"] = "SP"
L["Spawn Point"] = "生成點"
L["Spinestalker"] = "骨脊潛獵者"
L["Spiral Stairs to Netherspace"] = "通往虛空空間的螺旋梯"
L["Spirit of Agamaggan <Ancient>"] = "阿迦瑪甘之靈 <先祖>"
L["Spirit of Olum"] = "歐蘭的靈魂"
L["Spirit of Udalo"] = "烏達羅之靈"
L["SPM"] = "SPM"
L["Spoils of Blackfathom"] = "黑澗之寶"
L["Spy Grik'tha"] = "間諜葛瑞克莎"
L["Spy To'gun"] = "間諜·吐剛"
L["SR"] = "SR"
L["SSC"] = "SSC/毒蛇"
L["ST"] = "ST/神廟"
L["Stairs to Underground Pond"] = "通往地底池塘的階梯"
L["Stairs to Underground Well"] = "通往地底水井的階梯"
L["Stalvan Mistmantle"] = "斯塔文·密斯特曼托"
L["Start"] = "開始"
L["Steps and path to the Blood Furnace"] = "通往血熔爐的階梯與通道"
L["Steward of Time <Keepers of Time>"] = "時間服務員 <時光守望者>"
L["Stinky"] = "臭皮"
L["Stocks"] = "監獄"
L["Stone Guard Kurjack"] = "石衛士療舉"
L["Stone Guard Stok'ton"] = "石衛士史托克頓"
L["Stonemaul Ogre"] = "石槌巨魔"
L["Stormherald Eljrrin"] = "風暴信使埃利林"
L["Strat"] = "Strat/斯坦"
L["Stratholme Courier"] = "斯坦索姆信差"
L["Summon"] = "召喚"
L["Summoner's Tomb"] = "召喚者之墓"
L["SuP"] = "SP/太陽井"
L["Suspicious Bookshelf"] = "神秘的書架"
L["SV"] = "SV/蒸汽"
L["Taelan"] = "泰蘭"
L["Talking Skull"] = "說話的骨頭"
L["Taretha"] = "塔蕾莎"
L["Teleporter"] = "傳送"
L["Teleporter destination"] = "傳送目的地"
L["Teleporter to Middle"] = "傳送到中間"
L["TEoE"] = "TEoE/永恆"
L["TES"] = "TES"
L["Thal'trak Proudtusk <Kargath Expeditionary Force>"] = "薩特拉克·長齒 <卡加斯遠征軍>"
L["The Behemoth"] = "貝希摩斯"
L["The Black Anvil"] = "黑鐵砧"
L["The Black Forge"] = "黑熔爐"
L["The Captain's Chest"] = "船長的箱子"
L["The Codex of Blood"] = "血之聖典"
L["The Culling of Stratholme"] = "斯坦索姆的抉擇"
L["The Dark Grimoire"] = "闇黑魔典"
L["The Dark Portal"] = "黑暗之門"
L["The Deed to Brill"] = "布瑞爾地契"
L["The Deed to Caer Darrow"] = "凱爾達隆地契"
L["The Deed to Southshore"] = "南海鎮地契"
L["The Deed to Tarren Mill"] = "塔倫米爾地契"
L["The Discs of Norgannon"] = "諾甘農圓盤"
L["The Eye of Haramad"] = "哈拉瑪德之眼"
L["The Keepers"] = "守護者"
L["The Map of Zul'Aman"] = "祖阿曼地圖"
L["The Master's Terrace"] = "大師的露臺"
L["The Nameless Prophet"] = "無名預言者"
L["The Saga of Terokk"] = "泰洛克的傳說"
L["The Shadowforge Lock"] = "暗爐之鎖"
L["The Siege"] = "攻城區"
L["The Sparklematic 5200"] = "超級清潔器5200型！"
L["The Underspore"] = "地孢"
L["The Vault"] = "地窖"
L["Third Fragment Guardian"] = "第三碎片守衛者"
L["Third Stop"] = "第三停留點"
L["Thomas Yance <Travelling Salesman>"] = "湯瑪斯·陽斯 <旅行商人>"
L["Thrall"] = "索爾"
L["Thrall <Warchief>"] = "索爾 <首領>"
L["Thunderheart <Kargath Expeditionary Force>"] = "桑德哈特 <卡加斯遠征軍>"
L["Thurg"] = "瑟吉"
L["Tiki Lord Mu'Loa"] = "提基王穆羅亞"
L["Tiki Lord Zim'wae"] = "提基王辛瓦"
L["Tinkee Steamboil"] = "丁奇·斯迪波爾"
L["Tink Sprocketwhistle <Engineering Supplies>"] = "丁克·鐵哨 <工程學供應商>"
L["TJS"] = "TJS"
L["TK"] = "TK/風暴"
L["Tol'mar"] = "托爾瑪"
L["Tol'vir Grave"] = "托維爾墓地"
L["To next map"] = "到下一個地圖"
L["Top"] = "上方"
L["Torben Zapblast <Teleportation Specialist>"] = "托爾班·速轟 <傳送專家>"
L["Torch Lever"] = "火炬"
L["Tormented Soulpriest"] = "受折磨的靈魂牧師"
L["Tor-Tun <The Slumberer>"] = "托通 <沉睡者>"
L["ToT"] = "ToT"
L["ToTT"] = "ToTT"
L["Towards Illidan Stormrage"] = "通往伊利丹"
L["Towards Reliquary of Souls"] = "通往靈魂聖盒"
L["Towards Teron Gorefiend"] = "通往泰朗·血魔"
L["Tower of Flame"] = "烈焰之塔"
L["Tower of Frost"] = "冰霜之塔"
L["Tower of Life"] = "生命之塔"
L["Tower of Storms"] = "風暴之塔"
-- L["Train Ride"] = ""
L["Tran'rek"] = "特蘭雷克"
L["Transport"] = "傳送"
L["Tribunal Chest"] = "議庭之箱"
L["TSC"] = "TSC"
L["T'shu"] = "塔蘇"
L["Tunnel"] = "通道"
L["TWT"] = "TWT"
L["Tydormu <Keeper of Lost Artifacts>"] = "提多姆 <失落的神器看管者>"
L["Tyllan"] = "泰倫"
L["Tyrande Whisperwind <High Priestess of Elune>"] = "泰蘭妲·語風 <伊露恩的高階女祭司>"
L["Tyrith"] = "提里斯"
L["UB"] = "UB/深幽"
L["UBRS"] = "UBRS"
L["Udalo"] = "先知烏達羅"
L["UK, Keep"] = "UK/俄塞"
L["Ulda"] = "Ulda"
L["Uldu"] = "Uldu/奧杜亞"
L["Unblinking Eye"] = "堅定無畏之眼"
L["Underwater"] = "水下"
L["Upper"] = "上層"
L["Upper Spire"] = "冰冠尖塔"
L["UP, Pinn"] = "UP/俄巔"
L["Urok's Tribute Pile"] = "烏洛克的貢品堆"
L["Varies"] = "多處"
L["VC"] = "VC/死礦"
L["Vehini <Assault Provisions>"] = "維希尼 <突襲物資供應者>"
L["Velastrasza"] = "維菈史卓莎"
L["Vend-O-Tron D-Luxe"] = "高級自動販賣機"
L["Venomancer Mauri <The Snake's Whisper>"] = "怨毒法師莫里 <蛇之耳語>"
L["Venomancer T'Kulu <The Toxic Bite>"] = "怨毒法師堤庫魯 <毒咬>"
L["Verdisa"] = "薇爾迪莎"
L["Vethsera <Brood of Ysera>"] = "溫瑟拉 <伊瑟拉的後裔>"
L["VH"] = "VH/紫堡"
L["VoA"] = "VoA/亞夏"
L["Vol'jin"] = "沃金"
L["Voodoo Pile"] = "巫毒堆"
L["Vorrel Sengutz"] = "沃瑞爾·森古斯"
L["VP"] = "VP"
L["Wanders"] = "徘徊"
L["Warden Thelwater"] = "典獄官塞爾沃特"
L["Warlock"] = "術士"
L["Warlord Goretooth <Kargath Expeditionary Force>"] = "督軍高圖斯 <卡加斯遠征軍>"
L["Warlord Salaris"] = "督軍沙拉利思"
L["Warmage Kaitlyn"] = "戰爭法師凱特林"
L["Warrior"] = "戰士"
L["Watcher Gashra"] = "看守者賈西拉"
L["Watcher Jhang"] = "看守者詹汗格"
L["Watcher Narjil"] = "看守者納吉爾"
L["Watcher Silthik"] = "看守者席爾希克"
L["Watchman Doomgrip"] = "衛兵杜格瑞普"
L["Wave 10"] = "第 10 波"
L["Wave 12"] = "第 12 波"
L["Wave 18"] = "第 18 波"
L["Wave 5"] = "第 5 波"
L["Wave 6"] = "第 6 波"
L["WC"] = "WC/哀嚎"
L["Weeder Greenthumb"] = "威德·綠指"
L["Weegli Blastfuse"] = "維格利"
L["Weldon Barov <House of Barov>"] = "維爾頓·巴羅夫 <巴羅夫家族>"
L["West"] = "西"
L["Willix the Importer"] = "進口商威利克斯"
L["Windcaller Claw"] = "喚風者卡勞"
L["Witch Doctor Qu'in <Medicine Woman>"] = "巫醫枯因 <女巫醫>"
L["Witch Doctor T'wansi"] = "巫醫塔灣西"
L["Wizard of Oz"] = "綠野仙蹤"
L["Wrath of the Lich King"] = "巫妖王之怒"
L["Wravien <The Mage>"] = "瑞依恩 <法師>"
L["Yarley <Armorer>"] = "亞利 <護甲商>"
L["Yazzai"] = "耶賽"
L["Young Blanchy"] = "小馬布蘭契"
L["Ythyar"] = "伊斯亞爾"
L["Yuka Screwspigot <Engineering Supplies>"] = "尤卡·斯庫比格特 <工程學供應商>"
L["ZA"] = "ZA"
L["Zaladormu"] = "薩拉多姆"
L["Zanza the Restless"] = "『無眠者』贊札"
L["Zanzil's Cauldron of Burning Blood"] = "贊吉爾的燃燒之血"
L["Zanzil's Cauldron of Frostburn Formula"] = "贊吉爾的霜燃配方"
L["Zanzil's Cauldron of Toxic Torment"] = "贊吉爾的毒物折磨大鍋"
L["Zao'cho <The Emperor's Shield>"] = "趙仇 <帝王之盾>"
L["Zelfan"] = "塞爾汎"
L["Zeya"] = "仄亞"
L["ZF"] = "ZF/祖法"
L["ZG"] = "ZG"
L["Zixil <Aspiring Merchant>"] = "吉克希爾 <高級商人>"
L["Zungam"] = "祖剛"
L["ToC/Description"] = "|cff00CC33Atlas 地圖集主程式|r"
L["ToC/Title"] = "|r|cFF0099FF[地圖]|rAtlas 地圖集 |cFF0099FF[主程式]|r"




end
