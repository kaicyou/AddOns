-- Mage Nuggets Stat Monitor - B-Buck (Bbuck of Eredar)

local currentStatColor = 0;
local statMonitorLoadTimer = 0;
local spellPowerLimitBreak = false;
local critLimitBreak = false;

function MageNuggetsSP_OnUpdate(self, elapsed)
 self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;
 if (self.TimeSinceLastUpdate > 0.3) then

    local spellpower = GetSpellBonusDamage(3);
    local attackpower, posBuff, negBuff = UnitAttackPower("player");
    local crit = roundStat(GetSpellCritChance(3));
    local haste = roundStat(UnitSpellHaste("player"));
    local mastery = roundStat(GetMasteryEffect());
    local leech = roundStat(GetLifesteal());
    local versatility = roundStat(GetCombatRatingBonus(29));
    local base, stat, posBuff, negBuff = UnitStat("player",3);
    local spirit = stat;
    local baseRegen, castingRegen = GetManaRegen()
    local manaregen = roundZero(castingRegen*5);
    local armorBase, effectiveArmor, armor, posBuff, negBuff = UnitArmor("player");
    local statCount = 0;
    local readout = {};
    local stats = {};
    local bonusSpellDamage = 0;

    local i = 1;
    local buffName, rank, _, count, _, _, expirationTime, _, _, _, spellId = UnitAura("player", i, "HELPFUL");
    while buffName do
        if(spellId == 116014) then -- Rune of Power
            bonusSpellDamage = 15;
        end
        if(spellId == 116267) then -- Incanter's Flow
            bonusSpellDamage = count * 4;
        end
        i = i + 1;
        buffName, rank, _, count, _, _, expirationTime, _, _, _, spellId = UnitAura("player", i, "HELPFUL");
    end

    if(mageNuggetsStatMonitor.spellpower == true)then
        statCount = statCount + 1;
        readout[statCount] = "SPower";
        if(bonusSpellDamage > 0)then
            spellpower = spellpower * (1+(bonusSpellDamage * 0.01));
        end
        stats[statCount] = roundZero(spellpower);
    end
    if(mageNuggetsStatMonitor.attackpower == true)then
        statCount = statCount + 1;
        readout[statCount] = "APower";
        stats[statCount] = roundZero(attackpower);
    end
    if(mageNuggetsStatMonitor.crit == true)then
        statCount = statCount + 1;
        readout[statCount] = "Crit";
        stats[statCount] = crit;
    end
    if(mageNuggetsStatMonitor.haste == true)then
        statCount = statCount + 1;
        readout[statCount] = "Haste";
        stats[statCount] = haste;
    end
    if(mageNuggetsStatMonitor.mastery == true)then
        statCount = statCount + 1;
        readout[statCount] = "Mastery";
        stats[statCount] = mastery;
    end
    if(mageNuggetsStatMonitor.leech == true)then
        statCount = statCount + 1;
        readout[statCount] = "Leech";
        stats[statCount] = leech;
    end
    if(mageNuggetsStatMonitor.versatility == true)then
        statCount = statCount + 1;
        readout[statCount] = "Versatil";
        stats[statCount] = versatility;
    end
    if(mageNuggetsStatMonitor.spirit == true)then
        statCount = statCount + 1;
        readout[statCount] = "Spirit";
        stats[statCount] = spirit;
    end
    if(mageNuggetsStatMonitor.manaregen == true)then
        statCount = statCount + 1;
        readout[statCount] = "Regen";
        stats[statCount] = manaregen;
    end
    if(mageNuggetsStatMonitor.armor == true)then
        statCount = statCount + 1;
        readout[statCount] = "Armor";
        stats[statCount] = roundStat(armor);
    end
    if(statCount > 0) then
        local i = 1;
        while(statCount >= i) do
            _G["MageNugSP_FrameText"..i]:SetText(readout[i]);
            _G["MageNugSP_FrameValueText"..i]:SetText(stats[i]);
            i = i + 1;
        end
        local i = 11;
        while(statCount < i) do
           _G["MageNugSP_FrameText"..i]:SetText("");
           _G["MageNugSP_FrameValueText"..i]:SetText("");
            i = i - 1;
        end
    else
        local i = 10;
        while(statCount < i) do
           _G["MageNugSP_FrameText"..i]:SetText("");
           _G["MageNugSP_FrameValueText"..i]:SetText("");
            i = i - 1;
        end
    end
    for k in pairs (readout) do
        readout[k] = nil
    end
    for j in pairs (stats) do
        stats[j] = nil
    end
    if statMonitorLoadTimer < 4 then
        statMonitorLoadTimer = statMonitorLoadTimer + 1;
        setStatMonitorHeight(statCount);
        dressStatMonitorText();
    end
    statCount = 0;

    if(spellpower > mageNuggetsStatMonitor.baseSpellPower) then
      spellPowerLimitBreak = true;
    else
      spellPowerLimitBreak = false;
    end

    if(mageNuggetsStatMonitor.limitBreakToggle == true) then
      MageNuggetsBuff_OnUpdate();
    end
    self.TimeSinceLastUpdate = 0;
   end
