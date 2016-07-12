psbossfile51=1
function pscmrboss511(guid2,name2,spellname)
if pswasonboss51==nil then
	pswasonboss51=1
end
psunitisplayer(guid2,name2)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss51~=2 then
		psiccwipereport_2("wipe", "try")
	end
		addtotwotables(name2)
		vezaxsort1()

		pscaststartinfo(0,spellname..": "..psaddcolortxt(1,name2)..name2..psaddcolortxt(2,name2), -1, "id1", 1, spellname.." - "..psinfo,psbossnames[1][5][1],2)
end
end

function pscmrboss512(guid2,name2,spellname)
if pswasonboss51==nil then
	pswasonboss51=1
end
psunitisplayer(guid2,name2)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss51~=2 then
		psiccwipereport_2("wipe", "try")
	end
		addtotwotables2(name2)
		vezaxsort2()

		pscaststartinfo(0,spellname..": "..psaddcolortxt(1,name2)..name2..psaddcolortxt(2,name2), -1, "id1", 2, spellname.." - "..psinfo,psbossnames[1][5][1],2)
end
end

function pscmrboss513(guid2,name2,spellname)
if pswasonboss51==nil then
	pswasonboss51=1
end
psunitisplayer(guid2,name2)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss51~=2 then
		psiccwipereport_2("wipe", "try")
	end
		addtotwotables3(name2)
		vezaxsort3()

		pscaststartinfo(0,spellname..": "..psaddcolortxt(1,name2)..name2..psaddcolortxt(2,name2), -1, "id1", 4, spellname.." - "..psinfo,psbossnames[1][5][1],2)
end
end

function pscmrbossREPORT511(wipe,try,reset,checkforwipe)
if reset==nil then
if checkforwipe==nil or (checkforwipe and pswasonboss51 and pswasonboss51==1) then

	if pswasonboss51==1 then
		pssetcrossbeforereport1=GetTime()
		if psraidoptionson[1][5][1][1]==1 then
			strochkavezcrash=psfireldamagefrom.." |s4id99076|id: "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][5][1][1]], true, vezaxname, vezaxcrash, 1)
		end
		if psraidoptionson[1][5][1][2]==1 then
			if psiccschet2>0 then
				local temptxt=psiccschet2
				if (string.len(psiccschet1)) > 6 then
					temptxt=string.sub(psiccschet1,1,string.len(psiccschet1)-6).."."..string.sub(psiccschet1,(string.len(psiccschet1)-5),string.len(psiccschet1)-3).."."..string.sub(psiccschet1,(string.len(psiccschet1)-2))
				elseif (string.len(psiccschet1)) > 3 then
					temptxt=string.sub(psiccschet1,1,string.len(psiccschet1)-3).."."..string.sub(psiccschet1,(string.len(psiccschet1)-2))
				end
				pszapuskanonsa(psraidchats3[psraidoptionschat[1][5][1][2]], psbossnames[1][5][1].." "..psfirehealedhimself.." |s4id99332|id: "..temptxt.." HP ("..psiccschet1.." "..psfiretimes..")", true)
			end
		end
		if psraidoptionson[1][5][1][3]==1 then
			strochkavezcrash=psfireldamagefrom.." |s4id99052|id: "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][5][1][3]], true, vezaxname2, vezaxcrash2, 1)
		end
		if psraidoptionson[1][5][1][4]==1 then
			strochkavezcrash=psfireldamagefrom.." |s4id99278,101133|id: "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][5][1][4]], true, vezaxname3, vezaxcrash3, 1)
		end
		if psraidoptionson[1][5][1][7]==1 then
			strochkavezcrash=psfiretauntseff..": "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][5][1][7]], true, vezaxname4, vezaxcrash4, 1)
		end
		if psraidoptionson[1][5][1][8]==1 then
			if psiccschet3>0 then
				pszapuskanonsa(psraidchats3[psraidoptionschat[1][5][1][8]], psfireconsumeadd.." "..psiccschet3.." "..psfiretimes..".", true)
			end
		end


	end
	if pswasonboss51==1 or (pswasonboss51==2 and try==nil) then

		psiccsavinginf(psbossnames[1][5][1], try, pswasonboss51)

		strochkavezcrash=psfireldamagefrom.." |s4id99076|id: "
		reportafterboitwotab("raid", true, vezaxname, vezaxcrash, nil, nil,0,1)

			if psiccschet2>0 then
				local temptxt=psiccschet2
				if (string.len(psiccschet1)) > 6 then
					temptxt=string.sub(psiccschet1,1,string.len(psiccschet1)-6).."."..string.sub(psiccschet1,(string.len(psiccschet1)-5),string.len(psiccschet1)-3).."."..string.sub(psiccschet1,(string.len(psiccschet1)-2))
				elseif (string.len(psiccschet1)) > 3 then
					temptxt=string.sub(psiccschet1,1,string.len(psiccschet1)-3).."."..string.sub(psiccschet1,(string.len(psiccschet1)-2))
				end

				pszapuskanonsa("raid", psbossnames[1][5][1].." "..psfirehealedhimself.." |s4id99332|id: "..temptxt.." HP ("..psiccschet1.." "..psfiretimes..")", true,nil,0,1)
			end

		strochkavezcrash=psfireldamagefrom.." |s4id99052|id: "
		reportafterboitwotab("raid", true, vezaxname2, vezaxcrash2, nil, nil,0,1)
		strochkavezcrash=psfireldamagefrom.." |s4id99278,101133|id: "
		reportafterboitwotab("raid", true, vezaxname3, vezaxcrash3, nil, nil,0,1)
		strochkavezcrash=psfiretauntseff..": "
		reportafterboitwotab("raid", true, vezaxname4, vezaxcrash4, nil, nil,0,1)
		if psiccschet3>0 then
			pszapuskanonsa("raid", psfireconsumeadd.." "..psiccschet3.." "..psfiretimes..".", true,nil,0,1)
		end


		psiccrefsvin()

	end




	if wipe then
		pswasonboss51=2
		pscheckbossincombatmcr_2=GetTime()+1
	end
