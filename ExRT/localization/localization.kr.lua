local GlobalAddonName, ExRT = ...

if ExRT.locale ~= "koKR" then
	return
end

local L = ExRT.L
local PH = ExRT.L --> Promt, Need retranslate

L.message = "메모"
L.marks = "징표"
L.bossmods = "우두머리 모듈"
L.timers = "타이머"
L.raidcheck = "공격대 확인"
L.marksbar = "징표 바"
L.invite = "초대 도구"
L.help = "도움말"
L.cd2 = "공격대 생존기"
L.sooitems = "공격대 전리품"
L.sallspells = "모든 주문"
L.scspells = "직업"
PH.sencounter = "우두머리 통계"
L.BossWatcher = "전투 분석"
L.InspectViewer = "공격대 살펴보기"
L.Coins = "추가 전리품"
L.Arrow = "화살표"
L.Marks = "징표"
L.Logging = "로그 저장"
PH.LootLink = "전리품 대화 알림"
L.BattleRes = "전투 부활"
L.Skada = "스카다 모듈"
L.Profiles = "프로필"
L.LegendaryRing = "전설 반지"
L.Attendance = "공격대 출석부"
L.WhoPulled = "풀링한 사람"
L.WAChecker = "WeakAuras 확인"

L.messagebutsend = "전송"
L.messagebutclear = "초기화"
L.messageButCopy = "저장과 전송을 위해 본 메모로 옮기기"
L.messagebutfix = "잠금"
L.messagebutfixtooltip = "메모의 이동과 크기조절 사용"
L.messagebutalpha = "투명도"
L.messagebutscale = "크기"
PH.messagebutsendtooltip = "저장 후 메모를 모든 공격대원에게 전송합니다\n\nShift 키를 이용해 파티 또는 공격대 대화에 복사합니다"
L.messageOutline = "글꼴 외곽선 사용"
L.messageBackAlpha = "배경 투명도"
L.messageTab1 = "본 메모"
L.messageTab2 = "초안"
L.NoteResetPos = "위치 초기화"
PH.NoteResetPosTooltip = "메모를 화면 중앙으로 옮깁니다"
L.NoteColor = "색상"
PH.NoteColorTooltip1 = "|cff00ff00||cXXXXXXXX|r (XXXXXXXX는 색상 코드)와 |cff00ff00||r|r 사이의 문자는 색이 입혀집니다."
PH.NoteColorTooltip2 = "드롭다운 목록에서 색상을 선택하여 글자를 강조합니다."
L.NoteColorRed = "빨강"
L.NoteColorGreen = "녹색"
L.NoteColorBlue = "파랑색"
L.NoteColorYellow = "노랑색"
L.NoteColorPurple = "보라색"
L.NoteColorAzure = "푸른색"
L.NoteColorBlack = "검은색"
L.NoteColorGrey = "회색"
L.NoteColorRedSoft = "옅은 빨강"
L.NoteColorGreenSoft = "옅은 녹색"
L.NoteColorBlueSoft = "옅은 파랑"
L.NoteLastUpdate = "마지막 갱신"
PH.NoteOnlyPromoted = "(부)공격대장만"
PH.NoteOnlyPromotedTooltip = "공격대장이나 부공격대장만 갱신할 수 있게 합니다"
PH.NoteTabCopyTooltip = "SHIFT 키를 이용해 현재 메모를 이 초안에 복사합니다"
PH.NoteSelf = "개인 메모"
PH.NoteSelfTooltip = "본 메모 다음에 자신만의 메모가 표시됩니다"
L.NoteAdd = "추가"
L.NoteRemove = "초안 삭제"
L.NoteDraftName = "메모 이름"
L.NoteOtherIcons = "기타 아이콘"
L.NoteFontOptions = "글꼴 옵션"
L.NoteFontOptionsBack = "<<< 뒤로"
L.NoteFontSize = "글꼴 크기"
L.NoteHideInCombat = "전투 중 숨기기"
L.NoteFrameStrata = "프레임 우선순위"
L.NoteShowOnlyPersonal = "개인 메모만 표시"
L.NoteShowOnlyInRaid = "공격대 중일때만 메모 표시"
L.NoteAutoloadOnBoss = "우두머리에서 자동 불러오기:"
L.NoteSaveAllNew = "받은 메모 저장"

L.setminimap1 = "미니맵 아이콘 숨기기"
L.setauthor = "제작자"
L.setver = "버전"
L.setcontact = "연락처"
L.setEggTimerSlider = "글로벌 업데이트, ms."
L.SetThanks = "Thanks"
L.SetErrorInCombat = "블리자드 전투 제한때문에 불러오기를 완료하기 위해 전투가 끝날 때까지 기다립니다."
L.SetAdditionalTabs = "추가적인 탭"
L.SetTranslate = "한글화"

L.bossmodstot = "천둥의 왕좌"
PH.bossmodsradenhelp = "라덴. 플레이어들은 2개의 줄로 정렬됩니다 (2파티와 4파티가 왼쪽 줄, 3파티와 5파티가 오른쪽). \"불안정한 생령\" 디버프를 가진 플레이어는 녹색, \"민감한 생령\" 플레이어는 적색, 디버프가 없으면 흰색으로 강조됩니다."
L.bossmodsradenonly25 = "25인 공격대만"
L.bossmodsraden ="라덴"
L.bossmodssoo = "오그리마 공성전"
L.bossmodsalpha = "투명도"
L.bossmodsscale = "크기"
L.bossmodsclose = "모든 우두머리 모듈 닫기"
L.bossmodsmalkorok ="말코록"
L.bossmodsmalkorokai ="말코록 AI"
PH.bossmodsmalkorokhelp ="말코록 우두머리 모듈. \"조각\"을 좌클릭하면 선택하고 우클릭하면 취소합니다."
PH.bossmodsmalkorokaihelp ="말코록 AI 우두머리 모듈. 광역 피해 단계 동안 사람 수가 적은 곳을 자동 선택합니다. 5초 동안 주황색으로 강조됩니다.  사용하려면 공격대에서 부공격대장 이상의 권한을 가진 한명만 도우미를 사용해야 합니다."
L.bossmodsmalkorokdanger ="<<< 위험 >>>"
L.bossmodsshaofpride = "노루셴 / 교만의 샤"
L.bossmodsSpoilsofPandaria = "판다리아의 전리품"
PH.bossmodsAutoLoadTooltip = "자동 불러오기"
L.bossmodstok = "피에 굶주린 토크"
L.BossmodsSpoilsofPandariaMogu = "모구"
L.BossmodsSpoilsofPandariaKlaxxi = "클락시"
L.BossmodsSpoilsofPandariaOpensBox = "열린 상자 위치:"
L.BossmodsResetPos = "위치 초기화"
PH.BossmodsResetPosTooltip = "모든 프레임-우두머리 모듈을 화면의 중앙으로 이동합니다"
L.BossmodsMalkorokSkada = "말코록 Skada"
PH.BossmodsMalkorokSkadaTooltip = "Skada 애드온을 위한 모듈입니다. 실제 치유량 표시 (녹색 방패 |TInterface\\Icons\\ability_malkorok_blightofyshaarj_green:0|t\|cff00ff00강력한 고대의 방벽|r 대상에게 준 모든 치유량은 초과치유가 됩니다)"
L.BossmodsMalkorokSkadaError1 = "Skada를 찾을 수 없습니다"
L.BossmodsMalkorokSkadaError2 = "이미 불러온 모듈입니다"
L.BossmodsMalkorokSkadaOnLoad1 = "\"말코록 Skada\" 모듈을 불러왔습니다!"
PH.BossmodsMalkorokSkadaOnLoad2 = "주의! \"말코록 Skada\" 모듈을 끄려면 반드시 \"/reload\" 명령어로 UI를 다시 불러와야 합니다"
L.BossmodsKoragh = "코라그"
L.BossmodsMargok = "높은군주 마르고크"
L.BossmodsKromog = "크로모그"
L.BossmodsKromogLastUpdate = "마지막 갱신"
L.BossmodsKromogHidePlayers = "할당된 플레이어 숨기기"
L.BossmodsKromogClear = "초기화"
L.BossmodsKromogSelectPlayer = "슬롯 #의 플레이어 선택"
L.BossmodsKromogDisableArrow = "화살표 비활성"
L.BossmodsKromogSend = "전송"
L.BossmodsKromogSort = "정렬"
L.BossmodsThogar = "기관사 토가르 [일반과 영웅]"
L.BossmodsThogarIn = "진입"
L.BossmodsThogarTransit = "통과"
L.BossmodsThogarOut = "진출"
PH.BossmodsKoraghHelp = "|TInterface\\Icons\\spell_fire_felfirenova:0|t 마법 방출: 악마 디버프 지원"
L.BossmodsKromogTest = "테스트"
L.BossmodsKromogSetups = "구성"
L.BossmodsKromogSetupsSave = "저장"
L.BossmodsKromogSetupsLoad = "불러오기"
L.BossmodsKromogSetupsClear = "초기화"
L.BossmodsKromogSetupsClose = "닫기"
PH.BossmodsKromogOnlyTrusted = "(부)공격대장만"
PH.BossmodsKromogOnlyTrustedTooltip = "공격대장 또는 부공격대장이 아닌 플레이어의 갱신 무시하기"
L.BossmodsIskarDisableClassColor = "직업 색상 사용 안함"
L.BossmodsIskarHideStacks = "중첩 숨기기"
L.BossmodsIskarDisableRed = "붉은색 배경 비활성 (안주의 눈 버프)"
L.BossmodsIskarShowNames = "이름 표시"
L.BossmodsKormrokCopy = "복사"
PH.BossmodsKormrokArrow = "화살표 항상 표시"
L.BossmodsArchimondeRadar = "레이더"
L.BossmodsArchimondeInfernals = "지옥불 멸망의 인도자"
L.BossmodsArchimondeInfernalsTooltip = "지옥불 멸망의 인도자 체력"
L.BossmodsArchimondeDisableShackled = "\"구속된 고통\" 범위 비활성"
PH.BossmodsArchimondeDistance = "표시 반경"
L.BossmodsArchimondeDisableMarking = "전술 목표 지정 비활성"
L.BossmodsArchimondeDisableText = "이름 숨기기"
L.BossmodsGorefiendTargeting = "클릭으로 영혼 대상 지정 사용"
PH.BossmodsGorefiendWithClicking = "<클릭으로 대상 지정 허용 옵션과 함께>"

