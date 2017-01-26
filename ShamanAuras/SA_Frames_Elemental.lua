
local FOLDER_NAME, SSA = ...

local L = LibStub("AceLocale-3.0"):GetLocale("ShamanAuras", true)
local Auras = LibStub("AceAddon-3.0"):GetAddon("ShamanAuras")
local AceGUI = LibStub("AceGUI-3.0");

local lgIcon,lgGlow,smIcon,smGlow = 32,45,25,35;
--local lg,sm,gl = 32,25,45; -- Square Dimensions: Large, Small, Glow
local x,y = 0,0,0;
local bg,low,med,high = "BACKGROUND","LOW","MEDIUM","HIGH"
local buffTable,mainTable,utilTable = {},{},{};
local mainStart,mainGUIDs,mainDuration = {},{},{};
local utilStart,utilGUIDs,utilDuration = {},{},{};
local isStormkeeperActive = false;

local backdrop = {
	bgFile   = "Interface\\Tooltips\\UI-Tooltip-Background",
	edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
	tile = true,
	tileSize = 16,
	edgeSize = 10
}

-------------------------------------------------------------------------------------------------------
----- Build and Initialize Frames & Frame Groups
-------------------------------------------------------------------------------------------------------

local EventFrame = CreateFrame("Frame");

EventFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");

-- Aura Group Builder
local function CreateGroup(name,parent)
	SSA[name] = CreateFrame("Frame",name,parent);
	local Group = SSA[name];
	Group:SetFrameStrata(bg);
	--Group:RegisterForDrag("LeftButton");
	
	return Group;
end

-- Aura Icon Builder
local function InitializeFrames(name,parent,icon,iconSize,glowSize,charge)
	SSA[name] = CreateFrame("Frame",name,parent);
	local Frame = SSA[name];
	Frame:SetFrameStrata("LOW");
	Frame:SetWidth(iconSize);
	Frame:SetHeight(iconSize);

	Frame.texture = Frame:CreateTexture(nil,"BACKGROUND");
	Frame.texture:SetTexture("Interface\\addons\\ShamanAuras\\media\\ICONS\\"..icon);
	Frame.texture:SetAllPoints(Frame);

	Frame.CD = CreateFrame("Cooldown", name.."CD", Frame, "CooldownFrameTemplate");
	Frame.CD:SetAllPoints(Frame);
	
	Frame.CD.text = Frame.CD:CreateFontString(nil, "MEDIUM", "GameFontHighlightLarge");
	Frame.CD.text:SetFont("Interface\\addons\\ShamanAuras\\media\\fonts\\PT_Sans_Narrow.TTF", 18,"OUTLINE");
	Frame.CD.text:SetAllPoints(Frame.CD);
	Frame.CD.text:SetPoint("CENTER",0,0);
	Frame.CD.text:SetTextColor(1,1,0,1);
	
	if (glowSize) then
		--[[SSA[name.."Glow"] = CreateFrame("Frame",name.."Glow",Frame);
		local Glow = SSA[name.."Glow"];
		Glow:SetPoint("CENTER",0,0);
		Glow:SetFrameStrata("BACKGROUND");
		Glow:SetWidth(glowSize);
		Glow:SetHeight(glowSize);
		Glow:Show();]]
		Frame.glow = CreateFrame("Frame",name.."Glow",Frame);
		Frame.glow:SetPoint("CENTER",0,0);
		Frame.glow:SetFrameStrata("BACKGROUND");
		Frame.glow:SetWidth(glowSize);
		Frame.glow:SetHeight(glowSize);
		Frame.glow:Show();
	end
	if (charge) then
		Frame.ChargeCD = CreateFrame("Cooldown", name.."ChargeCD", Frame, "CooldownFrameTemplate");
		Frame.ChargeCD:SetAllPoints(Frame);
		Frame.ChargeCD:SetFrameStrata("LOW");
		Frame.ChargeCD:Show()

		Frame.Charges = CreateFrame("Frame",name.."Charges",Frame);
		Frame.Charges:SetAllPoints(Frame);
		Frame.Charges:SetFrameStrata(med);
		Frame.Charges:SetWidth(iconSize);
		Frame.Charges:SetHeight(iconSize);

		Frame.Charges.text = Frame.Charges:CreateFontString(nil, "MEDIUM", "GameFontHighlightLarge");
		Frame.Charges.text:SetPoint("BOTTOMRIGHT",-3,3);
		Frame.Charges.text:SetFont("Interface\\addons\\ShamanAuras\\Media\\fonts\\ABF.ttf", 13.5,"OUTLINE");
		Frame.Charges.text:SetTextColor(1,1,1,1);		
	end
	_G["SSA_"..name] = Frame;
end


local AuraGroup,LargeIconGrpTop,LargeIconGrpBot,SmallIconGrpLeft,SmallIconGrpRight

-- Build Elemental Aura Group Containers
AuraGroup = CreateGroup("AuraGroupEle",UIParent);
LargeIconGrpTop = CreateGroup("LargeIconGrpTopEle",AuraGroup);
LargeIconGrpBot = CreateGroup("LargeIconGrpBotEle",AuraGroup);
SmallIconGrpLeft = CreateGroup("SmallIconGrpLeftEle",AuraGroup);
SmallIconGrpRight = CreateGroup("SmallIconGrpRightEle",AuraGroup);

-- Build Large Elemental Icon Frames
InitializeFrames("AscendanceEle",LargeIconGrpBot,"shared\\ascendance",lgIcon);
InitializeFrames("EarthShock",LargeIconGrpTop,"elemental\\earth_shock",lgIcon,lgGlow);
InitializeFrames("Earthquake",LargeIconGrpTop,"elemental\\earthquake",lgIcon,lgGlow);
InitializeFrames("ElementalBlast",LargeIconGrpTop,"elemental\\elemental_blast",lgIcon);
InitializeFrames("ElementalMastery",LargeIconGrpBot,"elemental\\elemental_mastery",lgIcon);
InitializeFrames("FireElemental",LargeIconGrpBot,"elemental\\fire_elemental",lgIcon);
InitializeFrames("FlameShock",LargeIconGrpTop,"shared\\flame_shock",lgIcon,lgGlow);
InitializeFrames("Icefury",LargeIconGrpBot,"elemental\\icefury",lgIcon);
InitializeFrames("LavaBurstEle",LargeIconGrpTop,"elemental\\lava_burst",lgIcon,lgGlow,true);
InitializeFrames("LiquidMagmaTotem",LargeIconGrpBot,"totems\\liquid_magma_totem",lgIcon);
InitializeFrames("StormElemental",LargeIconGrpBot,"elemental\\storm_elemental",lgIcon);
InitializeFrames("Stormkeeper",LargeIconGrpBot,"elemental\\stormkeeper",lgIcon);

-- Build Small Elemental Icon Frames
InitializeFrames("AncestralGuidanceEle",SmallIconGrpLeft,"shared\\ancestral_guidance",smIcon);
InitializeFrames("AstralShiftEle",SmallIconGrpLeft,"shared\\astral_shift",smIcon);
InitializeFrames("CleanseSpiritEle",SmallIconGrpLeft,"restoration\\purify_spirit",smIcon);
InitializeFrames("EarthElemental",SmallIconGrpRight,"elemental\\earth_elemental",smIcon);
InitializeFrames("EarthgrabTotemEle",SmallIconGrpRight,"totems\\earthgrab_totem",smIcon);
InitializeFrames("GustWindEle",SmallIconGrpRight,"shared\\gust_of_wind",smIcon);
InitializeFrames("HexEle",SmallIconGrpLeft,"shared\\hex",smIcon);
InitializeFrames("LightningSurgeTotemEle",SmallIconGrpRight,"totems\\lightning_surge_totem",smIcon);
InitializeFrames("Thunderstorm",SmallIconGrpRight,"elemental\\thunderstorm",smIcon);
InitializeFrames("VoodooTotemEle",SmallIconGrpLeft,"totems\\voodoo_totem",smIcon);
InitializeFrames("WindRushTotemEle",SmallIconGrpRight,"totems\\wind_rush_totem",smIcon);
InitializeFrames("WindShearEle",SmallIconGrpLeft,"shared\\wind_shear",smIcon);

-------------------------------------------------------------------------------------------------------
----- Initialize Scripts (Aura Groups)
-------------------------------------------------------------------------------------------------------

AuraGroup:SetScript("OnUpdate",function(self,button)
	if (Auras.db.char.layout[1].isMoving) then
		self:SetBackdrop(backdrop);
		self:SetBackdropColor(0,0,0,0.5);
	else
		self:SetBackdrop(nil);
	end
end);

LargeIconGrpTop:SetScript("OnUpdate",function(self,button)
	if (Auras.db.char.layout[1].isMoving) then
		self:SetBackdrop(backdrop);
		self:SetBackdropColor(0,0,0,0.85);
	else
		self:SetBackdrop(nil);
	end
end);

