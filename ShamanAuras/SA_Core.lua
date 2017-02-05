--[[

]]
local FOLDER_NAME, SSA = ...

local Auras = LibStub("AceAddon-3.0"):NewAddon("ShamanAuras", "AceConsole-3.0","AceEvent-3.0", "AceHook-3.0", "AceTimer-3.0");
Auras.version = GetAddOnMetadata(FOLDER_NAME, "Version")
Auras:RegisterChatCommand("ssa","ChatCommand");
local L = LibStub("AceLocale-3.0"):GetLocale("ShamanAuras", true)

--local obj = {}
local caster,cooldown,duration = {},{},{};
local smallSpells = {};
local spellobj,totemObj,targetObj,miscObj,spells,ignoreSpells,GUIDs = {},{},{},{},{},{},{};
local loadedBuffBars,loadedMainBars,loadedUtilBars = {},{},{};
local talents,execTime = {},{};
local isFireStormElemental,isEarthElemental,isTotemMastery = false,false,false;
local spec = nil;
-- Booleans
local isIcefury = false;
local tempBool = false;



-------------------------------------------------------------------------------------------------------
----- Initialize Global Variables
-------------------------------------------------------------------------------------------------------
SSA.BackdropCB = {
	bgFile    = "Interface\\AddOns\\ShamanAuras\\media\\textures\\background_flat",
	edgeFile  = "Interface\\AddOns\\ShamanAuras\\media\\textures\\UI-Tooltip-Border",
	tile      = false,
	tileSize  = 16, 
	edgeSize  = 16, 
	insets     = {
		left = 4,
		right = 4,
		top = 4,
		bottom = 4,
	},
};

SSA.BackdropSB = {
	bgFile   = "Interface\\Tooltips\\UI-Tooltip-Background",
	edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
	tile = true,
	tileSize = 16,
	edgeSize = 10
}
SSA.BackdropFrm = {
	bgFile   = "Interface\\BUTTONS\\WHITE8X8.blp",
	edgeFile = "Interface\\BUTTONS\\WHITE8X8.blp",
	tile = false, tileSize = 0, edgeSize = 1,
	insets = { left = 0, right = 0, top = 0, bottom = 0}
}
SSA.grid = CreateFrame('Frame', 'AuraGrid', UIParent)
SSA.IsMovingAuras = false;
SSA.ButtonFont = CreateFont("SSAButtonFont");
local ButtonFont = SSA.ButtonFont;
ButtonFont:SetFont("Interface\\addons\\ShamanAuras\\Media\\fonts\\Continuum_Medium.ttf",12,"OUTLINE");
ButtonFont:SetJustifyH("CENTER");


SSA.MoveEnh = CreateFrame("Frame","MoveEnh",UIParent);
SSA.MoveRes = CreateFrame("Frame","MoveRes",UIParent);

------------------------------
--- For Debugging Purposes ---
------------------------------

SSA.ErrorFrame = CreateFrame("Frame",nil,UIParent);
_G["SSA_ErrorFrame"] = SSA.ErrorFrame;
local ErrorFrame = SSA.ErrorFrame;
ErrorFrame:SetWidth(260);
ErrorFrame:SetHeight(665);
ErrorFrame:SetPoint("TOPLEFT",UIParent,"TOPLEFT",100,-100);
ErrorFrame:SetBackdrop(SSA.BackdropSB)
ErrorFrame:SetBackdropColor(0.15,0.15,0.15,0.9);
ErrorFrame:SetBackdropBorderColor(1,1,1,1);
ErrorFrame:Hide();

ErrorFrame.text = ErrorFrame:CreateFontString(nil, "MEDIUM", "GameFontHighlightLarge");
ErrorFrame.text:SetPoint("TOPLEFT",11,-5);
ErrorFrame.text:SetFont("Interface\\addons\\ShamanAurasDev\\Media\\fonts\\courbd.ttf", 14,"NONE");
ErrorFrame.text:SetTextColor(1,1,1,1);
ErrorFrame.text:SetJustifyH("LEFT");

------------------------------
--- For Debugging Purposes ---
------------------------------
local DataFrame = CreateFrame("Frame",nil,UIParent);
DataFrame:SetWidth(700);
DataFrame:SetHeight(300);
DataFrame:SetPoint("TOPLEFT",UIParent,"TOPLEFT",100,-100);
DataFrame:SetBackdrop(SSA.BackdropSB)
DataFrame:SetBackdropColor(0.15,0.15,0.15,0.9);
DataFrame:SetBackdropBorderColor(1,1,1,1);
DataFrame:Hide();

DataFrame.text = DataFrame:CreateFontString(nil, "MEDIUM", "GameFontHighlightLarge");
DataFrame.text:SetPoint("TOPLEFT",11,-5);
DataFrame.text:SetFont("Interface\\addons\\ShamanAurasDev\\Media\\fonts\\courbd.ttf", 14,"NONE");
DataFrame.text:SetTextColor(1,1,1,1);
DataFrame.text:SetJustifyH("LEFT");

SSA.DataFrame = DataFrame;
_G["SSA_DataFrame"] = DataFrame;

-------------------------------
--- User Notification Frame ---
-------------------------------
local AlertFrame = CreateFrame("Frame","AlertFrame",UIParent)

AlertFrame:SetBackdrop(SSA.BackdropFrm);
AlertFrame:SetBackdropColor(0,0,0,0.8)
AlertFrame:SetBackdropBorderColor(0,0,0);
AlertFrame:SetPoint("CENTER",UIParent,"CENTER",0,250);
AlertFrame:Hide();

AlertFrame.header = CreateFrame("Frame",nil,AlertFrame);
AlertFrame.header:SetWidth(AlertFrame.header:GetParent():GetWidth() - 20);
AlertFrame.header:SetHeight(30);

AlertFrame.header.text = AlertFrame.header:CreateFontString(nil, "MEDIUM", "GameFontHighlightLarge");
--[[AlertFrame.header.text:SetWidth(280);
AlertFrame.header.text:SetHeight(380);]]
AlertFrame.header.text:SetPoint("TOP",AlertFrame,"TOP",0,-10);
AlertFrame.header.text:SetFont("Interface\\addons\\ShamanAuras\\Media\\fonts\\ABF.ttf", 16);
AlertFrame.header.text:SetTextColor(1,0.82,0,1);
AlertFrame.header.text:SetJustifyH("LEFT");
AlertFrame.header.text:SetJustifyV("TOP");
AlertFrame.header.text:SetText("Sweetsour's Shaman Auras");

--[[AlertFrame.footer.text = AlertFrame.header:CreateFontString(nil, "MEDIUM", "GameFontHighlightLarge");
AlertFrame.footer.text:SetPoint("TOP",AlertFrame,"TOP",0,-10);
AlertFrame.footer.text:SetFont("Interface\\addons\\ShamanAuras\\Media\\fonts\\ABF.ttf", 16);
AlertFrame.footer.text:SetTextColor(1,0.82,0,1);
AlertFrame.footer.text:SetJustifyH("LEFT");
AlertFrame.footer.text:SetJustifyV("TOP");]]

