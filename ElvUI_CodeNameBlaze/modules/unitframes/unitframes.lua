--[[----------------------------------------------------------------
--	CodeNameBlaze, an ElvUI edit by Blazeflack @ tukui.org
--
--	This file contains changes/additions to the ElvUI Unitframes
----------------------------------------------------------------]]--
local E, L, V, P, G, _ = unpack(ElvUI); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local UF = E:GetModule('UnitFrames')
local CNB = E:GetModule('CodeNameBlaze')
local LSM = LibStub("LibSharedMedia-3.0")
local ElvUF = ElvUI.oUF

--Cache global variables
--Lua functions
local _G = _G
local pairs = pairs
--WoW API / Variables
local IsResting =  IsResting

--Add colored resting tag
ElvUF.Tags.Events['restingcolored'] = "PLAYER_UPDATE_RESTING"
ElvUF.Tags.Methods['restingcolored'] = function(unit)
	if (unit == 'player' and IsResting()) then
		return '|cff3E8AC6(|r|cff77DA73zzz|r|cFF3E8AC6)|r'
	else
		return ''
	end
end

--Fix overlapping borders on auras
local function OnPostUpdateAura(self, unit, button)
	local size = button:GetParent().size
	if size then
		button:SetSize(size, size) --:Size() uses E:Scale() which causes overlapping borders
	end
end
hooksecurefunc(UF, "PostUpdateAura", OnPostUpdateAura)

--Set spacing between individual aura icons and update PostUpdateIcon
local function SetAuraSpacingAndUpdate(unitframe, unitName, auraSpacing)
	if not unitframe.Buffs and not unitframe.Debuffs then return; end

	if unitframe.Buffs then
		unitframe.Buffs.spacing = auraSpacing
		--Reset PostUpdateIcon so it includes our hook
		unitframe.Buffs.PostUpdateIcon = UF.PostUpdateAura
		--Update internal aura settings
		if unitframe.db then
			UF:Configure_Auras(unitframe, "Buffs")
		end
	end
	if unitframe.Debuffs then
		unitframe.Debuffs.spacing = auraSpacing
		unitframe.Debuffs.PostUpdateIcon = UF.PostUpdateAura
		if unitframe.db then
			UF:Configure_Auras(unitframe, "Debuffs")
		end
	end

	--Refresh aura display
	if unitframe.IsElementEnabled and unitframe:IsElementEnabled("Aura") then
		unitframe:UpdateElement("Aura")
	end
end

--Update all auras
local function UpdateAuraSettings()
	local auraSpacing = E.db.CNB.unitframes.auras.auraSpacing.spacing or 1

	for unit, unitName in pairs(UF.units) do
		local spacing = E.db.CNB.unitframes.auras.auraSpacing.units[unitName] and auraSpacing or E.Spacing
		local frameNameUnit = E:StringTitle(unitName)
		frameNameUnit = frameNameUnit:gsub('t(arget)', 'T%1')
		
		local unitframe = _G['ElvUF_'..frameNameUnit]
		if unitframe then
			SetAuraSpacingAndUpdate(unitframe, unitName, spacing)
		end
	end

	for unit, unitgroup in pairs(UF.groupunits) do
		local spacing = E.db.CNB.unitframes.auras.auraSpacing.units[unitgroup] and auraSpacing or E.Spacing
		local frameNameUnit = E:StringTitle(unit)
		frameNameUnit = frameNameUnit:gsub('t(arget)', 'T%1')
		
		local unitframe = _G['ElvUF_'..frameNameUnit]
		if unitframe then
			SetAuraSpacingAndUpdate(unitframe, unitgroup, spacing)
		end
	end

	for _, header in pairs(UF.headers) do
		local name = header.groupName
		local spacing = E.db.CNB.unitframes.auras.auraSpacing.units[name] and auraSpacing or E.Spacing

		for i = 1, header:GetNumChildren() do
			local group = select(i, header:GetChildren())
			--group is Tank/Assist Frames, but for Party/Raid we need to go deeper
			SetAuraSpacingAndUpdate(group, name, spacing)

			for j = 1, group:GetNumChildren() do
				--Party/Raid unitbutton
				local unitbutton = select(j, group:GetChildren())
				SetAuraSpacingAndUpdate(unitbutton, name, spacing)
			end
		end
	end
end

local f = CreateFrame('Frame')
f:RegisterEvent('PLAYER_ENTERING_WORLD')
f:SetScript('OnEvent', function(self)
	self:UnregisterEvent('PLAYER_ENTERING_WORLD')
	UpdateAuraSettings()
end)

--Reposition aura duration and count text
local function UpdateAuraIconSettings(self, auras, noCycle)
	local frame = auras:GetParent()
	local type = auras.type
	if(noCycle) then
		frame = auras:GetParent():GetParent()
		type = auras:GetParent().type
	end
	if(not frame.db) then return end
	
	local db = frame.db[type]
	local index = 1
	if(db) then
		if(not noCycle) then
			while(auras[index]) do
				local button = auras[index]
				button.text:Point(E.db.CNB.unitframes.auras.textPosition, E.db.CNB.unitframes.auras.textOffsetX, E.db.CNB.unitframes.auras.textOffsetY)
				button.count:Point(E.db.CNB.unitframes.auras.countPosition, E.db.CNB.unitframes.auras.countOffsetX, E.db.CNB.unitframes.auras.countOffsetY)
				
				index = index + 1
			end
		else
			auras.text:Point(E.db.CNB.unitframes.auras.textPosition, E.db.CNB.unitframes.auras.textOffsetX, E.db.CNB.unitframes.auras.textOffsetY)
			auras.count:Point(E.db.CNB.unitframes.auras.countPosition, E.db.CNB.unitframes.auras.countOffsetX, E.db.CNB.unitframes.auras.countOffsetY)
		end
	end
