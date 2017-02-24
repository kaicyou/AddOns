-- these are base translations, so no commenting out!
-- meaning, if some string is not localized,
-- the string will default to these

local L = LibStub("AceLocale-3.0"):NewLocale("ShamanAuras", "enUS", true)

if not L then
	return
end

-- AceConfig Strings
L["Ability Duration Timers"] = true;
L["Add or remove separating commas"] = true;
L["Advanced customization options"] = true;
L["Allows you to move the group that contains the buff duration timers"] = true;
L["Alpha (In Combat)"] = true;
L["Alpha (OoC)"] = true;
L["Alpha (OoC - No Target)"] = true;
L["Alpha (OoC - Target)"] = true;
L["Always"] = true;
L["Animate Tidal Waves Bar"] = true;
L["Auras used by the Elemental specialization"] = true;
L["Auras used by the Enhancement specialization"] = true;
L["Auras used by the Restoration specialization"] = true;
L["Aura Triggers"] = true;
L["Bar Height"] = true;
L["Bar Width"] = true;
L["Buff Duration Timers"] = true;
L["Center"] = true;
L["Changes the width of the Earthen Shield Bar. (Default is 260)"] = true;
L["Changes the height of the Earthen Shield Bar. (Default is 21)"] = true;
L["Changes the height of the Icefury Bar. (Default is 21)"] = true;
L["Changes the width of the Icefury Bar. (Default is 260)"] = true;
L["Changes the height of the Maelstrom Bar. (Default is 21)"] = true;
L["Changes the width of the Maelstrom Bar. (Default is 260)"] = true;
L["Changes the height of the Mana Bar. (Default is 21)"] = true;
L["Changes the width of the Mana Bar. (Default is 260)"] = true;
L["Changes the height of the Tidal Waves Bar. (Default is 7)"] = true;
L["Changes the width of the Tidal Waves Bar. (Default is 225)"] = true
L["Changes the size of the text. (Default is 12)"] = true;
L["Cloudburst Healing Stored"] = true;
L["Color (OoR)"] = true;
L["Configuration"] = true;
L["Cooldown Settings"] = true;
L["Cooldown Sweep Animation"] = true;
L["Cooldown Values"] = true;
L["Count Value Text"] = true;
L["Deuff Duration Timers"] = true;
L["Determines how opaque or transparent the auras will appear when out of combat"] = true;
L["Determines how opaque or transparent the bar will appear when out of combat"] = true;
L["Determines how opaque or transparent the bar will appear when out of combat and targetting an enemy"] = true;
L["Determines how opaque or transparent the bar will appear while in combat"] = true;
L["Determines the color and alpha of the grid"] = true;
L["Determines the color and alpha of the main X/Y axis lines"] = true;
L["Determines the color of harmful auras will appear when out of range"] = true;
L["Determines the color of the Tidal Waves bar when no tidal wave charges are active"] = true;
L["Determines the size of primary auras in row 1. (Default is 32)"] = true;
L["Determines the size of primary auras in row 2. (Default is 32)"] = true;
L["Determines the size of the primary charge text in row 1. (Default is 13.5)"] = true;
L["Determines the size of the primary charge text in row 2. (Default is 13.5)"] = true;
L["Determines the size of the secondary charge text in column 1. (Default is 13.5)"] = true;
L["Determines the size of the secondary charge text in column 2. (Default is 13.5)"] = true;
L["Determines the spacing of the primary auras in row 1. (Default is 50)"] = true;
L["Determines the spacing of the primary auras in row 2. (Default is 50)"] = true;
L["Determines the size of secondary auras in column 1. (Default is 25)"] = true;
L["Determines the size of secondary auras in column 2. (Default is 25)"] = true;
L["Determines the spacing of the secondary auras in column 1. (Default is 30)"] = true;
L["Determines the spacing of the secondary auras in column 2. (Default is 30)"] = true;
L["Digit Grouping"] = true;
L["Display"] = true;
L["Earthen Shield Bar Settings"] = true;
L["Earthgrab Totem"] = true;
L["Elemental"] = true;
L["Elemental Auras"] = true;
L["Elemental Duration Timers"] = true;
L["Elemental Shaman Auras"] = true;
L["Enhancement"] = true;
L["Enhancement Auras"] = true;
L["Enhancement Shaman Auras"] = true;
L["General"] = true;
L["Grid Color"] = true;
L["Grid Preview"] = true;
L["Grid Settings"] = true;
L["Health Value Justify"] = true;
L["Health Value Text"] = true;
L["Horizontal"] = true;
L["Icefury Bar"] = true;
L["Icefury Bar Settings"] = true;
L["Layout"] = true;
L["Layout Settings"] = true;
L["Left"] = true;
L["Lightning Surge Totem"] = true;
L["Maelstrom Bar"] = true;
L["Maelstrom Bar Settings"] = true;
L["Maelstrom Lightning"] = true;
L["Maelstrom Settings"] = true;
L["Maelstrom Trigger"] = true;
L["Maelstrom Value Text"] = true;
L["Maelstrom Value Justify"] = true;
L["Major Auras"] = true;
L["Mana Bar"] = true;
L["Mana Bar Settings"] = true;
L["Mana Precision"] = true;
L["Mana Value Text"] = true;
L["Mana Value Justify"] = true;
L["Minor Auras"] = true;
L["Modify Earthen Shield Bar"] = true;
L["Modify Icefury Bar"] = true;
L["Modify Mana Bar"] = true;
L["Modify Maelstrom Bar"] = true;
L["Modify Tidal Waves Bar"] = true;
L["Move All Auras"] = true;
L["Move Aura Groups"] = true;
L["Move Bottom Auras"] = true;
L["Move Buff Timer Bars"] = true;
L["Move Doom Winds"] = true;
L["Move Earthen Shield Bar"] = true;
L["Move Elemental Auras"] = true;
L["Move Elemental Aura Groups"] = true;
L["Move Enhancement Auras"] = true;
L["Move Restoration Auras"] = true;
L["Move Icefury Bar"] = true;
L["Move Lava Surge Texture"] = true;
L["Move Left Auras"] = true;
L["Move Maelstrom Bar"] = true;
L["Move Main Timer Bars"] = true;
L["Move Right Auras"] = true;
L["Move Stormkeeper Charges"] = true;
L["Move Stormstrike Charges"] = true;
L["Move Tidal Waves Bar"] = true;
L["Move Top Auras"] = true;
L["Move Totem Mastery Alert"] = true;
L["Move Undulation"] = true;
L["Move Utility Timer Bars"] = true;
L["Never"] = true;
L["No Tidal Waves Color"] = true;
L["On Heal Only"] = true;
L["Primary Auras"] = true;
L["Primary Charges 1"] = true;
L["Primary Charges 2"] = true;
L["Primary Icon Size"] = true;
L["Primary Orientation 1"] = true;
L["Primary Orientation 2"] = true;
L["Primary Size 1"] = true;
L["Primary Size 2"] = true;
L["Primary Spacing 1"] = true;
L["Primary Spacing 2"] = true;
L["Progress Bars"] = true;
L["Reload UI"] = true;
L["Remaining Time"] = true;
L["Reset Earthen Shield Bar"] = true;
L["Reset Elemental Auras"] = true;
L["Reset Enhancement Auras"] = true;
L["Reset Icefury Bar"] = true;
L["Reset Maelstrom Bar"] = true;
L["Reset Mana Bar"] = true;
L["Reset Primary Layout"] = true;
L["Reset Restoration Auras"] = true;
L["Reset Secondary Layout"] = true;
L["Reset Tidal Waves Bar"] = true;
L["Reset Trigger Values"] = true;
L["Resource Accumulation"] = true;
L["Restoration"] = true;
L["Restoration Auras"] = true;
L["Restoration Shaman Auras"] = true;
L["Right"] = true;
L["Secondary Auras"] = true;
L["Secondary Charges 1"] = true;
L["Secondary Charges 2"] = true;
L["Secondary Orientation 1"] = true;
L["Secondary Orientation 2"] = true;
L["Secondary Size 1"] = true;
L["Secondary Size 2"] = true;
L["Secondary Spacing 1"] = true;
L["Secondary Spacing 2"] = true;
L["Set how large the \"Primary\" Auras appear"] = true;
L["Set the aura orientation to horizontal or vertical."] = true;
L["Set the position of the text on the Earthen Shield bar."] = true;
L["Set the position of the text on the mana bar."] = true;
L["Settings"] = true;
L["Show Ability Timers"] = true;
L["Show Elemental Auras"] = true;
L["Show Enhancement Auras"] = true;
L["Show Buff Timers"] = true;
L["Show Restoration Auras"] = true;
L["Show Utility Timers"] = true;
L["Stormkeeper Orbs"] = true;
L["Stormstrike Lightning Orbs"] = true;
L["Secondary Icon Size"] = true;
L["Target Display (OoC)"] = true;
L["Target & On Heal"] = true;
L["OoC Tidal Wave Duration"] = true;
L["Target Only"] = true;
L["Text Size"] = true;
L["Texture Alerts"] = true;
L["The amount of Maelstrom accumulated at which the \"Lightning\" animation will appear"] = true;
L["The amount of seconds remaining when the \"Glow\" animation will appear"] = true;
L["The amount of seconds remaining when the Totem Mastery texture will appear"] = true;
L["The amount of seconds the Tidal Waves indicator bar will appear when casting a heal without a target while out of combat."] = true;
L["The method in which Tidal Wave will be displayed while in combat."] = true;
L["The method in which Tidal Wave will be displayed while out of combat."] = true;
L["Tidal Waves Bar"] = true;
L["Tidal Waves Bar Settings"] = true;
L["Tidal Wave Display (In Combat)"] = true;
L["Tidal Wave Display (OoC)"] = true;
L["Tidal Wave Duration (OoC)"] = true;
L["Timer Value Text"] = true;
L["Toggle Grid"] = true;
L["Toggle Info Frame"] = true;
L["Toggle the adjustment of the Earthen Shield Bar size"] = true;
L["Toggle the adjustment of the Icefury Bar"] = true;
L["Toggle the adjustment of the Maelstrom Bar size"] = true;
L["Toggle the adjustment of the Mana Bar size"] = true;
L["Toggle the adjustment of the Tidal Waves Bar size"] = true;
L["Toggle the display of Elemental Auras"] = true;
L["Toggle the display of Restoration Auras"] = true;
L["Toggles the display of the auras while targetting an enemy while out of combat."] = true;
L["Toggles the text display of the amount of health remaining"] = true;
L["Toggles the text display of the amount of icefury stacks remaining"] = true;
L["Toggles the text display of the amount of mana"] = true;
L["Toggles the text display of the amount of maelstrom remaining"] = true;
L["Toggles the text display of the amount of time remaining"] = true;
L["Totem Duration Timers"] = true;
L["Totem Mastery"] = true;
L["Undulation"] = true;
L["Utility Duration Timers"] = true;
L["Vertical"] = true;
L["Voodoo Totem"] = true;
L["X/Y Axis Color"] = true;

