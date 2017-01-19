-- these are the itIT localizations
-- we will use the Wowace localization system
-- since this isn't the default, check and exit if not itIT

if GetLocale() ~= "itIT" then
	return
end

local _, GT_Globals = ...

local translations = {
{
}
}

GT_Globals:RegisterLocale("itIT", translations)
translations = nil
