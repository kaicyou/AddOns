local L = LibStub("AceLocale-3.0"):NewLocale("WorldQuestTrackerAddon", "esES") 
if not L then return end 

L["S_APOWER_AVAILABLE"] = "Disponible"
L["S_APOWER_DOWNVALUE"] = "Las misiones con %s tienen más tiempo que la investigación en curso."
L["S_APOWER_NEXTLEVEL"] = "Siguiente nivel"
L["S_ENABLED"] = "Habilitado"
L["S_ERROR_NOTIMELEFT"] = "Esta misión no tiene tiempo restante."
L["S_ERROR_NOTLOADEDYET"] = "Esta misión no está cargada todavía, por favor espera unos segundos."
L["S_FLYMAP_SHOWTRACKEDONLY"] = "Sólo en rastreo"
L["S_FLYMAP_SHOWTRACKEDONLY_DESC"] = "Mostrar sólo misiones en rastreo"
L["S_FLYMAP_SHOWWORLDQUESTS"] = "Muestra misiones del mundo"
L["S_GROUPFINDER_ACTIONS_CANCEL_APPLICATIONS"] = "clic para cancelar aplicaciones..."
L["S_GROUPFINDER_ACTIONS_CANCELING"] = "cancelando..."
L["S_GROUPFINDER_ACTIONS_CREATE"] = "grupo no encontrado?, clic para comenzar uno"
L["S_GROUPFINDER_ACTIONS_CREATE_DIRECT"] = "crear grupo"
L["S_GROUPFINDER_ACTIONS_LEAVEASK"] = "Salir del grupo?"
--Translation missing 
-- L["S_GROUPFINDER_ACTIONS_LEAVINGIN"] = ""
L["S_GROUPFINDER_ACTIONS_RETRYSEARCH"] = "reintentar búsqueda"
L["S_GROUPFINDER_ACTIONS_SEARCH"] = "clic para empezar a buscar grupos"
L["S_GROUPFINDER_ACTIONS_SEARCH_RARENPC"] = "buscar un grupo para matar este raro"
L["S_GROUPFINDER_ACTIONS_SEARCH_TOOLTIP"] = "Unirse a algún grupo haciendo esta misión"
L["S_GROUPFINDER_ACTIONS_SEARCHING"] = "buscando..."
L["S_GROUPFINDER_ACTIONS_SEARCHMORE"] = "Clic para buscar más miembros de grupo"
L["S_GROUPFINDER_ACTIONS_SEARCHOTHER"] = "Salir y Buscar un grupo diferente?"
L["S_GROUPFINDER_ACTIONS_UNAPPLY1"] = "Clic para remover la aplicación para que podamos crear un grupo nuevo"
L["S_GROUPFINDER_ACTIONS_UNLIST"] = "Clic para deslistar su grupo actual"
L["S_GROUPFINDER_ACTIONS_UNLISTING"] = "Delistando..."
L["S_GROUPFINDER_ACTIONS_WAITING"] = "Esperando..."
L["S_GROUPFINDER_AUTOOPEN_RARENPC_TARGETED"] = "Auto Abrir al Seleccionar un Mob Raro"
L["S_GROUPFINDER_ENABLED"] = "Auto Abrir en Nueva Misión"
L["S_GROUPFINDER_INVASION_ENABLED"] = "Auto Abrir en Punto de Invasión"
L["S_GROUPFINDER_LEAVEOPTIONS"] = "Opciones de Salida de Grupo"
L["S_GROUPFINDER_LEAVEOPTIONS_AFTERX"] = "Salir después de X Segundos"
L["S_GROUPFINDER_LEAVEOPTIONS_ASKX"] = "No Auto Salir, Solo Preguntar por X Segundos"
L["S_GROUPFINDER_LEAVEOPTIONS_DONTLEAVE"] = "No Mostrar Panel de Salida"
L["S_GROUPFINDER_LEAVEOPTIONS_IMMEDIATELY"] = "Salir Inmediatamente al Completar Misión"
L["S_GROUPFINDER_NOPVP"] = "Evitar Servidores PVP"
L["S_GROUPFINDER_OT_ENABLED"] = "Mostrar botones en el Rastreador de Objetivos"
L["S_GROUPFINDER_QUEUEBUSY"] = "Ya estás en cola."
L["S_GROUPFINDER_RESULTS_APPLYING"] = "Quedan %d grupos, clic nuevamente"
L["S_GROUPFINDER_RESULTS_APPLYING1"] = "Queda 1 grupo para unirse, clic nuevamente"
--Translation missing 
-- L["S_GROUPFINDER_RESULTS_FOUND"] = ""
L["S_GROUPFINDER_RESULTS_FOUND1"] = [=[encontrado 1 grupo
clic para empezar a unirse]=]
--Translation missing 
-- L["S_GROUPFINDER_RESULTS_UNAPPLY"] = ""
L["S_GROUPFINDER_RIGHTCLICKCLOSE"] = "Clic derecho para cerrar"
L["S_GROUPFINDER_SECONDS"] = "Segundos"
L["S_GROUPFINDER_TITLE"] = "Buscador de Grupo"
L["S_GROUPFINDER_TUTORIAL1"] = "Haz misiones de mundo más rápido uniéndote a un grupo haciendo la misma misión!"
L["S_MAPBAR_AUTOWORLDMAP"] = "Auto mapa del mundo"
L["S_MAPBAR_AUTOWORLDMAP_DESC"] = [=[Estando en Dalaran o en la Sede de Clase, apretar 'M' va directamente al mapa de las Islas Abruptas.
Apretar 'M' dos veces va al mapa donde te encuentras.]=]
L["S_MAPBAR_FILTER"] = "Filtro"
L["S_MAPBAR_FILTERMENU_FACTIONOBJECTIVES"] = "Objetivos de Facción"
L["S_MAPBAR_FILTERMENU_FACTIONOBJECTIVES_DESC"] = "Mostrar misiones de Facción incluso si han sido filtradas."
L["S_MAPBAR_OPTIONS"] = "Opciones"
L["S_MAPBAR_OPTIONSMENU_ARROWSPEED"] = "Velocidad de actualización de la flecha"
L["S_MAPBAR_OPTIONSMENU_ARROWSPEED_HIGH"] = "Rápido"
L["S_MAPBAR_OPTIONSMENU_ARROWSPEED_MEDIUM"] = "Medio"
L["S_MAPBAR_OPTIONSMENU_ARROWSPEED_REALTIME"] = "Tiempo real"
L["S_MAPBAR_OPTIONSMENU_ARROWSPEED_SLOW"] = "Lento"
L["S_MAPBAR_OPTIONSMENU_EQUIPMENTICONS"] = "Iconos de equipo"
L["S_MAPBAR_OPTIONSMENU_QUESTTRACKER"] = "Habilitar Rastreador de misiones"
L["S_MAPBAR_OPTIONSMENU_REFRESH"] = "Refrescar"
L["S_MAPBAR_OPTIONSMENU_SHARE"] = "Compartir este Addon"
L["S_MAPBAR_OPTIONSMENU_SOUNDENABLED"] = "Habilitar sonido"
L["S_MAPBAR_OPTIONSMENU_STATUSBARANCHOR"] = "Anclar en la parte superior"
L["S_MAPBAR_OPTIONSMENU_TOMTOM_WPPERSISTENT"] = "Punto de destino persistente"
L["S_MAPBAR_OPTIONSMENU_TRACKER_CURRENTZONE"] = "Sólo zona actual"
L["S_MAPBAR_OPTIONSMENU_TRACKER_SCALE"] = "Escala del rastreador: %s"
L["S_MAPBAR_OPTIONSMENU_TRACKERCONFIG"] = "Configuración del rastreador"
L["S_MAPBAR_OPTIONSMENU_TRACKERMOVABLE_AUTO"] = "Posición automática"
L["S_MAPBAR_OPTIONSMENU_TRACKERMOVABLE_CUSTOM"] = "Posición personalizada"
L["S_MAPBAR_OPTIONSMENU_TRACKERMOVABLE_LOCKED"] = "Bloqueado"
L["S_MAPBAR_OPTIONSMENU_UNTRACKQUESTS"] = "Dejar de rastrear todas las misiones"
L["S_MAPBAR_OPTIONSMENU_WORLDMAPCONFIG"] = "Configuración del mapa del mundo"
L["S_MAPBAR_OPTIONSMENU_YARDSDISTANCE"] = "Mostrar distancia en yardas"
L["S_MAPBAR_OPTIONSMENU_ZONE_QUESTSUMMARY"] = "Sumario de misiones (pantalla completa)"
L["S_MAPBAR_OPTIONSMENU_ZONEMAPCONFIG"] = "Configuración del mapa de la zona"
L["S_MAPBAR_RESOURCES_TOOLTIP_TRACKALL"] = "Pulsar para rastrear todas: |cFFFFFFFF%s|r misiones."
L["S_MAPBAR_SORTORDER"] = "Ordenación"
L["S_MAPBAR_SORTORDER_TIMELEFTPRIORITY_FADE"] = "Sombrear misiones"
L["S_MAPBAR_SORTORDER_TIMELEFTPRIORITY_OPTION"] = "Menos de %d horas"
L["S_MAPBAR_SORTORDER_TIMELEFTPRIORITY_SHOWTEXT"] = "Texto de tiempo restante"
L["S_MAPBAR_SORTORDER_TIMELEFTPRIORITY_SORTBYTIME"] = "Ordenado por tiempo"
L["S_MAPBAR_SORTORDER_TIMELEFTPRIORITY_TITLE"] = "Tiempo restante"
L["S_MAPBAR_SUMMARY"] = "Sumario"
L["S_MAPBAR_SUMMARYMENU_ACCOUNTWIDE"] = "Compartido a la cuenta"
L["S_MAPBAR_SUMMARYMENU_MOREINFO"] = "Pulsa para más información"
L["S_MAPBAR_SUMMARYMENU_NOATTENTION"] = "¡A ninguna de las misiones rastreadas en tus otros personajes le queda menos de 2 horas!"
L["S_MAPBAR_SUMMARYMENU_REQUIREATTENTION"] = "Requiere atención"
L["S_MAPBAR_SUMMARYMENU_TODAYREWARDS"] = "Recompensas de hoy"
L["S_OVERALL"] = "Total"
L["S_PARTY"] = "Grupo"
L["S_PARTY_DESC1"] = "Las misiones con una estrella azul significa que todos los miembros del grupo tienen esa misión."
L["S_PARTY_DESC2"] = "Si se muestra una estrella roja, un miembro del grupo no es elegible para las misiones de mundo o no tiene WQT instalado aún."
L["S_PARTY_PLAYERSWITH"] = "Jugadores en el grupo con WQT:"
L["S_PARTY_PLAYERSWITHOUT"] = "Jugadores en el grupo sin WQT:"
L["S_QUESTSCOMPLETED"] = "Misiones completadas"
L["S_QUESTTYPE_ARTIFACTPOWER"] = "Poder de artefacto"
L["S_QUESTTYPE_DUNGEON"] = "Mazmorra"
L["S_QUESTTYPE_EQUIPMENT"] = "Equipo"
L["S_QUESTTYPE_GOLD"] = "Oro"
L["S_QUESTTYPE_PETBATTLE"] = "Duelo de mascotas"
L["S_QUESTTYPE_PROFESSION"] = "Profesión"
L["S_QUESTTYPE_PVP"] = "JcJ"
L["S_QUESTTYPE_RESOURCE"] = "Recursos"
L["S_QUESTTYPE_TRADESKILL"] = "Habilidad de comercio"
L["S_RAREFINDER_NPC_NOTREGISTERED"] = "Raro no en la Base de Datos"
--Translation missing 
-- L["S_RAREFINDER_OPTIONS_ENGLISHSEARCH"] = ""
L["S_RAREFINDER_OPTIONS_SHOWICONS"] = "Mostrar Iconos para Raros Activos"
L["S_RAREFINDER_TITLE"] = "Buscador Raro"
L["S_RAREFINDER_TOOLTIP_SPOTTEDBY"] = "Visto por"
L["S_RAREFINDER_TOOLTIP_TIMEAGO"] = "Minutos Atrás"
L["S_SHAREPANEL_THANKS"] = [=[¡Gracias por compartir el Rastreador de Misiones del Mundo!
Envía nuestro enlace a tus amigos en Facebook, Twitter y la Moncloa.]=]
L["S_SHAREPANEL_TITLE"] = "For All Those About to Rock!"
L["S_SUMMARYPANEL_EXPIRED"] = "AGOTADO"
L["S_SUMMARYPANEL_LAST15DAYS"] = "Últimos 15 días"
L["S_SUMMARYPANEL_LIFETIMESTATISTICS_ACCOUNT"] = "Estadísticas históricas de la cuenta"
L["S_SUMMARYPANEL_LIFETIMESTATISTICS_CHARACTER"] = "Estadísticas históricas del personaje"
L["S_SUMMARYPANEL_OTHERCHARACTERS"] = "Otros personajes"
L["S_TUTORIAL_AMOUNT"] = "Indica la cantidad a recibir"
L["S_TUTORIAL_CLICKTOTRACK"] = "Pulsa para rastrear una misión."
L["S_TUTORIAL_CLOSE"] = "Cerrar tutorial"
L["S_TUTORIAL_FACTIONBOUNTY"] = "Indica que la misión cuenta para la Facción seleccionada."
L["S_TUTORIAL_FACTIONBOUNTY_AMOUNTQUESTS"] = "Indica cuantas misiones hay en el mapa para la Facción seleccionada."
L["S_TUTORIAL_HOWTOADDTRACKER"] = "Botón izquierdo para rastrear una misión. En el rastreador, puedes presionar |cFFFFFFFFbotón derecho|r para dejar de rastrearla."
L["S_TUTORIAL_PARTY"] = "Estando en grupo, ¡una estrella azul indica las misiones que todos los miembros del grupo tienen!"
L["S_TUTORIAL_RARITY"] = "Indica la calidad (común, raro, épico)"
L["S_TUTORIAL_REWARD"] = "Indica la recompensa (equipo, oro, poder de artefacto, recursos, componentes)"
L["S_TUTORIAL_TIMELEFT"] = "Indica el tiempo restante (+4 horas, +90 minutos, +30 minutos, menos de 30 minutos)"
L["S_TUTORIAL_WORLDMAPBUTTON"] = "Este botón te lleva al mapa de las Islas Abruptas."
L["S_UNKNOWNQUEST"] = "Misión desconocida"
L["S_WORLDMAP_TOOGLEQUESTS"] = "Alternar Misiones"
L["S_WORLDQUESTS"] = "Misiones del mundo"