end

function setStatMonitorHeight(statCount)
    if(statCount==0)then
        MageNugSP_Frame:SetHeight(20);
    elseif(statCount==1)then
        MageNugSP_Frame:SetHeight(20);
    elseif(statCount==2)then
        MageNugSP_Frame:SetHeight(30);
    elseif(statCount==3)then
        MageNugSP_Frame:SetHeight(40);
    elseif(statCount==4)then
        MageNugSP_Frame:SetHeight(49);
    elseif(statCount==5)then
        MageNugSP_Frame:SetHeight(59);
    elseif(statCount==6)then
        MageNugSP_Frame:SetHeight(69);
    elseif(statCount==7)then
        MageNugSP_Frame:SetHeight(79);
    elseif(statCount==8)then
        MageNugSP_Frame:SetHeight(89);
    elseif(statCount==9)then
        MageNugSP_Frame:SetHeight(99);
    elseif(statCount==10)then
        MageNugSP_Frame:SetHeight(110);
    elseif(statCount==11)then
        MageNugSP_Frame:SetHeight(120);
    end
end

function mageNuggetsStatMonitorToggle(statType)
    if(statType == "spellpower") then
        if (mageNuggetsStatMonitor.spellpower == false) then
            mageNuggetsStatMonitor.spellpower = true;
        else
            mageNuggetsStatMonitor.spellpower = false;
        end
    elseif(statType == "attackpower") then
        if (mageNuggetsStatMonitor.attackpower == false) then
            mageNuggetsStatMonitor.attackpower = true;
        else
            mageNuggetsStatMonitor.attackpower = false;
        end
    elseif(statType == "crit") then
        if (mageNuggetsStatMonitor.crit == false) then
            mageNuggetsStatMonitor.crit = true;
        else
            mageNuggetsStatMonitor.crit = false;
        end
    elseif(statType == "haste") then
        if (mageNuggetsStatMonitor.haste == false) then
            mageNuggetsStatMonitor.haste = true;
        else
            mageNuggetsStatMonitor.haste = false;
        end
    elseif(statType == "mastery") then
        if (mageNuggetsStatMonitor.mastery == false) then
            mageNuggetsStatMonitor.mastery = true;
        else
            mageNuggetsStatMonitor.mastery = false;
        end
    elseif(statType == "leech") then
        if (mageNuggetsStatMonitor.leech == false) then
            mageNuggetsStatMonitor.leech = true;
        else
            mageNuggetsStatMonitor.leech = false;
        end
    elseif(statType == "versatility") then
        if (mageNuggetsStatMonitor.versatility == false) then
            mageNuggetsStatMonitor.versatility = true;
        else
            mageNuggetsStatMonitor.versatility = false;
        end
    elseif(statType == "spirit") then
        if (mageNuggetsStatMonitor.spirit == false) then
            mageNuggetsStatMonitor.spirit = true;
        else
            mageNuggetsStatMonitor.spirit = false;
        end
    elseif(statType == "manaregen") then
        if (mageNuggetsStatMonitor.manaregen == false) then
            mageNuggetsStatMonitor.manaregen = true;
        else
            mageNuggetsStatMonitor.manaregen = false;
        end
    elseif(statType == "armor") then
        if (mageNuggetsStatMonitor.armor == false) then
            mageNuggetsStatMonitor.armor = true;
        else
            mageNuggetsStatMonitor.armor = false;
        end
    end
    setStatMonitorHeight(dressStatMonitorText());
    dressStatMonitorText();
