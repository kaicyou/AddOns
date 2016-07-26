--Mage Nuggets by B-Buck (Bbuck of Eredar)

local magenugVer = "5.1.5"
local mirrorImageTime = 0;
local spellStealTog = 0;
local misslebTog = 0;
local mageProcSSTime = 0;
local mageProcHSTime = 0;
local mageProcHUTime = 0;
local mageProcMBTime = 0;
local mageProcBFTime = 0
local fofProgMonTime = 0;
local mageImpProgMonTime = 0;
local combatTextCvar = GetCVar("enableCombatText");
local abProgMonTime = 0;
local ttwFlag = false;
local abCastTime = 2.5;
local abStackCount = 0;
local polyTimer = 0;
local scorchTime = 0;
local icyTimer = 0;
local apTimer = 0;
local clearcastTime = 0;
local moonfireTime = 0;
local insectTime = 0;
local starsurgeTime = 0;
local moonkinCombatText = 0;
local incombat = 0;
local talentSpec = "damage";
local mnplayerClass = " "
local mnenglishClass = " "
local sstimeleft = 0;
local igniteTemp = 0;
local ignitetimer = 0;
local fbtime = 0;
local cauterizeTime = 0;
local bombType = "none";
local arcaneMissileCount = 0;
local alterTime = 0;
local tierSix = "runeOfPower";
local tierSixTime = 0;
local tierSixFlash = 0;
local tierSixIconFlash = 0;
local bombSpeced = "frost";
local _, class _, class = UnitClass("player")
local mnplayerClass, mnenglishClass = UnitClass("player");

function mageNuggets_OnStart(self)
    self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
    self:RegisterEvent("CVAR_UPDATE")
    self:RegisterEvent("ADDON_LOADED")
    self:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
    self:RegisterEvent("PLAYER_ENTERING_WORLD")
    self:RegisterEvent("CONFIRM_TALENT_WIPE")
    self:RegisterEvent("PLAYER_REGEN_DISABLED")
    self:RegisterEvent("PLAYER_REGEN_ENABLED")
    self:RegisterEvent("PLAYER_UPDATE_RESTING")
    self:RegisterEvent("PLAYER_LOGOUT")
end

