local mod	= DBM:NewMod("Netherspite", "DBM-Karazhan")
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 631 $"):sub(12, -3))
mod:SetCreatureID(15689)
mod:SetModelID(15363)
mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_START",
	"SPELL_CAST_SUCCESS",
	"RAID_BOSS_EMOTE"
)

local warningPortal			= mod:NewAnnounce("warningPortal", 1, "Interface\\Icons\\Spell_Arcane_PortalIronForge")
local warningBanish			= mod:NewAnnounce("warningBanish", 1, "Interface\\Icons\\Spell_Shadow_Cripple")
local warningBreathCast		= mod:NewCastAnnounce(38523, 2)
local warningVoid			= mod:NewSpellAnnounce(37063, 4)

local specWarnVoid			= mod:NewSpecialWarningMove(30533, nil, nil, nil, 1, 2)

local timerPortalPhase		= mod:NewTimer(61.5, "timerPortalPhase", "Interface\\Icons\\Spell_Arcane_PortalIronForge", nil, nil, 6)
local timerBanishPhase		= mod:NewTimer(40, "timerBanishPhase", "Interface\\Icons\\Spell_Shadow_Cripple", nil, nil, 6)
local timerBreathCast		= mod:NewCastTimer(2.5, 38523, nil, nil, nil, 3)

local berserkTimer			= mod:NewBerserkTimer(540)

local voiceVoid				= mod:NewVoice(30533)--runaway

function mod:OnCombatStart(delay)
	berserkTimer:Start(-delay)
	timerPortalPhase:Start(63.5-delay)
	if not self:IsTrivial(85) then
		self:RegisterShortTermEvents(
			"SPELL_PERIODIC_DAMAGE",
			"SPELL_PERIODIC_MISSED"
		)
	end
end

function mod:OnCombatEnd()
	self:UnregisterShortTermEvents()
end

function mod:SPELL_CAST_START(args)
	if args.spellId == 38523 then
		warningBreathCast:Show()
		timerBreathCast:Start()
	end
end

function mod:SPELL_CAST_SUCCESS(args)
	if args:IsSpellID(37014, 37063) then
		warningVoid:Show()
	end
end

function mod:SPELL_PERIODIC_DAMAGE(_, _, _, _, destGUID, _, _, _, spellId)
	if spellId == 30533 and destGUID == UnitGUID("player") and self:AntiSpam() then
		specWarnVoid:Show()
		voiceVoid:Play("runaway")
	end
end
mod.SPELL_PERIODIC_MISSED = mod.SPELL_PERIODIC_DAMAGE

function mod:RAID_BOSS_EMOTE(msg)
	if msg == L.DBM_NS_EMOTE_PHASE_2 then
		timerPortalPhase:Cancel()
		warningBanish:Show()
		timerBanishPhase:Start()
	elseif msg == L.DBM_NS_EMOTE_PHASE_1 then
		timerBanishPhase:Cancel()
		warningPortal:Show()
		timerPortalPhase:Start()
	end
end
