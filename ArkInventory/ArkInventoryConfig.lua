local _G = _G
local select = _G.select
local pairs = _G.pairs
local ipairs = _G.ipairs
local string = _G.string
local type = _G.type
local error = _G.error
local table = _G.table


function ArkInventory.Frame_Config_Hide( )
	return ArkInventory.Lib.Dialog:Close( ArkInventory.Const.Frame.Config.Internal )
end
	
function ArkInventory.Frame_Config_Show( ... )
	
	if not IsAddOnLoaded( "ArkInventoryConfig" ) then
		
		local loaded, reason = LoadAddOn( "ArkInventoryConfig" )
		if reason then
			ArkInventory.OutputError( "Failed to load configuration module: ", getglobal( "ADDON_" .. reason ) )
			return
		end
		
		ArkInventory:SendMessage( "EVENT_ARKINV_CONFIG_UPDATE" )
		
	end
	
	ArkInventory.Config.Frame = ArkInventory.Lib.Dialog:Open( ArkInventory.Const.Frame.Config.Internal, ... )
	
end

function ArkInventory.Frame_Config_Toggle( )

	if not ArkInventory.Frame_Config_Hide( ) then
		ArkInventory.Frame_Config_Show( )
	end
	
end

function ArkInventory.ConfigBlizzard( )
	
	local path = ArkInventory.Config.Blizzard
	
	path.args = {
		version = {
			order = 100,
			name = ArkInventory.Global.Version,
			type = "description",
		},
		notes = {
			order = 200,
			name = function( )
				local t = GetAddOnMetadata( ArkInventory.CONST.PROGRAM_NAME, string.format( "Notes-%s", GetLocale( ) ) ) or ""
				if t == "" then
					t = GetAddOnMetadata( ArkInventory.CONST.PROGRAM_NAME, "Notes" ) or ""
				end
				return t or ""
			end,
			type = "description",
		},
		config = {
			order = 300,
			name = ArkInventory.Localise["CONFIG"],
			desc = ArkInventory.Localise["CONFIG_TEXT"],
			type = "execute",
			func = function( )
				ArkInventory.Frame_Config_Show( )
			end,
		},
		enabled = {
			order = 400,
			name = ArkInventory.Localise["ENABLED"],
			type = "toggle",
			get = function( info )
				return ArkInventory:IsEnabled( )
			end,
			set = function( info, v )
				if v then
					ArkInventory:Enable( )
				else
					ArkInventory:Disable( )
				end
			end,
		},
		debug = {
			order = 500,
			name = ArkInventory.Localise["DEBUG"],
			type = "toggle",
			get = function( info )
				return ArkInventory.Const.Debug
			end,
			set = function( info, v )
				ArkInventory.OutputDebugModeSet( not ArkInventory.Const.Debug )
			end,
		},
		
		-- slash commands
		
		restack = {
			guiHidden = true,
			order = 9000,
			type = "execute",
			name = ArkInventory.Localise["RESTACK"],
			desc = ArkInventory.Localise["RESTACK_TEXT"],
			func = function( )
				ArkInventory.Restack( ArkInventory.Const.Location.Bag )
			end,
		},
		
		cache = {
			guiHidden = true,
			order = 9000,
			name = ArkInventory.Localise["SLASH_CACHE"],
			desc = ArkInventory.Localise["SLASH_CACHE_TEXT"],
			type = "group",
			args = {
				erase = {
					name = ArkInventory.Localise["SLASH_CACHE_ERASE"],
					desc = ArkInventory.Localise["SLASH_CACHE_ERASE_TEXT"],
					type = "group",
					args = {
						confirm = {
							name = ArkInventory.Localise["SLASH_CACHE_ERASE_CONFIRM"],
							desc = ArkInventory.Localise["SLASH_CACHE_ERASE_CONFIRM_TEXT"],
							type = "execute",
							func = function( )
								ArkInventory.EraseSavedData( )
							end,
						},
					},
				},
			},
		},
		
		edit = {
			guiHidden = true,
			order = 9000,
			name = ArkInventory.Localise["MENU_ACTION_EDITMODE"],
			type = "execute",
			func = function( )
				ArkInventory.Frame_Main_Show( ArkInventory.Const.Location.Bag )
				ArkInventory.ToggleEditMode( )
			end,
		},
		
		rules = {
			guiHidden = true,
			order = 9000,
			name = ArkInventory.Localise["CATEGORY_RULE_PLURAL"],
			type = "execute",
			func = function( )
				ArkInventory.Frame_Rules_Toggle( )
			end,
		},
		
		search = {
			guiHidden = true,
			order = 9000,
			name = ArkInventory.Localise["SEARCH"],
			type = "execute",
			func = function( )
				ArkInventory.Frame_Search_Toggle( )
			end,
		},
		
		track = {
			guiHidden = true,
			order = 9000,
			name = ArkInventory.Localise["SLASH_TRACK"],
			desc = ArkInventory.Localise["SLASH_TRACK_TEXT"],
			type = "input",
			set = function( info, v )
				
				local name, h = GetItemInfo( v )
				
				if not name or not h then
					ArkInventory.OutputWarning( "no matching item found: ", v )
					return
				end
				
				local osd = ArkInventory.ObjectStringDecode( h )
				
				if osd[1] ~= "item" then
					ArkInventory.OutputWarning( "not an item: ", v )
					return
				end
				
				local id = osd[2]
				
				if ArkInventory.db.global.option.tracking.items[id] then
					--remove
					ArkInventory.db.global.option.tracking.items[id] = nil
					ArkInventory.Global.Me.data.ldb.tracking.item.tracked[id] = false
					ArkInventory.Output( string.format( ArkInventory.Localise["SLASH_TRACK_REMOVE_TEXT"], h ) )
				else
					--add
					ArkInventory.db.global.option.tracking.items[id] = true
					ArkInventory.Global.Me.data.ldb.tracking.item.tracked[id] = true
					ArkInventory.Output( string.format( ArkInventory.Localise["SLASH_TRACK_ADD_TEXT"], h ) )
				end
				
				ArkInventory.LDB.Tracking_Item:Update( )
				
			end,
		},
		
		translate = {
			guiHidden = true,
			order = 9000,
			name = "translate", -- ArkInventory.Localise["MENU_ACTION_EDITMODE"],
			desc = "attempts to get translations from the game again, a ui reload might be better",
			type = "execute",
			func = function( )
				ArkInventory.TranslateTryAgain( )
			end,
		},
		
		reposition = {
			guiHidden = true,
			order = 9000,
			name = "Reposition",
			desc = "repositions all arkinventory frames inside the game window, if the frame is already fully inside then it wont move",
			type = "execute",
			func = function( )
				ArkInventory.Frame_Main_Reposition_All( )
			end,
		},
		
		summon = {
			guiHidden = true,
			order = 9000,
			name = "summon a pet or mount",
			type = "group",
			args = {
				mount = {
					order = 100,
					name = ArkInventory.Localise["LDB_MOUNTS_SUMMON"],
					type = "execute",
					func = function( )
						ArkInventory.LDB.Mounts.OnClick( )
					end,
				},
				pet = {
					order = 100,
					name = ArkInventory.Localise["LDB_PETS_SUMMON"],
					type = "execute",
					func = function( )
						ArkInventory.LDB.Pets.OnClick( )
					end,
				},
			},
		},
		
--[[
		db = {
			guiHidden = true,
			order = 9000,
			name = ArkInventory.Localise["SLASH_DB"],
			desc = ArkInventory.Localise["SLASH_DB_TEXT"],
			type = "group",
			args = {
				reset = {
					name = ArkInventory.Localise["SLASH_DB_RESET"],
					desc = ArkInventory.Localise["SLASH_DB_RESET_TEXT"],
					type = "group",
					args = {
						confirm = {
							name = ArkInventory.Localise["SLASH_DB_RESET_CONFIRM"],
							desc = ArkInventory.Localise["SLASH_DB_RESET_CONFIRM_TEXT"],
							type = "execute",
							func = function( )
								ArkInventory.DatabaseReset( )
							end,
						},
					},
				},
			},
		},
]]--
		
		petbattlehelp = {
			guiHidden = true,
			cmdHidden = true,
			order = 12000,
			name = "petbattlehelp",
			desc = "attempts to help you pick appropriate battle pets for the current battle",
			type = "execute",
			func = function( )
				ArkInventory:EVENT_WOW_BATTLEPET_OPENING_DONE( "MANUAL_COMMAND", "PET_BATTLE_HELP" )
			end,
		},
		
	}
	