local MN_UpdateInterval = 0.25;
local previewFramesCounter = 0;
previewMnFrames = false;
function MageNuggets_OnUpdate(self, elapsed)
 self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
 if (self.TimeSinceLastUpdate > MN_UpdateInterval) then

   if(previewFrames == true) then
     previewFramesCounter = previewFramesCounter + 1;
     if(previewFramesCounter > 300)then
       previewFramesCounter = 0;
       previewFrames = false;
     end
   end

    --Ignite
    local h = 1;
    local dotUp = false;
    local combName, combRank, _, combCount, _, _, expireTime, _, _, _, combspellId = UnitAura("target", h, "PLAYER|HARMFUL");
    while combName do
        if(combspellId == 12654) then
            dotUp = true;
            ignitetimer = RoundOne(expireTime - GetTime());
            MageNugIgnite_Frame_Bar:SetValue(ignitetimer);
            MageNugIgnite_FrameText2:SetText(ignitetimer);
        end
        h = h + 1;
        combName, combRank, _, combCount, _, _, _, _, _, _, combspellId = UnitAura("target", h, "PLAYER|HARMFUL");
    end
    if(dotUp == true) then
        if(MageNuggets.igniteTog == true)then
              MageNugIgnite_Frame:Show();
        end
    else
        MageNugIgnite_Frame:Hide();
    end

    --Alter Time
    if(alterTime >= 0) then
        if(alterTime >= 1) then
            MageNugInfo_FrameText:SetText("|cfffcea21 " .. RoundZero(alterTime));
        elseif(alterTime == 0.50) then
            MageNugInfo_FrameText:SetText("|cfffcea21 T I M E");
        else
            MageNugInfo_FrameText:SetText("");
        end
        alterTime = alterTime - 0.25;
    end

    --SpellSteal
    if (spellStealTog >= 1) then
        spellStealTog = spellStealTog - 1;
    else
        if (MageNuggets.ssMonitorToggle == true) then
            if(mnenglishClass == 'MAGE')then
                local stealableBuffs, i = { }, 1;
                local buffName, a1, a2, a3, a4, a5, expirationTime, _, isStealable = UnitAura("target", i, "HELPFUL");
                while buffName do
                    if(isStealable == true) then
                        if(expirationTime ~= nil)then
                            sstimeleft = RoundZero(expirationTime - GetTime());
                            if (sstimeleft > 60) then
                                sstimeleft = "+60";
                            end
                        end

                        stealableBuffs[#stealableBuffs + 1] = buffName.."  "..sstimeleft.."s";
                    end
                    i = i + 1;
                    buffName, _, _, _, _, _, expirationTime, _, isStealable = UnitAura("target", i, "HELPFUL");
                end
                if (#stealableBuffs < 1) and (previewMnFrames == false)then
                    MNSpellSteal_Frame:Hide();
                else
                    MNSpellSteal_Frame:Show();
                    stealableBuffs = table.concat(stealableBuffs, "\n");
                    MNSpellSteal_FrameBuffText:SetText("|cffFFFFFF"..stealableBuffs);
                end
                local stealableBuffs2, i = { }, 1;
                local buffName2, _, _, _, _, _, expirationTime2, _, isStealable2 = UnitAura("focus", i, "HELPFUL");
                while buffName2 do
                    if(isStealable2 == true) then
                        if(expirationTime2 ~= nil)then
                            sstimeleft2 = RoundZero(expirationTime2 - GetTime());
                            if (sstimeleft2 > 60) then
                                 sstimeleft2 = "+60";
                           end
                        end
                        stealableBuffs2[#stealableBuffs2 + 1] = buffName2.."  "..sstimeleft2.."s";
                    end
                    i = i + 1;
                    buffName2, _, _, _, _, _, expirationTime2, _, isStealable2 = UnitAura("focus", i, "HELPFUL");
                end
                if (#stealableBuffs2 < 1)  and (previewMnFrames == false) then
                    MNSpellStealFocus_Frame:Hide();
                else
                    MNSpellStealFocus_Frame:Show();
                  stealableBuffs2 = table.concat(stealableBuffs2, "\n");
                    MNSpellStealFocus_FrameBuffText:SetText("|cffFFFFFF"..stealableBuffs2);
                end
            elseif(mnenglishClass == 'SHAMAN')then
                if(UnitCanAttack("player", "target"))then
                    local purgeableBuffs, i = { }, 1;
                    local buffName1, _, _, _, debuffType1, _, expirationTime1, _, _ = UnitAura("target", i, "HELPFUL");
                    while buffName1 do
                        if(debuffType1 == "Magic") then
                            purgeableBuffs[#purgeableBuffs + 1] = buffName1;
                        end
                        i = i + 1;
                        buffName1, _, _, _, debuffType1, _, expirationTime1, _, _ = UnitAura("target", i, "HELPFUL");
                    end
                    if (#purgeableBuffs < 1) then
                        MNSpellSteal_Frame:Hide();
                    else
                        MNSpellSteal_Frame:Show();
                        purgeableBuffs = table.concat(purgeableBuffs, "\n");
                        MNSpellSteal_FrameBuffText:SetText("|cffFFFFFF"..purgeableBuffs);
                    end
                else
                    MNSpellSteal_Frame:Hide();
                end
                local stealableBuffs2, i = { }, 1;
                local buffName2, _, _, _, debuffTypep, _, expirationTime2, _, isStealable2 = UnitAura("focus", i, "HELPFUL");
                while buffName2 do
                    if(debuffTypep == "Magic") then
                        if(expirationTime2 ~= nil)then
                            sstimeleft2 = RoundZero(expirationTime2 - GetTime());
                            if (sstimeleft2 > 60) then
                                 sstimeleft2 = "+60";
                           end
                        end
                        stealableBuffs2[#stealableBuffs2 + 1] = buffName2.."  "..sstimeleft2.."s";
                    end
                    i = i + 1;
                    buffName2, _, _, _, debuffTypep, _, expirationTime2, _, isStealable2 = UnitAura("focus", i, "HELPFUL");
                end
                if (#stealableBuffs2 < 1) then
                    MNSpellStealFocus_Frame:Hide();
                else
                    MNSpellStealFocus_Frame:Show();
                    stealableBuffs2 = table.concat(stealableBuffs2, "\n");
                    MNSpellStealFocus_FrameBuffText:SetText("|cffFFFFFF"..stealableBuffs2);
                end
            elseif(mnenglishClass == 'PRIEST')then
                if(UnitCanAttack("player", "target"))then
                    local dispelBuffs, i = { }, 1;
                    local buffName2, _, _, _, debuffType2, _, expirationTime2, _, _ = UnitAura("target", i, "HELPFUL");
                    while buffName2 do
                        if(debuffType2 == "Magic") then
                            dispelBuffs[#dispelBuffs + 1] = buffName2;
                        end
                        i = i + 1;
                        buffName2, _, _, _, debuffType2, _, expirationTime2, _, _ = UnitAura("target", i, "HELPFUL");
                    end
                    if (#dispelBuffs < 1) then
                        MNSpellSteal_Frame:Hide();
                    else
                        MNSpellSteal_Frame:Show();
                        dispelBuffs = table.concat(dispelBuffs, "\n");
                        MNSpellSteal_FrameBuffText:SetText("|cffFFFFFF"..dispelBuffs);
                    end
                else
                    MNSpellSteal_Frame:Hide();
                end
            end
        end
    end
  self.TimeSinceLastUpdate = 0;
  end
end

--============================================================================--
--                                  On Update
--============================================================================--
function MageNuggetsHS_OnUpdate(self, elapsed)
 self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 0.1) then
        if (mageProcHSTime >= 0) then
            mageProcHSTime = RoundOne(mageProcHSTime - 0.1);
            MageNugProcFrame_ProcBar:SetValue(mageProcHSTime)
            MageNugProcFrameText2:SetText(mageProcHSTime)
            local position = (MageNugProcFrame_ProcBar:GetValue() / 14 * 120);
            MageNugProcFrame_ProcBarSpark:SetPoint("BOTTOMLEFT",MageNugProcFrame_ProcBar,"BOTTOMLEFT",position - 10,-6);
            if (mageProcHSTime <= 0) and (previewMnFrames == false) then
                MageNugProcFrame:Hide()
                MageNugProcFrame_ProcBar:SetValue(15)
            end
        end
    self.TimeSinceLastUpdate = 0;
    end
end

function MageNuggetsHU_OnUpdate(self, elapsed)
 self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 0.1) then
        if (mageProcHUTime >= 0) then
            mageProcHUTime = RoundOne(mageProcHUTime - 0.1);
            MageNugProcHUFrame_ProcBar:SetValue(mageProcHUTime)
            MageNugProcHUFrameText2:SetText(mageProcHUTime)
            local position = (MageNugProcHUFrame_ProcBar:GetValue() / 8 * 120);
            MageNugProcHUFrame_ProcBarSpark:SetPoint("BOTTOMLEFT",MageNugProcHUFrame_ProcBar,"BOTTOMLEFT",position - 10,-6);
            if (mageProcHUTime <= 0) and (previewMnFrames == false) then
                MageNugProcHUFrame:Hide()
                MageNugProcHUFrame_ProcBar:SetValue(8)
            end
        end
    self.TimeSinceLastUpdate = 0;
    end
end

function MageNuggetsMB_OnUpdate(self, elapsed)
 self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 0.1) then
        local i = 1;
        local buffName, rank, _, count, _, duration, expirationTime, _, _, _, spellId = UnitAura("player", i, "HELPFUL");
        while buffName do
            if (spellId == 79683) then
                MageNugMBProcFrame_CountText:SetText(count);
                mageProcMBTime = RoundOne(expirationTime - GetTime());
                MageNugMBProcFrame_ProcBar:SetValue(mageProcMBTime)
                MageNugMBProcFrameText2:SetText(mageProcMBTime)
                local position = (MageNugMBProcFrame_ProcBar:GetValue() / 20 * 120);
                MageNugMBProcFrame_ProcBarSpark:SetPoint("BOTTOMLEFT",MageNugMBProcFrame_ProcBar,"BOTTOMLEFT",position - 10,-6);
            end
            i = i + 1;
            buffName, rank, _, count, _, duration, expirationTime, _, _, _, spellId = UnitAura("player", i, "HELPFUL");
        end
        if (mageProcMBTime <= 0.1) and (previewMnFrames == false) then
            MageNugMBProcFrame:Hide()
            MageNugMBProcFrame_ProcBar:SetValue(14)
        end
    self.TimeSinceLastUpdate = 0;
    end
end

function MageNuggetsFoF_OnUpdate(self, elapsed)
 self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 0.1) then
        if (fofProgMonTime >= 0) then
            local i = 1;
            local buffName, rank, _, count, _, _, expirationTime, _, _, _, spellId = UnitAura("player", i, "HELPFUL");
            while buffName do
                if(spellId == 44544) then
                MageNugFoFProcFrameCountText:SetText("|cffffffff"..count)
                fofProgMonTime = RoundOne(expirationTime - GetTime());
                end
                i = i + 1;
                buffName, rank, _, count, _, _, expirationTime, _, _, _, spellId = UnitAura("player", i, "HELPFUL");
            end
            MageNugFoFProcFrame_ProcBar:SetValue(fofProgMonTime)
            MageNugFoFProcFrameText2:SetText(fofProgMonTime)
            local position = (MageNugFoFProcFrame_ProcBar:GetValue() / 14 * 120);
            MageNugFoFProcFrame_ProcBarSpark:SetPoint("BOTTOMLEFT",MageNugFoFProcFrame_ProcBar,"BOTTOMLEFT",position - 10,-6);
            if (fofProgMonTime <= 0) and (previewMnFrames == false) then
                MageNugFoFProcFrame:Hide()
                MageNugFoFProcFrame_ProcBar:SetValue(14)
            end
        end
    self.TimeSinceLastUpdate = 0;
    end
end

function MageNuggetsBF_OnUpdate(self, elapsed)
 self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 0.1) then
      if (mageProcBFTime >= 0) then
            local i = 1;
            local buffName, rank, _, count, _, _, expirationTime, _, _, _, spellId = UnitAura("player", i, "HELPFUL");
            while buffName do
                if(spellId == 190446) then
                MageNugBFProcFrameCountText:SetText("|cffffffff"..count)
                bfProgMonTime = RoundOne(expirationTime - GetTime());
                end
                i = i + 1;
                buffName, rank, _, count, _, _, expirationTime, _, _, _, spellId = UnitAura("player", i, "HELPFUL");
            end
            if(bfProgMonTime == nil) then
                bfProgMonTime = 0;
            end
            MageNugBFProcFrame_ProcBar:SetValue(bfProgMonTime)
            MageNugBFProcFrameText2:SetText(bfProgMonTime)
            local position = (MageNugBFProcFrame_ProcBar:GetValue() / 14 * 120);
            MageNugBFProcFrame_ProcBarSpark:SetPoint("BOTTOMLEFT",MageNugBFProcFrame_ProcBar,"BOTTOMLEFT",position - 10, -6);
            if (mageProcBFTime <= 0) and (previewMnFrames == false) then
                MageNugBFProcFrame:Hide()
                MageNugBFProcFrame_ProcBar:SetValue(15)
            end
        end

    self.TimeSinceLastUpdate = 0;
    end
end

-- Arcane Charge Counter
local abTimeoutCounter = 0;
local soundPlayed = false;
function MageNuggetsAB_OnUpdate(self, elapsed)
 self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 0.1) then
        local _, _, _, castTime, _, _, _, _, _ = GetSpellInfo(30451)
        local stackCount = UnitPower("player", SPELL_POWER_ARCANE_CHARGES);
        MNabCast_FrameText:SetText(RoundThree(castTime * 0.001))
        MageNugAB_FrameText:SetText("|cffFF00FF"..stackCount)
        abTimeoutCounter = abTimeoutCounter + 1;

        if(stackCount > 0) then
          abTimeoutCounter = 0;
        end

        if(stackCount == 0) then
          soundPlayed = false;
        end

        if (MageNuggets.ABSoundToggle == true) and (stackCount == 4) and (soundPlayed == false) then
          soundPlayed = true;
          PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNuggets.ABSound2);
        end

        if (abTimeoutCounter > 200) then
          abTimeoutCounter = 0;
          MageNugAB_Frame:Hide();
        end
    self.TimeSinceLastUpdate = 0;
    end
end

function MageNuggetsClearCast_OnUpdate(self, elapsed)
 self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 0.1) then
        if (clearcastTime >= 0) then
            clearcastTime = RoundOne(clearcastTime - 0.1);
            MageNugClearcast_Frame_Bar:SetValue(clearcastTime)
            MageNugClearcast_FrameText2:SetText(clearcastTime)
            if (clearcastTime <= 0) then
                MageNugClearcast_Frame:Hide();
            end
        end
    self.TimeSinceLastUpdate = 0;
    end
end

function MageNuggetsMI_OnUpdate(self, elapsed)
 self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 1.0) then
        if (mirrorImageTime >= 0) then
            mirrorImageTime = mirrorImageTime - 1.0;
            MageNugMI_Frame_MIText1:SetText(" "..mirrorImageTime)
            MageNugMI_Frame_MiBar:SetValue(mirrorImageTime)
            if (mirrorImageTime <= 0) then
                MageNugMI_Frame:Hide();
            end
        end
    self.TimeSinceLastUpdate = 0;
    end
end

function MageNugInvokers_OnUpdate(self, elapsed) -- rune of power
 self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 0.1) then
        local tempTime = 0;
        local standSpot = false;
        if(tierSix == "runeOfPower") then
            tempTime = (180 - RoundOne(GetTime() - tierSixTime));
            local i = 1;
            local buffName, rank, _, count, _, _, expirationTime, _, _, _, spellId = UnitAura("player", i, "HELPFUL");
            while buffName do
                if(spellId == 116014) then
                    standSpot = true;
                end
                i = i + 1;
                buffName, rank, _, count, _, _, expirationTime, _, _, _, spellId = UnitAura("player", i, "HELPFUL");
            end
        end

        if(((standSpot == false) and (tierSix == "runeOfPower") and (tempTime > 7)))then
            if(tierSixIconFlash > 5) then
                tierSixIconFlash = 0;
                MageNugInvokers_FrameTexture1:SetAlpha(0.3);
            else
                tierSixIconFlash = tierSixIconFlash + 1;
                MageNugInvokers_FrameTexture1:SetAlpha(1);
            end
        else
            MageNugInvokers_FrameTexture1:SetAlpha(1);
        end

        if (tempTime > 0.1) then
            MageNugInvokers_Frame_Bar_Text1:SetText(" "..tempTime);
            MageNugInvokers_Frame_Bar:SetValue(tempTime);
            local _, max = MageNugInvokers_Frame_Bar:GetMinMaxValues()
            local position = (MageNugInvokers_Frame_Bar:GetValue() / max * MageNugInvokers_Frame_Bar:GetWidth());
            MageNugInvokers_Frame_BarSpark:ClearAllPoints();
            MageNugInvokers_Frame_BarSpark:SetPoint("CENTER",MageNugInvokers_Frame_Bar,"LEFT",position + 1 ,0);

            if(tempTime < 7.0) then
               if(tierSixFlash > 5) then
                    tierSixFlash = 0;
                    MageNugInvokers_Frame:SetAlpha(0.3);
                else
                    tierSixFlash = tierSixFlash + 1;
                    MageNugInvokers_Frame:SetAlpha(1);
                end
            end
        elseif (tempTime <= 0.1) then
            MageNugInvokers_Frame_Bar_Text1:SetText("!")
            MageNugInvokers_Frame:SetAlpha(1);
            MageNugInvokers_Frame:Hide();
        end
    self.TimeSinceLastUpdate = 0;
    end
end

function MageNuggetsCauterize_OnUpdate(self, elapsed)
 self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 1.0) then
        if (cauterizeTime >= 0) then
            cauterizeTime = cauterizeTime - 1.0;
            MageNugCauterize_Frame_Text1:SetText(" "..cauterizeTime)
            MageNugCauterize_Frame_Bar:SetValue(cauterizeTime)
            if (cauterizeTime <= 0) then
                MageNugCauterize_Frame:Hide();
            end
        end
    self.TimeSinceLastUpdate = 0;
    end
end

