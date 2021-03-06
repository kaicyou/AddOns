local _G = _G
local select = _G.select
local pairs = _G.pairs
local ipairs = _G.ipairs
local string = _G.string
local type = _G.type
local error = _G.error
local table = _G.table
local C_MountJournal = _G.C_MountJournal

local PLAYER_MOUNT_LEVEL = 20

ArkInventory.Collection.Mount = {
	total = 0,
	owned = 0,
	cache = { },
	types = { }, -- [spell] = value
}


-- the UI filters have no impact on the C_MountJournal returns so we can skip checking them


function ArkInventory.Collection.Mount.OnHide( )
	ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_MOUNT_RELOAD_BUCKET", "RESCAN" )
end

function ArkInventory.Collection.Mount.IsReady( )
	return ( ArkInventory.Collection.Mount.total > 0 )
end

function ArkInventory.Collection.Mount.GetCount( )
	return ArkInventory.Collection.Mount.owned, ArkInventory.Collection.Mount.total
end

function ArkInventory.Collection.Mount.GetMount( id )
	if type( id ) == "number" then
		return ArkInventory.Collection.Mount.cache[id]
	end
end

function ArkInventory.Collection.Mount.GetMountBySpell( spell )
	for _, v in pairs( ArkInventory.Collection.Mount.cache ) do
		if v.spell == spell then
			return v
		end
	end
end

function ArkInventory.Collection.Mount.Iterate( )
	return ArkInventory.spairs( ArkInventory.Collection.Mount.cache, function( a, b ) return ( ArkInventory.Collection.Mount.cache[a].name or "" ) < ( ArkInventory.Collection.Mount.cache[b].name or "" ) end )
end

function ArkInventory.Collection.Mount.Dismiss( )
	C_MountJournal.Dismiss( )
end

function ArkInventory.Collection.Mount.Summon( id )
	local obj = ArkInventory.Collection.Mount.GetMount( id )
	if obj then
		C_MountJournal.SummonByID( obj.index )
	end
end

function ArkInventory.Collection.Mount.GetFavorite( id )
	local obj = ArkInventory.Collection.Mount.GetMount( id )
	if obj then
		return C_MountJournal.GetIsFavorite( obj.index )
	end
end

function ArkInventory.Collection.Mount.SetFavorite( id, value )
	-- value = true|false
	local obj = ArkInventory.Collection.Mount.GetMount( id )
	--ArkInventory.Output( id, " / ", value, " (", type(value), ") / ", obj )
	if obj then
		C_MountJournal.SetIsFavorite( obj.index, value )
	end
end

function ArkInventory.Collection.Mount.IsUsable( id )
	local obj = ArkInventory.Collection.Mount.GetMount( id )
	-- and yes its still buggy and returning true when you cant actually use the mount
	if obj then
		return ( select( 5, C_MountJournal.GetMountInfoByID( obj.index ) ) )
	end
end

function ArkInventory.Collection.Mount.SkillLevel( )
	
	local skill = 1
	
	if UnitLevel( "player" ) >= PLAYER_MOUNT_LEVEL then
		
		if GetSpellInfo( ( GetSpellInfo( 90265 ) ) ) then -- master
			skill = 300
			--ArkInventory.Output( "riding skill = ", skill, " / master" )
		elseif GetSpellInfo( ( GetSpellInfo( 34091 ) ) ) then -- artisan
			skill = 300
			--ArkInventory.Output( "riding skill = ", skill, " / artisan" )
		elseif GetSpellInfo( ( GetSpellInfo( 34090 ) ) ) then -- expert
			skill = 225
			--ArkInventory.Output( "riding skill = ", skill, " / expert" )
		elseif GetSpellInfo( ( GetSpellInfo( 33391 ) ) ) then -- journeyman
			skill = 150
			--ArkInventory.Output( "riding skill = ", skill, " / journeyman" )
		elseif GetSpellInfo( ( GetSpellInfo( 33388 ) ) ) then -- apprentice
			skill = 75
			--ArkInventory.Output( "riding skill = ", skill, " / apprentice" )
		end
		
	end
	
	return skill
	
end

function ArkInventory.Collection.Mount.StoreMountType( spell, mt )
	ArkInventory.Collection.Mount.types[spell] = mt
end

function ArkInventory.Collection.Mount.ApplyUserCorrections( )
	
	-- apply user corrections (these are global settings so the mount may not exist for this character)
	
	for _, md in ArkInventory.Collection.Mount.Iterate( ) do
		
		local correction = ArkInventory.db.option.mount.correction[md.spell]
		
		if correction ~= nil then -- check for nil as we use both true and false
			if correction == md.mto then
				-- code has been updated, clear correction
				--ArkInventory.Output( "clearing mount correction ", md.spell, ": system=", md.mt, ", correction=", correction )
				ArkInventory.db.option.mount.correction[md.spell] = nil
				md.mt = md.mto
			else
				-- apply correction
				--ArkInventory.Output( "correcting mount ", md.spell, ": system=", md.mt, ", correction=", correction )
				md.mt = correction
			end
		end
		
	end
	
