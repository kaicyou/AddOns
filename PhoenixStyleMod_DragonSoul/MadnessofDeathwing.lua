psbossfile68=1
function pscmrboss681(guid2,name2,spellname,arg12)
if pswasonboss68==nil then
	pswasonboss68=1
end
	pscheckwipe1()
	if pswipetrue and pswasonboss68~=2 then
		psiccwipereport_3("wipe", "try")
	end
		addtotridamagetables(name2, arg12, 0)
		psdamagetritablsort1()
end


function psmadnesscdtrack(name1,spellid,tim)
if psmadnesscdtrack1==nil then
  psmadnesscdtrack1={} --имя игрока
  psmadnesscdtrack2={} --спелл что заюзал
  psmadnesscdtrack3={} --тогда откатится КД
end
table.insert(psmadnesscdtrack1,name1)
table.insert(psmadnesscdtrack2,spellid)
table.insert(psmadnesscdtrack3,tim)
end


function psmadnessspek(name1,spek)
if psmadnessspektrack1==nil then
  psmadnessspektrack1={} --имя игрока
  psmadnessspektrack2={} --спек
end
local bil=0
if #psmadnessspektrack1>0 then
  for i=1,#psmadnessspektrack1 do
    if psmadnessspektrack1[i]==name1 then
      bil=1
      psmadnessspektrack2[i]=spek
    end
  end
end
if bil==0 then
  table.insert(psmadnessspektrack1,name1)
  table.insert(psmadnessspektrack2,spek)
end
end