AlertFrame.inner = CreateFrame("Frame",nil,AlertFrame);
AlertFrame.inner:SetPoint("TOP",AlertFrame,"TOP",0,-40);
AlertFrame.inner:Show();

AlertFrame.inner.text = AlertFrame.inner:CreateFontString(nil, "MEDIUM", "GameFontHighlightLarge");
AlertFrame.inner.text:CanWordWrap();
--[[AlertFrame.inner.text:SetWidth(280);
AlertFrame.inner.text:SetHeight(380);]]
--AlertFrame.inner.text:SetAllPoints(AlertFrame.inner);
AlertFrame.inner.text:SetFont("Interface\\addons\\ShamanAuras\\Media\\fonts\\ABF.ttf", 13);
AlertFrame.inner.text:SetTextColor(1,0.82,0,1);
AlertFrame.inner.text:SetJustifyV("TOP");

AlertFrame.inner.texture = AlertFrame.inner:CreateTexture(nil,"BACKGROUND");
AlertFrame.inner.texture:SetAllPoints(AlertFrame.inner);

local function CreateAlert(img,text,width,height,xDiff,yDiff,xOffset,yOffset,justify)
	AlertFrame:SetWidth(width);
	AlertFrame:SetHeight(height);

	AlertFrame.inner:SetWidth(width-xDiff);
	AlertFrame.inner:SetHeight(height-yDiff);
	AlertFrame.inner.text:SetPoint("TOP",AlertFrame,"TOP",xOffset,yOffset);
	AlertFrame.inner.text:SetJustifyH(justify);
	
	if (text) then
		AlertFrame.inner.text:SetText(text);
	end

	if (img) then
		AlertFrame.inner.texture:SetTexture(img);
	end
end

function Auras:CurText(name)
	return SSA[name].text:GetText() or '';
end

local Frame = CreateFrame("Frame");
local UpdateFrame = CreateFrame("Frame");
		
-- Frame Tables
local CDFrame = {
	[1] = {
	},
	[2] = {
	},
	[3] = {
	}
}
SSA.isEoE = false;
SSA.spec = nil;
local spec = nil;
SSA.ChargeCDFrame = {
	[1] = {
	},
	[2] = {
	},
	[3] = {
	}
}

function Auras:GetMaelstromBarObj(curSpec)
	if (curSpec == 1) then
		return SSA.MaelstromBarEle,Auras.db.char.triggers.ele.maelstrom;
	elseif (curSpec == 2) then
		return SSA.MaelstromBarEnh,Auras.db.char.triggers.enh.maelstrom;
	end
end

-- Check if the current target is an enemy
local function IsEnemyTarget()
	if (UnitExists('target') and not UnitIsFriend('target','player') and not UnitIsDead('target')) then
		return true;
	else
		return false;
	end
end

-------------------------------------------------------------------------------------------------------
----- Global Functions
-------------------------------------------------------------------------------------------------------

-- Check Current Class
function Auras:CharacterCheck(curSpec,test)
	local _,_,classIndex = UnitClass('player');
	local spc = GetSpecialization();
	
	if (test == "MaelstromEle") then
		SSA.ErrorFrame.text:SetText("\n\n\nCurSpec (Ele): "..curSpec.."\n");
		SSA.ErrorFrame.text:SetText(Auras:CurText("ErrorFrame").."Spec: "..spc.."\n");
	end
	if (test == "MaelstromEnh") then
		SSA.DataFrame.text:SetText("CurSpec (Enh): "..curSpec.."\n");
		SSA.DataFrame.text:SetText(Auras:CurText("DataFrame").."Spec: "..spc.."\n");
	end
	
	if ((curSpec == spc or curSpec == 0) and classIndex == 7) then
		return true;
	else
		return false;
	end
end

-- Retrieve Spell Info Name
function Auras:GetSpellName(spellID)
	local name = GetSpellInfo(spellID);
	return name;
end

-- Show/Hide aura icons based on the current spec
function Auras:ToggleAuraVisibility(self,isEnable,visType)
	if (isEnable) then
		if (visType == "showhide") then
			if (not self:IsShown()) then
				self:Show();
			end
		elseif (visType == "alpha") then
			if (self:GetAlpha() == 0) then
				self:SetAlpha(1);
			end
		end
	else
		if (visType == "showhide") then
			if (self:IsShown()) then
				self:Hide();
			end
		elseif (visType == "alpha") then
			if (self:GetAlpha() ~= 0) then
				self:SetAlpha(0);
			end
		end
	end
end

-------------------------------------------------------------------------------------------------------
----- Local Functions
-------------------------------------------------------------------------------------------------------

-- Retrieve Specialization Name
local function GetSpecName(spec)
	if (spec == 1) then
		return "Ele";
	elseif (spec == 2) then
		return "Enh";
	elseif (spec == 3) then
		return "Res";
	end
end

-- Return data about the player and their target
local function GetTargetInfo()
	return UnitExists('target'),UnitAffectingCombat('player'),UnitIsFriend('target','player'),UnitIsDead('target')
end

-- Aura Group Builder
local function InitializeGroup(group,width,height,point,relativeTo,relativePoint,x,y,spec,name)
	if (width ~= nil) then
		group:SetWidth(width);
		group:SetHeight(height);
	end
	
	group:EnableMouse(false);
	group:SetMovable(false);
	group:RegisterForDrag("LeftButton");
	group:SetPoint(point,(SSA[relativeTo] or UIParent),relativePoint,x,y)
	if (not Auras.db.char.aura[spec][group:GetName()] or not Auras:CharacterCheck(0)) then
		group:Hide();
	end
end

function Auras:AdjustFont(self,font,size,flag)
	self:SetFont(font,size,flag);
end

function Auras:ToggleCombatStateOpacity(self,spec,isCombat)
	if (isCombat) then
		self:SetAlpha(1);
	else
		self:SetAlpha(Auras.db.char.triggers[spec].OoCAlpha);
	end
end

-- Convert time, in seconds, to a timer string
function Auras:parseTime(timer,precision)
	if (timer ~= nil and timer > 0) then
		local m,s,ms,fs = math.floor(timer / 60),math.floor(math.fmod(timer,60)),(("%%.%df"):format(1)):format(math.fmod(timer,60),1),timer;

		if (m >= 1 and s == 0) then
			return m..":00",fs;
		else
			if (m > 0) then
				m = m..":";
				if (s < 10) then
					s = "0"..s;
				end
			else
				m = '';
				if (s < 0) then
					s = '';
				end
			end
		end
		if (precision and tonumber(s) < 60) then
			return m..ms,fs;
		else
			return m..s,fs;
		end
	else
		return 0,0;
	end
end

function Auras:AdjustAuraSize(self,spec,object)
	if (self:GetWidth() ~= Auras.db.char.layout[spec][object].width) then
		self:SetWidth(Auras.db.char.layout[spec][object].width);
	end
	
	if (self:GetHeight() ~= Auras.db.char.layout[spec][object].height) then
		self:SetHeight(Auras.db.char.layout[spec][object].height);
	end
end

function Auras:ToggleCooldownSwipe(self,arg1)
	local cooldown = _G[self:GetName()];
	if (not arg1) then
		cooldown:SetSwipeColor(0,0,0,0);
		--cooldown.text:Hide();
	else
		cooldown:SetSwipeColor(1,1,1,1);
		--cooldown.text:Show();
	end
	cooldown:SetDrawSwipe(arg1)
	cooldown:SetDrawEdge(arg1)
	cooldown:SetDrawBling(arg1)
