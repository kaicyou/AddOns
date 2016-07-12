psbossfile64=1
function pscmrboss641(guid2,name2,spellname,spellid,arg12,arg13)
if pswasonboss64==nil then
	pswasonboss64=1
end
psunitisplayer(guid2,name2)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss64~=2 then
		psiccwipereport_3("wipe", "try")
	end
		addtotwotables(name2)
		vezaxsort1()
		if psraidoptionson[1][6][4][1]==1 and pswasonboss64==1 then
      --репорт тока если в теч 2 сек не было репорта
      if pshagaradelayrep==nil then
        pshagaradelayrep={{},{}} --ник, время
      end
      local bil=0
      if #pshagaradelayrep[1]>0 then
        for i=1,#pshagaradelayrep[1] do
          if pshagaradelayrep[1][i]==name2 then
            if GetTime()<pshagaradelayrep[2][i]+2 then
              bil=1
              pshagaradelayrep[2][i]=GetTime()
            else
              bil=2 --будем репортить
              pshagaradelayrep[2][i]=GetTime()
            end
          end
        end
      end
      if bil==0 then
        table.insert(pshagaradelayrep[1],name2)
        table.insert(pshagaradelayrep[2],GetTime())
      end
      if bil~=1 then
        if UnitSex(name2) and UnitSex(name2)==3 then
          pszapuskanonsa(psraidchats3[psraidoptionschat[1][6][4][1]], "{rt8} "..psnoservername(name2).." "..psmainmgotinf.." |s4id105314|id!")
        else
          pszapuskanonsa(psraidchats3[psraidoptionschat[1][6][4][1]], "{rt8} "..psnoservername(name2).." "..psmainmgotinm.." |s4id105314|id!")
        end
      end
		end

    local tt2=", "..psdamageceil(arg12)
    if arg13>=0 then
      tt2=", "..psdamageceil(arg12-arg13).." |cffff0000("..psoverkill..": "..psdamageceil(arg13)..")|r"
    end

		pscaststartinfo(0,spellname..": "..psaddcolortxt(1,name2)..name2..psaddcolortxt(2,name2)..tt2, -1, "id1", 1, "|s4id"..spellid.."|id - "..psinfo,psbossnames[1][6][4],2)

end
end

function pscmrboss642(guid2,name2,spellname,spellid,arg12,arg13)
if pswasonboss64==nil then
	pswasonboss64=1
end
psunitisplayer(guid2,name2)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss64~=2 then
		psiccwipereport_3("wipe", "try")
	end
		addtotwotables2(name2)
		vezaxsort2()
		if psraidoptionson[1][6][4][2]==1 and pswasonboss64==1 then
			if UnitSex(name2) and UnitSex(name2)==3 then
				pszapuskanonsa(psraidchats3[psraidoptionschat[1][6][4][2]], "{rt8} "..psnoservername(name2).." "..psmainmgotinf.." |s4id69425|id!")
			else
				pszapuskanonsa(psraidchats3[psraidoptionschat[1][6][4][2]], "{rt8} "..psnoservername(name2).." "..psmainmgotinm.." |s4id69425|id!")
			end
		end

    local tt2=", "..psdamageceil(arg12)
    if arg13>=0 then
      tt2=", "..psdamageceil(arg12-arg13).." |cffff0000("..psoverkill..": "..psdamageceil(arg13)..")|r"
    end

		pscaststartinfo(0,spellname..": "..psaddcolortxt(1,name2)..name2..psaddcolortxt(2,name2)..tt2, -1, "id1", 2, "|s4id"..spellid.."|id - "..psinfo,psbossnames[1][6][4],2)
end
end

function pscmrboss643(guid2,name2,spellname,spellid,arg12)
if pswasonboss64==nil then
	pswasonboss64=1
end
psunitisplayer(guid2,name2)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss64~=2 then
		psiccwipereport_3("wipe", "try")
	end
		addtotwotables3(name2)
		vezaxsort3()
		if psraidoptionson[1][6][4][6]==1 and pswasonboss64==1 then
			if UnitSex(name2) and UnitSex(name2)==3 then
				pszapuskanonsa(psraidchats3[psraidoptionschat[1][6][4][6]], "{rt8} "..psnoservername(name2).." "..psmainmgotinf.." |s4id"..spellid.."|id!")
			else
				pszapuskanonsa(psraidchats3[psraidoptionschat[1][6][4][6]], "{rt8} "..psnoservername(name2).." "..psmainmgotinm.." |s4id"..spellid.."|id!")
			end
		end

		pscaststartinfo(0,spellname..": "..psaddcolortxt(1,name2)..name2..psaddcolortxt(2,name2).." > "..psdamageceil(arg12), -1, "id1", 4, "|s4id"..spellid.."|id - "..psinfo,psbossnames[1][6][4],2)