end

function roundStat(value)
    return math.floor(value*math.pow(10,2)+0.5) / math.pow(10,2)
end

function roundZero(inputNum)
    return math.floor(inputNum*math.pow(10,0)+0.5) / math.pow(10,0)
end

function setStatMonitorStats()
    if (mageNuggetsStatMonitor.spellpower == nil)then
        mageNuggetsStatMonitor.spellpower = true
    end
    if (mageNuggetsStatMonitor.spellpower == true) then
        MageNugSP_SpellPowerCheckButton:SetChecked(true);
    else
        MageNugSP_SpellPowerCheckButton:SetChecked(false);
    end

    if (mageNuggetsStatMonitor.attackpower == nil)then
        mageNuggetsStatMonitor.attackpower = true
    end
    if (mageNuggetsStatMonitor.attackpower == true) then
        MageNugSP_AttackPowerCheckButton:SetChecked(true);
    else
        MageNugSP_AttackPowerCheckButton:SetChecked(false);
    end

    if (mageNuggetsStatMonitor.crit == nil)then
        mageNuggetsStatMonitor.crit = true
    end
    if (mageNuggetsStatMonitor.crit == true) then
        MageNugSP_CritCheckButton:SetChecked(true);
    else
        MageNugSP_CritCheckButton:SetChecked(false);
    end

    if (mageNuggetsStatMonitor.haste == nil)then
        mageNuggetsStatMonitor.haste = true
    end
    if (mageNuggetsStatMonitor.haste == true) then
        MageNugSP_HasteCheckButton:SetChecked(true);
    else
        MageNugSP_HasteCheckButton:SetChecked(false);
    end

    if (mageNuggetsStatMonitor.mastery == nil)then
        mageNuggetsStatMonitor.mastery = true
    end
    if (mageNuggetsStatMonitor.mastery == true) then
        MageNugSP_MasteryCheckButton:SetChecked(true);
    else
        MageNugSP_MasteryCheckButton:SetChecked(false);
    end

    if (mageNuggetsStatMonitor.leech == nil)then
        mageNuggetsStatMonitor.leech = true
    end
    if (mageNuggetsStatMonitor.leech == true) then
        MageNugSP_LeechCheckButton:SetChecked(true);
    else
        MageNugSP_LeechCheckButton:SetChecked(false);
    end

    if (mageNuggetsStatMonitor.versatility == nil)then
        mageNuggetsStatMonitor.versatility = true
    end
    if (mageNuggetsStatMonitor.versatility == true) then
        MageNugSP_VersatilityCheckButton:SetChecked(true);
    else
        MageNugSP_VersatilityCheckButton:SetChecked(false);
    end

    if (mageNuggetsStatMonitor.spirit == nil)then
        mageNuggetsStatMonitor.spirit = true
    end
    if (mageNuggetsStatMonitor.spirit == true) then
        MageNugSP_SpiritCheckButton:SetChecked(true);
    else
        MageNugSP_SpiritCheckButton:SetChecked(false);
    end

    if (mageNuggetsStatMonitor.manaregen == nil)then
        mageNuggetsStatMonitor.manaregen = true
    end
    if (mageNuggetsStatMonitor.manaregen == true) then
        MageNugSP_ManaRegenCheckButton:SetChecked(true);
    else
        MageNugSP_ManaRegenCheckButton:SetChecked(false);
    end

    if (mageNuggetsStatMonitor.armor == nil)then
        mageNuggetsStatMonitor.armor = true
    end
    if (mageNuggetsStatMonitor.armor == true) then
        MageNugSP_ArmorCheckButton:SetChecked(true);
    else
        MageNugSP_ArmorCheckButton:SetChecked(false);
    end
