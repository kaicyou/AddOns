
local FOLDER_NAME, SSA = ...

local Auras = LibStub("AceAddon-3.0"):GetAddon("ShamanAuras")
local L = LibStub("AceLocale-3.0"):GetLocale("ShamanAuras", true)
local ErrorMsg = '';
SSA.InterfaceListItem = nil;

function Auras:GetColorVal(r,g,b)
	r = string.format("%.2f",(r / 255));
	g = string.format("%.2f",(g / 255));
	b = string.format("%.2f",(b / 255));
	return tonumber(r),tonumber(g),tonumber(b);
end

local function ParseSpec(name)
	local spec
	if (name == "Ele") then
		spec = 1;
	elseif (name == "Enh") then
		spec = 2;
	else
		spec = 3;
	end
	
	return spec;
end

local function CreateGrid()
	local grid = SSA.grid
	grid.boxSize = 128
	grid.isCreated = true;
	grid:SetAllPoints(UIParent)
	grid:SetFrameStrata("BACKGROUND");

	local size = 1
	local width = GetScreenWidth()
	local ratio = width / GetScreenHeight()
	local height = GetScreenHeight() * ratio

	local wStep = width / 128
	local hStep = height / 128

	for i = 0, 128 do
		local tx = grid:CreateTexture(nil, 'BACKGROUND')
		if i == 128 / 2 then
			tx:SetColorTexture(1,0,0)
		else
			tx:SetColorTexture(0,0,0,0.5)
		end
		tx:SetPoint("TOPLEFT", grid, "TOPLEFT", i*wStep - (size/2), 0)
		tx:SetPoint('BOTTOMRIGHT', grid, 'BOTTOMLEFT', i*wStep + (size/2), 0)
	end
	height = GetScreenHeight()

	do
		local tx = grid:CreateTexture(nil, 'BACKGROUND')
		tx:SetColorTexture(1, 0, 0)
		tx:SetPoint("TOPLEFT", grid, "TOPLEFT", 0, -(height/2) + (size/2))
		tx:SetPoint('BOTTOMRIGHT', grid, 'TOPRIGHT', 0, -(height/2 + size/2))
	end

	for i = 1, floor((height/2)/hStep) do
		local tx = grid:CreateTexture(nil, 'BACKGROUND')
		tx:SetColorTexture(0,0,0,0.5)

		tx:SetPoint("TOPLEFT", grid, "TOPLEFT", 0, -(height/2+i*hStep) + (size/2))
		tx:SetPoint('BOTTOMRIGHT', grid, 'TOPRIGHT', 0, -(height/2+i*hStep + size/2))

		tx = grid:CreateTexture(nil, 'BACKGROUND')
		tx:SetColorTexture(0,0,0,0.5)

		tx:SetPoint("TOPLEFT", grid, "TOPLEFT", 0, -(height/2-i*hStep) + (size/2))
		tx:SetPoint('BOTTOMRIGHT', grid, 'TOPRIGHT', 0, -(height/2-i*hStep + size/2))
	end
end

local function NavigateInterfaceOptions(index)
	local UpdateInterval = 0.001;
	local LastUpdated = 0;
	local listIndex

	InterfaceOptionsFrame:Show();
	InterfaceOptionsFrameTab2:Click();
	Auras.db.char.triggers.gridPreview = false;
	SSA.grid:Hide();

	for i=2,InterfaceOptionsFrameAddOns:GetNumChildren() do
		if (select(i,InterfaceOptionsFrameAddOns:GetChildren()):GetText() == "ShamanAuras") then
			listIndex = i;
			listObject = select(i,InterfaceOptionsFrameAddOns:GetChildren());

			if (select((i+1),InterfaceOptionsFrameAddOns:GetChildren()):GetText() ~= "Elemental Auras") then
				select(1,listObject:GetChildren()):Click();
			end
			break;
		end
	end
	
	select(listIndex+index,InterfaceOptionsFrameAddOns:GetChildren()):Click();
end

function Auras:ChatCommand(input)	
	input = string.lower(input);
	if (UnitAffectingCombat('player')) then
		DEFAULT_CHAT_FRAME:AddMessage("|cFFFFFF77Sweetsour\'s Shaman Auras|r: |cFFFF7777You cannot access options while in combat.");
	else
		if not input or input:trim() == "" then
			NavigateInterfaceOptions(0);
		elseif input == "ele" or input == "elemental" then
			NavigateInterfaceOptions(1);
		elseif input == "enh" or input == "enhance" or input == "enhancement" then
			NavigateInterfaceOptions(2)
		elseif input == "res" or input == "resto" or input == "restoration" then
			NavigateInterfaceOptions(3);
		elseif input == "settings" or input == "options" or input == "option" or input == "opt" or input == "config" then
			NavigateInterfaceOptions(4)
		elseif input == "version" then
			DEFAULT_CHAT_FRAME:AddMessage("|cFFFFFF77Sweetsour\'s Shaman Auras|r: |cFF9999FF"..GetAddOnMetadata(FOLDER_NAME,"Version").."|r");
		else
			DEFAULT_CHAT_FRAME:AddMessage("|cFFFFFF77Sweetsour\'s Shaman Auras|r: |cFFFF7777Invalid input.");
			DEFAULT_CHAT_FRAME:AddMessage("/|cFFFFFF77ssa|r: |cFFFFFFFFOpen addon's home page|r");
			DEFAULT_CHAT_FRAME:AddMessage("/|cFFFFFF77ssa|r |cFFBBBBFFele|r: |cFFFFFFFFOpen Elemental customizations options|r");
			DEFAULT_CHAT_FRAME:AddMessage("/|cFFFFFF77ssa|r |cFFBBBBFFenh|r: |cFFFFFFFFOpen Enhancement customizations options|r");
			DEFAULT_CHAT_FRAME:AddMessage("/|cFFFFFF77ssa|r |cFFBBBBFFresto|r: |cFFFFFFFFOpen Restoration customizations options|r");
			DEFAULT_CHAT_FRAME:AddMessage("/|cFFFFFF77ssa|r |cFFBBBBFFopt|r: |cFFFFFFFFOpen advanced customizations options|r");
			DEFAULT_CHAT_FRAME:AddMessage("/|cFFFFFF77ssa|r |cFFBBBBFFversion|r: |cFFFFFFFFRetrieve addon's version|r");
		end
	end
end

