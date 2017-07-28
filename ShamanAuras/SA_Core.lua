--[[

]]
local FOLDER_NAME, SSA = ...
local SSA = SSA

local Auras = LibStub('AceAddon-3.0'):NewAddon('ShamanAuras', 'AceConsole-3.0','AceEvent-3.0', 'AceHook-3.0', 'AceTimer-3.0');
Auras.version = GetAddOnMetadata(FOLDER_NAME, 'Version')
Auras:RegisterChatCommand('ssa','ChatCommand')
local L = LibStub('AceLocale-3.0'):GetLocale('ShamanAuras', true)
local LSM = LibStub('LibSharedMedia-3.0')

--local obj = {}
local caster,cooldown,duration = {},{},{}
local spec = nil

-- Cache Global Variables
-- Lua Function
local _G = _G
local floor, fmod = math.floor, math.fmod
local pairs, tonumber, tostring = pairs, tonumber, tostring
local format, lower, sub = string.format, string.lower, string.sub
-- WoW API / Variables
local BreakUpLargeNumbers = BreakUpLargeNumbers
local C_ArtifactUI = C_ArtifactUI
local CreateFont, CreateFrame = CreateFont, CreateFrame
local GetSpellCharges, GetSpellInfo = GetSpellCharges, GetSpellInfo
local GetSpecialization = GetSpecialization
local GetTime = GetTime
local IsShiftKeyDown, IsControlKeyDown = IsShiftKeyDown, IsControlKeyDown
local UnitAffectingCombat = UnitAffectingCombat
local UnitCastingInfo, UnitChannelInfo = UnitCastingInfo, UnitChannelInfo
local UnitClass = UnitClass
local UnitExists, UnitIsDead, UnitIsFriend = UnitExists, UnitIsDead, UnitIsFriend
local UnitGUID = UnitGUID
local UnitPower, UnitPowerMax = UnitPower, UnitPowerMax

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
SSA.IsMovingAuras = false;
SSA.ButtonFont = CreateFont('SSAButtonFont')
local ButtonFont = SSA.ButtonFont
ButtonFont:SetFont([[Interface\addons\ShamanAuras\Media\fonts\Continuum_Medium.ttf]],12,'OUTLINE')
ButtonFont:SetJustifyH('CENTER')


SSA.MoveEnh = CreateFrame('Frame','MoveEnh',UIParent)
SSA.MoveRes = CreateFrame('Frame','MoveRes',UIParent)

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

function Auras:CurText(name)
	return SSA[name].text:GetText() or ''
end

local Frame = CreateFrame('Frame')
local UpdateFrame = CreateFrame('Frame')

function Auras:GetMaelstromBarObj(curSpec)
	if (curSpec == 1) then
		return SSA.MaelstromBarEle,Auras.db.char.elements[1].statusbars.maelstromBar.threshold
	elseif (curSpec == 2) then
		return SSA.MaelstromBarEnh,Auras.db.char.elements[2].statusbars.maelstromBar.threshold
	end
end

-- Check if the current target is an enemy
local function IsEnemyTarget()
	if (UnitExists('target') and not UnitIsFriend('target','player') and not UnitIsDead('target')) then
		return true
	else
		return false
	end
end

-------------------------------------------------------------------------------------------------------
----- Global Functions
-------------------------------------------------------------------------------------------------------

-- Check Current Class
function Auras:CharacterCheck(spec,test)
	local _,_,classIndex = UnitClass('player')
	local curSpec = GetSpecialization()
	
	if ((spec == curSpec or spec == 0) and classIndex == 7) then
		--SSA.DataFrame.text:SetText("CurSpec: "..curSpec.."\nSpec: "..spec)
		return true
	else
		return false
	end
end

-- Retrieve Spell Info Name
function Auras:GetSpellName(spellID)
	local name = GetSpellInfo(spellID)
	return name
end

