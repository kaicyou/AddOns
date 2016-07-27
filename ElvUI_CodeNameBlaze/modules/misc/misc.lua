--[[--------------------------------------------------------------------
--	CodeNameBlaze, an ElvUI edit by Blazeflack @ tukui.org
--
--	This file contains changes/additions to various elements in ElvUI
--	that didn't warrant its own module
--------------------------------------------------------------------]]--
local E, L, V, P, G = unpack(ElvUI); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local M = E:GetModule('Misc');
local CNB = E:GetModule('CodeNameBlaze');

--Cache global variables
--Lua functions
local unpack = unpack

--Global variables that we don't cache, list them here for mikk's FindGlobals script
-- GLOBALS: ReputationBarMover, ExperienceBarMover, MMHolder

function CNB:SetBubbleColor(frame)	
	--Use separate backdrop color for chat bubbles
	if E.private.general.chatBubbles == 'backdrop' then
		if E.PixelMode then
			frame:SetBackdropColor(unpack(CNB.media.chatbubblecolor))
		else
			frame.backdrop:SetTexture(unpack(CNB.media.chatbubblecolor))
		end
	end
end
hooksecurefunc(M, "SkinBubble", CNB.SetBubbleColor)