﻿local _G = _G
local select = _G.select
local pairs = _G.pairs
local ipairs = _G.ipairs
local string = _G.string
local type = _G.type
local error = _G.error
local table = _G.table


local function categoryRenumber( cat_old, cat_new )
	
	-- fix hard coded item assignments
	
	if ArkInventory.db.global.option.cateset then
		for k, v in pairs( ArkInventory.db.global.option.cateset.data ) do
			for k2, v2 in pairs( v.category.assign ) do
				if v2 == cat_old then
					v.category.assign[k2] = cat_new
				end
			end
		end
	end
	
end


function ArkInventory.DatabaseUpgradePreLoad( )
	
	ARKINVDB = ARKINVDB or { }
	
	if ArkInventory.Const.Program.Version >= 3.0227 then
		-- erase old factionrealm data
		if ARKINVDB.factionrealm then
			ARKINVDB.factionrealm = nil
		end
	end
	
	
	if ArkInventory.Const.Program.Version >= 30334 then
		
		ARKINVDB.global = ARKINVDB.global or { }
		ARKINVDB.global.player = ARKINVDB.global.player or { }
		ARKINVDB.global.player.data = ARKINVDB.global.player.data or { }
		
		if ARKINVDB.global.option and ARKINVDB.global.option.sort and ARKINVDB.global.option.sort.data then
			ARKINVDB.global.option.sort.method = { }
			ARKINVDB.global.option.sort.method.data = ARKINVDB.global.option.sort.data
			ARKINVDB.global.option.sort.data = nil
		end
		
		if ARKINVDB.realm then
			-- move realm into global
			
			for r, v1 in pairs( ARKINVDB.realm ) do
				
				if v1.player and v1.player.data then
					
					for n, v2 in pairs( v1.player.data ) do
						
						if string.sub( n, 1, 1 ) ~= "!" then
							
							local k = string.format( "%s%s%s", n, ArkInventory.Const.PlayerIDSep, r )
							ARKINVDB.global.player.data[k] = v2
							ARKINVDB.global.player.data[k].location = nil
							ARKINVDB.global.player.data[k].version = v1.player.version or ArkInventory.Const.Program.Version
							
							ARKINVDB.global.player.data[k].info = { }
							
							local i = ARKINVDB.global.player.data[k].info
							i.player_id = k
							i.guild_id = nil
							if i.guild then
								i.guild_id = string.format( "%s%s%s%s", ArkInventory.Const.GuildTag, i.guild, ArkInventory.Const.PlayerIDSep, r )
							end
							i.guild = nil
							
						end
						
					end
					
				end
				
			end
		
			ARKINVDB.realm = nil
		
		end
		
		if ARKINVDB.char then
			-- move char into global
			
			for k, v in pairs( ARKINVDB.char ) do
				
				ARKINVDB.global.player.data[k] = ARKINVDB.global.player.data[k] or { }
				
				if v.option and v.option.ldb then
					ARKINVDB.global.player.data[k].ldb = v.option.ldb
					ARKINVDB.global.player.data[k].ldb.version = v.option.version
				end
				
				ARKINVDB.global.player.data[k].ldb = ARKINVDB.global.player.data[k].ldb or { }
				ARKINVDB.global.player.data[k].ldb.version = ARKINVDB.global.player.data[k].ldb.version or ArkInventory.Const.Program.Version
				
			end
			
			ARKINVDB.char = nil
			
		end
		
	end
	
end



