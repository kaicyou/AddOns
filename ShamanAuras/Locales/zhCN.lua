-- these are the zhCN localizations
-- we will use the Wowace localization system
-- since this isn't the default, check and exit if not zhCN

if GetLocale() ~= "zhCN" then
	return
end

local _, GT_Globals = ...

local translations = {
{
}
}

GT_Globals:RegisterLocale("zhCN", translations)
translations = nil
