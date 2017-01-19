-- these are the deDE localizations
-- we will use the Wowace localization system
-- since this isn't the default, check and exit if not deDE

if GetLocale() ~= "deDE" then
	return
end

local _, GT_Globals = ...

local translations = {
{
["Haste"] = "Tempo",
["Healing Rain"] = "Heilender Regen",
["Hex"] = "Verhexen",
["Mastery"] = "Meisterschaft",
["Move All Auras"] = "Bewege alle Auras",
["Move Aura Groups"] = "Bewege Aura Gruppen",
["Settings"] = "Einstellungen",
["Spirit Link"] = "Geistbindung",
["Spirit Link Totem"] = "Geistbindungstotem",
["Voodoo"] = "Voodoo",
}
}

GT_Globals:RegisterLocale("deDE", translations)
translations = nil
