
local FOLDER_NAME, SSA = ...

local L = LibStub("AceLocale-3.0"):GetLocale("ShamanAuras", true)
local Auras = LibStub("AceAddon-3.0"):GetAddon("ShamanAuras")
local AceGUI = LibStub("AceGUI-3.0");

local lgIcon,lgGlow,smIcon,smGlow = 32,45,25,35;
local x,y = 0,0,0;
local bg,low,med,high = "BACKGROUND","LOW","MEDIUM","HIGH"
local buffTable,mainTable,utilTable = {},{},{};
local mainTotems,EST_Expires,EST_GUID = 0;
local secondTotemSlot = 0;
local healTime = 0;

local EventFrame = CreateFrame("Frame");
EventFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");

local backdrop = {
	bgFile   = "Interface\\Tooltips\\UI-Tooltip-Background",
	edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
	tile = true,
	tileSize = 16,
	edgeSize = 10
}

-- Aura Group Builder
local function CreateGroup(name,parent)
	SSA[name] = CreateFrame("Frame",name,parent);
	local Group = SSA[name];
	Group:SetFrameStrata(bg);
	Group:Show();
	
	return Group;
end

-- Aura Icon Builder
local function InitializeFrames(name,parent,icon,iconSize,glowSize,charge)
	
	SSA[name] = CreateFrame("Frame",name,parent);
	local Frame = SSA[name];
	Frame:SetFrameStrata("LOW");
	Frame:SetWidth(iconSize);
	Frame:SetHeight(iconSize);
	Frame:Show();

	Frame.texture = Frame:CreateTexture(nil,"BACKGROUND");
	Frame.texture:SetTexture("Interface\\addons\\ShamanAuras\\media\\ICONS\\"..icon);
	Frame.texture:SetAllPoints(Frame);
	
	Frame.CD = CreateFrame("Cooldown", name.."CD", Frame, "CooldownFrameTemplate");
	Frame.CD:SetAllPoints(Frame);
	
	Frame.CD.text = Frame.CD:CreateFontString(nil, "MEDIUM", "GameFontHighlightLarge");
	Frame.CD.text:SetAllPoints(Frame.CD);
	Frame.CD.text:SetPoint("CENTER",0,0);
	Frame.CD.text:SetTextColor(1,1,0,1);
	
	if (glowSize) then
		--[[SSA[name.."Glow"] = CreateFrame("Frame",name.."Glow",parent);
		local Glow = SSA[name.."Glow"];
		Glow:SetFrameStrata("BACKGROUND");
		Glow:SetWidth(glowSize);
		Glow:SetHeight(glowSize);]]
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

-- Build Restoration Aura Group Containers
AuraGroup = CreateGroup("AuraGroupRes",UIParent);
LargeIconGrpTop = CreateGroup("LargeIconGrpTopRes",AuraGroup);
LargeIconGrpBot = CreateGroup("LargeIconGrpBotRes",AuraGroup);
SmallIconGrpLeft = CreateGroup("SmallIconGrpLeftRes",AuraGroup);
SmallIconGrpRight = CreateGroup("SmallIconGrpRightRes",AuraGroup);

-- Build Large Restoration Icon Frames
InitializeFrames("AscendanceRes",LargeIconGrpBot,"shared\\ascendance",lgIcon);
InitializeFrames("CloudburstTotem",LargeIconGrpTop,"totems\\cloudburst_totem",lgIcon);
InitializeFrames("GiftOfQueen",LargeIconGrpBot,"restoration\\gift_of_the_queen",lgIcon);
InitializeFrames("HealingRain",LargeIconGrpTop,"shared\\healing_rain",lgIcon);
InitializeFrames("HealingStreamTotem",LargeIconGrpTop,"totems\\healing_stream_totem",lgIcon,nil,true);
InitializeFrames("HealingTideTotem",LargeIconGrpBot,"totems\\healing_tide_totem",lgIcon);
InitializeFrames("Riptide",LargeIconGrpTop,"restoration\\riptide",lgIcon,nil,true);
InitializeFrames("SpiritLinkTotem",LargeIconGrpBot,"totems\\spirit_link_totem",lgIcon);
InitializeFrames("UnleashLife",LargeIconGrpTop,"restoration\\unleash_life",lgIcon);
InitializeFrames("Wellspring",LargeIconGrpBot,"restoration\\wellspring",lgIcon);
InitializeFrames("WindRushTotemRes",LargeIconGrpBot,"totems\\wind_rush_totem",lgIcon);

-- Build Small Restoration Icon Frames
InitializeFrames("AncestralGuidanceRes",SmallIconGrpRight,"shared\\ancestral_guidance",smIcon);
InitializeFrames("AstralShiftRes",SmallIconGrpRight,"shared\\astral_shift",smIcon);
InitializeFrames("EarthenShieldTotem",SmallIconGrpLeft,"totems\\earthen_shield_totem",smIcon);
InitializeFrames("EarthgrabTotemRes",SmallIconGrpRight,"totems\\earthgrab_totem",smIcon);
InitializeFrames("FlameShockRes",SmallIconGrpRight,"shared\\flame_shock",smIcon,smGlow);
InitializeFrames("GustWindRes",SmallIconGrpRight,"shared\\gust_of_wind",smIcon);
InitializeFrames("HexRes",SmallIconGrpLeft,"shared\\hex",smIcon);
InitializeFrames("LavaBurstRes",SmallIconGrpRight,"elemental\\lava_burst",smIcon,smGlow,true);
InitializeFrames("LightningSurgeTotemRes",SmallIconGrpRight,"totems\\lightning_surge_totem",smIcon);
InitializeFrames("PurifySpirit",SmallIconGrpLeft,"restoration\\purify_spirit",smIcon);
InitializeFrames("SpiritwalkersGrace",SmallIconGrpLeft,"restoration\\spiritwalkers_grace",smIcon);
InitializeFrames("VoodooTotemRes",SmallIconGrpLeft,"totems\\voodoo_totem",smIcon);
InitializeFrames("WindShearRes",SmallIconGrpLeft,"shared\\wind_shear",smIcon);

-------------------------------------------------------------------------------------------------------
----- Initialize Scripts (Aura Groups)
-------------------------------------------------------------------------------------------------------

AuraGroup:SetScript("OnUpdate",function(self,button)
	if (Auras.db.char.layout[3].isMoving) then
		self:SetBackdrop(backdrop);
		self:SetBackdropColor(0,0,0,0.5);
	else
		self:SetBackdrop(nil);
	end
end);

AuraGroup:SetScript("OnMouseDown",function(self,button)
	if (Auras.db.char.layout[3].isMoving) then
		Auras:MoveOnMouseDown(self,'resGrp',button);
	end
end);

AuraGroup:SetScript("OnMouseUp",function(self,button)
	if (Auras.db.char.layout[3].isMoving) then
		Auras:MoveOnMouseUp(self,'resGrp',button);
	end
end);

LargeIconGrpTop:SetScript("OnUpdate",function(self,button)
	if (Auras.db.char.layout[3].isMoving) then
		self:SetBackdrop(backdrop);
		self:SetBackdropColor(0,0,0,0.85);
	else
		self:SetBackdrop(nil);
	end
end);

LargeIconGrpTop:SetScript("OnMouseDown",function(self,button)
	if (Auras.db.char.layout[3].isMoving) then
		Auras:MoveOnMouseDown(self,'resGrp',button);
	end
end);

LargeIconGrpTop:SetScript("OnMouseUp",function(self,button)
	if (Auras.db.char.layout[3].isMoving) then
		Auras:MoveOnMouseUp(self,'resGrp',button);
	end
end);

LargeIconGrpBot:SetScript("OnUpdate",function(self,button)
	if (Auras.db.char.layout[3].isMoving) then
		self:SetBackdrop(backdrop);
		self:SetBackdropColor(0,0,0,0.85);
	else
		self:SetBackdrop(nil);
	end
end);

LargeIconGrpBot:SetScript("OnMouseDown",function(self,button)
	if (Auras.db.char.layout[3].isMoving) then
		Auras:MoveOnMouseDown(self,'resGrp',button);
	end
end);

