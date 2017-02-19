--[[
Name: LibTabbedFrame-1.0
Maintainers: Sutorix <sutorix@hotmail.com>
Description: A library to handle Player sized frames with tabs.
Copyright (c) by The Software Cobbler
Licensed under a Creative Commons "Attribution Non-Commercial Share Alike" License
--]]

local MAJOR_VERSION = "LibSideTabFrame-1.0"
local MINOR_VERSION = 90000 + tonumber(("1000"):match("%d+"))

if not LibStub then error(MAJOR_VERSION .. " requires LibStub") end

local SideTabLib, oldLib = LibStub:NewLibrary(MAJOR_VERSION, MINOR_VERSION)
if not SideTabLib then
	return
end

local copyfuncs = {};

function SideTabLib:GetFrameInfo(f)
	local n;
	if ( type(f) == "string" ) then
		n = f;
		f = getglobal(f);
	else
		n = f:GetName();
	end
	return f, n;
end
tinsert(copyfuncs, "GetFrameInfo");

local function OptionTab_OnClick(self)
	if ( self.parent.currentTab ~= self ) then
		local lasttab =self.parent.currentTab;
		if ( lasttab ) then
			lasttab:SetChecked(false);
		end
		self.parent.currentTab = self;
	end
	self:SetChecked(true);

	if (self.onclick) then
		self.onclick(self, self.name);
	end
end

function SideTabLib:UpdateTabFrame(tab)
	tab:ClearAllPoints();
	if ( self.lastTabFrame ) then
		tab:SetPoint("TOPLEFT", self.lastTabFrame, "BOTTOMLEFT", 0, -17);
	else
		tab:SetPoint("TOPLEFT", self, "TOPRIGHT", 6, -3);
	end
	tab:Show();
	self.lastTabFrame = tab;
end
tinsert(copyfuncs, "UpdateTabFrame");

function SideTabLib:ResetTabFrames()
	self.TabFrames = self.TabFrames or {};
	self.lastTabFrame = nil;
	if ( self.FirstAmongTabs ) then
		self:UpdateTabFrame(self.FirstAmongTabs);
	end
	for id=1,#self.TabFrames do
		local tab = self.TabFrames[id];
		if (#self.TabFrames > 1) then
			tab:Show();
		else
			tab:Hide();
		end
		if ( not tab.first and not tab.ultimate ) then
			self:UpdateTabFrame(tab);
		end
	end
	if ( self.UltimateTab ) then
		self:UpdateTabFrame(self.UltimateTab);
	end
end
tinsert(copyfuncs, "ResetTabFrames");

function SideTabLib:FindTab(target)
	for _,tab in pairs(self.TabFrames) do
		if ( target == tab or target == tab.name ) then
			return tab;
		end
	end
end
tinsert(copyfuncs, "FindTab");

function SideTabLib:SelectTab(target)
	for _,tab in pairs(self.TabFrames) do
		if ( target == tab or target == tab.name ) then
			if ( not tab:GetChecked() ) then
				OptionTab_OnClick(tab);
			end
		else
			tab:SetChecked(false);
		end
	end
end
tinsert(copyfuncs, "SelectTab");

function SideTabLib:MakePrimary(target)
	local tab = self:FindTab(target);
	if (tab) then
		tab.first = true;
		self.FirstAmongTabs = tab;
	end
end
tinsert(copyfuncs, "MakePrimary");

function SideTabLib:MakeUltimate(target)
	local tab = self:FindTab(target);
	if (tab) then
		tab.ultimate = true;
		self.UltimateTab = tab;
	end
end
tinsert(copyfuncs, "MakeUltimate");

function SideTabLib:CreateTab(tabtext, icon, onclick, tooltip)
	local _, n = self:GetFrameInfo(self);

	-- optimize if passed a string
	self.TabFrames = self.TabFrames or {};
	self.next_frameid = self.next_frameid or 1;
	local id = self.next_frameid;
	local framename = string.format(n.."Tab%d", id);

	local tabframe = CreateFrame("CheckButton", framename, self, "SpellBookSkillLineTabTemplate");

	self.TabFrames[id] = tabframe;

	tabframe.name = tabtext;
	tabframe.parent = self;
	tabframe.tooltip = tabtext;

	if ( tooltip ) then
		tabframe.tooltip = tooltip;
	end

	tabframe.onclick = onclick;
	tabframe:SetScript("OnClick", OptionTab_OnClick);

	tabframe:SetID(id);
	tabframe:SetNormalTexture(icon);

	self.next_frameid = self.next_frameid + 1;

	return tabframe;
end
tinsert(copyfuncs, "CreateTab");

-- Based on code from the LibStub wiki page
SideTabLib.previousClients = SideTabLib.previousClients or {};
function SideTabLib:Embed(target)
	for _,name in pairs(copyfuncs) do
		target[name] = SideTabLib[name];
	end
	SideTabLib.previousClients[target] = true;
end

for target,_ in pairs(SideTabLib.previousClients) do
	SideTabLib:Embed(target)
end
