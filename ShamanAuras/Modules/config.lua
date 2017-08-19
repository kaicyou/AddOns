local SSA, Auras, L, LSM = unpack(select(2,...))
Auras.version = GetAddOnMetadata(..., 'Version')

local split, tonumber = string.split, tonumber
local upper = string.upper

--[[----------------------------------------------------------------
	Constants
------------------------------------------------------------------]]
local FRAME_ANCHOR_OPTIONS = {
	["TOPLEFT"] = L["OPTION_TOP_LEFT"],
	["TOP"] = L["OPTION_TOP"],
	["TOPRIGHT"] = L["OPTION_TOP_RIGHT"],
	["LEFT"] = L["OPTION_LEFT"],
	["CENTER"] = L["OPTION_CENTER"],
	["RIGHT"] = L["OPTION_RIGHT"],
	["BOTTOMLEFT"] = L["OPTION_BOTTOM_LEFT"],
	["BOTTOM"] = L["OPTION_BOTTOM"],
	["BOTTOMRIGHT"] = L["OPTION_BOTTOM_RIGHT"],
}

local FONT_OUTLINES = {
	[""] = NONE,
	["OUTLINE"] = L["OPTION_OUTLINE"],
	["THICKOUTLINE"] = L["OPTION_OUTLINE_THICK"],
	["MONOCHROME"] = L["OPTION_OUTLINE_MONOCHROME"],
	["OUTLINE, MONOCHROME"] = L["OPTION_OUTLINE_MONOCHROME_OUTLINE"],
	["THICKOUTLINE, MONOCHROME"] = L["OPTION_OUTLINE_MONOCHROME_THICK"],
}

local ORIENTATION = {
	["Horizontal"] = L["OPTION_HORIZONTAL"],
	["Vertical"] = L["OPTION_VERTICAL"],
}

local ICON_JUSTIFY = {
	["LEFT"] = L["OPTION_LEFT"],
	["RIGHT"] = L["OPTION_RIGHT"],
}

local TIDAL_WAVES_OPTIONS = {
	["Always"] = ALWAYS,
	["Target & On Heal"] = L["OPTION_TARGET_HEAL"],
	["Target Only"] = L["OPTION_TARGET_ONLY"],
	["On Heal Only"] = L["OPTION_HEAL_ONLY"],
	["Never"] = NEVER,
}

local COOLDOWN_OPTIONS = {
	["primary;1"] = PRIMARY.." #1",
	["primary;2"] = PRIMARY.." #2",
	["primary;3"] = PRIMARY.." #3",
	["secondary;1"] = SECONDARY.." #1",
	["secondary;2"] = SECONDARY.." #2",
}

local TIME_FORMATS = {
	["full"] = "2:25",
	["short"] = "2m",
}


--[[----------------------------------------------------------------
	Copy font options from other cooldown groups.
------------------------------------------------------------------]]
local function CopyCooldownOptions(value,spec,group,subgroup)
	local grp,subGrp = split(";",value)
	local src = Auras.db.char.elements[spec].cooldowns[grp][tonumber(subGrp)].text
	local dest = Auras.db.char.elements[spec].cooldowns[group][subgroup].text
	
	dest.justify = src.justify
	dest.x = src.x
	dest.y = src.y
	dest.font.name = src.font.name
	dest.font.size = src.font.size
	dest.font.flag = src.font.flag
	dest.font.color.r = src.font.color.r
	dest.font.color.g = src.font.color.g
	dest.font.color.b = src.font.color.b
	dest.font.color.a = src.font.color.a
	dest.font.shadow.isEnabled = src.font.shadow.isEnabled
	dest.font.shadow.offset.x = src.font.shadow.offset.x
	dest.font.shadow.offset.y = src.font.shadow.offset.y
	dest.font.shadow.color.r = src.font.shadow.color.r
	dest.font.shadow.color.g = src.font.shadow.color.g
	dest.font.shadow.color.b = src.font.shadow.color.b
	dest.font.shadow.color.a = src.font.shadow.color.a
end

--[[----------------------------------------------------------------
	Copy formatting options from other cooldown groups.
------------------------------------------------------------------]]
local function CopyCooldownFormatting(value,spec,group,subgroup)
	local grp,subGrp = split(";",value)
	local src = Auras.db.char.elements[spec].cooldowns[grp][tonumber(subGrp)].text
	local dest = Auras.db.char.elements[spec].cooldowns[group][subgroup].text
	
	dest.formatting.length = src.formatting.length
	dest.formatting.decimals = src.formatting.decimals
	dest.formatting.alert.isEnabled = src.formatting.alert.isEnabled
	dest.formatting.alert.threshold = src.formatting.alert.threshold
	dest.formatting.alert.animate = src.formatting.alert.animate
	dest.formatting.alert.color.r = src.formatting.alert.color.r
	dest.formatting.alert.color.g = src.formatting.alert.color.g
	dest.formatting.alert.color.b = src.formatting.alert.color.b
	dest.formatting.alert.color.a = src.formatting.alert.color.a
end

--[[----------------------------------------------------------------
	Setup progress bar formatting.
------------------------------------------------------------------]]
local function SetBarOptions(db,option,text1,text2,spark,timer)
	if (db.adjust.isEnabled) then
	
		if (spark) then
			option.iconSpark.disabled = false
		end
		
		if (db[text1].isDisplayText) then
			option[text1].disabled = false
		else
			option[text1].disabled = true
		end

		if (db[text1].font.shadow.isEnabled and db[text1].isDisplayText) then
			option[text1].args.shadow.args.shadowColor.disabled = false
			option[text1].args.shadow.args.shadowX.disabled = false
			option[text1].args.shadow.args.shadowY.disabled = false
		else
			option[text1].args.shadow.args.shadowColor.disabled = true
			option[text1].args.shadow.args.shadowX.disabled = true
			option[text1].args.shadow.args.shadowY.disabled = true
		end
		
		if (text2) then
			if (db[text2].isDisplayText) then
				option[text2].disabled = false
			else
				option[text2].disabled = true
			end
			
			if (db[text2].font.shadow.isEnabled and db[text2].isDisplayText) then
				option[text2].args.shadow.args.shadowColor.disabled = false
				option[text2].args.shadow.args.shadowX.disabled = false
				option[text2].args.shadow.args.shadowY.disabled = false
			else
				option[text2].args.shadow.args.shadowColor.disabled = true
				option[text2].args.shadow.args.shadowX.disabled = true
				option[text2].args.shadow.args.shadowY.disabled = true
			end
		end
	
		if (db.adjust.showBG) then
			option.layout.args.backgroundColor.disabled = false
			option.layout.args.backgroundTexture.disabled = false
		else
			option.layout.args.backgroundColor.disabled = true
			option.layout.args.backgroundTexture.disabled = true
		end
		
		option.layout.disabled = false
	else
		if (spark) then
			option.iconSpark.disabled = true
		end
		
		option[text1].disabled = true
		option[text1].args.shadow.args.shadowColor.disabled = true
		option[text1].args.shadow.args.shadowX.disabled = true
		option[text1].args.shadow.args.shadowY.disabled = true
		
		if (text2) then
			option[text2].disabled = true
			option[text2].args.shadow.args.shadowColor.disabled = true
			option[text2].args.shadow.args.shadowX.disabled = true
			option[text2].args.shadow.args.shadowY.disabled = true
		end
		
		if (timer) then
			option.layout.args.timerColor.disabled = true
			option.layout.args.timerTexture.disabled = true
		end
		option.layout.args.backgroundColor.disabled = true
		option.layout.args.backgroundTexture.disabled = true
		option.layout.disabled = true
	end	
		
	if (spark) then
		if (db.icon.isEnabled and db.adjust.isEnabled) then
			option.iconSpark.args.iconJustify.disabled = false
		else
			option.iconSpark.args.iconJustify.disabled = true
		end
	end
end

--[[----------------------------------------------------------------
	Compare current values with default values to determine if 
	reset buttons should be enabled or disabled.
------------------------------------------------------------------]]
local function GetResetButtonState(db,default,text1,text2,bg,fg,layout,timer)
	local isTextOne,isTextTwo
	local isBG,isFG
	local isLayout,isTimer
	
	if (text1) then
		if(not db[text1].isDisplayText or
		db[text1].x ~= default[text1].x or
		db[text1].y ~= default[text1].y or
		db[text1].font.name ~= default[text1].font.name or
		db[text1].font.size ~= default[text1].font.size or
		db[text1].font.flag ~= default[text1].font.flag or
		db[text1].font.color.r ~= default[text1].font.color.r or
		db[text1].font.color.g ~= default[text1].font.color.g or
		db[text1].font.color.b ~= default[text1].font.color.b or
		db[text1].font.color.a ~= default[text1].font.color.a or
		db[text1].font.shadow.isEnabled or
		db[text1].font.shadow.offset.x ~= default[text1].font.shadow.offset.x or
		db[text1].font.shadow.offset.y ~= default[text1].font.shadow.offset.y or
		db[text1].font.shadow.color.r ~= default[text1].font.shadow.color.r or
		db[text1].font.shadow.color.g ~= default[text1].font.shadow.color.g or
		db[text1].font.shadow.color.b ~= default[text1].font.shadow.color.b or
		db[text1].font.shadow.color.a ~= default[text1].font.shadow.color.a or
		db[text1].justify ~= default[text1].justify) then
			isTextOne = false
		else
			isTextOne = true
		end
	end
	
	if (text2) then
		if(not db[text2].isDisplayText or
		db[text2].x ~= default[text2].x or
		db[text2].y ~= default[text2].y or
		db[text2].font.name ~= default[text2].font.name or
		db[text2].font.size ~= default[text2].font.size or
		db[text2].font.flag ~= default[text2].font.flag or
		db[text2].font.color.r ~= default[text2].font.color.r or
		db[text2].font.color.g ~= default[text2].font.color.g or
		db[text2].font.color.b ~= default[text2].font.color.b or
		db[text2].font.color.a ~= default[text2].font.color.a or
		db[text2].font.shadow.isEnabled or
		db[text2].font.shadow.offset.x ~= default[text2].font.shadow.offset.x or
		db[text2].font.shadow.offset.y ~= default[text2].font.shadow.offset.y or
		db[text2].font.shadow.color.r ~= default[text2].font.shadow.color.r or
		db[text2].font.shadow.color.g ~= default[text2].font.shadow.color.g or
		db[text2].font.shadow.color.b ~= default[text2].font.shadow.color.b or
		db[text2].font.shadow.color.a ~= default[text2].font.shadow.color.a or
		db[text2].justify ~= default[text2].justify) then
			isTextTwo = false
		else
			isTextTwo = true
		end
	end
	
	if (bg) then
		if (db.background.texture ~= default.background.texture or
		db.background.color.r ~= default.background.color.r or
		db.background.color.g ~= default.background.color.g or
		db.background.color.b ~= default.background.color.b or
		db.background.color.a ~= default.background.color.a) then
			isBG = false
		else
			isBG = true
		end
	end
	
	if (fg) then
		if (db.foreground.color.r ~= default.foreground.color.r or
		db.foreground.color.g ~= default.foreground.color.g or
		db.foreground.color.b ~= default.foreground.color.b or
		db.foreground.texture ~= default.foreground.texture) then
			isFG = false
		else
			isFG = true
		end
	end
	
	if (timer) then
		if (db.timerBar.color.r ~= default.timerBar.color.r or
		db.timerBar.color.g ~= default.timerBar.color.g or
		db.timerBar.color.b ~= default.timerBar.color.b or
		db.timerBar.color.a ~= default.timerBar.color.a or
		db.timerBar.texture ~= default.timerBar.texture) then
			isTimer = false
		else
			isTimer = false
		end
	end
	
	if (layout) then
		if (db.layout.width ~= default.layout.width or
		db.layout.height ~= default.layout.height or
		db.layout.strata ~= default.layout.strata) then
			isLayout = false
		else
			isLayout = true
		end
	end
	
	if ((not isTextOne and text1) or
		(not isTextTwo and text2) or
		(not isBG and bg) or
		(not isFG and fg) or
		(not isLayout and layout) or
		(not isTimer and timer)) then
		return false
	else
		return true
	end
end

--[[----------------------------------------------------------------
	Configure cooldown customization interface by enabling and 
	disabling specific controls based on existing settings.
------------------------------------------------------------------]]
local function SetCooldownOptions(spec,options)
	local db = Auras.db.char
	local cd = db.elements[spec].cooldowns
	local default = db.elements.defaults[spec].cooldowns
	local option = options.args.cooldowns.args
	
	if (cd.sweep and cd.isEnabled) then
		option.GCD.disabled = false
		option.inverse.disabled = false
		option.bling.disabled = false
	else
		option.GCD.disabled = true
		option.inverse.disabled = true
		option.bling.disabled = true
	end
	
	local grp,subGrp = split(";",cd.selected or 'primary;1')
	local selected = ''
	
	if (cd.selected == "primary;1") then
		selected = 'p1'
		cd.primary[1].isPreview = true
		cd.primary[2].isPreview = false
		cd.primary[3].isPreview = false
		cd.secondary[1].isPreview = false
		cd.secondary[2].isPreview = false
		option.p1_formatting.hidden = false
		option.p2_formatting.hidden = true
		option.p3_formatting.hidden = true
		option.s1_formatting.hidden = true
		option.s2_formatting.hidden = true
		option.p1_adjustGroup.hidden = false
		option.p2_adjustGroup.hidden = true
		option.p3_adjustGroup.hidden = true
		option.s1_adjustGroup.hidden = true
		option.s2_adjustGroup.hidden = true
	elseif (cd.selected == "primary;2") then
		selected = 'p2'
		cd.primary[1].isPreview = false
		cd.primary[2].isPreview = true
		cd.primary[3].isPreview = false
		cd.secondary[1].isPreview = false
		cd.secondary[2].isPreview = false
		option.p1_formatting.hidden = true
		option.p2_formatting.hidden = false
		option.p3_formatting.hidden = true
		option.s1_formatting.hidden = true
		option.s2_formatting.hidden = true
		option.p1_adjustGroup.hidden = true
		option.p2_adjustGroup.hidden = false
		option.p3_adjustGroup.hidden = true
		option.s1_adjustGroup.hidden = true
		option.s2_adjustGroup.hidden = true
	elseif (cd.selected == "primary;3") then
		selected = 'p3'
		cd.primary[1].isPreview = false
		cd.primary[2].isPreview = false
		cd.primary[3].isPreview = true
		cd.secondary[1].isPreview = false
		cd.secondary[2].isPreview = false
		option.p1_formatting.hidden = true
		option.p2_formatting.hidden = true
		option.p3_formatting.hidden = false
		option.s1_formatting.hidden = true
		option.s2_formatting.hidden = true
		option.p1_adjustGroup.hidden = true
		option.p2_adjustGroup.hidden = true
		option.p3_adjustGroup.hidden = false
		option.s1_adjustGroup.hidden = true
		option.s2_adjustGroup.hidden = true
	elseif (cd.selected == "secondary;1") then
		selected = 's1'
		cd.primary[1].isPreview = false
		cd.primary[2].isPreview = false
		cd.primary[3].isPreview = false
		cd.secondary[1].isPreview = true
		cd.secondary[2].isPreview = false
		option.p1_formatting.hidden = true
		option.p2_formatting.hidden = true
		option.p3_formatting.hidden = true
		option.s1_formatting.hidden = false
		option.s2_formatting.hidden = true
		option.p1_adjustGroup.hidden = true
		option.p2_adjustGroup.hidden = true
		option.p3_adjustGroup.hidden = true
		option.s1_adjustGroup.hidden = false
		option.s2_adjustGroup.hidden = true
	elseif (cd.selected == "secondary;2") then
		selected = 's2'
		cd.primary[1].isPreview = false
		cd.primary[2].isPreview = false
		cd.primary[3].isPreview = false
		cd.secondary[1].isPreview = false
		cd.secondary[2].isPreview = true
		option.p1_formatting.hidden = true
		option.p2_formatting.hidden = true
		option.p3_formatting.hidden = true
		option.s1_formatting.hidden = true
		option.s2_formatting.hidden = false
		option.p1_adjustGroup.hidden = true
		option.p2_adjustGroup.hidden = true
		option.p3_adjustGroup.hidden = true
		option.s1_adjustGroup.hidden = true
		option.s2_adjustGroup.hidden = false
	end
	
	if (cd.adjust and cd.isEnabled) then
		option.p1_adjustGroup.disabled = false
		option.p2_adjustGroup.disabled = false
		option.p3_adjustGroup.disabled = false
		option.s1_adjustGroup.disabled = false
		option.s2_adjustGroup.disabled = false
	else
		cd.primary[1].isPreview = false
		cd.primary[2].isPreview = false
		cd.primary[3].isPreview = false
		cd.secondary[1].isPreview = false
		cd.secondary[2].isPreview = false
		option.p1_adjustGroup.disabled = true
		option.p2_adjustGroup.disabled = true
		option.p3_adjustGroup.disabled = true
		option.s1_adjustGroup.disabled = true
		option.s2_adjustGroup.disabled = true
	end
	
	if (cd.isEnabled) then
		option.text.disabled = false
		option.sweep.disabled = false
		option.group.disabled = false
		option.adjustToggle.disabled = false
	else
		if (cd.adjust) then
			cd.adjust = false
		end
		option.text.disabled = true
		option.sweep.disabled = true
		option.group.disabled = true
		option.adjustToggle.disabled = true
	end
	
	if (cd[grp][tonumber(subGrp)].text.formatting.alert.isEnabled) then
		option[selected.."_formatting"].args.alertFlash.disabled = false
		option[selected.."_formatting"].args.alertColor.disabled = false
		option[selected.."_formatting"].args.alertThreshold.disabled = false
	else
		option[selected.."_formatting"].args.alertFlash.disabled = true
		option[selected.."_formatting"].args.alertColor.disabled = true
		option[selected.."_formatting"].args.alertThreshold.disabled = true
	end
	
	if (cd[grp][tonumber(subGrp)].text.font.shadow.isEnabled and cd.adjust) then
		option[selected.."_adjustGroup"].args.shadow.args.shadowColor.disabled = false
		option[selected.."_adjustGroup"].args.shadow.args.shadowX.disabled = false
		option[selected.."_adjustGroup"].args.shadow.args.shadowY.disabled = false
	else
		option[selected.."_adjustGroup"].args.shadow.args.shadowColor.disabled = true
		option[selected.."_adjustGroup"].args.shadow.args.shadowX.disabled = true
		option[selected.."_adjustGroup"].args.shadow.args.shadowY.disabled = true
	end
	
	if (not GetResetButtonState(cd.primary[1],default,'text')) then
		option.p1_adjustGroup.args.reset.disabled = false
		option.p1_adjustGroup.args.reset.name = "|cFFFFCC00"..RESET_TO_DEFAULT.."|r"
	else
		option.p1_adjustGroup.args.reset.disabled = true
		option.p1_adjustGroup.args.reset.name = "|cFF666666"..RESET_TO_DEFAULT.."|r"
	end
	
	if (not GetResetButtonState(cd.primary[2],default,'text')) then
		option.p2_adjustGroup.args.reset.disabled = false
		option.p2_adjustGroup.args.reset.name = "|cFFFFCC00"..RESET_TO_DEFAULT.."|r"
	else
		option.p2_adjustGroup.args.reset.disabled = true
		option.p2_adjustGroup.args.reset.name = "|cFF666666"..RESET_TO_DEFAULT.."|r"
	end
	
	if (not GetResetButtonState(cd.primary[3],default,'text')) then
		option.p3_adjustGroup.args.reset.disabled = false
		option.p3_adjustGroup.args.reset.name = "|cFFFFCC00"..RESET_TO_DEFAULT.."|r"
	else
		option.p3_adjustGroup.args.reset.disabled = true
		option.p3_adjustGroup.args.reset.name = "|cFF666666"..RESET_TO_DEFAULT.."|r"
	end
	
	if (not GetResetButtonState(cd.secondary[1],default,'text')) then
		option.s1_adjustGroup.args.reset.disabled = false
		option.s1_adjustGroup.args.reset.name = "|cFFFFCC00"..RESET_TO_DEFAULT.."|r"
	else
		option.s1_adjustGroup.args.reset.disabled = true
		option.s1_adjustGroup.args.reset.name = "|cFF666666"..RESET_TO_DEFAULT.."|r"
	end
	
	if (not GetResetButtonState(cd.secondary[2],default,'text')) then
		option.s2_adjustGroup.args.reset.disabled = false
		option.s2_adjustGroup.args.reset.name = "|cFFFFCC00"..RESET_TO_DEFAULT.."|r"
	else
		option.s2_adjustGroup.args.reset.disabled = true
		option.s2_adjustGroup.args.reset.name = "|cFF666666"..RESET_TO_DEFAULT.."|r"
	end
end

--[[----------------------------------------------------------------
	Check all Elemental default values upon opening the 
	configuration window and when making any customization changes
------------------------------------------------------------------]]
local function CheckElementalDefaultValues(options,group,subgroup)
	local general = options.args.bars.args.general.args
	local maelstrom = options.args.bars.args.maelstromBar.args
	local castBar = options.args.bars.args.castBar.args
	local icefuryBar = options.args.bars.args.icefuryBar.args
	
	
	if (group == "Cooldowns") then
		SetCooldownOptions(1,options)
	elseif (group == "Cast" or group == "Channel") then
		local db = Auras.db.char
		local bar = db.elements[1].statusbars[subgroup]
		local default = db.elements.defaults[1].statusbars[subgroup]
		
		local option = options.args.bars.args[subgroup].args
		
		SetBarOptions(bar,option,'nametext','timetext',true)

		if (bar.alphaCombat ~= default.alphaCombat or
			bar.alphaOoC ~= default.alphaOoC or
			
			not bar.icon.isEnabled or
			bar.icon.justify ~= default.icon.justify or
			not bar.spark or
			
			not GetResetButtonState(bar,default,'nametext','timetext',true,true,true)) then
			option.reset.disabled = false
			option.reset.name = "|cFFFFCC00"..L["BUTTON_RESET_STATUSBAR_"..upper(group)].."|r"
		else
			option.reset.disabled = true
			option.reset.name = "|cFF666666"..L["BUTTON_RESET_STATUSBAR_"..upper(group)].."|r"
		end
	elseif (group == "Maelstrom") then
		local db = Auras.db.char
		local bar = db.elements[1].statusbars.maelstromBar
		local default = db.elements.defaults[1].statusbars.maelstromBar
		local option = options.args.bars.args.maelstromBar.args
		
		SetBarOptions(bar,option,'text')

		if (bar.isEnabled) then
			options.args.bars.args.maelstromBar.disabled = false
		else
			options.args.bars.args.maelstromBar.disabled = true
		end

		option.general.args.threshold.max = UnitPowerMax('player',11)
		
		if (bar.alphaCombat ~= default.alphaCombat or
			bar.alphaOoC ~= default.alphaOoC or
			bar.alphaTar ~= default.alphaTar or
			bar.threshold ~= default.threshold or
			not bar.animate or
			
			not GetResetButtonState(bar,default,'text',nil,true,true,true)) then
			option.reset.disabled = false
			option.reset.name = "|cFFFFCC00"..L["BUTTON_RESET_STATUSBAR_MAELSTROM"].."|r"
		else
			option.reset.disabled = true
			option.reset.name = "|cFF666666"..L["BUTTON_RESET_STATUSBAR_MAELSTROM"].."|r"
		end
	elseif (group == 'Settings') then
		local db = Auras.db.char
		local settings = db.settings[1]
		local defaults = Auras.db.char.settings.defaults
		local option = options.args.general.args.settings.args
		
		if (settings.OoCAlpha ~= defaults.OoCAlpha or 
			settings.flameShock ~= defaults[1].flameShock or 
			settings.totemMastery ~= defaults[1].totemMastery or 
			settings.OoRColor.r ~= defaults.OoRColor.r or 
			settings.OoRColor.g ~= defaults.OoRColor.g or 
			settings.OoRColor.b ~= defaults.OoRColor.b or 
			settings.OoRColor.a ~= defaults.OoRColor.a) then
			option.reset.disabled = false
			option.reset.name = "|cFFFFCC00"..L["BUTTON_RESET_SETTINGS"].."|r"
		else
			option.reset.disabled = true
			option.reset.name = "|cFF666666"..L["BUTTON_RESET_SETTINGS"].."|r"
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
			options.args.layout.args.primaryAuras.args.ResetPrimaryLayout.name = "|cFFFFCC00"..L["BUTTON_RESET_LAYOUT_PRIMARY"].."|r"
		else
			options.args.layout.args.primaryAuras.args.ResetPrimaryLayout.disabled = true
			options.args.layout.args.primaryAuras.args.ResetPrimaryLayout.name = "|cFF666666"..L["BUTTON_RESET_LAYOUT_PRIMARY"].."|r"
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
			options.args.layout.args.secondaryAuras.args.ResetSecondaryLayout.name = "|cFFFFCC00"..L["BUTTON_RESET_LAYOUT_SECONDARY"].."|r"
		else
			options.args.layout.args.secondaryAuras.args.ResetSecondaryLayout.disabled = true
			options.args.layout.args.secondaryAuras.args.ResetSecondaryLayout.name = "|cFF666666"..L["BUTTON_RESET_LAYOUT_SECONDARY"].."|r"
		end
	elseif (group == "Icefury") then
		local db = Auras.db.char
		local bar = db.elements[1].statusbars.icefuryBar
		local default = db.elements.defaults[1].statusbars.icefuryBar

		local option = options.args.bars.args.icefuryBar.args
		
		SetBarOptions(bar,option,'counttext','timetext',false,true)

		if (bar.isEnabled) then
			options.args.bars.args.icefuryBar.disabled = false
		else
			options.args.bars.args.icefuryBar.disabled = true
		end
		
		if (bar.alphaCombat ~= default.alphaCombat or
			bar.alphaOoC ~= default.alphaOoC or
			bar.alphaTar ~= default.alphaTar or
			
			not GetResetButtonState(bar,default,'counttext','timetext',true,true,true,true)) then
			option.reset.disabled = false
			option.reset.name = "|cFFFFCC00"..L["BUTTON_RESET_STATUSBAR_ICEFURY"].."|r"
		else
			option.reset.disabled = true
			option.reset.name = "|cFF666666"..L["BUTTON_RESET_STATUSBAR_ICEFURY"].."|r"
		end
	end
end

--[[----------------------------------------------------------------
	Check all Enhancement default values upon opening the 
	configuration window and when making any customization changes
------------------------------------------------------------------]]
local function CheckEnhancementDefaultValues(options,group,subgroup)
	if (group == "Cooldowns") then
		SetCooldownOptions(2,options)
	elseif (group == "Cast" or group == "Channel") then
		local db = Auras.db.char
		local bar = db.elements[2].statusbars[subgroup]
		local default = db.elements.defaults[2].statusbars[subgroup]
		
		local option = options.args.bars.args[subgroup].args
		
		SetBarOptions(bar,option,'nametext','timetext',true)

		if (bar.alphaCombat ~= default.alphaCombat or
			bar.alphaOoC ~= default.alphaOoC or
			
			not bar.icon.isEnabled or
			bar.icon.justify ~= default.icon.justify or
			not bar.spark or
			
			not GetResetButtonState(bar,default,'nametext','timetext',true,true,true)) then
			option.reset.disabled = false
			option.reset.name = "|cFFFFCC00"..L["BUTTON_RESET_STATUSBAR_"..upper(group)].."|r"
		else
			option.reset.disabled = true
			option.reset.name = "|cFF666666"..L["BUTTON_RESET_STATUSBAR_"..upper(group)].."|r"
		end
	elseif (group == "Maelstrom") then
		local db = Auras.db.char
		local bar = db.elements[2].statusbars.maelstromBar
		local default = db.elements.defaults[2].statusbars.maelstromBar
		
		local option = options.args.bars.args.maelstromBar.args

		SetBarOptions(bar,option,'text')
		
		if (bar.isEnabled) then
			options.args.bars.args.maelstromBar.disabled = false
		else
			options.args.bars.args.maelstromBar.disabled = true
		end

		option.general.args.threshold.max = UnitPowerMax('player',11)
		
		if (bar.alphaCombat ~= default.alphaCombat or
			bar.alphaOoC ~= default.alphaOoC or
			bar.alphaTar ~= default.alphaTar or
			bar.threshold ~= default.threshold or
			not bar.animate or
			
			not GetResetButtonState(bar,default,'text',nil,true,true,true)) then
			option.reset.disabled = false
			option.reset.name = "|cFFFFCC00"..L["BUTTON_RESET_STATUSBAR_MAELSTROM"].."|r"
		else
			option.reset.disabled = true
			option.reset.name = "|cFF666666"..L["BUTTON_RESET_STATUSBAR_MAELSTROM"].."|r"
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
			options.args.general.args.settings.args.reset.disabled = false
			options.args.general.args.settings.args.reset.name = "|cFFFFCC00"..L["BUTTON_RESET_SETTINGS"].."|r"
		else
			options.args.general.args.settings.args.reset.disabled = true
			options.args.general.args.settings.args.reset.name = "|cFF666666"..L["BUTTON_RESET_SETTINGS"].."|r"
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
			options.args.layout.args.primaryAuras.args.ResetPrimaryLayout.name = "|cFFFFCC00"..L["BUTTON_RESET_LAYOUT_PRIMARY"].."|r"
		else
			options.args.layout.args.primaryAuras.args.ResetPrimaryLayout.disabled = true
			options.args.layout.args.primaryAuras.args.ResetPrimaryLayout.name = "|cFF666666"..L["BUTTON_RESET_LAYOUT_PRIMARY"].."|r"
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
			options.args.layout.args.secondaryAuras.args.ResetSecondaryLayout.name = "|cFFFFCC00"..L["BUTTON_RESET_LAYOUT_SECONDARY"].."|r"
		else
			options.args.layout.args.secondaryAuras.args.ResetSecondaryLayout.disabled = true
			options.args.layout.args.secondaryAuras.args.ResetSecondaryLayout.name = "|cFF666666"..L["BUTTON_RESET_LAYOUT_SECONDARY"].."|r"
		end
	end
end

--[[----------------------------------------------------------------
	Check all Restoration default values upon opening the 
	configuration window and when making any customization changes
------------------------------------------------------------------]]
local function CheckRestorationDefaultValues(options,group,subgroup)
	if (group == "Cooldowns") then
		SetCooldownOptions(3,options)
	elseif (group == "Cast" or group == "Channel") then
		local db = Auras.db.char
		local bar = db.elements[3].statusbars[subgroup]
		local default = db.elements.defaults[3].statusbars[subgroup]
		
		local option = options.args.bars.args[subgroup].args
		
		SetBarOptions(bar,option,'nametext','timetext',true)

		if (bar.alphaCombat ~= default.alphaCombat or
			bar.alphaOoC ~= default.alphaOoC or
			
			not bar.icon.isEnabled or
			bar.icon.justify ~= default.icon.justify or
			not bar.spark or
			
			not GetResetButtonState(bar,default,'nametext','timetext',true,true,true)) then
			option.reset.disabled = false
			option.reset.name = "|cFFFFCC00"..L["BUTTON_RESET_STATUSBAR_"..upper(group)].."|r"
		else
			option.reset.disabled = true
			option.reset.name = "|cFF666666"..L["BUTTON_RESET_STATUSBAR_"..upper(group)].."|r"
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
			options.args.bars.args.general.args.settings.args.reset.disabled = false
			options.args.bars.args.general.args.settings.args.reset.name = "|cFFFFCC00"..L["BUTTON_RESET_SETTINGS"].."|r"
		else
			options.args.general.args.settings.args.reset.disabled = true
			options.args.general.args.settings.args.reset.name = "|cFF666666"..L["BUTTON_RESET_SETTINGS"].."|r"
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
			options.args.layout.args.primaryAuras.args.ResetPrimaryLayout.name = "|cFFFFCC00"..L["BUTTON_RESET_LAYOUT_PRIMARY"].."|r"
		else
			options.args.layout.args.primaryAuras.args.ResetPrimaryLayout.disabled = true
			options.args.layout.args.primaryAuras.args.ResetPrimaryLayout.name = "|cFF666666"..L["BUTTON_RESET_LAYOUT_PRIMARY"].."|r"
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
			options.args.layout.args.secondaryAuras.args.ResetSecondaryLayout.name = "|cFFFFCC00"..L["BUTTON_RESET_LAYOUT_SECONDARY"].."|r"
		else
			options.args.layout.args.secondaryAuras.args.ResetSecondaryLayout.disabled = true
			options.args.layout.args.secondaryAuras.args.ResetSecondaryLayout.name = "|cFF666666"..L["BUTTON_RESET_LAYOUT_SECONDARY"].."|r"
		end
	elseif (group == "Earthen Shield") then
		local db = Auras.db.char
		local bar = db.elements[3].statusbars.earthenShieldBar
		local default = db.elements.defaults[3].statusbars.earthenShieldBar
		
		local option = options.args.bars.args.earthenShieldBar.args
		
		SetBarOptions(bar,option,'healthtext','timetext',false,true)
		
		if (bar.isEnabled) then
			options.args.bars.args.earthenShieldBar.disabled = false
		else
			options.args.bars.args.earthenShieldBar.disabled = true
		end
		
		if (bar.alphaCombat ~= default.alphaCombat or
			bar.alphaOoC ~= default.alphaOoC or
			bar.alphaTar ~= default.alphaTar or
			
			not GetResetButtonState(bar,default,'healthtext','timetext',true,true,true,true)) then
			option.reset.disabled = false
			option.reset.name = "|cFFFFCC00"..L["BUTTON_RESET_STATUSBAR_EARTHEN_SHIELD"].."|r"
		else
			option.reset.disabled = true
			option.reset.name = "|cFF666666"..L["BUTTON_RESET_STATUSBAR_EARTHEN_SHIELD"].."|r"
		end
	elseif (group == "Mana") then
		local db = Auras.db.char
		local bar = db.elements[3].statusbars.manaBar
		local default = db.elements.defaults[3].statusbars.manaBar
		local option = options.args.bars.args.manaBar.args
		
		SetBarOptions(bar,option,'text')

		if (bar.isEnabled) then
			options.args.bars.args.manaBar.disabled = false
		else
			options.args.bars.args.manaBar.disabled = true
		end

		if (bar.alphaCombat ~= default.alphaCombat or
			bar.alphaOoC ~= default.alphaOoC or
			bar.alphaTar ~= default.alphaTar or
			
			not bar.grouping or 
			bar.precision ~= default.precision or
			
			not GetResetButtonState(bar,default,'text',nil,true,true,true)) then
			option.reset.disabled = false
			option.reset.name = "|cFFFFCC00"..L["BUTTON_RESET_STATUSBAR_MANA"].."|r"
		else
			option.reset.disabled = false
			option.reset.name = "|cFF666666"..L["BUTTON_RESET_STATUSBAR_MANA"].."|r"
		end
	elseif (group == "Tidal Waves") then
		local db = Auras.db.char
		local bar = db.elements[3].statusbars.tidalWavesBar
		local default = db.elements.defaults[3].statusbars.tidalWavesBar
		local option = options.args.bars.args.tidalWavesBar.args

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
			options.args.bars.args.tidalWavesBar.disabled = false
		else
			options.args.bars.args.tidalWavesBar.disabled = true
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
			option.reset.name = "|cFFFFCC00"..L["BUTTON_RESET_STATUSBAR_TIDAL_WAVES"].."|r"
		else
			option.reset.disabled = false
			option.reset.name = "|cFF666666"..L["BUTTON_RESET_STATUSBAR_TIDAL_WAVES"].."|r"
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
		local cooldownDefaults = db.elements.defaults[1].cooldowns
		local statusbarDefaults = db.elements.defaults[1].statusbars
		local frameDefaults = db.elements.defaults[1].frames
		
		-- Misc Vars
		local group,subgroup
		
		ele_options = {
			type = "group",
			childGroups = "tab",
			order = 1,
			name = L["LABEL_AURAS_ELEMENTAL"],
			desc = '',
			args = {
				display = {
					name = DISPLAY,
					order = 0,
					type = "group",
					args = {
						show = {
							order = 1,
							name = L["LABEL_SHOW_ELEMENTAL_AURAS"],
							desc = L["TOOLTIP_TOGGLE_ELEMENTAL_AURAS"],
							type = "toggle",
							get = function()
								return db.elements[1].isEnabled
							end,
							set = function(self,value)
								db.elements[1].isEnabled = value
								if (not value) then
									AuraGroup1:Hide()
								else
									AuraGroup1:Show()
								end
							end,
						},
						MajorAuras = {
							name = L["LABEL_AURAS_MAJOR"],
							type = "group",
							order = 2,
							guiInline = true,
							args = {
								AncestralGuidance = {
									order = 1,
									type = "toggle",
									name = Auras:GetSpellName(108281),
									get = function() 
										return auras.AncestralGuidance1
									end,
									set = function(self,value)
										auras.AncestralGuidance1 = value
										Auras:UpdateTalents()
									end,
								},
								Ascendance = {
									order = 2,
									type = "toggle",
									name = Auras:GetSpellName(114050),
									get = function() 
										return auras.Ascendance1
									end,
									set = function(self,value)
										auras.Ascendance1 = value
										Auras:UpdateTalents()
									end,
								},
								Concordance = {
									order = 3,
									type = "toggle",
									name = Auras:GetSpellName(242586),
									get = function()
										return auras.Concordance1
									end,
									set = function(self,value)
										auras.Concordance1 = value
										Auras:UpdateTalents()
									end,
								},
								Earthquake = {
									order = 4,
									type = "toggle",
									name = Auras:GetSpellName(61885),
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
									name = Auras:GetSpellName(8042),
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
									name = Auras:GetSpellName(117014),
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
									name = Auras:GetSpellName(16164),
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
									name = Auras:GetSpellName(16166),
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
									name = Auras:GetSpellName(198067),
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
									name = Auras:GetSpellName(188389),
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
									name = Auras:GetSpellName(210714),
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
									name = Auras:GetSpellName(51505),
									get = function()
										return auras.LavaBurst1
									end,
									set = function(self,value)
										auras.LavaBurst1 = value
										Auras:UpdateTalents()
									end,
								},
								LiquidMagmaTotem = {
									order = 13,
									type = "toggle",
									name = Auras:GetSpellName(192222),
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
									name = Auras:GetSpellName(191877),
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
									name = Auras:GetSpellName(192249),
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
									name = Auras:GetSpellName(205495),
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
							name = L["LABEL_AURAS_MINOR"],
							type = "group",
							order = 3,
							guiInline = true,
							args = {
								AstralShift = {
									order = 1,
									type = "toggle",
									name = Auras:GetSpellName(108271),
									get = function()
										return auras.AstralShift1
									end,
									set = function(self,value)
										auras.AstralShift1 = value
										Auras:UpdateTalents()
									end,
								},
								CleanseSpirit = {
									order = 2,
									type = "toggle",
									name = Auras:GetSpellName(51886),
									get = function()
										return auras.CleanseSpirit1
									end,
									set = function(self,value)
										auras.CleanseSpirit1 = value
										Auras:UpdateTalents()
									end,
								},
								EarthElemental = {
									order = 3,
									type = "toggle",
									name = Auras:GetSpellName(198103),
									get = function()
										return auras.EarthElemental
									end,
									set = function(self,value)
										auras.EarthElemental = value
										Auras:UpdateTalents()
									end,
								},
								EarthgrabTotem = {
									order = 4,
									type = "toggle",
									name = Auras:GetSpellName(51485),
									get = function()
										return auras.EarthgrabTotem1
									end,
									set = function(self,value)
										auras.EarthgrabTotem1 = value
										Auras:UpdateTalents()
									end,
								},
								GustOfWind = {
									order = 5,
									type = "toggle",
									name = Auras:GetSpellName(192063),
									get = function()
										return auras.GustWind1
									end,
									set = function(self,value)
										auras.GustWind1 = value
										Auras:UpdateTalents()
									end,
								},
								Hex = {
									order = 6,
									type = "toggle",
									name = Auras:GetSpellName(51514),
									get = function()
										return auras.Hex1
									end,
									set = function(self,value)
										auras.Hex1 = value
										Auras:UpdateTalents()
									end,
								},
								Thunderstorm = {
									order = 7,
									type = "toggle",
									name = Auras:GetSpellName(51490),
									get = function()
										return auras.Thunderstorm
									end,
									set = function(self,value)
										auras.Thunderstorm = value
										Auras:UpdateTalents()
									end,
								},
								LightningSurgeTotem = {
									order = 8,
									type = "toggle",
									name = Auras:GetSpellName(192058),
									get = function()
										return auras.LightningSurgeTotem1
									end,
									set = function(self,value)
										auras.LightningSurgeTotem1 = value
										Auras:UpdateTalents()
									end,
								},
								VoodooTotem = {
									order = 9,
									type = "toggle",
									name = Auras:GetSpellName(196932),
									get = function()
										return auras.VoodooTotem1
									end,
									set = function(self,value)
										auras.VoodooTotem1 = value
										Auras:UpdateTalents()
									end,
								},
								WindRushTotem = {
									order = 10,
									type = "toggle",
									name = Auras:GetSpellName(192077),
									get = function()
										return auras.WindRushTotem1
									end,
									set = function(self,value)
										auras.WindRushTotem1 = value
										Auras:UpdateTalents()
									end,
								},
								Windshear = {
									order = 11,
									type = "toggle",
									name = Auras:GetSpellName(57944),
									get = function() 
										return auras.WindShear1
									end,
									set = function(self,value)
										auras.WindShear1 = value
										Auras:UpdateTalents()
									end,
								},
							},
						},
						ProgressBars = {
							name = L["LABEL_PROGRESS_BARS"],
							type = "group",
							order = 4,
							guiInline = true,
							args = {
								BuffTimerBars = {
									name = L["LABEL_STATUSBAR_BUFF_TIMER"],
									type = "group",
									order = 1,
									guiInline = true,
									args = {
										AncestralGuidance = {
											order = 1,
											type = "toggle",
											name = Auras:GetSpellName(108281),
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
											name = Auras:GetSpellName(114050),
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
											name = Auras:GetSpellName(108271),
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
											name = Auras:GetSpellName(2825),
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
											name = Auras:GetSpellName(117014),
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
											name = Auras:GetSpellName(16166),
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
											name = Auras:GetSpellName(32182),
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
											name = Auras:GetSpellName(80353),
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
									name = L["LABEL_TIMERS_ELEMENTAL"],
									type = "group",
									order = 5,
									guiInline = true,
									args = {
										EarthElemental = {
											order = 1,
											type = "toggle",
											name = Auras:GetSpellName(198103),
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
											name = Auras:GetSpellName(198067),
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
											name = Auras:GetSpellName(192249),
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
									name = L["LABEL_TIMERS_TOTEM"],
									type = "group",
									order = 6,
									guiInline = true,
									args = {
										EarthgrabTotem = {
											order = 1,
											type = "toggle",
											name = Auras:GetSpellName(51485),
											get = function() 
												return timerbars.util.earthgrabTotem
											end,
											set = function(self,value)
												timerbars.util.earthgrabTotem = value
											end,
										},
										LiquidMagmaTotem = {
											order = 4,
											type = "toggle",
											name = Auras:GetSpellName(192222),
											get = function() 
												return timerbars.util.liquidMagmaTotem
											end,
											set = function(self,value)
												timerbars.util.liquidMagmaTotem = value
											end,
										},
										VoodooTotem = {
											order = 2,
											type = "toggle",
											name = Auras:GetSpellName(196932),
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
											name = Auras:GetSpellName(192077),
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
							name = L["TOOLTIP_TEXTURE_ALERTS"],
							type = "group",
							order = 5,
							guiInline = true,
							args = {
								TotemMastery = {
									order = 1,
									type = "toggle",
									name = Auras:GetSpellName(210643),
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
									name = L["LABEL_STORMKEEPER_ORBS"],
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
				general = {
					name = MAIN_MENU,
					order = 2,
					type = "group",
					childGroups = "tab",
					disabled = true,
					args = {
						settings = {
							name = L["LABEL_AURAS_SETTINGS"],
							type = "group",
							order = 3,
							guiInline = true,
							args = {
								OoCAlpha = {
									order = 1,
									type = "range",
									name = L["LABEL_ALPHA_NO_COMBAT"],
									desc = L["TOOLTIP_AURAS_ALPHA_NO_COMBAT"],
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
									name = Auras:GetSpellName(188838),
									desc = L["TOOLTIP_GLOW_TIME_TRIGGER"],
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
									name = Auras:GetSpellName(210643),
									desc = L["TOOLTIP_TOTEM_MASTERY_TRIGGER_TIMER"],
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
									name = L["LABEL_COLOR_NO_RANGE"],
									desc = L["TOOLTIP_COLOR_OUT_OF_RANGE"],
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
									width = "full",
								},
								reset = {
									order = 5,
									type = "execute",
									name = L["BUTTON_RESET_SETTINGS"],
									func = function()
										settings.flameShock = settingDefaults[1].flameShock
										settings.totemMastery = settingDefaults[1].totemMastery
										settings.OoCAlpha = settingDefaults.OoCAlpha
										settings.OoRColor.r = settingDefaults.OoRColor.r
										settings.OoRColor.g = settingDefaults.OoRColor.g
										settings.OoRColor.b = settingDefaults.OoRColor.b
										settings.OoRColor.a = settingDefaults.OoRColor.a
										ele_options.args.bars.args.general.args.settings.args.reset.disabled = true
										ele_options.args.bars.args.general.args.settings.args.reset.name = "|cFF666666"..L["BUTTON_RESET_SETTINGS"].."|r"
									end,
								},
							},
						},
					},
				},
				bars = {
					name = L["LABEL_PROGRESS_BARS"],
					order = 3,
					type = "group",
					childGroups = "tab",
					disabled = true,
					args = {
						general = {
							name = GENERAL,
							order = 5,
							inline = false,
							type = "group",
							args = {
								statusbars = {
									name = L["LABEL_STATUSBAR_MANAGER"],
									type = "group",
									order = 1,
									guiInline = true,
									args = {
										defaultBarToggle = {
											order = 1,
											name = L["LABEL_STATUSBAR_BLIZZARD"],
											desc = L["TOOLTIP_TOGGLE_BLIZZARD_BAR"],
											type = "toggle",
											get = function()
												return statusbars.defaultBar
											end,
											set = function(self,value)
												--[[local option = res_options.args.bars.args.manaBar
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
											name = L["TOGGLE_CAST_BAR"],
											desc = L["TOOLTIP_TOGGLE_CAST_BAR"],
											type = "toggle",
											get = function()
												return statusbars.castBar.isEnabled
											end,
											set = function(self,value)
												if (value) then
													ele_options.args.bars.args.castBar.disabled = false
												else
													ele_options.args.bars.args.castBar.disabled = true
												end
												
												statusbars.castBar.isEnabled = value
											end,
										},
										channelToggle = {
											order = 3,
											name = L["TOGGLE_CHANNEL_BAR"],
											desc = L["TOOLTIP_TOGGLE_CHANNEL_BAR"],
											type = "toggle",
											get = function()
												return statusbars.channelBar.isEnabled
											end,
											set = function(self,value)
												if (value) then
													ele_options.args.bars.args.channelBar.disabled = false
												else
													ele_options.args.bars.args.channelBar.disabled = true
												end
												
												statusbars.channelBar.isEnabled = value
											end,
										},
										healthToggle = {
											order = 4,
											name = L["TOGGLE_HEALTH_BAR"],
											desc = L["TOOLTIP_TOGGLE_HEALTH_BAR"],
											type = "toggle",
											get = function()
												return statusbars.healthBar.isEnabled
											end,
											set = function(self,value)
												if (value) then
													ele_options.args.bars.args.healthBar.disabled = false
												else
													ele_options.args.bars.args.healthBar.disabled = true
												end
												
												statusbars.healthBar.isEnabled = value
											end,
										},
										maelstromToggle = {
											order = 5,
											name = L["TOGGLE_MAELSTROM_BAR"],
											desc = L["TOOLTIP_TOGGLE_MAELSTROM_BAR"],
											type = "toggle",
											get = function()
												return statusbars.maelstromBar.isEnabled
											end,
											set = function(self,value)
												if (value) then
													ele_options.args.bars.args.maelstromBar.disabled = false
												else
													ele_options.args.bars.args.maelstromBar.disabled = true
												end
												
												statusbars.maelstromBar.isEnabled = value
											end,
										},
										icefuryToggle = {
											order = 6,
											name = L["TOGGLE_ICEFURY_BAR"],
											desc = L["TOOLTIP_TOGGLE_ICEFURY_BAR"],
											type = "toggle",
											get = function()
												return statusbars.icefuryBar.isEnabled
											end,
											set = function(self,value)
												if (value) then
													ele_options.args.bars.args.icefuryBar.disabled = false
												else
													ele_options.args.bars.args.icefuryBar.disabled = true
												end
												
												statusbars.icefuryBar.isEnabled = value
											end,
										},
									},
								},
							},
						},
						--[[healthBar = {
							name = L["LABEL_STATUSBAR_HEALTH"],
							order = 7,
							inline = false,
							type = "group",
							args = {
								adjust = {
									order = 1,
									name = L["LABEL_STATUSBAR_MODIFY_HEALTH"],
									desc = L["TOOLTIP_TOGGLE_STATUSBAR_CUSTOMIZATON"],
									type = "toggle",
									get = function()
										return statusbars.healthBar.adjust.isEnabled
									end,
									set = function(self,value)
										statusbars.healthBar.adjust.isEnabled = value
										CheckElementalDefaultValues(ele_options,'Health')
									end,
								},
								numtextToggle = {
									order = 2,
									name = L["TOGGLE_HEALTH_TEXT"],
									desc = L["TOOLTIP_TOGGLE_HEALTH_TEXT"],
									type = "toggle",
									--disabled = true,
									get = function()
										return statusbars.healthBar.numtext.isDisplayText
									end,
									set = function(self,value)
										statusbars.healthBar.numtext.isDisplayText = value
										CheckElementalDefaultValues(ele_options,'Health')
									end,
								},
								perctextToggle = {
									order = 3,
									name = L["TOGGLE_PERCENT_TEXT"],
									desc = L["TOOLTIP_TOGGLE_SPELL_TEXT"],
									type = "toggle",
									--disabled = true,
									get = function()
										return statusbars.castBar.timetext.isDisplayText
									end,
									set = function(self,value)
										statusbars.castBar.timetext.isDisplayText = value
										CheckElementalDefaultValues(ele_options,'Health')
									end,
								},
								general = {
									name = "|cFFFFFFFF"..SETTINGS.."|r",
									order = 4,
									type = "group",
									guiInline = true,
									args = {
										alphaCombat = {
											order = 1,
											type = "range",
											name = L["LABEL_ALPHA_COMBAT"],
											desc = L["TOOLTIP_STATUSBAR_ALPHA_COMBAT"],
											min = 0,
											max = 1,
											step = 0.1,
											bigStep = 0.1,
											get = function() return statusbars.healthBar.alphaCombat end,
											set = function(self,value)
												statusbars.healthBar.alphaCombat = value
												CheckElementalDefaultValues(ele_options,'Health')
											end,
										},
										alphaOoC = {
											order = 2,
											type = "range",
											name = L["LABEL_ALPHA_NO_COMBAT"],
											desc = L["TOOLTIP_STATUSBAR_ALPHA_NO_COMBAT"],
											min = 0,
											max = 1,
											step = 0.1,
											bigStep = 0.1,
											get = function() return statusbars.healthBar.alphaOoC end,
											set = function(self,value)
												statusbars.healthBar.alphaOoC = value
												CheckElementalDefaultValues(ele_options,'Health')
											end,
										},
										alphaTar = {
											order = 2,
											type = "range",
											name = L["LABEL_ALPHA_TARGET_NO_COMBAT"]"],
											desc = L["TOOLTIP_STATUSBAR_ALPHA_TARGET_NO_COMBAT"],
											min = 0,
											max = 1,
											step = 0.1,
											bigStep = 0.1,
											get = function() return statusbars.healthBar.alphaTar end,
											set = function(self,value)
												statusbars.healthBar.alphaTar = value
												CheckElementalDefaultValues(ele_options,'Health')
											end,
										},
									},
								},
								numtext = {
									name = '|cFFFFFFFF'..L["LABEL_TEXT_HEALTH"]..'|r',
									type = "group",
									order = 5,
									disabled = true,
									guiInline = true,
									args = {
										color = {
											type = "color",
											order = 1,
											name = L["LABEL_FONT_COLOR"],
											desc = L["TOOLTIP_FONT_COLOR"],
											hasAlpha = true,
											get = function(info)
												local color = statusbars.healthBar.numtext.font.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = statusbars.healthBar.numtext.font.color
												
												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckElementalDefaultValues(ele_options,'Health')
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
											name = L["LABEL_FONT"],
											desc = L["TOOLTIP_FONT_NAME"],
											values = LSM:HashTable("font"),
											get = function() return statusbars.healthBar.numtext.font.name end,
											set = function(self,value)
												statusbars.healthBar.numtext.font.name = value
												CheckElementalDefaultValues(ele_options,'Health')
											end,
										},
										fontSize = {
											order = 5,
											type = "range",
											name = FONT_SIZE,
											desc = L["TOOLTIP_COOLDOWN_FONT_SIZE"],
											min = 5,
											max = 40,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.healthBar.numtext.font.size end,
											set = function(self,value)
												statusbars.healthBar.numtext.font.size = value
												CheckElementalDefaultValues(ele_options,'Health')
											end,
										},
										fontOutline = {
											order = 6,
											type = "select",
											name = L["LABEL_FONT_OUTLINE"],
											desc = L["TOOLTIP_FONT_OUTLINE"],
											get = function()
												return statusbars.healthBar.numtext.font.flag
											end,
											set = function(self,value)
												statusbars.healthBar.numtext.font.flag = value
												CheckElementalDefaultValues(ele_options,'Health')
											end,
											values = FONT_OUTLINES,
										},
										numtextAnchor = {
											order = 7,
											type = "select",
											name = L["LABEL_FONT_ANCHOR"],
											desc = L["TOOLTIP_FONT_ANCHOR_POINT"],
											get = function()
												return statusbars.healthBar.numtext.justify
											end,
											set = function(self,value)
												statusbars.healthBar.numtext.justify = value
												CheckElementalDefaultValues(ele_options,'Health')
											end,
											values = FRAME_ANCHOR_OPTIONS,
										},
										numtextX = {
											order = 8,
											type = "range",
											name = "X",
											desc = L["TOOLTIP_FONT_X_OFFSET"],
											min = -500,
											max = 500,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.healthBar.numtext.x end,
											set = function(self,value)
												statusbars.healthBar.numtext.x = value
												CheckElementalDefaultValues(ele_options,'Health')
											end,
										},
										numtextY = {
											order = 9,
											type = "range",
											name = "Y",
											desc = L["TOOLTIP_FONT_Y_OFFSET"],
											min = -100,
											max = 100,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.healthBar.numtext.y end,
											set = function(self,value)
												statusbars.healthBar.numtext.y = value
												CheckElementalDefaultValues(ele_options,'Health')
											end,
										},
										shadow = {
											name = '|cFFFFFFFF'..L["LABEL_FONT_SHADOW"]..'|r',
											type = "group",
											order = 10,
											hidden = false,
											guiInline = true,
											args = {
												shadowToggle = {
													order = 1,
													name = L["TOGGLE"],
													desc = '',
													type = "toggle",
													get = function()
														return statusbars.healthBar.numtext.font.shadow.isEnabled
													end,
													set = function(self,value)
														statusbars.healthBar.numtext.font.shadow.isEnabled = value
														CheckElementalDefaultValues(ele_options,'Health')
													end,
												},
												shadowColor = {
													type = "color",
													order = 2,
													name = L["LABEL_FONT_SHADOW_COLOR"],
													desc = L["TOOLTIP_FONT_SHADOW_COLOR"],
													hasAlpha = true,
													get = function(info)
														local color = statusbars.healthBar.numtext.font.shadow.color
														return color.r, color.g, color.b, color.a
													end,
													set = function(info, r, g, b, a)
														local color = statusbars.healthBar.numtext.font.shadow.color

														color.r = tonumber(string.format("%.2f",r))
														color.g = tonumber(string.format("%.2f",g))
														color.b = tonumber(string.format("%.2f",b))
														color.a = tonumber(string.format("%.2f",a))
														CheckElementalDefaultValues(ele_options,'Health')
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
													desc = L["TOOLTIP_FONT_SHADOW_X_OFFSET"],
													min = -10,
													max = 10,
													step = 1,
													bigStep = 1,
													disabled = true,
													get = function() return statusbars.healthBar.numtext.font.shadow.offset.x end,
													set = function(self,value)
														statusbars.healthBar.numtext.font.shadow.offset.x = value
														CheckElementalDefaultValues(ele_options,'Health')
													end,
												},
												shadowY = {
													order = 5,
													type = "range",
													name = "Y",
													desc = L["TOOLTIP_FONT_SHADOW_Y_OFFSET"],
													min = -10,
													max = 10,
													step = 1,
													bigStep = 1,
													disabled = true,
													get = function() return statusbars.healthBar.numtext.font.shadow.offset.y end,
													set = function(self,value)
														statusbars.healthBar.numtext.font.shadow.offset.y = value
														CheckElementalDefaultValues(ele_options,'Health')
													end,
												},
											},
										},
									},
								},
								perctext = {
									name = '|cFFFFFFFF'..L["LABEL_TIME_TEXT"]..'|r',
									type = "group",
									order = 7,
									disabled = true,
									guiInline = true,
									args = {
										color = {
											type = "color",
											order = 1,
											name = L["LABEL_FONT_COLOR"],
											desc = L["TOOLTIP_FONT_COLOR"],
											hasAlpha = true,
											get = function(info)
												local color = statusbars.healthBar.perctext.font.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = statusbars.healthBar.perctext.font.color
												
												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckElementalDefaultValues(ele_options,'Health')
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
											name = L["LABEL_FONT"],
											desc = L["TOOLTIP_FONT_NAME"],
											values = LSM:HashTable("font"),
											get = function() return statusbars.healthBar.perctext.font.name end,
											set = function(self,value)
												statusbars.healthBar.perctext.font.name = value
												CheckElementalDefaultValues(ele_options,'Health')
											end,
										},
										timeFontSize = {
											order = 4,
											type = "range",
											name = FONT_SIZE,
											desc = L["TOOLTIP_COOLDOWN_FONT_SIZE"],
											min = 5,
											max = 40,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.healthBar.perctext.font.size end,
											set = function(self,value)
												statusbars.healthBar.perctext.font.size = value
												CheckElementalDefaultValues(ele_options,'Health')
											end,
										},
										timeFontOutline = {
											order = 5,
											type = "select",
											name = L["LABEL_FONT_OUTLINE"],
											desc = L["TOOLTIP_FONT_OUTLINE"],
											get = function()
												return statusbars.healthBar.perctext.font.flag
											end,
											set = function(self,value)
												statusbars.healthBar.perctext.font.flag = value
												CheckElementalDefaultValues(ele_options,'Health')
											end,
											values = FONT_OUTLINES,
										},
										timeTextAnchor = {
											order = 6,
											type = "select",
											name = L["LABEL_FONT_ANCHOR"],
											desc = L["TOOLTIP_FONT_ANCHOR_POINT"],
											get = function()
												return statusbars.healthBar.perctext.justify
											end,
											set = function(self,value)
												statusbars.healthBar.perctext.justify = value
												CheckElementalDefaultValues(ele_options,'Health')
											end,
											values = FRAME_ANCHOR_OPTIONS,
										},
										timeTextX = {
											order = 7,
											type = "range",
											name = "X",
											desc = L["TOOLTIP_FONT_X_OFFSET"],
											min = -500,
											max = 500,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.healthBar.perctext.x end,
											set = function(self,value)
												statusbars.healthBar.perctext.x = value
												CheckElementalDefaultValues(ele_options,'Health')
											end,
										},
										timeTextY = {
											order = 8,
											type = "range",
											name = "Y",
											desc = L["TOOLTIP_FONT_Y_OFFSET"],
											min = -100,
											max = 100,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.healthBar.perctext.y end,
											set = function(self,value)
												statusbars.healthBar.perctext.y = value
												CheckElementalDefaultValues(ele_options,'Health')
											end,
										},
										shadow = {
											name = '|cFFFFFFFF'..L["LABEL_FONT_SHADOW"]..'|r',
											type = "group",
											order = 9,
											hidden = false,
											guiInline = true,
											args = {
												shadowToggle = {
													order = 1,
													name = L["TOGGLE"],
													desc = '',
													type = "toggle",
													--disabled = true,
													get = function()
														return statusbars.healthBar.perctext.font.shadow.isEnabled
													end,
													set = function(self,value)
														statusbars.healthBar.perctext.font.shadow.isEnabled = value
														CheckElementalDefaultValues(ele_options,'Health')
													end,
												},
												shadowColor = {
													type = "color",
													order = 2,
													name = L["LABEL_FONT_SHADOW_COLOR"],
													desc = L["TOOLTIP_FONT_SHADOW_COLOR"],
													hasAlpha = true,
													disabled = true,
													get = function(info)
														local color = statusbars.healthBar.perctext.font.shadow.color
														return color.r, color.g, color.b, color.a
													end,
													set = function(info, r, g, b, a)
														local color = statusbars.healthBar.perctext.font.shadow.color
														
														color.r = tonumber(string.format("%.2f",r))
														color.g = tonumber(string.format("%.2f",g))
														color.b = tonumber(string.format("%.2f",b))
														color.a = tonumber(string.format("%.2f",a))
														CheckElementalDefaultValues(ele_options,'Health')
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
													desc = L["TOOLTIP_FONT_SHADOW_X_OFFSET"],
													min = -10,
													max = 10,
													step = 1,
													bigStep = 1,
													disabled = true,
													get = function() return statusbars.healthBar.perctext.font.shadow.offset.x end,
													set = function(self,value)
														statusbars.healthBar.perctext.font.shadow.offset.x = value
														CheckElementalDefaultValues(ele_options,'Health')
													end,
												},
												shadowY = {
													order = 5,
													type = "range",
													name = "Y",
													desc = L["TOOLTIP_FONT_SHADOW_Y_OFFSET"],
													min = -10,
													max = 10,
													step = 1,
													bigStep = 1,
													disabled = true,
													get = function() return statusbars.healthBar.perctext.font.shadow.offset.y end,
													set = function(self,value)
														statusbars.healthBar.perctext.font.shadow.offset.y = value
														CheckElementalDefaultValues(ele_options,'Health')
													end,
												},
											},
										},
									},
								},
								layout = {
									name = L["LABEL_LAYOUT_DESIGN"],
									type = "group",
									order = 8,
									guiInline = true,
									args = {
										texture = {
											order = 1,
											type = "select",
											name = L["LABEL_STATUSBAR_TEXTURE"],
											desc = L["TOOLTIP_STATUSBAR_TEXTURE"],
											dialogControl = "LSM30_Statusbar",
											get = function()
												return statusbars.healthBar.foreground.texture
											end,
											set = function(self,value)
												statusbars.healthBar.foreground.texture = value
												CheckElementalDefaultValues(ele_options,'Health')
											end,
											values = LSM:HashTable(LSM.MediaType.STATUSBAR),
										},
										textureColor = {
											type = "color",
											order = 2,
											name = L["LABEL_STATUSBAR_COLOR"],
											get = function(info)
												local color = statusbars.healthBar.foreground.color
												return color.r, color.g, color.b
											end,
											set = function(info, r, g, b)
												local color = statusbars.healthBar.foreground.color

												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												CheckElementalDefaultValues(ele_options,'Health')
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
											name = L["LABEL_STATUSBAR_BG_TEXTURE"],
											desc = L["TOOLTIP_STATUSBAR_BG_TEXTURE"],
											dialogControl = "LSM30_Statusbar",
											get = function()
												return statusbars.healthBar.background.texture
											end,
											set = function(self,value)
												statusbars.healthBar.background.texture = value
												CheckElementalDefaultValues(ele_options,"Cast",'healthBar')
											end,
											values = LSM:HashTable(LSM.MediaType.STATUSBAR),
										},
										backgroundColor = {
											type = "color",
											order = 5,
											name = L["LABEL_STATUSBAR_BG_COLOR"],
											desc = L["TOOLTIP_STATUSBAR_BG_COLOR"],
											hasAlpha = true,
											get = function(info)
												local color = statusbars.healthBar.background.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = statusbars.healthBar.background.color
												
												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckElementalDefaultValues(ele_options,'Health')
											end,
										},
										backgroundToggle = {
											order = 6,
											name = L["LABEL_STATUSBAR_MODIFY_BACKGROUND"],
											desc = L["TOOLTIP_TOGGLE_STATUSBAR_BG_CUSTOMIZATON"],
											type = "toggle",
											get = function()
												return statusbars.healthBar.adjust.showBG
											end,
											set = function(self,value)
												statusbars.healthBar.adjust.showBG = value
												CheckElementalDefaultValues(ele_options,'Health')
											end,
										},
										width = {
											order = 7,
											type = "range",
											name = L["LABEL_WIDTH"],
											desc = '',
											min = 100,
											max = 500,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.healthBar.layout.width end,
											set = function(self,value)
												statusbars.healthBar.layout.width = value
												CheckElementalDefaultValues(ele_options,'Health')
											end,
										},
										height = {
											order = 8,
											type = "range",
											name = L["LABEL_HEIGHT"],
											desc = '',
											min = 10,
											max = 100,
											step = 1,
											bigStep = 1,
											get = function() return statusbars.healthBar.layout.height end,
											set = function(self,value)
												statusbars.healthBar.layout.height = value
												CheckElementalDefaultValues(ele_options,'Health')
											end,
										},
									},
								},
								reset = {
									order = 9,
									type = "execute",
									name = L["BUTTON_RESET_STATUSBAR_CAST"],
									func = function()
										local bar = statusbars.healthBar
										local default = statusbarDefaults.healthBar
										
										bar.alphaCombat = default.alphaCombat
										bar.alphaOoC = default.alphaOoC
										
										bar.numtext.isDisplayText = true
										bar.numtext.x = default.numtext.x
										bar.numtext.y = default.numtext.y
										bar.numtext.font.name = default.numtext.font.name
										bar.numtext.font.size = default.numtext.font.size
										bar.numtext.font.flag = default.numtext.font.flag
										bar.numtext.font.color.r = default.numtext.font.color.r
										bar.numtext.font.color.g = default.numtext.font.color.g
										bar.numtext.font.color.b = default.numtext.font.color.b
										bar.numtext.font.color.a = default.numtext.font.color.a
										bar.numtext.font.shadow.isEnabled = false
										bar.numtext.font.shadow.offset.x = default.numtext.font.shadow.offset.x
										bar.numtext.font.shadow.offset.y = default.numtext.font.shadow.offset.y
										bar.numtext.font.shadow.color.r = default.numtext.font.shadow.color.r
										bar.numtext.font.shadow.color.g = default.numtext.font.shadow.color.g
										bar.numtext.font.shadow.color.b = default.numtext.font.shadow.color.b
										bar.numtext.font.shadow.color.a = default.numtext.font.shadow.color.a
										bar.numtext.justify = default.numtext.justify
										
										bar.perctext.isDisplayText = true
										bar.perctext.x = default.perctext.x
										bar.perctext.y = default.perctext.y
										bar.perctext.font.name = default.perctext.font.name
										bar.perctext.font.size = default.perctext.font.size
										bar.perctext.font.flag = default.perctext.font.flag
										bar.perctext.font.color.r = default.perctext.font.color.r
										bar.perctext.font.color.g = default.perctext.font.color.g
										bar.perctext.font.color.b = default.perctext.font.color.b
										bar.perctext.font.color.a = default.perctext.font.color.a
										bar.perctext.font.shadow.isEnabled = false
										bar.perctext.font.shadow.offset.x = default.perctext.font.shadow.offset.x
										bar.perctext.font.shadow.offset.y = default.perctext.font.shadow.offset.y
										bar.perctext.font.shadow.color.r = default.perctext.font.shadow.color.r
										bar.perctext.font.shadow.color.g = default.perctext.font.shadow.color.g
										bar.perctext.font.shadow.color.b = default.perctext.font.shadow.color.b
										bar.perctext.font.shadow.color.a = default.perctext.font.shadow.color.a
										bar.perctext.justify = default.perctext.justify
										
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
										ele_options.args.bars.args.healthBar.args.reset.disabled = true
										ele_options.args.bars.args.healthBar.args.reset.name = "|cFF666666"..L["BUTTON_RESET_STATUSBAR_CAST"].."|r"
										CheckElementalDefaultValues(ele_options,'Health')
										
										if (not bar.adjust.isEnabled) then
											Auras:InitializeProgressBar('CastBar1',nil,'healthBar','numtext','perctext',1)
										end
									end,
								},
							},
						},]]
						maelstromBar = {
							name = L["LABEL_STATUSBAR_MAELSTROM"],
							order = 6,
							type = "group",
							inline = false,
							args = {
								adjust = {
									order = 1,
									name = L["LABEL_STATUSBAR_MODIFY_MAELSTROM"],
									desc = L["TOOLTIP_TOGGLE_STATUSBAR_CUSTOMIZATON"],
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
									name = L["LABEL_TEXT_MAELSTROM"],
									desc = L["TOOLTIP_TOGGLE_MAELSTROM_TEXT"],
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
									name = L["LABEL_STATUSBAR_ANIMATE_MAELSTROM"],
									get = function() 
										return statusbars.maelstromBar.animate
									end,
									set = function(self,value)
										statusbars.maelstromBar.animate = value
										CheckElementalDefaultValues(ele_options,"Maelstrom")
									end,
								},
								general = {
									name = "|cFFFFFFFF"..SETTINGS.."|r",
									order = 4,
									type = "group",
									guiInline = true,
									args = {
										alphaCombat = {
											order = 1,
											type = "range",
											name = L["LABEL_ALPHA_COMBAT"],
											desc = L["TOOLTIP_STATUSBAR_ALPHA_COMBAT"],
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
											name = L["LABEL_ALPHA_NO_TARGET_NO_COMBAT"],
											desc = L["TOOLTIP_STATUSBAR_ALPHA_NO_COMBAT"],
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
											name = L["LABEL_ALPHA_TARGET_NO_COMBAT"],
											desc = L["TOOLTIP_STATUSBAR_ALPHA_TARGET_NO_COMBAT"],
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
											name = L["LABEL_TRIGGER_MAELSTROM"],
											desc = L["TOOLTIP_MAELSTROM_TIME_TRIGGER"],
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
									name = '|cFFFFFFFF'..L["LABEL_TEXT_MAELSTROM"]..'|r',
									type = "group",
									order = 5,
									disabled = true,
									guiInline = true,
									args = {
										color = {
											type = "color",
											order = 1,
											name = L["LABEL_FONT_COLOR"],
											desc = L["TOOLTIP_FONT_COLOR"],
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
											width = "full",
										},
										timeFontName = {
											order = 2,
											type = "select",
											dialogControl = "LSM30_Font",
											name = L["LABEL_FONT"],
											desc = L["TOOLTIP_FONT_NAME"],
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
											order = 3,
											type = "range",
											name = FONT_SIZE,
											desc = L["TOOLTIP_COOLDOWN_FONT_SIZE"],
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
											order = 4,
											type = "select",
											name = L["LABEL_FONT_OUTLINE"],
											desc = L["TOOLTIP_FONT_OUTLINE"],
											get = function()
												return statusbars.maelstromBar.text.font.flag
											end,
											set = function(self,value)
												statusbars.maelstromBar.text.font.flag = value
												CheckElementalDefaultValues(ele_options,'Maelstrom')
											end,
											values = FONT_OUTLINES,
										},
										timeTextAnchor = {
											order = 5,
											type = "select",
											name = L["LABEL_FONT_ANCHOR"],
											desc = L["TOOLTIP_FONT_ANCHOR_POINT"],
											get = function()
												return statusbars.maelstromBar.text.justify
											end,
											set = function(self,value)
												statusbars.maelstromBar.text.justify = value
												CheckElementalDefaultValues(ele_options,'Maelstrom')
											end,
											values = FRAME_ANCHOR_OPTIONS,
										},
										timeTextX = {
											order = 6,
											type = "range",
											name = "X",
											desc = L["TOOLTIP_FONT_X_OFFSET"],
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
											order = 7,
											type = "range",
											name = "Y",
											desc = L["TOOLTIP_FONT_Y_OFFSET"],
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
											name = '|cFFFFFFFF'..L["LABEL_FONT_SHADOW"]..'|r',
											type = "group",
											order = 8,
											hidden = false,
											guiInline = true,
											args = {
												shadowToggle = {
													order = 1,
													name = L["TOGGLE"],
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
													name = L["LABEL_FONT_SHADOW_COLOR"],
													desc = L["TOOLTIP_FONT_SHADOW_COLOR"],
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
												shadowX = {
													order = 3,
													type = "range",
													name = "X",
													desc = L["TOOLTIP_FONT_SHADOW_X_OFFSET"],
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
													order = 4,
													type = "range",
													name = "Y",
													desc = L["TOOLTIP_FONT_SHADOW_Y_OFFSET"],
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
									name = L["LABEL_LAYOUT_DESIGN"],
									type = "group",
									order = 6,
									guiInline = true,
									args = {
										texture = {
											order = 1,
											type = "select",
											name = L["LABEL_STATUSBAR_TEXTURE"],
											desc = L["TOOLTIP_STATUSBAR_TEXTURE"],
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
											name = L["LABEL_STATUSBAR_COLOR"],
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
											width = "double",
										},
										backgroundTexture = {
											order = 3,
											type = "select",
											name = L["LABEL_STATUSBAR_BG_TEXTURE"],
											desc = L["TOOLTIP_STATUSBAR_BG_TEXTURE"],
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
											order = 4,
											name = L["LABEL_STATUSBAR_BG_COLOR"],
											desc = L["TOOLTIP_STATUSBAR_BG_COLOR"],
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
											order = 5,
											name = L["LABEL_STATUSBAR_MODIFY_BACKGROUND"],
											desc = L["TOOLTIP_TOGGLE_STATUSBAR_BG_CUSTOMIZATON"],
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
											order = 6,
											type = "range",
											name = L["LABEL_WIDTH"],
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
											order = 7,
											type = "range",
											name = L["LABEL_HEIGHT"],
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
									name = L["BUTTON_RESET_STATUSBAR_MAELSTROM"],
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
										ele_options.args.bars.args.maelstromBar.args.reset.disabled = true
										ele_options.args.bars.args.maelstromBar.args.reset.name = "|cFF666666"..L["BUTTON_RESET_STATUSBAR_MAELSTROM"].."|r"
										CheckElementalDefaultValues(ele_options,'Maelstrom')
										
										if (not bar.adjust.isEnabled) then
											Auras:InitializeProgressBar('MaelstromBar1',nil,'maelstromBar','text',nil,1)
										end
									end,
								},
							},
						},
						castBar = {
							name = L["LABEL_STATUSBAR_CAST"],
							order = 7,
							inline = false,
							type = "group",
							args = {
								adjust = {
									order = 1,
									name = L["LABEL_STATUSBAR_MODIFY_CAST"],
									desc = L["TOOLTIP_TOGGLE_STATUSBAR_CUSTOMIZATON"],
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
									name = L["TOGGLE_SPELL_TEXT"],
									desc = L["TOOLTIP_TOGGLE_SPELL_TEXT"],
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
									name = L["TOGGLE_TIME_TEXT"],
									desc = L["TOOLTIP_TOGGLE_TIME_TEXT"],
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
									name = "|cFFFFFFFF"..SETTINGS.."|r",
									order = 4,
									type = "group",
									guiInline = true,
									args = {
										alphaCombat = {
											order = 1,
											type = "range",
											name = L["LABEL_ALPHA_COMBAT"],
											desc = L["TOOLTIP_STATUSBAR_ALPHA_COMBAT"],
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
											name = L["LABEL_ALPHA_NO_COMBAT"],
											desc = L["TOOLTIP_STATUSBAR_ALPHA_NO_COMBAT"],
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
									name = '|cFFFFFFFF'..L["LABEL_ICON_SPARK"]..'|r',
									type = "group",
									order = 5,
									disabled = true,
									guiInline = true,
									args = {
										sparkToggle = {
											order = 1,
											name = L["TOGGLE_SPARK"],
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
											name = L["TOGGLE_ICON"],
											desc = '',
											type = "toggle",
											get = function()
												return statusbars.castBar.icon.isEnabled
											end,
											set = function(self,value)
												local option = ele_options.args.bars.args.castBar.args.iconSpark.args.iconJustify.disabled
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
											name = L["LABEL_ICON_JUSTIFY"],
											desc = L["TOOLTIP_STATUSBAR_ICON_LOCATION"],
											get = function()
												return statusbars.castBar.icon.justify
											end,
											set = function(self,value)
												statusbars.castBar.icon.justify = value
												CheckElementalDefaultValues(ele_options,'Cast','castBar')
											end,
											values = ICON_JUSTIFY,
										},
									},
								},
								nametext = {
									name = '|cFFFFFFFF'..L["LABEL_TEXT_SPELL"]..'|r',
									type = "group",
									order = 6,
									disabled = true,
									guiInline = true,
									args = {
										color = {
											type = "color",
											order = 1,
											name = L["LABEL_FONT_COLOR"],
											desc = L["TOOLTIP_FONT_COLOR"],
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
											width = "full",
										},
										fontName = {
											order = 2,
											type = "select",
											dialogControl = "LSM30_Font",
											name = L["LABEL_FONT"],
											desc = L["TOOLTIP_FONT_NAME"],
											values = LSM:HashTable("font"),
											get = function() return statusbars.castBar.nametext.font.name end,
											set = function(self,value)
												statusbars.castBar.nametext.font.name = value
												CheckElementalDefaultValues(ele_options,'Cast','castBar')
											end,
										},
										fontSize = {
											order = 3,
											type = "range",
											name = FONT_SIZE,
											desc = L["TOOLTIP_COOLDOWN_FONT_SIZE"],
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
											order = 4,
											type = "select",
											name = L["LABEL_FONT_OUTLINE"],
											desc = L["TOOLTIP_FONT_OUTLINE"],
											get = function()
												return statusbars.castBar.nametext.font.flag
											end,
											set = function(self,value)
												statusbars.castBar.nametext.font.flag = value
												CheckElementalDefaultValues(ele_options,'Cast','castBar')
											end,
											values = FONT_OUTLINES,
										},
										nametextAnchor = {
											order = 5,
											type = "select",
											name = L["LABEL_FONT_ANCHOR"],
											desc = L["TOOLTIP_FONT_ANCHOR_POINT"],
											get = function()
												return statusbars.castBar.nametext.justify
											end,
											set = function(self,value)
												statusbars.castBar.nametext.justify = value
												CheckElementalDefaultValues(ele_options,'Cast','castBar')
											end,
											values = FRAME_ANCHOR_OPTIONS,
										},
										nametextX = {
											order = 6,
											type = "range",
											name = "X",
											desc = L["TOOLTIP_FONT_X_OFFSET"],
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
											order = 7,
											type = "range",
											name = "Y",
											desc = L["TOOLTIP_FONT_Y_OFFSET"],
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
											name = '|cFFFFFFFF'..L["LABEL_FONT_SHADOW"]..'|r',
											type = "group",
											order = 8,
											hidden = false,
											guiInline = true,
											args = {
												shadowToggle = {
													order = 1,
													name = L["TOGGLE"],
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
													name = L["LABEL_FONT_SHADOW_COLOR"],
													desc = L["TOOLTIP_FONT_SHADOW_COLOR"],
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
												shadowX = {
													order = 3,
													type = "range",
													name = "X",
													desc = L["TOOLTIP_FONT_SHADOW_X_OFFSET"],
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
													order = 4,
													type = "range",
													name = "Y",
													desc = L["TOOLTIP_FONT_SHADOW_Y_OFFSET"],
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
									name = '|cFFFFFFFF'..L["LABEL_TIME_TEXT"]..'|r',
									type = "group",
									order = 7,
									disabled = true,
									guiInline = true,
									args = {
										color = {
											type = "color",
											order = 1,
											name = L["LABEL_FONT_COLOR"],
											desc = L["TOOLTIP_FONT_COLOR"],
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
											width = "full",
										},
										timeFontName = {
											order = 2,
											type = "select",
											dialogControl = "LSM30_Font",
											name = L["LABEL_FONT"],
											desc = L["TOOLTIP_FONT_NAME"],
											values = LSM:HashTable("font"),
											get = function() return statusbars.castBar.timetext.font.name end,
											set = function(self,value)
												statusbars.castBar.timetext.font.name = value
												CheckElementalDefaultValues(ele_options,'Cast','castBar')
											end,
										},
										timeFontSize = {
											order = 3,
											type = "range",
											name = FONT_SIZE,
											desc = L["TOOLTIP_COOLDOWN_FONT_SIZE"],
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
											order = 4,
											type = "select",
											name = L["LABEL_FONT_OUTLINE"],
											desc = L["TOOLTIP_FONT_OUTLINE"],
											get = function()
												return statusbars.castBar.timetext.font.flag
											end,
											set = function(self,value)
												statusbars.castBar.timetext.font.flag = value
												CheckElementalDefaultValues(ele_options,'Cast','castBar')
											end,
											values = FONT_OUTLINES,
										},
										timeTextAnchor = {
											order = 5,
											type = "select",
											name = L["LABEL_FONT_ANCHOR"],
											desc = L["TOOLTIP_FONT_ANCHOR_POINT"],
											get = function()
												return statusbars.castBar.timetext.justify
											end,
											set = function(self,value)
												statusbars.castBar.timetext.justify = value
												CheckElementalDefaultValues(ele_options,'Cast','castBar')
											end,
											values = FRAME_ANCHOR_OPTIONS,
										},
										timeTextX = {
											order = 6,
											type = "range",
											name = "X",
											desc = L["TOOLTIP_FONT_X_OFFSET"],
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
											order = 7,
											type = "range",
											name = "Y",
											desc = L["TOOLTIP_FONT_Y_OFFSET"],
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
											name = '|cFFFFFFFF'..L["LABEL_FONT_SHADOW"]..'|r',
											type = "group",
											order = 8,
											hidden = false,
											guiInline = true,
											args = {
												shadowToggle = {
													order = 1,
													name = L["TOGGLE"],
													desc = '',
													type = "toggle",
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
													name = L["LABEL_FONT_SHADOW_COLOR"],
													desc = L["TOOLTIP_FONT_SHADOW_COLOR"],
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
												shadowX = {
													order = 3,
													type = "range",
													name = "X",
													desc = L["TOOLTIP_FONT_SHADOW_X_OFFSET"],
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
													order = 4,
													type = "range",
													name = "Y",
													desc = L["TOOLTIP_FONT_SHADOW_Y_OFFSET"],
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
									name = L["LABEL_LAYOUT_DESIGN"],
									type = "group",
									order = 8,
									guiInline = true,
									args = {
										texture = {
											order = 1,
											type = "select",
											name = L["LABEL_STATUSBAR_TEXTURE"],
											desc = L["TOOLTIP_STATUSBAR_TEXTURE"],
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
											name = L["LABEL_STATUSBAR_COLOR"],
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
											width = "double",
										},
										backgroundTexture = {
											order = 3,
											type = "select",
											name = L["LABEL_STATUSBAR_BG_TEXTURE"],
											desc = L["TOOLTIP_STATUSBAR_BG_TEXTURE"],
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
											order = 4,
											name = L["LABEL_STATUSBAR_BG_COLOR"],
											desc = L["TOOLTIP_STATUSBAR_BG_COLOR"],
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
											order = 5,
											name = L["LABEL_STATUSBAR_MODIFY_BACKGROUND"],
											desc = L["TOOLTIP_TOGGLE_STATUSBAR_BG_CUSTOMIZATON"],
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
											order = 6,
											type = "range",
											name = L["LABEL_WIDTH"],
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
											order = 7,
											type = "range",
											name = L["LABEL_HEIGHT"],
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
									name = L["BUTTON_RESET_STATUSBAR_CAST"],
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
										ele_options.args.bars.args.castBar.args.reset.disabled = true
										ele_options.args.bars.args.castBar.args.reset.name = "|cFF666666"..L["BUTTON_RESET_STATUSBAR_CAST"].."|r"
										CheckElementalDefaultValues(ele_options,'Cast','castBar')
										
										if (not bar.adjust.isEnabled) then
											Auras:InitializeProgressBar('CastBar1',nil,'castBar','nametext','timetext',1)
										end
									end,
								},
							},
						},
						channelBar = {
							name = L["LABEL_STATUSBAR_CHANNEL"],
							order = 8,
							inline = false,
							type = "group",
							args = {
								adjust = {
									order = 1,
									name = L["LABEL_STATUSBAR_MODIFY_CHANNEL"],
									desc = L["TOOLTIP_TOGGLE_STATUSBAR_CUSTOMIZATON"],
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
									name = L["TOGGLE_SPELL_TEXT"],
									desc = L["TOOLTIP_TOGGLE_SPELL_TEXT"],
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
									name = L["TOGGLE_TIME_TEXT"],
									desc = L["TOOLTIP_TOGGLE_TIME_TEXT"],
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
									name = "|cFFFFFFFF"..SETTINGS.."|r",
									order = 4,
									type = "group",
									guiInline = true,
									args = {
										alphaCombat = {
											order = 1,
											type = "range",
											name = L["LABEL_ALPHA_COMBAT"],
											desc = L["TOOLTIP_STATUSBAR_ALPHA_COMBAT"],
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
											name = L["LABEL_ALPHA_NO_COMBAT"],
											desc = L["TOOLTIP_STATUSBAR_ALPHA_NO_COMBAT"],
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
									name = '|cFFFFFFFF'..L["LABEL_ICON_SPARK"]..'|r',
									type = "group",
									order = 5,
									disabled = true,
									guiInline = true,
									args = {
										sparkToggle = {
											order = 1,
											name = L["TOGGLE_SPARK"],
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
											name = L["TOGGLE_ICON"],
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
											name = L["LABEL_ICON_JUSTIFY"],
											desc = L["TOOLTIP_STATUSBAR_ICON_LOCATION"],
											get = function()
												return statusbars.channelBar.icon.justify
											end,
											set = function(self,value)
												statusbars.channelBar.icon.justify = value
												CheckElementalDefaultValues(ele_options,'Channel','channelBar')
											end,
											values = ICON_JUSTIFY,
										},
									},
								},
								nametext = {
									name = '|cFFFFFFFF'..L["LABEL_TEXT_SPELL"]..'|r',
									type = "group",
									order = 6,
									disabled = true,
									guiInline = true,
									args = {
										color = {
											type = "color",
											order = 1,
											name = L["LABEL_FONT_COLOR"],
											desc = L["TOOLTIP_FONT_COLOR"],
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
											width = "full",
										},
										fontName = {
											order = 2,
											type = "select",
											dialogControl = "LSM30_Font",
											name = L["LABEL_FONT"],
											desc = L["TOOLTIP_FONT_NAME"],
											values = LSM:HashTable("font"),
											get = function() return statusbars.channelBar.nametext.font.name end,
											set = function(self,value)
												statusbars.channelBar.nametext.font.name = value
												CheckElementalDefaultValues(ele_options,'Channel','channelBar')
											end,
										},
										fontSize = {
											order = 3,
											type = "range",
											name = FONT_SIZE,
											desc = L["TOOLTIP_COOLDOWN_FONT_SIZE"],
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
											order = 4,
											type = "select",
											name = L["LABEL_FONT_OUTLINE"],
											desc = L["TOOLTIP_FONT_OUTLINE"],
											get = function()
												return statusbars.channelBar.nametext.font.flag
											end,
											set = function(self,value)
												statusbars.channelBar.nametext.font.flag = value
												CheckElementalDefaultValues(ele_options,'Channel','channelBar')
											end,
											values = FONT_OUTLINES,
										},
										nametextAnchor = {
											order = 5,
											type = "select",
											name = L["LABEL_FONT_ANCHOR"],
											desc = L["TOOLTIP_FONT_ANCHOR_POINT"],
											get = function()
												return statusbars.channelBar.nametext.justify
											end,
											set = function(self,value)
												statusbars.channelBar.nametext.justify = value
												CheckElementalDefaultValues(ele_options,'Channel','channelBar')
											end,
											values = FRAME_ANCHOR_OPTIONS,
										},
										nametextX = {
											order = 6,
											type = "range",
											name = "X",
											desc = L["TOOLTIP_FONT_X_OFFSET"],
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
											order = 7,
											type = "range",
											name = "Y",
											desc = L["TOOLTIP_FONT_Y_OFFSET"],
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
											name = '|cFFFFFFFF'..L["LABEL_FONT_SHADOW"]..'|r',
											type = "group",
											order = 8,
											hidden = false,
											guiInline = true,
											args = {
												shadowToggle = {
													order = 1,
													name = L["TOGGLE"],
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
													name = L["LABEL_FONT_SHADOW_COLOR"],
													desc = L["TOOLTIP_FONT_SHADOW_COLOR"],
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
												shadowX = {
													order = 3,
													type = "range",
													name = "X",
													desc = L["TOOLTIP_FONT_SHADOW_X_OFFSET"],
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
													order = 4,
													type = "range",
													name = "Y",
													desc = L["TOOLTIP_FONT_SHADOW_Y_OFFSET"],
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
									name = '|cFFFFFFFF'..L["LABEL_TIME_TEXT"]..'|r',
									type = "group",
									order = 6,
									disabled = true,
									guiInline = true,
									args = {
										color = {
											type = "color",
											order = 1,
											name = L["LABEL_FONT_COLOR"],
											desc = L["TOOLTIP_FONT_COLOR"],
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
											width = "full",
										},
										timeFontName = {
											order = 2,
											type = "select",
											dialogControl = "LSM30_Font",
											name = L["LABEL_FONT"],
											desc = L["TOOLTIP_FONT_NAME"],
											values = LSM:HashTable("font"),
											get = function() return statusbars.channelBar.timetext.font.name end,
											set = function(self,value)
												statusbars.channelBar.timetext.font.name = value
												CheckElementalDefaultValues(ele_options,'Channel','channelBar')
											end,
										},
										timeFontSize = {
											order = 3,
											type = "range",
											name = FONT_SIZE,
											desc = L["TOOLTIP_COOLDOWN_FONT_SIZE"],
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
											order = 4,
											type = "select",
											name = L["LABEL_FONT_OUTLINE"],
											desc = L["TOOLTIP_FONT_OUTLINE"],
											get = function()
												return statusbars.channelBar.timetext.font.flag
											end,
											set = function(self,value)
												statusbars.channelBar.timetext.font.flag = value
												CheckElementalDefaultValues(ele_options,'Channel','channelBar')
											end,
											values = FONT_OUTLINES,
										},
										timeTextAnchor = {
											order = 5,
											type = "select",
											name = L["LABEL_FONT_ANCHOR"],
											desc = L["TOOLTIP_FONT_ANCHOR_POINT"],
											get = function()
												return statusbars.channelBar.timetext.justify
											end,
											set = function(self,value)
												statusbars.channelBar.timetext.justify = value
												CheckElementalDefaultValues(ele_options,'Channel','channelBar')
											end,
											values = FRAME_ANCHOR_OPTIONS,
										},
										timeTextX = {
											order = 6,
											type = "range",
											name = "X",
											desc = L["TOOLTIP_FONT_X_OFFSET"],
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
											order = 7,
											type = "range",
											name = "Y",
											desc = L["TOOLTIP_FONT_Y_OFFSET"],
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
											name = '|cFFFFFFFF'..L["LABEL_FONT_SHADOW"]..'|r',
											type = "group",
											order = 8,
											hidden = false,
											guiInline = true,
											args = {
												shadowToggle = {
													order = 1,
													name = L["TOGGLE"],
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
													name = L["LABEL_FONT_SHADOW_COLOR"],
													desc = L["TOOLTIP_FONT_SHADOW_COLOR"],
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
												shadowX = {
													order = 3,
													type = "range",
													name = "X",
													desc = L["TOOLTIP_FONT_SHADOW_X_OFFSET"],
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
													order = 4,
													type = "range",
													name = "Y",
													desc = L["TOOLTIP_FONT_SHADOW_Y_OFFSET"],
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
									name = L["LABEL_LAYOUT_DESIGN"],
									type = "group",
									order = 7,
									guiInline = true,
									args = {
										texture = {
											order = 1,
											type = "select",
											name = L["LABEL_STATUSBAR_TEXTURE"],
											desc = L["TOOLTIP_STATUSBAR_TEXTURE"],
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
											name = L["LABEL_STATUSBAR_COLOR"],
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
											width = "double",
										},
										backgroundTexture = {
											order = 3,
											type = "select",
											name = L["LABEL_STATUSBAR_BG_TEXTURE"],
											desc = L["TOOLTIP_STATUSBAR_BG_TEXTURE"],
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
											order = 4,
											name = L["LABEL_STATUSBAR_BG_COLOR"],
											desc = L["TOOLTIP_STATUSBAR_BG_COLOR"],
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
											order = 5,
											name = L["LABEL_STATUSBAR_MODIFY_BACKGROUND"],
											desc = L["TOOLTIP_TOGGLE_STATUSBAR_BG_CUSTOMIZATON"],
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
											order = 6,
											type = "range",
											name = L["LABEL_WIDTH"],
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
											order = 7,
											type = "range",
											name = L["LABEL_HEIGHT"],
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
									name = L["BUTTON_RESET_STATUSBAR_CHANNEL"],
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
										ele_options.args.bars.args.channelBar.args.reset.disabled = true
										ele_options.args.bars.args.channelBar.args.reset.name = "|cFF666666"..L["BUTTON_RESET_STATUSBAR_CHANNEL"].."|r"
										CheckElementalDefaultValues(ele_options,'Channel','channelBar')
										
										if (not bar.adjust.isEnabled) then
											Auras:InitializeProgressBar('ChannelBar1',nil,'channelBar','nametext','timetext',1)
										end
									end,
								},
							},
						},
						icefuryBar = {
							name = L["LABEL_STATUSBAR_ICEFURY"],
							order = 9,
							inline = false,
							type = "group",
							args = {
								adjust = {
									order = 1,
									name = L["LABEL_STATUSBAR_MODIFY_ICEFURY"],
									desc = L["TOOLTIP_TOGGLE_STATUSBAR_CUSTOMIZATON"],
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
									name = L["TOGGLE_COUNT_TEXT"],
									desc = L["TOOLTIP_TOGGLE_ICEFURY_TEXT"],
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
									name = L["TOGGLE_TIME_TEXT"],
									desc = L["TOOLTIP_TOGGLE_TIME_TEXT"],
									type = "toggle",
									get = function()
										return statusbars.icefuryBar.timetext.isDisplayText
									end,
									set = function(self,value)
										statusbars.icefuryBar.timetext.isDisplayText = value
										CheckElementalDefaultValues(ele_options,'Icefury')
									end,
								},
								counttext = {
									name = '|cFFFFFFFF'..L["LABEL_TEXT_COUNT"]..'|r',
									type = "group",
									order = 4,
									disabled = true,
									guiInline = true,
									args = {
										color = {
											type = "color",
											order = 1,
											name = L["LABEL_FONT_COLOR"],
											desc = L["TOOLTIP_FONT_COLOR"],
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
											width = "full",
										},
										fontName = {
											order = 2,
											type = "select",
											dialogControl = "LSM30_Font",
											name = L["LABEL_FONT"],
											desc = L["TOOLTIP_FONT_NAME"],
											values = LSM:HashTable("font"),
											get = function() return statusbars.icefuryBar.counttext.font.name end,
											set = function(self,value)
												statusbars.icefuryBar.counttext.font.name = value
												CheckElementalDefaultValues(ele_options,'Icefury')
											end,
										},
										fontSize = {
											order = 3,
											type = "range",
											name = FONT_SIZE,
											desc = L["TOOLTIP_COOLDOWN_FONT_SIZE"],
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
											order = 4,
											type = "select",
											name = L["LABEL_FONT_OUTLINE"],
											desc = L["TOOLTIP_FONT_OUTLINE"],
											get = function()
												return statusbars.icefuryBar.counttext.font.flag
											end,
											set = function(self,value)
												statusbars.icefuryBar.counttext.font.flag = value
												CheckElementalDefaultValues(ele_options,'Icefury')
											end,
											values = FONT_OUTLINES,
										},
										counttextAnchor = {
											order = 5,
											type = "select",
											name = L["LABEL_FONT_ANCHOR"],
											desc = L["TOOLTIP_FONT_ANCHOR_POINT"],
											get = function()
												return statusbars.icefuryBar.counttext.justify
											end,
											set = function(self,value)
												statusbars.icefuryBar.counttext.justify = value
												CheckElementalDefaultValues(ele_options,'Icefury')
											end,
											values = FRAME_ANCHOR_OPTIONS,
										},
										counttextX = {
											order = 6,
											type = "range",
											name = "X",
											desc = L["TOOLTIP_FONT_X_OFFSET"],
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
											order = 7,
											type = "range",
											name = "Y",
											desc = L["TOOLTIP_FONT_Y_OFFSET"],
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
											name = '|cFFFFFFFF'..L["LABEL_FONT_SHADOW"]..'|r',
											type = "group",
											order = 8,
											hidden = false,
											guiInline = true,
											args = {
												shadowToggle = {
													order = 1,
													name = L["TOGGLE"],
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
													name = L["LABEL_FONT_SHADOW_COLOR"],
													desc = L["TOOLTIP_FONT_SHADOW_COLOR"],
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
												shadowX = {
													order = 3,
													type = "range",
													name = "X",
													desc = L["TOOLTIP_FONT_SHADOW_X_OFFSET"],
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
													order = 4,
													type = "range",
													name = "Y",
													desc = L["TOOLTIP_FONT_SHADOW_Y_OFFSET"],
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
									name = '|cFFFFFFFF'..L["LABEL_TIME_TEXT"]..'|r',
									type = "group",
									order = 5,
									disabled = true,
									guiInline = true,
									args = {
										color = {
											type = "color",
											order = 1,
											name = L["LABEL_FONT_COLOR"],
											desc = L["TOOLTIP_FONT_COLOR"],
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
											width = "full",
										},
										timeFontName = {
											order = 2,
											type = "select",
											dialogControl = "LSM30_Font",
											name = L["LABEL_FONT"],
											desc = L["TOOLTIP_FONT_NAME"],
											values = LSM:HashTable("font"),
											get = function() return statusbars.icefuryBar.timetext.font.name end,
											set = function(self,value)
												statusbars.icefuryBar.timetext.font.name = value
												CheckElementalDefaultValues(ele_options,'Icefury')
											end,
										},
										timeFontSize = {
											order = 3,
											type = "range",
											name = FONT_SIZE,
											desc = L["TOOLTIP_COOLDOWN_FONT_SIZE"],
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
											order = 4,
											type = "select",
											name = L["LABEL_FONT_OUTLINE"],
											desc = L["TOOLTIP_FONT_OUTLINE"],
											get = function()
												return statusbars.icefuryBar.timetext.font.flag
											end,
											set = function(self,value)
												statusbars.icefuryBar.timetext.font.flag = value
												CheckElementalDefaultValues(ele_options,'Icefury')
											end,
											values = FONT_OUTLINES,
										},
										timeTextAnchor = {
											order = 5,
											type = "select",
											name = L["LABEL_FONT_ANCHOR"],
											desc = L["TOOLTIP_FONT_ANCHOR_POINT"],
											get = function()
												return statusbars.icefuryBar.timetext.justify
											end,
											set = function(self,value)
												statusbars.icefuryBar.timetext.justify = value
												CheckElementalDefaultValues(ele_options,'Icefury')
											end,
											values = FRAME_ANCHOR_OPTIONS,
										},
										timeTextX = {
											order = 6,
											type = "range",
											name = "X",
											desc = L["TOOLTIP_FONT_X_OFFSET"],
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
											order = 7,
											type = "range",
											name = "Y",
											desc = L["TOOLTIP_FONT_Y_OFFSET"],
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
											name = '|cFFFFFFFF'..L["LABEL_FONT_SHADOW"]..'|r',
											type = "group",
											order = 8,
											hidden = false,
											guiInline = true,
											args = {
												shadowToggle = {
													order = 1,
													name = L["TOGGLE"],
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
													name = L["LABEL_FONT_SHADOW_COLOR"],
													desc = L["TOOLTIP_FONT_SHADOW_COLOR"],
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
												shadowX = {
													order = 3,
													type = "range",
													name = "X",
													desc = L["TOOLTIP_FONT_SHADOW_X_OFFSET"],
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
													order = 4,
													type = "range",
													name = "Y",
													desc = L["TOOLTIP_FONT_SHADOW_Y_OFFSET"],
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
									name = L["LABEL_LAYOUT_DESIGN"],
									type = "group",
									order = 6,
									guiInline = true,
									args = {
										texture = {
											order = 1,
											type = "select",
											name = L["LABEL_STATUSBAR_TEXTURE"],
											desc = L["TOOLTIP_STATUSBAR_TEXTURE"],
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
											name = L["LABEL_STATUSBAR_COLOR"],
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
											width = "double",
										},
										timerTexture = {
											order = 3,
											type = "select",
											name = L["LABEL_TIME_BAR_TEXTURE"],
											desc = L["TOOLTIP_STATUSBAR_TEXTURE"],
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
											order = 4,
											name = L["LABEL_STATUSBAR_COLOR"],
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
											order = 5,
											name = L["LABEL_STATUSBAR_MODIFY_TIMER"],
											desc = L["TOOLTIP_TOGGLE_STATUSBAR_CUSTOMIZATON"],
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
											order = 6,
											type = "select",
											name = L["LABEL_STATUSBAR_BG_TEXTURE"],
											desc = L["TOOLTIP_STATUSBAR_BG_TEXTURE"],
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
											order = 7,
											name = "BG Color",
											desc = L["TOOLTIP_STATUSBAR_BG_COLOR"],
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
											order = 8,
											name = L["LABEL_STATUSBAR_MODIFY_BACKGROUND"],
											desc = L["TOOLTIP_TOGGLE_STATUSBAR_BG_CUSTOMIZATON"],
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
											order = 9,
											type = "range",
											name = L["LABEL_WIDTH"],
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
											order = 10,
											type = "range",
											name = L["LABEL_HEIGHT"],
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
									order = 7,
									type = "execute",
									name = L["BUTTON_RESET_STATUSBAR_ICEFURY"],
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
										ele_options.args.bars.args.icefuryBar.args.reset.disabled = true
										ele_options.args.bars.args.icefuryBar.args.reset.name = "|cFF666666"..L["BUTTON_RESET_STATUSBAR_ICEFURY"].."|r"
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
				cooldowns = {
					name = L["LABEL_COOLDOWN"],
					order = 4,
					type = "group",
					disabled = true,
					args = {
						toggle = {
							order = 1,
							name = ENABLE,
							desc = L["TOOLTIP_TOGGLE_COOLDOWN_TEXT"],
							type = "toggle",
							get = function()
								return cooldowns.isEnabled
							end,
							set = function(self,value)
								cooldowns.isEnabled = value
								CheckElementalDefaultValues(ele_options,'Cooldowns')
							end,
							width = "full",
						},
						text = {
							order = 2,
							name = L["LABEL_COOLDOWN_TEXT"],
							desc = L["TOOLTIP_TOGGLE_COOLDOWN_TEXT"],
							type = "toggle",
							get = function()
								return cooldowns.text
							end,
							set = function(self,value)
								cooldowns.text = value
							end,
						},
						sweep = {
							order = 3,
							name = L["LABEL_COOLDOWN_SWEEP"],
							desc = L["TOOLTIP_TOGGLE_COOLDOWN_SWEEP"],
							type = "toggle",
							get = function()
								return cooldowns.sweep
							end,
							set = function(self,value)
								cooldowns.sweep = value
								Auras:InitializeCooldowns('AuraGroup1',1)
								CheckElementalDefaultValues(ele_options,'Cooldowns')
							end,
							width = "double",
						},
						GCD = {
							order = 4,
							name = L["LABEL_COOLDOWN_GCD"],
							desc = L["TOOLTIP_TOGGLE_COOLDOWN_GCD"],
							type = "toggle",
							get = function()
								return cooldowns.GCD.isEnabled
							end,
							set = function(self,value)
								cooldowns.GCD.isEnabled = value
							end,
						},
						inverse = {
							order = 5,
							name = L["LABEL_COOLDOWN_REVERSE_SWEEP"],
							desc = L["TOOLTIP_COOLDOWN_REVERSE_SWEEP"],
							type = "toggle",
							get = function()
								return cooldowns.inverse
							end,
							set = function(self,value)
								cooldowns.inverse = value
								Auras:InitializeCooldowns('AuraGroup1',1)
							end,
						},
						bling = {
							order = 6,
							name = L["LABEL_COOLDOWN_BLING"],
							desc = L["TOOLTIP_TOGGLE_COOLDOWN_BLING"],
							type = "toggle",
							get = function()
								return cooldowns.bling
							end,
							set = function(self,value)
								cooldowns.bling = value
								Auras:InitializeCooldowns('AuraGroup1',1)
							end,
						},
						group = {
							order = 7,
							type = "select",
							name = L["LABEL_COOLDOWN_GROUP"],
							desc = L["TOOLTIP_AURAS_GROUP_SELECT"],
							get = function()
								return cooldowns.selected
							end,
							set = function(self,value)
								cooldowns.selected = value
								CheckElementalDefaultValues(ele_options,'Cooldowns')
							end,
							values = COOLDOWN_OPTIONS,
						},
						adjustToggle = {
							order = 8,
							name = L["LABEL_COOLDOWN_ADJUST"],
							desc = '',
							type = "toggle",
							get = function()
								return cooldowns.adjust
							end,
							set = function(self,value)
								cooldowns.adjust = value
								CheckElementalDefaultValues(ele_options,'Cooldowns')
							end,
						},
						p1_formatting = {
							name = FORMATTING,
							type = "group",
							order = 9,
							guiInline = true,
							args = {
								alertToggle = {
									order = 1,
									name = L["LABEL_ALERT"],
									desc = L["TOOLTIP_ALERT"],
									type = "toggle",
									get = function()
										return cooldowns.primary[1].text.formatting.alert.isEnabled
									end,
									set = function(self,value)
										cooldowns.primary[1].text.formatting.alert.isEnabled = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
									width = "double",
								},
								copy = {
									order = 2,
									type = "select",
									name = L["LABEL_COOLDOWN_COPY_FROM"],
									desc = L["TOOLTIP_COOLDOWN_COPY_FROM"],
									get = function()
										return ''
									end,
									set = function(self,value)
										CopyCooldownFormatting(value,1,'primary',1)
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
									values = {
										["primary;2"] = PRIMARY.." #2",
										["primary;3"] = PRIMARY.." #3",
										["secondary;1"] = SECONDARY.." #1",
										["secondary;2"] = SECONDARY.." #2",
									},
								},
								alertFlash = {
									order = 3,
									name = L["LABEL_ALERT_ANIMATE"],
									desc = L["TOOLTIP_ALERT_ANIMATE"],
									type = "toggle",
									get = function()
										return cooldowns.primary[1].text.formatting.alert.animate
									end,
									set = function(self,value)
										cooldowns.primary[1].text.formatting.alert.animate = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
								alertColor = {
									type = "color",
									order = 4,
									name = L["LABEL_ALERT_COLOR"],
									desc = L["TOOLTIP_ALERT_COLOR"],
									hasAlpha = true,
									get = function(info)
										local color = cooldowns.primary[1].text.formatting.alert.color
										return color.r, color.g, color.b, color.a
									end,
									set = function(info, r, g, b, a)
										local color = cooldowns.primary[1].text.formatting.alert.color
										
										color.r = tonumber(string.format("%.2f",r))
										color.g = tonumber(string.format("%.2f",g))
										color.b = tonumber(string.format("%.2f",b))
										color.a = tonumber(string.format("%.2f",a))
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
								alertThreshold = {
									order = 5,
									type = "range",
									name = L["LABEL_ALERT_THRESHOLD"],
									desc = L["TOOLTIP_ALERT_THRESHOLD"],
									min = 3,
									max = 10,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.primary[1].text.formatting.alert.threshold end,
									set = function(self,value)
										cooldowns.primary[1].text.formatting.alert.threshold = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
								decimals = {
									order = 6,
									name = L["LABEL_DECIMALS"],
									desc = L["TOOLTIP_DECIMALS"],
									type = "toggle",
									get = function()
										return cooldowns.primary[1].text.formatting.decimals
									end,
									set = function(self,value)
										cooldowns.primary[1].text.formatting.decimals = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
								format = {
									order = 7,
									type = "select",
									name = L["LABEL_MINUTE_FORMAT"],
									desc = L["TOOLTIP_MINUTE_FORMAT"],
									get = function()
										return cooldowns.primary[1].text.formatting.length
									end,
									set = function(self,value)
										--cooldowns.primary[1].text.justify = value
										--CheckRestorationDefaultValues(res_options,'Cooldowns')
										cooldowns.primary[1].text.formatting.length = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
									values = TIME_FORMATS,
								},
							},
						},
						p1_adjustGroup = {
							name = L["LABEL_COOLDOWN_SETTINGS"],
							type = "group",
							order = 10,
							guiInline = true,
							args = {
								color = {
									type = "color",
									order = 1,
									name = L["LABEL_FONT_COLOR"],
									desc = L["TOOLTIP_FONT_COLOR"],
									hasAlpha = true,
									get = function(info)
										local color = cooldowns.primary[1].text.font.color
										return color.r, color.g, color.b, color.a
									end,
									set = function(info, r, g, b, a)
										local color = cooldowns.primary[1].text.font.color
										
										color.r = tonumber(string.format("%.2f",r))
										color.g = tonumber(string.format("%.2f",g))
										color.b = tonumber(string.format("%.2f",b))
										color.a = tonumber(string.format("%.2f",a))
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
									width = "double",
								},
								copy = {
									order = 3,
									type = "select",
									name = L["LABEL_COOLDOWN_COPY_FROM"],
									desc = L["TOOLTIP_COOLDOWN_COPY_FROM"],
									get = function()
										return ''
									end,
									set = function(self,value)
										CopyCooldownOptions(value,1,'primary',1)
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
									values = {
										["primary;2"] = PRIMARY.." #2",
										["primary;3"] = PRIMARY.." #3",
										["secondary;1"] = SECONDARY.." #1",
										["secondary;2"] = SECONDARY.." #2",
									},
								},
								fontName = {
									order = 4,
									type = "select",
									dialogControl = "LSM30_Font",
									name = L["LABEL_FONT"],
									desc = L["TOOLTIP_FONT_NAME"],
									values = LSM:HashTable("font"),
									get = function() return cooldowns.primary[1].text.font.name end,
									set = function(self,value)
										cooldowns.primary[1].text.font.name = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
								fontSize = {
									order = 5,
									type = "range",
									name = FONT_SIZE,
									desc = L["TOOLTIP_COOLDOWN_FONT_SIZE"],
									min = 5,
									max = 40,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.primary[1].text.font.size end,
									set = function(self,value)
										cooldowns.primary[1].text.font.size = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
								fontOutline = {
									order = 6,
									type = "select",
									name = L["LABEL_FONT_OUTLINE"],
									desc = L["TOOLTIP_FONT_OUTLINE"],
									get = function()
										return cooldowns.primary[1].text.font.flag
									end,
									set = function(self,value)
										cooldowns.primary[1].text.font.flag = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
									values = FONT_OUTLINES,
								},
								textAnchor = {
									order = 7,
									type = "select",
									name = L["LABEL_FONT_ANCHOR"],
									desc = L["TOOLTIP_FONT_ANCHOR_POINT"],
									get = function()
										return cooldowns.primary[1].text.justify
									end,
									set = function(self,value)
										cooldowns.primary[1].text.justify = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
									values = FRAME_ANCHOR_OPTIONS,
								},
								textX = {
									order = 8,
									type = "range",
									name = "X",
									desc = L["TOOLTIP_FONT_X_OFFSET"],
									min = -100,
									max = 100,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.primary[1].text.x end,
									set = function(self,value)
										cooldowns.primary[1].text.x = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
								textY = {
									order = 9,
									type = "range",
									name = "Y",
									desc = L["TOOLTIP_FONT_Y_OFFSET"],
									min = -100,
									max = 100,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.primary[1].text.y end,
									set = function(self,value)
										cooldowns.primary[1].text.y = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
								shadow = {
									name = '|cFFFFFFFF'..L["LABEL_FONT_SHADOW"]..'|r',
									type = "group",
									order = 10,
									hidden = false,
									guiInline = true,
									args = {
										shadowToggle = {
											order = 1,
											name = L["TOGGLE"],
											desc = '',
											type = "toggle",
											get = function()
												return cooldowns.primary[1].text.font.shadow.isEnabled
											end,
											set = function(self,value)
												cooldowns.primary[1].text.font.shadow.isEnabled = value
												CheckElementalDefaultValues(ele_options,'Cooldowns')
											end,
										},
										shadowColor = {
											type = "color",
											order = 2,
											name = L["LABEL_FONT_SHADOW_COLOR"],
											desc = L["TOOLTIP_FONT_SHADOW_COLOR"],
											hasAlpha = true,
											get = function(info)
												local color = cooldowns.primary[1].text.font.shadow.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = cooldowns.primary[1].text.font.shadow.color

												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckElementalDefaultValues(ele_options,'Cooldowns')
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
											desc = L["TOOLTIP_FONT_SHADOW_X_OFFSET"],
											min = -10,
											max = 10,
											step = 1,
											bigStep = 1,
											disabled = true,
											get = function() return cooldowns.primary[1].text.font.shadow.offset.x end,
											set = function(self,value)
												cooldowns.primary[1].text.font.shadow.offset.x = value
												CheckElementalDefaultValues(ele_options,'Cooldowns')
											end,
										},
										shadowY = {
											order = 5,
											type = "range",
											name = "Y",
											desc = L["TOOLTIP_FONT_SHADOW_Y_OFFSET"],
											min = -10,
											max = 10,
											step = 1,
											bigStep = 1,
											disabled = true,
											get = function() return cooldowns.primary[1].text.font.shadow.offset.y end,
											set = function(self,value)
												cooldowns.primary[1].text.font.shadow.offset.y = value
												CheckElementalDefaultValues(ele_options,'Cooldowns')
											end,
										},
									},
								},
								reset = {
									order = 11,
									type = "execute",
									name = RESET_TO_DEFAULT,
									func = function()
										local cd = cooldowns.primary[1]
										local default = cooldownDefaults
										
										cd.text.isDisplayText = true
										cd.text.x = default.text.x
										cd.text.y = default.text.y
										cd.text.font.name = default.text.font.name
										cd.text.font.size = default.text.font.size
										cd.text.font.flag = default.text.font.flag
										cd.text.font.color.r = default.text.font.color.r
										cd.text.font.color.g = default.text.font.color.g
										cd.text.font.color.b = default.text.font.color.b
										cd.text.font.color.a = default.text.font.color.a
										cd.text.font.shadow.isEnabled = false
										cd.text.font.shadow.offset.x = default.text.font.shadow.offset.x
										cd.text.font.shadow.offset.y = default.text.font.shadow.offset.y
										cd.text.font.shadow.color.r = default.text.font.shadow.color.r
										cd.text.font.shadow.color.g = default.text.font.shadow.color.g
										cd.text.font.shadow.color.b = default.text.font.shadow.color.b
										cd.text.font.shadow.color.a = default.text.font.shadow.color.a
										cd.text.justify = default.text.justify

										ele_options.args.cooldowns.args.p1_adjustGroup.args.reset.disabled = true
										ele_options.args.cooldowns.args.p1_adjustGroup.args.reset.name = "|cFF666666"..RESET_TO_DEFAULT.."|r"
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
							},
						},
						p2_formatting = {
							name = FORMATTING,
							type = "group",
							order = 11,
							guiInline = true,
							args = {
								alertToggle = {
									order = 1,
									name = L["LABEL_ALERT"],
									desc = L["TOOLTIP_ALERT"],
									type = "toggle",
									get = function()
										return cooldowns.primary[2].text.formatting.alert.isEnabled
									end,
									set = function(self,value)
										cooldowns.primary[2].text.formatting.alert.isEnabled = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
									width = "double",
								},
								copy = {
									order = 2,
									type = "select",
									name = L["LABEL_COOLDOWN_COPY_FROM"],
									desc = L["TOOLTIP_COOLDOWN_COPY_FROM"],
									get = function()
										return ''
									end,
									set = function(self,value)
										CopyCooldownFormatting(value,1,'primary',2)
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
									values = {
										["primary;1"] = PRIMARY.." #1",
										["primary;3"] = PRIMARY.." #3",
										["secondary;1"] = SECONDARY.." #1",
										["secondary;2"] = SECONDARY.." #2",
									},
								},
								alertFlash = {
									order = 3,
									name = L["LABEL_ALERT_ANIMATE"],
									desc = L["TOOLTIP_ALERT_ANIMATE"],
									type = "toggle",
									get = function()
										return cooldowns.primary[2].text.formatting.alert.animate
									end,
									set = function(self,value)
										cooldowns.primary[2].text.formatting.alert.animate = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
								alertColor = {
									type = "color",
									order = 4,
									name = L["LABEL_ALERT_COLOR"],
									desc = L["TOOLTIP_ALERT_COLOR"],
									hasAlpha = true,
									get = function(info)
										local color = cooldowns.primary[2].text.formatting.alert.color
										return color.r, color.g, color.b, color.a
									end,
									set = function(info, r, g, b, a)
										local color = cooldowns.primary[2].text.formatting.alert.color
										
										color.r = tonumber(string.format("%.2f",r))
										color.g = tonumber(string.format("%.2f",g))
										color.b = tonumber(string.format("%.2f",b))
										color.a = tonumber(string.format("%.2f",a))
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
								alertThreshold = {
									order = 5,
									type = "range",
									name = L["LABEL_ALERT_THRESHOLD"],
									desc = L["TOOLTIP_ALERT_THRESHOLD"],
									min = 3,
									max = 10,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.primary[2].text.formatting.alert.threshold end,
									set = function(self,value)
										cooldowns.primary[2].text.formatting.alert.threshold = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
								decimals = {
									order = 6,
									name = L["LABEL_DECIMALS"],
									desc = L["TOOLTIP_DECIMALS"],
									type = "toggle",
									get = function()
										return cooldowns.primary[2].text.formatting.decimals
									end,
									set = function(self,value)
										cooldowns.primary[2].text.formatting.decimals = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
								format = {
									order = 7,
									type = "select",
									name = L["LABEL_MINUTE_FORMAT"],
									desc = L["TOOLTIP_MINUTE_FORMAT"],
									get = function()
										return cooldowns.primary[2].text.formatting.length
									end,
									set = function(self,value)
										--cooldowns.primary[1].text.justify = value
										--CheckRestorationDefaultValues(res_options,'Cooldowns')
										cooldowns.primary[2].text.formatting.length = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
									values = TIME_FORMATS,
								},
							},
						},
						p2_adjustGroup = {
							name = L["LABEL_COOLDOWN_SETTINGS"],
							type = "group",
							order = 12,
							hidden = true,
							guiInline = true,
							args = {
								color = {
									type = "color",
									order = 1,
									name = L["LABEL_FONT_COLOR"],
									desc = L["TOOLTIP_FONT_COLOR"],
									hasAlpha = true,
									get = function(info)
										local color = cooldowns.primary[2].text.font.color
										return color.r, color.g, color.b, color.a
									end,
									set = function(info, r, g, b, a)
										local color = cooldowns.primary[2].text.font.color
										
										color.r = tonumber(string.format("%.2f",r))
										color.g = tonumber(string.format("%.2f",g))
										color.b = tonumber(string.format("%.2f",b))
										color.a = tonumber(string.format("%.2f",a))
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
									width = "double",
								},
								copy = {
									order = 3,
									type = "select",
									name = L["LABEL_COOLDOWN_COPY_FROM"],
									desc = L["TOOLTIP_COOLDOWN_COPY_FROM"],
									get = function()
										return ''
									end,
									set = function(self,value)
										--cooldowns.primary[1].text.justify = value
										--CheckRestorationDefaultValues(res_options,'Cooldowns')
										CopyCooldownOptions(value,1,'primary',2)
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
									values = {
										["primary;1"] = PRIMARY.." #1",
										["primary;3"] = PRIMARY.." #3",
										["secondary;1"] = SECONDARY.." #1",
										["secondary;2"] = SECONDARY.." #2",
									},
								},
								fontName = {
									order = 4,
									type = "select",
									dialogControl = "LSM30_Font",
									name = L["LABEL_FONT"],
									desc = L["TOOLTIP_FONT_NAME"],
									values = LSM:HashTable("font"),
									get = function() return cooldowns.primary[2].text.font.name end,
									set = function(self,value)
										cooldowns.primary[2].text.font.name = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
								fontSize = {
									order = 5,
									type = "range",
									name = FONT_SIZE,
									desc = L["TOOLTIP_COOLDOWN_FONT_SIZE"],
									min = 5,
									max = 40,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.primary[2].text.font.size end,
									set = function(self,value)
										cooldowns.primary[2].text.font.size = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
								fontOutline = {
									order = 6,
									type = "select",
									name = L["LABEL_FONT_OUTLINE"],
									desc = L["TOOLTIP_FONT_OUTLINE"],
									get = function()
										return cooldowns.primary[2].text.font.flag
									end,
									set = function(self,value)
										cooldowns.primary[2].text.font.flag = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
									values = FONT_OUTLINES,
								},
								textAnchor = {
									order = 7,
									type = "select",
									name = L["LABEL_FONT_ANCHOR"],
									desc = L["TOOLTIP_FONT_ANCHOR_POINT"],
									get = function()
										return cooldowns.primary[2].text.justify
									end,
									set = function(self,value)
										cooldowns.primary[2].text.justify = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
									values = FRAME_ANCHOR_OPTIONS,
								},
								textX = {
									order = 8,
									type = "range",
									name = "X",
									desc = L["TOOLTIP_FONT_X_OFFSET"],
									min = -100,
									max = 100,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.primary[2].text.x end,
									set = function(self,value)
										cooldowns.primary[2].text.x = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
								textY = {
									order = 9,
									type = "range",
									name = "Y",
									desc = L["TOOLTIP_FONT_Y_OFFSET"],
									min = -100,
									max = 100,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.primary[2].text.y end,
									set = function(self,value)
										cooldowns.primary[2].text.y = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
								shadow = {
									name = '|cFFFFFFFF'..L["LABEL_FONT_SHADOW"]..'|r',
									type = "group",
									order = 10,
									hidden = false,
									guiInline = true,
									args = {
										shadowToggle = {
											order = 1,
											name = L["TOGGLE"],
											desc = '',
											type = "toggle",
											get = function()
												return cooldowns.primary[2].text.font.shadow.isEnabled
											end,
											set = function(self,value)
												cooldowns.primary[2].text.font.shadow.isEnabled = value
												CheckElementalDefaultValues(ele_options,'Cooldowns')
											end,
										},
										shadowColor = {
											type = "color",
											order = 2,
											name = L["LABEL_FONT_SHADOW_COLOR"],
											desc = L["TOOLTIP_FONT_SHADOW_COLOR"],
											hasAlpha = true,
											get = function(info)
												local color = cooldowns.primary[2].text.font.shadow.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = cooldowns.primary[2].text.font.shadow.color

												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckElementalDefaultValues(ele_options,'Cooldowns')
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
											desc = L["TOOLTIP_FONT_SHADOW_X_OFFSET"],
											min = -10,
											max = 10,
											step = 1,
											bigStep = 1,
											disabled = true,
											get = function() return cooldowns.primary[2].text.font.shadow.offset.x end,
											set = function(self,value)
												cooldowns.primary[2].text.font.shadow.offset.x = value
												CheckElementalDefaultValues(ele_options,'Cooldowns')
											end,
										},
										shadowY = {
											order = 5,
											type = "range",
											name = "Y",
											desc = L["TOOLTIP_FONT_SHADOW_Y_OFFSET"],
											min = -10,
											max = 10,
											step = 1,
											bigStep = 1,
											disabled = true,
											get = function() return cooldowns.primary[2].text.font.shadow.offset.y end,
											set = function(self,value)
												cooldowns.primary[2].text.font.shadow.offset.y = value
												CheckElementalDefaultValues(ele_options,'Cooldowns')
											end,
										},
									},
								},
								reset = {
									order = 11,
									type = "execute",
									name = RESET_TO_DEFAULT,
									func = function()
										local cd = cooldowns.primary[2]
										local default = cooldownDefaults
										
										cd.text.isDisplayText = true
										cd.text.x = default.text.x
										cd.text.y = default.text.y
										cd.text.font.name = default.text.font.name
										cd.text.font.size = default.text.font.size
										cd.text.font.flag = default.text.font.flag
										cd.text.font.color.r = default.text.font.color.r
										cd.text.font.color.g = default.text.font.color.g
										cd.text.font.color.b = default.text.font.color.b
										cd.text.font.color.a = default.text.font.color.a
										cd.text.font.shadow.isEnabled = false
										cd.text.font.shadow.offset.x = default.text.font.shadow.offset.x
										cd.text.font.shadow.offset.y = default.text.font.shadow.offset.y
										cd.text.font.shadow.color.r = default.text.font.shadow.color.r
										cd.text.font.shadow.color.g = default.text.font.shadow.color.g
										cd.text.font.shadow.color.b = default.text.font.shadow.color.b
										cd.text.font.shadow.color.a = default.text.font.shadow.color.a
										cd.text.justify = default.text.justify

										ele_options.args.cooldowns.args.p2_adjustGroup.args.reset.disabled = true
										ele_options.args.cooldowns.args.p2_adjustGroup.args.reset.name = "|cFF666666"..RESET_TO_DEFAULT.."|r"
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
							},
						},
						p3_formatting = {
							name = FORMATTING,
							type = "group",
							order = 13,
							guiInline = true,
							args = {
								alertToggle = {
									order = 1,
									name = L["LABEL_ALERT"],
									desc = L["TOOLTIP_ALERT"],
									type = "toggle",
									get = function()
										return cooldowns.primary[3].text.formatting.alert.isEnabled
									end,
									set = function(self,value)
										cooldowns.primary[3].text.formatting.alert.isEnabled = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
									width = "double",
								},
								copy = {
									order = 2,
									type = "select",
									name = L["LABEL_COOLDOWN_COPY_FROM"],
									desc = L["TOOLTIP_COOLDOWN_COPY_FROM"],
									get = function()
										return ''
									end,
									set = function(self,value)
										CopyCooldownFormatting(value,1,'primary',3)
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
									values = {
										["primary;1"] = PRIMARY.." #1",
										["primary;2"] = PRIMARY.." #2",
										["secondary;1"] = SECONDARY.." #1",
										["secondary;2"] = SECONDARY.." #2",
									},
								},
								alertFlash = {
									order = 3,
									name = L["LABEL_ALERT_ANIMATE"],
									desc = L["TOOLTIP_ALERT_ANIMATE"],
									type = "toggle",
									get = function()
										return cooldowns.primary[3].text.formatting.alert.animate
									end,
									set = function(self,value)
										cooldowns.primary[3].text.formatting.alert.animate = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
								alertColor = {
									type = "color",
									order = 4,
									name = L["LABEL_ALERT_COLOR"],
									desc = L["TOOLTIP_ALERT_COLOR"],
									hasAlpha = true,
									get = function(info)
										local color = cooldowns.primary[3].text.formatting.alert.color
										return color.r, color.g, color.b, color.a
									end,
									set = function(info, r, g, b, a)
										local color = cooldowns.primary[3].text.formatting.alert.color
										
										color.r = tonumber(string.format("%.2f",r))
										color.g = tonumber(string.format("%.2f",g))
										color.b = tonumber(string.format("%.2f",b))
										color.a = tonumber(string.format("%.2f",a))
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
								alertThreshold = {
									order = 5,
									type = "range",
									name = L["LABEL_ALERT_THRESHOLD"],
									desc = L["TOOLTIP_ALERT_THRESHOLD"],
									min = 3,
									max = 10,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.primary[3].text.formatting.alert.threshold end,
									set = function(self,value)
										cooldowns.primary[3].text.formatting.alert.threshold = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
								decimals = {
									order = 6,
									name = L["LABEL_DECIMALS"],
									desc = L["TOOLTIP_DECIMALS"],
									type = "toggle",
									get = function()
										return cooldowns.primary[3].text.formatting.decimals
									end,
									set = function(self,value)
										cooldowns.primary[3].text.formatting.decimals = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
								format = {
									order = 7,
									type = "select",
									name = L["LABEL_MINUTE_FORMAT"],
									desc = L["TOOLTIP_MINUTE_FORMAT"],
									get = function()
										return cooldowns.primary[3].text.formatting.length
									end,
									set = function(self,value)
										--cooldowns.primary[3].text.justify = value
										--CheckRestorationDefaultValues(res_options,'Cooldowns')
										cooldowns.primary[3].text.formatting.length = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
									values = TIME_FORMATS,
								},
							},
						},
						p3_adjustGroup = {
							name = L["LABEL_COOLDOWN_SETTINGS"],
							type = "group",
							order = 14,
							hidden = true,
							guiInline = true,
							args = {
								color = {
									type = "color",
									order = 1,
									name = L["LABEL_FONT_COLOR"],
									desc = L["TOOLTIP_FONT_COLOR"],
									hasAlpha = true,
									get = function(info)
										local color = cooldowns.primary[3].text.font.color
										return color.r, color.g, color.b, color.a
									end,
									set = function(info, r, g, b, a)
										local color = cooldowns.primary[3].text.font.color
										
										color.r = tonumber(string.format("%.2f",r))
										color.g = tonumber(string.format("%.2f",g))
										color.b = tonumber(string.format("%.2f",b))
										color.a = tonumber(string.format("%.2f",a))
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
									width = "double",
								},
								copy = {
									order = 3,
									type = "select",
									name = L["LABEL_COOLDOWN_COPY_FROM"],
									desc = L["TOOLTIP_COOLDOWN_COPY_FROM"],
									get = function()
										return ''
									end,
									set = function(self,value)
										--cooldowns.primary[1].text.justify = value
										--CheckRestorationDefaultValues(res_options,'Cooldowns')
										CopyCooldownOptions(value,1,'primary',3)
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
									values = {
										["primary;1"] = PRIMARY.." #1",
										["primary;2"] = PRIMARY.." #2",
										["secondary;1"] = SECONDARY.." #1",
										["secondary;2"] = SECONDARY.." #2",
									},
								},
								fontName = {
									order = 4,
									type = "select",
									dialogControl = "LSM30_Font",
									name = L["LABEL_FONT"],
									desc = L["TOOLTIP_FONT_NAME"],
									values = LSM:HashTable("font"),
									get = function() return cooldowns.primary[3].text.font.name end,
									set = function(self,value)
										cooldowns.primary[3].text.font.name = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
								fontSize = {
									order = 5,
									type = "range",
									name = FONT_SIZE,
									desc = L["TOOLTIP_COOLDOWN_FONT_SIZE"],
									min = 5,
									max = 40,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.primary[3].text.font.size end,
									set = function(self,value)
										cooldowns.primary[3].text.font.size = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
								fontOutline = {
									order = 6,
									type = "select",
									name = L["LABEL_FONT_OUTLINE"],
									desc = L["TOOLTIP_FONT_OUTLINE"],
									get = function()
										return cooldowns.primary[3].text.font.flag
									end,
									set = function(self,value)
										cooldowns.primary[3].text.font.flag = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
									values = FONT_OUTLINES,
								},
								textAnchor = {
									order = 7,
									type = "select",
									name = L["LABEL_FONT_ANCHOR"],
									desc = L["TOOLTIP_FONT_ANCHOR_POINT"],
									get = function()
										return cooldowns.primary[3].text.justify
									end,
									set = function(self,value)
										cooldowns.primary[3].text.justify = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
									values = FRAME_ANCHOR_OPTIONS,
								},
								textX = {
									order = 8,
									type = "range",
									name = "X",
									desc = L["TOOLTIP_FONT_X_OFFSET"],
									min = -100,
									max = 100,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.primary[3].text.x end,
									set = function(self,value)
										cooldowns.primary[3].text.x = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
								textY = {
									order = 9,
									type = "range",
									name = "Y",
									desc = L["TOOLTIP_FONT_Y_OFFSET"],
									min = -100,
									max = 100,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.primary[3].text.y end,
									set = function(self,value)
										cooldowns.primary[3].text.y = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
								shadow = {
									name = '|cFFFFFFFF'..L["LABEL_FONT_SHADOW"]..'|r',
									type = "group",
									order = 10,
									hidden = false,
									guiInline = true,
									args = {
										shadowToggle = {
											order = 1,
											name = L["TOGGLE"],
											desc = '',
											type = "toggle",
											get = function()
												return cooldowns.primary[3].text.font.shadow.isEnabled
											end,
											set = function(self,value)
												cooldowns.primary[3].text.font.shadow.isEnabled = value
												CheckElementalDefaultValues(ele_options,'Cooldowns')
											end,
										},
										shadowColor = {
											type = "color",
											order = 2,
											name = L["LABEL_FONT_SHADOW_COLOR"],
											desc = L["TOOLTIP_FONT_SHADOW_COLOR"],
											hasAlpha = true,
											get = function(info)
												local color = cooldowns.primary[3].text.font.shadow.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = cooldowns.primary[3].text.font.shadow.color

												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckElementalDefaultValues(ele_options,'Cooldowns')
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
											desc = L["TOOLTIP_FONT_SHADOW_X_OFFSET"],
											min = -10,
											max = 10,
											step = 1,
											bigStep = 1,
											disabled = true,
											get = function() return cooldowns.primary[3].text.font.shadow.offset.x end,
											set = function(self,value)
												cooldowns.primary[3].text.font.shadow.offset.x = value
												CheckElementalDefaultValues(ele_options,'Cooldowns')
											end,
										},
										shadowY = {
											order = 5,
											type = "range",
											name = "Y",
											desc = L["TOOLTIP_FONT_SHADOW_Y_OFFSET"],
											min = -10,
											max = 10,
											step = 1,
											bigStep = 1,
											disabled = true,
											get = function() return cooldowns.primary[3].text.font.shadow.offset.y end,
											set = function(self,value)
												cooldowns.primary[3].text.font.shadow.offset.y = value
												CheckElementalDefaultValues(ele_options,'Cooldowns')
											end,
										},
									},
								},
								reset = {
									order = 11,
									type = "execute",
									name = RESET_TO_DEFAULT,
									func = function()
										local cd = cooldowns.primary[3]
										local default = cooldownDefaults
										
										cd.text.isDisplayText = true
										cd.text.x = default.text.x
										cd.text.y = default.text.y
										cd.text.font.name = default.text.font.name
										cd.text.font.size = default.text.font.size
										cd.text.font.flag = default.text.font.flag
										cd.text.font.color.r = default.text.font.color.r
										cd.text.font.color.g = default.text.font.color.g
										cd.text.font.color.b = default.text.font.color.b
										cd.text.font.color.a = default.text.font.color.a
										cd.text.font.shadow.isEnabled = false
										cd.text.font.shadow.offset.x = default.text.font.shadow.offset.x
										cd.text.font.shadow.offset.y = default.text.font.shadow.offset.y
										cd.text.font.shadow.color.r = default.text.font.shadow.color.r
										cd.text.font.shadow.color.g = default.text.font.shadow.color.g
										cd.text.font.shadow.color.b = default.text.font.shadow.color.b
										cd.text.font.shadow.color.a = default.text.font.shadow.color.a
										cd.text.justify = default.text.justify

										ele_options.args.cooldowns.args.p3_adjustGroup.args.reset.disabled = true
										ele_options.args.cooldowns.args.p3_adjustGroup.args.reset.name = "|cFF666666"..RESET_TO_DEFAULT.."|r"
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
							},
						},
						s1_formatting = {
							name = FORMATTING,
							type = "group",
							order = 15,
							guiInline = true,
							args = {
								alertToggle = {
									order = 1,
									name = L["LABEL_ALERT"],
									desc = L["TOOLTIP_ALERT"],
									type = "toggle",
									get = function()
										return cooldowns.secondary[1].text.formatting.alert.isEnabled
									end,
									set = function(self,value)
										cooldowns.secondary[1].text.formatting.alert.isEnabled = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
									width = "double",
								},
								copy = {
									order = 2,
									type = "select",
									name = L["LABEL_COOLDOWN_COPY_FROM"],
									desc = L["TOOLTIP_COOLDOWN_COPY_FROM"],
									get = function()
										return ''
									end,
									set = function(self,value)
										CopyCooldownFormatting(value,1,'secondary',1)
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
									values = {
										["primary;1"] = PRIMARY.." #1",
										["primary;2"] = PRIMARY.." #2",
										["primary;3"] = PRIMARY.." #3",
										["secondary;2"] = SECONDARY.." #2",
									},
								},
								alertFlash = {
									order = 3,
									name = L["LABEL_ALERT_ANIMATE"],
									desc = L["TOOLTIP_ALERT_ANIMATE"],
									type = "toggle",
									get = function()
										return cooldowns.secondary[1].text.formatting.alert.animate
									end,
									set = function(self,value)
										cooldowns.secondary[1].text.formatting.alert.animate = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
								alertColor = {
									type = "color",
									order = 4,
									name = L["LABEL_ALERT_COLOR"],
									desc = L["TOOLTIP_ALERT_COLOR"],
									hasAlpha = true,
									get = function(info)
										local color = cooldowns.secondary[1].text.formatting.alert.color
										return color.r, color.g, color.b, color.a
									end,
									set = function(info, r, g, b, a)
										local color = cooldowns.secondary[1].text.formatting.alert.color
										
										color.r = tonumber(string.format("%.2f",r))
										color.g = tonumber(string.format("%.2f",g))
										color.b = tonumber(string.format("%.2f",b))
										color.a = tonumber(string.format("%.2f",a))
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
								alertThreshold = {
									order = 5,
									type = "range",
									name = L["LABEL_ALERT_THRESHOLD"],
									desc = L["TOOLTIP_ALERT_THRESHOLD"],
									min = 3,
									max = 10,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.secondary[1].text.formatting.alert.threshold end,
									set = function(self,value)
										cooldowns.secondary[1].text.formatting.alert.threshold = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
								decimals = {
									order = 6,
									name = L["LABEL_DECIMALS"],
									desc = L["TOOLTIP_DECIMALS"],
									type = "toggle",
									get = function()
										return cooldowns.secondary[1].text.formatting.decimals
									end,
									set = function(self,value)
										cooldowns.secondary[1].text.formatting.decimals = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
								format = {
									order = 7,
									type = "select",
									name = L["LABEL_MINUTE_FORMAT"],
									desc = L["TOOLTIP_MINUTE_FORMAT"],
									get = function()
										return cooldowns.secondary[1].text.formatting.length
									end,
									set = function(self,value)
										--cooldowns.secondary[1].text.justify = value
										--CheckRestorationDefaultValues(res_options,'Cooldowns')
										cooldowns.secondary[1].text.formatting.length = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
									values = TIME_FORMATS,
								},
							},
						},
						s1_adjustGroup = {
							name = L["LABEL_COOLDOWN_SETTINGS"],
							type = "group",
							order = 16,
							hidden = true,
							guiInline = true,
							args = {
								color = {
									type = "color",
									order = 1,
									name = L["LABEL_FONT_COLOR"],
									desc = L["TOOLTIP_FONT_COLOR"],
									hasAlpha = true,
									get = function(info)
										local color = cooldowns.secondary[1].text.font.color
										return color.r, color.g, color.b, color.a
									end,
									set = function(info, r, g, b, a)
										local color = cooldowns.secondary[1].text.font.color
										
										color.r = tonumber(string.format("%.2f",r))
										color.g = tonumber(string.format("%.2f",g))
										color.b = tonumber(string.format("%.2f",b))
										color.a = tonumber(string.format("%.2f",a))
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
									width = "double",
								},
								copy = {
									order = 3,
									type = "select",
									name = L["LABEL_COOLDOWN_COPY_FROM"],
									desc = L["TOOLTIP_COOLDOWN_COPY_FROM"],
									get = function()
										return ''
									end,
									set = function(self,value)
										--cooldowns.primary[1].text.justify = value
										--CheckRestorationDefaultValues(res_options,'Cooldowns')
										CopyCooldownOptions(value,1,'secondary',1)
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
									values = {
										["primary;1"] = PRIMARY.." #1",
										["primary;2"] = PRIMARY.." #2",
										["primary;3"] = PRIMARY.." #3",
										["secondary;2"] = SECONDARY.." #2",
									},
								},
								fontName = {
									order = 4,
									type = "select",
									dialogControl = "LSM30_Font",
									name = L["LABEL_FONT"],
									desc = L["TOOLTIP_FONT_NAME"],
									values = LSM:HashTable("font"),
									get = function() return cooldowns.secondary[1].text.font.name end,
									set = function(self,value)
										cooldowns.secondary[1].text.font.name = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
								fontSize = {
									order = 5,
									type = "range",
									name = FONT_SIZE,
									desc = L["TOOLTIP_COOLDOWN_FONT_SIZE"],
									min = 5,
									max = 40,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.secondary[1].text.font.size end,
									set = function(self,value)
										cooldowns.secondary[1].text.font.size = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
								fontOutline = {
									order = 6,
									type = "select",
									name = L["LABEL_FONT_OUTLINE"],
									desc = L["TOOLTIP_FONT_OUTLINE"],
									get = function()
										return cooldowns.secondary[1].text.font.flag
									end,
									set = function(self,value)
										cooldowns.secondary[1].text.font.flag = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
									values = FONT_OUTLINES,
								},
								textAnchor = {
									order = 7,
									type = "select",
									name = L["LABEL_FONT_ANCHOR"],
									desc = L["TOOLTIP_FONT_ANCHOR_POINT"],
									get = function()
										return cooldowns.secondary[1].text.justify
									end,
									set = function(self,value)
										cooldowns.secondary[1].text.justify = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
									values = FRAME_ANCHOR_OPTIONS,
								},
								textX = {
									order = 8,
									type = "range",
									name = "X",
									desc = L["TOOLTIP_FONT_X_OFFSET"],
									min = -100,
									max = 100,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.secondary[1].text.x end,
									set = function(self,value)
										cooldowns.secondary[1].text.x = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
								textY = {
									order = 9,
									type = "range",
									name = "Y",
									desc = L["TOOLTIP_FONT_Y_OFFSET"],
									min = -100,
									max = 100,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.secondary[1].text.y end,
									set = function(self,value)
										cooldowns.secondary[1].text.y = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
								shadow = {
									name = '|cFFFFFFFF'..L["LABEL_FONT_SHADOW"]..'|r',
									type = "group",
									order = 10,
									hidden = false,
									guiInline = true,
									args = {
										shadowToggle = {
											order = 1,
											name = L["TOGGLE"],
											desc = '',
											type = "toggle",
											get = function()
												return cooldowns.secondary[1].text.font.shadow.isEnabled
											end,
											set = function(self,value)
												cooldowns.secondary[1].text.font.shadow.isEnabled = value
												CheckElementalDefaultValues(ele_options,'Cooldowns')
											end,
										},
										shadowColor = {
											type = "color",
											order = 2,
											name = L["LABEL_FONT_SHADOW_COLOR"],
											desc = L["TOOLTIP_FONT_SHADOW_COLOR"],
											hasAlpha = true,
											get = function(info)
												local color = cooldowns.secondary[1].text.font.shadow.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = cooldowns.secondary[1].text.font.shadow.color

												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckElementalDefaultValues(ele_options,'Cooldowns')
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
											desc = L["TOOLTIP_FONT_SHADOW_X_OFFSET"],
											min = -10,
											max = 10,
											step = 1,
											bigStep = 1,
											disabled = true,
											get = function() return cooldowns.secondary[1].text.font.shadow.offset.x end,
											set = function(self,value)
												cooldowns.secondary[1].text.font.shadow.offset.x = value
												CheckElementalDefaultValues(ele_options,'Cooldowns')
											end,
										},
										shadowY = {
											order = 5,
											type = "range",
											name = "Y",
											desc = L["TOOLTIP_FONT_SHADOW_Y_OFFSET"],
											min = -10,
											max = 10,
											step = 1,
											bigStep = 1,
											disabled = true,
											get = function() return cooldowns.secondary[1].text.font.shadow.offset.y end,
											set = function(self,value)
												cooldowns.secondary[1].text.font.shadow.offset.y = value
												CheckElementalDefaultValues(ele_options,'Cooldowns')
											end,
										},
									},
								},
								reset = {
									order = 11,
									type = "execute",
									name = RESET_TO_DEFAULT,
									func = function()
										local cd = cooldowns.secondary[1]
										local default = cooldownDefaults
										
										cd.text.isDisplayText = true
										cd.text.x = default.text.x
										cd.text.y = default.text.y
										cd.text.font.name = default.text.font.name
										cd.text.font.size = default.text.font.size
										cd.text.font.flag = default.text.font.flag
										cd.text.font.color.r = default.text.font.color.r
										cd.text.font.color.g = default.text.font.color.g
										cd.text.font.color.b = default.text.font.color.b
										cd.text.font.color.a = default.text.font.color.a
										cd.text.font.shadow.isEnabled = false
										cd.text.font.shadow.offset.x = default.text.font.shadow.offset.x
										cd.text.font.shadow.offset.y = default.text.font.shadow.offset.y
										cd.text.font.shadow.color.r = default.text.font.shadow.color.r
										cd.text.font.shadow.color.g = default.text.font.shadow.color.g
										cd.text.font.shadow.color.b = default.text.font.shadow.color.b
										cd.text.font.shadow.color.a = default.text.font.shadow.color.a
										cd.text.justify = default.text.justify

										ele_options.args.cooldowns.args.s1_adjustGroup.args.reset.disabled = true
										ele_options.args.cooldowns.args.s1_adjustGroup.args.reset.name = "|cFF666666"..RESET_TO_DEFAULT.."|r"
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
							},
						},
						s2_formatting = {
							name = FORMATTING,
							type = "group",
							order = 17,
							guiInline = true,
							args = {
								alertToggle = {
									order = 1,
									name = L["LABEL_ALERT"],
									desc = L["TOOLTIP_ALERT"],
									type = "toggle",
									get = function()
										return cooldowns.secondary[2].text.formatting.alert.isEnabled
									end,
									set = function(self,value)
										cooldowns.secondary[2].text.formatting.alert.isEnabled = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
									width = "double",
								},
								copy = {
									order = 2,
									type = "select",
									name = L["LABEL_COOLDOWN_COPY_FROM"],
									desc = L["TOOLTIP_COOLDOWN_COPY_FROM"],
									get = function()
										return ''
									end,
									set = function(self,value)
										CopyCooldownFormatting(value,1,'secondary',2)
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
									values = {
										["primary;1"] = PRIMARY.." #1",
										["primary;2"] = PRIMARY.." #2",
										["primary;3"] = PRIMARY.." #3",
										["secondary;1"] = SECONDARY.." #1",
									},
								},
								alertFlash = {
									order = 3,
									name = L["LABEL_ALERT_ANIMATE"],
									desc = L["TOOLTIP_ALERT_ANIMATE"],
									type = "toggle",
									get = function()
										return cooldowns.secondary[2].text.formatting.alert.animate
									end,
									set = function(self,value)
										cooldowns.secondary[2].text.formatting.alert.animate = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
								alertColor = {
									type = "color",
									order = 4,
									name = L["LABEL_ALERT_COLOR"],
									desc = L["TOOLTIP_ALERT_COLOR"],
									hasAlpha = true,
									get = function(info)
										local color = cooldowns.secondary[2].text.formatting.alert.color
										return color.r, color.g, color.b, color.a
									end,
									set = function(info, r, g, b, a)
										local color = cooldowns.secondary[2].text.formatting.alert.color
										
										color.r = tonumber(string.format("%.2f",r))
										color.g = tonumber(string.format("%.2f",g))
										color.b = tonumber(string.format("%.2f",b))
										color.a = tonumber(string.format("%.2f",a))
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
								alertThreshold = {
									order = 5,
									type = "range",
									name = L["LABEL_ALERT_THRESHOLD"],
									desc = L["TOOLTIP_ALERT_THRESHOLD"],
									min = 3,
									max = 10,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.secondary[2].text.formatting.alert.threshold end,
									set = function(self,value)
										cooldowns.secondary[2].text.formatting.alert.threshold = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
								decimals = {
									order = 6,
									name = L["LABEL_DECIMALS"],
									desc = L["TOOLTIP_DECIMALS"],
									type = "toggle",
									get = function()
										return cooldowns.secondary[2].text.formatting.decimals
									end,
									set = function(self,value)
										cooldowns.secondary[2].text.formatting.decimals = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
								format = {
									order = 7,
									type = "select",
									name = L["LABEL_MINUTE_FORMAT"],
									desc = L["TOOLTIP_MINUTE_FORMAT"],
									get = function()
										return cooldowns.secondary[2].text.formatting.length
									end,
									set = function(self,value)
										--cooldowns.secondary[2].text.justify = value
										--CheckRestorationDefaultValues(res_options,'Cooldowns')
										cooldowns.secondary[2].text.formatting.length = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
									values = TIME_FORMATS,
								},
							},
						},
						s2_adjustGroup = {
							name = L["LABEL_COOLDOWN_SETTINGS"],
							type = "group",
							order = 18,
							hidden = true,
							guiInline = true,
							args = {
								color = {
									type = "color",
									order = 1,
									name = L["LABEL_FONT_COLOR"],
									desc = L["TOOLTIP_FONT_COLOR"],
									hasAlpha = true,
									get = function(info)
										local color = cooldowns.secondary[2].text.font.color
										return color.r, color.g, color.b, color.a
									end,
									set = function(info, r, g, b, a)
										local color = cooldowns.secondary[2].text.font.color
										
										color.r = tonumber(string.format("%.2f",r))
										color.g = tonumber(string.format("%.2f",g))
										color.b = tonumber(string.format("%.2f",b))
										color.a = tonumber(string.format("%.2f",a))
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
									width = "double",
								},
								copy = {
									order = 3,
									type = "select",
									name = L["LABEL_COOLDOWN_COPY_FROM"],
									desc = L["TOOLTIP_COOLDOWN_COPY_FROM"],
									get = function()
										return ''
									end,
									set = function(self,value)
										--cooldowns.primary[1].text.justify = value
										--CheckRestorationDefaultValues(res_options,'Cooldowns')
										CopyCooldownOptions(value,1,'secondary',2)
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
									values = {
										["primary;1"] = PRIMARY.." #1",
										["primary;2"] = PRIMARY.." #2",
										["primary;3"] = PRIMARY.." #3",
										["secondary;1"] = SECONDARY.." #1",
									},
								},
								fontName = {
									order = 4,
									type = "select",
									dialogControl = "LSM30_Font",
									name = L["LABEL_FONT"],
									desc = L["TOOLTIP_FONT_NAME"],
									values = LSM:HashTable("font"),
									get = function() return cooldowns.secondary[2].text.font.name end,
									set = function(self,value)
										cooldowns.secondary[2].text.font.name = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
								fontSize = {
									order = 5,
									type = "range",
									name = FONT_SIZE,
									desc = L["TOOLTIP_COOLDOWN_FONT_SIZE"],
									min = 5,
									max = 40,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.secondary[2].text.font.size end,
									set = function(self,value)
										cooldowns.secondary[2].text.font.size = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
								fontOutline = {
									order = 6,
									type = "select",
									name = L["LABEL_FONT_OUTLINE"],
									desc = L["TOOLTIP_FONT_OUTLINE"],
									get = function()
										return cooldowns.secondary[2].text.font.flag
									end,
									set = function(self,value)
										cooldowns.secondary[2].text.font.flag = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
									values = FONT_OUTLINES,
								},
								textAnchor = {
									order = 7,
									type = "select",
									name = L["LABEL_FONT_ANCHOR"],
									desc = L["TOOLTIP_FONT_ANCHOR_POINT"],
									get = function()
										return cooldowns.secondary[2].text.justify
									end,
									set = function(self,value)
										cooldowns.secondary[2].text.justify = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
									values = FRAME_ANCHOR_OPTIONS,
								},
								textX = {
									order = 8,
									type = "range",
									name = "X",
									desc = L["TOOLTIP_FONT_X_OFFSET"],
									min = -100,
									max = 100,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.secondary[2].text.x end,
									set = function(self,value)
										cooldowns.secondary[2].text.x = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
								textY = {
									order = 9,
									type = "range",
									name = "Y",
									desc = L["TOOLTIP_FONT_Y_OFFSET"],
									min = -100,
									max = 100,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.secondary[2].text.y end,
									set = function(self,value)
										cooldowns.secondary[2].text.y = value
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
								shadow = {
									name = '|cFFFFFFFF'..L["LABEL_FONT_SHADOW"]..'|r',
									type = "group",
									order = 10,
									hidden = false,
									guiInline = true,
									args = {
										shadowToggle = {
											order = 1,
											name = L["TOGGLE"],
											desc = '',
											type = "toggle",
											get = function()
												return cooldowns.secondary[2].text.font.shadow.isEnabled
											end,
											set = function(self,value)
												cooldowns.secondary[2].text.font.shadow.isEnabled = value
												CheckElementalDefaultValues(ele_options,'Cooldowns')
											end,
										},
										shadowColor = {
											type = "color",
											order = 2,
											name = L["LABEL_FONT_SHADOW_COLOR"],
											desc = L["TOOLTIP_FONT_SHADOW_COLOR"],
											hasAlpha = true,
											get = function(info)
												local color = cooldowns.secondary[2].text.font.shadow.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = cooldowns.secondary[2].text.font.shadow.color

												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckElementalDefaultValues(ele_options,'Cooldowns')
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
											desc = L["TOOLTIP_FONT_SHADOW_X_OFFSET"],
											min = -10,
											max = 10,
											step = 1,
											bigStep = 1,
											disabled = true,
											get = function() return cooldowns.secondary[2].text.font.shadow.offset.x end,
											set = function(self,value)
												cooldowns.secondary[2].text.font.shadow.offset.x = value
												CheckElementalDefaultValues(ele_options,'Cooldowns')
											end,
										},
										shadowY = {
											order = 5,
											type = "range",
											name = "Y",
											desc = L["TOOLTIP_FONT_SHADOW_Y_OFFSET"],
											min = -10,
											max = 10,
											step = 1,
											bigStep = 1,
											disabled = true,
											get = function() return cooldowns.secondary[2].text.font.shadow.offset.y end,
											set = function(self,value)
												cooldowns.secondary[2].text.font.shadow.offset.y = value
												CheckElementalDefaultValues(ele_options,'Cooldowns')
											end,
										},
									},
								},
								reset = {
									order = 11,
									type = "execute",
									name = RESET_TO_DEFAULT,
									func = function()
										local cd = cooldowns.secondary[2]
										local default = cooldownDefaults
										
										cd.text.isDisplayText = true
										cd.text.x = default.text.x
										cd.text.y = default.text.y
										cd.text.font.name = default.text.font.name
										cd.text.font.size = default.text.font.size
										cd.text.font.flag = default.text.font.flag
										cd.text.font.color.r = default.text.font.color.r
										cd.text.font.color.g = default.text.font.color.g
										cd.text.font.color.b = default.text.font.color.b
										cd.text.font.color.a = default.text.font.color.a
										cd.text.font.shadow.isEnabled = false
										cd.text.font.shadow.offset.x = default.text.font.shadow.offset.x
										cd.text.font.shadow.offset.y = default.text.font.shadow.offset.y
										cd.text.font.shadow.color.r = default.text.font.shadow.color.r
										cd.text.font.shadow.color.g = default.text.font.shadow.color.g
										cd.text.font.shadow.color.b = default.text.font.shadow.color.b
										cd.text.font.shadow.color.a = default.text.font.shadow.color.a
										cd.text.justify = default.text.justify

										ele_options.args.cooldowns.args.s2_adjustGroup.args.reset.disabled = true
										ele_options.args.cooldowns.args.s2_adjustGroup.args.reset.name = "|cFF666666"..RESET_TO_DEFAULT.."|r"
										CheckElementalDefaultValues(ele_options,'Cooldowns')
									end,
								},
							},
						},
					},
				},
				layout = {
					name = L["LABEL_LAYOUT"],
					order = 5,
					type = "group",
					disabled = true,
					args = {
						MoveAuras = {
							order = 1,
							type = "execute",
							name = "|cFFFFCC00"..L["BUTTON_MOVE_AURAS_ELEMENTAL"].."|r",
							func = function()
								elements.isMoving = true
								SSA.Move1.Info:Show()
								Auras:InitMoveAuraGroups(1)
							end,
						},
						ResetAuras = {
							order = 2,
							type = "execute",
							name = "|cFFFFCC00"..L["BUTTON_RESET_AURAS_ELEMENTAL"].."|r",
							func = function()
								Auras:ResetAuraGroupPosition('AuraGroup1')
							end,
						},
						primaryAuras = {
							name = L["LABEL_AURAS_PRIMARY"],
							type = "group",
							order = 3,
							guiInline = true,
							args = {
								PrimaryOrientation1 = {
									order = 1,
									type = "select",
									name = L["LABEL_AURAS_ORIENTATION"].." 1",
									desc = L["TOOLTIP_AURAS_ORIENTATION"],
									get = function()
										return layout.orientation.top
									end,
									set = function(self,value)
										layout.orientation.top = value
										CheckElementalDefaultValues(ele_options,"Primary")
										Auras:UpdateTalents()
									end,
									values = ORIENTATION,
								},
								PrimaryOrientation2 = {
									order = 2,
									type = "select",
									name = L["LABEL_AURAS_ORIENTATION"].." 2",
									desc = L["TOOLTIP_AURAS_ORIENTATION"],
									get = function()
										return layout.orientation.bottom
									end,
									set = function(self,value)
										layout.orientation.bottom = value
										CheckElementalDefaultValues(ele_options,"Primary")
										Auras:UpdateTalents()
									end,
									values = ORIENTATION,
								},
								filler_1 = {
									order = 3,
									type = "description",
									name = ' ',
								},
								AuraSizeRow1 = {
									order = 4,
									type = "range",
									name = L["LABEL_AURAS_SIZE"].." 1",
									desc = L["TOOLTIP_AURAS_SIZE"],
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
									name = L["LABEL_AURAS_SPACING"].." 1",
									desc = L["TOOLTIP_AURAS_SPACING"],
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
									name = L["LABEL_AURAS_CHARGES"].." 1",
									desc = L["TOOLTIP_AURAS_CHARGE_SIZE"],
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
									name = L["LABEL_AURAS_SIZE"].." 2",
									desc = L["TOOLTIP_AURAS_SIZE"],
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
									name = L["LABEL_AURAS_SPACING"].." 2",
									desc = L["TOOLTIP_AURAS_SPACING"],
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
								filler_3 = {
									order = 10,
									type = "description",
									name = ' ',
								},
								ResetPrimaryLayout = {
									order = 11,
									type = "execute",
									--name = "|cFFFFCC00"..L["BUTTON_RESET_LAYOUT_PRIMARY"].."|r",
									--disabled = false,
									name = L["BUTTON_RESET_LAYOUT_PRIMARY"],
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
										res_options.args.layout.args.primaryAuras.args.ResetPrimaryLayout.name = "|cFF666666"..L["BUTTON_RESET_LAYOUT_PRIMARY"].."|r"
										Auras:UpdateTalents()
									end,
								},
							},
						},
						secondaryAuras = {
							name = L["LABEL_AURAS_SECONDARY"],
							type = "group",
							order = 4,
							guiInline = true,
							args = {
								SecondaryOrientation1 = {
									order = 1,
									type = "select",
									name = L["LABEL_AURAS_ORIENTATION"].." 1",
									desc = L["TOOLTIP_AURAS_ORIENTATION"],
									get = function()
										return layout.orientation.left
									end,
									set = function(self,value)
										layout.orientation.left = value
										CheckElementalDefaultValues(ele_options,"Secondary")
										Auras:UpdateTalents()
									end,
									values = ORIENTATION,
								},
								SecondaryOrientation2 = {
									order = 2,
									type = "select",
									name = L["LABEL_AURAS_ORIENTATION"].." 2",
									desc = L["TOOLTIP_AURAS_ORIENTATION"],
									get = function()
										return layout.orientation.right
									end,
									set = function(self,value)
										layout.orientation.right = value
										CheckElementalDefaultValues(ele_options,"Secondary")
										Auras:UpdateTalents()
									end,
									values = ORIENTATION,
								},
								filler_1 = {
									order = 3,
									type = "description",
									name = ' ',
								},
								AuraSizeCol1 = {
									order = 4,
									type = "range",
									name = L["LABEL_AURAS_SIZE"].." 1",
									desc = L["TOOLTIP_AURAS_SIZE"],
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
									name = L["LABEL_AURAS_SPACING"].." 1",
									desc = L["TOOLTIP_AURAS_SPACING"],
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
									name = L["LABEL_AURAS_CHARGES"].." 1",
									desc = L["TOOLTIP_AURAS_CHARGE_SIZE"],
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
									name = L["LABEL_AURAS_SIZE"].." 2",
									desc = L["TOOLTIP_AURAS_SIZE"],
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
									name = L["LABEL_AURAS_SPACING"].." 2",
									desc = L["TOOLTIP_AURAS_SPACING"],
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
									desc = L["TOOLTIP_AURAS_CHARGE_SIZE"],
									min = 10,
									max = 20,
									step = 0.5,
									bigStep = 0.5,
									get = function() return layout.secondary.right.charges end,
									set = function(self,value)
										layout.secondary.right.charges = value
										Auras:UpdateTalents()
									end,
								},]]
								filler_2 = {
									order = 8,
									type = "description",
									name = ' ',
								},
								ResetSecondaryLayout = {
									order = 9,
									type = "execute",
									--name = "|cFFFFCC00"..L["BUTTON_RESET_LAYOUT_SECONDARY"].."|r",
									--disabled = false,
									name = L["BUTTON_RESET_LAYOUT_SECONDARY"],
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
										ele_options.args.layout.args.secondaryAuras.args.ResetSecondaryLayout.name = "|cFF666666"..L["BUTTON_RESET_LAYOUT_SECONDARY"].."|r"
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
		local cooldownDefaults = db.elements.defaults[2].cooldowns
		local statusbarDefaults = db.elements.defaults[2].statusbars
		local frameDefaults = db.elements.defaults[2].frames
	
		enh_options = {
			type = "group",
			childGroups = "tab",
			order = 1,
			name = L["LABEL_AURAS_ENHANCEMENT"],
			desc = '',
			args = {
				display = {
					name = DISPLAY,
					type = "group",
					order = 1,
					args = {
						show = {
							order = 1,
							name = L["LABEL_SHOW_ENHANCEMENT_AURAS"],
							desc = L["TOOLTIP_TOGGLE_ENHANCEMENT_AURAS"],
							type = "toggle",
							get = function()
								return elements.isEnabled
							end,
							set = function(self,value)
								elements.isEnabled = value
								if (not value) then
									SSA.AuraGroup2:Hide()
								else
									SSA.AuraGroup2:Show()
								end
							end,
						},
						MajorAuras = {
							name = L["LABEL_AURAS_MAJOR"],
							type = "group",
							order = 2,
							guiInline = true,
							args = {
								Ascendance = {
									order = 1,
									type = "toggle",
									name = Auras:GetSpellName(114051),
									get = function() 
										return auras.Ascendance2
									end,
									set = function(self,value)
										auras.Ascendance2 = value
										--Auras:ToggleAuraVisibility(1)
										Auras:UpdateTalents()
									end,
								},
								Concordance = {
									order = 2,
									type = "toggle",
									name = Auras:GetSpellName(242586),
									get = function()
										return auras.Concordance2
									end,
									set = function(self,value)
										auras.Concordance2 = value
										Auras:UpdateTalents()
									end,
								},
								CrashLightning = {
									order = 3,
									type = "toggle",
									name = Auras:GetSpellName(187874),
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
									name = Auras:GetSpellName(204945),
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
									name = Auras:GetSpellName(188089),
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
									name = Auras:GetSpellName(196884),
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
									name = Auras:GetSpellName(51533),
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
									name = Auras:GetSpellName(193796),
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
									name = Auras:GetSpellName(196834),
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
									name = Auras:GetSpellName(60103),
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
									name = Auras:GetSpellName(193786),
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
									name = Auras:GetSpellName(17364),
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
									name = Auras:GetSpellName(197214),
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
									name = Auras:GetSpellName(198736),
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
									name = Auras:GetSpellName(201898),
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
							name = L["LABEL_AURAS_MINOR"],
							type = "group",
							order = 3,
							guiInline = true,
							args = {
								AstralShift = {
									order = 1,
									type = "toggle",
									name = Auras:GetSpellName(108271),
									get = function()
										return auras.AstralShift2
									end,
									set = function(self,value)
										auras.AstralShift2 = value
										Auras:UpdateTalents()
									end,
								},
								CleanseSpirit = {
									order = 2,
									type = "toggle",
									name = Auras:GetSpellName(51886),
									get = function()
										return auras.CleanseSpirit2
									end,
									set = function(self,value)
										auras.CleanseSpirit2 = value
										Auras:UpdateTalents()
									end,
								},
								EarthgrabTotem = {
									order = 3,
									type = "toggle",
									name = Auras:GetSpellName(51485),
									get = function()
										return auras.EarthgrabTotem2
									end,
									set = function(self,value)
										auras.EarthgrabTotem2 = value
										Auras:UpdateTalents()
									end,
								},
								Hex = {
									order = 4,
									type = "toggle",
									name = Auras:GetSpellName(51514),
									get = function()
										return auras.Hex2
									end,
									set = function(self,value)
										auras.Hex2 = value
										Auras:UpdateTalents()
									end,
								},
								LightningSurgeTotem = {
									order = 5,
									type = "toggle",
									name = Auras:GetSpellName(192058),
									get = function()
										return auras.LightningSurgeTotem2
									end,
									set = function(self,value)
										auras.LightningSurgeTotem2 = value
										Auras:UpdateTalents()
									end,
								},
								Rainfall = {
									order = 6,
									type = "toggle",
									name = Auras:GetSpellName(215864),
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
									name = Auras:GetSpellName(58875),
									get = function()
										return auras.SpiritWalk
									end,
									set = function(self,value)
										auras.SpiritWalk = value
										Auras:UpdateTalents()
									end,
								},
								VoodooTotem = {
									order = 8,
									type = "toggle",
									name = Auras:GetSpellName(196932),
									get = function()
										return auras.VoodooTotem2
									end,
									set = function(self,value)
										auras.VoodooTotem2 = value
										Auras:UpdateTalents()
									end,
								},
								WindRushTotem = {
									order = 9,
									type = "toggle",
									name = Auras:GetSpellName(192077),
									get = function()
										return auras.WindRushTotem2
									end,
									set = function(self,value)
										auras.WindRushTotem2 = value
										Auras:UpdateTalents()
									end,
								},
								WindShear = {
									order = 10,
									type = "toggle",
									name = Auras:GetSpellName(57994),
									get = function()
										return auras.WindShear2
									end,
									set = function(self,value)
										auras.WindShear2 = value
										Auras:UpdateTalents()
									end,
								},
							},
						},
						ProgressBars = {
							name = L["LABEL_PROGRESS_BARS"],
							type = "group",
							order = 4,
							guiInline = true,
							args = {
								BuffTimerBars = {
									name = L["LABEL_STATUSBAR_BUFF_TIMER"],
									type = "group",
									order = 2,
									guiInline = true,
									args = {
										AscendanceBar2 = {
											order = 1,
											type = "toggle",
											name = Auras:GetSpellName(114051),
											get = function() 
												return timerbars.buff.ascendance
											end,
											set = function(self,value)
												timerbars.buff.ascendance = value
											end,
										},
										AstralShiftBar2 = {
											order = 2,
											type = "toggle",
											name = Auras:GetSpellName(108271),
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
											name = Auras:GetSpellName(2825),
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
											name = Auras:GetSpellName(32182),
											hidden = false,
											get = function() 
												return timerbars.buff.heroism
											end,
											set = function(self,value)
												timerbars.buff.heroism = value
											end,
										},
										HexBar2 = {
											order = 5,
											type = "toggle",
											name = Auras:GetSpellName(51514),
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
											name = Auras:GetSpellName(58875),
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
											name = Auras:GetSpellName(80353),
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
									name = L["LABEL_TIMERS_ABILITY"],
									type = "group",
									order = 3,
									guiInline = true,
									args = {
										CrashLightningBar = {
											order = 2,
											type = "toggle",
											name = Auras:GetSpellName(187874),
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
											name = Auras:GetSpellName(188089),
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
											name = Auras:GetSpellName(193796),
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
											name = Auras:GetSpellName(196834),
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
											name = Auras:GetSpellName(197992),
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
											name = Auras:GetSpellName(201898),
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
									name = L["LABEL_TIMERS_TOTEM"],
									type = "group",
									order = 4,
									guiInline = true,
									args = {
										EarthgrabTotemBar2 = {
											order = 1,
											type = "toggle",
											name = Auras:GetSpellName(51485),
											get = function() 
												return timerbars.util.earthgrabTotem
											end,
											set = function(self,value)
												timerbars.util.earthgrabTotem = value
											end,
										},
										VoodooTotemBar2 = {
											order = 2,
											type = "toggle",
											name = Auras:GetSpellName(196932),
											get = function() 
												return timerbars.util.voodooTotem
											end,
											set = function(self,value)
												timerbars.util.voodooTotem = value
											end,
										},
										WindRushTotemBar2 = {
											order = 3,
											type = "toggle",
											name = Auras:GetSpellName(192077),
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
							name = L["TOOLTIP_TEXTURE_ALERTS"],
							type = "group",
							order = 5,
							guiInline = true,
							args = {
								DoomWinds = {
									order = 1,
									type = "toggle",
									name = Auras:GetSpellName(204945),
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
									name = L["LABEL_STORMSTRIKE_ORBS"],
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
				general = {
					name = MAIN_MENU,
					order = 2,
					type = "group",
					childGroups = "tab",
					disabled = true,
					args = {
						settings = {
							name = L["LABEL_AURAS_SETTINGS"],
							type = "group",
							order = 3,
							guiInline = true,
							args = {
								OoCAlpha = {
									order = 1,
									type = "range",
									name = L["LABEL_ALPHA_NO_COMBAT"],
									desc = L["TOOLTIP_AURAS_ALPHA_NO_COMBAT"],
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
									order = 2,
									name = L["LABEL_COLOR_NO_RANGE"],
									desc = L["TOOLTIP_COLOR_OUT_OF_RANGE"],
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
									width = "double",
								},
								reset = {
									order = 3,
									type = "execute",
									name = L["BUTTON_RESET_SETTINGS"],
									func = function()
										settings.OoCAlpha = settingDefaults.OoCAlpha
										settings.OoRColor.r = settingDefaults.OoRColor.r
										settings.OoRColor.g = settingDefaults.OoRColor.g
										settings.OoRColor.b = settingDefaults.OoRColor.b
										settings.OoRColor.a = settingDefaults.OoRColor.a
										enh_options.args.bars.args.general.args.settings.args.reset.disabled = true
										enh_options.args.bars.args.general.args.settings.args.reset.name = "|cFF666666"..L["BUTTON_RESET_SETTINGS"].."|r"
									end,
								},
							},
						},
					},
				},
				bars = {
					name = L["LABEL_PROGRESS_BARS"],
					order = 3,
					type = "group",
					childGroups = "tab",
					disabled = true,
					args = {
						general = {
							name = GENERAL,
							order = 1,
							inline = false,
							type = "group",
							args = {
								statusbars = {
									name = L["LABEL_STATUSBAR_MANAGER"],
									type = "group",
									order = 1,
									guiInline = true,
									args = {
										defaultBarToggle = {
											order = 1,
											name = L["LABEL_STATUSBAR_BLIZZARD"],
											desc = L["TOOLTIP_TOGGLE_BLIZZARD_BAR"],
											type = "toggle",
											get = function()
												return statusbars.defaultBar
											end,
											set = function(self,value)
												statusbars.defaultBar = value
											end,
										},
										castBarToggle = {
											order = 2,
											name = L["TOGGLE_CAST_BAR"],
											desc = L["TOOLTIP_TOGGLE_CAST_BAR"],
											type = "toggle",
											get = function()
												return statusbars.castBar.isEnabled
											end,
											set = function(self,value)
												if (value) then
													enh_options.args.bars.args.castBar.disabled = false
												else
													enh_options.args.bars.args.castBar.disabled = true
												end
												
												statusbars.castBar.isEnabled = value
											end,
										},
										channelToggle = {
											order = 3,
											name = L["TOGGLE_CHANNEL_BAR"],
											desc = L["TOOLTIP_TOGGLE_CHANNEL_BAR"],
											type = "toggle",
											get = function()
												return statusbars.channelBar.isEnabled
											end,
											set = function(self,value)
												if (value) then
													enh_options.args.bars.args.channelBar.disabled = false
												else
													enh_options.args.bars.args.channelBar.disabled = true
												end
												
												statusbars.channelBar.isEnabled = value
											end,
										},
										maelstromToggle = {
											order = 4,
											name = L["TOGGLE_MAELSTROM_BAR"],
											desc = L["TOOLTIP_TOGGLE_MAELSTROM_BAR"],
											type = "toggle",
											get = function()
												return statusbars.maelstromBar.isEnabled
											end,
											set = function(self,value)
												if (value) then
													enh_options.args.bars.args.maelstromBar.disabled = false
												else
													enh_options.args.bars.args.maelstromBar.disabled = true
												end
												
												statusbars.maelstromBar.isEnabled = value
											end,
										},
									},
								},
							},
						},
						maelstromBar = {
							name = L["LABEL_STATUSBAR_MAELSTROM"],
							order = 2,
							type = "group",
							inline = false,
							args = {
								adjust = {
									order = 1,
									name = L["LABEL_STATUSBAR_MODIFY_MAELSTROM"],
									desc = L["TOOLTIP_TOGGLE_STATUSBAR_CUSTOMIZATON"],
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
									name = L["LABEL_TEXT_MAELSTROM"],
									desc = L["TOOLTIP_TOGGLE_MAELSTROM_TEXT"],
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
									name = L["LABEL_STATUSBAR_ANIMATE_MAELSTROM"],
									get = function() 
										return statusbars.maelstromBar.animate
									end,
									set = function(self,value)
										statusbars.maelstromBar.animate = value
										CheckEnhancementDefaultValues(enh_options,"Maelstrom")
									end,
								},
								general = {
									name = "|cFFFFFFFF"..SETTINGS.."|r",
									order = 4,
									type = "group",
									guiInline = true,
									args = {
										alphaCombat = {
											order = 1,
											type = "range",
											name = L["LABEL_ALPHA_COMBAT"],
											desc = L["TOOLTIP_STATUSBAR_ALPHA_COMBAT"],
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
											name = L["LABEL_ALPHA_NO_TARGET_NO_COMBAT"],
											desc = L["TOOLTIP_STATUSBAR_ALPHA_NO_COMBAT"],
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
											name = L["LABEL_ALPHA_TARGET_NO_COMBAT"],
											desc = L["TOOLTIP_STATUSBAR_ALPHA_TARGET_NO_COMBAT"],
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
											name = L["LABEL_TRIGGER_MAELSTROM"],
											desc = L["TOOLTIP_MAELSTROM_TIME_TRIGGER"],
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
									name = '|cFFFFFFFF'..L["LABEL_TEXT_MAELSTROM"]..'|r',
									type = "group",
									order = 5,
									disabled = true,
									guiInline = true,
									args = {
										color = {
											type = "color",
											order = 1,
											name = L["LABEL_FONT_COLOR"],
											desc = L["TOOLTIP_FONT_COLOR"],
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
											width = "full",
										},
										timeFontName = {
											order = 2,
											type = "select",
											dialogControl = "LSM30_Font",
											name = L["LABEL_FONT"],
											desc = L["TOOLTIP_FONT_NAME"],
											values = LSM:HashTable("font"),
											get = function() return statusbars.maelstromBar.text.font.name end,
											set = function(self,value)
												statusbars.maelstromBar.text.font.name = value
												CheckEnhancementDefaultValues(enh_options,'Maelstrom')
											end,
										},
										timeFontSize = {
											order = 3,
											type = "range",
											name = FONT_SIZE,
											desc = L["TOOLTIP_COOLDOWN_FONT_SIZE"],
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
											order = 4,
											type = "select",
											name = L["LABEL_FONT_OUTLINE"],
											desc = L["TOOLTIP_FONT_OUTLINE"],
											get = function()
												return statusbars.maelstromBar.text.font.flag
											end,
											set = function(self,value)
												statusbars.maelstromBar.text.font.flag = value
												CheckEnhancementDefaultValues(enh_options,'Maelstrom')
											end,
											values = FONT_OUTLINES,
										},
										timeTextAnchor = {
											order = 5,
											type = "select",
											name = L["LABEL_FONT_ANCHOR"],
											desc = L["TOOLTIP_FONT_ANCHOR_POINT"],
											get = function()
												return statusbars.maelstromBar.text.justify
											end,
											set = function(self,value)
												statusbars.maelstromBar.text.justify = value
												CheckEnhancementDefaultValues(enh_options,'Maelstrom')
											end,
											values = FRAME_ANCHOR_OPTIONS,
										},
										timeTextX = {
											order = 6,
											type = "range",
											name = "X",
											desc = L["TOOLTIP_FONT_X_OFFSET"],
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
											order = 7,
											type = "range",
											name = "Y",
											desc = L["TOOLTIP_FONT_Y_OFFSET"],
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
											name = '|cFFFFFFFF'..L["LABEL_FONT_SHADOW"]..'|r',
											type = "group",
											order = 8,
											hidden = false,
											guiInline = true,
											args = {
												shadowToggle = {
													order = 1,
													name = L["TOGGLE"],
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
													name = L["LABEL_FONT_SHADOW_COLOR"],
													desc = L["TOOLTIP_FONT_SHADOW_COLOR"],
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
												shadowX = {
													order = 3,
													type = "range",
													name = "X",
													desc = L["TOOLTIP_FONT_SHADOW_X_OFFSET"],
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
													order = 4,
													type = "range",
													name = "Y",
													desc = L["TOOLTIP_FONT_SHADOW_Y_OFFSET"],
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
									name = L["LABEL_LAYOUT_DESIGN"],
									type = "group",
									order = 6,
									guiInline = true,
									args = {
										texture = {
											order = 1,
											type = "select",
											name = L["LABEL_STATUSBAR_TEXTURE"],
											desc = L["TOOLTIP_STATUSBAR_TEXTURE"],
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
											name = L["LABEL_STATUSBAR_COLOR"],
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
											width = "double",
										},
										backgroundTexture = {
											order = 3,
											type = "select",
											name = L["LABEL_STATUSBAR_BG_TEXTURE"],
											desc = L["TOOLTIP_STATUSBAR_BG_TEXTURE"],
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
											order = 4,
											name = L["LABEL_STATUSBAR_BG_COLOR"],
											desc = L["TOOLTIP_STATUSBAR_BG_COLOR"],
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
											order = 5,
											name = L["LABEL_STATUSBAR_MODIFY_BACKGROUND"],
											desc = L["TOOLTIP_TOGGLE_STATUSBAR_BG_CUSTOMIZATON"],
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
											order = 6,
											type = "range",
											name = L["LABEL_WIDTH"],
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
											order = 7,
											type = "range",
											name = L["LABEL_HEIGHT"],
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
									name = L["BUTTON_RESET_STATUSBAR_MAELSTROM"],
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
										enh_options.args.bars.args.maelstromBar.args.reset.disabled = true
										enh_options.args.bars.args.maelstromBar.args.reset.name = "|cFF666666"..L["BUTTON_RESET_STATUSBAR_MAELSTROM"].."|r"
										CheckEnhancementDefaultValues(enh_options,'Maelstrom')
										
										if (not bar.adjust.isEnabled) then
											Auras:InitializeProgressBar('MaelstromBar2',nil,'maelstromBar','text',nil,2)
										end
									end,
								},
							},
						},
						castBar = {
							name = L["LABEL_STATUSBAR_CAST"],
							order = 3,
							inline = false,
							type = "group",
							args = {
								adjust = {
									order = 1,
									name = L["LABEL_STATUSBAR_MODIFY_CAST"],
									desc = L["TOOLTIP_TOGGLE_STATUSBAR_CUSTOMIZATON"],
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
									name = L["TOGGLE_SPELL_TEXT"],
									desc = L["TOOLTIP_TOGGLE_SPELL_TEXT"],
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
									name = L["TOGGLE_TIME_TEXT"],
									desc = L["TOOLTIP_TOGGLE_TIME_TEXT"],
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
									name = "|cFFFFFFFF"..SETTINGS.."|r",
									order = 4,
									type = "group",
									guiInline = true,
									args = {
										alphaCombat = {
											order = 1,
											type = "range",
											name = L["LABEL_ALPHA_COMBAT"],
											desc = L["TOOLTIP_STATUSBAR_ALPHA_COMBAT"],
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
											name = L["LABEL_ALPHA_NO_COMBAT"],
											desc = L["TOOLTIP_STATUSBAR_ALPHA_NO_COMBAT"],
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
									name = '|cFFFFFFFF'..L["LABEL_ICON_SPARK"]..'|r',
									type = "group",
									order = 5,
									disabled = true,
									guiInline = true,
									args = {
										sparkToggle = {
											order = 1,
											name = L["TOGGLE_SPARK"],
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
											name = L["TOGGLE_ICON"],
											desc = '',
											type = "toggle",
											get = function()
												return statusbars.castBar.icon.isEnabled
											end,
											set = function(self,value)
												if (value) then
													enh_options.args.bars.args.castBar.args.iconSpark.args.iconJustify.disabled = false
												else
													enh_options.args.bars.args.castBar.args.iconSpark.args.iconJustify.disabled = true
												end
												statusbars.castBar.icon.isEnabled = value
												CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
											end,
										},
										iconJustify = {
											order = 3,
											type = "select",
											name = L["LABEL_ICON_JUSTIFY"],
											desc = L["TOOLTIP_STATUSBAR_ICON_LOCATION"],
											get = function()
												return statusbars.castBar.icon.justify
											end,
											set = function(self,value)
												statusbars.castBar.icon.justify = value
												CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
											end,
											values = ICON_JUSTIFY,
										},
									},
								},
								nametext = {
									name = '|cFFFFFFFF'..L["LABEL_TEXT_SPELL"]..'|r',
									type = "group",
									order = 6,
									disabled = true,
									guiInline = true,
									args = {
										color = {
											type = "color",
											order = 1,
											name = L["LABEL_FONT_COLOR"],
											desc = L["TOOLTIP_FONT_COLOR"],
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
											width = "full",
										},
										fontName = {
											order = 2,
											type = "select",
											dialogControl = "LSM30_Font",
											name = L["LABEL_FONT"],
											desc = L["TOOLTIP_FONT_NAME"],
											values = LSM:HashTable("font"),
											get = function() return statusbars.castBar.nametext.font.name end,
											set = function(self,value)
												statusbars.castBar.nametext.font.name = value
												CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
											end,
										},
										fontSize = {
											order = 3,
											type = "range",
											name = FONT_SIZE,
											desc = L["TOOLTIP_COOLDOWN_FONT_SIZE"],
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
											order = 4,
											type = "select",
											name = L["LABEL_FONT_OUTLINE"],
											desc = L["TOOLTIP_FONT_OUTLINE"],
											get = function()
												return statusbars.castBar.nametext.font.flag
											end,
											set = function(self,value)
												statusbars.castBar.nametext.font.flag = value
												CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
											end,
											values = FONT_OUTLINES,
										},
										nametextAnchor = {
											order = 5,
											type = "select",
											name = L["LABEL_FONT_ANCHOR"],
											desc = L["TOOLTIP_FONT_ANCHOR_POINT"],
											get = function()
												return statusbars.castBar.nametext.justify
											end,
											set = function(self,value)
												statusbars.castBar.nametext.justify = value
												CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
											end,
											values = FRAME_ANCHOR_OPTIONS,
										},
										nametextX = {
											order = 6,
											type = "range",
											name = "X",
											desc = L["TOOLTIP_FONT_X_OFFSET"],
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
											order = 7,
											type = "range",
											name = "Y",
											desc = L["TOOLTIP_FONT_Y_OFFSET"],
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
											name = '|cFFFFFFFF'..L["LABEL_FONT_SHADOW"]..'|r',
											type = "group",
											order = 8,
											hidden = false,
											guiInline = true,
											args = {
												shadowToggle = {
													order = 1,
													name = L["TOGGLE"],
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
													name = L["LABEL_FONT_SHADOW_COLOR"],
													desc = L["TOOLTIP_FONT_SHADOW_COLOR"],
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
												shadowX = {
													order = 3,
													type = "range",
													name = "X",
													desc = L["TOOLTIP_FONT_SHADOW_X_OFFSET"],
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
													order = 4,
													type = "range",
													name = "Y",
													desc = L["TOOLTIP_FONT_SHADOW_Y_OFFSET"],
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
									name = '|cFFFFFFFF'..L["LABEL_TIME_TEXT"]..'|r',
									type = "group",
									order = 7,
									disabled = true,
									guiInline = true,
									args = {
										color = {
											type = "color",
											order = 1,
											name = L["LABEL_FONT_COLOR"],
											desc = L["TOOLTIP_FONT_COLOR"],
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
											width = "full",
										},
										timeFontName = {
											order = 2,
											type = "select",
											dialogControl = "LSM30_Font",
											name = L["LABEL_FONT"],
											desc = L["TOOLTIP_FONT_NAME"],
											values = LSM:HashTable("font"),
											get = function() return statusbars.castBar.timetext.font.name end,
											set = function(self,value)
												statusbars.castBar.timetext.font.name = value
												CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
											end,
										},
										timeFontSize = {
											order = 3,
											type = "range",
											name = FONT_SIZE,
											desc = L["TOOLTIP_COOLDOWN_FONT_SIZE"],
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
											order = 4,
											type = "select",
											name = L["LABEL_FONT_OUTLINE"],
											desc = L["TOOLTIP_FONT_OUTLINE"],
											get = function()
												return statusbars.castBar.timetext.font.flag
											end,
											set = function(self,value)
												statusbars.castBar.timetext.font.flag = value
												CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
											end,
											values = FONT_OUTLINES,
										},
										timeTextAnchor = {
											order = 5,
											type = "select",
											name = L["LABEL_FONT_ANCHOR"],
											desc = L["TOOLTIP_FONT_ANCHOR_POINT"],
											get = function()
												return statusbars.castBar.timetext.justify
											end,
											set = function(self,value)
												statusbars.castBar.timetext.justify = value
												CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
											end,
											values = FRAME_ANCHOR_OPTIONS,
										},
										timeTextX = {
											order = 6,
											type = "range",
											name = "X",
											desc = L["TOOLTIP_FONT_X_OFFSET"],
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
											order = 7,
											type = "range",
											name = "Y",
											desc = L["TOOLTIP_FONT_Y_OFFSET"],
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
											name = '|cFFFFFFFF'..L["LABEL_FONT_SHADOW"]..'|r',
											type = "group",
											order = 8,
											hidden = false,
											guiInline = true,
											args = {
												shadowToggle = {
													order = 1,
													name = L["TOGGLE"],
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
													name = L["LABEL_FONT_SHADOW_COLOR"],
													desc = L["TOOLTIP_FONT_SHADOW_COLOR"],
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
												shadowX = {
													order = 3,
													type = "range",
													name = "X",
													desc = L["TOOLTIP_FONT_SHADOW_X_OFFSET"],
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
													order = 4,
													type = "range",
													name = "Y",
													desc = L["TOOLTIP_FONT_SHADOW_Y_OFFSET"],
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
									name = L["LABEL_LAYOUT_DESIGN"],
									type = "group",
									order = 8,
									guiInline = true,
									args = {
										texture = {
											order = 1,
											type = "select",
											name = L["LABEL_STATUSBAR_TEXTURE"],
											desc = L["TOOLTIP_STATUSBAR_TEXTURE"],
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
											name = L["LABEL_STATUSBAR_COLOR"],
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
											width = "double",
										},
										backgroundTexture = {
											order = 3,
											type = "select",
											name = L["LABEL_STATUSBAR_BG_TEXTURE"],
											desc = L["TOOLTIP_STATUSBAR_BG_TEXTURE"],
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
											order = 4,
											name = L["LABEL_STATUSBAR_BG_COLOR"],
											desc = L["TOOLTIP_STATUSBAR_BG_COLOR"],
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
											order = 5,
											name = L["LABEL_STATUSBAR_MODIFY_BACKGROUND"],
											desc = L["TOOLTIP_TOGGLE_STATUSBAR_BG_CUSTOMIZATON"],
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
											order = 6,
											type = "range",
											name = L["LABEL_WIDTH"],
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
											order = 7,
											type = "range",
											name = L["LABEL_HEIGHT"],
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
									name = L["BUTTON_RESET_STATUSBAR_CAST"],
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
										enh_options.args.bars.args.castBar.args.reset.disabled = true
										enh_options.args.bars.args.castBar.args.reset.name = "|cFF666666"..L["BUTTON_RESET_STATUSBAR_CAST"].."|r"
										CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
										
										if (not bar.adjust.isEnabled) then
											Auras:InitializeProgressBar('CastBar2',nil,'castBar','nametext','timetext',2)
										end
									end,
								},
							},
						},
						channelBar = {
							name = L["LABEL_STATUSBAR_CHANNEL"],
							order = 4,
							inline = false,
							type = "group",
							args = {
								adjust = {
									order = 1,
									name = L["LABEL_STATUSBAR_MODIFY_CHANNEL"],
									desc = L["TOOLTIP_TOGGLE_STATUSBAR_CUSTOMIZATON"],
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
									name = L["TOGGLE_SPELL_TEXT"],
									desc = L["TOOLTIP_TOGGLE_SPELL_TEXT"],
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
									name = L["TOGGLE_TIME_TEXT"],
									desc = L["TOOLTIP_TOGGLE_TIME_TEXT"],
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
									name = "|cFFFFFFFF"..SETTINGS.."|r",
									order = 4,
									type = "group",
									guiInline = true,
									args = {
										alphaCombat = {
											order = 1,
											type = "range",
											name = L["LABEL_ALPHA_COMBAT"],
											desc = L["TOOLTIP_STATUSBAR_ALPHA_COMBAT"],
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
											name = L["LABEL_ALPHA_NO_COMBAT"],
											desc = L["TOOLTIP_STATUSBAR_ALPHA_NO_COMBAT"],
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
									name = '|cFFFFFFFF'..L["LABEL_ICON_SPARK"]..'|r',
									type = "group",
									order = 5,
									disabled = true,
									guiInline = true,
									args = {
										sparkToggle = {
											order = 1,
											name = L["TOGGLE_SPARK"],
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
											name = L["TOGGLE_ICON"],
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
											name = L["LABEL_ICON_JUSTIFY"],
											desc = L["TOOLTIP_STATUSBAR_ICON_LOCATION"],
											get = function()
												return statusbars.channelBar.icon.justify
											end,
											set = function(self,value)
												statusbars.channelBar.icon.justify = value
												CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
											end,
											values = ICON_JUSTIFY,
										},
									},
								},
								nametext = {
									name = '|cFFFFFFFF'..L["LABEL_TEXT_SPELL"]..'|r',
									type = "group",
									order = 6,
									disabled = true,
									guiInline = true,
									args = {
										color = {
											type = "color",
											order = 1,
											name = L["LABEL_FONT_COLOR"],
											desc = L["TOOLTIP_FONT_COLOR"],
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
											width = "full",
										},
										fontName = {
											order = 2,
											type = "select",
											dialogControl = "LSM30_Font",
											name = L["LABEL_FONT"],
											desc = L["TOOLTIP_FONT_NAME"],
											values = LSM:HashTable("font"),
											get = function() return statusbars.channelBar.nametext.font.name end,
											set = function(self,value)
												statusbars.channelBar.nametext.font.name = value
												CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
											end,
										},
										fontSize = {
											order = 3,
											type = "range",
											name = FONT_SIZE,
											desc = L["TOOLTIP_COOLDOWN_FONT_SIZE"],
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
											order = 4,
											type = "select",
											name = L["LABEL_FONT_OUTLINE"],
											desc = L["TOOLTIP_FONT_OUTLINE"],
											get = function()
												return statusbars.channelBar.nametext.font.flag
											end,
											set = function(self,value)
												statusbars.channelBar.nametext.font.flag = value
												CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
											end,
											values = FONT_OUTLINES,
										},
										nametextAnchor = {
											order = 5,
											type = "select",
											name = L["LABEL_FONT_ANCHOR"],
											desc = L["TOOLTIP_FONT_ANCHOR_POINT"],
											get = function()
												return statusbars.channelBar.nametext.justify
											end,
											set = function(self,value)
												statusbars.channelBar.nametext.justify = value
												CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
											end,
											values = FRAME_ANCHOR_OPTIONS,
										},
										nametextX = {
											order = 6,
											type = "range",
											name = "X",
											desc = L["TOOLTIP_FONT_X_OFFSET"],
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
											order = 7,
											type = "range",
											name = "Y",
											desc = L["TOOLTIP_FONT_Y_OFFSET"],
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
											name = '|cFFFFFFFF'..L["LABEL_FONT_SHADOW"]..'|r',
											type = "group",
											order = 8,
											hidden = false,
											guiInline = true,
											args = {
												shadowToggle = {
													order = 1,
													name = L["TOGGLE"],
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
													name = L["LABEL_FONT_SHADOW_COLOR"],
													desc = L["TOOLTIP_FONT_SHADOW_COLOR"],
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
												shadowX = {
													order = 3,
													type = "range",
													name = "X",
													desc = L["TOOLTIP_FONT_SHADOW_X_OFFSET"],
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
													order = 4,
													type = "range",
													name = "Y",
													desc = L["TOOLTIP_FONT_SHADOW_Y_OFFSET"],
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
									name = '|cFFFFFFFF'..L["LABEL_TIME_TEXT"]..'|r',
									type = "group",
									order = 6,
									disabled = true,
									guiInline = true,
									args = {
										color = {
											type = "color",
											order = 1,
											name = L["LABEL_FONT_COLOR"],
											desc = L["TOOLTIP_FONT_COLOR"],
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
											width = "full",
										},
										timeFontName = {
											order = 2,
											type = "select",
											dialogControl = "LSM30_Font",
											name = L["LABEL_FONT"],
											desc = L["TOOLTIP_FONT_NAME"],
											values = LSM:HashTable("font"),
											get = function() return statusbars.channelBar.timetext.font.name end,
											set = function(self,value)
												statusbars.channelBar.timetext.font.name = value
												CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
											end,
										},
										timeFontSize = {
											order = 3,
											type = "range",
											name = FONT_SIZE,
											desc = L["TOOLTIP_COOLDOWN_FONT_SIZE"],
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
											order = 4,
											type = "select",
											name = L["LABEL_FONT_OUTLINE"],
											desc = L["TOOLTIP_FONT_OUTLINE"],
											get = function()
												return statusbars.channelBar.timetext.font.flag
											end,
											set = function(self,value)
												statusbars.channelBar.timetext.font.flag = value
												CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
											end,
											values = FONT_OUTLINES,
										},
										timeTextAnchor = {
											order = 5,
											type = "select",
											name = L["LABEL_FONT_ANCHOR"],
											desc = L["TOOLTIP_FONT_ANCHOR_POINT"],
											get = function()
												return statusbars.channelBar.timetext.justify
											end,
											set = function(self,value)
												statusbars.channelBar.timetext.justify = value
												CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
											end,
											values = FRAME_ANCHOR_OPTIONS,
										},
										timeTextX = {
											order = 6,
											type = "range",
											name = "X",
											desc = L["TOOLTIP_FONT_X_OFFSET"],
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
											order = 7,
											type = "range",
											name = "Y",
											desc = L["TOOLTIP_FONT_Y_OFFSET"],
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
											name = '|cFFFFFFFF'..L["LABEL_FONT_SHADOW"]..'|r',
											type = "group",
											order = 8,
											hidden = false,
											guiInline = true,
											args = {
												shadowToggle = {
													order = 1,
													name = L["TOGGLE"],
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
													name = L["LABEL_FONT_SHADOW_COLOR"],
													desc = L["TOOLTIP_FONT_SHADOW_COLOR"],
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
												shadowX = {
													order = 3,
													type = "range",
													name = "X",
													desc = L["TOOLTIP_FONT_SHADOW_X_OFFSET"],
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
													order = 4,
													type = "range",
													name = "Y",
													desc = L["TOOLTIP_FONT_SHADOW_Y_OFFSET"],
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
									name = L["LABEL_LAYOUT_DESIGN"],
									type = "group",
									order = 7,
									guiInline = true,
									args = {
										texture = {
											order = 1,
											type = "select",
											name = L["LABEL_STATUSBAR_TEXTURE"],
											desc = L["TOOLTIP_STATUSBAR_TEXTURE"],
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
											name = L["LABEL_STATUSBAR_COLOR"],
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
											width = "double",
										},
										backgroundTexture = {
											order = 3,
											type = "select",
											name = L["LABEL_STATUSBAR_BG_TEXTURE"],
											desc = L["TOOLTIP_STATUSBAR_BG_TEXTURE"],
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
											order = 4,
											name = L["LABEL_STATUSBAR_BG_COLOR"],
											desc = L["TOOLTIP_STATUSBAR_BG_COLOR"],
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
											order = 5,
											name = L["LABEL_STATUSBAR_MODIFY_BACKGROUND"],
											desc = L["TOOLTIP_TOGGLE_STATUSBAR_BG_CUSTOMIZATON"],
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
											order = 6,
											type = "range",
											name = L["LABEL_WIDTH"],
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
											order = 7,
											type = "range",
											name = L["LABEL_HEIGHT"],
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
									name = L["BUTTON_RESET_STATUSBAR_CHANNEL"],
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
										enh_options.args.bars.args.channelBar.args.reset.disabled = true
										enh_options.args.bars.args.channelBar.args.reset.name = "|cFF666666"..L["BUTTON_RESET_STATUSBAR_CHANNEL"].."|r"
										CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
										
										if (not bar.adjust.isEnabled) then
											Auras:InitializeProgressBar('ChannelBar2',nil,'channelBar','nametext','timetext',2)
										end
									end,
								},
							},
						},
					},
				},
				cooldowns = {
					name = L["LABEL_COOLDOWN"],
					order = 4,
					type = "group",
					disabled = true,
					args = {
						toggle = {
							order = 1,
							name = ENABLE,
							desc = L["TOOLTIP_TOGGLE_COOLDOWN_TEXT"],
							type = "toggle",
							get = function()
								return cooldowns.isEnabled
							end,
							set = function(self,value)
								cooldowns.isEnabled = value
								CheckEnhancementDefaultValues(enh_options,'Cooldowns')
							end,
							width = "full",
						},
						text = {
							order = 2,
							name = L["LABEL_COOLDOWN_TEXT"],
							desc = L["TOOLTIP_TOGGLE_COOLDOWN_TEXT"],
							type = "toggle",
							get = function()
								return cooldowns.text
							end,
							set = function(self,value)
								cooldowns.text = value
							end,
						},
						sweep = {
							order = 3,
							name = L["LABEL_COOLDOWN_SWEEP"],
							desc = L["TOOLTIP_TOGGLE_COOLDOWN_SWEEP"],
							type = "toggle",
							get = function()
								return cooldowns.sweep
							end,
							set = function(self,value)
								cooldowns.sweep = value
								Auras:InitializeCooldowns('AuraGroup2',2)
								CheckEnhancementDefaultValues(enh_options,'Cooldowns')
							end,
							width = "double",
						},
						GCD = {
							order = 4,
							name = L["LABEL_COOLDOWN_GCD"],
							desc = L["TOOLTIP_TOGGLE_COOLDOWN_GCD"],
							type = "toggle",
							get = function()
								return cooldowns.GCD.isEnabled
							end,
							set = function(self,value)
								cooldowns.GCD.isEnabled = value
							end,
						},
						inverse = {
							order = 5,
							name = L["LABEL_COOLDOWN_REVERSE_SWEEP"],
							desc = L["TOOLTIP_COOLDOWN_REVERSE_SWEEP"],
							type = "toggle",
							get = function()
								return cooldowns.inverse
							end,
							set = function(self,value)
								cooldowns.inverse = value
								Auras:InitializeCooldowns('AuraGroup2',2)
							end,
						},
						
						bling = {
							order = 6,
							name = L["LABEL_COOLDOWN_BLING"],
							desc = L["TOOLTIP_TOGGLE_COOLDOWN_BLING"],
							type = "toggle",
							get = function()
								return cooldowns.bling
							end,
							set = function(self,value)
								cooldowns.bling = value
								Auras:InitializeCooldowns('AuraGroup2',2)
							end,
						},
						group = {
							order = 7,
							type = "select",
							name = L["LABEL_COOLDOWN_GROUP"],
							desc = L["TOOLTIP_AURAS_GROUP_SELECT"],
							get = function()
								return cooldowns.selected
							end,
							set = function(self,value)
								cooldowns.selected = value
								CheckEnhancementDefaultValues(enh_options,'Cooldowns')
							end,
							values = COOLDOWN_OPTIONS,
						},
						adjustToggle = {
							order = 8,
							name = L["LABEL_COOLDOWN_ADJUST"],
							desc = '',
							type = "toggle",
							get = function()
								return cooldowns.adjust
							end,
							set = function(self,value)
								cooldowns.adjust = value
								CheckEnhancementDefaultValues(enh_options,'Cooldowns')
							end,
						},
						p1_formatting = {
							name = FORMATTING,
							type = "group",
							order = 9,
							guiInline = true,
							args = {
								alertToggle = {
									order = 1,
									name = L["LABEL_ALERT"],
									desc = L["TOOLTIP_ALERT"],
									type = "toggle",
									get = function()
										return cooldowns.primary[1].text.formatting.alert.isEnabled
									end,
									set = function(self,value)
										cooldowns.primary[1].text.formatting.alert.isEnabled = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
									width = "double",
								},
								copy = {
									order = 2,
									type = "select",
									name = L["LABEL_COOLDOWN_COPY_FROM"],
									desc = L["TOOLTIP_COOLDOWN_COPY_FROM"],
									get = function()
										return ''
									end,
									set = function(self,value)
										CopyCooldownFormatting(value,2,'primary',1)
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
									values = {
										["primary;2"] = PRIMARY.." #2",
										["primary;3"] = PRIMARY.." #3",
										["secondary;1"] = SECONDARY.." #1",
										["secondary;2"] = SECONDARY.." #2",
									},
								},
								alertFlash = {
									order = 3,
									name = L["LABEL_ALERT_ANIMATE"],
									desc = L["TOOLTIP_ALERT_ANIMATE"],
									type = "toggle",
									get = function()
										return cooldowns.primary[1].text.formatting.alert.animate
									end,
									set = function(self,value)
										cooldowns.primary[1].text.formatting.alert.animate = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
								alertColor = {
									type = "color",
									order = 4,
									name = L["LABEL_ALERT_COLOR"],
									desc = L["TOOLTIP_ALERT_COLOR"],
									hasAlpha = true,
									get = function(info)
										local color = cooldowns.primary[1].text.formatting.alert.color
										return color.r, color.g, color.b, color.a
									end,
									set = function(info, r, g, b, a)
										local color = cooldowns.primary[1].text.formatting.alert.color
										
										color.r = tonumber(string.format("%.2f",r))
										color.g = tonumber(string.format("%.2f",g))
										color.b = tonumber(string.format("%.2f",b))
										color.a = tonumber(string.format("%.2f",a))
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
								alertThreshold = {
									order = 5,
									type = "range",
									name = L["LABEL_ALERT_THRESHOLD"],
									desc = L["TOOLTIP_ALERT_THRESHOLD"],
									min = 3,
									max = 10,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.primary[1].text.formatting.alert.threshold end,
									set = function(self,value)
										cooldowns.primary[1].text.formatting.alert.threshold = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
								decimals = {
									order = 6,
									name = L["LABEL_DECIMALS"],
									desc = L["TOOLTIP_DECIMALS"],
									type = "toggle",
									get = function()
										return cooldowns.primary[1].text.formatting.decimals
									end,
									set = function(self,value)
										cooldowns.primary[1].text.formatting.decimals = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
								format = {
									order = 7,
									type = "select",
									name = L["LABEL_MINUTE_FORMAT"],
									desc = L["TOOLTIP_MINUTE_FORMAT"],
									get = function()
										return cooldowns.primary[1].text.formatting.length
									end,
									set = function(self,value)
										--cooldowns.primary[1].text.justify = value
										--CheckRestorationDefaultValues(res_options,'Cooldowns')
										cooldowns.primary[1].text.formatting.length = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
									values = TIME_FORMATS,
								},
							},
						},
						p1_adjustGroup = {
							name = L["LABEL_COOLDOWN_SETTINGS"],
							type = "group",
							order = 10,
							guiInline = true,
							args = {
								color = {
									type = "color",
									order = 1,
									name = L["LABEL_FONT_COLOR"],
									desc = L["TOOLTIP_FONT_COLOR"],
									hasAlpha = true,
									get = function(info)
										local color = cooldowns.primary[1].text.font.color
										return color.r, color.g, color.b, color.a
									end,
									set = function(info, r, g, b, a)
										local color = cooldowns.primary[1].text.font.color
										
										color.r = tonumber(string.format("%.2f",r))
										color.g = tonumber(string.format("%.2f",g))
										color.b = tonumber(string.format("%.2f",b))
										color.a = tonumber(string.format("%.2f",a))
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
									width = "double",
								},
								copy = {
									order = 3,
									type = "select",
									name = L["LABEL_COOLDOWN_COPY_FROM"],
									desc = L["TOOLTIP_COOLDOWN_COPY_FROM"],
									get = function()
										return ''
									end,
									set = function(self,value)
										--cooldowns.primary[1].text.justify = value
										--CheckRestorationDefaultValues(res_options,'Cooldowns')
										CopyCooldownOptions(value,2,'primary',1)
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
									values = {
										["primary;2"] = PRIMARY.." #2",
										["primary;3"] = PRIMARY.." #3",
										["secondary;1"] = SECONDARY.." #1",
										["secondary;2"] = SECONDARY.." #2",
									},
								},
								fontName = {
									order = 4,
									type = "select",
									dialogControl = "LSM30_Font",
									name = L["LABEL_FONT"],
									desc = L["TOOLTIP_FONT_NAME"],
									values = LSM:HashTable("font"),
									get = function() return cooldowns.primary[1].text.font.name end,
									set = function(self,value)
										cooldowns.primary[1].text.font.name = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
								fontSize = {
									order = 5,
									type = "range",
									name = FONT_SIZE,
									desc = L["TOOLTIP_COOLDOWN_FONT_SIZE"],
									min = 5,
									max = 40,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.primary[1].text.font.size end,
									set = function(self,value)
										cooldowns.primary[1].text.font.size = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
								fontOutline = {
									order = 6,
									type = "select",
									name = L["LABEL_FONT_OUTLINE"],
									desc = L["TOOLTIP_FONT_OUTLINE"],
									get = function()
										return cooldowns.primary[1].text.font.flag
									end,
									set = function(self,value)
										cooldowns.primary[1].text.font.flag = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
									values = FONT_OUTLINES,
								},
								textAnchor = {
									order = 7,
									type = "select",
									name = L["LABEL_FONT_ANCHOR"],
									desc = L["TOOLTIP_FONT_ANCHOR_POINT"],
									get = function()
										return cooldowns.primary[1].text.justify
									end,
									set = function(self,value)
										cooldowns.primary[1].text.justify = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
									values = FRAME_ANCHOR_OPTIONS,
								},
								textX = {
									order = 8,
									type = "range",
									name = "X",
									desc = L["TOOLTIP_FONT_X_OFFSET"],
									min = -100,
									max = 100,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.primary[1].text.x end,
									set = function(self,value)
										cooldowns.primary[1].text.x = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
								textY = {
									order = 9,
									type = "range",
									name = "Y",
									desc = L["TOOLTIP_FONT_Y_OFFSET"],
									min = -100,
									max = 100,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.primary[1].text.y end,
									set = function(self,value)
										cooldowns.primary[1].text.y = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
								shadow = {
									name = '|cFFFFFFFF'..L["LABEL_FONT_SHADOW"]..'|r',
									type = "group",
									order = 10,
									hidden = false,
									guiInline = true,
									args = {
										shadowToggle = {
											order = 1,
											name = L["TOGGLE"],
											desc = '',
											type = "toggle",
											get = function()
												return cooldowns.primary[1].text.font.shadow.isEnabled
											end,
											set = function(self,value)
												cooldowns.primary[1].text.font.shadow.isEnabled = value
												CheckEnhancementDefaultValues(enh_options,'Cooldowns')
											end,
										},
										shadowColor = {
											type = "color",
											order = 2,
											name = L["LABEL_FONT_SHADOW_COLOR"],
											desc = L["TOOLTIP_FONT_SHADOW_COLOR"],
											hasAlpha = true,
											get = function(info)
												local color = cooldowns.primary[1].text.font.shadow.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = cooldowns.primary[1].text.font.shadow.color

												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckEnhancementDefaultValues(enh_options,'Cooldowns')
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
											desc = L["TOOLTIP_FONT_SHADOW_X_OFFSET"],
											min = -10,
											max = 10,
											step = 1,
											bigStep = 1,
											disabled = true,
											get = function() return cooldowns.primary[1].text.font.shadow.offset.x end,
											set = function(self,value)
												cooldowns.primary[1].text.font.shadow.offset.x = value
												CheckEnhancementDefaultValues(enh_options,'Cooldowns')
											end,
										},
										shadowY = {
											order = 5,
											type = "range",
											name = "Y",
											desc = L["TOOLTIP_FONT_SHADOW_Y_OFFSET"],
											min = -10,
											max = 10,
											step = 1,
											bigStep = 1,
											disabled = true,
											get = function() return cooldowns.primary[1].text.font.shadow.offset.y end,
											set = function(self,value)
												cooldowns.primary[1].text.font.shadow.offset.y = value
												CheckEnhancementDefaultValues(enh_options,'Cooldowns')
											end,
										},
									},
								},
								reset = {
									order = 11,
									type = "execute",
									name = RESET_TO_DEFAULT,
									func = function()
										local cd = cooldowns.primary[1]
										local default = cooldownDefaults
										
										cd.text.isDisplayText = true
										cd.text.x = default.text.x
										cd.text.y = default.text.y
										cd.text.font.name = default.text.font.name
										cd.text.font.size = default.text.font.size
										cd.text.font.flag = default.text.font.flag
										cd.text.font.color.r = default.text.font.color.r
										cd.text.font.color.g = default.text.font.color.g
										cd.text.font.color.b = default.text.font.color.b
										cd.text.font.color.a = default.text.font.color.a
										cd.text.font.shadow.isEnabled = false
										cd.text.font.shadow.offset.x = default.text.font.shadow.offset.x
										cd.text.font.shadow.offset.y = default.text.font.shadow.offset.y
										cd.text.font.shadow.color.r = default.text.font.shadow.color.r
										cd.text.font.shadow.color.g = default.text.font.shadow.color.g
										cd.text.font.shadow.color.b = default.text.font.shadow.color.b
										cd.text.font.shadow.color.a = default.text.font.shadow.color.a
										cd.text.justify = default.text.justify

										enh_options.args.cooldowns.args.p1_adjustGroup.args.reset.disabled = true
										enh_options.args.cooldowns.args.p1_adjustGroup.args.reset.name = "|cFF666666"..RESET_TO_DEFAULT.."|r"
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
							},
						},
						p2_formatting = {
							name = FORMATTING,
							type = "group",
							order = 11,
							guiInline = true,
							args = {
								alertToggle = {
									order = 1,
									name = L["LABEL_ALERT"],
									desc = L["TOOLTIP_ALERT"],
									type = "toggle",
									get = function()
										return cooldowns.primary[2].text.formatting.alert.isEnabled
									end,
									set = function(self,value)
										cooldowns.primary[2].text.formatting.alert.isEnabled = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
									width = "double",
								},
								copy = {
									order = 2,
									type = "select",
									name = L["LABEL_COOLDOWN_COPY_FROM"],
									desc = L["TOOLTIP_COOLDOWN_COPY_FROM"],
									get = function()
										return ''
									end,
									set = function(self,value)
										CopyCooldownFormatting(value,2,'primary',2)
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
									values = {
										["primary;1"] = PRIMARY.." #1",
										["primary;3"] = PRIMARY.." #3",
										["secondary;1"] = SECONDARY.." #1",
										["secondary;2"] = SECONDARY.." #2",
									},
								},
								alertFlash = {
									order = 3,
									name = L["LABEL_ALERT_ANIMATE"],
									desc = L["TOOLTIP_ALERT_ANIMATE"],
									type = "toggle",
									get = function()
										return cooldowns.primary[2].text.formatting.alert.animate
									end,
									set = function(self,value)
										cooldowns.primary[2].text.formatting.alert.animate = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
								alertColor = {
									type = "color",
									order = 4,
									name = L["LABEL_ALERT_COLOR"],
									desc = L["TOOLTIP_ALERT_COLOR"],
									hasAlpha = true,
									get = function(info)
										local color = cooldowns.primary[2].text.formatting.alert.color
										return color.r, color.g, color.b, color.a
									end,
									set = function(info, r, g, b, a)
										local color = cooldowns.primary[2].text.formatting.alert.color
										
										color.r = tonumber(string.format("%.2f",r))
										color.g = tonumber(string.format("%.2f",g))
										color.b = tonumber(string.format("%.2f",b))
										color.a = tonumber(string.format("%.2f",a))
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
								alertThreshold = {
									order = 5,
									type = "range",
									name = L["LABEL_ALERT_THRESHOLD"],
									desc = L["TOOLTIP_ALERT_THRESHOLD"],
									min = 3,
									max = 10,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.primary[2].text.formatting.alert.threshold end,
									set = function(self,value)
										cooldowns.primary[2].text.formatting.alert.threshold = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
								decimals = {
									order = 6,
									name = L["LABEL_DECIMALS"],
									desc = L["TOOLTIP_DECIMALS"],
									type = "toggle",
									get = function()
										return cooldowns.primary[2].text.formatting.decimals
									end,
									set = function(self,value)
										cooldowns.primary[2].text.formatting.decimals = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
								format = {
									order = 7,
									type = "select",
									name = L["LABEL_MINUTE_FORMAT"],
									desc = L["TOOLTIP_MINUTE_FORMAT"],
									get = function()
										return cooldowns.primary[2].text.formatting.length
									end,
									set = function(self,value)
										--cooldowns.primary[2].text.justify = value
										--CheckRestorationDefaultValues(res_options,'Cooldowns')
										cooldowns.primary[2].text.formatting.length = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
									values = TIME_FORMATS,
								},
							},
						},
						p2_adjustGroup = {
							name = L["LABEL_COOLDOWN_SETTINGS"],
							type = "group",
							order = 12,
							hidden = true,
							guiInline = true,
							args = {
								color = {
									type = "color",
									order = 1,
									name = L["LABEL_FONT_COLOR"],
									desc = L["TOOLTIP_FONT_COLOR"],
									hasAlpha = true,
									get = function(info)
										local color = cooldowns.primary[2].text.font.color
										return color.r, color.g, color.b, color.a
									end,
									set = function(info, r, g, b, a)
										local color = cooldowns.primary[2].text.font.color
										
										color.r = tonumber(string.format("%.2f",r))
										color.g = tonumber(string.format("%.2f",g))
										color.b = tonumber(string.format("%.2f",b))
										color.a = tonumber(string.format("%.2f",a))
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
									width = "double",
								},
								copy = {
									order = 3,
									type = "select",
									name = L["LABEL_COOLDOWN_COPY_FROM"],
									desc = L["TOOLTIP_COOLDOWN_COPY_FROM"],
									get = function()
										return ''
									end,
									set = function(self,value)
										CopyCooldownOptions(value,2,'primary',2)
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
									values = {
										["primary;1"] = PRIMARY.." #1",
										["primary;3"] = PRIMARY.." #3",
										["secondary;1"] = SECONDARY.." #1",
										["secondary;2"] = SECONDARY.." #2",
									},
								},
								fontName = {
									order = 4,
									type = "select",
									dialogControl = "LSM30_Font",
									name = L["LABEL_FONT"],
									desc = L["TOOLTIP_FONT_NAME"],
									values = LSM:HashTable("font"),
									get = function() return cooldowns.primary[2].text.font.name end,
									set = function(self,value)
										cooldowns.primary[2].text.font.name = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
								fontSize = {
									order = 5,
									type = "range",
									name = FONT_SIZE,
									desc = L["TOOLTIP_COOLDOWN_FONT_SIZE"],
									min = 5,
									max = 40,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.primary[2].text.font.size end,
									set = function(self,value)
										cooldowns.primary[2].text.font.size = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
								fontOutline = {
									order = 6,
									type = "select",
									name = L["LABEL_FONT_OUTLINE"],
									desc = L["TOOLTIP_FONT_OUTLINE"],
									get = function()
										return cooldowns.primary[2].text.font.flag
									end,
									set = function(self,value)
										cooldowns.primary[2].text.font.flag = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
									values = FONT_OUTLINES,
								},
								textAnchor = {
									order = 7,
									type = "select",
									name = L["LABEL_FONT_ANCHOR"],
									desc = L["TOOLTIP_FONT_ANCHOR_POINT"],
									get = function()
										return cooldowns.primary[2].text.justify
									end,
									set = function(self,value)
										cooldowns.primary[2].text.justify = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
									values = FRAME_ANCHOR_OPTIONS,
								},
								textX = {
									order = 8,
									type = "range",
									name = "X",
									desc = L["TOOLTIP_FONT_X_OFFSET"],
									min = -100,
									max = 100,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.primary[2].text.x end,
									set = function(self,value)
										cooldowns.primary[2].text.x = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
								textY = {
									order = 9,
									type = "range",
									name = "Y",
									desc = L["TOOLTIP_FONT_Y_OFFSET"],
									min = -100,
									max = 100,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.primary[2].text.y end,
									set = function(self,value)
										cooldowns.primary[2].text.y = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
								shadow = {
									name = '|cFFFFFFFF'..L["LABEL_FONT_SHADOW"]..'|r',
									type = "group",
									order = 10,
									hidden = false,
									guiInline = true,
									args = {
										shadowToggle = {
											order = 1,
											name = L["TOGGLE"],
											desc = '',
											type = "toggle",
											get = function()
												return cooldowns.primary[2].text.font.shadow.isEnabled
											end,
											set = function(self,value)
												cooldowns.primary[2].text.font.shadow.isEnabled = value
												CheckEnhancementDefaultValues(enh_options,'Cooldowns')
											end,
										},
										shadowColor = {
											type = "color",
											order = 2,
											name = L["LABEL_FONT_SHADOW_COLOR"],
											desc = L["TOOLTIP_FONT_SHADOW_COLOR"],
											hasAlpha = true,
											get = function(info)
												local color = cooldowns.primary[2].text.font.shadow.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = cooldowns.primary[2].text.font.shadow.color

												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckEnhancementDefaultValues(enh_options,'Cooldowns')
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
											desc = L["TOOLTIP_FONT_SHADOW_X_OFFSET"],
											min = -10,
											max = 10,
											step = 1,
											bigStep = 1,
											disabled = true,
											get = function() return cooldowns.primary[2].text.font.shadow.offset.x end,
											set = function(self,value)
												cooldowns.primary[2].text.font.shadow.offset.x = value
												CheckEnhancementDefaultValues(enh_options,'Cooldowns')
											end,
										},
										shadowY = {
											order = 5,
											type = "range",
											name = "Y",
											desc = L["TOOLTIP_FONT_SHADOW_Y_OFFSET"],
											min = -10,
											max = 10,
											step = 1,
											bigStep = 1,
											disabled = true,
											get = function() return cooldowns.primary[2].text.font.shadow.offset.y end,
											set = function(self,value)
												cooldowns.primary[2].text.font.shadow.offset.y = value
												CheckEnhancementDefaultValues(enh_options,'Cooldowns')
											end,
										},
									},
								},
								reset = {
									order = 11,
									type = "execute",
									name = RESET_TO_DEFAULT,
									func = function()
										local cd = cooldowns.primary[2]
										local default = cooldownDefaults
										
										cd.text.isDisplayText = true
										cd.text.x = default.text.x
										cd.text.y = default.text.y
										cd.text.font.name = default.text.font.name
										cd.text.font.size = default.text.font.size
										cd.text.font.flag = default.text.font.flag
										cd.text.font.color.r = default.text.font.color.r
										cd.text.font.color.g = default.text.font.color.g
										cd.text.font.color.b = default.text.font.color.b
										cd.text.font.color.a = default.text.font.color.a
										cd.text.font.shadow.isEnabled = false
										cd.text.font.shadow.offset.x = default.text.font.shadow.offset.x
										cd.text.font.shadow.offset.y = default.text.font.shadow.offset.y
										cd.text.font.shadow.color.r = default.text.font.shadow.color.r
										cd.text.font.shadow.color.g = default.text.font.shadow.color.g
										cd.text.font.shadow.color.b = default.text.font.shadow.color.b
										cd.text.font.shadow.color.a = default.text.font.shadow.color.a
										cd.text.justify = default.text.justify

										enh_options.args.cooldowns.args.p2_adjustGroup.args.reset.disabled = true
										enh_options.args.cooldowns.args.p2_adjustGroup.args.reset.name = "|cFF666666"..RESET_TO_DEFAULT.."|r"
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
							},
						},
						p3_formatting = {
							name = FORMATTING,
							type = "group",
							order = 13,
							guiInline = true,
							args = {
								alertToggle = {
									order = 1,
									name = L["LABEL_ALERT"],
									desc = L["TOOLTIP_ALERT"],
									type = "toggle",
									get = function()
										return cooldowns.primary[3].text.formatting.alert.isEnabled
									end,
									set = function(self,value)
										cooldowns.primary[3].text.formatting.alert.isEnabled = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
									width = "double",
								},
								copy = {
									order = 2,
									type = "select",
									name = L["LABEL_COOLDOWN_COPY_FROM"],
									desc = L["TOOLTIP_COOLDOWN_COPY_FROM"],
									get = function()
										return ''
									end,
									set = function(self,value)
										CopyCooldownFormatting(value,2,'primary',3)
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
									values = {
										["primary;1"] = PRIMARY.." #1",
										["primary;2"] = PRIMARY.." #2",
										["secondary;1"] = SECONDARY.." #1",
										["secondary;2"] = SECONDARY.." #2",
									},
								},
								alertFlash = {
									order = 3,
									name = L["LABEL_ALERT_ANIMATE"],
									desc = L["TOOLTIP_ALERT_ANIMATE"],
									type = "toggle",
									get = function()
										return cooldowns.primary[3].text.formatting.alert.animate
									end,
									set = function(self,value)
										cooldowns.primary[3].text.formatting.alert.animate = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
								alertColor = {
									type = "color",
									order = 4,
									name = L["LABEL_ALERT_COLOR"],
									desc = L["TOOLTIP_ALERT_COLOR"],
									hasAlpha = true,
									get = function(info)
										local color = cooldowns.primary[3].text.formatting.alert.color
										return color.r, color.g, color.b, color.a
									end,
									set = function(info, r, g, b, a)
										local color = cooldowns.primary[3].text.formatting.alert.color
										
										color.r = tonumber(string.format("%.2f",r))
										color.g = tonumber(string.format("%.2f",g))
										color.b = tonumber(string.format("%.2f",b))
										color.a = tonumber(string.format("%.2f",a))
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
								alertThreshold = {
									order = 5,
									type = "range",
									name = L["LABEL_ALERT_THRESHOLD"],
									desc = L["TOOLTIP_ALERT_THRESHOLD"],
									min = 3,
									max = 10,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.primary[3].text.formatting.alert.threshold end,
									set = function(self,value)
										cooldowns.primary[3].text.formatting.alert.threshold = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
								decimals = {
									order = 6,
									name = L["LABEL_DECIMALS"],
									desc = L["TOOLTIP_DECIMALS"],
									type = "toggle",
									get = function()
										return cooldowns.primary[3].text.formatting.decimals
									end,
									set = function(self,value)
										cooldowns.primary[3].text.formatting.decimals = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
								format = {
									order = 7,
									type = "select",
									name = L["LABEL_MINUTE_FORMAT"],
									desc = L["TOOLTIP_MINUTE_FORMAT"],
									get = function()
										return cooldowns.primary[3].text.formatting.length
									end,
									set = function(self,value)
										--cooldowns.primary[3].text.justify = value
										--CheckRestorationDefaultValues(res_options,'Cooldowns')
										cooldowns.primary[3].text.formatting.length = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
									values = TIME_FORMATS,
								},
							},
						},
						p3_adjustGroup = {
							name = L["LABEL_COOLDOWN_SETTINGS"],
							type = "group",
							order = 14,
							hidden = true,
							guiInline = true,
							args = {
								color = {
									type = "color",
									order = 1,
									name = L["LABEL_FONT_COLOR"],
									desc = L["TOOLTIP_FONT_COLOR"],
									hasAlpha = true,
									get = function(info)
										local color = cooldowns.primary[3].text.font.color
										return color.r, color.g, color.b, color.a
									end,
									set = function(info, r, g, b, a)
										local color = cooldowns.primary[3].text.font.color
										
										color.r = tonumber(string.format("%.2f",r))
										color.g = tonumber(string.format("%.2f",g))
										color.b = tonumber(string.format("%.2f",b))
										color.a = tonumber(string.format("%.2f",a))
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
									width = "double",
								},
								copy = {
									order = 3,
									type = "select",
									name = L["LABEL_COOLDOWN_COPY_FROM"],
									desc = L["TOOLTIP_COOLDOWN_COPY_FROM"],
									get = function()
										return ''
									end,
									set = function(self,value)
										CopyCooldownOptions(value,2,'primary',3)
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
									values = {
										["primary;1"] = PRIMARY.." #1",
										["primary;2"] = PRIMARY.." #2",
										["secondary;1"] = SECONDARY.." #1",
										["secondary;2"] = SECONDARY.." #2",
									},
								},
								fontName = {
									order = 4,
									type = "select",
									dialogControl = "LSM30_Font",
									name = L["LABEL_FONT"],
									desc = L["TOOLTIP_FONT_NAME"],
									values = LSM:HashTable("font"),
									get = function() return cooldowns.primary[3].text.font.name end,
									set = function(self,value)
										cooldowns.primary[3].text.font.name = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
								fontSize = {
									order = 5,
									type = "range",
									name = FONT_SIZE,
									desc = L["TOOLTIP_COOLDOWN_FONT_SIZE"],
									min = 5,
									max = 40,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.primary[3].text.font.size end,
									set = function(self,value)
										cooldowns.primary[3].text.font.size = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
								fontOutline = {
									order = 6,
									type = "select",
									name = L["LABEL_FONT_OUTLINE"],
									desc = L["TOOLTIP_FONT_OUTLINE"],
									get = function()
										return cooldowns.primary[3].text.font.flag
									end,
									set = function(self,value)
										cooldowns.primary[3].text.font.flag = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
									values = FONT_OUTLINES,
								},
								textAnchor = {
									order = 7,
									type = "select",
									name = L["LABEL_FONT_ANCHOR"],
									desc = L["TOOLTIP_FONT_ANCHOR_POINT"],
									get = function()
										return cooldowns.primary[3].text.justify
									end,
									set = function(self,value)
										cooldowns.primary[3].text.justify = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
									values = FRAME_ANCHOR_OPTIONS,
								},
								textX = {
									order = 8,
									type = "range",
									name = "X",
									desc = L["TOOLTIP_FONT_X_OFFSET"],
									min = -100,
									max = 100,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.primary[3].text.x end,
									set = function(self,value)
										cooldowns.primary[3].text.x = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
								textY = {
									order = 9,
									type = "range",
									name = "Y",
									desc = L["TOOLTIP_FONT_Y_OFFSET"],
									min = -100,
									max = 100,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.primary[3].text.y end,
									set = function(self,value)
										cooldowns.primary[3].text.y = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
								shadow = {
									name = '|cFFFFFFFF'..L["LABEL_FONT_SHADOW"]..'|r',
									type = "group",
									order = 10,
									hidden = false,
									guiInline = true,
									args = {
										shadowToggle = {
											order = 1,
											name = L["TOGGLE"],
											desc = '',
											type = "toggle",
											get = function()
												return cooldowns.primary[3].text.font.shadow.isEnabled
											end,
											set = function(self,value)
												cooldowns.primary[3].text.font.shadow.isEnabled = value
												CheckEnhancementDefaultValues(enh_options,'Cooldowns')
											end,
										},
										shadowColor = {
											type = "color",
											order = 2,
											name = L["LABEL_FONT_SHADOW_COLOR"],
											desc = L["TOOLTIP_FONT_SHADOW_COLOR"],
											hasAlpha = true,
											get = function(info)
												local color = cooldowns.primary[3].text.font.shadow.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = cooldowns.primary[3].text.font.shadow.color

												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckEnhancementDefaultValues(enh_options,'Cooldowns')
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
											desc = L["TOOLTIP_FONT_SHADOW_X_OFFSET"],
											min = -10,
											max = 10,
											step = 1,
											bigStep = 1,
											disabled = true,
											get = function() return cooldowns.primary[3].text.font.shadow.offset.x end,
											set = function(self,value)
												cooldowns.primary[3].text.font.shadow.offset.x = value
												CheckEnhancementDefaultValues(enh_options,'Cooldowns')
											end,
										},
										shadowY = {
											order = 5,
											type = "range",
											name = "Y",
											desc = L["TOOLTIP_FONT_SHADOW_Y_OFFSET"],
											min = -10,
											max = 10,
											step = 1,
											bigStep = 1,
											disabled = true,
											get = function() return cooldowns.primary[3].text.font.shadow.offset.y end,
											set = function(self,value)
												cooldowns.primary[3].text.font.shadow.offset.y = value
												CheckEnhancementDefaultValues(enh_options,'Cooldowns')
											end,
										},
									},
								},
								reset = {
									order = 11,
									type = "execute",
									name = RESET_TO_DEFAULT,
									func = function()
										local cd = cooldowns.primary[3]
										local default = cooldownDefaults
										
										cd.text.isDisplayText = true
										cd.text.x = default.text.x
										cd.text.y = default.text.y
										cd.text.font.name = default.text.font.name
										cd.text.font.size = default.text.font.size
										cd.text.font.flag = default.text.font.flag
										cd.text.font.color.r = default.text.font.color.r
										cd.text.font.color.g = default.text.font.color.g
										cd.text.font.color.b = default.text.font.color.b
										cd.text.font.color.a = default.text.font.color.a
										cd.text.font.shadow.isEnabled = false
										cd.text.font.shadow.offset.x = default.text.font.shadow.offset.x
										cd.text.font.shadow.offset.y = default.text.font.shadow.offset.y
										cd.text.font.shadow.color.r = default.text.font.shadow.color.r
										cd.text.font.shadow.color.g = default.text.font.shadow.color.g
										cd.text.font.shadow.color.b = default.text.font.shadow.color.b
										cd.text.font.shadow.color.a = default.text.font.shadow.color.a
										cd.text.justify = default.text.justify

										enh_options.args.cooldowns.args.p3_adjustGroup.args.reset.disabled = true
										enh_options.args.cooldowns.args.p3_adjustGroup.args.reset.name = "|cFF666666"..RESET_TO_DEFAULT.."|r"
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
							},
						},
						s1_formatting = {
							name = FORMATTING,
							type = "group",
							order = 15,
							guiInline = true,
							args = {
								alertToggle = {
									order = 1,
									name = L["LABEL_ALERT"],
									desc = L["TOOLTIP_ALERT"],
									type = "toggle",
									get = function()
										return cooldowns.secondary[1].text.formatting.alert.isEnabled
									end,
									set = function(self,value)
										cooldowns.secondary[1].text.formatting.alert.isEnabled = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
									width = "double",
								},
								copy = {
									order = 2,
									type = "select",
									name = L["LABEL_COOLDOWN_COPY_FROM"],
									desc = L["TOOLTIP_COOLDOWN_COPY_FROM"],
									get = function()
										return ''
									end,
									set = function(self,value)
										CopyCooldownFormatting(value,2,'secondary',1)
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
									values = {
										["primary;1"] = PRIMARY.." #1",
										["primary;2"] = PRIMARY.." #2",
										["primary;3"] = PRIMARY.." #3",
										["secondary;2"] = SECONDARY.." #2",
									},
								},
								alertFlash = {
									order = 3,
									name = L["LABEL_ALERT_ANIMATE"],
									desc = L["TOOLTIP_ALERT_ANIMATE"],
									type = "toggle",
									get = function()
										return cooldowns.secondary[1].text.formatting.alert.animate
									end,
									set = function(self,value)
										cooldowns.secondary[1].text.formatting.alert.animate = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
								alertColor = {
									type = "color",
									order = 4,
									name = L["LABEL_ALERT_COLOR"],
									desc = L["TOOLTIP_ALERT_COLOR"],
									hasAlpha = true,
									get = function(info)
										local color = cooldowns.secondary[1].text.formatting.alert.color
										return color.r, color.g, color.b, color.a
									end,
									set = function(info, r, g, b, a)
										local color = cooldowns.secondary[1].text.formatting.alert.color
										
										color.r = tonumber(string.format("%.2f",r))
										color.g = tonumber(string.format("%.2f",g))
										color.b = tonumber(string.format("%.2f",b))
										color.a = tonumber(string.format("%.2f",a))
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
								alertThreshold = {
									order = 5,
									type = "range",
									name = L["LABEL_ALERT_THRESHOLD"],
									desc = L["TOOLTIP_ALERT_THRESHOLD"],
									min = 3,
									max = 10,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.secondary[1].text.formatting.alert.threshold end,
									set = function(self,value)
										cooldowns.secondary[1].text.formatting.alert.threshold = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
								decimals = {
									order = 6,
									name = L["LABEL_DECIMALS"],
									desc = L["TOOLTIP_DECIMALS"],
									type = "toggle",
									get = function()
										return cooldowns.secondary[1].text.formatting.decimals
									end,
									set = function(self,value)
										cooldowns.secondary[1].text.formatting.decimals = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
								format = {
									order = 7,
									type = "select",
									name = L["LABEL_MINUTE_FORMAT"],
									desc = L["TOOLTIP_MINUTE_FORMAT"],
									get = function()
										return cooldowns.secondary[1].text.formatting.length
									end,
									set = function(self,value)
										--cooldowns.secondary[1].text.justify = value
										--CheckRestorationDefaultValues(res_options,'Cooldowns')
										cooldowns.secondary[1].text.formatting.length = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
									values = TIME_FORMATS,
								},
							},
						},
						s1_adjustGroup = {
							name = L["LABEL_COOLDOWN_SETTINGS"],
							type = "group",
							order = 16,
							hidden = true,
							guiInline = true,
							args = {
								color = {
									type = "color",
									order = 1,
									name = L["LABEL_FONT_COLOR"],
									desc = L["TOOLTIP_FONT_COLOR"],
									hasAlpha = true,
									get = function(info)
										local color = cooldowns.secondary[1].text.font.color
										return color.r, color.g, color.b, color.a
									end,
									set = function(info, r, g, b, a)
										local color = cooldowns.secondary[1].text.font.color
										
										color.r = tonumber(string.format("%.2f",r))
										color.g = tonumber(string.format("%.2f",g))
										color.b = tonumber(string.format("%.2f",b))
										color.a = tonumber(string.format("%.2f",a))
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
									width = "double",
								},
								copy = {
									order = 3,
									type = "select",
									name = L["LABEL_COOLDOWN_COPY_FROM"],
									desc = L["TOOLTIP_COOLDOWN_COPY_FROM"],
									get = function()
										return ''
									end,
									set = function(self,value)
										CopyCooldownOptions(value,2,'secondary',1)
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
									values = {
										["primary;1"] = PRIMARY.." #1",
										["primary;2"] = PRIMARY.." #2",
										["primary;3"] = PRIMARY.." #3",
										["secondary;2"] = SECONDARY.." #2",
									},
								},
								fontName = {
									order = 4,
									type = "select",
									dialogControl = "LSM30_Font",
									name = L["LABEL_FONT"],
									desc = L["TOOLTIP_FONT_NAME"],
									values = LSM:HashTable("font"),
									get = function() return cooldowns.secondary[1].text.font.name end,
									set = function(self,value)
										cooldowns.secondary[1].text.font.name = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
								fontSize = {
									order = 5,
									type = "range",
									name = FONT_SIZE,
									desc = L["TOOLTIP_COOLDOWN_FONT_SIZE"],
									min = 5,
									max = 40,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.secondary[1].text.font.size end,
									set = function(self,value)
										cooldowns.secondary[1].text.font.size = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
								fontOutline = {
									order = 6,
									type = "select",
									name = L["LABEL_FONT_OUTLINE"],
									desc = L["TOOLTIP_FONT_OUTLINE"],
									get = function()
										return cooldowns.secondary[1].text.font.flag
									end,
									set = function(self,value)
										cooldowns.secondary[1].text.font.flag = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
									values = FONT_OUTLINES,
								},
								textAnchor = {
									order = 7,
									type = "select",
									name = L["LABEL_FONT_ANCHOR"],
									desc = L["TOOLTIP_FONT_ANCHOR_POINT"],
									get = function()
										return cooldowns.secondary[1].text.justify
									end,
									set = function(self,value)
										cooldowns.secondary[1].text.justify = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
									values = FRAME_ANCHOR_OPTIONS,
								},
								textX = {
									order = 8,
									type = "range",
									name = "X",
									desc = L["TOOLTIP_FONT_X_OFFSET"],
									min = -100,
									max = 100,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.secondary[1].text.x end,
									set = function(self,value)
										cooldowns.secondary[1].text.x = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
								textY = {
									order = 9,
									type = "range",
									name = "Y",
									desc = L["TOOLTIP_FONT_Y_OFFSET"],
									min = -100,
									max = 100,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.secondary[1].text.y end,
									set = function(self,value)
										cooldowns.secondary[1].text.y = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
								shadow = {
									name = '|cFFFFFFFF'..L["LABEL_FONT_SHADOW"]..'|r',
									type = "group",
									order = 10,
									hidden = false,
									guiInline = true,
									args = {
										shadowToggle = {
											order = 1,
											name = L["TOGGLE"],
											desc = '',
											type = "toggle",
											get = function()
												return cooldowns.secondary[1].text.font.shadow.isEnabled
											end,
											set = function(self,value)
												cooldowns.secondary[1].text.font.shadow.isEnabled = value
												CheckEnhancementDefaultValues(enh_options,'Cooldowns')
											end,
										},
										shadowColor = {
											type = "color",
											order = 2,
											name = L["LABEL_FONT_SHADOW_COLOR"],
											desc = L["TOOLTIP_FONT_SHADOW_COLOR"],
											hasAlpha = true,
											get = function(info)
												local color = cooldowns.secondary[1].text.font.shadow.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = cooldowns.secondary[1].text.font.shadow.color

												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckEnhancementDefaultValues(enh_options,'Cooldowns')
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
											desc = L["TOOLTIP_FONT_SHADOW_X_OFFSET"],
											min = -10,
											max = 10,
											step = 1,
											bigStep = 1,
											disabled = true,
											get = function() return cooldowns.secondary[1].text.font.shadow.offset.x end,
											set = function(self,value)
												cooldowns.secondary[1].text.font.shadow.offset.x = value
												CheckEnhancementDefaultValues(enh_options,'Cooldowns')
											end,
										},
										shadowY = {
											order = 5,
											type = "range",
											name = "Y",
											desc = L["TOOLTIP_FONT_SHADOW_Y_OFFSET"],
											min = -10,
											max = 10,
											step = 1,
											bigStep = 1,
											disabled = true,
											get = function() return cooldowns.secondary[1].text.font.shadow.offset.y end,
											set = function(self,value)
												cooldowns.secondary[1].text.font.shadow.offset.y = value
												CheckEnhancementDefaultValues(enh_options,'Cooldowns')
											end,
										},
									},
								},
								reset = {
									order = 11,
									type = "execute",
									name = RESET_TO_DEFAULT,
									func = function()
										local cd = cooldowns.secondary[1]
										local default = cooldownDefaults
										
										cd.text.isDisplayText = true
										cd.text.x = default.text.x
										cd.text.y = default.text.y
										cd.text.font.name = default.text.font.name
										cd.text.font.size = default.text.font.size
										cd.text.font.flag = default.text.font.flag
										cd.text.font.color.r = default.text.font.color.r
										cd.text.font.color.g = default.text.font.color.g
										cd.text.font.color.b = default.text.font.color.b
										cd.text.font.color.a = default.text.font.color.a
										cd.text.font.shadow.isEnabled = false
										cd.text.font.shadow.offset.x = default.text.font.shadow.offset.x
										cd.text.font.shadow.offset.y = default.text.font.shadow.offset.y
										cd.text.font.shadow.color.r = default.text.font.shadow.color.r
										cd.text.font.shadow.color.g = default.text.font.shadow.color.g
										cd.text.font.shadow.color.b = default.text.font.shadow.color.b
										cd.text.font.shadow.color.a = default.text.font.shadow.color.a
										cd.text.justify = default.text.justify

										enh_options.args.cooldowns.args.s1_adjustGroup.args.reset.disabled = true
										enh_options.args.cooldowns.args.s1_adjustGroup.args.reset.name = "|cFF666666"..RESET_TO_DEFAULT.."|r"
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
							},
						},
						s2_formatting = {
							name = FORMATTING,
							type = "group",
							order = 17,
							guiInline = true,
							args = {
								alertToggle = {
									order = 1,
									name = L["LABEL_ALERT"],
									desc = L["TOOLTIP_ALERT"],
									type = "toggle",
									get = function()
										return cooldowns.secondary[2].text.formatting.alert.isEnabled
									end,
									set = function(self,value)
										cooldowns.secondary[2].text.formatting.alert.isEnabled = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
									width = "double",
								},
								copy = {
									order = 2,
									type = "select",
									name = L["LABEL_COOLDOWN_COPY_FROM"],
									desc = L["TOOLTIP_COOLDOWN_COPY_FROM"],
									get = function()
										return ''
									end,
									set = function(self,value)
										CopyCooldownFormatting(value,2,'secondary',2)
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
									values = {
										["primary;1"] = PRIMARY.." #1",
										["primary;2"] = PRIMARY.." #2",
										["primary;3"] = PRIMARY.." #3",
										["secondary;1"] = SECONDARY.." #1",
									},
								},
								alertFlash = {
									order = 3,
									name = L["LABEL_ALERT_ANIMATE"],
									desc = L["TOOLTIP_ALERT_ANIMATE"],
									type = "toggle",
									get = function()
										return cooldowns.secondary[2].text.formatting.alert.animate
									end,
									set = function(self,value)
										cooldowns.secondary[2].text.formatting.alert.animate = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
								alertColor = {
									type = "color",
									order = 4,
									name = L["LABEL_ALERT_COLOR"],
									desc = L["TOOLTIP_ALERT_COLOR"],
									hasAlpha = true,
									get = function(info)
										local color = cooldowns.secondary[2].text.formatting.alert.color
										return color.r, color.g, color.b, color.a
									end,
									set = function(info, r, g, b, a)
										local color = cooldowns.secondary[2].text.formatting.alert.color
										
										color.r = tonumber(string.format("%.2f",r))
										color.g = tonumber(string.format("%.2f",g))
										color.b = tonumber(string.format("%.2f",b))
										color.a = tonumber(string.format("%.2f",a))
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
								alertThreshold = {
									order = 5,
									type = "range",
									name = L["LABEL_ALERT_THRESHOLD"],
									desc = L["TOOLTIP_ALERT_THRESHOLD"],
									min = 3,
									max = 10,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.secondary[2].text.formatting.alert.threshold end,
									set = function(self,value)
										cooldowns.secondary[2].text.formatting.alert.threshold = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
								decimals = {
									order = 6,
									name = L["LABEL_DECIMALS"],
									desc = L["TOOLTIP_DECIMALS"],
									type = "toggle",
									get = function()
										return cooldowns.secondary[2].text.formatting.decimals
									end,
									set = function(self,value)
										cooldowns.secondary[2].text.formatting.decimals = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
								format = {
									order = 7,
									type = "select",
									name = L["LABEL_MINUTE_FORMAT"],
									desc = L["TOOLTIP_MINUTE_FORMAT"],
									get = function()
										return cooldowns.secondary[2].text.formatting.length
									end,
									set = function(self,value)
										--cooldowns.secondary[2].text.justify = value
										--CheckRestorationDefaultValues(res_options,'Cooldowns')
										cooldowns.secondary[2].text.formatting.length = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
									values = TIME_FORMATS,
								},
							},
						},
						s2_adjustGroup = {
							name = L["LABEL_COOLDOWN_SETTINGS"],
							type = "group",
							order = 18,
							hidden = true,
							guiInline = true,
							args = {
								color = {
									type = "color",
									order = 1,
									name = L["LABEL_FONT_COLOR"],
									desc = L["TOOLTIP_FONT_COLOR"],
									hasAlpha = true,
									get = function(info)
										local color = cooldowns.secondary[2].text.font.color
										return color.r, color.g, color.b, color.a
									end,
									set = function(info, r, g, b, a)
										local color = cooldowns.secondary[2].text.font.color
										
										color.r = tonumber(string.format("%.2f",r))
										color.g = tonumber(string.format("%.2f",g))
										color.b = tonumber(string.format("%.2f",b))
										color.a = tonumber(string.format("%.2f",a))
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
									width = "double",
								},
								copy = {
									order = 3,
									type = "select",
									name = L["LABEL_COOLDOWN_COPY_FROM"],
									desc = L["TOOLTIP_COOLDOWN_COPY_FROM"],
									get = function()
										return ''
									end,
									set = function(self,value)
										CopyCooldownOptions(value,2,'secondary',2)
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
									values = {
										["primary;1"] = PRIMARY.." #1",
										["primary;2"] = PRIMARY.." #2",
										["primary;3"] = PRIMARY.." #3",
										["secondary;1"] = SECONDARY.." #1",
									},
								},
								fontName = {
									order = 4,
									type = "select",
									dialogControl = "LSM30_Font",
									name = L["LABEL_FONT"],
									desc = L["TOOLTIP_FONT_NAME"],
									values = LSM:HashTable("font"),
									get = function() return cooldowns.secondary[2].text.font.name end,
									set = function(self,value)
										cooldowns.secondary[2].text.font.name = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
								fontSize = {
									order = 5,
									type = "range",
									name = FONT_SIZE,
									desc = L["TOOLTIP_COOLDOWN_FONT_SIZE"],
									min = 5,
									max = 40,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.secondary[2].text.font.size end,
									set = function(self,value)
										cooldowns.secondary[2].text.font.size = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
								fontOutline = {
									order = 6,
									type = "select",
									name = L["LABEL_FONT_OUTLINE"],
									desc = L["TOOLTIP_FONT_OUTLINE"],
									get = function()
										return cooldowns.secondary[2].text.font.flag
									end,
									set = function(self,value)
										cooldowns.secondary[2].text.font.flag = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
									values = FONT_OUTLINES,
								},
								textAnchor = {
									order = 7,
									type = "select",
									name = L["LABEL_FONT_ANCHOR"],
									desc = L["TOOLTIP_FONT_ANCHOR_POINT"],
									get = function()
										return cooldowns.secondary[2].text.justify
									end,
									set = function(self,value)
										cooldowns.secondary[2].text.justify = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
									values = FRAME_ANCHOR_OPTIONS,
								},
								textX = {
									order = 8,
									type = "range",
									name = "X",
									desc = L["TOOLTIP_FONT_X_OFFSET"],
									min = -100,
									max = 100,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.secondary[2].text.x end,
									set = function(self,value)
										cooldowns.secondary[2].text.x = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
								textY = {
									order = 9,
									type = "range",
									name = "Y",
									desc = L["TOOLTIP_FONT_Y_OFFSET"],
									min = -100,
									max = 100,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.secondary[2].text.y end,
									set = function(self,value)
										cooldowns.secondary[2].text.y = value
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
								shadow = {
									name = '|cFFFFFFFF'..L["LABEL_FONT_SHADOW"]..'|r',
									type = "group",
									order = 10,
									hidden = false,
									guiInline = true,
									args = {
										shadowToggle = {
											order = 1,
											name = L["TOGGLE"],
											desc = '',
											type = "toggle",
											get = function()
												return cooldowns.secondary[2].text.font.shadow.isEnabled
											end,
											set = function(self,value)
												cooldowns.secondary[2].text.font.shadow.isEnabled = value
												CheckEnhancementDefaultValues(enh_options,'Cooldowns')
											end,
										},
										shadowColor = {
											type = "color",
											order = 2,
											name = L["LABEL_FONT_SHADOW_COLOR"],
											desc = L["TOOLTIP_FONT_SHADOW_COLOR"],
											hasAlpha = true,
											get = function(info)
												local color = cooldowns.secondary[2].text.font.shadow.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = cooldowns.secondary[2].text.font.shadow.color

												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckEnhancementDefaultValues(enh_options,'Cooldowns')
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
											desc = L["TOOLTIP_FONT_SHADOW_X_OFFSET"],
											min = -10,
											max = 10,
											step = 1,
											bigStep = 1,
											disabled = true,
											get = function() return cooldowns.secondary[2].text.font.shadow.offset.x end,
											set = function(self,value)
												cooldowns.secondary[2].text.font.shadow.offset.x = value
												CheckEnhancementDefaultValues(enh_options,'Cooldowns')
											end,
										},
										shadowY = {
											order = 5,
											type = "range",
											name = "Y",
											desc = L["TOOLTIP_FONT_SHADOW_Y_OFFSET"],
											min = -10,
											max = 10,
											step = 1,
											bigStep = 1,
											disabled = true,
											get = function() return cooldowns.secondary[2].text.font.shadow.offset.y end,
											set = function(self,value)
												cooldowns.secondary[2].text.font.shadow.offset.y = value
												CheckEnhancementDefaultValues(enh_options,'Cooldowns')
											end,
										},
									},
								},
								reset = {
									order = 11,
									type = "execute",
									name = RESET_TO_DEFAULT,
									func = function()
										local cd = cooldowns.secondary[2]
										local default = cooldownDefaults
										
										cd.text.isDisplayText = true
										cd.text.x = default.text.x
										cd.text.y = default.text.y
										cd.text.font.name = default.text.font.name
										cd.text.font.size = default.text.font.size
										cd.text.font.flag = default.text.font.flag
										cd.text.font.color.r = default.text.font.color.r
										cd.text.font.color.g = default.text.font.color.g
										cd.text.font.color.b = default.text.font.color.b
										cd.text.font.color.a = default.text.font.color.a
										cd.text.font.shadow.isEnabled = false
										cd.text.font.shadow.offset.x = default.text.font.shadow.offset.x
										cd.text.font.shadow.offset.y = default.text.font.shadow.offset.y
										cd.text.font.shadow.color.r = default.text.font.shadow.color.r
										cd.text.font.shadow.color.g = default.text.font.shadow.color.g
										cd.text.font.shadow.color.b = default.text.font.shadow.color.b
										cd.text.font.shadow.color.a = default.text.font.shadow.color.a
										cd.text.justify = default.text.justify

										enh_options.args.cooldowns.args.s2_adjustGroup.args.reset.disabled = true
										enh_options.args.cooldowns.args.s2_adjustGroup.args.reset.name = "|cFF666666"..RESET_TO_DEFAULT.."|r"
										CheckEnhancementDefaultValues(enh_options,'Cooldowns')
									end,
								},
							},
						},
					},
				},
				layout = {
					name = L["LABEL_LAYOUT"],
					order = 5,
					type = "group",
					disabled = true,
					args = {
						MoveAuras = {
							order = 1,
							type = "execute",
							name = "|cFFFFCC00"..L["BUTTON_MOVE_AURAS_ENHANCEMENT"].."|r",
							func = function()
								elements.isMoving = true
								SSA.Move2.Info:Show()
								Auras:InitMoveAuraGroups(2)
							end,
						},
						ResetAuras = {
							order = 2,
							type = "execute",
							name = "|cFFFFCC00"..L["BUTTON_RESET_AURAS_ENHANCEMENT"].."|r",
							func = function()
								Auras:ResetAuraGroupPosition('AuraGroup2')
							end,
						},
						primaryAuras = {
							name = L["LABEL_AURAS_PRIMARY"],
							type = "group",
							order = 3,
							guiInline = true,
							args = {
								PrimaryOrientation1 = {
									order = 1,
									type = "select",
									name = L["LABEL_AURAS_ORIENTATION"].." 1",
									desc = L["TOOLTIP_AURAS_ORIENTATION"],
									get = function()
										return layout.orientation.top
									end,
									set = function(self,value)
										layout.orientation.top = value
										CheckEnhancementDefaultValues(enh_options,"Primary")
										Auras:UpdateTalents()
									end,
									values = {
										["Horizontal"] = L["OPTION_HORIZONTAL"],
										["Vertical"] = L["OPTION_VERTICAL"],
									},
								},
								PrimaryOrientation2 = {
									order = 2,
									type = "select",
									name = L["LABEL_AURAS_ORIENTATION"].." 2",
									desc = L["TOOLTIP_AURAS_ORIENTATION"],
									get = function()
										return layout.orientation.bottom
									end,
									set = function(self,value)
										layout.orientation.bottom = value
										CheckEnhancementDefaultValues(enh_options,"Primary")
										Auras:UpdateTalents()
									end,
									values = {
										["Horizontal"] = L["OPTION_HORIZONTAL"],
										["Vertical"] = L["OPTION_VERTICAL"],
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
									name = L["LABEL_AURAS_SIZE"].." 1",
									desc = L["TOOLTIP_AURAS_SIZE"],
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
									name = L["LABEL_AURAS_SPACING"].." 1",
									desc = L["TOOLTIP_AURAS_SPACING"],
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
									name = L["LABEL_AURAS_CHARGES"].." 1",
									desc = L["TOOLTIP_AURAS_CHARGE_SIZE"],
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
									name = L["LABEL_AURAS_SIZE"].." 2",
									desc = L["TOOLTIP_AURAS_SIZE"],
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
									name = L["LABEL_AURAS_SPACING"].." 2",
									desc = L["TOOLTIP_AURAS_SPACING"],
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
									name = L["LABEL_AURAS_CHARGES"].." 2",
									desc = L["TOOLTIP_AURAS_CHARGE_SIZE"],
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
									--name = "|cFFFFCC00"..L["BUTTON_RESET_LAYOUT_PRIMARY"].."|r",
									--disabled = false,
									name = L["BUTTON_RESET_LAYOUT_PRIMARY"],
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
										enh_options.args.layout.args.primaryAuras.args.ResetPrimaryLayout.name = "|cFF666666"..L["BUTTON_RESET_LAYOUT_PRIMARY"].."|r"
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
							name = L["LABEL_AURAS_SECONDARY"],
						},]]
						secondaryAuras = {
							name = L["LABEL_AURAS_SECONDARY"],
							type = "group",
							order = 4,
							guiInline = true,
							args = {
								SecondaryOrientation1 = {
									order = 1,
									type = "select",
									name = L["LABEL_AURAS_ORIENTATION"].." 1",
									desc = L["TOOLTIP_AURAS_ORIENTATION"],
									get = function()
										return layout.orientation.left
									end,
									set = function(self,value)
										layout.orientation.left = value
										CheckEnhancementDefaultValues(enh_options,"Secondary")
										Auras:UpdateTalents()
									end,
									values = {
										["Horizontal"] = L["OPTION_HORIZONTAL"],
										["Vertical"] = L["OPTION_VERTICAL"],
									},
								},
								SecondaryOrientation2 = {
									order = 2,
									type = "select",
									name = L["LABEL_AURAS_ORIENTATION"].." 2",
									desc = L["TOOLTIP_AURAS_ORIENTATION"],
									get = function()
										return layout.orientation.right
									end,
									set = function(self,value)
										layout.orientation.right = value
										CheckEnhancementDefaultValues(enh_options,"Secondary")
										Auras:UpdateTalents()
									end,
									values = {
										["Horizontal"] = L["OPTION_HORIZONTAL"],
										["Vertical"] = L["OPTION_VERTICAL"],
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
									name = L["LABEL_AURAS_SIZE"].." 1",
									desc = L["TOOLTIP_AURAS_SIZE"],
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
									name = L["LABEL_AURAS_SPACING"].." 1",
									desc = L["TOOLTIP_AURAS_SPACING"],
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
									name = L["LABEL_AURAS_SIZE"].." 2",
									desc = L["TOOLTIP_AURAS_SIZE"],
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
									name = L["LABEL_AURAS_SPACING"].." 2",
									desc = L["TOOLTIP_AURAS_SPACING"],
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
									--name = "|cFFFFCC00"..L["BUTTON_RESET_LAYOUT_SECONDARY"].."|r",
									--disabled = false,
									name = L["BUTTON_RESET_LAYOUT_SECONDARY"],
									func = function()
										layout.orientation.left = layoutDefaults.orientation.left
										layout.orientation.right = layoutDefaults.orientation.right
										layout.secondary.left.icon = layoutDefaults.secondary.left.icon
										layout.secondary.left.spacing = layoutDefaults.secondary.left.spacing
										layout.secondary.right.icon = layoutDefaults.secondary.right.icon
										layout.secondary.right.spacing = layoutDefaults.secondary.right.spacing
										enh_options.args.layout.args.secondaryAuras.args.ResetSecondaryLayout.disabled = true
										enh_options.args.layout.args.secondaryAuras.args.ResetSecondaryLayout.name = "|cFF666666"..L["BUTTON_RESET_LAYOUT_SECONDARY"].."|r"
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
		local cooldownDefaults = db.elements.defaults[3].cooldowns
		local statusbarDefaults = db.elements.defaults[3].statusbars
		local frameDefaults = db.elements.defaults[3].frames
		
		res_options = {
			type = "group",
			childGroups = "tab",
			order = 1,
			name = L["LABEL_AURAS_RESTORATION"],
			desc = '',
			args = {
				display = {
					name = DISPLAY,
					order = 1,
					type = "group",
					args = {
						show = {
							order = 1,
							name = L["LABEL_SHOW_RESTORATION_AURAS"],
							desc = L["TOOLTIP_TOGGLE_RESTORATION_AURAS"],
							type = "toggle",
							get = function()
								return elements.isEnabled
							end,
							set = function(self,value)
								elements.isEnabled = value
								if (not value) then
									SSA.AuraGroup3:Hide()
								else
									SSA.AuraGroup3:Show()
								end
							end,
						},
						MajorAuras = {
							name = L["LABEL_AURAS_MAJOR"],
							type = "group",
							order = 2,
							guiInline = true,
							args = {
								AncestralGuidance = {
									order = 1,
									type = "toggle",
									name = Auras:GetSpellName(108281),
									get = function() 
										return auras.AncestralGuidance3
									end,
									set = function(self,value)
										auras.AncestralGuidance3 = value
										Auras:UpdateTalents()
									end,
								},
								Ascendance = {
									order = 2,
									type = "toggle",
									name = Auras:GetSpellName(114050),
									get = function() 
										return auras.Ascendance3
									end,
									set = function(self,value)
										auras.Ascendance3 = value
										Auras:UpdateTalents()
									end,
								},
								CloudburstTotem = {
									order = 3,
									type = "toggle",
									name = Auras:GetSpellName(157153),
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
									name = Auras:GetSpellName(242586),
									get = function()
										return auras.Concordance3
									end,
									set = function(self,value)
										auras.Concordance3 = value
										Auras:UpdateTalents()
									end,
								},
								GiftOfQueen = {
									order = 5,
									type = "toggle",
									name = Auras:GetSpellName(207778),
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
									name = Auras:GetSpellName(73920),
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
									name = Auras:GetSpellName(5394),
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
									name = Auras:GetSpellName(108280),
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
									name = Auras:GetSpellName(61295),
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
									name = Auras:GetSpellName(98008),
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
									name = Auras:GetSpellName(73685),
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
									name = Auras:GetSpellName(197995),
									get = function() 
										return auras.Wellspring
									end,
									set = function(self,value)
										auras.Wellspring = value
										Auras:UpdateTalents()
									end,
								},
								WindRushTotem = {
									order = 13,
									type = "toggle",
									name = Auras:GetSpellName(192077),
									get = function() 
										return auras.WindRushTotem3
									end,
									set = function(self,value)
										auras.WindRushTotem3 = value
										Auras:UpdateTalents()
									end,
								},
							},
						},
						MinorAuras = {
							name = L["LABEL_AURAS_MINOR"],
							type = "group",
							order = 3,
							guiInline = true,
							args = {
								AstralShift = {
									order = 1,
									type = "toggle",
									name = Auras:GetSpellName(108271),
									get = function()
										return auras.AstralShift3
									end,
									set = function(self,value)
										auras.AstralShift3 = value
										Auras:UpdateTalents()
									end,
								},
								EarthenShield = {
									order = 2,
									type = "toggle",
									name = Auras:GetSpellName(198838),
									get = function()
										return auras.EarthenShieldTotem
									end,
									set = function(self,value)
										auras.EarthenShieldTotem = value
										Auras:UpdateTalents()
									end,
								},
								EarthgrabTotem = {
									order = 3,
									type = "toggle",
									name = Auras:GetSpellName(51485),
									get = function() 
										return auras.EarthgrabTotem3
									end,
									set = function(self,value)
										auras.EarthgrabTotem3 = value
										Auras:UpdateTalents()
									end,
								},
								FlameShock = {
									order = 4,
									type = "toggle",
									name = Auras:GetSpellName(188838),
									get = function() 
										return auras.FlameShock3
									end,
									set = function(self,value)
										auras.FlameShock3 = value
										Auras:UpdateTalents()
									end,
								},
								GustWind = {
									order = 5,
									type = "toggle",
									name = Auras:GetSpellName(192063),
									get = function() 
										return auras.GustWind3
									end,
									set = function(self,value)
										auras.GustWind3 = value
										Auras:UpdateTalents()
									end,
								},
								Hex = {
									order = 6,
									type = "toggle",
									name = Auras:GetSpellName(51514),
									get = function()
										return auras.Hex3
									end,
									set = function(self,value)
										auras.Hex3 = value
										Auras:UpdateTalents()
									end,
								},
								LavaBurst = {
									order = 7,
									type = "toggle",
									name = Auras:GetSpellName(51505),
									get = function() 
										return auras.LavaBurst3
									end,
									set = function(self,value)
										auras.LavaBurst3 = value
										Auras:UpdateTalents()
									end,
								},
								LightningSurgeTotem = {
									order = 8,
									type = "toggle",
									name = Auras:GetSpellName(192058),
									get = function() 
										return auras.LightningSurgeTotem3
									end,
									set = function(self,value)
										auras.LightningSurgeTotem3 = value
										Auras:UpdateTalents()
									end,
								},
								PurifySpirit = {
									order = 9,
									type = "toggle",
									name = Auras:GetSpellName(77130),
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
									name = Auras:GetSpellName(79206),
									get = function() 
										return auras.SpiritwalkersGrace
									end,
									set = function(self,value)
										auras.SpiritwalkersGrace = value
										Auras:UpdateTalents()
									end,
								},
								VoodooTotem = {
									order = 11,
									type = "toggle",
									name = Auras:GetSpellName(196932),
									get = function() 
										return auras.VoodooTotem3
									end,
									set = function(self,value)
										auras.VoodooTotem3 = value
										Auras:UpdateTalents()
									end,
								},
								WindRushTotem = {
									order = 12,
									type = "toggle",
									name = Auras:GetSpellName(192077),
									get = function()
										return auras.WindRushTotem3
									end,
									set = function(self,value)
										auras.WindRushTotem3 = value
										Auras:UpdateTalents()
									end,
								},
								WindShear = {
									order = 13,
									type = "toggle",
									name = Auras:GetSpellName(57994),
									get = function() 
										return auras.WindShear3
									end,
									set = function(self,value)
										auras.WindShear3 = value
										Auras:UpdateTalents()
									end,
								},
							},
						},
						ProgressBars = {
							name = L["LABEL_PROGRESS_BARS"],
							type = "group",
							order = 4,
							guiInline = true,
							args = {
								BuffTimerBars = {
									name = L["LABEL_STATUSBAR_BUFF_TIMER"],
									type = "group",
									order = 4,
									guiInline = true,
									args = {
										AncestralGuidanceBar = {
											order = 1,
											type = "toggle",
											name = Auras:GetSpellName(108281),
											get = function() 
												return timerbars.buff.ancestralGuidance
											end,
											set = function(self,value)
												timerbars.buff.ancestralGuidance = value
											end,
										},
										AscendanceBar = {
											order = 2,
											type = "toggle",
											name = Auras:GetSpellName(114052),
											get = function() 
												return timerbars.buff.ascendance
											end,
											set = function(self,value)
												timerbars.buff.ascendance = value
											end,
										},
										AstralShiftBar = {
											order = 3,
											type = "toggle",
											name = Auras:GetSpellName(108271),
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
											name = Auras:GetSpellName(2825),
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
											name = Auras:GetSpellName(32182),
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
											name = Auras:GetSpellName(79206),
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
											name = Auras:GetSpellName(80353),
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
											name = Auras:GetSpellName(73685),
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
									name = L["LABEL_TIMERS_TOTEM"],
									type = "group",
									order = 5,
									guiInline = true,
									args = {
										AncestralProtectionTotemBar = {
											order = 1,
											type = "toggle",
											name = Auras:GetSpellName(207399),
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
											name = Auras:GetSpellName(157153),
											get = function() 
												return timerbars.main.cloudburstTotem
											end,
											set = function(self,value)
												timerbars.main.cloudburstTotem = value
											end,
										},
										EarthgrabTotemBar = {
											order = 3,
											type = "toggle",
											name = Auras:GetSpellName(51485),
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
											name = Auras:GetSpellName(5394),
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
											name = Auras:GetSpellName(108280),
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
											name = Auras:GetSpellName(98008),
											get = function() 
												return timerbars.main.spiritLinkTotem
											end,
											set = function(self,value)
												timerbars.main.spiritLinkTotem = value
											end,
										},
										VoodooTotemBar = {
											order = 7,
											type = "toggle",
											name = Auras:GetSpellName(196932),
											get = function() 
												return timerbars.util.voodooTotem
											end,
											set = function(self,value)
												timerbars.util.voodooTotem = value
											end,
										},
										WindRushTotemBar = {
											order = 8,
											type = "toggle",
											name = Auras:GetSpellName(192077),
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
							name = L["TOOLTIP_TEXTURE_ALERTS"],
							type = "group",
							order = 5,
							guiInline = true,
							args = {
								TotemMastery = {
									order = 1,
									type = "toggle",
									name = Auras:GetSpellName(200071),
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
				general = {
					name = MAIN_MENU,
					order = 2,
					type = "group",
					childGroups = "tab",
					disabled = true,
					args = {
						settings = {
							name = L["LABEL_AURAS_SETTINGS"],
							type = "group",
							order = 3,
							guiInline = true,
							args = {
								OoCAlpha = {
									order = 1,
									type = "range",
									name = L["LABEL_ALPHA_NO_COMBAT"],
									desc = L["TOOLTIP_AURAS_ALPHA_NO_COMBAT"],
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
									name = Auras:GetSpellName(188389),
									desc = L["TOOLTIP_GLOW_TIME_TRIGGER"],
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
									name = L["LABEL_COLOR_NO_RANGE"],
									desc = L["TOOLTIP_COLOR_OUT_OF_RANGE"],
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
								reset = {
									order = 4,
									type = "execute",
									--name = "|cFFFFCC00"..L["BUTTON_RESET_SETTINGS"].."|r",
									--disabled = false,
									name = L["BUTTON_RESET_SETTINGS"],
									func = function()
										settings.OoCAlpha = Auras.db.char.triggers.default.OoCAlpha
										settings.flameShock = Auras.db.char.triggers.default[3].flameShock
										settings.OoRColor.r = Auras.db.char.triggers.default.OoRColor.r
										settings.OoRColor.g = Auras.db.char.triggers.default.OoRColor.g
										settings.OoRColor.b = Auras.db.char.triggers.default.OoRColor.b
										settings.OoRColor.a = Auras.db.char.triggers.default.OoRColor.a
										
										res_options.args.bars.args.triggers.args.reset.disabled = true
										res_options.args.bars.args.triggers.args.reset.name = "|cFF666666"..L["BUTTON_RESET_SETTINGS"].."|r"
									end,
								},
							},
						},
					},
				},
				bars = {
					name = L["LABEL_PROGRESS_BARS"],
					order = 3,
					type = "group",
					childGroups = "tab",
					disabled = true,
					args = {
						general = {
							name = GENERAL,
							order = 1,
							inline = false,
							type = "group",
							args = {
								statusbars = {
									name = L["LABEL_STATUSBAR_MANAGER"],
									type = "group",
									order = 1,
									guiInline = true,
									args = {
										defaultBarToggle = {
											order = 1,
											name = L["LABEL_STATUSBAR_BLIZZARD"],
											desc = L["TOOLTIP_TOGGLE_BLIZZARD_BAR"],
											type = "toggle",
											get = function()
												return statusbars.defaultBar
											end,
											set = function(self,value)
												--[[local option = res_options.args.bars.args.manaBar
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
											name = L["TOGGLE_CAST_BAR"],
											desc = L["TOOLTIP_TOGGLE_CAST_BAR"],
											type = "toggle",
											get = function()
												return statusbars.castBar.isEnabled
											end,
											set = function(self,value)
												local option = res_options.args.bars.args.castBar
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
											name = L["TOGGLE_CHANNEL_BAR"],
											desc = L["TOOLTIP_TOGGLE_CHANNEL_BAR"],
											type = "toggle",
											get = function()
												return statusbars.channelBar.isEnabled
											end,
											set = function(self,value)
												local option = res_options.args.bars.args.channelBar
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
											name = L["TOGGLE_MANA_BAR"],
											desc = L["TOOLTIP_TOGGLE_MANA_BAR"],
											type = "toggle",
											get = function()
												return statusbars.manaBar.isEnabled
											end,
											set = function(self,value)
												local option = res_options.args.bars.args.manaBar
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
											name = L["TOGGLE_EARTHEN_SHIELD_BAR"],
											desc = L["TOOLTIP_TOGGLE_EARTHEN_SHIELD_BAR"],
											type = "toggle",
											get = function()
												return statusbars.earthenShieldBar.isEnabled
											end,
											set = function(self,value)
												local option = res_options.args.bars.args.earthenShieldBar
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
											name = L["TOGGLE_TIDAL_WAVES_BAR"],
											desc = L["TOOLTIP_TOGGLE_TIDAL_WAVES_BAR"],
											type = "toggle",
											get = function()
												return statusbars.tidalWavesBar.isEnabled
											end,
											set = function(self,value)
												local option = res_options.args.bars.args.tidalWavesBar
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
							},
						},
						manaBar = {
							name = L["LABEL_STATUSBAR_MANA"],
							order = 2,
							type = "group",
							inline = false,
							args = {
								adjust = {
									order = 1,
									name = L["LABEL_STATUSBAR_MODIFY_MANA"],
									desc = L["TOOLTIP_TOGGLE_STATUSBAR_CUSTOMIZATON"],
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
									name = L["LABEL_TEXT_MANA"],
									desc = L["TOOLTIP_TOGGLE_MANA_TEXT"],
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
									name = "|cFFFFFFFF"..SETTINGS.."|r",
									order = 3,
									type = "group",
									guiInline = true,
									args = {
										alphaCombat = {
											order = 1,
											type = "range",
											name = L["LABEL_ALPHA_COMBAT"],
											desc = L["TOOLTIP_STATUSBAR_ALPHA_COMBAT"],
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
											name = L["LABEL_ALPHA_NO_TARGET_NO_COMBAT"],
											desc = L["TOOLTIP_STATUSBAR_ALPHA_NO_COMBAT"],
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
											name = L["LABEL_ALPHA_TARGET_NO_COMBAT"],
											desc = L["TOOLTIP_STATUSBAR_ALPHA_TARGET_NO_COMBAT"],
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
											name = L["LABEL_DIGIT_GROUPING"],
											desc = L["TOOLTIP_DIGIT_GROUPING"],
											type = "toggle",
											get = function()
												return statusbars.manaBar.grouping
											end,
											set = function(self,value)
												statusbars.manaBar.grouping = value
												CheckRestorationDefaultValues(res_options,'Mana')
												if (value) then
													res_options.args.bars.args.manaBar.args.general.args.ManaBarPrecision.values = {
														--[[[tostring(ManaPrecision("Full"))] = "Full",
														[tostring(ManaPrecision("Thousand"))] = "Thousand",
														[tostring(ManaPrecision("Million"))] = "Million",]]
														["Long"] = tostring(Auras:ManaPrecision("Long")),
														["Short"] = tostring(Auras:ManaPrecision("Short")),
													}
												else
													res_options.args.bars.args.manaBar.args.general.args.ManaBarPrecision.values = {
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
											name = L["LABEL_PRECISION_MANA"],
											desc = L["TOOLTIP_AURAS_ORIENTATION"],
											get = function()
												res_options.args.bars.args.manaBar.args.general.args.ManaBarPrecision.values = {
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
									name = '|cFFFFFFFF'..L["LABEL_TEXT_MANA"]..'|r',
									type = "group",
									order = 4,
									disabled = true,
									guiInline = true,
									args = {
										color = {
											type = "color",
											order = 1,
											name = L["LABEL_FONT_COLOR"],
											desc = L["TOOLTIP_FONT_COLOR"],
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
											width = "full",
										},
										timeFontName = {
											order = 2,
											type = "select",
											dialogControl = "LSM30_Font",
											name = L["LABEL_FONT"],
											desc = L["TOOLTIP_FONT_NAME"],
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
											order = 3,
											type = "range",
											name = FONT_SIZE,
											desc = L["TOOLTIP_COOLDOWN_FONT_SIZE"],
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
											order = 4,
											type = "select",
											name = L["LABEL_FONT_OUTLINE"],
											desc = L["TOOLTIP_FONT_OUTLINE"],
											get = function()
												return statusbars.manaBar.text.font.flag
											end,
											set = function(self,value)
												statusbars.manaBar.text.font.flag = value
												CheckRestorationDefaultValues(res_options,"Mana")
											end,
											values = FONT_OUTLINES,
										},
										timeTextAnchor = {
											order = 5,
											type = "select",
											name = L["LABEL_FONT_ANCHOR"],
											desc = L["TOOLTIP_FONT_ANCHOR_POINT"],
											get = function()
												return statusbars.manaBar.text.justify
											end,
											set = function(self,value)
												statusbars.manaBar.text.justify = value
												CheckRestorationDefaultValues(res_options,"Mana")
											end,
											values = FRAME_ANCHOR_OPTIONS,
										},
										timeTextX = {
											order = 6,
											type = "range",
											name = "X",
											desc = L["TOOLTIP_FONT_X_OFFSET"],
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
											order = 7,
											type = "range",
											name = "Y",
											desc = L["TOOLTIP_FONT_Y_OFFSET"],
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
											name = '|cFFFFFFFF'..L["LABEL_FONT_SHADOW"]..'|r',
											type = "group",
											order = 8,
											hidden = false,
											guiInline = true,
											args = {
												shadowToggle = {
													order = 1,
													name = L["TOGGLE"],
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
													name = L["LABEL_FONT_SHADOW_COLOR"],
													desc = L["TOOLTIP_FONT_SHADOW_COLOR"],
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
												shadowX = {
													order = 3,
													type = "range",
													name = "X",
													desc = L["TOOLTIP_FONT_SHADOW_X_OFFSET"],
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
													order = 4,
													type = "range",
													name = "Y",
													desc = L["TOOLTIP_FONT_SHADOW_Y_OFFSET"],
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
									name = L["LABEL_LAYOUT_DESIGN"],
									type = "group",
									order = 5,
									guiInline = true,
									args = {
										texture = {
											order = 1,
											type = "select",
											name = L["LABEL_STATUSBAR_TEXTURE"],
											desc = L["TOOLTIP_STATUSBAR_TEXTURE"],
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
											name = L["LABEL_STATUSBAR_COLOR"],
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
											width = "double",
										},
										backgroundTexture = {
											order = 3,
											type = "select",
											name = L["LABEL_STATUSBAR_BG_TEXTURE"],
											desc = L["TOOLTIP_STATUSBAR_BG_TEXTURE"],
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
											order = 4,
											name = L["LABEL_STATUSBAR_BG_COLOR"],
											desc = L["TOOLTIP_STATUSBAR_BG_COLOR"],
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
											order = 5,
											name = L["LABEL_STATUSBAR_MODIFY_BACKGROUND"],
											desc = L["TOOLTIP_TOGGLE_STATUSBAR_BG_CUSTOMIZATON"],
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
											order = 6,
											type = "range",
											name = L["LABEL_WIDTH"],
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
											order = 7,
											type = "range",
											name = L["LABEL_HEIGHT"],
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
									name = L["BUTTON_RESET_STATUSBAR_MAELSTROM"],
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
										
										res_options.args.bars.args.manaBar.args.reset.disabled = true
										res_options.args.bars.args.manaBar.args.reset.name = "|cFF666666"..L["BUTTON_RESET_STATUSBAR_MANA"].."|r"
										CheckRestorationDefaultValues(res_options,"Mana")
										
										if (not bar.adjust.isEnabled) then
											Auras:InitializeProgressBar('ManaBar',nil,'manaBar','text',nil,3)
										end
									end,
								},
							},
						},
						castBar = {
							name = L["LABEL_STATUSBAR_CAST"],
							order = 3,
							inline = false,
							type = "group",
							args = {
								adjust = {
									order = 1,
									name = L["LABEL_STATUSBAR_MODIFY_CAST"],
									desc = L["TOOLTIP_TOGGLE_STATUSBAR_CUSTOMIZATON"],
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
									name = L["TOGGLE_SPELL_TEXT"],
									desc = L["TOOLTIP_TOGGLE_SPELL_TEXT"],
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
									name = L["TOGGLE_TIME_TEXT"],
									desc = L["TOOLTIP_TOGGLE_TIME_TEXT"],
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
									name = "|cFFFFFFFF"..SETTINGS.."|r",
									order = 4,
									type = "group",
									guiInline = true,
									args = {
										alphaCombat = {
											order = 1,
											type = "range",
											name = L["LABEL_ALPHA_COMBAT"],
											desc = L["TOOLTIP_STATUSBAR_ALPHA_COMBAT"],
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
											name = L["LABEL_ALPHA_NO_COMBAT"],
											desc = L["TOOLTIP_STATUSBAR_ALPHA_NO_COMBAT"],
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
									name = '|cFFFFFFFF'..L["LABEL_ICON_SPARK"]..'|r',
									type = "group",
									order = 5,
									disabled = true,
									guiInline = true,
									args = {
										sparkToggle = {
											order = 1,
											name = L["TOGGLE_SPARK"],
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
											name = L["TOGGLE_ICON"],
											desc = '',
											type = "toggle",
											get = function()
												return statusbars.castBar.icon.isEnabled
											end,
											set = function(self,value)
												local option = res_options.args.bars.args.castBar.args.iconSpark.args.iconJustify.disabled
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
											name = L["LABEL_ICON_JUSTIFY"],
											desc = L["TOOLTIP_STATUSBAR_ICON_LOCATION"],
											get = function()
												return statusbars.castBar.icon.justify
											end,
											set = function(self,value)
												statusbars.castBar.icon.justify = value
												CheckRestorationDefaultValues(res_options,'Cast','castBar')
											end,
											values = ICON_JUSTIFY,
										},
									},
								},
								nametext = {
									name = '|cFFFFFFFF'..L["LABEL_TEXT_SPELL"]..'|r',
									type = "group",
									order = 6,
									disabled = true,
									guiInline = true,
									args = {
										color = {
											type = "color",
											order = 1,
											name = L["LABEL_FONT_COLOR"],
											desc = L["TOOLTIP_FONT_COLOR"],
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
											width = "full",
										},
										fontName = {
											order = 2,
											type = "select",
											dialogControl = "LSM30_Font",
											name = L["LABEL_FONT"],
											desc = L["TOOLTIP_FONT_NAME"],
											values = LSM:HashTable("font"),
											get = function() return statusbars.castBar.nametext.font.name end,
											set = function(self,value)
												statusbars.castBar.nametext.font.name = value
												CheckRestorationDefaultValues(res_options,'Cast','castBar')
											end,
										},
										fontSize = {
											order = 3,
											type = "range",
											name = FONT_SIZE,
											desc = L["TOOLTIP_COOLDOWN_FONT_SIZE"],
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
											order = 4,
											type = "select",
											name = L["LABEL_FONT_OUTLINE"],
											desc = L["TOOLTIP_FONT_OUTLINE"],
											get = function()
												return statusbars.castBar.nametext.font.flag
											end,
											set = function(self,value)
												statusbars.castBar.nametext.font.flag = value
												CheckRestorationDefaultValues(res_options,'Cast','castBar')
											end,
											values = FONT_OUTLINES,
										},
										nametextAnchor = {
											order = 5,
											type = "select",
											name = L["LABEL_FONT_ANCHOR"],
											desc = L["TOOLTIP_FONT_ANCHOR_POINT"],
											get = function()
												return statusbars.castBar.nametext.justify
											end,
											set = function(self,value)
												statusbars.castBar.nametext.justify = value
												CheckRestorationDefaultValues(res_options,'Cast','castBar')
											end,
											values = FRAME_ANCHOR_OPTIONS,
										},
										nametextX = {
											order = 6,
											type = "range",
											name = "X",
											desc = L["TOOLTIP_FONT_X_OFFSET"],
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
											order = 7,
											type = "range",
											name = "Y",
											desc = L["TOOLTIP_FONT_Y_OFFSET"],
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
											name = '|cFFFFFFFF'..L["LABEL_FONT_SHADOW"]..'|r',
											type = "group",
											order = 8,
											hidden = false,
											guiInline = true,
											args = {
												shadowToggle = {
													order = 1,
													name = L["TOGGLE"],
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
													name = L["LABEL_FONT_SHADOW_COLOR"],
													desc = L["TOOLTIP_FONT_SHADOW_COLOR"],
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
												shadowX = {
													order = 3,
													type = "range",
													name = "X",
													desc = L["TOOLTIP_FONT_SHADOW_X_OFFSET"],
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
													order = 4,
													type = "range",
													name = "Y",
													desc = L["TOOLTIP_FONT_SHADOW_Y_OFFSET"],
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
									name = '|cFFFFFFFF'..L["LABEL_TIME_TEXT"]..'|r',
									type = "group",
									order = 7,
									disabled = true,
									guiInline = true,
									args = {
										color = {
											type = "color",
											order = 1,
											name = L["LABEL_FONT_COLOR"],
											desc = L["TOOLTIP_FONT_COLOR"],
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
											width = "full",
										},
										timeFontName = {
											order = 2,
											type = "select",
											dialogControl = "LSM30_Font",
											name = L["LABEL_FONT"],
											desc = L["TOOLTIP_FONT_NAME"],
											values = LSM:HashTable("font"),
											get = function() return statusbars.castBar.timetext.font.name end,
											set = function(self,value)
												statusbars.castBar.timetext.font.name = value
												CheckRestorationDefaultValues(res_options,'Cast','castBar')
											end,
										},
										timeFontSize = {
											order = 3,
											type = "range",
											name = FONT_SIZE,
											desc = L["TOOLTIP_COOLDOWN_FONT_SIZE"],
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
											order = 4,
											type = "select",
											name = L["LABEL_FONT_OUTLINE"],
											desc = L["TOOLTIP_FONT_OUTLINE"],
											get = function()
												return statusbars.castBar.timetext.font.flag
											end,
											set = function(self,value)
												statusbars.castBar.timetext.font.flag = value
												CheckRestorationDefaultValues(res_options,'Cast','castBar')
											end,
											values = FONT_OUTLINES,
										},
										timeTextAnchor = {
											order = 5,
											type = "select",
											name = L["LABEL_FONT_ANCHOR"],
											desc = L["TOOLTIP_FONT_ANCHOR_POINT"],
											get = function()
												return statusbars.castBar.timetext.justify
											end,
											set = function(self,value)
												statusbars.castBar.timetext.justify = value
												CheckRestorationDefaultValues(res_options,'Cast','castBar')
											end,
											values = FRAME_ANCHOR_OPTIONS,
										},
										timeTextX = {
											order = 6,
											type = "range",
											name = "X",
											desc = L["TOOLTIP_FONT_X_OFFSET"],
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
											order = 7,
											type = "range",
											name = "Y",
											desc = L["TOOLTIP_FONT_Y_OFFSET"],
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
											name = '|cFFFFFFFF'..L["LABEL_FONT_SHADOW"]..'|r',
											type = "group",
											order = 8,
											hidden = false,
											guiInline = true,
											args = {
												shadowToggle = {
													order = 1,
													name = L["TOGGLE"],
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
													name = L["LABEL_FONT_SHADOW_COLOR"],
													desc = L["TOOLTIP_FONT_SHADOW_COLOR"],
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
												shadowX = {
													order = 3,
													type = "range",
													name = "X",
													desc = L["TOOLTIP_FONT_SHADOW_X_OFFSET"],
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
													order = 4,
													type = "range",
													name = "Y",
													desc = L["TOOLTIP_FONT_SHADOW_Y_OFFSET"],
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
									name = L["LABEL_LAYOUT_DESIGN"],
									type = "group",
									order = 8,
									guiInline = true,
									args = {
										texture = {
											order = 1,
											type = "select",
											name = L["LABEL_STATUSBAR_TEXTURE"],
											desc = L["TOOLTIP_STATUSBAR_TEXTURE"],
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
											name = L["LABEL_STATUSBAR_COLOR"],
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
											width = "double",
										},
										backgroundTexture = {
											order = 3,
											type = "select",
											name = L["LABEL_STATUSBAR_BG_TEXTURE"],
											desc = L["TOOLTIP_STATUSBAR_BG_TEXTURE"],
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
											order = 4,
											name = L["LABEL_STATUSBAR_BG_COLOR"],
											desc = L["TOOLTIP_STATUSBAR_BG_COLOR"],
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
											order = 5,
											name = L["LABEL_STATUSBAR_MODIFY_BACKGROUND"],
											desc = L["TOOLTIP_TOGGLE_STATUSBAR_BG_CUSTOMIZATON"],
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
											order = 6,
											type = "range",
											name = L["LABEL_WIDTH"],
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
											order = 7,
											type = "range",
											name = L["LABEL_HEIGHT"],
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
									name = L["BUTTON_RESET_STATUSBAR_CAST"],
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
										res_options.args.bars.args.castBar.args.reset.disabled = true
										res_options.args.bars.args.castBar.args.reset.name = "|cFF666666"..L["BUTTON_RESET_STATUSBAR_CAST"].."|r"
										CheckRestorationDefaultValues(res_options,'Cast','castBar')
										
										if (not bar.adjust.isEnabled) then
											Auras:InitializeProgressBar('CastBar3',nil,'castBar','nametext','timetext',3)
										end
									end,
								},
							},
						},
						channelBar = {
							name = L["LABEL_STATUSBAR_CHANNEL"],
							order = 4,
							inline = false,
							type = "group",
							args = {
								adjust = {
									order = 1,
									name = L["LABEL_STATUSBAR_MODIFY_CHANNEL"],
									desc = L["TOOLTIP_TOGGLE_STATUSBAR_CUSTOMIZATON"],
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
									name = L["TOGGLE_SPELL_TEXT"],
									desc = L["TOOLTIP_TOGGLE_SPELL_TEXT"],
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
									name = L["TOGGLE_TIME_TEXT"],
									desc = L["TOOLTIP_TOGGLE_TIME_TEXT"],
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
									name = "|cFFFFFFFF"..SETTINGS.."|r",
									order = 4,
									type = "group",
									guiInline = true,
									args = {
										alphaCombat = {
											order = 1,
											type = "range",
											name = L["LABEL_ALPHA_COMBAT"],
											desc = L["TOOLTIP_STATUSBAR_ALPHA_COMBAT"],
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
											name = L["LABEL_ALPHA_NO_COMBAT"],
											desc = L["TOOLTIP_STATUSBAR_ALPHA_NO_COMBAT"],
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
									name = '|cFFFFFFFF'..L["LABEL_ICON_SPARK"]..'|r',
									type = "group",
									order = 5,
									disabled = true,
									guiInline = true,
									args = {
										sparkToggle = {
											order = 1,
											name = L["TOGGLE_SPARK"],
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
											name = L["TOGGLE_ICON"],
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
											name = L["LABEL_ICON_JUSTIFY"],
											desc = L["TOOLTIP_STATUSBAR_ICON_LOCATION"],
											get = function()
												return statusbars.channelBar.icon.justify
											end,
											set = function(self,value)
												statusbars.channelBar.icon.justify = value
												CheckRestorationDefaultValues(res_options,'Channel','channelBar')
											end,
											values = ICON_JUSTIFY,
										},
									},
								},
								nametext = {
									name = '|cFFFFFFFF'..L["LABEL_TEXT_SPELL"]..'|r',
									type = "group",
									order = 6,
									disabled = true,
									guiInline = true,
									args = {
										color = {
											type = "color",
											order = 1,
											name = L["LABEL_FONT_COLOR"],
											desc = L["TOOLTIP_FONT_COLOR"],
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
											width = "full",
										},
										fontName = {
											order = 2,
											type = "select",
											dialogControl = "LSM30_Font",
											name = L["LABEL_FONT"],
											desc = L["TOOLTIP_FONT_NAME"],
											values = LSM:HashTable("font"),
											get = function() return statusbars.channelBar.nametext.font.name end,
											set = function(self,value)
												statusbars.channelBar.nametext.font.name = value
												CheckRestorationDefaultValues(res_options,'Channel','channelBar')
											end,
										},
										fontSize = {
											order = 3,
											type = "range",
											name = FONT_SIZE,
											desc = L["TOOLTIP_COOLDOWN_FONT_SIZE"],
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
											order = 4,
											type = "select",
											name = L["LABEL_FONT_OUTLINE"],
											desc = L["TOOLTIP_FONT_OUTLINE"],
											get = function()
												return statusbars.channelBar.nametext.font.flag
											end,
											set = function(self,value)
												statusbars.channelBar.nametext.font.flag = value
												CheckRestorationDefaultValues(res_options,'Channel','channelBar')
											end,
											values = FONT_OUTLINES,
										},
										nametextAnchor = {
											order = 5,
											type = "select",
											name = L["LABEL_FONT_ANCHOR"],
											desc = L["TOOLTIP_FONT_ANCHOR_POINT"],
											get = function()
												return statusbars.channelBar.nametext.justify
											end,
											set = function(self,value)
												statusbars.channelBar.nametext.justify = value
												CheckRestorationDefaultValues(res_options,'Channel','channelBar')
											end,
											values = FRAME_ANCHOR_OPTIONS,
										},
										nametextX = {
											order = 6,
											type = "range",
											name = "X",
											desc = L["TOOLTIP_FONT_X_OFFSET"],
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
											order = 7,
											type = "range",
											name = "Y",
											desc = L["TOOLTIP_FONT_Y_OFFSET"],
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
											name = '|cFFFFFFFF'..L["LABEL_FONT_SHADOW"]..'|r',
											type = "group",
											order = 8,
											hidden = false,
											guiInline = true,
											args = {
												shadowToggle = {
													order = 1,
													name = L["TOGGLE"],
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
													name = L["LABEL_FONT_SHADOW_COLOR"],
													desc = L["TOOLTIP_FONT_SHADOW_COLOR"],
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
												shadowX = {
													order = 3,
													type = "range",
													name = "X",
													desc = L["TOOLTIP_FONT_SHADOW_X_OFFSET"],
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
													order = 4,
													type = "range",
													name = "Y",
													desc = L["TOOLTIP_FONT_SHADOW_Y_OFFSET"],
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
									name = '|cFFFFFFFF'..L["LABEL_TIME_TEXT"]..'|r',
									type = "group",
									order = 7,
									disabled = true,
									guiInline = true,
									args = {
										color = {
											type = "color",
											order = 1,
											name = L["LABEL_FONT_COLOR"],
											desc = L["TOOLTIP_FONT_COLOR"],
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
											width = "full",
										},
										timeFontName = {
											order = 2,
											type = "select",
											dialogControl = "LSM30_Font",
											name = L["LABEL_FONT"],
											desc = L["TOOLTIP_FONT_NAME"],
											values = LSM:HashTable("font"),
											get = function() return statusbars.channelBar.timetext.font.name end,
											set = function(self,value)
												statusbars.channelBar.timetext.font.name = value
												CheckRestorationDefaultValues(res_options,'Channel','channelBar')
											end,
										},
										timeFontSize = {
											order = 3,
											type = "range",
											name = FONT_SIZE,
											desc = L["TOOLTIP_COOLDOWN_FONT_SIZE"],
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
											order = 4,
											type = "select",
											name = L["LABEL_FONT_OUTLINE"],
											desc = L["TOOLTIP_FONT_OUTLINE"],
											get = function()
												return statusbars.channelBar.timetext.font.flag
											end,
											set = function(self,value)
												statusbars.channelBar.timetext.font.flag = value
												CheckRestorationDefaultValues(res_options,'Channel','channelBar')
											end,
											values = FONT_OUTLINES,
										},
										timeTextAnchor = {
											order = 5,
											type = "select",
											name = L["LABEL_FONT_ANCHOR"],
											desc = L["TOOLTIP_FONT_ANCHOR_POINT"],
											get = function()
												return statusbars.channelBar.timetext.justify
											end,
											set = function(self,value)
												statusbars.channelBar.timetext.justify = value
												CheckRestorationDefaultValues(res_options,'Channel','channelBar')
											end,
											values = FRAME_ANCHOR_OPTIONS,
										},
										timeTextX = {
											order = 6,
											type = "range",
											name = "X",
											desc = L["TOOLTIP_FONT_X_OFFSET"],
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
											order = 7,
											type = "range",
											name = "Y",
											desc = L["TOOLTIP_FONT_Y_OFFSET"],
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
											name = '|cFFFFFFFF'..L["LABEL_FONT_SHADOW"]..'|r',
											type = "group",
											order = 8,
											hidden = false,
											guiInline = true,
											args = {
												shadowToggle = {
													order = 1,
													name = L["TOGGLE"],
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
													name = L["LABEL_FONT_SHADOW_COLOR"],
													desc = L["TOOLTIP_FONT_SHADOW_COLOR"],
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
												shadowX = {
													order = 3,
													type = "range",
													name = "X",
													desc = L["TOOLTIP_FONT_SHADOW_X_OFFSET"],
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
													order = 4,
													type = "range",
													name = "Y",
													desc = L["TOOLTIP_FONT_SHADOW_Y_OFFSET"],
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
									name = L["LABEL_LAYOUT_DESIGN"],
									type = "group",
									order = 8,
									guiInline = true,
									args = {
										texture = {
											order = 1,
											type = "select",
											name = L["LABEL_STATUSBAR_TEXTURE"],
											desc = L["TOOLTIP_STATUSBAR_TEXTURE"],
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
											name = L["LABEL_STATUSBAR_COLOR"],
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
											width = "double",
										},
										backgroundTexture = {
											order = 3,
											type = "select",
											name = L["LABEL_STATUSBAR_BG_TEXTURE"],
											desc = L["TOOLTIP_STATUSBAR_BG_TEXTURE"],
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
											order = 4,
											name = L["LABEL_STATUSBAR_BG_COLOR"],
											desc = L["TOOLTIP_STATUSBAR_BG_COLOR"],
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
											order = 5,
											name = L["LABEL_STATUSBAR_MODIFY_BACKGROUND"],
											desc = L["TOOLTIP_TOGGLE_STATUSBAR_BG_CUSTOMIZATON"],
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
											order = 6,
											type = "range",
											name = L["LABEL_WIDTH"],
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
											order = 7,
											type = "range",
											name = L["LABEL_HEIGHT"],
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
									name = L["BUTTON_RESET_STATUSBAR_CHANNEL"],
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
										res_options.args.bars.args.channelBar.args.reset.disabled = true
										res_options.args.bars.args.channelBar.args.reset.name = "|cFF666666"..L["BUTTON_RESET_STATUSBAR_CHANNEL"].."|r"
										CheckRestorationDefaultValues(res_options,'Channel','channelBar')
										
										if (not bar.adjust.isEnabled) then
											Auras:InitializeProgressBar('ChannelBar3',nil,'channelBar','nametext','timetext',3)
										end
									end,
								},
							},
						},
						earthenShieldBar = {
							name = L["LABEL_STATUSBAR_EARTHEN_SHIELD"],
							type = "group",
							order = 5,
							inline = false,
							args = {
								adjust = {
									order = 1,
									name = L["LABEL_STATUSBAR_MODIFY_EARTHEN_SHIELD"],
									desc = L["TOOLTIP_TOGGLE_STATUSBAR_CUSTOMIZATON"],
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
									name = L["TOGGLE_HEALTH_TEXT"],
									desc = L["TOOLTIP_TOGGLE_HEALTH_TEXT"],
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
									name = L["TOGGLE_TIME_TEXT"],
									desc = L["TOOLTIP_TOGGLE_TIME_TEXT"],
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
									name = "|cFFFFFFFF"..SETTINGS.."|r",
									order = 4,
									type = "group",
									guiInline = true,
									args = {
										alphaCombat = {
											order = 1,
											type = "range",
											name = L["LABEL_ALPHA_COMBAT"],
											desc = L["TOOLTIP_STATUSBAR_ALPHA_COMBAT"],
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
											name = L["LABEL_ALPHA_NO_TARGET_NO_COMBAT"],
											desc = L["TOOLTIP_STATUSBAR_ALPHA_NO_COMBAT"],
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
											name = L["LABEL_ALPHA_TARGET_NO_COMBAT"],
											desc = L["TOOLTIP_STATUSBAR_ALPHA_TARGET_NO_COMBAT"],
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
									name = '|cFFFFFFFF'..L["LABEL_TEXT_HEALTH"]..'|r',
									type = "group",
									order = 5,
									disabled = true,
									guiInline = true,
									args = {
										color = {
											type = "color",
											order = 1,
											name = L["LABEL_FONT_COLOR"],
											desc = L["TOOLTIP_FONT_COLOR"],
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
											width = "full",
										},
										fontName = {
											order = 2,
											type = "select",
											dialogControl = "LSM30_Font",
											name = L["LABEL_FONT"],
											desc = L["TOOLTIP_FONT_NAME"],
											values = LSM:HashTable("font"),
											get = function() return statusbars.earthenShieldBar.healthtext.font.name end,
											set = function(self,value)
												statusbars.earthenShieldBar.healthtext.font.name = value
												CheckRestorationDefaultValues(res_options,'Earthen Shield')
											end,
										},
										fontSize = {
											order = 3,
											type = "range",
											name = FONT_SIZE,
											desc = L["TOOLTIP_COOLDOWN_FONT_SIZE"],
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
											order = 4,
											type = "select",
											name = L["LABEL_FONT_OUTLINE"],
											desc = L["TOOLTIP_FONT_OUTLINE"],
											get = function()
												return statusbars.earthenShieldBar.healthtext.font.flag
											end,
											set = function(self,value)
												statusbars.earthenShieldBar.healthtext.font.flag = value
												CheckRestorationDefaultValues(res_options,'Earthen Shield')
											end,
											values = FONT_OUTLINES,
										},
										healthtextAnchor = {
											order = 5,
											type = "select",
											name = L["LABEL_FONT_ANCHOR"],
											desc = L["TOOLTIP_FONT_ANCHOR_POINT"],
											get = function()
												return statusbars.earthenShieldBar.healthtext.justify
											end,
											set = function(self,value)
												statusbars.earthenShieldBar.healthtext.justify = value
												CheckRestorationDefaultValues(res_options,'Earthen Shield')
											end,
											values = FRAME_ANCHOR_OPTIONS,
										},
										healthtextX = {
											order = 6,
											type = "range",
											name = "X",
											desc = L["TOOLTIP_FONT_X_OFFSET"],
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
											order = 7,
											type = "range",
											name = "Y",
											desc = L["TOOLTIP_FONT_Y_OFFSET"],
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
											name = '|cFFFFFFFF'..L["LABEL_FONT_SHADOW"]..'|r',
											type = "group",
											order = 8,
											hidden = false,
											guiInline = true,
											args = {
												shadowToggle = {
													order = 1,
													name = L["TOGGLE"],
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
													name = L["LABEL_FONT_SHADOW_COLOR"],
													desc = L["TOOLTIP_FONT_SHADOW_COLOR"],
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
												shadowX = {
													order = 3,
													type = "range",
													name = "X",
													desc = L["TOOLTIP_FONT_SHADOW_X_OFFSET"],
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
													order = 4,
													type = "range",
													name = "Y",
													desc = L["TOOLTIP_FONT_SHADOW_Y_OFFSET"],
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
									name = '|cFFFFFFFF'..L["LABEL_TIME_TEXT"]..'|r',
									type = "group",
									order = 6,
									disabled = true,
									guiInline = true,
									args = {
										color = {
											type = "color",
											order = 1,
											name = L["LABEL_FONT_COLOR"],
											desc = L["TOOLTIP_FONT_COLOR"],
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
											width = "full",
										},
										timeFontName = {
											order = 2,
											type = "select",
											dialogControl = "LSM30_Font",
											name = L["LABEL_FONT"],
											desc = L["TOOLTIP_FONT_NAME"],
											values = LSM:HashTable("font"),
											get = function() return statusbars.earthenShieldBar.timetext.font.name end,
											set = function(self,value)
												statusbars.earthenShieldBar.timetext.font.name = value
												CheckRestorationDefaultValues(res_options,'Earthen Shield')
											end,
										},
										timeFontSize = {
											order = 3,
											type = "range",
											name = FONT_SIZE,
											desc = L["TOOLTIP_COOLDOWN_FONT_SIZE"],
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
											order = 4,
											type = "select",
											name = L["LABEL_FONT_OUTLINE"],
											desc = L["TOOLTIP_FONT_OUTLINE"],
											get = function()
												return statusbars.earthenShieldBar.timetext.font.flag
											end,
											set = function(self,value)
												statusbars.earthenShieldBar.timetext.font.flag = value
												CheckRestorationDefaultValues(res_options,'Earthen Shield')
											end,
											values = FONT_OUTLINES,
										},
										timeTextAnchor = {
											order = 5,
											type = "select",
											name = L["LABEL_FONT_ANCHOR"],
											desc = L["TOOLTIP_FONT_ANCHOR_POINT"],
											get = function()
												return statusbars.earthenShieldBar.timetext.justify
											end,
											set = function(self,value)
												statusbars.earthenShieldBar.timetext.justify = value
												CheckRestorationDefaultValues(res_options,'Earthen Shield')
											end,
											values = FRAME_ANCHOR_OPTIONS,
										},
										timeTextX = {
											order = 6,
											type = "range",
											name = "X",
											desc = L["TOOLTIP_FONT_X_OFFSET"],
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
											order = 7,
											type = "range",
											name = "Y",
											desc = L["TOOLTIP_FONT_Y_OFFSET"],
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
											name = '|cFFFFFFFF'..L["LABEL_FONT_SHADOW"]..'|r',
											type = "group",
											order = 8,
											hidden = false,
											guiInline = true,
											args = {
												shadowToggle = {
													order = 1,
													name = L["TOGGLE"],
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
													name = L["LABEL_FONT_SHADOW_COLOR"],
													desc = L["TOOLTIP_FONT_SHADOW_COLOR"],
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
												shadowX = {
													order = 3,
													type = "range",
													name = "X",
													desc = L["TOOLTIP_FONT_SHADOW_X_OFFSET"],
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
													order = 4,
													type = "range",
													name = "Y",
													desc = L["TOOLTIP_FONT_SHADOW_Y_OFFSET"],
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
									name = L["LABEL_LAYOUT_DESIGN"],
									type = "group",
									order = 7,
									guiInline = true,
									args = {
										texture = {
											order = 1,
											type = "select",
											name = L["LABEL_STATUSBAR_TEXTURE"],
											desc = L["TOOLTIP_STATUSBAR_TEXTURE"],
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
											name = L["LABEL_STATUSBAR_COLOR"],
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
											width = "double",
										},
										timerTexture = {
											order = 3,
											type = "select",
											name = L["LABEL_TIME_BAR_TEXTURE"],
											desc = L["TOOLTIP_STATUSBAR_TEXTURE"],
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
											order = 4,
											name = L["LABEL_STATUSBAR_COLOR"],
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
											order = 5,
											name = L["LABEL_STATUSBAR_MODIFY_TIMER"],
											desc = L["TOOLTIP_TOGGLE_STATUSBAR_CUSTOMIZATON"],
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
											order = 6,
											type = "select",
											name = L["LABEL_STATUSBAR_BG_TEXTURE"],
											desc = L["TOOLTIP_STATUSBAR_BG_TEXTURE"],
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
											order = 7,
											name = "BG Color",
											desc = L["TOOLTIP_STATUSBAR_BG_COLOR"],
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
											order = 8,
											name = L["LABEL_STATUSBAR_MODIFY_BACKGROUND"],
											desc = L["TOOLTIP_TOGGLE_STATUSBAR_BG_CUSTOMIZATON"],
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
											order = 9,
											type = "range",
											name = L["LABEL_WIDTH"],
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
											order = 10,
											type = "range",
											name = L["LABEL_HEIGHT"],
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
									name = L["BUTTON_RESET_STATUSBAR_EARTHEN_SHIELD"],
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
										res_options.args.bars.args.earthenShieldBar.args.reset.disabled = true
										res_options.args.bars.args.earthenShieldBar.args.reset.name = "|cFF666666"..L["BUTTON_RESET_STATUSBAR_EARTHEN_SHIELD"].."|r"
										CheckRestorationDefaultValues(res_options,'Earthen Shield')
										
										if (not bar.adjust.isEnabled) then
											Auras:InitializeProgressBar('EarthenShieldTotemBar','Timer','earthenShieldBar','healthtext','timetext',3)
										end
									end,
								},
							},
						},
						tidalWavesBar = {
							name = L["LABEL_TIDAL_WAVES_BAR"],
							type = "group",
							order = 6,
							inline = false,
							args = {
								adjust = {
									order = 1,
									name = L["LABEL_STATUSBAR_MODIFY_TIDAL_WAVES"],
									desc = L["TOOLTIP_TOGGLE_STATUSBAR_CUSTOMIZATON"],
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
									name = "|cFFFFFFFF"..SETTINGS.."|r",
									order = 2,
									type = "group",
									guiInline = true,
									args = {
										animate = {
											order = 1,
											type = "toggle",
											name = L["LABEL_STATUSBAR_TIDAL_WAVES_ANIMATE"],
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
											name = L["LABEL_STATUSBAR_TIDAL_WAVES_EMPTY"],
											desc = L["TOOLTIP_STATUSBAR_TIDAL_WAVES_EMPTY"],
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
											width = "double",
										},
										combatDisplay = {
											order = 3,
											type = "select",
											name = L["LABEL_TIDAL_WAVES_DISPLAY_COMBAT"],
											desc = L["TOOLTIP_TIDAL_WAVES_DISPLAY_METHOD_COMBAT"],
											get = function()
												return statusbars.tidalWavesBar.combatDisplay
											end,
											set = function(self,value)
												statusbars.tidalWavesBar.combatDisplay = value
												CheckRestorationDefaultValues(res_options,"Tidal Waves")
											end,
											values = TIDAL_WAVES_OPTIONS,
										},
										OoCDisplay = {
											order = 4,
											type = "select",
											name = L["LABEL_TIDAL_WAVES_DISPLAY_NO_COMBAT"],
											desc = L["TOOLTIP_TIDAL_WAVES_DISPLAY_METHOD_NO_COMBAT"],
											get = function()
												return statusbars.tidalWavesBar.OoCDisplay
											end,
											set = function(self,value)
												statusbars.tidalWavesBar.OoCDisplay = value
												CheckRestorationDefaultValues(res_options,"Tidal Waves")
											end,
											values = TIDAL_WAVES_OPTIONS,
										},
										OoCTime = {
											order = 5,
											type = "range",
											name = L["LABEL_TIDAL_WAVES_DURATION_NO_COMBAT"],
											desc = L["TOOLTIP_TIDAL_WAVES_TIMER_NO_TARGET_NO_COMBAT"],
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
									name = L["LABEL_LAYOUT_DESIGN"],
									type = "group",
									order = 3,
									guiInline = true,
									args = {
										texture = {
											order = 1,
											type = "select",
											name = L["LABEL_STATUSBAR_TEXTURE"],
											desc = L["TOOLTIP_STATUSBAR_TEXTURE"],
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
											name = L["LABEL_STATUSBAR_COLOR"],
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
											width = "double",
										},
										backgroundTexture = {
											order = 3,
											type = "select",
											name = L["LABEL_STATUSBAR_BG_TEXTURE"],
											desc = L["TOOLTIP_STATUSBAR_BG_TEXTURE"],
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
											order = 4,
											name = L["LABEL_STATUSBAR_BG_COLOR"],
											desc = L["TOOLTIP_STATUSBAR_BG_COLOR"],
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
											order = 5,
											name = L["LABEL_STATUSBAR_MODIFY_BACKGROUND"],
											desc = L["TOOLTIP_TOGGLE_STATUSBAR_BG_CUSTOMIZATON"],
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
											order = 6,
											type = "range",
											name = L["LABEL_WIDTH"],
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
											order = 7,
											type = "range",
											name = L["LABEL_HEIGHT"],
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
									name = L["BUTTON_RESET_STATUSBAR_TIDAL_WAVES"],
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
										
										res_options.args.bars.args.tidalWavesBar.args.reset.disabled = true
										res_options.args.bars.args.tidalWavesBar.args.reset.name = "|cFF666666"..L["BUTTON_RESET_STATUSBAR_TIDAL_WAVES"].."|r"
									end,
								},
							},
						},
					},
				},
				cooldowns = {
					name = L["LABEL_COOLDOWN"],
					order = 5,
					type = "group",
					childGroups = "tab",
					disabled = true,
					args = {
						toggle = {
							order = 1,
							name = ENABLE,
							desc = L["TOOLTIP_TOGGLE_COOLDOWN_TEXT"],
							type = "toggle",
							get = function()
								return cooldowns.isEnabled
							end,
							set = function(self,value)
								cooldowns.isEnabled = value
								CheckRestorationDefaultValues(res_options,'Cooldowns')
							end,
							width = "full",
						},
						text = {
							order = 2,
							name = L["LABEL_COOLDOWN_TEXT"],
							desc = L["TOOLTIP_TOGGLE_COOLDOWN_TEXT"],
							type = "toggle",
							get = function()
								return cooldowns.text
							end,
							set = function(self,value)
								cooldowns.text = value
							end,
						},
						sweep = {
							order = 3,
							name = L["LABEL_COOLDOWN_SWEEP"],
							desc = L["TOOLTIP_TOGGLE_COOLDOWN_SWEEP"],
							type = "toggle",
							get = function()
								return cooldowns.sweep
							end,
							set = function(self,value)
								cooldowns.sweep = value
								Auras:InitializeCooldowns('AuraGroup3',3)
								CheckRestorationDefaultValues(res_options,'Cooldowns')
							end,
							width = "double",
						},
						GCD = {
							order = 4,
							name = L["LABEL_COOLDOWN_GCD"],
							desc = L["TOOLTIP_TOGGLE_COOLDOWN_GCD"],
							type = "toggle",
							get = function()
								return cooldowns.GCD.isEnabled
							end,
							set = function(self,value)
								cooldowns.GCD.isEnabled = value
							end,
						},
						inverse = {
							order = 5,
							name = L["LABEL_COOLDOWN_REVERSE_SWEEP"],
							desc = L["TOOLTIP_COOLDOWN_REVERSE_SWEEP"],
							type = "toggle",
							get = function()
								return cooldowns.inverse
							end,
							set = function(self,value)
								cooldowns.inverse = value
								Auras:InitializeCooldowns('AuraGroup3',3)
							end,
						},
						bling = {
							order = 6,
							name = L["LABEL_COOLDOWN_BLING"],
							desc = L["TOOLTIP_TOGGLE_COOLDOWN_BLING"],
							type = "toggle",
							get = function()
								return cooldowns.bling
							end,
							set = function(self,value)
								cooldowns.bling = value
								Auras:InitializeCooldowns('AuraGroup3',3)
							end,
						},
						group = {
							order = 7,
							type = "select",
							name = L["LABEL_COOLDOWN_GROUP"],
							desc = L["TOOLTIP_AURAS_GROUP_SELECT"],
							get = function()
								return cooldowns.selected
							end,
							set = function(self,value)
								cooldowns.selected = value
								CheckRestorationDefaultValues(res_options,'Cooldowns')
							end,
							values = COOLDOWN_OPTIONS,
						},
						adjustToggle = {
							order = 8,
							name = L["LABEL_COOLDOWN_ADJUST"],
							desc = '',
							type = "toggle",
							get = function()
								return cooldowns.adjust
							end,
							set = function(self,value)
								cooldowns.adjust = value
								CheckRestorationDefaultValues(res_options,'Cooldowns')
							end,
						},
						p1_formatting = {
							name = FORMATTING,
							type = "group",
							order = 9,
							guiInline = true,
							args = {
								alertToggle = {
									order = 1,
									name = L["LABEL_ALERT"],
									desc = L["TOOLTIP_ALERT"],
									type = "toggle",
									get = function()
										return cooldowns.primary[1].text.formatting.alert.isEnabled
									end,
									set = function(self,value)
										cooldowns.primary[1].text.formatting.alert.isEnabled = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
									width = "double",
								},
								copy = {
									order = 2,
									type = "select",
									name = L["LABEL_COOLDOWN_COPY_FROM"],
									desc = L["TOOLTIP_COOLDOWN_COPY_FROM"],
									get = function()
										return ''
									end,
									set = function(self,value)
										CopyCooldownFormatting(value,3,'primary',1)
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
									values = {
										["primary;2"] = PRIMARY.." #2",
										["primary;3"] = PRIMARY.." #3",
										["secondary;1"] = SECONDARY.." #1",
										["secondary;2"] = SECONDARY.." #2",
									},
								},
								alertFlash = {
									order = 3,
									name = L["LABEL_ALERT_ANIMATE"],
									desc = L["TOOLTIP_ALERT_ANIMATE"],
									type = "toggle",
									get = function()
										return cooldowns.primary[1].text.formatting.alert.animate
									end,
									set = function(self,value)
										cooldowns.primary[1].text.formatting.alert.animate = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
								alertColor = {
									type = "color",
									order = 4,
									name = L["LABEL_ALERT_COLOR"],
									desc = L["TOOLTIP_ALERT_COLOR"],
									hasAlpha = true,
									get = function(info)
										local color = cooldowns.primary[1].text.formatting.alert.color
										return color.r, color.g, color.b, color.a
									end,
									set = function(info, r, g, b, a)
										local color = cooldowns.primary[1].text.formatting.alert.color
										
										color.r = tonumber(string.format("%.2f",r))
										color.g = tonumber(string.format("%.2f",g))
										color.b = tonumber(string.format("%.2f",b))
										color.a = tonumber(string.format("%.2f",a))
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
								alertThreshold = {
									order = 5,
									type = "range",
									name = L["LABEL_ALERT_THRESHOLD"],
									desc = L["TOOLTIP_ALERT_THRESHOLD"],
									min = 3,
									max = 10,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.primary[1].text.formatting.alert.threshold end,
									set = function(self,value)
										cooldowns.primary[1].text.formatting.alert.threshold = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
								decimals = {
									order = 6,
									name = L["LABEL_DECIMALS"],
									desc = L["TOOLTIP_DECIMALS"],
									type = "toggle",
									get = function()
										return cooldowns.primary[1].text.formatting.decimals
									end,
									set = function(self,value)
										cooldowns.primary[1].text.formatting.decimals = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
								format = {
									order = 7,
									type = "select",
									name = L["LABEL_MINUTE_FORMAT"],
									desc = L["TOOLTIP_MINUTE_FORMAT"],
									get = function()
										return cooldowns.primary[1].text.formatting.length
									end,
									set = function(self,value)
										--cooldowns.primary[1].text.justify = value
										--CheckRestorationDefaultValues(res_options,'Cooldowns')
										cooldowns.primary[1].text.formatting.length = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
									values = TIME_FORMATS,
								},
							},
						},
						p1_adjustGroup = {
							name = L["LABEL_COOLDOWN_SETTINGS"],
							type = "group",
							order = 10,
							guiInline = true,
							args = {
								color = {
									type = "color",
									order = 1,
									name = L["LABEL_FONT_COLOR"],
									desc = L["TOOLTIP_FONT_COLOR"],
									hasAlpha = true,
									get = function(info)
										local color = cooldowns.primary[1].text.font.color
										return color.r, color.g, color.b, color.a
									end,
									set = function(info, r, g, b, a)
										local color = cooldowns.primary[1].text.font.color
										
										color.r = tonumber(string.format("%.2f",r))
										color.g = tonumber(string.format("%.2f",g))
										color.b = tonumber(string.format("%.2f",b))
										color.a = tonumber(string.format("%.2f",a))
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
									width = "double",
								},
								copy = {
									order = 3,
									type = "select",
									name = L["LABEL_COOLDOWN_COPY_FROM"],
									desc = L["TOOLTIP_COOLDOWN_COPY_FROM"],
									get = function()
										return ''
									end,
									set = function(self,value)
										--cooldowns.primary[1].text.justify = value
										--CheckRestorationDefaultValues(res_options,'Cooldowns')
										CopyCooldownOptions(value,3,'primary',1)
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
									values = {
										["primary;2"] = PRIMARY.." #2",
										["primary;3"] = PRIMARY.." #3",
										["secondary;1"] = SECONDARY.." #1",
										["secondary;2"] = SECONDARY.." #2",
									},
								},
								fontName = {
									order = 4,
									type = "select",
									dialogControl = "LSM30_Font",
									name = L["LABEL_FONT"],
									desc = L["TOOLTIP_FONT_NAME"],
									values = LSM:HashTable("font"),
									get = function() return cooldowns.primary[1].text.font.name end,
									set = function(self,value)
										cooldowns.primary[1].text.font.name = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
								fontSize = {
									order = 5,
									type = "range",
									name = FONT_SIZE,
									desc = L["TOOLTIP_COOLDOWN_FONT_SIZE"],
									min = 5,
									max = 40,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.primary[1].text.font.size end,
									set = function(self,value)
										cooldowns.primary[1].text.font.size = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
								fontOutline = {
									order = 6,
									type = "select",
									name = L["LABEL_FONT_OUTLINE"],
									desc = L["TOOLTIP_FONT_OUTLINE"],
									get = function()
										return cooldowns.primary[1].text.font.flag
									end,
									set = function(self,value)
										cooldowns.primary[1].text.font.flag = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
									values = FONT_OUTLINES,
								},
								textAnchor = {
									order = 7,
									type = "select",
									name = L["LABEL_FONT_ANCHOR"],
									desc = L["TOOLTIP_FONT_ANCHOR_POINT"],
									get = function()
										return cooldowns.primary[1].text.justify
									end,
									set = function(self,value)
										cooldowns.primary[1].text.justify = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
									values = FRAME_ANCHOR_OPTIONS,
								},
								textX = {
									order = 8,
									type = "range",
									name = "X",
									desc = L["TOOLTIP_FONT_X_OFFSET"],
									min = -100,
									max = 100,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.primary[1].text.x end,
									set = function(self,value)
										cooldowns.primary[1].text.x = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
								textY = {
									order = 9,
									type = "range",
									name = "Y",
									desc = L["TOOLTIP_FONT_Y_OFFSET"],
									min = -100,
									max = 100,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.primary[1].text.y end,
									set = function(self,value)
										cooldowns.primary[1].text.y = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
								shadow = {
									name = '|cFFFFFFFF'..L["LABEL_FONT_SHADOW"]..'|r',
									type = "group",
									order = 10,
									hidden = false,
									guiInline = true,
									args = {
										shadowToggle = {
											order = 1,
											name = L["TOGGLE"],
											desc = '',
											type = "toggle",
											get = function()
												return cooldowns.primary[1].text.font.shadow.isEnabled
											end,
											set = function(self,value)
												cooldowns.primary[1].text.font.shadow.isEnabled = value
												CheckRestorationDefaultValues(res_options,'Cooldowns')
											end,
										},
										shadowColor = {
											type = "color",
											order = 2,
											name = L["LABEL_FONT_SHADOW_COLOR"],
											desc = L["TOOLTIP_FONT_SHADOW_COLOR"],
											hasAlpha = true,
											get = function(info)
												local color = cooldowns.primary[1].text.font.shadow.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = cooldowns.primary[1].text.font.shadow.color

												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckRestorationDefaultValues(res_options,'Cooldowns')
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
											desc = L["TOOLTIP_FONT_SHADOW_X_OFFSET"],
											min = -10,
											max = 10,
											step = 1,
											bigStep = 1,
											disabled = true,
											get = function() return cooldowns.primary[1].text.font.shadow.offset.x end,
											set = function(self,value)
												cooldowns.primary[1].text.font.shadow.offset.x = value
												CheckRestorationDefaultValues(res_options,'Cooldowns')
											end,
										},
										shadowY = {
											order = 5,
											type = "range",
											name = "Y",
											desc = L["TOOLTIP_FONT_SHADOW_Y_OFFSET"],
											min = -10,
											max = 10,
											step = 1,
											bigStep = 1,
											disabled = true,
											get = function() return cooldowns.primary[1].text.font.shadow.offset.y end,
											set = function(self,value)
												cooldowns.primary[1].text.font.shadow.offset.y = value
												CheckRestorationDefaultValues(res_options,'Cooldowns')
											end,
										},
									},
								},
								reset = {
									order = 11,
									type = "execute",
									name = RESET_TO_DEFAULT,
									func = function()
										local cd = cooldowns.primary[1]
										local default = cooldownDefaults
										
										cd.text.isDisplayText = true
										cd.text.x = default.text.x
										cd.text.y = default.text.y
										cd.text.font.name = default.text.font.name
										cd.text.font.size = default.text.font.size
										cd.text.font.flag = default.text.font.flag
										cd.text.font.color.r = default.text.font.color.r
										cd.text.font.color.g = default.text.font.color.g
										cd.text.font.color.b = default.text.font.color.b
										cd.text.font.color.a = default.text.font.color.a
										cd.text.font.shadow.isEnabled = false
										cd.text.font.shadow.offset.x = default.text.font.shadow.offset.x
										cd.text.font.shadow.offset.y = default.text.font.shadow.offset.y
										cd.text.font.shadow.color.r = default.text.font.shadow.color.r
										cd.text.font.shadow.color.g = default.text.font.shadow.color.g
										cd.text.font.shadow.color.b = default.text.font.shadow.color.b
										cd.text.font.shadow.color.a = default.text.font.shadow.color.a
										cd.text.justify = default.text.justify

										res_options.args.cooldowns.args.p1_adjustGroup.args.reset.disabled = true
										res_options.args.cooldowns.args.p1_adjustGroup.args.reset.name = "|cFF666666"..RESET_TO_DEFAULT.."|r"
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
							},
						},
						p2_formatting = {
							name = FORMATTING,
							type = "group",
							order = 11,
							guiInline = true,
							args = {
								alertToggle = {
									order = 1,
									name = L["LABEL_ALERT"],
									desc = L["TOOLTIP_ALERT"],
									type = "toggle",
									get = function()
										return cooldowns.primary[2].text.formatting.alert.isEnabled
									end,
									set = function(self,value)
										cooldowns.primary[2].text.formatting.alert.isEnabled = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
									width = "double",
								},
								copy = {
									order = 2,
									type = "select",
									name = L["LABEL_COOLDOWN_COPY_FROM"],
									desc = L["TOOLTIP_COOLDOWN_COPY_FROM"],
									get = function()
										return ''
									end,
									set = function(self,value)
										CopyCooldownFormatting(value,3,'primary',2)
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
									values = {
										["primary;1"] = PRIMARY.." #1",
										["primary;3"] = PRIMARY.." #3",
										["secondary;1"] = SECONDARY.." #1",
										["secondary;2"] = SECONDARY.." #2",
									},
								},
								alertFlash = {
									order = 3,
									name = L["LABEL_ALERT_ANIMATE"],
									desc = L["TOOLTIP_ALERT_ANIMATE"],
									type = "toggle",
									get = function()
										return cooldowns.primary[2].text.formatting.alert.animate
									end,
									set = function(self,value)
										cooldowns.primary[2].text.formatting.alert.animate = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
								alertColor = {
									type = "color",
									order = 4,
									name = L["LABEL_ALERT_COLOR"],
									desc = L["TOOLTIP_ALERT_COLOR"],
									hasAlpha = true,
									get = function(info)
										local color = cooldowns.primary[2].text.formatting.alert.color
										return color.r, color.g, color.b, color.a
									end,
									set = function(info, r, g, b, a)
										local color = cooldowns.primary[2].text.formatting.alert.color
										
										color.r = tonumber(string.format("%.2f",r))
										color.g = tonumber(string.format("%.2f",g))
										color.b = tonumber(string.format("%.2f",b))
										color.a = tonumber(string.format("%.2f",a))
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
								alertThreshold = {
									order = 5,
									type = "range",
									name = L["LABEL_ALERT_THRESHOLD"],
									desc = L["TOOLTIP_ALERT_THRESHOLD"],
									min = 3,
									max = 10,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.primary[2].text.formatting.alert.threshold end,
									set = function(self,value)
										cooldowns.primary[2].text.formatting.alert.threshold = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
								decimals = {
									order = 6,
									name = L["LABEL_DECIMALS"],
									desc = L["TOOLTIP_DECIMALS"],
									type = "toggle",
									get = function()
										return cooldowns.primary[2].text.formatting.decimals
									end,
									set = function(self,value)
										cooldowns.primary[2].text.formatting.decimals = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
								format = {
									order = 7,
									type = "select",
									name = L["LABEL_MINUTE_FORMAT"],
									desc = L["TOOLTIP_MINUTE_FORMAT"],
									get = function()
										return cooldowns.primary[2].text.formatting.length
									end,
									set = function(self,value)
										--cooldowns.primary[2].text.justify = value
										--CheckRestorationDefaultValues(res_options,'Cooldowns')
										cooldowns.primary[2].text.formatting.length = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
									values = TIME_FORMATS,
								},
							},
						},
						p2_adjustGroup = {
							name = L["LABEL_COOLDOWN_SETTINGS"],
							type = "group",
							order = 12,
							hidden = true,
							guiInline = true,
							args = {
								color = {
									type = "color",
									order = 1,
									name = L["LABEL_FONT_COLOR"],
									desc = L["TOOLTIP_FONT_COLOR"],
									hasAlpha = true,
									get = function(info)
										local color = cooldowns.primary[2].text.font.color
										return color.r, color.g, color.b, color.a
									end,
									set = function(info, r, g, b, a)
										local color = cooldowns.primary[2].text.font.color
										
										color.r = tonumber(string.format("%.2f",r))
										color.g = tonumber(string.format("%.2f",g))
										color.b = tonumber(string.format("%.2f",b))
										color.a = tonumber(string.format("%.2f",a))
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
									width = "double",
								},
								copy = {
									order = 3,
									type = "select",
									name = L["LABEL_COOLDOWN_COPY_FROM"],
									desc = L["TOOLTIP_COOLDOWN_COPY_FROM"],
									get = function()
										return ''
									end,
									set = function(self,value)
										--cooldowns.primary[1].text.justify = value
										--CheckRestorationDefaultValues(res_options,'Cooldowns')
										CopyCooldownOptions(value,3,'primary',2)
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
									values = {
										["primary;1"] = PRIMARY.." #1",
										["primary;3"] = PRIMARY.." #3",
										["secondary;1"] = SECONDARY.." #1",
										["secondary;2"] = SECONDARY.." #2",
									},
								},
								fontName = {
									order = 4,
									type = "select",
									dialogControl = "LSM30_Font",
									name = L["LABEL_FONT"],
									desc = L["TOOLTIP_FONT_NAME"],
									values = LSM:HashTable("font"),
									get = function() return cooldowns.primary[2].text.font.name end,
									set = function(self,value)
										cooldowns.primary[2].text.font.name = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
								fontSize = {
									order = 5,
									type = "range",
									name = FONT_SIZE,
									desc = L["TOOLTIP_COOLDOWN_FONT_SIZE"],
									min = 5,
									max = 40,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.primary[2].text.font.size end,
									set = function(self,value)
										cooldowns.primary[2].text.font.size = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
								fontOutline = {
									order = 6,
									type = "select",
									name = L["LABEL_FONT_OUTLINE"],
									desc = L["TOOLTIP_FONT_OUTLINE"],
									get = function()
										return cooldowns.primary[2].text.font.flag
									end,
									set = function(self,value)
										cooldowns.primary[2].text.font.flag = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
									values = FONT_OUTLINES,
								},
								textAnchor = {
									order = 7,
									type = "select",
									name = L["LABEL_FONT_ANCHOR"],
									desc = L["TOOLTIP_FONT_ANCHOR_POINT"],
									get = function()
										return cooldowns.primary[2].text.justify
									end,
									set = function(self,value)
										cooldowns.primary[2].text.justify = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
									values = FRAME_ANCHOR_OPTIONS,
								},
								textX = {
									order = 8,
									type = "range",
									name = "X",
									desc = L["TOOLTIP_FONT_X_OFFSET"],
									min = -100,
									max = 100,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.primary[2].text.x end,
									set = function(self,value)
										cooldowns.primary[2].text.x = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
								textY = {
									order = 9,
									type = "range",
									name = "Y",
									desc = L["TOOLTIP_FONT_Y_OFFSET"],
									min = -100,
									max = 100,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.primary[2].text.y end,
									set = function(self,value)
										cooldowns.primary[2].text.y = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
								shadow = {
									name = '|cFFFFFFFF'..L["LABEL_FONT_SHADOW"]..'|r',
									type = "group",
									order = 10,
									hidden = false,
									guiInline = true,
									args = {
										shadowToggle = {
											order = 1,
											name = L["TOGGLE"],
											desc = '',
											type = "toggle",
											get = function()
												return cooldowns.primary[2].text.font.shadow.isEnabled
											end,
											set = function(self,value)
												cooldowns.primary[2].text.font.shadow.isEnabled = value
												CheckRestorationDefaultValues(res_options,'Cooldowns')
											end,
										},
										shadowColor = {
											type = "color",
											order = 2,
											name = L["LABEL_FONT_SHADOW_COLOR"],
											desc = L["TOOLTIP_FONT_SHADOW_COLOR"],
											hasAlpha = true,
											get = function(info)
												local color = cooldowns.primary[2].text.font.shadow.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = cooldowns.primary[2].text.font.shadow.color

												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckRestorationDefaultValues(res_options,'Cooldowns')
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
											desc = L["TOOLTIP_FONT_SHADOW_X_OFFSET"],
											min = -10,
											max = 10,
											step = 1,
											bigStep = 1,
											disabled = true,
											get = function() return cooldowns.primary[2].text.font.shadow.offset.x end,
											set = function(self,value)
												cooldowns.primary[2].text.font.shadow.offset.x = value
												CheckRestorationDefaultValues(res_options,'Cooldowns')
											end,
										},
										shadowY = {
											order = 5,
											type = "range",
											name = "Y",
											desc = L["TOOLTIP_FONT_SHADOW_Y_OFFSET"],
											min = -10,
											max = 10,
											step = 1,
											bigStep = 1,
											disabled = true,
											get = function() return cooldowns.primary[2].text.font.shadow.offset.y end,
											set = function(self,value)
												cooldowns.primary[2].text.font.shadow.offset.y = value
												CheckRestorationDefaultValues(res_options,'Cooldowns')
											end,
										},
									},
								},
								reset = {
									order = 11,
									type = "execute",
									name = RESET_TO_DEFAULT,
									func = function()
										local cd = cooldowns.primary[2]
										local default = cooldownDefaults
										
										cd.text.isDisplayText = true
										cd.text.x = default.text.x
										cd.text.y = default.text.y
										cd.text.font.name = default.text.font.name
										cd.text.font.size = default.text.font.size
										cd.text.font.flag = default.text.font.flag
										cd.text.font.color.r = default.text.font.color.r
										cd.text.font.color.g = default.text.font.color.g
										cd.text.font.color.b = default.text.font.color.b
										cd.text.font.color.a = default.text.font.color.a
										cd.text.font.shadow.isEnabled = false
										cd.text.font.shadow.offset.x = default.text.font.shadow.offset.x
										cd.text.font.shadow.offset.y = default.text.font.shadow.offset.y
										cd.text.font.shadow.color.r = default.text.font.shadow.color.r
										cd.text.font.shadow.color.g = default.text.font.shadow.color.g
										cd.text.font.shadow.color.b = default.text.font.shadow.color.b
										cd.text.font.shadow.color.a = default.text.font.shadow.color.a
										cd.text.justify = default.text.justify

										res_options.args.cooldowns.args.p2_adjustGroup.args.reset.disabled = true
										res_options.args.cooldowns.args.p2_adjustGroup.args.reset.name = "|cFF666666"..RESET_TO_DEFAULT.."|r"
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
							},
						},
						p3_formatting = {
							name = FORMATTING,
							type = "group",
							order = 13,
							guiInline = true,
							args = {
								alertToggle = {
									order = 1,
									name = L["LABEL_ALERT"],
									desc = L["TOOLTIP_ALERT"],
									type = "toggle",
									get = function()
										return cooldowns.primary[3].text.formatting.alert.isEnabled
									end,
									set = function(self,value)
										cooldowns.primary[3].text.formatting.alert.isEnabled = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
									width = "double",
								},
								copy = {
									order = 2,
									type = "select",
									name = L["LABEL_COOLDOWN_COPY_FROM"],
									desc = L["TOOLTIP_COOLDOWN_COPY_FROM"],
									get = function()
										return ''
									end,
									set = function(self,value)
										CopyCooldownFormatting(value,3,'primary',3)
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
									values = {
										["primary;1"] = PRIMARY.." #1",
										["primary;2"] = PRIMARY.." #2",
										["secondary;1"] = SECONDARY.." #1",
										["secondary;2"] = SECONDARY.." #2",
									},
								},
								alertFlash = {
									order = 3,
									name = L["LABEL_ALERT_ANIMATE"],
									desc = L["TOOLTIP_ALERT_ANIMATE"],
									type = "toggle",
									get = function()
										return cooldowns.primary[3].text.formatting.alert.animate
									end,
									set = function(self,value)
										cooldowns.primary[3].text.formatting.alert.animate = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
								alertColor = {
									type = "color",
									order = 4,
									name = L["LABEL_ALERT_COLOR"],
									desc = L["TOOLTIP_ALERT_COLOR"],
									hasAlpha = true,
									get = function(info)
										local color = cooldowns.primary[3].text.formatting.alert.color
										return color.r, color.g, color.b, color.a
									end,
									set = function(info, r, g, b, a)
										local color = cooldowns.primary[3].text.formatting.alert.color
										
										color.r = tonumber(string.format("%.2f",r))
										color.g = tonumber(string.format("%.2f",g))
										color.b = tonumber(string.format("%.2f",b))
										color.a = tonumber(string.format("%.2f",a))
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
								alertThreshold = {
									order = 5,
									type = "range",
									name = L["LABEL_ALERT_THRESHOLD"],
									desc = L["TOOLTIP_ALERT_THRESHOLD"],
									min = 3,
									max = 10,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.primary[3].text.formatting.alert.threshold end,
									set = function(self,value)
										cooldowns.primary[3].text.formatting.alert.threshold = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
								decimals = {
									order = 6,
									name = L["LABEL_DECIMALS"],
									desc = L["TOOLTIP_DECIMALS"],
									type = "toggle",
									get = function()
										return cooldowns.primary[3].text.formatting.decimals
									end,
									set = function(self,value)
										cooldowns.primary[3].text.formatting.decimals = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
								format = {
									order = 7,
									type = "select",
									name = L["LABEL_MINUTE_FORMAT"],
									desc = L["TOOLTIP_MINUTE_FORMAT"],
									get = function()
										return cooldowns.primary[3].text.formatting.length
									end,
									set = function(self,value)
										--cooldowns.primary[3].text.justify = value
										--CheckRestorationDefaultValues(res_options,'Cooldowns')
										cooldowns.primary[3].text.formatting.length = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
									values = TIME_FORMATS,
								},
							},
						},
						p3_adjustGroup = {
							name = L["LABEL_COOLDOWN_SETTINGS"],
							type = "group",
							order = 14,
							hidden = true,
							guiInline = true,
							args = {
								color = {
									type = "color",
									order = 1,
									name = L["LABEL_FONT_COLOR"],
									desc = L["TOOLTIP_FONT_COLOR"],
									hasAlpha = true,
									get = function(info)
										local color = cooldowns.primary[3].text.font.color
										return color.r, color.g, color.b, color.a
									end,
									set = function(info, r, g, b, a)
										local color = cooldowns.primary[3].text.font.color
										
										color.r = tonumber(string.format("%.2f",r))
										color.g = tonumber(string.format("%.2f",g))
										color.b = tonumber(string.format("%.2f",b))
										color.a = tonumber(string.format("%.2f",a))
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
									width = "double",
								},
								copy = {
									order = 3,
									type = "select",
									name = L["LABEL_COOLDOWN_COPY_FROM"],
									desc = L["TOOLTIP_COOLDOWN_COPY_FROM"],
									get = function()
										return ''
									end,
									set = function(self,value)
										--cooldowns.primary[1].text.justify = value
										--CheckRestorationDefaultValues(res_options,'Cooldowns')
										CopyCooldownOptions(value,3,'primary',3)
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
									values = {
										["primary;1"] = PRIMARY.." #1",
										["primary;2"] = PRIMARY.." #2",
										["secondary;1"] = SECONDARY.." #1",
										["secondary;2"] = SECONDARY.." #2",
									},
								},
								fontName = {
									order = 4,
									type = "select",
									dialogControl = "LSM30_Font",
									name = L["LABEL_FONT"],
									desc = L["TOOLTIP_FONT_NAME"],
									values = LSM:HashTable("font"),
									get = function() return cooldowns.primary[3].text.font.name end,
									set = function(self,value)
										cooldowns.primary[3].text.font.name = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
								fontSize = {
									order = 5,
									type = "range",
									name = FONT_SIZE,
									desc = L["TOOLTIP_COOLDOWN_FONT_SIZE"],
									min = 5,
									max = 40,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.primary[3].text.font.size end,
									set = function(self,value)
										cooldowns.primary[3].text.font.size = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
								fontOutline = {
									order = 6,
									type = "select",
									name = L["LABEL_FONT_OUTLINE"],
									desc = L["TOOLTIP_FONT_OUTLINE"],
									get = function()
										return cooldowns.primary[3].text.font.flag
									end,
									set = function(self,value)
										cooldowns.primary[3].text.font.flag = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
									values = FONT_OUTLINES,
								},
								textAnchor = {
									order = 7,
									type = "select",
									name = L["LABEL_FONT_ANCHOR"],
									desc = L["TOOLTIP_FONT_ANCHOR_POINT"],
									get = function()
										return cooldowns.primary[3].text.justify
									end,
									set = function(self,value)
										cooldowns.primary[3].text.justify = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
									values = FRAME_ANCHOR_OPTIONS,
								},
								textX = {
									order = 8,
									type = "range",
									name = "X",
									desc = L["TOOLTIP_FONT_X_OFFSET"],
									min = -100,
									max = 100,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.primary[3].text.x end,
									set = function(self,value)
										cooldowns.primary[3].text.x = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
								textY = {
									order = 9,
									type = "range",
									name = "Y",
									desc = L["TOOLTIP_FONT_Y_OFFSET"],
									min = -100,
									max = 100,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.primary[3].text.y end,
									set = function(self,value)
										cooldowns.primary[3].text.y = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
								shadow = {
									name = '|cFFFFFFFF'..L["LABEL_FONT_SHADOW"]..'|r',
									type = "group",
									order = 10,
									hidden = false,
									guiInline = true,
									args = {
										shadowToggle = {
											order = 1,
											name = L["TOGGLE"],
											desc = '',
											type = "toggle",
											get = function()
												return cooldowns.primary[3].text.font.shadow.isEnabled
											end,
											set = function(self,value)
												cooldowns.primary[3].text.font.shadow.isEnabled = value
												CheckRestorationDefaultValues(res_options,'Cooldowns')
											end,
										},
										shadowColor = {
											type = "color",
											order = 2,
											name = L["LABEL_FONT_SHADOW_COLOR"],
											desc = L["TOOLTIP_FONT_SHADOW_COLOR"],
											hasAlpha = true,
											get = function(info)
												local color = cooldowns.primary[3].text.font.shadow.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = cooldowns.primary[3].text.font.shadow.color

												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckRestorationDefaultValues(res_options,'Cooldowns')
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
											desc = L["TOOLTIP_FONT_SHADOW_X_OFFSET"],
											min = -10,
											max = 10,
											step = 1,
											bigStep = 1,
											disabled = true,
											get = function() return cooldowns.primary[3].text.font.shadow.offset.x end,
											set = function(self,value)
												cooldowns.primary[3].text.font.shadow.offset.x = value
												CheckRestorationDefaultValues(res_options,'Cooldowns')
											end,
										},
										shadowY = {
											order = 5,
											type = "range",
											name = "Y",
											desc = L["TOOLTIP_FONT_SHADOW_Y_OFFSET"],
											min = -10,
											max = 10,
											step = 1,
											bigStep = 1,
											disabled = true,
											get = function() return cooldowns.primary[3].text.font.shadow.offset.y end,
											set = function(self,value)
												cooldowns.primary[3].text.font.shadow.offset.y = value
												CheckRestorationDefaultValues(res_options,'Cooldowns')
											end,
										},
									},
								},
								reset = {
									order = 11,
									type = "execute",
									name = RESET_TO_DEFAULT,
									func = function()
										local cd = cooldowns.primary[3]
										local default = cooldownDefaults
										
										cd.text.isDisplayText = true
										cd.text.x = default.text.x
										cd.text.y = default.text.y
										cd.text.font.name = default.text.font.name
										cd.text.font.size = default.text.font.size
										cd.text.font.flag = default.text.font.flag
										cd.text.font.color.r = default.text.font.color.r
										cd.text.font.color.g = default.text.font.color.g
										cd.text.font.color.b = default.text.font.color.b
										cd.text.font.color.a = default.text.font.color.a
										cd.text.font.shadow.isEnabled = false
										cd.text.font.shadow.offset.x = default.text.font.shadow.offset.x
										cd.text.font.shadow.offset.y = default.text.font.shadow.offset.y
										cd.text.font.shadow.color.r = default.text.font.shadow.color.r
										cd.text.font.shadow.color.g = default.text.font.shadow.color.g
										cd.text.font.shadow.color.b = default.text.font.shadow.color.b
										cd.text.font.shadow.color.a = default.text.font.shadow.color.a
										cd.text.justify = default.text.justify

										res_options.args.cooldowns.args.p3_adjustGroup.args.reset.disabled = true
										res_options.args.cooldowns.args.p3_adjustGroup.args.reset.name = "|cFF666666"..RESET_TO_DEFAULT.."|r"
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
							},
						},
						s1_formatting = {
							name = FORMATTING,
							type = "group",
							order = 15,
							guiInline = true,
							args = {
								alertToggle = {
									order = 1,
									name = L["LABEL_ALERT"],
									desc = L["TOOLTIP_ALERT"],
									type = "toggle",
									get = function()
										return cooldowns.secondary[1].text.formatting.alert.isEnabled
									end,
									set = function(self,value)
										cooldowns.secondary[1].text.formatting.alert.isEnabled = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
									width = "double",
								},
								copy = {
									order = 2,
									type = "select",
									name = L["LABEL_COOLDOWN_COPY_FROM"],
									desc = L["TOOLTIP_COOLDOWN_COPY_FROM"],
									get = function()
										return ''
									end,
									set = function(self,value)
										CopyCooldownFormatting(value,3,'secondary',1)
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
									values = {
										["primary;1"] = PRIMARY.." #1",
										["primary;2"] = PRIMARY.." #2",
										["primary;3"] = PRIMARY.." #3",
										["secondary;2"] = SECONDARY.." #2",
									},
								},
								alertFlash = {
									order = 3,
									name = L["LABEL_ALERT_ANIMATE"],
									desc = L["TOOLTIP_ALERT_ANIMATE"],
									type = "toggle",
									get = function()
										return cooldowns.secondary[1].text.formatting.alert.animate
									end,
									set = function(self,value)
										cooldowns.secondary[1].text.formatting.alert.animate = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
								alertColor = {
									type = "color",
									order = 4,
									name = L["LABEL_ALERT_COLOR"],
									desc = L["TOOLTIP_ALERT_COLOR"],
									hasAlpha = true,
									get = function(info)
										local color = cooldowns.secondary[1].text.formatting.alert.color
										return color.r, color.g, color.b, color.a
									end,
									set = function(info, r, g, b, a)
										local color = cooldowns.secondary[1].text.formatting.alert.color
										
										color.r = tonumber(string.format("%.2f",r))
										color.g = tonumber(string.format("%.2f",g))
										color.b = tonumber(string.format("%.2f",b))
										color.a = tonumber(string.format("%.2f",a))
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
								alertThreshold = {
									order = 5,
									type = "range",
									name = L["LABEL_ALERT_THRESHOLD"],
									desc = L["TOOLTIP_ALERT_THRESHOLD"],
									min = 3,
									max = 10,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.secondary[1].text.formatting.alert.threshold end,
									set = function(self,value)
										cooldowns.secondary[1].text.formatting.alert.threshold = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
								decimals = {
									order = 6,
									name = L["LABEL_DECIMALS"],
									desc = L["TOOLTIP_DECIMALS"],
									type = "toggle",
									get = function()
										return cooldowns.secondary[1].text.formatting.decimals
									end,
									set = function(self,value)
										cooldowns.secondary[1].text.formatting.decimals = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
								format = {
									order = 7,
									type = "select",
									name = L["LABEL_MINUTE_FORMAT"],
									desc = L["TOOLTIP_MINUTE_FORMAT"],
									get = function()
										return cooldowns.secondary[1].text.formatting.length
									end,
									set = function(self,value)
										--cooldowns.secondary[1].text.justify = value
										--CheckRestorationDefaultValues(res_options,'Cooldowns')
										cooldowns.secondary[1].text.formatting.length = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
									values = TIME_FORMATS,
								},
							},
						},
						s1_adjustGroup = {
							name = L["LABEL_COOLDOWN_SETTINGS"],
							type = "group",
							order = 16,
							hidden = true,
							guiInline = true,
							args = {
								color = {
									type = "color",
									order = 1,
									name = L["LABEL_FONT_COLOR"],
									desc = L["TOOLTIP_FONT_COLOR"],
									hasAlpha = true,
									get = function(info)
										local color = cooldowns.secondary[1].text.font.color
										return color.r, color.g, color.b, color.a
									end,
									set = function(info, r, g, b, a)
										local color = cooldowns.secondary[1].text.font.color
										
										color.r = tonumber(string.format("%.2f",r))
										color.g = tonumber(string.format("%.2f",g))
										color.b = tonumber(string.format("%.2f",b))
										color.a = tonumber(string.format("%.2f",a))
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
									width = "double",
								},
								copy = {
									order = 3,
									type = "select",
									name = L["LABEL_COOLDOWN_COPY_FROM"],
									desc = L["TOOLTIP_COOLDOWN_COPY_FROM"],
									get = function()
										return ''
									end,
									set = function(self,value)
										--cooldowns.primary[1].text.justify = value
										--CheckRestorationDefaultValues(res_options,'Cooldowns')
										CopyCooldownOptions(value,3,'secondary',1)
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
									values = {
										["primary;1"] = PRIMARY.." #1",
										["primary;2"] = PRIMARY.." #2",
										["primary;3"] = PRIMARY.." #3",
										["secondary;2"] = SECONDARY.." #2",
									},
								},
								fontName = {
									order = 4,
									type = "select",
									dialogControl = "LSM30_Font",
									name = L["LABEL_FONT"],
									desc = L["TOOLTIP_FONT_NAME"],
									values = LSM:HashTable("font"),
									get = function() return cooldowns.secondary[1].text.font.name end,
									set = function(self,value)
										cooldowns.secondary[1].text.font.name = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
								fontSize = {
									order = 5,
									type = "range",
									name = FONT_SIZE,
									desc = L["TOOLTIP_COOLDOWN_FONT_SIZE"],
									min = 5,
									max = 40,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.secondary[1].text.font.size end,
									set = function(self,value)
										cooldowns.secondary[1].text.font.size = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
								fontOutline = {
									order = 6,
									type = "select",
									name = L["LABEL_FONT_OUTLINE"],
									desc = L["TOOLTIP_FONT_OUTLINE"],
									get = function()
										return cooldowns.secondary[1].text.font.flag
									end,
									set = function(self,value)
										cooldowns.secondary[1].text.font.flag = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
									values = FONT_OUTLINES,
								},
								textAnchor = {
									order = 7,
									type = "select",
									name = L["LABEL_FONT_ANCHOR"],
									desc = L["TOOLTIP_FONT_ANCHOR_POINT"],
									get = function()
										return cooldowns.secondary[1].text.justify
									end,
									set = function(self,value)
										cooldowns.secondary[1].text.justify = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
									values = FRAME_ANCHOR_OPTIONS,
								},
								textX = {
									order = 8,
									type = "range",
									name = "X",
									desc = L["TOOLTIP_FONT_X_OFFSET"],
									min = -100,
									max = 100,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.secondary[1].text.x end,
									set = function(self,value)
										cooldowns.secondary[1].text.x = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
								textY = {
									order = 9,
									type = "range",
									name = "Y",
									desc = L["TOOLTIP_FONT_Y_OFFSET"],
									min = -100,
									max = 100,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.secondary[1].text.y end,
									set = function(self,value)
										cooldowns.secondary[1].text.y = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
								shadow = {
									name = '|cFFFFFFFF'..L["LABEL_FONT_SHADOW"]..'|r',
									type = "group",
									order = 10,
									hidden = false,
									guiInline = true,
									args = {
										shadowToggle = {
											order = 1,
											name = L["TOGGLE"],
											desc = '',
											type = "toggle",
											get = function()
												return cooldowns.secondary[1].text.font.shadow.isEnabled
											end,
											set = function(self,value)
												cooldowns.secondary[1].text.font.shadow.isEnabled = value
												CheckRestorationDefaultValues(res_options,'Cooldowns')
											end,
										},
										shadowColor = {
											type = "color",
											order = 2,
											name = L["LABEL_FONT_SHADOW_COLOR"],
											desc = L["TOOLTIP_FONT_SHADOW_COLOR"],
											hasAlpha = true,
											get = function(info)
												local color = cooldowns.secondary[1].text.font.shadow.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = cooldowns.secondary[1].text.font.shadow.color

												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckRestorationDefaultValues(res_options,'Cooldowns')
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
											desc = L["TOOLTIP_FONT_SHADOW_X_OFFSET"],
											min = -10,
											max = 10,
											step = 1,
											bigStep = 1,
											disabled = true,
											get = function() return cooldowns.secondary[1].text.font.shadow.offset.x end,
											set = function(self,value)
												cooldowns.secondary[1].text.font.shadow.offset.x = value
												CheckRestorationDefaultValues(res_options,'Cooldowns')
											end,
										},
										shadowY = {
											order = 5,
											type = "range",
											name = "Y",
											desc = L["TOOLTIP_FONT_SHADOW_Y_OFFSET"],
											min = -10,
											max = 10,
											step = 1,
											bigStep = 1,
											disabled = true,
											get = function() return cooldowns.secondary[1].text.font.shadow.offset.y end,
											set = function(self,value)
												cooldowns.secondary[1].text.font.shadow.offset.y = value
												CheckRestorationDefaultValues(res_options,'Cooldowns')
											end,
										},
									},
								},
								reset = {
									order = 11,
									type = "execute",
									name = RESET_TO_DEFAULT,
									func = function()
										local cd = cooldowns.secondary[1]
										local default = cooldownDefaults
										
										cd.text.isDisplayText = true
										cd.text.x = default.text.x
										cd.text.y = default.text.y
										cd.text.font.name = default.text.font.name
										cd.text.font.size = default.text.font.size
										cd.text.font.flag = default.text.font.flag
										cd.text.font.color.r = default.text.font.color.r
										cd.text.font.color.g = default.text.font.color.g
										cd.text.font.color.b = default.text.font.color.b
										cd.text.font.color.a = default.text.font.color.a
										cd.text.font.shadow.isEnabled = false
										cd.text.font.shadow.offset.x = default.text.font.shadow.offset.x
										cd.text.font.shadow.offset.y = default.text.font.shadow.offset.y
										cd.text.font.shadow.color.r = default.text.font.shadow.color.r
										cd.text.font.shadow.color.g = default.text.font.shadow.color.g
										cd.text.font.shadow.color.b = default.text.font.shadow.color.b
										cd.text.font.shadow.color.a = default.text.font.shadow.color.a
										cd.text.justify = default.text.justify

										res_options.args.cooldowns.args.s1_adjustGroup.args.reset.disabled = true
										res_options.args.cooldowns.args.s1_adjustGroup.args.reset.name = "|cFF666666"..RESET_TO_DEFAULT.."|r"
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
							},
						},
						s2_formatting = {
							name = FORMATTING,
							type = "group",
							order = 17,
							guiInline = true,
							args = {
								alertToggle = {
									order = 1,
									name = L["LABEL_ALERT"],
									desc = L["TOOLTIP_ALERT"],
									type = "toggle",
									get = function()
										return cooldowns.secondary[2].text.formatting.alert.isEnabled
									end,
									set = function(self,value)
										cooldowns.secondary[2].text.formatting.alert.isEnabled = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
									width = "double",
								},
								copy = {
									order = 2,
									type = "select",
									name = L["LABEL_COOLDOWN_COPY_FROM"],
									desc = L["TOOLTIP_COOLDOWN_COPY_FROM"],
									get = function()
										return ''
									end,
									set = function(self,value)
										CopyCooldownFormatting(value,3,'secondary',2)
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
									values = {
										["primary;1"] = PRIMARY.." #1",
										["primary;2"] = PRIMARY.." #2",
										["primary;3"] = PRIMARY.." #3",
										["secondary;1"] = SECONDARY.." #1",
									},
								},
								alertFlash = {
									order = 3,
									name = L["LABEL_ALERT_ANIMATE"],
									desc = L["TOOLTIP_ALERT_ANIMATE"],
									type = "toggle",
									get = function()
										return cooldowns.secondary[2].text.formatting.alert.animate
									end,
									set = function(self,value)
										cooldowns.secondary[2].text.formatting.alert.animate = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
								alertColor = {
									type = "color",
									order = 4,
									name = L["LABEL_ALERT_COLOR"],
									desc = L["TOOLTIP_ALERT_COLOR"],
									hasAlpha = true,
									get = function(info)
										local color = cooldowns.secondary[2].text.formatting.alert.color
										return color.r, color.g, color.b, color.a
									end,
									set = function(info, r, g, b, a)
										local color = cooldowns.secondary[2].text.formatting.alert.color
										
										color.r = tonumber(string.format("%.2f",r))
										color.g = tonumber(string.format("%.2f",g))
										color.b = tonumber(string.format("%.2f",b))
										color.a = tonumber(string.format("%.2f",a))
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
								alertThreshold = {
									order = 5,
									type = "range",
									name = L["LABEL_ALERT_THRESHOLD"],
									desc = L["TOOLTIP_ALERT_THRESHOLD"],
									min = 3,
									max = 10,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.secondary[2].text.formatting.alert.threshold end,
									set = function(self,value)
										cooldowns.secondary[2].text.formatting.alert.threshold = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
								decimals = {
									order = 6,
									name = L["LABEL_DECIMALS"],
									desc = L["TOOLTIP_DECIMALS"],
									type = "toggle",
									get = function()
										return cooldowns.secondary[2].text.formatting.decimals
									end,
									set = function(self,value)
										cooldowns.secondary[2].text.formatting.decimals = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
								format = {
									order = 7,
									type = "select",
									name = L["LABEL_MINUTE_FORMAT"],
									desc = L["TOOLTIP_MINUTE_FORMAT"],
									get = function()
										return cooldowns.secondary[2].text.formatting.length
									end,
									set = function(self,value)
										--cooldowns.secondary[2].text.justify = value
										--CheckRestorationDefaultValues(res_options,'Cooldowns')
										cooldowns.secondary[2].text.formatting.length = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
									values = TIME_FORMATS,
								},
							},
						},
						s2_adjustGroup = {
							name = L["LABEL_COOLDOWN_SETTINGS"],
							type = "group",
							order = 18,
							hidden = true,
							guiInline = true,
							args = {
								color = {
									type = "color",
									order = 1,
									name = L["LABEL_FONT_COLOR"],
									desc = L["TOOLTIP_FONT_COLOR"],
									hasAlpha = true,
									get = function(info)
										local color = cooldowns.secondary[2].text.font.color
										return color.r, color.g, color.b, color.a
									end,
									set = function(info, r, g, b, a)
										local color = cooldowns.secondary[2].text.font.color
										
										color.r = tonumber(string.format("%.2f",r))
										color.g = tonumber(string.format("%.2f",g))
										color.b = tonumber(string.format("%.2f",b))
										color.a = tonumber(string.format("%.2f",a))
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
									width = "double",
								},
								copy = {
									order = 3,
									type = "select",
									name = L["LABEL_COOLDOWN_COPY_FROM"],
									desc = L["TOOLTIP_COOLDOWN_COPY_FROM"],
									get = function()
										return ''
									end,
									set = function(self,value)
										--cooldowns.primary[1].text.justify = value
										--CheckRestorationDefaultValues(res_options,'Cooldowns')
										CopyCooldownOptions(value,3,'secondary',2)
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
									values = {
										["primary;1"] = PRIMARY.." #1",
										["primary;2"] = PRIMARY.." #2",
										["primary;3"] = PRIMARY.." #3",
										["secondary;1"] = SECONDARY.." #1",
									},
								},
								fontName = {
									order = 4,
									type = "select",
									dialogControl = "LSM30_Font",
									name = L["LABEL_FONT"],
									desc = L["TOOLTIP_FONT_NAME"],
									values = LSM:HashTable("font"),
									get = function() return cooldowns.secondary[2].text.font.name end,
									set = function(self,value)
										cooldowns.secondary[2].text.font.name = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
								fontSize = {
									order = 5,
									type = "range",
									name = FONT_SIZE,
									desc = L["TOOLTIP_COOLDOWN_FONT_SIZE"],
									min = 5,
									max = 40,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.secondary[2].text.font.size end,
									set = function(self,value)
										cooldowns.secondary[2].text.font.size = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
								fontOutline = {
									order = 6,
									type = "select",
									name = L["LABEL_FONT_OUTLINE"],
									desc = L["TOOLTIP_FONT_OUTLINE"],
									get = function()
										return cooldowns.secondary[2].text.font.flag
									end,
									set = function(self,value)
										cooldowns.secondary[2].text.font.flag = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
									values = FONT_OUTLINES,
								},
								textAnchor = {
									order = 7,
									type = "select",
									name = L["LABEL_FONT_ANCHOR"],
									desc = L["TOOLTIP_FONT_ANCHOR_POINT"],
									get = function()
										return cooldowns.secondary[2].text.justify
									end,
									set = function(self,value)
										cooldowns.secondary[2].text.justify = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
									values = FRAME_ANCHOR_OPTIONS,
								},
								textX = {
									order = 8,
									type = "range",
									name = "X",
									desc = L["TOOLTIP_FONT_X_OFFSET"],
									min = -100,
									max = 100,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.secondary[2].text.x end,
									set = function(self,value)
										cooldowns.secondary[2].text.x = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
								textY = {
									order = 9,
									type = "range",
									name = "Y",
									desc = L["TOOLTIP_FONT_Y_OFFSET"],
									min = -100,
									max = 100,
									step = 1,
									bigStep = 1,
									get = function() return cooldowns.secondary[2].text.y end,
									set = function(self,value)
										cooldowns.secondary[2].text.y = value
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
								shadow = {
									name = '|cFFFFFFFF'..L["LABEL_FONT_SHADOW"]..'|r',
									type = "group",
									order = 10,
									hidden = false,
									guiInline = true,
									args = {
										shadowToggle = {
											order = 1,
											name = L["TOGGLE"],
											desc = '',
											type = "toggle",
											get = function()
												return cooldowns.secondary[2].text.font.shadow.isEnabled
											end,
											set = function(self,value)
												cooldowns.secondary[2].text.font.shadow.isEnabled = value
												CheckRestorationDefaultValues(res_options,'Cooldowns')
											end,
										},
										shadowColor = {
											type = "color",
											order = 2,
											name = L["LABEL_FONT_SHADOW_COLOR"],
											desc = L["TOOLTIP_FONT_SHADOW_COLOR"],
											hasAlpha = true,
											get = function(info)
												local color = cooldowns.secondary[2].text.font.shadow.color
												return color.r, color.g, color.b, color.a
											end,
											set = function(info, r, g, b, a)
												local color = cooldowns.secondary[2].text.font.shadow.color

												color.r = tonumber(string.format("%.2f",r))
												color.g = tonumber(string.format("%.2f",g))
												color.b = tonumber(string.format("%.2f",b))
												color.a = tonumber(string.format("%.2f",a))
												CheckRestorationDefaultValues(res_options,'Cooldowns')
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
											desc = L["TOOLTIP_FONT_SHADOW_X_OFFSET"],
											min = -10,
											max = 10,
											step = 1,
											bigStep = 1,
											disabled = true,
											get = function() return cooldowns.secondary[2].text.font.shadow.offset.x end,
											set = function(self,value)
												cooldowns.secondary[2].text.font.shadow.offset.x = value
												CheckRestorationDefaultValues(res_options,'Cooldowns')
											end,
										},
										shadowY = {
											order = 5,
											type = "range",
											name = "Y",
											desc = L["TOOLTIP_FONT_SHADOW_Y_OFFSET"],
											min = -10,
											max = 10,
											step = 1,
											bigStep = 1,
											disabled = true,
											get = function() return cooldowns.secondary[2].text.font.shadow.offset.y end,
											set = function(self,value)
												cooldowns.secondary[2].text.font.shadow.offset.y = value
												CheckRestorationDefaultValues(res_options,'Cooldowns')
											end,
										},
									},
								},
								reset = {
									order = 11,
									type = "execute",
									name = RESET_TO_DEFAULT,
									func = function()
										local cd = cooldowns.secondary[2]
										local default = cooldownDefaults
										
										cd.text.isDisplayText = true
										cd.text.x = default.text.x
										cd.text.y = default.text.y
										cd.text.font.name = default.text.font.name
										cd.text.font.size = default.text.font.size
										cd.text.font.flag = default.text.font.flag
										cd.text.font.color.r = default.text.font.color.r
										cd.text.font.color.g = default.text.font.color.g
										cd.text.font.color.b = default.text.font.color.b
										cd.text.font.color.a = default.text.font.color.a
										cd.text.font.shadow.isEnabled = false
										cd.text.font.shadow.offset.x = default.text.font.shadow.offset.x
										cd.text.font.shadow.offset.y = default.text.font.shadow.offset.y
										cd.text.font.shadow.color.r = default.text.font.shadow.color.r
										cd.text.font.shadow.color.g = default.text.font.shadow.color.g
										cd.text.font.shadow.color.b = default.text.font.shadow.color.b
										cd.text.font.shadow.color.a = default.text.font.shadow.color.a
										cd.text.justify = default.text.justify

										res_options.args.cooldowns.args.s2_adjustGroup.args.reset.disabled = true
										res_options.args.cooldowns.args.s2_adjustGroup.args.reset.name = "|cFF666666"..RESET_TO_DEFAULT.."|r"
										CheckRestorationDefaultValues(res_options,'Cooldowns')
									end,
								},
							},
						},
					},
				},
				layout = {
					name = L["LABEL_LAYOUT"],
					order = 6,
					type = "group",
					disabled = true,
					args = {
						MoveAuras = {
							order = 1,
							type = "execute",
							name = "|cFFFFCC00"..L["BUTTON_MOVE_AURAS_RESTORATION"].."|r",
							func = function()
								elements.isMoving = true
								SSA.Move3.Info:Show()
								Auras:InitMoveAuraGroups(3)
							end,
						},
						ResetAuras = {
							order = 2,
							type = "execute",
							name = "|cFFFFCC00"..L["BUTTON_RESET_AURAS_RESTORATION"].."|r",
							func = function()
								Auras:ResetAuraGroupPosition('AuraGroup3')
							end,
						},
						primaryAuras = {
							name = L["LABEL_AURAS_PRIMARY"],
							type = "group",
							order = 3,
							guiInline = true,
							args = {
								PrimaryOrientation1 = {
									order = 1,
									type = "select",
									name = L["LABEL_AURAS_ORIENTATION"].." 1",
									desc = L["TOOLTIP_AURAS_ORIENTATION"],
									get = function()
										return layout.orientation.top
									end,
									set = function(self,value)
										layout.orientation.top = value
										CheckRestorationDefaultValues(res_options,"Primary")
										Auras:UpdateTalents()
									end,
									values = {
										["Horizontal"] = L["OPTION_HORIZONTAL"],
										["Vertical"] = L["OPTION_VERTICAL"],
									},
								},
								PrimaryOrientation2 = {
									order = 2,
									type = "select",
									name = L["LABEL_AURAS_ORIENTATION"].." 2",
									desc = L["TOOLTIP_AURAS_ORIENTATION"],
									get = function()
										return layout.orientation.bottom
									end,
									set = function(self,value)
										layout.orientation.bottom = value
										CheckRestorationDefaultValues(res_options,"Primary")
										Auras:UpdateTalents()
									end,
									values = {
										["Horizontal"] = L["OPTION_HORIZONTAL"],
										["Vertical"] = L["OPTION_VERTICAL"],
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
									name = L["LABEL_AURAS_SIZE"].." 1",
									desc = L["TOOLTIP_AURAS_SIZE"],
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
									name = L["LABEL_AURAS_SPACING"].." 1",
									desc = L["TOOLTIP_AURAS_SPACING"],
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
									name = L["LABEL_AURAS_CHARGES"].." 1",
									desc = L["TOOLTIP_AURAS_CHARGE_SIZE"],
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
									name = L["LABEL_AURAS_SIZE"].." 2",
									desc = L["TOOLTIP_AURAS_SIZE"],
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
									name = L["LABEL_AURAS_SPACING"].." 2",
									desc = L["TOOLTIP_AURAS_SPACING"],
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
									--name = "|cFFFFCC00"..L["BUTTON_RESET_LAYOUT_PRIMARY"].."|r",
									--disabled = false,
									name = L["BUTTON_RESET_LAYOUT_PRIMARY"],
									func = function()
										layout.orientation.top = layoutDefaults.orientation.top
										layout.orientation.bottom = layoutDefaults.orientation.bottom
										layout.primary.top.icon = layoutDefaults.primary.top.icon
										layout.primary.top.spacing = layoutDefaults.primary.top.spacing
										layout.primary.top.charges = layoutDefaults.primary.top.charges
										layout.primary.bottom.icon = layoutDefaults.primary.bottom.icon
										layout.primary.bottom.spacing = layoutDefaults.primary.bottom.spacing
										res_options.args.layout.args.primaryAuras.args.ResetPrimaryLayout.disabled = true
										res_options.args.layout.args.primaryAuras.args.ResetPrimaryLayout.name = "|cFF666666"..L["BUTTON_RESET_LAYOUT_PRIMARY"].."|r"
										Auras:UpdateTalents()
									end,
								},
							},
						},
						secondaryAuras = {
							name = L["LABEL_AURAS_SECONDARY"],
							type = "group",
							order = 4,
							guiInline = true,
							args = {
								SecondaryOrientation1 = {
									order = 1,
									type = "select",
									name = L["LABEL_AURAS_ORIENTATION"].." 1",
									desc = L["TOOLTIP_AURAS_ORIENTATION"],
									get = function()
										return layout.orientation.left
									end,
									set = function(self,value)
										layout.orientation.left = value
										CheckRestorationDefaultValues(res_options,"Secondary")
										Auras:UpdateTalents()
									end,
									values = {
										["Horizontal"] = L["OPTION_HORIZONTAL"],
										["Vertical"] = L["OPTION_VERTICAL"],
									},
								},
								SecondaryOrientation2 = {
									order = 2,
									type = "select",
									name = L["LABEL_AURAS_ORIENTATION"].." 2",
									desc = L["TOOLTIP_AURAS_ORIENTATION"],
									get = function()
										return layout.orientation.right
									end,
									set = function(self,value)
										layout.orientation.right = value
										CheckRestorationDefaultValues(res_options,"Secondary")
										Auras:UpdateTalents()
									end,
									values = {
										["Horizontal"] = L["OPTION_HORIZONTAL"],
										["Vertical"] = L["OPTION_VERTICAL"],
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
									name = L["LABEL_AURAS_SIZE"].." 1",
									desc = L["TOOLTIP_AURAS_SIZE"],
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
									name = L["LABEL_AURAS_SPACING"].." 1",
									desc = L["TOOLTIP_AURAS_SPACING"],
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
									name = L["LABEL_AURAS_SIZE"].." 2",
									desc = L["TOOLTIP_AURAS_SIZE"],
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
									name = L["LABEL_AURAS_SPACING"].." 2",
									desc = L["TOOLTIP_AURAS_SPACING"],
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
									name = L["LABEL_AURAS_CHARGES"].." 2",
									desc = L["TOOLTIP_AURAS_CHARGE_SIZE"],
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
								ResetSecondaryLayout = {
									order = 10,
									type = "execute",
									--name = "|cFFFFCC00"..L["BUTTON_RESET_LAYOUT_SECONDARY"].."|r",
									--disabled = false,
									name = L["BUTTON_RESET_LAYOUT_SECONDARY"],
									func = function()
										layout.orientation.left = layoutDefaults.orientation.left
										layout.orientation.right = layoutDefaults.orientation.right
										layout.secondary.left.icon = layoutDefaults.secondary.left.icon
										layout.secondary.left.spacing = layoutDefaults.secondary.left.spacing
										layout.secondary.right.icon = layoutDefaults.secondary.right.icon
										layout.secondary.right.spacing = layoutDefaults.secondary.right.spacing
										layout.secondary.right.charges = layoutDefaults.secondary.right.charges
										res_options.args.layout.args.secondaryAuras.args.ResetSecondaryLayout.disabled = true
										res_options.args.layout.args.secondaryAuras.args.ResetSecondaryLayout.name = "|cFF666666"..L["BUTTON_RESET_LAYOUT_SECONDARY"].."|r"
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
	ACD:AddToBlizOptions("ShamanAuras Elemental Auras", L["LABEL_AURAS_ELEMENTAL"], "ShamanAuras")
	ACD:AddToBlizOptions("ShamanAuras Enhancement Auras", L["LABEL_AURAS_ENHANCEMENT"], "ShamanAuras")
	ACD:AddToBlizOptions("ShamanAuras Restoration Auras", L["LABEL_AURAS_RESTORATION"], "ShamanAuras")
	--ACD:AddToBlizOptions("ShamanAuras Settings", SETTINGS, "ShamanAuras")
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
		
		ele_options.args.general.disabled = false
		ele_options.args.bars.disabled = false
		ele_options.args.cooldowns.disabled = false
		ele_options.args.layout.disabled = false
		enh_options.args.general.disabled = true
		enh_options.args.bars.disabled = true
		enh_options.args.cooldowns.disabled = true
		enh_options.args.layout.disabled = true
		res_options.args.general.disabled = true
		res_options.args.bars.disabled = true
		res_options.args.cooldowns.disabled = true
		res_options.args.layout.disabled = true
	elseif (spec == 2) then
		CheckEnhancementDefaultValues(enh_options,'Cooldowns')
		CheckEnhancementDefaultValues(enh_options,'Maelstrom','All')
		CheckEnhancementDefaultValues(enh_options,'Cast','castBar')
		CheckEnhancementDefaultValues(enh_options,'Channel','channelBar')
		CheckEnhancementDefaultValues(enh_options,'Settings')
		CheckEnhancementDefaultValues(enh_options,'Primary')
		CheckEnhancementDefaultValues(enh_options,'Secondary')
		
		ele_options.args.general.disabled = true
		ele_options.args.bars.disabled = true
		ele_options.args.cooldowns.disabled = true
		ele_options.args.layout.disabled = true
		enh_options.args.general.disabled = false
		enh_options.args.bars.disabled = false
		enh_options.args.cooldowns.disabled = false
		enh_options.args.layout.disabled = false
		res_options.args.general.disabled = true
		res_options.args.bars.disabled = true
		res_options.args.cooldowns.disabled = true
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
		
		ele_options.args.general.disabled = true
		ele_options.args.bars.disabled = true
		ele_options.args.cooldowns.disabled = true
		ele_options.args.layout.disabled = true
		enh_options.args.general.disabled = true
		enh_options.args.bars.disabled = true
		enh_options.args.cooldowns.disabled = true
		enh_options.args.layout.disabled = true
		res_options.args.general.disabled = false
		res_options.args.bars.disabled = false
		res_options.args.cooldowns.disabled = false
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


