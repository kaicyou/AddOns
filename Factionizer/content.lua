function FIZ_InitEnFactionGains(guildName)		
	local zone = {}	
	-- Kalimdor	
	zone.Kalimdor = 13	
	zone.AhnQiraj_F_King = 772	
	zone.Ammen_Vale = 894	
	zone.Ashenvale = 43	
	zone.Azshara = 181	
	zone.Azuremyst_Isle = 464	
	zone.Bloodmyst_Isle = 476	
	zone.Camp_Narache = 890	
	zone.Darkshore = 42	
	zone.Darnassus = 381	
	zone.Desolace = 101	
	zone.Durotar = 4	
	zone.Dustwallow_Marsh = 141	
	zone.Echo_Isles = 891	
	zone.Felwood = 182	
	zone.Feralas = 121	
	zone.Molten_Front = 795	
	zone.Moonglade = 241	
	zone.Mount_Hyjal = 606	
	zone.Mulgore = 9	
	zone.Northern_Barrens = 11	
	zone.Orgrimmar = 321	
	zone.Shadowglen = 888	
	zone.Silithus = 261	
	zone.Southern_Barrens = 607	
	zone.Stonetalon_Mountains = 81	
	zone.Tanaris = 161	
	zone.Teldrassil = 41	
	zone.The_Exodar = 471	
	zone.Thousand_Needles = 61	
	zone.Thunder_Bluff = 362	
	zone.Uldum = 720	
	zone.UnGoro_Crater = 201	
	zone.Valley_of_Trials = 889	
	zone.Winterspring = 281	
		
	-- Eastern Kingdoms	
	zone.Eastern_Kingdoms = 14	
	zone.Abyssal_Depths = 614	
	zone.Arathi_Highlands = 16	
	zone.Badlands = 17	
	zone.Blasted_Lands = 19	
	zone.Burning_Steppes = 29	
	zone.Coldridge_Valley = 866	
	zone.Deadwind_Pass = 32	
	zone.Deathknell = 892	
	zone.Dun_Morogh = 27	
	zone.Duskwood = 34	
	zone.E_Plaguelands = 23	
	zone.Elwynn_Forest = 30	
	zone.Evrsong_Woods = 462	
	zone.Ghostlands = 463	
	zone.Gilneas = 545	
	zone.Gilneas_City = 611	
	zone.Hillsbrad_Foothills = 24	
	zone.Ironforge = 341	
	zone.Isle_of_QuelDanas = 499	
	zone.Kelpthar_Forest = 610	
	zone.Loch_Modan = 35	
	zone.New_Tinkertown = 895	
	zone.N_Stranglethorn = 37	
	zone.Northshire = 864	
	zone.Redridge_Mountains = 36	
	zone.R_Gilneas = 684	
	zone.R_Gilneas_C = 685	
	zone.Searing_Gorge = 28	
	zone.Shimmering_Expanse = 615	
	zone.Silvermoon_City = 480	
	zone.Silverpine_Forest = 21	
	zone.Stormwind_City = 301	
	zone.Stranglethorn_Vale = 689	
	zone.Sunstrider_Isle = 893	
	zone.Swamp_of_Sorrows = 38	
	zone.C_o_Stranglethorn = 673	
	zone.The_Hinterlands = 26	
	zone.The_Scarlet_Enclave = 502	
	zone.Tirisfal_Glades = 20	
	zone.Tol_Barad = 708	
	zone.Tol_Barad_Peninsula = 709	
	zone.Twilight_Highlands = 700	
	zone.Undercity = 382	
	zone.Vashjir = 613	
	zone.W_Plaguelands = 22	
	zone.Westfall = 39	
	zone.Wetlands = 40	
		
	-- Outland	
	zone.Outland = 466	
	zone.Blades_Edge = 475	
	zone.Hellfire_Peninsula = 465	
	zone.Nagrand = 477	
	zone.Netherstorm = 479	
	zone.Shadowmoon_Valley = 473	
	zone.Shattrath_City = 481	
	zone.Terokkar_Forest = 478	
	zone.Zangarmarsh = 467	
		
	-- Northrend	
	zone.Northrend = 485	
	zone.Borean_Tundra = 486	
	zone.Crystalsong_Forest = 510	
	zone.Dalaran = 504	
	zone.Dragonblight = 488	
	zone.Grizzly_Hills = 490	
	zone.Howling_Fjord = 491	
	zone.Hrothgars_Landing = 541	
	zone.Icecrown = 492	
	zone.Sholazar_Basin = 493	
	zone.The_Storm_Peaks = 495	
	zone.Wintergrasp = 501	
	zone.ZulDrak = 496	
		
	-- The Maelstrom	
	zone.The_Maelstrom = 751	
	zone.Deepholm = 640	
	zone.Kezan = 605	
	zone.The_Lost_Isles = 544	
	zone.The_Maelstrom2 = 737	
	zone.The_Wandering_Isle = 808	
		
	-- Pandaria	
	zone.Pandaria = 862	
	zone.Dread_Wastes = 858	
	zone.Isle_of_Giants = 929	
	zone.Isle_of_Thunder = 928	
	zone.Krasarang_Wilds = 857	
	zone.Kun_Lai_Summit = 809	
	zone.Shrine_of_7_Stars = 905	
	zone.Shrine_of_2_Moons = 903	
	zone.The_Jade_Forest = 806	
	zone.The_Veiled_Stair = 873	
	zone.Timeless_Isle = 951	
	zone.Townlong_Steppes = 810	
	zone.Vale_of_Eternal_Blossoms = 811	
	zone.Valley_ot_FourvWind = 807	
		
	-- Draenor	
	zone.Draenor = 962	
	zone.Ashran = 978	
	zone.Frostfire_Ridge = 941	
	zone.Frostwall = 976	
	zone.Gorgrond = 949	
	zone.Lunarfall = 971	
	zone.Nagrand_WoD = 950	
	zone.Shadowmoon_Valley = 947	
	zone.Spires_of_Arak = 948	
	zone.Stormshield = 1009	
	zone.Talador = 946	
	zone.Tanaan_Jungle = 945	
	zone.TaJuAs_ot_Dark_Portal = 970	
	zone.Warspear = 1011	
		
	-- Battlegrounds	
	zone.Alterac_Valley = 401	
	zone.Arathi_Basin = 461	
	zone.Deepwind_Gorge = 935	
	zone.Eye_of_the_Storm = 482	
	zone.Isle_of_Conquest = 540	
	zone.Silvershard_Mines = 860	
	zone.Strand_ot_Ancients = 512	
	zone.Temple_of_Kotmogu = 856	
	zone.Battle_for_Gilneas = 736	
	zone.Twin_Peaks = 626	
	zone.Warsong_Gulch = 443	
		
	-- Scenarios	
	zone.A_Brewing_Storm = 878	
	zone.A_Little_Patience = 912	
	zone.Arena_of_Annihilation = 899	
	zone.Assault_on_Zanvess = 883	
	zone.Battle_ot_High_Seas = 940	
	zone.Blood_in_the_Snow = 939	
	zone.Brewmoon_Festival = 884	
	zone.Celestial_Tournament = 955	
	zone.C_of_Forgotten_Kings = 900	
	zone.Dagger_in_the_Dark = 914	
	zone.Da_He_of_Panda = 937	
	zone.Domination_Point_H = 920	
	zone.Greenstone_Village = 880	
	zone.Lions_Landing_A = 911	
	zone.Secrets_of_Ragefire = 938	
	zone.Theramores_Fall_A = 906	
	zone.Theramores_Fall_H = 851	
	zone.Unga_Ingoo = 882	
		
	-- Classic Dungeons	
	zone.Blackfathom_Deeps = 688	
	zone.Blackrock_Depths = 704	
	zone.Blackrock_Spire = 721	
	zone.Dire_Maul = 699	
	zone.Gnomeregan = 691	
	zone.Maraudon = 750	
	zone.Ragefire_Chasm = 680	
	zone.Razorfen_Downs = 760	
	zone.Razorfen_Kraul = 761	
	zone.Shadowfang_Keep = 764	
	zone.Stratholme = 765	
	zone.The_Deadmines = 756	
	zone.The_Stockade = 690	
	zone.Temple_of_AtalHakkar = 687	
	zone.Uldaman = 692	
	zone.Wailing_Caverns = 749	
	zone.ZulFarrak = 686	
		
	-- Classic Raids	
	zone.Blackwing_Lair = 755	
	zone.Molten_Core = 696	
	zone.Ruins_of_AhnQiraj = 717	
	zone.Temple_of_AhnQiraj = 766	
		
	-- Burning Crusade Dungeons	
	zone.Auchenai_Crypts = 722	
	zone.Hellfire_Ramparts = 797	
	zone.Magisters_Terrace = 798	
	zone.Mana_Tombs = 732	
	zone.O_Hills_Foothills = 734	
	zone.Sethekk_Halls = 723	
	zone.Shadow_Labyrinth = 724	
	zone.The_Arcatraz = 731	
	zone.The_Black_Morass = 733	
	zone.The_Blood_Furnace = 725	
	zone.The_Botanica = 729	
	zone.The_Mechanar = 730	
	zone.The_Shattered_Halls = 710	
	zone.The_Slave_Pens = 728	
	zone.The_Steamvault = 727	
	zone.The_Underbog = 726	
		
	-- Burning Crusade Raids	
	zone.Black_Temple = 796	
	zone.Gruuls_Lair = 776	
	zone.Hyjal_Summit = 775	
	zone.Karazhan = 799	
	zone.Magtheridons_Lair = 779	
	zone.Serpentshrine_Cavern = 780	
	zone.Sunwell_Plateau = 789	
	zone.The_Eye = 782	
		
	-- Wrath Dungeons	
	zone.Ahnkahet_T_O_Kingdom = 522	
	zone.Azjol_Nerub = 533	
	zone.DrakTharon_Keep = 534	
	zone.Gundrak = 530	
	zone.Halls_o_Lightning = 525	
	zone.Halls_of_Reflection = 603	
	zone.Halls_of_Stone = 526	
	zone.Pit_of_Saron = 602	
	zone.Culling_of_Stratholme = 521	
	zone.The_Forge_of_Souls = 601	
	zone.The_Nexus = 520	
	zone.The_Oculus = 528	
	zone.The_Violet_Hold = 536	
	zone.Trial_ot_Champion = 542	
	zone.Utgarde_Keep = 523	
	zone.Utgarde_Pinnacle = 524	
		
	-- Wrath Raids	
	zone.Icecrown_Citadel = 604	
	zone.Naxxramas = 535	
	zone.Onyxias_Lair = 718	
	zone.The_Eye_of_Eternity = 527	
	zone.The_Obsidian_Sanctum = 531	
	zone.The_Ruby_Sanctum = 609	
	zone.Trial_of_the_Crusader = 543	
	zone.Ulduar = 529	
	zone.Vault_of_Archavon = 532	
		
	-- Cataclysm Dungeons	
	zone.Blackrock_Caverns = 753	
	zone.End_Time = 820	
	zone.Grim_Batol = 757	
	zone.Halls_of_Origination = 759	
	zone.Hour_of_Twilight = 819	
	zone.Lost_City_of_thevTolvir = 747	
	zone.The_Stonecore = 768	
	zone.The_Vortex_Pinnacle = 769	
	zone.Throne_of_the_Tides = 767	
	zone.Well_of_Eternity = 816	
	zone.ZulAman = 781	
	zone.ZulGurub = 793	
		
	-- Cataclysm Raids	
	zone.Baradin_Hold = 752	
	zone.Blackwing_Descent = 754	
	zone.Dragon_Soul = 824	
	zone.Firelands = 800	
	zone.Bastion_of_Twilight = 758	
	zone.Throne_ot_Four_Winds = 773	
		
	-- Pandaria Dungeons	
	zone.Gate_of_the_Setting_Sun = 875	
	zone.MoguShan_Palace = 885	
	zone.Scarlet_Halls = 871	
	zone.Scarlet_Monastery = 874	
	zone.Scholomance = 898	
	zone.Shado_pan_Monastery = 877	
	zone.Siege_of_Niuzao_Temple = 887	
	zone.Stormstout_Brewery = 876	
	zone.Temple_ot_Jade_Serpen = 867	
		
	-- Pandaria Raids	
	zone.Heart_of_Fear = 897	
	zone.Mogushan_Vaults = 896	
	zone.Siege_of_Orgrimmar = 953	
	zone.Terrace_of_Endless_Spring = 886	
	zone.Throne_of_Thunder = 930	
		
	-- Draenor Dungeons	
	zone.Auchindoun = 984	
	zone.Bloodmaul_Slag_Mines = 964	
	zone.Grimrail_Depot = 993	
	zone.Iron_Docks = 987	
	zone.Shadowmoon_Burial_Grounds = 969	
	zone.Skyreach = 989	
	zone.The_Everbloom = 1008	
	zone.Up_Blackrock_Spire = 995	
		
	-- Draenor Raids	
	zone.Highmaul = 994	
	zone.Blackrock_Foundry = 988	
	zone.Hellfire_Citadel = 7545	
		
	local mob = {}	
		
	mob.t_mobs = 1	
	mob.o_bosses = 2	
	mob.a_bosses = 3	
	mob.p_boss = 4	
	mob.f_clear = 5	
	mob.a_unamed = 11	
	mob.a_named = 12	
	mob.bs_bucc = 13	
	mob.s_pirate = 14	
	mob.wastewander = 15	
	mob.a_vent_co = 16	
	-- mob.Mosh'Ogg_Spellcrafter	
	-- mob.Boulderfist_Ogre	
	-- mob.an_mobs	
	-- mob.ar_mobs	
	-- Quest	
	local Quest = {}	
		
	Quest.mc_cook_dq = 1	
	Quest.oc_cook_dq = 2	
	Quest.mc_fish_dq = 3	
	Quest.oc_fish_dq = 4	
	Quest.no_dq = 5	
	Quest.outd = 6	
	Quest.champ_tabard = 7	
	Quest.bp_quest_fac = 8	
	Quest.da_jewel_dq = 9	
		
	-- items	
	local items = {}	
		
	items.oc_comm_bad = 4	
	-- instance	
	local instance = {}	
		
	instance.spill_rep_dun = 1	
	instance.TBD = 2	
	instance.n_cat_inst = 3	
	instance.h_cat_inst = 4	
	-- ToBeDone	
	local ToBeDone = {}	
		
	ToBeDone.till_farm_rep = 1	
	ToBeDone.nswts = 2	
	ToBeDone.Max_n_d = 3	
	ToBeDone.max_ndq_is = 4

	--375
	if (FIZ_IsAlliance) then	
	-- Aliance Cities	
	-- Darnassus 69	
		FIZ:AddQuest(69, 4, 8, Quest.mc_cook_dq, 250, "nil", FIZ_LIMIT_TYPE_Cook)
		FIZ:AddQuest(69, 4, 8, Quest.oc_cook_dq, 65, "nil", FIZ_LIMIT_TYPE_Cook)
		FIZ:AddQuest(69, 4, 8, Quest.mc_fish_dq, 250, "nil", FIZ_LIMIT_TYPE_Fish)
		FIZ:AddQuest(69, 4, 8, Quest.oc_fish_dq, 65, "nil", FIZ_LIMIT_TYPE_Fish)
		FIZ:AddGeneral(69, 4, 8, "Max number of daily quests", 1500, "Max number of daily quests", "The max number of dallies is 5", nil, 0)
	---- spillover from Alterac Valley	
		FIZ:AddQuest(69, 4, 8, 7386, 18.75, {[17423] = 5})
		FIZ:AddQuest(69, 4, 8, 6881, 2.5, {[17423] = 1})
		FIZ:AddQuest(69, 4, 8, 6943, 10, {[17504] = 1})
		FIZ:AddQuest(69, 4, 8, 6942, 10, {[17502] = 1})
		FIZ:AddQuest(69, 4, 8, 6941, 10, {[17503] = 1})
		FIZ:AddQuest(69, 4, 8, 7027, 2.5)
		FIZ:AddQuest(69, 4, 8, 7026, 2.5, {[17643] = 1})
		FIZ:AddQuest(69, 4, 8, 6781, 2.5, {[17422] = 20})
	---- spillover from Other	
		FIZ:AddItems(69, 4, 8, 250, {[45714] = 1})
		FIZ:AddItems(69, 4, 8, 62.5, {["items.oc_comm_bad"] = 1})
		FIZ:AddSpell(69, 1, 8, "Quest.no_dq", 1000)
	-- Exodar 930	
		FIZ:AddQuest(930, 4, 8, Quest.oc_cook_dq, 65, "nil", FIZ_LIMIT_TYPE_Cook)
		FIZ:AddQuest(930, 4, 8, Quest.oc_fish_dq, 65, "nil", FIZ_LIMIT_TYPE_Fish)
	---- spillover from Alterac Valley	
		FIZ:AddQuest(930, 4, 8, 7386, 18.75, {[17423] = 5})
		FIZ:AddQuest(930, 4, 8, 6881, 2.5, {[17423] = 1})
		FIZ:AddQuest(930, 4, 8, 6943, 10, {[17504] = 1})
		FIZ:AddQuest(930, 4, 8, 6942, 10, {[17502] = 1})
		FIZ:AddQuest(930, 4, 8, 6941, 10, {[17503] = 1})
		FIZ:AddQuest(930, 4, 8, 7027, 2.5)
		FIZ:AddQuest(930, 4, 8, 7026, 2.5, {[17643] = 1})
		FIZ:AddQuest(930, 4, 8, 6781, 2.5, {[17422] = 20})
	---- spillover from Other	
		FIZ:AddItems(930, 4, 8, 250, {[45715] = 1})
		FIZ:AddItems(930, 4, 8, 62.5, {["items.oc_comm_bad"] = 1})
		FIZ:AddSpell(930, 1, 8, "Quest.no_dq", 1000)
	-- Gnomeregan 54	
		FIZ:AddQuest(54, 4, 8, Quest.oc_cook_dq, 65, "nil", FIZ_LIMIT_TYPE_Cook)
		FIZ:AddQuest(54, 4, 8, Quest.oc_fish_dq, 65, "nil", FIZ_LIMIT_TYPE_Fish)
	---- spillover from Alterac Valley	
		FIZ:AddQuest(54, 4, 8, 7386, 18.75, {[17423] = 5})
		FIZ:AddQuest(54, 4, 8, 6881, 2.5, {[17423] = 1})
		FIZ:AddQuest(54, 4, 8, 6943, 10, {[17504] = 1})
		FIZ:AddQuest(54, 4, 8, 6942, 10, {[17502] = 1})
		FIZ:AddQuest(54, 4, 8, 6941, 10, {[17503] = 1})
		FIZ:AddQuest(54, 4, 8, 7027, 2.5)
		FIZ:AddQuest(54, 4, 8, 7026, 2.5, {[17643] = 1})
		FIZ:AddQuest(54, 4, 8, 6781, 2.5, {[17422] = 20})
	---- spillover from Other	
		FIZ:AddItems(54, 4, 8, 250, {[45716] = 1})
		FIZ:AddItems(54, 4, 8, 62.5, {["items.oc_comm_bad"] = 1})
		FIZ:AddSpell(54, 1, 8, "Quest.no_dq", 1000)
	-- Ironforge 47	
		FIZ:AddQuest(47, 4, 8, Quest.mc_cook_dq, 250, "nil", FIZ_LIMIT_TYPE_Cook)
		FIZ:AddQuest(47, 4, 8, Quest.oc_cook_dq, 65, "nil", FIZ_LIMIT_TYPE_Cook)
		FIZ:AddQuest(47, 4, 8, Quest.mc_fish_dq, 250, "nil", FIZ_LIMIT_TYPE_Fish)
		FIZ:AddQuest(47, 4, 8, Quest.oc_fish_dq, 65, "nil", FIZ_LIMIT_TYPE_Fish)
	---- spillover from Alterac Valley	
		FIZ:AddQuest(47, 4, 8, 7386, 18.75, {[17423] = 5})
		FIZ:AddQuest(47, 4, 8, 6881, 2.5, {[17423] = 1})
		FIZ:AddQuest(47, 4, 8, 6943, 10, {[17504] = 1})
		FIZ:AddQuest(47, 4, 8, 6942, 10, {[17502] = 1})
		FIZ:AddQuest(47, 4, 8, 6941, 10, {[17503] = 1})
		FIZ:AddQuest(47, 4, 8, 7027, 2.5)
		FIZ:AddQuest(47, 4, 8, 7026, 2.5, {[17643] = 1})
		FIZ:AddQuest(47, 4, 8, 6781, 2.5, {[17422] = 20})
	---- spillover from Other	
		FIZ:AddItems(47, 4, 8, 250, {[45717] = 1})
		FIZ:AddItems(47, 4, 8, 62.5, {["items.oc_comm_bad"] = 1})
		FIZ:AddSpell(47, 1, 8, "Quest.no_dq", 1000)
	-- Stormwind 72	
		FIZ:AddQuest(72, 4, 8, Quest.mc_cook_dq, 250, "nil", FIZ_LIMIT_TYPE_Cook)
		FIZ:AddQuest(72, 4, 8, Quest.oc_cook_dq, 65, "nil", FIZ_LIMIT_TYPE_Cook)
		FIZ:AddQuest(72, 4, 8, Quest.mc_fish_dq, 250, "nil", FIZ_LIMIT_TYPE_Fish)
		FIZ:AddQuest(72, 4, 8, Quest.oc_fish_dq, 65, "nil", FIZ_LIMIT_TYPE_Fish)
	---- spillover from Alterac Valley	
		FIZ:AddQuest(72, 4, 8, 7386, 18.75, {[17423] = 5})
		FIZ:AddQuest(72, 4, 8, 6881, 2.5, {[17423] = 1})
		FIZ:AddQuest(72, 4, 8, 6943, 10, {[17504] = 1})
		FIZ:AddQuest(72, 4, 8, 6942, 10, {[17502] = 1})
		FIZ:AddQuest(72, 4, 8, 6941, 10, {[17503] = 1})
		FIZ:AddQuest(72, 4, 8, 7027, 2.5)
		FIZ:AddQuest(72, 4, 8, 7026, 2.5, {[17643] = 1})
		FIZ:AddQuest(72, 4, 8, 6781, 2.5, {[17422] = 20})
	---- spillover from Other	
		FIZ:AddItems(72, 4, 8, 250, {[45718] = 1})
		FIZ:AddItems(72, 4, 8, 62.5, {["items.oc_comm_bad"] = 1})
		FIZ:AddSpell(72, 1, 8, "Quest.no_dq", 1000)
	-- Gilneas 1134	
		FIZ:AddQuest(1134, 4, 8, Quest.oc_cook_dq, 65, "nil", FIZ_LIMIT_TYPE_Cook)
		FIZ:AddQuest(1134, 4, 8, Quest.oc_fish_dq, 65, "nil", FIZ_LIMIT_TYPE_Fish)
	---- spillover from Alterac Valley	
	---- spillover from Other	
		FIZ:AddSpell(1134, 1, 8, "Quest.no_dq", 1000)
	-- Tushui Pandaren 1353	
		FIZ:AddQuest(1353, 4, 8, Quest.oc_cook_dq, 65, "nil", FIZ_LIMIT_TYPE_Cook)
		FIZ:AddQuest(1353, 4, 8, Quest.oc_fish_dq, 65, "nil", FIZ_LIMIT_TYPE_Fish)
	---- spillover from Alterac Valley	
	---- spillover from Other	
		FIZ:AddSpell(1353, 1, 8, "Quest.no_dq", 1000)
	-- Northrend (WotLK)	
	-- Silverwing Sentinels 890	
		FIZ:AddInstance(890, 4, 8, zone.Warsong_Gulch, 35)
		FIZ:AddInstance(890, 4, 8, zone.Warsong_Gulch, 105)
	-- Stormpike Guard 730	
		FIZ:AddQuest(730, 4, 8, 7386, 18.75, {[17423] = 5})
		FIZ:AddQuest(730, 4, 8, 6881, 2.5, {[17423] = 1})
		FIZ:AddQuest(730, 4, 8, 6941, 10, {[17503] = 1})
		FIZ:AddQuest(730, 4, 8, 6942, 10, {[17502] = 1})
		FIZ:AddQuest(730, 4, 8, 6941, 10, {[17503] = 1})
		FIZ:AddQuest(730, 4, 8, 7027, 2.5)
		FIZ:AddQuest(730, 4, 8, 7026, 2.5, {[17643] = 1})
		FIZ:AddQuest(730, 4, 8, 6781, 2.5, {[17422] = 20})
	-- The League of Arathor 509	
		FIZ:AddInstance(509, 4, 8, zone.Arathi_Basin, 10)
		FIZ:AddInstance(509, 4, 8, zone.Arathi_Basin, 100)
	-- Bizmo's Brawlpub 1419	
		FIZ:AddQuest(1419, 1, 8, Quest.no_dq, 1)
	-- Outland (burning crusade)	
	-- Wintersaber Trainers 589	
		FIZ:AddQuest(589, 4, 8, 29037, 1500)
		FIZ:AddQuest(589, 4, 8, 29035, 1500)
		FIZ:AddQuest(589, 4, 8, 29038, 1500)
		FIZ:AddQuest(589, 4, 8, 29040, 1500)
	-- Honor Hold 946	
		FIZ:AddInstance(946, 4, 5, zone.Hellfire_Ramparts, 600, false)
		FIZ:AddInstance(946, 6, 8, zone.Hellfire_Ramparts, 2000, true)
		FIZ:AddInstance(946, 4, 5, zone.The_Blood_Furnace, 750, false)
		FIZ:AddInstance(946, 6, 8, zone.The_Blood_Furnace, 2700, true)
		FIZ:AddInstance(946, 4, 8, zone.The_Shattered_Halls, 1600, false)
		FIZ:AddInstance(946, 4, 8, zone.The_Shattered_Halls, 2900, true)
		FIZ:AddMob(946, 4, 7, "MoshOgg Spellcrafter", 5, zone.The_Shattered_Halls)
		FIZ:AddMob(946, 4, 8, "MoshOgg Spellcrafter", 15, zone.The_Shattered_Halls)
		FIZ:AddQuest(946, 4, 7, 13410, 150)
	-- Kurenai 978	
		FIZ:AddQuest(978, 4, 8, 10476, 500, {[25433] = 10})
		FIZ:AddQuest(978, 4, 8, 11502, 500)
		FIZ:AddMob(978, 3, 8, "Boulderfist ogres", 10, zone.Nagrand)
		FIZ:AddMob(978, 3, 8, "Kil'sorrow Deathsworn, Cultist & Spellbinder", 10, zone.Nagrand)
		FIZ:AddMob(978, 3, 8, "Murkblood Scavenger", 2, zone.Nagrand)
		FIZ:AddMob(978, 3, 8, "Murkblood ", 10, zone.Nagrand)
		FIZ:AddMob(978, 3, 8, "Warmaul non-elite", 10, zone.Nagrand)
	-- Northrend (WotLK)	
	-- Alliance Vanguard 1037	
	---- spillover from 1068.5	
		FIZ:AddQuest(1037, 4, 8, 11391, 62.5)
	---- spillover from 1126.5	
		FIZ:AddQuest(1037, 4, 8, 12869, 62.5)
	---- spillover from 1094.5	
		FIZ:AddQuest(1037, 4, 8, 13757, 62.5, {[44981] = 1})
		FIZ:AddQuest(1037, 4, 8, 13759, 62.5)
		FIZ:AddQuest(1037, 4, 8, 13769, 62.5)
		FIZ:AddQuest(1037, 4, 8, 13857, 62.5)
		FIZ:AddQuest(1037, 4, 8, 13671, 62.5)
		FIZ:AddQuest(1037, 4, 8, 13625, 62.5)
		FIZ:AddQuest(1037, 4, 8, 13772, 62.5)
		FIZ:AddQuest(1037, 4, 8, 13772, 62.5)
	---- spillover from 1050.5	
		FIZ:AddQuest(1037, 4, 8, 11153, 62.5)
		FIZ:AddQuest(1037, 4, 8, 13309, 62.5)
		FIZ:AddQuest(1037, 4, 8, 13284, 62.5)
		FIZ:AddQuest(1037, 4, 8, 13336, 62.5)
		FIZ:AddQuest(1037, 4, 8, 13280, 62.5)
		FIZ:AddQuest(1037, 4, 8, 12444, 62.5)
		FIZ:AddQuest(1037, 4, 8, 12296, 62.5)
		FIZ:AddQuest(1037, 4, 8, 12289, 62.5)
		FIZ:AddQuest(1037, 4, 8, 12268, 62.5)
		FIZ:AddQuest(1037, 4, 8, 12244, 62.5)
	---- spillover from tournament	
		FIZ:AddQuest(1037, 4, 8, 13809, 125)
		FIZ:AddQuest(1037, 4, 8, 13810, 125)
		FIZ:AddQuest(1037, 4, 8, 13862, 125)
		FIZ:AddQuest(1037, 4, 8, 13811, 125)
	---- spillover from dungeon	
		FIZ:AddInstance(1037, 4, 8, instance.spill_rep_dun, 400, false)
		FIZ:AddInstance(1037, 4, 8, instance.spill_rep_dun, 800, true)
	-- Explorer's League 1068	
		FIZ:AddQuest(1068, 4, 8, 11391, 125)
	---- spillover from 1126.5	
		FIZ:AddQuest(1068, 4, 8, 12869, 62.5)
	---- spillover from 1094.5	
		FIZ:AddQuest(1068, 4, 8, 13757, 62.5, {[44981] = 1})
		FIZ:AddQuest(1068, 4, 8, 13759, 62.5)
		FIZ:AddQuest(1068, 4, 8, 13769, 62.5)
		FIZ:AddQuest(1068, 4, 8, 13857, 62.5)
		FIZ:AddQuest(1068, 4, 8, 13671, 62.5)
		FIZ:AddQuest(1068, 4, 8, 13625, 62.5)
		FIZ:AddQuest(1068, 4, 8, 13772, 62.5)
		FIZ:AddQuest(1068, 4, 8, 13772, 62.5)
	---- spillover from 1050.5	
		FIZ:AddQuest(1068, 4, 8, 11153, 62.5)
		FIZ:AddQuest(1068, 4, 8, 13309, 62.5)
		FIZ:AddQuest(1068, 4, 8, 13284, 62.5)
		FIZ:AddQuest(1068, 4, 8, 13336, 62.5)
		FIZ:AddQuest(1068, 4, 8, 13280, 62.5)
		FIZ:AddQuest(1068, 4, 8, 12444, 62.5)
		FIZ:AddQuest(1068, 4, 8, 12296, 62.5)
		FIZ:AddQuest(1068, 4, 8, 12289, 62.5)
		FIZ:AddQuest(1068, 4, 8, 12268, 62.5)
		FIZ:AddQuest(1068, 4, 8, 12244, 62.5)
	---- spillover from tournament	
		FIZ:AddQuest(1068, 4, 8, 13809, 125)
		FIZ:AddQuest(1068, 4, 8, 13810, 125)
		FIZ:AddQuest(1068, 4, 8, 13862, 125)
		FIZ:AddQuest(1068, 4, 8, 13811, 125)
	---- spillover from dungeon	
		FIZ:AddInstance(1068, 4, 8, instance.spill_rep_dun, 400, false)
		FIZ:AddInstance(1068, 4, 8, instance.spill_rep_dun, 800, true)
	-- The Frostborn 1126	
		FIZ:AddQuest(1126, 4, 8, 12869, 125)
	---- spillover from 1068.5	
		FIZ:AddQuest(1126, 4, 8, 11391, 62.5)
	---- spillover from 1094.5	
		FIZ:AddQuest(1126, 4, 8, 13757, 62.5, {[44981] = 1})
		FIZ:AddQuest(1126, 4, 8, 13759, 62.5)
		FIZ:AddQuest(1126, 4, 8, 13769, 62.5)
		FIZ:AddQuest(1126, 4, 8, 13857, 62.5)
		FIZ:AddQuest(1126, 4, 8, 13671, 62.5)
		FIZ:AddQuest(1126, 4, 8, 13625, 62.5)
		FIZ:AddQuest(1126, 4, 8, 13772, 62.5)
		FIZ:AddQuest(1126, 4, 8, 13772, 62.5)
	---- spillover from 1050.5	
		FIZ:AddQuest(1126, 4, 8, 11153, 62.5)
		FIZ:AddQuest(1126, 4, 8, 13309, 62.5)
		FIZ:AddQuest(1126, 4, 8, 13284, 62.5)
		FIZ:AddQuest(1126, 4, 8, 13336, 62.5)
		FIZ:AddQuest(1126, 4, 8, 13280, 62.5)
		FIZ:AddQuest(1126, 4, 8, 12444, 62.5)
		FIZ:AddQuest(1126, 4, 8, 12296, 62.5)
		FIZ:AddQuest(1126, 4, 8, 12289, 62.5)
		FIZ:AddQuest(1126, 4, 8, 12268, 62.5)
		FIZ:AddQuest(1126, 4, 8, 12244, 62.5)
	---- spillover from tournament	
		FIZ:AddQuest(1126, 4, 8, 13809, 125)
		FIZ:AddQuest(1126, 4, 8, 13810, 125)
		FIZ:AddQuest(1126, 4, 8, 13862, 125)
		FIZ:AddQuest(1126, 4, 8, 13811, 125)
	---- spillover from dungeon	
		FIZ:AddInstance(1126, 4, 8, instance.spill_rep_dun, 400, false)
		FIZ:AddInstance(1126, 4, 8, instance.spill_rep_dun, 800, true)
	-- The Silver Covenant 1094	
		FIZ:AddQuest(1094, 4, 8, 13757, 125, {[44981] = 1})
		FIZ:AddQuest(1094, 4, 8, 13759, 125)
		FIZ:AddQuest(1094, 4, 8, 13769, 125)
		FIZ:AddQuest(1094, 4, 8, 13857, 125)
		FIZ:AddQuest(1094, 4, 8, 13671, 125)
		FIZ:AddQuest(1094, 4, 8, 13625, 125)
		FIZ:AddQuest(1094, 4, 8, 13772, 125)
		FIZ:AddQuest(1094, 4, 8, 13772, 125)
	---- spillover from 1068.5	
		FIZ:AddQuest(1094, 4, 8, 11391, 62.5)
	---- spillover from 1126.5	
		FIZ:AddQuest(1094, 4, 8, 12869, 62.5)
	---- spillover from 1050.5	
		FIZ:AddQuest(1094, 4, 8, 11153, 62.5)
		FIZ:AddQuest(1094, 4, 8, 13309, 62.5)
		FIZ:AddQuest(1094, 4, 8, 13284, 62.5)
		FIZ:AddQuest(1094, 4, 8, 13336, 62.5)
		FIZ:AddQuest(1094, 4, 8, 13280, 62.5)
		FIZ:AddQuest(1094, 4, 8, 12444, 62.5)
		FIZ:AddQuest(1094, 4, 8, 12296, 62.5)
		FIZ:AddQuest(1094, 4, 8, 12289, 62.5)
		FIZ:AddQuest(1094, 4, 8, 12268, 62.5)
		FIZ:AddQuest(1094, 4, 8, 12244, 62.5)
	---- spillover from tournament	
		FIZ:AddQuest(1094, 4, 8, 13809, 125)
		FIZ:AddQuest(1094, 4, 8, 13810, 125)
		FIZ:AddQuest(1094, 4, 8, 13862, 125)
		FIZ:AddQuest(1094, 4, 8, 13811, 125)
	---- spillover from dungeon	
		FIZ:AddInstance(1094, 4, 8, instance.spill_rep_dun, 400, false)
		FIZ:AddInstance(1094, 4, 8, instance.spill_rep_dun, 800, true)
	-- Valiance Expedition 1050	
		FIZ:AddQuest(1050, 4, 8, 11153, 125)
		FIZ:AddQuest(1050, 4, 8, 13309, 125)
		FIZ:AddQuest(1050, 4, 8, 13284, 125)
		FIZ:AddQuest(1050, 4, 8, 13336, 125)
		FIZ:AddQuest(1050, 4, 8, 13280, 125)
		FIZ:AddQuest(1050, 4, 8, 12444, 125)
		FIZ:AddQuest(1050, 4, 8, 12296, 125)
		FIZ:AddQuest(1050, 4, 8, 12289, 125)
		FIZ:AddQuest(1050, 4, 8, 12268, 125)
		FIZ:AddQuest(1050, 4, 8, 12244, 125)
	---- spillover from 1068.5	
		FIZ:AddQuest(1050, 4, 8, 11391, 62.5)
	---- spillover from 1126.5	
		FIZ:AddQuest(1050, 4, 8, 12869, 62.5)
	---- spillover from 1094.5	
		FIZ:AddQuest(1050, 4, 8, 13757, 62.5, {[44981] = 1})
		FIZ:AddQuest(1050, 4, 8, 13759, 62.5)
		FIZ:AddQuest(1050, 4, 8, 13769, 62.5)
		FIZ:AddQuest(1050, 4, 8, 13857, 62.5)
		FIZ:AddQuest(1050, 4, 8, 13671, 62.5)
		FIZ:AddQuest(1050, 4, 8, 13625, 62.5)
		FIZ:AddQuest(1050, 4, 8, 13772, 62.5)
		FIZ:AddQuest(1050, 4, 8, 13772, 62.5)
	---- spillover from tournament	
		FIZ:AddQuest(1050, 4, 8, 13809, 125)
		FIZ:AddQuest(1050, 4, 8, 13810, 125)
		FIZ:AddQuest(1050, 4, 8, 13862, 125)
		FIZ:AddQuest(1050, 4, 8, 13811, 125)
	---- spillover from dungeon	
		FIZ:AddInstance(1050, 4, 8, instance.spill_rep_dun, 400, false)
		FIZ:AddInstance(1050, 4, 8, instance.spill_rep_dun, 800, true)
	-- Cataclysm	
	-- Wildhammer Clan 1174	
	---- from zone Twilight Highlands	
		FIZ:AddQuest(1174, 4, 8, 28864, 250)
		FIZ:AddQuest(1174, 4, 8, 28861, 250)
		FIZ:AddQuest(1174, 4, 8, 28860, 250)
		FIZ:AddQuest(1174, 4, 8, 28862, 250)
		FIZ:AddQuest(1174, 4, 8, 28863, 350)
		FIZ:AddSpell(1174, 1, 8, "Quest.no_dq", 1000)
		FIZ:AddSpell(1174, 1, 8, "Quest.no_dq", 1800)
		FIZ:AddMob(1174, 1, 8, mob.t_mobs, 10, 3)
		FIZ:AddMob(1174, 1, 8, mob.t_mobs, 15, 4)
		FIZ:AddMob(1174, 1, 8, mob.a_bosses, 150, 3)
		FIZ:AddMob(1174, 1, 8, mob.a_bosses, 250, 4)
	-- Baradin's Wardens 1177	
	---- from zone Tol Barad	
	------ Tol Barad Peninsula	
	-------- Base Quests	
		FIZ:AddQuest(1177, 4, 8, 28122, 250)
		FIZ:AddQuest(1177, 4, 8, 28658, 250)
		FIZ:AddQuest(1177, 4, 8, 28659, 250)
	-------- Left Prison	
		FIZ:AddQuest(1177, 4, 8, 28665, 350)
		FIZ:AddQuest(1177, 4, 8, 28663, 350)
		FIZ:AddQuest(1177, 4, 8, 28664, 350)
	-------- Right Prison	
		FIZ:AddQuest(1177, 4, 8, 28660, 350)
		FIZ:AddQuest(1177, 4, 8, 28662, 350)
		FIZ:AddQuest(1177, 4, 8, 28661, 250)
	-------- South Prison	
		FIZ:AddQuest(1177, 4, 8, 28670, 250)
		FIZ:AddQuest(1177, 4, 8, 28668, 350)
		FIZ:AddQuest(1177, 4, 8, 28669, 350)
	------ Tol Barad Main	
	-------- Set 1	
		FIZ:AddQuest(1177, 4, 8, 28275, 250)
		FIZ:AddQuest(1177, 4, 8, 28698, 250)
		FIZ:AddQuest(1177, 4, 8, 28697, 250)
		FIZ:AddQuest(1177, 4, 8, 28700, 250)
		FIZ:AddQuest(1177, 4, 8, 28695, 250)
		FIZ:AddQuest(1177, 4, 8, 28694, 250)
	-------- Set 2	
		FIZ:AddQuest(1177, 4, 8, 28682, 250)
		FIZ:AddQuest(1177, 4, 8, 28685, 250)
		FIZ:AddQuest(1177, 4, 8, 28686, 250)
		FIZ:AddQuest(1177, 4, 8, 28687, 250)
		FIZ:AddQuest(1177, 4, 8, 28721, 250)
	-------- Set 3	
		FIZ:AddQuest(1177, 4, 8, 28684, 250)
		FIZ:AddQuest(1177, 4, 8, 28680, 250)
		FIZ:AddQuest(1177, 4, 8, 28678, 250)
		FIZ:AddQuest(1177, 4, 8, 28679, 250)
		FIZ:AddQuest(1177, 4, 8, 28681, 350)
		FIZ:AddQuest(1177, 4, 8, 28683, 250)
	-------- Set 4	
		FIZ:AddQuest(1177, 4, 8, 28693, 250)
		FIZ:AddQuest(1177, 4, 8, 28691, 250)
		FIZ:AddQuest(1177, 4, 8, 28692, 250)
		FIZ:AddQuest(1177, 4, 8, 28690, 250)
		FIZ:AddQuest(1177, 4, 8, 28689, 250)
	-- Mist Of Panderia	
	-- Pearlfin Jinyu 1242	
		FIZ:AddQuest(1242, 1, 8, Quest.no_dq, 1)
	-- Operation: Shieldwall 1376	
		FIZ:AddQuest(1376, 1, 8, 32643, 400)
	---- Lion's Landing	
		FIZ:AddQuest(1376, 1, 8, 32148, 150)
		FIZ:AddQuest(1376, 1, 8, 32153, 300)
		FIZ:AddQuest(1376, 1, 8, 32149, 150)
		FIZ:AddQuest(1376, 1, 8, 32152, 150)
		FIZ:AddQuest(1376, 1, 8, 32150, 150)
		FIZ:AddQuest(1376, 1, 8, 32151, 150)
	---- Domination Point	
		FIZ:AddQuest(1376, 1, 8, 32143, 150)
		FIZ:AddQuest(1376, 1, 8, 32145, 300)
		FIZ:AddQuest(1376, 1, 8, 32146, 150)
		FIZ:AddQuest(1376, 1, 8, 32144, 300)
		FIZ:AddQuest(1376, 1, 8, 32142, 150)
	---- Ruins of Ogudei	
		FIZ:AddQuest(1376, 1, 8, 32347, 150)
		FIZ:AddQuest(1376, 1, 8, 32119, 150)
		FIZ:AddQuest(1376, 1, 8, 32122, 300)
		FIZ:AddQuest(1376, 1, 8, 32346, 150)
		FIZ:AddQuest(1376, 1, 8, 32115, 150)
		FIZ:AddQuest(1376, 1, 8, 32121, 150)
	---- Bilgewater Beach	
		FIZ:AddQuest(1376, 1, 8, 32154, 150)
		FIZ:AddQuest(1376, 1, 8, 32155, 150)
		FIZ:AddQuest(1376, 1, 8, 32159, 150)
		FIZ:AddQuest(1376, 1, 8, 32446, 150)
		FIZ:AddQuest(1376, 1, 8, 32157, 150)
		FIZ:AddQuest(1376, 1, 8, 32156, 150)
		FIZ:AddQuest(1376, 1, 8, 32158, 300)
		FIZ:AddQuest(1376, 1, 8, 32433, 150)
	---- Beastmaster Quests	
	------ Huntsman Blake	
		FIZ:AddQuest(1376, 1, 8, 32172, 200)
		FIZ:AddQuest(1376, 1, 8, 32170, 200)
		FIZ:AddQuest(1376, 1, 8, 32171, 200)
	-- Isle of Thunder	
	-- Kirin Tor Offensive 1387	
		FIZ:AddQuest(1387, 1, 8, 32943, 400)
		FIZ:AddQuest(1387, 4, 8, 32571, 150)
		FIZ:AddQuest(1387, 4, 8, 32558, 150)
		FIZ:AddQuest(1387, 4, 8, 32578, 200)
		FIZ:AddQuest(1387, 4, 8, 32525, 150)
		FIZ:AddQuest(1387, 4, 8, 32485, 150)
		FIZ:AddQuest(1387, 4, 8, 32634, 150)
		FIZ:AddQuest(1387, 4, 8, 32636, 150)
		FIZ:AddQuest(1387, 4, 8, 32555, 150)
		FIZ:AddQuest(1387, 4, 8, 32627, 150)
		FIZ:AddQuest(1387, 4, 8, 32576, 200)
		FIZ:AddQuest(1387, 4, 8, 32551, 150)
		FIZ:AddQuest(1387, 4, 8, 32543, 150)
		FIZ:AddQuest(1387, 4, 8, 32539, 150)
		FIZ:AddQuest(1387, 4, 8, 32537, 150)
		FIZ:AddQuest(1387, 4, 8, 32639, 150)
		FIZ:AddQuest(1387, 4, 8, 32554, 150)
		FIZ:AddQuest(1387, 4, 8, 32553, 150)
		FIZ:AddQuest(1387, 4, 8, 32585, 200)
		FIZ:AddQuest(1387, 4, 8, 32573, 150)
		FIZ:AddQuest(1387, 4, 8, 32635, 150)
		FIZ:AddQuest(1387, 4, 8, 32559, 150)
		FIZ:AddQuest(1387, 4, 8, 32607, 400)
		FIZ:AddQuest(1387, 4, 8, 32724, 200)
		FIZ:AddQuest(1387, 4, 8, 32570, 150)
		FIZ:AddQuest(1387, 4, 8, 32527, 150)
		FIZ:AddQuest(1387, 4, 8, 32540, 150)
		FIZ:AddQuest(1387, 4, 8, 32538, 150)
		FIZ:AddQuest(1387, 4, 8, 32631, 200)
		FIZ:AddQuest(1387, 4, 8, 32581, 200)
		FIZ:AddQuest(1387, 4, 8, 32528, 150)
		FIZ:AddQuest(1387, 4, 8, 32546, 150)
		FIZ:AddQuest(1387, 4, 8, 32560, 150)
		FIZ:AddQuest(1387, 4, 8, 32548, 150)
		FIZ:AddQuest(1387, 4, 8, 32552, 150)
		FIZ:AddQuest(1387, 4, 8, 32632, 150)
		FIZ:AddQuest(1387, 4, 8, 32638, 150)
		FIZ:AddQuest(1387, 4, 8, 32536, 150)
		FIZ:AddQuest(1387, 4, 8, 32586, 150)
		FIZ:AddQuest(1387, 4, 8, 32301, 150)
		FIZ:AddQuest(1387, 4, 8, 32588, 150)
		FIZ:AddQuest(1387, 4, 8, 32557, 150)
		FIZ:AddQuest(1387, 4, 8, 32637, 150)
		FIZ:AddQuest(1387, 4, 8, 32541, 150)
		FIZ:AddQuest(1387, 4, 8, 32544, 150)
		FIZ:AddQuest(1387, 4, 8, 32701, 1850)
		FIZ:AddQuest(1387, 4, 8, 32703, 1900)
		FIZ:AddQuest(1387, 4, 8, 32704, 2150)
		FIZ:AddQuest(1387, 4, 8, 32700, 1250)
		FIZ:AddQuest(1387, 4, 8, 32608, 400)
		FIZ:AddQuest(1387, 4, 8, 32582, 200)
		FIZ:AddQuest(1387, 4, 8, 32723, 350)
		FIZ:AddQuest(1387, 4, 8, 32532, 150)
		FIZ:AddQuest(1387, 4, 8, 32550, 150)
		FIZ:AddQuest(1387, 4, 8, 32526, 150)
		FIZ:AddQuest(1387, 4, 8, 32633, 150)
		FIZ:AddQuest(1387, 4, 8, 32533, 150)
		FIZ:AddQuest(1387, 4, 8, 32606, 150)
		FIZ:AddQuest(1387, 4, 8, 32542, 150)
		FIZ:AddQuest(1387, 4, 8, 32628, 150)
		FIZ:AddQuest(1387, 4, 8, 32530, 150)
		FIZ:AddQuest(1387, 4, 8, 32529, 150)
		FIZ:AddQuest(1387, 4, 8, 32531, 150)
		FIZ:AddQuest(1387, 4, 8, 32547, 150)
		FIZ:AddQuest(1387, 4, 8, 32556, 150)
		FIZ:AddQuest(1387, 4, 8, 32545, 150)
		FIZ:AddQuest(1387, 4, 8, 32574, 150)
		FIZ:AddQuest(1387, 4, 8, 32535, 150)
		FIZ:AddQuest(1387, 4, 8, 32572, 150)
		FIZ:AddQuest(1387, 4, 8, 32575, 150)
		FIZ:AddQuest(1387, 4, 8, 32583, 200)
	-- Warlords of Draenor	
	-- Council of Exarchs 1731	
		FIZ:AddMob(1731, 1, 7, "Invasive Shambler", 500, zone.Talador)
		FIZ:AddMob(1731, 1, 7, "Phantom Pearltusk", 500, zone.Shadowmoon_Valley)
		FIZ:AddMob(1731, 1, 7, "Searing Ravager", 500, zone.Talador)
		FIZ:AddMob(1731, 1, 8, "Malgosh Shadowkeeper", 50, zone.Shadowmoon_Valley)
		FIZ:AddMob(1731, 1, 8, "Sargerei Demonlord", 16, zone.Shadowmoon_Valley)
		FIZ:AddMob(1731, 1, 8, "Void Beast", 16, zone.Spires_of_Arak)
		FIZ:AddMob(1731, 1, 8, "Void Spawn", 16, zone.Spires_of_Arak)
		FIZ:AddMob(1731, 1, 8, "Darkwing Rider", 8, zone.Shadowmoon_Valley)
		FIZ:AddMob(1731, 1, 8, "Eldermoss", 8, zone.Shadowmoon_Valley)
		FIZ:AddMob(1731, 1, 8, "Invokaz", 8, zone.Shadowmoon_Valley)
		FIZ:AddMob(1731, 1, 8, "Nightshade Consort", 8, zone.Shadowmoon_Valley)
		FIZ:AddMob(1731, 1, 8, "Ra'ka Bloodspear", 8, zone.Shadowmoon_Valley)
		FIZ:AddMob(1731, 1, 8, "Razz Ricketroz ", 8, zone.Shadowmoon_Valley)
		FIZ:AddMob(1731, 1, 8, "Sargerei Darkblade", 8, zone.Shadowmoon_Valley)
		FIZ:AddMob(1731, 1, 8, "Shadowmoon Deathcaller", 8, zone.Spires_of_Arak)
		FIZ:AddMob(1731, 1, 8, "Soulbinder Zamaya", 8, zone.Shadowmoon_Valley)
		FIZ:AddMob(1731, 1, 8, "Darktide Pilferer", 5, zone.Shadowmoon_Valley)
		FIZ:AddMob(1731, 1, 8, "Darktide Rylakinator-3000", 5, zone.Shadowmoon_Valley)
		FIZ:AddMob(1731, 1, 8, "Darktide Windstalker", 5, zone.Shadowmoon_Valley)
		FIZ:AddMob(1731, 1, 8, "Darkwing Matron", 5, zone.Shadowmoon_Valley)
		FIZ:AddMob(1731, 1, 8, "Darkwing Whelpling", 5, zone.Shadowmoon_Valley)
		FIZ:AddMob(1731, 1, 8, "Eye of Zamaya", 5, zone.Shadowmoon_Valley)
		FIZ:AddMob(1731, 1, 8, "Injured Darkwing Glider", 5, zone.Shadowmoon_Valley)
		FIZ:AddMob(1731, 1, 8, "Iron Explosive", 5, zone.Shadowmoon_Valley)
		FIZ:AddMob(1731, 1, 8, "Iron Peon", 5, zone.Shadowmoon_Valley)
		FIZ:AddMob(1731, 1, 8, "Sargerei Acolyte", 5, zone.Shadowmoon_Valley)
		FIZ:AddMob(1731, 1, 8, "Sargerei Binder", 5, zone.Shadowmoon_Valley)
		FIZ:AddMob(1731, 1, 8, "Sargerei Demonspeaker", 5, zone.Shadowmoon_Valley)
		FIZ:AddMob(1731, 1, 8, "Sargerei Initiate", 5, zone.Shadowmoon_Valley)
		FIZ:AddMob(1731, 1, 8, "Sargerei Worker", 5, zone.Shadowmoon_Valley)
		FIZ:AddMob(1731, 1, 8, "Shadowglen Thornshooter", 5, zone.Shadowmoon_Valley)
		FIZ:AddMob(1731, 1, 8, "Shadowmoon Defiler", 5, zone.Spires_of_Arak)
		FIZ:AddMob(1731, 1, 8, "Shadowmoon Enslaver", 5, zone.Spires_of_Arak)
		FIZ:AddMob(1731, 1, 8, "Shadowmoon Void Augur", 5, zone.Spires_of_Arak)
		FIZ:AddMob(1731, 1, 8, "Shadowmoon Voidtwister", 5, zone.Spires_of_Arak)
		FIZ:AddMob(1731, 1, 8, "Shadowmoon Warrior", 5, zone.Spires_of_Arak)
		FIZ:AddMob(1731, 1, 8, "Skeletal Ancestor", 5, zone.Spires_of_Arak)
		FIZ:AddMob(1731, 1, 8, "Unmanned Darktide Rylakinator-3000", 5, zone.Shadowmoon_Valley)
		FIZ:AddMob(1731, 1, 8, "Urna Darkfathom", 5, zone.Spires_of_Arak)
		FIZ:AddMob(1731, 1, 8, "Void Aberration", 5, zone.Spires_of_Arak)
		FIZ:AddMob(1731, 1, 8, "Void Fragment", 5, zone.Shadowmoon_Valley)
		FIZ:AddMob(1731, 1, 8, "Void Fragment", 5, zone.Spires_of_Arak)
		FIZ:AddMob(1731, 1, 8, "Void Remnant", 5, zone.Shadowmoon_Valley)
		FIZ:AddMob(1731, 1, 8, "Darkwing Adolescent", 1, zone.Shadowmoon_Valley)
		FIZ:AddMob(1731, 1, 8, "Fel Imp", 1, zone.Shadowmoon_Valley)
		FIZ:AddMob(1731, 1, 8, "Imp Servant", 1, zone.Shadowmoon_Valley)
		FIZ:AddMob(1731, 1, 8, "Obedient Felhound", 1, zone.Shadowmoon_Valley)
		FIZ:AddMob(1731, 1, 8, "Reanimated Bones", 1, zone.Spires_of_Arak)
		FIZ:AddMob(1731, 1, 8, "Shadowglen Spitter", 1, zone.Shadowmoon_Valley)
		FIZ:AddMob(1731, 1, 8, "Shadowmoon Peon", 1, zone.Spires_of_Arak)
		FIZ:AddMob(1731, 1, 8, "Succubus", 1, zone.Shadowmoon_Valley)
	-- Sha'tari Defense 1710	
		FIZ:AddMob(1710, 1, 8, "Archmagus Tekar", 50, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Grom'kar Warbeast", 22, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Grom'kar Sharpshooter", 19, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Grom'kar Siegebreaker", 19, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Rune Ritualist", 16, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Sargerei Fiendmaster", 16, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Burning Eye", 8, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Burning Fiend", 8, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Concubine of Lust", 8, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Conniving Deathblade", 8, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Council Felcaller", 8, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Demon Guard", 8, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Felfire Elemental", 8, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Felfire Fiend", 8, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Marauding Destroyer", 8, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Nefarious Consort", 8, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Nefarious Madame", 8, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Sargerei Destructor", 8, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Sargerei Discordant", 8, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Sargerei Fiendspeaker", 8, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Sargerei Huntsman", 8, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Sargerei Ritualist", 8, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Sargerei Soulspewer", 8, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Shadowflame Fiend", 8, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Soul Guardian", 8, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Terrorwing Rider", 8, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Grom'kar Deadeye", 6, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Blazing Felhound", 5, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Concubine of Sin", 5, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Conniving Shadowblade", 5, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Council Soulspeaker", 5, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Fel Seer", 5, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Felchained Elemental", 5, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Felfire Batrider", 5, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Gorebound Insurgent", 5, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Grom'kar Blademaster", 5, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Grom'kar Bulwark", 5, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Grom'kar Deadeye", 5, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Grom'kar Punisher", 5, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Imp Charmer", 5, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Marauding Warder", 5, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Sargerei Felbringer", 5, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Sargerei Huntsman", 5, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Sargerei Soul-Twister", 5, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Sargerei Summoner", 5, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Shadowbourne Felcaster", 5, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Vicious Felhunter", 5, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Vicious Observer", 5, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Vicious Voidwalker", 5, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Fel Spark", 1, zone.Talador)
		FIZ:AddMob(1710, 1, 8, "Vicious Felhound", 1, zone.Talador)
	-- Wrynn's Vanguard 1682	
		FIZ:AddQuest(1682, 1, 8, 35689, 25)
		FIZ:AddQuest(1682, 1, 8, 35264, 125)
		FIZ:AddQuest(1682, 1, 8, 35639, 500)
	-- Hand of the Prophet 1847	
		FIZ:AddQuest(1847, 1, 8, 39568, 250)
		FIZ:AddQuest(1847, 1, 8, 37891, 250)
		FIZ:AddQuest(1847, 1, 8, 38440, 250)
		FIZ:AddQuest(1847, 1, 8, 38250, 250)
		FIZ:AddQuest(1847, 1, 8, 37968, 250)
		FIZ:AddQuest(1847, 1, 8, 38585, 250)
		FIZ:AddQuest(1847, 1, 8, 38046, 250)
		FIZ:AddQuest(1847, 1, 8, 38045, 250)
		FIZ:AddQuest(1847, 1, 8, 39567, 250)
		FIZ:AddQuest(1847, 1, 8, 39569, 250)
		FIZ:AddQuest(1847, 1, 8, 39586, 250)
		FIZ:AddQuest(1847, 1, 8, 39581, 250)
		FIZ:AddQuest(1847, 1, 8, 39573, 250)
		FIZ:AddQuest(1847, 1, 8, 39574, 250)
		FIZ:AddQuest(1847, 1, 8, 39570, 250)
	end	
	if (FIZ_IsHorde) then	
	-- Hord Cities	
	-- Darkspear Trolls 530	
		FIZ:AddQuest(530, 4, 8, Quest.oc_cook_dq, 65, "nil", FIZ_LIMIT_TYPE_Cook)
		FIZ:AddQuest(530, 4, 8, Quest.oc_fish_dq, 65, "nil", FIZ_LIMIT_TYPE_Fish)
	---- spillover from Alterac Valley	
		FIZ:AddQuest(530, 4, 8, 7385, 18.75, {[17306] = 5})
		FIZ:AddQuest(530, 4, 8, 6801, 2.5, {[17306] = 1})
		FIZ:AddQuest(530, 4, 8, 6825, 10, {[17326] = 1})
		FIZ:AddQuest(530, 4, 8, 6826, 10, {[17327] = 1})
		FIZ:AddQuest(530, 4, 8, 6827, 10, {[17328] = 1})
		FIZ:AddQuest(530, 4, 8, 7027, 2.5)
		FIZ:AddQuest(530, 4, 8, 7002, 2.5, {[17642] = 1})
		FIZ:AddQuest(530, 4, 8, 6741, 2.5, {[17422] = 20})
	---- spillover from Other	
		FIZ:AddItems(530, 4, 8, 250, {[45720] = 1})
		FIZ:AddItems(530, 4, 8, 62.5, {["items.oc_comm_bad"] = 1})
		FIZ:AddSpell(530, 1, 8, "Quest.no_dq", 1000)
	-- Orgrimmar 76	
		FIZ:AddQuest(76, 4, 8, Quest.mc_cook_dq, 250, "nil", FIZ_LIMIT_TYPE_Cook)
		FIZ:AddQuest(76, 4, 8, Quest.oc_cook_dq, 65, "nil", FIZ_LIMIT_TYPE_Cook)
		FIZ:AddQuest(76, 4, 8, Quest.mc_fish_dq, 250, "nil", FIZ_LIMIT_TYPE_Fish)
		FIZ:AddQuest(76, 4, 8, Quest.oc_fish_dq, 65, "nil", FIZ_LIMIT_TYPE_Fish)
	---- spillover from Alterac Valley	
		FIZ:AddQuest(76, 4, 8, 7385, 18.75, {[17306] = 5})
		FIZ:AddQuest(76, 4, 8, 6801, 2.5, {[17306] = 1})
		FIZ:AddQuest(76, 4, 8, 6825, 10, {[17326] = 1})
		FIZ:AddQuest(76, 4, 8, 6826, 10, {[17327] = 1})
		FIZ:AddQuest(76, 4, 8, 6827, 10, {[17328] = 1})
		FIZ:AddQuest(76, 4, 8, 7027, 2.5)
		FIZ:AddQuest(76, 4, 8, 7002, 2.5, {[17642] = 1})
		FIZ:AddQuest(76, 4, 8, 6741, 2.5, {[17422] = 20})
	---- spillover from Other	
		FIZ:AddItems(76, 4, 8, 250, {[45719] = 1})
		FIZ:AddItems(76, 4, 8, 62.5, {["items.oc_comm_bad"] = 1})
		FIZ:AddSpell(76, 1, 8, "Quest.no_dq", 1000)
	-- Silvermoon City 911	
		FIZ:AddQuest(911, 4, 8, Quest.oc_cook_dq, 65, "nil", FIZ_LIMIT_TYPE_Cook)
		FIZ:AddQuest(911, 4, 8, Quest.oc_fish_dq, 65, "nil", FIZ_LIMIT_TYPE_Fish)
	---- spillover from Alterac Valley	
		FIZ:AddQuest(911, 4, 8, 7385, 18.75, {[17306] = 5})
		FIZ:AddQuest(911, 4, 8, 6801, 2.5, {[17306] = 1})
		FIZ:AddQuest(911, 4, 8, 6825, 10, {[17326] = 1})
		FIZ:AddQuest(911, 4, 8, 6826, 10, {[17327] = 1})
		FIZ:AddQuest(911, 4, 8, 6827, 10, {[17328] = 1})
		FIZ:AddQuest(911, 4, 8, 7027, 2.5)
		FIZ:AddQuest(911, 4, 8, 7002, 2.5, {[17642] = 1})
		FIZ:AddQuest(911, 4, 8, 6741, 2.5, {[17422] = 20})
	---- spillover from Other	
		FIZ:AddItems(911, 4, 8, 250, {[45721] = 1})
		FIZ:AddItems(911, 4, 8, 62.5, {["items.oc_comm_bad"] = 1})
		FIZ:AddSpell(911, 1, 8, "Quest.no_dq", 1000)
	-- Thunder Bluff 81	
		FIZ:AddQuest(81, 4, 8, Quest.mc_cook_dq, 250, "nil", FIZ_LIMIT_TYPE_Cook)
		FIZ:AddQuest(81, 4, 8, Quest.oc_cook_dq, 65, "nil", FIZ_LIMIT_TYPE_Cook)
		FIZ:AddQuest(81, 4, 8, Quest.mc_fish_dq, 250, "nil", FIZ_LIMIT_TYPE_Fish)
		FIZ:AddQuest(81, 4, 8, Quest.oc_fish_dq, 65, "nil", FIZ_LIMIT_TYPE_Fish)
	---- spillover from Alterac Valley	
		FIZ:AddQuest(81, 4, 8, 7385, 18.75, {[17306] = 5})
		FIZ:AddQuest(81, 4, 8, 6801, 2.5, {[17306] = 1})
		FIZ:AddQuest(81, 4, 8, 6825, 10, {[17326] = 1})
		FIZ:AddQuest(81, 4, 8, 6826, 10, {[17327] = 1})
		FIZ:AddQuest(81, 4, 8, 6827, 10, {[17328] = 1})
		FIZ:AddQuest(81, 4, 8, 7027, 2.5)
		FIZ:AddQuest(81, 4, 8, 7002, 2.5, {[17642] = 1})
		FIZ:AddQuest(81, 4, 8, 6741, 2.5, {[17422] = 20})
	---- spillover from Other	
		FIZ:AddItems(81, 4, 8, 250, {[45722] = 1})
		FIZ:AddItems(81, 4, 8, 62.5, {["items.oc_comm_bad"] = 1})
		FIZ:AddSpell(81, 1, 8, "Quest.no_dq", 1000)
	-- Undercity 68	
		FIZ:AddQuest(68, 4, 8, Quest.mc_cook_dq, 250, "nil", FIZ_LIMIT_TYPE_Cook)
		FIZ:AddQuest(68, 4, 8, Quest.oc_cook_dq, 65, "nil", FIZ_LIMIT_TYPE_Cook)
		FIZ:AddQuest(68, 4, 8, Quest.mc_fish_dq, 250, "nil", FIZ_LIMIT_TYPE_Fish)
		FIZ:AddQuest(68, 4, 8, Quest.oc_fish_dq, 65, "nil", FIZ_LIMIT_TYPE_Fish)
	---- spillover from Alterac Valley	
		FIZ:AddQuest(68, 4, 8, 7385, 18.75, {[17306] = 5})
		FIZ:AddQuest(68, 4, 8, 6801, 2.5, {[17306] = 1})
		FIZ:AddQuest(68, 4, 8, 6825, 10, {[17326] = 1})
		FIZ:AddQuest(68, 4, 8, 6826, 10, {[17327] = 1})
		FIZ:AddQuest(68, 4, 8, 6827, 10, {[17328] = 1})
		FIZ:AddQuest(68, 4, 8, 7027, 2.5)
		FIZ:AddQuest(68, 4, 8, 7002, 2.5, {[17642] = 1})
		FIZ:AddQuest(68, 4, 8, 6741, 2.5, {[17422] = 20})
	---- spillover from Other	
		FIZ:AddItems(68, 4, 8, 250, {[45723] = 1})
		FIZ:AddItems(68, 4, 8, 62.5, {["items.oc_comm_bad"] = 1})
		FIZ:AddSpell(68, 1, 8, "Quest.no_dq", 1000)
	-- Bilgewater Cartel 1133	
		FIZ:AddQuest(1133, 4, 8, Quest.oc_cook_dq, 65, "nil", FIZ_LIMIT_TYPE_Cook)
		FIZ:AddQuest(1133, 4, 8, Quest.oc_fish_dq, 65, "nil", FIZ_LIMIT_TYPE_Fish)
	---- spillover from Alterac Valley	
	---- spillover from Other	
		FIZ:AddSpell(1133, 1, 8, "Quest.no_dq", 1000)
	-- Huojin Pandaren 1352	
		FIZ:AddQuest(1352, 4, 8, Quest.oc_cook_dq, 65, "nil", FIZ_LIMIT_TYPE_Cook)
		FIZ:AddQuest(1352, 4, 8, Quest.oc_fish_dq, 65, "nil", FIZ_LIMIT_TYPE_Fish)
	---- spillover from Alterac Valley	
	---- spillover from Other	
		FIZ:AddSpell(1352, 1, 8, "Quest.no_dq", 1000)
	-- Horde Forces	
	-- The Defilers 510	
		FIZ:AddInstance(510, 4, 8, zone.Warsong_Gulch, 35)
		FIZ:AddInstance(510, 4, 8, zone.Warsong_Gulch, 105)
	-- Frostwolf Clan 729	
		FIZ:AddQuest(729, 4, 8, 7385, 18.75, {[17306] = 5})
		FIZ:AddQuest(729, 4, 8, 6801, 2.5, {[17306] = 1})
		FIZ:AddQuest(729, 4, 8, 6825, 10, {[17326] = 1})
		FIZ:AddQuest(729, 4, 8, 6826, 10, {[17327] = 1})
		FIZ:AddQuest(729, 4, 8, 6827, 10, {[17328] = 1})
		FIZ:AddQuest(729, 4, 8, 7027, 2.5)
		FIZ:AddQuest(729, 4, 8, 7002, 2.5, {[17642] = 1})
		FIZ:AddQuest(729, 4, 8, 6741, 2.5, {[17422] = 20})
	-- Warsong Outriders 889	
		FIZ:AddInstance(889, 4, 8, zone.Arathi_Basin, 10)
		FIZ:AddInstance(889, 4, 8, zone.Arathi_Basin, 100)
	-- Brawl'gar Arena 1374	
		FIZ:AddQuest(1374, 1, 8, Quest.no_dq, 1)
	-- Outland (burning crusade)	
	-- Thrallmar 947	
		FIZ:AddInstance(947, 4, 5, zone.Hellfire_Ramparts, 600, false)
		FIZ:AddInstance(947, 6, 8, zone.Hellfire_Ramparts, 2000, true)
		FIZ:AddInstance(947, 4, 5, zone.The_Blood_Furnace, 750, false)
		FIZ:AddInstance(947, 6, 8, zone.The_Blood_Furnace, 2700, true)
		FIZ:AddMob(947, 4, 7, "zone.The_Blood_Furnace", 5, mob.t_mobs)
		FIZ:AddMob(947, 4, 8, "zone.The_Blood_Furnace", 15, mob.t_mobs)
		FIZ:AddInstance(947, 4, 8, zone.The_Shattered_Halls, 1600, false)
		FIZ:AddInstance(947, 4, 8, zone.The_Shattered_Halls, 2900, true)
		FIZ:AddMob(947, 4, 7, "MoshOgg Spellcrafter", 5, zone.The_Shattered_Halls)
		FIZ:AddMob(947, 4, 8, "MoshOgg Spellcrafter", 15, zone.The_Shattered_Halls)
		FIZ:AddQuest(947, 4, 7, 13410, 150)
	-- The Mag'har 941	
		FIZ:AddQuest(941, 4, 8, 10479, 500, {[25433] = 10})
		FIZ:AddQuest(941, 4, 8, 11503, 500)
		FIZ:AddMob(941, 3, 8, "Boulderfist ogres", 10, zone.Nagrand)
		FIZ:AddMob(941, 3, 8, "Kil'sorrow Deathsworn, Cultist & Spellbinder", 10, zone.Nagrand)
		FIZ:AddMob(941, 3, 8, "Murkblood Scavenger", 2, zone.Nagrand)
		FIZ:AddMob(941, 3, 8, "Murkblood ", 10, zone.Nagrand)
		FIZ:AddMob(941, 3, 8, "Warmaul non-elite", 10, zone.Nagrand)
	-- Tranquillien 922	
		FIZ:AddQuest(922, 4, 8, 9217, 500, {[22641] = 10})
		FIZ:AddQuest(922, 4, 8, 9219, 500, {[22642] = 10})
	-- Northrend (WotLK)	
	-- The Hand of Vengeance 1067	
	---- spillover from 1052	
		FIZ:AddQuest(1067, 4, 8, 12170, 62.5)
	---- spillover from 1124	
		FIZ:AddQuest(1067, 4, 8, 13757, 62.5, {[44981] = 1})
		FIZ:AddQuest(1067, 4, 8, 13625, 62.5)
		FIZ:AddQuest(1067, 4, 8, 13769, 62.5)
		FIZ:AddQuest(1067, 4, 8, 13772, 62.5)
		FIZ:AddQuest(1067, 4, 8, 13671, 62.5)
		FIZ:AddQuest(1067, 4, 8, 13759, 62.5)
		FIZ:AddQuest(1067, 4, 8, 13772, 62.5)
	---- spillover from 1085	
		FIZ:AddQuest(1067, 4, 8, 12284, 62.5)
		FIZ:AddQuest(1067, 4, 8, 12280, 62.5)
		FIZ:AddQuest(1067, 4, 8, 12288, 62.5)
		FIZ:AddQuest(1067, 4, 8, 12270, 62.5)
		FIZ:AddQuest(1067, 4, 8, 13309, 62.5)
		FIZ:AddQuest(1067, 4, 8, 13284, 62.5)
		FIZ:AddQuest(1067, 4, 8, 13336, 62.5)
		FIZ:AddQuest(1067, 4, 8, 13280, 62.5)
	---- spillover from tournament	
		FIZ:AddQuest(1067, 4, 8, 13809, 125)
		FIZ:AddQuest(1067, 4, 8, 13810, 125)
		FIZ:AddQuest(1067, 4, 8, 13862, 125)
		FIZ:AddQuest(1067, 4, 8, 13811, 125)
	---- spillover from dungeon	
		FIZ:AddInstance(1067, 4, 8, instance.spill_rep_dun, 400, false)
		FIZ:AddInstance(1067, 4, 8, instance.spill_rep_dun, 800, true)
	-- Horde Expedition 1052	
		FIZ:AddQuest(1052, 4, 8, 12170, 125)
	---- spillover from 1124	
		FIZ:AddQuest(1052, 4, 8, 13757, 62.5, {[44981] = 1})
		FIZ:AddQuest(1052, 4, 8, 13625, 62.5)
		FIZ:AddQuest(1052, 4, 8, 13769, 62.5)
		FIZ:AddQuest(1052, 4, 8, 13772, 62.5)
		FIZ:AddQuest(1052, 4, 8, 13671, 62.5)
		FIZ:AddQuest(1052, 4, 8, 13759, 62.5)
		FIZ:AddQuest(1052, 4, 8, 13772, 62.5)
	---- spillover from 1085	
		FIZ:AddQuest(1052, 4, 8, 12284, 62.5)
		FIZ:AddQuest(1052, 4, 8, 12280, 62.5)
		FIZ:AddQuest(1052, 4, 8, 12288, 62.5)
		FIZ:AddQuest(1052, 4, 8, 12270, 62.5)
		FIZ:AddQuest(1052, 4, 8, 13309, 62.5)
		FIZ:AddQuest(1052, 4, 8, 13284, 62.5)
		FIZ:AddQuest(1052, 4, 8, 13336, 62.5)
		FIZ:AddQuest(1052, 4, 8, 13280, 62.5)
	---- spillover from tournament	
		FIZ:AddQuest(1052, 4, 8, 13809, 125)
		FIZ:AddQuest(1052, 4, 8, 13810, 125)
		FIZ:AddQuest(1052, 4, 8, 13862, 125)
		FIZ:AddQuest(1052, 4, 8, 13811, 125)
	---- spillover from dungeon	
		FIZ:AddInstance(1052, 4, 8, instance.spill_rep_dun, 400, false)
		FIZ:AddInstance(1052, 4, 8, instance.spill_rep_dun, 800, true)
	-- The Sunreavers 1124	
		FIZ:AddQuest(1124, 4, 8, 13757, 125, {[44981] = 1})
		FIZ:AddQuest(1124, 4, 8, 13625, 125)
		FIZ:AddQuest(1124, 4, 8, 13769, 125)
		FIZ:AddQuest(1124, 4, 8, 13772, 125)
		FIZ:AddQuest(1124, 4, 8, 13671, 125)
		FIZ:AddQuest(1124, 4, 8, 13759, 125)
		FIZ:AddQuest(1124, 4, 8, 13772, 125)
	---- spillover from 1052	
		FIZ:AddQuest(1124, 4, 8, 12170, 62.5)
	---- spillover from 1085	
		FIZ:AddQuest(1124, 4, 8, 12284, 62.5)
		FIZ:AddQuest(1124, 4, 8, 12280, 62.5)
		FIZ:AddQuest(1124, 4, 8, 12288, 62.5)
		FIZ:AddQuest(1124, 4, 8, 12270, 62.5)
		FIZ:AddQuest(1124, 4, 8, 13309, 62.5)
		FIZ:AddQuest(1124, 4, 8, 13284, 62.5)
		FIZ:AddQuest(1124, 4, 8, 13336, 62.5)
		FIZ:AddQuest(1124, 4, 8, 13280, 62.5)
	---- spillover from tournament	
		FIZ:AddQuest(1124, 4, 8, 13809, 125)
		FIZ:AddQuest(1124, 4, 8, 13810, 125)
		FIZ:AddQuest(1124, 4, 8, 13862, 125)
		FIZ:AddQuest(1124, 4, 8, 13811, 125)
	---- spillover from dungeon	
		FIZ:AddInstance(1124, 4, 8, instance.spill_rep_dun, 400, false)
		FIZ:AddInstance(1124, 4, 8, instance.spill_rep_dun, 800, true)
	-- Warsong Offensive 1085	
		FIZ:AddQuest(1085, 4, 8, 12284, 125)
		FIZ:AddQuest(1085, 4, 8, 12280, 125)
		FIZ:AddQuest(1085, 4, 8, 12288, 125)
		FIZ:AddQuest(1085, 4, 8, 12270, 125)
		FIZ:AddQuest(1085, 4, 8, 13309, 125)
		FIZ:AddQuest(1085, 4, 8, 13284, 125)
		FIZ:AddQuest(1085, 4, 8, 13336, 125)
		FIZ:AddQuest(1085, 4, 8, 13280, 125)
	---- spillover from 1052	
		FIZ:AddQuest(1085, 4, 8, 12170, 62.5)
	---- spillover from 1124	
		FIZ:AddQuest(1085, 4, 8, 13757, 62.5, {[44981] = 1})
		FIZ:AddQuest(1085, 4, 8, 13625, 62.5)
		FIZ:AddQuest(1085, 4, 8, 13769, 62.5)
		FIZ:AddQuest(1085, 4, 8, 13772, 62.5)
		FIZ:AddQuest(1085, 4, 8, 13671, 62.5)
		FIZ:AddQuest(1085, 4, 8, 13759, 62.5)
		FIZ:AddQuest(1085, 4, 8, 13772, 62.5)
	---- spillover from tournament	
		FIZ:AddQuest(1085, 4, 8, 13809, 125)
		FIZ:AddQuest(1085, 4, 8, 13810, 125)
		FIZ:AddQuest(1085, 4, 8, 13862, 125)
		FIZ:AddQuest(1085, 4, 8, 13811, 125)
	---- spillover from dungeon	
		FIZ:AddInstance(1085, 4, 8, instance.spill_rep_dun, 400, false)
		FIZ:AddInstance(1085, 4, 8, instance.spill_rep_dun, 800, true)
	-- The Taunka 1064	
	---- spillover from 1052	
		FIZ:AddQuest(1064, 4, 8, 12170, 62.5)
	---- spillover from 1124	
		FIZ:AddQuest(1064, 4, 8, 13757, 62.5, {[44981] = 1})
		FIZ:AddQuest(1064, 4, 8, 13625, 62.5)
		FIZ:AddQuest(1064, 4, 8, 13769, 62.5)
		FIZ:AddQuest(1064, 4, 8, 13772, 62.5)
		FIZ:AddQuest(1064, 4, 8, 13671, 62.5)
		FIZ:AddQuest(1064, 4, 8, 13759, 62.5)
		FIZ:AddQuest(1064, 4, 8, 13772, 62.5)
	---- spillover from 1085	
		FIZ:AddQuest(1064, 4, 8, 12284, 62.5)
		FIZ:AddQuest(1064, 4, 8, 12280, 62.5)
		FIZ:AddQuest(1064, 4, 8, 12288, 62.5)
		FIZ:AddQuest(1064, 4, 8, 12270, 62.5)
		FIZ:AddQuest(1064, 4, 8, 13309, 62.5)
		FIZ:AddQuest(1064, 4, 8, 13284, 62.5)
		FIZ:AddQuest(1064, 4, 8, 13336, 62.5)
		FIZ:AddQuest(1064, 4, 8, 13280, 62.5)
	---- spillover from tournament	
		FIZ:AddQuest(1064, 4, 8, 13809, 125)
		FIZ:AddQuest(1064, 4, 8, 13810, 125)
		FIZ:AddQuest(1064, 4, 8, 13862, 125)
		FIZ:AddQuest(1064, 4, 8, 13811, 125)
	---- spillover from dungeon	
		FIZ:AddInstance(1064, 4, 8, instance.spill_rep_dun, 400, false)
		FIZ:AddInstance(1064, 4, 8, instance.spill_rep_dun, 800, true)
	-- Cataclysm	
	-- Dragonmaw Clan 1172	
	---- from zone Twilight Highlands	
		FIZ:AddQuest(1172, 4, 8, 28864, 250)
		FIZ:AddQuest(1172, 4, 8, 28861, 250)
		FIZ:AddQuest(1172, 4, 8, 28860, 250)
		FIZ:AddQuest(1172, 4, 8, 28862, 250)
		FIZ:AddQuest(1172, 4, 8, 28863, 350)
		FIZ:AddSpell(1172, 1, 8, "Quest.no_dq", 1000)
		FIZ:AddSpell(1172, 1, 8, "Quest.no_dq", 1800)
		FIZ:AddMob(1172, 1, 8, mob.t_mobs, 10, 3)
		FIZ:AddMob(1172, 1, 8, mob.t_mobs, 15, 4)
		FIZ:AddMob(1172, 1, 8, mob.a_bosses, 150, 3)
		FIZ:AddMob(1172, 1, 8, mob.a_bosses, 250, 4)
	-- Hellscream's Reach 1178	
	---- from zone Tol Barad	
	------ Tol Barad Peninsula	
	-------- Base Quests	
		FIZ:AddQuest(1178, 4, 8, 28122, 250)
		FIZ:AddQuest(1178, 4, 8, 28658, 250)
		FIZ:AddQuest(1178, 4, 8, 28659, 250)
	-------- Left Prison	
		FIZ:AddQuest(1178, 4, 8, 28665, 350)
		FIZ:AddQuest(1178, 4, 8, 28663, 350)
		FIZ:AddQuest(1178, 4, 8, 28664, 350)
	-------- Right Prison	
		FIZ:AddQuest(1178, 4, 8, 28660, 350)
		FIZ:AddQuest(1178, 4, 8, 28662, 350)
		FIZ:AddQuest(1178, 4, 8, 28661, 250)
	-------- South Prison	
		FIZ:AddQuest(1178, 4, 8, 28670, 250)
		FIZ:AddQuest(1178, 4, 8, 28668, 350)
		FIZ:AddQuest(1178, 4, 8, 28669, 350)
	------ Tol Barad Main	
	-------- Set 1	
		FIZ:AddQuest(1178, 4, 8, 28275, 250)
		FIZ:AddQuest(1178, 4, 8, 28698, 250)
		FIZ:AddQuest(1178, 4, 8, 28697, 250)
		FIZ:AddQuest(1178, 4, 8, 28700, 250)
		FIZ:AddQuest(1178, 4, 8, 28695, 250)
		FIZ:AddQuest(1178, 4, 8, 28694, 250)
	-------- Set 2	
		FIZ:AddQuest(1178, 4, 8, 28682, 250)
		FIZ:AddQuest(1178, 4, 8, 28685, 250)
		FIZ:AddQuest(1178, 4, 8, 28686, 250)
		FIZ:AddQuest(1178, 4, 8, 28687, 250)
		FIZ:AddQuest(1178, 4, 8, 28721, 250)
	-------- Set 3	
		FIZ:AddQuest(1178, 4, 8, 28684, 250)
		FIZ:AddQuest(1178, 4, 8, 28680, 250)
		FIZ:AddQuest(1178, 4, 8, 28678, 250)
		FIZ:AddQuest(1178, 4, 8, 28679, 250)
		FIZ:AddQuest(1178, 4, 8, 28681, 350)
		FIZ:AddQuest(1178, 4, 8, 28683, 250)
	-------- Set 4	
		FIZ:AddQuest(1178, 4, 8, 28693, 250)
		FIZ:AddQuest(1178, 4, 8, 28691, 250)
		FIZ:AddQuest(1178, 4, 8, 28692, 250)
		FIZ:AddQuest(1178, 4, 8, 28690, 250)
		FIZ:AddQuest(1178, 4, 8, 28689, 250)
	-- Mist Of Panderia	
	-- Forest Hozen 1228	
		FIZ:AddQuest(1228, 1, 8, Quest.no_dq, 1)
	-- Dominance Offensive 1375	
		FIZ:AddQuest(1375, 1, 8, 32643, 400)
	---- Lion's Landing	
		FIZ:AddQuest(1375, 1, 8, 32148, 150)
		FIZ:AddQuest(1375, 1, 8, 32153, 150)
		FIZ:AddQuest(1375, 1, 8, 32152, 150)
		FIZ:AddQuest(1375, 1, 8, 32150, 150)
		FIZ:AddQuest(1375, 1, 8, 32151, 150)
		FIZ:AddQuest(1375, 1, 8, 32132, 150)
	---- Domination Point	
		FIZ:AddQuest(1375, 1, 8, 32146, 300)
		FIZ:AddQuest(1375, 1, 8, 32145, 150)
		FIZ:AddQuest(1375, 1, 8, 32142, 150)
		FIZ:AddQuest(1375, 1, 8, 32143, 150)
		FIZ:AddQuest(1375, 1, 8, 32144, 150)
	---- Ruins of Ogudei	
		FIZ:AddQuest(1375, 1, 8, 32122, 300)
		FIZ:AddQuest(1375, 1, 8, 32121, 150)
		FIZ:AddQuest(1375, 1, 8, 32119, 150)
		FIZ:AddQuest(1375, 1, 8, 32347, 150)
		FIZ:AddQuest(1375, 1, 8, 32115, 150)
		FIZ:AddQuest(1375, 1, 8, 32346, 150)
	---- Bilgewater Beach	
	------ Set one	
		FIZ:AddQuest(1375, 1, 8, 32199, 150)
		FIZ:AddQuest(1375, 1, 8, 32149, 150)
		FIZ:AddQuest(1375, 1, 8, 32157, 150)
		FIZ:AddQuest(1375, 1, 8, 32446, 150)
		FIZ:AddQuest(1375, 1, 8, 32158, 300)
	------ Set two	
		FIZ:AddQuest(1375, 1, 8, 32214, 150)
		FIZ:AddQuest(1375, 1, 8, 32433, 300)
		FIZ:AddQuest(1375, 1, 8, 32197, 150)
		FIZ:AddQuest(1375, 1, 8, 32155, 150)
		FIZ:AddQuest(1375, 1, 8, 32137, 150)
	------ Xtra Fuel Set	
		FIZ:AddQuest(1375, 1, 8, 32141, 150)
		FIZ:AddQuest(1375, 1, 8, 32236, 150)
	---- Beastmaster Quests	
	------ Huntsman Blake	
		FIZ:AddQuest(1375, 1, 8, 32172, 200)
		FIZ:AddQuest(1375, 1, 8, 32170, 200)
		FIZ:AddQuest(1375, 1, 8, 32171, 200)
	-- Isle of Thunder	
	-- Sunreaver Onslaught 1388	
		FIZ:AddQuest(1388, 1, 8, 32943, 400)
		FIZ:AddQuest(1388, 4, 8, 32571, 150)
		FIZ:AddQuest(1388, 4, 8, 32578, 200)
		FIZ:AddQuest(1388, 4, 8, 32525, 150)
		FIZ:AddQuest(1388, 4, 8, 32485, 150)
		FIZ:AddQuest(1388, 4, 8, 32634, 150)
		FIZ:AddQuest(1388, 4, 8, 32636, 150)
		FIZ:AddQuest(1388, 4, 8, 32627, 150)
		FIZ:AddQuest(1388, 4, 8, 32576, 200)
		FIZ:AddQuest(1388, 4, 8, 32576, 200)
		FIZ:AddQuest(1388, 4, 8, 32551, 150)
		FIZ:AddQuest(1388, 4, 8, 32543, 150)
		FIZ:AddQuest(1388, 4, 8, 32539, 150)
		FIZ:AddQuest(1388, 4, 8, 32537, 150)
		FIZ:AddQuest(1388, 4, 8, 32639, 150)
		FIZ:AddQuest(1388, 4, 8, 32492, 250)
		FIZ:AddQuest(1388, 4, 8, 32554, 150)
		FIZ:AddQuest(1388, 4, 8, 32297, 150)
		FIZ:AddQuest(1388, 4, 8, 32300, 150)
		FIZ:AddQuest(1388, 4, 8, 32585, 200)
		FIZ:AddQuest(1388, 4, 8, 32573, 150)
		FIZ:AddQuest(1388, 4, 8, 32607, 400)
		FIZ:AddQuest(1388, 4, 8, 32724, 200)
		FIZ:AddQuest(1388, 4, 8, 32570, 150)
		FIZ:AddQuest(1388, 4, 8, 32527, 150)
		FIZ:AddQuest(1388, 4, 8, 32540, 150)
		FIZ:AddQuest(1388, 4, 8, 32538, 150)
		FIZ:AddQuest(1388, 4, 8, 32631, 200)
		FIZ:AddQuest(1388, 4, 8, 32581, 200)
		FIZ:AddQuest(1388, 4, 8, 32528, 150)
		FIZ:AddQuest(1388, 4, 8, 32546, 150)
		FIZ:AddQuest(1388, 4, 8, 32286, 250)
		FIZ:AddQuest(1388, 4, 8, 32210, 250)
		FIZ:AddQuest(1388, 4, 8, 32229, 250)
		FIZ:AddQuest(1388, 4, 8, 32234, 150)
		FIZ:AddQuest(1388, 4, 8, 32548, 150)
		FIZ:AddQuest(1388, 4, 8, 32552, 150)
		FIZ:AddQuest(1388, 4, 8, 32632, 150)
		FIZ:AddQuest(1388, 4, 8, 32266, 150)
		FIZ:AddQuest(1388, 4, 8, 32536, 150)
		FIZ:AddQuest(1388, 4, 8, 32586, 150)
		FIZ:AddQuest(1388, 4, 8, 32301, 150)
		FIZ:AddQuest(1388, 4, 8, 32637, 150)
		FIZ:AddQuest(1388, 4, 8, 32494, 150)
		FIZ:AddQuest(1388, 4, 8, 32541, 150)
		FIZ:AddQuest(1388, 4, 8, 32544, 150)
		FIZ:AddQuest(1388, 4, 8, 32701, 1850)
		FIZ:AddQuest(1388, 4, 8, 32703, 1900)
		FIZ:AddQuest(1388, 4, 8, 32704, 2150)
		FIZ:AddQuest(1388, 4, 8, 32700, 1250)
		FIZ:AddQuest(1388, 4, 8, 32608, 400)
		FIZ:AddQuest(1388, 4, 8, 32582, 200)
		FIZ:AddQuest(1388, 4, 8, 32532, 150)
		FIZ:AddQuest(1388, 4, 8, 32550, 150)
		FIZ:AddQuest(1388, 4, 8, 32209, 150)
		FIZ:AddQuest(1388, 4, 8, 32526, 150)
		FIZ:AddQuest(1388, 4, 8, 32633, 150)
		FIZ:AddQuest(1388, 4, 8, 32533, 150)
		FIZ:AddQuest(1388, 4, 8, 32606, 150)
		FIZ:AddQuest(1388, 4, 8, 32275, 150)
		FIZ:AddQuest(1388, 4, 8, 32628, 150)
		FIZ:AddQuest(1388, 4, 8, 32482, 250)
		FIZ:AddQuest(1388, 4, 8, 32530, 150)
		FIZ:AddQuest(1388, 4, 8, 32529, 150)
		FIZ:AddQuest(1388, 4, 8, 32531, 150)
		FIZ:AddQuest(1388, 4, 8, 32547, 150)
		FIZ:AddQuest(1388, 4, 8, 32545, 150)
		FIZ:AddQuest(1388, 4, 8, 32574, 150)
		FIZ:AddQuest(1388, 4, 8, 32535, 150)
		FIZ:AddQuest(1388, 4, 8, 32572, 150)
		FIZ:AddQuest(1388, 4, 8, 32575, 150)
		FIZ:AddQuest(1388, 4, 8, 32493, 150)
		FIZ:AddQuest(1388, 4, 8, 32206, 150)
		FIZ:AddQuest(1388, 4, 8, 32233, 150)
		FIZ:AddQuest(1388, 4, 8, 32232, 150)
	-- Warlords of Draenor	
	-- Frostwolf Orcs 1445	
		FIZ:AddMob(1445, 1, 7, "Grimfrost Drudge", 500, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 7, "Malevolent Breath", 500, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Gorg'ak the Lava Guzzler", 50, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Jabberjaw", 50, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Moltnoma", 50, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Slogtusk the Corpse-Eater", 50, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Son of Goramal", 50, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Grom'kar Pulverizer", 16, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Bloodmaul Bonecrusher", 16, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Icecrag Mountainbreaker", 16, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Ak'ox the Slaughterer", 16, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Bloodmaul Geomancer", 8, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Bloodmaul Magma Shaper", 8, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Bloodmaul Taskmaster", 8, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Frostfire Cragstomper", 8, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Goramal", 8, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Grubnor Wargut", 8, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Vicious Acidmaw", 8, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Mind-Frozen Rockbiter", 6, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Trained Bonestripper", 5, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Bloodmaul Brute", 5, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Bloodmaul Dire Boar", 5, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Bloodmaul Gladiator", 5, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Burning Slagmaw", 5, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Crazed Soul", 5, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Flesh Horror", 5, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Goren Shardback", 5, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Grom'kar Deadeye", 5, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Grom'kar Enforcer", 5, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Grom'kar Footsoldier", 5, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Grom'kar Shocktrooper", 5, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Grom'kar Warforger", 5, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Howling Icefury", 5, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Icejaw Rockbiter", 5, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Iron Berserker", 5, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Iron Crag-Leaper", 5, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Iron Gladiator", 5, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Iron Talon", 5, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Magma Elemental", 5, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Overlord Blackhammer", 5, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Tamed Rockworm", 5, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Umbral Lurker", 5, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Acidmaw Nibbler", 1, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Frostbeak Scavenger", 1, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Lesser Iceling", 1, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Lesser Magma Elemental", 1, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Slagmaw Nibbler", 1, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Bloodmaul Frostbender", 1, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Flamewing Skytalon", 1, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Frozen Slave", 1, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Nub the Torturer", 1, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Phantasmic Watcher", 1, zone.Frostfire_Ridge)
		FIZ:AddMob(1445, 1, 8, "Rugrum the Pit Boss", 1, zone.Frostfire_Ridge)
	-- Laughing Skull Orcs 1708	
		FIZ:AddMob(1708, 1, 8, "Firestarter Grash", 60, zone.Gorgrond)
		FIZ:AddMob(1708, 1, 8, "Basten", 19, zone.Gorgrond)
		FIZ:AddMob(1708, 1, 8, "Gruesome Torturer", 19, zone.Gorgrond)
		FIZ:AddMob(1708, 1, 8, "Hulking Brute ", 19, zone.Gorgrond)
		FIZ:AddMob(1708, 1, 8, "Iron Bloodburner", 19, zone.Gorgrond)
		FIZ:AddMob(1708, 1, 8, "Iron Cauterizer", 19, zone.Gorgrond)
		FIZ:AddMob(1708, 1, 8, "Iron Deadshot", 19, zone.Gorgrond)
		FIZ:AddMob(1708, 1, 8, "Iron Warden", 19, zone.Gorgrond)
		FIZ:AddMob(1708, 1, 8, "Irontusk Trampler", 19, zone.Gorgrond)
		FIZ:AddMob(1708, 1, 8, "Nultra", 19, zone.Gorgrond)
		FIZ:AddMob(1708, 1, 8, "Iron Bulwark", 16, zone.Gorgrond)
		FIZ:AddMob(1708, 1, 8, "Iron Enforcer", 16, zone.Gorgrond)
		FIZ:AddMob(1708, 1, 8, "Lumbering Ancient", 8, zone.Gorgrond)
		FIZ:AddMob(1708, 1, 8, "Enthralled Mutant", 6, zone.Gorgrond)
		FIZ:AddMob(1708, 1, 8, "Swarming Lasher", 6, zone.Gorgrond)
		FIZ:AddMob(1708, 1, 8, "Twisted Guardian", 6, zone.Gorgrond)
		FIZ:AddMob(1708, 1, 8, "Botani Vine-Weaver", 5, zone.Gorgrond)
		FIZ:AddMob(1708, 1, 8, "Brine Lasher", 5, zone.Gorgrond)
		FIZ:AddMob(1708, 1, 8, "Everbloom Shaper", 5, zone.Gorgrond)
		FIZ:AddMob(1708, 1, 8, "Everbloom Wasp", 5, zone.Gorgrond)
		FIZ:AddMob(1708, 1, 8, "Everbloom Waterspeaker", 5, zone.Gorgrond)
		FIZ:AddMob(1708, 1, 8, "Iron Laborer", 5, zone.Gorgrond)
		FIZ:AddMob(1708, 1, 8, "Sulfurscale Hydra", 5, zone.Gorgrond)
		FIZ:AddMob(1708, 1, 8, "Venomous Ravager", 5, zone.Gorgrond)
		FIZ:AddMob(1708, 1, 8, "Wild Mandragora", 5, zone.Gorgrond)
		FIZ:AddMob(1708, 1, 8, "Noxious Sproutling", 1, zone.Gorgrond)
	-- Vol'jin's Spear 1681	
		FIZ:AddQuest(1681, 1, 8, 36024, 25)
		FIZ:AddQuest(1681, 1, 8, 36026, 125)
		FIZ:AddQuest(1681, 1, 8, 36032, 500)
	-- Vol'jin's Headhunters 1848	
		FIZ:AddQuest(1848, 1, 8, 37940, 250)
		FIZ:AddQuest(1848, 1, 8, 38441, 250)
		FIZ:AddQuest(1848, 1, 8, 38252, 250)
		FIZ:AddQuest(1848, 1, 8, 38449, 250)
		FIZ:AddQuest(1848, 1, 8, 38586, 250)
		FIZ:AddQuest(1848, 1, 8, 38047, 250)
		FIZ:AddQuest(1848, 1, 8, 38044, 250)
		FIZ:AddQuest(1848, 1, 8, 39511, 250)
		FIZ:AddQuest(1848, 1, 8, 39532, 250)
		FIZ:AddQuest(1848, 1, 8, 39519, 250)
		FIZ:AddQuest(1848, 1, 8, 39514, 250)
		FIZ:AddQuest(1848, 1, 8, 39526, 250)
		FIZ:AddQuest(1848, 1, 8, 39512, 250)
	end	
	-- Steamwheedle Cartel	
	-- Booty Bay 21	
	---- spillover from Cartel Mobs	
		FIZ:AddMob(21, 1, 7, 11, 5, zone.C_o_Stranglethorn)
		FIZ:AddMob(21, 1, 8, 12, 2.5, zone.C_o_Stranglethorn)
		FIZ:AddMob(21, 1, 8, 13, 2.5, zone.C_o_Stranglethorn)
		FIZ:AddMob(21, 1, 7, 14, 5, zone.C_o_Stranglethorn)
		FIZ:AddMob(21, 1, 7, 15, 12.5, zone.C_o_Stranglethorn)
		FIZ:AddMob(21, 1, 8, 15, 7.5, zone.C_o_Stranglethorn)
		FIZ:AddMob(21, 1, 8, 17, 7.5, zone.C_o_Stranglethorn)
		FIZ:AddMob(21, 1, 7, "Cap'n Garvey & Alicia Cuthbert", 5, zone.Badlands)
	-- Everlook 577	
		FIZ:AddQuest(577, 1, 3, 9266, 500, {[14047] = 1, [3857] = 1})
	---- spillover from Cartel Mobs	
		FIZ:AddMob(577, 1, 7, 11, 5, zone.C_o_Stranglethorn)
		FIZ:AddMob(577, 1, 8, 12, 2.5, zone.C_o_Stranglethorn)
		FIZ:AddMob(577, 1, 8, 13, 2.5, zone.C_o_Stranglethorn)
		FIZ:AddMob(577, 1, 7, 14, 5, zone.C_o_Stranglethorn)
		FIZ:AddMob(577, 1, 7, 15, 12.5, zone.C_o_Stranglethorn)
		FIZ:AddMob(577, 1, 8, 15, 7.5, zone.C_o_Stranglethorn)
		FIZ:AddMob(577, 1, 8, 17, 7.5, zone.C_o_Stranglethorn)
		FIZ:AddMob(577, 1, 7, "Cap'n Garvey & Alicia Cuthbert", 5, zone.Badlands)
	-- Gadgetzan 369	
		FIZ:AddMob(369, 1, 8, 11, 2.5, zone.C_o_Stranglethorn)
		
		FIZ:AddMob(369, 1, 8, 12, 2.5, zone.C_o_Stranglethorn)
		FIZ:AddMob(369, 1, 7, 13, 5, zone.C_o_Stranglethorn)
		FIZ:AddMob(369, 1, 7, 14, 2.5, zone.C_o_Stranglethorn)
		FIZ:AddMob(369, 1, 8, 15, 7.5, zone.C_o_Stranglethorn)
		FIZ:AddMob(369, 1, 7, 15, 12.5, zone.C_o_Stranglethorn)
		FIZ:AddMob(369, 1, 8, 17, 12.5, zone.C_o_Stranglethorn)
		FIZ:AddMob(369, 1, 7, "Cap'n Garvey & Alicia Cuthbert", 25, zone.Badlands)
		FIZ:AddQuest(369, 1, 3, 9268, 500, {[4338] = 1, [3466] = 1})
	-- Ratchet 470	
		FIZ:AddMob(470, 1, 8, 11, 2.5, zone.C_o_Stranglethorn)
		
		FIZ:AddMob(470, 1, 8, 12, 2.5, zone.C_o_Stranglethorn)
		FIZ:AddMob(470, 1, 8, 13, 2.5, zone.C_o_Stranglethorn)
		FIZ:AddMob(470, 1, 7, 14, 2.5, zone.C_o_Stranglethorn)
		FIZ:AddMob(470, 1, 7, 15, 7.5, zone.C_o_Stranglethorn)
		FIZ:AddMob(470, 1, 8, 15, 7.5, zone.C_o_Stranglethorn)
		FIZ:AddMob(470, 1, 7, 17, 12.5, zone.C_o_Stranglethorn)
		FIZ:AddMob(470, 1, 8, "Cap'n Garvey & Alicia Cuthbert", 12.5, zone.Badlands)
		FIZ:AddQuest(470, 1, 3, 9267, 500, {[2589] = 1, [3371] = 1})
	-- Bloodsail Buccaneers 87	
		FIZ:AddMob(87, 1, 7, "Booty Bay Bruiser & Elite", 25, zone.C_o_Stranglethorn)
		FIZ:AddMob(87, 1, 7, "Some Booty Bay Named", 5, zone.C_o_Stranglethorn)
		FIZ:AddMob(87, 1, 7, "Most Booty Bay Named", 1, zone.C_o_Stranglethorn)
		FIZ:AddMob(87, 1, 7, "Most Faldir's Cove Named", 5, zone.Arathi_Highlands)
		FIZ:AddMob(87, 1, 7, "Baron Revilgaz, Grizzlowe, &Wharfmaster Lozgil", 25, zone.C_o_Stranglethorn)
		FIZ:AddMob(87, 1, 7, "Viznik & Rickle Goldgrubber (bankers)", 25, zone.C_o_Stranglethorn)
	-- Classic world	
	-- Argent Dawn 529	
		FIZ:AddGeneral(529, 3, 3, "Fiona's Caravan Quests", 24000, "Fiona's Caravan Quests", "Fiona's Caravan Quests until '[42] Argent Call: The Trial of the Crypt will give enough reputation to reach Revered reputation.0", nil, 0)
		FIZ:AddGeneral(529, 4, 4, "Fiona's Caravan Quests", 21000, "Fiona's Caravan Quests", "Fiona's Caravan Quests until '[42] Argent Call: The Trial of the Crypt will give enough reputation to reach Revered reputation.0", nil, 0)
		FIZ:AddGeneral(529, 5, 5, "Fiona's Caravan Quests", 18000, "Fiona's Caravan Quests", "Fiona's Caravan Quests until '[42] Argent Call: The Trial of the Crypt will give enough reputation to reach Revered reputation.0", nil, 0)
		FIZ:AddGeneral(529, 6, 6, "Fiona's Caravan Quests", 12000, "Fiona's Caravan Quests", "Fiona's Caravan Quests until '[42] Argent Call: The Trial of the Crypt will give enough reputation to reach Revered reputation.0", nil, 0)
		FIZ:AddQuest(529, 7, 8, 28756, 1000)
		FIZ:AddQuest(529, 7, 8, 28755, 1000)
	-- Darkmoon Faire 909	
		FIZ:AddQuest(909, 1, 8, 29761, 250)
		FIZ:AddQuest(909, 1, 8, 29433, 250)
	---- Dungons Arch	
		FIZ:AddQuest(909, 1, 8, 29443, 250, {[71635] = 1})
		FIZ:AddQuest(909, 1, 8, 29446, 250, {[71638] = 1})
		FIZ:AddQuest(909, 1, 8, 29456, 250, {[71951] = 1})
		FIZ:AddQuest(909, 1, 8, 29444, 250, {[71636] = 1})
		FIZ:AddQuest(909, 1, 8, 29445, 250, {[71637] = 1})
		FIZ:AddQuest(909, 1, 8, 29458, 250, {[71953] = 1})
		FIZ:AddQuest(909, 1, 8, 29457, 250, {[71952] = 1})
		FIZ:AddQuest(909, 1, 8, 29451, 250, {[71715] = 1})
		FIZ:AddQuest(909, 1, 8, 29464, 250, {[71716] = 1})
	---- Darkmoon Game Token	
	------ Base Games	
		FIZ:AddQuest(909, 1, 8, 29463, 250)
		FIZ:AddQuest(909, 1, 8, 29438, 250)
		FIZ:AddQuest(909, 1, 8, 29455, 250)
		FIZ:AddQuest(909, 1, 8, 29436, 250)
		FIZ:AddQuest(909, 1, 8, 29434, 250)
	------ Main profesion	
		FIZ:AddQuest(909, 1, 8, 29514, 250, "nil", FIZ_LIMIT_TYPE_Herb)
		FIZ:AddQuest(909, 1, 8, 29519, 250, "nil", FIZ_LIMIT_TYPE_Skin)
		FIZ:AddQuest(909, 1, 8, 29518, 250, "nil", FIZ_LIMIT_TYPE_Mine)
		FIZ:AddQuest(909, 1, 8, 29511, 250, "nil", FIZ_LIMIT_TYPE_Engi)
		FIZ:AddQuest(909, 1, 8, 29506, 250, "nil", FIZ_LIMIT_TYPE_Alch)
		FIZ:AddQuest(909, 1, 8, 29508, 250, "nil", FIZ_LIMIT_TYPE_Blac)
		FIZ:AddQuest(909, 1, 8, 29520, 250, "nil", FIZ_LIMIT_TYPE_Tail)
		FIZ:AddQuest(909, 1, 8, 29517, 250, "nil", FIZ_LIMIT_TYPE_Leat)
		FIZ:AddQuest(909, 1, 8, 29510, 250, "nil", FIZ_LIMIT_TYPE_Ench)
		FIZ:AddQuest(909, 1, 8, 29516, 250, "nil", FIZ_LIMIT_TYPE_Jewe)
		FIZ:AddQuest(909, 1, 8, 29515, 250, "nil", FIZ_LIMIT_TYPE_Incr)
	------ Secondary profesion	
		FIZ:AddQuest(909, 1, 8, 29512, 250, "nil", FIZ_LIMIT_TYPE_Aid)
		FIZ:AddQuest(909, 1, 8, 29507, 250, "nil", FIZ_LIMIT_TYPE_Arch)
		FIZ:AddQuest(909, 1, 8, 29509, 250, "nil", FIZ_LIMIT_TYPE_Cook)
		FIZ:AddQuest(909, 1, 8, 29513, 250, "nil", FIZ_LIMIT_TYPE_Fish)
	---- Decks	
	------ Minor	
		FIZ:AddItems(909, 1, 8, 25, {[43039] = 1})
		FIZ:AddItems(909, 1, 8, 25, {[42922] = 1})
		FIZ:AddItems(909, 1, 8, 25, {[44184] = 1})
		FIZ:AddItems(909, 1, 8, 25, {[44185] = 1})
	------ Major	
		FIZ:AddItems(909, 1, 8, 350, {[19228] = 1})
		FIZ:AddItems(909, 1, 8, 350, {[62046] = 1})
		FIZ:AddItems(909, 1, 8, 350, {[19267] = 1})
		FIZ:AddItems(909, 1, 8, 350, {[31907] = 1})
		FIZ:AddItems(909, 1, 8, 350, {[62045] = 1})
		FIZ:AddItems(909, 1, 8, 350, {[31914] = 1})
		FIZ:AddItems(909, 1, 8, 350, {[31891] = 1})
		FIZ:AddItems(909, 1, 8, 350, {[62044] = 1})
		FIZ:AddItems(909, 1, 8, 350, {[62021] = 1})
		FIZ:AddItems(909, 1, 8, 350, {[19257] = 1})
		FIZ:AddItems(909, 1, 8, 350, {[19277] = 1})
		FIZ:AddItems(909, 1, 8, 350, {[31890] = 1})
		FIZ:AddItems(909, 1, 8, 350, {[44276] = 1})
		FIZ:AddItems(909, 1, 8, 350, {[44326] = 1})
		FIZ:AddItems(909, 1, 8, 350, {[44259] = 1})
		FIZ:AddItems(909, 1, 8, 350, {[44294] = 1})
	-- Ravenholdt 349	
		FIZ:AddQuest(349, 4, 4, 6701, 250, {[17124] = 1})
		FIZ:AddQuest(349, 4, 8, 8249, 75, {[16885] = 5})
		FIZ:AddMob(349, 4, 6, "All Syndicate members", 5, zone.Hillsbrad_Foothills)
	-- Syndicate 70	
		FIZ:AddMob(70, 1, 4, "Myrokos Silentform", 25, zone.Hillsbrad_Foothills)
		FIZ:AddMob(70, 1, 4, "Winstone Wolfe", 5, zone.Hillsbrad_Foothills)
		FIZ:AddMob(70, 1, 4, "Lord Jorach Ravenholdt", 5, zone.Hillsbrad_Foothills)
		FIZ:AddMob(70, 1, 4, "Fahrad", 5, zone.Hillsbrad_Foothills)
		FIZ:AddMob(70, 1, 4, "Zan Shivsproket", 5, zone.Hillsbrad_Foothills)
		FIZ:AddMob(70, 1, 4, "Smudge Thunderwood", 5, zone.Hillsbrad_Foothills)
		FIZ:AddMob(70, 1, 4, "Simone Cantrell", 5, zone.Hillsbrad_Foothills)
		FIZ:AddMob(70, 1, 4, "Master Kang", 5, zone.Hillsbrad_Foothills)
		FIZ:AddMob(70, 1, 4, "Carlo Aurelius", 5, zone.Hillsbrad_Foothills)
		FIZ:AddMob(70, 1, 4, "Ravenholdt Assassin", 5, zone.Hillsbrad_Foothills)
		FIZ:AddMob(70, 1, 4, "Ravenholdt Guard", 5, zone.Hillsbrad_Foothills)
	-- Thorium Brotherhood 59	
		FIZ:AddQuest(59, 4, 6, 13662, 25, {[18945] = 4})
		FIZ:AddQuest(59, 4, 6, 7737, 625, {[18945] = 100})
		FIZ:AddQuest(59, 4, 8, 6642, 300, {[11370] = 10})
		FIZ:AddQuest(59, 4, 8, 6645, 1400, {[17012] = 2})
		FIZ:AddQuest(59, 4, 8, 6646, 2000, {[11382] = 1})
		FIZ:AddQuest(59, 4, 8, 6643, 2000, {[17010] = 1})
		FIZ:AddQuest(59, 4, 8, 6644, 2000, {[17011] = 1})
	-- Timbermaw Hold 576	
		FIZ:AddQuest(576, 2, 8, 28395, 2000, {[21377] = 5})
		FIZ:AddQuest(576, 2, 8, 28396, 2000, {[21377] = 5})
		FIZ:AddQuest(576, 2, 8, 28523, 2000, {[21383] = 5})
		FIZ:AddMob(576, 2, 6, "Deadwood Avenger, Den Watcher, Shaman, Gardener, Pathfinder & Warrior", 20, zone.Felwood)
		FIZ:AddMob(576, 2, 6, "Winterfell Runner, Den Watcher, Shaman, Pathfinder, Totemic,  & Ursa", 20, zone.Winterspring)
		FIZ:AddMob(576, 2, 8, "Chieftain Bloodmaw", 60, zone.Felwood)
		FIZ:AddMob(576, 2, 8, "Overlord Ror", 60, zone.Felwood)
		FIZ:AddMob(576, 2, 8, "Ragepaw (Rare)", 50, zone.Felwood)
		FIZ:AddMob(576, 2, 8, "Grizzle Snowpaw (Rare)", 50, zone.Winterspring)
		FIZ:AddMob(576, 2, 8, "High Chief Winterfall", 50, zone.Winterspring)
	-- Raid_Factions	
	-- Ashtongue Deathsworn 1012	
		FIZ:AddInstance(1012, 4, 8, zone.Black_Temple, 8000)
	-- Brood of Nozdormu 910	
		
		FIZ:AddMob(910, 1, 4, "Anubisath Defender", 100, zone.Temple_of_AhnQiraj)
		FIZ:AddMob(910, 1, 4, "Anubisath Sentinel", 100, zone.Temple_of_AhnQiraj)
		FIZ:AddMob(910, 1, 4, "Obsidian Eradicator", 100, zone.Temple_of_AhnQiraj)
		FIZ:AddMob(910, 1, 4, "Qiraj Lasher", 100, zone.Temple_of_AhnQiraj)
		FIZ:AddMob(910, 1, 4, "Vekniss Hive Crawler", 100, zone.Temple_of_AhnQiraj)
		FIZ:AddMob(910, 1, 4, "Vekniss Soldier", 100, zone.Temple_of_AhnQiraj)
		FIZ:AddMob(910, 1, 4, "Vekniss Stinger", 100, zone.Temple_of_AhnQiraj)
		FIZ:AddMob(910, 1, 4, "Vekniss Warrior", 100, zone.Temple_of_AhnQiraj)
		FIZ:AddMob(910, 1, 4, "Vekniss Wasp", 100, zone.Temple_of_AhnQiraj)
		FIZ:AddMob(910, 1, 8, "Most Bosses", 50)
		FIZ:AddMob(910, 1, 8, "Ossirian", 100, zone.Temple_of_AhnQiraj)
		FIZ:AddMob(910, 1, 8, "Twin Emperors", 200, zone.Temple_of_AhnQiraj)
		FIZ:AddMob(910, 1, 8, "Cthun", 2500, zone.Temple_of_AhnQiraj)
		FIZ:AddItems(910, 1, 8, 500, {[21229] = 1})
		FIZ:AddItems(910, 1, 8, 1000, {[21230] = 1})
	-- Cenarion Circle 609	
		FIZ:AddQuest(609, 4, 8, 8319, 500, {[20404] = 10})
		FIZ:AddInstance(609, 4, 8, zone.Ruins_of_AhnQiraj, 1200)
		FIZ:AddInstance(609, 4, 8, zone.Temple_of_AhnQiraj, nil)
		FIZ:AddMob(609, 4, 5, "Any Twilight's Hammer mobs", 10)
		FIZ:AddItems(609, 1, 8, 500, {[21229] = 1})
	-- Hydraxian Waterlords 749	
		FIZ:AddMob(749, 4, 5, "Desert Rumbler, Dust Stormer", 5, zone.Silithus)
		FIZ:AddMob(749, 4, 5, "Greater Obsidian Elemental", 5, zone.Burning_Steppes)
		FIZ:AddMob(749, 4, 6, "Lord Incendius", 15, zone.Blackrock_Depths)
		FIZ:AddMob(749, 4, 6, "Huricanian (Rare)", 25, zone.Silithus)
		FIZ:AddMob(749, 4, 6, "Pyroguard Emberseer", 50, zone.Blackrock_Spire)
		FIZ:AddMob(749, 4, 6, "Molten Core Trash", 20, zone.Molten_Core)
		FIZ:AddMob(749, 4, 6, "Molten Destroyer & Lava Pack", 40, zone.Molten_Core)
		FIZ:AddInstance(749, 4, 7, zone.Molten_Core, 1050)
		FIZ:AddInstance(749, 8, 8, zone.Molten_Core, 350)
	-- The Scale of the Sands 990	
		FIZ:AddInstance(990, 5, 8, zone.O_Hills_Foothills, 7900)
		FIZ:AddMob(990, 4, 8, 0, 12, zone.O_Hills_Foothills)
		FIZ:AddMob(990, 4, 8, "Frost Wyrm", 60, zone.O_Hills_Foothills)
		FIZ:AddMob(990, 4, 8, 0, 375, zone.O_Hills_Foothills)
		FIZ:AddMob(990, 4, 8, "Archimonde", 1500, zone.O_Hills_Foothills)
	-- The Violet Eye 967	
		FIZ:AddInstance(967, 4, 8, zone.Karazhan, 6000, FALSE)
		FIZ:AddMob(967, 4, 8, 0, 250, zone.Karazhan)
		FIZ:AddMob(967, 4, 8, 0, 15, zone.Karazhan)
	-- Outlands	
	-- Cenarion Expedition 942	
		FIZ:AddInstance(942, 4, 5, zone.The_Slave_Pens, 650, false)
		FIZ:AddInstance(942, 6, 8, zone.The_Slave_Pens, 650, true)
		FIZ:AddInstance(942, 4, 5, zone.The_Underbog, 1000, false)
		FIZ:AddInstance(942, 6, 8, zone.The_Underbog, 1000, true)
		FIZ:AddInstance(942, 4, 8, zone.The_Steamvault, 1662, false)
		FIZ:AddInstance(942, 4, 8, zone.The_Steamvault, 2319, true)
		FIZ:AddQuest(942, 4, 5, 9802, 250, {[24401] = 10})
		FIZ:AddQuest(942, 4, 6, 9875, 500)
		
		FIZ:AddQuest(942, 4, 8, 11867, 150)
		FIZ:AddMob(942, 4, 4, "Steam Pump Overseer", 1, zone.Zangarmarsh)
		FIZ:AddMob(942, 4, 4, "Wrekt Slave", 2.5, zone.Zangarmarsh)
		FIZ:AddMob(942, 4, 4, "Dreghood Drudge", 2.5, zone.Zangarmarsh)
		FIZ:AddMob(942, 4, 4, "Bloodscale Overseer", 5, zone.Zangarmarsh)
		FIZ:AddMob(942, 4, 4, "Bloodscale Wavecaller", 5, zone.Zangarmarsh)
		FIZ:AddMob(942, 4, 4, "Darkcrest Sorceress", 5, zone.Zangarmarsh)
		FIZ:AddMob(942, 4, 4, "Darkcrest Slaver", 5, zone.Zangarmarsh)
		FIZ:AddMob(942, 4, 4, "Terrorclaw", 7, zone.Zangarmarsh)
	-- Keepers of Time 989	
		FIZ:AddInstance(989, 4, 8, zone.O_Hills_Foothills, 1133, false)
		FIZ:AddInstance(989, 4, 8, zone.O_Hills_Foothills, 2445, true)
		FIZ:AddInstance(989, 4, 8, zone.The_Black_Morass, 1110, false)
		FIZ:AddInstance(989, 4, 8, zone.The_Black_Morass, 1725, true)
	-- Netherwing 1015	
		FIZ:AddQuest(1015, 4, 8, 11050, 250)
		FIZ:AddQuest(1015, 4, 8, 11017, 250, "nil", FIZ_LIMIT_TYPE_Herb)
		FIZ:AddQuest(1015, 4, 8, 11018, 250, "nil", FIZ_LIMIT_TYPE_Mine)
		FIZ:AddQuest(1015, 4, 8, 11016, 250, "nil", FIZ_LIMIT_TYPE_Skin)
		FIZ:AddQuest(1015, 4, 8, 11020, 250)
		FIZ:AddQuest(1015, 4, 8, 11035, 250)
		FIZ:AddQuest(1015, 4, 8, 11015, 250)
		FIZ:AddQuest(1015, 5, 8, 11077, 350)
		FIZ:AddQuest(1015, 5, 8, 11076, 350)
		FIZ:AddQuest(1015, 5, 8, 11055, 350)
		FIZ:AddQuest(1015, 6, 8, 11086, 500)
		FIZ:AddQuest(1015, 7, 8, 11101, 500)
	-- Ogri'la 1038	
		FIZ:AddQuest(1038, 4, 8, 11080, 350)
		FIZ:AddQuest(1038, 4, 8, 11066, 350)
		FIZ:AddQuest(1038, 4, 8, 11023, 500)
		FIZ:AddQuest(1038, 6, 8, 11051, 350)
	-- Sha'tari Skyguard 1031	
		FIZ:AddQuest(1031, 4, 8, 11004, 150)
		FIZ:AddQuest(1031, 4, 8, 11008, 350)
		FIZ:AddQuest(1031, 4, 8, 11085, 150)
		FIZ:AddQuest(1031, 4, 8, 11066, 350)
		FIZ:AddQuest(1031, 4, 8, 11023, 500)
		FIZ:AddMob(1031, 4, 6, "Skettis Kaliri", 2.5, zone.Terokkar_Forest)
		FIZ:AddMob(1031, 4, 8, "Skettis, Talonpriests, Time-Lost Skettis, Monstrous Kaliri", 10, zone.Terokkar_Forest)
		FIZ:AddMob(1031, 4, 8, "Talonsworn Forest-Rager", 30, zone.Terokkar_Forest)
		FIZ:AddMob(1031, 4, 8, "Akkarai, Karrog, Gezzarak, Vakkiz", 100, zone.Terokkar_Forest)
		FIZ:AddMob(1031, 4, 8, "Terokk", 500, zone.Terokkar_Forest)
	-- Sporeggar 970	
		FIZ:AddMob(970, 3, 6, "Bog Lords, Bog Giants", 15)
		FIZ:AddInstance(970, 3, 7, zone.The_Underbog, 15, false)
		FIZ:AddInstance(970, 3, 7, zone.The_Underbog, 45, true)
		FIZ:AddQuest(970, 3, 4, 9739, 750)
		FIZ:AddQuest(970, 3, 5, 9743, 750)
		FIZ:AddQuest(970, 3, 5, 9744, 750, {[24291] = 6})
		FIZ:AddQuest(970, 3, 4, 9808, 750, {[24245] = 10})
		FIZ:AddQuest(970, 5, 8, 9727, 750)
		FIZ:AddQuest(970, 4, 8, 9807, 750, {[24449] = 6})
		FIZ:AddQuest(970, 5, 8, 29692, 750, {[24246] = 5})
	-- The Consortium 933	
		FIZ:AddInstance(933, 4, 5, zone.Mana_Tombs, 1200, false)
		FIZ:AddInstance(933, 6, 8, zone.Mana_Tombs, 2400, true)
		FIZ:AddQuest(933, 4, 4, 9882, 250)
		FIZ:AddQuest(933, 4, 4, 9915, 250)
		FIZ:AddQuest(933, 5, 8, 9892, 250)
		FIZ:AddQuest(933, 5, 8, 10308, 250)
		FIZ:AddQuest(933, 6, 8, 10971, 250)
		FIZ:AddQuest(933, 7, 8, 10973, 500)
		FIZ:AddQuest(933, 4, 8, 99, 250)
		FIZ:AddQuest(933, 4, 8, 99, 350)
	-- Shattrath City	
	-- Lower City 1011	
		FIZ:AddInstance(1011, 4, 5, zone.Auchenai_Crypts, 750, false)
		FIZ:AddInstance(1011, 6, 8, zone.Auchenai_Crypts, 750, true)
		FIZ:AddInstance(1011, 4, 8, zone.Sethekk_Halls, 1080, false)
		FIZ:AddInstance(1011, 4, 8, zone.Sethekk_Halls, 1250, true)
		FIZ:AddInstance(1011, 4, 8, zone.Shadow_Labyrinth, 2000, false)
		FIZ:AddInstance(1011, 4, 8, zone.Shadow_Labyrinth, 2700, true)
		FIZ:AddItems(1011, 4, 5, 250, {[25719] = 30})
	-- Shattered Sun Offensive 1077	
		FIZ:AddQuest(1077, 4, 8, 11875, 250, "nil", FIZ_LIMIT_TYPE_Gather)
		FIZ:AddQuest(1077, 4, 8, 11877, 250)
		FIZ:AddQuest(1077, 4, 8, 11880, 150)
		FIZ:AddQuest(1077, 4, 8, 11515, 250)
		FIZ:AddQuest(1077, 4, 8, 11516, 250)
		FIZ:AddQuest(1077, 4, 8, 11523, 150)
		FIZ:AddQuest(1077, 4, 8, 11525, 150)
		FIZ:AddQuest(1077, 4, 8, 11514, 250)
		FIZ:AddQuest(1077, 4, 8, 11547, 250)
		FIZ:AddQuest(1077, 4, 8, 11537, 250)
		FIZ:AddQuest(1077, 4, 8, 11533, 150)
		FIZ:AddQuest(1077, 4, 8, 11544, 350)
		FIZ:AddQuest(1077, 4, 8, 11536, 250)
		FIZ:AddQuest(1077, 4, 8, 11541, 250)
		FIZ:AddQuest(1077, 4, 8, 11543, 250)
		FIZ:AddQuest(1077, 4, 8, 11540, 250)
		FIZ:AddQuest(1077, 8, 8, 11549, 500)
		FIZ:AddQuest(1077, 4, 8, 11548, 150)
		FIZ:AddQuest(1077, 4, 8, 11521, 350)
		FIZ:AddQuest(1077, 4, 8, 11546, 250)
		FIZ:AddInstance(1077, 4, 7, zone.Magisters_Terrace, 1640, false)
		
		FIZ:AddInstance(1077, 4, 8, zone.Magisters_Terrace, 2503, true)
	-- The Aldor 932	
		FIZ:AddQuest(932, 1, 3, 10017, 250, {[25802] = 8})
		FIZ:AddQuest(932, 4, 5, 10326, 250, {[29425] = 10})
		FIZ:AddQuest(932, 4, 5, 10327, 25, {[29425] = 1})
		FIZ:AddQuest(932, 5, 8, 10654, 250, {[30809] = 10})
		FIZ:AddQuest(932, 5, 8, 10655, 25, {[30809] = 1})
		FIZ:AddQuest(932, 5, 8, 10420, 350, {[29740] = 1})
	-- The Scryers 934	
		FIZ:AddQuest(934, 1, 3, 10024, 250, {[25744] = 8})
		FIZ:AddQuest(934, 4, 5, 10415, 250, {[29426] = 10})
		FIZ:AddQuest(934, 4, 5, 10414, 25, {[29426] = 1})
		FIZ:AddQuest(934, 5, 8, 10658, 250, {[30810] = 10})
		FIZ:AddQuest(934, 5, 8, 10659, 25, {[30810] = 1})
		FIZ:AddQuest(934, 5, 8, 10416, 350, {[29739] = 1})
	-- The Sha'tar 935	
		FIZ:AddQuest(935, 4, 5, 10326, 125, {[29425] = 10})
		FIZ:AddQuest(935, 4, 5, 10327, 12.5, {[29425] = 1})
		FIZ:AddQuest(935, 4, 5, 10654, 125, {[30809] = 10})
		FIZ:AddQuest(935, 4, 5, 10655, 12.5, {[30809] = 1})
		FIZ:AddQuest(935, 4, 5, 10415, 125, {[29426] = 10})
		FIZ:AddQuest(935, 4, 5, 10414, 12.5, {[29426] = 1})
		FIZ:AddQuest(935, 4, 5, 10658, 125, {[30810] = 10})
		FIZ:AddQuest(935, 4, 5, 10659, 12.5, {[30810] = 1})
		FIZ:AddQuest(935, 4, 5, 10017, 125, {[25802] = 8})
		FIZ:AddQuest(935, 4, 5, 10024, 125, {[25744] = 8})
		FIZ:AddQuest(935, 4, 5, 10420, 175, {[29740] = 1})
		FIZ:AddQuest(935, 4, 5, 10416, 175, {[29739] = 1})
		FIZ:AddInstance(935, 4, 8, zone.The_Mechanar, 1620, false)
		FIZ:AddInstance(935, 4, 8, zone.The_Mechanar, 3000, true)
		FIZ:AddInstance(935, 4, 8, zone.The_Botanica, 2000, false)
		FIZ:AddInstance(935, 4, 8, zone.The_Botanica, 3000, true)
		FIZ:AddInstance(935, 4, 8, zone.The_Arcatraz, 1800, false)
		FIZ:AddInstance(935, 4, 8, zone.The_Arcatraz, 3000, true)
	-- Northrend (WotLK)	
	-- Argent Crusade 1106	
		FIZ:AddQuest(1106, 4, 8, 13302, 325)
		FIZ:AddQuest(1106, 4, 8, 12587, 455)
		FIZ:AddQuest(1106, 4, 8, 12604, 650)
		FIZ:AddItems(1106, 4, 8, 520, {[44711] = 1})
		FIZ:AddSpell(1106, 1, 8, "Quest.no_dq", 1000)
		FIZ:AddSpell(1106, 1, 8, "Quest.no_dq", 1800)
	if (FIZ_IsDeathKnight) then	
		FIZ:AddQuest(1106, 4, 8, 13809, 325)
		FIZ:AddQuest(1106, 4, 8, 13810, 325)
		FIZ:AddQuest(1106, 4, 8, 13862, 325)
		FIZ:AddQuest(1106, 4, 8, 13811, 325)
	end	
	-- Kirin Tor 1090	
		FIZ:AddQuest(1090, 4, 8, Quest.mc_cook_dq, 250, "nil", FIZ_LIMIT_TYPE_Cook)
		FIZ:AddQuest(1090, 4, 8, Quest.mc_fish_dq, 250, "nil", FIZ_LIMIT_TYPE_Fish)
		FIZ:AddQuest(1090, 4, 8, Quest.da_jewel_dq, 50, "nil", FIZ_LIMIT_TYPE_Jewel)
		FIZ:AddQuest(1090, 4, 8, 99, 125)
		FIZ:AddQuest(1090, 4, 8, 14203, 325)
		FIZ:AddQuest(1090, 4, 8, 13845, 325)
		FIZ:AddItems(1090, 4, 8, 520, {[43950] = 1})
		FIZ:AddSpell(1090, 1, 8, "Quest.no_dq", 1000)
		FIZ:AddSpell(1090, 1, 8, "Quest.no_dq", 1800)
	-- Knights of the Ebon Blade 1098	
		FIZ:AddQuest(1098, 4, 8, 12813, 325)
		FIZ:AddQuest(1098, 4, 8, 12838, 325)
		FIZ:AddQuest(1098, 4, 8, 12995, 325)
		FIZ:AddQuest(1098, 4, 8, 12815, 325)
		FIZ:AddQuest(1098, 4, 8, 13071, 325)
		FIZ:AddQuest(1098, 4, 8, 13069, 325)
		FIZ:AddQuest(1098, 4, 8, 13093, 10)
		FIZ:AddItems(1098, 4, 8, 520, {[44713] = 1})
		FIZ:AddSpell(1098, 1, 8, "Quest.no_dq", 1000)
		FIZ:AddSpell(1098, 1, 8, "Quest.no_dq", 1800)
	if (FIZ_IsDeathKnight) then	
		FIZ:AddQuest(1098, 4, 8, 13809, 325)
		FIZ:AddQuest(1098, 4, 8, 13810, 325)
		FIZ:AddQuest(1098, 4, 8, 13862, 325)
		FIZ:AddQuest(1098, 4, 8, 13811, 325)
	end	
	-- The Ashen Verdict 1156	
		FIZ:AddInstance(1156, 4, 8, zone.Icecrown_Citadel, 2070, true)
		FIZ:AddInstance(1156, 4, 8, zone.Icecrown_Citadel, 1005, false)
	-- The Kalu'ak 1073	
		FIZ:AddQuest(1073, 4, 8, 11945, 500)
		FIZ:AddQuest(1073, 4, 8, 11960, 500)
		FIZ:AddQuest(1073, 4, 8, 11472, 500)
	-- The Sons of Hodir 1119	
		FIZ:AddQuest(1119, 1, 4, Quest.no_dq, 1)
		FIZ:AddQuest(1119, 5, 8, 13559, 325)
		FIZ:AddQuest(1119, 5, 8, 13421, 455)
		FIZ:AddQuest(1119, 5, 8, 13006, 455)
		FIZ:AddQuest(1119, 5, 8, 12981, 455)
		FIZ:AddQuest(1119, 5, 8, 12977, 455)
		FIZ:AddQuest(1119, 6, 8, 12994, 455)
		FIZ:AddQuest(1119, 6, 8, 13003, 650)
		FIZ:AddQuest(1119, 7, 8, 13046, 455)
		FIZ:AddItems(1119, 4, 8, 520, {[49702] = 1})
	-- The Wyrmrest Accord 1091	
		FIZ:AddQuest(1091, 4, 8, 11940, 325)
		FIZ:AddQuest(1091, 4, 8, 12372, 325)
		FIZ:AddQuest(1091, 4, 8, 13414, 325)
		FIZ:AddItems(1091, 4, 8, 520, {[44710] = 1})
		FIZ:AddInstance(1091, 4, 8, Quest.no_dq, 800, false)
		FIZ:AddInstance(1091, 4, 8, Quest.no_dq, 2000, true)
	-- Frenzyheart Tribe 1104	
		FIZ:AddQuest(1104, 1, 5, 12582, 51000)
		FIZ:AddQuest(1104, 6, 8, 12703, 500)
		FIZ:AddQuest(1104, 6, 8, 12759, 500)
		FIZ:AddQuest(1104, 6, 8, 12760, 500)
		FIZ:AddQuest(1104, 6, 8, 12758, 500)
		FIZ:AddQuest(1104, 6, 8, 12702, 500)
		FIZ:AddQuest(1104, 6, 8, 12734, 500)
		FIZ:AddQuest(1104, 6, 8, 12741, 500)
		FIZ:AddQuest(1104, 6, 8, 12732, 500)
	-- The Oracles 1105	
		FIZ:AddQuest(1105, 1, 5, 12689, 23239)
		FIZ:AddQuest(1105, 6, 8, 12761, 500)
		FIZ:AddQuest(1105, 6, 8, 12705, 500)
		FIZ:AddQuest(1105, 6, 8, 12762, 500)
		FIZ:AddQuest(1105, 6, 8, 12704, 500)
		FIZ:AddQuest(1105, 6, 8, 12735, 500)
		FIZ:AddQuest(1105, 6, 8, 12737, 500)
		FIZ:AddQuest(1105, 6, 8, 12736, 500)
		FIZ:AddQuest(1105, 6, 8, 12726, 500)
	-- Cataclysm	
	-- Avengers of Hyjal 1204	
	---- For FIRELAND "NORMAL"  ""HC UNKNOWN""	
	------ (courtesy of Henrik H AKA Szereka <Vendredi> At HELLSCREAM-EU)	
	---- stop at friendly	
		FIZ:AddMob(1204, 4, 5, "Druid of the Flame", 5, zone.Firelands)
		FIZ:AddMob(1204, 4, 5, "Cinderweb Spider", 5, zone.Firelands)
		FIZ:AddMob(1204, 4, 5, "Fire Scorpion", 5, zone.Firelands)
		FIZ:AddMob(1204, 4, 5, "Cinderweb Spinner", 15, zone.Firelands)
		FIZ:AddMob(1204, 4, 5, "Cinderweb Drone", 15, zone.Firelands)
		FIZ:AddMob(1204, 4, 5, "Fire Turtle Hatchling", 15, zone.Firelands)
		FIZ:AddMob(1204, 4, 5, "Flamewalker Beast Handler", 15, zone.Firelands)
		FIZ:AddMob(1204, 4, 5, "Flamewalker Cauterizer", 15, zone.Firelands)
		FIZ:AddMob(1204, 4, 5, "Flamewalker Forward Guard", 15, zone.Firelands)
		FIZ:AddMob(1204, 4, 5, "Flamewalker Hound Master", 15, zone.Firelands)
		FIZ:AddMob(1204, 4, 5, "Flamewalker Pathfinder", 15, zone.Firelands)
		FIZ:AddMob(1204, 4, 5, "Flamewalker Sentinel", 15, zone.Firelands)
		FIZ:AddMob(1204, 4, 5, "Flamewalker Taskmaster", 15, zone.Firelands)
		FIZ:AddMob(1204, 4, 5, "Flamewalker Trainee", 15, zone.Firelands)
		FIZ:AddMob(1204, 4, 5, "Giant Fire Scorpion", 15, zone.Firelands)
		FIZ:AddMob(1204, 4, 5, "Hell Hound", 15, zone.Firelands)
		FIZ:AddMob(1204, 4, 5, "Molten Surger", 15, zone.Firelands)
		FIZ:AddMob(1204, 4, 5, "Patriarch Fire Turtle", 15, zone.Firelands)
		FIZ:AddMob(1204, 4, 5, "Unbound Pyrelord", 15, zone.Firelands)
		FIZ:AddMob(1204, 4, 5, "Unbound Smoldering Elemental", 15, zone.Firelands)
		FIZ:AddMob(1204, 4, 5, "Flamewalker Animator", 16, zone.Firelands)
		FIZ:AddMob(1204, 4, 5, "Flamewalker Centurion", 16, zone.Firelands)
		FIZ:AddMob(1204, 4, 5, "Harbringer of Flame", 16, zone.Firelands)
		FIZ:AddMob(1204, 4, 5, "Matriarch Fire Turtle", 16, zone.Firelands)
	---- Stop at Honored	
		FIZ:AddMob(1204, 4, 6, "Ancient Core Hound", 50, zone.Firelands)
		FIZ:AddMob(1204, 4, 6, "Blazing Monstrosity", 50, zone.Firelands)
		FIZ:AddMob(1204, 4, 6, "Flame Archon", 50, zone.Firelands)
		FIZ:AddMob(1204, 4, 6, "Flamewalker Overseer", 50, zone.Firelands)
		FIZ:AddMob(1204, 4, 6, "Flamewalker Subjugator", 50, zone.Firelands)
		FIZ:AddMob(1204, 4, 6, "Kar the Everburning", 50, zone.Firelands)
		FIZ:AddMob(1204, 4, 6, "Molten Erupter", 50, zone.Firelands)
		FIZ:AddMob(1204, 4, 6, "Molten Flamefather", 50, zone.Firelands)
		FIZ:AddMob(1204, 4, 6, "Molten Lord", 50, zone.Firelands)
		FIZ:AddMob(1204, 4, 6, "Unstable Magma", 50, zone.Firelands)
	---- Stop at Exalted	
		FIZ:AddMob(1204, 4, 8, "Beth'tilac", 250, zone.Firelands)
		FIZ:AddMob(1204, 4, 8, "Lord Rhyolith", 250, zone.Firelands)
		FIZ:AddMob(1204, 4, 8, "Shannox", 250, zone.Firelands)
		FIZ:AddMob(1204, 4, 8, "Majordomo Staghelm", 400, zone.Firelands)
		FIZ:AddMob(1204, 4, 8, "Alysrazor", 250, zone.Firelands)
		FIZ:AddMob(1204, 4, 8, "Baleroc", 400, zone.Firelands)
		FIZ:AddMob(1204, 4, 8, 11502, 400)
	-- Guardians of Hyjal 1158	
		FIZ:AddQuest(1158, 4, 8, 29177, 250, FIZ_LIMIT_TYPE_FALSE)
		FIZ:AddQuest(1158, 4, 8, 29163, 250, FIZ_LIMIT_TYPE_TRUE)
		FIZ:AddQuest(1158, 4, 8, 29122, 250)
		FIZ:AddQuest(1158, 4, 8, 29162, 250)
		FIZ:AddQuest(1158, 4, 8, 29246, 250)
		FIZ:AddQuest(1158, 4, 8, 29148, 250)
		FIZ:AddQuest(1158, 4, 8, 29247, 250)
		FIZ:AddQuest(1158, 4, 8, 29165, 250)
		FIZ:AddQuest(1158, 4, 8, 29126, 250)
		FIZ:AddQuest(1158, 4, 8, 29248, 250)
		FIZ:AddQuest(1158, 4, 8, 29128, 350)
		FIZ:AddQuest(1158, 4, 8, 29138, 250)
		FIZ:AddQuest(1158, 4, 8, 29179, 250)
		FIZ:AddQuest(1158, 4, 8, 29141, 250)
		FIZ:AddQuest(1158, 4, 8, 29139, 250)
		FIZ:AddQuest(1158, 4, 8, 29304, 250)
		FIZ:AddQuest(1158, 4, 8, 29137, 250)
		FIZ:AddQuest(1158, 4, 8, 29143, 250)
		FIZ:AddQuest(1158, 4, 8, 29142, 250)
		FIZ:AddQuest(1158, 4, 8, 29101, 150)
		FIZ:AddQuest(1158, 4, 8, 29161, 150)
		FIZ:AddQuest(1158, 4, 8, 29147, 150)
		FIZ:AddQuest(1158, 4, 8, 29164, 150)
		FIZ:AddQuest(1158, 4, 8, 29125, 150)
		FIZ:AddInstance(1158, 4, 8, Quest.no_dq, 1000, false)
		FIZ:AddInstance(1158, 4, 8, Quest.no_dq, 1800, true)
		FIZ:AddMob(1158, 1, 8, mob.t_mobs, 10, 3)
		FIZ:AddMob(1158, 1, 8, mob.t_mobs, 15, 4)
		FIZ:AddMob(1158, 1, 8, mob.a_bosses, 150, 3)
		FIZ:AddMob(1158, 1, 8, mob.a_bosses, 250, 4)
	-- Ramkahen 1173	
		FIZ:AddSpell(1173, 1, 8, "Quest.no_dq", 1000)
		FIZ:AddSpell(1173, 1, 8, "Quest.no_dq", 1800)
		FIZ:AddMob(1173, 1, 8, mob.t_mobs, 10, 3)
		FIZ:AddMob(1173, 1, 8, mob.t_mobs, 15, 4)
		FIZ:AddMob(1173, 1, 8, mob.a_bosses, 150, 3)
		FIZ:AddMob(1173, 1, 8, mob.a_bosses, 250, 4)
		FIZ:AddQuest(1173, 4, 8, 28250, 150)
		FIZ:AddQuest(1173, 4, 8, 28736, 250)
	-- The Earthen Ring 1135	
		FIZ:AddSpell(1135, 1, 8, "Quest.no_dq", 1000)
		FIZ:AddSpell(1135, 1, 8, "Quest.no_dq", 1800)
		FIZ:AddMob(1135, 1, 8, mob.t_mobs, 10, 3)
		FIZ:AddMob(1135, 1, 8, mob.t_mobs, 15, 4)
		FIZ:AddMob(1135, 1, 8, mob.a_bosses, 150, 3)
		FIZ:AddMob(1135, 1, 8, mob.a_bosses, 250, 4)
	-- Therazane 1171	
		FIZ:AddSpell(1171, 1, 8, "Quest.no_dq", 1000)
		FIZ:AddSpell(1171, 1, 8, "Quest.no_dq", 1800)
		FIZ:AddQuest(1171, 4, 8, 28488, 250)
		FIZ:AddQuest(1171, 4, 8, 27046, 250)
		FIZ:AddQuest(1171, 4, 8, 26710, 250)
		FIZ:AddQuest(1171, 4, 8, 27047, 250)
		FIZ:AddQuest(1171, 4, 8, 27049, 250)
		FIZ:AddQuest(1171, 4, 8, 27050, 250)
		FIZ:AddQuest(1171, 4, 8, 27051, 250)
		FIZ:AddQuest(1171, 4, 8, 27048, 250)
		FIZ:AddQuest(1171, 5, 8, 28390, 350)
		FIZ:AddQuest(1171, 5, 8, 28391, 350)
		FIZ:AddMob(1171, 1, 8, mob.t_mobs, 10, 3)
		FIZ:AddMob(1171, 1, 8, mob.t_mobs, 15, 4)
		FIZ:AddMob(1171, 1, 8, mob.a_bosses, 150, 3)
		FIZ:AddMob(1171, 1, 8, mob.a_bosses, 250, 4)
	-- Mist Of Panderia	
	-- Golden Lotus 1269	
		FIZ:AddQuest(1269, 1, 8, 30240, 250)
		FIZ:AddQuest(1269, 1, 8, 30242, 250)
		FIZ:AddQuest(1269, 1, 8, 30243, 250)
		FIZ:AddQuest(1269, 1, 8, 30261, 350)
		FIZ:AddQuest(1269, 1, 8, 30266, 250)
		FIZ:AddQuest(1269, 1, 8, 30277, 250)
		FIZ:AddQuest(1269, 1, 8, 30280, 250)
		FIZ:AddQuest(1269, 1, 8, 30306, 250)
		FIZ:AddQuest(1269, 1, 8, 32648, 300)
		FIZ:AddMob(1269, 1, 8, "All Normal Mobs", 20, zone.Vale_of_Eternal_Blossoms)
		FIZ:AddMob(1269, 1, 8, "All Rare Mobs", 400, zone.Vale_of_Eternal_Blossoms)
		FIZ:AddMob(1269, 1, 8, "Jade Colossus", 100, zone.Vale_of_Eternal_Blossoms)
		FIZ:AddMob(1269, 1, 8, "Milau", 60, zone.Vale_of_Eternal_Blossoms)
	-- Shado-Pan 1270	
		FIZ:AddItems(1270, 1, 8, 1000, {[86592] = 1})
		FIZ:AddQuest(1270, 1, 8, 32657, 400)
		FIZ:AddQuest(1270, 1, 8, 31198, 250)
		FIZ:AddQuest(1270, 1, 8, 32650, 400)
		FIZ:AddQuest(1270, 1, 8, 31114, 250)
		FIZ:AddQuest(1270, 1, 8, 31113, 250)
		FIZ:AddQuest(1270, 1, 8, 31047, 250)
		FIZ:AddQuest(1270, 1, 8, 31044, 250)
		FIZ:AddQuest(1270, 1, 8, 31120, 250)
		FIZ:AddQuest(1270, 1, 8, 31043, 250)
		FIZ:AddQuest(1270, 1, 8, 31199, 250)
		FIZ:AddQuest(1270, 1, 8, 31041, 250)
		FIZ:AddQuest(1270, 1, 8, 31201, 250)
		FIZ:AddQuest(1270, 1, 8, 31200, 250)
		FIZ:AddQuest(1270, 1, 8, 31048, 250)
		FIZ:AddQuest(1270, 1, 8, 31045, 250)
		FIZ:AddQuest(1270, 1, 8, 31049, 250)
		FIZ:AddQuest(1270, 1, 8, 31046, 250)
		FIZ:AddQuest(1270, 1, 8, 31042, 250)
		FIZ:AddQuest(1270, 1, 8, 31061, 250)
		FIZ:AddQuest(1270, 1, 8, 31116, 250)
		FIZ:AddQuest(1270, 1, 8, 31040, 250)
		FIZ:AddQuest(1270, 1, 8, 31196, 250)
		FIZ:AddQuest(1270, 1, 8, 31204, 250)
		FIZ:AddQuest(1270, 1, 8, 31203, 250)
		FIZ:AddQuest(1270, 1, 8, 31197, 250)
		FIZ:AddQuest(1270, 1, 8, 31119, 250)
		FIZ:AddQuest(1270, 1, 8, 31039, 250)
		FIZ:AddQuest(1270, 1, 8, 31117, 250)
		FIZ:AddQuest(1270, 1, 8, 31062, 250)
		FIZ:AddQuest(1270, 1, 8, 32650, 300)
	-- The August Celestials 1341	
		FIZ:AddItems(1341, 1, 8, 1000, {[86592] = 1})
		FIZ:AddQuest(1341, 1, 8, 32657, 400)
	------ Krasarang Wilds	
		FIZ:AddQuest(1341, 1, 8, 30740, 15)
		FIZ:AddQuest(1341, 1, 8, 30716, 250)
		FIZ:AddQuest(1341, 1, 8, 30730, 350)
		FIZ:AddQuest(1341, 1, 8, 30725, 250)
		FIZ:AddQuest(1341, 1, 8, 30739, 350)
		FIZ:AddQuest(1341, 1, 8, 30727, 350)
		FIZ:AddQuest(1341, 1, 8, 30732, 350)
		FIZ:AddQuest(1341, 1, 8, 30728, 350)
		FIZ:AddQuest(1341, 1, 8, 30737, 350)
		FIZ:AddQuest(1341, 1, 8, 30717, 250)
		FIZ:AddQuest(1341, 1, 8, 30734, 350)
		FIZ:AddQuest(1341, 1, 8, 30273, 350)
		FIZ:AddQuest(1341, 1, 8, 30729, 250)
		FIZ:AddQuest(1341, 1, 8, 30731, 350)
		FIZ:AddQuest(1341, 1, 8, 30735, 250)
		FIZ:AddQuest(1341, 1, 8, 30726, 350)
		FIZ:AddQuest(1341, 1, 8, 30718, 350)
		FIZ:AddQuest(1341, 1, 8, 30738, 350)
		FIZ:AddQuest(1341, 1, 8, 30733, 350)
		FIZ:AddQuest(1341, 1, 8, 30736, 250)
	------ Kun-Lai Summit	
		FIZ:AddQuest(1341, 1, 8, 31517, 250)
		FIZ:AddQuest(1341, 1, 8, 30879, 250)
		FIZ:AddQuest(1341, 1, 8, 30880, 250)
		FIZ:AddQuest(1341, 1, 8, 30881, 250)
		FIZ:AddQuest(1341, 1, 8, 30882, 250)
		FIZ:AddQuest(1341, 1, 8, 30885, 250)
		FIZ:AddQuest(1341, 1, 8, 30883, 250)
		FIZ:AddQuest(1341, 1, 8, 30902, 250)
		FIZ:AddQuest(1341, 1, 8, 30907, 250)
	------ Townlong Steppes	
		FIZ:AddQuest(1341, 1, 8, 30065, 250)
		FIZ:AddQuest(1341, 1, 8, 30063, 250)
		FIZ:AddQuest(1341, 1, 8, 30068, 250)
		FIZ:AddQuest(1341, 1, 8, 30066, 250)
		FIZ:AddQuest(1341, 1, 8, 30064, 250)
		FIZ:AddQuest(1341, 1, 8, 30006, 250)
		FIZ:AddQuest(1341, 1, 8, 30067, 250)
	------ The Jade Forest	
		FIZ:AddQuest(1341, 1, 8, 30954, 250)
		FIZ:AddQuest(1341, 1, 8, 30953, 250)
		FIZ:AddQuest(1341, 1, 8, 30958, 250)
		FIZ:AddQuest(1341, 1, 8, 30925, 250)
		FIZ:AddQuest(1341, 1, 8, 30955, 250)
		FIZ:AddQuest(1341, 1, 8, 30959, 250)
		FIZ:AddQuest(1341, 1, 8, 30957, 250)
		FIZ:AddQuest(1341, 1, 8, 30956, 350)
		FIZ:AddQuest(1341, 1, 8, 30952, 300)
	-- The Klaxxi 1337	
		FIZ:AddQuest(1337, 1, 8, 32659, 400)
		FIZ:AddItems(1337, 1, 8, 1000, {[86592] = 1})
		FIZ:AddItems(1337, 4, 8, 250, {[87903] = 5})
		FIZ:AddQuest(1337, 4, 8, 99, 780)
		FIZ:AddQuest(1337, 4, 8, 99, 260)
		FIZ:AddQuest(1337, 4, 8, 99, 390)
		FIZ:AddQuest(1337, 1, 8, 31232, 500)
		FIZ:AddQuest(1337, 1, 8, 31271, 500)
		FIZ:AddQuest(1337, 1, 8, 31238, 500)
		FIZ:AddQuest(1337, 1, 8, 31109, 500)
		FIZ:AddQuest(1337, 1, 8, 31216, 125)
		FIZ:AddQuest(1337, 1, 8, 31237, 500)
		FIZ:AddQuest(1337, 1, 8, 31231, 125)
		FIZ:AddQuest(1337, 1, 8, 31111, 500)
		FIZ:AddQuest(1337, 1, 8, 31509, 500)
		FIZ:AddQuest(1337, 1, 8, 31494, 500)
		FIZ:AddQuest(1337, 1, 8, 31272, 125)
		FIZ:AddQuest(1337, 1, 8, 31024, 500)
		FIZ:AddQuest(1337, 1, 8, 31598, 500)
		FIZ:AddQuest(1337, 1, 8, 31507, 130)
		
		FIZ:AddQuest(1337, 1, 8, 31235, 250)
		FIZ:AddQuest(1337, 1, 8, 31504, 250)
		FIZ:AddQuest(1337, 1, 8, 31234, 250)
		FIZ:AddQuest(1337, 1, 8, 31510, 250)
		FIZ:AddQuest(1337, 1, 8, 31496, 250)
		FIZ:AddQuest(1337, 1, 8, 31233, 250)
		FIZ:AddQuest(1337, 1, 8, 31506, 250)
		FIZ:AddQuest(1337, 1, 8, 31503, 250)
		FIZ:AddQuest(1337, 1, 8, 31487, 250)
		FIZ:AddQuest(1337, 1, 8, 31508, 250)
		FIZ:AddQuest(1337, 1, 8, 31599, 250)
		FIZ:AddQuest(1337, 1, 8, 31269, 250)
		FIZ:AddQuest(1337, 1, 8, 31505, 250)
		FIZ:AddQuest(1337, 1, 8, 31502, 250)
		FIZ:AddQuest(1337, 1, 8, 32659, 400)
	-- Order of the Cloud Serpent 1271	
		FIZ:AddItems(1271, 1, 8, 1000, {[86592] = 1})
		FIZ:AddQuest(1271, 1, 8, 32657, 400)
		FIZ:AddQuest(1271, 4, 8, 99, 780)
		FIZ:AddQuest(1271, 4, 8, 99, 780)
		FIZ:AddQuest(1271, 4, 8, 99, 780)
		FIZ:AddQuest(1271, 4, 8, 99, 780)
	------ Jenova Longeye - Main Quests	
		FIZ:AddQuest(1271, 1, 8, 30149, 125)
		FIZ:AddQuest(1271, 1, 8, 30147, 125)
		FIZ:AddQuest(1271, 1, 8, 30148, 125)
		FIZ:AddQuest(1271, 1, 8, 30146, 125)
	------ Instructor Skythorn	
		FIZ:AddQuest(1271, 1, 8, 31707, 450)
		FIZ:AddQuest(1271, 1, 8, 30158, 450)
		FIZ:AddQuest(1271, 1, 8, 30155, 450)
		FIZ:AddQuest(1271, 1, 8, 31698, 450)
		FIZ:AddQuest(1271, 1, 8, 31706, 450)
	------ Your Hatchling	
		FIZ:AddQuest(1271, 1, 8, 30151, 450)
		FIZ:AddQuest(1271, 1, 8, 30156, 450)
		FIZ:AddQuest(1271, 1, 8, 31704, 450)
		FIZ:AddQuest(1271, 1, 8, 31708, 450)
		FIZ:AddQuest(1271, 1, 8, 30150, 450)
		FIZ:AddQuest(1271, 1, 8, 30154, 450)
		FIZ:AddQuest(1271, 1, 8, 31710, 450)
	------ Elder Anli <Serpent Master>	
		FIZ:AddQuest(1271, 1, 8, 31701, 600)
		FIZ:AddQuest(1271, 1, 8, 30157, 450)
		FIZ:AddQuest(1271, 1, 8, 31709, 450)
		FIZ:AddQuest(1271, 1, 8, 31703, 600)
		FIZ:AddQuest(1271, 1, 8, 31712, 450)
		FIZ:AddQuest(1271, 1, 8, 31705, 600)
		FIZ:AddQuest(1271, 1, 8, 31702, 600)
		FIZ:AddQuest(1271, 1, 8, 30159, 450)
		FIZ:AddQuest(1271, 1, 8, 31714, 450)
		FIZ:AddQuest(1271, 1, 8, 31194, 600)
		FIZ:AddQuest(1271, 1, 8, 31699, 450)
		FIZ:AddQuest(1271, 1, 8, 31713, 450)
		FIZ:AddQuest(1271, 1, 8, 31715, 600)
		FIZ:AddQuest(1271, 1, 8, 31711, 600)
		FIZ:AddQuest(1271, 1, 8, 31700, 450)
		FIZ:AddQuest(1271, 1, 8, 30152, 600)
		FIZ:AddQuest(1271, 1, 8, 31718, 450)
	-- Shang Xi's Academy 1216	
		FIZ:AddQuest(1216, 1, 8, Quest.no_dq, 1)
	-- The Black Prince 1359	
		FIZ:AddQuest(1359, 1, 8, Quest.no_dq, 1)
		FIZ:AddMob(1359, 1, 7, "Granite Quilen", 10)
		FIZ:AddMob(1359, 1, 7, "Shao-Tien Marauder", 10)
		FIZ:AddMob(1359, 1, 7, "Kor'thik Warcaller", 100)
		FIZ:AddMob(1359, 1, 7, "Rare Mobs", 400, zone.Isle_of_Thunder)
	-- The Lorewalkers 1345	
		FIZ:AddQuest(1345, 1, 8, Quest.no_dq, 1)
	-- The Anglers (group)	
	-- The Anglers 1302	
		
		FIZ:AddQuest(1302, 1, 8, 30613, 500)
		FIZ:AddQuest(1302, 1, 8, 30754, 500)
		FIZ:AddQuest(1302, 1, 8, 30588, 500)
		FIZ:AddQuest(1302, 1, 8, 31443, 350, {[86542] = 1})
		FIZ:AddQuest(1302, 1, 8, 30658, 500)
		FIZ:AddQuest(1302, 1, 8, 30586, 500)
		FIZ:AddQuest(1302, 1, 8, 30753, 500)
		FIZ:AddQuest(1302, 1, 8, 30678, 500)
		FIZ:AddQuest(1302, 1, 8, 31446, 350, {[86545] = 1})
		FIZ:AddQuest(1302, 1, 8, 30763, 500)
		FIZ:AddQuest(1302, 1, 8, 30698, 500)
		FIZ:AddQuest(1302, 1, 8, 30584, 500)
		FIZ:AddQuest(1302, 1, 8, 30700, 500)
		FIZ:AddQuest(1302, 1, 8, 31444, 350, {[86544] = 1})
		FIZ:AddQuest(1302, 1, 8, 30701, 500)
		FIZ:AddQuest(1302, 1, 8, 30585, 500)
		FIZ:AddQuest(1302, 1, 8, 30598, 500)
	-- Nat Pagle 1358	
		FIZ:AddQuest(1358, 1, 8, 31443, 600, {[86542] = 1})
		FIZ:AddQuest(1358, 1, 8, 31446, 600, {[86545] = 1})
		FIZ:AddQuest(1358, 1, 8, 31444, 600, {[86544] = 1})
		FIZ:AddQuest(1358, 1, 8, 36804, 350, {[116820] = 1})
		FIZ:AddQuest(1358, 1, 8, 39283, 350, {[127994] = 1})
		FIZ:AddQuest(1358, 1, 8, 36800, 350, {[116819] = 1})
		FIZ:AddQuest(1358, 1, 8, 36802, 350, {[116818] = 1})
		FIZ:AddQuest(1358, 1, 8, 36805, 350, {[116821] = 1})
		FIZ:AddQuest(1358, 1, 8, 38406, 350, {[122696] = 1})
		FIZ:AddQuest(1358, 1, 8, 36803, 350, {[116817] = 1})
		FIZ:AddQuest(1358, 1, 8, 36806, 350, {[116822] = 1})
	-- The Tillers (group)	
	-- The Tillers 1272	
		FIZ:AddGeneral(1272, 1, 8, "1", 50, "1", "00", nil, 0)
		
	------ Farmer Yoon	
	-------- Main	
		FIZ:AddQuest(1272, 1, 8, 30337, 1000)
		FIZ:AddQuest(1272, 1, 8, 30335, 1000)
		FIZ:AddQuest(1272, 1, 8, 30334, 1000)
		FIZ:AddQuest(1272, 1, 8, 30336, 1000)
		FIZ:AddQuest(1272, 1, 8, 30333, 1000)
	-------- Farm	
		FIZ:AddQuest(1272, 1, 8, 31672, 350)
		FIZ:AddQuest(1272, 1, 8, 31942, 350)
		FIZ:AddQuest(1272, 1, 8, 31673, 350)
		FIZ:AddQuest(1272, 1, 8, 31941, 350)
		FIZ:AddQuest(1272, 1, 8, 31670, 350)
		FIZ:AddQuest(1272, 1, 8, 31669, 350)
		FIZ:AddQuest(1272, 1, 8, 31674, 350)
		FIZ:AddQuest(1272, 1, 8, 31675, 350)
		FIZ:AddQuest(1272, 1, 8, 31943, 350)
		FIZ:AddQuest(1272, 1, 8, 31671, 350)
	------ Tillers Union: 	
		FIZ:AddQuest(1272, 1, 8, 30318, 150)
		FIZ:AddQuest(1272, 1, 8, 30322, 150)
		FIZ:AddQuest(1272, 1, 8, 30324, 150)
		FIZ:AddQuest(1272, 1, 8, 30319, 150)
		FIZ:AddQuest(1272, 1, 8, 30326, 150)
		FIZ:AddQuest(1272, 1, 8, 30323, 150)
		FIZ:AddQuest(1272, 1, 8, 30317, 150)
		FIZ:AddQuest(1272, 1, 8, 30321, 150)
		FIZ:AddQuest(1272, 1, 8, 30325, 150)
		FIZ:AddQuest(1272, 1, 8, 30327, 150)
	-------- Tillers Union: Gifts	
		FIZ:AddQuest(1272, 1, 8, 30471, 150)
		FIZ:AddQuest(1272, 1, 8, 30474, 150)
		FIZ:AddQuest(1272, 1, 8, 30475, 150)
		FIZ:AddQuest(1272, 1, 8, 30473, 150)
		FIZ:AddQuest(1272, 1, 8, 30479, 150)
		FIZ:AddQuest(1272, 1, 8, 30477, 150)
		FIZ:AddQuest(1272, 1, 8, 30478, 150)
		FIZ:AddQuest(1272, 1, 8, 30476, 150)
		FIZ:AddQuest(1272, 1, 8, 30472, 150)
		FIZ:AddQuest(1272, 1, 8, 30470, 150)
	-- Chee Chee 1277	
		FIZ:AddQuest(1277, 1, 8, 30471, 1400)
		FIZ:AddItems(1277, 1, 8, 900, {[79265] = 1})
		FIZ:AddQuest(1277, 1, 8, 30402, 1800, {[74864] = 5, [74839] = 5})
		FIZ:AddItems(1277, 1, 8, 1800, {[74647] = 5})
		FIZ:AddQuest(1277, 1, 8, 30324, 2000)
	-- Ella 1275	
		FIZ:AddQuest(1275, 1, 8, 30474, 1400)
		FIZ:AddItems(1275, 1, 8, 900, {[79266] = 1})
		FIZ:AddQuest(1275, 1, 8, 30386, 1800, {[74857] = 5})
		FIZ:AddItems(1275, 1, 8, 1800, {[74651] = 5})
		FIZ:AddQuest(1275, 1, 8, 30327, 2000)
	-- Farmer Fung 1283	
		FIZ:AddQuest(1283, 1, 8, 30475, 1400)
		FIZ:AddItems(1283, 1, 8, 900, {[79268] = 1})
		FIZ:AddQuest(1283, 1, 8, 30421, 1800, {[74839] = 5})
		FIZ:AddItems(1283, 1, 8, 1800, {[74654] = 5})
		FIZ:AddQuest(1283, 1, 8, 30317, 2000)
	-- Fish Fellreed 1282	
		FIZ:AddQuest(1282, 1, 8, 30473, 1400)
		FIZ:AddItems(1282, 1, 8, 900, {[79266] = 1})
		FIZ:AddQuest(1282, 1, 8, 30427, 1800, {[74865] = 10})
		FIZ:AddItems(1282, 1, 8, 1800, {[74655] = 5})
		FIZ:AddQuest(1282, 1, 8, 30326, 2000)
	-- Gina Mudclaw 1281	
		FIZ:AddQuest(1281, 1, 8, 30479, 1400)
		FIZ:AddItems(1281, 1, 8, 900, {[79268] = 1})
		FIZ:AddQuest(1281, 1, 8, 30390, 1800, {[74856] = 5})
		FIZ:AddItems(1281, 1, 8, 1800, {[74644] = 5})
		FIZ:AddQuest(1281, 1, 8, 30322, 2000)
	-- Haohan Mudclaw 1279	
		FIZ:AddQuest(1279, 1, 8, 30477, 1400)
		FIZ:AddItems(1279, 1, 8, 900, {[79264] = 1})
		FIZ:AddQuest(1279, 1, 8, 30414, 1800, {[74833] = 5})
		FIZ:AddItems(1279, 1, 8, 1800, {[74642] = 5})
		FIZ:AddQuest(1279, 1, 8, 30319, 2000)
	-- Jogu the Drunk 1273	
		FIZ:AddQuest(1273, 1, 8, 30478, 1400)
		FIZ:AddItems(1273, 1, 8, 900, {[79267] = 1})
		FIZ:AddQuest(1273, 1, 8, 30439, 1800, {[74841] = 10})
		FIZ:AddItems(1273, 1, 8, 1800, {[74643] = 5})
		FIZ:AddQuest(1273, 1, 8, 30321, 2000)
	-- Old Hillpaw 1276	
		FIZ:AddQuest(1276, 1, 8, 30476, 1400)
		FIZ:AddItems(1276, 1, 8, 900, {[79265] = 1})
		FIZ:AddQuest(1276, 1, 8, 30396, 1800, {[74837] = 5, [74841] = 10})
		FIZ:AddItems(1276, 1, 8, 1800, {[74649] = 5})
		FIZ:AddQuest(1276, 1, 8, 30318, 2000)
	-- Sho 1278	
		FIZ:AddQuest(1278, 1, 8, 30472, 1400)
		FIZ:AddItems(1278, 1, 8, 900, {[79267] = 1})
		FIZ:AddQuest(1278, 1, 8, 30408, 1800, {[74856] = 5, [74848] = 10})
		FIZ:AddItems(1278, 1, 8, 1800, {[74645] = 5})
		FIZ:AddQuest(1278, 1, 8, 30325, 2000)
	-- Tina Mudclaw 1280	
		FIZ:AddQuest(1280, 1, 8, 30470, 1400)
		FIZ:AddItems(1280, 1, 8, 900, {[79264] = 1})
		FIZ:AddQuest(1280, 1, 8, 30433, 1800, {[74859] = 5, [74843] = 10})
		FIZ:AddItems(1280, 1, 8, 1800, {[74652] = 5})
		FIZ:AddQuest(1280, 1, 8, 30323, 2000)
	-- Emperor Shaohao  1492	
		FIZ:AddQuest(1492, 1, 8, 33335, 250)
		FIZ:AddQuest(1492, 1, 8, 33340, 250)
		FIZ:AddQuest(1492, 1, 8, 33341, 250)
		FIZ:AddQuest(1492, 1, 8, 33342, 250)
		FIZ:AddQuest(1492, 1, 8, 33343, 250)
		FIZ:AddQuest(1492, 1, 8, 33374, 250)
		FIZ:AddMob(1492, 1, 7, "Archiereus of Flame", 50, zone.Timeless_Isle)
		FIZ:AddMob(1492, 1, 7, "Cinderfall", 40, zone.Timeless_Isle)
		FIZ:AddMob(1492, 1, 7, "Flintlord Gairan", 40, zone.Timeless_Isle)
		FIZ:AddMob(1492, 1, 7, "Urdur the Cauterizer", 40, zone.Timeless_Isle)
		FIZ:AddMob(1492, 1, 7, "Champion of the Black Flame", 30, zone.Timeless_Isle)
		FIZ:AddMob(1492, 1, 7, "High Priest of Ordos", 25, zone.Timeless_Isle)
		FIZ:AddMob(1492, 1, 7, "Blazebound Chanter", 20, zone.Timeless_Isle)
		FIZ:AddMob(1492, 1, 7, "Eternal Kiln", 20, zone.Timeless_Isle)
		FIZ:AddMob(1492, 1, 7, "Eternal Kilnmaster", 20, zone.Timeless_Isle)
		FIZ:AddMob(1492, 1, 7, "Jakur of Ordan", 20, zone.Timeless_Isle)
		FIZ:AddMob(1492, 1, 7, "Molten Guardian", 20, zone.Timeless_Isle)
		FIZ:AddMob(1492, 1, 7, "Watcher Osu", 20, zone.Timeless_Isle)
		FIZ:AddMob(1492, 1, 7, "Burning Berserker", 15, zone.Timeless_Isle)
		FIZ:AddMob(1492, 1, 7, "Ordon Fire-Watcher", 10, zone.Timeless_Isle)
		FIZ:AddMob(1492, 1, 7, "Ordon Oathguard", 10, zone.Timeless_Isle)
		FIZ:AddMob(1492, 1, 7, "Ordon Candlekeeper", 5, zone.Timeless_Isle)
	-- Shado-Pan Assault 1435	
		FIZ:AddQuest(1435, 1, 8, 32640, 300, {[94221] = 3})
		FIZ:AddQuest(1435, 1, 8, 32641, 300, {[94221] = 3})
		FIZ:AddQuest(1435, 1, 8, 32707, 200, {[94221] = 3})
		FIZ:AddQuest(1435, 1, 8, 32708, 300)
		FIZ:AddMob(1435, 1, 5, 1, 30, zone.Throne_of_Thunder)
		FIZ:AddMob(1435, 1, 8, 3, 30, zone.Throne_of_Thunder)
	-- Warlords of Draenor	
	-- Arakkoa Outcasts 1515	
		FIZ:AddMob(1515, 1, 8, "Solar Magnifier", 50, zone.Spires_of_Arak)
		FIZ:AddMob(1515, 1, 8, "Dread Raven", 16, zone.Spires_of_Arak)
		FIZ:AddMob(1515, 1, 8, "Skyreach Dawnbreaker", 16, zone.Spires_of_Arak)
		FIZ:AddMob(1515, 1, 8, "Skyreach Dreadtalon", 16, zone.Spires_of_Arak)
		FIZ:AddMob(1515, 1, 8, "Deranged Plunderer", 6, zone.Spires_of_Arak)
		FIZ:AddMob(1515, 1, 8, "Amorphic Cognitor", 6, zone.Spires_of_Arak)
		FIZ:AddMob(1515, 1, 8, "Air Familiar", 5, zone.Spires_of_Arak)
		FIZ:AddMob(1515, 1, 8, "Apexia Sol-Mender", 5, zone.Spires_of_Arak)
		FIZ:AddMob(1515, 1, 8, "Befuddled Relic-Seeker", 5, zone.Spires_of_Arak)
		FIZ:AddMob(1515, 1, 8, "Flighted Storm-Spinner", 5, zone.Spires_of_Arak)
		FIZ:AddMob(1515, 1, 8, "Glowing Energizer", 5, zone.Spires_of_Arak)
		FIZ:AddMob(1515, 1, 8, "Highmaul Relic-Seeker", 5, zone.Spires_of_Arak)
		FIZ:AddMob(1515, 1, 8, "Highmaul Skullcrusher", 5, zone.Spires_of_Arak)
		FIZ:AddMob(1515, 1, 8, "Infected Mechanic", 5, zone.Spires_of_Arak)
		FIZ:AddMob(1515, 1, 8, "Infected Plunderer", 5, zone.Spires_of_Arak)
		FIZ:AddMob(1515, 1, 8, "Kirox the Wind Dancer", 5, zone.Spires_of_Arak)
		FIZ:AddMob(1515, 1, 8, "Skyreach Archeologist", 5, zone.Spires_of_Arak)
		FIZ:AddMob(1515, 1, 8, "Skyreach Dreadtalon", 5, zone.Spires_of_Arak)
		FIZ:AddMob(1515, 1, 8, "Skyreach Labormaster", 5, zone.Spires_of_Arak)
		FIZ:AddMob(1515, 1, 8, "Skyreach Tempest-Keeper", 5, zone.Spires_of_Arak)
		FIZ:AddMob(1515, 1, 8, "Stalwart Warden", 5, zone.Spires_of_Arak)
		FIZ:AddMob(1515, 1, 8, "Vigilant Dreadtalon", 5, zone.Spires_of_Arak)
		FIZ:AddMob(1515, 1, 8, "Darting Swift Feather", 1, zone.Spires_of_Arak)
		FIZ:AddMob(1515, 1, 8, "Enthralled Shadowdweller", 1, zone.Spires_of_Arak)
		FIZ:AddMob(1515, 1, 8, "Repugnant Shadowdweller", 1, zone.Spires_of_Arak)
		FIZ:AddMob(1515, 1, 8, "Solar Familar", 1, zone.Spires_of_Arak)
		FIZ:AddItems(1515, 1, 8, 2500, {[117492] = 1})
	-- Steamwheedle Preservation Society 1711	
		FIZ:AddItems(1711, 1, 8, 350, {[118100] = 1})
		FIZ:AddItems(1711, 1, 8, 12.5, {[118099] = 1})
		FIZ:AddQuest(1711, 1, 8, 37210, 500)
		FIZ:AddQuest(1711, 1, 8, 37211, 500)
		FIZ:AddQuest(1711, 1, 8, 37221, 500)
		FIZ:AddQuest(1711, 1, 8, 37222, 500)
		FIZ:AddQuest(1711, 1, 8, 37223, 500)
		FIZ:AddQuest(1711, 1, 8, 37224, 500)
		FIZ:AddQuest(1711, 1, 8, 37225, 500)
		FIZ:AddQuest(1711, 1, 8, 37226, 500)
		FIZ:AddQuest(1711, 1, 8, 37520, 500)
	-- Warlords of Draenor 6.2	
	-- Order of the Awakened 1849	
		FIZ:AddQuest(1849, 1, 8, 39433, 1500)
	-- The Saberstalkers 1850	
		FIZ:AddQuest(1850, 1, 8, 39565, 1500)
		FIZ:AddQuest(1850, 1, 8, 39529, 250)
	-- Dead Factions	
	-- Shen'dralar 809	
		FIZ:AddQuest(809, 1, 8, Quest.outd, 1)
	-- Gelkis Clan Centaur 92	
		FIZ:AddQuest(92, 1, 8, Quest.outd, 1)
	-- Magram Clan Centaur 93	
		FIZ:AddQuest(93, 1, 8, Quest.outd, 1)
	-- Zandalar Tribe 270	
		FIZ:AddQuest(270, 1, 8, Quest.outd, 1)
	-- The Brewmasters 1351	
		FIZ:AddQuest(1351, 1, 8, Quest.outd, 1)
	-- 11 guildName	
	if (IsInGuild()) then	
		FIZ:AddQuest("guildName", 4, 8, Quest.bp_quest_fac, 125)
	end	
	-- local preGC = collectgarbage("count")	
	collectgarbage("collect")	
	-- print("Collected " .. (preGC-collectgarbage("count")) .. " kB of garbage fiz");	
end