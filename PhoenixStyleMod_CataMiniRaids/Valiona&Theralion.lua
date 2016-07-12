psbossfile32=1
function pscmrboss321(arg6,arg7,arg10,arg4)
psunitisplayer(arg6,arg7)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss32~=2 then
		psiccwipereport("wipe", "try")
	end
		addtotwotables(arg7)
		vezaxsort1()
		if arg7==UnitName("player") then
			pszapuskdelayphasing=pszapuskdelayphasing+2
		end

		local nnn=GetSpellInfo(88436)
		local nnn2=""
		if arg4 then
			nnn2=" ("..arg4..")"
		end
		pscaststartinfo(0,arg10..nnn2..": "..psaddcolortxt(1,arg7)..arg7..psaddcolortxt(2,arg7), -1, "id1", 2, nnn.." - "..psinfo,psbossnames[1][3][2],2)

		if psraidoptionson[1][3][2][2]==1 then
			if pswasonboss32 and pswasonboss32~=2 then
			if UnitSex(arg7) and UnitSex(arg7)==3 then
				pszapuskanonsa(psraidchats3[psraidoptionschat[1][3][2][2]], "{rt8} "..arg7.." - "..pscmrtxtoptt322m..nnn2)
			else
				pszapuskanonsa(psraidchats3[psraidoptionschat[1][3][2][2]], "{rt8} "..arg7.." - "..pscmrtxtoptt322f..nnn2)
			end
			end
		end
end
end

function pscmrboss322(arg6,arg7)
psunitisplayer(arg6,arg7)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss32~=2 then
		psiccwipereport("wipe", "try")
	end
		addtotwotables2(arg7)
		vezaxsort2()
end
end

function pscmrboss323(arg6,arg7)
psunitisplayer(arg6,arg7)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss32~=2 then
		psiccwipereport("wipe", "try")
	end
		addtotwotables3(arg7)
		vezaxsort3()
end
end



function pscmrbossREPORT321(wipe,try,reset, checkforwipe)
if reset==nil then
if checkforwipe==nil or (checkforwipe and pswasonboss32 and pswasonboss32==1) then

	if pswasonboss32==1 then
		pssetcrossbeforereport1=GetTime()
		if psraidoptionson[1][3][2][3]==1 then
			strochkavezcrash=pscmrtxtoptt323.." "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][3][2][3]], true, vezaxname2, vezaxcrash2, 1)
		end
		if psraidoptionson[1][3][2][4]==1 then
			strochkavezcrash=pscmrtxtoptt324.." "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][3][2][4]], true, vezaxname, vezaxcrash, 1)
		end
		if psraidoptionson[1][3][2][5]==1 then
			strochkavezcrash=pscmrtxtoptt325.." "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][3][2][5]], true, vezaxname3, vezaxcrash3, 1)
		end

	end
	if pswasonboss32==1 or (pswasonboss32==2 and try==nil) then

	psiccsavinginf(psbossnames[1][3][2], try, pswasonboss32)
	strochkavezcrash=pscmrtxtoptt323.." "
	reportafterboitwotab("raid", true, vezaxname2, vezaxcrash2, nil, nil,0,1)
	strochkavezcrash=pscmrtxtoptt324.." "
	reportafterboitwotab("raid", true, vezaxname, vezaxcrash, nil, nil,0,1)
	strochkavezcrash=pscmrtxtoptt325.." "
	reportafterboitwotab("raid", true, vezaxname3, vezaxcrash3, nil, nil,0,1)
	psiccrefsvin()

	end

	if wipe then
		pswasonboss32=2
		pscheckbossincombatmcr=GetTime()+1
	end
end
end
end


function pscmrbossRESET321(wipe,try,reset, checkforwipe)
if reset or wipe==nil then
pswasonboss32=nil
table.wipe(vezaxname)
table.wipe(vezaxcrash)
table.wipe(vezaxname2)
table.wipe(vezaxcrash2)
table.wipe(vezaxname3)
table.wipe(vezaxcrash3)
end
end


function pscombatlogboss32(...)
local arg1, arg2, argnew1, arg3,arg4,arg5,argNEW,arg6,arg7,arg8,argNEW2,arg9,arg10,arg11,arg12,arg13,arg14, arg15 = ...


