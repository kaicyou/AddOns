local _G = _G
local select = _G.select
local pairs = _G.pairs
local ipairs = _G.ipairs
local string = _G.string
local type = _G.type
local error = _G.error
local table = _G.table
local C_PetJournal = _G.C_PetJournal
local C_ToyBox = _G.C_ToyBox

ArkInventory.Collection.Toybox = {
	ready = false,
	total = 0,
	owned = 0,
	cache = { },
}


local filter = {
	ignore = false,
	searchBox = nil,
	collected = true,
	uncollected = true,
	source = { },
}

local function FilterGetSearch( )
	return ToyBox.searchBox:GetText( )
end

local function FilterSetSearch( s )
	ToyBox.searchBox:SetText( s )
	C_ToyBox.SetFilterString( s )
end

local function FilterGetCollected( )
	return C_ToyBox.GetCollectedShown( )
end

local function FilterSetCollected( value )
	C_ToyBox.SetCollectedShown( value )
end

local function FilterGetUncollected( )
	return C_ToyBox.GetUncollectedShown( )
end

local function FilterSetUncollected( value )
	C_ToyBox.SetUncollectedShown( value )
end

local function FilterGetSourceTypes( )
	return C_PetJournal.GetNumPetSources( )
end

local function FilterSetSource( t )
	if type( t ) == "table" then
		for i = 1, FilterGetSourceTypes( ) do
			C_ToyBox.SetSourceTypeFilter( i, t[i] )
		end
	elseif type( t ) == "boolean" then
		for i = 1, FilterGetSourceTypes( ) do
			C_ToyBox.SetSourceTypeFilter( i, t )
		end
	else
		assert( false, "parameter is not a table or boolean" )
	end
end

local function FilterGetSource( t )
	assert( type( t ) == "table", "parameter is not a table" )
	for i = 1, FilterGetSourceTypes( ) do
		t[i] = not C_ToyBox.IsSourceTypeFilterChecked( i )
	end
end


local function FilterActionClear( )
	
	filter.ignore = true
	
	FilterSetSearch( "" )
	FilterSetCollected( true )
	FilterSetUncollected( true )
	FilterSetSource( true )
	
end

local function FilterActionBackup( )
	
	--ArkInventory.Output( "Toybox.FilterActionBackup" )
	
	if filter.ignore then
		--ArkInventory.Output( "FilterActionBackup - ignore" )
		return
	end
	
	filter.search = FilterGetSearch( )
	filter.collected = FilterGetCollected( )
	filter.uncollected = FilterGetUncollected( )
	FilterGetSource( filter.source )
	
end

local function FilterActionRestore( )
	
	--ArkInventory.Output( "Toybox.FilterActionRestore" )
	
	filter.ignore = true
	
	FilterSetSearch( filter.search )
	FilterSetCollected( filter.collected )
	FilterSetUncollected( filter.uncollected )
	FilterSetSource( filter.source )
	
end


function ArkInventory.Collection.Toybox.Scan( )
	
	local thread_id = string.format( ArkInventory.Global.Thread.Format.Collection, "toybox" )
	
	if not ArkInventory.Global.Thread.Use then
		local tz = debugprofilestop( )
		ArkInventory.OutputThread( thread_id, " start" )
		ArkInventory.Collection.Toybox.Scan_Threaded( )
		tz = debugprofilestop( ) - tz
		ArkInventory.OutputThread( string.format( "%s took %0.0fms", thread_id, tz ) )
		return
	end
	
	local tf = function ( )
		ArkInventory.Collection.Toybox.Scan_Threaded( thread_id )
	end
	
	return ArkInventory.ThreadStart( thread_id, tf )
	
end

