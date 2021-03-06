local RaidAchFilter = LibStub("AceAddon-3.0"):NewAddon("RaidAchFilter", "AceConsole-3.0", "AceEvent-3.0")
local icon = LibStub("LibDBIcon-1.0")

-- DataBroker Entry
local LDB = LibStub("LibDataBroker-1.1"):NewDataObject("RaidAchievementFilter", {
	type = "launcher",
	label = "RaidAchievementFilter",
	icon = "Interface\\Icons\\Achievement_Dungeon_GloryoftheRaider",
	OnClick = function(self, button)
		if button == "RightButton" then
			InterfaceOptionsFrame_OpenToCategory("RaidAchievementFilter")
		else
			RaidAchFilter:Toggle()
		end
	end,
	OnTooltipShow = function(tt)
		tt:AddLine("RaidAchievementFilter")
		tt:AddLine("|cffffffff" .. "Click to Toggle, Right-Click for Options.")
	end,
})

-- Initialize
function RaidAchFilter:OnInitialize()
	self.db = LibStub("AceDB-3.0"):New("RAchF_DB", {
		profile = {
			minimap = {
				hide = false,
			},
		},
	})
	icon:Register("RaidAchieveFilter", LDB, self.db.profile.minimap)
	RaidAchFilter:RegisterOptions()
end


-- Creating Blizzard Options
function RaidAchFilter:RegisterOptions()
	local AceConfig = LibStub("AceConfig-3.0")
	AceConfig:RegisterOptionsTable("RaidAchievementFilter", {
		type = 'group',
		args = {
			togglebutton = {
				type = 'toggle',
				order = 1,
				name = "Show Minimap Icon",
				desc = "Show/hide minimap icon.",
				get = function()
					return not RaidAchFilter.db.profile.minimap.hide
				end,
				set = RaidAchFilter.ToggleLDBIcon,
			},
		},
	})
	LibStub("AceConfigDialog-3.0"):AddToBlizOptions("RaidAchievementFilter")
end

-- Toggle Minimap Icon
function RaidAchFilter:ToggleLDBIcon()
	RaidAchFilter.db.profile.minimap.hide = not RaidAchFilter.db.profile.minimap.hide
	if RaidAchFilter.db.profile.minimap.hide then
		icon:Hide("RaidAchieveFilter")
	else
		icon:Show("RaidAchieveFilter")
	end
end

--Slash Command
RaidAchFilter:RegisterChatCommand("rachf", "Toggle")

-- Toggle the Window
function RaidAchFilter:Toggle()
	local f = _G["RaidAch_Frame"]
	local fra = _G["AchievementFrame"]
	if not f then
		RaidAchFilter:Initialize(); RaidAchFilter:ShowAch(1); RaidAchFilter:ZoneChange()
		if fra then 
			if ( AchievementFrame:IsShown() ) and f then f:ClearAllPoints(); f:SetPoint("TOPLEFT",fra,"TOPRIGHT",4,0)end 
		end
	elseif f:IsVisible() then 
		f:Hide()
	else 
		f:Show()
		if fra then 
			if ( AchievementFrame:IsShown() ) and f then f:ClearAllPoints(); f:SetPoint("TOPLEFT",fra,"TOPRIGHT",4,0) end 
		end
	end
	
end

--Event When Achievement Earned
function RaidAchFilter:AchEarned(eventName, achID)
	local f = _G["RaidAch_Frame"]
	if f then
		for i = 1, #RAFdb.AchList do
			if RAFdb.AchList[i] == achID then RaidAchFilter:ShowAch(RAF_RID) end
		end
	end
end
RaidAchFilter:RegisterEvent("ACHIEVEMENT_EARNED", "AchEarned")