end
end


function pshagaradispeledgo(name2,name1,arg13,couse)
for i=1,#pshagarazvez1 do
  if pshagarazvez1[i] and pshagarazvez1[i]==name2 and (couse==nil or (couse and pshagarazvez3[i]~=0)) then
    local timee=GetTime()-pshagarazvez2[i]
    timee=math.ceil(timee*10)/10
      local die=""
      if pshagarazvez4[i]==1 then
        die=" (|cffff0000"..psdied.."|r)"
      end
      local kupol=""
      local sp2=GetSpellInfo(110317)
      if psspelldebkupol1 and #psspelldebkupol1>0 then
        for k=1,#psspelldebkupol1 do
          if psspelldebkupol1[k] and psspelldebkupol1[k]==name2 then
            local kumtm=GetTime()-psspelldebkupol2[k]
            kumtm=math.ceil(kumtm*10)/10
            kupol=" "..sp2..": "..kumtm.." "..pssec
          end
        end
      end
      if string.len(kupol)<3 then
        kupol=". |cffff0000"..format(pszzdragbuffnotfound,sp2).."|r"
        --нет купола но был диспел! пишем тут причину в чат......
        pscheckwipe1()
        if pswipetrue and pswasonboss64~=2 then
          psiccwipereport_3("wipe", "try")
        end
        if psraidoptionson[1][6][4][8]==1 and pswasonboss64==1 then --couse
          local pname1=psnoservername(name1)
          pszapuskanonsa(psraidchats3[psraidoptionschat[1][6][4][9]], "{rt8} "..psnoservername(name2).." > "..format(pszzdragbuffnotfound2,pname1).." |s4id109325|id: "..timee.." "..pssec)
        end
      end
    local abd=""
    if couse then
      abd=", "..couse
    end
    pscaststartinfo(0,arg13..": "..psaddcolortxt(1,pshagarazvez1[i])..pshagarazvez1[i]..psaddcolortxt(2,pshagarazvez1[i])..die.." ("..psaddcolortxt(1,name1)..name1..psaddcolortxt(2,name1)..abd..", "..timee.." "..pssec..")"..kupol, -1, "id1", 5, "|s4id109325|id - "..psdispellinfo,psbossnames[1][6][4],2)
    table.remove(pshagarazvez1,i)
    table.remove(pshagarazvez2,i)
    table.remove(pshagarazvez3,i)
    table.remove(pshagarazvez4,i)
  end
end
end


function pscmrbossREPORT641(wipe,try,reset,checkforwipe)
if reset==nil then
if checkforwipe==nil or (checkforwipe and pswasonboss64 and pswasonboss64==1) then

	if pswasonboss64==1 then
		pssetcrossbeforereport1=GetTime()
		if psraidoptionson[1][6][4][3]==1 then
			strochkavezcrash=psmainmdamagefrom.." |s4id105314|id ("..psmainmtotal.."): "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][6][4][3]], true, vezaxname, vezaxcrash, 1)
		end
		if psraidoptionson[1][6][4][4]==1 then
			strochkavezcrash=psmainmdamagefrom.." |s4id69425|id ("..psmainmtotal.."): "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][6][4][4]], true, vezaxname2, vezaxcrash2, 1)
		end
		if psraidoptionson[1][6][4][7]==1 then
			strochkavezcrash=psmainmdamagefrom.." |s4id109563,109564,109565,109566|id ("..psmainmtotal.."): "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][6][4][7]], true, vezaxname3, vezaxcrash3, 1)
		end
		


	end
	if pswasonboss64==1 or (pswasonboss64==2 and try==nil) then

		psiccsavinginf(psbossnames[1][6][4], try, pswasonboss64)

		strochkavezcrash=psmainmdamagefrom.." |s4id105314|id: "
		reportafterboitwotab("raid", true, vezaxname, vezaxcrash, nil, nil,0,1)
		strochkavezcrash=psmainmdamagefrom.." |s4id69425|id: "
		reportafterboitwotab("raid", true, vezaxname2, vezaxcrash2, nil, nil,0,1)
		strochkavezcrash=psmainmdamagefrom.." |s4id109563,109564,109565,109566|id: "
		reportafterboitwotab("raid", true, vezaxname3, vezaxcrash3, nil, nil,0,1)
		

		psiccrefsvin()

	end




	if wipe then
		pswasonboss64=2
		pscheckbossincombatmcr_3=GetTime()+1
	end
