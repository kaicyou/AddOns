--[[local FOLDER_NAME, SSA = ...

local L = LibStub('AceLocale-3.0'):GetLocale('ShamanAuras', true)
local Auras = LibStub('AceAddon-3.0'):GetAddon('ShamanAuras')
local LSM = LibStub('LibSharedMedia-3.0')]]

local SSA, Auras, L, LSM = unpack(select(2,...))


-- Cache Global Variables
-- Lua Function
local getn = table.getn
local tostring = tostring
-- WoW API / Variables
local GetTime = GetTime

function Auras:InitializeCooldowns(self,spec)
	local cd = Auras.db.char.elements[spec].cooldowns
	local frames = { SSA[self]:GetChildren() }
	
	local ignoreFrames = {
		["StormkeeperChargeGrp"] = true,
		["StormstrikeChargeGrp"] = true,
		["Cloudburst"] = true,
	}
	
	for i=1,getn(frames) do
		if (frames[i]:GetObjectType() == "Frame" and not ignoreFrames[frames[i]:GetName()]) then
			local auras = { frames[i]:GetChildren() }
			for j=1,getn(auras) do
				if (auras[j]:GetObjectType() == "Frame") then
					local aura = auras[j]
					
					-- Set Cooldown's Text Visibility
					aura.CD:SetHideCountdownNumbers(true)
					aura.PCD:SetHideCountdownNumbers(true)
					
					-- Set Cooldown's Spiral Direction
					aura.CD:SetReverse(cd.inverse)
					aura.PCD:SetReverse(cd.inverse)
					
					if (aura.GCD) then
						aura.GCD:SetReverse(cd.inverse)
					end
					
					if (aura.ChargeCD) then
						aura.ChargeCD:SetHideCountdownNumbers(true)
					end
					
					if (cd.sweep) then
						aura.PCD:SetDrawSwipe(true)
						aura.PCD:SetDrawEdge(true)
					else
						aura.PCD:SetDrawSwipe(false)
						aura.PCD:SetDrawEdge(false)
					end
				end
			end
		end
	end
end

function Auras:UpdateCooldown(self,spec,cd)
	-- Gather CD Information
	local swipe,bling = self.CD:GetDrawSwipe(),self.CD:GetDrawBling()
	local start,duration = self.CD:GetCooldownTimes()
					
	-- Configure CD
	if (start == 0 or duration == 0) then
		if (swipe) then
			self.CD:SetDrawSwipe(false)
			self.CD:SetDrawEdge(false)
		end
		
		if (bling) then
			self.CD:SetDrawBling(false)
		end
	elseif (cd.sweep and cd.bling) then
		if (not swipe) then
			self.CD:SetDrawSwipe(true)
			self.CD:SetDrawEdge(true)
		end
		
		if (not bling) then
			self.CD:SetDrawBling(true)
		end
	elseif (cd.sweep and not cd.bling) then
		if (not swipe) then
			self.CD:SetDrawSwipe(true)
			self.CD:SetDrawEdge(true)
		end
		
		if (bling) then
			self.CD:SetDrawBling(false)
		end
	else
		if (swipe) then
			self.CD:SetDrawSwipe(false)
			self.CD:SetDrawEdge(false)
		end
		
		if (bling) then
			self.CD:SetDrawBling(false)
		end
	end

	if (self.GCD) then
		-- Gather GCD Information
		local gSwipe,gBling = self.GCD:GetDrawSwipe(),self.GCD:GetDrawBling()
		local gStart,gDuration = self.GCD:GetCooldownTimes()
	
		if (cd.GCD.isEnabled and cd.sweep and cd.bling) then
			if (not gSwipe) then
				self.GCD:SetDrawSwipe(true)
				self.GCD:SetDrawEdge(true)
			end
			
			if (not gBling) then
				self.GCD:SetDrawBling(true)
			end
		elseif (cd.GCD.isEnabled and cd.sweep and not cd.bling) then
			if (not gSwipe) then
				self.GCD:SetDrawSwipe(true)
				self.GCD:SetDrawEdge(true)
			end
			
			if (gBling) then
				self.GCD:SetDrawBling(false)
			end
		else
			if (gSwipe) then
				self.GCD:SetDrawSwipe(false)
				self.GCD:SetDrawEdge(false)
			end
			
			if (gBling) then
				self.GCD:SetDrawBling(false)
			end
		end
	end
