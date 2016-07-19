﻿local _G = _G
local select = _G.select
local pairs = _G.pairs
local ipairs = _G.ipairs
local string = _G.string
local type = _G.type
local error = _G.error
local table = _G.table


function ArkInventory.Frame_Rules_Hide( )
	if ARKINV_Rules then
		ARKINV_Rules:Hide( )
	end
end
	
function ArkInventory.Frame_Rules_Show( )
	
	if not IsAddOnLoaded( "ArkInventoryRules" ) then
		
		local loaded, reason = LoadAddOn( "ArkInventoryRules" )
		if reason then
			ArkInventory.OutputError( "Failed to load Rules: ", getglobal( "ADDON_" .. reason ) )
			return
		end
		
	end
	
	if ARKINV_Rules then
		ARKINV_Rules:Show( )
		ArkInventory.Frame_Main_Level( ARKINV_Rules )
	end
	
end

function ArkInventory.Frame_Rules_Toggle( )
	
	if ARKINV_Rules and ARKINV_Rules:IsVisible( ) then
		ArkInventory.Frame_Rules_Hide( )
	else
		ArkInventory.Frame_Rules_Show( )
	end
	
end
