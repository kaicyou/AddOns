psbossfile62=1
function pscmrboss621(guid2,name2,spellname,arg12)
if pswasonboss62==nil then
	pswasonboss62=1
end
psunitisplayer(guid2,name2)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss62~=2 then
		psiccwipereport_3("wipe", "try")
	end
		addtotridamagetables(name2, 0, 1)
		psdamagetritablsort1()

		--запись ника на ожидание хила от него
		if psveztemp1==nil then
			psveztemp1={} --имя
			psveztemp2={} --time
			psveztemp3={} --damage received
		end

		local time=GetTime()
		table.insert(psveztemp1,name2)
		table.insert(psveztemp2,time)
		table.insert(psveztemp3,arg12)

		--запись ника в онкомбат репорт
		if pszononcomb1==nil then
			pszononcomb1={} --names
			pszononcomb2=GetTime()
			pszononcomb3=0
		end
		table.insert(pszononcomb1,name2)
		pszononcomb2=GetTime()
		pszononcomb3=0

end
end

function pscmrboss622(arg12,spellname,spellid)
if pswasonboss62==nil then
	pswasonboss62=1
end
		psiccschet3=psiccschet3+arg12
		
    --запись хила в онлайн репорт
    if pszononcomb3 then
      pszononcomb3=pszononcomb3+arg12
    end

		--получение ника от кого хил
		if psveztemp1 and #psveztemp1>0 then
			if psveztemp2[1]>GetTime()-2 then
				--мы нашли ник, делаем все что нада
				--высчитываем %
				local proc="?"
				if psveztemp3[1]>0 then
          proc=math.ceil((arg12/psveztemp3[1])*100)
          if proc>880 then
            proc="|cffff0000"..proc.."%%|r"
          else
            proc=proc.."|cff00ff00%%|r"
          end
        end
        if (pstempzonozznextheal==nil or (pstempzonozznextheal and GetTime()>pstempzonozznextheal+7)) then
          psiccschet4=psiccschet4+1
          pstempzonozznextheal=GetTime()
        end
        
				pscaststartinfo(0,spellname.." #"..psiccschet4..": "..psaddcolortxt(1,psveztemp1[1])..psveztemp1[1]..psaddcolortxt(2,psveztemp1[1]).." > "..psdamageceil(arg12).." "..psulhp..", "..proc.." ("..psdamagetr..": "..psdamageceil(psveztemp3[1])..")", -1, "id1", 2, "|s4id"..spellid.."|id - "..psinfo,psbossnames[1][6][2],2)
				addtotridamagetables(psveztemp1[1], arg12, 0)
				psdamagetritablsort1()

				--удаляем эти переменные с таблицы
				table.remove(psveztemp1,1)
				table.remove(psveztemp2,1)
				table.remove(psveztemp3,1)
			else
				local i=1
				while i<=#psveztemp1 do
					if psveztemp2[i] and psveztemp2[i]<GetTime()-2 then
						table.remove(psveztemp1,i)
						table.remove(psveztemp2,i)
						table.remove(psveztemp3,i)
						i=i-1
					end
				i=i+1
				end
				if psveztemp1 and #psveztemp1>0 then
					if psveztemp2[1]>GetTime()-2 then

						--мы нашли ник, делаем все что нада
				--высчитываем %
				local proc="?"
				if psveztemp3[1]>0 then
          proc=math.ceil((arg12/psveztemp3[1])*100)
          if proc>999 then
            proc="|cffff0000"..proc.."|r"
          end
          proc=proc.."|cff00ff00%%|r"
        end
        if (pstempzonozznextheal==nil or (pstempzonozznextheal and GetTime()>pstempzonozznextheal+7)) then
          psiccschet4=psiccschet4+1
          pstempzonozznextheal=GetTime()
        end
						pscaststartinfo(0,spellname.." #"..psiccschet4..": "..psaddcolortxt(1,psveztemp1[1])..psveztemp1[1]..psaddcolortxt(2,psveztemp1[1]).." > "..psdamageceil(arg12).." "..psulhp..", "..proc.." ("..psdamagetr..": "..psdamageceil(psveztemp3[1])..")", -1, "id1", 2, "|s4id"..spellid.."|id - "..psinfo,psbossnames[1][6][2],2)
						addtotridamagetables(psveztemp1[1], arg12, 0)
						psdamagetritablsort1()


						--удаляем эти переменные с таблицы
						table.remove(psveztemp1,1)
						table.remove(psveztemp2,1)
						table.remove(psveztemp3,1)

					end
				end
			end
		end