end

function Auras:SetCooldownFont(self,cdGrp)
	self.text:SetFont(LSM.MediaTable.font[cdGrp.text.font.name],cdGrp.text.font.size,cdGrp.text.font.flag)
	self.text:SetTextColor(cdGrp.text.font.color.r,cdGrp.text.font.color.g,cdGrp.text.font.color.b,cdGrp.text.font.color.a)
	
	self.text:ClearAllPoints()
	self.text:SetPoint(cdGrp.text.justify,self,cdGrp.text.justify,cdGrp.text.x,cdGrp.text.y)
	
	if (cdGrp.text.font.shadow.isEnabled) then
		self.text:SetShadowColor(cdGrp.text.font.shadow.color.r,cdGrp.text.font.shadow.color.g,cdGrp.text.font.shadow.color.b,cdGrp.text.font.shadow.color.a)
		self.text:SetShadowOffset(cdGrp.text.font.shadow.offset.x,cdGrp.text.font.shadow.offset.y)
	else
		self.text:SetShadowColor(0,0,0,0)
	end
end

function Auras:PreviewCooldown(self,group,subgroup,spec)
	local db = Auras.db.char
	local cd = db.elements[spec].cooldowns
	local cdGrp = cd[group][subgroup]
	
	if (not self.PCD:IsShown()) then
		self.PCD:Show()
	end
	
	local start,duration = self.PCD:GetCooldownTimes()
	local remains = ((start + duration) / 1e3) - GetTime()

	Auras:SetCooldownFont(self.PCD,cdGrp)
		
	if (remains <= 3) then
		self.PCD:SetCooldown(GetTime(),10)	
	else
		if (cd.text) then
			self.PCD.text:SetText(Auras:parseTime(remains,false))
		else
			self.PCD.text:SetText('')
		end	
	end
end

function Auras:ExecuteGCD(self,start,spec)
	if (not self.GCD) then
		return
	end
	
	local cd = Auras.db.char.elements[spec].cooldowns
	local strt,duration = self.CD:GetCooldownTimes()
	local gDur = self.GCD:GetCooldownDuration()
	
	if (cd.isEnabled and cd.GCD.isEnabled and cd.GCD.length > 0 and strt == 0 and GetTime() < cd.GCD.endTime) then
		if (not self.GCD:IsShown()) then
			self.GCD:Show()
		end
		self.GCD:SetReverse(cd.inverse)
		self.GCD:SetCooldown(start,cd.GCD.length)
	else
		
		if (not cd.isEnabled or not cd.GCD.isEnabled or cd.interrupted or GetTime() > (cd.GCD.endTime + 1) or strt > 0) then
			if (self.GCD:IsShown()) then
				self.GCD:Hide()
			end
		end
	end
end

--function Auras:ExecuteCooldown(self,start,duration,isSmallAura,isHideText,spec)
function Auras:ExecuteCooldown(self,start,duration,group,subgroup,spec)
	-- Initialize Database Vars
	local cd = Auras.db.char.elements[spec].cooldowns
	local cdGrp = cd[group][subgroup]
	
	-- Initialize Time-based Vars
	local expires = start + duration
	local timer = expires - GetTime()
	local remaining,seconds = Auras:parseTime(timer,false)

	if (not cd.isEnabled) then
		self.CD:Hide()
		return
	else
		if (not self.CD:IsShown()) then
			self.CD:Show()
		end
	end
	
	Auras:SetCooldownFont(self.CD,cdGrp)
	self.CD:SetCooldown(start,duration)
	
	if (cd.text) then
		self.CD.text:SetText(Auras:parseTime(timer,false))
	else
		self.CD.text:SetText('')
	end
end
