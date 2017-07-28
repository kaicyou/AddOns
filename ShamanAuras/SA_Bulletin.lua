local FOLDER_NAME, SSA = ...
local SSA = SSA

local L = LibStub('AceLocale-3.0'):GetLocale('ShamanAuras', true)
local Auras = LibStub('AceAddon-3.0'):GetAddon('ShamanAuras')
Auras.version = GetAddOnMetadata(FOLDER_NAME, 'Version')
local LSM = LibStub('LibSharedMedia-3.0')

local font = font or LSM.DefaultMedia.font

local FrameBackdrop = {
	bgFile = [[Interface\DialogFrame\UI-DialogBox-Background]],
	edgeFile = [[Interface\DialogFrame\UI-DialogBox-Border]],
	tile = true, tileSize = 32, edgeSize = 32,
	insets = { left = 8, right = 8, top = 8, bottom = 8 }
}

local PaneBackdrop  = {
	bgFile = [[Interface\ChatFrame\ChatFrameBackground]],
	edgeFile = [[Interface\Tooltips\UI-Tooltip-Border]],
	tile = true, tileSize = 16, edgeSize = 16,
	insets = { left = 3, right = 3, top = 5, bottom = 3 }
}

local frame = CreateFrame("Frame", nil, UIParent)
frame:Hide()

frame:EnableMouse(true)
frame:SetMovable(true)
frame:SetResizable(true)
frame:SetFrameStrata("DIALOG")
frame:SetBackdrop(FrameBackdrop)
frame:SetBackdropColor(0, 0, 0, 1)
--frame:SetMinResize(400, 200)
frame:SetToplevel(true)
frame:SetScript("OnShow", Frame_OnShow)
frame:SetScript("OnHide", Frame_OnClose)
frame:SetScript("OnMouseDown", Frame_OnMouseDown)
frame:SetSize(500,603)
frame:SetPoint("CENTER",0,0)

local function BuildButtons()
	local closebutton = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
	closebutton:SetScript("OnClick", function(self) self:GetParent():Hide() end)
	closebutton:SetPoint("BOTTOMRIGHT", -27, 17)
	closebutton:SetHeight(20)
	closebutton:SetWidth(100)
	closebutton:SetText(CLOSE)

	local button_new = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
	button_new:SetPoint("BOTTOMLEFT", 27, 17)
	button_new:SetHeight(20)
	button_new:SetWidth(100)
	button_new:SetText("NEW")
	button_new:Disable()
	button_new:SetScript("OnClick", function(self) 
		self:GetParent().body_new:Show()
		self:GetParent().body_fix:Hide()
	end)

	local button_fix = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
	button_fix:SetPoint("BOTTOMLEFT", 130, 17)
	button_fix:SetHeight(20)
	button_fix:SetWidth(100)
	button_fix:SetText("FIXES")
	button_fix:Disable()
	button_fix:SetScript("OnClick", function(self)
		self:GetParent().body_fix:Show()
		self:GetParent().body_new:Hide()
	end)
end

local function BuildTitleBar()
	local titlebg = frame:CreateTexture(nil, "OVERLAY")
	titlebg:SetTexture([[Interface\DialogFrame\UI-DialogBox-Header]])
	titlebg:SetTexCoord(0.31, 0.67, 0, 0.63)
	titlebg:SetPoint("TOP", 0, 12)
	titlebg:SetWidth(100)
	titlebg:SetHeight(40)

	local title = CreateFrame("Frame", nil, frame)
	title:EnableMouse(true)
	title:SetScript("OnMouseDown", Title_OnMouseDown)
	title:SetScript("OnMouseUp", MoverSizer_OnMouseUp)
	title:SetAllPoints(titlebg)

	local titletext = title:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	titletext:SetPoint("TOP", titlebg, "TOP", 0, -14)
	titletext:SetText("Bulletin Board")

	local titlebg_l = frame:CreateTexture(nil, "OVERLAY")
	titlebg_l:SetTexture([[Interface\DialogFrame\UI-DialogBox-Header]])
	titlebg_l:SetTexCoord(0.21, 0.31, 0, 0.63)
	titlebg_l:SetPoint("RIGHT", titlebg, "LEFT")
	titlebg_l:SetWidth(30)
	titlebg_l:SetHeight(40)

	local titlebg_r = frame:CreateTexture(nil, "OVERLAY")
	titlebg_r:SetTexture([[Interface\DialogFrame\UI-DialogBox-Header]])
	titlebg_r:SetTexCoord(0.67, 0.77, 0, 0.63)
	titlebg_r:SetPoint("LEFT", titlebg, "RIGHT")
	titlebg_r:SetWidth(30)
	titlebg_r:SetHeight(40)
