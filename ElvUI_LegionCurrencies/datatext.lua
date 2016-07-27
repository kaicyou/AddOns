local E, L, V, P, G, _ =  unpack(ElvUI);
local DT = E:GetModule('DataTexts')

local lastPanel
local displayString = "---"
local _hex
local version = GetAddOnMetadata("ElvUI_LegionCurrencies", "Version")
local red = "|cffc74040"
local orange = "|cffda8c4f"
--local dhgreen = "|cff28d317"
local Currencies = {1155, 1275, 1226, 1220, 1273, 1154, 1149, 1268}
local login = false

V["LegionCurrencies"] = {
	["AM"] = true, -- Ancient Mana, 1155
	["CC"] = true, -- Curious Coin, 1275
	["NS"] = true, -- Nethershard, 1226
	["OR"] = true, -- Order Resources, 1220
	["SoBF"] = true, -- Seal of Broken Fate, 1273
	["SC"] = true, -- Shadowy Coins, 1154
	["SE"] = true, -- Sightless Eye, 1149
	["TA"] = true, -- Timeworn Artifact, 1268
	["Icons"] = true
}

local function setupDB() 
	E.private["LegionCurrencies"] = E.private["LegionCurrencies"] or {}
--	E.private["LegionCurrencies"]["AC"]    = true or false
--	E.private["LegionCurrencies"]["AF"]    = true or false
--	E.private["LegionCurrencies"]["DIC"]   = true or false
--	E.private["LegionCurrencies"]["GR"]    = true or false
--	E.private["LegionCurrencies"]["Oil"]   = true or false
--	E.private["LegionCurrencies"]["SoTF"]  = true or false
--	E.private["LegionCurrencies"]["SoIF"]  = true or false
--	E.private["LegionCurrencies"]["VR"]    = true or false
--	E.private["LegionCurrencies"]["TB"]    = true or false
--	E.private["LegionCurrencies"]["Icons"] = true or false
--	E.private["LegionCurrencies"]["AC"]    = E.private["LegionCurrencies"]["AC"] or true
--	E.private["LegionCurrencies"]["AF"]    = E.private["LegionCurrencies"]["AF"] or true
--	E.private["LegionCurrencies"]["DIC"]   = E.private["LegionCurrencies"]["DIC"] or true
--	E.private["LegionCurrencies"]["GR"]    = E.private["LegionCurrencies"]["GR"] or true
--	E.private["LegionCurrencies"]["Oil"]   = E.private["LegionCurrencies"]["Oil"] or true
--	E.private["LegionCurrencies"]["SoTF"]  = E.private["LegionCurrencies"]["SoTF"] or true
--	E.private["LegionCurrencies"]["SoIF"]  = E.private["LegionCurrencies"]["SoIF"] or true
--	E.private["LegionCurrencies"]["VR"]    = E.private["LegionCurrencies"]["VR"] or true
--	E.private["LegionCurrencies"]["TB"]    = E.private["LegionCurrencies"]["TB"] or true
--	E.private["LegionCurrencies"]["Icons"] = E.private["LegionCurrencies"]["Icons"] or true
end

local function ToggleOption(name)
	if E.private["LegionCurrencies"][name] then
		E.private["LegionCurrencies"][name] = false
	else
		E.private["LegionCurrencies"][name] = true
	end
end

local function GetOption(name)
	if E.private["LegionCurrencies"] then
		return E.private["LegionCurrencies"][name]
	end
end

local menu = {
	{ text = L["Legion Currencies Options"], isTitle = true , notCheckable = true },
	{ text = L["Show Ancient Mana"], checked = function() return GetOption('AM') end, func = function() ToggleOption('AM') end },
	{ text = L["Show Curious Coin"], checked = function() return GetOption('CC') end, func = function() ToggleOption('CC') end },
	{ text = L["Show Nethershard"], checked = function()  return GetOption('NS') end, func = function() ToggleOption('NS') end },
	{ text = L["Show Order Resources"], checked = function() return GetOption('OR') end, func = function() ToggleOption('OR') end },
	{ text = L["Show Seal of Broken Fate"], checked = function() return GetOption('SoBF') end, func = function() ToggleOption('SoBF') end },
	{ text = L["Show Shadowy Coins"], checked = function() return GetOption('SC') end, func = function() ToggleOption('SC') end },
	{ text = L["Show Sightless Eye"], checked = function() return GetOption('SE') end, func = function() ToggleOption('SE') end },
	{ text = L["Show Timeworn Artifact"], checked = function() return GetOption('TA') end, func = function() ToggleOption('TA') end },
	{ text = "  ", isTitle = true, notCheckable = true },
	{ text = L["Show icons"], checked = function() return GetOption('Icons') end, func = function() ToggleOption('Icons') end },
}

