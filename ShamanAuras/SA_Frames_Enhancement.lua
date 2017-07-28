
local FOLDER_NAME, SSA = ...
local SSA = SSA

local L = LibStub('AceLocale-3.0'):GetLocale('ShamanAuras', true)
local Auras = LibStub('AceAddon-3.0'):GetAddon('ShamanAuras')
local LSM = LibStub('LibSharedMedia-3.0')

local lgIcon,lgGlow,smIcon,smGlow = 32,45,25,35
local x,y = 0,0,0
local bg,low,med,high = 'BACKGROUND','LOW','MEDIUM','HIGH'
local buffTable,mainTable,utilTable = {},{},{}

-- Cache Global Variables
-- Lua Function
local _G = _G
local floor, rad = math.floor, math.rad
local tinsert, tremove = table.insert, table.remove
local pairs, tostring = pairs, tostring
local gsub, lower = string.gsub, string.lower
-- WoW API / Variables
local CreateFrame = CreateFrame
local GetSpellCharges, GetSpellCooldown, GetSpellInfo = GetSpellCharges, GetSpellCooldown, GetSpellInfo
local GetTime = GetTime
local GetTotemInfo = GetTotemInfo
local UnitAffectingCombat = UnitAffectingCombat
local UnitBuff = UnitBuff
local UnitCastingInfo, UnitChannelInfo = UnitCastingInfo, UnitChannelInfo
local UnitCreatureType = UnitCreatureType
local UnitGUID = UnitGUID
local UnitPower, UnitPowerMax = UnitPower, UnitPowerMax

local EventFrame = CreateFrame('Frame')
EventFrame:RegisterEvent('COMBAT_LOG_EVENT_UNFILTERED')

local backdrop = {
	bgFile   = [[Interface\Tooltips\UI-Tooltip-Background]],
	edgeFile = [[Interface\Tooltips\UI-Tooltip-Border]],
	tile = true,
	tileSize = 16,
	edgeSize = 10
}

local function AdjustStatusBarSpark(self,db)
	if (db.spark) then
		local position = self:GetWidth() * 0.75
		
		self.spark:Show()
		self.spark:SetSize(20,(self:GetHeight() * 2.5))
		
		self.spark:SetPoint('CENTER', self, 'LEFT', position, 0)
	else
		self.spark:Hide()
	end
end

local function AdjustStatusBarIcon(self,db,texture)
	if (db.icon.isEnabled) then
		local parentJustify
		
		self.icon:Show()
		
		if (db.icon.justify == 'LEFT') then
			parentJustify = 'RIGHT'
			self:SetPoint(db.layout.point,self:GetParent(),'CENTER',db.layout.x + floor(db.layout.height / 2),db.layout.y)
		else
			parentJustify = 'LEFT'
			self:SetPoint(db.layout.point,self:GetParent(),'CENTER',db.layout.x - floor(db.layout.height / 2),db.layout.y)
		end
		
		self.icon:ClearAllPoints()
		self.icon:SetWidth(db.layout.height)
		self.icon:SetHeight(db.layout.height)
		self.icon:SetPoint(parentJustify,self,db.icon.justify,0,0)
		self.icon:SetTexture(texture)
	
		self:SetWidth(db.layout.width - db.layout.height)
	else
		self:SetPoint(db.layout.point,self:GetParent(),db.layout.point,db.layout.x,db.layout.y)
		self:SetWidth(db.layout.width)
		self.icon:Hide()
	end
end

local function AdjustStatusBarText(self,db,name)
if (db.isDisplayText) then
		self:SetAlpha(1)
		
		if (db.font.shadow.isEnabled) then
			self:SetShadowColor(db.font.shadow.color.r,db.font.shadow.color.g,db.font.shadow.color.b,db.font.shadow.color.a)
			self:SetShadowOffset(db.font.shadow.offset.x,db.font.shadow.offset.y)
		else
			self:SetShadowColor(0,0,0,0)
		end

		self:ClearAllPoints()
		self:SetPoint(db.justify,db.x,db.y)
		self:SetFont(LSM.MediaTable.font[db.font.name] or LSM.DefaultMedia.font,db.font.size,db.font.flag)
		self:SetTextColor(db.font.color.r,db.font.color.g,db.font.color.b)
	else
		self:SetAlpha(0)
	end
end

local function ToggleFrameMove(self,isMoving)
	if (isMoving) then
		if (not self:IsMouseEnabled()) then
			self:EnableMouse(true)
			self:SetMovable(true)
		end
		
		if (not self:GetBackdrop()) then
			self:SetBackdrop(backdrop)
			self:SetBackdropColor(0,0,0,0.85)
		end
	else
		if (self:IsMouseEnabled()) then
			self:EnableMouse(false)
			self:SetMovable(false)
		end
		
		if (self:GetBackdrop()) then
			self:SetBackdrop(nil)
		end
	end
end

local function ToggleProgressBarMove(self,isMoving,db)
	if (isMoving) then
		db.adjust.isEnabled = false
		
		if (not self:IsMouseEnabled()) then
			self:EnableMouse(true)
			self:SetMovable(true)
		end
		self:SetAlpha(1)
	else
		if (self:IsMouseEnabled()) then
			self:EnableMouse(false)
			self:SetMovable(false)
		end
	end
end

-- Aura Group Builder
local function CreateGroup(name,parent)
	SSA[name] = CreateFrame('Frame',name,parent)
	local Group = SSA[name]
	Group:SetFrameStrata(bg)
	
	return Group
end

-- Aura Icon Builder
local function InitializeFrames(name,parent,icon,iconSize,glowSize,charge)
	SSA[name] = CreateFrame('Frame',name,parent)
	local Frame = SSA[name]
	Frame:SetFrameStrata('LOW')
	Frame:SetWidth(iconSize)
	Frame:SetHeight(iconSize)

	Frame.texture = Frame:CreateTexture(nil,'BACKGROUND')
	Frame.texture:SetTexture([[Interface\addons\ShamanAuras\media\ICONS\]]..icon)
	Frame.texture:SetAllPoints(Frame)
	
	Frame.CD = CreateFrame('Cooldown', name..'CD', Frame, 'CooldownFrameTemplate')
	Frame.CD:SetAllPoints(Frame)
	
	Frame.CD.text = Frame.CD:CreateFontString(nil, 'MEDIUM', 'GameFontHighlightLarge')
	Frame.CD.text:SetAllPoints(Frame.CD)
	Frame.CD.text:SetPoint('CENTER',0,0)
	Frame.CD.text:SetTextColor(1,1,0,1)
	
	if (glowSize) then
		Frame.glow = CreateFrame('Frame',name..'Glow',Frame)
		Frame.glow:SetPoint('CENTER',0,0)
		Frame.glow:SetFrameStrata('BACKGROUND')
		Frame.glow:SetWidth(glowSize)
		Frame.glow:SetHeight(glowSize)
		Frame.glow:Show()
	end
	if (charge) then
		Frame.ChargeCD = CreateFrame('Cooldown', name..'ChargeCD', Frame, 'CooldownFrameTemplate')
		Frame.ChargeCD:SetAllPoints(Frame)
		Frame.ChargeCD:SetFrameStrata('LOW')
		Frame.ChargeCD:Show()

		Frame.Charges = CreateFrame('Frame',name..'Charges',Frame)
		Frame.Charges:SetAllPoints(Frame)
		Frame.Charges:SetFrameStrata(med)
		Frame.Charges:SetWidth(iconSize)
		Frame.Charges:SetHeight(iconSize)

		Frame.Charges.text = Frame.Charges:CreateFontString(nil, 'MEDIUM', 'GameFontHighlightLarge')
		Frame.Charges.text:SetPoint('BOTTOMRIGHT',-3,3)
		Frame.Charges.text:SetFont((LSM.MediaTable.font['PT Sans Narrow'] or LSM.DefaultMedia.font), 13.5,'OUTLINE')
		Frame.Charges.text:SetTextColor(1,1,1,1)	
	end
end


-----------------------------------------------------------------------
-- Enhancement Frames
-----------------------------------------------------------------------
local AuraGroup,LargeIconGrpTop,LargeIconGrpBot,LargeIconGrpExt,SmallIconGrpLeft,SmallIconGrpRight

-- Build Enhtoration Aura Group Containers
AuraGroup = CreateGroup('AuraGroupEnh',UIParent)
LargeIconGrpTop = CreateGroup('LargeIconGrpTopEnh',AuraGroup)
LargeIconGrpBot = CreateGroup('LargeIconGrpBotEnh',AuraGroup)
LargeIconGrpExt = CreateGroup('LargeIconGrpExtEnh',AuraGroup)
SmallIconGrpLeft = CreateGroup('SmallIconGrpLeftEnh',AuraGroup)
SmallIconGrpRight = CreateGroup('SmallIconGrpRightEnh',AuraGroup)