end

function Auras:ExecuteCooldown(self,start,duration,isSmallAura,isHideText)
	local expires = start + duration;
	local timer = expires - GetTime();
	local remaining,seconds = Auras:parseTime(timer,false);
	local fontSize

	if (isSmallAura) then
		if (seconds > 60) then
			fontSize = 10;
		else
			fontSize = 16;
		end
	else
		if (seconds > 60) then
			fontSize = 14;
		else
			fontSize = 18;
		end
	end
	
	self.CD.text:SetFont("Interface\\addons\\ShamanAuras\\media\\fonts\\PT_Sans_Narrow.TTF",fontSize,"OUTLINE");
	
	self.CD:SetCooldown(start,duration)
	--self.CD:Show();
	
	if (not isHideText and Auras.db.char.cooldowns.numbers) then
		self.CD.text:SetText(Auras:parseTime(timer,false));
	else
		self.CD.text:SetText('');
	end
	
	if (Auras.db.char.cooldowns.sweep) then
		Auras:ToggleCooldownSwipe(self.CD,true)
	else
		Auras:ToggleCooldownSwipe(self.CD,false)
	end
end

-- Return the number of charges an ability currently has by spellID
local function SpellCharges(spellid)
	local charges,maxcharges = GetSpellCharges(spellid);
	local isMaxCharge = false;
	
	if (charges == maxcharges) then
		isMaxCharge = true;
	end
	
	if ((charges or 0) > 0) then
		return charges,isMaxCharge;
	else
		return nil,false;
	end
end

function Auras:IsTargetEnemy()
	if (UnitExists('target') and not UnitIsFriend('target','player') and not UnitIsDead('target')) then
		return true;
	else
		return false;
	end
end

function Auras:IsTargetFriendly()
	if (UnitExists('target') and UnitIsFriend('target','player') and not UnitIsDead('target')) then
		return true;
	else
		return false;
	end
end

function Auras:SpellRangeCheck(self,spellID,flag)
	if (Auras:IsTargetEnemy() and flag) then
		if (IsSpellInRange(Auras:GetSpellName(spellID)) == 1) then
			self.texture:SetDesaturated(false);
			self.texture:SetVertexColor(1,1,1,1);
		else
			self.texture:SetDesaturated(true);
			self.texture:SetVertexColor(Auras.db.char.triggers.ele.OoRColor.r,Auras.db.char.triggers.ele.OoRColor.g,Auras.db.char.triggers.ele.OoRColor.b,1);
		end
	elseif (Auras:IsTargetEnemy() and not flag) then
		self.texture:SetDesaturated(true);
		self.texture:SetVertexColor(0.5,0.5,0.5,1);
	else
		self.texture:SetDesaturated(false);
		self.texture:SetVertexColor(1,1,1,1);
	end
end

function Auras:ShiftPressCheck(self)
	if (IsShiftKeyDown()) then
		self.shift = true;
	else
		self.shift = false;
	end
end

function Auras:ResetAuraGroupPosition(self,grp,name)
	local frame = Auras.db.char.frames.defaultPos[grp][name];
	self:SetPoint(frame.point,SSA[frame.relativeTo],frame.relativePoint,frame.x,frame.y);
end

function Auras:MoveOnMouseDown(self,grp,button)
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
			self:SetPoint("CENTER",self:GetParent(),"CENTER",0,y);
		elseif (button == "RightButton") then
			self:SetPoint("CENTER",self:GetParent(),"CENTER",x,0);
		elseif (button == "MiddleButton") then
			self:SetPoint("CENTER",self:GetParent(),"CENTER",0,0);
		end
	elseif (not IsShiftKeyDown() and IsControlKeyDown() and button == "RightButton") then
		Auras:ResetAuraGroupPosition(self,grp,self:GetName())
	end
end

function Auras:MoveOnMouseUp(self,grp,button)
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



function Auras:ParseClick(isClicked,button,spec)
	Auras.db.char.layout[spec][button] = isClicked;
end

local function GetVersionNumber()
	return tonumber(string.sub(Auras.version,2,3));	
end
-- Toggle Button Glow Animation
function Auras:ToggleOverlayGlow(object,toggle,enemyCheck)

	if (enemyCheck and not UnitIsFriend('target','player')) then
		if (toggle) then
			LibStub("LibButtonGlow-1.0").ShowOverlayGlow(object);
		else
			LibStub("LibButtonGlow-1.0").HideOverlayGlow(object);
		end
	else
		if (toggle) then
			LibStub("LibButtonGlow-1.0").ShowOverlayGlow(object);
		else
			LibStub("LibButtonGlow-1.0").HideOverlayGlow(object);
		end
	end
end