--Auto swap to instance you're in
function RaidAchFilter:ZoneChange()
	local f = _G["RaidAch_Frame"]
	if f then
		SetMapToCurrentZone()
		local mapID = GetCurrentMapAreaID()
		for i = 1, #RAFdb.MapID do
			if RAFdb.MapID[i] == mapID then 
				local id = i
				if id < 5 or id == 7 or id == 8 or (id > 9 and id < 14) then --Only LK Raids
					local dif = GetLegacyRaidDifficultyID()
					if dif == 2 or dif == 4 or dif == 6 then id = id+1; RaidAchFilter:ShowAch(id); break --25 Player
					else RaidAchFilter:ShowAch(id); break end --10 Player
				else
					RaidAchFilter:ShowAch(id); break
				end
			end
		end
	end
end
RaidAchFilter:RegisterEvent("ZONE_CHANGED_NEW_AREA", "ZoneChange")

-- Main Window
function RaidAchFilter:Initialize()
	local fra = CreateFrame("Frame", "RaidAch_Frame", UIParent)
	fra:SetFrameStrata("DIALOG")
	fra:SetMovable(true); fra:EnableMouse(true)
	fra:RegisterForDrag("LeftButton")
	fra:SetScript("OnDragStart", fra.StartMoving)
	fra:SetScript("OnDragStop", fra.StopMovingOrSizing)
	fra:SetPoint("CENTER")
	fra:SetSize(536, 588)
	tinsert(UISpecialFrames,"RaidAch_Frame")
	local tex = fra:CreateTexture("ARTWORK")
	tex:SetAllPoints()
	tex:SetTexture("Interface\\AchievementFrame\\UI-Achievement-AchievementBackground", "BACKGROUND")
	tex:SetTexCoord(0, 1, 0, 0.5)
	tex:SetPoint("TOPLEFT", fra, 2, -2); tex:SetPoint("BOTTOMRIGHT", fra, -2, 2)
	tex:SetAlpha(0.8)
	fra:Show()
	local scrFra = CreateFrame("ScrollFrame", "RaidAch_ScrollFrame", fra)
	scrFra:SetPoint("TOPLEFT", 8, -55) 
	scrFra:SetPoint("BOTTOMRIGHT", -5, 10) 
	fra.scrollframe = scrFra
	scrFra:SetToplevel(true)
	local scrBar = CreateFrame("Slider", "RaidAch_Slider", scrFra, "UIPanelScrollBarTemplate") 
	scrBar:SetPoint("TOPLEFT", fra, "TOPRIGHT", -18, -18) 
	scrBar:SetPoint("BOTTOMLEFT", fra, "BOTTOMRIGHT", -18, 18) 
	scrBar:SetWidth(16) 
	scrBar:SetMinMaxValues(1, 100) 
	scrBar:SetValueStep(50) 
	scrBar.scrollStep = 50
	scrBar:SetValue(0)
	scrBar:SetScript("OnValueChanged", 
		function (self, value) self:GetParent():SetVerticalScroll(value) end) 
	local scrTex = scrBar:CreateTexture(nil, "BACKGROUND") 
	scrTex:SetAllPoints(scrBar) 
	scrTex:SetColorTexture(0, 0, 0, 0.5) 
	fra.scrollbar = scrBar 
	scrFra:EnableMouseWheel(true)
	scrFra:SetScript("OnMouseWheel",
		function(self, delta) 
			local x = scrBar:GetValue(); local y = scrBar:GetValueStep()*3
			if #RAFdb.AchList > 7 then -- Only work if scrollbar is up
				if delta == 1 then scrBar:SetValue(x-y)
				else scrBar:SetValue(x+y) end 
			end
		end)
	local content = CreateFrame("Frame", "RaidAch_Content", scrFra) 
	content:SetSize(128, 128) 
	scrFra.content = content 
	scrFra:SetScrollChild(content)
	local backdrop = { -- Border
	  edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
	  tile = false, tileSize = 8, edgeSize = 8,
	  insets = { left = 2, right = 2, top = 2, bottom = 2 }
	}
	fra:SetBackdrop(backdrop)
	fra:SetBackdropBorderColor(1, 0.675, 0.125, 1)
	local ttl = fra:CreateFontString("$parent_HeaderText","OVERLAY","GameFontNormal") -- Header Text
	ttl:SetPoint("TOPLEFT",fra,"TOPLEFT",9,-6)
	ttl:SetText("Raid Achievement Filter")
	ttl:Show()
	local btn = CreateFrame("BUTTON", "$parent_Close", fra, "UIPanelCloseButton") -- Close Button
	btn:SetPoint("TOPRIGHT", fra, "TOPRIGHT", -13, 3)
	btn:SetAlpha(1); btn:Show(); btn:Enable()
	local btn2 = CreateFrame("CheckButton", "$parent_HideAccount", fra, "ChatConfigCheckButtonTemplate") -- Hide Account Completed
	btn2:SetPoint("TOPRIGHT", -230, -10)
	_G[btn2:GetName().."Text"]:SetText("Hide Account Completed")
	btn2:RegisterForClicks("AnyUp");	btn2:SetScript("OnClick", function (self, button, down) 
	  _G['RaidAch_Frame_HideCharacter']:SetChecked(false); if RAF_RID then RaidAchFilter:ShowAch(RAF_RID) end
	end)
	local btn3 = CreateFrame("CheckButton", "$parent_HideCharacter", fra, "ChatConfigCheckButtonTemplate") -- Hide Character Completed
	btn3:SetPoint("TOPRIGHT", -230, -27)
	_G[btn3:GetName().."Text"]:SetText("Hide Character Completed")
	btn3:RegisterForClicks("AnyUp");
	btn3:SetScript("OnClick", function (self, button, down) 
	  _G['RaidAch_Frame_HideAccount']:SetChecked(false); if RAF_RID then RaidAchFilter:ShowAch(RAF_RID) end
	end)
	-- Raids list dropdown
	local dropDown = CreateFrame("Button", "RaidAch_Dropdown", fra, "UIDropDownMenuTemplate")
	UIDropDownMenu_Initialize(dropDown)
	UIDropDownMenu_SetText(dropDown, "Filter by Instance")
	UIDropDownMenu_JustifyText(dropDown, "LEFT") 
	dropDown:SetPoint("TOPLEFT", fra, "TOPLEFT", -10, -20)
	UIDropDownMenu_SetWidth(dropDown, 220)	dropDown:SetAlpha(1)
	dropDown:SetScript("OnClick", function() 
		ToggleDropDownMenu(1, nil, dropDown, dropDown, 16, 5)
	end)
	dropDown.HideMenu = function()
	    if UIDROPDOWNMENU_OPEN_MENU == dropDown then
		CloseDropDownMenus()
	    end
	end

	local info = {}
	dropDown.initialize = function(self, level)
	    if not level then return end
		wipe(info)
		if level == 1 then
			info.isTitle = 1
			info.notCheckable = 1
			info.keepShownOnClick = false
			info.text = "Filter by Instance"
			UIDropDownMenu_AddButton(info, level)
			info.disabled = nil
			info.isTitle = nil
			info.notCheckable = true
			info.hasArrow = true
			info.text = "Raids"
			info.value = "topmenu1"
			UIDropDownMenu_AddButton(info, level)
			info.text = "Dungeons"
			info.value = "topmenu2"
			UIDropDownMenu_AddButton(info, level)
			info.text = "Scenarios"
			info.value = "topmenu3"
			UIDropDownMenu_AddButton(info, level)
			-- Close menu item
			info.hasArrow     = nil
			info.value        = nil
			info.notCheckable = 1
			info.text         = CLOSE
			info.func         = self.HideMenu
			UIDropDownMenu_AddButton(info, level)
		elseif level == 2 then
			info.disabled = nil
			info.isTitle = nil
			info.notCheckable = true
			info.hasArrow = true

			if UIDROPDOWNMENU_MENU_VALUE == "topmenu1" then
				info.text = "Lich King"
				info.value = "submenua1"
				UIDropDownMenu_AddButton(info, level)
				info.text = "Cataclysm"
				info.value = "submenua2"
				UIDropDownMenu_AddButton(info, level)
				info.text = "Mists of Pandaria"
				info.value = "submenua3"
				UIDropDownMenu_AddButton(info, level)
				info.text = "Warlords of Draenor"
				info.value = "submenua4"
				UIDropDownMenu_AddButton(info, level)
				info.text = "Legion"
				info.value = "submenua5"
				UIDropDownMenu_AddButton(info, level)
			elseif UIDROPDOWNMENU_MENU_VALUE == "topmenu2" then
				info.text = "Lich King"
				info.value = "submenub1"
				UIDropDownMenu_AddButton(info, level)
				info.text = "Cataclysm"
				info.value = "submenub2"
				UIDropDownMenu_AddButton(info, level)
				info.text = "Mists of Pandaria"
				info.value = "submenub3"
				UIDropDownMenu_AddButton(info, level)
				info.text = "Warlords of Draenor"
				info.value = "submenub4"
				UIDropDownMenu_AddButton(info, level)
				info.text = "Legion"
				info.value = "submenub5"
				UIDropDownMenu_AddButton(info, level)
			elseif UIDROPDOWNMENU_MENU_VALUE == "topmenu3" then
				for i = 92, 106 do --Scenarios!
				  info.value = i
				  info.checked = false
				  info.hasArrow = false
				  info.notCheckable = nil
				  info.text = RAFdb.MapName[i]
				  info.func = function() 
					RaidAchFilter:ShowAch(i); ToggleDropDownMenu(1, nil, dropDown);
				  end
				  UIDropDownMenu_AddButton(info, level)
				end
			end
		 elseif level == 3 then
			-- Raids!
			if UIDROPDOWNMENU_MENU_VALUE == "submenua1" then
				for i = 1, 13 do
				  info.value = i
				  info.checked = false
				  info.text = RAFdb.MapName[i]
				  info.func = function() 
					RaidAchFilter:ShowAch(i); ToggleDropDownMenu(1, nil, dropDown);
				  end
				  UIDropDownMenu_AddButton(info, level)
				end
			elseif UIDROPDOWNMENU_MENU_VALUE == "submenua2" then
				for i = 14, 18 do
				  info.value = i
				  info.checked = false
				  info.text = RAFdb.MapName[i]
				  info.func = function() 
					RaidAchFilter:ShowAch(i); ToggleDropDownMenu(1, nil, dropDown);
				  end
				  UIDropDownMenu_AddButton(info, level)
				end
			elseif UIDROPDOWNMENU_MENU_VALUE == "submenua3" then
				for i = 19, 23 do
				  info.value = i
				  info.checked = false
				  info.text = RAFdb.MapName[i]
				  info.func = function() 
					RaidAchFilter:ShowAch(i); ToggleDropDownMenu(1, nil, dropDown);
				  end
				  UIDropDownMenu_AddButton(info, level)
				end
			elseif UIDROPDOWNMENU_MENU_VALUE == "submenua4" then
				for i = 24, 26 do
				  info.value = i
				  info.checked = false
				  info.text = RAFdb.MapName[i]
				  info.func = function() 
					RaidAchFilter:ShowAch(i); ToggleDropDownMenu(1, nil, dropDown);
				  end
				  UIDropDownMenu_AddButton(info, level)
				end
			elseif UIDROPDOWNMENU_MENU_VALUE == "submenua5" then
				for i = 27, 31 do
				  info.value = i
				  info.checked = false
				  info.text = RAFdb.MapName[i]
				  info.func = function() 
					RaidAchFilter:ShowAch(i); ToggleDropDownMenu(1, nil, dropDown);
				  end
				  UIDropDownMenu_AddButton(info, level)
				end
			-- Dungeons!
			elseif UIDROPDOWNMENU_MENU_VALUE == "submenub1" then
				for i = 32, 47 do
					  info.value = i
					  info.checked = false
					  info.text = RAFdb.MapName[i]
					  info.func = function() 
					    RaidAchFilter:ShowAch(i); ToggleDropDownMenu(1, nil, dropDown);
					  end
					  UIDropDownMenu_AddButton(info, level)
				end
			elseif UIDROPDOWNMENU_MENU_VALUE == "submenub2" then
				for i = 48, 61 do
					  info.value = i
					  info.checked = false
					  info.text = RAFdb.MapName[i]
					  info.func = function() 
					    RaidAchFilter:ShowAch(i); ToggleDropDownMenu(1, nil, dropDown);
					  end
					  UIDropDownMenu_AddButton(info, level)
				end
			elseif UIDROPDOWNMENU_MENU_VALUE == "submenub3" then
				for i = 62, 70 do
					  info.value = i
					  info.checked = false
					  info.text = RAFdb.MapName[i]
					  info.func = function() 
					    RaidAchFilter:ShowAch(i); ToggleDropDownMenu(1, nil, dropDown);
					  end
					  UIDropDownMenu_AddButton(info, level)
				end
			elseif UIDROPDOWNMENU_MENU_VALUE == "submenub4" then
				for i = 71, 78 do
					  info.value = i
					  info.checked = false
					  info.text = RAFdb.MapName[i]
					  info.func = function() 
					    RaidAchFilter:ShowAch(i); ToggleDropDownMenu(1, nil, dropDown);
					  end
					  UIDropDownMenu_AddButton(info, level)
				end
			elseif UIDROPDOWNMENU_MENU_VALUE == "submenub5" then
				for i = 79, 91 do
					  info.value = i
					  info.checked = false
					  info.text = RAFdb.MapName[i]
					  info.func = function() 
					    RaidAchFilter:ShowAch(i); ToggleDropDownMenu(1, nil, dropDown);
					  end
					  UIDropDownMenu_AddButton(info, level)
				end
			end
	     end
	 end
	--Set default when first opened
	UIDropDownMenu_Initialize(dropDown)
	UIDropDownMenu_SetSelectedValue(dropDown, 1)
	UIDropDownMenu_SetText(dropDown, "Filter by Instance")

