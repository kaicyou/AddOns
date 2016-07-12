psbossfile33=1
function pscmrboss332(arg6,arg7)
psunitisplayer(arg6,arg7)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss33~=2 then
		psiccwipereport("wipe", "try")
	end
		addtotwotables(arg7)
		vezaxsort1()
end
end


function pscmrboss333(arg6,arg7)
psunitisplayer(arg6,arg7)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss33~=2 then
		psiccwipereport("wipe", "try")
	end
		addtotwotables2(arg7)
		vezaxsort2()
end
end


function pscmrboss334(arg6,arg7)
psunitisplayer(arg6,arg7)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss33~=2 then
		psiccwipereport("wipe", "try")
	end
		addtotwotables3(arg7)
		vezaxsort3()
end
end

function pscounciladdnewshield(arg7)
if psiccschet2==1 then
	--создаем новые табл

  pscreatesavedreports3(psbossnames[1][3][3])

	psaddclasscolors()
	--psdmgresetinglastfight() --ыыы  а в новых я удалили или что?
end
--добавляем щит
	local h,m = GetGameTime()
	if h<10 then h="0"..h end
	if m<10 then m="0"..m end
	local time=h..":"..m

table.insert(pssidamageinf_indexboss[pssavedplayerpos][1],5)
table.insert(pssidamageinf_title2[pssavedplayerpos][1],pscmrshield..": "..psiccschet2.." ("..arg7..")")
table.insert(pssidamageinf_additioninfo[pssavedplayerpos][1],{psbossnames[1][3][3]..", "..time})
table.insert(pssidamageinf_damageinfo[pssavedplayerpos][1],{{},{},{}})
table.insert(pssidamageinf_switchinfo[pssavedplayerpos][1],{{},{}})

--ыытест!
--тут запускаем проверку свитчей в арг7 на 10 сек и пока учитывается УРОН в щит!
pscheckswitch_council(arg7)

psupdateframewithnewinfo()
end


