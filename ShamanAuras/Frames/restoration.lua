local SSA, Auras, L, LSM = unpack(select(2,...))

local lgIcon,lgGlow,smIcon,smGlow = 32,45,25,35
local x,y = 0,0,0
local bg,low,med,high = 'BACKGROUND','LOW','MEDIUM','HIGH'
local buffTable,mainTable,utilTable = {},{},{}
local mainTotems = 0
local secondTotemSlot = 0

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
local UnitBuff, UnitDebuff = UnitBuff, UnitDebuff
local UnitCastingInfo, UnitChannelInfo = UnitCastingInfo, UnitChannelInfo
local UnitCreatureType = UnitCreatureType
local UnitGUID = UnitGUID
local UnitPower, UnitPowerMax = UnitPower, UnitPowerMax

local backdrop = {
	bgFile   = LSM.MediaTable.background['Blizzard Tooltip'],
	edgeFile = LSM.MediaTable.border['Blizzard Tooltip'],
	tile = true,
	tileSize = 16,
	edgeSize = 10
}

-- Check Current Class
local function CharacterCheck()
	local _,_,classIndex = UnitClass('player')
	local spec = GetSpecialization()
	
	if (spec == 3 and classIndex == 7) then
		return true
	else
		return false
	end
end

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
			self:SetPoint(db.layout.point,self:GetParent(),'CENTER',db.layout.x + math.floor(db.layout.height / 2),db.layout.y)
		else
			parentJustify = 'LEFT'
			self:SetPoint(db.layout.point,self:GetParent(),'CENTER',db.layout.x - math.floor(db.layout.height / 2),db.layout.y)
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

local function AdjustStatusBarText(self,db)
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

local function UpdateEarthenShield(self)
	local db  = Auras.db.char
	local bar = Auras.db.char.elements[3].statusbars.earthenShieldBar
	local shield = Auras.db.char.info.totems.eShield
	
	local progress = ((shield.dmg or 0) / shield.hp * 100);
	local remains = (shield.hp - (shield.dmg or 0));
	
	progress = 100 - progress;
	
	if (remains > 0) then
		self:SetValue(remains);
		if (bar.healthtext.isDisplayText) then
			self.healthtext:SetText(tostring(math.ceil(progress)).."%");
		else
			if (not bar.adjust.isEnabled and not db.elements[3].isMoving) then
				self.healthtext:SetText('');
			end
		end
	else
		self:SetAlpha(0);
		self.Timer:SetAlpha(0);
	end
end

-------------------------------------------------------------------------------------------------------
----- Build and Initialize Frames & Frame Groups
-------------------------------------------------------------------------------------------------------

local EventFrame = CreateFrame('Frame')

EventFrame:RegisterEvent('COMBAT_LOG_EVENT_UNFILTERED')

-- Aura Group Builder
local function CreateGroup(name,parent)
	SSA[name] = CreateFrame('Frame',name,parent)
	local Group = SSA[name]
	Group:SetFrameStrata(bg)
	Group:Show()
	
	return Group
end

-- Aura Icon Builder
local function InitializeFrames(name,parent,icon,iconSize,isGCD,glowSize,charge)
	
	SSA[name] = CreateFrame('Frame',name,parent)
	local Frame = SSA[name]
	Frame:SetFrameStrata('LOW')
	Frame:SetWidth(iconSize)
	Frame:SetHeight(iconSize)
	Frame:Show()

	-- Add the spell icon to the frame
	Frame.texture = Frame:CreateTexture(nil,'BACKGROUND')
	Frame.texture:SetTexture([[Interface\addons\ShamanAuras\media\ICONS\]]..icon)
	Frame.texture:SetAllPoints(Frame)
	
	-- Build Cooldown Frame
	Frame.CD = CreateFrame('Cooldown', name..'CD', Frame, 'CooldownFrameTemplate')
	Frame.CD:SetAllPoints(Frame)
	
	Frame.CD.text = Frame.CD:CreateFontString(nil, 'MEDIUM', 'GameFontHighlightLarge')
	Frame.CD.text:SetAllPoints(Frame.CD)
	Frame.CD.text:SetPoint('CENTER',0,0)
	Frame.CD.text:SetTextColor(1,1,0,1)
	
	-- Animation for Cooldown Frame
	Frame.CD.Flash = Frame.CD:CreateAnimationGroup()
	Frame.CD.Flash:SetLooping('BOUNCE')

	Frame.CD.Flash.fadeIn = Frame.CD.Flash:CreateAnimation('Alpha')
	Frame.CD.Flash.fadeIn:SetFromAlpha(1)
	Frame.CD.Flash.fadeIn:SetToAlpha(0.5)
	Frame.CD.Flash.fadeIn:SetDuration(0.4)
	Frame.CD.Flash.fadeIn:SetEndDelay(0.1)

	Frame.CD.Flash.fadeOut = Frame.CD.Flash:CreateAnimation('Alpha')
	Frame.CD.Flash.fadeOut:SetFromAlpha(0.5)
	Frame.CD.Flash.fadeOut:SetToAlpha(1)
	Frame.CD.Flash.fadeOut:SetDuration(0.4)
	Frame.CD.Flash.fadeOut:SetEndDelay(0.1)
	
	-- Build Cooldown Preview Frame
	Frame.PCD = CreateFrame("Cooldown", name.."PCD", Frame, "CooldownFrameTemplate");
	Frame.PCD:SetAllPoints(Frame);
	Frame.PCD:Hide();
	
	Frame.PCD.text = Frame.PCD:CreateFontString(nil, "MEDIUM", "GameFontHighlightLarge");
	Frame.PCD.text:SetPoint("CENTER",0,0);
	Frame.PCD.text:SetTextColor(1,0.85,0,1);
	
	-- Animation for Cooldown Preview
	Frame.PCD.Flash = Frame.PCD:CreateAnimationGroup()
	Frame.PCD.Flash:SetLooping('BOUNCE')

	Frame.PCD.Flash.fadeIn = Frame.PCD.Flash:CreateAnimation('Alpha')
	Frame.PCD.Flash.fadeIn:SetFromAlpha(1)
	Frame.PCD.Flash.fadeIn:SetToAlpha(0.5)
	Frame.PCD.Flash.fadeIn:SetDuration(0.4)
	Frame.PCD.Flash.fadeIn:SetEndDelay(0.1)

	Frame.PCD.Flash.fadeOut = Frame.PCD.Flash:CreateAnimation('Alpha')
	Frame.PCD.Flash.fadeOut:SetFromAlpha(0.5)
	Frame.PCD.Flash.fadeOut:SetToAlpha(1)
	Frame.PCD.Flash.fadeOut:SetDuration(0.4)
	Frame.PCD.Flash.fadeOut:SetEndDelay(0.1)
	
	-- If the current frame has a GCD (Global Cooldown) Frame, build it
	if (isGCD) then
		Frame.GCD = CreateFrame("Cooldown", name.."GCD", Frame, "CooldownFrameTemplate");
		Frame.GCD:SetAllPoints(Frame);
		Frame.GCD:Hide();
	end
	
	-- If the current frame has a glow effect, build a glow frame
	if (glowSize) then
		Frame.glow = CreateFrame('Frame',name..'Glow',Frame)
		Frame.glow:SetPoint('CENTER',0,0)
		Frame.glow:SetFrameStrata('BACKGROUND')
		Frame.glow:SetWidth(glowSize)
		Frame.glow:SetHeight(glowSize)
		Frame.glow:Show()
	end
	
	-- If the current frame has charges to track, but the Charges frame
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
	_G['SSA_'..name] = Frame
end

local AuraGroup,LargeIconGrpTop,LargeIconGrpBot,LargeIconGrpExt,SmallIconGrpLeft,SmallIconGrpRight

-- Build Restoration Aura Group Containers
AuraGroup = CreateGroup('AuraGroup3',UIParent)
LargeIconGrpTop = CreateGroup('LargeIconGrpTop3',AuraGroup)
LargeIconGrpBot = CreateGroup('LargeIconGrpBot3',AuraGroup)
LargeIconGrpExt = CreateGroup('LargeIconGrpExt3',AuraGroup)
SmallIconGrpLeft = CreateGroup('SmallIconGrpLeft3',AuraGroup)
SmallIconGrpRight = CreateGroup('SmallIconGrpRight3',AuraGroup)

-- Build Large Restoration Icon Frames
InitializeFrames('Ascendance3',LargeIconGrpBot,[[shared\ascendance]],lgIcon)
InitializeFrames('CloudburstTotem',LargeIconGrpTop,[[totems\cloudburst_totem]],lgIcon,true)
InitializeFrames('Concordance3',LargeIconGrpExt,[[shared\concordance_legionfall.tga]],lgIcon)
InitializeFrames('GiftOfQueen',LargeIconGrpBot,[[restoration\gift_of_the_queen]],lgIcon,true)
InitializeFrames('HealingRain',LargeIconGrpTop,[[shared\healing_rain]],lgIcon,true,lgGlow)
InitializeFrames('HealingStreamTotem',LargeIconGrpTop,[[totems\healing_stream_totem]],lgIcon,true,nil,true)
InitializeFrames('HealingTideTotem',LargeIconGrpBot,[[totems\healing_tide_totem]],lgIcon,true)
InitializeFrames('Riptide',LargeIconGrpTop,[[restoration\riptide]],lgIcon,true,lgGlow,true)
InitializeFrames('SpiritLinkTotem',LargeIconGrpBot,[[totems\spirit_link_totem]],lgIcon,true)
InitializeFrames('UnleashLife',LargeIconGrpTop,[[restoration\unleash_life]],lgIcon,true)
InitializeFrames('Wellspring',LargeIconGrpBot,[[restoration\wellspring]],lgIcon,true)
InitializeFrames('WindRushTotem3',LargeIconGrpBot,[[totems\wind_rush_totem]],lgIcon,true)