end




function pscmrbossREPORT621(wipe,try,reset,checkforwipe)
if reset==nil then
if checkforwipe==nil or (checkforwipe and pswasonboss62 and pswasonboss62==1) then

	if pswasonboss62==1 then
		pssetcrossbeforereport1=GetTime()

		if psraidoptionson[1][6][2][1]==1 and psiccschet3>0 then
			local he=psdamageceil(psiccschet3)

			--не использовать этот вывод в других сообщ
			strochkadamageout=psbosstr.." "..psmainmhealedhimself..": "..he.." "..psulhp..". "
			reportfromtridamagetables(psraidchats3[psraidoptionschat[1][6][2][1]],nil,1,true)
		end





	end
	if pswasonboss62==1 or (pswasonboss62==2 and try==nil) then

		psiccsavinginf(psbossnames[1][6][2], try, pswasonboss62)

			--1 вывод
			if psiccschet3>0 then
			local he=0

				he=psdamageceil(psiccschet3)


			--не использовать этот вывод в других сообщ
			strochkadamageout="|snpc"..psbosstr.."^55308|fnpc "..psmainmhealedhimself..": "..he.." "..psulhp..". "
			reportfromtridamagetables("raid",nil,1,true,0,1)
			end
			--


		psiccrefsvin()

	end




	if wipe then
		pswasonboss62=2
		pscheckbossincombatmcr_3=GetTime()+1
	end
end
end
end


function pscmrbossRESET621(wipe,try,reset,checkforwipe)
if reset or wipe==nil then
pswasonboss62=nil

if pszonozzdisp1 and #pszonozzdisp1>0 then
  for i=1,#pszonozzdisp1 do
    if pszonozzdisp1[i] and pszonozzdisp3[i] and pszonozzdisp3[i]>0 then
      local timee=pszonozzdisp3[i]-pszonozzdisp2[i]
      timee=math.ceil(timee*10)/10
      local timeevent=pszonozzdisp3[i]-pscombatstarttime
      local near10=""
      if pszonozzdisp4[i] and pszonozzdisp4[i]~="0" then
        near10=" "..pszonozzdisp4[i]
      end
      local spellname=GetSpellInfo(103434)
      local adddmg=""
      if pszonozzdisp5[i]>0 then
        adddmg=" "..pszzdragdamagetoplayer..": "..psdamageceil(pszonozzdisp5[i]).."."
      end
      pscaststartinfo(0,spellname..": "..psaddcolortxt(1,pszonozzdisp1[i])..pszonozzdisp1[i]..psaddcolortxt(2,pszonozzdisp1[i]).." (|cffff0000"..psiccunknown.."|r, "..timee.." "..pssec..")."..adddmg..near10, -1, "id1", 3, "|s4id103434|id - "..psdispellinfo,psbossnames[1][6][2],2,nil,nil,nil,nil,timeevent)
    end
  end
end


table.wipe(psdamagename)
table.wipe(psdamagevalue)
table.wipe(psdamageraz)
psiccschet3=0
psiccschet4=0
psveztemp1=nil
psveztemp2=nil
psveztemp3=nil
pszonozzdisp1=nil
pszonozzdisp2=nil
pszonozzdisp3=nil
pszonozzdisp4=nil
pszonozzdisp5=nil
pszonozzbufflast=nil
end
end


function pscombatlogboss62(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)



if arg2=="SPELL_DAMAGE" and (spellid==104322 or spellid==104323 or spellid==104608 or spellid==104606 or spellid==104607) then
pscmrboss621(guid2,name2,spellname,arg12)
end

if arg2=="SPELL_HEAL" and (spellid==104322 or spellid==104323 or spellid==104608 or spellid==104606 or spellid==104607) then
pscmrboss622(arg12,spellname,spellid)
end