function pscouncilshieldoff(s,ranshe)
		local tm="?"
		if psiccschet3>0 and psiccschet4>0 then
			if s and s==2 then
				local ttt=(math.ceil((psiccschet4-psiccschet3)*10))/10
				if ttt>29.5 and ranshe==nil then
					ttt=30
				end
				tm=ttt.." "..pssec
				if ranshe then
					tm=tm.." ("..pscmrshielddown..")"
				else
					tm=tm.." ("..pscmrshielddown2..": "..psconcshieldamount..")"
				end
			else
				tm=pscmrconclavloc1..": "..((math.ceil((psiccschet4-psiccschet3)*10))/10).." "..pssec
			end
		end
		pssidamageinf_title2[pssavedplayerpos][1][#pssidamageinf_title2[pssavedplayerpos][1]]=pssidamageinf_title2[pssavedplayerpos][1][#pssidamageinf_title2[pssavedplayerpos][1]]..", "..tm
psupdateframewithnewinfo()



		if s and s==1 and psraidoptionson[1][3][3][12]==1 then
			local ar3=pssichose5 or 4
			if #pssidamageinf_title2[pssavedplayerpos][1]>0 then
				local g=#pssidamageinf_title2[pssavedplayerpos][1]
				psdamagerep_cmr(psraidchats3[psraidoptionschat[1][3][3][12]],pssavedplayerpos,1,g,ar3,1,2,1)
			end
		end
		if s and s==2 and psraidoptionson[1][3][3][13]==1 then
			local ar3=pssichose2 or 4
			if #pssidamageinf_title2[pssavedplayerpos][1]>0 then
				local g=#pssidamageinf_title2[pssavedplayerpos][1]
				psdamagerep_cmr(psraidchats3[psraidoptionschat[1][3][3][13]],pssavedplayerpos,1,g,ar3,1,2,1)
			end
		end

end

function pscouncildmgadd(arg4,arg6,dmg)
psmoddmg_addinfodmg(arg4,dmg,0,#pssidamageinf_damageinfo[pssavedplayerpos][1])
psmoddmg_sortinfodmg(#pssidamageinf_damageinfo[pssavedplayerpos][1])
end


function pscheckswitch_council(arg7)
--table.insert(pssidamageinf_switchinfo[pssavedplayerpos][1],{{},{}})
local psgrups=5
if select(3,GetInstanceInfo())==3 or select(3,GetInstanceInfo())==5 then
psgrups=2
end

for i=1,GetNumRaidMembers() do
local psname, _, pssubgroup = GetRaidRosterInfo(i)
	if pssubgroup <= psgrups then
		table.insert(pssidamageinf_switchinfo[pssavedplayerpos][1][#pssidamageinf_switchinfo[pssavedplayerpos][1]][1],(GetRaidRosterInfo(i)))
		if UnitName(psname.."-target")==arg7 then
		--таргет совпадает
		table.insert(pssidamageinf_switchinfo[pssavedplayerpos][1][#pssidamageinf_switchinfo[pssavedplayerpos][1]][2],0)
		else
		--таргет фейл
		table.insert(pssidamageinf_switchinfo[pssavedplayerpos][1][#pssidamageinf_switchinfo[pssavedplayerpos][1]][2],"--")
		end
	end
end

--делей перед первой проверкой и макс 10 сек трекерить, но не более чем висит щит
pscounciltargetcheckupd1=GetTime()
pscounciltargetcheckupd2=GetTime()+0.1
pscounciltargetcheckupd3=arg7

end


function reportafterboitwotab_2(inwhichchat, bojinterr, tabln, tablc, qq, maxpers,iccsv,norep)

if (tabln==nil or tabln=={}) then tabln = {} end
if (tablc==nil or tablc=={}) then tablc = {} end
local vzxnn= # tabln
local pstochki=""
if(vzxnn>0)then
if maxpers==nil then
if psdifflastfight==0 or psdifflastfight==25 then
	if norep then
		maxpers=psraidoptionsnumers[8]
	else
		maxpers=psraidoptionsnumers[6]
	end
else
	if norep then
		maxpers=psraidoptionsnumers[7]
	else
		maxpers=psraidoptionsnumers[5]
	end
end
end
if vzxnn>maxpers then vzxnn=maxpers pstochki=", ..." else pstochki="." end
for i = 1,vzxnn do

--получение приписки, сколько взорвал после смены цели
local addj=""
if psledsferka3 and #psledsferka3>0 then
	for z=1,#psledsferka3 do
		if psledsferka3[z]==tabln[i] then
			if tablc[i]==psledsferka4[z] then
				addj=" - "..pscmrtxtoptt2223
			else
				addj=" - "..pscmrtxtoptt2223..": "..psledsferka4[z]
			end
		end
	end
end

if i==vzxnn then
		if norep then
			strochkavezcrash=strochkavezcrash..psaddcolortxt(1,tabln[i])..tabln[i]..psaddcolortxt(2,tabln[i]).." ("..tablc[i]..addj..")"..pstochki
		else
			strochkavezcrash=strochkavezcrash..tabln[i].." ("..tablc[i]..addj..")"..pstochki
		end
		pszapuskanonsa(inwhichchat, strochkavezcrash, bojinterr,nil,iccsv,norep)
else
		if norep then
			strochkavezcrash=strochkavezcrash..psaddcolortxt(1,tabln[i])..tabln[i]..psaddcolortxt(2,tabln[i]).." ("..tablc[i]..addj.."), "
		else
			strochkavezcrash=strochkavezcrash..tabln[i].." ("..tablc[i]..addj.."), "
		end
end
end
end

end


function pscmrbossREPORT331(wipe,try,reset,checkforwipe)
if reset==nil then
if checkforwipe==nil or (checkforwipe and pswasonboss33 and pswasonboss33==1) then

	if pswasonboss33==1 then
		pssetcrossbeforereport1=GetTime()
		--тут репорт
		if psraidoptionson[1][3][3][2]==1 then
			strochkavezcrash=pscmrtxtoptt332.." "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][3][3][2]], true, vezaxname, vezaxcrash, 1)
		end
		if psraidoptionson[1][3][3][3]==1 then
			strochkavezcrash=pscmrtxtoptt333.." "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][3][3][3]], true, vezaxname2, vezaxcrash2, 1)
		end
		if psraidoptionson[1][3][3][4]==1 then
			strochkavezcrash=pscmrtxtoptt334.." "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][3][3][4]], true, vezaxname3, vezaxcrash3, 1)
		end
		if psraidoptionson[1][3][3][11]==1 then
			local nnnmm=psledsferkaname or "Frozen Orb"
			strochkavezcrash=format(pscmrtxtoptt33311,nnnmm).." "
			reportafterboitwotab_2(psraidchats3[psraidoptionschat[1][3][3][11]], true, vezaxname4, vezaxcrash4, 1)
		end
		if psraidoptionson[1][3][3][14]==1 then
			strochkavezcrash=pscmrtxtoptt333141.." "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][3][3][14]], true, vezaxname5, vezaxcrash5, 1)
		end
		if psraidoptionson[1][3][3][15]==1 then
			strochkavezcrash=pscmrtxtoptt333151.." "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][3][3][15]], true, vezaxname6, vezaxcrash6, 1)
		end

	end
	if pswasonboss33==1 or (pswasonboss33==2 and try==nil) then

	psiccsavinginf(psbossnames[1][3][3], try, pswasonboss33)
	--тут сохранение
	strochkavezcrash=pscmrtxtoptt332.." "
	reportafterboitwotab("raid", true, vezaxname, vezaxcrash, nil, nil,0,1)
	strochkavezcrash=pscmrtxtoptt333.." "
	reportafterboitwotab("raid", true, vezaxname2, vezaxcrash2, nil, nil,0,1)
	strochkavezcrash=pscmrtxtoptt334.." "
	reportafterboitwotab("raid", true, vezaxname3, vezaxcrash3, nil, nil,0,1)
	local nnnmm=psledsferkaname or "Frozen Orb"
	strochkavezcrash=format(pscmrtxtoptt33311,nnnmm).." "
	reportafterboitwotab_2("raid", true, vezaxname4, vezaxcrash4, nil, nil,0,1)
	strochkavezcrash=pscmrtxtoptt333141.." "
	reportafterboitwotab("raid", true, vezaxname5, vezaxcrash5, nil, nil,0,1)
	strochkavezcrash=pscmrtxtoptt333151.." "
	reportafterboitwotab("raid", true, vezaxname6, vezaxcrash6, nil, nil,0,1)
	psiccrefsvin()

	end

	if wipe then
		pswasonboss33=2
		pscheckbossincombatmcr=GetTime()+1
	end
