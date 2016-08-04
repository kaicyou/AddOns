

 mageNuggetsStatMonitor = {
    spellpower = true;
    attackpower = true;
    crit = true;
    haste = true;
    mastery = true;
    leech = true;
    versatility = true;
    spirit = true;
    manaregen = true;
    armor = true;
    spellpowerR = 1;
    spellpowerG = 1;
    spellpowerB = 1;
    spellpowerValueR = 1;
    spellpowerValueG = 1;
    spellpowerValueB = 1;
    attackpowerR = 1;
    attackpowerG = 1;
    attackpowerB = 1;
    attackpowerValueR = 1;
    attackpowerValueG = 1;
    attackpowerValueB = 1;
    critR = 1;
    critG = 1;
    critB = 1;
    critValueR = 1;
    critValueG = 1;
    critValueB = 1;
    hasteR = 1;
    hasteG = 1;
    hasteB = 1;
    hasteValueR = 1;
    hasteValueG = 1;
    hasteValueB = 1;
    masteryR = 1;
    masteryG = 1;
    masteryB = 1;
    masteryValueR = 1;
    masteryValueG = 1;
    masteryValueB = 1;
    versatilityR = 1;
    versatilityG = 1;
    versatilityB = 1;
    versatilityValueR = 1;
    versatilityValueG = 1;
    versatilityValueB = 1;
    leechR = 1;
    leechG = 1;
    leechB = 1;
    leechValueR = 1;
    leechValueG = 1;
    leechValueB = 1;
    spiritR = 1;
    spiritG = 1;
    spiritB = 1;
    spiritValueR = 1;
    spiritValueG = 1;
    spiritValueB = 1;
    manaregenR = 1;
    manaregenG = 1;
    manaregenB = 1;
    manaregenValueR = 1;
    manaregenValueG = 1;
    manaregenValueB = 1;
    armorR = 1;
    armorG = 1;
    armorB = 1;
    armorValueR = 1;
    armorValueG = 1;
    armorValueB = 1;
    spMonitorToggle = false;
    spCombatToggle = false;
    spMonitorSize = 3;
    lockFrames = false;
    backdropR = 0.0;
    backdropG = 0.0;
    backdropB = 0.0;
    backdropA = 0.0;
    borderStyle = 0;
    transColor = 0;
    statmon_point = "CENTER";
    statmon_relativePoint = "CENTER";
    statmon_xOfs = 0;
    statmon_yOfs = 0;
    clickthru = false;
    limitBreakToggle = false;
    hasteLimit = 0;
    baseSpellPower = 0;
}


function MNStatMonitorOptions_OnLoad(self)
    self:RegisterEvent("ADDON_LOADED")
    self:RegisterEvent("PLAYER_REGEN_DISABLED")
    self:RegisterEvent("PLAYER_REGEN_ENABLED")

    local MageNugStatMonitorOptions = CreateFrame("FRAME", "MageNugStatMonitorOptions", InterfaceOptionsFrame)
    MageNugStatMonitorOptions.name = "MN Stat Monitor"
    InterfaceOptions_AddCategory(MageNugStatMonitorOptions)
    MageNugStatMonitorOptions:SetPoint("TOPLEFT", InterfaceOptionsFrame, "BOTTOMRIGHT", 0, 0)
end

function MNStatMonitorOptions_OnEvent(this, event, ...)
    local argin1, argin2, argin3, argin4, _, argin6 = ...
    if (event == "ADDON_LOADED") then
        if(argin1 == "MageNuggets_StatMonitor") then
            loadMNStatMonitorOptionsFrames();
            loadStatMonitorColors();
            mageNuggetsStatMonitor.baseSpellPower = (GetSpellBonusDamage(3) * 1.20);

            DEFAULT_CHAT_FRAME:AddMessage("|cff00BFFFMage|cff00FF00Nuggets|cffffffff Stat Monitor loaded!")
            MageNugSP_RightClickFrameText:SetText("|cff00BFFFMage |cff00FF00Nuggets|cffffffff Stat Monitor");
            if(mageNuggetsStatMonitor.spCombatToggle == true) then
                MageNugSP_Frame:Hide();
            else
                MageNugSP_Frame:Show();
            end
        end
    elseif (event == "PLAYER_REGEN_ENABLED") then
        if(mageNuggetsStatMonitor.spCombatToggle == true) then
            MageNugSP_Frame:Hide();
        end
    elseif (event == "PLAYER_REGEN_DISABLED") then
        MageNugSP_Frame:Show();
    end
end


