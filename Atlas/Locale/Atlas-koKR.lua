﻿-- $Id: Atlas-koKR.lua 31 2016-06-23 07:30:35Z arith $
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
local L = AceLocale:NewLocale("Atlas", "koKR", false);

-- Atlas Spanish Localization
if ( GetLocale() == "koKR" ) then
-- Define the leading strings to be ignored while sorting
-- Ex: The Stockade
AtlasSortIgnore = {
	--"the (.+)",
};

-- Syntax: ["real_zone_name"] = "localized map zone name"
AtlasZoneSubstitutions = {
--	["Ahn'Qiraj"] = "Templo de Ahn'Qiraj";
--	["The Temple of Atal'Hakkar"] = "El Templo de Atal'Hakkar";
--	["Throne of Tides"] = "Fauce Abisal: Trono de las Mareas";
};
end


if L then
-- L["Adult"] = ""
-- L["AKA"] = ""
L["Alexston Chrome <Tavern of Time>"] = "알렉스턴 크롬 <시간의 선술집>"
L["Alurmi <Keepers of Time Quartermaster>"] = "알룰미 <시간의 수호자 병참장교>"
L["Anachronos <Keepers of Time>"] = "아나크로노스 <시간의 수호자>"
L["Andormu <Keepers of Time>"] = "안도르무 <시간의 수호자>"
L["Arazmodu <The Scale of Sands>"] = "아라즈모두 <시간의 중재자>"
L["Arcane Container"] = "마법 단지"
L["Arms Warrior"] = "무기 전사"
L["ATLAS_BUTTON_CLOSE"] = "닫기"
L["ATLAS_CLICK_TO_OPEN"] = "Atlas 지도 창을 열려면 클릭."
-- L["ATLAS_COLLAPSE_BUTTON"] = ""
L["ATLAS_DDL_CONTINENT"] = "대륙"
L["ATLAS_DDL_CONTINENT_BROKENISLES"] = "부서진 섬 인스턴스"
L["ATLAS_DDL_CONTINENT_DEEPHOLM"] = "심원의 영지 인스턴스"
L["ATLAS_DDL_CONTINENT_DRAENOR"] = "드레노어 인스턴스"
L["ATLAS_DDL_CONTINENT_EASTERN"] = "동부 왕국 인스턴스"
L["ATLAS_DDL_CONTINENT_KALIMDOR"] = "칼림도어 인스턴스"
L["ATLAS_DDL_CONTINENT_NORTHREND"] = "노스렌드 인스턴스"
L["ATLAS_DDL_CONTINENT_OUTLAND"] = "아웃랜드 인스턴스"
L["ATLAS_DDL_CONTINENT_PANDARIA"] = "판다리아 인스턴스"
L["ATLAS_DDL_EXPANSION"] = "확장"
L["ATLAS_DDL_EXPANSION_BC"] = "불타는 성전 인스턴스"
L["ATLAS_DDL_EXPANSION_CATA"] = "대격변 인스턴스"
L["ATLAS_DDL_EXPANSION_LEGION"] = "군단 인스턴스"
L["ATLAS_DDL_EXPANSION_MOP"] = "판다리아의 안개 인스턴스"
L["ATLAS_DDL_EXPANSION_OLD_AO"] = "구세계 인스턴스 A-O"
L["ATLAS_DDL_EXPANSION_OLD_PZ"] = "구세계 인스턴스 P-Z"
L["ATLAS_DDL_EXPANSION_WOD"] = "드레노어의 군주 인스턴스"
L["ATLAS_DDL_EXPANSION_WOTLK"] = "리치왕의 분노 인스턴스"
L["ATLAS_DDL_LEVEL"] = "레벨"
L["ATLAS_DDL_LEVEL_100PLUS"] = "인스턴스 레벨 100+"
L["ATLAS_DDL_LEVEL_100TO110"] = "인스턴스 레벨 100-110"
L["ATLAS_DDL_LEVEL_110PLUS"] = "인스턴스 레벨 110+"
L["ATLAS_DDL_LEVEL_45TO60"] = "인스턴스 레벨 45-60"
L["ATLAS_DDL_LEVEL_60TO70"] = "인스턴스 레벨 60-70"
L["ATLAS_DDL_LEVEL_70TO80"] = "인스턴스 레벨 70-80"
L["ATLAS_DDL_LEVEL_80TO85"] = "인스턴스 레벨 80-85"
L["ATLAS_DDL_LEVEL_85TO90"] = "인스턴스 레벨 85-90"
L["ATLAS_DDL_LEVEL_90TO100"] = "인스턴스 레벨 90-100"
L["ATLAS_DDL_LEVEL_UNDER45"] = "인스턴스 레벨 45 아래"
L["ATLAS_DDL_PARTYSIZE"] = "파티 크기"
L["ATLAS_DDL_PARTYSIZE_10_AN"] = "10인용 인스턴스 A-N"
L["ATLAS_DDL_PARTYSIZE_10_OZ"] = "10인용 인스턴스 O-Z"
L["ATLAS_DDL_PARTYSIZE_20TO40AH"] = "20-40인용 인스턴스 A-H"
L["ATLAS_DDL_PARTYSIZE_20TO40IZ"] = "20-40인용 인스턴스 I-Z"
L["ATLAS_DDL_PARTYSIZE_5_AE"] = "5인용 인스턴스 A-E"
L["ATLAS_DDL_PARTYSIZE_5_FS"] = "5인용 인스턴스 F-S"
L["ATLAS_DDL_PARTYSIZE_5_TZ"] = "5인용 인스턴스 T-Z"
L["ATLAS_DDL_TYPE"] = "유형"
L["ATLAS_DDL_TYPE_ENTRANCE"] = "입구"
L["ATLAS_DDL_TYPE_INSTANCE_AB"] = "인스턴스 A-B"
L["ATLAS_DDL_TYPE_INSTANCE_CF"] = "인스턴스 C-F"
L["ATLAS_DDL_TYPE_INSTANCE_GM"] = "인스턴스 G-M"
L["ATLAS_DDL_TYPE_INSTANCE_NS"] = "인스턴스 N-S"
L["ATLAS_DDL_TYPE_INSTANCE_TZ"] = "인스턴스 T-Z"
L["ATLAS_DEP_MSG1"] = "Atlas가 오래된 모듈을 감지했습니다."
-- L["ATLAS_DEP_MSG2"] = ""
-- L["ATLAS_DEP_MSG3"] = ""
L["ATLAS_DEP_OK"] = "확인"
L["ATLAS_ENTRANCE_BUTTON"] = "입구"
-- L["ATLAS_EXPAND_BUTTON"] = ""
L["ATLAS_INFO"] = "Atlas 정보"
-- L["ATLAS_INFO_12200"] = ""
-- L["ATLAS_INFO_12201"] = ""
L["ATLAS_INSTANCE_BUTTON"] = "인스턴스"
L["ATLAS_LDB_HINT"] = [=[좌클릭 - Atlas 열기.
우클릭 - Atlas 옵션.]=]
L["ATLAS_MINIMAPLDB_HINT"] = [=[좌클릭은 Atlas 열기.
우클릭은 Atlas 옵션.
좌클릭 끌기는 이 버튼 이동. ]=]
L["ATLAS_MISSING_MODULE"] = [=[Atlas가 일부 빠진 모듈 / 플러그인을 감지했습니다.  

Atlas에 의해 중지된 오래된 모듈 / 플러그인일 수 있습니다. 
막 최신 버전을 모두 설치한 경우, 모두 활성화되어 있는지 확인하기 위해 애드온 목록으로 이동하세요. 

이런 "빠진" 모듈 / 플러그인이 필요하지 않고 이 메시지를 다시 보고싶지 않은 경우, 알림을 중지하기 위해 옵션 패널로 이동할 수 있습니다. 

빠진 모듈 / 플러그인 목록:]=]
L["ATLAS_OPEN_ADDON_LIST"] = "애드온 목록 열기"
L["ATLAS_OPEN_ADVENTURE"] = "모험 안내서 창을 열려면 클릭하세요."
L["ATLAS_OPEN_WOWMAP_WINDOW"] = "모험 안내서 지도 창을 열려면 클릭하세요."
L["ATLAS_OPTIONS_ACRONYMS"] = "약어 표시"
L["ATLAS_OPTIONS_ACRONYMS_TIP"] = "지도 상세에 인스턴스의 약어를 표시합니다."
L["ATLAS_OPTIONS_AUTOSEL"] = "인스턴스 지도 자동 선택"
L["ATLAS_OPTIONS_AUTOSEL_TIP"] = "Atlas가 위치를 감지하여 가장 나은 인스턴스 지도를 자동 선택합니다."
L["ATLAS_OPTIONS_BOSS_DESC"] = "가능한 경우 보스 설명 표시"
L["ATLAS_OPTIONS_BOSS_DESC_SCALE"] = "보스 설명 지도 툴팁 크기"
L["ATLAS_OPTIONS_BOSS_DESC_TIP"] = "마우스를 보스 번호 위에 올리면, 관련 정보를 이용할 수 있는 경우 보스 설명을 표시합니다."
L["ATLAS_OPTIONS_BUTPOS"] = "버튼 위치"
L["ATLAS_OPTIONS_BUTRAD"] = "버튼 반지름"
L["ATLAS_OPTIONS_BUTTON"] = "옵션"
L["ATLAS_OPTIONS_CATDD"] = "인스턴스 지도 정렬 방식:"
L["ATLAS_OPTIONS_CHECKMODULE"] = "빠진 모듈 / 플러그인 알림."
L["ATLAS_OPTIONS_CHECKMODULE_TIP"] = "WoW가 로드된 후 빠진 Atlas 모듈 / 플러그인이 있는지 검사를 수행할 수 있습니다."
L["ATLAS_OPTIONS_CLAMPED"] = "창을 화면에 가둠"
L["ATLAS_OPTIONS_CLAMPED_TIP"] = "게임 화면 밖으로 마우스로 끌 수 없도록 Atlas 창을 화면에 가둡니다."
L["ATLAS_OPTIONS_COLORINGDROPDOWN"] = "던전 드롭다운 목록 색상 표시"
L["ATLAS_OPTIONS_COLORINGDROPDOWN_TIP"] = "던전의 추천 최소 레벨과 플레이어의 레벨 기준으로, 던전을 난이도 색으로 표시합니다. "
-- L["ATLAS_OPTIONS_CTRL"] = ""
-- L["ATLAS_OPTIONS_CTRL_TIP"] = ""
L["ATLAS_OPTIONS_DONTSHOWAGAIN"] = "같은 정보를 다시 표시하지 않음."
L["ATLAS_OPTIONS_LOCK"] = "Atlas 창 잠금"
L["ATLAS_OPTIONS_LOCK_TIP"] = "Atlas 창 잠금 / 잠금 해제 토글."
L["ATLAS_OPTIONS_RCLICK"] = "우클릭 세계 지도"
L["ATLAS_OPTIONS_RCLICK_TIP"] = "Atlas 창에서 우클릭하면 WoW 세계 지도로 전환할 수 있습니다."
L["ATLAS_OPTIONS_RESETPOS"] = "초기화 위치"
L["ATLAS_OPTIONS_SCALE"] = "Atlas 프레임 크기"
L["ATLAS_OPTIONS_SHOWBUT"] = "미니맵에 버튼 표시"
L["ATLAS_OPTIONS_SHOWBUT_TIP"] = "미니맵 주변에 Atlas 버튼을 보입니다."
L["ATLAS_OPTIONS_TRANS"] = "투명도"
-- L["ATLAS_SEARCH_UNAVAIL"] = ""
L["ATLAS_SLASH"] = "/atlas"
L["ATLAS_SLASH_OPTIONS"] = "옵션"
L["ATLAS_STRING_CLEAR"] = "지우기"
L["ATLAS_STRING_LEVELRANGE"] = "레벨 범위"
L["ATLAS_STRING_LOCATION"] = "위치"
L["ATLAS_STRING_MINLEVEL"] = "최소 레벨"
L["ATLAS_STRING_PLAYERLIMIT"] = "플레이어 수 제한"
L["ATLAS_STRING_RECLEVELRANGE"] = "추천 레벨"
L["ATLAS_STRING_SEARCH"] = "검색"
L["ATLAS_STRING_SELECT_CAT"] = "카테고리 선택"
L["ATLAS_STRING_SELECT_MAP"] = "지도 선택"
L["ATLAS_TITLE"] = "Atlas"
-- L["Attunement Required"] = ""
-- L["Back"] = ""
-- L["Basement"] = ""
-- L["BINDING_HEADER_ATLAS_TITLE"] = ""
L["BINDING_NAME_ATLAS_AUTOSEL"] = "자동 선택"
L["BINDING_NAME_ATLAS_OPTIONS"] = "토글 옵션"
L["BINDING_NAME_ATLAS_TOGGLE"] = "Atlas 토글"
L["Blacksmithing Plans"] = "대장기술 도면"
L["Bodley"] = "보들리"
L["Bortega <Reagents & Poison Supplies>"] = "보르테가 <마법 재료 및 독극물 상인>"
L["Brewfest"] = "가을 축제"
-- L["Child"] = ""
L["Colon"] = ":"
L["Comma"] = ","
-- L["Connection"] = ""
-- L["East"] = ""
-- L["Elevator"] = ""
-- L["End"] = ""
-- L["Engineer"] = ""
L["Entrance"] = "입구"
L["Event"] = "이벤트"
-- L["Exalted"] = ""
-- L["Exit"] = ""
-- L["Fourth Stop"] = ""
-- L["Front"] = ""
L["Galgrom <Provisioner>"] = "갈그롬 <배급원>"
-- L["Ghost"] = ""
L["Graveyard"] = "무덤"
L["Hallow's End"] = "할로윈 축제"
-- L["Heroic"] = ""
L["Heroic_Symbol"] = "(영)"
L["Holy Paladin"] = "신성 기사"
L["Holy Priest"] = "신성 사제"
L["Hyphen"] = " - "
-- L["Imp"] = ""
-- L["Key"] = ""
L["L-DQuote"] = "\""
L["Lothos Riftwaker"] = "로소스 리프트웨이커"
L["Love is in the Air"] = "온누리에 사랑을"
-- L["Lower"] = ""
L["L-Parenthesis"] = " ("
L["L-SBracket"] = "["
L["Lunar Festival"] = "달의 축제"
L["MapA"] = " [A]"
L["MapB"] = " [B]"
L["MapC"] = " [C]"
L["MapD"] = " [D]"
L["MapE"] = " [E]"
L["MapF"] = " [F]"
L["MapG"] = " [G]"
L["MapH"] = " [H]"
L["MapI"] = " [I]"
L["MapJ"] = " [J]"
-- L["MapsNotFound"] = ""
L["Meeting Stone"] = "만남의 돌"
-- L["Middle"] = ""
L["Midsummer Festival"] = "한여름 불꽃축제"
L["Moonwell"] = "달샘"
L["Mythic"] = "신화"
L["Mythic_Symbol"] = "(신)"
-- L["North"] = ""
L["Nozari <Keepers of Time>"] = "노자리 <시간의 수호자>"
-- L["Optional"] = ""
-- L["Orange"] = ""
L["Orb of Command"] = "지배의 보주"
-- L["Outside"] = ""
L["Period"] = ". "
L["Portal"] = "포탈"
-- L["PossibleMissingModule"] = ""
L["Protection Warrior"] = "방어 전사"
-- L["Purple"] = ""
L["Random"] = "무작위"
-- L["Rare"] = ""
L["R-DQuote"] = "\""
L["Repair"] = "수리"
L["Retribution Paladin"] = "징벌 기사"
L["Rewards"] = "보상"
L["R-Parenthesis"] = ") "
L["R-SBracket"] = "]"
L["Scarshield Quartermaster <Scarshield Legion>"] = "방패부대 병참장교 <방패 부대>"
-- L["Second Stop"] = ""
L["Semicolon"] = "; "
L["Shadow Priest"] = "암흑 사제"
L["Slash"] = " / "
L["Soridormi <The Scale of Sands>"] = "소리도르미 <시간의 중재자>"
-- L["South"] = ""
-- L["Spawn Point"] = ""
-- L["Start"] = ""
L["Steward of Time <Keepers of Time>"] = "시간의 청지기 <시간의 수호자>"
L["Summon"] = "소환"
-- L["Teleporter"] = ""
-- L["Teleporter destination"] = ""
-- L["The Behemoth"] = ""
-- L["Third Stop"] = ""
-- L["Top"] = ""
-- L["Transport"] = ""
-- L["Tunnel"] = ""
-- L["Underwater"] = ""
-- L["Upper"] = ""
-- L["Varies"] = ""
-- L["Wanders"] = ""
-- L["Wave 10"] = ""
-- L["Wave 12"] = ""
-- L["Wave 18"] = ""
-- L["Wave 5"] = ""
-- L["Wave 6"] = ""
-- L["West"] = ""
L["Yarley <Armorer>"] = "야를리 <방어구 제작자>"
L["Zaladormu"] = "잘라도르무"
L["ToC/Description"] = "인스턴스 지도 탐색기"
L["ToC/Title"] = "Atlas"

end