-- Build Small Restoration Icon Frames
InitializeFrames('AncestralGuidance3',SmallIconGrpRight,[[shared\ancestral_guidance]],smIcon)
InitializeFrames('AstralShift3',SmallIconGrpRight,[[shared\astral_shift]],smIcon)
InitializeFrames('EarthenShieldTotem',SmallIconGrpLeft,[[totems\earthen_shield_totem]],smIcon,true)
InitializeFrames('EarthgrabTotem3',SmallIconGrpRight,[[totems\earthgrab_totem]],smIcon,true)
InitializeFrames('FlameShock3',SmallIconGrpRight,[[shared\flame_shock]],smIcon,true,smGlow)
InitializeFrames('GustWind3',SmallIconGrpRight,[[shared\gust_of_wind]],smIcon,true)
InitializeFrames('Hex3',SmallIconGrpLeft,[[shared\hex]],smIcon,true)
InitializeFrames('LavaBurst3',SmallIconGrpRight,[[elemental\lava_burst]],smIcon,true,smGlow,true)
InitializeFrames('LightningSurgeTotem3',SmallIconGrpRight,[[totems\lightning_surge_totem]],smIcon,true)
InitializeFrames('PurifySpirit',SmallIconGrpLeft,[[restoration\purify_spirit]],smIcon,true)
InitializeFrames('SpiritwalkersGrace',SmallIconGrpLeft,[[restoration\spiritwalkers_grace]],smIcon)
InitializeFrames('VoodooTotem3',SmallIconGrpLeft,[[totems\voodoo_totem]],smIcon,true)
InitializeFrames('WindShear3',SmallIconGrpLeft,[[shared\wind_shear]],smIcon,false,smGlow)

-------------------------------------------------------------------------------------------------------
----- Initialize Scripts (Aura Groups)
-------------------------------------------------------------------------------------------------------

EventFrame:SetScript('OnUpdate',function(self)
	local _,_,name,_,_,rank = C_ArtifactUI.GetEquippedArtifactInfo()
	
	if (Auras:CharacterCheck(3)) then
		if (name ~= Auras.db.char.EquippedArtifact) then
			Auras.db.char.EquippedArtifact = name
			Auras:UpdateTalents()
		end
	end
end)

AuraGroup:SetScript('OnUpdate',function(self,button)
	ToggleFrameMove(self,Auras.db.char.elements[3].isMoving)
end)

AuraGroup:SetScript('OnMouseDown',function(self,button)
	if (Auras.db.char.elements[3].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroup3',button)
	end
end)

AuraGroup:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[3].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[3].frames[self:GetName()])
	end
end)

LargeIconGrpTop:SetScript('OnUpdate',function(self,button)
	ToggleFrameMove(self,Auras.db.char.elements[3].isMoving)
end)

LargeIconGrpTop:SetScript('OnMouseDown',function(self,button)
	if (Auras.db.char.elements[3].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroup3',button)
	end
end)

LargeIconGrpTop:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[3].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[3].frames[self:GetName()])
	end
end)

LargeIconGrpBot:SetScript('OnUpdate',function(self,button)
	ToggleFrameMove(self,Auras.db.char.elements[3].isMoving)
end)

LargeIconGrpBot:SetScript('OnMouseDown',function(self,button)
	if (Auras.db.char.elements[3].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroup3',button)
	end
end)

LargeIconGrpBot:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[3].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[3].frames[self:GetName()])
	end
end)

LargeIconGrpExt:SetScript('OnUpdate',function(self,button)
	ToggleFrameMove(self,Auras.db.char.elements[3].isMoving)
end)

LargeIconGrpExt:SetScript('OnMouseDown',function(self,button)
	if (Auras.db.char.elements[3].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroup3',button)
	end
end)

LargeIconGrpExt:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[3].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[3].frames[self:GetName()])
	end
end)

SmallIconGrpLeft:SetScript('OnUpdate',function(self,button)
	ToggleFrameMove(self,Auras.db.char.elements[3].isMoving)
end)

SmallIconGrpLeft:SetScript('OnMouseDown',function(self,button)
	if (Auras.db.char.elements[3].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroup3',button)
	end
end)

SmallIconGrpLeft:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[3].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[3].frames[self:GetName()])
	end
end)

SmallIconGrpRight:SetScript('OnUpdate',function(self,button)
	ToggleFrameMove(self,Auras.db.char.elements[3].isMoving)
end)

SmallIconGrpRight:SetScript('OnMouseDown',function(self,button)
	if (Auras.db.char.elements[3].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroup3',button)
	end
end)

SmallIconGrpRight:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[3].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[3].frames[self:GetName()])
	end
end)

-------------------------------------------------------------------------------------------------------
----- Initialize Scripts (Separate Auras)
-------------------------------------------------------------------------------------------------------