function loadMNStatMonitorOptionsFrames()
    if (mageNuggetsStatMonitor.spCombatToggle == nil)then
        mageNuggetsStatMonitor.spCombatToggle = false;
    end
    if (mageNuggetsStatMonitor.spCombatToggle == true) then
        MageNugStatMonOptionMenu_CheckButton0:SetChecked(true);
    else
        MageNugStatMonOptionMenu_CheckButton0:SetChecked(false);
    end
    if (mageNuggetsStatMonitor.limitBreakToggle == nil)then
        mageNuggetsStatMonitor.limitBreakToggle = false;
    end
    if (mageNuggetsStatMonitor.limitBreakToggle == true) then
        MageNugStatMonOptionMenu_CheckButtonLimitBreakFrame:SetChecked(true);
    else
        MageNugStatMonOptionMenu_CheckButtonLimitBreakFrame:SetChecked(false);
    end
    if (mageNuggetsStatMonitor.spMonitorToggle == nil) then
        mageNuggetsStatMonitor.spMonitorToggle = false;
    end
    if (mageNuggetsStatMonitor.spMonitorSize == nil) then
        MageNugStatMonOptionMenu_SPSizeSlider:SetValue(3)
    else
        MageNugStatMonOptionMenu_SPSizeSlider:SetValue(mageNuggetsStatMonitor.spMonitorSize)
    end
    if(mageNuggetsStatMonitor.borderStyle == nil) then
        MageNugStatMonOptionFrame_BorderSlider:SetValue(0);
    else
        MageNugStatMonOptionFrame_BorderSlider:SetValue(mageNuggetsStatMonitor.borderStyle);
    end
    if(mageNuggetsStatMonitor.transColor == nil) then
        MageNugStatMonOptionFrame_TransparencySlider:SetValue(0);
    else
        MageNugStatMonOptionFrame_TransparencySlider:SetValue(mageNuggetsStatMonitor.transColor);
    end
    if (mageNuggetsStatMonitor.lockFrames == nil) then
        mageNuggetsStatMonitor.lockFrames = false;
    end
    if (mageNuggetsStatMonitor.lockFrames == true) then
        MageNugStatMonOptionMenu_CheckButtonLockFrame:SetChecked(true);
    else
        MageNugStatMonOptionMenu_CheckButtonLockFrame:SetChecked(false);
    end

    if (mageNuggetsStatMonitor.clickthru == nil) then
        mageNuggetsStatMonitor.clickthru = false;
    end
    if (mageNuggetsStatMonitor.clickthru == true) then
        MageNugStatMonOptionMenu_CheckButtonClickThroughFrame:SetChecked(true);
        MageNugSP_Frame:EnableMouse(false);
    else
        MageNugStatMonOptionMenu_CheckButtonClickThroughFrame:SetChecked(false);
        MageNugSP_Frame:EnableMouse(true);
    end

end

function MNStatMonitorLockFramesToggle()
    local isChecked = MageNugStatMonOptionMenu_CheckButtonLockFrame:GetChecked();
    if (isChecked == true) then
        mageNuggetsStatMonitor.lockFrames = true;
    else
        mageNuggetsStatMonitor.lockFrames = false;
    end
end

function MNstatMonCombat()
    local statChecked = MageNugStatMonOptionMenu_CheckButton0:GetChecked();
    if (statChecked == true) then
        mageNuggetsStatMonitor.spCombatToggle = true;
        MageNugSP_Frame:Hide();
    else
        mageNuggetsStatMonitor.spCombatToggle = false;
        MageNugSP_Frame:Show();
    end
end

function MNStatMonitorClickThrough()
    local isChecked = MageNugStatMonOptionMenu_CheckButtonClickThroughFrame:GetChecked();
    if (isChecked == true) then
        mageNuggetsStatMonitor.clickthru = true;
        MageNugSP_Frame:EnableMouse(false);
    else
        mageNuggetsStatMonitor.clickthru = false;
        MageNugSP_Frame:EnableMouse(true);
    end
end

function MNStatMonitorLimitBreakToggle()
    local isChecked = MageNugStatMonOptionMenu_CheckButtonLimitBreakFrame:GetChecked();
    if (isChecked == true) then
        mageNuggetsStatMonitor.limitBreakToggle = true;
    else
        mageNuggetsStatMonitor.limitBreakToggle = false;
    end
end

