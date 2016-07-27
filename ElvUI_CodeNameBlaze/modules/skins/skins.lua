--[[------------------------------------------------------------------
--	CodeNameBlaze, an ElvUI edit by Blazeflack @ tukui.org
--
--	This file contains changes/additions to the ElvUI skinning code
------------------------------------------------------------------]]--
local E, L, V, P, G, _ = unpack(ElvUI); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local S = E:GetModule('Skins')
local CNB = E:GetModule('CodeNameBlaze')

--Cache global variables
--Lua functions
local _G = _G
local unpack, select = unpack, select

--Copied from ElvUI
local function SetModifiedBackdrop(self)
	if self.backdrop then self = self.backdrop end
	self:SetBackdropBorderColor(unpack(E["media"].rgbvaluecolor))	
end

--Copied from ElvUI
local function SetOriginalBackdrop(self)
	if self.backdrop then self = self.backdrop end
	self:SetBackdropBorderColor(unpack(E["media"].bordercolor))	
end

local buttons = {
	"UI-Panel-MinimizeButton-Disabled",
	"UI-Panel-MinimizeButton-Up",
	"UI-Panel-SmallerButton-Up",
	"UI-Panel-BiggerButton-Up",
}

--I prefer original close buttons, but desaturated. Like it used to be in ElvUI.
function S:HandleCloseButton(f, point, text)
	for i=1, f:GetNumRegions() do
		local region = select(i, f:GetRegions())
		if region:GetObjectType() == "Texture" then
			region:SetDesaturated(1)
			for n = 1, #buttons do
				local texture = buttons[n]
				if region:GetTexture() == "Interface\\Buttons\\"..texture then
					f.noBackdrop = true
				end
			end
			if region:GetTexture() == "Interface\\DialogFrame\\UI-DialogBox-Corner" then
				region:Kill()
			end
		end
	end
	
	--Create backdrop for the few close buttons that do not use original close button
	if not f.backdrop and not f.noBackdrop then
		f:CreateBackdrop('Default', true)
		f.backdrop:Point('TOPLEFT', 7, -8)
		f.backdrop:Point('BOTTOMRIGHT', -8, 8)
		f:HookScript('OnEnter', SetModifiedBackdrop)
		f:HookScript('OnLeave', SetOriginalBackdrop)
	end
	
	--Have to create the text, ElvUI code expects the element to be there. It won't show up for original close buttons anyway.
	if not f.text then
		f.text = f:CreateFontString(nil, 'OVERLAY')
		f.text:SetFont([[Interface\AddOns\ElvUI\media\fonts\PT_Sans_Narrow.ttf]], 16, 'OUTLINE')
		f.text:SetText(text)
		f.text:SetJustifyH('CENTER')
		f.text:SetPoint('CENTER', f, 'CENTER')
	end
	
	--Hide text if button is using original skin
	if f.text and f.noBackdrop then
		f.text:SetAlpha(0)
	end
	
	if point then
		f:Point("TOPRIGHT", point, "TOPRIGHT", 2, 2)
	end
end

--Set scrollbar thumb backdrop color to value color for better visibility
function CNB:HandleScrollBar(frame, thumbTrim)
	if frame:GetName() then
		if _G[frame:GetName().."ScrollUpButton"] and _G[frame:GetName().."ScrollDownButton"] then
			if frame.thumbbg and frame.thumbbg.backdropTexture then
				frame.thumbbg.backdropTexture.SetVertexColor = nil
				frame.thumbbg.backdropTexture:SetVertexColor(unpack(E.media.rgbvaluecolor))
				frame.thumbbg.backdropTexture.SetVertexColor = E.noop
			end
		end
	else
		if frame.ScrollUpButton and frame.ScrollDownButton then
			if frame.thumbbg and frame.thumbbg.backdropTexture then
				frame.thumbbg.backdropTexture.SetVertexColor = nil
				frame.thumbbg.backdropTexture:SetVertexColor(unpack(E.media.rgbvaluecolor))
				frame.thumbbg.backdropTexture.SetVertexColor = E.noop
			end
		end
	end
end
hooksecurefunc(S, "HandleScrollBar", CNB.HandleScrollBar)