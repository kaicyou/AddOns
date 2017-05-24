local FOLDER_NAME, SSA = ...

local Auras = LibStub("AceAddon-3.0"):GetAddon("ShamanAuras")
local L = LibStub("AceLocale-3.0"):GetLocale("ShamanAuras", true)

-- Prepare All Move Functionality
Auras:BuildMoveUI(SSA.AuraObjectsEle,SSA.MoveStringsEle,"Ele");
Auras:BuildMoveUI(SSA.AuraObjectsEnh,SSA.MoveStringsEnh,"Enh");
Auras:BuildMoveUI(SSA.AuraObjectsRes,SSA.MoveStringsRes,"Res");

-- Initialize Elemental Vertical Bars
Auras:CreateVerticalStatusBar(SSA.AscendanceBarEle,"LEFT",5,251,147,255,L["Ascendance"],15);
Auras:CreateVerticalStatusBar(SSA.AstralShiftBarEle,"LEFT",5,240,56,255,L["Astral Shift"],8);
Auras:CreateVerticalStatusBar(SSA.BloodlustBarEle,"LEFT",5,255,18,76,L["Bloodlust"],40);
Auras:CreateVerticalStatusBar(SSA.EarthgrabTotemBarEle,"RIGHT",-5,127,175,97,L["Earthgrab"],20);
Auras:CreateVerticalStatusBar(SSA.AncestralGuidanceBarEle,"LEFT",5,51,108,255,L["Ancestral Guidance"],10);
Auras:CreateVerticalStatusBar(SSA.ElementalBlastCritBar,"LEFT",5,255,99,154,L["Critical Strike"],10);
Auras:CreateVerticalStatusBar(SSA.ElementalBlastHasteBar,"LEFT",5,255,99,154,L["Haste"],10);
Auras:CreateVerticalStatusBar(SSA.ElementalBlastMasteryBar,"LEFT",5,255,99,154,L["Mastery"],10);
Auras:CreateVerticalStatusBar(SSA.FireElementalBar,"RIGHT",-5,255,160,43,L["Fire Elemental"],60);
Auras:CreateVerticalStatusBar(SSA.HeroismBarEle,"LEFT",5,0,121,255,L["Heroism"],40);
Auras:CreateVerticalStatusBar(SSA.HexBarEle,"RIGHT",-5,76,195,71,L["Hex"],60);
Auras:CreateVerticalStatusBar(SSA.LiquidMagmaTotemBar,"RIGHT",-5,255,101,65,L["Liquid Magma"],15);
Auras:CreateVerticalStatusBar(SSA.StormElementalBar,"RIGHT",-5,110,145,255,L["Storm Elemental"],30);
Auras:CreateVerticalStatusBar(SSA.EarthElementalBar,"RIGHT",-5,213,165,131,L["Earth Elemental"],60);
Auras:CreateVerticalStatusBar(SSA.ElementalMasteryBar,"LEFT",5,117,206,255,L["Elemental Mastery"],20);
Auras:CreateVerticalStatusBar(SSA.TimeWarpBarEle,"LEFT",5,195,42,255,L["Time Warp"],40);
Auras:CreateVerticalStatusBar(SSA.VoodooTotemBarEle,"RIGHT",-5,76,195,71,L["Voodoo"],10);
Auras:CreateVerticalStatusBar(SSA.WindRushTotemBarEle,"RIGHT",-5,174,195,86,L["Wind Rush"],15);