end

function ArkInventory.ToggleShowHiddenItems( )
	ArkInventory.Global.Options.ShowHiddenItems = not ArkInventory.Global.Options.ShowHiddenItems
	ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
end


function ArkInventory.ConfigInternalDesignAdd( name )
	
	local v = ArkInventory.db.global.option.design
	
	local p, data = ArkInventory.CategoryGetNext( v )

	if p == -1 then
		ArkInventory.OutputError( string.format( ArkInventory.Localise["CONFIG_LIST_ADD_LIMIT_TEXT"], ArkInventory.Localise["CONFIG_DESIGN_PLURAL"] ) )
		return
	end
	
	if p == -2 then
		ArkInventory.OutputError( string.format( ArkInventory.Localise["CONFIG_LIST_ADD_UPGRADE_TEXT"], ArkInventory.Localise["CONFIG_DESIGN"] ) )
		return
	end
	
	
	data.used = "Y"
	data.name = string.trim( name )
	
	return p, data
	
end

function ArkInventory.ConfigInternalDesignGet( id )
	return ArkInventory.db.global.option.design.data[id]
end

function ArkInventory.ConfigInternalDesignDelete( id )
	local v = ArkInventory.ConfigInternalDesignGet( id )
	v.used = "D"
end

function ArkInventory.ConfigInternalDesignRestore( id )
	local v = ArkInventory.ConfigInternalDesignGet( id )
	v.used = "Y"
