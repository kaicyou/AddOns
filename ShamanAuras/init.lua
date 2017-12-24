local FOLDER_NAME, Engine = ...

local SSA = {}
local Auras = LibStub('AceAddon-3.0'):NewAddon('ShamanAuras', 'AceConsole-3.0','AceEvent-3.0', 'AceHook-3.0', 'AceTimer-3.0');
Auras.version = GetAddOnMetadata('ShamanAuras', 'Version')
Auras:RegisterChatCommand('ssa','ChatCommand')
local L = LibStub('AceLocale-3.0'):GetLocale('ShamanAuras', false)
local LSM = LibStub('LibSharedMedia-3.0')
local LBG = LibStub("LibButtonGlow-1.0")

Engine[1] = SSA
Engine[2] = Auras
Engine[3] = L
Engine[4] = LSM
Engine[5] = LBG

-- Cache Global Variables
-- Lua Function
local sub = string.sub
-- WoW API / Variables
local CreateFont, CreateFrame = CreateFont, CreateFrame
local GetSpecialization, GetSpecializationInfo = GetSpecialization, GetSpecializationInfo
local GetSpellCooldown = GetSpellCooldown
local GetTime = GetTime
local UnitCastingInfo, UnitChannelInfo = UnitCastingInfo, UnitChannelInfo


-------------------------------------------------------------------------------------------------------
----- Initialize Global Variables
-------------------------------------------------------------------------------------------------------
SSA.BackdropCB = {
	bgFile    = [[Interface\Tooltips\UI-Tooltip-Background]],
	edgeFile  = [[Interface\AddOns\ShamanAuras\Media\textures\UI-Tooltip-Border]],
	tile      = false,
	tileSize  = 16, 
	edgeSize  = 16, 
	insets     = {
		left = 4,
		right = 4,
		top = 4,
		bottom = 4,
	},
}

SSA.BackdropSB = {
	bgFile   = [[Interface\Tooltips\UI-Tooltip-Background]],
	edgeFile = [[Interface\Tooltips\UI-Tooltip-Border]],
	tile = true,
	tileSize = 16,
	edgeSize = 10
}
SSA.BackdropFrm = {
	bgFile   = [[Interface\BUTTONS\WHITE8X8.blp]],
	edgeFile = [[Interface\BUTTONS\WHITE8X8.blp]],
	tile = false, tileSize = 0, edgeSize = 1,
	insets = { left = 0, right = 0, top = 0, bottom = 0}
}

SSA.grid = CreateFrame('Frame', 'AuraGrid', UIParent)
--SSA.IsMovingAuras = false;
SSA.ButtonFont = CreateFont('SSAButtonFont')
local ButtonFont = SSA.ButtonFont
ButtonFont:SetFont([[Interface\addons\ShamanAuras\Media\fonts\Continuum_Medium.ttf]],12,'OUTLINE')
ButtonFont:SetJustifyH('CENTER')

local Frame = CreateFrame('Frame')
local UpdateFrame = CreateFrame('Frame')

------------------------------
--- For Debugging Purposes ---
------------------------------

SSA.ErrorFrame = CreateFrame('Frame',nil,UIParent)
_G['SSA_ErrorFrame'] = SSA.ErrorFrame
local ErrorFrame = SSA.ErrorFrame
ErrorFrame:SetWidth(260)
ErrorFrame:SetHeight(665)
ErrorFrame:SetPoint('TOPLEFT',UIParent,'TOPLEFT',100,-100)
ErrorFrame:SetBackdrop(SSA.BackdropSB)
ErrorFrame:SetBackdropColor(0.15,0.15,0.15,0.9)
ErrorFrame:SetBackdropBorderColor(1,1,1,1)
ErrorFrame:Hide()

ErrorFrame.text = ErrorFrame:CreateFontString(nil, 'MEDIUM', 'GameFontHighlightLarge')
ErrorFrame.text:SetPoint('TOPLEFT',11,-5)
ErrorFrame.text:SetFont([[Interface\addons\ShamanAurasDev\Media\fonts\courbd.ttf]], 14,'NONE')
ErrorFrame.text:SetTextColor(1,1,1,1)
ErrorFrame.text:SetJustifyH('LEFT')

------------------------------
--- For Debugging Purposes ---
------------------------------
local DataFrame = CreateFrame('Frame',nil,UIParent)
DataFrame:SetWidth(700)
DataFrame:SetHeight(300)
DataFrame:SetPoint('TOPLEFT',UIParent,'TOPLEFT',100,-100)
DataFrame:SetBackdrop(SSA.BackdropSB)
DataFrame:SetBackdropColor(0.15,0.15,0.15,0.9)
DataFrame:SetBackdropBorderColor(1,1,1,1)
DataFrame:Hide()

