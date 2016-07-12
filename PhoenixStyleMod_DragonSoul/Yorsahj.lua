psbossfile63=1

psingorthishealspells={52042,98021,53652,85673,633,33110,15290,94289,109828} --spell id to ignor them

function pscmrboss631(guid2,name2,spellname,arg12,name1)
if pswasonboss63==nil then
	pswasonboss63=1
end
psunitisplayer(guid2,name2)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss63~=2 then
		psiccwipereport_3("wipe", "try")
	end
		addtotridamagetables(name1, arg12, 1)
		psdamagetritablsort1()

end
end




function pscmrbossREPORT631(wipe,try,reset,checkforwipe)
if reset==nil then
if checkforwipe==nil or (checkforwipe and pswasonboss63 and pswasonboss63==1) then

	if pswasonboss63==1 then
		pssetcrossbeforereport1=GetTime()
		--if psraidoptionson[1][6][3][2]==1 then
		--	strochkavezcrash=psmainmgot.." |s4id99837|id ("..psmainmtotal.."): "
		--	reportafterboitwotab(psraidchats3[psraidoptionschat[1][6][3][2]], true, vezaxname, vezaxcrash, 1)
		--end


			--не использовать этот вывод в других сообщ
			strochkadamageout=psdidfriendlyf.." |s4id109390,108347,108348,108349|id: "
			reportfromtridamagetables(psraidchats3[psraidoptionschat[1][6][3][1]],nil,1,true)



	end
	if pswasonboss63==1 or (pswasonboss63==2 and try==nil) then

		psiccsavinginf(psbossnames[1][6][3], try, pswasonboss63)

		--не использовать этот вывод в других сообщ
		strochkadamageout=psdidfriendlyf.." |s4id109390,108347,108348,108349|id: "
		reportfromtridamagetables("raid",nil,1,true,0,1)
		--


		psiccrefsvin()

	end




	if wipe then
		pswasonboss63=2
		pscheckbossincombatmcr_3=GetTime()+1
	end
end
end
end


function pscmrbossRESET631(wipe,try,reset,checkforwipe)
if reset or wipe==nil then
pswasonboss63=nil
pstrackmanavoid=nil
table.wipe(psdamagename)
table.wipe(psdamagevalue)
table.wipe(psdamageraz)
psyorshdebfiol1=nil
psyorshdebfiol2=nil
psyorshdebfiol3=nil
psyorshdebfiol4=nil
psyorshdebfiol5=nil
psyorshdebfiol6=nil
psyorshdebfiol7=nil
psyorshdebfiol8=nil
psdrakmaxHPadd4=nil
psiccschet2=0
end
end


function pscombatlogboss63(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)



if arg2=="SPELL_DAMAGE" and (spellid==109390 or spellid==108347 or spellid==108348 or spellid==108349 or spellid==105173) then
if UnitGUID("boss1") then
local id=psGetUnitID(UnitGUID("boss1"))
  if id==55312 then
    pscmrboss631(guid2,name2,spellname,arg12,name1)
  end
end
end




--вешается
if (arg2=="SPELL_AURA_APPLIED" or arg2=="SPELL_AURA_REFRESH") and (spellid==105171 or spellid==108220 or spellid==103628 or spellid==109389) and UnitGUID("boss1") then
--ник на кого, время, время снятия 0, кто лечил, чем лечил, скока налечил, абсорбы
if psyorshdebfiol1==nil then
  psyorshdebfiol1={} --ник на ком
  psyorshdebfiol2={} --время наложения (макс 30 сек)
  psyorshdebfiol3={} --время снятия, 0 по умолчанию
  psyorshdebfiol4={} --табл, кто лечил
  psyorshdebfiol5={} --табл, чем лечил
  psyorshdebfiol6={} --табл, скока налечил чистого
  psyorshdebfiol7={} --табл скока налечил избыточного
  psyorshdebfiol8={} --абсорбы НЕ табл