end

function ArkInventory.ConfigInternalDesignRename( id, name )
	
	local v = ArkInventory.ConfigInternalDesignGet( id )
	v.name = string.trim( name )
	
end

function ArkInventory.ConfigInternalDesignCopy( src, id )
	
	if src == 9999 and id == 9999 then
		src = 0
	end
	
	if src == id then
		return
	end
	
	local v = ArkInventory.db.global.option.design.data
	
	local used = v[id].used
	local system = v[id].system
	local name = v[id].name
	
	v[id] = ArkInventory.Table.Copy( v[src] )
	
	v[id].used = used
	v[id].system = system
	v[id].name = name
	
end

function ArkInventory.ConfigInternalDesignPurge( id )
	
	ArkInventory.ConfigInternalDesignCopy( 0, id )
	
	local v = ArkInventory.ConfigInternalDesignGet( id )
	v.used = "N"
	v.name = ""
	
end

function ArkInventory.ConfigInternalDesignExport( id )
	
	local data = {
		["sort"] = { },
		["cat"] = { }
	}
	data.design = ArkInventory.ConfigInternalDesignGet( id )
	
	-- sort methods
	if data.design.sort.method and data.design.sort.method < ArkInventory.Const.Category.Max then
		data.design.sort.method = 9999
--		data.sort[data.design.sort.method] = ArkInventory.Table.Copy( ArkInventory.ConfigInternalSortMethodGet( data.design.sort.method ) )
--		ArkInventory.Table.removeDefaults( data.sort[data.design.sort.method], ArkInventory.ConfigInternalSortMethodGet( 0 ) )
	end
	
	for k, v in pairs( data.design.bar.data ) do
		if v.sort.method and v.sort.method < ArkInventory.Const.Category.Max then
			v.sort.method = 9999
--			data.sort[data.design.sort.method] = ArkInventory.Table.Copy( ArkInventory.ConfigInternalSortMethodGet( v.sort.method ) )
--			ArkInventory.Table.removeDefaults( data.sort[data.design.sort.method], ArkInventory.ConfigInternalSortMethodGet( 0 ) )
		end
	end
	
	-- categories
	for k, v in pairs( data.design.category ) do
		
		local cat_type, cat_code = ArkInventory.CategoryCodeSplit( k )
		if cat_type == ArkInventory.Const.Category.Type.Rule then
			data.design.category[k] = nil
		elseif cat_type == ArkInventory.Const.Category.Type.Custom then
			data.design.category[k] = nil
--			data.cat[k] = ArkInventory.Table.Copy( ArkInventory.ConfigInternalSortMethodGet( cat_code ) )
--			ArkInventory.Table.removeDefaults( data.cat[k], ArkInventory.ConfigInternalCategoryCustomGet( 0 ) )
		else
			-- system category, dont care
		end
		
--		data.cat[k] = k
		
	end
	
	-- clean design
	data.design = ArkInventory.Table.Copy( data.design )
	ArkInventory.Table.removeDefaults( data.design, ArkInventory.ConfigInternalDesignGet( 0 ) )
	
	
	data = ArkInventory.Lib.Serializer:Serialize( data )
	
	ArkInventory.Lib.StaticDialog:Spawn( "DESIGN_EXPORT", data )
	