-- Miscellaenous
L["Critical Strike"] = true;
L["Haste"] = true;
L["Mastery"] = true;

--Shared Abilities
L["Ancestral Guidance"] = true;
L["Ascendance"] = true;
L["Astral Shift"] = true;
L["Bloodlust"] = true;
L["Cleanse Spirit"] = true;
L["Earthgrab"] = true;
L["Earthgrab Totem"] = true;
L["Heroism"] = true;
L["Hex"] = true;
L["Gust of Wind"] = true;
L["Lightning Surge"] = true;
L["Lightning Surge Totem"] = true;
L["Maelstrom"] = true;
L["Time Warp"] = true;
L["Voodoo"] = true;
L["Voodoo Totem"] = true;
L["Wind Shear"] = true;
L["Wind Rush"] = true;
L["Wind Rush Totem"] = true;

-- Elemental Abilities
L["Earthquake"] = true;
L["Earth Shock"] = true;
L["Earth Elemental"] = true;
L["Elemental Blast"] = true;
L["Elemental Mastery"] = true;
L["Fire Elemental"] = true;
L["Flame Shock"] = true;
L["Greater Earth Elemental"] = true;
L["Greater Fire Elemental"] = true
L["Greater Storm Elemental"] = true;
L["Icefury"] = true;
L["Lava Burst"] = true;
L["Lava Surge"] = true;
L["Liquid Magma"] = true;
L["Liquid Magma Totem"] = true;
L["Storm Elemental"] = true;
L["Stormkeeper"] = true;
L["Thunderstorm"] = true;
L["Totem Mastery"] = true;

