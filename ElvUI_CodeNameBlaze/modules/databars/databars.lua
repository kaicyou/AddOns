--[[--------------------------------------------------------------------
--	CodeNameBlaze, an ElvUI edit by Blazeflack @ tukui.org
--
--	This file contains changes/additions to DataBars in ElvUI
--------------------------------------------------------------------]]--
local E, L, V, P, G = unpack(ElvUI); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local DataBars = E:GetModule('DataBars');
local CNB = E:GetModule('CodeNameBlaze');
local DataBarAnchorPriority = {}

local function GetBarOffsetY(index)
	local yOffset = -1
	
	for i = index, 1, -1 do
		local previousBar = DataBarAnchorPriority[i-1]
		if previousBar and previousBar:IsShown() and not E:HasMoverBeenMoved(previousBar.mover.name) then
			yOffset = yOffset - previousBar:GetHeight() - 1
		end
	end

	return yOffset
end

function CNB:UpdateDataBarAnchors()
	for index = 1, #DataBarAnchorPriority do
		local bar = DataBarAnchorPriority[index]
		local yOffset = GetBarOffsetY(index)
		if bar:IsShown() and not E:HasMoverBeenMoved(bar.mover.name) then
			bar.mover:ClearAllPoints()
			bar.mover:SetPoint("TOP", MMHolder, "BOTTOM", 0, yOffset)
		end
	end
end

hooksecurefunc(DataBars, "Initialize", function()
	DataBarAnchorPriority = {
		DataBars.expBar,
		DataBars.artifactBar,
		DataBars.repBar,
		DataBars.honorBar,
	}
	CNB:UpdateDataBarAnchors()
end)

hooksecurefunc(DataBars, "UpdateExperience", CNB.UpdateDataBarAnchors)
hooksecurefunc(DataBars, "UpdateReputation", CNB.UpdateDataBarAnchors)
hooksecurefunc(DataBars, "UpdateHonor", CNB.UpdateDataBarAnchors)
hooksecurefunc(DataBars, "UpdateArtifact", CNB.UpdateDataBarAnchors)
hooksecurefunc(DataBars, "EnableDisable_ExperienceBar", CNB.UpdateDataBarAnchors)
hooksecurefunc(DataBars, "EnableDisable_ReputationBar", CNB.UpdateDataBarAnchors)
hooksecurefunc(DataBars, "EnableDisable_HonorBar", CNB.UpdateDataBarAnchors)
hooksecurefunc(DataBars, "EnableDisable_ArtifactBar", CNB.UpdateDataBarAnchors)

function CNB:UpdateExperienceDimensions()
	--Set width to match minimap width unless user has moved the anchor
	if E:HasMoverBeenMoved('ExperienceBarMover') then
		DataBars.expBar:Width(DataBars.db.experience.width)
	else
		DataBars.expBar:Width(E.db.general.minimap.size + E.Border*2)
	end
end

function CNB:UpdateReputationDimensions()
	--Set width to match minimap width unless user has moved the anchor
	if E:HasMoverBeenMoved('ReputationBarMover') then
		DataBars.repBar:Width(DataBars.db.reputation.width)
	else
		DataBars.repBar:Width(E.db.general.minimap.size + E.Border*2)
	end
end

function CNB:UpdateHonorDimensions()
	--Set width to match minimap width unless user has moved the anchor
	if E:HasMoverBeenMoved('HonorBarMover') then
		DataBars.honorBar:Width(DataBars.db.honor.width)
	else
		DataBars.honorBar:Width(E.db.general.minimap.size + E.Border*2)
	end
end

function CNB:UpdateArtifactDimensions()
	--Set width to match minimap width unless user has moved the anchor
	if E:HasMoverBeenMoved('ArtifactBarMover') then
		DataBars.artifactBar:Width(DataBars.db.artifact.width)
	else
		DataBars.artifactBar:Width(E.db.general.minimap.size + E.Border*2)
	end
end
hooksecurefunc(DataBars, "UpdateExperienceDimensions", CNB.UpdateExperienceDimensions)
hooksecurefunc(DataBars, "UpdateReputationDimensions", CNB.UpdateReputationDimensions)
hooksecurefunc(DataBars, "UpdateHonorDimensions", CNB.UpdateHonorDimensions)
hooksecurefunc(DataBars, "UpdateArtifactDimensions", CNB.UpdateArtifactDimensions)