PH.timerstxt1 = "/rt pull\n/rt pull X\n/rt afk X\n/rt afk 0\n/rt timer S X\n|cFFFFFFFF |r\n\n\n/rt mytimer X"
PH.timerstxt2 = "- 전투 예정 타이머, 10 초\n- 전투 예정 타이머, X 초\n- 휴식 타이머, X 분\n- 휴식 타이머 취소\n- \"S\"라는 이름의 X 초짜리 타이머 실행\n\n\n\n- 전투 초읽기 타이머, X 초"
L.timerattack = "전투 시작"
L.timerattackcancel = "취소됨"
L.timerattackt = "전투 예정: "
L.timerafk = "휴식"
L.timerafkcancel = "휴식 취소됨"
L.timermin = "분"
L.timersec = "초"
L.timerTimerFrame = "전투 타이머"
L.TimerTimeToKill = "마무리 시간"
L.TimerResetPos = "위치 초기화"
PH.TimerResetPosTooltip = "전투 타이머를 화면 중앙으로 이동합니다"
PH.TimerTimeToKillHelp = "대략적인 \"마무리 시간\"이 전투 타이머 아래 표시됩니다"
L.TimerOnlyInCombat = "전투 중에만 표시"
L.TimerSpecTimerDefault = "전문화 시간 초기화"
L.TimerSpecTimerHeader = "전문화 타이머 (준비 시간(초), 전문화 별 유동 전투 예정 타이머에 필요):"
PH.TimerUseDptInstead = "기본 기능 대신 유동 전투 예정 타이머 사용 (\"/rt pull\" 또는 징표 바에서)"
L.TimerDisableRWmessage = "대화로 초읽기 비활성"

L.raidchecknofood = "음식 없음"
L.raidchecknoflask = "영약 없음"
L.raidcheckfood = "음식 확인"
PH.raidcheckfoodchat = "대화에 음식 보고"
L.raidcheckflask = "영약 확인"
PH.raidcheckflaskchat = "대화에 영약 보고"
PH.raidcheckslak = "전투 준비 시 음식과 영약 보고"
L.raidcheckPotion = "물약: "
L.raidcheckHS = "생명석: "
PH.raidcheckPotionCheck = "물약과 생명석 사용 추적 사용"
PH.raidcheckPotionLastPull = "마지막 전투의 물약"
PH.raidcheckPotionLastPullToChat = "대화에 물약 보고"
PH.raidcheckHSLastPull = "마지막 전투의 생명석"
PH.raidcheckHSLastPullToChat = "대화에 생명석 보고"
L.raidcheckReadyCheck = "전투 준비"
L.raidcheckReadyCheckScale = "크기"
L.raidcheckReadyCheckTest = "테스트"
PH.raidcheckReadyCheckTimerTooltip = "전투 준비 후 사라질 시간 (초):"
L.raidcheckReadyCheckSec = "초"
PH.RaidCheckReadyCheckHelp = "전투 준비가 완료된 플레이어의 이름은 목록에서 제외됩니다. 음식 또는 영약 버프가 없는 플레이어의 이름은 빨간색으로 표시됩니다"
PH.RaidCheckRunesEnable = "전투 준비동안 룬 추적 사용"
L.RaidCheckRunesCheck = "룬 확인"
L.RaidCheckRunesChat = "대화에 룬 보고"
L.RaidCheckNoRunes = "룬 없음"
PH.RaidCheckOnAttack = "공격 타이머 진행 중 추적 사용"
L.RaidCheckMinFoodLevel = "최소 음식 등급: "
L.RaidCheckMinFoodLevelAny = "모두"
PH.RaidCheckSendSelf = "나에게만 표시"
L.RaidCheckNoBuffs = "버프 없음"
L.RaidCheckBuffs = "버프 확인"
PH.RaidCheckBuffsToChat = "대화에 버프 보고"
L.RaidCheckBuffsEnable = "전투 준비동안 버프 추적 사용"
L.RaidCheckMinFlaskExp = "만료중인 영약 표시: "
L.RaidCheckMinFlaskExpNo = "안함"
L.RaidCheckMinFlaskExpMin = "분"
L.RaidCheckDisableInLFR = "공격대 찾기에서 끄기"

L.marksbarstart = "초기화"
L.marksbardel = "삭제"
L.marksbarrc = "준비"
L.marksbarpull = "전투 예정"
L.marksbarshowmarks = "징표 표시"
L.marksbarshowpermarks = "영구적 징표 표시"
L.marksbarshowfloor = "징표 기둥 표시"
L.marksbarshowrcpull = "전투 준비와 전투 예정 버튼 표시"
L.marksbaralpha = "투명도"
L.marksbarscale = "크기"
L.marksbartmr = "전투 예정 타이머, 초:"
L.marksbarWMView = "징표 모양:"
L.MarksBarResetPos = "위치 초기화"
PH.MarksBarResetPosTooltip = "프레임을 화면 중앙으로 옮깁니다"
PH.MarksBarHelp = "우클릭으로 대상에게 \"영구적인\" 징표를 설정합니다.\n*대상에게만 사용 가능하며, 대상이 같은 그룹이나 공격대에 속해 있어야 합니다"
PH.MarksBarDisableInRaid = "파티 또는 공격대가 아닐 때 숨기기"
L.MarksBarVertical = "세로"
L.MarksBarReverse = "순서 반대로"

L.inviterank = "등급:"
L.inviteinv = "초대하기"
PH.inviteguildonly = "길드원만 초대하기"
PH.invitewords = "귓속말의 키워드로 초대하기"
PH.invitewordstooltip = "키워드"
PH.invitedis = "공격대 해산"
PH.inviteReInv = "공격대 해산 후 다시 초대하기"
L.inviteaccept = "친구나 길드원의 초대는 자동 수락"
PH.inviteAutoPromote = "자동 승급"
PH.inviteAutoPromoteTooltip = "자동으로 승급할 이름"
PH.inviteAutoPromoteDontUseGuild = "사용 금지"
PH.inviteHelpRaid = "자동 초대할 최소 길드 등급을 선택하세요."
PH.inviteHelpAutoInv = "귓속말로 키워드를 보낸 모든 플레이어를 자동 초대"
PH.inviteHelpAutoAccept = "모든 초대 자동 수락"
PH.inviteHelpAutoPromote = "선택된 이름이나 길드 등급의 모든 공격대원 자동 승급 (드롭다운에서 최소 길드 등급을 선택하세요. 이 등급 이상의 모든 플레이어는 공격대에서 자동 승급 됩니다)"
L.inviteRaidDemote = "모두 강등"
L.InviteRaidDiffCheck = "공격대 난이도와 전리품 획득 방법 자동 변경"
L.InviteRaidDiff = "공격대 난이도:"
L.InviteMasterlooters = "전리품 담당자:"
PH.InviteMasterlootersTooltip = "띄워 쓰기로 전리품 담당자의 이름을 구분합니다"