end
end
end


function pscmrbossRESET641(wipe,try,reset,checkforwipe)
if reset or wipe==nil then
pswasonboss64=nil
table.wipe(vezaxname)
table.wipe(vezaxcrash)
table.wipe(vezaxname2)
table.wipe(vezaxcrash2)
table.wipe(vezaxname3)
table.wipe(vezaxcrash3)
pshagaradeblance1=nil
pshagaradeblance2=nil
pshagaradeblance3=nil
pshagarazvez1=nil
pshagarazvez2=nil
pshagarazvez3=nil
pshagarazvez4=nil
psspelldebkupol1=nil
psspelldebkupol2=nil
end
end


function pscombatlogboss64(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)

--для героика сторм пиллара сей анонсер ыытест
--сейанонсеры
if arg2=="SPELL_CAST_SUCCESS" and (spellid==109541) then
if ps_saoptions[1][6][4][1]==1 then
  ps_sa_checktargets(GetTime()+0.17,guid1,0.2,spellname.." "..psmain_sa_phrase1,3,0)
end
end
if arg2=="SPELL_AURA_APPLIED" and (spellid==109325) then
if ps_saoptions[1][6][4][2]==1 then
  ps_sa_sendinfo(name2, spellname.." "..psmain_sa_phrase1, 5, nil, nil)
end
end

if arg2=="SPELL_DAMAGE" and spellid==105314 then
pscmrboss641(guid2,name2,spellname,spellid,arg12,arg13)
end

if arg2=="SPELL_DAMAGE" and spellid==69425 then
pscmrboss642(guid2,name2,spellname,spellid,arg12,arg13)
end

if (arg2=="SPELL_AURA_APPLIED_DOSE" or arg2=="SPELL_AURA_APPLIED") and (spellid==107062 or spellid==107063 or spellid==105313 or spellid==105316) then
local aarg13=0
	if arg2=="SPELL_AURA_APPLIED" then
		aarg13=1
	else
		aarg13=arg13
	end
if pshagaradeblance1==nil then
	pshagaradeblance1={} --names
	pshagaradeblance2={} --stacks
	pshagaradeblance3={} --time
end
local bil=0
if #pshagaradeblance1>0 then
	for i=1,#pshagaradeblance1 do
		if pshagaradeblance1[i]==name2 then
			pshagaradeblance2[i]=aarg13
			pshagaradeblance3[i]=GetTime()
			bil=1
		end
	end
end
if bil==0 then
	table.insert(pshagaradeblance1,name2)
	table.insert(pshagaradeblance2,aarg13)
	local ttm=GetTime()
	table.insert(pshagaradeblance3,ttm)
end

end

if arg2=="SPELL_DAMAGE" and (spellid==107062 or spellid==107063 or spellid==105313 or spellid==105316) and arg13>=0 and pshagaradeblance1 and #pshagaradeblance1>0 then
for i=1,#pshagaradeblance1 do
	if pshagaradeblance1[i] and pshagaradeblance1[i]==name2 then
		if GetTime()<pshagaradeblance3[i]+4.5 then
			--репорт
			if psraidoptionson[1][6][4][5]==1 and pswasonboss64==1 then
				pszapuskanonsa(psraidchats3[psraidoptionschat[1][6][4][5]], "{rt8} "..psnoservername(name2).." "..psmainmdiedfrom.." |s4id"..spellid.."|id ("..arg12.." "..psulhp..", "..psoverkill..": "..arg13..", "..psstacks..": "..pshagaradeblance2[i]..")")
			end
			pscaststartinfo(0,spellname..": "..psaddcolortxt(1,name2)..name2..psaddcolortxt(2,name2).." "..psmainmdiedfrom.." "..spellname.." ("..arg12.." "..psulhp..", "..psoverkill..": "..arg13..", "..psstacks..": "..pshagaradeblance2[i]..")", -1, "id1", 3, "|s4id"..spellid.."|id - "..psinfo,psbossnames[1][6][4],2)
		end
		table.remove(pshagaradeblance1,i)
		table.remove(pshagaradeblance2,i)
		table.remove(pshagaradeblance3,i)
	end
end
end


if arg2=="SPELL_DAMAGE" and (spellid==109566 or spellid==109565 or spellid==109564 or spellid==109563) then
pscmrboss643(guid2,name2,spellname,spellid,arg12)
end


