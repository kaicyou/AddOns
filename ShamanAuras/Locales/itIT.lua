-- these are the itIT localizations
-- we will use the Wowace localization system
-- since this isn't the default, check and exit if not itIT

if GetLocale() ~= "itIT" then
	return
end

local _, GT_Globals = ...

local translations = {
{
	--Translation missing 
	-- ["Ability Duration Timers"] = "",
	--Translation missing 
	-- ["Add or remove separating commas"] = "",
	--Translation missing 
	-- ["Advanced customization options"] = "",
	--Translation missing 
	-- ["Allows you to move the group that contains the buff duration timers"] = "",
	--Translation missing 
	-- ["Alpha (In Combat)"] = "",
	--Translation missing 
	-- ["Alpha (OoC - No Target)"] = "",
	--Translation missing 
	-- ["Alpha (OoC - Target)"] = "",
	--Translation missing 
	-- ["Alpha (OoC)"] = "",
	--Translation missing 
	-- ["Alpha (Out of Combat)"] = "",
	--Translation missing 
	-- ["Always"] = "",
	--Translation missing 
	-- ["Ancestral Guidance"] = "",
	--Translation missing 
	-- ["Ancestral Protection"] = "",
	--Translation missing 
	-- ["Ancestral Protection Totem"] = "",
	--Translation missing 
	-- ["Anchor Point"] = "",
	--Translation missing 
	-- ["Animate Tidal Waves Bar"] = "",
	--Translation missing 
	-- ["Applies a shadow effect to the text"] = "",
	--Translation missing 
	-- ["Ascendance"] = "",
	--Translation missing 
	-- ["Astral Shift"] = "",
	--Translation missing 
	-- ["Aura Settings"] = "",
	--Translation missing 
	-- ["Auras used by the Elemental specialization"] = "",
	--Translation missing 
	-- ["Auras used by the Enhancement specialization"] = "",
	--Translation missing 
	-- ["Auras used by the Restoration specialization"] = "",
	--Translation missing 
	-- ["Background Color"] = "",
	--Translation missing 
	-- ["Background Opacity"] = "",
	--Translation missing 
	-- ["Background Texture"] = "",
	--Translation missing 
	-- ["Bar Color"] = "",
	--Translation missing 
	-- ["Bar Height"] = "",
	--Translation missing 
	-- ["Bar Texture"] = "",
	--Translation missing 
	-- ["Bar Width"] = "",
	--Translation missing 
	-- ["Blizzard Casting Bar"] = "",
	--Translation missing 
	-- ["Bloodlust"] = "",
	--Translation missing 
	-- ["BOTTOM"] = "",
	--Translation missing 
	-- ["BOTTOMLEFT"] = "",
	--Translation missing 
	-- ["BOTTOMRIGHT"] = "",
	--Translation missing 
	-- ["Boulderfist"] = "",
	--Translation missing 
	-- ["Buff Count Text"] = "",
	--Translation missing 
	-- ["Buff Duration Timers"] = "",
	--Translation missing 
	-- ["Cast Bar"] = "",
	--Translation missing 
	-- ["Cast Bar Settings"] = "",
	--Translation missing 
	-- ["Center"] = "",
	--Translation missing 
	-- ["CENTER"] = "",
	--Translation missing 
	-- ["Changes the height of the Earthen Shield Bar. (Default is 21)"] = "",
	--Translation missing 
	-- ["Changes the height of the Icefury Bar. (Default is 21)"] = "",
	--Translation missing 
	-- ["Changes the height of the Maelstrom Bar. (Default is 21)"] = "",
	--Translation missing 
	-- ["Changes the height of the Mana Bar. (Default is 21)"] = "",
	--Translation missing 
	-- ["Changes the height of the Tidal Waves Bar. (Default is 7)"] = "",
	--Translation missing 
	-- ["Changes the size of the text. (Default is 12)"] = "",
	--Translation missing 
	-- ["Changes the width of the Earthen Shield Bar. (Default is 260)"] = "",
	--Translation missing 
	-- ["Changes the width of the Icefury Bar. (Default is 260)"] = "",
	--Translation missing 
	-- ["Changes the width of the Maelstrom Bar. (Default is 260)"] = "",
	--Translation missing 
	-- ["Changes the width of the Mana Bar. (Default is 260)"] = "",
	--Translation missing 
	-- ["Changes the width of the Tidal Waves Bar. (Default is 225)"] = "",
	--Translation missing 
	-- ["Channel Bar"] = "",
	--Translation missing 
	-- ["Cleanse Spirit"] = "",
	--Translation missing 
	-- ["Cloudburst"] = "",
	--Translation missing 
	-- ["Cloudburst Healing Stored"] = "",
	--Translation missing 
	-- ["Cloudburst Totem"] = "",
	--Translation missing 
	-- ["Color (OoR)"] = "",
	--Translation missing 
	-- ["Concordance of the Legionfall"] = "",
	--Translation missing 
	-- ["Configuration"] = "",
	--Translation missing 
	-- ["Cooldown Settings"] = "",
	--Translation missing 
	-- ["Cooldown Sweep Animation"] = "",
	--Translation missing 
	-- ["Cooldown Values"] = "",
	--Translation missing 
	-- ["Count Value Text"] = "",
	--Translation missing 
	-- ["Crash Lightning"] = "",
	--Translation missing 
	-- ["Critical Strike"] = "",
	--Translation missing 
	-- ["Customize the font size of the cooldown text"] = "",
	--Translation missing 
	-- ["Determines how opaque or transparent the auras will appear when out of combat"] = "",
	--Translation missing 
	-- ["Determines how opaque or transparent the bar will appear when out of combat"] = "",
	--Translation missing 
	-- ["Determines how opaque or transparent the bar will appear when out of combat and targetting an enemy"] = "",
	--Translation missing 
	-- ["Determines how opaque or transparent the bar will appear while in combat"] = "",
	--Translation missing 
	-- ["Determines how opaque or transparent the maelstrom bar appear when out of combat"] = "",
	--Translation missing 
	-- ["Determines how opaque or transparent the maelstrom bar appear when out of combat and targetting an enemyt"] = "",
	--Translation missing 
	-- ["Determines how opaque or transparent the maelstrom bar appear while in combat"] = "",
	--Translation missing 
	-- ["Determines the color and alpha of the grid"] = "",
	--Translation missing 
	-- ["Determines the color and alpha of the main X/Y axis lines"] = "",
	--Translation missing 
	-- ["Determines the color of harmful auras will appear when out of range"] = "",
	--Translation missing 
	-- ["Determines the color of the Tidal Waves bar when no tidal wave charges are active"] = "",
	--Translation missing 
	-- ["Determines the size of primary auras in row 1. (Default is 32)"] = "",
	--Translation missing 
	-- ["Determines the size of primary auras in row 2. (Default is 32)"] = "",
	--Translation missing 
	-- ["Determines the size of secondary auras in column 1. (Default is 25)"] = "",
	--Translation missing 
	-- ["Determines the size of secondary auras in column 2. (Default is 25)"] = "",
	--Translation missing 
	-- ["Determines the size of the primary charge text in row 1. (Default is 13.5)"] = "",
	--Translation missing 
	-- ["Determines the size of the primary charge text in row 2. (Default is 13.5)"] = "",
	--Translation missing 
	-- ["Determines the size of the secondary charge text in column 1. (Default is 13.5)"] = "",
	--Translation missing 
	-- ["Determines the size of the secondary charge text in column 2. (Default is 13.5)"] = "",
	--Translation missing 
	-- ["Determines the spacing of the primary auras in row 1. (Default is 50)"] = "",
	--Translation missing 
	-- ["Determines the spacing of the primary auras in row 2. (Default is 50)"] = "",
	--Translation missing 
	-- ["Determines the spacing of the secondary auras in column 1. (Default is 30)"] = "",
	--Translation missing 
	-- ["Determines the spacing of the secondary auras in column 2. (Default is 30)"] = "",
	--Translation missing 
	-- ["Deuff Duration Timers"] = "",
	--Translation missing 
	-- ["Digit Grouping"] = "",
	--Translation missing 
	-- ["Display"] = "",
	--Translation missing 
	-- ["Doom Winds"] = "",
	--Translation missing 
	-- ["Earth Elemental"] = "",
	--Translation missing 
	-- ["Earth Shock"] = "",
	--Translation missing 
	-- ["Earthen Shield"] = "",
	--Translation missing 
	-- ["Earthen Shield Bar"] = "",
	--Translation missing 
	-- ["Earthen Shield Totem"] = "",
	--Translation missing 
	-- ["Earthen Shield Totem Bar"] = "",
	--Translation missing 
	-- ["Earthen Spike"] = "",
	--Translation missing 
	-- ["Earthgrab"] = "",
	--Translation missing 
	-- ["Earthgrab Totem"] = "",
	--Translation missing 
	-- ["Earthquake"] = "",
	--Translation missing 
	-- ["Elemental"] = "",
	--Translation missing 
	-- ["Elemental Auras"] = "",
	--Translation missing 
	-- ["Elemental Blast"] = "",
	--Translation missing 
	-- ["Elemental Duration Timers"] = "",
	--Translation missing 
	-- ["Elemental Focus"] = "",
	--Translation missing 
	-- ["Elemental Mastery"] = "",
	--Translation missing 
	-- ["Elemental Shaman Auras"] = "",
	--Translation missing 
	-- ["Enhancement"] = "",
	--Translation missing 
	-- ["Enhancement Auras"] = "",
	--Translation missing 
	-- ["Enhancement Shaman Auras"] = "",
	--Translation missing 
	-- ["Feral Lunge"] = "",
	--Translation missing 
	-- ["Feral Spirit"] = "",
	--Translation missing 
	-- ["Fire Elemental"] = "",
	--Translation missing 
	-- ["Flame Shock"] = "",
	--Translation missing 
	-- ["Flametongue"] = "",
	--Translation missing 
	-- ["Font"] = "",
	--Translation missing 
	-- ["Font Outline"] = "",
	--Translation missing 
	-- ["Font Size"] = "",
	--Translation missing 
	-- ["Frostbrand"] = "",
	--Translation missing 
	-- ["General"] = "",
	--Translation missing 
	-- ["Gift of the Queen"] = "",
	--Translation missing 
	-- ["Greater Earth Elemental"] = "",
	--Translation missing 
	-- ["Greater Fire Elemental"] = "",
	--Translation missing 
	-- ["Greater Storm Elemental"] = "",
	--Translation missing 
	-- ["Grid Color"] = "",
	--Translation missing 
	-- ["Grid Preview"] = "",
	--Translation missing 
	-- ["Grid Settings"] = "",
	--Translation missing 
	-- ["Gust of Wind"] = "",
	--Translation missing 
	-- ["Haste"] = "",
	--Translation missing 
	-- ["Healing Rain"] = "",
	--Translation missing 
	-- ["Healing Stream"] = "",
	--Translation missing 
	-- ["Healing Stream Totem"] = "",
	--Translation missing 
	-- ["Healing Tide"] = "",
	--Translation missing 
	-- ["Healing Tide Totem"] = "",
	--Translation missing 
	-- ["Health Text"] = "",
	--Translation missing 
	-- ["Health Value Justify"] = "",
	--Translation missing 
	-- ["Health Value Text"] = "",
	--Translation missing 
	-- ["Height"] = "",
	--Translation missing 
	-- ["Heroism"] = "",
	--Translation missing 
	-- ["Hex"] = "",
	--Translation missing 
	-- ["Horizontal"] = "",
	--Translation missing 
	-- ["Icefury"] = "",
	--Translation missing 
	-- ["Icefury Bar"] = "",
	--Translation missing 
	-- ["Icefury Bar Settings"] = "",
	--Translation missing 
	-- ["Icon & Spark"] = "",
	--Translation missing 
	-- ["Icon Justify"] = "",
	--Translation missing 
	-- ["Landslide"] = "",
	--Translation missing 
	-- ["Lava Burst"] = "",
	--Translation missing 
	-- ["Lava Lash"] = "",
	--Translation missing 
	-- ["Lava Surge"] = "",
	--Translation missing 
	-- ["Layout"] = "",
	--Translation missing 
	-- ["Layout & Design"] = "",
	--Translation missing 
	-- ["Layout Settings"] = "",
	--Translation missing 
	-- ["Left"] = "",
	--Translation missing 
	-- ["LEFT"] = "",
	--Translation missing 
	-- ["Lightning Surge"] = "",
	--Translation missing 
	-- ["Lightning Surge Totem"] = "",
	--Translation missing 
	-- ["Liquid Magma"] = "",
	--Translation missing 
	-- ["Liquid Magma Totem"] = "",
	--Translation missing 
	-- ["Maelstrom"] = "",
	--Translation missing 
	-- ["Maelstrom Alpha (In Combat)"] = "",
	--Translation missing 
	-- ["Maelstrom Alpha (OoC - No Target)"] = "",
	--Translation missing 
	-- ["Maelstrom Alpha (OoC - Target)"] = "",
	--Translation missing 
	-- ["Maelstrom Bar"] = "",
	--Translation missing 
	-- ["Maelstrom Bar Settings"] = "",
	--Translation missing 
	-- ["Maelstrom Lightning"] = "",
	--Translation missing 
	-- ["Maelstrom Settings"] = "",
	--Translation missing 
	-- ["Maelstrom Text"] = "",
	--Translation missing 
	-- ["Maelstrom Trigger"] = "",
	--Translation missing 
	-- ["Maelstrom Value Justify"] = "",
	--Translation missing 
	-- ["Maelstrom Value Text"] = "",
	--Translation missing 
	-- ["Major Auras"] = "",
	--Translation missing 
	-- ["Mana Bar"] = "",
	--Translation missing 
	-- ["Mana Bar Settings"] = "",
	--Translation missing 
	-- ["Mana Precision"] = "",
	--Translation missing 
	-- ["Mana Value Justify"] = "",
	--Translation missing 
	-- ["Mana Value Text"] = "",
	--Translation missing 
	-- ["Mastery"] = "",
	--Translation missing 
	-- ["Minor Auras"] = "",
	--Translation missing 
	-- ["Modify Background"] = "",
	--Translation missing 
	-- ["Modify Cast Bar"] = "",
	--Translation missing 
	-- ["Modify Channel Bar"] = "",
	--Translation missing 
	-- ["Modify Earthen Shield Bar"] = "",
	--Translation missing 
	-- ["Modify Icefury Bar"] = "",
	--Translation missing 
	-- ["Modify Maelstrom Bar"] = "",
	--Translation missing 
	-- ["Modify Mana Bar"] = "",
	--Translation missing 
	-- ["Modify Tidal Waves Bar"] = "",
	--Translation missing 
	-- ["Modify Timer Bar"] = "",
	--Translation missing 
	-- ["Monochrome"] = "",
	--Translation missing 
	-- ["Monochrome Outline"] = "",
	--Translation missing 
	-- ["Monochrome Thick Outline"] = "",
	--Translation missing 
	-- ["Move All Auras"] = "",
	--Translation missing 
	-- ["Move Aura Groups"] = "",
	--Translation missing 
	-- ["Move Bottom Auras"] = "",
	--Translation missing 
	-- ["Move Buff Timer Bars"] = "",
	--Translation missing 
	-- ["Move Doom Winds"] = "",
	--Translation missing 
	-- ["Move Earthen Shield Bar"] = "",
	--Translation missing 
	-- ["Move Elemental Aura Groups"] = "",
	--Translation missing 
	-- ["Move Elemental Auras"] = "",
	--Translation missing 
	-- ["Move Enhancement Auras"] = "",
	--Translation missing 
	-- ["Move Icefury Bar"] = "",
	--Translation missing 
	-- ["Move Lava Surge Texture"] = "",
	--Translation missing 
	-- ["Move Left Auras"] = "",
	--Translation missing 
	-- ["Move Maelstrom Bar"] = "",
	--Translation missing 
	-- ["Move Main Timer Bars"] = "",
	--Translation missing 
	-- ["Move Restoration Auras"] = "",
	--Translation missing 
	-- ["Move Right Auras"] = "",
	--Translation missing 
	-- ["Move Stormkeeper Charges"] = "",
	--Translation missing 
	-- ["Move Stormstrike Charges"] = "",
	--Translation missing 
	-- ["Move Tidal Waves Bar"] = "",
	--Translation missing 
	-- ["Move Top Auras"] = "",
	--Translation missing 
	-- ["Move Totem Mastery Alert"] = "",
	--Translation missing 
	-- ["Move Undulation"] = "",
	--Translation missing 
	-- ["Move Utility Timer Bars"] = "",
	--Translation missing 
	-- ["Name Text"] = "",
	--Translation missing 
	-- ["Never"] = "",
	--Translation missing 
	-- ["No Tidal Waves Color"] = "",
	--Translation missing 
	-- ["None"] = "",
	--Translation missing 
	-- ["On Heal Only"] = "",
	--Translation missing 
	-- ["OoC Target Display"] = "",
	--Translation missing 
	-- ["OoC Tidal Wave Duration"] = "",
	--Translation missing 
	-- ["Our of Range Color"] = "",
	--Translation missing 
	-- ["Out of Combat Alpha"] = "",
	--Translation missing 
	-- ["Outline"] = "",
	--Translation missing 
	-- ["Power of the Maelstrom"] = "",
	--Translation missing 
	-- ["Preview Earthen Shield Bar"] = "",
	--Translation missing 
	-- ["Preview Icefury Bar"] = "",
	--Translation missing 
	-- ["Preview Maelstrom Bar"] = "",
	--Translation missing 
	-- ["Preview Tidal Waves Bar"] = "",
	--Translation missing 
	-- ["Primary Aura Size"] = "",
	--Translation missing 
	-- ["Primary Auras"] = "",
	--Translation missing 
	-- ["Primary Charges 1"] = "",
	--Translation missing 
	-- ["Primary Charges 2"] = "",
	--Translation missing 
	-- ["Primary Icon Size"] = "",
	--Translation missing 
	-- ["Primary Orientation 1"] = "",
	--Translation missing 
	-- ["Primary Orientation 2"] = "",
	--Translation missing 
	-- ["Primary Size 1"] = "",
	--Translation missing 
	-- ["Primary Size 2"] = "",
	--Translation missing 
	-- ["Primary Spacing 1"] = "",
	--Translation missing 
	-- ["Primary Spacing 2"] = "",
	--Translation missing 
	-- ["Progress Bars"] = "",
	--Translation missing 
	-- ["Purify Spirit"] = "",
	--Translation missing 
	-- ["Rainfall"] = "",
	--Translation missing 
	-- ["Reload UI"] = "",
	--Translation missing 
	-- ["Remaining Time"] = "",
	--Translation missing 
	-- ["Reset Cast Bar"] = "",
	--Translation missing 
	-- ["Reset Channel Bar"] = "",
	--Translation missing 
	-- ["Reset Earthen Shield Bar"] = "",
	--Translation missing 
	-- ["Reset Elemental Auras"] = "",
	--Translation missing 
	-- ["Reset Enhancement Auras"] = "",
	--Translation missing 
	-- ["Reset Icefury Bar"] = "",
	--Translation missing 
	-- ["Reset Maelstrom Bar"] = "",
	--Translation missing 
	-- ["Reset Mana Bar"] = "",
	--Translation missing 
	-- ["Reset Primary Layout"] = "",
	--Translation missing 
	-- ["Reset Restoration Auras"] = "",
	--Translation missing 
	-- ["Reset Secondary Layout"] = "",
	--Translation missing 
	-- ["Reset Settings Values"] = "",
	--Translation missing 
	-- ["Reset Tidal Waves Bar"] = "",
	--Translation missing 
	-- ["Resource Accumulation"] = "",
	--Translation missing 
	-- ["Restoration"] = "",
	--Translation missing 
	-- ["Restoration Auras"] = "",
	--Translation missing 
	-- ["Restoration Shaman Auras"] = "",
	--Translation missing 
	-- ["Reverse Sweep Animation"] = "",
	--Translation missing 
	-- ["Reverses the cooldown animation sweep."] = "",
	--Translation missing 
	-- ["Right"] = "",
	--Translation missing 
	-- ["RIGHT"] = "",
	--Translation missing 
	-- ["Riptide"] = "",
	--Translation missing 
	-- ["Rockbiter"] = "",
	--Translation missing 
	-- ["Secondary Auras"] = "",
	--Translation missing 
	-- ["Secondary Charges 1"] = "",
	--Translation missing 
	-- ["Secondary Charges 2"] = "",
	--Translation missing 
	-- ["Secondary Icon Size"] = "",
	--Translation missing 
	-- ["Secondary Orientation 1"] = "",
	--Translation missing 
	-- ["Secondary Orientation 2"] = "",
	--Translation missing 
	-- ["Secondary Size 1"] = "",
	--Translation missing 
	-- ["Secondary Size 2"] = "",
	--Translation missing 
	-- ["Secondary Spacing 1"] = "",
	--Translation missing 
	-- ["Secondary Spacing 2"] = "",
	--Translation missing 
	-- ["Set how large the \"Primary\" Auras appear"] = "",
	--Translation missing 
	-- ["Set location of text on the X axis"] = "",
	--Translation missing 
	-- ["Set location of text on the Y axis"] = "",
	--Translation missing 
	-- ["Set the anchor point."] = "",
	--Translation missing 
	-- ["Set the aura orientation to horizontal or vertical."] = "",
	--Translation missing 
	-- ["Set the bar's background texture."] = "",
	--Translation missing 
	-- ["Set the bar's texture."] = "",
	--Translation missing 
	-- ["Set the color of the cast bar's background."] = "",
	--Translation missing 
	-- ["Set the color of the text."] = "",
	--Translation missing 
	-- ["Set the color of the text's shadow."] = "",
	--Translation missing 
	-- ["Set the position of the text on the Earthen Shield bar."] = "",
	--Translation missing 
	-- ["Set the position of the text on the mana bar."] = "",
	--Translation missing 
	-- ["Set the side of the progress bar that the icon will appear."] = "",
	--Translation missing 
	-- ["Set the text shadow's X offset"] = "",
	--Translation missing 
	-- ["Set the text shadow's Y offset"] = "",
	--Translation missing 
	-- ["Settings"] = "",
	--Translation missing 
	-- ["Shadow Color"] = "",
	--Translation missing 
	-- ["Show Ability Timers"] = "",
	--Translation missing 
	-- ["Show Buff Timers"] = "",
	--Translation missing 
	-- ["Show Elemental Auras"] = "",
	--Translation missing 
	-- ["Show Enhancement Auras"] = "",
	--Translation missing 
	-- ["Show Restoration Auras"] = "",
	--Translation missing 
	-- ["Show Utility Timers"] = "",
	--Translation missing 
	-- ["Spell Name Text"] = "",
	--Translation missing 
	-- ["Spirit Link"] = "",
	--Translation missing 
	-- ["Spirit Link Totem"] = "",
	--Translation missing 
	-- ["Spirit Walk"] = "",
	--Translation missing 
	-- ["Spiritwalker's Grace"] = "",
	--Translation missing 
	-- ["Statusbar Manager"] = "",
	--Translation missing 
	-- ["Storm Elemental"] = "",
	--Translation missing 
	-- ["Stormkeeper"] = "",
	--Translation missing 
	-- ["Stormkeeper Orbs"] = "",
	--Translation missing 
	-- ["Stormstrike"] = "",
	--Translation missing 
	-- ["Stormstrike Lightning Orbs"] = "",
	--Translation missing 
	-- ["Sundering"] = "",
	--Translation missing 
	-- ["Target & On Heal"] = "",
	--Translation missing 
	-- ["Target Display (OoC)"] = "",
	--Translation missing 
	-- ["Target Only"] = "",
	--Translation missing 
	-- ["Text Color"] = "",
	--Translation missing 
	-- ["Text Shadow"] = "",
	--Translation missing 
	-- ["Text Size"] = "",
	--Translation missing 
	-- ["Texture Alerts"] = "",
	--Translation missing 
	-- ["The amount of Maelstrom accumulated at which the \"Lightning\" animation will appear"] = "",
	--Translation missing 
	-- ["The amount of seconds remaining when the \"Glow\" animation will appear"] = "",
	--Translation missing 
	-- ["The amount of seconds remaining when the Totem Mastery texture will appear"] = "",
	--Translation missing 
	-- ["The amount of seconds the Tidal Waves indicator bar will appear when casting a heal without a target while out of combat."] = "",
	--Translation missing 
	-- ["The font that will be used"] = "",
	--Translation missing 
	-- ["The method in which Tidal Wave will be displayed while in combat."] = "",
	--Translation missing 
	-- ["The method in which Tidal Wave will be displayed while out of combat."] = "",
	--Translation missing 
	-- ["The outline of the font"] = "",
	--Translation missing 
	-- ["Thick Outline"] = "",
	--Translation missing 
	-- ["Thunderstorm"] = "",
	--Translation missing 
	-- ["Tidal Wave Display (In Combat)"] = "",
	--Translation missing 
	-- ["Tidal Wave Display (OoC)"] = "",
	--Translation missing 
	-- ["Tidal Wave Duration (OoC)"] = "",
	--Translation missing 
	-- ["Tidal Waves Bar"] = "",
	--Translation missing 
	-- ["Time Text"] = "",
	--Translation missing 
	-- ["Time Warp"] = "",
	--Translation missing 
	-- ["Timer Bar"] = "",
	--Translation missing 
	-- ["Timer Bar Texture"] = "",
	--Translation missing 
	-- ["Timer Value Text"] = "",
	--Translation missing 
	-- ["Toggle"] = "",
	--Translation missing 
	-- ["Toggle Buff Count Text"] = "",
	--Translation missing 
	-- ["Toggle Cast Bar"] = "",
	--Translation missing 
	-- ["Toggle Channel Bar"] = "",
	--Translation missing 
	-- ["Toggle Earthen Shield Bar"] = "",
	--Translation missing 
	-- ["Toggle Grid"] = "",
	--Translation missing 
	-- ["Toggle Icefury Bar"] = "",
	--Translation missing 
	-- ["Toggle Icon"] = "",
	--Translation missing 
	-- ["Toggle Info Frame"] = "",
	--Translation missing 
	-- ["Toggle Maelstrom Bar"] = "",
	--Translation missing 
	-- ["Toggle Mana Bar"] = "",
	--Translation missing 
	-- ["Toggle Spark"] = "",
	--Translation missing 
	-- ["Toggle Spell Name Text"] = "",
	--Translation missing 
	-- ["Toggle the adjustment of the bar's background texture"] = "",
	--Translation missing 
	-- ["Toggle the adjustment of the Cast Bar"] = "",
	--Translation missing 
	-- ["Toggle the adjustment of the Channel Bar"] = "",
	--Translation missing 
	-- ["Toggle the adjustment of the Earthen Shield Bar"] = "",
	--Translation missing 
	-- ["Toggle the adjustment of the Earthen Shield Bar size"] = "",
	--Translation missing 
	-- ["Toggle the adjustment of the Icefury Bar"] = "",
	--Translation missing 
	-- ["Toggle the adjustment of the Icefury Bar size"] = "",
	--Translation missing 
	-- ["Toggle the adjustment of the Maelstrom Bar"] = "",
	--Translation missing 
	-- ["Toggle the adjustment of the Maelstrom Bar size"] = "",
	--Translation missing 
	-- ["Toggle the adjustment of the Mana Bar"] = "",
	--Translation missing 
	-- ["Toggle the adjustment of the Tidal Waves Bar"] = "",
	--Translation missing 
	-- ["Toggle the adjustment of the Tidal Waves Bar size"] = "",
	--Translation missing 
	-- ["Toggle the adjustment of the Timer Bar"] = "",
	--Translation missing 
	-- ["Toggle the display of cooldown text/numbers."] = "",
	--Translation missing 
	-- ["Toggle the display of Elemental Auras"] = "",
	--Translation missing 
	-- ["Toggle the display of Restoration Auras"] = "",
	--Translation missing 
	-- ["Toggle the display of the cooldown animation sweep."] = "",
	--Translation missing 
	-- ["Toggle Tidal Waves Bar"] = "",
	--Translation missing 
	-- ["Toggle Time Text"] = "",
	--Translation missing 
	-- ["Toggle Totem Health Text"] = "",
	--Translation missing 
	-- ["Toggles the display of Blizzard's default casting bar"] = "",
	--Translation missing 
	-- ["Toggles the display of the auras while targetting an enemy while out of combat."] = "",
	--Translation missing 
	-- ["Toggles the display of the cast bar"] = "",
	--Translation missing 
	-- ["Toggles the display of the channel bar"] = "",
	--Translation missing 
	-- ["Toggles the display of the Earthen Shield bar"] = "",
	--Translation missing 
	-- ["Toggles the display of the Icefury bar"] = "",
	--Translation missing 
	-- ["Toggles the display of the Maelstrom Bar"] = "",
	--Translation missing 
	-- ["Toggles the display of the Mana Bar"] = "",
	--Translation missing 
	-- ["Toggles the display of the Tidal Waves bar"] = "",
	--Translation missing 
	-- ["Toggles the text display of the amount of health remaining"] = "",
	--Translation missing 
	-- ["Toggles the text display of the amount of icefury stacks remaining"] = "",
	--Translation missing 
	-- ["Toggles the text display of the amount of maelstrom remaining"] = "",
	--Translation missing 
	-- ["Toggles the text display of the amount of mana remaining"] = "",
	--Translation missing 
	-- ["Toggles the text display of the amount of time remaining"] = "",
	--Translation missing 
	-- ["Toggles the text display of the remaining health of the Earthen Shield Totem"] = "",
	--Translation missing 
	-- ["Toggles the text display of the remaining stacks on Icefury's buff"] = "",
	--Translation missing 
	-- ["Toggles the text display of the spell casted"] = "",
	--Translation missing 
	-- ["TOP"] = "",
	--Translation missing 
	-- ["TOPLEFT"] = "",
	--Translation missing 
	-- ["TOPRIGHT"] = "",
	--Translation missing 
	-- ["Totem Duration Timers"] = "",
	--Translation missing 
	-- ["Totem Mastery"] = "",
	--Translation missing 
	-- ["Undulation"] = "",
	--Translation missing 
	-- ["Unleash Doom"] = "",
	--Translation missing 
	-- ["Unleash Life"] = "",
	--Translation missing 
	-- ["Utility Duration Timers"] = "",
	--Translation missing 
	-- ["Vertical"] = "",
	--Translation missing 
	-- ["Voodoo"] = "",
	--Translation missing 
	-- ["Voodoo Totem"] = "",
	--Translation missing 
	-- ["Wellspring"] = "",
	--Translation missing 
	-- ["Width"] = "",
	--Translation missing 
	-- ["Wind Rush"] = "",
	--Translation missing 
	-- ["Wind Rush Totem"] = "",
	--Translation missing 
	-- ["Wind Shear"] = "",
	--Translation missing 
	-- ["Windsong"] = "",
	--Translation missing 
	-- ["X/Y Axis Color"] = ""
}
}

GT_Globals:RegisterLocale("itIT", translations)
translations = nil
