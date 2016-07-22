if not(GetLocale() == "frFR") then
    return;
end

local L = WeakAuras.L

-- Options translation
-- L[""] = ""
L["1 Match"] = "1 Correspondance"
-- L["A 20x20 pixels icon"] = ""
-- L["A 32x32 pixels icon"] = ""
-- L["A 40x40 pixels icon"] = ""
-- L["A 48x48 pixels icon"] = ""
-- L["A 64x64 pixels icon"] = ""
L["Actions"] = "Actions"
L["Activate when the given aura(s) |cFFFF0000can't|r be found"] = "Activer quand l'aura |cFFFF0000ne peut|r être trouvée"
L["Addons"] = "Addons"
L["Add to new Dynamic Group"] = "Ajouter à un nouveau groupe dynamique"
L["Add to new Group"] = "Ajouter à un nouveau groupe"
L["Add Trigger"] = "Ajouter un déclencheur"
L["A group that dynamically controls the positioning of its children"] = "Un groupe qui contrôle dynamiquement le positionnement de ses enfants"
L["Align"] = "Aligner"
L["Allow Full Rotation"] = "Permettre une rotation complète"
L["Alpha"] = "Alpha"
L["Anchor"] = "Ancrage"
L["Anchor Point"] = "Point d'ancrage"
L["Angle"] = "Angle"
L["Animate"] = "Animer"
L["Animated Expand and Collapse"] = "Expansion et réduction animés"
L["Animation relative duration description"] = [=[La durée de l'animation par rapport à la durée du graphique, exprimée en fraction (1/2), pourcentage (50%), ou décimal (0.5).
|cFFFF0000Note :|r si un graphique n'a pas de progression (déclencheur d'événement sans durée définie, aura sans durée, etc), l'animation ne jouera pas.

|cFF4444FFPar exemple :|r
Si la durée de l'animation est définie à |cFF00CC0010%|r, et le déclencheur du graphique est une amélioration qui dure 20 secondes, l'animation de début jouera pendant 2 secondes.
Si la durée de l'animation est définie à |cFF00CC0010%|r, et le déclencheur du graphique n'a pas de durée définie, aucune d'animation de début ne jouera (mais elle jouerait si vous aviez spécifié une durée en secondes).
]=]
L["Animations"] = "Animations"
L["Animation Sequence"] = "Séquence d'animation"
-- L["Apply Template"] = ""
-- L["Arcane Orb"] = ""
-- L["At a position a bit left of Left HUD position."] = ""
-- L["At a position a bit left of Right HUD position"] = ""
-- L["At the same position as Blizzard's spell alert"] = ""
-- L["Aura Name"] = ""
L["Aura(s)"] = "Aura(s)"
-- L["Aura Type"] = ""
L["Auto"] = "Auto"
L["Automatic Icon"] = "Icône automatique"
L["Backdrop Color"] = "Couleur de Fond"
L["Backdrop Style"] = "Style de Fond"
L["Background"] = "Arrière-plan"
L["Background Color"] = "Couleur de fond"
L["Background Inset"] = "Encart d'arrière-plan"
L["Background Offset"] = "Décalage du Fond "
L["Background Texture"] = "Texture du Fond"
L["Bar Alpha"] = "Alpha de la Barre"
L["Bar Color"] = "Couleur de barre"
L["Bar Color Settings"] = "Réglages Couleur de Barre"
L["Bar in Front"] = "Barre devant"
L["Bar Texture"] = "Texture de barre"
-- L["Big Icon"] = ""
L["Blend Mode"] = "Mode du fusion"
-- L["Blue Rune"] = ""
-- L["Blue Sparkle Orb"] = ""
L["Border"] = "Bordure"
L["Border Color"] = "Couleur de Bordure"
L["Border Inset"] = "Encart Fond"
L["Border Offset"] = "Décalage Bordure"
L["Border Settings"] = "Réglages de Bordure"
L["Border Size"] = "Taille de Bordure"
L["Border Style"] = "Style de Bordure"
L["Bottom Text"] = "Texte du bas"
L["Button Glow"] = "Bouton allumé"
L["Can be a name or a UID (e.g., party1). Only works on friendly players in your group."] = "Peut être un nom ou un UID (par ex. party1). Fonctionne uniquement pour les joueurs amicaux de votre groupe."
L["Cancel"] = "Annuler"
L["Channel Number"] = "Numéro de canal"
-- L["Chat Message"] = ""
L["Check On..."] = "Vérifier sur..."
-- L["Children:"] = ""
L["Choose"] = "Choisir"
L["Choose Trigger"] = "Choisir un déclencheur"
L["Choose whether the displayed icon is automatic or defined manually"] = "Choisir si l'icône affichée est automatique ou définie manuellement"
L["Clone option enabled dialog"] = [=[
Vous avez activé une option qui utilise l'|cFFFF0000Auto-clonage|r.

L'|cFFFF0000Auto-clonage|r permet à un graphique d'être automatiquement dupliqué pour afficher plusieurs sources d'information.
A moins que vous mettiez ce graphique dans un |cFF22AA22Groupe Dynamique|r, tous les clones seront affichés en tas l'un sur l'autre.

Souhaitez-vous que ce graphiques soit placé dans un nouveau |cFF22AA22Groupe Dynamique|r ?]=]
L["Close"] = "Fermer"
L["Collapse all loaded displays"] = "Réduire tous les graphiques chargés"
L["Collapse all non-loaded displays"] = "Réduire tous les graphiques non-chargés"
L["Color"] = "Couleur"
L["Compress"] = "Compresser"
L["Constant Factor"] = "Facteur constant"
L["Controls the positioning and configuration of multiple displays at the same time"] = "Contrôle la position et la configuration de plusieurs graphiques en même temps"
L["Cooldown"] = "Recharge"
L["Count"] = "Compte"
L["Creating buttons: "] = "Création de boutons :"
L["Creating options: "] = "Création d'options :"
-- L["Crop"] = ""
L["Crop X"] = "Couper X"
L["Crop Y"] = "Couper Y"
-- L["Custom"] = ""
L["Custom Code"] = "Code personnalisé"
-- L["Custom Function"] = ""
L["Custom Trigger"] = "Déclencheur personnalisé"
L["Custom trigger event tooltip"] = [=[
Choisissez quels évènements peuvent activer le déclencheur.
Plusieurs évènements peuvent être spécifiés avec des virgules ou des espaces.

|cFF4444FFPar exemple:|r
UNIT_POWER, UNIT_AURA PLAYER_TARGET_CHANGED
]=]
L["Custom trigger status tooltip"] = [=[
Choisissez quels évènements peuvent activer le déclencheur.
Comme c'est un déclencheur de type statut, les évènements spécifiés peuvent être appelés par WeakAuras sans les arguments attendus.
Plusieurs évènements peuvent être spécifiés avec des virgules ou des espaces.

|cFF4444FFPar exemple:|r
UNIT_POWER, UNIT_AURA PLAYER_TARGET_CHANGED
]=]
L["Custom Untrigger"] = "Désactivation personnalisée"
L["Debuff Type"] = "Type d'affaiblissement"
-- L["Default"] = ""
L["Delete all"] = "Supprimer tout"
L["Delete Trigger"] = "Supprimer le déclencheur"
L["Desaturate"] = "Dé-saturer"
L["Disabled"] = "Désactivé"
L["Discrete Rotation"] = "Rotation individuelle"
L["Display"] = "Graphique"
L["Display Icon"] = "Icône du graphique"
-- L["Displays a text, works best in combination with other displays"] = ""
L["Display Text"] = "Texte du graphique"
L["Distribute Horizontally"] = "Distribuer horizontalement"
L["Distribute Vertically"] = "Distribuer verticalement"
-- L["Done"] = ""
-- L["-- Do not remove this comment, it is part of this trigger: "] = ""
L["Duration Info"] = "Info de durée"
L["Duration (s)"] = "Durée (s)"
L["Dynamic Group"] = "Groupe Dynamique"
-- L["Dynamic information"] = ""
-- L["Dynamic information from first Active Trigger"] = ""
-- L["Dynamic information from Trigger %i"] = ""
L["Dynamic text tooltip"] = [=[
Il y a plusieurs codes spéciaux disponibles pour rendre ce texte dynamique :

|cFFFF0000%p|r - Progression - Le temps restant sur un compteur, ou une valeur autre
|cFFFF0000%t|r - Total - La durée maximum d'un compteur, ou le maximum d'une valeur autre
|cFFFF0000%n|r - Nom - Le nom du graphique (souvent le nom d'une aura), ou l'ID du graphique s'il n'y a pas de nom dynamique
|cFFFF0000%i|r - Icône - L'icône associée à l'affichage
|cFFFF0000%s|r - Pile - La taille de la pile d'une aura (généralement)
|cFFFF0000%c|r - Personnalisé - Vous permet de définir une fonction Lua personnalisée qui donne un texte à afficher]=]
L["Enabled"] = "Activé"
-- L["End Angle"] = ""
L["Enter an aura name, partial aura name, or spell id"] = "Entrez un nom d'aura, nom d'aura partiel ou ID de sort"
-- L["Event"] = ""
-- L["Event(s)"] = ""
L["Event Type"] = "Type d'évènement"
L["Expand all loaded displays"] = "Agrandir tous graphiques chargés"
L["Expand all non-loaded displays"] = "Agrandir tous graphiques non-chargés"
L["Expand Text Editor"] = "Agrandir éditeur de texte"
L["Fade"] = "Fondu"
-- L["Fade In"] = ""
-- L["Fade Out"] = ""
L["Finish"] = "Finir"
-- L["Fire Orb"] = ""
L["Font"] = "Police"
L["Font Flags"] = "Style de Police"
L["Font Size"] = "Taille de Police"
L["Font Type"] = "Type de police"
L["Foreground Color"] = "Couleur premier-plan"
L["Foreground Texture"] = "Texture premier-plan"
L["Frame"] = "Cadre"
L["Frame Strata"] = "Strate du cadre"
-- L["From Template"] = ""
L["Glow Action"] = "Action de l'éclat"
-- L["Green Rune"] = ""
-- L["Group"] = ""
L["Group aura count description"] = [=[Le nombre de membres du %s qui doivent être affectés par une ou plusieurs des auras sélectionnées pour que l'affichage soit déclenché.
Si le nombre entré est un entier (ex. 5), le nombre de membres du raid affectés sera comparé au nombre entré.
Si le nombre entré est decimal (ex. 0.5), une fraction (ex. 1/2), ou un pourcentage (ex. 50%%), alors cette fraction du %s doit être affectée.

|cFF4444FFPar exemple :|r
|cFF00CC00> 0|r se déclenchera quand n'importe quel membre du %s est affecté
|cFF00CC00= 100%%|r se déclenchera quand tous les membres du %s sont affectés
|cFF00CC00!= 2|r se déclenchera quand le nombre de membres du %s affectés est différent de 2
|cFF00CC00<= 0.8|r se déclenchera quand moins de 80%% du %s est affecté (4 des 5 membres du groupe, 8 des 10 ou 20 des 25 membres du raid )
|cFF00CC00> 1/2|r se déclenchera quand plus de la moitié du %s est affecté
|cFF00CC00>= 0|r se déclenchera toujours, quoi qu'il arrive
]=]
L["Group Member Count"] = "Nombre de membres du groupe"
-- L["Grow"] = ""
-- L["Hawk"] = ""
L["Height"] = "Hauteur"
-- L["Hide"] = ""
-- L["Hide on"] = ""
L["Hide When Not In Group"] = "Cacher hors d'un groupe"
L["Horizontal Align"] = "Aligner horizontalement"
-- L["Horizontal Bar"] = ""
-- L["Horizontal Blizzard Raid Bar"] = ""
-- L["Huge Icon"] = ""
-- L["Icon"] = ""
L["Icon Color"] = "Couleur d'icône"
L["Icon Info"] = "Info d'icône"
L["Icon Inset"] = "Objet inséré"
L["Ignored"] = "Ignoré"
L["%i Matches"] = "%i Correspondances"
L["Import"] = "Importer"
L["Import a display from an encoded string"] = "Importer un graphique d'un texte encodé"
-- L["Inverse"] = ""
L["Justify"] = "Justification"
-- L["Leaf"] = ""
-- L["Left 2 HUD position"] = ""
-- L["Left HUD position"] = ""
L["Left Text"] = "Texte de gauche"
L["Load"] = "Charger"
L["Loaded"] = "Chargé"
-- L["Low Mana"] = ""
L["Main"] = "Principal"
L["Manage displays defined by Addons"] = "Gérer graphiques définis par addons"
-- L["Medium Icon"] = ""
-- L["Message"] = ""
L["Message Prefix"] = "Préfixe du message"
L["Message Suffix"] = "Suffixe du message"
-- L["Message Type"] = ""
L["Mirror"] = "Miroir"
L["Model"] = "Modèle"
L["Multiple Displays"] = "Graphiques multiples"
L["Multiple Triggers"] = "Déclencheur multiples"
L["Multiselect ignored tooltip"] = [=[
|cFFFF0000Ignoré|r - |cFF777777Unique|r - |cFF777777Multiple|r
Cette option ne sera pas utilisée pour déterminer quand ce graphique doit être chargé]=]
L["Multiselect multiple tooltip"] = [=[
|cFF777777Ignoré|r - |cFF777777Unique|r - |cFF00FF00Multiple|r
Plusieurs valeurs peuvent être choisies]=]
L["Multiselect single tooltip"] = [=[
|cFF777777Ignoré|r - |cFF00FF00Unique|r - |cFF777777Multiple|r
Seule une unique valeur peut être choisie]=]
L["Name Info"] = "Info du nom"
L["Negator"] = "Pas"
-- L["Never"] = ""
L["New"] = "Nouveau"
L["No"] = "Non"
-- L["None"] = ""
L["Not all children have the same value for this option"] = "Tous les enfants n'ont pas la même valeur pour cette option"
L["Not Loaded"] = "Non chargé"
L["No tooltip text"] = "Pas d'infobulle"
-- L["Offer a guided way to create auras for your class"] = ""
L["% of Progress"] = "% de progression"
L["Okay"] = "Okay"
L["On Hide"] = "Au masquage"
-- L["On Init"] = ""
L["Only match auras cast by people other than the player"] = "Ne considérer que les auras lancées par d'autres que le joueur"
L["Only match auras cast by the player"] = "Ne considérer que les auras lancées par le joueur"
L["On Show"] = "A l'affichage"
L["Operator"] = "Opérateur"
L["or"] = "ou"
-- L["Orange Rune"] = ""
L["Orientation"] = "Orientation"
L["Outline"] = "Contour"
L["Own Only"] = "Le mien uniquement"
-- L["Paste text below"] = ""
L["Play Sound"] = "Jouer un son"
L["Portrait Zoom"] = "Zoom Portrait"
-- L["Preset"] = ""
L["Prevents duration information from decreasing when an aura refreshes. May cause problems if used with multiple auras with different durations."] = "Empêche l'info de durée de décroitre quand une aura est rafraichie. Peut causer des problèmes si utilisé avec plusieurs auras de différentes durées."
-- L["Processed %i chars"] = ""
L["Progress Bar"] = "Barre de progression"
L["Progress Texture"] = "Texture de progression"
-- L["Purple Rune"] = ""
-- L["Radius"] = ""
L["Re-center X"] = "Recentrer X"
L["Re-center Y"] = "Recentrer Y"
-- L["Remaining Time"] = ""
L["Remaining Time Precision"] = "Précision du temps restant"
L["Required For Activation"] = "Requis pour l'activation"
-- L["Right 2 HUD position"] = ""
L["Right-click for more options"] = "Clic-droit pour plus d'options"
-- L["Right HUD position"] = ""
L["Right Text"] = "Texte de droite"
L["Rotate"] = "Tourner"
L["Rotate In"] = "Rotation entrante"
L["Rotate Out"] = "Rotation sortante"
L["Rotate Text"] = "Tourner le texte"
L["Rotation"] = "Rotation"
L["Rotation Mode"] = "Mode de rotation"
L["Same"] = "Le même"
L["Search"] = "Chrecher"
L["Select the auras you always want to be listed first"] = "Choisissez les auras que vous voulez toujours voir apparaître en premier dans la liste"
L["Send To"] = "Envoyer vers"
L["Show all matches (Auto-clone)"] = "Montrer toutes correspondances (Auto-Clone)"
-- L["Show model of unit "] = ""
L["Show players that are |cFFFF0000not affected"] = "Montrer les joueurs |cFFFF0000non-affectés"
L["Shows a 3D model from the game files"] = "Montre un modèle 3D tiré du jeu"
L["Shows a custom texture"] = "Montre une texture personnalisée"
L["Shows a progress bar with name, timer, and icon"] = "Affiche une barre de progression avec nom, temps, icône"
L["Shows a spell icon with an optional cooldown overlay"] = "Affiche une icône de sort avec optionnellement la recharge sur-imprimée" -- Needs review
L["Shows a texture that changes based on duration"] = "Affiche une texture qui change selon la durée"
L["Shows one or more lines of text, which can include dynamic information such as progress or stacks"] = "Affiche une ligne de texte ou plus, qui peut inclure des infos dynamiques telles que progression ou piles."
L["Size"] = "Taille"
L["Slide"] = "Glisser"
L["Slide In"] = "Glisser entrant"
L["Slide Out"] = "Glisser sortant"
-- L["Small Icon"] = ""
L["Sort"] = "Trier"
L["Sound"] = "Son"
L["Sound Channel"] = "Canal sonore"
L["Sound File Path"] = "Chemin fichier son"
-- L["Sound Kit ID"] = ""
L["Space"] = "Espacer"
L["Space Horizontally"] = "Espacer horizontalement"
L["Space Vertically"] = "Espacer verticalement"
-- L["Spark"] = ""
-- L["Spark Settings"] = ""
-- L["Spark Texture"] = ""
-- L["Specific Unit"] = ""
L["Spell ID"] = "ID de sort"
L["Spell ID dialog"] = [=[Vous avez spécifié une aura par |cFFFF0000ID de sort|r.

Par défaut, |cFF8800FFWeakAuras|r ne peut distinguer entre des auras de même nom mais d'|cFFFF0000ID de sort|r différents.
Cependant, si l'option Scan Complet est activée, |cFF8800FFWeakAuras|r peut chercher des |cFFFF0000ID de sorts|r spécifiques.

Voulez-vous activer le Scan Complet pour chercher cet |cFFFF0000ID de sort|r ?]=]
L["Stack Count"] = "Nombre de Piles"
L["Stack Info"] = "Info de Piles"
-- L["Stacks"] = ""
L["Stacks Settings"] = "Réglages de Piles"
L["Stagger"] = "Report"
-- L["Star"] = ""
L["Start"] = "Début"
-- L["Start Angle"] = ""
-- L["Status"] = ""
L["Stealable"] = "Volable"
L["Sticky Duration"] = "Durée épinglée"
-- L["Symbol Settings"] = ""
L["Temporary Group"] = "Groupe temporaire"
L["Text"] = "Texte"
L["Text Color"] = "Couleur Texte"
L["Text Position"] = "Position Texte"
L["Texture"] = "Texture"
L["Texture Info"] = "Info Texture"
L["The children of this group have different display types, so their display options cannot be set as a group."] = "Les enfants de ce groupe ont différent types de graphiques, leurs options de graphique ne peuvent donc pas être changées en groupe."
L["The duration of the animation in seconds."] = "La durée de l'animation en secondes."
L["The type of trigger"] = "Le type de déclencheur"
-- L["This region of type \"%s\" is not supported."] = ""
L["Time in"] = "Temps entrant"
-- L["Tiny Icon"] = ""
L["Toggle the visibility of all loaded displays"] = "Change la visibilité de tous les graphiques chargés"
L["Toggle the visibility of all non-loaded displays"] = "Change la visibilité de tous les graphiques non-chargés"
L["to group's"] = "au groupe..."
L["Tooltip"] = "Infobulle"
L["Tooltip on Mouseover"] = "Infobulle à la souris"
-- L["Top HUD position"] = ""
L["Top Text"] = "Texte du Haut"
L["to screen's"] = "à l'écran..."
L["Total Time Precision"] = "Précision Temps total"
L["Trigger"] = "Déclencheur"
L["Trigger %d"] = "Déclencheur %d"
L["Type"] = "Type"
-- L["Unit"] = ""
L["Unlike the start or finish animations, the main animation will loop over and over until the display is hidden."] = "Contrairement aux animations de début et de fin, l'animation principale bouclera tant que le graphique est visible."
L["Update Custom Text On..."] = "Mettre à jour Texte Perso sur..."
L["Use Full Scan (High CPU)"] = "Utiliser Scan Complet (CPU élevé)"
L["Use tooltip \"size\" instead of stacks"] = "Utiliser la \"taille\" de l'infobulle plutôt que la pile"
L["Vertical Align"] = "Aligner verticalement"
-- L["Vertical Bar"] = ""
-- L["WeakAurasOptions"] = ""
L["Width"] = "Largeur"
L["X Offset"] = "Décalage X"
L["X Scale"] = "Echelle X"
-- L["Yellow Rune"] = ""
L["Yes"] = "Oui"
L["Y Offset"] = "Décalage Y"
L["Y Scale"] = "Echelle Y"
L["Z Offset"] = "Décalage Z"
L["Zoom"] = "Zoom"
L["Zoom In"] = "Zoom entrant"
L["Zoom Out"] = "Zoom sortant"