LargeIconGrpBot:SetScript("OnUpdate",function(self,button)
	if (Auras.db.char.layout[1].isMoving) then
		self:SetBackdrop(backdrop);
		self:SetBackdropColor(0,0,0,0.85);
	else
		self:SetBackdrop(nil);
	end
end);

SmallIconGrpLeft:SetScript("OnUpdate",function(self,button)
	if (Auras.db.char.layout[1].isMoving) then
		self:SetBackdrop(backdrop);
		self:SetBackdropColor(0,0,0,0.85);
	else
		self:SetBackdrop(nil);
	end
end);

SmallIconGrpRight:SetScript("OnUpdate",function(self,button)
	if (Auras.db.char.layout[1].isMoving) then
		self:SetBackdrop(backdrop);
		self:SetBackdropColor(0,0,0,0.85);
	else
		self:SetBackdrop(nil);
	end
end);

-------------------------------------------------------------------------------------------------------
----- Initialize Scripts (Separate Auras)
-------------------------------------------------------------------------------------------------------

-- Flame Shock
SSA.FlameShock:SetScript("OnUpdate", function(self)
	if (Auras:CharacterCheck(1)) then
		local debuff,_,_,_,_,duration,expires,caster = UnitDebuff('target',Auras:GetSpellName(188389));
		--local isGlowActive = false;
	
		
		if (not self.text) then
			self.text = self:CreateFontString(nil, "HIGH", "GameFontHighlightLarge");
			self.text:SetPoint("CENTER",0.5,0.5);
			self.text:SetFont("Interface\\addons\\ShamanAuras\\media\\fonts\\PT_Sans_Narrow.TTF", 18,"OUTLINE");
			self.text:SetTextColor(1,1,0,1);
		end
		
		Auras:ToggleAuraVisibility(self,true,'showhide');
		Auras:SpellRangeCheck(self,188389,true);	
		
		
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1);
			if (debuff and caster == 'player') then
				local timer,seconds = Auras:parseTime(expires - GetTime(),false);
				self.text:SetText(timer);
				
				if (seconds <= Auras.db.char.triggers.ele.flameShock and UnitAffectingCombat('player')) then
					Auras:ToggleOverlayGlow(self.glow,true,true);
					--isGlowActive = true;
				elseif (seconds == 0) then
					self.text:SetText('');
				else
					Auras:ToggleOverlayGlow(self.glow,false);
					--isGlowActive = false;
				end
			else
				self.text:SetText('');
				if (Auras:IsTargetEnemy()) then
					Auras:ToggleOverlayGlow(self.glow,true,true);
					--isGlowActive = true;
				else
					Auras:ToggleOverlayGlow(self.glow,false);
					--isGlowActive = false;
				end
			end
		else
			self:SetAlpha(Auras.db.char.triggers.ele.OoCAlpha)
			--if (isGlowActive) then
			Auras:ToggleOverlayGlow(self.glow,false);
			self.text:SetText('');
				--isGlowActive = false;
			--end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
		Auras:ToggleOverlayGlow(self.glow,false);
	end
end);

-- Earth Shock
SSA.EarthShock:SetScript("OnUpdate", function(self)
	if (Auras:CharacterCheck(1)) then
		local power = UnitPower('player',11);
		
		Auras:ToggleAuraVisibility(self,true,'showhide');
		Auras:SpellRangeCheck(self,8042,true);	
		
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			if (power >= Auras.db.char.triggers.ele.maelstrom) then
				Auras:ToggleOverlayGlow(self.glow,true);
			else
				Auras:ToggleOverlayGlow(self.glow,false);
			end
			if (power >= 10) then
				self:SetAlpha(1);
			else
				self:SetAlpha(0.5);
			end
		else
			self:SetAlpha(Auras.db.char.triggers.ele.OoCAlpha)
			Auras:ToggleOverlayGlow(self.glow,false);
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);	

