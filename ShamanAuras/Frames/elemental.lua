local SSA, Auras, L, LSM = unpack(select(2,...))

local lgIcon,lgGlow,smIcon,smGlow = 32,45,25,35;
--local lg,sm,gl = 32,25,45; -- Square Dimensions: Large, Small, Glow
local x,y = 0,0,0;
local bg,low,med,high = 'BACKGROUND','LOW','MEDIUM','HIGH'
local buffTable,mainTable,utilTable = {},{},{}
local mainStart,mainGUIDs,mainDuration = {},{},{}
local utilStart,utilGUIDs,utilDuration = {},{},{}
local isStormkeeperActive = false


-- Cache Global Variables
-- Lua Function
local _G = _G
local floor,rad = math.floor, math.rad
local tinsert, tremove, twipe = table.insert, table.remove, table.wipe
local pairs, tostring, type = pairs, tostring,type
local find, format, gsub, lower, sub = string.find, string.format, string.gsub, string.lower, string.sub
-- WoW API / Variables
local CreateFrame = CreateFrame
local GetNetStats = GetNetStats
local GetSpellCharges, GetSpellCooldown, GetSpellInfo = GetSpellCharges, GetSpellCooldown, GetSpellInfo
local GetTime = GetTime
local GetTotemInfo = GetTotemInfo
local UnitAffectingCombat = UnitAffectingCombat
local UnitBuff, UnitDebuff = UnitBuff, UnitDebuff
local UnitCanAttack = UnitCanAttack
local UnitCastingInfo, UnitChannelInfo = UnitCastingInfo, UnitChannelInfo
local UnitCreatureType = UnitCreatureType
local UnitGUID = UnitGUID
local UnitPower, UnitPowerMax = UnitPower, UnitPowerMax




local backdrop = {
	bgFile   = [[Interface\Tooltips\UI-Tooltip-Background]],
	edgeFile = [[Interface\Tooltips\UI-Tooltip-Border]],
	tile = true,
	tileSize = 16,
	edgeSize = 10
}

local function UpdateSafeZone(self)
	local safeZone = self.safezone
	local width = self:GetWidth()
	local _, _, _, ms = GetNetStats()

	local safeZoneRatio = (ms / 1e3) / self.duration

	if(safeZoneRatio > 1) then
		safeZoneRatio = 1
	end

	safeZone:SetWidth(width * safeZoneRatio)
end

-- Check Current Class
local function CharacterCheck()
	local _,_,classIndex = UnitClass('player')
	local spec = GetSpecialization()
	
	if (spec == 1 and classIndex == 7) then
		return true
	else
		return false
	end
end

local function AdjustStatusBarSpark(self,db,offset)
	if (db.spark) then
		local position = self:GetWidth() * offset
		
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
	Group:RegisterForDrag('LeftButton')
	
	return Group
end

-- Aura Icon Builder
local function InitializeFrames(name,parent,icon,iconSize,isGCD,glowSize,charge)
	SSA[name] = CreateFrame('Frame',name,parent)
	local Frame = SSA[name]
	Frame:SetFrameStrata('LOW')
	Frame:SetWidth(iconSize)
	Frame:SetHeight(iconSize)

	-- Add the spell icon to the frame
	Frame.texture = Frame:CreateTexture(nil,'BACKGROUND')
	Frame.texture:SetTexture([[Interface\addons\ShamanAuras\media\ICONS\]]..icon)
	Frame.texture:SetAllPoints(Frame)
	
	-- Build Cooldown Frame
	Frame.CD = CreateFrame('Cooldown', name..'CD', Frame, 'CooldownFrameTemplate')
	Frame.CD:SetAllPoints(Frame)
	
	Frame.CD.text = Frame.CD:CreateFontString(nil, 'MEDIUM', 'GameFontHighlightLarge')
	Frame.CD.text:SetFont([[Interface\addons\ShamanAuras\media\fonts\PT_Sans_Narrow.TTF]], 18,'OUTLINE')
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

-- Build Elemental Aura Group Containers
AuraGroup = CreateGroup('AuraGroup1',UIParent)
LargeIconGrpTop = CreateGroup('LargeIconGrpTop1',AuraGroup)
LargeIconGrpBot = CreateGroup('LargeIconGrpBot1',AuraGroup)
LargeIconGrpExt = CreateGroup('LargeIconGrpExt1',AuraGroup)
SmallIconGrpLeft = CreateGroup('SmallIconGrpLeft1',AuraGroup)
SmallIconGrpRight = CreateGroup('SmallIconGrpRight1',AuraGroup)

-- Build Large Elemental Icon Frames
InitializeFrames('Ascendance1',LargeIconGrpBot,[[shared\ascendance]],lgIcon)
InitializeFrames('Concordance1',LargeIconGrpExt,[[shared\concordance_legionfall.tga]],lgIcon)
InitializeFrames('EarthShock',LargeIconGrpTop,[[elemental\earth_shock]],lgIcon,true,lgGlow)
InitializeFrames('Earthquake',LargeIconGrpTop,[[elemental\earthquake]],lgIcon,false,lgGlow)
InitializeFrames('ElementalBlast',LargeIconGrpTop,[[elemental\elemental_blast]],lgIcon,true)
InitializeFrames('ElementalFocus',LargeIconGrpExt,[[elemental\elemental_focus]],lgIcon,false,nil,true)
InitializeFrames('ElementalMastery',LargeIconGrpBot,[[elemental\elemental_mastery]],lgIcon)
InitializeFrames('FireElemental',LargeIconGrpBot,[[elemental\fire_elemental]],lgIcon,true)
InitializeFrames('FlameShock',LargeIconGrpTop,[[shared\flame_shock]],lgIcon,true,lgGlow)
InitializeFrames('Icefury',LargeIconGrpBot,[[elemental\icefury]],lgIcon,true)
InitializeFrames('LavaBurst1',LargeIconGrpTop,[[elemental\lava_burst]],lgIcon,true,lgGlow,true)
InitializeFrames('LiquidMagmaTotem',LargeIconGrpBot,[[totems\liquid_magma_totem]],lgIcon,true)
InitializeFrames('PowerOfMaelstrom',LargeIconGrpExt,[[elemental\power_of_the_maelstrom]],lgIcon,false,nil,true)
InitializeFrames('StormElemental',LargeIconGrpBot,[[elemental\storm_elemental]],lgIcon,true)
InitializeFrames('Stormkeeper',LargeIconGrpBot,[[elemental\stormkeeper]],lgIcon,true,lgGlow,true)

-- Build Small Elemental Icon Frames
InitializeFrames('AncestralGuidance1',SmallIconGrpLeft,[[shared\ancestral_guidance]],smIcon)
InitializeFrames('AstralShift1',SmallIconGrpLeft,[[shared\astral_shift]],smIcon)
InitializeFrames('CleanseSpirit1',SmallIconGrpLeft,[[restoration\purify_spirit]],smIcon,true)
InitializeFrames('EarthElemental',SmallIconGrpRight,[[elemental\earth_elemental]],smIcon,true)
InitializeFrames('EarthgrabTotem1',SmallIconGrpRight,[[totems\earthgrab_totem]],smIcon,true)
InitializeFrames('GustWind1',SmallIconGrpRight,[[shared\gust_of_wind]],smIcon,true)
InitializeFrames('Hex1',SmallIconGrpLeft,[[shared\hex]],smIcon,true)
InitializeFrames('LightningSurgeTotem1',SmallIconGrpRight,[[totems\lightning_surge_totem]],smIcon,true)
InitializeFrames('Thunderstorm',SmallIconGrpRight,[[elemental\thunderstorm]],smIcon,true)
InitializeFrames('VoodooTotem1',SmallIconGrpLeft,[[totems\voodoo_totem]],smIcon,true)
InitializeFrames('WindRushTotem1',SmallIconGrpRight,[[totems\wind_rush_totem]],smIcon,true)
InitializeFrames('WindShear1',SmallIconGrpLeft,[[shared\wind_shear]],smIcon,false,smGlow)

-------------------------------------------------------------------------------------------------------
----- Initialize Scripts (Aura Groups)
-------------------------------------------------------------------------------------------------------

EventFrame:SetScript('OnUpdate',function(self)
	local _,_,name,_,_,rank = C_ArtifactUI.GetEquippedArtifactInfo()
	
	if (Auras:CharacterCheck(1)) then
		if (name ~= Auras.db.char.EquippedArtifact) then
			Auras.db.char.EquippedArtifact = name
			Auras:UpdateTalents()
		end
	end
end)

AuraGroup:SetScript('OnUpdate',function(self,button)
	ToggleFrameMove(self,Auras.db.char.elements[1].isMoving)
end)

AuraGroup:SetScript('OnMouseDown',function(self,button)
	if (Auras.db.char.elements[1].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroup1',button)
	end
end)

AuraGroup:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[1].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[1].frames[self:GetName()])
	end
end)

_G['SSA_AuraGroupEle'] = AuraGroup
LargeIconGrpTop:SetScript('OnUpdate',function(self,button)
	ToggleFrameMove(self,Auras.db.char.elements[1].isMoving)
end)

LargeIconGrpTop:SetScript('OnMouseDown',function(self,button)
	if (Auras.db.char.elements[1].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroup1',button)
	end
end)

LargeIconGrpTop:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[1].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[1].frames[self:GetName()])
	end
end)

LargeIconGrpBot:SetScript('OnUpdate',function(self,button)
	ToggleFrameMove(self,Auras.db.char.elements[1].isMoving)
end)

LargeIconGrpBot:SetScript('OnMouseDown',function(self,button)
	if (Auras.db.char.elements[1].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroup1',button)
	end
end)

LargeIconGrpBot:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[1].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[1].frames[self:GetName()])
	end
end)

LargeIconGrpExt:SetScript('OnUpdate',function(self,button)
	ToggleFrameMove(self,Auras.db.char.elements[1].isMoving)
end)

LargeIconGrpExt:SetScript('OnMouseDown',function(self,button)
	if (Auras.db.char.elements[1].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroup1',button)
	end
end)

LargeIconGrpExt:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[1].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[1].frames[self:GetName()])
	end
end)

SmallIconGrpLeft:SetScript('OnUpdate',function(self,button)
	ToggleFrameMove(self,Auras.db.char.elements[1].isMoving)
end)

SmallIconGrpLeft:SetScript('OnMouseDown',function(self,button)
	if (Auras.db.char.elements[1].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroup1',button)
	end
end)

SmallIconGrpLeft:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[1].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[1].frames[self:GetName()])
	end
