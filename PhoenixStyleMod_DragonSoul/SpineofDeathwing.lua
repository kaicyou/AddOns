psbossfile67=1
function pscmrboss671(guid1,name1,arg14)
if pswasonboss67==nil then
	pswasonboss67=1
end
	pscheckwipe1()
	if pswipetrue and pswasonboss67~=2 then
		psiccwipereport_3("wipe", "try")
	end
		addtotridamagetables(name1, arg14, 0)
		psdamagetritablsort1()

end


function psadddamagetobreakstunspine(name1,arg12,bil,direkt)
local ok=0
if #psspinestanwhokick9[bil]>0 then
  for i=1,#psspinestanwhokick9[bil] do
    if psspinestanwhokick9[bil][i]==name1 then
      ok=1
      psspinestanwhokick10[bil][i]=psspinestanwhokick10[bil][i]+arg12
      if direkt==1 then
        psspinestanwhokick102[bil][i]=psspinestanwhokick102[bil][i]+1
      end
    end
  end
end
if ok==0 then
  table.insert(psspinestanwhokick9[bil],name1)
  table.insert(psspinestanwhokick10[bil],arg12)
  if direkt==1 then
    table.insert(psspinestanwhokick102[bil],1)
  else
    table.insert(psspinestanwhokick102[bil],0)
  end
end

--вносим урон в общую переменную
if psspinestanwhokick13[bil]==1 or (psspinestanwhokick13[bil]==0 and psspinestanwhokick5[bil]==0) then
  psspinestanwhokick11[bil]=psspinestanwhokick11[bil]+arg12
elseif (psspinestanwhokick13[bil]==0 and psspinestanwhokick5[bil]~=0) then
  psspinestanwhokick12[bil]=psspinestanwhokick12[bil]+arg12
end

local vzxnn=#psspinestanwhokick9[bil]
while vzxnn>1 do
if psspinestanwhokick10[bil][vzxnn]>psspinestanwhokick10[bil][vzxnn-1] then
local vezaxtemp1=psspinestanwhokick10[bil][vzxnn-1]
local vezaxtemp2=psspinestanwhokick9[bil][vzxnn-1]
local vezaxtemp3=psspinestanwhokick102[bil][vzxnn-1]
psspinestanwhokick10[bil][vzxnn-1]=psspinestanwhokick10[bil][vzxnn]
psspinestanwhokick9[bil][vzxnn-1]=psspinestanwhokick9[bil][vzxnn]
psspinestanwhokick102[bil][vzxnn-1]=psspinestanwhokick102[bil][vzxnn]
psspinestanwhokick10[bil][vzxnn]=vezaxtemp1
psspinestanwhokick9[bil][vzxnn]=vezaxtemp2
psspinestanwhokick102[bil][vzxnn]=vezaxtemp3
end
vzxnn=vzxnn-1
end

end

function psspineaddhealpart(name1,arg12,bil)
local ok=0
if #psspinehealcountevery8[bil]>0 then
  for i=1,#psspinehealcountevery8[bil] do
    if psspinehealcountevery8[bil][i]==name1 then
      ok=1
      psspinehealcountevery9[bil][i]=psspinehealcountevery9[bil][i]+arg12
    end
  end
end
if ok==0 then
  table.insert(psspinehealcountevery8[bil],name1)
  table.insert(psspinehealcountevery9[bil],arg12)
end

local vzxnn=#psspinehealcountevery8[bil]
while vzxnn>1 do
if psspinehealcountevery9[bil][vzxnn]>psspinehealcountevery9[bil][vzxnn-1] then
local vezaxtemp1=psspinehealcountevery9[bil][vzxnn-1]
local vezaxtemp2=psspinehealcountevery8[bil][vzxnn-1]
psspinehealcountevery9[bil][vzxnn-1]=psspinehealcountevery9[bil][vzxnn]
psspinehealcountevery8[bil][vzxnn-1]=psspinehealcountevery8[bil][vzxnn]
psspinehealcountevery9[bil][vzxnn]=vezaxtemp1
psspinehealcountevery8[bil][vzxnn]=vezaxtemp2
end
vzxnn=vzxnn-1
end

