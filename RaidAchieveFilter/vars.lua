--RaidAchieveFilter Achievement IDs
--Please do not use without permission
RAFdb = {}
RAFdb.AchID, RAFdb.MapID, RAFdb.MapName = {}, {}, {}
local uFaction = "H"
if UnitFactionGroup("player") == "Alliance" then uFaction = "A" end
--Raids
RAFdb.AchID[1] = {4534,4535,4536,4537,4531,4628,4577,4538,4578,4528,4629,4582,4539,4529,4630,4579,4580,4527,4631,4601,4581,4530,4532,4636,4583}--ICC10
RAFdb.AchID[2] = {4610,4611,4612,4613,4604,4632,4615,4614,4616,4605,4633,4617,4618,4606,4634,4619,4620,4607,4635,4621,4622,4597,4608,4637,4584}--ICC25
RAFdb.AchID[3] = {1997,1858,562,1996,2182,566,2176,568,1856,2178,2180,564,2146,572,2184,574,576,578}--Naxx10
RAFdb.AchID[4] = {2140,1859,563,2139,2183,567,2177,569,1857,2179,2181,565,2147,573,2185,575,577,579}--Naxx25
RAFdb.AchID[5] = {4404,4402,4403,4396,4407,4405,4406,4397}--Onyxia10
RAFdb.AchID[6] = {2148,1869,1874,622,2149,1870,1875,623}-- Malygos
RAFdb.AchID[7] = {2047,624,1876,2049,2050,2051}--Sarth10
RAFdb.AchID[8] = {2048,1877,625,2052,2053,2054}--Sarth25
RAFdb.AchID[9] = {4817,4818,4815,4816}--Halion
RAFdb.AchID[10] = {3797,3936,3996,3798,3799,3800,3917,3918}--ToC10
RAFdb.AchID[11] = {3937,3813,3997,3815,3816,3916,3812}--Toc25
RAFdb.AchID[12] = {2886,2888,2890,2892,2894,2909,3097,2907,2905,2911,2913,2914,2915,3056,2927,2925,2930,2919,2923,2933,2937,2931,2934,3058,2945,2947,2940,2939,2941,2953,2955,2959,2951,3006,3076,2985,2979,2980,2982,3177,3178,3179,2961,2967,2969,2963,3182,3138,2989,3180,2971,2973,2977,2975,3176,2996,3181,3008,3009,3012,3015,3014,3157,3141,3158,3159,3003,3036}--Ulduar10
RAFdb.AchID[13] = {2887,2889,2891,2893,2895,2910,3098,2908,2906,2912,2918,2916,2917,3057,2928,2926,2929,2921,2924,2935,2938,2932,2936,3059,2946,2948,2943,2942,2944,2954,2956,2960,2952,3007,3077,2984,3118,2981,2983,3185,3186,3187,2962,2968,2970,2965,3184,2995,3237,3189,2972,2974,2978,2976,3183,2997,3188,3010,3011,3013,3016,3017,3161,3162,3163,3164,3002,3037}--Ulduar25
RAFdb.AchID[14] = {5306,5307,5310,5308,5309,4849,5094,5107,5108,5109,5115,5116,4842}--BWD
RAFdb.AchID[15] = {5300,4852,5311,5312,5118,5117,5119,5120,5121,4850}--BoT
RAFdb.AchID[16] = {5304,5305,5122,5123,4851}--To4W
RAFdb.AchID[17] = {5821,5829,5810,5813,5830,5799,5855,5807,5808,5806,5809,5805,5804,5803,5802}--Firelands
RAFdb.AchID[18] = {6174,6128,6129,6175,6084,6105,6133,6180,6109,6110,6111,6112,6113,6114,6115,6116,6106,6107,6177}--DragonSoul
RAFdb.AchID[19] = {6937,6936,6553,6683,6518,6922,6725,6726,6727,6728,6729,6730,6718,6845}--HoF
RAFdb.AchID[20] = {6823,6674,7056,6687,7933,6686,6455,6719,6720,6721,6722,6723,6724,6458,6844}--MSV
RAFdb.AchID[21] = {6717,6933,6824,6825,6731,6732,6733,6734,6689}--Terrace
RAFdb.AchID[22] = {8094,8038,8073,8077,8082,8097,8098,8037,8081,8087,8086,8090,8056,8057,8058,8059,8060,8061,8062,8063,8064,8065,8066,8067,8068,8069,8070,8071,8072}--ToT
RAFdb.AchID[23] = {8536,8528,8532,8521,8530,8520,8453,8448,8538,8529,8527,8543,8531,8537,8463,8465,8466,8467,8468,8469,8470,8471,8472,8478,8479,8480,8481,8482,8458,8459,8461,8462}--Siege
RAFdb.AchID[24] = {8978,8979,8981,8929,8980,8982,8930,8983,8984,8952,8966,8967,8956,8932,8968,8969,8970,8971,8972,8973,8989,8990,8991,8992}--BRFoundry
RAFdb.AchID[25] = {10026,10057,10013,10054,9972,9979,9988,10086,10012,10087,9989,10030,10073,10027,10032,10033,10034,10035,10253,10037,10040,10038,10039,10041,10042,10043,10023,10024,10025,10020,10019}--Hellfire
RAFdb.AchID[26] = {8948,8947,8974,8975,8958,8976,8977,8949,8960,8961,8962,8963,8964,8965,8986,8987,8988}--Highmaul
if uFaction == "A" then tinsert(RAFdb.AchID[23], 8679) else tinsert(RAFdb.AchID[23], 8680) end 
--Lich King Dungeons
RAFdb.AchID[27] = {2038,2056,1862,481,492} --Ahn'kahet
RAFdb.AchID[28] = {1296,1297,1860,480,491} --Azjol'nerub
RAFdb.AchID[29] = {1872,1817,479,500} --Culling of Strat
RAFdb.AchID[30] = {2151,2057,2039,482,493} --Drak'tharon
RAFdb.AchID[31] = {4522,4523,4516,4519} --Forge of Souls
RAFdb.AchID[32] = {2058,2040,1864,2152,484,495} --Gun'drak
RAFdb.AchID[33] = {1834,2042,1867,486,497} --Halls of Lightning
RAFdb.AchID[34] = {4526,4518,4521} --Halls of Reflection
RAFdb.AchID[35] = {2154,1866,2155,485,496} --Halls of Stone
RAFdb.AchID[36] = {2150,2037,2036,478,490} --Nexus
RAFdb.AchID[37] = {1868,2046,2045,2044,1871,487,498} --Oculus
RAFdb.AchID[38] = {4524,4525,4517,4520} --Pit of Saron
if uFaction == "A" then RAFdb.AchID[39] = {3802,3803,3804,4296,4298}
else RAFdb.AchID[39] = {3802,3803,3804,3778,4297} end --Trial of the Champion
RAFdb.AchID[40] = {1919,477,489} --Utgarde Keep
RAFdb.AchID[41] = {2043,1873,2156,2157,488,499} --Utgarde Pinnacle
RAFdb.AchID[42] = {2153,2041,1865,1816,483,494} --Violet Hold
-- Cataclysm Dungeons
RAFdb.AchID[43] = {5281,5282,5283,5284,4833,5060} --Blackrock Caverns
RAFdb.AchID[44] = {5366,5367,5368,5369,5370,5371,5083} -- Deadmines
RAFdb.AchID[45] = {5995,6130,6117} --End Time
RAFdb.AchID[46] = {5297,5298,4840,5062} --Grim Batol
RAFdb.AchID[47] = {5293,5294,5296,5295,4841,5065} --Halls of Origination
RAFdb.AchID[48] = {6132,6119} --Hour of Twilight
RAFdb.AchID[49] = {5291,5290,5292,4848,5066} --Lost City of Tol'vir
RAFdb.AchID[50] = {5503,5504,5505,5093}--Shadowfang Keep
RAFdb.AchID[51] = {5287,4846,5063} --Stonecore
RAFdb.AchID[52] = {5285,5286,4839,5061} --Throne of Tides
RAFdb.AchID[53] = {5289,5288,4847,5064} --Vortex Pinnacle
RAFdb.AchID[54] = {6127,6070,6118} --Well of Eternity
RAFdb.AchID[55] = {5761,5750,5858,5760,5769} --Zul'Aman
RAFdb.AchID[56] = {5743,5762,5765,5744,5759,5768} --Zul'gurub
-- MoP Dungeons
RAFdb.AchID[57] = {6479,6476,6945,10010,6759} --Gate of the Setting Sun
RAFdb.AchID[58] = {6713,6478,6736,6755,6756} --Mogu'shan Palace
RAFdb.AchID[59] = {6684,6427,6760} --Scarlet Halls
RAFdb.AchID[60] = {6929,6928,6946,6761} --Scarlet Monastery
RAFdb.AchID[61] = {6394,6396,6531,6715,6821,6762} --Scholomance
RAFdb.AchID[62] = {6471,6477,6472,6469,6470} --Shado-Pan
RAFdb.AchID[63] = {6485,6822,6688,10011,6763} --Siege of Niuzao Temple
RAFdb.AchID[64] = {6420,6400,6089,6402,6457,6456} --Stormstout Brewery
RAFdb.AchID[65] = {6475,6460,6671,6757,6758} --Temple of the Jade Serpent
-- WoD Dungeons
RAFdb.AchID[66] = {9023,9551,9552,9039,9049,10080}--Auchindoun
RAFdb.AchID[67] = {8993,9005,9008,9037,9046,10076}--Bloodmaul Slag Mines
RAFdb.AchID[68] = {9024,9007,9043,9052,10082}--Grimrail Depot
RAFdb.AchID[69] = {9083,9081,9082,9038,9047,10079}--Iron Docks
RAFdb.AchID[70] = {9018,9025,9026,9041,9054,10084}--Shadowmoon Burial Grounds
RAFdb.AchID[71] = {9033,9034,9035,9036,8843,8844,10081}--Skyreach
RAFdb.AchID[72] = {9017,9493,9223,9044,9053,10083}--The Everbloom
RAFdb.AchID[73] = {9045,9058,9056,9057,9042,9055,10085}--UBRS
RAFdb.MapID = {
--Raids
604,604,535,535,718,527,531,531,609,543,543,529,529,--LK
754,758,773,800,824,--Cata
897,896,886,930,953,--MoP
988,1026,994,--WoD
--Dungeons
522,533,521,534,601,530,525,603,526,520,528,602,542,523,524,536,--LK
753,756,820,757,759,819,747,764,768,767,769,816,781,793,--Cata
875,885,871,874,898,877,887,876,867,--MoP
984,964,993,987,969,989,1008,995}--WoD
--Scenarios
if uFaction == "A" then 
	RAFdb.AchID[74] = {7261,7258,7257,7252,8310}--Brewing
	RAFdb.AchID[75] = {7989,7990,7991,7992,7993,7988}--Patience
	RAFdb.AchID[76] = {7273,7272,7271}--Arena
	RAFdb.AchID[77] = {8016,8017}--Assault
	RAFdb.AchID[78] = {8347,8314,8364}--Battle
	RAFdb.AchID[79] = {8329,8330,8316,8312}--Blood
	RAFdb.AchID[80] = {6931,6930,6923}--Brewmoon
	RAFdb.AchID[81] = {7275,7276,8368,7522,8311}--Crypt
	RAFdb.AchID[82] = {7987,7984,7986,8009}--Dagger
	RAFdb.AchID[83] = {8319,8317,8318}--DarkHeart
	RAFdb.AchID[84] = {7267,7266,7265}--Greenstone
	RAFdb.AchID[85] = {8012,8011,8010}--Lion's
	RAFdb.AchID[86] = {8295,8294,8327}--Ragefire
	RAFdb.AchID[87] = {7526,7527,7523}--Theramore
	RAFdb.AchID[88] = {7231,7232,7239,7249,7248}--Unga
	local MapIDs = {878,912,899,883,940,939,884,900,914,937,880,911,938,906,882}
	for i = 1, #MapIDs do tinsert(RAFdb.MapID, MapIDs[i]) end
	for i = 1, 87 do RAFdb.MapName[i] = GetMapNameByID(RAFdb.MapID[i]) end
	RAFdb.MapName[76] = "Arena of Annihilation"-- (Proving Grounds)
	RAFdb.MapName[79] = "Blood in the Snow"-- (Dun Morogh)
	RAFdb.MapName[83] = "Dark Heart of Pandaria"-- (Vale of Eternal Blossoms)
	RAFdb.MapName[84] = "Greenstone Village"-- (Jade Forest)
	RAFdb.MapName[85] = "Lion's Landing"-- (Krasarang Wilds)
	RAFdb.MapName[87] = "Theramore's Fall"-- (Dustwallow Marsh)
