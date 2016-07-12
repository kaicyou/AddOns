psbossfile42=1
function pscmrboss421(arg1,arg6,arg7,arg10,spellid)
psunitisplayer(arg6,arg7)
if psunitplayertrue then
pscheckwipe1()
if pswipetrue and pswasonboss42~=2 then
psiccwipereport("wipe", "try")
end
	if alakirtabl1==nil then alakirtabl1={"0"} end
	if alakirtabl2==nil then alakirtabl2={0} end
	local bil=0
	for i=1,#alakirtabl1 do
		if alakirtabl1[i]==arg7 then
			bil=1
			if arg1>alakirtabl2[i]+8 then
				alakirtabl2[i]=arg1
				addtotwotables5(arg7)
				vezaxsort5()
				psreportalaktornado(arg7,arg10,spellid)
			end
		end
	end
	if bil==0 then
		table.insert(alakirtabl1,arg7)
		table.insert(alakirtabl2,arg1)
		addtotwotables5(arg7)
		vezaxsort5()
		psreportalaktornado(arg7,arg10,spellid)
	end

end
end

function psreportalaktornado(arg7,arg10,spellid)
if pswasonboss42 and pswasonboss42~=2 then
if psraidoptionson[1][4][2][1]==1 then
	if UnitSex(arg7) and UnitSex(arg7)==3 then
		pszapuskanonsa(psraidchats3[psraidoptionschat[1][4][2][1]], "{rt8} "..arg7.." "..pscmrtxtoptt421f)
	else
		pszapuskanonsa(psraidchats3[psraidoptionschat[1][4][2][1]], "{rt8} "..arg7.." "..pscmrtxtoptt421m)
	end
end

pscaststartinfo(0,arg10..": "..psaddcolortxt(1,arg7)..arg7..psaddcolortxt(2,arg7), -1, "id1", 1, "|s4id"..spellid.."|id - "..psinfo,psbossnames[1][4][2],2)


end
end


function pscmrboss422(arg6,arg7)
psunitisplayer(arg6,arg7)
if psunitplayertrue then
pscheckwipe1()
if pswipetrue and pswasonboss42~=2 then
psiccwipereport("wipe", "try")
end
addtotwotables(arg7)
vezaxsort1()
end
end

function pscmrboss424(arg4,arg6,arg7)
psunitisplayer(arg6,arg7)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss42~=2 then
		psiccwipereport("wipe", "try")
	end
		addtotwotables2(arg4)
		vezaxsort2()
		addtotwotables3(arg7)
		vezaxsort3()
end
end

function pscmrboss427(arg6,arg7)
psunitisplayer(arg6,arg7)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss42~=2 then
		psiccwipereport("wipe", "try")
	end
		addtotwotables4(arg7)
		vezaxsort4()
end
end

--alakir damage count module
function psalakirdmgadd(arg4,arg6,dmg,overkill,spellid)
if #psalakiraddstab[1]>0 then
	local byl=0
	for u=1,#psalakiraddstab[1] do
		if psalakiraddstab[1][u]==arg6 and byl==0 then
			byl=1
			psalakiradddamage(arg4,arg6,dmg,overkill,spellid)
		end
	end
	if byl==0 then
		psalakiraddnewadd(arg4,arg6,dmg)
	end
else
	--создаем новые табл
	
	pscreatesavedreports3(psbossnames[1][4][2])
	

	psaddclasscolors()
	psalakiraddnewadd(arg4,arg6,dmg)
	--psdmgresetinglastfight()
end
end

function psalakiraddnewadd(arg4,arg6,dmg)
	local h,m = GetGameTime()
	if h<10 then h="0"..h end
	if m<10 then m="0"..m end
	local time=h..":"..m
psiccschet2=psiccschet2+1
table.insert(psalakiraddstab[1],arg6)
table.insert(psalakiraddstab[2],dmg)
table.insert(psalakiraddstab[3],0)
table.insert(psalakiraddstab[4],psiccschet2)
table.insert(psalakiraddstab[1],arg6)
table.insert(psalakiraddstab[2],dmg)
table.insert(psalakiraddstab[3],1)
table.insert(psalakiraddstab[4],psiccschet2)

local an=psalakiraddname or "Mob"
table.insert(pssidamageinf_indexboss[pssavedplayerpos][1],1)
table.insert(pssidamageinf_indexboss[pssavedplayerpos][1],2)
table.insert(pssidamageinf_title2[pssavedplayerpos][1],an..": "..psiccschet2..". "..pscmralakirloc1)
table.insert(pssidamageinf_title2[pssavedplayerpos][1],an..": "..psiccschet2..". "..pscmralakirloc2)
table.insert(pssidamageinf_additioninfo[pssavedplayerpos][1],{psbossnames[1][4][2]..", "..time})
table.insert(pssidamageinf_additioninfo[pssavedplayerpos][1],{psbossnames[1][4][2]..", "..time})
table.insert(pssidamageinf_damageinfo[pssavedplayerpos][1],{{arg4},{dmg},{0}})
table.insert(pssidamageinf_damageinfo[pssavedplayerpos][1],{{},{},{}})
table.insert(pssidamageinf_switchinfo[pssavedplayerpos][1],{{},{}})
table.insert(pssidamageinf_switchinfo[pssavedplayerpos][1],{{},{}})