-- Flame Shock
SSA.FlameShock3:SetScript('OnUpdate', function(self)
	if (Auras:CharacterCheck(3)) then
		local cd = Auras.db.char.elements[3].cooldowns.secondary[2]
		local debuff,_,_,_,_,dur,expires,caster = UnitDebuff('target',Auras:GetSpellName(188838))
		local start,duration = GetSpellCooldown(Auras:GetSpellName(188838))
		local timer,seconds
		local remains = (expires or 0) - GetTime()
		
		if (not self.text) then
			self.text = self:CreateFontString(nil, 'HIGH', 'GameFontHighlightLarge')
		end
			--[[self.text:SetPoint(cd.text.justify,cd.text.x,cd.text.y)
			self.text:SetFont(LSM.MediaTable.font[cd.text.font.name] or LSM.DefaultMedia.font, cd.text.font.size,cd.text.font.flag)
			self.text:SetTextColor(cd.text.font.color.r,cd.text.font.color.g,cd.text.font.color.b,cd.text.font.color.a)
			
			if (cd.text.font.shadow.isEnabled) then
			
			else
			
			end]]
		Auras:SetCooldownFont(self.CD,cd,remains)
	
		Auras:SpellRangeCheck(self,188838,true,3)
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,3,'secondary',2,start,duration)
		
		
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true,true,3)
		end]]
		self.CD.text:Hide()
		if (expires) then
			if (remains < 10 and cd.text.formatting.alert.decimal) then
				timer,seconds = Auras:parseTime(expires - GetTime(),true,3,'secondary',2)
			else
				timer,seconds = Auras:parseTime(expires - GetTime(),false,3,'secondary',2)
			end
		end
		
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
			if (debuff and caster == 'player') then
				--timer,seconds = Auras:parseTime(expires - GetTime(),false)
				--self.text:SetText(timer)
				--Auras:CooldownHandler(self,3,'secondary',2,((expires or 0) - (dur or 0)),dur)
				if ((seconds or 0) <= Auras.db.char.settings[3].flameShock and UnitAffectingCombat('player')) then
					Auras:ToggleOverlayGlow(self.glow,true,true)
					--isGlowActive = true
				--elseif (seconds == 0) then
					--self.text:SetText('')
				else
					Auras:ToggleOverlayGlow(self.glow,false)
					--isGlowActive = false
				end
				--[[if (seconds == 0) then
					self.text:SetText('')
				else
					self.text:SetText(timer)
				end]]
			else
				--self.text:SetText('')
				self.CD:Hide()
				if (Auras:IsTargetEnemy()) then
					Auras:ToggleOverlayGlow(self.glow,	true,true)
				else
					Auras:ToggleOverlayGlow(self.glow,false)
				end
			end
		else
			--self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			if (Auras.db.char.elements[3].cooldowns.secondary[2].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			end
			
			if (debuff and caster == 'player') then
				--Auras:CooldownHandler(self,3,'secondary',2,((expires or 0) - (dur or 0)),dur)
			else
				self.CD:Hide()
			end 
			
			Auras:ToggleOverlayGlow(self.glow,false)
			--self.text:SetText('')
		end
		
		if ((seconds or 0) >= 0.1) then
			self.text:SetText(timer)
		else
			self.text:SetText('')
		end
		--[[if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			self:SetAlpha(Auras.db.char.triggers.ele.OoCAlpha)
		end]]
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

_G["SSA_FlameShockRes"] = SSA.FlameShock3

-- Lava Burst
SSA.LavaBurst3:SetScript('OnUpdate', function(self)
	if (Auras:CharacterCheck(3)) then
		local buff = UnitBuff('player',Auras:GetSpellName(77762))
		local start,duration = GetSpellCooldown(Auras:GetSpellName(51505))
		local charges,maxCharges,chgStart,chgDuration = GetSpellCharges(51505)
		local _,_,_,selected = GetTalentInfo(6,3,1)
		
		Auras:SpellRangeCheck(self,51505,true,3)	
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,3,'secondary',2,start,duration,true)
		
		if (selected) then
			if (not self.Charges:IsShown()) then
				self.Charges:Show()
			end
			
			if (charges == 2) then
				self.ChargeCD:Hide()
				self.ChargeCD:SetCooldown(0,0)
				self.Charges.text:SetText(2)
			elseif (charges < 2) then
				self.ChargeCD:Show()
				self.ChargeCD:SetCooldown(chgStart,chgDuration)
				self.Charges.text:SetText(charges)
			end
			if (charges > 0) then
				self.Charges.text:SetText(charges)
				self.CD.text:SetText('')
			else
				--Auras:ExecuteCooldown(self,chgStart,chgDuration,false,false,3)
				Auras:CooldownHandler(self,3,'secondary',2,start,duration)
				self.Charges.text:SetText('')
				self.ChargeCD:Hide()
			end
		else
			self.Charges:Hide()
		end
		
		if (UnitAffectingCombat('player')) then
			if ((duration or 0) > 2) then
				--Auras:ToggleCooldownSwipe(self.CD,true)
				--Auras:ToggleOverlayGlow(self.glow,false)
				--Auras:ExecuteCooldown(self,start,duration,false,false,3)
				Auras:CooldownHandler(self,3,'secondary',2,start,duration)
				self.CD:Show()
			elseif (buff) then
				--Auras:ToggleCooldownSwipe(self.CD,false)
				Auras:ToggleOverlayGlow(self.glow,true,false)
				self.CD:Hide()
				self.CD:SetCooldown(0,0)
				Auras:ToggleOverlayGlow(self.glow,true,false)
			else
				--Auras:ToggleCooldownSwipe(self.CD,false)
				Auras:ToggleOverlayGlow(self.glow,false)
				self.CD:Hide()
			end
		end
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			if (buff) then
				Auras:ToggleOverlayGlow(self.glow,false)
			end
			--self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			if (Auras.db.char.elements[3].cooldowns.secondary[2].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Ancestral Guidance
SSA.AncestralGuidance3:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(3)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(108281))
	
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,3,'secondary',2,start,duration)
		
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true,false,3)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			if (Auras.db.char.elements[3].cooldowns.secondary[2].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Ascendance
SSA.Ascendance3:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(3)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(114052))
	
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,3,'primary',2,start,duration)
		
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,false,false,3)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			if (Auras.db.char.elements[3].cooldowns.secondary[2].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Astral Shift
SSA.AstralShift3:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(3)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(108271))
	
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,3,'secondary',2,start,duration)
		
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true,false,3)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			if (Auras.db.char.elements[3].cooldowns.secondary[2].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Cloudburst Totem
SSA.CloudburstTotem:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(3)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(157153))
	
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,3,'primary',1,start,duration)
		
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,false,false,3)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			if (Auras.db.char.elements[3].cooldowns.primary[1].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Concordance of the Legionfall
SSA.Concordance3:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(3)) then
		local buff,_,_,count,_,duration,expires,caster = UnitBuff('player',Auras:GetSpellName(242586))
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,3,'primary',3,((expires or 0) - (duration or 0)),duration)
		
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,(expires - duration),duration,false,false,3)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
		
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			if (Auras.db.char.elements[3].cooldowns.primary[3].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Earthen Shield Totem
SSA.EarthenShieldTotem:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(3)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(198838))
	
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,3,'secondary',1,start,duration)
		
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true,false,3)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			if (Auras.db.char.elements[3].cooldowns.secondary[1].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Earthgrab Totem
SSA.EarthgrabTotem3:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(3)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(51485))
	
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,3,'secondary',2,start,duration)
		
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true,false,3)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			if (Auras.db.char.elements[3].cooldowns.secondary[2].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Gift of the Queen
SSA.GiftOfQueen:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(3)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(207778))
	
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,3,'primary',2,start,duration)
		
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,false,false,3)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			if (Auras.db.char.elements[3].cooldowns.primary[2].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Gust of Wind
SSA.GustWind3:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(3)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(192063))
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,3,'secondary',2,start,duration)
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true,false,3)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			if (Auras.db.char.elements[3].cooldowns.secondary[2].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Healing Rain
SSA.HealingRain:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(3)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(73920))
		local spiritRain = UnitBuff('player',Auras:GetSpellName(246771))
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,3,'primary',1,start,duration)
		
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,false,false,3)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			if (Auras.db.char.elements[3].cooldowns.primary[1].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			end
		end
		
		if (spiritRain) then
			Auras:ToggleOverlayGlow(self.glow,true)
		else
			Auras:ToggleOverlayGlow(self.glow,false)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Healing Stream Totem
SSA.HealingStreamTotem:SetScript('OnUpdate', function(self)
	if (Auras:CharacterCheck(3)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(5394))
		local charges,maxCharges,chgStart,chgDuration = GetSpellCharges(5394)
		local _,_,_,selected = GetTalentInfo(6,3,1)

		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,3,'primary',1,start,duration,true)
		
		if (selected) then
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
				--Auras:ExecuteCooldown(self,chgStart,chgDuration,false,false,3)
				Auras:CooldownHandler(self,3,'primary',1,chgStart,chgDuration)
				self.Charges.text:SetText('')
			end
		else
			self.Charges.text:SetText('')
			if ((duration or 0) > 2 and not buff) then
				--Auras:ToggleCooldownSwipe(self.CD,3)
				--Auras:ExecuteCooldown(self,start,duration,false,false,3)
				Auras:CooldownHandler(self,3,'primary',1,start,duration)
				self.CD:Show()
			else
				--Auras:ToggleCooldownSwipe(self.CD,false)
				self.CD:Hide()
			end
		end
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			if (Auras.db.char.elements[3].cooldowns.primary[1].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Healing Tide Totem
SSA.HealingTideTotem:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(3)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(108280))
	
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,3,'primary',2,start,duration)
		
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,false,false,3)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			if (Auras.db.char.elements[3].cooldowns.primary[2].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Hex
SSA.Hex3:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(3)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(51514))
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,3,'secondary',1,start,duration)
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true,false,3)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
		
		Auras:SpellRangeCheck(self,51514,(UnitCreatureType('target') == 'Humanoid' or UnitCreatureType('target') == 'Beast' or UnitCreatureType('target') == 'Critter'),3)	
		
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			if (Auras.db.char.elements[3].cooldowns.secondary[1].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Lightning Surge Totem
SSA.LightningSurgeTotem3:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(3)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(192058))
	
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,3,'secondary',2,start,duration)
		
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true,false,3)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			if (Auras.db.char.elements[3].cooldowns.secondary[2].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Purify Spirit
SSA.PurifySpirit:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(3)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(77130))
	
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,3,'secondary',1,start,duration)
		
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true,false,3)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			if (Auras.db.char.elements[3].cooldowns.secondary[1].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Riptide
SSA.Riptide:SetScript('OnUpdate', function(self)
	if (Auras:CharacterCheck(3)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(61295))
		local charges,maxCharges,chgStart,chgDuration = GetSpellCharges(61295)
		local _,_,_,selected = GetTalentInfo(6,3,1)
		
		local tidalForce = UnitBuff('player',Auras:GetSpellName(246729))
	
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,3,'primary',1,start,duration,true)
		
		if (selected) then
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
				--Auras:ExecuteCooldown(self,chgStart,chgDuration,false,false,3)
				Auras:CooldownHandler(self,3,'primary',1,chgStart,chgDuration)
				self.Charges.text:SetText('')
			end
		else
			self.Charges.text:SetText('')
			--if ((duration or 0) > 2 and not buff) then
			if (not buff) then
				--Auras:ToggleCooldownSwipe(self,3)
				--Auras:ExecuteCooldown(self,start,duration,false,false,3)
				Auras:CooldownHandler(self,3,'primary',1,start,duration)
				self.CD:Show()
			else
				--Auras:ToggleCooldownSwipe(self.CD,false)
				self.CD:Hide()
			end
		end
		
		if (tidalForce) then
			Auras:ToggleOverlayGlow(self.glow,true)
		else
			Auras:ToggleOverlayGlow(self.glow,false)
		end
		
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			if (Auras.db.char.elements[3].cooldowns.primary[1].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Spirit Link Totem
SSA.SpiritLinkTotem:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(3)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(98008))
		--local start2,duration2 = GetSpellCooldown(Auras:GetSpellName(204293))
		--local buff,_,_,_,_,duration,expires = UnitBuff('player',Auras:GetSpellName(204293))
	
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,3,'primary',2,start,duration)
		
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,false,false,3)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
		
		--[[if ((duration2 or 0) > 2) then
			start = expires - duration
			Auras:ExecuteCooldown(self,start,duration,false,false,3)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
		
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			if (Auras.db.char.elements[3].cooldowns.primary[2].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Spiritwalker's Grace
SSA.SpiritwalkersGrace:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(3)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(79206))
	
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,3,'secondary',1,start,duration)
		
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true,false,3)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			if (Auras.db.char.elements[3].cooldowns.secondary[1].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Unleash Life
SSA.UnleashLife:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(3)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(73685))
	
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,3,'primary',1,start,duration)
		
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,false,false,3)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			if (Auras.db.char.elements[3].cooldowns.primary[1].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Voodoo Totem
SSA.VoodooTotem3:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(3)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(196932))
	
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,3,'secondary',1,start,duration)
		
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true,false,3)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			if (Auras.db.char.elements[3].cooldowns.secondary[1].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Wellspring
SSA.Wellspring:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(3)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(197995))
	
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,3,'primary',2,start,duration)
		
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,false,false,3)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			if (Auras.db.char.elements[3].cooldowns.primary[2].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Wind Shear
SSA.WindShear3:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(3)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(57994))
		local name,_,_,_,_,_,_,_,interrupt = UnitCastingInfo('target')
	
		Auras:SpellRangeCheck(self,57994,true,3)
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,3,'secondary',1,start,duration)
		
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true,false,3)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
		
		if (name and not interrupt and (start or 0) == 0 and Auras:IsTargetEnemy()) then
			Auras:ToggleOverlayGlow(self.glow,true,true)
		else
			Auras:ToggleOverlayGlow(self.glow,false)
		end
		
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			if (Auras.db.char.elements[3].cooldowns.secondary[1].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Wind Rush Totem
SSA.WindRushTotem3:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(3)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(192077))
	
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,3,'primary',2,start,duration)
		
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true,false,3)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			if (Auras.db.char.elements[3].cooldowns.secondary[2].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[3].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-------------------------------------------------------------------------------------------------------
----- Build and Initialize Status Bars
-------------------------------------------------------------------------------------------------------

-- Casting Status Bar
local ChannelBar = CreateFrame('StatusBar','ChannelBar3',AuraGroup)

ChannelBar:SetStatusBarTexture([[Interface\addons\ShamanAuras\media\statusbar\Glamour2]])
ChannelBar:GetStatusBarTexture():SetHorizTile(false)
ChannelBar:GetStatusBarTexture():SetVertTile(false)
ChannelBar:RegisterForDrag('LeftButton')
ChannelBar:SetPoint('TOPLEFT',AuraGroup,'CENTER',0,0)
ChannelBar:Show()
ChannelBar:SetAlpha(0)

ChannelBar.spark = ChannelBar:CreateTexture(nil,'OVERLAY')
ChannelBar.spark:SetBlendMode('ADD')
ChannelBar.spark:SetTexture([[Interface\CastingBar\UI-CastingBar-Spark]])

ChannelBar.icon = ChannelBar:CreateTexture(nil,'OVERLAY')

ChannelBar.bg = ChannelBar:CreateTexture(nil,'BACKGROUND')
--ChannelBar.bg:SetTexture([[Interface\TargetingFrame\UI-StatusBar]])
ChannelBar.bg:SetAllPoints(true)
--ChannelBar.bg:SetVertexColor(0,0,0)
--ChannelBar.bg:SetAlpha(0.5)

ChannelBar.timetext = ChannelBar:CreateFontString(nil, 'HIGH', 'GameFontHighlightLarge')
ChannelBar.nametext = ChannelBar:CreateFontString(nil, 'HIGH', 'GameFontHighlightLarge')

ChannelBar.startTime = 0
ChannelBar.endTime = 0
ChannelBar.isChannel = false
ChannelBar.duration = 0
ChannelBar.progress = 0

ChannelBar:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(3)) then
		local db = Auras.db.char
		local bar = db.elements[3].statusbars.channelBar
		local isMoving = db.elements[3].isMoving
		
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
			AdjustStatusBarSpark(self,bar)
			
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
	if (Auras.db.char.elements[3].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroup3',button)
	end
end)

