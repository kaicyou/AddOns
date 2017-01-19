local FOLDER_NAME, SSA = ...
local version = GetAddOnMetadata(FOLDER_NAME,"Version");
local L = LibStub("AceLocale-3.0"):GetLocale("ShamanAuras", true)
local Auras = LibStub("AceAddon-3.0"):GetAddon("ShamanAuras")

local ele_options

local function GetElementalOptions()
	if not ele_options then
		ele_options = {
			type = "group",
			order = 1,
			name = L["Elemental Auras"],
			desc = L["Auras used by the Elemental specialization"],
			args = {
				desc = {
					order = 0,
					type = "description",
					name = L["Elemental Shaman Auras"],
				},
				show = {
					order = 1,
					name = L["Show Elemental Auras"],
					desc = L["Toggle the display of Elemental Auras"],
					type = "toggle",
					get = function()
						return Auras.db.char.frames.eleGrp.enabled;
					end,
					set = function(_, value)
						Auras.db.char.frames.eleGrp.enabled = value;
						if (not value) then
							AuraGroupEle:Hide();
						else
							AuraGroupEle:Show();
						end
					end,
				},
				MajorAuras = {
					name = L["Major Auras"],
					type = "group",
					order = 2,
					guiInline = true,
					args = {
						AncestralGuidanceEle = {
							order = 1,
							type = "toggle",
							name = L["Ancestral Guidance"],
							get = function() 
								return Auras.db.char.aura[1].AncestralGuidanceEle;
							end,
							set = function(_, value)
								Auras.db.char.aura[1].AncestralGuidanceEle = value
								Auras:UpdateTalents()
							end,
						},
						AscendanceEle = {
							order = 2,
							type = "toggle",
							name = L["Ascendance"],
							get = function() 
								return Auras.db.char.aura[1].AscendanceEle;
							end,
							set = function(_, value)
								Auras.db.char.aura[1].AscendanceEle = value
								Auras:UpdateTalents()
							end,
						},
						Earthquake = {
							order = 3,
							type = "toggle",
							name = L["Earthquake"],
							get = function()
								return Auras.db.char.aura[1].Earthquake;
							end,
							set = function(_, value)
								Auras.db.char.aura[1].Earthquake = value
								Auras:UpdateTalents()
							end,
						},
						EarthShock = {
							order = 4,
							type = "toggle",
							name = L["Earth Shock"],
							get = function()
								return Auras.db.char.aura[1].EarthShock;
							end,
							set = function(_, value)
								Auras.db.char.aura[1].EarthShock = value
								Auras:UpdateTalents()
							end,
						},
						ElementalBlast = {
							order = 5,
							type = "toggle",
							name = L["Elemental Blast"],
							get = function()
								return Auras.db.char.aura[1].ElementalBlast;
							end,
							set = function(_, value)
								Auras.db.char.aura[1].ElementalBlast = value
								Auras:UpdateTalents()
							end,
						},
						ElementalMastery = {
							order = 6,
							type = "toggle",
							name = L["Elemental Mastery"],
							get = function()
								return Auras.db.char.aura[1].ElementalMastery;
							end,
							set = function(_, value)
								Auras.db.char.aura[1].ElementalMastery = value
								Auras:UpdateTalents()
							end,
						},
						FireElemental = {
							order = 7,
							type = "toggle",
							name = L["Fire Elemental"],
							get = function() 
								return Auras.db.char.aura[1].FireElemental;
							end,
							set = function(_, value)
								Auras.db.char.aura[1].FireElemental = value
								Auras:UpdateTalents()
							end,
						},
						FlameShock = {
							order = 8,
							type = "toggle",
							name = L["Flame Shock"],
							get = function()
								return Auras.db.char.aura[1].FlameShock;
							end,
							set = function(_, value)
								Auras.db.char.aura[1].FlameShock = value
								Auras:UpdateTalents()
							end,
						},
						Icefury = {
							order = 9,
							type = "toggle",
							name = L["Icefury"],
							get = function() 
								return Auras.db.char.aura[1].Icefury;
							end,
							set = function(_, value)
								Auras.db.char.aura[1].Icefury = value
								Auras:UpdateTalents()
							end,
						},
						LavaBurst = {
							order = 10,
							type = "toggle",
							name = L["Lava Burst"],
							get = function()
								return Auras.db.char.aura[1].LavaBurstEle;
							end,
							set = function(_, value)
								Auras.db.char.aura[1].LavaBurstEle = value
								Auras:UpdateTalents()
							end,
						},
						StormElemental = {
							order = 11,
							type = "toggle",
							name = L["Storm Elemental"],
							get = function() 
								return Auras.db.char.aura[1].StormElemental;
							end,
							set = function(_, value)
								Auras.db.char.aura[1].StormElemental = value
								Auras:UpdateTalents()
							end,
						},
					},
				},
				MinorAuras = {
					name = L["Minor Auras"],
					type = "group",
					order = 3,
					guiInline = true,
					args = {
						AstralShift = {
							order = 1,
							type = "toggle",
							name = L["Astral Shift"],
							get = function()
								return Auras.db.char.aura[1].AstralShiftEle;
							end,
							set = function(_, value)
								Auras.db.char.aura[1].AstralShiftEle = value
								Auras:UpdateTalents()
							end,
						},
						CleanseSpirit = {
							order = 2,
							type = "toggle",
							name = L["Cleanse Spirit"],
							get = function()
								return Auras.db.char.aura[1].CleanseSpiritEle;
							end,
							set = function(_, value)
								Auras.db.char.aura[1].CleanseSpiritEle = value
								Auras:UpdateTalents()
							end,
						},
						EarthElemental = {
							order = 3,
							type = "toggle",
							name = L["Earth Elemental"],
							get = function()
								return Auras.db.char.aura[1].EarthElemental;
							end,
							set = function(_, value)
								Auras.db.char.aura[1].EarthElemental = value
								Auras:UpdateTalents()
							end,
						},
						EarthgrabTotemEle = {
							order = 4,
							type = "toggle",
							name = L["Earthgrab Totem"],
							get = function()
								return Auras.db.char.aura[1].EarthgrabTotemEle;
							end,
							set = function(_, value)
								Auras.db.char.aura[1].EarthgrabTotemEle = value
								Auras:UpdateTalents()
							end,
						},
						GustOfWind = {
							order = 5,
							type = "toggle",
							name = L["Gust of Wind"],
							get = function()
								return Auras.db.char.aura[1].GustWindEle;
							end,
							set = function(_, value)
								Auras.db.char.aura[1].GustWindEle = value
								Auras:UpdateTalents()
							end,
						},
						Hex = {
							order = 6,
							type = "toggle",
							name = L["Hex"],
							get = function()
								return Auras.db.char.aura[1].HexEle;
							end,
							set = function(_, value)
								Auras.db.char.aura[1].HexEle = value
								Auras:UpdateTalents()
							end,
						},
						Thunderstorm = {
							order = 7,
							type = "toggle",
							name = L["Thunderstorm"],
							get = function()
								return Auras.db.char.aura[1].Thunderstorm;
							end,
							set = function(_, value)
								Auras.db.char.aura[1].Thunderstorm = value
								Auras:UpdateTalents()
							end,
						},
						LightningSurgeTotemEle = {
							order = 8,
							type = "toggle",
							name = L["Lightning Surge Totem"],
							get = function()
								return Auras.db.char.aura[1].LightningSurgeTotemEle;
							end,
							set = function(_, value)
								Auras.db.char.aura[1].LightningSurgeTotemEle = value
								Auras:UpdateTalents()
							end,
						},
						VoodooTotemEle = {
							order = 9,
							type = "toggle",
							name = L["Voodoo Totem"],
							get = function()
								return Auras.db.char.aura[1].VoodooTotemEle;
							end,
							set = function(_, value)
								Auras.db.char.aura[1].VoodooTotemEle = value
								Auras:UpdateTalents()
							end,
						},
						Windshear = {
							order = 10,
							type = "toggle",
							name = L["Wind Shear"],
							get = function() 
								return Auras.db.char.aura[1].WindShearEle;
							end,
							set = function(_, value)
								Auras.db.char.aura[1].WindShearEle = value
								Auras:UpdateTalents()
							end,
						},
					},
				},
				ProgressBars = {
					name = L["Progress Bars"],
					type = "group",
					order = 4,
					guiInline = true,
					args = {
						MaelstromBarEle = {
							order = 1,
							type = "toggle",
							name = L["Maelstrom Bar"],
							get = function() 
								return Auras.db.char.aura[1].MaelstromBarEle;
							end,
							set = function(_, value)
								Auras.db.char.aura[1].MaelstromBarEle = value
							end,
						},
						IcefuryBar = {
							order = 2,
							type = "toggle",
							name = L["Icefury Bar"],
							get = function() 
								return Auras.db.char.aura[1].IcefuryBar;
							end,
							set = function(_, value)
								Auras.db.char.aura[1].IcefuryBar = value
							end,
						},
						BuffTimerBars = {
							name = L["Buff Duration Timers"],
							type = "group",
							order = 4,
							guiInline = true,
							args = {
								AncestralGuidance = {
									order = 1,
									type = "toggle",
									name = L["Ancestral Guidance"],
									get = function() 
										return Auras.db.char.aura[1].AncestralGuidanceBarEle;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].AncestralGuidanceBarEle = value
									end,
								},
								Ascendance = {
									order = 2,
									type = "toggle",
									name = L["Ascendance"],
									get = function() 
										return Auras.db.char.aura[1].AscendanceBarEle;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].AscendanceBarEle = value
									end,
								},
								AstralShift = {
									order = 3,
									type = "toggle",
									name = L["Astral Shift"],
									get = function() 
										return Auras.db.char.aura[1].AstralShiftBarEle;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].AstralShiftBarEle = value
									end,
								},
								Bloodlust = {
									order = 4,
									type = "toggle",
									name = L["Bloodlust"],
									hidden = false,
									get = function() 
										return Auras.db.char.aura[1].BloodlustBarEle;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].BloodlustBarEle = value
									end,
								},
								ElementalBlast = {
									order = 5,
									type = "toggle",
									name = L["Elemental Blast"],
									get = function() 
										return Auras.db.char.aura[1].ElementalBlastCritBar;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].ElementalBlastCritBar = value;
										Auras.db.char.aura[1].ElementalBlastHasteBar = value;
										Auras.db.char.aura[1].ElementalBlastMasteryBar = value;
									end,
								},
								ElementalMastery = {
									order = 6,
									type = "toggle",
									name = L["Elemental Mastery"],
									get = function() 
										return Auras.db.char.aura[1].ElementalMasteryBar;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].ElementalMasteryBar = value;
									end,
								},
								Heroism = {
									order = 7,
									type = "toggle",
									name = L["Heroism"],
									hidden = false,
									get = function() 
										return Auras.db.char.aura[1].HeroismBarEle;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].HeroismBarEle = value
									end,
								},
								TimeWarp = {
									order = 8,
									type = "toggle",
									name = L["Time Warp"],
									get = function() 
										return Auras.db.char.aura[1].TimeWarpBarEle;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].TimeWarpBarEle = value
									end,
								},
							},
						},
						ElementalTimerBars = {
							name = L["Elemental Duration Timers"],
							type = "group",
							order = 5,
							guiInline = true,
							args = {
								EarthElemental = {
									order = 1,
									type = "toggle",
									name = L["Earth Elemental"],
									get = function() 
										return Auras.db.char.aura[1].EarthElementalBar;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].EarthElementalBar = value;
									end,
								},
								FireElemental = {
									order = 2,
									type = "toggle",
									name = L["Fire Elemental"],
									get = function() 
										return Auras.db.char.aura[1].FireElementalBar;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].FireElementalBar = value;
									end,
								},
								StormElemental = {
									order = 3,
									type = "toggle",
									name = L["Storm Elemental"],
									get = function() 
										return Auras.db.char.aura[1].StormElementalBar;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].StormElementalBar = value;
									end,
								},
							},
						},
						TotemTimerBars = {
							name = L["Totem Duration Timers"],
							type = "group",
							order = 6,
							guiInline = true,
							args = {
								EarthgrabTotem = {
									order = 1,
									type = "toggle",
									name = L["Earthgrab Totem"],
									get = function() 
										return Auras.db.char.aura[1].EarthgrabTotemBarEle;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].EarthgrabTotemBarEle = value
									end,
								},
								VoodooTotem = {
									order = 2,
									type = "toggle",
									name = L["Voodoo Totem"],
									get = function() 
										return Auras.db.char.aura[1].VoodooTotemBarEle;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].VoodooTotemBarEle = value
									end,
								},
								WindRushTotem = {
									order = 3,
									type = "toggle",
									name = L["Wind Rush Totem"],
									get = function() 
										return Auras.db.char.aura[1].WindRushTotemBarEle;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].WindRushTotemBarEle = value
									end,
								},
								LiquidMagmaTotem = {
									order = 4,
									type = "toggle",
									name = L["Liquid Magma Totem"],
									get = function() 
										return Auras.db.char.aura[1].LiquidMagmaTotemBar;
									end,
									set = function(_, value)
										Auras.db.char.aura[1].LiquidMagmaTotemBar = value
									end,
								},
							},
						},
					},
				},
				TextureAlerts = {
					name = L["Texture Alerts"],
					type = "group",
					order = 5,
					guiInline = true,
					args = {
						TotemMastery = {
							order = 1,
							type = "toggle",
							name = L["Totem Mastery"],
							get = function() 
								return Auras.db.char.aura[1].TotemMastery;
							end,
							set = function(_, value)
								Auras.db.char.aura[1].TotemMastery = value
							end,
						},
						Stormkeeper = {
							order = 2,
							type = "toggle",
							name = L["Stormkeeper"],
							get = function() 
								return Auras.db.char.aura[1].StormkeeperChargeGrp;
							end,
							set = function(_, value)
								Auras.db.char.aura[1].StormkeeperChargeGrp = value
							end,
						},
					},
				},
			}
		}
	end
	return ele_options;
