-- these are the frFR localizations
-- we will use the Wowace localization system
-- since this isn't the default, check and exit if not frFR

if GetLocale() ~= "frFR" then
	return
end

local _, GT_Globals = ...

local translations = {
{
}
}

GT_Globals:RegisterLocale("frFR", translations)
translations = nil
