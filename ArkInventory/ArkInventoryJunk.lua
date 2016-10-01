local _G = _G
local select = _G.select
local pairs = _G.pairs
local ipairs = _G.ipairs
local string = _G.string
local type = _G.type
local error = _G.error
local table = _G.table


function ArkInventory.JunkIterate( )
	
	local cat_junk = ArkInventory.CategoryGetSystemID( "SYSTEM_TRASH" )
	
	local loc_id = ArkInventory.Const.Location.Bag
	local bag_id = 1
	local slot_id = 0
	
	local player = ArkInventory.GetPlayerStorage( nil, loc_id )
	local i, cat
	
	local bags = ArkInventory.Global.Location[loc_id].Bags
	local blizzard_id = bags[bag_id]
	local numslots = GetContainerNumSlots( blizzard_id )
	
	local _, isJunk, isLocked, itemCount, itemLink, vendorPrice
	
	return function( )
		
		isJunk = false
		itemLink = nil
		itemCount = 0
		vendorPrice = -1
		
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
				vendorPrice = -1
				break
			end
			
			_, itemCount, isLocked, _, _, _, itemLink, _, _, _ = GetContainerItemInfo( blizzard_id, slot_id )
			
			if not isLocked then
				
				i = player.data.location[loc_id].bag[bag_id].slot[slot_id]
				if i then
					
					cat = ArkInventory.ItemCategoryGet( i )
					isJunk = ( cat == cat_junk )
					
					if isJunk then
						vendorPrice = ArkInventory.ObjectInfoVendorPrice( itemLink )
					end
					
				end
				
			end
			
		end
		
		--ArkInventory.Output( itemLink, " / ", itemCount, " / ", vendorPrice )
		return blizzard_id, slot_id, itemLink, itemCount, vendorPrice
		
	end
	
end

function ArkInventory.JunkValue( )
	local count = 0
	local price = 0
	for blizzard_id, slot_id, itemLink, itemCount, vendorPrice in ArkInventory.JunkIterate( ) do
		count = count + 1
		if vendorPrice > 0 then
			price = price + ( vendorPrice * itemCount )
		end
	end
	return count, price
end

function ArkInventory.JunkSell( )
	
	if IsAddOnLoaded( "Scrap" ) or IsAddOnLoaded( "SellJunk" ) then
		-- do not conflict with other selling addons, they have more functionality
		return
	end
	
	if ArkInventory.db.option.junk.sell then
		
		local count, price = ArkInventory.JunkValue( )
		--ArkInventory.Output( "start ", count, " / ", price )
		
		local sold = 0
		local destroyed = 0
		local limit = ( ArkInventory.db.option.junk.limit and 0 ) or BUYBACK_ITEMS_PER_PAGE
		
		for blizzard_id, slot_id, itemLink, itemCount, vendorPrice in ArkInventory.JunkIterate( ) do
			
			if vendorPrice > 0 then
				sold = sold + 1
				if limit > 0 and sold > limit then
					-- limit to buyback page
					--ArkInventory.Output( "buyback limit (", limit, ") reached, ending sell process" )
					return
				end
				--ArkInventory.Output( "selling ", itemLink )
				UseContainerItem( blizzard_id, slot_id )
				-- this will sometimes fail, and you will have no idea, so you cant just add up the values as you go
				-- cant use money as it doesnt update in time.
				-- so next best thing, record how much the junk we had beforehand cost and how much we have at the end costs
			elseif vendorPrice == 0 then
				if ArkInventory.db.option.junk.delete then
					--ArkInventory.Output( "deleting ", itemLink )
					PickupContainerItem( blizzard_id, slot_id )
					DeleteCursorItem( )
					destroyed = destroyed + 1
					-- might fail, may prompt user if quality is green or higher
				end
			end
			
		end
		
		if sold > 0 or destroyed > 0 and ArkInventory.db.option.junk.notify then
			local itemCount, vendorPrice = ArkInventory.JunkValue( )
			--ArkInventory.Output( "end ", itemCount, " / ", vendorPrice )
			count = count - itemCount
			price = price - vendorPrice
			if price > 0 then
				ArkInventory.Output( string.format( ArkInventory.Localise["CONFIG_JUNK_SELL_NOTIFY_SOLD"], ArkInventory.MoneyText( price ) ) )
			end
			if destroyed > 0 then
				ArkInventory.Output( string.format( ArkInventory.Localise["CONFIG_JUNK_SELL_NOTIFY_DESTROYED"], destroyed ) )
			end
			--ArkInventory.Output( sold, " items sold, ", destroyed, " items destroyed" )
		end
	end
	
end