end

local enh_options

local function GetEnhancementOptions()
	if not enh_options then

		enh_options = {
			type = "group",
			order = 1,
			name = L["Enhancement Auras"],
			desc = L["Auras used by the Enhancement specialization"],
			args = {
				desc = {
					order = 0,
					type = "description",
					name = L["Enhancement Shaman Auras"],
				},
				show = {
					order = 1,
					name = L["Show Enhancement Auras"],
					desc = L["Toggle the display of Elemental Auras"],
					type = "toggle",
					get = function()
						return Auras.db.char.frames.enhGrp.enabled;
					end,
					set = function(_, value)
						Auras.db.char.frames.enhGrp.enabled = value;
						if (not value) then
							AuraGroupEnh:Hide();
						else
							AuraGroupEnh:Show();
						end
					end,
				},
				MajorAuras = {
					name = L["Major Auras"],
					type = "group",
					order = 2,
					guiInline = true,
					args = {
						AscendanceEle = {
							order = 1,
							type = "toggle",
							name = L["Ascendance"],
							get = function() 
								return Auras.db.char.aura[2].AscendanceEnh;
							end,
							set = function(_, value)
								Auras.db.char.aura[2].AscendanceEnh = value
								--Auras:ToggleAuraVisibility(1);
								Auras:UpdateTalents()
							end,
						},
						Boulderfist = {
							order = 2,
							type = "toggle",
							name = L["Boulderfist"],
							get = function()
								return Auras.db.char.aura[2].Boulderfist;
							end,
							set = function(_, value)
								Auras.db.char.aura[2].Boulderfist = value
								Auras:UpdateTalents()
							end,
						},
						CrashLightning = {
							order = 3,
							type = "toggle",
							name = L["Crash Lightning"],
							get = function()
								return Auras.db.char.aura[2].CrashLightning;
							end,
							set = function(_, value)
								Auras.db.char.aura[2].CrashLightning = value
								Auras:UpdateTalents()
							end,
						},
						DoomWinds = {
							order = 4,
							type = "toggle",
							name = L["Doom Winds"],
							get = function()
								return Auras.db.char.aura[2].DoomWinds;
							end,
							set = function(_, value)
								Auras.db.char.aura[2].DoomWinds = value
								Auras:UpdateTalents()
							end,
						},
						EarthenSpike = {
							order = 5,
							type = "toggle",
							name = L["Earthen Spike"],
							get = function()
								return Auras.db.char.aura[2].EarthenSpike;
							end,
							set = function(_, value)
								Auras.db.char.aura[2].EarthenSpike = value
								Auras:UpdateTalents()
							end,
						},
						FeralLunge = {
							order = 6,
							type = "toggle",
							name = L["Feral Lunge"],
							get = function()
								return Auras.db.char.aura[2].FeralLunge;
							end,
							set = function(_, value)
								Auras.db.char.aura[2].FeralLunge = value
								Auras:UpdateTalents()
							end,
						},
						FeralSpirit = {
							order = 7,
							type = "toggle",
							name = L["Feral Spirit"],
							get = function()
								return Auras.db.char.aura[2].FeralSpirit;
							end,
							set = function(_, value)
								Auras.db.char.aura[2].FeralSpirit = value
								Auras:UpdateTalents()
							end,
						},
						Flametongue = {
							order = 8,
							type = "toggle",
							name = L["Flametongue"],
							get = function()
								return Auras.db.char.aura[2].Flametongue;
							end,
							set = function(_, value)
								Auras.db.char.aura[2].Flametongue = value
								Auras:UpdateTalents()
							end,
						},
						Frostbrand = {
							order = 9,
							type = "toggle",
							name = L["Frostbrand"],
							get = function()
								return Auras.db.char.aura[2].Frostbrand;
							end,
							set = function(_, value)
								Auras.db.char.aura[2].Frostbrand = value
								Auras:UpdateTalents()
							end,
						},
						LavaLash = {
							order = 10,
							type = "toggle",
							name = L["Lava Lash"],
							get = function()
								return Auras.db.char.aura[2].LavaLash;
							end,
							set = function(_, value)
								Auras.db.char.aura[2].LavaLash = value
								Auras:UpdateTalents()
							end,
						},
						Stormstrike = {
							order = 11,
							type = "toggle",
							name = L["Stormstrike"],
							get = function()
								return Auras.db.char.aura[2].Stormstrike;
							end,
							set = function(_, value)
								Auras.db.char.aura[2].Stormstrike = value
								Auras:UpdateTalents()
							end,
						},
						Sundering = {
							order = 12,
							type = "toggle",
							name = L["Sundering"],
							get = function()
								return Auras.db.char.aura[2].Sundering;
							end,
							set = function(_, value)
								Auras.db.char.aura[2].Sundering = value
								Auras:UpdateTalents()
							end,
						},
						Windsong = {
							order = 13,
							type = "toggle",
							name = L["Windsong"],
							get = function()
								return Auras.db.char.aura[2].Windsong;
							end,
							set = function(_, value)
								Auras.db.char.aura[2].Windsong = value
								Auras:UpdateTalents()
							end,
						},
					},
				},
				MinorAuras = {
					name = L["Minor Auras"],
					type = "group",
					order = 3,
					guiInline = true,
					args = {
						AstralShiftEnh = {
							order = 1,
							type = "toggle",
							name = L["Astral Shift"],
							get = function()
								return Auras.db.char.aura[2].AstralShiftEnh;
							end,
							set = function(_, value)
								Auras.db.char.aura[2].AstralShiftEnh = value
								Auras:UpdateTalents()
							end,
						},
						CleanseSpirit = {
							order = 2,
							type = "toggle",
							name = L["Cleanse Spirit"],
							get = function()
								return Auras.db.char.aura[2].CleanseSpiritEnh;
							end,
							set = function(_, value)
								Auras.db.char.aura[2].CleanseSpiritEnh = value
								Auras:UpdateTalents()
							end,
						},
						EarthgrabTotemEnh = {
							order = 3,
							type = "toggle",
							name = L["Earthgrab Totem"],
							get = function()
								return Auras.db.char.aura[2].EarthgrabTotemEnh;
							end,
							set = function(_, value)
								Auras.db.char.aura[2].EarthgrabTotemEnh = value
								Auras:UpdateTalents()
							end,
						},
						Hex = {
							order = 4,
							type = "toggle",
							name = L["Hex"],
							get = function()
								return Auras.db.char.aura[2].HexEnh;
							end,
							set = function(_, value)
								Auras.db.char.aura[2].HexEnh = value
								Auras:UpdateTalents()
							end,
						},
						LightningSurgeTotemEnh = {
							order = 5,
							type = "toggle",
							name = L["Lightning Surge Totem"],
							get = function()
								return Auras.db.char.aura[2].LightningSurgeTotemEnh;
							end,
							set = function(_, value)
								Auras.db.char.aura[2].LightningSurgeTotemEnh = value
								Auras:UpdateTalents()
							end,
						},
						Rainfall = {
							order = 6,
							type = "toggle",
							name = L["Rainfall"],
							get = function()
								return Auras.db.char.aura[2].Rainfall;
							end,
							set = function(_, value)
								Auras.db.char.aura[2].Rainfall = value
								Auras:UpdateTalents()
							end,
						},
						SpiritWalk = {
							order = 7,
							type = "toggle",
							name = L["Spirit Walk"],
							get = function()
								return Auras.db.char.aura[2].SpiritWalk;
							end,
							set = function(_, value)
								Auras.db.char.aura[2].SpiritWalk = value
								Auras:UpdateTalents()
							end,
						},
						VoodooTotemEnh = {
							order = 8,
							type = "toggle",
							name = L["Voodoo Totem"],
							get = function()
								return Auras.db.char.aura[2].VoodooTotemEnh;
							end,
							set = function(_, value)
								Auras.db.char.aura[2].VoodooTotemEnh = value
								Auras:UpdateTalents()
							end,
						},
						WindShearEnh = {
							order = 9,
							type = "toggle",
							name = L["Wind Shear"],
							get = function()
								return Auras.db.char.aura[2].WindShearEnh;
							end,
							set = function(_, value)
								Auras.db.char.aura[2].WindShearEnh = value
								Auras:UpdateTalents()
							end,
						},
					},
				},
				ProgressBars = {
					name = L["Progress Bars"],
					type = "group",
					order = 4,
					guiInline = true,
					args = {
						MaelstromBarEnh = {
							order = 1,
							type = "toggle",
							name = L["Maelstrom Bar"],
							get = function() 
								return Auras.db.char.aura[2].MaelstromBarEnh;
							end,
							set = function(_, value)
								Auras.db.char.aura[2].MaelstromBarEnh = value
							end,
						},
						StormstrikeOrbs = {
							order = 2,
							type = "toggle",
							name = L["Stormstrike Lightning Orbs"],
							get = function() 
								return Auras.db.char.aura[2].StormstrikeChargeGrp;
							end,
							set = function(_, value)
								Auras.db.char.aura[2].StormstrikeChargeGrp = value
							end,
						},
						ShowBuffTimersEnh = {
							order = 1,
							type = "toggle",
							name = L["Show Buff Timers"],
							get = function() 
								return Auras.db.char.frames.timerbars.buff[2];
							end,
							set = function(_, value)
								Auras.db.char.frames.timerbars.buff[2] = value
							end,
						},
						ShowAbilityTimersEnh = {
							order = 2,
							type = "toggle",
							name = L["Show Ability Timers"],
							get = function() 
								return Auras.db.char.frames.timerbars.main[2];
							end,
							set = function(_, value)
								Auras.db.char.frames.timerbars.main[2] = value
							end,
						},
						ShowUtilityTimersEnh = {
							order = 3,
							type = "toggle",
							name = L["Show Utility Timers"],
							get = function() 
								return Auras.db.char.frames.timerbars.util[2];
							end,
							set = function(_, value)
								Auras.db.char.frames.timerbars.util[2] = value
							end,
						},
						BuffTimerBars = {
							name = L["Buff Duration Timers"],
							type = "group",
							order = 4,
							guiInline = true,
							args = {
								AscendanceBarEnh = {
									order = 1,
									type = "toggle",
									name = L["Ascendance"],
									get = function() 
										return Auras.db.char.aura[2].AscendanceBarEnh;
									end,
									set = function(_, value)
										Auras.db.char.aura[2].AscendanceBarEnh = value
									end,
								},
								AstralShiftBarEnh = {
									order = 2,
									type = "toggle",
									name = L["Astral Shift"],
									get = function() 
										return Auras.db.char.aura[2].AstralShiftBarEnh;
									end,
									set = function(_, value)
										Auras.db.char.aura[2].AstralShiftBarEnh = value
									end,
								},
								Bloodlust = {
									order = 3,
									type = "toggle",
									name = L["Bloodlust"],
									hidden = false,
									get = function() 
										return Auras.db.char.aura[2].BloodlustBarEnh;
									end,
									set = function(_, value)
										Auras.db.char.aura[2].BloodlustBarEnh = value
									end,
								},
								Heroism = {
									order = 4,
									type = "toggle",
									name = L["Heroism"],
									hidden = false,
									get = function() 
										return Auras.db.char.aura[2].HeroismBarEnh;
									end,
									set = function(_, value)
										Auras.db.char.aura[2].HeroismBarEnh = value
									end,
								},
								HexBarEnh = {
									order = 5,
									type = "toggle",
									name = L["Hex"],
									get = function() 
										return Auras.db.char.aura[2].HexBarEnh;
									end,
									set = function(_, value)
										Auras.db.char.aura[2].HexBarEnh = value
									end,
								},
								SpiritWalkBar = {
									order = 6,
									type = "toggle",
									name = L["Spirit Walk"],
									get = function() 
										return Auras.db.char.aura[2].SpiritWalkBar;
									end,
									set = function(_, value)
										Auras.db.char.aura[2].SpiritWalkBar = value
									end,
								},
								TimeWarp = {
									order = 7,
									type = "toggle",
									name = L["Time Warp"],
									get = function() 
										return Auras.db.char.aura[2].TimeWarpBarEnh;
									end,
									set = function(_, value)
										Auras.db.char.aura[2].TimeWarpBarEnh = value
									end,
								},
							},
						},
						MainTimerBars = {
							name = L["Ability Duration Timers"],
							type = "group",
							order = 6,
							guiInline = true,
							--disabled = function() return (generalSettings.theme == "Graphical") end,
							args = {
								BoulderfistBar = {
									order = 1,
									type = "toggle",
									name = L["Boulderfist"],
									get = function() 
										return Auras.db.char.aura[2].BoulderfistBar;
									end,
									set = function(_, value)
										Auras.db.char.aura[2].BoulderfistBar = value
									end,
								},
								CrashLightningBar = {
									order = 2,
									type = "toggle",
									name = L["Crash Lightning"],
									get = function() 
										return Auras.db.char.aura[2].CrashLightningBar;
									end,
									set = function(_, value)
										Auras.db.char.aura[2].CrashLightningBar = value
									end,
								},
								EarthenSpikeBar = {
									order = 3,
									type = "toggle",
									name = L["Earthen Spike"],
									get = function() 
										return Auras.db.char.aura[2].EarthenSpikeBar;
									end,
									set = function(_, value)
										Auras.db.char.aura[2].EarthenSpikeBar = value
									end,
								},
								FlametongueBar = {
									order = 4,
									type = "toggle",
									name = L["Flametongue"],
									get = function() 
										return Auras.db.char.aura[2].FlametongueBar;
									end,
									set = function(_, value)
										Auras.db.char.aura[2].FlametongueBar = value
									end,
								},
								FrostbrandBar = {
									order = 5,
									type = "toggle",
									name = L["Frostbrand"],
									get = function() 
										return Auras.db.char.aura[2].FrostbrandBar;
									end,
									set = function(_, value)
										Auras.db.char.aura[2].FrostbrandBar = value
									end,
								},
								WindsongBar = {
									order = 6,
									type = "toggle",
									name = L["Windsong"],
									get = function() 
										return Auras.db.char.aura[2].WindsongBar;
									end,
									set = function(_, value)
										Auras.db.char.aura[2].WindsongBar = value
									end,
								},
							},
						},
						TotemTimerBars = {
							name = L["Totem Duration Timers"],
							type = "group",
							order = 7,
							guiInline = true,
							args = {
								EarthgrabTotemBarEnh = {
									order = 1,
									type = "toggle",
									name = L["Earthgrab Totem"],
									get = function() 
										return Auras.db.char.aura[2].EarthgrabTotemBarEnh;
									end,
									set = function(_, value)
										Auras.db.char.aura[2].EarthgrabTotemBarEnh = value
									end,
								},
								VoodooTotemBarEnh = {
									order = 2,
									type = "toggle",
									name = L["Voodoo Totem"],
									get = function() 
										return Auras.db.char.aura[2].VoodooTotemBarEnh;
									end,
									set = function(_, value)
										Auras.db.char.aura[2].VoodooTotemBarEnh = value
									end,
								},
								WindRushTotemBarEnh = {
									order = 3,
									type = "toggle",
									name = L["Wind Rush Totem"],
									get = function() 
										return Auras.db.char.aura[2].WindRushTotemBarEnh;
									end,
									set = function(_, value)
										Auras.db.char.aura[2].WindRushTotemBarEnh = value
									end,
								},
							},
						},
					},
				},
				TextureAlerts = {
					name = L["Texture Alerts"],
					type = "group",
					order = 5,
					guiInline = true,
					args = {
						DoomWinds = {
							order = 1,
							type = "toggle",
							name = L["Doom Winds"],
							get = function() 
								return Auras.db.char.aura[2].DoomWindsTexture;
							end,
							set = function(_, value)
								Auras.db.char.aura[2].DoomWindsTexture = value
							end,
						},
					},
				},
			}
		}
	end
	return enh_options;
