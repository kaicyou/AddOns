function psdragsload()

psdragslocalem()

if GetLocale()=="deDE" or GetLocale()=="ruRU" or GetLocale()=="zhTW" or GetLocale()=="zhCN" or GetLocale()=="frFR" or GetLocale()=="koKR" or GetLocale()=="esES" or GetLocale()=="esMX" or GetLocale()=="ptBR" then
psdragslocale()
end

--description of the menu
psraidoptionstxtt3={}
psraidoptionstxtt3[1]={
{"|tip1 "..pswho.." "..psmainmdiedfrom.." |sid103785|id", "|tip2 "..psmainmwhogot.." |sid103785|id ("..psmainmtotal..")", pszzdragotxtopt613},
{pszzdragotxtopt621,pszzdragotxtopt622},
{"|tip2 |sid109390|id - "..pswhodidff},
{"|tip1 "..psmainmdamagefrom.." |sid105314|id", "|tip1 "..psmainmdamagefrom.." |sid69425|id", "|tip2 "..psmainmdamagefrom.." |sid105314|id ("..psmainmtotal..")", "|tip2 "..psmainmdamagefrom.." |sid69425|id ("..psmainmtotal..")", pszzdragotxtopt645.." (|cffff0000"..psiccheroic.."|r)", "|tip1 "..psmainmdamagefrom.." |sid109541|id (|cffff0000"..psiccheroic.."|r)", "|tip2 "..psmainmdamagefrom.." |sid109541|id ("..psmainmtotal..") (|cffff0000"..psiccheroic.."|r)", pszzdragotxtopt648.." (|cffff0000"..psiccheroic.."|r)", pszzdragotxtopt649.." (|cffff0000"..psiccheroic.."|r)"},
{},
{"|tip2 "..psmainmdamagefrom.." |sid108046|id", "|tip2 "..psmainmdamagefrom.." |sid108076|id ("..format(psnofirstsec,2)..")","|tip2 "..psmainmdamagefrom.." |sid110095|id (|cffff0000"..psiccheroic.."|r)", pszzdragotxtopt664.." (|cffff0000"..psiccheroic.."|r)", pszzdragotxtopt665,pszzdragotxtopt666,pszzdragotxtopt667,"|tip2 "..psmainmdamagefrom.." |sid107595|id"},
{pszzdragotxtopt671,pszzdragotxtopt672, "|tip2 "..psmainmdamagefrom.." |sid105845|id",pszzdragotxtopt674,pszzdragotxtopt675,pszzdragotxtopt676.." (|cffff0000"..psiccheroic.."|r)",pszzdragotxtopt677.." (|cffff0000"..psiccheroic.."|r)", pszzdragotxtopt678,pszzdragotxtopt679,pszzdragotxtopt6710},
{pszzdragotxtopt681,pszzdragotxtopt682,pszzdragotxtopt683,pszzdragotxtopt684,pszzdragotxtopt685}
}


for i=1,#psraidoptionstxtt3 do
	for j=1,#psraidoptionstxtt3[i] do
		for k=1,#psraidoptionstxtt3[i][j] do
			psraidoptionstxtt3[i][j][k]=psspellfilter(psraidoptionstxtt3[i][j][k])
		end
	end
end

--chat settings 1 or 2 or 3
psraidoptionschatdeft3={}
psraidoptionschatdeft3[1]={{2,1,1},{1,1},{1},{2,2,1,1,1,2,1,1,1},{},{1,1,1,1,2,0,0,1},{0,1,1,0,1,0,0,0,0,1},{0,1,1,1,0}}


--chat settings on or off
psraidoptionsondeft3={}
psraidoptionsondeft3[1]={{1,1,1},{1,1},{1},{1,1,1,1,1,1,1,1,1},{},{1,1,1,1,1,1,0,1},{1,1,1,1,1,1,0,0,0,0},{1,1,1,1,1}}



--глючит АПИ, таблицы боссов прописываю тут:


--
psdragontabldamage1={{},{},{},{}}

SetMapToCurrentZone()
if GetCurrentMapAreaID()==pslocations[1][6] then
	PhoenixStyleMod_drags:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
end
	PhoenixStyleMod_drags:RegisterEvent("PLAYER_REGEN_DISABLED")
	PhoenixStyleMod_drags:RegisterEvent("PLAYER_REGEN_ENABLED")
	PhoenixStyleMod_drags:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	PhoenixStyleMod_drags:RegisterEvent("ADDON_LOADED")
end



--онапдейт
function psdragsonupdate(curtime)


--delay for blood announce
if psdrabloodanoun and curtime>psdrabloodanoun then
  psdrabloodanoun=nil
  local _, instanceType, pppl, _, maxPlayers, dif = GetInstanceInfo()
  if select(3,GetInstanceInfo())==17 then
    if psiccschet6<16 then
      out("|cffff0000"..psspinebloodname.." "..pszzdragbloodkilled..":|r "..psiccschet5.." ("..pszzdragontheground..": |cff00ff00"..psiccschet6.."|r)")
      psdrabloodanoun2=GetTime()
    end
  else
    out("|cffff0000"..psspinebloodname.." "..pszzdragbloodkilled..":|r "..psiccschet5.." ("..pszzdragontheground..": |cff00ff00"..psiccschet6.."|r)")
    psdrabloodanoun2=GetTime()
  end
end

--метка на корабле
if pswarmastermarksapper1 and curtime>pswarmastermarksapper1 then
  pswarmastermarksapper1=curtime+0.2
  for j=1,GetNumGroupMembers() do
    if UnitGUID("raid"..j.."-target") and pswarmastermarksapper3 and UnitGUID("raid"..j.."-target")==pswarmastermarksapper3 then
      pswarmastermarksapper3=nil
      if (UnitIsGroupAssistant("player") or UnitIsGroupLeader("player")) then
        SetRaidTarget("raid"..j.."-target", 4)
      end
    end
  end
  if pswarmastermarksapper3==nil or curtime>pswarmastermarksapper2+15 then
    pswarmastermarksapper1=nil
    pswarmastermarksapper2=nil
    pswarmastermarksapper3=nil
  end
end     



