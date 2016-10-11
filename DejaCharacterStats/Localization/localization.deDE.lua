local ADDON_NAME, namespace = ... 	--localization
local L = namespace.L 				--localization

local LOCALE = GetLocale()

if LOCALE == "deDE" then
	-- The EU English game client also
	-- uses the US English locale code.

-- ###################################################################################################
-- ##	Deutsche (German) translations provided by flow0284, Markurion and Branduril on Curseforge.	##
-- ##	Thank you flow0284, Markurion and Branduril!												##
-- ###################################################################################################

-- ####################
-- ## Slash Commands ##
-- ####################

--	L["/dcstats"] = ""
	L["DejaCharacterStats Slash commands (/dcstats):"] = "DejaCharacterStats Slash Befehle (/dcstats):"
	L["  /dcstats config: Open the DejaCharacterStats addon config menu."] = "  /dcstats config: Öffnet das DejaCharacterStats Konfigurationsfenster." --configuration
	L["  /dcstats reset:  Resets DejaCharacterStats frames to default positions."] = "  /dcstats reset: Setzt DejaCharacterStats zurück."
	L["Resetting config to defaults"] = "Einstellungen zurücksetzen." --configuration
	L["DejaCharacterStats is currently using "] = "DejaCharacterStats benutzt zur Zeit "
	L[" kbytes of memory"] = " kbytes Arbeitsspeicher" --kilobytes
--	L["DejaCharacterStats is currently using "] = ""
--	L[" kbytes of memory after garbage collection"] = "" --kilobytes
--	L["config"] = "" --configuration
--	L["dumpconfig"] = "" --configuration
--	L["With defaults"] = ""
--	L["Direct table"] = ""
--	L["reset"] = ""
--	L["perf"] = "" --performance
	L["Reset to Default"] = "Standardeinstellungen"

-- ################################
-- ## Global Options Left Column ##
-- ################################

	L["Equipped/Available"] = "Ausgerüstet/Verfügbar"
	L['Displays Equipped/Available item levels unless equal.'] = "Zeigt das Itemlevel von Ausgerüstet/Verfügbar an bis diese gleich sind."

	L["Decimals"] = "Nachkommastellen"
	L['Displays "Enhancements" category stats to two decimal places.'] = 'Zeigt "Verstärkungen" Kategorie Statistiken auf zwei Dezimalstellen.'

	L["Ilvl Decimals"] = "Ilvl Nachkommastellen"
	L['Displays average item level to two decimal places.'] = "Zeigt das durchschnittliche Itemlevel mit zwei Dezimalstellen"

	L['Durability '] = "Haltbarkeit "
	L['Displays the average Durability percentage for equipped items in the stat frame.'] = "Zeigt die durchschnittlich Haltbarkeit in Prozent für die augerüsteten Gegenstände im Werteframe an."

	L['Repair Total '] = "Reparatur Gesamt"
	L['Displays the Repair Total before discounts for equipped items in the stat frame.'] = "Zeigt die gesamten Reparaturkosten ohne Bonus für die ausgerüsteten Gegenstände im Werteframe an."

-- ################################

	L["Durability Bars"] = "Haltbarkeitsleisten"
	L["Displays a durability bar next to each item." ] = "Zeigt neben jedem Gegenstand eine Haltbarkeitsleiste an."

	L["Average Durability"] = "Durchschnittliche Haltbarkeit"
	L["Displays average item durability on the character shirt slot and durability frames."] = "Zeigt die durchschnittliche Haltbarkeit im Hemdslot und Haltbarkeitsframe."

	L["Item Durability"] = "Gegenstandshaltbarkeit"
	L["Displays each equipped item's durability."] = "Zeigt die Haltbarkeit von jedem ausgerüsteten Gegenstand an."

	L["Item Repair Cost"] = "Gegenstandsreparaturkosten"
	L["Displays each equipped item's repair cost."] = "Zeigt die Reparaturkosten von jedem ausgerüsteten Gegenstand an."

-- ################################

	L["Expand"] = "Erweitern"
	L['Displays the Expand button for the character stats frame.'] = "Zeigt die Schaltfläche Erweitern für die Charakterwerte Rahmen." --## Needs review.
	L['Show Character Stats'] = "Zeigt die Charakterwerte"
	L['Hide Character Stats'] = "Versteckt die Charakterwerte"

	L["Scrollbar"] = "Scrollleiste"
	L['Displays the DCS scrollbar.'] = "Zeigt die DCS scrollleiste."

-- ################################
-- ## Character Options Right Column ##
-- ################################

	L["Show All Stats"] = "Zeige alle Werte"
	L['Checked displays all stats. Unchecked displays relevant stats. Use Shift-scroll to snap to the top or bottom.'] = "Wenn ausgewählt werden alle Werte gezeigt. Ansonsten nur die relevanten. Benutze Shift und Skrollen um direkt an den Anfang oder ans Ende zu springen."

--	L["Select-A-Stat™"]  = "Select-A-Stat™ Checkbox Name" -- Try to use something snappy and silly like a Fallout or 1950's appliance feature.
	L['Select which stats to display. Use Shift-scroll to snap to the top or bottom.'] = "Wähle die anzuzeigenden Werte aus. Benutze Shift und Skrollen um direkt an den Anfang oder ans Ende zu springen."

-- ################################
-- ## Stats ##
-- ################################

	L["Durability"] = "Haltbarkeit" -- Be sure to include the colon ":" or it will conflict wih the options checkbox.
	L["Durability %s"] = "Haltbarkeit %s" -- ## --> %s MUST be included <-- ## 
	L["Average equipped item durability percentage."] = "Prozentuale Haltbarkeit der angelegten Gegenstände."

	L["Repair Total"] = "Reparatur Gesamt" -- Be sure to include the colon ":" or it will conflict wih the options checkbox.
	L["Repair Total %s"] = "Reparatur Gesamt %s" -- ## --> %s MUST be included <-- ## 
	L["Total equipped item repair cost before discounts."] = "Insgesamt angelegter Gegenstand Reparaturkosten vor Rabatten." -- ## Needs review

-- ## Attributes ##

	L["Health"] = "Gesundheit"
	L["Power"] = "Energiequelle"
	L["Druid Mana"] = "Druide Mana"
	L["Armor"] = "Rüstung"
	L["Strength"] = "Stärke"
	L["Agility"] = "Beweglichkeit"
	L["Intellect"] = "Intelligenz"
	L["Stamina"] = "Ausdauer"
	L["Damage"] = "Schaden"
	L["Attack Power"] = "Angriffskraft"
	L["Attack Speed"] = "Angriffstempo"
	L["Spell Power"] = "Zaubermacht"
	L["Mana Regen"] = "Manaregeneration"
	L["Energy Regen"] = "Energieregeneration"
	L["Rune Regen"] = "Runentempo"
	L["Focus Regen"] = "Fokusregeneration"
	L["Movement Speed"] = "Lauftempo"
	L["Bewegungsgeschwindigkeit"] = "Lauftempo"
	L["Durability"] = "Haltbarkeit"
	L["Repair Total"] = "Reparatur Gesamt"

-- ## Enhancements ##

	L["Critical Strike"] = "Kritische Treffer"
	L["Haste"] = "Tempo"
	L["Versatility"] = "Vielseitigkeit"
	L["Mastery"] = "Meisterschaft"
	L["Leech"] = "Lebensraub"
	L["Avoidance"] = "Vermeidung"
	L["Dodge"] = "Ausweichen"
	L["Parry"] = "Parieren"
	L["Block"] = "Blocken"

return end