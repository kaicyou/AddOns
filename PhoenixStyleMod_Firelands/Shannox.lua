psbossfile54=1
function pscmrboss541(guid2,name2,spellname)
if pswasonboss54==nil then
	pswasonboss54=1
end
--psunitisplayer(guid2,name2)
--if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss54~=2 then
		psiccwipereport_2("wipe", "try")
	end
		addtotwotables(name2)
		vezaxsort1()
		psunitisplayer(guid2,name2)
		if psunitplayertrue then
		if psraidoptionson[1][5][4][1]==1 and pswasonboss54==1 then
			if UnitSex(name2) and UnitSex(name2)==3 then
				pszapuskanonsa(psraidchats3[psraidoptionschat[1][5][4][1]], "{rt8} "..name2.." "..psfirelgotinf.." |s4id99837|id!")
			else
				pszapuskanonsa(psraidchats3[psraidoptionschat[1][5][4][1]], "{rt8} "..name2.." "..psfirelgotinm.." |s4id99837|id!")
			end
		end
		end

		pscaststartinfo(0,spellname..": "..psaddcolortxt(1,name2)..name2..psaddcolortxt(2,name2), -1, "id1", 1, spellname.." - "..psinfo,psbossnames[1][5][4],2)

--end
end

function pscmrboss542(guid2,name2,spellname)
if pswasonboss54==nil then
	pswasonboss54=1
end
--psunitisplayer(guid2,name2)
--if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss54~=2 then
		psiccwipereport_2("wipe", "try")
	end
		addtotwotables2(name2)
		vezaxsort2()

		pscaststartinfo(0,spellname..": "..psaddcolortxt(1,name2)..name2..psaddcolortxt(2,name2), -1, "id1", 2, spellname.." - "..psinfo,psbossnames[1][5][4],2)
--end
end

function pscmrboss543(guid2,name2,spellname,arg12)
if pswasonboss54==nil then
	pswasonboss54=1
end
psunitisplayer(guid2,name2)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss54~=2 then
		psiccwipereport_2("wipe", "try")
	end
		addtotwotables4(name2)
		vezaxsort4()

		pscaststartinfo(0,spellname..": "..psaddcolortxt(1,name2)..name2..psaddcolortxt(2,name2).." ("..arg12..")", -1, "id1", 3, spellname.." - "..psinfo,psbossnames[1][5][4],2)
end
end

function pscmrboss544(guid2,name2,spellname)
if pswasonboss54==nil then
	pswasonboss54=1
end
psunitisplayer(guid2,name2)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss54~=2 then
		psiccwipereport_2("wipe", "try")
	end
		addtotwotables5(name2)
		vezaxsort5()

		pscaststartinfo(0,spellname..": "..psaddcolortxt(1,name2)..name2..psaddcolortxt(2,name2), -1, "id1", 4, spellname.." - "..psinfo,psbossnames[1][5][4],2)
end
end

function pscmrboss545(guid2,name2,spellname)
if pswasonboss54==nil then
	pswasonboss54=1
end
psunitisplayer(guid2,name2)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss54~=2 then
		psiccwipereport_2("wipe", "try")
	end
		addtotwotables6(name2)
		vezaxsort6()

		pscaststartinfo(0,spellname..": "..psaddcolortxt(1,name2)..name2..psaddcolortxt(2,name2), -1, "id1", 5, spellname.." - "..psinfo,psbossnames[1][5][4],2)
end
end

function pscmrbossREPORT541(wipe,try,reset,checkforwipe)
if reset==nil then
if checkforwipe==nil or (checkforwipe and pswasonboss54 and pswasonboss54==1) then

	if pswasonboss54==1 then
		pssetcrossbeforereport1=GetTime()
		if psraidoptionson[1][5][4][2]==1 then
			strochkavezcrash=psfirelgot.." |s4id99837|id ("..psfireltotal.."): "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][5][4][2]], true, vezaxname, vezaxcrash, 1)
		end
		if psraidoptionson[1][5][4][3]==1 then
			strochkavezcrash=psfirelgot.." |s4id99838|id: "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][5][4][3]], true, vezaxname2, vezaxcrash2, 1)
		end
		if psraidoptionson[1][5][4][4]==1 then
			strochkavezcrash=psfiretxtoptt544..": "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][5][4][4]], true, vezaxname3, vezaxcrash3, 1)
		end
		if psraidoptionson[1][5][4][5]==1 then
			strochkavezcrash=psfireldamagefrom.." |s4id100495|id: "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][5][4][5]], true, vezaxname4, vezaxcrash4, 1)
		end
		if psraidoptionson[1][5][4][6]==1 then
			strochkavezcrash=psfireldamagefrom.." |s4id99842,101205,101206,101207|id: "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][5][4][6]], true, vezaxname5, vezaxcrash5, 1)
		end
		if psraidoptionson[1][5][4][7]==1 then
			strochkavezcrash=psfireldamagefrom.." |s4id99931,101201,101202,101203|id ("..psfireshanaddopt3.."): "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][5][4][7]], true, vezaxname6, vezaxcrash6, 1)
		end



	end
	if pswasonboss54==1 or (pswasonboss54==2 and try==nil) then

		psiccsavinginf(psbossnames[1][5][4], try, pswasonboss54)

		strochkavezcrash=psfirelgot.." |s4id99837|id: "
		reportafterboitwotab("raid", true, vezaxname, vezaxcrash, nil, nil,0,1)
		strochkavezcrash=psfirelgot.." |s4id99838|id: "
		reportafterboitwotab("raid", true, vezaxname2, vezaxcrash2, nil, nil,0,1)
		strochkavezcrash=psfiretxtoptt544..": "
		reportafterboitwotab("raid", true, vezaxname3, vezaxcrash3, nil, nil,0,1)
		strochkavezcrash=psfireldamagefrom.." |s4id100495|id: "
		reportafterboitwotab("raid", true, vezaxname4, vezaxcrash4, nil, nil,0,1)
		strochkavezcrash=psfireldamagefrom.." |s4id100495|id: "
		reportafterboitwotab("raid", true, vezaxname5, vezaxcrash5, nil, nil,0,1)
		strochkavezcrash=psfireldamagefrom.." |s4id100495|id ("..psfireshanaddopt3.."): "
		reportafterboitwotab("raid", true, vezaxname6, vezaxcrash6, nil, nil,0,1)

		psiccrefsvin()

	end




	if wipe then
		pswasonboss54=2
		pscheckbossincombatmcr_2=GetTime()+1
	end