end)

SmallIconGrpRight:SetScript('OnUpdate',function(self,button)
	ToggleFrameMove(self,Auras.db.char.elements[1].isMoving)
end)

SmallIconGrpRight:SetScript('OnMouseDown',function(self,button)
	if (Auras.db.char.elements[1].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroup1',button)
	end
end)

SmallIconGrpRight:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[1].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[1].frames[self:GetName()])
	end
end)

-------------------------------------------------------------------------------------------------------
----- Initialize Scripts (Separate Auras)
-------------------------------------------------------------------------------------------------------

-- Flame Shock
SSA.FlameShock:SetScript('OnUpdate', function(self)
	if (Auras:CharacterCheck(1)) then
		local debuff,_,_,_,_,duration,expires,caster = UnitDebuff('target',Auras:GetSpellName(188389))
		local strt,dur = GetSpellCooldown(Auras:GetSpellName(546))
	
		
		if (not self.text) then
			self.text = self:CreateFontString(nil, 'HIGH', 'GameFontHighlightLarge')
			self.text:SetPoint('CENTER',0.5,0.5)
			self.text:SetFont([[Interface\addons\ShamanAuras\media\fonts\PT_Sans_Narrow.TTF]], 18,'OUTLINE')
			self.text:SetTextColor(1,1,0,1)
		end
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:SpellRangeCheck(self,188389,true,1)	
		Auras:CooldownHandler(self,1,'primary',1,strt,dur,true)
		
		if (debuff) then
			--self.CD:Show()
			--Auras:CooldownHandler(self,1,'primary',1,((expires or 0) - (duration or 0)),duration)
		else
			--self.CD:Hide()
		end
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
			
			if (debuff and caster == 'player') then
				SSA.DataFrame.text:SetText("Caster: "..tostring(caster));
				local timer,seconds = Auras:parseTime(expires - GetTime(),false,1,'primary',1)
				--self.text:SetText(timer)
				self.CD:Show()
				Auras:CooldownHandler(self,1,'primary',1,((expires or 0) - (duration or 0)),duration)
				if (seconds <= Auras.db.char.settings[1].flameShock and UnitAffectingCombat('player')) then
					Auras:ToggleOverlayGlow(self.glow,true,true)
					--isGlowActive = true
				elseif (seconds == 0) then
					self.text:SetText('')
				else
					Auras:ToggleOverlayGlow(self.glow,false)
					--isGlowActive = false
				end
			else
				self.text:SetText('')
				if (Auras:IsTargetEnemy()) then
					Auras:ToggleOverlayGlow(self.glow,true,true)
					--isGlowActive = true
				else
					Auras:ToggleOverlayGlow(self.glow,false)
					--isGlowActive = false
				end
			end
		else
			if (Auras.db.char.elements[1].cooldowns.primary[1].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			end
			--if (isGlowActive) then
			Auras:ToggleOverlayGlow(self.glow,false)
			self.text:SetText('')
				--isGlowActive = false
			--end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
		Auras:ToggleOverlayGlow(self.glow,false)
	end
end)

-- Earth Shock
SSA.EarthShock:SetScript('OnUpdate', function(self)
	if (Auras:CharacterCheck(1)) then
		local power = UnitPower('player',11)
		local start,duration = GetSpellCooldown(Auras:GetSpellName(546))
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:SpellRangeCheck(self,8042,true,1)	
		Auras:CooldownHandler(self,1,'primary',1,start,duration,true)
		
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			if (power >= Auras.db.char.elements[1].statusbars.maelstromBar.threshold) then
				Auras:ToggleOverlayGlow(self.glow,true)
			else
				Auras:ToggleOverlayGlow(self.glow,false)
			end
			if (power >= 10) then
				self:SetAlpha(1)
			else
				self:SetAlpha(0.5)
			end
		else
			--self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			if (Auras.db.char.elements[1].cooldowns.primary[1].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			end
			
			Auras:ToggleOverlayGlow(self.glow,false)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Lava Burst
SSA.LavaBurst1:SetScript('OnUpdate', function(self)
	if (Auras:CharacterCheck(1)) then
		local buff = UnitBuff('player',Auras:GetSpellName(77762))
		local ascendance = UnitBuff('player',Auras:GetSpellName(114050))
		local start,duration = GetSpellCooldown(Auras:GetSpellName(51505))
		local charges,maxCharges,chgStart,chgDuration = GetSpellCharges(51505)
		local _,_,_,selected = GetTalentInfo(6,3,1)
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:SpellRangeCheck(self,51505,true,1)	
		Auras:CooldownHandler(self,1,'primary',1,start,duration,true)
		
		if (selected) then
			if (charges == 2) then
				self.ChargeCD:Hide()
				self.ChargeCD:SetCooldown(0,0)
				--self.Charges.text:SetText(2)
			elseif (charges == 1) then
				self.ChargeCD:Show()
				self.ChargeCD:SetCooldown(chgStart,chgDuration)
				--self.Charges.text:SetText(charges)
			end
			if (charges > 0) then
				self.Charges.text:SetText(charges)
				self.CD.text:SetText('')
				--self.ChargeCD:Show()
			else
				--Auras:ExecuteCooldown(self,chgStart,chgDuration,false,false,1)
				Auras:CooldownHandler(self,1,'primary',1,start,duration)
				self.Charges.text:SetText('')
				self.ChargeCD:Hide()
			end
		else
			self.ChargeCD:Hide()
			self.Charges.text:SetText('')
		end
				
		if (UnitAffectingCombat('player')) then
			--[[if (selected) then
				if (buff) then
					Auras:ToggleOverlayGlow(self.glow,true,false)
					self.ChargeCD:Hide()
				else
					Auras:ToggleOverlayGlow(self.glow,false)
					self.ChargeCD:Show()
				end
			else]]
				--self.Charges.text:SetText('')
				if ((duration or 0) > 2) then
					--[[if (Auras.db.char.cooldowns.swipe) then
						Auras:ToggleCooldownSwipe(self.CD,true)]]
					
						--self.CD:Show()
					--end
					--Auras:ToggleCooldownSwipe(self.CD,1)
					Auras:ToggleOverlayGlow(self.glow,false)
					--Auras:ExecuteCooldown(self,start,duration,false,false,1)
					Auras:CooldownHandler(self,1,'primary',1,start,duration)
					self.CD:Show()
				elseif (buff or ascendance) then
					if (buff) then
						Auras:ToggleOverlayGlow(self.glow,true,false)
					else
						Auras:ToggleOverlayGlow(self.glow,false)
					end
					if (ascendance) then
						self.Charges.text:SetText('')
						self.ChargeCD:Hide()
					end
					--Auras:ToggleCooldownSwipe(self.CD,1,true)
					self.CD:Hide()
					self.CD:SetCooldown(0,0)
				else
					--Auras:ToggleCooldownSwipe(self.CD,false)
					Auras:ToggleOverlayGlow(self.glow,false)
					self.CD.text:SetText('')
				end
			--end
		end
		
		--Auras:ToggleCooldown(self,1,true)
		
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			if (buff and Auras:IsTargetEnemy()) then
				Auras:ToggleOverlayGlow(self.glow,true)
			else
				Auras:ToggleOverlayGlow(self.glow,false)
			end
			--self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			
			if (Auras.db.char.elements[1].cooldowns.primary[1].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Earthquake
SSA.Earthquake:SetScript('OnUpdate', function(self)
	if (Auras:CharacterCheck(1)) then
		local buff = UnitBuff('player',Auras:GetSpellName(208723))
		local power = UnitPower('player',11)
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,1,'primary',1,start,duration,true)
		
		if (UnitAffectingCombat('player')) then
			self:SetAlpha(1)
			if (buff) then
				Auras:ToggleOverlayGlow(self.glow,true,false)
			else
				Auras:ToggleOverlayGlow(self.glow,false)
			end
			if (power >= 50 or buff) then
				self:SetAlpha(1)
			else
				self:SetAlpha(0.5)
			end
		else
			if (buff) then
				Auras:ToggleOverlayGlow(self.glow,false)
			end
			--self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			if (Auras.db.char.elements[1].cooldowns.primary[1].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			end
			
			Auras:ToggleOverlayGlow(self.glow,false)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Stormkeeper
SSA.Stormkeeper:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(1)) then
		local spell = Auras:GetSpellName(205495)
		local buff,_,_,count = UnitBuff('player',spell)
		local start,duration = GetSpellCooldown(spell)
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,1,'primary',2,start,duration)
		--SSA.DataFrame.text:SetText("Spell: "..tostring(spell).."\nBuff: "..tostring(buff).." ("..tostring(count)..")\nStart: "..tostring(start)..", Duration: "..tostring(duration))
		if (buff) then
			--SSA.DataFrame.text:SetText("BUFF ON")
			Auras:ToggleOverlayGlow(self.glow,true)
			
			self.CD:SetAlpha(0)
			self.ChargeCD:Show()
			self.Charges:Show()
			self.ChargeCD:SetDrawBling(false)
			
			if (self.ChargeCD:GetCooldownDuration() == 0) then
				self.ChargeCD:SetCooldown(start,15)
			end
			
			self.Charges.text:SetText(count)
		else
			Auras:ToggleOverlayGlow(self.glow,false)
			
			--SSA.DataFrame.text:SetText("BUFF OFF")
			self.CD:SetAlpha(1)
			self.ChargeCD:Hide()
			self.Charges:Hide()
		end
			
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,false,false,1)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			
			if (Auras.db.char.elements[1].cooldowns.primary[2].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Earth Elemental
SSA.EarthElemental:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(1)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(198103))
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,1,'secondary',2,start,duration)
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true,false,1)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			if (Auras.db.char.elements[1].cooldowns.secondary[2].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Fire Elemental
SSA.FireElemental:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(1)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(198067))
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,1,'primary',2,start,duration)
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,false,false,1)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			if (Auras.db.char.elements[1].cooldowns.primary[2].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Storm Elemental
SSA.StormElemental:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(1)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(192249))
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,1,'primary',2,start,duration)
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,false,false,1)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			if (Auras.db.char.elements[1].cooldowns.primary[2].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Ancestral Guidance
SSA.AncestralGuidance1:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(1)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(108281))
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,1,'secondary',1,start,duration)
		
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true,false,1)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			if (Auras.db.char.elements[1].cooldowns.secondary[1].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Ascendance
SSA.Ascendance1:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(1)) then
		local db = Auras.db.char
		local start,duration = GetSpellCooldown(Auras:GetSpellName(114050))
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,1,'primary',2,start,duration)
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,false,false,1)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			if (Auras.db.char.elements[1].cooldowns.primary[2].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			end
		end
		
		--[[if (db.elements[1].cooldowns.primary[2].isPreview) then
			Auras:PreviewCooldown(self.CD)
		else
			self.CD:Hide()
		end]]
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Astral Shift
SSA.AstralShift1:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(1)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(108271))
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,1,'secondary',1,start,duration)
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true,false,1)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			if (Auras.db.char.elements[1].cooldowns.secondary[1].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Cleanse Spirit
SSA.CleanseSpirit1:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(1)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(51886))
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,1,'secondary',1,start,duration)
		
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true,false,1)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			if (Auras.db.char.elements[1].cooldowns.secondary[1].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Concordance of the Legionfall
SSA.Concordance1:SetScript('OnUpdate',function(self)
	local _,_,name,_,_,rank = C_ArtifactUI.GetEquippedArtifactInfo()
	--print(tostring(name)..", "..tostring(Auras.db.char.EquippedArtifact))
	if (Auras:CharacterCheck(1)) then
		local buff,_,_,count,_,duration,expires,caster = UnitBuff('player',Auras:GetSpellName(242586))
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,1,'primary',3,((expires or 0) - (duration or 0)),duration)
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,,duration,false,false,1)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
		
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			if (Auras.db.char.elements[1].cooldowns.primary[3].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Earthgrab Totem
SSA.EarthgrabTotem1:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(1)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(51485))
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,1,'secondary',2,start,duration)
		
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true,false,1)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			if (Auras.db.char.elements[1].cooldowns.secondary[2].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Elemental Blast
SSA.ElementalBlast:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(1)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(117014))
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,1,'primary',1,start,duration)
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,false,false,1)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
		
		Auras:SpellRangeCheck(self,117014,true,1)		
		--Auras:ToggleCooldown(self,1)
		
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			if (Auras.db.char.elements[1].cooldowns.primary[1].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Elemental Focus
SSA.ElementalFocus:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(1)) then
		local buff,_,_,count,_,duration,expires,caster = UnitBuff('player',Auras:GetSpellName(16246))
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,1,'primary',3,((expires or 0) - (duration or 0)),duration)
		
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,,duration,false,false,1)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
		
		self.CD.text:SetText('')
		if ((count or 0) >= 1) then
			self.Charges.text:SetText(count)
		else
			self.Charges.text:SetText('')
		end
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			if (Auras.db.char.elements[1].cooldowns.primary[3].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Elemental Mastery
SSA.ElementalMastery:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(1)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(16166))
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,1,'primary',2,start,duration)
		
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,false,false,1)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
		
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			if (Auras.db.char.elements[1].cooldowns.primary[2].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Gust of Wind
SSA.GustWind1:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(1)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(192063))
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,1,'secondary',2,start,duration)
		
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true,false,1)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			if (Auras.db.char.elements[1].cooldowns.secondary[2].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Hex
SSA.Hex1:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(1)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(51514))
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,1,'secondary',1,start,duration)
		
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true,false,1)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
		
		Auras:SpellRangeCheck(self,51514,(UnitCreatureType('target') == 'Humanoid' or UnitCreatureType('target') == 'Beast' or UnitCreatureType('target') == 'Critter'),1)	
		
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			if (Auras.db.char.elements[1].cooldowns.secondary[1].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Icefury
SSA.Icefury:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(1)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(210714))
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:SpellRangeCheck(self,210714,true,1)	
		Auras:CooldownHandler(self,1,'primary',2,start,duration)
		
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,false,false,1)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			if (Auras.db.char.elements[1].cooldowns.primary[2].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Lightning Surge Totem
SSA.LightningSurgeTotem1:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(1)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(192058))
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,1,'secondary',2,start,duration)
		
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true,false,1)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			if (Auras.db.char.elements[1].cooldowns.secondary[2].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Liquid Magma Totem
SSA.LiquidMagmaTotem:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(1)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(192222))
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,1,'primary',2,start,duration)
		
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,false,false,1)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			if (Auras.db.char.elements[1].cooldowns.primary[2].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Power of the Maelstrom
SSA.PowerOfMaelstrom:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(1)) then
		local buff,_,_,count,_,duration,expires,caster = UnitBuff('player',Auras:GetSpellName(191877))
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,1,'primary',3,((expires or 0) - (duration or 0)),duration)
		
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,,duration,false,false,1)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
		
		self.CD.text:SetText('')
		if ((count or 0) >= 1) then
			self.Charges.text:SetText(count)
		else
			self.Charges.text:SetText('')
		end
		
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			if (Auras.db.char.elements[1].cooldowns.primary[3].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Thunderstorm
SSA.Thunderstorm:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(1)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(51490))
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,1,'secondary',2,start,duration)
		
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true,false,1)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			if (Auras.db.char.elements[1].cooldowns.secondary[2].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Voodoo Totem
SSA.VoodooTotem1:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(1)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(196932))
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,1,'secondary',1,start,duration)
		
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true,false,1)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			if (Auras.db.char.elements[1].cooldowns.secondary[1].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Wind Shear
SSA.WindShear1:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(1)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(57994))
		local name,_,_,_,_,_,_,_,interrupt = UnitCastingInfo('target')
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:SpellRangeCheck(self,57994,true,1)
		Auras:CooldownHandler(self,1,'secondary',1,start,duration)
		
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,false,false,1)
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
			--self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			if (Auras.db.char.elements[1].cooldowns.secondary[1].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

-- Wind Rush Totem
SSA.WindRushTotem1:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(1)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(192077))
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		Auras:CooldownHandler(self,1,'secondary',2,start,duration)
		
		--[[if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true,false,1)
			self.CD:Show()
		else
			self.CD:Hide()
		end]]
		
		
		
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1)
		else
			--self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
			if (Auras.db.char.elements[1].cooldowns.secondary[2].isPreview) then
				self:SetAlpha(1)
			else
				self:SetAlpha(Auras.db.char.settings[1].OoCAlpha)
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
local ChannelBar = CreateFrame('StatusBar','ChannelBar1',AuraGroup)
SSA.DataFrame.text:SetText("#1")
ChannelBar:SetStatusBarTexture(LSM.MediaTable.statusbar['Glamour2'])
SSA.DataFrame.text:SetText("#2")
ChannelBar:GetStatusBarTexture():SetHorizTile(false)
SSA.DataFrame.text:SetText("#3")
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

