--[[----------------------------------------------------------
--	CodeNameBlaze, an ElvUI edit by Blazeflack @ tukui.org
--
--	This file contains core functions and updates media
----------------------------------------------------------]]--
local E, L, V, P, G, _ = unpack(ElvUI); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local CNB = E:GetModule('CodeNameBlaze');
local LSM = LibStub("LibSharedMedia-3.0")

--Cache global variables
--Lua functions
local _G = _G
local print = print
local format = string.format
--WoW API / Variables

--Global variables that we don't cache, list them here for mikk's FindGlobals script
-- GLOBALS: CHAT_FONT_HEIGHTS, NumberFont_Shadow_Med, WorldFrame

--Change priest color to be light blue. White is boring.
E.PriestColors = {
	r = 0,
	g = 179/255,
	b = 1,
	colorStr = '00b3ff',
}

CNB['media'] = {}

function CNB:Print(msg)
	print('|cff00b3ffCodeNameBlaze:|r', msg)
end

--Copied from ElvUI
local function RGBToHex(r, g, b)
	r = r <= 1 and r >= 0 and r or 0
	g = g <= 1 and g >= 0 and g or 0
	b = b <= 1 and b >= 0 and b or 0
	return format("%02x%02x%02x", r*255, g*255, b*255)
end

function CNB:ColorStr(str, r, g, b)
	local hex
	local coloredString
	
	if r and g and b then
		hex = RGBToHex(r, g, b)
	else
		hex = RGBToHex(0, 0.7, 1) --Light blue
	end
	
	coloredString = '|cff'..hex..str..'|r'
	return coloredString
end

function CNB:SetMoverPosition(mover, point, anchor, secondaryPoint, x, y)
	if not _G[mover] then return end
	local frame = _G[mover]

	frame:ClearAllPoints()
	frame:SetPoint(point, anchor, secondaryPoint, x, y)
	E:SaveMoverPosition(mover)
end

function CNB:UpdateMedia()
	CNB['media'].chatbubblecolor = E:GetColorTable(E.db.CNB.general.chatbubblecolor)
	
	--Timestamp Colors
	local text = E.db.CNB.chat.textColor
	local bracket = E.db.CNB.chat.bracketColor
	CNB['media'].HexTextColor = RGBToHex(text.r, text.g, text.b)
	CNB['media'].HexBracketColor = RGBToHex(bracket.r, bracket.g, bracket.b)
end

--Copied from ElvUI
local function SetFont(obj, font, size, style, r, g, b, sr, sg, sb, sox, soy)
	obj:SetFont(font, size, style)
	if sr and sg and sb then obj:SetShadowColor(sr, sg, sb) end
	if sox and soy then obj:SetShadowOffset(sox, soy) end
	if r and g and b then obj:SetTextColor(r, g, b)
	elseif r then obj:SetAlpha(r) end
end

function CNB:UpdateBlizzardFonts()
	if not E.db.CNB or not E.db.CNB.chat or not E.db.CNB.chat.editboxFont then return; end
	--Prepare fonts
	local EDITBOXFONT = LSM:Fetch("font", E.db.CNB.chat.editboxFont)
	local EDITBOXFONTSIZE = E.db.CNB.chat.editboxFontSize

	--Change minimum allowed chat font size from 12 to 8
	CHAT_FONT_HEIGHTS = {8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20}

	if (not EDITBOXFONT) or (not EDITBOXFONTSIZE) then return end -- UpdateBlizzardFonts() gets called several times during initial login, one of them is a bit too early
	--Change some game fonts and styles
	NumberFont_Shadow_Med:SetFont(EDITBOXFONT, EDITBOXFONTSIZE)
end

local function MediaOptions()
	E.Options.args.CNB.args.config.args.media = {
		order = 2,
		type = 'group',
		name = L['Media'],
		args = {
			header = {
				order = 1,
				type = "header",
				name = CNB:ColorStr(L['Media']),
			},
			general = {
				order = 2,
				type = 'group',
				name = L['General'],
				guiInline = true,
				args = {
					chatbubblecolor = {
						type = "color",
						order = 1,
						name = L["Chat Bubble Color"],
						desc = L["Backdrop color of chat bubbles"],
						hasAlpha = true,
						get = function(info)
							local t = E.db.CNB.general.chatbubblecolor
							return t.r, t.g, t.b, t.a
						end,
						set = function(info, r, g, b, a)
							E.db.CNB.general.chatbubblecolor = {}
							local t = E.db.CNB.general.chatbubblecolor
							t.r, t.g, t.b, t.a = r, g, b, a
							CNB:UpdateMedia()
							E:GetModule('Misc'):HookBubbles(WorldFrame:GetChildren())
						end,
					},
				},
			},
		},
	}
end
CNB.configs['media'] = MediaOptions