-- Show/Hide aura icons based on the current spec
function Auras:ToggleAuraVisibility(self,isEnable,visType)
	if (isEnable) then
		if (visType == 'showhide') then
			if (not self:IsShown()) then
				self:Show()
			end
		elseif (visType == 'alpha') then
			if (self:GetAlpha() == 0) then
				self:SetAlpha(1)
			end
		end
	else
		if (visType == 'showhide') then
			if (self:IsShown()) then
				self:Hide()
			end
		elseif (visType == 'alpha') then
			if (self:GetAlpha() ~= 0) then
				self:SetAlpha(0)
			end
		end
	end
end

function Auras:ManaPrecision(precision,isNotMax,override)
	local power
	if (override) then
		power = floor(UnitPowerMax('player',19) - (UnitPowerMax('player',19) * 0.75))
	elseif (isNotMax) then
		power = UnitPower('player',19)
	else
		power = UnitPowerMax('player',19)
	end
	
	if (power > 1000) then
		--local power = UnitPowerMax('player',19)
		if (precision == 'Long') then
			if (Auras.db.char.elements[3].statusbars.manaBar.grouping) then
				return BreakUpLargeNumbers(power)
			else
				return power
			end
		elseif (precision == 'Short') then
			if (power > 1000000) then
				return format('%.1f',power / 1000000)..'M'
			elseif (power > 1000) then
				if (Auras.db.char.elements[3].statusbars.manaBar.grouping) then
					return format('%.1f',BreakUpLargeNumbers(power / 1000))..'K'
				else
					return format('%.1f',power / 1000)..'K'
				end
			end
		end
	else
		return power
	end
end

function Auras:ToggleCooldown(self,spec,isCharge)
	if (Auras.db.char.config[spec].cooldown.text) then
		self.CD.text:SetAlpha(1)
	else
		self.CD.text:SetAlpha(0)
	end
	
	if (Auras.db.char.config[spec].cooldown.sweep) then
		if (isCharge) then
			self.ChargeCD:SetAlpha(1)
		end
		self.CD:SetAlpha(1)
	else
		if (isCharge) then
			self.ChargeCD:SetAlpha(0)
		end
		self.CD:SetAlpha(0)
	end
end

-------------------------------------------------------------------------------------------------------
----- Local Functions
-------------------------------------------------------------------------------------------------------

-- Retrieve Specialization Name
local function GetSpecName(spec)
	if (spec == 1) then
		return 'Ele';
	elseif (spec == 2) then
		return 'Enh';
	elseif (spec == 3) then
		return 'Res';
	end
end

-- Return data about the player and their target
local function GetTargetInfo()
	return UnitExists('target'),UnitAffectingCombat('player'),UnitIsFriend('target','player'),UnitIsDead('target')
end

-- Aura Group Builder
function Auras:InitializeFrameGroup(db)
	SSA.DataFrame.text:SetText('')
	for groupObj in pairs(db) do
		if (SSA[groupObj]) then
			local group = SSA[groupObj]
			group:SetWidth(db[groupObj].width)
			group:SetHeight(db[groupObj].height)

			group:EnableMouse(false)
			group:SetMovable(false)
			group:RegisterForDrag('LeftButton')
			

			group:SetPoint(db[groupObj].point,(SSA[db[groupObj].relativeTo] or UIParent),db[groupObj].relativePoint,db[groupObj].x,db[groupObj].y)

			
			if (not db[group:GetName()].isEnabled or not Auras:CharacterCheck(0)) then
				group:Hide()
			else
				group:Show()
			end
			
			if (group:GetName() == "Undulation") then
				group.Model:SetModel('SPELLS/Monk_ForceSpere_Orb.m2')
			elseif (group:GetName() == 'StormstrikeChargeGrp') then
				group.Charge1.Lightning:SetModel('spells/Monk_chiblast_precast.m2')
				group.Charge2.Lightning:SetModel('spells/Monk_chiblast_precast.m2')
			elseif (group:GetName() == 'StormkeeperChargeGrp') then
				group.Charge1.Lightning:SetModel('spells/Monk_chiblast_precast.m2')
				group.Charge2.Lightning:SetModel('spells/Monk_chiblast_precast.m2')
				group.Charge3.Lightning:SetModel('spells/Monk_chiblast_precast.m2')
			end
		end
	end