end
if #psyorshdebfiol1>0 then
  for i=1,#psyorshdebfiol1 do
    if psyorshdebfiol1[i] and psyorshdebfiol1[i]==name2 then
      if psyorshdebfiol3[i]==0 or GetTime()-psyorshdebfiol3[i]>2 then
      table.remove(psyorshdebfiol1,i)
      table.remove(psyorshdebfiol2,i)
      table.remove(psyorshdebfiol3,i)
      table.remove(psyorshdebfiol4,i)
      table.remove(psyorshdebfiol5,i)
      table.remove(psyorshdebfiol6,i)
      table.remove(psyorshdebfiol7,i)
      table.remove(psyorshdebfiol8,i)
      end
    end
  end
end
table.insert(psyorshdebfiol1,name2)
local t=GetTime()
table.insert(psyorshdebfiol2,t)
table.insert(psyorshdebfiol3,0)
table.insert(psyorshdebfiol4,{})
table.insert(psyorshdebfiol5,{})
table.insert(psyorshdebfiol6,{})
table.insert(psyorshdebfiol7,{})
table.insert(psyorshdebfiol8,0)

end

if arg2=="SPELL_AURA_REMOVED" and (spellid==105171 or spellid==108220 or spellid==103628 or spellid==109389) and UnitGUID("boss1") then
--снимается
if psyorshdebfiol1 and #psyorshdebfiol1>0 then
  for i=1,#psyorshdebfiol1 do
    if psyorshdebfiol1[i]==name2 then
      if psyorshdebfiol3[i]==0 then
        psyorshdebfiol3[i]=GetTime()
      end
    end
  end
end
end

if arg2=="SPELL_DAMAGE" and (spellid==108347 or spellid==105173 or spellid==108348 or spellid==108349 or spellid==109390) and UnitGUID("boss1") then
--урон прошел, если есть таблица с инфой и прошло не более 1.5 сек после снятия = репорт, или 0
if psyorshdebfiol1 and #psyorshdebfiol1>0 then
  local done=0
  local i=1
  while i<=#psyorshdebfiol1 do
    if psyorshdebfiol1[i] and psyorshdebfiol1[i]==name1 then
      if psyorshdebfiol3[i]==0 or GetTime()-psyorshdebfiol3[i]<1.7 then
        --готовим репорт
        local t1=GetTime()-psyorshdebfiol2[i]
        if psyorshdebfiol3[i]>0 then
          t1=psyorshdebfiol3[i]-psyorshdebfiol2[i]
        end
        t1=math.ceil(t1*10)/10
        local t2=psyorshdebfiol8[i]
        if t2>0 then
          t2="|cffff0000"..psabsorb..": "..t2..".|r "
        else
          t2=""
        end
        local t3=""--лечение
        if psyorshdebfiol8[i] then
          local need=5-psyorshdebfiol8[i]
          if need<0 then
            need=0
          end
          t3=pshealing.." ("..#psyorshdebfiol4[i].." "..psofforyorsahj.." "..need.."): "
          --ыытест тут для ЛФР сделаю только счетчик по никам
          if #psyorshdebfiol4[i]>0 then
            for j=1,#psyorshdebfiol4[i] do
              local qu=psyorshdebfiol6[i][j]
              if (string.len(qu)) > 3 then
                qu=string.sub(qu, 1, string.len(qu)-3)
                qu=qu.."k"
              end
              if psyorshdebfiol7[i][j]>0 then
                local ou=psyorshdebfiol7[i][j]
                if (string.len(ou)) > 3 then
                  ou=string.sub(ou, 1, string.len(ou)-3)
                  ou=ou.."k"
                end
                qu=qu.." + "..psoverhealed..": "..ou
              end
              t3=t3..psaddcolortxt(1,psyorshdebfiol4[i][j])..psyorshdebfiol4[i][j]..psaddcolortxt(2,psyorshdebfiol4[i][j]).." ("..psyorshdebfiol5[i][j]..", "..qu..")"
              if j~=#psyorshdebfiol4[i] then
                t3=t3..", "
              end
            end
          else
            t3=t3.."|cffff0000"..psiccunknown.."|r"
          end
        end
        local text=psexplosion.." > "..psaddcolortxt(1,psyorshdebfiol1[i])..psyorshdebfiol1[i]..psaddcolortxt(2,psyorshdebfiol1[i]).." ("..t1.." "..pssec.."). "..t2..t3
        --ВЫВОД ИНФО
        pscaststartinfo(0,text, -1, "id1", 46, "|s4id"..spellid.."|id - "..psinfo,psbossnames[1][6][3],2)
        done=1
      end
      table.remove(psyorshdebfiol1,i)
      table.remove(psyorshdebfiol2,i)
      table.remove(psyorshdebfiol3,i)
      table.remove(psyorshdebfiol4,i)
      table.remove(psyorshdebfiol5,i)
      table.remove(psyorshdebfiol6,i)
      table.remove(psyorshdebfiol7,i)
      table.remove(psyorshdebfiol8,i)
      i=i-1
      if done==1 then
        i=10000
      end
    end
    i=i+1
  end