end

function ArkInventory.ConfigInternalDesignImport( src )
	
	local src = src or ""
	local ok
	
	ok, src = ArkInventory.Lib.Serializer:Deserialize( src )
	if not ok then
		ArkInventory.OutputError( "Failed to deserialize import string: ", src )
		return
	end
	
	if not src.design or not src.cat or not src.sort then
		ArkInventory.OutputError( "Import string is not valid" )
		return
	end
	
	for k, v in pairs( src.cat ) do
		
	end
	
	
	for k, v in pairs( src.sort ) do
		
	end
	
	
	local p, data = ArkInventory.ConfigInternalDesignAdd( "imported" )
	if p > 1 then
		
		ArkInventory.Table.Merge( src.design, data )
		
		data.used = "Y"
		data.system = false
		
	end
	
	ArkInventory:SendMessage( "EVENT_ARKINV_CONFIG_UPDATE", "DESIGN" )
	
end


function ArkInventory.ConfigInternalCategoryCustomAdd( name )
	
	local t = ArkInventory.Const.Category.Type.Custom
	local v = ArkInventory.db.global.option.category[t]
	
	local p, data = ArkInventory.CategoryGetNext( v )
	
	if p == -1 then
		ArkInventory.OutputError( string.format( ArkInventory.Localise["CONFIG_LIST_ADD_LIMIT_TEXT"], ArkInventory.Localise["CONFIG_CATEGORY_CUSTOM_PLURAL"] ) )
		return
	end
	
	if p == -2 then
		ArkInventory.OutputError( string.format( ArkInventory.Localise["CONFIG_LIST_ADD_UPGRADE_TEXT"], ArkInventory.Localise["CONFIG_CATEGORY_CUSTOM"] ) )
		return
	end
	
	data.used = "Y"
	data.name = string.trim( name )
	
	ArkInventory.CategoryGenerate( )
	
	return p, data
	
end

function ArkInventory.ConfigInternalCategoryCustomGet( id )
	return ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Custom].data[id]
end

function ArkInventory.ConfigInternalCategoryCustomDelete( id )
	
	local v = ArkInventory.ConfigInternalCategoryCustomGet( id )
	v.used = "D"
	
	ArkInventory.CategoryGenerate( )
	
end

function ArkInventory.ConfigInternalCategoryCustomRestore( id )
	
	local v = ArkInventory.ConfigInternalCategoryCustomGet( id )
	v.used = "Y"
	
	ArkInventory.CategoryGenerate( )
	
end

function ArkInventory.ConfigInternalCategoryCustomRename( id, name )
	
	local v = ArkInventory.ConfigInternalCategoryCustomGet( id )
	v.name = string.trim( name )
	
	ArkInventory.CategoryGenerate( )
	
end

function ArkInventory.ConfigInternalCategoryCustomCopy( src, id )
	
	if src == id then
		return
	end
	
	local t = ArkInventory.Const.Category.Type.Custom
	local v = ArkInventory.db.global.option.category[t].data
	
	local used = v[id].used
	local system = v[id].system
	local name = v[id].name
	
	v[id] = ArkInventory.Table.Copy( v[src] )
	
	v[id].used = used
	v[id].system = system
	v[id].name = name
	
end

function ArkInventory.ConfigInternalCategoryCustomPurge( id )
	
	ArkInventory.ConfigInternalCategoryCustomCopy( 0, id )
	
	local v = ArkInventory.ConfigInternalCategoryCustomGet( id )
	v.used = "N"
	v.name = ""
	
end


function ArkInventory.ConfigInternalCategoryRuleAdd( name )
	
	local t = ArkInventory.Const.Category.Type.Rule
	local v = ArkInventory.db.global.option.category[t]
	
	local p, data = ArkInventory.CategoryGetNext( v )
	
	if p == -1 then
		ArkInventory.OutputError( string.format( ArkInventory.Localise["CONFIG_LIST_ADD_LIMIT_TEXT"], ArkInventory.Localise["CONFIG_CATEGORY_RULE_PLURAL"] ) )
		return
	end
	
	if p == -2 then
		ArkInventory.OutputError( string.format( ArkInventory.Localise["CONFIG_LIST_ADD_UPGRADE_TEXT"], ArkInventory.Localise["CONFIG_CATEGORY_RULE"] ) )
		return
	end
	
	data.used = "Y"
	data.name = string.trim( name )
	
	ArkInventory.CategoryGenerate( )
	
	return p, data
	
