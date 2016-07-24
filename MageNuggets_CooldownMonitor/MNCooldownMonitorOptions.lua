MageNuggetsCoolDownMon = {
    toolTips = true;
    clickthru = false;
    cooldownSize = 3;
    removedSpells = {};
}

function MageNuggetCooldownMonitorOptions_Start(self)
    self:RegisterEvent("ADDON_LOADED");
    loadMageNuggetsCdMonOptionsFrames();
    SlashCmdList['MAGENUGGETSCD_SLASHCMD'] = MageNuggetsCdMon_SlashCommandHandler;
    SLASH_MAGENUGGETSCD_SLASHCMD1 = "/mncd";
end
--
function MageNuggetsCdMon_SlashCommandHandler(msg)
    if (string.match(msg, "unignore")) then
      local spellName = string.sub(msg, 10, -1);
      removeSpellFromIgnoreList(spellName);
      updateIgnoreListFontString();
    elseif (string.match(msg, "ignore")) then
      local spellName = string.sub(msg, 8, -1);
      addSpellToIgnoreList(spellName);
      updateIgnoreListFontString();
    elseif (string.match(msg, "list")) then
      printIgnoreList();
    else
    DEFAULT_CHAT_FRAME:AddMessage("|cffffffff------------|cff00BFFF".."Mage".." |cff00FF00".."Nuggets".."|cffffffff Cooldown Monitor --------------")
    DEFAULT_CHAT_FRAME:AddMessage("|cffffffff".."/mncd ignore <spellName>      (add spell to ignore list)")
    DEFAULT_CHAT_FRAME:AddMessage("|cffffffff".."/mncd unignore <spellName>   (remove spell from ignore list)")
    DEFAULT_CHAT_FRAME:AddMessage("|cffffffff".."/mncd list     (List all ignored spells)")
    end
end
--
function MageNuggetsCooldownMonitorOptions_OnEvent(this, event, ...)
    local argin1, argin2, argin3, argin4, _, argin6 = ...
    if (event == "ADDON_LOADED") then
        if(argin1 == "MageNuggets_CooldownMonitor") then
           loadMageNuggetCdMonOptionsVariables_OnLoadEvent();
        end
    end
end
--
function loadMageNuggetsCdMonOptionsFrames()
    local MageNugCDOptions = CreateFrame("FRAME", "MageNugCDOptions", InterfaceOptionsFrame)
    MageNugCDOptions.name = "MN Cooldown Monitor"
    InterfaceOptions_AddCategory(MageNugCDOptions)
    MageNugCDOptions:SetPoint("TOPLEFT", InterfaceOptionsFrame, "BOTTOMRIGHT", 0, 0)
