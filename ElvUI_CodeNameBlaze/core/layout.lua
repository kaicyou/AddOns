--[[------------------------------------------------------------------------
--	CodeNameBlaze, an ElvUI edit by Blazeflack @ tukui.org
--
--	This file contains changes/additions to the various ElvUI panels
------------------------------------------------------------------------]]--
local E, L, V, P, G, _ = unpack(ElvUI); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local LO = E:GetModule('Layout')
local CNB = E:GetModule('CodeNameBlaze')
local LSM = LibStub("LibSharedMedia-3.0")

--Cache global variables
--Lua functions
local unpack = unpack
--WoW API / Variables
local CreateFrame = CreateFrame

--Global variables that we don't cache, list them here for mikk's FindGlobals script
-- GLOBALS: LeftChatDataPanel, LeftChatToggleButton, RightChatDataPanel, RightChatToggleButton
-- GLOBALS: Bottom_Datatext_Panel, LeftChatPanel, RightChatPanel, LeftMiniPanel, Minimap
-- GLOBALS: RightChatTab, ElvUI_Bar1, ChatTab_Datatext_Panel, LeftChatTabSeparator
-- GLOBALS: RightChatTabSeparator, LeftDataPanelSeparator, RightDataPanelSeparator

local PANEL_HEIGHT = 22;

function CNB:InitializeLayout()
	--Create extra panels
	CNB:CreateExtraDataBarPanels()
end
hooksecurefunc(LO, "Initialize", CNB.InitializeLayout)

function CNB:HideChatDataPanelBG()
	--Make backdrop completely invisible, leaving only the datatexts.
	LeftChatDataPanel:SetTemplate("Transparent")
	LeftChatDataPanel:SetBackdropColor(0,0,0,0)
	LeftChatDataPanel:SetBackdropBorderColor(0,0,0,0)
	LeftChatToggleButton:SetTemplate("Transparent")
	LeftChatToggleButton:SetBackdropColor(0,0,0,0)
	LeftChatToggleButton:SetBackdropBorderColor(0,0,0,0)
	RightChatDataPanel:SetTemplate("Transparent")
	RightChatDataPanel:SetBackdropColor(0,0,0,0)
	RightChatDataPanel:SetBackdropBorderColor(0,0,0,0)
	RightChatToggleButton:SetTemplate("Transparent")
	RightChatToggleButton:SetBackdropColor(0,0,0,0)
	RightChatToggleButton:SetBackdropBorderColor(0,0,0,0)
end

function CNB:SetDataPanelStyle()
	if E.db.CNB.datatexts.bottomDatatextPanel then
		if E.db.datatexts.panelTransparency then
			--Set the correct template for the bottom data panel
			Bottom_Datatext_Panel:SetTemplate("Transparent")
		else
			--Set the correct template for the bottom data panel
			Bottom_Datatext_Panel:SetTemplate("Default", true)
		end
	end
	
	if E.db.CNB.datatexts.invisibleChatDataPanel then
		CNB:HideChatDataPanelBG()
	end
end
hooksecurefunc(LO, "SetDataPanelStyle", CNB.SetDataPanelStyle)

function CNB:UpdateDTBackdropColors()
	--Make sure background stays invisible on profile change
	if E.db.CNB.datatexts.invisibleChatDataPanel then
		CNB:HideChatDataPanelBG()
	end
end
hooksecurefunc(E, "UpdateBackdropColors", CNB.UpdateDTBackdropColors)

function CNB:CreateAndModifyChatPanels()
	--Left Chat Tab Separator
	local ltabseparator = CreateFrame('Frame', 'LeftChatTabSeparator', LeftChatPanel)
	ltabseparator:SetFrameStrata('BACKGROUND')
	ltabseparator:SetFrameLevel(LeftChatPanel:GetFrameLevel() + 2)
	ltabseparator:Size(E.db.chat.panelWidth - 10, 1)
	ltabseparator:Point('TOP', LeftChatPanel, 0, -24)
	ltabseparator:SetTemplate('Transparent')
	
	--Right Chat Tab Separator
	local rtabseparator = CreateFrame('Frame', 'RightChatTabSeparator', RightChatPanel)
	rtabseparator:SetFrameStrata('BACKGROUND')
	rtabseparator:SetFrameLevel(RightChatPanel:GetFrameLevel() + 2)
	rtabseparator:Size(E.db.chat.panelWidth - 10, 1)
	rtabseparator:Point('TOP', RightChatPanel, 0, -24)
	rtabseparator:SetTemplate('Transparent')
	
	--Left Chat Data Panel Separator
	local ldataseparator = CreateFrame('Frame', 'LeftDataPanelSeparator', LeftChatPanel)
	ldataseparator:SetFrameStrata('BACKGROUND')
	ldataseparator:SetFrameLevel(LeftChatPanel:GetFrameLevel() + 2)
	ldataseparator:Size(E.db.chat.panelWidth - 10, 1)
	ldataseparator:Point('BOTTOM', LeftChatPanel, 0, 24)
	ldataseparator:SetTemplate('Transparent')
	
	--Right Chat Data Panel Separator
	local rdataseparator = CreateFrame('Frame', 'RightDataPanelSeparator', RightChatPanel)
	rdataseparator:SetFrameStrata('BACKGROUND')
	rdataseparator:SetFrameLevel(RightChatPanel:GetFrameLevel() + 2)
	rdataseparator:Size(E.db.chat.panelWidth - 10, 1)
	rdataseparator:Point('BOTTOM', RightChatPanel, 0, 24)
	rdataseparator:SetTemplate('Transparent')
	
	--Modify Left Chat Toggle Button font, text and color
	LeftChatToggleButton.text:FontTemplate(LSM:Fetch("font", E.db.datatexts.font), E.db.datatexts.fontSize, E.db.datatexts.fontOutline)
	LeftChatToggleButton.text:SetText('L')
	LeftChatToggleButton.text:SetTextColor(unpack(E["media"].rgbvaluecolor))
	
	--Modify Right Chat Toggle Button font, text and color
	RightChatToggleButton.text:FontTemplate(LSM:Fetch("font", E.db.datatexts.font), E.db.datatexts.fontSize, E.db.datatexts.fontOutline)
	RightChatToggleButton.text:SetText('R')
	RightChatToggleButton.text:SetTextColor(unpack(E["media"].rgbvaluecolor))
