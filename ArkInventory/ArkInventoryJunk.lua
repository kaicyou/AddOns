local _G = _G
local select = _G.select
local pairs = _G.pairs
local ipairs = _G.ipairs
local string = _G.string
local type = _G.type
local error = _G.error
local table = _G.table

function ArkInventory.JunkIterate( )
	
	local bags = ArkInventory.Global.Location[ArkInventory.Const.Location.Bag].Bags
	local bag_id = 1
	local blizzard_id = bags[bag_id]
	local numslots = GetContainerNumSlots( blizzard_id )
	local slot_id = 0
	local z, isJunk, isLocked, rarity, itemCount, itemLink, itemCost
	
	return function( )
		
		isJunk = false
		itemCount = 0
		itemLink = nil
		itemCost = 0
		
		while not isJunk do
			
			if slot_id < numslots then
				slot_id = slot_id + 1
			elseif bag_id < #bags then
				bag_id = bag_id + 1
				blizzard_id = bags[bag_id]
				numslots = GetContainerNumSlots( blizzard_id )
				slot_id = 1
			else
				blizzard_id = nil
				slot_id = nil
				itemCount = nil
				itemLink = nil
				itemCost = 0
				break
			end
			
			z, itemCount, isLocked, rarity, z, z, itemLink = GetContainerItemInfo( blizzard_id, slot_id )
			itemCost = ArkInventory.ObjectInfoSellPrice( itemLink )
			if not isLocked and rarity == LE_ITEM_QUALITY_POOR and itemCost >= 0 then
				isJunk = true
			end
			
		end
		
		return blizzard_id, slot_id, itemLink, itemCount, itemCost
		
	end
	
end

function ArkInventory.JunkValue( )
	local total = 0
	for blizzard_id, slot_id, h, count, cost in ArkInventory.JunkIterate( ) do
		total = total + ( cost * count )
	end
	return total
end

function ArkInventory.JunkSell( )
	
	if IsAddOnLoaded( "Scrap" ) or IsAddOnLoaded( "SellJunk" ) then
		-- do not conflict with other selling addons, they have more functionality
		return
	end
	
	if ArkInventory.db.option.junk.sell then
		
		local total = ArkInventory.JunkValue( )
		
		local sold = 0
		local limit = BUYBACK_ITEMS_PER_PAGE
		if not ArkInventory.db.option.junk.limit then
			limit = 0
		end
		
		for blizzard_id, slot_id, h, count, cost in ArkInventory.JunkIterate( ) do
			
			if cost > 0 then
				sold = sold + 1
				if limit > 0 and sold > limit then
					-- limit to buyback page
					return
				end
				--ArkInventory.Output( "selling ", h )
				UseContainerItem( blizzard_id, slot_id )
				-- this will sometimes fail, and you will have no idea, you cant just add up the values
				-- cant use money as it doesnt update in time.
				-- so next best thing, record how much the junk we had beforehand cost and how much we have at the end costs
			elseif cost == 0 then
				if ArkInventory.db.option.junk.delete then
					--ArkInventory.Output( "deleting ", h )
					PickupContainerItem( blizzard_id, slot_id )
					DeleteCursorItem( )
				end
			end
			
		end
		
		if sold > 0 and ArkInventory.db.option.junk.notify then
			total = total - ArkInventory.JunkValue( )
			ArkInventory.Output( string.format( ArkInventory.Localise["CONFIG_JUNK_SELL_NOTIFY"], ArkInventory.MoneyText( total ) ) )
		end
	end
	
end