end
end
end


function  pscmrbossRESET331(wipe,try,reset,checkforwipe)
if reset or wipe==nil then
pswasonboss33=nil
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
table.wipe(vezaxname6)
table.wipe(vezaxcrash6)
end
end


function pscmrbossaplly331(arg3,arg7,arg4,mili)
psledsferkaname=arg4
	if #psledsferka1>0 then
		local byl=0
		for i=1,#psledsferka1 do
			if psledsferka1[i]==arg3 then
				byl=1
				if psledsferka222[i]~=arg7 or mili==nil then
					psledsferkatt2[i]=GetTime()
					psledsferka222[i]=arg7
					if psledsferkatt3[i]==0 then
						psledsferkatt3[i]=GetTime()
					end
				end
			end
		end
		if byl==0 then
			table.insert(psledsferka1,arg3)
			table.insert(psledsferka2,arg7)
			table.insert(psledsferka222,arg7)
			table.insert(psledsferkatt1,GetTime())
			table.insert(psledsferkatt2,0)
			table.insert(psledsferkatt3,0)
		end
	else
		table.insert(psledsferka1,arg3)
		table.insert(psledsferka2,arg7)
		table.insert(psledsferka222,arg7)
		table.insert(psledsferkatt1,GetTime())
		table.insert(psledsferkatt2,0)
		table.insert(psledsferkatt3,0)
	end