-- Lava Burst
SSA.LavaBurstEle:SetScript("OnUpdate", function(self)
	if (Auras:CharacterCheck(1)) then
		local buff = UnitBuff('player',Auras:GetSpellName(77762));
		local ascendance = UnitBuff('player',Auras:GetSpellName(114050));
		local start,duration = GetSpellCooldown(Auras:GetSpellName(51505))
		local charges,maxCharges,chgStart,chgDuration = GetSpellCharges(51505)
		local _,_,_,selected = GetTalentInfo(6,3,1);
		
		Auras:ToggleAuraVisibility(self,true,'showhide');
		Auras:SpellRangeCheck(self,51505,true);	
		
		if (selected) then
			if (charges == 2) then
				self.ChargeCD:Hide();
				self.ChargeCD:SetCooldown(0,0);
				--self.Charges.text:SetText(2);
			elseif (charges == 1) then
				self.ChargeCD:Show();
				self.ChargeCD:SetCooldown(chgStart,chgDuration);
				--self.Charges.text:SetText(charges);
			end
			if (charges > 0) then
				self.Charges.text:SetText(charges);
				self.CD.text:SetText('');
				--self.ChargeCD:Show();
			else
				Auras:ExecuteCooldown(self,chgStart,chgDuration,false);
				self.Charges.text:SetText('');
				self.ChargeCD:Hide();
			end
		else
			self.ChargeCD:Hide();
			self.Charges.text:SetText('');
		end
				
		if (UnitAffectingCombat('player')) then
			--[[if (selected) then
				if (buff) then
					Auras:ToggleOverlayGlow(self.glow,true,false);
					self.ChargeCD:Hide();
				else
					Auras:ToggleOverlayGlow(self.glow,false);
					self.ChargeCD:Show();
				end
			else]]
				--self.Charges.text:SetText('');
				if (duration > 2) then
					Auras:ToggleCooldownSwipe(self.CD,true)
					Auras:ToggleOverlayGlow(self.glow,false);
					Auras:ExecuteCooldown(self,start,duration,false);
					self.CD:Show();
				elseif (buff or ascendance) then
					if (buff) then
						Auras:ToggleOverlayGlow(self.glow,true,false);
					else
						Auras:ToggleOverlayGlow(self.glow,false);
					end
					if (ascendance) then
						self.Charges.text:SetText('');
						self.ChargeCD:Hide();
					end
					Auras:ToggleCooldownSwipe(self.CD,false)
					self.CD:Hide();
					self.CD:SetCooldown(0,0);
				else
					Auras:ToggleCooldownSwipe(self.CD,false)
					Auras:ToggleOverlayGlow(self.glow,false);
					self.CD.text:SetText('');
				end
			--end
		end
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1);
		else
			if (buff) then
				Auras:ToggleOverlayGlow(self.glow,false);
			end
			self:SetAlpha(Auras.db.char.triggers.ele.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Earthquake
SSA.Earthquake:SetScript("OnUpdate", function(self)
	if (Auras:CharacterCheck(1)) then
		local buff = UnitBuff('player',Auras:GetSpellName(208723));
		local power = UnitPower('player',11);
		
		Auras:ToggleAuraVisibility(self,true,'showhide');
		
		if (UnitAffectingCombat('player')) then
			self:SetAlpha(1);
			if (buff) then
				Auras:ToggleOverlayGlow(self.glow,true,false);
			else
				Auras:ToggleOverlayGlow(self.glow,false);
			end
			if (power >= 50 or buff) then
				self:SetAlpha(1);
			else
				self:SetAlpha(0.5);
			end
		else
			if (buff) then
				Auras:ToggleOverlayGlow(self.glow,false);
			end
			self:SetAlpha(Auras.db.char.triggers.ele.OoCAlpha)
			Auras:ToggleOverlayGlow(self.glow,false);
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Stormkeeper
SSA.Stormkeeper:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(1)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(205495));
		
		Auras:ToggleAuraVisibility(self,true,'showhide');
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,false);
			self.CD:Show();
		else
			self.CD:Hide();
		end
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1);
		else
			self:SetAlpha(Auras.db.char.triggers.ele.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Earth Elemental
SSA.EarthElemental:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(1)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(198103));
		
		Auras:ToggleAuraVisibility(self,true,'showhide');
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true);
			self.CD:Show();
		else
			self.CD:Hide();
		end
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1);
		else
			self:SetAlpha(Auras.db.char.triggers.ele.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Fire Elemental
SSA.FireElemental:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(1)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(198067));
		
		Auras:ToggleAuraVisibility(self,true,'showhide');
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,false);
			self.CD:Show();
		else
			self.CD:Hide();
		end
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1);
		else
			self:SetAlpha(Auras.db.char.triggers.ele.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Storm Elemental
SSA.StormElemental:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(1)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(192249));
		
		Auras:ToggleAuraVisibility(self,true,'showhide');
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,false);
			self.CD:Show();
		else
			self.CD:Hide();
		end
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1);
		else
			self:SetAlpha(Auras.db.char.triggers.ele.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Ancestral Guidance
SSA.AncestralGuidanceEle:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(1)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(108281));
		
		Auras:ToggleAuraVisibility(self,true,'showhide');
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true);
			self.CD:Show();
		else
			self.CD:Hide();
		end
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1);
		else
			self:SetAlpha(Auras.db.char.triggers.ele.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Ascendance
SSA.AscendanceEle:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(1)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(114050));
		
		Auras:ToggleAuraVisibility(self,true,'showhide');
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,false);
			self.CD:Show();
		else
			self.CD:Hide();
		end
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1);
		else
			self:SetAlpha(Auras.db.char.triggers.ele.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Astral Shift
SSA.AstralShiftEle:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(1)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(108271));
		
		Auras:ToggleAuraVisibility(self,true,'showhide');
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true);
			self.CD:Show();
		else
			self.CD:Hide();
		end
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1);
		else
			self:SetAlpha(Auras.db.char.triggers.ele.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Cleanse Spirit
SSA.CleanseSpiritEle:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(1)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(51886));
		
		Auras:ToggleAuraVisibility(self,true,'showhide');
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true);
			self.CD:Show();
		else
			self.CD:Hide();
		end
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1);
		else
			self:SetAlpha(Auras.db.char.triggers.ele.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Earthgrab Totem
SSA.EarthgrabTotemEle:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(1)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(51485));
		
		Auras:ToggleAuraVisibility(self,true,'showhide');
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true);
			self.CD:Show();
		else
			self.CD:Hide();
		end
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1);
		else
			self:SetAlpha(Auras.db.char.triggers.ele.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Elemental Blast
SSA.ElementalBlast:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(1)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(117014));
		
		Auras:ToggleAuraVisibility(self,true,'showhide');
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,false);
			self.CD:Show();
		else
			self.CD:Hide();
		end
		
		Auras:SpellRangeCheck(self,117014,true);		
		
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1);
		else
			self:SetAlpha(Auras.db.char.triggers.ele.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Elemental Mastery
SSA.ElementalMastery:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(1)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(16166));
		
		Auras:ToggleAuraVisibility(self,true,'showhide');
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,false);
			self.CD:Show();
		else
			self.CD:Hide();
		end
		
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1);
		else
			self:SetAlpha(Auras.db.char.triggers.ele.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Gust of Wind
SSA.GustWindEle:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(1)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(192063));
		
		Auras:ToggleAuraVisibility(self,true,'showhide');
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true);
			self.CD:Show();
		else
			self.CD:Hide();
		end
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1);
		else
			self:SetAlpha(Auras.db.char.triggers.ele.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Hex
SSA.HexEle:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(1)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(51514));
		
		Auras:ToggleAuraVisibility(self,true,'showhide');
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true);
			self.CD:Show();
		else
			self.CD:Hide();
		end
		
		Auras:SpellRangeCheck(self,51514,(UnitCreatureType('target') == "Humanoid" or UnitCreatureType('target') == "Beast" or UnitCreatureType('target') == "Critter"));	
		
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1);
		else
			self:SetAlpha(Auras.db.char.triggers.ele.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Icefury
SSA.Icefury:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(1)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(210714));
		
		Auras:ToggleAuraVisibility(self,true,'showhide');
		Auras:SpellRangeCheck(self,210714,true);	
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,false);
			self.CD:Show();
		else
			self.CD:Hide();
		end
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1);
		else
			self:SetAlpha(Auras.db.char.triggers.ele.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Lightning Surge Totem
SSA.LightningSurgeTotemEle:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(1)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(192058));
		
		Auras:ToggleAuraVisibility(self,true,'showhide');
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true);
			self.CD:Show();
		else
			self.CD:Hide();
		end
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1);
		else
			self:SetAlpha(Auras.db.char.triggers.ele.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Liquid Magma Totem
SSA.LiquidMagmaTotem:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(1)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(192222));
		
		Auras:ToggleAuraVisibility(self,true,'showhide');
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,false);
			self.CD:Show();
		else
			self.CD:Hide();
		end
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1);
		else
			self:SetAlpha(Auras.db.char.triggers.ele.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Thunderstorm
SSA.Thunderstorm:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(1)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(51490));
		
		Auras:ToggleAuraVisibility(self,true,'showhide');
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true);
			self.CD:Show();
		else
			self.CD:Hide();
		end
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1);
		else
			self:SetAlpha(Auras.db.char.triggers.ele.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Voodoo Totem
SSA.VoodooTotemEle:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(1)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(196932));
		
		Auras:ToggleAuraVisibility(self,true,'showhide');
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true);
			self.CD:Show();
		else
			self.CD:Hide();
		end
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1);
		else
			self:SetAlpha(Auras.db.char.triggers.ele.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Wind Shear
SSA.WindShearEle:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(1)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(57994));
		
		Auras:ToggleAuraVisibility(self,true,'showhide');
		Auras:SpellRangeCheck(self,57994,true);
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true);
			self.CD:Show();
		else
			self.CD:Hide();
		end
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1);
		else
			self:SetAlpha(Auras.db.char.triggers.ele.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Wind Rush Totem
SSA.WindRushTotemEle:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(1)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(192077));
		
		Auras:ToggleAuraVisibility(self,true,'showhide');
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true);
			self.CD:Show();
		else
			self.CD:Hide();
		end
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1);
		else
			self:SetAlpha(Auras.db.char.triggers.ele.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-------------------------------------------------------------------------------------------------------
----- Build and Initialize Status Bars
-------------------------------------------------------------------------------------------------------

-- Build Maelstrom Status Bar
local MaelstromBar = CreateFrame("StatusBar","MaelstromBarEle",AuraGroup);

MaelstromBar:SetStatusBarTexture("Interface\\addons\\ShamanAuras\\media\\statusbar\\fifths");
MaelstromBar:GetStatusBarTexture():SetHorizTile(false);
MaelstromBar:GetStatusBarTexture():SetVertTile(false);
MaelstromBar:SetPoint("CENTER",AuraGroup,"CENTER",0,-139);
--MaelstromBar:SetWidth(Auras.db.char.layout[1].maelstromBar.width);
--MaelstromBar:SetHeight(Auras.db.char.layout[1].maelstromBar.height);
MaelstromBar:SetFrameStrata("LOW");
MaelstromBar:SetStatusBarColor(0,0.5,1);
--MaelstromBar:SetUserPlaced(true);
MaelstromBar:Show();
MaelstromBar:SetAlpha(0);

MaelstromBar.bg = MaelstromBar:CreateTexture(nil,"BACKGROUND");
MaelstromBar.bg:SetTexture("Interface\\TargetingFrame\\UI-StatusBar");
MaelstromBar.bg:SetAllPoints(true);
MaelstromBar.bg:SetVertexColor(0,0,0);
MaelstromBar.bg:SetAlpha(0.5);

MaelstromBar.text = MaelstromBar:CreateFontString(nil, "HIGH", "GameFontHighlightLarge");
MaelstromBar.text:SetPoint("CENTER",MaelstromBar,"CENTER",0,0);
MaelstromBar.text:SetFont("Fonts\\FRIZQT__.TTF", 12);
MaelstromBar.text:SetTextColor(1,1,1,1);

--[[SSA.MaelstromBarEleLightning = CreateFrame("PlayerModel","MaelstromBarEleLightning",AuraGroup);
local MaelstromBarLightning = SSA.MaelstromBarEleLightning;
MaelstromBarLightning:SetModel("SPELLS/LIGHTNING_AREA_DISC_STATE.m2");
MaelstromBarLightning:SetFrameStrata("MEDIUM");
MaelstromBarLightning:SetPosition(0,0,-2);
MaelstromBarLightning:SetPoint("CENTER",AuraGroup,"CENTER",0,-139);
MaelstromBarLightning:SetWidth(260);
MaelstromBarLightning:SetHeight(21);
--MaelstromBarLightning:SetAllPoints(MaelstromBar);
MaelstromBarLightning:SetAlpha(0);
MaelstromBarLightning:Show();
local elapsed = 0;
MaelstromBarLightning:HookScript("OnUpdate", function(self, elaps)
	elapsed = elapsed + (elaps * 1000);
	self:SetSequenceTime(1, elapsed);
end);]]
MaelstromBar.Elapsed = 0;
MaelstromBar.Lightning = CreateFrame("PlayerModel","MaelstromBarEleLightning",MaelstromBar);
MaelstromBar.Lightning:SetModel("SPELLS/LIGHTNING_AREA_DISC_STATE.m2");
MaelstromBar.Lightning:SetFrameStrata("MEDIUM");
MaelstromBar.Lightning:SetPosition(0,0,-2);
MaelstromBar.Lightning:SetRotation(0);
--MaelstromBar.Lightning:SetCamera(0);
MaelstromBar.Lightning:SetAllPoints(MaelstromBar);
--MaelstromBarLightning:SetAllPoints(MaelstromBar);
MaelstromBar.Lightning:SetAlpha(0);
MaelstromBar.Lightning:SetSequence(37);

SSA.MaelstromBarEle = MaelstromBar;
SSA.MaelstromBarEle:SetScript("OnUpdate",function(self,elaps)
	local _,_,classIndex = UnitClass('player');
	local spec = GetSpecialization();

	if (classIndex == 7 and spec == 1) then
		local isCombat = UnitAffectingCombat('player');
		local power = UnitPower('player',11);
		local maxPower = UnitPowerMax('player',11);

		self:SetMinMaxValues(0,maxPower);

		--Auras:ToggleAuraVisibility(self,true,'alpha');
		
		if (self:GetWidth() ~= Auras.db.char.layout[1].maelstromBar.width) then
			self:SetWidth(Auras.db.char.layout[1].maelstromBar.width);
		end
		
		if (self:GetHeight() ~= Auras.db.char.layout[1].maelstromBar.height) then
			self:SetHeight(Auras.db.char.layout[1].maelstromBar.height);
		end

		if (not Auras.db.char.layout[1].maelstromBar.isAdjustable and not Auras.db.char.layout[1].isMoving) then
			self:SetValue(power);
			self.text:SetText(power);
			if (isCombat) then
				self:SetAlpha(1);
				if (power >= Auras.db.char.triggers.ele.maelstrom and Auras.db.char.triggers.ele.MaelstromAnim) then
					self.Lightning:SetAlpha(1);
					self.bg:SetAlpha(1);
				else
					self.Lightning:SetAlpha(0);
					self.bg:SetAlpha(0.5);
				end
			elseif (not isCombat and Auras:IsTargetEnemy()) then
				MaelstromBar:SetAlpha(Auras.db.char.triggers.ele.OoCAlpha);
			elseif (not isCombat and not Auras:IsTargetEnemy()) then
				self:SetAlpha(0);
				self.bg:SetAlpha(0);
			end
		elseif (Auras.db.char.layout[1].maelstromBar.isAdjustable or Auras.db.char.layout[1].isMoving) then
			self:SetAlpha(0.5);
		end
	else
		Auras:ToggleAuraVisibility(self,false,'alpha');
	end	
end);

_G["SSA_MaelstromBarEle"] = MaelstromBar;
--MaelstromBar.Lightning:Show();
--[[MaelstromBar.Lightning:SetScript("OnUpdate", function(self, elaps)
	--SSA.ErrorFrame.text:SetText("Elapsed: "..tostring(MaelstromBar.Elapsed));
	MaelstromBar.Elapsed = MaelstromBar.Elapsed + (elaps * 1000);
	self:SetSequenceTime(1, MaelstromBar.Elapsed);
end);]]



-- Build Icefury Status Bar
local IcefuryBar = CreateFrame("StatusBar","IcefuryBar",AuraGroup);
IcefuryBar:SetStatusBarTexture("Interface\\addons\\ShamanAuras\\media\\statusbar\\fourths");
IcefuryBar:GetStatusBarTexture():SetHorizTile(false);
IcefuryBar:GetStatusBarTexture():SetVertTile(false);
IcefuryBar:SetPoint("CENTER",AuraGroup,"CENTER",0,-110);
IcefuryBar:SetFrameStrata("LOW");
IcefuryBar:SetStatusBarColor(0.66,0.49,1);
IcefuryBar:SetMinMaxValues(0,4);
IcefuryBar:SetAlpha(0);
IcefuryBar:Show();

IcefuryBar.bg = IcefuryBar:CreateTexture(nil,"BACKGROUND");
IcefuryBar.bg:SetTexture("Interface\\TargetingFrame\\UI-StatusBar");
IcefuryBar.bg:SetAllPoints(true);
IcefuryBar.bg:SetVertexColor(0,0,0);
IcefuryBar.bg:SetAlpha(0.9);

-- Build Icefury Timer Status Bar
IcefuryBar.Timer = CreateFrame("StatusBar","IcefuryTimer",IcefuryBar);
IcefuryBar.Timer:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar");
IcefuryBar.Timer:GetStatusBarTexture():SetHorizTile(false);
IcefuryBar.Timer:GetStatusBarTexture():SetVertTile(false);
IcefuryBar.Timer:SetWidth(IcefuryBar:GetWidth());
IcefuryBar.Timer:SetHeight(IcefuryBar:GetHeight());
IcefuryBar.Timer:SetFrameStrata("MEDIUM");
IcefuryBar.Timer:SetPoint("CENTER",IcefuryBar,"CENTER",0,0);
IcefuryBar.Timer:SetMinMaxValues(0,15);
IcefuryBar.Timer:SetStatusBarColor(1,1,1,0.35);

IcefuryBar.Timer.text = IcefuryBar.Timer:CreateFontString(nil, "HIGH", "GameFontHighlightLarge");
IcefuryBar.Timer.text:SetPoint("CENTER",IcefuryBar.Timer,"LEFT",25,0);
IcefuryBar.Timer.text:SetFont("Interface\\addons\\ShamanAuras\\Media\\fonts\\Continuum_Medium.ttf", 12);
IcefuryBar.Timer.text:SetTextColor(1,1,1,1);

IcefuryBar:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(1)) then
		local buff,_,_,count,_,_,expires = UnitBuff('player',Auras:GetSpellName(210714));
		
		--Auras:ToggleAuraVisibility(self,true,'alpha');
		
		if (self:GetWidth() ~= Auras.db.char.layout[1].icefuryBar.width) then
			self:SetWidth(Auras.db.char.layout[1].icefuryBar.width);
			self.Timer:SetWidth(self:GetWidth());
		end
		
		if (self:GetHeight() ~= Auras.db.char.layout[1].icefuryBar.height) then
			self:SetHeight(Auras.db.char.layout[1].icefuryBar.height);
			self.Timer:SetHeight(self:GetHeight());
		end
		
		if (not Auras.db.char.layout[1].icefuryBar.isAdjustable and not Auras.db.char.layout[1].isMoving) then
			if (buff) then
				local timer,seconds = Auras:parseTime(expires - GetTime(),false);
				
				self:SetValue(count);
				self.Timer:SetValue(seconds);
				self.Timer.text:SetText(string.format("%.1f",seconds));
					
				if (UnitAffectingCombat('player')) then
					self:SetAlpha(1);
					
				else
					self:SetAlpha(Auras.db.char.triggers.ele.OoCAlpha)
				end
			else
				self:SetAlpha(0);
			end
		elseif (Auras.db.char.layout[1].icefuryBar.isAdjustable or Auras.db.char.layout[1].isMoving) then
			self:SetAlpha(0.5);
		end
	else
		Auras:ToggleAuraVisibility(self,false,'alpha');
	end