if arg2=="SPELL_AURA_APPLIED" and spellid==109325 then
if pshagarazvez1==nil then
  pshagarazvez1={} --на ком дебафф
  pshagarazvez2={} --когда повесился
  pshagarazvez3={} --когда снялся (но через 1 сек репорт)
  pshagarazvez4={} --игрок умер
end
if pswasonboss64==nil then
	pswasonboss64=1
end
if #pshagarazvez1>0 then
  for i=1,#pshagarazvez1 do
    if pshagarazvez1[i] and pshagarazvez1[i]==name2 then
      local timee=GetTime()-pshagarazvez2[i]
      timee=math.ceil(timee*10)/10
      local die=""
      if pshagarazvez4[i]==1 then
        die=" (|cffff0000"..psdied.."|r)"
      end
      local kupol=""
      if psspelldebkupol1 and #psspelldebkupol1>0 then
        for k=1,#psspelldebkupol1 do
          if psspelldebkupol1[k] and psspelldebkupol1[k]==name2 then
            local kumtm=GetTime()-psspelldebkupol2[k]
            kumtm=math.ceil(kumtm*10)/10
            local sp2=GetSpellInfo(110317)
            kupol=" "..sp2..": "..kumtm.." "..pssec
          end
        end
      end
      pscaststartinfo(0,spellname..": "..psaddcolortxt(1,pshagarazvez1[i])..pshagarazvez1[i]..psaddcolortxt(2,pshagarazvez1[i])..die.." (|cffff0000"..psiccunknown.."|r, "..timee.." "..pssec..")"..kupol, -1, "id1", 5, "|s4id"..spellid.."|id - "..psdispellinfo,psbossnames[1][6][4],2)
      table.remove(pshagarazvez1,i)
      table.remove(pshagarazvez2,i)
      table.remove(pshagarazvez3,i)
      table.remove(pshagarazvez4,i)
    end
  end
end
table.insert(pshagarazvez1,name2)
local tm=GetTime()
table.insert(pshagarazvez2,tm)
table.insert(pshagarazvez3,0)
table.insert(pshagarazvez4,0)
end


if arg2=="SPELL_AURA_REMOVED" and spellid==109325 and pshagarazvez1 and #pshagarazvez1>0 then
for i=1,#pshagarazvez1 do
  if pshagarazvez1[i]==name2 then
    pshagarazvez3[i]=GetTime()
  end
end
end


--разные диспелы
if arg2=="SPELL_DISPEL" and spellid==109325 and pshagarazvez1 and #pshagarazvez1>0 then
  pshagaradispeledgo(name2,name1,arg13)
end

if arg2=="SPELL_AURA_APPLIED" and (spellid==1044 or spellid==45438 or spellid==642 or spellid==768 or spellid==24858 or spellid==783 or spellid==5487) and pshagarazvez1 and #pshagarazvez1>0 then
  local fdfsfs=GetSpellInfo(109325)
  pshagaradispeledgo(name2,name1,fdfsfs,spellname)
end

if arg2=="SPELL_AURA_REMOVED" and (spellid==768 or spellid==24858 or spellid==783 or spellid==5487) and pshagarazvez1 and #pshagarazvez1>0 then
  local fdfsfs=GetSpellInfo(109325)
  pshagaradispeledgo(name2,name1,fdfsfs,spellname)
end


if arg2=="SPELL_AURA_APPLIED" and spellid==110317 then
if psspelldebkupol1==nil then
  psspelldebkupol1={} --на ком купол
  psspelldebkupol2={} --время наложения
end
local bil=0
if #psspelldebkupol1>0 then
  for i=1,#psspelldebkupol1 do
    if psspelldebkupol1[i]==name2 then
      psspelldebkupol2[i]=GetTime()
      bil=1
    end
  end
end
if bil==0 then
  table.insert(psspelldebkupol1,name2)
  local tm=GetTime()
  table.insert(psspelldebkupol2,tm)
end
end

if arg2=="SPELL_AURA_REMOVED" and spellid==110317 and psspelldebkupol1 and #psspelldebkupol1>0 then
  for i=1,#psspelldebkupol1 do
    if psspelldebkupol1[i] and psspelldebkupol1[i]==name2 then
      table.remove(psspelldebkupol1,i)
      table.remove(psspelldebkupol2,i)
    end
  end
end

--проверка на смерть под дебафом И под куполом
if pshagarazvez1 and #pshagarazvez1>0 then