end

function Auras:InitializeProgressBar(bar1,bar2,db,text1,text2,spec)
	local curSpec = GetSpecialization();
	
	if (curSpec == spec) then
		local specName = GetSpecName(spec)
		local bar1 = SSA[bar1]
		
		local db = Auras.db.char.elements[spec].statusbars[db]
		if (text1) then
			if (db[text1].isDisplayText) then
				bar1[text1]:SetAlpha(1)
			else
				bar1[text1]:SetAlpha(0)
			end
			
			bar1[text1]:SetPoint(db[text1].justify,db[text1].x,db[text1].y)
			bar1[text1]:SetFont(LSM.MediaTable.font[db[text1].font.name] or LSM.DefaultMedia.font,db[text1].font.size,db[text1].font.flag)
			bar1[text1]:SetTextColor(db[text1].font.color.r,db[text1].font.color.g,db[text1].font.color.b)
		end
		
		if (text2) then
			if (db[text2].isDisplayText) then
				bar1[text2]:SetAlpha(1)
			else
				bar1[text2]:SetAlpha(0)
			end
			
			bar1[text2]:SetPoint(db[text2].justify,db[text2].x,db[text2].y)
			bar1[text2]:SetFont(LSM.MediaTable.font[db[text2].font.name] or LSM.DefaultMedia.font,db[text2].font.size,db[text2].font.flag)
			bar1[text2]:SetTextColor(db[text2].font.color.r,db[text2].font.color.g,db[text2].font.color.b)
		end
		
		bar1:ClearAllPoints()
		
		if (bar1.icon and db.icon.isEnabled) then
			local parentJustify
			
			if (db.icon.justify == 'LEFT') then
				parentJustify = 'RIGHT';
				bar1:SetPoint(db.layout.point,SSA[db.layout.relativeTo],db.layout.relativePoint,(db.layout.x + floor(db.layout.height / 2)) + 1,db.layout.y)
			else
				parentJustify = 'LEFT'
				bar1:SetPoint(db.layout.point,SSA[db.layout.relativeTo],db.layout.relativePoint,(db.layout.x - floor(db.layout.height / 2)) - 1,db.layout.y)
			end
			bar1:SetWidth(db.layout.width - db.layout.height)
			
			bar1.icon:SetWidth(db.layout.height)
			bar1.icon:SetHeight(db.layout.height)
			bar1.icon:SetPoint(parentJustify,bar1,db.icon.justify,0,0)
		else
			bar1:SetPoint(db.layout.point,SSA[db.layout.relativeTo],db.layout.relativePoint,db.layout.x,db.layout.y)
			bar1:SetWidth(db.layout.width)
		end
		
		bar1.bg:SetTexture(LSM.MediaTable.statusbar[db.background.texture])
		bar1.bg:SetVertexColor(db.background.color.r,db.background.color.g,db.background.color.b,db.background.color.a)
		
		bar1:SetFrameStrata(db.layout.strata)
		bar1:SetHeight(db.layout.height)
		bar1:SetStatusBarColor(db.foreground.color.r,db.foreground.color.g,db.foreground.color.b)
		bar1:SetStatusBarTexture(LSM.MediaTable.statusbar[db.foreground.texture])
		
		if (bar2) then
			bar1[bar2]:ClearAllPoints()
			bar1[bar2]:SetPoint('CENTER',bar1,'CENTER',0,0)
			bar1[bar2]:SetFrameStrata('MEDIUM')
			bar1[bar2]:SetWidth(db.layout.width)
			bar1[bar2]:SetHeight(db.layout.height)
			bar1[bar2]:SetStatusBarColor(db[lower(bar2).."Bar"].color.r,db[lower(bar2).."Bar"].color.g,db[lower(bar2).."Bar"].color.b,db[lower(bar2).."Bar"].color.a)
		end
		
		db.adjust.isEnabled = false
	end