-- Build Large Enhancement Icon Frames
InitializeFrames('AscendanceEnh',LargeIconGrpBot,[[shared\ascendance]],lgIcon)
InitializeFrames('ConcordanceEnh',LargeIconGrpExt,[[shared\concordance_legionfall]],lgIcon)
InitializeFrames('CrashLightning',LargeIconGrpTop,[[enhancement\crash_lightning]],lgIcon,lgGlow)
InitializeFrames('DoomWinds',LargeIconGrpExt,[[enhancement\doom_winds]],lgIcon)
InitializeFrames('EarthenSpike',LargeIconGrpBot,[[enhancement\earthen_spike]],lgIcon)
InitializeFrames('FeralSpirit',LargeIconGrpBot,[[enhancement\feral_spirit]],lgIcon)
InitializeFrames('Flametongue',LargeIconGrpTop,[[enhancement\flametongue]],lgIcon,lgGlow)
InitializeFrames('Frostbrand',LargeIconGrpTop,[[enhancement\frostbrand]],lgIcon,lgGlow)
InitializeFrames('LavaLash',LargeIconGrpTop,[[enhancement\lava_lash]],lgIcon,lgGlow)
InitializeFrames('Rockbiter',LargeIconGrpBot,[[enhancement\rockbiter]],lgIcon,lgGlow,true)
InitializeFrames('Stormstrike',LargeIconGrpTop,[[enhancement\stormstrike]],lgIcon,lgGlow,true)
InitializeFrames('Sundering',LargeIconGrpBot,[[enhancement\sundering]],lgIcon)
InitializeFrames('UnleashDoom',LargeIconGrpExt,[[enhancement\unleash_doom]],lgIcon)
InitializeFrames('Windsong',LargeIconGrpBot,[[enhancement\windsong]],lgIcon,lgGlow)

InitializeFrames('AstralShiftEnh',SmallIconGrpRight,[[shared\astral_shift]],smIcon)
InitializeFrames('CleanseSpiritEnh',SmallIconGrpLeft,[[restoration\purify_spirit]],smIcon)
InitializeFrames('EarthgrabTotemEnh',SmallIconGrpRight,[[totems\earthgrab_totem]],smIcon)
InitializeFrames('FeralLunge',SmallIconGrpRight,[[enhancement\feral_lunge]],smIcon)
InitializeFrames('HexEnh',SmallIconGrpLeft,[[shared\hex]],smIcon)
InitializeFrames('LightningSurgeTotemEnh',SmallIconGrpRight,[[totems\lightning_surge_totem]],smIcon)
InitializeFrames('Rainfall',SmallIconGrpLeft,[[shared\healing_rain]],smIcon)
InitializeFrames('SpiritWalk',SmallIconGrpRight,[[enhancement\spirit_walk]],smIcon)
InitializeFrames('VoodooTotemEnh',SmallIconGrpLeft,[[totems\voodoo_totem]],smIcon)
InitializeFrames('WindRushTotemEnh',SmallIconGrpRight,[[totems\wind_rush_totem]],smIcon)
InitializeFrames('WindShearEnh',SmallIconGrpLeft,[[shared\wind_shear]],smIcon,smGlow)

-------------------------------------------------------------------------------------------------------
----- Initialize Scripts (Aura Groups)
-------------------------------------------------------------------------------------------------------

EventFrame:SetScript('OnUpdate',function(self)
	local _,_,name,_,_,rank = C_ArtifactUI.GetEquippedArtifactInfo()
	
	if (Auras:CharacterCheck(2)) then
		if (name ~= Auras.db.char.EquippedArtifact) then
			Auras.db.char.EquippedArtifact = name
			Auras:UpdateTalents()
		end
	end
end)

AuraGroup:SetScript('OnUpdate',function(self,button)
	ToggleFrameMove(self,Auras.db.char.elements[2].isMoving)
end)

AuraGroup:SetScript('OnMouseDown',function(self,button)
	if (Auras.db.char.elements[2].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroupEnh',button)
	end
end)

AuraGroup:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[2].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[2].frames[self:GetName()])
	end
end)

LargeIconGrpTop:SetScript('OnUpdate',function(self,button)
	ToggleFrameMove(self,Auras.db.char.elements[2].isMoving)
end)

LargeIconGrpTop:SetScript('OnMouseDown',function(self,button)
	if (Auras.db.char.elements[2].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroupEnh',button)
	end
end)

LargeIconGrpTop:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[2].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[2].frames[self:GetName()])
	end
end)

LargeIconGrpBot:SetScript('OnUpdate',function(self,button)
	ToggleFrameMove(self,Auras.db.char.elements[2].isMoving)
end)

LargeIconGrpBot:SetScript('OnMouseDown',function(self,button)
	if (Auras.db.char.elements[2].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroupEnh',button)
	end
end)

LargeIconGrpBot:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[2].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[2].frames[self:GetName()])
	end
end)

LargeIconGrpExt:SetScript('OnUpdate',function(self,button)
	ToggleFrameMove(self,Auras.db.char.elements[2].isMoving)
end)

LargeIconGrpExt:SetScript('OnMouseDown',function(self,button)
	if (Auras.db.char.elements[2].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroupEnh',button)
	end
end)

LargeIconGrpExt:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[2].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[2].frames[self:GetName()])
	end
end)

SmallIconGrpLeft:SetScript('OnUpdate',function(self,button)
	ToggleFrameMove(self,Auras.db.char.elements[2].isMoving)
end)

SmallIconGrpLeft:SetScript('OnMouseDown',function(self,button)
	if (Auras.db.char.elements[2].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroupEnh',button)
	end
end)

SmallIconGrpLeft:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[2].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[2].frames[self:GetName()])
	end
end)

SmallIconGrpRight:SetScript('OnUpdate',function(self,button)
	ToggleFrameMove(self,Auras.db.char.elements[2].isMoving)
end)

SmallIconGrpRight:SetScript('OnMouseDown',function(self,button)
	if (Auras.db.char.elements[2].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroupEnh',button)
	end
end)

SmallIconGrpRight:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[2].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[2].frames[self:GetName()])
	end
end)

-------------------------------------------------------------------------------------------------------
----- Initialize Scripts (Separate Auras)
-------------------------------------------------------------------------------------------------------

-- Ascendance
SSA.AscendanceEnh:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(2)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(114051))
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,false,false,2)
			self.CD:Show()
		else
			self.CD:Hide()
		end
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			self:SetAlpha(Auras.db.char.settings[2].OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Astral Shift
SSA.AstralShiftEnh:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(2)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(108271))
	
		Auras:ToggleAuraVisibility(self,true,'showhide')
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true,false,2)
			self.CD:Show()
		else
			self.CD:Hide()
		end
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			self:SetAlpha(Auras.db.char.settings[2].OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Rockbiter
SSA.Rockbiter:SetScript('OnUpdate', function(self)
	if (Auras:CharacterCheck(2)) then
		local buff,_,_,_,_,_,expires = UnitBuff('player',Auras:GetSpellName(202004))
		local start,duration = GetSpellCooldown(Auras:GetSpellName(193786))
		local charges,maxCharges,chgStart,chgDuration = GetSpellCharges(193786)
	
		Auras:SpellRangeCheck(self,193786,true,2)
		Auras:ToggleAuraVisibility(self,true,'showhide')
	
		if (buff) then
			local timer,seconds = Auras:parseTime((expires or 0) - GetTime(),false)
			
			if (seconds > Auras.db.char.settings[2].rockbiter) then
				Auras:ToggleOverlayGlow(self.glow,false)
			elseif (seconds <= Auras.db.char.settings[2].rockbiter and UnitAffectingCombat('player')) then
				Auras:ToggleOverlayGlow(self.glow,true)
			end
		end
		
		if (charges == 2) then
			self.ChargeCD:Hide()
			self.ChargeCD:SetCooldown(0,0)
		elseif (charges < 2) then
			self.ChargeCD:Show()
			self.ChargeCD:SetCooldown(chgStart,chgDuration)
		end
		
		if (charges > 0) then
			self.Charges.text:SetText(charges)
			self.CD.text:SetText('')
		else
			Auras:ExecuteCooldown(self,start,duration,false,false,2)
			self.Charges.text:SetText('')
		end
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			self:SetAlpha(Auras.db.char.settings[2].OoCAlpha)
			Auras:ToggleOverlayGlow(self.glow,false)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)	

-- Concordance of the Legionfall
SSA.ConcordanceEnh:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(2)) then
		local buff,_,_,count,_,duration,expires,caster = UnitBuff('player',Auras:GetSpellName(242584))
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,(expires - duration),duration,false,false,2)
			self.CD:Show()
		else
			self.CD:Hide()
		end
		
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			self:SetAlpha(Auras.db.char.settings[2].OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Cleanse Spirit
SSA.CleanseSpiritEnh:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(2)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(51886))
	
		Auras:ToggleAuraVisibility(self,true,'showhide')
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true,false,2)
			self.CD:Show()
		else
			self.CD:Hide()
		end
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			self:SetAlpha(Auras.db.char.settings[2].OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)