if (arg2=="DAMAGE_SHIELD" or arg2=="SPELL_PERIODIC_DAMAGE" or arg2=="SPELL_DAMAGE" or arg2=="RANGE_DAMAGE") and arg13 and arg13>=0 then
local bil=0
local timecup=0
for i=1,#pshagarazvez1 do
  if pshagarazvez1[i] and pshagarazvez1[i]==name2 then
    pshagarazvez4[i]=1
    bil=1
  end
end
if psspelldebkupol1 and #psspelldebkupol1>0 then
  for i=1,#psspelldebkupol1 do
    if psspelldebkupol1[i] and psspelldebkupol1[i]==name2 and bil==1 then
      bil=2
      timecup=GetTime()-psspelldebkupol2[i]
      timecup=math.ceil(timecup*10)/10
    end
  end
end

--если в обоих табл репорт сразу
if bil==2 then
  for i=1,#pshagarazvez1 do
    if pshagarazvez1[i] and pshagarazvez1[i]==name2 then
      local timee=GetTime()-pshagarazvez2[i]
      timee=math.ceil(timee*10)/10
      local sp=GetSpellInfo(109325)
      local sp2=GetSpellInfo(110317)
      local die=" (|cffff0000"..psdied.."|r)"
      if timecup==0 then
        timecup="?"
      end
      pscaststartinfo(0,sp..": "..psaddcolortxt(1,pshagarazvez1[i])..pshagarazvez1[i]..psaddcolortxt(2,pshagarazvez1[i])..die.." "..sp..": "..timee.." "..pssec..". "..sp2..": "..timecup.." "..pssec, -1, "id1", 5, "|s4id109325|id - "..psdispellinfo,psbossnames[1][6][4],2)
	pscheckwipe1()
	if pswipetrue and pswasonboss64~=2 then
		psiccwipereport_3("wipe", "try")
	end
      if psraidoptionson[1][6][4][9]==1 and pswasonboss64==1 then
        pszapuskanonsa(psraidchats3[psraidoptionschat[1][6][4][9]], "{rt8} "..psnoservername(name2).." "..psdied.."! |s4id109325|id: "..timee.." "..pssec.." + |s4id110317|id: "..timecup.." "..pssec)
      end
      table.remove(pshagarazvez1,i)
      table.remove(pshagarazvez2,i)
      table.remove(pshagarazvez3,i)
      table.remove(pshagarazvez4,i)
    end
  end
end

end

if arg2=="SWING_DAMAGE" and spellname and spellname>=0 then
local bil=0
local timecup=0
for i=1,#pshagarazvez1 do
  if pshagarazvez1[i] and pshagarazvez1[i]==name2 then
    pshagarazvez4[i]=1
    bil=1
  end
end
if psspelldebkupol1 and #psspelldebkupol1>0 then
  for i=1,#psspelldebkupol1 do
    if psspelldebkupol1[i] and psspelldebkupol1[i]==name2 and bil==1 then
      bil=2
      timecup=GetTime()-psspelldebkupol2[i]
      timecup=math.ceil(timecup*10)/10
    end
  end
end

--если в обоих табл репорт сразу
if bil==2 then
  for i=1,#pshagarazvez1 do
    if pshagarazvez1[i] and pshagarazvez1[i]==name2 then
      local timee=GetTime()-pshagarazvez2[i]
      timee=math.ceil(timee*10)/10
      local sp=GetSpellInfo(109325)
      local sp2=GetSpellInfo(110317)
      local die=" (|cffff0000"..psdied.."|r)"
      if timecup==0 then
        timecup="?"
      end
      pscaststartinfo(0,sp..": "..psaddcolortxt(1,pshagarazvez1[i])..pshagarazvez1[i]..psaddcolortxt(2,pshagarazvez1[i])..die.." "..sp..": "..timee.." "..pssec..". "..sp2..": "..timecup.." "..pssec, -1, "id1", 5, "|s4id109325|id - "..psdispellinfo,psbossnames[1][6][4],2)
	pscheckwipe1()
	if pswipetrue and pswasonboss64~=2 then
		psiccwipereport_3("wipe", "try")
	end
      if psraidoptionson[1][6][4][9]==1 and pswasonboss64==1 then
        pszapuskanonsa(psraidchats3[psraidoptionschat[1][6][4][9]], "{rt8} "..psnoservername(name2).." "..psdied.."! |s4id109325|id: "..timee.." "..pssec.." + |s4id110317|id: "..timecup.." "..pssec)
      end
      table.remove(pshagarazvez1,i)
      table.remove(pshagarazvez2,i)
      table.remove(pshagarazvez3,i)
      table.remove(pshagarazvez4,i)
    end
  end
end
end

end -- конец только для урона под дебафами и куполом




end