end

-- Convert time, in seconds, to a timer string
function Auras:parseTime(timer,precision)
	if (timer ~= nil and timer > 0) then
		local m,s,ms,fs = floor(timer / 60),floor(fmod(timer,60)),(('%%.%df'):format(1)):format(fmod(timer,60),1),timer

		if (m >= 1 and s == 0) then
			return m..":00",fs
		else
			if (m > 0) then
				m = m..":"
				if (s < 10) then
					s = "0"..s
				end
			else
				m = ''
				if (s < 0) then
					s = ''
				end
			end
		end
		if (precision and tonumber(s) < 60) then
			return m..ms,fs
		else
			return m..s,fs
		end
	else
		return 0,0
	end
end

function Auras:ToggleCooldownSwipe(self,arg1)
	local cooldown = _G[self:GetName()]
	if (not arg1) then
		cooldown:SetSwipeColor(0,0,0,0)
	else
		cooldown:SetSwipeColor(1,1,1,1)
	end
	cooldown:SetDrawSwipe(arg1)
	cooldown:SetDrawEdge(arg1)
	cooldown:SetDrawBling(arg1)
end

function Auras:ExecuteCooldown(self,start,duration,isSmallAura,isHideText,spec)
	local expires = start + duration
	local timer = expires - GetTime()
	local remaining,seconds = Auras:parseTime(timer,false)
	local fontSize
	local cd = Auras.db.char.elements[spec].cooldowns

	if (isSmallAura) then
		if (seconds > 60) then
			fontSize = 10
		else
			fontSize = 16
		end
	else
		if (seconds > 60) then
			fontSize = 14
		else
			fontSize = 18
		end
	end
	
	self.CD.text:SetFont([[Interface\addons\ShamanAuras\media\fonts\PT_Sans_Narrow.TTF]],fontSize,'OUTLINE');
	
	self.CD:SetCooldown(start,duration)
	self.CD:SetReverse(cd.inverse)
	
	if (not isHideText and cd.text) then
		self.CD.text:SetText(Auras:parseTime(timer,false))
	else
		self.CD.text:SetText('')
	end

	if (cd.sweep) then
		Auras:ToggleCooldownSwipe(self.CD,true)
	else
		Auras:ToggleCooldownSwipe(self.CD,false)
	end
end

-- Return the number of charges an ability currently has by spellID
local function SpellCharges(spellid)
	local charges,maxcharges = GetSpellCharges(spellid)
	local isMaxCharge = false
	
	if (charges == maxcharges) then
		isMaxCharge = true
	end
	
	if ((charges or 0) > 0) then
		return charges,isMaxCharge
	else
		return nil,false
	end
end

function Auras:IsTargetEnemy()
	if (UnitExists('target') and not UnitIsFriend('target','player') and not UnitIsDead('target')) then
		return true
	else
		return false
	end
end

function Auras:IsTargetFriendly()
	if (UnitExists('target') and UnitIsFriend('target','player') and not UnitIsDead('target')) then
		return true
	else
		return false
	end
end