ChannelBar.timetext = ChannelBar:CreateFontString(nil, 'OVERLAY', 'GameFontHighlightLarge')
ChannelBar.nametext = ChannelBar:CreateFontString(nil, 'OVERLAY', 'GameFontHighlightLarge')

ChannelBar.startTime = 0
ChannelBar.endTime = 0
ChannelBar.isChannel = false
ChannelBar.duration = 0
ChannelBar.progress = 0

ChannelBar:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(1)) then
		local db = Auras.db.char
		local bar = db.elements[1].statusbars.channelBar
		local isMoving = db.elements[1].isMoving
		
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
			self.spark:Hide()
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
			
			if (self.isChannel and spellName) then
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
	if (Auras.db.char.elements[1].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroup1',button)
	end
end)

ChannelBar:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[1].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[1].statusbars.channelBar)
	end
end)

SSA.ChannelBar1 = ChannelBar

-- Casting Status Bar
local CastBar = CreateFrame('StatusBar','CastBar1',AuraGroup)

CastBar:SetStatusBarTexture([[Interface\addons\ShamanAuras\media\statusbar\Glamour2]])
CastBar:GetStatusBarTexture():SetHorizTile(false)
CastBar:GetStatusBarTexture():SetVertTile(false)
CastBar:RegisterForDrag('LeftButton')
CastBar:SetPoint('TOPLEFT',AuraGroup,'CENTER',0,0)
--[[CastBar:SetFrameStrata('LOW')
CastBar:SetWidth(260)
CastBar:SetHeight(13)
CastBar:SetStatusBarColor(1,0.85,0)]]
--CastBar:SetReverseFill(true)
CastBar:Show()
CastBar:SetAlpha(0)

CastBar.spark = CastBar:CreateTexture(nil,'OVERLAY')
CastBar.spark:SetBlendMode('ADD')
CastBar.spark:SetTexture([[Interface\CastingBar\UI-CastingBar-Spark]])

CastBar.bg = CastBar:CreateTexture(nil,'BACKGROUND')
--CastBar.bg:SetTexture('Interface\\TargetingFrame\\UI-StatusBar')
CastBar.bg:SetAllPoints(true)
--CastBar.bg:SetVertexColor(0,0,0)
--CastBar.bg:SetAlpha(0.5)

CastBar.icon = CastBar:CreateTexture(nil,'OVERLAY')
--CastBar.icon:SetTexture('Interface\\TargetingFrame\\UI-StatusBar')
--CastBar.icon:SetAllPoints(true)
--CastBar.icon:SetVertexColor(0,0,0)
--CastBar.icon:SetAlpha(1)

CastBar.safezone = CastBar:CreateTexture(nil,'OVERLAY')
CastBar.safezone:SetColorTexture(0.54,0.26,0.26)
CastBar.safezone:SetPoint('RIGHT',CastBar,'RIGHT',0,0)
CastBar.safezone:SetAlpha(0)

CastBar.timetext = CastBar:CreateFontString(nil, 'OVERLAY', 'GameFontHighlightLarge')
--[[CastBar.timetext:SetPoint('RIGHT',-5,2)
CastBar.timetext:SetFont('Fonts\\FRIZQT__.TTF', 10,'OUTLINE')
CastBar.timetext:SetTextColor(1,1,1,1)]]
--CastBar.timetext:SetAlpha(1)

CastBar.nametext = CastBar:CreateFontString(nil, 'OVERLAY', 'GameFontHighlightLarge')
--[[CastBar.nametext:SetPoint(Auras.db.char.config[1].castBar.nametext.justify,Auras.db.char.config[1].castBar.nametext.x,Auras.db.char.config[1].castBar.nametext.y)
CastBar.nametext:SetFont(Auras.db.char.config[1].castBar.nametext.font.name,Auras.db.char.config[1].castBar.nametext.font.size,Auras.db.char.config[1].castBar.nametext.font.flag)
CastBar.nametext:SetTextColor(Auras.db.char.config[1].castBar.nametext.font.color.r,Auras.db.char.config[1].castBar.nametext.font.color.g,Auras.db.char.config[1].castBar.nametext.font.color.b,Auras.db.char.config[1].castBar.nametext.font.color.a)]]
--CastBar.nametext:SetAlpha(1)

