psbossfile52=1
function pscmrboss521(guid2,name2,spellname)

if pswasonboss52==nil then
	pswasonboss52=1
end
psunitisplayer(guid2,name2)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss52~=2 then
		psiccwipereport_2("wipe", "try")
	end
		addtotwotables(name2)
		vezaxsort1()

		pscaststartinfo(0,spellname..": "..psaddcolortxt(1,name2)..name2..psaddcolortxt(2,name2), -1, "id1", 1, spellname.." - "..psinfo,psbossnames[1][5][2],2)
end
end


function pscmrbossREPORT521(wipe,try,reset,checkforwipe)
if reset==nil then
if checkforwipe==nil or (checkforwipe and pswasonboss52 and pswasonboss52==1) then

	if pswasonboss52==1 then
		pssetcrossbeforereport1=GetTime()
		if psraidoptionson[1][5][2][1]==1 then
			strochkavezcrash=psfireldamagefrom.." |s4id97234,97234,101017,101018|id: "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][5][2][1]], true, vezaxname, vezaxcrash, 1)
		end
		if psraidoptionson[1][5][2][2]==1 then
			if psiccschet1>0 then
				pszapuskanonsa(psraidchats3[psraidoptionschat[1][5][2][2]], "|s4id99875|id - "..psiccschet1.." "..psfiretimes..".", true)
			end
		end

	end
	if pswasonboss52==1 or (pswasonboss52==2 and try==nil) then

		psiccsavinginf(psbossnames[1][5][2], try, pswasonboss52)
		strochkavezcrash=psfireldamagefrom.." |s4id97234,97234,101017,101018|id: "
		reportafterboitwotab("raid", true, vezaxname, vezaxcrash, nil, nil,0,1)
		if psiccschet1>0 then
			pszapuskanonsa("raid", "|s4id99875|id - "..psiccschet1.." "..psfiretimes..".", true,nil,0,1)
		end

		psiccrefsvin()

	end


	if wipe then
		pswasonboss52=2
		pscheckbossincombatmcr_2=GetTime()+1
	end
end
end
end


function  pscmrbossRESET521(wipe,try,reset,checkforwipe)
if reset or wipe==nil then
pswasonboss52=nil
table.wipe(vezaxname)
table.wipe(vezaxcrash)
psiccschet1=0
end
end


function pscombatlogboss52(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)
--local arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid,spellname,arg11,arg12,arg13,arg14,arg15 = ...

if arg2=="SPELL_DAMAGE" and (spellid==99631 or spellid==97234 or spellid==101017 or spellid==101018) then
pscmrboss521(guid2,name2,spellname)
end

if arg2=="SPELL_CAST_START" and spellid==99875 then
if pswasonboss52==nil then
	pswasonboss52=1
end
	pscheckwipe1()
	if pswipetrue and pswasonboss52~=2 then
		psiccwipereport_2("wipe", "try")
	end

psiccschet1=psiccschet1+1
end



end