function ArkInventory.DatabaseUpgradePostLoad( )
	
	--ArkInventory.Output( LIGHTYELLOW_FONT_COLOR_CODE, "DatabaseUpgradePostLoad" )
	
	if ArkInventory.Const.TOC < 70000 then
		-- to stop people from screwing up their data
		ArkInventory.OutputError( ArkInventory.Localise["TOC_FAIL"] )
		return
	end
	
	local upgrade_version
	
	
	if not ArkInventory.db.global.option.version or ArkInventory.db.global.option.version == 0 then
		ArkInventory.db.global.option.version = ArkInventory.Const.Program.Version
	end
	
	if not ArkInventory.db.global.player.version or ArkInventory.db.global.player.version == 0 then
		ArkInventory.db.global.player.version = ArkInventory.Const.Program.Version
	end
	
	if not ArkInventory.db.profile.option.version or ArkInventory.db.profile.option.version == 0 then
		ArkInventory.db.profile.option.version = ArkInventory.Const.Program.Version
	end
	
	
	upgrade_version = 3.00
	if ArkInventory.db.profile.option.version < upgrade_version then
	
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_PROFILE"], ArkInventory.db:GetCurrentProfile( ), upgrade_version ) )
		
		ArkInventory.db.global.cache = nil
		
		if ArkInventory.db.profile.option.category then
			for k, v in pairs( ArkInventory.db.profile.option.category ) do
				if type( v ) == "number" then
					ArkInventory.db.profile.option.category[k] = ArkInventory.CategoryCodeJoin( ArkInventory.Const.Category.Type.System, abs( v ) )
				end
			end
		end
		
		if ArkInventory.db.profile.option.location then
			
			local t
			for _, loc in pairs( ArkInventory.db.profile.option.location ) do
			
				t = { }
				
				for k, v in pairs( loc.category ) do
					if type( k ) == "number" then
						if k < 0 then
							local id = ArkInventory.CategoryCodeJoin( ArkInventory.Const.Category.Type.System, abs( k ) )
							t[id] = v
						else
							local id = ArkInventory.CategoryCodeJoin( ArkInventory.Const.Category.Type.Rule, k )
							t[id] = v
						end
						loc.category[k] = nil
					end
				end
				
				for k, v in pairs( t ) do
					loc.category[k] = v
				end
				
			end
			
		end
		
		ArkInventory.db.profile.option.version = upgrade_version
		
	end

	if ArkInventory.db.global.option.version < upgrade_version then
		
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_GLOBAL"], "rule", upgrade_version ) )
		
		if ArkInventory.db.global.option.rule then
			
			for k, v in pairs( ArkInventory.db.global.option.rule ) do
				ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Rule].data[k] = v
				ArkInventory.db.global.option.rule[k] = nil
			end
			
			ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Rule].next = ArkInventory.db.global.option.nextrule
			ArkInventory.db.global.option.nextrule = nil
			
		end
		
		ArkInventory.db.global.option.version = upgrade_version
		
	end
	
	
	upgrade_version = 3.0005
	if ArkInventory.db.global.option.version < upgrade_version then
		
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_GLOBAL"], "option", upgrade_version ) )
		
		if ArkInventory.db.global.option.bugfix_alert_framelevel then
			ArkInventory.db.global.option.bugfix.alert = ArkInventory.db.global.option.bugfix_alert_framelevel
		end
		
		
		ArkInventory.db.global.option.version = upgrade_version
		
	end
	
	
	upgrade_version = 3.0201
	if ArkInventory.db.profile.option.version < upgrade_version then
		
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_PROFILE"], ArkInventory.db:GetCurrentProfile( ), upgrade_version ) )
		
		-- fix categories, need to add class
		if ArkInventory.db.profile.option.category then
			
			local t = { }
			
			for k, v in pairs( ArkInventory.db.profile.option.category ) do
				
				local sb, id = strsplit( ":", k )
				id = tonumber( id ) or 0
				sb = tonumber( sb ) or 0
				if sb > 20 then
					local z = sb
					sb = id
					id = z
				end
				
				local class = "item"
				if id == 0 then
					class = "empty"
				end
				
				local cid = string.format( "%s:%s:%s", class, id, sb )
				--ArkInventory.OutputDebug( "k=[", k, "], id=[", id, "], sb=[", sb, "], cid=[", cid, "] / [", v, "]" )
				t[cid] = v
				
			end
			
			ArkInventory.db.profile.option.category = t
			
		end
		
		ArkInventory.db.profile.option.version = upgrade_version
		
	end
	
	
	upgrade_version = 3.0223
	if ArkInventory.db.global.option.version < upgrade_version then
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_GLOBAL"], "player", upgrade_version ) )
		ArkInventory.db.global.option.tooltip.scale = { enabled = false, amount = 1 }
		ArkInventory.db.global.option.version = upgrade_version
	end
	
	
	upgrade_version = 3.0230
	if ArkInventory.db.global.option.version < upgrade_version then
		
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_GLOBAL"], "categories and rules", upgrade_version ) )
		
		local cat, cat_old
		
		cat = ArkInventory.db.global.option.sort.method.data
		for k in pairs( cat ) do
			cat[k].used = true
		end
		
		
		cat_old = ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Custom].data
		ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Custom].data = { }
		cat = ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Custom].data
		for k, v in pairs( cat_old ) do
			if v then
				cat[k] = { used = true, name = v }
			else
				cat[k] = { used = false, name = "" }
			end
		end
		
		cat = ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Rule].data
		for k, v in pairs( cat ) do
			if v then
				cat[k].used = true
			else
				cat[k] = { used = false, name = "" }
			end
		end
		
		ArkInventory.db.global.option.version = upgrade_version
		
	end
	
	if ArkInventory.db.profile.option.version < upgrade_version then
		
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_PROFILE"], ArkInventory.db:GetCurrentProfile( ), upgrade_version ) )
		
		ArkInventory.OutputWarning( "The sort order for each location has been reset to bag/slot as it couldnt be automatically transferred. You will need to create an equivalent sort method (via the config menu) to what you had and apply that to each location" )
		
		if ArkInventory.db.profile.option.location then
			
			for _, v in pairs( ArkInventory.db.profile.option.location ) do
				
				if v.window then
				
					if v.window.border then
						v.window.border.style = ArkInventory.Const.Texture.BorderDefault
						v.window.border.size = nil
						v.window.border.offset = nil
						v.window.border.scale = 1
						v.window.border.file = nil
					end
					
					if v.window.colour then
					
						if v.window.colour.border then
							v.window.border.colour.r = v.window.colour.border.r  or v.window.border.colour.r
							v.window.border.colour.g = v.window.colour.border.g or v.window.border.colour.g
							v.window.border.colour.b = v.window.colour.border.b or v.window.border.colour.b
							v.window.colour.border = nil
						end
						
						if v.window.colour.background then
							v.window.background.colour.r = v.window.colour.background.r or v.window.background.colour.r
							v.window.background.colour.g = v.window.colour.background.g or v.window.background.colour.g
							v.window.background.colour.b = v.window.colour.background.b or v.window.background.colour.b
							v.window.background.colour.a = v.window.colour.background.a or v.window.background.colour.a
							v.window.colour.background = nil
						end
						
						if v.window.colour.baghighlight then
							v.changer.highlight.colour.r = v.window.colour.baghighlight.r or v.changer.highlight.colour.r
							v.changer.highlight.colour.g = v.window.colour.baghighlight.g or v.changer.highlight.colour.g
							v.changer.highlight.colour.b = v.window.colour.baghighlight.b or v.changer.highlight.colour.b
							v.window.colour.baghighlight = nil
						end
					
					end
					
					v.window.colour = nil
					
				end
				
				if v.bar then
					
					if v.bar.name and v.bar.name.label then
						for id, label in pairs( v.bar.name.label ) do
							v.bar.data[id].label = label
						end
						v.bar.name.label = nil
					end
					
					if v.bar.border then
						v.bar.border.style = ArkInventory.Const.Texture.BorderDefault
						v.bar.border.size = nil
						v.bar.border.offset = nil
						v.bar.border.scale = 1
						v.bar.border.file = nil
					end
				
					if v.bar.colour then
						
						if v.bar.colour.border then
							v.bar.border.colour.r = v.bar.colour.border.r or v.bar.border.colour.r
							v.bar.border.colour.g = v.bar.colour.border.g or v.bar.border.colour.g
							v.bar.border.colour.b = v.bar.colour.border.b or v.bar.border.colour.b
							v.bar.colour.border = nil
						end
						
						if v.bar.colour.background then
							v.bar.background.colour.r =  v.bar.colour.background.r or v.bar.background.colour.r
							v.bar.background.colour.g = v.bar.colour.background.g or v.bar.background.colour.g
							v.bar.background.colour.b = v.bar.colour.background.b or v.bar.background.colour.b
							v.bar.background.colour.a = v.bar.colour.background.a or v.bar.background.colour.a
							v.bar.colour.background = nil
						end
					
					end
					
					v.bar.colour = nil
					
				end
				
				if v.slot then
				
					if v.slot.border then
						v.slot.border.style = ArkInventory.Const.Texture.BorderDefault
						v.slot.border.size = nil
						v.slot.border.offset = nil
						v.slot.border.scale = 1
						v.slot.border.file = nil
					end
				
				
					if v.slot.empty then
						v.slot.empty.colour = nil
						v.slot.empty.display = nil
						v.slot.empty.show = nil
					end
				
				end
				
				v.sortorder = nil
				
				wipe( v.sort )
				
			end
			
		end
		
		if ArkInventory.db.profile.option.ui then
			
			if ArkInventory.db.profile.option.ui.search then
				
				if ArkInventory.db.profile.option.ui.search.border then
					ArkInventory.db.profile.option.ui.search.border.style = ArkInventory.Const.Texture.BorderDefault
					ArkInventory.db.profile.option.ui.search.border.size = nil
					ArkInventory.db.profile.option.ui.search.border.offset = nil
					ArkInventory.db.profile.option.ui.search.border.scale = 1
					ArkInventory.db.profile.option.ui.search.border.file = nil
				end
				
				if ArkInventory.db.profile.option.ui.search.colour then
					
					if ArkInventory.db.profile.option.ui.search.colour.border then
						ArkInventory.db.profile.option.ui.search.border.colour.r = ArkInventory.db.profile.option.ui.search.colour.border.r or ArkInventory.db.profile.option.ui.search.border.colour.r
						ArkInventory.db.profile.option.ui.search.border.colour.g = ArkInventory.db.profile.option.ui.search.colour.border.g or ArkInventory.db.profile.option.ui.search.border.colour.g
						ArkInventory.db.profile.option.ui.search.border.colour.b = ArkInventory.db.profile.option.ui.search.colour.border.b or ArkInventory.db.profile.option.ui.search.border.colour.b
						ArkInventory.db.profile.option.ui.search.colour.border = nil
					end
					
					if ArkInventory.db.profile.option.ui.search.colour.background then
						ArkInventory.db.profile.option.ui.search.background.colour.r = ArkInventory.db.profile.option.ui.search.colour.background.r or ArkInventory.db.profile.option.ui.search.background.colour.r
						ArkInventory.db.profile.option.ui.search.background.colour.g = ArkInventory.db.profile.option.ui.search.colour.background.g or ArkInventory.db.profile.option.ui.search.background.colour.g
						ArkInventory.db.profile.option.ui.search.background.colour.b = ArkInventory.db.profile.option.ui.search.colour.background.b or ArkInventory.db.profile.option.ui.search.background.colour.b
						ArkInventory.db.profile.option.ui.search.background.colour.a = ArkInventory.db.profile.option.ui.search.colour.background.a or ArkInventory.db.profile.option.ui.search.background.colour.a
						ArkInventory.db.profile.option.ui.search.colour.background = nil
					end
					
				end
				
			end
		
			if ArkInventory.db.profile.option.ui.rules then
			
				if ArkInventory.db.profile.option.ui.rules.border then
					ArkInventory.db.profile.option.ui.rules.border.style = ArkInventory.Const.Texture.BorderDefault
					ArkInventory.db.profile.option.ui.rules.border.size = nil
					ArkInventory.db.profile.option.ui.rules.border.offset = nil
					ArkInventory.db.profile.option.ui.rules.border.scale = 1
					ArkInventory.db.profile.option.ui.rules.border.file = nil
				end
				
				if ArkInventory.db.profile.option.ui.rules.colour then
					
					if ArkInventory.db.profile.option.ui.rules.colour.border then
						ArkInventory.db.profile.option.ui.rules.border.colour.r = ArkInventory.db.profile.option.ui.rules.colour.border.r or ArkInventory.db.profile.option.ui.rules.border.colour.r
						ArkInventory.db.profile.option.ui.rules.border.colour.g = ArkInventory.db.profile.option.ui.rules.colour.border.g or ArkInventory.db.profile.option.ui.rules.border.colour.g
						ArkInventory.db.profile.option.ui.rules.border.colour.b = ArkInventory.db.profile.option.ui.rules.colour.border.b or ArkInventory.db.profile.option.ui.rules.border.colour.b
						ArkInventory.db.profile.option.ui.rules.colour.border = nil
					end
				
					if ArkInventory.db.profile.option.ui.rules.colour.background then
						ArkInventory.db.profile.option.ui.rules.background.colour.r = ArkInventory.db.profile.option.ui.rules.colour.background.r or ArkInventory.db.profile.option.ui.rules.background.colour.r
						ArkInventory.db.profile.option.ui.rules.background.colour.g = ArkInventory.db.profile.option.ui.rules.colour.background.g or ArkInventory.db.profile.option.ui.rules.background.colour.g
						ArkInventory.db.profile.option.ui.rules.background.colour.b = ArkInventory.db.profile.option.ui.rules.colour.background.b or ArkInventory.db.profile.option.ui.rules.background.colour.b
						ArkInventory.db.profile.option.ui.rules.background.colour.a = ArkInventory.db.profile.option.ui.rules.colour.background.a or ArkInventory.db.profile.option.ui.rules.background.colour.a
						ArkInventory.db.profile.option.ui.rules.colour.background = nil
					end
						
				end
				
			end
			
		end
		
		ArkInventory.OutputWarning( "The border styles for each location have been reset to Blizzard Tooltip (default), the colour was able to be kept though" )
		
		ArkInventory.db.profile.option.version = upgrade_version
		
	end
	
	for k, v in pairs( ArkInventory.db.global.player.data ) do
		if v.ldb.version and v.ldb.version < upgrade_version then
			v.ldb.mounts.track = nil
			v.ldb.version = upgrade_version
		end
	end
	
	
	upgrade_version = 3.0233
	if ArkInventory.db.global.option.version < upgrade_version then
		
		-- beta fix
		
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_GLOBAL"], "categories", upgrade_version ) )
		
		local cat = ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Custom].data
		for k, v in pairs( cat ) do
			
			local z = v.name
			
			while true do
				if type( z ) == "table" then
					z = z.name or "unknown"
				else
					break
				end
			end
				
			v.name = z
			
		end
		
		ArkInventory.db.global.option.version = upgrade_version
		
	end
	
	
	upgrade_version = 3.0237
	if ArkInventory.db.global.option.version < upgrade_version then
		
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_GLOBAL"], "", upgrade_version ) )
		
		if ArkInventory.db.global.option.bugfix then
			
			if ArkInventory.db.global.option.bugfix.enable then
				ArkInventory.db.global.option.bugfix.framelevel.enable = ArkInventory.db.global.option.bugfix.enable
				ArkInventory.db.global.option.bugfix.enable = nil
			end
			
			ArkInventory.db.global.option.bugfix.framelevel.alert = 0
			ArkInventory.db.global.option.bugfix.alert = nil
			
		end
		
		ArkInventory.db.global.option.bugfix.zerosizebag.alert = true
		
		
		ArkInventory.db.global.option.version = upgrade_version
		
	end
	

	upgrade_version = 3.0240
	if ArkInventory.db.profile.option.version < upgrade_version then
		
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_PROFILE"], ArkInventory.db:GetCurrentProfile( ), upgrade_version ) )
		
		if ArkInventory.db.profile.option.location then
			
			for _, loc in pairs( ArkInventory.db.profile.option.location ) do
				
				if loc.framehide then
					
					loc.title.hide = not not loc.framehide.header
					loc.search.hide = not not loc.framehide.search
					loc.status.hide = not not loc.framehide.status
					loc.changer.hide = not not loc.framehide.changer
					
					loc.framehide = nil
					
				end
				
			end
			
		end
		
		
		ArkInventory.db.profile.option.version = upgrade_version
		
	end
	
	
	upgrade_version = 3.0248
	for k, v in pairs( ArkInventory.db.global.player.data ) do
		if v.ldb.version and v.ldb.version < upgrade_version then
			
			if v.ldb.currency and v.ldb.currency.tracked then
				for k2, v2 in pairs( v.ldb.currency.tracked ) do
					if v2 then
						v.ldb.tracking.currency.tracked[k2] = v2
					end
				end
			end
			
			v.ldb.currency = nil
			
			v.ldb.ammo = nil
			
			v.ldb.version = upgrade_version
			
		end
	end
	
	
	upgrade_version = 3.0250
	for k, v in pairs( ArkInventory.db.global.player.data ) do
		if v.ldb.version and v.ldb.version < upgrade_version then
			
			if v.ldb.mounts then
				
				if v.ldb.mounts.ground and v.ldb.mounts.ground.track then
					v.ldb.mounts.ground.track = nil
				end
			
				if v.ldb.mounts.flying and v.ldb.mounts.flying.track then
					v.ldb.mounts.flying.track = nil
				end
				
				if v.ldb.mounts.water and v.ldb.mounts.water.track then
					v.ldb.mounts.water.track = nil
				end
				
			end
			
			v.ldb.version = upgrade_version
			
		end
	end

	
	upgrade_version = 3.0260
	if ArkInventory.db.profile.option.version < upgrade_version then
		
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_PROFILE"], ArkInventory.db:GetCurrentProfile( ), upgrade_version ) )
		
		if ArkInventory.db.profile.option.location then
			
			for k, v in pairs( ArkInventory.db.profile.option.location ) do
				if v.anchor and v.anchor[k] then
					ArkInventory.db.profile.option.anchor[k].point = v.anchor[k].point
					ArkInventory.db.profile.option.anchor[k].locked = v.anchor[k].locked
					ArkInventory.db.profile.option.anchor[k].t = v.anchor[k].t
					ArkInventory.db.profile.option.anchor[k].b = v.anchor[k].b
					ArkInventory.db.profile.option.anchor[k].l = v.anchor[k].l
					ArkInventory.db.profile.option.anchor[k].r = v.anchor[k].r
				end
				v.anchor = nil
			end
			
		end
		
		
		ArkInventory.db.profile.option.version = upgrade_version
		
	end
	
	
	upgrade_version = 3.0271
	if ArkInventory.db.profile.option.version < upgrade_version then
		
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_PROFILE"], ArkInventory.db:GetCurrentProfile( ), upgrade_version ) )
		
		if ArkInventory.db.profile.option.location then
			for k, v in pairs( ArkInventory.db.profile.option.location ) do
				v.slot.new.cutoff = v.slot.new.cutoff * 60
			end
		end
		
		ArkInventory.db.profile.option.version = upgrade_version
		
	end
	
	
	upgrade_version = 3.0279
	if ArkInventory.db.profile.option.version < upgrade_version then
		
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_PROFILE"], ArkInventory.db:GetCurrentProfile( ), upgrade_version ) )
		
		ArkInventory.CategoryRenumber( "1!303", nil ) -- empty key slot
		ArkInventory.CategoryRenumber( "1!406", nil ) -- key
		
		
		ArkInventory.db.profile.option.version = upgrade_version
		
	end
	
	
	upgrade_version = 30311
	for k, v in pairs( ArkInventory.db.global.player.data ) do
		if v.ldb.version and v.ldb.version < upgrade_version then
			
			-- erase any previously selected pets
			for x in pairs( v.ldb.pets.selected ) do
				v.ldb.pets.selected[x] = nil
			end
			
			for x in pairs( v.ldb.tracking.currency.tracked ) do
				v.ldb.tracking.currency.tracked[x] = false
			end
			
			v.ldb.version = upgrade_version
			
		end
		
	end
	
	
	upgrade_version = 30316
	for k, v in pairs( ArkInventory.db.global.player.data ) do
		if v.ldb.version and v.ldb.version < upgrade_version then
			
			if v.ldb.mounts then
				
				if v.ldb.mounts.ground then
					v.ldb.mounts.l = v.ldb.mounts.ground
					v.ldb.mounts.ground = nil
				end
				
				if v.ldb.mounts.flying then
					v.ldb.mounts.a = v.ldb.mounts.flying
					v.ldb.mounts.flying = nil
				end
				
				if v.ldb.mounts.water then
					v.ldb.mounts.u = v.ldb.mounts.water
					v.ldb.mounts.water = nil
				end
				
			end
			
			v.ldb.version = upgrade_version
			
		end
	end
	
	
	upgrade_version = 30334
	if ArkInventory.db.global.player.version < upgrade_version then
		for k, v in pairs( ArkInventory.db.global.player.data ) do
			if v.version then
				v.version = nil
			end
			if v.ldb.version then
				v.ldb.version = nil
			end
		end
		ArkInventory.db.global.player.version = upgrade_version
	end
	
	
	upgrade_version = 30400
	if ArkInventory.db.global.player.version < upgrade_version then
		
		ArkInventory.EraseSavedData( nil, nil, true )
		
		for k, v1 in pairs( ArkInventory.db.global.player.data ) do
			if v1.display then
				for loc_id, v2 in pairs( v1.display ) do
					if v2.bag then
						for bag_id, v3 in pairs( v2.bag ) do
							v1.bagoptions[loc_id][bag_id].display = not not v3
						end
					end
				end
				v1.display = nil
			end
		end
		
		ArkInventory.db.global.player.version = upgrade_version
		
	end
	
	
	upgrade_version = 30404
	if ArkInventory.db.profile.option.version < upgrade_version then
		
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_PROFILE"], ArkInventory.db:GetCurrentProfile( ), upgrade_version ) )
		
		if ArkInventory.db.profile.option.location then
			for k, v in pairs( ArkInventory.db.profile.option.location ) do
				if v.sort then
					v.sort.method = v.sort.default or v.sort.method or 9999
					v.sort.default = nil
				end
			end
		end
		
		ArkInventory.db.profile.option.version = upgrade_version
		
	end
	
	
	upgrade_version = 30407
	if ArkInventory.db.global.player.version < upgrade_version then
		ArkInventory.EraseSavedData( nil, ArkInventory.Const.Location.Pet, true )
	end
	
	
	upgrade_version = 30409
	if ArkInventory.db.profile.option.version < upgrade_version then
		
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_PROFILE"], ArkInventory.db:GetCurrentProfile( ), upgrade_version ) )
		
		if ArkInventory.db.profile.option.location then
			for k, v in pairs( ArkInventory.db.profile.option.location ) do
				if v.slot and v.slot.empty then
					if type( v.slot.empty.first ) == "boolean" then
						if v.slot.empty.first then
							v.slot.empty.first = 1
						else
							v.slot.empty.first = 0
						end
					end
				end
			end
		end
		
		ArkInventory.db.profile.option.version = upgrade_version
		
	end
	
	
	upgrade_version = 30415
	if ArkInventory.db.global.player.version < upgrade_version then
		
		for _, v in pairs( ArkInventory.db.global.player.data ) do
			table.wipe( v.ldb.pets.selected )
		end
		
		ArkInventory.db.global.player.version = upgrade_version
		
	end
	
	
	upgrade_version = 30420
	if ArkInventory.db.profile.option.version < upgrade_version then
		
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_PROFILE"], ArkInventory.db:GetCurrentProfile( ), upgrade_version ) )
		
		if ArkInventory.db.profile.option.location then
			
			for k, v in pairs( ArkInventory.db.profile.option.location ) do
				
				if v.slot and v.slot.new and v.slot.new.show then
					
					v.slot.age.show = v.slot.new.show
					v.slot.new.show = nil
					
					v.slot.age.cutoff = v.slot.new.cutoff
					v.slot.new.cutoff = 2
					
					if v.slot.new.colour then
						v.slot.age.colour.r = v.slot.new.colour.r
						v.slot.age.colour.g = v.slot.new.colour.g
						v.slot.age.colour.b = v.slot.new.colour.b
						v.slot.new.colour = nil
					end
				
				end
				
			end
			
		end
		
		
		ArkInventory.db.profile.option.version = upgrade_version
		
	end
	
	
	upgrade_version = 30506
	if ArkInventory.db.global.player.version < upgrade_version then
		ArkInventory.EraseSavedData( nil, nil, true )
	end
	
	
	-- LEGION
	
	upgrade_version = 30602
	if ArkInventory.db.profile.option.version < upgrade_version then
		
		local profilename = ArkInventory.db:GetCurrentProfile( )
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_PROFILE"], profilename, upgrade_version ) )
		
		local temp_use = { }
		local catset = nil
		
		if ArkInventory.db.profile.option.category or ArkInventory.db.profile.option.rule then
			
			local id, data = ArkInventory.ConfigInternalCategorysetAdd( ArkInventory.db:GetCurrentProfile( ) )
			
			if id then
				
				catset = id
				
				if ArkInventory.db.profile.option.category then
					ArkInventory.Table.Merge( ArkInventory.db.profile.option.category, data.category.assign )
				end
				ArkInventory.db.profile.option.category = nil
				
				if ArkInventory.db.profile.option.rule then
					ArkInventory.Table.Merge( ArkInventory.db.profile.option.rule, data.category.active[ArkInventory.Const.Category.Type.Rule] )
				end
				
				ArkInventory.db.profile.option.rule = nil
				
				for k, v in pairs( ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Custom].data ) do
					if v.used ~= "N" then
						data.category.active[ArkInventory.Const.Category.Type.Custom][k] = true
					end
				end
				
			end
			
		end
		
		if ArkInventory.db.profile.option.location then
			
			for loc_id, loc_data in pairs( ArkInventory.db.profile.option.location ) do
				
				if ArkInventory.Global.Location[loc_id] and ArkInventory.Global.Location[loc_id].canView then
					
					local n = string.format( "%s - %s", ArkInventory.db:GetCurrentProfile( ), ArkInventory.Global.Location[loc_id].Name or loc_id )
					
					loc_data.layout = nil
					loc_data.theme = nil
					
					if loc_data.bar and loc_data.bar.data then
						for k, v in pairs( loc_data.bar.data ) do
							if v.sortorder then
								if not v.sort then
									v.sort = { }
								end
								v.sort.method = v.sortorder
								v.sortorder = nil
							end
						end
					end
					
					if not ArkInventory.Table.Subset( loc_data, ArkInventory.db.global.option.design.data[0] ) then
						
						-- move data
						local id, design = ArkInventory.ConfigInternalDesignAdd( "transfer" )
						if id then
							
							ArkInventory.Output( "transferring profile data to design ", n )
						
							ArkInventory.Table.Merge( loc_data, design )
							
							design.used = "Y"
							design.name = string.trim( n )
							
							if ArkInventory.db.profile.option.use then
								
								for k, v in pairs( ArkInventory.db.profile.option.use ) do
									if v == loc_id then
										temp_use[k] = id
									end
								end
								
								if ArkInventory.db.profile.option.use[loc_id] == nil then
									temp_use[loc_id] = id
								end
								
							else
								
								temp_use[loc_id] = id
								
							end
							
						end
						
					end
					
				end
				
			end
			
			ArkInventory.db.profile.option.location = nil
			
		end
		
		for k1, v1 in pairs( ARKINVDB.profileKeys ) do
			if v1 == profilename then
				local player = ArkInventory.PlayerDataGet( k1 )
				for k2, v2 in pairs( temp_use ) do
					player.data.option[k2].layout = v2
					player.data.option[k2].style = v2
					player.data.option[k2].catset = catset
				end
			end
		end
		
		for _, v in pairs( ArkInventory.db.global.option.category ) do
			for id, x in pairs( v.data ) do
				if id == 0 then
					ArkInventory.ConfigInternalCategoryCustomPurge( id )
				elseif x.used == true then
					x.used = "Y"
				elseif v.used == "N" then
					x.used = "D"
				end
			end
		end
		
		for id, v in pairs( ArkInventory.db.global.option.sort.method.data ) do
			if id == 0 then
				ArkInventory.ConfigInternalSortMethodPurge( id )
			elseif v.used == true then
				v.used = "Y"
			elseif v.used == "N" then
				v.used = "D"
			end
		end
		
		ArkInventory.db.profile.option.use = nil
		
		
		ArkInventory.db.profile.option.version = upgrade_version
		
	end
	
	if ArkInventory.db.global.player.version < upgrade_version then
		
		for _, data in pairs( ArkInventory.db.global.player.data ) do
			
			for k, v in pairs( data.monitor or { } ) do
				data.option[k].monitor = v
			end
			data.monitor = nil
			
			for k, v in pairs( data.save or { } ) do
				data.option[k].save = v
			end
			data.save = nil
			
			for k, v in pairs( data.control or { } ) do
				data.option[k].override = v
			end
			data.control = nil
			
			for loc_id, v in pairs( data.bagoptions or { } ) do
				for bag_id, v2 in pairs( v ) do
					data.option[loc_id].bag[bag_id] = ArkInventory.Table.Copy( v )
				end
			end
			data.bagoptions = nil
			
		end
		
		for k, v in pairs( ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Custom].data ) do
			if v.used == true then
				v.used = "Y"
			elseif v.used == "N" then
				v.used = "D"
			end
		end

		ArkInventory.db.global.player.version = upgrade_version
		
	end
	
	
	upgrade_version = 30603
	if ArkInventory.db.global.option.version < upgrade_version then
		
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_GLOBAL"], "option", upgrade_version ) )
		
		ArkInventory.db.global.option.restack.cleanup = nil
		
		ArkInventory.db.global.option.version = upgrade_version
		
	end
	
	
	upgrade_version = 30604
	if ArkInventory.db.profile.option.version < upgrade_version then
		
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_PROFILE"], ArkInventory.db:GetCurrentProfile( ), upgrade_version ) )
		
		local player = ArkInventory.PlayerDataGet( )
		
		if ArkInventory.db.profile.option.category or ArkInventory.db.profile.option.rule then
			
			local id, data = ArkInventory.ConfigInternalCategorysetAdd( ArkInventory.db:GetCurrentProfile( ) )
			
			if id then
				
				catset = id
				
				if ArkInventory.db.profile.option.category then
					ArkInventory.Table.Merge( ArkInventory.db.profile.option.category, data.category.assign )
				end
				ArkInventory.db.profile.option.category = nil
				
				if ArkInventory.db.profile.option.rule then
					ArkInventory.Table.Merge( ArkInventory.db.profile.option.rule, data.category.active[ArkInventory.Const.Category.Type.Rule] )
				end
				ArkInventory.db.profile.option.rule = nil
				
				for k, v in pairs( ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Custom].data ) do
					if v.used ~= "N" then
						data.category.active[ArkInventory.Const.Category.Type.Custom][k] = true
					end
				end
				
			end
			
		end
		
		if ArkInventory.db.profile.option.layout then
				for k, v in pairs( ArkInventory.db.profile.option.layout ) do
				player.option[k].layout = v
			end
		end
		
		if ArkInventory.db.profile.option.style then
			for k, v in pairs( ArkInventory.db.profile.option.style ) do
				player.option[k].style = v
			end
		end
		
		if ArkInventory.db.profile.option.catset then
			for k, v in pairs( ArkInventory.db.profile.option.catset ) do
				player.option[k].catset = v
			end
		end
		
		ArkInventory.db.profile.option.font = nil
		ArkInventory.db.profile.option.frameStrata = nil
		
		ArkInventory.db.profile.option.version = upgrade_version
		
	end
	
	if ArkInventory.db.global.option.version < upgrade_version then
		
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_GLOBAL"], "option", upgrade_version ) )
		
		for v1, v2 in pairs( ArkInventory.db.global.option.design.data ) do
			
			v2.slot.znew = nil
			
			for k, v in pairs( v2.slot.data ) do
				v.name = nil
				v.type = nil
				v.long = nil
				v.emptycolour = nil
				v.hide = nil
			end
			
			if v2.font.name then
				v2.font.face = v2.font.name
				v2.font.name = nil
			end
			
			for v3, v4 in pairs( v2.bar.data ) do
				if v4.label then
					v4.name.text = v4.label
					v4.label = nil
				end
			end
			
		end
		
		for v1, v2 in pairs( ArkInventory.db.global.option.catset.data ) do
			
			for k, v in pairs( v2.category ) do
				if type( v ) ~= "table" then
					v2.category.active[ArkInventory.Const.Category.Type.Rule][k] = v
					v2.category[k] = nil
				end
			end
			
			if v2.rule then
				
				for k, v in pairs( v2.rule ) do
					v2.category.active[ArkInventory.Const.Category.Type.Rule][k] = v
				end
				
				v2.rule = nil
				
			end
			
		end
		
		
		categoryRenumber( "1!114", "1!415" ) -- riding > SYSTEM_MOUNT
		categoryRenumber( "1!304", nil ) -- empty soul shard
		categoryRenumber( "1!310", nil ) -- bullet > projectile
		categoryRenumber( "1!311", nil ) -- arrow > projectile
		categoryRenumber( "1!410", nil ) -- projectile
		categoryRenumber( "1!413", nil ) -- soul shard
		categoryRenumber( "1!421", nil ) -- arrow > projectile
		categoryRenumber( "1!422", nil ) -- bullet > projectile
		
		categoryRenumber( "1!508", "1!510" ) -- weapon enchantment > TRADEGOODS_ENCHANTMENT
		categoryRenumber( "1!509", "1!510" ) -- armor enchantment > TRADEGOODS_ENCHANTMENT
		
		categoryRenumber( "1!425", "1!426" ) -- TRADEGOODS_DEVICES > CONSUMABLES_EXPLOSIVES_AND_DEVICES
		categoryRenumber( "1!433", nil ) -- CONSUMABLE_SCROLL
		categoryRenumber( "1!507", nil ) -- TRADEGOODS_MATERIALS
		categoryRenumber( "1!510", "1!440" ) -- TRADEGOODS_ENCHANTMENT > SYSTEM_ITEM_ENHANCEMENT
		
		ArkInventory.db.global.option.version = upgrade_version
		
	end
	
	
	upgrade_version = 30605
	if ArkInventory.db.profile.option.version < upgrade_version then
		
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_PROFILE"], ArkInventory.db:GetCurrentProfile( ), upgrade_version ) )
		
		ArkInventory.db.profile.option.ui = nil
		
		ArkInventory.db.profile.option.version = upgrade_version
		
	end
	
	
	upgrade_version = 30611
	if ArkInventory.db.global.option.version < upgrade_version then
		
		ArkInventory.Output( string.format( ArkInventory.Localise["UPGRADE_GLOBAL"], "option", upgrade_version ) )
		
		for k1, v1 in pairs( ArkInventory.db.global.option.catset.data ) do
			
			for k2, v2 in pairs( v1.category.assign ) do
				
				local v = string.match( k2, "^%d+:(.+)$" )
				if v then
					v1.category.assign[v] = v2
					v1.category.assign[k2] = nil
				end
				
			end
			
		end
		
		ArkInventory.db.global.option.version = upgrade_version
		
	end
	
	
	
	
	
	if ArkInventory.db.global.vendor then
		ArkInventory.db.global.vendor = nil
	end
	
	
	-- check sort keys
	ArkInventory.ConfigInternalSortMethodCheck( )
	
	
	-- check for character rename and move old data to new name
	ArkInventory.Global.Me.data.info.renamecheck = true
	for k, v in pairs( ArkInventory.db.global.player.data ) do
		if ArkInventory.Global.Me.data.info.guid and ArkInventory.Global.Me.data.info.guid == v.info.guid and not v.info.renamecheck then
			ArkInventory.db.global.player.data[ArkInventory.Global.Me.data.info.player_id] = ArkInventory.Table.Copy( v )
			ArkInventory.Output( "character was renamed from ", v.info.name, " to ", ArkInventory.Global.Me.data.info.name, ", data has been transferred" )
			ArkInventory.db.global.player.data[v.info.player_id] = ArkInventory.Table.Copy( ArkInventory.db.global.player.data[""] )
			break
		end
	end
	ArkInventory.Global.Me.data.info.renamecheck = nil
	
	
	-- set versions to current mod version
	ArkInventory.db.global.option.version = ArkInventory.Const.Program.Version
	ArkInventory.db.global.player.version = ArkInventory.Const.Program.Version
	ArkInventory.db.profile.option.version = ArkInventory.Const.Program.Version
	
end