CastBar.startTime = 0
CastBar.endTime = 0
CastBar.duration = 0
CastBar.spellName = ''
CastBar.isCast = false
CastBar.progress = 0

CastBar:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(1)) then
		local db = Auras.db.char
		local bar = db.elements[1].statusbars.castBar
		local isMoving = db.elements[1].isMoving

		ToggleProgressBarMove(self,isMoving,bar)
		
		if (not db.elements[1].statusbars.defaultBar and CastingBarFrame:IsShown()) then
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
			--AdjustStatusBarSpark(self,bar)
			
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
	if (Auras.db.char.elements[1].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroup1',button)
	end
end)

CastBar:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[1].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[1].statusbars.castBar)
	end
end)

SSA.CastBar1 = CastBar
_G['SSA_CastBar1'] = CastBar

local HealthBar = CreateFrame('StatusBar','HealthBar1',AuraGroup)

HealthBar:SetStatusBarTexture([[Interface\addons\ShamanAuras\media\statusbar\fifths]])
HealthBar:GetStatusBarTexture():SetHorizTile(false)
HealthBar:GetStatusBarTexture():SetVertTile(false)
HealthBar:Hide()
HealthBar:SetAlpha(0)

HealthBar.bg = HealthBar:CreateTexture(nil,'BACKGROUND')
HealthBar.bg:SetAllPoints(true)

HealthBar.numtext = HealthBar:CreateFontString(nil, 'HIGH', 'GameFontHighlightLarge')
HealthBar.perctext = HealthBar:CreateFontString(nil, 'HIGH', 'GameFontHighlightLarge')
--HealthBar.text:SetPoint('CENTER',HealthBar,'CENTER',0,0)
--HealthBar.text:SetTextColor(1,1,1,1)

_G["SSA_UI"] = SSA
HealthBar:SetScript('OnUpdate',function(self)	
	if (Auras:CharacterCheck(1)) then
		local isCombat = UnitAffectingCombat('player')
		local health,maxHealth = UnitHealth('player'),UnitHealthMax('player')
		
		local db = Auras.db.char
		local bar = db.elements[1].statusbars.healthBar
		local isMoving = db.elements[1].isMoving
		
		local _,maxVal = self:GetMinMaxValues()
		
		if (maxVal ~= maxHealth) then
			self:SetMinMaxValues(0,maxHealth)
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
			
			if (bar.numtext.isDisplayText) then
				self.numtext:SetText(Auras:HealthPrecision(bar.precision,true))
			else
				self.numtext:SetText('')
			end
			
			if (bar.perctext.isDisplayText) then
				self.perctext:SetText(format("%.2f",(health / maxHealth) * 100).."%")
			else
				self.perctext:SetText('')
			end
			
			self:SetValue(UnitHealth('player'))
			self:SetAlpha(1)
			
			--[[if (isCombat) then
				self:SetAlpha(bar.alphaCombat)				
			elseif (not isCombat and Auras:IsTargetEnemy()) then
				self:SetAlpha(bar.alphaTar)
				self.bg:SetAlpha(bar.background.color.a)
			elseif (not isCombat and not Auras:IsTargetEnemy()) then
				self:SetAlpha(bar.alphaOoC)
				self.bg:SetAlpha(bar.background.color.a)
			end]]
		elseif (not bar.isEnabled and not isMoving and not bar.adjust.isEnabled) then
			self:SetAlpha(0)
		end
	else
		self:SetAlpha(0)
	end
end)

HealthBar:SetScript('OnMouseDown',function(self,button)
	if (Auras.db.char.elements[1].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroupRes',button)
	end
end)

HealthBar:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[1].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[1].statusbars.healthBar)
	end
end)

SSA.HealthBar1 = HealthBar
_G['SSA_HealthBar1'] = HealthBar

-- Build Maelstrom Status Bar
local MaelstromBar = CreateFrame('StatusBar','MaelstromBar1',AuraGroup)

MaelstromBar:SetStatusBarTexture([[Interface\addons\ShamanAuras\media\statusbar\fifths]])
MaelstromBar:GetStatusBarTexture():SetHorizTile(false)
MaelstromBar:GetStatusBarTexture():SetVertTile(false)
MaelstromBar:RegisterForDrag('LeftButton')
MaelstromBar:SetPoint('CENTER',AuraGroup,'CENTER',0,-139)
--MaelstromBar:SetFrameStrata('LOW')
--MaelstromBar:SetStatusBarColor(0,0.5,1)
MaelstromBar:Show()
--MaelstromBar:SetAlpha(0)

MaelstromBar.bg = MaelstromBar:CreateTexture(nil,'BACKGROUND')
--MaelstromBar.bg:SetTexture([[Interface\TargetingFrame\UI-StatusBar]])
MaelstromBar.bg:SetAllPoints(true)
--MaelstromBar.bg:SetVertexColor(0,0,0)
--MaelstromBar.bg:SetAlpha(0.5)

MaelstromBar.text = MaelstromBar:CreateFontString(nil, 'HIGH', 'GameFontHighlightLarge')


--[[SSA.MaelstromBar1Lightning = CreateFrame('PlayerModel','MaelstromBar1Lightning',AuraGroup)
local MaelstromBarLightning = SSA.MaelstromBar1Lightning
MaelstromBarLightning:SetModel('SPELLS/LIGHTNING_AREA_DISC_STATE.m2')
MaelstromBarLightning:SetFrameStrata('MEDIUM')
MaelstromBarLightning:SetPosition(0,0,-2)
MaelstromBarLightning:SetPoint('CENTER',AuraGroup,'CENTER',0,-139)
MaelstromBarLightning:SetWidth(260)
MaelstromBarLightning:SetHeight(21)
--MaelstromBarLightning:SetAllPoints(MaelstromBar)
MaelstromBarLightning:SetAlpha(0)
MaelstromBarLightning:Show()
local elapsed = 0
MaelstromBarLightning:HookScript('OnUpdate', function(self, elaps)
	elapsed = elapsed + (elaps * 1000)
	self:SetSequenceTime(1, elapsed)
end)]]
MaelstromBar.Elapsed = 0
MaelstromBar.Lightning = CreateFrame('PlayerModel','MaelstromBar1Lightning',MaelstromBar)
MaelstromBar.Lightning:SetModel('SPELLS/LIGHTNING_AREA_DISC_STATE.m2')
MaelstromBar.Lightning:SetFrameStrata('MEDIUM')
MaelstromBar.Lightning:SetPosition(0,0,-2)
MaelstromBar.Lightning:SetRotation(0)
--MaelstromBar.Lightning:SetCamera(0)
MaelstromBar.Lightning:SetAllPoints(MaelstromBar)
--MaelstromBarLightning:SetAllPoints(MaelstromBar)
MaelstromBar.Lightning:SetAlpha(0)
MaelstromBar.Lightning:SetSequence(37)


MaelstromBar:SetScript('OnUpdate',function(self,elaps)
	if (Auras:CharacterCheck(1)) then
		local isCombat = UnitAffectingCombat('player')
		local power,maxPower = UnitPower('player',11),UnitPowerMax('player',11)

		local db = Auras.db.char
		local bar = db.elements[1].statusbars.maelstromBar
		local isMoving = db.elements[1].isMoving

		local _,maxVal = self:GetMinMaxValues()
		
		if (maxVal ~= maxPower) then
			self:SetMinMaxValues(0,maxPower)
		end

		ToggleProgressBarMove(self,isMoving,bar)
		
		if (isMoving and not bar.attachToHealth) then
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
			--[[self:ClearAllPoints()
			
			if (bar.attachToHealth and db.elements[1].statusbars.healthBar.isEnabled) then
				self:SetPoint("TOP",HealthBar,"BOTTOM",0,0)
			else
				self:SetPoint(bar.layout.point,AuraGroup,bar.layout.relativePoint,bar.layout.x,bar.layout.y) 
			end]]
			
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
		Auras:ToggleAuraVisibility(self,false,'alpha')
	end	
end)

MaelstromBar:SetScript('OnMouseDown',function(self,button)
	if (Auras.db.char.elements[1].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroup1',button)
	end
end)

MaelstromBar:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[1].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[1].statusbars.maelstromBar)
	end
end)

SSA.MaelstromBar1 = MaelstromBar
_G['SSA_MaelstromBar1'] = MaelstromBar



-- Build Icefury Status Bar
local IcefuryBar = CreateFrame('StatusBar','IcefuryBar',AuraGroup)
IcefuryBar:SetStatusBarTexture([[Interface\addons\ShamanAuras\media\statusbar\fourths]])
IcefuryBar:GetStatusBarTexture():SetHorizTile(false)
IcefuryBar:GetStatusBarTexture():SetVertTile(false)
IcefuryBar:RegisterForDrag('LeftButton')
IcefuryBar:SetMinMaxValues(0,4)
IcefuryBar:SetAlpha(0)
IcefuryBar:Show()

IcefuryBar.bg = IcefuryBar:CreateTexture(nil,'BACKGROUND')
--IcefuryBar.bg:SetTexture([[Interface\TargetingFrame\UI-StatusBar]])
IcefuryBar.bg:SetAllPoints(true)
--IcefuryBar.bg:SetVertexColor(0,0,0)
--IcefuryBar.bg:SetAlpha(0.9)

-- Build Icefury Timer Status Bar
IcefuryBar.Timer = CreateFrame('StatusBar','IcefuryTimer',IcefuryBar)
IcefuryBar.Timer:SetStatusBarTexture([[Interface\TargetingFrame\UI-StatusBar]])
IcefuryBar.Timer:GetStatusBarTexture():SetHorizTile(false)
IcefuryBar.Timer:GetStatusBarTexture():SetVertTile(false)
IcefuryBar.Timer:SetMinMaxValues(0,15)
--IcefuryBar.Timer:SetFrameStrata('MEDIUM')

IcefuryBar.counttext = IcefuryBar.Timer:CreateFontString(nil, 'HIGH', 'GameFontHighlightLarge')
IcefuryBar.timetext = IcefuryBar.Timer:CreateFontString(nil, 'HIGH', 'GameFontHighlightLarge')