ChannelBar:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[3].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[3].statusbars.channelBar)
	end
end)

SSA.ChannelBar3 = ChannelBar

-- Casting Status Bar
local CastBar = CreateFrame('StatusBar','CastBar3',AuraGroup)

CastBar:SetStatusBarTexture([[Interface\addons\ShamanAuras\media\statusbar\Glamour2]])
CastBar:GetStatusBarTexture():SetHorizTile(false)
CastBar:GetStatusBarTexture():SetVertTile(false)
CastBar:RegisterForDrag('LeftButton')
CastBar:SetPoint('TOPLEFT',AuraGroup,'CENTER',0,0)
CastBar:Show()
CastBar:SetAlpha(0)

CastBar.spark = CastBar:CreateTexture(nil,'OVERLAY')
CastBar.spark:SetBlendMode('ADD')
CastBar.spark:SetTexture([[Interface\CastingBar\UI-CastingBar-Spark]])

CastBar.bg = CastBar:CreateTexture(nil,'BACKGROUND')
CastBar.bg:SetTexture('Interface\\TargetingFrame\\UI-StatusBar')
CastBar.bg:SetAllPoints(true)
CastBar.bg:SetVertexColor(0,0,0)
CastBar.bg:SetAlpha(0.5)

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
	if (Auras:CharacterCheck(3)) then
		local db = Auras.db.char
		local bar = db.elements[3].statusbars.castBar
		local isMoving = Auras.db.char.elements[3].isMoving

		ToggleProgressBarMove(self,isMoving,bar)
		
		if (not db.elements[3].statusbars.defaultBar and CastingBarFrame:IsShown()) then
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
			local name,_,texture = GetSpellInfo(51505)
			
			self.nametext:SetText(name)
			self.timetext:SetText('3.0')
			self:SetAlpha(1)
			
			AdjustStatusBarText(self.nametext,bar.nametext)
			AdjustStatusBarText(self.timetext,bar.timetext)
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
			self.safezone:SetHeight(bar.layout.height)
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
	if (Auras.db.char.elements[3].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroup3',button)
	end
end)

CastBar:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[3].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[3].statusbars.castBar)
	end
end)

SSA.CastBar3 = CastBar
_G['SSA_CastBar3'] = CastBar

local ManaBar = CreateFrame('StatusBar','ManaBar',AuraGroup)

ManaBar:SetStatusBarTexture([[Interface\addons\ShamanAuras\media\statusbar\fifths]])
ManaBar:GetStatusBarTexture():SetHorizTile(false)
ManaBar:GetStatusBarTexture():SetVertTile(false)
ManaBar:Show()
ManaBar:SetAlpha(0)

ManaBar.bg = ManaBar:CreateTexture(nil,'BACKGROUND')
ManaBar.bg:SetAllPoints(true)

ManaBar.text = ManaBar:CreateFontString(nil, 'HIGH', 'GameFontHighlightLarge')
ManaBar.text:SetPoint('CENTER',ManaBar,'CENTER',0,0)
ManaBar.text:SetTextColor(1,1,1,1)
_G["SSA_UI"] = SSA
ManaBar:SetScript('OnUpdate',function(self)	
	if (Auras:CharacterCheck(3)) then
		local isCombat = UnitAffectingCombat('player')
		local power,maxPower = UnitPower('player',19),UnitPowerMax('player',19)
		
		local db = Auras.db.char
		local bar = db.elements[3].statusbars.manaBar
		local isMoving = db.elements[3].isMoving
		
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
			local tempPower = math.floor(maxPower - (maxPower * 0.75))
			
			self:SetAlpha(1)
			
			AdjustStatusBarText(self.text,bar.text)

			if (bar.adjust.showBG) then
				self:SetValue(tempPower)
				self.text:SetText(Auras:ManaPrecision(bar.precision,false,true))
			else
				self:SetMinMaxValues(0,maxPower)
				self:SetValue(maxPower)
				self.text:SetText(maxPower)
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
			
			if (bar.text.isDisplayText) then
				self.text:SetText(Auras:ManaPrecision(bar.precision,true))
			else
				self.text:SetText('')
			end
			
			self:SetValue(UnitPower('player',19))
			
			if (isCombat) then
				self:SetAlpha(bar.alphaCombat)				
			elseif (not isCombat and Auras:IsTargetEnemy()) then
				self:SetAlpha(bar.alphaTar)
				self.bg:SetAlpha(bar.background.color.a)
			elseif (not isCombat and not Auras:IsTargetEnemy()) then
				self:SetAlpha(bar.alphaOoC)
				self.bg:SetAlpha(bar.background.color.a)
			end
		elseif (not bar.isEnabled and not isMoving and not bar.adjust.isEnabled) then
			self:SetAlpha(0)
		end
	else
		self:SetAlpha(0)
	end
end)

ManaBar:SetScript('OnMouseDown',function(self,button)
	if (Auras.db.char.elements[3].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroup3',button)
	end
end)

ManaBar:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[3].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[3].statusbars.manaBar)
	end
end)

SSA.ManaBar = ManaBar
_G['SSA_ManaBar'] = ManaBar

local function SetTidalWavesAnimationState(self,isAnimate,isShown,count,color)
	if (isShown and (not count or count == 0)) then
		self:SetValue(2)
		self:SetStatusBarColor(color.r,color.g,color.b)
		
		if (isAnimate) then
			if (not self.Flash:IsPlaying()) then
				self.Flash:Play()
			end
		else
			self:SetAlpha(1)
			if (self.Flash:IsPlaying()) then
				self.Flash:Stop()
			end
		end
	elseif (not isShown or count > 0) then
		if (self.Flash:IsPlaying()) then
			self.Flash:Stop()
		end
		if (not isShown) then
			self:SetAlpha(0)
		else
			self:SetAlpha(1)
		end
		self:SetStatusBarColor(0.35,0.76,1)
		self:SetValue(count or 0)
	end
end

local function ToggleAlpha(self,value)
	if (self:GetAlpha() ~= value) then
		self:SetAlpha(value);
	end
end
-- Build Tidal Waves Status Bar
local TidalWavesBar = CreateFrame('StatusBar','TidalWavesBar',AuraGroup)
TidalWavesBar:SetStatusBarTexture([[Interface\addons\ShamanAuras\media\statusbar\Halves]])
TidalWavesBar:GetStatusBarTexture():SetHorizTile(false)
TidalWavesBar:GetStatusBarTexture():SetVertTile(false)
TidalWavesBar:SetMinMaxValues(0,2)
TidalWavesBar:SetAlpha(0)
TidalWavesBar:Show()

TidalWavesBar.bg = TidalWavesBar:CreateTexture(nil,'BACKGROUND')
TidalWavesBar.bg:SetAllPoints(true)

-- Animation for Tidal Waves Status Bar
TidalWavesBar.Flash = TidalWavesBar:CreateAnimationGroup()
TidalWavesBar.Flash:SetLooping('BOUNCE')

TidalWavesBar.Flash.fadeIn = TidalWavesBar.Flash:CreateAnimation('Alpha')
TidalWavesBar.Flash.fadeIn:SetFromAlpha(1)
TidalWavesBar.Flash.fadeIn:SetToAlpha(0.25)
TidalWavesBar.Flash.fadeIn:SetDuration(0.33)

TidalWavesBar.Flash.fadeOut = TidalWavesBar.Flash:CreateAnimation('Alpha')
TidalWavesBar.Flash.fadeOut:SetFromAlpha(0.25)
TidalWavesBar.Flash.fadeOut:SetToAlpha(1)
TidalWavesBar.Flash.fadeOut:SetDuration(0.33)
TidalWavesBar.Flash.fadeOut:SetEndDelay(0)

TidalWavesBar.healTime = 0