-- Event: ADDON_LOADED
function Auras:OnInitialize()
	local defaults = {
		char = {
			isR42FirstLoad = true,
			version = nil,
			name = nil,
			isEleFirst = true,
			isEnhFirst = true,
			isResFirst = true,
			isMoveGrid = true,
			cooldowns = {
				numbers = true,
				sweep = true,
			},
			info = {
				totems = {
					eShield = {
					},
					cBurst = {
						absorb = 0;
					}
				}
			},
			layout = {
				LeftButton = false,
				MiddleButton = false,
				RightButton = false,
				isShiftDown = false,
				isCtrlDown = false,
				[1] = {
					isMoving = false,	
					primary = {
						top = {
							icon = 32,
							spacing = 50,
							charges = 13.5,
						},
						bottom = {
							icon = 32,
							spacing = 50,
							charges = 13.5,
						},
					},
					secondary = {
						left = {
							icon = 25,
							spacing = 30,
							charges = 13.5,
						},
						right = {
							icon = 25,
							spacing = 30,
							charges = 13.5,
						},
					},
					maelstromBar = {
						isAdjustable = false,
						width = 260,
						height = 21,
					},
					icefuryBar = {
						isAdjustable = false,
						width = 260,
						height = 21,
					},
				},
				[2] = {
					isMoving = false,
					primary = {
						top = {
							icon = 32,
							spacing = 50,
							charges = 13.5,
						},
						bottom = {
							icon = 32,
							spacing = 50,
							charges = 13.5,
						},
					},
					secondary = {
						left = {
							icon = 25,
							spacing = 30,
							charges = 13.5,
						},
						right = {
							icon = 25,
							spacing = 30,
							charges = 13.5,
						},
					},
					maelstromBar = {
						isAdjustable = false,
						width = 260,
						height = 21,
					},
				},
				[3] = {
					isMoving = false,
					primary = {
						top = {
							icon = 32,
							spacing = 50,
							charges = 13.5,
						},
						bottom = {
							icon = 32,
							spacing = 50,
							charges = 13.5,
						},
					},
					secondary = {
						left = {
							icon = 25,
							spacing = 30,
							charges = 13.5,
						},
						right = {
							icon = 25,
							spacing = 30,
							charges = 13.5,
						},
					},
					earthenShieldBar = {
						isAdjustable = false,
						width = 260,
						height = 21,
					},
					tidalWavesBar = {
						emptyColor = {
							r = 1,
							g = 0,
							b = 0,
							a = 1,
						},
						isAdjustable = false,
						width = 225,
						height = 7,
					},
				},
				default = {
					primary = {
						top = {
							icon = 32,
							spacing = 50,
							charges = 13.5,
						},
						bottom = {
							icon = 32,
							spacing = 50,
							charges = 13.5,
						},
					},
					secondary = {
						left = {
							icon = 25,
							spacing = 30,
							charges = 13.5,
						},
						right = {
							icon = 25,
							spacing = 30,
							charges = 13.5,
						},
					},
					LargeBar = {
						width = 260,
						height = 21,
					},
					SmallBar = {
						width = 225,
						height = 7,
					},
				},
			},
			triggers = {
				gridPreview = false,
				gridColor = {
					r = 0,
					g = 0,
					b = 0,
					a = 1,
				},
				axisColor = {
					r = 1,
					g = 0,
					b = 0,
					a = 1,
				},
				ele = {
					MaelstromAnim = true,
					maelstromAlphaOoC = 0,
					maelstromAlphaTar = 0.5,
					maelstromAlphaCombat = 1,
					maelstrom = 90,
					flameShock = 10,
					totemMastery = 15,
					OoCAlpha = 0.5,
					OoRColor = {
						r = 1,
						g = 0,
						b = 0,
						a = 1,
					}
				},
				enh = {
					MaelstromAnim = true,
					maelstromAlphaOoC = 0,
					maelstromAlphaTar = 0.5,
					maelstromAlphaCombat = 1,
					boulderfist = 5,
					maelstrom = 130,
					flametongue = 5,
					frostbrand = 5,
					OoCAlpha = 0.5,
					OoRColor = {
						r = 1,
						g = 0,
						b = 0,
						a = 1,
					}
				},
				res = {
					CombatTidalWaveDisplay = "Always",
					OoCTidalWaveDisplay = "Target & On Heal",
					TidalWaveTime = 5,
					OoCAlpha = 0.5,
					cloudburst = 300000,
					flameShock = 10,
					OoRColor = {
						r = 1,
						g = 0,
						b = 0,
						a = 1,
					},
					animTidalWaves = true,
				},
				default = {
					gridPreview = false,
					gridColor = {
						r = 0,
						g = 0,
						b = 0,
						a = 1,
					},
					axisColor = {
						r = 1,
						g = 0,
						b = 0,
						a = 1,
					},
					ele = {
						MaelstromAnim = true,
						maelstrom = 90,
						flameShock = 10,
						totemMastery = 15,
						OoCAlpha = 0.5,
						OoRColor = {
							r = 1,
							g = 0,
							b = 0,
							a = 1,
						},
					},
					enh = {
						MaelstromAnim = true,
						maelstrom = 130,
						boulderfist = 5,
						flametongue = 5,
						frostbrand = 5,
						OoCAlpha = 0.5,
						OoRColor = {
							r = 1,
							g = 0,
							b = 0,
							a = 1,
						}
					},
					res = {
						CombatTidalWaveDisplay = "Always",
						OoCTidalWaveDisplay = "Target & On Heal",
						TidalWaveTime = 5,
						OoCAlpha = 0.5,
						cloudburst = 300000,
						flameShock = 10,
						OoRColor = {
							r = 1,
							g = 0,
							b = 0,
							a = 1,
						},
						animTidalWaves = true,
					},
				},
			},
			aura = {
				--minor = {
					[1] = {
						AncestralGuidanceEle = true,
						AncestralGuidanceBarEle = true,
						AscendanceEle = true,
						AscendanceBarEle = true,
						AstralShiftEle = true,
						AstralShiftBarEle = true,
						AuraGroupEle = true,
						Bloodlust = true,
						BloodlustBarEle = true,
						BuffTimerBarGrpEle = true,
						CleanseSpiritEle = true,
						EarthElemental = true,
						EarthElementalBar = true,
						EarthgrabTotemEle = true,
						EarthgrabTotemBarEle = true,
						Earthquake = true,
						EarthShock = true,
						EarthShockGlow = true,
						ElementalBlast = true,
						ElementalBlastCritBar = true,
						ElementalBlastHasteBar = true,
						ElementalBlastMasteryBar = true,
						ElementalMastery = true,
						ElementalMasteryBar = true,
						FireElemental = true,
						FireElementalBar = true,
						FlameShock = true,
						FlameShockGlow = true,
						FrostShock = true,
						GustWindEle = true,
						HeroismBarEle = true,
						HexEle = true,
						HexBarEle = true,
						Icefury = true,
						IcefuryBar = true,
						LargeIconGrpBotEle = true,
						LargeIconGrpTopEle = true,
						LavaBurstEle = true,
						LavaBurstEleGlow = true,
						LavaBurstEleCharges = true,
						LavaSurgeEle = true,
						--LavaSurgeBar = true,
						LightningSurgeTotemEle = true,
						LightningSurgeTotemBarEle = true,
						LiquidMagmaTotem = true,
						LiquidMagmaTotemBar = true,
						MaelstromBarEle = true,
						MainTimerBarGrpEle = true,
						SmallIconGrpLeftEle = true,
						SmallIconGrpRightEle = true,
						StormElemental = true,
						StormElementalBar = true,
						Stormkeeper = true,
						StormkeeperChargeGrp = true,
						TimeWarpBarEle = true,
						Thunderstorm = true,
						TotemGroupEle = true,
						TotemMastery = true,
						TotemMasteryTexture = true,
						UtilTimerBarGrpEle = true,
						VoodooTotemEle = true,
						VoodooTotemBarEle = true,
						WindRushTotemEle = true,
						WindRushTotemBarEle = true,
						WindShearEle = true
					},
					[2] = {
						AscendanceEnh = true,
						AscendanceBarEnh = true,
						AstralShiftEnh = true,
						AstralShiftBarEnh = true,
						AuraGroupEnh = true,
						BloodlustEnh = true,
						BloodlustBarEnh = true,
						Boulderfist = true,
						BoulderfistBar = true,
						BoulderfistGlow = true,
						BoulderfistCharges = true,
						BuffTimerBarGrpEnh = true,
						CleanseSpiritEnh = true,
						CrashLightning = true,
						CrashLightningBar = true,
						CrashLightningGlow = true,
						DoomWinds = true,
						DoomWindsTex = true,
						EarthenSpike = true,
						EarthenSpikeBar = true,
						EarthgrabTotemEnh = true,
						EarthgrabTotemBarEnh = true,
						FeralLunge = true,
						FeralSpirit = true,
						FeralSpiritBar = true,
						Flametongue = true,
						FlametongueBar = true,
						FlametongueGlow = true,
						Frostbrand = true,
						FrostbrandBar = true,
						FrostbrandGlow = true,
						HeroismBarEng = true,
						HexEnh = true,
						HexBarEnh = true,
						LargeIconGrpBotEnh = true,
						LargeIconGrpTopEnh = true,
						LavaLash = true,
						LightningSurgeTotemEnh = true,
						LightningSurgeTotemBarEnh = true,
						MaelstromBarEnh = true,
						MainTimerBarGrpEnh = true,
						Rainfall = true,
						SmallIconGrpLeftEnh = true,
						SmallIconGrpRightEnh = true,
						SpiritWalk = true,
						SpiritWalkBar = true,
						Stormstrike = true,
						StormstrikeChargeGrp = true,
						StormstrikeChargesText = false,
						StormstrikeGlow = true,
						Sundering = true,
						TimeWarpBarEnh = true,
						UtilTimerBarGrpEnh = true,
						VoodooTotemEnh = true,
						VoodooTotemBarEnh = true,
						WindRushTotemEnh = true,
						WindRushTotemBarEnh = true,
						WindShearEnh = true,
						Windsong = true,
						WindsongBar = true,
						WindsongGlow = true,
					},
					[3] = {
						AncestralGuidanceRes = true,
						AncestralGuidanceBarRes = true,
						AncestralProtectionTotem = true,
						AncestralProtectionTotemBar = true,
						AscendanceRes = true,
						AscendanceBarRes = true,
						AstralShiftRes = true,
						AstralShiftBarRes = true,
						AuraGroupRes = true,
						--Bloodlust = true,
						BloodlustBarRes = true,
						BuffTimerBarGrpRes = true,
						Cloudburst = true,
						CloudburstAbsorbBar = true,
						CloudburstTotem = true,
						CloudburstTotemBar = true,
						EarthenShieldTotem = true,
						EarthenShieldTotemBar = true,
						EarthgrabTotemRes = true,
						EarthgrabTotemBarRes = true,
						FlameShockRes = true,
						FlameshockResGlow = true,
						GiftOfQueen = true,
						GustWindRes = true,
						HealingRain = true,
						HealingStreamTotem = true,
						HealingStreamTotemBar = true,
						HealingStreamTotemOneBar = true,
						HealingStreamTotemTwoBar = true,
						HealingStreamCharges = true,
						HealingTideTotem = true,
						HealingTideTotemBar = true,
						HeroismBarRes = true,
						HexRes = true,
						HexBarRes = true,
						LargeIconGrpBotRes = true,
						LargeIconGrpTopRes = true,
						LavaBurstRes = true,
						LavaBurstResGlow = true,
						LavaBurstResCharges = true,
						LavaSurgeRes = true,
						--LavaSurgeBarRes = true,
						LightningSurgeTotemRes = true,
						LightningSurgeTotemBarRes = true,
						MainTimerBarGrpRes = true,
						PurifySpirit = true,
						Riptide = true,
						RiptideCharge = true,
						SmallIconGrpLeftRes = true,
						SmallIconGrpRightRes = true,
						SpiritLinkTotem = true,
						SpiritLinkTotemBar = true,
						SpiritwalkersGrace = true,
						SpiritwalkersGraceBar = true,
						TidalWaves = true,
						TidalWavesBar = true,
						TidalWavesCharges = true,
						Undulation = true,
						UnleashLife = true,
						UnleashLifeBar = true,
						UtilTimerBarGrpRes = true,
						VoodooTotemRes = true,
						VoodooTotemBarRes = true,
						Wellspring = true,
						WindRushTotemRes = true,
						WindRushTotemBarRes = true,
						WindShearRes = true,
					},
				--},
			},
			frames = {
				timerbars = {
					buff = {
						[1] = true,
						[2] = true,
						[3] = true,
					},
					main = {
						[1] = true,
						[2] = true,
						[3] = true,
					},
					util = {
						[1] = true,
						[2] = true,
						[3] = true,
					},
				},
				eleGrp = {
					enabled = true,
					AuraGroupEle = {
						point = "CENTER",
						relativeTo = nil,
						relativePoint = "CENTER",
						x = 0,
						y = 0,
						width = (GetScreenWidth() - 500),
						height = (GetScreenHeight() - 250),
					},
					LargeIconGrpTopEle = {
						point = "CENTER",
						relativeTo = "AuraGroupEle",
						relativePoint = "CENTER",
						x = 0,
						y = -180,
						width = 250,
						height = 50,
					},
					LargeIconGrpBotEle = {
						point = "CENTER",
						relativeTo = "AuraGroupEle",
						relativePoint = "CENTER",
						x = 0,
						y = -225,
						width = 250,
						height = 50,
					},
					SmallIconGrpLeftEle = {
						point = "CENTER",
						relativeTo = "AuraGroupEle",
						relativePoint = "CENTER",
						x = -175,
						y = -170,
						width = 35,
						height = 160,
					},
					SmallIconGrpRightEle = {
						point = "CENTER",
						relativeTo = "AuraGroupEle",
						relativePoint = "CENTER",
						x = 175,
						y = -170,
						width = 35,
						height = 160,
					},
					BuffTimerBarGrpEle = {
						point = "CENTER",
						relativeTo = "AuraGroupEle",
						relativePoint = "CENTER",
						x = 250,
						y = -125,
						width = 115,
						height = 180,
					},
					MainTimerBarGrpEle = {
						point = "CENTER",
						relativeTo = "AuraGroupEle",
						relativePoint = "CENTER",
						x = -250,
						y = -125,
						width = 90,
						height = 180,
					},
					UtilTimerBarGrpEle = {
						point = "CENTER",
						relativeTo = "AuraGroupEle",
						relativePoint = "CENTER",
						x = -240,
						y = -125,
						width = 70,
						height = 180,
					},
					MaelstromBarEle = {
						point = "CENTER",
						relativeTo = "AuraGroupEle",
						relativePoint = "CENTER",
						x = 0,
						y = -139,
						width = nil,
						height = nil,
						alpha = 0.5,
					},
					IcefuryBar = {
						point = "CENTER",
						relativeTo = "AuraGroupEle",
						relativePoint = "CENTER",
						x = 0,
						y = -110,
						width = nil,
						height = nil,
						alpha = 0.9,
					},
					TotemGroupEle = {
						point = "CENTER",
						relativeTo = "AuraGroupEle",
						relativePoint = "CENTER",
						x = -200,
						y = 0,
						width = 200,
						height = 50,
						BackdropColor = {
							r = 0.15,
							g = 0.15,
							b = 0.15,
							a = 0.6,
						}
					},
					TotemMastery = {
						point = "CENTER",
						relativeTo = "AuraGroupEle",
						relativePoint = "CENTER",
						x = 0,
						y = -210,
						width = nil,
						height = nil,
					},
					StormkeeperChargeGrp = {
						point = "CENTER",
						relativeTo = "AuraGroupEle",
						relativePoint = "CENTER",
						x = 0,
						y = -110,
						width = 260,
						height = 50,
					}
				},
				enhGrp = {
					enabled = true,
					AuraGroupEnh = {
						point = "CENTER",
						relativeTo = nil,
						relativePoint = "CENTER",
						x = 0,
						y = 0,
						width = (GetScreenWidth() - 500),
						height = (GetScreenHeight() - 250),
					},
					LargeIconGrpTopEnh = {
						point = "CENTER",
						relativeTo = "AuraGroupEnh",
						relativePoint = "CENTER",
						x = 0,
						y = -180,
						width = 250,
						height = 50,
					},
					LargeIconGrpBotEnh = {
						point = "CENTER",
						relativeTo = "AuraGroupEnh",
						relativePoint = "CENTER",
						x = 0,
						y = -225,
						width = 250,
						height = 50,
					},
					SmallIconGrpLeftEnh = {
						point = "CENTER",
						relativeTo = "AuraGroupEnh",
						relativePoint = "CENTER",
						x = -175,
						y = -170,
						width = 35,
						height = 160,
					},
					SmallIconGrpRightEnh = {
						point = "CENTER",
						relativeTo = "AuraGroupEnh",
						relativePoint = "CENTER",
						x = 175,
						y = -170,
						width = 35,
						height = 160,
					},
					BuffTimerBarGrpEnh = {
						point = "CENTER",
						relativeTo = "AuraGroupEnh",
						relativePoint = "CENTER",
						x = 257,
						y = -125,
						width = 131,
						height = 180,
					},
					MainTimerBarGrpEnh = {
						point = "CENTER",
						relativeTo = "AuraGroupEnh",
						relativePoint = "CENTER",
						x = -257,
						y = -125,
						width = 131,
						height = 180,
					},
					UtilTimerBarGrpEnh = {
						point = "CENTER",
						relativeTo = "AuraGroupEnh",
						relativePoint = "CENTER",
						x = -215,
						y = -125,
						width = 47,
						height = 180,
					},
					MaelstromBarEnh = {
						point = "CENTER",
						relativeTo = "AuraGroupEnh",
						relativePoint = "CENTER",
						x = 0,
						y = -139,
						width = nil,
						height = nil,
					},
					StormstrikeChargeGrp = {
						point = "CENTER",
						relativeTo = "AuraGroupEnh",
						relativePoint = "CENTER",
						x = 0,
						y = -100,
						width = 260,
						height = 50,
					},
					DoomWindsTex = {
						point = "CENTER",
						relativeTo = "AuraGroupEnh",
						relativePoint = "CENTER",
						x = -150,
						y = 0,
						width = 125,
						height = 240,
					},
				},
				resGrp = {
					enabled = true,
					AuraGroupRes = {
						point = "CENTER",
						relativeTo = nil,
						relativePoint = "CENTER",
						x = 0,
						y = 0,
						width = (GetScreenWidth() - 500),
						height = (GetScreenHeight() - 250),
					},
					LargeIconGrpTopRes = {
						point = "CENTER",
						relativeTo = "AuraGroupRes",
						relativePoint = "CENTER",
						x = 0,
						y = -180,
						width = 250,
						height = 50,
					},
					LargeIconGrpBotRes = {
						point = "CENTER",
						relativeTo = "AuraGroupRes",
						relativePoint = "CENTER",
						x = 0,
						y = -225,
						width = 250,
						height = 50,
					},
					SmallIconGrpLeftRes = {
						point = "CENTER",
						relativeTo = "AuraGroupRes",
						relativePoint = "CENTER",
						x = -175,
						y = -170,
						width = 35,
						height = 160,
					},
					SmallIconGrpRightRes = {
						point = "CENTER",
						relativeTo = "AuraGroupRes",
						relativePoint = "CENTER",
						x = 175,
						y = -170,
						width = 35,
						height = 160,
					},
					BuffTimerBarGrpRes = {
						point = "CENTER",
						relativeTo = "AuraGroupRes",
						relativePoint = "CENTER",
						x = 257,
						y = -125,
						width = 131,
						height = 180,
					},
					MainTimerBarGrpRes = {
						point = "CENTER",
						relativeTo = "AuraGroupRes",
						relativePoint = "CENTER",
						x = -244,
						y = -125,
						width = 105,
						height = 180,
					},
					UtilTimerBarGrpRes = {
						point = "CENTER",
						relativeTo = "AuraGroupRes",
						relativePoint = "CENTER",
						x = -215,
						y = -125,
						width = 47,
						height = 180,
					},
					EarthenShieldTotemBar = {
						point = "CENTER",
						relativeTo = "AuraGroupRes",
						relativePoint = "CENTER",
						x = 0,
						y = -139,
						width = nil,
						height = nil,
					},
					TidalWavesBar = {
						point = "CENTER",
						relativeTo = "AuraGroupRes",
						relativePoint = "CENTER",
						x = 0,
						y = -202,
						width = nil,
						height = nil,
					},
					Cloudburst = {
						point = "CENTER",
						relativeTo = "AuraGroupRes",
						relativePoint = "CENTER",
						x = -200,
						y = 0,
						width = 150,
						height = 40,
						BackdropColor = {
							r = 0.15,
							g = 0.15,
							b = 0.15,
							a = 0.6,
						}
					},
					Undulation = {
						point = "CENTER",
						relativeTo = "AuraGroupRes",
						relativePoint = "CENTER",
						x = 0,
						y = -275,
						width = nil,
						height = nil,
					},
				},
				defaultPos = {
					eleGrp = {
						AuraGroupEle = {
							point = "CENTER",
							relativeTo = nil,
							relativePoint = "CENTER",
							x = 0,
							y = 0,
						},
						LargeIconGrpTopEle = {
							point = "CENTER",
							relativeTo = "AuraGroupEle",
							relativePoint = "CENTER",
							x = 0,
							y = -180,
						},
						LargeIconGrpBotEle = {
							point = "CENTER",
							relativeTo = "AuraGroupEle",
							relativePoint = "CENTER",
							x = 0,
							y = -225,
						},
						SmallIconGrpLeftEle = {
							point = "CENTER",
							relativeTo = "AuraGroupEle",
							relativePoint = "CENTER",
							x = -175,
							y = -170,
						},
						SmallIconGrpRightEle = {
							point = "CENTER",
							relativeTo = "AuraGroupEle",
							relativePoint = "CENTER",
							x = 175,
							y = -170,
						},
						BuffTimerBarGrpEle = {
							point = "CENTER",
							relativeTo = "AuraGroupEle",
							relativePoint = "CENTER",
							x = 250,
							y = -125,
						},
						MainTimerBarGrpEle = {
							point = "CENTER",
							relativeTo = "AuraGroupEle",
							relativePoint = "CENTER",
							x = -250,
							y = -125,
						},
						UtilTimerBarGrpEle = {
							point = "CENTER",
							relativeTo = "AuraGroupEle",
							relativePoint = "CENTER",
							x = -240,
							y = -125,
						},
						MaelstromBarEle = {
							point = "CENTER",
							relativeTo = "AuraGroupEle",
							relativePoint = "CENTER",
							x = 0,
							y = -139,
						},
						IcefuryBar = {
							point = "CENTER",
							relativeTo = "AuraGroupEle",
							relativePoint = "CENTER",
							x = 0,
							y = -110,
						},
						TotemMastery = {
							point = "CENTER",
							relativeTo = "AuraGroupEle",
							relativePoint = "CENTER",
							x = 0,
							y = -210,
						},
						--[[LavaSurgeEle = {
							point = "CENTER",
							relativeTo = "AuraGroupEle",
							relativePoint = "CENTER",
							x = -130,
							y = 0,
						},]]
						StormkeeperChargeGrp = {
							point = "CENTER",
							relativeTo = "AuraGroupEle",
							relativePoint = "CENTER",
							x = 0,
							y = -110,
						}
					},
					enhGrp = {
						AuraGroupEnh = {
							point = "CENTER",
							relativeTo = nil,
							relativePoint = "CENTER",
							x = 0,
							y = 0,
						},
						LargeIconGrpTopEnh = {
							point = "CENTER",
							relativeTo = "AuraGroupEnh",
							relativePoint = "CENTER",
							x = 0,
							y = -180,
						},
						LargeIconGrpBotEnh = {
							point = "CENTER",
							relativeTo = "AuraGroupEnh",
							relativePoint = "CENTER",
							x = 0,
							y = -225,
						},
						SmallIconGrpLeftEnh = {
							point = "CENTER",
							relativeTo = "AuraGroupEnh",
							relativePoint = "CENTER",
							x = -175,
							y = -170,
						},
						SmallIconGrpRightEnh = {
							point = "CENTER",
							relativeTo = "AuraGroupEnh",
							relativePoint = "CENTER",
							x = 175,
							y = -170,
						},
						BuffTimerBarGrpEnh = {
							point = "CENTER",
							relativeTo = "AuraGroupEnh",
							relativePoint = "CENTER",
							x = 257,
							y = -125,
						},
						MainTimerBarGrpEnh = {
							point = "CENTER",
							relativeTo = "AuraGroupEnh",
							relativePoint = "CENTER",
							x = -257,
							y = -125,
						},
						UtilTimerBarGrpEnh = {
							point = "CENTER",
							relativeTo = "AuraGroupEnh",
							relativePoint = "CENTER",
							x = -215,
							y = -125,
						},
						MaelstromBarEnh = {
							point = "CENTER",
							relativeTo = "AuraGroupEnh",
							relativePoint = "CENTER",
							x = 0,
							y = -139,
						},
						StormstrikeChargeGrp = {
							point = "CENTER",
							relativeTo = "AuraGroupEnh",
							relativePoint = "CENTER",
							x = 0,
							y = -100,
						},
						DoomWindsTex = {
							point = "CENTER",
							relativeTo = "AuraGroupEnh",
							relativePoint = "CENTER",
							x = -150,
							y = 0,
						},
					},
					resGrp = {
						AuraGroupRes = {
							point = "CENTER",
							relativeTo = nil,
							relativePoint = "CENTER",
							x = 0,
							y = 0,
						},
						LargeIconGrpTopRes = {
							point = "CENTER",
							relativeTo = "AuraGroupRes",
							relativePoint = "CENTER",
							x = 0,
							y = -180,
						},
						LargeIconGrpBotRes = {
							point = "CENTER",
							relativeTo = "AuraGroupRes",
							relativePoint = "CENTER",
							x = 0,
							y = -225,
						},
						SmallIconGrpLeftRes = {
							point = "CENTER",
							relativeTo = "AuraGroupRes",
							relativePoint = "CENTER",
							x = -175,
							y = -170,
						},
						SmallIconGrpRightRes = {
							point = "CENTER",
							relativeTo = "AuraGroupRes",
							relativePoint = "CENTER",
							x = 175,
							y = -170,
						},
						BuffTimerBarGrpRes = {
							point = "CENTER",
							relativeTo = "AuraGroupRes",
							relativePoint = "CENTER",
							x = 257,
							y = -125,
						},
						MainTimerBarGrpRes = {
							point = "CENTER",
							relativeTo = "AuraGroupRes",
							relativePoint = "CENTER",
							x = -244,
							y = -125,
						},
						UtilTimerBarGrpRes = {
							point = "CENTER",
							relativeTo = "AuraGroupRes",
							relativePoint = "CENTER",
							x = -215,
							y = -125,
						},
						EarthenShieldTotemBar = {
							point = "CENTER",
							relativeTo = "AuraGroupRes",
							relativePoint = "CENTER",
							x = 0,
							y = -139,
						},
						TidalWavesBar = {
							point = "CENTER",
							relativeTo = "AuraGroupRes",
							relativePoint = "CENTER",
							x = 0,
							y = -202,
						},
						Cloudburst = {
							point = "CENTER",
							relativeTo = "AuraGroupRes",
							relativePoint = "CENTER",
							x = 150,
							y = 0,
						},
						Undulation = {
							point = "CENTER",
							relativeTo = "AuraGroupRes",
							relativePoint = "CENTER",
							x = 0,
							y = -275,
						},
					},
				},
			},
		}
	}
	
	local about_panel = LibStub:GetLibrary("LibAboutPanel", true)

	if about_panel then
		self.optionsFrame = about_panel.new(nil, "ShamanAuras")
	end
	
	self.db = LibStub("AceDB-3.0"):New("SSA_db",defaults);
	self:SetupOptions();
	
	