end
hooksecurefunc(LO, "CreateChatPanels", CNB.CreateAndModifyChatPanels)

function CNB:ModifyMinimapPanels()
	--Make room for system datatext by shrinking time datatext
	LeftMiniPanel:SetPoint('BOTTOMRIGHT', Minimap, 'BOTTOMLEFT', E.Spacing + E.db.CNB.datatexts.leftMinimapPanelSize, -((E.PixelMode and 0 or 3) + PANEL_HEIGHT))
end
hooksecurefunc(LO, "CreateMinimapPanels", CNB.ModifyMinimapPanels)

--Create extra panels
function CNB:CreateExtraDataBarPanels()
	local chattab = CreateFrame('Frame', 'ChatTab_Datatext_Panel', RightChatPanel)
	chattab:SetScript('OnShow', function(self)
		chattab:SetPoint("TOPRIGHT", RightChatTab, "TOPRIGHT", 0, 0)
		chattab:SetPoint("BOTTOMLEFT", RightChatTab, "BOTTOMLEFT", 0, 0)
	end)
	chattab:Hide()
	E:GetModule('DataTexts'):RegisterPanel(chattab, 3, 'ANCHOR_TOPLEFT', -3, 4)
	
	local bottom_bar = CreateFrame('Frame', 'Bottom_Datatext_Panel', E.UIParent)
	bottom_bar:SetTemplate(E.db.datatexts.panelTransparency and 'Transparent' or 'Default', true)
	bottom_bar:SetFrameStrata('BACKGROUND')
	bottom_bar:SetScript('OnShow', function(self)
		bottom_bar:SetSize(ElvUI_Bar1 and ElvUI_Bar1:GetWidth() or 400, PANEL_HEIGHT);
		if not bottom_bar.mover then
			if ElvUI_Bar1 then
				bottom_bar:SetPoint("TOP", ElvUI_Bar1, "BOTTOM", 0, -E.mult);
			else
				bottom_bar:SetPoint("BOTTOM", E.UIParent, "BOTTOM", 0, 0);
			end
			E:CreateMover(bottom_bar, "BottomBarMover", "Bottom Datatext Frame")
		end
	end)
	E.FrameLocks['Bottom_Datatext_Panel'] = true
	E:GetModule('DataTexts'):RegisterPanel(bottom_bar, 3, 'ANCHOR_LEFT', -1, -22)
	bottom_bar:Hide()
end

function CNB:ToggleDataPanels()
	if E.db.CNB.datatexts.bottomDatatextPanel then
		Bottom_Datatext_Panel:Show()
	else
		Bottom_Datatext_Panel:Hide()
	end
	if E.db.CNB.datatexts.rightChatTabDatatextPanel then
		ChatTab_Datatext_Panel:Show()
	else
		ChatTab_Datatext_Panel:Hide()
	end
end

function CNB:ToggleChatSeparators()
	if E.db.CNB.chat.chatTabSeparator == 'SHOWBOTH' then
		LeftChatTabSeparator:Show()
		RightChatTabSeparator:Show()
	elseif E.db.CNB.chat.chatTabSeparator == 'HIDEBOTH' then
		LeftChatTabSeparator:Hide()
		RightChatTabSeparator:Hide()
	elseif E.db.CNB.chat.chatTabSeparator == 'LEFTONLY' then
		LeftChatTabSeparator:Show()
		RightChatTabSeparator:Hide()
	elseif E.db.CNB.chat.chatTabSeparator == 'RIGHTONLY' then
		LeftChatTabSeparator:Hide()
		RightChatTabSeparator:Show()
	end
	
	if E.db.CNB.chat.chatDataSeparator == 'SHOWBOTH' then
		LeftDataPanelSeparator:Show()
		RightDataPanelSeparator:Show()
	elseif E.db.CNB.chat.chatDataSeparator == 'HIDEBOTH' then
		LeftDataPanelSeparator:Hide()
		RightDataPanelSeparator:Hide()
	elseif E.db.CNB.chat.chatDataSeparator == 'LEFTONLY' then
		LeftDataPanelSeparator:Show()
		RightDataPanelSeparator:Hide()
	elseif E.db.CNB.chat.chatDataSeparator == 'RIGHTONLY' then
		LeftDataPanelSeparator:Hide()
		RightDataPanelSeparator:Show()
	end
end

local f = CreateFrame('Frame')
f:RegisterEvent('PLAYER_ENTERING_WORLD')
f:SetScript('OnEvent', function(self)
	self:UnregisterEvent('PLAYER_ENTERING_WORLD')
	
	CNB:ToggleDataPanels()
	CNB:ToggleChatSeparators()

	--Make sure panels are completely transparent on initial load
	if E.db.CNB.datatexts.invisibleChatDataPanel then
		CNB:HideChatDataPanelBG()
	end
end)