end

function ArkInventory.ConfigInternalCategoryRuleGet( id )
	return ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Rule].data[id]
end

function ArkInventory.ConfigInternalCategoryRuleDelete( id )
	
	local v = ArkInventory.ConfigInternalCategoryRuleGet( id )
	v.used = "D"
	
	ArkInventory.CategoryGenerate( )
	
end

function ArkInventory.ConfigInternalCategoryRuleRestore( id )
	
	local v = ArkInventory.ConfigInternalCategoryRuleGet( id )
	v.used = "Y"
	
	ArkInventory.CategoryGenerate( )
	
end

function ArkInventory.ConfigInternalCategoryRuleRename( id, name )
	
	local v = ArkInventory.ConfigInternalCategoryRuleGet( id )
	v.name = string.trim( name )
	
	ArkInventory.CategoryGenerate( )
	
end

function ArkInventory.ConfigInternalCategoryRuleCopy( src, id )
	
	if src == id then
		return
	end
	
	local t = ArkInventory.Const.Category.Type.Rule
	local v = ArkInventory.db.global.option.category[t].data
	
	local used = v[id].used
	local system = v[id].system
	local name = v[id].name
	
	v[id] = ArkInventory.Table.Copy( v[src] )
	
	v[id].used = used
	v[id].system = system
	v[id].name = name
	
end

function ArkInventory.ConfigInternalCategoryRulePurge( id )
	
	ArkInventory.ConfigInternalCategoryRuleCopy( 0, id )
	
	local v = ArkInventory.ConfigInternalCategoryRuleGet( id )
	v.used = "N"
	v.name = ""
	
end


function ArkInventory.ConfigInternalSortMethodMoveDown( id, s )

	local p = false
	local t = ArkInventory.db.global.option.sort.method.data[id].order
	
	for k, v in ipairs( t ) do
		if s == v then
			p = k
			break
		end
	end

	if not p then
		return
	end
	
	if not t[p+1] then
		-- already at the bottom
		return
	end
	
	local x, y = t[p + 1], t[p]
	t[p], t[p + 1] = x, y
	
end

function ArkInventory.ConfigInternalSortMethodMoveUp( id, s )

	local p = false
	local t = ArkInventory.db.global.option.sort.method.data[id].order
	
	for k, v in ipairs( t ) do
		if s == v then
			p = k
			break
		end
	end

	if not p or p == 1 then
		return
	end
	
	local x, y = t[p - 1], t[p]
	t[p], t[p - 1] = x, y
	
end

function ArkInventory.ConfigInternalSortMethodGetPosition( id, key )

	local p = 9000
	local v = ArkInventory.ConfigInternalSortMethodGet( id )
	
	for sm_pos, sm_key in ipairs( v.order ) do
		if sm_key == key then
			p = sm_pos
			break
		end
	end
	
	return p, #v.order
	
end