local menuFrame = CreateFrame("Frame", "LegionCurrenciesMenuFrame", E.UIParent, 'UIDropDownMenuTemplate')

local function getCurrenyCap(name)
	local cap = 0
		if name == L["Ancient Mana"] then cap = 500
	elseif name == L["Nethershard"] then cap = 2000
	elseif name == L["Seal of Broken Fate"] then cap = 10
	elseif name == L["Shadowy Coins"] then cap = 500
	elseif name == L["Sightless Eye"] then cap = 1000
	elseif name == L["Timeworn Artifact"] then cap = 1000
	else cap = 0
	end
	return cap
end

local function ColorValue(name, currency)
	local color, percent
	local cap = getCurrenyCap(name)
	if cap ~= 0 then
		percent = currency * (100 / cap)
	else
		percent = 0
	end
	
	if percent < 70 then color = _hex
	elseif percent >= 70 and percent < 90 then color = orange
	elseif percent >= 90 then color = red
	end

	if cap == 0 then return _hex
	else return color
	end
end

local function OnEvent(self, event, ...)
	setupDB()
	lastPanel = self
	
	local _text = "---"
	if not _hex then return end
	if UnitLevel("player") >= 100 then
		for i = 1, #(Currencies) do
			if i == 1 then 
				displayString = '' 
			end
			local index = Currencies[i]
			local name, count, icon, earnedThisWeek, weeklyMax, totalMax, isDiscovered = GetCurrencyInfo(index)
			if name and isDiscovered then
				if(i ~= 1) then _text = "  " else _text = "" end
				local texture = format('|T%s:14:14:0:0:64:64:4:60:4:60|t', icon)
				if name == L["Ancient Mana"] and GetOption("AM") then
					local str
					if not GetOption("Icons") then
						words = { strsplit(" ", name) }
						for _, word in ipairs(words) do _text = _text .. string.sub(word,1,1) end
						str = tostring(_text..":".._hex..count.."|r")
					elseif GetOption("Icons") then
						str = tostring(_text..texture..":"..ColorValue(name, count)..count.._hex.."|r")
					end
					displayString = displayString..str
				end
				if name == L["Curious Coin"] and GetOption("CC") then
					local str
					if not GetOption("Icons") then
						words = { strsplit(" ", name) }
						for _, word in ipairs(words) do _text = _text .. string.sub(word,1,1) end
						str = tostring(_text..":".._hex..count.."|r")
					elseif GetOption("Icons") then
						str = tostring(_text..texture..":"..ColorValue(name, count)..count.._hex.."|r")
					end
					displayString = displayString..str
				end
				if name == L["Nethershard"] and GetOption("NS") then
					local str
					if not GetOption("Icons") then
						words = { strsplit(" ", name) }
						for _, word in ipairs(words) do _text = _text .. string.sub(word,1,1) end
						str = tostring(_text..":".._hex..count.."|r")
					elseif GetOption("Icons") then
						str = tostring(_text..texture..":"..ColorValue(name, count)..count.._hex.."|r")
					end
					displayString = displayString..str
				end
				if name == L["Order Resources"] and GetOption("OR") then
					local str
					if not GetOption("Icons") then
						words = { strsplit(" ", name) }
						for _, word in ipairs(words) do _text = _text .. string.sub(word,1,1) end
						str = tostring(_text..":".._hex..count.."|r")
					elseif GetOption("Icons") then
						str = tostring(_text..texture..":"..ColorValue(name, count)..count.._hex.."|r")
					end
					displayString = displayString..str
				end
				if name == L["Seal of Broken Fate"] and GetOption("SoBF") then
					local str
					if not GetOption("Icons") then
						words = { strsplit(" ", name) }
						for _, word in ipairs(words) do _text = _text .. string.sub(word,1,1) end
						str = tostring(_text..":".._hex..count.."|r")
					elseif GetOption("Icons") then
						str = tostring(_text..texture..":"..ColorValue(name, count)..count.._hex.."|r")
					end
					displayString = displayString..str
				end
				if name == L["Shadowy Coins"] and GetOption("SC") then
					local str
					if not GetOption("Icons") then
						words = { strsplit(" ", name) }
						for _, word in ipairs(words) do _text = _text .. string.sub(word,1,1) end
						str = tostring(_text..":".._hex..count.."|r")
					elseif GetOption("Icons") then
						str = tostring(_text..texture..":"..ColorValue(name, count)..count.._hex.."|r")
					end
					displayString = displayString..str
				end
				if name == L["Sightless Eye"] and GetOption("SE") then
					local str
					if not GetOption("Icons") then
						words = { strsplit(" ", name) }
						for _, word in ipairs(words) do _text = _text .. string.sub(word,1,1) end
						str = tostring(_text..":".._hex..count.."|r")
					elseif GetOption("Icons") then
						str = tostring(_text..texture..":"..ColorValue(name, count)..count.._hex.."|r")
					end
					displayString = displayString..str
				end
				if name == L["Timeworn Artifact"] and GetOption("TA") then
					local str
					if not GetOption("Icons") then
						words = { strsplit(" ", name) }
						for _, word in ipairs(words) do _text = _text .. string.sub(word,1,1) end
						str = tostring(_text..":".._hex..count.."|r")
					elseif GetOption("Icons") then
						str = tostring(_text..texture..":"..ColorValue(name, count)..count.._hex.."|r")
					end
					displayString = displayString..str
				end
			end
		end
		if displayString == '' or (not GetOption(L["AM"]) and not GetOption(L["CC"]) and not GetOption(L["NS"]) and not GetOption(L["OR"]) and not GetOption(L["SoBF"]) and not GetOption(L["SC"]) and not GetOption(L["SE"]) and not GetOption(L["TA"])) then
			displayString = tostring("Legion |r".._hex..L["Currencies"].."|r")
		end	
	else
		displayString = tostring(_hex.."Legion "..L["Currencies"].."|r "..L["requires level"].." ".._hex.."100+|r")
	end
	if self then self.text:SetFormattedText(displayString) end
	displayString = "---"