end

local function BuildHeader()
	local header = CreateFrame("Frame", nil, frame)
	header:SetFrameStrata("DIALOG")
	header:SetWidth(460)
	header:SetHeight(220)
	header:SetPoint("TOP",0,-25)
	header:SetBackdrop(PaneBackdrop)
	header:SetBackdropColor(0, 0, 0, 0.6)
	header:SetBackdropBorderColor(0.4, 0.4, 0.4)
	frame.header = header

	local titletext = header:CreateFontString(nil, "FULLSCREEN_DIALOG", "GameFontNormal")
	titletext:SetPoint("TOP", 0, -20)
	--titletext:SetPoint("TOPRIGHT", -14, 0)
	titletext:SetJustifyH("LEFT")
	titletext:SetHeight(18)
	titletext:SetFont(font,30)
	titletext:SetText("Sweetsour's Shaman Auras: "..Auras.version)
	titletext:SetTextColor(1,1,1,1)
	frame.header.titletext = titletext

	local bodytext = header:CreateFontString(nil, "FULLSCREEN_DIALOG", "GameFontNormal")
	bodytext:SetPoint("TOPLEFT", 15, -50)
	--bodytext:SetPoint("TOPRIGHT", -14, 0)
	bodytext:SetJustifyH("LEFT")
	bodytext:SetWidth(440)
	bodytext:SetWordWrap(true)
	bodytext:SetFont(font,14)
	bodytext:SetText("What seems to final font incompatibility bugs have been fixed!\n\nBelow are ways you can help support the development of this addon.\n\nDiscord: sweetsour.live/|cFF82BBFFdiscord|r\nPatreon: sweetsour.live/|cFF82BBFFpatreon|r\nDonate: sweetsour.live/|cFF82BBFFdonate|r")
	bodytext:SetTextColor(1,1,1,1)
	frame.header.bodytext = bodytext
end


local body_new = CreateFrame("Frame", nil, frame)
body_new:SetFrameStrata("DIALOG")
body_new:SetWidth(460)
body_new:SetHeight(535)
body_new:SetPoint("TOP",0,-25)
body_new:SetBackdrop(PaneBackdrop)
body_new:SetBackdropColor(0, 0, 0, 0.5)
body_new:SetBackdropBorderColor(0.4, 0.4, 0.4)
body_new:Hide()
frame.body_new = body_new

local title_new = body_new:CreateFontString(nil, "FULLSCREEN_DIALOG", "GameFontNormal")
title_new:SetPoint("TOPLEFT", 15, -230)
--title_new:SetPoint("TOPRIGHT", -14, 0)
title_new:SetJustifyH("LEFT")
title_new:SetHeight(18)
title_new:SetFont(font,16)
title_new:SetText("NEW")
title_new:SetTextColor(1,1,1,1)
frame.body_new.title_new = title_new


local body_fix = CreateFrame("Frame", nil, frame)
body_fix:SetFrameStrata("DIALOG")
body_fix:SetWidth(460)
body_fix:SetHeight(535)
body_fix:SetPoint("TOP",0,-25)
body_fix:SetBackdrop(PaneBackdrop)
body_fix:SetBackdropColor(0, 0, 0, 0.5)
body_fix:SetBackdropBorderColor(0.4, 0.4, 0.4)
body_fix:Show()
frame.body_fix = body_fix

local title_fix = body_fix:CreateFontString(nil, "FULLSCREEN_DIALOG", "GameFontNormal")
title_fix:SetPoint("TOPLEFT", 15, -230)
--title_fix:SetPoint("TOPRIGHT", -14, 0)
title_fix:SetJustifyH("LEFT")
title_fix:SetHeight(18)
title_fix:SetFont(font,16)
title_fix:SetText("FIXES")
title_fix:SetTextColor(1,1,1,1)
frame.body_fix.title_fix = title_fix