end


function pscmrboss3310(arg3,arg7)
local norm=0
local nm2=""
local tmm=0
local trtrtr=0
if psledsferka1 and #psledsferka1>0 then
	for i=1,#psledsferka1 do
		if psledsferka1[i]==arg3 then
			if psledsferka2[i]~=arg7 then
				norm=1
				trtrtr=psledsferkatt2[i]
				if trtrtr==0 then
					trtrtr=psledsferkatt1[i]
				end
				nm2=psledsferka2[i]
				local wqwwq=psledsferkatt3[i]
				if wqwwq==0 then
					wqwwq=GetTime()
				end
				tmm=(math.ceil((wqwwq-psledsferkatt1[i])*10))/10
				if #psledsferka3>0 then
					local bul=0
					for j=1,#psledsferka3 do
						if psledsferka3[j]==arg7 then
							bul=1
							psledsferka4[j]=psledsferka4[j]+1
						end
					end
					if bul==0 then
						table.insert(psledsferka3,arg7)
						table.insert(psledsferka4,1)
					end
				else
					table.insert(psledsferka3,arg7)
					table.insert(psledsferka4,1)
				end
			else
				trtrtr=psledsferkatt2[i]
				if trtrtr==0 then
					trtrtr=psledsferkatt1[i]
				end
			end
		end
	end
end

local ac=""
if norm==1 then
local sdfdsfs=""
if tmm>0 and tmm<60 then
sdfdsfs=tmm.." "..pssec
end
ac=" ("..pscmrtxtoptt2222.." - "..nm2..", "..sdfdsfs..")"
end

local timeofkite=0
local toaddkite=""
timeofkite=(math.ceil((GetTime()-trtrtr)*10))/10
if timeofkite>0 and timeofkite<60 then
toaddkite=", "..timeofkite.." "..pssec
end

local nnnmm=psledsferkaname or "Frozen Orb"



if pswasonboss33 and pswasonboss33~=2 then
if psraidoptionson[1][3][3][10]==1 then
	if UnitSex(arg7) and UnitSex(arg7)==3 then
		pszapuskanonsa(psraidchats3[psraidoptionschat[1][3][3][10]], "{rt8} "..arg7.." "..pscmrtxtoptt33312f.." "..nnnmm..toaddkite..ac)
	else
		pszapuskanonsa(psraidchats3[psraidoptionschat[1][3][3][10]], "{rt8} "..arg7.." "..pscmrtxtoptt33312m.." "..nnnmm..toaddkite..ac)
	end
end
addtotwotables4(arg7)
vezaxsort4()
end

if psraidoptionson[1][3][3][7]==1 then
pscaststartinfo(0,nnnmm..": "..psaddcolortxt(1,arg7)..arg7..psaddcolortxt(2,arg7)..toaddkite..ac, -1, "id1", 4, nnnmm.." - "..psinfo,psbossnames[1][3][3],2)
end

end

function pssferkaminifun(arg3)
if #psledsferka1>0 then
	for i=1,#psledsferka1 do
		if psledsferka1[i]==arg3 then
			psnametemp1=psledsferka222[i]
		end
	end
end
if psnametemp1 then
	pscmrboss3310(arg3,psnametemp1)
end
psnametemp1=nil
end








function pscombatlogboss33(...)
local arg1, arg2, argnew1, arg3,arg4,arg5,argNEW,arg6,arg7,arg8,argNEW2,arg9,arg10,arg11,arg12,arg13,arg14, arg15,arg16,arg17 = ...

