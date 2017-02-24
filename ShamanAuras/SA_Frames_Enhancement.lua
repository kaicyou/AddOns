
local FOLDER_NAME, SSA = ...

local L = LibStub("AceLocale-3.0"):GetLocale("ShamanAuras", true)
local Auras = LibStub("AceAddon-3.0"):GetAddon("ShamanAuras")
local AceGUI = LibStub("AceGUI-3.0");

local lgIcon,lgGlow,smIcon,smGlow = 32,45,25,35;
local x,y = 0,0,0;
local bg,low,med,high = "BACKGROUND","LOW","MEDIUM","HIGH"
local buffTable,mainTable,utilTable = {},{},{};

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
	Frame.CD.text:SetAllPoints(Frame.CD);
	Frame.CD.text:SetPoint("CENTER",0,0);
	Frame.CD.text:SetTextColor(1,1,0,1);
	
	if (glowSize) then
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
end


-----------------------------------------------------------------------
-- Enhancement Frames
-----------------------------------------------------------------------
local AuraGroup,LargeIconGrpTop,LargeIconGrpBot,SmallIconGrpLeft,SmallIconGrpRight

-- Build Enhtoration Aura Group Containers
AuraGroup = CreateGroup("AuraGroupEnh",UIParent);
LargeIconGrpTop = CreateGroup("LargeIconGrpTopEnh",AuraGroup);
LargeIconGrpBot = CreateGroup("LargeIconGrpBotEnh",AuraGroup);
SmallIconGrpLeft = CreateGroup("SmallIconGrpLeftEnh",AuraGroup);
SmallIconGrpRight = CreateGroup("SmallIconGrpRightEnh",AuraGroup);

-- Build Large Enhancement Icon Frames
InitializeFrames("AscendanceEnh",LargeIconGrpBot,"shared\\ascendance",lgIcon);
InitializeFrames("Boulderfist",LargeIconGrpBot,"enhancement\\boulderfist",lgIcon,lgGlow,true);
InitializeFrames("CrashLightning",LargeIconGrpTop,"enhancement\\crash_lightning",lgIcon,lgGlow);
InitializeFrames("DoomWinds",LargeIconGrpBot,"enhancement\\doom_winds",lgIcon);
InitializeFrames("EarthenSpike",LargeIconGrpBot,"enhancement\\earthen_spike",lgIcon);
InitializeFrames("FeralSpirit",LargeIconGrpBot,"enhancement\\feral_spirit",lgIcon);
InitializeFrames("Flametongue",LargeIconGrpTop,"enhancement\\flametongue",lgIcon,lgGlow);
InitializeFrames("Frostbrand",LargeIconGrpTop,"enhancement\\frostbrand",lgIcon,lgGlow);
InitializeFrames("LavaLash",LargeIconGrpTop,"enhancement\\lava_lash",lgIcon,lgGlow);
InitializeFrames("Stormstrike",LargeIconGrpTop,"enhancement\\stormstrike",lgIcon,lgGlow,true);
InitializeFrames("Sundering",LargeIconGrpBot,"enhancement\\sundering",lgIcon);
InitializeFrames("Windsong",LargeIconGrpBot,"enhancement\\windsong",lgIcon,lgGlow);

InitializeFrames("AstralShiftEnh",SmallIconGrpRight,"shared\\astral_shift",smIcon);
InitializeFrames("CleanseSpiritEnh",SmallIconGrpLeft,"restoration\\purify_spirit",smIcon);
InitializeFrames("EarthgrabTotemEnh",SmallIconGrpRight,"totems\\earthgrab_totem",smIcon);
InitializeFrames("FeralLunge",SmallIconGrpRight,"enhancement\\feral_lunge",smIcon);
InitializeFrames("HexEnh",SmallIconGrpLeft,"shared\\hex",smIcon);
InitializeFrames("LightningSurgeTotemEnh",SmallIconGrpRight,"totems\\lightning_surge_totem",smIcon);
InitializeFrames("Rainfall",SmallIconGrpLeft,"shared\\healing_rain",smIcon);
InitializeFrames("SpiritWalk",SmallIconGrpRight,"enhancement\\spirit_walk",smIcon);
InitializeFrames("VoodooTotemEnh",SmallIconGrpLeft,"totems\\voodoo_totem",smIcon);
InitializeFrames("WindRushTotemEnh",SmallIconGrpRight,"totems\\wind_rush_totem",smIcon);
InitializeFrames("WindShearEnh",SmallIconGrpLeft,"shared\\wind_shear",smIcon);

-------------------------------------------------------------------------------------------------------
----- Initialize Scripts (Aura Groups)
-------------------------------------------------------------------------------------------------------

AuraGroup:SetScript("OnUpdate",function(self,button)
	if (Auras.db.char.config[2].isMoving) then
		self:SetBackdrop(backdrop);
		self:SetBackdropColor(0,0,0,0.5);
	else
		self:SetBackdrop(nil);
	end
end);

AuraGroup:SetScript("OnMouseDown",function(self,button)
	if (Auras.db.char.config[2].isMoving) then
		Auras:MoveOnMouseDown(self,'enhGrp',button);
	end
end);

AuraGroup:SetScript("OnMouseUp",function(self,button)
	if (Auras.db.char.config[2].isMoving) then
		Auras:MoveOnMouseUp(self,'enhGrp',button);
	end
end);

LargeIconGrpTop:SetScript("OnUpdate",function(self,button)
	if (Auras.db.char.config[2].isMoving) then
		self:SetBackdrop(backdrop);
		self:SetBackdropColor(0,0,0,0.85);
	else
		self:SetBackdrop(nil);
	end
end);