TidalWavesBar:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(3)) then
		local db = Auras.db.char
		local bar = db.elements[3].statusbars.tidalWavesBar
		local isMoving = db.elements[3].isMoving

		if (isMoving or bar.adjust.isEnabled) then
			if (self.Flash:IsPlaying()) then
				self.Flash:Stop()
			end
			self:SetAlpha(1)
		end
		
		ToggleProgressBarMove(self,isMoving,bar)
		
		if (isMoving) then
			self:SetValue(2)
		end
		
		if (bar.adjust.isEnabled) then
			if (self.Flash:IsPlaying()) then
				self.Flash:Stop()
			end
			
			if (bar.adjust.showBG) then
				self:SetValue(1)
			else
				self:SetValue(2)
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
			local buff,_,_,count,_,duration,expires = UnitBuff('player',Auras:GetSpellName(53390))
			local remaining,progress
			
			if (buff) then
				remaining = expires - GetTime()
				progress = 15 - remaining
			end
		
			if (UnitAffectingCombat('player')) then
				if (Auras:IsTargetFriendly()) then
					if (bar.combatDisplay == 'Never') then
						--SSA.DataFrame.text:SetText("1")
						SetTidalWavesAnimationState(self,bar.animate,false,count,bar.emptyColor)
					elseif (bar.combatDisplay == 'On Heal Only') then
						if ((progress or 0) <= bar.OoCTime and (progress or 0) ~= 0) then
							--SSA.DataFrame.text:SetText("13")
							SetTidalWavesAnimationState(self,bar.animate,true,count,bar.emptyColor)
						else
							--SSA.DataFrame.text:SetText("14")
							SetTidalWavesAnimationState(self,bar.animate,false,count,bar.emptyColor)
						end
					else
						--SSA.DataFrame.text:SetText("2")
						SetTidalWavesAnimationState(self,bar.animate,true,count,bar.emptyColor)
					end
				else
					if (bar.combatDisplay == 'Target Only') then
						--SSA.DataFrame.text:SetText("3")
						SetTidalWavesAnimationState(self,bar.animate,false,count,bar.emptyColor)
					else
						if (bar.combatDisplay == 'Always') then
							--SSA.DataFrame.text:SetText("4")
							SetTidalWavesAnimationState(self,bar.animate,true,count,bar.emptyColor)
						elseif (bar.combatDisplay == 'Never') then
							--SSA.DataFrame.text:SetText("5")
							SetTidalWavesAnimationState(self,bar.animate,false,count,bar.emptyColor)
						elseif (bar.combatDisplay == 'Target & On Heal' or bar.combatDisplay == 'On Heal Only') then
							if ((progress or 0) <= bar.OoCTime and (progress or 0) ~= 0) then
								--SSA.DataFrame.text:SetText("6")
								SetTidalWavesAnimationState(self,bar.animate,true,count,bar.emptyColor)
							else
								--SSA.DataFrame.text:SetText("7")
								SetTidalWavesAnimationState(self,bar.animate,false,count,bar.emptyColor)
							end
						else
							--SSA.DataFrame.text:SetText("??")
						end
					end
				end
			else
				if (Auras:IsTargetFriendly()) then
					if (bar.OoCDisplay == 'Never') then
						--SSA.DataFrame.text:SetText("8")
						SetTidalWavesAnimationState(self,bar.animate,false,count,bar.emptyColor)
					elseif (bar.OoCDisplay == 'On Heal Only') then
						if ((progress or 0) <= bar.OoCTime and (progress or 0) ~= 0) then
							--SSA.DataFrame.text:SetText("13")
							SetTidalWavesAnimationState(self,bar.animate,true,count,bar.emptyColor)
						else
							--SSA.DataFrame.text:SetText("14")
							SetTidalWavesAnimationState(self,bar.animate,false,count,bar.emptyColor)
						end
					else
						--SSA.DataFrame.text:SetText("9")
						SetTidalWavesAnimationState(self,bar.animate,true,count,bar.emptyColor)
					end
				else
					--SSA.DataFrame.text:SetText("15")
					if (bar.OoCDisplay == 'Target Only') then
						--SSA.DataFrame.text:SetText("10")
						SetTidalWavesAnimationState(self,bar.animate,false,count,bar.emptyColor)
					else
						--SSA.DataFrame.text:SetText("16")
						if (bar.OoCDisplay == 'Always') then
							--SSA.DataFrame.text:SetText("11")
							SetTidalWavesAnimationState(self,bar.animate,true,count,bar.emptyColor)
						elseif (bar.OoCDisplay == 'Never') then
							--SSA.DataFrame.text:SetText("12")
							SetTidalWavesAnimationState(self,bar.animate,false,count,bar.emptyColor)
						elseif (bar.OoCDisplay == 'Target & On Heal' or bar.OoCDisplay == 'On Heal Only') then
							if ((progress or 0) <= bar.OoCTime and (progress or 0) ~= 0) then
								--SSA.DataFrame.text:SetText("13")
								SetTidalWavesAnimationState(self,bar.animate,true,count,bar.emptyColor)
							else
								--SSA.DataFrame.text:SetText("14")
								SetTidalWavesAnimationState(self,bar.animate,false,count,bar.emptyColor)
							end
						end
					end
				end	
			end
		elseif (not bar.isEnabled and not isMoving and not bar.adjust.isEnabled) then
			
			if (self.Flash:IsPlaying()) then
				self.Flash:Stop()
			end
			self:SetAlpha(0)
		end
	else
		if (self.Flash:IsPlaying()) then
			self.Flash:Stop()
		end
		self:SetAlpha(0)
	end
end)

TidalWavesBar:SetScript('OnMouseDown',function(self,button)
	if (Auras.db.char.elements[3].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroup3',button)
	end
end)

TidalWavesBar:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[3].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[3].statusbars.tidalWavesBar)
	end
end)

SSA.TidalWavesBar = TidalWavesBar
_G["SSA_TidalWavesBar"] = TidalWavesBar
-- Build Cloudburst Totem Status Bar
--[[SSA.CloudburstAbsorbBar = CreateFrame("StatusBar","CloudburstAbsorbBar",AuraGroup);
local CloudburstAbsorbBar = SSA.CloudburstAbsorbBar;
CloudburstAbsorbBar:SetStatusBarTexture("Interface\\addons\\ShamanAuras\\media\\statusbar\\fifths");
CloudburstAbsorbBar:GetStatusBarTexture():SetHorizTile(false);
CloudburstAbsorbBar:GetStatusBarTexture():SetVertTile(false);
CloudburstAbsorbBar:SetPoint("CENTER",AuraGroup,"CENTER",0,-139);
CloudburstAbsorbBar:SetWidth(260);
CloudburstAbsorbBar:SetHeight(18);
CloudburstAbsorbBar:SetFrameStrata("LOW");
CloudburstAbsorbBar:SetStatusBarColor(0,0.5,1);
CloudburstAbsorbBar:Hide();

CloudburstAbsorbBar.bg = CloudburstAbsorbBar:CreateTexture(nil,"BACKGROUND");
CloudburstAbsorbBar.bg:SetTexture("Interface\\TargetingFrame\\UI-StatusBar");
CloudburstAbsorbBar.bg:SetAllPoints(true);
CloudburstAbsorbBar.bg:SetVertexColor(0,0,0);
CloudburstAbsorbBar.bg:SetAlpha(0.5);

CloudburstAbsorbBar.text = CloudburstAbsorbBar:CreateFontString(nil, "HIGH", "GameFontHighlightLarge");
CloudburstAbsorbBar.text:SetPoint("CENTER",CloudburstAbsorbBar,"RIGHT",-25,0);
CloudburstAbsorbBar.text:SetFont("Interface\\addons\\ShamanAuras\\Media\\fonts\\Continuum_Medium.ttf", 12);
CloudburstAbsorbBar.text:SetTextColor(1,1,1,1);

-- Build Cloudburst Timer Status Bar
CloudburstAbsorbBar.Timer = CreateFrame("StatusBar","CloudburstTimer",CloudburstAbsorbBar);
CloudburstAbsorbBar.Timer:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar");
CloudburstAbsorbBar.Timer:GetStatusBarTexture():SetHorizTile(false);
CloudburstAbsorbBar.Timer:GetStatusBarTexture():SetVertTile(false);
CloudburstAbsorbBar.Timer:SetWidth(CloudburstAbsorbBar:GetWidth());
CloudburstAbsorbBar.Timer:SetHeight(CloudburstAbsorbBar:GetHeight());
CloudburstAbsorbBar.Timer:SetFrameStrata("MEDIUM");
CloudburstAbsorbBar.Timer:SetPoint("CENTER",CloudburstAbsorbBar,"CENTER",0,0);
CloudburstAbsorbBar.Timer:SetStatusBarColor(1,1,1,0.35);
CloudburstAbsorbBar.Timer:Hide();

CloudburstAbsorbBar.Timer.text = CloudburstAbsorbBar.Timer:CreateFontString(nil, "HIGH", "GameFontHighlightLarge");
CloudburstAbsorbBar.Timer.text:SetPoint("CENTER",CloudburstAbsorbBar.Timer,"LEFT",25,0);
CloudburstAbsorbBar.Timer.text:SetFont("Interface\\addons\\ShamanAuras\\Media\\fonts\\Continuum_Medium.ttf", 12);
CloudburstAbsorbBar.Timer.text:SetTextColor(1,1,1,1);]]
--[[local BackdropCB = {
	bgFile    = "Interface\\AddOns\\rSetBackdrop\\tga\\background_flat",
	edgeFile  = "Interface\\AddOns\\rSetBackdrop\\tga\\UI-Tooltip-Border",
	tile      = false,
	tileSize  = 16, 
	edgeSize  = 16, 
	insets     = {
		left = 4,
		right = 4,
		top = 4,
		bottom = 4,
	},
};]]
local BackdropCB = SSA.BackdropCB
local BackdropCBInner = {
	bgFile    = [[Interface\AddOns\ShamanAuras\media\icons\totems\cloudburst_totem]], 
	edgeFile  = [[Interface\AddOns\ShamanAuras\media\textures\tooltip_border]],
	tile      = false,
	tileSize  = 16, 
	edgeSize  = 16,
}
--[[SSA.Cloudburst = CreateFrame('Frame','Cloudburst',AuraGroup)
_G['SSA_Cloudburst'] = SSA.Cloudburst
local Cloudburst = SSA.Cloudburst]]
local absorbed,duration,name
local Cloudburst = CreateFrame('Frame','Cloudburst',AuraGroup)
Cloudburst:SetFrameLevel(1)
--Cloudburst:SetWidth(150)
--Cloudburst:SetHeight(32)
Cloudburst:SetPoint('CENTER',AuraGroup,'CENTER',-200,0)
Cloudburst:SetBackdrop(BackdropCB)
Cloudburst:SetBackdropColor(1,1,1,1)
Cloudburst:SetBackdropBorderColor(1,1,1,1)
Cloudburst:SetAlpha(0)
Cloudburst:Show()

Cloudburst.text = Cloudburst:CreateFontString(nil, 'MEDIUM', 'GameFontHighlightLarge')
Cloudburst.text:SetPoint('RIGHT',Cloudburst,'RIGHT',-5,-1)
--Cloudburst.text:SetPoint('CENTER',0,0)
Cloudburst.text:SetTextColor(0,1,0,1)
Cloudburst.text:SetFont([[Fonts\FRIZQT__.TTF]],22,'OUTLINE')
Cloudburst.text:SetJustifyH('LEFT')
Cloudburst.text:SetText('0')
--[[Cloudburst.inner = CreateFrame('Frame',nil,Cloudburst)
Cloudburst.inner:SetPoint('TOPLEFT',Cloudburst,'TOPLEFT',8,-8)
Cloudburst.inner:SetPoint('BOTTOMRIGHT',Cloudburst,'BOTTOMRIGHT',-8,8)
Cloudburst.inner:SetBackdrop(BackdropCBInner)
Cloudburst.inner:SetBackdropColor(0.15,0.8,1,0)
Cloudburst.inner:SetBackdropBorderColor(1,1,1,1)]]