psupdateframewithnewinfo()
end

function psalakiradddamage(arg4,arg6,dmg,overkill,spellid)
for ii=1,#psalakiraddstab[1] do
	if psalakiraddstab[1][ii]==arg6 then
		local dmg2=dmg
		if psalakiraddstab[3][ii]==1 and pslowthen20 and psalakiraddstab[2][ii]<pslowthen20 and psalakiraddstab[2][ii]+dmg>pslowthen20 then
			dmg2=math.ceil(psalakiraddstab[2][ii]+dmg-pslowthen20)
		end

		psalakiraddstab[2][ii]=psalakiraddstab[2][ii]+dmg
		if psalakiraddstab[3][ii]==0 or (psalakiraddstab[3][ii]==1 and pslowthen20 and psalakiraddstab[2][ii]>pslowthen20) then
			psmoddmg_addinfodmg(arg4,dmg2,0,ii)
			psmoddmg_sortinfodmg(ii)
		end
		if psalakiraddstab[3][ii]==1 and overkill and overkill>0 and pssidamageinf_additioninfo[pssavedplayerpos][1][ii][2]==nil then
			if spellid and spellid>0 then
				pssidamageinf_additioninfo[pssavedplayerpos][1][ii][2]=pscmralakirloc3..": "..arg4.." -> \124cff71d5ff\124Hspell:"..spellid.."\124h["..GetSpellInfo(spellid).."]\124h\124r -> "..dmg
			else
				pssidamageinf_additioninfo[pssavedplayerpos][1][ii][2]=pscmralakirloc3..": "..arg4.." -> melee -> "..dmg
			end
		end
	end
end
end

function psalakiradddied(arg6)
psiccschet1=psiccschet1+1
for ii=1,#psalakiraddstab[1] do
	if psalakiraddstab[1][ii]==arg6 then
		local text1=pscmralakirloc4.."."
		local timefeedb=20
		--ыытест4.2
		if select(4, GetBuildInfo())>=40200 then
			timefeedb=30
		end
		if psalakirdebuff1 and GetTime()<psalakirdebuff1+59 then
			text1=pscmralakirloc5..": "..((math.ceil((timefeedb-(GetTime()-psalakirdebuff1))*10))/10).." "..pssec
		end
		if psalakirdebuff2 and GetTime()<psalakirdebuff2+59 then
			text1=pscmralakirloc6..": "..(math.ceil((GetTime()-psalakirdebuff2)*10)/10).." "..pssec
		end

		local an=psalakiraddname or "Mob"
		if psalakiraddstab[3][ii]==0 then
			pssidamageinf_title2[pssavedplayerpos][1][ii]=an..": "..psalakiraddstab[4][ii]..", "..pscmralakirloc7..": "..psiccschet1..", "..text1.." "..pscmralakirloc1
		end
		if psalakiraddstab[3][ii]==1 then
			pssidamageinf_title2[pssavedplayerpos][1][ii]=an..": "..psalakiraddstab[4][ii]..", "..pscmralakirloc7..": "..psiccschet1..", "..text1.." "..pscmralakirloc2
		end
		psalakiraddstab[3][ii]=2
	end
end
psupdateframewithnewinfo()
end


--alakir damage count module end


function pscmrbossREPORT421(wipe,try,reset, checkforwipe)

if reset==nil then
if checkforwipe==nil or (checkforwipe and pswasonboss42 and pswasonboss42==1) then

if pswasonboss42==1 then


pssetcrossbeforereport1=GetTime()

if psraidoptionson[1][4][2][2]==1 then
strochkavezcrash=pscmrtxtoptt422.." "
reportafterboitwotab(psraidchats3[psraidoptionschat[1][4][2][2]], true, vezaxname, vezaxcrash, 1)
end
if psraidoptionson[1][4][2][3]==1 then
strochkavezcrash=pscmrtxtoptt423.." "
reportafterboitwotab(psraidchats3[psraidoptionschat[1][4][2][3]], true, vezaxname5, vezaxcrash5, 1)
end
if psraidoptionson[1][4][2][4]==1 then
strochkavezcrash=pscmrtxtoptt424.." "
reportafterboitwotab(psraidchats3[psraidoptionschat[1][4][2][4]], true, vezaxname2, vezaxcrash2, 1)
end
if psraidoptionson[1][4][2][5]==1 then
strochkavezcrash=pscmrtxtoptt425.." "
reportafterboitwotab(psraidchats3[psraidoptionschat[1][4][2][5]], true, vezaxname3, vezaxcrash3, 1)
end
if psraidoptionson[1][4][2][7]==1 then
strochkavezcrash=pscmrtxtoptt427.." "
reportafterboitwotab(psraidchats3[psraidoptionschat[1][4][2][7]], true, vezaxname4, vezaxcrash4, 1)
end

	end
	if pswasonboss42==1 or (pswasonboss42==2 and try==nil) then


