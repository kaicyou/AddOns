﻿if GetLocale() == "deDE" then


function pscrmlocale()

	pscmraddsign1 = "linker mob"
	pscmraddsign2 = "rechter mob"
	pscmraddsign3 = "unterer mob"
	pscmralakirloc1 = "GESAMTER SCHADEN"
	pscmralakirloc2 = "NUR <20% HP"
	pscmralakirloc3 = "Todesstoß"
	pscmralakirloc4 = "buff auf boss: war nicht vorhanden"
	pscmralakirloc5 = "buff überschrieben"
	pscmralakirloc6 = "buff VERLOREN"
	pscmralakirloc7 = "getötet"
	pscmrbuffsnames1 = "5% werte"
	pscmrbuffsnames2 = "Segen der Macht"
	pscmrbuffsnames3 = "Intelligenz"
	pscmrbuffsnames4 = "Ausdauer"
	pscmrbuffsnames5 = "Schattenschutz"
	pscmrbuffsnames6 = "Magie fokussieren"
	pscmrbuffsnames7 = "Finstere Absichten"
	pscmrcantmove = ">> ICH kann mich NICHT bewegen! <<"
	pscmrchogaldopmod1 = "Dispells von Buffs (fail)"
	pscmrchogaldopmod21 = "dispelled"
	pscmrchogaldopmod22 = "dispelled"
	pscmrchogaldopmod23 = "dispelled"
	pscmrconclavloc1 = "down in"
	pscmrdmgtoplayers = "Schaden an Spielern"
	pscmreventsincomb1 = "Arkanotron"
	pscmreventsincomb2 = "Casts info"
	pscmrfailtxt11511 = "gestorben durch"
	pscmrfailtxt11511fem = "starb durch"
	pscmrlastmoduleloadtxt = "Cataclysm mini Raids"
	pscmrldfail261 = "|s4id80086|id Explosion, wurde ausgelöst von:"
	pscmrldfail261fem = "|s4id80086|id Explosion, wurde ausgelöst von:"
	pscmrldfail262 = "|s4id80086|id Explosionen, wurden ausgelöst von:"
	pscmrmanualbossloc1 = "Omnotron-Verteidigungssystem"
	pscmrmanualbossloc2 = "Valiona & Theralion"
	pscmrmanualbossloc3 = "Elementiumungeheuer"
	pscmrmanualbossloc4 = "Konklave des Windes"
	pscmrnefdom1 = "Ohne info warum es entfernt wurde"
	pscmrnefdom2 = "ÜBERNOMMEN!"
	pscmrnefdom3 = "Gestorben %s nachdem Gedankenkontrolle entfernt wurde"
	pscmrnefdom4 = "in Gedankenkontrolle"
	pscmrnefdom5 = "fähigkeit 'clicked in'"
	pscmrnocastslow = "KEIN Verlangsamungs debuff"
	pscmronlylastp = "nur LETZTE Phase"
	pscmrshield = "Schild"
	pscmrshielddown = "ZERSTÖRT"
	pscmrshielddown2 = "hp übrig"
	pscmrsinestraadd1 = "Dispel"
	pscmrsinestraadd2 = "First"
	pscmrsinestraadd3 = "Starb in"
	pscmrsinestraadd4 = "Zauber wurde nicht unterbrochen!"
	pscmrsinestraadd5 = "Letzter tick schaden"
	pscmrsinestraadd6 = "|sid90045|id! Info über unterbrechungen/Stuns usw. für die letzten 3 sek."
	pscmrsinestraadd7 = "|sid90045|id! Keine info gefunden"
	pscmrsinestraadd8 = "Debuff endet in"
	pscmrsoundgot = "Bekam'en Geräusch"
	pscmrtxtopt111 = "|tip2 Schaden von |sid89000|id"
	pscmrtxtopt121 = "|tip2 schaden von |sid96884|id (nicht die ersten 2 sek)"
	pscmrtxtopt211 = "|tip2 Schaden von |sid77971|id"
	pscmrtxtopt212 = "|tip2 Wer |sid78941|id bekam"
	pscmrtxtopt213 = "|tip2 Schaden von |sid92154|id"
	pscmrtxtopt214 = "|tip2 Schaden von |sid92134|id"
	pscmrtxtopt215 = "|tip2 Schaden von |sid88287|id"
	pscmrtxtopt221 = "|tip1 info über Schaden von |sid79504|id"
	pscmrtxtopt2210 = "|tip2 Schaden auf Toxitrons Schild mit der Wirkung |sid80011|id"
	pscmrtxtopt2211 = "|tip2 Schaden auf Arkanotrons Schild mit der Wirkung |sid79735|id"
	pscmrtxtopt2212 = "|tip1 Schaden auf Elektrons Schild mit der Wirkung |sid79912|id"
	pscmrtxtopt2213 = "|tip1 wer veränderungen an Toxitrons Schild verursachte |sid80011|id"
	pscmrtxtopt2214 = "|tip1 Schaden auf Arcanotrons Schild mit der Wirkung |sid79735|id"
	pscmrtxtopt2215 = "|tip3 speichere Infos über Schaden auf Schilde (im DMG/Wechsel info Modul)"
	pscmrtxtopt2217 = "|cff00ff00Boss_shieldsmonitor|r - Zeige durch Magmatrons Schild absorbierte HP, wenn das Addon installiert ist"
	pscmrtxtopt222 = "|tip1 wer explodierte |sid80086|id"
	pscmrtxtopt223 = "|tip1 wenn die Explosion von |sid80086|id einen Spieler tötet - Zeige wer diese verursacht hat"
	pscmrtxtopt224 = "|tip1 wenn |sid79582|id von Magmatron durchbrochen wurde - Zeige Schaden"
	pscmrtxtopt225 = "|tip2 |sid79888|id - wer Eigenbeschuss verursachte"
	pscmrtxtopt226 = "|tip2 |sid79888|id - wer Eigenbeschuss erhielt"
	pscmrtxtopt227 = "|tip2 übermäßiger Schaden von |sid79504|id (gesamt)"
	pscmrtxtopt228 = "|tip2 wer |sid80086|id auslößte"
	pscmrtxtopt229 = "|tip2 Schaden auf Elektrons Schild mit der Wirkung |sid79912|id"
	pscmrtxtopt231 = "|tip2 alle Informationen über |sid77912|id"
	pscmrtxtopt233 = "|tip2 Schaden von |sid78208|id"
	pscmrtxtopt234 = "|tip4 Zähle |sid77912|id nur in der letzten Phase"
	pscmrtxtopt235 = "|tip2 max ticks von |sid92930|id"
	pscmrtxtopt241 = "|tip2 max Geräusch für diesen Kampf"
	pscmrtxtopt242 = "|tip2 Wer |sid77675|id bekam (Boden Phase)"
	pscmrtxtopt243 = "|tip2 Wer |sid92553|id bekam (Luft Phase)"
	pscmrtxtopt244 = "|tip1 info über Schaden durch |sid78100|id"
	pscmrtxtopt245 = "|tip2 Schaden von |sid78100|id"
	pscmrtxtopt252 = "|tip4 Markiere Spielen mit |sid82935|id debuff (Stern, Kreis, usw. in Reihenfolge)"
	pscmrtxtopt261 = "|tip2 wer Schaden von |sid77943|id bekam"
	pscmrtxtopt262 = "|tip2 max Stack vom |sid81114|id debuff"
	pscmrtxtopt264 = "|tip1 |sid79339|id im Raid durch"
	pscmrtxtopt265 = "|tip2 gesamte |sid79339|id im Raid"
	pscmrtxtopt266 = "|tip2 gesamte Zeit von |sid79318|id"
	pscmrtxtopt311 = "|tip2 Schaden von |sid83734|id (Zählt erst nach |sid83601|id)"
	pscmrtxtopt321 = "|tip1 Nicht aufgeteilter schaden von |sid86788|id, wenn der Zauber einen Tod verursacht hat"
	pscmrtxtopt322 = "|tip1 eintrit in die Schattenwelt"
	pscmrtxtopt323 = "|tip2 Schaden vom Bossatem"
	pscmrtxtopt324 = "|tip2 eintrit in die Schattenwelt"
	pscmrtxtopt325 = "|tip2 Schaden von |sid86505|id"
	pscmrtxtopt326 = "|cff00ff00Boss_shieldsmonitor|r - zeige durch |sid86788|id absorbierte HP, wenn das Addon installiert ist"
	pscmrtxtopt331 = "|tip1 wenn |sid83282|id den Tod eines Spielers verursacht ohne |sid83099|id - zeige wer es hatte"
	pscmrtxtopt3310 = "|tip1 Explosionen durch Gefrorene Kugel"
	pscmrtxtopt3311 = "|tip2 Explosionen durch Gefrorene Kugel"
	pscmrtxtopt3312 = "|tip1 berichte schaden info auf das |sid82631|id Schild"
	pscmrtxtopt3313 = "|tip1 berichte schaden info auf das |sid83718|id Schild"
	pscmrtxtopt3314 = "|tip2 fail bei |sid82772|id (bekam mindestens einen tick)"
	pscmrtxtopt3315 = "|tip2 Schaden von |sid84912|id"
	pscmrtxtopt332 = "|tip2 wer Schaden bekam von |sid88558|id"
	pscmrtxtopt333 = "|tip2 erhielt mehr als 30K Schaden von |sid83067|id"
	pscmrtxtopt334 = "|tip2 erhielt mehr als 30K Schaden von |sid83565|id"
	pscmrtxtopt335 = "|tip3 speichere Schaden und andere infos über |sid82631|id (im DMG/Wechsel info Modul)"
	pscmrtxtopt336 = "|tip3 speichere Schaden und andere infos über |sid83718|id (im DMG/Wechsel info Modul)"
	pscmrtxtopt337 = "|cff00ff00Boss_shieldsmonitor|r - zeige durch |sid82631|id absorbierte HP, wenn das Addon installiert ist"
	pscmrtxtopt338 = "|cff00ff00Boss_shieldsmonitor|r - zeige durch |sid83718|id absorbierte HP, wenn das Addon installiert ist"
	pscmrtxtopt341 = "|tip2 Schaden von |sid81689|id"
	pscmrtxtopt342 = "|tip2 max Stack von |sid81701|id bevor die letzte Phase begann"
	pscmrtxtopt344 = "|tip1 info über entfernte Buffs (5% Werte, SDM, Intelligenz, Ausdauer, Schattenschutz, usw.)"
	pscmrtxtopt345 = "|tip2 gesammte info über entfernte Buffs (5% Werte, SDM, Intelligenz, Ausdauer, Schattenschutz, usw.)"
	pscmrtxtopt346 = "|tip2 wer entzauberte/unterbrach/stunte usw. |sid91317|id"
	pscmrtxtopt347 = "|tip2 unnötiger Schaden auf Boss' Elementare MIT dots (heroic)"
	pscmrtxtopt348 = "|tip2 unnötiger Schaden auf Boss' Elementare KEINE dots (heroic)"
	pscmrtxtopt351 = "|tip2 Schaden von |sid92852|id"
	pscmrtxtopt352 = "|tip2 Schaden von |sid92958|id"
	pscmrtxtopt353 = "|tip2 Schaden von |sid86226|id"
	pscmrtxtopt354 = "|tip2 Schaden von |sid90083|id"
	pscmrtxtopt355 = "|tip1 Berichte als Raidwarnung wer den ersten debuff von |sid89421|id bekommt"
	pscmrtxtopt356 = "|tip1 Berichte info über unterbrechungen/stuns usw, wenn |sid90045|id gezaubert wurde"
	pscmrtxtopt411 = "|tip2 Boss erhielt Heilung durch |sid86206|id"
	pscmrtxtopt4110 = "|tip1 berichte schadens info von |sid93059|id"
	pscmrtxtopt412 = "|tip2 fails bei |sid85480|id"
	pscmrtxtopt413 = "|tip2 fails bei |sid86133|id"
	pscmrtxtopt414 = "|tip2 Fallschaden auf der Luft Platform (wenn mehr als 40K Schaden)"
	pscmrtxtopt415 = "|tip2 wer stand in |sid86111|id (ohne die ersten beiden ticks)"
	pscmrtxtopt416 = "|tip2 max stack vom |sid84645|id debuff"
	pscmrtxtopt417 = "|tip3 speichere Schaden und andere infos über |sid93059|id (im DMG/Wechsel info Modul)"
	pscmrtxtopt418 = "|tip2 Automatischer Chatbericht vom Schaden auf das |sid93059|id"
	pscmrtxtopt419 = "|cff00ff00Boss_shieldsmonitor|r - Zeige durch |sid93059|id absorbierte HP, wenn das Addon installiert ist"
	pscmrtxtopt421 = "|tip1 wer geriet in |sid91110|id"
	pscmrtxtopt422 = "|tip2 wer stand in |sid91020|id"
	pscmrtxtopt423 = "|tip2 wer geriet in |sid91110|id"
	pscmrtxtopt424 = "|tip2 |sid89667|id - wer Eigenbeschuss verursachte"
	pscmrtxtopt425 = "|tip2 |sid89667|id - wer Eigenbeschuss Erhielt"
	pscmrtxtopt426 = "|tip2 wer |sid89104|id in 3 Phase bekam - NOT WORK"
	pscmrtxtopt427 = "|tip2 schaden erhalten durch |sid89588|id"
	pscmrtxtopt428 = "|tip3 speichere Schaden und andere informationen über Sturmling (im DMG/Wechsel info Modul)"
	pscmrtxtoptadd3211 = "Opfer von |s4id86788,92876,92877,92878|id! Info: erhaltener Schaden:"
	pscmrtxtoptadd3212 = "dispelled"
	pscmrtxtoptadd3213 = "geheilt"
	pscmrtxtoptadd3214 = "NUR geteilter Schaden"
	pscmrtxtoptadd3215 = "Schaden der NICHT geteilt wurde"
	pscmrtxtoptadd3216 = "von"
	pscmrtxtoptincomb = "|tip4 'Im Kampf' info modul Aktiv für den momentanen Boss"
	pscmrtxtoptt111 = "Bekam'en |s4id89000,95177|id:"
	pscmrtxtoptt121 = "Bekam |s4id96884|id (nicht die ersten 2 sek)"
	pscmrtxtoptt211 = "Schaden von |s4id77971,91918,91929,91930|id:"
	pscmrtxtoptt212 = "Bekam'en |s4id78941,91913,94678,94679|id:"
	pscmrtxtoptt213 = "Schaden von |s4id92154|id:"
	pscmrtxtoptt214 = "Schaden von |s4id92134,92196,92197,92198|id:"
	pscmrtxtoptt215 = "Schaden von |s4id88287,91914,91921,91922|id:"
	pscmrtxtoptt221 = "Übermaß an Schaden von |s4id79504|id"
	pscmrtxtoptt2210 = "Verursachte veränderungen an Toxitrons Schild:"
	pscmrtxtoptt2211 = "Angriffe auf Arkanotrons Schild:"
	pscmrtxtoptt22111 = "Übermäßiger Schaden"
	pscmrtxtoptt2212 = "Angriffe auf das LETZTE Schild von Elektron"
	pscmrtxtoptt2213 = "verursachte veränderungen an Toxitrons LETZTEM Schild"
	pscmrtxtoptt2214 = "Angriffe auf das LETZTE Schild von Arkanotron"
	pscmrtxtoptt2222 = "nachdem es das Ziel gewechselt hat"
	pscmrtxtoptt2223 = "Ziel gewechselt"
	pscmrtxtoptt222f = "|s4id80086|id explosion!"
	pscmrtxtoptt222m = "|s4id80086|id explosion!"
	pscmrtxtoptt224 = "|s4id79582|id durchbrochen! Durch:"
	pscmrtxtoptt225 = "Verursachte Eigenbeschuss |s4id79888,91431,91432,91433|id:"
	pscmrtxtoptt226 = "Bekam'en Eigenbeschuss |s4id79888,91431,91432,91433|id:"
	pscmrtxtoptt227 = "Übermaß an Schaden von |s4id79504|id (gesammt):"
	pscmrtxtoptt228 = "Explodiert |s4id80086|id (gesammt):"
	pscmrtxtoptt229 = "Angriffe auf Elektrons Schild:"
	pscmrtxtoptt2311 = "dispelled"
	pscmrtxtoptt2312 = "Nicht dispelled"
	pscmrtxtoptt2313 = "Boss Geheilt"
	pscmrtxtoptt2314 = "Beste dispelled Zeit"
	pscmrtxtoptt2315 = "schlechteste"
	pscmrtxtoptt2316 = "letzte Buffs"
	pscmrtxtoptt233 = "Schaden von |s4id78208|id:"
	pscmrtxtoptt235 = "Ticks von |s4id92930|id:"
	pscmrtxtoptt241 = "Max Geräusch:"
	pscmrtxtoptt242 = "Bekam'en |s4id77675|id:"
	pscmrtxtoptt243 = "Bekam'en |s4id92553|id:"
	pscmrtxtoptt245 = "Bekam'en |s4id78100,92407,92408,92409|id:"
	pscmrtxtoptt261 = "Schaden von |s4id77943|id:"
	pscmrtxtoptt262 = "Max Stack von |s4id81118,94073,94074,94075|id:"
	pscmrtxtoptt264 = "Explosion von |s4id79339|id"
	pscmrtxtoptt265 = "Explosion |s4id79339|id (gesamt ff)"
	pscmrtxtoptt266 = "Gesamte Zeit der |s4id79318|id (sek)"
	pscmrtxtoptt311 = "Schaden von |s4id83734|id:"
	pscmrtxtoptt322f = "Eintrit in die Schattenwelt!"
	pscmrtxtoptt322m = "Eintrit in die Schattenwelt!"
	pscmrtxtoptt323 = "Bossatem Schaden:"
	pscmrtxtoptt324 = "Waren in der Schattenwelt:"
	pscmrtxtoptt325 = "Bekam'en |s4id86505,92907,92908,92909|id:"
	pscmrtxtoptt3311 = "Tod durch |s4id83282|id:"
	pscmrtxtoptt3312 = "Debuff auf"
	pscmrtxtoptt3313 = "Am nächsten von der Entfernung her"
	pscmrtxtoptt332 = "Bekam'en mehr als 30k durch |s4id83067|id:"
	pscmrtxtoptt333 = "Bekam'en mehr als 30k durch |s4id83565|id:"
	pscmrtxtoptt33311 = "Exploded %s (total):"
	pscmrtxtoptt33312f = "explode"
	pscmrtxtoptt33312m = "explode"
	pscmrtxtoptt333141 = "Fails durch Schaden von |s4id82772|id:"
	pscmrtxtoptt333151 = "Bekam'en |s4id84912|id:"
	pscmrtxtoptt334 = "Bekam'en |s4id88558|id:"
	pscmrtxtoptt341 = "Bekam'en |s4id81689,93184,93185,93186|id:"
	pscmrtxtoptt342 = "Max Stacks von |s4id81701,93187,93188,93189|id in Phase 1:"
	pscmrtxtoptt346 = "Stun/Fear/Unterbrechung von |s4id91317|id:"
	pscmrtxtoptt347a = "Unnötiger Schaden (mit Dots)"
	pscmrtxtoptt347b = "Unnötiger Schaden (keine dots)"
	pscmrtxtoptt351 = "Schaden von |s4id92852,92954|id"
	pscmrtxtoptt352 = "Schaden von |s4id92958,92959|id"
	pscmrtxtoptt353 = "Schaden von |s4id86226|id"
	pscmrtxtoptt354 = "Schaden von |s4id90083|id"
	pscmrtxtoptt411 = "wurde geheilt mit |s4id95218,95219,95220,95221|id:"
	pscmrtxtoptt412 = "Bekam'en |s4id85480,85483,93138,93139|id:"
	pscmrtxtoptt413 = "Bekam'en |s4id86133,93141,93142,93143|id:"
	pscmrtxtoptt414 = "Fallschaden mit mehr als 40K:"
	pscmrtxtoptt415 = "Stand in |s4id86111,93129,93130,93131|id (ohne die ersten 2 ticks):"
	pscmrtxtoptt416 = "Max Stack von |s4id84645,93125|id:"
	pscmrtxtoptt421f = "gerieten in |s4id87856|id!"
	pscmrtxtoptt421m = "gerieten in |s4id87856|id!"
	pscmrtxtoptt422 = "stand in |s4id91020|id:"
	pscmrtxtoptt423 = "gerieten in |s4id87856|id:"
	pscmrtxtoptt424 = "Eigenbeschuss durch |s4id89667|id:"
	pscmrtxtoptt425 = "Erhielt Eigenbeschuss durch |s4id89667|id:"
	pscmrtxtoptt427 = "Schaden von |s4id89588|id:"
  


end


end