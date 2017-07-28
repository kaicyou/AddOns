local FOLDER_NAME, SSA = ...
local version = GetAddOnMetadata(FOLDER_NAME,"Version")
local L = LibStub("AceLocale-3.0"):GetLocale("ShamanAuras", true)
local Auras = LibStub("AceAddon-3.0"):GetAddon("ShamanAuras")
local LSM = LibStub("LibSharedMedia-3.0")

local function SetBarValues(isNameText,isTimeText,obj,text1,text2)
	if (isNameText and isTimeText) then
		obj.values = {
			[text1.." Text"] = L[text1.." Text"],
			[text2.." Text"] = L[text2.." Text"],
		}
	elseif (isNameText and not isTimeText) then
		obj.values = {
			[text1.." Text"] = L[text1.." Text"],
		}
	elseif  (not isNameText and isTimeText) then
		obj.values = {
			[text2.." Text"] = L[text2.." Text"],
		}
	else
		obj.hidden = true
	end
end

local TimeClock = CreateFrame("Frame")
local function CheckElementalDefaultValues(options,group,subgroup)
	local general = options.args.config.args.general.args
	local maelstrom = options.args.config.args.maelstromBar.args
	local castBar = options.args.config.args.castBar.args
	local icefuryBar = options.args.config.args.icefuryBar.args
	
	
	if (group == "Cooldowns") then
		if (Auras.db.char.config[1].cooldown.sweep) then
			general.cooldown.args.inverse.disabled = false
		else
			general.cooldown.args.inverse.disabled = true
		end
	elseif (group == "Cast" or group == "Channel") then
		local db = Auras.db.char
		local bar = db.elements[1].statusbars[subgroup]
		local default = db.elements.defaults[1].statusbars[subgroup]
		
		local option = options.args.config.args[subgroup].args
		
		if (bar.adjust.isEnabled) then
			option.iconSpark.disabled = false
			if (bar.nametext.isDisplayText) then
				option.nametext.disabled = false
			else
				option.nametext.disabled = true
			end

			if (bar.timetext.isDisplayText) then
				option.timetext.disabled = false
			else
				option.timetext.disabled = true
			end
			
			if (bar.nametext.font.shadow.isEnabled and bar.nametext.isDisplayText) then
				option.nametext.args.shadow.args.shadowColor.disabled = false
				option.nametext.args.shadow.args.shadowX.disabled = false
				option.nametext.args.shadow.args.shadowY.disabled = false
			else
				option.nametext.args.shadow.args.shadowColor.disabled = true
				option.nametext.args.shadow.args.shadowX.disabled = true
				option.nametext.args.shadow.args.shadowY.disabled = true
			end
			
			if (bar.timetext.font.shadow.isEnabled and bar.timetext.isDisplayText) then
				option.timetext.args.shadow.args.shadowColor.disabled = false
				option.timetext.args.shadow.args.shadowX.disabled = false
				option.timetext.args.shadow.args.shadowY.disabled = false
			else
				option.timetext.args.shadow.args.shadowColor.disabled = true
				option.timetext.args.shadow.args.shadowX.disabled = true
				option.timetext.args.shadow.args.shadowY.disabled = true
			end
			
			if (bar.adjust.showBG) then
				option.layout.args.backgroundColor.disabled = false
				option.layout.args.backgroundTexture.disabled = false
			else
				option.layout.args.backgroundColor.disabled = true
				option.layout.args.backgroundTexture.disabled = true
			end
		
			option.layout.disabled = false
		else
			option.iconSpark.disabled = true
			option.nametext.disabled = true
			option.nametext.args.shadow.args.shadowColor.disabled = true
			option.nametext.args.shadow.args.shadowX.disabled = true
			option.nametext.args.shadow.args.shadowY.disabled = true
			option.timetext.disabled = true
			option.timetext.args.shadow.args.shadowColor.disabled = true
			option.timetext.args.shadow.args.shadowX.disabled = true
			option.timetext.args.shadow.args.shadowY.disabled = true
			option.layout.args.backgroundColor.disabled = true
			option.layout.args.backgroundTexture.disabled = true
			option.layout.disabled = true
		end		

		if (bar.icon.isEnabled and bar.adjust.isEnabled) then
			option.iconSpark.args.iconJustify.disabled = false
		else
			option.iconSpark.args.iconJustify.disabled = true
		end

		if (bar.alphaCombat ~= default.alphaCombat or
			bar.alphaOoC ~= default.alphaOoC or
			
			not bar.nametext.isDisplayText or
			bar.nametext.x ~= default.nametext.x or
			bar.nametext.y ~= default.nametext.y or
			bar.nametext.font.name ~= default.nametext.font.name or
			bar.nametext.font.size ~= default.nametext.font.size or
			bar.nametext.font.flag ~= default.nametext.font.flag or
			bar.nametext.font.color.r ~= default.nametext.font.color.r or
			bar.nametext.font.color.g ~= default.nametext.font.color.g or
			bar.nametext.font.color.b ~= default.nametext.font.color.b or
			bar.nametext.font.color.a ~= default.nametext.font.color.a or
			bar.nametext.font.shadow.isEnabled or
			bar.nametext.font.shadow.offset.x ~= default.nametext.font.shadow.offset.x or
			bar.nametext.font.shadow.offset.y ~= default.nametext.font.shadow.offset.y or
			bar.nametext.font.shadow.color.r ~= default.nametext.font.shadow.color.r or
			bar.nametext.font.shadow.color.g ~= default.nametext.font.shadow.color.g or
			bar.nametext.font.shadow.color.b ~= default.nametext.font.shadow.color.b or
			bar.nametext.font.shadow.color.a ~= default.nametext.font.shadow.color.a or
			bar.nametext.justify ~= default.nametext.justify or
			
			not bar.timetext.isDisplayText or
			bar.timetext.x ~= default.timetext.x or
			bar.timetext.y ~= default.timetext.y or
			bar.timetext.font.name ~= default.timetext.font.name or
			bar.timetext.font.size ~= default.timetext.font.size or
			bar.timetext.font.flag ~= default.timetext.font.flag or
			bar.timetext.font.shadow.isEnabled or
			bar.timetext.font.shadow.offset.x ~= default.timetext.font.shadow.offset.x or
			bar.timetext.font.shadow.offset.y ~= default.timetext.font.shadow.offset.y or
			bar.timetext.font.shadow.color.r ~= default.timetext.font.shadow.color.r or
			bar.timetext.font.shadow.color.g ~= default.timetext.font.shadow.color.g or
			bar.timetext.font.shadow.color.b ~= default.timetext.font.shadow.color.b or
			bar.timetext.font.shadow.color.a ~= default.timetext.font.shadow.color.a or
			bar.timetext.font.color.r ~= default.timetext.font.color.r or
			bar.timetext.font.color.g ~= default.timetext.font.color.g or
			bar.timetext.font.color.b ~= default.timetext.font.color.b or
			bar.timetext.font.color.a ~= default.timetext.font.color.a or
			bar.timetext.justify ~= default.timetext.justify or
			
			bar.background.texture ~= default.background.texture or
			bar.background.color.r ~= default.background.color.r or
			bar.background.color.g ~= default.background.color.g or
			bar.background.color.b ~= default.background.color.b or
			bar.background.color.a ~= default.background.color.a or
			
			not bar.icon.isEnabled or
			bar.icon.justify ~= default.icon.justify or
			not bar.spark or
			
			bar.foreground.color.r ~= default.foreground.color.r or
			bar.foreground.color.g ~= default.foreground.color.g or
			bar.foreground.color.b ~= default.foreground.color.b or
			bar.foreground.texture ~= default.foreground.texture or
			
			bar.layout.width ~= default.layout.width or
			bar.layout.height ~= default.layout.height or
			bar.layout.strata ~= default.layout.strata) then
			option.reset.disabled = false
			option.reset.name = "|cFFFFCC00"..L["Reset "..group.." Bar"].."|r"
		else
			option.reset.disabled = true
			option.reset.name = "|cFF666666"..L["Reset "..group.." Bar"].."|r"
		end
	elseif (group == "Maelstrom") then
		local db = Auras.db.char
		local bar = db.elements[1].statusbars.maelstromBar
		local default = db.elements.defaults[1].statusbars.maelstromBar
		local option = options.args.config.args.maelstromBar.args
		
		if (bar.adjust.isEnabled) then
			if (bar.text.isDisplayText) then
				option.text.disabled = false
			else
				option.text.disabled = true
			end
			
			if (bar.text.font.shadow.isEnabled and bar.text.isDisplayText) then
				option.text.args.shadow.args.shadowColor.disabled = false
				option.text.args.shadow.args.shadowX.disabled = false
				option.text.args.shadow.args.shadowY.disabled = false
			else
				option.text.args.shadow.args.shadowColor.disabled = true
				option.text.args.shadow.args.shadowX.disabled = true
				option.text.args.shadow.args.shadowY.disabled = true
			end
		
			if (bar.adjust.showBG) then
				option.layout.args.backgroundColor.disabled = false
				option.layout.args.backgroundTexture.disabled = false
			else
				option.layout.args.backgroundColor.disabled = true
				option.layout.args.backgroundTexture.disabled = true
			end
			
			option.layout.disabled = false
		else
			option.text.disabled = true
			option.text.args.shadow.args.shadowColor.disabled = true
			option.text.args.shadow.args.shadowX.disabled = true
			option.text.args.shadow.args.shadowY.disabled = true
			option.layout.args.backgroundColor.disabled = true
			option.layout.args.backgroundTexture.disabled = true
			option.layout.disabled = true
		end		

		if (bar.isEnabled) then
			options.args.config.args.maelstromBar.disabled = false
		else
			options.args.config.args.maelstromBar.disabled = true
		end

		option.general.args.threshold.max = UnitPowerMax('player',11)
		
		if (bar.alphaCombat ~= default.alphaCombat or
			bar.alphaOoC ~= default.alphaOoC or
			bar.alphaTar ~= default.alphaTar or
			bar.threshold ~= default.threshold or
			not bar.animate or
			
			not bar.text.isDisplayText or
			bar.text.x ~= default.text.x or
			bar.text.y ~= default.text.y or
			bar.text.font.name ~= default.text.font.name or
			bar.text.font.size ~= default.text.font.size or
			bar.text.font.flag ~= default.text.font.flag or
			bar.text.font.color.r ~= default.text.font.color.r or
			bar.text.font.color.g ~= default.text.font.color.g or
			bar.text.font.color.b ~= default.text.font.color.b or
			bar.text.font.color.a ~= default.text.font.color.a or
			bar.text.font.shadow.isEnabled or
			bar.text.font.shadow.offset.x ~= default.text.font.shadow.offset.x or
			bar.text.font.shadow.offset.y ~= default.text.font.shadow.offset.y or
			bar.text.font.shadow.color.r ~= default.text.font.shadow.color.r or
			bar.text.font.shadow.color.g ~= default.text.font.shadow.color.g or
			bar.text.font.shadow.color.b ~= default.text.font.shadow.color.b or
			bar.text.font.shadow.color.a ~= default.text.font.shadow.color.a or
			bar.text.justify ~= default.text.justify or
			
			bar.background.texture ~= default.background.texture or
			bar.background.color.r ~= default.background.color.r or
			bar.background.color.g ~= default.background.color.g or
			bar.background.color.b ~= default.background.color.b or
			bar.background.color.a ~= default.background.color.a or
			
			bar.foreground.color.r ~= default.foreground.color.r or
			bar.foreground.color.g ~= default.foreground.color.g or
			bar.foreground.color.b ~= default.foreground.color.b or
			bar.foreground.texture ~= default.foreground.texture or
			
			bar.layout.width ~= default.layout.width or
			bar.layout.height ~= default.layout.height or
			bar.layout.strata ~= default.layout.strata) then
			option.reset.disabled = false
			option.reset.name = "|cFFFFCC00"..L["Reset Maelstrom Bar"].."|r"
		else
			option.reset.disabled = true
			option.reset.name = "|cFF666666"..L["Reset Maelstrom Bar"].."|r"
		end
	elseif (group == 'Settings') then
		local db = Auras.db.char
		local settings = db.settings[1]
		local defaults = Auras.db.char.settings.defaults
		local option = options.args.config.args.general.args.settings.args
		
		if (settings.OoCAlpha ~= defaults.OoCAlpha or 
			settings.flameShock ~= defaults[1].flameShock or 
			settings.totemMastery ~= defaults[1].totemMastery or 
			settings.OoRColor.r ~= defaults.OoRColor.r or 
			settings.OoRColor.g ~= defaults.OoRColor.g or 
			settings.OoRColor.b ~= defaults.OoRColor.b or 
			settings.OoRColor.a ~= defaults.OoRColor.a) then
			option.reset.disabled = false
			option.reset.name = "|cFFFFCC00"..L["Reset Settings Values"].."|r"
		else
			option.reset.disabled = true
			option.reset.name = "|cFF666666"..L["Reset Settings Values"].."|r"
		end
	elseif (group == "Primary") then
		local db = Auras.db.char
		local layout = db.layout[1]
		local defaults = db.layout.defaults
		
		if (layout.orientation.top ~= defaults.orientation.top or
			layout.orientation.bottom ~= defaults.orientation.bottom or
			layout.primary.top.icon ~= defaults.primary.top.icon or
			layout.primary.top.spacing ~= defaults.primary.top.spacing or
			layout.primary.top.charges ~= defaults.primary.top.charges or
			layout.primary.bottom.icon ~= defaults.primary.bottom.icon or
			layout.primary.bottom.spacing ~= defaults.primary.bottom.spacing) then
			options.args.layout.args.primaryAuras.args.ResetPrimaryLayout.disabled = false
			options.args.layout.args.primaryAuras.args.ResetPrimaryLayout.name = "|cFFFFCC00"..L["Reset Primary Layout"].."|r"
		else
			options.args.layout.args.primaryAuras.args.ResetPrimaryLayout.disabled = true
			options.args.layout.args.primaryAuras.args.ResetPrimaryLayout.name = "|cFF666666"..L["Reset Primary Layout"].."|r"
		end
	elseif (group == "Secondary") then
		local db = Auras.db.char
		local layout = db.layout[1]
		local defaults = db.layout.defaults
	
		if (layout.orientation.left ~= defaults.orientation.left or
			layout.orientation.right ~= defaults.orientation.right or
			layout.secondary.left.icon ~= defaults.secondary.left.icon or
			layout.secondary.left.spacing ~= defaults.secondary.left.spacing or
			layout.secondary.right.icon ~= defaults.secondary.right.icon or
			layout.secondary.right.spacing ~= defaults.secondary.right.spacing) then
			options.args.layout.args.secondaryAuras.args.ResetSecondaryLayout.disabled = false
			options.args.layout.args.secondaryAuras.args.ResetSecondaryLayout.name = "|cFFFFCC00"..L["Reset Secondary Layout"].."|r"
		else
			options.args.layout.args.secondaryAuras.args.ResetSecondaryLayout.disabled = true
			options.args.layout.args.secondaryAuras.args.ResetSecondaryLayout.name = "|cFF666666"..L["Reset Secondary Layout"].."|r"
		end
	elseif (group == "Icefury") then
		local db = Auras.db.char
		local bar = db.elements[1].statusbars.icefuryBar
		local default = db.elements.defaults[1].statusbars.icefuryBar

		local option = options.args.config.args.icefuryBar.args
		
		if (bar.adjust.isEnabled) then
			if (bar.counttext.isDisplayText) then
				option.counttext.disabled = false
			else
				option.counttext.disabled = true
			end

			if (bar.timetext.isDisplayText) then
				option.timetext.disabled = false
			else
				option.timetext.disabled = true
			end
			
			if (bar.counttext.font.shadow.isEnabled and bar.counttext.isDisplayText) then
				option.counttext.args.shadow.args.shadowColor.disabled = false
				option.counttext.args.shadow.args.shadowX.disabled = false
				option.counttext.args.shadow.args.shadowY.disabled = false
			else
				option.counttext.args.shadow.args.shadowColor.disabled = true
				option.counttext.args.shadow.args.shadowX.disabled = true
				option.counttext.args.shadow.args.shadowY.disabled = true
			end
			
			if (bar.timetext.font.shadow.isEnabled and bar.timetext.isDisplayText) then
				option.timetext.args.shadow.args.shadowColor.disabled = false
				option.timetext.args.shadow.args.shadowX.disabled = false
				option.timetext.args.shadow.args.shadowY.disabled = false
			else
				option.timetext.args.shadow.args.shadowColor.disabled = true
				option.timetext.args.shadow.args.shadowX.disabled = true
				option.timetext.args.shadow.args.shadowY.disabled = true
			end
		
			if (bar.adjust.showTimer) then
				option.layout.args.timerColor.disabled = false
				option.layout.args.timerTexture.disabled = false
			else
				option.layout.args.timerColor.disabled = true
				option.layout.args.timerTexture.disabled = true
			end
			
			if (bar.adjust.showBG) then
				option.layout.args.backgroundColor.disabled = false
				option.layout.args.backgroundTexture.disabled = false
			else
				option.layout.args.backgroundColor.disabled = true
				option.layout.args.backgroundTexture.disabled = true
			end
			
			option.layout.disabled = false
		else
			option.counttext.disabled = true
			option.counttext.args.shadow.args.shadowColor.disabled = true
			option.counttext.args.shadow.args.shadowX.disabled = true
			option.counttext.args.shadow.args.shadowY.disabled = true
			option.timetext.disabled = true
			option.timetext.args.shadow.args.shadowColor.disabled = true
			option.timetext.args.shadow.args.shadowX.disabled = true
			option.timetext.args.shadow.args.shadowY.disabled = true
			option.layout.args.timerColor.disabled = true
			option.layout.args.timerTexture.disabled = true
			option.layout.args.backgroundColor.disabled = true
			option.layout.args.backgroundTexture.disabled = true
			option.layout.disabled = true
		end	

		if (bar.isEnabled) then
			options.args.config.args.icefuryBar.disabled = false
		else
			options.args.config.args.icefuryBar.disabled = true
		end
		
		if (bar.alphaCombat ~= default.alphaCombat or
			bar.alphaOoC ~= default.alphaOoC or
			bar.alphaTar ~= default.alphaTar or
			
			not bar.counttext.isDisplayText or
			bar.counttext.x ~= default.counttext.x or
			bar.counttext.y ~= default.counttext.y or
			bar.counttext.font.name ~= default.counttext.font.name or
			bar.counttext.font.size ~= default.counttext.font.size or
			bar.counttext.font.flag ~= default.counttext.font.flag or
			bar.counttext.font.color.r ~= default.counttext.font.color.r or
			bar.counttext.font.color.g ~= default.counttext.font.color.g or
			bar.counttext.font.color.b ~= default.counttext.font.color.b or
			bar.counttext.font.color.a ~= default.counttext.font.color.a or
			bar.counttext.font.shadow.isEnabled or
			bar.counttext.font.shadow.offset.x ~= default.counttext.font.shadow.offset.x or
			bar.counttext.font.shadow.offset.y ~= default.counttext.font.shadow.offset.y or
			bar.counttext.font.shadow.color.r ~= default.counttext.font.shadow.color.r or
			bar.counttext.font.shadow.color.g ~= default.counttext.font.shadow.color.g or
			bar.counttext.font.shadow.color.b ~= default.counttext.font.shadow.color.b or
			bar.counttext.font.shadow.color.a ~= default.counttext.font.shadow.color.a or
			bar.counttext.justify ~= default.counttext.justify or
			
			not bar.timetext.isDisplayText or 
			bar.timetext.x ~= default.timetext.x or
			bar.timetext.y ~= default.timetext.y or
			bar.timetext.font.name ~= default.timetext.font.name or
			bar.timetext.font.size ~= default.timetext.font.size or
			bar.timetext.font.flag ~= default.timetext.font.flag or
			bar.timetext.font.color.r ~= default.timetext.font.color.r or
			bar.timetext.font.color.g ~= default.timetext.font.color.g or
			bar.timetext.font.color.b ~= default.timetext.font.color.b or
			bar.timetext.font.color.a ~= default.timetext.font.color.a or
			bar.timetext.font.shadow.isEnabled or
			bar.timetext.font.shadow.offset.x ~= default.timetext.font.shadow.offset.x or
			bar.timetext.font.shadow.offset.y ~= default.timetext.font.shadow.offset.y or
			bar.timetext.font.shadow.color.r ~= default.timetext.font.shadow.color.r or
			bar.timetext.font.shadow.color.g ~= default.timetext.font.shadow.color.g or
			bar.timetext.font.shadow.color.b ~= default.timetext.font.shadow.color.b or
			bar.timetext.font.shadow.color.a ~= default.timetext.font.shadow.color.a or
			bar.timetext.justify ~= default.timetext.justify or
			
			bar.background.texture ~= default.background.texture or
			bar.background.color.r ~= default.background.color.r or
			bar.background.color.g ~= default.background.color.g or
			bar.background.color.b ~= default.background.color.b or
			bar.background.color.a ~= default.background.color.a or
			
			bar.timerBar.color.r ~= default.timerBar.color.r or
			bar.timerBar.color.g ~= default.timerBar.color.g or
			bar.timerBar.color.b ~= default.timerBar.color.b or
			bar.timerBar.color.a ~= default.timerBar.color.a or
			bar.timerBar.texture ~= default.timerBar.texture or
										
			bar.foreground.color.r ~= default.foreground.color.r or
			bar.foreground.color.g ~= default.foreground.color.g or
			bar.foreground.color.b ~= default.foreground.color.b or
			bar.foreground.texture ~= default.foreground.texture or
			
			bar.layout.width ~= default.layout.width or
			bar.layout.height ~= default.layout.height or
			bar.layout.strata ~= default.layout.strata) then
			option.reset.disabled = false
			option.reset.name = "|cFFFFCC00"..L["Reset Icefury Bar"].."|r"
		else
			option.reset.disabled = true
			option.reset.name = "|cFF666666"..L["Reset Icefury Bar"].."|r"
		end
	end
end

local function CheckEnhancementDefaultValues(options,group,subgroup)
	if (group == "Cooldowns") then
		if (Auras.db.char.elements[2].cooldowns.sweep) then
			options.args.config.args.general.args.cooldown.args.inverse.disabled = false
		else
			options.args.config.args.general.args.cooldown.args.inverse.disabled = true
		end
	elseif (group == "Cast" or group == "Channel") then
		local db = Auras.db.char
		local bar = db.elements[2].statusbars[subgroup]
		local default = db.elements.defaults[2].statusbars[subgroup]
		
		local option = options.args.config.args[subgroup].args
		
		if (bar.adjust.isEnabled) then
			option.iconSpark.disabled = false
			if (bar.nametext.isDisplayText) then
				option.nametext.disabled = false
			else
				option.nametext.disabled = true
			end

			if (bar.timetext.isDisplayText) then
				option.timetext.disabled = false
			else
				option.timetext.disabled = true
			end
			
			if (bar.nametext.font.shadow.isEnabled and bar.nametext.isDisplayText) then
				option.nametext.args.shadow.args.shadowColor.disabled = false
				option.nametext.args.shadow.args.shadowX.disabled = false
				option.nametext.args.shadow.args.shadowY.disabled = false
			else
				option.nametext.args.shadow.args.shadowColor.disabled = true
				option.nametext.args.shadow.args.shadowX.disabled = true
				option.nametext.args.shadow.args.shadowY.disabled = true
			end
			
			if (bar.timetext.font.shadow.isEnabled and bar.timetext.isDisplayText) then
				option.timetext.args.shadow.args.shadowColor.disabled = false
				option.timetext.args.shadow.args.shadowX.disabled = false
				option.timetext.args.shadow.args.shadowY.disabled = false
			else
				option.timetext.args.shadow.args.shadowColor.disabled = true
				option.timetext.args.shadow.args.shadowX.disabled = true
				option.timetext.args.shadow.args.shadowY.disabled = true
			end
		
			if (bar.adjust.showBG) then
				option.layout.args.backgroundColor.disabled = false
				option.layout.args.backgroundTexture.disabled = false
			else
				option.layout.args.backgroundColor.disabled = true
				option.layout.args.backgroundTexture.disabled = true
			end
			
			option.layout.disabled = false
		else
			option.iconSpark.disabled = true
			option.nametext.disabled = true
			option.nametext.args.shadow.args.shadowColor.disabled = true
			option.nametext.args.shadow.args.shadowX.disabled = true
			option.nametext.args.shadow.args.shadowY.disabled = true
			option.timetext.disabled = true
			option.timetext.args.shadow.args.shadowColor.disabled = true
			option.timetext.args.shadow.args.shadowX.disabled = true
			option.timetext.args.shadow.args.shadowY.disabled = true
			option.layout.args.backgroundColor.disabled = true
			option.layout.args.backgroundTexture.disabled = true
			option.layout.disabled = true
		end		

		if (bar.icon.isEnabled and bar.adjust.isEnabled) then
			option.iconSpark.args.iconJustify.disabled = false
		else
			option.iconSpark.args.iconJustify.disabled = true
		end

		if (bar.alphaCombat ~= default.alphaCombat or
			bar.alphaOoC ~= default.alphaOoC or
			
			not bar.nametext.isDisplayText or
			bar.nametext.x ~= default.nametext.x or
			bar.nametext.y ~= default.nametext.y or
			bar.nametext.font.name ~= default.nametext.font.name or
			bar.nametext.font.size ~= default.nametext.font.size or
			bar.nametext.font.flag ~= default.nametext.font.flag or
			bar.nametext.font.color.r ~= default.nametext.font.color.r or
			bar.nametext.font.color.g ~= default.nametext.font.color.g or
			bar.nametext.font.color.b ~= default.nametext.font.color.b or
			bar.nametext.font.color.a ~= default.nametext.font.color.a or
			bar.nametext.font.shadow.isEnabled or
			bar.nametext.font.shadow.offset.x ~= default.nametext.font.shadow.offset.x or
			bar.nametext.font.shadow.offset.y ~= default.nametext.font.shadow.offset.y or
			bar.nametext.font.shadow.color.r ~= default.nametext.font.shadow.color.r or
			bar.nametext.font.shadow.color.g ~= default.nametext.font.shadow.color.g or
			bar.nametext.font.shadow.color.b ~= default.nametext.font.shadow.color.b or
			bar.nametext.font.shadow.color.a ~= default.nametext.font.shadow.color.a or
			bar.nametext.justify ~= default.nametext.justify or
			
			not bar.timetext.isDisplayText or
			bar.timetext.x ~= default.timetext.x or
			bar.timetext.y ~= default.timetext.y or
			bar.timetext.font.name ~= default.timetext.font.name or
			bar.timetext.font.size ~= default.timetext.font.size or
			bar.timetext.font.flag ~= default.timetext.font.flag or
			bar.timetext.font.shadow.isEnabled or
			bar.timetext.font.shadow.offset.x ~= default.timetext.font.shadow.offset.x or
			bar.timetext.font.shadow.offset.y ~= default.timetext.font.shadow.offset.y or
			bar.timetext.font.shadow.color.r ~= default.timetext.font.shadow.color.r or
			bar.timetext.font.shadow.color.g ~= default.timetext.font.shadow.color.g or
			bar.timetext.font.shadow.color.b ~= default.timetext.font.shadow.color.b or
			bar.timetext.font.shadow.color.a ~= default.timetext.font.shadow.color.a or
			bar.timetext.font.color.r ~= default.timetext.font.color.r or
			bar.timetext.font.color.g ~= default.timetext.font.color.g or
			bar.timetext.font.color.b ~= default.timetext.font.color.b or
			bar.timetext.font.color.a ~= default.timetext.font.color.a or
			bar.timetext.justify ~= default.timetext.justify or
			
			bar.background.texture ~= default.background.texture or
			bar.background.color.r ~= default.background.color.r or
			bar.background.color.g ~= default.background.color.g or
			bar.background.color.b ~= default.background.color.b or
			bar.background.color.a ~= default.background.color.a or
			
			not bar.icon.isEnabled or
			bar.icon.justify ~= default.icon.justify or
			not bar.spark or
			
			bar.foreground.color.r ~= default.foreground.color.r or
			bar.foreground.color.g ~= default.foreground.color.g or
			bar.foreground.color.b ~= default.foreground.color.b or
			bar.foreground.texture ~= default.foreground.texture or
			
			bar.layout.width ~= default.layout.width or
			bar.layout.height ~= default.layout.height or
			bar.layout.strata ~= default.layout.strata) then
			option.reset.disabled = false
			option.reset.name = "|cFFFFCC00"..L["Reset "..group.." Bar"].."|r"
		else
			option.reset.disabled = true
			option.reset.name = "|cFF666666"..L["Reset "..group.." Bar"].."|r"
		end
	elseif (group == "Maelstrom") then
		local db = Auras.db.char
		local bar = db.elements[2].statusbars.maelstromBar
		local default = db.elements.defaults[2].statusbars.maelstromBar
		
		local option = options.args.config.args.maelstromBar.args

		if (bar.adjust.isEnabled) then
			if (bar.text.isDisplayText) then
				option.text.disabled = false
			else
				option.text.disabled = true
			end
			
			if (bar.text.font.shadow.isEnabled and bar.text.isDisplayText) then
				option.text.args.shadow.args.shadowColor.disabled = false
				option.text.args.shadow.args.shadowX.disabled = false
				option.text.args.shadow.args.shadowY.disabled = false
			else
				option.text.args.shadow.args.shadowColor.disabled = true
				option.text.args.shadow.args.shadowX.disabled = true
				option.text.args.shadow.args.shadowY.disabled = true
			end
		
			if (bar.adjust.showBG) then
				option.layout.args.backgroundColor.disabled = false
				option.layout.args.backgroundTexture.disabled = false
			else
				option.layout.args.backgroundColor.disabled = true
				option.layout.args.backgroundTexture.disabled = true
			end
			
			option.layout.disabled = false
		else
			option.text.disabled = true
			option.text.args.shadow.args.shadowColor.disabled = true
			option.text.args.shadow.args.shadowX.disabled = true
			option.text.args.shadow.args.shadowY.disabled = true
			option.layout.args.backgroundColor.disabled = true
			option.layout.args.backgroundTexture.disabled = true
			option.layout.disabled = true
		end	
		
		if (bar.isEnabled) then
			options.args.config.args.maelstromBar.disabled = false
		else
			options.args.config.args.maelstromBar.disabled = true
		end

		option.general.args.threshold.max = UnitPowerMax('player',11)
		
		if (bar.alphaCombat ~= default.alphaCombat or
			bar.alphaOoC ~= default.alphaOoC or
			bar.alphaTar ~= default.alphaTar or
			bar.threshold ~= default.threshold or
			not bar.animate or
			
			not bar.text.isDisplayText or
			bar.text.x ~= default.text.x or
			bar.text.y ~= default.text.y or
			bar.text.font.name ~= default.text.font.name or
			bar.text.font.size ~= default.text.font.size or
			bar.text.font.flag ~= default.text.font.flag or
			bar.text.font.color.r ~= default.text.font.color.r or
			bar.text.font.color.g ~= default.text.font.color.g or
			bar.text.font.color.b ~= default.text.font.color.b or
			bar.text.font.color.a ~= default.text.font.color.a or
			bar.text.font.shadow.isEnabled or
			bar.text.font.shadow.offset.x ~= default.text.font.shadow.offset.x or
			bar.text.font.shadow.offset.y ~= default.text.font.shadow.offset.y or
			bar.text.font.shadow.color.r ~= default.text.font.shadow.color.r or
			bar.text.font.shadow.color.g ~= default.text.font.shadow.color.g or
			bar.text.font.shadow.color.b ~= default.text.font.shadow.color.b or
			bar.text.font.shadow.color.a ~= default.text.font.shadow.color.a or
			bar.text.justify ~= default.text.justify or
			
			bar.background.texture ~= default.background.texture or
			bar.background.color.r ~= default.background.color.r or
			bar.background.color.g ~= default.background.color.g or
			bar.background.color.b ~= default.background.color.b or
			bar.background.color.a ~= default.background.color.a or
			
			bar.foreground.color.r ~= default.foreground.color.r or
			bar.foreground.color.g ~= default.foreground.color.g or
			bar.foreground.color.b ~= default.foreground.color.b or
			bar.foreground.texture ~= default.foreground.texture or
			
			bar.layout.width ~= default.layout.width or
			bar.layout.height ~= default.layout.height or
			bar.layout.strata ~= default.layout.strata) then
			option.reset.disabled = false
			option.reset.name = "|cFFFFCC00"..L["Reset Maelstrom Bar"].."|r"
		else
			option.reset.disabled = true
			option.reset.name = "|cFF666666"..L["Reset Maelstrom Bar"].."|r"
		end
	elseif (group == "Settings") then
		local db = Auras.db.char
		local settings = db.settings[2]
		local defaults = db.settings.defaults
		
		if (settings.OoCAlpha ~= defaults.OoCAlpha or
			settings.flametongue ~= defaults[2].flametongue or
			settings.frostbrand ~= defaults[2].frostbrand or
			settings.rockbiter ~= defaults[2].rockbiter or
			settings.OoRColor.r ~= defaults.OoRColor.r or
			settings.OoRColor.g ~= defaults.OoRColor.g or
			settings.OoRColor.b ~= defaults.OoRColor.b or
			settings.OoRColor.a ~= defaults.OoRColor.a) then
			options.args.config.args.general.args.settings.args.reset.disabled = false
			options.args.config.args.general.args.settings.args.reset.name = "|cFFFFCC00"..L["Reset Settings Values"].."|r"
		else
			options.args.config.args.general.args.settings.args.reset.disabled = true
			options.args.config.args.general.args.settings.args.reset.name = "|cFF666666"..L["Reset Settings Values"].."|r"
		end
	elseif (group == "Primary") then
		local db = Auras.db.char
		local layout = db.layout[2]
		local defaults = db.layout.defaults
		
		if (layout.orientation.top ~= defaults.orientation.top or
			layout.orientation.bottom ~= defaults.orientation.bottom or
			layout.primary.top.icon ~= defaults.primary.top.icon or
			layout.primary.top.spacing ~= defaults.primary.top.spacing or
			layout.primary.top.charges ~= defaults.primary.top.charges or
			layout.primary.bottom.icon ~= defaults.primary.bottom.icon or
			layout.primary.bottom.spacing ~= defaults.primary.bottom.spacing or
			layout.primary.bottom.charges ~= defaults.primary.bottom.charges) then
			options.args.layout.args.primaryAuras.args.ResetPrimaryLayout.disabled = false
			options.args.layout.args.primaryAuras.args.ResetPrimaryLayout.name = "|cFFFFCC00"..L["Reset Primary Layout"].."|r"
		else
			options.args.layout.args.primaryAuras.args.ResetPrimaryLayout.disabled = true
			options.args.layout.args.primaryAuras.args.ResetPrimaryLayout.name = "|cFF666666"..L["Reset Primary Layout"].."|r"
		end
	elseif (group == "Secondary") then
		local db = Auras.db.char
		local layout = db.layout[2]
		local defaults = db.layout.defaults
		
		if (layout.orientation.left ~= defaults.orientation.left or
			layout.orientation.right ~= defaults.orientation.right or
			layout.secondary.left.icon ~= defaults.secondary.left.icon or
			layout.secondary.left.spacing ~= defaults.secondary.left.spacing or
			layout.secondary.right.icon ~= defaults.secondary.right.icon or
			layout.secondary.right.spacing ~= defaults.secondary.right.spacing) then
			options.args.layout.args.secondaryAuras.args.ResetSecondaryLayout.disabled = false
			options.args.layout.args.secondaryAuras.args.ResetSecondaryLayout.name = "|cFFFFCC00"..L["Reset Secondary Layout"].."|r"
		else
			options.args.layout.args.secondaryAuras.args.ResetSecondaryLayout.disabled = true
			options.args.layout.args.secondaryAuras.args.ResetSecondaryLayout.name = "|cFF666666"..L["Reset Secondary Layout"].."|r"
		end
	end
end

local function CheckRestorationDefaultValues(options,group,subgroup)
	if (group == "Cooldowns") then
		if (Auras.db.char.elements[3].cooldowns.sweep) then
			options.args.config.args.general.args.cooldown.args.inverse.disabled = false
		else
			options.args.config.args.general.args.cooldown.args.inverse.disabled = true
		end
	elseif (group == "Cast" or group == "Channel") then
		local db = Auras.db.char
		local bar = db.elements[3].statusbars[subgroup]
		local default = db.elements.defaults[3].statusbars[subgroup]
		
		local option = options.args.config.args[subgroup].args
		
		if (bar.adjust.isEnabled) then
			option.iconSpark.disabled = false
			if (bar.nametext.isDisplayText) then
				option.nametext.disabled = false
			else
				option.nametext.disabled = true
			end

			if (bar.timetext.isDisplayText) then
				option.timetext.disabled = false
			else
				option.timetext.disabled = true
			end
			
			if (bar.nametext.font.shadow.isEnabled and bar.nametext.isDisplayText) then
				option.nametext.args.shadow.args.shadowColor.disabled = false
				option.nametext.args.shadow.args.shadowX.disabled = false
				option.nametext.args.shadow.args.shadowY.disabled = false
			else
				option.nametext.args.shadow.args.shadowColor.disabled = true
				option.nametext.args.shadow.args.shadowX.disabled = true
				option.nametext.args.shadow.args.shadowY.disabled = true
			end
			
			if (bar.timetext.font.shadow.isEnabled and bar.timetext.isDisplayText) then
				option.timetext.args.shadow.args.shadowColor.disabled = false
				option.timetext.args.shadow.args.shadowX.disabled = false
				option.timetext.args.shadow.args.shadowY.disabled = false
			else
				option.timetext.args.shadow.args.shadowColor.disabled = true
				option.timetext.args.shadow.args.shadowX.disabled = true
				option.timetext.args.shadow.args.shadowY.disabled = true
			end
		
			if (bar.adjust.showBG) then
				option.layout.args.backgroundColor.disabled = false
				option.layout.args.backgroundTexture.disabled = false
			else
				option.layout.args.backgroundColor.disabled = true
				option.layout.args.backgroundTexture.disabled = true
			end
			
			option.layout.disabled = false
		else
			option.iconSpark.disabled = true
			option.nametext.disabled = true
			option.nametext.args.shadow.args.shadowColor.disabled = true
			option.nametext.args.shadow.args.shadowX.disabled = true
			option.nametext.args.shadow.args.shadowY.disabled = true
			option.timetext.disabled = true
			option.timetext.args.shadow.args.shadowColor.disabled = true
			option.timetext.args.shadow.args.shadowX.disabled = true
			option.timetext.args.shadow.args.shadowY.disabled = true
			option.layout.args.backgroundColor.disabled = true
			option.layout.args.backgroundTexture.disabled = true
			option.layout.disabled = true
		end		

		if (bar.icon.isEnabled and bar.adjust.isEnabled) then
			option.iconSpark.args.iconJustify.disabled = false
		else
			option.iconSpark.args.iconJustify.disabled = true
		end

		if (bar.alphaCombat ~= default.alphaCombat or
			bar.alphaOoC ~= default.alphaOoC or
			
			not bar.nametext.isDisplayText or
			bar.nametext.x ~= default.nametext.x or
			bar.nametext.y ~= default.nametext.y or
			bar.nametext.font.name ~= default.nametext.font.name or
			bar.nametext.font.size ~= default.nametext.font.size or
			bar.nametext.font.flag ~= default.nametext.font.flag or
			bar.nametext.font.color.r ~= default.nametext.font.color.r or
			bar.nametext.font.color.g ~= default.nametext.font.color.g or
			bar.nametext.font.color.b ~= default.nametext.font.color.b or
			bar.nametext.font.color.a ~= default.nametext.font.color.a or
			bar.nametext.font.shadow.isEnabled or
			bar.nametext.font.shadow.offset.x ~= default.nametext.font.shadow.offset.x or
			bar.nametext.font.shadow.offset.y ~= default.nametext.font.shadow.offset.y or
			bar.nametext.font.shadow.color.r ~= default.nametext.font.shadow.color.r or
			bar.nametext.font.shadow.color.g ~= default.nametext.font.shadow.color.g or
			bar.nametext.font.shadow.color.b ~= default.nametext.font.shadow.color.b or
			bar.nametext.font.shadow.color.a ~= default.nametext.font.shadow.color.a or
			bar.nametext.justify ~= default.nametext.justify or
			
			not bar.timetext.isDisplayText or
			bar.timetext.x ~= default.timetext.x or
			bar.timetext.y ~= default.timetext.y or
			bar.timetext.font.name ~= default.timetext.font.name or
			bar.timetext.font.size ~= default.timetext.font.size or
			bar.timetext.font.flag ~= default.timetext.font.flag or
			bar.timetext.font.shadow.isEnabled or
			bar.timetext.font.shadow.offset.x ~= default.timetext.font.shadow.offset.x or
			bar.timetext.font.shadow.offset.y ~= default.timetext.font.shadow.offset.y or
			bar.timetext.font.shadow.color.r ~= default.timetext.font.shadow.color.r or
			bar.timetext.font.shadow.color.g ~= default.timetext.font.shadow.color.g or
			bar.timetext.font.shadow.color.b ~= default.timetext.font.shadow.color.b or
			bar.timetext.font.shadow.color.a ~= default.timetext.font.shadow.color.a or
			bar.timetext.font.color.r ~= default.timetext.font.color.r or
			bar.timetext.font.color.g ~= default.timetext.font.color.g or
			bar.timetext.font.color.b ~= default.timetext.font.color.b or
			bar.timetext.font.color.a ~= default.timetext.font.color.a or
			bar.timetext.justify ~= default.timetext.justify or
			
			bar.background.texture ~= default.background.texture or
			bar.background.color.r ~= default.background.color.r or
			bar.background.color.g ~= default.background.color.g or
			bar.background.color.b ~= default.background.color.b or
			bar.background.color.a ~= default.background.color.a or
			
			not bar.icon.isEnabled or
			bar.icon.justify ~= default.icon.justify or
			not bar.spark or
			
			bar.foreground.color.r ~= default.foreground.color.r or
			bar.foreground.color.g ~= default.foreground.color.g or
			bar.foreground.color.b ~= default.foreground.color.b or
			bar.foreground.texture ~= default.foreground.texture or
			
			bar.layout.width ~= default.layout.width or
			bar.layout.height ~= default.layout.height or
			bar.layout.strata ~= default.layout.strata) then
			option.reset.disabled = false
			option.reset.name = "|cFFFFCC00"..L["Reset "..group.." Bar"].."|r"
		else
			option.reset.disabled = true
			option.reset.name = "|cFF666666"..L["Reset "..group.." Bar"].."|r"
		end
	elseif (group == "Settings") then
		local db = Auras.db.char
		local settings = db.settings[3]
		local defaults = db.settings.defaults
		
		if (settings.OoCAlpha ~= defaults.OoCAlpha or
		settings.flameShock ~= defaults[3].flameShock or
		settings.OoRColor.r ~= defaults.OoRColor.r or
		settings.OoRColor.g ~= defaults.OoRColor.g or
		settings.OoRColor.b ~= defaults.OoRColor.b or
		settings.OoRColor.a ~= defaults.OoRColor.a) then
			options.args.config.args.general.args.settings.args.reset.disabled = false
			options.args.config.args.general.args.settings.args.reset.name = "|cFFFFCC00"..L["Reset Settings Values"].."|r"
		else
			options.args.config.args.general.args.settings.args.reset.disabled = true
			options.args.config.args.general.args.settings.args.reset.name = "|cFF666666"..L["Reset Settings Values"].."|r"
		end
	elseif (group == "Primary") then
		local db = Auras.db.char
		local layout = db.layout[3]
		local defaults = db.layout.defaults
		
		if (layout.orientation.top ~= defaults.orientation.top or
			layout.orientation.bottom ~= defaults.orientation.bottom or
			layout.primary.top.icon ~= defaults.primary.top.icon or
			layout.primary.top.spacing ~= defaults.primary.top.spacing or
			layout.primary.top.charges ~= defaults.primary.top.charges or
			layout.primary.bottom.icon ~= defaults.primary.bottom.icon or
			layout.primary.bottom.spacing ~= defaults.primary.bottom.spacing) then
			options.args.layout.args.primaryAuras.args.ResetPrimaryLayout.disabled = false
			options.args.layout.args.primaryAuras.args.ResetPrimaryLayout.name = "|cFFFFCC00"..L["Reset Primary Layout"].."|r"
		else
			options.args.layout.args.primaryAuras.args.ResetPrimaryLayout.disabled = true
			options.args.layout.args.primaryAuras.args.ResetPrimaryLayout.name = "|cFF666666"..L["Reset Primary Layout"].."|r"
		end
	elseif (group == "Secondary") then
		local db = Auras.db.char
		local layout = db.layout[3]
		local defaults = db.layout.defaults
		
		if (layout.orientation.left ~= defaults.orientation.left or
			layout.orientation.right ~= defaults.orientation.right or
			layout.secondary.left.icon ~= defaults.secondary.left.icon or
			layout.secondary.left.spacing ~= defaults.secondary.left.spacing or
			layout.secondary.right.icon ~= defaults.secondary.right.icon or
			layout.secondary.right.spacing ~= defaults.secondary.right.spacing or
			layout.secondary.right.charges ~= defaults.secondary.right.charges) then
			options.args.layout.args.secondaryAuras.args.ResetSecondaryLayout.disabled = false
			options.args.layout.args.secondaryAuras.args.ResetSecondaryLayout.name = "|cFFFFCC00"..L["Reset Secondary Layout"].."|r"
		else
			options.args.layout.args.secondaryAuras.args.ResetSecondaryLayout.disabled = true
			options.args.layout.args.secondaryAuras.args.ResetSecondaryLayout.name = "|cFF666666"..L["Reset Secondary Layout"].."|r"
		end
	elseif (group == "Earthen Shield") then
		local db = Auras.db.char
		local bar = db.elements[3].statusbars.earthenShieldBar
		local default = db.elements.defaults[3].statusbars.earthenShieldBar
		
		local option = options.args.config.args.earthenShieldBar.args
		
		if (bar.adjust.isEnabled) then
			if (bar.healthtext.isDisplayText) then
				option.healthtext.disabled = false
			else
				option.healthtext.disabled = true
			end

			if (bar.timetext.isDisplayText) then
				option.timetext.disabled = false
			else
				option.timetext.disabled = true
			end
			
			if (bar.healthtext.font.shadow.isEnabled and bar.healthtext.isDisplayText) then
				option.healthtext.args.shadow.args.shadowColor.disabled = false
				option.healthtext.args.shadow.args.shadowX.disabled = false
				option.healthtext.args.shadow.args.shadowY.disabled = false
			else
				option.healthtext.args.shadow.args.shadowColor.disabled = true
				option.healthtext.args.shadow.args.shadowX.disabled = true
				option.healthtext.args.shadow.args.shadowY.disabled = true
			end
			
			if (bar.timetext.font.shadow.isEnabled and bar.timetext.isDisplayText) then
				option.timetext.args.shadow.args.shadowColor.disabled = false
				option.timetext.args.shadow.args.shadowX.disabled = false
				option.timetext.args.shadow.args.shadowY.disabled = false
			else
				option.timetext.args.shadow.args.shadowColor.disabled = true
				option.timetext.args.shadow.args.shadowX.disabled = true
				option.timetext.args.shadow.args.shadowY.disabled = true
			end
		
			if (bar.adjust.showTimer) then
				option.layout.args.timerColor.disabled = false
				option.layout.args.timerTexture.disabled = false
			else
				option.layout.args.timerColor.disabled = true
				option.layout.args.timerTexture.disabled = true
			end
			
			if (bar.adjust.showBG) then
				option.layout.args.backgroundColor.disabled = false
				option.layout.args.backgroundTexture.disabled = false
			else
				option.layout.args.backgroundColor.disabled = true
				option.layout.args.backgroundTexture.disabled = true
			end
			
			option.layout.disabled = false
		else
			option.healthtext.disabled = true
			option.healthtext.args.shadow.args.shadowColor.disabled = true
			option.healthtext.args.shadow.args.shadowX.disabled = true
			option.healthtext.args.shadow.args.shadowY.disabled = true
			option.timetext.disabled = true
			option.timetext.args.shadow.args.shadowColor.disabled = true
			option.timetext.args.shadow.args.shadowX.disabled = true
			option.timetext.args.shadow.args.shadowY.disabled = true
			option.layout.args.timerColor.disabled = true
			option.layout.args.timerTexture.disabled = true
			option.layout.args.backgroundColor.disabled = true
			option.layout.args.backgroundTexture.disabled = true
			option.layout.disabled = true
		end	
		
		if (bar.isEnabled) then
			options.args.config.args.earthenShieldBar.disabled = false
		else
			options.args.config.args.earthenShieldBar.disabled = true
		end
		
		if (bar.alphaCombat ~= default.alphaCombat or
			bar.alphaOoC ~= default.alphaOoC or
			bar.alphaTar ~= default.alphaTar or
			
			not bar.healthtext.isDisplayText or
			bar.healthtext.x ~= default.healthtext.x or
			bar.healthtext.y ~= default.healthtext.y or
			bar.healthtext.font.name ~= default.healthtext.font.name or
			bar.healthtext.font.size ~= default.healthtext.font.size or
			bar.healthtext.font.flag ~= default.healthtext.font.flag or
			bar.healthtext.font.color.r ~= default.healthtext.font.color.r or
			bar.healthtext.font.color.g ~= default.healthtext.font.color.g or
			bar.healthtext.font.color.b ~= default.healthtext.font.color.b or
			bar.healthtext.font.color.a ~= default.healthtext.font.color.a or
			bar.healthtext.font.shadow.isEnabled or
			bar.healthtext.font.shadow.offset.x ~= default.healthtext.font.shadow.offset.x or
			bar.healthtext.font.shadow.offset.y ~= default.healthtext.font.shadow.offset.y or
			bar.healthtext.font.shadow.color.r ~= default.healthtext.font.shadow.color.r or
			bar.healthtext.font.shadow.color.g ~= default.healthtext.font.shadow.color.g or
			bar.healthtext.font.shadow.color.b ~= default.healthtext.font.shadow.color.b or
			bar.healthtext.font.shadow.color.a ~= default.healthtext.font.shadow.color.a or
			bar.healthtext.justify ~= default.healthtext.justify or
			
			not bar.timetext.isDisplayText or
			bar.timetext.x ~= default.timetext.x or
			bar.timetext.y ~= default.timetext.y or
			bar.timetext.font.name ~= default.timetext.font.name or
			bar.timetext.font.size ~= default.timetext.font.size or
			bar.timetext.font.flag ~= default.timetext.font.flag or
			bar.timetext.font.color.r ~= default.timetext.font.color.r or
			bar.timetext.font.color.g ~= default.timetext.font.color.g or
			bar.timetext.font.color.b ~= default.timetext.font.color.b or
			bar.timetext.font.color.a ~= default.timetext.font.color.a or
			bar.timetext.font.shadow.isEnabled or
			bar.timetext.font.shadow.offset.x ~= default.timetext.font.shadow.offset.x or
			bar.timetext.font.shadow.offset.y ~= default.timetext.font.shadow.offset.y or
			bar.timetext.font.shadow.color.r ~= default.timetext.font.shadow.color.r or
			bar.timetext.font.shadow.color.g ~= default.timetext.font.shadow.color.g or
			bar.timetext.font.shadow.color.b ~= default.timetext.font.shadow.color.b or
			bar.timetext.font.shadow.color.a ~= default.timetext.font.shadow.color.a or
			bar.timetext.justify ~= default.timetext.justify or
			
			bar.background.texture ~= default.background.texture or
			bar.background.color.r ~= default.background.color.r or
			bar.background.color.g ~= default.background.color.g or
			bar.background.color.b ~= default.background.color.b or
			bar.background.color.a ~= default.background.color.a or
			
			bar.timerBar.color.r ~= default.timerBar.color.r or
			bar.timerBar.color.g ~= default.timerBar.color.g or
			bar.timerBar.color.b ~= default.timerBar.color.b or
			bar.timerBar.color.a ~= default.timerBar.color.a or
			bar.timerBar.texture ~= default.timerBar.texture or
										
			bar.foreground.color.r ~= default.foreground.color.r or
			bar.foreground.color.g ~= default.foreground.color.g or
			bar.foreground.color.b ~= default.foreground.color.b or
			bar.foreground.texture ~= default.foreground.texture or
			
			bar.layout.width ~= default.layout.width or
			bar.layout.height ~= default.layout.height or
			bar.layout.strata ~= default.layout.strata) then
			option.reset.disabled = false
			option.reset.name = "|cFFFFCC00"..L["Reset Earthen Shield Bar"].."|r"
		else
			option.reset.disabled = true
			option.reset.name = "|cFF666666"..L["Reset Earthen Shield Bar"].."|r"
		end
	elseif (group == "Mana") then
		local db = Auras.db.char
		local bar = db.elements[3].statusbars.manaBar
		local default = db.elements.defaults[3].statusbars.manaBar
		local option = options.args.config.args.manaBar.args
		
		if (bar.adjust.isEnabled) then
			if (bar.text.isDisplayText) then
				option.text.disabled = false
			else
				option.text.disabled = true
			end
			
			if (bar.text.font.shadow.isEnabled and bar.text.isDisplayText) then
				option.text.args.shadow.args.shadowColor.disabled = false
				option.text.args.shadow.args.shadowX.disabled = false
				option.text.args.shadow.args.shadowY.disabled = false
			else
				option.text.args.shadow.args.shadowColor.disabled = true
				option.text.args.shadow.args.shadowX.disabled = true
				option.text.args.shadow.args.shadowY.disabled = true
			end
		
			if (bar.adjust.showBG) then
				option.layout.args.backgroundColor.disabled = false
				option.layout.args.backgroundTexture.disabled = false
			else
				option.layout.args.backgroundColor.disabled = true
				option.layout.args.backgroundTexture.disabled = true
			end
			
			option.layout.disabled = false
		else
			option.text.disabled = true
			option.text.args.shadow.args.shadowColor.disabled = true
			option.text.args.shadow.args.shadowX.disabled = true
			option.text.args.shadow.args.shadowY.disabled = true
			option.layout.args.backgroundColor.disabled = true
			option.layout.args.backgroundTexture.disabled = true
			option.layout.disabled = true
		end		

		if (bar.isEnabled) then
			options.args.config.args.manaBar.disabled = false
		else
			options.args.config.args.manaBar.disabled = true
		end

		if (bar.alphaCombat ~= default.alphaCombat or
			bar.alphaOoC ~= default.alphaOoC or
			bar.alphaTar ~= default.alphaTar or
			
			not bar.grouping or 
			bar.precision ~= default.precision or
			
			not bar.text.isDisplayText or
			bar.text.x ~= default.text.x or
			bar.text.y ~= default.text.y or
			bar.text.font.name ~= default.text.font.name or
			bar.text.font.size ~= default.text.font.size or
			bar.text.font.flag ~= default.text.font.flag or
			bar.text.font.color.r ~= default.text.font.color.r or
			bar.text.font.color.g ~= default.text.font.color.g or
			bar.text.font.color.b ~= default.text.font.color.b or
			bar.text.font.color.a ~= default.text.font.color.a or
			bar.text.font.shadow.isEnabled or
			bar.text.font.shadow.offset.x ~= default.text.font.shadow.offset.x or
			bar.text.font.shadow.offset.y ~= default.text.font.shadow.offset.y or
			bar.text.font.shadow.color.r ~= default.text.font.shadow.color.r or
			bar.text.font.shadow.color.g ~= default.text.font.shadow.color.g or
			bar.text.font.shadow.color.b ~= default.text.font.shadow.color.b or
			bar.text.font.shadow.color.a ~= default.text.font.shadow.color.a or
			bar.text.justify ~= default.text.justify or
			
			bar.background.texture ~= default.background.texture or
			bar.background.color.r ~= default.background.color.r or
			bar.background.color.g ~= default.background.color.g or
			bar.background.color.b ~= default.background.color.b or
			bar.background.color.a ~= default.background.color.a or
			
			bar.foreground.color.r ~= default.foreground.color.r or
			bar.foreground.color.g ~= default.foreground.color.g or
			bar.foreground.color.b ~= default.foreground.color.b or
			bar.foreground.texture ~= default.foreground.texture or
			
			bar.layout.width ~= default.layout.width or
			bar.layout.height ~= default.layout.height or
			bar.layout.strata ~= default.layout.strata) then
			option.reset.disabled = false
			option.reset.name = "|cFFFFCC00"..L["Reset Mana Bar"].."|r"
		else
			option.reset.disabled = false
			option.reset.name = "|cFF666666"..L["Reset Mana Bar"].."|r"
		end
	elseif (group == "Tidal Waves") then
		local db = Auras.db.char
		local bar = db.elements[3].statusbars.tidalWavesBar
		local default = db.elements.defaults[3].statusbars.tidalWavesBar
		local option = options.args.config.args.tidalWavesBar.args

		if (bar.adjust.isEnabled) then
			if (bar.adjust.showBG) then
				option.layout.args.backgroundColor.disabled = false
				option.layout.args.backgroundTexture.disabled = false
			else
				option.layout.args.backgroundColor.disabled = true
				option.layout.args.backgroundTexture.disabled = true
			end
			
			option.layout.disabled = false
		else
			option.layout.args.backgroundColor.disabled = true
			option.layout.args.backgroundTexture.disabled = true
			option.layout.disabled = true
		end

		if (bar.isEnabled) then
			options.args.config.args.tidalWavesBar.disabled = false
		else
			options.args.config.args.tidalWavesBar.disabled = true
		end

		if (not bar.animate or
			bar.combatDisplay ~= default.combatDisplay or
			bar.OoCDisplay ~= default.OoCDisplay or
			bar.OoCTime ~= default.OoCTime or
		
			bar.background.texture ~= default.background.texture or
			bar.background.color.r ~= default.background.color.r or
			bar.background.color.g ~= default.background.color.g or
			bar.background.color.b ~= default.background.color.b or
			bar.background.color.a ~= default.background.color.a or
			
			bar.emptyColor.r ~= default.emptyColor.r or
			bar.emptyColor.g ~= default.emptyColor.g or
			bar.emptyColor.b ~= default.emptyColor.b or
			
			bar.foreground.color.r ~= default.foreground.color.r or
			bar.foreground.color.g ~= default.foreground.color.g or
			bar.foreground.color.b ~= default.foreground.color.b or
			bar.foreground.texture ~= default.foreground.texture or
			
			bar.layout.width ~= default.layout.width or
			bar.layout.height ~= default.layout.height or
			bar.layout.strata ~= default.layout.strata) then
			option.reset.disabled = false
			option.reset.name = "|cFFFFCC00"..L["Reset Tidal Waves Bar"].."|r"
		else
			option.reset.disabled = false
			option.reset.name = "|cFF666666"..L["Reset Tidal Waves Bar"].."|r"
		end
	end
end

local ele_options

local function GetElementalOptions()
	if not ele_options then
		local db = Auras.db.char
	
		-- Database Shortcuts
		local settings = db.settings[1]
		local settingDefaults = db.settings.defaults
		
		-- Element Tables
		local elements = db.elements[1]
		local cooldowns = db.elements[1].cooldowns
		local timerbars = db.elements[1].timerbars
		local statusbars = db.elements[1].statusbars
		local frames = db.elements[1].frames
		local auras = db.auras[1]
		
		-- Layout Table
		local layout = db.layout[1]
		local layoutDefaults = db.layout.defaults
		
		-- Element Defaults Tables
		local timerbarDefaults = db.elements.defaults[1].timerbars
		local statusbarDefaults = db.elements.defaults[1].statusbars
		local frameDefaults = db.elements.defaults[1].frames
		
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
								return db.elements[1].isEnabled
							end,
							set = function(self,value)
								db.elements[1].isEnabled = value
								if (not value) then
									AuraGroupEle:Hide()
								else
									AuraGroupEle:Show()
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
										return auras.AncestralGuidanceEle
									end,
									set = function(self,value)
										auras.AncestralGuidanceEle = value
										Auras:UpdateTalents()
									end,
								},
								AscendanceEle = {
									order = 2,
									type = "toggle",
									name = L["Ascendance"],
									get = function() 
										return auras.AscendanceEle
									end,
									set = function(self,value)
										auras.AscendanceEle = value
										Auras:UpdateTalents()
									end,
								},
								Concordance = {
									order = 3,
									type = "toggle",
									name = L["Concordance of the Legionfall"],
									get = function()
										return auras.ConcordanceEle
									end,
									set = function(self,value)
										auras.ConcordanceEle = value
										Auras:UpdateTalents()
									end,
								},
								Earthquake = {
									order = 4,
									type = "toggle",
									name = L["Earthquake"],
									get = function()
										return auras.Earthquake
									end,
									set = function(self,value)
										auras.Earthquake = value
										Auras:UpdateTalents()
									end,
								},
								EarthShock = {
									order = 5,
									type = "toggle",
									name = L["Earth Shock"],
									get = function()
										return auras.EarthShock
									end,
									set = function(self,value)
										auras.EarthShock = value
										Auras:UpdateTalents()
									end,
								},
								ElementalBlast = {
									order = 6,
									type = "toggle",
									name = L["Elemental Blast"],
									get = function()
										return auras.ElementalBlast
									end,
									set = function(self,value)
										auras.ElementalBlast = value
										Auras:UpdateTalents()
									end,
								},
								ElementalFocus = {
									order = 7,
									type = "toggle",
									name = L["Elemental Focus"],
									get = function()
										return auras.ElementalFocus
									end,
									set = function(self,value)
										auras.ElementalFocus = value
										Auras:UpdateTalents()
									end,
								},
								ElementalMastery = {
									order = 8,
									type = "toggle",
									name = L["Elemental Mastery"],
									get = function()
										return auras.ElementalMastery
									end,
									set = function(self,value)
										auras.ElementalMastery = value
										Auras:UpdateTalents()
									end,
								},
								FireElemental = {
									order = 9,
									type = "toggle",
									name = L["Fire Elemental"],
									get = function() 
										return auras.FireElemental
									end,
									set = function(self,value)
										auras.FireElemental = value
										Auras:UpdateTalents()
									end,
								},
								FlameShock = {
									order = 10,
									type = "toggle",
									name = L["Flame Shock"],
									get = function()
										return auras.FlameShock
									end,
									set = function(self,value)
										auras.FlameShock = value
										Auras:UpdateTalents()
									end,
								},
								Icefury = {
									order = 11,
									type = "toggle",
									name = L["Icefury"],
									get = function() 
										return auras.Icefury
									end,
									set = function(self,value)
										auras.Icefury = value
										Auras:UpdateTalents()
									end,
								},
								LavaBurst = {
									order = 12,
									type = "toggle",
									name = L["Lava Burst"],
									get = function()
										return auras.LavaBurstEle
									end,
									set = function(self,value)
										auras.LavaBurstEle = value
										Auras:UpdateTalents()
									end,
								},
								LiquidMagmaTotem = {
									order = 13,
									type = "toggle",
									name = L["Liquid Magma Totem"],
									get = function()
										return auras.LiquidMagmaTotem
									end,
									set = function(self,value)
										auras.LiquidMagmaTotem = value
										Auras:UpdateTalents()
									end,
								},
								PowerOfMaelstrom = {
									order = 14,
									type = "toggle",
									name = L["Power of the Maelstrom"],
									get = function()
										return auras.PowerOfMaelstrom
									end,
									set = function(self,value)
										auras.PowerOfMaelstrom = value
										Auras:UpdateTalents()
									end,
								},
								StormElemental = {
									order = 15,
									type = "toggle",
									name = L["Storm Elemental"],
									get = function() 
										return auras.StormElemental
									end,
									set = function(self,value)
										auras.StormElemental = value
										Auras:UpdateTalents()
									end,
								},
								Stormkeeper = {
									order = 16,
									type = "toggle",
									name = L["Stormkeeper"],
									get = function() 
										return auras.Stormkeeper
									end,
									set = function(self,value)
										auras.Stormkeeper = value
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
										return auras.AstralShiftEle
									end,
									set = function(self,value)
										auras.AstralShiftEle = value
										Auras:UpdateTalents()
									end,
								},
								CleanseSpirit = {
									order = 2,
									type = "toggle",
									name = L["Cleanse Spirit"],
									get = function()
										return auras.CleanseSpiritEle
									end,
									set = function(self,value)
										auras.CleanseSpiritEle = value
										Auras:UpdateTalents()
									end,
								},
								EarthElemental = {
									order = 3,
									type = "toggle",
									name = L["Earth Elemental"],
									get = function()
										return auras.EarthElemental
									end,
									set = function(self,value)
										auras.EarthElemental = value
										Auras:UpdateTalents()
									end,
								},
								EarthgrabTotemEle = {
									order = 4,
									type = "toggle",
									name = L["Earthgrab Totem"],
									get = function()
										return auras.EarthgrabTotemEle
									end,
									set = function(self,value)
										auras.EarthgrabTotemEle = value
										Auras:UpdateTalents()
									end,
								},
								GustOfWind = {
									order = 5,
									type = "toggle",
									name = L["Gust of Wind"],
									get = function()
										return auras.GustWindEle
									end,
									set = function(self,value)
										auras.GustWindEle = value
										Auras:UpdateTalents()
									end,
								},
								Hex = {
									order = 6,
									type = "toggle",
									name = L["Hex"],
									get = function()
										return auras.HexEle
									end,
									set = function(self,value)
										auras.HexEle = value
										Auras:UpdateTalents()
									end,
								},
								Thunderstorm = {
									order = 7,
									type = "toggle",
									name = L["Thunderstorm"],
									get = function()
										return auras.Thunderstorm
									end,
									set = function(self,value)
										auras.Thunderstorm = value
										Auras:UpdateTalents()
									end,
								},
								LightningSurgeTotemEle = {
									order = 8,
									type = "toggle",
									name = L["Lightning Surge Totem"],
									get = function()
										return auras.LightningSurgeTotemEle
									end,
									set = function(self,value)
										auras.LightningSurgeTotemEle = value
										Auras:UpdateTalents()
									end,
								},
								VoodooTotemEle = {
									order = 9,
									type = "toggle",
									name = L["Voodoo Totem"],
									get = function()
										return auras.VoodooTotemEle
									end,
									set = function(self,value)
										auras.VoodooTotemEle = value
										Auras:UpdateTalents()
									end,
								},
								WindRushTotemEle = {
									order = 10,
									type = "toggle",
									name = L["Wind Rush Totem"],
									get = function()
										return auras.WindRushTotemEle
									end,
									set = function(self,value)
										auras.WindRushTotemEle = value
										Auras:UpdateTalents()
									end,
								},
								Windshear = {
									order = 11,
									type = "toggle",
									name = L["Wind Shear"],
									get = function() 
										return auras.WindShearEle
									end,
									set = function(self,value)
										auras.WindShearEle = value
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
								BuffTimerBars = {
									name = L["Buff Duration Timers"],
									type = "group",
									order = 1,
									guiInline = true,
									args = {
										AncestralGuidance = {
											order = 1,
											type = "toggle",
											name = L["Ancestral Guidance"],
											get = function() 
												return timerbars.buff.ancestralGuidance
											end,
											set = function(self,value)
												timerbars.buff.ancestralGuidance = value
											end,
										},
										Ascendance = {
											order = 2,
											type = "toggle",
											name = L["Ascendance"],
											get = function() 
												return timerbars.buff.ascendance
											end,
											set = function(self,value)
												timerbars.buff.ascendance = value
											end,
										},
										AstralShift = {
											order = 3,
											type = "toggle",
											name = L["Astral Shift"],
											get = function() 
												return timerbars.buff.astralShift
											end,
											set = function(self,value)
												timerbars.buff.astralShift = value
											end,
										},
										Bloodlust = {
											order = 4,
											type = "toggle",
											name = L["Bloodlust"],
											hidden = false,
											get = function() 
												return timerbars.buff.bloodlust
											end,
											set = function(self,value)
												timerbars.buff.bloodlust = value
											end,
										},
										ElementalBlast = {
											order = 5,
											type = "toggle",
											name = L["Elemental Blast"],
											get = function() 
												return timerbars.buff.elementalBlast
											end,
											set = function(self,value)
												timerbars.buff.elementalBlast = value
												--timerbars.buff.ElementalBlastHasteBar = value
												--timerbars.buff.ElementalBlastMasteryBar = value
											end,
										},
										ElementalMastery = {
											order = 6,
											type = "toggle",
											name = L["Elemental Mastery"],
											get = function() 
												return timerbars.buff.elementalMastery
											end,
											set = function(self,value)
												timerbars.buff.elementalMastery = value
											end,
										},
										Heroism = {
											order = 7,
											type = "toggle",
											name = L["Heroism"],
											hidden = false,
											get = function() 
												return timerbars.buff.heroism
											end,
											set = function(self,value)
												timerbars.buff.heroism = value
											end,
										},
										TimeWarp = {
											order = 8,
											type = "toggle",
											name = L["Time Warp"],
											get = function() 
												return timerbars.buff.timeWarp
											end,
											set = function(self,value)
												timerbars.buff.timeWarp = value
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
												return timerbars.main.earthElemental
											end,
											set = function(self,value)
												timerbars.main.earthElemental = value
											end,
										},
										FireElemental = {
											order = 2,
											type = "toggle",
											name = L["Fire Elemental"],
											get = function() 
												return timerbars.main.fireElemental
											end,
											set = function(self,value)
												timerbars.main.fireElemental = value
											end,
										},
										StormElemental = {
											order = 3,
											type = "toggle",
											name = L["Storm Elemental"],
											get = function() 
												return timerbars.main.stormElemental
											end,
											set = function(self,value)
												timerbars.main.stormElemental = value
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
												return timerbars.util.earthgrabTotem
											end,
											set = function(self,value)
												timerbars.util.earthgrabTotem = value
											end,
										},
										VoodooTotem = {
											order = 2,
											type = "toggle",
											name = L["Voodoo Totem"],
											get = function() 
												return timerbars.util.voodooTotem
											end,
											set = function(self,value)
												timerbars.util.voodooTotem = value
											end,
										},
										WindRushTotem = {
											order = 3,
											type = "toggle",
											name = L["Wind Rush Totem"],
											get = function() 
												return timerbars.util.windRushTotem
											end,
											set = function(self,value)
												timerbars.util.windRushTotem = value
											end,
										},
										LiquidMagmaTotem = {
											order = 4,
											type = "toggle",
											name = L["Liquid Magma Totem"],
											get = function() 
												return timerbars.util.liquidMagmaTotem
											end,
											set = function(self,value)
												timerbars.util.liquidMagmaTotem = value
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
										return frames.TotemMastery.isEnabled
									end,
									set = function(self,value)
										frames.TotemMastery.isEnabled = value
									end,
								},
								Stormkeeper = {
									order = 2,
									type = "toggle",
									name = L["Stormkeeper Orbs"],
									get = function() 
										return frames.StormkeeperChargeGrp.isEnabled
									end,
									set = function(self,value)
										frames.StormkeeperChargeGrp.isEnabled = value
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
					childGroups = "tab",
					disabled = true,
					args = {
						general = {
							name = L["General"],
							order = 5,
							inline = false,
							type = "group",
							args = {
								statusbars = {
									name = L["Statusbar Manager"],
									type = "group",
									order = 1,
									guiInline = true,
									args = {
										defaultBarToggle = {
											order = 1,
											name = L["Blizzard Casting Bar"],
											desc = L["Toggles the display of Blizzard's default casting bar"],
											type = "toggle",
											get = function()
												return statusbars.defaultBar
											end,
											set = function(self,value)
												--[[local option = res_options.args.config.args.manaBar
												if (value) then
													option.disabled = false
												else
													option.disabled = true
												end]]
												
												statusbars.defaultBar = value
											end,
										},
										castBarToggle = {
											order = 2,
											name = L["Toggle Cast Bar"],
											desc = L["Toggles the display of the cast bar"],
											type = "toggle",
											get = function()
												return statusbars.castBar.isEnabled
											end,
											set = function(self,value)
												if (value) then
													ele_options.args.config.args.castBar.disabled = false
												else
													ele_options.args.config.args.castBar.disabled = true
												end
												
												statusbars.castBar.isEnabled = value
											end,
										},
										channelToggle = {
											order = 3,
											name = L["Toggle Channel Bar"],
											desc = L["Toggles the display of the channel bar"],
											type = "toggle",
											get = function()
												return statusbars.channelBar.isEnabled
											end,
											set = function(self,value)
												if (value) then
													ele_options.args.config.args.channelBar.disabled = false
												else
													ele_options.args.config.args.channelBar.disabled = true
												end
												
												statusbars.channelBar.isEnabled = value
											end,
										},
										maelstromToggle = {
											order = 4,
											name = L["Toggle Maelstrom Bar"],
											desc = L["Toggles the display of the Maelstrom Bar"],
											type = "toggle",
											get = function()
												return statusbars.maelstromBar.isEnabled
											end,
											set = function(self,value)
												if (value) then
													ele_options.args.config.args.maelstromBar.disabled = false
												else
													ele_options.args.config.args.maelstromBar.disabled = true
												end
												
												statusbars.maelstromBar.isEnabled = value
											end,
										},
										icefuryToggle = {
											order = 5,
											name = L["Toggle Icefury Bar"],
											desc = L["Toggles the display of the Icefury bar"],
											type = "toggle",
											get = function()
												return statusbars.icefuryBar.isEnabled
											end,
											set = function(self,value)
												if (value) then
													ele_options.args.config.args.icefuryBar.disabled = false
												else
													ele_options.args.config.args.icefuryBar.disabled = true
												end
												
												statusbars.icefuryBar.isEnabled = value
											end,
										},
									},
								},
								cooldown = {
									name = L["Cooldown Settings"],
									type = "group",
									order = 2,
									guiInline = true,
									args = {
										text = {
											order = 1,
											name = L["Cooldown Values"],
											desc = L["Toggle the display of cooldown text/numbers."],
											type = "toggle",
											get = function()
												return cooldowns.text
											end,
											set = function(self,value)
												cooldowns.text = value
											end,
										},
										sweep = {
											order = 2,
											name = L["Cooldown Sweep Animation"],
											desc = L["Toggle the display of the cooldown animation sweep."],
											type = "toggle",
											get = function()
												return cooldowns.sweep
											end,
											set = function(self,value)
												cooldowns.sweep = value

												if (not value) then
													ele_options.args.config.args.general.args.cooldown.args.inverse.disabled = true
												else
													ele_options.args.config.args.general.args.cooldown.args.inverse.disabled = false
												end
											end,
										},
										inverse = {
											order = 3,
											name = L["Reverse Sweep Animation"],
											desc = L["Reverses the cooldown animation sweep."],
											type = "toggle",
											get = function()
												return cooldowns.inverse
											end,
											set = function(self,value)
												cooldowns.inverse = value
											end,
										},
									},
								},
								settings = {
									name = L["Aura Settings"],
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
											get = function() return settings.OoCAlpha end,
											set = function(self,value)
												settings.OoCAlpha = value
												CheckElementalDefaultValues(ele_options,'Settings')
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
											get = function() return settings.flameShock end,
											set = function(self,value)
												settings.flameShock = value
												CheckElementalDefaultValues(ele_options,'Settings')
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
											get = function() return settings.totemMastery end,
											set = function(self,value)
												settings.totemMastery = value
												CheckElementalDefaultValues(ele_options,'Settings')
											end,
										},
										OoRColor = {
											type = "color",
											order = 4,
											name = L["Color (OoR)"],
											desc = L["Determines the color of harmful auras will appear when out of range"],
											hasAlpha = true,
											get = function(info)
												local color = settings.OoRColor
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = settings.OoRColor
												
												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckElementalDefaultValues(ele_options,'Settings')
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
											name = L["Reset Settings Values"],
											func = function()
												settings.flameShock = settingDefaults[1].flameShock
												settings.totemMastery = settingDefaults[1].totemMastery
												settings.OoCAlpha = settingDefaults.OoCAlpha
												settings.OoRColor.r = settingDefaults.OoRColor.r
												settings.OoRColor.g = settingDefaults.OoRColor.g
												settings.OoRColor.b = settingDefaults.OoRColor.b
												settings.OoRColor.a = settingDefaults.OoRColor.a
												ele_options.args.config.args.general.args.settings.args.reset.disabled = true
												ele_options.args.config.args.general.args.settings.args.reset.name = "|cFF666666"..L["Reset Settings Values"].."|r"
											end,
										},
									},
								},
							},
						},
						maelstromBar = {
							name = L["Maelstrom Bar"],
							order = 6,
							type = "group",
							inline = false,
							args = {
								adjust = {
									order = 1,
									name = L["Modify Maelstrom Bar"],
									desc = L["Toggle the adjustment of the Maelstrom Bar"],
									type = "toggle",
									get = function()
										return statusbars.maelstromBar.adjust.isEnabled
									end,
									set = function(self,value)
										statusbars.maelstromBar.adjust.isEnabled = value
										CheckElementalDefaultValues(ele_options,'Maelstrom')
									end,
								},
								textToggle = {
									order = 2,
									name = L["Maelstrom Value Text"],
									desc = L["Toggles the text display of the amount of maelstrom remaining"],
									type = "toggle",
									get = function()
										return statusbars.maelstromBar.text.isDisplayText
									end,
									set = function(self,value)
										statusbars.maelstromBar.text.isDisplayText = value									
										CheckElementalDefaultValues(ele_options,'Maelstrom')
									end,
								},
								animation = {
									order = 3,
									type = "toggle",
									name = L["Maelstrom Lightning"],
									get = function() 
										return statusbars.maelstromBar.animate
									end,
									set = function(self,value)
										statusbars.maelstromBar.animate = value
										CheckElementalDefaultValues(ele_options,"Maelstrom")
									end,
								},
								general = {
									name = "|cFFFFFFFF"..L["Settings"].."|r",
									order = 4,
									type = "group",
									guiInline = true,
									args = {
										alphaCombat = {
											order = 1,
											type = "range",
											name = L["Alpha (In Combat)"],
											desc = L["Determines how opaque or transparent the bar will appear while in combat"],
											min = 0,
											max = 1,
											step = 0.1,
											bigStep = 0.1,
											get = function() return statusbars.maelstromBar.alphaCombat end,
											set = function(self,value)
												statusbars.maelstromBar.alphaCombat = value
												CheckElementalDefaultValues(ele_options,'Maelstrom')
											end,
										},
										alphaOoC = {
											order = 2,
											type = "range",
											name = L["Alpha (OoC - No Target)"],
											desc = L["Determines how opaque or transparent the bar will appear when out of combat"],
											min = 0,
											max = 1,
											step = 0.1,
											bigStep = 0.1,
											--disabled = false,
											get = function() return statusbars.maelstromBar.alphaOoC end,
											set = function(self,value)
												statusbars.maelstromBar.alphaOoC = value
												CheckElementalDefaultValues(ele_options,'Maelstrom')
											end,
										},
										alphaTarget = {
											order = 3,
											type = "range",
											name = L["Alpha (OoC - Target)"],
											desc = L["Determines how opaque or transparent the bar will appear when out of combat and targetting an enemy"],
											min = 0,
											max = 1,
											step = 0.1,
											bigStep = 0.1,
											disabled = false,
											get = function() return statusbars.maelstromBar.alphaTar end,
											set = function(self,value)
												statusbars.maelstromBar.alphaTar = value
												CheckElementalDefaultValues(ele_options,'Maelstrom')
											end,
										},
										threshold = {
											order = 4,
											type = "range",
											name = L["Maelstrom Trigger"],
											desc = L["The amount of Maelstrom accumulated at which the \"Lightning\" animation will appear"],
											min = 50,
											max = 100,
											step = 1,
											bigStep = 5,
											disabled = false,
											get = function() return statusbars.maelstromBar.threshold end,
											set = function(self,value)
												statusbars.maelstromBar.threshold = value
												CheckElementalDefaultValues(ele_options,'Maelstrom')
											end,
										},
									},
								},
								text = {
									name = '|cFFFFFFFF'..L['Maelstrom Text']..'|r',
									type = "group",
									order = 5,
									disabled = true,
									guiInline = true,
									args = {
										color = {
											type = "color",
											order = 1,
											name = L["Text Color"],
											desc = L["Set the color of the text."],
											hasAlpha = true,
											get = function(info)
												local color = statusbars.maelstromBar.text.font.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = statusbars.maelstromBar.text.font.color
												
												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckElementalDefaultValues(ele_options,'Maelstrom')
											end,
										},
										filler_0 = {
											order = 2,
											type = "description",
											name = ' ',
										},
										timeFontName = {
											order = 3,
											type = "select",
											dialogControl = "LSM30_Font",
											name = L["Font"],
											desc = L["The font that will be used"],
											values = LSM:HashTable("font"),
											get = function()
												return statusbars.maelstromBar.text.font.name 
											end,
											set = function(self,value)
												statusbars.maelstromBar.text.font.name = value
												CheckElementalDefaultValues(ele_options,'Maelstrom')
											end,
										},
										timeFontSize = {
											order = 4,
											type = "range",
											name = L["Font Size"],
											desc = L["Customize the font size of the cooldown text"],
											min = 5,
											max = 40,
											step = 1,
											bigStep = 1,
											get = function() return
												statusbars.maelstromBar.text.font.size
											end,
											set = function(self,value)
												statusbars.maelstromBar.text.font.size = value
												CheckElementalDefaultValues(ele_options,'Maelstrom')
											end,
										},
										timeFontOutline = {
											order = 5,
											type = "select",
											name = L["Font Outline"],
											desc = L["The outline of the font"],
											get = function()
												return statusbars.maelstromBar.text.font.flag
											end,
											set = function(self,value)
												statusbars.maelstromBar.text.font.flag = value
												CheckElementalDefaultValues(ele_options,'Maelstrom')
											end,
											values = {
												[""] = L["None"],
												["OUTLINE"] = L["Outline"],
												["THICKOUTLINE"] = L["Thick Outline"],
												["MONOCHROME"] = L["Monochrome"],
												["OUTLINE, MONOCHROME"] = L["Monochrome Outline"],
												["THICKOUTLINE, MONOCHROME"] = L["Monochrome Thick Outline"],
											},
										},
										timeTextAnchor = {
											order = 6,
											type = "select",
											name = L["Anchor Point"],
											desc = L["Set the anchor point."],
											get = function()
												return statusbars.maelstromBar.text.justify
											end,
											set = function(self,value)
												statusbars.maelstromBar.text.justify = value
												CheckElementalDefaultValues(ele_options,'Maelstrom')
											end,
											values = {
												["TOPLEFT"] = L["TOPLEFT"],
												["TOP"] = L["TOP"],
												["TOPRIGHT"] = L["TOPRIGHT"],
												["LEFT"] = L["LEFT"],
												["CENTER"] = L["CENTER"],
												["RIGHT"] = L["RIGHT"],
												["BOTTOMLEFT"] = L["BOTTOMLEFT"],
												["BOTTOM"] = L["BOTTOM"],
												["BOTTOMRIGHT"] = L["BOTTOMRIGHT"],
											}
										},
										timeTextX = {
											order = 7,
											type = "range",
											name = "X",
											desc = L["Set location of text on the X axis"],
											min = -500,
											max = 500,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.maelstromBar.text.x end,
											set = function(self,value)
												statusbars.maelstromBar.text.x = value
												CheckElementalDefaultValues(ele_options,'Maelstrom')
											end,
										},
										timeTextY = {
											order = 8,
											type = "range",
											name = "Y",
											desc = L["Set location of text on the Y axis"],
											min = -100,
											max = 100,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.maelstromBar.text.y end,
											set = function(self,value)
												statusbars.maelstromBar.text.y = value
												CheckElementalDefaultValues(ele_options,'Maelstrom')
											end,
										},
										shadow = {
											name = '|cFFFFFFFF'..L['Text Shadow']..'|r',
											type = "group",
											order = 9,
											hidden = false,
											guiInline = true,
											args = {
												shadowToggle = {
													order = 1,
													name = L["Toggle"],
													desc = '',
													type = "toggle",
													get = function()
														return statusbars.maelstromBar.text.font.shadow.isEnabled
													end,
													set = function(self,value)
														statusbars.maelstromBar.text.font.shadow.isEnabled = value
														CheckElementalDefaultValues(ele_options,'Maelstrom')
													end,
												},
												shadowColor = {
													type = "color",
													order = 2,
													name = L["Shadow Color"],
													desc = L["Set the color of the text's shadow."],
													hasAlpha = true,
													get = function(info)
														local color = statusbars.maelstromBar.text.font.shadow.color
														return color.r, color.g, color.b, color.a
													end,
													set = function(info, r, g, b, a)
														local color = statusbars.maelstromBar.text.font.shadow.color

														color.r = tonumber(string.format("%.2f",r))
														color.g = tonumber(string.format("%.2f",g))
														color.b = tonumber(string.format("%.2f",b))
														color.a = tonumber(string.format("%.2f",a))
														
														CheckElementalDefaultValues(ele_options,'Maelstrom')
													end,
												},
												filler_0 = {
													order = 3,
													type = "description",
													name = ' ',
												},
												shadowX = {
													order = 4,
													type = "range",
													name = "X",
													desc = L["Set the text shadow's X offset"],
													min = -10,
													max = 10,
													step = 1,
													bigStep = 1,
													disabled = true,
													get = function() return statusbars.maelstromBar.text.font.shadow.offset.x end,
													set = function(self,value)
														statusbars.maelstromBar.text.font.shadow.offset.x = value
														CheckElementalDefaultValues(ele_options,'Maelstrom')
													end,
												},
												shadowY = {
													order = 5,
													type = "range",
													name = "Y",
													desc = L["Set the text shadow's Y offset"],
													min = -10,
													max = 10,
													step = 1,
													bigStep = 1,
													disabled = true,
													get = function() return statusbars.maelstromBar.text.font.shadow.offset.y end,
													set = function(self,value)
														statusbars.maelstromBar.text.font.shadow.offset.y = value
														CheckElementalDefaultValues(ele_options,'Maelstrom')
													end,
												},
											},
										},
									},
								},
								layout = {
									name = L["Layout & Design"],
									type = "group",
									order = 6,
									guiInline = true,
									args = {
										texture = {
											order = 1,
											type = "select",
											name = L["Bar Texture"],
											desc = L["Set the bar's texture."],
											dialogControl = "LSM30_Statusbar",
											get = function()
												return statusbars.maelstromBar.foreground.texture
											end,
											set = function(self,value)
												statusbars.maelstromBar.foreground.texture = value
												CheckElementalDefaultValues(ele_options,"Maelstrom")
											end,
											values = LSM:HashTable(LSM.MediaType.STATUSBAR),
										},
										textureColor = {
											type = "color",
											order = 2,
											name = L["Bar Color"],
											get = function(info)
												local color = statusbars.maelstromBar.foreground.color
												return color.r, color.g, color.b
											end,
											set = function(info, r, g, b)
												local color = statusbars.maelstromBar.foreground.color

												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												CheckElementalDefaultValues(ele_options,'Maelstrom')
											end,
										},
										filler_0 = {
											order = 3,
											type = "description",
											name = ' ',
										},
										backgroundTexture = {
											order = 4,
											type = "select",
											name = L["Background Texture"],
											desc = L["Set the bar's background texture."],
											dialogControl = "LSM30_Statusbar",
											get = function()
												return statusbars.maelstromBar.background.texture
											end,
											set = function(self,value)
												statusbars.maelstromBar.background.texture = value
												CheckElementalDefaultValues(ele_options,"Maelstrom")
											end,
											values = LSM:HashTable(LSM.MediaType.STATUSBAR),
										},
										backgroundColor = {
											type = "color",
											order = 5,
											name = L["Background Color"],
											desc = L["Set the color of the cast bar's background."],
											hasAlpha = true,
											get = function(info)
												local color = statusbars.maelstromBar.background.color

												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = statusbars.maelstromBar.background.color

												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckElementalDefaultValues(ele_options,'Maelstrom')
											end,
										},
										backgroundToggle = {
											order = 6,
											name = L["Modify Background"],
											desc = L["Toggle the adjustment of the bar's background texture"],
											type = "toggle",
											get = function()
												return statusbars.maelstromBar.adjust.showBG
											end,
											set = function(self,value)
												statusbars.maelstromBar.adjust.showBG = value
												CheckElementalDefaultValues(ele_options,'Maelstrom')
											end,
										},
										width = {
											order = 7,
											type = "range",
											name = L["Width"],
											desc = '',
											min = 100,
											max = 500,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.maelstromBar.layout.width end,
											set = function(self,value)
												statusbars.maelstromBar.layout.width = value
												CheckElementalDefaultValues(ele_options,'Maelstrom')
											end,
										},
										height = {
											order = 8,
											type = "range",
											name = L["Height"],
											desc = '',
											min = 10,
											max = 100,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.maelstromBar.layout.height end,
											set = function(self,value)
												statusbars.maelstromBar.layout.height = value
												CheckElementalDefaultValues(ele_options,'Maelstrom')
											end,
										},
									},
								},
								reset = {
									order = 7,
									type = "execute",
									name = L["Reset Maelstrom Bar"],
									func = function()
										local bar = statusbars.maelstromBar
										local default = statusbarDefaults.maelstromBar
										
										bar.alphaCombat = default.alphaCombat
										bar.alphaOoC = default.alphaOoC
										bar.alphaTar = default.alphaTar
										bar.animate = true
										bar.threshold = default.threshold
										
										bar.text.isDisplayText = true
										bar.text.x = default.text.x
										bar.text.y = default.text.y
										bar.text.font.name = default.text.font.name
										bar.text.font.size = default.text.font.size
										bar.text.font.flag = default.text.font.flag
										bar.text.font.color.r = default.text.font.color.r
										bar.text.font.color.g = default.text.font.color.g
										bar.text.font.color.b = default.text.font.color.b
										bar.text.font.color.a = default.text.font.color.a
										bar.text.font.shadow.isEnabled = false
										bar.text.font.shadow.offset.x = default.text.font.shadow.offset.x
										bar.text.font.shadow.offset.y = default.text.font.shadow.offset.y
										bar.text.font.shadow.color.r = default.text.font.shadow.color.r
										bar.text.font.shadow.color.g = default.text.font.shadow.color.g
										bar.text.font.shadow.color.b = default.text.font.shadow.color.b
										bar.text.font.shadow.color.a = default.text.font.shadow.color.a
										bar.text.justify = default.text.justify
										
										bar.background.texture = default.background.texture
										bar.background.color.r = default.background.color.r
										bar.background.color.g = default.background.color.g
										bar.background.color.b = default.background.color.b
										bar.background.color.a = default.background.color.a
										
										bar.foreground.color.r = default.foreground.color.r
										bar.foreground.color.g = default.foreground.color.g
										bar.foreground.color.b = default.foreground.color.b
										bar.foreground.texture = default.foreground.texture
										
										bar.layout.width = default.layout.width
										bar.layout.height = default.layout.height
										bar.layout.strata = default.layout.strata
										ele_options.args.config.args.maelstromBar.args.reset.disabled = true
										ele_options.args.config.args.maelstromBar.args.reset.name = "|cFF666666"..L["Reset Maelstrom Bar"].."|r"
										CheckElementalDefaultValues(ele_options,'Maelstrom')
										
										if (not bar.adjust.isEnabled) then
											Auras:InitializeProgressBar('MaelstromBarEle',nil,'maelstromBar','text',nil,1)
										end
									end,
								},
							},
						},
						castBar = {
							name = L["Cast Bar"],
							order = 7,
							inline = false,
							type = "group",
							args = {
								adjust = {
									order = 1,
									name = L["Modify Cast Bar"],
									desc = L["Toggle the adjustment of the Cast Bar"],
									type = "toggle",
									get = function()
										return statusbars.castBar.adjust.isEnabled
									end,
									set = function(self,value)
										statusbars.castBar.adjust.isEnabled = value
										CheckElementalDefaultValues(ele_options,'Cast','castBar')
									end,
								},
								nametextToggle = {
									order = 2,
									name = L["Toggle Spell Name Text"],
									desc = L["Toggles the text display of the spell casted"],
									type = "toggle",
									--disabled = true,
									get = function()
										return statusbars.castBar.nametext.isDisplayText
									end,
									set = function(self,value)
										statusbars.castBar.nametext.isDisplayText = value
										CheckElementalDefaultValues(ele_options,'Cast','castBar')
									end,
								},
								timetextToggle = {
									order = 3,
									name = L["Toggle Time Text"],
									desc = L["Toggles the text display of the spell casted"],
									type = "toggle",
									--disabled = true,
									get = function()
										return statusbars.castBar.timetext.isDisplayText
									end,
									set = function(self,value)
										statusbars.castBar.timetext.isDisplayText = value
										CheckElementalDefaultValues(ele_options,'Cast','castBar')
									end,
								},
								general = {
									name = "|cFFFFFFFF"..L["Settings"].."|r",
									order = 4,
									type = "group",
									guiInline = true,
									args = {
										alphaCombat = {
											order = 1,
											type = "range",
											name = L["Alpha (In Combat)"],
											desc = L["Determines how opaque or transparent the bar will appear while in combat"],
											min = 0,
											max = 1,
											step = 0.1,
											bigStep = 0.1,
											get = function() return statusbars.castBar.alphaCombat end,
											set = function(self,value)
												statusbars.castBar.alphaCombat = value
												CheckElementalDefaultValues(ele_options,'Cast','castBar')
											end,
										},
										alphaOoC = {
											order = 2,
											type = "range",
											name = L["Alpha (Out of Combat)"],
											desc = L["Determines how opaque or transparent the bar will appear when out of combat"],
											min = 0,
											max = 1,
											step = 0.1,
											bigStep = 0.1,
											get = function() return statusbars.castBar.alphaOoC end,
											set = function(self,value)
												statusbars.castBar.alphaOoC = value
												CheckElementalDefaultValues(ele_options,'Cast','castBar')
											end,
										},
									},
								},
								iconSpark = {
									name = '|cFFFFFFFF'..L['Icon & Spark']..'|r',
									type = "group",
									order = 5,
									disabled = true,
									guiInline = true,
									args = {
										sparkToggle = {
											order = 1,
											name = L["Toggle Spark"],
											desc = '',
											type = "toggle",
											get = function()
												return statusbars.castBar.spark
											end,
											set = function(self,value)
												statusbars.castBar.spark = value
												CheckElementalDefaultValues(ele_options,'Cast','castBar')
											end,
										},
										iconToggle = {
											order = 2,
											name = L["Toggle Icon"],
											desc = '',
											type = "toggle",
											get = function()
												return statusbars.castBar.icon.isEnabled
											end,
											set = function(self,value)
												local option = ele_options.args.config.args.castBar.args.iconSpark.args.iconJustify.disabled
												if (value) then
													option = false
												else
													option = true
												end
												statusbars.castBar.icon.isEnabled = value
												CheckElementalDefaultValues(ele_options,'Cast','castBar')
											end,
										},
										iconJustify = {
											order = 3,
											type = "select",
											name = L["Icon Justify"],
											desc = L["Set the side of the progress bar that the icon will appear."],
											get = function()
												return statusbars.castBar.icon.justify
											end,
											set = function(self,value)
												statusbars.castBar.icon.justify = value
												CheckElementalDefaultValues(ele_options,'Cast','castBar')
											end,
											values = {
												["LEFT"] = L["Left"],
												["RIGHT"] = L["Right"],
											},
										},
									},
								},
								nametext = {
									name = '|cFFFFFFFF'..L['Spell Name Text']..'|r',
									type = "group",
									order = 6,
									disabled = true,
									guiInline = true,
									args = {
										color = {
											type = "color",
											order = 1,
											name = L["Text Color"],
											desc = L["Set the color of the text."],
											hasAlpha = true,
											get = function(info)
												local color = statusbars.castBar.nametext.font.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = statusbars.castBar.nametext.font.color
												
												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckElementalDefaultValues(ele_options,'Cast','castBar')
											end,
										},
										filler_0 = {
											order = 2,
											type = "description",
											name = ' ',
										},
										fontName = {
											order = 4,
											type = "select",
											dialogControl = "LSM30_Font",
											name = L["Font"],
											desc = L["The font that will be used"],
											values = LSM:HashTable("font"),
											get = function() return statusbars.castBar.nametext.font.name end,
											set = function(self,value)
												statusbars.castBar.nametext.font.name = value
												CheckElementalDefaultValues(ele_options,'Cast','castBar')
											end,
										},
										fontSize = {
											order = 5,
											type = "range",
											name = L["Font Size"],
											desc = L["Customize the font size of the cooldown text"],
											min = 5,
											max = 40,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.castBar.nametext.font.size end,
											set = function(self,value)
												statusbars.castBar.nametext.font.size = value
												CheckElementalDefaultValues(ele_options,'Cast','castBar')
											end,
										},
										fontOutline = {
											order = 6,
											type = "select",
											name = L["Font Outline"],
											desc = L["The outline of the font"],
											get = function()
												return statusbars.castBar.nametext.font.flag
											end,
											set = function(self,value)
												statusbars.castBar.nametext.font.flag = value
												CheckElementalDefaultValues(ele_options,'Cast','castBar')
											end,
											values = {
												[""] = L["None"],
												["OUTLINE"] = L["Outline"],
												["THICKOUTLINE"] = L["Thick Outline"],
												["MONOCHROME"] = L["Monochrome"],
												["OUTLINE, MONOCHROME"] = L["Monochrome Outline"],
												["THICKOUTLINE, MONOCHROME"] = L["Monochrome Thick Outline"],
											},
										},
										nametextAnchor = {
											order = 7,
											type = "select",
											name = L["Anchor Point"],
											desc = L["Set the anchor point."],
											get = function()
												return statusbars.castBar.nametext.justify
											end,
											set = function(self,value)
												statusbars.castBar.nametext.justify = value
												CheckElementalDefaultValues(ele_options,'Cast','castBar')
											end,
											values = {
												["TOPLEFT"] = L["TOPLEFT"],
												["TOP"] = L["TOP"],
												["TOPRIGHT"] = L["TOPRIGHT"],
												["LEFT"] = L["LEFT"],
												["CENTER"] = L["CENTER"],
												["RIGHT"] = L["RIGHT"],
												["BOTTOMLEFT"] = L["BOTTOMLEFT"],
												["BOTTOM"] = L["BOTTOM"],
												["BOTTOMRIGHT"] = L["BOTTOMRIGHT"],
											}
										},
										nametextX = {
											order = 8,
											type = "range",
											name = "X",
											desc = L["Set location of text on the X axis"],
											min = -500,
											max = 500,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.castBar.nametext.x end,
											set = function(self,value)
												statusbars.castBar.nametext.x = value
												CheckElementalDefaultValues(ele_options,'Cast','castBar')
											end,
										},
										nametextY = {
											order = 9,
											type = "range",
											name = "Y",
											desc = L["Set location of text on the Y axis"],
											min = -100,
											max = 100,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.castBar.nametext.y end,
											set = function(self,value)
												statusbars.castBar.nametext.y = value
												CheckElementalDefaultValues(ele_options,'Cast','castBar')
											end,
										},
										shadow = {
											name = '|cFFFFFFFF'..L['Text Shadow']..'|r',
											type = "group",
											order = 10,
											hidden = false,
											guiInline = true,
											args = {
												shadowToggle = {
													order = 1,
													name = L["Toggle"],
													desc = '',
													type = "toggle",
													get = function()
														return statusbars.castBar.nametext.font.shadow.isEnabled
													end,
													set = function(self,value)
														statusbars.castBar.nametext.font.shadow.isEnabled = value
														CheckElementalDefaultValues(ele_options,'Cast','castBar')
													end,
												},
												shadowColor = {
													type = "color",
													order = 2,
													name = L["Shadow Color"],
													desc = L["Set the color of the text's shadow."],
													hasAlpha = true,
													get = function(info)
														local color = statusbars.castBar.nametext.font.shadow.color
														return color.r, color.g, color.b, color.a
													end,
													set = function(info, r, g, b, a)
														local color = statusbars.castBar.nametext.font.shadow.color

														color.r = tonumber(string.format("%.2f",r))
														color.g = tonumber(string.format("%.2f",g))
														color.b = tonumber(string.format("%.2f",b))
														color.a = tonumber(string.format("%.2f",a))
														CheckElementalDefaultValues(ele_options,'Cast','castBar')
													end,
												},
												filler_0 = {
													order = 3,
													type = "description",
													name = ' ',
												},
												shadowX = {
													order = 4,
													type = "range",
													name = "X",
													desc = L["Set the text shadow's X offset"],
													min = -10,
													max = 10,
													step = 1,
													bigStep = 1,
													disabled = true,
													get = function() return statusbars.castBar.nametext.font.shadow.offset.x end,
													set = function(self,value)
														statusbars.castBar.nametext.font.shadow.offset.x = value
														CheckElementalDefaultValues(ele_options,'Cast','castBar')
													end,
												},
												shadowY = {
													order = 5,
													type = "range",
													name = "Y",
													desc = L["Set the text shadow's Y offset"],
													min = -10,
													max = 10,
													step = 1,
													bigStep = 1,
													disabled = true,
													get = function() return statusbars.castBar.nametext.font.shadow.offset.y end,
													set = function(self,value)
														statusbars.castBar.nametext.font.shadow.offset.y = value
														CheckElementalDefaultValues(ele_options,'Cast','castBar')
													end,
												},
											},
										},
									},
								},
								timetext = {
									name = '|cFFFFFFFFTimer Text|r',
									type = "group",
									order = 7,
									disabled = true,
									guiInline = true,
									args = {
										color = {
											type = "color",
											order = 1,
											name = L["Text Color"],
											desc = L["Set the color of the text."],
											hasAlpha = true,
											get = function(info)
												local color = statusbars.castBar.timetext.font.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = statusbars.castBar.timetext.font.color
												
												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckElementalDefaultValues(ele_options,'Cast','castBar')
											end,
										},
										filler_0 = {
											order = 2,
											type = "description",
											name = ' ',
										},
										timeFontName = {
											order = 3,
											type = "select",
											dialogControl = "LSM30_Font",
											name = L["Font"],
											desc = L["The font that will be used"],
											values = LSM:HashTable("font"),
											get = function() return statusbars.castBar.timetext.font.name end,
											set = function(self,value)
												statusbars.castBar.timetext.font.name = value
												CheckElementalDefaultValues(ele_options,'Cast','castBar')
											end,
										},
										timeFontSize = {
											order = 4,
											type = "range",
											name = L["Font Size"],
											desc = L["Customize the font size of the cooldown text"],
											min = 5,
											max = 40,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.castBar.timetext.font.size end,
											set = function(self,value)
												statusbars.castBar.timetext.font.size = value
												CheckElementalDefaultValues(ele_options,'Cast','castBar')
											end,
										},
										timeFontOutline = {
											order = 5,
											type = "select",
											name = L["Font Outline"],
											desc = L["The outline of the font"],
											get = function()
												return statusbars.castBar.timetext.font.flag
											end,
											set = function(self,value)
												statusbars.castBar.timetext.font.flag = value
												CheckElementalDefaultValues(ele_options,'Cast','castBar')
											end,
											values = {
												[""] = L["None"],
												["OUTLINE"] = L["Outline"],
												["THICKOUTLINE"] = L["Thick Outline"],
												["MONOCHROME"] = L["Monochrome"],
												["OUTLINE, MONOCHROME"] = L["Monochrome Outline"],
												["THICKOUTLINE, MONOCHROME"] = L["Monochrome Thick Outline"],
											},
										},
										timeTextAnchor = {
											order = 6,
											type = "select",
											name = L["Anchor Point"],
											desc = L["Set the anchor point."],
											get = function()
												return statusbars.castBar.timetext.justify
											end,
											set = function(self,value)
												statusbars.castBar.timetext.justify = value
												CheckElementalDefaultValues(ele_options,'Cast','castBar')
											end,
											values = {
												["TOPLEFT"] = L["TOPLEFT"],
												["TOP"] = L["TOP"],
												["TOPRIGHT"] = L["TOPRIGHT"],
												["LEFT"] = L["LEFT"],
												["CENTER"] = L["CENTER"],
												["RIGHT"] = L["RIGHT"],
												["BOTTOMLEFT"] = L["BOTTOMLEFT"],
												["BOTTOM"] = L["BOTTOM"],
												["BOTTOMRIGHT"] = L["BOTTOMRIGHT"],
											}
										},
										timeTextX = {
											order = 7,
											type = "range",
											name = "X",
											desc = L["Set location of text on the X axis"],
											min = -500,
											max = 500,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.castBar.timetext.x end,
											set = function(self,value)
												statusbars.castBar.timetext.x = value
												CheckElementalDefaultValues(ele_options,'Cast','castBar')
											end,
										},
										timeTextY = {
											order = 8,
											type = "range",
											name = "Y",
											desc = L["Set location of text on the Y axis"],
											min = -100,
											max = 100,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.castBar.timetext.y end,
											set = function(self,value)
												statusbars.castBar.timetext.y = value
												CheckElementalDefaultValues(ele_options,'Cast','castBar')
											end,
										},
										shadow = {
											name = '|cFFFFFFFF'..L['Text Shadow']..'|r',
											type = "group",
											order = 9,
											hidden = false,
											guiInline = true,
											args = {
												shadowToggle = {
													order = 1,
													name = L["Toggle"],
													desc = '',
													type = "toggle",
													--disabled = true,
													get = function()
														return statusbars.castBar.timetext.font.shadow.isEnabled
													end,
													set = function(self,value)
														statusbars.castBar.timetext.font.shadow.isEnabled = value
														CheckElementalDefaultValues(ele_options,'Cast','castBar')
													end,
												},
												shadowColor = {
													type = "color",
													order = 2,
													name = L["Shadow Color"],
													desc = L["Set the color of the text's shadow."],
													hasAlpha = true,
													disabled = true,
													get = function(info)
														local color = statusbars.castBar.timetext.font.shadow.color
														return color.r, color.g, color.b, color.a
													end,
													set = function(info, r, g, b, a)
														local color = statusbars.castBar.timetext.font.shadow.color
														
														color.r = tonumber(string.format("%.2f",r))
														color.g = tonumber(string.format("%.2f",g))
														color.b = tonumber(string.format("%.2f",b))
														color.a = tonumber(string.format("%.2f",a))
														CheckElementalDefaultValues(ele_options,'Cast','castBar')
													end,
												},
												filler_0 = {
													order = 3,
													type = "description",
													name = ' ',
												},
												shadowX = {
													order = 4,
													type = "range",
													name = "X",
													desc = L["Set the text shadow's X offset"],
													min = -10,
													max = 10,
													step = 1,
													bigStep = 1,
													disabled = true,
													get = function() return statusbars.castBar.timetext.font.shadow.offset.x end,
													set = function(self,value)
														statusbars.castBar.timetext.font.shadow.offset.x = value
														CheckElementalDefaultValues(ele_options,'Cast','castBar')
													end,
												},
												shadowY = {
													order = 5,
													type = "range",
													name = "Y",
													desc = L["Set the text shadow's Y offset"],
													min = -10,
													max = 10,
													step = 1,
													bigStep = 1,
													disabled = true,
													get = function() return statusbars.castBar.timetext.font.shadow.offset.y end,
													set = function(self,value)
														statusbars.castBar.timetext.font.shadow.offset.y = value
														CheckElementalDefaultValues(ele_options,'Cast','castBar')
													end,
												},
											},
										},
									},
								},
								layout = {
									name = L["Layout & Design"],
									type = "group",
									order = 8,
									guiInline = true,
									args = {
										texture = {
											order = 1,
											type = "select",
											name = L["Bar Texture"],
											desc = L["Set the bar's texture."],
											dialogControl = "LSM30_Statusbar",
											get = function()
												return statusbars.castBar.foreground.texture
											end,
											set = function(self,value)
												statusbars.castBar.foreground.texture = value
												CheckElementalDefaultValues(ele_options,'Cast','castBar')
											end,
											values = LSM:HashTable(LSM.MediaType.STATUSBAR),
										},
										textureColor = {
											type = "color",
											order = 2,
											name = L["Bar Color"],
											get = function(info)
												local color = statusbars.castBar.foreground.color
												return color.r, color.g, color.b
											end,
											set = function(info, r, g, b)
												local color = statusbars.castBar.foreground.color

												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												CheckElementalDefaultValues(ele_options,'Cast','castBar')
											end,
										},
										filler_0 = {
											order = 3,
											type = "description",
											name = ' ',
										},
										backgroundTexture = {
											order = 4,
											type = "select",
											name = L["Background Texture"],
											desc = L["Set the bar's background texture."],
											dialogControl = "LSM30_Statusbar",
											get = function()
												return statusbars.castBar.background.texture
											end,
											set = function(self,value)
												statusbars.castBar.background.texture = value
												CheckElementalDefaultValues(ele_options,"Cast",'castBar')
											end,
											values = LSM:HashTable(LSM.MediaType.STATUSBAR),
										},
										backgroundColor = {
											type = "color",
											order = 5,
											name = L["Background Color"],
											desc = L["Set the color of the cast bar's background."],
											hasAlpha = true,
											get = function(info)
												local color = statusbars.castBar.background.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = statusbars.castBar.background.color
												
												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckElementalDefaultValues(ele_options,'Cast','castBar')
											end,
										},
										backgroundToggle = {
											order = 6,
											name = L["Modify Background"],
											desc = L["Toggle the adjustment of the bar's background texture"],
											type = "toggle",
											get = function()
												return statusbars.castBar.adjust.showBG
											end,
											set = function(self,value)
												statusbars.castBar.adjust.showBG = value
												CheckElementalDefaultValues(ele_options,'Cast','castBar')
											end,
										},
										width = {
											order = 7,
											type = "range",
											name = L["Width"],
											desc = '',
											min = 100,
											max = 500,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.castBar.layout.width end,
											set = function(self,value)
												statusbars.castBar.layout.width = value
												CheckElementalDefaultValues(ele_options,'Cast','castBar')
											end,
										},
										height = {
											order = 8,
											type = "range",
											name = L["Height"],
											desc = '',
											min = 10,
											max = 100,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.castBar.layout.height end,
											set = function(self,value)
												statusbars.castBar.layout.height = value
												CheckElementalDefaultValues(ele_options,'Cast','castBar')
											end,
										},
									},
								},
								reset = {
									order = 9,
									type = "execute",
									name = L["Reset Cast Bar"],
									func = function()
										local bar = statusbars.castBar
										local default = statusbarDefaults.castBar
										
										bar.alphaCombat = default.alphaCombat
										bar.alphaOoC = default.alphaOoC
										
										bar.nametext.isDisplayText = true
										bar.nametext.x = default.nametext.x
										bar.nametext.y = default.nametext.y
										bar.nametext.font.name = default.nametext.font.name
										bar.nametext.font.size = default.nametext.font.size
										bar.nametext.font.flag = default.nametext.font.flag
										bar.nametext.font.color.r = default.nametext.font.color.r
										bar.nametext.font.color.g = default.nametext.font.color.g
										bar.nametext.font.color.b = default.nametext.font.color.b
										bar.nametext.font.color.a = default.nametext.font.color.a
										bar.nametext.font.shadow.isEnabled = false
										bar.nametext.font.shadow.offset.x = default.nametext.font.shadow.offset.x
										bar.nametext.font.shadow.offset.y = default.nametext.font.shadow.offset.y
										bar.nametext.font.shadow.color.r = default.nametext.font.shadow.color.r
										bar.nametext.font.shadow.color.g = default.nametext.font.shadow.color.g
										bar.nametext.font.shadow.color.b = default.nametext.font.shadow.color.b
										bar.nametext.font.shadow.color.a = default.nametext.font.shadow.color.a
										bar.nametext.justify = default.nametext.justify
										
										bar.timetext.isDisplayText = true
										bar.timetext.x = default.timetext.x
										bar.timetext.y = default.timetext.y
										bar.timetext.font.name = default.timetext.font.name
										bar.timetext.font.size = default.timetext.font.size
										bar.timetext.font.flag = default.timetext.font.flag
										bar.timetext.font.color.r = default.timetext.font.color.r
										bar.timetext.font.color.g = default.timetext.font.color.g
										bar.timetext.font.color.b = default.timetext.font.color.b
										bar.timetext.font.color.a = default.timetext.font.color.a
										bar.timetext.font.shadow.isEnabled = false
										bar.timetext.font.shadow.offset.x = default.timetext.font.shadow.offset.x
										bar.timetext.font.shadow.offset.y = default.timetext.font.shadow.offset.y
										bar.timetext.font.shadow.color.r = default.timetext.font.shadow.color.r
										bar.timetext.font.shadow.color.g = default.timetext.font.shadow.color.g
										bar.timetext.font.shadow.color.b = default.timetext.font.shadow.color.b
										bar.timetext.font.shadow.color.a = default.timetext.font.shadow.color.a
										bar.timetext.justify = default.timetext.justify
										
										bar.icon.isEnabled = true
										bar.icon.justify = default.icon.justify
										bar.spark = true
										
										bar.background.texture = default.background.texture
										bar.background.color.r = default.background.color.r
										bar.background.color.g = default.background.color.g
										bar.background.color.b = default.background.color.b
										bar.background.color.a = default.background.color.a
										
										bar.foreground.color.r = default.foreground.color.r
										bar.foreground.color.g = default.foreground.color.g
										bar.foreground.color.b = default.foreground.color.b
										bar.foreground.texture = default.foreground.texture
										
										bar.layout.width = default.layout.width
										bar.layout.height = default.layout.height
										bar.layout.strata = default.layout.strata
										ele_options.args.config.args.castBar.args.reset.disabled = true
										ele_options.args.config.args.castBar.args.reset.name = "|cFF666666"..L["Reset Cast Bar"].."|r"
										CheckElementalDefaultValues(ele_options,'Cast','castBar')
										
										if (not bar.adjust.isEnabled) then
											Auras:InitializeProgressBar('CastBarEle',nil,'castBar','nametext','timetext',1)
										end
									end,
								},
							},
						},
						channelBar = {
							name = L["Channel Bar"],
							order = 8,
							inline = false,
							type = "group",
							args = {
								adjust = {
									order = 1,
									name = L["Modify Channel Bar"],
									desc = L["Toggle the adjustment of the Channel Bar"],
									type = "toggle",
									get = function()
										return statusbars.channelBar.adjust.isEnabled
									end,
									set = function(self,value)
										statusbars.channelBar.adjust.isEnabled = value
										CheckElementalDefaultValues(ele_options,'Channel','channelBar')
									end,
								},
								nametextToggle = {
									order = 2,
									name = L["Toggle Spell Name Text"],
									desc = L["Toggles the text display of the spell casted"],
									type = "toggle",
									get = function()
										return statusbars.channelBar.nametext.isDisplayText
									end,
									set = function(self,value)
										statusbars.channelBar.nametext.isDisplayText = value
										CheckElementalDefaultValues(ele_options,'Channel','channelBar')
									end,
								},
								timetextToggle = {
									order = 3,
									name = L["Toggle Time Text"],
									desc = L["Toggles the text display of the spell casted"],
									type = "toggle",
									get = function()
										return statusbars.channelBar.timetext.isDisplayText
									end,
									set = function(self,value)
										statusbars.channelBar.timetext.isDisplayText = value
										CheckElementalDefaultValues(ele_options,'Channel','channelBar')
									end,
								},
								general = {
									name = "|cFFFFFFFF"..L["Settings"].."|r",
									order = 4,
									type = "group",
									guiInline = true,
									args = {
										alphaCombat = {
											order = 1,
											type = "range",
											name = L["Alpha (In Combat)"],
											desc = L["Determines how opaque or transparent the bar will appear while in combat"],
											min = 0,
											max = 1,
											step = 0.1,
											bigStep = 0.1,
											get = function() return statusbars.channelBar.alphaCombat end,
											set = function(self,value)
												statusbars.channelBar.alphaCombat = value
												CheckElementalDefaultValues(ele_options,'Channel','channelBar')
											end,
										},
										alphaOoC = {
											order = 2,
											type = "range",
											name = L["Alpha (Out of Combat)"],
											desc = L["Determines how opaque or transparent the bar will appear when out of combat"],
											min = 0,
											max = 1,
											step = 0.1,
											bigStep = 0.1,
											get = function() return statusbars.channelBar.alphaOoC end,
											set = function(self,value)
												statusbars.channelBar.alphaOoC = value
												CheckElementalDefaultValues(ele_options,'Channel','channelBar')
											end,
										},
									},
								},
								iconSpark = {
									name = '|cFFFFFFFF'..L['Icon & Spark']..'|r',
									type = "group",
									order = 5,
									disabled = true,
									guiInline = true,
									args = {
										sparkToggle = {
											order = 1,
											name = L["Toggle Spark"],
											desc = '',
											type = "toggle",
											get = function()
												return statusbars.channelBar.spark
											end,
											set = function(self,value)
												statusbars.channelBar.spark = value
												CheckElementalDefaultValues(ele_options,'Channel','channelBar')
											end,
										},
										iconToggle = {
											order = 2,
											name = L["Toggle Icon"],
											desc = '',
											type = "toggle",
											get = function()
												return statusbars.channelBar.icon.isEnabled
											end,
											set = function(self,value)
												statusbars.channelBar.icon.isEnabled = value
												CheckElementalDefaultValues(ele_options,'Channel','channelBar')
											end,
										},
										iconJustify = {
											order = 3,
											type = "select",
											name = L["Icon Justify"],
											desc = L["Set the side of the progress bar that the icon will appear."],
											get = function()
												return statusbars.channelBar.icon.justify
											end,
											set = function(self,value)
												statusbars.channelBar.icon.justify = value
												CheckElementalDefaultValues(ele_options,'Channel','channelBar')
											end,
											values = {
												["LEFT"] = L["Left"],
												["RIGHT"] = L["Right"],
											},
										},
									},
								},
								nametext = {
									name = '|cFFFFFFFF'..L['Spell Name Text']..'|r',
									type = "group",
									order = 6,
									disabled = true,
									guiInline = true,
									args = {
										color = {
											type = "color",
											order = 1,
											name = L["Text Color"],
											desc = L["Set the color of the text."],
											hasAlpha = true,
											get = function(info)
												local color = statusbars.channelBar.nametext.font.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = statusbars.channelBar.nametext.font.color
												
												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckElementalDefaultValues(ele_options,'Channel','channelBar')
											end,
										},
										filler_0 = {
											order = 2,
											type = "description",
											name = ' ',
										},
										fontName = {
											order = 4,
											type = "select",
											dialogControl = "LSM30_Font",
											name = L["Font"],
											desc = L["The font that will be used"],
											values = LSM:HashTable("font"),
											get = function() return statusbars.channelBar.nametext.font.name end,
											set = function(self,value)
												statusbars.channelBar.nametext.font.name = value
												CheckElementalDefaultValues(ele_options,'Channel','channelBar')
											end,
										},
										fontSize = {
											order = 5,
											type = "range",
											name = L["Font Size"],
											desc = L["Customize the font size of the cooldown text"],
											min = 5,
											max = 40,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.channelBar.nametext.font.size end,
											set = function(self,value)
												statusbars.channelBar.nametext.font.size = value
												CheckElementalDefaultValues(ele_options,'Channel','channelBar')
											end,
										},
										fontOutline = {
											order = 6,
											type = "select",
											name = L["Font Outline"],
											desc = L["The outline of the font"],
											get = function()
												return statusbars.channelBar.nametext.font.flag
											end,
											set = function(self,value)
												statusbars.channelBar.nametext.font.flag = value
												CheckElementalDefaultValues(ele_options,'Channel','channelBar')
											end,
											values = {
												[""] = L["None"],
												["OUTLINE"] = L["Outline"],
												["THICKOUTLINE"] = L["Thick Outline"],
												["MONOCHROME"] = L["Monochrome"],
												["OUTLINE, MONOCHROME"] = L["Monochrome Outline"],
												["THICKOUTLINE, MONOCHROME"] = L["Monochrome Thick Outline"],
											},
										},
										nametextAnchor = {
											order = 7,
											type = "select",
											name = L["Anchor Point"],
											desc = L["Set the anchor point."],
											get = function()
												return statusbars.channelBar.nametext.justify
											end,
											set = function(self,value)
												statusbars.channelBar.nametext.justify = value
												CheckElementalDefaultValues(ele_options,'Channel','channelBar')
											end,
											values = {
												["TOPLEFT"] = L["TOPLEFT"],
												["TOP"] = L["TOP"],
												["TOPRIGHT"] = L["TOPRIGHT"],
												["LEFT"] = L["LEFT"],
												["CENTER"] = L["CENTER"],
												["RIGHT"] = L["RIGHT"],
												["BOTTOMLEFT"] = L["BOTTOMLEFT"],
												["BOTTOM"] = L["BOTTOM"],
												["BOTTOMRIGHT"] = L["BOTTOMRIGHT"],
											}
										},
										nametextX = {
											order = 8,
											type = "range",
											name = "X",
											desc = L["Set location of text on the X axis"],
											min = -500,
											max = 500,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.channelBar.nametext.x end,
											set = function(self,value)
												statusbars.channelBar.nametext.x = value
												CheckElementalDefaultValues(ele_options,'Channel','channelBar')
											end,
										},
										nametextY = {
											order = 9,
											type = "range",
											name = "Y",
											desc = L["Set location of text on the Y axis"],
											min = -100,
											max = 100,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.channelBar.nametext.y end,
											set = function(self,value)
												statusbars.channelBar.nametext.y = value
												CheckElementalDefaultValues(ele_options,'Channel','channelBar')
											end,
										},
										shadow = {
											name = '|cFFFFFFFF'..L['Text Shadow']..'|r',
											type = "group",
											order = 10,
											hidden = false,
											guiInline = true,
											args = {
												shadowToggle = {
													order = 1,
													name = L["Toggle"],
													desc = '',
													type = "toggle",
													get = function()
														return statusbars.channelBar.nametext.font.shadow.isEnabled
													end,
													set = function(self,value)
														statusbars.channelBar.nametext.font.shadow.isEnabled = value
														CheckElementalDefaultValues(ele_options,'Channel','channelBar')
													end,
												},
												shadowColor = {
													type = "color",
													order = 2,
													name = L["Shadow Color"],
													desc = L["Set the color of the text's shadow."],
													hasAlpha = true,
													disabled = true,
													get = function(info)
														local color = statusbars.channelBar.nametext.font.shadow.color
														return color.r, color.g, color.b, color.a
													end,
													set = function(info, r, g, b, a)
														local color = statusbars.channelBar.nametext.font.shadow.color
														
														color.r = tonumber(string.format("%.2f",r))
														color.g = tonumber(string.format("%.2f",g))
														color.b = tonumber(string.format("%.2f",b))
														color.a = tonumber(string.format("%.2f",a))
														CheckElementalDefaultValues(ele_options,'Channel','channelBar')
													end,
												},
												filler_0 = {
													order = 3,
													type = "description",
													name = ' ',
												},
												shadowX = {
													order = 4,
													type = "range",
													name = "X",
													desc = L["Set the text shadow's X offset"],
													min = -10,
													max = 10,
													step = 1,
													bigStep = 1,
													disabled = true,
													get = function() return statusbars.channelBar.nametext.font.shadow.offset.x end,
													set = function(self,value)
														statusbars.channelBar.nametext.font.shadow.offset.x = value
														CheckElementalDefaultValues(ele_options,'Channel','channelBar')
													end,
												},
												shadowY = {
													order = 5,
													type = "range",
													name = "Y",
													desc = L["Set the text shadow's Y offset"],
													min = -10,
													max = 10,
													step = 1,
													bigStep = 1,
													disabled = true,
													get = function() return statusbars.channelBar.nametext.font.shadow.offset.y end,
													set = function(self,value)
														statusbars.channelBar.nametext.font.shadow.offset.y = value
														CheckElementalDefaultValues(ele_options,'Channel','channelBar')
													end,
												},
											},
										},
									},
								},
								timetext = {
									name = '|cFFFFFFFFTimer Text|r',
									type = "group",
									order = 6,
									disabled = true,
									guiInline = true,
									args = {
										color = {
											type = "color",
											order = 1,
											name = L["Text Color"],
											desc = L["Set the color of the text."],
											hasAlpha = true,
											get = function(info)
												local color = statusbars.channelBar.timetext.font.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = statusbars.channelBar.timetext.font.color
												
												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckElementalDefaultValues(ele_options,'Channel','channelBar')
											end,
										},
										filler_0 = {
											order = 2,
											type = "description",
											name = ' ',
										},
										timeFontName = {
											order = 3,
											type = "select",
											dialogControl = "LSM30_Font",
											name = L["Font"],
											desc = L["The font that will be used"],
											values = LSM:HashTable("font"),
											get = function() return statusbars.channelBar.timetext.font.name end,
											set = function(self,value)
												statusbars.channelBar.timetext.font.name = value
												CheckElementalDefaultValues(ele_options,'Channel','channelBar')
											end,
										},
										timeFontSize = {
											order = 4,
											type = "range",
											name = L["Font Size"],
											desc = L["Customize the font size of the cooldown text"],
											min = 5,
											max = 40,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.channelBar.timetext.font.size end,
											set = function(self,value)
												statusbars.channelBar.timetext.font.size = value
												CheckElementalDefaultValues(ele_options,'Channel','channelBar')
											end,
										},
										timeFontOutline = {
											order = 5,
											type = "select",
											name = L["Font Outline"],
											desc = L["The outline of the font"],
											get = function()
												return statusbars.channelBar.timetext.font.flag
											end,
											set = function(self,value)
												statusbars.channelBar.timetext.font.flag = value
												CheckElementalDefaultValues(ele_options,'Channel','channelBar')
											end,
											values = {
												[""] = L["None"],
												["OUTLINE"] = L["Outline"],
												["THICKOUTLINE"] = L["Thick Outline"],
												["MONOCHROME"] = L["Monochrome"],
												["OUTLINE, MONOCHROME"] = L["Monochrome Outline"],
												["THICKOUTLINE, MONOCHROME"] = L["Monochrome Thick Outline"],
											},
										},
										timeTextAnchor = {
											order = 6,
											type = "select",
											name = L["Anchor Point"],
											desc = L["Set the anchor point."],
											get = function()
												return statusbars.channelBar.timetext.justify
											end,
											set = function(self,value)
												statusbars.channelBar.timetext.justify = value
												CheckElementalDefaultValues(ele_options,'Channel','channelBar')
											end,
											values = {
												["TOPLEFT"] = L["TOPLEFT"],
												["TOP"] = L["TOP"],
												["TOPRIGHT"] = L["TOPRIGHT"],
												["LEFT"] = L["LEFT"],
												["CENTER"] = L["CENTER"],
												["RIGHT"] = L["RIGHT"],
												["BOTTOMLEFT"] = L["BOTTOMLEFT"],
												["BOTTOM"] = L["BOTTOM"],
												["BOTTOMRIGHT"] = L["BOTTOMRIGHT"],
											}
										},
										timeTextX = {
											order = 7,
											type = "range",
											name = "X",
											desc = L["Set location of text on the X axis"],
											min = -500,
											max = 500,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.channelBar.timetext.x end,
											set = function(self,value)
												statusbars.channelBar.timetext.x = value
												CheckElementalDefaultValues(ele_options,'Channel','channelBar')
											end,
										},
										timeTextY = {
											order = 8,
											type = "range",
											name = "Y",
											desc = L["Set location of text on the Y axis"],
											min = -100,
											max = 100,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.channelBar.timetext.y end,
											set = function(self,value)
												statusbars.channelBar.timetext.y = value
												CheckElementalDefaultValues(ele_options,'Channel','channelBar')
											end,
										},
										shadow = {
											name = '|cFFFFFFFF'..L['Text Shadow']..'|r',
											type = "group",
											order = 9,
											hidden = false,
											guiInline = true,
											args = {
												shadowToggle = {
													order = 1,
													name = L["Toggle"],
													desc = '',
													type = "toggle",
													--disabled = true,
													get = function()
														return statusbars.channelBar.timetext.font.shadow.isEnabled
													end,
													set = function(self,value)
														statusbars.channelBar.timetext.font.shadow.isEnabled = value
														CheckElementalDefaultValues(ele_options,'Channel','channelBar')
													end,
												},
												shadowColor = {
													type = "color",
													order = 2,
													name = L["Shadow Color"],
													desc = L["Set the color of the text's shadow."],
													hasAlpha = true,
													disabled = true,
													get = function(info)
														local color = statusbars.channelBar.timetext.font.shadow.color
														return color.r, color.g, color.b, color.a
													end,
													set = function(info, r, g, b, a)
														local color = statusbars.channelBar.timetext.font.shadow.color
														
														color.r = tonumber(string.format("%.2f",r))
														color.g = tonumber(string.format("%.2f",g))
														color.b = tonumber(string.format("%.2f",b))
														color.a = tonumber(string.format("%.2f",a))
														CheckElementalDefaultValues(ele_options,'Channel','channelBar')
													end,
												},
												filler_0 = {
													order = 3,
													type = "description",
													name = ' ',
												},
												shadowX = {
													order = 4,
													type = "range",
													name = "X",
													desc = L["Set the text shadow's X offset"],
													min = -10,
													max = 10,
													step = 1,
													bigStep = 1,
													disabled = true,
													get = function() return statusbars.channelBar.timetext.font.shadow.offset.x end,
													set = function(self,value)
														statusbars.channelBar.timetext.font.shadow.offset.x = value
														CheckElementalDefaultValues(ele_options,'Channel','channelBar')
													end,
												},
												shadowY = {
													order = 5,
													type = "range",
													name = "Y",
													desc = L["Set the text shadow's Y offset"],
													min = -10,
													max = 10,
													step = 1,
													bigStep = 1,
													disabled = true,
													get = function() return statusbars.channelBar.timetext.font.shadow.offset.y end,
													set = function(self,value)
														statusbars.channelBar.timetext.font.shadow.offset.y = value
														CheckElementalDefaultValues(ele_options,'Channel','channelBar')
													end,
												},
											},
										},
									},
								},
								layout = {
									name = L["Layout & Design"],
									type = "group",
									order = 7,
									guiInline = true,
									args = {
										texture = {
											order = 1,
											type = "select",
											name = L["Bar Texture"],
											desc = L["Set the bar's texture."],
											dialogControl = "LSM30_Statusbar",
											get = function()
												return statusbars.channelBar.foreground.texture
											end,
											set = function(self,value)
												statusbars.channelBar.foreground.texture = value
												CheckElementalDefaultValues(ele_options,'Channel','channelBar')
											end,
											values = LSM:HashTable(LSM.MediaType.STATUSBAR),
										},
										textureColor = {
											type = "color",
											order = 2,
											name = L["Bar Color"],
											get = function(info)
												local color = statusbars.channelBar.foreground.color
												return color.r, color.g, color.b
											end,
											set = function(info, r, g, b)
												local color = statusbars.channelBar.foreground.color
												
												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												CheckElementalDefaultValues(ele_options,'Channel','channelBar')
											end,
										},
										filler_0 = {
											order = 3,
											type = "description",
											name = ' ',
										},
										backgroundTexture = {
											order = 4,
											type = "select",
											name = L["Background Texture"],
											desc = L["Set the bar's background texture."],
											dialogControl = "LSM30_Statusbar",
											get = function()
												return statusbars.channelBar.background.texture
											end,
											set = function(self,value)
												statusbars.channelBar.background.texture = value
												CheckElementalDefaultValues(ele_options,"Channel", "channelBar")
											end,
											values = LSM:HashTable(LSM.MediaType.STATUSBAR),
										},
										backgroundColor = {
											type = "color",
											order = 5,
											name = L["Background Color"],
											desc = L["Set the color of the cast bar's background."],
											hasAlpha = true,
											get = function(info)
												local color = statusbars.channelBar.background.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = statusbars.channelBar.background.color
												
												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckElementalDefaultValues(ele_options,'Channel','channelBar')
											end,
										},
										backgroundToggle = {
											order = 6,
											name = L["Modify Background"],
											desc = L["Toggle the adjustment of the bar's background texture"],
											type = "toggle",
											get = function()
												return statusbars.channelBar.adjust.showBG
											end,
											set = function(self,value)
												statusbars.channelBar.adjust.showBG = value
												CheckElementalDefaultValues(ele_options,'Channel','channelBar')
											end,
										},
										width = {
											order = 7,
											type = "range",
											name = L["Width"],
											desc = '',
											min = 100,
											max = 500,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.channelBar.layout.width end,
											set = function(self,value)
												statusbars.channelBar.layout.width = value
												CheckElementalDefaultValues(ele_options,'Channel','channelBar')
											end,
										},
										height = {
											order = 8,
											type = "range",
											name = L["Height"],
											desc = '',
											min = 10,
											max = 100,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.channelBar.layout.height end,
											set = function(self,value)
												statusbars.channelBar.layout.height = value
												CheckElementalDefaultValues(ele_options,'Channel','channelBar')
											end,
										},
									},
								},
								reset = {
									order = 8,
									type = "execute",
									name = L["Reset Channel Bar"],
									func = function()
										local bar = statusbars.channelBar
										local default = statusbarDefaults.channelBar
										
										bar.alphaCombat = default.alphaCombat
										bar.alphaOoC = default.alphaOoC
										
										bar.nametext.isDisplayText = true
										bar.nametext.x = default.nametext.x
										bar.nametext.y = default.nametext.y
										bar.nametext.font.name = default.nametext.font.name
										bar.nametext.font.size = default.nametext.font.size
										bar.nametext.font.flag = default.nametext.font.flag
										bar.nametext.font.color.r = default.nametext.font.color.r
										bar.nametext.font.color.g = default.nametext.font.color.g
										bar.nametext.font.color.b = default.nametext.font.color.b
										bar.nametext.font.color.a = default.nametext.font.color.a
										bar.nametext.font.shadow.isEnabled = false
										bar.nametext.font.shadow.offset.x = default.nametext.font.shadow.offset.x
										bar.nametext.font.shadow.offset.y = default.nametext.font.shadow.offset.y
										bar.nametext.font.shadow.color.r = default.nametext.font.shadow.color.r
										bar.nametext.font.shadow.color.g = default.nametext.font.shadow.color.g
										bar.nametext.font.shadow.color.b = default.nametext.font.shadow.color.b
										bar.nametext.font.shadow.color.a = default.nametext.font.shadow.color.a
										bar.nametext.justify = default.nametext.justify
										
										bar.timetext.isDisplayText = true
										bar.timetext.x = default.timetext.x
										bar.timetext.y = default.timetext.y
										bar.timetext.font.name = default.timetext.font.name
										bar.timetext.font.size = default.timetext.font.size
										bar.timetext.font.flag = default.timetext.font.flag
										bar.timetext.font.color.r = default.timetext.font.color.r
										bar.timetext.font.color.g = default.timetext.font.color.g
										bar.timetext.font.color.b = default.timetext.font.color.b
										bar.timetext.font.color.a = default.timetext.font.color.a
										bar.timetext.font.shadow.isEnabled = false
										bar.timetext.font.shadow.offset.x = default.timetext.font.shadow.offset.x
										bar.timetext.font.shadow.offset.y = default.timetext.font.shadow.offset.y
										bar.timetext.font.shadow.color.r = default.timetext.font.shadow.color.r
										bar.timetext.font.shadow.color.g = default.timetext.font.shadow.color.g
										bar.timetext.font.shadow.color.b = default.timetext.font.shadow.color.b
										bar.timetext.font.shadow.color.a = default.timetext.font.shadow.color.a
										bar.timetext.justify = default.timetext.justify
										
										bar.icon.isEnabled = true
										bar.icon.justify = default.icon.justify
										bar.spark = true
										
										bar.background.texture = default.background.texture
										bar.background.color.r = default.background.color.r
										bar.background.color.g = default.background.color.g
										bar.background.color.b = default.background.color.b
										bar.background.color.a = default.background.color.a
										
										bar.foreground.color.r = default.foreground.color.r
										bar.foreground.color.g = default.foreground.color.g
										bar.foreground.color.b = default.foreground.color.b
										bar.foreground.texture = default.foreground.texture
										
										bar.layout.width = default.layout.width
										bar.layout.height = default.layout.height
										bar.layout.strata = default.layout.strata
										ele_options.args.config.args.channelBar.args.reset.disabled = true
										ele_options.args.config.args.channelBar.args.reset.name = "|cFF666666"..L["Reset Channel Bar"].."|r"
										CheckElementalDefaultValues(ele_options,'Channel','channelBar')
										
										if (not bar.adjust.isEnabled) then
											Auras:InitializeProgressBar('ChannelBarEle',nil,'channelBar','nametext','timetext',1)
										end
									end,
								},
							},
						},
						icefuryBar = {
							name = L["Icefury Bar"],
							order = 9,
							inline = false,
							type = "group",
							args = {
								adjust = {
									order = 1,
									name = L["Modify Icefury Bar"],
									desc = L["Toggle the adjustment of the Icefury Bar"],
									type = "toggle",
									get = function()
										return statusbars.icefuryBar.adjust.isEnabled
									end,
									set = function(self,value)
										statusbars.icefuryBar.adjust.isEnabled = value
										CheckElementalDefaultValues(ele_options,'Icefury')
									end,
								},
								counttextToggle = {
									order = 2,
									name = L["Toggle Buff Count Text"],
									desc = L["Toggles the text display of the remaining stacks on Icefury's buff"],
									type = "toggle",
									get = function()
										return statusbars.icefuryBar.counttext.isDisplayText
									end,
									set = function(self,value)
										statusbars.icefuryBar.counttext.isDisplayText = value
										CheckElementalDefaultValues(ele_options,'Icefury')
									end,
								},
								timetextToggle = {
									order = 3,
									name = L["Toggle Time Text"],
									desc = L["Toggles the text display of the spell casted"],
									type = "toggle",
									get = function()
										return statusbars.icefuryBar.timetext.isDisplayText
									end,
									set = function(self,value)
										statusbars.icefuryBar.timetext.isDisplayText = value
										CheckElementalDefaultValues(ele_options,'Icefury')
									end,
								},
								filler_0 = {
									order = 4,
									type = "description",
									name = ' ',
								},
								counttext = {
									name = '|cFFFFFFFF'..L['Buff Count Text']..'|r',
									type = "group",
									order = 5,
									disabled = true,
									guiInline = true,
									args = {
										color = {
											type = "color",
											order = 1,
											name = L["Text Color"],
											desc = L["Set the color of the text."],
											hasAlpha = true,
											get = function(info)
												local color = statusbars.icefuryBar.counttext.font.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = statusbars.icefuryBar.counttext.font.color
												
												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckElementalDefaultValues(ele_options,'Icefury')
											end,
										},
										filler_0 = {
											order = 2,
											type = "description",
											name = ' ',
										},
										fontName = {
											order = 4,
											type = "select",
											dialogControl = "LSM30_Font",
											name = L["Font"],
											desc = L["The font that will be used"],
											values = LSM:HashTable("font"),
											get = function() return statusbars.icefuryBar.counttext.font.name end,
											set = function(self,value)
												statusbars.icefuryBar.counttext.font.name = value
												CheckElementalDefaultValues(ele_options,'Icefury')
											end,
										},
										fontSize = {
											order = 5,
											type = "range",
											name = L["Font Size"],
											desc = L["Customize the font size of the cooldown text"],
											min = 5,
											max = 40,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.icefuryBar.counttext.font.size end,
											set = function(self,value)
												statusbars.icefuryBar.counttext.font.size = value
												CheckElementalDefaultValues(ele_options,'Icefury')
											end,
										},
										fontOutline = {
											order = 6,
											type = "select",
											name = L["Font Outline"],
											desc = L["The outline of the font"],
											get = function()
												return statusbars.icefuryBar.counttext.font.flag
											end,
											set = function(self,value)
												statusbars.icefuryBar.counttext.font.flag = value
												CheckElementalDefaultValues(ele_options,'Icefury')
											end,
											values = {
												[""] = L["None"],
												["OUTLINE"] = L["Outline"],
												["THICKOUTLINE"] = L["Thick Outline"],
												["MONOCHROME"] = L["Monochrome"],
												["OUTLINE, MONOCHROME"] = L["Monochrome Outline"],
												["THICKOUTLINE, MONOCHROME"] = L["Monochrome Thick Outline"],
											},
										},
										counttextAnchor = {
											order = 7,
											type = "select",
											name = L["Anchor Point"],
											desc = L["Set the anchor point."],
											get = function()
												return statusbars.icefuryBar.counttext.justify
											end,
											set = function(self,value)
												statusbars.icefuryBar.counttext.justify = value
												CheckElementalDefaultValues(ele_options,'Icefury')
											end,
											values = {
												["TOPLEFT"] = L["TOPLEFT"],
												["TOP"] = L["TOP"],
												["TOPRIGHT"] = L["TOPRIGHT"],
												["LEFT"] = L["LEFT"],
												["CENTER"] = L["CENTER"],
												["RIGHT"] = L["RIGHT"],
												["BOTTOMLEFT"] = L["BOTTOMLEFT"],
												["BOTTOM"] = L["BOTTOM"],
												["BOTTOMRIGHT"] = L["BOTTOMRIGHT"],
											}
										},
										counttextX = {
											order = 8,
											type = "range",
											name = "X",
											desc = L["Set location of text on the X axis"],
											min = -500,
											max = 500,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.icefuryBar.counttext.x end,
											set = function(self,value)
												statusbars.icefuryBar.counttext.x = value
												CheckElementalDefaultValues(ele_options,'Icefury')
											end,
										},
										counttextY = {
											order = 9,
											type = "range",
											name = "Y",
											desc = L["Set location of text on the Y axis"],
											min = -100,
											max = 100,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.icefuryBar.counttext.y end,
											set = function(self,value)
												statusbars.icefuryBar.counttext.y = value
												CheckElementalDefaultValues(ele_options,'Icefury')
											end,
										},
										shadow = {
											name = '|cFFFFFFFF'..L['Text Shadow']..'|r',
											type = "group",
											order = 10,
											hidden = false,
											guiInline = true,
											args = {
												shadowToggle = {
													order = 1,
													name = L["Toggle"],
													desc = '',
													type = "toggle",
													get = function()
														return statusbars.icefuryBar.counttext.font.shadow.isEnabled
													end,
													set = function(self,value)
														statusbars.icefuryBar.counttext.font.shadow.isEnabled = value
														CheckElementalDefaultValues(ele_options,'Icefury')
													end,
												},
												shadowColor = {
													type = "color",
													order = 2,
													name = L["Shadow Color"],
													desc = L["Set the color of the text's shadow."],
													hasAlpha = true,
													disabled = true,
													get = function(info)
														local color = statusbars.icefuryBar.counttext.font.shadow.color
														return color.r, color.g, color.b, color.a
													end,
													set = function(info, r, g, b, a)
														local color = statusbars.icefuryBar.counttext.font.shadow.color
														
														color.r = tonumber(string.format("%.2f",r))
														color.g = tonumber(string.format("%.2f",g))
														color.b = tonumber(string.format("%.2f",b))
														color.a = tonumber(string.format("%.2f",a))
														CheckElementalDefaultValues(ele_options,'Icefury')
													end,
												},
												filler_0 = {
													order = 3,
													type = "description",
													name = ' ',
												},
												shadowX = {
													order = 4,
													type = "range",
													name = "X",
													desc = L["Set the text shadow's X offset"],
													min = -10,
													max = 10,
													step = 1,
													bigStep = 1,
													disabled = true,
													get = function() return statusbars.icefuryBar.counttext.font.shadow.offset.x end,
													set = function(self,value)
														statusbars.icefuryBar.counttext.font.shadow.offset.x = value
														CheckElementalDefaultValues(ele_options,'Icefury')
													end,
												},
												shadowY = {
													order = 5,
													type = "range",
													name = "Y",
													desc = L["Set the text shadow's Y offset"],
													min = -10,
													max = 10,
													step = 1,
													bigStep = 1,
													disabled = true,
													get = function() return statusbars.icefuryBar.counttext.font.shadow.offset.y end,
													set = function(self,value)
														statusbars.icefuryBar.counttext.font.shadow.offset.y = value
														CheckElementalDefaultValues(ele_options,'Icefury')
													end,
												},
											},
										},
									},
								},
								timetext = {
									name = '|cFFFFFFFFTimer Text|r',
									type = "group",
									order = 6,
									disabled = true,
									guiInline = true,
									args = {
										color = {
											type = "color",
											order = 1,
											name = L["Text Color"],
											desc = L["Set the color of the text."],
											hasAlpha = true,
											get = function(info)
												local color = statusbars.icefuryBar.timetext.font.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = statusbars.icefuryBar.timetext.font.color
												
												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckElementalDefaultValues(ele_options,'Icefury')
											end,
										},
										filler_0 = {
											order = 2,
											type = "description",
											name = ' ',
										},
										timeFontName = {
											order = 3,
											type = "select",
											dialogControl = "LSM30_Font",
											name = L["Font"],
											desc = L["The font that will be used"],
											values = LSM:HashTable("font"),
											get = function() return statusbars.icefuryBar.timetext.font.name end,
											set = function(self,value)
												statusbars.icefuryBar.timetext.font.name = value
												CheckElementalDefaultValues(ele_options,'Icefury')
											end,
										},
										timeFontSize = {
											order = 4,
											type = "range",
											name = L["Font Size"],
											desc = L["Customize the font size of the cooldown text"],
											min = 5,
											max = 40,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.icefuryBar.timetext.font.size end,
											set = function(self,value)
												statusbars.icefuryBar.timetext.font.size = value
												CheckElementalDefaultValues(ele_options,'Icefury')
											end,
										},
										timeFontOutline = {
											order = 5,
											type = "select",
											name = L["Font Outline"],
											desc = L["The outline of the font"],
											get = function()
												return statusbars.icefuryBar.timetext.font.flag
											end,
											set = function(self,value)
												statusbars.icefuryBar.timetext.font.flag = value
												CheckElementalDefaultValues(ele_options,'Icefury')
											end,
											values = {
												[""] = L["None"],
												["OUTLINE"] = L["Outline"],
												["THICKOUTLINE"] = L["Thick Outline"],
												["MONOCHROME"] = L["Monochrome"],
												["OUTLINE, MONOCHROME"] = L["Monochrome Outline"],
												["THICKOUTLINE, MONOCHROME"] = L["Monochrome Thick Outline"],
											},
										},
										timeTextAnchor = {
											order = 6,
											type = "select",
											name = L["Anchor Point"],
											desc = L["Set the anchor point."],
											get = function()
												return statusbars.icefuryBar.timetext.justify
											end,
											set = function(self,value)
												statusbars.icefuryBar.timetext.justify = value
												CheckElementalDefaultValues(ele_options,'Icefury')
											end,
											values = {
												["TOPLEFT"] = L["TOPLEFT"],
												["TOP"] = L["TOP"],
												["TOPRIGHT"] = L["TOPRIGHT"],
												["LEFT"] = L["LEFT"],
												["CENTER"] = L["CENTER"],
												["RIGHT"] = L["RIGHT"],
												["BOTTOMLEFT"] = L["BOTTOMLEFT"],
												["BOTTOM"] = L["BOTTOM"],
												["BOTTOMRIGHT"] = L["BOTTOMRIGHT"],
											}
										},
										timeTextX = {
											order = 7,
											type = "range",
											name = "X",
											desc = L["Set location of text on the X axis"],
											min = -500,
											max = 500,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.icefuryBar.timetext.x end,
											set = function(self,value)
												statusbars.icefuryBar.timetext.x = value
												CheckElementalDefaultValues(ele_options,'Icefury')
											end,
										},
										timeTextY = {
											order = 8,
											type = "range",
											name = "Y",
											desc = L["Set location of text on the Y axis"],
											min = -100,
											max = 100,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.icefuryBar.timetext.y end,
											set = function(self,value)
												statusbars.icefuryBar.timetext.y = value
												CheckElementalDefaultValues(ele_options,'Icefury')
											end,
										},
										shadow = {
											name = '|cFFFFFFFF'..L['Text Shadow']..'|r',
											type = "group",
											order = 9,
											hidden = false,
											guiInline = true,
											args = {
												shadowToggle = {
													order = 1,
													name = L["Toggle"],
													desc = '',
													type = "toggle",
													get = function()
														return statusbars.icefuryBar.timetext.font.shadow.isEnabled
													end,
													set = function(self,value)
														statusbars.icefuryBar.timetext.font.shadow.isEnabled = value
														CheckElementalDefaultValues(ele_options,'Icefury')
													end,
												},
												shadowColor = {
													type = "color",
													order = 2,
													name = L["Shadow Color"],
													desc = L["Set the color of the text's shadow."],
													hasAlpha = true,
													disabled = true,
													get = function(info)
														local color = statusbars.icefuryBar.timetext.font.shadow.color
														return color.r, color.g, color.b, color.a
													end,
													set = function(info, r, g, b, a)
														local color = statusbars.icefuryBar.timetext.font.shadow.color
														
														color.r = tonumber(string.format("%.2f",r))
														color.g = tonumber(string.format("%.2f",g))
														color.b = tonumber(string.format("%.2f",b))
														color.a = tonumber(string.format("%.2f",a))
														CheckElementalDefaultValues(ele_options,'Icefury')
													end,
												},
												filler_0 = {
													order = 3,
													type = "description",
													name = ' ',
												},
												shadowX = {
													order = 4,
													type = "range",
													name = "X",
													desc = L["Set the text shadow's X offset"],
													min = -10,
													max = 10,
													step = 1,
													bigStep = 1,
													disabled = true,
													get = function() return statusbars.icefuryBar.timetext.font.shadow.offset.x end,
													set = function(self,value)
														statusbars.icefuryBar.timetext.font.shadow.offset.x = value
														CheckElementalDefaultValues(ele_options,'Icefury')
													end,
												},
												shadowY = {
													order = 5,
													type = "range",
													name = "Y",
													desc = L["Set the text shadow's Y offset"],
													min = -10,
													max = 10,
													step = 1,
													bigStep = 1,
													disabled = true,
													get = function() return statusbars.icefuryBar.timetext.font.shadow.offset.y end,
													set = function(self,value)
														statusbars.icefuryBar.timetext.font.shadow.offset.y = value
														CheckElementalDefaultValues(ele_options,'Icefury')
													end,
												},
											},
										},
									},
								},
								layout = {
									name = L["Layout & Design"],
									type = "group",
									order = 7,
									guiInline = true,
									args = {
										texture = {
											order = 1,
											type = "select",
											name = L["Bar Texture"],
											desc = L["Set the bar's texture."],
											dialogControl = "LSM30_Statusbar",
											get = function()
												return statusbars.icefuryBar.foreground.texture
											end,
											set = function(self,value)
												statusbars.icefuryBar.foreground.texture = value
												CheckElementalDefaultValues(ele_options,"Icefury")
											end,
											values = LSM:HashTable(LSM.MediaType.STATUSBAR),
										},
										textureColor = {
											type = "color",
											order = 2,
											name = L["Bar Color"],
											get = function(info)
												local color = statusbars.icefuryBar.foreground.color
												return color.r, color.g, color.b
											end,
											set = function(info, r, g, b)
												local color = statusbars.icefuryBar.foreground.color
												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												CheckElementalDefaultValues(ele_options,'Icefury')
											end,
										},
										filler_0 = {
											order = 3,
											type = "description",
											name = ' ',
										},
										timerTexture = {
											order = 4,
											type = "select",
											name = L["Timer Bar Texture"],
											desc = L["Set the bar's texture."],
											dialogControl = "LSM30_Statusbar",
											get = function()
												return statusbars.icefuryBar.timerBar.texture
											end,
											set = function(self,value)
												statusbars.icefuryBar.timerBar.texture = value
												CheckElementalDefaultValues(ele_options,"Icefury")
											end,
											values = LSM:HashTable(LSM.MediaType.STATUSBAR),
										},
										timerColor = {
											type = "color",
											order = 5,
											name = L["Bar Color"],
											hasAlpha = true,
											get = function(info)
												local color = statusbars.icefuryBar.timerBar.color
												return color.r,color.g,color.b,color.a
											end,
											set = function(info, r, g, b, a)
												local color = statusbars.icefuryBar.timerBar.color
												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckElementalDefaultValues(ele_options,'Icefury')
											end,
										},
										timerToggle = {
											order = 6,
											name = L["Modify Timer Bar"],
											desc = L["Toggle the adjustment of the Timer Bar"],
											type = "toggle",
											get = function()
												return statusbars.icefuryBar.adjust.showTimer
											end,
											set = function(self,value)
												statusbars.icefuryBar.adjust.showTimer = value
												CheckElementalDefaultValues(ele_options,'Icefury')
											end,
										},
										backgroundTexture = {
											order = 7,
											type = "select",
											name = L["Background Texture"],
											desc = L["Set the bar's background texture."],
											dialogControl = "LSM30_Statusbar",
											get = function()
												return statusbars.icefuryBar.background.texture
											end,
											set = function(self,value)
												statusbars.icefuryBar.background.texture = value
												CheckElementalDefaultValues(ele_options,"Icefury")
											end,
											values = LSM:HashTable(LSM.MediaType.STATUSBAR),
										},
										backgroundColor = {
											type = "color",
											order = 8,
											name = "BG Color",
											desc = L["Set the color of the cast bar's background."],
											hasAlpha = true,
											get = function(info)
												local color = statusbars.icefuryBar.background.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = statusbars.icefuryBar.background.color
												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckElementalDefaultValues(ele_options,'Icefury')
											end,
										},
										backgroundToggle = {
											order = 9,
											name = L["Modify Background"],
											desc = L["Toggle the adjustment of the bar's background texture"],
											type = "toggle",
											get = function()
												return statusbars.icefuryBar.adjust.showBG
											end,
											set = function(self,value)
												statusbars.icefuryBar.adjust.showBG = value
												CheckElementalDefaultValues(ele_options,'Icefury')
											end,
										},
										width = {
											order = 10,
											type = "range",
											name = L["Width"],
											desc = '',
											min = 100,
											max = 500,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.icefuryBar.layout.width end,
											set = function(self,value)
												statusbars.icefuryBar.layout.width = value
												CheckElementalDefaultValues(ele_options,'Icefury')
											end,
										},
										height = {
											order = 11,
											type = "range",
											name = L["Height"],
											desc = '',
											min = 10,
											max = 100,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.icefuryBar.layout.height end,
											set = function(self,value)
												statusbars.icefuryBar.layout.height = value
												CheckElementalDefaultValues(ele_options,'Icefury')
											end,
										},
									},
								},
								reset = {
									order = 8,
									type = "execute",
									name = L["Reset Icefury Bar"],
									func = function()
										local bar = statusbars.icefuryBar
										local default = statusbarDefaults.icefuryBar
										
										bar.alphaCombat = default.alphaCombat
										bar.alphaOoC = default.alphaOoC
										bar.alphaTar = default.alphaTar
										
										bar.counttext.isDisplayText = true
										bar.counttext.x = default.counttext.x
										bar.counttext.y = default.counttext.y
										bar.counttext.font.name = default.counttext.font.name
										bar.counttext.font.size = default.counttext.font.size
										bar.counttext.font.flag = default.counttext.font.flag
										bar.counttext.font.color.r = default.counttext.font.color.r
										bar.counttext.font.color.g = default.counttext.font.color.g
										bar.counttext.font.color.b = default.counttext.font.color.b
										bar.counttext.font.color.a = default.counttext.font.color.a
										bar.counttext.font.shadow.isEnabled = false
										bar.counttext.font.shadow.offset.x = default.counttext.font.shadow.offset.x
										bar.counttext.font.shadow.offset.y = default.counttext.font.shadow.offset.y
										bar.counttext.font.shadow.color.r = default.counttext.font.shadow.color.r
										bar.counttext.font.shadow.color.g = default.counttext.font.shadow.color.g
										bar.counttext.font.shadow.color.b = default.counttext.font.shadow.color.b
										bar.counttext.font.shadow.color.a = default.counttext.font.shadow.color.a
										bar.counttext.justify = default.counttext.justify
										
										bar.timetext.isDisplayText = true
										bar.timetext.x = default.timetext.x
										bar.timetext.y = default.timetext.y
										bar.timetext.font.name = default.timetext.font.name
										bar.timetext.font.size = default.timetext.font.size
										bar.timetext.font.flag = default.timetext.font.flag
										bar.timetext.font.color.r = default.timetext.font.color.r
										bar.timetext.font.color.g = default.timetext.font.color.g
										bar.timetext.font.color.b = default.timetext.font.color.b
										bar.timetext.font.color.a = default.timetext.font.color.a
										bar.timetext.font.shadow.isEnabled = false
										bar.timetext.font.shadow.offset.x = default.timetext.font.shadow.offset.x
										bar.timetext.font.shadow.offset.y = default.timetext.font.shadow.offset.y
										bar.timetext.font.shadow.color.r = default.timetext.font.shadow.color.r
										bar.timetext.font.shadow.color.g = default.timetext.font.shadow.color.g
										bar.timetext.font.shadow.color.b = default.timetext.font.shadow.color.b
										bar.timetext.font.shadow.color.a = default.timetext.font.shadow.color.a
										bar.timetext.justify = default.timetext.justify
										
										bar.background.opacity = default.background.opacity
										bar.background.texture = default.background.texture
										bar.background.color.r = default.background.color.r
										bar.background.color.g = default.background.color.g
										bar.background.color.b = default.background.color.b
										bar.background.color.a = default.background.color.a
										
										bar.timerBar.color.r = default.timerBar.color.r
										bar.timerBar.color.g = default.timerBar.color.g
										bar.timerBar.color.b = default.timerBar.color.b
										bar.timerBar.color.a = default.timerBar.color.a
										bar.timerBar.texture = default.timerBar.texture
										
										bar.foreground.color.r = default.foreground.color.r
										bar.foreground.color.g = default.foreground.color.g
										bar.foreground.color.b = default.foreground.color.b
										bar.foreground.texture = default.foreground.texture
										
										bar.layout.width = default.layout.width
										bar.layout.height = default.layout.height
										bar.layout.strata = default.layout.strata
										ele_options.args.config.args.icefuryBar.args.reset.disabled = true
										ele_options.args.config.args.icefuryBar.args.reset.name = "|cFF666666"..L["Reset Icefury Bar"].."|r"
										CheckElementalDefaultValues(ele_options,'Icefury')
										
										if (not bar.adjust.isEnabled) then
											Auras:InitializeProgressBar('IcefuryBar','Timer','icefuryBar','counttext','timetext',1)
										end
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
							func = function()
								elements.isMoving = true
								SSA.MoveEle.Info:Show()
								Auras:InitMoveAuraGroups(SSA.AuraObjectsEle,"Ele")
							end,
						},
						ResetAuras = {
							order = 2,
							type = "execute",
							name = "|cFFFFCC00"..L["Reset Elemental Auras"].."|r",
							func = function()
								Auras:ResetAuraGroupPosition('AuraGroupEle')
							end,
						},
						--[[filler_0 = {
							order = 3,
							type = "description",
							name = ' ',
						},
						primaryDesc = {
							order = 4,
							type = "description",
							name = L["Primary Auras"],
						},]]
						primaryAuras = {
							name = L["Primary Auras"],
							type = "group",
							order = 3,
							guiInline = true,
							args = {
								PrimaryOrientation1 = {
									order = 1,
									type = "select",
									name = L["Primary Orientation 1"],
									desc = L["Set the aura orientation to horizontal or vertical."],
									get = function()
										return layout.orientation.top
									end,
									set = function(self,value)
										layout.orientation.top = value
										CheckElementalDefaultValues(ele_options,"Primary")
										Auras:UpdateTalents()
									end,
									values = {
										["Horizontal"] = L["Horizontal"],
										["Vertical"] = L["Vertical"],
									},
								},
								PrimaryOrientation2 = {
									order = 2,
									type = "select",
									name = L["Primary Orientation 2"],
									desc = L["Set the aura orientation to horizontal or vertical."],
									get = function()
										return layout.orientation.bottom
									end,
									set = function(self,value)
										layout.orientation.bottom = value
										CheckElementalDefaultValues(ele_options,"Primary")
										Auras:UpdateTalents()
									end,
									values = {
										["Horizontal"] = L["Horizontal"],
										["Vertical"] = L["Vertical"],
									},
								},
								filler_1 = {
									order = 3,
									type = "description",
									name = ' ',
								},
								AuraSizeRow1 = {
									order = 4,
									type = "range",
									name = L["Primary Size 1"],
									desc = L["Determines the size of primary auras in row 1. (Default is 32)"],
									min = 16,
									max = 256,
									step = 1,
									bigStep = 1,
									get = function() return layout.primary.top.icon end,
									set = function(self,value)
										layout.primary.top.icon = value
										CheckElementalDefaultValues(ele_options,"Primary")
										Auras:UpdateTalents()
									end,
								},
								AuraSpacingRow1 = {
									order = 5,
									type = "range",
									name = L["Primary Spacing 1"],
									desc = L["Determines the spacing of the primary auras in row 1. (Default is 50)"],
									min = 32,
									max = 300,
									step = 1,
									bigStep = 1,
									get = function() return layout.primary.top.spacing end,
									set = function(self,value)
										layout.primary.top.spacing = value
										CheckElementalDefaultValues(ele_options,"Primary")
										Auras:UpdateTalents()
									end,
								},
								AuraChargesRow1 = {
									order = 6,
									type = "range",
									name = L["Primary Charges 1"],
									desc = L["Determines the size of the primary charge text in row 1. (Default is 13.5)"],
									min = 10,
									max = 60,
									step = 0.5,
									bigStep = 0.5,
									get = function() return layout.primary.top.charges end,
									set = function(self,value)
										layout.primary.top.charges = value
										CheckElementalDefaultValues(ele_options,"Primary")
										Auras:UpdateTalents()
									end,
								},
								filler_2 = {
									order = 7,
									type = "description",
									name = ' ',
								},
								AuraSizeRow2 = {
									order = 8,
									type = "range",
									name = L["Primary Size 2"],
									desc = L["Determines the size of primary auras in row 2. (Default is 32)"],
									min = 16,
									max = 256,
									step = 1,
									bigStep = 1,
									get = function() return layout.primary.bottom.icon end,
									set = function(self,value)
										layout.primary.bottom.icon = value
										CheckElementalDefaultValues(ele_options,"Primary")
										Auras:UpdateTalents()
									end,
								},
								AuraSpacingRow2 = {
									order = 9,
									type = "range",
									name = L["Primary Spacing 2"],
									desc = L["Determines the spacing of the primary auras in row 2. (Default is 50)"],
									min = 32,
									max = 300,
									step = 1,
									bigStep = 1,
									get = function() return layout.primary.bottom.spacing end,
									set = function(self,value)
										layout.primary.bottom.spacing = value
										CheckElementalDefaultValues(ele_options,"Primary")
										Auras:UpdateTalents()
									end,
								},
								ResetPrimaryLayout = {
									order = 10,
									type = "execute",
									--name = "|cFFFFCC00"..L["Reset Primary Layout"].."|r",
									--disabled = false,
									name = L["Reset Primary Layout"],
									func = function()
										layout.orientation.top = layoutDefaults.orientation.top
										layout.orientation.bottom = layoutDefaults.orientation.bottom
										layout.primary.top.icon = layoutDefaults.primary.top.icon
										layout.primary.top.spacing = layoutDefaults.primary.top.spacing
										layout.primary.top.charges = layoutDefaults.primary.top.charges
										layout.primary.bottom.icon = layoutDefaults.primary.bottom.icon
										layout.primary.bottom.spacing = layoutDefaults.primary.bottom.spacing
										--layout.primary.bottom.charges = layoutDefaults.primary.bottom.charges
										res_options.args.layout.args.primaryAuras.args.ResetPrimaryLayout.disabled = true
										res_options.args.layout.args.primaryAuras.args.ResetPrimaryLayout.name = "|cFF666666"..L["Reset Primary Layout"].."|r"
										Auras:UpdateTalents()
									end,
								},
							},
						},
						--[[filler_3 = {
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
						},]]
						secondaryAuras = {
							name = L["Secondary Auras"],
							type = "group",
							order = 4,
							guiInline = true,
							args = {
								SecondaryOrientation1 = {
									order = 1,
									type = "select",
									name = L["Secondary Orientation 1"],
									desc = L["Set the aura orientation to horizontal or vertical."],
									get = function()
										return layout.orientation.left
									end,
									set = function(self,value)
										layout.orientation.left = value
										CheckElementalDefaultValues(ele_options,"Secondary")
										Auras:UpdateTalents()
									end,
									values = {
										["Horizontal"] = L["Horizontal"],
										["Vertical"] = L["Vertical"],
									},
								},
								SecondaryOrientation2 = {
									order = 2,
									type = "select",
									name = L["Secondary Orientation 2"],
									desc = L["Set the aura orientation to horizontal or vertical."],
									get = function()
										return layout.orientation.right
									end,
									set = function(self,value)
										layout.orientation.right = value
										CheckElementalDefaultValues(ele_options,"Secondary")
										Auras:UpdateTalents()
									end,
									values = {
										["Horizontal"] = L["Horizontal"],
										["Vertical"] = L["Vertical"],
									},
								},
								filler_5 = {
									order = 3,
									type = "description",
									name = ' ',
								},
								AuraSizeCol1 = {
									order = 4,
									type = "range",
									name = L["Secondary Size 1"],
									desc = L["Determines the size of secondary auras in column 1. (Default is 25)"],
									min = 16,
									max = 256,
									step = 1,
									bigStep = 1,
									get = function() return layout.secondary.left.icon end,
									set = function(self,value)
										layout.secondary.left.icon = value
										CheckElementalDefaultValues(ele_options,"Secondary")
										Auras:UpdateTalents()
									end,
								},
								AuraSpacingCol1 = {
									order = 5,
									type = "range",
									name = L["Secondary Spacing 1"],
									desc = L["Determines the spacing of the secondary auras in column 1. (Default is 30)"],
									min = 32,
									max = 300,
									step = 1,
									bigStep = 1,
									get = function() return layout.secondary.left.spacing end,
									set = function(self,value)
										layout.secondary.left.spacing = value
										CheckElementalDefaultValues(ele_options,"Secondary")
										Auras:UpdateTalents()
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
									get = function() return layout.secondary.left.charges end,
									set = function(self,value)
										layout.secondary.left.charges = value
										Auras:UpdateTalents()
									end,
								},
								filler_5 = {
									order = 17,
									type = "description",
									name = ' ',
								},]]
								AuraSizeCol2 = {
									order = 6,
									type = "range",
									name = L["Secondary Size 2"],
									desc = L["Determines the size of secondary auras in column 2. (Default is 25)"],
									min = 16,
									max = 256,
									step = 1,
									bigStep = 1,
									get = function() return layout.secondary.right.icon end,
									set = function(self,value)
										layout.secondary.right.icon = value
										CheckElementalDefaultValues(ele_options,"Secondary")
										Auras:UpdateTalents()
									end,
								},
								AuraSpacingCol2 = {
									order = 7,
									type = "range",
									name = L["Secondary Spacing 2"],
									desc = L["Determines the spacing of the secondary auras in column 2. (Default is 30)"],
									min = 32,
									max = 300,
									step = 1,
									bigStep = 1,
									get = function() return layout.secondary.right.spacing end,
									set = function(self,value)
										layout.secondary.right.spacing = value
										CheckElementalDefaultValues(ele_options,"Secondary")
										Auras:UpdateTalents()
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
									get = function() return layout.secondary.right.charges end,
									set = function(self,value)
										layout.secondary.right.charges = value
										Auras:UpdateTalents()
									end,
								},
								filler_6 = {
									order = 21,
									type = "description",
									name = ' ',
								},]]
								ResetSecondaryLayout = {
									order = 8,
									type = "execute",
									--name = "|cFFFFCC00"..L["Reset Secondary Layout"].."|r",
									--disabled = false,
									name = L["Reset Secondary Layout"],
									func = function()
										layout.orientation.left = layoutDefaults.orientation.left
										layout.orientation.right = layoutDefaults.orientation.right
										layout.secondary.left.icon = layoutDefaults.secondary.left.icon
										layout.secondary.left.spacing = layoutDefaults.secondary.left.spacing
										--layout.secondary.left.charges = layoutDefaults.secondary.left.charges
										layout.secondary.right.icon = layoutDefaults.secondary.right.icon
										layout.secondary.right.spacing = layoutDefaults.secondary.right.spacing
										--layout.secondary.right.charges = layoutDefaults.secondary.right.charges
										ele_options.args.layout.args.secondaryAuras.args.ResetSecondaryLayout.disabled = true
										ele_options.args.layout.args.secondaryAuras.args.ResetSecondaryLayout.name = "|cFF666666"..L["Reset Secondary Layout"].."|r"
										Auras:UpdateTalents()
									end,
								},
							},
						},
					},
				},
			},
		}
	end
		
	return ele_options
end

local enh_options

local function GetEnhancementOptions()
	if not enh_options then
		local db = Auras.db.char
	
		-- Database Shortcuts
		local settings = db.settings[2]
		local settingDefaults = db.settings.defaults
		
		-- Element Tables
		local elements = db.elements[2]
		local cooldowns = db.elements[2].cooldowns
		local timerbars = db.elements[2].timerbars
		local statusbars = db.elements[2].statusbars
		local frames = db.elements[2].frames
		local auras = db.auras[2]
		
		-- Layout Table
		local layout = db.layout[2]
		local layoutDefaults = db.layout.defaults
		
		-- Element Defaults Tables
		local timerbarDefaults = db.elements.defaults[2].timerbars
		local statusbarDefaults = db.elements.defaults[2].statusbars
		local frameDefaults = db.elements.defaults[2].frames
	
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
					order = 1,
					args = {
						show = {
							order = 1,
							name = L["Show Enhancement Auras"],
							desc = L["Toggle the display of Elemental Auras"],
							type = "toggle",
							get = function()
								return elements.isEnabled
							end,
							set = function(self,value)
								elements.isEnabled = value
								if (not value) then
									SSA.AuraGroupEnh:Hide()
								else
									SSA.AuraGroupEnh:Show()
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
										return auras.AscendanceEnh
									end,
									set = function(self,value)
										auras.AscendanceEnh = value
										--Auras:ToggleAuraVisibility(1)
										Auras:UpdateTalents()
									end,
								},
								Concordance = {
									order = 2,
									type = "toggle",
									name = L["Concordance of the Legionfall"],
									get = function()
										return auras.ConcordanceEnh
									end,
									set = function(self,value)
										auras.ConcordanceEnh = value
										Auras:UpdateTalents()
									end,
								},
								CrashLightning = {
									order = 3,
									type = "toggle",
									name = L["Crash Lightning"],
									get = function()
										return auras.CrashLightning
									end,
									set = function(self,value)
										auras.CrashLightning = value
										Auras:UpdateTalents()
									end,
								},
								DoomWinds = {
									order = 4,
									type = "toggle",
									name = L["Doom Winds"],
									get = function()
										return auras.DoomWinds
									end,
									set = function(self,value)
										auras.DoomWinds = value
										Auras:UpdateTalents()
									end,
								},
								EarthenSpike = {
									order = 5,
									type = "toggle",
									name = L["Earthen Spike"],
									get = function()
										return auras.EarthenSpike
									end,
									set = function(self,value)
										auras.EarthenSpike = value
										Auras:UpdateTalents()
									end,
								},
								FeralLunge = {
									order = 6,
									type = "toggle",
									name = L["Feral Lunge"],
									get = function()
										return auras.FeralLunge
									end,
									set = function(self,value)
										auras.FeralLunge = value
										Auras:UpdateTalents()
									end,
								},
								FeralSpirit = {
									order = 7,
									type = "toggle",
									name = L["Feral Spirit"],
									get = function()
										return auras.FeralSpirit
									end,
									set = function(self,value)
										auras.FeralSpirit = value
										Auras:UpdateTalents()
									end,
								},
								Flametongue = {
									order = 8,
									type = "toggle",
									name = L["Flametongue"],
									get = function()
										return auras.Flametongue
									end,
									set = function(self,value)
										auras.Flametongue = value
										Auras:UpdateTalents()
									end,
								},
								Frostbrand = {
									order = 9,
									type = "toggle",
									name = L["Frostbrand"],
									get = function()
										return auras.Frostbrand
									end,
									set = function(self,value)
										auras.Frostbrand = value
										Auras:UpdateTalents()
									end,
								},
								LavaLash = {
									order = 10,
									type = "toggle",
									name = L["Lava Lash"],
									get = function()
										return auras.LavaLash
									end,
									set = function(self,value)
										auras.LavaLash = value
										Auras:UpdateTalents()
									end,
								},
								Rockbiter = {
									order = 11,
									type = "toggle",
									name = L["Rockbiter"],
									get = function()
										return auras.Rockbiter
									end,
									set = function(self,value)
										auras.Rockbiter = value
										Auras:UpdateTalents()
									end,
								},
								Stormstrike = {
									order = 12,
									type = "toggle",
									name = L["Stormstrike"],
									get = function()
										return auras.Stormstrike
									end,
									set = function(self,value)
										auras.Stormstrike = value
										Auras:UpdateTalents()
									end,
								},
								Sundering = {
									order = 13,
									type = "toggle",
									name = L["Sundering"],
									get = function()
										return auras.Sundering
									end,
									set = function(self,value)
										auras.Sundering = value
										Auras:UpdateTalents()
									end,
								},
								UnleashDoom = {
									order = 14,
									type = "toggle",
									name = L["Unleash Doom"],
									get = function()
										return auras.UnleashDoom
									end,
									set = function(self,value)
										auras.UnleashDoom = value
										Auras:UpdateTalents()
									end,
								},
								Windsong = {
									order = 15,
									type = "toggle",
									name = L["Windsong"],
									get = function()
										return auras.Windsong
									end,
									set = function(self,value)
										auras.Windsong = value
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
										return auras.AstralShiftEnh
									end,
									set = function(self,value)
										auras.AstralShiftEnh = value
										Auras:UpdateTalents()
									end,
								},
								CleanseSpirit = {
									order = 2,
									type = "toggle",
									name = L["Cleanse Spirit"],
									get = function()
										return auras.CleanseSpiritEnh
									end,
									set = function(self,value)
										auras.CleanseSpiritEnh = value
										Auras:UpdateTalents()
									end,
								},
								EarthgrabTotemEnh = {
									order = 3,
									type = "toggle",
									name = L["Earthgrab Totem"],
									get = function()
										return auras.EarthgrabTotemEnh
									end,
									set = function(self,value)
										auras.EarthgrabTotemEnh = value
										Auras:UpdateTalents()
									end,
								},
								Hex = {
									order = 4,
									type = "toggle",
									name = L["Hex"],
									get = function()
										return auras.HexEnh
									end,
									set = function(self,value)
										auras.HexEnh = value
										Auras:UpdateTalents()
									end,
								},
								LightningSurgeTotemEnh = {
									order = 5,
									type = "toggle",
									name = L["Lightning Surge Totem"],
									get = function()
										return auras.LightningSurgeTotemEnh
									end,
									set = function(self,value)
										auras.LightningSurgeTotemEnh = value
										Auras:UpdateTalents()
									end,
								},
								Rainfall = {
									order = 6,
									type = "toggle",
									name = L["Rainfall"],
									get = function()
										return auras.Rainfall
									end,
									set = function(self,value)
										auras.Rainfall = value
										Auras:UpdateTalents()
									end,
								},
								SpiritWalk = {
									order = 7,
									type = "toggle",
									name = L["Spirit Walk"],
									get = function()
										return auras.SpiritWalk
									end,
									set = function(self,value)
										auras.SpiritWalk = value
										Auras:UpdateTalents()
									end,
								},
								VoodooTotemEnh = {
									order = 8,
									type = "toggle",
									name = L["Voodoo Totem"],
									get = function()
										return auras.VoodooTotemEnh
									end,
									set = function(self,value)
										auras.VoodooTotemEnh = value
										Auras:UpdateTalents()
									end,
								},
								WindRushTotemEnh = {
									order = 9,
									type = "toggle",
									name = L["Wind Rush Totem"],
									get = function()
										return auras.WindRushTotemEnh
									end,
									set = function(self,value)
										auras.WindRushTotemEnh = value
										Auras:UpdateTalents()
									end,
								},
								WindShearEnh = {
									order = 10,
									type = "toggle",
									name = L["Wind Shear"],
									get = function()
										return auras.WindShearEnh
									end,
									set = function(self,value)
										auras.WindShearEnh = value
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
								--[[MaelstromBarEnh = {
									order = 1,
									type = "toggle",
									name = L["Maelstrom Bar"],
									get = function() 
										return Auras.db.char.aura[2].MaelstromBarEnh
									end,
									set = function(self,value)
										Auras.db.char.aura[2].MaelstromBarEnh = value
									end,
								},
								
								ShowBuffTimersEnh = {
									order = 1,
									type = "toggle",
									name = L["Show Buff Timers"],
									get = function() 
										return Auras.db.char.frames.timerbars.buff[2]
									end,
									set = function(self,value)
										Auras.db.char.frames.timerbars.buff[2] = value
									end,
								},
								ShowAbilityTimersEnh = {
									order = 2,
									type = "toggle",
									name = L["Show Ability Timers"],
									get = function() 
										return Auras.db.char.frames.timerbars.main[2]
									end,
									set = function(self,value)
										Auras.db.char.frames.timerbars.main[2] = value
									end,
								},
								ShowUtilityTimersEnh = {
									order = 3,
									type = "toggle",
									name = L["Show Utility Timers"],
									get = function() 
										return Auras.db.char.frames.timerbars.util[2]
									end,
									set = function(self,value)
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
												return timerbars.buff.ascendance
											end,
											set = function(self,value)
												timerbars.buff.ascendance = value
											end,
										},
										AstralShiftBarEnh = {
											order = 2,
											type = "toggle",
											name = L["Astral Shift"],
											get = function() 
												return timerbars.buff.astralShift
											end,
											set = function(self,value)
												timerbars.buff.astralShift = value
											end,
										},
										Bloodlust = {
											order = 3,
											type = "toggle",
											name = L["Bloodlust"],
											hidden = false,
											get = function() 
												return timerbars.buff.bloodlust
											end,
											set = function(self,value)
												timerbars.buff.bloodlust = value
											end,
										},
										Heroism = {
											order = 4,
											type = "toggle",
											name = L["Heroism"],
											hidden = false,
											get = function() 
												return timerbars.buff.heroism
											end,
											set = function(self,value)
												timerbars.buff.heroism = value
											end,
										},
										HexBarEnh = {
											order = 5,
											type = "toggle",
											name = L["Hex"],
											get = function() 
												return timerbars.buff.hex
											end,
											set = function(self,value)
												timerbars.buff.hex = value
											end,
										},
										SpiritWalkBar = {
											order = 6,
											type = "toggle",
											name = L["Spirit Walk"],
											get = function() 
												return timerbars.buff.spiritWalk
											end,
											set = function(self,value)
												timerbars.buff.spiritWalk = value
											end,
										},
										TimeWarp = {
											order = 7,
											type = "toggle",
											name = L["Time Warp"],
											get = function() 
												return timerbars.buff.timeWarp
											end,
											set = function(self,value)
												timerbars.buff.timeWarp = value
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
										--[[BoulderfistBar = {
											order = 1,
											type = "toggle",
											name = L["Boulderfist"],
											get = function() 
												return Auras.db.char.aura[2].BoulderfistBar
											end,
											set = function(self,value)
												Auras.db.char.aura[2].BoulderfistBar = value
											end,
										},]]
										CrashLightningBar = {
											order = 2,
											type = "toggle",
											name = L["Crash Lightning"],
											get = function() 
												return timerbars.main.crashLightning
											end,
											set = function(self,value)
												timerbars.main.crashLightning = value
											end,
										},
										EarthenSpikeBar = {
											order = 3,
											type = "toggle",
											name = L["Earthen Spike"],
											get = function() 
												return timerbars.main.earthenSpike
											end,
											set = function(self,value)
												timerbars.main.earthenSpike = value
											end,
										},
										FlametongueBar = {
											order = 4,
											type = "toggle",
											name = L["Flametongue"],
											get = function() 
												return timerbars.main.flametongue
											end,
											set = function(self,value)
												timerbars.main.flametongue = value
											end,
										},
										FrostbrandBar = {
											order = 5,
											type = "toggle",
											name = L["Frostbrand"],
											get = function() 
												return timerbars.main.frostbrand
											end,
											set = function(self,value)
												timerbars.main.frostbrand = value
											end,
										},
										Landslide = {
											order = 6,
											type = "toggle",
											name = L["Landslide"],
											get = function() 
												return timerbars.main.landslide
											end,
											set = function(self,value)
												timerbars.main.landslide = value
											end,
										},
										WindsongBar = {
											order = 7,
											type = "toggle",
											name = L["Windsong"],
											get = function() 
												return timerbars.main.windsong
											end,
											set = function(self,value)
												timerbars.main.windsong = value
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
												return timerbars.util.earthgrabTotem
											end,
											set = function(self,value)
												timerbars.util.earthgrabTotem = value
											end,
										},
										VoodooTotemBarEnh = {
											order = 2,
											type = "toggle",
											name = L["Voodoo Totem"],
											get = function() 
												return timerbars.util.voodooTotem
											end,
											set = function(self,value)
												timerbars.util.voodooTotem = value
											end,
										},
										WindRushTotemBarEnh = {
											order = 3,
											type = "toggle",
											name = L["Wind Rush Totem"],
											get = function() 
												return timerbars.util.windRushTotem
											end,
											set = function(self,value)
												timerbars.util.windRushTotem = value
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
										return frames.DoomWindsTexture.isEnabled
									end,
									set = function(self,value)
										frames.DoomWindsTexture.isEnabled = value
									end,
								},
								StormstrikeOrbs = {
									order = 2,
									type = "toggle",
									name = L["Stormstrike Lightning Orbs"],
									get = function() 
										return frames.StormstrikeChargeGrp.isEnabled
									end,
									set = function(self,value)
										frames.StormstrikeChargeGrp.isEnabled = value
									end,
								},
							},
						},
					},
				},
				config = {
					name = L["Configuration"],
					order = 2,
					type = "group",
					childGroups = "tab",
					disabled = true,
					args = {
						general = {
							name = L["General"],
							order = 1,
							inline = false,
							type = "group",
							args = {
								statusbars = {
									name = L["Statusbar Manager"],
									type = "group",
									order = 1,
									guiInline = true,
									args = {
										defaultBarToggle = {
											order = 1,
											name = L["Blizzard Casting Bar"],
											desc = L["Toggles the display of Blizzard's default casting bar"],
											type = "toggle",
											get = function()
												return statusbars.defaultBar
											end,
											set = function(self,value)
												--[[local option = res_options.args.config.args.manaBar
												if (value) then
													option.disabled = false
												else
													option.disabled = true
												end]]
												
												statusbars.defaultBar = value
											end,
										},
										castBarToggle = {
											order = 2,
											name = L["Toggle Cast Bar"],
											desc = L["Toggles the display of the cast bar"],
											type = "toggle",
											get = function()
												return statusbars.castBar.isEnabled
											end,
											set = function(self,value)
												if (value) then
													enh_options.args.config.args.castBar.disabled = false
												else
													enh_options.args.config.args.castBar.disabled = true
												end
												
												statusbars.castBar.isEnabled = value
											end,
										},
										channelToggle = {
											order = 3,
											name = L["Toggle Channel Bar"],
											desc = L["Toggles the display of the channel bar"],
											type = "toggle",
											get = function()
												return statusbars.channelBar.isEnabled
											end,
											set = function(self,value)
												if (value) then
													enh_options.args.config.args.channelBar.disabled = false
												else
													enh_options.args.config.args.channelBar.disabled = true
												end
												
												statusbars.channelBar.isEnabled = value
											end,
										},
										maelstromToggle = {
											order = 4,
											name = L["Toggle Maelstrom Bar"],
											desc = L["Toggles the display of the Maelstrom Bar"],
											type = "toggle",
											get = function()
												return statusbars.maelstromBar.isEnabled
											end,
											set = function(self,value)
												if (value) then
													enh_options.args.config.args.maelstromBar.disabled = false
												else
													enh_options.args.config.args.maelstromBar.disabled = true
												end
												
												statusbars.maelstromBar.isEnabled = value
											end,
										},
									},
								},
								cooldown = {
									name = L["Cooldown Settings"],
									type = "group",
									order = 2,
									guiInline = true,
									args = {
										text = {
											order = 1,
											name = L["Cooldown Values"],
											desc = L["Toggle the display of cooldown text/numbers."],
											type = "toggle",
											get = function()
												return cooldowns.text
											end,
											set = function(self,value)
												cooldowns.text = value
											end,
										},
										sweep = {
											order = 2,
											name = L["Cooldown Sweep Animation"],
											desc = L["Toggle the display of the cooldown animation sweep."],
											type = "toggle",
											get = function()
												return cooldowns.sweep
											end,
											set = function(self,value)
												cooldowns.sweep = value
												
												if (not value) then
													enh_options.args.config.args.general.args.cooldown.args.inverse.disabled = true
												else
													enh_options.args.config.args.general.args.cooldown.args.inverse.disabled = false
												end
											end,
										},
										inverse = {
											order = 3,
											name = L["Reverse Sweep Animation"],
											desc = L["Reverses the cooldown animation sweep."],
											type = "toggle",
											get = function()
												return cooldowns.inverse
											end,
											set = function(self,value)
												cooldowns.inverse = value
											end,
										},
									},
								},
								settings = {
									name = L["Aura Settings"],
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
											get = function() return settings.OoCAlpha end,
											set = function(self,value)
												settings.OoCAlpha = value
												CheckEnhancementDefaultValues(enh_options,'Settings')
											end,
										},
										OoRColor = {
											type = "color",
											order = 4,
											name = L["Color (OoR)"],
											desc = L["Determines the color of harmful auras will appear when out of range"],
											hasAlpha = true,
											get = function(info)
												local color = settings.OoRColor
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = settings.OoRColor

												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckEnhancementDefaultValues(enh_options,'Settings')
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
											name = L["Reset Settings Values"],
											func = function()
												settings.OoCAlpha = settingDefaults.OoCAlpha
												settings.OoRColor.r = settingDefaults.OoRColor.r
												settings.OoRColor.g = settingDefaults.OoRColor.g
												settings.OoRColor.b = settingDefaults.OoRColor.b
												settings.OoRColor.a = settingDefaults.OoRColor.a
												enh_options.args.config.args.general.args.settings.args.reset.disabled = true
												enh_options.args.config.args.general.args.settings.args.reset.name = "|cFF666666"..L["Reset Settings Values"].."|r"
											end,
										},
									},
								},
							},
						},
						maelstromBar = {
							name = L["Maelstrom Bar"],
							order = 2,
							type = "group",
							inline = false,
							args = {
								adjust = {
									order = 1,
									name = L["Modify Maelstrom Bar"],
									desc = L["Toggle the adjustment of the Maelstrom Bar"],
									type = "toggle",
									get = function()
										return statusbars.maelstromBar.adjust.isEnabled
									end,
									set = function(self,value)
										statusbars.maelstromBar.adjust.isEnabled = value
										CheckEnhancementDefaultValues(enh_options,'Maelstrom')
									end,
								},
								textToggle = {
									order = 2,
									name = L["Maelstrom Value Text"],
									desc = L["Toggles the text display of the amount of maelstrom remaining"],
									type = "toggle",
									get = function()
										return statusbars.maelstromBar.text.isDisplayText
									end,
									set = function(self,value)
										statusbars.maelstromBar.text.isDisplayText = value
										CheckEnhancementDefaultValues(enh_options,'Maelstrom')
									end,
								},
								animation = {
									order = 3,
									type = "toggle",
									name = L["Maelstrom Lightning"],
									get = function() 
										return statusbars.maelstromBar.animate
									end,
									set = function(self,value)
										statusbars.maelstromBar.animate = value
										CheckEnhancementDefaultValues(enh_options,"Maelstrom")
									end,
								},
								general = {
									name = "|cFFFFFFFF"..L["Settings"].."|r",
									order = 4,
									type = "group",
									guiInline = true,
									args = {
										alphaCombat = {
											order = 1,
											type = "range",
											name = L["Alpha (In Combat)"],
											desc = L["Determines how opaque or transparent the bar will appear while in combat"],
											min = 0,
											max = 1,
											step = 0.1,
											bigStep = 0.1,
											get = function() return statusbars.maelstromBar.alphaCombat end,
											set = function(self,value)
												statusbars.maelstromBar.alphaCombat = value
												CheckEnhancementDefaultValues(enh_options,'Maelstrom')
											end,
										},
										alphaOoC = {
											order = 2,
											type = "range",
											name = L["Alpha (OoC - No Target)"],
											desc = L["Determines how opaque or transparent the bar will appear when out of combat"],
											min = 0,
											max = 1,
											step = 0.1,
											bigStep = 0.1,
											get = function() return statusbars.maelstromBar.alphaOoC end,
											set = function(self,value)
												statusbars.maelstromBar.alphaOoC = value
												CheckEnhancementDefaultValues(enh_options,'Maelstrom','Alpha')
											end,
										},
										alphaTarget = {
											order = 3,
											type = "range",
											name = L["Alpha (OoC - Target)"],
											desc = L["Determines how opaque or transparent the bar will appear when out of combat and targetting an enemy"],
											min = 0,
											max = 1,
											step = 0.1,
											bigStep = 0.1,
											disabled = false,
											get = function() return statusbars.maelstromBar.alphaTar end,
											set = function(self,value)
												statusbars.maelstromBar.alphaTar = value
												CheckEnhancementDefaultValues(enh_options,'Maelstrom')
											end,
										},
										threshold = {
											order = 4,
											type = "range",
											name = L["Maelstrom Trigger"],
											desc = L["The amount of Maelstrom accumulated at which the \"Lightning\" animation will appear"],
											min = 50,
											max = 100,
											step = 5,
											bigStep = 5,
											disabled = false,
											get = function() return statusbars.maelstromBar.threshold end,
											set = function(self,value)
												statusbars.maelstromBar.threshold = value
												CheckEnhancementDefaultValues(enh_options,'Maelstrom')
											end,
										},
									},
								},
								text = {
									name = '|cFFFFFFFF'..L['Maelstrom Text']..'|r',
									type = "group",
									order = 5,
									disabled = true,
									--hidden = true,
									guiInline = true,
									args = {
										color = {
											type = "color",
											order = 1,
											name = L["Text Color"],
											desc = L["Set the color of the text."],
											hasAlpha = true,
											get = function(info)
												local color = statusbars.maelstromBar.text.font.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = statusbars.maelstromBar.text.font.color
												
												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckEnhancementDefaultValues(enh_options,'Maelstrom')
											end,
										},
										filler_0 = {
											order = 2,
											type = "description",
											name = ' ',
										},
										timeFontName = {
											order = 3,
											type = "select",
											dialogControl = "LSM30_Font",
											name = L["Font"],
											desc = L["The font that will be used"],
											values = LSM:HashTable("font"),
											get = function() return statusbars.maelstromBar.text.font.name end,
											set = function(self,value)
												statusbars.maelstromBar.text.font.name = value
												CheckEnhancementDefaultValues(enh_options,'Maelstrom')
											end,
										},
										timeFontSize = {
											order = 4,
											type = "range",
											name = L["Font Size"],
											desc = L["Customize the font size of the cooldown text"],
											min = 5,
											max = 40,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.maelstromBar.text.font.size end,
											set = function(self,value)
												statusbars.maelstromBar.text.font.size = value
												CheckEnhancementDefaultValues(enh_options,'Maelstrom')
											end,
										},
										timeFontOutline = {
											order = 5,
											type = "select",
											name = L["Font Outline"],
											desc = L["The outline of the font"],
											get = function()
												return statusbars.maelstromBar.text.font.flag
											end,
											set = function(self,value)
												statusbars.maelstromBar.text.font.flag = value
												CheckEnhancementDefaultValues(enh_options,'Maelstrom')
											end,
											values = {
												[""] = L["None"],
												["OUTLINE"] = L["Outline"],
												["THICKOUTLINE"] = L["Thick Outline"],
												["MONOCHROME"] = L["Monochrome"],
												["OUTLINE, MONOCHROME"] = L["Monochrome Outline"],
												["THICKOUTLINE, MONOCHROME"] = L["Monochrome Thick Outline"],
											},
										},
										timeTextAnchor = {
											order = 6,
											type = "select",
											name = L["Anchor Point"],
											desc = L["Set the anchor point."],
											get = function()
												return statusbars.maelstromBar.text.justify
											end,
											set = function(self,value)
												statusbars.maelstromBar.text.justify = value
												CheckEnhancementDefaultValues(enh_options,'Maelstrom')
											end,
											values = {
												["TOPLEFT"] = L["TOPLEFT"],
												["TOP"] = L["TOP"],
												["TOPRIGHT"] = L["TOPRIGHT"],
												["LEFT"] = L["LEFT"],
												["CENTER"] = L["CENTER"],
												["RIGHT"] = L["RIGHT"],
												["BOTTOMLEFT"] = L["BOTTOMLEFT"],
												["BOTTOM"] = L["BOTTOM"],
												["BOTTOMRIGHT"] = L["BOTTOMRIGHT"],
											}
										},
										timeTextX = {
											order = 7,
											type = "range",
											name = "X",
											desc = L["Set location of text on the X axis"],
											min = -500,
											max = 500,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.maelstromBar.text.x end,
											set = function(self,value)
												statusbars.maelstromBar.text.x = value
												CheckEnhancementDefaultValues(enh_options,'Maelstrom')
											end,
										},
										timeTextY = {
											order = 8,
											type = "range",
											name = "Y",
											desc = L["Set location of text on the Y axis"],
											min = -100,
											max = 100,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.maelstromBar.text.y end,
											set = function(self,value)
												statusbars.maelstromBar.text.y = value
												CheckEnhancementDefaultValues(enh_options,'Maelstrom')
											end,
										},
										shadow = {
											name = '|cFFFFFFFF'..L['Text Shadow']..'|r',
											type = "group",
											order = 9,
											hidden = false,
											guiInline = true,
											args = {
												shadowToggle = {
													order = 1,
													name = L["Toggle"],
													desc = '',
													type = "toggle",
													get = function()
														return statusbars.maelstromBar.text.font.shadow.isEnabled
													end,
													set = function(self,value)
														statusbars.maelstromBar.text.font.shadow.isEnabled = value
														CheckEnhancementDefaultValues(enh_options,'Maelstrom')
													end,
												},
												shadowColor = {
													type = "color",
													order = 2,
													name = L["Shadow Color"],
													desc = L["Set the color of the text's shadow."],
													hasAlpha = true,
													get = function(info)
														local color = statusbars.maelstromBar.text.font.shadow.color
														return color.r, color.g, color.b, color.a
													end,
													set = function(info, r, g, b, a)
														local color = statusbars.maelstromBar.text.font.shadow.color

														color.r = tonumber(string.format("%.2f",r))
														color.g = tonumber(string.format("%.2f",g))
														color.b = tonumber(string.format("%.2f",b))
														color.a = tonumber(string.format("%.2f",a))
														CheckEnhancementDefaultValues(enh_options,'Maelstrom')
													end,
												},
												filler_0 = {
													order = 3,
													type = "description",
													name = ' ',
												},
												shadowX = {
													order = 4,
													type = "range",
													name = "X",
													desc = L["Set the text shadow's X offset"],
													min = -10,
													max = 10,
													step = 1,
													bigStep = 1,
													disabled = true,
													get = function() return statusbars.maelstromBar.text.font.shadow.offset.x end,
													set = function(self,value)
														statusbars.maelstromBar.text.font.shadow.offset.x = value
														CheckEnhancementDefaultValues(enh_options,'Maelstrom')
													end,
												},
												shadowY = {
													order = 5,
													type = "range",
													name = "Y",
													desc = L["Set the text shadow's Y offset"],
													min = -10,
													max = 10,
													step = 1,
													bigStep = 1,
													disabled = true,
													get = function() return statusbars.maelstromBar.text.font.shadow.offset.y end,
													set = function(self,value)
														statusbars.maelstromBar.text.font.shadow.offset.y = value
														CheckEnhancementDefaultValues(enh_options,'Maelstrom')
													end,
												},
											},
										},
									},
								},
								layout = {
									name = L["Layout & Design"],
									type = "group",
									order = 6,
									guiInline = true,
									args = {
										texture = {
											order = 1,
											type = "select",
											name = L["Bar Texture"],
											desc = L["Set the bar's texture."],
											dialogControl = "LSM30_Statusbar",
											get = function()
												return statusbars.maelstromBar.foreground.texture
											end,
											set = function(self,value)
												statusbars.maelstromBar.foreground.texture = value
												CheckEnhancementDefaultValues(enh_options,"Maelstrom")
											end,
											values = LSM:HashTable(LSM.MediaType.STATUSBAR),
										},
										textureColor = {
											type = "color",
											order = 2,
											name = L["Bar Color"],
											get = function(info)
												local color = statusbars.maelstromBar.foreground.color
												return color.r, color.g, color.b
											end,
											set = function(info, r, g, b)
												local color = statusbars.maelstromBar.foreground.color

												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												CheckEnhancementDefaultValues(enh_options,'Maelstrom')
											end,
										},
										filler_0 = {
											order = 3,
											type = "description",
											name = ' ',
										},
										backgroundTexture = {
											order = 4,
											type = "select",
											name = L["Background Texture"],
											desc = L["Set the bar's background texture."],
											dialogControl = "LSM30_Statusbar",
											get = function()
												return statusbars.maelstromBar.background.texture
											end,
											set = function(self,value)
												statusbars.maelstromBar.background.texture = value
												CheckEnhancementDefaultValues(enh_options,"Maelstrom")
											end,
											values = LSM:HashTable(LSM.MediaType.STATUSBAR),
										},
										backgroundColor = {
											type = "color",
											order = 5,
											name = L["Background Color"],
											desc = L["Set the color of the cast bar's background."],
											hasAlpha = true,
											get = function(info)
												local color = statusbars.maelstromBar.background.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = statusbars.maelstromBar.background.color

												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckEnhancementDefaultValues(enh_options,'Maelstrom')
											end,
										},
										backgroundToggle = {
											order = 6,
											name = L["Modify Background"],
											desc = L["Toggle the adjustment of the bar's background texture"],
											type = "toggle",
											get = function()
												return statusbars.maelstromBar.adjust.showBG
											end,
											set = function(self,value)
												statusbars.maelstromBar.adjust.showBG = value
												CheckEnhancementDefaultValues(enh_options,'Maelstrom')
											end,
										},
										width = {
											order = 7,
											type = "range",
											name = L["Width"],
											desc = '',
											min = 100,
											max = 500,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.maelstromBar.layout.width end,
											set = function(self,value)
												statusbars.maelstromBar.layout.width = value
												CheckEnhancementDefaultValues(enh_options,'Maelstrom')
											end,
										},
										height = {
											order = 8,
											type = "range",
											name = L["Height"],
											desc = '',
											min = 10,
											max = 100,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.maelstromBar.layout.height end,
											set = function(self,value)
												statusbars.maelstromBar.layout.height = value
												CheckEnhancementDefaultValues(enh_options,'Maelstrom')
											end,
										},
									},
								},
								reset = {
									order = 7,
									type = "execute",
									name = L["Reset Maelstrom Bar"],
									func = function()
										local bar = statusbars.maelstromBar
										local default = statusbarDefaults.maelstromBar
										
										bar.alphaCombat = default.alphaCombat
										bar.alphaOoC = default.alphaOoC
										bar.alphaTar = default.alphaTar
										bar.threshold = default.threshold
										bar.animate = true
										
										bar.text.isDisplayText = true
										bar.text.x = default.text.x
										bar.text.y = default.text.y
										bar.text.font.name = default.text.font.name
										bar.text.font.size = default.text.font.size
										bar.text.font.flag = default.text.font.flag
										bar.text.font.color.r = default.text.font.color.r
										bar.text.font.color.g = default.text.font.color.g
										bar.text.font.color.b = default.text.font.color.b
										bar.text.font.color.a = default.text.font.color.a
										bar.text.font.shadow.isEnabled = false
										bar.text.font.shadow.offset.x = default.text.font.shadow.offset.x
										bar.text.font.shadow.offset.y = default.text.font.shadow.offset.y
										bar.text.font.shadow.color.r = default.text.font.shadow.color.r
										bar.text.font.shadow.color.g = default.text.font.shadow.color.g
										bar.text.font.shadow.color.b = default.text.font.shadow.color.b
										bar.text.font.shadow.color.a = default.text.font.shadow.color.a
										bar.text.justify = default.text.justify
										
										bar.background.texture = default.background.texture
										bar.background.color.r = default.background.color.r
										bar.background.color.g = default.background.color.g
										bar.background.color.b = default.background.color.b
										bar.background.color.a = default.background.color.a
										
										bar.foreground.color.r = default.foreground.color.r
										bar.foreground.color.g = default.foreground.color.g
										bar.foreground.color.b = default.foreground.color.b
										bar.foreground.texture = default.foreground.texture
										
										bar.layout.width = default.layout.width
										bar.layout.height = default.layout.height
										bar.layout.strata = default.layout.strata
										enh_options.args.config.args.maelstromBar.args.reset.disabled = true
										enh_options.args.config.args.maelstromBar.args.reset.name = "|cFF666666"..L["Reset Maelstrom Bar"].."|r"
										CheckEnhancementDefaultValues(enh_options,'Maelstrom')
										
										if (not bar.adjust.isEnabled) then
											Auras:InitializeProgressBar('MaelstromBarEnh',nil,'maelstromBar','text',nil,2)
										end
									end,
								},
							},
						},
						castBar = {
							name = L["Cast Bar"],
							order = 3,
							inline = false,
							type = "group",
							args = {
								adjust = {
									order = 1,
									name = L["Modify Cast Bar"],
									desc = L["Toggle the adjustment of the Cast Bar"],
									type = "toggle",
									get = function()
										return statusbars.castBar.adjust.isEnabled
									end,
									set = function(self,value)
										statusbars.castBar.adjust.isEnabled = value
										CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
									end,
								},
								nametextToggle = {
									order = 2,
									name = L["Toggle Spell Name Text"],
									desc = L["Toggles the text display of the spell casted"],
									type = "toggle",
									get = function()
										return statusbars.castBar.nametext.isDisplayText
									end,
									set = function(self,value)
										statusbars.castBar.nametext.isDisplayText = value
										CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
									end,
								},
								timetextToggle = {
									order = 3,
									name = L["Toggle Time Text"],
									desc = L["Toggles the text display of the spell casted"],
									type = "toggle",
									get = function()
										return statusbars.castBar.timetext.isDisplayText
									end,
									set = function(self,value)
										statusbars.castBar.timetext.isDisplayText = value
										CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
									end,
								},
								general = {
									name = "|cFFFFFFFF"..L["Settings"].."|r",
									order = 4,
									type = "group",
									guiInline = true,
									args = {
										alphaCombat = {
											order = 1,
											type = "range",
											name = L["Alpha (In Combat)"],
											desc = L["Determines how opaque or transparent the bar will appear while in combat"],
											min = 0,
											max = 1,
											step = 0.1,
											bigStep = 0.1,
											get = function() return statusbars.castBar.alphaCombat end,
											set = function(self,value)
												statusbars.castBar.alphaCombat = value
												CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
											end,
										},
										alphaOoC = {
											order = 2,
											type = "range",
											name = L["Alpha (Out of Combat)"],
											desc = L["Determines how opaque or transparent the bar will appear when out of combat"],
											min = 0,
											max = 1,
											step = 0.1,
											bigStep = 0.1,
											get = function() return statusbars.castBar.alphaOoC end,
											set = function(self,value)
												statusbars.castBar.alphaOoC = value
												CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
											end,
										},
									},
								},
								iconSpark = {
									name = '|cFFFFFFFF'..L['Icon & Spark']..'|r',
									type = "group",
									order = 5,
									disabled = true,
									guiInline = true,
									args = {
										sparkToggle = {
											order = 1,
											name = L["Toggle Spark"],
											desc = '',
											type = "toggle",
											get = function()
												return statusbars.castBar.spark
											end,
											set = function(self,value)
												statusbars.castBar.spark = value
												CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
											end,
										},
										iconToggle = {
											order = 2,
											name = L["Toggle Icon"],
											desc = '',
											type = "toggle",
											get = function()
												return statusbars.castBar.icon.isEnabled
											end,
											set = function(self,value)
												if (value) then
													enh_options.args.config.args.castBar.args.iconSpark.args.iconJustify.disabled = false
												else
													enh_options.args.config.args.castBar.args.iconSpark.args.iconJustify.disabled = true
												end
												statusbars.castBar.icon.isEnabled = value
												CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
											end,
										},
										iconJustify = {
											order = 3,
											type = "select",
											name = L["Icon Justify"],
											desc = L["Set the side of the progress bar that the icon will appear."],
											get = function()
												return statusbars.castBar.icon.justify
											end,
											set = function(self,value)
												statusbars.castBar.icon.justify = value
												CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
											end,
											values = {
												["LEFT"] = L["Left"],
												["RIGHT"] = L["Right"],
											},
										},
									},
								},
								nametext = {
									name = '|cFFFFFFFF'..L['Spell Name Text']..'|r',
									type = "group",
									order = 6,
									disabled = true,
									guiInline = true,
									args = {
										color = {
											type = "color",
											order = 1,
											name = L["Text Color"],
											desc = L["Set the color of the text."],
											hasAlpha = true,
											get = function(info)
												local color = statusbars.castBar.nametext.font.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = statusbars.castBar.nametext.font.color
												
												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
											end,
										},
										filler_0 = {
											order = 2,
											type = "description",
											name = ' ',
										},
										fontName = {
											order = 3,
											type = "select",
											dialogControl = "LSM30_Font",
											name = L["Font"],
											desc = L["The font that will be used"],
											values = LSM:HashTable("font"),
											get = function() return statusbars.castBar.nametext.font.name end,
											set = function(self,value)
												statusbars.castBar.nametext.font.name = value
												CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
											end,
										},
										fontSize = {
											order = 4,
											type = "range",
											name = L["Font Size"],
											desc = L["Customize the font size of the cooldown text"],
											min = 5,
											max = 40,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.castBar.nametext.font.size end,
											set = function(self,value)
												statusbars.castBar.nametext.font.size = value
												CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
											end,
										},
										fontOutline = {
											order = 5,
											type = "select",
											name = L["Font Outline"],
											desc = L["The outline of the font"],
											get = function()
												return statusbars.castBar.nametext.font.flag
											end,
											set = function(self,value)
												statusbars.castBar.nametext.font.flag = value
												CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
											end,
											values = {
												[""] = L["None"],
												["OUTLINE"] = L["Outline"],
												["THICKOUTLINE"] = L["Thick Outline"],
												["MONOCHROME"] = L["Monochrome"],
												["OUTLINE, MONOCHROME"] = L["Monochrome Outline"],
												["THICKOUTLINE, MONOCHROME"] = L["Monochrome Thick Outline"],
											},
										},
										nametextAnchor = {
											order = 6,
											type = "select",
											name = L["Anchor Point"],
											desc = L["Set the anchor point."],
											get = function()
												return statusbars.castBar.nametext.justify
											end,
											set = function(self,value)
												statusbars.castBar.nametext.justify = value
												CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
											end,
											values = {
												["TOPLEFT"] = L["TOPLEFT"],
												["TOP"] = L["TOP"],
												["TOPRIGHT"] = L["TOPRIGHT"],
												["LEFT"] = L["LEFT"],
												["CENTER"] = L["CENTER"],
												["RIGHT"] = L["RIGHT"],
												["BOTTOMLEFT"] = L["BOTTOMLEFT"],
												["BOTTOM"] = L["BOTTOM"],
												["BOTTOMRIGHT"] = L["BOTTOMRIGHT"],
											}
										},
										nametextX = {
											order = 7,
											type = "range",
											name = "X",
											desc = L["Set location of text on the X axis"],
											min = -500,
											max = 500,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.castBar.nametext.x end,
											set = function(self,value)
												statusbars.castBar.nametext.x = value
												CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
											end,
										},
										nametextY = {
											order = 8,
											type = "range",
											name = "Y",
											desc = L["Set location of text on the Y axis"],
											min = -100,
											max = 100,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.castBar.nametext.y end,
											set = function(self,value)
												statusbars.castBar.nametext.y = value
												CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
											end,
										},
										shadow = {
											name = '|cFFFFFFFF'..L['Text Shadow']..'|r',
											type = "group",
											order = 9,
											hidden = false,
											guiInline = true,
											args = {
												shadowToggle = {
													order = 1,
													name = L["Toggle"],
													desc = '',
													type = "toggle",
													get = function()
														return statusbars.castBar.nametext.font.shadow.isEnabled
													end,
													set = function(self,value)
														statusbars.castBar.nametext.font.shadow.isEnabled = value
														CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
													end,
												},
												shadowColor = {
													type = "color",
													order = 2,
													name = L["Shadow Color"],
													desc = L["Set the color of the text's shadow."],
													hasAlpha = true,
													get = function(info)
														local color = statusbars.castBar.nametext.font.shadow.color
														return color.r, color.g, color.b, color.a
													end,
													set = function(info, r, g, b, a)
														local color = statusbars.castBar.nametext.font.shadow.color

														color.r = tonumber(string.format("%.2f",r))
														color.g = tonumber(string.format("%.2f",g))
														color.b = tonumber(string.format("%.2f",b))
														color.a = tonumber(string.format("%.2f",a))
														CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
													end,
												},
												filler_0 = {
													order = 3,
													type = "description",
													name = ' ',
												},
												shadowX = {
													order = 4,
													type = "range",
													name = "X",
													desc = L["Set the text shadow's X offset"],
													min = -10,
													max = 10,
													step = 1,
													bigStep = 1,
													disabled = true,
													get = function() return statusbars.castBar.nametext.font.shadow.offset.x end,
													set = function(self,value)
														statusbars.castBar.nametext.font.shadow.offset.x = value
														CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
													end,
												},
												shadowY = {
													order = 5,
													type = "range",
													name = "Y",
													desc = L["Set the text shadow's Y offset"],
													min = -10,
													max = 10,
													step = 1,
													bigStep = 1,
													disabled = true,
													get = function() return statusbars.castBar.nametext.font.shadow.offset.y end,
													set = function(self,value)
														statusbars.castBar.nametext.font.shadow.offset.y = value
														CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
													end,
												},
											},
										},
									},
								},
								timetext = {
									name = '|cFFFFFFFFTimer Text|r',
									type = "group",
									order = 7,
									disabled = true,
									guiInline = true,
									args = {
										color = {
											type = "color",
											order = 1,
											name = L["Text Color"],
											desc = L["Set the color of the text."],
											hasAlpha = true,
											get = function(info)
												local color = statusbars.castBar.timetext.font.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = statusbars.castBar.timetext.font.color
												
												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
											end,
										},
										filler_0 = {
											order = 2,
											type = "description",
											name = ' ',
										},
										timeFontName = {
											order = 3,
											type = "select",
											dialogControl = "LSM30_Font",
											name = L["Font"],
											desc = L["The font that will be used"],
											values = LSM:HashTable("font"),
											get = function() return statusbars.castBar.timetext.font.name end,
											set = function(self,value)
												statusbars.castBar.timetext.font.name = value
												CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
											end,
										},
										timeFontSize = {
											order = 4,
											type = "range",
											name = L["Font Size"],
											desc = L["Customize the font size of the cooldown text"],
											min = 5,
											max = 40,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.castBar.timetext.font.size end,
											set = function(self,value)
												statusbars.castBar.timetext.font.size = value
												CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
											end,
										},
										timeFontOutline = {
											order = 5,
											type = "select",
											name = L["Font Outline"],
											desc = L["The outline of the font"],
											get = function()
												return statusbars.castBar.timetext.font.flag
											end,
											set = function(self,value)
												statusbars.castBar.timetext.font.flag = value
												CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
											end,
											values = {
												[""] = L["None"],
												["OUTLINE"] = L["Outline"],
												["THICKOUTLINE"] = L["Thick Outline"],
												["MONOCHROME"] = L["Monochrome"],
												["OUTLINE, MONOCHROME"] = L["Monochrome Outline"],
												["THICKOUTLINE, MONOCHROME"] = L["Monochrome Thick Outline"],
											},
										},
										timeTextAnchor = {
											order = 6,
											type = "select",
											name = L["Anchor Point"],
											desc = L["Set the anchor point."],
											get = function()
												return statusbars.castBar.timetext.justify
											end,
											set = function(self,value)
												statusbars.castBar.timetext.justify = value
												CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
											end,
											values = {
												["TOPLEFT"] = L["TOPLEFT"],
												["TOP"] = L["TOP"],
												["TOPRIGHT"] = L["TOPRIGHT"],
												["LEFT"] = L["LEFT"],
												["CENTER"] = L["CENTER"],
												["RIGHT"] = L["RIGHT"],
												["BOTTOMLEFT"] = L["BOTTOMLEFT"],
												["BOTTOM"] = L["BOTTOM"],
												["BOTTOMRIGHT"] = L["BOTTOMRIGHT"],
											}
										},
										timeTextX = {
											order = 7,
											type = "range",
											name = "X",
											desc = L["Set location of text on the X axis"],
											min = -500,
											max = 500,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.castBar.timetext.x end,
											set = function(self,value)
												statusbars.castBar.timetext.x = value
												CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
											end,
										},
										timeTextY = {
											order = 8,
											type = "range",
											name = "Y",
											desc = L["Set location of text on the Y axis"],
											min = -100,
											max = 100,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.castBar.timetext.y end,
											set = function(self,value)
												statusbars.castBar.timetext.y = value
												CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
											end,
										},
										shadow = {
											name = '|cFFFFFFFF'..L['Text Shadow']..'|r',
											type = "group",
											order = 9,
											hidden = false,
											guiInline = true,
											args = {
												shadowToggle = {
													order = 1,
													name = L["Toggle"],
													desc = '',
													type = "toggle",
													get = function()
														return statusbars.castBar.timetext.font.shadow.isEnabled
													end,
													set = function(self,value)
														statusbars.castBar.timetext.font.shadow.isEnabled = value
														CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
													end,
												},
												shadowColor = {
													type = "color",
													order = 2,
													name = L["Shadow Color"],
													desc = L["Set the color of the text's shadow."],
													hasAlpha = true,
													disabled = true,
													get = function(info)
														local color = statusbars.castBar.timetext.font.shadow.color
														return color.r, color.g, color.b, color.a
													end,
													set = function(info, r, g, b, a)
														local color = statusbars.castBar.timetext.font.shadow.color
														
														color.r = tonumber(string.format("%.2f",r))
														color.g = tonumber(string.format("%.2f",g))
														color.b = tonumber(string.format("%.2f",b))
														color.a = tonumber(string.format("%.2f",a))
														CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
													end,
												},
												filler_0 = {
													order = 3,
													type = "description",
													name = ' ',
												},
												shadowX = {
													order = 4,
													type = "range",
													name = "X",
													desc = L["Set the text shadow's X offset"],
													min = -10,
													max = 10,
													step = 1,
													bigStep = 1,
													disabled = true,
													get = function() return statusbars.castBar.timetext.font.shadow.offset.x end,
													set = function(self,value)
														statusbars.castBar.timetext.font.shadow.offset.x = value
														CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
													end,
												},
												shadowY = {
													order = 5,
													type = "range",
													name = "Y",
													desc = L["Set the text shadow's Y offset"],
													min = -10,
													max = 10,
													step = 1,
													bigStep = 1,
													disabled = true,
													get = function() return statusbars.castBar.timetext.font.shadow.offset.y end,
													set = function(self,value)
														statusbars.castBar.timetext.font.shadow.offset.y = value
														CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
													end,
												},
											},
										},
									},
								},
								layout = {
									name = L["Layout & Design"],
									type = "group",
									order = 8,
									guiInline = true,
									args = {
										texture = {
											order = 1,
											type = "select",
											name = L["Bar Texture"],
											desc = L["Set the bar's texture."],
											dialogControl = "LSM30_Statusbar",
											get = function()
												return statusbars.castBar.foreground.texture
											end,
											set = function(self,value)
												statusbars.castBar.foreground.texture = value
												CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
											end,
											values = LSM:HashTable(LSM.MediaType.STATUSBAR),
										},
										textureColor = {
											type = "color",
											order = 2,
											name = L["Bar Color"],
											get = function(info)
												local color = statusbars.castBar.foreground.color
												return color.r, color.g, color.b
											end,
											set = function(info, r, g, b)
												local color = statusbars.castBar.foreground.color
												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
											end,
										},
										filler_0 = {
											order = 3,
											type = "description",
											name = ' ',
										},
										backgroundTexture = {
											order = 4,
											type = "select",
											name = L["Background Texture"],
											desc = L["Set the bar's background texture."],
											dialogControl = "LSM30_Statusbar",
											get = function()
												return statusbars.castBar.background.texture
											end,
											set = function(self,value)
												statusbars.castBar.background.texture = value
												CheckEnhancementDefaultValues(enh_options,"Cast",'castBar')
											end,
											values = LSM:HashTable(LSM.MediaType.STATUSBAR),
										},
										backgroundColor = {
											type = "color",
											order = 5,
											name = L["Background Color"],
											desc = L["Set the color of the cast bar's background."],
											hasAlpha = true,
											get = function(info)
												local color = statusbars.castBar.background.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = statusbars.castBar.background.color
												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
											end,
										},
										backgroundToggle = {
											order = 6,
											name = L["Modify Background"],
											desc = L["Toggle the adjustment of the bar's background texture"],
											type = "toggle",
											get = function()
												return statusbars.castBar.adjust.showBG
											end,
											set = function(self,value)
												statusbars.castBar.adjust.showBG = value
												CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
											end,
										},
										width = {
											order = 7,
											type = "range",
											name = L["Width"],
											desc = '',
											min = 100,
											max = 500,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.castBar.layout.width end,
											set = function(self,value)
												statusbars.castBar.layout.width = value
												CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
											end,
										},
										height = {
											order = 8,
											type = "range",
											name = L["Height"],
											desc = '',
											min = 10,
											max = 100,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.castBar.layout.height end,
											set = function(self,value)
												statusbars.castBar.layout.height = value
												CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
											end,
										},
									},
								},
								reset = {
									order = 9,
									type = "execute",
									name = L["Reset Cast Bar"],
									func = function()
										local bar = statusbars.castBar
										local default = statusbarDefaults.castBar
										
										bar.alphaCombat = default.alphaCombat
										bar.alphaOoC = default.alphaOoC
										
										bar.nametext.isDisplayText = true
										bar.nametext.x = default.nametext.x
										bar.nametext.y = default.nametext.y
										bar.nametext.font.name = default.nametext.font.name
										bar.nametext.font.size = default.nametext.font.size
										bar.nametext.font.flag = default.nametext.font.flag
										bar.nametext.font.color.r = default.nametext.font.color.r
										bar.nametext.font.color.g = default.nametext.font.color.g
										bar.nametext.font.color.b = default.nametext.font.color.b
										bar.nametext.font.color.a = default.nametext.font.color.a
										bar.nametext.font.shadow.isEnabled = false
										bar.nametext.font.shadow.offset.x = default.nametext.font.shadow.offset.x
										bar.nametext.font.shadow.offset.y = default.nametext.font.shadow.offset.y
										bar.nametext.font.shadow.color.r = default.nametext.font.shadow.color.r
										bar.nametext.font.shadow.color.g = default.nametext.font.shadow.color.g
										bar.nametext.font.shadow.color.b = default.nametext.font.shadow.color.b
										bar.nametext.font.shadow.color.a = default.nametext.font.shadow.color.a
										bar.nametext.justify = default.nametext.justify
										
										bar.timetext.isDisplayText = true
										bar.timetext.x = default.timetext.x
										bar.timetext.y = default.timetext.y
										bar.timetext.font.name = default.timetext.font.name
										bar.timetext.font.size = default.timetext.font.size
										bar.timetext.font.flag = default.timetext.font.flag
										bar.timetext.font.color.r = default.timetext.font.color.r
										bar.timetext.font.color.g = default.timetext.font.color.g
										bar.timetext.font.color.b = default.timetext.font.color.b
										bar.timetext.font.color.a = default.timetext.font.color.a
										bar.timetext.font.shadow.isEnabled = false
										bar.timetext.font.shadow.offset.x = default.timetext.font.shadow.offset.x
										bar.timetext.font.shadow.offset.y = default.timetext.font.shadow.offset.y
										bar.timetext.font.shadow.color.r = default.timetext.font.shadow.color.r
										bar.timetext.font.shadow.color.g = default.timetext.font.shadow.color.g
										bar.timetext.font.shadow.color.b = default.timetext.font.shadow.color.b
										bar.timetext.font.shadow.color.a = default.timetext.font.shadow.color.a
										bar.timetext.justify = default.timetext.justify
										
										bar.icon.isEnabled = true
										bar.icon.justify = default.icon.justify
										bar.spark = true
										
										bar.background.texture = default.background.texture
										bar.background.color.r = default.background.color.r
										bar.background.color.g = default.background.color.g
										bar.background.color.b = default.background.color.b
										bar.background.color.a = default.background.color.a
										
										bar.foreground.color.r = default.foreground.color.r
										bar.foreground.color.g = default.foreground.color.g
										bar.foreground.color.b = default.foreground.color.b
										bar.foreground.texture = default.foreground.texture
										
										bar.layout.width = default.layout.width
										bar.layout.height = default.layout.height
										bar.layout.strata = default.layout.strata
										enh_options.args.config.args.castBar.args.reset.disabled = true
										enh_options.args.config.args.castBar.args.reset.name = "|cFF666666"..L["Reset Cast Bar"].."|r"
										CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
										
										if (not bar.adjust.isEnabled) then
											Auras:InitializeProgressBar('CastBarEnh',nil,'castBar','nametext','timetext',2)
										end
									end,
								},
							},
						},
						channelBar = {
							name = L["Channel Bar"],
							order = 4,
							inline = false,
							type = "group",
							args = {
								adjust = {
									order = 1,
									name = L["Modify Channel Bar"],
									desc = L["Toggle the adjustment of the Channel Bar"],
									type = "toggle",
									get = function()
										return statusbars.channelBar.adjust.isEnabled
									end,
									set = function(self,value)
										statusbars.channelBar.adjust.isEnabled = value
										CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
									end,
								},
								nametextToggle = {
									order = 2,
									name = L["Toggle Spell Name Text"],
									desc = L["Toggles the text display of the spell casted"],
									type = "toggle",
									get = function()
										return statusbars.channelBar.nametext.isDisplayText
									end,
									set = function(self,value)
										statusbars.channelBar.nametext.isDisplayText = value
										CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
									end,
								},
								timetextToggle = {
									order = 3,
									name = L["Toggle Time Text"],
									desc = L["Toggles the text display of the spell casted"],
									type = "toggle",
									get = function()
										return statusbars.channelBar.timetext.isDisplayText
									end,
									set = function(self,value)
										statusbars.channelBar.timetext.isDisplayText = value
										CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
									end,
								},
								general = {
									name = "|cFFFFFFFF"..L["Settings"].."|r",
									order = 4,
									type = "group",
									guiInline = true,
									args = {
										alphaCombat = {
											order = 1,
											type = "range",
											name = L["Alpha (In Combat)"],
											desc = L["Determines how opaque or transparent the bar will appear while in combat"],
											min = 0,
											max = 1,
											step = 0.1,
											bigStep = 0.1,
											get = function() return statusbars.channelBar.alphaCombat end,
											set = function(self,value)
												statusbars.channelBar.alphaCombat = value
												CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
											end,
										},
										alphaOoC = {
											order = 2,
											type = "range",
											name = L["Alpha (Out of Combat)"],
											desc = L["Determines how opaque or transparent the bar will appear when out of combat"],
											min = 0,
											max = 1,
											step = 0.1,
											bigStep = 0.1,
											get = function() return statusbars.channelBar.alphaOoC end,
											set = function(self,value)
												statusbars.channelBar.alphaOoC = value
												CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
											end,
										},
									},
								},
								iconSpark = {
									name = '|cFFFFFFFF'..L['Icon & Spark']..'|r',
									type = "group",
									order = 5,
									disabled = true,
									guiInline = true,
									args = {
										sparkToggle = {
											order = 1,
											name = L["Toggle Spark"],
											desc = '',
											type = "toggle",
											get = function()
												return statusbars.channelBar.spark
											end,
											set = function(self,value)
												statusbars.channelBar.spark = value
												CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
											end,
										},
										iconToggle = {
											order = 2,
											name = L["Toggle Icon"],
											desc = '',
											type = "toggle",
											get = function()
												return statusbars.channelBar.icon.isEnabled
											end,
											set = function(self,value)
												statusbars.channelBar.icon.isEnabled = value
												CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
											end,
										},
										iconJustify = {
											order = 3,
											type = "select",
											name = L["Icon Justify"],
											desc = L["Set the side of the progress bar that the icon will appear."],
											get = function()
												return statusbars.channelBar.icon.justify
											end,
											set = function(self,value)
												statusbars.channelBar.icon.justify = value
												CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
											end,
											values = {
												["LEFT"] = L["Left"],
												["RIGHT"] = L["Right"],
											},
										},
									},
								},
								nametext = {
									name = '|cFFFFFFFF'..L['Spell Name Text']..'|r',
									type = "group",
									order = 6,
									disabled = true,
									guiInline = true,
									args = {
										color = {
											type = "color",
											order = 1,
											name = L["Text Color"],
											desc = L["Set the color of the text."],
											hasAlpha = true,
											get = function(info)
												local color = statusbars.channelBar.nametext.font.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = statusbars.channelBar.nametext.font.color
												
												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
											end,
										},
										filler_0 = {
											order = 2,
											type = "description",
											name = ' ',
										},
										fontName = {
											order = 3,
											type = "select",
											dialogControl = "LSM30_Font",
											name = L["Font"],
											desc = L["The font that will be used"],
											values = LSM:HashTable("font"),
											get = function() return statusbars.channelBar.nametext.font.name end,
											set = function(self,value)
												statusbars.channelBar.nametext.font.name = value
												CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
											end,
										},
										fontSize = {
											order = 4,
											type = "range",
											name = L["Font Size"],
											desc = L["Customize the font size of the cooldown text"],
											min = 5,
											max = 40,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.channelBar.nametext.font.size end,
											set = function(self,value)
												statusbars.channelBar.nametext.font.size = value
												CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
											end,
										},
										fontOutline = {
											order = 5,
											type = "select",
											name = L["Font Outline"],
											desc = L["The outline of the font"],
											get = function()
												return statusbars.channelBar.nametext.font.flag
											end,
											set = function(self,value)
												statusbars.channelBar.nametext.font.flag = value
												CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
											end,
											values = {
												[""] = L["None"],
												["OUTLINE"] = L["Outline"],
												["THICKOUTLINE"] = L["Thick Outline"],
												["MONOCHROME"] = L["Monochrome"],
												["OUTLINE, MONOCHROME"] = L["Monochrome Outline"],
												["THICKOUTLINE, MONOCHROME"] = L["Monochrome Thick Outline"],
											},
										},
										nametextAnchor = {
											order = 6,
											type = "select",
											name = L["Anchor Point"],
											desc = L["Set the anchor point."],
											get = function()
												return statusbars.channelBar.nametext.justify
											end,
											set = function(self,value)
												statusbars.channelBar.nametext.justify = value
												CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
											end,
											values = {
												["TOPLEFT"] = L["TOPLEFT"],
												["TOP"] = L["TOP"],
												["TOPRIGHT"] = L["TOPRIGHT"],
												["LEFT"] = L["LEFT"],
												["CENTER"] = L["CENTER"],
												["RIGHT"] = L["RIGHT"],
												["BOTTOMLEFT"] = L["BOTTOMLEFT"],
												["BOTTOM"] = L["BOTTOM"],
												["BOTTOMRIGHT"] = L["BOTTOMRIGHT"],
											}
										},
										nametextX = {
											order = 7,
											type = "range",
											name = "X",
											desc = L["Set location of text on the X axis"],
											min = -500,
											max = 500,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.channelBar.nametext.x end,
											set = function(self,value)
												statusbars.channelBar.nametext.x = value
												CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
											end,
										},
										nametextY = {
											order = 8,
											type = "range",
											name = "Y",
											desc = L["Set location of text on the Y axis"],
											min = -100,
											max = 100,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.channelBar.nametext.y end,
											set = function(self,value)
												statusbars.channelBar.nametext.y = value
												CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
											end,
										},
										shadow = {
											name = '|cFFFFFFFF'..L['Text Shadow']..'|r',
											type = "group",
											order = 9,
											hidden = false,
											guiInline = true,
											args = {
												shadowToggle = {
													order = 1,
													name = L["Toggle"],
													desc = '',
													type = "toggle",
													get = function()
														return statusbars.channelBar.nametext.font.shadow.isEnabled
													end,
													set = function(self,value)												
														statusbars.channelBar.nametext.font.shadow.isEnabled = value
														CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
													end,
												},
												shadowColor = {
													type = "color",
													order = 2,
													name = L["Shadow Color"],
													desc = L["Set the color of the text's shadow."],
													hasAlpha = true,
													disabled = true,
													get = function(info)
														local color = statusbars.channelBar.nametext.font.shadow.color
														return color.r, color.g, color.b, color.a
													end,
													set = function(info, r, g, b, a)
														local color = statusbars.channelBar.nametext.font.shadow.color
														
														color.r = tonumber(string.format("%.2f",r))
														color.g = tonumber(string.format("%.2f",g))
														color.b = tonumber(string.format("%.2f",b))
														color.a = tonumber(string.format("%.2f",a))
														CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
													end,
												},
												filler_0 = {
													order = 3,
													type = "description",
													name = ' ',
												},
												shadowX = {
													order = 4,
													type = "range",
													name = "X",
													desc = L["Set the text shadow's X offset"],
													min = -10,
													max = 10,
													step = 1,
													bigStep = 1,
													disabled = true,
													get = function() return statusbars.channelBar.nametext.font.shadow.offset.x end,
													set = function(self,value)
														statusbars.channelBar.nametext.font.shadow.offset.x = value
														CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
													end,
												},
												shadowY = {
													order = 5,
													type = "range",
													name = "Y",
													desc = L["Set the text shadow's Y offset"],
													min = -10,
													max = 10,
													step = 1,
													bigStep = 1,
													disabled = true,
													get = function() return statusbars.channelBar.nametext.font.shadow.offset.y end,
													set = function(self,value)
														statusbars.channelBar.nametext.font.shadow.offset.y = value
														CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
													end,
												},
											},
										},
									},
								},
								timetext = {
									name = '|cFFFFFFFFTimer Text|r',
									type = "group",
									order = 6,
									disabled = true,
									guiInline = true,
									args = {
										color = {
											type = "color",
											order = 1,
											name = L["Text Color"],
											desc = L["Set the color of the text."],
											hasAlpha = true,
											get = function(info)
												local color = statusbars.channelBar.timetext.font.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = statusbars.channelBar.timetext.font.color
												
												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
											end,
										},
										filler_0 = {
											order = 2,
											type = "description",
											name = ' ',
										},
										timeFontName = {
											order = 3,
											type = "select",
											dialogControl = "LSM30_Font",
											name = L["Font"],
											desc = L["The font that will be used"],
											values = LSM:HashTable("font"),
											get = function() return statusbars.channelBar.timetext.font.name end,
											set = function(self,value)
												statusbars.channelBar.timetext.font.name = value
												CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
											end,
										},
										timeFontSize = {
											order = 4,
											type = "range",
											name = L["Font Size"],
											desc = L["Customize the font size of the cooldown text"],
											min = 5,
											max = 40,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.channelBar.timetext.font.size end,
											set = function(self,value)
												statusbars.channelBar.timetext.font.size = value
												CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
											end,
										},
										timeFontOutline = {
											order = 5,
											type = "select",
											name = L["Font Outline"],
											desc = L["The outline of the font"],
											get = function()
												return statusbars.channelBar.timetext.font.flag
											end,
											set = function(self,value)
												statusbars.channelBar.timetext.font.flag = value
												CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
											end,
											values = {
												[""] = L["None"],
												["OUTLINE"] = L["Outline"],
												["THICKOUTLINE"] = L["Thick Outline"],
												["MONOCHROME"] = L["Monochrome"],
												["OUTLINE, MONOCHROME"] = L["Monochrome Outline"],
												["THICKOUTLINE, MONOCHROME"] = L["Monochrome Thick Outline"],
											},
										},
										timeTextAnchor = {
											order = 6,
											type = "select",
											name = L["Anchor Point"],
											desc = L["Set the anchor point."],
											get = function()
												return statusbars.channelBar.timetext.justify
											end,
											set = function(self,value)
												statusbars.channelBar.timetext.justify = value
												CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
											end,
											values = {
												["TOPLEFT"] = L["TOPLEFT"],
												["TOP"] = L["TOP"],
												["TOPRIGHT"] = L["TOPRIGHT"],
												["LEFT"] = L["LEFT"],
												["CENTER"] = L["CENTER"],
												["RIGHT"] = L["RIGHT"],
												["BOTTOMLEFT"] = L["BOTTOMLEFT"],
												["BOTTOM"] = L["BOTTOM"],
												["BOTTOMRIGHT"] = L["BOTTOMRIGHT"],
											}
										},
										timeTextX = {
											order = 7,
											type = "range",
											name = "X",
											desc = L["Set location of text on the X axis"],
											min = -500,
											max = 500,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.channelBar.timetext.x end,
											set = function(self,value)
												statusbars.channelBar.timetext.x = value
												CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
											end,
										},
										timeTextY = {
											order = 8,
											type = "range",
											name = "Y",
											desc = L["Set location of text on the Y axis"],
											min = -100,
											max = 100,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.channelBar.timetext.y end,
											set = function(self,value)
												statusbars.channelBar.timetext.y = value
												CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
											end,
										},
										shadow = {
											name = '|cFFFFFFFF'..L['Text Shadow']..'|r',
											type = "group",
											order = 9,
											hidden = false,
											guiInline = true,
											args = {
												shadowToggle = {
													order = 1,
													name = L["Toggle"],
													desc = '',
													type = "toggle",
													get = function()
														return statusbars.channelBar.timetext.font.shadow.isEnabled
													end,
													set = function(self,value)
														statusbars.channelBar.timetext.font.shadow.isEnabled = value
														CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
													end,
												},
												shadowColor = {
													type = "color",
													order = 2,
													name = L["Shadow Color"],
													desc = L["Set the color of the text's shadow."],
													hasAlpha = true,
													disabled = true,
													get = function(info)
														local color = statusbars.channelBar.timetext.font.shadow.color
														return color.r, color.g, color.b, color.a
													end,
													set = function(info, r, g, b, a)
														local color = statusbars.channelBar.timetext.font.shadow.color
														
														color.r = tonumber(string.format("%.2f",r))
														color.g = tonumber(string.format("%.2f",g))
														color.b = tonumber(string.format("%.2f",b))
														color.a = tonumber(string.format("%.2f",a))
														CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
													end,
												},
												filler_0 = {
													order = 3,
													type = "description",
													name = ' ',
												},
												shadowX = {
													order = 4,
													type = "range",
													name = "X",
													desc = L["Set the text shadow's X offset"],
													min = -10,
													max = 10,
													step = 1,
													bigStep = 1,
													disabled = true,
													get = function() return statusbars.channelBar.timetext.font.shadow.offset.x end,
													set = function(self,value)
														statusbars.channelBar.timetext.font.shadow.offset.x = value
														CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
													end,
												},
												shadowY = {
													order = 5,
													type = "range",
													name = "Y",
													desc = L["Set the text shadow's Y offset"],
													min = -10,
													max = 10,
													step = 1,
													bigStep = 1,
													disabled = true,
													get = function() return statusbars.channelBar.timetext.font.shadow.offset.y end,
													set = function(self,value)
														statusbars.channelBar.timetext.font.shadow.offset.y = value
														CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
													end,
												},
											},
										},
									},
								},
								layout = {
									name = L["Layout & Design"],
									type = "group",
									order = 7,
									guiInline = true,
									args = {
										texture = {
											order = 1,
											type = "select",
											name = L["Bar Texture"],
											desc = L["Set the bar's texture."],
											dialogControl = "LSM30_Statusbar",
											get = function()
												return statusbars.channelBar.foreground.texture
											end,
											set = function(self,value)
												statusbars.channelBar.foreground.texture = value
												CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
											end,
											values = LSM:HashTable(LSM.MediaType.STATUSBAR),
										},
										textureColor = {
											type = "color",
											order = 2,
											name = L["Bar Color"],
											get = function(info)
												local color = statusbars.channelBar.foreground.color
												return color.r, color.g, color.b
											end,
											set = function(info, r, g, b)
												local color = statusbars.channelBar.foreground.color
												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
											end,
										},
										filler_0 = {
											order = 3,
											type = "description",
											name = ' ',
										},
										backgroundTexture = {
											order = 4,
											type = "select",
											name = L["Background Texture"],
											desc = L["Set the bar's background texture."],
											dialogControl = "LSM30_Statusbar",
											get = function()
												return statusbars.channelBar.background.texture
											end,
											set = function(self,value)
												statusbars.channelBar.background.texture = value
												CheckEnhancementDefaultValues(enh_options,"Channel",'channelBar')
											end,
											values = LSM:HashTable(LSM.MediaType.STATUSBAR),
										},
										backgroundColor = {
											type = "color",
											order = 5,
											name = L["Background Color"],
											desc = L["Set the color of the cast bar's background."],
											hasAlpha = true,
											get = function(info)
												local color = statusbars.channelBar.background.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = statusbars.channelBar.background.color
												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												db.a = a
												CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
											end,
										},
										backgroundToggle = {
											order = 6,
											name = L["Modify Background"],
											desc = L["Toggle the adjustment of the bar's background texture"],
											type = "toggle",
											get = function()
												return statusbars.channelBar.adjust.showBG
											end,
											set = function(self,value)
												statusbars.channelBar.adjust.showBG = value
												CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
											end,
										},
										width = {
											order = 7,
											type = "range",
											name = L["Width"],
											desc = '',
											min = 100,
											max = 500,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.channelBar.layout.width end,
											set = function(self,value)
												statusbars.channelBar.layout.width = value
												CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
											end,
										},
										height = {
											order = 8,
											type = "range",
											name = L["Height"],
											desc = '',
											min = 10,
											max = 100,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.channelBar.layout.height end,
											set = function(self,value)
												statusbars.channelBar.layout.height = value
												CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
											end,
										},
									},
								},
								reset = {
									order = 8,
									type = "execute",
									name = L["Reset Channel Bar"],
									func = function()
										local bar = statusbars.channelBar
										local default = statusbarDefaults.channelBar
										
										bar.alphaCombat = default.alphaCombat
										bar.alphaOoC = default.alphaOoC
										
										bar.nametext.isDisplayText = true
										bar.nametext.x = default.nametext.x
										bar.nametext.y = default.nametext.y
										bar.nametext.font.name = default.nametext.font.name
										bar.nametext.font.size = default.nametext.font.size
										bar.nametext.font.flag = default.nametext.font.flag
										bar.nametext.font.color.r = default.nametext.font.color.r
										bar.nametext.font.color.g = default.nametext.font.color.g
										bar.nametext.font.color.b = default.nametext.font.color.b
										bar.nametext.font.color.a = default.nametext.font.color.a
										bar.nametext.font.shadow.isEnabled = false
										bar.nametext.font.shadow.offset.x = default.nametext.font.shadow.offset.x
										bar.nametext.font.shadow.offset.y = default.nametext.font.shadow.offset.y
										bar.nametext.font.shadow.color.r = default.nametext.font.shadow.color.r
										bar.nametext.font.shadow.color.g = default.nametext.font.shadow.color.g
										bar.nametext.font.shadow.color.b = default.nametext.font.shadow.color.b
										bar.nametext.font.shadow.color.a = default.nametext.font.shadow.color.a
										bar.nametext.justify = default.nametext.justify
										
										bar.timetext.isDisplayText = true
										bar.timetext.x = default.timetext.x
										bar.timetext.y = default.timetext.y
										bar.timetext.font.name = default.timetext.font.name
										bar.timetext.font.size = default.timetext.font.size
										bar.timetext.font.flag = default.timetext.font.flag
										bar.timetext.font.color.r = default.timetext.font.color.r
										bar.timetext.font.color.g = default.timetext.font.color.g
										bar.timetext.font.color.b = default.timetext.font.color.b
										bar.timetext.font.color.a = default.timetext.font.color.a
										bar.timetext.font.shadow.isEnabled = false
										bar.timetext.font.shadow.offset.x = default.timetext.font.shadow.offset.x
										bar.timetext.font.shadow.offset.y = default.timetext.font.shadow.offset.y
										bar.timetext.font.shadow.color.r = default.timetext.font.shadow.color.r
										bar.timetext.font.shadow.color.g = default.timetext.font.shadow.color.g
										bar.timetext.font.shadow.color.b = default.timetext.font.shadow.color.b
										bar.timetext.font.shadow.color.a = default.timetext.font.shadow.color.a
										bar.timetext.justify = default.timetext.justify
										
										bar.icon.isEnabled = true
										bar.icon.justify = default.icon.justify
										bar.spark = true
										
										bar.background.texture = default.background.texture
										bar.background.color.r = default.background.color.r
										bar.background.color.g = default.background.color.g
										bar.background.color.b = default.background.color.b
										bar.background.color.a = default.background.color.a
										
										bar.foreground.color.r = default.foreground.color.r
										bar.foreground.color.g = default.foreground.color.g
										bar.foreground.color.b = default.foreground.color.b
										bar.foreground.texture = default.foreground.texture
										
										bar.layout.width = default.layout.width
										bar.layout.height = default.layout.height
										bar.layout.strata = default.layout.strata
										enh_options.args.config.args.channelBar.args.reset.disabled = true
										enh_options.args.config.args.channelBar.args.reset.name = "|cFF666666"..L["Reset Channel Bar"].."|r"
										CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
										
										if (not bar.adjust.isEnabled) then
											Auras:InitializeProgressBar('ChannelBarEnh',nil,'channelBar','nametext','timetext',2)
										end
									end,
								},
							},
						},
					},
				},
				layout = {
					name = L["Layout"],
					order = 3,
					type = "group",
					disabled = true,
					args = {
						MoveAuras = {
							order = 1,
							type = "execute",
							name = "|cFFFFCC00"..L["Move Enhancement Auras"].."|r",
							func = function()
								elements.isMoving = true
								SSA.MoveEnh.Info:Show()
								Auras:InitMoveAuraGroups(SSA.AuraObjectsEnh,"Enh")
							end,
						},
						ResetAuras = {
							order = 2,
							type = "execute",
							name = "|cFFFFCC00"..L["Reset Enhancement Auras"].."|r",
							func = function()
								Auras:ResetAuraGroupPosition('AuraGroupEnh')
							end,
						},
						--[[filler_0 = {
							order = 3,
							type = "description",
							name = ' ',
						},
						primaryDesc = {
							order = 4,
							type = "description",
							name = L["Primary Auras"],
						},]]
						primaryAuras = {
							name = L["Primary Auras"],
							type = "group",
							order = 3,
							guiInline = true,
							args = {
								PrimaryOrientation1 = {
									order = 1,
									type = "select",
									name = L["Primary Orientation 1"],
									desc = L["Set the aura orientation to horizontal or vertical."],
									get = function()
										return layout.orientation.top
									end,
									set = function(self,value)
										layout.orientation.top = value
										CheckEnhancementDefaultValues(enh_options,"Primary")
										Auras:UpdateTalents()
									end,
									values = {
										["Horizontal"] = L["Horizontal"],
										["Vertical"] = L["Vertical"],
									},
								},
								PrimaryOrientation2 = {
									order = 2,
									type = "select",
									name = L["Primary Orientation 2"],
									desc = L["Set the aura orientation to horizontal or vertical."],
									get = function()
										return layout.orientation.bottom
									end,
									set = function(self,value)
										layout.orientation.bottom = value
										CheckEnhancementDefaultValues(enh_options,"Primary")
										Auras:UpdateTalents()
									end,
									values = {
										["Horizontal"] = L["Horizontal"],
										["Vertical"] = L["Vertical"],
									},
								},
								filler_1 = {
									order = 3,
									type = "description",
									name = ' ',
								},
								AuraSizeRow1 = {
									order = 4,
									type = "range",
									name = L["Primary Size 1"],
									desc = L["Determines the size of primary auras in row 1. (Default is 32)"],
									min = 16,
									max = 256,
									step = 1,
									bigStep = 1,
									get = function() return layout.primary.top.icon end,
									set = function(self,value)
										layout.primary.top.icon = value
										CheckEnhancementDefaultValues(enh_options,"Primary")
										Auras:UpdateTalents()
									end,
								},
								AuraSpacingRow1 = {
									order = 5,
									type = "range",
									name = L["Primary Spacing 1"],
									desc = L["Determines the spacing of the primary auras in row 1. (Default is 50)"],
									min = 32,
									max = 300,
									step = 1,
									bigStep = 1,
									get = function() return layout.primary.top.spacing end,
									set = function(self,value)
										layout.primary.top.spacing = value
										CheckEnhancementDefaultValues(enh_options,"Primary")
										Auras:UpdateTalents()
									end,
								},
								AuraChargesRow1 = {
									order = 6,
									type = "range",
									name = L["Primary Charges 1"],
									desc = L["Determines the size of the primary charge text in row 1. (Default is 13.5)"],
									min = 10,
									max = 60,
									step = 0.5,
									bigStep = 0.5,
									get = function() return layout.primary.top.charges end,
									set = function(self,value)
										layout.primary.top.charges = value
										CheckEnhancementDefaultValues(enh_options,"Primary")
										Auras:UpdateTalents()
									end,
								},
								filler_2 = {
									order = 7,
									type = "description",
									name = ' ',
								},
								AuraSizeRow2 = {
									order = 8,
									type = "range",
									name = L["Primary Size 2"],
									desc = L["Determines the size of primary auras in row 2. (Default is 32)"],
									min = 16,
									max = 256,
									step = 1,
									bigStep = 1,
									get = function() return layout.primary.bottom.icon end,
									set = function(self,value)
										layout.primary.bottom.icon = value
										CheckEnhancementDefaultValues(enh_options,"Primary")
										Auras:UpdateTalents()
									end,
								},
								AuraSpacingRow2 = {
									order = 9,
									type = "range",
									name = L["Primary Spacing 2"],
									desc = L["Determines the spacing of the primary auras in row 2. (Default is 50)"],
									min = 32,
									max = 300,
									step = 1,
									bigStep = 1,
									get = function() return layout.primary.bottom.spacing end,
									set = function(self,value)
										layout.primary.bottom.spacing = value
										CheckEnhancementDefaultValues(enh_options,"Primary")
										Auras:UpdateTalents()
									end,
								},
								AuraChargesRow2 = {
									order = 10,
									type = "range",
									name = L["Primary Charges 2"],
									desc = L["Determines the size of the primary charge text in row 2. (Default is 13.5)"],
									min = 10,
									max = 60,
									step = 0.5,
									bigStep = 0.5,
									get = function() return layout.primary.bottom.charges end,
									set = function(self,value)
										layout.primary.bottom.charges = value
										CheckEnhancementDefaultValues(enh_options,"Primary")
										Auras:UpdateTalents()
									end,
								},
								filler_3 = {
									order = 11,
									type = "description",
									name = ' ',
								},
								ResetPrimaryLayout = {
									order = 12,
									type = "execute",
									--name = "|cFFFFCC00"..L["Reset Primary Layout"].."|r",
									--disabled = false,
									name = L["Reset Primary Layout"],
									func = function()
										layout.orientation.top = layoutDefaults.orientation.top
										layout.orientation.bottom = layoutDefaults.orientation.bottom
										layout.primary.top.icon = layoutDefaults.primary.top.icon
										layout.primary.top.spacing = layoutDefaults.primary.top.spacing
										layout.primary.top.charges = layoutDefaults.primary.top.charges
										layout.primary.bottom.icon = layoutDefaults.primary.bottom.icon
										layout.primary.bottom.spacing = layoutDefaults.primary.bottom.spacing
										layout.primary.bottom.charges = layoutDefaults.primary.bottom.charges
										enh_options.args.layout.args.primaryAuras.args.ResetPrimaryLayout.disabled = true
										enh_options.args.layout.args.primaryAuras.args.ResetPrimaryLayout.name = "|cFF666666"..L["Reset Primary Layout"].."|r"
										Auras:UpdateTalents()
									end,
								},
							},
						},
						--[[filler_4 = {
							order = 17,
							type = "description",
							name = ' ',
						},
						filler_5 = {
							order = 18,
							type = "description",
							name = ' ',
						},
						secondaryDesc = {
							order = 19,
							type = "description",
							name = L["Secondary Auras"],
						},]]
						secondaryAuras = {
							name = L["Secondary Auras"],
							type = "group",
							order = 4,
							guiInline = true,
							args = {
								SecondaryOrientation1 = {
									order = 1,
									type = "select",
									name = L["Secondary Orientation 1"],
									desc = L["Set the aura orientation to horizontal or vertical."],
									get = function()
										return layout.orientation.left
									end,
									set = function(self,value)
										layout.orientation.left = value
										CheckEnhancementDefaultValues(enh_options,"Secondary")
										Auras:UpdateTalents()
									end,
									values = {
										["Horizontal"] = L["Horizontal"],
										["Vertical"] = L["Vertical"],
									},
								},
								SecondaryOrientation2 = {
									order = 2,
									type = "select",
									name = L["Secondary Orientation 2"],
									desc = L["Set the aura orientation to horizontal or vertical."],
									get = function()
										return layout.orientation.right
									end,
									set = function(self,value)
										layout.orientation.right = value
										CheckEnhancementDefaultValues(enh_options,"Secondary")
										Auras:UpdateTalents()
									end,
									values = {
										["Horizontal"] = L["Horizontal"],
										["Vertical"] = L["Vertical"],
									},
								},
								filler_6 = {
									order = 3,
									type = "description",
									name = ' ',
								},
								AuraSizeCol1 = {
									order = 4,
									type = "range",
									name = L["Secondary Size 1"],
									desc = L["Determines the size of secondary auras in column 1. (Default is 25)"],
									min = 16,
									max = 256,
									step = 1,
									bigStep = 1,
									get = function() return layout.secondary.left.icon end,
									set = function(self,value)
										layout.secondary.left.icon = value
										CheckEnhancementDefaultValues(enh_options,"Secondary")
										Auras:UpdateTalents()
									end,
								},
								AuraSpacingCol1 = {
									order = 5,
									type = "range",
									name = L["Secondary Spacing 1"],
									desc = L["Determines the spacing of the secondary auras in column 1. (Default is 30)"],
									min = 32,
									max = 300,
									step = 1,
									bigStep = 1,
									get = function() return layout.secondary.left.spacing end,
									set = function(self,value)
										layout.secondary.left.spacing = value
										CheckEnhancementDefaultValues(enh_options,"Secondary")
										Auras:UpdateTalents()
									end,
								},
								filler_7 = {
									order = 6,
									type = "description",
									name = ' ',
								},
								AuraSizeCol2 = {
									order = 7,
									type = "range",
									name = L["Secondary Size 2"],
									desc = L["Determines the size of secondary auras in column 2. (Default is 25)"],
									min = 16,
									max = 256,
									step = 1,
									bigStep = 1,
									get = function() return layout.secondary.right.icon end,
									set = function(self,value)
										layout.secondary.right.icon = value
										CheckEnhancementDefaultValues(enh_options,"Secondary")
										Auras:UpdateTalents()
									end,
								},
								AuraSpacingCol2 = {
									order = 8,
									type = "range",
									name = L["Secondary Spacing 2"],
									desc = L["Determines the spacing of the secondary auras in column 2. (Default is 30)"],
									min = 32,
									max = 300,
									step = 1,
									bigStep = 1,
									get = function() return layout.secondary.right.spacing end,
									set = function(self,value)
										layout.secondary.right.spacing = value
										CheckEnhancementDefaultValues(enh_options,"Secondary")
										Auras:UpdateTalents()
									end,
								},
								filler_8 = {
									order = 9,
									type = "description",
									name = ' ',
								},
							--[[	filler_8 = {
									order = 25,
									type = "description",
									name = ' ',
								},]]
								ResetSecondaryLayout = {
									order = 10,
									type = "execute",
									--name = "|cFFFFCC00"..L["Reset Secondary Layout"].."|r",
									--disabled = false,
									name = L["Reset Secondary Layout"],
									func = function()
										layout.orientation.left = layoutDefaults.orientation.left
										layout.orientation.right = layoutDefaults.orientation.right
										layout.secondary.left.icon = layoutDefaults.secondary.left.icon
										layout.secondary.left.spacing = layoutDefaults.secondary.left.spacing
										layout.secondary.right.icon = layoutDefaults.secondary.right.icon
										layout.secondary.right.spacing = layoutDefaults.secondary.right.spacing
										enh_options.args.layout.args.secondaryAuras.args.ResetSecondaryLayout.disabled = true
										enh_options.args.layout.args.secondaryAuras.args.ResetSecondaryLayout.name = "|cFF666666"..L["Reset Secondary Layout"].."|r"
										Auras:UpdateTalents()
									end,
								},
							},
						},
					},
				},
			}
		}
	end
		
	return enh_options
end



local res_options

local function GetRestorationOptions()
	if not res_options then
		local SSA = SSA
		local db = Auras.db.char
		
		-- Database Shortcuts
		local settings = db.settings[3]
		local settingDefaults = db.settings.defaults
		
		-- Element Tables
		local elements = db.elements[3]
		local cooldowns = db.elements[3].cooldowns
		local timerbars = db.elements[3].timerbars
		local statusbars = db.elements[3].statusbars
		local frames = db.elements[3].frames
		local auras = db.auras[3]
		
		-- Layout Table
		local layout = db.layout[3]
		local layoutDefaults = db.layout.defaults
		
		-- Element Defaults Tables
		local timerbarDefaults = db.elements.defaults[3].timerbars
		local statusbarDefaults = db.elements.defaults[3].statusbars
		local frameDefaults = db.elements.defaults[3].frames
		
		res_options = {
			type = "group",
			childGroups = "tab",
			order = 1,
			name = L["Restoration Auras"],
			desc = L["Auras used by the Restoration specialization"],
			args = {
				display = {
					name = L["Display"],
					order = 1,
					type = "group",
					args = {
						show = {
							order = 1,
							name = L["Show Restoration Auras"],
							desc = L["Toggle the display of Elemental Auras"],
							type = "toggle",
							get = function()
								return elements.isEnabled
							end,
							set = function(self,value)
								elements.isEnabled = value
								if (not value) then
									SSA.AuraGroupRes:Hide()
								else
									SSA.AuraGroupRes:Show()
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
										return auras.AncestralGuidanceRes
									end,
									set = function(self,value)
										auras.AncestralGuidanceRes = value
										Auras:UpdateTalents()
									end,
								},
								AscendanceRes = {
									order = 2,
									type = "toggle",
									name = L["Ascendance"],
									get = function() 
										return auras.AscendanceRes
									end,
									set = function(self,value)
										auras.AscendanceRes = value
										Auras:UpdateTalents()
									end,
								},
								CloudburstTotem = {
									order = 3,
									type = "toggle",
									name = L["Cloudburst Totem"],
									get = function() 
										return auras.CloudburstTotem
									end,
									set = function(self,value)
										auras.CloudburstTotem = value
										Auras:UpdateTalents()
									end,
								},
								Concordance = {
									order = 4,
									type = "toggle",
									name = L["Concordance of the Legionfall"],
									get = function()
										return auras.ConcordanceRes
									end,
									set = function(self,value)
										auras.ConcordanceRes = value
										Auras:UpdateTalents()
									end,
								},
								GiftOfQueen = {
									order = 5,
									type = "toggle",
									name = L["Gift of the Queen"],
									get = function() 
										return auras.GiftOfQueen
									end,
									set = function(self,value)
										auras.GiftOfQueen = value
										Auras:UpdateTalents()
									end,
								},
								HealingRain = {
									order = 6,
									type = "toggle",
									name = L["Healing Rain"],
									get = function()
										return auras.HealingRain
									end,
									set = function(self,value)
										auras.HealingRain = value
										Auras:UpdateTalents()
									end,
								},
								HealingStreamTotem = {
									order = 7,
									type = "toggle",
									name = L["Healing Stream Totem"],
									get = function() 
										return auras.HealingStreamTotem
									end,
									set = function(self,value)
										auras.HealingStreamTotem = value
										Auras:UpdateTalents()
									end,
								},
								HealingTideTotem = {
									order = 8,
									type = "toggle",
									name = L["Healing Tide Totem"],
									get = function() 
										return auras.HealingTideTotem
									end,
									set = function(self,value)
										auras.HealingTideTotem = value
										Auras:UpdateTalents()
									end,
								},
								Riptide = {
									order = 9,
									type = "toggle",
									name = L["Riptide"],
									get = function()
										return auras.Riptide
									end,
									set = function(self,value)
										auras.Riptide = value
										Auras:UpdateTalents()
									end,
								},
								SpiritLinkTotem = {
									order = 10,
									type = "toggle",
									name = L["Spirit Link Totem"],
									get = function() 
										return auras.SpiritLinkTotem
									end,
									set = function(self,value)
										auras.SpiritLinkTotem = value
										Auras:UpdateTalents()
									end,
								},
								UnleashLife = {
									order = 11,
									type = "toggle",
									name = L["Unleash Life"],
									get = function()
										return auras.UnleashLife
									end,
									set = function(self,value)
										auras.UnleashLife = value
										Auras:UpdateTalents()
									end,
								},
								Wellspring = {
									order = 12,
									type = "toggle",
									name = L["Wellspring"],
									get = function() 
										return auras.Wellspring
									end,
									set = function(self,value)
										auras.Wellspring = value
										Auras:UpdateTalents()
									end,
								},
								WindRushTotemRes = {
									order = 13,
									type = "toggle",
									name = L["Wind Rush Totem"],
									get = function() 
										return auras.WindRushTotemRes
									end,
									set = function(self,value)
										auras.WindRushTotemRes = value
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
										return auras.AstralShiftRes
									end,
									set = function(self,value)
										auras.AstralShiftRes = value
										Auras:UpdateTalents()
									end,
								},
								EarthenShield = {
									order = 2,
									type = "toggle",
									name = L["Earthen Shield Totem"],
									get = function()
										return auras.EarthenShieldTotem
									end,
									set = function(self,value)
										auras.EarthenShieldTotem = value
										Auras:UpdateTalents()
									end,
								},
								EarthgrabTotemRes = {
									order = 3,
									type = "toggle",
									name = L["Earthgrab Totem"],
									get = function() 
										return auras.EarthgrabTotemRes
									end,
									set = function(self,value)
										auras.EarthgrabTotemRes = value
										Auras:UpdateTalents()
									end,
								},
								FlameShockRes = {
									order = 4,
									type = "toggle",
									name = L["Flame Shock"],
									get = function() 
										return auras.FlameShockRes
									end,
									set = function(self,value)
										auras.FlameShockRes = value
										Auras:UpdateTalents()
									end,
								},
								GustWindRes = {
									order = 5,
									type = "toggle",
									name = L["Gust of Wind"],
									get = function() 
										return auras.GustWindRes
									end,
									set = function(self,value)
										auras.GustWindRes = value
										Auras:UpdateTalents()
									end,
								},
								Hex = {
									order = 6,
									type = "toggle",
									name = L["Hex"],
									get = function()
										return auras.HexRes
									end,
									set = function(self,value)
										auras.HexRes = value
										Auras:UpdateTalents()
									end,
								},
								LavaBurstRes = {
									order = 7,
									type = "toggle",
									name = L["Lava Burst"],
									get = function() 
										return auras.LavaBurstRes
									end,
									set = function(self,value)
										auras.LavaBurstRes = value
										Auras:UpdateTalents()
									end,
								},
								LightningSurgeTotemRes = {
									order = 8,
									type = "toggle",
									name = L["Lightning Surge Totem"],
									get = function() 
										return auras.LightningSurgeTotemRes
									end,
									set = function(self,value)
										auras.LightningSurgeTotemRes = value
										Auras:UpdateTalents()
									end,
								},
								PurifySpirit = {
									order = 9,
									type = "toggle",
									name = L["Purify Spirit"],
									get = function() 
										return auras.PurifySpirit
									end,
									set = function(self,value)
										auras.PurifySpirit = value
										Auras:UpdateTalents()
									end,
								},
								SpiritwalkersGrace = {
									order = 10,
									type = "toggle",
									name = L["Spiritwalker's Grace"],
									get = function() 
										return auras.SpiritwalkersGrace
									end,
									set = function(self,value)
										auras.SpiritwalkersGrace = value
										Auras:UpdateTalents()
									end,
								},
								VoodooTotemRes = {
									order = 11,
									type = "toggle",
									name = L["Voodoo Totem"],
									get = function() 
										return auras.VoodooTotemRes
									end,
									set = function(self,value)
										auras.VoodooTotemRes = value
										Auras:UpdateTalents()
									end,
								},
								WindRushTotemRes = {
									order = 12,
									type = "toggle",
									name = L["Wind Rush Totem"],
									get = function()
										return auras.WindRushTotemRes
									end,
									set = function(self,value)
										auras.WindRushTotemRes = value
										Auras:UpdateTalents()
									end,
								},
								WindShearRes = {
									order = 13,
									type = "toggle",
									name = L["Wind Shear"],
									get = function() 
										return auras.WindShearRes
									end,
									set = function(self,value)
										auras.WindShearRes = value
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
												return timerbars.buff.ancestralGuidance
											end,
											set = function(self,value)
												timerbars.buff.ancestralGuidance = value
											end,
										},
										AscendanceBarRes = {
											order = 2,
											type = "toggle",
											name = L["Ascendance"],
											get = function() 
												return timerbars.buff.ascendance
											end,
											set = function(self,value)
												timerbars.buff.ascendance = value
											end,
										},
										AstralShiftBarRes = {
											order = 3,
											type = "toggle",
											name = L["Astral Shift"],
											get = function() 
												return timerbars.buff.astralShift
											end,
											set = function(self,value)
												timerbars.buff.astralShift = value
											end,
										},
										Bloodlust = {
											order = 4,
											type = "toggle",
											name = L["Bloodlust"],
											hidden = false,
											get = function() 
												return timerbars.buff.bloodlust
											end,
											set = function(self,value)
												timerbars.buff.bloodlust = value
											end,
										},
										Heroism = {
											order = 5,
											type = "toggle",
											name = L["Heroism"],
											hidden = false,
											get = function() 
												return timerbars.buff.heroism
											end,
											set = function(self,value)
												timerbars.buff.heroism = value
											end,
										},
										SpiritwalkersGraceBar = {
											order = 6,
											type = "toggle",
											name = L["Spiritwalker's Grace"],
											get = function() 
												return timerbars.buff.spiritwalkersGrace
											end,
											set = function(self,value)
												timerbars.buff.spiritwalkersGrace = value
											end,
										},
										TimeWarp = {
											order = 7,
											type = "toggle",
											name = L["Time Warp"],
											get = function() 
												return timerbars.buff.timeWarp
											end,
											set = function(self,value)
												timerbars.buff.timeWarp = value
											end,
										},
										UnleashLifeBar = {
											order = 8,
											type = "toggle",
											name = L["Unleash Life"],
											get = function() 
												return timerbars.buff.unleashLife
											end,
											set = function(self,value)
												timerbars.buff.unleashLife = value
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
												return timerbars.main.ancestralProtectionTotem
											end,
											set = function(self,value)
												timerbars.main.ancestralProtectionTotem = value
											end,
										},
										CloudburstTotemBar = {
											order = 2,
											type = "toggle",
											name = L["Cloudburst Totem"],
											get = function() 
												return timerbars.main.cloudburstTotem
											end,
											set = function(self,value)
												timerbars.main.cloudburstTotem = value
											end,
										},
										EarthgrabTotemBarRes = {
											order = 3,
											type = "toggle",
											name = L["Earthgrab Totem"],
											get = function() 
												return timerbars.util.earthgrabTotem
											end,
											set = function(self,value)
												timerbars.util.earthgrabTotem = value
											end,
										},
										HealingStreamTotemBar = {
											order = 4,
											type = "toggle",
											name = L["Healing Stream Totem"],
											get = function() 
												return timerbars.main.healingStreamTotemOne
											end,
											set = function(self,value)
												timerbars.main.healingStreamTotemOne = value
												timerbars.main.healingStreamTotemTwo = value
											end,
										},
										HealingTideTotemBar = {
											order = 5,
											type = "toggle",
											name = L["Healing Tide Totem"],
											get = function() 
												return timerbars.main.healingTideTotem
											end,
											set = function(self,value)
												timerbars.main.healingTideTotem = value
											end,
										},
										SpiritLinkTotemBar = {
											order = 6,
											type = "toggle",
											name = L["Spirit Link Totem"],
											get = function() 
												return timerbars.main.spiritLinkTotem
											end,
											set = function(self,value)
												timerbars.main.spiritLinkTotem = value
											end,
										},
										VoodooTotemBarRes = {
											order = 7,
											type = "toggle",
											name = L["Voodoo Totem"],
											get = function() 
												return timerbars.util.voodooTotem
											end,
											set = function(self,value)
												timerbars.util.voodooTotem = value
											end,
										},
										WindRushTotemBarRes = {
											order = 8,
											type = "toggle",
											name = L["Wind Rush Totem"],
											get = function() 
												return timerbars.util.windRushTotem
											end,
											set = function(self,value)
												timerbars.util.windRushTotem = value
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
										return frames.Undulation
									end,
									set = function(self,value)
										frames.Undulation = value
									end,
								},
							},
						},
					},
				},
				config = {
					name = L["Configuration"],
					order = 2,
					type = "group",
					childGroups = "tab",
					disabled = true,
					args = {
						general = {
							name = L["General"],
							order = 1,
							inline = false,
							type = "group",
							args = {
								statusbars = {
									name = L["Statusbar Manager"],
									type = "group",
									order = 1,
									guiInline = true,
									args = {
										defaultBarToggle = {
											order = 1,
											name = L["Blizzard Casting Bar"],
											desc = L["Toggles the display of Blizzard's default casting bar"],
											type = "toggle",
											get = function()
												return statusbars.defaultBar
											end,
											set = function(self,value)
												--[[local option = res_options.args.config.args.manaBar
												if (value) then
													option.disabled = false
												else
													option.disabled = true
												end]]
												
												statusbars.defaultBar = value
											end,
										},
										castBarToggle = {
											order = 2,
											name = L["Toggle Cast Bar"],
											desc = L["Toggles the display of the cast bar"],
											type = "toggle",
											get = function()
												return statusbars.castBar.isEnabled
											end,
											set = function(self,value)
												local option = res_options.args.config.args.castBar
												if (value) then
													option.disabled = false
												else
													option.disabled = true
												end
												
												statusbars.castBar.isEnabled = value
											end,
										},
										channelToggle = {
											order = 3,
											name = L["Toggle Channel Bar"],
											desc = L["Toggles the display of the channel bar"],
											type = "toggle",
											get = function()
												return statusbars.channelBar.isEnabled
											end,
											set = function(self,value)
												local option = res_options.args.config.args.channelBar
												if (value) then
													option.disabled = false
												else
													option.disabled = true
												end
												
												statusbars.channelBar.isEnabled = value
											end,
										},
										manaBarToggle = {
											order = 4,
											name = L["Toggle Mana Bar"],
											desc = L["Toggles the display of the Mana Bar"],
											type = "toggle",
											get = function()
												return statusbars.manaBar.isEnabled
											end,
											set = function(self,value)
												local option = res_options.args.config.args.manaBar
												if (value) then
													option.disabled = false
												else
													option.disabled = true
												end
												
												statusbars.manaBar.isEnabled = value
											end,
										},
										earthenShieldToggle = {
											order = 5,
											name = L["Toggle Earthen Shield Bar"],
											desc = L["Toggles the display of the Earthen Shield bar"],
											type = "toggle",
											get = function()
												return statusbars.earthenShieldBar.isEnabled
											end,
											set = function(self,value)
												local option = res_options.args.config.args.earthenShieldBar
												if (value) then
													option.disabled = false
												else
													option.disabled = true
												end
												
												statusbars.earthenShieldBar.isEnabled = value
											end,
										},
										tidalWavesToggle = {
											order = 6,
											name = L["Toggle Tidal Waves Bar"],
											desc = L["Toggles the display of the Tidal Waves bar"],
											type = "toggle",
											get = function()
												return statusbars.tidalWavesBar.isEnabled
											end,
											set = function(self,value)
												local option = res_options.args.config.args.tidalWavesBar
												if (value) then
													option.disabled = false
												else
													option.disabled = true
												end
												
												statusbars.tidalWavesBar.isEnabled = value
											end,
										},
									},
								},
								cooldown = {
									name = L["Cooldown Settings"],
									type = "group",
									order = 2,
									--disabled = true,
									guiInline = true,
									args = {
										text = {
											order = 1,
											name = L["Cooldown Values"],
											desc = L["Toggle the display of cooldown text/numbers."],
											type = "toggle",
											get = function()
												return cooldowns.text
											end,
											set = function(self,value)
												cooldowns.text = value
											end,
										},
										sweep = {
											order = 2,
											name = L["Cooldown Sweep Animation"],
											desc = L["Toggle the display of the cooldown animation sweep."],
											type = "toggle",
											get = function()
												return cooldowns.sweep
											end,
											set = function(self,value)
												cooldowns.sweep = value
												
												if (not value) then
													res_options.args.config.args.general.args.cooldown.args.inverse.disabled = true
												else
													res_options.args.config.args.general.args.cooldown.args.inverse.disabled = false
												end
											end,
										},
										inverse = {
											order = 3,
											name = L["Reverse Sweep Animation"],
											desc = L["Reverses the cooldown animation sweep."],
											type = "toggle",
											get = function()
												return cooldowns.inverse
											end,
											set = function(self,value)
												cooldowns.inverse = value
											end,
										},
									},
								},
								settings = {
									name = L["Aura Settings"],
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
											get = function() return settings.OoCAlpha end,
											set = function(self,value)
												settings.OoCAlpha = value
												CheckRestorationDefaultValues(res_options,"Triggers")
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
											get = function() return settings.flameShock end,
											set = function(self,value)
												settings.flameShock = value
												CheckRestorationDefaultValues(res_options,"Triggers")
											end,
										},
										OoRColor = {
											type = "color",
											order = 3,
											name = L["Color (OoR)"],
											desc = L["Determines the color of harmful auras will appear when out of range"],
											hasAlpha = true,
											get = function(info)
												return settings.OoRColor.r, settings.OoRColor.g, settings.OoRColor.b, settings.OoRColor.a
											end,
											set = function(info, r, g, b, a)
												settings.OoRColor.r = r
												settings.OoRColor.g = g
												settings.OoRColor.b = b
												settings.OoRColor.a = a
												CheckRestorationDefaultValues(res_options,"Triggers")
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
											--name = "|cFFFFCC00"..L["Reset Settings Values"].."|r",
											--disabled = false,
											name = L["Reset Settings Values"],
											func = function()
												settings.OoCAlpha = Auras.db.char.triggers.default.OoCAlpha
												settings.flameShock = Auras.db.char.triggers.default[3].flameShock
												settings.OoRColor.r = Auras.db.char.triggers.default.OoRColor.r
												settings.OoRColor.g = Auras.db.char.triggers.default.OoRColor.g
												settings.OoRColor.b = Auras.db.char.triggers.default.OoRColor.b
												settings.OoRColor.a = Auras.db.char.triggers.default.OoRColor.a
												
												res_options.args.config.args.triggers.args.reset.disabled = true
												res_options.args.config.args.triggers.args.reset.name = "|cFF666666"..L["Reset Settings Values"].."|r"
											end,
										},
									},
								},
							},
						},
						manaBar = {
							name = L["Mana Bar"],
							order = 2,
							type = "group",
							inline = false,
							args = {
								adjust = {
									order = 1,
									name = L["Modify Mana Bar"],
									desc = L["Toggle the adjustment of the Mana Bar"],
									type = "toggle",
									get = function()
										return statusbars.manaBar.adjust.isEnabled
									end,
									set = function(self,value)
										statusbars.manaBar.adjust.isEnabled = value
										CheckRestorationDefaultValues(res_options,"Mana")
									end,
								},
								textToggle = {
									order = 2,
									name = L["Mana Value Text"],
									desc = L["Toggles the text display of the amount of mana remaining"],
									type = "toggle",
									get = function()
										return statusbars.manaBar.text.isDisplayText
									end,
									set = function(self,value)
										statusbars.manaBar.text.isDisplayText = value
										CheckRestorationDefaultValues(res_options,"Mana")
									end,
								},
								general = {
									name = "|cFFFFFFFF"..L["Settings"].."|r",
									order = 3,
									type = "group",
									guiInline = true,
									args = {
										alphaCombat = {
											order = 1,
											type = "range",
											name = L["Alpha (In Combat)"],
											desc = L["Determines how opaque or transparent the bar will appear while in combat"],
											min = 0,
											max = 1,
											step = 0.1,
											bigStep = 0.1,
											--disabled = true,
											get = function() return statusbars.manaBar.alphaCombat end,
											set = function(self,value)
												statusbars.manaBar.alphaCombat = value
												CheckRestorationDefaultValues(res_options,"Mana")
											end,
										},
										alphaOoC = {
											order = 2,
											type = "range",
											name = L["Alpha (OoC - No Target)"],
											desc = L["Determines how opaque or transparent the bar will appear when out of combat"],
											min = 0,
											max = 1,
											step = 0.1,
											bigStep = 0.1,
											--disabled = false,
											get = function() return statusbars.manaBar.alphaOoC end,
											set = function(self,value)
												statusbars.manaBar.alphaOoC = value
												CheckRestorationDefaultValues(res_options,"Mana")
											end,
										},
										alphaTarget = {
											order = 3,
											type = "range",
											name = L["Alpha (OoC - Target)"],
											desc = L["Determines how opaque or transparent the bar will appear when out of combat and targetting an enemy"],
											min = 0,
											max = 1,
											step = 0.1,
											bigStep = 0.1,
											disabled = false,
											get = function() return statusbars.manaBar.alphaTar end,
											set = function(self,value)
												statusbars.manaBar.alphaTar = value
												CheckRestorationDefaultValues(res_options,"Mana")
											end,
										},
										ManaBarDigitGrouping = {
											order = 4,
											name = L["Digit Grouping"],
											desc = L["Add or remove separating commas"],
											type = "toggle",
											get = function()
												return statusbars.manaBar.grouping
											end,
											set = function(self,value)
												statusbars.manaBar.grouping = value
												CheckRestorationDefaultValues(res_options,'Mana')
												if (value) then
													res_options.args.config.args.manaBar.args.general.args.ManaBarPrecision.values = {
														--[[[tostring(ManaPrecision("Full"))] = "Full",
														[tostring(ManaPrecision("Thousand"))] = "Thousand",
														[tostring(ManaPrecision("Million"))] = "Million",]]
														["Long"] = tostring(Auras:ManaPrecision("Long")),
														["Short"] = tostring(Auras:ManaPrecision("Short")),
													}
												else
													res_options.args.config.args.manaBar.args.general.args.ManaBarPrecision.values = {
														--[[[tostring(ManaPrecision("Full"))] = "Full",
														[tostring(ManaPrecision("Thousand"))] = "Thousand",
														[tostring(ManaPrecision("Million"))] = "Million",]]
														["Long"] = tostring(Auras:ManaPrecision("Long")),
														["Short"] = tostring(Auras:ManaPrecision("Short")),
													}
												end
												
													
											end,
										},
										ManaBarPrecision = {
											order = 5,
											type = "select",
											name = L["Mana Precision"],
											desc = L["Set the aura orientation to horizontal or vertical."],
											get = function()
												res_options.args.config.args.manaBar.args.general.args.ManaBarPrecision.values = {
													["Long"] = tostring(Auras:ManaPrecision("Long")),
													["Short"] = tostring(Auras:ManaPrecision("Short")),
												}
												
												return statusbars.manaBar.precision
											end,
											set = function(self,value)
												statusbars.manaBar.precision = value
												CheckRestorationDefaultValues(res_options,"Mana")
												Auras:UpdateTalents()
											end,
											values = {
												["Long"] = tostring(Auras:ManaPrecision("Long")),
												["Short"] = tostring(Auras:ManaPrecision("Short")),
											}
										},
									},
								},
								text = {
									name = '|cFFFFFFFF'..L['Mana Value Text']..'|r',
									type = "group",
									order = 4,
									disabled = true,
									guiInline = true,
									args = {
										color = {
											type = "color",
											order = 1,
											name = L["Text Color"],
											desc = L["Set the color of the text."],
											hasAlpha = true,
											get = function(info)
												local color = statusbars.manaBar.text.font.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = statusbars.manaBar.text.font.color
												
												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckRestorationDefaultValues(res_options,"Mana")
											end,
										},
										filler_0 = {
											order = 2,
											type = "description",
											name = ' ',
										},
										timeFontName = {
											order = 3,
											type = "select",
											dialogControl = "LSM30_Font",
											name = L["Font"],
											desc = L["The font that will be used"],
											values = LSM:HashTable("font"),
											get = function()
												return statusbars.manaBar.text.font.name 
											end,
											set = function(self,value)
												statusbars.manaBar.text.font.name = value
												CheckRestorationDefaultValues(res_options,"Mana")
											end,
										},
										timeFontSize = {
											order = 4,
											type = "range",
											name = L["Font Size"],
											desc = L["Customize the font size of the cooldown text"],
											min = 5,
											max = 40,
											step = 1,
											bigStep = 1,
											get = function() return
												statusbars.manaBar.text.font.size
											end,
											set = function(self,value)
												statusbars.manaBar.text.font.size = value
												CheckRestorationDefaultValues(res_options,"Mana")
											end,
										},
										timeFontOutline = {
											order = 5,
											type = "select",
											name = L["Font Outline"],
											desc = L["The outline of the font"],
											get = function()
												return statusbars.manaBar.text.font.flag
											end,
											set = function(self,value)
												statusbars.manaBar.text.font.flag = value
												CheckRestorationDefaultValues(res_options,"Mana")
											end,
											values = {
												[""] = L["None"],
												["OUTLINE"] = L["Outline"],
												["THICKOUTLINE"] = L["Thick Outline"],
												["MONOCHROME"] = L["Monochrome"],
												["OUTLINE, MONOCHROME"] = L["Monochrome Outline"],
												["THICKOUTLINE, MONOCHROME"] = L["Monochrome Thick Outline"],
											},
										},
										timeTextAnchor = {
											order = 6,
											type = "select",
											name = L["Anchor Point"],
											desc = L["Set the anchor point."],
											get = function()
												return statusbars.manaBar.text.justify
											end,
											set = function(self,value)
												statusbars.manaBar.text.justify = value
												CheckRestorationDefaultValues(res_options,"Mana")
											end,
											values = {
												["TOPLEFT"] = L["TOPLEFT"],
												["TOP"] = L["TOP"],
												["TOPRIGHT"] = L["TOPRIGHT"],
												["LEFT"] = L["LEFT"],
												["CENTER"] = L["CENTER"],
												["RIGHT"] = L["RIGHT"],
												["BOTTOMLEFT"] = L["BOTTOMLEFT"],
												["BOTTOM"] = L["BOTTOM"],
												["BOTTOMRIGHT"] = L["BOTTOMRIGHT"],
											}
										},
										timeTextX = {
											order = 7,
											type = "range",
											name = "X",
											desc = L["Set location of text on the X axis"],
											min = -500,
											max = 500,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.manaBar.text.x end,
											set = function(self,value)
												statusbars.manaBar.text.x = value
												CheckRestorationDefaultValues(res_options,"Mana")
											end,
										},
										timeTextY = {
											order = 8,
											type = "range",
											name = "Y",
											desc = L["Set location of text on the Y axis"],
											min = -100,
											max = 100,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.manaBar.text.y end,
											set = function(self,value)
												statusbars.manaBar.text.y = value
												CheckRestorationDefaultValues(res_options,"Mana")
											end,
										},
										shadow = {
											name = '|cFFFFFFFF'..L['Text Shadow']..'|r',
											type = "group",
											order = 9,
											hidden = false,
											guiInline = true,
											args = {
												shadowToggle = {
													order = 1,
													name = L["Toggle"],
													desc = '',
													type = "toggle",
													get = function()
														return statusbars.manaBar.text.font.shadow.isEnabled
													end,
													set = function(self,value)
														statusbars.manaBar.text.font.shadow.isEnabled = value
														CheckRestorationDefaultValues(res_options,"Mana")
													end,
												},
												shadowColor = {
													type = "color",
													order = 2,
													name = L["Shadow Color"],
													desc = L["Set the color of the text's shadow."],
													hasAlpha = true,
													get = function(info)
														local color = statusbars.manaBar.text.font.shadow.color
														return color.r, color.g, color.b, color.a
													end,
													set = function(info, r, g, b, a)
														local color = statusbars.manaBar.text.font.shadow.color

														color.r = tonumber(string.format("%.2f",r))
														color.g = tonumber(string.format("%.2f",g))
														color.b = tonumber(string.format("%.2f",b))
														color.a = tonumber(string.format("%.2f",a))
														
														CheckRestorationDefaultValues(res_options,"Mana")
													end,
												},
												filler_0 = {
													order = 3,
													type = "description",
													name = ' ',
												},
												shadowX = {
													order = 4,
													type = "range",
													name = "X",
													desc = L["Set the text shadow's X offset"],
													min = -10,
													max = 10,
													step = 1,
													bigStep = 1,
													disabled = true,
													get = function() return statusbars.manaBar.text.font.shadow.offset.x end,
													set = function(self,value)
														statusbars.manaBar.text.font.shadow.offset.x = value
														CheckRestorationDefaultValues(res_options,"Mana")
													end,
												},
												shadowY = {
													order = 5,
													type = "range",
													name = "Y",
													desc = L["Set the text shadow's Y offset"],
													min = -10,
													max = 10,
													step = 1,
													bigStep = 1,
													disabled = true,
													get = function() return statusbars.manaBar.text.font.shadow.offset.y end,
													set = function(self,value)
														statusbars.manaBar.text.font.shadow.offset.y = value
														CheckRestorationDefaultValues(res_options,"Mana")
													end,
												},
											},
										},
									},
								},
								layout = {
									name = L["Layout & Design"],
									type = "group",
									order = 5,
									guiInline = true,
									args = {
										texture = {
											order = 1,
											type = "select",
											name = L["Bar Texture"],
											desc = L["Set the bar's texture."],
											dialogControl = "LSM30_Statusbar",
											get = function()
												return statusbars.manaBar.foreground.texture
											end,
											set = function(self,value)
												statusbars.manaBar.foreground.texture = value
												CheckRestorationDefaultValues(res_options,"Mana")
											end,
											values = LSM:HashTable(LSM.MediaType.STATUSBAR),
										},
										textureColor = {
											type = "color",
											order = 2,
											name = L["Bar Color"],
											get = function(info)
												local color = statusbars.manaBar.foreground.color
												return color.r, color.g, color.b
											end,
											set = function(info, r, g, b)
												local color = statusbars.manaBar.foreground.color

												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												CheckRestorationDefaultValues(res_options,"Mana")
											end,
										},
										filler_0 = {
											order = 3,
											type = "description",
											name = ' ',
										},
										backgroundTexture = {
											order = 4,
											type = "select",
											name = L["Background Texture"],
											desc = L["Set the bar's background texture."],
											dialogControl = "LSM30_Statusbar",
											get = function()
												return statusbars.manaBar.background.texture
											end,
											set = function(self,value)
												statusbars.manaBar.background.texture = value
												CheckRestorationDefaultValues(res_options,"Mana")
											end,
											values = LSM:HashTable(LSM.MediaType.STATUSBAR),
										},
										backgroundColor = {
											type = "color",
											order = 5,
											name = L["Background Color"],
											desc = L["Set the color of the cast bar's background."],
											hasAlpha = true,
											get = function(info)
												local color = statusbars.manaBar.background.color

												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = statusbars.manaBar.background.color

												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckRestorationDefaultValues(res_options,"Mana")
											end,
										},
										backgroundToggle = {
											order = 6,
											name = L["Modify Background"],
											desc = L["Toggle the adjustment of the bar's background texture"],
											type = "toggle",
											get = function()
												return statusbars.manaBar.adjust.showBG
											end,
											set = function(self,value)
												statusbars.manaBar.adjust.showBG = value
												CheckRestorationDefaultValues(res_options,"Mana")
											end,
										},
										width = {
											order = 7,
											type = "range",
											name = L["Width"],
											desc = '',
											min = 100,
											max = 500,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.manaBar.layout.width end,
											set = function(self,value)
												statusbars.manaBar.layout.width = value
												CheckRestorationDefaultValues(res_options,"Mana")
											end,
										},
										height = {
											order = 8,
											type = "range",
											name = L["Height"],
											desc = '',
											min = 10,
											max = 100,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.manaBar.layout.height end,
											set = function(self,value)
												statusbars.manaBar.layout.height = value
												CheckRestorationDefaultValues(res_options,"Mana")
											end,
										},
									},
								},
								reset = {
									order = 6,
									type = "execute",
									name = L["Reset Maelstrom Bar"],
									func = function()
										local bar = statusbars.manaBar
										local default = statusbarDefaults.manaBar
										
										bar.alphaCombat = default.alphaCombat
										bar.alphaOoC = default.alphaOoC
										bar.alphaTar = default.alphaTar
										
										bar.grouping = default.grouping
										bar.precision = default.precision
										
										bar.text.isDisplayText = true
										bar.text.x = default.text.x
										bar.text.y = default.text.y
										bar.text.font.name = default.text.font.name
										bar.text.font.size = default.text.font.size
										bar.text.font.flag = default.text.font.flag
										bar.text.font.color.r = default.text.font.color.r
										bar.text.font.color.g = default.text.font.color.g
										bar.text.font.color.b = default.text.font.color.b
										bar.text.font.color.a = default.text.font.color.a
										bar.text.font.shadow.isEnabled = false
										bar.text.font.shadow.offset.x = default.text.font.shadow.offset.x
										bar.text.font.shadow.offset.y = default.text.font.shadow.offset.y
										bar.text.font.shadow.color.r = default.text.font.shadow.color.r
										bar.text.font.shadow.color.g = default.text.font.shadow.color.g
										bar.text.font.shadow.color.b = default.text.font.shadow.color.b
										bar.text.font.shadow.color.a = default.text.font.shadow.color.a
										bar.text.justify = default.text.justify
										
										bar.background.texture = default.background.texture
										bar.background.color.r = default.background.color.r
										bar.background.color.g = default.background.color.g
										bar.background.color.b = default.background.color.b
										bar.background.color.a = default.background.color.a
										
										bar.foreground.color.r = default.foreground.color.r
										bar.foreground.color.g = default.foreground.color.g
										bar.foreground.color.b = default.foreground.color.b
										bar.foreground.texture = default.foreground.texture
										
										bar.layout.width = default.layout.width
										bar.layout.height = default.layout.height
										bar.layout.strata = default.layout.strata
										
										res_options.args.config.args.manaBar.args.reset.disabled = true
										res_options.args.config.args.manaBar.args.reset.name = "|cFF666666"..L["Reset Mana Bar"].."|r"
										CheckRestorationDefaultValues(res_options,"Mana")
										
										if (not bar.adjust.isEnabled) then
											Auras:InitializeProgressBar('ManaBar',nil,'manaBar','text',nil,3)
										end
									end,
								},
							},
						},
						castBar = {
							name = L["Cast Bar"],
							order = 3,
							inline = false,
							type = "group",
							args = {
								adjust = {
									order = 1,
									name = L["Modify Cast Bar"],
									desc = L["Toggle the adjustment of the Cast Bar"],
									type = "toggle",
									get = function()
										return statusbars.castBar.adjust.isEnabled
									end,
									set = function(self,value)
										statusbars.castBar.adjust.isEnabled = value
										CheckRestorationDefaultValues(res_options,'Cast','castBar')
									end,
								},
								nametextToggle = {
									order = 2,
									name = L["Toggle Spell Name Text"],
									desc = L["Toggles the text display of the spell casted"],
									type = "toggle",
									get = function()
										return statusbars.castBar.nametext.isDisplayText
									end,
									set = function(self,value)
										statusbars.castBar.nametext.isDisplayText = value
										CheckRestorationDefaultValues(res_options,'Cast','castBar')
									end,
								},
								timetextToggle = {
									order = 3,
									name = L["Toggle Time Text"],
									desc = L["Toggles the text display of the spell casted"],
									type = "toggle",
									get = function()
										return statusbars.castBar.timetext.isDisplayText
									end,
									set = function(self,value)
										statusbars.castBar.timetext.isDisplayText = value
										CheckRestorationDefaultValues(res_options,'Cast','castBar')
									end,
								},
								general = {
									name = "|cFFFFFFFF"..L["Settings"].."|r",
									order = 4,
									type = "group",
									guiInline = true,
									args = {
										alphaCombat = {
											order = 1,
											type = "range",
											name = L["Alpha (In Combat)"],
											desc = L["Determines how opaque or transparent the bar will appear while in combat"],
											min = 0,
											max = 1,
											step = 0.1,
											bigStep = 0.1,
											get = function() return statusbars.castBar.alphaCombat end,
											set = function(self,value)
												statusbars.castBar.alphaCombat = value
												CheckRestorationDefaultValues(res_options,'Cast','castBar')
											end,
										},
										alphaOoC = {
											order = 2,
											type = "range",
											name = L["Alpha (Out of Combat)"],
											desc = L["Determines how opaque or transparent the bar will appear when out of combat"],
											min = 0,
											max = 1,
											step = 0.1,
											bigStep = 0.1,
											get = function() return statusbars.castBar.alphaOoC end,
											set = function(self,value)
												statusbars.castBar.alphaOoC = value
												CheckRestorationDefaultValues(res_options,'Cast','castBar')
											end,
										},
									},
								},
								iconSpark = {
									name = '|cFFFFFFFF'..L['Icon & Spark']..'|r',
									type = "group",
									order = 5,
									disabled = true,
									guiInline = true,
									args = {
										sparkToggle = {
											order = 1,
											name = L["Toggle Spark"],
											desc = '',
											type = "toggle",
											get = function()
												return statusbars.castBar.spark
											end,
											set = function(self,value)
												statusbars.castBar.spark = value
												CheckRestorationDefaultValues(res_options,'Cast','castBar')
											end,
										},
										iconToggle = {
											order = 2,
											name = L["Toggle Icon"],
											desc = '',
											type = "toggle",
											get = function()
												return statusbars.castBar.icon.isEnabled
											end,
											set = function(self,value)
												local option = res_options.args.config.args.castBar.args.iconSpark.args.iconJustify.disabled
												if (value) then
													option = false
												else
													option = true
												end
												statusbars.castBar.icon.isEnabled = value
												CheckRestorationDefaultValues(res_options,'Cast','castBar')
											end,
										},
										iconJustify = {
											order = 3,
											type = "select",
											name = L["Icon Justify"],
											desc = L["Set the side of the progress bar that the icon will appear."],
											get = function()
												return statusbars.castBar.icon.justify
											end,
											set = function(self,value)
												statusbars.castBar.icon.justify = value
												CheckRestorationDefaultValues(res_options,'Cast','castBar')
											end,
											values = {
												["LEFT"] = L["Left"],
												["RIGHT"] = L["Right"],
											},
										},
									},
								},
								nametext = {
									name = '|cFFFFFFFF'..L['Spell Name Text']..'|r',
									type = "group",
									order = 6,
									disabled = true,
									guiInline = true,
									args = {
										color = {
											type = "color",
											order = 1,
											name = L["Text Color"],
											desc = L["Set the color of the text."],
											hasAlpha = true,
											get = function(info)
												local color = statusbars.castBar.nametext.font.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = statusbars.castBar.nametext.font.color
												
												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckRestorationDefaultValues(res_options,'Cast','castBar')
											end,
										},
										filler_0 = {
											order = 2,
											type = "description",
											name = ' ',
										},
										fontName = {
											order = 3,
											type = "select",
											dialogControl = "LSM30_Font",
											name = L["Font"],
											desc = L["The font that will be used"],
											values = LSM:HashTable("font"),
											get = function() return statusbars.castBar.nametext.font.name end,
											set = function(self,value)
												statusbars.castBar.nametext.font.name = value
												CheckRestorationDefaultValues(res_options,'Cast','castBar')
											end,
										},
										fontSize = {
											order = 4,
											type = "range",
											name = L["Font Size"],
											desc = L["Customize the font size of the cooldown text"],
											min = 5,
											max = 40,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.castBar.nametext.font.size end,
											set = function(self,value)
												statusbars.castBar.nametext.font.size = value
												CheckRestorationDefaultValues(res_options,'Cast','castBar')
											end,
										},
										fontOutline = {
											order = 5,
											type = "select",
											name = L["Font Outline"],
											desc = L["The outline of the font"],
											get = function()
												return statusbars.castBar.nametext.font.flag
											end,
											set = function(self,value)
												statusbars.castBar.nametext.font.flag = value
												CheckRestorationDefaultValues(res_options,'Cast','castBar')
											end,
											values = {
												[""] = L["None"],
												["OUTLINE"] = L["Outline"],
												["THICKOUTLINE"] = L["Thick Outline"],
												["MONOCHROME"] = L["Monochrome"],
												["OUTLINE, MONOCHROME"] = L["Monochrome Outline"],
												["THICKOUTLINE, MONOCHROME"] = L["Monochrome Thick Outline"],
											},
										},
										nametextAnchor = {
											order = 6,
											type = "select",
											name = L["Anchor Point"],
											desc = L["Set the anchor point."],
											get = function()
												return statusbars.castBar.nametext.justify
											end,
											set = function(self,value)
												statusbars.castBar.nametext.justify = value
												CheckRestorationDefaultValues(res_options,'Cast','castBar')
											end,
											values = {
												["TOPLEFT"] = L["TOPLEFT"],
												["TOP"] = L["TOP"],
												["TOPRIGHT"] = L["TOPRIGHT"],
												["LEFT"] = L["LEFT"],
												["CENTER"] = L["CENTER"],
												["RIGHT"] = L["RIGHT"],
												["BOTTOMLEFT"] = L["BOTTOMLEFT"],
												["BOTTOM"] = L["BOTTOM"],
												["BOTTOMRIGHT"] = L["BOTTOMRIGHT"],
											}
										},
										nametextX = {
											order = 7,
											type = "range",
											name = "X",
											desc = L["Set location of text on the X axis"],
											min = -500,
											max = 500,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.castBar.nametext.x end,
											set = function(self,value)
												statusbars.castBar.nametext.x = value
												CheckRestorationDefaultValues(res_options,'Cast','castBar')
											end,
										},
										nametextY = {
											order = 8,
											type = "range",
											name = "Y",
											desc = L["Set location of text on the Y axis"],
											min = -100,
											max = 100,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.castBar.nametext.y end,
											set = function(self,value)
												statusbars.castBar.nametext.y = value
												CheckRestorationDefaultValues(res_options,'Cast','castBar')
											end,
										},
										shadow = {
											name = '|cFFFFFFFF'..L['Text Shadow']..'|r',
											type = "group",
											order = 9,
											hidden = false,
											guiInline = true,
											args = {
												shadowToggle = {
													order = 1,
													name = L["Toggle"],
													desc = '',
													type = "toggle",
													get = function()
														return statusbars.castBar.nametext.font.shadow.isEnabled
													end,
													set = function(self,value)
														statusbars.castBar.nametext.font.shadow.isEnabled = value
														CheckRestorationDefaultValues(res_options,'Cast','castBar')
													end,
												},
												shadowColor = {
													type = "color",
													order = 2,
													name = L["Shadow Color"],
													desc = L["Set the color of the text's shadow."],
													hasAlpha = true,
													get = function(info)
														local color = statusbars.castBar.nametext.font.shadow.color
														return color.r, color.g, color.b, color.a
													end,
													set = function(info, r, g, b, a)
														local color = statusbars.castBar.nametext.font.shadow.color

														color.r = tonumber(string.format("%.2f",r))
														color.g = tonumber(string.format("%.2f",g))
														color.b = tonumber(string.format("%.2f",b))
														color.a = tonumber(string.format("%.2f",a))
														CheckRestorationDefaultValues(res_options,'Cast','castBar')
													end,
												},
												filler_0 = {
													order = 3,
													type = "description",
													name = ' ',
												},
												shadowX = {
													order = 4,
													type = "range",
													name = "X",
													desc = L["Set the text shadow's X offset"],
													min = -10,
													max = 10,
													step = 1,
													bigStep = 1,
													get = function() return statusbars.castBar.nametext.font.shadow.offset.x end,
													set = function(self,value)
														statusbars.castBar.nametext.font.shadow.offset.x = value
														CheckRestorationDefaultValues(res_options,'Cast','castBar')
													end,
												},
												shadowY = {
													order = 5,
													type = "range",
													name = "Y",
													desc = L["Set the text shadow's Y offset"],
													min = -10,
													max = 10,
													step = 1,
													bigStep = 1,
													get = function() return statusbars.castBar.nametext.font.shadow.offset.y end,
													set = function(self,value)
														statusbars.castBar.nametext.font.shadow.offset.y = value
														CheckRestorationDefaultValues(res_options,'Cast','castBar')
													end,
												},
											},
										},
									},
								},
								timetext = {
									name = '|cFFFFFFFFTimer Text|r',
									type = "group",
									order = 7,
									disabled = true,
									guiInline = true,
									args = {
										color = {
											type = "color",
											order = 1,
											name = L["Text Color"],
											desc = L["Set the color of the text."],
											hasAlpha = true,
											get = function(info)
												local color = statusbars.castBar.timetext.font.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = statusbars.castBar.timetext.font.color
												
												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckRestorationDefaultValues(res_options,'Cast','castBar')
											end,
										},
										filler_0 = {
											order = 2,
											type = "description",
											name = ' ',
										},
										timeFontName = {
											order = 3,
											type = "select",
											dialogControl = "LSM30_Font",
											name = L["Font"],
											desc = L["The font that will be used"],
											values = LSM:HashTable("font"),
											get = function() return statusbars.castBar.timetext.font.name end,
											set = function(self,value)
												statusbars.castBar.timetext.font.name = value
												CheckRestorationDefaultValues(res_options,'Cast','castBar')
											end,
										},
										timeFontSize = {
											order = 4,
											type = "range",
											name = L["Font Size"],
											desc = L["Customize the font size of the cooldown text"],
											min = 5,
											max = 40,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.castBar.timetext.font.size end,
											set = function(self,value)
												statusbars.castBar.timetext.font.size = value
												CheckRestorationDefaultValues(res_options,'Cast','castBar')
											end,
										},
										timeFontOutline = {
											order = 5,
											type = "select",
											name = L["Font Outline"],
											desc = L["The outline of the font"],
											get = function()
												return statusbars.castBar.timetext.font.flag
											end,
											set = function(self,value)
												statusbars.castBar.timetext.font.flag = value
												CheckRestorationDefaultValues(res_options,'Cast','castBar')
											end,
											values = {
												[""] = L["None"],
												["OUTLINE"] = L["Outline"],
												["THICKOUTLINE"] = L["Thick Outline"],
												["MONOCHROME"] = L["Monochrome"],
												["OUTLINE, MONOCHROME"] = L["Monochrome Outline"],
												["THICKOUTLINE, MONOCHROME"] = L["Monochrome Thick Outline"],
											},
										},
										timeTextAnchor = {
											order = 6,
											type = "select",
											name = L["Anchor Point"],
											desc = L["Set the anchor point."],
											get = function()
												return statusbars.castBar.timetext.justify
											end,
											set = function(self,value)
												statusbars.castBar.timetext.justify = value
												CheckRestorationDefaultValues(res_options,'Cast','castBar')
											end,
											values = {
												["TOPLEFT"] = L["TOPLEFT"],
												["TOP"] = L["TOP"],
												["TOPRIGHT"] = L["TOPRIGHT"],
												["LEFT"] = L["LEFT"],
												["CENTER"] = L["CENTER"],
												["RIGHT"] = L["RIGHT"],
												["BOTTOMLEFT"] = L["BOTTOMLEFT"],
												["BOTTOM"] = L["BOTTOM"],
												["BOTTOMRIGHT"] = L["BOTTOMRIGHT"],
											}
										},
										timeTextX = {
											order = 7,
											type = "range",
											name = "X",
											desc = L["Set location of text on the X axis"],
											min = -500,
											max = 500,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.castBar.timetext.x end,
											set = function(self,value)
												statusbars.castBar.timetext.x = value
												CheckRestorationDefaultValues(res_options,'Cast','castBar')
											end,
										},
										timeTextY = {
											order = 8,
											type = "range",
											name = "Y",
											desc = L["Set location of text on the Y axis"],
											min = -100,
											max = 100,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.castBar.timetext.y end,
											set = function(self,value)
												statusbars.castBar.timetext.y = value
												CheckRestorationDefaultValues(res_options,'Cast','castBar')
											end,
										},
										shadow = {
											name = '|cFFFFFFFF'..L['Text Shadow']..'|r',
											type = "group",
											order = 9,
											hidden = false,
											guiInline = true,
											args = {
												shadowToggle = {
													order = 1,
													name = L["Toggle"],
													desc = '',
													type = "toggle",
													get = function()
														return statusbars.castBar.timetext.font.shadow.isEnabled
													end,
													set = function(self,value)
														statusbars.castBar.timetext.font.shadow.isEnabled = value
														CheckRestorationDefaultValues(res_options,'Cast','castBar')
													end,
												},
												shadowColor = {
													type = "color",
													order = 2,
													name = L["Shadow Color"],
													desc = L["Set the color of the text's shadow."],
													hasAlpha = true,
													disabled = true,
													get = function(info)
														local color = statusbars.castBar.timetext.font.shadow.color
														return color.r, color.g, color.b, color.a
													end,
													set = function(info, r, g, b, a)
														local color = statusbars.castBar.timetext.font.shadow.color
														
														color.r = tonumber(string.format("%.2f",r))
														color.g = tonumber(string.format("%.2f",g))
														color.b = tonumber(string.format("%.2f",b))
														color.a = tonumber(string.format("%.2f",a))
														CheckRestorationDefaultValues(res_options,'Cast','castBar')
													end,
												},
												filler_0 = {
													order = 3,
													type = "description",
													name = ' ',
												},
												shadowX = {
													order = 4,
													type = "range",
													name = "X",
													desc = L["Set the text shadow's X offset"],
													min = -10,
													max = 10,
													step = 1,
													bigStep = 1,
													disabled = true,
													get = function() return statusbars.castBar.timetext.font.shadow.offset.x end,
													set = function(self,value)
														statusbars.castBar.timetext.font.shadow.offset.x = value
														CheckRestorationDefaultValues(res_options,'Cast','castBar')
													end,
												},
												shadowY = {
													order = 5,
													type = "range",
													name = "Y",
													desc = L["Set the text shadow's Y offset"],
													min = -10,
													max = 10,
													step = 1,
													bigStep = 1,
													disabled = true,
													get = function() return statusbars.castBar.timetext.font.shadow.offset.y end,
													set = function(self,value)
														statusbars.castBar.timetext.font.shadow.offset.y = value
														CheckRestorationDefaultValues(res_options,'Cast','castBar')
													end,
												},
											},
										},
									},
								},
								layout = {
									name = L["Layout & Design"],
									type = "group",
									order = 8,
									guiInline = true,
									args = {
										texture = {
											order = 1,
											type = "select",
											name = L["Bar Texture"],
											desc = L["Set the bar's texture."],
											dialogControl = "LSM30_Statusbar",
											get = function()
												return statusbars.castBar.foreground.texture
											end,
											set = function(self,value)
												statusbars.castBar.foreground.texture = value
												CheckRestorationDefaultValues(res_options,'Cast','castBar')
											end,
											values = LSM:HashTable(LSM.MediaType.STATUSBAR),
										},
										textureColor = {
											type = "color",
											order = 2,
											name = L["Bar Color"],
											get = function(info)
												local color = statusbars.castBar.foreground.color
												return color.r, color.g, color.b
											end,
											set = function(info, r, g, b)
												local color = statusbars.castBar.foreground.color

												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))

												CheckRestorationDefaultValues(res_options,'Cast','castBar')
											end,
										},
										filler_0 = {
											order = 3,
											type = "description",
											name = ' ',
										},
										backgroundTexture = {
											order = 4,
											type = "select",
											name = L["Background Texture"],
											desc = L["Set the bar's background texture."],
											dialogControl = "LSM30_Statusbar",
											get = function()
												return statusbars.castBar.background.texture
											end,
											set = function(self,value)
												statusbars.castBar.background.texture = value
												CheckRestorationDefaultValues(res_options,"Cast",'castBar')
											end,
											values = LSM:HashTable(LSM.MediaType.STATUSBAR),
										},
										backgroundColor = {
											type = "color",
											order = 5,
											name = L["Background Color"],
											desc = L["Set the color of the cast bar's background."],
											hasAlpha = true,
											get = function(info)
												local color = statusbars.castBar.background.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = statusbars.castBar.background.color
												
												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckRestorationDefaultValues(res_options,'Cast','castBar')
											end,
										},
										backgroundToggle = {
											order = 6,
											name = L["Modify Background"],
											desc = L["Toggle the adjustment of the bar's background texture"],
											type = "toggle",
											get = function()
												return statusbars.castBar.adjust.showBG
											end,
											set = function(self,value)
												statusbars.castBar.adjust.showBG = value
												CheckRestorationDefaultValues(res_options,'Cast','castBar')
											end,
										},
										width = {
											order = 7,
											type = "range",
											name = L["Width"],
											desc = '',
											min = 100,
											max = 500,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.castBar.layout.width end,
											set = function(self,value)
												statusbars.castBar.layout.width = value
												CheckRestorationDefaultValues(res_options,'Cast','castBar')
											end,
										},
										height = {
											order = 8,
											type = "range",
											name = L["Height"],
											desc = '',
											min = 10,
											max = 100,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.castBar.layout.height end,
											set = function(self,value)
												statusbars.castBar.layout.height = value
												CheckRestorationDefaultValues(res_options,'Cast','castBar')
											end,
										},
									},
								},
								reset = {
									order = 9,
									type = "execute",
									name = L["Reset Cast Bar"],
									func = function()
										local bar = statusbars.castBar
										local default = statusbarDefaults.castBar
										
										bar.alphaCombat = default.alphaCombat
										bar.alphaOoC = default.alphaOoC
										
										bar.nametext.isDisplayText = true
										bar.nametext.x = default.nametext.x
										bar.nametext.y = default.nametext.y
										bar.nametext.font.name = default.nametext.font.name
										bar.nametext.font.size = default.nametext.font.size
										bar.nametext.font.flag = default.nametext.font.flag
										bar.nametext.font.color.r = default.nametext.font.color.r
										bar.nametext.font.color.g = default.nametext.font.color.g
										bar.nametext.font.color.b = default.nametext.font.color.b
										bar.nametext.font.color.a = default.nametext.font.color.a
										bar.nametext.font.shadow.isEnabled = false
										bar.nametext.font.shadow.offset.x = default.nametext.font.shadow.offset.x
										bar.nametext.font.shadow.offset.y = default.nametext.font.shadow.offset.y
										bar.nametext.font.shadow.color.r = default.nametext.font.shadow.color.r
										bar.nametext.font.shadow.color.g = default.nametext.font.shadow.color.g
										bar.nametext.font.shadow.color.b = default.nametext.font.shadow.color.b
										bar.nametext.font.shadow.color.a = default.nametext.font.shadow.color.a
										bar.nametext.justify = default.nametext.justify
										
										bar.timetext.isDisplayText = true
										bar.timetext.x = default.timetext.x
										bar.timetext.y = default.timetext.y
										bar.timetext.font.name = default.timetext.font.name
										bar.timetext.font.size = default.timetext.font.size
										bar.timetext.font.flag = default.timetext.font.flag
										bar.timetext.font.color.r = default.timetext.font.color.r
										bar.timetext.font.color.g = default.timetext.font.color.g
										bar.timetext.font.color.b = default.timetext.font.color.b
										bar.timetext.font.color.a = default.timetext.font.color.a
										bar.timetext.font.shadow.isEnabled = false
										bar.timetext.font.shadow.offset.x = default.timetext.font.shadow.offset.x
										bar.timetext.font.shadow.offset.y = default.timetext.font.shadow.offset.y
										bar.timetext.font.shadow.color.r = default.timetext.font.shadow.color.r
										bar.timetext.font.shadow.color.g = default.timetext.font.shadow.color.g
										bar.timetext.font.shadow.color.b = default.timetext.font.shadow.color.b
										bar.timetext.font.shadow.color.a = default.timetext.font.shadow.color.a
										bar.timetext.justify = default.timetext.justify
										
										bar.icon.isEnabled = true
										bar.icon.justify = default.icon.justify
										bar.spark = true
										
										bar.background.texture = default.background.texture
										bar.background.color.r = default.background.color.r
										bar.background.color.g = default.background.color.g
										bar.background.color.b = default.background.color.b
										bar.background.color.a = default.background.color.a
										
										bar.foreground.color.r = default.foreground.color.r
										bar.foreground.color.g = default.foreground.color.g
										bar.foreground.color.b = default.foreground.color.b
										bar.foreground.texture = default.foreground.texture
										
										bar.layout.width = default.layout.width
										bar.layout.height = default.layout.height
										bar.layout.strata = default.layout.strata
										res_options.args.config.args.castBar.args.reset.disabled = true
										res_options.args.config.args.castBar.args.reset.name = "|cFF666666"..L["Reset Cast Bar"].."|r"
										CheckRestorationDefaultValues(res_options,'Cast','castBar')
										
										if (not bar.adjust.isEnabled) then
											Auras:InitializeProgressBar('CastBarRes',nil,'castBar','nametext','timetext',3)
										end
									end,
								},
							},
						},
						channelBar = {
							name = L["Channel Bar"],
							order = 4,
							inline = false,
							type = "group",
							args = {
								adjust = {
									order = 1,
									name = L["Modify Channel Bar"],
									desc = L["Toggle the adjustment of the Channel Bar"],
									type = "toggle",
									get = function()
										return statusbars.channelBar.adjust.isEnabled
									end,
									set = function(self,value)
										statusbars.channelBar.adjust.isEnabled = value
										CheckRestorationDefaultValues(res_options,'Channel','channelBar')
									end,
								},
								nametextToggle = {
									order = 2,
									name = L["Toggle Spell Name Text"],
									desc = L["Toggles the text display of the spell casted"],
									type = "toggle",
									get = function()
										return statusbars.channelBar.nametext.isDisplayText
									end,
									set = function(self,value)
										statusbars.channelBar.nametext.isDisplayText = value
										CheckRestorationDefaultValues(res_options,'Channel','channelBar')
									end,
								},
								timetextToggle = {
									order = 3,
									name = L["Toggle Time Text"],
									desc = L["Toggles the text display of the spell casted"],
									type = "toggle",
									get = function()
										return statusbars.channelBar.timetext.isDisplayText
									end,
									set = function(self,value)										
										statusbars.channelBar.timetext.isDisplayText = value
										CheckRestorationDefaultValues(res_options,'Channel','channelBar')
									end,
								},
								general = {
									name = "|cFFFFFFFF"..L["Settings"].."|r",
									order = 4,
									type = "group",
									guiInline = true,
									args = {
										alphaCombat = {
											order = 1,
											type = "range",
											name = L["Alpha (In Combat)"],
											desc = L["Determines how opaque or transparent the bar will appear while in combat"],
											min = 0,
											max = 1,
											step = 0.1,
											bigStep = 0.1,
											get = function() return statusbars.channelBar.alphaCombat end,
											set = function(self,value)
												statusbars.channelBar.alphaCombat = value
												CheckRestorationDefaultValues(res_options,'Channel','channelBar')
											end,
										},
										alphaOoC = {
											order = 2,
											type = "range",
											name = L["Alpha (Out of Combat)"],
											desc = L["Determines how opaque or transparent the bar will appear when out of combat"],
											min = 0,
											max = 1,
											step = 0.1,
											bigStep = 0.1,
											get = function() return statusbars.channelBar.alphaOoC end,
											set = function(self,value)
												statusbars.channelBar.alphaOoC = value
												CheckRestorationDefaultValues(res_options,'Channel','channelBar')
											end,
										},
									},
								},
								iconSpark = {
									name = '|cFFFFFFFF'..L['Icon & Spark']..'|r',
									type = "group",
									order = 5,
									disabled = true,
									guiInline = true,
									args = {
										sparkToggle = {
											order = 1,
											name = L["Toggle Spark"],
											desc = '',
											type = "toggle",
											get = function()
												return statusbars.channelBar.spark
											end,
											set = function(self,value)
												statusbars.channelBar.spark = value
												CheckRestorationDefaultValues(res_options,'Channel','channelBar')
											end,
										},
										iconToggle = {
											order = 2,
											name = L["Toggle Icon"],
											desc = '',
											type = "toggle",
											get = function()
												return statusbars.channelBar.icon.isEnabled
											end,
											set = function(self,value)
												statusbars.channelBar.icon.isEnabled = value
												CheckRestorationDefaultValues(res_options,'Channel','channelBar')
											end,
										},
										iconJustify = {
											order = 3,
											type = "select",
											name = L["Icon Justify"],
											desc = L["Set the side of the progress bar that the icon will appear."],
											get = function()
												return statusbars.channelBar.icon.justify
											end,
											set = function(self,value)
												statusbars.channelBar.icon.justify = value
												CheckRestorationDefaultValues(res_options,'Channel','channelBar')
											end,
											values = {
												["LEFT"] = L["Left"],
												["RIGHT"] = L["Right"],
											},
										},
									},
								},
								nametext = {
									name = '|cFFFFFFFF'..L['Spell Name Text']..'|r',
									type = "group",
									order = 6,
									disabled = true,
									guiInline = true,
									args = {
										color = {
											type = "color",
											order = 1,
											name = L["Text Color"],
											desc = L["Set the color of the text."],
											hasAlpha = true,
											get = function(info)
												local color = statusbars.channelBar.nametext.font.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = statusbars.channelBar.nametext.font.color
												
												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckRestorationDefaultValues(res_options,'Channel','channelBar')
											end,
										},
										filler_0 = {
											order = 2,
											type = "description",
											name = ' ',
										},
										fontName = {
											order = 3,
											type = "select",
											dialogControl = "LSM30_Font",
											name = L["Font"],
											desc = L["The font that will be used"],
											values = LSM:HashTable("font"),
											get = function() return statusbars.channelBar.nametext.font.name end,
											set = function(self,value)
												statusbars.channelBar.nametext.font.name = value
												CheckRestorationDefaultValues(res_options,'Channel','channelBar')
											end,
										},
										fontSize = {
											order = 4,
											type = "range",
											name = L["Font Size"],
											desc = L["Customize the font size of the cooldown text"],
											min = 5,
											max = 40,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.channelBar.nametext.font.size end,
											set = function(self,value)
												statusbars.channelBar.nametext.font.size = value
												CheckRestorationDefaultValues(res_options,'Channel','channelBar')
											end,
										},
										fontOutline = {
											order = 5,
											type = "select",
											name = L["Font Outline"],
											desc = L["The outline of the font"],
											get = function()
												return statusbars.channelBar.nametext.font.flag
											end,
											set = function(self,value)
												statusbars.channelBar.nametext.font.flag = value
												CheckRestorationDefaultValues(res_options,'Channel','channelBar')
											end,
											values = {
												[""] = L["None"],
												["OUTLINE"] = L["Outline"],
												["THICKOUTLINE"] = L["Thick Outline"],
												["MONOCHROME"] = L["Monochrome"],
												["OUTLINE, MONOCHROME"] = L["Monochrome Outline"],
												["THICKOUTLINE, MONOCHROME"] = L["Monochrome Thick Outline"],
											},
										},
										nametextAnchor = {
											order = 6,
											type = "select",
											name = L["Anchor Point"],
											desc = L["Set the anchor point."],
											get = function()
												return statusbars.channelBar.nametext.justify
											end,
											set = function(self,value)
												statusbars.channelBar.nametext.justify = value
												CheckRestorationDefaultValues(res_options,'Channel','channelBar')
											end,
											values = {
												["TOPLEFT"] = L["TOPLEFT"],
												["TOP"] = L["TOP"],
												["TOPRIGHT"] = L["TOPRIGHT"],
												["LEFT"] = L["LEFT"],
												["CENTER"] = L["CENTER"],
												["RIGHT"] = L["RIGHT"],
												["BOTTOMLEFT"] = L["BOTTOMLEFT"],
												["BOTTOM"] = L["BOTTOM"],
												["BOTTOMRIGHT"] = L["BOTTOMRIGHT"],
											}
										},
										nametextX = {
											order = 7,
											type = "range",
											name = "X",
											desc = L["Set location of text on the X axis"],
											min = -500,
											max = 500,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.channelBar.nametext.x end,
											set = function(self,value)
												statusbars.channelBar.nametext.x = value
												CheckRestorationDefaultValues(res_options,'Channel','channelBar')
											end,
										},
										nametextY = {
											order = 8,
											type = "range",
											name = "Y",
											desc = L["Set location of text on the Y axis"],
											min = -100,
											max = 100,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.channelBar.nametext.y end,
											set = function(self,value)
												statusbars.channelBar.nametext.y = value
												CheckRestorationDefaultValues(res_options,'Channel','channelBar')
											end,
										},
										shadow = {
											name = '|cFFFFFFFF'..L['Text Shadow']..'|r',
											type = "group",
											order = 9,
											hidden = false,
											guiInline = true,
											args = {
												shadowToggle = {
													order = 1,
													name = L["Toggle"],
													desc = '',
													type = "toggle",
													get = function()
														return statusbars.channelBar.nametext.font.shadow.isEnabled
													end,
													set = function(self,value)
														statusbars.channelBar.nametext.font.shadow.isEnabled = value
														CheckRestorationDefaultValues(res_options,'Channel','channelBar')
													end,
												},
												shadowColor = {
													type = "color",
													order = 2,
													name = L["Shadow Color"],
													desc = L["Set the color of the text's shadow."],
													hasAlpha = true,
													disabled = true,
													get = function(info)
														local color = statusbars.channelBar.nametext.font.shadow.color
														return color.r, color.g, color.b, color.a
													end,
													set = function(info, r, g, b, a)
														local color = statusbars.channelBar.nametext.font.shadow.color
														
														color.r = tonumber(string.format("%.2f",r))
														color.g = tonumber(string.format("%.2f",g))
														color.b = tonumber(string.format("%.2f",b))
														color.a = tonumber(string.format("%.2f",a))
														CheckRestorationDefaultValues(res_options,'Channel','channelBar')
													end,
												},
												filler_0 = {
													order = 3,
													type = "description",
													name = ' ',
												},
												shadowX = {
													order = 4,
													type = "range",
													name = "X",
													desc = L["Set the text shadow's X offset"],
													min = -10,
													max = 10,
													step = 1,
													bigStep = 1,
													disabled = true,
													get = function() return statusbars.channelBar.nametext.font.shadow.offset.x end,
													set = function(self,value)
														statusbars.channelBar.nametext.font.shadow.offset.x = value
														CheckRestorationDefaultValues(res_options,'Channel','channelBar')
													end,
												},
												shadowY = {
													order = 5,
													type = "range",
													name = "Y",
													desc = L["Set the text shadow's Y offset"],
													min = -10,
													max = 10,
													step = 1,
													bigStep = 1,
													disabled = true,
													get = function() return statusbars.channelBar.nametext.font.shadow.offset.y end,
													set = function(self,value)
														statusbars.channelBar.nametext.font.shadow.offset.y = value
														CheckRestorationDefaultValues(res_options,'Channel','channelBar')
													end,
												},
											},
										},
									},
								},
								timetext = {
									name = '|cFFFFFFFFTimer Text|r',
									type = "group",
									order = 7,
									disabled = true,
									guiInline = true,
									args = {
										color = {
											type = "color",
											order = 1,
											name = L["Text Color"],
											desc = L["Set the color of the text."],
											hasAlpha = true,
											get = function(info)
												local color = statusbars.channelBar.timetext.font.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = statusbars.channelBar.timetext.font.color
												
												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckRestorationDefaultValues(res_options,'Channel','channelBar')
											end,
										},
										filler_0 = {
											order = 2,
											type = "description",
											name = ' ',
										},
										timeFontName = {
											order = 3,
											type = "select",
											dialogControl = "LSM30_Font",
											name = L["Font"],
											desc = L["The font that will be used"],
											values = LSM:HashTable("font"),
											get = function() return statusbars.channelBar.timetext.font.name end,
											set = function(self,value)
												statusbars.channelBar.timetext.font.name = value
												CheckRestorationDefaultValues(res_options,'Channel','channelBar')
											end,
										},
										timeFontSize = {
											order = 4,
											type = "range",
											name = L["Font Size"],
											desc = L["Customize the font size of the cooldown text"],
											min = 5,
											max = 40,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.channelBar.timetext.font.size end,
											set = function(self,value)
												statusbars.channelBar.timetext.font.size = value
												CheckRestorationDefaultValues(res_options,'Channel','channelBar')
											end,
										},
										timeFontOutline = {
											order = 5,
											type = "select",
											name = L["Font Outline"],
											desc = L["The outline of the font"],
											get = function()
												return statusbars.channelBar.timetext.font.flag
											end,
											set = function(self,value)
												statusbars.channelBar.timetext.font.flag = value
												CheckRestorationDefaultValues(res_options,'Channel','channelBar')
											end,
											values = {
												[""] = L["None"],
												["OUTLINE"] = L["Outline"],
												["THICKOUTLINE"] = L["Thick Outline"],
												["MONOCHROME"] = L["Monochrome"],
												["OUTLINE, MONOCHROME"] = L["Monochrome Outline"],
												["THICKOUTLINE, MONOCHROME"] = L["Monochrome Thick Outline"],
											},
										},
										timeTextAnchor = {
											order = 6,
											type = "select",
											name = L["Anchor Point"],
											desc = L["Set the anchor point."],
											get = function()
												return statusbars.channelBar.timetext.justify
											end,
											set = function(self,value)
												statusbars.channelBar.timetext.justify = value
												CheckRestorationDefaultValues(res_options,'Channel','channelBar')
											end,
											values = {
												["TOPLEFT"] = L["TOPLEFT"],
												["TOP"] = L["TOP"],
												["TOPRIGHT"] = L["TOPRIGHT"],
												["LEFT"] = L["LEFT"],
												["CENTER"] = L["CENTER"],
												["RIGHT"] = L["RIGHT"],
												["BOTTOMLEFT"] = L["BOTTOMLEFT"],
												["BOTTOM"] = L["BOTTOM"],
												["BOTTOMRIGHT"] = L["BOTTOMRIGHT"],
											}
										},
										timeTextX = {
											order = 7,
											type = "range",
											name = "X",
											desc = L["Set location of text on the X axis"],
											min = -500,
											max = 500,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.channelBar.timetext.x end,
											set = function(self,value)
												statusbars.channelBar.timetext.x = value
												CheckRestorationDefaultValues(res_options,'Channel','channelBar')
											end,
										},
										timeTextY = {
											order = 8,
											type = "range",
											name = "Y",
											desc = L["Set location of text on the Y axis"],
											min = -100,
											max = 100,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.channelBar.timetext.y end,
											set = function(self,value)
												statusbars.channelBar.timetext.y = value
												CheckRestorationDefaultValues(res_options,'Channel','channelBar')
											end,
										},
										shadow = {
											name = '|cFFFFFFFF'..L['Text Shadow']..'|r',
											type = "group",
											order = 9,
											hidden = false,
											guiInline = true,
											args = {
												shadowToggle = {
													order = 1,
													name = L["Toggle"],
													desc = '',
													type = "toggle",
													get = function()
														return statusbars.channelBar.timetext.font.shadow.isEnabled
													end,
													set = function(self,value)
														statusbars.channelBar.timetext.font.shadow.isEnabled = value
														CheckRestorationDefaultValues(res_options,'Channel','channelBar')
													end,
												},
												shadowColor = {
													type = "color",
													order = 2,
													name = L["Shadow Color"],
													desc = L["Set the color of the text's shadow."],
													hasAlpha = true,
													disabled = true,
													get = function(info)
														local color = statusbars.channelBar.timetext.font.shadow.color
														return color.r, color.g, color.b, color.a
													end,
													set = function(info, r, g, b, a)
														local color = statusbars.channelBar.timetext.font.shadow.color
														
														color.r = tonumber(string.format("%.2f",r))
														color.g = tonumber(string.format("%.2f",g))
														color.b = tonumber(string.format("%.2f",b))
														color.a = tonumber(string.format("%.2f",a))
														CheckRestorationDefaultValues(res_options,'Channel','channelBar')
													end,
												},
												filler_0 = {
													order = 3,
													type = "description",
													name = ' ',
												},
												shadowX = {
													order = 4,
													type = "range",
													name = "X",
													desc = L["Set the text shadow's X offset"],
													min = -10,
													max = 10,
													step = 1,
													bigStep = 1,
													disabled = true,
													get = function() return statusbars.channelBar.timetext.font.shadow.offset.x end,
													set = function(self,value)
														statusbars.channelBar.timetext.font.shadow.offset.x = value
														CheckRestorationDefaultValues(res_options,'Channel','channelBar')
													end,
												},
												shadowY = {
													order = 5,
													type = "range",
													name = "Y",
													desc = L["Set the text shadow's Y offset"],
													min = -10,
													max = 10,
													step = 1,
													bigStep = 1,
													disabled = true,
													get = function() return statusbars.channelBar.timetext.font.shadow.offset.y end,
													set = function(self,value)
														statusbars.channelBar.timetext.font.shadow.offset.y = value
														CheckRestorationDefaultValues(res_options,'Channel','channelBar')
													end,
												},
											},
										},
									},
								},
								layout = {
									name = L["Layout & Design"],
									type = "group",
									order = 8,
									guiInline = true,
									args = {
										texture = {
											order = 1,
											type = "select",
											name = L["Bar Texture"],
											desc = L["Set the bar's texture."],
											dialogControl = "LSM30_Statusbar",
											get = function()
												return statusbars.channelBar.foreground.texture
											end,
											set = function(self,value)
												statusbars.channelBar.foreground.texture = value
												CheckRestorationDefaultValues(res_options,'Channel','channelBar')
											end,
											values = LSM:HashTable(LSM.MediaType.STATUSBAR),
										},
										textureColor = {
											type = "color",
											order = 2,
											name = L["Bar Color"],
											get = function(info)
												local color = statusbars.channelBar.foreground.color
												return color.r, color.g, color.b
											end,
											set = function(info, r, g, b)
												local color = statusbars.channelBar.foreground.color
												
												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												CheckRestorationDefaultValues(res_options,'Channel','channelBar')
											end,
										},
										filler_0 = {
											order = 3,
											type = "description",
											name = ' ',
										},
										backgroundTexture = {
											order = 4,
											type = "select",
											name = L["Background Texture"],
											desc = L["Set the bar's background texture."],
											dialogControl = "LSM30_Statusbar",
											get = function()
												return statusbars.channelBar.background.texture
											end,
											set = function(self,value)
												statusbars.channelBar.background.texture = value
												CheckRestorationDefaultValues(res_options,"Channel",'channelBar')
											end,
											values = LSM:HashTable(LSM.MediaType.STATUSBAR),
										},
										backgroundColor = {
											type = "color",
											order = 5,
											name = L["Background Color"],
											desc = L["Set the color of the cast bar's background."],
											hasAlpha = true,
											get = function(info)
												local color = statusbars.channelBar.background.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = statusbars.channelBar.background.color
												
												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckRestorationDefaultValues(res_options,'Channel','channelBar')
											end,
										},
										backgroundToggle = {
											order = 6,
											name = L["Modify Background"],
											desc = L["Toggle the adjustment of the bar's background texture"],
											type = "toggle",
											get = function()
												return statusbars.channelBar.adjust.showBG
											end,
											set = function(self,value)
												statusbars.channelBar.adjust.showBG = value
												CheckRestorationDefaultValues(res_options,'Channel','channelBar')
											end,
										},
										width = {
											order = 7,
											type = "range",
											name = L["Width"],
											desc = '',
											min = 100,
											max = 500,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.channelBar.layout.width end,
											set = function(self,value)
												statusbars.channelBar.layout.width = value
												CheckRestorationDefaultValues(res_options,'Channel','channelBar')
											end,
										},
										height = {
											order = 8,
											type = "range",
											name = L["Height"],
											desc = '',
											min = 10,
											max = 100,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.channelBar.layout.height end,
											set = function(self,value)
												statusbars.channelBar.layout.height = value
												CheckRestorationDefaultValues(res_options,'Channel','channelBar')
											end,
										},
									},
								},
								reset = {
									order = 9,
									type = "execute",
									name = L["Reset Channel Bar"],
									func = function()
										local bar = statusbars.channelBar
										local default = statusbarDefaults.channelBar
										
										bar.alphaCombat = default.alphaCombat
										bar.alphaOoC = default.alphaOoC
										
										bar.nametext.isDisplayText = true
										bar.nametext.x = default.nametext.x
										bar.nametext.y = default.nametext.y
										bar.nametext.font.name = default.nametext.font.name
										bar.nametext.font.size = default.nametext.font.size
										bar.nametext.font.flag = default.nametext.font.flag
										bar.nametext.font.color.r = default.nametext.font.color.r
										bar.nametext.font.color.g = default.nametext.font.color.g
										bar.nametext.font.color.b = default.nametext.font.color.b
										bar.nametext.font.color.a = default.nametext.font.color.a
										bar.nametext.font.shadow.isEnabled = false
										bar.nametext.font.shadow.offset.x = default.nametext.font.shadow.offset.x
										bar.nametext.font.shadow.offset.y = default.nametext.font.shadow.offset.y
										bar.nametext.font.shadow.color.r = default.nametext.font.shadow.color.r
										bar.nametext.font.shadow.color.g = default.nametext.font.shadow.color.g
										bar.nametext.font.shadow.color.b = default.nametext.font.shadow.color.b
										bar.nametext.font.shadow.color.a = default.nametext.font.shadow.color.a
										bar.nametext.justify = default.nametext.justify
										
										bar.timetext.isDisplayText = true
										bar.timetext.x = default.timetext.x
										bar.timetext.y = default.timetext.y
										bar.timetext.font.name = default.timetext.font.name
										bar.timetext.font.size = default.timetext.font.size
										bar.timetext.font.flag = default.timetext.font.flag
										bar.timetext.font.color.r = default.timetext.font.color.r
										bar.timetext.font.color.g = default.timetext.font.color.g
										bar.timetext.font.color.b = default.timetext.font.color.b
										bar.timetext.font.color.a = default.timetext.font.color.a
										bar.timetext.font.shadow.isEnabled = false
										bar.timetext.font.shadow.offset.x = default.timetext.font.shadow.offset.x
										bar.timetext.font.shadow.offset.y = default.timetext.font.shadow.offset.y
										bar.timetext.font.shadow.color.r = default.timetext.font.shadow.color.r
										bar.timetext.font.shadow.color.g = default.timetext.font.shadow.color.g
										bar.timetext.font.shadow.color.b = default.timetext.font.shadow.color.b
										bar.timetext.font.shadow.color.a = default.timetext.font.shadow.color.a
										bar.timetext.justify = default.timetext.justify
										
										bar.icon.isEnabled = true
										bar.icon.justify = default.icon.justify
										bar.spark = true
										
										bar.background.texture = default.background.texture
										bar.background.color.r = default.background.color.r
										bar.background.color.g = default.background.color.g
										bar.background.color.b = default.background.color.b
										bar.background.color.a = default.background.color.a
										
										bar.foreground.color.r = default.foreground.color.r
										bar.foreground.color.g = default.foreground.color.g
										bar.foreground.color.b = default.foreground.color.b
										bar.foreground.texture = default.foreground.texture
										
										bar.layout.width = default.layout.width
										bar.layout.height = default.layout.height
										bar.layout.strata = default.layout.strata
										res_options.args.config.args.channelBar.args.reset.disabled = true
										res_options.args.config.args.channelBar.args.reset.name = "|cFF666666"..L["Reset Channel Bar"].."|r"
										CheckRestorationDefaultValues(res_options,'Channel','channelBar')
										
										if (not bar.adjust.isEnabled) then
											Auras:InitializeProgressBar('ChannelBarRes',nil,'channelBar','nametext','timetext',3)
										end
									end,
								},
							},
						},
						earthenShieldBar = {
							name = L["Earthen Shield Bar"],
							type = "group",
							order = 5,
							inline = false,
							args = {
								adjust = {
									order = 1,
									name = L["Modify Earthen Shield Bar"],
									desc = L["Toggle the adjustment of the Earthen Shield Bar"],
									type = "toggle",
									get = function()
										return statusbars.earthenShieldBar.adjust.isEnabled
									end,
									set = function(self,value)
										statusbars.earthenShieldBar.adjust.isEnabled = value
										CheckRestorationDefaultValues(res_options,'Earthen Shield')
									end,
								},
								healthtextToggle = {
									order = 2,
									name = L["Toggle Totem Health Text"],
									desc = L["Toggles the text display of the remaining health of the Earthen Shield Totem"],
									type = "toggle",
									get = function()
										return statusbars.earthenShieldBar.healthtext.isDisplayText
									end,
									set = function(self,value)
										statusbars.earthenShieldBar.healthtext.isDisplayText = value
										CheckRestorationDefaultValues(res_options,'Earthen Shield')
									end,
								},
								timetextToggle = {
									order = 3,
									name = L["Toggle Time Text"],
									desc = L["Toggles the text display of the spell casted"],
									type = "toggle",
									get = function()
										return statusbars.earthenShieldBar.timetext.isDisplayText
									end,
									set = function(self,value)
										statusbars.earthenShieldBar.timetext.isDisplayText = value
										CheckRestorationDefaultValues(res_options,'Earthen Shield')
									end,
								},
								general = {
									name = "|cFFFFFFFF"..L["Settings"].."|r",
									order = 4,
									type = "group",
									guiInline = true,
									args = {
										alphaCombat = {
											order = 1,
											type = "range",
											name = L["Alpha (In Combat)"],
											desc = L["Determines how opaque or transparent the bar will appear while in combat"],
											min = 0,
											max = 1,
											step = 0.1,
											bigStep = 0.1,
											get = function() return statusbars.earthenShieldBar.alphaCombat end,
											set = function(self,value)
												statusbars.earthenShieldBar.alphaCombat = value
												CheckRestorationDefaultValues(res_options,'Earthen Shield')
											end,
										},
										alphaOoC = {
											order = 2,
											type = "range",
											name = L["Alpha (OoC - No Target)"],
											desc = L["Determines how opaque or transparent the bar will appear when out of combat"],
											min = 0,
											max = 1,
											step = 0.1,
											bigStep = 0.1,
											get = function() return statusbars.earthenShieldBar.alphaOoC end,
											set = function(self,value)
												statusbars.earthenShieldBar.alphaOoC = value
												CheckRestorationDefaultValues(res_options,'Earthen Shield')
											end,
										},
										alphaTarget = {
											order = 3,
											type = "range",
											name = L["Alpha (OoC - Target)"],
											desc = L["Determines how opaque or transparent the bar will appear when out of combat and targetting an enemy"],
											min = 0,
											max = 1,
											step = 0.1,
											bigStep = 0.1,
											disabled = false,
											get = function() return statusbars.earthenShieldBar.alphaTar end,
											set = function(self,value)
												statusbars.earthenShieldBar.alphaTar = value
												CheckRestorationDefaultValues(res_options,'Earthen Shield')
											end,
										},
									},
								},
								healthtext = {
									name = '|cFFFFFFFF'..L['Health Text']..'|r',
									type = "group",
									order = 5,
									disabled = true,
									guiInline = true,
									args = {
										color = {
											type = "color",
											order = 1,
											name = L["Text Color"],
											desc = L["Set the color of the text."],
											hasAlpha = true,
											get = function(info)
												local color = statusbars.earthenShieldBar.healthtext.font.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = statusbars.earthenShieldBar.healthtext.font.color
												
												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckRestorationDefaultValues(res_options,'Earthen Shield')
											end,
										},
										filler_0 = {
											order = 2,
											type = "description",
											name = ' ',
										},
										fontName = {
											order = 3,
											type = "select",
											dialogControl = "LSM30_Font",
											name = L["Font"],
											desc = L["The font that will be used"],
											values = LSM:HashTable("font"),
											get = function() return statusbars.earthenShieldBar.healthtext.font.name end,
											set = function(self,value)
												statusbars.earthenShieldBar.healthtext.font.name = value
												CheckRestorationDefaultValues(res_options,'Earthen Shield')
											end,
										},
										fontSize = {
											order = 4,
											type = "range",
											name = L["Font Size"],
											desc = L["Customize the font size of the cooldown text"],
											min = 5,
											max = 40,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.earthenShieldBar.healthtext.font.size end,
											set = function(self,value)
												statusbars.earthenShieldBar.healthtext.font.size = value
												CheckRestorationDefaultValues(res_options,'Earthen Shield')
											end,
										},
										fontOutline = {
											order = 5,
											type = "select",
											name = L["Font Outline"],
											desc = L["The outline of the font"],
											get = function()
												return statusbars.earthenShieldBar.healthtext.font.flag
											end,
											set = function(self,value)
												statusbars.earthenShieldBar.healthtext.font.flag = value
												CheckRestorationDefaultValues(res_options,'Earthen Shield')
											end,
											values = {
												[""] = L["None"],
												["OUTLINE"] = L["Outline"],
												["THICKOUTLINE"] = L["Thick Outline"],
												["MONOCHROME"] = L["Monochrome"],
												["OUTLINE, MONOCHROME"] = L["Monochrome Outline"],
												["THICKOUTLINE, MONOCHROME"] = L["Monochrome Thick Outline"],
											},
										},
										healthtextAnchor = {
											order = 6,
											type = "select",
											name = L["Anchor Point"],
											desc = L["Set the anchor point."],
											get = function()
												return statusbars.earthenShieldBar.healthtext.justify
											end,
											set = function(self,value)
												statusbars.earthenShieldBar.healthtext.justify = value
												CheckRestorationDefaultValues(res_options,'Earthen Shield')
											end,
											values = {
												["TOPLEFT"] = L["TOPLEFT"],
												["TOP"] = L["TOP"],
												["TOPRIGHT"] = L["TOPRIGHT"],
												["LEFT"] = L["LEFT"],
												["CENTER"] = L["CENTER"],
												["RIGHT"] = L["RIGHT"],
												["BOTTOMLEFT"] = L["BOTTOMLEFT"],
												["BOTTOM"] = L["BOTTOM"],
												["BOTTOMRIGHT"] = L["BOTTOMRIGHT"],
											}
										},
										healthtextX = {
											order = 7,
											type = "range",
											name = "X",
											desc = L["Set location of text on the X axis"],
											min = -500,
											max = 500,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.earthenShieldBar.healthtext.x end,
											set = function(self,value)
												statusbars.earthenShieldBar.healthtext.x = value
												CheckRestorationDefaultValues(res_options,'Earthen Shield')
											end,
										},
										healthtextY = {
											order = 8,
											type = "range",
											name = "Y",
											desc = L["Set location of text on the Y axis"],
											min = -100,
											max = 100,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.earthenShieldBar.healthtext.y end,
											set = function(self,value)
												statusbars.earthenShieldBar.healthtext.y = value
												CheckRestorationDefaultValues(res_options,'Earthen Shield')
											end,
										},
										shadow = {
											name = '|cFFFFFFFF'..L['Text Shadow']..'|r',
											type = "group",
											order = 9,
											hidden = false,
											guiInline = true,
											args = {
												shadowToggle = {
													order = 1,
													name = L["Toggle"],
													desc = '',
													type = "toggle",
													get = function()
														return statusbars.earthenShieldBar.healthtext.font.shadow.isEnabled
													end,
													set = function(self,value)
														statusbars.earthenShieldBar.healthtext.font.shadow.isEnabled = value
														CheckRestorationDefaultValues(res_options,'Earthen Shield')
													end,
												},
												shadowColor = {
													type = "color",
													order = 2,
													name = L["Shadow Color"],
													desc = L["Set the color of the text's shadow."],
													hasAlpha = true,
													disabled = true,
													get = function(info)
														local color = statusbars.earthenShieldBar.healthtext.font.shadow.color
														return color.r, color.g, color.b, color.a
													end,
													set = function(info, r, g, b, a)
														local color = statusbars.earthenShieldBar.healthtext.font.shadow.color
														
														color.r = tonumber(string.format("%.2f",r))
														color.g = tonumber(string.format("%.2f",g))
														color.b = tonumber(string.format("%.2f",b))
														color.a = tonumber(string.format("%.2f",a))
														CheckRestorationDefaultValues(res_options,'Earthen Shield')
													end,
												},
												filler_0 = {
													order = 3,
													type = "description",
													name = ' ',
												},
												shadowX = {
													order = 4,
													type = "range",
													name = "X",
													desc = L["Set the text shadow's X offset"],
													min = -10,
													max = 10,
													step = 1,
													bigStep = 1,
													disabled = true,
													get = function() return statusbars.earthenShieldBar.healthtext.font.shadow.offset.x end,
													set = function(self,value)
														statusbars.earthenShieldBar.healthtext.font.shadow.offset.x = value
														CheckRestorationDefaultValues(res_options,'Earthen Shield')
													end,
												},
												shadowY = {
													order = 5,
													type = "range",
													name = "Y",
													desc = L["Set the text shadow's Y offset"],
													min = -10,
													max = 10,
													step = 1,
													bigStep = 1,
													disabled = true,
													get = function() return statusbars.earthenShieldBar.healthtext.font.shadow.offset.y end,
													set = function(self,value)
														statusbars.earthenShieldBar.healthtext.font.shadow.offset.y = value
														CheckRestorationDefaultValues(res_options,'Earthen Shield')
													end,
												},
											},
										},
									},
								},
								timetext = {
									name = '|cFFFFFFFFTimer Text|r',
									type = "group",
									order = 6,
									disabled = true,
									guiInline = true,
									args = {
										color = {
											type = "color",
											order = 1,
											name = L["Text Color"],
											desc = L["Set the color of the text."],
											hasAlpha = true,
											get = function(info)
												local color = statusbars.earthenShieldBar.timetext.font.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = statusbars.earthenShieldBar.timetext.font.color
												
												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckRestorationDefaultValues(res_options,'Earthen Shield')
											end,
										},
										filler_0 = {
											order = 2,
											type = "description",
											name = ' ',
										},
										timeFontName = {
											order = 3,
											type = "select",
											dialogControl = "LSM30_Font",
											name = L["Font"],
											desc = L["The font that will be used"],
											values = LSM:HashTable("font"),
											get = function() return statusbars.earthenShieldBar.timetext.font.name end,
											set = function(self,value)
												statusbars.earthenShieldBar.timetext.font.name = value
												CheckRestorationDefaultValues(res_options,'Earthen Shield')
											end,
										},
										timeFontSize = {
											order = 4,
											type = "range",
											name = L["Font Size"],
											desc = L["Customize the font size of the cooldown text"],
											min = 5,
											max = 40,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.earthenShieldBar.timetext.font.size end,
											set = function(self,value)
												statusbars.earthenShieldBar.timetext.font.size = value
												CheckRestorationDefaultValues(res_options,'Earthen Shield')
											end,
										},
										timeFontOutline = {
											order = 5,
											type = "select",
											name = L["Font Outline"],
											desc = L["The outline of the font"],
											get = function()
												return statusbars.earthenShieldBar.timetext.font.flag
											end,
											set = function(self,value)
												statusbars.earthenShieldBar.timetext.font.flag = value
												CheckRestorationDefaultValues(res_options,'Earthen Shield')
											end,
											values = {
												[""] = L["None"],
												["OUTLINE"] = L["Outline"],
												["THICKOUTLINE"] = L["Thick Outline"],
												["MONOCHROME"] = L["Monochrome"],
												["OUTLINE, MONOCHROME"] = L["Monochrome Outline"],
												["THICKOUTLINE, MONOCHROME"] = L["Monochrome Thick Outline"],
											},
										},
										timeTextAnchor = {
											order = 6,
											type = "select",
											name = L["Anchor Point"],
											desc = L["Set the anchor point."],
											get = function()
												return statusbars.earthenShieldBar.timetext.justify
											end,
											set = function(self,value)
												statusbars.earthenShieldBar.timetext.justify = value
												CheckRestorationDefaultValues(res_options,'Earthen Shield')
											end,
											values = {
												["TOPLEFT"] = L["TOPLEFT"],
												["TOP"] = L["TOP"],
												["TOPRIGHT"] = L["TOPRIGHT"],
												["LEFT"] = L["LEFT"],
												["CENTER"] = L["CENTER"],
												["RIGHT"] = L["RIGHT"],
												["BOTTOMLEFT"] = L["BOTTOMLEFT"],
												["BOTTOM"] = L["BOTTOM"],
												["BOTTOMRIGHT"] = L["BOTTOMRIGHT"],
											}
										},
										timeTextX = {
											order = 7,
											type = "range",
											name = "X",
											desc = L["Set location of text on the X axis"],
											min = -500,
											max = 500,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.earthenShieldBar.timetext.x end,
											set = function(self,value)
												statusbars.earthenShieldBar.timetext.x = value
												CheckRestorationDefaultValues(res_options,'Earthen Shield')
											end,
										},
										timeTextY = {
											order = 8,
											type = "range",
											name = "Y",
											desc = L["Set location of text on the Y axis"],
											min = -100,
											max = 100,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.earthenShieldBar.timetext.y end,
											set = function(self,value)
												statusbars.earthenShieldBar.timetext.y = value
												CheckRestorationDefaultValues(res_options,'Earthen Shield')
											end,
										},
										shadow = {
											name = '|cFFFFFFFF'..L['Text Shadow']..'|r',
											type = "group",
											order = 9,
											hidden = false,
											guiInline = true,
											args = {
												shadowToggle = {
													order = 1,
													name = L["Toggle"],
													desc = '',
													type = "toggle",
													get = function()
														return statusbars.earthenShieldBar.timetext.font.shadow.isEnabled
													end,
													set = function(self,value)
														statusbars.earthenShieldBar.timetext.font.shadow.isEnabled = value
														CheckRestorationDefaultValues(res_options,'Earthen Shield')
													end,
												},
												shadowColor = {
													type = "color",
													order = 2,
													name = L["Shadow Color"],
													desc = L["Set the color of the text's shadow."],
													hasAlpha = true,
													disabled = true,
													get = function(info)
														local color = statusbars.earthenShieldBar.timetext.font.shadow.color
														return color.r, color.g, color.b, color.a
													end,
													set = function(info, r, g, b, a)
														local color = statusbars.earthenShieldBar.timetext.font.shadow.color
														
														color.r = tonumber(string.format("%.2f",r))
														color.g = tonumber(string.format("%.2f",g))
														color.b = tonumber(string.format("%.2f",b))
														color.a = tonumber(string.format("%.2f",a))
														CheckRestorationDefaultValues(res_options,'Earthen Shield')
													end,
												},
												filler_0 = {
													order = 3,
													type = "description",
													name = ' ',
												},
												shadowX = {
													order = 4,
													type = "range",
													name = "X",
													desc = L["Set the text shadow's X offset"],
													min = -10,
													max = 10,
													step = 1,
													bigStep = 1,
													disabled = true,
													get = function() return statusbars.earthenShieldBar.timetext.font.shadow.offset.x end,
													set = function(self,value)
														statusbars.earthenShieldBar.timetext.font.shadow.offset.x = value
														CheckRestorationDefaultValues(res_options,'Earthen Shield')
													end,
												},
												shadowY = {
													order = 5,
													type = "range",
													name = "Y",
													desc = L["Set the text shadow's Y offset"],
													min = -10,
													max = 10,
													step = 1,
													bigStep = 1,
													disabled = true,
													get = function() return statusbars.earthenShieldBar.timetext.font.shadow.offset.y end,
													set = function(self,value)
														statusbars.earthenShieldBar.timetext.font.shadow.offset.y = value
														CheckRestorationDefaultValues(res_options,'Earthen Shield')
													end,
												},
											},
										},
									},
								},
								layout = {
									name = L["Layout & Design"],
									type = "group",
									order = 7,
									guiInline = true,
									args = {
										texture = {
											order = 1,
											type = "select",
											name = L["Bar Texture"],
											desc = L["Set the bar's texture."],
											dialogControl = "LSM30_Statusbar",
											get = function()
												return statusbars.earthenShieldBar.foreground.texture
											end,
											set = function(self,value)
												statusbars.earthenShieldBar.foreground.texture = value
												CheckRestorationDefaultValues(res_options,"Earthen Shield")
											end,
											values = LSM:HashTable(LSM.MediaType.STATUSBAR),
										},
										textureColor = {
											type = "color",
											order = 2,
											name = L["Bar Color"],
											get = function(info)
												local color = statusbars.earthenShieldBar.foreground.color
												return color.r, color.g, color.b
											end,
											set = function(info, r, g, b)
												local color = statusbars.earthenShieldBar.foreground.color
												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												CheckRestorationDefaultValues(res_options,'Earthen Shield')
											end,
										},
										filler_0 = {
											order = 3,
											type = "description",
											name = ' ',
										},
										timerTexture = {
											order = 4,
											type = "select",
											name = L["Timer Bar Texture"],
											desc = L["Set the bar's texture."],
											dialogControl = "LSM30_Statusbar",
											get = function()
												return statusbars.earthenShieldBar.timerBar.texture
											end,
											set = function(self,value)
												--print(value)
												statusbars.earthenShieldBar.timerBar.texture = value
												CheckRestorationDefaultValues(res_options,"Earthen Shield")
											end,
											values = LSM:HashTable(LSM.MediaType.STATUSBAR),
										},
										timerColor = {
											type = "color",
											order = 5,
											name = L["Bar Color"],
											hasAlpha = true,
											get = function(info)
												local color = statusbars.earthenShieldBar.timerBar.color
												return color.r,color.g,color.b,color.a
											end,
											set = function(info, r, g, b, a)
												local color = statusbars.earthenShieldBar.timerBar.color
												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckRestorationDefaultValues(res_options,"Earthen Shield")
											end,
										},
										timerToggle = {
											order = 6,
											name = L["Modify Timer Bar"],
											desc = L["Toggle the adjustment of the Timer Bar"],
											type = "toggle",
											get = function()
												return statusbars.earthenShieldBar.adjust.showTimer
											end,
											set = function(self,value)
												statusbars.earthenShieldBar.adjust.showTimer = value
												CheckRestorationDefaultValues(res_options,'Earthen Shield')
											end,
										},
										backgroundTexture = {
											order = 7,
											type = "select",
											name = L["Background Texture"],
											desc = L["Set the bar's background texture."],
											dialogControl = "LSM30_Statusbar",
											get = function()
												return statusbars.earthenShieldBar.background.texture
											end,
											set = function(self,value)
												statusbars.earthenShieldBar.background.texture = value
												CheckRestorationDefaultValues(res_options,"Earthen Shield")
											end,
											values = LSM:HashTable(LSM.MediaType.STATUSBAR),
										},
										backgroundColor = {
											type = "color",
											order = 8,
											name = "BG Color",
											desc = L["Set the color of the cast bar's background."],
											hasAlpha = true,
											get = function(info)
												local color = statusbars.earthenShieldBar.background.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = statusbars.earthenShieldBar.background.color
												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckRestorationDefaultValues(res_options,'Earthen Shield')
											end,
										},
										backgroundToggle = {
											order = 9,
											name = L["Modify Background"],
											desc = L["Toggle the adjustment of the bar's background texture"],
											type = "toggle",
											get = function()
												return statusbars.earthenShieldBar.adjust.showBG
											end,
											set = function(self,value)
												statusbars.earthenShieldBar.adjust.showBG = value
												CheckRestorationDefaultValues(res_options,'Earthen Shield')
											end,
										},
										width = {
											order = 10,
											type = "range",
											name = L["Width"],
											desc = '',
											min = 100,
											max = 500,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.earthenShieldBar.layout.width end,
											set = function(self,value)
												statusbars.earthenShieldBar.layout.width = value
												CheckRestorationDefaultValues(res_options,'Earthen Shield')
											end,
										},
										height = {
											order = 11,
											type = "range",
											name = L["Height"],
											desc = '',
											min = 10,
											max = 100,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.earthenShieldBar.layout.height end,
											set = function(self,value)
												statusbars.earthenShieldBar.layout.height = value
												CheckRestorationDefaultValues(res_options,'Earthen Shield')
											end,
										},
									},
								},
								reset = {
									order = 8,
									type = "execute",
									name = L["Reset Earthen Shield Bar"],
									func = function()
										local bar = statusbars.earthenShieldBar
										local default = statusbarDefaults.earthenShieldBar
										
										bar.alphaCombat = default.alphaCombat
										bar.alphaOoC = default.alphaOoC
										
										bar.healthtext.isDisplayText = true
										bar.healthtext.x = default.healthtext.x
										bar.healthtext.y = default.healthtext.y
										bar.healthtext.font.name = default.healthtext.font.name
										bar.healthtext.font.size = default.healthtext.font.size
										bar.healthtext.font.flag = default.healthtext.font.flag
										bar.healthtext.font.color.r = default.healthtext.font.color.r
										bar.healthtext.font.color.g = default.healthtext.font.color.g
										bar.healthtext.font.color.b = default.healthtext.font.color.b
										bar.healthtext.font.color.a = default.healthtext.font.color.a
										bar.healthtext.font.shadow.isEnabled = false
										bar.healthtext.font.shadow.offset.x = default.healthtext.font.shadow.offset.x
										bar.healthtext.font.shadow.offset.y = default.healthtext.font.shadow.offset.y
										bar.healthtext.font.shadow.color.r = default.healthtext.font.shadow.color.r
										bar.healthtext.font.shadow.color.g = default.healthtext.font.shadow.color.g
										bar.healthtext.font.shadow.color.b = default.healthtext.font.shadow.color.b
										bar.healthtext.font.shadow.color.a = default.healthtext.font.shadow.color.a
										bar.healthtext.justify = default.healthtext.justify
										
										bar.timetext.isDisplayText = true
										bar.timetext.x = default.timetext.x
										bar.timetext.y = default.timetext.y
										bar.timetext.font.name = default.timetext.font.name
										bar.timetext.font.size = default.timetext.font.size
										bar.timetext.font.flag = default.timetext.font.flag
										bar.timetext.font.color.r = default.timetext.font.color.r
										bar.timetext.font.color.g = default.timetext.font.color.g
										bar.timetext.font.color.b = default.timetext.font.color.b
										bar.timetext.font.color.a = default.timetext.font.color.a
										bar.timetext.font.shadow.isEnabled = false
										bar.timetext.font.shadow.offset.x = default.timetext.font.shadow.offset.x
										bar.timetext.font.shadow.offset.y = default.timetext.font.shadow.offset.y
										bar.timetext.font.shadow.color.r = default.timetext.font.shadow.color.r
										bar.timetext.font.shadow.color.g = default.timetext.font.shadow.color.g
										bar.timetext.font.shadow.color.b = default.timetext.font.shadow.color.b
										bar.timetext.font.shadow.color.a = default.timetext.font.shadow.color.a
										bar.timetext.justify = default.timetext.justify
										
										bar.background.opacity = default.background.opacity
										bar.background.texture = default.background.texture
										bar.background.color.r = default.background.color.r
										bar.background.color.g = default.background.color.g
										bar.background.color.b = default.background.color.b
										bar.background.color.a = default.background.color.a
										
										bar.timerBar.color.r = default.timerBar.color.r
										bar.timerBar.color.g = default.timerBar.color.g
										bar.timerBar.color.b = default.timerBar.color.b
										bar.timerBar.color.a = default.timerBar.color.a
										bar.timerBar.texture = default.timerBar.texture
										
										bar.foreground.color.r = default.foreground.color.r
										bar.foreground.color.g = default.foreground.color.g
										bar.foreground.color.b = default.foreground.color.b
										bar.foreground.texture = default.foreground.texture
										
										bar.layout.width = default.layout.width
										bar.layout.height = default.layout.height
										bar.layout.strata = default.layout.strata
										res_options.args.config.args.earthenShieldBar.args.reset.disabled = true
										res_options.args.config.args.earthenShieldBar.args.reset.name = "|cFF666666"..L["Reset Earthen Shield Bar"].."|r"
										CheckRestorationDefaultValues(res_options,'Earthen Shield')
										
										if (not bar.adjust.isEnabled) then
											Auras:InitializeProgressBar('EarthenShieldTotemBar','Timer','earthenShieldBar','healthtext','timetext',3)
										end
									end,
								},
							},
						},
						tidalWavesBar = {
							name = L["Tidal Waves Bar"],
							type = "group",
							order = 6,
							inline = false,
							args = {
								adjust = {
									order = 1,
									name = L["Modify Tidal Waves Bar"],
									desc = L["Toggle the adjustment of the Tidal Waves Bar"],
									type = "toggle",
									get = function()
										return statusbars.tidalWavesBar.adjust.isEnabled
									end,
									set = function(self,value)
										statusbars.tidalWavesBar.adjust.isEnabled = value
										CheckRestorationDefaultValues(res_options,'Tidal Waves')
									end,
								},
								general = {
									name = "|cFFFFFFFF"..L["Settings"].."|r",
									order = 2,
									type = "group",
									guiInline = true,
									args = {
										animate = {
											order = 1,
											type = "toggle",
											name = L["Animate Tidal Waves Bar"],
											get = function() 
												return statusbars.tidalWavesBar.animate
											end,
											set = function(self,value)
												local buff,_,_,count = UnitBuff('player',Auras:GetSpellName(53390))
												statusbars.tidalWavesBar.animate = value
												CheckRestorationDefaultValues(res_options,"Tidal Waves")
											end,
										},
										emptyColor = {
											type = "color",
											order = 2,
											name = L["No Tidal Waves Color"],
											desc = L["Determines the color of the Tidal Waves bar when no tidal wave charges are active"],
											get = function(info)
												local color = statusbars.tidalWavesBar.emptyColor
												
												return color.r, color.g, color.b
											end,
											set = function(info, r, g, b)
												local color = statusbars.tidalWavesBar.emptyColor
												
												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												CheckRestorationDefaultValues(res_options,"Tidal Waves")
											end,
										},
										filler_0 = {
											order = 3,
											type = "description",
											name = ' ',
										},
										combatDisplay = {
											order = 4,
											type = "select",
											name = L["Tidal Wave Display (In Combat)"],
											desc = L["The method in which Tidal Wave will be displayed while in combat."],
											get = function()
												return statusbars.tidalWavesBar.combatDisplay
											end,
											set = function(self,value)
												statusbars.tidalWavesBar.combatDisplay = value
												CheckRestorationDefaultValues(res_options,"Tidal Waves")
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
												return statusbars.tidalWavesBar.OoCDisplay
											end,
											set = function(self,value)
												statusbars.tidalWavesBar.OoCDisplay = value
												CheckRestorationDefaultValues(res_options,"Tidal Waves")
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
											get = function() return statusbars.tidalWavesBar.OoCTime end,
											set = function(self,value)
												statusbars.tidalWavesBar.OoCTime = value
												CheckRestorationDefaultValues(res_options,"Tidal Waves")
											end,
										},
									},
								},
								layout = {
									name = L["Layout & Design"],
									type = "group",
									order = 3,
									guiInline = true,
									args = {
										texture = {
											order = 1,
											type = "select",
											name = L["Bar Texture"],
											desc = L["Set the bar's texture."],
											dialogControl = "LSM30_Statusbar",
											get = function()
												return statusbars.tidalWavesBar.foreground.texture
											end,
											set = function(self,value)
												statusbars.tidalWavesBar.foreground.texture = value
												CheckRestorationDefaultValues(res_options,"Tidal Waves")
											end,
											values = LSM:HashTable(LSM.MediaType.STATUSBAR),
										},
										textureColor = {
											type = "color",
											order = 2,
											name = L["Bar Color"],
											get = function(info)
												local color = statusbars.tidalWavesBar.foreground.color
												return color.r, color.g, color.b
											end,
											set = function(info, r, g, b)
												local color = statusbars.tidalWavesBar.foreground.color

												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												CheckRestorationDefaultValues(res_options,"Tidal Waves")
											end,
										},
										filler_0 = {
											order = 3,
											type = "description",
											name = ' ',
										},
										backgroundTexture = {
											order = 4,
											type = "select",
											name = L["Background Texture"],
											desc = L["Set the bar's background texture."],
											dialogControl = "LSM30_Statusbar",
											get = function()
												return statusbars.tidalWavesBar.background.texture
											end,
											set = function(self,value)
												statusbars.tidalWavesBar.background.texture = value
												CheckRestorationDefaultValues(res_options,"Tidal Waves")
											end,
											values = LSM:HashTable(LSM.MediaType.STATUSBAR),
										},
										backgroundColor = {
											type = "color",
											order = 5,
											name = L["Background Color"],
											desc = L["Set the color of the cast bar's background."],
											hasAlpha = true,
											get = function(info)
												local color = statusbars.tidalWavesBar.background.color

												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = statusbars.tidalWavesBar.background.color

												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckRestorationDefaultValues(res_options,"Tidal Waves")
											end,
										},
										backgroundToggle = {
											order = 6,
											name = L["Modify Background"],
											desc = L["Toggle the adjustment of the bar's background texture"],
											type = "toggle",
											get = function()
												return statusbars.tidalWavesBar.adjust.showBG
											end,
											set = function(self,value)
												statusbars.tidalWavesBar.adjust.showBG = value
												CheckRestorationDefaultValues(res_options,"Tidal Waves")
											end,
										},
										width = {
											order = 7,
											type = "range",
											name = L["Width"],
											desc = '',
											min = 100,
											max = 500,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.tidalWavesBar.layout.width end,
											set = function(self,value)
												statusbars.tidalWavesBar.layout.width = value
												CheckRestorationDefaultValues(res_options,"Tidal Waves")
											end,
										},
										height = {
											order = 8,
											type = "range",
											name = L["Height"],
											desc = '',
											min = 5,
											max = 100,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.tidalWavesBar.layout.height end,
											set = function(self,value)
												statusbars.tidalWavesBar.layout.height = value
												CheckRestorationDefaultValues(res_options,"Tidal Waves")
											end,
										},
									},
								},
								reset = {
									order = 4,
									type = "execute",
									name = L["Reset Tidal Waves Bar"],
									func = function()
										local bar = statusbars.tidalWavesBar
										local default = statusbarDefaults.tidalWavesBar
										
										bar.combatDisplay = default.combatDisplay
										bar.OoCDisplay = default.OoCDisplay
										bar.animate = default.animate
										bar.OoCTime = default.OoCTime
										
										bar.background.texture = default.background.texture
										bar.background.color.r = default.background.color.r
										bar.background.color.g = default.background.color.g
										bar.background.color.b = default.background.color.b
										bar.background.color.a = default.background.color.a
										
										bar.emptyColor.r = default.emptyColor.r
										bar.emptyColor.g = default.emptyColor.g
										bar.emptyColor.b = default.emptyColor.b
										bar.emptyColor.a = default.emptyColor.a
										
										bar.foreground.color.r = default.foreground.color.r
										bar.foreground.color.g = default.foreground.color.g
										bar.foreground.color.b = default.foreground.color.b
										bar.foreground.texture = default.foreground.texture
										
										bar.layout.width = default.layout.width
										bar.layout.height = default.layout.height
										bar.layout.strata = default.layout.strata
										
										res_options.args.config.args.tidalWavesBar.args.reset.disabled = true
										res_options.args.config.args.tidalWavesBar.args.reset.name = "|cFF666666"..L["Reset Tidal Waves Bar"].."|r"
									end,
								},
							},
						},
					},
				},
				layout = {
					name = L["Layout"],
					order = 3,
					type = "group",
					disabled = true,
					args = {
						MoveAuras = {
							order = 1,
							type = "execute",
							name = "|cFFFFCC00"..L["Move Restoration Auras"].."|r",
							func = function()
								elements.isMoving = true
								SSA.MoveRes.Info:Show()
								Auras:InitMoveAuraGroups(SSA.AuraObjectsRes,"Res")
							end,
						},
						ResetAuras = {
							order = 2,
							type = "execute",
							name = "|cFFFFCC00"..L["Reset Restoration Auras"].."|r",
							func = function()
								Auras:ResetAuraGroupPosition('AuraGroupRes')
							end,
						},
						--[[primaryDesc = {
							order = 3,
							type = "description",
							name = L["Primary Auras"],
						},]]
						primaryAuras = {
							name = L["Primary Auras"],
							type = "group",
							order = 3,
							guiInline = true,
							args = {
								PrimaryOrientation1 = {
									order = 1,
									type = "select",
									name = L["Primary Orientation 1"],
									desc = L["Set the aura orientation to horizontal or vertical."],
									get = function()
										return layout.orientation.top
									end,
									set = function(self,value)
										layout.orientation.top = value
										CheckRestorationDefaultValues(res_options,"Primary")
										Auras:UpdateTalents()
									end,
									values = {
										["Horizontal"] = L["Horizontal"],
										["Vertical"] = L["Vertical"],
									},
								},
								PrimaryOrientation2 = {
									order = 2,
									type = "select",
									name = L["Primary Orientation 2"],
									desc = L["Set the aura orientation to horizontal or vertical."],
									get = function()
										return layout.orientation.bottom
									end,
									set = function(self,value)
										layout.orientation.bottom = value
										CheckRestorationDefaultValues(res_options,"Primary")
										Auras:UpdateTalents()
									end,
									values = {
										["Horizontal"] = L["Horizontal"],
										["Vertical"] = L["Vertical"],
									},
								},
								filler_0 = {
									order = 3,
									type = "description",
									name = ' ',
								},
								AuraSizeRow1 = {
									order = 4,
									type = "range",
									name = L["Primary Size 1"],
									desc = L["Determines the size of primary auras in row 1. (Default is 32)"],
									min = 16,
									max = 256,
									step = 1,
									bigStep = 1,
									get = function() return layout.primary.top.icon end,
									set = function(self,value)
										layout.primary.top.icon = value
										CheckRestorationDefaultValues(res_options,"Primary")
										Auras:UpdateTalents()
									end,
								},
								AuraSpacingRow1 = {
									order = 5,
									type = "range",
									name = L["Primary Spacing 1"],
									desc = L["Determines the spacing of the primary auras in row 1. (Default is 50)"],
									min = 32,
									max = 300,
									step = 1,
									bigStep = 1,
									get = function() return layout.primary.top.spacing end,
									set = function(self,value)
										layout.primary.top.spacing = value
										CheckRestorationDefaultValues(res_options,"Primary")
										Auras:UpdateTalents()
									end,
								},
								AuraChargesRow1 = {
									order = 6,
									type = "range",
									name = L["Primary Charges 1"],
									desc = L["Determines the size of the primary charge text in row 1. (Default is 13.5)"],
									min = 10,
									max = 60,
									step = 0.5,
									bigStep = 0.5,
									get = function() return layout.primary.top.charges end,
									set = function(self,value)
										layout.primary.top.charges = value
										CheckRestorationDefaultValues(res_options,"Primary")
										Auras:UpdateTalents()
									end,
								},
								filler_1 = {
									order = 7,
									type = "description",
									name = ' ',
								},
								AuraSizeRow2 = {
									order = 8,
									type = "range",
									name = L["Primary Size 2"],
									desc = L["Determines the size of primary auras in row 2. (Default is 32)"],
									min = 16,
									max = 256,
									step = 1,
									bigStep = 1,
									get = function() return layout.primary.bottom.icon end,
									set = function(self,value)
										layout.primary.bottom.icon = value
										CheckRestorationDefaultValues(res_options,"Primary")
										Auras:UpdateTalents()
									end,
								},
								AuraSpacingRow2 = {
									order = 9,
									type = "range",
									name = L["Primary Spacing 2"],
									desc = L["Determines the spacing of the primary auras in row 2. (Default is 50)"],
									min = 32,
									max = 300,
									step = 1,
									bigStep = 1,
									get = function() return layout.primary.bottom.spacing end,
									set = function(self,value)
										layout.primary.bottom.spacing = value
										CheckRestorationDefaultValues(res_options,"Primary")
										Auras:UpdateTalents()
									end,
								},
								filler_2 = {
									order = 10,
									type = "description",
									name = ' ',
								},
								ResetPrimaryLayout = {
									order = 11,
									type = "execute",
									--name = "|cFFFFCC00"..L["Reset Primary Layout"].."|r",
									--disabled = false,
									name = L["Reset Primary Layout"],
									func = function()
										layout.orientation.top = layoutDefaults.orientation.top
										layout.orientation.bottom = layoutDefaults.orientation.bottom
										layout.primary.top.icon = layoutDefaults.primary.top.icon
										layout.primary.top.spacing = layoutDefaults.primary.top.spacing
										layout.primary.top.charges = layoutDefaults.primary.top.charges
										layout.primary.bottom.icon = layoutDefaults.primary.bottom.icon
										layout.primary.bottom.spacing = layoutDefaults.primary.bottom.spacing
										res_options.args.layout.args.primaryAuras.args.ResetPrimaryLayout.disabled = true
										res_options.args.layout.args.primaryAuras.args.ResetPrimaryLayout.name = "|cFF666666"..L["Reset Primary Layout"].."|r"
										Auras:UpdateTalents()
									end,
								},
							},
						},
						--[[filler_3 = {
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
						},]]
						secondaryAuras = {
							name = L["Secondary Auras"],
							type = "group",
							order = 4,
							guiInline = true,
							args = {
								SecondaryOrientation1 = {
									order = 1,
									type = "select",
									name = L["Secondary Orientation 1"],
									desc = L["Set the aura orientation to horizontal or vertical."],
									get = function()
										return layout.orientation.left
									end,
									set = function(self,value)
										layout.orientation.left = value
										CheckRestorationDefaultValues(res_options,"Secondary")
										Auras:UpdateTalents()
									end,
									values = {
										["Horizontal"] = L["Horizontal"],
										["Vertical"] = L["Vertical"],
									},
								},
								SecondaryOrientation2 = {
									order = 2,
									type = "select",
									name = L["Secondary Orientation 2"],
									desc = L["Set the aura orientation to horizontal or vertical."],
									get = function()
										return layout.orientation.right
									end,
									set = function(self,value)
										layout.orientation.right = value
										CheckRestorationDefaultValues(res_options,"Secondary")
										Auras:UpdateTalents()
									end,
									values = {
										["Horizontal"] = L["Horizontal"],
										["Vertical"] = L["Vertical"],
									},
								},
								filler_5 = {
									order = 3,
									type = "description",
									name = ' ',
								},
								AuraSizeCol1 = {
									order = 4,
									type = "range",
									name = L["Secondary Size 1"],
									desc = L["Determines the size of secondary auras in column 1. (Default is 25)"],
									min = 16,
									max = 256,
									step = 1,
									bigStep = 1,
									get = function() return layout.secondary.left.icon end,
									set = function(self,value)
										layout.secondary.left.icon = value
										CheckRestorationDefaultValues(res_options,"Secondary")
										Auras:UpdateTalents()
									end,
								},
								AuraSpacingCol1 = {
									order = 5,
									type = "range",
									name = L["Secondary Spacing 1"],
									desc = L["Determines the spacing of the secondary auras in column 1. (Default is 30)"],
									min = 32,
									max = 300,
									step = 1,
									bigStep = 1,
									get = function() return layout.secondary.left.spacing end,
									set = function(self,value)
										layout.secondary.left.spacing = value
										CheckRestorationDefaultValues(res_options,"Secondary")
										Auras:UpdateTalents()
									end,
								},
								filler_6 = {
									order = 6,
									type = "description",
									name = ' ',
								},
								AuraSizeCol2 = {
									order = 7,
									type = "range",
									name = L["Secondary Size 2"],
									desc = L["Determines the size of secondary auras in column 2. (Default is 25)"],
									min = 16,
									max = 256,
									step = 1,
									bigStep = 1,
									get = function() return layout.secondary.right.icon end,
									set = function(self,value)
										layout.secondary.right.icon = value
										CheckRestorationDefaultValues(res_options,"Secondary")
										Auras:UpdateTalents()
									end,
								},
								AuraSpacingCol2 = {
									order = 8,
									type = "range",
									name = L["Secondary Spacing 2"],
									desc = L["Determines the spacing of the secondary auras in column 2. (Default is 30)"],
									min = 30,
									max = 300,
									step = 1,
									bigStep = 1,
									get = function() return layout.secondary.right.spacing end,
									set = function(self,value)
										layout.secondary.right.spacing = value
										CheckRestorationDefaultValues(res_options,"Secondary")
										Auras:UpdateTalents()
									end,
								},
								AuraChargesCol2 = {
									order = 9,
									type = "range",
									name = L["Secondary Charges 2"],
									desc = L["Determines the size of the secondary charge text in column 2. (Default is 13.5)"],
									min = 10,
									max = 60,
									step = 0.5,
									bigStep = 0.5,
									get = function() return layout.secondary.right.charges end,
									set = function(self,value)
										layout.secondary.right.charges = value
										CheckRestorationDefaultValues(res_options,"Secondary")
										Auras:UpdateTalents()
									end,
								},
								--[[filler_4 = {
									order = 17,
									type = "description",
									name = ' ',
								},]]
								ResetSecondaryLayout = {
									order = 10,
									type = "execute",
									--name = "|cFFFFCC00"..L["Reset Secondary Layout"].."|r",
									--disabled = false,
									name = L["Reset Secondary Layout"],
									func = function()
										layout.orientation.left = layoutDefaults.orientation.left
										layout.orientation.right = layoutDefaults.orientation.right
										layout.secondary.left.icon = layoutDefaults.secondary.left.icon
										layout.secondary.left.spacing = layoutDefaults.secondary.left.spacing
										layout.secondary.right.icon = layoutDefaults.secondary.right.icon
										layout.secondary.right.spacing = layoutDefaults.secondary.right.spacing
										layout.secondary.right.charges = layoutDefaults.secondary.right.charges
										res_options.args.layout.args.secondaryAuras.args.ResetSecondaryLayout.disabled = true
										res_options.args.layout.args.secondaryAuras.args.ResetSecondaryLayout.name = "|cFF666666"..L["Reset Secondary Layout"].."|r"
										Auras:UpdateTalents()
									end,
								},
							},
						},
					},
				},
			},
		}
	end

		
	return res_options
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
	options.args.display.args.ProgressBars.args.BuffTimerBars.args.Bloodlust.hidden = bloodlust
	options.args.display.args.ProgressBars.args.BuffTimerBars.args.Heroism.hidden = heroism
end



function Auras:UpdateInterfaceSettings()
	local spec = GetSpecialization()
	local factionGroup = UnitFactionGroup('player')

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
		CheckElementalDefaultValues(ele_options,'Cooldowns')
		CheckElementalDefaultValues(ele_options,'Maelstrom')
		CheckElementalDefaultValues(ele_options,'Cast','castBar')
		CheckElementalDefaultValues(ele_options,'Channel','channelBar')
		CheckElementalDefaultValues(ele_options,'Settings')
		CheckElementalDefaultValues(ele_options,'Primary')
		CheckElementalDefaultValues(ele_options,'Secondary')
		CheckElementalDefaultValues(ele_options,'Icefury')
		
		ele_options.args.config.disabled = false
		ele_options.args.layout.disabled = false
		enh_options.args.config.disabled = true
		enh_options.args.layout.disabled = true
		res_options.args.config.disabled = true
		res_options.args.layout.disabled = true
	elseif (spec == 2) then
		CheckEnhancementDefaultValues(enh_options,'Cooldowns')
		CheckEnhancementDefaultValues(enh_options,'Maelstrom','All')
		CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
		CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
		CheckEnhancementDefaultValues(enh_options,'Settings')
		CheckEnhancementDefaultValues(enh_options,'Primary')
		CheckEnhancementDefaultValues(enh_options,'Secondary')
		
		ele_options.args.config.disabled = true
		ele_options.args.layout.disabled = true
		enh_options.args.config.disabled = false
		enh_options.args.layout.disabled = false
		res_options.args.config.disabled = true
		res_options.args.layout.disabled = true
	elseif (spec == 3) then
		CheckRestorationDefaultValues(res_options,'Cooldowns')
		CheckRestorationDefaultValues(res_options,'Settings')
		CheckRestorationDefaultValues(res_options,'Primary')
		CheckRestorationDefaultValues(res_options,'Secondary')
		CheckRestorationDefaultValues(res_options,'Earthen Shield')
		CheckRestorationDefaultValues(res_options,'Mana Bar')
		CheckRestorationDefaultValues(res_options,'Cast','castBar')
		CheckRestorationDefaultValues(res_options,'Channel','channelBar')
		CheckRestorationDefaultValues(res_options,'Tidal Waves')
		
		ele_options.args.config.disabled = true
		ele_options.args.layout.disabled = true
		enh_options.args.config.disabled = true
		enh_options.args.layout.disabled = true
		res_options.args.config.disabled = false
		res_options.args.layout.disabled = false
	end
	
end

InterfaceOptionsFrame:HookScript("OnShow",function(self)
	Auras:UpdateInterfaceSettings()
end)

--[[InterfaceOptionsFrame:HookScript("OnHide",function(self)
	local db = Auras.db.char
	
	db.elements[1].statusbars.maelstromBar.adjust.isEnabled = false
	db.elements[1].statusbars.castBar.adjust.isEnabled = false
	db.elements[1].statusbars.channelBar.adjust.isEnabled = false
	db.elements[1].statusbars.icefuryBar.adjust.isEnabled = false
	
	db.elements[2].statusbars.maelstromBar.adjust.isEnabled = false
	db.elements[2].statusbars.castBar.adjust.isEnabled = false
	db.elements[2].statusbars.channelBar.adjust.isEnabled = false
	
	db.elements[3].statusbars.manaBar.adjust.isEnabled = false
	db.elements[3].statusbars.castBar.adjust.isEnabled = false
	db.elements[3].statusbars.channelBar.adjust.isEnabled = false
	db.elements[3].statusbars.earthenShieldBar.adjust.isEnabled = false
	db.elements[3].statusbars.tidalWavesBar.adjust.isEnabled = false
end)]]