end
end
end


function  pscmrbossRESET511(wipe,try,reset,checkforwipe)
if reset or wipe==nil then
pswasonboss51=nil
table.wipe(vezaxname)
table.wipe(vezaxcrash)
table.wipe(vezaxname2)
table.wipe(vezaxcrash2)
table.wipe(vezaxname3)
table.wipe(vezaxcrash3)
table.wipe(vezaxname4)
table.wipe(vezaxcrash4)

psbeth01=nil
psbeth02=nil
psbeth03=nil
psbeth04=nil
psbeth05=nil
psiccschet1=0
psiccschet2=0
psiccschet3=0
psbethteunt1=nil
psbethteunt2=nil
psbethteunt3=nil
end
end


function pscombatlogboss51(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)
--local arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid,spellname,arg11,arg12,arg13,arg14,arg15 = ...

if arg2=="SPELL_DAMAGE" and spellid==99076 then
pscmrboss511(guid2,name2,spellname)
end

if arg2=="SPELL_HEAL" and (spellid==99332 or spellid==99857) then
psiccschet1=psiccschet1+1
psiccschet2=psiccschet2+arg12
pscaststartinfo(0,spellname..": "..psbossnames[1][5][1].." "..psfirehealedhimself.." "..arg12.." HP", -1, "id1", 3, spellname.." - "..psinfo,psbossnames[1][5][1],2)
end

if arg2=="SPELL_DAMAGE" and spellid==99052 then
pscmrboss512(guid2,name2,spellname)
end

if arg2=="SPELL_DAMAGE" and (spellid==101133 or spellid==99278) then
pscmrboss513(guid2,name2,spellname)
end




--5 опция, кто танчил и кого задела аое
if arg2=="SPELL_AURA_APPLIED" and spellid==99526 then
if pswasonboss51==nil then
	pswasonboss51=1
end
	if psbeth01==nil then
		psbeth01={} -- ид паука
		psbeth02={} -- кто щас танчит // 0 - значит никто
		psbeth03={} -- время начала танкования
		psbeth04={} -- кто танчил до этого
		psbeth05={} -- время когда закончил танчить
	end
	local bil=0
	if #psbeth01>0 then
		for i=1,#psbeth01 do
			if psbeth01[i]==guid1 then
				psbeth04[i]=psbeth02[i]
				psbeth05[i]=psbeth03[i]
				bil=1
				psbeth02[i]=name2
				psbeth03[i]=GetTime()
			end
		end
	end
	if bil==0 then
		table.insert(psbeth01,guid1)
		table.insert(psbeth02,name2)
		table.insert(psbeth03,GetTime())
		table.insert(psbeth04,0)
		table.insert(psbeth05,0)
	end
end

if arg2=="SPELL_AURA_REMOVED" and spellid==99526 then
	if psbeth01 and #psbeth01>0 then
		for i=1,#psbeth01 do
			if psbeth01[i]==guid1 then
				psbeth04[i]=psbeth02[i]
				psbeth05[i]=GetTime()
				psbeth02[i]=0
				psbeth03[i]=GetTime()
			end
		end
	end
end

--то что босс в бою, держит переменную 3 минуты и обнуляет при выходе с инста
if arg2=="SPELL_CAST_SUCCESS" and (spellid==99333 or spellid==101128 or spellid==101129 or spellid==101130) then
pspaukincombat=GetTime()
end