function MageNuggetsPoly_OnUpdate(self, elapsed)
 self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 1.0) then
        if (polyTimer >= 0) then
            polyTimer = RoundZero(polyTimer - 1.0);
            MageNugPolyFrameTimerText:SetText(polyTimer);
            MageNugPolyFrame_Bar:SetValue(polyTimer);
            if(polyTimer <= 0) then
                MageNugPolyFrame:Hide();
            end
        end
    self.TimeSinceLastUpdate = 0;
    end
end

function MageNuggetsImpact_OnUpdate(self, elapsed)
 self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 0.1) then
        if (mageImpProgMonTime >= 0) then
            mageImpProgMonTime = RoundOne(mageImpProgMonTime - 0.1);
            MageNugImpactProcFrame_ProcBar:SetValue(mageImpProgMonTime)
            MageNugImpactProcFrameText2:SetText(mageImpProgMonTime)
            local position = (MageNugImpactProcFrame_ProcBar:GetValue() / 9 * 120);
            MageNugImpactProcFrame_ProcBarSpark:SetPoint("BOTTOMLEFT",MageNugImpactProcFrame_ProcBar,"BOTTOMLEFT",position - 10,-6);
            if (mageImpProgMonTime <= 0) then
                MageNugImpactProcFrame:Hide()
                MageNugImpactProcFrame_ProcBar:SetValue(9)
            end
        end
    self.TimeSinceLastUpdate = 0;
    end
end

--============================================================================--
--                                  On Event
--============================================================================--

function MageNuggets_OnEvent(this, event, ...)
    local argin1, argin2, argin3, argin4, _, argin6 = ...
    if (event == "ADDON_LOADED") then
        if(argin1 == "MageNuggets") then
            loadMageNuggetVariables_OnLoadEvent();
        end
    elseif (event == "ACTIVE_TALENT_GROUP_CHANGED") then
        MageNugCD1_Frame_Bar:SetValue(0);
        MageNugCD1_Frame:Hide();
        MageNugCD2_Frame_Bar:SetValue(0);
        MageNugCD2_Frame:Hide();
        MageNugCD3_Frame_Bar:SetValue(0);
        MageNugCD3_Frame:Hide();
        MageNugCD4_Frame_Bar:SetValue(0);
        MageNugCD4_Frame:Hide();
        MageNugCD5_Frame_Bar:SetValue(0);
        MageNugCD5_Frame:Hide();
        MageNugCD6_Frame_Bar:SetValue(0);
        MageNugCD6_Frame:Hide();
        if(mnenglishClass == 'DRUID') then
            currentSpec = GetSpecialization();
            if(currentSpec ~= 1) then
                MageNugMoonkinOptionFrame_CheckButton:SetChecked(true);
                MageNuggets.moonkinTog = true;
                MageNugMoonkin_Frame:Hide()
                MNmoonFire_Frame:Hide()
                MNinsectSwarm_Frame:Hide()
                MNstarSurge_Frame:Hide()
            else
                if(MageNuggets.moonkinBoxTog == true)then
                    if(MageNuggets.moonkinTog == true) then
                        MageNugMoonkinToggle_Frame:Show();
                    end
                end
            end
        end
    elseif (event == "CONFIRM_TALENT_WIPE") then
        MageNugCD1_Frame_Bar:SetValue(0);
        MageNugCD1_Frame:Hide();
        MageNugCD2_Frame_Bar:SetValue(0);
        MageNugCD2_Frame:Hide();
        MageNugCD3_Frame_Bar:SetValue(0);
        MageNugCD3_Frame:Hide();
        MageNugCD4_Frame_Bar:SetValue(0);
        MageNugCD4_Frame:Hide();
        MageNugCD5_Frame_Bar:SetValue(0);
        MageNugCD5_Frame:Hide();
        MageNugCD6_Frame_Bar:SetValue(0);
        MageNugCD6_Frame:Hide();
    elseif (event == "PLAYER_LOGOUT") then
        MageNugz_SaveFrame_Position();
    elseif (event == "PLAYER_REGEN_ENABLED") then
        incombat = 0;
        MageNugNova_Frame:Hide();
        MageNugInvokers_Frame:Hide();
        if (MageNuggets.moonkinTog == false) then
            if (MageNuggets.moonkinCombat == true) then
                MageNugMoonkin_Frame:Hide();
                MNmoonFire_Frame:Hide()
                MNinsectSwarm_Frame:Hide()
                MNstarSurge_Frame:Hide()
            end
        end
    elseif (event == "PLAYER_REGEN_DISABLED") then
        incombat = 1;
        if(mnenglishClass == 'MAGE') and (MageNuggets.novaMonitorToggle == true) and (isNovaSpeced())then
            MageNugNova_Frame:Show();
        end

        if (MageNuggets.moonkinTog == false) then
            if (MageNuggets.moonkinCombat == true) then
                MageNugMoonkin_Frame:Show();
                MNmoonFire_Frame:Show()
                MNinsectSwarm_Frame:Show()
                MNstarSurge_Frame:Show()
            end
        end

    elseif (event == "CVAR_UPDATE") then
        combatTextCvar = GetCVar("enableCombatText")
    elseif (event == "PLAYER_ENTERING_WORLD") then
        MageNugHordeFrame:Hide();
        MageNugAlliFrame:Hide();
        MageNugz_SetFrame_Positions();
        MageNugz_SaveFrame_Position();
    elseif (event == "PLAYER_UPDATE_RESTING") then
        MageNugHordeFrame:Hide();
        MageNugAlliFrame:Hide();
    elseif (event == "COMBAT_LOG_EVENT_UNFILTERED")then
        local timestamp, event1, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName = select(1, ...)
        local arg, spellName, spellSchool, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12 = select(12, ...)

        -- if((sourceName == UnitName("player")) or (destName == UnitName("player"))) then
        --  DEFAULT_CHAT_FRAME:AddMessage(arg.." "..event1.." "..spellName);
        -- end

        if (event1 == "SPELL_DISPEL") and (sourceName == UnitName("player")) then
            if (MageNuggets.ssMonitorToggle == true) then
                if(combatTextCvar == '1') then
                    CombatText_AddMessage("Dispelled"..":"..GetSpellLink(arg5), CombatText_StandardScroll, 0.10, 0, 1, "sticky", nil);
                end
                if (MageNuggets.consoleTextEnabled == true) then
                    DEFAULT_CHAT_FRAME:AddMessage("|cffFFFFFF".."Dispelled "..GetSpellLink(arg5).." From "..destName)
	    	    end
            end
        elseif (event1 == "SPELL_AURA_REFRESH") and (sourceName == UnitName("player")) then
            spellAuraRefresh(arg, sourceName, destName);
        elseif (event1 == "SPELL_AURA_REMOVED") and (sourceName == UnitName("player")) then
            spellAuraRemoved(arg, sourceName, destName);
        elseif (event1 == "SPELL_PERIODIC_DAMAGE") and (sourceName == UnitName("player")) then
            if(arg == 12654) then
                if(MageNuggets.igniteTog == true)then
                    MageNugIgnite_FrameText:SetText(arg5);
                end
            end
        elseif (event1 == "SPELL_AURA_APPLIED") and (sourceName == UnitName("player")) then
            spellAuraAppliedSource(arg, sourceName, destName);
		   elseif (event1 == "SPELL_AURA_APPLIED") and (destName == UnitName("player")) then
            spellAuraAppliedDest(arg, sourceName, destName);
		   elseif (event1 == "SPELL_CAST_SUCCESS") and (sourceName == UnitName("player")) then
          if(arg == 30451) and (MageNuggets.arcaneBlastToggle == true) then
              MageNugAB_Frame:Show();
           end
        elseif (event1 == "SPELL_STOLEN") and (sourceName == UnitName("player")) then
            if(combatTextCvar == '1') then
                CombatText_AddMessage("Stole"..":"..GetSpellLink(arg5), CombatText_StandardScroll, 0.10, 0, 1, "sticky", nil);
            end
            if (MageNuggets.consoleTextEnabled == true) then
               DEFAULT_CHAT_FRAME:AddMessage("|cffFFFFFF".."Spell Stolen"..":"..GetSpellLink(arg5).."From "..destName)
    	    end
        end
     end
end


--============================================================================--
--                      Spell Aura Removed
--============================================================================--