end

local resto_options

local function GetRestorationOptions()
	if not resto_options then
		--local sharedGrp = SSA.SharedGrp;
		resto_options = {
			type = "group",
			order = 1,
			name = L["Restoration Auras"],
			desc = L["Auras used by the Restoration specialization"],
			args = {
				desc = {
					order = 0,
					type = "description",
					name = L["Restoration Shaman Auras"],
				},
				show = {
					order = 1,
					name = L["Show Restoration Auras"],
					desc = L["Toggle the display of Elemental Auras"],
					type = "toggle",
					get = function()
						return Auras.db.char.frames.resGrp.enabled;
					end,
					set = function(_, value)
						Auras.db.char.frames.resGrp.enabled = value;
						if (not value) then
							AuraGroupRes:Hide();
						else
							AuraGroupRes:Show();
						end
					end,
				},
				MajorAuras = {
					name = L["Major Auras"],
					type = "group",
					order = 2,
					guiInline = true,
					args = {
						AncestralGuidanceRes = {
							order = 1,
							type = "toggle",
							name = L["Ancestral Guidance"],
							get = function() 
								return Auras.db.char.aura[3].AncestralGuidanceRes;
							end,
							set = function(_, value)
								Auras.db.char.aura[3].AncestralGuidanceRes = value
								Auras:UpdateTalents()
							end,
						},
						AscendanceRes = {
							order = 2,
							type = "toggle",
							name = L["Ascendance"],
							get = function() 
								return Auras.db.char.aura[3].AscendanceRes;
							end,
							set = function(_, value)
								Auras.db.char.aura[3].AscendanceRes = value
								Auras:UpdateTalents()
							end,
						},
						CloudburstTotem = {
							order = 3,
							type = "toggle",
							name = L["Cloudburst Totem"],
							get = function() 
								return Auras.db.char.aura[3].CloudburstTotem;
							end,
							set = function(_, value)
								Auras.db.char.aura[3].CloudburstTotem = value
								Auras:UpdateTalents()
							end,
						},
						HealingRain = {
							order = 4,
							type = "toggle",
							name = L["Healing Rain"],
							get = function()
								return Auras.db.char.aura[3].HealingRain;
							end,
							set = function(_, value)
								Auras.db.char.aura[3].HealingRain = value
								Auras:UpdateTalents()
							end,
						},
						HealingStreamTotem = {
							order = 5,
							type = "toggle",
							name = L["Healing Stream Totem"],
							get = function() 
								return Auras.db.char.aura[3].HealingStreamTotem;
							end,
							set = function(_, value)
								Auras.db.char.aura[3].HealingStreamTotem = value
								Auras:UpdateTalents()
							end,
						},
						HealingTideTotem = {
							order = 6,
							type = "toggle",
							name = L["Healing Tide Totem"],
							get = function() 
								return Auras.db.char.aura[3].HealingTideTotem;
							end,
							set = function(_, value)
								Auras.db.char.aura[3].HealingTideTotem = value
								Auras:UpdateTalents()
							end,
						},
						Riptide = {
							order = 7,
							type = "toggle",
							name = L["Riptide"],
							get = function()
								return Auras.db.char.aura[3].Riptide;
							end,
							set = function(_, value)
								Auras.db.char.aura[3].Riptide = value
								Auras:UpdateTalents()
							end,
						},
						UnleashLife = {
							order = 8,
							type = "toggle",
							name = L["Unleash Life"],
							get = function()
								return Auras.db.char.aura[3].UnleashLife;
							end,
							set = function(_, value)
								Auras.db.char.aura[3].UnleashLife = value
								Auras:UpdateTalents()
							end,
						},
						SpiritLinkTotem = {
							order = 9,
							type = "toggle",
							name = L["Spirit Link Totem"],
							get = function() 
								return Auras.db.char.aura[3].SpiritLinkTotem;
							end,
							set = function(_, value)
								Auras.db.char.aura[3].SpiritLinkTotem = value
								Auras:UpdateTalents()
							end,
						},
						Wellspring = {
							order = 10,
							type = "toggle",
							name = L["Wellspring"],
							get = function() 
								return Auras.db.char.aura[3].Wellspring;
							end,
							set = function(_, value)
								Auras.db.char.aura[3].Wellspring = value
								Auras:UpdateTalents()
							end,
						},
						WindRushTotemRes = {
							order = 11,
							type = "toggle",
							name = L["Wind Rush Totem"],
							get = function() 
								return Auras.db.char.aura[3].WindRushTotemRes;
							end,
							set = function(_, value)
								Auras.db.char.aura[3].WindRushTotemRes = value
								Auras:UpdateTalents()
							end,
						},
					},
				},
				MinorAuras = {
					name = L["Minor Auras"],
					type = "group",
					order = 3,
					guiInline = true,
					args = {
						AstralShiftRes = {
							order = 1,
							type = "toggle",
							name = L["Astral Shift"],
							get = function()
								return Auras.db.char.aura[3].AstralShiftRes;
							end,
							set = function(_, value)
								Auras.db.char.aura[3].AstralShiftRes = value
								Auras:UpdateTalents()
							end,
						},
						EarthgrabTotemRes = {
							order = 2,
							type = "toggle",
							name = L["Earthgrab Totem"],
							get = function() 
								return Auras.db.char.aura[3].EarthgrabTotemRes;
							end,
							set = function(_, value)
								Auras.db.char.aura[3].EarthgrabTotemRes = value
								Auras:UpdateTalents()
							end,
						},
						FlameShockRes = {
							order = 3,
							type = "toggle",
							name = L["Flame Shock"],
							get = function() 
								return Auras.db.char.aura[3].FlameShockRes;
							end,
							set = function(_, value)
								Auras.db.char.aura[3].FlameShockRes = value
								Auras:UpdateTalents()
							end,
						},
						GustWindRes = {
							order = 4,
							type = "toggle",
							name = L["Gust of Wind"],
							get = function() 
								return Auras.db.char.aura[3].GustWindRes;
							end,
							set = function(_, value)
								Auras.db.char.aura[3].GustWindRes = value
								Auras:UpdateTalents()
							end,
						},
						Hex = {
							order = 5,
							type = "toggle",
							name = L["Hex"],
							get = function()
								return Auras.db.char.aura[3].HexRes;
							end,
							set = function(_, value)
								Auras.db.char.aura[3].HexRes = value
								Auras:UpdateTalents()
							end,
						},
						LavaBurstRes = {
							order = 6,
							type = "toggle",
							name = L["Lava Burst"],
							get = function() 
								return Auras.db.char.aura[3].LavaBurstRes;
							end,
							set = function(_, value)
								Auras.db.char.aura[3].LavaBurstRes = value
								Auras:UpdateTalents()
							end,
						},
						LightningSurgeTotemRes = {
							order = 7,
							type = "toggle",
							name = L["Lightning Surge Totem"],
							get = function() 
								return Auras.db.char.aura[3].LightningSurgeTotemRes;
							end,
							set = function(_, value)
								Auras.db.char.aura[3].LightningSurgeTotemRes = value
								Auras:UpdateTalents()
							end,
						},
						PurifySpirit = {
							order = 8,
							type = "toggle",
							name = L["Purify Spirit"],
							get = function() 
								return Auras.db.char.aura[3].PurifySpirit;
							end,
							set = function(_, value)
								Auras.db.char.aura[3].PurifySpirit = value
								Auras:UpdateTalents()
							end,
						},
						SpiritwalkersGrace = {
							order = 9,
							type = "toggle",
							name = L["Spiritwalker's Grace"],
							get = function() 
								return Auras.db.char.aura[3].SpiritwalkersGrace;
							end,
							set = function(_, value)
								Auras.db.char.aura[3].SpiritwalkersGrace = value
								Auras:UpdateTalents()
							end,
						},
						VoodooTotemRes = {
							order = 10,
							type = "toggle",
							name = L["Voodoo Totem"],
							get = function() 
								return Auras.db.char.aura[3].VoodooTotemRes;
							end,
							set = function(_, value)
								Auras.db.char.aura[3].VoodooTotemRes = value
								Auras:UpdateTalents()
							end,
						},
						WindShearRes = {
							order = 11,
							type = "toggle",
							name = L["Wind Shear"],
							get = function() 
								return Auras.db.char.aura[3].WindShearRes;
							end,
							set = function(_, value)
								Auras.db.char.aura[3].WindShearRes = value
								Auras:UpdateTalents()
							end,
						},
					},
				},
				ProgressBars = {
					name = L["Progress Bars"],
					type = "group",
					order = 4,
					guiInline = true,
					args = {
						BuffTimerBars = {
							name = L["Buff Duration Timers"],
							type = "group",
							order = 1,
							guiInline = true,
							args = {
								AncestralGuidanceBarRes = {
									order = 1,
									type = "toggle",
									name = L["Ancestral Guidance"],
									get = function() 
										return Auras.db.char.aura[3].AncestralGuidanceBarRes;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].AncestralGuidanceBarRes = value
									end,
								},
								AscendanceBarRes = {
									order = 2,
									type = "toggle",
									name = L["Ascendance"],
									get = function() 
										return Auras.db.char.aura[3].AscendanceBarRes;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].AscendanceBarRes = value
									end,
								},
								AstralShiftBarRes = {
									order = 3,
									type = "toggle",
									name = L["Astral Shift"],
									get = function() 
										return Auras.db.char.aura[3].AstralShiftBarRes;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].AstralShiftBarRes = value
									end,
								},
								Bloodlust = {
									order = 4,
									type = "toggle",
									name = L["Bloodlust"],
									hidden = false,
									get = function() 
										return Auras.db.char.aura[3].BloodlustBarRes;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].BloodlustBarRes = value;
									end,
								},
								Heroism = {
									order = 5,
									type = "toggle",
									name = L["Heroism"],
									hidden = false,
									get = function() 
										return Auras.db.char.aura[3].HeroismBarRes;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].HeroismBarRes = value
									end,
								},
								SpiritwalkersGraceBar = {
									order = 6,
									type = "toggle",
									name = L["Elemental Blast"],
									get = function() 
										return Auras.db.char.aura[3].SpiritwalkersGraceBar;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].SpiritwalkersGraceBar = value;
									end,
								},
								Heroism = {
									order = 7,
									type = "toggle",
									name = L["Time Warp"],
									get = function() 
										return Auras.db.char.aura[3].TimeWarBarRes;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].TimeWarpBarRes = value
									end,
								},
								UnleashLifeBar = {
									order = 8,
									type = "toggle",
									name = L["Fire Elemental"],
									get = function() 
										return Auras.db.char.aura[3].UnleashLifeBar;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].UnleashLifeBar = value;
									end,
								},								
							},
						},
						TotemTimerBars = {
							name = L["Totem Duration Timers"],
							type = "group",
							order = 2,
							guiInline = true,
							args = {
								AncestralProtectionTotemBar = {
									order = 1,
									type = "toggle",
									name = L["Ancestral Protection Totem"],
									get = function() 
										return Auras.db.char.aura[3].AncestralProtectionTotemBar;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].AncestralProtectionTotemBar = value
									end,
								},
								CloudburstTotemBar = {
									order = 2,
									type = "toggle",
									name = L["Cloudburst Totem"],
									get = function() 
										return Auras.db.char.aura[3].CloudburstTotemBar;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].CloudburstTotemBar = value
									end,
								},
								EarthenShieldTotemBar = {
									order = 3,
									type = "toggle",
									name = L["Earthen Shield Totem"],
									get = function() 
										return Auras.db.char.aura[3].EarthenShieldTotemBar;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].EarthenShieldTotemBar = value
									end,
								},
								EarthgrabTotemBarRes = {
									order = 4,
									type = "toggle",
									name = L["Earthgrab Totem"],
									get = function() 
										return Auras.db.char.aura[3].EarthgrabTotemBarRes;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].EarthgrabTotemBarRes = value
									end,
								},
								HealingStreamTotemBar = {
									order = 5,
									type = "toggle",
									name = L["Healing Stream Totem"],
									get = function() 
										return Auras.db.char.aura[3].HealingStreamTotemBar;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].HealingStreamTotemBar = value
									end,
								},
								HealingTideTotemBar = {
									order = 6,
									type = "toggle",
									name = L["Healing Tide Totem"],
									get = function() 
										return Auras.db.char.aura[3].HealingTideTotemBar;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].HealingTideTotemBar = value
									end,
								},
								SpiritLinkTotemBar = {
									order = 7,
									type = "toggle",
									name = L["Spirit Link Totem"],
									get = function() 
										return Auras.db.char.aura[3].SpiritLinkTotemBar;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].SpiritLinkTotemBar = value
									end,
								},
								VoodooTotemBarRes = {
									order = 8,
									type = "toggle",
									name = L["Voodoo Totem"],
									get = function() 
										return Auras.db.char.aura[3].VoodooTotemBarRes;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].VoodooTotemBarRes = value
									end,
								},
								WindRushTotemBarRes = {
									order = 9,
									type = "toggle",
									name = L["Wind Rush Totem"],
									get = function() 
										return Auras.db.char.aura[3].WindRushTotemBarRes;
									end,
									set = function(_, value)
										Auras.db.char.aura[3].WindRushTotemBarRes = value
									end,
								},
							},
						},
					},
				},
				TextureAlerts = {
					name = L["Texture Alerts"],
					type = "group",
					order = 5,
					guiInline = true,
					args = {
						TotemMastery = {
							order = 1,
							type = "toggle",
							name = L["Undulation"],
							get = function() 
								return Auras.db.char.aura[3].Undulation;
							end,
							set = function(_, value)
								Auras.db.char.aura[3].Undulation = value
							end,
						},
					},
				},
			}
		}
	end
	return resto_options;