end


end

if psyorshdebfiol1 and arg2=="SPELL_HEAL" then
  if #psyorshdebfiol1>0 then
    local bil=0
    for i=1,#psyorshdebfiol1 do
      if psyorshdebfiol1[i]==name2 and psyorshdebfiol3[i]==0 then
        bil=i
      end
    end
    if bil>0 then
      --отсеиваем игнор список хил штук
      local bil2=0
      if #psingorthishealspells>0 then
      for i=1,#psingorthishealspells do
        if spellid==psingorthishealspells[i] then
          bil2=1
        end
      end
      end
      if bil2==0 then
        --запись хила в табл
        table.insert(psyorshdebfiol4[bil],name1)
        table.insert(psyorshdebfiol5[bil],spellname)
        local m=arg12-arg13
        table.insert(psyorshdebfiol6[bil],m)
        table.insert(psyorshdebfiol7[bil],arg13)
      end
    end
  end
end

if psyorshdebfiol1 and ((arg2=="SPELL_MISSED" and arg12=="MISS") or (arg2=="SWING_MISSED" and spellid=="MISS")) then
  if #psyorshdebfiol1>0 then
    local bil=0
    for i=1,#psyorshdebfiol1 do
      if psyorshdebfiol1[i]==name2 and psyorshdebfiol3[i]==0 then
        bil=i
      end
    end
    if bil>0 then
      psyorshdebfiol8[bil]=psyorshdebfiol8[bil]+1
    end
  end
end



-- 10% в манавойд
if arg2=="SPELL_CAST_SUCCESS" and spellid==105530 then
pstrackmanavoid=1
if pswasonboss63==nil then
	pswasonboss63=1
end
end


if pstrackmanavoid then
--тут трекерим весь урон... в мана войд

if arg2=="DAMAGE_SHIELD" or arg2=="SPELL_PERIODIC_DAMAGE" or arg2=="SPELL_DAMAGE" or arg2=="RANGE_DAMAGE" then
if arg12 then
local id=psGetUnitID(guid2)
if id==56231 then
psdraknamedamageadd4=name2
local source=psgetpetownername(guid1, name1, flag1)
psdrakadddamage(4,source,guid2,arg12,arg13,spellid) --4 tip reporta
end
end
end


if arg2=="SWING_DAMAGE" then
if spellid then
local id=psGetUnitID(guid2)
if id==56231 then
psdraknamedamageadd4=name2
local source=psgetpetownername(guid1, name1, flag1)
psdrakadddamage(4,source,guid2,spellid,spellname,0)
end
end
end


--смерть войда
if arg2=="SPELL_CAST_SUCCESS" and (spellid==105539 or spellid==108228 or spellid==110742) then
	local id=psGetUnitID(guid1)
	if id==56231 then
      --изменение текста
        if #pssidamageinf_title2[pssavedplayerpos][1]>0 then
          for ii=1,#psdragontabldamage1[1] do
            if psdragontabldamage1[1][ii]==guid1 then
              pssidamageinf_title2[pssavedplayerpos][1][ii]=pssidamageinf_title2[pssavedplayerpos][1][ii].." - "..psdied
            end
          end
        end
	end
end



end --pstrackmanavoid


end