function spellAuraRemoved(arg, sourceName, destName)
    if (arg == 48107) then -- heating up
        MageNugProcHUFrame:Hide();
    elseif(arg == 190446) then
        MageNugBFProcFrame:Hide()
    elseif(arg == 44544) then
        MageNugFoFProcFrame:Hide()
    elseif(arg == 79683) then
        MageNugMBProcFrame:Hide();
    elseif (arg == 64343) then
        MageNugImpactProcFrame:Hide();
    elseif(arg == 48108) then
        MageNugProcFrame:Hide();
    elseif(arg == 87023) then
        if(combatTextCvar == '1') then
            if (MageNuggets.mageProcToggle == true) then
                CombatText_AddMessage("extinguished", CombatText_StandardScroll, 0.90, 0, 0, nil, isStaggered, nil);
            end
        end
        if (MageNuggets.cauterizeToggle == true) then
            MageNugCauterizeFrame:Hide();
        end
    end

    if (MageNuggets.polyToggle == true) then
        if (arg == 9484) then
            MageNugPolyFrame:Hide();
            polyTimer = 0;
            if(combatTextCvar == '1') then
                CombatText_AddMessage("Shackle Broken", CombatText_StandardScroll, 1, 0.20, 1, "sticky", nil);
            end
            if (MageNuggets.consoleTextEnabled == true) then
                DEFAULT_CHAT_FRAME:AddMessage("|cffFF0000".."Shackle Broken On"..":|cffFFFFFF "..destName);
            end
            if (MageNuggets.polySoundToggle == true) then
                PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNuggets.polySound2)
            end
        elseif (arg == 115078) then --paralysis
            MageNugPolyFrame:Hide();
            polyTimer = 0;
            if(combatTextCvar == '1') then
                CombatText_AddMessage("Paralysis Broken", CombatText_StandardScroll, 1, 0.20, 1, "sticky", nil);
            end
            if (MageNuggets.consoleTextEnabled == true) then
                DEFAULT_CHAT_FRAME:AddMessage("|cffFF0000".."Paralysis Broken On"..":|cffFFFFFF "..destName);
            end
            if (MageNuggets.polySoundToggle == true) then
                PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNuggets.polySound2)
            end
        elseif (arg == 2637) then
            MageNugPolyFrame:Hide();
            polyTimer = 0;
            if(combatTextCvar == '1') then
                CombatText_AddMessage("Hibernate Broken", CombatText_StandardScroll, 1, 0.20, 1, "sticky", nil);
            end
            if (MageNuggets.consoleTextEnabled == true) then
                DEFAULT_CHAT_FRAME:AddMessage("|cffFF0000".."Hibernate Broken On"..":|cffFFFFFF "..destName);
            end
            if (MageNuggets.polySoundToggle == true) then
                PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNuggets.polySound2)
            end
        elseif (arg == 76780) then -- bind elemental
            MageNugPolyFrame:Hide();
            polyTimer = 0;
            if(combatTextCvar == '1') then
                CombatText_AddMessage("Bind Broken", CombatText_StandardScroll, 1, 0.20, 1, "sticky", nil);
            end
            if (MageNuggets.consoleTextEnabled == true) then
                DEFAULT_CHAT_FRAME:AddMessage("|cffFF0000".."Bind Broken On"..":|cffFFFFFF "..destName);
            end
            if (MageNuggets.polySoundToggle == true) then
                PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNuggets.polySound2)
            end
        elseif (arg == 51514) then
            MageNugPolyFrame:Hide();
            polyTimer = 0;
            if(combatTextCvar == '1') then
                CombatText_AddMessage("Hex Broken", CombatText_StandardScroll, 1, 0.20, 1, "sticky", nil);
            end
            if (MageNuggets.consoleTextEnabled == true) then
                DEFAULT_CHAT_FRAME:AddMessage("|cffFF0000".."Hex Broken On"..":|cffFFFFFF "..destName);
            end
            if (MageNuggets.polySoundToggle == true) then
                PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNuggets.polySound2)
            end
        elseif (arg == 28272) then
            MageNugPolyFrame:Hide();
            polyTimer = 0;
            if(combatTextCvar == '1') then
                CombatText_AddMessage("Polymorph Broken", CombatText_StandardScroll, 1, 0.20, 1, "sticky", nil);
            end
            if (MageNuggets.consoleTextEnabled == true) then
                DEFAULT_CHAT_FRAME:AddMessage("|cffFF0000".."Polymorph(Pig) Broken On"..":|cffFFFFFF "..destName);
            end
            if (MageNuggets.polySoundToggle == true) then
                PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNuggets.polySound2)
            end
        elseif (arg == 118) then
            MageNugPolyFrame:Hide();
            polyTimer = 0;
            if(combatTextCvar == '1') then
                CombatText_AddMessage("Polymorph Broken", CombatText_StandardScroll, 1, 0.20, 1, "sticky", nil);
            end
            if (MageNuggets.consoleTextEnabled == true) then
                DEFAULT_CHAT_FRAME:AddMessage("|cffFF0000".."Polymorph(Sheep) Broken On"..":|cffFFFFFF "..destName);
            end
            if (MageNuggets.polySoundToggle == true) then
                PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNuggets.polySound2)
            end
        elseif (arg == 28271) then
            MageNugPolyFrame:Hide();
            polyTimer = 0;
            if(combatTextCvar == '1') then
                CombatText_AddMessage("Polymorph Broken", CombatText_StandardScroll, 1, 0.20, 1, "sticky", nil);
            end
            if (MageNuggets.consoleTextEnabled == true) then
                DEFAULT_CHAT_FRAME:AddMessage("|cffFF0000".."Polymorph(Turtle) Broken On"..":|cffFFFFFF "..destName);
            end
            if (MageNuggets.polySoundToggle == true) then
                PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNuggets.polySound2)
            end
        elseif (arg == 61721) then
            MageNugPolyFrame:Hide();
            polyTimer = 0;
            if(combatTextCvar == '1') then
                CombatText_AddMessage("Polymorph Broken", CombatText_StandardScroll, 1, 0.20, 1, "sticky", nil);
            end
            if (MageNuggets.consoleTextEnabled == true) then
                DEFAULT_CHAT_FRAME:AddMessage("|cffFF0000".."Polymorph(Rabbit) Broken On"..":|cffFFFFFF "..destName);
            end
            if (MageNuggets.polySoundToggle == true) then
                PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNuggets.polySound2)
            end
        elseif (arg == 61305) then
            MageNugPolyFrame:Hide();
            polyTimer = 0;
            if(combatTextCvar == '1') then
                CombatText_AddMessage("Polymorph Broken", CombatText_StandardScroll, 1, 0.20, 1, "sticky", nil);
            end
            if (MageNuggets.consoleTextEnabled == true) then
                DEFAULT_CHAT_FRAME:AddMessage("|cffFF0000".."Polymorph(Black Cat) Broken On"..":|cffFFFFFF "..destName);
            end
            if (MageNuggets.polySoundToggle == true) then
                PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNuggets.polySound2)
            end
        elseif (arg == 126819) then --porcupine
            MageNugPolyFrame:Hide();
            polyTimer = 0;
            if(combatTextCvar == '1') then
                CombatText_AddMessage("Polymorph Broken", CombatText_StandardScroll, 1, 0.20, 1, "sticky", nil);
            end
            if (MageNuggets.consoleTextEnabled == true) then
                DEFAULT_CHAT_FRAME:AddMessage("|cffFF0000".."Polymorph(Porcupine) Broken On"..":|cffFFFFFF "..destName);
            end
            if (MageNuggets.polySoundToggle == true) then
                PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNuggets.polySound2)
            end
        elseif (arg == 161354) then --monkey
            MageNugPolyFrame:Hide();
            polyTimer = 0;
            if(combatTextCvar == '1') then
                CombatText_AddMessage("Polymorph Broken", CombatText_StandardScroll, 1, 0.20, 1, "sticky", nil);
            end
            if (MageNuggets.consoleTextEnabled == true) then
                DEFAULT_CHAT_FRAME:AddMessage("|cffFF0000".."Polymorph(Monkey) Broken On"..":|cffFFFFFF "..destName);
            end
            if (MageNuggets.polySoundToggle == true) then
                PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNuggets.polySound2)
            end
        end
    end
end

--============================================================================--
--                      Spell Aura Refresh
--============================================================================--
function spellAuraRefresh(arg, sourceName, destName)
  if(arg == 48108) then -- hot streak
        if(MageNuggets.procMonitorToggle == true) then
            mageProcHSTime = 14;
            MageNugProcFrameText:SetText("|cffFF0000".."HOT STREAK!")
            MageNugProcFrame_ProcBar:SetValue(mageProcHSTime)
            MageNugProcFrame:Show()
        end
        if(combatTextCvar == '1') then
            if (MageNuggets.mageProcToggle == true) then
                CombatText_AddMessage("HOT STREAK!", CombatText_StandardScroll, 1, 0.10, 0, "crit", isStaggered,nil);
	        end
        end
        if (MageNuggets.hsSoundToggle == true) then
            PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNuggets.hsSound2)
        end
    -- Brain Freeze
    elseif(arg == 190446) then
        if(MageNuggets.procMonitorToggle == true) then
            mageProcBFTime = 14;
            MageNugBFProcFrameText:SetText("|cffFF3300".."BRAIN FREEZE!")
            MageNugBFProcFrame_ProcBar:SetValue(mageProcBFTime)
            MageNugBFProcFrame:Show()
        end
        if(combatTextCvar == '1') then
            if (MageNuggets.mageProcToggle == true) then
                CombatText_AddMessage("BRAIN FREEZE!", CombatText_StandardScroll, 1, 0.20, 0, "crit", isStaggered);
	        end
        end
        if (MageNuggets.brainfreezeSoundToggle == true) then
           PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNuggets.brainfreezeSound2)
        end
    elseif(arg == 44544) then --Fingers of Frost
        if(MageNuggets.procMonitorToggle == true) then
            fofProgMonTime = 14;
            MageNugFoFProcFrameText:SetText("|cffFFFFFF".."Fingers Of Frost")
            MageNugFoFProcFrame_ProcBar:SetValue(fofProgMonTime)
            MageNugFoFProcFrame:Show()
        end
        if(combatTextCvar == '1') then
            if (MageNuggets.mageProcToggle == true) then
               CombatText_AddMessage("Fingers Of Frost", CombatText_StandardScroll, 1, 1, 1, "crit", 1);
	        end
        end
        if (MageNuggets.fofSoundToggle == true) then
           PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNuggets.fofSound2)
        end
    end

    if (MageNuggets.polyToggle == true) then
        if (arg == 115078) then -- Paralysis
            _, _, _, _, _, _, polyExpTime, unitCaster, _, _, _ = UnitAura("target", paralysisId, nil,"PLAYER|HARMFUL")
            if(polyExpTime ~= nil) then
                polyTimer = RoundZero(polyExpTime - GetTime());
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Paralysis "..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\ability_monk_paralysis");
                MageNugPolyFrame:Show();
            else
                polyTimer = 40;
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Paralysis "..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\ability_monk_paralysis");
                MageNugPolyFrame:Show();
            end
        elseif (arg == 9484) then -- shackle
            _, _, _, _, _, _, polyExpTime, unitCaster, _, _, _ = UnitAura("target", shackleId, nil,"PLAYER|HARMFUL")
            if(polyExpTime ~= nil) then
                polyTimer = RoundZero(polyExpTime - GetTime());
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Shackle "..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\spell_nature_slow");
                MageNugPolyFrame:Show();
            else
                polyTimer = 50;
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Shackle "..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\spell_nature_slow");
                MageNugPolyFrame:Show();
            end
        elseif (arg == 2637) then -- hibernate
            _, _, _, _, _, _, polyExpTime, unitCaster, _, _, _ = UnitAura("target", polyPigId, nil,"PLAYER|HARMFUL")
            if(polyExpTime ~= nil) then
                polyTimer = RoundZero(polyExpTime - GetTime());
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Hibernate"..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\spell_nature_sleep");
                MageNugPolyFrame:Show();
            else
                polyTimer = 40;
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Hibernate"..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\spell_nature_sleep");
                MageNugPolyFrame:Show();
            end
        elseif (arg == 51514) then -- hex
            _, _, _, _, _, _, polyExpTime, unitCaster, _, _, _ = UnitAura("target", polyPigId, nil,"PLAYER|HARMFUL")
            if(polyExpTime ~= nil) then
                polyTimer = RoundZero(polyExpTime - GetTime());
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Hex"..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\spell_shaman_hex");
                MageNugPolyFrame:Show();
            else
                polyTimer = 60;
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Hex"..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\spell_shaman_hex");
                MageNugPolyFrame:Show();
            end
        elseif (arg == 28272) then -- pig
            _, _, _, _, _, _, polyExpTime, unitCaster, _, _, _ = UnitAura("target", polyPigId, nil,"PLAYER|HARMFUL")
            if(polyExpTime ~= nil) then
                polyTimer = RoundZero(polyExpTime - GetTime());
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\Spell_magic_polymorphpig");
                MageNugPolyFrame:Show();
            else
                polyTimer = 50;
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\Spell_magic_polymorphpig");
                MageNugPolyFrame:Show();
            end
        elseif (arg == 61305) then -- cat
            _, _, _, _, _, _, polyExpTime, unitCaster, _, _, _ = UnitAura("target", polyCatId, nil,"PLAYER|HARMFUL")
            if(polyExpTime ~= nil) then
                polyTimer = RoundZero(polyExpTime - GetTime());
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\Achievement_halloween_cat_01");
                MageNugPolyFrame:Show();
            else
                polyTimer = 50;
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\Achievement_halloween_cat_01");
                MageNugPolyFrame:Show();
            end
        elseif (arg == 61721) then -- rabbit
            _, _, _, _, _, _, polyExpTime, unitCaster, _, _, _ = UnitAura("target", polyRabbitId, nil,"PLAYER|HARMFUL")
            if(polyExpTime ~= nil) then
                polyTimer = RoundZero(polyExpTime - GetTime());
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\Spell_magic_polymorphrabbit");
                MageNugPolyFrame:Show();
            else
                polyTimer = 50;
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\Spell_magic_polymorphrabbit");
                MageNugPolyFrame:Show();
            end
        elseif (arg == 28271) then -- turtle
            _, _, _, _, _, _, polyExpTime, unitCaster, _, _, _ = UnitAura("target", polyTurtleId, nil,"PLAYER|HARMFUL")
            if(polyExpTime ~= nil) then
                polyTimer = RoundZero(polyExpTime - GetTime());
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\Ability_hunter_pet_turtle");
                MageNugPolyFrame:Show();
            else
                polyTimer = 50;
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\Ability_hunter_pet_turtle");
                MageNugPolyFrame:Show();
            end
        elseif (arg == 126819) then -- porcupine
            _, _, _, _, _, _, polyExpTime, unitCaster, _, _, _ = UnitAura("target", polyTurtleId, nil,"PLAYER|HARMFUL")
            if(polyExpTime ~= nil) then
                polyTimer = RoundZero(polyExpTime - GetTime());
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\inv_pet_porcupine");
                MageNugPolyFrame:Show();
            else
                polyTimer = 50;
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\inv_pet_porcupine");
                MageNugPolyFrame:Show();
            end
        elseif (arg == 161354) then -- monkey
            _, _, _, _, _, _, polyExpTime, unitCaster, _, _, _ = UnitAura("target", polyTurtleId, nil,"PLAYER|HARMFUL")
            if(polyExpTime ~= nil) then
                polyTimer = RoundZero(polyExpTime - GetTime());
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\ability_hunter_aspectofthemonkey");
                MageNugPolyFrame:Show();
            else
                polyTimer = 50;
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\ability_hunter_aspectofthemonkey");
                MageNugPolyFrame:Show();
            end
        elseif (arg == 118)  then  --sheep
            _, _, _, _, _, _, polyExpTime, unitCaster, _, _, _ = UnitAura("target", polySheepId, nil,"PLAYER|HARMFUL")
            if(polyExpTime ~= nil) then
                polyTimer = RoundZero(polyExpTime - GetTime());
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\Spell_nature_polymorph");
                MageNugPolyFrame:Show();
            else
                polyTimer = 50;
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\Spell_nature_polymorph");
                MageNugPolyFrame:Show();
            end
        end
    end
