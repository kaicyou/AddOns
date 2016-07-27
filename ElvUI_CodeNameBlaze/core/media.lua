--[[---------------------------------------------------------
--	CodeNameBlaze, an ElvUI edit by Blazeflack @ tukui.org
--
--	This file contains the code that registers media
---------------------------------------------------------]]--
local E, L, V, P, G, _ = unpack(ElvUI); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local CNB = E:GetModule('CodeNameBlaze')
local LSM = LibStub("LibSharedMedia-3.0")

local function RegisterFont(name, file)
	LSM:Register("font", name, "Interface\\AddOns\\ElvUI_CodeNameBlaze\\media\\fonts\\" .. file)
end

local function RegisterSound(name, file)
	LSM:Register("sound", name, "Interface\\AddOns\\ElvUI_CodeNameBlaze\\media\\sounds\\" .. file)
end

local function RegisterStatusbar(name, file)
	LSM:Register("statusbar", name, "Interface\\AddOns\\ElvUI_CodeNameBlaze\\media\\textures\\" .. file)
end

local function RegisterBorder(name, file)
	LSM:Register("border", name, "Interface\\AddOns\\ElvUI_CodeNameBlaze\\media\\textures\\" .. file)
end

RegisterFont("PF T 7", "pf_tempesta_seven.ttf")
RegisterFont("PF T 7 Bold", "pf_tempesta_seven_bold.ttf")
RegisterFont("PF T 7 Comp.", "pf_tempesta_seven_compressed.ttf")
RegisterFont("PF T 7 Comp. Bold", "pf_tempesta_seven_compressed_bold.ttf")
RegisterFont("PF T 7 Cond.", "pf_tempesta_seven_condensed.ttf")
RegisterFont("PF T 7 Cond. Bold", "pf_tempesta_seven_condensed_bold.ttf")
RegisterFont("PF T 7 Ext.", "pf_tempesta_seven_extended.ttf")
RegisterFont("PF T 7 Ext. Bold", "pf_tempesta_seven_extended_bold.ttf")