end


function pscmrboss672(guid2,name2,spellname,arg12,arg13,spellid)
if pswasonboss67==nil then
	pswasonboss67=1
end
psunitisplayer(guid2,name2)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss67~=2 then
		psiccwipereport_3("wipe", "try")
	end
		addtotwotables(name2)
		vezaxsort1()
		
		local overkill=""
		if arg13 and arg13>=0 then
			overkill=" |cffff0000("..psoverkill..": "..psdamageceil(arg13)..")|r"
		end

		pscaststartinfo(0,spellname..": "..psaddcolortxt(1,name2)..name2..psaddcolortxt(2,name2)..", "..psdamageceil(arg12-arg13).." "..psulhp..overkill, -1, "id1", 1, "|s4id"..spellid.."|id - "..psinfo,psbossnames[1][6][7],2)

end
end



function pscmrbossREPORT671(wipe,try,reset,checkforwipe)
if reset==nil then
if checkforwipe==nil or (checkforwipe and pswasonboss67 and pswasonboss67==1) then

	if pswasonboss67==1 then
		pssetcrossbeforereport1=GetTime()

		if psraidoptionson[1][6][7][2]==1 then
			--не использовать этот вывод в других сообщ
			strochkadamageout=pszzdragotxtoptt672..": "
			reportfromtridamagetables(psraidchats3[psraidoptionschat[1][6][7][2]],nil,1,true,nil,nil,"no quantity")
    end
		if psraidoptionson[1][6][7][3]==1 then
			strochkavezcrash=psmainmdamagefrom.." |s4id105845|id ("..psmainmtotal.."): "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][6][7][3]], true, vezaxname, vezaxcrash, 1)
		end


	end
	if pswasonboss67==1 or (pswasonboss67==2 and try==nil) then

		psiccsavinginf(psbossnames[1][6][7], try, pswasonboss67)

			--не использовать этот вывод в других сообщ
			strochkadamageout=pszzdragotxtoptt672..": "
			reportfromtridamagetables("raid",nil,1,true,0,1,"no quantity")
      strochkavezcrash=psmainmdamagefrom.." |s4id105845|id ("..psmainmtotal.."): "
      reportafterboitwotab("raid", true, vezaxname, vezaxcrash, nil, nil,0,1)


		psiccrefsvin()

	end




	if wipe then
		pswasonboss67=2
		pscheckbossincombatmcr_3=GetTime()+1
	end
end
end
end


function pscmrbossRESET671(wipe,try,reset,checkforwipe)
if reset or wipe==nil then
pswasonboss67=nil
psspinedeathtr=nil
psdrakmaxHPadd1=nil
psdrakmaxHPadd2=nil
pstendomsactive=nil
table.wipe(vezaxname)
table.wipe(vezaxcrash)
table.wipe(vezaxname2)
table.wipe(vezaxcrash2)
psspinetababsorb=nil
table.wipe(psdamagename)
table.wipe(psdamagevalue)
table.wipe(psdamageraz)
psiccschet1=0
psiccschet2=0
psiccschet3=0
psiccschet4=0
psiccschet6=0
pscorruptstun1=nil
pscorruptstun2=nil
pscorruptstun3=nil
psdragontabldamage1=nil
psspinestanwhokick1=nil
psspinestanwhokick2=nil
psspinestanwhokick3=nil
psspinestanwhokick4=nil
psspinestanwhokick5=nil
psspinestanwhokick6=nil
psspinestanwhokick7=nil
psspinestanwhokick8=nil
psspinestanwhokick9=nil
psspinestanwhokick10=nil
psspinestanwhokick102=nil
psspinestanwhokick11=nil
psspinestanwhokick12=nil
psspinestanwhokick13=nil
psspinestanwhokick14=nil
psspinestanwhokick15=nil
psspinehealcountevery1=nil
psspinehealcountevery2=nil
psspinehealcountevery3=nil
psspinehealcountevery4=nil
psspinehealcountevery5=nil
psspinehealcountevery6=nil
psspinehealcountevery7=nil
psspinehealcountevery8=nil
psspinehealcountevery9=nil
psspinetrackblood=nil
pscoruptedbloodtab1=nil
pscoruptedbloodtab2=nil
pscoruptedbloodtab3=nil
end
end