end)

SSA.IcefuryBar = IcefuryBar;
_G["SSA_IcefuryBar"] = IcefuryBar;

-- Build Buff Timer Status Bar Group

local BuffTimerBarGrp = CreateFrame("Frame","BuffTimerBarGrpEle",AuraGroup);
BuffTimerBarGrp:SetWidth(115);
BuffTimerBarGrp:SetHeight(180);
BuffTimerBarGrp:SetBackdrop(nil);
BuffTimerBarGrp:Show();
SSA.BuffTimerBarGrpEle = BuffTimerBarGrp;
_G["SSA_BuffTimerGrpEle"] = BuffTimerBarGrp;

-- Build Main Timer Status Bar Group
local MainTimerBarGrp = CreateFrame("Frame","MainTimerBarGrpEle",AuraGroup);
MainTimerBarGrp:SetWidth(90);
MainTimerBarGrp:SetHeight(180);
MainTimerBarGrp:SetBackdrop(nil);
MainTimerBarGrp:Show();
SSA.MainTimerBarGrpEle = MainTimerBarGrp;
_G["SSA_MainTimerBarGrpEle"] = MainTimerBarGrp;

-- Build Utility Timer Status Bar Group
local UtilTimerBarGrp = CreateFrame("Frame","UtilTimerBarGrpEle",AuraGroup);
UtilTimerBarGrp:SetFrameStrata("LOW");
UtilTimerBarGrp:SetWidth(150);
UtilTimerBarGrp:SetHeight(180);
UtilTimerBarGrp:SetBackdrop(nil);
UtilTimerBarGrp:Show();
SSA.UtilTimerBarGrpEle = UtilTimerBarGrp;
_G["SSA_UtilTimerBarGrpEle"] = UtilTimerBarGrp;