end

function MageNuggetsBuff_OnUpdate(self, elapsed)
    local lusted = false;
    local i = 1;
    local buffName, rank, _, count, _, _, expirationTime, _, _, _, spellId = UnitAura("player", i, "HELPFUL");
    while buffName do
        if(spellId == 80353) or (spellId == 102351) or (spellId == 2825) or (spellId == 32182) then -- Timewarp
            lusted = true;
        end
        i = i + 1;
        buffName, rank, _, count, _, _, expirationTime, _, _, _, spellId = UnitAura("player", i, "HELPFUL");
    end

    local hasteIndex = getStatIndex("Haste");
    local spIndex = getStatIndex("SPower");
    --local base, stat, posBuff, negBuff = UnitStat("player", 4);
    --DEFAULT_CHAT_FRAME:AddMessage(base.."   "..posBuff.."  "..stat.."  "..negBuff);
    local rRoll = (math.random (10) * 0.1);
    local gRoll = (math.random (10) * 0.1);
    local bRoll = (math.random (10) * 0.1);

    if(lusted == true) then
      if(hasteIndex ~= 0)then
        _G["MageNugSP_FrameValueText"..hasteIndex]:SetTextColor(rRoll, gRoll, bRoll);
      end
    else
      if(hasteIndex ~= 0)then
        _G["MageNugSP_FrameValueText"..hasteIndex]:SetTextColor(mageNuggetsStatMonitor.hasteValueR,mageNuggetsStatMonitor.hasteValueG,mageNuggetsStatMonitor.hasteValueB,1);
      end
    end

    if(spellPowerLimitBreak == true) then
      if(spIndex ~= 0)then
        _G["MageNugSP_FrameValueText"..spIndex]:SetTextColor(rRoll, gRoll, bRoll);
      end
    else
      if(spIndex ~= 0)then
        _G["MageNugSP_FrameValueText"..spIndex]:SetTextColor(mageNuggetsStatMonitor.spellpowerValueR,mageNuggetsStatMonitor.spellpowerValueG,mageNuggetsStatMonitor.spellpowerValueB,1);
      end
    end
end

function getStatIndex(stat)
  local hasteIndex = 0;
  local i = 1;
  while i < 11 do
    local statText = _G["MageNugSP_FrameText"..i]:GetText();
    if (statText == stat) then
      return i;
    end
    i = i + 1;
  end
  return 0;
end

