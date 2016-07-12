psbossfile35=1



function pscmrbossREPORT351(wipe,try,reset,checkforwipe)
if reset==nil then
if checkforwipe==nil or (checkforwipe and pswasonboss35 and pswasonboss35==1) then

	if pswasonboss35==1 then
		--тут репорт
		pssetcrossbeforereport1=GetTime()
		if psraidoptionson[1][3][5][1]==1 then
			strochkavezcrash=pscmrtxtoptt351..": "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][3][5][1]], true, vezaxname, vezaxcrash, 1)
		end
		if psraidoptionson[1][3][5][2]==1 then
			strochkavezcrash=pscmrtxtoptt352..": "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][3][5][2]], true, vezaxname2, vezaxcrash2, 1)
		end
		if psraidoptionson[1][3][5][3]==1 then
			strochkavezcrash=pscmrtxtoptt353..": "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][3][5][3]], true, vezaxname3, vezaxcrash3, 1)
		end
		if psraidoptionson[1][3][5][4]==1 then
			strochkavezcrash=pscmrtxtoptt354..": "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][3][5][4]], true, vezaxname4, vezaxcrash4, 1)
		end

	end
	if pswasonboss35==1 or (pswasonboss35==2 and try==nil) then

	psiccsavinginf(psbossnames[1][3][5], try, pswasonboss35)
		--тут сохранение
	strochkavezcrash=pscmrtxtoptt351..": "
	reportafterboitwotab("raid", true, vezaxname, vezaxcrash, nil, nil,0,1)
	strochkavezcrash=pscmrtxtoptt352..": "
	reportafterboitwotab("raid", true, vezaxname2, vezaxcrash2, nil, nil,0,1)
	strochkavezcrash=pscmrtxtoptt353..": "
	reportafterboitwotab("raid", true, vezaxname3, vezaxcrash3, nil, nil,0,1)
	strochkavezcrash=pscmrtxtoptt354..": "
	reportafterboitwotab("raid", true, vezaxname4, vezaxcrash4, nil, nil,0,1)

	psiccrefsvin()

	end

	if wipe then
		pswasonboss35=2
		pscheckbossincombatmcr=GetTime()+1
	end
end
end
end


function  pscmrbossRESET351(wipe,try,reset,checkforwipe)
if reset or wipe==nil then
pswasonboss35=nil
--тут резет
table.wipe(vezaxname)
table.wipe(vezaxcrash)
table.wipe(vezaxname2)
table.wipe(vezaxcrash2)
table.wipe(vezaxname3)
table.wipe(vezaxcrash3)
table.wipe(vezaxname4)
table.wipe(vezaxcrash4)
--psiccschet1
end
end







function pscombatlogboss35(...)
local arg1, arg2, argnew1, arg3,arg4,arg5,argNEW,arg6,arg7,arg8,argNEW2,arg9,arg10,arg11,arg12,arg13,arg14, arg15 = ...


--Сумеречное иссечение
if arg2=="SPELL_DAMAGE" and (arg9==92852 or arg9==92954) then
psunitisplayer(arg6,arg7)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss35~=2 then
		psiccwipereport("wipe", "try")
	end
		addtotwotables(arg7)
		vezaxsort1()
end
end

--Сумеречная пульсация
if arg2=="SPELL_DAMAGE" and (arg9==92958 or arg9==92959 or arg9==78862) then
psunitisplayer(arg6,arg7)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss35~=2 then
		psiccwipereport("wipe", "try")
	end
		addtotwotables2(arg7)
		vezaxsort2()
end
end

--Сумеречное угасание
if arg2=="SPELL_DAMAGE" and arg9==86226 and arg12>49999 then
psunitisplayer(arg6,arg7)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss35~=2 then
		psiccwipereport("wipe", "try")
	end
		addtotwotables3(arg7)
		vezaxsort3()
end
end

--Сумеречное дыхание
if arg2=="SPELL_DAMAGE" and (arg9==92942 or arg9==90083) then
psunitisplayer(arg6,arg7)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss35~=2 then
		psiccwipereport("wipe", "try")
	end
		addtotwotables4(arg7)
		vezaxsort4()