Cloudburst.icon = CreateFrame('Frame',nil,Cloudburst)
Cloudburst:SetFrameLevel(2)
Cloudburst.icon:SetWidth(40)
Cloudburst.icon:SetHeight(40)
Cloudburst.icon:SetPoint('LEFT',Cloudburst,'LEFT',0,0)
Cloudburst.icon:SetBackdrop(BackdropCB)
Cloudburst.icon:SetBackdropColor(1,1,1,0)
Cloudburst.icon:SetBackdropBorderColor(1,1,1,1)

Cloudburst.icon.texture = Cloudburst.icon:CreateTexture(nil,'BACKGROUND')
Cloudburst.icon.texture:SetTexture([[Interface\addons\ShamanAuras\Media\icons\totems\cloudburst_totem_bevel]])
Cloudburst.icon.texture:SetAllPoints(Cloudburst.icon)

Cloudburst.icon.text = Cloudburst.icon:CreateFontString(nil, 'MEDIUM', 'GameFontHighlightLarge')
Cloudburst.icon.text:SetAllPoints(Cloudburst.icon)
Cloudburst.icon.text:SetPoint('CENTER',0,0)
Cloudburst.icon.text:SetTextColor(1,1,0,1)
Cloudburst.icon.text:SetFont([[Interface\addons\ShamanAuras\media\fonts\PT_Sans_Narrow.TTF]], 20,'OUTLINE')
	
Cloudburst:SetScript('OnUpdate',function(self,elapsed)
	if (Auras:CharacterCheck(3)) then
		local db = Auras.db.char
	
		local _,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,absorbed = UnitBuff('player',Auras:GetSpellName(157153))
	
		Auras:ToggleAuraVisibility(self,true,'showhide')
		ToggleFrameMove(self,db.elements[3].isMoving)
		
		if (not self:IsShown()) then
			self:Show()
		end
		
		for i=1,5 do
			_,name = GetTotemInfo(i)
			if (name == 'Cloudburst Totem') then
				duration = GetTotemTimeLeft(i)
			end
		end

		if (not db.elements[3].isMoving) then
			if (not self:GetBackdrop()) then
				self:SetBackdrop(BackdropCB)
			end
			
			if (absorbed and db.elements[3].frames.Cloudburst.isEnabled) then
				self.icon.text:SetText(duration)
				self:SetAlpha(1)
				self.text:SetText(absorbed)
			else
				self:SetAlpha(0)
				self.text:SetText('0')
				SSA.CloudburstTotemBar:Hide()
			end
		else
			self:SetAlpha(1)
		end
		
		
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

Cloudburst:SetScript('OnMouseDown',function(self,button)
	if (Auras.db.char.elements[3].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroup3',button)
	end
end)

Cloudburst:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[3].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[3].frames[self:GetName()])
	end
end)

_G["SSA_Cloudburst"] = Cloudburst;
SSA.Cloudburst = Cloudburst;
--[[Cloudburst.icon.inner = CreateFrame("Frame",nil,Cloudburst);
Cloudburst.icon.inner:SetPoint("TOPLEFT",Cloudburst,"TOPLEFT",8,-8);
Cloudburst.icon.inner:SetPoint("BOTTOMRIGHT",Cloudburst,"BOTTOMRIGHT",-8,8);
Cloudburst.icon.inner:SetBackdrop(BackdropCBInner);
Cloudburst.icon.inner:SetBackdropColor(0.15,0.8,1,0);
Cloudburst.icon.inner:SetBackdropBorderColor(1,1,1,1);]]

-- Build Earthen Shield Status Bar
--SSA.EarthenShieldTotemBar = CreateFrame("StatusBar","EarthenShieldTotemBar",AuraGroup);
--local EarthenShieldTotemBar = SSA.EarthenShieldTotemBar;


local EarthenShieldTotemBar = CreateFrame('StatusBar','EarthenShieldTotemBar',AuraGroup)
_G['SSA_EarthenShield'] = EarthenShieldTotemBar
EarthenShieldTotemBar:SetStatusBarTexture([[Interface\addons\ShamanAuras\media\statusbar\fifths]])
EarthenShieldTotemBar:GetStatusBarTexture():SetHorizTile(false)
EarthenShieldTotemBar:GetStatusBarTexture():SetVertTile(false)
EarthenShieldTotemBar:Show()
EarthenShieldTotemBar:SetAlpha(0)

EarthenShieldTotemBar.bg = EarthenShieldTotemBar:CreateTexture(nil,'BACKGROUND')
EarthenShieldTotemBar.bg:SetAllPoints(true)

EarthenShieldTotemBar.Timer = CreateFrame('StatusBar','EarthenShieldTimer',EarthenShieldTotemBar)
EarthenShieldTotemBar.Timer:SetStatusBarTexture([[Interface\TargetingFrame\UI-StatusBar]])
EarthenShieldTotemBar.Timer:GetStatusBarTexture():SetHorizTile(false)
EarthenShieldTotemBar.Timer:GetStatusBarTexture():SetVertTile(false)
EarthenShieldTotemBar.Timer:SetMinMaxValues(0,15)
EarthenShieldTotemBar.Timer:Show()
--EarthenShieldTotemBar.Timer:SetAlpha(0)

EarthenShieldTotemBar.healthtext = EarthenShieldTotemBar.Timer:CreateFontString(nil, 'HIGH', 'GameFontHighlightLarge')
EarthenShieldTotemBar.timetext = EarthenShieldTotemBar.Timer:CreateFontString(nil, 'HIGH', 'GameFontHighlightLarge')

EarthenShieldTotemBar.expires = 0
EarthenShieldTotemBar.GUID = 0
EarthenShieldTotemBar.isSummoned = false

EarthenShieldTotemBar:SetScript('OnUpdate',function(self,elapsed)
	if (Auras:CharacterCheck(3)) then
		local db = Auras.db.char
		local bar = db.elements[3].statusbars.earthenShieldBar
		local isMoving = db.elements[3].isMoving
		local maxHealth = UnitHealthMax('player')
		
		local timer,seconds = Auras:parseTime(((self.expires or 0) - GetTime()),true)
		
		local _,maxVal = self:GetMinMaxValues()
		
		if (maxVal ~= maxHealth) then
			self:SetMinMaxValues(0,maxHealth)
		end
		
		ToggleProgressBarMove(self,isMoving,bar)
		
		if (isMoving) then
			self:SetValue(maxHealth)
			self.healthtext:SetText('100%')
			self.timetext:SetText('15.0')
			self.Timer:SetValue(15)
		end
		
		if (bar.adjust.isEnabled) then
			self.healthtext:SetText('75%')
			self.timetext:SetText('5.0')
			
			self:SetAlpha(1)
			
			AdjustStatusBarText(self.healthtext,bar.healthtext)
			AdjustStatusBarText(self.timetext,bar.timetext)
			
			self:SetMinMaxValues(0,1)
			self:SetValue(0.75)
			self.Timer:SetValue(5)
			
			if (bar.adjust.showBG) then
				self:SetValue(maxHealth - (maxHealth * 0.75))
				self.healthtext:SetText("25%")
			else
				self:SetValue(maxHealth)
				self.healthtext:SetText("100%")
			end

			if (bar.adjust.showTimer) then
				self.Timer:SetStatusBarTexture(LSM.MediaTable.statusbar[bar.timerBar.texture])
			else
				self.Timer:SetStatusBarTexture(nil)
			end
			
			self:SetStatusBarTexture(LSM.MediaTable.statusbar[bar.foreground.texture])
			self:SetStatusBarColor(bar.foreground.color.r,bar.foreground.color.g,bar.foreground.color.b)
			
			self.Timer:SetStatusBarColor(bar.timerBar.color.r,bar.timerBar.color.g,bar.timerBar.color.b,bar.timerBar.color.a)
			
			self.bg:SetTexture(LSM.MediaTable.statusbar[bar.background.texture])
			self.bg:SetVertexColor(bar.background.color.r,bar.background.color.g,bar.background.color.b,bar.background.color.a)
			
			self:SetWidth(bar.layout.width)
			self:SetHeight(bar.layout.height)
			self:SetPoint(bar.layout.point,AuraGroup,bar.layout.point,bar.layout.x,bar.layout.y)
			self:SetFrameStrata(bar.layout.strata)
			
			self.Timer:SetWidth(bar.layout.width)
			self.Timer:SetHeight(bar.layout.height)
			self.Timer:SetFrameStrata(bar.layout.strata)
			self.Timer:SetAlpha(1)
		end
		
		if (bar.isEnabled and not bar.adjust.isEnabled and not isMoving) then		
			
			if (self.GUID ~= 0) then
				self.Timer:SetAlpha(1)
				self.Timer:SetValue(seconds)
				if (UnitAffectingCombat('player')) then
					self:SetAlpha(bar.alphaCombat)
				else
					self:SetAlpha(bar.alphaOoC)
				end
				if (bar.timetext.isDisplayText) then
					self.timetext:SetText(timer)
				else
					self.timetext:SetText('')
				end
			else
				self:SetAlpha(0)
				self.Timer:SetValue(0)
				self.timetext:SetText('')
			end
			
		elseif (not bar.isEnabled and not isMoving and not bar.adjust.isEnabled) then
			self:SetAlpha(0)
		end
	else
		self:SetAlpha(0)
	end
end)

EarthenShieldTotemBar:SetScript('OnMouseDown',function(self,button)
	if (Auras.db.char.elements[3].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroup3',button)
	end
end)

EarthenShieldTotemBar:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[3].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[3].statusbars.earthenShieldBar)
	end
end)

SSA.EarthenShieldTotemBar = EarthenShieldTotemBar

-- Build Buff Timer Status Bar Group
local BuffTimerBarGrp = CreateFrame('Frame','BuffTimerBarGrp3',AuraGroup)
BuffTimerBarGrp:SetWidth(131)
BuffTimerBarGrp:SetHeight(180)
BuffTimerBarGrp:SetBackdrop(nil)
BuffTimerBarGrp:Show()
SSA.BuffTimerBarGrp3 = BuffTimerBarGrp
_G['SSA_BuffTimerBarGrp3'] = BuffTimerBarGrp