function ArkInventory.Collection.Toybox.Scan_Threaded( thread_id )
	
	--ArkInventory.Output( "Toybox: Start Scan @ ", time( ) )
	
	if ArkInventory.Global.Mode.Combat then
		-- set to scan when leaving combat
		ArkInventory.Global.LeaveCombatRun.Toybox = true
		return
	end
	
	local data = ArkInventory.Collection.Toybox
	
	FilterActionBackup( )
	FilterActionClear( )

	local total = C_ToyBox.GetNumTotalDisplayedToys( )
	local owned = C_ToyBox.GetNumLearnedDisplayedToys( )
	
	if total == 0 or owned == 0 then
		
		--ArkInventory.Output( "no toys found" )
		FilterActionRestore( )
		--ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_TOYBOX_RELOAD_BUCKET", "RESCAN" )
		return
		
	end

	local update = false
	
	if data.total ~= total or not data.ready then
		data.total = total
		update = true
	end
	
	if data.owned ~= owned or not data.ready then
		
		data.owned = owned
		update = true
		
		wipe( data.cache )
		
	end
	
	--ArkInventory.Output( "toys: ", data.owned, " of ", data.total )
	
	for index = 1, total do
		
		local i = C_ToyBox.GetToyFromIndex( index )
		local i, name, icon = C_ToyBox.GetToyInfo( i )
		local hastoy = PlayerHasToy( i )
		local fav = C_ToyBox.GetIsFavorite( i )
		
		--ArkInventory.Output( i, " / ", name )
		if ( not update ) and ( ( not data.cache[i] ) or ( data.cache[i].owned ~= hastoy or data.cache[i].fav ~= fav ) ) then
			update = true
		end
		
		if not data.cache[i] then
			data.cache[i] = {
				index = index,
				item = i,
				name = name,
				link = C_ToyBox.GetToyLink( i ),
				texture = icon,
			}
		end
		
		data.cache[i].owned = hastoy
		data.cache[i].fav = fav
		
		ArkInventory.ThreadYield_Scan( thread_id )
		
	end
	
	--ArkInventory.Output( "Toybox: End Scan @ ", time( ), " ( ", data.owned, " of ", data.total, " )" )
	
	FilterActionRestore( )
	
	ArkInventory.Collection.Toybox.ready = true
	
	if update then
		ArkInventory.ScanCollectionToybox( )
	end
	
	return true
	
end


function ArkInventory.Collection.Toybox.OnHide( )
	filter.ignore = false
	ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_TOYBOX_RELOAD_BUCKET", "RESCAN" )
end

function ArkInventory.Collection.Toybox.IsReady( )
	return ArkInventory.Collection.Toybox.ready
end

function ArkInventory.Collection.Toybox.GetCount( )
	return ArkInventory.Collection.Toybox.owned, ArkInventory.Collection.Toybox.total
end

function ArkInventory.Collection.Toybox.GetToy( value )
	if type( value ) == "number" then
		return ArkInventory.Collection.Toybox.cache[value]
	end
end

function ArkInventory.Collection.Toybox.Iterate( )
	return ArkInventory.spairs( ArkInventory.Collection.Toybox.cache, function( a, b ) return ( ArkInventory.Collection.Toybox.cache[a].item or 0 ) < ( ArkInventory.Collection.Toybox.cache[b].item or 0 ) end )
end

function ArkInventory.Collection.Toybox.Summon( index )
	local obj = ArkInventory.Collection.Toybox.GetToy( index )
	if obj then
		--UseToy( obj.item ) -- secure action, cant be done
	end
end

function ArkInventory.Collection.Toybox.GetFavorite( index )
	local obj = ArkInventory.Collection.Toybox.GetToy( index )
	if obj then
		return C_ToyBox.GetIsFavorite( obj.item )
	end
end

function ArkInventory.Collection.Toybox.SetFavorite( index, value )
	local obj = ArkInventory.Collection.Toybox.GetToy( index )
	if obj then
		C_ToyBox.SetIsFavorite( obj.item, value )
	end
end



function ArkInventory:EVENT_WOW_COLLECTION_TOYBOX_RELOAD( event, ... )
	
	--ArkInventory.Output( "EVENT_WOW_COLLECTION_TOYBOX_RELOAD( ", event, " )" )
	
	ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_TOYBOX_RELOAD_BUCKET", event )
	
end

function ArkInventory:EVENT_ARKINV_COLLECTION_TOYBOX_RELOAD_BUCKET( events )
	
	--ArkInventory.Output( "EVENT_ARKINV_COLLECTION_TOYBOX_RELOAD_BUCKET( ", events, " )" )
	
	if not ArkInventory:IsEnabled( ) then return end
	
	local loc_id = ArkInventory.Const.Location.Toybox
	
	if not ArkInventory.LocationIsMonitored( loc_id ) then
		--ArkInventory.Output( "IGNORED (TOYBOX NOT MONITORED)" )
		return
	end
	
	if ToyBox:IsVisible( ) then
		--ArkInventory.Output( "IGNORED (TOYBOX OPEN)" )
		return
	end
	
	ArkInventory.Collection.Toybox.Scan( )
	
end