function  MageNugSpMonitorSize()
    local tempInt = MageNugStatMonOptionMenu_SPSizeSlider:GetValue()

    if not MageNugStatMonOptionMenu_SPSizeSlider._onsetting then
        MageNugStatMonOptionMenu_SPSizeSlider._onsetting = true;
        MageNugStatMonOptionMenu_SPSizeSlider:SetValue(MageNugStatMonOptionMenu_SPSizeSlider:GetValue());
        tempInt = MageNugStatMonOptionMenu_SPSizeSlider:GetValue();
        MageNugStatMonOptionMenu_SPSizeSlider._onsetting = false;
    else return end

    if (tempInt == 0) then
        MageNugSP_Frame:SetScale(0.7);
        mageNuggetsStatMonitor.spMonitorSize = 0;
    elseif (tempInt == 1) then
        MageNugSP_Frame:SetScale(0.8);
        mageNuggetsStatMonitor.spMonitorSize = 1;
    elseif (tempInt == 2) then
        MageNugSP_Frame:SetScale(0.9);
        mageNuggetsStatMonitor.spMonitorSize = 2;
    elseif (tempInt == 3) then
        MageNugSP_Frame:SetScale(1.0);
        mageNuggetsStatMonitor.spMonitorSize = 3;
    elseif (tempInt == 4) then
        MageNugSP_Frame:SetScale(1.1);
        mageNuggetsStatMonitor.spMonitorSize = 4;
    elseif (tempInt == 5) then
        MageNugSP_Frame:SetScale(1.2);
        mageNuggetsStatMonitor.spMonitorSize = 5;
    elseif (tempInt == 6) then
        MageNugSP_Frame:SetScale(1.3);
        mageNuggetsStatMonitor.spMonitorSize = 6;
    elseif (tempInt == 7) then
        MageNugSP_Frame:SetScale(1.4);
        mageNuggetsStatMonitor.spMonitorSize = 7;
    elseif (tempInt == 8) then
        MageNugSP_Frame:SetScale(1.5);
        mageNuggetsStatMonitor.spMonitorSize = 8;
    elseif (tempInt == 9) then
        MageNugSP_Frame:SetScale(1.6);
        mageNuggetsStatMonitor.spMonitorSize = 9;
    elseif (tempInt == 10) then
        MageNugSP_Frame:SetScale(1.7);
        mageNuggetsStatMonitor.spMonitorSize = 10;
    elseif (tempInt == 11) then
        MageNugSP_Frame:SetScale(1.8);
        mageNuggetsStatMonitor.spMonitorSize = 11;
    elseif (tempInt == 12) then
        MageNugSP_Frame:SetScale(1.9);
        mageNuggetsStatMonitor.spMonitorSize = 12;
    elseif (tempInt == 13) then
        MageNugSP_Frame:SetScale(2.0);
        mageNuggetsStatMonitor.spMonitorSize = 13;
    elseif (tempInt == 14) then
        MageNugSP_Frame:SetScale(2.1);
        mageNuggetsStatMonitor.spMonitorSize = 14;
    elseif (tempInt == 15) then
        MageNugSP_Frame:SetScale(2.2);
        mageNuggetsStatMonitor.spMonitorSize = 15;
    elseif (tempInt == 16) then
        MageNugSP_Frame:SetScale(2.4);
        mageNuggetsStatMonitor.spMonitorSize = 16;
    elseif (tempInt == 17) then
        MageNugSP_Frame:SetScale(2.6);
        mageNuggetsStatMonitor.spMonitorSize = 17;
    elseif (tempInt == 18) then
        MageNugSP_Frame:SetScale(2.8);
        mageNuggetsStatMonitor.spMonitorSize = 18;
    elseif (tempInt == 19) then
        MageNugSP_Frame:SetScale(3.0);
        mageNuggetsStatMonitor.spMonitorSize = 19;
    end
end