function pscmrbossREPORT681(wipe,try,reset,checkforwipe)
if reset==nil then
if checkforwipe==nil or (checkforwipe and pswasonboss68 and pswasonboss68==1) then

	if pswasonboss68==1 then
		pssetcrossbeforereport1=GetTime()
		--if psraidoptionson[1][6][8][2]==1 then
		--	strochkavezcrash=psmainmgot.." |s4id99837|id ("..psmainmtotal.."): "
		--	reportafterboitwotab(psraidchats3[psraidoptionschat[1][6][8][2]], true, vezaxname, vezaxcrash, 1)
		--end


		--не использовать этот вывод в других сообщ
		if psraidoptionson[1][6][8][2]==1 then
			local totabs=0
			if #psdamagevalue>0 then
				for i=1,#psdamagevalue do
					totabs=totabs+psdamagevalue[i]
				end
			end
			if totabs>0 then
				local he=0

					he=psdamageceil(totabs)

				strochkadamageout=pszzdragotxtoptt682.." ("..he.." "..psulhp.."): "
				reportfromtridamagetables(psraidchats3[psraidoptionschat[1][6][8][2]],nil,1,true)
			end
		end
		if psraidoptionson[1][6][8][3]==1 then
			--собираем список всех игроков и вычитаем тех кто юзал кнопку
			local taball={}
			--psdifflastfight
			local psgroup=2
			if psdifflastfight==25 then
				psgroup=5
			end
			for i = 1,GetNumGroupMembers() do
				local name,_,subgroup = GetRaidRosterInfo(i)
				if subgroup<=psgroup then
					table.insert(taball,name)
				end
			end
			if #psdamagename>0 then
				local txt=""
				if #psdamagename<5 then
					txt=txt..pszzdragtextbuttonuse1.." ("..#psdamagename.."): "
					for i=1,#psdamagename do
						txt=txt..psnoservername(psdamagename[i]).." ("..psdamageraz[i]..")"
						if i~=#psdamagename then
							txt=txt..", "
						end
					end
				else
					for i=1,#psdamagename do
						if psdamagename[i] then
							for j=1,#taball do
								if taball[j] and taball[j]==psdamagename[i] then
									table.remove(taball,j)
								end
							end
						end
					end
					if #taball>0 then
						if #taball<12 then
							txt=txt..pszzdragtextbuttonuse2.." ("..#taball.."): "
							for i=1,#taball do
								txt=txt..psnoservername(taball[i])
								if i~=#taball then
									txt=txt..", "
								end
							end
						else
							txt=txt..format(pszzdragtextbuttonuse3,#taball)
						end
					end
				end
				if string.len(txt)>2 then
          pszapuskanonsa(psraidchats3[psraidoptionschat[1][6][8][3]], txt, true)
        end
			end
		end


			

	end
	if pswasonboss68==1 or (pswasonboss68==2 and try==nil) then

		psiccsavinginf(psbossnames[1][6][8], try, pswasonboss68)


			local totabs=0
			if #psdamagevalue>0 then
				for i=1,#psdamagevalue do
					totabs=totabs+psdamagevalue[i]
				end
			end
			if totabs>0 then
				local he=0
				
					he=psdamageceil(totabs)

			--не использовать этот вывод в других сообщ
			strochkadamageout=pszzdragotxtoptt682.." ("..he.." "..psulhp.."): "
			reportfromtridamagetables("raid",nil,1,true,0,1)
			end



			--собираем список всех игроков и вычитаем тех кто юзал кнопку
			local taball={}
			local psgroup=2
			if psdifflastfight==25 then
				psgroup=5
			end
			for i = 1,GetNumGroupMembers() do
				local name,_,subgroup = GetRaidRosterInfo(i)
				if subgroup<=psgroup then
					table.insert(taball,name)
				end
			end
			if #psdamagename>0 then
				local txt=""
				if #psdamagename<5 then
					txt=txt..pszzdragtextbuttonuse1..": "
					for i=1,#psdamagename do
						txt=txt..psaddcolortxt(1,psdamagename[i])..psdamagename[i]..psaddcolortxt(2,psdamagename[i]).." ("..psdamageraz[i]..")"
						if i~=#psdamagename then
							txt=txt..", "
						end
					end
				else
					for i=1,#psdamagename do
						if psdamagename[i] then
							for j=1,#taball do
								if taball[j] and taball[j]==psdamagename[i] then
									table.remove(taball,j)
								end
							end
						end
					end
					if #taball>0 then
						if #taball<12 then
							txt=txt..pszzdragtextbuttonuse2..": "
							for i=1,#taball do
								txt=txt..psaddcolortxt(1,taball[i])..taball[i]..psaddcolortxt(2,taball[i])
								if i~=#taball then
									txt=txt..", "
								end
							end
						else
							txt=txt..format(pszzdragtextbuttonuse3,#taball)
						end
					end
				end
				if string.len(txt)>2 then
          pszapuskanonsa("raid", txt, true,nil,0,1)
        end
			end



		psiccrefsvin()

	end




	if wipe then
		pswasonboss68=2
		pscheckbossincombatmcr_3=GetTime()+1
	end
end
end
end


function pscmrbossRESET681(wipe,try,reset,checkforwipe)
if reset or wipe==nil then
pswasonboss68=nil

psstrelatrackgo=nil
psbighrenactive=nil
psiccschet2=0
psiccschet3=0
pssonbuffon1=nil
pssonbuffon2=nil
pssonbuffon3=nil
pssonbuffon4=nil
pssoncdcounter1=nil
pssoncdcounter2=nil
pssoncdcounter3=nil
psshraptabadd1=nil
psshraptabadd2=nil
psshraptabadd3=nil
psshraptabadd4=nil
psshraptabadd5=nil
psshraptabadd6=nil
psshraptabadd7=nil
psmadnesscdtrack1=nil
psmadnesscdtrack2=nil
psmadnesscdtrack3=nil
psmadnessspektrack1=nil
psmadnessspektrack2=nil
psdrakmaxHPadd3=nil
table.wipe(psdamagename)
table.wipe(psdamagevalue)
table.wipe(psdamageraz)
end
end


function pscombatlogboss68(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)


--12/4 16:28:57.165  SPELL_CAST_SUCCESS,0xF150DB6D0000CB7E,"Смертокрыл",0xa48,0x0,0x0000000000000000,nil,0x80000000,0x80000000,105651,"Элементиевая стрела",0x4
--12/4 17:54:11.389  SPELL_CAST_SUCCESS,0xF150DB6D0000D219,"Смертокрыл",0xa48,0x0,0x0000000000000000,nil,0x80000000,0x80000000,105651,"Элементиевая стрела",0x4
--12/4 17:54:19.006  SPELL_CAST_SUCCESS,0xF130DBC60000D30F,"Элементиевая стрела",0xa48,0x0,0x0000000000000000,nil,0x80000000,0x80000000,105723,"Элементиевый взрыв",0x4

--если урона в полете не было то она не замедлена считаем.

--damage done trackers
if arg2=="SPELL_CAST_SUCCESS" and spellid==105651 then
if psraidoptionson[1][6][8][1]==1 then
psstrelatrackgo=GetTime() --появляется стрела
psdraknamedamageadd3=spellname --название стрелы
psbighrenactive=1
pspoletela=1
psdrakmodnewadd(3,nil,nil,0)
end
if pswasonboss68==nil then
	pswasonboss68=1
end
if psenablebossyellsmadn==nil then
psenablebossyellsmadn=1
PhoenixStyleMod_drags:RegisterEvent("CHAT_MSG_MONSTER_YELL")
end
end

--устанавливаю ГУИД для стрелы + счетчик урона
if psstrelatrackgo then


if name1 and name1==psdraknamedamageadd3 and psdrakmadnesstargetcheckupd3=="777" then
psdrakmadnesstargetcheckupd3=guid1
psdrakmadnesstargetcheckupd1=GetTime()-0.1
if psdragontabldamage1[1][#psdragontabldamage1[1]]=="777" then
	psdragontabldamage1[1][#psdragontabldamage1[1]]=guid1
end
if psdrakmaxHPadd3==nil then
  psdrakmaxHPadd3=0
end
end
if name2 and name2==psdraknamedamageadd3 and psdrakmadnesstargetcheckupd3=="777" then
psdrakmadnesstargetcheckupd3=guid2
psdrakmadnesstargetcheckupd1=GetTime()-0.1
if psdragontabldamage1[1][#psdragontabldamage1[1]]=="777" then
	psdragontabldamage1[1][#psdragontabldamage1[1]]=guid2
end
if psdrakmaxHPadd3==nil then
  psdrakmaxHPadd3=0
end
end




if (arg2=="DAMAGE_SHIELD" or arg2=="SPELL_PERIODIC_DAMAGE" or arg2=="SPELL_DAMAGE" or arg2=="RANGE_DAMAGE") then
if arg12 then
local id=psGetUnitID(guid2)
if id==56262 then
local source=psgetpetownername(guid1, name1, flag1)
psdrakadddamage(3,source,guid2,arg12,arg13,spellid) --3 tip reporta
if pspoletela then
	pspoletela=pspoletela+1
end
end
end
end


if arg2=="SWING_DAMAGE" then
if spellid then
local id=psGetUnitID(guid2)
if id==56262 then
local source=psgetpetownername(guid1, name1, flag1)
psdrakadddamage(3,source,guid2,spellid,spellname,0)
if pspoletela then
	pspoletela=pspoletela+1
end
end
end
end


if arg2=="SPELL_CAST_SUCCESS" and (spellid==105723 or spellid==109600 or spellid==109601 or spellid==109602) then
if pspoletela and pspoletela>9 then
--замедлена

local bil=0

for ii=1,#psdragontabldamage1[1] do
	if psdragontabldamage1[1][ii]==guid1 and bil==0 then
			bil=1
			local he=""
			if psdrakmaxHPadd3 and psdrakmaxHPadd3>0 and psdragontabldamage1[2][ii] then
        local remain=psdrakmaxHPadd3-psdragontabldamage1[2][ii]
   			local he=0
        if remain>0 then
          he=psdamageceil(remain)
        else
          he="?"
        end
        he=". "..pszzdraghpremain..": "..he
      end
			pssidamageinf_title2[pssavedplayerpos][1][ii]=pssidamageinf_title2[pssavedplayerpos][1][ii].." - "..pszzdragdamageinfly..he
	end
end
psupdateframewithnewinfo()

psstrelatrackgo=nil -- перестаю трекерить урон по замедленой после взрыва

else
--не замедлена сразу взрыв

local bil=0
for ii=1,#psdragontabldamage1[1] do
	if psdragontabldamage1[1][ii]==guid1 and bil==0 then
			bil=1
			pssidamageinf_title2[pssavedplayerpos][1][ii]=pssidamageinf_title2[pssavedplayerpos][1][ii].." - "..pszzdragdamageinfly2
	end
end
psupdateframewithnewinfo()


end
end


end



--Сон, инфо только о Сне
--12/4 16:37:06.125  SPELL_AURA_APPLIED,0x070000000397B095,"Геру",0x40514,0x0,0x070000000397B095,"Геру",0x40514,0x0,106466,"Сон",0x8,BUFF
if arg2=="SPELL_AURA_APPLIED" and (spellid==106466 or spellid==109634 or spellid==109635 or spellid==109636) and UnitName("boss1") then
if pswasonboss68==nil then
	pswasonboss68=1
end
--запись в общ инфо
addtotridamagetables(name2, 0, 1)
psdamagetritablsort1()

if pssonbuffon1==nil then
  pssonbuffon1={}--ник на ком
  pssonbuffon2={}--начало бафа
  pssonbuffon3={}--конец бафа
  pssonbuffon4={}--сколько заабсорблено
end

table.insert(pssonbuffon1,name2)
table.insert(pssonbuffon2,GetTime())
table.insert(pssonbuffon3,0)
table.insert(pssonbuffon4,0)

--кд на сон
if pssoncdcounter1==nil then
	pssoncdcounter1={} --кто заюзал
	pssoncdcounter2={} --когда ЗАКОНЧИТСЯ кд
	pssoncdcounter3={} --юз под сон был
end
local bil=0
if #pssoncdcounter1>0 then
	for i=1,#pssoncdcounter1 do
		if pssoncdcounter1[i] and pssoncdcounter1[i]==name1 then
			pssoncdcounter2[i]=GetTime()+30
			--проверка на была ли шрапнель
			local shsh=0
			if psshraptabadd1 and #psshraptabadd1>0 then
        for m=1,#psshraptabadd1 do
          if psshraptabadd1[m]==name1 and psshraptabadd6[m]+2>GetTime() then
            shsh=1
            pssoncdcounter3[i]=1
          end
        end
      end
      if shsh==0 then
        pssoncdcounter3[i]=0
      end
			bil=1
		end
	end
end
if bil==0 then
	table.insert(pssoncdcounter1,name1)
	local tm=GetTime()+30
	table.insert(pssoncdcounter2,tm)
	--проверка на шрапнель
	local shsh=0
	if psshraptabadd1 and #psshraptabadd1>0 then
    for m=1,#psshraptabadd1 do
      if psshraptabadd1[m]==name1 and psshraptabadd6[m]+2>GetTime() then
        shsh=1
      end
    end
  end
  if shsh==0 then
    table.insert(pssoncdcounter3,0)
  else
    table.insert(pssoncdcounter3,1)
  end
end

end

if arg2=="SPELL_AURA_REMOVED" and (spellid==106466 or spellid==109634 or spellid==109635 or spellid==109636) and UnitName("boss1") then
if pssonbuffon1 and #pssonbuffon1>0 then
  for i=1,#pssonbuffon1 do
    if pssonbuffon1[i]==name2 and pssonbuffon3[i]==0 then
      pssonbuffon3[i]=GetTime()
    end
  end
end
end

--как на зонозе тотал считать
if pssonbuffon1 and #pssonbuffon1>0 then


if (arg2=="DAMAGE_SHIELD" or arg2=="SPELL_PERIODIC_DAMAGE" or arg2=="SPELL_DAMAGE" or arg2=="RANGE_DAMAGE") then

if arg12 and arg13<=0 then
--local bil=0

for i=1,#pssonbuffon1 do
	if pssonbuffon1[i] and pssonbuffon1[i]==name2 then
		if GetTime()>pssonbuffon2[i]+0.2 then
			if pssonbuffon3[i]==0 or GetTime()<=pssonbuffon3[i]+0.1 then
				pssonbuffon4[i]=pssonbuffon4[i]+arg12
				pscmrboss681(guid2,name2,spellname,arg12)
			end
		end
	end
end


end
end


if arg2=="SWING_DAMAGE" then
if spellid and spellname<=0 then

--local bil=0
for i=1,#pssonbuffon1 do
	if pssonbuffon1[i] and pssonbuffon1[i]==name2 then
		if GetTime()>pssonbuffon2[i]+0.15 then
			if pssonbuffon3[i]==0 or GetTime()<=pssonbuffon3[i]+0.1 then
				pssonbuffon4[i]=pssonbuffon4[i]+spellid
				pscmrboss681(guid2,name2,nil,spellid)
			end
		end
	end
end


end
end

--+Миссы с абсорбом!!!! не считаем пока.. нет смысла о_О

--пример на свинге, рабочий: если что добавить еще на спелы, но частичный.. что с ним
--if arg2=="SWING_MISSED" and spellid and spellid=="ABSORB" then
--if spellid and spellname<0 then

--local bil=0
--for i=1,#pssonbuffon1 do
--	if pssonbuffon1[i] and pssonbuffon1[i]==name2 then
--		if GetTime()>pssonbuffon2[i]+0.2 then
--			if pssonbuffon3[i]==0 or GetTime()<=pssonbuffon3[i]+0.1 then
--				pssonbuffon4[i]=pssonbuffon4[i]+spellname
--				pscmrboss681(guid2,name2,nil,spellname)
--			end
--		end
--	end
--end

--end
--end




end --счет урона

--конец инфо по сну

if pswasonboss68 then
--инфо по шрапнели!

--трекерим все КД: прижигание, бабл, слияние с тьмой (90 сек), блок, СОН
--трекерим прок пиро или бомбу и записываем этих магов в табл
--при смерти от шрапнели:
	--ПОлученный урон, избыточный урон (не на кд: Сон, хрень всякая)
--реопрт в чат инфо о смерти от шрапнели
--вешать метку на шрапнель того кто целится в игрока без КД
--учесть смерть аддов
--учесть макс количество их, и если у всех есть КД пересчитывать результат все же.
--СейАнонсер: Шрапнель если СОн, и ПЕРСОНАЛЬНЫЕ АБИЛКИ на КД для нормала.




--смерть от шрапнели
if arg2=="SPELL_DAMAGE" and (spellid==106791 or spellid==109597 or spellid==109598 or spellid==109599) and arg13 and arg13>=0 then
--тут проверять КД на СОН, тут же проверять КД на другие АБИЛКИ! (кд на другие абилки должны быть проверены в начале каста - иначе дебафф какой может уже сняться) ыытест
local son=""
local son2=""
local bil=0
if pssoncdcounter1 and #pssoncdcounter1>0 then
	for i=1,#pssoncdcounter1 do
		if pssoncdcounter1[i]==name2 then
			if pssoncdcounter2[i]<GetTime() then
				bil=0 --не на КД просто не использовал
			elseif pssoncdcounter2[i]-GetTime()>=25 then --ыытест для героиков тут 2.5 сек???
        local tim2=30-(pssoncdcounter2[i]-GetTime())
        tim2=math.ceil(tim2*10)/10
				son="|cff00ff00"..psused.." ("..tim2.." "..pssec.." "..pszzdragbefore..")|r"
				son2=psused.." ("..tim2.." "..pssec.." "..pszzdragbefore..")"
				bil=2
			else
				local tim2=30-(pssoncdcounter2[i]-GetTime())
				tim2=math.ceil(tim2*10)/10
				--если кд узнает ласт юз был под шрапнель?
				local add11=""
				if pssoncdcounter3 and pssoncdcounter3[i]==1 then
				local shrapn=GetSpellInfo(106794)
          add11=" "..format(pszzdragforcast,shrapn)
				end
				son="|cffff0000"..pscooldown.." ("..format(psusedbefore,tim2)..add11..")|r"
				son2=pscooldown.." ("..format(psusedbefore,tim2)..add11..")"
				bil=1
			end
		end
	end
end
if bil==0 then
--не исп
son="|cffff0000"..psnotused.."|r"
son2=psnotused
end

local dmg1=arg12-arg13
local dmg2=arg13

if (string.len(dmg1)) > 3 then
	dmg1=string.sub(dmg1, 1, string.len(dmg1)-3)
	dmg1=dmg1.."k"
end
if (string.len(dmg2)) > 3 then
	dmg2=string.sub(dmg2, 1, string.len(dmg2)-3)
	dmg2=dmg2.."k"
end

local sonname=GetSpellInfo(109634)

local otherCD=""
if psshraptabadd5 and #psshraptabadd5>0 then
  for i=1,#psshraptabadd5 do
    if psshraptabadd2[i] and psshraptabadd2[i]==guid2 and psshraptabadd3[i] and psshraptabadd3[i]==guid1 and psshraptabadd5[i] and psshraptabadd5[i]~="0" then
      otherCD=". "..pszzdragothercd..": "..psshraptabadd5[i]
    end
  end
end


--для чата: Шурш умер от Шрапнель > 20К (И: 180К). Сон: использован. Доступные КД: Ледяная глыба.

if psraidoptionson[1][6][8][4]==1 and pswasonboss68==1 then
  if string.find(psiccinst,psiccheroic) then
    if string.len(otherCD)>2 then
      pszapuskanonsa(psraidchats3[psraidoptionschat[1][6][8][4]], "{rt8} "..psnoservername(name2).." "..psmainmdiedfrom.." |s4id106791,109597,109598,109599|id > "..dmg1.." ("..psoverkill..": "..dmg2.."). "..sonname..": "..son2..otherCD)
    end
  else
    pszapuskanonsa(psraidchats3[psraidoptionschat[1][6][8][4]], "{rt8} "..psnoservername(name2).." "..psmainmdiedfrom.." |s4id106791,109597,109598,109599|id > "..dmg1.." ("..psoverkill..": "..dmg2.."). "..sonname..": "..son2..otherCD)
  end
end

pscaststartinfo(0,spellname.." > "..psaddcolortxt(1,name2)..name2..psaddcolortxt(2,name2).." "..psdied.." ("..dmg1.." "..psulhp..", "..psoverkill..": "..dmg2.."). "..sonname..": "..son..otherCD, -1, "id1", 2, "|s4id"..spellid.."|id - "..psinfo,psbossnames[1][6][8],2)

end


--шрапнель вешает свой бафф, запись в табл на метки, проверка КД // нормал героик итп
if arg2=="SPELL_AURA_APPLIED" and (spellid==106794 or spellid==110139 or spellid==110140 or spellid==110141) then
--через 5 сек макс заюзать абилку. ыытест
if psshraptabadd1==nil then
	psshraptabadd1={} --на ком шрапнель
	psshraptabadd2={} --ГУИД игрока
	psshraptabadd3={} --гуид шрапнели
	psshraptabadd4={} --метка которую хотим вешать на нее
	psshraptabadd5={} --список КД доступных у игрока
	psshraptabadd6={} --вешать метку до этого времени --после метка не действительна
	psshraptabadd7={} --метку повесил (не более 2 попыток вешанья)
end
if #psshraptabadd1>0 then
	for i=1,#psshraptabadd1 do
		if psshraptabadd1[i] and psshraptabadd3[i]==guid1 then
			table.remove(psshraptabadd1,i)
			table.remove(psshraptabadd2,i)
			table.remove(psshraptabadd3,i)
			table.remove(psshraptabadd4,i)
			table.remove(psshraptabadd5,i)
			table.remove(psshraptabadd6,i)
			table.remove(psshraptabadd7,i)
		end
	end
end

--добавляем новый каст
table.insert(psshraptabadd1,name2)
table.insert(psshraptabadd2,guid2)
table.insert(psshraptabadd3,guid1)


--тут делаем проверку по КД!!!!!! ыытест

local cda=""
local cdo=1 --для прижигания, то что автоматом сработает его не прописываем --1 это НЕТ КД
if psmadnesscdtrack1 and #psmadnesscdtrack1>0 then
  --проверяем каждого по классу
  local _, class = UnitClass(name2)
    if class then
      class=string.lower(class)
      --маги
      if class=="mage" then
        --блок
        local used=0
        for i=1,#psmadnesscdtrack1 do
          if psmadnesscdtrack1[i] and psmadnesscdtrack1[i]==name2 and psmadnesscdtrack2[i]==45438 and GetTime()+4.7<psmadnesscdtrack3[i] then
            used=1
          end
        end
        if used==0 then
          local a1=GetSpellInfo(45438)
          cda=cda..a1
          cdo=0
        end
        --прижигание только для фаеров!
        local fire=0
        if psmadnessspektrack1 and #psmadnessspektrack1>0 then
          for j=1,#psmadnessspektrack1 do
            if psmadnessspektrack1[j]==name2 and psmadnessspektrack2[j]=="fire" then
              fire=1
            end
          end
        end
        if fire==1 then
          cdo=0
          for i=1,#psmadnesscdtrack1 do
            if psmadnesscdtrack1[i] and psmadnesscdtrack1[i]==name2 and psmadnesscdtrack2[i]==87023 and GetTime()+4.7<psmadnesscdtrack3[i] then
              cdo=1
            end
          end
        end
        --проверка для фаера прижигания
      end
      --для мага овер
      --для др классов тут --ыытест
      if class=="priest" then
        local fire=0
        local used=0
        if psmadnessspektrack1 and #psmadnessspektrack1>0 then
          for j=1,#psmadnessspektrack1 do
            if psmadnessspektrack1[j]==name2 and psmadnessspektrack2[j]=="shp" then
              fire=1
            end
          end
        end
        if fire==1 then
          cdo=0
          for i=1,#psmadnesscdtrack1 do
            if psmadnesscdtrack1[i] and psmadnesscdtrack1[i]==name2 and psmadnesscdtrack2[i]==47585 and GetTime()+4.7<psmadnesscdtrack3[i] then
              cdo=1
              used=1
            end
          end
          if used==0 then
            local a1=GetSpellInfo(47585)
            cda=cda..a1
          end
        end
      end
      --конец шп
      if class=="paladin" then
        --бабл
        local used=0
        for i=1,#psmadnesscdtrack1 do
          if psmadnesscdtrack1[i] and psmadnesscdtrack1[i]==name2 and psmadnesscdtrack2[i]==642 and GetTime()+4.7<psmadnesscdtrack3[i] then
            used=1
          end
        end
        local deb=GetSpellInfo(25771)
        if used==0 and UnitDebuff(name2, deb)==nil then
          local a1=GetSpellInfo(642)
          cda=cda..a1
          cdo=0
        end
      end
      --конец пала
      if class=="druid" then
        local fire=0
        local used=0
        if psmadnessspektrack1 and #psmadnessspektrack1>0 then
          for j=1,#psmadnessspektrack1 do
            if psmadnessspektrack1[j]==name2 and psmadnessspektrack2[j]=="feral" then
              fire=1
            end
          end
        end
        if fire==1 then
          cdo=0
          for i=1,#psmadnesscdtrack1 do
            if psmadnesscdtrack1[i] and psmadnesscdtrack1[i]==name2 and (psmadnesscdtrack2[i]==22812 or psmadnesscdtrack2[i]==61336) and GetTime()+4.7<psmadnesscdtrack3[i] then
              cdo=1
              used=1
            end
          end
          if used==0 then
            local a1=GetSpellInfo(22812)
            local b1=GetSpellInfo(61336)
            cda=cda..b1.." + "..a1
          end
        end
      end
      --конец ферала
    end
end

if string.len(cda)>1 then
  table.insert(psshraptabadd5,cda)
else
  table.insert(psshraptabadd5,"0") -- если нет свободных КД
end


--если нормал, то достаточно даже сна чтобы НЕ вешать метку
if cdo==1 and string.find(psiccinst,psiccheroic)==nil then
  cdo=0
  if pssoncdcounter1 and #pssoncdcounter1>0 then
    for i=1,#pssoncdcounter1 do
      if pssoncdcounter1[i]==name2 and GetTime()+4.7<pssoncdcounter2[i] then
        cdo=1
      end
    end
  end
end

--вешать метку будем
local metk={8,7,6,5,4,3,2,1}
if #psshraptabadd4>0 and cdo==1 then
  for i=1,#psshraptabadd4 do
    if psshraptabadd4[i] and psshraptabadd4[i]~=0 and psshraptabadd6[i] and GetTime()<psshraptabadd6[i] then
      if #metk>0 then
        for j=1,#metk do
          if metk[j] and metk[j]==psshraptabadd4[i] then
            table.remove(metk,j)
          end
        end
      end
    end
  end
end
if metk[1] and cdo==1 then
  local nrmet=metk[1]
  table.insert(psshraptabadd4,nrmet)
else
  table.insert(psshraptabadd4,0)
end

local tm=GetTime()+5
table.insert(psshraptabadd6,tm)

table.insert(psshraptabadd7,0)

end



--трекерим КД!!
if arg2=="SPELL_CAST_SUCCESS" and (spellid==45438 or spellid==642) then
local tim=GetTime()+300
psmadnesscdtrack(name1,spellid,tim)
end

if arg2=="SPELL_AURA_APPLIED" and (spellid==87023 or spellid==22812) then
local tim=GetTime()+60
psmadnesscdtrack(name1,spellid,tim)
end


if arg2=="SPELL_AURA_APPLIED" and spellid==47585 then
local tim=GetTime()+90
psmadnesscdtrack(name1,spellid,tim)
end

if arg2=="SPELL_AURA_APPLIED" and spellid==61336 then
local tim=GetTime()+180
psmadnesscdtrack(name1,spellid,tim)
end


--трекерим спеки игроков
if arg2=="SPELL_AURA_APPLIED" and (spellid==44457 or spellid==48108) then
psmadnessspek(name1,"fire")
end

if arg2=="SPELL_AURA_APPLIED" and spellid==77487 then
psmadnessspek(name1,"shp")
end

if arg2=="SPELL_CAST_SUCCESS" and (spellid==33876 or spellid==33878) then
psmadnessspek(name1,"feral")
end



end
--шрепнель инфо конец



--инфо об уроне для героика
if psheroiccombat then

if arg2=="DAMAGE_SHIELD" or arg2=="SPELL_PERIODIC_DAMAGE" or arg2=="SPELL_DAMAGE" or arg2=="RANGE_DAMAGE" then
if arg12 then
local id=psGetUnitID(guid2)
if id==57479 then
    --получение инфо о хозяине если там пет, с учетом по маске
    local source=psgetpetownername(guid1, name1, flag1)
    psdraknamedamageadd5=name2
    psdrakadddamage(5,source,guid2,arg12,arg13,spellid) --5 tip reporta
end
end
end

if arg2=="SWING_DAMAGE" then
if spellid then
local id=psGetUnitID(guid2)
if id==57479 then
    psdraknamedamageadd5=name2
    local source=psgetpetownername(guid1, name1, flag1)
    psdrakadddamage(5,source,guid2,spellid,spellname,0)
end
end
end

if (arg2=="SPELL_CAST_START" or arg2=="SPELL_CAST_SUCCESS") and spellid==108813 then
if pswasonboss68==nil then
	pswasonboss68=1
end
psdraknamedamageadd5=name1
psdrakmodnewadd(5,nil,guid1,0)
end

--add died :(
if arg2=="UNIT_DIED" and psmadnessaddbegin then
	local id=psGetUnitID(guid2)
	if id==57479 then
      --репорт
      --изменение текста
        if #pssidamageinf_title2[pssavedplayerpos][1]>0 then
          for ii=1,#psdragontabldamage1[1] do
            if psdragontabldamage1[1][ii]==guid2 then
              local rtime=GetTime()-psmadnessaddbegin
              rtime=math.ceil(rtime*10)/10
              pssidamageinf_title2[pssavedplayerpos][1][ii]=pssidamageinf_title2[pssavedplayerpos][1][ii].." ("..rtime.." "..pssec..")"
            end
          end
        end
        psmadnessaddbegin=nil
      --репорт
      --if psraidoptionson[1][6][7][5]==1 then
      --  local ar3=psiccdmg3 or 4
      --  if #pssidamageinf_title2[pssavedplayerpos][1]>0 then
      --    for ii=1,#psdragontabldamage1[1] do
      --      if psdragontabldamage1[1][ii]==guid2 then
      --        psdamagerep_3(psraidchats3[psraidoptionschat[1][6][7][5]],pssavedplayerpos,1,ii,ar3,1,2,1, false)
      --      end
      --    end
      --  end
      --end
	end
end

end --урон в героик адда




end