end
--============================================================================--
--                      Spell Aura Applied Dest
--============================================================================--

function spellAuraAppliedDest(arg, sourceName, destName)
    if (arg == 16870) then -- Clearcasting
        if (MageNuggets.clearcastToggle == true) then
            if(combatTextCvar == '1') then
                CombatText_AddMessage("Clearcast", CombatText_StandardScroll, 1, 1, 1, nil, isStaggered, nil);
            end
            clearcastTime = 14;
            MageNugClearcast_Frame:Show();
        end
    elseif (arg == 64868) then -- Praxis T8
	    if(combatTextCvar == '1') then
            if (MageNuggets.mageProcToggle == true) then
                CombatText_AddMessage("Praxis", CombatText_StandardScroll, 1, 0.10, 0, "sticky", nil, nil);
                CombatText_AddMessage("+350 Spellpower", CombatText_StandardScroll, 1, 0.10, 0, "sticky", nil);
            end
        end
    elseif(arg == 80353) then -- Time Warp
        if (MageNuggets.timewarpSoundToggle == true) then
            PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNuggets.timewarpSound2) --lawl
        end
        if sourceName ~= UnitName("player") then
            if (MageNuggets.consoleTextEnabled == true) then
                DEFAULT_CHAT_FRAME:AddMessage("|cffFF0000".."Time Warp used by"..":|cff0000FF "..sourceName);
            end
            if(combatTextCvar == '1') then
               CombatText_AddMessage(sourceName, CombatText_StandardScroll, 1, 0.10, 0, "sticky", nil);
               CombatText_AddMessage("Time Warp!", CombatText_StandardScroll, 1, 0.10, 0, "sticky", nil);
            end
        end
    elseif(arg == 102351) then -- drums of rage
        if sourceName ~= UnitName("player") then
            if (MageNuggets.consoleTextEnabled == true) then
                DEFAULT_CHAT_FRAME:AddMessage("|cffFF0000".."Drums of Rage used by"..":|cff0000FF "..sourceName);
            end
            if(combatTextCvar == '1') then
               CombatText_AddMessage(sourceName, CombatText_StandardScroll, 1, 0.10, 0, "sticky", nil);
               CombatText_AddMessage("Drums of Rage!", CombatText_StandardScroll, 1, 0.10, 0, "sticky", nil);
            end
        end
    elseif (arg == 2825) then --bloodlust
        if sourceName ~= UnitName("player") then
            if (MageNuggets.consoleTextEnabled == true) then
                DEFAULT_CHAT_FRAME:AddMessage("|cffFF0000".."Blood Lust used by"..":|cff0000FF "..sourceName);
            end
            if(combatTextCvar == '1') then
                CombatText_AddMessage(sourceName, CombatText_StandardScroll, 1, 0.10, 0, "sticky", nil);
                CombatText_AddMessage("BLOOD LUSTED!", CombatText_StandardScroll, 1, 0.10, 0, "sticky", nil);
            end
        end
    elseif (arg == 32182) then
        if sourceName ~= UnitName("player") then
            if (MageNuggets.consoleTextEnabled == true) then
                DEFAULT_CHAT_FRAME:AddMessage("|cffFF0000".."Heroism used by"..":|cff0000FF "..sourceName);
            end
            if(combatTextCvar == '1') then
                CombatText_AddMessage(sourceName, CombatText_StandardScroll, 1, 0.10, 0, "sticky", nil);
                CombatText_AddMessage("HEROISM!", CombatText_StandardScroll, 1, 0.10, 0, "sticky", nil);
            end
        end
    end

    if(combatTextCvar == '1') then
        if (arg == 63711) then
            CombatText_AddMessage("STORM POWER".."!!", CombatText_StandardScroll, 1, 1, 1, "sticky", nil);
            CombatText_AddMessage("(+135% Crit Damage)", CombatText_StandardScroll, 1, 1, 1, "sticky", nil);
        elseif (arg == 65134) then
            CombatText_AddMessage("STORM POWER".."!", CombatText_StandardScroll, 1, 1, 1, "sticky", nil);
            CombatText_AddMessage("(+135% Crit Damage)", CombatText_StandardScroll, 1, 1, 1, "sticky", nil);
        elseif (arg == 62821) then
            CombatText_AddMessage("TOASTY FIRE!", CombatText_StandardScroll, 1, 0.20, 0, "sticky", nil);
        elseif (arg == 29232) then
            CombatText_AddMessage("Fungal Creep!", CombatText_StandardScroll, 0, 1, 0.2, "sticky", nil);
            CombatText_AddMessage("(+50% Crit Rating)", CombatText_StandardScroll, 0, 1, 0,2, "sticky", nil);
        elseif (arg == 62320) then
            CombatText_AddMessage("Aura of Celerity!", CombatText_StandardScroll, 1, 1, 1, "sticky", nil);
            CombatText_AddMessage("(+20% Haste)", CombatText_StandardScroll, 1, 1, 1, "sticky", nil);
        elseif (arg == 62807) then
            CombatText_AddMessage("Star Light!", CombatText_StandardScroll, 1, 1, 1, "sticky", nil);
            CombatText_AddMessage("(50% Haste)", CombatText_StandardScroll, 1, 1, 1, "sticky", nil);
        end
    end
end

--============================================================================--
--                      Spell Aura Applied Source
--============================================================================--