LargeIconGrpTop:SetScript("OnMouseDown",function(self,button)
	if (Auras.db.char.config[2].isMoving) then
		Auras:MoveOnMouseDown(self,'resGrp',button);
	end
end);

LargeIconGrpTop:SetScript("OnMouseUp",function(self,button)
	if (Auras.db.char.config[2].isMoving) then
		Auras:MoveOnMouseUp(self,'resGrp',button);
	end
end);

LargeIconGrpBot:SetScript("OnUpdate",function(self,button)
	if (Auras.db.char.config[2].isMoving) then
		self:SetBackdrop(backdrop);
		self:SetBackdropColor(0,0,0,0.85);
	else
		self:SetBackdrop(nil);
	end
end);

LargeIconGrpBot:SetScript("OnMouseDown",function(self,button)
	if (Auras.db.char.config[2].isMoving) then
		Auras:MoveOnMouseDown(self,'enhGrp',button);
	end
end);

LargeIconGrpBot:SetScript("OnMouseUp",function(self,button)
	if (Auras.db.char.config[2].isMoving) then
		Auras:MoveOnMouseUp(self,'enhGrp',button);
	end
end);

SmallIconGrpLeft:SetScript("OnUpdate",function(self,button)
	if (Auras.db.char.config[2].isMoving) then
		self:SetBackdrop(backdrop);
		self:SetBackdropColor(0,0,0,0.85);
	else
		self:SetBackdrop(nil);
	end
end);

SmallIconGrpLeft:SetScript("OnMouseDown",function(self,button)
	if (Auras.db.char.config[2].isMoving) then
		Auras:MoveOnMouseDown(self,'enhGrp',button);
	end
end);

SmallIconGrpLeft:SetScript("OnMouseUp",function(self,button)
	if (Auras.db.char.config[2].isMoving) then
		Auras:MoveOnMouseUp(self,'enhGrp',button);
	end
end);

SmallIconGrpRight:SetScript("OnUpdate",function(self,button)
	if (Auras.db.char.config[2].isMoving) then
		self:SetBackdrop(backdrop);
		self:SetBackdropColor(0,0,0,0.85);
	else
		self:SetBackdrop(nil);
	end
end);

SmallIconGrpRight:SetScript("OnMouseDown",function(self,button)
	if (Auras.db.char.config[2].isMoving) then
		Auras:MoveOnMouseDown(self,'enhGrp',button);
	end
end);

SmallIconGrpRight:SetScript("OnMouseUp",function(self,button)
	if (Auras.db.char.config[2].isMoving) then
		Auras:MoveOnMouseUp(self,'enhGrp',button);
	end
end);

-------------------------------------------------------------------------------------------------------
----- Initialize Scripts (Separate Auras)
-------------------------------------------------------------------------------------------------------

-- Ascendance
SSA.AscendanceEnh:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(2)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(114051));
		
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
			self:SetAlpha(Auras.db.char.triggers[2].OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Astral Shift
SSA.AstralShiftEnh:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(2)) then
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
			self:SetAlpha(Auras.db.char.triggers[2].OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Boulderfist
SSA.Boulderfist:SetScript("OnUpdate", function(self)
	if (Auras:CharacterCheck(2)) then
		local buff,_,_,_,_,_,expires = UnitBuff('player',Auras:GetSpellName(201897));
		local start,duration = GetSpellCooldown(Auras:GetSpellName(201897))
		local charges,maxCharges,chgStart,chgDuration = GetSpellCharges(201897)
	
		Auras:SpellRangeCheck(self,193786,true,2);
		Auras:ToggleAuraVisibility(self,true,'showhide');
	
		if (buff) then
			local timer,seconds = Auras:parseTime((expires or 0) - GetTime(),false);
			
			if (seconds > Auras.db.char.triggers[2].boulderfist) then
				Auras:ToggleOverlayGlow(self.glow,false);
			elseif (seconds <= Auras.db.char.triggers[2].boulderfist and UnitAffectingCombat('player')) then
				Auras:ToggleOverlayGlow(self.glow,true);
			end
		end
		
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
			Auras:ExecuteCooldown(self,start,duration,false);
			self.Charges.text:SetText('');
		end
			
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1);
		else
			self:SetAlpha(Auras.db.char.triggers[2].OoCAlpha)
			Auras:ToggleOverlayGlow(self.glow,false);
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);	

-- Cleanse Spirit
SSA.CleanseSpiritEnh:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(2)) then
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
			self:SetAlpha(Auras.db.char.triggers[2].OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);