local function ToggleMovingAuras(name,state)
	local spec = ParseSpec(name);
	
	--for spellID in pairs(
end

function Auras:InitMoveAuraGroups(AuraObjects,name)
	if (not SSA.grid.isCreated) then
		CreateGrid();
	end

	if (Auras.db.char.isMoveGrid) then
		SSA.grid:Show();
	else
		SSA.grid:Hide();
	end
	SSA.IsMovingAuras = true;
	SSA["Move"..name]:Show();
	SSA["Move"..name].Grid:SetChecked(Auras.db.char.isMoveGrid);
	--local MoveCheckObj = SSA["MoveCheckObj"..name];
	local spec = ParseSpec(name);
	for i=1, getn(AuraObjects) do
		if (Auras.db.char.aura[spec][AuraObjects[i].object:GetName()]) then
			--MoveCheckObj[i]:Enable();
			--_G[MoveCheckObj[i]:GetName().."Text"]:SetTextColor(1,1,1,1);

			if (AuraObjects[i].backdrop) then
				--SSA[AuraObjects[i].object:GetName()]:SetBackdrop(SSA[AuraObjects[i].backdrop]);
				--SSA[AuraObjects[i].object:GetName()]:SetBackdropColor(0,0,0,0);
			end

			if (AuraObjects[i].alpha) then
				--SSA[AuraObjects[i].object:GetName()]:SetAlpha(1);
			else
				if (AuraObjects[i].alpha ~= nil) then
					SSA[AuraObjects[i].object:GetName()]:Show();
				end
			end
			if (AuraObjects[i].statusbar) then
				if (AuraObjects[i].statusbar.m == 'player') then
					SSA[AuraObjects[i].object:GetName()]:SetValue(UnitHealth('player'));
				else
					SSA[AuraObjects[i].object:GetName()]:SetValue(AuraObjects[i].statusbar.m);
				end
				--SSA[AuraObjects[i].object:GetName()]:GetStatusBarTexture():SetVertexColor(vars.r,vars.g,vars.b,vars.a);
			end

			if (AuraObjects[i].model) then
				for j=1,getn(AuraObjects[i].model) do
					AuraObjects[i].model[j]:SetAlpha(1)
				end
			end
			SSA["Move"..name].Info:Show();
			--ToggleMovingAuras(name,true);
		else
			--MoveCheckObj[i]:Disable();
			--_G[MoveCheckObj[i]:GetName().."Text"]:SetTextColor(0.5,0.5,0.5,1);
		end
	end
	
	InterfaceOptionsFrame:Hide();
	GameMenuFrame:Hide();
end

function Auras:ResetAuraGroups(db,DB)
	for groupObj in pairs(db) do
		SSA[groupObj]:ClearAllPoints();
		SSA[groupObj]:SetPoint(db[groupObj].point,(SSA[db[groupObj].relativeTo] or UIParent),db[groupObj].relativePoint,db[groupObj].x,db[groupObj].y);
		DB[groupObj].point = db[groupObj].point;
		DB[groupObj].relativeTo = (SSA[db[groupObj].relativeTo] or UIParent);
		DB[groupObj].relativePoint = db[groupObj].relativePoint;
		DB[groupObj].x = db[groupObj].x;
		DB[groupObj].y = db[groupObj].y;
	end
end

function Auras:BuildMoveUI(AuraObjects,MoveStrings,name)
	local ButtonFont = SSA.ButtonFont;
	local BackdropSB = SSA.BackdropSB;
	local Move = SSA["Move"..name];
	
	Move.Unlock = CreateFrame("Button","UnlockButton",Move);
	Move.Close = CreateFrame("Button","CloseButton",Move);
	Move.Grid = CreateFrame("CheckButton","Move"..name.."Grid",Move,"ChatConfigCheckButtonTemplate");
	Move.InfoDisplay = CreateFrame("CheckButton","Move"..name.."InfoDisplay",Move,"ChatConfigCheckButtonTemplate");
	Move.Info = CreateFrame("Frame","MoveInfoFrame",UIParent);
	--[[Move.CheckAll = CreateFrame("CheckButton","Move"..name.."CheckAll",Move,"ChatConfigCheckButtonTemplate");
	Move.CheckTop = CreateFrame("CheckButton","Move"..name.."CheckTop",Move,"ChatConfigCheckButtonTemplate");
	Move.CheckBot = CreateFrame("CheckButton","Move"..name.."CheckBot",Move,"ChatConfigCheckButtonTemplate");
	Move.CheckLeft = CreateFrame("CheckButton","Move"..name.."CheckLeft",Move,"ChatConfigCheckButtonTemplate");
	Move.CheckRight = CreateFrame("CheckButton","Move"..name.."CheckRight",Move,"ChatConfigCheckButtonTemplate");
	Move.CheckBuffBar = CreateFrame("CheckButton","Move"..name.."CheckBuffBar",Move,"ChatConfigCheckButtonTemplate");
	Move.CheckMainBar = CreateFrame("CheckButton","Move"..name.."CheckMainBar",Move,"ChatConfigCheckButtonTemplate");
	Move.CheckUtilBar = CreateFrame("CheckButton","Move"..name.."CheckUtilBar",Move,"ChatConfigCheckButtonTemplate");]]
	
	SSA["MoveCheckObj"..name] = {
		--[[[1] = Move.Grid,
		[2] = Move.CheckAll,
		[3] = Move.CheckTop,
		[4] = Move.CheckBot,
		[5] = Move.CheckLeft,
		[6] = Move.CheckRight,
		[7] = Move.CheckBuffBar,
		[8] = Move.CheckMainBar,
		[9] = Move.CheckUtilBar,]]
	}
	--local MoveCheckObj = SSA["MoveCheckObj"..name];
	--[[for i=9,getn(AuraObjects) do
		Move["Check"..AuraObjects[i].object:GetName()] = CreateFrame("CheckButton","Move"..name.."Check"..AuraObjects[i].object:GetName(),Move,"ChatConfigCheckButtonTemplate");
		table.insert(MoveCheckObj,i,Move["Check"..AuraObjects[i].object:GetName()]);
	end]]
	Move.Info:SetWidth(446);
	Move.Info:SetHeight(115);
	Move.Info:SetPoint("TOPLEFT",UIParent,"TOPLEFT",100,-100);
	Move.Info:SetBackdrop(SSA.BackdropSB)
	Move.Info:SetBackdropColor(0.15,0.15,0.15,0.9);
	Move.Info:SetBackdropBorderColor(1,1,1,1);
	Move.Info:Hide();

	Move.Info.text = Move.Info:CreateFontString(nil, "MEDIUM", "GameFontHighlightLarge");
	Move.Info.text:SetPoint("TOPLEFT",11,-5);
	Move.Info.text:SetFont("Interface\\addons\\ShamanAurasDev\\Media\\fonts\\courbd.ttf", 14,"NONE");
	Move.Info.text:SetTextColor(1,1,1,1);
	Move.Info.text:SetJustifyH("LEFT");
	Move.Info.text:SetText("               Moving Auras Help\n\nShift + Left-Click:   Horizontal Center\nShift + Right-Click:  Vertical Center\nShift + Middle-Click: Horizonal/Vertical Center\n\nCtrl + Right-Click:   Reset Aura Group");
	_G["SSA_MoveInfoFrame"] = Move.Info;

	-- Build Move Toggle Frame
	Move:SetFrameStrata("HIGH");
	Move:SetWidth(170);
	--Move:SetHeight(((getn(MoveCheckObj) - 8) * 20) + 270);
	Move:SetHeight(118);
	Move:SetPoint("CENTER",0,250);
	Move:SetBackdrop(BackdropSB);
	Move:SetBackdropColor(0,0,0);
	Move:Hide();
	
	-- Build Unlock/Lock Button
	local isAnyChecked = false;
	Move.Unlock:SetWidth(100);
	Move.Unlock:SetHeight(25);
	Move.Unlock:SetFrameStrata("DIALOG");
	Move.Unlock:SetPoint("TOP",0,-10);
	Move.Unlock:SetText("Unlock Auras");
	Move.Unlock:SetBackdrop(BackdropSB);
	Move.Unlock:SetBackdropColor(0,0,0,0.4);
	Move.Unlock:SetNormalFontObject("SSAButtonFont");
	Move.Unlock:Enable();
	Move.Unlock:SetScript("OnClick",function(self,button)
		if (self:GetText() == "Unlock Auras") then
			self:SetText("Lock Auras");
			--[[local all,top,bot,left,right = false,false,false,false,false;
			if (Move.CheckAll:GetChecked()) then
				AuraObjects[1].object:EnableMouse(true);
				AuraObjects[1].object:SetMovable(true);
				AuraObjects[1].object:SetUserPlaced(true);
				AuraObjects[1].object:SetScript("OnDragStart", AuraObjects[1].object.StartMoving);
				AuraObjects[1].object:SetScript("OnDragStop", AuraObjects[1].object.StopMovingOrSizing);
				AuraObjects[1].object:SetBackdropColor(0,0,0,0.5);
				Move.CheckAll:Disable()
			else]]
				--AuraObjects[1].object:SetBackdropColor(0,0,0,0);
				for i=1,getn(AuraObjects) do
					--if (MoveCheckObj[i]:GetChecked()) then
						AuraObjects[i].object:EnableMouse(true);
						AuraObjects[i].object:SetMovable(true);
						AuraObjects[i].object:SetScript("OnMouseDown",function(self,button)
							if (not IsShiftKeyDown() and not IsControlKeyDown()) then
								local framePt,_,parentPt,x,y = self:GetPoint(1)
								self.framePt = framePt
								self.parentPt = parentPt
								self.frameX = x
								self.frameY = y
								self:StartMoving()
								_,_,_,x,y = self:GetPoint(1)
								self.screenX = x
								self.screenY = y
							elseif (not IsShiftKeyDown() and IsControlKeyDown() and button == "RightButton") then
								local frame = Auras.db.char.frames.defaultPos[name:lower().."Grp"][self:GetName()];
			
								self:SetPoint(frame.point,SSA[frame.relativeTo],frame.relativePoint,frame.x,frame.y);
							end
						end);
						AuraObjects[i].object:SetScript("OnMouseUp",function(self,button)
							local framePt,_,parentPt,x,y = self:GetPoint(1)
							if (IsShiftKeyDown()) then
								if (button == "LeftButton") then
									self:SetPoint("CENTER",self:GetParent(),"CENTER",0,y);
								elseif (button == "RightButton") then
									self:SetPoint("CENTER",self:GetParent(),"CENTER",x,0);
								elseif (button == "MiddleButton") then
									self:SetPoint("CENTER",self:GetParent(),"CENTER",0,0);
								end
							else
								if (not IsControlKeyDown()) then
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
						end);
						if (i == 1) then
							--AuraObjects[i].object:SetBackdropColor(0,0,0,0.5);
						else
							--AuraObjects[i].object:SetBackdropColor(0,0,0,0.95);
						end
						--MoveCheckObj[i]:Disable()
					--end
				end
			--end
			Move.Close:SetBackdropColor(1,0,0,0.4);
			Move.Close:Disable();
		else
			self:SetText("Unlock Auras");
			--[[if (Move.CheckAll:GetChecked()) then
				AuraObjects[1].object:EnableMouse(false);
				AuraObjects[1].object:SetMovable(false);
				AuraObjects[1].object:SetScript("OnDragStart", nil);
				AuraObjects[1].object:SetScript("OnDragStop", nil);
				AuraObjects[1].object:SetBackdropColor(0,0,0,0.5);
				Move.CheckAll:Enable()
			else]]
				--AuraObjects[1].object:SetBackdropColor(0,0,0,0);
				for i=1,getn(AuraObjects) do
					--if (MoveCheckObj[i]:GetChecked()) then
						if (i == 1) then
							--AuraObjects[i].object:SetBackdropColor(0,0,0,0.5);
						else
							--AuraObjects[i].object:SetBackdropColor(0,0,0,0.95);
						end
						AuraObjects[i].object:EnableMouse(false);
						AuraObjects[i].object:SetMovable(false);
						--AuraObjects[i].object:SetBackdropColor(0,0,0,1);
						--MoveCheckObj[i]:Enable()
					--end
				end
			--end
			Move.Close:SetBackdropColor(0,0,0,1);
			Move.Close:Enable();
		end
	end);
	Move.Unlock:SetScript("OnEnter",function(self,button)
		--if (isAnyChecked) then
			self:SetBackdropColor(0.5,0.5,0.5);
		--end
	end);
	Move.Unlock:SetScript("OnLeave",function(self,button)
		--if (isAnyChecked) then
			self:SetBackdropColor(0,0,0);
		--end
	end);
	
	-- Build Close Button
	Move.Close:SetWidth(75);
	Move.Close:SetHeight(25);
	Move.Close:SetFrameStrata("DIALOG");
	Move.Close:SetPoint("BOTTOM",0,10);
	Move.Close:SetText("Close");
	Move.Close:SetBackdrop(BackdropSB);
	Move.Close:SetBackdropColor(0,0,0);
	Move.Close:SetNormalFontObject("SSAButtonFont");
	Move.Close:SetScript("OnClick",function(self,button)
		local point,relativePoint,x,y
		local spec = SSA.spec;
		
		if (spec == 1 or spec == 2) then
			Auras:GetMaelstromBarObj(spec):SetAlpha(0);
		end
		Move:Hide();
		SSA.grid:Hide();
		SSA.IsMovingAuras = false;

		if (Move.Info:IsShown()) then
			Move.Info:Hide();
		end
		
		Auras.db.char.layout[spec].isMoving = false;
		
		for i=1,getn(AuraObjects) do
			if (AuraObjects[i].backdrop) then
				--SSA[AuraObjects[i].object:GetName()]:SetBackdrop(nil);
			end
			
			if (AuraObjects[i].alpha) then
				AuraObjects[i].object:SetAlpha(0)
			else
				if (AuraObjects[i].alpha ~= nil) then
					AuraObjects[i].object:Hide()
				end
			end
			--[[if (AuraObjects[i].object:GetName() ~= "Cloudburst") then
				AuraObjects[i].object:SetBackdrop(nil);
			end]]
			
			--[[if (i >= 9) then
				if (AuraObjects[i].object:GetObjectType() == "Texture" or AuraObjects[i].object:GetName() == "Cloudburst") then
					AuraObjects[i].object:Hide();
				else
					AuraObjects[i].object:SetAlpha(0);
				end
			end]]

			if (AuraObjects[i].statusbar) then
				AuraObjects[i].object:SetValue(0);
			end
			if (AuraObjects[i].model) then
				for j=1,getn(AuraObjects[i].model) do
					AuraObjects[i].model[j]:SetAlpha(0)
				end
			end
			--[[if (Auras.db.char.frames[name:lower().."Grp"][AuraObjects[i].object:GetName()].alpha) then
				local r,g,b,a = AuraObjects[i].object:GetStatusBarColor();
				AuraObjects[i].object.bg:SetAlpha(Auras.db.char.frames[name:lower().."Grp"][AuraObjects[i].object:GetName()].alpha);
				AuraObjects[i].object:GetStatusBarTexture():SetVertexColor(r,g,b,a);
			end]]
		end
		
		if (button ~= "MiddleButton") then
			InterfaceOptionsFrame:Show();
			InterfaceOptionsFrameCancel:SetScript("OnClick",function(self)
				InterfaceOptionsFrame:Hide();
				GameMenuFrame:Show();
			end);
			InterfaceOptionsFrameOkay:SetScript("OnClick",function(self)
				InterfaceOptionsFrame:Hide();
				GameMenuFrame:Show();
			end);
		end
		
		--[[for i=1,getn(MoveCheckObj) do
			MoveCheckObj[i]:SetChecked(false);
			MoveCheckObj[i]:Enable();
			_G[MoveCheckObj[i]:GetName().."Text"]:SetTextColor(1,1,1,1);
		end]]
		local curText
		
		for i=1,getn(AuraObjects) do
			local objName = AuraObjects[i].object:GetName();
			point,_,relativePoint,x,y = AuraObjects[i].object:GetPoint(1);
			Auras.db.char.frames[name:lower().."Grp"][objName].point = point;
			Auras.db.char.frames[name:lower().."Grp"][objName].relativePoint = relativePoint;
			Auras.db.char.frames[name:lower().."Grp"][objName].x = x;
			Auras.db.char.frames[name:lower().."Grp"][objName].y = y;
		end
	end);
	Move.Close:SetScript("OnEnter",function(self,button)
		self:SetBackdropColor(0.5,0.5,0.5);
	end);
	Move.Close:SetScript("OnLeave",function(self,button)
		self:SetBackdropColor(0,0,0);
	end);
	
	Move.Grid:SetPoint("TOPLEFT",10,-37);
	_G[Move.Grid:GetName().."Text"]:SetFont("Interface\\addons\\ShamanAuras\\media\\fonts\\PT_Sans_Narrow.TTF", 12);
	_G[Move.Grid:GetName().."Text"]:SetText(L["Toggle Grid"]);
	_G[Move.Grid:GetName().."Text"]:SetPoint("LEFT",25,0);
	Move.Grid:SetScript("OnClick",function(self)
		if (self:GetChecked()) then
			Auras.db.char.isMoveGrid = true;
			SSA.grid:Show();
		else
			Auras.db.char.isMoveGrid = false;
			SSA.grid:Hide();
		end
	end);
	
	Move.InfoDisplay:SetPoint("TOPLEFT",10,-57);
	Move.InfoDisplay:SetChecked(true);
	_G[Move.InfoDisplay:GetName().."Text"]:SetFont("Interface\\addons\\ShamanAuras\\media\\fonts\\PT_Sans_Narrow.TTF", 12);
	_G[Move.InfoDisplay:GetName().."Text"]:SetText(L["Toggle Info Frame"]);
	_G[Move.InfoDisplay:GetName().."Text"]:SetPoint("LEFT",25,0);
	Move.InfoDisplay:SetScript("OnClick",function(self)
		if (self:GetChecked()) then
			Move.Info:Show();
		else
			Move.Info:Hide();
		end
	end);
	-- Check Button Builder
	--[[local y = -80;
	local isAll = true;
	for i=3,getn(MoveCheckObj) do
		if (i == 7) then
			y = -85;
		elseif (i == 10) then
			y = -90;
		end
		MoveCheckObj[i]:SetPoint("TOPLEFT",10,(y - ((i-2) * 20)));
		_G[MoveCheckObj[i]:GetName().."Text"]:SetFont("Interface\\addons\\ShamanAuras\\media\\fonts\\PT_Sans_Narrow.TTF", 12,"OUTLINE");
		_G[MoveCheckObj[i]:GetName().."Text"]:SetText(MoveStrings[i-1]);
		_G[MoveCheckObj[i]:GetName().."Text"]:SetPoint("LEFT",25,0);
		MoveCheckObj[i]:SetScript("OnClick",function(self)
			
			if (self:GetChecked()) then
				isAll = true;
				for j=3,getn(MoveCheckObj) do
					isAnyChecked = false;
					if (MoveCheckObj[j]:GetChecked()) then
						isAll = false;
						isAnyChecked = true;
						break;
					end
				end
				if (Move.CheckAll:IsEnabled()) then
					Move.CheckAll:Disable()
					_G[Move.CheckAll:GetName().."Text"]:SetTextColor(0.5,0.5,0.5,1);
				end
				if (AuraObjects[i-1].backdrop) then
					AuraObjects[i-1].object:SetBackdropColor(0,0,0,1);
				end
				if (AuraObjects[i-1].statusbar) then
					local statusbar = AuraObjects[i-1].statusbar;
					AuraObjects[i-1].object:GetStatusBarTexture():SetVertexColor((statusbar.r/2.5),(statusbar.g/2.5),(statusbar.b/2.5),1);
				end
			else
				isAll = true;
				for j=3,getn(MoveCheckObj) do
					isAnyChecked = false;
					if (MoveCheckObj[j]:GetChecked()) then
						isAll = false;
						isAnyChecked = true;
						break;
					end
				end
				if (not Move.CheckAll:GetChecked() and isAll) then
					Move.CheckAll:Enable()
					_G[Move.CheckAll:GetName().."Text"]:SetTextColor(1,1,1,1);
				end
				--AuraObjects[i-1].object:SetBackdropColor(0,0,0,0);
				if (AuraObjects[i-1].backdrop) then
					AuraObjects[i-1].object:SetBackdropColor(0,0,0,0);
				end
				if (AuraObjects[i-1].statusbar) then
					local statusbar = AuraObjects[i-1].statusbar;
					AuraObjects[i-1].object:GetStatusBarTexture():SetVertexColor(statusbar.r,statusbar.g,statusbar.b,1);
				end
			end
			
			if (isAnyChecked) then
				Move.Unlock:Enable();
				Move.Unlock:SetBackdropColor(0,0,0,1);
			else
				Move.Unlock:Disable();
				Move.Unlock:SetBackdropColor(1,0,0,0.4);
			end
		end);
		MoveCheckObj[i]:SetScript("OnEnter",function(self,motion)
			if (not self:GetChecked()) then
				if (AuraObjects[i-1].statusbar) then
					local statusbar = AuraObjects[i-1].statusbar;
					AuraObjects[i-1].object:GetStatusBarTexture():SetVertexColor((statusbar.r/2),(statusbar.g/2),(statusbar.b/2),1);
				end
				if (AuraObjects[i-1].object:GetName() == "TidalWavesBar") then
					AuraObjects[i-1].object:GetStatusBarTexture():SetVertexColor(0.2,0.2,0.2,0.6);
				else
					AuraObjects[i-1].object:SetBackdropColor(0,0,0,1);
				end
			end
		end);
		MoveCheckObj[i]:SetScript("OnLeave",function(self,motion)
			if (not self:GetChecked()) then
				if (AuraObjects[i-1].statusbar) then
					local statusbar = AuraObjects[i-1].statusbar;
					AuraObjects[i-1].object:GetStatusBarTexture():SetVertexColor(statusbar.r,statusbar.g,statusbar.b,1);
				end
			end
			if (not self:GetChecked()) then
				if (AuraObjects[i-1].object:GetName() == "TidalWavesBar") then
					AuraObjects[i-1].object:GetStatusBarTexture():SetVertexColor(1,1,1,1);
				else
					AuraObjects[i-1].object:SetBackdropColor(0,0,0,0);
				end
			end
			if (AuraObjects[i-1].object:GetName() == "Cloudburst") then
				local bgColor = Auras.db.char.frames.resGrp.Cloudburst.BackdropColor;
				AuraObjects[i-1].object:SetBackdropColor(bgColor.r,bgColor.g,bgColor.b,bgColor.a);
			end
		end);
	end]]
	
	-- Configure Check Button Functionality			
	--[[Move.CheckAll:SetPoint("TOPLEFT",10,-75);
	_G[Move.CheckAll:GetName().."Text"]:SetText(L["Move All Auras"]);
	_G[Move.CheckAll:GetName().."Text"]:SetFont("Interface\\addons\\ShamanAuras\\media\\fonts\\PT_Sans_Narrow.TTF", 12,"OUTLINE");
	_G[Move.CheckAll:GetName().."Text"]:SetPoint("LEFT",25,0);
	Move.CheckAll:SetScript("OnClick",function(self)
		if (self:GetChecked()) then
			Move.Unlock:Enable();
			Move.Unlock:SetBackdropColor(0,0,0,1);
			for i=3,getn(MoveCheckObj) do
				MoveCheckObj[i]:Disable();
				_G[MoveCheckObj[i]:GetName().."Text"]:SetTextColor(0.5,0.5,0.5,1);
			end
		else
			Move.Unlock:Disable();
			Move.Unlock:SetBackdropColor(1,0,0,0.4);
			for i=3,getn(MoveCheckObj) do
				MoveCheckObj[i]:Enable();
				_G[MoveCheckObj[i]:GetName().."Text"]:SetTextColor(1,1,1,1);
			end
		end
	end);
	Move.CheckAll:SetScript("OnEnter",function(self,motion)
		if (not self:GetChecked()) then
			AuraObjects[1].object:SetBackdropColor(0,0,0,1);
		end
	end);
	Move.CheckAll:SetScript("OnLeave",function(self,motion)
		if (not self:GetChecked()) then
			AuraObjects[1].object:SetBackdropColor(0,0,0,0);
		end
	end);]]
end



function Auras:CreateVerticalStatusBar(statusbar,anchor,x,r1,g1,b1,text,duration)
	r1 = string.format("%.2f",(r1 / 255));
	g1 = string.format("%.2f",(g1 / 255));
	b1 = string.format("%.2f",(b1 / 255));
	
	statusbar:SetStatusBarTexture("Interface\\addons\\ShamanAuras\\media\\statusbar\\Glamour2");
	statusbar:GetStatusBarTexture():SetHorizTile(false);
	statusbar:GetStatusBarTexture():SetVertTile(false);
	statusbar:SetOrientation("VERTICAL");
	statusbar:SetRotatesTexture(true);
	statusbar:SetPoint(anchor,x,0);
	statusbar:SetWidth(17);
	statusbar:SetHeight(175);
	statusbar:SetFrameStrata("LOW");
	statusbar:SetStatusBarColor(r1,g1,b1);
	statusbar:SetMinMaxValues(0,duration);
	statusbar:Hide();

	statusbar.duration = duration;
	statusbar.bg = statusbar:CreateTexture(nil,"BACKGROUND");
	statusbar.bg:SetTexture("Interface\\TargetingFrame\\UI-StatusBar");
	statusbar.bg:SetAllPoints(true);
	statusbar.bg:SetVertexColor(0,0,0);
	statusbar.bg:SetAlpha(0.5);

	statusbar.timetext = statusbar:CreateFontString(nil, "MEDIUM", "GameFontHighlightLarge");
	statusbar.timetext:SetPoint("BOTTOM",-6,4);
	statusbar.timetext:SetFont("Interface\\addons\\ShamanAuras\\Media\\fonts\\Continuum_Medium.ttf", 12);
	statusbar.timetext:SetTextColor(1,1,1,1);
	statusbar.timetext:SetJustifyH("CENTER");
	statusbar.timetext:SetJustifyV("MIDDLE");

	statusbar.nametext = statusbar:CreateFontString(nil, "MEDIUM", "GameFontHighlightLarge");
	statusbar.nametext:SetPoint("TOP",-94.5,-4);
	statusbar.nametext:SetFont("Interface\\addons\\ShamanAuras\\Media\\fonts\\Continuum_Medium.ttf", 12);
	statusbar.nametext:SetTextColor(1,1,1,1);
	statusbar.nametext:SetJustifyH("RIGHT");
	statusbar.nametext:SetJustifyV("TOP");
	statusbar.nametext:SetWidth(175);
	statusbar.nametext:SetHeight(17);
	statusbar.nametext:SetText(text);

	statusbar.rotatetime = statusbar.timetext:CreateAnimationGroup();
	statusbar.rotatetime:SetLooping("NONE");

	local rotater = statusbar.rotatetime:CreateAnimation("Rotation");
	rotater:SetOrigin("CENTER", 0, 0);
	rotater:SetDegrees(90);
	rotater:SetDuration(0.000001);
	rotater:SetEndDelay(2147483647)

	statusbar.rotatename = statusbar.nametext:CreateAnimationGroup();
	statusbar.rotatename:SetLooping("NONE");

	local rotater = statusbar.rotatename:CreateAnimation("Rotation");
	rotater:SetOrigin("CENTER", 0, 0);
	rotater:SetDegrees(90);
	rotater:SetDuration(0.000001);
	rotater:SetEndDelay(2147483647)
	
	statusbar.rotatetime:Play();
	statusbar.rotatename:Play();
end

local function BuildHorizontalIconRow(rowObj,rowList,y,spec,side)
	local rowCtr = 0;
	local layout = Auras.db.char.layout[spec].primary[side];
	local parent = rowObj[1]:GetParent();
	local xOdd = {
		[1] = (0 - (layout.spacing *2)),
		[2] = (0 - layout.spacing),
		[3] = 0,
		[4] = (0 + layout.spacing),
		[5] = (0 + (layout.spacing *2)),
	}
	local xEven = {
		[1] = ((layout.spacing * -3) / 2),
		[2] = (layout.spacing / -2),
		[3] = (layout.spacing / 2),
		[4] = ((layout.spacing * 3) / 2),
	}
	
	for i=1,getn(rowObj) do
		rowObj[i]:SetWidth(layout.icon);
		rowObj[i]:SetHeight(layout.icon);
		if (rowObj[i].glow) then
			rowObj[i].glow:SetWidth(layout.icon + 13);
			rowObj[i].glow:SetHeight(layout.icon + 13);
		end
		if (rowObj[i].Charges) then
			rowObj[i].Charges.text:SetFont("Interface\\addons\\ShamanAuras\\Media\\fonts\\ABF.ttf", layout.charges,"OUTLINE");
		end
	end
	
	for i=1,getn(rowList) do
		if (rowList[i] and Auras:CharacterCheck(0)) then
			rowCtr = rowCtr + 1;
			rowObj[i]:Show();
		else
			rowObj[i]:Hide();
		end
	end
	
	if (rowCtr == 1) then
		parent:SetWidth(90);
		for i=1,getn(rowList) do
			if (rowList[i]) then
				rowObj[i]:SetPoint("CENTER",xOdd[3],y);
				break;
			end
		end
	elseif (rowCtr == 2) then
		parent:SetWidth(115);
		for i=1,getn(rowList) do
			if (rowList[i]) then
				rowObj[i]:SetPoint("CENTER",xEven[2],y);
				for j=i+1,getn(rowList) do
					if (rowList[j]) then
						rowObj[j]:SetPoint("CENTER",xEven[3],y);
						break;
					end
				end
				break;
			end
		end
	elseif (rowCtr == 3) then
		parent:SetWidth(162);
		for i=1,getn(rowList) do
			if (rowList[i]) then
				rowObj[i]:SetPoint("CENTER",xOdd[2],y);
				for j=i+1,getn(rowList) do
					if (rowList[j]) then
						rowObj[j]:SetPoint("CENTER",xOdd[3],y);
						for k=j+1,getn(rowList) do
							if (rowList[k]) then
								rowObj[k]:SetPoint("CENTER",xOdd[4],y);
								break;
							end
						end
						break;
					end
				end
				break;
			end
		end
	elseif (rowCtr == 4) then
		parent:SetWidth(210);
		for i=1,getn(rowList) do
			if (rowList[i]) then
				rowObj[i]:SetPoint("CENTER",xEven[1],y);
				for j=i+1,getn(rowList) do
					if (rowList[j]) then
						rowObj[j]:SetPoint("CENTER",xEven[2],y);
						for k=j+1,getn(rowList) do
							if (rowList[k]) then
								rowObj[k]:SetPoint("CENTER",xEven[3],y);
								for l=k+1,getn(rowList) do
									if (rowList[l]) then
										rowObj[l]:SetPoint("CENTER",xEven[4],y);
										break;
									end
								end
								break;
							end
						end
						break;
					end
				end
				break;
			end
		end
	elseif (rowCtr == 5) then
		parent:SetWidth(250);
		for i=1,getn(rowList) do
			if (rowList[i]) then
				rowObj[i]:SetPoint("CENTER",xOdd[1],y);
				for j=i+1,getn(rowList) do
					if (rowList[j]) then
						rowObj[j]:SetPoint("CENTER",xOdd[2],y);
						for k=j+1,getn(rowList) do
							if (rowList[k]) then
								rowObj[k]:SetPoint("CENTER",xOdd[3],y);
								for l=k+1,getn(rowList) do
									if (rowList[l]) then
										rowObj[l]:SetPoint("CENTER",xOdd[4],y);
										for m=l+1,getn(rowList) do
											if (rowList[m]) then
												rowObj[m]:SetPoint("CENTER",xOdd[5],y);
												break;
											end
										end
										break;
									end
								end
								break;
							end
						end
						break;
					end
				end
				break;
			end
		end
	end
	
	wipe(rowObj);
	wipe(rowList);
	wipe(xEven);
	wipe(xOdd);
end

local function BuildVerticalIconRow(rowObj,rowList,x,spec,side)
	local rowCtr = 0;
	local layout = Auras.db.char.layout[spec].secondary[side];
	local yOdd = {
		[1] = (0 + (layout.spacing *2)),
		[2] = (0 + layout.spacing),
		[3] = 0,
		[4] = (0 - layout.spacing),
		[5] = (0 - (layout.spacing *2)),
	}
	local yEven = {
		[1] = ((layout.spacing * 5) / 2),
		[2] = ((layout.spacing * 3) / 2),
		[3] = (layout.spacing / 2),
		[4] = (layout.spacing / -2),
		[5] = ((layout.spacing * -3) / 2),
		[6] = ((layout.spacing * -5) / 2),
	}
	
	for i=1,getn(rowObj) do
		rowObj[i]:SetWidth(layout.icon);
		rowObj[i]:SetHeight(layout.icon);
		if (rowObj[i].glow) then
			rowObj[i].glow:SetWidth(layout.icon + 10);
			rowObj[i].glow:SetHeight(layout.icon + 10);
		end
		if (rowObj[i].Charges) then
			rowObj[i].Charges.text:SetFont("Interface\\addons\\ShamanAuras\\Media\\fonts\\ABF.ttf", layout.charges,"OUTLINE");
		end
	end
	
	for i=1,getn(rowList) do
		if (rowList[i] and Auras:CharacterCheck(0)) then
			rowCtr = rowCtr + 1;
			rowObj[i]:Show();
		else
			rowObj[i]:Hide();
		end
	end
	
	if (rowCtr == 1) then
		for i=1,getn(rowList) do
			if (rowList[i]) then
				rowObj[i]:SetPoint("CENTER",x,yOdd[3]);
				break;
			end
		end
	elseif (rowCtr == 2) then
		for i=1,getn(rowList) do
			if (rowList[i]) then
				rowObj[i]:SetPoint("CENTER",x,yEven[3]);
				for j=i+1,getn(rowList) do
					if (rowList[j]) then
						rowObj[j]:SetPoint("CENTER",x,yEven[4]);
						break;
					end
				end
				break;
			end
		end
	elseif (rowCtr == 3) then
		for i=1,getn(rowList) do
			if (rowList[i]) then
				rowObj[i]:SetPoint("CENTER",x,yOdd[2]);
				for j=i+1,getn(rowList) do
					if (rowList[j]) then
						rowObj[j]:SetPoint("CENTER",x,yOdd[3]);
						for k=j+1,getn(rowList) do
							if (rowList[k]) then
								rowObj[k]:SetPoint("CENTER",x,yOdd[4]);
								break;
							end
						end
						break;
					end
				end
				break;
			end
		end
	elseif (rowCtr == 4) then
		for i=1,getn(rowList) do
			if (rowList[i]) then
				rowObj[i]:SetPoint("CENTER",x,yEven[2]);
				for j=i+1,getn(rowList) do
					if (rowList[j]) then
						rowObj[j]:SetPoint("CENTER",x,yEven[3]);
						for k=j+1,getn(rowList) do
							if (rowList[k]) then
								rowObj[k]:SetPoint("CENTER",x,yEven[4]);
								for l=k+1,getn(rowList) do
									if (rowList[l]) then
										rowObj[l]:SetPoint("CENTER",x,yEven[5]);
										break;
									end
								end
								break;
							end
						end
						break;
					end
				end
				break;
			end
		end
	elseif (rowCtr == 5) then
		for i=1,getn(rowList) do
			if (rowList[i]) then
				rowObj[i]:SetPoint("CENTER",x,yOdd[1]);
				for j=i+1,getn(rowList) do
					if (rowList[j]) then
						rowObj[j]:SetPoint("CENTER",x,yOdd[2]);
						for k=j+1,getn(rowList) do
							if (rowList[k]) then
								rowObj[k]:SetPoint("CENTER",x,yOdd[3]);
								for l=k+1,getn(rowList) do
									if (rowList[l]) then
										rowObj[l]:SetPoint("CENTER",x,yOdd[4]);
										for m=l+1,getn(rowList) do
											if (rowList[m]) then
												rowObj[m]:SetPoint("CENTER",x,yOdd[5]);
												break;
											end
										end
										break;
									end
								end
								break;
							end
						end
						break;
					end
				end
				break;
			end
		end
	elseif (rowCtr == 6) then
		for i=1,getn(rowList) do
			if (rowList[i]) then
				rowObj[i]:SetPoint("CENTER",x,yEven[1]);
				for j=i+1,getn(rowList) do
					if (rowList[j]) then
						rowObj[j]:SetPoint("CENTER",x,yEven[2]);
						for k=j+1,getn(rowList) do
							if (rowList[k]) then
								rowObj[k]:SetPoint("CENTER",x,yEven[3]);
								for l=k+1,getn(rowList) do
									if (rowList[l]) then
										rowObj[l]:SetPoint("CENTER",x,yEven[4]);
										for m=l+1,getn(rowList) do
											if (rowList[m]) then
												rowObj[m]:SetPoint("CENTER",x,yEven[5]);
												for n=m+1,getn(rowList) do
													if (rowList[n]) then
														rowObj[n]:SetPoint("CENTER",x,yEven[6]);
														break;
													end
												end
												break;
											end
										end
										break;
									end
								end
								break;
							end
						end
						break;
					end
				end
				break;
			end
		end
	end
	
	wipe(rowObj);
	wipe(rowList);
	wipe(yEven);
	wipe(yOdd);
end

function Auras:UpdateTalents()
	SSA.spec = GetSpecialization()
	spec = SSA.spec;
	local rowObj,rowList = {},{};
	
	if (spec == 1) then -- Elemental
		if (Auras.db.char.frames.timerbars.buff[1]) then
			SSA.BuffTimerBarGrpEle:Show();
		else
			SSA.BuffTimerBarGrpEle:Hide();
		end
		if (Auras.db.char.frames.timerbars.main[1]) then
			SSA.MainTimerBarGrpEle:Show();
		else
			SSA.MainTimerBarGrpEle:Hide();
		end
		if (Auras.db.char.frames.timerbars.util[1]) then
			SSA.UtilTimerBarGrpEle:Show();
		else
			SSA.UtilTimerBarGrpEle:Hide();
		end

		-- Check if "Echo of the Elements" is learned.
		if (select(4,GetTalentInfo(4,3,1))) then
			SSA.isEoE = true;
		else
			SSA.isEoE = false;
		end

		--Auras:ToggleAuraVisibility(1);
		
		------------------------------------------------------------
		---- Top Icon Row
		----
		
		rowObj = {
			[1] = SSA.FlameShock,
			[2] = SSA.EarthShock,
			[3] = SSA.LavaBurstEle,
			[4] = SSA.Earthquake,
			[5] = SSA.ElementalBlast,
		}
		
		rowList = {
			[1] = Auras.db.char.aura[1].FlameShock,
			[2] = Auras.db.char.aura[1].EarthShock,
			[3] = Auras.db.char.aura[1].LavaBurstEle,
			[4] = Auras.db.char.aura[1].Earthquake,
			[5] = Auras.db.char.aura[1].ElementalBlast and select(4,GetTalentInfo(5,3,1)),
		}
		
		BuildHorizontalIconRow(rowObj,rowList,0,1,'top');
		
		------------------------------------------------------------
		---- Bottom Icon Row
		----
		
		rowObj = {
			[1] = SSA.FireElemental,
			[2] = SSA.StormElemental,
			[3] = SSA.Stormkeeper,
			[4] = SSA.AscendanceEle,
			[5] = SSA.ElementalMastery,
			[6] = SSA.LiquidMagmaTotem,
			[7] = SSA.Icefury,
		}
		
		rowList = {
			[1] = Auras.db.char.aura[1].FireElemental and (select(4,GetTalentInfo(6,1,1)) or select(4,GetTalentInfo(6,3,1))),
			[2] = Auras.db.char.aura[1].StormElemental and select(4,GetTalentInfo(6,2,1)),
			[3] = Auras.db.char.aura[1].Stormkeeper,
			[4] = Auras.db.char.aura[1].AscendanceEle and select(4,GetTalentInfo(7,1,1)),
			[5] = Auras.db.char.aura[1].ElementalMastery and select(4,GetTalentInfo(4,3,1)),
			[6] = Auras.db.char.aura[1].LiquidMagmaTotem and select(4,GetTalentInfo(6,1,1)),
			[7] = Auras.db.char.aura[1].Icefury and select(4,GetTalentInfo(7,3,1)),
		}
		
		BuildHorizontalIconRow(rowObj,rowList,0,1,'bottom');
		
		------------------------------------------------------------
		---- Left Icon Row
		----
		
		rowObj = {
			[1] = SSA.WindShearEle,
			[2] = SSA.AstralShiftEle,
			[3] = SSA.HexEle,
			[4] = SSA.VoodooTotemEle,
			[5] = SSA.AncestralGuidanceEle,
			[6] = SSA.CleanseSpiritEle,
		}
		
		rowList = {
			[1] = Auras.db.char.aura[1].WindShearEle,
			[2] = Auras.db.char.aura[1].AstralShiftEle,
			[3] = Auras.db.char.aura[1].HexEle and (select(4,GetTalentInfo(3,1,1)) or select(4,GetTalentInfo(3,2,1))),
			[4] = Auras.db.char.aura[1].VoodooTotemEle and select(4,GetTalentInfo(3,3,1)),
			[5] = Auras.db.char.aura[1].AncestralGuidanceEle and select(4,GetTalentInfo(2,2,1)),
			[6] = Auras.db.char.aura[1].CleanseSpiritEle,
		}
		
		BuildVerticalIconRow(rowObj,rowList,0,1,'left');
		
		------------------------------------------------------------
		---- Right Icon Row
		----
		
		rowObj = {
			[1] = SSA.Thunderstorm,
			[2] = SSA.EarthElemental,
			[3] = SSA.LightningSurgeTotemEle,
			[4] = SSA.EarthgrabTotemEle,
			[5] = SSA.WindRushTotemEle,
			[6] = SSA.GustWindEle,
		}
		
		rowList = {
			[1] = Auras.db.char.aura[1].Thunderstorm,
			[2] = Auras.db.char.aura[1].EarthElemental,
			[3] = Auras.db.char.aura[1].LightningSurgeTotemEle and select(4,GetTalentInfo(3,1,1)),
			[4] = Auras.db.char.aura[1].EarthgrabTotemEle and select(4,GetTalentInfo(3,2,1)),
			[5] = Auras.db.char.aura[1].WindRushTotemEle and select(4,GetTalentInfo(2,3,1)),
			[6] = Auras.db.char.aura[1].GustWindEle and select(4,GetTalentInfo(2,1,1)),
		}
		
		BuildVerticalIconRow(rowObj,rowList,0,1,'right');
		
		-- Show Elemental-only Objects
		--[[SSA.FlameShockGlow:Show();
		SSA.EarthShockGlow:Show();
		SSA.LavaBurstGlow:Show();]]
		
	elseif (spec == 2) then -- Enhancement
		Auras:ToggleAuraVisibility(2)
		if (Auras.db.char.frames.timerbars.buff[2]) then
			SSA.BuffTimerBarGrpEnh:Show();
		else
			SSA.BuffTimerBarGrpEnh:Hide();
		end
		if (Auras.db.char.frames.timerbars.main[2]) then
			SSA.MainTimerBarGrpEnh:Show();
		else
			SSA.MainTimerBarGrpEnh:Hide();
		end
		if (Auras.db.char.frames.timerbars.util[2]) then
			SSA.UtilTimerBarGrpEnh:Show();
		else
			SSA.UtilTimerBarGrpEnh:Hide();
		end
		SSA.isEoE = false;
				
		--Auras:ToggleAuraVisibility(2)
		
		------------------------------------------------------------
		---- Top Icon Row
		----
		
		rowObj = {
			[1] = SSA.Flametongue,
			[2] = SSA.Frostbrand,
			[3] = SSA.Stormstrike,
			[4] = SSA.CrashLightning,
			[5] = SSA.LavaLash
		}
		
		rowList = {
			[1] = Auras.db.char.aura[2].Flametongue,
			[2] = Auras.db.char.aura[2].Frostbrand,
			[3] = Auras.db.char.aura[2].Stormstrike,
			[4] = Auras.db.char.aura[2].CrashLightning,
			[5] = Auras.db.char.aura[2].LavaLash,
		}
		
		BuildHorizontalIconRow(rowObj,rowList,0,2,'top');
		
		------------------------------------------------------------
		---- Bottom Icon Row
		----
		
		rowObj = {
			[1] = SSA.DoomWinds,
			[2] = SSA.Boulderfist,
			[3] = SSA.Windsong,
			[4] = SSA.AscendanceEnh,
			[5] = SSA.EarthenSpike,
			[6] = SSA.Sundering,
			[7] = SSA.FeralSpirit,
		}
		
		rowList = {
			[1] = Auras.db.char.aura[2].DoomWinds,
			[2] = Auras.db.char.aura[2].Boulderfist and select(4,GetTalentInfo(1,3,1)),
			[3] = Auras.db.char.aura[2].Windsong and select(4,GetTalentInfo(1,1,1)),
			[4] = Auras.db.char.aura[2].AscendanceEnh and select(4,GetTalentInfo(7,1,1)),
			[5] = Auras.db.char.aura[2].EarthenSpike and select(4,GetTalentInfo(7,3,1)),
			[6] = Auras.db.char.aura[2].Sundering and select(4,GetTalentInfo(6,3,1)),
			[7] = Auras.db.char.aura[2].FeralSpirit,
		}
		
		BuildHorizontalIconRow(rowObj,rowList,0,2,'bottom');
		
		------------------------------------------------------------
		---- Left Icon Row
		----
		
		rowObj = {
			[1] = SSA.WindShearEnh,
			[2] = SSA.HexEnh,
			[3] = SSA.VoodooTotemEnh,
			[4] = SSA.Rainfall,
			[5] = SSA.CleanseSpiritEnh,
		}
		
		rowList = {
			[1] = Auras.db.char.aura[2].WindShearEnh,
			[2] = Auras.db.char.aura[2].HexEnh and (select(4,GetTalentInfo(3,1,1)) or select(4,GetTalentInfo(3,2,1))),
			[3] = Auras.db.char.aura[2].VoodooTotemEnh and select(4,GetTalentInfo(3,3,1)),
			[4] = Auras.db.char.aura[2].Rainfall and select(4,GetTalentInfo(2,1,1)),
			[5] = Auras.db.char.aura[2].CleanseSpiritEnh,
		}

		BuildVerticalIconRow(rowObj,rowList,0,2,'left');
		
		------------------------------------------------------------
		---- Right Icon Row
		----
		
		rowObj = {
			[1] = SSA.SpiritWalk,
			[2] = SSA.AstralShiftEnh,
			[3] = SSA.LightningSurgeTotemEnh,
			[4] = SSA.EarthgrabTotemEnh,
			[5] = SSA.WindRushTotemEnh,
			[6] = SSA.FeralLunge,
		}
		
		rowList = {
			[1] = Auras.db.char.aura[2].SpiritWalk,
			[2] = Auras.db.char.aura[2].AstralShiftEnh,
			[3] = Auras.db.char.aura[2].LightningSurgeTotemEnh and select(4,GetTalentInfo(3,1,1)),
			[4] = Auras.db.char.aura[2].EarthgrabTotemEnh and select(4,GetTalentInfo(3,2,1)),
			[5] = Auras.db.char.aura[2].WindRushTotemEnh and select(4,GetTalentInfo(2,3,1)),
			[6] = Auras.db.char.aura[2].FeralLunge and select(4,GetTalentInfo(2,2,1)),
		}

		BuildVerticalIconRow(rowObj,rowList,0,2,'right');		
	else -- Restoration
		if (Auras.db.char.frames.timerbars.buff[3]) then
			SSA.BuffTimerBarGrpRes:Show();
		else
			SSA.BuffTimerBarGrpRes:Hide();
		end
		if (Auras.db.char.frames.timerbars.main[3]) then
			SSA.MainTimerBarGrpRes:Show();
		else
			SSA.MainTimerBarGrpRes:Hide();
		end
		if (Auras.db.char.frames.timerbars.util[3]) then
			SSA.UtilTimerBarGrpRes:Show();
		else
			SSA.UtilTimerBarGrpRes:Hide();
		end

		-- Check if "Echo of the Elements" is learned.
		if (select(4,GetTalentInfo(6,3,1))) then
			SSA.isEoE = true;
		else
			SSA.isEoE = false;
		end
		
		--Auras:ToggleAuraVisibility(3);
		
		------------------------------------------------------------
		---- Top Icon Row
		----
		
		rowObj = {
			[1] = SSA.Riptide,
			[2] = SSA.HealingStreamTotem,
			[3] = SSA.CloudburstTotem,
			[4] = SSA.HealingRain,
			[5] = SSA.UnleashLife
		}
		
		rowList = {
			[1] = Auras.db.char.aura[3].Riptide,
			[2] = Auras.db.char.aura[3].HealingStreamTotem,
			[3] = Auras.db.char.aura[3].CloudburstTotem and select(4,GetTalentInfo(6,2,1)),
			[4] = Auras.db.char.aura[3].HealingRain,
			[5] = Auras.db.char.aura[3].UnleashLife and select(4,GetTalentInfo(1,2,1)),
		}

		BuildHorizontalIconRow(rowObj,rowList,0,3,'top');
		
		------------------------------------------------------------
		---- Bottom Icon Row
		----
		
		rowObj = {
			[1] = SSA.GiftOfQueen,
			[2] = SSA.HealingTideTotem,
			[3] = SSA.SpiritLinkTotem,
			[4] = SSA.AscendanceRes,
			[5] = SSA.Wellspring,
			[6] = SSA.WindRushTotemRes,
		}
		
		rowList = {
			[1] = Auras.db.char.aura[3].GiftOfQueen,
			[2] = Auras.db.char.aura[3].HealingTideTotem,
			[3] = Auras.db.char.aura[3].SpiritLinkTotem,
			[4] = Auras.db.char.aura[3].AscendanceRes and select(4,GetTalentInfo(7,1,1)),
			[5] = Auras.db.char.aura[3].Wellspring and select(4,GetTalentInfo(7,2,1)),
			[6] = Auras.db.char.aura[3].WindRushTotemRes and select(4,GetTalentInfo(2,3,1)),
		}

		BuildHorizontalIconRow(rowObj,rowList,0,3,'bottom');
		
		------------------------------------------------------------
		---- Left Icon Row
		----
		
		rowObj = {
			[1] = SSA.WindShearRes,
			[2] = SSA.HexRes,
			[3] = SSA.VoodooTotemRes,
			[4] = SSA.PurifySpirit,
			[5] = SSA.SpiritwalkersGrace,
			[6] = SSA.EarthenShieldTotem,
		}
		
		rowList = {
			[1] = Auras.db.char.aura[3].WindShearRes,
			[2] = Auras.db.char.aura[3].HexRes and (select(4,GetTalentInfo(3,1,1)) or select(4,GetTalentInfo(3,2,1))),
			[3] = Auras.db.char.aura[3].VoodooTotemRes and select(4,GetTalentInfo(3,3,1)),
			[4] = Auras.db.char.aura[3].PurifySpirit,
			[5] = Auras.db.char.aura[3].SpiritwalkersGrace,
			[6] = Auras.db.char.aura[3].EarthenShieldTotem and select(4,GetTalentInfo(5,2,1)),
		}

		BuildVerticalIconRow(rowObj,rowList,0,3,'left');
		
		------------------------------------------------------------
		---- Right Icon Row
		----
		
		rowObj = {
			[1] = SSA.FlameShockRes,
			[2] = SSA.LavaBurstRes,
			[3] = SSA.AstralShiftRes,
			[4] = SSA.LightningSurgeTotemRes,
			[5] = SSA.EarthgrabTotemRes,
			[6] = SSA.GustWindRes,
			[7] = SSA.AncestralGuidanceRes,
		}
		
		rowList = {
			[1] = Auras.db.char.aura[3].FlameShockRes,
			[2] = Auras.db.char.aura[3].LavaBurstRes,
			[3] = Auras.db.char.aura[3].AstralShiftRes,
			[4] = Auras.db.char.aura[3].LightningSurgeTotemRes and select(4,GetTalentInfo(3,1,1)),
			[5] = Auras.db.char.aura[3].EarthgrabTotemRes and select(4,GetTalentInfo(3,2,1)),
			[6] = Auras.db.char.aura[3].GustWindRes and select(4,GetTalentInfo(2,1,1)),
			[7] = Auras.db.char.aura[3].AncestralGuidanceRes and select(4,GetTalentInfo(4,2,1)),
		}

		BuildVerticalIconRow(rowObj,rowList,0,3,'right');	
	end
	
	--Auras:SetupCharges()
end