end

-- Event: PLAYER_LOGIN
function Auras:OnEnable()
	local _,_,classIndex = UnitClass('player');
	--self:RegisterEvent("SPELL_UPDATE_COOLDOWN");
	self:RegisterEvent("PLAYER_LEVEL_UP");
	self:RegisterEvent("PLAYER_REGEN_DISABLED");
	self:RegisterEvent("PLAYER_TALENT_UPDATE");
	
	-- Check if cooldowns value is table
	if (type(Auras.db.char.cooldowns.numbers) == "table") then
		Auras.db.char.cooldowns.numbers = true;
	end
	--self:RegisterEvent("SPELL_UPDATE_CHARGES","ChargeCooldown");

	--InterfaceOptionsFrame:HookScript("OnShow",function(self)
		--if (not InterfaceOptionsFrame:IsMovable()) then
			
			InterfaceOptionsFrame:EnableMouse(true);
			InterfaceOptionsFrame:SetMovable(true);
			InterfaceOptionsFrame:RegisterForDrag("LeftButton");
			InterfaceOptionsFrame:SetUserPlaced(true);
			InterfaceOptionsFrame:SetScript("OnMouseDown",function(self,button)
				if (button == "LeftButton" and not self.isMoving) then
					self:StartMoving();
					self.isMoving = true;
				end
			end);
			InterfaceOptionsFrame:SetScript("OnMouseUp",function(self,button)
				if (button == "LeftButton" and self.isMoving) then
					self:StopMovingOrSizing();
					self.isMoving = false;
				end
			end);
			InterfaceOptionsFrame:HookScript("OnHide",function(self,button)
				if (self.isMoving) then
					self:StopMovingOrSizing();
					self.isMoving = false;
				end
				
				Auras.db.char.layout[1].icefuryBar.isAdjustable = false;
				Auras.db.char.layout[1].maelstromBar.isAdjustable = false;
				Auras.db.char.layout[2].maelstromBar.isAdjustable = false;
				Auras.db.char.layout[3].earthenShieldBar.isAdjustable = false;
				Auras.db.char.layout[3].tidalWavesBar.isAdjustable = false;
				
				SSA.MaelstromBarEle:SetAlpha(0);
				SSA.MaelstromBarEnh:SetAlpha(0);
				SSA.EarthenShieldTotemBar:SetAlpha(0);
				SSA.TidalWavesBar:SetAlpha(0);
			end);
		--end
	--end);
	
	Auras:UpdateTalents();
	spec = SSA.spec;
	
	Auras.db.char.layout[1].isMoving = false;
	Auras.db.char.layout[1].maelstromBar.isAdjustable = false;
	Auras.db.char.layout[1].icefuryBar.isAdjustable = false;
	Auras.db.char.layout[2].isMoving = false;
	Auras.db.char.layout[2].maelstromBar.isAdjustable = false;
	Auras.db.char.layout[3].isMoving = false;
	Auras.db.char.layout[3].earthenShieldBar.isAdjustable = false;
	Auras.db.char.layout[3].tidalWavesBar.isAdjustable = false;
	
	local dbEle = Auras.db.char.frames.eleGrp;
	local dbEnh = Auras.db.char.frames.enhGrp;
	local dbRes = Auras.db.char.frames.resGrp;
	
	if (type(dbEle) ~= "table" or type(dbEnh) ~= "table" or type(dbRes) ~= "table") then
		AlertFrame:Show();
		CreateAlert(nil,"If you're seeing this, you are running r18-beta or later, but have a corrupted database. There was a rare issue that would cause this to happen and it has been fixed. However, we need to reset your database to return everything back to working order\n\nTo do this, please do ths following:\n\n    1. Logout of the game.\n    2. Go to your WTF folder\n        a. \"C:\\Program Files(x86)\\World of Warcraft\\WTF\"\n    3. Open the \"Accounts\" folder.\n    4. Open your account's folder.\n    5. Open the \"Saved Variables\" folder.\n    6. Find and delete the following files:\n        a. ShamanAuras.lua\n        b. ShamanAuras.lua.back\n\nWhen logging back in, the issue should be fixed.\n\nEnjoy!",360,312,20,50,0,-40,"LEFT");
	--[[elseif (not Auras.db.char.version or Auras.db.char.version ~= GetVersionNumber()) then
	--elseif (Auras.db.char.version == 21) then
		local version = GetVersionNumber();
		if (not Auras.db.char.version) then
			Auras.db.char.version = version;
		end
		if (Auras.db.char.version <= 21) then
			--SSA.ErrorFrame.text:SetText("Version check");
			local desc = "Sizing and Spacing Available!\n\nYou can now resize and adjust the spacing of the auras. Simply go to the advanced settings by typing '/ssa opt' to begin!"
			CreateAlert("Interface\\addons\\ShamanAurasDev\\Media\\textures\\sizing_spacing_preview",desc,420,406,20,120,0,500,"CENTER")
		end]]
	else
		for groupObj in pairs(dbEle) do
			--SSA.ErrorFrame.text:SetText(Auras:CurText().."[ELE]: "..groupObj.."\n")
			if (groupObj == "LavaSurgeEle") then
				dbRes.groupObj = nil
			elseif (groupObj ~= "enabled" and SSA[groupObj]) then
				InitializeGroup(SSA[groupObj],dbEle[groupObj].width,dbEle[groupObj].height,dbEle[groupObj].point,dbEle[groupObj].relativeTo,dbEle[groupObj].relativePoint,dbEle[groupObj].x,dbEle[groupObj].y,1,groupObj);
			elseif (groupObj == "enabled") then
				if (dbEle[groupObj]) then
					AuraGroupEle:Show();
				else
					AuraGroupEle:Hide();
				end
			end
		end
		
		for groupObj in pairs(dbEnh) do
			--SSA.ErrorFrame.text:SetText(Auras:CurText().."[ENH]: "..groupObj.."\n")
			if (groupObj ~= "enabled" and SSA[groupObj]) then
				InitializeGroup(SSA[groupObj],dbEnh[groupObj].width,dbEnh[groupObj].height,dbEnh[groupObj].point,dbEnh[groupObj].relativeTo,dbEnh[groupObj].relativePoint,dbEnh[groupObj].x,dbEnh[groupObj].y,2,groupObj);
			elseif (groupObj == "enabled") then
				if (dbEnh[groupObj]) then
					AuraGroupEnh:Show();
				else
					AuraGroupEnh:Hide();
				end
			end
		end
		
		for groupObj in pairs(dbRes) do
			if (groupObj == "LavaSurgeRes") then
				dbRes.groupObj = nil
			elseif (groupObj ~= "enabled" and SSA[groupObj]) then
				InitializeGroup(SSA[groupObj],dbRes[groupObj].width,dbRes[groupObj].height,dbRes[groupObj].point,dbRes[groupObj].relativeTo,dbRes[groupObj].relativePoint,dbRes[groupObj].x,dbRes[groupObj].y,3,groupObj);
			elseif (groupObj == "enabled") then
				if (dbRes[groupObj]) then
					AuraGroupRes:Show();
				else
					AuraGroupRes:Hide();
				end
			end
		end
	end

	StaticPopupDialogs["SSA_R42_BAR_GROUP_NOTICE"] = {
		text = "Due to large re-coding in r42, the placement of the vertical timer duration bars may be out of place. Be sure to take a moment to check their positions.",
		button1 = "Ok, thanks!",
		OnAccept = function()
			--AddonList:Show();
		end,
		timeout = 0,
		whileDead = true,
		hideOnEscape = true,
		preferredIndex = 3,
	}
	
	StaticPopupDialogs["SSA_CLASS_CHECKER"] = {
		text = "You are currently running the addon \"Sweetsour's Shaman Auras\" while on a non-shaman character. It is recommended that you disable this addon.",
		button1 = "Show Addon List",
		button2 = "I'll disable it later",
		OnAccept = function()
			AddonList:Show();
		end,
		timeout = 0,
		whileDead = true,
		hideOnEscape = true,
		preferredIndex = 3,
	}

	if (not Auras:CharacterCheck(0)) then
		StaticPopup_Show ("SSA_CLASS_CHECKER")
	end
	
	if (Auras.db.char.isR42FirstLoad) then
		Auras.db.char.isR42FirstLoad = false;
		StaticPopup_Show ("SSA_R42_BAR_GROUP_NOTICE")
	end