function dressStatMonitorText()
    local statCount = 0;
    if(mageNuggetsStatMonitor.spellpower == true) then
        statCount = statCount + 1;
        _G["MageNugSP_FrameText"..statCount]:SetTextColor(mageNuggetsStatMonitor.spellpowerR,mageNuggetsStatMonitor.spellpowerG,mageNuggetsStatMonitor.spellpowerB,1);
        _G["MageNugSP_FrameValueText"..statCount]:SetTextColor(mageNuggetsStatMonitor.spellpowerValueR,mageNuggetsStatMonitor.spellpowerValueG,mageNuggetsStatMonitor.spellpowerValueB,1);
    end
    if(mageNuggetsStatMonitor.attackpower == true) then
        statCount = statCount + 1;
        _G["MageNugSP_FrameText"..statCount]:SetTextColor(mageNuggetsStatMonitor.attackpowerR,mageNuggetsStatMonitor.attackpowerG,mageNuggetsStatMonitor.attackpowerB,1);
        _G["MageNugSP_FrameValueText"..statCount]:SetTextColor(mageNuggetsStatMonitor.attackpowerValueR,mageNuggetsStatMonitor.attackpowerValueG,mageNuggetsStatMonitor.attackpowerValueB,1);
    end
    if(mageNuggetsStatMonitor.crit == true) then
        statCount = statCount + 1;
        _G["MageNugSP_FrameText"..statCount]:SetTextColor(mageNuggetsStatMonitor.critR,mageNuggetsStatMonitor.critG,mageNuggetsStatMonitor.critB,1);
        _G["MageNugSP_FrameValueText"..statCount]:SetTextColor(mageNuggetsStatMonitor.critValueR,mageNuggetsStatMonitor.critValueG,mageNuggetsStatMonitor.critValueB,1);
    end
    if(mageNuggetsStatMonitor.haste == true) then
        statCount = statCount + 1;
        _G["MageNugSP_FrameText"..statCount]:SetTextColor(mageNuggetsStatMonitor.hasteR,mageNuggetsStatMonitor.hasteG,mageNuggetsStatMonitor.hasteB,1);
        _G["MageNugSP_FrameValueText"..statCount]:SetTextColor(mageNuggetsStatMonitor.hasteValueR,mageNuggetsStatMonitor.hasteValueG,mageNuggetsStatMonitor.hasteValueB,1);
    end
    if(mageNuggetsStatMonitor.mastery == true) then
        statCount = statCount + 1;
        _G["MageNugSP_FrameText"..statCount]:SetTextColor(mageNuggetsStatMonitor.masteryR,mageNuggetsStatMonitor.masteryG,mageNuggetsStatMonitor.masteryB,1);
        _G["MageNugSP_FrameValueText"..statCount]:SetTextColor(mageNuggetsStatMonitor.masteryValueR,mageNuggetsStatMonitor.masteryValueG,mageNuggetsStatMonitor.masteryValueB,1);
    end
    if(mageNuggetsStatMonitor.leech == true) then
        statCount = statCount + 1;
        _G["MageNugSP_FrameText"..statCount]:SetTextColor(mageNuggetsStatMonitor.leechR,mageNuggetsStatMonitor.leechG,mageNuggetsStatMonitor.leechB,1);
        _G["MageNugSP_FrameValueText"..statCount]:SetTextColor(mageNuggetsStatMonitor.leechValueR,mageNuggetsStatMonitor.leechValueG,mageNuggetsStatMonitor.leechValueB,1);
    end
    if(mageNuggetsStatMonitor.versatility == true) then
        statCount = statCount + 1;
        _G["MageNugSP_FrameText"..statCount]:SetTextColor(mageNuggetsStatMonitor.versatilityR,mageNuggetsStatMonitor.versatilityG,mageNuggetsStatMonitor.versatilityB,1);
        _G["MageNugSP_FrameValueText"..statCount]:SetTextColor(mageNuggetsStatMonitor.versatilityValueR,mageNuggetsStatMonitor.versatilityValueG,mageNuggetsStatMonitor.versatilityValueB,1);
    end
    if(mageNuggetsStatMonitor.spirit == true) then
        statCount = statCount + 1;
        _G["MageNugSP_FrameText"..statCount]:SetTextColor(mageNuggetsStatMonitor.spiritR,mageNuggetsStatMonitor.spiritG,mageNuggetsStatMonitor.spiritB,1);
        _G["MageNugSP_FrameValueText"..statCount]:SetTextColor(mageNuggetsStatMonitor.spiritValueR,mageNuggetsStatMonitor.spiritValueG,mageNuggetsStatMonitor.spiritValueB,1);
    end
    if(mageNuggetsStatMonitor.manaregen == true) then
        statCount = statCount + 1;
        _G["MageNugSP_FrameText"..statCount]:SetTextColor(mageNuggetsStatMonitor.manaregenR,mageNuggetsStatMonitor.manaregenG,mageNuggetsStatMonitor.manaregenB,1);
        _G["MageNugSP_FrameValueText"..statCount]:SetTextColor(mageNuggetsStatMonitor.manaregenValueR,mageNuggetsStatMonitor.manaregenValueG,mageNuggetsStatMonitor.manaregenValueB,1);
    end
     if(mageNuggetsStatMonitor.armor == true) then
        statCount = statCount + 1;
        _G["MageNugSP_FrameText"..statCount]:SetTextColor(mageNuggetsStatMonitor.armorR,mageNuggetsStatMonitor.armorG,mageNuggetsStatMonitor.armorB,1);
        _G["MageNugSP_FrameValueText"..statCount]:SetTextColor(mageNuggetsStatMonitor.armorValueR,mageNuggetsStatMonitor.armorValueG,mageNuggetsStatMonitor.armorValueB,1);
    end
    return statCount;
end