function Auras:SpellRangeCheck(self,spellID,flag,spec)
	if (Auras:IsTargetEnemy() and flag) then
		if (IsSpellInRange(Auras:GetSpellName(spellID)) == 1) then
			self.texture:SetDesaturated(false);
			self.texture:SetVertexColor(1,1,1,1)
		else
			self.texture:SetDesaturated(true)
			self.texture:SetVertexColor(Auras.db.char.settings[spec].OoRColor.r,Auras.db.char.settings[spec].OoRColor.g,Auras.db.char.settings[spec].OoRColor.b,Auras.db.char.settings[spec].OoRColor.a)
		end
	elseif (Auras:IsTargetEnemy() and not flag) then
		self.texture:SetDesaturated(true)
		self.texture:SetVertexColor(0.5,0.5,0.5,1)
	else
		self.texture:SetDesaturated(false)
		self.texture:SetVertexColor(1,1,1,1)
	end
end

function Auras:ShiftPressCheck(self)
	if (IsShiftKeyDown()) then
		self.shift = true
	else
		self.shift = false
	end
end

function Auras:ResetAuraGroupPosition(auraGroup)
	local spec,specName = GetSpecialization()
	
	local db = Auras.db.char
	local elements = db.elements[spec]
	local objName, obj, subName
	
	SSA.DataFrame.text:SetText('')
	for i=1,SSA[auraGroup]:GetNumChildren() do
		objName = select(i,SSA[auraGroup]:GetChildren()):GetName()
		
		if (elements.frames[objName]) then
			obj = db.elements.defaults[spec].frames[objName]
			SSA.DataFrame.text:SetText(Auras:CurText('DataFrame').."="..objName.."\n")
			SSA[objName]:SetPoint(obj.point,SSA[auraGroup],obj.relativePoint,obj.x,obj.y)
			Auras:UpdateLayout(SSA[objName],elements.frames[objName])
		else
			if (spec == 1) then
				specName = 'Ele'
			elseif (spec == 2) then
				specName = 'Enh'
			else
				specName = 'Res'
			end
			
			subName = gsub(objName,"^%a",lower)
			subName = gsub(subName,specName,'')
			subName = gsub(subName,'Totem','')
			
			obj = db.elements.defaults[spec].statusbars[subName]
			bar = elements.statusbars[subName]
			
			if (SSA[objName].icon and bar.icon.isEnabled) then
				local parentJustify
				
				if (obj.icon.justify == 'LEFT') then
					parentJustify = 'RIGHT';
					SSA[objName]:SetPoint(obj.layout.point,SSA[obj.layout.relativeTo],obj.layout.relativePoint,(obj.layout.x + floor(obj.layout.height / 2)) + 1,obj.layout.y)
				else
					parentJustify = 'LEFT'
					SSA[objName]:SetPoint(obj.layout.point,SSA[obj.layout.relativeTo],obj.layout.relativePoint,(obj.layout.x - floor(obj.layout.height / 2)) - 1,obj.layout.y)
				end
				SSA.DataFrame.text:SetText(Auras:CurText('DataFrame').."-"..objName.."\n")
				SSA[objName].icon:SetPoint(parentJustify,SSA[objName],bar.icon.justify,0,0)
				Auras:UpdateLayout(SSA[objName],elements.statusbars[subName])
			else
				SSA.DataFrame.text:SetText(Auras:CurText('DataFrame').."+"..objName.."\n")
				SSA[objName]:SetPoint(obj.layout.point,SSA[auraGroup],obj.layout.relativePoint,obj.layout.x,obj.layout.y)
				Auras:UpdateLayout(SSA[objName],elements.statusbars[subName])
			end
		end	
	end
end

function Auras:ConfigureMove(db,obj,backdrop)
	if (db.isMoving) then
		if (not obj:IsMouseEnabled()) then
			obj:EnableMouse(true)
			obj:SetMovable(true)
		end
		
		if (not obj:GetBackdrop()) then
			obj:SetBackdrop(backdrop)
			obj:SetBackdropColor(0,0,0,0.85)
		end
	else
		if (obj:IsMouseEnabled()) then
			obj:EnableMouse(false)
			obj:SetMovable(false)
		end
		
		if (obj:GetBackdrop()) then
			obj:SetBackdrop(nil)
		end
	end
end