-- Build Earthquake Timer Status Bar Group
--[[SSA.EarthquakeBarGrp = CreateFrame("Frame","EarthquakeBarGrp",AuraGroup);
local EarthquakeBarGrp = SSA.EarthquakeBarGrp;
EarthquakeBarGrp:SetWidth(47);
EarthquakeBarGrp:SetHeight(180);
EarthquakeBarGrp:SetBackdrop(nil);
EarthquakeBarGrp:Show();]]
--[[local function BuildTimerBars(name,spellID,barGroup,isAura)
	local object = CreateFrame("StatusBar",name,barGroup)
	object:SetScript("OnUpdate",function(self)
	ele_options.args.ProgressBars.args.BuffTimersBars.args.Bloodlust	
	end);
end]]
--/script local p,rT,rP,x,y = SSA_AncestralGuidanceBarEle:GetPoint();print("P: "..p..", rT: "..rT:GetName()..", rP: "..rP..", X: "..x..", Y: "..y);
-- Build Elemental Vertical Status Bars	
SSA.AncestralGuidanceBarEle = CreateFrame("StatusBar","AncestralGuidanceBarEle",BuffTimerBarGrp);
_G["SSA_AncestralGuidanceBarEle"] = SSA.AncestralGuidanceBarEle
SSA.AscendanceBarEle = CreateFrame("StatusBar","AscendanceBarEle",BuffTimerBarGrp);
_G["SSA_AscendanceBarEle"] = SSA.AscendanceBarEle
SSA.AstralShiftBarEle = CreateFrame("StatusBar","AstralShiftBarEle",BuffTimerBarGrp);
_G["SSA_AstralShiftBarEle"] = SSA.AstralShiftBarEle;
SSA.BloodlustBarEle = CreateFrame("StatusBar","BloodlustBarEle",BuffTimerBarGrp);
_G["SSA_AstralShiftBarEle"] = SSA.AstralShiftBarEle;
SSA.EarthgrabTotemBarEle = CreateFrame("StatusBar","EarthgrabTotemBarEle",MainTimerBarGrp);
_G["SSA_EarthgrabTotemBarEle"] = SSA.EarthgrabTotemBarEle;
--SSA.EarthquakeBarOne = CreateFrame("StatusBar","EarthquakeBarOne",MainTimerBarGrp);
SSA.ElementalBlastCritBar = CreateFrame("StatusBar","ElementalBlastCritBar",BuffTimerBarGrp);
_G["SSA_ElementalBlastCritBar"] = SSA.ElementalBlastCritBar;
SSA.ElementalBlastHasteBar = CreateFrame("StatusBar","ElementalBlastHasteBar",BuffTimerBarGrp);
_G["SSA_ElementalBlastHasteBar"] = SSA.ElementalBlastHasteBar;
SSA.ElementalBlastMasteryBar = CreateFrame("StatusBar","ElementalBlastMasteryBar",BuffTimerBarGrp);
_G["SSA_ElementalBlastMasteryBar"] = SSA.ElementalBlastMasteryBar;
SSA.FireElementalBar = CreateFrame("StatusBar","FireElementalBar",MainTimerBarGrp);
_G["SSA_FireElementalBar"] = SSA.FireElementalBar;
SSA.HeroismBarEle = CreateFrame("StatusBar","HeroismBarEle",BuffTimerBarGrp);
_G["SSA_HeroismBarEle"] = SSA.HeroismBarEle;
SSA.HexBarEle = CreateFrame("StatusBar","HexBarEle",MainTimerBarGrp);
_G["SSA_HexBarEle"] = SSA.HexBarEle
SSA.LiquidMagmaTotemBar = CreateFrame("StatusBar","LiquidMagmaTotemBar",MainTimerBarGrp);
_G["SSA_LiquidMagmaTotemBar"] = SSA.LiquidMagmaTotemBar;
SSA.StormElementalBar = CreateFrame("StatusBar","StormElementalBar",MainTimerBarGrp);
_G["SSA_StormElementalBar"] = SSA.StormElementalBar
SSA.EarthElementalBar = CreateFrame("StatusBar","EarthElementalBar",MainTimerBarGrp);
_G["SSA_EarthElementalBar"] = SSA.EarthElementalBar;
SSA.ElementalMasteryBar = CreateFrame("StatusBar","ElementalMasteryBar",BuffTimerBarGrp);
_G["SSA_ElementalMasteryBar"] = SSA.ElementalMasteryBar;
SSA.TimeWarpBarEle = CreateFrame("StatusBar","TimeWarpBarEle",BuffTimerBarGrp);
_G["SSA_TimeWarpBarEle"] = SSA.TimeWarpBarEle;
SSA.VoodooTotemBarEle = CreateFrame("StatusBar","VoodooTotemBarEle",MainTimerBarGrp);
_G["SSA_VoodooTotemBarEle"] = SSA.VoodooTotemBarEle;
SSA.WindRushTotemBarEle = CreateFrame("StatusBar","WindRushTotemBarEle",MainTimerBarGrp);
_G["SSA_WindRushTotemBarEle"] = SSA.WindRushTotemBarEle;

