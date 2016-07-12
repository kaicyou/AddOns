if GetLocale() == "zhCN" then


function psdragslocale()

psdragslastmoduleloadtxt	= "巨龙之魂"

pszzdragoboss7          = "死亡之翼的背脊"
pszzdragoboss8          = "疯狂的死亡之翼"

pszzdragotxtopt613			= "|tip1 当有人在堆叠超过一层|sid33661|id的情况下死于首领近战攻击或者破甲攻击时报告"
pszzdragotxtopt621			= "|tip2 首领从|sid104322|id获得多少治疗和谁造成的失误"
pszzdragotxtopt622			= "|tip1 当超过一个团队成员受到来自|sid104322|id的伤害时报告"
pszzdragotxtopt645			= "|tip1 当有人死于|sid105313|id时，报告其堆叠层数"
pszzdragotxtopt648			= "|tip1 当|sid109325|id没有在|sid105259|id里移除时报告"
pszzdragotxtopt649      = "|tip1 当玩家死于带有两种减益效果时报告：|sid109325|id和|sid105259|id"
pszzdragotxtopt664			= "|tip1 当有人死于|sid106401|id或|sid107439|id时，报告有关|sid107439|id的信息"
pszzdragotxtopt665			= "|tip1 当有人死于|sid106401|id或|sid107439|id时报告信息"
pszzdragotxtopt666			= "|cff00ff00Boss_shieldsmonitor|r - 如果插件已安装，显示|sid110214|id吸收的治疗量"
pszzdragotxtopt667			= "|tip4 在“伤害/目标切换信息”选项中保存有关受到|sid110095|id的信息"
pszzdragotxtopt671			= "|cff00ff00Boss_shieldsmonitor|r - 如果插件已安装，显示|sid105479|id吸收的治疗量"
pszzdragotxtopt672			= "|tip2 谁治疗了|sid105479|id（吸收）"
pszzdragotxtopt674			= "|tip3 在“伤害/目标切换信息”中保存有关丑恶的融合怪（最后10%）和装甲板连接束受到的伤害信息"
pszzdragotxtopt675			= "|tip1 如果它死亡|sid105845|id没有被施放时，报告谁对丑恶的融合怪（最后10%）造成了伤害"
pszzdragotxtopt676			= "|tip1 追踪目前还有多少'堕落熔岩'存活，并在自己的聊天频道报告它（3秒冷却）"
pszzdragotxtopt677			= "|tip1 '堕落熔岩'同时也在自己的屏幕中间报告（3秒冷却）"
pszzdragotxtopt678			= "|tip1 追踪并向自己报告有多少'堕落熔岩'被杀死（在战斗中重置计数器请使用宏：/script psiccschet5=0）"
pszzdragotxtopt679      = "|tip1 在'所有保存的信息'中分别保存每个|sid105479|id受到的治疗"
pszzdragotxtopt6710     = "|tip1 在聊天频道中报告灼热之握时对腐蚀之触造成的伤害 + 无效伤害（有一些垃圾信息）"
pszzdragotxtopt681			= "|tip3 在“伤害/目标切换信息”中保存有关源质箭受到的伤害信息"
pszzdragotxtopt682      = "|tip2 显示使用|sid106466|id法术后那些被减免（大约）的总伤害量"
pszzdragotxtopt683      = "|tip2 显示谁没有使用|sid106466|id法术"
pszzdragotxtopt684      = "|tip1 如果有人死于|sid106794|id而没有使用|sid106466|id（普通模式）或者其他可用冷却的技能（英雄模式）时显示"
pszzdragotxtopt685      = "|tip4 在那些怪物开始施放|sid106794|id时标记那些没有减少伤害技能的玩家"


pszzdragotxtoptt672     = "被|s4id105479,109362,109363,109364|id吸收的治疗"
pszzdragotxtoptt622	= "|s4id104322,104606,104607,104608|id伤害了%s"
pszzdragonly10		= "只有<%s%%血量"
pszzdragdamageinfly	= "只是爆炸之前"
pszzdragdamageinfly2	= "总伤害（没有减速）"
pszzdragotxtoptt682     = "被|s4id106466,109634,109635,109636|id减免的伤害（大约）"
pszzdragtextbuttonuse1	= "使用|s4id106466,109634,109635,109636|id的只有"
pszzdragtextbuttonuse2	= "没有使用|s4id106466,109634,109635,109636|id的人"
pszzdragtextbuttonuse3 	= "%s个玩家没有使用|s4id106466,109634,109635,109636|id！"
pszzdraghpontheendcast	= "施放结束后的剩余血量"
pszzdragdiedtoquick     = "没有堆叠9层时死亡！"
pszzdraghpremain         = "保持血量"
pszzdragsplit           = "分摊"
pszzdragdiedwarmast     = "死亡（分摊之前玩家的血量）"
pszzdragothercd         = "可用冷却的"
pszzdragdamagetoplayer  = "伤害了玩家"
pszzdragdamageto        = "伤害了"
pszzdraghealedby        = "受到治疗"
pszzdragspineexamp      = "|cff00ff00示例：|r玩家被灼热之握抓住，打断它所花费的时间。对玩家造成的伤害<数值>。对腐蚀之触造成的伤害（当灼热之握施放后的1秒开始记录）：谁造成了伤害(和直接攻击的次数）。灼热之握被打断后的1-11秒内被认为是无效的伤害。"
pszzdragspinefaildmg    = "无效的伤害"
pszzdragbloodalive      = "存活"
pszzdragbuffnotfound    = "%s效果没有在玩家身上发现！"
pszzdragbuffnotfound2   = "%s效果已移除，但是并没有在他身上发现|s4id110317|id！"
pszzdragbefore          = "以前"
pszzdragforcast         = "在%s施放"
pszzdragtotdamdone      = "总计造成的伤害"
pszzdragnodamagegot     = "没有受到伤害"
pszzdragbloodkilled     = "被杀死"
pszzdragmadnesskilledyell = "干得好。我心中的火焰将迸发出无比纯净的光芒"
pszzdragontheground = "在地面上有"


	
end

end