end
--
function loadMageNuggetCdMonOptionsVariables_OnLoadEvent()
    if (MageNuggetsCoolDownMon.cooldownSize == nil) then
        MageNugCDOptionsFrame_SizeSlider:SetValue(3);
    else
        MageNugCDOptionsFrame_SizeSlider:SetValue(MageNuggetsCoolDownMon.cooldownSize);
    end

    if (MageNuggetsCoolDownMon.removedSpells == nil) then
        MageNuggetsCoolDownMon.removedSpells = {};
    end

    MageNugCDOptionsFrame_IgnoreListText:SetWidth(300);
    MageNugCDOptionsFrame_IgnoreListText:SetNonSpaceWrap(true);
    MageNugCDOptionsFrame_IgnoreListText:SetWordWrap(true);
    updateIgnoreListFontString();

    -- paralysisId, _, _, _, _, _, _, _, _ = GetSpellInfo(115078);
    -- shackleId, _, _, _, _, _, _, _, _ = GetSpellInfo(9484);
    -- iceBlockId, _, _, _, _, _, _, _, _ = GetSpellInfo(45438);
    -- livingBombId, _, _, _, _, _, _, _, _ = GetSpellInfo(44457);
    -- netherTempestId, _, _, _, _, _, _, _, _ = GetSpellInfo(114923);
    -- icyVeinsId, _, _, _, _, _, _, _, _ = GetSpellInfo(12472);
    -- polyPigId, _, _, _, _, _, _, _, _ = GetSpellInfo(28272);
    -- polySheepId, _, _, _, _, _, _, _, _ = GetSpellInfo(28272);
    -- polyTurtleId, _, _, _, _, _, _, _, _ = GetSpellInfo(28272);
    -- polyRabbitId, _, _, _, _, _, _, _, _ = GetSpellInfo(28272);
    -- polyCatId, _, _, _, _, _, _, _, _ = GetSpellInfo(28272);
    -- frostboltId, _, _, _, _, _, _, _, _ = GetSpellInfo(42842);
    -- frostfireId, _, _, _, _, _, _, _, _ = GetSpellInfo(47610);
    -- conecoldId, _, _, _, _, _, _, _, _ = GetSpellInfo(42931);
    -- blastwaveId, _, _, _, _, _, _, _, _ = GetSpellInfo(42945);
    -- judgementjustId, _, _, _, _, _, _, _, _ = GetSpellInfo(53696);
    -- infectedwoundsId, _, _, _, _, _, _, _, _ = GetSpellInfo(48485);
    -- thunderclapId, _, _, _, _, _, _, _, _ = GetSpellInfo(47502);
    -- deadlythrowId, _, _, _, _, _, _, _, _ = GetSpellInfo(48674);
    -- frostshockId, _, _, _, _, _, _, _, _ = GetSpellInfo(49236);
    -- chilledId, _, _, _, _, _, _, _, _ = GetSpellInfo(7321);
    -- mindflayId, _, _, _, _, _, _, _, _ = GetSpellInfo(48156);
    -- impactId, _, _, _, _, _, _, _, _ = GetSpellInfo(64343);

  --  MnClickThrough()
  --  incombat = 0;
end
--
function MnClickThrough()
    local clickChecked = MageNugOption2Frame_ClickThruCheckButton:GetChecked();
    if (clickChecked == true) then
        MageNuggetsCoolDownMon.clickthru = true;
        MageNugCD_Frame:EnableMouse(false)
    else
        MageNuggetsCoolDownMon.clickthru = false;
        MageNugCD_Frame:EnableMouse(true)
    end
end
--
function MNaddSpellToIgnoreListFromEditBox()
  local editBoxText =  MageNugCDOptionsFrame_AddSpellEditBox:GetText();
  addSpellToIgnoreList(editBoxText);
  updateIgnoreListFontString();
end
--
function MNRemoveSpellFromEditBox()
  local editBoxText =  MageNugCDOptionsFrame_AddSpellEditBox:GetText();
  removeSpellFromIgnoreList(editBoxText);
  updateIgnoreListFontString();
end
--
function updateIgnoreListFontString()
  local ignoreList = table.concat(MageNuggetsCoolDownMon.removedSpells, ",  ");
  MageNugCDOptionsFrame_IgnoreListText:SetText(ignoreList);
end
--
function LockFramesToggle()
    local flChecked = MageNugOption2Frame_LockFramesCheckButton:GetChecked();
    if (flChecked == true) then
        MageNuggetsCoolDownMon.lockFrames = true;
    else
        MageNuggetsCoolDownMon.lockFrames = false;
    end
end
--
function LockFramesToggle()
    local flChecked = MageNugOption2Frame_LockFramesCheckButton:GetChecked();
    if (flChecked == true) then
        MageNuggetsCoolDownMon.lockFrames = true;
    else
        MageNuggetsCoolDownMon.lockFrames = false;
    end
end
--
function ConsoleTextToggle()
    local ctChecked = MageNugOption2Frame_ConsoleTextCheckButton:GetChecked();
    if (ctChecked == true) then
        MageNuggetsCoolDownMon.consoleTextEnabled = false;
    else
        MageNuggetsCoolDownMon.consoleTextEnabled = true;
    end
end
--
function MNtoolTipToggle()
    local ttChecked = MageNugOption2Frame_CheckButtonTT:GetChecked();
    if (ttChecked == true) then
        MageNuggetsCoolDownMon.toolTips = true;
    else
        MageNuggetsCoolDownMon.toolTips = false;
    end
