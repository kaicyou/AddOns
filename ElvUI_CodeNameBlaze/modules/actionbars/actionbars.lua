--[[-----------------------------------------------------------------
--	CodeNameBlaze, an ElvUI edit by Blazeflack @ tukui.org
--
--	This file contains changes/additions to the ElvUI Action Bars
-----------------------------------------------------------------]]--
local E, L, V, P, G, _ = unpack(ElvUI); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local AB = E:GetModule('ActionBars')
local CNB = E:GetModule('CodeNameBlaze')
local LSM = LibStub("LibSharedMedia-3.0")

--Cache global variables
--Lua functions
local _G = _G
local pairs = pairs
--WoW API / Variables
local NUM_PET_ACTION_SLOTS = NUM_PET_ACTION_SLOTS
local NUM_STANCE_SLOTS = NUM_STANCE_SLOTS

--Global variables that we don't cache, list them here for mikk's FindGlobals script
-- GLOBALS: PetAB, ElvAB_4

local function SetBarTemplate(barName)
	local bar = AB["handledBars"][barName]
	if bar then
		local barTemplate = E.db.CNB.actionbars["transparentBackdrops"][barName] and "Transparent" or "Default"
		local buttonTemplate = E.db.CNB.actionbars["transparentButtonBackdrops"][barName] and "Transparent" or "Default"

		if bar.backdrop then
			bar.backdrop:SetTemplate(barTemplate)
		end

		for i = 1, #bar.buttons do
			local button = bar.buttons[i]
			if button and not button.noBackdrop and not button.useMasque and button.backdrop then
				button.backdrop:SetTemplate(buttonTemplate)
			end
		end
	end
end

local function OnCreateBar(self, id)
	local barName = "bar"..id
	SetBarTemplate(barName)
end
hooksecurefunc(AB, "CreateBar", OnCreateBar)

local function SetPetTemplate()
	local bar = _G["ElvUI_BarPet"]
	if bar then
		local barTemplate = E.db.CNB.actionbars["transparentBackdrops"]["pet"] and "Transparent" or "Default"
		local buttonTemplate = E.db.CNB.actionbars["transparentButtonBackdrops"]["pet"] and "Transparent" or "Default"

		if bar.backdrop then
			bar.backdrop:SetTemplate(barTemplate)
		end
		
		for i = 1, NUM_PET_ACTION_SLOTS do
			local button = _G["PetActionButton"..i]
			if button and not button.noBackdrop and not button.useMasque and button.backdrop then
				button.backdrop:SetTemplate(buttonTemplate)
			end
		end
	end
end
hooksecurefunc(AB, "CreateBarPet", SetPetTemplate)

local function SetStanceTemplate()
	local bar = _G["ElvUI_StanceBar"]
	if bar then
		local barTemplate = E.db.CNB.actionbars["transparentBackdrops"]["stance"] and "Transparent" or "Default"
		local buttonTemplate = E.db.CNB.actionbars["transparentButtonBackdrops"]["stance"] and "Transparent" or "Default"

		if bar.backdrop then
			bar.backdrop:SetTemplate(barTemplate)
		end
		
		for i = 1, NUM_STANCE_SLOTS do
			local button = _G["ElvUI_StanceBarButton"..i]
			if button and not button.noBackdrop and not button.useMasque and button.backdrop then
				button.backdrop:SetTemplate(buttonTemplate)
			end
		end
	end
end
hooksecurefunc(AB, "CreateBarShapeShift", SetStanceTemplate)

local function OnStyleButton(self, button)
	local barName
	local bar = button:GetParent()
	if bar == _G["ElvUI_BarPet"] then
		barName = "pet"
	elseif bar == _G["ElvUI_StanceBar"] then
		barName = "stance"
	elseif bar.id then
		barName = "bar"..bar.id
	end
	
	--Apply template to button
	if barName and button.backdrop and not button.noBackdrop and not button.useMasque then
		local buttonTemplate = E.db.CNB.actionbars["transparentButtonBackdrops"]["stance"] and "Transparent" or "Default"
		button.backdrop:SetTemplate(buttonTemplate)
	end

	--Set macro name font to match AB font
	local name = button:GetName();
	local macroName = _G[name.."Name"];
	if E.db.actionbar.macrotext and button.buttonType ~= "EXTRAACTIONBUTTON" then
		macroName:FontTemplate(LSM:Fetch("font", E.db.actionbar.font), E.db.actionbar.fontSize, E.db.actionbar.fontOutline)
	end
end
hooksecurefunc(AB, "StyleButton", OnStyleButton)

