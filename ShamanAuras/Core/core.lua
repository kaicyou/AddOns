--[[

]]
local SSA, Auras, L, LSM, LBG = unpack(select(2,...))

-- Cache Global Variables
-- Lua Function
local _G = _G
local floor, fmod = math.floor, math.fmod
local pairs, select, tonumber, tostring = pairs, select, tonumber, tostring
local twipe = table.wipe
local format, lower, split, sub = string.format, string.lower, string.split, string.sub
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



--SSA.MoveEnh = CreateFrame('Frame','MoveEnh',UIParent)
--SSA.MoveRes = CreateFrame('Frame','MoveRes',UIParent)



function Auras:CurText(name)
	return SSA[name].text:GetText() or ''
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

function Auras:HealthPrecision(precision,isNotMax,override)
	local spec,health = GetSpecialization()
	if (override) then
		health = floor(UnitHealthMax('player',19) - (UnitHealthMax('player',19) * 0.75))
	elseif (isNotMax) then
		health = UnitHealth('player',19)
	else
		health = UnitHealthMax('player',19)
	end
	
	if (health > 1000) then
		--local health = UnitHealthMax('player',19)
		if (precision == 'Long') then
			if (Auras.db.char.elements[spec].statusbars.healthBar.grouping) then
				return BreakUpLargeNumbers(health)
			else
				return health
			end
		elseif (precision == 'Short') then
			if (health > 1000000) then
				return format('%.1f',health / 1000000)..'M'
			elseif (health > 1000) then
				if (Auras.db.char.elements[spec].statusbars.healthBar.grouping) then
					return format('%.1f',BreakUpLargeNumbers(health / 1000))..'K'
				else
					return format('%.1f',health / 1000)..'K'
				end
			end
		end
	else
		return health
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

--[[function Auras:ToggleCooldownSwipe(self,arg1)
	local cooldown = _G[self:GetName()]
	if (not arg1) then
		cooldown:SetSwipeColor(0,0,0,0)
	else
		cooldown:SetSwipeColor(1,1,1,1)
	end
	cooldown:SetDrawSwipe(arg1)
	cooldown:SetDrawEdge(arg1)
	cooldown:SetDrawBling(arg1)
end]]

--[[function Auras:PreviewCooldown(self)
	local expire,progress
	
	if (not expire or GetTime() > expire) then
		expire = GetTime() + 6
	end
	
	self:Show()
	progress = expire - GetTime()
	print(progress)
	self.text:SetText(3 + progress)
end]]

-- Complete Cooldown Handler
function Auras:CooldownHandler(self,spec,group,subgroup,start,duration,bypass)
	local cd = Auras.db.char.elements[spec].cooldowns
	
	--Auras:ToggleCooldownSwipe(self,spec)
	
	if (cd.adjust and not UnitAffectingCombat('player')) then
		--self:SetAlpha(1)
		--[[if (self.ChargeCD) then
			self.Charges.text:SetText('')
		end]]
		grp,subgrp = split(";",cd.selected)
		--SSA.DataFrame.text:SetText("Group: "..tostring(group).." ("..tostring(grp)..")\nSubGroup: "..tostring(subgroup).." ("..tostring(subgrp)..")\n\n")
		
		
		
		if (group == grp and subgroup == tonumber(subgrp)) then
			if (self.Charges) then
				self.Charges:Hide()
			end
			--SSA.DataFrame.text:SetText(Auras:CurText('DataFrame').."TRUE: "..tostring(self:GetName()).."\n")
			Auras:PreviewCooldown(self,group,tonumber(subgroup),spec)
		else
			--SSA.DataFrame.text:SetText(Auras:CurText('DataFrame').."FALSE: "..tostring(self:GetName()).."\n")
			if (self.PCD:IsShown()) then
				self.PCD:Hide()
			end
		end
	else
		if (self.PCD:IsShown()) then
			self.PCD:Hide()
		end
		
		if (self.Charges and not self.Charges:IsShown()) then
			self.Charges:Show()
		end
		
		Auras:ExecuteGCD(self,(start or 0),spec)
		--Auras:ToggleCooldownSwipe(self,spec)
		Auras:UpdateCooldown(self,spec,cd)
		
		if (not bypass and (duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,group,subgroup,spec)
		end
		
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
	local spec = GetSpecialization()
	
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
			subName = gsub(objName,"^%a",lower)
			subName = gsub(subName,spec,'')
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
			LBG.ShowOverlayGlow(object)
		else
			LBG.HideOverlayGlow(object)
		end
	else
		if (toggle) then
			LBG.ShowOverlayGlow(object)
		else
			LBG.HideOverlayGlow(object)
		end
	end
end