local buffIDs = {
	[114050] = SSA.AscendanceBarEle,
	[108281] = SSA.AncestralGuidanceBarEle,
	[108271] = SSA.AstralShiftBarEle,
	[2825]   = SSA.BloodlustBarEle,
	[118522] = SSA.ElementalBlastCritBar,
	[173183] = SSA.ElementalBlastHasteBar,
	[173184] = SSA.ElementalBlastMasteryBar,
	[16166]  = SSA.ElementalMasteryBar,
	[32182]  = SSA.HeroismBarEle,
	[80353]  = SSA.TimeWarpBarEle,
}
local mainIDs = {
	[188616] = SSA.EarthElementalBar,
	[118323] = SSA.EarthElementalBar,
	[188592] = SSA.FireElementalBar,
	[118291] = SSA.FireElementalBar,
	[157299] = SSA.StormElementalBar,
	[157319] = SSA.StormElementalBar,
}
local utilIDs = {
	["Earthgrab Totem"]  = SSA.EarthgrabTotemBarEle,
	["Liquid Magma Totem"] = SSA.LiquidMagmaTotemBar,
	["Voodoo Totem"] = SSA.VoodooTotemBarEle,
	["Wind Rush Totem"] = SSA.WindRushTotemBarEle,
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

BuffTimerBarGrp:SetScript("OnUpdate",function(self,event,...)
	if (Auras:CharacterCheck(1)) then
		--SSA.DataFrame.text:SetText('Num Buffs: '..getn(buffTable).."\n\n");
		Auras:ToggleAuraVisibility(self,true,'showhide');
		
		local xPosCtr = 1;
		for i=1,getn(buffTable) do
			local buff,_,_,_,_,duration,expires = UnitBuff('player',Auras:GetSpellName(buffTable[i]));
			SSA.DataFrame.text:SetText(Auras:CurText('DataFrame')..i..". "..tostring(Auras:GetSpellName(buffTable[i])).."\n");
			if (expires) then
				if (Auras.db.char.aura[1][buffIDs[buffTable[i]]:GetName()]) then
					local timer,seconds = Auras:parseTime(expires - GetTime(),true);
					
					buffIDs[buffTable[i]]:SetMinMaxValues(0,duration);
					buffIDs[buffTable[i]]:SetValue(seconds);
					buffIDs[buffTable[i]].timetext:SetText(timer);
					buffIDs[buffTable[i]]:SetPoint("LEFT",xPos[xPosCtr],0);
					buffIDs[buffTable[i]]:Show();
					xPosCtr = xPosCtr + 1;
				else
					buffIDs[buffTable[i]]:Hide();
					--table.remove(buffTable,i);
				end
			end
		end
		
		if (Auras.db.char.layout[1].isMoving) then
			self:SetBackdrop(backdrop);
			self:SetBackdropColor(0,0,0,0.85);
		else
			self:SetBackdrop(nil);
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

MainTimerBarGrp:SetScript("OnUpdate",function(self,event,...)
	if (Auras:CharacterCheck(1)) then
		Auras:ToggleAuraVisibility(self,true,'showhide');
		
		for i=1,getn(mainTable) do
			local expires = (mainStart[i] or 0) + (mainDuration[i] or 0);
			
			local timer,seconds = Auras:parseTime(expires - GetTime(),true);
			
			if (seconds > 0.1) then
				mainIDs[mainTable[i]]:SetMinMaxValues(0,mainDuration[i]);
				mainIDs[mainTable[i]]:SetValue(seconds);
				mainIDs[mainTable[i]].timetext:SetText(timer);
				mainIDs[mainTable[i]]:SetPoint("RIGHT",(xPos[i] * -1),0);
				mainIDs[mainTable[i]]:Show();
			else
				--mainIDs[mainTable[i]]:SetValue(0);
				mainIDs[mainTable[i]]:Hide();
				table.remove(mainTable,i);
				table.remove(mainGUIDs,i);
				table.remove(mainStart,i);
				table.remove(mainDuration,i);
			end
		end
		
		if (Auras.db.char.layout[1].isMoving) then
			self:SetBackdrop(backdrop);
			self:SetBackdropColor(0,0,0,0.85);
		else
			self:SetBackdrop(nil);
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

UtilTimerBarGrp:SetScript("OnUpdate",function(self,event,...)
	if (Auras:CharacterCheck(1)) then
		local totemCtr = 0
		local x
		
		Auras:ToggleAuraVisibility(self,true,'showhide');
		
		for i=1,5 do
			local _,name,start,duration = GetTotemInfo(i);
			
			if ((duration or 0) > 0 and name) then
				local barSuffix = '';
				if (name == "Liquid Magma Totem") then
					barSuffix = "Bar";
				else
					barSuffix = "BarEle";
				end
				
				if (Auras.db.char.aura[1][gsub(name," ",'')..barSuffix]) then
					local timer,seconds = Auras:parseTime((start + duration) - GetTime(),true);
					
					if (utilIDs[name]) then
						totemCtr = totemCtr + 1;
						
						if (getn(mainTable) > 0) then
							x = xOffset[getn(mainTable) + (totemCtr - 1)];
						else
							x = (xPos[totemCtr] * -1);
						end
					
						if (seconds > 0.1) then
							utilIDs[name]:SetMinMaxValues(0,duration);
							utilIDs[name]:SetValue(seconds);
							utilIDs[name].timetext:SetText(timer);
							utilIDs[name]:SetPoint("RIGHT",x,0);
							utilIDs[name]:Show();
						else
							totemCtr = totemCtr - 1;
							utilIDs[name]:SetValue(0);
							utilIDs[name]:Hide();
						end
					end
				else
					if (name and name ~= '' and utilIDs[name]) then
						utilIDs[name]:Hide();
					end
				end
			end
		end
		
		if (Auras.db.char.layout[1].isMoving) then
			self:SetBackdrop(backdrop);
			self:SetBackdropColor(0,0,0,0.85);
		else
			self:SetBackdrop(nil);
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Totem Mastery Notification
local TotemMastery = CreateFrame("Frame","TotemMastery",AuraGroup);
TotemMastery:SetPoint("CENTER",0,-210);
TotemMastery:SetWidth(400);
TotemMastery:SetHeight(180);
TotemMastery:SetFrameStrata("BACKGROUND");
TotemMastery:SetAlpha(0);
TotemMastery:Show();

TotemMastery.texture = TotemMastery:CreateTexture(nil,"LOW");
TotemMastery.texture:SetTexture("Textures\\SpellActivationOverlays\\Echo_of_the_Elements");
TotemMastery.texture:SetPoint("CENTER",TotemMastery,"CENTER",0,0);
TotemMastery.texture:SetWidth(TotemMastery:GetWidth() + 20);
TotemMastery.texture:SetHeight(TotemMastery:GetHeight());
TotemMastery.texture:SetRotation(math.rad(-90));
TotemMastery.texture:SetAlpha(0.7);

-- Animation for Totem Mastery Notification Texture
TotemMastery.Flash = TotemMastery.texture:CreateAnimationGroup();
TotemMastery.Flash:SetLooping("BOUNCE");

TotemMastery.Flash.fadeIn = TotemMastery.Flash:CreateAnimation("Alpha");
TotemMastery.Flash.fadeIn:SetFromAlpha(1);
TotemMastery.Flash.fadeIn:SetToAlpha(0.4);
TotemMastery.Flash.fadeIn:SetDuration(0.4);

TotemMastery.Flash.fadeOut = TotemMastery.Flash:CreateAnimation("Alpha");
TotemMastery.Flash.fadeOut:SetFromAlpha(0.4);
TotemMastery.Flash.fadeOut:SetToAlpha(1);
TotemMastery.Flash.fadeOut:SetDuration(0.4);
TotemMastery.Flash.fadeOut:SetEndDelay(0);

TotemMastery:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(1)) then
		local remaining
		local _,_,_,selected = GetTalentInfo(1,3,1);
		local isTotem,isRefresh = false,false;
		local buff = UnitBuff('player',Auras:GetSpellName(202192));
		local canAttack = UnitCanAttack('player','target');
	
		Auras:ToggleAuraVisibility(self,true,'showhide');
		
		for i=1,5 do
			local _,name = GetTotemInfo(i)

			if (name == "Totem Mastery") then
				local _,_,start,duration = GetTotemInfo(i);
				
				isTotem = true;
				remaining = (start + duration) - GetTime();
				break;
			end
		end

		if ((remaining or 0) <= Auras.db.char.triggers.ele.totemMastery) then
			isRefresh = true;
		end

		if (((not isTotem or isRefresh or not buff) and selected and Auras.db.char.aura[1].TotemMastery and canAttack) or Auras.db.char.layout[1].isMoving) then
			self:SetAlpha(1);
			
			if (not self.Flash:IsPlaying()) then
				self.Flash:Play();
			end
			if (UnitAffectingCombat('player')) then
				self.Flash.fadeOut:SetToAlpha(0.6);
				self.Flash.fadeIn:SetFromAlpha(1);
			else
				self.Flash.fadeOut:SetToAlpha(0.3);
				self.Flash.fadeIn:SetFromAlpha(0.6);
			end
		else
			self:SetAlpha(0);
			
			if (self.Flash:IsPlaying()) then
				self.Flash:Stop();
			end
		end
		
		if (Auras.db.char.layout[1].isMoving) then
			self:SetBackdrop(backdrop);
			self:SetBackdropColor(0,0,0,0.85);
		else
			self:SetBackdrop(nil);
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

SSA.TotemMastery = TotemMastery;
-- Lava Surge Progress Bar/Texture (LEFT)
--[[SSA.LavaSurgeEle = CreateFrame("Frame","LavaSurgeEle",AuraGroup);
local LavaSurge = SSA.LavaSurgeEle;

LavaSurge:SetStatusBarTexture("Textures\\SpellActivationOverlays\\Imp_Empowerment");
LavaSurge:GetStatusBarTexture():SetHorizTile(false);
LavaSurge:GetStatusBarTexture():SetVertTile(false);
LavaSurge:SetOrientation("VERTICAL");
--LavaSurge:SetRotatesTexture(true);
LavaSurge:SetPoint("CENTER",AuraGroup,"CENTER",-130,0);
LavaSurge:SetWidth(116);
LavaSurge:SetHeight(200);
LavaSurge:SetFrameStrata("BACKGROUND");
--LavaSurge:SetStatusBarColor(1,1,1);
LavaSurge:Hide();

LavaSurge.texture = LavaSurge:CreateTexture(nil,"LOW");
LavaSurge.texture:SetTexture("Textures\\SpellActivationOverlays\\Imp_Empowerment");
LavaSurge.texture:SetPoint("CENTER",LavaSurge,"CENTER",0,0);
LavaSurge.texture:SetWidth(LavaSurge:GetWidth() + 20);
LavaSurge.texture:SetHeight(LavaSurge:GetHeight());
--LavaSurge.texture:SetRotation(math.rad(-90));
LavaSurge.texture:SetAlpha(1);

LavaSurge.bg = LavaSurge:CreateTexture(nil,"BACKGROUND");
LavaSurge.bg:SetTexture("Textures\\SpellActivationOverlays\\Imp_Empowerment");
LavaSurge.bg:SetAllPoints(true);
LavaSurge.bg:SetVertexColor(1,1,1);
LavaSurge.bg:SetAlpha(0.5);

LavaSurge.Scaler = LavaSurge:CreateAnimationGroup();
LavaSurge.Scaler:SetLooping("REPEAT");

local scalePush = 1.08;
local scalePull = 1 / scalePush;

LavaSurge.Scaler.scaleOut = LavaSurge.Scaler:CreateAnimation("Scale")
LavaSurge.Scaler.scaleOut:SetOrder(1)
LavaSurge.Scaler.scaleOut:SetDuration(0.5)
LavaSurge.Scaler.scaleOut:SetSmoothing("IN_OUT")
LavaSurge.Scaler.scaleOut:SetFromScale(1,1)
LavaSurge.Scaler.scaleOut:SetToScale(1,scalePush)
 
LavaSurge.Scaler.scaleIn = LavaSurge.Scaler:CreateAnimation("Scale")
LavaSurge.Scaler.scaleIn:SetOrder(2)
LavaSurge.Scaler.scaleIn:SetDuration(0.5)
LavaSurge.Scaler.scaleIn:SetSmoothing("IN_OUT")
LavaSurge.Scaler.scaleIn:SetFromScale(1,1)
LavaSurge.Scaler.scaleIn:SetToScale(1,scalePull)]]
local BackdropCB = SSA.BackdropCB;
local TotemGroup = CreateFrame("Frame","TotemGroupEle",AuraGroup);
TotemGroup:SetFrameLevel(1);
--TotemGroup:SetWidth(150);
--TotemGroup:SetHeight(32);
TotemGroup:SetPoint("CENTER",AuraGroup,"CENTER",-210,0);
TotemGroup:SetBackdrop(BackdropCB);
TotemGroup:SetBackdropColor(0.15,0.15,0.15,0.6);
TotemGroup:SetBackdropBorderColor(1,1,1,1);
TotemGroup:SetAlpha(0);
TotemGroup:Show();

local x = {
	[1] = -80,
	[2] = -40,
	[3] = 0,
	[4] = 40,
	[5] = 80,
}
for i=1,5 do
	TotemGroup["Totem"..i] = CreateFrame("Frame",nil,TotemGroup);
	TotemGroup["Totem"..i]:SetWidth(39);
	TotemGroup["Totem"..i]:SetHeight(39);
	TotemGroup["Totem"..i]:SetPoint("CENTER",TotemGroup,"CENTER",x[i],0);
	TotemGroup["Totem"..i]:Show();

	TotemGroup["Totem"..i].texture = TotemGroup["Totem"..i]:CreateTexture(nil,"BACKGROUND");
	TotemGroup["Totem"..i].texture:SetTexture("Interface\\addons\\ShamanAuras\\Media\\icons\\totems\\cloudburst_totem_bevel");
	TotemGroup["Totem"..i].texture:SetAllPoints(TotemGroup["Totem"..i]);
end
SSA.TotemGroupEle = TotemGroup;
_G["SSA_TotemGroupEle"] = TotemGroup;
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
local buff,count;
local tempX = {
	[1] = {
		[1] = 30,
		[2] = "LEFT",
	},
	[2] = {
		[1] = 0,
		[2] = "CENTER",
	},
	[3] = {
		[1] = -30,
		[2] = "RIGHT",
	},
}
--SSA.StormkeeperChargeGrp = CreateFrame("Frame","StormkeeperChargeGrp",AuraGroup);

local Redraw = function(self)
	if (not self.model_path) then 
		self.model_path = "spells/Monk_chiblast_precast.m2"
	end

	if type(self.model_path) == "number" then
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

--local StormkeeperCharges = SSA.StormkeeperChargeGrp;
local StormkeeperCharges = CreateFrame("Frame","StormkeeperChargeGrp",AuraGroup);
StormkeeperCharges:SetFrameStrata(bg);
StormkeeperCharges:SetWidth(260);
StormkeeperCharges:SetHeight(50);
StormkeeperCharges:SetPoint("CENTER",AuraGroup,"CENTER",0,-110);
StormkeeperCharges:Show();



for i=1,3 do
	StormkeeperCharges["Charge"..i] = CreateFrame("Frame","StormkeeperCharge"..i,StormkeeperCharges);
	StormkeeperCharges["Charge"..i]:SetWidth(100);
	StormkeeperCharges["Charge"..i]:SetHeight(100);
	StormkeeperCharges["Charge"..i]:SetPoint("CENTER",StormkeeperCharges,tempX[i][2],tempX[i][1],-3);
	StormkeeperCharges["Charge"..i]:SetAlpha(0);
	StormkeeperCharges["Charge"..i]:Show();
	
	StormkeeperCharges["Charge"..i].Lightning = CreateFrame("PlayerModel","StormkeeperCharge"..i.."_Lightning",StormkeeperCharges["Charge"..i]);
	StormkeeperCharges["Charge"..i].Lightning:SetModel("spells/Monk_chiblast_precast.m2");
	StormkeeperCharges["Charge"..i].Lightning:SetPosition(0,0,0);
	StormkeeperCharges["Charge"..i].Lightning:SetRotation(0);
	--StormkeeperCharges["Charge"..i].Lightning:SetCamera(0);
	StormkeeperCharges["Charge"..i].Lightning:SetAllPoints(StormkeeperCharges["Charge"..i]);
	StormkeeperCharges["Charge"..i].Lightning:SetAlpha(1);
	StormkeeperCharges["Charge"..i].Lightning:SetSequence(37);
	StormkeeperCharges["Charge"..i].Lightning:SetScript("OnHide", ResetTransformations);
	StormkeeperCharges["Charge"..i].Lightning:SetScript("OnShow", Redraw);
	StormkeeperCharges["Charge"..i].Lightning.Redraw = Redraw;
	StormkeeperCharges["Charge"..i].Lightning.ResetTransformations = ResetTransformations
end
wipe(tempX);

StormkeeperCharges:SetScript("OnUpdate",function(self,elapsed)
	if (Auras:CharacterCheck(1)) then
		buff,_,_,count = UnitBuff('player',Auras:GetSpellName(205495))
		
		Auras:ToggleAuraVisibility(self,true,'showhide');
		--[[if (not self:IsShown()) then
			self:Show();
		end]]
		
		--[[SSA.ErrorFrame.text:SetText("");
		SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Group:    "..self:GetAlpha().." ("..tostring(self:IsShown())..")\n");]]
		if (Auras.db.char.layout[1].isMoving) then
			self.Charge1:SetAlpha(1);
			self.Charge2:SetAlpha(1);
			self.Charge3:SetAlpha(1);
		else
			if (Auras.db.char.aura[1].StormkeeperChargeGrp) then
				if (count == 3) then
					--isStormkeeperActive = true;
					--[[for i=1,3 do
						self["Charge"..i].Lightning:SetModel("spells/Monk_chiblast_precast.m2");
						self["Charge"..i].Lightning:SetModelScale(1);
						self["Charge"..i].Lightning:SetPosition(0,0,0);
					end]]
					--[[SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Charge 1: "..self.Charge1:GetAlpha().." ("..tostring(self.Charge1:IsShown())..")\n");
					SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Charge 2: "..self.Charge2:GetAlpha().." ("..tostring(self.Charge2:IsShown())..")\n");
					SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Charge 3: "..self.Charge3:GetAlpha().." ("..tostring(self.Charge3:IsShown())..")\n\n");]]
					self.Charge1:SetAlpha(1);
					self.Charge2:SetAlpha(1);
					self.Charge3:SetAlpha(1);
				elseif (count == 2) then
					--[[SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Charge 1: "..self.Charge1:GetAlpha().." ("..tostring(self.Charge1:IsShown())..")\n");
					SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Charge 2: "..self.Charge2:GetAlpha().." ("..tostring(self.Charge2:IsShown())..")\n");
					SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Charge 3: "..self.Charge3:GetAlpha().." ("..tostring(self.Charge3:IsShown())..")\n\n");]]
					self.Charge3:SetAlpha(0);
				elseif (count == 1) then
					--[[SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Charge 1: "..self.Charge1:GetAlpha().." ("..tostring(self.Charge1:IsShown())..")\n");
					SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Charge 2: "..self.Charge2:GetAlpha().." ("..tostring(self.Charge2:IsShown())..")\n");
					SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Charge 3: "..self.Charge3:GetAlpha().." ("..tostring(self.Charge3:IsShown())..")\n\n");]]
					self.Charge2:SetAlpha(0);
				elseif (count == 0 or not buff) then
					--[[SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Charge 1: "..self.Charge1:GetAlpha().." ("..tostring(self.Charge1:IsShown())..")\n");
					SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Charge 2: "..self.Charge2:GetAlpha().." ("..tostring(self.Charge2:IsShown())..")\n");
					SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Charge 3: "..self.Charge3:GetAlpha().." ("..tostring(self.Charge3:IsShown())..")\n\n");]]
					
					--if (isStormkeeperActive) then
						self.Charge1:SetAlpha(0);
						self.Charge2:SetAlpha(0);
						self.Charge3:SetAlpha(0);
						--isStormkeeperActive = false;
					--end
				end
			end
		end
		
		if (Auras.db.char.layout[1].isMoving) then
			self:SetBackdrop(backdrop);
			self:SetBackdropColor(0,0,0,0.85);
		else
			self:SetBackdrop(nil);
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
	
	--[[local x1,y1,z1 = self.Charge1.Lightning:GetPosition()
	local worldScale = self.Charge1.Lightning:GetWorldScale();

	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."----- Charge 1 -----\n");
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Camera Facing:   "..string.format("%.4f",self.Charge1.Lightning:GetCameraFacing()).."\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Camera Distance:  "..string.format("%.4f",self.Charge1.Lightning:GetCameraDistance()).."\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Camera Target:    "..string.format("%.4f",self.Charge1.Lightning:GetCameraTarget()).."\n")
	--SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."------------------------------------\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Do Blend:  "..tostring(self.Charge1.Lightning:GetDoBlend()).."\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Facing:    "..tostring(self.Charge1.Lightning:GetFacing()).."\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Fog Color: "..string.format("%.4f",self.Charge1.Lightning:GetFogColor()).."\n")
	--SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."------------------------------------\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Fog Far:   "..tostring(self.Charge1.Lightning:GetFogFar()).."\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Fog Near:  "..tostring(self.Charge1.Lightning:GetFogNear()).."\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Light:     "..tostring(self.Charge1.Lightning:GetLight()).."\n")
	--SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."------------------------------------\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."ModelScale:  "..tostring(self.Charge1.Lightning:GetModelScale()).."\n")
	if (not worldScale) then
		SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."World Scale: error\n")
	else
		SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."World Scale: "..string.format("%.4f",self.Charge1.Lightning:GetWorldScale()).."\n")
	end
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."X: "..x1..", Y: "..y1..", Z: "..z1.."\n\n");
	
	local x2,y2,z2 = self.Charge2.Lightning:GetPosition()
	local worldScale = self.Charge1.Lightning:GetWorldScale();
	
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."----- Charge 2 -----\n");
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Camera Facing:   "..string.format("%.4f",self.Charge2.Lightning:GetCameraFacing()).."\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Camera Distance:  "..string.format("%.4f",self.Charge2.Lightning:GetCameraDistance()).."\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Camera Target:    "..string.format("%.4f",self.Charge2.Lightning:GetCameraTarget()).."\n")
	--SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."------------------------------------\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Do Blend:  "..tostring(self.Charge2.Lightning:GetDoBlend()).."\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Facing:    "..tostring(self.Charge2.Lightning:GetFacing()).."\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Fog Color: "..string.format("%.4f",self.Charge2.Lightning:GetFogColor()).."\n")
	--SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."------------------------------------\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Fog Far:   "..tostring(self.Charge2.Lightning:GetFogFar()).."\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Fog Near:  "..tostring(self.Charge2.Lightning:GetFogNear()).."\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Light:     "..tostring(self.Charge2.Lightning:GetLight()).."\n")
	--SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."------------------------------------\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."ModelScale:  "..tostring(self.Charge2.Lightning:GetModelScale()).."\n")
	if (not worldScale) then
		SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."World Scale: error\n")
	else
		SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."World Scale: "..string.format("%.4f",self.Charge2.Lightning:GetWorldScale()).."\n")
	end
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."X: "..x2..", Y: "..y2..", Z: "..z2.."\n\n");
	
	local x3,y3,z3 = self.Charge3.Lightning:GetPosition()
	local worldScale = self.Charge1.Lightning:GetWorldScale();
	
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."----- Charge 3 -----\n");
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Camera Facing:   "..string.format("%.4f",self.Charge3.Lightning:GetCameraFacing()).."\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Camera Distance:  "..string.format("%.4f",self.Charge3.Lightning:GetCameraDistance()).."\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Camera Target:    "..string.format("%.4f",self.Charge3.Lightning:GetCameraTarget()).."\n")
	--SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."------------------------------------\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Do Blend:  "..tostring(self.Charge3.Lightning:GetDoBlend()).."\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Facing:    "..tostring(self.Charge3.Lightning:GetFacing()).."\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Fog Color: "..string.format("%.4f",self.Charge3.Lightning:GetFogColor()).."\n")
	--SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."------------------------------------\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Fog Far:   "..tostring(self.Charge3.Lightning:GetFogFar()).."\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Fog Near:  "..tostring(self.Charge3.Lightning:GetFogNear()).."\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Light:     "..tostring(self.Charge3.Lightning:GetLight()).."\n")
	--SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."------------------------------------\n")
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."ModelScale: "..tostring(self.Charge3.Lightning:GetModelScale()).."\n")
	if (not worldScale) then
		SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."World Scale: error\n")
	else
		SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."World Scale: "..string.format("%.4f",self.Charge2.Lightning:GetWorldScale()).."\n")
	end
	SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."X: "..x3..", Y: "..y3..", Z: "..z3.."\n\n");]]