-- Crash Lightning
SSA.CrashLightning:SetScript('OnUpdate', function(self)
	if (Auras:CharacterCheck(2)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(187874))
		local power = UnitPower('player',11)
	
		Auras:ToggleAuraVisibility(self,true,'showhide')
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,false,false,2)
		end
		
		if (UnitAffectingCombat('player')) then
			if (power >= 20) then
				self:SetAlpha(1)
			else
				self:SetAlpha(0.5)
			end
		else
			self:SetAlpha(Auras.db.char.settings[2].OoCAlpha)
			Auras:ToggleOverlayGlow(self.glow,false)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Doom Winds
SSA.DoomWinds:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(2)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(204945))
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,false,false,2)
			self.CD:Show()
		else
			self.CD:Hide()
		end
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			self:SetAlpha(Auras.db.char.settings[2].OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Earthen Spike
SSA.EarthenSpike:SetScript('OnUpdate', function(self)
	if (Auras:CharacterCheck(2)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(188089))
		local power = UnitPower('player',11)
	
		Auras:SpellRangeCheck(self,188089,true,2)
		Auras:ToggleAuraVisibility(self,true,'showhide')
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,false,false,2)
		end
		
		if (UnitAffectingCombat('player')) then
			if (power >= 30) then
				self:SetAlpha(1)
			else
				self:SetAlpha(0.5)
			end
		else
			self:SetAlpha(Auras.db.char.settings[2].OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Earthgrab Totem
SSA.EarthgrabTotemEnh:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(2)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(51485))
	
		Auras:ToggleAuraVisibility(self,true,'showhide')
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true,false,2)
			self.CD:Show()
		else
			self.CD:Hide()
		end
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			self:SetAlpha(Auras.db.char.settings[2].OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Feral Lunge
SSA.FeralLunge:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(2)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(196884))
		
		Auras:SpellRangeCheck(self,196884,true,2)
		Auras:ToggleAuraVisibility(self,true,'showhide')
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true,false,2)
			self.CD:Show()
		else
			self.CD:Hide()
		end
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			self:SetAlpha(Auras.db.char.settings[2].OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Feral Spirit
SSA.FeralSpirit:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(2)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(51533))
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,false,false,2)
			self.CD:Show()
		else
			self.CD:Hide()
		end
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			self:SetAlpha(Auras.db.char.settings[2].OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Flametongue
SSA.Flametongue:SetScript('OnUpdate', function(self)
	if (Auras:CharacterCheck(2)) then
		local buff,_,_,_,_,_,expires = UnitBuff('player',Auras:GetSpellName(193796))
		local start,duration = GetSpellCooldown(Auras:GetSpellName(193796))
		
		Auras:SpellRangeCheck(self,193796,true,2)
		Auras:ToggleAuraVisibility(self,true,'showhide')
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,false,false,2)
			self.CD:Show()
		else
			self.CD:Hide()
		end
		
		if (buff) then
			local timer,seconds = Auras:parseTime((expires or 0) - GetTime(),false)
			
			if (seconds > Auras.db.char.settings[2].flametongue) then
				Auras:ToggleOverlayGlow(self.glow,false)
			elseif (seconds <= Auras.db.char.settings[2].flametongue and UnitAffectingCombat('player')) then
				Auras:ToggleOverlayGlow(self.glow,true)
			end
		end
		
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			self:SetAlpha(Auras.db.char.settings[2].OoCAlpha)
			Auras:ToggleOverlayGlow(self.glow,false)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Frostbrand
SSA.Frostbrand:SetScript('OnUpdate', function(self)
	if (Auras:CharacterCheck(2)) then
		local buff,_,_,_,_,_,expires = UnitBuff('player',Auras:GetSpellName(196834))
		local power = UnitPower('player',11)
		
		if (power >= 20) then
			self:SetAlpha(1)
		else
			self:SetAlpha(0.5)
		end
		
		Auras:SpellRangeCheck(self,193796,true,2)
		Auras:ToggleAuraVisibility(self,true,'showhide')
		
		if (buff) then
			local timer,seconds = Auras:parseTime((expires or 0) - GetTime(),false)
			
			if (seconds > Auras.db.char.settings[2].frostbrand or power < 20) then
				Auras:ToggleOverlayGlow(self.glow,false)
			elseif (seconds <= Auras.db.char.settings[2].frostbrand and UnitAffectingCombat('player') and power >= 20) then
				Auras:ToggleOverlayGlow(self.glow,true)
			end
		end
		
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			self:SetAlpha(Auras.db.char.settings[2].OoCAlpha)
			Auras:ToggleOverlayGlow(self.glow,false)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Hex
SSA.HexEnh:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(2)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(51514))

		Auras:ToggleAuraVisibility(self,true,'showhide')
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true,false,2)
			self.CD:Show()
		else
			self.CD:Hide()
		end
		
		Auras:SpellRangeCheck(self,51514,(UnitCreatureType('target') == 'Humanoid' or UnitCreatureType('target') == 'Beast' or UnitCreatureType('target') == 'Critter'),2)	
		
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			self:SetAlpha(Auras.db.char.settings[2].OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Lava Lash
SSA.LavaLash:SetScript('OnUpdate', function(self)
	if (Auras:CharacterCheck(2)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(60103))
		local buff = UnitBuff('player',Auras:GetSpellName(201900))
		
		local power = UnitPower('player',11)
		
		Auras:SpellRangeCheck(self,60103,true,2)
		Auras:ToggleAuraVisibility(self,true,'showhide')
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,false,false,2)
		end
		
		if (buff) then
			Auras:ToggleOverlayGlow(self.glow,true)
		else
			Auras:ToggleOverlayGlow(self.glow,false)
		end
		
		if (UnitAffectingCombat('player')) then
			if (power >= 30 or buff) then
				self:SetAlpha(1)
			else
				self:SetAlpha(0.5)
			end
		else
			self:SetAlpha(Auras.db.char.settings[2].OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Lightning Surge Totem
SSA.LightningSurgeTotemEnh:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(2)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(192058))

		Auras:ToggleAuraVisibility(self,true,'showhide')
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true,false,2)
			self.CD:Show()
		else
			self.CD:Hide()
		end
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			self:SetAlpha(Auras.db.char.settings[2].OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Rainfall
SSA.Rainfall:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(2)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(215864))

		Auras:ToggleAuraVisibility(self,true,'showhide')
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true,false,2)
			self.CD:Show()
		else
			self.CD:Hide()
		end
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			self:SetAlpha(Auras.db.char.settings[2].OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Spirit Walk
SSA.SpiritWalk:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(2)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(58875))

		Auras:ToggleAuraVisibility(self,true,'showhide')
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true,false,2)
			self.CD:Show()
		else
			self.CD:Hide()
		end
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			self:SetAlpha(Auras.db.char.settings[2].OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Stormstrike
SSA.Stormstrike:SetScript('OnUpdate', function(self)
	if (Auras:CharacterCheck(2)) then
		local buff,_,_,_,_,_,expires = UnitBuff('player',Auras:GetSpellName(201846))
		local start,duration = GetSpellCooldown(Auras:GetSpellName(17364))
		local power = UnitPower('player',11)
		
		Auras:SpellRangeCheck(self,17364,true,2)
		Auras:ToggleAuraVisibility(self,true,'showhide')
		
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			if ((duration or 0) > 2) then
				--Auras:ToggleCooldownSwipe(self.CD,true)
				Auras:ToggleOverlayGlow(self.glow,false)
				Auras:ExecuteCooldown(self,start,duration,false,false,2)
				if (power >= 40) then
					self:SetAlpha(1)
				else
					self:SetAlpha(0.5)
				end
			elseif (not buff) then
				Auras:ToggleOverlayGlow(self.glow,false)
				self.CD:SetAlpha(1)
				self.CD.text:SetAlpha(1)
				if (power >= 40) then
					self:SetAlpha(1)
				else
					self:SetAlpha(0.5)
				end
			elseif (buff and UnitAffectingCombat('player')) then
				Auras:ToggleOverlayGlow(self.glow,true)
				self.CD:SetAlpha(0)
				if (power >= 20) then
					self:SetAlpha(1)
				else
					self:SetAlpha(0.5)
				end
				self.CD:SetCooldown(0,0)
				self.CD.text:SetText('')
			end
		else
			self:SetAlpha(Auras.db.char.settings[2].OoCAlpha)
			Auras:ToggleOverlayGlow(self.glow,false)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Sundering
SSA.Sundering:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(2)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(197214))

		Auras:SpellRangeCheck(self,197214,true,2)
		Auras:ToggleAuraVisibility(self,true,'showhide')
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,false,false,2)
			self.CD:Show()
		else
			self.CD:Hide()
		end
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			self:SetAlpha(Auras.db.char.settings[2].OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Unleash Doom
SSA.UnleashDoom:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(2)) then
		local buff,_,_,count,_,duration,expires,caster = UnitBuff('player',Auras:GetSpellName(199055))
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,(expires - duration),duration,false,false,2)
			self.CD:Show()
		else
			self.CD:Hide()
		end
		
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			self:SetAlpha(Auras.db.char.settings[2].OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Voodoo Totem
SSA.VoodooTotemEnh:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(2)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(196932))

		Auras:ToggleAuraVisibility(self,true,'showhide')
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true,false,2)
			self.CD:Show()
		else
			self.CD:Hide()
		end
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			self:SetAlpha(Auras.db.char.settings[2].OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Wind Shear
SSA.WindShearEnh:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(2)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(57994))
		local name,_,_,_,_,_,_,_,interrupt = UnitCastingInfo('target')

		Auras:SpellRangeCheck(self,57994,true,2)
		Auras:ToggleAuraVisibility(self,true,'showhide')
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true,false,2)
			self.CD:Show()
		else
			self.CD:Hide()
		end
		
		if (name and not interrupt and (start or 0) == 0 and Auras:IsTargetEnemy()) then
			Auras:ToggleOverlayGlow(self.glow,true,true)
		else
			Auras:ToggleOverlayGlow(self.glow,false)
		end
		
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			self:SetAlpha(Auras.db.char.settings[2].OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Wind Rush Totem
SSA.WindRushTotemEnh:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(2)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(192077))

		Auras:ToggleAuraVisibility(self,true,'showhide')
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true,false,2)
			self.CD:Show()
		else
			self.CD:Hide()
		end
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			self:SetAlpha(Auras.db.char.settings[2].OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Windsong
SSA.Windsong:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(2)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(201898))

		Auras:SpellRangeCheck(self,201898,true,2)
		Auras:ToggleAuraVisibility(self,true,'showhide')
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,false,false,2)
			self.CD:Show()
		else
			self.CD:Hide()
		end
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			self:SetAlpha(Auras.db.char.settings[2].OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-------------------------------------------------------------------------------------------------------
----- Build and Initialize Status Bars
-------------------------------------------------------------------------------------------------------

-- Casting Status Bar
local ChannelBar = CreateFrame('StatusBar','ChannelBarEnh',AuraGroup)

ChannelBar:SetStatusBarTexture([[Interface\addons\ShamanAuras\media\statusbar\Glamour2]])
ChannelBar:GetStatusBarTexture():SetHorizTile(false)
ChannelBar:GetStatusBarTexture():SetVertTile(false)
ChannelBar:RegisterForDrag('LeftButton')
ChannelBar:Show()
ChannelBar:SetAlpha(0)

ChannelBar.spark = ChannelBar:CreateTexture(nil,'OVERLAY')
ChannelBar.spark:SetBlendMode('ADD')
ChannelBar.spark:SetTexture([[Interface\CastingBar\UI-CastingBar-Spark]])

ChannelBar.icon = ChannelBar:CreateTexture(nil,'OVERLAY')

ChannelBar.bg = ChannelBar:CreateTexture(nil,'BACKGROUND')
ChannelBar.bg:SetAllPoints(true)

ChannelBar.timetext = ChannelBar:CreateFontString(nil, 'HIGH', 'GameFontHighlightLarge')
ChannelBar.nametext = ChannelBar:CreateFontString(nil, 'HIGH', 'GameFontHighlightLarge')

ChannelBar.startTime = 0
ChannelBar.endTime = 0
ChannelBar.isChannel = false
ChannelBar.duration = 0
ChannelBar.progress = 0

ChannelBar:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(2)) then
		local db = Auras.db.char
		local bar = db.elements[2].statusbars.channelBar
		local isMoving = db.elements[2].isMoving
		
		ToggleProgressBarMove(self,isMoving,bar)
			
		if (isMoving) then
			local name,_,texture = GetSpellInfo(6196)

			self:SetMinMaxValues(0,60)
			self:SetValue(60)
			self.nametext:SetText(name)
			self.timetext:SetText('59.9')
			
			if (bar.icon.isEnabled) then
				self.icon:Show()
				self.icon:SetTexture(texture)
			end
		end
		
		if (bar.adjust.isEnabled) then
			local name,_,texture = GetSpellInfo(6196)
			self.nametext:SetText(name)
			self:SetAlpha(1)
			
			AdjustStatusBarText(self.nametext,bar.nametext)
			AdjustStatusBarText(self.timetext,bar.timetext)
			AdjustStatusBarIcon(self,bar,texture)
			
			if (bar.adjust.showBG) then
				self:SetMinMaxValues(0,1)
				self:SetValue(0.33)
				self.timetext:SetText('20.0')
				AdjustStatusBarSpark(self,bar,0.33)
			else
				self:SetMinMaxValues(0,1)
				self:SetValue(1)
				self.timetext:SetText('60.0')
				AdjustStatusBarSpark(self,bar,1)
			end
			
			self:SetStatusBarTexture(LSM.MediaTable.statusbar[bar.foreground.texture])
			self:SetStatusBarColor(bar.foreground.color.r,bar.foreground.color.g,bar.foreground.color.b)
			
			self.bg:SetTexture(LSM.MediaTable.statusbar[bar.background.texture])
			self.bg:SetVertexColor(bar.background.color.r,bar.background.color.g,bar.background.color.b,bar.background.color.a)
			
			self:SetHeight(bar.layout.height)
			self:SetFrameStrata(bar.layout.strata)
		end

		if (bar.isEnabled and not isMoving and not bar.adjust.isEnabled) then
			local spellName,_,_,_,_,endTime = UnitChannelInfo('player')
			
			if (self.isChannel and (spellName or GetTime() == endTime)) then
				local timer,seconds = Auras:parseTime(self.endTime - GetTime(),true)

				self:SetValue(seconds)
				self.timetext:SetText(timer)
				
				if (bar.spark) then
					self.progress = self.endTime - GetTime()
					self.spark:SetPoint('CENTER', self, 'LEFT', (self.progress / self.duration) * self:GetWidth(), 0)
				end
				if (UnitAffectingCombat('player')) then
					self:SetAlpha(bar.alphaCombat)
				else
					self:SetAlpha(bar.alphaOoC)
					
				end
				self.bg:SetAlpha(bar.background.color.a)
			else
				self.isChannel = false
				self:SetAlpha(0)
			end
		elseif (not bar.isEnabled and not isMoving and not bar.adjust.isEnabled) then
			self:SetAlpha(0)
		end
	else
		self:SetAlpha(0)
	end
