local FOLDER_NAME, SSA = ...
local version = GetAddOnMetadata(FOLDER_NAME,"Version");
local L = LibStub("AceLocale-3.0"):GetLocale("ShamanAuras", true)
local Auras = LibStub("AceAddon-3.0"):GetAddon("ShamanAuras")

local TimeClock = CreateFrame("Frame");
local function CheckElementalDefaultValues(options,group,subgroup)
	if (group == "Cooldowns") then
		if (Auras.db.char.config[1].cooldown.sweep) then
			options.args.config.args.cooldown.args.inverse.disabled = false;
		else
			options.args.config.args.cooldown.args.inverse.disabled = true;
		end
	elseif (group == "Maelstrom") then
		if (subgroup == "Alpha" or subgroup == "All") then
			if (Auras.db.char.config[1].maelstromBar.alphaOoC ~= Auras.db.char.config.default.alphaOoC) then
				options.args.config.args.maelstromBar.args.alphaTarget.disabled = true;
			else
				options.args.config.args.maelstromBar.args.alphaTarget.disabled = false;
			end
		end
		
		if (subgroup == "Threshold" or subgroup == "All") then
			if (value == false) then
				options.args.config.args.maelstromBar.args.threshold.disabled = true;
			else
				options.args.config.args.maelstromBar.args.threshold.disabled = false;
			end
		end
		
		if (Auras.db.char.config[1].maelstromBar.alphaOoC ~= Auras.db.char.config.default.alphaOoC or Auras.db.char.config[1].maelstromBar.alphaTar ~= Auras.db.char.config.default.alphaTar or Auras.db.char.config[1].maelstromBar.alphaCombat ~= Auras.db.char.config.default.alphaCombat or Auras.db.char.config[1].maelstromBar.justify ~= Auras.db.char.config.default.justify or Auras.db.char.config[1].maelstromBar.threshold ~= Auras.db.char.config.default[1].maelstromBar.threshold or not Auras.db.char.config[1].maelstromBar.animate or not Auras.db.char.config[1].maelstromBar.isDisplayText or Auras.db.char.layout[1].maelstromBar.width ~= Auras.db.char.layout.default.LargeBar.width or Auras.db.char.layout[1].maelstromBar.height ~= Auras.db.char.layout.default.LargeBar.height or Auras.db.char.layout[1].maelstromBar.textSize ~= Auras.db.char.layout.default.textSize) then
			options.args.config.args.maelstromBar.args.reset.disabled = false;
			options.args.config.args.maelstromBar.args.reset.name = "|cFFFFCC00"..L["Reset Maelstrom Bar"].."|r"
		else
			options.args.config.args.maelstromBar.args.reset.disabled = true;
			options.args.config.args.maelstromBar.args.reset.name = "|cFF666666"..L["Reset Maelstrom Bar"].."|r"
		end
	elseif (group == "Triggers") then
		if (Auras.db.char.triggers[1].OoCAlpha ~= Auras.db.char.triggers.default.OoCAlpha or Auras.db.char.triggers[1].flameShock ~= Auras.db.char.triggers.default[1].flameShock or Auras.db.char.triggers[1].totemMastery ~= Auras.db.char.triggers.default[1].totemMastery or Auras.db.char.triggers[1].OoRColor.r ~= Auras.db.char.triggers.default.OoRColor.r or Auras.db.char.triggers[1].OoRColor.g ~= Auras.db.char.triggers.default.OoRColor.g or Auras.db.char.triggers[1].OoRColor.b ~= Auras.db.char.triggers.default.OoRColor.b or Auras.db.char.triggers[1].OoRColor.a ~= Auras.db.char.triggers.default.OoRColor.a) then
			options.args.config.args.triggers.args.reset.disabled = false;
			options.args.config.args.triggers.args.reset.name = "|cFFFFCC00"..L["Reset Trigger Values"].."|r";
		else
			options.args.config.args.triggers.args.reset.disabled = true;
			options.args.config.args.triggers.args.reset.name = "|cFF666666"..L["Reset Trigger Values"].."|r";
		end
	elseif (group == "Primary") then
		if (Auras.db.char.layout[1].orientation.top ~= Auras.db.char.layout.default.orientation.top or Auras.db.char.layout[1].orientation.bottom ~= Auras.db.char.layout.default.orientation.bottom or Auras.db.char.layout[1].primary.top.icon ~= Auras.db.char.layout.default.primary.top.icon or Auras.db.char.layout[1].primary.top.spacing ~= Auras.db.char.layout.default.primary.top.spacing or Auras.db.char.layout[1].primary.top.charges ~= Auras.db.char.layout.default.primary.top.charges or Auras.db.char.layout[1].primary.bottom.icon ~= Auras.db.char.layout.default.primary.bottom.icon or Auras.db.char.layout[1].primary.bottom.spacing ~= Auras.db.char.layout.default.primary.bottom.spacing) then
			options.args.layout.args.ResetPrimaryLayout.disabled = false;
			options.args.layout.args.ResetPrimaryLayout.name = "|cFFFFCC00"..L["Reset Primary Layout"].."|r";
		else
			options.args.layout.args.ResetPrimaryLayout.disabled = true;
			options.args.layout.args.ResetPrimaryLayout.name = "|cFF666666"..L["Reset Primary Layout"].."|r";
		end
	elseif (group == "Secondary") then
		if (Auras.db.char.layout[1].orientation.left ~= Auras.db.char.layout.default.orientation.left or Auras.db.char.layout[1].orientation.right ~= Auras.db.char.layout.default.orientation.right or Auras.db.char.layout[1].secondary.left.icon ~= Auras.db.char.layout.default.secondary.left.icon or Auras.db.char.layout[1].secondary.left.spacing ~= Auras.db.char.layout.default.secondary.left.spacing or Auras.db.char.layout[1].secondary.right.icon ~= Auras.db.char.layout.default.secondary.right.icon or Auras.db.char.layout[1].secondary.right.spacing ~= Auras.db.char.layout.default.secondary.right.spacing) then
			options.args.layout.args.ResetSecondaryLayout.disabled = false;
			options.args.layout.args.ResetSecondaryLayout.name = "|cFFFFCC00"..L["Reset Secondary Layout"].."|r";
		else
			options.args.layout.args.ResetSecondaryLayout.disabled = true;
			options.args.layout.args.ResetSecondaryLayout.name = "|cFF666666"..L["Reset Secondary Layout"].."|r";
		end
	elseif (group == "Icefury") then
		if (subgroup == "Alpha" or subgroup == "All") then
			if (Auras.db.char.config[1].icefuryBar.alphaOoC ~= Auras.db.char.config.default.alphaOoC) then
				options.args.config.args.icefuryBar.args.alphaTarget.disabled = true;
			else
				options.args.config.args.icefuryBar.args.alphaTarget.disabled = false;
			end
		end
		
		if (not Auras.db.char.config[1].icefuryBar.isDisplayTimerText or not Auras.db.char.config[1].icefuryBar.isDisplayCountText or Auras.db.char.config[1].icefuryBar.alphaTar ~= Auras.db.char.config.default.alphaTar or Auras.db.char.config[1].icefuryBar.alphaCombat ~= Auras.db.char.config.default.alphaCombat or Auras.db.char.config[1].icefuryBar.alphaOoC ~= Auras.db.char.config.default.alphaOoC or Auras.db.char.layout[1].icefuryBar.width ~= Auras.db.char.layout.default.LargeBar.width or Auras.db.char.layout[1].icefuryBar.height ~= Auras.db.char.layout.default.LargeBar.height or Auras.db.char.layout[1].icefuryBar.textSize ~= Auras.db.char.layout.default.textSize) then
			options.args.config.args.icefuryBar.args.reset.disabled = false;
			options.args.config.args.icefuryBar.args.reset.name = "|cFFFFCC00"..L["Reset Icefury Bar"].."|r";
		else
			options.args.config.args.icefuryBar.args.reset.disabled = true;
			options.args.config.args.icefuryBar.args.reset.name = "|cFF666666"..L["Reset Icefury Bar"].."|r";
		end
	end
end

local function CheckEnhancementDefaultValues(options,group,subgroup)
	if (group == "Cooldowns") then
		if (Auras.db.char.config[2].cooldown.sweep) then
			options.args.config.args.cooldown.args.inverse.disabled = false;
		else
			options.args.config.args.cooldown.args.inverse.disabled = true;
		end
	elseif (group == "Maelstrom") then
		if (subgroup == "Alpha" or subgroup == 'All') then
			if (Auras.db.char.config[2].maelstromBar.alphaOoC ~= Auras.db.char.config.default.alphaOoC) then
				options.args.config.args.maelstromBar.args.alphaTarget.disabled = true;
			else
				options.args.config.args.maelstromBar.args.alphaTarget.disabled = false;
			end
		end
		
		if (Auras.db.char.config[2].maelstromBar.alphaOoC ~= Auras.db.char.config.default.alphaOoC or Auras.db.char.config[2].maelstromBar.alphaTar ~= Auras.db.char.config.default.alphaTar or Auras.db.char.config[2].maelstromBar.alphaCombat ~= Auras.db.char.config.default.alphaCombat or Auras.db.char.config[2].maelstromBar.justify ~= Auras.db.char.config.default.justify or Auras.db.char.config[2].maelstromBar.threshold ~= Auras.db.char.config.default[2].maelstromBar.threshold or not Auras.db.char.config[2].maelstromBar.animate or not Auras.db.char.config[2].maelstromBar.isDisplayText or Auras.db.char.layout[2].maelstromBar.width ~= Auras.db.char.layout.default.LargeBar.width or Auras.db.char.layout[2].maelstromBar.height ~= Auras.db.char.layout.default.LargeBar.height or Auras.db.char.layout[2].maelstromBar.textSize ~= Auras.db.char.layout.default.textSize) then
			options.args.config.args.maelstromBar.args.reset.disabled = false;
			options.args.config.args.maelstromBar.args.reset.name = "|cFFFFCC00"..L["Reset Maelstrom Bar"].."|r"
		else
			options.args.config.args.maelstromBar.args.reset.disabled = true;
			options.args.config.args.maelstromBar.args.reset.name = "|cFF666666"..L["Reset Maelstrom Bar"].."|r"
		end
	elseif (group == "Triggers") then
		if (Auras.db.char.triggers[2].OoCAlpha ~= Auras.db.char.triggers.default.OoCAlpha or Auras.db.char.triggers[2].flametongue ~= Auras.db.char.triggers.default[2].flametongue or Auras.db.char.triggers[2].frostbrand ~= Auras.db.char.triggers.default[2].frostbrand or Auras.db.char.triggers[2].boulderfist ~= Auras.db.char.triggers.default[2].boulderfist or Auras.db.char.triggers[2].OoRColor.r ~= Auras.db.char.triggers.default.OoRColor.r or Auras.db.char.triggers[2].OoRColor.g ~= Auras.db.char.triggers.default.OoRColor.g or Auras.db.char.triggers[2].OoRColor.b ~= Auras.db.char.triggers.default.OoRColor.b or Auras.db.char.triggers[2].OoRColor.a ~= Auras.db.char.triggers.default.OoRColor.a) then
			options.args.config.args.triggers.args.reset.disabled = false;
			options.args.config.args.triggers.args.reset.name = "|cFFFFCC00"..L["Reset Trigger Values"].."|r";
		else
			options.args.config.args.triggers.args.reset.disabled = true;
			options.args.config.args.triggers.args.reset.name = "|cFF666666"..L["Reset Trigger Values"].."|r";
		end
	elseif (group == "Primary") then
		if (Auras.db.char.layout[2].orientation.top ~= Auras.db.char.layout.default.orientation.top or Auras.db.char.layout[2].orientation.bottom ~= Auras.db.char.layout.default.orientation.bottom or Auras.db.char.layout[2].primary.top.icon ~= Auras.db.char.layout.default.primary.top.icon or Auras.db.char.layout[2].primary.top.spacing ~= Auras.db.char.layout.default.primary.top.spacing or Auras.db.char.layout[2].primary.top.charges ~= Auras.db.char.layout.default.primary.top.charges or Auras.db.char.layout[2].primary.bottom.icon ~= Auras.db.char.layout.default.primary.bottom.icon or Auras.db.char.layout[2].primary.bottom.spacing ~= Auras.db.char.layout.default.primary.bottom.spacing or Auras.db.char.layout[2].primary.bottom.charges ~= Auras.db.char.layout.default.primary.bottom.charges) then
			options.args.layout.args.ResetPrimaryLayout.disabled = false;
			options.args.layout.args.ResetPrimaryLayout.name = "|cFFFFCC00"..L["Reset Primary Layout"].."|r";
		else
			options.args.layout.args.ResetPrimaryLayout.disabled = true;
			options.args.layout.args.ResetPrimaryLayout.name = "|cFF666666"..L["Reset Primary Layout"].."|r";
		end
	elseif (group == "Secondary") then
		if (Auras.db.char.layout[2].orientation.left ~= Auras.db.char.layout.default.orientation.left or Auras.db.char.layout[2].orientation.right ~= Auras.db.char.layout.default.orientation.right or Auras.db.char.layout[2].secondary.left.icon ~= Auras.db.char.layout.default.secondary.left.icon or Auras.db.char.layout[2].secondary.left.spacing ~= Auras.db.char.layout.default.secondary.left.spacing or Auras.db.char.layout[2].secondary.right.icon ~= Auras.db.char.layout.default.secondary.right.icon or Auras.db.char.layout[2].secondary.right.spacing ~= Auras.db.char.layout.default.secondary.right.spacing) then
			options.args.layout.args.ResetSecondaryLayout.disabled = false;
			options.args.layout.args.ResetSecondaryLayout.name = "|cFFFFCC00"..L["Reset Secondary Layout"].."|r";
		else
			options.args.layout.args.ResetSecondaryLayout.disabled = true;
			options.args.layout.args.ResetSecondaryLayout.name = "|cFF666666"..L["Reset Secondary Layout"].."|r";
		end
	elseif (group == "Maelstrom Bar") then
		--[[if (Auras.db.char.layout[2].maelstromBar.width ~= Auras.db.char.layout.default.LargeBar.width or Auras.db.char.layout[2].maelstromBar.height ~= Auras.db.char.layout.default.LargeBar.height) then
			options.args.config.args.layout.args.ResetMaelstromBar.disabled = false;
			options.args.config.args.layout.args.ResetMaelstromBar.name = "|cFFFFCC00"..L["Reset Maelstrom Bar"].."|r";
		else
			options.args.config.args.layout.args.ResetMaelstromBar.disabled = true;
			options.args.config.args.layout.args.ResetMaelstromBar.name = "|cFF666666"..L["Reset Maelstrom Bar"].."|r";
		end]]
	end
end

local function CheckRestorationDefaultValues(options,group,subgroup)
	if (group == "Cooldowns") then
		if (Auras.db.char.config[3].cooldown.sweep) then
			options.args.config.args.cooldown.args.inverse.disabled = false;
		else
			options.args.config.args.cooldown.args.inverse.disabled = true;
		end
	elseif (group == "Triggers") then
		if (Auras.db.char.triggers[3].OoCAlpha ~= Auras.db.char.triggers.default.OoCAlpha or Auras.db.char.triggers[3].flameShock ~= Auras.db.char.triggers.default[3].flameShock or Auras.db.char.triggers[3].OoRColor.r ~= Auras.db.char.triggers.default.OoRColor.r or Auras.db.char.triggers[3].OoRColor.g ~= Auras.db.char.triggers.default.OoRColor.g or Auras.db.char.triggers[3].OoRColor.b ~= Auras.db.char.triggers.default.OoRColor.b or Auras.db.char.triggers[3].OoRColor.a ~= Auras.db.char.triggers.default.OoRColor.a) then
			options.args.config.args.triggers.args.reset.disabled = false;
			options.args.config.args.triggers.args.reset.name = "|cFFFFCC00"..L["Reset Trigger Values"].."|r";
		else
			options.args.config.args.triggers.args.reset.disabled = true;
			options.args.config.args.triggers.args.reset.name = "|cFF666666"..L["Reset Trigger Values"].."|r";
		end
	elseif (group == "Primary") then
		if (Auras.db.char.layout[3].orientation.top ~= Auras.db.char.layout.default.orientation.top or Auras.db.char.layout[3].orientation.bottom ~= Auras.db.char.layout.default.orientation.bottom or Auras.db.char.layout[3].primary.top.icon ~= Auras.db.char.layout.default.primary.top.icon or Auras.db.char.layout[3].primary.top.spacing ~= Auras.db.char.layout.default.primary.top.spacing or Auras.db.char.layout[3].primary.top.charges ~= Auras.db.char.layout.default.primary.top.charges or Auras.db.char.layout[3].primary.bottom.icon ~= Auras.db.char.layout.default.primary.bottom.icon or Auras.db.char.layout[3].primary.bottom.spacing ~= Auras.db.char.layout.default.primary.bottom.spacing) then
			options.args.layout.args.ResetPrimaryLayout.disabled = false;
			options.args.layout.args.ResetPrimaryLayout.name = "|cFFFFCC00"..L["Reset Primary Layout"].."|r";
		else
			options.args.layout.args.ResetPrimaryLayout.disabled = true;
			options.args.layout.args.ResetPrimaryLayout.name = "|cFF666666"..L["Reset Primary Layout"].."|r";
		end
	elseif (group == "Secondary") then
		if (Auras.db.char.layout[3].orientation.left ~= Auras.db.char.layout.default.orientation.left or Auras.db.char.layout[3].orientation.right ~= Auras.db.char.layout.default.orientation.right or Auras.db.char.layout[3].secondary.left.icon ~= Auras.db.char.layout.default.secondary.left.icon or Auras.db.char.layout[3].secondary.left.spacing ~= Auras.db.char.layout.default.secondary.left.spacing or Auras.db.char.layout[3].secondary.right.icon ~= Auras.db.char.layout.default.secondary.right.icon or Auras.db.char.layout[3].secondary.right.spacing ~= Auras.db.char.layout.default.secondary.right.spacing or Auras.db.char.layout[3].secondary.right.charges ~= Auras.db.char.layout.default.secondary.right.charges) then
			options.args.layout.args.ResetSecondaryLayout.disabled = false;
			options.args.layout.args.ResetSecondaryLayout.name = "|cFFFFCC00"..L["Reset Secondary Layout"].."|r";
		else
			options.args.layout.args.ResetSecondaryLayout.disabled = true;
			options.args.layout.args.ResetSecondaryLayout.name = "|cFF666666"..L["Reset Secondary Layout"].."|r";
		end
	elseif (group == "Earthen Shield") then
		if (not Auras.db.char.config[3].earthenShieldBar.isDisplayTimerText or not Auras.db.char.config[3].earthenShieldBar.isDisplayHealthText or Auras.db.char.config[3].earthenShieldBar.alphaCombat ~= Auras.db.char.config.default.alphaCombat or Auras.db.char.config[3].earthenShieldBar.alphaOoC ~= Auras.db.char.config.default.alphaOoC or Auras.db.char.layout[3].earthenShieldBar.width ~= Auras.db.char.layout.default.LargeBar.width or Auras.db.char.layout[3].earthenShieldBar.height ~= Auras.db.char.layout.default.LargeBar.height or Auras.db.char.layout[3].earthenShieldBar.textSize ~= Auras.db.char.layout.default.textSize) then
			options.args.config.args.earthenShield.args.reset.disabled = false;
			options.args.config.args.earthenShield.args.reset.name = "|cFFFFCC00"..L["Reset Earthen Shield Bar"].."|r"
		else
			options.args.config.args.earthenShield.args.reset.disabled = true;
			options.args.config.args.earthenShield.args.reset.name = "|cFF666666"..L["Reset Earthen Shield Bar"].."|r"
		end
	elseif (group == "Mana Bar") then
		if (Auras.db.char.config[3].manaBar.precision ~= Auras.db.char.config.default[3].manaBar.precision or not Auras.db.char.config[3].manaBar.grouping or Auras.db.char.config[3].manaBar.justify ~= Auras.db.char.config.default.justify or not Auras.db.char.config[3].manaBar.isDisplayText or Auras.db.char.config[3].manaBar.alphaCombat ~= Auras.db.char.config.default.alphaCombat or Auras.db.char.config[3].manaBar.alphaOoC ~= Auras.db.char.config.default.alphaOoC or Auras.db.char.layout[3].manaBar.width ~= Auras.db.char.layout.default.LargeBar.width or Auras.db.char.layout[3].manaBar.height ~= Auras.db.char.layout.default.LargeBar.height or Auras.db.char.layout[3].manaBar.textSize ~= Auras.db.char.layout.default.textSize) then
			options.args.config.args.manaBar.args.ResetManaBar.disabled = false;
			options.args.config.args.manaBar.args.ResetManaBar.name = "|cFFFFCC00"..L["Reset Mana Bar"].."|r"
		else
			options.args.config.args.manaBar.args.ResetManaBar.disabled = true;
			options.args.config.args.manaBar.args.ResetManaBar.name = "|cFF666666"..L["Reset Mana Bar"].."|r"
		end
	elseif (group == "Tidal Waves") then
		if (not Auras.db.char.config[3].tidalWavesBar.animate or Auras.db.char.config[3].tidalWavesBar.emptyColor.r ~= Auras.db.char.config.default[3].tidalWavesBar.emptyColor.r or Auras.db.char.config[3].tidalWavesBar.emptyColor.g ~= Auras.db.char.config.default[3].tidalWavesBar.emptyColor.g or Auras.db.char.config[3].tidalWavesBar.emptyColor.b ~= Auras.db.char.config.default[3].tidalWavesBar.emptyColor.b or Auras.db.char.config[3].tidalWavesBar.emptyColor.a ~= Auras.db.char.config.default[3].tidalWavesBar.emptyColor.a or Auras.db.char.config[3].tidalWavesBar.combatDisplay ~= Auras.db.char.config.default[3].tidalWavesBar.combatDisplay or Auras.db.char.config[3].tidalWavesBar.OoCDisplay ~= Auras.db.char.config.default[3].tidalWavesBar.OoCDisplay or Auras.db.char.config[3].tidalWavesBar.OoCTime ~= Auras.db.char.config.default[3].tidalWavesBar.OoCTime or Auras.db.char.layout[3].tidalWavesBar.width ~= Auras.db.char.layout.default.SmallBar.width or Auras.db.char.layout[3].tidalWavesBar.height ~= Auras.db.char.layout.default.SmallBar.height) then
			options.args.config.args.tidalWavesBar.args.reset.disabled = false;
			options.args.config.args.tidalWavesBar.args.reset.name = "|cFFFFCC00"..L["Reset Tidal Waves Bar"].."|r"
		else
			options.args.config.args.tidalWavesBar.args.reset.disabled = true;
			options.args.config.args.tidalWavesBar.args.reset.name = "|cFF666666"..L["Reset Tidal Waves Bar"].."|r"
		end
	end