--диспелы
if arg2=="SPELL_CAST_SUCCESS" and (spellid==103434 or spellid==104323 or spellid==104599 or spellid==104600 or spellid==104601) then
SetMapToCurrentZone()
--если переменные существуют - обрабатываем их
if pszonozzdisp1 and #pszonozzdisp1>0 then
  for i=1,#pszonozzdisp1 do
    if pszonozzdisp1[i] and pszonozzdisp3[i] and pszonozzdisp3[i]>0 then
      local timee=pszonozzdisp3[i]-pszonozzdisp2[i]
      timee=math.ceil(timee*10)/10
      local timeevent=pszonozzdisp3[i]-pscombatstarttime
      local near10=""
      if pszonozzdisp4[i] and pszonozzdisp4[i]~="0" then
        near10=" "..pszonozzdisp4[i]
      end
      local adddmg=""
      if pszonozzdisp5[i]>0 then
        adddmg=" "..pszzdragdamagetoplayer..": "..psdamageceil(pszonozzdisp5[i]).."."
      end
      pscaststartinfo(0,spellname..": "..psaddcolortxt(1,pszonozzdisp1[i])..pszonozzdisp1[i]..psaddcolortxt(2,pszonozzdisp1[i]).." (|cffff0000"..psiccunknown.."|r, "..timee.." "..pssec..")."..adddmg..near10, -1, "id1", 3, "|s4id"..spellid.."|id - "..psdispellinfo,psbossnames[1][6][2],2,nil,nil,nil,nil,timeevent)
    end
  end
end

--обнуляем все переменные
pszonozzdisp1={} --на кого дебафф
pszonozzdisp2={} --время наложения
pszonozzdisp3={} --время диспела
pszonozzdisp4={} --кто ближе 10 ярдов
pszonozzdisp5={} -- урон по игроку
table.wipe(pszonozzdisp1)
table.wipe(pszonozzdisp2)
table.wipe(pszonozzdisp3)
table.wipe(pszonozzdisp4)
table.wipe(pszonozzdisp5)
end

if arg2=="SPELL_PERIODIC_DAMAGE" and (spellid==103434 or spellid==104323 or spellid==104599 or spellid==104600 or spellid==104601) and pszonozzdisp1 then
if #pszonozzdisp1>0 then
  for i=1,#pszonozzdisp1 do
    if pszonozzdisp1[i]==name2 then
      pszonozzdisp5[i]=pszonozzdisp5[i]+arg12
    end
  end
end
end

if arg2=="SPELL_AURA_APPLIED" and (spellid==103434 or spellid==104323 or spellid==104599 or spellid==104600 or spellid==104601) and pszonozzdisp1 then
table.insert(pszonozzdisp1, name2)
local at=GetTime()
table.insert(pszonozzdisp2,at)
table.insert(pszonozzdisp3,-1)
table.insert(pszonozzdisp4,"0")
table.insert(pszonozzdisp5,0)

--сей анонсер
if psiccinst and string.find(psiccinst,psiccheroic) then
if ps_saoptions[1][6][2][1]==1 then
  ps_sa_sendinfo(name2, spellname.." "..psmain_sa_phrase1, 5, nil, nil)
end
end
end

if arg2=="SPELL_AURA_REMOVED" and (spellid==103434 or spellid==104323 or spellid==104599 or spellid==104600 or spellid==104601) and pszonozzdisp1 then
if pszonozzdisp1 and #pszonozzdisp1>0 then
  for i=1,#pszonozzdisp1 do
    if pszonozzdisp1[i]==name2 then
      local at=GetTime()
      pszonozzdisp3[i]=at
      --проверяем дистанцию всех рейдеров к игроку
      --с кого диспелили:
      local x2,y2=GetPlayerMapPosition(name2)
      
      --проверка дистанции ТОЛЬКо в героике
      if psiccinst and string.find(psiccinst,psiccheroic) then
      if x2 and y2 and x2>0 then
          for j=1,GetNumGroupMembers() do
            if UnitName("raid"..j) and UnitName("raid"..j)~=name2 then
              local x,y=GetPlayerMapPosition(UnitName("raid"..j))
              if x and y and x>0 then
    		        local dist=math.sqrt(math.pow((x-x2),2)+math.pow((y-y2),2))
				        --тест ярдов:
				        local yard=dist/0.0031929180940465
				        yard=math.ceil(yard*10)/10
				        if yard<=10 then
					        if UnitName("raid"..j) then
                    local a11=UnitName("raid"..j)
                    if pszonozzdisp4[i]=="0" then
                      pszonozzdisp4[i]=format(pstooclosepl,10).." "..psaddcolortxt(1,a11)..a11..psaddcolortxt(2,a11).." ("..yard..")"
                    else
                      pszonozzdisp4[i]=pszonozzdisp4[i]..", "..psaddcolortxt(1,a11)..a11..psaddcolortxt(2,a11).." ("..yard..")"
                    end
					        end
				        end
			        end
			      end
		       end
		     end
		   end
    end
  end