if arg2=="SPELL_DAMAGE" and (arg9==83067 or arg9==92469 or arg9==92470 or arg9==92471) and arg12>29999 then
pscmrboss332(arg6,arg7)
end

if arg2=="SPELL_DAMAGE" and (arg9==83565 or arg9==92544 or arg9==92545 or arg9==92546) and arg12>29999 then
pscmrboss333(arg6,arg7)
end

if (arg2=="SPELL_DAMAGE" or (arg2=="SPELL_MISSED" and arg12 and arg12=="ABSORB")) and (arg9==88558 or arg9==92516 or arg9==92517 or arg9==92518) then
pscmrboss334(arg6,arg7)
end


--урон в щиты!

--1 щит
if psraidoptionson[1][3][3][5]==1 then

if arg2=="SPELL_AURA_APPLIED" and (arg9==82631 or arg9==92512 or arg9==92513 or arg9==92514) then
pscouncilshield1=1
psiccschet2=psiccschet2+1
psiccschet3=GetTime()
psiccschet4=0
pscounciladdnewshield(arg7)
end

if arg2=="SPELL_AURA_REMOVED" and (arg9==82631 or arg9==92512 or arg9==92513 or arg9==92514) then
psiccschet4=GetTime()
pscouncillastabsorb1=GetTime()

--ыытест временно смотрим что будет если выводить инфо о кике после снятия щита
if #psincombattrack4_eventidtoinsert>0 then
	for i=1,#psincombattrack4_eventidtoinsert do
		if psincombattrack4_eventidtoinsert[i]==3 then
			local tfg=(math.ceil((GetTime()-psincombattrack2_timecaststart[i])*10))/10
			psincombattrack9_bossspellname[i]=psincombattrack9_bossspellname[i].." |cff00ff00"..pscmrshield..": "..tfg.."|r"
		end
	end
end

end


if pscouncilshield1 then

if arg2=="DAMAGE_SHIELD_MISSED" or arg2=="SPELL_PERIODIC_MISSED" or arg2=="SPELL_MISSED" or arg2=="RANGE_MISSED" then
if arg14 then
local id=psGetUnitID(arg6)
if id==43686 then
pscouncildmgadd(arg4,arg6,arg14)
end
end
end


if arg2=="SWING_MISSED" then
if arg11 then
local id=psGetUnitID(arg6)
if id==43686 then
pscouncildmgadd(arg4,arg6,arg11) --ыытест было 10
end
end
end


--partial dmg
if pscouncillastabsorb1 and pscouncillastabsorb1+0.5>GetTime() then

if arg2=="SPELL_PERIODIC_DAMAGE" or arg2=="SPELL_DAMAGE" or arg2=="RANGE_DAMAGE" or arg2=="DAMAGE_SHIELD" then
if arg17 and arg17>0 then
local id=psGetUnitID(arg6)
if id==43686 then
local source=psgetpetownername(arg3, arg4, arg5)
pscouncildmgadd(source,arg6,arg17)
end
end
end


if arg2=="SWING_DAMAGE" then
if arg14 and arg14>0 then
local id=psGetUnitID(arg6)
if id==43686 then
local source=psgetpetownername(arg3, arg4, arg5)
pscouncildmgadd(source,arg6,arg14)
end
end
end

end


end --pscouncilshield1




end --щит 1


--2 щит
if psraidoptionson[1][3][3][6]==1 then

if arg2=="SPELL_AURA_APPLIED" and (arg9==83718 or arg9==92541 or arg9==92542 or arg9==92543) then
pscouncilshield2=1
psiccschet2=psiccschet2+1
psiccschet3=GetTime()
psiccschet4=0
pscounciladdnewshield(arg7)
if select(3,GetInstanceInfo())==3 then
psconcshieldamount=500000
end
if select(3,GetInstanceInfo())==4 then
psconcshieldamount=1650000
end
if select(3,GetInstanceInfo())==5 then
psconcshieldamount=650000
end
if select(3,GetInstanceInfo())==6 then
psconcshieldamount=2100000
end
end