end

local ele_options

local function GetElementalOptions()
	if not ele_options then
		ele_options = {
			type = "group",
			childGroups = "tab",
			order = 1,
			name = L["Elemental Auras"],
			desc = L["Auras used by the Elemental specialization"],
			args = {
				display = {
					name = L["Display"],
					order = 0,
					type = "group",
					args = {
						--[[desc = {
							order = 0,
							type = "description",
							name = L["Elemental Shaman Auras"],
						},]]
						show = {
							order = 1,
							name = L["Show Elemental Auras"],
							desc = L["Toggle the display of Elemental Auras"],
							type = "toggle",
							get = function()
								return Auras.db.char.frames.eleGrp.enabled;
							end,
							set = function(_, value)
								Auras.db.char.frames.eleGrp.enabled = value;
								if (not value) then
									AuraGroupEle:Hide();
								else
									AuraGroupEle:Show();
								end
							end,
						},
						MajorAuras = {
							name = L["Major Auras"],
							type = "group",
							order = 2,
							guiInline = true,
							args = {
								AncestralGuidanceEle = {
									order = 1,
									type = "toggle",
									name = L["Ancestral Guidance"],
									get = function() 
										return Auras.db.char.aura[1].AncestralGuidanceEle;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].AncestralGuidanceEle = value
										Auras:UpdateTalents()
									end,
								},
								AscendanceEle = {
									order = 2,
									type = "toggle",
									name = L["Ascendance"],
									get = function() 
										return Auras.db.char.aura[1].AscendanceEle;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].AscendanceEle = value
										Auras:UpdateTalents()
									end,
								},
								Earthquake = {
									order = 3,
									type = "toggle",
									name = L["Earthquake"],
									get = function()
										return Auras.db.char.aura[1].Earthquake;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].Earthquake = value
										Auras:UpdateTalents()
									end,
								},
								EarthShock = {
									order = 4,
									type = "toggle",
									name = L["Earth Shock"],
									get = function()
										return Auras.db.char.aura[1].EarthShock;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].EarthShock = value
										Auras:UpdateTalents()
									end,
								},
								ElementalBlast = {
									order = 5,
									type = "toggle",
									name = L["Elemental Blast"],
									get = function()
										return Auras.db.char.aura[1].ElementalBlast;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].ElementalBlast = value
										Auras:UpdateTalents()
									end,
								},
								ElementalFocus = {
									order = 6,
									type = "toggle",
									name = L["Elemental Focus"],
									get = function()
										return Auras.db.char.aura[1].ElementalFocus;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].ElementalFocus = value
										Auras:UpdateTalents()
									end,
								},
								ElementalMastery = {
									order = 7,
									type = "toggle",
									name = L["Elemental Mastery"],
									get = function()
										return Auras.db.char.aura[1].ElementalMastery;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].ElementalMastery = value
										Auras:UpdateTalents()
									end,
								},
								FireElemental = {
									order = 8,
									type = "toggle",
									name = L["Fire Elemental"],
									get = function() 
										return Auras.db.char.aura[1].FireElemental;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].FireElemental = value
										Auras:UpdateTalents()
									end,
								},
								FlameShock = {
									order = 9,
									type = "toggle",
									name = L["Flame Shock"],
									get = function()
										return Auras.db.char.aura[1].FlameShock;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].FlameShock = value
										Auras:UpdateTalents()
									end,
								},
								Icefury = {
									order = 10,
									type = "toggle",
									name = L["Icefury"],
									get = function() 
										return Auras.db.char.aura[1].Icefury;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].Icefury = value
										Auras:UpdateTalents()
									end,
								},
								LavaBurst = {
									order = 11,
									type = "toggle",
									name = L["Lava Burst"],
									get = function()
										return Auras.db.char.aura[1].LavaBurstEle;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].LavaBurstEle = value
										Auras:UpdateTalents()
									end,
								},
								LiquidMagmaTotem = {
									order = 12,
									type = "toggle",
									name = L["Liquid Magma Totem"],
									get = function()
										return Auras.db.char.aura[1].LiquidMagmaTotem;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].LiquidMagmaTotem = value
										Auras:UpdateTalents()
									end,
								},
								PowerOfMaelstrom = {
									order = 13,
									type = "toggle",
									name = L["Power of the Maelstrom"],
									get = function()
										return Auras.db.char.aura[1].PowerOfMaelstrom;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].PowerOfMaelstrom = value
										Auras:UpdateTalents()
									end,
								},
								StormElemental = {
									order = 14,
									type = "toggle",
									name = L["Storm Elemental"],
									get = function() 
										return Auras.db.char.aura[1].StormElemental;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].StormElemental = value
										Auras:UpdateTalents()
									end,
								},
								Stormkeeper = {
									order = 15,
									type = "toggle",
									name = L["Stormkeeper"],
									get = function() 
										return Auras.db.char.aura[1].Stormkeeper;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].Stormkeeper = value
										Auras:UpdateTalents()
									end,
								},
							},
						},
						MinorAuras = {
							name = L["Minor Auras"],
							type = "group",
							order = 3,
							guiInline = true,
							args = {
								AstralShift = {
									order = 1,
									type = "toggle",
									name = L["Astral Shift"],
									get = function()
										return Auras.db.char.aura[1].AstralShiftEle;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].AstralShiftEle = value
										Auras:UpdateTalents()
									end,
								},
								CleanseSpirit = {
									order = 2,
									type = "toggle",
									name = L["Cleanse Spirit"],
									get = function()
										return Auras.db.char.aura[1].CleanseSpiritEle;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].CleanseSpiritEle = value
										Auras:UpdateTalents()
									end,
								},
								EarthElemental = {
									order = 3,
									type = "toggle",
									name = L["Earth Elemental"],
									get = function()
										return Auras.db.char.aura[1].EarthElemental;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].EarthElemental = value
										Auras:UpdateTalents()
									end,
								},
								EarthgrabTotemEle = {
									order = 4,
									type = "toggle",
									name = L["Earthgrab Totem"],
									get = function()
										return Auras.db.char.aura[1].EarthgrabTotemEle;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].EarthgrabTotemEle = value
										Auras:UpdateTalents()
									end,
								},
								GustOfWind = {
									order = 5,
									type = "toggle",
									name = L["Gust of Wind"],
									get = function()
										return Auras.db.char.aura[1].GustWindEle;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].GustWindEle = value
										Auras:UpdateTalents()
									end,
								},
								Hex = {
									order = 6,
									type = "toggle",
									name = L["Hex"],
									get = function()
										return Auras.db.char.aura[1].HexEle;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].HexEle = value
										Auras:UpdateTalents()
									end,
								},
								Thunderstorm = {
									order = 7,
									type = "toggle",
									name = L["Thunderstorm"],
									get = function()
										return Auras.db.char.aura[1].Thunderstorm;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].Thunderstorm = value
										Auras:UpdateTalents()
									end,
								},
								LightningSurgeTotemEle = {
									order = 8,
									type = "toggle",
									name = L["Lightning Surge Totem"],
									get = function()
										return Auras.db.char.aura[1].LightningSurgeTotemEle;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].LightningSurgeTotemEle = value
										Auras:UpdateTalents()
									end,
								},
								VoodooTotemEle = {
									order = 9,
									type = "toggle",
									name = L["Voodoo Totem"],
									get = function()
										return Auras.db.char.aura[1].VoodooTotemEle;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].VoodooTotemEle = value
										Auras:UpdateTalents()
									end,
								},
								Windshear = {
									order = 10,
									type = "toggle",
									name = L["Wind Shear"],
									get = function() 
										return Auras.db.char.aura[1].WindShearEle;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].WindShearEle = value
										Auras:UpdateTalents()
									end,
								},
							},
						},
						ProgressBars = {
							name = L["Progress Bars"],
							type = "group",
							order = 4,
							guiInline = true,
							args = {
								MaelstromBarEle = {
									order = 1,
									type = "toggle",
									name = L["Maelstrom Bar"],
									get = function() 
										return Auras.db.char.aura[1].MaelstromBarEle;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].MaelstromBarEle = value
									end,
								},
								IcefuryBar = {
									order = 2,
									type = "toggle",
									name = L["Icefury Bar"],
									get = function() 
										return Auras.db.char.aura[1].IcefuryBar;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].IcefuryBar = value
									end,
								},
								BuffTimerBars = {
									name = L["Buff Duration Timers"],
									type = "group",
									order = 4,
									guiInline = true,
									args = {
										AncestralGuidance = {
											order = 1,
											type = "toggle",
											name = L["Ancestral Guidance"],
											get = function() 
												return Auras.db.char.aura[1].AncestralGuidanceBarEle;
											end,
											set = function(_, value)
												Auras.db.char.aura[1].AncestralGuidanceBarEle = value
											end,
										},
										Ascendance = {
											order = 2,
											type = "toggle",
											name = L["Ascendance"],
											get = function() 
												return Auras.db.char.aura[1].AscendanceBarEle;
											end,
											set = function(_, value)
												Auras.db.char.aura[1].AscendanceBarEle = value
											end,
										},
										AstralShift = {
											order = 3,
											type = "toggle",
											name = L["Astral Shift"],
											get = function() 
												return Auras.db.char.aura[1].AstralShiftBarEle;
											end,
											set = function(_, value)
												Auras.db.char.aura[1].AstralShiftBarEle = value
											end,
										},
										Bloodlust = {
											order = 4,
											type = "toggle",
											name = L["Bloodlust"],
											hidden = false,
											get = function() 
												return Auras.db.char.aura[1].BloodlustBarEle;
											end,
											set = function(_, value)
												Auras.db.char.aura[1].BloodlustBarEle = value
											end,
										},
										ElementalBlast = {
											order = 5,
											type = "toggle",
											name = L["Elemental Blast"],
											get = function() 
												return Auras.db.char.aura[1].ElementalBlastCritBar;
											end,
											set = function(_, value)
												Auras.db.char.aura[1].ElementalBlastCritBar = value;
												Auras.db.char.aura[1].ElementalBlastHasteBar = value;
												Auras.db.char.aura[1].ElementalBlastMasteryBar = value;
											end,
										},
										ElementalMastery = {
											order = 6,
											type = "toggle",
											name = L["Elemental Mastery"],
											get = function() 
												return Auras.db.char.aura[1].ElementalMasteryBar;
											end,
											set = function(_, value)
												Auras.db.char.aura[1].ElementalMasteryBar = value;
											end,
										},
										Heroism = {
											order = 7,
											type = "toggle",
											name = L["Heroism"],
											hidden = false,
											get = function() 
												return Auras.db.char.aura[1].HeroismBarEle;
											end,
											set = function(_, value)
												Auras.db.char.aura[1].HeroismBarEle = value
											end,
										},
										TimeWarp = {
											order = 8,
											type = "toggle",
											name = L["Time Warp"],
											get = function() 
												return Auras.db.char.aura[1].TimeWarpBarEle;
											end,
											set = function(_, value)
												Auras.db.char.aura[1].TimeWarpBarEle = value
											end,
										},
									},
								},
								ElementalTimerBars = {
									name = L["Elemental Duration Timers"],
									type = "group",
									order = 5,
									guiInline = true,
									args = {
										EarthElemental = {
											order = 1,
											type = "toggle",
											name = L["Earth Elemental"],
											get = function() 
												return Auras.db.char.aura[1].EarthElementalBar;
											end,
											set = function(_, value)
												Auras.db.char.aura[1].EarthElementalBar = value;
											end,
										},
										FireElemental = {
											order = 2,
											type = "toggle",
											name = L["Fire Elemental"],
											get = function() 
												return Auras.db.char.aura[1].FireElementalBar;
											end,
											set = function(_, value)
												Auras.db.char.aura[1].FireElementalBar = value;
											end,
										},
										StormElemental = {
											order = 3,
											type = "toggle",
											name = L["Storm Elemental"],
											get = function() 
												return Auras.db.char.aura[1].StormElementalBar;
											end,
											set = function(_, value)
												Auras.db.char.aura[1].StormElementalBar = value;
											end,
										},
									},
								},
								TotemTimerBars = {
									name = L["Totem Duration Timers"],
									type = "group",
									order = 6,
									guiInline = true,
									args = {
										EarthgrabTotem = {
											order = 1,
											type = "toggle",
											name = L["Earthgrab Totem"],
											get = function() 
												return Auras.db.char.aura[1].EarthgrabTotemBarEle;
											end,
											set = function(_, value)
												Auras.db.char.aura[1].EarthgrabTotemBarEle = value
											end,
										},
										VoodooTotem = {
											order = 2,
											type = "toggle",
											name = L["Voodoo Totem"],
											get = function() 
												return Auras.db.char.aura[1].VoodooTotemBarEle;
											end,
											set = function(_, value)
												Auras.db.char.aura[1].VoodooTotemBarEle = value
											end,
										},
										WindRushTotem = {
											order = 3,
											type = "toggle",
											name = L["Wind Rush Totem"],
											get = function() 
												return Auras.db.char.aura[1].WindRushTotemBarEle;
											end,
											set = function(_, value)
												Auras.db.char.aura[1].WindRushTotemBarEle = value
											end,
										},
										LiquidMagmaTotem = {
											order = 4,
											type = "toggle",
											name = L["Liquid Magma Totem"],
											get = function() 
												return Auras.db.char.aura[1].LiquidMagmaTotemBar;
											end,
											set = function(_, value)
												Auras.db.char.aura[1].LiquidMagmaTotemBar = value
											end,
										},
									},
								},
							},
						},
						TextureAlerts = {
							name = L["Texture Alerts"],
							type = "group",
							order = 5,
							guiInline = true,
							args = {
								TotemMastery = {
									order = 1,
									type = "toggle",
									name = L["Totem Mastery"],
									get = function() 
										return Auras.db.char.aura[1].TotemMastery;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].TotemMastery = value
									end,
								},
								Stormkeeper = {
									order = 2,
									type = "toggle",
									name = L["Stormkeeper Orbs"],
									get = function() 
										return Auras.db.char.aura[1].StormkeeperChargeGrp;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].StormkeeperChargeGrp = value
									end,
								},
							},
						},
					},
				},
				config = {
					name = L["Configuration"],
					order = 1,
					type = "group",
					disabled = true,
					args = {
						cooldown = {
							name = L["Cooldown Settings"],
							type = "group",
							order = 1,
							--disabled = true,
							guiInline = true,
							args = {
								text = {
									order = 1,
									name = L["Cooldown Values"],
									desc = L["Toggle the display of cooldown text/numbers."],
									type = "toggle",
									get = function()
										return Auras.db.char.config[1].cooldown.text;
									end,
									set = function(_, value)
										Auras.db.char.config[1].cooldown.text = value;
									end,
								},
								sweep = {
									order = 2,
									name = L["Cooldown Sweep Animation"],
									desc = L["Toggle the display of the cooldown animation sweep."],
									type = "toggle",
									get = function()
										return Auras.db.char.config[1].cooldown.sweep;
									end,
									set = function(_, value)
										Auras.db.char.config[1].cooldown.sweep = value;
										
										if (not value) then
											ele_options.args.config.args.cooldown.args.inverse.disabled = true;
										else
											ele_options.args.config.args.cooldown.args.inverse.disabled = false;
										end
									end,
								},
								inverse = {
									order = 3,
									name = L["Reverse Sweep Animation"],
									desc = L["Reverses the cooldown animation sweep."],
									type = "toggle",
									get = function()
										return Auras.db.char.config[1].cooldown.inverse;
									end,
									set = function(_, value)
										Auras.db.char.config[1].cooldown.inverse = value;
									end,
								},
							},
						},
						filler_0 = {
							order = 2,
							type = "description",
							name = ' ',
						},
						triggers = {
							name = L["Aura Triggers"],
							type = "group",
							order = 3,
							--disabled = true,
							guiInline = true,
							args = {
								OoCAlpha = {
									order = 1,
									type = "range",
									name = L["Alpha (OoC)"],
									desc = L["Determines how opaque or transparent the auras will appear when out of combat"],
									min = 0,
									max = 1,
									step = 0.1,
									bigStep = 0.1,
									--disabled = false,
									get = function() return Auras.db.char.triggers[1].OoCAlpha end,
									set = function(_, value)
										Auras.db.char.triggers[1].OoCAlpha = value
										CheckElementalDefaultValues(ele_options,'Triggers');
									end,
								},
								FlameShock = {
									order = 2,
									type = "range",
									name = L["Flame Shock"],
									desc = L["The amount of seconds remaining when the \"Glow\" animation will appear"],
									min = 5,
									max = 15,
									step = 1,
									bigStep = 1,
									get = function() return Auras.db.char.triggers[1].flameShock end,
									set = function(_, value)
										Auras.db.char.triggers[1].flameShock = value
										CheckElementalDefaultValues(ele_options,'Triggers');
									end,
								},
								TotemMastery = {
									order = 3,
									type = "range",
									name = L["Totem Mastery"],
									desc = L["The amount of seconds remaining when the Totem Mastery texture will appear"],
									min = 5,
									max = 30,
									step = 1,
									bigStep = 1,
									get = function() return Auras.db.char.triggers[1].totemMastery end,
									set = function(_, value)
										Auras.db.char.triggers[1].totemMastery = value
										CheckElementalDefaultValues(ele_options,'Triggers');
									end,
								},
								OoRColor = {
									type = "color",
									order = 4,
									name = L["Color (OoR)"],
									desc = L["Determines the color of harmful auras will appear when out of range"],
									hasAlpha = true,
									get = function(info)
										return Auras.db.char.triggers[1].OoRColor.r, Auras.db.char.triggers[1].OoRColor.g, Auras.db.char.triggers[1].OoRColor.b, Auras.db.char.triggers[1].OoRColor.a
									end,
									set = function(info, r, g, b, a)
										Auras.db.char.triggers[1].OoRColor.r = r
										Auras.db.char.triggers[1].OoRColor.g = g
										Auras.db.char.triggers[1].OoRColor.b = b
										Auras.db.char.triggers[1].OoRColor.a = a
										CheckElementalDefaultValues(ele_options,'Triggers');
									end,
								},
								fillerOne = {
									order = 5,
									type = "description",
									name = ' ',
								},
								reset = {
									order = 6,
									type = "execute",
									--name = "|cFFFFCC00"..L["Reset Trigger Values"].."|r",
									--disabled = false,
									name = L["Reset Trigger Values"],
									func = function()
										Auras.db.char.triggers[1].flameShock = Auras.db.char.triggers.default[1].flameShock
										Auras.db.char.triggers[1].totemMastery = Auras.db.char.triggers.default[1].totemMastery
										Auras.db.char.triggers[1].OoCAlpha = Auras.db.char.triggers.default.OoCAlpha
										Auras.db.char.triggers[1].OoRColor.r = Auras.db.char.triggers.default.OoRColor.r
										Auras.db.char.triggers[1].OoRColor.g = Auras.db.char.triggers.default.OoRColor.g
										Auras.db.char.triggers[1].OoRColor.b = Auras.db.char.triggers.default.OoRColor.b
										Auras.db.char.triggers[1].OoRColor.a = Auras.db.char.triggers.default.OoRColor.a
										ele_options.args.config.args.triggers.args.reset.disabled = true;
										ele_options.args.config.args.triggers.args.reset.name = "|cFF666666"..L["Reset Trigger Values"].."|r"
									end,
								},
							},
						},
						filler_1 = {
							order = 4,
							type = "description",
							name = ' ',
						},
						maelstromBar = {
							name = L["Maelstrom Settings"],
							type = "group",
							order = 5,
							--disabled = true,
							guiInline = true,
							args = {
								adjust = {
									order = 1,
									name = L["Modify Maelstrom Bar"],
									desc = L["Toggle the adjustment of the Maelstrom Bar size"],
									type = "toggle",
									get = function()
										return Auras.db.char.config[1].maelstromBar.isAdjustable;
									end,
									set = function(_, value)
										Auras.db.char.config[1].maelstromBar.isAdjustable = value;
										if (not value) then
											ele_options.args.config.args.maelstromBar.args.alphaCombat.disabled = true;
											
											ele_options.args.config.args.maelstromBar.args.alphaOoC.disabled = false;
											ele_options.args.config.args.maelstromBar.args.alphaTarget.disabled = false;
											ele_options.args.config.args.maelstromBar.args.width.disabled = true;
											ele_options.args.config.args.maelstromBar.args.height.disabled = true;
											ele_options.args.config.args.maelstromBar.args.textSize.disabled = true;
											--SSA.MaelstromBarTotemBar:Hide();
											--SSA.MaelstromBarTotemBar:SetValue(UnitPower('player',11));
										else
											ele_options.args.config.args.maelstromBar.args.alphaCombat.disabled = false;											
										
											ele_options.args.config.args.maelstromBar.args.alphaOoC.disabled = true;
											ele_options.args.config.args.maelstromBar.args.alphaTarget.disabled = true;
											ele_options.args.config.args.maelstromBar.args.width.disabled = false;
											ele_options.args.config.args.maelstromBar.args.height.disabled = false;
											ele_options.args.config.args.maelstromBar.args.textSize.disabled = false;
											--SSA.EarthenShieldTotemBar:Show();
											--SSA.EarthenShieldTotemBar:SetValue(UnitPowerMax('player',11));
										end
									end,
								},
								text = {
									order = 2,
									name = L["Maelstrom Value Text"],
									desc = L["Toggles the text display of the amount of maelstrom remaining"],
									type = "toggle",
									get = function()
										return Auras.db.char.config[1].maelstromBar.isDisplayText;
									end,
									set = function(_, value)
										Auras.db.char.config[1].maelstromBar.isDisplayText = value;
										CheckElementalDefaultValues(ele_options,'Maelstrom');
									end,
								},
								animation = {
									order = 3,
									type = "toggle",
									name = L["Maelstrom Lightning"],
									get = function() 
										return Auras.db.char.config[1].maelstromBar.animate;
									end,
									set = function(_, value)
										Auras.db.char.config[1].maelstromBar.animate = value;
										CheckElementalDefaultValues(ele_options,"Maelstrom");
									end,
								},
								alphaCombat = {
									order = 4,
									type = "range",
									name = L["Alpha (In Combat)"],
									desc = L["Determines how opaque or transparent the bar will appear while in combat"],
									min = 0,
									max = 1,
									step = 0.1,
									bigStep = 0.1,
									disabled = true,
									get = function() return Auras.db.char.config[1].maelstromBar.alphaCombat end,
									set = function(_, value)
										Auras.db.char.config[1].maelstromBar.alphaCombat = value
										CheckElementalDefaultValues(ele_options,'Maelstrom');
									end,
								},
								alphaOoC = {
									order = 5,
									type = "range",
									name = L["Alpha (OoC - No Target)"],
									desc = L["Determines how opaque or transparent the bar will appear when out of combat"],
									min = 0,
									max = 1,
									step = 0.1,
									bigStep = 0.1,
									--disabled = false,
									get = function() return Auras.db.char.config[1].maelstromBar.alphaOoC end,
									set = function(_, value)
										Auras.db.char.config[1].maelstromBar.alphaOoC = value
										CheckElementalDefaultValues(ele_options,'Maelstrom','Alpha');
									end,
								},
								alphaTarget = {
									order = 6,
									type = "range",
									name = L["Alpha (OoC - Target)"],
									desc = L["Determines how opaque or transparent the bar will appear when out of combat and targetting an enemy"],
									min = 0,
									max = 1,
									step = 0.1,
									bigStep = 0.1,
									disabled = false,
									get = function() return Auras.db.char.config[1].maelstromBar.alphaTar end,
									set = function(_, value)
										Auras.db.char.config[1].maelstromBar.alphaTar = value
										CheckElementalDefaultValues(ele_options,'Maelstrom');
									end,
								},
								width = {
									order = 7,
									type = "range",
									name = L["Bar Width"],
									desc = L["Changes the width of the Maelstrom Bar. (Default is 260)"],
									min = 100,
									max = 300,
									step = 1,
									bigStep = 1,
									disabled = true,
									get = function() return Auras.db.char.layout[1].maelstromBar.width end,
									set = function(_, value)
										Auras.db.char.layout[1].maelstromBar.width = value;
										CheckElementalDefaultValues(ele_options,"Maelstrom");
									end,
								},
								height = {
									order = 8,
									type = "range",
									name = L["Bar Height"],
									desc = L["Changes the height of the Maelstrom Bar. (Default is 21)"],
									min = 10,
									max = 30,
									step = 1,
									bigStep = 1,
									disabled = true,
									get = function() return Auras.db.char.layout[1].maelstromBar.height end,
									set = function(_, value)
										Auras.db.char.layout[1].maelstromBar.height = value;
										CheckElementalDefaultValues(ele_options,"Maelstrom");
									end,
								},
								textSize = {
									order = 9,
									type = "range",
									name = L["Text Size"],
									desc = L["Changes the size of the text. (Default is 12)"],
									min = 10,
									max = 30,
									step = 1,
									bigStep = 1,
									disabled = true,
									get = function() return Auras.db.char.layout[1].maelstromBar.textSize end,
									set = function(_, value)
										Auras.db.char.layout[1].maelstromBar.textSize = value;
										CheckElementalDefaultValues(ele_options,"Maelstrom");
									end,
								},
								justify = {
									order = 10,
									type = "select",
									name = L["Maelstrom Value Justify"],
									desc = L["Set the position of the text on the mana bar."],
									get = function()
										return Auras.db.char.config[1].maelstromBar.justify
									end,
									set = function(_, value)
										Auras.db.char.config[1].maelstromBar.justify = value;
										CheckElementalDefaultValues(ele_options,"Maelstrom");
										--Auras:UpdateTalents();
									end,
									values = {
										["Left"] = L["Left"],
										["Center"] = L["Center"],
										["Right"] = L["Right"],
									}
								},
								threshold = {
									order = 11,
									type = "range",
									name = L["Maelstrom Trigger"],
									desc = L["The amount of Maelstrom accumulated at which the \"Lightning\" animation will appear"],
									min = 50,
									max = 100,
									step = 5,
									bigStep = 5,
									disabled = false,
									get = function() return Auras.db.char.config[1].maelstromBar.threshold end,
									set = function(_, value)
										Auras.db.char.config[1].maelstromBar.threshold = value
										CheckElementalDefaultValues(ele_options,'Maelstrom');
									end,
								},
								filler = {
									order = 12,
									type = "description",
									name = ' ',
								},
								reset = {
									order = 12,
									type = "execute",
									--name = "|cFFFFCC00"..L["Reset Maelstrom Values"].."|r",
									name = L["Reset Maelstrom Bar"],
									--disabled = false,
									func = function()
										Auras.db.char.layout[1].maelstromBar.width = Auras.db.char.layout.default.LargeBar.width;
										Auras.db.char.layout[1].maelstromBar.height = Auras.db.char.layout.default.LargeBar.height
										Auras.db.char.layout[1].maelstromBar.textSize = Auras.db.char.layout.default.textSize
										
										Auras.db.char.config[1].maelstromBar.isDisplayText = Auras.db.char.config.default.isDisplayText
										Auras.db.char.config[1].maelstromBar.animate = Auras.db.char.config.default.animate
										Auras.db.char.config[1].maelstromBar.alphaCombat = Auras.db.char.config.default.alphaCombat
										Auras.db.char.config[1].maelstromBar.alphaOoC = Auras.db.char.config.default.alphaOoC
										Auras.db.char.config[1].maelstromBar.alphaTar = Auras.db.char.config.default.alphaTar
										Auras.db.char.config[1].maelstromBar.justify = Auras.db.char.config.default.justify
										Auras.db.char.config[1].maelstromBar.threshold = Auras.db.char.config.default[1].maelstromBar.threshold
										
										ele_options.args.config.args.maelstromBar.args.reset.disabled = true;
										ele_options.args.config.args.maelstromBar.args.reset.name = "|cFF666666"..L["Reset Maelstrom Bar"].."|r"
									end,
								},
							},
						},
						filler_2 = {
							order = 6,
							type = "description",
							name = ' ',
						},
						icefuryBar = {
							name = L["Icefury Bar Settings"],
							type = "group",
							order = 7,
							--disabled = true,
							guiInline = true,
							args = {
								adjust = {
									order = 1,
									name = L["Modify Icefury Bar"],
									desc = L["Toggle the adjustment of the Icefury Bar"],
									type = "toggle",
									get = function()
										return Auras.db.char.config[1].icefuryBar.isAdjustable;
									end,
									set = function(_, value)
										Auras.db.char.config[1].icefuryBar.isAdjustable = value;
										if (not value) then
											ele_options.args.config.args.icefuryBar.args.alphaCombat.disabled = true;
											
											ele_options.args.config.args.icefuryBar.args.alphaOoC.disabled = false;
											ele_options.args.config.args.icefuryBar.args.alphaTarget.disabled = false;
											ele_options.args.config.args.icefuryBar.args.width.disabled = true;
											ele_options.args.config.args.icefuryBar.args.height.disabled = true;
											ele_options.args.config.args.icefuryBar.args.textSize.disabled = true;
											--SSA.icefuryBarTotemBar:Hide();
											--SSA.icefuryBarTotemBar:SetValue(UnitPower('player',11));
										else
											ele_options.args.config.args.icefuryBar.args.alphaCombat.disabled = false;
											
											ele_options.args.config.args.icefuryBar.args.alphaOoC.disabled = true;
											ele_options.args.config.args.icefuryBar.args.alphaTarget.disabled = true;
											ele_options.args.config.args.icefuryBar.args.width.disabled = false;
											ele_options.args.config.args.icefuryBar.args.height.disabled = false;
											ele_options.args.config.args.icefuryBar.args.textSize.disabled = false;
											--SSA.EarthenShieldTotemBar:Show();
											--SSA.EarthenShieldTotemBar:SetValue(UnitPowerMax('player',11));
										end
									end,
								},
								timerText = {
									order = 2,
									name = L["Timer Value Text"],
									desc = L["Toggles the text display of the amount of time remaining"],
									type = "toggle",
									get = function()
										return Auras.db.char.config[1].icefuryBar.isDisplayTimerText;
									end,
									set = function(_, value)
										Auras.db.char.config[1].icefuryBar.isDisplayTimerText = value;
										CheckElementalDefaultValues(ele_options,'Icefury');
									end,
								},
								countText = {
									order = 3,
									name = L["Count Value Text"],
									desc = L["Toggles the text display of the amount of icefury stacks remaining"],
									type = "toggle",
									get = function()
										return Auras.db.char.config[1].icefuryBar.isDisplayCountText;
									end,
									set = function(_, value)
										Auras.db.char.config[1].icefuryBar.isDisplayCountText = value;
										CheckElementalDefaultValues(ele_options,'Icefury');
									end,
								},
								alphaCombat = {
									order = 4,
									type = "range",
									name = L["Alpha (In Combat)"],
									desc = L["Determines how opaque or transparent the bar will appear while in combat"],
									min = 0,
									max = 1,
									step = 0.1,
									bigStep = 0.1,
									disabled = true,
									get = function() return Auras.db.char.config[1].icefuryBar.alphaCombat end,
									set = function(_, value)
										Auras.db.char.config[1].icefuryBar.alphaCombat = value
										CheckElementalDefaultValues(ele_options,'Icefury');
									end,
								},
								alphaOoC = {
									order = 5,
									type = "range",
									name = L["Alpha (OoC)"],
									desc = L["Determines how opaque or transparent the bar will appear when out of combat"],
									min = 0,
									max = 1,
									step = 0.1,
									bigStep = 0.1,
									disabled = false,
									get = function() return Auras.db.char.config[1].icefuryBar.alphaOoC end,
									set = function(_, value)
										Auras.db.char.config[1].icefuryBar.alphaOoC = value
										CheckElementalDefaultValues(ele_options,'Icefury','Alpha');
									end,
								},
								alphaTarget = {
									order = 6,
									type = "range",
									name = L["Alpha (OoC - Target)"],
									desc = L["Determines how opaque or transparent the bar will appear when out of combat and targetting an enemy"],
									min = 0,
									max = 1,
									step = 0.1,
									bigStep = 0.1,
									disabled = false,
									get = function() return Auras.db.char.config[1].icefuryBar.alphaTar end,
									set = function(_, value)
										Auras.db.char.config[1].icefuryBar.alphaTar = value
										CheckElementalDefaultValues(ele_options,'Icefury');
									end,
								},
								width = {
									order = 7,
									type = "range",
									name = L["Bar Width"],
									desc = L["Changes the width of the Earthen Shield Bar. (Default is 260)"],
									min = 100,
									max = 300,
									step = 1,
									bigStep = 1,
									disabled = true,
									get = function() return Auras.db.char.layout[1].icefuryBar.width end,
									set = function(_, value)
										Auras.db.char.layout[1].icefuryBar.width = value;
										CheckElementalDefaultValues(ele_options,"Icefury");
									end,
								},
								height = {
									order = 8,
									type = "range",
									name = L["Bar Height"],
									desc = L["Changes the height of the Earthen Shield Bar. (Default is 21)"],
									min = 10,
									max = 30,
									step = 1,
									bigStep = 1,
									disabled = true,
									get = function() return Auras.db.char.layout[1].icefuryBar.height end,
									set = function(_, value)
										Auras.db.char.layout[1].icefuryBar.height = value;
										CheckElementalDefaultValues(ele_options,"Icefury");
									end,
								},
								textSize = {
									order = 9,
									type = "range",
									name = L["Text Size"],
									desc = L["Changes the size of the text. (Default is 12)"],
									min = 10,
									max = 30,
									step = 1,
									bigStep = 1,
									disabled = true,
									get = function() return Auras.db.char.layout[1].icefuryBar.textSize end,
									set = function(_, value)
										Auras.db.char.layout[1].icefuryBar.textSize = value;
										CheckElementalDefaultValues(ele_options,"Icefury");
									end,
								},
								reset = {
									order = 10,
									type = "execute",
									--name = "|cFFFFCC00"..L["Reset Earthen Shield Bar"].."|r",
									--disabled = false,
									name = L["Reset Icefury Bar"],
									func = function()
										Auras.db.char.layout[1].icefuryBar.width = Auras.db.char.layout.default.LargeBar.width;
										Auras.db.char.layout[1].icefuryBar.height = Auras.db.char.layout.default.LargeBar.height
										Auras.db.char.layout[1].icefuryBar.textSize = Auras.db.char.layout.default.textSize
										
										Auras.db.char.config[1].icefuryBar.isDisplayTimerText = Auras.db.char.config.default[1].icefuryBar.isDisplayTimerText
										Auras.db.char.config[1].icefuryBar.isDisplayCountText = Auras.db.char.config.default[1].icefuryBar.isDisplayCountText
										Auras.db.char.config[1].icefuryBar.alphaCombat = Auras.db.char.config.default.alphaCombat
										Auras.db.char.config[1].icefuryBar.alphaOoC = Auras.db.char.config.default.alphaOoC
										Auras.db.char.config[1].icefuryBar.alphaTar = Auras.db.char.config.default.alphaTar
										
										if (Auras.db.char.config[1].icefuryBar.isAdjustable) then
											ele_options.args.config.args.icefuryBar.args.alphaTarget.disabled = true;
										else
											ele_options.args.config.args.icefuryBar.args.alphaTarget.disabled = false;
										end
										
										ele_options.args.config.args.icefuryBar.args.reset.disabled = true;
										ele_options.args.config.args.icefuryBar.args.reset.name = "|cFF666666"..L["Reset Icefury Bar"].."|r"
									end,
								},
							},
						},
					},
				},
				layout = {
					name = L["Layout"],
					order = 1,
					type = "group",
					disabled = true,
					args = {
						MoveAuras = {
							order = 1,
							type = "execute",
							name = "|cFFFFCC00"..L["Move Elemental Auras"].."|r",
							--disabled = false,
							func = function()
								Auras.db.char.layout[1].isMoving = true;
								Auras:InitMoveAuraGroups(SSA.AuraObjectsEle,"Ele")
							end,
						},
						ResetAuras = {
							order = 2,
							type = "execute",
							name = "|cFFFFCC00"..L["Reset Elemental Auras"].."|r",
							--disabled = false,
							func = function()
								Auras:ResetAuraGroups(Auras.db.char.frames.defaultPos.eleGrp,Auras.db.char.frames.eleGrp)
							end,
						},
						filler_0 = {
							order = 3,
							type = "description",
							name = ' ',
						},
						primaryDesc = {
							order = 4,
							type = "description",
							name = L["Primary Auras"],
						},
						PrimaryOrientation1 = {
							order = 5,
							type = "select",
							name = L["Primary Orientation 1"],
							desc = L["Set the aura orientation to horizontal or vertical."],
							get = function()
								return Auras.db.char.layout[1].orientation.top
							end,
							set = function(_, value)
								Auras.db.char.layout[1].orientation.top = value;
								CheckElementalDefaultValues(ele_options,"Primary");
								Auras:UpdateTalents();
							end,
							values = {
								["Horizontal"] = L["Horizontal"],
								["Vertical"] = L["Vertical"],
							},
						},
						PrimaryOrientation2 = {
							order = 6,
							type = "select",
							name = L["Primary Orientation 2"],
							desc = L["Set the aura orientation to horizontal or vertical."],
							get = function()
								return Auras.db.char.layout[1].orientation.bottom
							end,
							set = function(_, value)
								Auras.db.char.layout[1].orientation.bottom = value;
								CheckElementalDefaultValues(ele_options,"Primary");
								Auras:UpdateTalents();
							end,
							values = {
								["Horizontal"] = L["Horizontal"],
								["Vertical"] = L["Vertical"],
							},
						},
						filler_1 = {
							order = 7,
							type = "description",
							name = ' ',
						},
						--[[filler_a = {
							order = 3,
							type = "description",
							name = ' ',
						},]]
						AuraSizeRow1 = {
							order = 8,
							type = "range",
							name = L["Primary Size 1"],
							desc = L["Determines the size of primary auras in row 1. (Default is 32)"],
							min = 16,
							max = 256,
							step = 1,
							bigStep = 1,
							--disabled = false,
							get = function() return Auras.db.char.layout[1].primary.top.icon end,
							set = function(_, value)
								Auras.db.char.layout[1].primary.top.icon = value;
								CheckElementalDefaultValues(ele_options,"Primary");
								Auras:UpdateTalents();
							end,
						},
						AuraSpacingRow1 = {
							order = 9,
							type = "range",
							name = L["Primary Spacing 1"],
							desc = L["Determines the spacing of the primary auras in row 1. (Default is 50)"],
							min = 32,
							max = 300,
							step = 1,
							bigStep = 1,
							get = function() return Auras.db.char.layout[1].primary.top.spacing end,
							set = function(_, value)
								Auras.db.char.layout[1].primary.top.spacing = value;
								CheckElementalDefaultValues(ele_options,"Primary");
								Auras:UpdateTalents();
							end,
						},
						AuraChargesRow1 = {
							order = 10,
							type = "range",
							name = L["Primary Charges 1"],
							desc = L["Determines the size of the primary charge text in row 1. (Default is 13.5)"],
							min = 10,
							max = 60,
							step = 0.5,
							bigStep = 0.5,
							get = function() return Auras.db.char.layout[1].primary.top.charges end,
							set = function(_, value)
								Auras.db.char.layout[1].primary.top.charges = value;
								CheckElementalDefaultValues(ele_options,"Primary");
								Auras:UpdateTalents();
							end,
						},
						filler_2 = {
							order = 11,
							type = "description",
							name = ' ',
						},
						AuraSizeRow2 = {
							order = 12,
							type = "range",
							name = L["Primary Size 2"],
							desc = L["Determines the size of primary auras in row 2. (Default is 32)"],
							min = 16,
							max = 256,
							step = 1,
							bigStep = 1,
							--disabled = false,
							get = function() return Auras.db.char.layout[1].primary.bottom.icon end,
							set = function(_, value)
								Auras.db.char.layout[1].primary.bottom.icon = value;
								CheckElementalDefaultValues(ele_options,"Primary");
								Auras:UpdateTalents();
							end,
						},
						AuraSpacingRow2 = {
							order = 13,
							type = "range",
							name = L["Primary Spacing 2"],
							desc = L["Determines the spacing of the primary auras in row 2. (Default is 50)"],
							min = 32,
							max = 300,
							step = 1,
							bigStep = 1,
							--disabled = false,
							get = function() return Auras.db.char.layout[1].primary.bottom.spacing end,
							set = function(_, value)
								Auras.db.char.layout[1].primary.bottom.spacing = value;
								CheckElementalDefaultValues(ele_options,"Primary");
								Auras:UpdateTalents();
							end,
						},
						--[[AuraChargesRow2 = {
							order = 8,
							type = "range",
							name = L["Primary Charges 2"],
							desc = L["Determines the size of the primary charge text in row 1. (Default is 13.5)"],
							min = 10,
							max = 20,
							step = 0.5,
							bigStep = 0.5,
							get = function() return Auras.db.char.layout[1].primary.bottom.charges end,
							set = function(_, value)
								Auras.db.char.layout[1].primary.bottom.charges = value
								Auras:UpdateTalents();
							end,
						},
						filler_2 = {
							order = 9,
							type = "description",
							name = ' ',
						},]]
						ResetPrimaryLayout = {
							order = 14,
							type = "execute",
							--name = "|cFFFFCC00"..L["Reset Primary Layout"].."|r",
							--disabled = false,
							name = L["Reset Primary Layout"],
							func = function()
								Auras.db.char.layout[1].orientation.top = Auras.db.char.layout.default.orientation.top
								Auras.db.char.layout[1].orientation.bottom = Auras.db.char.layout.default.orientation.bottom
								Auras.db.char.layout[1].primary.top.icon = Auras.db.char.layout.default.primary.top.icon
								Auras.db.char.layout[1].primary.top.spacing = Auras.db.char.layout.default.primary.top.spacing
								Auras.db.char.layout[1].primary.top.charges = Auras.db.char.layout.default.primary.top.charges
								Auras.db.char.layout[1].primary.bottom.icon = Auras.db.char.layout.default.primary.bottom.icon
								Auras.db.char.layout[1].primary.bottom.spacing = Auras.db.char.layout.default.primary.bottom.spacing
								--Auras.db.char.layout[1].primary.bottom.charges = Auras.db.char.layout.default.primary.bottom.charges
								ele_options.args.layout.args.ResetPrimaryLayout.disabled = true;
								ele_options.args.layout.args.ResetPrimaryLayout.name = "|cFF666666"..L["Reset Primary Layout"].."|r"
								Auras:UpdateTalents();
							end,
						},
						filler_3 = {
							order = 15,
							type = "description",
							name = ' ',
						},
						filler_4 = {
							order = 16,
							type = "description",
							name = ' ',
						},
						secondaryDesc = {
							order = 17,
							type = "description",
							name = L["Secondary Auras"],
						},
						SecondaryOrientation1 = {
							order = 18,
							type = "select",
							name = L["Secondary Orientation 1"],
							desc = L["Set the aura orientation to horizontal or vertical."],
							get = function()
								return Auras.db.char.layout[1].orientation.left
							end,
							set = function(_, value)
								Auras.db.char.layout[1].orientation.left = value;
								CheckElementalDefaultValues(ele_options,"Secondary");
								Auras:UpdateTalents();
							end,
							values = {
								["Horizontal"] = L["Horizontal"],
								["Vertical"] = L["Vertical"],
							},
						},
						SecondaryOrientation2 = {
							order = 19,
							type = "select",
							name = L["Secondary Orientation 2"],
							desc = L["Set the aura orientation to horizontal or vertical."],
							get = function()
								return Auras.db.char.layout[1].orientation.right
							end,
							set = function(_, value)
								Auras.db.char.layout[1].orientation.right = value;
								CheckElementalDefaultValues(ele_options,"Secondary");
								Auras:UpdateTalents();
							end,
							values = {
								["Horizontal"] = L["Horizontal"],
								["Vertical"] = L["Vertical"],
							},
						},
						filler_5 = {
							order = 20,
							type = "description",
							name = ' ',
						},
						AuraSizeCol1 = {
							order = 21,
							type = "range",
							name = L["Secondary Size 1"],
							desc = L["Determines the size of secondary auras in column 1. (Default is 25)"],
							min = 16,
							max = 256,
							step = 1,
							bigStep = 1,
							--disabled = false,
							get = function() return Auras.db.char.layout[1].secondary.left.icon end,
							set = function(_, value)
								Auras.db.char.layout[1].secondary.left.icon = value;
								CheckElementalDefaultValues(ele_options,"Secondary");
								Auras:UpdateTalents();
							end,
						},
						AuraSpacingCol1 = {
							order = 22,
							type = "range",
							name = L["Secondary Spacing 1"],
							desc = L["Determines the spacing of the secondary auras in column 1. (Default is 30)"],
							min = 32,
							max = 300,
							step = 1,
							bigStep = 1,
							--disabled = false,
							get = function() return Auras.db.char.layout[1].secondary.left.spacing end,
							set = function(_, value)
								Auras.db.char.layout[1].secondary.left.spacing = value;
								CheckElementalDefaultValues(ele_options,"Secondary");
								Auras:UpdateTalents();
							end,
						},
						--[[AuraChargesCol1 = {
							order = 16,
							type = "range",
							name = L["Secondary Charges 1"],
							desc = L["Determines the size of the secondary charge text in column 1. (Default is 13.5)"],
							min = 10,
							max = 20,
							step = 0.5,
							bigStep = 0.5,
							get = function() return Auras.db.char.layout[1].secondary.left.charges end,
							set = function(_, value)
								Auras.db.char.layout[1].secondary.left.charges = value
								Auras:UpdateTalents();
							end,
						},
						filler_5 = {
							order = 17,
							type = "description",
							name = ' ',
						},]]
						AuraSizeCol2 = {
							order = 23,
							type = "range",
							name = L["Secondary Size 2"],
							desc = L["Determines the size of secondary auras in column 2. (Default is 25)"],
							min = 16,
							max = 256,
							step = 1,
							bigStep = 1,
							--disabled = false,
							get = function() return Auras.db.char.layout[1].secondary.right.icon end,
							set = function(_, value)
								Auras.db.char.layout[1].secondary.right.icon = value;
								CheckElementalDefaultValues(ele_options,"Secondary");
								Auras:UpdateTalents();
							end,
						},
						AuraSpacingCol2 = {
							order = 24,
							type = "range",
							name = L["Secondary Spacing 2"],
							desc = L["Determines the spacing of the secondary auras in column 2. (Default is 30)"],
							min = 32,
							max = 300,
							step = 1,
							bigStep = 1,
							--disabled = false,
							get = function() return Auras.db.char.layout[1].secondary.right.spacing end,
							set = function(_, value)
								Auras.db.char.layout[1].secondary.right.spacing = value;
								CheckElementalDefaultValues(ele_options,"Secondary");
								Auras:UpdateTalents();
							end,
						},
						--[[AuraChargesCol2 = {
							order = 20,
							type = "range",
							name = L["Secondary Charges 2"],
							desc = L["Determines the size of the secondary charge text in column 2. (Default is 13.5)"],
							min = 10,
							max = 20,
							step = 0.5,
							bigStep = 0.5,
							get = function() return Auras.db.char.layout[1].secondary.right.charges end,
							set = function(_, value)
								Auras.db.char.layout[1].secondary.right.charges = value
								Auras:UpdateTalents();
							end,
						},
						filler_6 = {
							order = 21,
							type = "description",
							name = ' ',
						},]]
						ResetSecondaryLayout = {
							order = 25,
							type = "execute",
							--name = "|cFFFFCC00"..L["Reset Secondary Layout"].."|r",
							--disabled = false,
							name = L["Reset Secondary Layout"],
							func = function()
								Auras.db.char.layout[1].orientation.left = Auras.db.char.layout.default.orientation.left
								Auras.db.char.layout[1].orientation.right = Auras.db.char.layout.default.orientation.right
								Auras.db.char.layout[1].secondary.left.icon = Auras.db.char.layout.default.secondary.left.icon
								Auras.db.char.layout[1].secondary.left.spacing = Auras.db.char.layout.default.secondary.left.spacing
								--Auras.db.char.layout[1].secondary.left.charges = Auras.db.char.layout.default.secondary.left.charges
								Auras.db.char.layout[1].secondary.right.icon = Auras.db.char.layout.default.secondary.right.icon
								Auras.db.char.layout[1].secondary.right.spacing = Auras.db.char.layout.default.secondary.right.spacing
								--Auras.db.char.layout[1].secondary.right.charges = Auras.db.char.layout.default.secondary.right.charges
								ele_options.args.layout.args.ResetSecondaryLayout.disabled = true;
								ele_options.args.layout.args.ResetSecondaryLayout.name = "|cFF666666"..L["Reset Primary Layout"].."|r"
								Auras:UpdateTalents();
							end,
						},
					},
				},
			}
		}
	end
	return ele_options;
