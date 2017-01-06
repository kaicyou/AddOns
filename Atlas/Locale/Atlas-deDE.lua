-- $Id: Atlas-deDE.lua 126 2016-12-27 17:45:39Z arith $
--[[

	Atlas, a World of Warcraft instance map browser
	Copyright 2005 ~ 2010 - Dan Gilbert <dan.b.gilbert@gmail.com>
	Copyright 2010 - Lothaer <lothayer@gmail.com>, Atlas Team
	Copyright 2011 ~ 2017 - Arith Hsu, Atlas Team <atlas.addon at gmail dot com>

	This file is part of Atlas.

	Atlas is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	Atlas is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with Atlas; if not, write to the Free Software
	Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

--]]

local AceLocale = LibStub:GetLibrary("AceLocale-3.0");
local L = AceLocale:NewLocale("Atlas", "deDE", false);
-- Localize file must set above to false

-- Deutsche Lokalisierung (German, deDE)
-- Letztes Update: 29.10.2014

if ( GetLocale() == "deDE" ) then
-- Define the leading strings to be ignored while sorting
-- Ex: The Stockade
AtlasSortIgnore = {
	"der (.+)",
	"die (.+)",
	"das (.+)"
}

-- Syntax: ["real_zone_name"] = "localized map zone name"
AtlasZoneSubstitutions = {
	["Ahn'Qiraj"] = "Tempel von Ahn'Qiraj";
	["Der Tempel von Atal'Hakkar"] = "Versunkener Tempel";
--	["Throne of Tides"] = "The Abyssal Maw: Throne of the Tides";
};
end


