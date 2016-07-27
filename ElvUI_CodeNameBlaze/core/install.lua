--[[--------------------------------------------------------------------
--	CodeNameBlaze, an ElvUI edit by Blazeflack @ tukui.org
--
--	This file contains the installation script.
--	It is a modified version of the installation script found in ElvUI.
--	Only necessary installation choices are kept:
--		- Cvars
--		- Chat
--		- Layout: Tank/Healer/Caster DPS/Physical DPS
--
--	Everything else will need to be configured manually if the user
--	is not satisfied with the default settings set in this edit.
--------------------------------------------------------------------]]--
local E, L, V, P, G, _ = unpack(ElvUI); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local CNB = E:GetModule('CodeNameBlaze')

--Cache global variables
--Lua functions
local _G = _G
local unpack = unpack
local format = string.format
--WoW API / Variables
local CreateFrame = CreateFrame
local SetCVar = SetCVar
local GetCVarBool = GetCVarBool
local StopMusic = StopMusic
local PlayMusic = PlayMusic
local PlaySoundFile = PlaySoundFile
local ReloadUI = ReloadUI
local IsAddOnLoaded = IsAddOnLoaded
local FCF_ResetChatWindows = FCF_ResetChatWindows
local FCF_SetLocked = FCF_SetLocked
local FCF_DockFrame = FCF_DockFrame
local FCF_OpenNewWindow = FCF_OpenNewWindow
local FCF_GetChatWindowInfo = FCF_GetChatWindowInfo
local FCF_SavePositionAndDimensions = FCF_SavePositionAndDimensions
local FCF_StopDragging = FCF_StopDragging
local FCF_SetChatWindowFontSize = FCF_SetChatWindowFontSize
local FCF_SetWindowName = FCF_SetWindowName
local ChatFrame_RemoveMessageGroup = ChatFrame_RemoveMessageGroup
local ChatFrame_RemoveAllMessageGroups = ChatFrame_RemoveAllMessageGroups
local ChatFrame_AddMessageGroup = ChatFrame_AddMessageGroup
local ToggleChatColorNamesByClassGroup = ToggleChatColorNamesByClassGroup
local LOOT = LOOT
local CONTINUE = CONTINUE
local PREVIOUS = PREVIOUS
local GUILD_EVENT_LOG = GUILD_EVENT_LOG
local NUM_CHAT_WINDOWS = NUM_CHAT_WINDOWS
local RAID_CLASS_COLORS = RAID_CLASS_COLORS

--Global variables that we don't cache, list them here for mikk's FindGlobals script
-- GLOBALS: CodeNameBlazeInstallStepComplete, CodeNameBlazeInstallNextButton
-- GLOBALS: ChatFrame1, ChatFrame2, ChatFrame3, ChatFrame4, ChatFrame5, ChatFrame6,
-- GLOBALS: LeftChatToggleButton, RightChatToggleButton, CodeNameBlazeInstallPrevButton
-- GLOBALS: ElvUF_PlayerMover, ElvUF_PetMover, ElvUF_TargetMover, ElvUF_TargetTargetMover
-- GLOBALS: ElvUF_FocusMover, Minimap, ElvUIPlayerDebuffs, ElvUI_Bar1, LeftChatPanel
-- GLOBALS: BossButton, AltPowerBarMover, BossHeaderMover, ClassBarMover, UIFrameFadeOut
-- GLOBALS: DBM, DBM_AllSavedOptions, DBT_AllPersistentOptions, SkadaDB, MSBTProfiles_SavedVars
-- GLOBALS: MikSBT, CodeNameBlazeInstallFrame, CodeNameBlazeInstallStatus
-- GLOBALS: CodeNameBlazeInstallOption1Button, CodeNameBlazeInstallOption2Button
-- GLOBALS: CodeNameBlazeInstallOption3Button, CodeNameBlazeInstallOption4Button

local CURRENT_PAGE = 0
local MAX_PAGE = 8

local function SetupChat()
	CodeNameBlazeInstallStepComplete.message = L["Chat Set"]
	CodeNameBlazeInstallStepComplete:Show()
	FCF_ResetChatWindows()
	FCF_SetLocked(ChatFrame1, 1)
	FCF_DockFrame(ChatFrame2)
	FCF_SetLocked(ChatFrame2, 1)
	FCF_OpenNewWindow("G")
	FCF_DockFrame(ChatFrame3)
	FCF_SetLocked(ChatFrame3, 1)
	FCF_OpenNewWindow("P")
	FCF_DockFrame(ChatFrame4)
	FCF_SetLocked(ChatFrame4, 1)
	FCF_OpenNewWindow("W")
	FCF_DockFrame(ChatFrame5)
	FCF_SetLocked(ChatFrame5, 1)
	FCF_OpenNewWindow(LOOT)
	FCF_DockFrame(ChatFrame6)
	FCF_SetLocked(ChatFrame6, 1)

	for i = 1, NUM_CHAT_WINDOWS do
		local frame = _G[format("ChatFrame%s", i)]
		local chatFrameId = frame:GetID()
		local chatName = FCF_GetChatWindowInfo(chatFrameId)

		-- move general bottom left
		if i == 1 then
			frame:ClearAllPoints()
			frame:Point("BOTTOMLEFT", LeftChatToggleButton, "TOPLEFT", 1, 3)
		end

		FCF_SavePositionAndDimensions(frame)
		FCF_StopDragging(frame)

		-- set default Elvui font size
		FCF_SetChatWindowFontSize(nil, frame, 13)

		-- rename chat windows
		if i == 1 then
			FCF_SetWindowName(frame, "All")
		elseif i == 2 then
			FCF_SetWindowName(frame, GUILD_EVENT_LOG)
		end
	end

	-- Set up the "All" chat frame to filter out stuff shown in the Loot chat frame
	ChatFrame_RemoveMessageGroup(ChatFrame1, "COMBAT_XP_GAIN")
	ChatFrame_RemoveMessageGroup(ChatFrame1, "COMBAT_HONOR_GAIN")
	ChatFrame_RemoveMessageGroup(ChatFrame1, "COMBAT_FACTION_CHANGE")
	ChatFrame_RemoveMessageGroup(ChatFrame1, "LOOT")
	ChatFrame_RemoveMessageGroup(ChatFrame1, "MONEY")

	-- Set up the G chat frame
	ChatFrame_RemoveAllMessageGroups(ChatFrame3)
	ChatFrame_AddMessageGroup(ChatFrame3, "GUILD")
	ChatFrame_AddMessageGroup(ChatFrame3, "OFFICER")
	ChatFrame_AddMessageGroup(ChatFrame3, "GUILD_ACHIEVEMENT")

	-- Set up the P chat frame
	ChatFrame_RemoveAllMessageGroups(ChatFrame4)
	ChatFrame_AddMessageGroup(ChatFrame4, "PARTY")
	ChatFrame_AddMessageGroup(ChatFrame4, "PARTY_LEADER")
	ChatFrame_AddMessageGroup(ChatFrame4, "RAID")
	ChatFrame_AddMessageGroup(ChatFrame4, "RAID_LEADER")
	ChatFrame_AddMessageGroup(ChatFrame4, "RAID_WARNING")
	ChatFrame_AddMessageGroup(ChatFrame4, "BATTLEGROUND")
	ChatFrame_AddMessageGroup(ChatFrame4, "BATTLEGROUND_LEADER")
	ChatFrame_AddMessageGroup(ChatFrame4, "INSTANCE_CHAT")
	ChatFrame_AddMessageGroup(ChatFrame4, "INSTANCE_CHAT_LEADER")

	-- Set up the W chat frame
	ChatFrame_RemoveAllMessageGroups(ChatFrame5)
	ChatFrame_AddMessageGroup(ChatFrame5, "WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame5, "BN_WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame5, "BN_CONVERSATION")

	-- Set up the Loot chat frame
	ChatFrame_RemoveAllMessageGroups(ChatFrame6)
	ChatFrame_AddMessageGroup(ChatFrame6, "COMBAT_XP_GAIN")
	ChatFrame_AddMessageGroup(ChatFrame6, "COMBAT_HONOR_GAIN")
	ChatFrame_AddMessageGroup(ChatFrame6, "COMBAT_FACTION_CHANGE")
	ChatFrame_AddMessageGroup(ChatFrame6, "LOOT")
	ChatFrame_AddMessageGroup(ChatFrame6, "MONEY")

	-- Enable classcolor automatically on login and on each character without doing /configure each time.
	ToggleChatColorNamesByClassGroup(true, "SAY")
	ToggleChatColorNamesByClassGroup(true, "EMOTE")
	ToggleChatColorNamesByClassGroup(true, "YELL")
	ToggleChatColorNamesByClassGroup(true, "GUILD")
	ToggleChatColorNamesByClassGroup(true, "OFFICER")
	ToggleChatColorNamesByClassGroup(true, "GUILD_ACHIEVEMENT")
	ToggleChatColorNamesByClassGroup(true, "ACHIEVEMENT")
	ToggleChatColorNamesByClassGroup(true, "WHISPER")
	ToggleChatColorNamesByClassGroup(true, "PARTY")
	ToggleChatColorNamesByClassGroup(true, "PARTY_LEADER")
	ToggleChatColorNamesByClassGroup(true, "RAID")
	ToggleChatColorNamesByClassGroup(true, "RAID_LEADER")
	ToggleChatColorNamesByClassGroup(true, "RAID_WARNING")
	ToggleChatColorNamesByClassGroup(true, "BATTLEGROUND")
	ToggleChatColorNamesByClassGroup(true, "BATTLEGROUND_LEADER")
	ToggleChatColorNamesByClassGroup(true, "INSTANCE_CHAT")
	ToggleChatColorNamesByClassGroup(true, "INSTANCE_CHAT_LEADER")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL1")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL2")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL3")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL4")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL5")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL6")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL7")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL8")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL9")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL10")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL11")

	if E.Chat then
		E.Chat:PositionChat(true)
		if E.db['RightChatPanelFaded'] then
			RightChatToggleButton:Click()
		end

		if E.db['LeftChatPanelFaded'] then
			LeftChatToggleButton:Click()
		end
	end
end

local function SetupCVars()
	SetCVar("ActionButtonUseKeyDown", 0)
	SetCVar("autoDismountFlying", 1)
	SetCVar("autoLootDefault", 1)
	SetCVar("autoQuestProgress", 1)
	SetCVar("autoQuestWatch", 1)
	SetCVar("autoSelfCast", 1)
	SetCVar("buffDurations", 1)
	SetCVar("cameraDistanceMaxFactor", 4)
	SetCVar("colorblindMode", 0)
	SetCVar("deselectOnClick", 1)
	SetCVar("guildMemberNotify", 0)
	SetCVar("interactOnLeftClick", 0)
	SetCVar("lootUnderMouse", 1)
	SetCVar("nameplateShowEnemies", 1)
	SetCVar("nameplateShowEnemyPets", 1)
	SetCVar("nameplateShowFriendlyGuardians", 0)
	SetCVar("nameplateShowFriendlyPets", 0)
	SetCVar("nameplateShowFriendlyTotems", 0)
	SetCVar("nameplateShowFriends", 0)
	SetCVar("removeChatDelay", 1)
	SetCVar("scriptErrors", 1)
	SetCVar("showTimestamps", "%H:%M:%S ")
	SetCVar("showVKeyCastbar", 1)
	SetCVar("UnitNameFriendlyGuardianName", 1)
	SetCVar("UnitNameGuildTitle", 0)
	SetCVar("UnitNameOwn", 1)

	CodeNameBlazeInstallStepComplete.message = L["CVars Set"]
	CodeNameBlazeInstallStepComplete:Show()
end

local function classBarMover()
	CNB:SetMoverPosition('ClassBarMover', 'BOTTOM', E.UIParent, 'BOTTOM', 0, 266)
end

