--[[----------------------------------------------------------
--	CodeNameBlaze, an ElvUI edit by Blazeflack @ tukui.org
--
--	This file contains changes/additions to the ElvUI Chat
----------------------------------------------------------]]--
local E, L, V, P, G, _ = unpack(ElvUI); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local CH = E:GetModule('Chat')
local CNB = E:GetModule('CodeNameBlaze')
local SELECTED_STRING = "|cffffffff>|r %s |cffffffff<|r"
local CreatedFrames = 0;

--Cache global variables
--Lua functions
local _G = _G
local time = time
local type, pairs = type, pairs
local format, strlen, gsub = string.format, strlen, string.gsub
local tinsert, tremove = tinsert, tremove
--WoW API / Variables
local hooksecurefunc = hooksecurefunc
local FCF_GetChatWindowInfo = FCF_GetChatWindowInfo
local FCF_GetCurrentChatFrameID = FCF_GetCurrentChatFrameID
local PanelTemplates_TabResize = PanelTemplates_TabResize
local BetterDate = BetterDate
local GetMouseFocus = GetMouseFocus
local GetRealmName = GetRealmName

--Global variables that we don't cache, list them here for mikk's FindGlobals script
-- GLOBALS: GeneralDockManager, CHAT_TIMESTAMP_FORMAT,  ElvCharacterDB
-- GLOBALS: ChatFrame_AddMessageEventFilter, AceGUIWidgetLSMlists

function CNB:SetSelectedTab()
	local selectedId = GeneralDockManager.selected:GetID()

	--Set/Remove brackets and set alpha of chat tabs
	for i=1, CreatedFrames do
		local tab = _G[format("ChatFrame%sTab", i)]
		if tab.isDocked then
			--Brackets
			if selectedId == tab:GetID() and E.db.CNB.chat.bracketSelectedTab then
				if tab.hasBracket ~= true then
					tab.text:SetText(format(SELECTED_STRING, (FCF_GetChatWindowInfo(tab:GetID()))))
					tab.hasBracket = true
				end
			else
				if tab.hasBracket == true then
					local tabText = tab.isTemporary and tab.origText or (FCF_GetChatWindowInfo(tab:GetID()))
					tab.text:SetText(tabText)
					tab.hasBracket = false
				end
			end
			--Alpha
			tab.SetAlpha = nil
			if selectedId == tab:GetID() or not E.db.CNB.chat.fadeChatTabs then
				tab:SetAlpha(1)
			else
				tab:SetAlpha(E.db.CNB.chat.fadedChatTabAlpha)
			end
			tab.SetAlpha = E.noop
		end

		--Prevent chat tabs changing width on each click.
		PanelTemplates_TabResize(tab, tab.isTemporary and 20 or 10, nil, nil, nil, tab.textWidth);
	end
end

function CNB:OpenTemporaryWindow()
	local chatID = FCF_GetCurrentChatFrameID()
	local tab = _G[format("ChatFrame%sTab", chatID)]
	tab.origText = (FCF_GetChatWindowInfo(tab:GetID()))
	CNB:SetSelectedTab()
end

function CNB:DelaySetSelectedTab()
	CNB:ScheduleTimer('SetSelectedTab', 1)
end

function CNB:SetTabWidth()
	for i=1, CreatedFrames do
		local tab = _G[format("ChatFrame%sTab", i)]
		PanelTemplates_TabResize(tab, tab.isTemporary and 20 or 10, nil, nil, nil, tab.textWidth);
	end
end