function pscombatlogboss67(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)

if arg2=="SPELL_AURA_REFRESH" and (spellid==105479 or spellid==109362 or spellid==109363 or spellid==109364) then
  if psspinehealcountevery1 and #psspinehealcountevery1>0 and psraidoptionson[1][6][7][9]==1 then
    for i=1,#psspinehealcountevery1 do
      if psspinehealcountevery1[i]==name2 then
        psspinehealcountevery3[i]=guid1
        psspinehealcountevery4[i]=GetTime()
        psspinehealcountevery5[i]=0
        psspinehealcountevery6[i]=0
        psspinehealcountevery7[i]=0
        table.wipe(psspinehealcountevery8[i])
        table.wipe(psspinehealcountevery9[i])
      end
    end
  end
end

if arg2=="SPELL_AURA_REMOVED" and (spellid==105479 or spellid==109362 or spellid==109363 or spellid==109364) then
  if psspinehealcountevery1 and #psspinehealcountevery1>0 and psraidoptionson[1][6][7][9]==1 then
    for i=1,#psspinehealcountevery1 do
      if psspinehealcountevery1[i]==name2 then
        psspinehealcountevery5[i]=GetTime()+1
      end
    end
  end
end

if arg2=="SPELL_AURA_APPLIED" and (spellid==105479 or spellid==109362 or spellid==109363 or spellid==109364) then
--учет по каждому отдельно

if psraidoptionson[1][6][7][9]==1 then
  if psspinehealcountevery1==nil then
    psspellhealspine343=spellid
    psspellhealspine3432=name1
    psspinehealcountevery1={} --на ком дебаф имя
    psspinehealcountevery2={} --ГУИД игрока
    psspinehealcountevery3={} --ГУИД порчи адда
    psspinehealcountevery4={} --когда повесился
    psspinehealcountevery5={} --когда снялся + 1 сек
    psspinehealcountevery6={} --адд умер
    psspinehealcountevery7={} --игрок умер
    psspinehealcountevery8={} --ТАБЛИЦА, кто лечил
    psspinehealcountevery9={} --ТАБЛИЦА скока лечил
  end
  table.insert(psspinehealcountevery1,name2)
  table.insert(psspinehealcountevery2,guid2)
  table.insert(psspinehealcountevery3,guid1)
  local tm=GetTime()
  table.insert(psspinehealcountevery4,tm)
  table.insert(psspinehealcountevery5,0)
  table.insert(psspinehealcountevery6,0)
  table.insert(psspinehealcountevery7,0)
  table.insert(psspinehealcountevery8,{})
  table.insert(psspinehealcountevery9,{})
end


if psspinetababsorb==nil then
  psspinetababsorb={}
end
local bil=0
if #psspinetababsorb>0 then
  for i=1,#psspinetababsorb do
    if psspinetababsorb[i]==name2 then
      bil=1
    end
  end
end
if bil==0 then
  table.insert(psspinetababsorb,name2)
end
end