end
end


--сбивание каста адда
if arg2=="SPELL_CAST_START" and (arg9==92947 or arg9==90028) then
pscheckrunningbossid(arg3)

local adinfo=""
if pscheckslowdebuff(arg3) then
else
adinfo=" (|cffff0000"..pscmrnocastslow.."|r)"
end

local bil=0
if #psaddsidtocast>0 then
	for i=1,#psaddsidtocast do
		if psaddsidtocast[i]==arg3 then
			bil=i
		end
	end
end

if bil==0 then
	table.insert(psaddsidtocast,arg3)
	table.insert(psaddsidtocast2,{})
	table.insert(psaddsidtocast3,0)
	bil=#psaddsidtocast
end
table.insert(psaddsidtocast2[bil],1)
pscaststartinfo(arg9,arg10..", "..psmob1..": "..bil..". "..pscast1..": "..#psaddsidtocast2[bil]..adinfo..".", 2, arg3, 100, arg10.." - "..pscmreventsincomb2,psbossnames[1][3][5],1,1)
end

--АоЕ от моба:
if arg2=="SPELL_AURA_APPLIED" and (arg9==92946 or arg9==90045) then

local bil=0
if #psaddsidtocast>0 then
	for i=1,#psaddsidtocast do
		if psaddsidtocast[i]==arg3 then
			bil=i
		end
	end
end

if bil==0 then
	table.insert(psaddsidtocast,arg3)
	table.insert(psaddsidtocast2,{})
	table.insert(psaddsidtocast3,0)
	bil=#psaddsidtocast
end



if psaddsidtocast and #psaddsidtocast>0 then
pscheckrunningbossid(arg3)

--проверка преинтераптов

local txttorep=""
local txttorepchat=""

local fgf=1
while fgf<31 do
	if psprecast1[fgf] then
		if GetTime()<=psprecast1[fgf]+3 then
			local fff=0
			if psprecast4[fgf]==arg3 then
					if string.len(txttorep)>2 then
						txttorep=txttorep..", "
						txttorepchat=txttorepchat..", "
					end
					txttorep=txttorep..psaddcolortxt(1,psprecast2[fgf])..psprecast2[fgf]..psaddcolortxt(2,arg4)
					txttorepchat=txttorepchat..psprecast2[fgf]

					if psprecast5[fgf]=="0" then
						txttorep=txttorep.." ("..psprecast3[fgf]..", "..(math.ceil((psprecast1[fgf]-GetTime())*10)/10)..")"
						txttorepchat=txttorepchat.." ("..psprecast3[fgf]..", "..(math.ceil((psprecast1[fgf]-GetTime())*10)/10)..")"
					else
						txttorep=txttorep.." ("..psprecast3[fgf]..", "..(math.ceil((psprecast1[fgf]-GetTime())*10)/10).." - "..psprecast5[fgf]..")"
						txttorepchat=txttorepchat.." ("..psprecast3[fgf]..", "..(math.ceil((psprecast1[fgf]-GetTime())*10)/10).." - "..psprecast5[fgf]..")"
					end
			end

			fgf=fgf+1
		else
			fgf=32
		end
	else
		fgf=32
	end
end


mob="?"
for tt=1,#psaddsidtocast do
	if psaddsidtocast[tt]==arg3 then
		mob=tt
	end
end

if string.len(txttorep)>2 then
pscaststartinfo(0,"|cffff0000"..psspellfilter(pscmrsinestraadd6)..", "..psmob1.." "..mob..":|r", -1, "id222", 100, arg10.." - "..pscmreventsincomb2,psbossnames[1][3][5],2)
pscaststartinfo(0,txttorep, -1, "id222", 100, arg10.." - "..pscmreventsincomb2,psbossnames[1][3][5],2)
else
pscaststartinfo(0,"|cffff0000"..psspellfilter(pscmrsinestraadd7)..", "..psmob1.." "..mob.."|r", -1, "id222", 100, arg10.." - "..pscmreventsincomb2,psbossnames[1][3][5],2)
end




if psraidoptionson[1][3][5][6]==1 then
	if string.len(txttorep)>2 then
		pszapuskanonsa(psraidchats3[psraidoptionschat[1][3][5][6]], "{rt8} "..pscmrsinestraadd6..":")
		pszapuskanonsa(psraidchats3[psraidoptionschat[1][3][5][6]], psremovecolor(txttorepchat))
	else
		pszapuskanonsa(psraidchats3[psraidoptionschat[1][3][5][6]], "{rt8} "..pscmrsinestraadd7)
	end
end



end
end

--каст прошел прописывать 1 раз при уроне!!
if arg2=="SPELL_AURA_APPLIED" and (arg9==92947 or arg9==90028) then
if psaddsidtocast and #psaddsidtocast>0 then
	for i=1,#psaddsidtocast do
		if psaddsidtocast[i]==arg3 then
			if GetTime()>psaddsidtocast3[i] then
				psaddsidtocast3[i]=GetTime()+4
				pscheckrunningbossid(arg3)
				pscaststartinfo(0,"|cffff0000"..arg10..", "..psmob1..": "..i.." - "..pscmrsinestraadd4.."|r", -1, "id222", 100, arg10.." - "..pscmreventsincomb2,psbossnames[1][3][5],2)
			end
		end
	end
end
end


--модуль по смятию
if arg2=="SPELL_CAST_SUCCESS" and (arg9==92955 or arg9==89421 or arg9==92956 or arg9==89435) then
psiccschet1=psiccschet1+1
pssinestrasmyat=arg10

pssindrafirstdebon1=arg7
pssindrafirstdebon2=GetTime()

pssinestrawrach88[psiccschet1]=GetTime()

if psraidoptionson[1][3][5][5]==1 then
if(IsRaidOfficer()==1) then
pszapuskanonsa("raid_warning", pscmrsinestraadd2.." |s4id89421|id >>> "..arg7.." <<<", nil, 1)
else
pszapuskanonsa("raid", pscmrsinestraadd2.." |s4id89421|id >>> "..arg7.." <<<", nil, 1)
end
end

end

if arg2=="SPELL_AURA_APPLIED" and (arg9==92955 or arg9==89421 or arg9==92956 or arg9==89435) and pssinestrawrach1 and psiccschet1>0 then
if #pssinestrawrach2>0 then
	for i=1,#pssinestrawrach2 do
		if pssinestrawrach2[i] and pssinestrawrach2[i]==arg7 then
			table.remove(pssinestrawrach1,i)
			table.remove(pssinestrawrach2,i)
			table.remove(pssinestrawrach3,i)
			table.remove(pssinestrawrach4,i)
			table.remove(pssinestrawrach5,i)
			table.remove(pssinestrawrach6,i)
		end
	end
end

local nradd=psiccschet1
if pssindrafirstdebon2 and GetTime()<pssindrafirstdebon2+35 and psiccschet1>1 and pssindrafirstdebon1 and pssindrafirstdebon1~=arg7 then
nradd=psiccschet1-1
end


table.insert(pssinestrawrach1,GetTime())
table.insert(pssinestrawrach2,arg7)
table.insert(pssinestrawrach3,nradd)
table.insert(pssinestrawrach4,"0")
table.insert(pssinestrawrach5,0)
table.insert(pssinestrawrach6,0)
if pssinestrawrach99[psiccschet1]==nil then
pssinestrawrach99[psiccschet1]=0
end
end

if arg2=="SPELL_AURA_REMOVED" and (arg9==92955 or arg9==89421 or arg9==92956 or arg9==89435) and pssinestrawrach1 then

if pssindrafirstdebon1 and pssindrafirstdebon1==arg7 then
pssindrafirstdebon1=nil
pssindrafirstdebon2=nil
end

local bil=0
if #pssinestrawrach2>0 then
	for i=1,#pssinestrawrach2 do
		if bil==0 and pssinestrawrach2[i]==arg7 and pssinestrawrach5[i]==0 then
			pssinestrawrach5[i]=GetTime()
			bil=1
		end
	end
end
end

if arg2=="UNIT_DIED" then
local dead=arg7
local bil=0
if #pssinestrawrach2>0 then
	for i=1,#pssinestrawrach2 do
		if bil==0 and pssinestrawrach2[i]==dead then
			if pssinestrawrach6[i]==0 then
				pssinestrawrach6[i]=2
				pssinestrawrach4[i]="|cffff0000"..pscmrsinestraadd3.." "..(math.ceil((GetTime()-pssinestrawrach1[i])*10)/10).." "..pssec.."|r"
			elseif pssinestrawrach6[i]==1 then
				pssinestrawrach6[i]=3
				pssinestrawrach4[i]=pssinestrawrach4[i].." |cffff0000"..pscmrsinestraadd3.." "..(math.ceil((GetTime()-pssinestrawrach1[i])*10)/10).." "..pssec.."|r"
			end
			bil=1
		end
	end
end
end


if arg2=="SPELL_DISPEL" and (arg9==92955 or arg9==89421 or arg9==92956 or arg9==89435) and pssinestrawrach1 then
local bil=0
if #pssinestrawrach2>0 then
	for i=1,#pssinestrawrach2 do
		if bil==0 and pssinestrawrach2[i]==arg7 then
			local timeras=math.ceil((GetTime()-pssinestrawrach1[i])*10)/10
			if timeras>=25 then
				timeras="|cff00ff00"..timeras.."|r"
			elseif timeras>18 or timeras<13 then
				timeras="|cffff0000"..timeras.."|r"
			end
			if pssinestrawrach6[i]==0 then
				pssinestrawrach6[i]=1
				pssinestrawrach4[i]=pscmrsinestraadd1..": "..psaddcolortxt(1,arg4)..arg4..psaddcolortxt(2,arg4).." ("..arg10..", "..timeras.." "..pssec..")."
			elseif pssinestrawrach6[i]==2 then
				pssinestrawrach6[i]=3
				pssinestrawrach4[i]=pssinestrawrach4[i].." "..pscmrsinestraadd1..": "..psaddcolortxt(1,arg4)..arg4..psaddcolortxt(2,arg4).." ("..arg10..", "..timeras.." "..pssec..")."
			end
			bil=1
		end
	end
end
end


if arg2=="SPELL_CAST_START" and (arg9==92944 or arg9==90125) and pssinestrawrach1 and psiccschet1>0 then
if #pssinestrawrach3>0 then
	local bil={}
	for i=1,#pssinestrawrach3 do
		if #bil>0 then
			local bil2=0
			for j=1,#bil do
				if bil2==0 and pssinestrawrach3[i]==bil[j] then
					bil2=1
					--table.insert(bil,pssinestrawrach3[i])
				end
			end
			if bil2==0 then
				table.insert(bil,pssinestrawrach3[i])
			end
		else
			table.insert(bil,pssinestrawrach3[i])
		end
	end
	if #bil>0 then
		for z=1,#bil do
			pscaststartinfo(arg9,arg10, 0, "id1", bil[z], pssinestrasmyat..": "..bil[z].." - "..psdispellinfo,psbossnames[1][3][5])
		end
	end
else
	pscaststartinfo(arg9,arg10, 0, "id1", psiccschet1, pssinestrasmyat.." - "..psdispellinfo,psbossnames[1][3][5])
end
end


--переодический урон хранить
if arg2=="SPELL_PERIODIC_DAMAGE" and (arg9==92955 or arg9==89421 or arg9==92956 or arg9==89435) and pssinestralastperiodic then
local bil=0
if #pssinestralastperiodic[1]>0 then
	for i=1,#pssinestralastperiodic[1] do
		if bil==0 and pssinestralastperiodic[1][i]==arg7 then
			if GetTime()>pssinestralastperiodic[3][i]+1.5 or arg12>pssinestralastperiodic[2][i] then
				pssinestralastperiodic[2][i]=arg12
				pssinestralastperiodic[3][i]=GetTime()
				bil=1
			end
		end
	end
end

if bil==0 then
	table.insert(pssinestralastperiodic[1],arg7)
	table.insert(pssinestralastperiodic[2],arg12)
	table.insert(pssinestralastperiodic[3],GetTime())
end

end




end