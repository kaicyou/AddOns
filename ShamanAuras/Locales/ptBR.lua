-- these are the ptBR localizations
-- we will use the Wowace localization system
-- since this isn't the default, check and exit if not ptBR

if GetLocale() ~= "ptBR" then
	return
end

local _, GT_Globals = ...

local translations = {
{
["Ability Duration Timers"] = "Duração de habilidades",
["Advanced customization options"] = "Opcões avançadas",
["Allows you to move the group that contains the buff duration timers"] = "Permite mover o grupo que contêm as durações dos buffs",
["Ancestral Guidance"] = "Fortitude Ancestral",
["Ancestral Protection"] = "Proteção Ancestral",
["Ancestral Protection Totem"] = "Totem de Proteção Ancestral",
["Ascendance"] = "Ascendência",
["Astral Shift"] = "Transição Astral",
["Auras used by the Elemental specialization"] = "Auras usadas pela especialização Elemental",
["Auras used by the Enhancement specialization"] = "Auras usadas pela especialização Aperfeiçoamento",
["Auras used by the Restoration specialization"] = "Auras usadas pela especialização Restauração",
["Bloodlust"] = "Sede de Sangue",
["Boulderfist"] = [=[Punho de Pedra
]=],
["Buff Duration Timers"] = "Duração dos buffs",
["Cloudburst"] = [=[Explosão Nebulosa
]=],
["Cloudburst Totem"] = [=[Totem da Explosão Nebulosa
]=],
["Crash Lightning"] = [=[Raio Poderoso
]=],
["Critical Strike"] = "Ataque Crítico",
["Earth Elemental"] = "Elemental da Terra",
["Earth Shock"] = "Choque Terreno",
}
}

GT_Globals:RegisterLocale("ptBR", translations)
translations = nil