if arg2=="SPELL_AURA_REMOVED" and pscouncilshield2 and (arg9==83718 or arg9==92541 or arg9==92542 or arg9==92543) then
shieldoffcounctp2=GetTime()+1
psiccschet4=GetTime()
end


if pscouncilshield2 then

if arg2=="SPELL_PERIODIC_DAMAGE" or arg2=="SPELL_DAMAGE" or arg2=="RANGE_DAMAGE" or arg2=="DAMAGE_SHIELD" then
if arg17 and arg17>0 then
local id=psGetUnitID(arg6)
if id==43689 then
local source=psgetpetownername(arg3, arg4, arg5)
pscouncildmgadd(source,arg6,arg17)
psconcshieldamount=psconcshieldamount-arg17
end
end
end

if arg2=="SWING_DAMAGE" then
if arg14 and arg14>0 then
local id=psGetUnitID(arg6)
if id==43689 then
local source=psgetpetownername(arg3, arg4, arg5)
pscouncildmgadd(source,arg6,arg14)
psconcshieldamount=psconcshieldamount-arg14
end
end
end

end --pscouncilshield2

--щит пробивается раньше
if arg2=="SPELL_DAMAGE" and pscouncilshield2 and arg9==83760 then
shieldoffcounctp2=nil
if pscouncilshield2 then
pscouncildmgadd(arg4,arg6,arg12)
end
psiccschet4=GetTime()
pscouncilshield2=nil
pscouncilshieldoff(2,1)
psiccschet3=0
psiccschet4=0
end


end --щит 2


--psledsferka1
--council сферка
if psledsferka1 and arg2=="SPELL_AURA_APPLIED" and arg9==92307 then
pscmrbossaplly331(arg3,arg7,arg4)
end


if (arg2=="SWING_DAMAGE" or arg2=="SWING_MISSED") then
	local id=psGetUnitID(arg3)
	if id==49518 then
		--pscmrboss3310(arg3,arg7)
		pscmrbossaplly331(arg3,arg7,arg4,1)
	end
end

if (psledsferka1 and arg2=="SPELL_CAST_SUCCESS" and arg9==92548) and (pssferkaphase3==nil or (pssferkaphase3 and GetTime()>pssferkaphase3+30)) then
pssferkaminifun(arg3)
end

if arg2=="SPELL_AURA_APPLIED" and arg9==82285 then
pssferkaphase3=GetTime()
end


if arg2=="SPELL_AURA_APPLIED" and psgromtable1 and arg9==83099 then
table.insert(psgromtable1,arg7)
end

if arg2=="SPELL_AURA_REMOVED" and psgromtable2 and arg9==83099 then
table.insert(psgromtable2,arg7)
table.insert(psgromtable3,GetTime())
end

if arg2=="SPELL_DAMAGE" and psgromtable1 and (arg9==83282 or arg9==92448 or arg9==92449 or arg9==92450) and arg13 and arg13>0 and pswasonboss33 and pswasonboss33~=2 then
for i=1,#psgromtable3 do
	psgromtable3[i]=GetTime()+1
end
local bbyl=0
if #psgromtable1>0 then
	for i=1,#psgromtable1 do
		if psgromtable1[i]==arg7 then
			bbyl=1
		end
	end
end

if bbyl==0 then

pscmrshowdeathinfoincombat=GetTime()+0.8
table.insert(psgromtable4,arg7)
if #psgromtable1>0 then
	SetMapToCurrentZone()
	local x,y=GetPlayerMapPosition(arg7)
	if x and y then --ыытест doesn't work after 4.1 patch, waiting fix by Blizzard //fixed in 4.1.A
		local minnumr=999999999999999
		local whomin=0
		for i=1,#psgromtable1 do
			local x2,y2=GetPlayerMapPosition(psgromtable1[i])
			if x2 and y2 then
				local dist=math.sqrt(math.pow((x-x2),2)+math.pow((y-y2),2))
				if dist<minnumr then
					minnumr=dist
					whomin=i
				end
			end
		end
		if whomin>0 then
			table.insert(psgromtable5,psgromtable1[whomin])
		else
			table.insert(psgromtable5,psiccunknown)
		end			
	else
		table.insert(psgromtable5,psiccunknown)
	end
