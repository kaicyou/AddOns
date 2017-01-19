-- these are the esMX localizations
-- we will use the Wowace localization system
-- since this isn't the default, check and exit if not esMX

if GetLocale() ~= "esMX" then
	return
end

local _, GT_Globals = ...

local translations = {
{
}
}

GT_Globals:RegisterLocale("esMX", translations)
translations = nil