end
--
function loadMageNuggetCdMonVariables_OnLoadEvent()
     mnplayerClass, mnenglishClass = UnitClass("player");
    if((mnenglishClass == 'WARRIOR') or (mnenglishClass == 'MONK') or (mnenglishClass == 'ROGUE') or (mnenglishClass == 'DEATHKNIGHT') or (mnenglishClass == 'PALADIN') or (mnenglishClass == 'HUNTER')) then
        MageNuggetsCoolDownMon.cooldownToggle = true;
        MageNugCD_Frame:Hide();
    end
    if(mnenglishClass == 'WARLOCK') then
        DEFAULT_CHAT_FRAME:AddMessage("|cff00BFFF".."Mage".."|cff00FF00".."Nuggets".."|cffffffff "..magenugVer.." loaded! Some Options Disabled (Class:"..UnitClass("Player")..")")
        MageNuggetsCoolDownMon.cooldownToggle = true;
        MageNugCD_Frame:Hide();
    end
    if(mnenglishClass == 'SHAMAN')then
        DEFAULT_CHAT_FRAME:AddMessage("|cff00BFFF".."Mage".."|cff00FF00".."Nuggets".."|cffffffff "..magenugVer.." loaded! Some Options Disabled (Class:"..UnitClass("Player")..")")
        MageNuggetsCoolDownMon.cooldownToggle = true;
        MageNugCD_Frame:Hide();
    end
    if(mnenglishClass == 'PRIEST') then
        DEFAULT_CHAT_FRAME:AddMessage("|cff00BFFF".."Mage".."|cff00FF00".."Nuggets".."|cffffffff "..magenugVer.." loaded! Some Options Disabled (Class:"..UnitClass("Player")..")")
        MageNuggetsCoolDownMon.cooldownToggle = true;
    end
    if(mnenglishClass == 'DRUID') then
        DEFAULT_CHAT_FRAME:AddMessage("|cff00BFFF".."Mage".."|cff00FF00".."Nuggets".."|cffffffff "..magenugVer.." loaded! Some Options Disabled (Class:"..UnitClass("Player")..")")
    --    MageNugCD_Frame_Text:SetText(" ");
    end
    if(mnenglishClass == 'MAGE') then
        DEFAULT_CHAT_FRAME:AddMessage("|cff00BFFF".."Mage".."|cff00FF00".."Nuggets".."|cffffffff Cooldown Monitor loaded! (Use: /mncd)")
      --  MageNugCD_Frame_Text:SetText(" ");
    end

end

----------------------------------------------------------------------------------------
--                              SAVE FRAMES                                           --
----------------------------------------------------------------------------------------
MageNuggetsCooldownMonitor_Frames = {
    cd_point = "CENTER";
    cd_relativePoint = "CENTER";
    cd_xOfs = 0;
    cd_yOfs = 0;
}

function MageNugz_SaveFrame_Position()
    MageNuggetsCooldownMonitor_Frames.cd_point, _, MageNuggetsCooldownMonitor_Frames.cd_relativePoint, MageNuggetsCooldownMonitor_Frames.cd_xOfs, MageNuggetsCooldownMonitor_Frames.cd_yOfs = MageNugCD_Frame:GetPoint();
end
--
function MageNugz_SetFrame_Positions()
    MageNugCD_Frame:ClearAllPoints();
    MageNugCD_Frame:SetPoint(MageNuggetsCooldownMonitor_Frames.cd_point, "UIParent", MageNuggetsCooldownMonitor_Frames.cd_relativePoint, MageNuggetsCooldownMonitor_Frames.cd_xOfs, MageNuggetsCooldownMonitor_Frames.cd_yOfs);
end
--
function MNLockFrames(self)
  --  if (MageNuggetsCoolDownMon.lockFrames == false)then
       self:StartMoving(); self.isMoving = true;
  --  end
end
--
function MNcooldownOnEnter()
     if (MageNuggetsCoolDownMon.toolTips == true) then
        GameTooltip_SetDefaultAnchor( GameTooltip, UIParent )
        GameTooltip:SetText("|cff00BFFF".."Mage".." |cff00CD00".."Nuggets"..":|cffFFFFFF ".."See Mage Nuggets Options -> Cooldowns")
        GameTooltip:Show()
    end
end
