local L = LibStub("AceLocale-3.0"):NewLocale("WorldQuestTrackerAddon", "zhTW") 
if not L then return end 

L["S_APOWER_AVAILABLE"] = "可用"
L["S_APOWER_DOWNVALUE"] = "%s 表示任務時間還很充裕。"
L["S_APOWER_NEXTLEVEL"] = "下個等級"
L["S_ENABLED"] = "啟用"
L["S_ERROR_NOTIMELEFT"] = "任務已過期。"
L["S_ERROR_NOTLOADEDYET"] = "任務尚未載入，請稍候。"
L["S_FLYMAP_SHOWTRACKEDONLY"] = "只有已追蹤的"
L["S_FLYMAP_SHOWTRACKEDONLY_DESC"] = "只顯示正在追蹤的任務"
L["S_FLYMAP_SHOWWORLDQUESTS"] = "顯示世界任務"
--Translation missing 
-- L["S_GROUPFINDER_ACTIONS_CANCELING"] = ""
--Translation missing 
-- L["S_GROUPFINDER_ACTIONS_CREATE"] = ""
--Translation missing 
-- L["S_GROUPFINDER_ACTIONS_LEAVEASK"] = ""
--Translation missing 
-- L["S_GROUPFINDER_ACTIONS_LEAVINGIN"] = ""
--Translation missing 
-- L["S_GROUPFINDER_ACTIONS_RETRYSEARCH"] = ""
--Translation missing 
-- L["S_GROUPFINDER_ACTIONS_SEARCH"] = ""
--Translation missing 
-- L["S_GROUPFINDER_ACTIONS_SEARCH_TOOLTIP"] = ""
--Translation missing 
-- L["S_GROUPFINDER_ACTIONS_SEARCHING"] = ""
--Translation missing 
-- L["S_GROUPFINDER_ACTIONS_SEARCHMORE"] = ""
--Translation missing 
-- L["S_GROUPFINDER_ACTIONS_SEARCHOTHER"] = ""
--Translation missing 
-- L["S_GROUPFINDER_ACTIONS_UNAPPLY1"] = ""
--Translation missing 
-- L["S_GROUPFINDER_ACTIONS_UNLIST"] = ""
--Translation missing 
-- L["S_GROUPFINDER_ACTIONS_UNLISTING"] = ""
--Translation missing 
-- L["S_GROUPFINDER_ACTIONS_WAITING"] = ""
--Translation missing 
-- L["S_GROUPFINDER_ENABLED"] = ""
--Translation missing 
-- L["S_GROUPFINDER_KICK_DESC"] = ""
--Translation missing 
-- L["S_GROUPFINDER_LEAVEOPTIONS"] = ""
--Translation missing 
-- L["S_GROUPFINDER_LEAVEOPTIONS_AFTERX"] = ""
--Translation missing 
-- L["S_GROUPFINDER_LEAVEOPTIONS_ASKX"] = ""
--Translation missing 
-- L["S_GROUPFINDER_LEAVEOPTIONS_DONTLEAVE"] = ""
--Translation missing 
-- L["S_GROUPFINDER_LEAVEOPTIONS_IMMEDIATELY"] = ""
--Translation missing 
-- L["S_GROUPFINDER_NOPVP"] = ""
--Translation missing 
-- L["S_GROUPFINDER_OT_ENABLED"] = ""
--Translation missing 
-- L["S_GROUPFINDER_QUEUEBUSY"] = ""
--Translation missing 
-- L["S_GROUPFINDER_RESULTS_APPLYING"] = ""
--Translation missing 
-- L["S_GROUPFINDER_RESULTS_APPLYING1"] = ""
--Translation missing 
-- L["S_GROUPFINDER_RESULTS_FOUND"] = ""
--Translation missing 
-- L["S_GROUPFINDER_RESULTS_FOUND1"] = ""
--Translation missing 
-- L["S_GROUPFINDER_RESULTS_UNAPPLY"] = ""
--Translation missing 
-- L["S_GROUPFINDER_RIGHTCLICKCLOSE"] = ""
--Translation missing 
-- L["S_GROUPFINDER_SECONDS"] = ""
--Translation missing 
-- L["S_GROUPFINDER_TITLE"] = ""
--Translation missing 
-- L["S_GROUPFINDER_TUTORIAL1"] = ""
L["S_MAPBAR_AUTOWORLDMAP"] = "自動世界地圖"
L["S_MAPBAR_AUTOWORLDMAP_DESC"] = [=[在達拉然和職業大廳按下 'M' 會直接顯示破碎群島的地圖。

快速按兩下 'M' 顯示所在位置的區域地圖。]=]
L["S_MAPBAR_FILTER"] = "過濾"
L["S_MAPBAR_FILTERMENU_FACTIONOBJECTIVES"] = "陣營目標"
L["S_MAPBAR_FILTERMENU_FACTIONOBJECTIVES_DESC"] = "仍然顯示已被過濾的陣營任務"
L["S_MAPBAR_OPTIONS"] = "選項"
L["S_MAPBAR_OPTIONSMENU_ARROWSPEED"] = "箭頭更新速度"
L["S_MAPBAR_OPTIONSMENU_ARROWSPEED_HIGH"] = "快"
L["S_MAPBAR_OPTIONSMENU_ARROWSPEED_MEDIUM"] = "中等"
L["S_MAPBAR_OPTIONSMENU_ARROWSPEED_REALTIME"] = "即時"
L["S_MAPBAR_OPTIONSMENU_ARROWSPEED_SLOW"] = "慢"
L["S_MAPBAR_OPTIONSMENU_EQUIPMENTICONS"] = "裝備真實圖示"
L["S_MAPBAR_OPTIONSMENU_QUESTTRACKER"] = "啟用任務追蹤"
L["S_MAPBAR_OPTIONSMENU_REFRESH"] = "重新整理"
L["S_MAPBAR_OPTIONSMENU_SHARE"] = "分享這個插件"
L["S_MAPBAR_OPTIONSMENU_SOUNDENABLED"] = "啟用音效"
L["S_MAPBAR_OPTIONSMENU_STATUSBARANCHOR"] = "選單在上方"
L["S_MAPBAR_OPTIONSMENU_TOMTOM_WPPERSISTENT"] = "保留路徑點"
L["S_MAPBAR_OPTIONSMENU_TRACKER_CURRENTZONE"] = "只顯示目前地區的任務"
L["S_MAPBAR_OPTIONSMENU_TRACKER_SCALE"] = "追蹤清單縮放: %s"
L["S_MAPBAR_OPTIONSMENU_TRACKERCONFIG"] = "追蹤清單設定"
L["S_MAPBAR_OPTIONSMENU_TRACKERMOVABLE_AUTO"] = "自動調整位置"
L["S_MAPBAR_OPTIONSMENU_TRACKERMOVABLE_CUSTOM"] = "自訂位置"
L["S_MAPBAR_OPTIONSMENU_TRACKERMOVABLE_LOCKED"] = "鎖定位置"
L["S_MAPBAR_OPTIONSMENU_UNTRACKQUESTS"] = "取消追蹤所有任務"
L["S_MAPBAR_OPTIONSMENU_WORLDMAPCONFIG"] = "世界地圖設定"
L["S_MAPBAR_OPTIONSMENU_YARDSDISTANCE"] = "顯示距離（單位：碼）"
L["S_MAPBAR_OPTIONSMENU_ZONE_QUESTSUMMARY"] = "任務總結 (全螢幕)"
L["S_MAPBAR_OPTIONSMENU_ZONEMAPCONFIG"] = "區域地圖設定"
L["S_MAPBAR_RESOURCES_TOOLTIP_TRACKALL"] = "點一下全部追蹤: |cFFFFFFFF%s| 任務。"
L["S_MAPBAR_SORTORDER"] = "排序"
L["S_MAPBAR_SORTORDER_TIMELEFTPRIORITY_FADE"] = "淡出快過期的任務"
L["S_MAPBAR_SORTORDER_TIMELEFTPRIORITY_OPTION"] = "少於 %d 小時"
L["S_MAPBAR_SORTORDER_TIMELEFTPRIORITY_SHOWTEXT"] = "顯示任務過期時間"
L["S_MAPBAR_SORTORDER_TIMELEFTPRIORITY_SORTBYTIME"] = "依據時間排序"
L["S_MAPBAR_SORTORDER_TIMELEFTPRIORITY_TITLE"] = "時間"
L["S_MAPBAR_SUMMARY"] = "總結"
L["S_MAPBAR_SUMMARYMENU_ACCOUNTWIDE"] = "帳號內所有角色"
L["S_MAPBAR_SUMMARYMENU_MOREINFO"] = "左鍵：更多資訊"
L["S_MAPBAR_SUMMARYMENU_NOATTENTION"] = "其他角色沒有追蹤2小時以內的任務!"
L["S_MAPBAR_SUMMARYMENU_REQUIREATTENTION"] = "請注意"
L["S_MAPBAR_SUMMARYMENU_TODAYREWARDS"] = "今天的獎勵"
L["S_OVERALL"] = "整體"
L["S_PARTY"] = "隊伍"
L["S_PARTY_DESC1"] = "藍色星星表示所有隊伍成員都有這個任務。"
L["S_PARTY_DESC2"] = "如果顯示紅色星星，表示某個隊伍成員沒有世界任務，或尚未安裝世界任務追蹤插件。"
L["S_PARTY_PLAYERSWITH"] = "隊伍中有 WQT 的玩家:"
L["S_PARTY_PLAYERSWITHOUT"] = "隊伍中沒有 WQT 的玩家:"
L["S_QUESTSCOMPLETED"] = "完成任務"
L["S_QUESTTYPE_ARTIFACTPOWER"] = "神兵之力"
L["S_QUESTTYPE_DUNGEON"] = "地城"
L["S_QUESTTYPE_EQUIPMENT"] = "裝備"
L["S_QUESTTYPE_GOLD"] = "金幣"
L["S_QUESTTYPE_PETBATTLE"] = "寵物對戰"
L["S_QUESTTYPE_PROFESSION"] = "專業"
L["S_QUESTTYPE_PVP"] = "PvP"
L["S_QUESTTYPE_RESOURCE"] = "資源"
L["S_QUESTTYPE_TRADESKILL"] = "專業技能"
L["S_SHAREPANEL_THANKS"] = [=[感謝您分享世界任務追蹤 World Quest Tracker!
請在臉書、推特將連結傳給您的朋友。]=]
L["S_SHAREPANEL_TITLE"] = "再忙，也要和你一起魔獸!"
L["S_SUMMARYPANEL_EXPIRED"] = "已過期"
L["S_SUMMARYPANEL_LAST15DAYS"] = "最近15天"
L["S_SUMMARYPANEL_LIFETIMESTATISTICS_ACCOUNT"] = "帳號上線統計"
L["S_SUMMARYPANEL_LIFETIMESTATISTICS_CHARACTER"] = "角色上線統計"
L["S_SUMMARYPANEL_OTHERCHARACTERS"] = "其他角色"
L["S_TUTORIAL_AMOUNT"] = "表示可獲得的數量"
L["S_TUTORIAL_CLICKTOTRACK"] = "點一下追蹤任務。"
L["S_TUTORIAL_CLOSE"] = "關閉教學說明"
L["S_TUTORIAL_FACTIONBOUNTY"] = "表示所選陣營的任務。"
L["S_TUTORIAL_FACTIONBOUNTY_AMOUNTQUESTS"] = "表示所選陣營在這個地圖上的任務數量。"
L["S_TUTORIAL_HOWTOADDTRACKER"] = "左鍵點擊追蹤任務。在追蹤清單中|cFFFFFFFF點右鍵|r取消追蹤。"
L["S_TUTORIAL_PARTY"] = "組隊時，藍色星星表示所有隊伍成員都有這些任務!"
L["S_TUTORIAL_RARITY"] = "表示稀有程度 (一般, 精良, 史詩)"
L["S_TUTORIAL_REWARD"] = "表示獎勵 (裝備, 金幣, 神兵之力, 資源, 材料)"
L["S_TUTORIAL_TIMELEFT"] = "表示剩餘時間 (+4小時, +90分鐘, +30分鐘, 少於30分鐘)"
L["S_TUTORIAL_WORLDMAPBUTTON"] = "按下這個按鈕會顯示整個破碎群島的地圖。"
L["S_UNKNOWNQUEST"] = "未知的任務"
L["S_WORLDQUESTS"] = "世界任務"

