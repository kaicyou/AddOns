psbossfile23=1
function pscmrboss233(arg6,arg7,arg10,arg9)
psunitisplayer(arg6,arg7)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss23~=2 then
		psiccwipereport("wipe", "try")
	end
		addtotwotables3(arg7)
		vezaxsort3()

		pscaststartinfo(arg9,arg10.." %s: "..psaddcolortxt(1,arg7)..arg7..psaddcolortxt(2,arg7), -1, "id1", 4, arg10.." - "..psinfo,psbossnames[1][2][3],2)
end
end



function pscmrbossREPORT231(wipe,try,reset,checkforwipe)
if reset==nil then
if checkforwipe==nil or (checkforwipe and pswasonboss23==1) then

	local txt1=""
	local txt2=""

	if pswasonboss23==1 then
		--тут репорт
		pssetcrossbeforereport1=GetTime()
			if psmaloriakdisptable and #psmaloriakdisptable>0 then
				if psraidoptionson[1][2][3][4]==0 then
					txt1=txt1.."|s4id77912,92965,92966,92967|id "..pscmrtxtoptt2311.." ("
				else
					txt1=txt1.."|s4id77912,92965,92966,92967|id ("..pscmronlylastp..") "..pscmrtxtoptt2311.." ("
				end
				local l=0
				local n=0
				for i=1,#psmaloriakdisptable do
					if psmaloriakdisptable[i]==1 then
						l=l+1
					elseif psmaloriakdisptable[i]==0 then
						n=n+1
					end
				end
				txt1=txt1..l..")"
				if l>0 then
					txt1=txt1..": "
					for i=1,#vezaxname do
						txt1=txt1..vezaxname[i].." ("..vezaxcrash[i]..")"
						if i==#vezaxname then
							txt1=txt1..". "
						else
							txt1=txt1..", "
						end
					end
				else
					txt1=txt1..". "
				end
				txt1=txt1..pscmrtxtoptt2312..": "..n
				local last=0
				local h=#psmaloriakdisptable
				while h>0 do
					if psmaloriakdisptable[h]==0 then
						last=last+1
						h=h-1
					else
						h=0
					end
				end
				if last>0 and l>0 then
					txt1=txt1.." ("..pscmrtxtoptt2316..": "..last.."). "
				else
					txt1=txt1..". "
				end
				local temptxt=psiccschet3
				if (string.len(psiccschet3)) > 6 then
					temptxt=string.sub(psiccschet3,1,string.len(psiccschet3)-6).."."..string.sub(psiccschet3,(string.len(psiccschet3)-5),string.len(psiccschet3)-3).."."..string.sub(psiccschet3,(string.len(psiccschet3)-2))
				elseif (string.len(psiccschet3)) > 3 then
					temptxt=string.sub(psiccschet3,1,string.len(psiccschet3)-3).."."..string.sub(psiccschet3,(string.len(psiccschet3)-2))
				end
				txt1=txt1..pscmrtxtoptt2313..": "..temptxt
				if l>1 and psmaloriakbestandworst and psmaloriakbestandworst[1] then
					txt2=txt2..pscmrtxtoptt2314..": "..psmaloriakbestandworst[1].." ("..(math.ceil((psmaloriakbestandworst[2])*10)/10).."), "..pscmrtxtoptt2315..": "..psmaloriakbestandworst[3].." ("..(math.ceil((psmaloriakbestandworst[4])*10)/10)..")"
				end
			end
		if psraidoptionson[1][2][3][1]==1 then
			if psmaloriakdisptable and #psmaloriakdisptable>0 then
				pszapuskanonsa(psraidchats3[psraidoptionschat[1][2][3][1]], txt1, true)
				if string.len(txt2)>3 then
				pszapuskanonsa(psraidchats3[psraidoptionschat[1][2][3][1]], txt2, true)
				end
			end
		end
		if psraidoptionson[1][2][3][3]==1 then
			strochkavezcrash=pscmrtxtoptt233.." "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][2][3][3]], true, vezaxname3, vezaxcrash3, 1)
		end
		if psraidoptionson[1][2][3][5]==1 then
			strochkavezcrash=pscmrtxtoptt235.." "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][2][3][5]], true, vezaxname4, vezaxcrash4, 1)
		end

	end
	if pswasonboss23==1 or (pswasonboss23==2 and try==nil) then

	psiccsavinginf(psbossnames[1][2][3], try, pswasonboss23)
		--тут сохранение
			if psmaloriakdisptable and #psmaloriakdisptable>0 then
	pszapuskanonsa("raid", txt1, true,nil,0,1)
				if string.len(txt2)>3 then
	pszapuskanonsa("raid", txt2, true,nil,0,1)
				end
			end
	strochkavezcrash=pscmrtxtoptt233.." "
	reportafterboitwotab("raid", true, vezaxname3, vezaxcrash3, nil, nil,0,1)
	strochkavezcrash=pscmrtxtoptt235.." "
	reportafterboitwotab("raid", true, vezaxname4, vezaxcrash4, nil, nil,0,1)
	psiccrefsvin()

	end

	if wipe then
		pswasonboss23=2
		pscheckbossincombatmcr=GetTime()+1
	end