-- Enhancement Abilities
L["Boulderfist"] = true;
L["Crash Lightning"] = true;
L["Doom Winds"] = true;
L["Earthen Spike"] = true;
L["Feral Lunge"] = true;
L["Feral Spirit"] = true;
L["Flametongue"] = true;
L["Frostbrand"] = true;
L["Lava Lash"] = true;
L["Rainfall"] = true;
L["Spirit Walk"] = true;
L["Stormstrike"] = true;
L["Sundering"] = true;
L["Windsong"] = true;

-- Restoration Abilities
L["Ancestral Protection"] = true;
L["Ancestral Protection Totem"] = true;
L["Cloudburst"] = true;
L["Cloudburst Totem"] = true;
L["Earthen Shield"] = true;
L["Earthen Shield Totem"] = true;
L["Healing Rain"] = true;
L["Healing Stream"] = true;
L["Healing Stream Totem"] = true;
L["Earthen Shield Totem Bar"] = true;
L["Healing Tide"] = true;
L["Healing Tide Totem"] = true;
L["Purify Spirit"] = true;
L["Riptide"] = true;
L["Spirit Link"] = true;
L["Spirit Link Totem"] = true;
L["Spiritwalker's Grace"] = true;
L["Unleash Life"] = true;
L["Wellspring"] = true;