local function PositionBar4AndPetBar()
	if not E:HasMoverBeenMoved('ElvAB_4') and not E:HasMoverBeenMoved('PetAB') and E.db.actionbar.bar4.enabled and E.db.actionbar.barPet.enabled then
		local petAbWidth = PetAB and PetAB:GetWidth() or (E.db.actionbar.barPet.buttonsize + E.db.actionbar.barPet.buttonspacing*2)
		local ab4Width = ElvAB_4 and ElvAB_4:GetWidth() or (E.db.actionbar.bar4.buttonsize + E.db.actionbar.bar4.buttonspacing*2)
		
		if E.myclass == "HUNTER" or E.myclass == "WARLOCK" or (E.myclass == "MAGE" and E.myspec == 3) or (E.myclass == "DEATHKNIGHT" and E.myspec == 3) then --Permanent pets
			PetAB:ClearAllPoints()
			PetAB:SetPoint('RIGHT', E.UIParent, 'RIGHT', -4, 0)
			ElvAB_4:ClearAllPoints()
			ElvAB_4:SetPoint('RIGHT', E.UIParent, 'RIGHT', -(petAbWidth + 6), 0)
		else
			ElvAB_4:ClearAllPoints()
			ElvAB_4:SetPoint('RIGHT', E.UIParent, 'RIGHT', -4, 0)
			PetAB:ClearAllPoints()
			PetAB:SetPoint('RIGHT', E.UIParent, 'RIGHT', -(ab4Width + 6), 0)
		end
	end
end

local f = CreateFrame('Frame')
f:RegisterEvent('PLAYER_ENTERING_WORLD')
f:SetScript('OnEvent', function(self)
	self:UnregisterEvent('PLAYER_ENTERING_WORLD')
	if not E.private.actionbar.enable then return end;
	PositionBar4AndPetBar()
end)

--ActionBar options
local function ABOptions()
	E.Options.args.CNB.args.config.args.actionbars = {
		order = 1,
		type = 'group',
		name = L["ActionBars"],
		args = {
			header = {
				order = 1,
				type = "header",
				name = CNB:ColorStr(L["ActionBars"]),
			},
			general = {
				order = 2,
				type = 'group',
				name = L["General"],
				guiInline = true,
				args = {
					transparentBackdrops = {
						order = 1,
						type = "group",
						name = L["Transparent Backdrop"],
						guiInline = true,
						args = {
							pet = {
								order = 11,
								type = "toggle",
								name = L["Pet Bar"],
								get = function(info) return E.db.CNB.actionbars.transparentBackdrops.pet end,
								set = function(info, value) E.db.CNB.actionbars.transparentBackdrops.pet = value; SetPetTemplate() end,
							},
							stance = {
								order = 12,
								type = "toggle",
								name = L["Stance Bar"],
								get = function(info) return E.db.CNB.actionbars.transparentBackdrops.stance end,
								set = function(info, value) E.db.CNB.actionbars.transparentBackdrops.stance = value; SetStanceTemplate() end,
							},
						},
					},
					transparentButtonBackdrops = {
						order = 2,
						type = "group",
						name = L["Transparent Buttons"],
						guiInline = true,
						args = {
							pet = {
								order = 11,
								type = "toggle",
								name = L["Pet Bar"],
								get = function(info) return E.db.CNB.actionbars.transparentButtonBackdrops.pet end,
								set = function(info, value) E.db.CNB.actionbars.transparentButtonBackdrops.pet = value; SetPetTemplate() end,
							},
							stance = {
								order = 12,
								type = "toggle",
								name = L["Stance Bar"],
								get = function(info) return E.db.CNB.actionbars.transparentButtonBackdrops.stance end,
								set = function(info, value) E.db.CNB.actionbars.transparentButtonBackdrops.stance = value; SetStanceTemplate() end,
							},
						},
					},
				},
			},
		},
	}
	
	local numBars = 0
	for key in pairs(AB.handledBars) do
		numBars = numBars + 1
	end

	for i = 1, numBars do
		local barName = "bar"..i
		E.Options.args.CNB.args.config.args.actionbars.args.general.args.transparentBackdrops.args[barName] = {
			order = i,
			type = "toggle",
			name = L["Bar "..i],
			get = function(info) return E.db.CNB.actionbars.transparentBackdrops[barName] end,
			set = function(info, value) E.db.CNB.actionbars.transparentBackdrops[barName] = value; SetBarTemplate(barName) end,
		}
		E.Options.args.CNB.args.config.args.actionbars.args.general.args.transparentButtonBackdrops.args[barName] = {
			order = i,
			type = "toggle",
			name = L["Bar "..i],
			get = function(info) return E.db.CNB.actionbars.transparentButtonBackdrops[barName] end,
			set = function(info, value) E.db.CNB.actionbars.transparentButtonBackdrops[barName] = value; SetBarTemplate(barName) end,
		}
	end
end
CNB.configs['actionbars'] = ABOptions