end)

ChannelBar:SetScript('OnMouseDown',function(self,button)
	if (Auras.db.char.elements[2].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroupEnh',button)
	end
end)

ChannelBar:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[2].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[2].statusbars.channelBar)
	end
end)

SSA.ChannelBarEnh = ChannelBar

-- Casting Status Bar
local CastBar = CreateFrame('StatusBar','CastBarEnh',AuraGroup)

CastBar:SetStatusBarTexture([[Interface\addons\ShamanAuras\media\statusbar\Glamour2]])
CastBar:GetStatusBarTexture():SetHorizTile(false)
CastBar:GetStatusBarTexture():SetVertTile(false)
CastBar:RegisterForDrag('LeftButton')
CastBar:Show()
CastBar:SetAlpha(0)

CastBar.spark = CastBar:CreateTexture(nil,'OVERLAY')
CastBar.spark:SetBlendMode('ADD')
CastBar.spark:SetTexture([[Interface\CastingBar\UI-CastingBar-Spark]])

CastBar.bg = CastBar:CreateTexture(nil,'BACKGROUND')
CastBar.bg:SetAllPoints(true)

CastBar.icon = CastBar:CreateTexture(nil,'OVERLAY')

CastBar.safezone = CastBar:CreateTexture(nil,'OVERLAY')
CastBar.safezone:SetColorTexture(0.54,0.26,0.26)
CastBar.safezone:SetPoint('RIGHT',CastBar,'RIGHT',0,0)
CastBar.safezone:SetAlpha(0)