L.cd2fix = "잠금"
L.cd2alpha = "투명도"
L.cd2scale = "크기"
L.cd2lines = "줄"
L.cd2split = "열 분리"
L.cd2splittooltip = "각각의 열마다 분리된 창으로 나누기"
L.cd2width = "너비"
PH.cd2graytooltip = "회색 아이콘"
PH.cd2noraid = "공격대가 아닐 때 표시"
L.cd2Spells = "주문"
L.cd2Appearance = "외형"
PH.cd2PriorityTooltip = "낮은 숫자 = 높은 우선순위"
PH.cd2ColNum = "열 번호"
L.cd2Priority = "우선순위"
L.cd2SpellID = "주문 ID"
L.cd2EditBoxCDTooltip = "재사용 대기시간, 초"
L.cd2EditBoxDurationTooltip = "지속시간, 초"
L.cd2Class = "직업"
L.cd2Spec = "전문화"
L.cd2RemoveButton = "제거"
L.cd2AddSpell = "주문 추가"
PH.cd2AddSpellFromList = "목록에서 주문 추가"
L.cd2AddSpellFrameName = "주문 목록"
L.cd2AddSpellFrameCDText = "재사용 대기시간"
L.cd2AddSpellFrameDurationText = "지속시간"
L.cd2AddSpellFrameColumnText = "열"
L.cd2AddSpellFrameTalent = "특성"
PH.cd2AddSpellFrameDuration = "지속시간 변경"
PH.cd2AddSpellFrameCDChange = "재사용 대기시간 변경"
L.cd2AddSpellFrameCharge = "충전됨"
PH.cd2AddSpellFrameChargeChange = "다음으로 중첩 가능"
PH.cd2AddSpellFrameCast = "시전 시간 표시"
PH.cd2AddSpellFrameDurationLost = "오라를 상실할 때 지속시간 취소됨"
PH.cd2AddSpellFrameSharing = "재사용 대기시간 공유"
L.cd2AddSpellFrameDispel = "해제"
PH.cd2AddSpellFrameReplace = "특성을 찍지 않았으면 중단"
L.cd2AddSpellFrameRadiness = "오공 장신구 재사용 대기시간 감소"
PH.cd2ButtonModify = "설정 >>"
L.cd2TextSpell = "주문"
L.cd2TextAdd = "추가"
PH.cd2ColSet = "열 구성"
PH.cd2ColSetBotToTop = "오름차순"
PH.cd2ColSetGeneral = "일반 설정 사용"
PH.cd2ColSetResetPos = "위치 초기화"
L.cd2ColSetTextRight = "우측 문자"
L.cd2ColSetTextCenter = "중앙 문자"
L.cd2ColSetTextLeft = "좌측 문자"
PH.cd2ColSetTextReset = "기본으로 초기화"
PH.cd2ColSetTextTooltip = "문자 입력 창에 이용 가능한 견본들:|n|cff00ff00%name%|r - 플레이어 이름|n|cff00ff00%time%|r - 재사용 대기시간|n|cff00ff00%name_time%|r - 플레이어 이름. 재사용 대기 중일땐 시간|n|cff00ff00%spell%|r - 주문 이름|n|cff00ff00%stime%|r - \"축약 시간\".|n|cff00ff00%name_stime%|r - 플레이어 이름. 재사용 대기 중일땐 \"축약 시간\"|n|cff00ff00%status%|r - 플레이어가 죽음/오프라인일 때 상황 문자|n|cff00ff00%charge%|r - 사용 가능한 충전 횟수 (가능할 때만)"
PH.cd2ColSetMethodCooldown = "아이콘에 쿨다운 애니메이션 사용"
L.cd2ColSetTextIconName = "주문 아이콘에 플레이어 이름 표시"
PH.cd2ColSetColsInCol = "열을 나눌 갯수"
PH.cd2GeneralSet = "일반 구성"
L.cd2GeneralSetTestMode = "테스트 모드"
PH.cd2OtherSet = "기타 구성"
L.cd2OtherSetTexture = "무늬"
L.cd2OtherSetColor = "색상 설정"
PH.cd2OtherSetColorFrameText = "기본 색상"
PH.cd2OtherSetColorFrameActive = "활성 색상"
PH.cd2OtherSetColorFrameCooldown = "사용불가 색상"
PH.cd2OtherSetColorFrameCast = "시전 색상"
PH.cd2OtherSetColorFrameAlpha = "배경 투명도"
PH.cd2OtherSetColorFrameAlphaCD = "재사용 대기시간 바 투명도"
PH.cd2OtherSetColorFrameAlphaCooldown = "사용불가 투명도"
PH.cd2OtherSetColorFrameReset = "기본으로 초기화"
PH.cd2OtherSetColorFrameSoften = "옅은 색상"
PH.cd2OtherSetColorFrameClass = "직업 색상 사용"
PH.cd2OtherSetColorFrameTopText = "글자"
PH.cd2OtherSetColorFrameTopBack = "배경"
PH.cd2OtherSetColorFrameTopTimeLine = "줄"
L.cd2OtherSetIconSize = "아이콘 크기"
L.cd2OtherSetFontSize = "글꼴 크기"
L.cd2OtherSetFont = "글꼴"
PH.cd2OtherSetOutline = "글꼴 외곽선"
L.cd2OtherSetFontShadow = "글꼴 그림자"
PH.cd2OtherSetAnimation = "애니메이션 사용"
L.cd2OtherSetReset = "초기화"
PH.cd2OtherSetOnlyOnCD = "재사용 대기 중일 때만 표시"
PH.cd2OtherSetIconPosition = "아이콘 위치"
PH.cd2OtherSetIconPositionLeft = "왼쪽 아이콘"
PH.cd2OtherSetIconPositionRight = "오른쪽 아이콘"
PH.cd2OtherSetIconPositionNo = "아이콘 숨기기"
PH.cd2OtherSetStyleAnimation = "애니메이션 스타일"
L.cd2OtherSetStyleAnimation1 = "채워진 상태로 시작"
L.cd2OtherSetStyleAnimation2 = "빈 상태로 시작"
PH.cd2OtherSetTimeLineAnimation = "사용가능 줄"
PH.cd2OtherSetTimeLineAnimation1 = "바를 채우지 않기"
PH.cd2OtherSetTimeLineAnimation2 = "바를 채우기"
L.cd2OtherSetTabNameGeneral = "일반"
L.cd2OtherSetTabNameIcons = "아이콘"
L.cd2OtherSetTabNameColors = "무늬와 색상"
L.cd2OtherSetTabNameFont = "글꼴"
L.cd2OtherSetTabNameText = "이름과 시간"
PH.cd2OtherSetTabNameOther = "기타 구성"
L.cd2OtherSetTabNameTemplate = "견본"
PH.cd2OtherSetTemplateRestore = "복구"
PH.cd2fastSetupTitle = "빠른 구성"
L.cd2fastSetupTooltip = "주문 목록"
PH.cd2fastSetupTitle1 = "공격대 생존기"
PH.cd2fastSetupTitle2 = "개인 생존기"
L.cd2fastSetupTitle3 = "부활"
L.cd2fastSetupTitle4 = "차단"
L.cd2fastSetupTitle5 = "도발"
L.cd2fastSetupTitle6 = "해제"
PH.cd2History = "기록"
L.cd2HistoryClear = "초기화"
PH.cd2HelpFastSetup = "빠른 출발! 모듈을 켜고, 재사용 대기시간 창을 적당한 위치로 옮기고 고정시키세요. \"빠른 구성\" 버튼을 이용해 주문을 추가하세요."
PH.cd2HelpOnOff = "추적을 시작할 주문 활성"
PH.cd2HelpCol = "직업 선택"
PH.cd2HelpPriority = "우선순위 선택. 낮은 우선순위 숫자의 주문은 위쪽에 표시됩니다"
PH.cd2HelpTime = "지속시간과 열, 재사용 대기시간 설정. (* 몇몇 기본 주문들은 제한됩니다)"
PH.cd2HelpColSetup = "각 열에 대한 개인 설정. \"사용\" 하는 걸 잊지마세요."
PH.cd2HelpTestButton = L.cd2GeneralSetTestMode
PH.cd2HelpButtonDefault = "선택된 열의 모든 설정을 기본으로 초기화"
PH.cd2HelpAddButton = "사용자 설정 주문 추가. 스크롤을 내리고 \"".. L.cd2AddSpell .."\"을 클릭하세요. 첫번째 입력창엔 주문 ID를 입력 후, 직업을 선택하고, \"".. L.cd2ButtonModify .."\"버튼을 눌러 지속시간과 열, 재사용 대기시간을 변경하세요."
PH.cd2HelpHistory = "모든 주문의 사용 기록."
PH.cd2ColSetFontOtherAvailable = "각 글자별 위치 설정"
L.cd2ColSetFontPosGeneral = "일반"
L.cd2ColSetFontPosLeft = "왼쪽"
L.cd2ColSetFontPosRight = "오른쪽"
L.cd2ColSetFontPosCenter = "중앙"
L.cd2ColSetFontPosIcon = "아이콘"
PH.cd2ColSetBetweenLines = "줄 간격"
L.cd2BlackBack = "배경 투명도"
L.cd2StatusOffline = "(접속 종료)"
L.cd2StatusDead = "(죽음)"
L.cd2InspectHaste = "가속 %+(%d+)"
L.cd2InspectHasteGem = "NOT USABLE IN THIS LOCALE"
L.cd2InspectMastery = "특화 %+(%d+)"
L.cd2InspectMasteryGem = "NOT USABLE IN THIS LOCALE"
L.cd2InspectCrit = "치명타 및 극대화 %+(%d+)"
L.cd2InspectCritGem = "NOT USABLE IN THIS LOCALE"
L.cd2InspectCritGemLegendary = "치명타 및 극대화 %+%]%](%d+),"
L.cd2InspectSpirit = "정신력 %+(%d+)"
L.cd2InspectInt = "지능 %+(%d+)"
L.cd2InspectIntGem = "NOT USABLE IN THIS LOCALE" -- Legendary
L.cd2InspectStr = "힘 %+(%d+)"
L.cd2InspectStrGem = "NOT USABLE IN THIS LOCALE"
L.cd2InspectAgi = "민첩성 %+(%d+)"
L.cd2InspectSpd = "주문력 %+(%d+)"
L.cd2InspectAll = "모든 속성 %+(%d+)"
L.cd2OtherSetBorder = "테두리"
PH.cd2OtherSetIconToolip = "아이콘 툴팁"
PH.cd2OtherSetLineClick = "클릭하여 대화에 메시지 전송"
L.cd2InspectLeech = "생기흡수 %+(%d+)"
L.cd2InspectMultistrike = "연속타격 %+(%d+)"
L.cd2InspectMultistrikeGem = "NOT USABLE IN THIS LOCALE"
L.cd2InspectVersatility = "유연성 %+(%d+)"
L.cd2InspectVersatilityGem = "NOT USABLE IN THIS LOCALE"
L.cd2InspectBonusArmor = "추가 방어도 %+(%d+)"
L.cd2InspectAvoidance = "광역회피 %+(%d+)"
L.cd2InspectSpeed = "이동 속도 %+(%d+)"
L.cd2Resurrect = "부활"
PH.cd2ResurrectTooltip = "공격대 부활 바 (재사용 대기시간).\n일반 또는 영웅, 신화 공격대에서 표시됩니다"
L.cd2Columns = "열"
PH.cd2SortByAvailability = "사용 가능별 정렬"
PH.cd2NewSpellNewLine = "같은 주문끼리 그룹으로 묶어서 표시"
PH.cd2NewSpellNewLineTooltip = "*열에 1개 이상의 주문이 있을때만 작동합니다"
L.cd2MethodsSortingRules = "정렬 방법"
L.cd2MethodsSortingRules1 = "1. 우선순위 > 주문 ID > 플레이어 이름"
L.cd2MethodsSortingRules2 = "2. 우선순위 > 플레이어 이름 > 주문 ID"
L.cd2MethodsSortingRules3 = "3. 우선순위 > 플레이어 직업 > 주문 ID > 플레이어 이름"
L.cd2MethodsSortingRules4 = "4. 우선순위 > 플레이어 직업 > 플레이어 이름 > 주문 ID"
L.cd2MethodsSortingRules5 = "5. 플레이어 이름 > 우선순위 > 주문 ID"
L.cd2MethodsSortingRules6 = "6. 플레이어 직업 > 우선순위 > 플레이어 이름 > 주문 ID"
PH.cd2SortByAvailabilityActiveToTop = "활성화된 주문을 상단으로 이동"
L.cd2SortByAvailabilityActiveToTopTooltip = "\"".. L.cd2SortByAvailability .."\" 옵션이 반드시 켜져 있어야 합니다"
L.cd2MethodsDisableOwn = "자신의 주문 숨기기"
PH.cd2FilterWindowHelp = "Shift 키를 누르고 여러 출처나 대상을 선택하여 필터링합니다"
L.cd2Racial = "종족"
L.cd2Items = "아이템"
L.cd2OtherSetHideSpark = "\"섬광\" 숨기기"
PH.cd2MethodsAlphaNotInRange = "플레이어가 사정거리 밖일 때 투명도"
L.cd2OtherSetTabNameBlackList = "차단목록"
PH.cd2ColSetBlacklistTooltip = "차단목록\n플레이어의 이름을 입력해 줄에서 숨깁니다. 또한 |cff00ff00playername:spell_ID|r 구문을 사용해 특정 주문만 숨길 수 있습니다"
PH.cd2ColSetWhitelistTooltip = "허용목록\n비어있지 않으면 차단목록은 작동하지 않습니다. 아래 입력된 플레이어 이름의 주문만 열에 표시됩니다. 각 줄마다 이름을 입력하세요"
PH.cd2ColSetShowTitles = "제목 표시"
PH.cd2ColSetDisableActive = "활성화 된 주문 지속시간 표시하지 않기"
L.cd2ColSetIconHideBlizzardEdges = "아이콘 \"모서리\" 숨기기"
L.cd2ReverseSorting = "정렬 순서 반대로"
L.cd2TextureSmoothAnim = "부드러운 색상 변경"
L.cd2ColSetOneSpellPerCol = "한 열당 1 주문만"
L.cd2ColSetOneSpellPerColTooltip = "한 열마다 오직 하나의 사용 가능한 주문만 표시합니다."
L.cd2OtherSetTabNameVisibility = "표시"
L.cd2OtherVisibilityPartyType = "파티 유형 별"
L.cd2OtherVisibilityPartyTypeRaid = "공격대 중"
L.cd2OtherVisibilityZoneType = "지역 유형 별"