function spellAuraAppliedSource(arg, sourceName, destName)
    if(arg == 110909) then
        if(MageNuggets.alterTimeToggle == true) then
            alterTime = 10;
        end
    elseif (arg == 48107) then -- heating up!
        if(MageNuggets.procMonitorToggle == true) then
            mageProcHUTime = 9.6;
            MageNugProcHUFrameText:SetText("|cffFFCC00".."HEATING UP!")
            MageNugProcHUFrame_ProcBar:SetValue(mageProcHUTime)
            MageNugProcHUFrame:Show();
        end
        if(combatTextCvar == '1') then
            if (MageNuggets.mageProcToggle == true) then
                CombatText_AddMessage("HEATING UP!", CombatText_StandardScroll, 1, 0.80, 0, "crit", isStaggered,nil);
            end
        end
        if (MageNuggets.impactSoundToggle == true) then
            PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNuggets.impactSound2)
        end
    elseif(arg == 80353) then -- time warp
        if (MageNuggets.timewarpSoundToggle == true) then
            PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNuggets.timewarpSound2) --lawl
        end
       if sourceName ~= UnitName("player") then
            if (MageNuggets.consoleTextEnabled == true) then
                DEFAULT_CHAT_FRAME:AddMessage("|cffFF0000".."Time Warp used by"..":|cff0000FF "..sourceName);
            end
            if(combatTextCvar == '1') then
               CombatText_AddMessage(sourceName, CombatText_StandardScroll, 1, 0.10, 0, "sticky", nil);
               CombatText_AddMessage("Time Warp!", CombatText_StandardScroll, 1, 0.10, 0, "sticky", nil);
            end
        end
    elseif (arg == 29166) then
        if (destName ~= UnitName("player")) then
            if (MageNuggets.msgToggle == true) then
                SendChatMessage(MageNuggets.innervatNotify, "WHISPER", nil, destName);
            end
        end
    elseif(arg == 93400) then -- Shooting Stars
        if(combatTextCvar == '1') then
            if (MageNuggets.moonkinCombatText == true) then
                CombatText_AddMessage("Shooting Stars", CombatText_StandardScroll, 0.60, 0, 0.60, "crit", isStaggered, nil);
            end
        end
        if (MageNuggets.procSoundToggle == true) then
            PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNuggets.procSound2)
        end
    elseif(arg == 79683) then -- Arcane Missiles!
        if(MageNuggets.procMonitorToggle == true) then
            mageProcMBTime = 20;
            MageNugMBProcFrameText:SetText("|cffFF33FF".."ARCANE MISSILES!")
            MageNugMBProcFrame_ProcBar:SetValue(mageProcMBTime)
            MageNugMBProcFrame:Show()
        end
        if(combatTextCvar == '1') then
            if (MageNuggets.mageProcToggle == true) then
                CombatText_AddMessage("ARCANE MISSILES!", CombatText_StandardScroll, 0.60, 0, 0.60, "crit", isStaggered, nil);
            end
        end
        if (MageNuggets.procSoundToggle == true) then
            PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNuggets.procSound2)
        end
    elseif(arg == 87023) then
        if(combatTextCvar == '1') then
            if (MageNuggets.mageProcToggle == true) then
                CombatText_AddMessage("Cauterize:", CombatText_StandardScroll, 0.90, 0, 0, nil, isStaggered, nil);
                CombatText_AddMessage("EXTINGUISH YOURSELF", CombatText_StandardScroll, 0.90, 0, 0, nil, isStaggered, nil);
            end
        end
        if (MageNuggets.cauterizeToggle == true) then
            MageNugCauterizeFrame:Show();
            cauterizeTime = 120;
            MageNugCauterize_Frame:Show();
        end
        if (MageNuggets.cauterizeSoundToggle == true) then
            PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNuggets.cauterizeSound2)
        end
    elseif(arg == 48108) then --Hot Streak!
        if(MageNuggets.procMonitorToggle == true) then
            mageProcHSTime = 14;
            MageNugProcFrameText:SetText("|cffFF0000".."HOT STREAK!")
            MageNugProcFrame_ProcBar:SetValue(mageProcHSTime)
            MageNugProcFrame:Show()
        end
        if(combatTextCvar == '1') then
            if (MageNuggets.mageProcToggle == true) then
                CombatText_AddMessage("HOT STREAK!", CombatText_StandardScroll, 1, 0.10, 0, "crit", isStaggered,nil);
            end
        end
        if (MageNuggets.hsSoundToggle == true) then
            PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNuggets.hsSound2)
        end
    elseif(arg == 190446) then --Brain Freeze
        if(MageNuggets.procMonitorToggle == true) then
            mageProcBFTime = 14;
            MageNugBFProcFrameText:SetText("|cffFF3300".."BRAIN FREEZE!")
            MageNugBFProcFrame_ProcBar:SetValue(mageProcBFTime)
            MageNugBFProcFrame:Show()
        end
        if(combatTextCvar == '1') then
            if (MageNuggets.mageProcToggle == true) then
                CombatText_AddMessage("BRAIN FREEZE!", CombatText_StandardScroll, 1, 0.20, 0, "crit", isStaggered);
            end
        end
        if (MageNuggets.brainfreezeSoundToggle == true) then
        PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNuggets.brainfreezeSound2)
        end
    elseif(arg == 44544) then --Fingers of Frost
        if(MageNuggets.procMonitorToggle == true) then
            fofProgMonTime = 15;
            MageNugFoFProcFrameText:SetText("|cffFFFFFF".."Fingers Of Frost")
            MageNugFoFProcFrame_ProcBar:SetValue(fofProgMonTime)
            MageNugFoFProcFrame:Show()
        end
        if(combatTextCvar == '1') then
            if (MageNuggets.mageProcToggle == true) then
            CombatText_AddMessage("Fingers Of Frost", CombatText_StandardScroll, 1, 1, 1, "crit", 1);
            end
        end
        if (MageNuggets.fofSoundToggle == true) then
        PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNuggets.fofSound2)
        end
    elseif (arg == 55342) then
        if (MageNuggets.mirrorImageToggle == true) then
            if (MageNuggets.miSoundToggle == true) then
                PlaySoundFile("Interface\\AddOns\\MageNuggets\\Sounds\\"..MageNuggets.miSound2)
            end
            mirrorImageTime = 40;
            MageNugMI_Frame_MIText1:SetText(" "..mirrorImageTime)
            MageNugMI_Frame_MiBar:SetValue(mirrorImageTime)
            MageNugMI_Frame:Show();
        end
    elseif (arg == 10060) then
        if (destName ~= UnitName("player")) then
            if (MageNuggets.powerInfToggle == true) then
                SendChatMessage(MageNuggets.powerinfNotify, "WHISPER", nil, destName);
            end
        end
    elseif (arg == 33206) then
        if (destName ~= UnitName("player")) then
            if (MageNuggets.painSupToggle == true) then
                SendChatMessage(MageNuggets.painSupNotify, "WHISPER", nil, destName);
            end
        end
    elseif (arg == 47788) then
        if (destName ~= UnitName("player")) then
            if (MageNuggets.gspiritToggle == true) then
                SendChatMessage(MageNuggets.gspiritNotify, "WHISPER", nil, destName);
            end
        end
    elseif (arg == 130) then
        if (destName ~= UnitName("player")) then
            if (MageNuggets.msgToggle == true) then
                local sfRandomNum = math.random(1,3)
                if(sfRandomNum == 1) then
                    SendChatMessage(MageNuggets.slowfallMsg, "WHISPER", nil, destName);
                end
                if(sfRandomNum == 2) then
                    SendChatMessage(MageNuggets.slowfallMsg2, "WHISPER", nil, destName);
                end
                if(sfRandomNum == 3) then
                    SendChatMessage(MageNuggets.slowfallMsg3, "WHISPER", nil, destName);
                end
            end
        end
    elseif ((arg == 110478) or (arg == 110479) or (arg == 110483) or (arg == 110482) or (arg == 110484) or (arg == 110485)
            or (arg == 110486) or (arg == 110488) or (arg == 110490) or (arg == 110491)) then -- symbiosis
        if (destName ~= UnitName("player")) then
            if (MageNuggets.symbiosisnToggle == true) then
                local symRandomNum = math.random(1,3)
                if(symRandomNum == 1) then
                    SendChatMessage(MageNuggets.symbiosisNotify, "WHISPER", nil, destName);
                end
                if(symRandomNum == 2) then
                    SendChatMessage(MageNuggets.symbiosisNotify2, "WHISPER", nil, destName);
                end
                if(symRandomNum == 3) then
                    SendChatMessage(MageNuggets.symbiosisNotify3, "WHISPER", nil, destName);
                end
            end
        end
    elseif (MageNuggets.polyToggle == true) then
        if (arg == 9484) then -- shackle
        _, _, _, _, _, _, polyExpTime, unitCaster, _, _, _ = UnitAura("target", shackleId, nil,"PLAYER|HARMFUL")
            if (polyExpTime ~= nil) then
                polyTimer = RoundZero(polyExpTime - GetTime());
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Shackle"..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\spell_nature_slow");
                MageNugPolyFrame:Show();
            else
                polyTimer = 50;
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Shackle"..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\spell_nature_slow");
                MageNugPolyFrame:Show();
            end
        elseif (arg == 2637) then -- hibernate
            _, _, _, _, _, _, polyExpTime, unitCaster, _, _, _ = UnitAura("target", polyPigId, nil,"PLAYER|HARMFUL")
            if (polyExpTime ~= nil) then
                polyTimer = RoundZero(polyExpTime - GetTime());
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Hibernate"..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\spell_nature_sleep");
                MageNugPolyFrame:Show();
            else
                polyTimer = 40;
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Hibernate"..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\spell_nature_sleep");
                MageNugPolyFrame:Show();
            end

        elseif (arg == 76780) then -- bind elemental
            _, _, _, _, _, _, polyExpTime, unitCaster, _, _, _ = UnitAura("target", polyPigId, nil,"PLAYER|HARMFUL")
            if (polyExpTime ~= nil) then
                polyTimer = RoundZero(polyExpTime - GetTime());
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Bind"..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\spell_shaman_bindelemental");
                MageNugPolyFrame:Show();
            else
                polyTimer = 50;
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Bind"..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\spell_shaman_bindelemental");
                MageNugPolyFrame:Show();
            end
        elseif (arg == 115078) then -- paralysis
            _, _, _, _, _, _, polyExpTime, unitCaster, _, _, _ = UnitAura("target", paralysisId, nil,"PLAYER|HARMFUL")
            if (polyExpTime ~= nil) then
                polyTimer = RoundZero(polyExpTime - GetTime());
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Paralysis"..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\ability_monk_paralysis");
                MageNugPolyFrame:Show();
            else
                polyTimer = 50;
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Paralysis"..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\ability_monk_paralysis");
                MageNugPolyFrame:Show();
            end

        elseif (arg == 51514) then -- HEX
            _, _, _, _, _, _, polyExpTime, unitCaster, _, _, _ = UnitAura("target", polyPigId, nil,"PLAYER|HARMFUL")
            if (polyExpTime ~= nil) then
                polyTimer = RoundZero(polyExpTime - GetTime());
                MageNugPolyFrameText:SetText("|cffFFFFFF".."HEX"..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\spell_shaman_hex");
                MageNugPolyFrame:Show();
            else
                polyTimer = 60;
                MageNugPolyFrameText:SetText("|cffFFFFFF".."HEX"..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\spell_shaman_hex");
                MageNugPolyFrame:Show();
            end
        elseif (arg == 28272) then -- pig
            _, _, _, _, _, _, polyExpTime, unitCaster, _, _, _ = UnitAura("target", polyPigId, nil,"PLAYER|HARMFUL")
            if (polyExpTime ~= nil) then
                polyTimer = RoundZero(polyExpTime - GetTime());
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\Spell_magic_polymorphpig");
                MageNugPolyFrame:Show();
            else
                polyTimer = 50;
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\Spell_magic_polymorphpig");
                MageNugPolyFrame:Show();
            end
        elseif (arg == 61305) then -- cat
            _, _, _, _, _, _, polyExpTime, unitCaster, _, _, _ = UnitAura("target", polyCatId, nil,"PLAYER|HARMFUL")
            if (polyExpTime ~= nil) then
                polyTimer = RoundZero(polyExpTime - GetTime());
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\Achievement_halloween_cat_01");
                MageNugPolyFrame:Show();
            else
                polyTimer = 50;
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\Achievement_halloween_cat_01");
                MageNugPolyFrame:Show();
            end
        elseif (arg == 61721) then -- rabbit
            _, _, _, _, _, _, polyExpTime, unitCaster, _, _, _ = UnitAura("target", polyRabbitId, nil,"PLAYER|HARMFUL")
            if (polyExpTime ~= nil) then
                polyTimer = RoundZero(polyExpTime - GetTime());
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\Spell_magic_polymorphrabbit");
                MageNugPolyFrame:Show();
            else
                polyTimer = 50;
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\Spell_magic_polymorphrabbit");
                MageNugPolyFrame:Show();
            end
        elseif (arg == 28271) then -- turtle
            _, _, _, _, _, _, polyExpTime, unitCaster, _, _, _ = UnitAura("target", polyTurtleId, nil,"PLAYER|HARMFUL")
            if (polyExpTime ~= nil) then
                polyTimer = RoundZero(polyExpTime - GetTime());
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\Ability_hunter_pet_turtle");
                MageNugPolyFrame:Show();
            else
                polyTimer = 50;
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\Ability_hunter_pet_turtle");
                MageNugPolyFrame:Show();
            end
        elseif (arg == 126819) then -- porcupine
            _, _, _, _, _, _, polyExpTime, unitCaster, _, _, _ = UnitAura("target", polyTurtleId, nil,"PLAYER|HARMFUL")
            if (polyExpTime ~= nil) then
                polyTimer = RoundZero(polyExpTime - GetTime());
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\inv_pet_porcupine");
                MageNugPolyFrame:Show();
            else
                polyTimer = 50;
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\inv_pet_porcupine");
                MageNugPolyFrame:Show();
            end
        elseif (arg == 161354) then -- monkey
            _, _, _, _, _, _, polyExpTime, unitCaster, _, _, _ = UnitAura("target", polyTurtleId, nil,"PLAYER|HARMFUL")
            if (polyExpTime ~= nil) then
                polyTimer = RoundZero(polyExpTime - GetTime());
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\ability_hunter_aspectofthemonkey");
                MageNugPolyFrame:Show();
            else
                polyTimer = 50;
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\ability_hunter_aspectofthemonkey");
                MageNugPolyFrame:Show();
            end
        elseif (arg == 118)  then  --sheep
            _, _, _, _, _, _, polyExpTime, unitCaster, _, _, _ = UnitAura("target", polySheepId, nil,"PLAYER|HARMFUL")
            if (polyExpTime ~= nil) then
                polyTimer = RoundZero(polyExpTime - GetTime());
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\Spell_nature_polymorph");
                MageNugPolyFrame:Show();
            else
                polyTimer = 50;
                MageNugPolyFrameText:SetText("|cffFFFFFF".."Polymorph"..":\n|cffFFFFFF "..destName);
                MageNugPolyFrameTimerText:SetText(polyTimer);
                MageNugPolyFrame_Bar:SetMinMaxValues(0,polyTimer);
                MageNugPolyFrame_Bar:SetValue(polyTimer);
                MageNugPolyFrameTexture:SetTexture("Interface\\Icons\\Spell_nature_polymorph");
                MageNugPolyFrame:Show();
            end
        end
    end
end

function RoundCrit(critNum)
    return math.floor(critNum*math.pow(10,2)+0.5) / math.pow(10,2)
end

function RoundThree(critNum)
    return math.floor(critNum*math.pow(10,3)+0.5) / math.pow(10,3)
end

function RoundOne(inputNum)
    return math.floor(inputNum*math.pow(10,1)+0.5) / math.pow(10,1)
end

function RoundZero(inputNum)
    return math.floor(inputNum*math.pow(10,0)+0.5) / math.pow(10,0)
end


----------------------------------------------------------------------------------------
--                              Moonkin                                               --
----------------------------------------------------------------------------------------

function MageNuggetsMoonkin_OnUpdate(self, elapsed)
 self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 0.1) then
        barpower = UnitPower("player", 8);
        local stackCount = "";
        local i = 1;
        local empowered = false;
        local buffName, rank, _, count, _, _, expirationTime, _, _, _, spellId = UnitAura("player", i, "HELPFUL");
        while buffName do
            if(spellId == 164545) or (spellId == 164547) then
                empowered = true;
                stackCount = count;
            end
            i = i + 1;
            buffName, rank, _, count, _, _, expirationTime, _, _, _, spellId = UnitAura("player", i, "HELPFUL");
        end

        if(empowered == false or stackCount < 1)then
            MageNugMoonkin_Frame_Text2:SetText("")
        else
            MageNugMoonkin_Frame_Text2:SetText(stackCount)
        end

        if(barpower < 0) then
            MageNugMoonkin_Frame_Texture:SetTexture("Interface\\Icons\\spell_arcane_starfire");
            MageNugMoonkin_Frame_Bar:SetStatusBarColor(0, 0, 1)
            if(barpower < 0) then
                MageNugMoonkin_Frame_Text:SetText("|cffFFFFFFLunar "..(barpower * -1));
            else
                MageNugMoonkin_Frame_Text:SetText("|cffFFFFFFLunar "..barpower);
            end
            MageNugMoonkin_Frame_Bar:SetStatusBarColor(0, 0, 0.8)
            MageNugMoonkin_Frame_Bar:SetValue(barpower * -1);
        else
            MageNugMoonkin_Frame_Texture:SetTexture("Interface\\Icons\\spell_nature_wrathv2");
            MageNugMoonkin_Frame_Bar:SetStatusBarColor(1, 0.5, 0)
            if(barpower < 0) then
                MageNugMoonkin_Frame_Text:SetText("|cffFFFFFFSolar "..(barpower * -1));
            else
                MageNugMoonkin_Frame_Text:SetText("|cffFFFFFFSolar "..barpower);
            end
            MageNugMoonkin_Frame_Bar:SetStatusBarColor(1, 0.5, 0)
            MageNugMoonkin_Frame_Bar:SetValue(barpower);
        end
    self.TimeSinceLastUpdate = 0;
    end
end


function MageNugMoonSize()
    local tempInt = MageNugMoonkinOptionFrame_Slider:GetValue()

    if not MageNugMoonkinOptionFrame_Slider._onsetting then
        MageNugMoonkinOptionFrame_Slider._onsetting = true
        MageNugMoonkinOptionFrame_Slider:SetValue(MageNugMoonkinOptionFrame_Slider:GetValue())
        tempInt = MageNugMoonkinOptionFrame_Slider:GetValue()
        MageNugMoonkinOptionFrame_Slider._onsetting = false
    else return end

    if (tempInt == 0) then
        MageNugMoonkin_Frame:SetScale(0.7);
        MNmoonFire_Frame:SetScale(0.7);
        MNinsectSwarm_Frame:SetScale(0.7);
        MNstarSurge_Frame:SetScale(0.7);
        MageNuggets.moonkinSize = 0;
    elseif (tempInt == 1) then
       MageNugMoonkin_Frame:SetScale(0.8);
       MNmoonFire_Frame:SetScale(0.8);
       MNinsectSwarm_Frame:SetScale(0.8);
       MNstarSurge_Frame:SetScale(0.8);
       MageNuggets.moonkinSize = 1;
    elseif (tempInt == 2) then
        MageNugMoonkin_Frame:SetScale(0.9);
        MNmoonFire_Frame:SetScale(0.9);
        MNinsectSwarm_Frame:SetScale(0.9);
        MNstarSurge_Frame:SetScale(0.9);
        MageNuggets.moonkinSize = 2;
    elseif (tempInt == 3) then
        MageNugMoonkin_Frame:SetScale(1.0);
        MNmoonFire_Frame:SetScale(1.0);
        MNinsectSwarm_Frame:SetScale(1.0);
        MNstarSurge_Frame:SetScale(1.0);
        MageNuggets.moonkinSize = 3;
    elseif (tempInt == 4) then
        MageNugMoonkin_Frame:SetScale(1.1);
        MNmoonFire_Frame:SetScale(1.1);
        MNinsectSwarm_Frame:SetScale(1.1);
        MNstarSurge_Frame:SetScale(1.1);
        MageNuggets.moonkinSize = 4;
    elseif (tempInt == 5) then
        MageNugMoonkin_Frame:SetScale(1.2);
        MNmoonFire_Frame:SetScale(1.2);
        MNinsectSwarm_Frame:SetScale(1.2);
        MNstarSurge_Frame:SetScale(1.2);
        MageNuggets.moonkinSize = 5;
    elseif (tempInt == 6) then
        MageNugMoonkin_Frame:SetScale(1.4);
        MNmoonFire_Frame:SetScale(1.4);
        MNinsectSwarm_Frame:SetScale(1.4);
        MNstarSurge_Frame:SetScale(1.4);
        MageNuggets.moonkinSize =  6;
    elseif (tempInt == 7) then
        MageNugMoonkin_Frame:SetScale(1.7);
        MNmoonFire_Frame:SetScale(1.7);
        MNinsectSwarm_Frame:SetScale(1.7);
        MNstarSurge_Frame:SetScale(1.7);
        MageNuggets.moonkinSize =  7;
    elseif (tempInt == 8) then
        MageNugMoonkin_Frame:SetScale(2.0);
        MNmoonFire_Frame:SetScale(2.0);
        MNinsectSwarm_Frame:SetScale(2.0);
        MNstarSurge_Frame:SetScale(2.0);
        MageNuggets.moonkinSize =  8;
    elseif (tempInt == 9) then
        MageNugMoonkin_Frame:SetScale(2.2);
        MNmoonFire_Frame:SetScale(2.2);
        MNinsectSwarm_Frame:SetScale(2.2);
        MNstarSurge_Frame:SetScale(2.2);
        MageNuggets.moonkinSize =  9;
    elseif (tempInt == 10) then
        MNmoonFire_Frame:SetScale(2.7);
        MNinsectSwarm_Frame:SetScale(2.7);
        MNstarSurge_Frame:SetScale(2.7);
        MageNugMoonkin_Frame:SetScale(2.7);
        MageNuggets.moonkinSize =  10;
    end
end

function MNmoonkinCombatToggle()
    local isChecked = MageNugMoonkinOptionFrame_CheckButton1:GetChecked();
    if (isChecked == true) then
        MageNuggets.moonkinCombat = true;
        MageNugMoonkin_Frame:Hide();
        MNmoonFire_Frame:Hide();
        MNinsectSwarm_Frame:Hide();
        MNstarSurge_Frame:Hide();
    else
        MageNuggets.moonkinCombat = false;
        MageNugMoonkin_Frame:Show();
        MNmoonFire_Frame:Show();
        MNinsectSwarm_Frame:Show();
        MNstarSurge_Frame:Show();
    end

end

function MNmoonkinToggle()
    local isChecked = MageNugMoonkinOptionFrame_CheckButton:GetChecked();
    if (isChecked == true) then
        MageNuggets.moonkinTog = true;
        MageNugMoonkin_Frame:Hide();
        MNmoonFire_Frame:Hide();
        MNinsectSwarm_Frame:Hide();
        MNstarSurge_Frame:Hide();
    else
        MageNuggets.moonkinTog = false;
        if (MageNuggets.moonkinCombat == false) then
            MageNugMoonkin_Frame:Show();
            MNmoonFire_Frame:Show();
            MNinsectSwarm_Frame:Show();
            MNstarSurge_Frame:Show();
        end
    end
end

function TreantSoundToggle()
    local isChecked = MageNugMoonkinOptionFrame_CheckButton2:GetChecked();
    if (isChecked == true) then
        MageNuggets.treantSoundTog = true;
    else
        MageNuggets.treantSoundTog = false;
    end
end

function MNmoonkinCombatTextToggle()
    local isChecked = MageNugMoonkinOptionFrame_CheckButton3:GetChecked();
    if (isChecked == true) then
        MageNuggets.moonkinCombatText = true;
    else
        MageNuggets.moonkinCombatText = false;
    end
end

function MNmoonkinAnchorToggle()
    local isChecked = MageNugMoonkinOptionFrame_CheckButtonAnchor:GetChecked();
    if (isChecked == true) then
        MageNuggets.moonkinAnchorTog = true;
        MNmoonFire_Frame:EnableMouse(false);
        MNmoonFire_Frame:ClearAllPoints();
        MNmoonFire_Frame:SetPoint("CENTER", MageNugMoonkin_Frame, "CENTER", -2, 16);
        MNinsectSwarm_Frame:EnableMouse(false);
        MNinsectSwarm_Frame:ClearAllPoints();
        MNinsectSwarm_Frame:SetPoint("CENTER", MageNugMoonkin_Frame, "CENTER", 24, 16);
        MNstarSurge_Frame:ClearAllPoints();
        MNstarSurge_Frame:EnableMouse(false);
        MNstarSurge_Frame:SetPoint("CENTER", MageNugMoonkin_Frame, "CENTER", 50, 16);
    else
        MageNuggets.moonkinAnchorTog = false;
        MNmoonFire_Frame:EnableMouse(true);
        MNinsectSwarm_Frame:EnableMouse(true);
        MNstarSurge_Frame:EnableMouse(true);
    end
end

function MNmoonkinminimalToggle()
    local isChecked = MageNugMoonkinOptionFrame_CheckButtonMin:GetChecked();
    if (isChecked == true) then
        MageNuggets.moonkinMin = true;
        MageNugMoonkin_Frame_Texture:Hide();
    else
        MageNuggets.moonkinMin = false;
        MageNugMoonkin_Frame_Texture:Show();
    end
end

function MNmoonkinBoxToggle()
    local isChecked = MageNugMoonkinOptionFrame_CheckButton0:GetChecked();
    if (isChecked == true) then
        MageNuggets.moonkinBoxTog = true;
    else
        MageNuggets.moonkinBoxTog = false;
    end
end


function MNmoonFire_OnUpdate(self, elapsed)
    self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 0.1) then
        moonfireTime = 0;
        local i = 1;
        local buffName, rank, icon, count, _, duration, expirationTime, unitCaster, _, _, spellId  = UnitAura("target", i, "PLAYER|HARMFUL");
        while buffName do
            if(spellId == 164812) then
                moonfireTime = RoundOne(expirationTime - GetTime());
            end
            i = i + 1;
            buffName, rank, icon, count, _, duration, expirationTime, unitCaster, _, _, spellId  = UnitAura("target", i, "PLAYER|HARMFUL");
        end
        if(moonfireTime <= 0.5) then
            MNmoonFire_FrameText:SetText(" ")
            MNmoonFire_Frame:SetAlpha(1);
        else
            MNmoonFire_FrameText:SetText(moonfireTime);
            MNmoonFire_Frame:SetAlpha(0.5);
        end
        self.TimeSinceLastUpdate = 0;
    end
