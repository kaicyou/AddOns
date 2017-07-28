
local FOLDER_NAME, SSA = ...

local Auras = LibStub("AceAddon-3.0"):GetAddon("ShamanAuras")
local L = LibStub("AceLocale-3.0"):GetLocale("ShamanAuras", true)
local LSM = LibStub('LibSharedMedia-3.0')
local ErrorMsg = '';
SSA.InterfaceListItem = nil;

local _G = _G
local floor, fmod = math.floor, math.fmod
local pairs, select, tonumber, tostring = pairs, select, tonumber, tostring
local format,lower = string.format, string.lower
local twipe = table.wipe
-- WoW API / Variables
local C_ArtifactUI = C_ArtifactUI
local CreateFrame = CreateFrame
local GetAddOnMetadata = GetAddOnMetadata
local GetScreenHeight, GetScreenWidth = GetScreenHeight, GetScreenWidth
local GetSpecialization = GetSpecialization
local UnitAffectingCombat = UnitAffectingCombat
local UnitPowerMax = UnitPowerMax
local DEFAULT_CHAT_FRAME = DEFAULT_CHAT_FRAME

function Auras:GetColorVal(r,g,b)
	r = format("%.2f",(r / 255));
	g = format("%.2f",(g / 255));
	b = format("%.2f",(b / 255));
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
	Auras.db.char.settings.grid.gridPreview = false;
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
	input = lower(input);
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
		elseif (input == "info" or input == "changelog") then
			SSA.Bulletin:Show()
		elseif input == "settings" or input == "options" or input == "option" or input == "opt" or input == "config" then
			DEFAULT_CHAT_FRAME:AddMessage("|cFFFFFF77Sweetsour\'s Shaman Auras|r: |cFFFF7777The advanced configuration options have been embed directly in each of the specs' settings. Type /ssa <spec> and select the corresponding tabs that have been added.");
		elseif input == "version" then
			DEFAULT_CHAT_FRAME:AddMessage("|cFFFFFF77Sweetsour\'s Shaman Auras|r: |cFF9999FF"..GetAddOnMetadata(FOLDER_NAME,"Version").."|r");
		else
			DEFAULT_CHAT_FRAME:AddMessage("|cFFFFFF77Sweetsour\'s Shaman Auras|r: |cFFFF7777Invalid input.");
			DEFAULT_CHAT_FRAME:AddMessage("/|cFFFFFF77ssa|r: |cFFFFFFFFOpen addon's home page|r");
			DEFAULT_CHAT_FRAME:AddMessage("/|cFFFFFF77ssa|r |cFFBBBBFFele|r: |cFFFFFFFFOpen Elemental customizations options|r");
			DEFAULT_CHAT_FRAME:AddMessage("/|cFFFFFF77ssa|r |cFFBBBBFFenh|r: |cFFFFFFFFOpen Enhancement customizations options|r");
			DEFAULT_CHAT_FRAME:AddMessage("/|cFFFFFF77ssa|r |cFFBBBBFFresto|r: |cFFFFFFFFOpen Restoration customizations options|r");
			DEFAULT_CHAT_FRAME:AddMessage("/|cFFFFFF77ssa|r |cFFBBBBFFopt|r: |cFFFFFFFFOpen advanced customizations options|r");
			DEFAULT_CHAT_FRAME:AddMessage("/|cFFFFFF77ssa|r |cFFBBBBFFinfo|r: |cFFFFFFFFDisplay current change log|r")
			DEFAULT_CHAT_FRAME:AddMessage("/|cFFFFFF77ssa|r |cFFBBBBFFversion|r: |cFFFFFFFFRetrieve addon's version|r");
		end
	end
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
	
	InterfaceOptionsFrame:Hide();
	GameMenuFrame:Hide();
end