LargeIconGrpBot:SetScript("OnMouseUp",function(self,button)
	if (Auras.db.char.layout[3].isMoving) then
		Auras:MoveOnMouseUp(self,'resGrp',button);
	end
end);

SmallIconGrpLeft:SetScript("OnUpdate",function(self,button)
	if (Auras.db.char.layout[3].isMoving) then
		self:SetBackdrop(backdrop);
		self:SetBackdropColor(0,0,0,0.85);
	else
		self:SetBackdrop(nil);
	end
end);

SmallIconGrpLeft:SetScript("OnMouseDown",function(self,button)
	if (Auras.db.char.layout[3].isMoving) then
		Auras:MoveOnMouseDown(self,'resGrp',button);
	end
end);

SmallIconGrpLeft:SetScript("OnMouseUp",function(self,button)
	if (Auras.db.char.layout[3].isMoving) then
		Auras:MoveOnMouseUp(self,'resGrp',button);
	end
end);

SmallIconGrpRight:SetScript("OnUpdate",function(self,button)
	if (Auras.db.char.layout[3].isMoving) then
		self:SetBackdrop(backdrop);
		self:SetBackdropColor(0,0,0,0.85);
	else
		self:SetBackdrop(nil);
	end
end);

SmallIconGrpRight:SetScript("OnMouseDown",function(self,button)
	if (Auras.db.char.layout[3].isMoving) then
		Auras:MoveOnMouseDown(self,'resGrp',button);
	end
end);

SmallIconGrpRight:SetScript("OnMouseUp",function(self,button)
	if (Auras.db.char.layout[3].isMoving) then
		Auras:MoveOnMouseUp(self,'resGrp',button);
	end
end);

-------------------------------------------------------------------------------------------------------
----- Initialize Scripts (Separate Auras)
-------------------------------------------------------------------------------------------------------