IcefuryBar:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(1)) then
		local db = Auras.db.char
		local bar = db.elements[1].statusbars.icefuryBar
		local isMoving = db.elements[1].isMoving

		ToggleProgressBarMove(self,isMoving,bar)
		
		if (isMoving) then
			self:SetValue(4)
			self.counttext:SetText('4')
			self.Timer:SetValue(15)
			self.timetext:SetText('15')
		end
		
		if (bar.adjust.isEnabled) then
			self:SetAlpha(1)
			
			AdjustStatusBarText(self.counttext,bar.counttext)
			AdjustStatusBarText(self.timetext,bar.timetext)
			
			if (bar.adjust.showBG) then
				self:SetValue(1)
				self.Timer:SetValue(5)
				self.counttext:SetText('1')
				self.timetext:SetText('5')
			else
				self:SetValue(4)
				self.Timer:SetValue(15)
				self.counttext:SetText('4')
				self.timetext:SetText('15')
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
			--self.Timer:SetPoint('CENTER',self,'CENTER',0,0)
			self.Timer:SetFrameStrata(bar.layout.strata)
			self.Timer:SetAlpha(1)
		end		

		if (bar.isEnabled and not isMoving and not bar.adjust.isEnabled) then
			local buff,_,_,count,_,_,expires = UnitBuff('player',Auras:GetSpellName(210714))
			
			if (buff) then
				local timer,seconds = Auras:parseTime(expires - GetTime(),false)
				
				self:SetValue(count)
				if (bar.counttext.isDisplayText) then
					self.counttext:SetText(count)
				else
					self.counttext:SetText('')
				end
				self.Timer:SetValue(seconds)
				if (bar.timetext.isDisplayText) then
					self.timetext:SetText(format('%.1f',seconds))
				else
					self.timetext:SetText('')
				end
				
				if (UnitAffectingCombat('player')) then
					self:SetAlpha(bar.alphaCombat)
				else
					if (Auras:IsTargetEnemy()) then
						self:SetAlpha(bar.alphaTar)
					else
						self:SetAlpha(bar.alphaOoC)
					end
				end
				self.bg:SetAlpha(bar.background.color.a)
			else
				self:SetAlpha(0)
			end
		elseif (not bar.isEnabled and not isMoving and not bar.adjust.isEnabled) then
			self:SetAlpha(0)
		end
	end
end)

IcefuryBar:SetScript('OnMouseDown',function(self,button)
	if (Auras.db.char.elements[1].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroup1',button)
	end
end)

IcefuryBar:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[1].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[1].statusbars.icefuryBar)
	end
end);

SSA.IcefuryBar = IcefuryBar
_G['SSA_IcefuryBar'] = IcefuryBar

-- Build Buff Timer Status Bar Group

local BuffTimerBarGrp = CreateFrame('Frame','BuffTimerBarGrp1',AuraGroup)
BuffTimerBarGrp:SetWidth(115)
BuffTimerBarGrp:SetHeight(180)
BuffTimerBarGrp:SetBackdrop(nil)
BuffTimerBarGrp:Show()
SSA.BuffTimerBarGrp1 = BuffTimerBarGrp
_G['SSA_BuffTimerBarGrp1'] = BuffTimerBarGrp

-- Build Main Timer Status Bar Group
local MainTimerBarGrp = CreateFrame('Frame','MainTimerBarGrp1',AuraGroup)
MainTimerBarGrp:SetWidth(90)
MainTimerBarGrp:SetHeight(180)
MainTimerBarGrp:SetBackdrop(nil)
MainTimerBarGrp:Show()
SSA.MainTimerBarGrp1 = MainTimerBarGrp
_G['SSA_MainTimerBarGrp1'] = MainTimerBarGrp

-- Build Utility Timer Status Bar Group
local UtilTimerBarGrp = CreateFrame('Frame','UtilTimerBarGrp1',AuraGroup)
UtilTimerBarGrp:SetFrameStrata('LOW')
UtilTimerBarGrp:SetWidth(150)
UtilTimerBarGrp:SetHeight(180)
UtilTimerBarGrp:SetBackdrop(nil)
UtilTimerBarGrp:Show()
SSA.UtilTimerBarGrp1 = UtilTimerBarGrp
_G['SSA_UtilTimerBarGrp1'] = UtilTimerBarGrp

-- Build Earthquake Timer Status Bar Group
--[[SSA.EarthquakeBarGrp = CreateFrame("Frame","EarthquakeBarGrp",AuraGroup);
local EarthquakeBarGrp = SSA.EarthquakeBarGrp;
EarthquakeBarGrp:SetWidth(47);
EarthquakeBarGrp:SetHeight(180);
EarthquakeBarGrp:SetBackdrop(nil);
EarthquakeBarGrp:Show();]]
--[[local function BuildTimerBars(name,spellID,barGroup,isAura)
	local object = CreateFrame("StatusBar",name,barGroup)
	object:SetScript('OnUpdate',function(self)
	ele_options.args.ProgressBars.args.BuffTimersBars.args.Bloodlust	
	end);
end]]
--/script local p,rT,rP,x,y = SSA_AncestralGuidanceBar1:GetPoint();print("P: "..p..", rT: "..rT:GetName()..", rP: "..rP..", X: "..x..", Y: "..y);
-- Build Elemental Vertical Status Bars	
SSA.AncestralGuidanceBar1 = CreateFrame('StatusBar','AncestralGuidanceBar1',BuffTimerBarGrp)
_G['SSA_AncestralGuidanceBar1'] = SSA.AncestralGuidanceBar1
SSA.AscendanceBar1 = CreateFrame('StatusBar','AscendanceBar1',BuffTimerBarGrp)
_G['SSA_AscendanceBar1'] = SSA.AscendanceBar1
SSA.AstralShiftBar1 = CreateFrame('StatusBar','AstralShiftBar1',BuffTimerBarGrp)
_G['SSA_AstralShiftBar1'] = SSA.AstralShiftBar1
SSA.BloodlustBar1 = CreateFrame('StatusBar','BloodlustBar1',BuffTimerBarGrp)
_G['SSA_AstralShiftBar1'] = SSA.AstralShiftBar1
SSA.EarthgrabTotemBar1 = CreateFrame('StatusBar','EarthgrabTotemBar1',MainTimerBarGrp)
_G['SSA_EarthgrabTotemBar1'] = SSA.EarthgrabTotemBar1
--SSA.EarthquakeBarOne = CreateFrame('StatusBar','EarthquakeBarOne',MainTimerBarGrp)
SSA.ElementalBlastCritBar = CreateFrame('StatusBar','ElementalBlastCritBar',BuffTimerBarGrp)
_G['SSA_ElementalBlastCritBar'] = SSA.ElementalBlastCritBar
SSA.ElementalBlastHasteBar = CreateFrame('StatusBar','ElementalBlastHasteBar',BuffTimerBarGrp)
_G['SSA_ElementalBlastHasteBar'] = SSA.ElementalBlastHasteBar
SSA.ElementalBlastMasteryBar = CreateFrame('StatusBar','ElementalBlastMasteryBar',BuffTimerBarGrp)
_G['SSA_ElementalBlastMasteryBar'] = SSA.ElementalBlastMasteryBar
SSA.FireElementalBar = CreateFrame('StatusBar','FireElementalBar',MainTimerBarGrp)
_G['SSA_FireElementalBar'] = SSA.FireElementalBar
SSA.HeroismBar1 = CreateFrame('StatusBar','HeroismBar1',BuffTimerBarGrp)
_G['SSA_HeroismBar1'] = SSA.HeroismBar1
SSA.HexBar1 = CreateFrame('StatusBar','HexBar1',MainTimerBarGrp)
_G['SSA_HexBar1'] = SSA.HexBar1
SSA.LiquidMagmaTotemBar = CreateFrame('StatusBar','LiquidMagmaTotemBar',MainTimerBarGrp)
_G['SSA_LiquidMagmaTotemBar'] = SSA.LiquidMagmaTotemBar
SSA.StormElementalBar = CreateFrame('StatusBar','StormElementalBar',MainTimerBarGrp)
_G['SSA_StormElementalBar'] = SSA.StormElementalBar
SSA.EarthElementalBar = CreateFrame('StatusBar','EarthElementalBar',MainTimerBarGrp)
_G['SSA_EarthElementalBar'] = SSA.EarthElementalBar
SSA.ElementalMasteryBar = CreateFrame('StatusBar','ElementalMasteryBar',BuffTimerBarGrp)
_G['SSA_ElementalMasteryBar'] = SSA.ElementalMasteryBar
SSA.TimeWarpBar1 = CreateFrame('StatusBar','TimeWarpBar1',BuffTimerBarGrp)
_G['SSA_TimeWarpBar1'] = SSA.TimeWarpBar1
SSA.VoodooTotemBar1 = CreateFrame('StatusBar','VoodooTotemBar1',MainTimerBarGrp)
_G['SSA_VoodooTotemBar1'] = SSA.VoodooTotemBar1
SSA.WindRushTotemBar1 = CreateFrame('StatusBar','WindRushTotemBar1',MainTimerBarGrp)
_G['SSA_WindRushTotemBar1'] = SSA.WindRushTotemBar1

local buffIDs = {
	[114050] = {
		[1] = SSA.AscendanceBar1,
		[2] = 'ascendance',
	},
	[108281] = {
		[1] = SSA.AncestralGuidanceBar1,
		[2] = 'ancestralGuidance',
	},
	[108271] = {
		[1] = SSA.AstralShiftBar1,
		[2] = 'astralShift',
	},
	[2825] = {
		[1] = SSA.BloodlustBar1,
		[2] = 'bloodlust',
	},
	[118522] = {
		[1] = SSA.ElementalBlastCritBar,
		[2] = 'elementalBlast',
	},
	[173183] = {
		[1] = SSA.ElementalBlastHasteBar,
		[2] = 'elementalBlast',
	},
	[173184] = {
		[1] = SSA.ElementalBlastMasteryBar,
		[2] = 'elementalBlast',
	},
	[16166] = {
		[1] = SSA.ElementalMasteryBar,
		[2] = 'elementalMastery',
	},
	[32182] = {
		[1] = SSA.HeroismBar1,
		[2] = 'heroism',
	},
	[80353] = {
		[1] = SSA.TimeWarpBar1,
		[2] = 'timeWarp',
	},
}
local mainIDs = {
	--[[[188616] = {
		[1] = SSA.EarthElementalBar,
		[2] = 'earthElemental',
	},
	[118323] = {
		[1] = SSA.EarthElementalBar,
		[2] = 'earthElemental',
	},
	[188592] = {
		[1] = SSA.FireElementalBar,
		[2] = 'fireElemental',
	},
	[118291] = {
		[1] = SSA.FireElementalBar,
		[2] = 'fireElemental',
	},
	[157299] = {
		[1] = SSA.StormElementalBar,
		[2] = 'stormElemental',
	},
	[157319] = {
		[1] = SSA.StormElementalBar,
		[2] = 'stormElemental',
	},]]
	["Greater Earth Elemental"] = SSA.EarthElementalBar,
	["Primal Earth Elemental"]  = {
		[1] = SSA.EarthElementalBar,
		[2] = 60,
		[3] = 0,
	},
	["Greater Fire Elemental"]  = SSA.FireElementalBar,
	["Primal Fire Elemental"]   = {
		[1] = SSA.FireElementalBar,
		[2] = 60,
		[3] = 0,
	},
	["Greater Storm Elemental"] = SSA.StormElementalBar,
	["Primal Storm Elemental"]  = {
		[1] = SSA.StormElementalBar,
		[2] = 30,
		[3] = 0,
	},
	
}