end

local settings_options

local function GetSettingsOptions()
	if not settings_options then
		
		settings_options = {
			type = "group",
			order = 1,
			name = L["Settings"],
			desc = L["Advanced customization options"],
			args = {
				EleSettings = {
					name = L["Elemental"],
					type = "group",
					order = 2,
					disabled = true,
					args = {
						MoveAuras = {
							order = 1,
							type = "execute",
							name = "|cFF666666"..L["Move Elemental Auras"].."|r",
							--disabled = false,
							func = function()
								Auras.db.char.layout[1].isMoving = true;
								Auras:InitMoveAuraGroups(SSA.AuraObjectsEle,"Ele")
							end,
						},
						ResetAuras = {
							order = 2,
							type = "execute",
							name = "|cFF666666"..L["Reset Elemental Auras"].."|r",
							--disabled = false,
							func = function()
								Auras:ResetAuraGroups(Auras.db.char.frames.defaultPos.eleGrp,Auras.db.char.frames.eleGrp)
							end,
						},
						fillerOne = {
							order = 3,
							type = "description",
							name = ' ',
						},
						MaelstromAnim = {
							order = 4,
							type = "toggle",
							name = L["Maelstrom Lightning"],
							get = function() 
								return Auras.db.char.triggers.ele.MaelstromAnim;
							end,
							set = function(_, value)
								if (value == false) then
									settings_options.args.EleSettings.args.EleTriggers.args.EarthShock.disabled = true;
								else
									settings_options.args.EleSettings.args.EleTriggers.args.EarthShock.disabled = false;
								end
								Auras.db.char.triggers.ele.MaelstromAnim = value
							end,
						},
						fillerTwo = {
							order = 5,
							type = "description",
							name = ' ',
						},
						Triggers = {
							name = L["Aura Settings"],
							type = "group",
							order = 6,
							--disabled = true,
							guiInline = true,
							args = {
								OoCAlpha = {
									order = 1,
									type = "range",
									name = L["Out of Combat Alpha"],
									desc = L["Determines how opaque or transparent the auras will appear when out of combat"],
									min = 0,
									max = 1,
									step = 0.1,
									bigStep = 0.1,
									--disabled = false,
									get = function() return Auras.db.char.triggers.ele.OoCAlpha end,
									set = function(_, value)
										Auras.db.char.triggers.ele.OoCAlpha = value
									end,
								},
								EarthShock = {
									order = 2,
									type = "range",
									name = L["Maelstrom Trigger"],
									desc = L["The amount of Maelstrom accumulated at which the \"Lightning\" animation will appear"],
									min = 50,
									max = 100,
									step = 5,
									bigStep = 5,
									--disabled = false,
									get = function() return Auras.db.char.triggers.ele.maelstrom end,
									set = function(_, value)
										Auras.db.char.triggers.ele.maelstrom = value
									end,
								},
								FlameShock = {
									order = 3,
									type = "range",
									name = L["Flame Shock"],
									desc = L["The amount of seconds remaining when the \"Glow\" animation will appear"],
									min = 5,
									max = 15,
									step = 1,
									bigStep = 1,
									get = function() return Auras.db.char.triggers.ele.flameShock end,
									set = function(_, value)
										Auras.db.char.triggers.ele.flameShock = value
									end,
								},
								TotemMastery = {
									order = 4,
									type = "range",
									name = L["Totem Mastery"],
									desc = L["The amount of seconds remaining when the Totem Mastery texture will appear"],
									min = 5,
									max = 30,
									step = 1,
									bigStep = 1,
									get = function() return Auras.db.char.triggers.ele.totemMastery end,
									set = function(_, value)
										Auras.db.char.triggers.ele.totemMastery = value
									end,
								},
								OoRColor = {
									type = "color",
									order = 5,
									name = L["Our of Range Color"],
									desc = L["Determines the color of harmful auras will appear when out of range"],
									hasAlpha = true,
									get = function(info)
										return Auras.db.char.triggers.ele.OoRColor.r, Auras.db.char.triggers.ele.OoRColor.g, Auras.db.char.triggers.ele.OoRColor.b, Auras.db.char.triggers.ele.OoRColor.a
									end,
									set = function(info, r, g, b, a)
										Auras.db.char.triggers.ele.OoRColor.r = r
										Auras.db.char.triggers.ele.OoRColor.g = g
										Auras.db.char.triggers.ele.OoRColor.b = b
										Auras.db.char.triggers.ele.OoRColor.a = a
									end,
								},
								fillerOne = {
									order = 6,
									type = "description",
									name = '',
								},
								fillerTwo = {
									order = 7,
									type = "description",
									name = '',
								},
								ResetTriggers = {
									order = 10,
									type = "execute",
									name = "|cFF666666"..L["Reset Settings Values"].."|r",
									--disabled = false,
									func = function()
										Auras.db.char.triggers.ele.MaelstromAnim = Auras.db.char.triggers.default.ele.MaelstromAnim
										Auras.db.char.triggers.ele.maelstrom = Auras.db.char.triggers.default.ele.maelstrom
										Auras.db.char.triggers.ele.flameShock = Auras.db.char.triggers.default.ele.flameShock
										Auras.db.char.triggers.ele.totemMastery = Auras.db.char.triggers.default.ele.totemMastery
										Auras.db.char.triggers.ele.OoCAlpha = Auras.db.char.triggers.default.ele.OoCAlpha
										Auras.db.char.triggers.ele.OoRColor.r = Auras.db.char.triggers.default.ele.OoRColor.r
										Auras.db.char.triggers.ele.OoRColor.g = Auras.db.char.triggers.default.ele.OoRColor.g
										Auras.db.char.triggers.ele.OoRColor.b = Auras.db.char.triggers.default.ele.OoRColor.b
										Auras.db.char.triggers.ele.OoRColor.a = Auras.db.char.triggers.default.ele.OoRColor.a
									end,
								},
							},
						},
						fillerThree = {
							order = 7,
							type = "description",
							name = ' ',
						},
						Layout = {
							name = L["Layout Settings"],
							type = "group",
							order = 8,
							--disabled = true,
							guiInline = true,
							args = {
								primaryDesc = {
									order = 1,
									type = "description",
									name = L["Primary Auras"],
								},
								AuraSizeRow1 = {
									order = 2,
									type = "range",
									name = L["Primary Size 1"],
									desc = L["Determines the size of primary auras in row 1. (Default is 32)"],
									min = 16,
									max = 64,
									step = 1,
									bigStep = 1,
									--disabled = false,
									get = function() return Auras.db.char.layout[1].primary.top.icon end,
									set = function(_, value)
										Auras.db.char.layout[1].primary.top.icon = value
										Auras:UpdateTalents();
									end,
								},
								AuraSpacingRow1 = {
									order = 3,
									type = "range",
									name = L["Primary Spacing 1"],
									desc = L["Determines the spacing of the primary auras in row 1. (Default is 50)"],
									min = 32,
									max = 100,
									step = 1,
									bigStep = 1,
									get = function() return Auras.db.char.layout[1].primary.top.spacing end,
									set = function(_, value)
										Auras.db.char.layout[1].primary.top.spacing = value
										Auras:UpdateTalents();
									end,
								},
								AuraChargesRow1 = {
									order = 4,
									type = "range",
									name = L["Primary Charges 1"],
									desc = L["Determines the size of the primary charge text in row 1. (Default is 13.5)"],
									min = 10,
									max = 20,
									step = 0.5,
									bigStep = 0.5,
									get = function() return Auras.db.char.layout[1].primary.top.charges end,
									set = function(_, value)
										Auras.db.char.layout[1].primary.top.charges = value
										Auras:UpdateTalents();
									end,
								},
								filler_1 = {
									order = 5,
									type = "description",
									name = ' ',
								},
								AuraSizeRow2 = {
									order = 6,
									type = "range",
									name = L["Primary Size 2"],
									desc = L["Determines the size of primary auras in row 2. (Default is 32)"],
									min = 16,
									max = 64,
									step = 1,
									bigStep = 1,
									--disabled = false,
									get = function() return Auras.db.char.layout[1].primary.bottom.icon end,
									set = function(_, value)
										Auras.db.char.layout[1].primary.bottom.icon = value
										Auras:UpdateTalents();
									end,
								},
								AuraSpacingRow2 = {
									order = 7,
									type = "range",
									name = L["Primary Spacing 2"],
									desc = L["Determines the spacing of the primary auras in row 2. (Default is 50)"],
									min = 32,
									max = 100,
									step = 1,
									bigStep = 1,
									--disabled = false,
									get = function() return Auras.db.char.layout[1].primary.bottom.spacing end,
									set = function(_, value)
										Auras.db.char.layout[1].primary.bottom.spacing = value
										Auras:UpdateTalents();
									end,
								},
								--[[AuraChargesRow2 = {
									order = 8,
									type = "range",
									name = L["Primary Charges 2"],
									desc = L["Determines the size of the primary charge text in row 1. (Default is 13.5)"],
									min = 10,
									max = 20,
									step = 0.5,
									bigStep = 0.5,
									get = function() return Auras.db.char.layout[1].primary.bottom.charges end,
									set = function(_, value)
										Auras.db.char.layout[1].primary.bottom.charges = value
										Auras:UpdateTalents();
									end,
								},
								filler_2 = {
									order = 9,
									type = "description",
									name = ' ',
								},]]
								ResetPrimaryLayout = {
									order = 10,
									type = "execute",
									name = "|cFF666666"..L["Reset Primary Layout"].."|r",
									--disabled = false,
									func = function()
										Auras.db.char.layout[1].primary.top.icon = Auras.db.char.layout.default.primary.top.icon
										Auras.db.char.layout[1].primary.top.spacing = Auras.db.char.layout.default.primary.top.spacing
										Auras.db.char.layout[1].primary.top.charges = Auras.db.char.layout.default.primary.top.charges
										Auras.db.char.layout[1].primary.bottom.icon = Auras.db.char.layout.default.primary.bottom.icon
										Auras.db.char.layout[1].primary.bottom.spacing = Auras.db.char.layout.default.primary.bottom.spacing
										--Auras.db.char.layout[1].primary.bottom.charges = Auras.db.char.layout.default.primary.bottom.charges
										Auras:UpdateTalents();
									end,
								},
								filler_3 = {
									order = 11,
									type = "description",
									name = ' ',
								},
								filler_4 = {
									order = 12,
									type = "description",
									name = ' ',
								},
								secondaryDesc = {
									order = 13,
									type = "description",
									name = L["Secondary Auras"],
								},
								AuraSizeCol1 = {
									order = 14,
									type = "range",
									name = L["Secondary Size 1"],
									desc = L["Determines the size of secondary auras in column 1. (Default is 25)"],
									min = 16,
									max = 64,
									step = 1,
									bigStep = 1,
									--disabled = false,
									get = function() return Auras.db.char.layout[1].secondary.left.icon end,
									set = function(_, value)
										Auras.db.char.layout[1].secondary.left.icon = value
										Auras:UpdateTalents();
									end,
								},
								AuraSpacingCol1 = {
									order = 15,
									type = "range",
									name = L["Secondary Spacing 1"],
									desc = L["Determines the spacing of the secondary auras in column 1. (Default is 30)"],
									min = 32,
									max = 100,
									step = 1,
									bigStep = 1,
									--disabled = false,
									get = function() return Auras.db.char.layout[1].secondary.left.spacing end,
									set = function(_, value)
										Auras.db.char.layout[1].secondary.left.spacing = value
										Auras:UpdateTalents();
									end,
								},
								--[[AuraChargesCol1 = {
									order = 16,
									type = "range",
									name = L["Secondary Charges 1"],
									desc = L["Determines the size of the secondary charge text in column 1. (Default is 13.5)"],
									min = 10,
									max = 20,
									step = 0.5,
									bigStep = 0.5,
									get = function() return Auras.db.char.layout[1].secondary.left.charges end,
									set = function(_, value)
										Auras.db.char.layout[1].secondary.left.charges = value
										Auras:UpdateTalents();
									end,
								},
								filler_5 = {
									order = 17,
									type = "description",
									name = ' ',
								},]]
								AuraSizeCol2 = {
									order = 18,
									type = "range",
									name = L["Secondary Size 2"],
									desc = L["Determines the size of secondary auras in column 2. (Default is 25)"],
									min = 16,
									max = 64,
									step = 1,
									bigStep = 1,
									--disabled = false,
									get = function() return Auras.db.char.layout[1].secondary.right.icon end,
									set = function(_, value)
										Auras.db.char.layout[1].secondary.right.icon = value
										Auras:UpdateTalents();
									end,
								},
								AuraSpacingCol2 = {
									order = 19,
									type = "range",
									name = L["Secondary Spacing 2"],
									desc = L["Determines the spacing of the secondary auras in column 2. (Default is 30)"],
									min = 32,
									max = 100,
									step = 1,
									bigStep = 1,
									--disabled = false,
									get = function() return Auras.db.char.layout[1].secondary.right.spacing end,
									set = function(_, value)
										Auras.db.char.layout[1].secondary.right.spacing = value
										Auras:UpdateTalents();
									end,
								},
								--[[AuraChargesCol2 = {
									order = 20,
									type = "range",
									name = L["Secondary Charges 2"],
									desc = L["Determines the size of the secondary charge text in column 2. (Default is 13.5)"],
									min = 10,
									max = 20,
									step = 0.5,
									bigStep = 0.5,
									get = function() return Auras.db.char.layout[1].secondary.right.charges end,
									set = function(_, value)
										Auras.db.char.layout[1].secondary.right.charges = value
										Auras:UpdateTalents();
									end,
								},
								filler_6 = {
									order = 21,
									type = "description",
									name = ' ',
								},]]
								ResetSecondaryLayout = {
									order = 22,
									type = "execute",
									name = "|cFF666666"..L["Reset Secondary Layout"].."|r",
									--disabled = false,
									func = function()
										Auras.db.char.layout[1].secondary.left.icon = Auras.db.char.layout.default.secondary.left.icon
										Auras.db.char.layout[1].secondary.left.spacing = Auras.db.char.layout.default.secondary.left.spacing
										--Auras.db.char.layout[1].secondary.left.charges = Auras.db.char.layout.default.secondary.left.charges
										Auras.db.char.layout[1].secondary.right.icon = Auras.db.char.layout.default.secondary.right.icon
										Auras.db.char.layout[1].secondary.right.spacing = Auras.db.char.layout.default.secondary.right.spacing
										--Auras.db.char.layout[1].secondary.right.charges = Auras.db.char.layout.default.secondary.right.charges
										Auras:UpdateTalents();
									end,
								},
								filler_5 = {
									order = 23,
									type = "description",
									name = ' ',
								},
								filler_6 = {
									order = 24,
									type = "description",
									name = ' ',
								},
								--[[MaelstromBarDesc = {
									order = 25,
									type = "description",
									name = L["Maelstrom Bar"],
								},]]
								MaelstromBarAdjust = {
									order = 25,
									name = L["Preview Maelstrom Bar"],
									desc = L["Toggle the adjustment of the Maelstrom Bar size"],
									type = "toggle",
									get = function()
										return Auras.db.char.layout[1].maelstromBar.isAdjustable;
									end,
									set = function(_, value)
										Auras.db.char.layout[1].maelstromBar.isAdjustable = value;
										if (not value) then
											SSA.MaelstromBarEle:SetAlpha(0);
											SSA.MaelstromBarEle:SetValue(UnitPower('player',11));
										else
											SSA.MaelstromBarEle:SetAlpha(1);
											SSA.MaelstromBarEle:SetValue(UnitPowerMax('player',11));
										end
									end,
								},
								--[[filler_7 = {
									order = 26,
									type = "description",
									name = '',
								},]]
								ResetMaelstromBar = {
									order = 26,
									type = "execute",
									name = "|cFF666666"..L["Reset Maelstrom Bar"].."|r",
									--disabled = false,
									func = function()
										Auras.db.char.layout[1].maelstromBar.width = 260
										Auras.db.char.layout[1].maelstromBar.height = 21
										SSA.MaelstromBarEle:SetWidth(260);
										SSA.MaelstromBarEle:SetHeight(21);
									end,
								},
								MaelstromBarWidth = {
									order = 27,
									type = "range",
									name = L["Bar Width"],
									desc = L["Changes the width of the Maelstrom Bar. (Default is 260)"],
									min = 100,
									max = 300,
									step = 1,
									bigStep = 1,
									get = function() return Auras.db.char.layout[1].maelstromBar.width end,
									set = function(_, value)
										Auras.db.char.layout[1].maelstromBar.width = value
										SSA.MaelstromBarEle:SetWidth(value);
									end,
								},
								MaelstromBarHeight = {
									order = 28,
									type = "range",
									name = L["Bar Height"],
									desc = L["Changes the height of the Maelstrom Bar. (Default is 21)"],
									min = 10,
									max = 30,
									step = 1,
									bigStep = 1,
									get = function() return Auras.db.char.layout[1].maelstromBar.height end,
									set = function(_, value)
										Auras.db.char.layout[1].maelstromBar.height = value
										SSA.MaelstromBarEle:SetHeight(value);
									end,
								},
								filler_8 = {
									order = 29,
									type = "description",
									name = ' ',
								},
								filler_9 = {
									order = 30,
									type = "description",
									name = ' ',
								},
								IcefuryBarAdjust = {
									order = 31,
									name = L["Preview Icefury Bar"],
									desc = L["Toggle the adjustment of the Icefury Bar size"],
									type = "toggle",
									get = function()
										return Auras.db.char.layout[1].icefuryBar.isAdjustable;
									end,
									set = function(_, value)
										Auras.db.char.layout[1].icefuryBar.isAdjustable = value;
										if (not value) then
											SSA.IcefuryBar:SetAlpha(0);
											SSA.IcefuryBar:SetValue(0);
										else
											SSA.IcefuryBar:SetAlpha(1);
											SSA.IcefuryBar:SetValue(4);
										end
									end,
								},
								--[[filler_10 = {
									order = 32,
									type = "description",
									name = '',
								},]]
								ResetIcefuryBar = {
									order = 32,
									type = "execute",
									name = "|cFF666666"..L["Reset Icefury Bar"].."|r",
									--disabled = false,
									func = function()
										Auras.db.char.layout[1].icefuryBar.width = 260
										Auras.db.char.layout[1].icefuryBar.height = 21
										SSA.IcefuryBar:SetWidth(260);
										SSA.IcefuryBar:SetHeight(21);
									end,
								},
								IcefuryBarWidth = {
									order = 33,
									type = "range",
									name = L["Bar Width"],
									desc = L["Changes the width of the Icefury Bar. (Default is 260)"],
									min = 100,
									max = 300,
									step = 1,
									bigStep = 1,
									get = function() return Auras.db.char.layout[1].icefuryBar.width end,
									set = function(_, value)
										Auras.db.char.layout[1].icefuryBar.width = value
										SSA.IcefuryBar:SetWidth(value);
									end,
								},
								IcefuryBarHeight = {
									order = 34,
									type = "range",
									name = L["Bar Height"],
									desc = L["Changes the height of the Icefury Bar. (Default is 21)"],
									min = 10,
									max = 30,
									step = 1,
									bigStep = 1,
									get = function() return Auras.db.char.layout[1].icefuryBar.height end,
									set = function(_, value)
										Auras.db.char.layout[1].icefuryBar.height = value
										SSA.IcefuryBar:SetHeight(value);
									end,
								},
							},
						},
					},
				},
				EnhSettings = {
					name = L["Enhancement"],
					type = "group",
					order = 3,
					args = {
						MoveAuras = {
							order = 1,
							type = "execute",
							name = "|cFF666666"..L["Move Enhancement Auras"].."|r",
							func = function()
								Auras.db.char.layout[2].isMoving = true;
								Auras:InitMoveAuraGroups(SSA.AuraObjectsEnh,"Enh")
							end,
						},
						ResetAuras = {
							order = 2,
							type = "execute",
							name = "|cFF666666"..L["Reset Enhancement Auras"].."|r",
							func = function()
								Auras:ResetAuraGroups(Auras.db.char.frames.defaultPos.enhGrp,Auras.db.char.frames.enhGrp)
							end,
						},
						MaelstromAnim = {
							order = 3,
							type = "toggle",
							name = L["Maelstrom Lightning"],
							get = function() 
								return Auras.db.char.triggers.enh.MaelstromAnim;
							end,
							set = function(_, value)
								if (value == false) then
									settings_options.args.EnhSettings.args.EnhTriggers.args.EnhMaelstromLimit.disabled = true;
								else
									settings_options.args.EnhSettings.args.EnhTriggers.args.EnhMaelstromLimit.disabled = false;
								end
								Auras.db.char.triggers.enh.MaelstromAnim = value
							end,
						},
						fillerOne = {
							order = 4,
							type = "description",
							name = ' ',
						},
						Triggers = {
							name = L["Aura Settings"],
							type = "group",
							order = 5,
							guiInline = true,
							args = {
								OoCAlpha = {
									order = 1,
									type = "range",
									name = L["Out of Combat Alpha"],
									desc = L["Determines how opaque or transparent the auras will appear when out of combat"],
									min = 0,
									max = 1,
									step = 0.1,
									bigStep = 0.1,
									get = function() return Auras.db.char.triggers.enh.OoCAlpha end,
									set = function(_, value)
										Auras.db.char.triggers.enh.OoCAlpha = value
									end,
								},
								OoRColor = {
									type = "color",
									order = 2,
									name = L["Our of Range Color"],
									desc = L["Determines the color of harmful auras will appear when out of range"],
									hasAlpha = true,
									get = function(info)
										return Auras.db.char.triggers.enh.OoRColor.r, Auras.db.char.triggers.enh.OoRColor.g, Auras.db.char.triggers.enh.OoRColor.b, Auras.db.char.triggers.enh.OoRColor.a
									end,
									set = function(info, r, g, b, a)
										Auras.db.char.triggers.enh.OoRColor.r = r
										Auras.db.char.triggers.enh.OoRColor.g = g
										Auras.db.char.triggers.enh.OoRColor.b = b
										Auras.db.char.triggers.enh.OoRColor.a = a
									end,
								},
								MaelstromLimit = {
									order = 3,
									type = "range",
									name = L["Maelstrom Trigger"],
									desc = L["The amount of Maelstrom accumulated at which the \"Lightning\" animation will appear"],
									min = 50,
									max = 150,
									step = 5,
									bigStep = 5,
									get = function() return Auras.db.char.triggers.enh.maelstrom end,
									set = function(_, value)
										Auras.db.char.triggers.enh.maelstrom = value
									end,
								},
								Flametongue = {
									order = 4,
									type = "range",
									name = L["Flametongue"],
									desc = L["The amount of seconds remaining when the \"Glow\" animation will appear"],
									min = 5,
									max = 10,
									step = 1,
									bigStep = 1,
									get = function() return Auras.db.char.triggers.enh.flametongue end,
									set = function(_, value)
										Auras.db.char.triggers.enh.flametongue = value
									end,
								},
								Frostbrand = {
									order = 5,
									type = "range",
									name = L["Frostbrand"],
									desc = L["The amount of seconds remaining when the \"Glow\" animation will appear"],
									min = 5,
									max = 10,
									step = 1,
									bigStep = 1,
									get = function() return Auras.db.char.triggers.enh.frostbrand end,
									set = function(_, value)
										Auras.db.char.triggers.enh.frostbrand = value
									end,
								},
								Boulderfist = {
									order = 6,
									type = "range",
									name = L["Boulderfist"],
									desc = L["The amount of seconds remaining when the \"Glow\" animation will appear"],
									min = 5,
									max = 10,
									step = 1,
									bigStep = 1,
									get = function() return Auras.db.char.triggers.enh.boulderfist end,
									set = function(_, value)
										Auras.db.char.triggers.enh.boulderfist = value
									end,
								},
								filler = {
									order = 7,
									type = "description",
									name = '',
								},
								ResetTriggers = {
									order = 10,
									type = "execute",
									name = "|cFF666666"..L["Reset Settings Values"].."|r",
									func = function()
										Auras.db.char.triggers.enh.MaelstromAnim = Auras.db.char.triggers.default.enh.MaelstromAnim
										Auras.db.char.triggers.enh.maelstrom = Auras.db.char.triggers.default.enh.maelstrom
										Auras.db.char.triggers.enh.flametongue = Auras.db.char.triggers.default.enh.flametongue
										Auras.db.char.triggers.enh.frostbrand = Auras.db.char.triggers.default.enh.frostbrand
										Auras.db.char.triggers.enh.boulderfist = Auras.db.char.triggers.enh.default.boulderfist
										Auras.db.char.triggers.enh.OoCAlpha = Auras.db.char.triggers.default.enh.OoCAlpha
										Auras.db.char.triggers.enh.OoRColor.r = Auras.db.char.triggers.default.enh.OoRColor.r
										Auras.db.char.triggers.enh.OoRColor.g = Auras.db.char.triggers.default.enh.OoRColor.g
										Auras.db.char.triggers.enh.OoRColor.b = Auras.db.char.triggers.default.enh.OoRColor.b
										Auras.db.char.triggers.enh.OoRColor.a = Auras.db.char.triggers.default.enh.OoRColor.a
									end,
								},
							},
						},
						fillerTwo = {
							order = 6,
							type = "description",
							name = ' ',
						},
						Layout = {
							name = L["Layout Settings"],
							type = "group",
							order = 7,
							guiInline = true,
							args = {
								primaryDesc = {
									order = 1,
									type = "description",
									name = L["Primary Auras"],
								},
								AuraSizeRow1 = {
									order = 2,
									type = "range",
									name = L["Primary Size 1"],
									desc = L["Determines the size of primary auras in row 1. (Default is 32)"],
									min = 16,
									max = 64,
									step = 1,
									bigStep = 1,
									get = function() return Auras.db.char.layout[2].primary.top.icon end,
									set = function(_, value)
										Auras.db.char.layout[2].primary.top.icon = value
										Auras:UpdateTalents();
									end,
								},
								AuraSpacingRow1 = {
									order = 3,
									type = "range",
									name = L["Primary Spacing 1"],
									desc = L["Determines the spacing of the primary auras in row 1. (Default is 50)"],
									min = 32,
									max = 100,
									step = 1,
									bigStep = 1,
									get = function() return Auras.db.char.layout[2].primary.top.spacing end,
									set = function(_, value)
										Auras.db.char.layout[2].primary.top.spacing = value
										Auras:UpdateTalents();
									end,
								},
								AuraChargesRow1 = {
									order = 4,
									type = "range",
									name = L["Primary Charges 1"],
									desc = L["Determines the size of the primary charge text in row 1. (Default is 13.5)"],
									min = 10,
									max = 20,
									step = 0.5,
									bigStep = 0.5,
									get = function() return Auras.db.char.layout[2].primary.top.charges end,
									set = function(_, value)
										Auras.db.char.layout[2].primary.top.charges = value
										Auras:UpdateTalents();
									end,
								},
								filler_1 = {
									order = 5,
									type = "description",
									name = ' ',
								},
								AuraSizeRow2 = {
									order = 6,
									type = "range",
									name = L["Primary Size 2"],
									desc = L["Determines the size of primary auras in row 2. (Default is 32)"],
									min = 16,
									max = 64,
									step = 1,
									bigStep = 1,
									get = function() return Auras.db.char.layout[2].primary.bottom.icon end,
									set = function(_, value)
										Auras.db.char.layout[2].primary.bottom.icon = value
										Auras:UpdateTalents();
									end,
								},
								AuraSpacingRow2 = {
									order = 7,
									type = "range",
									name = L["Primary Spacing 2"],
									desc = L["Determines the spacing of the primary auras in row 2. (Default is 50)"],
									min = 32,
									max = 100,
									step = 1,
									bigStep = 1,
									get = function() return Auras.db.char.layout[2].primary.bottom.spacing end,
									set = function(_, value)
										Auras.db.char.layout[2].primary.bottom.spacing = value
										Auras:UpdateTalents();
									end,
								},
								AuraChargesRow2 = {
									order = 8,
									type = "range",
									name = L["Primary Charges 2"],
									desc = L["Determines the size of the primary charge text in row 2. (Default is 13.5)"],
									min = 10,
									max = 20,
									step = 0.5,
									bigStep = 0.5,
									get = function() return Auras.db.char.layout[2].primary.bottom.charges end,
									set = function(_, value)
										Auras.db.char.layout[2].primary.bottom.charges = value
										Auras:UpdateTalents();
									end,
								},
								filler_2 = {
									order = 9,
									type = "description",
									name = ' ',
								},
								ResetPrimaryLayout = {
									order = 10,
									type = "execute",
									name = "|cFF666666"..L["Reset Primary Layout"].."|r",
									func = function()
										Auras.db.char.layout[2].primary.top.icon = Auras.db.char.layout.default.primary.top.icon
										Auras.db.char.layout[2].primary.top.spacing = Auras.db.char.layout.default.primary.top.spacing
										Auras.db.char.layout[2].primary.top.charges = Auras.db.char.layout.default.primary.top.spacing
										Auras.db.char.layout[2].primary.bottom.icon = Auras.db.char.layout.default.primary.bottom.icon
										Auras.db.char.layout[2].primary.bottom.spacing = Auras.db.char.layout.default.primary.bottom.spacing
										Auras.db.char.layout[2].primary.bottom.charges = Auras.db.char.layout.default.primary.bottom.charges
										Auras:UpdateTalents();
									end,
								},
								filler_3 = {
									order = 11,
									type = "description",
									name = ' ',
								},
								filler_4 = {
									order = 12,
									type = "description",
									name = ' ',
								},
								secondaryDesc = {
									order = 13,
									type = "description",
									name = L["Secondary Auras"],
								},
								AuraSizeCol1 = {
									order = 14,
									type = "range",
									name = L["Secondary Size 1"],
									desc = L["Determines the size of secondary auras in column 1. (Default is 25)"],
									min = 16,
									max = 64,
									step = 1,
									bigStep = 1,
									get = function() return Auras.db.char.layout[2].secondary.left.icon end,
									set = function(_, value)
										Auras.db.char.layout[2].secondary.left.icon = value
										Auras:UpdateTalents();
									end,
								},
								AuraSpacingCol1 = {
									order = 15,
									type = "range",
									name = L["Secondary Spacing 1"],
									desc = L["Determines the spacing of the secondary auras in column 1. (Default is 30)"],
									min = 32,
									max = 100,
									step = 1,
									bigStep = 1,
									get = function() return Auras.db.char.layout[2].secondary.left.spacing end,
									set = function(_, value)
										Auras.db.char.layout[2].secondary.left.spacing = value
										Auras:UpdateTalents();
									end,
								},
								AuraSizeCol2 = {
									order = 16,
									type = "range",
									name = L["Secondary Size 2"],
									desc = L["Determines the size of secondary auras in column 2. (Default is 25)"],
									min = 16,
									max = 64,
									step = 1,
									bigStep = 1,
									get = function() return Auras.db.char.layout[2].secondary.right.icon end,
									set = function(_, value)
										Auras.db.char.layout[2].secondary.right.icon = value
										Auras:UpdateTalents();
									end,
								},
								AuraSpacingCol2 = {
									order = 17,
									type = "range",
									name = L["Secondary Spacing 2"],
									desc = L["Determines the spacing of the secondary auras in column 2. (Default is 30)"],
									min = 32,
									max = 100,
									step = 1,
									bigStep = 1,
									get = function() return Auras.db.char.layout[2].secondary.right.spacing end,
									set = function(_, value)
										Auras.db.char.layout[2].secondary.right.spacing = value
										Auras:UpdateTalents();
									end,
								},
								ResetSecondaryLayout = {
									order = 18,
									type = "execute",
									name = "|cFF666666"..L["Reset Secondary Layout"].."|r",
									func = function()
										Auras.db.char.layout[2].secondary.left.icon = Auras.db.char.layout.default.secondary.left.icon
										Auras.db.char.layout[2].secondary.left.spacing = Auras.db.char.layout.default.secondary.left.spacing
										Auras.db.char.layout[2].secondary.right.icon = Auras.db.char.layout.default.secondary.right.icon
										Auras.db.char.layout[2].secondary.right.spacing = Auras.db.char.layout.default.secondary.right.spacing
										Auras:UpdateTalents();
									end,
								},
								filler_5 = {
									order = 19,
									type = "description",
									name = ' ',
								},
								filler_6 = {
									order = 20,
									type = "description",
									name = ' ',
								},
								--[[MaelstromBarDesc = {
									order = 25,
									type = "description",
									name = L["Maelstrom Bar"],
								},]]
								MaelstromBarAdjust = {
									order = 21,
									name = L["Preview Maelstrom Bar"],
									desc = L["Toggle the adjustment of the Maelstrom Bar size"],
									type = "toggle",
									get = function()
										return Auras.db.char.layout[2].maelstromBar.isAdjustable;
									end,
									set = function(_, value)
										Auras.db.char.layout[2].maelstromBar.isAdjustable = value;
										if (not value) then
											SSA.MaelstromBarEnh:SetAlpha(0);
											SSA.MaelstromBarEnh:SetValue(UnitPower('player',11));
										else
											SSA.MaelstromBarEnh:SetAlpha(1);
											SSA.MaelstromBarEnh:SetValue(UnitPowerMax('player',11));
										end
									end,
								},
								--[[filler_7 = {
									order = 26,
									type = "description",
									name = '',
								},]]
								ResetMaelstromBar = {
									order = 22,
									type = "execute",
									name = "|cFF666666"..L["Reset Maelstrom Bar"].."|r",
									--disabled = false,
									func = function()
										Auras.db.char.layout[2].maelstromBar.width = 260
										Auras.db.char.layout[2].maelstromBar.height = 21
										SSA.MaelstromBarEnh:SetWidth(260);
										SSA.MaelstromBarEnh:SetHeight(21);
									end,
								},
								MaelstromBarWidth = {
									order = 23,
									type = "range",
									name = L["Bar Width"],
									desc = L["Changes the width of the Maelstrom Bar. (Default is 260)"],
									min = 100,
									max = 300,
									step = 1,
									bigStep = 1,
									get = function() return Auras.db.char.layout[2].maelstromBar.width end,
									set = function(_, value)
										Auras.db.char.layout[2].maelstromBar.width = value
										SSA.MaelstromBarEnh:SetWidth(value);
									end,
								},
								MaelstromBarHeight = {
									order = 24,
									type = "range",
									name = L["Bar Height"],
									desc = L["Changes the height of the Maelstrom Bar. (Default is 21)"],
									min = 10,
									max = 30,
									step = 1,
									bigStep = 1,
									get = function() return Auras.db.char.layout[2].maelstromBar.height end,
									set = function(_, value)
										Auras.db.char.layout[2].maelstromBar.height = value
										SSA.MaelstromBarEnh:SetHeight(value);
									end,
								},
							},
						},
						
					},
				},
				ResSettings = {
					name = L["Restoration"],
					type = "group",
					order = 4,
					disabled = true,
					args = {
						MoveAuras = {
							order = 1,
							type = "execute",
							name = "|cFF666666"..L["Move Restoration Auras"].."|r",
							func = function()
								Auras.db.char.layout[3].isMoving = true;
								Auras:InitMoveAuraGroups(SSA.AuraObjectsRes,"Res")
							end,
						},
						ResetAuras = {
							order = 2,
							type = "execute",
							name = "|cFF666666"..L["Reset Restoration Auras"].."|r",
							func = function()
								Auras:ResetAuraGroups(Auras.db.char.frames.defaultPos.resGrp,Auras.db.char.frames.resGrp)
							end,
						},
						fillerOne = {
							order = 3,
							type = "description",
							name = ' ',
						},
						Triggers = {
							name = L["Aura Settings"],
							type = "group",
							order = 4,
							guiInline = true,
							args = {
								OoCAlpha = {
									order = 1,
									type = "range",
									name = L["Out of Combat Alpha"],
									desc = L["Determines how opaque or transparent the auras will appear when out of combat"],
									min = 0,
									max = 1,
									step = 0.1,
									bigStep = 0.1,
									get = function() return Auras.db.char.triggers.res.OoCAlpha end,
									set = function(_, value)
										Auras.db.char.triggers.res.OoCAlpha = value
									end,
								},
								FlameShock = {
									order = 2,
									type = "range",
									name = L["Flame Shock"],
									desc = L["The amount of seconds remaining when the \"Glow\" animation will appear"],
									min = 5,
									max = 15,
									step = 1,
									bigStep = 1,
									get = function() return Auras.db.char.triggers.res.flameShock end,
									set = function(_, value)
										Auras.db.char.triggers.res.flameShock = value
									end,
								},
								OoCTidalWaveTime = {
									order = 3,
									type = "range",
									name = L["OoC Tidal Wave Duration"],
									desc = L["The amount of seconds the Tidal Waves indicator bar will appear when casting a heal without a target while out of combat."],
									min = 1,
									max = 15,
									step = 1,
									bigStep = 1,
									get = function() return Auras.db.char.triggers.res.TidalWaveTime end,
									set = function(_, value)
										Auras.db.char.triggers.res.TidalWaveTime = value
									end,
								},
								fillerOne = {
									order = 4,
									type = "description",
									name = ' ',
								},
								CombatTidalWaveDisplay = {
									order = 5,
									type = "select",
									name = L["Tidal Wave Display (In Combat)"],
									desc = L["The method in which Tidal Wave will be displayed while in combat."],
									get = function()
										return Auras.db.char.triggers.res.CombatTidalWaveDisplay
									end,
									set = function(_, value)
										Auras.db.char.triggers.res.CombatTidalWaveDisplay = value
									end,
									values = {
										["Always"] = L["Always"],
										["Target & On Heal"] = L["Target & On Heal"],
										["Target Only"] = L["Target Only"],
										["On Heal Only"] = L["On Heal Only"],
										["Never"] = L["Never"],
									},
								},
								OoCTidalWaveDisplay = {
									order = 6,
									type = "select",
									name = L["Tidal Wave Display (OoC)"],
									desc = L["The method in which Tidal Wave will be displayed while out of combat."],
									get = function()
										return Auras.db.char.triggers.res.OoCTidalWaveDisplay
									end,
									set = function(_, value)
										Auras.db.char.triggers.res.OoCTidalWaveDisplay = value
									end,
									values = {
										["Always"] = L["Always"],
										["Target & On Heal"] = L["Target & On Heal"],
										["Target Only"] = L["Target Only"],
										["On Heal Only"] = L["On Heal Only"],
										["Never"] = L["Never"],
									},
								},
								OoRColor = {
									type = "color",
									order = 7,
									name = L["Our of Range Color"],
									desc = L["Determines the color of harmful auras will appear when out of range"],
									hasAlpha = true,
									get = function(info)
										return Auras.db.char.triggers.res.OoRColor.r, Auras.db.char.triggers.res.OoRColor.g, Auras.db.char.triggers.res.OoRColor.b, Auras.db.char.triggers.res.OoRColor.a
									end,
									set = function(info, r, g, b, a)
										Auras.db.char.triggers.res.OoRColor.r = r
										Auras.db.char.triggers.res.OoRColor.g = g
										Auras.db.char.triggers.res.OoRColor.b = b
										Auras.db.char.triggers.res.OoRColor.a = a
									end,
								},
								EmptyColor = {
									type = "color",
									order = 8,
									name = L["No Tidal Waves Color"],
									desc = L["Determines the color of the Tidal Waves bar when no tidal wave charges are active"],
									hasAlpha = true,
									get = function(info)
										return Auras.db.char.layout[3].tidalWavesBar.emptyColor.r,
										Auras.db.char.layout[3].tidalWavesBar.emptyColor.g,
										Auras.db.char.layout[3].tidalWavesBar.emptyColor.b,
										Auras.db.char.layout[3].tidalWavesBar.emptyColor.a
									end,
									set = function(info, r, g, b, a)
										Auras.db.char.layout[3].tidalWavesBar.emptyColor.r = r
										Auras.db.char.layout[3].tidalWavesBar.emptyColor.g = g
										Auras.db.char.layout[3].tidalWavesBar.emptyColor.b = b
										Auras.db.char.layout[3].tidalWavesBar.emptyColor.a = a
									end,
								},
								AnimTidalWaves = {
									order = 9,
									type = "toggle",
									name = L["Animate Tidal Waves Bar"],
									get = function() 
										return Auras.db.char.triggers.res.animTidalWaves;
									end,
									set = function(_, value)
										local buff,_,_,count = UnitBuff('player',Auras:GetSpellName(53390));
										Auras.db.char.triggers.res.animTidalWaves = value
										if (value) then
											if (buff) then
												Auras:UpdateTidalWaveBar(0.5,{0.35,0.76,1},false,count);
											else
												Auras:UpdateTidalWaveBar(0,{1,0,0},value,2);
											end
										end
									end,
								},
								fillerTwo = {
									order = 10,
									type = "description",
									name = ' ',
								},
								ResetTriggers = {
									order = 11,
									type = "execute",
									name = "|cFF666666"..L["Reset Settings Values"].."|r",
									func = function()
										Auras.db.char.triggers.res.OoCAlpha = Auras.db.char.triggers.default.res.OoCAlpha
										Auras.db.char.triggers.res.flameShock = Auras.db.char.triggers.default.res.flameShock
										Auras.db.char.triggers.res.OoRColor.r = Auras.db.char.triggers.default.res.OoRColor.r
										Auras.db.char.triggers.res.OoRColor.g = Auras.db.char.triggers.default.res.OoRColor.g
										Auras.db.char.triggers.res.OoRColor.b = Auras.db.char.triggers.default.res.OoRColor.b
										Auras.db.char.triggers.res.OoRColor.a = Auras.db.char.triggers.default.res.OoRColor.a
										Auras.db.char.triggers.res.animTidalWaves = Auras.db.char.triggers.default.res.animTidalWaves
										Auras.db.char.triggers.res.TidalWaveTime = Auras.db.char.triggers.default.res.TidalWaveTime
										Auras.db.char.layout[3].tidalWavesBar.emptyColor.r = 1
										Auras.db.char.layout[3].tidalWavesBar.emptyColor.g = 0
										Auras.db.char.layout[3].tidalWavesBar.emptyColor.b = 0
										Auras.db.char.layout[3].tidalWavesBar.emptyColor.a = 1
									end,
								},
							},
						},
						fillerTwo = {
							order = 5,
							type = "description",
							name = ' ',
						},
						Layout = {
							name = L["Layout Settings"],
							type = "group",
							order = 6,
							guiInline = true,
							args = {
								primaryDesc = {
									order = 1,
									type = "description",
									name = L["Primary Auras"],
								},
								AuraSizeRow1 = {
									order = 2,
									type = "range",
									name = L["Primary Size 1"],
									desc = L["Determines the size of primary auras in row 1. (Default is 32)"],
									min = 16,
									max = 64,
									step = 1,
									bigStep = 1,
									get = function() return Auras.db.char.layout[3].primary.top.icon end,
									set = function(_, value)
										Auras.db.char.layout[3].primary.top.icon = value
										Auras:UpdateTalents();
									end,
								},
								AuraSpacingRow1 = {
									order = 3,
									type = "range",
									name = L["Primary Spacing 1"],
									desc = L["Determines the spacing of the primary auras in row 1. (Default is 50)"],
									min = 32,
									max = 100,
									step = 1,
									bigStep = 1,
									get = function() return Auras.db.char.layout[3].primary.top.spacing end,
									set = function(_, value)
										Auras.db.char.layout[3].primary.top.spacing = value
										Auras:UpdateTalents();
									end,
								},
								AuraChargesRow1 = {
									order = 4,
									type = "range",
									name = L["Primary Charges 1"],
									desc = L["Determines the size of the primary charge text in row 1. (Default is 13.5)"],
									min = 10,
									max = 20,
									step = 0.5,
									bigStep = 0.5,
									get = function() return Auras.db.char.layout[3].primary.top.charges end,
									set = function(_, value)
										Auras.db.char.layout[3].primary.top.charges = value
										Auras:UpdateTalents();
									end,
								},
								filler_1 = {
									order = 5,
									type = "description",
									name = ' ',
								},
								AuraSizeRow2 = {
									order = 6,
									type = "range",
									name = L["Primary Size 2"],
									desc = L["Determines the size of primary auras in row 2. (Default is 32)"],
									min = 16,
									max = 64,
									step = 1,
									bigStep = 1,
									get = function() return Auras.db.char.layout[3].primary.bottom.icon end,
									set = function(_, value)
										Auras.db.char.layout[3].primary.bottom.icon = value
										Auras:UpdateTalents();
									end,
								},
								AuraSpacingRow2 = {
									order = 7,
									type = "range",
									name = L["Primary Spacing 2"],
									desc = L["Determines the spacing of the primary auras in row 2. (Default is 50)"],
									min = 32,
									max = 100,
									step = 1,
									bigStep = 1,
									get = function() return Auras.db.char.layout[3].primary.bottom.spacing end,
									set = function(_, value)
										Auras.db.char.layout[3].primary.bottom.spacing = value
										Auras:UpdateTalents();
									end,
								},
								ResetPrimaryLayout = {
									order = 8,
									type = "execute",
									name = "|cFF666666"..L["Reset Primary Layout"].."|r",
									func = function()
										Auras.db.char.layout[3].primary.top.icon = Auras.db.char.layout.default.primary.top.icon
										Auras.db.char.layout[3].primary.top.spacing = Auras.db.char.layout.default.primary.top.spacing
										Auras.db.char.layout[3].primary.top.charges = Auras.db.char.layout.default.primary.top.charges
										Auras.db.char.layout[3].primary.bottom.icon = Auras.db.char.layout.default.primary.bottom.icon
										Auras.db.char.layout[3].primary.bottom.spacing = Auras.db.char.layout.default.primary.bottom.spacing
										Auras:UpdateTalents();
									end,
								},
								filler_2 = {
									order = 9,
									type = "description",
									name = ' ',
								},
								filler_3 = {
									order = 10,
									type = "description",
									name = ' ',
								},
								secondaryDesc = {
									order = 11,
									type = "description",
									name = L["Secondary Auras"],
								},
								AuraSizeCol1 = {
									order = 12,
									type = "range",
									name = L["Secondary Size 1"],
									desc = L["Determines the size of secondary auras in column 1. (Default is 25)"],
									min = 16,
									max = 64,
									step = 1,
									bigStep = 1,
									get = function() return Auras.db.char.layout[3].secondary.left.icon end,
									set = function(_, value)
										Auras.db.char.layout[3].secondary.left.icon = value
										Auras:UpdateTalents();
									end,
								},
								AuraSpacingCol1 = {
									order = 13,
									type = "range",
									name = L["Secondary Spacing 1"],
									desc = L["Determines the spacing of the secondary auras in column 1. (Default is 30)"],
									min = 32,
									max = 100,
									step = 1,
									bigStep = 1,
									get = function() return Auras.db.char.layout[3].secondary.left.spacing end,
									set = function(_, value)
										Auras.db.char.layout[3].secondary.left.spacing = value
										Auras:UpdateTalents();
									end,
								},
								AuraSizeCol2 = {
									order = 14,
									type = "range",
									name = L["Secondary Size 2"],
									desc = L["Determines the size of secondary auras in column 2. (Default is 25)"],
									min = 16,
									max = 64,
									step = 1,
									bigStep = 1,
									get = function() return Auras.db.char.layout[3].secondary.right.icon end,
									set = function(_, value)
										Auras.db.char.layout[3].secondary.right.icon = value
										Auras:UpdateTalents();
									end,
								},
								AuraSpacingCol2 = {
									order = 15,
									type = "range",
									name = L["Secondary Spacing 2"],
									desc = L["Determines the spacing of the secondary auras in column 2. (Default is 30)"],
									min = 32,
									max = 100,
									step = 1,
									bigStep = 1,
									get = function() return Auras.db.char.layout[3].secondary.right.spacing end,
									set = function(_, value)
										Auras.db.char.layout[3].secondary.right.spacing = value
										Auras:UpdateTalents();
									end,
								},
								AuraChargesCol2 = {
									order = 16,
									type = "range",
									name = L["Secondary Charges 2"],
									desc = L["Determines the size of the secondary charge text in column 2. (Default is 13.5)"],
									min = 10,
									max = 20,
									step = 0.5,
									bigStep = 0.5,
									get = function() return Auras.db.char.layout[3].secondary.right.charges end,
									set = function(_, value)
										Auras.db.char.layout[3].secondary.right.charges = value
										Auras:UpdateTalents();
									end,
								},
								filler_4 = {
									order = 17,
									type = "description",
									name = ' ',
								},
								ResetSecondaryLayout = {
									order = 18,
									type = "execute",
									name = "|cFF666666"..L["Reset Secondary Layout"].."|r",
									--disabled = false,
									func = function()
										Auras.db.char.layout[3].secondary.left.icon = Auras.db.char.layout.default.secondary.left.icon
										Auras.db.char.layout[3].secondary.left.spacing = Auras.db.char.layout.default.secondary.left.spacing
										Auras.db.char.layout[3].secondary.right.icon = Auras.db.char.layout.default.secondary.right.icon
										Auras.db.char.layout[3].secondary.right.spacing = Auras.db.char.layout.default.secondary.right.spacing
										Auras.db.char.layout[3].secondary.right.charges = Auras.db.char.layout.default.secondary.right.charges
										Auras:UpdateTalents();
									end,
								},
								filler_5 = {
									order = 19,
									type = "description",
									name = ' ',
								},
								filler_6 = {
									order = 20,
									type = "description",
									name = ' ',
								},
								--[[MaelstromBarDesc = {
									order = 25,
									type = "description",
									name = L["Maelstrom Bar"],
								},]]
								EarthenShieldBarAdjust = {
									order = 21,
									name = L["Preview Earthen Shield Bar"],
									desc = L["Toggle the adjustment of the Earthen Shield Bar size"],
									type = "toggle",
									get = function()
										return Auras.db.char.layout[3].earthenShieldBar.isAdjustable;
									end,
									set = function(_, value)
										Auras.db.char.layout[3].earthenShieldBar.isAdjustable = value;
										if (not value) then
											SSA.EarthenShieldTotemBar:Hide();
											SSA.EarthenShieldTotemBar:SetValue(UnitPower('player',11));
										else
											SSA.EarthenShieldTotemBar:Show();
											SSA.EarthenShieldTotemBar:SetValue(UnitPowerMax('player',11));
										end
									end,
								},
								--[[filler_7 = {
									order = 22,
									type = "description",
									name = '',
								},]]
								ResetEarthenShieldBar = {
									order = 22,
									type = "execute",
									name = "|cFF666666"..L["Reset Earthen Shield Bar"].."|r",
									--disabled = false,
									func = function()
										Auras.db.char.layout[3].earthenShieldBar.width = 260
										Auras.db.char.layout[3].earthenShieldBar.height = 21
										SSA.EarthenShieldTotemBar:SetWidth(260);
										SSA.EarthenShieldTotemBar:SetHeight(21);
									end,
								},
								EarthenShieldBarWidth = {
									order = 23,
									type = "range",
									name = L["Bar Width"],
									desc = L["Changes the width of the Earthen Shield Bar. (Default is 260)"],
									min = 100,
									max = 300,
									step = 1,
									bigStep = 1,
									get = function() return Auras.db.char.layout[3].earthenShieldBar.width end,
									set = function(_, value)
										Auras.db.char.layout[1].maelstromBar.width = value
										SSA.EarthenShieldTotemBar:SetWidth(value);
									end,
								},
								EarthenBarHeight = {
									order = 24,
									type = "range",
									name = L["Bar Height"],
									desc = L["Changes the height of the Earthen Shield Bar. (Default is 21)"],
									min = 10,
									max = 30,
									step = 1,
									bigStep = 1,
									get = function() return Auras.db.char.layout[3].earthenShieldBar.height end,
									set = function(_, value)
										Auras.db.char.layout[3].earthenShieldBar.height = value
										SSA.EarthenShieldTotemBar:SetHeight(value);
									end,
								},
								filler_8 = {
									order = 25,
									type = "description",
									name = ' ',
								},
								--[[MaelstromBarDesc = {
									order = 25,
									type = "description",
									name = L["Maelstrom Bar"],
								},]]
								TidalWavesBarAdjust = {
									order = 26,
									name = L["Preview Tidal Waves Bar"],
									desc = L["Toggle the adjustment of the Tidal Waves Bar size"],
									type = "toggle",
									get = function()
										return Auras.db.char.layout[3].tidalWavesBar.isAdjustable;
									end,
									set = function(_, value)
										Auras.db.char.layout[3].tidalWavesBar.isAdjustable = value;
										if (not value) then
											SSA.TidalWavesBar:Hide();
											SSA.TidalWavesBar:SetValue(0);
										else
											SSA.TidalWavesBar:Show();
											SSA.TidalWavesBar:SetValue(2);
										end
									end,
								},
								--[[filler_9 = {
									order = 27,
									type = "description",
									name = '',
								},]]
								ResetTidalWavesBar = {
									order = 27,
									type = "execute",
									name = "|cFF666666"..L["Reset Tidal Waves Bar"].."|r",
									--disabled = false,
									func = function()
										Auras.db.char.layout[3].tidalWavesBar.width = 225
										Auras.db.char.layout[3].tidalWavesBar.height = 7
										SSA.TidalWavesBar:SetWidth(225);
										SSA.TidalWavesBar:SetHeight(7);
									end,
								},
								TidalWavesBarWidth = {
									order = 28,
									type = "range",
									name = L["Bar Width"],
									desc = L["Changes the width of the Tidal Waves Bar. (Default is 225)"],
									min = 100,
									max = 300,
									step = 1,
									bigStep = 1,
									get = function() return Auras.db.char.layout[3].tidalWavesBar.width end,
									set = function(_, value)
										Auras.db.char.layout[3].tidalWavesBar.width = value
										SSA.TidalWavesBar:SetWidth(value);
									end,
								},
								TidalWavesHeight = {
									order = 29,
									type = "range",
									name = L["Bar Height"],
									desc = L["Changes the height of the Tidal Waves Bar. (Default is 7)"],
									min = 5,
									max = 30,
									step = 1,
									bigStep = 1,
									get = function() return Auras.db.char.layout[3].tidalWavesBar.height end,
									set = function(_, value)
										Auras.db.char.layout[3].tidalWavesBar.height = value
										SSA.TidalWavesBar:SetHeight(value);
									end,
								},
							},
						},
					},
				},
			}
		}
	end
	return settings_options;