DataFrame.text = DataFrame:CreateFontString(nil, 'MEDIUM', 'GameFontHighlightLarge')
DataFrame.text:SetPoint('TOPLEFT',11,-5);
DataFrame.text:SetFont([[Interface\addons\ShamanAurasDev\Media\fonts\courbd.ttf]] or LSM.DefaultMedia.font, 14,'NONE')
DataFrame.text:SetTextColor(1,1,1,1)
DataFrame.text:SetJustifyH('LEFT')

SSA.DataFrame = DataFrame
_G['SSA_DataFrame'] = DataFrame

-- Initialize Check Button Frames
SSA.MoveEle = CreateFrame('Frame','MoveEle',UIParent)
SSA.MoveEnh = CreateFrame('Frame','MoveEnh',UIParent)
SSA.MoveRes = CreateFrame('Frame','MoveRes',UIParent)

local function ResetAdjustable()
	local db = Auras.db.char

	db.elements[1].cooldowns.adjust = false
	db.elements[1].cooldowns.primary[1].isPreview = false
	db.elements[1].cooldowns.primary[2].isPreview = false
	db.elements[1].cooldowns.primary[2].isPreview = false
	db.elements[1].cooldowns.secondary[1].isPreview = false
	db.elements[1].cooldowns.secondary[2].isPreview = false
	--db.elements[1].statusbars.healthBar.adjust.isEnabled = false
	--db.elements[1].statusbars.healthBar.adjust.showBG = false
	db.elements[1].statusbars.maelstromBar.adjust.isEnabled = false
	db.elements[1].statusbars.maelstromBar.adjust.showBG = false
	db.elements[1].statusbars.castBar.adjust.isEnabled = false
	db.elements[1].statusbars.castBar.adjust.showBG = false
	db.elements[1].statusbars.channelBar.adjust.isEnabled = false
	db.elements[1].statusbars.channelBar.adjust.showBG = false
	db.elements[1].statusbars.icefuryBar.adjust.isEnabled = false
	db.elements[1].statusbars.icefuryBar.adjust.showBG = false
	db.elements[1].statusbars.icefuryBar.adjust.showTimer = false
	
	db.elements[2].cooldowns.adjust = false
	db.elements[2].cooldowns.primary[1].isPreview = false
	db.elements[2].cooldowns.primary[2].isPreview = false
	db.elements[2].cooldowns.primary[2].isPreview = false
	db.elements[2].cooldowns.secondary[1].isPreview = false
	db.elements[2].cooldowns.secondary[2].isPreview = false
	db.elements[2].statusbars.maelstromBar.adjust.isEnabled = false
	db.elements[2].statusbars.maelstromBar.adjust.showBG = false
	db.elements[2].statusbars.castBar.adjust.isEnabled = false
	db.elements[2].statusbars.castBar.adjust.showBG = false
	db.elements[2].statusbars.channelBar.adjust.isEnabled = false
	db.elements[2].statusbars.channelBar.adjust.showBG = false
	
	db.elements[3].cooldowns.adjust = false
	db.elements[3].cooldowns.primary[1].isPreview = false
	db.elements[3].cooldowns.primary[2].isPreview = false
	db.elements[3].cooldowns.primary[2].isPreview = false
	db.elements[3].cooldowns.secondary[1].isPreview = false
	db.elements[3].cooldowns.secondary[2].isPreview = false
	db.elements[3].statusbars.earthenShieldBar.adjust.isEnabled = false
	db.elements[3].statusbars.earthenShieldBar.adjust.showBG = false
	db.elements[3].statusbars.earthenShieldBar.adjust.showTimer = false
	db.elements[3].statusbars.tidalWavesBar.adjust.isEnabled = false
	db.elements[3].statusbars.manaBar.adjust.isEnabled = false
	db.elements[3].statusbars.manaBar.adjust.showBG = false
	db.elements[3].statusbars.castBar.adjust.isEnabled = false
	db.elements[3].statusbars.castBar.adjust.showBG = false
	db.elements[3].statusbars.channelBar.adjust.isEnabled = false
	db.elements[3].statusbars.channelBar.adjust.showBG = false
end

local function ResetMovable()
	local db = Auras.db.char
	
	db.elements[1].isMoving = false 
	db.elements[2].isMoving = false
	db.elements[3].isMoving = false
end