local function BuildNewEleList()
	local new_ele = body_new:CreateFontString(nil, "FULLSCREEN_DIALOG", "GameFontNormal")
	new_ele:SetPoint("TOPLEFT", 27, -250)
	--new_ele:SetPoint("TOPRIGHT", -14, 0)
	new_ele:SetJustifyH("LEFT")
	new_ele:SetHeight(18)
	new_ele:SetFont(font,15)
	new_ele:SetText("Elemental")
	new_ele:SetTextColor(1,1,1,1)
	frame.body_new.new_ele = new_ele

		local list_new_1 = body_new:CreateFontString(nil, "FULLSCREEN_DIALOG", "GameFontNormal")
		list_new_1:SetPoint("TOPLEFT", 39, -270)
		--list_new_1:SetPoint("TOPRIGHT", -14, 0)
		list_new_1:SetJustifyH("LEFT")
		--list_new_1:SetHeight(18)
		list_new_1:SetWidth(420)
		list_new_1:SetWordWrap(true)
		list_new_1:SetFont(font,12)
		list_new_1:SetText("• [|cFFBDFFA5+Enh|r/|cFFF086FFRes|r] All progress bars are shown as full when modifying them, but added the ability to modify the bar's background with a toggle; reducing the bar's value to reveal the background texture. |cFF82BBFFThanks, Jay040792!|r")
		list_new_1:SetTextColor(1,1,1,1)
		frame.body_new.new_ele.list_new_1 = list_new_1

		local list_new_2 = body_new:CreateFontString(nil, "FULLSCREEN_DIALOG", "GameFontNormal")
		list_new_2:SetPoint("TOPLEFT", 39, -308)
		--list_new_2:SetPoint("TOPRIGHT", -14, 0)
		list_new_2:SetJustifyH("LEFT")
		--list_new_2:SetHeight(18)
		list_new_2:SetWidth(420)
		list_new_2:SetWordWrap(true)
		list_new_2:SetFont(font,12)
		list_new_2:SetText("• [+|cFFF086FFRes|r] When modifying the |cFFFFe961Icefury Bar|r and |cFFFFe961Earthen Shield Bar|r, the |cFFFFe961Timer Bar|r can be toggled on or off.")
		list_new_2:SetTextColor(1,1,1,1)
		frame.body_new.new_ele.list_new_2 = list_new_2
end

local function BuildNewRestoList()
	local new_res = body_new:CreateFontString(nil, "FULLSCREEN_DIALOG", "GameFontNormal")
	new_res:SetPoint("TOPLEFT", 27, -330)
	--new_res:SetPoint("TOPRIGHT", -14, 0)
	new_res:SetJustifyH("LEFT")
	new_res:SetHeight(18)
	new_res:SetFont(font,15)
	new_res:SetText("Restoration")
	new_res:SetTextColor(1,1,1,1)
	frame.body_new.new_res = new_res

		list_new_1 = body_new:CreateFontString(nil, "FULLSCREEN_DIALOG", "GameFontNormal")
		list_new_1:SetPoint("TOPLEFT", 39, -350)
		--list_new_1:SetPoint("TOPRIGHT", -14, 0)
		list_new_1:SetJustifyH("LEFT")
		--list_new_1:SetHeight(18)
		list_new_1:SetWidth(420)
		list_new_1:SetWordWrap(true)
		list_new_1:SetFont(font,12)
		list_new_1:SetText("• A glow effect has been added to |cFFFFe961Riptide|r for the T20 2-piece bonus. |cFF82BBFFThanks, Araren!|r")
		list_new_1:SetTextColor(1,1,1,1)
		frame.body_new.new_res.list_new_1 = list_new_1

		list_new_2 = body_new:CreateFontString(nil, "FULLSCREEN_DIALOG", "GameFontNormal")
		list_new_2:SetPoint("TOPLEFT", 39, -365)
		--list_new_2:SetPoint("TOPRIGHT", -14, 0)
		list_new_2:SetJustifyH("LEFT")
		--list_new_2:SetHeight(18)
		list_new_2:SetWidth(420)
		list_new_2:SetWordWrap(true)
		list_new_2:SetFont(font,12)
		list_new_2:SetText("• A glow effect has been added to |cFFFFe961Healing Rain|r for the T20 4-piece bonus. |cFF82BBFFThanks, Araren!|r")
		list_new_2:SetTextColor(1,1,1,1)
		frame.body_new.new_res.list_new_2 = list_new_2
end