function CNB:SetupLayout(layout, noDataReset)
	local classColor = E.myclass == 'PRIEST' and E.PriestColors or RAID_CLASS_COLORS[E.myclass]

	--Set up various settings shared across all layouts
	if not noDataReset then
		--[[----------------------------------
		--	PrivateDB - General
		--]]----------------------------------
		E.private.general.lootRoll = false
		E.private.general.namefont = "Friz Quadrata TT"
		E.private.general.chatBubbleFont = "Friz Quadrata TT"
		E.private.general.chatBubbleFontSize = 12
		E.private.general.minimap.hideGarrison = false

		--[[----------------------------------
		--	ProfileDB - General
		--]]----------------------------------
		--Misc
		E.db.general.loginmessage = false
		E.db.general.autoRepair = 'GUILD'
		E.db.general.vendorGrays = true
		E.db.general.bottomPanel = false
		E.db.general.afk = false
		E.db.general.threat.enable = false
		E.db.general.totems.growthDirection = 'HORIZONTAL'

		--Fonts
		E.db.general.fontSize = 11
		E.db.general.font = 'Friz Quadrata TT'

		--Colors
		E.db.general.bordercolor = {r = .20, g = .20, b = .20}
		E.db.general.backdropcolor = {r = 40/255, g = 40/255, b = 40/255}
		E.db.general.backdropfadecolor = {r = 26/255, g = 26/255, b = 26/255, a = 0.8}
		E.db.general.valuecolor = E:GetColor(classColor.r, classColor.b, classColor.g)
		
		--[[----------------------------------
		--	ProfileDB - DataBars
		--]]----------------------------------
		E.db.databars.experience.width = 213
		E.db.databars.experience.height = 15
		E.db.databars.experience.textFormat ='CURMAX'
		E.db.databars.experience.textSize = 10
		E.db.databars.experience.orientation = 'HORIZONTAL'
		E.db.databars.reputation.width = 213
		E.db.databars.reputation.height = 15
		E.db.databars.reputation.textFormat ='CURMAX'
		E.db.databars.reputation.textSize = 10
		E.db.databars.reputation.orientation = 'HORIZONTAL'
		E.db.databars.artifact.width = 213
		E.db.databars.artifact.height = 15
		E.db.databars.artifact.textFormat ='CURMAX'
		E.db.databars.artifact.textSize = 10
		E.db.databars.artifact.orientation = 'HORIZONTAL'
		E.db.databars.honor.width = 213
		E.db.databars.honor.height = 15
		E.db.databars.honor.textFormat ='CURMAX'
		E.db.databars.honor.textSize = 10
		E.db.databars.honor.orientation = 'HORIZONTAL'

		--[[----------------------------------
		--	ProfileDB - Bags
		--]]----------------------------------
		E.db.bags.xOffset = 3
		E.db.bags.yOffset = 172
		E.db.bags.xOffsetBank = -3
		E.db.bags.yOffsetBank = 172
		E.db.bags.bagSize = 32
		E.db.bags.bankSize = 32
		E.db.bags.alignToChat = false
		E.db.bags.bagWidth = 385
		E.db.bags.bankWidth = 385
		E.db.bags.currencyFormat = "ICON"
		E.db.bags.itemLevelFont = "PF T 7 Bold"
		E.db.bags.itemLevelFontSize = 8
		E.db.bags.itemLevelFontOutline = "MONOCHROMEOUTLINE"
		E.db.bags.countFont = "PF T 7 Bold"
		E.db.bags.countFontSize = 8
		E.db.bags.countFontOutline = "MONOCHROMEOUTLINE"

		--[[----------------------------------
		--	ProfileDB - NamePlate
		--]]----------------------------------
		E.db.nameplates.font = 'PF T 7 Ext. Bold'
		E.db.nameplates.fontSize = 6
		E.db.nameplates.nonTargetTransparency = 0.4

		--[[----------------------------------
		--	ProfileDB - Auras
		--]]----------------------------------
		E.db.auras.font = 'PF T 7 Ext. Bold'
		E.db.auras.fontSize = 8
		E.db.auras.fadeThreshold = -1
		E.db.auras.countYOffset = 5
		E.db.auras.timeYOffset = -8
		E.db.auras.buffs.verticalSpacing = 20
		E.db.auras.buffs.sortDir = '+'
		E.db.auras.buffs.seperateOwn = 0
		E.db.auras.buffs.size = 30
		E.db.auras.debuffs.seperateOwn = 0
		E.db.auras.debuffs.size = 30

		--[[----------------------------------
		--	ProfileDB - Chat
		--]]----------------------------------
		E.db.chat.editboxhistory = 15
		E.db.chat.hyperlinkHover = false
		E.db.chat.throttleInterval = 60
		E.db.chat.scrollDownInterval = 0
		E.db.chat.fade = false
		E.db.chat.font = 'Arial Narrow'
		E.db.chat.emotionIcons = false
		E.db.chat.keywordSound = 'Whisper Alert'
		E.db.chat.chatHistory = false
		E.db.chat.lfgIcons = false
		E.db.chat.timeStampFormat = '%H:%M:%S '
		E.db.chat.panelWidth = 385
		E.db.chat.panelHeight = 200
		E.db.chat.panelTabTransparency = true
		E.db.chat.editBoxPosition = 'ABOVE_CHAT'
		E.db.chat.tabFont = 'PF T 7 Bold'
		E.db.chat.tabFontSize = 8
		E.db.chat.tabFontOutline = 'MONOCHROMEOUTLINE'

		--[[----------------------------------
		--	ProfileDB - Datatexts
		--]]----------------------------------
		E.db.datatexts.font = 'PF T 7 Bold'
		E.db.datatexts.fontSize = 8
		E.db.datatexts.fontOutline = 'MONOCHROMEOUTLINE'
		E.db.datatexts.time24 = true
		E.db.datatexts.battleground = false
		E.db.datatexts.panelTransparency = true

		E.db.datatexts.panels.LeftMiniPanel = 'Time'
		E.db.datatexts.panels.RightMiniPanel = 'System'
		E.db.datatexts.panels.LeftChatDataPanel.left = 'Haste'
		E.db.datatexts.panels.LeftChatDataPanel.middle = 'Crit Chance'
		E.db.datatexts.panels.LeftChatDataPanel.right = 'Mastery'
		if IsAddOnLoaded('Skada') then
			E.db.datatexts.panels.RightChatDataPanel.left = 'Skada'
		else
			if layout == 'healer' then
				E.db.datatexts.panels.RightChatDataPanel.left = 'HPS'
			else
				E.db.datatexts.panels.RightChatDataPanel.left = 'DPS'
			end
		end
		E.db.datatexts.panels.RightChatDataPanel.middle = 'Durability'
		if IsAddOnLoaded('Scrooge') then
			E.db.datatexts.panels.RightChatDataPanel.right = 'Scrooge'
		else
			E.db.datatexts.panels.RightChatDataPanel.right = 'Gold'
		end
		E.db.CNB.datatexts.panels.ChatTab_Datatext_Panel.left = 'Talent/Loot Specialization'
		if IsAddOnLoaded('BagSync') then
			E.db.CNB.datatexts.panels.ChatTab_Datatext_Panel.middle = 'BagSyncLDB'
		else
			E.db.CNB.datatexts.panels.ChatTab_Datatext_Panel.middle = 'Call to Arms'
		end
		E.db.CNB.datatexts.panels.ChatTab_Datatext_Panel.right = 'Bags'

		E.db.CNB.datatexts.panels.Bottom_Datatext_Panel.left = 'Friends'
		E.db.CNB.datatexts.panels.Bottom_Datatext_Panel.middle = 'Spell/Heal Power'
		E.db.CNB.datatexts.panels.Bottom_Datatext_Panel.right = 'Guild'

		--[[----------------------------------
		--	ProfileDB - Tooltip
		--]]----------------------------------
		E.db.tooltip.font = "Friz Quadrata TT"
		E.db.tooltip.fontOutline = "NONE"
		E.db.tooltip.headerFontSize = 11
		E.db.tooltip.textFontSize = 11
		E.db.tooltip.smallTextFontSize = 11
		E.db.tooltip.healthBar.font = 'PF T 7 Ext. Bold'
		E.db.tooltip.healthBar.fontSize = 8

		--[[----------------------------------
		--	ProfileDB - Unitframes
		--]]----------------------------------
		--Misc
		E.db.unitframe.smoothbars = true
		E.db.unitframe.OORAlpha = 0.4
		E.db.unitframe.debuffHighlighting = "NONE"

		--Fonts
		E.db.unitframe.font = 'PF T 7 Bold'
		E.db.unitframe.fontSize = 8

		--Colors
		E.db.unitframe.colors.healthclass = false
		E.db.unitframe.colors.powerclass = true
		E.db.unitframe.colors.castClassColor = false
		E.db.unitframe.colors.colorhealthbyvalue = false
		E.db.unitframe.colors.customhealthbackdrop = true
		E.db.unitframe.colors.transparentHealth = true
		E.db.unitframe.colors.castColor = {r = 168/255, g = 168/255, b = 168/255}
		E.db.unitframe.colors.health = {r = 40/255, g = 40/255, b = 40/255}
		E.db.unitframe.colors.health_backdrop = {r = 0, g = 0, b = 0}
		E.db.unitframe.colors.disconnected = {r = 0, g = 0, b = 0}
		E.db.unitframe.colors.auraBarBuff = {r = 40/255, g = 40/255, b = 40/255}

		--Player
		E.db.unitframe.units.player.width = 260
		E.db.unitframe.units.player.height = 54
		E.db.unitframe.units.player.restIcon = false
		E.db.unitframe.units.player.health.text_format = '[healthcolor][health:current-percent]'
		E.db.unitframe.units.player.health.position = 'TOPRIGHT'
		E.db.unitframe.units.player.health.xOffset = 3
		E.db.unitframe.units.player.health.yOffset = -5
		E.db.unitframe.units.player.power.width = 'inset'
		E.db.unitframe.units.player.power.height = 5
		E.db.unitframe.units.player.power.position = 'BOTTOMRIGHT'
		E.db.unitframe.units.player.power.xOffset = 3
		E.db.unitframe.units.player.power.yOffset = 10
		E.db.unitframe.units.player.name.position = 'LEFT'
		E.db.unitframe.units.player.name.text_format = '[namecolor][name:long] [level] [restingcolored]'
		E.db.unitframe.units.player.name.xOffset = 2
		E.db.unitframe.units.player.buffs.enable = false
		E.db.unitframe.units.player.buffs.fontSize = 8
		E.db.unitframe.units.player.buffs.yOffset = 1
		E.db.unitframe.units.player.buffs.sizeOverride = 0
		E.db.unitframe.units.player.debuffs.enable = true
		E.db.unitframe.units.player.debuffs.attachTo = 'FRAME'
		E.db.unitframe.units.player.debuffs.fontSize = 8
		E.db.unitframe.units.player.debuffs.yOffset = 2
		E.db.unitframe.units.player.debuffs.sizeOverride = 0
		E.db.unitframe.units.player.castbar.width = 399
		E.db.unitframe.units.player.castbar.height = 20
		E.db.unitframe.units.player.castbar.icon = false
		E.db.unitframe.units.player.castbar.format = 'CURRENTMAX'
		E.db.unitframe.units.player.classbar.fill = 'spaced'
		E.db.unitframe.units.player.classbar.height = 6
		E.db.unitframe.units.player.classbar.detachFromFrame = true
		E.db.unitframe.units.player.classbar.detachedWidth = 399
		E.db.unitframe.units.player.aurabar.enable = false

		--Target
		E.db.unitframe.units.target.width = 260
		E.db.unitframe.units.target.height = 54
		E.db.unitframe.units.target.health.text_format = '[healthcolor][health:current-percent]'
		E.db.unitframe.units.target.health.position = 'TOPRIGHT'
		E.db.unitframe.units.target.health.xOffset = 3
		E.db.unitframe.units.target.health.yOffset = -5
		E.db.unitframe.units.target.power.text_format = '[powercolor][power:current-max]'
		E.db.unitframe.units.target.power.width = 'inset'
		E.db.unitframe.units.target.power.height = 5
		E.db.unitframe.units.target.power.position = 'BOTTOMRIGHT'
		E.db.unitframe.units.target.power.hideonnpc = false
		E.db.unitframe.units.target.power.xOffset = 3
		E.db.unitframe.units.target.power.yOffset = 10
		E.db.unitframe.units.target.name.position = 'LEFT'
		E.db.unitframe.units.target.name.text_format = '[namecolor][name:long] [difficultycolor][level] [shortclassification]'
		E.db.unitframe.units.target.name.xOffset = 2
		E.db.unitframe.units.target.smartAuraDisplay = 'DISABLED'
		E.db.unitframe.units.target.buffs.enable = true
		E.db.unitframe.units.target.buffs.fontSize = 8
		E.db.unitframe.units.target.buffs.playerOnly = {friendly = false, enemy = false}
		E.db.unitframe.units.target.buffs.useBlacklist = {friendly = false, enemy = false}
		E.db.unitframe.units.target.buffs.yOffset = 2
		E.db.unitframe.units.target.buffs.sizeOverride = 0
		E.db.unitframe.units.target.debuffs.enable = true
		E.db.unitframe.units.target.debuffs.fontSize = 8
		E.db.unitframe.units.target.debuffs.useBlacklist = {friendly = false, enemy = false}
		E.db.unitframe.units.target.debuffs.useWhitelist = {friendly = false, enemy = true}
		E.db.unitframe.units.target.debuffs.yOffset = 1
		E.db.unitframe.units.target.debuffs.sizeOverride = 0
		E.db.unitframe.units.target.castbar.width = 260
		E.db.unitframe.units.target.castbar.icon = false
		E.db.unitframe.units.target.aurabar.enable = false

		--TargetTarget
		E.db.unitframe.units.targettarget.width = 130
		E.db.unitframe.units.targettarget.height = 36
		E.db.unitframe.units.targettarget.power.enable = true
		E.db.unitframe.units.targettarget.power.width = 'inset'
		E.db.unitframe.units.targettarget.power.height = 5
		E.db.unitframe.units.targettarget.name.text_format = '[namecolor][name:long]'
		E.db.unitframe.units.targettarget.buffs.enable = false
		E.db.unitframe.units.targettarget.buffs.perrow = 5
		E.db.unitframe.units.targettarget.buffs.fontSize = 8
		E.db.unitframe.units.targettarget.buffs.sizeOverride = 0
		E.db.unitframe.units.targettarget.debuffs.enable = true
		E.db.unitframe.units.targettarget.debuffs.fontSize = 8
		E.db.unitframe.units.targettarget.debuffs.yOffset = -2
		E.db.unitframe.units.targettarget.debuffs.sizeOverride = 0

		--TargetTargetTarget
		E.db.unitframe.units.targettargettarget.buffs.perrow = 5
		E.db.unitframe.units.targettargettarget.buffs.fontSize = 8
		E.db.unitframe.units.targettargettarget.debuffs.fontSize = 8

		--Focus
		E.db.unitframe.units.focus.width = 138
		E.db.unitframe.units.focus.height = 40
		E.db.unitframe.units.focus.health.position = 'TOPRIGHT'
		E.db.unitframe.units.focus.health.xOffset = 3
		E.db.unitframe.units.focus.health.yOffset = -5
		E.db.unitframe.units.focus.power.width = 'inset'
		E.db.unitframe.units.focus.power.height = 5
		E.db.unitframe.units.focus.power.position = 'BOTTOMRIGHT'
		E.db.unitframe.units.focus.power.hideonnpc = false
		E.db.unitframe.units.focus.power.xOffset = 3
		E.db.unitframe.units.focus.power.yOffset = 10
		E.db.unitframe.units.focus.name.position = 'LEFT'
		E.db.unitframe.units.focus.name.text_format = '[namecolor][name:long]'
		E.db.unitframe.units.focus.name.xOffset = 2
		E.db.unitframe.units.focus.buffs.enable = true
		E.db.unitframe.units.focus.buffs.perrow = 5
		E.db.unitframe.units.focus.buffs.anchorPoint = 'TOPLEFT'
		E.db.unitframe.units.focus.buffs.fontSize = 8
		E.db.unitframe.units.focus.buffs.playerOnly = {friendly = false, enemy = false}
		E.db.unitframe.units.focus.buffs.noConsolidated = {friendly = false, enemy = false}
		E.db.unitframe.units.focus.buffs.noDuration = {friendly = false, enemy = false}
		E.db.unitframe.units.focus.buffs.yOffset = -2
		E.db.unitframe.units.focus.buffs.sizeOverride = 0
		E.db.unitframe.units.focus.debuffs.attachTo = 'BUFFS'
		E.db.unitframe.units.focus.debuffs.anchorPoint = 'TOPLEFT'
		E.db.unitframe.units.focus.debuffs.fontSize = 8
		E.db.unitframe.units.focus.debuffs.useWhitelist = {friendly = false, enemy = true}
		E.db.unitframe.units.focus.debuffs.yOffset = 1
		E.db.unitframe.units.focus.debuffs.sizeOverride = 0
		E.db.unitframe.units.focus.castbar.width = 200
		E.db.unitframe.units.focus.castbar.height = 15
		E.db.unitframe.units.focus.castbar.icon = false

		--FocusTarget
		E.db.unitframe.units.focustarget.enable = true
		E.db.unitframe.units.focustarget.width = 118
		E.db.unitframe.units.focustarget.height = 30
		E.db.unitframe.units.focustarget.health.position = 'TOPRIGHT'
		E.db.unitframe.units.focustarget.health.xOffset = 3
		E.db.unitframe.units.focustarget.health.yOffset = -5
		E.db.unitframe.units.focustarget.power.enable = true
		E.db.unitframe.units.focustarget.power.width = 'inset'
		E.db.unitframe.units.focustarget.power.height = 5
		E.db.unitframe.units.focustarget.power.position = 'BOTTOMRIGHT'
		E.db.unitframe.units.focustarget.power.hideonnpc = false
		E.db.unitframe.units.focustarget.power.xOffset = 3
		E.db.unitframe.units.focustarget.power.yOffset = 10
		E.db.unitframe.units.focustarget.name.text_format = '[namecolor][name:long]'
		E.db.unitframe.units.focustarget.buffs.enable = true
		E.db.unitframe.units.focustarget.buffs.perrow = 5
		E.db.unitframe.units.focustarget.buffs.anchorPoint = 'TOPRIGHT'
		E.db.unitframe.units.focustarget.buffs.fontSize = 8
		E.db.unitframe.units.focustarget.buffs.yOffset = 2
		E.db.unitframe.units.focustarget.buffs.sizeOverride = 0
		E.db.unitframe.units.focustarget.debuffs.attachTo = 'BUFFS'
		E.db.unitframe.units.focustarget.debuffs.anchorPoint = 'TOPRIGHT'
		E.db.unitframe.units.focustarget.debuffs.fontSize = 8
		E.db.unitframe.units.focustarget.debuffs.yOffset = 1
		E.db.unitframe.units.focustarget.debuffs.sizeOverride = 0

		--Pet
		E.db.unitframe.units.pet.health.position = 'TOPRIGHT'
		E.db.unitframe.units.pet.health.xOffset = 3
		E.db.unitframe.units.pet.health.yOffset = -5
		E.db.unitframe.units.pet.power.enable = true
		E.db.unitframe.units.pet.power.width = 'inset'
		E.db.unitframe.units.pet.power.height = 5
		E.db.unitframe.units.pet.power.position = 'BOTTOMRIGHT'
		E.db.unitframe.units.pet.power.xOffset = 3
		E.db.unitframe.units.pet.power.yOffset = 10
		E.db.unitframe.units.pet.name.position = 'LEFT'
		E.db.unitframe.units.pet.name.text_format = '[namecolor][name:long]'
		E.db.unitframe.units.pet.name.xOffset = 2
		E.db.unitframe.units.pet.buffs.perrow = 5
		E.db.unitframe.units.pet.buffs.fontSize = 8
		E.db.unitframe.units.pet.buffs.yOffset = -2
		E.db.unitframe.units.pet.buffs.sizeOverride = 0
		E.db.unitframe.units.pet.debuffs.attachTo = 'BUFFS'
		E.db.unitframe.units.pet.debuffs.anchorPoint = 'BOTTOMLEFT'
		E.db.unitframe.units.pet.debuffs.fontSize = 8
		E.db.unitframe.units.pet.debuffs.yOffset = -1
		E.db.unitframe.units.pet.debuffs.sizeOverride = 0
		E.db.unitframe.units.pet.buffIndicator.fontSize = 8

		--PetTarget
		E.db.unitframe.units.pettarget.power.width = 'inset'
		E.db.unitframe.units.pettarget.power.height = 5
		E.db.unitframe.units.pettarget.name.text_format = '[namecolor][name:long]'
		E.db.unitframe.units.pettarget.buffs.perrow = 5
		E.db.unitframe.units.pettarget.buffs.fontSize = 8
		E.db.unitframe.units.pettarget.buffs.yOffset = -2
		E.db.unitframe.units.pettarget.buffs.sizeOverride = 0
		E.db.unitframe.units.pettarget.debuffs.attachTo = 'BUFFS'
		E.db.unitframe.units.pettarget.debuffs.fontSize = 8
		E.db.unitframe.units.pettarget.debuffs.yOffset = -1
		E.db.unitframe.units.pettarget.debuffs.sizeOverride = 0

		--Boss
		E.db.unitframe.units.boss.width = 180
		E.db.unitframe.units.boss.height = 40
		E.db.unitframe.units.boss.spacing = 60
		E.db.unitframe.units.boss.health.text_format = '[healthcolor][health:current-percent]'
		E.db.unitframe.units.boss.health.xOffset = 3
		E.db.unitframe.units.boss.health.yOffset = -2
		E.db.unitframe.units.boss.power.width = 'inset'
		E.db.unitframe.units.boss.power.height = 5
		E.db.unitframe.units.boss.power.xOffset = 3
		E.db.unitframe.units.boss.power.yOffset = 8
		E.db.unitframe.units.boss.name.text_format = '[namecolor][name:long]'
		E.db.unitframe.units.boss.name.xOffset = 2
		E.db.unitframe.units.boss.buffs.perrow = 8
		E.db.unitframe.units.boss.buffs.attachTo = 'DEBUFFS'
		E.db.unitframe.units.boss.buffs.anchorPoint = 'TOPRIGHT'
		E.db.unitframe.units.boss.buffs.fontSize = 8
		E.db.unitframe.units.boss.buffs.yOffset = 2
		E.db.unitframe.units.boss.buffs.sizeOverride = 0
		E.db.unitframe.units.boss.debuffs.perrow = 8
		E.db.unitframe.units.boss.debuffs.numrows = 1
		E.db.unitframe.units.boss.debuffs.anchorPoint = 'TOPLEFT'
		E.db.unitframe.units.boss.debuffs.fontSize = 8
		E.db.unitframe.units.boss.debuffs.useWhitelist = {friendly = true, enemy = true}
		E.db.unitframe.units.boss.debuffs.yOffset = 1
		E.db.unitframe.units.boss.debuffs.sizeOverride = 0
		E.db.unitframe.units.boss.castbar.width = 180
		E.db.unitframe.units.boss.castbar.height = 15
		E.db.unitframe.units.boss.castbar.icon = false

		--Arena
		E.db.unitframe.units.arena.width = 180
		E.db.unitframe.units.arena.height = 40
		E.db.unitframe.units.arena.health.text_format = '[healthcolor][health:current-percent]'
		E.db.unitframe.units.arena.health.xOffset = 3
		E.db.unitframe.units.arena.health.yOffset = -2
		E.db.unitframe.units.arena.power.width = 'inset'
		E.db.unitframe.units.arena.power.height = 5
		E.db.unitframe.units.arena.power.xOffset = 3
		E.db.unitframe.units.arena.power.yOffset = 8
		E.db.unitframe.units.arena.name.text_format = '[namecolor][name:long]'
		E.db.unitframe.units.arena.name.xOffset = 2
		E.db.unitframe.units.arena.buffs.fontSize = 8
		E.db.unitframe.units.arena.buffs.sizeOverride = 18
		E.db.unitframe.units.arena.buffs.xOffset = -1
		E.db.unitframe.units.arena.buffs.yOffset = 10
		E.db.unitframe.units.arena.debuffs.fontSize = 8
		E.db.unitframe.units.arena.debuffs.sizeOverride = 18
		E.db.unitframe.units.arena.debuffs.xOffset = -1
		E.db.unitframe.units.arena.debuffs.yOffset = -11
		E.db.unitframe.units.arena.castbar.width = 180
		E.db.unitframe.units.arena.castbar.height = 15
		E.db.unitframe.units.arena.pvpTrinket.size = 40

		--Party
		E.db.unitframe.units.party.growthDirection = 'RIGHT_UP'
		E.db.unitframe.units.party.horizontalSpacing = 6
		E.db.unitframe.units.party.verticalSpacing = 2
		E.db.unitframe.units.party.raidWideSorting = true
		E.db.unitframe.units.party.invertGroupingOrder = true
		E.db.unitframe.units.party.startFromCenter = true
		E.db.unitframe.units.party.width = 75
		E.db.unitframe.units.party.height = 60
		E.db.unitframe.units.party.health.text_format = ''
		E.db.unitframe.units.party.health.position = 'BOTTOM'
		E.db.unitframe.units.party.power.text_format = ''
		E.db.unitframe.units.party.power.width = 'inset'
		E.db.unitframe.units.party.power.height = 3
		E.db.unitframe.units.party.name.position = 'CENTER'
		E.db.unitframe.units.party.name.text_format = ''
		E.db.unitframe.units.party.name.yOffset = 8
		E.db.unitframe.units.party.name.xOffset = 1
		E.db.unitframe.units.party.buffs.enable = false
		E.db.unitframe.units.party.buffs.attachTo = 'DEBUFFS'
		E.db.unitframe.units.party.buffs.anchorPoint = 'TOPRIGHT'
		E.db.unitframe.units.party.buffs.fontSize = 8
		E.db.unitframe.units.party.buffs.countFontSize = 8
		E.db.unitframe.units.party.buffs.sizeOverride = 0
		E.db.unitframe.units.party.debuffs.enable = true
		E.db.unitframe.units.party.debuffs.anchorPoint = 'CENTER'
		E.db.unitframe.units.party.debuffs.fontSize = 8
		E.db.unitframe.units.party.debuffs.countFontSize = 8
		E.db.unitframe.units.party.debuffs.xOffset = 21
		E.db.unitframe.units.party.debuffs.yOffset = -10
		E.db.unitframe.units.party.debuffs.sizeOverride = 20
		E.db.unitframe.units.party.buffIndicator.fontSize = 8
		E.db.unitframe.units.party.roleIcon.position = 'TOP'
		E.db.unitframe.units.party.GPSArrow.size = 45
		E.db.unitframe.units.party.petsGroup.width = 75
		E.db.unitframe.units.party.petsGroup.height = 15
		E.db.unitframe.units.party.petsGroup.anchorPoint = 'BOTTOM'
		E.db.unitframe.units.party.petsGroup.xOffset = 0
		E.db.unitframe.units.party.petsGroup.yOffset = -2
		E.db.unitframe.units.party.targetsGroup.width = 75
		E.db.unitframe.units.party.targetsGroup.height = 15
		E.db.unitframe.units.party.targetsGroup.anchorPoint = 'TOP'
		E.db.unitframe.units.party.targetsGroup.xOffset = 0
		E.db.unitframe.units.party.targetsGroup.yOffset = 2
		E.db.unitframe.units.party.raidicon.size = 13
		E.db.unitframe.units.party.raidicon.xOffset = 15
		E.db.unitframe.units.party.raidicon.yOffset = -2
		if not E.db['unitframe']['units']['party']["customTexts"] then E.db['unitframe']['units']['party']["customTexts"] = {} end
		--Name is too wide with default font, create custom text for names and use a condensed version of the font
		E.db['unitframe']['units']['party']["customTexts"]["CNB Custom Name"] = {
			["font"] = "PF T 7 Cond. Bold",
			["justifyH"] = "CENTER",
			["fontOutline"] = "MONOCHROMEOUTLINE",
			["xOffset"] = 1,
			["yOffset"] = 8,
			["text_format"] = "[namecolor][name:short]",
			["size"] = 8,
		}

		--Raid
		E.db.unitframe.units.raid.growthDirection = 'RIGHT_DOWN'
		E.db.unitframe.units.raid.horizontalSpacing = 2
		E.db.unitframe.units.raid.verticalSpacing = 2
		E.db.unitframe.units.raid.raidWideSorting = false
		E.db.unitframe.units.raid.invertGroupingOrder = false
		E.db.unitframe.units.raid.startFromCenter = false
		E.db.unitframe.units.raid.width = 75
		E.db.unitframe.units.raid.height = 60
		E.db.unitframe.units.raid.health.text_format = ''
		E.db.unitframe.units.raid.power.width = 'inset'
		E.db.unitframe.units.raid.power.height = 3
		E.db.unitframe.units.raid.name.text_format = ''
		E.db.unitframe.units.raid.name.yOffset = 8
		E.db.unitframe.units.raid.name.xOffset = 1
		E.db.unitframe.units.raid.buffs.enable = false
		E.db.unitframe.units.raid.buffs.anchorPoint = 'TOPRIGHT'
		E.db.unitframe.units.raid.buffs.fontSize = 8
		E.db.unitframe.units.raid.buffs.countFontSize = 8
		E.db.unitframe.units.raid.buffs.yOffset = -33
		E.db.unitframe.units.raid.buffs.sizeOverride = 20
		E.db.unitframe.units.raid.debuffs.enable = true
		E.db.unitframe.units.raid.debuffs.anchorPoint = 'CENTER'
		E.db.unitframe.units.raid.debuffs.fontSize = 8
		E.db.unitframe.units.raid.debuffs.countFontSize = 8
		E.db.unitframe.units.raid.debuffs.xOffset = 21
		E.db.unitframe.units.raid.debuffs.yOffset = -10
		E.db.unitframe.units.raid.debuffs.sizeOverride = 20
		E.db.unitframe.units.raid.buffIndicator.fontSize = 8
		E.db.unitframe.units.raid.rdebuffs.enable = false
		E.db.unitframe.units.raid.rdebuffs.fontSize = 8
		E.db.unitframe.units.raid.rdebuffs.xOffset = 0
		E.db.unitframe.units.raid.rdebuffs.yOffset = 2
		E.db.unitframe.units.raid.roleIcon.position = 'TOP'
		E.db.unitframe.units.raid.raidicon.size = 13
		E.db.unitframe.units.raid.raidicon.xOffset = 15
		E.db.unitframe.units.raid.raidicon.yOffset = -2
		if not E.db['unitframe']['units']['raid']["customTexts"] then E.db['unitframe']['units']['raid']["customTexts"] = {} end
		-- Create custom text with group number for easy identification of group
		E.db['unitframe']['units']['raid']["customTexts"]["CNB Group#"] = {
			["font"] = "PF T 7 Ext. Bold",
			["justifyH"] = "CENTER",
			["fontOutline"] = "MONOCHROMEOUTLINE",
			["xOffset"] = -12,
			["yOffset"] = 20,
			["text_format"] = "[group]",
			["size"] = 8,
		}
		-- Name is too wide with default font, create custom text for names and use a condensed version of the font
		E.db['unitframe']['units']['raid']["customTexts"]["CNB Custom Name"] = {
			["font"] = "PF T 7 Cond. Bold",
			["justifyH"] = "CENTER",
			["fontOutline"] = "MONOCHROMEOUTLINE",
			["xOffset"] = 1,
			["yOffset"] = 8,
			["text_format"] = "[namecolor][name:short]",
			["size"] = 8,
		}

		--Raid-40
		E.db.unitframe.units.raid40.growthDirection = 'RIGHT_DOWN'
		E.db.unitframe.units.raid40.horizontalSpacing = 2
		E.db.unitframe.units.raid40.verticalSpacing = 2
		E.db.unitframe.units.raid40.raidWideSorting = false
		E.db.unitframe.units.raid40.invertGroupingOrder = false
		E.db.unitframe.units.raid40.startFromCenter = false
		E.db.unitframe.units.raid40.width = 75
		E.db.unitframe.units.raid40.height = 36
		E.db.unitframe.units.raid40.power.width = 'inset'
		E.db.unitframe.units.raid40.power.height = 3
		E.db.unitframe.units.raid40.name.text_format = ''
		E.db.unitframe.units.raid40.name.yOffset = -2
		E.db.unitframe.units.raid40.buffs.perrow = 2
		E.db.unitframe.units.raid40.buffs.anchorPoint = 'TOPRIGHT'
		E.db.unitframe.units.raid40.buffs.fontSize = 8
		E.db.unitframe.units.raid40.buffs.countFontSize = 8
		E.db.unitframe.units.raid40.buffs.yOffset = -33
		E.db.unitframe.units.raid40.buffs.sizeOverride = 20
		E.db.unitframe.units.raid40.debuffs.perrow = 2
		E.db.unitframe.units.raid40.debuffs.anchorPoint = 'BOTTOMLEFT'
		E.db.unitframe.units.raid40.debuffs.fontSize = 8
		E.db.unitframe.units.raid40.debuffs.countFontSize = 8
		E.db.unitframe.units.raid40.debuffs.noDuration = true
		E.db.unitframe.units.raid40.debuffs.xOffset = 20
		E.db.unitframe.units.raid40.debuffs.yOffset = 24
		E.db.unitframe.units.raid40.debuffs.sizeOverride = 15
		E.db.unitframe.units.raid40.rdebuffs.fontSize = 8
		E.db.unitframe.units.raid40.rdebuffs.size = 18
		E.db.unitframe.units.raid40.rdebuffs.xOffset = 0
		E.db.unitframe.units.raid40.rdebuffs.yOffset = 2
		E.db.unitframe.units.raid40.roleIcon.enable = true
		E.db.unitframe.units.raid40.roleIcon.position = 'TOP'
		E.db.unitframe.units.raid40.raidicon.size = 13
		E.db.unitframe.units.raid40.raidicon.xOffset = 15
		E.db.unitframe.units.raid40.raidicon.yOffset = -2
		if not E.db['unitframe']['units']['raid40']["customTexts"] then E.db['unitframe']['units']['raid40']["customTexts"] = {} end
		--Name is too wide with default font, create custom text for names and use a condensed version of the font
		E.db['unitframe']['units']['raid40']["customTexts"]["CNB Custom Name"] = {
			["font"] = "PF T 7 Cond. Bold",
			["justifyH"] = "CENTER",
			["fontOutline"] = "MONOCHROMEOUTLINE",
			["xOffset"] = 1,
			["yOffset"] = -2,
			["text_format"] = "[namecolor][name:short]",
			["size"] = 8,
		}

		--Tank
		E.db.unitframe.units.tank.enable = false

		--Assist
		E.db.unitframe.units.assist.enable = false

		--[[----------------------------------
			ProfileDB - Actionbars
		--]]----------------------------------
		--General
		E.db.actionbar.font = 'PF T 7 Bold'
		E.db.actionbar.fontSize = 8
		E.db.actionbar.macrotext = true
		E.db.actionbar.keyDown = false

		--Bar 1
		E.db.actionbar.bar1.enabled = true
		E.db.actionbar.bar1.backdrop = true
		E.db.actionbar.bar1.heightMult = 3
		E.db.actionbar.bar1.buttonsize = 30
		E.db.actionbar.bar1.buttonspacing = 3

		--Bar 2
		E.db.actionbar.bar2.enabled = true
		E.db.actionbar.bar2.backdrop = false
		E.db.actionbar.bar2.buttonsize = 30
		E.db.actionbar.bar2.buttonspacing = 3

		--Bar 3
		E.db.actionbar.bar3.enabled = true
		E.db.actionbar.bar3.backdrop = false
		E.db.actionbar.bar3.buttons = 12
		E.db.actionbar.bar3.buttonsPerRow = 12
		E.db.actionbar.bar3.buttonsize = 30
		E.db.actionbar.bar3.buttonspacing = 3

		--Bar 4
		E.db.actionbar.bar4.enabled = true
		E.db.actionbar.bar4.backdrop = true
		E.db.actionbar.bar4.mouseover = true
		E.db.actionbar.bar4.buttons = 10
		E.db.actionbar.bar4.buttonsize = 30
		E.db.actionbar.bar4.buttonspacing = 3
		E.db.actionbar.bar4.visibility = "[vehicleui] hide; [overridebar] hide; [petbattle] hide; [mod:ctrl] show; hide"

		--Bar 5
		E.db.actionbar.bar5.enabled = false
		E.db.actionbar.bar5.mouseover = true
		E.db.actionbar.bar5.buttons = 12
		E.db.actionbar.bar5.buttonsPerRow = 1
		E.db.actionbar.bar5.point = 'TOPRIGHT'
		E.db.actionbar.bar5.backdrop = true
		E.db.actionbar.bar5.buttonsize = 30
		E.db.actionbar.bar5.buttonspacing = 3

		--Bar 6
		E.db.actionbar.bar6.enabled = false
		E.db.actionbar.bar6.mouseover = true
		E.db.actionbar.bar6.buttonsPerRow = 1
		E.db.actionbar.bar6.point = 'TOPRIGHT'
		E.db.actionbar.bar6.backdrop = true
		E.db.actionbar.bar6.buttonsize = 30
		E.db.actionbar.bar6.buttonspacing = 3

		--Pet Bar
		E.db.actionbar.barPet.enabled = true
		E.db.actionbar.barPet.buttonsize = 30
		E.db.actionbar.barPet.buttonspacing = 3

		--Stance Bar
		E.db.actionbar.stanceBar.enabled = true
		E.db.actionbar.stanceBar.buttonsPerRow = 1
		E.db.actionbar.stanceBar.buttons = 6
		E.db.actionbar.stanceBar.buttonsize = 28
		E.db.actionbar.stanceBar.buttonspacing = 3
	end

	if layout == 'healer' then
		if not noDataReset then
			E.db.unitframe.units.player.classbar.detachFromFrame = false

			E.db.unitframe.units.boss.width = 160;

			E.db.unitframe.units.party.width = 80;
			E.db.unitframe.units.party.horizontalSpacing = 3;
			E.db.unitframe.units.party.verticalSpacing = 3;
			E.db.unitframe.units.party.healPrediction = true;
			E.db.unitframe.units.party.health.frequentUpdates = true;
			E.db.unitframe.units.party.petsGroup.enable = true;
			E.db.unitframe.units.party.petsGroup.anchorPoint = 'TOP';
			E.db.unitframe.units.party.petsGroup.width = 80;
			E.db.unitframe.units.party.petsGroup.yOffset = 3;
			E.db.unitframe.units.party.targetsGroup.enable = false;
			E.db.unitframe.units.party.targetsGroup.anchorPoint = 'BOTTOM';
			E.db.unitframe.units.party.targetsGroup.width = 80;
			E.db.unitframe.units.party.targetsGroup.yOffset = -3;

			E.db.unitframe.units.raid.growthDirection = 'RIGHT_UP'
			E.db.unitframe.units.raid.width = 80;
			E.db.unitframe.units.raid.horizontalSpacing = 3;
			E.db.unitframe.units.raid.verticalSpacing = 3;
			E.db.unitframe.units.raid.healPrediction = true;
			E.db.unitframe.units.raid.health.frequentUpdates = true;
			E.db.unitframe.units.raid.raidWideSorting = true;
			E.db.unitframe.units.raid.startFromCenter = true;

			E.db.unitframe.units.raid40.growthDirection = 'RIGHT_UP'
			E.db.unitframe.units.raid40.width = 80;
			E.db.unitframe.units.raid40.horizontalSpacing = 3;
			E.db.unitframe.units.raid40.verticalSpacing = 3;
			E.db.unitframe.units.raid40.healPrediction = true;
			E.db.unitframe.units.raid40.health.frequentUpdates = true;
			E.db.unitframe.units.raid40.raidWideSorting = true;
			E.db.unitframe.units.raid40.startFromCenter = true;
			E.db.unitframe.units.raid40.rdebuffs.enable = true;
			E.db.unitframe.units.raid40.rdebuffs.size = 18;
		end
	end

	--Datatexts
	if not noDataReset then
		if layout == 'tank' then
			E.db.datatexts.panels.LeftChatDataPanel.left = 'Avoidance';
			E.db.datatexts.panels.LeftChatDataPanel.middle = 'Armor';
			E.db.datatexts.panels.LeftChatDataPanel.right = 'Vengeance';
			E.db.CNB.datatexts.panels.Bottom_Datatext_Panel.middle = 'Attack Power'
		elseif layout == 'dpsMelee' then
			E.db.CNB.datatexts.panels.Bottom_Datatext_Panel.middle = 'Attack Power'
		end

		if CodeNameBlazeInstallStepComplete then
			CodeNameBlazeInstallStepComplete.message = L["Layout Set"]
			CodeNameBlazeInstallStepComplete:Show()
		end
	end

	E:UpdateAll(true)
	local DT = E:GetModule('DataTexts')
	DT:LoadDataTexts()

	E.db.CNB.chosenLayout = layout;