function loadStatMonitorColors()
    if(mageNuggetsStatMonitor.spellpowerR == nil)then
        mageNuggetsStatMonitor.spellpowerR = 1;
    end
    if(mageNuggetsStatMonitor.spellpowerG == nil)then
        mageNuggetsStatMonitor.spellpowerG = 1;
    end
    if(mageNuggetsStatMonitor.spellpowerB == nil)then
        mageNuggetsStatMonitor.spellpowerB = 1;
    end
    if(mageNuggetsStatMonitor.spellpowerValueR == nil)then
        mageNuggetsStatMonitor.spellpowerValueR = 1;
    end
    if(mageNuggetsStatMonitor.spellpowerValueG == nil)then
        mageNuggetsStatMonitor.spellpowerValueG = 1;
    end
    if(mageNuggetsStatMonitor.spellpowerValueB == nil)then
        mageNuggetsStatMonitor.spellpowerValueB = 1;
    end
    if(mageNuggetsStatMonitor.attackpowerR == nil)then
        mageNuggetsStatMonitor.attackpowerR = 1;
    end
    if(mageNuggetsStatMonitor.attackpowerG == nil)then
        mageNuggetsStatMonitor.attackpowerG = 1;
    end
    if(mageNuggetsStatMonitor.attackpowerB == nil)then
        mageNuggetsStatMonitor.attackpowerB = 1;
    end
    if(mageNuggetsStatMonitor.attackpowerValueR == nil)then
        mageNuggetsStatMonitor.attackpowerValueR = 1;
    end
    if(mageNuggetsStatMonitor.attackpowerValueG == nil)then
        mageNuggetsStatMonitor.attackpowerValueG = 1;
    end
    if(mageNuggetsStatMonitor.attackpowerValueB == nil)then
        mageNuggetsStatMonitor.attackpowerValueB = 1;
    end
    if(mageNuggetsStatMonitor.critR == nil)then
        mageNuggetsStatMonitor.critR = 1;
    end
    if(mageNuggetsStatMonitor.critG == nil)then
        mageNuggetsStatMonitor.critG = 1;
    end
    if(mageNuggetsStatMonitor.critB == nil)then
        mageNuggetsStatMonitor.critB = 1;
    end
    if(mageNuggetsStatMonitor.critValueR == nil)then
        mageNuggetsStatMonitor.critValueR = 1;
    end
    if(mageNuggetsStatMonitor.critValueG == nil)then
        mageNuggetsStatMonitor.critValueG = 1;
    end
    if(mageNuggetsStatMonitor.critValueB == nil)then
        mageNuggetsStatMonitor.critValueB = 1;
    end
    if(mageNuggetsStatMonitor.hasteR == nil)then
        mageNuggetsStatMonitor.hasteR = 1;
    end
    if(mageNuggetsStatMonitor.hasteG == nil)then
        mageNuggetsStatMonitor.hasteG = 1;
    end
    if(mageNuggetsStatMonitor.hasteB == nil)then
        mageNuggetsStatMonitor.hasteB = 1;
    end
    if(mageNuggetsStatMonitor.hasteValueR == nil)then
        mageNuggetsStatMonitor.hasteValueR = 1;
    end
    if(mageNuggetsStatMonitor.hasteValueG == nil)then
        mageNuggetsStatMonitor.hasteValueG = 1;
    end
    if(mageNuggetsStatMonitor.hasteValueB == nil)then
        mageNuggetsStatMonitor.hasteValueB = 1;
    end
    if(mageNuggetsStatMonitor.masteryR == nil)then
        mageNuggetsStatMonitor.masteryR = 1;
    end
    if(mageNuggetsStatMonitor.masteryG == nil)then
        mageNuggetsStatMonitor.masteryG = 1;
    end
    if(mageNuggetsStatMonitor.masteryB == nil)then
        mageNuggetsStatMonitor.masteryB = 1;
    end
    if(mageNuggetsStatMonitor.masteryValueR == nil)then
        mageNuggetsStatMonitor.masteryValueR = 1;
    end
    if(mageNuggetsStatMonitor.masteryValueG == nil)then
        mageNuggetsStatMonitor.masteryValueG = 1;
    end
    if(mageNuggetsStatMonitor.masteryValueB == nil)then
        mageNuggetsStatMonitor.masteryValueB = 1;
    end
    if(mageNuggetsStatMonitor.leechR == nil)then
        mageNuggetsStatMonitor.leechR = 1;
    end
    if(mageNuggetsStatMonitor.leechG == nil)then
        mageNuggetsStatMonitor.leechG = 1;
    end
    if(mageNuggetsStatMonitor.leechB == nil)then
        mageNuggetsStatMonitor.leechB = 1;
    end
    if(mageNuggetsStatMonitor.leechValueR == nil)then
        mageNuggetsStatMonitor.leechValueR = 1;
    end
    if(mageNuggetsStatMonitor.leechValueG == nil)then
        mageNuggetsStatMonitor.leechValueG = 1;
    end
    if(mageNuggetsStatMonitor.leechValueB == nil)then
        mageNuggetsStatMonitor.leechValueB = 1;
    end
    if(mageNuggetsStatMonitor.versatilityR == nil)then
        mageNuggetsStatMonitor.versatilityR = 1;
    end
    if(mageNuggetsStatMonitor.versatilityG == nil)then
        mageNuggetsStatMonitor.versatilityG = 1;
    end
    if(mageNuggetsStatMonitor.versatilityB == nil)then
        mageNuggetsStatMonitor.versatilityB = 1;
    end
    if(mageNuggetsStatMonitor.versatilityValueR == nil)then
        mageNuggetsStatMonitor.versatilityValueR = 1;
    end
    if(mageNuggetsStatMonitor.versatilityValueG == nil)then
        mageNuggetsStatMonitor.versatilityValueG = 1;
    end
    if(mageNuggetsStatMonitor.versatilityValueB == nil)then
        mageNuggetsStatMonitor.versatilityValueB = 1;
    end
    if(mageNuggetsStatMonitor.spiritR == nil)then
        mageNuggetsStatMonitor.spiritR = 1;
    end
    if(mageNuggetsStatMonitor.spiritG == nil)then
        mageNuggetsStatMonitor.spiritG = 1;
    end
    if(mageNuggetsStatMonitor.spiritB == nil)then
        mageNuggetsStatMonitor.spiritB = 1;
    end
    if(mageNuggetsStatMonitor.spiritValueR == nil)then
        mageNuggetsStatMonitor.spiritValueR = 1;
    end
    if(mageNuggetsStatMonitor.spiritValueG == nil)then
        mageNuggetsStatMonitor.spiritValueG = 1;
    end
    if(mageNuggetsStatMonitor.spiritValueB == nil)then
        mageNuggetsStatMonitor.spiritValueB = 1;
    end
    if(mageNuggetsStatMonitor.manaregenR == nil)then
        mageNuggetsStatMonitor.manaregenR = 1;
    end
    if(mageNuggetsStatMonitor.manaregenG == nil)then
        mageNuggetsStatMonitor.manaregenG = 1;
    end
    if(mageNuggetsStatMonitor.manaregenB == nil)then
        mageNuggetsStatMonitor.manaregenB = 1;
    end
    if(mageNuggetsStatMonitor.manaregenValueR == nil)then
        mageNuggetsStatMonitor.manaregenValueR = 1;
    end
    if(mageNuggetsStatMonitor.manaregenValueG == nil)then
        mageNuggetsStatMonitor.manaregenValueG = 1;
    end
    if(mageNuggetsStatMonitor.manaregenValueB == nil)then
        mageNuggetsStatMonitor.manaregenValueB = 1;
    end
    if(mageNuggetsStatMonitor.armorR == nil)then
        mageNuggetsStatMonitor.armorR = 1;
    end
    if(mageNuggetsStatMonitor.armorG == nil)then
        mageNuggetsStatMonitor.armorG = 1;
    end
    if(mageNuggetsStatMonitor.armorB == nil)then
        mageNuggetsStatMonitor.armorB = 1;
    end
    if(mageNuggetsStatMonitor.armorValueR == nil)then
        mageNuggetsStatMonitor.armorValueR = 1;
    end
    if(mageNuggetsStatMonitor.armorValueG == nil)then
        mageNuggetsStatMonitor.armorValueG = 1;
    end
    if(mageNuggetsStatMonitor.armorValueB == nil)then
        mageNuggetsStatMonitor.armorValueB = 1;
    end
