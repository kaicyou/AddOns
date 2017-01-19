-- these are the esES localizations
-- we will use the Wowace localization system
-- since this isn't the default, check and exit if not esES

if GetLocale() ~= "esES" then
	return
end

local _, GT_Globals = ...

local translations = {
{
["Advanced customization options"] = "Opciones Avanzadas de Personalización",
["Allows you to move the group that contains the buff duration timers"] = "Permite mover el grupo que contiene los temporizadores de duración de Beneficios",
["Ancestral Guidance"] = "Guía Ancestral",
["Ancestral Protection"] = "Protección Ancestral",
["Ancestral Protection Totem"] = "Tótem de Protección Ancestral",
["Animate Tidal Waves Bar"] = "Barra animada de Mareas Vivas",
["Ascendance"] = "Ascensión",
["Astral Shift"] = "Cambio Astral",
["Aura Settings"] = "Configuración de Auras",
["Auras used by the Elemental specialization"] = "Auras utilizadas por la especialización Elemental",
["Auras used by the Enhancement specialization"] = "Auras utilizadas por la especialización Mejora",
["Auras used by the Restoration specialization"] = "Auras utilizadas por la especialización Restauración",
["Bloodlust"] = "Ansia de sangre",
["Boulderfist"] = "Puño de roca",
["Buff Duration Timers"] = "Temporizadores de duración de beneficios",
["Cleanse Spirit"] = "Limpiar espíritu",
["Cloudburst"] = "ráfagas de nubes",
["Cloudburst Totem"] = "tótem de ráfagas de nubes",
["Crash Lightning"] = "Estallido de relámpagos",
["Critical Strike"] = "Golpe crítico",
["Determines how opaque or transparent the auras will appear when out of combat"] = "Determina cuán opacas o transparentes aparecerán las auras cuando estén fuera de combate",
["Determines the color and alpha of the grid"] = "Determina el color y la transparencia de la cuadrícula",
["Determines the color and alpha of the main X/Y axis lines"] = [=[Determina el color y la transparencia de la ventana principal ejes de  lineas X/Y

]=],
["Determines the color of harmful auras will appear when out of range"] = "Determina el color de las auras dañinas que aparecerán cuando esté fuera de rango",
}
}

GT_Globals:RegisterLocale("esES", translations)
translations = nil
