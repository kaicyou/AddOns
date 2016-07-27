--[[------------------------------------------------------------
--	CodeNameBlaze, an ElvUI edit by Blazeflack @ tukui.org
--
--	This file contains initialization code for CodeNameBlaze
------------------------------------------------------------]]--
local E, L, V, P, G, _ = unpack(ElvUI); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local CNB = E:NewModule('CodeNameBlaze', 'AceHook-3.0', 'AceEvent-3.0', 'AceTimer-3.0');
local DT = E:GetModule('DataTexts')
local EP = LibStub("LibElvUIPlugin-1.0")
local addon, ns = ...

--Cache global variables
--Lua functions
local tonumber, pairs = tonumber, pairs
local format = string.format

CNB.version = GetAddOnMetadata("ElvUI_CodeNameBlaze", "Version")
CNB.versionMinE = 10.00
CNB.configs = {}
CNB.title = '|cff00b3ffCodeNameBlaze|r'

E.PopupDialogs['CNB_WARNINGVERSION'] = {
	text = L['Your version of ElvUI is older than recommended for use with %s. Please update ElvUI at your earliest convenience.'],
	button1 = CLOSE,
	timeout = 0,
	whileDead = 1,
	preferredIndex = 3,
}

E.PopupDialogs['CNB_NEWFEATURE1'] = {
	text = L['It is now possible to create pre-configured profiles for certain addons in order to match the look of %s seen in screenshots.\n\nIf interested then open the %s Install and see page 5 and 6. Do that now?'],
	button1 = L["Yes, thank you!"],
	button2 = L["No, I will do it later."],
	OnAccept = function(self)
		CNB:RunSetup()
		E.db.CNB.newfeature1_warned = true
	end,
	OnCancel = function(self)
		E.db.CNB.newfeature1_warned = true
	end,
	timeout = 0,
	whileDead = 1,
	preferredIndex = 3,
}

function CNB:InsertOptions()
	--Main GUI group
	E.Options.args.CNB = {
		order = 100,
		type = 'group',
		name = CNB.title,
		args = {
			header1 = {
				order = 1,
				type = "header",
				name = format(L["%s version %s by Blazeflack @ Darksorrow-EU"], CNB.title, CNB:ColorStr(CNB.version)),
			},		
			description1 = {
				order = 2,
				type = "description",
				name = format(L["%s is an external edit of ElvUI. Any options provided by this edit can be found in the '%s' group on the left."], CNB.title, L['Options']),
			},
			spacer1 = {
				order = 3,
				type = "description",
				name = "\n\n\n",
			},
			header2 = {
				order = 4,
				type = "header",
				name = CNB:ColorStr(L["Installation"]),
			},
			description2 = {
				order = 5,
				type = "description",
				name = format(L["The installation guide should pop up automatically after you have completed the ElvUI installation. If you wish to re-run the installation process for %s then please click the button below."], CNB.title),
			},
			spacer2 = {
				order = 6,
				type = "description",
				name = "",
			},
			install = {
				order = 7,
				type = "execute",
				name = L['Install'],
				desc = L['Run the installation process.'],
				func = function() CNB:RunSetup(); E:ToggleConfig(); end,
			},
			config = {
				order = 20,
				type = 'group',
				name = L['Options'],
				childGroups = 'tab',
				args = {},
			},
		},
	}
	
	--Insert the rest of the configs
	for _, func in pairs(CNB.configs) do func() end;
end

function CNB:Initialize()
	--Warn about ElvUI version being too low
	if tonumber(E.version) and (tonumber(E.version) < tonumber(CNB.versionMinE)) then E:StaticPopup_Show("CNB_WARNINGVERSION", CNB.title) end;
	
	--Initiate installation process if ElvUI install is complete and CNB install has not yet been run
	if E.private.install_complete and E.db.CNB.install_version == nil then CNB:RunSetup() end;
	
	--Notify user about new feature
	if E.db.CNB.install_version and tonumber(E.db.CNB.install_version) < 1.1 and not E.db.CNB.newfeature1_warned then E:StaticPopup_Show("CNB_NEWFEATURE1", CNB.title, CNB.title) end
	
	--Updates
	CNB:UpdateMedia()
	CNB:UpdateBlizzardFonts()
	hooksecurefunc(E, "UpdateMedia", CNB.UpdateMedia)
	hooksecurefunc(E, "UpdateBlizzardFonts", CNB.UpdateBlizzardFonts)
	
	--Register plugin so options are properly inserted when config is loaded
	EP:RegisterPlugin(addon, CNB.InsertOptions)
end

E:RegisterModule(CNB:GetName())