function Auras:MoveOnMouseDown(self,auraGroup,button)
	local framePt,_,parentPt,x,y = self:GetPoint(1)

	if (not IsShiftKeyDown() and not IsControlKeyDown() and button == 'LeftButton') then
		self.framePt = framePt
		self.parentPt = parentPt
		self.frameX = x
		self.frameY = y
		self:StartMoving()
		_,_,_,x,y = self:GetPoint(1)
		self.screenX = x
		self.screenY = y
	elseif (IsShiftKeyDown() and not IsControlKeyDown()) then
		if (button == "LeftButton") then
			self:SetPoint("CENTER",self:GetParent(),"CENTER",0,y)
		elseif (button == "RightButton") then
			self:SetPoint("CENTER",self:GetParent(),"CENTER",x,0)
		elseif (button == "MiddleButton") then
			self:SetPoint("CENTER",self:GetParent(),"CENTER",0,0)
		end
	elseif (not IsShiftKeyDown() and IsControlKeyDown() and button == "RightButton") then
		Auras:ResetAuraGroupPosition(auraGroup)
	end
end

function Auras:MoveOnMouseUp(self,button)
	local framePt,_,parentPt,x,y = self:GetPoint(1)

	if (button == 'LeftButton' and self.framePt) then
		self:StopMovingOrSizing()
		x = (x - self.screenX) + self.frameX
		y = (y - self.screenY) + self.frameY
		self:ClearAllPoints()
		self:SetPoint(self.framePt, self:GetParent(), self.parentPt, x, y)
		self.framePt = nil
		self.parentPt = nil
		self.frameX = nil
		self.frameY =nil
		self.screenX = nil
		self.screenY = nil
	end
end

function Auras:UpdateLayout(obj,db)
	local point,relativeTo,relativePoint,x,y = obj:GetPoint(1);
	
	if (obj.icon and obj:GetName() ~= "Cloudburst") then
		if (db.icon.isEnabled) then
			if (db.icon.justify == "LEFT") then
				x = x - floor(db.layout.height / 2)
			else
				x = x + floor(db.layout.height / 2)
			end
		else
		
		end
	end
	
	if (db.layout) then
		db.layout.point = point
		db.layout.relativeTo = relativeTo:GetName()
		db.layout.relativePoint = relativePoint
		db.layout.x = x
		db.layout.y = y
	else
		db.point = point
		db.relativeTo = relativeTo:GetName()
		db.relativePoint = relativePoint
		db.x = x
		db.y = y
	end
end

function Auras:ParseClick(isClicked,button,spec)
	Auras.db.char.layout[spec][button] = isClicked
end

local function GetVersionNumber()
	return tonumber(sub(Auras.version,2,3))
end
-- Toggle Button Glow Animation
function Auras:ToggleOverlayGlow(object,toggle,enemyCheck)

	if (enemyCheck and not UnitIsFriend('target','player')) then
		if (toggle) then
			LibStub("LibButtonGlow-1.0").ShowOverlayGlow(object)
		else
			LibStub("LibButtonGlow-1.0").HideOverlayGlow(object)
		end
	else
		if (toggle) then
			LibStub("LibButtonGlow-1.0").ShowOverlayGlow(object)
		else
			LibStub("LibButtonGlow-1.0").HideOverlayGlow(object)
		end
	end
end