-- Event: ADDON_LOADED
function Auras:OnInitialize()

	local defaults = SSA.defaults;
	local about_panel = LibStub:GetLibrary("LibAboutPanel", true)

	if about_panel then
		self.optionsFrame = about_panel.new(nil, "ShamanAuras")
	end
	
	self.db = LibStub("AceDB-3.0"):New("SSA_db",defaults)
	self:SetupOptions()
	
	
end

-- Event: PLAYER_LOGIN
function Auras:OnEnable()
	local db = Auras.db.char
	local _,_,classIndex = UnitClass('player')

	self:UnregisterAllEvents()
	self:RegisterEvent("PLAYER_REGEN_DISABLED")
	self:RegisterEvent("PLAYER_TALENT_UPDATE")
	Frame:RegisterUnitEvent("UNIT_SPELLCAST_INTERRUPTED","player")
	Frame:RegisterUnitEvent("UNIT_SPELLCAST_SUCCEEDED","player")
	Frame:RegisterUnitEvent("UNIT_SPELLCAST_DELAYED","player")
	Frame:RegisterUnitEvent("UNIT_SPELLCAST_START", "player")
	Frame:RegisterUnitEvent("UNIT_SPELLCAST_SENT")
	Frame:RegisterUnitEvent("UNIT_SPELLCAST_CHANNEL_START","player")
	Frame:RegisterUnitEvent("UNIT_SPELLCAST_CHANNEL_STOP","player")
	
	--if (db.EquippedArtifact == '') then
		local _,_,name = C_ArtifactUI.GetEquippedArtifactInfo()
		db.EquippedArtifact = name
	--end
	
	-- Check if cooldowns value is table
	if (type(db.cooldowns.numbers) == "table") then
		db.cooldowns.numbers = true
	end
			
	InterfaceOptionsFrame:EnableMouse(true)
	InterfaceOptionsFrame:SetMovable(true)
	InterfaceOptionsFrame:RegisterForDrag("LeftButton")
	InterfaceOptionsFrame:SetUserPlaced(true)
	InterfaceOptionsFrame:SetScript("OnMouseDown",function(self,button)
		if (button == "LeftButton" and not self.isMoving) then
			self:StartMoving()
			self.isMoving = true
		end
	end);
	InterfaceOptionsFrame:SetScript("OnMouseUp",function(self,button)
		if (button == "LeftButton" and self.isMoving) then
			self:StopMovingOrSizing()
			self.isMoving = false
		end
	end);
	InterfaceOptionsFrame:HookScript("OnHide",function(self,button)
		if (self.isMoving) then
			self:StopMovingOrSizing()
			self.isMoving = false
		end
		
		ResetAdjustable()
		
		SSA.MaelstromBar1:SetAlpha(0)
		SSA.MaelstromBar2:SetAlpha(0)
		SSA.EarthenShieldTotemBar:SetAlpha(0)
		SSA.TidalWavesBar:SetAlpha(0)
	end);
	
	Auras:UpdateTalents()
	
	ResetAdjustable()
	ResetMovable()
	
	-- Initialize Cooldown Configuration
	Auras:InitializeCooldowns('AuraGroup1',1)
	Auras:InitializeCooldowns('AuraGroup2',2)
	Auras:InitializeCooldowns('AuraGroup3',3)
	
	-- Clean up old version checks
	for i=1,67 do
		if (db["isR"..tostring(i).."FirstLoad"] == false) then
			db["isR"..tostring(i).."FirstLoad"] = nil
		end
	end
	
	if (db.isR68FirstLoad) then
		SSA.Bulletin:Show()
		db.isR68FirstLoad = false
	end
	
	StaticPopupDialogs["SSA_CLASS_CHECKER"] = {
		text = "You are currently running the addon \"Sweetsour's Shaman Auras\" while on a non-shaman character. It is recommended that you disable this addon.",
		button1 = L["LABEL_SHOW_ADDONS"],
		button2 = "I'll disable it later",
		OnAccept = function()
			AddonList:Show()
		end,
		timeout = 0,
		whileDead = true,
		hideOnEscape = true,
		preferredIndex = 3,
	}

	if (not Auras:CharacterCheck(0)) then
		StaticPopup_Show ("SSA_CLASS_CHECKER")
	end
end

function Auras:PLAYER_TALENT_UPDATE()
	Auras:UpdateTalents(true);
	Auras:UpdateInterfaceSettings();
end

-- Fires when entering combat
function Auras:PLAYER_REGEN_DISABLED()
	local spec = GetSpecialization()
	
	if (SSA["Move"..spec]:IsShown()) then

		SSA["Move"..spec].Close:Click("MiddleButton");
	end
end