end
end
end


function pscmrbossRESET231(wipe,try,reset,checkforwipe)
if reset or wipe==nil then
pswasonboss23=nil
--тут резет
psmaloriakwait50=nil
table.wipe(vezaxname)
table.wipe(vezaxcrash)
table.wipe(vezaxname3)
table.wipe(vezaxcrash3)
table.wipe(vezaxname4)
table.wipe(vezaxcrash4)
end
end







function pscombatlogboss23(...)
local arg1, arg2, argnew1, arg3,arg4,arg5,argNEW,arg6,arg7,arg8,argNEW2,arg9,arg10,arg11,arg12,arg13,arg14, arg15 = ...



if arg2=="SPELL_DAMAGE" and (arg9==78208 or arg9==93041 or arg9==93042 or arg9==93043) then
pscmrboss233(arg6,arg7,arg10,arg9)
end

if (arg2=="SPELL_CAST_SUCCESS" or arg2=="SPELL_CAST_START") and (arg9==77896 or arg9==92961 or arg9==92962 or arg9==92963) and psraidoptionson[1][2][3][2]==1 then
pscheckrunningbossid(arg3)
local adinfo=""
if pscheckslowdebuff(arg3) then
else
adinfo=" (|cffff0000"..pscmrnocastslow.."|r)"
end
psmalordmgcount1=GetTime()+7
psmalordmgcount2=0
pscaststartinfo(arg9,arg10..": %s"..adinfo..".", 6, arg3, 1, arg10.." - "..pscmreventsincomb2,psbossnames[1][2][3])
end

if psmalordmgcount1 and arg2=="SPELL_DAMAGE" and (arg9==77908 or arg9==92961 or arg9==92962 or arg9==92963) then
	psunitisplayer(arg6,arg7)
	if psunitplayertrue then
		psmalordmgcount2=psmalordmgcount2+arg12
	end
end

if psmalordmgcount1 and arg2=="SPELL_INTERRUPT" and (arg12==77896 or arg12==92961 or arg12==92962 or arg12==92963) then
if GetTime()<psmalordmgcount1+1 then
psmalordmgcount1=GetTime()+1
end
end

if arg2=="SPELL_CAST_START" and (arg9==77569 or arg9==92703 or arg9==92704) and psraidoptionson[1][2][3][2]==1 then
pscheckrunningbossid(arg3)
local adinfo=""
if pscheckslowdebuff(arg3) then
else
adinfo=" (|cffff0000"..pscmrnocastslow.."|r)"
end
pscaststartinfo(arg9,arg10..": %s"..adinfo..".", 2, arg3, 2, arg10.." - "..pscmreventsincomb2,psbossnames[1][2][3])
end