--хагара диспелы
if pshagarazvez1 and #pshagarazvez1>0 then
  if psdelayhagaradisp21==nil then
    psdelayhagaradisp21=curtime+0.4
  end
  if curtime>psdelayhagaradisp21 then
    psdelayhagaradisp21=curtime+0.4
    for i=1,#pshagarazvez3 do
      if pshagarazvez3[i] and pshagarazvez3[i]~=0 and curtime>pshagarazvez3[i]+0.7 then
        local timee=pshagarazvez3[i]-pshagarazvez2[i]
        timee=math.ceil(timee*10)/10
        local die=""
        if pshagarazvez4[i]==1 then
          die=" (|cffff0000"..psdied.."|r)"
        end
        local spellname=GetSpellInfo(109325)
      local kupol=""
      local sp2=GetSpellInfo(110317)
      if psspelldebkupol1 and #psspelldebkupol1>0 then
        for k=1,#psspelldebkupol1 do
          if psspelldebkupol1[k] and psspelldebkupol1[k]==pshagarazvez1[i] and pshagarazvez3[i]>psspelldebkupol2[k] then
            local kumtm=pshagarazvez3[i]-psspelldebkupol2[k]
            kumtm=math.ceil(kumtm*10)/10
            kupol=" "..sp2..": "..kumtm.." "..pssec
          end
        end
      end
      if string.len(kupol)<3 then
        kupol=" |cffff0000"..format(pszzdragbuffnotfound,sp2).."|r"
        --нет купола но был диспел! пишем тут причину в чат......
        --ыытест если ДИСПЕЛА НЕ БЫЛО ПОКА НЕ РЕПОРТИМ
        --и этот репорт не верный! неймы не глобальные
        --if psraidoptionson[1][6][4][8]==1 and pswasonboss64==1 then
        --  pszapuskanonsa(psraidchats3[psraidoptionschat[1][6][4][9]], "{rt8} "..pshagarazvez1[i].." "..format(pszzdragbuffnotfound2,name1).." |s4id109325|id: "..timee.." "..pssec)
        --end
      end
        pscaststartinfo(0,spellname..": "..psaddcolortxt(1,pshagarazvez1[i])..pshagarazvez1[i]..psaddcolortxt(2,pshagarazvez1[i])..die.." (|cffff0000"..psiccunknown.."|r, "..timee.." "..pssec..")"..kupol, -1, "id1", 5, "|s4id109325|id - "..psdispellinfo,psbossnames[1][6][4],2)
        table.remove(pshagarazvez1,i)
        table.remove(pshagarazvez2,i)
        table.remove(pshagarazvez3,i)
        table.remove(pshagarazvez4,i)
      end
    end
  end
end


--живой крови
if psreportbloodspineinsec3 and curtime>psreportbloodspineinsec3 then
  psreportbloodspineinsec3=nil
  --счет крови живой
  local num=0
  if pscoruptedbloodtab2 then
    for i=1,#pscoruptedbloodtab2 do
      if pscoruptedbloodtab2[i]==0 then
        num=num+1
      end
    end
  end
  if num>0 and num<=30 then
    if num>7 then
      num="|cff00ff00"..num.."|r"
    end
    if psraidoptionson[1][6][7][7]==1 and string.find(psiccinst,psiccheroic) then
      out("|cff00ff00"..psspinebloodname.." "..pszzdragbloodalive..":|r "..num)
    elseif psraidoptionson[1][6][7][6]==1 and string.find(psiccinst,psiccheroic) then
      print("|cff00ff00"..psspinebloodname.." "..pszzdragbloodalive.."|r: "..num)
    end
    pslastbloodspineinsec=curtime
  end
end


--инфо о лечении на спине за каждого
if psspinehealcountevery5 and #psspinehealcountevery5>0 then
	if psmadnshraptimede3==nil then
		psmadnshraptimede3=curtime
	end
	if curtime>psmadnshraptimede3 then
		psmadnshraptimede3=curtime+0.4
		for i=1,#psspinehealcountevery5 do
      if psspinehealcountevery5[i] and psspinehealcountevery5[i]~=0 and curtime>psspinehealcountevery5[i] then
        local tm=(psspinehealcountevery5[i]-1)-psspinehealcountevery4[i]
        tm=math.ceil(tm*10)/10
        local add1=" "
        local wasdied=0
        if psspinehealcountevery7[i]>0 then
          add1=" (|cffff0000"..psdied.."|r). "
          wasdied=1
        end
        local tot=0
        local string=""
        if psspinehealcountevery9[i] and #psspinehealcountevery9[i]>0 then
          for j=1,#psspinehealcountevery9[i] do
            if string.len(string)>2 then
              string=string..", "
            end
            tot=tot+psspinehealcountevery9[i][j]
            string=string..psaddcolortxt(1,psspinehealcountevery8[i][j])..psspinehealcountevery8[i][j]..psaddcolortxt(2,psspinehealcountevery8[i][j]).." ("..psdamageceil(psspinehealcountevery9[i][j])..")"
          end        
        else
          string=psiccunknown
        end
        local add666=""
        if wasdied==1 then
          add666=" ("..psdamageceil(tot)..")"
        end
        local kkl=GetSpellInfo(psspellhealspine343)
        pscaststartinfo(0,kkl..": "..psaddcolortxt(1,psspinehealcountevery1[i])..psspinehealcountevery1[i]..psaddcolortxt(2,psspinehealcountevery1[i])..", "..tm.." "..pssec..add1..pszzdraghealedby..add666..": "..string, -1, "id1", 48, "|s4id"..psspellhealspine343.."|id - "..psinfo,psbossnames[1][6][7],2)
        table.remove(psspinehealcountevery1,i)
        table.remove(psspinehealcountevery2,i)
        table.remove(psspinehealcountevery3,i)
        table.remove(psspinehealcountevery4,i)
        table.remove(psspinehealcountevery5,i)
        table.remove(psspinehealcountevery6,i)
        table.remove(psspinehealcountevery7,i)
        table.remove(psspinehealcountevery8,i)
        table.remove(psspinehealcountevery9,i)
      end
    end
  end
end