end

local enh_options

local function GetEnhancementOptions()
	if not enh_options then

		enh_options = {
			type = "group",
			childGroups = "tab",
			order = 1,
			name = L["Enhancement Auras"],
			desc = L["Auras used by the Enhancement specialization"],
			args = {
				display = {
					name = L["Display"],
					type = "group",
					order = 0,
					args = {
						show = {
							order = 1,
							name = L["Show Enhancement Auras"],
							desc = L["Toggle the display of Elemental Auras"],
							type = "toggle",
							get = function()
								return Auras.db.char.frames.enhGrp.enabled;
							end,
							set = function(_, value)
								Auras.db.char.frames.enhGrp.enabled = value;
								if (not value) then
									AuraGroupEnh:Hide();
								else
									AuraGroupEnh:Show();
								end
							end,
						},
						MajorAuras = {
							name = L["Major Auras"],
							type = "group",
							order = 2,
							guiInline = true,
							args = {
								AscendanceEle = {
									order = 1,
									type = "toggle",
									name = L["Ascendance"],
									get = function() 
										return Auras.db.char.aura[2].AscendanceEnh;
									end,
									set = function(_, value)
										Auras.db.char.aura[2].AscendanceEnh = value
										--Auras:ToggleAuraVisibility(1);
										Auras:UpdateTalents()
									end,
								},
								Boulderfist = {
									order = 2,
									type = "toggle",
									name = L["Boulderfist"],
									get = function()
										return Auras.db.char.aura[2].Boulderfist;
									end,
									set = function(_, value)
										Auras.db.char.aura[2].Boulderfist = value
										Auras:UpdateTalents()
									end,
								},
								CrashLightning = {
									order = 3,
									type = "toggle",
									name = L["Crash Lightning"],
									get = function()
										return Auras.db.char.aura[2].CrashLightning;
									end,
									set = function(_, value)
										Auras.db.char.aura[2].CrashLightning = value
										Auras:UpdateTalents()
									end,
								},
								DoomWinds = {
									order = 4,
									type = "toggle",
									name = L["Doom Winds"],
									get = function()
										return Auras.db.char.aura[2].DoomWinds;
									end,
									set = function(_, value)
										Auras.db.char.aura[2].DoomWinds = value
										Auras:UpdateTalents()
									end,
								},
								EarthenSpike = {
									order = 5,
									type = "toggle",
									name = L["Earthen Spike"],
									get = function()
										return Auras.db.char.aura[2].EarthenSpike;
									end,
									set = function(_, value)
										Auras.db.char.aura[2].EarthenSpike = value
										Auras:UpdateTalents()
									end,
								},
								FeralLunge = {
									order = 6,
									type = "toggle",
									name = L["Feral Lunge"],
									get = function()
										return Auras.db.char.aura[2].FeralLunge;
									end,
									set = function(_, value)
										Auras.db.char.aura[2].FeralLunge = value
										Auras:UpdateTalents()
									end,
								},
								FeralSpirit = {
									order = 7,
									type = "toggle",
									name = L["Feral Spirit"],
									get = function()
										return Auras.db.char.aura[2].FeralSpirit;
									end,
									set = function(_, value)
										Auras.db.char.aura[2].FeralSpirit = value
										Auras:UpdateTalents()
									end,
								},
								Flametongue = {
									order = 8,
									type = "toggle",
									name = L["Flametongue"],
									get = function()
										return Auras.db.char.aura[2].Flametongue;
									end,
									set = function(_, value)
										Auras.db.char.aura[2].Flametongue = value
										Auras:UpdateTalents()
									end,
								},
								Frostbrand = {
									order = 9,
									type = "toggle",
									name = L["Frostbrand"],
									get = function()
										return Auras.db.char.aura[2].Frostbrand;
									end,
									set = function(_, value)
										Auras.db.char.aura[2].Frostbrand = value
										Auras:UpdateTalents()
									end,
								},
								LavaLash = {
									order = 10,
									type = "toggle",
									name = L["Lava Lash"],
									get = function()
										return Auras.db.char.aura[2].LavaLash;
									end,
									set = function(_, value)
										Auras.db.char.aura[2].LavaLash = value
										Auras:UpdateTalents()
									end,
								},
								Stormstrike = {
									order = 11,
									type = "toggle",
									name = L["Stormstrike"],
									get = function()
										return Auras.db.char.aura[2].Stormstrike;
									end,
									set = function(_, value)
										Auras.db.char.aura[2].Stormstrike = value
										Auras:UpdateTalents()
									end,
								},
								Sundering = {
									order = 12,
									type = "toggle",
									name = L["Sundering"],
									get = function()
										return Auras.db.char.aura[2].Sundering;
									end,
									set = function(_, value)
										Auras.db.char.aura[2].Sundering = value
										Auras:UpdateTalents()
									end,
								},
								Windsong = {
									order = 13,
									type = "toggle",
									name = L["Windsong"],
									get = function()
										return Auras.db.char.aura[2].Windsong;
									end,
									set = function(_, value)
										Auras.db.char.aura[2].Windsong = value
										Auras:UpdateTalents()
									end,
								},
							},
						},
						MinorAuras = {
							name = L["Minor Auras"],
							type = "group",
							order = 3,
							guiInline = true,
							args = {
								AstralShiftEnh = {
									order = 1,
									type = "toggle",
									name = L["Astral Shift"],
									get = function()
										return Auras.db.char.aura[2].AstralShiftEnh;
									end,
									set = function(_, value)
										Auras.db.char.aura[2].AstralShiftEnh = value
										Auras:UpdateTalents()
									end,
								},
								CleanseSpirit = {
									order = 2,
									type = "toggle",
									name = L["Cleanse Spirit"],
									get = function()
										return Auras.db.char.aura[2].CleanseSpiritEnh;
									end,
									set = function(_, value)
										Auras.db.char.aura[2].CleanseSpiritEnh = value
										Auras:UpdateTalents()
									end,
								},
								EarthgrabTotemEnh = {
									order = 3,
									type = "toggle",
									name = L["Earthgrab Totem"],
									get = function()
										return Auras.db.char.aura[2].EarthgrabTotemEnh;
									end,
									set = function(_, value)
										Auras.db.char.aura[2].EarthgrabTotemEnh = value
										Auras:UpdateTalents()
									end,
								},
								Hex = {
									order = 4,
									type = "toggle",
									name = L["Hex"],
									get = function()
										return Auras.db.char.aura[2].HexEnh;
									end,
									set = function(_, value)
										Auras.db.char.aura[2].HexEnh = value
										Auras:UpdateTalents()
									end,
								},
								LightningSurgeTotemEnh = {
									order = 5,
									type = "toggle",
									name = L["Lightning Surge Totem"],
									get = function()
										return Auras.db.char.aura[2].LightningSurgeTotemEnh;
									end,
									set = function(_, value)
										Auras.db.char.aura[2].LightningSurgeTotemEnh = value
										Auras:UpdateTalents()
									end,
								},
								Rainfall = {
									order = 6,
									type = "toggle",
									name = L["Rainfall"],
									get = function()
										return Auras.db.char.aura[2].Rainfall;
									end,
									set = function(_, value)
										Auras.db.char.aura[2].Rainfall = value
										Auras:UpdateTalents()
									end,
								},
								SpiritWalk = {
									order = 7,
									type = "toggle",
									name = L["Spirit Walk"],
									get = function()
										return Auras.db.char.aura[2].SpiritWalk;
									end,
									set = function(_, value)
										Auras.db.char.aura[2].SpiritWalk = value
										Auras:UpdateTalents()
									end,
								},
								VoodooTotemEnh = {
									order = 8,
									type = "toggle",
									name = L["Voodoo Totem"],
									get = function()
										return Auras.db.char.aura[2].VoodooTotemEnh;
									end,
									set = function(_, value)
										Auras.db.char.aura[2].VoodooTotemEnh = value
										Auras:UpdateTalents()
									end,
								},
								WindShearEnh = {
									order = 9,
									type = "toggle",
									name = L["Wind Shear"],
									get = function()
										return Auras.db.char.aura[2].WindShearEnh;
									end,
									set = function(_, value)
										Auras.db.char.aura[2].WindShearEnh = value
										Auras:UpdateTalents()
									end,
								},
							},
						},
						ProgressBars = {
							name = L["Progress Bars"],
							type = "group",
							order = 4,
							guiInline = true,
							args = {
								MaelstromBarEnh = {
									order = 1,
									type = "toggle",
									name = L["Maelstrom Bar"],
									get = function() 
										return Auras.db.char.aura[2].MaelstromBarEnh;
									end,
									set = function(_, value)
										Auras.db.char.aura[2].MaelstromBarEnh = value
									end,
								},
								
								--[[ShowBuffTimersEnh = {
									order = 1,
									type = "toggle",
									name = L["Show Buff Timers"],
									get = function() 
										return Auras.db.char.frames.timerbars.buff[2];
									end,
									set = function(_, value)
										Auras.db.char.frames.timerbars.buff[2] = value
									end,
								},
								ShowAbilityTimersEnh = {
									order = 2,
									type = "toggle",
									name = L["Show Ability Timers"],
									get = function() 
										return Auras.db.char.frames.timerbars.main[2];
									end,
									set = function(_, value)
										Auras.db.char.frames.timerbars.main[2] = value
									end,
								},
								ShowUtilityTimersEnh = {
									order = 3,
									type = "toggle",
									name = L["Show Utility Timers"],
									get = function() 
										return Auras.db.char.frames.timerbars.util[2];
									end,
									set = function(_, value)
										Auras.db.char.frames.timerbars.util[2] = value
									end,
								},]]
								BuffTimerBars = {
									name = L["Buff Duration Timers"],
									type = "group",
									order = 2,
									guiInline = true,
									args = {
										AscendanceBarEnh = {
											order = 1,
											type = "toggle",
											name = L["Ascendance"],
											get = function() 
												return Auras.db.char.aura[2].AscendanceBarEnh;
											end,
											set = function(_, value)
												Auras.db.char.aura[2].AscendanceBarEnh = value
											end,
										},
										AstralShiftBarEnh = {
											order = 2,
											type = "toggle",
											name = L["Astral Shift"],
											get = function() 
												return Auras.db.char.aura[2].AstralShiftBarEnh;
											end,
											set = function(_, value)
												Auras.db.char.aura[2].AstralShiftBarEnh = value
											end,
										},
										Bloodlust = {
											order = 3,
											type = "toggle",
											name = L["Bloodlust"],
											hidden = false,
											get = function() 
												return Auras.db.char.aura[2].BloodlustBarEnh;
											end,
											set = function(_, value)
												Auras.db.char.aura[2].BloodlustBarEnh = value
											end,
										},
										Heroism = {
											order = 4,
											type = "toggle",
											name = L["Heroism"],
											hidden = false,
											get = function() 
												return Auras.db.char.aura[2].HeroismBarEnh;
											end,
											set = function(_, value)
												Auras.db.char.aura[2].HeroismBarEnh = value
											end,
										},
										HexBarEnh = {
											order = 5,
											type = "toggle",
											name = L["Hex"],
											get = function() 
												return Auras.db.char.aura[2].HexBarEnh;
											end,
											set = function(_, value)
												Auras.db.char.aura[2].HexBarEnh = value
											end,
										},
										SpiritWalkBar = {
											order = 6,
											type = "toggle",
											name = L["Spirit Walk"],
											get = function() 
												return Auras.db.char.aura[2].SpiritWalkBar;
											end,
											set = function(_, value)
												Auras.db.char.aura[2].SpiritWalkBar = value
											end,
										},
										TimeWarp = {
											order = 7,
											type = "toggle",
											name = L["Time Warp"],
											get = function() 
												return Auras.db.char.aura[2].TimeWarpBarEnh;
											end,
											set = function(_, value)
												Auras.db.char.aura[2].TimeWarpBarEnh = value
											end,
										},
									},
								},
								MainTimerBars = {
									name = L["Ability Duration Timers"],
									type = "group",
									order = 3,
									guiInline = true,
									--disabled = function() return (generalSettings.theme == "Graphical") end,
									args = {
										BoulderfistBar = {
											order = 1,
											type = "toggle",
											name = L["Boulderfist"],
											get = function() 
												return Auras.db.char.aura[2].BoulderfistBar;
											end,
											set = function(_, value)
												Auras.db.char.aura[2].BoulderfistBar = value
											end,
										},
										CrashLightningBar = {
											order = 2,
											type = "toggle",
											name = L["Crash Lightning"],
											get = function() 
												return Auras.db.char.aura[2].CrashLightningBar;
											end,
											set = function(_, value)
												Auras.db.char.aura[2].CrashLightningBar = value
											end,
										},
										EarthenSpikeBar = {
											order = 3,
											type = "toggle",
											name = L["Earthen Spike"],
											get = function() 
												return Auras.db.char.aura[2].EarthenSpikeBar;
											end,
											set = function(_, value)
												Auras.db.char.aura[2].EarthenSpikeBar = value
											end,
										},
										FlametongueBar = {
											order = 4,
											type = "toggle",
											name = L["Flametongue"],
											get = function() 
												return Auras.db.char.aura[2].FlametongueBar;
											end,
											set = function(_, value)
												Auras.db.char.aura[2].FlametongueBar = value
											end,
										},
										FrostbrandBar = {
											order = 5,
											type = "toggle",
											name = L["Frostbrand"],
											get = function() 
												return Auras.db.char.aura[2].FrostbrandBar;
											end,
											set = function(_, value)
												Auras.db.char.aura[2].FrostbrandBar = value
											end,
										},
										WindsongBar = {
											order = 6,
											type = "toggle",
											name = L["Windsong"],
											get = function() 
												return Auras.db.char.aura[2].WindsongBar;
											end,
											set = function(_, value)
												Auras.db.char.aura[2].WindsongBar = value
											end,
										},
									},
								},
								TotemTimerBars = {
									name = L["Totem Duration Timers"],
									type = "group",
									order = 4,
									guiInline = true,
									args = {
										EarthgrabTotemBarEnh = {
											order = 1,
											type = "toggle",
											name = L["Earthgrab Totem"],
											get = function() 
												return Auras.db.char.aura[2].EarthgrabTotemBarEnh;
											end,
											set = function(_, value)
												Auras.db.char.aura[2].EarthgrabTotemBarEnh = value
											end,
										},
										VoodooTotemBarEnh = {
											order = 2,
											type = "toggle",
											name = L["Voodoo Totem"],
											get = function() 
												return Auras.db.char.aura[2].VoodooTotemBarEnh;
											end,
											set = function(_, value)
												Auras.db.char.aura[2].VoodooTotemBarEnh = value
											end,
										},
										WindRushTotemBarEnh = {
											order = 3,
											type = "toggle",
											name = L["Wind Rush Totem"],
											get = function() 
												return Auras.db.char.aura[2].WindRushTotemBarEnh;
											end,
											set = function(_, value)
												Auras.db.char.aura[2].WindRushTotemBarEnh = value
											end,
										},
									},
								},
							},
						},
						TextureAlerts = {
							name = L["Texture Alerts"],
							type = "group",
							order = 5,
							guiInline = true,
							args = {
								DoomWinds = {
									order = 1,
									type = "toggle",
									name = L["Doom Winds"],
									get = function() 
										return Auras.db.char.aura[2].DoomWindsTexture;
									end,
									set = function(_, value)
										Auras.db.char.aura[2].DoomWindsTexture = value
									end,
								},
								StormstrikeOrbs = {
									order = 2,
									type = "toggle",
									name = L["Stormstrike Lightning Orbs"],
									get = function() 
										return Auras.db.char.aura[2].StormstrikeChargeGrp;
									end,
									set = function(_, value)
										Auras.db.char.aura[2].StormstrikeChargeGrp = value
									end,
								},
							},
						},
					},
				},
				config = {
					name = L["Configuration"],
					order = 1,
					type = "group",
					disabled = true,
					args = {
						cooldown = {
							name = L["Cooldown Settings"],
							type = "group",
							order = 1,
							--disabled = true,
							guiInline = true,
							args = {
								text = {
									order = 1,
									name = L["Cooldown Values"],
									desc = L["Toggle the display of cooldown text/numbers."],
									type = "toggle",
									get = function()
										return Auras.db.char.config[2].cooldown.text;
									end,
									set = function(_, value)
										Auras.db.char.config[2].cooldown.text = value;
									end,
								},
								sweep = {
									order = 2,
									name = L["Cooldown Sweep Animation"],
									desc = L["Toggle the display of the cooldown animation sweep."],
									type = "toggle",
									get = function()
										return Auras.db.char.config[2].cooldown.sweep;
									end,
									set = function(_, value)
										Auras.db.char.config[2].cooldown.sweep = value;
										
										if (not value) then
											enh_options.args.config.args.cooldown.args.inverse.disabled = true;
										else
											enh_options.args.config.args.cooldown.args.inverse.disabled = false;
										end
									end,
								},
								inverse = {
									order = 3,
									name = L["Reverse Sweep Animation"],
									desc = L["Reverses the cooldown animation sweep."],
									type = "toggle",
									get = function()
										return Auras.db.char.config[2].cooldown.inverse;
									end,
									set = function(_, value)
										Auras.db.char.config[2].cooldown.inverse = value;
									end,
								},
							},
						},
						filler_0 = {
							order = 2,
							type = "description",
							name = ' ',
						},
						triggers = {
							name = L["Aura Triggers"],
							type = "group",
							order = 3,
							guiInline = true,
							args = {
								OoCAlpha = {
									order = 1,
									type = "range",
									name = L["Alpha (OoC)"],
									desc = L["Determines how opaque or transparent the auras will appear when out of combat"],
									min = 0,
									max = 1,
									step = 0.1,
									bigStep = 0.1,
									get = function() return Auras.db.char.triggers[2].OoCAlpha end,
									set = function(_, value)
										Auras.db.char.triggers[2].OoCAlpha = value;
										CheckEnhancementDefaultValues(enh_options,"Triggers");
									end,
								},
								Flametongue = {
									order = 2,
									type = "range",
									name = L["Flametongue"],
									desc = L["The amount of seconds remaining when the \"Glow\" animation will appear"],
									min = 5,
									max = 10,
									step = 1,
									bigStep = 1,
									get = function() return Auras.db.char.triggers[2].flametongue end,
									set = function(_, value)
										Auras.db.char.triggers[2].flametongue = value;
										CheckEnhancementDefaultValues(enh_options,"Triggers");
									end,
								},
								Frostbrand = {
									order = 3,
									type = "range",
									name = L["Frostbrand"],
									desc = L["The amount of seconds remaining when the \"Glow\" animation will appear"],
									min = 5,
									max = 10,
									step = 1,
									bigStep = 1,
									get = function() return Auras.db.char.triggers[2].frostbrand end,
									set = function(_, value)
										Auras.db.char.triggers[2].frostbrand = value;
										CheckEnhancementDefaultValues(enh_options,"Triggers");
									end,
								},
								Boulderfist = {
									order = 4,
									type = "range",
									name = L["Boulderfist"],
									desc = L["The amount of seconds remaining when the \"Glow\" animation will appear"],
									min = 5,
									max = 10,
									step = 1,
									bigStep = 1,
									get = function() return Auras.db.char.triggers[2].boulderfist end,
									set = function(_, value)
										Auras.db.char.triggers[2].boulderfist = value;
										CheckEnhancementDefaultValues(enh_options,"Triggers");
										--[[if (value ~= Auras.db.char.triggers.default.enh.boulderfist) then
											enh_options.args.layout.args.triggers.args.ResetTriggers.disabled = false;
										else
											enh_options.args.layout.args.triggers.args.ResetTriggers.disabled = true;
										end]]
									end,
								},
								OoRColor = {
									type = "color",
									order = 5,
									name = L["Color (OoR)"],
									desc = L["Determines the color of harmful auras will appear when out of range"],
									hasAlpha = true,
									get = function(info)
										return Auras.db.char.triggers[2].OoRColor.r, Auras.db.char.triggers[2].OoRColor.g, Auras.db.char.triggers[2].OoRColor.b, Auras.db.char.triggers[2].OoRColor.a
									end,
									set = function(info, r, g, b, a)
										Auras.db.char.triggers[2].OoRColor.r = r;
										Auras.db.char.triggers[2].OoRColor.g = g;
										Auras.db.char.triggers[2].OoRColor.b = b;
										Auras.db.char.triggers[2].OoRColor.a = a;
										CheckEnhancementDefaultValues(enh_options,"Triggers");
									end,
								},
								--[[filler = {
									order = 7,
									type = "description",
									name = '',
								},]]
								reset = {
									order = 6,
									type = "execute",
									--name = "|cFFFFCC00"..L["Reset Trigger Values"].."|r",
									--disabled = false,
									name = L["Reset Trigger Values"],
									func = function()
										Auras.db.char.triggers[2].flametongue = Auras.db.char.triggers.default[2].flametongue
										Auras.db.char.triggers[2].frostbrand = Auras.db.char.triggers.default[2].frostbrand
										Auras.db.char.triggers[2].boulderfist = Auras.db.char.triggers.default[2].boulderfist
										Auras.db.char.triggers[2].OoCAlpha = Auras.db.char.triggers.default.OoCAlpha
										Auras.db.char.triggers[2].OoRColor.r = Auras.db.char.triggers.default.OoRColor.r
										Auras.db.char.triggers[2].OoRColor.g = Auras.db.char.triggers.default.OoRColor.g
										Auras.db.char.triggers[2].OoRColor.b = Auras.db.char.triggers.default.OoRColor.b
										Auras.db.char.triggers[2].OoRColor.a = Auras.db.char.triggers.default.OoRColor.a
										enh_options.args.config.args.triggers.args.reset.disabled = true
										enh_options.args.config.args.triggers.args.reset.name = "|cFF666666"..L["Reset Trigger Values"].."|r"
									end,
								},
							},
						},
						filler_1 = {
							order = 4,
							type = "description",
							name = ' ',
						},
						maelstromBar = {
							name = L["Maelstrom Bar Settings"],
							type = "group",
							order = 5,
							guiInline = true,
							args = {
								adjust = {
									order = 1,
									name = L["Modify Maelstrom Bar"],
									desc = L["Toggle the adjustment of the Maelstrom Bar size"],
									type = "toggle",
									get = function()
										return Auras.db.char.config[2].maelstromBar.isAdjustable;
									end,
									set = function(_, value)
										Auras.db.char.config[2].maelstromBar.isAdjustable = value;
										if (not value) then
											enh_options.args.config.args.maelstromBar.args.alphaOoC.disabled = false;
											enh_options.args.config.args.maelstromBar.args.alphaTarget.disabled = false;
											enh_options.args.config.args.maelstromBar.args.alphaCombat.disabled = true;
											enh_options.args.config.args.maelstromBar.args.width.disabled = true;
											enh_options.args.config.args.maelstromBar.args.height.disabled = true;
											enh_options.args.config.args.maelstromBar.args.textSize.disabled = true;
											--SSA.MaelstromBarTotemBar:Hide();
											--SSA.MaelstromBarTotemBar:SetValue(UnitPower('player',11));
										else
											enh_options.args.config.args.maelstromBar.args.alphaOoC.disabled = true;
											enh_options.args.config.args.maelstromBar.args.alphaTarget.disabled = true;
											enh_options.args.config.args.maelstromBar.args.alphaCombat.disabled = false;
											enh_options.args.config.args.maelstromBar.args.width.disabled = false;
											enh_options.args.config.args.maelstromBar.args.height.disabled = false;
											enh_options.args.config.args.maelstromBar.args.textSize.disabled = false;
											--SSA.EarthenShieldTotemBar:Show();
											--SSA.EarthenShieldTotemBar:SetValue(UnitPowerMax('player',11));
										end
									end,
								},
								text = {
									order = 2,
									name = L["Maelstrom Value Text"],
									desc = L["Toggles the text display of the amount of maelstrom remaining"],
									type = "toggle",
									get = function()
										return Auras.db.char.config[2].maelstromBar.isDisplayText;
									end,
									set = function(_, value)
										Auras.db.char.config[2].maelstromBar.isDisplayText = value;
										CheckEnhancementDefaultValues(enh_options,'Maelstrom');
									end,
								},
								animation = {
									order = 3,
									type = "toggle",
									name = L["Maelstrom Lightning"],
									get = function() 
										return Auras.db.char.config[2].maelstromBar.animate;
									end,
									set = function(_, value)
										Auras.db.char.config[2].maelstromBar.animate = value;
										CheckEnhancementDefaultValues(enh_options,"Maelstrom");
									end,
								},
								alphaCombat = {
									order = 4,
									type = "range",
									name = L["Alpha (In Combat)"],
									desc = L["Determines how opaque or transparent the bar will appear while in combat"],
									min = 0,
									max = 1,
									step = 0.1,
									bigStep = 0.1,
									disabled = true,
									get = function() return Auras.db.char.config[2].maelstromBar.alphaCombat end,
									set = function(_, value)
										Auras.db.char.config[2].maelstromBar.alphaCombat = value
										CheckEnhancementDefaultValues(enh_options,'Maelstrom');
									end,
								},
								alphaOoC = {
									order = 5,
									type = "range",
									name = L["Alpha (OoC - No Target)"],
									desc = L["Determines how opaque or transparent the bar will appear when out of combat"],
									min = 0,
									max = 1,
									step = 0.1,
									bigStep = 0.1,
									disabled = false,
									get = function() return Auras.db.char.config[2].maelstromBar.alphaOoC end,
									set = function(_, value)
										Auras.db.char.config[2].maelstromBar.alphaOoC = value
										CheckEnhancementDefaultValues(enh_options,'Maelstrom','Alpha');
									end,
								},
								alphaTarget = {
									order = 6,
									type = "range",
									name = L["Alpha (OoC - Target)"],
									desc = L["Determines how opaque or transparent the bar will appear when out of combat and targetting an enemy"],
									min = 0,
									max = 1,
									step = 0.1,
									bigStep = 0.1,
									disabled = false,
									get = function() return Auras.db.char.config[2].maelstromBar.alphaTar end,
									set = function(_, value)
										Auras.db.char.config[2].maelstromBar.alphaTar = value;
										CheckEnhancementDefaultValues(enh_options,"Maelstrom");
									end,
								},
								width = {
									order = 7,
									type = "range",
									name = L["Bar Width"],
									desc = L["Changes the width of the Maelstrom Bar. (Default is 260)"],
									min = 100,
									max = 300,
									step = 1,
									bigStep = 1,
									disabled = true,
									get = function() return Auras.db.char.layout[2].maelstromBar.width end,
									set = function(_, value)
										Auras.db.char.layout[2].maelstromBar.width = value;
										CheckEnhancementDefaultValues(enh_options,"Maelstrom");
									end,
								},
								height = {
									order = 8,
									type = "range",
									name = L["Bar Height"],
									desc = L["Changes the height of the Maelstrom Bar. (Default is 21)"],
									min = 10,
									max = 30,
									step = 1,
									bigStep = 1,
									disabled = true,
									get = function() return Auras.db.char.layout[2].maelstromBar.height end,
									set = function(_, value)
										Auras.db.char.layout[2].maelstromBar.height = value;
										CheckEnhancementDefaultValues(enh_options,"Maelstrom");
									end,
								},
								textSize = {
									order = 9,
									type = "range",
									name = L["Text Size"],
									desc = L["Changes the size of the text. (Default is 12)"],
									min = 10,
									max = 30,
									step = 1,
									bigStep = 1,
									disabled = true,
									get = function() return Auras.db.char.layout[2].maelstromBar.textSize end,
									set = function(_, value)
										Auras.db.char.layout[2].maelstromBar.textSize = value;
										CheckEnhancementDefaultValues(enh_options,"Maelstrom");
									end,
								},
								justify = {
									order = 10,
									type = "select",
									name = L["Maelstrom Value Justify"],
									desc = L["Set the position of the text on the mana bar."],
									get = function()
										return Auras.db.char.config[2].maelstromBar.justify
									end,
									set = function(_, value)
										Auras.db.char.config[2].maelstromBar.justify = value;
										CheckEnhancementDefaultValues(enh_options,"Maelstrom");
										--Auras:UpdateTalents();
									end,
									values = {
										["Left"] = L["Left"],
										["Center"] = L["Center"],
										["Right"] = L["Right"],
									}
								},
								threshold = {
									order = 11,
									type = "range",
									name = L["Maelstrom Trigger"],
									desc = L["The amount of Maelstrom accumulated at which the \"Lightning\" animation will appear"],
									min = 50,
									max = 150,
									step = 5,
									bigStep = 5,
									get = function() return Auras.db.char.config[2].maelstromBar.threshold end,
									set = function(_, value)
										Auras.db.char.config[2].maelstromBar.threshold = value;
										CheckEnhancementDefaultValues(enh_options,"Maelstrom");
									end,
								},
								reset = {
									order = 12,
									type = "execute",
									--name = "|cFFFFCC00"..L["Reset Earthen Shield Bar"].."|r",
									--disabled = false,
									name = L["Reset Maelstrom Bar"],
									func = function()
										Auras.db.char.layout[2].maelstromBar.width = Auras.db.char.layout.default.LargeBar.width;
										Auras.db.char.layout[2].maelstromBar.height = Auras.db.char.layout.default.LargeBar.height
										Auras.db.char.layout[2].maelstromBar.textSize = Auras.db.char.layout.default.textSize
										
										Auras.db.char.config[2].maelstromBar.isDisplayText = Auras.db.char.config.default.isDisplayText
										Auras.db.char.config[2].maelstromBar.animate = Auras.db.char.config.default.animate
										Auras.db.char.config[2].maelstromBar.alphaCombat = Auras.db.char.config.default.alphaCombat
										Auras.db.char.config[2].maelstromBar.alphaOoC = Auras.db.char.config.default.alphaOoC
										Auras.db.char.config[2].maelstromBar.alphaTar = Auras.db.char.config.default.alphaTar
										Auras.db.char.config[2].maelstromBar.justify = Auras.db.char.config.default.justify
										Auras.db.char.config[2].maelstromBar.threshold = Auras.db.char.config.default[2].maelstromBar.threshold
										
										if (Auras.db.char.config[2].maelstromBar.isAdjustable) then
											enh_options.args.config.args.maelstromBar.args.alphaTarget.disabled = true;
										else
											enh_options.args.config.args.maelstromBar.args.alphaTarget.disabled = false;
										end
										
										enh_options.args.config.args.maelstromBar.args.reset.disabled = true;
										enh_options.args.config.args.maelstromBar.args.reset.name = "|cFF666666"..L["Reset Maelstrom Bar"].."|r"
									end,
								},
							},
						},
					},
				},
				layout = {
					name = L["Layout"],
					order = 2,
					type = "group",
					disabled = true,
					args = {
						MoveAuras = {
							order = 1,
							type = "execute",
							name = "|cFFFFCC00"..L["Move Enhancement Auras"].."|r",
							func = function()
								Auras.db.char.layout[2].isMoving = true;
								Auras:InitMoveAuraGroups(SSA.AuraObjectsEnh,"Enh")
							end,
						},
						ResetAuras = {
							order = 2,
							type = "execute",
							name = "|cFFFFCC00"..L["Reset Enhancement Auras"].."|r",
							func = function()
								Auras:ResetAuraGroups(Auras.db.char.frames.defaultPos.enhGrp,Auras.db.char.frames.enhGrp)
							end,
						},
						filler_0 = {
							order = 3,
							type = "description",
							name = ' ',
						},
						primaryDesc = {
							order = 4,
							type = "description",
							name = L["Primary Auras"],
						},
						PrimaryOrientation1 = {
							order = 5,
							type = "select",
							name = L["Primary Orientation 1"],
							desc = L["Set the aura orientation to horizontal or vertical."],
							get = function()
								return Auras.db.char.layout[2].orientation.top
							end,
							set = function(_, value)
								Auras.db.char.layout[2].orientation.top = value;
								CheckEnhancementDefaultValues(enh_options,"Primary");
								Auras:UpdateTalents();
							end,
							values = {
								["Horizontal"] = L["Horizontal"],
								["Vertical"] = L["Vertical"],
							},
						},
						PrimaryOrientation2 = {
							order = 6,
							type = "select",
							name = L["Primary Orientation 2"],
							desc = L["Set the aura orientation to horizontal or vertical."],
							get = function()
								return Auras.db.char.layout[2].orientation.bottom
							end,
							set = function(_, value)
								Auras.db.char.layout[2].orientation.bottom = value;
								CheckEnhancementDefaultValues(enh_options,"Primary");
								Auras:UpdateTalents();
							end,
							values = {
								["Horizontal"] = L["Horizontal"],
								["Vertical"] = L["Vertical"],
							},
						},
						filler_1 = {
							order = 6,
							type = "description",
							name = ' ',
						},
						AuraSizeRow1 = {
							order = 7,
							type = "range",
							name = L["Primary Size 1"],
							desc = L["Determines the size of primary auras in row 1. (Default is 32)"],
							min = 16,
							max = 256,
							step = 1,
							bigStep = 1,
							get = function() return Auras.db.char.layout[2].primary.top.icon end,
							set = function(_, value)
								Auras.db.char.layout[2].primary.top.icon = value;
								CheckEnhancementDefaultValues(enh_options,"Primary");
								Auras:UpdateTalents();
							end,
						},
						AuraSpacingRow1 = {
							order = 8,
							type = "range",
							name = L["Primary Spacing 1"],
							desc = L["Determines the spacing of the primary auras in row 1. (Default is 50)"],
							min = 32,
							max = 300,
							step = 1,
							bigStep = 1,
							get = function() return Auras.db.char.layout[2].primary.top.spacing end,
							set = function(_, value)
								Auras.db.char.layout[2].primary.top.spacing = value;
								CheckEnhancementDefaultValues(enh_options,"Primary");
								Auras:UpdateTalents();
							end,
						},
						AuraChargesRow1 = {
							order = 9,
							type = "range",
							name = L["Primary Charges 1"],
							desc = L["Determines the size of the primary charge text in row 1. (Default is 13.5)"],
							min = 10,
							max = 60,
							step = 0.5,
							bigStep = 0.5,
							get = function() return Auras.db.char.layout[2].primary.top.charges end,
							set = function(_, value)
								Auras.db.char.layout[2].primary.top.charges = value;
								CheckEnhancementDefaultValues(enh_options,"Primary");
								Auras:UpdateTalents();
							end,
						},
						filler_2 = {
							order = 10,
							type = "description",
							name = ' ',
						},
						AuraSizeRow2 = {
							order = 11,
							type = "range",
							name = L["Primary Size 2"],
							desc = L["Determines the size of primary auras in row 2. (Default is 32)"],
							min = 16,
							max = 256,
							step = 1,
							bigStep = 1,
							get = function() return Auras.db.char.layout[2].primary.bottom.icon end,
							set = function(_, value)
								Auras.db.char.layout[2].primary.bottom.icon = value;
								CheckEnhancementDefaultValues(enh_options,"Primary");
								Auras:UpdateTalents();
							end,
						},
						AuraSpacingRow2 = {
							order = 12,
							type = "range",
							name = L["Primary Spacing 2"],
							desc = L["Determines the spacing of the primary auras in row 2. (Default is 50)"],
							min = 32,
							max = 300,
							step = 1,
							bigStep = 1,
							get = function() return Auras.db.char.layout[2].primary.bottom.spacing end,
							set = function(_, value)
								Auras.db.char.layout[2].primary.bottom.spacing = value;
								CheckEnhancementDefaultValues(enh_options,"Primary");
								Auras:UpdateTalents();
							end,
						},
						AuraChargesRow2 = {
							order = 13,
							type = "range",
							name = L["Primary Charges 2"],
							desc = L["Determines the size of the primary charge text in row 2. (Default is 13.5)"],
							min = 10,
							max = 60,
							step = 0.5,
							bigStep = 0.5,
							get = function() return Auras.db.char.layout[2].primary.bottom.charges end,
							set = function(_, value)
								Auras.db.char.layout[2].primary.bottom.charges = value;
								CheckEnhancementDefaultValues(enh_options,"Primary");
								Auras:UpdateTalents();
							end,
						},
						filler_3 = {
							order = 14,
							type = "description",
							name = ' ',
						},
						ResetPrimaryLayout = {
							order = 15,
							type = "execute",
							--name = "|cFFFFCC00"..L["Reset Primary Layout"].."|r",
							--disabled = false,
							name = L["Reset Primary Layout"],
							func = function()
								Auras.db.char.layout[2].orientation.top = Auras.db.char.layout.default.orientation.top
								Auras.db.char.layout[2].orientation.bottom = Auras.db.char.layout.default.orientation.bottom
								Auras.db.char.layout[2].primary.top.icon = Auras.db.char.layout.default.primary.top.icon
								Auras.db.char.layout[2].primary.top.spacing = Auras.db.char.layout.default.primary.top.spacing
								Auras.db.char.layout[2].primary.top.charges = Auras.db.char.layout.default.primary.top.charges
								Auras.db.char.layout[2].primary.bottom.icon = Auras.db.char.layout.default.primary.bottom.icon
								Auras.db.char.layout[2].primary.bottom.spacing = Auras.db.char.layout.default.primary.bottom.spacing
								Auras.db.char.layout[2].primary.bottom.charges = Auras.db.char.layout.default.primary.bottom.charges
								enh_options.args.layout.args.ResetPrimaryLayout.disabled = true
								enh_options.args.layout.args.ResetPrimaryLayout.name = "|cFF666666"..L["Reset Primary Layout"].."|r"
								Auras:UpdateTalents();
							end,
						},
						filler_4 = {
							order = 16,
							type = "description",
							name = ' ',
						},
						filler_5 = {
							order = 17,
							type = "description",
							name = ' ',
						},
						secondaryDesc = {
							order = 18,
							type = "description",
							name = L["Secondary Auras"],
						},
						SecondaryOrientation1 = {
							order = 19,
							type = "select",
							name = L["Secondary Orientation 1"],
							desc = L["Set the aura orientation to horizontal or vertical."],
							get = function()
								return Auras.db.char.layout[2].orientation.left
							end,
							set = function(_, value)
								Auras.db.char.layout[2].orientation.left = value;
								CheckEnhancementDefaultValues(enh_options,"Secondary");
								Auras:UpdateTalents();
							end,
							values = {
								["Horizontal"] = L["Horizontal"],
								["Vertical"] = L["Vertical"],
							},
						},
						SecondaryOrientation2 = {
							order = 20,
							type = "select",
							name = L["Secondary Orientation 2"],
							desc = L["Set the aura orientation to horizontal or vertical."],
							get = function()
								return Auras.db.char.layout[2].orientation.right
							end,
							set = function(_, value)
								Auras.db.char.layout[2].orientation.right = value;
								CheckEnhancementDefaultValues(enh_options,"Secondary");
								Auras:UpdateTalents();
							end,
							values = {
								["Horizontal"] = L["Horizontal"],
								["Vertical"] = L["Vertical"],
							},
						},
						filler_6 = {
							order = 21,
							type = "description",
							name = ' ',
						},
						AuraSizeCol1 = {
							order = 22,
							type = "range",
							name = L["Secondary Size 1"],
							desc = L["Determines the size of secondary auras in column 1. (Default is 25)"],
							min = 16,
							max = 256,
							step = 1,
							bigStep = 1,
							get = function() return Auras.db.char.layout[2].secondary.left.icon end,
							set = function(_, value)
								Auras.db.char.layout[2].secondary.left.icon = value;
								CheckEnhancementDefaultValues(enh_options,"Secondary");
								Auras:UpdateTalents();
							end,
						},
						AuraSpacingCol1 = {
							order = 23,
							type = "range",
							name = L["Secondary Spacing 1"],
							desc = L["Determines the spacing of the secondary auras in column 1. (Default is 30)"],
							min = 32,
							max = 300,
							step = 1,
							bigStep = 1,
							get = function() return Auras.db.char.layout[2].secondary.left.spacing end,
							set = function(_, value)
								Auras.db.char.layout[2].secondary.left.spacing = value;
								CheckEnhancementDefaultValues(enh_options,"Secondary");
								Auras:UpdateTalents();
							end,
						},
						filler_7 = {
							order = 24,
							type = "description",
							name = ' ',
						},
						AuraSizeCol2 = {
							order = 25,
							type = "range",
							name = L["Secondary Size 2"],
							desc = L["Determines the size of secondary auras in column 2. (Default is 25)"],
							min = 16,
							max = 256,
							step = 1,
							bigStep = 1,
							get = function() return Auras.db.char.layout[2].secondary.right.icon end,
							set = function(_, value)
								Auras.db.char.layout[2].secondary.right.icon = value;
								CheckEnhancementDefaultValues(enh_options,"Secondary");
								Auras:UpdateTalents();
							end,
						},
						AuraSpacingCol2 = {
							order = 26,
							type = "range",
							name = L["Secondary Spacing 2"],
							desc = L["Determines the spacing of the secondary auras in column 2. (Default is 30)"],
							min = 32,
							max = 300,
							step = 1,
							bigStep = 1,
							get = function() return Auras.db.char.layout[2].secondary.right.spacing end,
							set = function(_, value)
								Auras.db.char.layout[2].secondary.right.spacing = value;
								CheckEnhancementDefaultValues(enh_options,"Secondary");
								Auras:UpdateTalents();
							end,
						},
						filler_8 = {
							order = 24,
							type = "description",
							name = ' ',
						},
					--[[	filler_8 = {
							order = 25,
							type = "description",
							name = ' ',
						},]]
						ResetSecondaryLayout = {
							order = 28,
							type = "execute",
							--name = "|cFFFFCC00"..L["Reset Secondary Layout"].."|r",
							--disabled = false,
							name = L["Reset Secondary Layout"],
							func = function()
								Auras.db.char.layout[2].orientation.left = Auras.db.char.layout.default.orientation.left
								Auras.db.char.layout[2].orientation.right = Auras.db.char.layout.default.orientation.right
								Auras.db.char.layout[2].secondary.left.icon = Auras.db.char.layout.default.secondary.left.icon
								Auras.db.char.layout[2].secondary.left.spacing = Auras.db.char.layout.default.secondary.left.spacing
								Auras.db.char.layout[2].secondary.right.icon = Auras.db.char.layout.default.secondary.right.icon
								Auras.db.char.layout[2].secondary.right.spacing = Auras.db.char.layout.default.secondary.right.spacing
								enh_options.args.layout.args.ResetSecondaryLayout.disabled = true
								enh_options.args.layout.args.ResetSecondaryLayout.name = "|cFF666666"..L["Reset Secondary Layout"].."|r"
								Auras:UpdateTalents();
							end,
						},
					},
				},
			}
		}
	end
	return enh_options;