if arg2=="SPELL_AURA_APPLIED" and (arg9==77912 or arg9==92965 or arg9==92966 or arg9==92967) then
	pscheckwipe1()
	if pswipetrue and pswasonboss23~=2 then
		psiccwipereport("wipe", "try")
	end

psiccschet1=GetTime()
psiccschet5=0
if psmaloriakdisptable==nil then
psmaloriakdisptable={}
psmaloriakbestandworst=nil
psmaloriakbestandworst={}
end


end

if arg2=="SPELL_CAST_START" and arg9==77991 then
psmaloriakphase=nil
if psraidoptionson[1][2][3][2]==1 then
pscaststartinfo(arg9,arg10, 0, "idd", 3, arg10.." - "..pscmreventsincomb2,psbossnames[1][2][3])
end
end

if arg2=="SPELL_AURA_REMOVED" and (arg9==77912 or arg9==92965 or arg9==92966 or arg9==92967) and psiccschet1>0 then
local id=psGetUnitID(arg6)
if id==41378 then
	pscheckwipe1()
	if pswipetrue and pswasonboss23~=2 then
		psiccwipereport("wipe", "try")
	end
psiccschet2=GetTime()
psmaloriakwait50=GetTime()+0.5

end
end

if psmaloriakwait50 and (arg2=="SPELL_DISPEL" or arg2=="SPELL_STOLEN") and (arg9==77912 or arg9==92965 or arg9==92966 or arg9==92967) then
psmaloriakwait50=nil


if psraidoptionson[1][2][3][4]==0 or (psraidoptionson[1][2][3][4]==1 and psmaloriakphase==nil) then
table.insert(psmaloriakdisptable,1)
addtotwotables(arg4)
vezaxsort1()
end


local maltmp=psiccschet2-psiccschet1

psiccschet1=0
psiccschet2=0

if psraidoptionson[1][2][3][2]==1 then
pscaststartinfo(0,arg13.." %s: "..psaddcolortxt(1,arg4)..arg4..psaddcolortxt(2,arg4).." ("..((math.ceil(maltmp*10))/10).."). "..pscmrtxtoptt2313..": "..psiccschet5, -1, "id1", 3, arg13.." - "..psinfo,psbossnames[1][2][3],2)
end

psiccschet5=0


if psraidoptionson[1][2][3][4]==0 or (psraidoptionson[1][2][3][4]==1 and psmaloriakphase==nil) then
if psmaloriakbestandworst[1]==nil then
psmaloriakbestandworst[1]=arg4
psmaloriakbestandworst[2]=maltmp
psmaloriakbestandworst[3]=arg4
psmaloriakbestandworst[4]=maltmp
else
	if psmaloriakbestandworst[2]>maltmp then
		psmaloriakbestandworst[1]=arg4
		psmaloriakbestandworst[2]=maltmp
	end
	if psmaloriakbestandworst[4]<maltmp then
		psmaloriakbestandworst[3]=arg4
		psmaloriakbestandworst[4]=maltmp
	end
end
end

end

if arg2=="SPELL_PERIODIC_HEAL" and (arg9==77912 or arg9==92965 or arg9==92966 or arg9==92967) then
local id=psGetUnitID(arg6)
if id==41378 then
psiccschet5=psiccschet5+arg12
	pscheckwipe1()
	if pswipetrue and pswasonboss23~=2 then
		psiccwipereport("wipe", "try")
	end
		psiccschet3=psiccschet3+arg12
end
end

if arg2=="SPELL_PERIODIC_DAMAGE" and (arg9==92930 or arg9==92986 or arg9==92987 or arg9==92988) then
psunitisplayer(arg6,arg7)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss23~=2 then
		psiccwipereport("wipe", "try")
	end
		addtotwotables4(arg7)
		vezaxsort4()
end
end
end