end

local currentStatColor;
function setCurrentStatColor(index)
    currentStatColor = index;
end

function statMonitorColorSelect()
    if(currentStatColor == 1) then
        mageNuggetsStatMonitor.spellpowerR, mageNuggetsStatMonitor.spellpowerG, mageNuggetsStatMonitor.spellpowerB = MageNugSP_ColorPickerFrameColorSelect:GetColorRGB();
    elseif(currentStatColor == 2) then
        mageNuggetsStatMonitor.spellpowerValueR, mageNuggetsStatMonitor.spellpowerValueG, mageNuggetsStatMonitor.spellpowerValueB = MageNugSP_ColorPickerFrameColorSelect:GetColorRGB();
    elseif(currentStatColor == 3) then
        mageNuggetsStatMonitor.attackpowerR, mageNuggetsStatMonitor.attackpowerG, mageNuggetsStatMonitor.attackpowerB = MageNugSP_ColorPickerFrameColorSelect:GetColorRGB();
    elseif(currentStatColor == 4) then
        mageNuggetsStatMonitor.attackpowerValueR, mageNuggetsStatMonitor.attackpowerValueG, mageNuggetsStatMonitor.attackpowerValueB = MageNugSP_ColorPickerFrameColorSelect:GetColorRGB();
    elseif(currentStatColor == 5) then
        mageNuggetsStatMonitor.critR, mageNuggetsStatMonitor.critG, mageNuggetsStatMonitor.critB = MageNugSP_ColorPickerFrameColorSelect:GetColorRGB();
    elseif(currentStatColor == 6) then
        mageNuggetsStatMonitor.critValueR, mageNuggetsStatMonitor.critValueG, mageNuggetsStatMonitor.critValueB = MageNugSP_ColorPickerFrameColorSelect:GetColorRGB();
    elseif(currentStatColor == 7) then
        mageNuggetsStatMonitor.hasteR, mageNuggetsStatMonitor.hasteG, mageNuggetsStatMonitor.hasteB = MageNugSP_ColorPickerFrameColorSelect:GetColorRGB();
    elseif(currentStatColor == 8) then
        mageNuggetsStatMonitor.hasteValueR, mageNuggetsStatMonitor.hasteValueG, mageNuggetsStatMonitor.hasteValueB = MageNugSP_ColorPickerFrameColorSelect:GetColorRGB();
    elseif(currentStatColor == 9) then
        mageNuggetsStatMonitor.masteryR, mageNuggetsStatMonitor.masteryG, mageNuggetsStatMonitor.masteryB = MageNugSP_ColorPickerFrameColorSelect:GetColorRGB();
    elseif(currentStatColor == 10) then
       mageNuggetsStatMonitor.masteryValueR, mageNuggetsStatMonitor.masteryValueG, mageNuggetsStatMonitor.masteryValueB = MageNugSP_ColorPickerFrameColorSelect:GetColorRGB();
    elseif(currentStatColor == 13) then
        mageNuggetsStatMonitor.leechR, mageNuggetsStatMonitor.leechG, mageNuggetsStatMonitor.leechB = MageNugSP_ColorPickerFrameColorSelect:GetColorRGB();
    elseif(currentStatColor == 14) then
        mageNuggetsStatMonitor.leechValueR, mageNuggetsStatMonitor.leechValueG, mageNuggetsStatMonitor.leechValueB = MageNugSP_ColorPickerFrameColorSelect:GetColorRGB();
    elseif(currentStatColor == 15) then
        mageNuggetsStatMonitor.versatilityR, mageNuggetsStatMonitor.versatilityG, mageNuggetsStatMonitor.versatilityB = MageNugSP_ColorPickerFrameColorSelect:GetColorRGB();
    elseif(currentStatColor == 16) then
        mageNuggetsStatMonitor.versatilityValueR, mageNuggetsStatMonitor.versatilityValueG, mageNuggetsStatMonitor.versatilityValueB = MageNugSP_ColorPickerFrameColorSelect:GetColorRGB();
    elseif(currentStatColor == 17) then
        mageNuggetsStatMonitor.spiritR, mageNuggetsStatMonitor.spiritG, mageNuggetsStatMonitor.spiritB = MageNugSP_ColorPickerFrameColorSelect:GetColorRGB();
    elseif(currentStatColor == 18) then
        mageNuggetsStatMonitor.spiritValueR, mageNuggetsStatMonitor.spiritValueG, mageNuggetsStatMonitor.spiritValueB = MageNugSP_ColorPickerFrameColorSelect:GetColorRGB();
    elseif(currentStatColor == 19) then
        mageNuggetsStatMonitor.manaregenR, mageNuggetsStatMonitor.manaregenG, mageNuggetsStatMonitor.manaregenB = MageNugSP_ColorPickerFrameColorSelect:GetColorRGB();
    elseif(currentStatColor == 20) then
        mageNuggetsStatMonitor.manaregenValueR, mageNuggetsStatMonitor.manaregenValueG, mageNuggetsStatMonitor.manaregenValueB = MageNugSP_ColorPickerFrameColorSelect:GetColorRGB();
    elseif(currentStatColor == 21) then
        mageNuggetsStatMonitor.armorR, mageNuggetsStatMonitor.armorG, mageNuggetsStatMonitor.armorB = MageNugSP_ColorPickerFrameColorSelect:GetColorRGB();
    elseif(currentStatColor == 22) then
        mageNuggetsStatMonitor.armorValueR, mageNuggetsStatMonitor.armorValueG, mageNuggetsStatMonitor.armorValueB = MageNugSP_ColorPickerFrameColorSelect:GetColorRGB();
    end
    dressStatMonitorText();