end



local res_options

local function GetRestorationOptions()
	if not res_options then
		--local sharedGrp = SSA.SharedGrp;
		res_options = {
			type = "group",
			childGroups = "tab",
			order = 1,
			name = L["Restoration Auras"],
			desc = L["Auras used by the Restoration specialization"],
			args = {
				display = {
					name = L["Display"],
					order = 0,
					type = "group",
					args = {
						show = {
							order = 1,
							name = L["Show Restoration Auras"],
							desc = L["Toggle the display of Elemental Auras"],
							type = "toggle",
							get = function()
								return Auras.db.char.frames.resGrp.enabled;
							end,
							set = function(_, value)
								Auras.db.char.frames.resGrp.enabled = value;
								if (not value) then
									AuraGroupRes:Hide();
								else
									AuraGroupRes:Show();
								end
							end,
						},
						MajorAuras = {
							name = L["Major Auras"],
							type = "group",
							order = 2,
							guiInline = true,
							args = {
								AncestralGuidanceRes = {
									order = 1,
									type = "toggle",
									name = L["Ancestral Guidance"],
									get = function() 
										return Auras.db.char.aura[3].AncestralGuidanceRes;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].AncestralGuidanceRes = value
										Auras:UpdateTalents()
									end,
								},
								AscendanceRes = {
									order = 2,
									type = "toggle",
									name = L["Ascendance"],
									get = function() 
										return Auras.db.char.aura[3].AscendanceRes;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].AscendanceRes = value
										Auras:UpdateTalents()
									end,
								},
								CloudburstTotem = {
									order = 3,
									type = "toggle",
									name = L["Cloudburst Totem"],
									get = function() 
										return Auras.db.char.aura[3].CloudburstTotem;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].CloudburstTotem = value
										Auras:UpdateTalents()
									end,
								},
								GiftOfQueen = {
									order = 4,
									type = "toggle",
									name = L["Gift of the Queen"],
									get = function() 
										return Auras.db.char.aura[3].GiftOfQueen;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].GiftOfQueen = value
										Auras:UpdateTalents()
									end,
								},
								HealingRain = {
									order = 5,
									type = "toggle",
									name = L["Healing Rain"],
									get = function()
										return Auras.db.char.aura[3].HealingRain;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].HealingRain = value
										Auras:UpdateTalents()
									end,
								},
								HealingStreamTotem = {
									order = 6,
									type = "toggle",
									name = L["Healing Stream Totem"],
									get = function() 
										return Auras.db.char.aura[3].HealingStreamTotem;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].HealingStreamTotem = value
										Auras:UpdateTalents()
									end,
								},
								HealingTideTotem = {
									order = 7,
									type = "toggle",
									name = L["Healing Tide Totem"],
									get = function() 
										return Auras.db.char.aura[3].HealingTideTotem;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].HealingTideTotem = value
										Auras:UpdateTalents()
									end,
								},
								Riptide = {
									order = 8,
									type = "toggle",
									name = L["Riptide"],
									get = function()
										return Auras.db.char.aura[3].Riptide;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].Riptide = value
										Auras:UpdateTalents()
									end,
								},
								SpiritLinkTotem = {
									order = 9,
									type = "toggle",
									name = L["Spirit Link Totem"],
									get = function() 
										return Auras.db.char.aura[3].SpiritLinkTotem;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].SpiritLinkTotem = value
										Auras:UpdateTalents()
									end,
								},
								UnleashLife = {
									order = 10,
									type = "toggle",
									name = L["Unleash Life"],
									get = function()
										return Auras.db.char.aura[3].UnleashLife;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].UnleashLife = value
										Auras:UpdateTalents()
									end,
								},
								Wellspring = {
									order = 11,
									type = "toggle",
									name = L["Wellspring"],
									get = function() 
										return Auras.db.char.aura[3].Wellspring;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].Wellspring = value
										Auras:UpdateTalents()
									end,
								},
								WindRushTotemRes = {
									order = 12,
									type = "toggle",
									name = L["Wind Rush Totem"],
									get = function() 
										return Auras.db.char.aura[3].WindRushTotemRes;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].WindRushTotemRes = value
										Auras:UpdateTalents()
									end,
								},
							},
						},
						MinorAuras = {
							name = L["Minor Auras"],
							type = "group",
							order = 3,
							guiInline = true,
							args = {
								AstralShiftRes = {
									order = 1,
									type = "toggle",
									name = L["Astral Shift"],
									get = function()
										return Auras.db.char.aura[3].AstralShiftRes;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].AstralShiftRes = value
										Auras:UpdateTalents()
									end,
								},
								EarthenShield = {
									order = 2,
									type = "toggle",
									name = L["Earthen Shield Totem"],
									get = function()
										return Auras.db.char.aura[3].EarthenShieldTotem;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].EarthenShieldTotem = value
										Auras:UpdateTalents()
									end,
								},
								EarthgrabTotemRes = {
									order = 3,
									type = "toggle",
									name = L["Earthgrab Totem"],
									get = function() 
										return Auras.db.char.aura[3].EarthgrabTotemRes;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].EarthgrabTotemRes = value
										Auras:UpdateTalents()
									end,
								},
								FlameShockRes = {
									order = 4,
									type = "toggle",
									name = L["Flame Shock"],
									get = function() 
										return Auras.db.char.aura[3].FlameShockRes;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].FlameShockRes = value
										Auras:UpdateTalents()
									end,
								},
								GustWindRes = {
									order = 5,
									type = "toggle",
									name = L["Gust of Wind"],
									get = function() 
										return Auras.db.char.aura[3].GustWindRes;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].GustWindRes = value
										Auras:UpdateTalents()
									end,
								},
								Hex = {
									order = 6,
									type = "toggle",
									name = L["Hex"],
									get = function()
										return Auras.db.char.aura[3].HexRes;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].HexRes = value
										Auras:UpdateTalents()
									end,
								},
								LavaBurstRes = {
									order = 7,
									type = "toggle",
									name = L["Lava Burst"],
									get = function() 
										return Auras.db.char.aura[3].LavaBurstRes;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].LavaBurstRes = value
										Auras:UpdateTalents()
									end,
								},
								LightningSurgeTotemRes = {
									order = 8,
									type = "toggle",
									name = L["Lightning Surge Totem"],
									get = function() 
										return Auras.db.char.aura[3].LightningSurgeTotemRes;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].LightningSurgeTotemRes = value
										Auras:UpdateTalents()
									end,
								},
								PurifySpirit = {
									order = 9,
									type = "toggle",
									name = L["Purify Spirit"],
									get = function() 
										return Auras.db.char.aura[3].PurifySpirit;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].PurifySpirit = value
										Auras:UpdateTalents()
									end,
								},
								SpiritwalkersGrace = {
									order = 10,
									type = "toggle",
									name = L["Spiritwalker's Grace"],
									get = function() 
										return Auras.db.char.aura[3].SpiritwalkersGrace;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].SpiritwalkersGrace = value
										Auras:UpdateTalents()
									end,
								},
								VoodooTotemRes = {
									order = 11,
									type = "toggle",
									name = L["Voodoo Totem"],
									get = function() 
										return Auras.db.char.aura[3].VoodooTotemRes;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].VoodooTotemRes = value
										Auras:UpdateTalents()
									end,
								},
								WindShearRes = {
									order = 12,
									type = "toggle",
									name = L["Wind Shear"],
									get = function() 
										return Auras.db.char.aura[3].WindShearRes;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].WindShearRes = value
										Auras:UpdateTalents()
									end,
								},
							},
						},
						ProgressBars = {
							name = L["Progress Bars"],
							type = "group",
							order = 4,
							guiInline = true,
							args = {
								EarthenShieldTotemBar = {
									order = 1,
									type = "toggle",
									name = L["Earthen Shield Totem Bar"],
									get = function() 
										return Auras.db.char.aura[3].EarthenShieldTotemBar;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].EarthenShieldTotemBar = value
									end,
								},
								ManaBar = {
									order = 2,
									type = "toggle",
									name = L["Mana Bar"],
									get = function() 
										return Auras.db.char.aura[3].ManaBar;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].ManaBar = value
									end,
								},
								TidalWavesBar = {
									order = 3,
									type = "toggle",
									name = L["Tidal Waves Bar"],
									get = function() 
										return Auras.db.char.aura[3].TidalWavesBar;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].TidalWavesBar = value
									end,
								},
								BuffTimerBars = {
									name = L["Buff Duration Timers"],
									type = "group",
									order = 4,
									guiInline = true,
									args = {
										AncestralGuidanceBarRes = {
											order = 1,
											type = "toggle",
											name = L["Ancestral Guidance"],
											get = function() 
												return Auras.db.char.aura[3].AncestralGuidanceBarRes;
											end,
											set = function(_, value)
												Auras.db.char.aura[3].AncestralGuidanceBarRes = value
											end,
										},
										AscendanceBarRes = {
											order = 2,
											type = "toggle",
											name = L["Ascendance"],
											get = function() 
												return Auras.db.char.aura[3].AscendanceBarRes;
											end,
											set = function(_, value)
												Auras.db.char.aura[3].AscendanceBarRes = value
											end,
										},
										AstralShiftBarRes = {
											order = 3,
											type = "toggle",
											name = L["Astral Shift"],
											get = function() 
												return Auras.db.char.aura[3].AstralShiftBarRes;
											end,
											set = function(_, value)
												Auras.db.char.aura[3].AstralShiftBarRes = value
											end,
										},
										Bloodlust = {
											order = 4,
											type = "toggle",
											name = L["Bloodlust"],
											hidden = false,
											get = function() 
												return Auras.db.char.aura[3].BloodlustBarRes;
											end,
											set = function(_, value)
												Auras.db.char.aura[3].BloodlustBarRes = value;
											end,
										},
										Heroism = {
											order = 5,
											type = "toggle",
											name = L["Heroism"],
											hidden = false,
											get = function() 
												return Auras.db.char.aura[3].HeroismBarRes;
											end,
											set = function(_, value)
												Auras.db.char.aura[3].HeroismBarRes = value
											end,
										},
										SpiritwalkersGraceBar = {
											order = 6,
											type = "toggle",
											name = L["Elemental Blast"],
											get = function() 
												return Auras.db.char.aura[3].SpiritwalkersGraceBar;
											end,
											set = function(_, value)
												Auras.db.char.aura[3].SpiritwalkersGraceBar = value;
											end,
										},
										Heroism = {
											order = 7,
											type = "toggle",
											name = L["Time Warp"],
											get = function() 
												return Auras.db.char.aura[3].TimeWarBarRes;
											end,
											set = function(_, value)
												Auras.db.char.aura[3].TimeWarpBarRes = value
											end,
										},
										TimeWarp = {
											order = 8,
											type = "toggle",
											name = L["Time Warp"],
											get = function() 
												return Auras.db.char.aura[3].TimeWarpBarRes;
											end,
											set = function(_, value)
												Auras.db.char.aura[3].TimeWarpBarRes = value
											end,
										},
										UnleashLifeBar = {
											order = 9,
											type = "toggle",
											name = L["Fire Elemental"],
											get = function() 
												return Auras.db.char.aura[3].UnleashLifeBar;
											end,
											set = function(_, value)
												Auras.db.char.aura[3].UnleashLifeBar = value;
											end,
										},								
									},
								},
								TotemTimerBars = {
									name = L["Totem Duration Timers"],
									type = "group",
									order = 5,
									guiInline = true,
									args = {
										AncestralProtectionTotemBar = {
											order = 1,
											type = "toggle",
											name = L["Ancestral Protection Totem"],
											get = function() 
												return Auras.db.char.aura[3].AncestralProtectionTotemBar;
											end,
											set = function(_, value)
												Auras.db.char.aura[3].AncestralProtectionTotemBar = value
											end,
										},
										CloudburstTotemBar = {
											order = 2,
											type = "toggle",
											name = L["Cloudburst Totem"],
											get = function() 
												return Auras.db.char.aura[3].CloudburstTotemBar;
											end,
											set = function(_, value)
												Auras.db.char.aura[3].CloudburstTotemBar = value
											end,
										},
										EarthgrabTotemBarRes = {
											order = 3,
											type = "toggle",
											name = L["Earthgrab Totem"],
											get = function() 
												return Auras.db.char.aura[3].EarthgrabTotemBarRes;
											end,
											set = function(_, value)
												Auras.db.char.aura[3].EarthgrabTotemBarRes = value
											end,
										},
										HealingStreamTotemBar = {
											order = 4,
											type = "toggle",
											name = L["Healing Stream Totem"],
											get = function() 
												return Auras.db.char.aura[3].HealingStreamTotemBar;
											end,
											set = function(_, value)
												Auras.db.char.aura[3].HealingStreamTotemBar = value
											end,
										},
										HealingTideTotemBar = {
											order = 5,
											type = "toggle",
											name = L["Healing Tide Totem"],
											get = function() 
												return Auras.db.char.aura[3].HealingTideTotemBar;
											end,
											set = function(_, value)
												Auras.db.char.aura[3].HealingTideTotemBar = value
											end,
										},
										SpiritLinkTotemBar = {
											order = 6,
											type = "toggle",
											name = L["Spirit Link Totem"],
											get = function() 
												return Auras.db.char.aura[3].SpiritLinkTotemBar;
											end,
											set = function(_, value)
												Auras.db.char.aura[3].SpiritLinkTotemBar = value
											end,
										},
										VoodooTotemBarRes = {
											order = 7,
											type = "toggle",
											name = L["Voodoo Totem"],
											get = function() 
												return Auras.db.char.aura[3].VoodooTotemBarRes;
											end,
											set = function(_, value)
												Auras.db.char.aura[3].VoodooTotemBarRes = value
											end,
										},
										WindRushTotemBarRes = {
											order = 8,
											type = "toggle",
											name = L["Wind Rush Totem"],
											get = function() 
												return Auras.db.char.aura[3].WindRushTotemBarRes;
											end,
											set = function(_, value)
												Auras.db.char.aura[3].WindRushTotemBarRes = value
											end,
										},
									},
								},
							},
						},
						TextureAlerts = {
							name = L["Texture Alerts"],
							type = "group",
							order = 5,
							guiInline = true,
							args = {
								TotemMastery = {
									order = 1,
									type = "toggle",
									name = L["Undulation"],
									get = function() 
										return Auras.db.char.aura[3].Undulation;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].Undulation = value
									end,
								},
							},
						},
					},
				},
				config = {
					name = L["Configuration"],
					order = 1,
					type = "group",
					disabled = true,
					args = {
						cooldown = {
							name = L["Cooldown Settings"],
							type = "group",
							order = 1,
							--disabled = true,
							guiInline = true,
							args = {
								text = {
									order = 1,
									name = L["Cooldown Values"],
									desc = L["Toggle the display of cooldown text/numbers."],
									type = "toggle",
									get = function()
										return Auras.db.char.config[3].cooldown.text;
									end,
									set = function(_, value)
										Auras.db.char.config[3].cooldown.text = value;
									end,
								},
								sweep = {
									order = 2,
									name = L["Cooldown Sweep Animation"],
									desc = L["Toggle the display of the cooldown animation sweep."],
									type = "toggle",
									get = function()
										return Auras.db.char.config[3].cooldown.sweep;
									end,
									set = function(_, value)
										Auras.db.char.config[3].cooldown.sweep = value;
										
										if (not value) then
											res_options.args.config.args.cooldown.args.inverse.disabled = true;
										else
											res_options.args.config.args.cooldown.args.inverse.disabled = false;
										end
									end,
								},
								inverse = {
									order = 3,
									name = L["Reverse Sweep Animation"],
									desc = L["Reverses the cooldown animation sweep."],
									type = "toggle",
									get = function()
										return Auras.db.char.config[3].cooldown.inverse;
									end,
									set = function(_, value)
										Auras.db.char.config[3].cooldown.inverse = value;
									end,
								},
							},
						},
						filler_0 = {
							order = 2,
							type = "description",
							name = ' ',
						},
						triggers = {
							name = L["Aura Triggers"],
							type = "group",
							order = 3,
							guiInline = true,
							args = {
								OoCAlpha = {
									order = 1,
									type = "range",
									name = L["Alpha (OoC)"],
									desc = L["Determines how opaque or transparent the auras will appear when out of combat"],
									min = 0,
									max = 1,
									step = 0.1,
									bigStep = 0.1,
									get = function() return Auras.db.char.triggers[3].OoCAlpha end,
									set = function(_, value)
										Auras.db.char.triggers[3].OoCAlpha = value;
										CheckRestorationDefaultValues(res_options,"Triggers");
									end,
								},
								FlameShock = {
									order = 2,
									type = "range",
									name = L["Flame Shock"],
									desc = L["The amount of seconds remaining when the \"Glow\" animation will appear"],
									min = 5,
									max = 15,
									step = 1,
									bigStep = 1,
									get = function() return Auras.db.char.triggers[3].flameShock end,
									set = function(_, value)
										Auras.db.char.triggers[3].flameShock = value;
										CheckRestorationDefaultValues(res_options,"Triggers");
									end,
								},
								OoRColor = {
									type = "color",
									order = 3,
									name = L["Color (OoR)"],
									desc = L["Determines the color of harmful auras will appear when out of range"],
									hasAlpha = true,
									get = function(info)
										return Auras.db.char.triggers[3].OoRColor.r, Auras.db.char.triggers[3].OoRColor.g, Auras.db.char.triggers[3].OoRColor.b, Auras.db.char.triggers[3].OoRColor.a
									end,
									set = function(info, r, g, b, a)
										Auras.db.char.triggers[3].OoRColor.r = r
										Auras.db.char.triggers[3].OoRColor.g = g
										Auras.db.char.triggers[3].OoRColor.b = b
										Auras.db.char.triggers[3].OoRColor.a = a
										CheckRestorationDefaultValues(res_options,"Triggers");
									end,
								},
								fillerTwo = {
									order = 4,
									type = "description",
									name = ' ',
								},
								reset = {
									order = 5,
									type = "execute",
									--name = "|cFFFFCC00"..L["Reset Trigger Values"].."|r",
									--disabled = false,
									name = L["Reset Trigger Values"],
									func = function()
										Auras.db.char.triggers[3].OoCAlpha = Auras.db.char.triggers.default.OoCAlpha
										Auras.db.char.triggers[3].flameShock = Auras.db.char.triggers.default[3].flameShock
										Auras.db.char.triggers[3].OoRColor.r = Auras.db.char.triggers.default.OoRColor.r
										Auras.db.char.triggers[3].OoRColor.g = Auras.db.char.triggers.default.OoRColor.g
										Auras.db.char.triggers[3].OoRColor.b = Auras.db.char.triggers.default.OoRColor.b
										Auras.db.char.triggers[3].OoRColor.a = Auras.db.char.triggers.default.OoRColor.a
										
										res_options.args.config.args.triggers.args.reset.disabled = true;
										res_options.args.config.args.triggers.args.reset.name = "|cFF666666"..L["Reset Trigger Values"].."|r"
									end,
								},
							},
						},
						filler_1 = {
							order = 4,
							type = "description",
							name = ' ',
						},
						--[[layout = {
							name = L["Layout Settings"],
							type = "group",
							order = 6,
							guiInline = true,
							args = {
								
								filler_6 = {
									order = 24,
									type = "description",
									name = ' ',
								},
								filler_7 = {
									order = 25,
									type = "description",
									name = ' ',
								},
								MaelstromBarDesc = {
									order = 25,
									type = "description",
									name = L["Maelstrom Bar"],
								},
							},
						},]]
						earthenShield = {
							name = L["Earthen Shield Bar Settings"],
							type = "group",
							order = 5,
							guiInline = true,
							args = {
								adjust = {
									order = 1,
									name = L["Modify Earthen Shield Bar"],
									desc = L["Toggle the adjustment of the Earthen Shield Bar size"],
									type = "toggle",
									get = function()
										return Auras.db.char.config[3].earthenShieldBar.isAdjustable;
									end,
									set = function(_, value)
										Auras.db.char.config[3].earthenShieldBar.isAdjustable = value;
										if (not value) then
											res_options.args.config.args.earthenShield.args.alphaOoC.disabled = false;
											res_options.args.config.args.earthenShield.args.alphaCombat.disabled = true;
											res_options.args.config.args.earthenShield.args.width.disabled = true;
											res_options.args.config.args.earthenShield.args.height.disabled = true;
											res_options.args.config.args.earthenShield.args.textSize.disabled = true;
											--SSA.earthenShieldTotemBar:Hide();
											--SSA.earthenShieldTotemBar:SetValue(UnitPower('player',11));
										else
											res_options.args.config.args.earthenShield.args.alphaOoC.disabled = true;
											res_options.args.config.args.earthenShield.args.alphaCombat.disabled = false;
											res_options.args.config.args.earthenShield.args.width.disabled = false;
											res_options.args.config.args.earthenShield.args.height.disabled = false;
											res_options.args.config.args.earthenShield.args.textSize.disabled = false;
											--SSA.EarthenShieldTotemBar:Show();
											--SSA.EarthenShieldTotemBar:SetValue(UnitPowerMax('player',11));
										end
									end,
								},
								timerText = {
									order = 2,
									name = L["Timer Value Text"],
									desc = L["Toggles the text display of the amount of time remaining"],
									type = "toggle",
									get = function()
										return Auras.db.char.config[3].earthenShieldBar.isDisplayTimerText;
									end,
									set = function(_, value)
										Auras.db.char.config[3].earthenShieldBar.isDisplayTimerText = value;
										CheckRestorationDefaultValues(res_options,'Earthen Shield');
									end,
								},
								healthText = {
									order = 3,
									name = L["Health Value Text"],
									desc = L["Toggles the text display of the amount of health remaining"],
									type = "toggle",
									get = function()
										return Auras.db.char.config[3].earthenShieldBar.isDisplayHealthText;
									end,
									set = function(_, value)
										Auras.db.char.config[3].earthenShieldBar.isDisplayHealthText = value;
										CheckRestorationDefaultValues(res_options,'Earthen Shield');
									end,
								},
								alphaCombat = {
									order = 4,
									type = "range",
									name = L["Alpha (In Combat)"],
									desc = L["Determines how opaque or transparent the bar will appear while in combat"],
									min = 0,
									max = 1,
									step = 0.1,
									bigStep = 0.1,
									disabled = true,
									get = function() return Auras.db.char.config[3].earthenShieldBar.alphaCombat end,
									set = function(_, value)
										Auras.db.char.config[3].earthenShieldBar.alphaCombat = value
										CheckRestorationDefaultValues(res_options,'Earthen Shield');
									end,
								},
								alphaOoC = {
									order = 5,
									type = "range",
									name = L["Alpha (OoC)"],
									desc = L["Determines how opaque or transparent the bar will appear when out of combat"],
									min = 0,
									max = 1,
									step = 0.1,
									bigStep = 0.1,
									disabled = false,
									get = function() return Auras.db.char.config[3].earthenShieldBar.alphaOoC end,
									set = function(_, value)
										Auras.db.char.config[3].earthenShieldBar.alphaOoC = value
										CheckRestorationDefaultValues(res_options,'Earthen Shield');
									end,
								},
								filler_2 = {
									order = 6,
									type = "description",
									name = '',
								},
								width = {
									order = 7,
									type = "range",
									name = L["Bar Width"],
									desc = L["Changes the width of the Earthen Shield Bar. (Default is 260)"],
									min = 100,
									max = 300,
									step = 1,
									bigStep = 1,
									disabled = true,
									get = function() return Auras.db.char.layout[3].earthenShieldBar.width end,
									set = function(_, value)
										Auras.db.char.layout[3].earthenShieldBar.width = value;
										CheckRestorationDefaultValues(res_options,"Earthen Shield");
									end,
								},
								height = {
									order = 8,
									type = "range",
									name = L["Bar Height"],
									desc = L["Changes the height of the Earthen Shield Bar. (Default is 21)"],
									min = 10,
									max = 30,
									step = 1,
									bigStep = 1,
									disabled = true,
									get = function() return Auras.db.char.layout[3].earthenShieldBar.height end,
									set = function(_, value)
										Auras.db.char.layout[3].earthenShieldBar.height = value;
										CheckRestorationDefaultValues(res_options,"Earthen Shield");
									end,
								},
								textSize = {
									order = 9,
									type = "range",
									name = L["Text Size"],
									desc = L["Changes the size of the text. (Default is 12)"],
									min = 10,
									max = 30,
									step = 1,
									bigStep = 1,
									disabled = true,
									get = function() return Auras.db.char.layout[3].earthenShieldBar.textSize end,
									set = function(_, value)
										Auras.db.char.layout[3].earthenShieldBar.textSize = value;
										CheckRestorationDefaultValues(res_options,"Earthen Shield");
									end,
								},
								reset = {
									order = 10,
									type = "execute",
									--name = "|cFFFFCC00"..L["Reset Earthen Shield Bar"].."|r",
									--disabled = false,
									name = L["Reset Earthen Shield Bar"],
									func = function()
										Auras.db.char.layout[3].earthenShieldBar.width = Auras.db.char.layout.default.LargeBar.width;
										Auras.db.char.layout[3].earthenShieldBar.height = Auras.db.char.layout.default.LargeBar.height
										Auras.db.char.layout[3].earthenShieldBar.textSize = Auras.db.char.layout.default.textSize
										
										Auras.db.char.config[3].earthenShieldBar.isDisplayTimerText = Auras.db.char.config.default[3].earthenShieldBar.isDisplayTimerText
										Auras.db.char.config[3].earthenShieldBar.isDisplayHealthText = Auras.db.char.config.default[3].earthenShieldBar.isDisplayHealthText
										Auras.db.char.config[3].earthenShieldBar.alphaCombat = Auras.db.char.config.default.alphaCombat
										Auras.db.char.config[3].earthenShieldBar.alphaOoC = Auras.db.char.config.default.alphaOoC
										
										res_options.args.config.args.earthenShield.args.reset.disabled = true;
										res_options.args.config.args.earthenShield.args.reset.name = "|cFF666666"..L["Reset Earthen Shield Bar"].."|r"
									end,
								},
							},
						},
						tidalWavesBar = {
							name = L["Tidal Waves Bar Settings"],
							type = "group",
							order = 6,
							guiInline = true,
							args = {
								adjust = {
									order = 1,
									name = L["Modify Tidal Waves Bar"],
									desc = L["Toggle the adjustment of the Tidal Waves Bar size"],
									type = "toggle",
									get = function()
										return Auras.db.char.config[3].tidalWavesBar.isAdjustable;
									end,
									set = function(_, value)
										Auras.db.char.config[3].tidalWavesBar.isAdjustable = value;
										if (not value) then
											res_options.args.config.args.tidalWavesBar.args.width.disabled = true;
											res_options.args.config.args.tidalWavesBar.args.height.disabled = true;
											--SSA.TidalWavesBar:SetAlpha(0);
											--SSA.TidalWavesBar:SetValue(0);
										else
											--SSA.TidalWavesBar:SetAlpha(1);
											--SSA.TidalWavesBar:SetValue(2);
											res_options.args.config.args.tidalWavesBar.args.width.disabled = false;
											res_options.args.config.args.tidalWavesBar.args.height.disabled = false;
										end
									end,
								},
								animate = {
									order = 2,
									type = "toggle",
									name = L["Animate Tidal Waves Bar"],
									get = function() 
										return Auras.db.char.config[3].tidalWavesBar.animate;
									end,
									set = function(_, value)
										local buff,_,_,count = UnitBuff('player',Auras:GetSpellName(53390));
										Auras.db.char.config[3].tidalWavesBar.animate = value;
										CheckRestorationDefaultValues(res_options,"Tidal Waves");
										if (value) then
											if (buff) then
												--Auras:UpdateTidalWaveBar(0.5,{0.35,0.76,1},false,count);
											else
												--Auras:UpdateTidalWaveBar(0,{1,0,0},value,2);
											end
										end
									end,
								},
								emptyColor = {
									type = "color",
									order = 3,
									name = L["No Tidal Waves Color"],
									desc = L["Determines the color of the Tidal Waves bar when no tidal wave charges are active"],
									hasAlpha = true,
									get = function(info)
										return Auras.db.char.config[3].tidalWavesBar.emptyColor.r,
										Auras.db.char.config[3].tidalWavesBar.emptyColor.g,
										Auras.db.char.config[3].tidalWavesBar.emptyColor.b,
										Auras.db.char.config[3].tidalWavesBar.emptyColor.a
									end,
									set = function(info, r, g, b, a)
										Auras.db.char.config[3].tidalWavesBar.emptyColor.r = r
										Auras.db.char.config[3].tidalWavesBar.emptyColor.g = g
										Auras.db.char.config[3].tidalWavesBar.emptyColor.b = b
										Auras.db.char.config[3].tidalWavesBar.emptyColor.a = a
										CheckRestorationDefaultValues(res_options,"Tidal Waves");
									end,
								},
								combatDisplay = {
									order = 4,
									type = "select",
									name = L["Tidal Wave Display (In Combat)"],
									desc = L["The method in which Tidal Wave will be displayed while in combat."],
									get = function()
										return Auras.db.char.config[3].tidalWavesBar.combatDisplay
									end,
									set = function(_, value)
										Auras.db.char.config[3].tidalWavesBar.combatDisplay = value;
										CheckRestorationDefaultValues(res_options,"Tidal Waves");
									end,
									values = {
										["Always"] = L["Always"],
										["Target & On Heal"] = L["Target & On Heal"],
										["Target Only"] = L["Target Only"],
										["On Heal Only"] = L["On Heal Only"],
										["Never"] = L["Never"],
									},
								},
								OoCDisplay = {
									order = 5,
									type = "select",
									name = L["Tidal Wave Display (OoC)"],
									desc = L["The method in which Tidal Wave will be displayed while out of combat."],
									get = function()
										return Auras.db.char.config[3].tidalWavesBar.OoCDisplay
									end,
									set = function(_, value)
										Auras.db.char.config[3].tidalWavesBar.OoCDisplay = value;
										CheckRestorationDefaultValues(res_options,"Tidal Waves");
									end,
									values = {
										["Always"] = L["Always"],
										["Target & On Heal"] = L["Target & On Heal"],
										["Target Only"] = L["Target Only"],
										["On Heal Only"] = L["On Heal Only"],
										["Never"] = L["Never"],
									},
								},
								OoCTime = {
									order = 6,
									type = "range",
									name = L["Tidal Wave Duration (OoC)"],
									desc = L["The amount of seconds the Tidal Waves indicator bar will appear when casting a heal without a target while out of combat."],
									min = 1,
									max = 15,
									step = 1,
									bigStep = 1,
									get = function() return Auras.db.char.config[3].tidalWavesBar.OoCTime end,
									set = function(_, value)
										Auras.db.char.config[3].tidalWavesBar.OoCTime = value;
										CheckRestorationDefaultValues(res_options,"Tidal Waves");
									end,
								},
								width = {
									order = 7,
									type = "range",
									name = L["Bar Width"],
									desc = L["Changes the width of the Tidal Waves Bar. (Default is 225)"],
									min = 100,
									max = 300,
									step = 1,
									bigStep = 1,
									disabled = true,
									get = function() return Auras.db.char.layout[3].tidalWavesBar.width end,
									set = function(_, value)
										Auras.db.char.layout[3].tidalWavesBar.width = value;
										CheckRestorationDefaultValues(res_options,"Tidal Waves");
										SSA.TidalWavesBar:SetWidth(value);
									end,
								},
								height = {
									order = 8,
									type = "range",
									name = L["Bar Height"],
									desc = L["Changes the height of the Tidal Waves Bar. (Default is 7)"],
									min = 5,
									max = 30,
									step = 1,
									bigStep = 1,
									disabled = true,
									get = function() return Auras.db.char.layout[3].tidalWavesBar.height end,
									set = function(_, value)
										Auras.db.char.layout[3].tidalWavesBar.height = value;
										CheckRestorationDefaultValues(res_options,"Tidal Waves");
										SSA.TidalWavesBar:SetHeight(value);
									end,
								},
								filler_2 = {
									order = 9,
									type = "description",
									name = '',
								},
								reset = {
									order = 10,
									type = "execute",
									--name = "|cFFFFCC00"..L["Reset Tidal Waves Bar"].."|r",
									--disabled = false,
									name = L["Reset Tidal Waves Bar"],
									func = function()
										Auras.db.char.layout[3].tidalWavesBar.width = Auras.db.char.layout.default.SmallBar.width
										Auras.db.char.layout[3].tidalWavesBar.height = Auras.db.char.layout.default.SmallBar.height
										
										Auras.db.char.config[3].tidalWavesBar.combatDisplay = Auras.db.char.config.default[3].tidalWavesBar.combatDisplay
										Auras.db.char.config[3].tidalWavesBar.OoCDisplay = Auras.db.char.config.default[3].tidalWavesBar.OoCDisplay
										Auras.db.char.config[3].tidalWavesBar.animate = Auras.db.char.config.default.animate
										Auras.db.char.config[3].tidalWavesBar.OoCTime = Auras.db.char.config.default[3].tidalWavesBar.OoCTime
										Auras.db.char.config[3].tidalWavesBar.emptyColor.r = Auras.db.char.config.default[3].tidalWavesBar.emptyColor.r
										Auras.db.char.config[3].tidalWavesBar.emptyColor.g = Auras.db.char.config.default[3].tidalWavesBar.emptyColor.g
										Auras.db.char.config[3].tidalWavesBar.emptyColor.b = Auras.db.char.config.default[3].tidalWavesBar.emptyColor.b
										Auras.db.char.config[3].tidalWavesBar.emptyColor.a = Auras.db.char.config.default[3].tidalWavesBar.emptyColor.a
										
										res_options.args.config.args.tidalWavesBar.args.reset.disabled = true;
										res_options.args.config.args.tidalWavesBar.args.reset.name = "|cFF666666"..L["Reset Tidal Waves Bar"].."|r"
									end,
								},
							},
						},
						manaBar = {
							name = L["Mana Bar Settings"],
							type = "group",
							order = 7,
							guiInline = true,
							args = {
								ManaBarAdjust = {
									order = 1,
									name = L["Modify Mana Bar"],
									desc = L["Toggle the adjustment of the Mana Bar size"],
									type = "toggle",
									get = function()
										return Auras.db.char.config[3].manaBar.isAdjustable;
									end,
									set = function(_, value)
										Auras.db.char.config[3].manaBar.isAdjustable = value;
										if (not value) then
											--SSA.ManaBar:SetAlpha(0);
											--SSA.ManaBar:SetValue(0);
											res_options.args.config.args.manaBar.args.alphaOoC.disabled = false;
											res_options.args.config.args.manaBar.args.alphaCombat.disabled = true;
											res_options.args.config.args.manaBar.args.ManaBarWidth.disabled = true;
											res_options.args.config.args.manaBar.args.ManaBarHeight.disabled = true;
											res_options.args.config.args.manaBar.args.TextSize.disabled = true;
										else
											res_options.args.config.args.manaBar.args.alphaOoC.disabled = true;
											res_options.args.config.args.manaBar.args.alphaCombat.disabled = false;
											res_options.args.config.args.manaBar.args.ManaBarWidth.disabled = false;
											res_options.args.config.args.manaBar.args.ManaBarHeight.disabled = false;
											res_options.args.config.args.manaBar.args.TextSize.disabled = false;
											--SSA.ManaBar:SetAlpha(1);
											--SSA.ManaBar:SetValue(4);
										end
									end,
								},
								ManaBarDigitGrouping = {
									order = 2,
									name = L["Digit Grouping"],
									desc = L["Add or remove separating commas"],
									type = "toggle",
									get = function()
										return Auras.db.char.config[3].manaBar.grouping;
									end,
									set = function(_, value)
										Auras.db.char.config[3].manaBar.grouping = value;
										CheckRestorationDefaultValues(res_options,'Mana Bar');
										if (value) then
											res_options.args.config.args.manaBar.args.ManaBarPrecision.values = {
												--[[[tostring(ManaPrecision("Full"))] = "Full",
												[tostring(ManaPrecision("Thousand"))] = "Thousand",
												[tostring(ManaPrecision("Million"))] = "Million",]]
												["Long"] = tostring(Auras:ManaPrecision("Long")),
												["Short"] = tostring(Auras:ManaPrecision("Short")),
											}
										else
											res_options.args.config.args.manaBar.args.ManaBarPrecision.values = {
												--[[[tostring(ManaPrecision("Full"))] = "Full",
												[tostring(ManaPrecision("Thousand"))] = "Thousand",
												[tostring(ManaPrecision("Million"))] = "Million",]]
												["Long"] = tostring(Auras:ManaPrecision("Long")),
												["Short"] = tostring(Auras:ManaPrecision("Short")),
											}
										end
										
											
									end,
									
								},
								ManaBarText = {
									order = 3,
									name = L["Mana Value Text"],
									desc = L["Toggles the text display of the amount of mana"],
									type = "toggle",
									get = function()
										return Auras.db.char.config[3].manaBar.isDisplayText;
									end,
									set = function(_, value)
										Auras.db.char.config[3].manaBar.isDisplayText = value;
										CheckRestorationDefaultValues(res_options,'Mana Bar');
									end,
								},
								alphaCombat = {
									order = 4,
									type = "range",
									name = L["Alpha (In Combat)"],
									desc = L["Determines how opaque or transparent the bar will appear while in combat"],
									min = 0,
									max = 1,
									step = 0.1,
									bigStep = 0.1,
									disabled = true,
									get = function() return Auras.db.char.config[3].manaBar.alphaCombat end,
									set = function(_, value)
										Auras.db.char.config[3].manaBar.alphaCombat = value
										CheckRestorationDefaultValues(res_options,'Mana Bar');
									end,
								},
								alphaOoC = {
									order = 5,
									type = "range",
									name = L["Alpha (OoC)"],
									desc = L["Determines how opaque or transparent the bar will appear when out of combat"],
									min = 0,
									max = 1,
									step = 0.1,
									bigStep = 0.1,
									--disabled = false,
									get = function() return Auras.db.char.config[3].manaBar.alphaOoC end,
									set = function(_, value)
										Auras.db.char.config[3].manaBar.alphaOoC = value
										CheckRestorationDefaultValues(res_options,'Mana Bar');
									end,
								},
								filler_1 = {
									order = 6,
									type = "description",
									name = '',
								},
								ManaBarWidth = {
									order = 7,
									type = "range",
									name = L["Bar Width"],
									desc = L["Changes the width of the Mana Bar. (Default is 260)"],
									min = 100,
									max = 300,
									step = 1,
									bigStep = 1,
									disabled = true,
									get = function() return Auras.db.char.layout[3].manaBar.width end,
									set = function(_, value)
										Auras.db.char.layout[3].manaBar.width = value;
										CheckRestorationDefaultValues(res_options,"Mana Bar");
										SSA.ManaBar:SetWidth(value);
									end,
								},
								ManaBarHeight = {
									order = 8,
									type = "range",
									name = L["Bar Height"],
									desc = L["Changes the height of the Mana Bar. (Default is 21)"],
									min = 10,
									max = 30,
									step = 1,
									bigStep = 1,
									disabled = true,
									get = function() return Auras.db.char.layout[3].manaBar.height end,
									set = function(_, value)
										Auras.db.char.layout[3].manaBar.height = value;
										CheckRestorationDefaultValues(res_options,"Mana Bar");
										SSA.ManaBar:SetHeight(value);
									end,
								},
								TextSize = {
									order = 9,
									type = "range",
									name = L["Text Size"],
									desc = L["Changes the size of the text. (Default is 12)"],
									min = 10,
									max = 30,
									step = 1,
									bigStep = 1,
									disabled = true,
									get = function() return Auras.db.char.layout[3].manaBar.textSize end,
									set = function(_, value)
										Auras.db.char.layout[3].manaBar.textSize = value;
										CheckRestorationDefaultValues(res_options,"Mana Shield");
										SSA.EarthenShieldTotemBar:SetHeight(value);
									end,
								},
								ManaBarPrecision = {
									order = 10,
									type = "select",
									name = L["Mana Precision"],
									desc = L["Set the aura orientation to horizontal or vertical."],
									get = function()
										res_options.args.config.args.manaBar.args.ManaBarPrecision.values = {
											["Long"] = tostring(Auras:ManaPrecision("Long")),
											["Short"] = tostring(Auras:ManaPrecision("Short")),
										}
										
										return Auras.db.char.config[3].manaBar.precision
									end,
									set = function(_, value)
										Auras.db.char.config[3].manaBar.precision = value;
										CheckRestorationDefaultValues(res_options,"Mana Bar");
										Auras:UpdateTalents();
									end,
									values = {
										["Long"] = tostring(Auras:ManaPrecision("Long")),
										["Short"] = tostring(Auras:ManaPrecision("Short")),
									}
								},
								ManaBarJustify = {
									order = 11,
									type = "select",
									name = L["Mana Value Justify"],
									desc = L["Set the position of the text on the mana bar."],
									get = function()
										return Auras.db.char.config[3].manaBar.justify
									end,
									set = function(_, value)
										Auras.db.char.config[3].manaBar.justify = value;
										CheckRestorationDefaultValues(res_options,"Mana Bar");
									end,
									values = {
										["Left"] = L["Left"],
										["Center"] = L["Center"],
										["Right"] = L["Right"],
									}
								},
								filler_2 = {
									order = 12,
									type = "description",
									name = '',
								},
								ResetManaBar = {
									order = 13,
									type = "execute",
									--name = "|cFFFFCC00"..L["Reset Mana Bar"].."|r",
									--disabled = false,
									name = L["Reset Mana Bar"],
									func = function()
										Auras.db.char.layout[3].manaBar.width = Auras.db.char.layout.default.LargeBar.width;
										Auras.db.char.layout[3].manaBar.height = Auras.db.char.layout.default.LargeBar.height
										Auras.db.char.layout[3].manaBar.textSize = Auras.db.char.layout.default.textSize
										
										Auras.db.char.config[3].manaBar.precision = Auras.db.char.config.default[3].manaBar.precision
										Auras.db.char.config[3].manaBar.grouping = Auras.db.char.config.default[3].manaBar.grouping
										Auras.db.char.config[3].manaBar.justify = Auras.db.char.config.default.justify
										Auras.db.char.config[3].manaBar.isDisplayText = Auras.db.char.config.default.isDisplayText
										Auras.db.char.config[3].manaBar.alphaCombat = Auras.db.char.config.default.alphaCombat
										Auras.db.char.config[3].manaBar.alphaOoC = Auras.db.char.config.default.alphaOoC
										
										res_options.args.config.args.manaBar.args.ManaBarPrecision.values = {
											["Long"] = tostring(Auras:ManaPrecision("Long")),
											["Short"] = tostring(Auras:ManaPrecision("Short")),
										}
										res_options.args.config.args.manaBar.args.ResetManaBar.disabled = true;
										res_options.args.config.args.manaBar.args.ResetManaBar.name = "|cFF666666"..L["Reset Mana Bar"].."|r"
										SSA.ManaBar:SetWidth(Auras.db.char.layout.default.LargeBar.width);
										SSA.ManaBar:SetHeight(Auras.db.char.layout.default.LargeBar.height);
									end,
								},
							},
						},
					},
				},
				layout = {
					name = L["Layout"],
					order = 2,
					type = "group",
					disabled = true,
					args = {
						MoveAuras = {
							order = 1,
							type = "execute",
							name = "|cFFFFCC00"..L["Move Restoration Auras"].."|r",
							func = function()
								Auras.db.char.config[3].isMoving = true;
								Auras:InitMoveAuraGroups(SSA.AuraObjectsRes,"Res")
							end,
						},
						ResetAuras = {
							order = 2,
							type = "execute",
							name = "|cFFFFCC00"..L["Reset Restoration Auras"].."|r",
							func = function()
								Auras:ResetAuraGroups(Auras.db.char.frames.defaultPos.resGrp,Auras.db.char.frames.resGrp)
							end,
						},
						primaryDesc = {
							order = 3,
							type = "description",
							name = L["Primary Auras"],
						},
						PrimaryOrientation1 = {
							order = 4,
							type = "select",
							name = L["Primary Orientation 1"],
							desc = L["Set the aura orientation to horizontal or vertical."],
							get = function()
								return Auras.db.char.layout[3].orientation.top
							end,
							set = function(_, value)
								Auras.db.char.layout[3].orientation.top = value;
								CheckRestorationDefaultValues(res_options,"Primary");
								Auras:UpdateTalents();
							end,
							values = {
								["Horizontal"] = L["Horizontal"],
								["Vertical"] = L["Vertical"],
							},
						},
						PrimaryOrientation2 = {
							order = 5,
							type = "select",
							name = L["Primary Orientation 2"],
							desc = L["Set the aura orientation to horizontal or vertical."],
							get = function()
								return Auras.db.char.layout[3].orientation.bottom
							end,
							set = function(_, value)
								Auras.db.char.layout[3].orientation.bottom = value;
								CheckRestorationDefaultValues(res_options,"Primary");
								Auras:UpdateTalents();
							end,
							values = {
								["Horizontal"] = L["Horizontal"],
								["Vertical"] = L["Vertical"],
							},
						},
						filler_0 = {
							order = 6,
							type = "description",
							name = ' ',
						},
						AuraSizeRow1 = {
							order = 7,
							type = "range",
							name = L["Primary Size 1"],
							desc = L["Determines the size of primary auras in row 1. (Default is 32)"],
							min = 16,
							max = 256,
							step = 1,
							bigStep = 1,
							get = function() return Auras.db.char.layout[3].primary.top.icon end,
							set = function(_, value)
								Auras.db.char.layout[3].primary.top.icon = value;
								CheckRestorationDefaultValues(res_options,"Primary");
								Auras:UpdateTalents();
							end,
						},
						AuraSpacingRow1 = {
							order = 8,
							type = "range",
							name = L["Primary Spacing 1"],
							desc = L["Determines the spacing of the primary auras in row 1. (Default is 50)"],
							min = 32,
							max = 300,
							step = 1,
							bigStep = 1,
							get = function() return Auras.db.char.layout[3].primary.top.spacing end,
							set = function(_, value)
								Auras.db.char.layout[3].primary.top.spacing = value;
								CheckRestorationDefaultValues(res_options,"Primary");
								Auras:UpdateTalents();
							end,
						},
						AuraChargesRow1 = {
							order = 9,
							type = "range",
							name = L["Primary Charges 1"],
							desc = L["Determines the size of the primary charge text in row 1. (Default is 13.5)"],
							min = 10,
							max = 60,
							step = 0.5,
							bigStep = 0.5,
							get = function() return Auras.db.char.layout[3].primary.top.charges end,
							set = function(_, value)
								Auras.db.char.layout[3].primary.top.charges = value;
								CheckRestorationDefaultValues(res_options,"Primary");
								Auras:UpdateTalents();
							end,
						},
						filler_1 = {
							order = 10,
							type = "description",
							name = ' ',
						},
						AuraSizeRow2 = {
							order = 11,
							type = "range",
							name = L["Primary Size 2"],
							desc = L["Determines the size of primary auras in row 2. (Default is 32)"],
							min = 16,
							max = 256,
							step = 1,
							bigStep = 1,
							get = function() return Auras.db.char.layout[3].primary.bottom.icon end,
							set = function(_, value)
								Auras.db.char.layout[3].primary.bottom.icon = value;
								CheckRestorationDefaultValues(res_options,"Primary");
								Auras:UpdateTalents();
							end,
						},
						AuraSpacingRow2 = {
							order = 12,
							type = "range",
							name = L["Primary Spacing 2"],
							desc = L["Determines the spacing of the primary auras in row 2. (Default is 50)"],
							min = 32,
							max = 300,
							step = 1,
							bigStep = 1,
							get = function() return Auras.db.char.layout[3].primary.bottom.spacing end,
							set = function(_, value)
								Auras.db.char.layout[3].primary.bottom.spacing = value;
								CheckRestorationDefaultValues(res_options,"Primary");
								Auras:UpdateTalents();
							end,
						},
						filler_2 = {
							order = 13,
							type = "description",
							name = ' ',
						},
						ResetPrimaryLayout = {
							order = 14,
							type = "execute",
							--name = "|cFFFFCC00"..L["Reset Primary Layout"].."|r",
							--disabled = false,
							name = L["Reset Primary Layout"],
							func = function()
								Auras.db.char.layout[3].orientation.top = Auras.db.char.layout.default.orientation.top
								Auras.db.char.layout[3].orientation.bottom = Auras.db.char.layout.default.orientation.bottom
								Auras.db.char.layout[3].primary.top.icon = Auras.db.char.layout.default.primary.top.icon
								Auras.db.char.layout[3].primary.top.spacing = Auras.db.char.layout.default.primary.top.spacing
								Auras.db.char.layout[3].primary.top.charges = Auras.db.char.layout.default.primary.top.charges
								Auras.db.char.layout[3].primary.bottom.icon = Auras.db.char.layout.default.primary.bottom.icon
								Auras.db.char.layout[3].primary.bottom.spacing = Auras.db.char.layout.default.primary.bottom.spacing
								res_options.args.layout.args.ResetPrimaryLayout.disabled = true;
								res_options.args.layout.args.ResetPrimaryLayout.name = "|cFF666666"..L["Reset Primary Layout"].."|r";
								Auras:UpdateTalents();
							end,
						},
						filler_3 = {
							order = 15,
							type = "description",
							name = ' ',
						},
						filler_4 = {
							order = 16,
							type = "description",
							name = ' ',
						},
						secondaryDesc = {
							order = 17,
							type = "description",
							name = L["Secondary Auras"],
						},
						SecondaryOrientation1 = {
							order = 18,
							type = "select",
							name = L["Secondary Orientation 1"],
							desc = L["Set the aura orientation to horizontal or vertical."],
							get = function()
								return Auras.db.char.layout[3].orientation.left
							end,
							set = function(_, value)
								Auras.db.char.layout[3].orientation.left = value;
								CheckRestorationDefaultValues(res_options,"Secondary");
								Auras:UpdateTalents();
							end,
							values = {
								["Horizontal"] = L["Horizontal"],
								["Vertical"] = L["Vertical"],
							},
						},
						SecondaryOrientation2 = {
							order = 19,
							type = "select",
							name = L["Secondary Orientation 2"],
							desc = L["Set the aura orientation to horizontal or vertical."],
							get = function()
								return Auras.db.char.layout[3].orientation.right
							end,
							set = function(_, value)
								Auras.db.char.layout[3].orientation.right = value;
								CheckRestorationDefaultValues(res_options,"Secondary");
								Auras:UpdateTalents();
							end,
							values = {
								["Horizontal"] = L["Horizontal"],
								["Vertical"] = L["Vertical"],
							},
						},
						filler_5 = {
							order = 20,
							type = "description",
							name = ' ',
						},
						AuraSizeCol1 = {
							order = 21,
							type = "range",
							name = L["Secondary Size 1"],
							desc = L["Determines the size of secondary auras in column 1. (Default is 25)"],
							min = 16,
							max = 256,
							step = 1,
							bigStep = 1,
							get = function() return Auras.db.char.layout[3].secondary.left.icon end,
							set = function(_, value)
								Auras.db.char.layout[3].secondary.left.icon = value;
								CheckRestorationDefaultValues(res_options,"Secondary");
								Auras:UpdateTalents();
							end,
						},
						AuraSpacingCol1 = {
							order = 22,
							type = "range",
							name = L["Secondary Spacing 1"],
							desc = L["Determines the spacing of the secondary auras in column 1. (Default is 30)"],
							min = 32,
							max = 300,
							step = 1,
							bigStep = 1,
							get = function() return Auras.db.char.layout[3].secondary.left.spacing end,
							set = function(_, value)
								Auras.db.char.layout[3].secondary.left.spacing = value;
								CheckRestorationDefaultValues(res_options,"Secondary");
								Auras:UpdateTalents();
							end,
						},
						filler_6 = {
							order = 23,
							type = "description",
							name = ' ',
						},
						AuraSizeCol2 = {
							order = 24,
							type = "range",
							name = L["Secondary Size 2"],
							desc = L["Determines the size of secondary auras in column 2. (Default is 25)"],
							min = 16,
							max = 256,
							step = 1,
							bigStep = 1,
							get = function() return Auras.db.char.layout[3].secondary.right.icon end,
							set = function(_, value)
								Auras.db.char.layout[3].secondary.right.icon = value;
								CheckRestorationDefaultValues(res_options,"Secondary");
								Auras:UpdateTalents();
							end,
						},
						AuraSpacingCol2 = {
							order = 25,
							type = "range",
							name = L["Secondary Spacing 2"],
							desc = L["Determines the spacing of the secondary auras in column 2. (Default is 30)"],
							min = 30,
							max = 300,
							step = 1,
							bigStep = 1,
							get = function() return Auras.db.char.layout[3].secondary.right.spacing end,
							set = function(_, value)
								Auras.db.char.layout[3].secondary.right.spacing = value;
								CheckRestorationDefaultValues(res_options,"Secondary");
								Auras:UpdateTalents();
							end,
						},
						AuraChargesCol2 = {
							order = 26,
							type = "range",
							name = L["Secondary Charges 2"],
							desc = L["Determines the size of the secondary charge text in column 2. (Default is 13.5)"],
							min = 10,
							max = 60,
							step = 0.5,
							bigStep = 0.5,
							get = function() return Auras.db.char.layout[3].secondary.right.charges end,
							set = function(_, value)
								Auras.db.char.layout[3].secondary.right.charges = value;
								CheckRestorationDefaultValues(res_options,"Secondary");
								Auras:UpdateTalents();
							end,
						},
						--[[filler_4 = {
							order = 17,
							type = "description",
							name = ' ',
						},]]
						ResetSecondaryLayout = {
							order = 27,
							type = "execute",
							--name = "|cFFFFCC00"..L["Reset Secondary Layout"].."|r",
							--disabled = false,
							name = L["Reset Secondary Layout"],
							func = function()
								Auras.db.char.layout[3].orientation.left = Auras.db.char.layout.default.orientation.left
								Auras.db.char.layout[3].orientation.right = Auras.db.char.layout.default.orientation.right
								Auras.db.char.layout[3].secondary.left.icon = Auras.db.char.layout.default.secondary.left.icon
								Auras.db.char.layout[3].secondary.left.spacing = Auras.db.char.layout.default.secondary.left.spacing
								Auras.db.char.layout[3].secondary.right.icon = Auras.db.char.layout.default.secondary.right.icon
								Auras.db.char.layout[3].secondary.right.spacing = Auras.db.char.layout.default.secondary.right.spacing
								Auras.db.char.layout[3].secondary.right.charges = Auras.db.char.layout.default.secondary.right.charges
								res_options.args.layout.args.ResetSecondaryLayout.disabled = true;
								res_options.args.layout.args.ResetSecondaryLayout.name = "|cFF666666"..L["Reset Secondary Layout"].."|r";
								Auras:UpdateTalents();
							end,
						},
					},
				},
			},
		}
	end
	return res_options;