L.sallspellsEggClear = "초기화"
L.sallspellsEgg = "전투 기록"
PH.sallspellsEggPlayers = "플레이어 기록"
L.sallspellsEggAutoLoad = "자동 불러오기"

L.sooitemstrash = "일반몹"
L.sooitemssets = "세트"
L.RaidLootSelect = "선택"
L.RaidLootTypeRaid = "[공격대]"
L.RaidLootTypeParty = "[파티]"
L.RaidLootTypeSolo = "[솔로]"
L.RaidLootWODCraftBlacksmithing = "대장기술"
L.RaidLootWODCraftEngineering = "기계공학"
L.RaidLootWODCraftLeatherworking = "가죽세공"
L.RaidLootWODCraftTailoring = "재봉술"
L.RaidLootWODCraftJewelcrafting = "보석세공"
L.RaidLootWODCraftInscription = "주문각인"
L.RaidLootT18HCBoss13trink = "아키몬드 (장신구)"
L.RaidLootTitleRaid = "공격대 / 던전:"
L.RaidLootTitleBoss = "우두머리:"

L.sencounterUnknown = "알 수 없음"
L.sencounter5ppl = "5인"
L.sencounter5pplHC = "5인 영웅"
L.sencounter10ppl = "10인"
L.sencounter25ppl = "25인"
L.sencounter10pplHC = "10인 영웅"
L.sencounter25pplHC = "25인 영웅"
L.sencounterLfr = "공격대 찾기"
L.sencounterChall = "도전 모드"
L.sencounter40ppl = "40인"
L.sencounter3pplHC = "영웅 시나리오"
L.sencounter3ppl = "시나리오"
L.sencounterFlex = "탄력적 공격대"
L.sencounterMystic = "신화 *"
L.sencounterWODNormal = "일반"
L.sencounterWODHeroic = "영웅"
L.sencounterWODMythic = "신화"
L.sencounterBossName = "우두머리 이름"
L.sencounterFirstKill = "첫 처치"
L.sencounterWipes = "트라이"
L.sencounterKills = "처치"
L.sencounterFirstBlood = "첫 죽음"
L.sencounterWipeTime = "전멸"
L.sencounterKillTime = "처치"
L.sencounterOnlyThisChar = "이 캐릭터만"
L.EncounterClear = "모든 데이터 삭제"
L.EncounterClearPopUp = "모든 데이터가 삭제됩니다. 진행할까요?"
L.EncounterLegacy = "낭만"
L.EncounterAllTime = "총"
L.EncounterAllTimeTooltip = "우두머리의 총 트라이 시간"
PH.EncounterFirstKillTooltip = "첫번째 처치. 우두머리를 처음으로 처치했을 때의 트라이 횟수"
PH.EncounterFastKillTooltip = "가장 빠른 처치 시간"
L.EncounterPullsTooltip = "우두머리의 총 트라이 횟수 (최소 30초 이상 전투만)"