-- Build Main Timer Status Bar Group
local MainTimerBarGrp = CreateFrame('Frame','MainTimerBarGrp3',AuraGroup)
MainTimerBarGrp:SetWidth(105)
MainTimerBarGrp:SetHeight(180)
MainTimerBarGrp:SetBackdrop(nil)
MainTimerBarGrp:Show()
SSA.MainTimerBarGrp3 = MainTimerBarGrp
_G['SSA_MainTimerBarGrp3'] = MainTimerBarGrp

-- Build Utility Timer Status Bar Group
local UtilTimerBarGrp = CreateFrame('Frame','UtilTimerBarGrp3',AuraGroup)
UtilTimerBarGrp:SetWidth(47)
UtilTimerBarGrp:SetHeight(180)
UtilTimerBarGrp:SetBackdrop(nil)
UtilTimerBarGrp:Show()
SSA.UtilTimerBarGrp3 = UtilTimerBarGrp
_G['SSA_UtilTimerBarGrp3'] = UtilTimerBarGrp

-- Build Restoration Vertical Status Bars
SSA.AncestralGuidanceBar3 = CreateFrame('StatusBar','AncestralGuidanceBar3',BuffTimerBarGrp)
SSA.AncestralProtectionTotemBar = CreateFrame('StatusBar','AncestralProtectionTotemBar',MainTimerBarGrp)
SSA.AscendanceBar3 = CreateFrame('StatusBar','AscendanceBar3',BuffTimerBarGrp)
SSA.AstralShiftBar3 = CreateFrame('StatusBar','AstralShiftBar3',BuffTimerBarGrp)
SSA.BloodlustBar3 = CreateFrame('StatusBar','BloodlustBar3',BuffTimerBarGrp)
SSA.CloudburstTotemBar = CreateFrame('StatusBar','CloudburstTotemBar',MainTimerBarGrp)
SSA.EarthgrabTotemBar3 = CreateFrame('StatusBar','EarthgrabTotemBar3',UtilTimerBarGrp)
SSA.HealingStreamTotemOneBar = CreateFrame('StatusBar','HealingStreamTotemOneBar',MainTimerBarGrp)
SSA.HealingStreamTotemTwoBar = CreateFrame('StatusBar','HealingStreamTotemTwoBar',MainTimerBarGrp)
SSA.HealingTideTotemBar = CreateFrame('StatusBar','HealingTideTotemBar',MainTimerBarGrp)
SSA.HeroismBar3 = CreateFrame('StatusBar','HeroismBar3',BuffTimerBarGrp)
SSA.HexBar3 = CreateFrame('StatusBar','HexBar3',UtilTimerBarGrp)
SSA.SpiritLinkTotemBar = CreateFrame('StatusBar','SpiritLinkTotemBar',MainTimerBarGrp)
SSA.SpiritwalkersGraceBar = CreateFrame('StatusBar','SpiritwalkersGraceBar',BuffTimerBarGrp)
SSA.TimeWarpBar3 = CreateFrame('StatusBar','TimeWarpBar3',BuffTimerBarGrp)
SSA.UnleashLifeBar = CreateFrame('StatusBar','UnleashLifeBar',BuffTimerBarGrp)
SSA.VoodooTotemBar3 = CreateFrame('StatusBar','VoodooTotemBar3',UtilTimerBarGrp)
SSA.WindRushTotemBar3 = CreateFrame('StatusBar','WindRushTotemBar3',UtilTimerBarGrp)

local buffIDs = {
	[108281] = {
		[1] = SSA.AncestralGuidanceBar3,
		[2] = 'ancestralGuidance',
	},
	[114052] = {
		[1] = SSA.AscendanceBar3,
		[2] = 'ascendance',
	},
	[108271] = {
		[1] = SSA.AstralShiftBar3,
		[2] = 'astralShift',
	},
	[2825] = {
		[1] = SSA.BloodlustBar3,
		[2] = 'bloodlust',
	},
	[32182]  = {
		[1] = SSA.HeroismBar3,
		[2] = 'heroism',
	},
	[79206] = {
		[1] = SSA.SpiritwalkersGraceBar,
		[2] = 'spiritwalkersGrace',
	},
	[80353] = {
		[1] = SSA.TimeWarpBar3,
		[2] = 'timeWarp',
	},
	[73685] = {
		[1] = SSA.UnleashLifeBar,
		[2] = 'unleashLife',
	},
}