CastBar.timetext = CastBar:CreateFontString(nil, 'OVERLAY', 'GameFontHighlightLarge')
CastBar.nametext = CastBar:CreateFontString(nil, 'OVERLAY', 'GameFontHighlightLarge')

CastBar.startTime = 0
CastBar.endTime = 0
CastBar.duration = 0
CastBar.spellName = ''
CastBar.isCast = false
CastBar.progress = 0

CastBar:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(2)) then
		local db = Auras.db.char
		local bar = db.elements[2].statusbars.castBar
		local isMoving = db.elements[2].isMoving
		
		ToggleProgressBarMove(self,isMoving,bar)
		
		if (not db.elements[2].statusbars.defaultBar and CastingBarFrame:IsShown()) then
			CastingBarFrame:Hide()
		end
		
		if (isMoving) then
			local name,_,texture = GetSpellInfo(51505)

			self:SetMinMaxValues(0,3)
			self:SetValue(3)
			self.nametext:SetText(name)
			self.timetext:SetText('3.0')
			
			if (bar.icon.isEnabled) then
				self.icon:Show()
				self.icon:SetTexture(texture)
			end
			self.spark:Hide()
		end
			
		if (bar.adjust.isEnabled) then
			local name,_,texture = GetSpellInfo(188070)
			self.nametext:SetText(name)
			self.timetext:SetText('1.2')
			self:SetAlpha(1)
			
			SSA.DataFrame.text:SetText('')
			AdjustStatusBarText(self.nametext,bar.nametext,"name")
			AdjustStatusBarText(self.timetext,bar.timetext,"time")
			AdjustStatusBarIcon(self,bar,texture)
			
			if (bar.adjust.showBG) then
				self:SetMinMaxValues(0,1)
				self:SetValue(0.33)
				AdjustStatusBarSpark(self,bar,0.33)
			else
				self:SetMinMaxValues(0,1)
				self:SetValue(1)
				AdjustStatusBarSpark(self,bar,1)
			end
			
			self:SetStatusBarTexture(LSM.MediaTable.statusbar[bar.foreground.texture])
			self:SetStatusBarColor(bar.foreground.color.r,bar.foreground.color.g,bar.foreground.color.b)
			
			self.bg:SetTexture(LSM.MediaTable.statusbar[bar.background.texture])
			self.bg:SetVertexColor(bar.background.color.r,bar.background.color.g,bar.background.color.b,bar.background.color.a)
			
			self:SetHeight(bar.layout.height)
			self:SetFrameStrata(bar.layout.strata)
		end
		
		if (bar.isEnabled and not isMoving and not bar.adjust.isEnabled) then
			local spellName = UnitCastingInfo('player')
			if (self.isCast and (spellName or GetTime() == self.endTime)) then
				if (bar.timetext.isDisplayText) then
					local timer,seconds = Auras:parseTime(self.endTime - GetTime(),true)
					local diff = 0
					if (self.isChannel) then
						diff = seconds
					else
						diff = self.duration - seconds
					end

					self:SetValue(diff)
					self.timetext:SetText(timer)
				else
					self.timetext:SetText('')
				end
				if (bar.spark) then
					self.progress = self.endTime - GetTime()
					local position = self:GetWidth() - (self:GetWidth() / (self.duration / self.progress))
					self.spark:SetPoint('CENTER', self, 'LEFT', position, 0)
				end
				if (UnitAffectingCombat('player')) then
					self:SetAlpha(bar.alphaCombat)
				else
					self:SetAlpha(bar.alphaOoC)
					
				end
				self.bg:SetAlpha(bar.background.color.a)
			else
				self.isCast = false
				self:SetAlpha(0)
			end
		elseif (not bar.isEnabled and not isMoving and not bar.adjust.isEnabled) then
			self:SetAlpha(0)
		end
	else
		self:SetAlpha(0)
	end
end)

CastBar:SetScript('OnMouseDown',function(self,button)
	if (Auras.db.char.elements[2].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroupEnh',button)
	end
end)

CastBar:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[2].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[2].statusbars.castBar)
	end
end)

SSA.CastBarEnh = CastBar
_G['SSA_CastBarEnh'] = CastBar


-- Maelstrom Bar
local MaelstromBar = CreateFrame('StatusBar','MaelstromBarEnh',AuraGroup)

MaelstromBar:SetStatusBarTexture([[Interface\addons\ShamanAuras\media\statusbar\fifths]])
MaelstromBar:GetStatusBarTexture():SetHorizTile(false)
MaelstromBar:GetStatusBarTexture():SetVertTile(false)
MaelstromBar:RegisterForDrag('LeftButton')
MaelstromBar:Show()

MaelstromBar.bg = MaelstromBar:CreateTexture(nil,'BACKGROUND')
MaelstromBar.bg:SetAllPoints(true)

MaelstromBar.text = MaelstromBar:CreateFontString(nil, 'HIGH', 'GameFontHighlightLarge')

MaelstromBar.Elapsed = 0
MaelstromBar.Lightning = CreateFrame('PlayerModel','MaelstromBarEleLightning',MaelstromBar)
MaelstromBar.Lightning:SetModel('SPELLS/LIGHTNING_AREA_DISC_STATE.m2')
MaelstromBar.Lightning:SetFrameStrata('MEDIUM')
MaelstromBar.Lightning:SetPosition(0,0,-2)
MaelstromBar.Lightning:SetRotation(0)
--MaelstromBar.Lightning:SetCamera(0)
MaelstromBar.Lightning:SetAllPoints(MaelstromBar)
MaelstromBar.Lightning:SetAlpha(0)
MaelstromBar.Lightning:SetSequence(37)

MaelstromBar:SetScript('OnUpdate',function(self,elaps)
	if (Auras:CharacterCheck(2)) then
		local isCombat = UnitAffectingCombat('player')
		local power,maxPower = UnitPower('player',11),UnitPowerMax('player',11)
		
		local db = Auras.db.char
		local bar = db.elements[2].statusbars.maelstromBar
		local isMoving = db.elements[2].isMoving
		
		local _,maxVal = self:GetMinMaxValues()
		
		if (maxVal ~= maxPower) then
			self:SetMinMaxValues(0,maxPower)
		end
		
		ToggleProgressBarMove(self,isMoving,bar)
		
		if (isMoving) then
			self:SetValue(maxPower)
			self.text:SetText(maxPower)
		end
		
		if (bar.adjust.isEnabled) then
			local tempPower = floor(maxPower - (maxPower * 0.75))
			self.text:SetText(tostring(tempPower))
			
			self:SetAlpha(1)
			
			AdjustStatusBarText(self.text,bar.text)
			
			if (bar.adjust.showBG) then
				self:SetValue(tempPower)
				self.text:SetText(tempPower)
			else
				self.text:SetText(maxPower)
				self:SetValue(maxPower)
			end
			
			self:SetStatusBarTexture(LSM.MediaTable.statusbar[bar.foreground.texture])
			self:SetStatusBarColor(bar.foreground.color.r,bar.foreground.color.g,bar.foreground.color.b)
			
			self.bg:SetTexture(LSM.MediaTable.statusbar[bar.background.texture])
			self.bg:SetVertexColor(bar.background.color.r,bar.background.color.g,bar.background.color.b,bar.background.color.a)
			
			self:SetWidth(bar.layout.width)
			self:SetHeight(bar.layout.height)
			self:SetPoint(bar.layout.point,AuraGroup,bar.layout.point,bar.layout.x,bar.layout.y)
			self:SetFrameStrata(bar.layout.strata)
		end
		
		if (bar.isEnabled and not isMoving and not bar.adjust.isEnabled) then
				
			self:SetValue(power)
			if (bar.text.isDisplayText) then
				self.text:SetText(power)
			else
				self.text:SetText('')
			end
			if (power >= bar.threshold and bar.animate) then
				self.Lightning:SetAlpha(bar.alphaCombat)
				self.bg:SetAlpha(bar.alphaCombat)
			else
				self.Lightning:SetAlpha(0)
				self.bg:SetAlpha(bar.alphaCombat / 2)
			end
				
			if (isCombat) then
				self:SetAlpha(1)
				
				self:SetAlpha(bar.alphaCombat)
				
			elseif (not isCombat and Auras:IsTargetEnemy()) then
				if (bar.alphaOoC == 0) then
					self:SetAlpha(bar.alphaTar)
					self.bg:SetAlpha(bar.background.color.a)
				else
					self:SetAlpha(bar.alphaOoC)
					self.bg:SetAlpha(bar.background.color.a)
				end
			elseif (not isCombat and not Auras:IsTargetEnemy()) then
				self:SetAlpha(bar.alphaOoC)
				self.bg:SetAlpha(bar.background.color.a)
			end
		elseif (not bar.isEnabled and not isMoving and not bar.adjust.isEnabled) then
			self:SetAlpha(0)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'alpha')
	end
