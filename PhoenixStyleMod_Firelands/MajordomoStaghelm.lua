psbossfile56=1
function pscmrboss561(guid2,name1,spellname,name2)
if pswasonboss56==nil then
	pswasonboss56=1
end
psunitisplayer(guid2,name2)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss56~=2 then
		psiccwipereport_2("wipe", "try")
	end
		addtotwotables(name1)
		vezaxsort1()
end
end


function pscmrbossREPORT561(wipe,try,reset,checkforwipe)
if reset==nil then
if checkforwipe==nil or (checkforwipe and pswasonboss56 and pswasonboss56==1) then

	if pswasonboss56==1 then
		pssetcrossbeforereport1=GetTime()
		if psraidoptionson[1][5][6][1]==1 then
			strochkavezcrash=psfirebabah2..": "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][5][6][1]], true, vezaxname, vezaxcrash, 1)
		end


if psmajoconcentr1 and #psmajoconcentr1>0 then

for i=1,#psmajoconcentr1 do
	if psmajoconcentr1[i] then
		local time=GetTime()-psmajoconcentr2[i]
		time=math.ceil(time*10)
		time=time/10
		addtotwotables5(psmajoconcentr1[i],time)
		vezaxsort5()
	end
end

end

		if psraidoptionson[1][5][6][5]==1 then
			strochkavezcrash=psfiretxtopttmaj..": "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][5][6][5]], true, vezaxname5, vezaxcrash5, 1)
		end
		if psraidoptionson[1][5][6][6]==1 then
			strochkavezcrash=psfireldamagefrom.." |s4id98535,100206,100207,100208|id ("..psfirenofistsec2.."): "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][5][6][6]], true, vezaxname3, vezaxcrash3, 1)
		end



	end
	if pswasonboss56==1 or (pswasonboss56==2 and try==nil) then

		psiccsavinginf(psbossnames[1][5][6], try, pswasonboss56)

		strochkavezcrash=psfirebabah2..": "
		reportafterboitwotab("raid", true, vezaxname, vezaxcrash, nil, nil,0,1)
		strochkavezcrash=psfiretxtopttmaj..": "
		reportafterboitwotab("raid", true, vezaxname5, vezaxcrash5, nil, nil,0,1)
		strochkavezcrash=psfireldamagefrom.." |s4id98535,100206,100207,100208|id ("..psfirenofistsec2.."): "
		reportafterboitwotab("raid", true, vezaxname3, vezaxcrash3, nil, nil,0,1)


		psiccrefsvin()

	end




	if wipe then
		pswasonboss56=2
		pscheckbossincombatmcr_2=GetTime()+1
	end
end
end
end


function  pscmrbossRESET561(wipe,try,reset,checkforwipe)
if reset or wipe==nil then
pswasonboss56=nil
table.wipe(vezaxname)
table.wipe(vezaxcrash)
table.wipe(vezaxname2)
table.wipe(vezaxcrash2)
table.wipe(vezaxname3)
table.wipe(vezaxcrash3)
table.wipe(vezaxname5)
table.wipe(vezaxcrash5)
psmajordead1=nil
psmajordead2=nil
if psmajordomoseed1 then
table.wipe(psmajordomoseed1)
table.wipe(psmajordomoseed2)

majonodeath1=nil
majonodeath2=nil

psmajoconcentr1=nil
psmajoconcentr2=nil

end


end
end


function pscombatlogboss56(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)
--local arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15 = ...

if arg2=="SPELL_DAMAGE" and (spellid==98620 or spellid==100215 or spellid==100216 or spellid==100217) and name1~=name2 and UnitName("boss1") then
pscmrboss561(guid2,name1,spellname,name2)
psunitisplayer(guid2,name2)
if psunitplayertrue then
	pscheckwipe1()
	if (psmajordomorep or pswipetrue==nil) and (pswasonboss56==1 or psmajordomorep) then
		if psmajordomorep==nil then
			psmajordom1={} --кто нанес урон
			psmajordom2={} --по кому нанес урон
		end
		psmajordomorep=GetTime()+0.7
		local bil=0
		for i=1,#psmajordom1 do
			if psmajordom1[i]==name1 then
				table.insert(psmajordom2[i],name2)
				bil=1
			end
		end
		if bil==0 then
			table.insert(psmajordom1,name1)
			table.insert(psmajordom2,{name2})
		end
	end
end


end

--кто НЕ умер, чекаем урон в самого себя, если ты сам себя убил взрывом это не та смерть
if arg2=="SPELL_DAMAGE" and (spellid==98620 or spellid==100215 or spellid==100216 or spellid==100217) and name1==name2 and arg13 and arg13>=0 and UnitName("boss1") then
if majonodeath1==nil then
majonodeath1={}
majonodeath2={}
end
table.insert(majonodeath1,name1)
table.insert(majonodeath2,GetTime())
end

