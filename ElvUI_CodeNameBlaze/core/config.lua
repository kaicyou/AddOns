--[[------------------------------------------------------------------------
--	CodeNameBlaze, an ElvUI edit by Blazeflack @ tukui.org
--
--	This file contains the extra settings added in this edit of ElvUI
--	Positions are set in the install along with tweaks to the healer layout
------------------------------------------------------------------------]]--
local E, L, V, P, G, _ = unpack(ElvUI); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local CNB = E:GetModule('CodeNameBlaze')

--Default options
P['CNB'] = {
	['general'] = {
		['chatbubblecolor'] = {r = 26/255, g = 26/255, b = 26/255, a = 0.5},
	},
	["actionbars"] = {
		["transparentBackdrops"] = {
			["bar1"] = true,
			["bar2"] = true,
			["bar3"] = true,
			["bar4"] = true,
			["bar5"] = true,
			["bar6"] = true,
			["bar7"] = true,
			["bar8"] = true,
			["bar9"] = true,
			["bar10"] = true,
			["pet"] = true,
			["stance"] = true,
		},
		["transparentButtonBackdrops"] = {
			["bar1"] = true,
			["bar2"] = true,
			["bar3"] = true,
			["bar4"] = true,
			["bar5"] = true,
			["bar6"] = true,
			["bar7"] = true,
			["bar8"] = true,
			["bar9"] = true,
			["bar10"] = true,
			["pet"] = true,
			["stance"] = true,
		},
	},
	["bags"] = {
		["transparentBackdrop"] = true,
		["transparentButtons"] = true,
	},
	['chat'] = {
		['bracketSelectedTab'] = true,
		['fadeChatTabs'] = false,
		['fadedChatTabAlpha'] = 0.4,
		['forceShow'] = false,
		['forceShowBelowAlpha'] = 0.1,
		['forceShowToAlpha'] = 1,
		['copyChatButtonAlpha'] = 0,
		['chatTabSeparator'] = 'SHOWBOTH',
		['chatDataSeparator']= 'SHOWBOTH',
		['editboxFont'] = 'Arial Narrow',
		['editboxFontSize'] = 13,
		['editboxhistory'] = 10,
		['timestampColor'] = true,
		['bracketColor'] = {r = 0.7, g = 0.7, b = 0.7},
		['textColor'] = {r = 0.7, g = 0.7, b = 0.7},
	},
	['datatexts'] = {
		['rightChatTabDatatextPanel'] = true,
		['bottomDatatextPanel'] = true,
		['invisibleChatDataPanel'] = true,
		['leftMinimapPanelSize'] = 60,
		['panels'] = {
			['ChatTab_Datatext_Panel'] = {
				['left'] = 'Talent/Loot Specialization',
				['middle'] = 'Call to Arms',
				['right'] = 'Bags',
			},
			['Bottom_Datatext_Panel'] = {
				['left'] = 'Friends',
				['middle'] = 'Spell/Heal Power',
				['right'] = 'Guild',
			},
		},
	},
	['unitframes'] = {
		['auras'] = {
			['decimalThreshold'] = 4,
			['textPosition'] = 'TOPLEFT',
			['textOffsetX'] = 3,
			['textOffsetY'] = -3,
			['countPosition'] = 'BOTTOMRIGHT',
			['countOffsetX'] = 1,
			['countOffsetY'] = 2,
			
			['auraSpacing'] = {
				['spacing'] = 1,
				['units'] = {
					['player'] = true,
					['target'] = true,
					['targettarget'] = true,
					['targettargettarget'] = true,
					['focus'] = true,
					['focustarget'] = true,
					['pet'] = true,
					['pettarget'] = true,
					['arena'] = true,
					['boss'] = true,
					['party'] = true,
					['raid'] = true,
					['raid40'] = true,
					['raidpet'] = true,
					["tank"] = true,
					["assist"] = true,
				},
			},
		},
		['boss'] = {
			['growthDirection'] = 'DOWN',
			['horizontalSpace'] = 0,
			['verticalSpace'] = 55,
		},
		['arena'] = {
			['growthDirection'] = 'DOWN',
			['horizontalSpace'] = 0,
			['verticalSpace'] = 20,
		},
	},
}

--Credit code, copied from ElvUI and modified
local DONATOR_STRING = ""
local CODING_STRING = ""
local TESTER_STRING = ""
local LINE_BREAK = "\n"
local DONATORS = {}
local TESTERS = {}
local CODING = {
	"Elv",
	"Tukz",
	"Hydra",
	"Simpy",
	"Azilroka",
	"Benik",
	"Darth Predator",
	"Repooc",
}
local tsort = table.sort
tsort(DONATORS, function(a,b) return a < b end) --Alphabetize
for _, donatorName in pairs(DONATORS) do
	DONATOR_STRING = DONATOR_STRING..LINE_BREAK..donatorName
end

tsort(CODING, function(a,b) return a < b end) --Alphabetize
for _, devName in pairs(CODING) do
	CODING_STRING = CODING_STRING..LINE_BREAK..devName
end

tsort(TESTERS, function(a,b) return a < b end) --Alphabetize
for _, testerName in pairs(TESTERS) do
	TESTER_STRING = TESTER_STRING..LINE_BREAK..testerName
end

local function Credits()
	E.Options.args.CNB.args.spacer3 = {
		order = 8,
		type = "description",
		name = "\n\n\n",
	}
	E.Options.args.CNB.args.header3 = {
		order = 9,
		type = "header",
		name = CNB:ColorStr(L["Credit"]),
	}
	E.Options.args.CNB.args.description3 = {
		order = 10,
		type = "description",
		name = L['CNB_CREDITS']..'\n\n'..CNB:ColorStr(L['Coding:'])..CODING_STRING..'\n\n'..CNB:ColorStr(L['Testing:'])..TESTER_STRING..'\n\n'..CNB:ColorStr(L['Donations:'])..DONATOR_STRING,
	}
end
CNB.configs['credits'] = Credits