end
end
end


function  pscmrbossRESET541(wipe,try,reset,checkforwipe)
if reset or wipe==nil then
pswasonboss54=nil
table.wipe(vezaxname)
table.wipe(vezaxcrash)
table.wipe(vezaxname2)
table.wipe(vezaxcrash2)
table.wipe(vezaxname3)
table.wipe(vezaxcrash3)
table.wipe(vezaxname4)
table.wipe(vezaxcrash4)
table.wipe(vezaxname5)
table.wipe(vezaxcrash5)
table.wipe(vezaxname6)
table.wipe(vezaxcrash6)
psshani1=nil
psshani2=nil
psshani3=nil
psshani4=nil
psshani5=nil
psshani6=nil
psshani7=nil
psshani8=nil
end
end


function pscombatlogboss54(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)
--local arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15 = ...


--сейанонсеры
if arg2=="SPELL_SUMMON" and (spellid==99836) then
if ps_saoptions[1][5][4][1]==1 then
ps_sa_checktargets(GetTime()+0.17,guid1,0.2,spellname.." "..psmain_sa_phrase1,3,0)
end
end

if arg2=="SPELL_SUMMON" and (spellid==99839) then
if ps_saoptions[1][5][4][2]==1 then
ps_sa_checktargets(GetTime()+0.17,guid1,0.2,spellname.." "..psmain_sa_phrase1,3,0)
end
end


if arg2=="SPELL_AURA_APPLIED" and spellid==99837 then
pscmrboss541(guid2,name2,spellname)
end

if arg2=="SPELL_AURA_APPLIED" and (spellid==99838 or spellid==101208 or spellid==101209 or spellid==101210) then
pscmrboss542(guid2,name2,spellname)
end

if arg2=="SPELL_DAMAGE" and spellid==100495 then
pscmrboss543(guid2,name2,spellname,arg12)
end

if arg2=="SPELL_DAMAGE" and (spellid==99842 or spellid==101205 or spellid==101206 or spellid==101207) then
pscmrboss544(guid2,name2,spellname)
end

if arg2=="SPELL_CAST_SUCCESS" and (spellid==99931 or spellid==101201 or spellid==101202 or spellid==101203) then
psshantank=name2
end

if arg2=="SPELL_DAMAGE" and (spellid==99931 or spellid==101201 or spellid==101202 or spellid==101203) then
if psshantank==nil or (psshantank and name2~=psshantank) then
pscmrboss545(guid2,name2,spellname)
end
end



--Face Rage

--получение сложности (чтоб понять какой урон жду)
--10
if arg2=="SPELL_AURA_APPLIED" and (spellid==100129 or spellid==101213) then
psshannoxdmg=30000
end
--25
if arg2=="SPELL_AURA_APPLIED" and (spellid==101212 or spellid==101214) then
psshannoxdmg=45000
end

--начинает жевать
if arg2=="SPELL_AURA_APPLIED" and spellid==99947 then

--проверка, если пременные заняты, не найден сброс инфо...
if psshani1 then
pscaststartinfo(0,spellname.." %s: "..psaddcolortxt(1,psshani2)..psshani2..psaddcolortxt(2,psshani2).." no information in combat log found - ERROR", -1, "id1", 10, spellname.." - "..psinfo,psbossnames[1][5][4],2)
end

psshani1=GetTime() --начал жевать
psshani2=name2 --кого
psshani3=nil --кто разбил
psshani4=nil --скока нанес
psshani5=nil --за скока сек
psshani6=nil --какой абилкой
psshani7=0 --Жив пока что
psshani8=nil --снят дебаф + 1 сек
if psshannoxdmg==nil then
psshannoxdmg=30000
end
end

if psshani1 and psshani3==nil then
if (arg2=="SPELL_DAMAGE" or arg2=="SPELL_PERIODIC_DAMAGE" or arg2=="RANGE_DAMAGE") and arg12 and arg12>=psshannoxdmg then
	local id=psGetUnitID(guid2)
	if id==53695 then
		psshani3=name1
		psshani4=arg12
		psshani5=(math.ceil((GetTime()-psshani1)*10))/10
		psshani6=spellname
	end
end
if (arg2=="SWING_DAMAGE") and spellid and spellid>=psshannoxdmg then --при мили ударе урон в другой переменной
	local id=psGetUnitID(guid2)
	if id==53695 then
		psshani3=name1
		psshani4=spellid
		psshani5=(math.ceil((GetTime()-psshani1)*10))/10
		psshani6="melee"
	end
end
if arg2=="UNIT_DIED" and name2==psshani2 then
psshani7=GetTime()
end
end

--дебафф снялся, 1 сек ждем?!
if arg2=="SPELL_AURA_REMOVED" and spellid==99947 then
psshani8=GetTime()+1
end



end