L.BossWatcherFilterTaunts = "도발"
L.BossWatcherFilterOnlyBuffs = "강화 효과만"
L.BossWatcherFilterOnlyDebuffs = "약화 효과만"
L.BossWatcherFilterBySpellID = "주문 ID"
L.BossWatcherFilterTooltip = "주문 목록"
L.BossWatcherFilterStun = "기절"
PH.BossWatcherFilterPersonal = "방어"
L.BossWatcherChkShowGUIDs = "모든 NPC의 특정 ID 표시"
L.BossWatcherTabMobs = "피해"
L.BossWatcherTabInterruptAndDispel = "차단과 해제"
L.BossWatcherTabBuffsAndDebuffs = "오라"
L.BossWatcherReportTotal = "총합"
L.BossWatcherReportCast = "시전 별"
L.BossWatcherReportSwitch = "대상 별"
L.BossWatcherDamageSwitchTabInfo = "정보"
L.BossWatcherDamageSwitchTabInfoNoInfo = "정보 없음"
L.BossWatcherDamageSwitchTabInfoRIP = "R.I.P."
L.BossWatcherInterrupts = "차단"
L.BossWatcherDispels = "해제"
L.BossWatcherBuffsAndDebuffsTextOn = "->"
L.BossWatcherBuffsAndDebuffsTooltipTitle = "이벤트"
L.BossWatcherBuffsAndDebuffsFilterSource = "출처"
L.BossWatcherBuffsAndDebuffsFilterTarget = "대상"
L.BossWatcherBuffsAndDebuffsFilterAll = "모두"
L.BossWatcherBuffsAndDebuffsFilterFriendly = "우호적"
L.BossWatcherBuffsAndDebuffsFilterHostile = "적대적"
L.BossWatcherBuffsAndDebuffsFilterSpecial = "특별한"
L.BossWatcherBuffsAndDebuffsFilterClear = "필터 초기화"
L.BossWatcherBuffsAndDebuffsFilterNone = "없음"
L.BossWatcherBuffsAndDebuffsFilterFilter = "필터"
L.BossWatcherBuffsAndDebuffsTooltipCountText = "횟수"
L.BossWatcherBuffsAndDebuffsTooltipUptimeText = "유지 시간"
L.BossWatcherUnknown = "환경"
L.BossWatcherLastFight = "마지막 전투"
L.BossWatcherTimeLineTooltipTitle = "이벤트"
L.BossWatcherTimeLineCast = "시전"
L.BossWatcherTimeLineCastStart = "시전 시작"
L.BossWatcherTimeLineDies = "죽음"
L.BossWatcherTimeLineOnText = "->"
L.BossWatcherInterruptText = "차단"
L.BossWatcherByText = "with"
L.BossWatcherDispelText = "해제"
L.BossWatcherSegments = "세분화"
PH.BossWatcherSegmentsTooltip = "전투 중 \"/rt seg\" 대화 명령어를 입력하면 새로운 세분화를 시작합니다.\n\n또한 새로운 세분화의 자동 시작을 설정할 수 있습니다."
PH.BossWatcherSegmentEventsUSS = "주문 시전 성공"
PH.BossWatcherSegmentEventsSAR = "오라 사라짐"
PH.BossWatcherSegmentEventsSAA = "오라 획득"
PH.BossWatcherSegmentEventsUD = "NPC 죽음"
PH.BossWatcherSegmentEventsCMRBE = "우두머리의 기술에 대한 대화 메시지"
L.BossWatcherSegmentNamesUSS = "주문"
L.BossWatcherSegmentNamesSAA = "+ 오라"
L.BossWatcherSegmentNamesSAR = "- 오라"
L.BossWatcherSegmentNamesUD = "죽음"
L.BossWatcherSegmentNamesES = "전투"
L.BossWatcherSegmentNamesSC = "대화 명령어"
L.BossWatcherSegmentNamesCMRBE = "대화 메시지"
L.BossWatcherSegmentsSpellTooltip = "주문 ID 또는 NPC ID"
L.BossWatcherSegmentSelectAll = "전부 선택"
L.BossWatcherSegmentSelectNothing = "선택 해제"
L.BossWatcherFilterBySpellName = "주문 이름"
L.BossWatcherSendToChat = "대화창 전송"
L.BossWatcherPetOwner = "%s의 소환수"
L.BossWatcherPetText = "소환수"
PH.BossWatcherMarkOnDeath = "죽음의 표식"
L.BossWatcherSegmentClear = "초기화"
PH.BossWatcherSegmentPreSet = "프리셋"
L.BossWatcherOptions = "기타 설정"
L.BossWatcherOptionsFightsSave = "전투 저장:"
PH.BossWatcherOptionsFightsWarning = "* 큰 숫자는 더 많은 자원을 요구합니다"
L.BossWatcherSelectFight = "전투 선택"
L.BossWatcherSelectFightClose = "닫기"
PH.BossWatcherChatSpellMsg = "주문에 대한 대화 메시지"
L.BossWatcherFilterPotions = "물약"
PH.BossWatcherFilterRaidSaves = "공격대 생존기"
L.BossWatcherFilterPandaria = "판다리아: 전설"
L.BossWatcherFilterTier16 = "오그리마 공성전"
PH.BossWatcherOptionSpellID = "시간 바에 주문 ID 표시"
L.BossWatcherTabPlayersSpells = "플레이어 주문"
PH.BossWatcherSegmentNowTooltip = "현재 주문:"
L.BossWatcherTabHeal = "치유"
PH.BossWatcherErrorInCombat = "블리자드 전투 제한때문에 데이터를 갱신하기 위해 전투가 끝날때까지 기다립니다."
PH.BossWatcherTabEnergy = "자원"
L.BossWatcherEnergyOnce1 = "번"
L.BossWatcherEnergyOnce2 = "번"
L.BossWatcherEnergyTypeUnknown = "자원 ID: "
L.BossWatcherBuffsAndDebuffsSecondsText = "초"
L.BossWatcherTabGraphics = "그래프"
L.BossWatcherGraphicsDPS = "DPS"
L.BossWatcherGraphicsHealth = "생명력"
L.BossWatcherGraphicsPower = "자원"
L.BossWatcherGraphicsStep = "단계, 초"
L.BossWatcherGraphicsTotal = "종합 DPS"
L.BossWatcherGraphicsSelect = "플레이어 선택"
PH.BossWatcherBuffsAndDebuffsFilterEditBoxTooltip = "새로운 줄에 주문 입력"
PH.BossWatcherOptionNoGraphic = "그래프 비활성"
PH.BossWatcherOptionNoBuffs = "강화 효과 & 약화 효과 비활성"
PH.BossWatcherOptionNoBuffsTooltip = "강화 효과와 약화 효과 - 많은 양의 메모리 소모의 주된 요인"
PH.BossWatcherBackToInterface = "인터페이스로 돌아가기"
L.BossWatcherButtonClose = "닫기"
L.BossWatcherCreateReport = "보고 전송"
PH.BossWatcherCreateReportTooltip = "대화창에 현재 정보 전송"
PH.BossWatcherCombatError = "전투를 벗어나거나 \"/rt bw end\" 명령어로 기록을 중단해야 합니다"
L.BossWatcherTabEnemy = "적"
L.BossWatcherAllSources = "모든 출처"
L.BossWatcherAllTargets = "모든 대상"
L.BossWatcherDamageTooltipOverkill = "초과피해"
L.BossWatcherDamageTooltipBlocked = "막음"
L.BossWatcherDamageTooltipAbsorbed = "흡수함"
L.BossWatcherDamageTooltipTotal = "총합"
L.BossWatcherDamageTooltipFromCrit = "치명타 피해"
L.BossWatcherDamageTooltipFromMs = "연속타격 피해"
L.BossWatcherDamageTooltipCount = "횟수"
L.BossWatcherDamageTooltipMaxHit = "최대 타격"
L.BossWatcherDamageTooltipMidHit = "평균 타격"
L.BossWatcherDamageTooltiCritCount = "치명타 횟수"
L.BossWatcherDamageTooltiCritAmount = "치명타 피해 총합"
L.BossWatcherDamageTooltiMaxCrit = "최대 치명타 타격"
L.BossWatcherDamageTooltiMidCrit = "평균 치명타 타격"
L.BossWatcherDamageTooltiMsCount = "연속타격 횟수"
L.BossWatcherDamageTooltiMsAmount = "연속타격 피해 총합"
L.BossWatcherDamageTooltiMaxMs = "최대 연속타격 타격"
L.BossWatcherDamageTooltiMidMs = "평균 연속타격 타격"
L.BossWatcherDamageTooltipParry = "막음"
L.BossWatcherDamageTooltipDodge = "피함"
L.BossWatcherDamageTooltipMiss = "빗나감"
L.BossWatcherAll = "모두"
L.BossWatcherDamageDamageDone = "피해량"
L.BossWatcherDamageDamageTaken = "적의 피해량"
L.BossWatcherDamageDamageTakenByEnemy = "적에게 받은 피해량"
L.BossWatcherDamageDamageTakenByPlayers = "플레이어에게 피해량"
L.BossWatcherDamageDamageDoneBySpell = "주문의 피해량"
L.BossWatcherDamageDamageTakenBySpell = "주문에 의해 받은 피해량"
L.BossWatcherSource = "출처"
L.BossWatcherTarget = "대상"
L.BossWatcherType = "형식"
L.BossWatcherDamageShowOver = "초과피해, 방어, 흡수한 피해 표시"
L.BossWatcherSwitchBySpell = "주문 별 시간 전환"
L.BossWatcherSwitchByTarget = "대상 별 시간 전환"
L.BossWatcherBeginCasting = "시전 시작"
L.BossWatcherFriendly = "우호적"
L.BossWatcherHostile = "적대적"
L.BossWatcherBySource = "출처 별"
L.BossWatcherByTarget = "대상 별"
L.BossWatcherBySpell = "주문 별"
L.BossWatcherHealTooltipOver = "초과치유"
L.BossWatcherHealTooltipAbsorbed = "흡수함"
L.BossWatcherHealTooltipTotal = "총합"
L.BossWatcherHealTooltipFromCrit = "극대화 치유"
L.BossWatcherHealTooltipFromMs = "연속타격 치유"
L.BossWatcherHealTooltipCount = "횟수"
L.BossWatcherHealTooltipHitMax = "최대 타격"
L.BossWatcherHealTooltipHitMid = "평균 타격"
L.BossWatcherHealTooltipCritCount = "극대화 횟수"
L.BossWatcherHealTooltipCritAmount = "극대화 치유 총합"
L.BossWatcherHealTooltipCritMax = "최대 극대화 타격"
L.BossWatcherHealTooltipCritMid = "평균 극대화 타격"
L.BossWatcherHealTooltipMsCount = "연속타격 적중 횟수"
L.BossWatcherHealTooltipMsAmount = "연속타격 치유 총합"
L.BossWatcherHealTooltipMsMax = "최대 연속타격 타격"
L.BossWatcherHealTooltipMsMid = "평균 연속타격 타격"
L.BossWatcherHealFriendly = "아군"
L.BossWatcherHealHostile = "적"
L.BossWatcherHealFriendlyByTarget = "아군의 대상"
L.BossWatcherHealHostileByTarget = "적의 대상"
L.BossWatcherHealFriendlyBySpell = "아군의 주문"
L.BossWatcherHealHostileBySpell = "적의 주문"
L.BossWatcherHealShowOver = "초과치유 표시"
L.BossWatcherStopRecord = "기록 중단"
L.BossWatcherStopRecord2 = "또는 /rt fl end"
PH.BossWatcherRecordStart = "기록 시작"
PH.BossWatcherRecordStop = "기록 중지"
L.BossWatcherGoToBossWatcher = "전투 분석으로 이동"
PH.BossWatcherOptionsHelp = "추가적인 대화 명령어:\n|cff00ff00/rt fl|r - 전투 로그 창 열기\n|cff00ff00/rt fl s|r - 글로벌 기록 시작\n|cff00ff00/rt fl e|r - 글로벌 기록 종료\n*기본적으로, 애드온은 우두머리 전투만 기록합니다 (공격대 중일 때) 아니면 전투 이벤트를 기록합니다 (공격대가 아닐 때). 글로벌 기록은 전투의 시작과 종료에 상관없이 모든 이벤트의 기록을 의미합니다"
L.BossWatcherTabSettings = "설정"
PH.BossWatcherSpellsFilterTooltip = "필터링할 주문의 ID 또는 이름을 입력하세요. 여러개일 때, \";\"로 구분 할 수 있습니다"
L.BossWatcherShowDamageToTarget = "대상에게 준 피해 표시"
PH.BossWatcherSeveral = "Several"
L.BossWatcherSpellsCount = "횟수"
PH.BossWatcherDisableDeath = "죽음 로그 비활성"
L.BossWatcherSelect = "선택"
L.BossWatcherDeathDeath = "죽음"
L.BossWatcherDeathOverKill = "O"
L.BossWatcherDeathOverHeal = "O"
L.BossWatcherDeathBlocked = "B"
L.BossWatcherDeathAbsorbed = "A"
L.BossWatcherDeathMultistrike = "연타"
L.BossWatcherDeathDamage = "피해"
L.BossWatcherDeathHeal = "치유"
L.BossWatcherDeathAuraAdd = "+오라"
L.BossWatcherDeathAuraRemove = "-오라"
L.BossWatcherDeathBuffsShow = "강화 효과 표시"
L.BossWatcherDeathDebuffsShow = "약화 효과 표시"
L.BossWatcherDeathOn = "->"
L.BossWatcherDeath = "죽음"
PH.BossWatcherTabInterruptAndDispelShort = "차단,해제"
PH.BossWatcherDeathBlacklist = "공격대 강화 효과/약화 효과 숨기기"
L.BossWatcherSchool = "속성"
L.BossWatcherHidePrismatic = "\"굴절의 수정\" 숨기기"
L.BossWatcherHidePrismaticTooltip = "마법사의 레벨 100 특성"
L.BossWatcherDisablePrismatic = "\"굴절의 수정\"에 준 피해 숨기기"
PH.BossWatcherDisablePrismaticTooltip = "기본적으로 \"굴절의 수정\"에 준 피해는 초과피해로 집계됩니다. 이 옵션을 켜면 피해가 완전히 제거됩니다.\n*우두머리 코라그에서 유용합니다"
PH.BossWatcherDamageDamageSpellToFriendly = "아군에게 준 주문 피해"
PH.BossWatcherDamageDamageSpellToHostile = "적에게 준 주문 피해"
PH.BossWatcherAurasMoreInfoText = "세부 정보"
L.BossWatcherReportDPS = "초당 피해"
L.BossWatcherReportCount = "횟수"
L.BossWatcherReportHPS = "초당 치유"
L.BossWatcherBuffsAndDebuffsFilterPets = "소환수와 수호자"
L.BossWatcherBuffsAndDebuffsFilterPetsFilterText = "소환수와 수호자 제외"
L.BossWatcherBuffsAndDebuffsFilterNothing = "없음"
L.BossWatcherSaveVariables = "reload / 캐릭터 변경 / 접속 종료 후에 모든 데이터 저장"
PH.BossWatcherSaveVariablesWarring = "|cffff0000주의하세요!|r 많은 데이터때문에, 이 설정은 Exorsus Raid Tools의 모든 옵션들을 초기화 할 수 있습니다."
L.BossWatcherSelectPower = "자원: "
L.BossWatcherGraphZoom = "확대"
L.BossWatcherGraphZoomOnlyGraph = "그래프만"
L.BossWatcherGraphZoomGlobal = "전체 로그"
L.BossWatcherGraphZoomReset = "확대 초기화"
L.BossWatcherOptionImproved = "|cff66ff66향상된 전투 분석"
L.BossWatcherOptionImprovedTooltip = "매 초마다 자동으로 새로운 세분화를 시작하며, 분석을 위해 전투 종료 후 언제든지 타임라인 프레임에서 선택할 수 있습니다.\n많은 메모리를 사용합니다."
L.BossWatcherGraphicsTotalHPS = "전체 HPS"
L.BossWatcherDamageTooltipTargets = "피해를 준 대상:"
L.BossWatcherDamageTooltipSources = "피해 받음:"
L.BossWatcherHealTooltipTargets = "치유한 대상:"
L.BossWatcherHealTooltipSources = "치유 받음:"
L.BossWatcherDamageTooltipCastsCount = "시전 횟수"
L.BossWatcherDisableSavePositions = "플레이어 위치 저장하지 않기"
L.BossWatcherPositions = "위치"
L.BossWatcherPositionsSlider = "시간"
L.BossWatcherPositionsHideMap = "지도 숨기기"
L.BossWatcherHealReduction = "감소"
L.BossWatcherHealReductionSpells = "주문에 의한 감소"
L.BossWatcherHealReductionPlusHealing = "감소 + 치유"
L.BossWatcherHealReductionPlusHealingSpells = "주문에 의한 감소 + 치유"
PH.BossWatcherReductionDisable = "감소 미터기 끄기"
PH.BossWatcherGraphicsHoldShift = "SHIFT 키를 눌러 새로운 그래프를 추가합니다"
PH.BossWatcherGraphicsHoldCtrl = "CTRL 키를 눌러 전체 치유량을 봅니다, 초과치유 포함"
L.BossWatcherGraphicsTargets = "대상"
L.BossWatcherDropdownsHoldShiftSource = "SHIFT 키를 눌러 같은 이름의 모든 출처를 선택합니다"
L.BossWatcherDropdownsHoldShiftDest = "SHIFT 키를 눌러 같은 이름의 모든 대상을 선택합니다"
PH.BossWatcherHealReductionChkTooltip = "막음/피함/빗나감으로 감소된 피해를 표시합니다\n경고! 이 데이터는 (막음/피함/빗나감) 100% 정확하지 않습니다, 같은 유형의 피해에 기초하여 계산됩니다."
PH.BossWatcherFromSpells = "주문으로부터"
PH.BossWatcherHealingTabTyrantVelhari = "폭군 벨하리\n계산법이 바뀝니다. 전투 중 \"해악의 손길\" 디버프가 있는 사람을 제외한 모든 흡수된 치유는 초과치유로 산출됩니다."
PH.BossWatcherBrokeTooltip = "몇몇 버프가 사라짐, 예. 지배"
L.BossWatcherAddToGraph = "그래프에 추가"
L.BossWatcherPhase = "단계"
L.BossWatcherDistanceEarned = "거리 획득"
L.BossWatcherBuff = "강화 효과"
L.BossWatcherDebuff = "약화 효과"
L.BossWatcherDoT = "DoT"
L.BossWatcherHoT = "HoT"
L.BossWatcherAllPhases = "모든 단계"
L.BossWatcherPerCast = "시전 별"