else
table.insert(psgromtable5,psiccunknown)
end

end --bbyl
end


--Council
if arg2=="SPELL_CAST_START" and (arg9==82752 or arg9==92509 or arg9==92510 or arg9==92511) and psraidoptionson[1][3][3][7]==1 then
pscheckrunningbossid(arg3)
pscaststartinfo(arg9,arg10..": %s.", 2.5, arg3, 2, arg10.." - "..pscmreventsincomb2,psbossnames[1][3][3])
end

if arg2=="SPELL_CAST_SUCCESS" and arg9==82636 and psraidoptionson[1][3][3][7]==1 then
pscheckrunningbossid(arg3)
pscaststartinfo(arg9,arg10..": %s.", 20, arg3, 3, arg10.." - "..pscmreventsincomb2,psbossnames[1][3][3])
end

if arg2=="SPELL_CAST_START" and (arg9==83718 or arg9==92541 or arg9==92542 or arg9==92543) and psraidoptionson[1][3][3][7]==1 then
pscheckrunningbossid(arg3)
pscaststartinfo(arg9,arg10..": %s.", 2.5, arg3, 5, arg10.." - "..pscmreventsincomb2,psbossnames[1][3][3])
end

if arg2=="SPELL_CAST_START" and (arg9==83070 or arg9==92454 or arg9==92455 or arg9==92456) and psraidoptionson[1][3][3][7]==1 then
pscheckrunningbossid(arg3)
pscaststartinfo(arg9,arg10..": %s.", 7, arg3, 6, arg10.." - "..pscmreventsincomb2,psbossnames[1][3][3])
end

--заморозка
if arg2=="SPELL_PERIODIC_DAMAGE" and (arg9==82772 or arg9==92503 or arg9==92504 or arg9==92505) then
psunitisplayer(arg6,arg7)
if psunitplayertrue then
pscheckwipe1()
if pswipetrue and pswasonboss33~=2 then
psiccwipereport("wipe", "try")
end
	if alakirtabl1==nil then alakirtabl1={"0"} end
	if alakirtabl2==nil then alakirtabl2={0} end
	local bil=0
	for i=1,#alakirtabl1 do
		if alakirtabl1[i]==arg7 then
			bil=1
			if arg1>alakirtabl2[i]+14 then
				alakirtabl2[i]=arg1
				addtotwotables5(arg7)
				vezaxsort5()
			end
		end
	end
	if bil==0 then
		table.insert(alakirtabl1,arg7)
		table.insert(alakirtabl2,arg1)
		addtotwotables5(arg7)
		vezaxsort5()
	end

end
end


if arg2=="SPELL_DAMAGE" and (arg9==84912 or arg9==92491 or arg9==92492 or arg9==92493) then
psunitisplayer(arg6,arg7)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss33~=2 then
		psiccwipereport("wipe", "try")
	end
		addtotwotables6(arg7)
		vezaxsort6()
end
end


if arg2=="SPELL_AURA_APPLIED" and arg9==92067 then
if ps_saoptions[1][3][3][2]==1 then
ps_sa_sendinfo(arg7, arg10.." "..psmain_sa_phrase1, 3, nil, nil)
end
end

if arg2=="SPELL_AURA_APPLIED" and arg9==92075 then
if ps_saoptions[1][3][3][1]==1 then
ps_sa_sendinfo(arg7, arg10.." "..psmain_sa_phrase1, 3, nil, nil)
end
end



end