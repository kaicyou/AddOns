if GetLocale() == "zhTW" then


function psdragslocale()


	pszzdragbefore = "前" -- Needs review
	pszzdragbloodalive = "活著"
	pszzdragbloodkilled = "擊殺" -- Needs review
	pszzdragbuffnotfound = "狀態%s不在玩家身上!" -- Needs review
	pszzdragbuffnotfound2 = "被%s驅散了，但他未受到|s4id110317|id的影響。" -- Needs review
	pszzdragdamageinfly = "只計爆炸前" -- Needs review
	pszzdragdamageinfly2 = "總傷害(未減速)" -- Needs review
	pszzdragdamageto = "傷害" -- Needs review
	pszzdragdamagetoplayer = "對玩家傷害" -- Needs review
	pszzdragdiedtoquick = "還沒吸收血液9層就被擊殺了!" -- Needs review
	pszzdragdiedwarmast = "死亡(玩家分攤前HP)"
	pszzdragforcast = "於%s施放" -- Needs review
	pszzdraghealedby = "治療自" -- Needs review
	pszzdraghpontheendcast = "修補完成時有剩餘血量" -- Needs review
	pszzdraghpremain = "剩餘血量" -- Needs review
	pszzdragnodamagegot = "未分攤"
	pszzdragoboss7 = "死亡之翼的脊椎" -- Needs review
	pszzdragoboss8 = "死亡之翼的狂亂" -- Needs review
	pszzdragonly10 = "只計<%s%%血量" -- Needs review
	pszzdragothercd = "可用的冷卻技能" -- Needs review
	pszzdragotxtopt613 = "|tip1 提示如果有人在堆疊超過1層|sid33661|id的情況下，死於近戰傷害或擊碎打擊。" -- Needs review
	pszzdragotxtopt614 = "|tip1 如果有人死於|sid103494|id: 提示所有玩家與水晶的距離，及受到的傷害。" -- Needs review
	pszzdragotxtopt621 = "|tip2 首領自|sid104322|id獲得多少治療及誰失誤" -- Needs review
	pszzdragotxtopt622 = "|tip1 如果超過1人受到|sid104322|id的傷害。" -- Needs review
	pszzdragotxtopt645 = "|tip1 如果有人死於|sid105313|id，提示其推疊次數。" -- Needs review
	pszzdragotxtopt648 = "|tip1 提示如果|sid109325|id在未受|sid105259|id影響的情況下被驅散。" -- Needs review
	pszzdragotxtopt649 = "|tip1 提示如果有玩家在同時受到|sid109325|id和|sid105259|id影響的情況下死亡。" -- Needs review
	pszzdragotxtopt664 = "|tip1 提示關於|sid107439|id的訊息，當有人死於|sid106401|id或|sid107439|id" -- Needs review
	pszzdragotxtopt665 = "|tip1 如果誰死於|sid106401|id或|sid107439|id" -- Needs review
	pszzdragotxtopt666 = "|cff00ff00Boss_shieldsmonitor|r - 如果插件已安裝，提示|sid110214|id吸收的治療。" -- Needs review
	pszzdragotxtopt667 = "|tip4 在'戰鬥中'框架裡，保存關於|sid110095|id的訊息。" -- Needs review
	pszzdragotxtopt671 = "|cff00ff00Boss_shieldsmonitor|r - 如果插件已安裝，顯示|sid105479|id吸收的治療" -- Needs review
	pszzdragotxtopt672 = "|tip2 誰治療了|sid105479|id(吸收)" -- Needs review
	pszzdragotxtopt674 = "|tip3 在傷害/切換訊息中，保存關於對驚駭融合體(最後10%血量)和烈焰肌腱造成傷害的訊息。" -- Needs review
	pszzdragotxtopt675 = "|tip1 誰在驚駭融合體(最後10%血量)未施放|sid105845|id就被擊殺的情況下對它造成傷害。" -- Needs review
	pszzdragotxtopt676 = "|tip1 追蹤現在活生生的'腐化之血'數量並發布於使用者的對話框(每3秒)" -- Needs review
	pszzdragotxtopt677 = "|tip1 同時發布'腐化之血'在自己螢幕的中央(每3秒)" -- Needs review
	pszzdragotxtopt678 = "|tip1 追蹤並自報已擊殺幾個'腐化之血'(在戰鬥中輸入以重置計數器: /script psiccschet5=0)" -- Needs review
	pszzdragotxtopt679 = "|tip1 個別保存每一個治療|sid105479|id的訊息於'所有保存的訊息'。"
	pszzdragotxtopt6710 = "|tip1 在聊天視窗中發布對腐化之觸在捆人期間造成的傷害與誤傷(有點洗頻)"
	pszzdragotxtopt681 = "|tip3 在傷害/切換訊息中保留對源質箭造成傷害的訊息" -- Needs review
	pszzdragotxtopt682 = "|tip2 提示使用|sid106466|id能力所吸收的總傷害(大約)" -- Needs review
	pszzdragotxtopt683 = "|tip2 提示誰沒使用|sid106466|id能力" -- Needs review
	pszzdragotxtopt684 = "|tip1 提示誰在沒有使用|sid106466|id(普通模式)或其他冷卻技能(英雄模式)的情況下死於|sid106794|id。" -- Needs review
	pszzdragotxtopt685 = "|tip4 標記將對沒有減低傷害技能的玩家施放|sid106794|id的源質分裂體。" -- Needs review
	pszzdragotxtoptt622 = "|s4id104322,104606,104607,104608|id傷害%s" -- Needs review
	pszzdragotxtoptt672 = "|s4id105479,109362,109363,109364|id吸收的治療" -- Needs review
	pszzdragotxtoptt682 = "|s4id106466,109634,109635,109636|id吸收的傷害(大約)" -- Needs review
	pszzdragspineexamp = "|cff00ff00範例:|r 玩家被抓住，中斷它所花費的時間。傷害腐化之觸(抓住的1秒後): 誰造成傷害。失敗傷害則是考慮熾熱之握中斷後的1-11秒。" -- Needs review
	pszzdragspinefaildmg = "誤傷" -- Needs review
	pszzdragsplit = "分攤"
	pszzdragtextbuttonuse1 = "使用|s4id106466,109634,109635,109636|id" -- Needs review
	pszzdragtextbuttonuse2 = "未使用|s4id106466,109634,109635,109636|id" -- Needs review
	pszzdragtextbuttonuse3 = "共%s位玩家未使用|s4id106466,109634,109635,109636|id!" -- Needs review
  pszzdragtotdamdone = "總傷害輸出"
	pszzdragmadnesskilledyell = "做得很好。我心中的火焰正以無可比擬的純淨能量熾熱地燃燒著"
	

end

end