end


function Auras:SetupOptions()
	local ACFG = LibStub("AceConfig-3.0")
	ACFG:RegisterOptionsTable("ShamanAuras Elemental Auras", GetElementalOptions)
	ACFG:RegisterOptionsTable("ShamanAuras Enhancement Auras", GetEnhancementOptions)
	ACFG:RegisterOptionsTable("ShamanAuras Restoration Auras", GetRestorationOptions)
	ACFG:RegisterOptionsTable("ShamanAuras Settings", GetSettingsOptions)

	local ACD = LibStub("AceConfigDialog-3.0")
	ACD:AddToBlizOptions("ShamanAuras Elemental Auras", L["Elemental Auras"], "ShamanAuras")
	ACD:AddToBlizOptions("ShamanAuras Enhancement Auras", L["Enhancement Auras"], "ShamanAuras")
	ACD:AddToBlizOptions("ShamanAuras Restoration Auras", L["Restoration Auras"], "ShamanAuras")
	ACD:AddToBlizOptions("ShamanAuras Settings", L["Settings"], "ShamanAuras")
end

local function ToggleConfigElements(settings,specialization,isDisabled,color,bar1,bar2)
	local spec = string.sub(specialization,1,3);
	local bar1_var = string.gsub(bar1,' ','')
	
	settings.args[spec.."Settings"].disabled = isDisabled;
	--settings.args[spec.."Settings"].args["FreeMove"..spec].disabled = isDisabled;
	settings.args[spec.."Settings"].args.MoveAuras.name = "|cFF"..color..L["Move "..specialization.." Auras"].."|r";
	--settings.args[spec.."Settings"].args["Reset"..spec].disabled = isDisabled;
	settings.args[spec.."Settings"].args.ResetAuras.name = "|cFF"..color..L["Reset "..specialization.." Auras"].."|r";
	--settings.args[spec.."Settings"].args[spec.."Triggers"].disabled = isDisabled;
	--settings.args[spec.."Settings"].args[spec.."Triggers"]["Reset"..spec.."Triggers"].disabled = isDisabled;
	settings.args[spec.."Settings"].args.Triggers.args.ResetTriggers.name = "|cFF"..color..L["Reset Settings Values"].."|r";
	--settings.args[spec.."Settings"].args[spec.."Layout"].disabled = isDisabled;
	settings.args[spec.."Settings"].args.Layout.args.ResetPrimaryLayout.name = "|cFF"..color..L["Reset Primary Layout"].."|r"
	settings.args[spec.."Settings"].args.Layout.args.ResetSecondaryLayout.name = "|cFF"..color..L["Reset Secondary Layout"].."|r"
	settings.args[spec.."Settings"].args.Layout.args[bar1_var].name = "|cFF"..color..L[bar1].."|r"
	if (bar2) then
		local bar2_var = string.gsub(bar2,' ','')
		settings.args[spec.."Settings"].args.Layout.args[bar2_var].name = "|cFF"..color..L[bar2].."|r"
	end