end)

MaelstromBar:SetScript('OnMouseDown',function(self,button)
	if (Auras.db.char.elements[2].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroupEnh',button)
	end
end)

MaelstromBar:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[2].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[2].statusbars.maelstromBar)
	end
end)

SSA.MaelstromBarEnh = MaelstromBar
_G['SSA_MaelstromBarEnh'] = MaelstromBar

SSA.BuffTimerBarGrpEnh = CreateFrame('Frame','BuffTimerBarGrpEnh',AuraGroup)
local BuffTimerBarGrp = SSA.BuffTimerBarGrpEnh
BuffTimerBarGrp:SetWidth(131)
BuffTimerBarGrp:SetHeight(180)
BuffTimerBarGrp:SetBackdrop(nil)
BuffTimerBarGrp:Show()
_G['SSA_BuffTimerGrpEnh'] = BuffTimerBarGrp

SSA.MainTimerBarGrpEnh = CreateFrame('Frame','MainTimerBarGrpEnh',AuraGroup)
local MainTimerBarGrp = SSA.MainTimerBarGrpEnh
MainTimerBarGrp:SetWidth(131)
MainTimerBarGrp:SetHeight(180)
BuffTimerBarGrp:SetBackdrop(nil)
MainTimerBarGrp:Show()
_G['SSA_MainTimerBarGrpEnh'] = MainTimerBarGrp

SSA.UtilTimerBarGrpEnh = CreateFrame('Frame','UtilTimerBarGrpEnh',AuraGroup)
local UtilTimerBarGrp = SSA.UtilTimerBarGrpEnh
UtilTimerBarGrp:SetWidth(47)
UtilTimerBarGrp:SetHeight(180)
UtilTimerBarGrp:SetBackdrop(nil)
UtilTimerBarGrp:Show()
_G['SSA_UtilTimerBarGrpEnh'] = UtilTimerBarGrp

SSA.AscendanceBarEnh = CreateFrame('StatusBar','AscendanceBarEnh',BuffTimerBarGrp)
SSA.AstralShiftBarEnh = CreateFrame('StatusBar','AstralShiftBarEnh',BuffTimerBarGrp)
SSA.BloodlustBarEnh = CreateFrame('StatusBar','BloodlustBarEnh',BuffTimerBarGrp)
SSA.CrashLightningBar = CreateFrame('StatusBar','CrashLightningBar',MainTimerBarGrp)
SSA.EarthgrabTotemBarEnh = CreateFrame('StatusBar','EarthgrabTotemBarEnh',UtilTimerBarGrp)
SSA.EarthenSpikeBar = CreateFrame('StatusBar','EarthenSpikeBar',UtilTimerBarGrp)
SSA.FlametongueBar = CreateFrame('StatusBar','FlametongueBar',MainTimerBarGrp)
SSA.FrostbrandBar = CreateFrame('StatusBar','FrostbrandBar',MainTimerBarGrp)
SSA.HeroismBarEnh = CreateFrame('StatusBar','HeroismBarEnh',BuffTimerBarGrp)
SSA.HexBarEnh = CreateFrame('StatusBar','HexBarEnh',UtilTimerBarGrp)
SSA.LandslideBar = CreateFrame('StatusBar','LandslideBar',MainTimerBarGrp)
SSA.SpiritWalkBar = CreateFrame('StatusBar','SpiritWalkBar',BuffTimerBarGrp)
SSA.TimeWarpBarEnh = CreateFrame('StatusBar','TimeWarpBarEnh',BuffTimerBarGrp)
SSA.VoodooTotemBarEnh = CreateFrame('StatusBar','VoodooTotemBarEnh',UtilTimerBarGrp)
SSA.WindRushTotemBarEnh = CreateFrame('StatusBar','WindRushTotemBarEnh',UtilTimerBarGrp)
SSA.WindsongBar = CreateFrame('StatusBar','WindsongBar',MainTimerBarGrp)

local buffIDs = {
	[114051] = {
		[1] = SSA.AscendanceBarEnh,
		[2] = 'ascendance',
	},
	[108271] = {
		[1] = SSA.AstralShiftBarEnh,
		[2] = 'astralShift',
	},
	[2825]   = {
		[1] = SSA.BloodlustBarEnh,
		[2] = 'bloodlust',
	},
	[32182]  = {
		[1] = SSA.HeroismBarEnh,
		[2] = 'heroism',
	},
	[58875]  = {
		[1] = SSA.SpiritWalkBar,
		[2] = 'spiritWalk',
	},
	[80353]  = {
		[1] = SSA.TimeWarpBarEnh,
		[2] = 'timeWarp',
	},
}
local mainIDs = {
	[187878] = {
		[1] = SSA.CrashLightningBar,
		[2] = 'crashLightning',
	},
	[194084] = {
		[1] = SSA.FlametongueBar,
		[2] = 'flametongue',
	},
	[196834] = {
		[1] = SSA.FrostbrandBar,
		[2] = 'frostbrand',
	},
	[202004] = {
		[1] = SSA.LandslideBar,
		[2] = 'landslide',
	},
	[201898] = {
		[1] = SSA.WindsongBar,
		[2] = 'windsong',
	},
}
local utilIDs = {
	['Earthgrab Totem']  = {
		[1] = false,
		[2] = SSA.EarthgrabTotemBarEnh,
		[3] = false,
	},
	--[51514]  = SSA.HexBarEle,
	['Voodoo Totem'] = {
		[1] = false,
		[2] = SSA.VoodooTotemBarEnh,
		[3] = false,
	},
	['Wind Rush Totem'] = {
		[1] = false,
		[2] = SSA.WindRushTotemBarEnh,
		[3] = false,
	},
}

local xPos = {
	[1] = 5,
	[2] = 25,
	[3] = 45,
	[4] = 65,
	[5] = 85,
	[6] = 105,
	[7] = 125,
	[8] = 145,
	[9] = 165,
	[10] = 185,
}

local xOffset = {
	[1] = -33,
	[2] = -53,
	[3] = -73,
	[4] = -93,
	[5] = -113,
	[6] = -133,
	[7] = -153,
	[8] = -173,
	[9] = -193,
}

BuffTimerBarGrp:SetScript('OnUpdate',function(self,event,...)
	if (Auras:CharacterCheck(2)) then
		local db = Auras.db.char
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		
		local xPosCtr = 1
		
		for i=1,50 do
			local buff,_,_,_,_,duration,expires,caster,_,_,spellID = UnitBuff('player',i)

			if (buff) then
				if (buffIDs[spellID]) then
					--if (db.auras[2][buffIDs[spellID][1]:GetName()]) then
					if (db.elements[2].timerbars.buff[buffIDs[spellID][2]]) then
						local timer,seconds = Auras:parseTime(expires - GetTime(),true)
						
						buffIDs[spellID][1]:SetMinMaxValues(0,duration)
						buffIDs[spellID][1]:SetValue(seconds)
						buffIDs[spellID][1].timetext:SetText(timer)
						buffIDs[spellID][1]:SetPoint('LEFT',xPos[xPosCtr],0)
						buffIDs[spellID][1]:Show()
						
						xPosCtr = xPosCtr + 1
					else
						buffIDs[spellID][1]:Hide()
					end
				end
			else
				break
			end
		end
		
		for id in pairs(buffIDs) do
			local buff = UnitBuff('player',Auras:GetSpellName(id))
			
			if (buffIDs[id][1]:IsShown() and not buff) then
				buffIDs[id][1]:Hide()
			end
		end
		
		ToggleFrameMove(self,db.elements[2].isMoving)
		
		--[[if (db.elements[2].isMoving) then
			self:SetBackdrop(backdrop)
			self:SetBackdropColor(0,0,0,0.85)
		else
			self:SetBackdrop(nil)
		end]]
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

BuffTimerBarGrp:SetScript('OnMouseDown',function(self,button)
	if (Auras.db.char.elements[2].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroupEnh',button)
	end
end)

BuffTimerBarGrp:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[2].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[2].frames[self:GetName()])
	end
end)

