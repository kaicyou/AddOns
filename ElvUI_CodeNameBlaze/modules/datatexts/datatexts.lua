--[[--------------------------------------------------------------
--	CodeNameBlaze, an ElvUI edit by Blazeflack @ tukui.org
--
--	This file contains changes/additions to the ElvUI Datatexts
--------------------------------------------------------------]]--
local E, L, V, P, G, _ = unpack(ElvUI); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local LO = E:GetModule('Layout')
local DT = E:GetModule('DataTexts')
local CNB = E:GetModule('CodeNameBlaze')

--Cache global variables
--Lua functions
local _G = _G
local pairs, type = pairs, type
--WoW API / Variables
local NONE = NONE

--Global variables that we don't cache, list them here for mikk's FindGlobals script
-- GLOBALS: LeftMiniPanel, Minimap

local PANEL_HEIGHT = 22;

function CNB:LoadDataTexts()
	local db = E.db.CNB.datatexts

	for panelName, panel in pairs(DT.RegisteredPanels) do
		for i=1, panel.numPoints do
			local pointIndex = DT.PointLocation[i]
			
			--Register Panel to Datatext
			for name, data in pairs(DT.RegisteredDataTexts) do
				for option, value in pairs(db.panels) do
					if value and type(value) == 'table' then
						if option == panelName and db.panels[option][pointIndex] and db.panels[option][pointIndex] == name then
							DT:AssignPanelToDataText(panel.dataPanels[pointIndex], data)
						end
					elseif value and type(value) == 'string' and value == name then
						if db.panels[option] == name and option == panelName then
							DT:AssignPanelToDataText(panel.dataPanels[pointIndex], data)
						end
					end
				end
			end
		end
	end
end
hooksecurefunc(DT, "LoadDataTexts", CNB.LoadDataTexts)

--Datatext Options
local function DatatextOptions()
	E.Options.args.CNB.args.config.args.datatexts = {
		order = 1,
		type = 'group',
		name = L['Datatexts'],
		args = {
			header = {
				order = 1,
				type = "header",
				name = CNB:ColorStr(L['Datatexts']),
			},
			general = {
				order = 2,
				type = 'group',
				name = L['General'],
				guiInline = true,
				args = {
					rightChatTabDatatextPanel = {
						order = 1,
						type = 'toggle',
						name = L['ChatTab Datatext Panel'],
						desc = L['Enable/Disable the right chat tab datatext panel.'],
						get = function(info) return E.db.CNB.datatexts.rightChatTabDatatextPanel end,
						set = function(info, value) E.db.CNB.datatexts.rightChatTabDatatextPanel = value; CNB:ToggleDataPanels() end,
					},
					bottomDatatextPanel = {
						order = 2,
						type = 'toggle',
						name = L['Bottom Datatext Panel'],
						desc = L['Enable/Disable the bottom datatext panel.'],
						get = function(info) return E.db.CNB.datatexts.bottomDatatextPanel end,
						set = function(info, value) E.db.CNB.datatexts.bottomDatatextPanel = value; CNB:ToggleDataPanels() end,
					},
					invisibleChatDataPanel = {
						order = 3,
						type = 'toggle',
						name = L['Hide Chat Datatext BG'],
						desc = L['Completely hides the background from left and right chat datatext panels, leaving only the datatext visible.'],
						get = function(info) return E.db.CNB.datatexts.invisibleChatDataPanel end,
						set = function(info, value)	E.db.CNB.datatexts.invisibleChatDataPanel = value; LO:SetDataPanelStyle() end,
					},
					leftMinimapPanelSize = {
						order = 4,
						type = 'range',
						name = L['Left MiniPanel Size'],
						desc = L['Allows you to change size of the left minimap datatext panel. The right panel will be re-sized accordingly. (Useful if you want to make room for a long datatext)'],
						get = function(info) return E.db.CNB.datatexts.leftMinimapPanelSize end,
						set = function(info, value)
							E.db.CNB.datatexts.leftMinimapPanelSize = value
							LeftMiniPanel:SetPoint('BOTTOMRIGHT', Minimap, 'BOTTOMLEFT', E.Spacing + value, -((E.PixelMode and 0 or 3) + PANEL_HEIGHT))
						end,
						min = 30, max = (E.db.general.minimap.size - 30), step = 1,
					},
				},
			},
			panels = {
				order = 3,
				type = 'group',
				name = L['Panels'],
				guiInline = true,
				args = {},
			},
		},
	}
	
	local datatexts = {}
	for name, _ in pairs(DT.RegisteredDataTexts) do
		datatexts[name] = name
	end
	datatexts[''] = NONE
	
	local table = E.Options.args.CNB.args.config.args.datatexts.args.panels.args
	local i = 0
	for pointLoc, tab in pairs(P.CNB.datatexts.panels) do
		i = i + 1
		if not _G[pointLoc] then table[pointLoc] = nil; return; end
		if type(tab) == 'table' then
			table[pointLoc] = {
				type = 'group',
				args = {},
				name = L[pointLoc] or pointLoc,
				guiInline = true,
				order = i,
			}			
			for option, value in pairs(tab) do
				table[pointLoc].args[option] = {
					type = 'select',
					name = L[option] or option:upper(),
					values = datatexts,
					get = function(info) return E.db.CNB.datatexts.panels[pointLoc][ info[#info] ] end,
					set = function(info, value) E.db.CNB.datatexts.panels[pointLoc][ info[#info] ] = value; DT:LoadDataTexts() end,									
				}
			end
		elseif type(tab) == 'string' then
			table[pointLoc] = {
				type = 'select',
				name = L[pointLoc] or pointLoc,
				values = datatexts,
				get = function(info) return E.db.CNB.datatexts.panels[pointLoc] end,
				set = function(info, value) E.db.CNB.datatexts.panels[pointLoc] = value; DT:LoadDataTexts() end,
			}						
		end
	end
end
CNB.configs['datatexts'] = DatatextOptions