--инфо об сбитие стана на спине
if psspinestanwhokick5 and #psspinestanwhokick5>0 then
	if psmadnshraptimede2==nil then
		psmadnshraptimede2=curtime
	end
	if curtime>psmadnshraptimede2 then
		psmadnshraptimede2=curtime+0.2
    for i=1,#psspinestanwhokick5 do
      if psspinestanwhokick5[i] and psspinestanwhokick5[i]~=0 and curtime>psspinestanwhokick5[i] then
        --репорт стандарт
        if psspinestanwhokick13[i]==0 then
          local tm=(psspinestanwhokick5[i]-1)-psspinestanwhokick4[i]
          tm=math.ceil(tm*10)/10
          local add1=" "
          if psspinestanwhokick6[i]>0 then
            add1=add1.."|cff00ff00"..pshvatkaspellname2.." "..psdied.."|r. "
          end
          --имена и смерти
          local namms=""
          for j=1,#psspinestanwhokick3[i] do
            if string.len(namms)>1 then
              namms=namms..", "
            end
            namms=namms..psaddcolortxt(1,psspinestanwhokick3[i][j])..psspinestanwhokick3[i][j]..psaddcolortxt(2,psspinestanwhokick3[i][j])
            if psspinestanwhokick7[i][j]>0 then
              --add1=" (|cffff0000"..psdied.."|r). "
              namms=namms.." (|cffff0000"..psdied.."|r)"
            end
          end
          --урон по адду, не больше 10 чел, не менее 5%
          local totaldmg=0
          local string=""
          if #psspinestanwhokick10[i]>0 then
          for j=1,#psspinestanwhokick10[i] do
            totaldmg=totaldmg+psspinestanwhokick10[i][j]
          end
        end
        if totaldmg>0 then
          local maxdmg=totaldmg*0.05
          local nr=0
          for j=1,#psspinestanwhokick9[i] do
            nr=nr+1
            if nr<=10 then
              if psspinestanwhokick10[i][j]>maxdmg then
                if string.len(string)>2 then
                  string=string..", "
                end
                string=string..psaddcolortxt(1,psspinestanwhokick9[i][j])..psspinestanwhokick9[i][j]..psaddcolortxt(2,psspinestanwhokick9[i][j]).." ("..psdamageceil(psspinestanwhokick10[i][j]).."-"..psspinestanwhokick102[i][j]..")"
              end
            end
          end        
        else
          string=psiccunknown
        end
        local kkl=GetSpellInfo(pshvatkaspellname)
        pscaststartinfo(0,kkl.." #"..psspinestanwhokick14[i]..": "..namms..", |cff00ff00"..tm.."|r "..pssec..add1..pszzdragdamageto.." "..pshvatkaspellname2.." ("..psdamageceil(psspinestanwhokick11[i]).." + "..psdamageceil(psspinestanwhokick12[i]).."): "..string, -1, "id1", 47, "|s4id"..pshvatkaspellname.."|id - "..psinfo,psbossnames[1][6][7],2)
        pswaitforreportstring1="#"..psspinestanwhokick14[i]..": "..psremovecolor(namms)..", "..tm.." "..pssec..psremovecolor(add1)..pszzdragdamageto.." "..pshvatkaspellname2.." ("..psdamageceil(psspinestanwhokick11[i]).." + "..psdamageceil(psspinestanwhokick12[i]).."): "..psremovecolor(string)
        if psspinestanwhokick6[i]==0 then
          pslocadd1=1
          pslocadd2=psspinestanwhokick1[i]
        end
      else
      --инфо о фейл уроне!
        local add1=""
        if psspinestanwhokick6[i]>0 then
          add1=" ("..pshvatkaspellname2.." "..psdied..")"
        end
        --урон по адду, не больше 10 чел, не менее 5%
        local totaldmg=0
        local string=""
        if #psspinestanwhokick10[i]>0 then
          for j=1,#psspinestanwhokick10[i] do
            totaldmg=totaldmg+psspinestanwhokick10[i][j]
          end
        end
        if totaldmg>0 then
          local maxdmg=totaldmg*0.05
          local nr=0
          for j=1,#psspinestanwhokick9[i] do
            nr=nr+1
            if nr<=10 then
              if psspinestanwhokick10[i][j]>maxdmg then
                if string.len(string)>2 then
                  string=string..", "
                end
                string=string..psaddcolortxt(1,psspinestanwhokick9[i][j])..psspinestanwhokick9[i][j]..psaddcolortxt(2,psspinestanwhokick9[i][j]).." ("..psdamageceil(psspinestanwhokick10[i][j]).."-"..psspinestanwhokick102[i][j]..")"
              end
            end
          end        
        else
          string=psiccunknown
        end
        pscaststartinfo(0,"|cffff0000"..pszzdragspinefaildmg..add1.." ("..psdamageceil(psspinestanwhokick11[i])..")|r: "..string, -1, "id1", 47, "|s4id"..pshvatkaspellname.."|id - "..psinfo,psbossnames[1][6][7],2)
        pscaststartinfo(0,"---", -1, "id1", 47, "|s4id"..pshvatkaspellname.."|id - "..psinfo,psbossnames[1][6][7],2)
        if psraidoptionson[1][6][7][10]==1 then
          if pswaitforreportstring1 then
            pszapuskanonsa(psraidchats3[psraidoptionschat[1][6][7][10]], pswaitforreportstring1)
          end
          pszapuskanonsa(psraidchats3[psraidoptionschat[1][6][7][10]], pszzdragspinefaildmg..add1.." ("..psdamageceil(psspinestanwhokick11[i]).."): "..psremovecolor(string))
        end
        pswaitforreportstring1=nil
      end
        table.remove(psspinestanwhokick1,i)
        table.remove(psspinestanwhokick2,i)
        table.remove(psspinestanwhokick3,i)
        table.remove(psspinestanwhokick4,i)
        table.remove(psspinestanwhokick5,i)
        table.remove(psspinestanwhokick6,i)
        table.remove(psspinestanwhokick7,i)
        table.remove(psspinestanwhokick8,i)
        table.remove(psspinestanwhokick9,i)
        table.remove(psspinestanwhokick10,i)
        table.remove(psspinestanwhokick102,i)
        table.remove(psspinestanwhokick11,i)
        table.remove(psspinestanwhokick12,i)
        table.remove(psspinestanwhokick13,i)
        table.remove(psspinestanwhokick14,i)
        table.remove(psspinestanwhokick15,i)
        
        
        if pslocadd1 then
        table.insert(psspinestanwhokick1,pslocadd2)
        table.insert(psspinestanwhokick2,{})
        table.insert(psspinestanwhokick2[#psspinestanwhokick2],"789")
        table.insert(psspinestanwhokick3,{})
        table.insert(psspinestanwhokick3[#psspinestanwhokick3],"3456")
        table.insert(psspinestanwhokick4,0)
        local rtc=GetTime()+10
        table.insert(psspinestanwhokick5,rtc)
        table.insert(psspinestanwhokick6,0)
        table.insert(psspinestanwhokick7,{})
        table.insert(psspinestanwhokick7[#psspinestanwhokick7],0)
        table.insert(psspinestanwhokick8,0)
        table.insert(psspinestanwhokick9,{})
        table.insert(psspinestanwhokick10,{})
        table.insert(psspinestanwhokick102,{})
        table.insert(psspinestanwhokick11,0)
        table.insert(psspinestanwhokick12,0)
        table.insert(psspinestanwhokick13,1)
        table.insert(psspinestanwhokick14,0)
        table.insert(psspinestanwhokick15,{})
        table.insert(psspinestanwhokick15[#psspinestanwhokick15],0)
        pslocadd1=nil
        pslocadd2=nil
        end
      end
    end
  end
end


--метки на маднессе
if psshraptabadd6 and #psshraptabadd6>0 and (UnitIsGroupAssistant("player") or UnitIsGroupLeader("player")) and psraidoptionson[1][6][8][5]==1 then
	if psmadnshraptimede==nil then
		psmadnshraptimede=curtime
	end
	if curtime>psmadnshraptimede then
		psmadnshraptimede=curtime+0.4
		for i=1,#psshraptabadd4 do
      if psshraptabadd4[i]~=0 then
        if curtime>psshraptabadd6[i] and psshraptabadd7[i]<2 then
          for j=1,GetNumGroupMembers() do
            if UnitGUID("raid"..j.."-target") and UnitGUID("raid"..j.."-target")==psshraptabadd3[i] then
              if GetRaidTargetIndex("raid"..j.."-target")==nil or (GetRaidTargetIndex("raid"..j.."-target") and GetRaidTargetIndex("raid"..j.."-target")~=psshraptabadd4[i]) then
                psshraptabadd7[i]=psshraptabadd7[i]+1
                SetRaidTarget("raid"..j.."-target", psshraptabadd4[i])
              end
            end
          end
        end
      end
    end
  end
end
        

--Сон инфо по ходу боя сохранять тут
if pssonbuffon3 and #pssonbuffon3>0 then
	if pssonbuffondelay==nil then
		pssonbuffondelay=curtime
	end
	if curtime>pssonbuffondelay then
		pssonbuffondelay=curtime+0.3
		local i=1
		while i<=#pssonbuffon3 do
			if pssonbuffon3[i] and pssonbuffon3[i]~=0 and curtime>pssonbuffon3[i]+0.3 then
				--репорт
				local a=GetSpellInfo(106466)
				local he=0

					he=psdamageceil(pssonbuffon4[i])


				pscaststartinfo(0,a..": "..psaddcolortxt(1,pssonbuffon1[i])..pssonbuffon1[i]..psaddcolortxt(2,pssonbuffon1[i]).." > "..he.." "..psabsorbed, -1, "id1", 1, "|s4id106466|id - "..psabsorbed.." "..psinfo.." ("..psapproximately..")",psbossnames[1][6][8],2)
				table.remove(pssonbuffon1,i)
				table.remove(pssonbuffon2,i)
				table.remove(pssonbuffon3,i)
				table.remove(pssonbuffon4,i)
				i=i-1
			end
			i=i+1
		end
	end
end


--track max hp of adds
if psdrakmaxHPadd1 and psdrakmaxHPadd1==0 then
	if psdelayhpcheckalakir==nil then
		psdelayhpcheckalakir=curtime+0.5
	end
	if curtime>psdelayhpcheckalakir then
		psdelayhpcheckalakir=curtime+0.5
		for ttg=1,GetNumGroupMembers() do
			if UnitGUID("raid"..ttg.."-target") then
				local id=psGetUnitID(UnitGUID("raid"..ttg.."-target"))
				if id==53890 then
          --10% for LFR, 5% Normal, 2% HEROIC
          if string.find(psiccinst,psiccheroic) then
            psdrakmaxHPadd1=UnitHealthMax("raid"..ttg.."-target")*0.98
          else
            local _, instanceType, pppl, _, maxPlayers, dif = GetInstanceInfo()
            if select(3,GetInstanceInfo())==17 then
              psdrakmaxHPadd1=UnitHealthMax("raid"..ttg.."-target")*0.9
            else
              psdrakmaxHPadd1=UnitHealthMax("raid"..ttg.."-target")*0.95
            end
          end
					ttg=41
					psdelayhpcheckalakir=nil
				end
			end
		end
	end
end
if psdrakmaxHPadd2 and psdrakmaxHPadd2==0 then
	if psdelayhpcheckalakir2==nil then
		psdelayhpcheckalakir2=curtime+0.5
	end
	if curtime>psdelayhpcheckalakir2 then
		psdelayhpcheckalakir2=curtime+0.5
		for ttg=1,GetNumGroupMembers() do
			if UnitGUID("raid"..ttg.."-target") then
				local id=psGetUnitID(UnitGUID("raid"..ttg.."-target"))
				if id==56341 then
					psdrakmaxHPadd2=UnitHealthMax("raid"..ttg.."-target")
					ttg=41
					psdelayhpcheckalakir2=nil
				end
			end
		end
	end
end

if psdrakmaxHPadd3 and psdrakmaxHPadd3==0 then
	if psdelayhpcheckalakir3==nil then
		psdelayhpcheckalakir3=curtime+0.5
	end
	if curtime>psdelayhpcheckalakir3 then
		psdelayhpcheckalakir3=curtime+0.5
		for ttg=1,GetNumGroupMembers() do
			if UnitGUID("raid"..ttg.."-target") then
				local id=psGetUnitID(UnitGUID("raid"..ttg.."-target"))
				if id==56262 then
					psdrakmaxHPadd3=UnitHealthMax("raid"..ttg.."-target")
					ttg=41
					psdelayhpcheckalakir3=nil
				end
			end
		end
	end
end
if psdrakmaxHPadd4 and psdrakmaxHPadd4==0 then
	if psdelayhpcheckalakir4==nil then
		psdelayhpcheckalakir4=curtime+0.5
	end
	if curtime>psdelayhpcheckalakir4 then
		psdelayhpcheckalakir4=curtime+0.5
		for ttg=1,GetNumGroupMembers() do
			if UnitGUID("raid"..ttg.."-target") then
				local id=psGetUnitID(UnitGUID("raid"..ttg.."-target"))
				if id==56231 then
					psdrakmaxHPadd4=UnitHealthMax("raid"..ttg.."-target")*0.9
					ttg=41
					psdelayhpcheckalakir4=nil
				end
			end
		end
	end
end


--target check on spine
if psdrakspinetargetcheckupd1 then

if curtime<psdrakspinetargetcheckupd1+15 and pstendomsactive then
--проверка ок
	if psdrakspinetargetcheckupd2 and curtime>psdrakspinetargetcheckupd2 then
		psdrakspinetargetcheckupd2=curtime+0.1--ыытест
		local ok=0
		for j=1,#pssidamageinf_indexboss[pssavedplayerpos][1] do
			if pssidamageinf_indexboss[pssavedplayerpos][1][j]==202 then
				ok=j
      end
    end
    if ok>0 then
				for i=1,#pssidamageinf_switchinfo[pssavedplayerpos][1][ok][1] do
				if pssidamageinf_switchinfo[pssavedplayerpos][1][ok][2][i]=="--" then
					if UnitGUID(pssidamageinf_switchinfo[pssavedplayerpos][1][ok][1][i].."-target")==psdrakspinetargetcheckupd3 then
						--считаем время
						local psswichspeed=math.ceil((GetTime()-psdrakspinetargetcheckupd1)*10)/10
						psswichspeed=math.ceil((psswichspeed)*10)/10
						pssidamageinf_switchinfo[pssavedplayerpos][1][ok][2][i]=psswichspeed
					end
				end
				end
		end
	end
else
psdrakspinetargetcheckupd1=nil
psdrakspinetargetcheckupd2=nil
psdrakspinetargetcheckupd3=nil
end

end

--target check on madness heroic
if psdrakmadnesshertargetcheckupd1 then

if curtime<psdrakmadnesshertargetcheckupd1+10 then
--проверка ок
	if psdrakmadnesshertargetcheckupd2 and curtime>psdrakmadnesshertargetcheckupd2 then
		psdrakmadnesshertargetcheckupd2=curtime+0.1--ыытест
		local ok=0
		for j=1,#pssidamageinf_indexboss[pssavedplayerpos][1] do
			if pssidamageinf_indexboss[pssavedplayerpos][1][j]==205 then
				ok=j
      end
    end
    if ok>0 then
				for i=1,#pssidamageinf_switchinfo[pssavedplayerpos][1][ok][1] do
				if pssidamageinf_switchinfo[pssavedplayerpos][1][ok][2][i]=="--" then
					if UnitGUID(pssidamageinf_switchinfo[pssavedplayerpos][1][ok][1][i].."-target")==psdrakmadnesshertargetcheckupd3 then
						--считаем время
						local psswichspeed=math.ceil((GetTime()-psdrakmadnesshertargetcheckupd1)*10)/10
						psswichspeed=math.ceil((psswichspeed)*10)/10
						pssidamageinf_switchinfo[pssavedplayerpos][1][ok][2][i]=psswichspeed
					end
				end
				end
		end
	end
else
psdrakmadnesshertargetcheckupd1=nil
psdrakmadnesshertargetcheckupd2=nil
psdrakmadnesshertargetcheckupd3=nil
end

end



--target check on DW madness
if psdrakmadnesstargetcheckupd1 then

if curtime<psdrakmadnesstargetcheckupd1+25 and psbighrenactive then
--проверка ок
	if psdrakmadnesstargetcheckupd2 and curtime>psdrakmadnesstargetcheckupd2 then
		psdrakmadnesstargetcheckupd2=curtime+0.1
		local ok=0
		for j=1,#pssidamageinf_indexboss[pssavedplayerpos][1] do
			if pssidamageinf_indexboss[pssavedplayerpos][1][j]==203 then
				ok=j
      end
    end
    if ok>0 then
				for i=1,#pssidamageinf_switchinfo[pssavedplayerpos][1][ok][1] do
				if pssidamageinf_switchinfo[pssavedplayerpos][1][ok][2][i]=="--" then
					if UnitGUID(pssidamageinf_switchinfo[pssavedplayerpos][1][ok][1][i].."-target")==psdrakmadnesstargetcheckupd3 then
						--считаем время
						local psswichspeed=math.ceil((GetTime()-psdrakmadnesstargetcheckupd1)*10)/10
						psswichspeed=math.ceil((psswichspeed)*10)/10
						pssidamageinf_switchinfo[pssavedplayerpos][1][ok][2][i]=psswichspeed
					end
				end
				end
			--end
		end
	end
else
psdrakmadnesstargetcheckupd1=nil
psdrakmadnesstargetcheckupd2=nil
psdrakmadnesstargetcheckupd3=nil
end

end




--tauren
if psluzhincomb3 and curtime>psluzhincomb3 then
psluzhincomb3=nil
	local text=""
  local rept=""
  local rept2=0
	for i=1,#psluzhincomb1 do
		text=text..psaddcolortxt(1,psluzhincomb1[i])..psluzhincomb1[i]..psaddcolortxt(2,psluzhincomb1[i])
		if psluzhincomb5[i] and psluzhincomb5[i]~=0 then
			text=text.." ("..psdamageceil(psluzhincomb5[i])..")"
		end
		if psluzhincomb4[i] and psluzhincomb4[i]~="0" then
      --report for die in combat
      if psluzhincomb4[i]==psdied then
        rept2=rept2+1
        if string.len(rept)>1 then
          rept=rept..", "
        end
        rept=rept..psnoservername(psluzhincomb1[i])
        if psluzhincomb5[i] and psluzhincomb5[i]~=0 then
          rept=rept.." ("..psdamageceil(psluzhincomb5[i])..")"
        end
      end
			text=text.." |cffff0000("..psluzhincomb4[i]..")|r"
		end
		if i~=#psluzhincomb1 then
			text=text..", "
		end
	end
	
	--собираем инфо по тем кто НЕ разделил урон и жив!
			local taball={}
			local psgroup=2
			if psdifflastfight==25 then
				psgroup=5
			end
			for i = 1,GetNumGroupMembers() do
				name, _, subgroup, _, _, _, _, online, isDead = GetRaidRosterInfo(i)
				if subgroup<=psgroup and online and isDead==nil and UnitIsDeadOrGhost(name)==false then
					table.insert(taball,name)
				end
			end
			for k=1,#psluzhincomb1 do
        if psluzhincomb1[k] then
          if #taball>0 then
            for j=1,#taball do
              if taball[j] and taball[j]==psluzhincomb1[k] then
                table.remove(taball,j)
              end
            end
          end
        end
      end
      if #taball>0 then
        text=text..". |cffff0000"..pszzdragnodamagegot.." ("..#taball..")"
        if #taball<9 then
          text=text..": |r"
          for v=1,#taball do
            text=text..psaddcolortxt(1,taball[v])..taball[v]..psaddcolortxt(2,taball[v])
            if v~=#taball then
              text=text..", "
            end
          end
        else
          text=text..".|r"
        end
      end
			

			local he=0

				he=psdamageceil(psluzhincomb2)


	local a1=GetSpellInfo(107589)
	local a2=GetSpellInfo(107501)
	local color="|cffff0000"
	if #psluzhincomb1>1 then
    color="|cff00ff00"
	end
	if string.len(rept)>2 then
    if psraidoptionson[1][6][6][5]==1 and pswasonboss66==1 then
      pszapuskanonsa(psraidchats3[psraidoptionschat[1][6][6][5]], "{rt8} "..psspellwarmluzb.." #"..psiccschet1.." ("..he.."). "..pszzdragsplit..": "..#psluzhincomb1..". "..pszzdragdiedwarmast..": "..rept2.." - "..rept)
    end
  end
	pscaststartinfo(0,psspellwarmluzb.." #"..psiccschet1.." ("..he.."), "..color..#psluzhincomb1.."|r: "..text, -1, "id1", 74, "|s4id107589|id & |s4id107501|id - "..psinfo,psbossnames[1][6][6],2)
	psluzhincomb1=nil
	psluzhincomb2=nil
	psluzhincomb4=nil
	psluzhincomb5=nil
end

if psluzhincomm3 and psluzhincomm3[1] and curtime>psluzhincomm3[1] then
table.remove(psluzhincomm3,1)
	local text=""
  local rept=""
  local rept2=0
	for i=1,#psluzhincomm1[1] do
		text=text..psaddcolortxt(1,psluzhincomm1[1][i])..psluzhincomm1[1][i]..psaddcolortxt(2,psluzhincomm1[1][i])
		if psluzhincomm7[1][i] and psluzhincomm7[1][i]~=0 then
			text=text.." ("..psdamageceil(psluzhincomm7[1][i])..")"
		end
		if psluzhincomm6[1][i] and psluzhincomm6[1][i]~="0" then
      --report for die in combat
      if psluzhincomm6[1][i]==psdied then
        rept2=rept2+1
        if string.len(rept)>1 then
          rept=rept..", "
        end
        rept=rept..psnoservername(psluzhincomm1[1][i])
        if psluzhincomm7[1][i] and psluzhincomm7[1][i]~=0 then
          rept=rept.." ("..psdamageceil(psluzhincomm7[1][i])..")"
        end
      end
      text=text.." |cffff0000("..psluzhincomm6[1][i]..")|r"
    end
		if i~=#psluzhincomm1[1] then
			text=text..", "
		end
	end

			local he=0

				he=psdamageceil(psluzhincomm2[1])


	local a1=GetSpellInfo(107589)
	local a2=GetSpellInfo(107501)
	local color="|cffff0000"
	if #psluzhincomm1[1]>1 then
    color="|cff00ff00"
	end
	if string.len(rept)>2 then
    if psraidoptionson[1][6][6][5]==1 and pswasonboss66==1 then
      pszapuskanonsa(psraidchats3[psraidoptionschat[1][6][6][5]], "{rt8} "..psspellwarmluzm.." #"..psluzhincomm5[1].." ("..he.."). "..pszzdragsplit..": "..#psluzhincomm1[1]..". "..pszzdragdiedwarmast..": "..rept2.." - "..rept)
    end
  end
	pscaststartinfo(0,psspellwarmluzm.." #"..psluzhincomm5[1].." ("..he.."), "..color..#psluzhincomm1[1].."|r: "..text, -1, "id1", 74, "|s4id107589|id & |s4id107501|id - "..psinfo,psbossnames[1][6][6],2)
	table.remove(psluzhincomm1,1)
	table.remove(psluzhincomm2,1)
	table.remove(psluzhincomm4,1)
	table.remove(psluzhincomm5,1)
	table.remove(psluzhincomm6,1)
	table.remove(psluzhincomm7,1)
end


--zonozz ping pong
if pstimetorep and curtime>pstimetorep then
pstimetorep=nil
	psiccschet1=psiccschet1+1
	local text=""
	for i=1,#pszonozzshar1 do
		text=text..psaddcolortxt(1,pszonozzshar1[i])..pszonozzshar1[i]..psaddcolortxt(2,pszonozzshar1[i])
		if pszonozzshar2[i]~="0" then
			text=text.." (|cffff0000"..pszonozzshar2[i].."|r)"
		end
		if i~=#pszonozzshar1 then
			text=text..", "
		end
	end
	pscaststartinfo(0,pszonozzshars2.." (#"..(psiccschet2+1).."-"..psiccschet1.."), |cff00ff00"..#pszonozzshar1.."|r: "..text, -1, "id1", 4, "|snpc"..pszonozzshar.."^58473|fnpc - "..psinfo,psbossnames[1][6][2],2)
	pszonozzshar1=nil
	pszonozzshar2=nil
end


--zonozz rep heal
if pszononcomb2 and curtime>pszononcomb2+2 then
pszononcomb2=nil
if #pszononcomb1>1 then
	local txt=""
	if #pszononcomb1<9 then
    for i=1,#pszononcomb1 do
      txt=txt..psnoservername(pszononcomb1[i])
      if i<#pszononcomb1 then
        txt=txt..", "
      end
    end
	else
    txt="..."
	end
	if psraidoptionson[1][6][2][2]==1 and pswasonboss62==1 then
		pszapuskanonsa(psraidchats3[psraidoptionschat[1][6][2][2]], "{rt8} "..format(pszzdragotxtoptt622,#pszononcomb1).." ("..psmainmhealedhimself.." "..psdamageceil(pszononcomb3).." "..psulhp.."): "..txt)
	end
end

pszononcomb1=nil
pszononcomb3=nil
end


--reset not in combat 5 sec

if psrezetnotcomb and curtime>psrezetnotcomb then
	local a=GetSpellInfo(20711)
	local b=UnitBuff("player", a)
	if UnitAffectingCombat("player")==false and UnitIsDeadOrGhost("player")==false and b==nil then --UnitName("boss1")
		psiccwipereport_3(nil,"try")
	end
end





--ыытест удалить
--оставлю для след версий, просьба о комбат логах!
--УБрать переменную что сейвит день!!!
--psgiveuslogs

if reportinsec7 and curtime>reportinsec7 and doesntneedmoreps=="doentworkmore" then
local _, month, day, year = CalendarGetDate()
reportinsec7=nil
local _, month, day, year = CalendarGetDate()
	if month<=6 and select(4, GetBuildInfo())>=40200 then --ыытест тут проверка когда прекратить спам
		if psgiveuslogs==nil or (psgiveuslogs and psgiveuslogs~=day) then
			psgiveuslogs=day
			local tx="|cff00ff00We need Combat Logs from Dragon Soul|r. Please if you have time upload them on |cff00ff00http://www.phoenixstyle.com/logs|r you will help us to update many addons that use this service!"
			if GetLocale()=="ruRU" then
				tx="|cff00ff00Нам нужны комбат логи с новых зон|r. Чтобы помочь нам с обновлением многих аддонов (ФС, ДБМ, ДХЕ,..), которые используют наш новый сервис, загляните на сайт - |cff00ff00http://www.phoenixstyle.com/logs|r"
			end
--ыытест ТУТ ВЫДАЧА ФРАЗЫ!
			out("|cff99ffffPhoenixStyle|r - "..tx)
		end
	end
end



--evade after 3 sec
if pscmrcheckforevade3 and curtime>pscmrcheckforevade3 then
pscmrcheckforevade3=pscmrcheckforevade3+7
local id=0
if UnitGUID("boss1") then
	id=psGetUnitID(UnitGUID("boss1"))
end
local bil=0
if #psbossbugs>0 then
	for i=1,#psbossbugs do
		if psbossbugs[i]==id then
			bil=1
		end
	end
end
if (UnitName("boss1")==nil and UnitName("boss2")==nil and UnitName("boss3")==nil) or bil==1 or (UnitName("boss1") and UnitName("boss1")=="") then
psiccwipereport_3(nil,"try")
end
end


if pscatamrdelayzone_3 and curtime>pscatamrdelayzone_3 then
pscatamrdelayzone_3=nil
local a1, a2, a3, a4, a5 = GetInstanceInfo()
if UnitInRaid("player") or (a2=="raid" or (a2=="party" and a3==2)) then
SetMapToCurrentZone()
end
if GetCurrentMapAreaID()==pslocations[1][6] then
PhoenixStyleMod_drags:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
else
PhoenixStyleMod_drags:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
end
end

--announce delay for phasing
if psiccrepupdate_3 and curtime>psiccrepupdate_3 then
psiccrepupdate_3=nil
psiccwipereport_3(psdelcount1,psdelcount2,psdelcount3)
psdelcount1=nil
psdelcount2=nil
psdelcount3=nil
end

--прерванные бои
if pscheckbossincombatmcr_3 and GetTime()>pscheckbossincombatmcr_3 then
	pscheckbossincombatmcr_3=pscheckbossincombatmcr_3+2


local id=0
if UnitGUID("boss1") then
	id=psGetUnitID(UnitGUID("boss1"))
end
local bil=0
if #psbossbugs>0 then
	for i=1,#psbossbugs do
		if psbossbugs[i]==id then
			bil=1
		end
	end
end

	if UnitGUID("boss1") and bil==0 and UnitName("boss1")~="" then
	else
		pscheckbossincombatmcr_3=nil
		pscheckbossincombatmcr_32=GetTime()+1
	end
end

if pscheckbossincombatmcr_32 and GetTime()>pscheckbossincombatmcr_32 then
	pscheckbossincombatmcr_32=nil
	--print ("обнаружил вайп, проверяю блок временный")
	if psbossblock==nil then
    --print ("все ок, можно резетить")
		psiccwipereport_3(nil, nil, "reset")
	end
end

if pscatadelaycheckboss_3 and curtime>pscatadelaycheckboss_3 then
pscatadelaycheckboss_3=nil


	if UnitGUID("boss1") then
		local id2=UnitGUID("boss1")
		local id=psGetUnitID(id2)
local bil=0
if #psbossbugs>0 then
	for i=1,#psbossbugs do
		if psbossbugs[i]==id then
			bil=1
		end
	end
end
		if bil==0 and UnitName("boss1")~="" then
			pscmroncombatstartcheckboss_3(id)
		else
			pscmrdelayofbosccheck_3=GetTime()+1
		end
	else
		pscmrdelayofbosccheck_3=GetTime()+1
	end
end


--постоянная проверка по ходу боя...
if pscmrdelayofbosccheck_3 and curtime>pscmrdelayofbosccheck_3 then
pscmrdelayofbosccheck_3=curtime+1


	if UnitGUID("boss1") then
		local id2=UnitGUID("boss1")
		local id=psGetUnitID(id2)
local bil=0
if #psbossbugs>0 then
	for i=1,#psbossbugs do
		if psbossbugs[i]==id then
			bil=1
		end
	end
end
		if bil==0 and UnitName("boss1")~="" then
			pscmroncombatstartcheckboss_3(id)
			pscmrdelayofbosccheck_3=nil
		end
	end
end






end

function pscmroncombatstartcheckboss_3(id)


SetMapToCurrentZone()
if GetCurrentMapAreaID()==pslocations[1][6] then
pscmrcheckforevade3=GetTime()+10
end


	--ыыытест новые боссы прописывать тут (2 места)



if GetCurrentMapAreaID()==pslocations[1][6] then





	if id==55265 and psbossfile61 then
		pswasonboss61=1
	end
	if id==55308 and psbossfile62 then
		pswasonboss62=1
	end
	if id==55312 and psbossfile63 then
		pswasonboss63=1
	end
	if id==55689 and psbossfile64 then
		pswasonboss64=1
	end
	if id==55294 and psbossfile65 then
		pswasonboss65=1
	end
	if (id==56427 or id==56598) and psbossfile66 then
		pswasonboss66=1
	end
	--if id==1 and psbossfile67 then
	--	pswasonboss67=1
	--end
	if id==56173 and psbossfile68 then
		pswasonboss68=1
	end
end


end


function psdragsonevent(self,event,...)


if event == "COMBAT_LOG_EVENT_UNFILTERED" then


--Inst 6
if GetCurrentMapAreaID()==pslocations[1][6] then

local arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15 = ...


if pswasonboss61 then
pscombatlogboss61(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)
elseif pswasonboss62 then
pscombatlogboss62(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)
elseif pswasonboss63 then
pscombatlogboss63(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)
elseif pswasonboss64 then
pscombatlogboss64(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)
elseif pswasonboss65 then
pscombatlogboss65(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)
elseif pswasonboss66 then
pscombatlogboss66(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)
elseif pswasonboss67 then
pscombatlogboss67(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)
elseif pswasonboss68 then
pscombatlogboss68(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)

else --cause Blizz fails with API we use more CPU:

pscombatlogboss61(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)
pscombatlogboss62(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)
pscombatlogboss63(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)
pscombatlogboss64(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)
pscombatlogboss65(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)
pscombatlogboss66(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)
pscombatlogboss67(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)
pscombatlogboss68(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)
end


--res to reset info
if arg2=="SPELL_RESURRECT" and (spellid==83968 or spellid==7328 or spellid==50769 or spellid==2008 or spellid==2006) then
psiccwipereport_3(nil,"try")
end





end






else

--остальные евенты

local arg1, arg2, arg3,arg4,arg5,arg6 = ...

if event == "PLAYER_REGEN_DISABLED" then


if (psbilresnut and GetTime()<psbilresnut+3) or pscheckbossincombat then


else

psdragontabldamage1={{},{},{},{}}
table.wipe (psdragontabldamage1[1])
table.wipe (psdragontabldamage1[2])
table.wipe (psdragontabldamage1[3])
table.wipe (psdragontabldamage1[4])
pscreatefightincombat=nil

if UnitGUID("boss1") then
local id2=UnitGUID("boss1")
local id=psGetUnitID(id2)
local bil=0
if #psbossbugs>0 then
	for i=1,#psbossbugs do
		if psbossbugs[i]==id then
			bil=1
		end
	end
end
if bil==0 and UnitName("boss1")~="" then
pscmroncombatstartcheckboss_3(id)
else
pscatadelaycheckboss_3=GetTime()+2
end

else
pscatadelaycheckboss_3=GetTime()+2
end


end
end


if event=="PLAYER_REGEN_ENABLED" then
	if UnitAffectingCombat("player")==false and UnitIsDeadOrGhost("player")==false then --UnitName("boss1")
		psrezetnotcomb=GetTime()+5
	end
end


if event == "CHAT_MSG_MONSTER_YELL" then
if arg1 and (string.find(string.lower(arg1),string.lower(pszzdragmadnesskilledyell)) or string.find(string.lower(arg1),string.lower("Время пришло. Я сосредоточу всю свою силу на Душе Дракона и сконцентрирую вокруг нее все временные потоки.")) or string.find(string.lower(arg1),string.lower("Превосходно. Огонь моего сердца подобен сиянию алмаза немыслимой чистоты, и каждую искру я направлю в Душу Дракона"))) then
  psiccwipereport_3()
end
end


if event == "ZONE_CHANGED_NEW_AREA" then


psiccwipereport_3(nil,"try")
pscatamrdelayzone_3=GetTime()+3

pspaukincombat=nil

end






if event == "ADDON_LOADED" then

if arg1=="PhoenixStyleMod_DragonSoul" then

--ыытест
--УБрать переменную что сейвит день!!!
--psgiveuslogs
--local _, month, day, year = CalendarGetDate()

reportinsec7=GetTime()+7


if psicctekver_3==nil then psicctekver_3=0 end

--ыытест ыыйцук это перенести в главный модуль и отображать не ток при входе но и при нажатии на кнопку фена
local psiccnewveranoncet={""}
if GetLocale()=="ruRU" then
psiccnewveranoncet={""}
end 


--NEW announce
	if 0-psicctekver_3>0 and (psicctekver_3>0 or 1-psicctekver_3==1) then

local psvercoll=(0-psicctekver_3)

		if psvercoll>0 then
			--print ("|cff99ffffPhoenixStyle|r - "..pscolnewveranonce1)
		end

if psvercoll>3 then psvercoll=3 end

while psvercoll>0 do
		if psvercoll>0 and psiccnewveranoncet[psvercoll] then
out ("|cff99ffffPhoenixStyle|r - "..psiccnewveranoncet[psvercoll])
		end
psvercoll=psvercoll-1
end
	end

psicctekver_3=0 --ТЕК ВЕРСИЯ!!! и так выше изменить цифру что отнимаем, всего 3 раза




pslastmoduleloadtxt=psdragslastmoduleloadtxt


--перенос переменных

pscmrpassvariables_3()


	if psraidoptionson[1][6]==nil then psraidoptionson[1][6]={}
	end
	for j=1,#psraidoptionsont3[1] do
		if psraidoptionson[1][6][j]==nil then
			psraidoptionson[1][6][j]={}
		end
		for t=1,#psraidoptionsont3[1][j] do
			if psraidoptionson[1][6][j][t]==nil then
				psraidoptionson[1][6][j][t]=psraidoptionsont3[1][j][t]
			end
		end
	end

	if psraidoptionstxt[6]==nil then psraidoptionstxt[6]={}
	end
	for j=1,#psraidoptionstxtt3[1] do
		if psraidoptionstxt[6][j]==nil then
			psraidoptionstxt[6][j]={}
		end
		for t=1,#psraidoptionstxtt3[1][j] do
			if psraidoptionstxt[6][j][t]==nil then
				psraidoptionstxt[6][j][t]=psraidoptionstxtt3[1][j][t]
			end
		end
	end

--ыытест

psraidoptionstxtt3=nil

	if psraidoptionschat[1][6]==nil then psraidoptionschat[1][6]={}
	end
	for j=1,#psraidoptionschatt3[1] do
		if psraidoptionschat[1][6][j]==nil then
			psraidoptionschat[1][6][j]={}
		end
		for t=1,#psraidoptionschatt3[1][j] do
			if psraidoptionschat[1][6][j][t]==nil then
				psraidoptionschat[1][6][j][t]=psraidoptionschatt3[1][j][t]
			end
		end
	end


--boss manual localization update
if psbossnames and psbossnames[1] then
psbossnames[1][6][7]=pszzdragoboss7
psbossnames[1][6][8]=pszzdragoboss8
end



end
end
--остальные евенты конец





end --рейд


end --КОНЕЦ ОНЕВЕНТ


--tryorkill - if try then true, if kill - nil, reset - only reset no report
--pswasonboss42 1 если мы в бою с боссом и трекерим, 2 если вайпнулись и продолжаем трекерить ПОСЛЕ анонса
function psiccwipereport_3(wipe, tryorkill, reset, checkforwipe)
local aa=""
if wipe then
aa=aa.."wipe:"..wipe.."."
end
if tryorkill then
aa=aa.."tryorkill:"..tryorkill.."."
end
if reset then
aa=aa.."reset:"..reset.."."
end
if checkforwipe then
aa=aa.."checkforwipe:"..checkforwipe.."."
end


	if pszapuskdelayphasing_3>0 then
	psiccrepupdate_3=pszapuskdelayphasing_3
	pszapuskdelayphasing_3=0
	if psiccrepupdate_3>7 then psiccrepupdate_3=7 end
	psiccrepupdate_3=psiccrepupdate_3+GetTime()
	psdelcount1=wipe
	psdelcount2=tryorkill
	psdelcount3=reset
	else

		if psiccrepupdate_3==nil then

--ыыытест новые боссы прописывать тут (2 места)
pscmrcheckforevade3=nil


if (pswasonboss61) then
pscmrbossREPORT611(wipe, tryorkill, reset, checkforwipe)
pscmrbossRESET611(wipe, tryorkill, reset, checkforwipe)
end
if (pswasonboss62) then
pscmrbossREPORT621(wipe, tryorkill, reset, checkforwipe)
pscmrbossRESET621(wipe, tryorkill, reset, checkforwipe)
end
if (pswasonboss63) then
pscmrbossREPORT631(wipe, tryorkill, reset, checkforwipe)
pscmrbossRESET631(wipe, tryorkill, reset, checkforwipe)
end
if (pswasonboss64) then
pscmrbossREPORT641(wipe, tryorkill, reset, checkforwipe)
pscmrbossRESET641(wipe, tryorkill, reset, checkforwipe)
end
if (pswasonboss65) then
pscmrbossREPORT651(wipe, tryorkill, reset, checkforwipe)
pscmrbossRESET651(wipe, tryorkill, reset, checkforwipe)
end
if (pswasonboss66) then
pscmrbossREPORT661(wipe, tryorkill, reset, checkforwipe)
pscmrbossRESET661(wipe, tryorkill, reset, checkforwipe)
end
if (pswasonboss67) then
pscmrbossREPORT671(wipe, tryorkill, reset, checkforwipe)
pscmrbossRESET671(wipe, tryorkill, reset, checkforwipe)
end
if (pswasonboss68) then
pscmrbossREPORT681(wipe, tryorkill, reset, checkforwipe)
pscmrbossRESET681(wipe, tryorkill, reset, checkforwipe)
end

		end

	end

if wipe==nil and psbossblock==nil then
psbossblock=GetTime()
end

end


function pscmrpassvariables_3()

if psraidoptionschatt3==nil then psraidoptionschatt3={} end

for i=1,#psraidoptionschatdeft3 do
	if psraidoptionschatt3[i]==nil then
		psraidoptionschatt3[i]={}
	end
	for j=1,#psraidoptionschatdeft3[i] do
		if psraidoptionschatt3[i][j]==nil then
			psraidoptionschatt3[i][j]={}
		end
		for t=1,#psraidoptionschatdeft3[i][j] do
			if psraidoptionschatt3[i][j][t]==nil or (psraidoptionschatt3[i][j][t] and psraidoptionschatt3[i][j][t]==0) then
				psraidoptionschatt3[i][j][t]=psraidoptionschatdeft3[i][j][t]
			end
		end
	end
end

if psraidoptionsont3==nil then psraidoptionsont3={} end

for i=1,#psraidoptionsondeft3 do
	if psraidoptionsont3[i]==nil then
		psraidoptionsont3[i]={}
	end
	for j=1,#psraidoptionsondeft3[i] do
		if psraidoptionsont3[i][j]==nil then
			psraidoptionsont3[i][j]={}
		end
		for t=1,#psraidoptionsondeft3[i][j] do
			if psraidoptionsont3[i][j][t]==nil then
				psraidoptionsont3[i][j][t]=psraidoptionsondeft3[i][j][t]
			end
		end
	end
end

end