end

function MNinsectSwarm_OnUpdate(self, elapsed)
    self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 0.1) then
        insectTime = 0;
        local i = 1;
        local buffName, rank, icon, count, _, duration, expirationTime, unitCaster, _, _, spellId  = UnitAura("target", i, "PLAYER|HARMFUL");
        while buffName do
            if(spellId == 164815) then
                insectTime = RoundOne(expirationTime - GetTime());
            end
            i = i + 1;
            buffName, rank, icon, count, _, duration, expirationTime, unitCaster, _, _, spellId  = UnitAura("target", i, "PLAYER|HARMFUL");
        end
        if(insectTime <= 0.5) then
            MNinsectSwarm_FrameText:SetText(" ")
            MNinsectSwarm_Frame:SetAlpha(1);
         else
            MNinsectSwarm_FrameText:SetText(insectTime);
            MNinsectSwarm_Frame:SetAlpha(0.5);
        end
        self.TimeSinceLastUpdate = 0;
    end
end

function MNstarSurge_OnUpdate(self, elapsed)
    self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 0.1) then
        local ssstart, ssduration, ssenabled = GetSpellCooldown(78674);
        starsurgeTime = RoundOne(ssstart + ssduration - GetTime())
        if (starsurgeTime > 1.5) then
            MNstarSurge_FrameText:SetText(starsurgeTime)
            MNstarSurge_Frame:SetAlpha(0.5);
        elseif (starsurgeTime > 1.0) then
            MNstarSurge_FrameText:SetText("gcd")
        else
            MNstarSurge_FrameText:SetText(" ")
            MNstarSurge_Frame:SetAlpha(1);
        end
        self.TimeSinceLastUpdate = 0;
    end
