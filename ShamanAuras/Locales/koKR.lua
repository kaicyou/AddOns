-- these are the koKR localizations
-- we will use the Wowace localization system
-- since this isn't the default, check and exit if not koKR

if GetLocale() ~= "koKR" then
	return
end

local _, GT_Globals = ...

local translations = {
{
}
}

GT_Globals:RegisterLocale("koKR", translations)
translations = nil