end);

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
StormkeeperCharges.Charge2.Lightning:HookScript("OnUpdate", function(self, elaps)
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
StormkeeperCharges.Charge3.Lightning:HookScript("OnUpdate", function(self, elaps)
	elapsed = elapsed + (elaps * 1000);
	self:SetSequenceTime(1, elapsed);
end);]]


SSA.StormkeeperChargeGrp = StormkeeperCharges;
_G["SSA_Stormkeeper"] = StormkeeperCharges;

EventFrame:SetScript("OnEvent",function(self,event,...)
	if (Auras:CharacterCheck(1)) then
		local _,subevent,_,sGUID,source,_,_,petGUID,_,_,_,spellID = ...

		if (event ~= "COMBAT_LOG_EVENT_UNFILTERED") then
			return
		end

		if (sGUID == UnitGUID('player')) then
			if (subevent == "SPELL_AURA_APPLIED") then
				if (buffIDs[spellID]) then
					local isValidBuff = false;

					if ((spellID == 108271 and Auras.db.char.aura[1].AstralShiftBarEle) or (spellID == 114050 and Auras.db.char.aura[1].AscendanceBarEle) or (spellID == 108281 and Auras.db.char.aura[1].AncestralGuidanceBarEle) or (spellID == 2825 and Auras.db.char.aura[1].BloodlustBarEle) or ((spellID == 173183 or spellID == 173184 or spellID == 118522) and Auras.db.char.aura[1].ElementalBlastCritBar) or (spellID == 16166 and Auras.db.char.aura[1].ElementalMasteryBar) or (spellID == 32182 and Auras.db.char.aura[1].HeroismBarEle) or (spellID == 80353 and Auras.db.char.aura[1].TimeWarpBarEle)) then
						isValidBuff = true;
					end
					
					if (isValidBuff) then
						table.insert(buffTable,spellID);
					end
				end
			elseif (subevent == "SPELL_AURA_REMOVED") then
				if (buffIDs[spellID]) then
					for i=1,getn(buffTable) do
						if (buffTable[i] == spellID) then
							table.remove(buffTable,i)
						end
					end
					buffIDs[spellID]:Hide();
				end
			elseif (subevent == "SPELL_SUMMON") then
				if (mainIDs[spellID]) then
					local isValidElemental = false;
					
					if ((spellID == 157319 or spellID == 157299) and Auras.db.char.aura[1].StormElementalBar) then
						isValidElemental = true;
						table.insert(mainDuration,30);
					elseif (((spellID == 118291 or spellID == 188592) and Auras.db.char.aura[1].FireElementalBar) or ((spellID == 118323 or spellID == 188616) and Auras.db.char.aura[1].EarthElementalBar)) then
						isValidElemental = true;
						table.insert(mainDuration,60);
					end
					if (isValidElemental) then
						table.insert(mainTable,spellID);
						table.insert(mainGUIDs,petGUID);
						table.insert(mainStart,GetTime());
					end
				end
			elseif (subevent == "UNIT_DIED") then
				for i=1,getn(mainGUIDs) do
					if (mainGUIDs[i] == petGUID) then
						mainIDs[mainTable[i]]:SetValue(0);
						mainIDs[mainTable[i]]:Hide();
						table.remove(mainTable,i);
						table.remove(mainGUIDs,i);
						table.remove(mainStart,i);
						table.remove(mainDuration,i);
					end
				end
			end
		end
	end
end);
-------------------------------------------------------------------------------------------------------
----- Build Move UI
-------------------------------------------------------------------------------------------------------