local utilIDs = {
	['Earthgrab Totem'] = {
		[1] = false,
		[2] = SSA.EarthgrabTotemBar1,
		[3] = false,
	},
	['Liquid Magma Totem'] = {
		[1] = false,
		[2] = SSA.LiquidMagmaTotemBar,
		[3] = false,
	},
	['Voodoo Totem'] = {
		[1] = false,
		[2] = SSA.VoodooTotemBar1,
		[3] = false,
	},
	['Wind Rush Totem'] = {
		[1] = false,
		[2] = SSA.WindRushTotemBar1,
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
	if (Auras:CharacterCheck(1)) then
		local db = Auras.db.char
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		
		local xPosCtr = 1

		for i=1,50 do
			local buff,_,_,_,_,duration,expires,caster,_,_,spellID = UnitBuff('player',i)

			if (buff) then
				if (buffIDs[spellID]) then
					--if (db.auras[1][buffIDs[spellID]:GetName()]) then
					if (db.elements[1].timerbars.buff[buffIDs[spellID][2]]) then
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
		
		ToggleFrameMove(self,db.elements[1].isMoving)
		--[[if (db.elements[1].isMoving) then
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
	if (Auras.db.char.elements[1].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroup1',button)
	end
end)

BuffTimerBarGrp:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[1].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[1].frames[self:GetName()])
	end
end)

local function GetElementalString(name)
	local result = find(name,' ') + 1
	name = sub(name,result)
	name = gsub(name,' ','')
	name = gsub(name,"^%a",lower)
	
	return name
end

MainTimerBarGrp.elementals = {
	[1] = 0,
	[2] = 0,
	[3] = 0,
}

MainTimerBarGrp:SetScript('OnUpdate',function(self,event,...)
	if (Auras:CharacterCheck(1)) then
		local db = Auras.db.char
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		
--		for i=1,getn(mainTable) do
--			local expires = (mainStart[i] or 0) + (mainDuration[i] or 0)
--			
--			local timer,seconds = Auras:parseTime(expires - GetTime(),true)
--			
--			if (seconds > 0.1) then
--				mainIDs[mainTable[i]][1]:SetMinMaxValues(0,mainDuration[i])
--				mainIDs[mainTable[i]][1]:SetValue(seconds)
--				mainIDs[mainTable[i]][1].timetext:SetText(timer)
--				mainIDs[mainTable[i]][1]:SetPoint('RIGHT',(xPos[i] * -1),0)
--
--				if (db.elements[1].timerbars.main[mainIDs[mainTable[i]][2]]) then
--					mainIDs[mainTable[i]][1]:Show()
--				else
--					mainIDs[mainTable[i]][1]:Hide()
--				end
--			else
--				--mainIDs[mainTable[i]]:SetValue(0)
--				mainIDs[mainTable[i]][1]:Hide()
--				tremove(mainTable,i)
--				tremove(mainGUIDs,i)
--				tremove(mainStart,i)
--				tremove(mainDuration,i)
--			end
--		end
		
		-- Run the following code if Primal Elementalist is talented and an elemental pet is active.
		if (UnitExists('pet') and mainIDs[UnitName('pet')]) then
			--local eleStr = GetElementalString(UnitName('pet'))
			local name = UnitName('pet')
			if (mainIDs[name][3] == 0) then
				mainIDs[name][3] = GetTime()
			end
			
			local expires = mainIDs[name][3] + mainIDs[name][2]
			local timer,seconds = Auras:parseTime(expires - GetTime(),true)
			
			if (seconds > 0.1) then
				mainIDs[name][1]:SetMinMaxValues(0,mainIDs[name][2])
				mainIDs[name][1]:SetValue(seconds)
				mainIDs[name][1].timetext:SetText(timer)
				mainIDs[name][1]:SetPoint('RIGHT',-5,0)

				if (db.elements[1].timerbars.main[GetElementalString(UnitName('pet'))]) then
					mainIDs[name][1]:Show()
				else
					mainIDs[name][1]:Hide()
				end
			else
				mainIDs[name][1]:SetValue(0)
				mainIDs[name][1]:Hide()
			end
		else
			if (mainIDs["Primal Earth Elemental"][1]:IsShown()) then
				mainIDs["Primal Earth Elemental"][1]:Hide()
			end
			
			if (mainIDs["Primal Fire Elemental"][1]:IsShown()) then
				mainIDs["Primal Fire Elemental"][1]:Hide()
			end
			
			if (mainIDs["Primal Storm Elemental"][1]:IsShown()) then
				mainIDs["Primal Storm Elemental"][1]:Hide()
			end
		end
		
		local _,_,_,selected = GetTalentInfo(5,2,1)
		
		
		if (not selected) then
			local xPosCtr,totemCtr = 1,0
			
			for i=1,5 do
				local _,name,start,duration = GetTotemInfo(i)
				
				if (mainIDs[name]) then
					if (db.elements[1].timerbars.main[GetElementalString(name)]) then
						local timer,seconds = Auras:parseTime((start + duration) - GetTime(),true)
						
						totemCtr = totemCtr + 1
						
						if (seconds > 0.1) then
							mainIDs[name]:SetMinMaxValues(0,duration)
							mainIDs[name]:SetValue(seconds)
							mainIDs[name].timetext:SetText(timer)
							mainIDs[name]:SetPoint('RIGHT',(xPos[totemCtr] * -1),0)
							mainIDs[name]:Show()
						else
							totemCtr = totemCtr - 1
							mainIDs[name]:Hide()
						end
					else
						if (mainIDs[name]:IsShown()) then
							mainIDs[name]:Hide()
						end
					end
				end
			end
		end
		
		ToggleFrameMove(self,db.elements[1].isMoving)
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

MainTimerBarGrp:SetScript('OnMouseDown',function(self,button)
	if (Auras.db.char.elements[1].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroup1',button)
	end
end)

MainTimerBarGrp:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[1].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[1].frames[self:GetName()])
	end
end);

UtilTimerBarGrp:SetScript('OnUpdate',function(self,event,...)
	if (Auras:CharacterCheck(1)) then
		local db = Auras.db.char
		local totemCtr = 0
		local x,subName
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		
		utilIDs['Earthgrab Totem'][3] = false
		utilIDs['Liquid Magma Totem'][3] = false
		utilIDs['Voodoo Totem'][3] = false
		utilIDs['Wind Rush Totem'][3] = false
		
		for i=1,5 do
			local _,name,start,duration = GetTotemInfo(i)
			
			if ((duration or 0) > 0 and name) then
				
				subName = gsub(name," ",'')
				subName = gsub(subName,"^%a",lower)
				if (db.elements[1].timerbars.util[subName]) then
					local timer,seconds = Auras:parseTime((start + duration) - GetTime(),true)
					
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
				
				if (not utilIDs['Liquid Magma Totem'][3] and utilIDs['Liquid Magma Totem'][1]) then
					utilIDs['Liquid Magma Totem'][1] = false
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
		
		--[[if (not utilObj[1] and utilIDs['Earthgrab Totem'][2]:IsShown()) then
			utilIDs['Earthgrab Totem']:Hide()
		end

		if (not utilObj[2] and utilIDs['Liquid Magma Totem'][2]:IsShown()) then
			utilIDs['Liquid Magma Totem']:Hide()
		end

		if (not utilObj[3] and utilIDs['Voodoo Totem'][2]:IsShown()) then
			utilIDs['Voodoo Totem']:Hide()
		end

		if (not utilObj[4] and utilIDs['Wind Rush Totem'][2]:IsShown()) then
			utilIDs['Wind Rush Totem']:Hide()
		end]]
		
		ToggleFrameMove(self,db.elements[1].isMoving)
		
		--[[if (db.elements[1].isMoving) then
			self:SetBackdrop(backdrop)
			self:SetBackdropColor(0,0,0,0.85)
		else
			self:SetBackdrop(nil)
		end]]
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

UtilTimerBarGrp:SetScript('OnMouseDown',function(self,button)
	if (Auras.db.char.elements[1].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroup1',button)
	end
end)

UtilTimerBarGrp:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[1].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[1].frames[self:GetName()])
	end
end);

-- Totem Mastery Notification
local TotemMastery = CreateFrame('Frame','TotemMastery',AuraGroup)
TotemMastery:SetPoint('CENTER',0,-210)
TotemMastery:SetWidth(400)
TotemMastery:SetHeight(180)
TotemMastery:SetFrameStrata('BACKGROUND')
TotemMastery:SetAlpha(0)
TotemMastery:Show()

TotemMastery.texture = TotemMastery:CreateTexture(nil,'LOW')
TotemMastery.texture:SetTexture([[Textures\SpellActivationOverlays\Echo_of_the_Elements]])
TotemMastery.texture:SetPoint('CENTER',TotemMastery,'CENTER',0,0)
TotemMastery.texture:SetWidth(TotemMastery:GetWidth() + 20)
TotemMastery.texture:SetHeight(TotemMastery:GetHeight())
TotemMastery.texture:SetRotation(rad(-90))
TotemMastery.texture:SetAlpha(0.7)

-- Animation for Totem Mastery Notification Texture
TotemMastery.Flash = TotemMastery.texture:CreateAnimationGroup()
TotemMastery.Flash:SetLooping('BOUNCE')

TotemMastery.Flash.fadeIn = TotemMastery.Flash:CreateAnimation('Alpha')
TotemMastery.Flash.fadeIn:SetFromAlpha(1)
TotemMastery.Flash.fadeIn:SetToAlpha(0.4)
TotemMastery.Flash.fadeIn:SetDuration(0.4)

TotemMastery.Flash.fadeOut = TotemMastery.Flash:CreateAnimation('Alpha')
TotemMastery.Flash.fadeOut:SetFromAlpha(0.4)
TotemMastery.Flash.fadeOut:SetToAlpha(1)
TotemMastery.Flash.fadeOut:SetDuration(0.4)
TotemMastery.Flash.fadeOut:SetEndDelay(0)

TotemMastery:SetScript('OnUpdate',function(self)
	if (Auras:CharacterCheck(1)) then
		local remaining
		local _,_,_,selected = GetTalentInfo(1,3,1)
		local isTotem,isRefresh = false,false
		local buff = UnitBuff('player',Auras:GetSpellName(202192))
		local canAttack = UnitCanAttack('player','target')
		local db = Auras.db.char
	
		Auras:ToggleAuraVisibility(self,true,'showhide')
		
		for i=1,5 do
			local _,name = GetTotemInfo(i)

			if (name == 'Totem Mastery') then
				local _,_,start,duration = GetTotemInfo(i)
				
				isTotem = true
				remaining = (start + duration) - GetTime()
				break
			end
		end

		if ((remaining or 0) <= db.settings[1].totemMastery) then
			isRefresh = true
		end

		if (((not isTotem or isRefresh or not buff) and selected and db.elements[1].frames.TotemMastery.isEnabled and canAttack) or db.elements[1].isMoving) then
			self:SetAlpha(1)
			
			if (not self.Flash:IsPlaying()) then
				self.Flash:Play()
			end
			if (UnitAffectingCombat('player')) then
				self.Flash.fadeOut:SetToAlpha(0.6)
				self.Flash.fadeIn:SetFromAlpha(1)
			else
				self.Flash.fadeOut:SetToAlpha(0.3)
				self.Flash.fadeIn:SetFromAlpha(0.6)
			end
		else
			self:SetAlpha(0)
			
			if (self.Flash:IsPlaying()) then
				self.Flash:Stop()
			end
		end
		
		ToggleFrameMove(self,db.elements[1].isMoving)
		--[[if (db.elements[1].isMoving) then
			self:SetBackdrop(backdrop)
			self:SetBackdropColor(0,0,0,0.85)
		else
			self:SetBackdrop(nil)
		end]]
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
end)

TotemMastery:SetScript('OnMouseDown',function(self,button)
	if (Auras.db.char.elements[1].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroup1',button)
	end
end)

TotemMastery:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[1].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[1].frames[self:GetName()])
	end
end)

SSA.TotemMastery = TotemMastery
_G["SSA_TotemMastery"] = TotemMastery


local BackdropCB = SSA.BackdropCB
--[[local TotemGroup = CreateFrame('Frame','TotemGroupEle',AuraGroup)
TotemGroup:SetFrameLevel(1)
--TotemGroup:SetWidth(150)
--TotemGroup:SetHeight(32)
TotemGroup:SetPoint('CENTER',AuraGroup,'CENTER',-210,0)
TotemGroup:SetBackdrop(BackdropCB)
TotemGroup:SetBackdropColor(0.15,0.15,0.15,0.6)
TotemGroup:SetBackdropBorderColor(1,1,1,1)
TotemGroup:SetAlpha(0)
TotemGroup:Show()

local x = {
	[1] = -80,
	[2] = -40,
	[3] = 0,
	[4] = 40,
	[5] = 80,
}

for i=1,5 do
	TotemGroup['Totem'..i] = CreateFrame('Frame',nil,TotemGroup)
	TotemGroup['Totem'..i]:SetWidth(39)
	TotemGroup['Totem'..i]:SetHeight(39)
	TotemGroup['Totem'..i]:SetPoint('CENTER',TotemGroup,'CENTER',x[i],0)
	TotemGroup['Totem'..i]:Show()

	TotemGroup['Totem'..i].texture = TotemGroup['Totem'..i]:CreateTexture(nil,'BACKGROUND')
	TotemGroup['Totem'..i].texture:SetTexture([Interface\addons\ShamanAuras\Media\icons\totems\cloudburst_totem_bevel])
	TotemGroup['Totem'..i].texture:SetAllPoints(TotemGroup['Totem'..i])
end
SSA.TotemGroupEle = TotemGroup
_G['SSA_TotemGroupEle'] = TotemGroup]]
--[[TotemGroup.Totem1 = CreateFrame("Frame",nil,TotemGroup);
TotemGroup.Totem1:SetWidth(32);
TotemGroup.Totem1:SetHeight(32);
TotemGroup.Totem1:SetPoint("CENTER",TotemGroup,"CENTER",-100,0);
TotemGroup.Totem1:Show();

TotemGroup.Totem1.texture = TotemGroup.Totem1:CreateTexture(nil,"BACKGROUND");
TotemGroup.Totem1.texture:SetTexture("Interface\\addons\\ShamanAuras\\Media\\icons\\totems\\cloudburst_totem_bevel");
TotemGroup.Totem1.texture:SetAllPoints(TotemGroup.Totem1);

TotemGroup.Totem2 = CreateFrame("Frame",nil,TotemGroup);
TotemGroup.Totem2:SetWidth(32);
TotemGroup.Totem2:SetHeight(32);
TotemGroup.Totem2:SetPoint("CENTER",TotemGroup,"CENTER",-100,0);
TotemGroup.Totem2:Show();

TotemGroup.Totem2.texture = TotemGroup.Totem2:CreateTexture(nil,"BACKGROUND");
TotemGroup.Totem2.texture:SetTexture("Interface\\addons\\ShamanAuras\\Media\\icons\\totems\\cloudburst_totem_bevel");
TotemGroup.Totem2.texture:SetAllPoints(TotemGroup.Totem2);]]



-- Stormkeeper Charges
--local SK_buff,SK_count;
local tempX = {
	[1] = {
		[1] = 30,
		[2] = 'LEFT',
	},
	[2] = {
		[1] = 0,
		[2] = 'CENTER',
	},
	[3] = {
		[1] = -30,
		[2] = 'RIGHT',
	},
}
--SSA.StormkeeperChargeGrp = CreateFrame("Frame","StormkeeperChargeGrp",AuraGroup);

local Redraw = function(self)
	if (not self.model_path) then 
		self.model_path = 'spells/Monk_chiblast_precast.m2'
	end

	if type(self.model_path) == 'number' then
		self:SetDisplayInfo(self.model_path)
	else
		self:SetModel(self.model_path)
	end
	self:SetModelScale(1)
	self:SetPosition(0,0,0)
end

local ResetTransformations = function(self)
	self:SetModelScale(1)
	self:SetPosition(0,0,0)
end

--local StormkeeperCharges = SSA.StormkeeperChargeGrp
local StormkeeperCharges = CreateFrame('Frame','StormkeeperChargeGrp',AuraGroup)
StormkeeperCharges:SetFrameStrata(bg)
StormkeeperCharges:SetWidth(260)
StormkeeperCharges:SetHeight(50)
StormkeeperCharges:SetPoint('CENTER',AuraGroup,'CENTER',0,-110)
StormkeeperCharges:Show()



for i=1,3 do
	StormkeeperCharges['Charge'..i] = CreateFrame('Frame','StormkeeperCharge'..i,StormkeeperCharges)
	StormkeeperCharges['Charge'..i]:SetWidth(100)
	StormkeeperCharges['Charge'..i]:SetHeight(100)
	StormkeeperCharges['Charge'..i]:SetPoint('CENTER',StormkeeperCharges,tempX[i][2],tempX[i][1],-3)
	StormkeeperCharges['Charge'..i]:SetAlpha(0)
	StormkeeperCharges['Charge'..i]:Show()
	
	StormkeeperCharges['Charge'..i].Lightning = CreateFrame('PlayerModel','StormkeeperCharge'..i..'_Lightning',StormkeeperCharges['Charge'..i])
	StormkeeperCharges['Charge'..i].Lightning:SetModel('spells/Monk_chiblast_precast.m2')
	StormkeeperCharges['Charge'..i].Lightning:SetPosition(0,0,0)
	StormkeeperCharges['Charge'..i].Lightning:SetRotation(0)
	--StormkeeperCharges['Charge'..i].Lightning:SetCamera(0)
	StormkeeperCharges['Charge'..i].Lightning:SetAllPoints(StormkeeperCharges['Charge'..i])
	StormkeeperCharges['Charge'..i].Lightning:SetAlpha(1)
	StormkeeperCharges['Charge'..i].Lightning:SetSequence(37)
	StormkeeperCharges['Charge'..i].Lightning:SetScript('OnHide', ResetTransformations)
	StormkeeperCharges['Charge'..i].Lightning:SetScript('OnShow', Redraw)
	StormkeeperCharges['Charge'..i].Lightning.Redraw = Redraw
	StormkeeperCharges['Charge'..i].Lightning.ResetTransformations = ResetTransformations
end
twipe(tempX)

StormkeeperCharges:SetScript('OnUpdate',function(self,elapsed)
	if (Auras:CharacterCheck(1)) then
		local buff,_,_,count = UnitBuff('player',Auras:GetSpellName(205495))
		local db = Auras.db.char
		
		Auras:ToggleAuraVisibility(self,true,'showhide')
		--[[if (not self:IsShown()) then
			self:Show()
		end]]
		
		--[[SSA.ErrorFrame.text:SetText("")
		SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Group:    "..self:GetAlpha().." ("..tostring(self:IsShown())..")\n")]]
		if (db.elements[1].isMoving) then
			self.Charge1:SetAlpha(1)
			self.Charge2:SetAlpha(1)
			self.Charge3:SetAlpha(1)
		else
			if (db.elements[1].frames.StormkeeperChargeGrp.isEnabled) then
				if (count == 3) then
					--isStormkeeperActive = true
					--[[for i=1,3 do
						self["Charge"..i].Lightning:SetModel("spells/Monk_chiblast_precast.m2")
						self["Charge"..i].Lightning:SetModelScale(1)
						self["Charge"..i].Lightning:SetPosition(0,0,0)
					end]]
					--[[SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Charge 1: "..self.Charge1:GetAlpha().." ("..tostring(self.Charge1:IsShown())..")\n")
					SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Charge 2: "..self.Charge2:GetAlpha().." ("..tostring(self.Charge2:IsShown())..")\n")
					SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Charge 3: "..self.Charge3:GetAlpha().." ("..tostring(self.Charge3:IsShown())..")\n\n")]]
					self.Charge1:SetAlpha(1)
					self.Charge2:SetAlpha(1)
					self.Charge3:SetAlpha(1)
				elseif (count == 2) then
					--[[SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Charge 1: "..self.Charge1:GetAlpha().." ("..tostring(self.Charge1:IsShown())..")\n")
					SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Charge 2: "..self.Charge2:GetAlpha().." ("..tostring(self.Charge2:IsShown())..")\n")
					SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Charge 3: "..self.Charge3:GetAlpha().." ("..tostring(self.Charge3:IsShown())..")\n\n")]]
					self.Charge3:SetAlpha(0)
				elseif (count == 1) then
					--[[SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Charge 1: "..self.Charge1:GetAlpha().." ("..tostring(self.Charge1:IsShown())..")\n")
					SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Charge 2: "..self.Charge2:GetAlpha().." ("..tostring(self.Charge2:IsShown())..")\n")
					SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Charge 3: "..self.Charge3:GetAlpha().." ("..tostring(self.Charge3:IsShown())..")\n\n")]]
					self.Charge2:SetAlpha(0)
				elseif (count == 0 or not buff) then
					--[[SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Charge 1: "..self.Charge1:GetAlpha().." ("..tostring(self.Charge1:IsShown())..")\n")
					SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Charge 2: "..self.Charge2:GetAlpha().." ("..tostring(self.Charge2:IsShown())..")\n")
					SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Charge 3: "..self.Charge3:GetAlpha().." ("..tostring(self.Charge3:IsShown())..")\n\n")]]
					
					--if (isStormkeeperActive) then
						self.Charge1:SetAlpha(0)
						self.Charge2:SetAlpha(0)
						self.Charge3:SetAlpha(0)
						--isStormkeeperActive = false
					--end
				end
			end
		end
		
		--[[if (db.elements[1].isMoving) then
			self:SetBackdrop(backdrop)
			self:SetBackdropColor(0,0,0,0.85)
		else
			self:SetBackdrop(nil)
		end]]
		ToggleFrameMove(self,db.elements[1].isMoving)
	else
		Auras:ToggleAuraVisibility(self,false,'showhide')
	end
	
	--[[local x1,y1,z1 = self.Charge1.Lightning:GetPosition()
	local worldScale = self.Charge1.Lightning:GetWorldScale()

	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."----- Charge 1 -----\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Camera Facing:   "..format("%.4f",self.Charge1.Lightning:GetCameraFacing()).."\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Camera Distance:  "..format("%.4f",self.Charge1.Lightning:GetCameraDistance()).."\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Camera Target:    "..format("%.4f",self.Charge1.Lightning:GetCameraTarget()).."\n")
	--SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."------------------------------------\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Do Blend:  "..tostring(self.Charge1.Lightning:GetDoBlend()).."\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Facing:    "..tostring(self.Charge1.Lightning:GetFacing()).."\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Fog Color: "..format("%.4f",self.Charge1.Lightning:GetFogColor()).."\n")
	--SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."------------------------------------\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Fog Far:   "..tostring(self.Charge1.Lightning:GetFogFar()).."\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Fog Near:  "..tostring(self.Charge1.Lightning:GetFogNear()).."\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Light:     "..tostring(self.Charge1.Lightning:GetLight()).."\n")
	--SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."------------------------------------\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."ModelScale:  "..tostring(self.Charge1.Lightning:GetModelScale()).."\n")
	if (not worldScale) then
		SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."World Scale: error\n")
	else
		SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."World Scale: "..format("%.4f",self.Charge1.Lightning:GetWorldScale()).."\n")
	end
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."X: "..x1..", Y: "..y1..", Z: "..z1.."\n\n")
	
	local x2,y2,z2 = self.Charge2.Lightning:GetPosition()
	local worldScale = self.Charge1.Lightning:GetWorldScale()
	
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."----- Charge 2 -----\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Camera Facing:   "..format("%.4f",self.Charge2.Lightning:GetCameraFacing()).."\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Camera Distance:  "..format("%.4f",self.Charge2.Lightning:GetCameraDistance()).."\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Camera Target:    "..format("%.4f",self.Charge2.Lightning:GetCameraTarget()).."\n")
	--SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."------------------------------------\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Do Blend:  "..tostring(self.Charge2.Lightning:GetDoBlend()).."\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Facing:    "..tostring(self.Charge2.Lightning:GetFacing()).."\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Fog Color: "..format("%.4f",self.Charge2.Lightning:GetFogColor()).."\n")
	--SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."------------------------------------\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Fog Far:   "..tostring(self.Charge2.Lightning:GetFogFar()).."\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Fog Near:  "..tostring(self.Charge2.Lightning:GetFogNear()).."\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Light:     "..tostring(self.Charge2.Lightning:GetLight()).."\n")
	--SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."------------------------------------\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."ModelScale:  "..tostring(self.Charge2.Lightning:GetModelScale()).."\n")
	if (not worldScale) then
		SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."World Scale: error\n")
	else
		SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."World Scale: "..format("%.4f",self.Charge2.Lightning:GetWorldScale()).."\n")
	end
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."X: "..x2..", Y: "..y2..", Z: "..z2.."\n\n")
	
	local x3,y3,z3 = self.Charge3.Lightning:GetPosition()
	local worldScale = self.Charge1.Lightning:GetWorldScale()
	
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."----- Charge 3 -----\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Camera Facing:   "..format("%.4f",self.Charge3.Lightning:GetCameraFacing()).."\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Camera Distance:  "..format("%.4f",self.Charge3.Lightning:GetCameraDistance()).."\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Camera Target:    "..format("%.4f",self.Charge3.Lightning:GetCameraTarget()).."\n")
	--SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."------------------------------------\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Do Blend:  "..tostring(self.Charge3.Lightning:GetDoBlend()).."\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Facing:    "..tostring(self.Charge3.Lightning:GetFacing()).."\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Fog Color: "..format("%.4f",self.Charge3.Lightning:GetFogColor()).."\n")
	--SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."------------------------------------\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Fog Far:   "..tostring(self.Charge3.Lightning:GetFogFar()).."\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Fog Near:  "..tostring(self.Charge3.Lightning:GetFogNear()).."\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Light:     "..tostring(self.Charge3.Lightning:GetLight()).."\n")
	--SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."------------------------------------\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."ModelScale: "..tostring(self.Charge3.Lightning:GetModelScale()).."\n")
	if (not worldScale) then
		SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."World Scale: error\n")
	else
		SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."World Scale: "..format("%.4f",self.Charge2.Lightning:GetWorldScale()).."\n")
	end
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."X: "..x3..", Y: "..y3..", Z: "..z3.."\n\n")]]
end)