end

function CNB:SetPositions(resolution, layout, noDataReset)
	if not noDataReset then
		E:ResetMovers('')
		CNB:SetMoverPosition('ElvUF_PetMover', 'TOPLEFT', ElvUF_PlayerMover, 'BOTTOMLEFT', 0, -2)
		CNB:SetMoverPosition('ElvUF_PetTargetMover', 'TOPLEFT', ElvUF_PetMover, 'BOTTOMLEFT', 0, -2)
		CNB:SetMoverPosition('ElvUF_TargetTargetMover', 'TOPRIGHT', ElvUF_TargetMover, 'BOTTOMRIGHT', 0, -2)
		CNB:SetMoverPosition('ElvUF_TargetTargetTargetMover', 'TOPRIGHT', ElvUF_TargetTargetMover, 'BOTTOMRIGHT', 0, -2)
		CNB:SetMoverPosition('ElvUF_FocusTargetMover', 'BOTTOMLEFT', ElvUF_FocusMover, 'BOTTOMRIGHT', 2, 0)
		CNB:SetMoverPosition('MinimapMover', 'TOPRIGHT', E.UIParent, 'TOPRIGHT', -10, -10)
		CNB:SetMoverPosition('BuffsMover', 'TOPRIGHT', Minimap, 'TOPLEFT', -8, 1)
		CNB:SetMoverPosition('GMMover', 'TOPRIGHT', ElvUIPlayerDebuffs, 'BOTTOMRIGHT', 0, -10)
		CNB:SetMoverPosition('VehicleSeatMover', 'TOP', ElvUIPlayerDebuffs, 'BOTTOM', 0, 0)
		CNB:SetMoverPosition('TalkingHeadFrameMover', 'TOP', E.UIParent, 'TOP', 0, -200)

		if resolution == "low" then
			--Settings
			E.db.chat.panelHeight = 180
			E.db.chat.panelWidth = 375
			E.db.chat.panelHeightRight = 180
			E.db.chat.panelWidthRight = 375
			E.db.unitframe.units.player.width = 220
			E.db.unitframe.units.target.width = 220
			E.db.unitframe.units.focustarget.width = 75
			E.db.unitframe.units.focustarget.buffs.perrow = 3
			E.db.unitframe.units.focustarget.debuffs.perrow = 3
			E.db.unitframe.units.boss.width = 160
			E.db.CNB.unitframes.boss.verticalSpace = 45
			E.db.unitframe.units.raid.height = 50
			E.db.unitframe.units.raid.horizontalSpacing = 1
			E.db.unitframe.units.raid.verticalSpacing = 1
			E.db.unitframe.units.raid.debuffs.xOffset = 20
			E.db.unitframe.units.raid.debuffs.yOffset = -8
			E.db.unitframe.units.raid.debuffs.sizeOverride = 18
			E.db.unitframe.units.raid.customTexts["CNB Custom Name"].yOffset = 6
			E.db.unitframe.units.raid40.height = 30
			E.db.unitframe.units.raid40.horizontalSpacing = 1
			E.db.unitframe.units.raid40.verticalSpacing = 1
			E.db.unitframe.units.raid40.customTexts["CNB Custom Name"].yOffset = -7

			--Set Positions
			CNB:SetMoverPosition('ElvUF_TankMover', 'TOPLEFT', E.UIParent, 'TOPLEFT', 4, -350)
			CNB:SetMoverPosition('ElvUF_AssistMover', 'TOPLEFT', E.UIParent, 'TOPLEFT', 4, -450)
			CNB:SetMoverPosition('ElvAB_2', 'LEFT', ElvUI_Bar1, 'LEFT', 0, 0)
			CNB:SetMoverPosition('ElvAB_3', 'TOP', ElvUI_Bar1, 'TOP', 0, 0)
			CNB:SetMoverPosition('ElvAB_5', 'RIGHT', E.UIParent, 'RIGHT', -4, 0)
			CNB:SetMoverPosition('ElvAB_6', 'RIGHT', E.UIParent, 'RIGHT', -4, 0)
			CNB:SetMoverPosition('MicrobarMover', 'TOPLEFT', E.UIParent, 'TOPLEFT', 435, -4)
			CNB:SetMoverPosition('ShiftAB', 'TOPLEFT', LeftChatPanel, 'TOPRIGHT', -1, 3)
			CNB:SetMoverPosition('TotemBarMover', 'BOTTOMLEFT', E.UIParent, 'BOTTOMLEFT', 435, 5)
			if BossButton then CNB:SetMoverPosition('BossButton', 'BOTTOMLEFT', E.UIParent, 'BOTTOMLEFT', 490, 70) end
			if AltPowerBarMover then CNB:SetMoverPosition('AltPowerBarMover', 'BOTTOMLEFT', E.UIParent, 'BOTTOMLEFT', 460, 150) end

			if layout == 'healer' then
				--Settings
				E.db.unitframe.units.party.width = 79
				E.db.unitframe.units.party.horizontalSpacing = 1
				E.db.unitframe.units.party.verticalSpacing = 1
				E.db.unitframe.units.party.petsGroup.width = 79;
				E.db.unitframe.units.party.targetsGroup.width = 79;
				E.db.unitframe.units.raid.width = 79
				E.db.unitframe.units.raid40.width = 79

				--Set Positions
				CNB:SetMoverPosition('ElvUF_PlayerMover', 'BOTTOMRIGHT', E.UIParent, 'BOTTOM', -205, 300)
				CNB:SetMoverPosition('ElvUF_PlayerCastbarMover', 'BOTTOM', E.UIParent, 'BOTTOM', 0, 130)
				CNB:SetMoverPosition('ElvUF_TargetMover', 'BOTTOMLEFT', E.UIParent, 'BOTTOM', 204, 300)
				CNB:SetMoverPosition('ElvUF_FocusMover', 'BOTTOMLEFT', ElvUF_PlayerMover, 'TOPLEFT', 0, 46)
				CNB:SetMoverPosition('ElvUF_PartyMover', 'BOTTOMLEFT', E.UIParent, 'BOTTOM', -200, 300)
				CNB:SetMoverPosition('ElvUF_RaidMover', 'BOTTOMLEFT', E.UIParent, 'BOTTOM', -200, 155)
				CNB:SetMoverPosition('ElvUF_Raid40Mover', 'BOTTOMLEFT', E.UIParent, 'BOTTOM', -200, 155)
				CNB:SetMoverPosition('ElvAB_1', 'BOTTOM', E.UIParent, 'BOTTOM', 0, 27)
				if BossHeaderMover then CNB:SetMoverPosition('BossHeaderMover', 'TOPLEFT', E.UIParent, 'TOPLEFT', 230, -260) end
			else
				--Settings
				E.db.unitframe.units.raid.width = 75
				E.db.unitframe.units.raid40.width = 75

				--Set Positions
				CNB:SetMoverPosition('ElvUF_PlayerMover', 'BOTTOMRIGHT', E.UIParent, 'BOTTOM', -115, 330)
				CNB:SetMoverPosition('ElvUF_PlayerCastbarMover', 'BOTTOM', E.UIParent, 'BOTTOM', 0, 275)
				CNB:SetMoverPosition('ElvUF_TargetMover', 'BOTTOMLEFT', E.UIParent, 'BOTTOM', 114, 330)
				CNB:SetMoverPosition('ElvUF_FocusMover', 'BOTTOMLEFT', ElvUF_PlayerMover, 'TOPLEFT', 0, 46)
				CNB:SetMoverPosition('ElvUF_PartyMover', 'BOTTOMLEFT', E.UIParent, 'BOTTOM', -200, 60)
				CNB:SetMoverPosition('ElvUF_RaidMover', 'TOPLEFT', E.UIParent, 'TOPLEFT', 4, -4)
				CNB:SetMoverPosition('ElvUF_Raid40Mover', 'TOPLEFT', E.UIParent, 'TOPLEFT', 4, -4)
				CNB:SetMoverPosition('ElvAB_1', 'BOTTOM', E.UIParent, 'BOTTOM', 0, 160)
				if BossHeaderMover then CNB:SetMoverPosition('BossHeaderMover', 'BOTTOMRIGHT', ElvUF_PlayerMover, 'BOTTOMLEFT', -50, 0) end
				if not ClassBarMover then
					CNB:ScheduleTimer(classBarMover, 1)
				else
					CNB:SetMoverPosition('ClassBarMover', 'BOTTOM', E.UIParent, 'BOTTOM', 0, 266)
				end
			end
		else
			--Set Positions
			CNB:SetMoverPosition('ElvUF_TankMover', 'TOPLEFT', E.UIParent, 'TOPLEFT', 4, -350)
			CNB:SetMoverPosition('ElvUF_AssistMover', 'TOPLEFT', E.UIParent, 'TOPLEFT', 4, -450)
			CNB:SetMoverPosition('ElvAB_2', 'LEFT', ElvUI_Bar1, 'LEFT', 0, 0)
			CNB:SetMoverPosition('ElvAB_3', 'TOP', ElvUI_Bar1, 'TOP', 0, 0)
			CNB:SetMoverPosition('ElvAB_5', 'RIGHT', E.UIParent, 'RIGHT', -4, 0)
			CNB:SetMoverPosition('ElvAB_6', 'RIGHT', E.UIParent, 'RIGHT', -4, 0)
			CNB:SetMoverPosition('MicrobarMover', 'TOPLEFT', E.UIParent, 'TOPLEFT', 435, -4)
			CNB:SetMoverPosition('ShiftAB', 'TOPLEFT', LeftChatPanel, 'TOPRIGHT', -1, 3)
			CNB:SetMoverPosition('TotemBarMover', 'BOTTOMLEFT', E.UIParent, 'BOTTOMLEFT', 480, 0)
			if BossButton then CNB:SetMoverPosition('BossButton', 'BOTTOMLEFT', E.UIParent, 'BOTTOMLEFT', 538, 90) end
			if AltPowerBarMover then CNB:SetMoverPosition('AltPowerBarMover', 'BOTTOMLEFT', E.UIParent, 'BOTTOMLEFT', 506, 190) end

			if layout == 'healer' then
				CNB:SetMoverPosition('ElvUF_PlayerMover', 'BOTTOMLEFT', E.UIParent, 'BOTTOMLEFT', 490, 300)
				CNB:SetMoverPosition('ElvUF_PlayerCastbarMover', 'BOTTOM', E.UIParent, 'BOTTOM', 0, 130)
				CNB:SetMoverPosition('ElvUF_TargetMover', 'BOTTOMRIGHT', E.UIParent, 'BOTTOMRIGHT', -490, 300)
				CNB:SetMoverPosition('ElvUF_FocusMover', 'BOTTOMLEFT', E.UIParent, 'BOTTOMLEFT', 490, 400)
				CNB:SetMoverPosition('ElvUF_PartyMover', 'BOTTOMLEFT', E.UIParent, 'BOTTOM', -206, 300)
				CNB:SetMoverPosition('ElvUF_RaidMover', 'BOTTOMLEFT', E.UIParent, 'BOTTOM', -206, 170)
				CNB:SetMoverPosition('ElvUF_Raid40Mover', 'BOTTOMLEFT', E.UIParent, 'BOTTOM', -206, 170)
				CNB:SetMoverPosition('ElvAB_1', 'BOTTOM', E.UIParent, 'BOTTOM', 0, 27)
				if BossHeaderMover then CNB:SetMoverPosition('BossHeaderMover', 'TOPLEFT', E.UIParent, 'TOPLEFT', 270, -260) end
			else
				CNB:SetMoverPosition('ElvUF_PlayerMover', 'BOTTOM', E.UIParent, 'BOTTOM', -240, 330)
				CNB:SetMoverPosition('ElvUF_PlayerCastbarMover', 'BOTTOM', E.UIParent, 'BOTTOM', 0, 275)
				CNB:SetMoverPosition('ElvUF_TargetMover', 'BOTTOM', E.UIParent, 'BOTTOM', 240, 330)
				CNB:SetMoverPosition('ElvUF_FocusMover', 'BOTTOM', E.UIParent, 'BOTTOM', -301, 430)
				CNB:SetMoverPosition('ElvUF_PartyMover', 'BOTTOMLEFT', E.UIParent, 'BOTTOM', -200, 60)
				CNB:SetMoverPosition('ElvUF_RaidMover', 'TOPLEFT', E.UIParent, 'TOPLEFT', 4, -4)
				CNB:SetMoverPosition('ElvUF_Raid40Mover', 'TOPLEFT', E.UIParent, 'TOPLEFT', 4, -4)
				CNB:SetMoverPosition('ElvAB_1', 'BOTTOM', E.UIParent, 'BOTTOM', 0, 160)
				if BossHeaderMover then CNB:SetMoverPosition('BossHeaderMover', 'TOPLEFT', E.UIParent, 'TOPLEFT', 395, -350) end
				if not ClassBarMover then
					CNB:ScheduleTimer(classBarMover, 1)
				else
					CNB:SetMoverPosition('ClassBarMover', 'BOTTOM', E.UIParent, 'BOTTOM', 0, 266)
				end
			end
		end

		E:UpdateAll(true)
	end