if (arg2=="SPELL_HEAL" or arg2=="SPELL_PERIODIC_HEAL") and arg14 and arg14>1 and psspinetababsorb then
  local source=psgetpetownername(guid1, name1, flag1)
  if spellid==98021 then
    source=psgetpetownername2(guid1, name1, flag1)
  end
  local bil=0
  if #psspinetababsorb>0 then
    for i=1,#psspinetababsorb do
      if psspinetababsorb[i]==name2 then
        bil=1
      end
    end
  end
  if bil==1 then
    pscmrboss671(guid1,source,arg14)
  end
  
  --отдельный счет
  if psspinehealcountevery2 and #psspinehealcountevery2>0 and psraidoptionson[1][6][7][9]==1 then
    local ok=0
    for i=1,#psspinehealcountevery2 do
      if psspinehealcountevery2[i]==guid2 and ok==0 then
        ok=i
      end
    end
    if ok>0 then
      psspineaddhealpart(source,arg14,ok)
    end
  end
end


if arg2=="SPELL_DAMAGE" and spellid==105845 then
pscmrboss672(guid2,name2,spellname,arg12,arg13,spellid)
end



--damage done trackers
if arg2=="UNIT_DIED" then
	local id=psGetUnitID(guid2)
	if id==53891 or id==56161 or id==56161 then
		psspinedeathtr=1
		if pswasonboss67==nil then
			pswasonboss67=1
		end
		if (psraidoptionson[1][6][7][6]==1 or psraidoptionson[1][6][7][8]==1) then
      psspinetrackblood=1
      pscoruptedbloodtab1={} --гуид
      pscoruptedbloodtab2={} --0 жива, 1 умерла, 2 воскресла
      pscoruptedbloodtab3={} --время смерти
    end
	end
end

if psspinedeathtr and psraidoptionson[1][6][7][4]==1 then
--тут трекерим весь урон... в аддов, и активация раскола брони

if arg2=="DAMAGE_SHIELD" or arg2=="SPELL_PERIODIC_DAMAGE" or arg2=="SPELL_DAMAGE" or arg2=="RANGE_DAMAGE" then
if arg12 then
local id=psGetUnitID(guid2)
if id==53890 then
  local no=0
  if psnuclearbahid and #psnuclearbahid>0 then
    for i=1,#psnuclearbahid do
      if psnuclearbahid[i]==guid2 then
        no=1
      end
    end
  end
  if no==0 then
    --получение инфо о хозяине если там пет, с учетом по маске
    local source=psgetpetownername(guid1, name1, flag1)
    psdraknamedamageadd1=name2
    psdrakadddamage(1,source,guid2,arg12,arg13,spellid) --1 tip reporta
  end
end
if (id==56341 or id==56575) and pstendomsactive then
  psdraknamedamageadd2=name2
  local source=psgetpetownername(guid1, name1, flag1)
  psdrakadddamage(2,source,guid2,arg12,arg13,spellid) --2 tip reporta
end
end
end


if arg2=="SWING_DAMAGE" then
if spellid then
local id=psGetUnitID(guid2)
if id==53890 then
  local no=0
  if psnuclearbahid and #psnuclearbahid>0 then
    for i=1,#psnuclearbahid do
      if psnuclearbahid[i]==guid2 then
        no=1
      end
    end
  end
  if no==0 then
    psdraknamedamageadd1=name2
    local source=psgetpetownername(guid1, name1, flag1)
    psdrakadddamage(1,source,guid2,spellid,spellname,0)
  end
end
if (id==56341 or id==56575) and pstendomsactive then
psdraknamedamageadd2=name2
local source=psgetpetownername(guid1, name1, flag1)
psdrakadddamage(2,source,guid2,spellid,spellname,0)
end
end
end

if arg2=="SPELL_CAST_START" and spellid==105845 then
if psnuclearbahid==nil then
  psnuclearbahid={}
end
table.insert(psnuclearbahid,guid1)
psyadernvzrivgo(guid1, spellname)
end