function Auras:BuildMoveUI(AuraObjects,MoveStrings,name)
	local ButtonFont = SSA.ButtonFont;
	local BackdropSB = SSA.BackdropSB;
	local Move = SSA["Move"..name];
	
	Move.Close = CreateFrame("Button","CloseButton",Move);
	Move.Grid = CreateFrame("CheckButton","Move"..name.."Grid",Move,"ChatConfigCheckButtonTemplate");
	Move.InfoDisplay = CreateFrame("CheckButton","Move"..name.."InfoDisplay",Move,"ChatConfigCheckButtonTemplate");
	Move.Info = CreateFrame("Frame","MoveInfoFrame",UIParent);

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
	Move:SetHeight(95);
	Move:SetPoint("CENTER",0,250);
	Move:SetBackdrop(BackdropSB);
	Move:SetBackdropColor(0,0,0);
	Move:Hide();
	
	
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
		local spec = GetSpecialization();
		
		Auras.db.char.elements[spec].isMoving = false
		
		Move:Hide();
		SSA.grid:Hide();

		if (Move.Info:IsShown()) then
			Move.Info:Hide();
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
	end);
	Move.Close:SetScript("OnEnter",function(self,button)
		self:SetBackdropColor(0.5,0.5,0.5);
	end);
	Move.Close:SetScript("OnLeave",function(self,button)
		self:SetBackdropColor(0,0,0);
	end);
	
	Move.Grid:SetPoint("TOPLEFT",10,-10);
	_G[Move.Grid:GetName().."Text"]:SetFont((LSM.MediaTable.font['PT Sans Narrow'] or LSM.DefaultMedia.font), 12);
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
	
	Move.InfoDisplay:SetPoint("TOPLEFT",10,-30);
	Move.InfoDisplay:SetChecked(true);
	_G[Move.InfoDisplay:GetName().."Text"]:SetFont((LSM.MediaTable.font['PT Sans Narrow'] or LSM.DefaultMedia.font), 12);
	_G[Move.InfoDisplay:GetName().."Text"]:SetText(L["Toggle Info Frame"]);
	_G[Move.InfoDisplay:GetName().."Text"]:SetPoint("LEFT",25,0);
	Move.InfoDisplay:SetScript("OnClick",function(self)
		if (self:GetChecked()) then
			Move.Info:Show();
		else
			Move.Info:Hide();
		end
	end);
end



function Auras:CreateVerticalStatusBar(statusbar,anchor,x,r1,g1,b1,text,duration)
	r1 = format("%.2f",(r1 / 255));
	g1 = format("%.2f",(g1 / 255));
	b1 = format("%.2f",(b1 / 255));
	
	statusbar:SetStatusBarTexture(LSM.MediaTable.statusbar['Glamour2']);
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
	statusbar.bg:SetTexture(LSM.MediaTable.statusbar['Blizzard']);
	statusbar.bg:SetAllPoints(true);
	statusbar.bg:SetVertexColor(0,0,0);
	statusbar.bg:SetAlpha(0.5);

	statusbar.timetext = statusbar:CreateFontString(nil, "MEDIUM", "GameFontHighlightLarge");
	statusbar.timetext:SetPoint("BOTTOM",-6,4);
	statusbar.timetext:SetFont((LSM.MediaTable.font['Continuum Medium'] or LSM.DefaultMedia.font), 12);
	statusbar.timetext:SetTextColor(1,1,1,1);
	statusbar.timetext:SetJustifyH("CENTER");
	statusbar.timetext:SetJustifyV("MIDDLE");

	statusbar.nametext = statusbar:CreateFontString(nil, "MEDIUM", "GameFontHighlightLarge");
	statusbar.nametext:SetPoint("TOP",-94.5,-4);
	statusbar.nametext:SetFont((LSM.MediaTable.font['Continuum Medium'] or LSM.DefaultMedia.font), 12);
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

local function BuildHorizontalIconRow(rowObj,rowList,y,spec,group,side)
	local rowCtr = 0;
	local layout = Auras.db.char.layout[spec][group][side];
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
			rowObj[i].Charges.text:SetFont((LSM.MediaTable.font['ABF'] or LSM.DefaultMedia.font), layout.charges,"OUTLINE");
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
	
	twipe(rowObj);
	twipe(rowList);
	twipe(xEven);
	twipe(xOdd);
end

local function BuildVerticalIconRow(rowObj,rowList,x,spec,group,side)
	local rowCtr = 0;
	local layout = Auras.db.char.layout[spec][group][side];
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
			rowObj[i].Charges.text:SetFont((LSM.MediaTable.font['ABF'] or LSM.DefaultMedia.font), layout.charges,"OUTLINE");
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
	
	twipe(rowObj);
	twipe(rowList);
	twipe(yEven);
	twipe(yOdd);
end