end

function ArkInventory.Collection.Mount.Scan( )
	
	local thread_id = string.format( ArkInventory.Global.Thread.Format.Collection, "mount" )
	
	if not ArkInventory.Global.Thread.Use then
		local tz = debugprofilestop( )
		ArkInventory.OutputThread( thread_id, " start" )
		ArkInventory.Collection.Mount.Scan_Threaded( )
		tz = debugprofilestop( ) - tz
		ArkInventory.OutputThread( string.format( "%s took %0.0fms", thread_id, tz ) )
		return
	end

	local tf = function ( )
		ArkInventory.Collection.Mount.Scan_Threaded( thread_id )
	end
	
	ArkInventory.ThreadStart( thread_id, tf )
	
end

function ArkInventory.Collection.Mount.Scan_Threaded( thread_id )
	
	if ArkInventory.Global.Mode.Combat then
		-- set to scan when leaving combat
		ArkInventory.Global.LeaveCombatRun.Mount = true
		return
	end
	
	local total = C_MountJournal.GetNumMounts( )
	
	if total == 0 then
		return
	end
	
	local update = false
	
	if ArkInventory.Collection.Mount.total ~= total then
		ArkInventory.Collection.Mount.total = total
		update = true
	end
	
	ArkInventory.Collection.Mount.owned = 0
	
	local c = ArkInventory.Collection.Mount.cache
	
	for _, i in pairs( C_MountJournal.GetMountIDs( ) ) do
		
		local name, spell, icon, active, usable, source, fav, factionSpecific, faction, hide, owned, id = C_MountJournal.GetMountInfoByID( i )
		
		if not hide then
			
			-- only look at the bits for this toon, not any variants that are hidden
			
			if owned then
				ArkInventory.Collection.Mount.owned = ArkInventory.Collection.Mount.owned + 1
			end
			
			if ( not update ) and ( not c[i] or c[i].owned ~= owned or c[i].fav ~= fav or c[i].usable ~= usable or c[i].active ~= active )then
				update = true
			end
		
			if not c[i] then
				
				local display, description, source, self, mt = C_MountJournal.GetMountInfoExtraByID( i )
				
				c[i] = {
					index = i,
					name = name,
					spell = spell,
					link = GetSpellLink( spell ),
					--texture = icon,
					desc = description,
					src = source,
					did = display,
				}
				
				if mt == 230 or mt == 231 or mt == 241 then
					-- land
					mt = ArkInventory.Const.MountTypes["l"]
				elseif mt == 242 or mt == 247 or mt == 248 then
					-- flying
					mt = ArkInventory.Const.MountTypes["a"]
				elseif mt == 231 or mt == 232 then
					--underwater
					mt = ArkInventory.Const.MountTypes["u"]
				elseif mt == 269 then
					-- surface
					mt = ArkInventory.Const.MountTypes["s"]
				else
					-- unknown
					mt = nil
				end
				
				--ArkInventory.Output( i, " = ", spell, " / ", string.format("%.12f",spell) )
				
				c[i].mt = ArkInventory.Collection.Mount.types[spell] or mt or ArkInventory.Const.MountTypes["x"]
				c[i].mto = c[i].mt -- save original mount type (user corrections can override the other value)
				
			end
			
			c[i].owned = owned
			c[i].fav = fav
			c[i].usable = usable
			c[i].active = active
			
		else
			--ArkInventory.Output( "hidden = ", spell, " / ", name )
		end
		
		ArkInventory.ThreadYield_Scan( thread_id )
		
	end
	
	--ArkInventory.Collection.Mount.ApplyUserCorrections( )
	
	return update
	
end


function ArkInventory:EVENT_WOW_COLLECTION_MOUNT_RELOAD( event )
	
	if event ~= "COMPANION_UPDATE" then
		ArkInventory:SendMessage( "EVENT_ARKINV_COLLECTION_MOUNT_RELOAD_BUCKET", event )
	end
	
end

function ArkInventory:EVENT_ARKINV_COLLECTION_MOUNT_RELOAD_BUCKET( events )
	
	--ArkInventory.Output( "EVENT_ARKINV_COLLECTION_MOUNT_RELOAD_BUCKET( ", events, " )" ) -- ****
	
	if not ArkInventory:IsEnabled( ) then return end
	
	local loc_id = ArkInventory.Const.Location.Mount
	
	if not ArkInventory.LocationIsMonitored( loc_id ) then
		--ArkInventory.Output( "IGNORED (NOT MONITORED)" )
		return
	end
	
	if MountJournal and MountJournal:IsVisible( ) then
		--ArkInventory.Output( "IGNORED (MOUNT JOURNAL OPEN)" )
		return
	end
	
	local update = ArkInventory.Collection.Mount.Scan( )
	
	if update then
		ArkInventory.ScanCollectionMount( )
	end
	
end