-- Crash Lightning
SSA.CrashLightning:SetScript("OnUpdate", function(self)
	if (Auras:CharacterCheck(2)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(187874))
		local power = UnitPower('player',11);
	
		Auras:ToggleAuraVisibility(self,true,'showhide');
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,false);
		end
		
		if (UnitAffectingCombat('player')) then
			if (power >= 20) then
				self:SetAlpha(1);
			else
				self:SetAlpha(0.5);
			end
		else
			self:SetAlpha(Auras.db.char.triggers[2].OoCAlpha)
			Auras:ToggleOverlayGlow(self.glow,false);
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Doom Winds
SSA.DoomWinds:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(2)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(204945));
		
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
			self:SetAlpha(Auras.db.char.triggers[2].OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Earthen Spike
SSA.EarthenSpike:SetScript("OnUpdate", function(self)
	if (Auras:CharacterCheck(2)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(188089))
		local power = UnitPower('player',11);
	
		Auras:SpellRangeCheck(self,188089,true,2);
		Auras:ToggleAuraVisibility(self,true,'showhide');
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,false);
		end
		
		if (UnitAffectingCombat('player')) then
			if (power >= 30) then
				self:SetAlpha(1);
			else
				self:SetAlpha(0.5);
			end
		else
			self:SetAlpha(Auras.db.char.triggers[2].OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Earthgrab Totem
SSA.EarthgrabTotemEnh:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(2)) then
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
			self:SetAlpha(Auras.db.char.triggers[2].OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Feral Lunge
SSA.FeralLunge:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(2)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(196884));
		
		Auras:SpellRangeCheck(self,196884,true,2);
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
			self:SetAlpha(Auras.db.char.triggers[2].OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Feral Spirit
SSA.FeralSpirit:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(2)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(51533));
		
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
			self:SetAlpha(Auras.db.char.triggers[2].OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Flametongue
SSA.Flametongue:SetScript("OnUpdate", function(self)
	if (Auras:CharacterCheck(2)) then
		local buff,_,_,_,_,_,expires = UnitBuff('player',Auras:GetSpellName(193796));
		local start,duration = GetSpellCooldown(Auras:GetSpellName(193796));
		
		Auras:SpellRangeCheck(self,193796,true,2);
		Auras:ToggleAuraVisibility(self,true,'showhide');
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,false);
			self.CD:Show();
		else
			self.CD:Hide();
		end
		
		if (buff) then
			local timer,seconds = Auras:parseTime((expires or 0) - GetTime(),false);
			
			if (seconds > Auras.db.char.triggers[2].flametongue) then
				Auras:ToggleOverlayGlow(self.glow,false);
			elseif (seconds <= Auras.db.char.triggers[2].flametongue and UnitAffectingCombat('player')) then
				Auras:ToggleOverlayGlow(self.glow,true);
			end
		end
		
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1);
		else
			self:SetAlpha(Auras.db.char.triggers[2].OoCAlpha)
			Auras:ToggleOverlayGlow(self.glow,false);
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Frostbrand
SSA.Frostbrand:SetScript("OnUpdate", function(self)
	if (Auras:CharacterCheck(2)) then
		local buff,_,_,_,_,_,expires = UnitBuff('player',Auras:GetSpellName(196834));
		local power = UnitPower('player',11);
		
		if (power >= 20) then
			self:SetAlpha(1);
		else
			self:SetAlpha(0.5);
		end
		
		Auras:SpellRangeCheck(self,193796,true,2);
		Auras:ToggleAuraVisibility(self,true,'showhide');
		
		if (buff) then
			local timer,seconds = Auras:parseTime((expires or 0) - GetTime(),false);
			
			if (seconds > Auras.db.char.triggers[2].frostbrand or power < 20) then
				Auras:ToggleOverlayGlow(self.glow,false);
			elseif (seconds <= Auras.db.char.triggers[2].frostbrand and UnitAffectingCombat('player') and power >= 20) then
				Auras:ToggleOverlayGlow(self.glow,true);
			end
		end
		
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1);
		else
			self:SetAlpha(Auras.db.char.triggers[2].OoCAlpha)
			Auras:ToggleOverlayGlow(self.glow,false);
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Hex
SSA.HexEnh:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(2)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(51514));

		Auras:ToggleAuraVisibility(self,true,'showhide');
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,true);
			self.CD:Show();
		else
			self.CD:Hide();
		end
		
		Auras:SpellRangeCheck(self,51514,(UnitCreatureType('target') == "Humanoid" or UnitCreatureType('target') == "Beast" or UnitCreatureType('target') == "Critter"),2);	
		
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			self:SetAlpha(1);
		else
			self:SetAlpha(Auras.db.char.triggers[2].OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Lava Lash
SSA.LavaLash:SetScript("OnUpdate", function(self)
	if (Auras:CharacterCheck(2)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(60103))
		local buff = UnitBuff('player',Auras:GetSpellName(201900));
		
		local power = UnitPower('player',11);
		
		Auras:SpellRangeCheck(self,60103,true,2);
		Auras:ToggleAuraVisibility(self,true,'showhide');
		
		if ((duration or 0) > 2) then
			Auras:ExecuteCooldown(self,start,duration,false);
		end
		
		if (buff) then
			Auras:ToggleOverlayGlow(self.glow,true);
		else
			Auras:ToggleOverlayGlow(self.glow,false);
		end
		
		if (UnitAffectingCombat('player')) then
			if (power >= 30 or buff) then
				self:SetAlpha(1);
			else
				self:SetAlpha(0.5);
			end
		else
			self:SetAlpha(Auras.db.char.triggers[2].OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Lightning Surge Totem
SSA.LightningSurgeTotemEnh:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(2)) then
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
			self:SetAlpha(Auras.db.char.triggers[2].OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Rainfall
SSA.Rainfall:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(2)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(215864));

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
			self:SetAlpha(Auras.db.char.triggers[2].OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Spirit Walk
SSA.SpiritWalk:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(2)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(58875));

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
			self:SetAlpha(Auras.db.char.triggers[2].OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Stormstrike
SSA.Stormstrike:SetScript("OnUpdate", function(self)
	if (Auras:CharacterCheck(2)) then
		local buff,_,_,_,_,_,expires = UnitBuff('player',Auras:GetSpellName(201846));
		local start,duration = GetSpellCooldown(Auras:GetSpellName(17364));
		local power = UnitPower('player',11);
		
		Auras:SpellRangeCheck(self,17364,true,2);
		Auras:ToggleAuraVisibility(self,true,'showhide');
		
		if (UnitAffectingCombat('player') and Auras:IsTargetEnemy()) then
			if (duration > 2) then
				--Auras:ToggleCooldownSwipe(self.CD,true)
				Auras:ToggleOverlayGlow(self.glow,false);
				Auras:ExecuteCooldown(self,start,duration,false);
				if (power >= 40) then
					self:SetAlpha(1);
				else
					self:SetAlpha(0.5);
				end
			elseif (not buff) then
				Auras:ToggleOverlayGlow(self.glow,false);
				self.CD:SetAlpha(1);
				self.CD.text:SetAlpha(1);
				if (power >= 40) then
					self:SetAlpha(1);
				else
					self:SetAlpha(0.5);
				end
			elseif (buff and UnitAffectingCombat('player')) then
				Auras:ToggleOverlayGlow(self.glow,true);
				self.CD:SetAlpha(0);
				if (power >= 20) then
					self:SetAlpha(1);
				else
					self:SetAlpha(0.5);
				end
				self.CD:SetCooldown(0,0);
				self.CD.text:SetText('');
			end
		else
			self:SetAlpha(Auras.db.char.triggers[2].OoCAlpha)
			Auras:ToggleOverlayGlow(self.glow,false);
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Sundering
SSA.Sundering:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(2)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(197214));

		Auras:SpellRangeCheck(self,197214,true,2);
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
			self:SetAlpha(Auras.db.char.triggers[2].OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Voodoo Totem
SSA.VoodooTotemEnh:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(2)) then
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
			self:SetAlpha(Auras.db.char.triggers[2].OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Wind Shear
SSA.WindShearEnh:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(2)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(57994));

		Auras:SpellRangeCheck(self,57994,true,2);
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
			self:SetAlpha(Auras.db.char.triggers[2].OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Wind Rush Totem
SSA.WindRushTotemEnh:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(2)) then
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
			self:SetAlpha(Auras.db.char.triggers[2].OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-- Windsong
SSA.Windsong:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(2)) then
		local start,duration = GetSpellCooldown(Auras:GetSpellName(201898));

		Auras:SpellRangeCheck(self,201898,true,2);
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
			self:SetAlpha(Auras.db.char.triggers[2].OoCAlpha)
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

-------------------------------------------------------------------------------------------------------
----- Build and Initialize Status Bars
-------------------------------------------------------------------------------------------------------

-- Maelstrom Bar
local MaelstromBar = CreateFrame("StatusBar","MaelstromBarEnh",AuraGroup);

MaelstromBar:SetStatusBarTexture("Interface\\addons\\ShamanAuras\\media\\statusbar\\fifths");
MaelstromBar:GetStatusBarTexture():SetHorizTile(false);
MaelstromBar:GetStatusBarTexture():SetVertTile(false);
MaelstromBar:SetPoint("CENTER",AuraGroup,"CENTER",0,-139);
MaelstromBar:SetWidth(260);
MaelstromBar:SetHeight(21);
MaelstromBar:SetFrameStrata("LOW");
MaelstromBar:SetStatusBarColor(0,0.5,1);
MaelstromBar:SetAlpha(0);

MaelstromBar.bg = MaelstromBar:CreateTexture(nil,"BACKGROUND");
MaelstromBar.bg:SetTexture("Interface\\TargetingFrame\\UI-StatusBar");
MaelstromBar.bg:SetAllPoints(true);
MaelstromBar.bg:SetVertexColor(0,0,0);
MaelstromBar.bg:SetAlpha(0.5);

MaelstromBar.text = MaelstromBar:CreateFontString(nil, "HIGH", "GameFontHighlightLarge");
MaelstromBar.text:SetPoint("CENTER",MaelstromBar,"CENTER",0,0);
MaelstromBar.text:SetTextColor(1,1,1,1);

MaelstromBar.Lightning = CreateFrame("PlayerModel","MaelstromBarEnhLightning",MaelstromBar);
MaelstromBar.Lightning:SetModel("SPELLS/LIGHTNING_AREA_DISC_STATE.m2");
MaelstromBar.Lightning:SetFrameStrata("MEDIUM");
MaelstromBar.Lightning:SetPosition(0,0,-2);
MaelstromBar.Lightning:SetAllPoints(MaelstromBar);
MaelstromBar.Lightning:SetAlpha(0);

SSA.MaelstromBarEnh = MaelstromBar;
SSA.MaelstromBarEnh:SetScript("OnUpdate",function(self,elaps)
	local _,_,classIndex = UnitClass('player');
	local spec = GetSpecialization();
	
	if (classIndex == 7 and spec == 2) then
		local isCombat = UnitAffectingCombat('player');
		local power = UnitPower('player',11);
		local maxPower = UnitPowerMax('player',11);
		local _,font = self.text:GetFont();
		
		Auras:ToggleAuraVisibility(self,true,'alpha');

		self:SetMinMaxValues(0,maxPower);
		
		if (self:GetWidth() ~= Auras.db.char.layout[2].maelstromBar.width) then
			self:SetWidth(Auras.db.char.layout[2].maelstromBar.width);
		end
		
		if (self:GetHeight() ~= Auras.db.char.layout[2].maelstromBar.height) then
			self:SetHeight(Auras.db.char.layout[2].maelstromBar.height);
		end
		
		if (font ~= Auras.db.char.layout[2].maelstromBar.textSize) then
			self.text:SetFont("Fonts\\FRIZQT__.TTF", Auras.db.char.layout[2].maelstromBar.textSize);
		end
		
		if (Auras.db.char.config[2].maelstromBar.justify == "Left") then
			self.text:ClearAllPoints();
			self.text:SetPoint("LEFT",15,0);
		elseif (Auras.db.char.config[2].maelstromBar.justify == "Center") then
			self.text:ClearAllPoints();
			self.text:SetPoint("CENTER",0,0);
		else
			self.text:ClearAllPoints();
			self.text:SetPoint("RIGHT",-15,0);
		end
		
		if (not Auras.db.char.config[2].maelstromBar.isAdjustable and not Auras.db.char.config[2].isMoving) then
			if (Auras.db.char.aura[2].MaelstromBarEnh) then
				self:SetValue(power);
				if (Auras.db.char.config[2].maelstromBar.isDisplayText) then
					self.text:SetText(power);
				else
					self.text:SetText('');
				end
				if (power >= Auras.db.char.config[2].maelstromBar.threshold and Auras.db.char.config[2].maelstromBar.animate) then
					self.Lightning:SetAlpha(Auras.db.char.config[2].maelstromBar.alphaCombat);
					self.bg:SetAlpha(Auras.db.char.config[2].maelstromBar.alphaCombat);
				else
					self.Lightning:SetAlpha(0);
					self.bg:SetAlpha(Auras.db.char.config[2].maelstromBar.alphaCombat / 2);
				end
					
				if (isCombat) then
					self:SetAlpha(1);
					self:SetAlpha(Auras.db.char.config[2].maelstromBar.alphaCombat);
					
				elseif (not isCombat and Auras:IsTargetEnemy()) then
					--MaelstromBar:SetAlpha(Auras.db.char.triggers[2].OoCAlpha);
					if (Auras.db.char.config[2].maelstromBar.alphaOoC == 0) then
						self:SetAlpha(Auras.db.char.config[2].maelstromBar.alphaTar);
						self.bg:SetAlpha(Auras.db.char.config[2].maelstromBar.alphaTar);
					else
						self:SetAlpha(Auras.db.char.config[2].maelstromBar.alphaOoC);
						self.bg:SetAlpha(Auras.db.char.config[2].maelstromBar.alphaOoC);
					end
				elseif (not isCombat and not Auras:IsTargetEnemy()) then
					--self:SetAlpha(0);
					self:SetAlpha(Auras.db.char.config[2].maelstromBar.alphaOoC);
					self.bg:SetAlpha(Auras.db.char.config[2].maelstromBar.alphaOoC);
				end
			else
				self:SetAlpha(0);
			end
		elseif (Auras.db.char.config[2].maelstromBar.isAdjustable or Auras.db.char.config[2].isMoving) then
			self:SetAlpha(Auras.db.char.config[2].maelstromBar.alphaCombat);
			self:SetValue(UnitPowerMax('player',11));
			if (Auras.db.char.config[2].maelstromBar.isDisplayText) then
				self.text:SetText(UnitPowerMax('player',11));
			else
				self.text:SetText('');
			end
		end
	else
		Auras:ToggleAuraVisibility(self,false,'alpha');
	end
end);

MaelstromBar:SetScript("OnMouseDown",function(self,button)
	if (Auras.db.char.config[2].isMoving) then
		Auras:MoveOnMouseDown(self,'enhGrp',button);
	end
end);

MaelstromBar:SetScript("OnMouseUp",function(self,button)
	if (Auras.db.char.config[2].isMoving) then
		Auras:MoveOnMouseUp(self,'enhGrp',button);
	end
end);

SSA.BuffTimerBarGrpEnh = CreateFrame("Frame","BuffTimerBarGrpEnh",AuraGroup);
local BuffTimerBarGrp = SSA.BuffTimerBarGrpEnh;
BuffTimerBarGrp:SetWidth(131);
BuffTimerBarGrp:SetHeight(180);
BuffTimerBarGrp:SetBackdrop(nil);
BuffTimerBarGrp:Show();
_G["SSA_BuffTimerGrpEnh"] = BuffTimerBarGrp;

SSA.MainTimerBarGrpEnh = CreateFrame("Frame","MainTimerBarGrpEnh",AuraGroup);
local MainTimerBarGrp = SSA.MainTimerBarGrpEnh;
MainTimerBarGrp:SetWidth(131);
MainTimerBarGrp:SetHeight(180);
BuffTimerBarGrp:SetBackdrop(nil);
MainTimerBarGrp:Show();
_G["SSA_MainTimerBarGrpEnh"] = MainTimerBarGrp;

SSA.UtilTimerBarGrpEnh = CreateFrame("Frame","UtilTimerBarGrpEnh",AuraGroup);
local UtilTimerBarGrp = SSA.UtilTimerBarGrpEnh;
UtilTimerBarGrp:SetWidth(47);
UtilTimerBarGrp:SetHeight(180);
UtilTimerBarGrp:SetBackdrop(nil);
UtilTimerBarGrp:Show();
_G["SSA_UtilTimerBarGrpEnh"] = UtilTimerBarGrp;

SSA.AscendanceBarEnh = CreateFrame("StatusBar","AscendanceBarEnh",BuffTimerBarGrp);
SSA.AstralShiftBarEnh = CreateFrame("StatusBar","AstralShiftBarEnh",BuffTimerBarGrp);
SSA.BloodlustBarEnh = CreateFrame("StatusBar","BloodlustBarEnh",BuffTimerBarGrp);
SSA.BoulderfistBar = CreateFrame("StatusBar","BoulderfistBar",MainTimerBarGrp);
SSA.CrashLightningBar = CreateFrame("StatusBar","CrashLightningBar",MainTimerBarGrp);
SSA.EarthgrabTotemBarEnh = CreateFrame("StatusBar","EarthgrabTotemBarEnh",UtilTimerBarGrp);
SSA.EarthenSpikeBar = CreateFrame("StatusBar","EarthenSpikeBar",UtilTimerBarGrp);
SSA.FlametongueBar = CreateFrame("StatusBar","FlametongueBar",MainTimerBarGrp);
SSA.FrostbrandBar = CreateFrame("StatusBar","FrostbrandBar",MainTimerBarGrp);
SSA.HeroismBarEnh = CreateFrame("StatusBar","HeroismBarEnh",BuffTimerBarGrp);
SSA.HexBarEnh = CreateFrame("StatusBar","HexBarEnh",UtilTimerBarGrp);
SSA.SpiritWalkBar = CreateFrame("StatusBar","SpiritWalkBar",BuffTimerBarGrp);
SSA.TimeWarpBarEnh = CreateFrame("StatusBar","TimeWarpBarEnh",BuffTimerBarGrp);
SSA.VoodooTotemBarEnh = CreateFrame("StatusBar","VoodooTotemBarEnh",UtilTimerBarGrp);
SSA.WindRushTotemBarEnh = CreateFrame("StatusBar","WindRushTotemBarEnh",UtilTimerBarGrp);
SSA.WindsongBar = CreateFrame("StatusBar","WindsongBar",MainTimerBarGrp);

local buffIDs = {
	[114051] = SSA.AscendanceBarEnh,
	[108271] = SSA.AstralShiftBarEnh,
	[2825]   = SSA.BloodlustBarEnh,
	[32182]  = SSA.HeroismBarEnh,
	[58875]  = SSA.SpiritWalkBar,
	[80353]  = SSA.TimeWarpBarEnh,
}
local mainIDs = {
	[218825] = SSA.BoulderfistBar,
	[187878] = SSA.CrashLightningBar,
	[194084] = SSA.FlametongueBar,
	[196834] = SSA.FrostbrandBar,
	[201898] = SSA.WindsongBar,
}
local utilIDs = {
	["Earthgrab Totem"]  = {
		[1] = false,
		[2] = SSA.EarthgrabTotemBarEnh,
		[3] = false,
	},
	--[51514]  = SSA.HexBarEle,
	["Voodoo Totem"] = {
		[1] = false,
		[2] = SSA.VoodooTotemBarEnh,
		[3] = false,
	},
	["Wind Rush Totem"] = {
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

BuffTimerBarGrp:SetScript("OnUpdate",function(self,event,...)
	if (Auras:CharacterCheck(2)) then
		Auras:ToggleAuraVisibility(self,true,'showhide');
		
		for i=1,getn(buffTable) do
			local buff,_,_,_,_,duration,expires = UnitBuff('player',Auras:GetSpellName(buffTable[i]));
			
			if (expires) then
				if (Auras.db.char.aura[2][buffIDs[buffTable[i]]:GetName()]) then
					local timer,seconds = Auras:parseTime(expires - GetTime(),true);
					
					buffIDs[buffTable[i]]:SetMinMaxValues(0,duration);
					buffIDs[buffTable[i]]:SetValue(seconds);
					buffIDs[buffTable[i]].timetext:SetText(timer);
					buffIDs[buffTable[i]]:SetPoint("LEFT",xPos[i],0);
					buffIDs[buffTable[i]]:Show();
				else
					buffIDs[buffTable[i]]:Hide();
					--table.remove(buffTable,i);
				end
			end
		end
		
		if (Auras.db.char.config[2].isMoving) then
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
	if (Auras.db.char.config[2].isMoving) then
		Auras:MoveOnMouseDown(self,'enhGrp',button);
	end
end);

BuffTimerBarGrp:SetScript("OnMouseUp",function(self,button)
	if (Auras.db.char.config[2].isMoving) then
		Auras:MoveOnMouseUp(self,'enhGrp',button);
	end
end);

MainTimerBarGrp:SetScript("OnUpdate",function(self,event,...)
	if (Auras:CharacterCheck(2)) then
		Auras:ToggleAuraVisibility(self,true,'showhide');
		
		local xPosCtr = 1;
		for i=1,getn(mainTable) do
			local buff,_,_,_,_,duration,expires = UnitBuff('player',Auras:GetSpellName(mainTable[i]));
			
			if (expires) then
				if (Auras.db.char.aura[2][mainIDs[mainTable[i]]:GetName()]) then
					local timer,seconds = Auras:parseTime(expires - GetTime(),true);
					
					mainIDs[mainTable[i]]:SetMinMaxValues(0,duration);
					mainIDs[mainTable[i]]:SetValue(seconds);
					mainIDs[mainTable[i]].timetext:SetText(timer);
					mainIDs[mainTable[i]]:SetPoint("RIGHT",(xPos[xPosCtr] * -1),0);
					mainIDs[mainTable[i]]:Show();
					xPosCtr = xPosCtr + 1;
				else
					mainIDs[mainTable[i]]:Hide();
				end
			end
		end
		
		if (Auras.db.char.config[2].isMoving) then
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
	if (Auras.db.char.config[2].isMoving) then
		Auras:MoveOnMouseDown(self,'enhGrp',button);
	end
end);

MainTimerBarGrp:SetScript("OnMouseUp",function(self,button)
	if (Auras.db.char.config[2].isMoving) then
		Auras:MoveOnMouseUp(self,'enhGrp',button);
	end
end);

UtilTimerBarGrp:SetScript("OnUpdate",function(self,event,...)
	if (Auras:CharacterCheck(2)) then
		local totemCtr = 0
		local x
		
		Auras:ToggleAuraVisibility(self,true,'showhide');
		
		utilIDs["Earthgrab Totem"][3] = false;
		utilIDs["Voodoo Totem"][3] = false;
		utilIDs["Wind Rush Totem"][3] = false;
		
		for i=1,5 do
			local _,name,start,duration = GetTotemInfo(i);
			
			if ((duration or 0) > 0 and name) then
				local timer,seconds = Auras:parseTime((start + duration) - GetTime(),true);
				
				if (Auras.db.char.aura[2][gsub(name," ","").."BarEnh"]) then
					if (utilIDs[name]) then
						utilIDs[name][3] = true;
						totemCtr = totemCtr + 1;
						
					
						if (getn(mainTable) > 0) then
							x = xOffset[getn(mainTable) + (totemCtr - 1)];
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
		
		if (Auras.db.char.config[2].isMoving) then
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
	if (Auras.db.char.config[2].isMoving) then
		Auras:MoveOnMouseDown(self,'enhGrp',button);
	end
end);

UtilTimerBarGrp:SetScript("OnMouseUp",function(self,button)
	if (Auras.db.char.config[2].isMoving) then
		Auras:MoveOnMouseUp(self,'enhGrp',button);
	end
end);

-- Doom Winds Alert Texture
local DoomWindsTex = CreateFrame("Frame","DoomWindsTex",AuraGroup);
DoomWindsTex:SetPoint("CENTER",AuraGroup,"CENTER",-150,0);
DoomWindsTex:SetWidth(125);
DoomWindsTex:SetHeight(240);
DoomWindsTex:SetFrameStrata("BACKGROUND");
--DoomWindsTex:SetStatusBarColor(1,1,1);
DoomWindsTex:SetAlpha(0);
DoomWindsTex:Show();

DoomWindsTex.texture = DoomWindsTex:CreateTexture(nil,"LOW");
DoomWindsTex.texture:SetTexture("Textures\\SpellActivationOverlays\\Dark_Tiger");
DoomWindsTex.texture:SetPoint("CENTER",DoomWindsTex,"CENTER",0,0);
DoomWindsTex.texture:SetWidth(DoomWindsTex:GetWidth() + 20);
DoomWindsTex.texture:SetHeight(DoomWindsTex:GetHeight());
--DoomWindsTex.texture:SetRotation(math.rad(-90));
DoomWindsTex.texture:SetAlpha(1);

DoomWindsTex.Scaler = DoomWindsTex:CreateAnimationGroup();
DoomWindsTex.Scaler:SetLooping("REPEAT");

local scalePush = 1.08;
local scalePull = 1 / scalePush;

DoomWindsTex.Scaler.scaleOut = DoomWindsTex.Scaler:CreateAnimation("Scale")
DoomWindsTex.Scaler.scaleOut:SetOrder(1)
DoomWindsTex.Scaler.scaleOut:SetDuration(0.5)
DoomWindsTex.Scaler.scaleOut:SetSmoothing("IN_OUT")
DoomWindsTex.Scaler.scaleOut:SetFromScale(1,1)
DoomWindsTex.Scaler.scaleOut:SetToScale(1,scalePush)
 
DoomWindsTex.Scaler.scaleIn = DoomWindsTex.Scaler:CreateAnimation("Scale")
DoomWindsTex.Scaler.scaleIn:SetOrder(2)
DoomWindsTex.Scaler.scaleIn:SetDuration(0.5)
DoomWindsTex.Scaler.scaleIn:SetSmoothing("IN_OUT")
DoomWindsTex.Scaler.scaleIn:SetFromScale(1,1)
DoomWindsTex.Scaler.scaleIn:SetToScale(1,scalePull)

DoomWindsTex:SetScript("OnUpdate",function(self)
	if (Auras:CharacterCheck(2)) then
		local buff = UnitBuff('player',Auras:GetSpellName(204945));
		
		Auras:ToggleAuraVisibility(self,true,'showhide');
		
		if ((buff and Auras.db.char.aura[2].DoomWindsTex) or Auras.db.char.config[2].isMoving) then
			if (not self.Scaler:IsPlaying()) then
				self.Scaler:Play();
			end
			
			if (UnitAffectingCombat('player')) then
				self:SetAlpha(1);
			else
				self:SetAlpha(Auras.db.char.triggers[2].OoCAlpha);
			end
		else
			self:SetAlpha(0);
			
			if (self.Scaler:IsPlaying()) then
				self.Scaler:Stop();
			end
		end
		
		if (Auras.db.char.config[2].isMoving) then
			self:SetBackdrop(backdrop);
			self:SetBackdropColor(0,0,0,0.85);
		else
			self:SetBackdrop(nil);
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

DoomWindsTex:SetScript("OnMouseDown",function(self,button)
	if (Auras.db.char.config[2].isMoving) then
		Auras:MoveOnMouseDown(self,'enhGrp',button);
	end
end);

DoomWindsTex:SetScript("OnMouseUp",function(self,button)
	if (Auras.db.char.config[2].isMoving) then
		Auras:MoveOnMouseUp(self,'enhGrp',button);
	end
end);

SSA.DoomWindsTex = DoomWindsTex;
-- Stormstrike Charges
--local buff,count
local tempX = {
	[1] = {
		[1] = 15,
		[2] = "LEFT",
	},
	[2] = {
		[1] = -15,
		[2] = "RIGHT",
	},
	[3] = {
		[1] = 0,
		[2] = "CENTER",
	},
}

local StormstrikeCharges = CreateFrame("Frame","StormstrikeChargeGrp",AuraGroup);
StormstrikeCharges:SetFrameStrata(bg);
StormstrikeCharges:SetWidth(260);
StormstrikeCharges:SetHeight(50);
StormstrikeCharges:SetPoint("CENTER",0,-100);
StormstrikeCharges:Show();

for i=1,2 do
	StormstrikeCharges["Charge"..i] = CreateFrame("Frame","StormstrikeCharge"..i,StormstrikeChargeGrp);
	StormstrikeCharges["Charge"..i]:SetWidth(100);
	StormstrikeCharges["Charge"..i]:SetHeight(100);
	StormstrikeCharges["Charge"..i]:SetPoint(tempX[i][2],StormstrikeChargeGrp,tempX[i][2],tempX[i][1],-3);
	StormstrikeCharges["Charge"..i]:SetAlpha(0);
	StormstrikeCharges["Charge"..i]:Show();

	StormstrikeCharges["Charge"..i].Lightning = CreateFrame("PlayerModel","StormstrikeCharge"..i.."_Lightning",StormstrikeCharges["Charge"..i]);
	StormstrikeCharges["Charge"..i].Lightning:SetModel("spells/Monk_chiblast_precast.m2");
	StormstrikeCharges["Charge"..i].Lightning:SetFrameStrata(low);
	StormstrikeCharges["Charge"..i].Lightning:SetPosition(0,0,0);
	StormstrikeCharges["Charge"..i].Lightning:SetAllPoints(StormstrikeCharges["Charge"..i]);
	StormstrikeCharges["Charge"..i].Lightning:SetAlpha(1);
	StormstrikeCharges["Charge"..i].Lightning:SetSequence(37);
end
StormstrikeCharges:SetScript("OnUpdate",function(self,elaps)
	if (Auras:CharacterCheck(2)) then
		local buff,_,_,count = UnitBuff('player',Auras:GetSpellName(201846));
		local _,_,_,selected = GetTalentInfo(5,1,1);
		
		Auras:ToggleAuraVisibility(self,true,'showhide');
		
		if (Auras.db.char.config[2].isMoving) then
			self.Charge1:SetAlpha(1);
			self.Charge2:SetAlpha(1);
		elseif (Auras.db.char.aura[2].StormstrikeChargeGrp) then
			if (count == 2) then
				self.Charge1:SetAlpha(1);
				self.Charge2:SetAlpha(1);
			elseif (count == 1 and selected) then
				self.Charge2:SetAlpha(0);
			elseif (count == 0 or not buff) then
				self.Charge1:SetAlpha(0);
				self.Charge2:SetAlpha(0);
			end
		end
		
		if (Auras.db.char.config[2].isMoving) then
			self:SetBackdrop(backdrop);
			self:SetBackdropColor(0,0,0,0.85);
		else
			self:SetBackdrop(nil);
		end
	else
		Auras:ToggleAuraVisibility(self,false,'showhide');
	end
end);

StormstrikeCharges:SetScript("OnMouseDown",function(self,button)
	if (Auras.db.char.config[2].isMoving) then
		Auras:MoveOnMouseDown(self,'enhGrp',button);
	end
end);

StormstrikeCharges:SetScript("OnMouseUp",function(self,button)
	if (Auras.db.char.config[2].isMoving) then
		Auras:MoveOnMouseUp(self,'enhGrp',button);
	end
end);

SSA.StormstrikeChargeGrp = StormstrikeCharges;

EventFrame:SetScript("OnEvent",function(self,event,...)
	if (Auras:CharacterCheck(2)) then
		local _,subevent,_,sGUID,source,_,_,petGUID,_,_,_,spellID = ...

		if (event ~= "COMBAT_LOG_EVENT_UNFILTERED") then
			return
		end
		
		if (sGUID == UnitGUID('player')) then
			if (subevent == "SPELL_AURA_APPLIED") then
				if (buffIDs[spellID]) then
					table.insert(buffTable,spellID);
				elseif (mainIDs[spellID]) then
					table.insert(mainTable,spellID);
				end
			elseif (subevent == "SPELL_AURA_REMOVED") then
				if (buffIDs[spellID]) then
					for i=1,getn(buffTable) do
						if (buffTable[i] == spellID) then
							table.remove(buffTable,i)
						end
					end
					buffIDs[spellID]:Hide();
				elseif (mainIDs[spellID]) then
					for i=1,getn(mainTable) do
						if (mainTable[i] == spellID) then
							table.remove(mainTable,i)
						end
					end
					mainIDs[spellID]:Hide();
				end
			end
		end
	end
end);

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
StormstrikeCharges.Charge1.Lightning:HookScript("OnUpdate", function(self, elaps)
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
StormstrikeCharges.Charge2.Lightning:HookScript("OnUpdate", function(self, elaps)
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
StormstrikeCharges.Charge3.Lightning:HookScript("OnUpdate", function(self, elaps)
	elapsed = elapsed + (elaps * 1000);
	self:SetSequenceTime(1, elapsed);
end);]]

-------------------------------------------------------------------------------------------------------
----- Build Move UI
-------------------------------------------------------------------------------------------------------

-- Initialize Check Button Frames
SSA.MoveEnh = CreateFrame("Frame","MoveEnh",UIParent);

SSA.AuraObjectsEnh = {
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
			m = 150,
		},
	},
	[10] = {
		alpha = false,
		object = DoomWindsTex,
		backdrop = 'BackdropSB',
	},
	[11] = {
		model = {
			[1] = StormstrikeCharges.Charge1,
			[2] = StormstrikeCharges.Charge2,
			[3] = StormstrikeCharges.Charge3,
		},
		object = StormstrikeChargeGrp,
		backdrop = "BackdropSB",
	},
}

SSA.MoveStringsEnh = {
	[1] = L["Move All Auras"],
	[2] = L["Move Top Auras"],
	[3] = L["Move Bottom Auras"],
	[4] = L["Move Left Auras"],
	[5] = L["Move Right Auras"],
	[6] = L["Move Buff Timer Bars"],
	[7] = L["Move Main Timer Bars"],
	[8] = L["Move Utility Timer Bars"],
	[9] = L["Move Maelstrom Bar"],
	[10] = L["Move Doom Winds"],
	[11] = L["Move Stormstrike Charges"],
}