local function BuildNewUIList()	
	local new_ui = body_new:CreateFontString(nil, "FULLSCREEN_DIALOG", "GameFontNormal")
	new_ui:SetPoint("TOPLEFT", 27, -250)
	--new_ui:SetPoint("TOPRIGHT", -14, 0)
	new_ui:SetJustifyH("LEFT")
	new_ui:SetHeight(18)
	new_ui:SetFont(font,15)
	new_ui:SetText("UI Interface")
	new_ui:SetTextColor(1,1,1,1)
	frame.body_new.new_ui = new_ui

		list_new_1 = body_new:CreateFontString(nil, "FULLSCREEN_DIALOG", "GameFontNormal")
		list_new_1:SetPoint("TOPLEFT", 39, -270)
		--list_new_1:SetPoint("TOPRIGHT", -14, 0)
		list_new_1:SetJustifyH("LEFT")
		--list_new_1:SetHeight(18)
		list_new_1:SetWidth(420)
		list_new_1:SetWordWrap(true)
		list_new_1:SetFont(font,12)
		list_new_1:SetText("• Added the ability to disable |cFFFFe961Blizzard's default casting bar|r. |cFF82BBFFThanks, Ives!|r")
		list_new_1:SetTextColor(1,1,1,1)
		frame.body_new.new_ui.list_new_1 = list_new_1
end

local function BuildFixEleList()
	local fix_ele = body_fix:CreateFontString(nil, "FULLSCREEN_DIALOG", "GameFontNormal")
	fix_ele:SetPoint("TOPLEFT", 27, -250)
	--fix_ele:SetPoint("TOPRIGHT", -14, 0)
	fix_ele:SetJustifyH("LEFT")
	fix_ele:SetHeight(18)
	fix_ele:SetFont(font,15)
	fix_ele:SetText("Elemental")
	fix_ele:SetTextColor(1,1,1,1)
	frame.body_new.fix_ele = fix_ele

		local list_fix_1 = body_fix:CreateFontString(nil, "FULLSCREEN_DIALOG", "GameFontNormal")
		list_fix_1:SetPoint("TOPLEFT", 39, -270)
		--list_fix_1:SetPoint("TOPRIGHT", -14, 0)
		list_fix_1:SetJustifyH("LEFT")
		--list_fix_1:SetHeight(18)
		list_fix_1:SetWidth(420)
		list_fix_1:SetWordWrap(true)
		list_fix_1:SetFont(font,12)
		list_fix_1:SetText("• The timer bars for the |cFFFFe961elementals|r has been re-coded to work better and correctly.")
		list_fix_1:SetTextColor(1,1,1,1)
		frame.body_new.fix_ele.list_fix_1 = list_fix_1
end

local function BuildFixEnhList()
	local fix_enh = body_fix:CreateFontString(nil, "FULLSCREEN_DIALOG", "GameFontNormal")
	fix_enh:SetPoint("TOPLEFT", 27, -360)
	--fix_enh:SetPoint("TOPRIGHT", -14, 0)
	fix_enh:SetJustifyH("LEFT")
	fix_enh:SetHeight(18)
	fix_enh:SetFont(font,15)
	fix_enh:SetText("Enhancement")
	fix_enh:SetTextColor(1,1,1,1)
	frame.body_new.fix_enh = fix_enh

		local list_fix_1 = body_fix:CreateFontString(nil, "FULLSCREEN_DIALOG", "GameFontNormal")
		list_fix_1:SetPoint("TOPLEFT", 39, -380)
		--list_fix_1:SetPoint("TOPRIGHT", -14, 0)
		list_fix_1:SetJustifyH("LEFT")
		--list_fix_1:SetHeight(18)
		list_fix_1:SetWidth(420)
		list_fix_1:SetWordWrap(true)
		list_fix_1:SetFont(font,12)
		list_fix_1:SetText("• Moved the |cFFFFe961Doom Winds|r aura to the artifact aura group to fix overlapping auras in the bottom aura row.")
		list_fix_1:SetTextColor(1,1,1,1)
		frame.body_new.fix_enh.list_fix_1 = list_fix_1
end