end

function MageNugz_SaveFrame_Position()
    mageNuggetsStatMonitor.statmon_point, _, mageNuggetsStatMonitor.statmon_relativePoint, mageNuggetsStatMonitor.statmon_xOfs, mageNuggetsStatMonitor.statmon_yOfs = MageNugSP_Frame:GetPoint();
end


function MageNugz_SetFrame_Positions()
    MageNugSP_Frame:ClearAllPoints();
    MageNugSP_Frame:SetPoint(mageNuggetsStatMonitor.statmon_point, "UIParent", mageNuggetsStatMonitor.statmon_relativePoint, mageNuggetsStatMonitor.statmon_xOfs, mageNuggetsStatMonitor.statmon_yOfs);
end


function MNStatMonitorLockFrames(self)
    if (mageNuggetsStatMonitor.lockFrames == false)then
       self:StartMoving(); self.isMoving = true;
    end
end

function BorderTypeSlider()
    local tempInt = MageNugStatMonOptionFrame_BorderSlider:GetValue()
    tempInt = roundZero(tempInt);
    if (tempInt == 0) then
         MageNugSP_Frame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background",
                                    edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
                                    tile = true, tileSize = 16, edgeSize = 16,
                                    insets = { left = 4, right = 4, top = 4, bottom = 4 }});
        MageNugSP_Frame:SetBackdropColor(mageNuggetsStatMonitor.backdropR,mageNuggetsStatMonitor.backdropG,mageNuggetsStatMonitor.backdropB,mageNuggetsStatMonitor.backdropA)
        mageNuggetsStatMonitor.borderStyle = 0;
    elseif (tempInt == 1) then
         MageNugSP_Frame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background",
                                    edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
                                    tile = true, tileSize = 16, edgeSize = 8,
                                    insets = { left = 1, right = 1, top = 1, bottom = 1 }});
        MageNugSP_Frame:SetBackdropColor(mageNuggetsStatMonitor.backdropR,mageNuggetsStatMonitor.backdropG,mageNuggetsStatMonitor.backdropB,mageNuggetsStatMonitor.backdropA)
        mageNuggetsStatMonitor.borderStyle = 1;
    elseif (tempInt == 2) then
        MageNugSP_Frame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background",
                                    edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
                                    tile = true, tileSize = 16, edgeSize = 16,
                                    insets = { left = 4, right = 4, top = 4, bottom = 4 }});
        MageNugSP_Frame:SetBackdropColor(mageNuggetsStatMonitor.backdropR,mageNuggetsStatMonitor.backdropG,mageNuggetsStatMonitor.backdropB,mageNuggetsStatMonitor.backdropA)
        mageNuggetsStatMonitor.borderStyle = 2;
    elseif (tempInt == 3) then
        MageNugSP_Frame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background",
                                    edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
                                    tile = true, tileSize = 16, edgeSize = 8,
                                    insets = { left = 1, right = 1, top = 1, bottom = 1 }});
        MageNugSP_Frame:SetBackdropColor(mageNuggetsStatMonitor.backdropR,mageNuggetsStatMonitor.backdropG,mageNuggetsStatMonitor.backdropB,mageNuggetsStatMonitor.backdropA)
        mageNuggetsStatMonitor.borderStyle = 3;
    elseif (tempInt == 4) then
        MageNugSP_Frame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background",
                                    edgeFile = "Interface/DialogFrame/UI-DialogBox-Gold-Border",
                                    tile = true, tileSize = 16, edgeSize = 16,
                                    insets = { left = 4, right = 4, top = 4, bottom = 4 }});
        MageNugSP_Frame:SetBackdropColor(mageNuggetsStatMonitor.backdropR,mageNuggetsStatMonitor.backdropG,mageNuggetsStatMonitor.backdropB,mageNuggetsStatMonitor.backdropA)
        mageNuggetsStatMonitor.borderStyle = 4;
    elseif (tempInt == 5) then
        MageNugSP_Frame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background",
                                    edgeFile = "Interface/DialogFrame/UI-DialogBox-Gold-Border",
                                    tile = true, tileSize = 16, edgeSize = 8,
                                    insets = { left = 1, right = 1, top = 1, bottom = 1 }});
        MageNugSP_Frame:SetBackdropColor(mageNuggetsStatMonitor.backdropR,mageNuggetsStatMonitor.backdropG,mageNuggetsStatMonitor.backdropB,mageNuggetsStatMonitor.backdropA)
        mageNuggetsStatMonitor.borderStyle = 5;
    elseif (tempInt == 6) then
        MageNugSP_Frame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background",
                                    tile = true, tileSize = 16, edgeSize = 16,
                                    insets = { left = 4, right = 4, top = 4, bottom = 4 }});
        MageNugSP_Frame:SetBackdropColor(mageNuggetsStatMonitor.backdropR,mageNuggetsStatMonitor.backdropG,mageNuggetsStatMonitor.backdropB,mageNuggetsStatMonitor.backdropA)
        mageNuggetsStatMonitor.borderStyle = 6;
    end
