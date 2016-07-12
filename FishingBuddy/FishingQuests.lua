-- Thanks to SOCD and QuickQuest for inspiration

local GSB = FishingBuddy.GetSettingBool;

local _fqframe = CreateFrame('Frame')
_fqframe:SetScript('OnEvent', function(self, event, ...) self[event](...) end)

function _fqframe:Register(event, method, override)
	local methods = self[event]
	if(methods) then
		self[event] = setmetatable({methods, newmethod or method}, metatable)
	else
		self[event] = method
		self:RegisterEvent(event)
	end
end

local function GetNPCID()
	return tonumber(string.match(UnitGUID('npc') or UnitGUID('target') or '', 'Creature%-.-%-.-%-.-%-.-%-(.-)%-'))
end

local function procLunkerQuests(index, title, level, isTrivial, frequency, isRepeatable, isLegendary, ...)
	local isDaily = frequency == LE_QUEST_FREQUENCY_DAILY
	local isWeekly = frequency == LE_QUEST_FREQUENCY_WEEKLY

	local n = GetItemCount(title)
	if (n > 0) then
		SelectGossipAvailableQuest(index)
	end
	
	if ... then
		return procLunkerQuests(index + 1, ...)
	else
		return
	end
end


_fqframe:Register('GOSSIP_SHOW', function()
	if (GSB("AutoLunker")) then
		local npcID = GetNPCID()
	
		if (npcID == 77733) then
			-- print ("Hi Ron Ashton!");
		elseif (npcID == 85984) then
			-- print ("Hi Nat Pagle at the shack!")
			procLunkerQuests(1, GetGossipAvailableQuests() )
		end
	end
end, true)

_fqframe:Register('QUEST_PROGRESS', function(event, ...)
	if (GSB("AutoLunker")) then
		local npcID = GetNPCID()
	
		if (npcID == 85984) then
			local title = GetTitleText()
			local n = GetItemCount(title)
			if (n > 0) then
				return CompleteQuest()
			end
		end
	end
end, true)

_fqframe:Register('QUEST_COMPLETE', function(event, ...)
	if (GSB("AutoLunker")) then
		local npcID = GetNPCID()
	
		if (npcID == 85984) then
			local title = GetTitleText()
			local n = GetItemCount(title)
			if (n > 0) then
				return GetQuestReward(1)
			end
		end
	end
end, true)