end

function Auras:UpdateEarthenShield(self)
	local progress = ((Auras.db.char.info.totems.eShield.dmg or 0) / Auras.db.char.info.totems.eShield.hp * 100);
	progress = 100 - progress;
	local remains = (Auras.db.char.info.totems.eShield.hp - (Auras.db.char.info.totems.eShield.dmg or 0));
	
	if (remains > 0) then
		self:SetValue(remains);
		self.text:SetText(tostring(math.ceil(progress)).."%");
	else
		self:SetAlpha(0);
		self.Timer:SetAlpha(0);
		--SSA.EarthenShieldTotemBar.Timer:Hide();
	end
end

function Auras:PLAYER_LEVEL_UP(event,level)
	--LevelCheck(level);
end

function Auras:PLAYER_TALENT_UPDATE()
	Auras:UpdateTalents();
	Auras:UpdateInterfaceSettings();
end

function Auras:PLAYER_REGEN_DISABLED()
	--Auras:MaelstromAlpha();
	if (SSA["Move"..GetSpecName(SSA.spec)]:IsShown()) then
		if (SSA["Move"..GetSpecName(SSA.spec)].Unlock:IsEnabled()) then
			SSA["Move"..GetSpecName(SSA.spec)].Unlock:Click();
		end
		SSA["Move"..GetSpecName(SSA.spec)].Close:Click("MiddleButton");
	end
end
