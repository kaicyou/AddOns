--[[----------------------------------------------------------
--	CodeNameBlaze, an ElvUI edit by Blazeflack @ tukui.org
--
--	This file contains changes/additions to the ElvUI Bags
----------------------------------------------------------]]--
local E, L, V, P, G, _ = unpack(ElvUI); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local B = E:GetModule('Bags')
local CNB = E:GetModule('CodeNameBlaze')
local LSM = LibStub("LibSharedMedia-3.0")

--Cache global variables
--Lua functions
local _G = _G
local ipairs, unpack = ipairs, unpack
--WoW API / Variables
local CreateFrame = CreateFrame
local GetNumBankSlots = GetNumBankSlots
local GetContainerNumSlots = GetContainerNumSlots
local IsShiftKeyDown = IsShiftKeyDown

function CNB:SkinBag(bag)
	if not E.db.CNB.bags.transparentBackdrop then return; end
	--Set bags to use transparent template
	bag:SetTemplate("Transparent")
end
hooksecurefunc(B, "SkinBag", CNB.SkinBag)

function CNB:ModifyLayout(isBank)	
	local f = self:GetContainerFrame(isBank);
	if not f or not E.db.CNB.bags.transparentButtons then return; end

	--Set bags buttons to use transparent template
	local numContainerSlots, fullContainerSlots = GetNumBankSlots();
	for i, bagID in ipairs(f.BagIDs) do
		local numSlots = GetContainerNumSlots(bagID);
		if numSlots > 0 then
			for slotID = 1, numSlots do
				f.Bags[bagID][slotID]:SetTemplate('Transparent');
			end
		end
	end
end
hooksecurefunc(B, "Layout", CNB.ModifyLayout)

function CNB:ModifyContainerFrame(name, isBank)
	local f = _G[name]

	if isBank then
		--Add stack button back to bank
		f.stackButton = CreateFrame("Button", name..'stackButton', f);
		f.stackButton:SetSize(16 + E.Border, 16 + E.Border)
		f.stackButton:SetTemplate()
		f.stackButton:SetPoint("RIGHT", f.bagText, "LEFT", -5, E.Border * 2)
		f.stackButton:SetNormalTexture("Interface\\ICONS\\misc_arrowlup")
		f.stackButton:GetNormalTexture():SetTexCoord(unpack(E.TexCoords))
		f.stackButton:GetNormalTexture():SetInside()
		f.stackButton:SetPushedTexture("Interface\\ICONS\\misc_arrowlup")
		f.stackButton:GetPushedTexture():SetTexCoord(unpack(E.TexCoords))
		f.stackButton:GetPushedTexture():SetInside()		
		f.stackButton:StyleButton(nil, true)
		f.stackButton.ttText = L['Stack items in bank']
		f.stackButton.ttText2 = L['Hold Shift:']
		f.stackButton.ttText2desc = L['Stack items to bags']
		f.stackButton:SetScript("OnEnter", self.Tooltip_Show)
		f.stackButton:SetScript("OnLeave", self.Tooltip_Hide)
		f.stackButton:SetScript('OnClick', function() 
			if IsShiftKeyDown() then
				B:CommandDecorator(B.Stack, 'bank bags')();
			else
				B:CommandDecorator(B.Compress, 'bank')();
			end
		end)

		--Reposition the other buttons
		f.reagentToggle:SetPoint("RIGHT", f.stackButton, "LEFT", -5, 0)
	else
		--Add stack button back to bags
		f.stackButton = CreateFrame("Button", name..'stackButton', f);
		f.stackButton:SetSize(16 + E.Border, 16 + E.Border)
		f.stackButton:SetTemplate()
		f.stackButton:SetPoint("RIGHT", f.goldText, "LEFT", -5, E.Border * 2)
		f.stackButton:SetNormalTexture("Interface\\ICONS\\misc_arrowlup")
		f.stackButton:GetNormalTexture():SetTexCoord(unpack(E.TexCoords))
		f.stackButton:GetNormalTexture():SetInside()
		f.stackButton:SetPushedTexture("Interface\\ICONS\\misc_arrowlup")
		f.stackButton:GetPushedTexture():SetTexCoord(unpack(E.TexCoords))
		f.stackButton:GetPushedTexture():SetInside()		
		f.stackButton:StyleButton(nil, true)
		f.stackButton.ttText = L['Stack items in bags']
		f.stackButton.ttText2 = L['Hold Shift:']
		f.stackButton.ttText2desc = L['Stack items to bank']
		f.stackButton:SetScript("OnEnter", self.Tooltip_Show)
		f.stackButton:SetScript("OnLeave", self.Tooltip_Hide)
		f.stackButton:SetScript('OnClick', function() 
			if IsShiftKeyDown() then
				B:CommandDecorator(B.Stack, 'bags bank')();
			else
				B:CommandDecorator(B.Compress, 'bags')();
			end
		end)

		--Reposition the other buttons
		f.sortButton:SetPoint("RIGHT", f.stackButton, "LEFT", -5, 0)
	end
end
hooksecurefunc(B, "ContructContainerFrame", CNB.ModifyContainerFrame)

--Bags options
local function BagsOptions()
	E.Options.args.CNB.args.config.args.bags = {
		order = 1,
		type = 'group',
		name = L["Bags"],
		args = {
			header = {
				order = 1,
				type = "header",
				name = CNB:ColorStr(L["Bags"]),
			},
			general = {
				order = 2,
				type = 'group',
				name = L["General"],
				guiInline = true,
				args = {
					transparentBackdrop = {
						order = 1,
						type = "toggle",
						name = L["Transparent Backdrop"],
						desc = L["Set Bag/Bank backdrop to use the transparent template."],
						get = function(info) return E.db.CNB.bags.transparentBackdrop end,
						set = function(info, value) E.db.CNB.bags.transparentBackdrop = value; E:StaticPopup_Show('CONFIG_RL'); end,
					},
					transparentButtons = {
						order = 2,
						type = "toggle",
						name = L["Transparent Buttons"],
						desc = L["Set Bag/Bank buttons to use the transparent template."],
						get = function(info) return E.db.CNB.bags.transparentButtons end,
						set = function(info, value) E.db.CNB.bags.transparentButtons = value; E:StaticPopup_Show('CONFIG_RL'); end,
					},
				},
			},
		},
	}
end
CNB.configs['bags'] = BagsOptions