end

function MNanchorMoonkinFrames()
    MNmoonFire_Frame:ClearAllPoints();
    MNmoonFire_Frame:SetPoint("CENTER", MageNugMoonkin_Frame, "CENTER", -2, 16);
    MNinsectSwarm_Frame:ClearAllPoints();
    MNinsectSwarm_Frame:SetPoint("CENTER", MageNugMoonkin_Frame, "CENTER", 24, 16);
    MNstarSurge_Frame:ClearAllPoints();
    MNstarSurge_Frame:SetPoint("CENTER", MageNugMoonkin_Frame, "CENTER", 50, 16);
end


--============================================================================--
--                                  Nova Monitor
--============================================================================--
function isNovaSpeced()
    local specGroup = GetActiveSpecGroup();
    local talentID, name, texture, selected, available = GetTalentInfo(5,3,specGroup);
    return selected;
end

function getNovaTalentId()
    local specGroup = GetActiveSpecGroup();
    local talentID, name, texture, selected, available = GetTalentInfo(5,3,specGroup);
    return talentID;
end

function getNovaCooldown()
    local currentCharges, maxCharges, cooldownStart, cooldownDuration,novaId,cooldown;
    local talentId = getNovaTalentId();

    if(isNovaSpeced())then
        if(talentId == 21693)then -- ice nova
            MageNugNova_FrameTexture:SetTexture("Interface\\Icons\\spell_mage_icenova");
            novaId, _, _, _, _, _, _, _, _ = GetSpellInfo(157997);
            currentCharges, maxCharges, cooldownStart, cooldownDuration = GetSpellCharges(157997)
            cooldown = RoundOne(cooldownStart + cooldownDuration - GetTime())
        elseif(talentId == 19301)then -- supernova
            MageNugNova_FrameTexture:SetTexture("Interface\\Icons\\spell_mage_supernova");
            novaId, _, _, _, _, _, _, _, _ = GetSpellInfo(157980);
            currentCharges, maxCharges, cooldownStart, cooldownDuration = GetSpellCharges(157980)
            cooldown = RoundOne(cooldownStart + cooldownDuration - GetTime())
        elseif(talentId == 21692)then -- blast wave
            MageNugNova_FrameTexture:SetTexture("Interface\\Icons\\spell_holy_excorcism_02");
            novaId, _, _, _, _, _, _, _, _ = GetSpellInfo(157981);
            currentCharges, maxCharges, cooldownStart, cooldownDuration = GetSpellCharges(157981)
            cooldown = RoundOne(cooldownStart + cooldownDuration - GetTime())
        end
        MageNugNova_Frame_Text:SetText(currentCharges);
    end
    return cooldown;
end

function MNNova_OnUpdate(self, elapsed)
    self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
    if (self.TimeSinceLastUpdate > 0.1) then
        local cooldown = getNovaCooldown();
        if(cooldown == nil) or (cooldown <= 0) or (cooldown > 25)then
            cooldown = "";
            MageNugNova_Frame_Text2:SetText("");
            MageNugNova_Frame_Bar:SetValue(25);
        else
            MageNugNova_Frame_Text2:SetText(cooldown);
            MageNugNova_Frame_Bar:SetValue(cooldown);
        end
        self.TimeSinceLastUpdate = 0;
    end
end
-------------------------