if pscmrvalionatabldelay then
	--проверять все только когда запущен делей
	if arg2=="SPELL_AURA_REMOVED" and (arg9==86788 or arg9==92876 or arg9==92877 or arg9==92878) then
		pscmrvalionatabldelay=GetTime()+1.3
		pscmrvalionatabl7=GetTime()
	end
	if arg2=="SPELL_DISPEL" and (arg9==86788 or arg9==92876 or arg9==92877 or arg9==92878) then
		if pscmrvalionatabl4==nil then
			pscmrvalionatabl4=arg4
			pscmrvalionatabl7=GetTime()
		end
	end
	if (arg2=="SPELL_DAMAGE" or arg2=="SPELL_MISSED") and (arg9==86825 or arg9==92879 or arg9==92880 or arg9==92881) then
		local bil=0
		for t=1,#pscmrvalionatabl1 do
			if pscmrvalionatabl1[t]==arg7 then
				bil=1
			end
		end
		if bil==0 then
			table.insert(pscmrvalionatabl1,arg7)
		end
		if arg2=="SPELL_DAMAGE" and arg13 and arg13>0 then
			pscmrvalionatabl5=arg12
		end
	end
	if (arg2=="SPELL_HEAL" or arg2=="SPELL_PERIODIC_HEAL") and arg7==pscmrvalionatabl1[1] and arg14 and arg14>10 then
		addtotwodamagetables(arg4, arg14)
		psdamagetwotablsort1()
	end
end

if arg2=="SPELL_AURA_APPLIED" and (arg9==88436 or arg9==92890 or arg9==92891 or arg9==92892 or arg9==92893 or arg9==92894 or arg9==92889 or arg9==86202) then
pscmrboss321(arg6,arg7,arg10)
end

if (arg2=="SPELL_DAMAGE" or (arg2=="SPELL_MISSED" and arg12 and arg12=="ABSORB")) and arg9==93055 then
pscmrboss321(arg6,arg7,arg10,arg4)
end

if arg2=="SPELL_DAMAGE" and (arg9==86844 or arg9==90949 or arg9==92872 or arg9==92873 or arg9==92874) and arg12 and arg12>9999 then
pscmrboss322(arg6,arg7)
end

if (arg2=="SPELL_DAMAGE" or (arg2=="SPELL_MISSED" and arg12 and arg12=="ABSORB")) and (arg9==86505 or arg9==92909 or arg9==92908 or arg9==92907) then
pscmrboss323(arg6,arg7)
end

if arg2=="SPELL_AURA_APPLIED" and (arg9==86788 or arg9==92876 or arg9==92877 or arg9==92878) then
if ps_saoptions[1][3][2][2]==1 then
ps_sa_sendinfo(arg7, arg10.." "..psmain_sa_phrase1, 2, nil, nil)
end

if pscmrvalionatabldelay then
pscmrvalionatabldelay=nil
pscmrvalionatabl1=nil
pscmrvalionatabl2=nil
table.wipe(psdamagename2)
table.wipe(psdamagevalue2)
pscmrvalionatabl4=nil
pscmrvalionatabl5=nil
end

pscmrvalionatabl1={} --кто получил урон
pscmrvalionatabl2={} --кто НЕ получил урон
pscmrvalionatabl4=nil --кто сдиспелил
pscmrvalionatabl5=nil --есть ли трупы
pscmrvalionatabl6=GetTime() --начало дебафа время
pscmrvalionatabl7=0 --конец дебафа время
pscmrvalionatabl8=0 -- скока хила абсорб!
if arg9==92878 then
pscmrvalionatabl8=75000
elseif arg9==92876 then
pscmrvalionatabl8=50000
elseif arg9==92877 then
pscmrvalionatabl8=40000
else
pscmrvalionatabl8=20000
end



table.wipe(pscmrvalionatabl1)
table.wipe(pscmrvalionatabl2)
table.wipe(psdamagename2)
table.wipe(psdamagevalue2)

table.insert(pscmrvalionatabl1,arg7)

pscmrvalionatabldelay=GetTime()+16 --репорт через 16 сек если все ок
end

if arg2=="SPELL_AURA_APPLIED" and (arg9==86622 or arg9==95639 or arg9==95640 or arg9==95641) then
if ps_saoptions[1][3][2][1]==1 then
ps_sa_sendinfo(arg7, arg10.." "..psmain_sa_phrase1, 2, nil, nil)
end
end

if arg2=="SPELL_CAST_START" and (arg9==86369 or arg9==92898 or arg9==92899 or arg9==92900) then
if ps_saoptions[1][3][2][3]==1 then
ps_sa_checktargets(GetTime()+0.17,arg3,0.2,arg10.." "..psmain_sa_phrase1,3,0)
end
end

end