L.InspectViewerTalents = "특성과 문양"
L.InspectViewerInfo = "기타 정보"
L.InspectViewerItems = "장비"
L.InspectViewerNoData = "데이터 없음"
PH.InspectViewerEnabledTooltip = "\""..L.cd2.."\"\1241이;가; 켜져 있으면, 비활성 할 수 없습니다"
L.InspectViewerRadiness = "Radiness"
L.InspectViewerRaidIlvl = "공격대 아이템 레벨"
PH.InspectViewerRaidIlvlData = "플레이어: %d"
L.InspectViewerHaste = "가속"
L.InspectViewerMastery = "특화"
L.InspectViewerCrit = "치명타"
L.InspectViewerSpirit = "정신력"
L.InspectViewerInt = "지능"
L.InspectViewerStr = "힘"
L.InspectViewerAgi = "민첩성"
L.InspectViewerSpd = "주문력"
L.InspectViewerMS = "연속타격"
L.InspectViewerVer = "유연성"
L.InspectViewerLeech = "생기흡수"
L.InspectViewerBonusArmor = "추가 방어도"
L.InspectViewerAvoidance = "광역회피"
L.InspectViewerSpeed = "이동 속도"
L.InspectViewerFilter = "필터"
L.InspectViewerType = "방어구 유형"
L.InspectViewerClass = "직업"
L.InspectViewerTypeCloth = "천"
L.InspectViewerTypeLeather = "가죽"
L.InspectViewerTypeMail = "사슬"
L.InspectViewerTypePlate = "판금"
L.InspectViewerClear = "초기화"
L.InspectViewerFilterShort = "F:"
PH.InspectViewerColorizeNoEnch = "마법부여 되지 않은 아이템 표시"
PH.InspectViewerColorizeLowIlvl = "낮은 아이템 레벨 (%d-) 아이템 표시"
PH.InspectViewerColorizeNoGems = "보석 없는 아이템 표시"
L.InspectViewerMoreInfo = "추가 정보"
L.InspectViewerMoreInfoRaidSetup = "공격대 구성"
L.InspectViewerMoreInfoRole = "역할"
L.InspectViewerMoreInfoRoleTank = "탱커"
L.InspectViewerMoreInfoRoleMDD = "근접"
L.InspectViewerMoreInfoRoleRDD = "원거리"
L.InspectViewerMoreInfoRoleHealer = "힐러"
PH.InspectViewerColorizeNoTopEnch = "보석 & 마법부여가 최상급이 아닌 아이템 표시하기"
L.InspectViewerForce = "강제"
PH.InspectViewerHideInRaid = "공격대에 없는 플레이어 숨기기"
L.InspectViewerColorizeNoValorUpgrade = "용맹 점수 강화를 하지 않은 아이템 표시하기"
PH.InspectViewerNoExRTAddon = "ExRT 미설치 플레이어"