--смерть адда без взрыва
if arg2=="UNIT_DIED" then
	local id=psGetUnitID(guid2)
	if id==53890 then
    local bil=0
    if psnuclearbahid and #psnuclearbahid>0 then
      for i=1,#psnuclearbahid do
        if psnuclearbahid[i]==guid2 then
          bil=1
        end
      end
    end
    if bil==0 then
      --репорт
      --изменение текста
        if #pssidamageinf_title2[pssavedplayerpos][1]>0 then
          for ii=1,#psdragontabldamage1[1] do
            if psdragontabldamage1[1][ii]==guid2 then
              pssidamageinf_title2[pssavedplayerpos][1][ii]=pssidamageinf_title2[pssavedplayerpos][1][ii]..". "..pszzdragdiedtoquick
            end
          end
        end
      --репорт
      if psraidoptionson[1][6][7][5]==1 then
        local ar3=pssichose5 or 4
        if #pssidamageinf_title2[pssavedplayerpos][1]>0 then
          for ii=1,#psdragontabldamage1[1] do
            if psdragontabldamage1[1][ii]==guid2 then
              psdamagerep_3(psraidchats3[psraidoptionschat[1][6][7][5]],pssavedplayerpos,1,ii,ar3,1,2,1, false)
            end
          end
        end
      end
    end
	end
end



--тендонс появился!
if arg2=="SPELL_CAST_START" and (spellid==105847 or spellid==105848) then
psdrakmaxHPadd2=nil
psdraknamedamageadd2=name1
pstendomsactive=1
psdrakmodnewadd(2,nil,guid1,0,1)
local i=1
if pscorruptstun1 and #pscorruptstun1>0 then
	while i<=#pscorruptstun1 do
		if pscorruptstun1[i] and pscorruptstun3[i]>0 then
			table.remove(pscorruptstun1,i)
			table.remove(pscorruptstun2,i)
			table.remove(pscorruptstun3,i)
			i=i-1
		elseif pscorruptstun1[i] then
			pscorruptstun2[i]=GetTime()
		end
		i=i+1
	end
end
end

--2 евента конца боя с тендемс
if arg2=="UNIT_DIED" then
local id=psGetUnitID(guid2)
if (id==56341 or id==56575) then
	pstendomsactive=nil
	if psdelaytendowsdie==nil or (psdelaytendowsdie and GetTime()>psdelaytendowsdie+3) then
    psspinestunswrite(guid2,1)
	end
  psdelaytendowsdie=GetTime()
end
end

if arg2=="SPELL_AURA_APPLIED" and (spellid==105847 or spellid==105848) then
pstendomsactive=nil
if psdelaytendowsdie==nil or (psdelaytendowsdie and GetTime()>psdelaytendowsdie+3) then
  psspinestunswrite(guid2)
end
psdelaytendowsdie=GetTime()
end


--стан
if arg2=="SPELL_AURA_APPLIED" and (spellid==105490 or spellid==109457 or spellid==109458 or spellid==109459) then
psspinestanenamespell=spellname
if pscorruptstun1==nil then
	pscorruptstun1={} --кого станит, таблица!
	pscorruptstun2={} --начало стана
	pscorruptstun3={} --конец стана
end
table.insert(pscorruptstun1,name2)
table.insert(pscorruptstun2,GetTime())
table.insert(pscorruptstun3,0)
end

if arg2=="SPELL_AURA_REMOVED" and (spellid==105490 or spellid==109457 or spellid==109458 or spellid==109459) then
if pscorruptstun1 then
	for i=1,#pscorruptstun1 do
		if pscorruptstun1[i]==name2 and pscorruptstun3[i]==0 then
			pscorruptstun3[i]=GetTime()
		end
	end
end
end









end --конец трекера урона