end

function CNB:SetupAddon(addon)
	if addon == 'DBM' then
		if IsAddOnLoaded('DBM-Core') then
			--Use the profile creation method built into DBM. Saves me from copying redundant data.
			DBM:CreateProfile('CodeNameBlaze')

			--DBM Settings
			DBM_AllSavedOptions['CodeNameBlaze']['InfoFramePoint'] = 'RIGHT'
			DBM_AllSavedOptions['CodeNameBlaze']['InfoFrameX'] = -123
			DBM_AllSavedOptions['CodeNameBlaze']['InfoFrameY'] = -120
			DBM_AllSavedOptions['CodeNameBlaze']['InfoFrameLocked'] = true
			DBM_AllSavedOptions['CodeNameBlaze']['RangeFramePoint'] = 'BOTTOMRIGHT'
			DBM_AllSavedOptions['CodeNameBlaze']['RangeFrameX'] = -237
			DBM_AllSavedOptions['CodeNameBlaze']['RangeFrameY'] = 207
			DBM_AllSavedOptions['CodeNameBlaze']['RangeFrameRadarPoint'] = 'BOTTOMRIGHT'
			DBM_AllSavedOptions['CodeNameBlaze']['RangeFrameRadarX'] = -261
			DBM_AllSavedOptions['CodeNameBlaze']['RangeFrameRadarY'] = 225
			DBM_AllSavedOptions['CodeNameBlaze']['RangeFrameLocked'] = true
			DBM_AllSavedOptions['CodeNameBlaze']['SpecialWarningFontSize'] = 16
			DBM_AllSavedOptions['CodeNameBlaze']['SpecialWarningFont'] = 'Interface\\AddOns\\ElvUI_CodeNameBlaze\\media\\fonts\\pf_tempesta_seven_extended_bold.ttf'
			DBM_AllSavedOptions['CodeNameBlaze']['WarningIconLeft'] = false
			DBM_AllSavedOptions['CodeNameBlaze']['WarningIconRight'] = false
			DBM_AllSavedOptions['CodeNameBlaze']['WarningIconChat'] = false
			DBM_AllSavedOptions['CodeNameBlaze']['DontShowPT2'] = false
			DBM_AllSavedOptions['CodeNameBlaze']['DontShowPTNoID'] = true
			DBM_AllSavedOptions['CodeNameBlaze']['PTCountThreshold'] = 11
			DBM_AllSavedOptions['CodeNameBlaze']['EnableModels'] = false
			DBM_AllSavedOptions['CodeNameBlaze']['ModelSoundValue'] = ''
			DBM_AllSavedOptions['CodeNameBlaze']['HPFramePoint'] = 'BOTTOMRIGHT'
			DBM_AllSavedOptions['CodeNameBlaze']['HPFrameX'] = -221
			DBM_AllSavedOptions['CodeNameBlaze']['HPFrameY'] = 185
			DBM_AllSavedOptions['CodeNameBlaze']['HealthFrameWidth'] = 275
			DBM_AllSavedOptions['CodeNameBlaze']['HealthFrameGrowUp'] = true
			DBM_AllSavedOptions['CodeNameBlaze']['DontShowHealthFrame'] = true
			DBM_AllSavedOptions['CodeNameBlaze']['MovieFilter'] = 'AfterFirst'
			DBM_AllSavedOptions['CodeNameBlaze']['SpamBlockBossWhispers'] = true
			DBM_AllSavedOptions['CodeNameBlaze']['ShowFlashFrame'] = false
			DBM_AllSavedOptions['CodeNameBlaze']['SpecialWarningFontCol'] = {0, 0.7, 1,}
			DBM_AllSavedOptions['CodeNameBlaze']['SpecialWarningFlashCol1'] = {0, 0.7, 1,}
			DBM_AllSavedOptions['CodeNameBlaze']['SpecialWarningFlashCol2'] = {0, 0.7, 1,}
			DBM_AllSavedOptions['CodeNameBlaze']['SpecialWarningFlashCol3'] = {0, 0.7, 1,}
			DBM_AllSavedOptions['CodeNameBlaze']['SpecialWarningFlashCol4'] = {0, 0.7, 1,}
			DBM_AllSavedOptions['CodeNameBlaze']['WarningColors'] = {
				{
					['r'] = 0,
					['g'] = 0.7,
					['b'] = 1,
				}, --[1]
				{
					['r'] = 0,
					['g'] = 0.7,
					['b'] = 1,
				}, --[2]
				{
					['r'] = 0,
					['g'] = 0.7,
					['b'] = 1,
				}, --[3]
				{
					['r'] = 0,
					['g'] = 0.7,
					['b'] = 1,
				}, --[4]
			}

			--DBM Timer Bar settings
			DBT_AllPersistentOptions['CodeNameBlaze']['DBM']['FillUpBars'] = false
			DBT_AllPersistentOptions['CodeNameBlaze']['DBM']['IconLeft'] = true
			DBT_AllPersistentOptions['CodeNameBlaze']['DBM']['IconRight'] = false
			DBT_AllPersistentOptions['CodeNameBlaze']['DBM']['ColorByType'] = false
			DBT_AllPersistentOptions['CodeNameBlaze']['DBM']['Font'] = 'Interface\\AddOns\\ElvUI_CodeNameBlaze\\media\\fonts\\pf_tempesta_seven_extended_bold.ttf'
			DBT_AllPersistentOptions['CodeNameBlaze']['DBM']['FontSize'] = 8
			DBT_AllPersistentOptions['CodeNameBlaze']['DBM']['Height'] = 20
			DBT_AllPersistentOptions['CodeNameBlaze']['DBM']['EnlargeBarsTime'] = 15
			DBT_AllPersistentOptions['CodeNameBlaze']['DBM']['Style'] = 'DBM'
			DBT_AllPersistentOptions['CodeNameBlaze']['DBM']['ExpandUpwards'] = true
			DBT_AllPersistentOptions['CodeNameBlaze']['DBM']['Texture'] = 'Interface\\AddOns\\ElvUI\\media\\textures\\normTex2.tga'
			DBT_AllPersistentOptions['CodeNameBlaze']['DBM']['Width'] = 361
			DBT_AllPersistentOptions['CodeNameBlaze']['DBM']['Scale'] = 1
			DBT_AllPersistentOptions['CodeNameBlaze']['DBM']['TimerPoint'] = 'BOTTOMLEFT'
			DBT_AllPersistentOptions['CodeNameBlaze']['DBM']['TimerX'] = 208
			DBT_AllPersistentOptions['CodeNameBlaze']['DBM']['TimerY'] = 203
			DBT_AllPersistentOptions['CodeNameBlaze']['DBM']['BarXOffset'] = 0
			DBT_AllPersistentOptions['CodeNameBlaze']['DBM']['BarYOffset'] = 1
			DBT_AllPersistentOptions['CodeNameBlaze']['DBM']['HugeWidth'] = 230
			DBT_AllPersistentOptions['CodeNameBlaze']['DBM']['HugeScale'] = 1
			DBT_AllPersistentOptions['CodeNameBlaze']['DBM']['HugeTimerPoint'] = 'RIGHT'
			DBT_AllPersistentOptions['CodeNameBlaze']['DBM']['HugeTimerX'] = -425
			DBT_AllPersistentOptions['CodeNameBlaze']['DBM']['HugeTimerY'] = -50
			DBT_AllPersistentOptions['CodeNameBlaze']['DBM']['HugeBarXOffset'] = 0
			DBT_AllPersistentOptions['CodeNameBlaze']['DBM']['HugeBarYOffset'] = 1
			DBT_AllPersistentOptions['CodeNameBlaze']['DBM']['StartColorR'] = 0
			DBT_AllPersistentOptions['CodeNameBlaze']['DBM']['StartColorG'] = 0.7
			DBT_AllPersistentOptions['CodeNameBlaze']['DBM']['StartColorB'] = 1
			DBT_AllPersistentOptions['CodeNameBlaze']['DBM']['EndColorR'] = 0
			DBT_AllPersistentOptions['CodeNameBlaze']['DBM']['EndColorG'] = 0.7
			DBT_AllPersistentOptions['CodeNameBlaze']['DBM']['EndColorB'] = 1

			--Make sure timer position is updated right away
			DBM:ApplyProfile('CodeNameBlaze')

			CNB:Print(L["A profile for 'DBM' has been created."])
			CodeNameBlazeInstallStepComplete.message = L["DBM Profile Created"]
			CodeNameBlazeInstallStepComplete:Show()
		else
			CNB:Print(L["The AddOn 'DBM' is not enabled. Profile not created."])
			CodeNameBlazeInstallStepComplete.message = L["DBM is not enabled, aborting."]
			CodeNameBlazeInstallStepComplete:Show()
		end
	elseif addon == 'Skada' then
		if IsAddOnLoaded('Skada') then
			CNB:Print(L["A profile for 'Skada' has been created."])
			CodeNameBlazeInstallStepComplete.message = L["Skada Profile Created"]
			CodeNameBlazeInstallStepComplete:Show()
			SkadaDB['profiles']['CodeNameBlaze'] = {
				["feed"] = "Damage: Raid DPS",
				["icon"] = {
					["hide"] = true,
				},
				["columns"] = {
					["Threat_Threat"] = true,
					["Damage_Percent"] = true,
					["Threat_TPS"] = false,
					["Threat_Percent"] = false,
				},
				["tooltiprows"] = 5,
				["showranks"] = false,
				["hidedisables"] = false,
				["tooltippos"] = "topleft",
				["modulesBlocked"] = {
					["Debuffs"] = true,
					["CC"] = true,
					["Interrupts"] = false,
					["TotalHealing"] = false,
					["Power"] = true,
					["Dispels"] = false,
				},
				["windows"] = {
					{
						["titleset"] = false,
						["barmax"] = 8,
						["classicons"] = false,
						["barslocked"] = true,
						["background"] = {
							["borderthickness"] = 3,
							["height"] = 144,
						},
						["barfont"] = "2002",
						["name"] = "Threat",
						["classcolortext"] = true,
						["barcolor"] = {
							["a"] = 0,
							["b"] = 0.1568627450980392,
							["g"] = 0.1568627450980392,
							["r"] = 0.1568627450980392,
						},
						["barfontsize"] = 10,
						["mode"] = "Threat",
						["spark"] = false,
						["buttons"] = {
							["report"] = false,
							["menu"] = false,
							["mode"] = false,
							["segment"] = false,
							["reset"] = false,
						},
						["barwidth"] = 124.0000305175781,
						["barspacing"] = 1,
						["barbgcolor"] = {
							["a"] = 0,
							["b"] = 0.1647058823529412,
							["g"] = 0.1647058823529412,
							["r"] = 0.1647058823529412,
						},
						["enabletitle"] = false,
						["classcolorbars"] = false,
						["baraltcolor"] = {
							["r"] = 0.8431372549019608,
							["g"] = 0.8431372549019608,
							["b"] = 0.8431372549019608,
						},
						["bartexture"] = "Armory",
						["enablebackground"] = true,
						["title"] = {
							["menubutton"] = false,
							["font"] = "PF T 7 Bold",
							["fontsize"] = 8,
							["fontflags"] = "OUTLINEMONOCHROME",
							["texture"] = "Armory",
						},
					}, -- [1]
					{
						["classcolortext"] = true,
						["titleset"] = false,
						["barheight"] = 15,
						["barfontsize"] = 10,
						["scale"] = 1,
						["barcolor"] = {
							["a"] = 0,
							["b"] = 0.1647058823529412,
							["g"] = 0.1647058823529412,
							["r"] = 0.1647058823529412,
						},
						["mode"] = "Damage",
						["returnaftercombat"] = false,
						["clickthrough"] = false,
						["classicons"] = false,
						["barslocked"] = true,
						["snapto"] = true,
						["barorientation"] = 1,
						["enabletitle"] = false,
						["wipemode"] = "",
						["name"] = "Skada",
						["background"] = {
							["borderthickness"] = 0,
							["color"] = {
								["a"] = 0.2000000476837158,
								["r"] = 0,
								["g"] = 0,
								["b"] = 0.5019607843137255,
							},
							["height"] = 144,
							["bordertexture"] = "None",
							["margin"] = 0,
							["texture"] = "Solid",
						},
						["bartexture"] = "Armory",
						["spark"] = false,
						["set"] = "current",
						["barwidth"] = 246.0000305175781,
						["barspacing"] = 1,
						["hidden"] = false,
						["reversegrowth"] = false,
						["buttons"] = {
							["segment"] = false,
							["menu"] = false,
							["mode"] = false,
							["report"] = true,
							["reset"] = false,
						},
						["barfont"] = "2002",
						["title"] = {
							["color"] = {
								["a"] = 0.800000011920929,
								["r"] = 0.1019607843137255,
								["g"] = 0.1019607843137255,
								["b"] = 0.3019607843137255,
							},
							["bordertexture"] = "None",
							["font"] = "PF T 7 Ext. Bold",
							["borderthickness"] = 2,
							["fontsize"] = 8,
							["fontflags"] = "",
							["height"] = 10,
							["margin"] = 0,
							["texture"] = "Armory",
						},
						["classcolorbars"] = false,
						["display"] = "bar",
						["modeincombat"] = "",
						["barfontflags"] = "",
						["barbgcolor"] = {
							["a"] = 0,
							["b"] = 0.1647058823529412,
							["g"] = 0.1647058823529412,
							["r"] = 0.1647058823529412,
						},
					}, -- [2]
				},
			}
		else
			CNB:Print(L["The AddOn 'Skada' is not enabled. Profile not created."])
			CodeNameBlazeInstallStepComplete.message = L["Skada is not enabled, aborting."]
			CodeNameBlazeInstallStepComplete:Show()
		end
	elseif addon == 'MSBT' then
		if IsAddOnLoaded('MikScrollingBattleText') then
			CNB:Print(L["A profile for 'Mik`s Scrolling Battle Text' has been created."])
			CodeNameBlazeInstallStepComplete.message = L["MSBT Profile Created"]
			CodeNameBlazeInstallStepComplete:Show()
			MSBTProfiles_SavedVars['profiles']['CodeNameBlaze'] = {
				["normalFontName"] = "PF T 7 Ext. Bold",
				["normalFontSize"] = 8,
				["normalOutlineIndex"] = 5,
				["critFontName"] = "PF T 7 Ext. Bold",
				["critFontSize"] = 16,
				["critOutlineIndex"] = 6,
				["stickyCritsDisabled"] = true,
				["textShadowingDisabled"] = true,
				["hideNames"] = true,
				["hideFullOverheals"] = true,
				["hideSkills"] = true,
				["shortenNumbers"] = true,
				["abbreviateAbilities"] = true,
				["cooldownThreshold"] = 20,
				["creationVersion"] = MikSBT.VERSION.."."..MikSBT.SVN_REVISION,
				["scrollAreas"] = {
					["Outgoing"] = {
						["stickyTextAlignIndex"] = 3,
						["stickyBehavior"] = "MSBT_NORMAL",
						["direction"] = "Up",
						["stickyDirection"] = "Up",
						["scrollHeight"] = 130,
						["offsetX"] = 270,
						["textAlignIndex"] = 3,
						["behavior"] = "MSBT_NORMAL",
						["offsetY"] = 0,
						["animationStyle"] = "Static",
						["stickyAnimationStyle"] = "Static",
					},
					["Static"] = {
						["stickyDirection"] = "Down",
						["scrollHeight"] = 70,
						["offsetY"] = 100,
						["stickyAnimationStyle"] = "Static",
					},
					["Notification"] = {
						["stickyDirection"] = "Down",
						["scrollHeight"] = 100,
						["direction"] = "Down",
						["offsetY"] = 250,
						["animationStyle"] = "Static",
						["stickyAnimationStyle"] = "Static",
					},
					["Incoming"] = {
						["stickyTextAlignIndex"] = 1,
						["behavior"] = "MSBT_NORMAL",
						["scrollHeight"] = 130,
						["offsetX"] = -300,
						["stickyBehavior"] = "Normal",
						["textAlignIndex"] = 1,
						["offsetY"] = 0,
						["animationStyle"] = "Static",
						["direction"] = "Up",
					},
				},
				["triggers"] = {
					["MSBT_TRIGGER_KILL_SHOT"] = {
						["fontSize"] = false,
					},
					["MSBT_TRIGGER_DECIMATION"] = {
						["fontSize"] = false,
					},
					["MSBT_TRIGGER_BACKLASH"] = {
						["fontSize"] = false,
					},
					["MSBT_TRIGGER_BERSERK"] = {
						["fontSize"] = false,
					},
					["MSBT_TRIGGER_OVERPOWER"] = {
						["fontSize"] = false,
					},
					["MSBT_TRIGGER_SWORD_AND_BOARD"] = {
						["fontSize"] = false,
					},
					["MSBT_TRIGGER_RIME"] = {
						["fontSize"] = false,
					},
					["MSBT_TRIGGER_THE_ART_OF_WAR"] = {
						["fontSize"] = false,
					},
					["MSBT_TRIGGER_VITAL_MISTS"] = {
						["fontSize"] = false,
					},
					["MSBT_TRIGGER_FINGERS_OF_FROST"] = {
						["fontSize"] = false,
					},
					["MSBT_TRIGGER_MANA_TEA"] = {
						["fontSize"] = false,
					},
					["MSBT_TRIGGER_BLINDSIDE"] = {
						["fontSize"] = false,
					},
					["MSBT_TRIGGER_EXECUTE"] = {
						["fontSize"] = false,
					},
					["MSBT_TRIGGER_LOW_HEALTH"] = {
						["fontSize"] = false,
					},
					["MSBT_TRIGGER_MAELSTROM_WEAPON"] = {
						["fontSize"] = false,
					},
					["MSBT_TRIGGER_LOCK_AND_LOAD"] = {
						["fontSize"] = false,
					},
					["MSBT_TRIGGER_TIDAL_WAVES"] = {
						["fontSize"] = false,
					},
					["MSBT_TRIGGER_LOW_MANA"] = {
						["exceptions"] = "recentlyFired;;lt;;10",
						["fontSize"] = false,
						["mainEvents"] = "UNIT_POWER{powerType;;eq;;0;;unitID;;eq;;player;;threshold;;lt;;15}",
					},
					["MSBT_TRIGGER_ULTIMATUM"] = {
						["fontSize"] = false,
					},
					["MSBT_TRIGGER_TASTE_FOR_BLOOD"] = {
						["fontSize"] = false,
					},
					["MSBT_TRIGGER_NIGHTFALL"] = {
						["fontSize"] = false,
					},
					["MSBT_TRIGGER_PVP_TRINKET"] = {
						["fontSize"] = false,
					},
					["MSBT_TRIGGER_LAVA_SURGE"] = {
						["fontSize"] = false,
					},
					["MSBT_TRIGGER_SUDDEN_DEATH"] = {
						["fontSize"] = false,
					},
					["MSBT_TRIGGER_ECLIPSE_LUNAR"] = {
						["fontSize"] = false,
					},
					["MSBT_TRIGGER_OWLKIN_FRENZY"] = {
						["fontSize"] = false,
					},
					["MSBT_TRIGGER_KILLING_MACHINE"] = {
						["fontSize"] = false,
					},
					["MSBT_TRIGGER_SHOOTING_STARS"] = {
						["fontSize"] = false,
					},
					["MSBT_TRIGGER_BLOODSURGE"] = {
						["fontSize"] = false,
					},
					["MSBT_TRIGGER_MOLTEN_CORE"] = {
						["fontSize"] = false,
					},
					["MSBT_TRIGGER_ECLIPSE_SOLAR"] = {
						["fontSize"] = false,
					},
					["MSBT_TRIGGER_MISSILE_BARRAGE"] = {
						["fontSize"] = false,
					},
					["MSBT_TRIGGER_VICTORY_RUSH"] = {
						["fontSize"] = false,
					},
					["MSBT_TRIGGER_SHADOW_INFUSION"] = {
						["fontSize"] = false,
					},
					["MSBT_TRIGGER_CLEARCASTING"] = {
						["fontSize"] = false,
					},
					["MSBT_TRIGGER_LOW_PET_HEALTH"] = {
						["fontSize"] = false,
					},
					["MSBT_TRIGGER_ELUSIVE_BREW"] = {
						["fontSize"] = false,
					},
					["MSBT_TRIGGER_RUNE_STRIKE"] = {
						["fontSize"] = false,
					},
					["MSBT_TRIGGER_HAMMER_OF_WRATH"] = {
						["fontSize"] = false,
					},
					["MSBT_TRIGGER_REVENGE"] = {
						["fontSize"] = false,
					},
					["MSBT_TRIGGER_POWER_GUARD"] = {
						["fontSize"] = false,
					},
					["MSBT_TRIGGER_BRAIN_FREEZE"] = {
						["fontSize"] = false,
					},
					["MSBT_TRIGGER_PREDATORS_SWIFTNESS"] = {
						["fontSize"] = false,
					},
				},
				["events"] = {
					["NOTIFICATION_PC_KILLING_BLOW"] = {
						["fontSize"] = false,
					},
					["NOTIFICATION_BUFF_FADE"] = {
						["disabled"] = true,
					},
					["NOTIFICATION_ITEM_BUFF_FADE"] = {
						["disabled"] = true,
					},
					["NOTIFICATION_BUFF"] = {
						["disabled"] = true,
					},
					["INCOMING_HEAL_CRIT"] = {
						["fontSize"] = false,
					},
					["NOTIFICATION_ITEM_COOLDOWN"] = {
						["fontSize"] = false,
					},
					["OUTGOING_HEAL_CRIT"] = {
						["fontSize"] = false,
					},
					["OUTGOING_SPELL_EVADE"] = {
						["fontSize"] = false,
					},
					["NOTIFICATION_SHADOW_ORBS_FULL"] = {
						["fontSize"] = false,
					},
					["NOTIFICATION_HOLY_POWER_FULL"] = {
						["fontSize"] = false,
					},
					["PET_OUTGOING_HEAL_CRIT"] = {
						["fontSize"] = false,
					},
					["NOTIFICATION_COOLDOWN"] = {
						["fontSize"] = false,
					},
					["NOTIFICATION_EXTRA_ATTACK"] = {
						["fontSize"] = false,
					},
					["NOTIFICATION_SHADOW_ORBS_CHANGE"] = {
						["disabled"] = true,
					},
					["NOTIFICATION_CP_FULL"] = {
						["fontSize"] = false,
					},
					["NOTIFICATION_BUFF_STACK"] = {
						["disabled"] = true,
					},
					["NOTIFICATION_PET_COOLDOWN"] = {
						["disabled"] = true,
						["fontSize"] = false,
					},
					["NOTIFICATION_DEBUFF_FADE"] = {
						["disabled"] = true,
					},
					["NOTIFICATION_CHI_FULL"] = {
						["fontSize"] = false,
					},
					["NOTIFICATION_ITEM_BUFF"] = {
						["disabled"] = true,
					},
				},
			}
		else
			CNB:Print(L["The AddOn 'MikScrollingBattleText' is not enabled. Profile not created."])
			CodeNameBlazeInstallStepComplete.message = L["MSBT is not enabled, aborting."]
			CodeNameBlazeInstallStepComplete:Show()
		end
	end