MainTimerBarGrp:SetScript('OnUpdate',function(self,event,...)
	if (Auras:CharacterCheck(2)) then
		local db = Auras.db.char
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		
--		local xPosCtr = 1
--		for i=1,getn(mainTable) do
--			local buff,_,_,_,_,duration,expires = UnitBuff('player',Auras:GetSpellName(mainTable[i]))
--			
--			if (expires) then
--				--if (db.auras[2][mainIDs[mainTable[i]]:GetName()]) then
--				if (db.elements[2].timerbars.main[mainIDs[spellID][2]]) then
--					local timer,seconds = Auras:parseTime(expires - GetTime(),true)
--					
--					mainIDs[mainTable[i]][1]:SetMinMaxValues(0,duration)
--					mainIDs[mainTable[i]][1]:SetValue(seconds)
--					mainIDs[mainTable[i]][1].timetext:SetText(timer)
--					mainIDs[mainTable[i]][1]:SetPoint('RIGHT',(xPos[xPosCtr] * -1),0)
--					mainIDs[mainTable[i]][1]:Show()
--					xPosCtr = xPosCtr + 1
--				else
--					mainIDs[mainTable[i]]:Hide()
--				end
--			end
--		end

		local xPosCtr = 1
		
		for i=1,50 do
			local buff,_,_,_,_,duration,expires,caster,_,_,spellID = UnitBuff('player',i)

			if (buff) then
				if (mainIDs[spellID]) then
					--if (db.auras[2][mainIDs[spellID][1]:GetName()]) then
					if (db.elements[2].timerbars.main[mainIDs[spellID][2]]) then
						local timer,seconds = Auras:parseTime(expires - GetTime(),true)
						
						mainIDs[spellID][1]:SetMinMaxValues(0,duration)
						mainIDs[spellID][1]:SetValue(seconds)
						mainIDs[spellID][1].timetext:SetText(timer)
						mainIDs[spellID][1]:SetPoint('RIGHT',(xPos[xPosCtr] * -1),0)
						mainIDs[spellID][1]:Show()
						
						xPosCtr = xPosCtr + 1
					else
						mainIDs[spellID][1]:Hide()
					end
				end
			else
				break
			end
		end
		
		for id in pairs(mainIDs) do
			local buff = UnitBuff('player',Auras:GetSpellName(id))
			
			if (mainIDs[id][1]:IsShown() and not buff) then
				mainIDs[id][1]:Hide()
			end
		end
		
		ToggleFrameMove(self,db.elements[2].isMoving)
		--[[if (db.elements[2].isMoving) then
			self:SetBackdrop(backdrop)
			self:SetBackdropColor(0,0,0,0.85)
		else
			self:SetBackdrop(nil)
		end]]
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

MainTimerBarGrp:SetScript('OnMouseDown',function(self,button)
	if (Auras.db.char.elements[2].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroupEnh',button)
	end
end)

MainTimerBarGrp:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[2].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[2].frames[self:GetName()])
	end
end)

UtilTimerBarGrp:SetScript('OnUpdate',function(self,event,...)
	if (Auras:CharacterCheck(2)) then
		local db = Auras.db.char
		local totemCtr = 0
		local x
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		
		utilIDs['Earthgrab Totem'][3] = false
		utilIDs['Voodoo Totem'][3] = false
		utilIDs['Wind Rush Totem'][3] = false
		
		for i=1,5 do
			local _,name,start,duration = GetTotemInfo(i)
			
			if ((duration or 0) > 0 and name) then
				local timer,seconds = Auras:parseTime((start + duration) - GetTime(),true)
				
				--if (db.auras[2][gsub(name,' ','')..'BarEnh']) then
				subName = gsub(name," ",'')
				subName = gsub(subName,"^%a",lower)
				if (db.elements[2].timerbars.util[subName]) then
					if (utilIDs[name]) then
						utilIDs[name][3] = true
						totemCtr = totemCtr + 1
						
					
						if (getn(mainTable) > 0) then
							x = xOffset[getn(mainTable) + (totemCtr - 1)]
						else
							x = (xPos[totemCtr] * -1)
						end
					
						if (seconds > 0.1) then
							utilIDs[name][2]:SetMinMaxValues(0,duration)
							utilIDs[name][2]:SetValue(seconds)
							utilIDs[name][2].timetext:SetText(timer)
							utilIDs[name][2]:SetPoint('RIGHT',x,0)
							utilIDs[name][2]:Show()
							utilIDs[name][1] = true
						else
							totemCtr = totemCtr - 1
							utilIDs[name][2]:SetValue(0)
							utilIDs[name][2]:Hide()
							utilIDs[name][1] = false
						end
					end
				else
					if (name and name ~= '' and utilIDs[name]) then
						utilIDs[name][2]:Hide()
					end
				end
			end
			
			if (i==5) then
				if (not utilIDs['Earthgrab Totem'][3] and utilIDs['Earthgrab Totem'][1]) then
					utilIDs['Earthgrab Totem'][1] = false
				end
				
				if (not utilIDs['Voodoo Totem'][3] and utilIDs['Voodoo Totem'][1]) then
					utilIDs['Voodoo Totem'][1] = false
				end
				
				if (not utilIDs['Wind Rush Totem'][3] and utilIDs['Wind Rush Totem'][1]) then
					utilIDs['Wind Rush Totem'][1] = false
				end
			end
		end
		
		for utilObj in pairs(utilIDs) do
			if (not utilIDs[utilObj][1] and utilIDs[utilObj][2]:IsShown()) then
				utilIDs[utilObj][2]:Hide()
				utilIDs[utilObj][1] = false
			end
		end
		
		--[[if (Auras.db.char.elements[2].isMoving) then
			self:SetBackdrop(backdrop)
			self:SetBackdropColor(0,0,0,0.85)
		else
			self:SetBackdrop(nil)
		end]]
		ToggleFrameMove(self,db.elements[2].isMoving)
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

UtilTimerBarGrp:SetScript('OnMouseDown',function(self,button)
	if (Auras.db.char.elements[2].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroupEnh',button)
	end
end)

UtilTimerBarGrp:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[2].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[2].frames[self:GetName()])
	end
end)

-- Doom Winds Alert Texture
local DoomWindsTex = CreateFrame('Frame','DoomWindsTexture',AuraGroup)
--DoomWindsTex:SetPoint('CENTER',AuraGroup,'CENTER',-150,0)
DoomWindsTex:SetWidth(125)
DoomWindsTex:SetHeight(240)
DoomWindsTex:SetFrameStrata('BACKGROUND')
--DoomWindsTex:SetStatusBarColor(1,1,1)
DoomWindsTex:SetAlpha(0)
DoomWindsTex:Show()

DoomWindsTex.texture = DoomWindsTex:CreateTexture(nil,'LOW')
DoomWindsTex.texture:SetTexture([[Textures\SpellActivationOverlays\Dark_Tiger]])
DoomWindsTex.texture:SetPoint('CENTER',DoomWindsTex,'CENTER',0,0)
DoomWindsTex.texture:SetWidth(DoomWindsTex:GetWidth() + 20)
DoomWindsTex.texture:SetHeight(DoomWindsTex:GetHeight())
--DoomWindsTex.texture:SetRotation(rad(-90))
DoomWindsTex.texture:SetAlpha(1)

DoomWindsTex.Scaler = DoomWindsTex:CreateAnimationGroup()
DoomWindsTex.Scaler:SetLooping('REPEAT')

local scalePush = 1.08
local scalePull = 1 / scalePush

DoomWindsTex.Scaler.scaleOut = DoomWindsTex.Scaler:CreateAnimation('Scale')
DoomWindsTex.Scaler.scaleOut:SetOrder(1)
DoomWindsTex.Scaler.scaleOut:SetDuration(0.5)
DoomWindsTex.Scaler.scaleOut:SetSmoothing('IN_OUT')
DoomWindsTex.Scaler.scaleOut:SetFromScale(1,1)
DoomWindsTex.Scaler.scaleOut:SetToScale(1,scalePush)
 
DoomWindsTex.Scaler.scaleIn = DoomWindsTex.Scaler:CreateAnimation('Scale')
DoomWindsTex.Scaler.scaleIn:SetOrder(2)
DoomWindsTex.Scaler.scaleIn:SetDuration(0.5)
DoomWindsTex.Scaler.scaleIn:SetSmoothing('IN_OUT')
DoomWindsTex.Scaler.scaleIn:SetFromScale(1,1)
DoomWindsTex.Scaler.scaleIn:SetToScale(1,scalePull)

DoomWindsTex:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(2)) then
		local buff = UnitBuff('player',Auras:GetSpellName(204945))
		local db = Auras.db.char
		local frm = db.elements[2].frames.DoomWindsTexture
		local isMoving = db.elements[2].isMoving
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		ToggleFrameMove(self,isMoving)
		
		if (isMoving) then
			self:SetAlpha(1)
		end
		
		if (buff and frm.isEnabled and not isMoving) then
			if (not self.Scaler:IsPlaying()) then
				self.Scaler:Play()
			end
			
			if (UnitAffectingCombat('player')) then
				self:SetAlpha(1)
			else
				self:SetAlpha(db.settings[2].OoCAlpha)
			end
		elseif (not buff and not frm.isEnabled and not isMoving) then
			self:SetAlpha(0)
			
			if (self.Scaler:IsPlaying()) then
				self.Scaler:Stop()
			end
		end
		
		--[[if (db.elements[2].isMoving) then
			self:SetBackdrop(backdrop)
			self:SetBackdropColor(0,0,0,0.85)
		else
			self:SetBackdrop(nil)
		end]]
		
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