if arg2=="SPELL_DAMAGE" and (spellid==100833 or spellid==100832 or spellid==99463) and pspaukincombat and GetTime()<pspaukincombat+180 then
if pswasonboss51==nil then
	pswasonboss51=1
end
psunitisplayer(guid2,name2)
if psunitplayertrue then
	if psbethddd1==nil then
		psbethddd1={} -- ид паука
		psbethddd2={} -- время после которого нужен репорт!
		psbethddd3={} -- нужен ли репорт = 1, просто очистить = 0
		psbethddd4={} -- урон прошел по след игрокам (кроме цели фиксейт) - ТАБЛИЦА
		psbethddd5={} -- текст что вывОдится при репорте (кто танчил)
		psbethddd6={} -- ник для репорта чтоб разукрасить его
	end
	local bil=0
	if #psbethddd1>0 then
		for i=1,#psbethddd1 do
			if psbethddd1[i]==guid1 then
				bil=1
				psbethddd3[i]=1
				table.insert(psbethddd4[i],name2)
			end
		end
	end
	if bil==0 then
		table.insert(psbethddd1,guid1)
		table.insert(psbethddd2,GetTime()+1)

		table.insert(psbethddd3,0)
		table.insert(psbethddd4,{name2})


		local ok=0
		local fixate=GetSpellInfo(99526)
		if psbeth01 then
			for j=1,#psbeth01 do
				if psbeth01[j]==guid1 then
					ok=1
					--есть фиксейт щас:
					if psbeth02[j] and psbeth02[j]~=0 then
						table.insert(psbethddd5,fixate.." -> %s ("..((math.ceil((GetTime()-psbeth03[j])*10))/10).." "..pssec..").")
						table.insert(psbethddd6,psbeth02[j])
					--нет фиксейта
					elseif psbeth02[j]==0 then
						--но был недавно:
						if psbeth04[j] and psbeth04[j]~=0 then
							table.insert(psbethddd5,psfireno.." "..fixate.."! ("..format(psfirefixate1,((math.ceil((GetTime()-psbeth05[j])*10))/10)).." %s).")
							table.insert(psbethddd6,psbeth04[j])
						else
							table.insert(psbethddd5,psfireno.." "..fixate.."!")
							table.insert(psbethddd6,0)
						end
					else
						table.insert(psbethddd5,"no fixate info - addon error.")
						table.insert(psbethddd6,0)
					end
				end
			end
		end
		if ok==0 then
			--паук еще не юзал фиксейты
			table.insert(psbethddd5,psfireno.." "..fixate.."!")
			table.insert(psbethddd6,0)
		end
	end
end
end




--6 опция
--по ходу боя инфо, кто взрывал:
--6/10 22:44:18.674  SPELL_DAMAGE,0xF130D1F100002004,"Engorged Broodling",0xa48,0x0,0x0100000000319000,"Velmaro",0x512,0x0,100838,"Volatile Burst",0x8,28424,-1,8,9475,0,9475,nil,nil,nil
--6/10 22:44:18.674  SPELL_DAMAGE,0xF130D1F100002004,"Engorged Broodling",0xa48,0x0,0xF14043A3DB000093,"Lazyap",0x1112,0x0,100838,"Volatile Burst",0x8,2684,-1,8,26840,0,0,nil,nil,nil
--6/10 22:44:18.674  SPELL_DAMAGE,0xF130D1F100002004,"Engorged Broodling",0xa48,0x0,0x01000000003189EC,"Avrilka",0x512,0x0,100838,"Volatile Burst",0x8,41272,-1,8,10318,0,0,nil,nil,nil

--лишние взрывы.

--НЕТ ОПЦИИ но хранить инфо, есть опция 6
--Volatile Burst как будут делать? учитывать если урон более чем по 2 чел? как понять за кем идет паук?

if arg2=="SPELL_DAMAGE" and (spellid==100838 or spellid==99990) then
if pswasonboss51==nil then
	pswasonboss51=1
end
psunitisplayer(guid2,name2)
	if psunitplayertrue then
		if psbetbabeh1==nil then
			psbetbabeh1={} --ид моба
			psbetbabeh2={} --когда реп
			psbetbabeh3={} --кого задело
		end
		local bil=0
		if #psbetbabeh1>0 then
			for i=1,#psbetbabeh1 do
				if psbetbabeh1[i]==guid1 then
					bil=1
					table.insert(psbetbabeh3[i],name2)
				end
			end
		end
		if bil==0 then
			table.insert(psbetbabeh1,guid1)
			table.insert(psbetbabeh2,GetTime()+1)
			table.insert(psbetbabeh3,{name2})
		end
	end