end

function CNB:SetupAddOnSkins(addon)
	if IsAddOnLoaded('AddOnSkins') then
		if addon == 'Skada' then
			CNB:Print(L["Skada settings for AddOnSkins have been set."])
			CodeNameBlazeInstallStepComplete.message = L["Skada settings for AddOnSkins have been set."]
			CodeNameBlazeInstallStepComplete:Show()
    		E.private['addonskins']['EmbedSystem'] = false
			E.private['addonskins']['EmbedSystemDual'] = true
			E.private['addonskins']['EmbedBelowTop'] = true
			E.private['addonskins']['TransparentEmbed'] = true
			E.private['addonskins']['EmbedMain'] = 'Skada'
			E.private['addonskins']['EmbedLeft'] = 'Skada'
			E.private['addonskins']['EmbedRight'] = 'Skada'
			E.private['addonskins']['EmbedLeftWidth'] = 128
		elseif addon == 'DBM' then
			CNB:Print(L["DBM settings for AddOnSkins have been set."])
			CodeNameBlazeInstallStepComplete.message = L["DBM settings for AddOnSkins have been set."]
			CodeNameBlazeInstallStepComplete:Show()
			E.private['addonskins']['DBMFont'] = 'PF T 7 Ext. Bold'
			E.private['addonskins']['DBMFontSize'] = 8
			E.private['addonskins']['DBMFontFlag'] = 'MONOCHROMEOUTLINE'
		end
	else
		CNB:Print(L["The AddOn 'AddOnSkins' is not enabled. No settings have been changed."])
		CodeNameBlazeInstallStepComplete.message = L["AddOnSkins is not enabled, aborting."]
		CodeNameBlazeInstallStepComplete:Show()
	end