DoomWindsTex:SetScript('OnMouseDown',function(self,button)
	if (Auras.db.char.elements[2].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroupEnh',button)
	end
end)

DoomWindsTex:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[2].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[2].frames[self:GetName()])
	end
end)

SSA.DoomWindsTexture = DoomWindsTex;
_G["SSA_DoomWindsTex"] = DoomWindsText
-- Stormstrike Charges
--local buff,count
local tempX = {
	[1] = {
		[1] = 15,
		[2] = 'LEFT',
	},
	[2] = {
		[1] = -15,
		[2] = 'RIGHT',
	},
	[3] = {
		[1] = 0,
		[2] = 'CENTER',
	},
}

local StormstrikeCharges = CreateFrame('Frame','StormstrikeChargeGrp',AuraGroup)
StormstrikeCharges:SetFrameStrata(bg)
StormstrikeCharges:SetWidth(260)
StormstrikeCharges:SetHeight(50)
StormstrikeCharges:SetPoint('CENTER',0,-100)
StormstrikeCharges:Show()

for i=1,2 do
	StormstrikeCharges['Charge'..i] = CreateFrame('Frame','StormstrikeCharge'..i,StormstrikeChargeGrp)
	StormstrikeCharges['Charge'..i]:SetWidth(100)
	StormstrikeCharges['Charge'..i]:SetHeight(100)
	StormstrikeCharges['Charge'..i]:SetPoint(tempX[i][2],StormstrikeChargeGrp,tempX[i][2],tempX[i][1],-3)
	StormstrikeCharges['Charge'..i]:SetAlpha(0)
	StormstrikeCharges['Charge'..i]:Show()

	StormstrikeCharges['Charge'..i].Lightning = CreateFrame('PlayerModel','StormstrikeCharge'..i..'_Lightning',StormstrikeCharges['Charge'..i])
	StormstrikeCharges['Charge'..i].Lightning:SetModel('spells/Monk_chiblast_precast.m2')
	StormstrikeCharges['Charge'..i].Lightning:SetFrameStrata(low)
	StormstrikeCharges['Charge'..i].Lightning:SetPosition(0,0,0)
	StormstrikeCharges['Charge'..i].Lightning:SetAllPoints(StormstrikeCharges['Charge'..i])
	StormstrikeCharges['Charge'..i].Lightning:SetAlpha(1)
	StormstrikeCharges['Charge'..i].Lightning:SetSequence(37)
end
StormstrikeCharges:SetScript('OnUpdate',function(self,elaps)
	if (Auras:CharacterCheck(2)) then
		local buff,_,_,count = UnitBuff('player',Auras:GetSpellName(201846))
		local _,_,_,selected = GetTalentInfo(5,1,1)
		local db = Auras.db.char
		local frm = db.elements[2].frames.StormstrikeChargeGrp
		local isMoving = db.elements[2].isMoving
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		ToggleFrameMove(self,isMoving)
		
		if (isMoving) then
			self.Charge1:SetAlpha(1)
			--self.Charge1.Lightning:SetModel('spells/Monk_chiblast_precast.m2')
			self.Charge2:SetAlpha(1)
			--self.Charge2.Lightning:SetModel('spells/Monk_chiblast_precast.m2')
		end
		
		if (frm.isEnabled and not isMoving) then
			if (buff) then
				
			end
			
			if (count == 2) then
				self.Charge1:SetAlpha(1)
				self.Charge2:SetAlpha(1)
			elseif (count == 1 and selected) then
				self.Charge2:SetAlpha(0)
			elseif (count == 0 or not buff) then
				self.Charge1:SetAlpha(0)
				self.Charge2:SetAlpha(0)
			end
		elseif (not frm.isEnabled and not isMoving) then
			self:SetAlpha(0)
		end

	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

StormstrikeCharges:SetScript('OnMouseDown',function(self,button)
	if (Auras.db.char.elements[2].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroupEnh',button)
	end
end)

StormstrikeCharges:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[2].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[2].frames[self:GetName()])
	end
end);

SSA.StormstrikeChargeGrp = StormstrikeCharges;

--[[StormstrikeCharges.Charge1 = CreateFrame("Frame","StormstrikeCharge1",StormstrikeChargeGrp);
StormstrikeCharges.Charge1:SetWidth(100);
StormstrikeCharges.Charge1:SetHeight(100);
StormstrikeCharges.Charge1:SetPoint("LEFT",StormstrikeChargeGrp,"LEFT",15,-3);
StormstrikeCharges.Charge1:SetAlpha(0);
StormstrikeCharges.Charge1:Show();

StormstrikeCharges.Charge1.Lightning = CreateFrame("PlayerModel","StormstrikeCharge1_Lightning",StormstrikeCharges.Charge1);
StormstrikeCharges.Charge1.Lightning:SetModel("spells/Monk_chiblast_precast.m2");
StormstrikeCharges.Charge1.Lightning:SetFrameStrata(low);
StormstrikeCharges.Charge1.Lightning:SetPosition(0,0,0);
StormstrikeCharges.Charge1.Lightning:SetAllPoints(StormstrikeCharges.Charge1);
StormstrikeCharges.Charge1.Lightning:SetAlpha(1);
elapsed = 0;
StormstrikeCharges.Charge1.Lightning:HookScript('OnUpdate', function(self, elaps)
	elapsed = elapsed + (elaps * 1000);
	self:SetSequenceTime(1, elapsed);
end);

StormstrikeCharges.Charge2 = CreateFrame("Frame","StormstrikeCharge2",StormstrikeChargeGrp);
StormstrikeCharges.Charge2:SetWidth(100);
StormstrikeCharges.Charge2:SetHeight(100);
StormstrikeCharges.Charge2:SetPoint("RIGHT",StormstrikeChargeGrp,"RIGHT",-15,-3);
StormstrikeCharges.Charge2:SetAlpha(0);
StormstrikeCharges.Charge2:Show();

StormstrikeCharges.Charge2.Lightning = CreateFrame("PlayerModel","StormstrikeCharge2_Lightning",StormstrikeCharges.Charge2);
StormstrikeCharges.Charge2.Lightning:SetModel("spells/Monk_chiblast_precast.m2");
StormstrikeCharges.Charge2.Lightning:SetFrameStrata(low);
StormstrikeCharges.Charge2.Lightning:SetPosition(0,0,0);
StormstrikeCharges.Charge2.Lightning:SetAllPoints(StormstrikeCharges.Charge2);
StormstrikeCharges.Charge2.Lightning:SetAlpha(1);
elapsed = 0;
StormstrikeCharges.Charge2.Lightning:HookScript('OnUpdate', function(self, elaps)
	elapsed = elapsed + (elaps * 1000);
	self:SetSequenceTime(1, elapsed);
end);

StormstrikeCharges.Charge3 = CreateFrame("Frame","StormstrikeCharge3",StormstrikeChargeGrp);
StormstrikeCharges.Charge3:SetWidth(100);
StormstrikeCharges.Charge3:SetHeight(100);
StormstrikeCharges.Charge3:SetPoint("CENTER",StormstrikeChargeGrp,"CENTER",0,-3);
StormstrikeCharges.Charge3:SetAlpha(0);
StormstrikeCharges.Charge3:Show();

StormstrikeCharges.Charge3.Lightning = CreateFrame("PlayerModel","StormstrikeCharge3_Lightning",StormstrikeCharges.Charge3);
StormstrikeCharges.Charge3.Lightning:SetModel("spells/Monk_chiblast_precast.m2");
StormstrikeCharges.Charge3.Lightning:SetFrameStrata(low);
StormstrikeCharges.Charge3.Lightning:SetPosition(0,0,0);
StormstrikeCharges.Charge3.Lightning:SetAllPoints(StormstrikeCharges.Charge3);
StormstrikeCharges.Charge3.Lightning:SetAlpha(1);
elapsed = 0;
StormstrikeCharges.Charge3.Lightning:HookScript('OnUpdate', function(self, elaps)
	elapsed = elapsed + (elaps * 1000);
	self:SetSequenceTime(1, elapsed);
end);]]

-------------------------------------------------------------------------------------------------------
----- Build Move UI
-------------------------------------------------------------------------------------------------------

-- Initialize Check Button Frames
SSA.MoveEnh = CreateFrame("Frame","MoveEnh",UIParent);