--стан кто пытался его сбить и наносил урон
if arg2=="SPELL_AURA_APPLIED" and (spellid==105490 or spellid==109457 or spellid==109458 or spellid==109459) then
if psspinestanwhokick1==nil then
  pshvatkaspellname=spellid
  pshvatkaspellname2=name1
	psspinestanwhokick1={} --гуид щупальца
	psspinestanwhokick2={} --гуид игрока //ТАБЛИЦА
	psspinestanwhokick3={} --имя игрока //ТАБЛИЦА
	psspinestanwhokick4={} --когда начало станить
	psspinestanwhokick5={} --когда закончило станить (через 1 сек репорт)
	psspinestanwhokick6={} --щупальце умерло / 0
	psspinestanwhokick7={} --игрок умер / 0 // ТБАЛИЦА!
	psspinestanwhokick8={} --урон ПО игроку общий
	psspinestanwhokick9={} --ТАБЛИЦА урон игроков имена
  psspinestanwhokick10={} --ТАБЛИЦА урон игроков цифры
  psspinestanwhokick102={} --ТАБЛИЦА кол-во прямых атак (цифры)
  psspinestanwhokick11={} --урон по щупальцу в стан и фейл урон
  psspinestanwhokick12={} --урон по щупальцу за 1 сек после стана
  psspinestanwhokick13={} --тип трекера, 0 - во время стана, 1 - фейловый
  psspinestanwhokick14={} --номер хватки
  psspinestanwhokick15={} --ТАБЛИЦА, с игрока снялся дебафф 0 - есть, 1 снялся
  
  pscaststartinfo(0,pszzdragspineexamp, -1, "id1", 47, "|s4id"..pshvatkaspellname.."|id - "..psinfo,psbossnames[1][6][7],2)
  pscaststartinfo(0,"---", -1, "id1", 47, "|s4id"..pshvatkaspellname.."|id - "..psinfo,psbossnames[1][6][7],2)
end
local bil=0
if #psspinestanwhokick1>0 then
  for i=1,#psspinestanwhokick1 do
    if psspinestanwhokick1[i]==guid1 and GetTime()<psspinestanwhokick4[i]+12 then
      table.insert(psspinestanwhokick2[i],guid2)
      table.insert(psspinestanwhokick3[i],name2)
      table.insert(psspinestanwhokick7[i],0)
      table.insert(psspinestanwhokick15[i],0)
      bil=1
    elseif psspinestanwhokick1[i]==guid1 and GetTime()>psspinestanwhokick4[i]+12 then
      --ыытест ошибка
      pscaststartinfo(0,"|cffff0000Error in last Fiery Grip. It was deleted without report.|r", -1, "id1", 47, "|s4id"..pshvatkaspellname.."|id - "..psinfo,psbossnames[1][6][7],2)
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
    end
  end