end

if arg2=="SPELL_HEAL" and spellid==100634 then
local id=psGetUnitID(guid2)
if id==52581 and pspaukincombat and GetTime()<pspaukincombat+180 then

if pswasonboss51==nil then
	pswasonboss51=1
end
pscheckwipe1()
if pswipetrue and pswasonboss51~=2 then
	psiccwipereport_2("wipe", "try")
end

psiccschet3=psiccschet1+3
--ыытут паук хилится
local nm=GetSpellInfo(99332)
pscaststartinfo(0,spellname..": "..name2.." "..psfirehealedhimself.." "..arg12.." HP", -1, "id1", 3, nm.." - "..psinfo,psbossnames[1][5][1],2)


end
end


--таунты
if arg2=="SPELL_CAST_SUCCESS" and pspaukincombat and GetTime()<pspaukincombat+180 then
	if guid1 then
		local id=psGetUnitID(guid1)
		if id==52524 then
			if pswasonboss51==nil then
				pswasonboss51=1
			end
			if psbethteunt1==nil then
				psbethteunt1={} --guid
				psbethteunt2={} --time spawn
				psbethteunt3={} --taunted? 0/1
			end
			local bil=0
			for i=1,#psbethteunt1 do
				if psbethteunt1[i]==guid1 then
					bil=1
				end
			end
			if bil==0 then
				table.insert(psbethteunt1,guid1)
				table.insert(psbethteunt2,GetTime())
				table.insert(psbethteunt3,0)
			end
		end
	end
	if guid2 then
		local id=psGetUnitID(guid2)
		if id==52524 then
			if pswasonboss51==nil then
				pswasonboss51=1
			end
			if psbethteunt1==nil then
				psbethteunt1={} --guid
				psbethteunt2={} --time spawn
				psbethteunt3={} --taunted? 0/1
			end
			local bil=0
			for i=1,#psbethteunt1 do
				if psbethteunt1[i]==guid2 then
					bil=1
				end
			end
			if bil==0 then
				table.insert(psbethteunt1,guid2)
				table.insert(psbethteunt2,GetTime())
				table.insert(psbethteunt3,0)
			end
		end
	end
end

if arg2=="UNIT_DIED" then
	local id=psGetUnitID(guid2)
	if id==52524 then
		for i=1,#psbethteunt1 do
			if psbethteunt1[i] and psbethteunt1[i]==guid2 then
				table.remove(psbethteunt1,i)
				table.remove(psbethteunt2,i)
				table.remove(psbethteunt3,i)
			end
		end
	end
end

if arg2=="SPELL_CAST_SUCCESS" and (spellid==355 or spellid==21008 or spellid==56222 or spellid==49576 or spellid==20736 or spellid==53477 or spellid==6795 or spellid==62124) then
local id=psGetUnitID(guid2)
if id==52524 then
	for i=1,#psbethteunt1 do
		if psbethteunt1[i]==guid2 then
			if psbethteunt3[i]==0 then
				psbethteunt3[i]=1
				if pswasonboss51==nil then
					pswasonboss51=1
				end
				pscheckwipe1()
				if pswipetrue and pswasonboss51~=2 then
					psiccwipereport_2("wipe", "try")
				end

				addtotwotables4(name1)
				vezaxsort4()

				local time=math.ceil((GetTime()-psbethteunt2[i])*10)/10

				pscaststartinfo(0,psaddcolortxt(1,name1)..name1..psaddcolortxt(2,name1).." -> "..spellname.." ("..time.." "..pssec..")", -1, "id1", 22, psfiretauntseff2,psbossnames[1][5][1],2)
			end
		end
	end
end
end



if arg2=="SPELL_AURA_APPLIED" and (spellid==1161 or spellid==5209 or spellid==31790) then
local id=psGetUnitID(guid2)
if id==52524 then
	for i=1,#psbethteunt1 do
		if psbethteunt1[i]==guid2 then
			if psbethteunt3[i]==0 then
				psbethteunt3[i]=1
				if pswasonboss51==nil then
					pswasonboss51=1
				end
				pscheckwipe1()
				if pswipetrue and pswasonboss51~=2 then
					psiccwipereport_2("wipe", "try")
				end

				addtotwotables4(name1)
				vezaxsort4()

				local time=math.ceil((GetTime()-psbethteunt2[i])*10)/10

				pscaststartinfo(0,psaddcolortxt(1,name1)..name1..psaddcolortxt(2,name1).." -> "..spellname.." ("..time..")", -1, "id1", 22, psfiretauntseff2,psbossnames[1][5][1],2)
			end
		end
	end
end
end




end