--кто умер
if arg2=="UNIT_DIED" and name2 then
psunitisplayer(guid2,name2)
if psunitplayertrue then
	if psmajordead1==nil then
		psmajordead1={}
		psmajordead2={}
	end
	table.insert(psmajordead1,name2)
	table.insert(psmajordead2,GetTime())
end
end


--не разделили косу
if arg2=="SPELL_CAST_SUCCESS" and (spellid==98474 or spellid==100212 or spellid==100213 or spellid==100214) then

if pswasonboss56==nil then
	pswasonboss56=1
end
pscheckwipe1()
if pswipetrue or pswasonboss56==2 then
psmajonorepwipe=GetTime()
end


psmajordomowait=GetTime()+1
psmajordomonodamage={}
psmajordomogotdamage={}
local deb=GetSpellInfo(98450)
local psgropcheck=2
if GetRaidDifficultyID()==2 or GetRaidDifficultyID()==4 then
psgropcheck=5
end
	for i = 1,GetNumRaidMembers() do local name, _, subgroup, _, _, _, _, online, isDead = GetRaidRosterInfo(i)
		if (subgroup <= psgropcheck and online and isDead==nil and UnitIsDeadOrGhost(name)==false) then
			local _, _, _, _, _, _, expirationTime = UnitDebuff(name, deb)
			if expirationTime==nil or (expirationTime and expirationTime-GetTime()>7) then
				table.insert(psmajordomonodamage,name)
			end
		end
	end
end

if (arg2=="SPELL_DAMAGE" or arg2=="SPELL_MISSED") and (spellid==98620 or spellid==100215 or spellid==100216 or spellid==100217) and psmajordomoseed1 then
if pswasonboss56==nil then
	pswasonboss56=1
end
table.insert(psmajordomoseed1,name2)
table.insert(psmajordomoseed2,GetTime())
end


if (arg2=="SPELL_DAMAGE" or arg2=="SPELL_MISSED") and (spellid==98474 or spellid==100212 or spellid==100213 or spellid==100214) and psmajordomonodamage then
for i=1,#psmajordomonodamage do
	if psmajordomonodamage[i] then
		if psmajordomonodamage[i]==name2 then
			table.remove(psmajordomonodamage,i)
		end
	end
end

if arg2=="SPELL_DAMAGE" then
psunitisplayer(guid2,name2)
if psunitplayertrue then
	table.insert(psmajordomogotdamage,name2)
	if arg13 and arg13>=0 then
		psmajosomeonedie=GetTime()
	end
end
end

end




--легендарная сосредоточеность
if arg2=="SPELL_AURA_APPLIED" and spellid==98245 then
if pswasonboss56==nil then
	pswasonboss56=1
end
if psmajoconcentr1==nil then
	psmajoconcentr1={}
	psmajoconcentr2={}
end
local bil=0
if #psmajoconcentr1>0 then
	for i=1,#psmajoconcentr1 do
		if psmajoconcentr1[i]==name2 then
			bil=1
			psmajoconcentr2[i]=GetTime()
		end
	end
end
if bil==0 then
	table.insert(psmajoconcentr1,name2)
	table.insert(psmajoconcentr2,GetTime())
end

end

--спала сосредоточеность
if arg2=="SPELL_AURA_REMOVED" and spellid==98245 and psmajoconcentr1 then
for i=1,#psmajoconcentr1 do
	if psmajoconcentr1[i] and psmajoconcentr1[i]==name2 then
		local time=GetTime()-psmajoconcentr2[i]
		table.remove(psmajoconcentr1,i)
		table.remove(psmajoconcentr2,i)
		time=math.ceil(time*10)
		time=time/10
		addtotwotables5(name2,time)
		vezaxsort5()
	end
end
end
	


--сейанонсер
if arg2=="SPELL_CAST_SUCCESS" and (spellid==98535 or spellid==100206 or spellid==100207 or spellid==100208) then
if ps_saoptions[1][5][6][1]==1 then
ps_sa_checktargets(GetTime()+0.17,guid1,0.2,spellname.." "..psmain_sa_phrase1,3,0)
end
end

if arg2=="SPELL_CAST_SUCCESS" and spellid==98476 then
psmajotarget=GetTime()+0.15
psmajotargetna1=nil
psmajotargetna2=nil
end

if arg2=="SPELL_PERIODIC_DAMAGE" and (spellid==98535 or spellid==100206 or spellid==100207 or spellid==100208) then
if pswasonboss56==nil then
	pswasonboss56=1
end
psunitisplayer(guid2,name2)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss56~=2 then
		psiccwipereport_2("wipe", "try")
	end
		local ok=0
		if psmajotargetna1 and psmajotargetna2 and psmajotargetna1==name2 and GetTime()<psmajotargetna2 then
			ok=1
		end
		if ok==0 then
			addtotwotables3(name2)
			vezaxsort3()
		end
end
end



end