end
end

if arg2=="SPELL_DISPEL" and (spellid==103434 or spellid==104323 or spellid==104599 or spellid==104600 or spellid==104601) then
if pszonozzdisp1 and #pszonozzdisp1>0 then
  for i=1,#pszonozzdisp1 do
    if pszonozzdisp1[i] and pszonozzdisp1[i]==name2 then
      local timee=GetTime()-pszonozzdisp2[i]
      timee=math.ceil(timee*10)/10
      local near10=""
      if pszonozzdisp4[i] and pszonozzdisp4[i]~="0" then
        near10=" "..pszonozzdisp4[i]
      end
      local adddmg=""
      if pszonozzdisp5[i]>0 then
        adddmg=" "..pszzdragdamagetoplayer..": "..psdamageceil(pszonozzdisp5[i]).."."
      end
      pscaststartinfo(0,arg13..": "..psaddcolortxt(1,pszonozzdisp1[i])..pszonozzdisp1[i]..psaddcolortxt(2,pszonozzdisp1[i]).." ("..psaddcolortxt(1,name1)..name1..psaddcolortxt(2,name1)..", "..timee.." "..pssec..")."..adddmg..near10, -1, "id1", 3, "|s4id"..arg12.."|id - "..psdispellinfo,psbossnames[1][6][2],2)
      table.remove(pszonozzdisp1,i)
      table.remove(pszonozzdisp2,i)
      table.remove(pszonozzdisp3,i)
      table.remove(pszonozzdisp4,i)
      table.remove(pszonozzdisp5,i)
    end
  end
end
end


--ping pong
if (arg2=="SPELL_DAMAGE" or arg2=="SPELL_MISSED") and (spellid==103527 or spellid==104605 or spellid==108345 or spellid==108346) then
pszonozzshar=name1
pszonozzshars2=spellname
if pszonozzshar1==nil then
	pszonozzshar1={} --name
	pszonozzshar2={} --miss
	pstimetorep=GetTime()+1.5
end
table.insert(pszonozzshar1,name2)
if arg2=="SPELL_MISSED" and arg12 and arg12=="MISS" then
	table.insert(pszonozzshar2,"miss")
else
	table.insert(pszonozzshar2,"0")
end
end

if arg2=="SPELL_CAST_SUCCESS" and (spellid==104378 or spellid==104377 or spellid==110306 or spellid==110322) and pszonozzshar then
psiccschet2=psiccschet2+1
psiccschet1=0
pscaststartinfo(0,spellname.." #"..psiccschet2, 0, "id1", 4, "|snpc"..pszonozzshar.."^58473|fnpc - "..psinfo,psbossnames[1][6][2])
end



if (arg2=="SPELL_AURA_APPLIED_DOSE" or arg2=="SPELL_AURA_APPLIED") and spellid==104031 and pszonozzshar then
if arg2=="SPELL_AURA_APPLIED_DOSE" then
	pszonozzbufflast=arg13
else
	pszonozzbufflast="?"
end
pscaststartinfo(0,"+ "..spellname.." ("..psstacks..": "..pszonozzbufflast..")", 0, "id1", 4, "|snpc"..pszonozzshar.."^58473|fnpc - "..psinfo,psbossnames[1][6][2])
end

if arg2=="SPELL_AURA_REMOVED" and spellid==104031 and pszonozzshar then
local add=""
if pszonozzbufflast then
	add=" ("..psstacks..": "..pszonozzbufflast..")"
end
pscaststartinfo(0,"|cffff0000- "..spellname..add.."|r", -1, "id1", 4, "|snpc"..pszonozzshar.."^58473|fnpc - "..psinfo,psbossnames[1][6][2],2)
end



end