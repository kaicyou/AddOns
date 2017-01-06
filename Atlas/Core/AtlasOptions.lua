-- $Id: AtlasOptions.lua 126 2016-12-27 17:45:39Z arith $
--[[

	Atlas, a World of Warcraft instance map browser
	Copyright 2005 ~ 2010 - Dan Gilbert <dan.b.gilbert@gmail.com>
	Copyright 2010 - Lothaer <lothayer@gmail.com>, Atlas Team
	Copyright 2011 ~ 2017 - Arith Hsu, Atlas Team <atlas.addon at gmail dot com>

	This file is part of Atlas.

	Atlas is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	Atlas is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with Atlas; if not, write to the Free Software
	Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

--]]


--[[
function AtlasOptions_ResetPosition()
	AtlasFrame:ClearAllPoints();
	AtlasFrame:SetPoint("TOPLEFT", 0, -104);
	AtlasOptions.AtlasButtonPosition = 356;
	AtlasOptions.AtlasButtonRadius = 78;
	AtlasOptions.AtlasAlpha = 1.0;
	AtlasOptions.AtlasScale = 1.0;
	AtlasOptions_Init();
end
]]

-- Show the Atlas Options
function AtlasOptions_Toggle()
	if InterfaceOptionsFrame:IsVisible() then
		InterfaceOptionsFrame:Hide();
	else
		InterfaceOptionsFrame_OpenToCategory("Atlas");
		InterfaceOptionsFrame_OpenToCategory("Atlas");
	end
end


function AtlasOptions_AutoSelectToggle()
	AtlasOptions.AtlasAutoSelect = not AtlasOptions.AtlasAutoSelect;
end


function AtlasOptions_RightClickToggle()
	AtlasOptions.AtlasRightClick = not AtlasOptions.AtlasRightClick;
end


function AtlasOptions_AcronymsToggle()
	AtlasOptions.AtlasAcronyms = not AtlasOptions.AtlasAcronyms;
	Atlas_Refresh();
end


function AtlasOptions_ClampedToggle()
	AtlasOptions.AtlasClamped = not AtlasOptions.AtlasClamped;
	AtlasFrame:SetClampedToScreen(AtlasOptions.AtlasClamped);
	Atlas_Refresh();
end


function AtlasOptions_CtrlToggle()
	AtlasOptions.AtlasCtrl = not AtlasOptions.AtlasCtrl;
	Atlas_Refresh();
end


function AtlasOptions_ToggleLock()
	AtlasOptions.AtlasLocked = not AtlasOptions.AtlasLocked;
	Atlas_UpdateLock();
	Atlas_Refresh();
end


function AtlasOptions_ToggleBossDesc()
	AtlasOptions.AtlasBossDesc = not AtlasOptions.AtlasBossDesc;
	Atlas_Refresh();
end


function AtlasOptions_ToggleCheckModule()
	AtlasOptions.AtlasCheckModule = not AtlasOptions.AtlasCheckModule;
	Atlas_Refresh();
end

--[[
function AtlasOptions_ToggleColoringDropDown()
	AtlasOptions.AtlasColoringDropDown = not AtlasOptions.AtlasColoringDropDown;
	Atlas_Refresh();
end
]]

local function AtlasReset_Dropdowns()
	AtlasOptions.AtlasZone = 1;
	AtlasOptions.AtlasType = 1;
	Atlas_PopulateDropdowns();
	Atlas_Refresh();
	AtlasFrameDropDownType_OnShow();
	AtlasFrameDropDown_OnShow();
end


function AtlasOptions_Reset()
	Atlas_FreshOptions();
	--AtlasOptions_ResetPosition(); --also calls AtlasOptions_Init()
	AtlasReset_Dropdowns(); --also calls Atlas_Refresh()
	AtlasButton_Init();
	Atlas_UpdateLock();
end


function AtlasOptions_OnLoad(panel)
	panel.name = "Atlas";
	panel.default = AtlasOptions_Reset;
	InterfaceOptions_AddCategory(panel);
	if (LibStub:GetLibrary("LibAboutPanel", true)) then
		LibStub("LibAboutPanel").new("Atlas", "Atlas");
	end