end

function RaidAchFilter:AchAdd(fraID, ach_ID, indent_num)
	local IDNumber, Name, Points, Completed, Month, Day, Year, Description, Flags, Image, RewardText, isGuildAch, earnedByMe, earnedBy = GetAchievementInfo(ach_ID)
	local frame = _G["RaidAch_Content"]
	local fra = _G["achFra"..fraID]
	local prevFra = _G["achFra"..fraID-1]
	fr_name = "achFra"..fraID
	if not fra then 
		fra = CreateFrame("Frame", fr_name, frame)
		fra:SetSize(508,75)
		if indent_num == 0 then fra:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0)
		else fra:SetPoint("TOPLEFT", prevFra, "BOTTOMLEFT", 0, 0) end
		local backdrop = { --Borders
		  edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		  tile = false, tileSize = 16, edgeSize = 16,
		  insets = { left = 4, right = 4, top = 4, bottom = 4 }
		}
		fra:SetBackdrop(backdrop)
		fra:SetBackdropBorderColor(1, 0.675, 0.125, 1);
		fra.texture = fra:CreateTexture() --Background
		fra.texture:SetPoint("TOPLEFT", fra, 4, -4)
		fra.texture:SetPoint("BOTTOMRIGHT", fra, -4, 4)
		fra.header = fra:CreateTexture() --Header
		fra.header:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Borders", "OVERLAY")
		fra.header:SetHeight(22)
		fra.header:SetPoint("TOPLEFT",fra,4,-4)
		fra.header:SetPoint("TOPLEFT",fra,4,-4)
		fra.header:SetDrawLayer("OVERLAY", -2)
		fra.header:SetAlpha(0.8)
		fraIcon = CreateFrame("Frame","$parent_Icon",fra) --Icon
		fraIcon:SetSize(47,47)
		fraIcon:SetPoint("TOPLEFT",fra,"TOPLEFT",10,-10)
		fraIcon.texture = fraIcon:CreateTexture()
		fraIcon.texture:SetTexCoord(0,1,0,1)
		fraIcon.texture:SetAllPoints(fraIcon)
		fraIcon.texture:SetDrawLayer("ARTWORK", -1)
		fraIcon.border = fraIcon:CreateTexture() --Icon Border
		fraIcon.border:SetTexture("Interface\\AchievementFrame\\UI-Achievement-IconFrame", "OVERLAY")
		fraIcon.border:SetTexCoord(0, 0.5625, 0, 0.5625)
		fraIcon.border:SetPoint("CENTER", fraIcon,0,0)
		fraIcon.border:SetSize(68,68)
		fraShield = CreateFrame("Frame","$parent_Shield",fra) --Shield
		fraShield.texture = fraShield:CreateTexture()
		fraShield.texture:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Shields", "ARTWORK")
		fraShield:SetSize(65,65)
		fraShield:SetPoint("TOPRIGHT",fr_name,"TOPRIGHT",-3,-2)
		fraShield.texture:SetAllPoints(fraShield)
		achPts = fraShield:CreateFontString(fr_name.."_ShieldPoints","OVERLAY","GameFontNormalLarge") --Points
		achPts:SetPoint("CENTER",fraShield,"CENTER",0,3)
		achDate = fraShield:CreateFontString(fr_name.."_AchDate","OVERLAY","GameFontNormalLarge") --Date
		achDate:SetPoint("CENTER",fraShield,"CENTER",0,-28)
		achDate:SetFontObject("GameFontNormalSmall")
		achName = fra:CreateFontString(fr_name.."_AchName","OVERLAY","GameTooltipHeaderText") --Name
		achName:SetPoint("TOPLEFT",fra,"TOPLEFT",66,-8)
		achName:SetWidth("400")
		achDesc = fra:CreateFontString(fr_name.."_AchDesc","OVERLAY","GameFontBlackSmall") --Description
		achDesc:SetFontObject("AchievementDescriptionFont")
		achDesc:SetSize(362,40)
		achDesc:SetJustifyH("LEFT"); achDesc:SetJustifyV("TOP")
		achDesc:CanWordWrap(1); achDesc:SetMaxLines(4)
		achDesc:SetPoint("TOPLEFT",fra,"TOPLEFT",66,-26)
	end
	local fraIcon = _G[fr_name.."_Icon"]
	local fraShield = _G[fr_name.."_Shield"]
	local achPts = _G[fr_name.."_ShieldPoints"]
	local achDate = _G[fr_name.."_AchDate"]
	local achName = _G[fr_name.."_AchName"]
	local achDesc = _G[fr_name.."_AchDesc"]
	fraIcon.texture:SetTexture(Image)
	achPts:SetText(Points)
	achName:SetText(Name)
	achDesc:SetText(Description)
	fra:Show()
	if Completed == true then 
		if Flags and ( bit.band(Flags, ACHIEVEMENT_FLAGS_ACCOUNT) == ACHIEVEMENT_FLAGS_ACCOUNT ) then
			fra.header:SetTexture("Interface\\AchievementFrame\\AccountLevel-AchievementHeader", "OVERLAY")
			fra.header:SetTexCoord(0, 1, 0, 0.375) --Account-wide completed
			fra:SetBackdropBorderColor(0.129, 0.671, 0.875, 1)
		else
			fra.header:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Borders", "OVERLAY")
			fra.header:SetTexCoord(0, 1, 0.66015625, 0.73828125)
			fra:SetBackdropBorderColor(1, 0.675, 0.125, 1)
		end
		fra.texture:SetTexture("Interface\\AchievementFrame\\UI-Achievement-AchievementBackground", "BACKGROUND")
		fra.texture:SetTexCoord(0, 1, 0, 0.5)
		fraIcon.texture:SetVertexColor(1,1,1,1)
		fraShield.texture:SetTexCoord(0, 0.5, 0, 0.5)
		achPts:SetFontObject("GameFontNormalLarge")
		achDate:SetText(string.format(SHORTDATE, Day, Month, Year)); achDate:Show()
		achName:SetFontObject("GameFontWhite")
		fra:SetScript("OnMouseDown", function(self, button) 
			if button == "LeftButton" then 
				if ( IsModifiedClick("CHATLINK") ) then 
					if ChatEdit_GetActiveWindow() then ChatEdit_InsertLink(GetAchievementLink(ach_ID)) end
				else  
					if _G["AchievementFrame"] then
						if ( not AchievementFrame:IsShown() ) then
							AchievementFrame_ToggleAchievementFrame()
							AchievementFrame_SelectAchievement(ach_ID)
						else
							AchievementFrame_SelectAchievement(ach_ID)
						end
					end
				end
			end
		end)
		fraShield:SetScript("OnEnter", function(self)
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			if earnedByMe then GameTooltip:AddLine("Earned by: |cffffffff"..earnedBy)
			else GameTooltip:AddLine("Completed by: |cffffffff"..earnedBy)
			GameTooltip:AddLine("|cffff2020Not completed by: |cffffffff"..UnitName("player")) end
			GameTooltip:Show()
		end)
		fraShield:SetScript("OnLeave", function(self)
			GameTooltip:Hide()
		end)
		fraIcon:SetScript("OnEnter", function(self) -- Criteria Tooltip
			GameTooltip:SetOwner(self, "ANCHOR_LEFT")
			GameTooltip:ClearLines()
			local numCriteria = GetAchievementNumCriteria(ach_ID)
			if numCriteria > 0 then
				GameTooltip:AddLine("Criteria:")
				for i = 1, numCriteria do
					local criteriaString, criteriaType, completed, quantity, reqQuantity = GetAchievementCriteriaInfo(ach_ID, i)
					if reqQuantity > 1 then
						local completedStr = criteriaString.." ["..quantity.."/"..reqQuantity.."]"
						if completed then GameTooltip:AddLine("|CFF00FF00"..completedStr)
						else GameTooltip:AddLine("|CFF808080"..completedStr) end
						
					else
						if completed then GameTooltip:AddLine("|CFF00FF00"..criteriaString)
						else GameTooltip:AddLine("|CFF808080"..criteriaString) end
					end
				end
				GameTooltip:Show()
			end
			
		end)
		fraIcon:SetScript("OnLeave", function(self)
			GameTooltip:Hide()
		end)
	else
		if Flags and ( bit.band(Flags, ACHIEVEMENT_FLAGS_ACCOUNT) == ACHIEVEMENT_FLAGS_ACCOUNT ) then
			fra.header:SetTexture("Interface\\AchievementFrame\\AccountLevel-AchievementHeader")
			fra.header:SetTexCoord(0, 1, 0.40625, 0.78125) --Account-wide incomplete
		else
			fra.header:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Borders", "OVERLAY")
			fra.header:SetTexCoord(0, 1, 0.91796875, 0.99609375)
		end
		fra.texture:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Parchment-Horizontal-Desaturated", "BACKGROUND")
		fra.texture:SetTexCoord(0, 1, 0, 0.5)
		fra:SetBackdropBorderColor(0.5, 0.5, 0.5);
		fraIcon.texture:SetVertexColor(.55, .55, .55, 1)
		fraShield.texture:SetTexCoord(0.5, 1, 0, 0.5) 
		fraShield:SetScript("OnEnter", nil); fraShield:SetScript("OnLeave", nil)
		achPts:SetFontObject("GameFontDisableLarge")
		achName:SetFontObject("GameFontDisable")
		achDate:Hide()
		fra:SetScript("OnMouseDown", function(self, button) 
		  if button == "LeftButton" then 
			if ( IsModifiedClick("CHATLINK") and ChatEdit_GetActiveWindow() ) then
				    ChatEdit_InsertLink(GetAchievementLink(ach_ID))
			elseif ( IsModifiedClick("QUESTWATCHTOGGLE") ) then
				    AddTrackedAchievement(ach_ID)
			else  
				if _G["AchievementFrame"] then
					if ( not AchievementFrame:IsShown() ) then
						AchievementFrame_ToggleAchievementFrame()
						AchievementFrame_SelectAchievement(ach_ID)
					else
						AchievementFrame_SelectAchievement(ach_ID)
					end
				end
			end
		  end
		end)
		fraIcon:SetScript("OnEnter", function(self) -- Criteria Tooltip
			GameTooltip:SetOwner(self, "ANCHOR_LEFT")
			GameTooltip:ClearLines()
			local numCriteria = GetAchievementNumCriteria(ach_ID)
			if numCriteria > 0 then
				GameTooltip:AddLine("Criteria:")
				for i = 1, numCriteria do
					local criteriaString, criteriaType, completed, quantity, reqQuantity = GetAchievementCriteriaInfo(ach_ID, i)
					if reqQuantity > 1 then
						local completedStr = criteriaString.." ["..quantity.."/"..reqQuantity.."]"
						if completed then GameTooltip:AddLine("|CFF00FF00"..completedStr)
						else GameTooltip:AddLine("|CFF808080"..completedStr) end
						
					else
						if completed then GameTooltip:AddLine("|CFF00FF00"..criteriaString)
						else GameTooltip:AddLine("|CFF808080"..criteriaString) end
					end
					
				end
				GameTooltip:Show()
			end
			
		end)
		fraIcon:SetScript("OnLeave", function(self)
			GameTooltip:Hide()
		end)
	end