end

function Auras:SetupOptions()
	local ACFG = LibStub("AceConfig-3.0")
	ACFG:RegisterOptionsTable("ShamanAuras Elemental Auras", GetElementalOptions)
	ACFG:RegisterOptionsTable("ShamanAuras Enhancement Auras", GetEnhancementOptions)
	ACFG:RegisterOptionsTable("ShamanAuras Restoration Auras", GetRestorationOptions)
	--ACFG:RegisterOptionsTable("ShamanAuras Settings", GetSettingsOptions)

	local ACD = LibStub("AceConfigDialog-3.0")
	ACD:AddToBlizOptions("ShamanAuras Elemental Auras", L["Elemental Auras"], "ShamanAuras")
	ACD:AddToBlizOptions("ShamanAuras Enhancement Auras", L["Enhancement Auras"], "ShamanAuras")
	ACD:AddToBlizOptions("ShamanAuras Restoration Auras", L["Restoration Auras"], "ShamanAuras")
	--ACD:AddToBlizOptions("ShamanAuras Settings", L["Settings"], "ShamanAuras")
end

local function ToggleHasteBars(options,bloodlust,heroism)
	options.args.display.args.ProgressBars.args.BuffTimerBars.args.Bloodlust.hidden = bloodlust;
	options.args.display.args.ProgressBars.args.BuffTimerBars.args.Heroism.hidden = heroism;