end
local function InstallComplete()
	E.db.CNB.install_version = CNB.version

	if GetCVarBool("Sound_EnableMusic") then
		StopMusic()
	end

	ReloadUI()
end

local function ResetAll()
	CodeNameBlazeInstallNextButton:Disable()
	CodeNameBlazeInstallPrevButton:Disable()
	CodeNameBlazeInstallOption1Button:Hide()
	CodeNameBlazeInstallOption1Button:SetScript("OnClick", nil)
	CodeNameBlazeInstallOption1Button:SetText("")
	CodeNameBlazeInstallOption2Button:Hide()
	CodeNameBlazeInstallOption2Button:SetScript('OnClick', nil)
	CodeNameBlazeInstallOption2Button:SetText('')
	CodeNameBlazeInstallOption3Button:Hide()
	CodeNameBlazeInstallOption3Button:SetScript('OnClick', nil)
	CodeNameBlazeInstallOption3Button:SetText('')
	CodeNameBlazeInstallOption4Button:Hide()
	CodeNameBlazeInstallOption4Button:SetScript('OnClick', nil)
	CodeNameBlazeInstallOption4Button:SetText('')
	CodeNameBlazeInstallFrame.SubTitle:SetText("")
	CodeNameBlazeInstallFrame.Desc1:SetText("")
	CodeNameBlazeInstallFrame.Desc2:SetText("")
	CodeNameBlazeInstallFrame.Desc3:SetText("")