function Auras:UpdateTalents(isTalentChange)
	--SSA.spec = GetSpecialization()
	--spec = SSA.spec;
	local spec = GetSpecialization();
	local db = Auras.db.char
	
	local rowObj,rowList = {},{};
	if (isTalentChange and InterfaceOptionsFrame:IsShown()) then
		InterfaceOptionsFrame:Hide();
	end
	
	if (spec == 1) then -- Elemental
		if (db.elements[1].timerbars.buff.isEnabled) then
			SSA.BuffTimerBarGrpEle:Show();
		else
			SSA.BuffTimerBarGrpEle:Hide();
		end
		if (db.elements[1].timerbars.main.isEnabled) then
			SSA.MainTimerBarGrpEle:Show();
		else
			SSA.MainTimerBarGrpEle:Hide();
		end
		if (db.elements[1].timerbars.util.isEnabled) then
			SSA.UtilTimerBarGrpEle:Show();
		else
			SSA.UtilTimerBarGrpEle:Hide();
		end

		-- Initialize Progress Bars Upon Specialization Change
		Auras:InitializeProgressBar('MaelstromBarEle',nil,'maelstromBar','text',nil,1)
		Auras:InitializeProgressBar('CastBarEle',nil,'castBar','nametext','timetext',1)
		Auras:InitializeProgressBar('ChannelBarEle',nil,'channelBar','nametext','timetext',1)
		Auras:InitializeProgressBar('IcefuryBar','Timer','icefuryBar','counttext','timetext',1)
		
		-- Initialize Frame Groups Upon Specialization Change
		Auras:InitializeFrameGroup(Auras.db.char.elements[1].frames)
		
		------------------------------------------------------------
		---- Primary Aura Group #1
		----
		
		rowObj = {
			[1] = SSA.FlameShock,
			[2] = SSA.EarthShock,
			[3] = SSA.LavaBurstEle,
			[4] = SSA.Earthquake,
			[5] = SSA.ElementalBlast,
		}
		
		rowList = {
			[1] = db.auras[1].FlameShock,
			[2] = db.auras[1].EarthShock,
			[3] = db.auras[1].LavaBurstEle,
			[4] = db.auras[1].Earthquake,
			[5] = db.auras[1].ElementalBlast and select(4,GetTalentInfo(5,3,1)),
		}
		
		if (Auras.db.char.layout[1].orientation.top == "Horizontal") then
			BuildHorizontalIconRow(rowObj,rowList,0,1,'primary','top');
		else
			BuildVerticalIconRow(rowObj,rowList,0,1,'primary','top');
		end
		
		------------------------------------------------------------
		---- Primary Aura Group #2
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
			[1] = db.auras[1].FireElemental and (select(4,GetTalentInfo(6,1,1)) or select(4,GetTalentInfo(6,3,1))),
			[2] = db.auras[1].StormElemental and select(4,GetTalentInfo(6,2,1)),
			[3] = db.auras[1].Stormkeeper,
			[4] = db.auras[1].AscendanceEle and select(4,GetTalentInfo(7,1,1)),
			[5] = db.auras[1].ElementalMastery and select(4,GetTalentInfo(4,3,1)),
			[6] = db.auras[1].LiquidMagmaTotem and select(4,GetTalentInfo(6,1,1)),
			[7] = db.auras[1].Icefury and select(4,GetTalentInfo(7,3,1)),
		}
		
		if (Auras.db.char.layout[1].orientation.bottom == "Horizontal") then
			BuildHorizontalIconRow(rowObj,rowList,0,1,'primary','bottom');
		else
			BuildVerticalIconRow(rowObj,rowList,0,1,'primary','bottom');
		end
		
		------------------------------------------------------------
		---- Primary Aura Group #3
		----
		
		local _,_,name,_,_,rank = C_ArtifactUI.GetEquippedArtifactInfo();
		
		rowObj = {
			[1] = SSA.ElementalFocus,
			[2] = SSA.PowerOfMaelstrom,
			[3] = SSA.ConcordanceEle,
		}
		
		rowList = {
			[1] = db.auras[1].ElementalFocus,
			[2] = db.auras[1].PowerOfMaelstrom,
			[3] = db.auras[1].ConcordanceEle and (rank or 0) >= 52,
		}
		--SSA.DataFrame.text:SetText(rowList[3]);
		if (Auras.db.char.layout[1].orientation.extra == "Horizontal") then
			BuildHorizontalIconRow(rowObj,rowList,0,1,'primary','extra');
		else
			BuildVerticalIconRow(rowObj,rowList,0,1,'primary','extra');
		end
		
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
			[1] = db.auras[1].WindShearEle,
			[2] = db.auras[1].AstralShiftEle,
			[3] = db.auras[1].HexEle and (select(4,GetTalentInfo(3,1,1)) or select(4,GetTalentInfo(3,2,1))),
			[4] = db.auras[1].VoodooTotemEle and select(4,GetTalentInfo(3,3,1)),
			[5] = db.auras[1].AncestralGuidanceEle and select(4,GetTalentInfo(2,2,1)),
			[6] = db.auras[1].CleanseSpiritEle,
		}
		
		if (Auras.db.char.layout[1].orientation.left == "Horizontal") then
			BuildHorizontalIconRow(rowObj,rowList,0,1,'secondary','left');
		else
			BuildVerticalIconRow(rowObj,rowList,0,1,'secondary','left');
		end
		
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
			[1] = db.auras[1].Thunderstorm,
			[2] = db.auras[1].EarthElemental,
			[3] = db.auras[1].LightningSurgeTotemEle and select(4,GetTalentInfo(3,1,1)),
			[4] = db.auras[1].EarthgrabTotemEle and select(4,GetTalentInfo(3,2,1)),
			[5] = db.auras[1].WindRushTotemEle and select(4,GetTalentInfo(2,3,1)),
			[6] = db.auras[1].GustWindEle and select(4,GetTalentInfo(2,1,1)),
		}
		
		if (Auras.db.char.layout[1].orientation.right == "Horizontal") then
			BuildHorizontalIconRow(rowObj,rowList,0,1,'secondary','right');
		else
			BuildVerticalIconRow(rowObj,rowList,0,1,'secondary','right');
		end
		
		-- Show Elemental-only Objects
		--[[SSA.FlameShockGlow:Show();
		SSA.EarthShockGlow:Show();
		SSA.LavaBurstGlow:Show();]]
		
	elseif (spec == 2) then -- Enhancement
		Auras:ToggleAuraVisibility(2)
		if (db.elements[2].timerbars.buff.isEnabled) then
			SSA.BuffTimerBarGrpEnh:Show();
		else
			SSA.BuffTimerBarGrpEnh:Hide();
		end
		if (db.elements[2].timerbars.main.isEnabled) then
			SSA.MainTimerBarGrpEnh:Show();
		else
			SSA.MainTimerBarGrpEnh:Hide();
		end
		if (db.elements[2].timerbars.util.isEnabled) then
			SSA.UtilTimerBarGrpEnh:Show();
		else
			SSA.UtilTimerBarGrpEnh:Hide();
		end
		
		-- Initialize Progress Bars Upon Specialization Change
		Auras:InitializeProgressBar('MaelstromBarEnh',nil,'maelstromBar','text',nil,2)
		Auras:InitializeProgressBar('CastBarEnh',nil,'castBar','nametext','timetext',2)
		Auras:InitializeProgressBar('ChannelBarEnh',nil,'channelBar','nametext','timetext',2)
		
		-- Initialize Frame Groups Upon Specialization Change
		Auras:InitializeFrameGroup(Auras.db.char.elements[2].frames)
		
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
			[1] = db.auras[2].Flametongue,
			[2] = db.auras[2].Frostbrand,
			[3] = db.auras[2].Stormstrike,
			[4] = db.auras[2].CrashLightning,
			[5] = db.auras[2].LavaLash,
		}
		
		--BuildHorizontalIconRow(rowObj,rowList,0,2,'top');
		if (Auras.db.char.layout[2].orientation.top == "Horizontal") then
			BuildHorizontalIconRow(rowObj,rowList,0,2,'primary','top');
		else
			BuildVerticalIconRow(rowObj,rowList,0,2,'primary','top');
		end
		
		------------------------------------------------------------
		---- Bottom Icon Row
		----
		
		rowObj = {
			[1] = SSA.Rockbiter,
			[2] = SSA.Windsong,
			[3] = SSA.AscendanceEnh,
			[4] = SSA.EarthenSpike,
			[5] = SSA.Sundering,
			[6] = SSA.FeralSpirit,
		}
		
		rowList = {
			[1] = db.auras[2].Rockbiter,
			[2] = db.auras[2].Windsong and select(4,GetTalentInfo(1,1,1)),
			[3] = db.auras[2].AscendanceEnh and select(4,GetTalentInfo(7,1,1)),
			[4] = db.auras[2].EarthenSpike and select(4,GetTalentInfo(7,3,1)),
			[5] = db.auras[2].Sundering and select(4,GetTalentInfo(6,3,1)),
			[6] = db.auras[2].FeralSpirit,
		}
		
		--BuildHorizontalIconRow(rowObj,rowList,0,2,'bottom');
		if (Auras.db.char.layout[2].orientation.bottom == "Horizontal") then
			BuildHorizontalIconRow(rowObj,rowList,0,2,'primary','bottom');
		else
			BuildVerticalIconRow(rowObj,rowList,0,2,'primary','bottom');
		end
		
		------------------------------------------------------------
		---- Primary Aura Group #3
		----
		
		local _,_,name,_,_,rank = C_ArtifactUI.GetEquippedArtifactInfo();
		
		rowObj = {
			[1] = SSA.DoomWinds,
			[2] = SSA.UnleashDoom,
			[3] = SSA.ConcordanceEnh,
		}
		
		rowList = {
			[1] = db.auras[2].DoomWinds,
			[2] = db.auras[2].UnleashDoom,
			[3] = db.auras[2].ConcordanceEnh and (rank or 0) >= 52,
		}
		--SSA.DataFrame.text:SetText(rowList[3]);
		if (Auras.db.char.layout[2].orientation.extra == "Horizontal") then
			BuildHorizontalIconRow(rowObj,rowList,0,2,'primary','extra');
		else
			BuildVerticalIconRow(rowObj,rowList,0,2,'primary','extra');
		end
		
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
			[1] = db.auras[2].WindShearEnh,
			[2] = db.auras[2].HexEnh and (select(4,GetTalentInfo(3,1,1)) or select(4,GetTalentInfo(3,2,1))),
			[3] = db.auras[2].VoodooTotemEnh and select(4,GetTalentInfo(3,3,1)),
			[4] = db.auras[2].Rainfall and select(4,GetTalentInfo(2,1,1)),
			[5] = db.auras[2].CleanseSpiritEnh,
		}

		--BuildVerticalIconRow(rowObj,rowList,0,2,'left');
		if (Auras.db.char.layout[2].orientation.left == "Horizontal") then
			BuildHorizontalIconRow(rowObj,rowList,0,2,'secondary','left');
		else
			BuildVerticalIconRow(rowObj,rowList,0,2,'secondary','left');
		end
		
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
			[1] = db.auras[2].SpiritWalk,
			[2] = db.auras[2].AstralShiftEnh,
			[3] = db.auras[2].LightningSurgeTotemEnh and select(4,GetTalentInfo(3,1,1)),
			[4] = db.auras[2].EarthgrabTotemEnh and select(4,GetTalentInfo(3,2,1)),
			[5] = db.auras[2].WindRushTotemEnh and select(4,GetTalentInfo(2,3,1)),
			[6] = db.auras[2].FeralLunge and select(4,GetTalentInfo(2,2,1)),
		}

		--BuildVerticalIconRow(rowObj,rowList,0,2,'right');		
		if (Auras.db.char.layout[2].orientation.right == "Horizontal") then
			BuildHorizontalIconRow(rowObj,rowList,0,2,'secondary','right');
		else
			BuildVerticalIconRow(rowObj,rowList,0,2,'secondary','right');
		end
	else -- Restoration
		if (db.elements[3].timerbars.buff) then
			SSA.BuffTimerBarGrpRes:Show();
		else
			SSA.BuffTimerBarGrpRes:Hide();
		end
		if (db.elements[3].timerbars.main) then
			SSA.MainTimerBarGrpRes:Show();
		else
			SSA.MainTimerBarGrpRes:Hide();
		end
		if (db.elements[3].timerbars.util) then
			SSA.UtilTimerBarGrpRes:Show();
		else
			SSA.UtilTimerBarGrpRes:Hide();
		end

		-- Initialize Progress Bars Upon Specialization Change
		Auras:InitializeProgressBar('CastBarRes',nil,'castBar','nametext','timetext',3)
		Auras:InitializeProgressBar('ChannelBarRes',nil,'channelBar','nametext','timetext',3)
		Auras:InitializeProgressBar('ManaBar',nil,'manaBar','text',nil,3)
		Auras:InitializeProgressBar('TidalWavesBar',nil,'tidalWavesBar',nil,nil,3)
		Auras:InitializeProgressBar('EarthenShieldTotemBar','Timer','earthenShieldBar','healthtext','timetext',3)
		
		-- Initialize Frame Groups Upon Specialization Change
		Auras:InitializeFrameGroup(Auras.db.char.elements[3].frames)
		
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
			[1] = db.auras[3].Riptide,
			[2] = db.auras[3].HealingStreamTotem,
			[3] = db.auras[3].CloudburstTotem and select(4,GetTalentInfo(6,2,1)),
			[4] = db.auras[3].HealingRain,
			[5] = db.auras[3].UnleashLife and select(4,GetTalentInfo(1,2,1)),
		}

		--BuildHorizontalIconRow(rowObj,rowList,0,3,'top');
		if (Auras.db.char.layout[3].orientation.top == "Horizontal") then
			BuildHorizontalIconRow(rowObj,rowList,0,3,'primary','top');
		else
			BuildVerticalIconRow(rowObj,rowList,0,3,'primary','top');
		end
		
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
			[1] = db.auras[3].GiftOfQueen,
			[2] = db.auras[3].HealingTideTotem,
			[3] = db.auras[3].SpiritLinkTotem,
			[4] = db.auras[3].AscendanceRes and select(4,GetTalentInfo(7,1,1)),
			[5] = db.auras[3].Wellspring and select(4,GetTalentInfo(7,2,1)),
			[6] = db.auras[3].WindRushTotemRes and select(4,GetTalentInfo(2,3,1)),
		}

		--BuildHorizontalIconRow(rowObj,rowList,0,3,'bottom');
		if (Auras.db.char.layout[3].orientation.bottom == "Horizontal") then
			BuildHorizontalIconRow(rowObj,rowList,0,3,'primary','bottom');
		else
			BuildVerticalIconRow(rowObj,rowList,0,3,'primary','bottom');
		end
		
		------------------------------------------------------------
		---- Primary Aura Group #3
		----
		
		local _,_,name,_,_,rank = C_ArtifactUI.GetEquippedArtifactInfo();
		
		rowObj = {
			--[1] = SSA.UnleashDoom,
			[1] = SSA.ConcordanceRes,
		}
		
		rowList = {
			--[1] = db.auras[2].UnleashDoom,
			[1] = db.auras[3].ConcordanceRes and (rank or 0) >= 52,
		}
		--SSA.DataFrame.text:SetText(rowList[3]);
		if (Auras.db.char.layout[3].orientation.extra == "Horizontal") then
			BuildHorizontalIconRow(rowObj,rowList,0,3,'primary','extra');
		else
			BuildVerticalIconRow(rowObj,rowList,0,3,'primary','extra');
		end
		
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
			[1] = db.auras[3].WindShearRes,
			[2] = db.auras[3].HexRes and (select(4,GetTalentInfo(3,1,1)) or select(4,GetTalentInfo(3,2,1))),
			[3] = db.auras[3].VoodooTotemRes and select(4,GetTalentInfo(3,3,1)),
			[4] = db.auras[3].PurifySpirit,
			[5] = db.auras[3].SpiritwalkersGrace,
			[6] = db.auras[3].EarthenShieldTotem and select(4,GetTalentInfo(5,2,1)),
		}

		--BuildVerticalIconRow(rowObj,rowList,0,3,'left');
		if (Auras.db.char.layout[3].orientation.left == "Horizontal") then
			BuildHorizontalIconRow(rowObj,rowList,0,3,'secondary','left');
		else
			BuildVerticalIconRow(rowObj,rowList,0,3,'secondary','left');
		end
		
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
			[1] = db.auras[3].FlameShockRes,
			[2] = db.auras[3].LavaBurstRes,
			[3] = db.auras[3].AstralShiftRes,
			[4] = db.auras[3].LightningSurgeTotemRes and select(4,GetTalentInfo(3,1,1)),
			[5] = db.auras[3].EarthgrabTotemRes and select(4,GetTalentInfo(3,2,1)),
			[6] = db.auras[3].GustWindRes and select(4,GetTalentInfo(2,1,1)),
			[7] = db.auras[3].AncestralGuidanceRes and select(4,GetTalentInfo(4,2,1)),
		}

		--BuildVerticalIconRow(rowObj,rowList,0,3,'right');	
		if (Auras.db.char.layout[3].orientation.right == "Horizontal") then
			BuildHorizontalIconRow(rowObj,rowList,0,3,'secondary','right');
		else
			BuildVerticalIconRow(rowObj,rowList,0,3,'secondary','right');
		end
	end
	
	--Auras:SetupCharges()
end