local function ResetAdjustable()
	local db = Auras.db.char
	
	db.elements[1].statusbars.maelstromBar.adjust.isEnabled = false
	db.elements[1].statusbars.maelstromBar.adjust.showBG = false
	db.elements[1].statusbars.castBar.adjust.isEnabled = false
	db.elements[1].statusbars.castBar.adjust.showBG = false
	db.elements[1].statusbars.channelBar.adjust.isEnabled = false
	db.elements[1].statusbars.channelBar.adjust.showBG = false
	db.elements[1].statusbars.icefuryBar.adjust.isEnabled = false
	db.elements[1].statusbars.icefuryBar.adjust.showBG = false
	db.elements[1].statusbars.icefuryBar.adjust.showTimer = false
	
	db.elements[2].statusbars.maelstromBar.adjust.isEnabled = false
	db.elements[2].statusbars.maelstromBar.adjust.showBG = false
	db.elements[2].statusbars.castBar.adjust.isEnabled = false
	db.elements[2].statusbars.castBar.adjust.showBG = false
	db.elements[2].statusbars.channelBar.adjust.isEnabled = false
	db.elements[2].statusbars.channelBar.adjust.showBG = false
	
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
	self:RegisterEvent("PLAYER_LEVEL_UP")
	self:RegisterEvent("PLAYER_REGEN_DISABLED")
	self:RegisterEvent("PLAYER_TALENT_UPDATE")
	Frame:RegisterUnitEvent("UNIT_SPELLCAST_INTERRUPTED","player")
	Frame:RegisterUnitEvent("UNIT_SPELLCAST_SUCCEEDED","player")
	Frame:RegisterUnitEvent("UNIT_SPELLCAST_DELAYED","player")
	Frame:RegisterUnitEvent("UNIT_SPELLCAST_START", "player")
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
		
		SSA.MaelstromBarEle:SetAlpha(0)
		SSA.MaelstromBarEnh:SetAlpha(0)
		SSA.EarthenShieldTotemBar:SetAlpha(0)
		SSA.TidalWavesBar:SetAlpha(0)
	end);
	
	Auras:UpdateTalents()
	
	ResetAdjustable()
	ResetMovable()

	if (db.isR51FirstLoad) then
		db.isR51FirstLoad = nil
	end
	
	if (db.isR52FirstLoad) then
		db.isR52FirstLoad = nil
	end
	
	if (db.isR53FirstLoad) then
		db.isR53FirstLoad = nil
	end
	
	if (db.isR54FirstLoad) then
		SSA.Bulletin:Show()
		db.isR54FirstLoad = false
	end
	
	StaticPopupDialogs["SSA_CLASS_CHECKER"] = {
		text = "You are currently running the addon \"Sweetsour's Shaman Auras\" while on a non-shaman character. It is recommended that you disable this addon.",
		button1 = "Show Addon List",
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

function Auras:PLAYER_LEVEL_UP(event,level)
	--LevelCheck(level);
end

function Auras:PLAYER_TALENT_UPDATE()
	Auras:UpdateTalents(true);
	Auras:UpdateInterfaceSettings();
end

-- Fires when entering combat
function Auras:PLAYER_REGEN_DISABLED()
	local spec = GetSpecialization();
	if (SSA["Move"..GetSpecName(spec)]:IsShown()) then

		SSA["Move"..GetSpecName(spec)].Close:Click("MiddleButton");
	end
end

Frame:HookScript("OnEvent",function(self,event,...)
	local spec = GetSpecialization()
	local specName = GetSpecName(spec)

	local castBar,channelBar = SSA["CastBar"..specName],SSA["ChannelBar"..specName]
	
	if (event == "UNIT_SPELLCAST_START" or event == "UNIT_SPELLCAST_CHANNEL_START") then
		if (event == "UNIT_SPELLCAST_START") then
			local db = Auras.db.char.elements[spec].statusbars.castBar
			--local castBar = SSA.CastBarEle
			
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
			
			if (db.icon.isEnabled) then
				if (not castBar.icon:IsShown()) then
					castBar.icon:Show()
				end
				
				castBar.icon:SetTexture(texture)
				castBar:SetWidth(db.layout.width - db.layout.height)
			else
				if (castBar.icon:IsShown()) then
					castBar.icon:Hide()
				end
				
				castBar:SetWidth(db.layout.width)
			end
			
			if (db.spark) then
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
			if (db.nametext.isDisplayText) then
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
	end
end)