L.CoinsSpoilsOfPandariaWinTrigger = "시스템 초기화 중. 끄지 마세요, 모든 내용이 지워질 수 있습니다."
PH.CoinsEmpty = "아직 비어있음"
PH.CoinsHelp = "공격대의 추가 전리품 기록"
L.CoinsClear = "모든 데이터 초기화"
L.CoinsClearPopUp = "모든 데이터가 지워집니다. 계속할까요?"
PH.CoinsShowMessage = "누군가 추가 획득 인장을 사용하면 개인 메시지 표시"
PH.CoinsMessage = "%s 인장 사용"

L.ChatwindowName = "보고 - Exorsus Raid Tools"
L.ChatwindowChatSelf = "혼자보기"
L.ChatwindowChatSay = "일반"
L.ChatwindowChatParty = "파티"
L.ChatwindowChatInstance = "인스턴스"
L.ChatwindowChatRaid = "공격대"
L.ChatwindowChatWhisper = "귓속말"
L.ChatwindowChatWhisperTarget = "귓속말 대상"
L.ChatwindowChatGuild = "길드"
L.ChatwindowChatOfficer = "관리자"
L.ChatwindowChannel = "채널"
L.ChatwindowNameEB = "이름 (귓속말)"
L.ChatwindowSend = "전송"
PH.ChatwindowHelp = ""

PH.ArrowTextLeft = "/rt arrow X Y\n/rt range NAME\n/rt arrowbuff BUFF\n\n/rt arrowplayer NAME\n/rt arrowmark N\n\n/rt arrowthis\n/rt arrowhide\n\n|cFFFFFFFF* 파티원이나 공격대원인 플레이어만 추적하는 화살표입니다|r"
PH.ArrowTextRight = "- 좌표 X Y로 화살표 (0부터 100까지)\n- 자신과 NAME 플레이어 간의 거리 표시\n- 오라 BUFF를 가진 플레이어에게 화살표\n*(버프 이름 또는 주문 ID 입력)\n- NAME의 이름을 가진 플레이어에게 화살표\n- N의 징표가 지정된 플레이어에게 화살표 - N의 징표 숫자\n(1 - {1}, 2 - {2}, 3 - {3}, 4 - {4}, 5 - {5} ,6 - {6}, 7 - {7}, 8 - {8})\n- 플레이어의 현재 위치로 화살표\n- 화살표 숨기기"
L.ArrowSetPoint = "위치 설정"
L.ArrowResetPos = "위치 초기화"
L.ArrowFixate = "고정 (이동 불가)"
L.ArrowScale = "크기"
L.ArrowAlpha = "투명도"
PH.ArrowTextBottom = "추가 기능:\nGExRT.F.ArrowTextPlayer(\"name\",size) |cffffffff- \"size\" 크기로 (기본 16) 플레이어에게 \"name\" 이름과 함께 화살표 표시|r\nGExRT.F.ArrowTextCoord(X,Y,size) |cffffffff- \"size\" 크기로 (기본 16) X,Y 좌표 방향으로 화살표 표시|r|n|n예제:|n"
L.ArrowFind = "화살표 찾기"

L.MarksDisable = "비활성"
L.MarksClear = "초기화"
PH.MarksTooltip = "\"영구적인\" 징표 목록에 있는 플레이어에게 설정합니다\n파티 또는 공격대에 속해 있는 대상 플레이어에게만 사용 할 수 있습니다"

