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

local journal = {
	total = 0, -- number of total mounts
	owned = 0, -- number of owned mounts
	cache = { }, -- [id] = { }
	types = { }, -- [spell] = value
}

ArkInventory.MountJournal = { }

function ArkInventory.MountJournal.OnHide( )
	ArkInventory:SendMessage( "EVENT_ARKINV_MOUNTJOURNAL_RELOAD_BUCKET", "RESCAN" )
end


function ArkInventory.MountJournal.JournalIsReady( )
	return ( journal.total > 0 )
end

function ArkInventory.MountJournal.GetCount( )
	return journal.owned, journal.total
end

function ArkInventory.MountJournal.GetMount( id )
	if type( id ) == "number" then
		return journal.cache[id]
	end
end

function ArkInventory.MountJournal.GetMountBySpell( spell )
	for _, v in pairs( journal.cache ) do
		if v.spell == spell then
			return v
		end
	end
end


function ArkInventory.MountJournal.Iterate( )
	return ArkInventory.spairs( journal.cache, function( a, b ) return ( journal.cache[a].name or "" ) < ( journal.cache[b].name or "" ) end )
end

function ArkInventory.MountJournal.Dismiss( )
	C_MountJournal.Dismiss( )
end

function ArkInventory.MountJournal.Summon( id )
	local obj = ArkInventory.MountJournal.GetMount( id )
	C_MountJournal.SummonByID( obj.index )
end

function ArkInventory.MountJournal.GetFavorite( id )
	local obj = ArkInventory.MountJournal.GetMount( id )
	return C_MountJournal.GetIsFavorite( obj.index )
end

function ArkInventory.MountJournal.SetFavorite( id, value )
	-- value = true|false
	local obj = ArkInventory.MountJournal.GetMount( id )
	--ArkInventory.Output( id, " / ", value, " (", type(value), ") / ", obj )
	C_MountJournal.SetIsFavorite( obj.index, value )
end

function ArkInventory.MountJournal.IsUsable( id )
	local obj = ArkInventory.MountJournal.GetMount( id )
	-- and yes its still buggy and returning true when you cant actually use the mount
	return ( select( 5, C_MountJournal.GetMountInfoByID( obj.index ) ) )
end

function ArkInventory.MountJournal.SkillLevel( )
	
	local skill = 0
	
	if UnitLevel( "player" ) < PLAYER_MOUNT_LEVEL then
		
		--ArkInventory.Output( "player level is too low" )
		skill = 1
		
	else
		
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



function ArkInventory.MountJournal.Scan( )
	
	if ( ArkInventory.Global.Mode.Combat ) then
		-- set to scan when leaving combat
		ArkInventory.Global.LeaveCombatRun.MountJournal = true
		return
	end
	
	local total = C_MountJournal.GetNumMounts( )
	
	if total == 0 then
		return
	end
	
	local update = false
	
	if journal.total == 0 then
		journal.total = total
		update = true
	end
	
	journal.owned = 0
	
	local c = journal.cache
	
	for _, i in pairs( C_MountJournal.GetMountIDs( ) ) do
		
		local name, spell, icon, active, cansummon, source, fav, factionSpecific, faction, hide, owned, id = C_MountJournal.GetMountInfoByID( i )
		
		if not hide then
			
			-- only look at the spells for this toon, not any variants that are hidden
			
			if owned then
				journal.owned = journal.owned + 1
			end
			
			if ( not update ) and ( not c[i] or c[i].owned ~= owned or c[i].fav ~= fav or c[i].cansummon ~= cansummon or c[i].active ~= active )then
				update = true
			end
		
			if not c[i] then
				
				local display, description, source, self, mt = C_MountJournal.GetMountInfoExtraByID( i )
				
				c[i] = {
					index = i,
					name = name,
					spell = spell,
					link = GetSpellLink( spell ),
					icon = icon,
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
				
				c[i].mt = journal.types[spell] or mt or ArkInventory.Const.MountTypes["x"]
				c[i].mto = c[i].mt -- save original mount type (user corrections can override the other value)
				
			end
			
			c[i].owned = owned
			c[i].fav = fav
			c[i].usable = cansummon
			c[i].active = active
			
		else
			--ArkInventory.Output( "hidden = ", spell, " / ", name )
		end
		
	end
	
	--ArkInventory.MountJournal.ApplyUserCorrections( )
	
	if update then
		ArkInventory.ScanMountJournal( )
	end
	
	return true
	
end

function ArkInventory.MountJournal.StoreMountType( spell, mt )
	journal.types[spell] = mt
end

function ArkInventory.MountJournal.ApplyUserCorrections( )
	
	-- apply user corrections (these are global settings so the mount may not exist for this character)
	
	for _, md in ArkInventory.MountJournal.Iterate( ) do
		
		local correction = ArkInventory.db.global.option.mount.correction[md.spell]
		
		if correction ~= nil then -- check for nil as we use both true and false
			if correction == md.mto then
				-- code has been updated, clear correction
				--ArkInventory.Output( "clearing mount correction ", md.spell, ": system=", md.mt, ", correction=", correction )
				ArkInventory.db.global.option.mount.correction[md.spell] = nil
				md.mt = md.mto
			else
				-- apply correction
				--ArkInventory.Output( "correcting mount ", md.spell, ": system=", md.mt, ", correction=", correction )
				md.mt = correction
			end
		end
		
	end
	
end


function ArkInventory:EVENT_WOW_COLLECTION_MOUNT_RELOAD( event )
	
	if ( event ~= "COMPANION_UPDATE" ) then
		ArkInventory:SendMessage( "EVENT_ARKINV_MOUNTJOURNAL_RELOAD_BUCKET", event )
	end
	
end

function ArkInventory:EVENT_ARKINV_MOUNTJOURNAL_RELOAD_BUCKET( events )
	
	--ArkInventory.Output( "EVENT_ARKINV_MOUNTJOURNAL_RELOAD_BUCKET( ", events, " )" )
	
	loc_id = ArkInventory.Const.Location.Mount
	
	if not ArkInventory:IsEnabled( ) then
		return
	end
	
	if not ArkInventory.LocationIsMonitored( loc_id ) then
		--ArkInventory.Output( "IGNORED (NOT MONITORED)" )
		return
	end
	
	if MountJournal and MountJournal:IsVisible( ) then
		--ArkInventory.Output( "IGNORED (MOUNT JOURNAL OPEN)" )
		return
	end
	
	ArkInventory.MountJournal.Scan( )
	
end