end
hooksecurefunc(UF, "UpdateAuraIconSettings", UpdateAuraIconSettings)

local function SetAuraWidth(self, frame, auraType)
	local db = frame.db

	local auras = frame[auraType]
	auraType = auraType:lower()
	
	if db[auraType].sizeOverride and db[auraType].sizeOverride > 0 then		
		auras:SetWidth(db[auraType].perrow * db[auraType].sizeOverride + ((db[auraType].perrow - 1) * auras.spacing))
	end
end
hooksecurefunc(UF, 'Configure_Auras', SetAuraWidth)

local function UpdateAuraTimer(self, elapsed)	
	local timervalue, formatid
	timervalue, formatid, self.nextupdate = E:GetTimeInfo(self.expiration, E.db.CNB.unitframes.auras.decimalThreshold)
	if self.text:GetFont() then
		self.text:SetFormattedText(("%s%s|r"):format(E.TimeColors[formatid], E.TimeFormats[formatid][2]), timervalue)
	end
end
hooksecurefunc(UF, "UpdateAuraTimer", UpdateAuraTimer)

local function UFOptions()
	E.Options.args.CNB.args.config.args.unitframes = {
		order = 3,
		type = 'group',
		name = L['Unitframes'],
		childGroups = "tab",
		args = {
			header = {
				order = 1,
				type = "header",
				name = CNB:ColorStr(L['Unitframes']),
			},
			auras = {
				order = 2,
				type = 'group',
				name = L['Auras'],
				get = function(info) return E.db.CNB.unitframes.auras[ info[#info] ] end,
				set = function(info, value) E.db.CNB.unitframes.auras[ info[#info] ] = value; E:StaticPopup_Show('CONFIG_RL'); end,
				args = {
					textPosition = {
						order = 1,
						type = 'select',
						name = L['Duration Position'],
						desc = L['Position of the duration text on the aura icon.'],
						values = {
							['BOTTOMLEFT'] = L['Bottom Left'],
							['BOTTOMRIGHT'] = L['Bottom Right'],
							['TOPLEFT'] = L['Top Left'],
							['TOPRIGHT'] = L['Top Right'],
							['CENTER'] = L['Center'],
						},
					},
					textOffsetX = {
						order = 2,
						type = 'range',
						name = L['Duration X-Offset'],
						desc = L['Horizontal offset of the duration text.'],
						min = -20, max = 20, step = 1,
					},
					textOffsetY = {
						order = 3,
						type = 'range',
						name = L['Duration Y-Offset'],
						desc = L['Vertical offset of the duration text.'],
						min = -20, max = 20, step = 1,
					},
					spacer2 = {
						order = 4,
						type = 'description',
						name = '',
					},
					countPosition = {
						order = 5,
						type = 'select',
						name = L['Count Position'],
						desc = L['Position of the stack count on the aura icon.'],
						values = {
							['BOTTOMLEFT'] = L['Bottom Left'],
							['BOTTOMRIGHT'] = L['Bottom Right'],
							['TOPLEFT'] = L['Top Left'],
							['TOPRIGHT'] = L['Top Right'],
							['CENTER'] = L['Center'],
						},
					},
					countOffsetX = {
						order = 6,
						type = 'range',
						name = L['Count X-Offset'],
						desc = L['Horizontal offset of the stack count.'],
						min = -20, max = 20, step = 1,
					},
					countOffsetY = {
						order = 7,
						type = 'range',
						name = L['Count Y-Offset'],
						desc = L['Vertical offset of the stack count.'],
						min = -20, max = 20, step = 1,
					},
					spacer = {
						order = 8,
						type = 'description',
						name = '',
					},
					decimalThreshold = {
						type = 'range',
						order = 9,
						name = L["Decimal Threshold"],
						desc = L['Threshold before the timer changes color and goes into decimal form. Set to -1 to disable.'],
						set = function(info, value) E.db.CNB.unitframes.auras[ info[#info] ] = value; end,
						min = -1, max = 30, step = 1,
					},
					spacing = {
						type = 'range',
						order = 10,
						name = L["Aura Spacing"],
						desc = L['Sets space between individual aura icons.'],
						get = function(info) return E.db.CNB.unitframes.auras.auraSpacing.spacing end,
						set = function(info, value) E.db.CNB.unitframes.auras.auraSpacing.spacing = value; UpdateAuraSettings(); end,
						min = 0, max = 10, step = 1,
					},
					units = {
						type = "multiselect",
						order = 11,
						name = L["Set Aura Spacing On Following Units"],
						get = function(info, key) return E.db.CNB.unitframes.auras.auraSpacing.units[key] end,
						set = function(info, key, value) E.db.CNB.unitframes.auras.auraSpacing.units[key] = value; UpdateAuraSettings(); end,
						values = {
							['player'] = L["Player"],
							['target'] = L["Target"],
							['targettarget'] = L["TargetTarget"],
							['targettargettarget'] = L["TargetTargetTarget"],
							['focus'] = L["Focus"],
							['focustarget'] = L["FocusTarget"],
							['pet'] = L["Pet"],
							['pettarget'] = L["PetTarget"],
							['arena'] = L["Arena"],
							['boss'] = L["Boss"],
							['party'] = L["Party"],
							['raid'] = L["Raid"],
							['raid40'] = L["Raid40"],
							['raidpet'] = L["RaidPet"],
							["tank"] = L["Tank"],
							["assist"] = L["Assist"],
						},
					},
				},
			},
		},
	}
end
CNB.configs['unitframes'] = UFOptions