end

local function ToggleHasteBars(options,bloodlust,heroism)
	options.args.ProgressBars.args.BuffTimerBars.args.Bloodlust.hidden = bloodlust;
	options.args.ProgressBars.args.BuffTimerBars.args.Heroism.hidden = heroism;
end

function Auras:UpdateInterfaceSettings()
	local spec = GetSpecialization();
	local settings = GetSettingsOptions();
	local factionGroup = UnitFactionGroup('player');
	
	ToggleConfigElements(GetSettingsOptions(),"Elemental",true,'666666',"Reset Maelstrom Bar","Reset Icefury Bar");
	ToggleConfigElements(GetSettingsOptions(),"Enhancement",true,'666666',"Reset Maelstrom Bar");
	ToggleConfigElements(GetSettingsOptions(),"Restoration",true,'666666',"Reset Earthen Shield Bar","Reset Tidal Waves Bar");

	if (factionGroup == "Horde") then
		ToggleHasteBars(GetElementalOptions(),false,true)
		ToggleHasteBars(GetEnhancementOptions(),false,true)
		ToggleHasteBars(GetRestorationOptions(),false,true)
	elseif (factionGroup == "Alliance") then
		ToggleHasteBars(GetElementalOptions(),true,false)
		ToggleHasteBars(GetEnhancementOptions(),true,false)
		ToggleHasteBars(GetRestorationOptions(),true,false)
	end
	
	if (spec == 1) then
		ToggleConfigElements(GetSettingsOptions(),"Elemental",false,'FFCC00',"Reset Maelstrom Bar","Reset Icefury Bar");
		--[[settings.args.EleSettings.args.FreeMoveEle.disabled = false;
		settings.args.EleSettings.args.FreeMoveEle.name = "|cFFFFCC00"..L["Move Elemental Auras"].."|r";
		settings.args.EleSettings.args.ResetEle.disabled = false;
		settings.args.EleSettings.args.ResetEle.name = "|cFFFFCC00"..L["Reset Elemental Auras"].."|r";]]
	elseif (spec == 2) then
		ToggleConfigElements(GetSettingsOptions(),"Enhancement",false,'FFCC00',"Reset Maelstrom Bar");
		--[[settings.args.EnhSettings.args.FreeMoveEnh.disabled = false;
		settings.args.EnhSettings.args.FreeMoveEnh.name = "|cFFFFCC00"..L["Move Enhancement Auras"].."|r";
		settings.args.EnhSettings.args.ResetEnh.disabled = false;
		settings.args.EnhSettings.args.ResetEnh.name = "|cFFFFCC00"..L["Reset Enhancement Auras"].."|r";]]
	elseif (spec == 3) then
		ToggleConfigElements(GetSettingsOptions(),"Restoration",false,'FFCC00',"Reset Earthen Shield Bar","Reset Tidal Waves Bar");
		--settings.args.ResSettings.args.Triggers.args.CombatTidalWaveDisplay:SetValue(Auras.db.char.triggers.res.CombatTidalWaveDisplay);
		--settings.args.ResSettings.args.Triggers.args.OoCTidalWaveDisplay.value = Auras.db.char.triggers.res.OoCTidalWaveDisplay
		--[[settings.args.ResSettings.args.FreeMoveRes.disabled = false;
		settings.args.ResSettings.args.FreeMoveRes.name = "|cFFFFCC00"..L["Move Restoration Auras"].."|r";
		settings.args.ResSettings.args.ResetRes.disabled = false;
		settings.args.ResSettings.args.ResetRes.name = "|cFFFFCC00"..L["Reset Restoration Auras"].."|r";
		settings.args.ResSettings.args.ResTriggers.disabled = false;
		settings.args.ResSettings.args.ResTriggers.ResetResTriggers.disabled = false;
		settings.args.ResSettings.args.ResTriggers.ResetResTriggers.name = "|cFFFFCC00"..L["Reset Settings Values"].."|r";
		settings.args.ResSettings.args.ResLayout.disabled = false;
		settings.args.ResSettings.args.ResLayout.ResetPrimaryLayout = "|cFFFFCC00"..L["Reset Primary Layout"].."|r"
		settings.args.ResSettings.args.ResLayout.ResetSecondaryLayout = "|cFFFFCC-0-"..L["Reset Secondary Layout"].."|r"]]
	end
	
end

InterfaceOptionsFrame:HookScript("OnShow",function(self)
	Auras:UpdateInterfaceSettings();
	
end);