function ArkInventory.ConfigInternalSortMethodCheck( id )
	
	for sid, data in pairs( ArkInventory.db.global.option.sort.method.data ) do
		
		if id == nil or sid == id then
			
			-- add mising keys
			for s in pairs( ArkInventory.Const.SortKeys ) do
				
				local ok = false
				
				for _, v in ipairs( data.order ) do
					if s == v then
						ok = true
						break
					end
				end
				
				if not ok then
					data.order[#data.order + 1] = s
				end
				
			end
			
			-- remove old keys from order
			for k, v in ipairs( data.order ) do
				if not ArkInventory.Const.SortKeys[v] then
					tremove( data.order, k )
				end
			end
			
			-- check active table
			if not data.active or type( data.active ) ~= "table" then
				data.active = { }
			end
			
			-- remove old keys from active table
			for k in pairs( data.active ) do
				if not ArkInventory.Const.SortKeys[k] then
					data.active[k] = nil
				end
			end
			
		end
		
	end
		
end

function ArkInventory.ConfigInternalSortMethodAdd( name )
	
	local v = ArkInventory.db.global.option.sort.method
	local p, data = ArkInventory.CategoryGetNext( v )

	if p == -1 then
		ArkInventory.OutputError( string.format( ArkInventory.Localise["CONFIG_LIST_ADD_LIMIT_TEXT"], ArkInventory.Localise["CONFIG_SORTING_METHOD_PLURAL"] ) )
		return
	end
	
	if p == -2 then
		ArkInventory.OutputError( string.format( ArkInventory.Localise["CONFIG_LIST_ADD_UPGRADE_TEXT"], ArkInventory.Localise["CONFIG_SORTING_METHOD"] ) )
		return
	end
	
	data.used = "Y"
	data.name = string.trim( name )
	
	ArkInventory.ConfigInternalSortMethodCheck( p )
	
	--ArkInventory.Output( "Added sortkey: ", name, " at ", ArkInventory.db.global.option.sort.method.next )
	
	ArkInventory:SendMessage( "EVENT_ARKINV_CONFIG_UPDATE" )
	
end

function ArkInventory.ConfigInternalSortMethodGet( id )
	return ArkInventory.db.global.option.sort.method.data[id]
end

function ArkInventory.ConfigInternalSortMethodDelete( id )
	local v = ArkInventory.ConfigInternalSortMethodGet( id )
	v.used = "D"
end

function ArkInventory.ConfigInternalSortMethodRestore( id )
	local v = ArkInventory.ConfigInternalSortMethodGet( id )
	v.used = "Y"
end

function ArkInventory.ConfigInternalSortMethodRename( id, name )
	
	local v = ArkInventory.ConfigInternalSortMethodGet( id )
	v.name = string.trim( name )
	
end

function ArkInventory.ConfigInternalSortMethodCopy( src, id )
	
	if src == id then
		return
	end
	
	local v = ArkInventory.db.global.option.sort.method.data
	
	local used = v[id].used
	local system = v[id].system
	local name = v[id].name
	
	v[id] = ArkInventory.Table.Copy( v[src] )
	
	v[id].used = used
	v[id].system = system
	v[id].name = name
	
end

function ArkInventory.ConfigInternalSortMethodPurge( id )
	
	ArkInventory.ConfigInternalSortMethodCopy( 0, id )
	
	local v = ArkInventory.ConfigInternalSortMethodGet( id )
	v.used = "N"
	v.name = ""
	ArkInventory.Table.Clean( v.active )
	ArkInventory.Table.Clean( v.order )
	
end



function ArkInventory.ConfigInternalCategorysetAdd( name )
	
	local v = ArkInventory.db.global.option.catset
	
	local p, data = ArkInventory.CategoryGetNext( v )
	
	if p == -1 then
		ArkInventory.OutputError( string.format( ArkInventory.Localise["CONFIG_LIST_ADD_LIMIT_TEXT"], ArkInventory.Localise["CONFIG_CATEGORY_SET_PLURAL"] ) )
		return
	end
	
	if p == -2 then
		ArkInventory.OutputError( string.format( ArkInventory.Localise["CONFIG_LIST_ADD_UPGRADE_TEXT"], ArkInventory.Localise["CONFIG_CATEGORY_SET"] ) )
		return
	end
	
	data.used = "Y"
	data.name = string.trim( name )
	
	return p, data
	
end

function ArkInventory.ConfigInternalCategorysetGet( id )
	return ArkInventory.db.global.option.catset.data[id]
end

function ArkInventory.ConfigInternalCategorysetDelete( id )
	
	local v = ArkInventory.ConfigInternalCategorysetGet( id )
	v.used = "D"
	
end

function ArkInventory.ConfigInternalCategorysetRestore( id )
	
	local v = ArkInventory.ConfigInternalCategorysetGet( id )
	v.used = "Y"
	
end

function ArkInventory.ConfigInternalCategorysetRename( id, name )
	
	local v = ArkInventory.ConfigInternalCategorysetGet( id )
	v.name = string.trim( name )
	
end

function ArkInventory.ConfigInternalCategorysetCopy( src, id )
	
	if src == id then
		return
	end
	
	local v = ArkInventory.db.global.option.catset.data[t]
	
	local used = v[id].used
	local system = v[id].system
	local name = v[id].name
	
	v[id] = ArkInventory.Table.Copy( v[src] )
	
	v[id].used = used
	v[id].system = system
	v[id].name = name
	
end

function ArkInventory.ConfigInternalCategorysetPurge( id )
	
	ArkInventory.ConfigInternalCategorysetCopy( 0, id )
	
	local v = ArkInventory.ConfigInternalCategorysetGet( id )
	v.used = "N"
	v.name = ""
	
end