-- Initialize Check Button Frames
SSA.MoveEle = CreateFrame("Frame","MoveEle",UIParent);

SSA.AuraObjectsEle = {
	[1] = {
		alpha = nil,
		object = AuraGroup,
		backdrop = 'BackdropSB',
	},
	[2] = {
		alpha = nil,
		object = LargeIconGrpTop,
		backdrop = 'BackdropSB',
	},
	[3] = {
		alpha = nil,
		object = LargeIconGrpBot,
		backdrop = 'BackdropSB',
	},
	[4] = {
		alpha = nil,
		object = SmallIconGrpLeft,
		backdrop = 'BackdropSB',
	},
	[5] = {
		alpha = nil,
		object = SmallIconGrpRight,
		backdrop = 'BackdropSB',
	},
	[6] = {
		alpha = nil,
		object = BuffTimerBarGrp,
		backdrop = 'BackdropSB',
	},
	[7] = {
		alpha = nil,
		object = MainTimerBarGrp,
		backdrop = 'BackdropSB',
	},
	[8] = {
		alpha = nil,
		object = UtilTimerBarGrp,
		backdrop = 'BackdropSB',
	},
	[9] = {
		alpha = true,
		object = MaelstromBar,
		statusbar = {
			r = 0,
			g = 0.5,
			b = 1,
			m = 100,
		},
	},
	[10] = {
		alpha = false,
		object = IcefuryBar,
		statusbar = {
			r = 0.66,
			g = 0.49,
			b = 1,
			m = 4,
		},
	},
	[11] = {
		alpha = false,
		object = TotemMastery,
		backdrop = 'BackdropSB',
	},
	[12] = {
		model = {
			[1] = StormkeeperCharges.Charge1,
			[2] = StormkeeperCharges.Charge2,
			[3] = StormkeeperCharges.Charge3,
		},
		object = StormkeeperChargeGrp,
		backdrop = 'BackdropSB',
	},
}

SSA.MoveStringsEle = {
	[1] = L["Move All Auras"],
	[2] = L["Move Top Auras"],
	[3] = L["Move Bottom Auras"],
	[4] = L["Move Left Auras"],
	[5] = L["Move Right Auras"],
	[6] = L["Move Buff Timer Bars"],
	[7] = L["Move Main Timer Bars"],
	[8] = L["Move Utility Timer Bars"],
	[9] = L["Move Maelstrom Bar"],
	[10] = L["Move Icefury Bar"],
	[11] = L["Move Totem Mastery Alert"],
	--[12] = L["Move Lava Surge Texture"],
	[12] = L["Move Stormkeeper Charges"],
}