end

local function OnEnter(self)
	local r1, g1, b1, r2, g2, b2 = HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b;
	DT:SetupTooltip(self)
	if UnitLevel("player") >= 100 then
		DT.tooltip:AddDoubleLine(L["Right-Click"]..":", L["Datatext Options Menu"], r1, g1, b1, r2, g2, b2)
		DT.tooltip:Show()
	else DT.tooltip:Hide() end
	if lastPanel ~= nil then
		OnEvent(lastPanel)
	end
end

local function OnClick(self, btn)
	if UnitLevel("player") >= 100 then
		if btn == "RightButton" then
			DT.tooltip:Hide();
			EasyMenu(menu, menuFrame, self, 0, 100, 'MENU', 3)
		end
	end
end

local function ValueColorUpdate(hex, r, g, b)
	_hex = hex
	if lastPanel ~= nil then
		OnEvent(lastPanel)
	end
end
E['valueColorUpdateFuncs'][ValueColorUpdate] = true

--[[
	DT:RegisterDatatext(name, events, eventFunc, updateFunc, clickFunc, onEnterFunc)

	name - name of the datatext (required)
	events - must be a table with string values of event names to register
	eventFunc - function that gets fired when an event gets triggered
	updateFunc - onUpdate script target function
	click - function to fire when clicking the datatext
	onEnterFunc - function to fire OnEnter
]]
DT:RegisterDatatext("Legion Currencies", {"PLAYER_LOGIN", "PLAYER_ENTERING_WORLD", "PLAYER_MONEY", "PLAYER_TRADE_MONEY", "TRADE_MONEY_CHANGED", "SPELLS_CHANGED"}, OnEvent, nil, OnClick, OnEnter) hooksecurefunc("BackpackTokenFrame_Update", function(...) OnEvent(lastPanel) end)
