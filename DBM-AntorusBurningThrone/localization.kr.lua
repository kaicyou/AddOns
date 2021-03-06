if GetLocale() ~= "koKR" then return end
local L

---------------------------
-- Garothi Worldbreaker --
---------------------------
L= DBM:GetModLocalization(1992)

L:SetTimerLocalization({
})

L:SetOptionLocalization({
})

L:SetMiscLocalization({
})

---------------------------
-- Hounds of Sargeras --
---------------------------
L= DBM:GetModLocalization(1987)

L:SetOptionLocalization({
	SequenceTimers =	"영웅/신화 난이도일 때 이전에 시전한 스킬의 타이머를 삭제해서 타이머 수를 정리합니다. 대신 약간 타이머 정확도가 떨어지게 됩니다 (1-2초 빠르게 나옴)"
})

---------------------------
-- War Council --
---------------------------
L= DBM:GetModLocalization(1997)

---------------------------
-- Eonar, the Lifebinder --
---------------------------
L= DBM:GetModLocalization(2025)

L:SetTimerLocalization({
	timerObfuscator		=	"다음 혼란자 (%s)",
	timerDestructor 	=	"다음 파괴자 (%s)",
	timerPurifier 		=	"다음 정화자 (%s)",
	timerBats	 		=	"다음 박쥐 (%s)"
})

L:SetMiscLocalization({
	Obfuscators =	"혼란자",
	Destructors =	"파괴자",
	Purifiers 	=	"정화자",
	Bats 		=	"박쥐",
	EonarHealth	= 	"이오나 생명력",
	EonarPower	= 	"이오나 기력"
})

---------------------------
-- Portal Keeper Hasabel --
---------------------------
L= DBM:GetModLocalization(1985)

L:SetOptionLocalization({
	ShowAllPlatforms =	"단상 위치와 관계 없이 모든 알림 보기"
})

---------------------------
-- Imonar the Soulhunter --
---------------------------
L= DBM:GetModLocalization(2009)

L:SetMiscLocalization({
	DispelMe =		"해제 해주세요!"
})

---------------------------
-- Kin'garoth --
---------------------------
L= DBM:GetModLocalization(2004)

L:SetOptionLocalization({
	InfoFrame =	"전투의 전반적인 상황을 정보 창에 표시",
	UseAddTime = "초기화 페이즈가 끝났을 때 항상 보스의 다음 스킬 타이머가 표시됩니다. (옵션을 끄면 보스가 다시 활성화됐을 때 정확한 스킬 타이머가 표시되지만, 1~2초 남은 스킬의 쿨타임에 대한 경고만 뜰 수도 있습니다)"
})

---------------------------
-- Varimathras --
---------------------------
L= DBM:GetModLocalization(1983)

---------------------------
-- The Coven of Shivarra --
---------------------------
L= DBM:GetModLocalization(1986)

L:SetOptionLocalization({
	timerBossIncoming		= "다음 보스 교대 타이머 바 보기"
})

---------------------------
-- Aggramar --
---------------------------
L= DBM:GetModLocalization(1984)

---------------------------
-- Argus the Unmaker --
---------------------------
L= DBM:GetModLocalization(2031)

-------------
--  Trash  --
-------------
L = DBM:GetModLocalization("AntorusTrash")

L:SetGeneralLocalization({
	name =	"안토러스 일반몹"
})