end


function BackdropTransparencySlider()
    local tempInt = MageNugStatMonOptionFrame_TransparencySlider:GetValue()
    tempInt = roundZero(tempInt);
    if (tempInt == 0) then
        mageNuggetsStatMonitor.backdropA = 1.0;
        MageNugSP_Frame:SetBackdropColor(mageNuggetsStatMonitor.backdropR,mageNuggetsStatMonitor.backdropG,mageNuggetsStatMonitor.backdropB,mageNuggetsStatMonitor.backdropA)
        mageNuggetsStatMonitor.transColor = 0;
    elseif (tempInt == 1) then
        mageNuggetsStatMonitor.backdropA = 0.85;
        MageNugSP_Frame:SetBackdropColor(mageNuggetsStatMonitor.backdropR,mageNuggetsStatMonitor.backdropG,mageNuggetsStatMonitor.backdropB,mageNuggetsStatMonitor.backdropA)
        mageNuggetsStatMonitor.transColor = 1;
    elseif (tempInt == 2) then
        mageNuggetsStatMonitor.backdropA = 0.7;
        MageNugSP_Frame:SetBackdropColor(mageNuggetsStatMonitor.backdropR,mageNuggetsStatMonitor.backdropG,mageNuggetsStatMonitor.backdropB,mageNuggetsStatMonitor.backdropA)
        mageNuggetsStatMonitor.transColor = 2;
    elseif (tempInt == 3) then
        mageNuggetsStatMonitor.backdropA = 0.55;
        MageNugSP_Frame:SetBackdropColor(mageNuggetsStatMonitor.backdropR,mageNuggetsStatMonitor.backdropG,mageNuggetsStatMonitor.backdropB,mageNuggetsStatMonitor.backdropA)
        mageNuggetsStatMonitor.transColor = 3;
    elseif (tempInt == 4) then
        mageNuggetsStatMonitor.backdropA = 0.4;
        MageNugSP_Frame:SetBackdropColor(mageNuggetsStatMonitor.backdropR,mageNuggetsStatMonitor.backdropG,mageNuggetsStatMonitor.backdropB,mageNuggetsStatMonitor.backdropA)
        mageNuggetsStatMonitor.transColor = 4;
    elseif (tempInt == 5) then
        mageNuggetsStatMonitor.backdropA = 0.25;
        MageNugSP_Frame:SetBackdropColor(mageNuggetsStatMonitor.backdropR,mageNuggetsStatMonitor.backdropG,mageNuggetsStatMonitor.backdropB,mageNuggetsStatMonitor.backdropA)
        mageNuggetsStatMonitor.transColor = 5;
    elseif (tempInt == 6) then
        mageNuggetsStatMonitor.backdropA = 0.0;
        MageNugSP_Frame:SetBackdropColor(mageNuggetsStatMonitor.backdropR,mageNuggetsStatMonitor.backdropG,mageNuggetsStatMonitor.backdropB,mageNuggetsStatMonitor.backdropA)
        mageNuggetsStatMonitor.transColor = 6;
    end
end

function MNSetBackdropBlack()
    mageNuggetsStatMonitor.backdropR = 0.0;
    mageNuggetsStatMonitor.backdropG = 0.0;
    mageNuggetsStatMonitor.backdropB = 0.0;
    MageNugSP_Frame:SetBackdropColor(mageNuggetsStatMonitor.backdropR,mageNuggetsStatMonitor.backdropG,mageNuggetsStatMonitor.backdropB,mageNuggetsStatMonitor.backdropA)
end

function MNColorSelector()
    mageNuggetsStatMonitor.backdropR, mageNuggetsStatMonitor.backdropG, mageNuggetsStatMonitor.backdropB = MageNugStatMonOptionFrameColorSelect:GetColorRGB();
    MageNugSP_Frame:SetBackdropColor(mageNuggetsStatMonitor.backdropR,mageNuggetsStatMonitor.backdropG,mageNuggetsStatMonitor.backdropB,mageNuggetsStatMonitor.backdropA);
end


function MNRecallFrames()
    MageNugSP_Frame:SetClampedToScreen(true);
end
