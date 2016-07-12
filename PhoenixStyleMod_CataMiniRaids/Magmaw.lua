psbossfile21=1
function pscmrboss211(arg6,arg7)
psunitisplayer(arg6,arg7)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss21~=2 then
		psiccwipereport("wipe", "try")
	end
		addtotwotables(arg7)
		vezaxsort1()
end
end

function pscmrboss212(arg6,arg7)
psunitisplayer(arg6,arg7)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss21~=2 then
		psiccwipereport("wipe", "try")
	end
		addtotwotables2(arg7)
		vezaxsort2()
end
end

function pscmrboss213(arg6,arg7,arg10)
psunitisplayer(arg6,arg7)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss21~=2 then
		psiccwipereport("wipe", "try")
	end
		addtotwotables3(arg7)
		vezaxsort3()

		pscaststartinfo(0,arg10..": "..psaddcolortxt(1,arg7)..arg7..psaddcolortxt(2,arg7), -1, "id1", 1, arg10.." - "..psinfo,psbossnames[1][2][1],2)
end
end


function pscmrboss214(arg6,arg7,arg10)
psunitisplayer(arg6,arg7)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss21~=2 then
		psiccwipereport("wipe", "try")
	end
		addtotwotables4(arg7)
		vezaxsort4()

		pscaststartinfo(0,arg10..": "..psaddcolortxt(1,arg7)..arg7..psaddcolortxt(2,arg7), -1, "id1", 2, arg10.." - "..psinfo,psbossnames[1][2][1],2)
end
end

function pscmrboss215(arg6,arg7,arg10)
psunitisplayer(arg6,arg7)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss21~=2 then
		psiccwipereport("wipe", "try")
	end
		addtotwotables5(arg7)
		vezaxsort5()

		pscaststartinfo(0,arg10..": "..psaddcolortxt(1,arg7)..arg7..psaddcolortxt(2,arg7), -1, "id1", 3, arg10.." - "..psinfo,psbossnames[1][2][1],2)
end
end



function pscmrbossREPORT211(wipe,try,reset,checkforwipe)
if reset==nil then
if checkforwipe==nil or (checkforwipe and pswasonboss21 and pswasonboss21==1) then

	if pswasonboss21==1 then
		pssetcrossbeforereport1=GetTime()
		--тут репорт
		if psraidoptionson[1][2][1][1]==1 then
			strochkavezcrash=pscmrtxtoptt211.." "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][2][1][1]], true, vezaxname, vezaxcrash, 1)
		end
		if psraidoptionson[1][2][1][2]==1 then
			strochkavezcrash=pscmrtxtoptt212.." "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][2][1][2]], true, vezaxname2, vezaxcrash2, 1)
		end
		if psraidoptionson[1][2][1][3]==1 then
			strochkavezcrash=pscmrtxtoptt213.." "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][2][1][3]], true, vezaxname3, vezaxcrash3, 1)
		end
		if psraidoptionson[1][2][1][4]==1 then
			strochkavezcrash=pscmrtxtoptt214.." "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][2][1][4]], true, vezaxname4, vezaxcrash4, 1)
		end
		if psraidoptionson[1][2][1][5]==1 then
			strochkavezcrash=pscmrtxtoptt215.." "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][2][1][5]], true, vezaxname5, vezaxcrash5, 1)
		end

	end
	if pswasonboss21==1 or (pswasonboss21==2 and try==nil) then

	psiccsavinginf(psbossnames[1][2][1], try, pswasonboss21)
		--тут сохранение
	strochkavezcrash=pscmrtxtoptt211.." "
	reportafterboitwotab("raid", true, vezaxname, vezaxcrash, nil, nil,0,1)
	strochkavezcrash=pscmrtxtoptt212.." "
	reportafterboitwotab("raid", true, vezaxname2, vezaxcrash2, nil, nil,0,1)
	strochkavezcrash=pscmrtxtoptt213.." "
	reportafterboitwotab("raid", true, vezaxname3, vezaxcrash3, nil, nil,0,1)
	strochkavezcrash=pscmrtxtoptt214.." "
	reportafterboitwotab("raid", true, vezaxname4, vezaxcrash4, nil, nil,0,1)
	strochkavezcrash=pscmrtxtoptt215.." "
	reportafterboitwotab("raid", true, vezaxname5, vezaxcrash5, nil, nil,0,1)

	psiccrefsvin()

	end

	if wipe then
		pswasonboss21=2
		pscheckbossincombatmcr=GetTime()+1
	end
end
end
end


function pscmrbossRESET211(wipe,try,reset,checkforwipe)
if reset or wipe==nil then
pswasonboss21=nil
--тут резет
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
end
end






function pscombatlogboss21(...)
local arg1, arg2, argnew1, arg3,arg4,arg5,argNEW,arg6,arg7,arg8,argNEW2,arg9,arg10,arg11,arg12,arg13,arg14, arg15 = ...


if (arg2=="SPELL_DAMAGE") and (arg9==77971 or arg9==91918 or arg9==91929 or arg9==91930) then
pscmrboss211(arg6,arg7)
end

if (arg2=="SPELL_AURA_APPLIED") and (arg9==78941 or arg9==91913 or arg9==94678 or arg9==94679) then
pscmrboss212(arg6,arg7)
end

if (arg2=="SPELL_DAMAGE") and (arg9==92154 or arg9==92190 or arg9==92191 or arg9==92192) then
pscmrboss213(arg6,arg7,arg10)
end

if (arg2=="SPELL_DAMAGE") and (arg9==92134 or arg9==92196 or arg9==92197 or arg9==92198) then
pscmrboss214(arg6,arg7,arg10)
end

if (arg2=="SPELL_DAMAGE") and (arg9==88287 or arg9==91914 or arg9==91921 or arg9==91922) then
pscmrboss215(arg6,arg7,arg10)
end


end