-- Flame Shock
SSA.FlameShockRes:SetScript("OnUpdate", function(self)
	if (Auras:CharacterCheck(3)) then
		local debuff,_,_,_,_,_,expires,caster = UnitDebuff('target',Auras:GetSpellName(188838));
		local start,duration = GetSpellCooldown(Auras:GetSpellName(188838));
		local timer,seconds
		
		if (not self.text) then
			self.text = self:CreateFontString(nil, "HIGH", "GameFontHighlightLarge");
			self.text:SetPoint("CENTER",0.5,0.5);
			self.text:SetFont("Interface\\addons\\ShamanAuras\\media\\fonts\\PT_Sans_Narrow.TTF", 16,"OUTLINE");
			self.text:SetTextColor(1,1,0,1);
		end
	
		Auras:SpellRangeCheck(self,188838,true);
		Auras:ToggleAuraVisibility(self,true,'showhide');
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true,true);
			--timer,seconds = Auras:parseTime((start + duration) - GetTime(),false);
			--self.text:SetText(timer);
		end
		
		if (expires) then
			timer,seconds = Auras:parseTime(expires - GetTime(),false);
		end
		
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1);
			if (debuff and caster == 'player') then
				--timer,seconds = Auras:parseTime(expires - GetTime(),false);
				--self.text:SetText(timer);
				
				if ((seconds or 0) <= Auras.db.char.triggers.res.flameShock and UnitAffectingCombat('player')) then
					Auras:ToggleOverlayGlow(self.glow,true,true);
					--isGlowActive = true;
				--elseif (seconds == 0) then
					--self.text:SetText('');
				else
					Auras:ToggleOverlayGlow(self.glow,false);
					--isGlowActive = false;
				end
				--[[if (seconds == 0) then
					self.text:SetText('');
				else
					self.text:SetText(timer);
				end]]
			else
				--self.text:SetText('');
				if (Auras:IsTargetEnemy()) then
					Auras:ToggleOverlayGlow(self.glow,	true,true);
				else
					Auras:ToggleOverlayGlow(self.glow,false);
				end
			end
		else
			self:SetAlpha(Auras.db.char.triggers.res.OoCAlpha)
			Auras:ToggleOverlayGlow(self.glow,false);
			--self.text:SetText('');
		end
		
		if ((seconds or 0) >= 0.1) then
			self.text:SetText(timer)
		else
			self.text:SetText('')
		end
		--[[if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1);
		else
			self:SetAlpha(Auras.db.char.triggers.ele.OoCAlpha)
		end]]
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Lava Burst
SSA.LavaBurstRes:SetScript("OnUpdate", function(self)
	if (Auras:CharacterCheck(3)) then
		local buff = UnitBuff('player',Auras:GetSpellName(77762));
		local start,duration = GetSpellCooldown(Auras:GetSpellName(51505))
		local charges,maxCharges,chgStart,chgDuration = GetSpellCharges(51505)
		local _,_,_,selected = GetTalentInfo(6,3,1);
		
		Auras:SpellRangeCheck(self,51505,true);	
		Auras:ToggleAuraVisibility(self,true,'showhide');
		
		if (selected) then
			if (charges == 2) then
				self.ChargeCD:Hide();
				self.ChargeCD:SetCooldown(0,0);
				self.Charges.text:SetText(2);
			elseif (charges < 2) then
				self.ChargeCD:Show();
				self.ChargeCD:SetCooldown(chgStart,chgDuration);
				self.Charges.text:SetText(charges);
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
		end
		
		if (UnitAffectingCombat('player')) then
			if (duration > 2) then
				--Auras:ToggleCooldownSwipe(self.CD,true)
				Auras:ToggleOverlayGlow(self.glow,false);
				Auras:ExecuteCooldown(self,start,duration,false);
				self.CD:Show();
			elseif (buff) then
				Auras:ToggleCooldownSwipe(self.CD,false)
				Auras:ToggleOverlayGlow(self.glow,true,false);
				self.CD:Hide();
				self.CD:SetCooldown(0,0);
				Auras:ToggleOverlayGlow(self.glow,true,false);
			else
				Auras:ToggleCooldownSwipe(self.CD,false)
				Auras:ToggleOverlayGlow(self.glow,false);
				self.CD:Hide();
			end
		end
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1);
		else
			if (buff) then
				Auras:ToggleOverlayGlow(self.glow,false);
			end
			self:SetAlpha(Auras.db.char.triggers.res.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Ancestral Guidance
SSA.AncestralGuidanceRes:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(3)) then
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
			self:SetAlpha(Auras.db.char.triggers.res.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Ascendance
SSA.AscendanceRes:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(3)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(114052));
	
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
			self:SetAlpha(Auras.db.char.triggers.res.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Astral Shift
SSA.AstralShiftRes:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(3)) then
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
			self:SetAlpha(Auras.db.char.triggers.res.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Cloudburst Totem
SSA.CloudburstTotem:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(3)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(157153));
	
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
			self:SetAlpha(Auras.db.char.triggers.res.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Earthen Shield Totem
SSA.EarthenShieldTotem:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(3)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(198838));
	
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
			self:SetAlpha(Auras.db.char.triggers.res.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Earthgrab Totem
SSA.EarthgrabTotemRes:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(3)) then
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
			self:SetAlpha(Auras.db.char.triggers.res.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Gift of the Queen
SSA.GiftOfQueen:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(3)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(207778));
	
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
			self:SetAlpha(Auras.db.char.triggers.res.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Gust of Wind
SSA.GustWindRes:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(3)) then
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
			self:SetAlpha(Auras.db.char.triggers.res.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Healing Rain
SSA.HealingRain:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(3)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(73920));
		
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
			self:SetAlpha(Auras.db.char.triggers.res.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Healing Stream Totem
SSA.HealingStreamTotem:SetScript("OnUpdate", function(self)
	if (Auras:CharacterCheck(3)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(5394))
		local charges,maxCharges,chgStart,chgDuration = GetSpellCharges(5394)
		local _,_,_,selected = GetTalentInfo(6,3,1);

		Auras:ToggleAuraVisibility(self,true,'showhide');
		
		if (selected) then
			if (charges == 2) then
				self.ChargeCD:Hide();
				self.ChargeCD:SetCooldown(0,0);
			elseif (charges < 2) then
				self.ChargeCD:Show();
				self.ChargeCD:SetCooldown(chgStart,chgDuration);
			end
			if (charges > 0) then
				self.Charges.text:SetText(charges);
				self.CD.text:SetText('');
			else
				Auras:ExecuteCooldown(self,chgStart,chgDuration,false);
				self.Charges.text:SetText('');
			end
		else
			self.Charges.text:SetText('');
			if ((duration or 0) > 2 and not buff) then
				Auras:ToggleCooldownSwipe(self.CD,true)
				Auras:ExecuteCooldown(self,start,duration,false);
				self.CD:Show();
			else
				Auras:ToggleCooldownSwipe(self.CD,true)
				self.CD:Hide();
			end
		end
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1);
		else
			self:SetAlpha(Auras.db.char.triggers.res.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Healing Tide Totem
SSA.HealingTideTotem:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(3)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(108280));
	
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
			self:SetAlpha(Auras.db.char.triggers.res.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Hex
SSA.HexRes:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(3)) then
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
			self:SetAlpha(Auras.db.char.triggers.res.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Lightning Surge Totem
SSA.LightningSurgeTotemRes:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(3)) then
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
			self:SetAlpha(Auras.db.char.triggers.res.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Purify Spirit
SSA.PurifySpirit:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(3)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(77130));
	
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
			self:SetAlpha(Auras.db.char.triggers.res.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Riptide
SSA.Riptide:SetScript("OnUpdate", function(self)
	if (Auras:CharacterCheck(3)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(61295))
		local charges,maxCharges,chgStart,chgDuration = GetSpellCharges(61295)
		local _,_,_,selected = GetTalentInfo(6,3,1);
	
		Auras:ToggleAuraVisibility(self,true,'showhide');
		
		if (selected) then
			if (charges == 2) then
				self.ChargeCD:Hide();
				self.ChargeCD:SetCooldown(0,0);
			elseif (charges < 2) then
				self.ChargeCD:Show();
				self.ChargeCD:SetCooldown(chgStart,chgDuration);
			end
			if (charges > 0) then
				self.Charges.text:SetText(charges);
				self.CD.text:SetText('');
			else
				Auras:ExecuteCooldown(self,chgStart,chgDuration,false);
				self.Charges.text:SetText('');
			end
		else
			self.Charges.text:SetText('');
			if ((duration or 0) > 2 and not buff) then
				Auras:ToggleCooldownSwipe(self.CD,true)
				Auras:ExecuteCooldown(self,start,duration,false);
				self.CD:Show();
			else
				Auras:ToggleCooldownSwipe(self.CD,true)
				self.CD:Hide();
			end
		end
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1);
		else
			self:SetAlpha(Auras.db.char.triggers.res.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Spirit Link Totem
SSA.SpiritLinkTotem:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(3)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(98008));
	
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
			self:SetAlpha(Auras.db.char.triggers.res.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Spiritwalker's Grace
SSA.SpiritwalkersGrace:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(3)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(79206));
	
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
			self:SetAlpha(Auras.db.char.triggers.res.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Unleash Life
SSA.UnleashLife:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(3)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(73685));
	
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
			self:SetAlpha(Auras.db.char.triggers.res.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Voodoo Totem
SSA.VoodooTotemRes:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(3)) then
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
			self:SetAlpha(Auras.db.char.triggers.res.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Wellspring
SSA.Wellspring:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(3)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(197995));
	
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
			self:SetAlpha(Auras.db.char.triggers.res.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Wind Shear
SSA.WindShearRes:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(3)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(57994));
	
		Auras:SpellRangeCheck(self,57994,true);
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
			self:SetAlpha(Auras.db.char.triggers.res.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Wind Rush Totem
SSA.WindRushTotemRes:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(3)) then
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
			self:SetAlpha(Auras.db.char.triggers.res.OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-------------------------------------------------------------------------------------------------------
----- Build and Initialize Status Bars
-------------------------------------------------------------------------------------------------------

local function SetTidalWavesAnimationState(self,isAnimate,isShown,count,color)
	if (isAnimate and isShown and not count) then
		self:SetValue(2);
		self:SetStatusBarColor(color.r,color.g,color.b);
			
		if (not self.Flash:IsPlaying()) then
			self.Flash:Play();
		end
	elseif (not isAnimate or not isShown or count > 0) then
		if (self.Flash:IsPlaying()) then
			self.Flash:Stop();
		end
		if (not isShown) then
			self:SetAlpha(0);
		else
			self:SetAlpha(1);
		end
		self:SetStatusBarColor(0.35,0.76,1);
		self:SetValue(count or 0);
			
		--self:SetAlpha(1);
	end
	
	--[[if (not count) then
			self:SetValue(2);
			self:SetStatusBarColor(color.r,color.g,color.b);
			
			if (isAnimate) then
				if (not self.Flash:IsPlaying()) then
					self.Flash:Play();
				end
			else
				if (self.Flash:IsPlaying()) then
					self.Flash:Stop();
				end
				--self:SetAlpha(1);
			end
		else
			if (self.Flash:IsPlaying()) then
				self.Flash:Stop();
			end
			self:SetStatusBarColor(0.35,0.76,1);
			self:SetValue(count or 0);
		end]]
end

local function ToggleAlpha(self,value)
	if (self:GetAlpha() ~= value) then
		self:SetAlpha(value);
	end
end
-- Build Tidal Waves Status Bar
local TidalWavesBar = CreateFrame("StatusBar","TidalWavesBar",AuraGroup);
TidalWavesBar:SetStatusBarTexture("Interface\\addons\\ShamanAuras\\media\\statusbar\\halvess");
TidalWavesBar:GetStatusBarTexture():SetHorizTile(false);
TidalWavesBar:GetStatusBarTexture():SetVertTile(false);
TidalWavesBar:SetPoint("CENTER",AuraGroup,"CENTER",0,-202);
--TidalWavesBar:SetWidth(225);
--TidalWavesBar:SetHeight(7);
TidalWavesBar:SetMinMaxValues(0,2);
TidalWavesBar:SetFrameStrata("LOW");
TidalWavesBar:SetStatusBarColor(0.35,0.76,1);
TidalWavesBar:SetAlpha(0);
TidalWavesBar:Show();

TidalWavesBar.bg = TidalWavesBar:CreateTexture(nil,"BACKGROUND");
TidalWavesBar.bg:SetTexture("Interface\\TargetingFrame\\UI-StatusBar");
TidalWavesBar.bg:SetAllPoints(true);
TidalWavesBar.bg:SetVertexColor(0,0,0);
TidalWavesBar.bg:SetAlpha(0.65);

-- Animation for Tidal Waves Status Bar
TidalWavesBar.Flash = TidalWavesBar:CreateAnimationGroup();
TidalWavesBar.Flash:SetLooping("BOUNCE");

TidalWavesBar.Flash.fadeIn = TidalWavesBar.Flash:CreateAnimation("Alpha");
TidalWavesBar.Flash.fadeIn:SetFromAlpha(1);
TidalWavesBar.Flash.fadeIn:SetToAlpha(0.25);
TidalWavesBar.Flash.fadeIn:SetDuration(0.33);

TidalWavesBar.Flash.fadeOut = TidalWavesBar.Flash:CreateAnimation("Alpha");
TidalWavesBar.Flash.fadeOut:SetFromAlpha(0.25);
TidalWavesBar.Flash.fadeOut:SetToAlpha(1);
TidalWavesBar.Flash.fadeOut:SetDuration(0.33);
TidalWavesBar.Flash.fadeOut:SetEndDelay(0);

TidalWavesBar:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(3)) then
		local buff,_,_,count,_,duration,expires = UnitBuff('player',Auras:GetSpellName(53390));
		local color = Auras.db.char.layout[3].tidalWavesBar.emptyColor;
		local isAnimate = Auras.db.char.triggers.res.animTidalWaves;
		local combatDisplay = Auras.db.char.triggers.res.CombatTidalWaveDisplay;
		local OoCDisplay = Auras.db.char.triggers.res.OoCTidalWaveDisplay;
		local remaining,progress
		
		if (buff) then
			remaining = expires - GetTime();
			progress = 15 - remaining;
		end
		--[[local elapsed,isVisible = 0,false;
		
		if (healTime > 0) then
			elapsed = GetTime() - healTime;
			
			if (elapsed <= Auras.db.char.triggers.res.TidalWaveTime) then
				isVisible = true;
			else
				healTime = 0;
			end
		else
			isVisible = false;
		end]]
		--Auras:ToggleAuraVisibility(self,true,'showhide');
		
		self:SetWidth(Auras.db.char.layout[3].tidalWavesBar.width);
		self:SetHeight(Auras.db.char.layout[3].tidalWavesBar.height);
		
		if (Auras.db.char.aura[3].TidalWavesBar) then
			if (not Auras.db.char.layout[3].isMoving) then
				if (UnitAffectingCombat('player')) then
					if (Auras:IsTargetFriendly()) then
						if (combatDisplay == "Never" or combatDisplay == "On Heal Only") then
							--self:SetAlpha(0);
							SetTidalWavesAnimationState(self,isAnimate,false,count,color)
						else
							--self:SetAlpha(1);
							SetTidalWavesAnimationState(self,isAnimate,true,count,color)
						end
					else
						if (combatDisplay == "Target Only") then
							--self:SetAlpha(0);
							SetTidalWavesAnimationState(self,isAnimate,false,count,color)
						else
							if (combatDisplay == "Always") then
								--self:SetAlpha(1);
								SetTidalWavesAnimationState(self,isAnimate,true,count,color)
							elseif (combatDisplay == "Never") then
								SetTidalWavesAnimationState(self,isAnimate,false,count,color)
							elseif (combatDisplay == "Target & On Heal" or combatDisplay == "On Heal Only") then
								if ((progress or 0) <= Auras.db.char.triggers.res.TidalWaveTime and (progress or 0) ~= 0) then
									SetTidalWavesAnimationState(self,isAnimate,true,count,color)
								else
									SetTidalWavesAnimationState(self,isAnimate,false,count,color)
								end
							end
						end
					end
					--self:SetAlpha(1);
				else
					if (Auras:IsTargetFriendly()) then
						if (OoCDisplay == "Never" or OoCDisplay == "On Heal Only") then
							--ToggleAlpha(self,0);
							SetTidalWavesAnimationState(self,isAnimate,false,count,color)
						else
							--ToggleAlpha(self,1);
							SetTidalWavesAnimationState(self,isAnimate,true,count,color)
						end
					else
						if (OoCDisplay == "Target Only") then
							--print("Target Only");
							--self:SetAlpha(0);
							SetTidalWavesAnimationState(self,isAnimate,false,count,color);
							--ToggleAlpha(self,0);
						else
							if (OoCDisplay == "Always") then
								SetTidalWavesAnimationState(self,isAnimate,true,count,color);
								--ToggleAlpha(self,1);
							elseif (OoCDisplay == "Never") then
								SetTidalWavesAnimationState(self,isAnimate,false,count,color)
								--ToggleAlpha(self,0);
							elseif (OoCDisplay == "Target & On Heal" or OoCDisplay == "On Heal Only") then
								if ((progress or 0) <= Auras.db.char.triggers.res.TidalWaveTime and (progress or 0) ~= 0) then
									--ToggleAlpha(self,1);
									--print("On: "..tostring((progress or 0).." - "..Auras.db.char.triggers.res.TidalWaveTime));
									SetTidalWavesAnimationState(self,isAnimate,true,count,color)
								else
									--ToggleAlpha(self,0);
									--print("Off: "..tostring((progress or 0).." - "..Auras.db.char.triggers.res.TidalWaveTime));
									SetTidalWavesAnimationState(self,isAnimate,false,count,color)
								end
							end
						end
					end	
				end
			else
				if (self.Flash:IsPlaying()) then
					self.Flash:Stop();
				end
				self:SetAlpha(1);
			end
		else
			if (self.Flash:IsPlaying()) then
				self.Flash:Stop();
			end
			self:SetAlpha(0);
		end
	else
		if (self.Flash:IsPlaying()) then
			self.Flash:Stop();
		end
		self:SetAlpha(0);
	end
end);

TidalWavesBar:SetScript("OnMouseDown",function(self,button)
	if (Auras.db.char.layout[3].isMoving) then
		Auras:MoveOnMouseDown(self,'resGrp',button);
	end
end);

TidalWavesBar:SetScript("OnMouseUp",function(self,button)
	if (Auras.db.char.layout[3].isMoving) then
		Auras:MoveOnMouseUp(self,'resGrp',button);
	end
end);

SSA.TidalWavesBar = TidalWavesBar;
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
local BackdropCB = SSA.BackdropCB;
local BackdropCBInner = {
	bgFile    = "Interface\\AddOns\\ShamanAuras\\media\\icons\\totems\\cloudburst_totem", 
	edgeFile  = "Interface\\AddOns\\ShamanAuras\\media\\textures\\tooltip_border",
	tile      = false,
	tileSize  = 16, 
	edgeSize  = 16,
}
--[[SSA.Cloudburst = CreateFrame("Frame","Cloudburst",AuraGroup);
_G["SSA_Cloudburst"] = SSA.Cloudburst;
local Cloudburst = SSA.Cloudburst;]]
local absorbed,duration,name
local Cloudburst = CreateFrame("Frame","Cloudburst",AuraGroup);
Cloudburst:SetFrameLevel(1);
--Cloudburst:SetWidth(150);
--Cloudburst:SetHeight(32);
Cloudburst:SetPoint("CENTER",AuraGroup,"CENTER",-200,0);
Cloudburst:SetBackdrop(BackdropCB);
Cloudburst:SetBackdropColor(0.15,0.15,0.15,0.6);
Cloudburst:SetBackdropBorderColor(1,1,1,1);
Cloudburst:SetAlpha(0);
Cloudburst:Show();

Cloudburst.text = Cloudburst:CreateFontString(nil, "MEDIUM", "GameFontHighlightLarge");
Cloudburst.text:SetPoint("RIGHT",Cloudburst,"RIGHT",-5,-1);
--Cloudburst.text:SetPoint("CENTER",0,0);
Cloudburst.text:SetTextColor(0,1,0,1);
Cloudburst.text:SetFont("Fonts\\FRIZQT__.TTF",22,"OUTLINE");
Cloudburst.text:SetJustifyH("LEFT");
Cloudburst.text:SetText('0');
--[[Cloudburst.inner = CreateFrame("Frame",nil,Cloudburst);
Cloudburst.inner:SetPoint("TOPLEFT",Cloudburst,"TOPLEFT",8,-8);
Cloudburst.inner:SetPoint("BOTTOMRIGHT",Cloudburst,"BOTTOMRIGHT",-8,8);
Cloudburst.inner:SetBackdrop(BackdropCBInner);
Cloudburst.inner:SetBackdropColor(0.15,0.8,1,0);
Cloudburst.inner:SetBackdropBorderColor(1,1,1,1);]]

Cloudburst.icon = CreateFrame("Frame",nil,Cloudburst);
Cloudburst:SetFrameLevel(2);
Cloudburst.icon:SetWidth(40);
Cloudburst.icon:SetHeight(40);
Cloudburst.icon:SetPoint("LEFT",Cloudburst,"LEFT",0,0);
Cloudburst.icon:SetBackdrop(BackdropCB);
Cloudburst.icon:SetBackdropColor(1,1,1,0);
Cloudburst.icon:SetBackdropBorderColor(1,1,1,1);

Cloudburst.icon.texture = Cloudburst.icon:CreateTexture(nil,"BACKGROUND");
Cloudburst.icon.texture:SetTexture("Interface\\addons\\ShamanAuras\\Media\\icons\\totems\\cloudburst_totem_bevel");
Cloudburst.icon.texture:SetAllPoints(Cloudburst.icon);

Cloudburst.icon.text = Cloudburst.icon:CreateFontString(nil, "MEDIUM", "GameFontHighlightLarge");
Cloudburst.icon.text:SetAllPoints(Cloudburst.icon);
Cloudburst.icon.text:SetPoint("CENTER",0,0);
Cloudburst.icon.text:SetTextColor(1,1,0,1);
Cloudburst.icon.text:SetFont("Interface\\addons\\ShamanAuras\\media\\fonts\\PT_Sans_Narrow.TTF", 16,"OUTLINE");
	
Cloudburst:SetScript("OnUpdate",function(self,elapsed)
	if (Auras:CharacterCheck(3)) then
		_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,absorbed = UnitBuff('player',Auras:GetSpellName(157153));
	
		Auras:ToggleAuraVisibility(self,true,'showhide');
	
		if (not self:IsShown()) then
			self:Show();
		end
		
		for i=1,5 do
			_,name = GetTotemInfo(i);
			if (name == "Cloudburst Totem") then
				duration = GetTotemTimeLeft(i);
			end
		end

		if (not Auras.db.char.layout[3].isMoving) then
			if (absorbed and Auras.db.char.aura[3].CloudburstAbsorbBar) then
				self.icon.text:SetText(duration);
				self:SetAlpha(1);
				self.text:SetText(absorbed);
			else
				self:SetAlpha(0);
				self.text:SetText('0');
				SSA.CloudburstTotemBar:Hide();
			end
		else
			self:SetAlpha(1);
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

Cloudburst:SetScript("OnMouseDown",function(self,button)
	if (Auras.db.char.layout[3].isMoving) then
		Auras:MoveOnMouseDown(self,'resGrp',button);
	end
end);

Cloudburst:SetScript("OnMouseUp",function(self,button)
	if (Auras.db.char.layout[3].isMoving) then
		Auras:MoveOnMouseUp(self,'resGrp',button);
	end
end);

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


local EarthenShieldTotemBar = CreateFrame("StatusBar","EarthenShieldTotemBar",AuraGroup);
_G["SSA_EarthenShield"] = EarthenShieldTotemBar;
EarthenShieldTotemBar:SetStatusBarTexture("Interface\\addons\\ShamanAuras\\media\\statusbar\\fifths");
EarthenShieldTotemBar:GetStatusBarTexture():SetHorizTile(false);
EarthenShieldTotemBar:GetStatusBarTexture():SetVertTile(false);
EarthenShieldTotemBar:SetPoint("CENTER",AuraGroup,"CENTER",0,-139);
--EarthenShieldTotemBar:SetWidth(260);
--EarthenShieldTotemBar:SetHeight(18);
EarthenShieldTotemBar:SetFrameStrata("LOW");
EarthenShieldTotemBar:SetStatusBarColor(0.91,0.41,1);
EarthenShieldTotemBar:Show();
EarthenShieldTotemBar:SetAlpha(0);

EarthenShieldTotemBar.bg = EarthenShieldTotemBar:CreateTexture(nil,"BACKGROUND");
EarthenShieldTotemBar.bg:SetTexture("Interface\\TargetingFrame\\UI-StatusBar");
EarthenShieldTotemBar.bg:SetAllPoints(true);
EarthenShieldTotemBar.bg:SetVertexColor(0,0,0);
EarthenShieldTotemBar.bg:SetAlpha(0.5);

EarthenShieldTotemBar.text = EarthenShieldTotemBar:CreateFontString(nil, "HIGH", "GameFontHighlightLarge");
EarthenShieldTotemBar.text:SetPoint("CENTER",EarthenShieldTotemBar,"RIGHT",-25,0);
EarthenShieldTotemBar.text:SetFont("Interface\\addons\\ShamanAuras\\Media\\fonts\\Continuum_Medium.ttf", 12);
EarthenShieldTotemBar.text:SetTextColor(1,1,1,1);

-- Build Earthen Shield Timer Status Bar
EarthenShieldTotemBar.Timer = CreateFrame("StatusBar","EarthenShieldTimer",EarthenShieldTotemBar);
EarthenShieldTotemBar.Timer:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar");
EarthenShieldTotemBar.Timer:GetStatusBarTexture():SetHorizTile(false);
EarthenShieldTotemBar.Timer:GetStatusBarTexture():SetVertTile(false);
--EarthenShieldTotemBar.Timer:SetWidth(EarthenShieldTotemBar:GetWidth());
--EarthenShieldTotemBar.Timer:SetHeight(EarthenShieldTotemBar:GetHeight());
EarthenShieldTotemBar.Timer:SetFrameStrata("MEDIUM");
EarthenShieldTotemBar.Timer:SetPoint("CENTER",EarthenShieldTotemBar,"CENTER",0,0);
EarthenShieldTotemBar.Timer:SetStatusBarColor(1,1,1,0.35);
EarthenShieldTotemBar.Timer:SetMinMaxValues(0,15);
EarthenShieldTotemBar.Timer:Show();
EarthenShieldTotemBar.Timer:SetAlpha(0);

EarthenShieldTotemBar.Timer.text = EarthenShieldTotemBar.Timer:CreateFontString(nil, "HIGH", "GameFontHighlightLarge");
EarthenShieldTotemBar.Timer.text:SetPoint("CENTER",EarthenShieldTotemBar.Timer,"LEFT",25,0);
EarthenShieldTotemBar.Timer.text:SetFont("Interface\\addons\\ShamanAuras\\Media\\fonts\\Continuum_Medium.ttf", 12);
EarthenShieldTotemBar.Timer.text:SetTextColor(1,1,1,1);

EarthenShieldTotemBar:SetScript("OnUpdate",function(self,elapsed)
	if (Auras:CharacterCheck(3)) then
		local timer,seconds = Auras:parseTime(((EST_Expires or 0) - GetTime()),true);
		
		--Auras:ToggleAuraVisibility(self,true,'showhide');
		
		if (self:GetWidth() ~= Auras.db.char.layout[3].earthenShieldBar.width) then
			self:SetWidth(Auras.db.char.layout[3].earthenShieldBar.width);
			self.Timer:SetWidth(self:GetWidth());
		end
		
		if (self:GetHeight() ~= Auras.db.char.layout[3].earthenShieldBar.height) then
			self:SetHeight(Auras.db.char.layout[3].earthenShieldBar.height);
			self.Timer:SetHeight(self:GetHeight());
		end
		
		if (not Auras.db.char.layout[3].earthenShieldBar.isAdjustable and not Auras.db.char.layout[3].isMoving) then
			if ((seconds or 0) > 0.1) then
				self.Timer:SetValue(seconds);
				self.Timer.text:SetText(timer);
			else
				self.Timer:SetValue(0);
				self.Timer.text:SetText('');
			end
		elseif (Auras.db.char.layout[3].earthenShieldBar.isAdjustable or Auras.db.char.layout[3].isMoving) then
			self:SetAlpha(0.5);
		end
	else
		Auras:ToggleAuraVisibility(self,false,'alpha');
	end
end);

EarthenShieldTotemBar:SetScript("OnMouseDown",function(self,button)
	if (Auras.db.char.layout[3].isMoving) then
		Auras:MoveOnMouseDown(self,'resGrp',button);
	end
end);

EarthenShieldTotemBar:SetScript("OnMouseUp",function(self,button)
	if (Auras.db.char.layout[3].isMoving) then
		Auras:MoveOnMouseUp(self,'resGrp',button);
	end
end);
--[[EarthenShieldTotemBar:SetScript("OnUpdate",function(self)
	local buff,_,_,count,_,_,expires = UnitBuff('player',Auras:GetSpellName(210714));

	if (buff) then
		local timer,seconds = Auras:parseTime(expires - GetTime(),false);
		
		self:SetAlpha(1);
		self:SetValue(count);
		self.Timer:SetValue(seconds);
		self.Timer.text:SetText(string.format("%.1f",seconds));
	else
		self:SetAlpha(0);
	end
end)]]


SSA.EarthenShieldTotemBar = EarthenShieldTotemBar;

--[[local function UpdateEarthenShield()
	local progress = ((Auras.db.char.info.totems.eShield.dmg or 0) / Auras.db.char.info.totems.eShield.hp * 100);
	progress = 100 - progress;
	local remains = (Auras.db.char.info.totems.eShield.hp - (Auras.db.char.info.totems.eShield.dmg or 0));
	
	if (remains > 0) then
		SSA.EarthenShieldTotemBar:SetValue(remains);
		SSA.EarthenShieldTotemBar.text:SetText(tostring(math.ceil(progress)).."%");
	else
		SSA.EarthenShieldTotemBar:SetAlpha(0);
		--SSA.EarthenShieldTotemBar.Timer:Hide();
	end
end]]

-- Build Buff Timer Status Bar Group
SSA.BuffTimerBarGrpRes = CreateFrame("Frame","BuffTimerBarGrpRes",AuraGroup);
local BuffTimerBarGrp = SSA.BuffTimerBarGrpRes;
BuffTimerBarGrp:SetWidth(131);
BuffTimerBarGrp:SetHeight(180);
BuffTimerBarGrp:SetBackdrop(nil);
BuffTimerBarGrp:Show();
_G["SSA_BuffTimerGrpRes"] = BuffTimerBarGrp;

-- Build Main Timer Status Bar Group
SSA.MainTimerBarGrpRes = CreateFrame("Frame","MainTimerBarGrpRes",AuraGroup);
local MainTimerBarGrp = SSA.MainTimerBarGrpRes;
MainTimerBarGrp:SetWidth(105);
MainTimerBarGrp:SetHeight(180);
MainTimerBarGrp:SetBackdrop(nil);
MainTimerBarGrp:Show();
_G["SSA_MainTimerBarGrpRes"] = MainTimerBarGrp;

-- Build Utility Timer Status Bar Group
SSA.UtilTimerBarGrpRes = CreateFrame("Frame","UtilTimerBarGrpRes",AuraGroup);
local UtilTimerBarGrp = SSA.UtilTimerBarGrpRes;
UtilTimerBarGrp:SetWidth(47);
UtilTimerBarGrp:SetHeight(180);
UtilTimerBarGrp:SetBackdrop(nil);
UtilTimerBarGrp:Show();
_G["SSA_UtilTimerBarGrpRes"] = UtilTimerBarGrp;

-- Build Restoration Vertical Status Bars
SSA.AncestralGuidanceBarRes = CreateFrame("StatusBar","AncestralGuidanceBarRes",BuffTimerBarGrp);
SSA.AncestralProtectionTotemBar = CreateFrame("StatusBar","AncestralProtectionTotemBar",MainTimerBarGrp);
SSA.AscendanceBarRes = CreateFrame("StatusBar","AscendanceBarRes",BuffTimerBarGrp);
SSA.AstralShiftBarRes = CreateFrame("StatusBar","AstralShiftBarRes",BuffTimerBarGrp);
SSA.BloodlustBarRes = CreateFrame("StatusBar","BloodlustBarRes",BuffTimerBarGrp);
SSA.CloudburstTotemBar = CreateFrame("StatusBar","CloudburstTotemBar",MainTimerBarGrp);
SSA.EarthgrabTotemBarRes = CreateFrame("StatusBar","EarthgrabTotemBarRes",UtilTimerBarGrp);
SSA.HealingStreamTotemOneBar = CreateFrame("StatusBar","HealingStreamTotemOneBar",MainTimerBarGrp);
SSA.HealingStreamTotemTwoBar = CreateFrame("StatusBar","HealingStreamTotemTwoBar",MainTimerBarGrp);
SSA.HealingTideTotemBar = CreateFrame("StatusBar","HealingTideTotemBar",MainTimerBarGrp);
SSA.HeroismBarRes = CreateFrame("StatusBar","HeroismBarRes",BuffTimerBarGrp);
SSA.HexBarRes = CreateFrame("StatusBar","HexBarRes",UtilTimerBarGrp);
SSA.SpiritLinkTotemBar = CreateFrame("StatusBar","SpiritLinkTotemBar",MainTimerBarGrp);
SSA.SpiritwalkersGraceBar = CreateFrame("StatusBar","SpiritwalkersGraceBar",BuffTimerBarGrp);
SSA.TimeWarpBarRes = CreateFrame("StatusBar","TimeWarpBarRes",BuffTimerBarGrp);
SSA.UnleashLifeBar = CreateFrame("StatusBar","UnleashLifeBar",BuffTimerBarGrp);
SSA.VoodooTotemBarRes = CreateFrame("StatusBar","VoodooTotemBarRes",UtilTimerBarGrp);
SSA.WindRushTotemBarRes = CreateFrame("StatusBar","WindRushTotemBarRes",UtilTimerBarGrp);

local buffIDs = {
	[108281] = SSA.AncestralGuidanceBarRes,
	[114052] = SSA.AscendanceBarRes,
	[108271] = SSA.AstralShiftBarRes,
	[2825]   = SSA.BloodlustBarRes,
	[32182]  = SSA.HeroismBarRes,
	[79206]  = SSA.SpiritwalkersGraceBar,
	[80353]  = SSA.TimeWarBarRes,
	[73685]  = SSA.UnleashLifeBar,
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
		[2] = SSA.EarthgrabTotemBarRes,
		[3] = false,
	},
	["Voodoo Totem"] = {
		[1] = false,
		[2] = SSA.VoodooTotemBarRes,
		[3] = false,
	},
	["Wind Rush Totem"] = {
		[1] = false,
		[2] = SSA.WindRushTotemBarRes,
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

BuffTimerBarGrp:SetScript("OnUpdate",function(self,event,...)
	if (Auras:CharacterCheck(3)) then
		Auras:ToggleAuraVisibility(self,true,'showhide');
		
		local xPosCtr = 1;
		for i=1,getn(buffTable) do
			local buff,_,_,_,_,duration,expires = UnitBuff('player',Auras:GetSpellName(buffTable[i]));
			--[[local timer,seconds = Auras:parseTime(expires - GetTime(),true);
			
			buffIDs[buffTable[i]:SetMinMaxValues(0,duration);
			buffIDs[buffTable[i]:SetValue(seconds);
			buffIDs[buffTable[i].timetext:SetText(timer);
			buffIDs[buffTable[i]:SetPoint("LEFT",xPos[i],0);
			buffIDs[buffTable[i]:Show();]]
			if (expires) then
				if (Auras.db.char.aura[3][buffIDs[buffTable[i]]:GetName()]) then
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
		
		if (Auras.db.char.layout[3].isMoving) then
			self:SetBackdrop(backdrop);
			self:SetBackdropColor(0,0,0,0.85);
		else
			self:SetBackdrop(nil);
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

BuffTimerBarGrp:SetScript("OnMouseDown",function(self,button)
	if (Auras.db.char.layout[3].isMoving) then
		Auras:MoveOnMouseDown(self,'resGrp',button);
	end
end);

BuffTimerBarGrp:SetScript("OnMouseUp",function(self,button)
	if (Auras.db.char.layout[3].isMoving) then
		Auras:MoveOnMouseUp(self,'resGrp',button);
	end
end);

MainTimerBarGrp:SetScript("OnUpdate",function(self,event,...)
	if (Auras:CharacterCheck(3)) then
		local totemCtr = 0
		local streamCtr = 0;
		local x
		local _,_,_,selected = GetTalentInfo(6,3,1);
	
		mainIDs["Ancestral Protection Totem"][3] = false;
		mainIDs["Cloudburst Totem"][3] = false;
		mainIDs["Healing Stream Totem One"][3] = false;
		mainIDs["Healing Stream Totem Two"][3] = false;
		mainIDs["Healing Tide Totem"][3] = false;
		mainIDs["Spirit Link Totem"][3] = false;
		
		
		
		Auras:ToggleAuraVisibility(self,true,'showhide');
		SSA.DataFrame.text:SetText('');
		for i=1,5 do
			local _,name,start,duration = GetTotemInfo(i);

			if (secondTotemSlot > 0 and i == secondTotemSlot and name ~= "Healing Stream Totem") then
				secondTotemSlot = 0;
			end
					
			if (duration > 0) then
				local timer,seconds = Auras:parseTime((start + duration) - GetTime(),true);

				if (name == "Healing Stream Totem" and not selected) then
					name = "Healing Stream Totem One";
				elseif (name == "Healing Stream Totem" and selected) then
					streamCtr = streamCtr + 1;
					
					
					if (streamCtr == 2) then
						secondTotemSlot = i;
					end
					
					if (secondTotemSlot > 0 and i == secondTotemSlot) then
						name = "Healing Stream Totem Two";
					else
						name = "Healing Stream Totem One";
					end
				end

				if (mainIDs[name]) then
					mainIDs[name][3] = true;
					if (Auras.db.char.aura[3][gsub(name," ","").."Bar"]) then
						totemCtr = totemCtr + 1;
						if (seconds > 0.1) then
							mainIDs[name][2]:SetMinMaxValues(0,duration);
							mainIDs[name][2]:SetValue(seconds);
							mainIDs[name][2].timetext:SetText(timer);
							mainIDs[name][2]:SetPoint("RIGHT",(xPos[totemCtr] * -1),0);
							mainIDs[name][2]:Show();
							mainIDs[name][1] = true;
						else
							totemCtr = totemCtr - 1;
							mainIDs[name][2]:SetValue(0);
							mainIDs[name][2]:Hide();
							mainIDs[name][1] = false;
						end
					else
						mainIDs[name][2]:Hide();
					end
				end
			end
			
			if (i==5) then
				if (not mainIDs["Ancestral Protection Totem"][3] and mainIDs["Ancestral Protection Totem"][1]) then
					mainIDs["Ancestral Protection Totem"][1] = false;
				end
				
				if (not mainIDs["Cloudburst Totem"][3] and mainIDs["Cloudburst Totem"][1]) then
					mainIDs["Cloudburst Totem"][1] = false;
				end
				
				if (not mainIDs["Healing Stream Totem One"][3] and mainIDs["Healing Stream Totem One"][1]) then
					mainIDs["Healing Stream Totem One"][1] = false;
				end
				
				if (not mainIDs["Healing Stream Totem Two"][3] and mainIDs["Healing Stream Totem Two"][1]) then
					mainIDs["Healing Stream Totem Two"][1] = false;
				end
				
				if (not mainIDs["Healing Tide Totem"][3] and mainIDs["Healing Tide Totem"][1]) then
					mainIDs["Healing Tide Totem"][1] = false;
				end
				
				if (not mainIDs["Spirit Link Totem"][3] and mainIDs["Spirit Link Totem"][1]) then
					mainIDs["Spirit Link Totem"][1] = false;
				end
			end
		end
		
		for mainObj in pairs(mainIDs) do
			SSA_DataFrame.text:SetText(mainObj);
			if (not mainIDs[mainObj][1] and mainIDs[mainObj][2]:IsShown()) then
				mainIDs[mainObj][2]:Hide();
				mainIDs[mainObj][1] = false;
			end
		end
		
		mainTotems = totemCtr;
		
		if (mainTotems == 0 and mainIDs["Cloudburst Totem"][2]:IsShown()) then
			mainIDs["Cloudburst Totem"][2]:Hide();
			mainIDs["Cloudburst Totem"][2]:SetValue(0);
		end
		
		SSA.DataFrame.text:SetText(Auras:CurText('DataFrame').."\nNum Totems: "..tostring(mainTotems).."\nMemory Usage: "..GetAddOnMemoryUsage("ShamanAurasDev"));
		if (Auras.db.char.layout[3].isMoving) then
			self:SetBackdrop(backdrop);
			self:SetBackdropColor(0,0,0,0.85);
		else
			self:SetBackdrop(nil);
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

MainTimerBarGrp:SetScript("OnMouseDown",function(self,button)
	if (Auras.db.char.layout[3].isMoving) then
		Auras:MoveOnMouseDown(self,'resGrp',button);
	end
end);

MainTimerBarGrp:SetScript("OnMouseUp",function(self,button)
	if (Auras.db.char.layout[3].isMoving) then
		Auras:MoveOnMouseUp(self,'resGrp',button);
	end
end);

UtilTimerBarGrp:SetScript("OnUpdate",function(self,event,...)
	if (Auras:CharacterCheck(3)) then
		local totemCtr = 0
		local x
	
		Auras:ToggleAuraVisibility(self,true,'showhide');
		
		utilIDs["Earthgrab Totem"][3] = false;
		utilIDs["Voodoo Totem"][3] = false;
		utilIDs["Wind Rush Totem"][3] = false;
		
		for i=1,5 do
			local _,name,start,duration = GetTotemInfo(i);
			
			if ((duration or 0) > 0 and name) then
				if (Auras.db.char.aura[3][gsub(name," ",'').."BarRes"]) then
					local timer,seconds = Auras:parseTime((start + duration) - GetTime(),true);
					
					if (utilIDs[name]) then
						utilIDs[name][3] = true;
						totemCtr = totemCtr + 1;
						
						if (mainTotems > 0) then
							x = xOffset[mainTotems + (totemCtr - 1)];
						else
							x = (xPos[totemCtr] * -1);
						end
					
						if (seconds > 0.1) then
							utilIDs[name][2]:SetMinMaxValues(0,duration);
							utilIDs[name][2]:SetValue(seconds);
							utilIDs[name][2].timetext:SetText(timer);
							utilIDs[name][2]:SetPoint("RIGHT",x,0);
							utilIDs[name][2]:Show();
							utilIDs[name][1] = true;
						else
							totemCtr = totemCtr - 1;
							utilIDs[name][2]:SetValue(0);
							utilIDs[name][2]:Hide();
							utilIDs[name][1] = false;
						end
					end
				else
					if (name and name ~= '' and utilIDs[name]) then
						utilIDs[name][2]:Hide();
					end
				end
			else
				--[[if (name and name ~= '') then
					utilIDs[name][2]:Hide();
				end]]
			end
			
			if (i==5) then
				if (not utilIDs["Earthgrab Totem"][3] and utilIDs["Earthgrab Totem"][1]) then
					utilIDs["Earthgrab Totem"][1] = false;
				end
				
				if (not utilIDs["Voodoo Totem"][3] and utilIDs["Voodoo Totem"][1]) then
					utilIDs["Voodoo Totem"][1] = false;
				end
				
				if (not utilIDs["Wind Rush Totem"][3] and utilIDs["Wind Rush Totem"][1]) then
					utilIDs["Wind Rush Totem"][1] = false;
				end
			end
		end
		
		for utilObj in pairs(utilIDs) do
			if (not utilIDs[utilObj][1] and utilIDs[utilObj][2]:IsShown()) then
				utilIDs[utilObj][2]:Hide();
				utilIDs[utilObj][1] = false;
			end
		end
		
		if (Auras.db.char.layout[3].isMoving) then
			self:SetBackdrop(backdrop);
			self:SetBackdropColor(0,0,0,0.85);
		else
			self:SetBackdrop(nil);
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

UtilTimerBarGrp:SetScript("OnMouseDown",function(self,button)
	if (Auras.db.char.layout[3].isMoving) then
		Auras:MoveOnMouseDown(self,'resGrp',button);
	end
end);

UtilTimerBarGrp:SetScript("OnMouseUp",function(self,button)
	if (Auras.db.char.layout[3].isMoving) then
		Auras:MoveOnMouseUp(self,'resGrp',button);
	end
end);

--[[-- Undulation Notification
SSA.Undulation = CreateFrame("Frame","Undulation",AuraGroup);
local Undulation = SSA.Undulation;
Undulation:SetPoint("CENTER",0,-210);
Undulation:SetWidth(400);
Undulation:SetHeight(180);
Undulation:SetFrameStrata("BACKGROUND");
Undulation:Hide();

Undulation.texture = Undulation:CreateTexture(nil,"LOW");
Undulation.texture:SetTexture("Textures\\SpellActivationOverlays\\Monk_Serpent");
Undulation.texture:SetPoint("CENTER",Undulation,"CENTER",0,0);
Undulation.texture:SetWidth(Undulation:GetWidth() + 20);
Undulation.texture:SetHeight(Undulation:GetHeight());
Undulation.texture:SetRotation(math.rad(-90));
Undulation.texture:SetAlpha(0.7);

-- Animation for Totem Mastery Notification Texture
Undulation.Flash = Undulation.texture:CreateAnimationGroup();
Undulation.Flash:SetLooping("BOUNCE");

Undulation.Flash.fadeIn = Undulation.Flash:CreateAnimation("Alpha");
Undulation.Flash.fadeIn:SetFromAlpha(1);
Undulation.Flash.fadeIn:SetToAlpha(0.4);
Undulation.Flash.fadeIn:SetDuration(0.4);

Undulation.Flash.fadeOut = Undulation.Flash:CreateAnimation("Alpha");
Undulation.Flash.fadeOut:SetFromAlpha(0.4);
Undulation.Flash.fadeOut:SetToAlpha(1);
Undulation.Flash.fadeOut:SetDuration(0.4);
Undulation.Flash.fadeOut:SetEndDelay(0);]]

--SSA.ErrorFrame.text:SetText("Name: "..StormkeeperCharges:GetName())
local Undulation = CreateFrame("Frame","Undulation",AuraGroup);
--local StormkeeperCharge1 = SSA.StormkeeperCharge1;
Undulation:SetWidth(60);
Undulation:SetHeight(60);
Undulation:SetPoint("CENTER",AuraGroup,"CENTER",0,-275);
Undulation:SetAlpha(0);
Undulation:Show();

Undulation.Orb = CreateFrame("PlayerModel","StormkeeperCharge1_Orb",Undulation);
Undulation.Orb:SetModel("SPELLS/Monk_ForceSpere_Orb.m2");
Undulation.Orb:SetFrameStrata(low);
Undulation.Orb:SetAllPoints(Undulation);
--Undulation.Orb:SetCamera(1);
Undulation.Orb:SetPosition(0,0,0);
Undulation.Orb:SetAlpha(1);
--Undulation.Orb:SetModelScale(0.021);
Undulation.Orb:SetSequence(1);
Undulation.Orb:SetRotation(0);
Undulation:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(3)) then
		local buff = UnitBuff('player',Auras:GetSpellName(216251));
		
		Auras:ToggleAuraVisibility(self,true,'showhide');
		
		if (not Auras.db.char.layout[3].isMoving) then
			if (buff and Auras.db.char.aura[3].Undulation) then
				self:SetAlpha(1);
			else
				self:SetAlpha(0);
			end
		else
			self:SetAlpha(1);
		end
		
		if (Auras.db.char.layout[3].isMoving) then
			self:SetBackdrop(backdrop);
			self:SetBackdropColor(0,0,0,0.85);
		else
			self:SetBackdrop(nil);
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

Undulation:SetScript("OnMouseDown",function(self,button)
	if (Auras.db.char.layout[3].isMoving) then
		Auras:MoveOnMouseDown(self,'resGrp',button);
	end
end);

Undulation:SetScript("OnMouseUp",function(self,button)
	if (Auras.db.char.layout[3].isMoving) then
		Auras:MoveOnMouseUp(self,'resGrp',button);
	end
end);

SSA.Undulation = Undulation;
_G["SSA_Undulation"] = Undulation;

EventFrame:SetScript("OnEvent",function(self,event,...)
	if (Auras:CharacterCheck(3)) then
		local _,subevent,_,sGUID,source,_,_,petGUID,name,_,_,spellID,_,_,damage = ...

		if (event ~= "COMBAT_LOG_EVENT_UNFILTERED") then
			return
		end
		--SSA.ErrorFrame.text:SetText("SubEvent: "..subevent.."\n");
		--SSA.ErrorFrame.text:SetText(Auras:CurText('ErrorFrame').."Spell ID: "..spellID.."\n");
		if (sGUID == UnitGUID('player')) then
			if (subevent == "SPELL_CAST_SUCCESS") then
				if (spellID == 61295 or spellID == 1064) then
					healTime = GetTime();
				end
			elseif (subevent == "SPELL_AURA_APPLIED") then
				if (buffIDs[spellID]) then
					local isValidBuff = false;
					
					if ((spellID == 108271 and Auras.db.char.aura[3].AstralShiftBarRes) or (spellID == 114052 and Auras.db.char.aura[3].AscendanceBarRes) or (spellID == 108281 and Auras.db.char.aura[3].AncestralGuidanceBarRes) or (spellID == 2825 and Auras.db.char.aura[3].BloodlustBarRes) or (spellID == 79206 and Auras.db.char.aura[3].SpiritwalkersGraceBar) or (spellID == 32182 and Auras.db.char.aura[3].HeroismBarRes) or (spellID == 73685 and Auras.db.char.aura[3].UnleashLifeBar) or (spellID == 80353 and Auras.db.char.aura[3].TimeWarpBarRes)) then
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
			elseif (subevent == "SPELL_SUMMON" and spellID == 198838) then
				if (Auras.db.char.aura[3].EarthenShieldTotemBar) then
					SSA.ErrorFrame.text:SetText("EST Summoned");
					local EST = SSA.EarthenShieldTotemBar;
					EST_Expires = GetTime() + 15;
					SSA.EarthenShieldTotemBar:SetAlpha(1);
					SSA.EarthenShieldTotemBar.Timer:SetAlpha(1);
					SSA.EarthenShieldTotemBar:SetMinMaxValues(0,UnitHealthMax('player'));
					SSA.EarthenShieldTotemBar.text:SetText("100%");
					SSA.EarthenShieldTotemBar:SetValue(UnitHealthMax('player'));
					Auras.db.char.info.totems.eShield.hp = UnitHealthMax('player');
					Auras.db.char.info.totems.eShield.dmg = 0;
					EST_GUID = petGUID;
				end
			elseif ((subevent == "SPELL_DAMAGE" or subevent == "SWING_DAMAGE") and name == L["Earthen Shield Totem"]) then
				Auras.db.char.info.totems.eShield.dmg = (Auras.db.char.info.totems.eShield.dmg or 0) + damage;
				Auras:UpdateEarthenShield(EarthenShieldTotemBar);
			elseif (subevent == "UNIT_DIED" and name == L["Earthen Shield Totem"]) then
				SSA.ErrorFrame.text:SetText("DEAD");
				
			end
		end
		if (subevent == "UNIT_DIED" and EST_GUID == petGUID) then
			EarthenShieldTotemBar:SetAlpha(0);
			EarthenShieldTotemBar.Timer:SetAlpha(0);
			EST_GUID = nil;
		end
	end
end);

-------------------------------------------------------------------------------------------------------
----- Build Move UI
-------------------------------------------------------------------------------------------------------

SSA.MoveRes = CreateFrame("Frame","MoveRes",UIParent);

SSA.AuraObjectsRes = {
	[1] = {
		alpha = nil,
		object = AuraGroup,
		backdrop = "BackdropSB",
	},
	[2] = {
		alpha = nil,
		object = LargeIconGrpTop,
		backdrop = "BackdropSB",
	},
	[3] = {
		alpha = nil,
		object = LargeIconGrpBot,
		backdrop = "BackdropSB",
	},
	[4] = {
		alpha = nil,
		object = SmallIconGrpLeft,
		backdrop = "BackdropSB",
	},
	[5] = {
		alpha = nil,
		object = SmallIconGrpRight,
		backdrop = "BackdropSB",
	},
	[6] = {
		alpha = nil,
		object = BuffTimerBarGrp,
		backdrop = "BackdropSB",
	},
	[7] = {
		alpha = nil,
		object = MainTimerBarGrp,
		backdrop = "BackdropSB",
	},
	[8] = {
		alpha = nil,
		object = UtilTimerBarGrp,
		backdrop = "BackdropSB",
	},
	[9] = {
		alpha = true,
		object = EarthenShieldTotemBar,
		statusbar = {
			r = 0.91,
			g = 0.41,
			b = 1,
			m = 'player',
		},
	},
	[10] = {
		alpha = nil,
		object = TidalWavesBar,
		statusbar = {
			r = 0.35,
			g = 0.76,
			b = 1,
			m = 2,
		},
	},
	--[11] = LavaSurge,
	[11] = {
		alpha = true,
		model = {
			[1] = Undulation.Orb,
		},
		object = Undulation,
		backdrop = 'BackdropSB',
	},
	[12] = {
		object = Cloudburst,
		alpha = true,
	},
	--[[[11] = CloudburstAbsorbBar,
	[12] = LavaSurge,]]
}

SSA.MoveStringsRes = {
	[1] = L["Move All Auras"],
	[2] = L["Move Top Auras"],
	[3] = L["Move Bottom Auras"],
	[4] = L["Move Left Auras"],
	[5] = L["Move Right Auras"],
	[6] = L["Move Buff Timer Bars"],
	[7] = L["Move Main Timer Bars"],
	[8] = L["Move Utility Timer Bars"],
	[9] = L["Move Earthen Shield Bar"],
	[10] = L["Move Tidal Waves Bar"],
	--[11] = L["Move Lava Surge Texture"],
	[11] = L["Move Undulation"],
	[12] = L["Cloudburst Healing Stored"],
	--[12] = L["Move Lava Surge Texture"],
}