psiccsavinginf(psbossnames[1][4][2], try, pswasonboss42)

strochkavezcrash=pscmrtxtoptt422.." "
reportafterboitwotab("raid", true, vezaxname, vezaxcrash, nil, nil,0,1)
strochkavezcrash=pscmrtxtoptt423.." "
reportafterboitwotab("raid", true, vezaxname5, vezaxcrash5, nil, nil,0,1)
strochkavezcrash=pscmrtxtoptt424.." "
reportafterboitwotab("raid", true, vezaxname2, vezaxcrash2, nil, nil,0,1)
strochkavezcrash=pscmrtxtoptt425.." "
reportafterboitwotab("raid", true, vezaxname3, vezaxcrash3, nil, nil,0,1)
strochkavezcrash=pscmrtxtoptt427.." "
reportafterboitwotab("raid", true, vezaxname4, vezaxcrash4, nil, nil,0,1)

psiccrefsvin()

end

if wipe then
pswasonboss42=2
pscheckbossincombatmcr=GetTime()+1
end


end
end
end


function  pscmrbossRESET421(wipe,try,reset, checkforwipe)
if reset or wipe==nil then
pswasonboss42=nil
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


function pscombatlogboss42(...)
local arg1, arg2, argnew1, arg3,arg4,arg5,argNEW,arg6,arg7,arg8,argNEW2,arg9,arg10,arg11,arg12,arg13,arg14, arg15 = ...


--alakir damage count
if psalakiraddstab then
if psraidoptionson[1][4][2][8]==1 then

if arg2=="DAMAGE_SHIELD" or arg2=="SPELL_PERIODIC_DAMAGE" or arg2=="SPELL_DAMAGE" or arg2=="RANGE_DAMAGE" then
if arg12 then
local id=psGetUnitID(arg6)
if id==47175 then
local source=psgetpetownername(arg3, arg4, arg5)
psalakirdmgadd(source,arg6,arg12,arg13,arg9)
end
end
end


if arg2=="SWING_DAMAGE" then
if arg9 then
local id=psGetUnitID(arg6)
if id==47175 then
local source=psgetpetownername(arg3, arg4, arg5)
psalakirdmgadd(source,arg6,arg9,arg10,0)
end
end
end

if arg2=="UNIT_DIED" then
local id=psGetUnitID(arg6)
if id==47175 then
psalakiradddied(arg6)
end
end

if (arg2=="SPELL_AURA_APPLIED" or arg2=="SPELL_AURA_APPLIED_DOSE") and arg9==87904 then
psalakirdebuff1=GetTime()
psalakirdebuff2=nil
end

if arg2=="SPELL_AURA_REMOVED" and arg9==87904 then
psalakirdebuff2=GetTime()
psalakirdebuff1=nil
end

end
end
-- alakir

if (arg2=="SPELL_PERIODIC_DAMAGE" or (arg2=="SPELL_PERIODIC_MISSED" and arg12 and arg12=="ABSORB")) and (arg9==91020 or arg9==93258 or arg9==93259 or arg9==93260) then
pscmrboss422(arg6,arg7)
end

if (arg2=="SPELL_PERIODIC_DAMAGE" or (arg2=="SPELL_PERIODIC_MISSED" and arg12 and arg12=="ABSORB")) and (arg9==87856 or arg9==93283 or arg9==93284 or arg9==93285) then
pscmrboss421(arg1,arg6,arg7,arg10,arg9)
end


if arg2=="SPELL_AURA_APPLIED" and arg9==89666 then
psfriendlyfireboss42=arg7
end

if arg2=="SPELL_AURA_APPLIED" and arg9==89668 then
if ps_saoptions[1][4][2][1]==1 then
ps_sa_sendinfo(arg7, arg10.." "..psmain_sa_phrase1, 5, nil, nil)
end
end

if psfriendlyfireboss42 and arg2=="SPELL_DAMAGE" and (arg9==89667 or arg9==93293 or arg9==93294 or arg9==93295) and arg7~=psfriendlyfireboss42 then
pscmrboss424(psfriendlyfireboss42,arg6,arg7)
end


if (arg2=="SPELL_DAMAGE" or (arg2=="SPELL_MISSED" and arg12 and arg12=="ABSORB")) and (arg9==89588 or arg9==93297 or arg9==93298 or arg9==93299) then
pscmrboss427(arg6,arg7)
end

end