PH.LoggingEnable = "전투 기록을 활성화할 지역:"
PH.LoggingHelp1 = "기록은 게임 폴더의 'Logs\\WoWCombatLog.txt' 에 저장됩니다. 또한 특별한 분석 사이트에 업로드 할 수 있습니다 (예 www.warcraftlogs.com). 레이드 이후 파일의 업로드/삭제를 잊지마세요."
PH.LoggingStart = "ExRT: 기록 시작"
PH.LoggingEnd = "ExRT: 기록 종료"

PH.LootLinkEnable = "우두머리 전리품 대화창에 링크 활성"
PH.LootLinkSlashHelp = "추가 명령어:\n|cffffffff/rt loot|r - 현재 전리품 대화창에 링크"

PH.BattleResFix = "잠금"
L.BattleResAlpha = "투명도"
L.BattleResScale = "크기"
PH.BattleResHelp = "공격대 전투 중에 전투 부활 아이콘이 표시됩니다."
L.BattleResHideTime = "시간 숨기기"
PH.BattleResHideTimeTooltip = "omniCC 같은 애드온을 사용중이면 아이콘의 타이머를 숨기세요"
L.BattleResHideCD = "쿨다운 애니메이션 숨기기"

L.SkadaDamageToCurrentTarget = "현재 대상에게 준 피해"

L.LegendaryRingEnable = "|cffff7f00전설|r 반지를 사용한 플레이어의 이름과 함께 대화창에 매시지 전송"
L.LegendaryRingFrodo = "프로도"
L.LegendaryRingType = "반지 유형 표시 (힐 / 탱 / 딜)"

L.AttendanceFirstPerRaid = "공격대 진행 중 첫 전투 시작 때만 공격대원 목록 저장"
L.AttendanceFirstPerRaidKill = "공격대 진행 중 첫 우두머리 처치했을 때만 공격대원 목록 저장"
L.AttendanceEveryPull = "전투 시작 시 항상 공격대원 목록 저장"
L.AttendanceEveryKill = "우두머리 처치 시 항상 공격대원 목록 저장"
L.AttendanceSpecialConditions = "특수 조건"
L.AttendanceChatMessageSaved = "ExRT: 목록 저장됨"
L.AttendanceRemoveAll = "전부 선택해제"
L.AttendanceSelectAll = "전부 선택"
L.AttendanceSelectConditions = "조건 선택"
L.AttendanceSetAlts = "대타 지정"
L.AttendanceSelect = "선택"
L.AttendanceFilterBoss = "우두머리:"
L.AttendanceFilterDiff = "난이도:"
L.AttendanceFilterDateFrom = "이 날짜부터:"
L.AttendanceFilterDateTo = "이 날짜까지:"
L.AttendanceFilterPlayer = "공격대에 있는 플레이어:"
L.AttendanceFilterOnePerDay = "일별:"
L.AttendanceSelectConditionsTooltip = "\"|cffffffff;|r\"로 구분하여 여러 규칙을 입력할 수 있습니다.|n규칙 예제: \"|cffffffffArchimonde,d=16,kill|r\". 신화 아키몬드를 처치할 때마다 목록이 저장됩니다. 규칙 \"|cffffffffkill|r\"과 \"|cffffffffd={diff ID}|r\" (14 - 일반, 15 - 영웅, 16 - 신화)를 선택할 수 있습니다. 우두머리 전투 이름 대신 우두머리 전투 ID를 입력할 수 있습니다.|n다른 예제: \"|cffffffffMannoroth,kill,d=16;Archimonde,d=15,d=16;1798,kill;Tyrant Velhari|r\""
L.AttendanceAltTooltip = "각 줄에 대타의 이름과 원래 멤버의 이름을 입력하세요. 예제: \"|cff00ff00[대타 이름]=[원래 이름]|r\". 예제 \"|cff00ff00철수대타=철수|r\""
L.AttendanceHelpTop = "대화 명령어 \"|cff00ff00/rt roster|r\"를 입력하여 수동으로 목록을 저장할 수 있습니다"
L.AttendanceHelpNames = "2열과 3열은 각 공격대 그룹의 출석 횟수를 표시합니다, 4열과 5열은 첫번째 그룹의 출석 횟수를 표시합니다 (4는 신화, 6은 다른 난이도)"
L.AttendanceSaveCurrent = "현재 공격대원 목록 저장"

L.WhoPulledlastPull = "마지막 풀링"

L.WACheckerWANotFound = "WeakAuras 애드온을 찾을 수 없습니다"
L.WACheckerMissingAura = "오라 없음"
PH.WACheckerExistsAura = "오라 존재"
L.WACheckerPlayerHaveNotWA = "애드온 미설치 플레이어"
PH.WACheckerConfirmOverride = "같은 이름의 오라는 덮어 쓰입니다"

L.ProfilesIntro = "캐릭터마다 각각 다른 설정을 저장할 수 있는 프로필을 변경할 수 있습니다."
L.ProfilesDefault = "기본값"
L.ProfilesChooseDesc = "새로운 이름을 입력하거나, 이미 있는 프로필중 하나를 선택하여 새로운 프로필을 만들 수 있습니다."
L.ProfilesCurrent = "현재 프로필:"
L.ProfilesNew = "새로운 프로필"
L.ProfilesAdd = "추가"
L.ProfilesSelect = "프로필 선택"
L.ProfilesCopy = "복사"
L.ProfilesDelete = "프로필 삭제"
L.ProfilesDeleteAlert = "정말로 선택한 프로필을 삭제할까요?"
L.ProfilesActivateAlert = "생성된 프로필을 활성화할까요?"

L.Export = "내보내기"
PH.ExportInfo = "* Excel이나 Google Docs에 사용하기 위해"
L.S_Strata = "프레임 우선순위"

L.senable = "사용"

L.minimaptooltiplmp = "클릭 - 메인 창"
L.minimaptooltiprmp = "오른쪽 클릭 - 메뉴 열기"
L.minimaptooltipfree = "Shift+Alt+클릭 - 자유로운 이동"
L.minimapmenu = "ExRT 메뉴"
L.minimapmenuset = "설정"
L.minimapmenuclose = "닫기"

L.creatureNames = {	--> Used LibBabble-CreatureType and WowHead
	Abyssal = "심연불정령",
	Basilisk = "바실리스크",
	Bat = "박쥐",
	Bear = "곰",
	Beast = "야수",
	Beetle = "딱정벌레",
	["Bird of Prey"] = "맹금",
	Boar = "멧돼지",
	["Carrion Bird"] = "독수리",
	Cat = "살쾡이",
	Chimaera = "키메라",
	["Core Hound"] = "심장부 사냥개",
	Crab = "게",
	Crane = "학",
	Critter = "동물",
	Crocolisk = "악어",
	Demon = "악마",
	Devilsaur = "데빌사우루스",
	Direhorn = "공포뿔",
	Dog = "개",
	Doomguard = "파멸의 수호병",
	Dragonhawk = "용매",
	Dragonkin = "용족",
	Elemental = "정령",
	Felguard = "지옥수호병",
	Felhunter = "지옥사냥개",
	["Fel Imp"] = "지옥 임프",
	Fox = "여우",
	["Gas Cloud"] = "가스",
	Ghoul = "구울",
	Giant = "거인",
	Goat = "염소",
	Gorilla = "고릴라",
	Humanoid = "인간형",
	Hyena = "하이에나",
	Imp = "임프",
	Mechanical = "기계",
	Monkey = "원숭이",
	Moth = "나방",
	["Nether Ray"] = "황천의 가오리",
	["Non-combat Pet"] = "애완동물",
	["Not specified"] = "기타",
	Observer = "감시자",
	Porcupine = "호저",
	Quilen = "기렌",
	Raptor = "랩터",
	Ravager = "칼날발톱",
	["Remote Control"] = "무선조종 장난감",
	Rhino = "코뿔소",
	Scorpid = "전갈",
	Serpent = "뱀",
	["Shale Spider"] = "혈암 거미",
	Shivarra = "쉬바라",
	Silithid = "실리시드",
	Spider = "거미",
	["Spirit Beast"] = "야수 정령",
	Sporebat = "포자날개",
	Succubus = "서큐버스",
	Tallstrider = "타조",
	Terrorguard = "공포수호병",
	Totem = "토템",
	Turtle = "거북",
	Undead = "언데드",
	Voidlord = "공허군주",
	Voidwalker = "공허방랑자",
	["Warp Stalker"] = "차원의 추적자",
	Wasp = "말벌",
	["Water Elemental"] = "물 정령",
	["Water Strider"] = "소금쟁이",
	["Wind Serpent"] = "천둥매",
	Wolf = "늑대",
	Worm = "벌레",
	Wrathguard = "격노수호병",
	[1] = "강인함",
	[2] = "교활함",
	[3] = "흉포함",
}

L.TranslateBy = "적셔줄게 - 데스윙"