end

local function SetPage(PageNum)
	CURRENT_PAGE = PageNum
	ResetAll()
	CodeNameBlazeInstallStatus:SetValue(PageNum)

	local f = CodeNameBlazeInstallFrame

	if PageNum == MAX_PAGE then
		CodeNameBlazeInstallNextButton:Disable()
	else
		CodeNameBlazeInstallNextButton:Enable()
	end

	if PageNum == 1 then
		CodeNameBlazeInstallPrevButton:Disable()
	else
		CodeNameBlazeInstallPrevButton:Enable()
	end

	if PageNum == 1 then
		f.SubTitle:SetText(format(L["Welcome to %s version %s, \nfor ElvUI version %s and above."], CNB.title, CNB:ColorStr(CNB.version), CNB:ColorStr(CNB.versionMinE)))
		f.Desc1:SetText(L["This installation process will guide you through a few steps and apply settings to your current ElvUI profile.\nIf you want to be able to go back to your original settings, create a new ElvUI profile (/ec -> Profiles) before going through this installation process."])
		f.Desc2:SetText(format(L["Options provided by this edit can be found in the %s category of the ElvUI Config (/ec)."], CNB.title))
		f.Desc3:SetText(L["Please press the continue button if you wish to go through the installation process, otherwise click the 'Skip Process' button."])
		CodeNameBlazeInstallOption1Button:Show()
		CodeNameBlazeInstallOption1Button:SetScript("OnClick", InstallComplete)
		CodeNameBlazeInstallOption1Button:SetText(L["Skip Process"])
	elseif PageNum == 2 then
		f.SubTitle:SetText(L["CVars"])
		f.Desc1:SetText(format(L["This step changes a few World of Warcraft default options. These options are tailored to the needs of the author of %s and are not necessary for this edit to function."], CNB.title))
		f.Desc2:SetText(L["Please click the button below to setup your CVars."])
		f.Desc3:SetText(L["Importance: |cffFF0000Low|r"])
		CodeNameBlazeInstallOption1Button:Show()
		CodeNameBlazeInstallOption1Button:SetScript("OnClick", SetupCVars)
		CodeNameBlazeInstallOption1Button:SetText(L["Setup CVars"])
	elseif PageNum == 3 then
		f.SubTitle:SetText(L["Chat"])
		f.Desc1:SetText(format(L["This step changes your chat windows and positions them all in the left chat panel. These changes are tailored to the needs of the author of %s and are not necessary for this edit to function."], CNB.title))
		f.Desc2:SetText(L["Please click the button below to setup your chat windows."])
		f.Desc3:SetText(L["Importance: |cffFF0000Low|r"])
		CodeNameBlazeInstallOption1Button:Show()
		CodeNameBlazeInstallOption1Button:SetScript("OnClick", SetupChat)
		CodeNameBlazeInstallOption1Button:SetText(L["Setup Chat"])
	elseif PageNum == 4 then
		f.SubTitle:SetText(L["Layout"])
		f.Desc1:SetText(format(L["This step allows you to apply different settings and positions of elements based on the role of your character. This step will change various settings for all ElvUI modules. You need to complete this step if you want your UI to look similar to previews of %s."], CNB.title))
		f.Desc2:SetText(L["Please click any one button below to apply the layout of your choosing."])
		f.Desc3:SetText(L["Importance: |cff07D400High|r"])
		CodeNameBlazeInstallOption1Button:Show()
		CodeNameBlazeInstallOption1Button:SetScript('OnClick', function() CNB:SetupLayout('tank') end)
		CodeNameBlazeInstallOption1Button:SetText(L['Tank'])
		CodeNameBlazeInstallOption2Button:Show()
		CodeNameBlazeInstallOption2Button:SetScript('OnClick', function() CNB:SetupLayout('healer') end)
		CodeNameBlazeInstallOption2Button:SetText(L['Healer'])
		CodeNameBlazeInstallOption3Button:Show()
		CodeNameBlazeInstallOption3Button:SetScript('OnClick', function() CNB:SetupLayout('dpsMelee') end)
		CodeNameBlazeInstallOption3Button:SetText(L['Physical DPS'])
		CodeNameBlazeInstallOption4Button:Show()
		CodeNameBlazeInstallOption4Button:SetScript('OnClick', function() CNB:SetupLayout('dpsCaster') end)
		CodeNameBlazeInstallOption4Button:SetText(L['Caster DPS'])
	elseif PageNum == 5 then
		f.SubTitle:SetText(L["Positions"])
		f.Desc1:SetText(format(L["This step repositions various elements based on your resolution. Your current resolution is %s, this is considered a %s resolution. You need to complete this step if you want your UI to look similar to previews of %s."], E.resolution, E.screenwidth < 1920 and CNB:ColorStr(L["low"]) or CNB:ColorStr(L["high"]), CNB.title))
		f.Desc2:SetText(format(L["Click the button that matches your resolution. %s will then re-position (and resize if using low resolution) various elements according to the chosen resolution. If you use a resolution lower than 1920x1080 then you should choose 'Low Resolution'"], CNB.title))
		f.Desc3:SetText(L["Importance: |cff07D400High|r"])
		CodeNameBlazeInstallOption1Button:Show()
		CodeNameBlazeInstallOption1Button:SetScript('OnClick', function() CNB:SetPositions("high", E.db.CNB.chosenLayout) end)
		CodeNameBlazeInstallOption1Button:SetText(L["High Resolution"])
		CodeNameBlazeInstallOption2Button:Show()
		CodeNameBlazeInstallOption2Button:SetScript('OnClick', function() CNB:SetPositions("low", E.db.CNB.chosenLayout) end)
		CodeNameBlazeInstallOption2Button:SetText(L['Low Resolution'])
	elseif PageNum == 6 then
		f.SubTitle:SetText(L["AddOns"])
		f.Desc1:SetFormattedText(L["This step allows you to apply pre-configured settings to various AddOns in order to make their appearance match %s."], CNB.title)
		f.Desc2:SetFormattedText(L["Please click any button below to apply the pre-configured settings for that particular AddOn. A new profile named %s will be created for that particular addon, which you will have to select manually."], CNB.title)
		CodeNameBlazeInstallOption1Button:Show()
		CodeNameBlazeInstallOption1Button:SetScript('OnClick', function() CNB:SetupAddon('DBM') end)
		CodeNameBlazeInstallOption1Button:SetText('Deadly Boss Mods')
		CodeNameBlazeInstallOption2Button:Show()
		CodeNameBlazeInstallOption2Button:SetScript('OnClick', function() CNB:SetupAddon('Skada') end)
		CodeNameBlazeInstallOption2Button:SetText('Skada')
		CodeNameBlazeInstallOption3Button:Show()
		CodeNameBlazeInstallOption3Button:SetScript('OnClick', function() CNB:SetupAddon('MSBT') end)
		CodeNameBlazeInstallOption3Button:SetText("Mik's Scrolling Battle Text")
		CodeNameBlazeInstallOption1Button:SetWidth(140)
		CodeNameBlazeInstallOption2Button:SetWidth(70)
		CodeNameBlazeInstallOption3Button:SetWidth(180)
	elseif PageNum == 7 then
		f.SubTitle:SetText(L["AddOnSkins Configuration"])
		f.Desc1:SetFormattedText(L["This step allows you to apply pre-configured settings to AddOnSkins in order to make certain AddOns match %s."], CNB.title)
		f.Desc2:SetText(L["Please click any button below to apply the pre-configured settings for that particular AddOn to the AddOnSkins settings."])
		CodeNameBlazeInstallOption1Button:Show()
		CodeNameBlazeInstallOption1Button:SetScript('OnClick', function() CNB:SetupAddOnSkins('Skada') end)
		CodeNameBlazeInstallOption1Button:SetText('Skada')
		CodeNameBlazeInstallOption2Button:Show()
		CodeNameBlazeInstallOption2Button:SetScript('OnClick', function() CNB:SetupAddOnSkins('DBM') end)
		CodeNameBlazeInstallOption2Button:SetText('Deadly Boss Mods')
		CodeNameBlazeInstallOption1Button:SetWidth(70)
		CodeNameBlazeInstallOption2Button:SetWidth(140)
	elseif PageNum == 8 then
		f.SubTitle:SetText(L["Installation Complete"])
		f.Desc1:SetText(L["You have completed the installation process.\nIf you need help or wish to report a bug, please go to http://tukui.org"])
		f.Desc2:SetText(L["Please click the button below in order to finalize the process and automatically reload your UI."])
		CodeNameBlazeInstallOption1Button:Show()
		CodeNameBlazeInstallOption1Button:SetScript("OnClick", InstallComplete)
		CodeNameBlazeInstallOption1Button:SetText(L["Finished"])
	end