local mainIDs = {
	["Ancestral Protection Totem"] = {
		[1] = false,
		[2] = SSA.AncestralProtectionTotemBar,
		[3] = false,
	},
	["Cloudburst Totem"] = {
		[1] = false,
		[2] = SSA.CloudburstTotemBar,
		[3] = false,
	},
	["Healing Stream Totem One"] = {
		[1] = false,
		[2] = SSA.HealingStreamTotemOneBar,
		[3] = false,
	},
	["Healing Stream Totem Two"] = {
		[1] = false,
		[2] = SSA.HealingStreamTotemTwoBar,
		[3] = false,
	},
	["Healing Tide Totem"] = {
		[1] = false,
		[2] = SSA.HealingTideTotemBar,
		[3] = false,
	},
	["Spirit Link Totem"] = {
		[1] = false,
		[2] = SSA.SpiritLinkTotemBar,
		[3] = false,
	},
}
local utilIDs = {
	["Earthgrab Totem"] = {
		[1] = false,
		[2] = SSA.EarthgrabTotemBar3,
		[3] = false,
	},
	["Voodoo Totem"] = {
		[1] = false,
		[2] = SSA.VoodooTotemBar3,
		[3] = false,
	},
	["Wind Rush Totem"] = {
		[1] = false,
		[2] = SSA.WindRushTotemBar3,
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
	if (Auras:CharacterCheck(3)) then
		local db = Auras.db.char
		Auras:ToggleAuraVisibility(self,true,'showhide')
		
		local xPosCtr = 1
		
		for i=1,50 do
			local buff,_,_,_,_,duration,expires,caster,_,_,spellID = UnitBuff('player',i)

			if (buff) then
				if (buffIDs[spellID]) then
					--if (db.auras[3][buffIDs[spellID]:GetName()]) then
					if (db.elements[3].timerbars.buff[buffIDs[spellID][2]]) then
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
		
		--SSA.DataFrame.text:SetText('')
		for id in pairs(buffIDs) do
			local buff = UnitBuff('player',Auras:GetSpellName(id))
			--SSA.DataFrame.text:SetText(Auras:CurText('DataFrame').."'"..tostring(id).."'\n")
			if (buffIDs[id][1]:IsShown() and not buff) then
				buffIDs[id][1]:Hide()
			end
		end
		
		ToggleFrameMove(self,db.elements[3].isMoving)
		--[[if (db.elements[3].isMoving) then
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
	if (Auras.db.char.elements[3].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroup3',button)
	end
end)

BuffTimerBarGrp:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[3].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[3].frames[self:GetName()])
	end
end)

MainTimerBarGrp:SetScript('OnUpdate',function(self,event,...)
	if (Auras:CharacterCheck(3)) then
		local db = Auras.db.char
		local totemCtr = 0
		local streamCtr = 0
		local x
		local _,_,_,selected = GetTalentInfo(6,3,1)
	
		mainIDs['Ancestral Protection Totem'][3] = false
		mainIDs['Cloudburst Totem'][3] = false
		mainIDs['Healing Stream Totem One'][3] = false
		mainIDs['Healing Stream Totem Two'][3] = false
		mainIDs['Healing Tide Totem'][3] = false
		mainIDs['Spirit Link Totem'][3] = false
		
		
		
		Auras:ToggleAuraVisibility(self,true,'showhide')

		for i=1,5 do
			local _,name,start,duration = GetTotemInfo(i)

			if (secondTotemSlot > 0 and i == secondTotemSlot and name ~= 'Healing Stream Totem') then
				secondTotemSlot = 0
			end
					
			if (duration > 0) then
				local timer,seconds = Auras:parseTime((start + duration) - GetTime(),true)

				if (name == 'Healing Stream Totem' and not selected) then
					name = 'Healing Stream Totem One'
				elseif (name == 'Healing Stream Totem' and selected) then
					streamCtr = streamCtr + 1
					
					
					if (streamCtr == 2) then
						secondTotemSlot = i
					end
					
					if (secondTotemSlot > 0 and i == secondTotemSlot) then
						name = 'Healing Stream Totem Two'
					else
						name = 'Healing Stream Totem One'
					end
				end

				
				if (mainIDs[name]) then
				--if (mainIDs[name]) then
					mainIDs[name][3] = true
					--if (db.auras[3][gsub(name,' ','')..'Bar']) then
					subName = gsub(name," ",'')
					subName = gsub(subName,"^%a",lower)
					if (db.elements[3].timerbars.main[subName]) then
						totemCtr = totemCtr + 1
						if (seconds > 0.1) then
							mainIDs[name][2]:SetMinMaxValues(0,duration)
							mainIDs[name][2]:SetValue(seconds)
							mainIDs[name][2].timetext:SetText(timer)
							mainIDs[name][2]:SetPoint('RIGHT',(xPos[totemCtr] * -1),0)
							mainIDs[name][2]:Show()
							mainIDs[name][1] = true
						else
							totemCtr = totemCtr - 1
							mainIDs[name][2]:SetValue(0)
							mainIDs[name][2]:Hide()
							mainIDs[name][1] = false
						end
					else
						mainIDs[name][2]:Hide()
					end
				end
				--end
			end
			
			if (i==5) then
				if (not mainIDs['Ancestral Protection Totem'][3] and mainIDs['Ancestral Protection Totem'][1]) then
					mainIDs['Ancestral Protection Totem'][1] = false
				end
				
				if (not mainIDs['Cloudburst Totem'][3] and mainIDs['Cloudburst Totem'][1]) then
					mainIDs['Cloudburst Totem'][1] = false
				end
				
				if (not mainIDs['Healing Stream Totem One'][3] and mainIDs['Healing Stream Totem One'][1]) then
					mainIDs['Healing Stream Totem One'][1] = false
				end
				
				if (not mainIDs['Healing Stream Totem Two'][3] and mainIDs['Healing Stream Totem Two'][1]) then
					mainIDs['Healing Stream Totem Two'][1] = false
				end
				
				if (not mainIDs['Healing Tide Totem'][3] and mainIDs['Healing Tide Totem'][1]) then
					mainIDs['Healing Tide Totem'][1] = false
				end
				
				if (not mainIDs['Spirit Link Totem'][3] and mainIDs['Spirit Link Totem'][1]) then
					mainIDs['Spirit Link Totem'][1] = false
				end
			end
		end
		
		for mainObj in pairs(mainIDs) do
			--SSA_DataFrame.text:SetText(mainObj)
			if (not mainIDs[mainObj][1] and mainIDs[mainObj][2]:IsShown()) then
				mainIDs[mainObj][2]:Hide()
				mainIDs[mainObj][1] = false
			end
		end
		
		mainTotems = totemCtr
		
		if (mainTotems == 0 and mainIDs['Cloudburst Totem'][2]:IsShown()) then
			mainIDs['Cloudburst Totem'][2]:Hide()
			mainIDs['Cloudburst Totem'][2]:SetValue(0)
		end
		
		--SSA.DataFrame.text:SetText(Auras:CurText('DataFrame')..'\nNum Totems: '..tostring(mainTotems)..'\nMemory Usage: '..GetAddOnMemoryUsage('ShamanAurasDev'))
		--[[if (db.elements[3].isMoving) then
			self:SetBackdrop(backdrop)
			self:SetBackdropColor(0,0,0,0.85)
		else
			self:SetBackdrop(nil)
		end]]
		ToggleFrameMove(self,db.elements[3].isMoving)
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

MainTimerBarGrp:SetScript('OnMouseDown',function(self,button)
	if (Auras.db.char.elements[3].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroup3',button)
	end
end)

MainTimerBarGrp:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[3].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[3].frames[self:GetName()])
	end
end)

UtilTimerBarGrp:SetScript('OnUpdate',function(self,event,...)
	if (Auras:CharacterCheck(3)) then
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
				subName = gsub(name," ",'')
				subName = gsub(subName,"^%a",lower)
				if (db.elements[3].timerbars.util[subName]) then
				--if (db.auras[3][gsub(name,' ','')..'Bar3']) then
					local timer,seconds = Auras:parseTime((start + duration) - GetTime(),true)
					
					if (utilIDs[name]) then
						utilIDs[name][3] = true
						totemCtr = totemCtr + 1
						
						if (mainTotems > 0) then
							x = xOffset[mainTotems + (totemCtr - 1)]
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
			else
				--[[if (name and name ~= '') then
					utilIDs[name][2]:Hide()
				end]]
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
		
		--[[if (db.elements[3].isMoving) then
			self:SetBackdrop(backdrop)
			self:SetBackdropColor(0,0,0,0.85)
		else
			self:SetBackdrop(nil)
		end]]
		ToggleFrameMove(self,db.elements[3].isMoving)
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

UtilTimerBarGrp:SetScript("OnMouseDown",function(self,button)
	if (Auras.db.char.elements[3].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroup3',button)
	end
end)

UtilTimerBarGrp:SetScript("OnMouseUp",function(self,button)
	if (Auras.db.char.elements[3].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[3].frames[self:GetName()])
	end
end)

--[[-- Undulation Notification
SSA.Undulation = CreateFrame('Frame','Undulation',AuraGroup)
local Undulation = SSA.Undulation
Undulation:SetPoint('CENTER',0,-210)
Undulation:SetWidth(400)
Undulation:SetHeight(180)
Undulation:SetFrameStrata('BACKGROUND')
Undulation:Hide()

Undulation.texture = Undulation:CreateTexture(nil,'LOW')
Undulation.texture:SetTexture('Textures\\SpellActivationOverlays\\Monk_Serpent')
Undulation.texture:SetPoint('CENTER',Undulation,'CENTER',0,0)
Undulation.texture:SetWidth(Undulation:GetWidth() + 20)
Undulation.texture:SetHeight(Undulation:GetHeight())
Undulation.texture:SetRotation(math.rad(-90))
Undulation.texture:SetAlpha(0.7)

-- Animation for Totem Mastery Notification Texture
Undulation.Flash = Undulation.texture:CreateAnimationGroup()
Undulation.Flash:SetLooping('BOUNCE')

Undulation.Flash.fadeIn = Undulation.Flash:CreateAnimation('Alpha')
Undulation.Flash.fadeIn:SetFromAlpha(1)
Undulation.Flash.fadeIn:SetToAlpha(0.4)
Undulation.Flash.fadeIn:SetDuration(0.4)

Undulation.Flash.fadeOut = Undulation.Flash:CreateAnimation('Alpha')
Undulation.Flash.fadeOut:SetFromAlpha(0.4)
Undulation.Flash.fadeOut:SetToAlpha(1)
Undulation.Flash.fadeOut:SetDuration(0.4)
Undulation.Flash.fadeOut:SetEndDelay(0)]]

--SSA.ErrorFrame.text:SetText('Name: '..StormkeeperCharges:GetName())
local Undulation = CreateFrame('Frame','Undulation',AuraGroup)
--local StormkeeperCharge1 = SSA.StormkeeperCharge1
Undulation:SetWidth(60)
Undulation:SetHeight(60)
Undulation:SetPoint('CENTER',AuraGroup,'CENTER',0,-275)
Undulation:SetAlpha(0)
Undulation:Show()

Undulation.Model = CreateFrame('PlayerModel','StormkeeperCharge1_Orb',Undulation)
Undulation.Model:SetModel('SPELLS/Monk_ForceSpere_Orb.m2')
Undulation.Model:SetFrameStrata(low)
Undulation.Model:SetAllPoints(Undulation)
--Undulation.Model:SetCamera(1)
Undulation.Model:SetPosition(0,0,0)
Undulation.Model:SetAlpha(1)
--Undulation.Model:SetModelScale(0.021)
Undulation.Model:SetSequence(1)
Undulation.Model:SetRotation(0)
Undulation:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(3)) then
		local db = Auras.db.char
		local buff = UnitBuff('player',Auras:GetSpellName(216251))
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		
		if (not db.elements[3].isMoving) then
			if (buff and db.elements[3].frames.Undulation.isEnabled) then
				self:SetAlpha(1)
			else
				self:SetAlpha(0)
			end
		else
			self:SetAlpha(1)
			--self.Model:SetModel('SPELLS/Monk_ForceSpere_Orb.m2')
		end
		
		--[[if (db.elements[3].isMoving) then
			self:SetBackdrop(backdrop)
			self:SetBackdropColor(0,0,0,0.85)
		else
			self:SetBackdrop(nil)
		end]]
		ToggleFrameMove(self,db.elements[3].isMoving)
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

Undulation:SetScript('OnMouseDown',function(self,button)
	if (Auras.db.char.elements[3].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroup3',button)
	end
end)

Undulation:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[3].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[3].frames[self:GetName()])
	end
end)

SSA.Undulation = Undulation;
_G["SSA_Undulation"] = Undulation;

EventFrame:SetScript('OnEvent',function(self,event,...)
	if (Auras:CharacterCheck(3)) then
		local _,subevent,_,sGUID,source,_,_,petGUID,name,_,_,spellID,spellName,_,damage = ...
		local db = Auras.db.char
		local auras = db.auras[3]
		
		if (event ~= 'COMBAT_LOG_EVENT_UNFILTERED') then
			return
		end
		
		if (sGUID == UnitGUID('player')) then
			if (subevent == 'SPELL_CAST_SUCCESS') then
				if (spellID == 61295 or spellID == 1064) then
					TidalWavesBar.healTime = GetTime()
				end
			elseif (subevent == 'SPELL_AURA_APPLIED') then
				--[[if (buffIDs[spellID]) then
					local isValidBuff = false
					
					if ((spellID == 108271 and auras.AstralShiftBar3) or (spellID == 114052 and auras.AscendanceBar3) or (spellID == 108281 and auras.AncestralGuidanceBar3) or (spellID == 2825 and auras.BloodlustBar3) or (spellID == 79206 and auras.SpiritwalkersGraceBar) or (spellID == 32182 and auras.HeroismBar3) or (spellID == 73685 and auras.UnleashLifeBar) or (spellID == 80353 and auras.TimeWarpBar3)) then
						isValidBuff = true
					end
					
					if (isValidBuff) then
						table.insert(buffTable,spellID)
					end
				end]]
			elseif (subevent == 'SPELL_AURA_REMOVED') then
				--[[if (buffIDs[spellID]) then
					for i=1,getn(buffTable) do
						if (buffTable[i] == spellID) then
							table.remove(buffTable,i)
						end
					end
					buffIDs[spellID]:Hide()
				end]]
			elseif (subevent == 'SPELL_SUMMON' and spellID == 198838) then
				if (db.elements[3].statusbars.earthenShieldBar.isEnabled) then
					local EST = EarthenShieldTotemBar
					
					EST.expires = GetTime() + 15
					EST.isSummoned = true
					EST.GUID = petGUID

					EST:SetMinMaxValues(0,UnitHealthMax('player'))
					EST.healthtext:SetText('100%')
					EST:SetValue(UnitHealthMax('player'))
					
					db.info.totems.eShield.hp = UnitHealthMax('player')
					db.info.totems.eShield.dmg = 0
					
				end
			end
		end
		if (petGUID == EarthenShieldTotemBar.GUID) then
			if (subevent == 'UNIT_DIED') then
				EarthenShieldTotemBar:SetAlpha(0)
				EarthenShieldTotemBar.Timer:SetAlpha(0)
				EarthenShieldTotemBar.GUID = 0
			elseif ((subevent == 'SPELL_DAMAGE' or subevent == 'SWING_DAMAGE') and (name == "Earthen Shield Totem" or spellName == "Earthen Shield")) then
				db.info.totems.eShield.dmg = (db.info.totems.eShield.dmg or 0) + damage
				if (not db.info.totems.eShield.hp) then
					db.info.totems.eShield.hp = UnitHealthMax('player')
				end
				UpdateEarthenShield(EarthenShieldTotemBar)
			end
		end
	end
end)

-------------------------------------------------------------------------------------------------------
----- Build Move UI
-------------------------------------------------------------------------------------------------------

SSA.Move3 = CreateFrame("Frame","Move3",UIParent);