StormkeeperCharges:SetScript('OnMouseDown',function(self,button)
	if (Auras.db.char.elements[1].isMoving) then
		Auras:MoveOnMouseDown(self,'AuraGroup1',button)
	end
end)

StormkeeperCharges:SetScript('OnMouseUp',function(self,button)
	if (Auras.db.char.elements[1].isMoving) then
		Auras:MoveOnMouseUp(self,button)
		Auras:UpdateLayout(self,Auras.db.char.elements[1].frames[self:GetName()])
	end
end)

--[[StormkeeperCharges.Charge2 = CreateFrame("Frame","StormkeeperCharge2",StormkeeperCharges);
--local StormkeeperCharges.Charge2 = SSA.StormkeeperCharges.Charge2;
StormkeeperCharges.Charge2:SetWidth(100);
StormkeeperCharges.Charge2:SetHeight(100);
StormkeeperCharges.Charge2:SetPoint("CENTER",StormkeeperCharges,"CENTER",0,-3);
StormkeeperCharges.Charge2:SetAlpha(0);
StormkeeperCharges.Charge2:Show();

StormkeeperCharges.Charge2.Lightning = CreateFrame("PlayerModel","StormkeeperCharge2_Lightning",StormkeeperCharges.Charge2);
StormkeeperCharges.Charge2.Lightning:SetModel("spells/Monk_chiblast_precast.m2");
StormkeeperCharges.Charge2.Lightning:SetFrameStrata(low);
StormkeeperCharges.Charge2.Lightning:SetPosition(0,0,0);
StormkeeperCharges.Charge2.Lightning:SetAllPoints(StormkeeperCharges.Charge2);
StormkeeperCharges.Charge2.Lightning:SetAlpha(1);
StormkeeperCharges.Charge2.Lightning:SetSequence(37);
elapsed = 0;
StormkeeperCharges.Charge2.Lightning:HookScript('OnUpdate', function(self, elaps)
	elapsed = elapsed + (elaps * 1000);
	self:SetSequenceTime(1, elapsed);
end);

StormkeeperCharges.Charge3 = CreateFrame("Frame","StormkeeperCharge3",StormkeeperCharges);
--local StormkeeperCharges.Charge3 = SSA.StormkeeperCharges.Charge3;
StormkeeperCharges.Charge3:SetWidth(100);
StormkeeperCharges.Charge3:SetHeight(100);
StormkeeperCharges.Charge3:SetPoint("CENTER",StormkeeperCharges,"RIGHT",-30,-3);
StormkeeperCharges.Charge3:SetAlpha(0);
StormkeeperCharges.Charge3:Show();

StormkeeperCharges.Charge3.Lightning = CreateFrame("PlayerModel","StormkeeperCharge3_Lightning",StormkeeperCharges.Charge3);
StormkeeperCharges.Charge3.Lightning:SetModel("spells/Monk_chiblast_precast.m2");
StormkeeperCharges.Charge3.Lightning:SetFrameStrata(low);
StormkeeperCharges.Charge3.Lightning:SetPosition(0,0,0);
StormkeeperCharges.Charge3.Lightning:SetAllPoints(StormkeeperCharges.Charge3);
StormkeeperCharges.Charge3.Lightning:SetAlpha(1);
StormkeeperCharges.Charge3.Lightning:SetSequence(37);
elapsed = 0;
StormkeeperCharges.Charge3.Lightning:HookScript('OnUpdate', function(self, elaps)
	elapsed = elapsed + (elaps * 1000);
	self:SetSequenceTime(1, elapsed);
end);]]


SSA.StormkeeperChargeGrp = StormkeeperCharges;
_G['SSA_Stormkeeper'] = StormkeeperCharges;


-------------------------------------------------------------------------------------------------------
----- Build Move UI
-------------------------------------------------------------------------------------------------------

_G['SSA_AuraGroup1'] = AuraGroup

-- Initialize Check Button Frames
SSA.Move1 = CreateFrame('Frame','Move1',UIParent);
