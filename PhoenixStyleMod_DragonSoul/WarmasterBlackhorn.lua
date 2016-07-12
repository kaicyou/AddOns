psbossfile66=1
function pscmrboss661(guid2,name2,spellname,spellid,arg12,arg13)
if pswasonboss66==nil then
	pswasonboss66=1
end
psunitisplayer(guid2,name2)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss66~=2 then
		psiccwipereport_3("wipe", "try")
	end
		addtotwotables(name2)
		vezaxsort1()

    local tt2=", "..psdamageceil(arg12)
    if arg13>=0 then
      tt2=", "..psdamageceil(arg12-arg13).." |cffff0000("..psoverkill..": "..psdamageceil(arg13)..")|r"
    end
		pscaststartinfo(0,spellname..": "..psaddcolortxt(1,name2)..name2..psaddcolortxt(2,name2)..tt2, -1, "id1", 1, "|s4id"..spellid.."|id - "..psinfo,psbossnames[1][6][6],2)

end
end

function pscmrboss662(guid2,name2,spellname,bil,quant,spellid)
if pswasonboss66==nil then
	pswasonboss66=1
end
psunitisplayer(guid2,name2)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss66~=2 then
		psiccwipereport_3("wipe", "try")
	end
    --if bil==1 then
      addtotwotables2(name2)
      vezaxsort2()
    --end
    local txt=" |cff00ff00(< ??? "..pssec..")|r"
    if bil==1 then
      txt=" |cffff0000(> 2 "..pssec..")|r"
    end
    if quant==0 then
      quant="?"
    end
		pscaststartinfo(0,spellname.." #"..quant..": "..psaddcolortxt(1,name2)..name2..psaddcolortxt(2,name2)..txt, -1, "id1", 2, "|s4id"..spellid.."|id - "..psinfo,psbossnames[1][6][6],2)
end
end

function pscmrboss663(guid2,name2,spellname,spellid)
if pswasonboss66==nil then
	pswasonboss66=1
end
psunitisplayer(guid2,name2)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss66~=2 then
		psiccwipereport_3("wipe", "try")
	end
		addtotwotables3(name2)
		vezaxsort3()

  if psraidoptionson[1][6][6][7]==1 then
		pscaststartinfo(0,spellname..": "..psaddcolortxt(1,name2)..name2..psaddcolortxt(2,name2), -1, "id1", 3, "|s4id"..spellid.."|id - "..psinfo,psbossnames[1][6][6],2)
  end

end
end

function pscmrboss664(guid2,name2,spellname,spellid)
if pswasonboss66==nil then
	pswasonboss66=1
end
psunitisplayer(guid2,name2)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss66~=2 then
		psiccwipereport_3("wipe", "try")
	end
		addtotwotables4(name2)
		vezaxsort4()

  --pscaststartinfo(0,spellname..": "..psaddcolortxt(1,name2)..name2..psaddcolortxt(2,name2), -1, "id1", 4, "|s4id"..spellid.."|id - "..psinfo,psbossnames[1][6][6],2)

end
end


--репорт об килле на героике
function psblackhornkilled(arg12,arg13,name2,spellname,spellid)
local sta=0
for i=1,#psstackblackhorn1 do
	if psstackblackhorn1[i]==name2 and GetTime()<psstackblackhorn3[i] then
		sta=psstackblackhorn2[i]
	end
end

if sta>0 then

	local sst=""

	sst=", |s4id"..pswarmastbhstid.."|id "..psstacks..": "..sta

local ddrf=arg12-arg13
ddrf=psdamageceil(ddrf)
if psraidoptionson[1][6][6][4]==1 and pswasonboss66==1 then
	pszapuskanonsa(psraidchats3[psraidoptionschat[1][6][6][4]], "{rt8} "..psnoservername(name2).." "..psmainmdiedfrom.." |s4id"..spellid.."|id ("..ddrf.." "..psulhp..", "..psoverkill..": "..arg13..sst..")")
end