end



function Auras:UpdateInterfaceSettings()
	local spec = GetSpecialization();
	local factionGroup = UnitFactionGroup('player');

	if (factionGroup == "Horde") then
		ToggleHasteBars(GetElementalOptions(),false,true)
		ToggleHasteBars(GetEnhancementOptions(),false,true)
		ToggleHasteBars(GetRestorationOptions(),false,true)
	elseif (factionGroup == "Alliance") then
		ToggleHasteBars(GetElementalOptions(),true,false)
		ToggleHasteBars(GetEnhancementOptions(),true,false)
		ToggleHasteBars(GetRestorationOptions(),true,false)
	end
	
	if (spec == 1) then
		CheckElementalDefaultValues(ele_options,'Cooldowns');
		CheckElementalDefaultValues(ele_options,'Maelstrom','All');
		CheckElementalDefaultValues(ele_options,'Triggers');
		CheckElementalDefaultValues(ele_options,'Primary');
		CheckElementalDefaultValues(ele_options,'Secondary');
		CheckElementalDefaultValues(ele_options,'Icefury','Alpha');
		
		ele_options.args.config.disabled = false;
		ele_options.args.layout.disabled = false;
		enh_options.args.config.disabled = true;
		enh_options.args.layout.disabled = true;
		res_options.args.config.disabled = true;
		res_options.args.layout.disabled = true;
	elseif (spec == 2) then
		CheckEnhancementDefaultValues(enh_options,'Cooldowns');
		CheckEnhancementDefaultValues(enh_options,'Maelstrom','All');
		CheckEnhancementDefaultValues(enh_options,'Triggers');
		CheckEnhancementDefaultValues(enh_options,'Primary');
		CheckEnhancementDefaultValues(enh_options,'Secondary');
		
		ele_options.args.config.disabled = true;
		ele_options.args.layout.disabled = true;
		enh_options.args.config.disabled = false;
		enh_options.args.layout.disabled = false;
		res_options.args.config.disabled = true;
		res_options.args.layout.disabled = true;
	elseif (spec == 3) then
		CheckRestorationDefaultValues(res_options,'Cooldowns');
		CheckRestorationDefaultValues(res_options,'Triggers');
		CheckRestorationDefaultValues(res_options,'Primary');
		CheckRestorationDefaultValues(res_options,'Secondary');
		CheckRestorationDefaultValues(res_options,'Earthen Shield');
		CheckRestorationDefaultValues(res_options,'Mana Bar');
		CheckRestorationDefaultValues(res_options,'Tidal Waves');
		
		ele_options.args.config.disabled = true;
		ele_options.args.layout.disabled = true;
		enh_options.args.config.disabled = true;
		enh_options.args.layout.disabled = true;
		res_options.args.config.disabled = false;
		res_options.args.layout.disabled = false;
	end
	
end

InterfaceOptionsFrame:HookScript("OnShow",function(self)
	Auras:UpdateInterfaceSettings();
end);