function CNB:StyleChat(frame)
	if frame.CNBstyled then return end

	local name = frame:GetName()
	local id = frame:GetID()
	local tab = _G[name..'Tab']
	
	--Store variables for each tab
	tab.isTemporary = frame.isTemporary
	tab.isDocked = frame.isDocked
	tab.SetAlpha = E.noop --Prevent ElvUI or WoW from changing alpha on the tab

	--Mark current selected tab on initial load and set alpha of chat tabs
	if GeneralDockManager.selected:GetID() == tab:GetID() then
		if not tab.isTemporary and E.db.CNB.chat.bracketSelectedTab then
			tab.text:SetText(format(SELECTED_STRING, tab.text:GetText()))
			tab.hasBracket = true
		end
		tab.SetAlpha = nil --Re-enable SetAlpha
		tab:SetAlpha(1)
		tab.SetAlpha = E.noop --Disable SetAlpha once more
	else
		tab.SetAlpha = nil
		if E.db.CNB.chat.fadeChatTabs then
			tab:SetAlpha(E.db.CNB.chat.fadedChatTabAlpha)
		else
			tab:SetAlpha(1)
		end
		tab.SetAlpha = E.noop
	end
	
	--Mark current selected tab if renamed
	hooksecurefunc(tab, "SetText", function(self)
		if self.isDocked and GeneralDockManager.selected:GetID() == self:GetID() and not self.isTemporary and E.db.CNB.chat.bracketSelectedTab then
			self.text:SetText(format(SELECTED_STRING, self.text:GetText()))
			self.hasBracket = true
		end
	end)
	
	--Prevent text from jumping from left to right when tab is clicked.
	hooksecurefunc(tab, "SetWidth", function(self)
		self.text:ClearAllPoints()
		self.text:SetPoint("CENTER", self, "CENTER", 0, -4)
	end)
	
	--Mark current selected tab when clicked
	tab:HookScript("OnClick", function()
		CNB:SetSelectedTab()
	end)
	
	--This usually taints, but I embed LibChatAnims to make sure it doesn't.
	frame.OldAddMessage = frame.AddMessage
	frame.AddMessage = CNB.AddMessage
	
	--Set chosen Copy Chat button alpha
	local copyButton = _G[format("CopyChatButton%d", id)]
	copyButton:SetAlpha(E.db.CNB.chat.copyChatButtonAlpha)
	copyButton:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
	copyButton:SetScript("OnLeave", function(self)
		if _G[self:GetParent():GetName().."TabText"]:IsShown() then
			self:SetAlpha(E.db.CNB.chat.copyChatButtonAlpha)
		else
			self:SetAlpha(0)
		end
	end)
	
	CreatedFrames = id
	frame.CNBstyled = true
end
hooksecurefunc(CH, "StyleChat", CNB.StyleChat)

--Set timestamp on all lines added to chat
function CNB:AddMessage(text, ...)
	if type(text) == "string" then
		local bColor = CNB['media'].HexBracketColor or 'B3B3B3'
		local tColor = CNB['media'].HexTextColor or 'B3B3B3'
		local colorTimestamp = E.db['CNB'] and E.db['CNB']['chat'] and E.db['CNB']['chat'].timestampColor
		local timeStamp

		if CHAT_TIMESTAMP_FORMAT ~= nil then
			timeStamp = BetterDate(CHAT_TIMESTAMP_FORMAT, time());
			text = text:gsub(timeStamp, '')
		end

		--Add Timestamps
		if (E.db.chat.timeStampFormat and E.db.chat.timeStampFormat ~= 'NONE') then
			timeStamp = BetterDate(E.db.chat.timeStampFormat, CH.timeOverride or time());
			timeStamp = timeStamp:gsub(' $', '') --Remove space at the end of the string
			if colorTimestamp then
				text = '|cff'..bColor..'[|r|cff'..tColor..timeStamp..'|r|cff'..bColor..'] |r'..text
			else
				text = '['..timeStamp..'] '..text
			end
		end

		CH.timeOverride = nil;
	end

	self.OldAddMessage(self, text, ...)
end

--Replace function to prevent it from setting timestamp
function CH:ConcatenateTimeStamp(msg)
	return msg
end

function CNB:ModifyChatTabs(frame, hook)	
	--Set chosen Copy Chat button alpha
	if frame.owner and frame.owner.button and GetMouseFocus() ~= frame.owner.button then
		frame.owner.button:SetAlpha(E.db.CNB.chat.copyChatButtonAlpha)
	end