end
if bil==0 then
psiccschet4=psiccschet4+1
table.insert(psspinestanwhokick1,guid1)
table.insert(psspinestanwhokick2,{})
table.insert(psspinestanwhokick2[#psspinestanwhokick2],guid2)
table.insert(psspinestanwhokick3,{})
table.insert(psspinestanwhokick3[#psspinestanwhokick3],name2)
local tm=GetTime()
table.insert(psspinestanwhokick4,tm)
table.insert(psspinestanwhokick5,0)
table.insert(psspinestanwhokick6,0)
table.insert(psspinestanwhokick7,{})
table.insert(psspinestanwhokick7[#psspinestanwhokick7],0)
table.insert(psspinestanwhokick8,0)
table.insert(psspinestanwhokick9,{})
table.insert(psspinestanwhokick10,{})
table.insert(psspinestanwhokick102,{})
table.insert(psspinestanwhokick11,0)
table.insert(psspinestanwhokick12,0)
table.insert(psspinestanwhokick13,0)
table.insert(psspinestanwhokick14,psiccschet4)
table.insert(psspinestanwhokick15,{})
table.insert(psspinestanwhokick15[#psspinestanwhokick15],0)
end
end

if arg2=="SPELL_AURA_REMOVED" and (spellid==105490 or spellid==109457 or spellid==109458 or spellid==109459) then
if psspinestanwhokick1 and #psspinestanwhokick1>0 then
  for i=1,#psspinestanwhokick1 do
    if psspinestanwhokick1[i]==guid1 then
      for j=1,#psspinestanwhokick2[i] do
        if psspinestanwhokick2[i][j]==guid2 then
          psspinestanwhokick15[i][j]=1
        end
      end
      local allrem=1
      for j=1,#psspinestanwhokick15[i] do
        if psspinestanwhokick15[i][j]==0 then
          allrem=0
        end
      end
      if allrem==1 then
        psspinestanwhokick5[i]=GetTime()+1
      end
    end
  end
end
    --if psspinestanwhokick1[i]==guid1 and psspinestanwhokick2[i]==guid2 then
    --  psspinestanwhokick5[i]=GetTime()+1
    --end
end


if arg2=="UNIT_DIED" then
  if psspinestanwhokick1 and #psspinestanwhokick1>0 then
    for i=1,#psspinestanwhokick1 do
      if psspinestanwhokick1[i]==guid2 then
        psspinestanwhokick6[i]=GetTime()
      end
      for j=1,#psspinestanwhokick2[i] do
        if psspinestanwhokick2[i][j]==guid2 then
          psspinestanwhokick7[i][j]=GetTime()
        end
      end
      --if psspinestanwhokick2[i]==guid2 then
      --  psspinestanwhokick7[i]=GetTime()
      --end
    end
  end
  
  if psspinehealcountevery1 and #psspinehealcountevery1>0 and psraidoptionson[1][6][7][9]==1 then
    for i=1,#psspinehealcountevery1 do
      if psspinehealcountevery2[i]==guid2 then
        psspinehealcountevery7[i]=GetTime()
      end
      if psspinehealcountevery3[i]==guid2 then
        psspinehealcountevery6[i]=GetTime()
      end
    end
  end
end



--урон по щупальцам для сбития стана --ПЕТЫ СЧИТАЮТСЯ ОТДЕЛЬНО

if psspinestanwhokick1 and #psspinestanwhokick1>0 then

if arg2=="DAMAGE_SHIELD" or arg2=="SPELL_PERIODIC_DAMAGE" or arg2=="SPELL_DAMAGE" or arg2=="RANGE_DAMAGE" then
if arg12 then
local bil=0
for i=1,#psspinestanwhokick1 do
  if psspinestanwhokick1[i]==guid2 then
    bil=i
  end
end
if bil>0 then
local source=psgetpetownername2(guid1, name1, flag1)
local direkt=0
if arg2=="SPELL_DAMAGE" or arg2=="RANGE_DAMAGE" then
  direkt=1
end
psadddamagetobreakstunspine(source,arg12,bil,direkt)
end
end
end


if arg2=="SWING_DAMAGE" then
if spellid then
local bil=0
for i=1,#psspinestanwhokick1 do
  if psspinestanwhokick1[i]==guid2 then
    bil=i
  end
end
if bil>0 then
local source=psgetpetownername2(guid1, name1, flag1)
psadddamagetobreakstunspine(source,spellid,bil,1)
end
end
end

end --конец урон по щупальцам для сбития стана


--трекерить живую кровь
if psspinetrackblood then

local bil=0
if guid1 and (spellid==nil or (spellid~=105248)) then
  local id=psGetUnitID(guid1)
  if id==53889 then
  psspinebloodname=name1
    bil=1
    if #pscoruptedbloodtab1>0 then
      for i=1,#pscoruptedbloodtab1 do
        if pscoruptedbloodtab1[i]==guid1 then
          if pscoruptedbloodtab2[i]==0 or pscoruptedbloodtab2[i]==2 then
            bil=2 --уже есть
          end
          if pscoruptedbloodtab2[i]==1 then
            if pscoruptedbloodtab3[i]~=0 and GetTime()>pscoruptedbloodtab3[i]+7 then
              bil=2
              pscoruptedbloodtab2[i]=2
              psiccschet5=psiccschet5-1
              if psiccschet5<0 then
                psiccschet5=0
              end
              psiccschet6=psiccschet6-1
              if psiccschet6<0 then
                psiccschet6=0
              end
              if psraidoptionson[1][6][7][8]==1 and psiccschet5<25 and psiccschet5~=0 and psiccschet6<20 then
                psreportbloodgo()
              end
            else
              bil=2
            end
          end
        end
      end
    end
    if bil==1 then
      table.insert(pscoruptedbloodtab1,guid1)
      table.insert(pscoruptedbloodtab2,0)
      table.insert(pscoruptedbloodtab3,0)
      bil=3 --добавил новую
    end
  end
end
if guid2 and (spellid==nil or (spellid~=105248)) and bil==0 then
  local id=psGetUnitID(guid2)
  if id==53889 then
    psspinebloodname=name2
    bil=1
    if #pscoruptedbloodtab1>0 then
      for i=1,#pscoruptedbloodtab1 do
        if pscoruptedbloodtab1[i]==guid2 then
            bil=2 --уже есть
        end
      end
    end
    if bil==1 then
      table.insert(pscoruptedbloodtab1,guid2)
      table.insert(pscoruptedbloodtab2,0)
      table.insert(pscoruptedbloodtab3,0)
      bil=3 --добавил новую
    end
    --урон оверкил в кровь
    if (arg13 and (arg2=="DAMAGE_SHIELD" or arg2=="SPELL_PERIODIC_DAMAGE" or arg2=="SPELL_DAMAGE" or arg2=="RANGE_DAMAGE") and arg13>=0) or (arg2=="SWING_DAMAGE" and spellname and spellname>=0) then
      for i=1,#pscoruptedbloodtab1 do
        if pscoruptedbloodtab1[i]==guid2 and (pscoruptedbloodtab2[i]==0 or pscoruptedbloodtab2[i]==2) then
          pscoruptedbloodtab2[i]=1
          pscoruptedbloodtab3[i]=GetTime()
          psiccschet5=psiccschet5+1
          psiccschet6=psiccschet6+1
          if psraidoptionson[1][6][7][8]==1 and psiccschet6<20 then
            psreportbloodgo()
          end
        end
      end
    end
  end
end

if bil==3 then
  if pslastbloodspineinsec==nil or (pslastbloodspineinsec and GetTime()>pslastbloodspineinsec+3) then --прошло более 3 сек с ласт репорта
    if psreportbloodspineinsec3==nil then
      psreportbloodspineinsec3=GetTime()-1
    end
  elseif pslastbloodspineinsec and GetTime()<=pslastbloodspineinsec+3 then
    if psreportbloodspineinsec3==nil then
      psreportbloodspineinsec3=GetTime()+(3-(GetTime()-pslastbloodspineinsec))
    end
  end
end

if arg2=="SPELL_CAST_SUCCESS" and (spellid==105219 or spellid==109371 or spellid==109372 or spellid==109373) then
      for i=1,#pscoruptedbloodtab1 do
        if pscoruptedbloodtab1[i]==guid1 and (pscoruptedbloodtab2[i]==0 or pscoruptedbloodtab2[i]==2) then
          pscoruptedbloodtab2[i]=1
          pscoruptedbloodtab3[i]=GetTime()
          psiccschet5=psiccschet5+1
          psiccschet6=psiccschet6+1
          if psraidoptionson[1][6][7][8]==1 and psiccschet6<20 then
            psreportbloodgo()
          end
        end
      end
end

if arg2=="SPELL_CAST_SUCCESS" and spellid==105248 then
psiccschet6=psiccschet6-1
if psraidoptionson[1][6][7][8]==1 and psiccschet6<20 then
  psreportbloodgo()
end
end



end
--конец по крови



end


function psreportbloodgo()
if (psdrabloodanoun2==nil or (psdrabloodanoun2 and GetTime()>psdrabloodanoun2+3)) and psdrabloodanoun==nil then
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
else
  if psdrabloodanoun==nil then
    psdrabloodanoun=GetTime()+3
  end
end
end