local b1=GetSpellInfo(pswarmastbhstid)
sst=", "..b1.." "..psstacks..": "..sta
local a1=GetSpellInfo(107589)
local a2=GetSpellInfo(107501)
pscaststartinfo(0,psaddcolortxt(1,name2)..name2..psaddcolortxt(2,name2).." |cffff0000"..psmainmdiedfrom.." "..spellname.." ("..ddrf.." "..psulhp..", "..psoverkill..": "..arg13..sst..")|r", -1, "id1", 74, "|s4id107589|id & |s4id107501|id - "..psinfo,psbossnames[1][6][6],2)

end--if sta>0 then

end


function pscmrbossREPORT661(wipe,try,reset,checkforwipe)
if reset==nil then
if checkforwipe==nil or (checkforwipe and pswasonboss66 and pswasonboss66==1) then

	if pswasonboss66==1 then
		pssetcrossbeforereport1=GetTime()
		
		--print ("репорт")

		if psraidoptionson[1][6][6][1]==1 then
			strochkavezcrash=psmainmdamagefrom.." |s4id108046|id ("..psmainmtotal.."): "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][6][6][1]], true, vezaxname, vezaxcrash, 1)
		end
		if psraidoptionson[1][6][6][2]==1 then
			strochkavezcrash=psmainmdamagefrom.." |s4id108076,109222,109223,109224|id: "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][6][6][2]], true, vezaxname2, vezaxcrash2, 1)
		end
		if psraidoptionson[1][6][6][3]==1 then
			strochkavezcrash=psmainmdamagefrom.." |s4id110095|id ("..psmainmtotal.."): "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][6][6][3]], true, vezaxname3, vezaxcrash3, 1)
		end
		if psraidoptionson[1][6][6][8]==1 then
			strochkavezcrash=psmainmdamagefrom.." |s4id107595,109013,109014,109015|id ("..psmainmtotal.."): "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][6][6][8]], true, vezaxname4, vezaxcrash4, 1)
		end
		
		--print ("репорт отправлен")


	end
	if pswasonboss66==1 or (pswasonboss66==2 and try==nil) then
	
    --print ("сохраняю")

		psiccsavinginf(psbossnames[1][6][6], try, pswasonboss66)

		strochkavezcrash=psmainmdamagefrom.." |s4id108046|id ("..psmainmtotal.."): "
		reportafterboitwotab("raid", true, vezaxname, vezaxcrash, nil, nil,0,1)
		strochkavezcrash=psmainmdamagefrom.." |s4id108076,109222,109223,109224|id: "
		reportafterboitwotab("raid", true, vezaxname2, vezaxcrash2, nil, nil,0,1)
		strochkavezcrash=psmainmdamagefrom.." |s4id110095|id ("..psmainmtotal.."): "
		reportafterboitwotab("raid", true, vezaxname3, vezaxcrash3, nil, nil,0,1)
		strochkavezcrash=psmainmdamagefrom.." |s4id107595,109013,109014,109015|id ("..psmainmtotal.."): "
		reportafterboitwotab("raid", true, vezaxname4, vezaxcrash4, nil, nil,0,1)

    --print ("сохранил")

		psiccrefsvin()

	end




	if wipe then
		pswasonboss66=2
		pscheckbossincombatmcr_3=GetTime()+1
		--print ("ожидаю вайп для резета")
		--print ("") --ыытест в основном файле тоже резеты наклепал
	end
end
end
end


function pscmrbossRESET661(wipe,try,reset,checkforwipe)

--print ("вход в функцию резета")

if reset or wipe==nil then

--print ("резетю")

pswasonboss66=nil
table.wipe(vezaxname)
table.wipe(vezaxcrash)
table.wipe(vezaxname2)
table.wipe(vezaxcrash2)
table.wipe(vezaxname3)
table.wipe(vezaxcrash3)
table.wipe(vezaxname4)
table.wipe(vezaxcrash4)
psstackblackhorn1=nil
psstackblackhorn2=nil
psstackblackhorn3=nil
pscircl1=nil
pscircl2=nil
psiccschet1=0
psiccschet2=0
psiccschet3=0
end
end


