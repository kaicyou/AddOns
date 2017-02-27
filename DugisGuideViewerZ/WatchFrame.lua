local DGV = DugisGuideViewer
if not DGV then return end

local WF = DGV:RegisterModule("DugisWatchFrame")
WF.essential = true

local function IncompatibleAddonLoaded()
	return (DGV.carboniteloaded and Nx.Quest) or DGV.sexymaploaded or DGV.nuiloaded or DGV.elvuiloaded or DGV.tukuiloaded or DGV.shestakuiloaded or DugisGuideUser.PetBattleOn
end

function WF:Initialize()    
    ObjectiveTrackerFrameHandlerFrame = CreateFrame("Frame", "ObjectiveTrackerFrameHandlerFrame", UIParent)
    ObjectiveTrackerFrameHandlerFrame:SetMovable(true)
    ObjectiveTrackerFrameHandlerFrame:RegisterForDrag("LeftButton")
    ObjectiveTrackerFrameHandlerFrame:SetScript("OnDragStart", ObjectiveTrackerFrameHandlerFrame.StartMoving)
    ObjectiveTrackerFrameHandlerFrame:SetScript("OnDragStop", function()
        ObjectiveTrackerFrameHandlerFrame:StopMovingOrSizing()
        DugisGuideUser.ObjectiveTrackerFrameHandlerFrame_point
        , DugisGuideUser.ObjectiveTrackerFrameHandlerFrame_relativeTo
        , DugisGuideUser.ObjectiveTrackerFrameHandlerFrame_relativePoint
        , DugisGuideUser.ObjectiveTrackerFrameHandlerFrame_xOfs
        , DugisGuideUser.ObjectiveTrackerFrameHandlerFrame_yOfs = ObjectiveTrackerFrameHandlerFrame:GetPoint()
    end)
    ObjectiveTrackerFrameHandlerFrame:SetFrameLevel(0)
    ObjectiveTrackerFrameHandlerFrame:SetFrameStrata("LOW")
    ObjectiveTrackerFrameHandlerFrame:SetWidth(264)
    ObjectiveTrackerFrameHandlerFrame:SetHeight(40)
    if not DugisGuideUser.ObjectiveTrackerFrameHandlerFrame_point then
        ObjectiveTrackerFrameHandlerFrame:SetPoint("TOPRIGHT", UIParent, -90, -230 )
    else
        ObjectiveTrackerFrameHandlerFrame:SetPoint(
        DugisGuideUser.ObjectiveTrackerFrameHandlerFrame_point
        , DugisGuideUser.ObjectiveTrackerFrameHandlerFrame_relativeTo
        , DugisGuideUser.ObjectiveTrackerFrameHandlerFrame_relativePoint
        , DugisGuideUser.ObjectiveTrackerFrameHandlerFrame_xOfs
        , DugisGuideUser.ObjectiveTrackerFrameHandlerFrame_yOfs)
    end
    ObjectiveTrackerFrameHandlerFrame:SetClampedToScreen(true)

    local temporarilyNotMovableWatchFrame = false
    
    function WF:UpdateWatchFrameMovable()
		if (DugisGuideViewer:UserSetting(DGV_MOVEWATCHFRAME) and DugisGuideViewer:UserSetting(DGV_DISABLEWATCHFRAMEMOD)) or temporarilyNotMovableWatchFrame then 
        	ObjectiveTrackerFrameHandlerFrame:EnableMouse(false)
		elseif DugisGuideViewer:UserSetting(DGV_MOVEWATCHFRAME) then
			ObjectiveTrackerFrameHandlerFrame:EnableMouse(true)
		end
	end    
    
    function WF:ResetWatchFrameMovable()
        WF:Update()
	end    
    
    WF:UpdateWatchFrameMovable()

	local flashGroup, flash
	local L, RegisterFunctionReaction, RegisterMemberFunctionReaction = DugisLocals, DGV.RegisterFunctionReaction, DGV.RegisterMemberFunctionReaction
	
	function WF:ShouldModWatchFrame(forceLoaded)
		if forceLoaded then return true end
		return not IncompatibleAddonLoaded() and (WF.loaded or forceLoaded)
	end

	function WF:Reset()
	end
	
	local function IsAnchoredOn()
		return DugisGuideViewer:IsModuleRegistered("SmallFrame") and DGV.SmallFrame.Frame and DGV.SmallFrame.loaded and not DGV.SmallFrame.IsFloating()
	end	
	
    local function GetLastWorldQuestBlock()
        local bottomBlock = nil
        local top = 100000
         
        LuaUtils:foreach(WORLD_QUEST_TRACKER_MODULE.usedBlocks, function(v, k) 
            if (v:GetTop() and v:GetTop() < top)  or (v:GetBottom() and v:GetBottom() < top)then
                bottomBlock = v
                top = v:GetTop()
            end
        end) 
         
        return bottomBlock
    end
    
	local function GetBottomElement()
		if GetNumTrackedAchievements() > 0 then 
			return ACHIEVEMENT_TRACKER_MODULE.lastBlock or (IsAnchoredOn() and DGV.SmallFrame.Frame)
		elseif C_Scenario.GetInfo() then 
            if ObjectiveTrackerBlocksFrame.QuestHeader.module.lastBlock == nil then
                return ACHIEVEMENT_TRACKER_MODULE.lastBlock or (IsAnchoredOn() and DGV.SmallFrame.Frame)
            end
			return ObjectiveTrackerBlocksFrame.QuestHeader.module.lastBlock or (IsAnchoredOn() and DGV.SmallFrame.Frame)
        elseif GetLastWorldQuestBlock() then
            return GetLastWorldQuestBlock()
        else
			return BONUS_OBJECTIVE_TRACKER_MODULE.firstBlock or ObjectiveTrackerBlocksFrame.QuestHeader.module.lastBlock or (IsAnchoredOn() and DGV.SmallFrame.Frame) or ObjectiveTrackerBlocksFrame
		end
	end
	
	local header
	local function GetLeftElement()
		return ObjectiveTrackerBlocksFrame or
			IsAnchoredOn() and header
	end
	
	local function GetObjectiveTrackerAnchorInfo()
		local anchorY = 0
		local buffsAnchorY = min(0, MINIMAP_BOTTOM_EDGE_EXTENT - BuffFrame.bottomEdgeExtent);
		-- Count right action bars
		local rightActionBars = 0;
		if ( IsNormalActionBarState() ) then
			if ( SHOW_MULTI_ACTIONBAR_3 ) then
				rightActionBars = 1;
				if ( SHOW_MULTI_ACTIONBAR_4 ) then
					rightActionBars = 2;
				end
			end
		end
		 
		-- Capture bars - need to move below buffs/debuffs if at least 1 right action bar is showing
		if ( NUM_EXTENDED_UI_FRAMES ) then
			local captureBar;
			local numCaptureBars = 0;
			for i=1, NUM_EXTENDED_UI_FRAMES do
				captureBar = _G["WorldStateCaptureBar"..i];
				if ( captureBar and captureBar:IsShown() ) then
					numCaptureBars = numCaptureBars + 1
					if ( numCaptureBars == 1 and rightActionBars > 0 ) then
						anchorY = min(anchorY, buffsAnchorY);
					end
					--captureBar:SetPoint("TOPRIGHT", MinimapCluster, "BOTTOMRIGHT", -CONTAINER_OFFSET_X, anchorY);
					anchorY = anchorY - captureBar:GetHeight() - 4;
				end
			end
		end
		 
		--Setup Vehicle seat indicator offset - needs to move below buffs/debuffs if both right action bars are showing
		if ( VehicleSeatIndicator and VehicleSeatIndicator:IsShown() ) then
			if ( rightActionBars == 2 ) then
				anchorY = min(anchorY, buffsAnchorY);
				--VehicleSeatIndicator:SetPoint("TOPRIGHT", MinimapCluster, "BOTTOMRIGHT", -100, anchorY);

			elseif ( rightActionBars == 1 ) then
				--VehicleSeatIndicator:SetPoint("TOPRIGHT", MinimapCluster, "BOTTOMRIGHT", -62, anchorY);
			else
				--VehicleSeatIndicator:SetPoint("TOPRIGHT", MinimapCluster, "BOTTOMRIGHT", 0, anchorY);
			end
			anchorY = anchorY - VehicleSeatIndicator:GetHeight() - 4;   --The -4 is there to give a small buffer for things like the QuestTimeFrame below the Seat Indicator
		end
		 
		-- Boss frames - need to move below buffs/debuffs if both right action bars are showing
		local numBossFrames = 0;
		for i = 1, MAX_BOSS_FRAMES do
			if ( _G["Boss"..i.."TargetFrame"]:IsShown() ) then
				numBossFrames = i;
			end
		end
		if ( numBossFrames > 0 ) then
			if ( rightActionBars > 1 ) then
				anchorY = min(anchorY, buffsAnchorY);
			end
			--Boss1TargetFrame:SetPoint("TOPRIGHT", "MinimapCluster", "BOTTOMRIGHT", -(CONTAINER_OFFSET_X * 1.3) + 60, anchorY * 1.333);  -- by 1.333 because it's 0.75 scale
			anchorY = anchorY - (numBossFrames * (68 + BOSS_FRAME_CASTBAR_HEIGHT) + BOSS_FRAME_CASTBAR_HEIGHT);
		end
		 
		-- Setup durability offset
		if ( DurabilityFrame ) then
			--DurabilityFrame:SetPoint("TOPRIGHT", "MinimapCluster", "BOTTOMRIGHT", -CONTAINER_OFFSET_X, anchorY);
			if ( DurabilityFrame:IsShown() ) then
				anchorY = anchorY - DurabilityFrame:GetHeight();
			end
		end
		 
		--[[if ( ArenaEnemyFrames ) then
			ArenaEnemyFrames:ClearAllPoints();
			ArenaEnemyFrames:SetPoint("TOPRIGHT", MinimapCluster, "BOTTOMRIGHT", -CONTAINER_OFFSET_X, anchorY);
		end
		 
		if ( ArenaPrepFrames ) then
			ArenaPrepFrames:ClearAllPoints();
			ArenaPrepFrames:SetPoint("TOPRIGHT", MinimapCluster, "BOTTOMRIGHT", -CONTAINER_OFFSET_X, anchorY);
		end]]
	 
		-- ObjectiveTracker - needs to move below buffs/debuffs if at least 1 right action bar is showing
		if ( rightActionBars > 0 ) then
			anchorY = min(anchorY, buffsAnchorY);
		end
	
		local numArenaOpponents = GetNumArenaOpponents();
		
		if DGV:UserSetting(DGV_MOVEWATCHFRAME) then 
			local shiftX = 0    

			anchorY = 0
			--if DurabilityFrame:IsShown() then
				--anchorY = anchorY + 75
				--shiftX = -10
			--end			        
			return "ObjectiveTrackerFrameHandlerFrame", 7 + shiftX, anchorY + 50			
		elseif ( ArenaEnemyFrames and ArenaEnemyFrames:IsShown() and (numArenaOpponents > 0) ) then
			return "ArenaEnemyFrame"..numArenaOpponents, 2, -35
		elseif ( ArenaPrepFrames and ArenaPrepFrames:IsShown() and (numArenaOpponents > 0) ) then
			return "ArenaPrepFrame"..numArenaOpponents, 2, -35
		else
			return "MinimapCluster", -OBJTRACKER_OFFSET_X, anchorY
		end
	end
	
	local function ItemShow()
		for i=1, 6 do 
			local itembutton = _G["DugisSmallFrameStatus"..i.."Item"]
			if itembutton then itembutton:Show() end
		end		
	end
	
	local function ItemHide()
		for i=1, 6 do 
			local itembutton = _G["DugisSmallFrameStatus"..i.."Item"]
			if itembutton then 
				itembutton:Hide()
				DugisGuideUser.itemHidden = true
			end
		end		
	end	

	function WF:Update()
		if DugisGuideViewer:IsModuleRegistered("SmallFrame") then DGV:OnWatchFrameUpdate() end

		local bottomElement = GetBottomElement()
		if bottomElement and bottomElement ~= ObjectiveTrackerBlocksFrame then
			ObjectiveTrackerFrame.HeaderMenu:Show()
        end

		local anchorFrame, xOff, yOff = GetObjectiveTrackerAnchorInfo()
		if WF:ShouldModWatchFrame()
			and bottomElement
		then
			if ObjectiveTrackerFrame.collapsed and not ObjectiveTrackerFrame.BlocksFrame:IsShown() then
				WF.WatchBackground:Hide()
				ObjectiveTrackerFrame:SetPoint("TOPRIGHT", anchorFrame, "BOTTOMRIGHT", xOff-3, yOff-13)
				ObjectiveTrackerFrame.HeaderMenu:SetPoint("TOPRIGHT", ObjectiveTrackerFrame, -10, 0)
				if IsAnchoredOn() then 
					DGV.DoOutOfCombat(ItemHide, ItemHide)
					DugisGuideUser.shownObjectives = {}				
				end
			else
				if DGV:UserSetting(DGV_WATCHFRAMEBORDER) then
					DGV:SetFrameBackdrop(WF.WatchBackground, DGV.BACKGRND_PATH, DGV:GetBorderPath(), 10, 4, 12, 6)
					WF.WatchBackground:SetBackdropColor(0,0,0,1)
				else
					DGV:SetFrameBackdrop(WF.WatchBackground)
					WF.WatchBackground:SetBackdropColor(0,0,0,0)
				end
				WF.WatchBackground:ClearAllPoints()
				if DugisGuideViewer:IsModuleRegistered("SmallFrame") and IsAnchoredOn() then
					header:ClearAllPoints()
					header:SetPoint("TOPRIGHT", anchorFrame, "BOTTOMRIGHT", xOff-12, yOff-13)
					header:Show()
					DGV.SmallFrame:AnchorSmallFrame(header)
					if ObjectiveTrackerFrame:IsVisible() then 
						ObjectiveTrackerFrame:Hide()
						ObjectiveTrackerFrame:Show() --Hide() and Show() for some reason fixes the objective tracker overlapping bug. 
					end 
					ObjectiveTrackerFrame:SetPoint("TOPRIGHT", anchorFrame, "BOTTOMRIGHT", xOff-3, ((header:GetHeight() + DGV.SmallFrame.Frame:GetHeight() + 22) * -1) + yOff)
					ObjectiveTrackerFrame.HeaderMenu:SetPoint("TOPRIGHT", header, -1, 0)
				else
					header:Hide()
					if ObjectiveTrackerFrame:IsVisible() then 
						ObjectiveTrackerFrame:Hide()
						ObjectiveTrackerFrame:Show() --Hide() and Show() for some reason fixes the objective tracker overlapping bug. 
					end 					
					ObjectiveTrackerFrame:SetPoint("TOPRIGHT", anchorFrame, "BOTTOMRIGHT", xOff-3, yOff-13)
					ObjectiveTrackerFrame.HeaderMenu:SetPoint("TOPRIGHT", ObjectiveTrackerFrame, -10, 0)
				end
				WF.WatchBackground:SetPoint("TOPRIGHT", anchorFrame, "BOTTOMRIGHT", xOff + 6, yOff)
                
                local worldQuestTrackerHeight = 0
                
                if WORLD_QUEST_TRACKER_MODULE and WORLD_QUEST_TRACKER_MODULE.contentsHeight then
                  --  worldQuestTrackerHeight = WORLD_QUEST_TRACKER_MODULE.contentsHeight
                end
                if bottomElement ~= ObjectiveTrackerBlocksFrame then 
					WF.WatchBackground:SetPoint("BOTTOM", bottomElement, 0, -20 - worldQuestTrackerHeight)
					WF.WatchBackground:SetPoint("LEFT", GetLeftElement(), -40, 0)
					WF.WatchBackground:Show()
				end
				if DugisGuideUser.itemHidden and IsAnchoredOn() then 
					DGV.Modules.SmallFrame.PopulateSmallFrame()					
					DugisGuideUser.itemHidden = nil
				end
			end
		else
			if WF.WatchBackground and not IsAnchoredOn() then 
				WF.WatchBackground:Hide()
			end
			--Below is not needed I think. Otherwise it messes with nUI objective tracker frame
			--ObjectiveTrackerFrame:SetPoint("TOPRIGHT", anchorFrame, "BOTTOMRIGHT", xOff, yOff)
			--ObjectiveTrackerFrame.HeaderMenu:SetPoint("TOPRIGHT", ObjectiveTrackerFrame)					
		end
        
        --/script ObjectiveTrackerFrame.HeaderMenu:Hide()
        if not DugisWatchBackground:IsShown() and not DugisGuideViewer:UserSetting(DGV_ANCHOREDSMALLFRAME) and not ObjectiveTrackerFrame.collapsed then
        --   ObjectiveTrackerFrame.HeaderMenu:Hide()
        end      

        --/script print(DugisWatchBackground:IsShown())
        --/script print(DugisGuideViewer:UserSetting(DGV_ANCHOREDSMALLFRAME))
        --/script print(ObjectiveTrackerFrame.collapsed)
        --/script  if not DugisWatchBackground:IsShown() and not DugisGuideViewer:UserSetting(DGV_ANCHOREDSMALLFRAME) and not ObjectiveTrackerFrame.collapsed then ObjectiveTrackerFrame.HeaderMenu:Hide()  end 
        
        
        if DugisGuideViewer:IsModuleRegistered("SmallFrame") and DugisGuideViewer.SmallFrame.IsFloating ~= nil then
            if DugisGuideViewer.SmallFrame.IsFloating() then
                DugisGuideViewer.SmallFrame.Frame:SetClampedToScreen(true)
            else
                DugisGuideViewer.SmallFrame.Frame:SetClampedToScreen(false)
            end
        end
		if DGV:UserSetting(DGV_SMALLFRAMETRANSITION) == L["Flash"] and not WF.disabledFlash then 
			--LuaUtils:Delay(0.02, function() 
				--WF:PlayFlashAnimation() 
			--end)
		end	
	end

	local objectiveTrackerUpdateReaction--, manageFramePositionsReaction
	function WF:Load()
		objectiveTrackerUpdateReaction = RegisterFunctionReaction("ObjectiveTracker_Update", nil, WF.ObjectiveTrackerDelayUpdate)
		--manageFramePositionsReaction = RegisterFunctionReaction("UIParent_ManageFramePositions", nil, WF.DelayUpdate)
		if DugisWatchBackground and (GetNumQuestWatches() > 0 or GetNumTrackedAchievements() > 0) then 
			WF.WatchBackground = DugisWatchBackground 
			WF.WatchBackground:Show()
			WF:Update()
		else
			WF.WatchBackground = CreateFrame("Frame", "DugisWatchBackground", ObjectiveTrackerFrame)
			WF.WatchBackground:SetFrameStrata("BACKGROUND")
			WF.WatchBackground:SetFrameStrata("LOW")
			header = CreateFrame("Frame", nil, WF.WatchBackground, "ObjectiveTrackerHeaderTemplate")
			header.module = DEFAULT_OBJECTIVE_TRACKER_MODULE;
			header.isHeader = true;
			header.Text:SetText("Guides");
			header.animateReason = OBJECTIVE_TRACKER_UPDATE_QUEST_ADDED or 0;
			--DEFAULT_OBJECTIVE_TRACKER_MODULE.Header = header; --this taints UseQuestLogSpecialItem()
		end
        
		function WF:PlayFlashAnimation(headerAnim)
			if header.animating then return end -- stop flash animation spam
			if not WF.FlashFrame then
				wf_flashGroup, flash, WF.FlashFrame = DGV:CreateFlashFrame(DugisWatchBackground)
			end
			
			if WF:ShouldModWatchFrame() and DGV:UserSetting(DGV_WATCHFRAMEBORDER)
				and DGV:UserSetting(DGV_SMALLFRAMETRANSITION) == L["Flash"]
			then				
				if headerAnim == true then 
					header.animating = true;
					header.HeaderOpenAnim:Stop();
					header.HeaderOpenAnim:Play();
				end 
				--DGV:DebugFormat("PlayFlashAnimation showing", "flashGroup", flashGroup)
				WF.FlashFrame:Show()
				WF.FlashFrame:SetWidth(WF.WatchBackground:GetWidth() - 14)
				WF.FlashFrame:SetHeight(WF.WatchBackground:GetHeight() - 17)
                wf_flashGroup:Stop()
				wf_flashGroup:Play()
			else
				WF.FlashFrame:Hide()
			end
		end
	end

	function WF:Unload()
		objectiveTrackerUpdateReaction:Dispose()
		--manageFramePositionsReaction:Dispose()
		if WF.FlashFrame then WF.FlashFrame:Hide() end
		--SnapWatchFrame()
		if WF.WatchBackground then
			WF.WatchBackground:Hide()
			WF.WatchBackground = nil
		end
	end

	if not WatchFrameDelayFrame then
		WatchFrameDelayFrame = CreateFrame("Frame")
		WatchFrameDelayFrame:Hide()
	end
	
	local function DelayandWatchFrameUpdate(delay, func)
		if WatchFrameDelayFrame:IsShown() then return end
		WatchFrameDelayFrame.func = func
		WatchFrameDelayFrame.delay = delay
		WatchFrameDelayFrame:Show()
		WF:Update()	
	end
	
	WatchFrameDelayFrame:SetScript("OnUpdate", function(self, elapsed)
		self.delay = self.delay - elapsed
		if self.delay <= 0 then
			self:Hide()
			WF:Update()	
		end
	end)
	
	function WF:DelayUpdate()
	    if lastOnOffButtonClickedTime ~= nil and (GetTime() - lastOnOffButtonClickedTime) < 7 then
	        WF:Update()
	    end	
		DelayandWatchFrameUpdate(0.1)
	end	
	
	function WF:ObjectiveTrackerDelayUpdate()
		if ObjectiveTrackerFrame.isUpdateDirty == true then return end
		WF:DelayUpdate()
	end
	
	if IsAddOnLoaded("DBM-Core") and DugisGuideViewer:GuideOn() and DugisGuideViewer.chardb.EssentialsMode ~= 1 then 
		hooksecurefunc(DBM, "StartCombat", function()
			DGV:OnDBMUpdate()
		end)	
		hooksecurefunc(DBM, "EndCombat", function()
			DGV:OnDBMUpdate()
		end)		
	end

    --Fix for #172 Blinking Objective Tracker bug
    local oldSetPointFunctionBuffer = {}
    
    local oldSetPointFunction = ObjectiveTrackerFrame.SetPoint
    local newSetPointFunction = function(...) 
        oldSetPointFunctionBuffer[#oldSetPointFunctionBuffer + 1] = {...}
    end
    
    local waitingForEnabledFlash = false
    local function DisableSetPointFunctionForObjectiveTracker()
        oldSetPointFunctionBuffer = {}
        DugisGuideViewer.Modules.DugisWatchFrame.disabledFlash = true
        temporarilyNotMovableWatchFrame = true
        WF:UpdateWatchFrameMovable()
        ObjectiveTrackerFrame.SetPoint = newSetPointFunction
        
        if waitingForEnabledFlash then
            return
        end
        
        waitingForEnabledFlash = true
        LuaUtils:Delay(3, function()
            ObjectiveTrackerFrame.SetPoint = oldSetPointFunction
            
            LuaUtils:foreach(oldSetPointFunctionBuffer, function(v)
                ObjectiveTrackerFrame.SetPoint(unpack(v))
            end)
            
            DugisGuideViewer.Modules.DugisWatchFrame:Update(true)
            DugisGuideViewer.Modules.DugisWatchFrame.disabledFlash = false
            temporarilyNotMovableWatchFrame = false
            WF:UpdateWatchFrameMovable()
            waitingForEnabledFlash = false
            
        end)
    end

    hooksecurefunc("CastShapeshiftForm", DisableSetPointFunctionForObjectiveTracker)
    hooksecurefunc("CancelUnitBuff", DisableSetPointFunctionForObjectiveTracker)
	
end