-- Initialize Enhancement Vertical Bars
Auras:CreateVerticalStatusBar(SSA.AscendanceBarEnh,"LEFT",5,251,147,255,L["Ascendance"],15);
Auras:CreateVerticalStatusBar(SSA.AstralShiftBarEnh,"LEFT",5,240,56,255,L["Astral Shift"],8);
Auras:CreateVerticalStatusBar(SSA.BloodlustBarEnh,"LEFT",5,255,18,76,L["Bloodlust"],40);
Auras:CreateVerticalStatusBar(SSA.BoulderfistBar,"RIGHT",-5,201,169,139,L["Boulderfist"],10);
Auras:CreateVerticalStatusBar(SSA.CrashLightningBar,"RIGHT",-5,0,133,255,L["Crash Lightning"],10);
Auras:CreateVerticalStatusBar(SSA.EarthgrabTotemBarEnh,"RIGHT",-5,127,175,97,L["Earthgrab"],20);
Auras:CreateVerticalStatusBar(SSA.EarthenSpikeBar,"RIGHT",-5,255,18,76,L["Bloodlust"],10);
Auras:CreateVerticalStatusBar(SSA.FlametongueBar,"RIGHT",-5,255,160,43,L["Flametongue"],16);
Auras:CreateVerticalStatusBar(SSA.LandslideBar,"RIGHT",-5,223,101,93,L["Landslide"],10);
Auras:CreateVerticalStatusBar(SSA.FrostbrandBar,"RIGHT",-5,0,200,255,L["Frostbrand"],16);
Auras:CreateVerticalStatusBar(SSA.HeroismBarEnh,"LEFT",5,0,121,255,L["Heroism"],40);
Auras:CreateVerticalStatusBar(SSA.HexBarEnh,"RIGHT",-5,76,195,71,L["Hex"],60);
Auras:CreateVerticalStatusBar(SSA.SpiritWalkBar,"LEFT",5,177,129,65,L["Spirit Walk"],8);
Auras:CreateVerticalStatusBar(SSA.TimeWarpBarEnh,"LEFT",5,195,42,255,L["Time Warp"],40);
Auras:CreateVerticalStatusBar(SSA.VoodooTotemBarEnh,"RIGHT",-5,76,195,71,L["Voodoo"],10);
Auras:CreateVerticalStatusBar(SSA.WindRushTotemBarEnh,"RIGHT",-5,174,195,86,L["Wind Rush"],15);
Auras:CreateVerticalStatusBar(SSA.WindsongBar,"RIGHT",-5,157,247,255,L["Windsong"],20);

-- Initialize Restoration Vertical Bars
Auras:CreateVerticalStatusBar(SSA.AncestralProtectionTotemBar,"RIGHT",-5,255,52,56,L["Ancestral Protection"],30);
Auras:CreateVerticalStatusBar(SSA.AscendanceBarRes,"LEFT",5,251,147,255,L["Ascendance"],15);
Auras:CreateVerticalStatusBar(SSA.AstralShiftBarRes,"LEFT",5,240,56,255,L["Astral Shift"],8);
Auras:CreateVerticalStatusBar(SSA.BloodlustBarRes,"LEFT",5,255,18,76,L["Bloodlust"],40);
Auras:CreateVerticalStatusBar(SSA.CloudburstTotemBar,"RIGHT",-5,117,208,255,L["Cloudburst"],15);
Auras:CreateVerticalStatusBar(SSA.EarthgrabTotemBarRes,"RIGHT",-5,127,175,97,L["Earthgrab"],20);
Auras:CreateVerticalStatusBar(SSA.AncestralGuidanceBarRes,"LEFT",5,51,108,255,L["Ancestral Guidance"],10);
Auras:CreateVerticalStatusBar(SSA.HealingStreamTotemOneBar,"RIGHT",-5,55,205,255,L["Healing Stream"],15);
Auras:CreateVerticalStatusBar(SSA.HealingStreamTotemTwoBar,"RIGHT",-5,55,205,255,L["Healing Stream"],15);
Auras:CreateVerticalStatusBar(SSA.HealingTideTotemBar,"RIGHT",-5,0,255,207,L["Healing Tide"],10);
Auras:CreateVerticalStatusBar(SSA.HeroismBarRes,"LEFT",5,0,121,255,L["Heroism"],40);
Auras:CreateVerticalStatusBar(SSA.HexBarRes,"RIGHT",-5,76,195,71,L["Hex"],60);
Auras:CreateVerticalStatusBar(SSA.SpiritLinkTotemBar,"RIGHT",-5,117,208,255,L["Spirit Link"],6);
Auras:CreateVerticalStatusBar(SSA.SpiritwalkersGraceBar,"LEFT",5,167,255,84,L["Spiritwalker's Grace"],15);
Auras:CreateVerticalStatusBar(SSA.TimeWarpBarRes,"LEFT",5,195,42,255,L["Time Warp"],40);
Auras:CreateVerticalStatusBar(SSA.UnleashLifeBar,"LEFT",5,25,255,0,L["Unleash Life"],10);
Auras:CreateVerticalStatusBar(SSA.VoodooTotemBarRes,"RIGHT",-5,76,195,71,L["Voodoo"],10);
Auras:CreateVerticalStatusBar(SSA.WindRushTotemBarRes,"RIGHT",-5,174,195,86,L["Wind Rush"],15);