else
	RAFdb.AchID[74] = {7261,7258,7257,7252,8310}--Brewing
	RAFdb.AchID[75] = {7989,7990,7991,7992,7993,7988}--Patience
	RAFdb.AchID[76] = {7273,7272,7271}--Arena
	RAFdb.AchID[77] = {8016,8017}--Assault
	RAFdb.AchID[78] = {8347,8315,8366}--Battle
	RAFdb.AchID[79] = {8329,8330,8316,8312}--Blood
	RAFdb.AchID[80] = {6931,6930,6923}--Brewmoon
	RAFdb.AchID[81] = {7275,7276,8368,7522,8311}--Crypt
	RAFdb.AchID[82] = {7987,7984,7986,8009}--Dagger
	RAFdb.AchID[83] = {8319,8317,8318}--DarkHeart
	RAFdb.AchID[84] = {8015,8014,8013}--Domination
	RAFdb.AchID[85] = {7267,7266,7265}--Greenstone
	RAFdb.AchID[86] = {8295,8294,8327}--Ragefire
	RAFdb.AchID[87] = {7529,7530,7524}--Theramore
	RAFdb.AchID[88] = {7231,7232,7239,7249,7248}--Unga
	local MapIDs = {878,912,899,883,940,939,884,900,914,937,920,880,938,907,882}
	for i = 1, #MapIDs do tinsert(RAFdb.MapID, MapIDs[i]) end
	for i = 1, 87 do RAFdb.MapName[i] = GetMapNameByID(RAFdb.MapID[i]) end
	RAFdb.MapName[76] = "Arena of Annihilation"--(Proving Grounds)
	RAFdb.MapName[79] = "Blood in the Snow"--(Dun Morogh)
	RAFdb.MapName[83] = "Dark Heart of Pandaria"--(Vale of Eternal Blossoms)
	RAFdb.MapName[84] = "Domination Point"--(Krasarang Wilds)
	RAFdb.MapName[85] = "Greenstone Village"--(Jade Forest)
	RAFdb.MapName[87] = "Theramore's Fall"--(Dustwallow Marsh)
end
RAFdb.MapName[1] = RAFdb.MapName[1].." [10]"
RAFdb.MapName[2] = RAFdb.MapName[2].." [25]"--ICC
RAFdb.MapName[3] = RAFdb.MapName[3].." [10]"
RAFdb.MapName[4] = RAFdb.MapName[4].." [25]"--Naxx
RAFdb.MapName[5] = RAFdb.MapName[5].." [10/25]"--Onyxia
RAFdb.MapName[6] = RAFdb.MapName[6].." [10/25]"--Malygos
RAFdb.MapName[7] = RAFdb.MapName[7].." [10]"
RAFdb.MapName[8] = RAFdb.MapName[8].." [25]"--Sarth
RAFdb.MapName[9] = RAFdb.MapName[9].." [10/25]"--Halion
RAFdb.MapName[10] = RAFdb.MapName[10].." [10]"
RAFdb.MapName[11] = RAFdb.MapName[11].." [25]"--ToC
RAFdb.MapName[12] = RAFdb.MapName[12].." [10]"
RAFdb.MapName[13] = RAFdb.MapName[13].." [25]"--Ulduar