if L then
L["Adult"] = "Erwachsen"
L["AKA"] = "alias"
L["Alexston Chrome <Tavern of Time>"] = "Alexston Chrom <Taverne der Zeit>"
L["Alurmi <Keepers of Time Quartermaster>"] = "Alurmi <Rüstmeisterin der Hüter der Zeit>"
L["Anachronos <Keepers of Time>"] = "Anachronos <Hüter der Zeit>"
L["Andormu <Keepers of Time>"] = "Andormu <Hüter der Zeit>"
L["Arazmodu <The Scale of Sands>"] = "Arazmodu <Die Wächter der Sande>"
L["Arcane Container"] = "Arkaner Behälter"
L["Arms Warrior"] = "Waffenkrieger"
L["ATLAS_BUTTON_CLOSE"] = "Schließen"
L["ATLAS_CLICK_TO_OPEN"] = "Klicken, um das Atlas-Kartenfenster zu öffnen."
L["ATLAS_COLLAPSE_BUTTON"] = "Klicken, um Atlas' Legende zu schließen."
L["ATLAS_DDL_CONTINENT"] = "Kontinent"
L["ATLAS_DDL_CONTINENT_BROKENISLES"] = "Instanzen der Verheerten Inseln"
L["ATLAS_DDL_CONTINENT_DEEPHOLM"] = "Instanzen in Tiefenheim"
L["ATLAS_DDL_CONTINENT_DRAENOR"] = "Instanzen in Draenor"
L["ATLAS_DDL_CONTINENT_EASTERN"] = "Instanzen der Östlichen Königreiche"
L["ATLAS_DDL_CONTINENT_KALIMDOR"] = "Instanzen in Kalimdor"
L["ATLAS_DDL_CONTINENT_NORTHREND"] = "Instanzen in Nordend"
L["ATLAS_DDL_CONTINENT_OUTLAND"] = "Instanzen der Scherbenwelt"
L["ATLAS_DDL_CONTINENT_PANDARIA"] = "Instanzen in Pandaria"
L["ATLAS_DDL_EXPANSION"] = "Erweiterung"
L["ATLAS_DDL_EXPANSION_BC"] = "Instanzen aus Burning Crusade"
L["ATLAS_DDL_EXPANSION_CATA"] = "Instanzen aus Cataclysm "
L["ATLAS_DDL_EXPANSION_LEGION"] = "Instanzen aus Legion"
L["ATLAS_DDL_EXPANSION_MOP"] = "Instanzen aus Mists of Pandaria"
L["ATLAS_DDL_EXPANSION_OLD_AO"] = "Instanzen der alten Welt 1/2"
L["ATLAS_DDL_EXPANSION_OLD_PZ"] = "Instanzen der alten Welt 2/2"
L["ATLAS_DDL_EXPANSION_WOD"] = "Instanzen aus Warlords of Draenor"
L["ATLAS_DDL_EXPANSION_WOTLK"] = "Instanzen aus Wrath of the Lich King"
L["ATLAS_DDL_LEVEL"] = "Stufe"
L["ATLAS_DDL_LEVEL_100PLUS"] = "Instanzen Stufe 100+"
L["ATLAS_DDL_LEVEL_100TO110"] = "Instanzen Stufe 100–110"
L["ATLAS_DDL_LEVEL_110PLUS"] = "Instanzen Stufe 110+"
L["ATLAS_DDL_LEVEL_45TO60"] = "Instanzen Stufe 45–60"
L["ATLAS_DDL_LEVEL_60TO70"] = "Instanzen Stufe 60–70"
L["ATLAS_DDL_LEVEL_70TO80"] = "Instanzen Stufe 70–80"
L["ATLAS_DDL_LEVEL_80TO85"] = "Instanzen Stufe 80–85"
L["ATLAS_DDL_LEVEL_85TO90"] = "Instanzen Stufe 85–90"
L["ATLAS_DDL_LEVEL_90TO100"] = "Instanzen Stufe 90–100"
L["ATLAS_DDL_LEVEL_UNDER45"] = "Instanzen unter Stufe 45"
L["ATLAS_DDL_PARTYSIZE"] = "Gruppengröße"
L["ATLAS_DDL_PARTYSIZE_10_AN"] = "Instanzen für 10 Spieler 1/2"
L["ATLAS_DDL_PARTYSIZE_10_OZ"] = "Instanzen für 10 Spieler 2/2"
L["ATLAS_DDL_PARTYSIZE_20TO40AH"] = "Instanzen für 20–40 Spieler 1/2"
L["ATLAS_DDL_PARTYSIZE_20TO40IZ"] = "Instanzen für 20–40 Spieler 2/2"
L["ATLAS_DDL_PARTYSIZE_5_AE"] = "Instanzen für 5 Spieler 1/3"
L["ATLAS_DDL_PARTYSIZE_5_FS"] = "Instanzen für 5 Spieler 2/3"
L["ATLAS_DDL_PARTYSIZE_5_TZ"] = "Instanzen für 5 Spieler 3/3"
L["ATLAS_DDL_TYPE"] = "Typ"
L["ATLAS_DDL_TYPE_ENTRANCE"] = "Eingänge"
L["ATLAS_DDL_TYPE_INSTANCE_AB"] = "Instanzen 1/5"
L["ATLAS_DDL_TYPE_INSTANCE_CF"] = "Instanzen 2/5"
L["ATLAS_DDL_TYPE_INSTANCE_GM"] = "Instanzen 3/5"
L["ATLAS_DDL_TYPE_INSTANCE_NS"] = "Instanzen 4/5"
L["ATLAS_DDL_TYPE_INSTANCE_TZ"] = "Instanzen 5/5"
L["ATLAS_DEP_MSG1"] = "Atlas hat veraltete Module entdeckt."
L["ATLAS_DEP_MSG2"] = "Daher wurden diese Module deaktiviert."
L["ATLAS_DEP_MSG3"] = "Entfernen Sie diese aus Ihrem Verzeichnis AddOns."
L["ATLAS_DEP_OK"] = "OK"
L["ATLAS_ENTRANCE_BUTTON"] = "Eingang"
L["ATLAS_EXPAND_BUTTON"] = "Klicken, um Atlas' Legende zu öffnen."
L["ATLAS_INFO"] = "Atlas Information"
L["ATLAS_INFO_12200"] = [=[Wichtiger Hinweis:

Da die Addondatei stets größer wird, wurde ein Teil 
der Instanzkarten in getrennte Module verschoben.

Beim Download des Addons von den bekannten Webseiten 
erhält man daher nun lediglich das Haupt-Addon mit den Kernfunktionen 
und den Instanzkarten von Cataclysm.

Wer alle alten Instanzkarten und alle Atlas Plugins benötigt, 
muss diese seperat herunterladen.

Mehr Infos dazu gibt es im Forum:
http://www.atlasmod.com/phpBB3/viewtopic.php?t=1522]=]
L["ATLAS_INFO_12201"] = [=[Bitte beachten Sie, dass ein neues Plugin |cff6666ffAtlas Scenarios|cffffffff mit den Karten der neuen Szenarien erstellt wurde. 

Besuchen Sie für weitere Details unsere Webseite und vergessen Sie nicht,
das Plugin separat zu installieren.
|cff6666ffhttp://www.atlasmod.com/|cffffffff]=]
L["ATLAS_INSTANCE_BUTTON"] = "Instanz"
L["ATLAS_LDB_HINT"] = [=[Linke Maustaste drücken, um Atlas zu öffnen.
Rechte Maustaste drücken, um die Atlas-Optionen anzuzeigen.]=]
L["ATLAS_MINIMAPLDB_HINT"] = [=[Linke Maustaste drücken, um Atlas zu öffnen.
Rechte Maustaste drücken, um die Atlas-Optionen anzuzeigen.
Linke Maustaste gedrückt halten, um diesen Schalter zu verschieben.]=]
L["ATLAS_MISSING_MODULE"] = [=[Atlas hat fehlende Module/Plugins erkannt.

Es könnte sein, dass du veraltete Module/Plugins verwendest, die von Atlas deaktiviert wurden.
Wenn du jetzt alle aktualisiert hast, öffne deine Addonliste, um nachzusehen, ob alle aktiviert wurden.

Wenn du dir sicher bist, dass du diese "fehlenden" Module/Plugins nicht benötigst und du daher diese Meldung nicht sehen willst, kannst du die Meldung im Optionsmenü deaktivieren.

Liste fehlender Module/Plugins:]=]
L["ATLAS_OPEN_ADDON_LIST"] = "Addon-Liste öffnen"
L["ATLAS_OPEN_ADVENTURE"] = "Klicken, um den Abenteuerführer zu öffnen."
L["ATLAS_OPEN_WOWMAP_WINDOW"] = "Klicken, um die Karte des Abenteuerführers zu öffnen."
L["ATLAS_OPTIONS_ACRONYMS"] = "Abkürzungen anzeigen"
L["ATLAS_OPTIONS_ACRONYMS_TIP"] = "Zeigt die Instanz-Abkürzungen in den Kartendetails an."
L["ATLAS_OPTIONS_AUTOSEL"] = "Automatische Kartenauswahl"
L["ATLAS_OPTIONS_AUTOSEL_TIP"] = "Instanzkarte automatisch auswählen. Atlas wählt je nach aktueller Position die beste Instanzkarte aus."
L["ATLAS_OPTIONS_BOSS_DESC"] = "Bossbeschreibungen anzeigen, wenn verfügbar"
L["ATLAS_OPTIONS_BOSS_DESC_SCALE"] = "Skalierung der Bossbeschreibungen auf der Karte"
L["ATLAS_OPTIONS_BOSS_DESC_TIP"] = "Beim Überfahren der Bossnummer mit dem Mauszeiger wird, wenn verfügbar, eine Bossbeschreibung angezeigt."
L["ATLAS_OPTIONS_BUTPOS"] = "Schalterposition"
L["ATLAS_OPTIONS_BUTRAD"] = "Schalterradius"
L["ATLAS_OPTIONS_BUTTON"] = "Optionen"
L["ATLAS_OPTIONS_CATDD"] = "Sortierung der Karten nach:"
L["ATLAS_OPTIONS_CHECKMODULE"] = "Über fehlende Module/Plugins benachrichtigen."
L["ATLAS_OPTIONS_CHECKMODULE_TIP"] = "Aktivieren Sie diese Option, um nach dem Starten von WoW zu prüfen, ob Module/Plugins fehlen."
L["ATLAS_OPTIONS_CLAMPED"] = "Fenster im Bildschirm festhalten"
L["ATLAS_OPTIONS_CLAMPED_TIP"] = "Atlasfenster im Bildschirm festhalten. Deaktivieren, um das Atlasfenster über den Spielfensterrand hinaus bewegen zu können."
L["ATLAS_OPTIONS_COLORINGDROPDOWN"] = "Instanzlisten in Stufenfarben anzeigen"
L["ATLAS_OPTIONS_COLORINGDROPDOWN_TIP"] = "Zeigt die Instanzlisten je nach minimaler Stufe und Spielerstufe mit unterschiedlichen Farben zur Indikation des Schwierigkeitsgrades an. "
L["ATLAS_OPTIONS_CTRL"] = "Steuerung drücken, um Tooltips anzuzeigen"
L["ATLAS_OPTIONS_CTRL_TIP"] = "Aktivieren, um die Kartendetails beim Drücken der Strg-Taste und Überfahren eines Eintrages anzuzeigen. Nützlich, falls der dargestellte Text länger als das Fenster groß ist."
L["ATLAS_OPTIONS_DONTSHOWAGAIN"] = "Diese Information nicht erneut anzeigen."
L["ATLAS_OPTIONS_LOCK"] = "Atlasfenster fixieren"
L["ATLAS_OPTIONS_LOCK_TIP"] = "Atlasfenster fixieren/freigeben."
L["ATLAS_OPTIONS_RCLICK"] = "Rechte Maustaste für Weltkarte drücken"
L["ATLAS_OPTIONS_RCLICK_TIP"] = "Aktiviert das Rechtsklicken im Atlasfenster, um die WoW-Weltkarte anzuzeigen."
L["ATLAS_OPTIONS_RESETPOS"] = "Position zurücksetzen"
L["ATLAS_OPTIONS_SCALE"] = "Skalierung des Atlas-Fensters"
L["ATLAS_OPTIONS_SHOWBUT"] = "Minikartenschalter anzeigen"
L["ATLAS_OPTIONS_SHOWBUT_TIP"] = "Atlas' Schalter an der Minikarte anzeigen."
L["ATLAS_OPTIONS_TRANS"] = "Transparenz"
L["ATLAS_SEARCH_UNAVAIL"] = "Suche nicht verfügbar"
L["ATLAS_SLASH"] = "/atlas"
L["ATLAS_SLASH_OPTIONS"] = "Optionen"
L["ATLAS_STRING_CLEAR"] = "Leeren"
L["ATLAS_STRING_LEVELRANGE"] = "Stufe"
L["ATLAS_STRING_LOCATION"] = "Standort"
L["ATLAS_STRING_MINGEARLEVEL"] = "Minimale Ausrüstungsstufe"
L["ATLAS_STRING_MINLEVEL"] = "Minimale Stufe"
L["ATLAS_STRING_PLAYERLIMIT"] = "Max. Spielerzahl"
L["ATLAS_STRING_RECLEVELRANGE"] = "Empf. Stufe"
L["ATLAS_STRING_SEARCH"] = "Suchen"
L["ATLAS_STRING_SELECT_CAT"] = "Kategorie wählen"
L["ATLAS_STRING_SELECT_MAP"] = "Karte wählen"
L["ATLAS_TITLE"] = "Atlas"
L["ATLAS_TOGGLE_LOOT"] = "Rechtsklick, um die Beute ein-/auszublenden."
L["Attunement Required"] = "Zugangsquest erforderlich"
L["Back"] = "Hinten"
L["Basement"] = "Keller"
L["BINDING_HEADER_ATLAS_TITLE"] = "Atlas Tastaturbelegungen"
L["BINDING_NAME_ATLAS_AUTOSEL"] = "Automatische Auswahl"
L["BINDING_NAME_ATLAS_OPTIONS"] = "Optionen an/aus"
L["BINDING_NAME_ATLAS_TOGGLE"] = "Atlas an/aus"
L["Blacksmithing Plans"] = "Schmiedekunstpläne"
L["Bodley"] = "Bodley"
L["Bortega <Reagents & Poison Supplies>"] = "Bortega <Reagenzien & Gifte>"
L["Brewfest"] = "Braufest"
L["Child"] = "Kind"
L["Colon"] = ": "
L["Comma"] = ", "
L["Connection"] = "Verbindung"
L["East"] = "Osten"
L["Elevator"] = "Aufzug"
L["End"] = "Ende"
L["Engineer"] = "Ingenieur"
L["Entrance"] = "Eingang"
L["Event"] = "Ereignis"
L["Exalted"] = "Ehrfürchtig"
L["Exit"] = "Ausgang"
L["Fourth Stop"] = "Vierter Halt"
L["Front"] = "Vorne"
L["Galgrom <Provisioner>"] = "Galgrom <Versorger>"
L["Ghost"] = "Geist"
L["Graveyard"] = "Friedhof"
L["Hallow's End"] = "Schlotternächte"
L["Heroic"] = "Heroisch"
L["Heroic_Symbol"] = "(H)"
L["Holy Paladin"] = "Heiligpaladin"
L["Holy Priest"] = "Heiligpriesterin"
L["Hyphen"] = " - "
L["Imp"] = "Wichtel"
L["Key"] = "Schlüssel"
L["L-DQuote"] = "\""
L["Lothos Riftwaker"] = "Lothos Felsspalter"
L["Love is in the Air"] = "Liebe liegt in der Luft"
L["Lower"] = "Unten"
L["L-Parenthesis"] = " ("
L["L-SBracket"] = "["
L["Lunar Festival"] = "Mondfest"
L["MapA"] = " [A]"
L["MapB"] = " [B]"
L["MapC"] = " [C]"
L["MapD"] = " [D]"
L["MapE"] = " [E]"
L["MapF"] = " [F]"
L["MapG"] = " [G]"
L["MapH"] = " [H]"
L["MapI"] = " [I]"
L["MapJ"] = " [J]"
L["MapsNotFound"] = [=[Für die gewählte Instanz wurde 
keine anzuzeigende Karte gefunden. 

Bitte stellen Sie sicher, dass die erforderlichen 
Atlas-Kartenmodule installiert sind.]=]
L["Meeting Stone"] = "Versammlungsstein"
L["Middle"] = "Mitte"
L["Midsummer Festival"] = "Sonnenwendfest"
L["Moonwell"] = "Mondbrunnen"
L["Mythic"] = "Mythisch"
L["Mythic_Symbol"] = "(M)"
L["North"] = "Norden"
L["Nozari <Keepers of Time>"] = "Nozari <Hüter der Zeit>"
L["Optional"] = "Optional"
L["Orange"] = "Orange"
L["Orb of Command"] = "Befehlskugel"
L["Outside"] = "Außerhalb"
L["Period"] = ". "
L["Portal"] = "Portal"
L["PossibleMissingModule"] = "Diese Karte ist sehr wahrscheinlich in folgendem Modul enthalten: "
L["Protection Warrior"] = "Schutzkrieger"
L["Purple"] = "Lila"
L["Random"] = "Zufällig"
L["Rare"] = "Selten"
L["R-DQuote"] = "\""
L["Repair"] = "Reparieren"
L["Retribution Paladin"] = "Vergeltungspaladin"
L["Rewards"] = "Belohnungen"
L["R-Parenthesis"] = ") "
L["R-SBracket"] = "]"
L["Scarshield Quartermaster <Scarshield Legion>"] = "Rüstmeister der Schmetterschilde <Schmetterschildlegion>"
L["Second Stop"] = "Zweiter Halt"
L["Semicolon"] = "; "
L["Shadow Priest"] = "Schattenpriesterin"
L["Slash"] = " / "
L["Soridormi <The Scale of Sands>"] = "Soridormi <Die Wächter der Sande>"
L["South"] = "Süden"
L["Spawn Point"] = "Spawnpunkt"
L["Start"] = "Anfang"
L["Steward of Time <Keepers of Time>"] = "Ordner der Zeit <Hüter der Zeit>"
L["Summon"] = "Beschwörbar"
L["Teleporter"] = "Teleporter"
L["Teleporter destination"] = "Teleportziel"
L["The Behemoth"] = "Das Ungetüm"
L["Third Stop"] = "Dritter Halt"
L["Top"] = "Spitze"
L["Transport"] = "Verkehr"
L["Tunnel"] = "Tunnel"
L["Underwater"] = "Unter Wasser"
L["Upper"] = "Oben"
L["Varies"] = "Variiert"
L["Wanders"] = "Wandert"
L["Wave 10"] = "Welle 10"
L["Wave 12"] = "Welle 12"
L["Wave 18"] = "Welle 18"
L["Wave 5"] = "Welle 5"
L["Wave 6"] = "Welle 6"
L["West"] = "Westen"
L["Yarley <Armorer>"] = "Yarley <Rüstungsschmied>"
L["Zaladormu"] = "Zaladormu"

end