local function BuildFixResList()
	local fix_res = body_fix:CreateFontString(nil, "FULLSCREEN_DIALOG", "GameFontNormal")
	fix_res:SetPoint("TOPLEFT", 27, -295)
	--fix_res:SetPoint("TOPRIGHT", -14, 0)
	fix_res:SetJustifyH("LEFT")
	fix_res:SetHeight(18)
	fix_res:SetFont(font,15)
	fix_res:SetText("Restoration")
	fix_res:SetTextColor(1,1,1,1)
	frame.body_new.fix_res = fix_res

		local list_fix_1 = body_fix:CreateFontString(nil, "FULLSCREEN_DIALOG", "GameFontNormal")
		list_fix_1:SetPoint("TOPLEFT", 39, -315)
		--list_fix_1:SetPoint("TOPRIGHT", -14, 0)
		list_fix_1:SetJustifyH("LEFT")
		--list_fix_1:SetHeight(18)
		list_fix_1:SetWidth(420)
		list_fix_1:SetWordWrap(true)
		list_fix_1:SetFont(font,12)
		list_fix_1:SetText("• Corrected incorrect spell names for the |cFFFFe961Buff Duration|r Timers display options.")
		list_fix_1:SetTextColor(1,1,1,1)
		frame.body_new.fix_res.list_fix_1 = list_fix_1
end

local function BuildFixUIList()	
	local fix_ui = body_fix:CreateFontString(nil, "FULLSCREEN_DIALOG", "GameFontNormal")
	fix_ui:SetPoint("TOPLEFT", 27, -250)
	--fix_ui:SetPoint("TOPRIGHT", -14, 0)
	fix_ui:SetJustifyH("LEFT")
	fix_ui:SetHeight(18)
	fix_ui:SetFont(font,15)
	fix_ui:SetText("UI")
	fix_ui:SetTextColor(1,1,1,1)
	frame.body_fix.fix_ui = fix_ui

		list_fix_1 = body_fix:CreateFontString(nil, "FULLSCREEN_DIALOG", "GameFontNormal")
		list_fix_1:SetPoint("TOPLEFT", 39, -270)
		--list_fix_1:SetPoint("TOPRIGHT", -14, 0)
		list_fix_1:SetJustifyH("LEFT")
		--list_fix_1:SetHeight(18)
		list_fix_1:SetWidth(420)
		list_fix_1:SetWordWrap(true)
		list_fix_1:SetFont(font,12)
		list_fix_1:SetText("• Fixes more issues caused by fonts not compatible with non-English langes. |cFF82BBFFThanks, AKFDI!|r")
		list_fix_1:SetTextColor(1,1,1,1)
		frame.body_fix.fix_ui.list_fix_1 = list_fix_1
		
		list_fix_2 = body_fix:CreateFontString(nil, "FULLSCREEN_DIALOG", "GameFontNormal")
		list_fix_2:SetPoint("TOPLEFT", 39, -300)
		--list_fix_2:SetPoint("TOPRIGHT", -14, 0)
		list_fix_2:SetJustifyH("LEFT")
		--list_fix_2:SetHeight(18)
		list_fix_2:SetWidth(420)
		list_fix_2:SetWordWrap(true)
		list_fix_2:SetFont(font,12)
		list_fix_2:SetText("• An issue preventing all progress bars from being modified when playing WoW in a non-English language has been fixed.")
		list_fix_2:SetTextColor(1,1,1,1)
		frame.body_fix.fix_ui.list_fix_2 = list_fix_2
		
		list_fix_3 = body_fix:CreateFontString(nil, "FULLSCREEN_DIALOG", "GameFontNormal")
		list_fix_3:SetPoint("TOPLEFT", 39, -330)
		--list_fix_3:SetPoint("TOPRIGHT", -14, 0)
		list_fix_3:SetJustifyH("LEFT")
		--list_fix_3:SetHeight(18)
		list_fix_3:SetWidth(420)
		list_fix_3:SetWordWrap(true)
		list_fix_3:SetFont(font,12)
		list_fix_3:SetText("• Added more asian-compatible fonts.")
		list_fix_3:SetTextColor(1,1,1,1)
		frame.body_fix.fix_ui.list_fix_3 = list_fix_3
end

BuildButtons()
BuildTitleBar()
BuildHeader()

--BuildNewEleList()
--BuildNewRestoList()
--BuildNewUIList()

--BuildFixEleList()
--BuildFixEnhList()
--BuildFixResList()
BuildFixUIList()

SSA.Bulletin = frame
_G["SSA_Bulletin"] = frame

