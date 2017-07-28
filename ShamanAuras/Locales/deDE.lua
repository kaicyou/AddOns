-- these are the deDE localizations
-- we will use the Wowace localization system
-- since this isn't the default, check and exit if not deDE

if GetLocale() ~= "deDE" then
	return
end

local _, GT_Globals = ...

local translations = {
{
	["Ability Duration Timers"] = "Fähigkeitenlaufzeit Timer",
	--Translation missing 
	-- ["Add or remove separating commas"] = "",
	["Advanced customization options"] = "Erweiterte Anpassungseinstellungen",
	["Allows you to move the group that contains the buff duration timers"] = "Erlaubt es dir, die Gruppe mit den Buff-Dauer Timern zu verschieben",
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
	["Always"] = "Immer",
	["Ancestral Guidance"] = "Führung der Ahnen",
	["Ancestral Protection"] = "Schutz der Ahnen",
	["Ancestral Protection Totem"] = "Totem des Schutzes der Ahnen",
	--Translation missing 
	-- ["Anchor Point"] = "",
	["Animate Tidal Waves Bar"] = "Animierte Gezeitenwellen Bar",
	--Translation missing 
	-- ["Applies a shadow effect to the text"] = "",
	["Ascendance"] = "Aszendenz",
	["Astral Shift"] = "Astralverschiebung",
	["Aura Settings"] = "Aura Einstellungen",
	["Auras used by the Elemental specialization"] = "Auren benutzt von der Elementar-Spezialisierung",
	["Auras used by the Enhancement specialization"] = "Auren benutzt von der Verstärkung-Spezialisierung",
	["Auras used by the Restoration specialization"] = "Auren benutzt von der Wiederherstellung-Spezialisierung",
	--Translation missing 
	-- ["Background Color"] = "",
	--Translation missing 
	-- ["Background Opacity"] = "",
	--Translation missing 
	-- ["Background Texture"] = "",
	--Translation missing 
	-- ["Bar Color"] = "",
	["Bar Height"] = "Bar Höhe",
	--Translation missing 
	-- ["Bar Texture"] = "",
	["Bar Width"] = "Leistenbreite",
	--Translation missing 
	-- ["Blizzard Casting Bar"] = "",
	["Bloodlust"] = "Kampfrausch",
	--Translation missing 
	-- ["BOTTOM"] = "",
	--Translation missing 
	-- ["BOTTOMLEFT"] = "",
	--Translation missing 
	-- ["BOTTOMRIGHT"] = "",
	["Boulderfist"] = "Felsfaust",
	--Translation missing 
	-- ["Buff Count Text"] = "",
	["Buff Duration Timers"] = "Bufflaufzeit Timer",
	--Translation missing 
	-- ["Cast Bar"] = "",
	--Translation missing 
	-- ["Cast Bar Settings"] = "",
	--Translation missing 
	-- ["Center"] = "",
	--Translation missing 
	-- ["CENTER"] = "",
	["Changes the height of the Earthen Shield Bar. (Default is 21)"] = "Ändert die Höhe der irdenen Schild Leiste. (Standart ist 21)",
	["Changes the height of the Icefury Bar. (Default is 21)"] = "Ändert die Höhe der Eisfuror Leiste. (Standart ist 21)",
	["Changes the height of the Maelstrom Bar. (Default is 21)"] = "Ändert die Höhe der Mahlstrom Leiste. (Standart ist 21)",
	--Translation missing 
	-- ["Changes the height of the Mana Bar. (Default is 21)"] = "",
	["Changes the height of the Tidal Waves Bar. (Default is 7)"] = "Ändert die Höhe der Flutwellen Leiste. (Standart ist 7)",
	--Translation missing 
	-- ["Changes the size of the text. (Default is 12)"] = "",
	["Changes the width of the Earthen Shield Bar. (Default is 260)"] = "Ändert die Breite der irdenen Schild Leiste. (Standart ist 260)",
	["Changes the width of the Icefury Bar. (Default is 260)"] = "Ändert die Breite der Eisfuror Leiste. (Standart ist 260)",
	["Changes the width of the Maelstrom Bar. (Default is 260)"] = "Ändert die Breite der Mahlstrom Leiste. (Standart ist 260)",
	--Translation missing 
	-- ["Changes the width of the Mana Bar. (Default is 260)"] = "",
	["Changes the width of the Tidal Waves Bar. (Default is 225)"] = "Ändert die Breite der irdenen Schild Leiste. (Standart ist 225)",
	--Translation missing 
	-- ["Channel Bar"] = "",
	["Cleanse Spirit"] = "Geistläuterung",
	["Cloudburst"] = "Wolkenbruch",
	["Cloudburst Healing Stored"] = "gespeicherte Wolkenbruch Heilung",
	["Cloudburst Totem"] = "Totem des Wolkenbruchs",
	--Translation missing 
	-- ["Color (OoR)"] = "",
	--Translation missing 
	-- ["Concordance of the Legionfall"] = "",
	--Translation missing 
	-- ["Configuration"] = "",
	["Cooldown Settings"] = "Abklinkzeit Einstellungen",
	["Cooldown Sweep Animation"] = "Abklinkzeit Wisch-Animation",
	["Cooldown Values"] = "Abklinkzeit Werte",
	--Translation missing 
	-- ["Count Value Text"] = "",
	["Crash Lightning"] = "Tobende Blitze",
	["Critical Strike"] = "Kritischer Treffer",
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
	["Deuff Duration Timers"] = "Debufflaufzeit Timer",
	--Translation missing 
	-- ["Digit Grouping"] = "",
	--Translation missing 
	-- ["Display"] = "",
	["Doom Winds"] = "Schicksalswinde",
	["Earth Elemental"] = "Erdelementar",
	["Earth Shock"] = "Erdschock",
	["Earthen Shield"] = "Irdenes Schild",
	--Translation missing 
	-- ["Earthen Shield Bar"] = "",
	["Earthen Shield Totem"] = "Totem des irdenen Schilds",
	["Earthen Shield Totem Bar"] = "Leiste des Totems des irdenen Schilds",
	["Earthen Spike"] = "Irdener Stachel",
	["Earthgrab"] = "Erdgriff",
	["Earthgrab Totem"] = "Totem des Erdgriffs",
	["Earthquake"] = "Erdbeben",
	["Elemental"] = "Elementar",
	["Elemental Auras"] = "Elementar Auren",
	["Elemental Blast"] = "Elementarschlag",
	["Elemental Duration Timers"] = "Elementar Laufzeit Timer",
	--Translation missing 
	-- ["Elemental Focus"] = "",
	["Elemental Mastery"] = "Elementar Meisterschaft",
	["Elemental Shaman Auras"] = "Elementar Schamane Auren",
	["Enhancement"] = "Verstärkung",
	["Enhancement Auras"] = "Verstärkungs Auren",
	["Enhancement Shaman Auras"] = "Verstärkungs Schamane Auren",
	["Feral Lunge"] = "Wildes Anspringen",
	["Feral Spirit"] = "Wildgeist",
	["Fire Elemental"] = "Feuerelementar",
	["Flame Shock"] = "Flammenschock",
	["Flametongue"] = "Flammenzunge",
	--Translation missing 
	-- ["Font"] = "",
	--Translation missing 
	-- ["Font Outline"] = "",
	--Translation missing 
	-- ["Font Size"] = "",
	["Frostbrand"] = "Frostbrand",
	["General"] = "Allgemein",
	--Translation missing 
	-- ["Gift of the Queen"] = "",
	["Greater Earth Elemental"] = "Großer Erdelementar",
	["Greater Fire Elemental"] = "Großer Feuerelementar",
	["Greater Storm Elemental"] = "Großer Sturmelementar",
	["Grid Color"] = "Rasterfarbe",
	["Grid Preview"] = "Rastervorschau",
	["Grid Settings"] = "Rastereinstellungen",
	["Gust of Wind"] = "Rückenwind",
	["Haste"] = "Tempo",
	["Healing Rain"] = "Heilender Regen",
	["Healing Stream"] = "heilender Fluss",
	["Healing Stream Totem"] = "Totem des heilenden Flusses",
	["Healing Tide"] = "Heilungsflut",
	["Healing Tide Totem"] = "Totem der Heilungsflut",
	--Translation missing 
	-- ["Health Text"] = "",
	--Translation missing 
	-- ["Health Value Justify"] = "",
	--Translation missing 
	-- ["Health Value Text"] = "",
	--Translation missing 
	-- ["Height"] = "",
	["Heroism"] = "Heldentum",
	["Hex"] = "Verhexen",
	--Translation missing 
	-- ["Horizontal"] = "",
	["Icefury"] = "Eisfuror",
	["Icefury Bar"] = "Eisfuror Leiste",
	--Translation missing 
	-- ["Icefury Bar Settings"] = "",
	--Translation missing 
	-- ["Icon & Spark"] = "",
	--Translation missing 
	-- ["Icon Justify"] = "",
	--Translation missing 
	-- ["Landslide"] = "",
	["Lava Burst"] = "Lavaeruption",
	["Lava Lash"] = "Lavapeitsche",
	["Lava Surge"] = "Lavasog",
	--Translation missing 
	-- ["Layout"] = "",
	--Translation missing 
	-- ["Layout & Design"] = "",
	["Layout Settings"] = "Layout Einstellungen",
	--Translation missing 
	-- ["Left"] = "",
	--Translation missing 
	-- ["LEFT"] = "",
	["Lightning Surge"] = "Blitzwoge",
	["Lightning Surge Totem"] = "Totem der Blitzwoge",
	["Liquid Magma"] = "Flüssiges Magma",
	["Liquid Magma Totem"] = "Totem des flüssigen Magmas",
	["Maelstrom"] = "Mahlstrom",
	["Maelstrom Alpha (In Combat)"] = "Mahlstrom Alpha (Im Kampf)",
	--Translation missing 
	-- ["Maelstrom Alpha (OoC - No Target)"] = "",
	--Translation missing 
	-- ["Maelstrom Alpha (OoC - Target)"] = "",
	["Maelstrom Bar"] = "Mahlstrom Leiste",
	--Translation missing 
	-- ["Maelstrom Bar Settings"] = "",
	["Maelstrom Lightning"] = "Mahlstrom Blitzen",
	["Maelstrom Settings"] = "Mahlstrom Einstellungen",
	--Translation missing 
	-- ["Maelstrom Text"] = "",
	["Maelstrom Trigger"] = "Mahlstrom Auslöser",
	--Translation missing 
	-- ["Maelstrom Value Justify"] = "",
	--Translation missing 
	-- ["Maelstrom Value Text"] = "",
	["Major Auras"] = "große Auren",
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
	["Mastery"] = "Meisterschaft",
	["Minor Auras"] = "kleine Auren",
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
	["Move All Auras"] = "Bewege alle Auren",
	["Move Aura Groups"] = "Bewege Aura Gruppen",
	["Move Bottom Auras"] = "Bewege untere Auren",
	["Move Buff Timer Bars"] = "Bewege Bufflaufzeit Leiste",
	["Move Doom Winds"] = "Bewege Schicksalswinde",
	["Move Earthen Shield Bar"] = "Bewege irdenes Schild Leiste",
	["Move Elemental Aura Groups"] = "Bewege Elementar Auren Gruppen",
	["Move Elemental Auras"] = "Bewege Elementar Auren",
	["Move Enhancement Auras"] = "Bewege Verstärkungs Auren",
	["Move Icefury Bar"] = "Bewege Eisfuror Leiste",
	["Move Lava Surge Texture"] = "Bewege Lavasog Textur",
	["Move Left Auras"] = "Bewege linke Auren",
	["Move Maelstrom Bar"] = "Bewege Mahlstrom Leiste",
	["Move Main Timer Bars"] = "Bewege Haupttimer Leisten",
	["Move Restoration Auras"] = "Bewege Wiederherstellungs Auren",
	["Move Right Auras"] = "Bewege rechte Auren",
	["Move Stormkeeper Charges"] = "Bewege Sturmhüter Aufladungen",
	["Move Stormstrike Charges"] = "Bewege Sturmschlag Aufladungen",
	["Move Tidal Waves Bar"] = "Bewege Flutwellen Leiste",
	["Move Top Auras"] = "Bewege obere Auren",
	["Move Totem Mastery Alert"] = "Bewege Totembeherrschungs Alarm",
	["Move Undulation"] = "Bewege Wogen",
	["Move Utility Timer Bars"] = "Bewege Fähigkeiten Timer Leisten",
	--Translation missing 
	-- ["Name Text"] = "",
	["Never"] = "Nie",
	["No Tidal Waves Color"] = "Keine Flutwellen Farbe",
	--Translation missing 
	-- ["None"] = "",
	["On Heal Only"] = "nur beim Heilen",
	--Translation missing 
	-- ["OoC Target Display"] = "",
	--Translation missing 
	-- ["OoC Tidal Wave Duration"] = "",
	["Our of Range Color"] = "Außer Reichweite Farbe",
	["Out of Combat Alpha"] = "Außerhalb des Kampfes Alpha",
	--Translation missing 
	-- ["Outline"] = "",
	--Translation missing 
	-- ["Power of the Maelstrom"] = "",
	["Preview Earthen Shield Bar"] = "Vorschau der irdenes Schild Leiste",
	["Preview Icefury Bar"] = "Vorschau der Eisfuror Leiste",
	["Preview Maelstrom Bar"] = "Vorschau der Mahlstrom Leiste",
	["Preview Tidal Waves Bar"] = "Vorschau der Flutwellen Leiste",
	["Primary Aura Size"] = "Primäre Aura Größe",
	["Primary Auras"] = "Primäre Auren",
	["Primary Charges 1"] = "Primäre Aufladungen 1",
	["Primary Charges 2"] = "Primäre Aufladungen 2",
	["Primary Icon Size"] = "Primäre Symbol Größe",
	--Translation missing 
	-- ["Primary Orientation 1"] = "",
	--Translation missing 
	-- ["Primary Orientation 2"] = "",
	["Primary Size 1"] = "Primäre Größe 1",
	["Primary Size 2"] = "Primäre Größe 2",
	["Primary Spacing 1"] = "Primärer Abstand 1",
	["Primary Spacing 2"] = "Primärer Abstand 2",
	["Progress Bars"] = "Fortschrittsleiste",
	["Purify Spirit"] = "Geistreinigung",
	["Rainfall"] = "Regenschauer",
	["Reload UI"] = "Interface neu laden",
	["Remaining Time"] = "Verbleibende Zeit",
	--Translation missing 
	-- ["Reset Cast Bar"] = "",
	--Translation missing 
	-- ["Reset Channel Bar"] = "",
	["Reset Earthen Shield Bar"] = "irdenes Schild Leiste zurücksetzen",
	["Reset Elemental Auras"] = "Elementar Auren zurücksetzen",
	["Reset Enhancement Auras"] = "Verstärkungs Auren zurücksetzen",
	["Reset Icefury Bar"] = "Eisfuror Leiste zurücksetzen",
	["Reset Maelstrom Bar"] = "Mahlstrom Leiste zurücksetzen",
	--Translation missing 
	-- ["Reset Mana Bar"] = "",
	["Reset Primary Layout"] = "Primäres Layout zurücksetzen",
	["Reset Restoration Auras"] = "Wiederherstellungs Auren zurücksetzen",
	["Reset Secondary Layout"] = "Sekundäres Layout zurücksetzen",
	["Reset Settings Values"] = "Einstellungswerte zurücksetzen",
	["Reset Tidal Waves Bar"] = "Flutwellen Leiste zurücksetzen",
	--Translation missing 
	-- ["Resource Accumulation"] = "",
	["Restoration"] = "Wiederherstellung",
	["Restoration Auras"] = "Wiederherstellungs Auren",
	["Restoration Shaman Auras"] = "Wiederherstellungs Schamane Auren",
	--Translation missing 
	-- ["Reverse Sweep Animation"] = "",
	--Translation missing 
	-- ["Reverses the cooldown animation sweep."] = "",
	--Translation missing 
	-- ["Right"] = "",
	--Translation missing 
	-- ["RIGHT"] = "",
	["Riptide"] = "Springflut",
	--Translation missing 
	-- ["Rockbiter"] = "",
	["Secondary Auras"] = "Sekundärauren",
	["Secondary Charges 1"] = "Sekundäraufladungen 1",
	["Secondary Charges 2"] = "Sekundäraufladungen 2",
	["Secondary Icon Size"] = "Sekundärsymbol Größe",
	--Translation missing 
	-- ["Secondary Orientation 1"] = "",
	--Translation missing 
	-- ["Secondary Orientation 2"] = "",
	["Secondary Size 1"] = "Sekundärgröße 1",
	["Secondary Size 2"] = "Sekundärgröße 2",
	["Secondary Spacing 1"] = "Sekundärer Abstand 1",
	["Secondary Spacing 2"] = "Sekundärer Abstand 2",
	["Set how large the \"Primary\" Auras appear"] = "Einstellen, wie groß die \"Primär\" Auren erscheinen",
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
	["Settings"] = "Einstellungen",
	--Translation missing 
	-- ["Shadow Color"] = "",
	["Show Ability Timers"] = "Zeige Fähigkeiten Timer",
	["Show Buff Timers"] = "Zeige Buff Timer",
	["Show Elemental Auras"] = "Zeige Elementar Auren",
	["Show Enhancement Auras"] = "Zeige Verstärkungs Auren",
	["Show Restoration Auras"] = "Zeige Wiederherstellungs Auren",
	["Show Utility Timers"] = "Zeige Fähigkeiten Timer",
	--Translation missing 
	-- ["Spell Name Text"] = "",
	["Spirit Link"] = "Geistverbindung",
	["Spirit Link Totem"] = "Totem der Geistverbindung",
	["Spirit Walk"] = "Geisterpfoten",
	["Spiritwalker's Grace"] = "Gunst des Geistwandlers",
	--Translation missing 
	-- ["Statusbar Manager"] = "",
	["Storm Elemental"] = "Sturmelementar",
	["Stormkeeper"] = "Sturmhüter",
	["Stormkeeper Orbs"] = "Stürmhüter Kugeln",
	["Stormstrike"] = "Sturmschlag",
	["Stormstrike Lightning Orbs"] = "Sturmschlag leuchtende Kugeln",
	["Sundering"] = "Zerschlagung",
	["Target & On Heal"] = "Ziel & beim Heilen",
	--Translation missing 
	-- ["Target Display (OoC)"] = "",
	["Target Only"] = "nur mit Ziel",
	--Translation missing 
	-- ["Text Color"] = "",
	--Translation missing 
	-- ["Text Shadow"] = "",
	--Translation missing 
	-- ["Text Size"] = "",
	["Texture Alerts"] = "Texturalarm",
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
	["Thunderstorm"] = "Gewitter",
	["Tidal Wave Display (In Combat)"] = "Flutwellen Anzeige (im Kampf)",
	--Translation missing 
	-- ["Tidal Wave Display (OoC)"] = "",
	--Translation missing 
	-- ["Tidal Wave Duration (OoC)"] = "",
	["Tidal Waves Bar"] = "Flutwellen Leiste",
	--Translation missing 
	-- ["Time Text"] = "",
	["Time Warp"] = "Zeitkrümmung",
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
	["Toggle Grid"] = "Raster umschalten",
	--Translation missing 
	-- ["Toggle Icefury Bar"] = "",
	--Translation missing 
	-- ["Toggle Icon"] = "",
	["Toggle Info Frame"] = "Inforahmen umschalten",
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
	["Totem Duration Timers"] = "Totemlaufzeit Timer",
	["Totem Mastery"] = "Totembeherrschung",
	["Undulation"] = "Wogen",
	--Translation missing 
	-- ["Unleash Doom"] = "",
	["Unleash Life"] = "Leben entfesseln",
	["Utility Duration Timers"] = "Fähigkeitenlaufzeit Timer",
	--Translation missing 
	-- ["Vertical"] = "",
	["Voodoo"] = "Voodoo",
	["Voodoo Totem"] = "Voodoototem",
	["Wellspring"] = "Lebensquell",
	--Translation missing 
	-- ["Width"] = "",
	["Wind Rush"] = "Windsturm",
	["Wind Rush Totem"] = "Totem des Windsturms",
	["Wind Shear"] = "Windstoß",
	["Windsong"] = "Windweise",
	["X/Y Axis Color"] = "X/Y Achse Farbe"
}
}

GT_Globals:RegisterLocale("deDE", translations)
translations = nil
