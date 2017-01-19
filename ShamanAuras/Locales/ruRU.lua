-- these are the ruRU localizations
-- we will use the Wowace localization system
-- since this isn't the default, check and exit if not ruRU

if GetLocale() ~= "ruRU" then
	return
end

local _, GT_Globals = ...

local translations = {
{
}
}

GT_Globals:RegisterLocale("ruRU", translations)
translations = nil
