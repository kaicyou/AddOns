local E, L, V, P, G, _ =  unpack(ElvUI);
local DT = E:GetModule('DataTexts')

local lastPanel
local displayString = "---"
local _hex
local Lang = GetLocale()
local red = "|cffc74040"
local orange = "|cffda8c4f"
local version = GetAddOnMetadata("ElvUI_LegionCurrencies", "Version")

local currencies = {1155, 1275, 1226, 1220, 1273, 1154, 1149, 1268}

V["ElvUI_LegionCurrencies"] = {
	-- misc
	["icons"] = true,
	-- currencies
	[1155] = true, -- Ancient Mana, 1155
	[1275] = true, -- Curious Coin, 1275
	[1226] = true, -- Nethershard, 1226
	[1220] = true, -- Order Resources, 1220
	[1273] = true, -- Seal of Broken Fate, 1273
	[1154] = true, -- Shadowy Coins, 1154
	[1149] = true, -- Sightless Eye, 1149
	[1268] = true, -- Timeworn Artifact, 1268
}

local function setupDB() 
	E.private["ElvUI_LegionCurrencies"] = E.private["ElvUI_LegionCurrencies"] or {}
end

local function ToggleOption(name)
	if ElvCharacterDB["ElvUI_LegionCurrencies"][name] then
		ElvCharacterDB["ElvUI_LegionCurrencies"][name] = false
	else
		ElvCharacterDB["ElvUI_LegionCurrencies"][name] = true
	end
end

local function GetOption(name)
	if ElvCharacterDB["ElvUI_LegionCurrencies"][name] then
		return ElvCharacterDB["ElvUI_LegionCurrencies"][name]
	end
end

local menu = {
	{ text = L["Legion Currencies Options"], isTitle = true , notCheckable = true },
	{ text = L["Show"]..' '..L["Ancient Mana"], checked = function() return GetOption(1155) end, func = function() ToggleOption(1155) end },
	{ text = L["Show"]..' '..L["Curious Coin"], checked = function() return GetOption(1275) end, func = function() ToggleOption(1275) end },
	{ text = L["Show"]..' '..L["Nethershard"], checked = function() return GetOption(1226) end, func = function() ToggleOption(1226) end },
	{ text = L["Show"]..' '..L["Order Resources"], checked = function() return GetOption(1220) end, func = function() ToggleOption(1220) end },
	{ text = L["Show"]..' '..L["Seal of Broken Fate"], checked = function() return GetOption(1273) end, func = function() ToggleOption(1273) end },
	{ text = L["Show"]..' '..L["Shadowy Coins"], checked = function() return GetOption(1154) end, func = function() ToggleOption(1154) end },
	{ text = L["Show"]..' '..L["Sightless Eye"], checked = function() return GetOption(1149) end, func = function() ToggleOption(1149) end },
	{ text = L["Show"]..' '..L["Timeworn Artifact"], checked = function() return GetOption(1268) end, func = function() ToggleOption(1268) end },
	{ text = " ", isTitle = true , notCheckable = true },
	{ text = L["Show icons"], checked = function() return GetOption("icons") end, func = function() ToggleOption("icons") end },
}
local menuFrame = CreateFrame("Frame", "ElvUI_LegionCurrenciesDatatextMenuFrame", E.UIParent, 'UIDropDownMenuTemplate')

local function ColorValue(cap, currency)
	local color, percent
	if cap ~= 0 then
		percent = currency * (100 / cap)
	else
		percent = 0
	end
	if percent < 70 then color = _hex
	elseif percent >= 70 and percent < 90 then color = orange
	elseif percent >= 90 then color = red end
	if cap == 0 then return _hex
	else return color end 
	return _hex
end