end

function AtlasOptions_OnShow(self)
	AtlasOptionsFrameToggleButton:SetChecked(AtlasOptions.AtlasButtonShown);
	AtlasOptionsFrameAutoSelect:SetChecked(AtlasOptions.AtlasAutoSelect);
	AtlasOptionsFrameRightClick:SetChecked(AtlasOptions.AtlasRightClick);
	AtlasOptionsFrameAcronyms:SetChecked(AtlasOptions.AtlasAcronyms);
	AtlasOptionsFrameClamped:SetChecked(AtlasOptions.AtlasClamped);
	AtlasOptionsFrameCtrl:SetChecked(AtlasOptions.AtlasCtrl);
	AtlasOptionsFrameLock:SetChecked(AtlasOptions.AtlasLocked);
	AtlasOptionsFrameBossDesc:SetChecked(AtlasOptions.AtlasBossDesc);
	AtlasOptionsFrameCheckModule:SetChecked(AtlasOptions.AtlasCheckModule);
	AtlasOptionsFrameColoringDropdown:SetChecked(AtlasOptions.AtlasColoringDropDown);
--	AtlasOptionsFrameSliderButtonPos:SetValue(AtlasOptions.AtlasButtonPosition);
--	AtlasOptionsFrameSliderButtonRad:SetValue(AtlasOptions.AtlasButtonRadius);
	AtlasOptionsFrameSliderAlpha:SetValue(AtlasOptions.AtlasAlpha);
	AtlasOptionsFrameSliderScale:SetValue(AtlasOptions.AtlasScale);
	AtlasOptionsFrameSliderBossDescScale:SetValue(AtlasOptions.AtlasBossDescScale);
	--[[
	if (not AtlasOptions["AtlasBossDesc"]) then
		AtlasOptionsFrameSliderBossDescScale:Hide();
	end
	]]
	Lib_UIDropDownMenu_Initialize(AtlasOptionsFrameDropDownCats, AtlasOptionsFrameDropDownCats_Initialize);
	Lib_UIDropDownMenu_SetSelectedID(AtlasOptionsFrameDropDownCats, AtlasOptions.AtlasSortBy);
	Lib_UIDropDownMenu_SetWidth(AtlasOptionsFrameDropDownCats, 160);
end


function AtlasOptions_SetupSlider(self, text, mymin, mymax, step)
	self:SetMinMaxValues(mymin, mymax);
	--_G[self:GetName().."Low"]:SetText(mymin);
	--_G[self:GetName().."High"]:SetText(mymax);
	self:SetValueStep(step);
end


local function round(num, idp)
   local mult = 10 ^ (idp or 0);
   return math.floor(num * mult + 0.5) / mult;
end


function AtlasOptions_UpdateSlider(self, text)
	_G[self:GetName().."Text"]:SetText("|cffffd200"..text.." ("..round(self:GetValue(), 3)..")");
end


function AtlasOptionsFrameDropDownCats_Initialize()
	for i = 1, getn(Atlas_DropDownLayouts_Order) do
		local info = Lib_UIDropDownMenu_CreateInfo();
		info.text = Atlas_DropDownLayouts_Order[i];
		info.func = AtlasOptionsFrameDropDownCats_OnClick;
		info.arg1 = i;
		if (AtlasOptions.AtlasSortBy == i) then
			info.checked = true;
		else
			info.checked = nil;
		end
		Lib_UIDropDownMenu_AddButton(info, 1);
	end
end

function AtlasOptionsFrameDropDownCats_OnClick(self)
	local thisID = self:GetID();
	Lib_UIDropDownMenu_SetSelectedID(AtlasOptionsFrameDropDownCats, thisID);
	AtlasOptions.AtlasSortBy = thisID;
	AtlasReset_Dropdowns();
end

function AtlasOptions_OnMouseWheel(self, delta)
	if (delta > 0) then
		self:SetValue(self:GetValue() + self:GetValueStep())
	else
		self:SetValue(self:GetValue() - self:GetValueStep())
	end
end
