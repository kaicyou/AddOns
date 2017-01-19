-- these are the zhTW localizations
-- we will use the Wowace localization system
-- since this isn't the default, check and exit if not zhTW

if GetLocale() ~= "zhTW" then
	return
end

local _, GT_Globals = ...

local translations = {
{
}
}

GT_Globals:RegisterLocale("zhTW", translations)
translations = nil