end
hooksecurefunc(CH, "SetupChatTabs", CNB.ModifyChatTabs)

--Replace function in order to allow user to choose how many lines are saved in history
function CH:ChatEdit_AddHistory(editBox, line)
	if line:find("/rl") then return; end
	
	if ( strlen(line) > 0 ) then
		for i, text in pairs(ElvCharacterDB.ChatEditHistory) do
			if text == line then
				return
			end
		end

		tinsert(ElvCharacterDB.ChatEditHistory, #ElvCharacterDB.ChatEditHistory + 1, line)
		if #ElvCharacterDB.ChatEditHistory > E.db.CNB.chat.editboxhistory then
			for i=1,(#ElvCharacterDB.ChatEditHistory - E.db.CNB.chat.editboxhistory) do
				tremove(ElvCharacterDB.ChatEditHistory, 1)
			end
		end
	end
end

function CNB:ModifyChatTabs(override)
	--If "Force to Show" is not enabled then just stop here
	if not E.db.CNB.chat.forceShow then return end

	local fade = E.db.CNB.chat.fadeChatTabs
	local fadeAlpha = E.db.CNB.chat.fadedChatTabAlpha
	local showBelowAlpha = E.db.CNB.chat.forceShowBelowAlpha
	local showToAlpha = E.db.CNB.chat.forceShowToAlpha

	for i = 1, CreatedFrames do
		local tab = _G[format("ChatFrame%sTab", i)]
		local text = _G[format("ChatFrame%sTabText", i)]
		
		--If chat panel backdrop is hidden then force tab to show when flashing
		if E.db.chat.panelBackdrop ~= 'SHOWBOTH' then
			if tab.glow:IsShown() then
				CH:SetupChatTabs(tab, false)
			else
				CH:SetupChatTabs(tab, true)
			end
		end

		--If chat tab is faded then force it to show when flashing
		if i ~= GeneralDockManager.selected:GetID() then
			if tab.glow:IsShown() then
				tab.SetAlpha = nil
				if fade and fadeAlpha <= showBelowAlpha then
					tab:SetAlpha(showToAlpha)
				else
					tab:SetAlpha(fadeAlpha)
				end
				tab.SetAlpha = E.noop
			end
		end
	end
end
hooksecurefunc(CH, "PositionChat", CNB.ModifyChatTabs)

--From Tukui
function CNB:RemoveCurrentRealmName(self, msg, author, ...)
	local realmName = gsub(GetRealmName(), " ", "")
	
	if msg and msg:find("-" .. realmName) then
		return false, gsub(msg, "%-"..realmName, ""), author, ...
	end
end

function CNB:InitializeChat()
	--Bracket selected chat tab and set correct width
	hooksecurefunc("FCF_OpenNewWindow", CNB.DelaySetSelectedTab)
	hooksecurefunc("FCF_OpenTemporaryWindow", CNB.OpenTemporaryWindow)
	hooksecurefunc("FCFDockOverflowListButton_OnClick", CNB.SetSelectedTab)
	hooksecurefunc("FCF_Close", CNB.SetSelectedTab)
	hooksecurefunc("FCF_DockUpdate", CNB.SetTabWidth)
	
	--Strip realm name from system messages
	ChatFrame_AddMessageEventFilter("CHAT_MSG_SYSTEM", CNB.RemoveCurrentRealmName)
end
hooksecurefunc(CH, "Initialize", CNB.InitializeChat)

--Chat options
local function ChatOptions()
	E.Options.args.CNB.args.config.args.chat = {
		order = 1,
		type = 'group',
		name = L['Chat'],
		args = {
			header = {
				order = 1,
				type = "header",
				name = CNB:ColorStr(L['Chat']),
			},
			general = {
				order = 2,
				type = 'group',
				name = L['General'],
				guiInline = true,
				args = {
					editboxFont = {
						order = 1,
						type = "select",
						dialogControl = 'LSM30_Font',
						name = L['Editbox Font'],
						desc = L['Select which font to use for the chat editbox'],
						values = AceGUIWidgetLSMlists.font,
						get = function(info) return E.db.CNB.chat.editboxFont end,
						set = function(info, value) E.db.CNB.chat.editboxFont = value; CNB:UpdateBlizzardFonts(); end,
					},
					editboxFontSize = {
						order = 2,
						type = 'range',
						name = L['Editbox Font Size'],
						min = 6, max = 20, step = 1,
						get = function(info) return E.db.CNB.chat.editboxFontSize end,
						set = function(info, value)	E.db.CNB.chat.editboxFontSize = value; CNB:UpdateBlizzardFonts(); end,
					},
					spacer = {
						order = 3,
						type = 'description',
						name = '',
					},
					editboxhistory = {
						order = 4,
						type = 'range',
						name = L['Chat Editbox History'],
						desc = L['Amount of messages to save in order to cycle through previously sent messages (Alt+Up/Down). Set to 0 to disable.'],
						min = 0, max = 20, step = 1,
						get = function(info) return E.db.CNB.chat.editboxhistory end,
						set = function(info, value)	E.db.CNB.chat.editboxhistory = value; end,
					},
					copyalpha = {
						order = 5,
						type = 'range',
						name = L['Copy Chat Button Alpha'],
						desc = L['Alpha of copy chat button until mouseover.'],
						min = 0, max = 1, step = 0.05,
						get = function(info) return E.db.CNB.chat.copyChatButtonAlpha end,
						set = function(info, value) E.db.CNB.chat.copyChatButtonAlpha = value;
							for i = 1, CreatedFrames do
								local copyButton = _G[format("CopyChatButton%d", i)]
								copyButton:SetAlpha(value)
							end
						end,
					},
				},
			},
			chattabs = {
				order = 3,
				type = 'group',
				name = L['Chat Tabs'],
				guiInline = true,
				args = {
					brackets = {
						order = 1,
						type = 'toggle',
						name = L['Bracket Selected Tab'],
						desc = L['Encase the selected chat tab in > < brackets.'],
						get = function(info) return E.db.CNB.chat.bracketSelectedTab end,
						set = function(info, value) E.db.CNB.chat.bracketSelectedTab = value; CNB:SetSelectedTab(); end,
					},
					fade = {
						order = 2,
						type = 'toggle',
						name = L['Fade Chat Tabs'],
						desc = L['Fade out chat tabs except the currently selected chat tab.'],
						get = function(info) return E.db.CNB.chat.fadeChatTabs end,
						set = function(info, value) E.db.CNB.chat.fadeChatTabs = value; CNB:SetSelectedTab(); end,
					},
					fadeAlpha = {
						order = 3,
						type = 'range',
						name = L['Chat Tab Alpha'],
						desc = L['Alpha of faded chat tabs.'],
						min = 0, max = 1, step = 0.05,
						get = function(info) return E.db.CNB.chat.fadedChatTabAlpha end,
						set = function(info, value) E.db.CNB.chat.fadedChatTabAlpha = value; CNB:SetSelectedTab(); end,
						disabled = function() return not E.db.CNB.chat.fadeChatTabs end,
					},
					spacer = {
						order = 4,
						type = 'description',
						name = '',
					},
					forceShow = {
						order = 5,
						type = 'toggle',
						name = L['Force to Show'],
						desc = L['Force a tab to show when it is flashing. This works both for when chat panel backdrop is hidden and when chat tab is faded.'],
						get = function(info) return E.db.CNB.chat.forceShow end,
						set = function(info, value) E.db.CNB.chat.forceShow = value; CNB:SetSelectedTab(); end,
					},
					forceShowBelowAlpha = {
						order = 6,
						type = 'range',
						name = L['Force Show Threshold'],
						desc = L['Threshold before a faded chat tab is forced to show. If a faded chat tab alpha is less than or equal to this value then it will be forced to show.'],
						min = 0, max = 1, step = 0.05,
						get = function(info) return E.db.CNB.chat.forceShowBelowAlpha end,
						set = function(info, value) E.db.CNB.chat.forceShowBelowAlpha = value; end,
						disabled = function() return not E.db.CNB.chat.forceShow end,
					},
					forceShowToAlpha = {
						order = 7,
						type = 'range',
						name = L['Force Show Alpha'],
						desc = L['Alpha of a chat tab when it is forced to show.'],
						min = 0, max = 1, step = 0.05,
						get = function(info) return E.db.CNB.chat.forceShowToAlpha end,
						set = function(info, value) E.db.CNB.chat.forceShowToAlpha = value; end,
						disabled = function() return not E.db.CNB.chat.forceShow end,
					},
				},
			},
			separators = {
				order = 4,
				type = 'group',
				name = L['Chat Separators'],
				guiInline = true,
				args = {
					chatTabSeparator = {
						order = 1,
						type = 'select',
						name = L['Chat Tab Separators'],
						desc = L['Add a thin black line below chat tabs to separate them from chat messages.'],
						get = function(info) return E.db.CNB.chat.chatTabSeparator end,
						set = function(info, value) E.db.CNB.chat.chatTabSeparator = value; CNB:ToggleChatSeparators(); end,
						values = {
							['HIDEBOTH'] = L['Hide Both'],
							['SHOWBOTH'] = L['Show Both'],
							['LEFTONLY'] = L['Left Only'],
							['RIGHTONLY'] = L['Right Only'],
						},
					},
					chatDataSeparator = {
						order = 2,
						type = 'select',
						name = L['Chat Datatext Separators'],
						desc = L['Add a thin black line above chat datatexts to separate them from chat messages.'],
						get = function(info) return E.db.CNB.chat.chatDataSeparator end,
						set = function(info, value) E.db.CNB.chat.chatDataSeparator = value; CNB:ToggleChatSeparators(); end,
						values = {
							['HIDEBOTH'] = L['Hide Both'],
							['SHOWBOTH'] = L['Show Both'],
							['LEFTONLY'] = L['Left Only'],
							['RIGHTONLY'] = L['Right Only'],
						},
					},
				},
			},
			timestamps = {
				order = 5,
				type = 'group',
				name = L['Timestamp Colors'],
				guiInline = true,
				args = {
					timestampColor = {
						order = 1,
						type = 'toggle',
						name = L['Use Custom Color'],
						desc = L['Set custom colors on timestamp text and brackets. Timestamps will use the color of the message if this is disabled.'],
						get = function(info) return E.db.CNB.chat.timestampColor end,
						set = function(info, value) E.db.CNB.chat.timestampColor = value; end,
					},
					textColor = {
						type = "color",
						order = 2,
						name = L["Timestamp Text Color"],
						hasAlpha = false,
						disabled = function() return (E.db.chat.timeStampFormat == 'NONE' or not E.db.CNB.chat.timestampColor) end,
						get = function(info)
							local t = E.db.CNB.chat[ info[#info] ]
							return t.r, t.g, t.b, t.a
						end,
						set = function(info, r, g, b)
							E.db.CNB.chat[ info[#info] ] = {}
							local t = E.db.CNB.chat[ info[#info] ]
							t.r, t.g, t.b = r, g, b
							CNB:UpdateMedia()
						end,
					},
					bracketColor = {
						type = "color",
						order = 3,
						name = L["Timestamp Bracket Color"],
						hasAlpha = false,
						disabled = function() return (E.db.chat.timeStampFormat == 'NONE' or not E.db.CNB.chat.timestampColor) end,
						get = function(info)
							local t = E.db.CNB.chat[ info[#info] ]
							return t.r, t.g, t.b, t.a
						end,
						set = function(info, r, g, b)
							E.db.CNB.chat[ info[#info] ] = {}
							local t = E.db.CNB.chat[ info[#info] ]
							t.r, t.g, t.b = r, g, b
							CNB:UpdateMedia()
						end,
					},
				},
			},
		},
	}
end
CNB.configs['chat'] = ChatOptions