end

function RaidAchFilter:ShowAch(Raid)

	local chkBox1 = _G["RaidAch_Frame_HideAccount"]
	local chkBox2 = _G["RaidAch_Frame_HideCharacter"]
	local scrBar = _G["RaidAch_Slider"]
	RAFdb.AchList = RAFdb.AchID[Raid]

	for i = 1, 68 do
		local fra = _G["achFra" .. i]
		if fra then fra:Hide() end
	end
	local maxID = 1
	local indent = 0
	fraNum = 1
	for i = 1, #RAFdb.AchList do
		local IDNumber, Name, Points, Completed, Month, Day, Year, Description, Flags, Image, RewardText, isGuildAch, earnedByMe, earnedBy = GetAchievementInfo(RAFdb.AchID[Raid][i])
		if Completed and not chkBox1:GetChecked() then
			if chkBox2:GetChecked() and earnedByMe then --ignore it
			else
				RaidAchFilter:AchAdd(maxID, RAFdb.AchID[Raid][i], indent)
				maxID=maxID+1
				indent=indent-75
			end
		elseif not Completed then
			RaidAchFilter:AchAdd(maxID, RAFdb.AchID[Raid][i], indent)
			maxID=maxID+1
			indent=indent-75
		end
	end

	scrBar:SetMinMaxValues(1, maxID) 
	local fraHeight = 0
	for i = 1, #RAFdb.AchID[Raid] do
		if _G["achFra"..i] and _G["achFra"..i]:IsShown() then fraHeight=fraHeight+75 end
	end
	
	if fraHeight > 600 then 
		fraHeight=fraHeight-520
		scrBar:SetMinMaxValues(1, fraHeight)
		scrBar:Show(); scrBar:Enable(); scrBar:SetValue(0); scrBar:SetValueStep(15.0)
		_G["RaidAch_Frame_Close"]:SetPoint("TOPRIGHT", _G["RaidAch_Frame"], "TOPRIGHT", -13, 3)
		_G["RaidAch_Frame"]:SetWidth(536)
	else 
		scrBar:Hide(); scrBar:Disable(); fraHeight = 100
		_G["RaidAch_Frame_Close"]:SetPoint("TOPRIGHT", _G["RaidAch_Frame"], "TOPRIGHT", 4, 3)
		_G["RaidAch_Frame"]:SetWidth(520)
	end

	RAF_RID = Raid

	local dropDown = _G["RaidAch_Dropdown"]
	UIDropDownMenu_Initialize(dropDown)
	UIDropDownMenu_SetSelectedValue(dropDown, Raid)
	UIDropDownMenu_SetText(dropDown, RAFdb.MapName[Raid])

end