local function OnEvent(self, event, ...)
	lastPanel = self
	local _text = "---"
	if not _hex then return end
	for i = 1, #(currencies) do
		if i == 1 then displayString = '' end
		local index = currencies[i]
		local name, count, icon, earnedThisWeek, weeklyMax, totalMax, isDiscovered = GetCurrencyInfo(index)
		if isDiscovered then
			if(i ~= 1) then _text = "  " else _text = "" end
			local texture = format('|T%s:14:14:0:0:64:64:4:60:4:60|t', icon)
			if index == 1155 and GetOption(1155) then
				local str
				if GetOption("icons") then
					str = tostring(_text..texture..":"..ColorValue(totalMax, count)..count.."|r")
				else
					words = { strsplit(" ", name) }
					for _, word in ipairs(words) do _text = _text..string.sub(word,1,1) end
					str = tostring(_text..":"..ColorValue(totalMax, count)..count.."|r")
				end
				displayString = displayString..str
			end
			if index == 1275 and GetOption(1275) then
				local str
				if GetOption("icons") then
					str = tostring(_text..texture..":"..ColorValue(totalMax, count)..count.."|r")
				else
					words = { strsplit(" ", name) }
					for _, word in ipairs(words) do _text = _text..string.sub(word,1,1) end
					str = tostring(_text..":"..ColorValue(totalMax, count)..count.."|r")
				end
				displayString = displayString..str
			end
			if index == 1226 and GetOption(1226) then
				local str
				if GetOption("icons") then
					str = tostring(_text..texture..":"..ColorValue(totalMax, count)..count.."|r")
				else
					words = { strsplit(" ", name) }
					for _, word in ipairs(words) do _text = _text..string.sub(word,1,1) end
					str = tostring(_text..":"..ColorValue(totalMax, count)..count.."|r")
				end
				displayString = displayString..str
			end
			if index == 1220 and GetOption(1220) then
				local str
				if GetOption("icons") then
					str = tostring(_text..texture..":"..ColorValue(totalMax, count)..count.."|r")
				else
					words = { strsplit(" ", name) }
					for _, word in ipairs(words) do _text = _text..string.sub(word,1,1) end
					str = tostring(_text..":"..ColorValue(totalMax, count)..count.."|r")
				end
				displayString = displayString..str
			end
			if index == 1273 and GetOption(1273) then
				local str
				if GetOption("icons") then
					str = tostring(_text..texture..":"..ColorValue(totalMax, count)..count.."|r")
				else
					words = { strsplit(" ", name) }
					for _, word in ipairs(words) do _text = _text..string.sub(word,1,1) end
					str = tostring(_text..":"..ColorValue(totalMax, count)..count.."|r")
				end
				displayString = displayString..str
			end
			if index == 1154 and GetOption(1154) then
				local str
				if GetOption("icons") then
					str = tostring(_text..texture..":"..ColorValue(totalMax, count)..count.."|r")
				else
					words = { strsplit(" ", name) }
					for _, word in ipairs(words) do _text = _text..string.sub(word,1,1) end
					str = tostring(_text..":"..ColorValue(totalMax, count)..count.."|r")
				end
				displayString = displayString..str
			end
			if index == 1149 and GetOption(1149) then
				local str
				if GetOption("icons") then
					str = tostring(_text..texture..":"..ColorValue(totalMax, count)..count.."|r")
				else
					words = { strsplit(" ", name) }
					for _, word in ipairs(words) do _text = _text..string.sub(word,1,1) end
					str = tostring(_text..":"..ColorValue(totalMax, count)..count.."|r")
				end
				displayString = displayString..str
			end
			if index == 1268 and GetOption(1268) then
				local str
				if GetOption("icons") then
					str = tostring(_text..texture..":"..ColorValue(totalMax, count)..count.."|r")
				else
					words = { strsplit(" ", name) }
					for _, word in ipairs(words) do _text = _text..string.sub(word,1,1) end
					str = tostring(_text..":"..ColorValue(totalMax, count)..count.."|r")
				end
				displayString = displayString..str
			end
		end
	end	
	if self then
		if displayString == '' or (not GetOption(1155) and not GetOption(1275) and not GetOption(1226) and not GetOption(1220) and not GetOption(1273) and not GetOption(1154) and not GetOption(1149) and not GetOption(1268)) then 
			displayString = tostring("ElvUI ".._hex..L["Legion"].." "..L["Currencies"].."|r") end
		self.text:SetFormattedText(displayString)
	end
end

local function getCurinfo(curID)
	local Name, Amount, Icon, WeeklyEarned, WeeklyMax, TotalMax, IsDiscovered = GetCurrencyInfo(curID)
	return {Name, Icon, Amount, WeeklyEarned, WeeklyMax, TotalMax, IsDiscovered}
end

local function OnEnter(self)
	local r1, g1, b1, r2, g2, b2 = HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b;
	DT:SetupTooltip(self)
	if UnitLevel("player") >= 100 then
		DT.tooltip:AddDoubleLine(L["Right-Click"]..":", L["Datatext Options Menu"], r1, g1, b1, r2, g2, b2)
		DT.tooltip:Show()
	else
		DT.tooltip:Hide()
	end
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