function pscombatlogboss66(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)

--вешаем метку на сапера после инвиза
if arg2=="SPELL_AURA_APPLIED" and spellid==107752 and IsRaidOfficer() then
  pswarmastermarksapper1=GetTime()+1
  pswarmastermarksapper2=GetTime()
  pswarmastermarksapper3=guid1
end

if arg2=="SPELL_DAMAGE" and spellid==108046 then
pscmrboss661(guid2,name2,spellname,spellid,arg12,arg13)
end


if arg2=="SPELL_SUMMON" and (spellid==105580 or spellid==150611 or spellid==108050 or spellid==108051 or spellid==108053 or spellid==109216 or spellid==109217 or spellid==109218 or spellid==109341 or spellid==109681 or spellid==109682) then
if pswasonboss66==nil then
	pswasonboss66=1
end
if pscircl1==nil then
pscircl1={} --id
pscircl2={} --time
end
pscaststartinfo(0,pssummon..": "..name2.." #"..(#pscircl1+1), -1, "id1", 2, "|s4id"..spellid.."|id - "..psinfo,psbossnames[1][6][6],2)
table.insert(pscircl1,guid2)
local aa=GetTime()
table.insert(pscircl2,aa)
end


if arg2=="SPELL_DAMAGE" and pscircl1 and (spellid==108076 or spellid==109222 or spellid==109223 or spellid==109224) then
local bil=0
local quant=0
for i=1,#pscircl1 do
  if pscircl1[i]==guid1 then
    if GetTime()>pscircl2[i]+2 then
      bil=1
    end
    quant=i
  end
end
pscmrboss662(guid2,name2,spellname,bil,quant,spellid)
end

if arg2=="SPELL_DAMAGE" and spellid==110095 then
pscmrboss663(guid2,name2,spellname,spellid)
end

--натиск клинка
if arg2=="SPELL_DAMAGE" and (spellid==109013 or spellid==109014 or spellid==109015 or spellid==107595) then
pscmrboss664(guid2,name2,spellname,spellid)
end


--трек каутерауза
if arg2=="SPELL_AURA_APPLIED" and spellid==87023 then
  if pswarmmagelove1==nil then
    pswarmmagelove1={} --ник
    pswarmmagelove2={} --время юза
  end
  local bil=0
  if psluzhincomb1 and #psluzhincomb1>0 then
    for i=1,#psluzhincomb1 do
      if name1==psluzhincomb1[i] then
        psluzhincomb4[i]=spellname
        bil=1
      end
    end
  end
  if psluzhincomm1 and #psluzhincomm1>0 then
    for i=1,#psluzhincomm1 do
      if name1==psluzhincomm1[i] then
        psluzhincomm6[i]=spellname
        bil=1
      end
    end
  end
  if bil==0 then
    if #pswarmmagelove1>0 then
      for i=1,#pswarmmagelove1 do
        if name1==pswarmmagelove1[i] then
          pswarmmagelove2[i]=GetTime()
          bil=1
        end
      end
    end
    if bil==0 then
      table.insert(pswarmmagelove1,name1)
      local tm=GetTime()
      table.insert(pswarmmagelove2,tm)
    end
  end
end

--лужи инфо онли --большие
if (arg2=="SPELL_DAMAGE" or arg2=="SPELL_MISSED") and (spellid==107589 or spellid==107586 or spellid==107927 or spellid==106401 or spellid==108862 or spellid==109226 or spellid==109227) then
if pswasonboss66==nil then
	pswasonboss66=1
end
psspellwarmluzb=spellname
if psluzhincomb1==nil then
	psluzhincomb1={}--кого ударила
	psluzhincomb2=0--нанесено урона общего
	psluzhincomb3=GetTime()+1.5 --таймер до резета
	psluzhincomb4={}--миссы, смерти тут!
	psluzhincomb5={} --damage only to boat
	psiccschet1=psiccschet1+1 --номер лужи
end
table.insert(psluzhincomb1,name2)
if arg2=="SPELL_DAMAGE" then
psluzhincomb2=psluzhincomb2+arg12
end
if arg2=="SPELL_MISSED" and arg12 and arg12=="MISS" then
  table.insert(psluzhincomb4,"miss")
elseif arg13 and arg13>=0 then
  table.insert(psluzhincomb4,psdied)
else
  local buu=0
  if pswarmmagelove1 and #pswarmmagelove1>0 then
    for j=1,#pswarmmagelove1 do
      if pswarmmagelove1[j]==name2 and pswarmmagelove2[j]+1>GetTime() then
        buu=1
      end
    end
  end
  if buu==0 then
    table.insert(psluzhincomb4,"0")
  else
    local ad=GetSpellInfo(87023)
    table.insert(psluzhincomb4,ad)
  end
end
local id=psGetUnitID(guid2)
if id==56598 or (arg13 and arg13>=0) then
  local asd=arg12-arg13
	table.insert(psluzhincomb5,asd)
else
	table.insert(psluzhincomb5,0)
end
if arg2=="SPELL_DAMAGE" and arg13 and arg13>=0 and psstackblackhorn1 and #psstackblackhorn1>0 then
psblackhornkilled(arg12,arg13,name2,spellname,spellid)
end
end

if (arg2=="SPELL_DAMAGE" or arg2=="SPELL_MISSED") and (spellid==107501 or spellid==107287 or spellid==107439 or spellid==109203 or spellid==109204 or spellid==109205) then
if pswasonboss66==nil then
	pswasonboss66=1
end
psspellwarmluzm=spellname
if psluzhincomm1==nil then
	psluzhincomm1={}--кого ударила
	psluzhincomm2={}--нанесено урона общего
	psluzhincomm3={} --таймер до резета
	psluzhincomm4={} --Ид дракона что бьет
	psluzhincomm5={} --номер лужи
	psluzhincomm6={} --умер, или мисс
	psluzhincomm7={} --damage only to boat
end
local bil=0
if #psluzhincomm4>0 then
  for i=1,#psluzhincomm4 do
    if psluzhincomm4[i]==guid1 then
      table.insert(psluzhincomm1[i],name2)
      if arg2=="SPELL_DAMAGE" then
        psluzhincomm2[i]=psluzhincomm2[i]+arg12
      end
      if arg2=="SPELL_MISSED" and arg12 and arg12=="MISS" then
        table.insert(psluzhincomm6[i],"miss")
      elseif arg13 and arg13>=0 then
        table.insert(psluzhincomm6[i],psdied)
      else
        local buu=0
        if pswarmmagelove1 and #pswarmmagelove1>0 then
          for j=1,#pswarmmagelove1 do
            if pswarmmagelove1[j]==name2 and pswarmmagelove2[j]+1>GetTime() then
              buu=1
            end
          end
        end
        if buu==0 then
          table.insert(psluzhincomm6[i],"0")
        else
          local ad=GetSpellInfo(87023)
          table.insert(psluzhincomm6[i],ad)
        end
      end
	local id=psGetUnitID(guid2)
	if id==56598 or (arg13 and arg13>=0) then
    local asd=arg12-arg13
		table.insert(psluzhincomm7[i],asd)
	else
		table.insert(psluzhincomm7[i],0)
	end
      bil=i
    end
  end
end
if bil==0 then
  table.insert(psluzhincomm1,{})
  table.insert(psluzhincomm1[#psluzhincomm1],name2)
  table.insert(psluzhincomm2,0)
  local tmm=GetTime()+1.5
  table.insert(psluzhincomm3,tmm)
  table.insert(psluzhincomm4,guid1)
  psiccschet2=psiccschet2+1
  table.insert(psluzhincomm5,psiccschet2)
  table.insert(psluzhincomm6,{})
  table.insert(psluzhincomm7,{})
      if arg2=="SPELL_MISSED" and arg12 and arg12=="MISS" then
        table.insert(psluzhincomm6[#psluzhincomm6],"miss")
      elseif arg13 and arg13>=0 then
        table.insert(psluzhincomm6[#psluzhincomm6],psdied)
      else
        local buu=0
        if pswarmmagelove1 and #pswarmmagelove1>0 then
          for j=1,#pswarmmagelove1 do
            if pswarmmagelove1[j]==name2 and pswarmmagelove2[j]+1>GetTime() then
              buu=1
            end
          end
        end
        if buu==0 then
          table.insert(psluzhincomm6[#psluzhincomm6],"0")
        else
          local ad=GetSpellInfo(87023)
          table.insert(psluzhincomm6[#psluzhincomm6],ad)
        end
      end
	local id=psGetUnitID(guid2)
	if id==56598 or (arg13 and arg13>=0) then
    local asd=arg12-arg13
		table.insert(psluzhincomm7[#psluzhincomm7],asd)
	else
		table.insert(psluzhincomm7[#psluzhincomm7],0)
	end
  if arg2=="SPELL_DAMAGE" then
    psluzhincomm2[#psluzhincomm2]=psluzhincomm2[#psluzhincomm2]+arg12
  end

end


if arg2=="SPELL_DAMAGE" and arg13 and arg13>=0 and psstackblackhorn1 and #psstackblackhorn1>0 then
psblackhornkilled(arg12,arg13,name2,spellname,spellid)
end
end


--сейанонсер
if arg2=="SPELL_CAST_START" and (spellid==108046) then
if ps_saoptions[1][6][6][1]==1 then
ps_sa_checktargets(GetTime()+0.1,guid1,0.1,spellname.." "..psmain_sa_phrase1,3,0)
end
end


--стаки при взрыве лужи:
if ((arg2=="SPELL_AURA_APPLIED_DOSE" or arg2=="SPELL_AURA_APPLIED") and (spellid==109204 or spellid==109205 or spellid==107439) and (select(3,GetInstanceInfo())==4 or select(3,GetInstanceInfo())==5)) then
pswarmastbhstid=spellid
  if psstackblackhorn1==nil then
    psstackblackhorn1={} --ник
    psstackblackhorn2={} --дебафов
    psstackblackhorn3={} --время ОКОНЧАНИЯ
  end
  local bil=0
  if arg2=="SPELL_AURA_APPLIED_DOSE" and arg13 then
    bil=arg13
  else
    bil=1
  end
  local time=7
  if select(3,GetInstanceInfo())==5 then
    time=16
  end

  local ok=0
  if #psstackblackhorn1>0 then
    for i=1,#psstackblackhorn1 do
      if psstackblackhorn1[i]==name2 then
        psstackblackhorn2[i]=bil
        psstackblackhorn3[i]=GetTime()+time
        ok=1
      end
    end
  end
  if ok==0 then
    table.insert(psstackblackhorn1,name2)
    table.insert(psstackblackhorn2,bil)
    table.insert(psstackblackhorn3,GetTime()+time)
  end

end

if arg2=="SPELL_AURA_REMOVED" and (spellid==109204 or spellid==109205 or spellid==107439) and (select(3,GetInstanceInfo())==4 or select(3,GetInstanceInfo())==5) and psstackblackhorn1 and #psstackblackhorn1>0 then
	for i=1,#psstackblackhorn1 do
		if psstackblackhorn1[i] and psstackblackhorn1[i]==name2 then
			table.remove(psstackblackhorn1,i)
			table.remove(psstackblackhorn2,i)
			table.remove(psstackblackhorn3,i)
		end
	end
end


--взрыв сапера
if arg2=="SPELL_DAMAGE" and spellid==107518 then
	local a1=GetSpellInfo(107589)
	local a2=GetSpellInfo(107501)
	pscaststartinfo(0,"|cffff0000"..name1.." > "..spellname.." - "..psdamageceil(arg12).." > "..name2.."|r", -1, "id1", 74, "|s4id107589|id & |s4id107501|id - "..psinfo,psbossnames[1][6][6],2)
end


end