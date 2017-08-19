local SSA, Auras, L, LSM = unpack(select(2,...))

-- Prepare All Move Functionality
Auras:BuildMoveUI(1);
Auras:BuildMoveUI(2);
Auras:BuildMoveUI(3);

-- Initialize Elemental Vertical Bars
Auras:CreateVerticalStatusBar(SSA.AscendanceBar1,"LEFT",5,251,147,255,Auras:GetSpellName(114050),15);
Auras:CreateVerticalStatusBar(SSA.AstralShiftBar1,"LEFT",5,240,56,255,Auras:GetSpellName(108271),8);
Auras:CreateVerticalStatusBar(SSA.BloodlustBar1,"LEFT",5,255,18,76,Auras:GetSpellName(2825),40);
Auras:CreateVerticalStatusBar(SSA.EarthgrabTotemBar1,"RIGHT",-5,127,175,97,Auras:GetSpellName(64695),20);
Auras:CreateVerticalStatusBar(SSA.AncestralGuidanceBar1,"LEFT",5,51,108,255,Auras:GetSpellName(108281),10);
Auras:CreateVerticalStatusBar(SSA.ElementalBlastCritBar,"LEFT",5,255,99,154,Auras:GetSpellName(165533),10);
Auras:CreateVerticalStatusBar(SSA.ElementalBlastHasteBar,"LEFT",5,255,99,154,Auras:GetSpellName(28507),10);
Auras:CreateVerticalStatusBar(SSA.ElementalBlastMasteryBar,"LEFT",5,255,99,154,Auras:GetSpellName(165485),10);
Auras:CreateVerticalStatusBar(SSA.FireElementalBar,"RIGHT",-5,255,160,43,Auras:GetSpellName(165533),60);
Auras:CreateVerticalStatusBar(SSA.HeroismBar1,"LEFT",5,0,121,255,Auras:GetSpellName(32182),40);
Auras:CreateVerticalStatusBar(SSA.HexBar1,"RIGHT",-5,76,195,71,Auras:GetSpellName(51514),60);
Auras:CreateVerticalStatusBar(SSA.LiquidMagmaTotemBar,"RIGHT",-5,255,101,65,Auras:GetSpellName(192231),15);
Auras:CreateVerticalStatusBar(SSA.StormElementalBar,"RIGHT",-5,110,145,255,Auras:GetSpellName(192249),30);
Auras:CreateVerticalStatusBar(SSA.EarthElementalBar,"RIGHT",-5,213,165,131,Auras:GetSpellName(198103),60);
Auras:CreateVerticalStatusBar(SSA.ElementalMasteryBar,"LEFT",5,117,206,255,Auras:GetSpellName(16166),20);
Auras:CreateVerticalStatusBar(SSA.TimeWarpBar1,"LEFT",5,195,42,255,Auras:GetSpellName(80353),40);
Auras:CreateVerticalStatusBar(SSA.VoodooTotemBar1,"RIGHT",-5,76,195,71,Auras:GetSpellName(17009),10);
Auras:CreateVerticalStatusBar(SSA.WindRushTotemBar1,"RIGHT",-5,174,195,86,Auras:GetSpellName(177600),15);