Frame:HookScript("OnEvent",function(self,event,...)
	local spec = GetSpecialization()

	local castBar,channelBar = SSA["CastBar"..spec],SSA["ChannelBar"..spec]
	
	if (event == "UNIT_SPELLCAST_SENT" or event == "UNIT_SPELLCAST_START" or event == "UNIT_SPELLCAST_CHANNEL_START") then
		if (event == "UNIT_SPELLCAST_SENT") then
			local db = Auras.db.char
			local cd = db.elements[spec].cooldowns
			
			local start,duration = GetSpellCooldown(Auras:GetSpellName(546))

			if ((duration or 0) <= 1.5 and (duration or 0) > 0) then
				cd.GCD.length = duration
				cd.GCD.start = GetTime()
				cd.GCD.endTime = GetTime() + duration
				cd.interrupted = false
			end
		elseif (event == "UNIT_SPELLCAST_START") then
			local db = Auras.db.char
			local bar = db.elements[spec].statusbars.castBar
			
			local spellName,_,_,texture,startTime,endTime = UnitCastingInfo('player')
			--local duration = (endTime - startTime) / 1000
			endTime = endTime / 1e3
			startTime = startTime / 1e3
			
			castBar.HideTime = 0
			
			castBar.startTime = startTime
			castBar.endTime = endTime
			castBar.duration = endTime - startTime
			castBar.spellName = spellName
			castBar.isCast = true
			
			if (bar.icon.isEnabled) then
				if (not castBar.icon:IsShown()) then
					castBar.icon:Show()
				end
				
				castBar.icon:SetTexture(texture)
				castBar:SetWidth(bar.layout.width - bar.layout.height)
			else
				if (castBar.icon:IsShown()) then
					castBar.icon:Hide()
				end
				
				castBar:SetWidth(bar.layout.width)
			end
			
			if (bar.spark) then
				if (not castBar.spark:IsShown()) then
					castBar.spark:Show()
				end
				
				castBar.spark:SetSize(20,(castBar:GetHeight() * 2.5))
			else
				if (castBar.spark:IsShown()) then
					castBar.spark:Hide()
				end
			end
			
			castBar:SetMinMaxValues(0,castBar.duration)
			if (bar.nametext.isDisplayText) then
				castBar.nametext:SetText(spellName)
			else
				castBar.nametext:SetText('')
			end
			
			castBar:SetAlpha(1);
		else
			local db = Auras.db.char.elements[spec].statusbars.channelBar
			local spellName,_,_,texture,startTime,endTime = UnitChannelInfo('player')

			endTime = endTime / 1e3
			startTime = startTime / 1e3
			
			channelBar.duration = endTime - startTime
			channelBar.HideTime = 0
			
			channelBar.startTime = startTime
			channelBar.endTime = endTime
			
			channelBar:SetMinMaxValues(0,channelBar.duration)
			channelBar.nametext:SetText(spellName)
			channelBar.isChannel = true
			channelBar:SetAlpha(1)

			if (db.icon.isEnabled) then
				if (not channelBar.icon:IsShown()) then
					channelBar.icon:Show()
				end
				
				channelBar.icon:SetTexture(texture)
				channelBar:SetWidth(db.layout.width - db.layout.height)
			else
				if (channelBar.icon:IsShown()) then
					channelBar.icon:Hide()
				end
				
				channelBar:SetWidth(db.layout.width)
			end
			
			if (db.spark) then
				if (not channelBar.spark:IsShown()) then
					channelBar.spark:Show()
				end
				
				channelBar.spark:SetSize(20,(channelBar:GetHeight() * 2.5))
			else
				if (channelBar.spark:IsShown()) then
					channelBar.spark:Hide()
				end
			end
			
			if (db.timetext.isDisplayText) then
				channelBar.timetext:SetText(spellName)
			else
				channelBar.timetext:SetText('')
			end
			
			if (castBar:GetAlpha(1)) then
				castBar:SetAlpha(0)
			end
		end
	elseif (event == "UNIT_SPELLCAST_CHANNEL_STOP") then
		if (not Auras.db.char.elements[spec].statusbars.channelBar.adjust.isEnabled) then
			channelBar:SetAlpha(0)
		end
	elseif (event == "UNIT_SPELLCAST_INTERRUPTED" or event == "UNIT_SPELLCAST_SUCCEEDED") then
		local cd = Auras.db.char.elements[spec].cooldowns
		if (event == "UNIT_SPELLCAST_INTERRUPTED") then
			cd.interrupted = true
			cd.GCD.length = 0
		end
		--
		--cd.GCD.start = 0
		--cd.GCD.endTime = 0
	end
end)