end

local function NextPage()
	if CURRENT_PAGE ~= MAX_PAGE then
		CURRENT_PAGE = CURRENT_PAGE + 1
		SetPage(CURRENT_PAGE)
	end
end

local function PreviousPage()
	if CURRENT_PAGE ~= 1 then
		CURRENT_PAGE = CURRENT_PAGE - 1
		SetPage(CURRENT_PAGE)
	end
end

function CNB:RunSetup()
	if not CodeNameBlazeInstallStepComplete then
		local imsg = CreateFrame("Frame", "CodeNameBlazeInstallStepComplete", E.UIParent)
		imsg:Size(418, 72)
		imsg:Point("TOP", 0, -190)
		imsg:Hide()
		imsg:SetScript('OnShow', function(self)
			if self.message then
				PlaySoundFile([[Sound\Interface\LevelUp.wav]])
				self.text:SetText(self.message)
				UIFrameFadeOut(self, 3.5, 1, 0)
				E:Delay(4, function() self:Hide() end)
				self.message = nil

				if imsg.firstShow == false then
					if GetCVarBool("Sound_EnableMusic") then
						PlayMusic([[Sound\Music\ZoneMusic\DMF_L70ETC01.mp3]])
					end
					imsg.firstShow = true
				end
			else
				self:Hide()
			end
		end)

		imsg.firstShow = false

		imsg.bg = imsg:CreateTexture(nil, 'BACKGROUND')
		imsg.bg:SetTexture([[Interface\LevelUp\LevelUpTex]])
		imsg.bg:SetPoint('BOTTOM')
		imsg.bg:Size(326, 103)
		imsg.bg:SetTexCoord(0.00195313, 0.63867188, 0.03710938, 0.23828125)
		imsg.bg:SetVertexColor(1, 1, 1, 0.6)

		imsg.lineTop = imsg:CreateTexture(nil, 'BACKGROUND')
		imsg.lineTop:SetDrawLayer('BACKGROUND', 2)
		imsg.lineTop:SetTexture([[Interface\LevelUp\LevelUpTex]])
		imsg.lineTop:SetPoint("TOP")
		imsg.lineTop:Size(418, 7)
		imsg.lineTop:SetTexCoord(0.00195313, 0.81835938, 0.01953125, 0.03320313)

		imsg.lineBottom = imsg:CreateTexture(nil, 'BACKGROUND')
		imsg.lineBottom:SetDrawLayer('BACKGROUND', 2)
		imsg.lineBottom:SetTexture([[Interface\LevelUp\LevelUpTex]])
		imsg.lineBottom:SetPoint("BOTTOM")
		imsg.lineBottom:Size(418, 7)
		imsg.lineBottom:SetTexCoord(0.00195313, 0.81835938, 0.01953125, 0.03320313)

		imsg.text = imsg:CreateFontString(nil, 'ARTWORK', 'GameFont_Gigantic')
		imsg.text:Point("BOTTOM", 0, 12)
		imsg.text:SetTextColor(1, 0.82, 0)
		imsg.text:SetJustifyH("CENTER")
	end

	--Create Frame
	if not CodeNameBlazeInstallFrame then
		local f = CreateFrame("Button", "CodeNameBlazeInstallFrame", E.UIParent)
		f.SetPage = SetPage
		f:Size(650, 450)
		f:SetTemplate("Transparent")
		f:SetPoint("CENTER")
		f:SetFrameStrata('TOOLTIP')

		f.Title = f:CreateFontString(nil, 'OVERLAY')
		f.Title:FontTemplate(nil, 17, nil)
		f.Title:Point("TOP", 0, -5)
		f.Title:SetText(CNB.title..' '..L["Installation"])

		f.Next = CreateFrame("Button", "CodeNameBlazeInstallNextButton", f, "UIPanelButtonTemplate")
		f.Next:StripTextures()
		f.Next:SetTemplate("Default", true)
		f.Next:Size(110, 25)
		f.Next:Point("BOTTOMRIGHT", -5, 5)
		f.Next:SetText(CONTINUE)
		f.Next:Disable()
		f.Next:SetScript("OnClick", NextPage)
		E.Skins:HandleButton(f.Next, true)

		f.Prev = CreateFrame("Button", "CodeNameBlazeInstallPrevButton", f, "UIPanelButtonTemplate")
		f.Prev:StripTextures()
		f.Prev:SetTemplate("Default", true)
		f.Prev:Size(110, 25)
		f.Prev:Point("BOTTOMLEFT", 5, 5)
		f.Prev:SetText(PREVIOUS)
		f.Prev:Disable()
		f.Prev:SetScript("OnClick", PreviousPage)
		E.Skins:HandleButton(f.Prev, true)

		f.Status = CreateFrame("StatusBar", "CodeNameBlazeInstallStatus", f)
		f.Status:SetFrameLevel(f.Status:GetFrameLevel() + 2)
		f.Status:CreateBackdrop("Default")
		f.Status:SetStatusBarTexture(E["media"].normTex)
		f.Status:SetStatusBarColor(unpack(E["media"].rgbvaluecolor))
		f.Status:SetMinMaxValues(0, MAX_PAGE)
		f.Status:Point("TOPLEFT", f.Prev, "TOPRIGHT", 6, -2)
		f.Status:Point("BOTTOMRIGHT", f.Next, "BOTTOMLEFT", -6, 2)
		f.Status.text = f.Status:CreateFontString(nil, 'OVERLAY')
		f.Status.text:FontTemplate()
		f.Status.text:SetPoint("CENTER")
		f.Status.text:SetText(CURRENT_PAGE.." / "..MAX_PAGE)
		f.Status:SetScript("OnValueChanged", function(self)
			self.text:SetText(self:GetValue().." / "..MAX_PAGE)
		end)

		f.Option1 = CreateFrame("Button", "CodeNameBlazeInstallOption1Button", f, "UIPanelButtonTemplate")
		f.Option1:StripTextures()
		f.Option1:Size(160, 30)
		f.Option1:Point("BOTTOM", 0, 45)
		f.Option1:SetText("")
		f.Option1:Hide()
		E.Skins:HandleButton(f.Option1, true)

		f.Option2 = CreateFrame("Button", "CodeNameBlazeInstallOption2Button", f, "UIPanelButtonTemplate")
		f.Option2:StripTextures()
		f.Option2:Size(110, 30)
		f.Option2:Point('BOTTOMLEFT', f, 'BOTTOM', 4, 45)
		f.Option2:SetText("")
		f.Option2:Hide()
		f.Option2:SetScript('OnShow', function() f.Option1:SetWidth(110); f.Option1:ClearAllPoints(); f.Option1:Point('BOTTOMRIGHT', f, 'BOTTOM', -4, 45) end)
		f.Option2:SetScript('OnHide', function() f.Option1:SetWidth(160); f.Option1:ClearAllPoints(); f.Option1:Point("BOTTOM", 0, 45) end)
		E.Skins:HandleButton(f.Option2, true)

		f.Option3 = CreateFrame("Button", "CodeNameBlazeInstallOption3Button", f, "UIPanelButtonTemplate")
		f.Option3:StripTextures()
		f.Option3:Size(100, 30)
		f.Option3:Point('LEFT', f.Option2, 'RIGHT', 4, 0)
		f.Option3:SetText("")
		f.Option3:Hide()
		f.Option3:SetScript('OnShow', function() f.Option1:SetWidth(100); f.Option1:ClearAllPoints(); f.Option1:Point('RIGHT', f.Option2, 'LEFT', -4, 0); f.Option2:SetWidth(100); f.Option2:ClearAllPoints(); f.Option2:Point('BOTTOM', f, 'BOTTOM', 0, 45)  end)
		f.Option3:SetScript('OnHide', function() f.Option1:SetWidth(160); f.Option1:ClearAllPoints(); f.Option1:Point("BOTTOM", 0, 45); f.Option2:SetWidth(110); f.Option2:ClearAllPoints(); f.Option2:Point('BOTTOMLEFT', f, 'BOTTOM', 4, 45) end)
		E.Skins:HandleButton(f.Option3, true)

		f.Option4 = CreateFrame("Button", "CodeNameBlazeInstallOption4Button", f, "UIPanelButtonTemplate")
		f.Option4:StripTextures()
		f.Option4:Size(100, 30)
		f.Option4:Point('LEFT', f.Option3, 'RIGHT', 4, 0)
		f.Option4:SetText("")
		f.Option4:Hide()
		f.Option4:SetScript('OnShow', function()
			f.Option1:Width(100)
			f.Option2:Width(100)

			f.Option1:ClearAllPoints();
			f.Option1:Point('RIGHT', f.Option2, 'LEFT', -4, 0);
			f.Option2:ClearAllPoints();
			f.Option2:Point('BOTTOMRIGHT', f, 'BOTTOM', -4, 45)
		end)
		f.Option4:SetScript('OnHide', function() f.Option1:SetWidth(160); f.Option1:ClearAllPoints(); f.Option1:Point("BOTTOM", 0, 45); f.Option2:SetWidth(110); f.Option2:ClearAllPoints(); f.Option2:Point('BOTTOMLEFT', f, 'BOTTOM', 4, 45) end)
		E.Skins:HandleButton(f.Option4, true)

		f.SubTitle = f:CreateFontString(nil, 'OVERLAY')
		f.SubTitle:FontTemplate(nil, 15, nil)
		f.SubTitle:Point("TOP", 0, -40)

		f.Desc1 = f:CreateFontString(nil, 'OVERLAY')
		f.Desc1:FontTemplate()
		f.Desc1:Point("TOPLEFT", 20, -75)
		f.Desc1:Width(f:GetWidth() - 40)

		f.Desc2 = f:CreateFontString(nil, 'OVERLAY')
		f.Desc2:FontTemplate()
		f.Desc2:Point("TOPLEFT", 20, -125)
		f.Desc2:Width(f:GetWidth() - 40)

		f.Desc3 = f:CreateFontString(nil, 'OVERLAY')
		f.Desc3:FontTemplate()
		f.Desc3:Point("TOPLEFT", 20, -175)
		f.Desc3:Width(f:GetWidth() - 40)

		local close = CreateFrame("Button", "CodeNameBlazeInstallCloseButton", f, "UIPanelCloseButton")
		close:SetPoint("TOPRIGHT", f, "TOPRIGHT")
		close:SetScript("OnClick", function()
			f:Hide()
		end)
		E.Skins:HandleCloseButton(close)

		f.tutorialImage = f:CreateTexture('CodeNameBlazeInstallTutorialImage', 'OVERLAY')
		f.tutorialImage:Size(512, 256)
		f.tutorialImage:SetTexture('Interface\\AddOns\\ElvUI_CodeNameBlaze\\media\\textures\\logo_cnb.tga')
		f.tutorialImage:Point('BOTTOM', 0, 40)

	end

	CodeNameBlazeInstallFrame:Show()
	NextPage()
end