-- Initialize Enhancement Vertical Bars
Auras:CreateVerticalStatusBar(SSA.AscendanceBar2,"LEFT",5,251,147,255,Auras:GetSpellName(114051),15);
Auras:CreateVerticalStatusBar(SSA.AstralShiftBar2,"LEFT",5,240,56,255,Auras:GetSpellName(108271),8);
Auras:CreateVerticalStatusBar(SSA.BloodlustBar2,"LEFT",5,255,18,76,Auras:GetSpellName(2825),40);
--Auras:CreateVerticalStatusBar(SSA.BoulderfistBar,"RIGHT",-5,201,169,139,L["Boulderfist"],10); REMOVED 7.2.5
Auras:CreateVerticalStatusBar(SSA.CrashLightningBar,"RIGHT",-5,0,133,255,Auras:GetSpellName(187874),10);
Auras:CreateVerticalStatusBar(SSA.EarthgrabTotemBar2,"RIGHT",-5,127,175,97,Auras:GetSpellName(64695),20);
Auras:CreateVerticalStatusBar(SSA.EarthenSpikeBar,"RIGHT",-5,255,18,76,Auras:GetSpellName(2825),10);
Auras:CreateVerticalStatusBar(SSA.FlametongueBar,"RIGHT",-5,255,160,43,Auras:GetSpellName(193796),16);
Auras:CreateVerticalStatusBar(SSA.LandslideBar,"RIGHT",-5,223,101,93,Auras:GetSpellName(197992),10);
Auras:CreateVerticalStatusBar(SSA.LightningCrashBar,"RIGHT",-5,0,133,255,Auras:GetSpellName(242284),16,LSM.MediaTable.statusbar['Frost']);
Auras:CreateVerticalStatusBar(SSA.FrostbrandBar,"RIGHT",-5,0,200,255,Auras:GetSpellName(196834),16);
Auras:CreateVerticalStatusBar(SSA.HeroismBar2,"LEFT",5,0,121,255,Auras:GetSpellName(32182),40);
Auras:CreateVerticalStatusBar(SSA.HexBar2,"RIGHT",-5,76,195,71,Auras:GetSpellName(51514),60);
Auras:CreateVerticalStatusBar(SSA.SpiritWalkBar,"LEFT",5,177,129,65,Auras:GetSpellName(58875),8);
Auras:CreateVerticalStatusBar(SSA.TimeWarpBar2,"LEFT",5,195,42,255,Auras:GetSpellName(80353),40);
Auras:CreateVerticalStatusBar(SSA.VoodooTotemBar2,"RIGHT",-5,76,195,71,Auras:GetSpellName(17009),10);
Auras:CreateVerticalStatusBar(SSA.WindRushTotemBar2,"RIGHT",-5,174,195,86,Auras:GetSpellName(177600),15);
Auras:CreateVerticalStatusBar(SSA.WindsongBar,"RIGHT",-5,157,247,255,Auras:GetSpellName(201898),20);

-- Initialize Restoration Vertical Bars
Auras:CreateVerticalStatusBar(SSA.AncestralProtectionTotemBar,"RIGHT",-5,255,52,56,Auras:GetSpellName(207399),30);
Auras:CreateVerticalStatusBar(SSA.AscendanceBar3,"LEFT",5,251,147,255,Auras:GetSpellName(114052),15);
Auras:CreateVerticalStatusBar(SSA.AstralShiftBar3,"LEFT",5,240,56,255,Auras:GetSpellName(108271),8);
Auras:CreateVerticalStatusBar(SSA.BloodlustBar3,"LEFT",5,255,18,76,Auras:GetSpellName(2825),40);
Auras:CreateVerticalStatusBar(SSA.CloudburstTotemBar,"RIGHT",-5,117,208,255,Auras:GetSpellName(157153),15);
Auras:CreateVerticalStatusBar(SSA.EarthgrabTotemBar3,"RIGHT",-5,127,175,97,Auras:GetSpellName(64695),20);
Auras:CreateVerticalStatusBar(SSA.AncestralGuidanceBar3,"LEFT",5,51,108,255,Auras:GetSpellName(108281),10);
Auras:CreateVerticalStatusBar(SSA.HealingStreamTotemOneBar,"RIGHT",-5,55,205,255,Auras:GetSpellName(5394),15);
Auras:CreateVerticalStatusBar(SSA.HealingStreamTotemTwoBar,"RIGHT",-5,55,205,255,Auras:GetSpellName(5394),15);
Auras:CreateVerticalStatusBar(SSA.HealingTideTotemBar,"RIGHT",-5,0,255,207,Auras:GetSpellName(108280),10);
Auras:CreateVerticalStatusBar(SSA.HeroismBar3,"LEFT",5,0,121,255,Auras:GetSpellName(32182),40);
Auras:CreateVerticalStatusBar(SSA.HexBar3,"RIGHT",-5,76,195,71,Auras:GetSpellName(51514),60);
Auras:CreateVerticalStatusBar(SSA.SpiritLinkTotemBar,"RIGHT",-5,117,208,255,Auras:GetSpellName(204314),6);
Auras:CreateVerticalStatusBar(SSA.SpiritwalkersGraceBar,"LEFT",5,167,255,84,Auras:GetSpellName(79206),15);
Auras:CreateVerticalStatusBar(SSA.TimeWarpBar3,"LEFT",5,195,42,255,Auras:GetSpellName(80353),40);
Auras:CreateVerticalStatusBar(SSA.UnleashLifeBar,"LEFT",5,25,255,0,Auras:GetSpellName(73685),10);
Auras:CreateVerticalStatusBar(SSA.VoodooTotemBar3,"RIGHT",-5,76,195,71,Auras:GetSpellName(17009),10);
Auras:CreateVerticalStatusBar(SSA.WindRushTotemBar3,"RIGHT",-5,174,195,86,Auras:GetSpellName(177600),15);
