psbossfile41=1
function pscmrboss411(arg6,arg7,arg12)
local id=psGetUnitID(arg6)
if id==45870 then
	psconclavhealbsname=arg7
	pscheckwipe1()
	if pswipetrue and pswasonboss41~=2 then
		psiccwipereport("wipe", "try")
	end
		psiccschet1=psiccschet1+arg12
end
end

function pscmrboss412(arg6,arg7)
psunitisplayer(arg6,arg7)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss41~=2 then
		psiccwipereport("wipe", "try")
	end
		addtotwotables(arg7)
		vezaxsort1()
end
end

function pscmrboss413(arg6,arg7)
psunitisplayer(arg6,arg7)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss41~=2 then
		psiccwipereport("wipe", "try")
	end
		addtotwotables2(arg7)
		vezaxsort2()
end
end


function pscmrboss414(arg6,arg7)
psunitisplayer(arg6,arg7)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss41~=2 then
		psiccwipereport("wipe", "try")
	end
		addtotwotables3(arg7)
		vezaxsort3()
end
end


function pscmrboss415(arg1,arg3,arg6,arg7)
psunitisplayer(arg6,arg7)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss41~=2 then
		psiccwipereport("wipe", "try")
	end
		if psconclavtabl415==nil then psconclavtabl415={{"0"},{0}} end
		local bil=0
		for i=1,#psconclavtabl415 do
			if psconclavtabl415[1][i]==arg3 then
				bil=1
				if arg1>psconclavtabl415[2][i] then
					addtotwotables4(arg7)
					vezaxsort4()
				end
			end
		end
		if bil==0 then
			table.insert(psconclavtabl415[1],arg3)
			table.insert(psconclavtabl415[2],arg1+2.4)
		end
end
end

function pscmrboss416(arg6,arg7,arg13)
psunitisplayer(arg6,arg7)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss41~=2 then
		psiccwipereport("wipe", "try")
	end
		local bililine=0
		for i,getcrash in ipairs(vezaxname5) do 
			if getcrash == arg7 then
				bililine=1
				if arg13>vezaxcrash5[i] then
					vezaxcrash5[i]=arg13
				end
			end
		end
		if(bililine==0)then
			table.insert(vezaxname5,arg7) 
			table.insert(vezaxcrash5,arg13) 
		end
		vezaxsort5()
end
end

function psconclavaddnewshield()
if psiccschet2==1 then
	--создаем новые табл

	pscreatesavedreports3(psbossnames[1][4][1])
	
	psaddclasscolors()
	--psdmgresetinglastfight()
end
--добавляем щит
	local h,m = GetGameTime()
	if h<10 then h="0"..h end
	if m<10 then m="0"..m end
	local time=h..":"..m

local an=GetSpellInfo(95865)
table.insert(pssidamageinf_indexboss[pssavedplayerpos][1],3)
table.insert(pssidamageinf_title2[pssavedplayerpos][1],an..": "..psiccschet2)
table.insert(pssidamageinf_additioninfo[pssavedplayerpos][1],{psbossnames[1][4][1]..", "..time})
table.insert(pssidamageinf_damageinfo[pssavedplayerpos][1],{{},{},{}})
table.insert(pssidamageinf_switchinfo[pssavedplayerpos][1],{{},{}})

psupdateframewithnewinfo()
end

function psconclavdmgadd(arg4,arg6,dmg)
psmoddmg_addinfodmg(arg4,dmg,0,#pssidamageinf_damageinfo[pssavedplayerpos][1])
psmoddmg_sortinfodmg(#pssidamageinf_damageinfo[pssavedplayerpos][1])
end


function psconclavshieldoff()
		local an=GetSpellInfo(95865)
		local tm="?"
		if psiccschet3>0 and psiccschet4>0 then
			tm=pscmrconclavloc1..": "..((math.ceil((psiccschet4-psiccschet3)*10))/10).." "..pssec
		end
		pssidamageinf_title2[pssavedplayerpos][1][#pssidamageinf_title2[pssavedplayerpos][1]]=an..": "..psiccschet2..", "..tm
psupdateframewithnewinfo()

		if psraidoptionson[1][4][1][10]==1 then
			local ar3=psiccdmg3 or 4
			if #pssidamageinf_title2[pssavedplayerpos][1]>0 then
				local g=#pssidamageinf_title2[pssavedplayerpos][1]
				psdamagerep_cmr(psraidchats3[psraidoptionschat[1][4][1][10]],pssavedplayerpos,1,g,ar3,1,2,1, true)
			end
		end


end


function pscmrbossREPORT411(wipe,try,reset,checkforwipe)

if reset==nil then
if checkforwipe==nil or (checkforwipe and pswasonboss41 and pswasonboss41==1) then

	if psconclavhealbsname==nil then
		psconclavhealbsname="Anshal"
	end
	if pswasonboss41==1 then
		pssetcrossbeforereport1=GetTime()
		--тут репорт
		if psraidoptionson[1][4][1][1]==1 then
			if psiccschet1>0 then
				local temptxt=psiccschet1
				if (string.len(psiccschet1)) > 6 then
					temptxt=string.sub(psiccschet1,1,string.len(psiccschet1)-6).."."..string.sub(psiccschet1,(string.len(psiccschet1)-5),string.len(psiccschet1)-3).."."..string.sub(psiccschet1,(string.len(psiccschet1)-2))
				elseif (string.len(psiccschet1)) > 3 then
					temptxt=string.sub(psiccschet1,1,string.len(psiccschet1)-3).."."..string.sub(psiccschet1,(string.len(psiccschet1)-2))
				end
				pszapuskanonsa(psraidchats3[psraidoptionschat[1][4][1][1]], psconclavhealbsname.." "..pscmrtxtoptt411.." "..temptxt, true)
			end
		end
		if psraidoptionson[1][4][1][2]==1 then
			strochkavezcrash=pscmrtxtoptt412.." "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][4][1][2]], true, vezaxname, vezaxcrash, 1)
		end
		if psraidoptionson[1][4][1][3]==1 then
			strochkavezcrash=pscmrtxtoptt413.." "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][4][1][3]], true, vezaxname2, vezaxcrash2, 1)
		end
		if psraidoptionson[1][4][1][4]==1 then
			strochkavezcrash=pscmrtxtoptt414.." "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][4][1][4]], true, vezaxname3, vezaxcrash3, 1)
		end
		if psraidoptionson[1][4][1][5]==1 then
			strochkavezcrash=pscmrtxtoptt415.." "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][4][1][5]], true, vezaxname4, vezaxcrash4, 1)
		end
		if psraidoptionson[1][4][1][6]==1 then
			strochkavezcrash=pscmrtxtoptt416.." "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][4][1][6]], true, vezaxname5, vezaxcrash5, 1)
		end



		pssetcrossbeforereport1=GetTime()-50
		if psraidoptionson[1][4][1][8]==1 and psiccschet2>0 then
			local ar3=psiccdmg3 or 4
			if #pssidamageinf_title2[pssavedplayerpos][1]>0 then
				for g=1,#pssidamageinf_title2[pssavedplayerpos][1] do
					psdamagerep_cmr(psraidchats3[psraidoptionschat[1][4][1][8]],pssavedplayerpos,1,g,ar3,1,2,1, true)
				end
			end
		end
		pssetcrossbeforereport1=GetTime()

	end
	if pswasonboss41==1 or (pswasonboss41==2 and try==nil) then

	psiccsavinginf(psbossnames[1][4][1], try, pswasonboss41)

		--тут сохранение
				local temptxt=psiccschet1
				if (string.len(psiccschet1)) > 6 then
					temptxt=string.sub(psiccschet1,1,string.len(psiccschet1)-6).."."..string.sub(psiccschet1,(string.len(psiccschet1)-5),string.len(psiccschet1)-3).."."..string.sub(psiccschet1,(string.len(psiccschet1)-2))
				elseif (string.len(psiccschet1)) > 3 then
					temptxt=string.sub(psiccschet1,1,string.len(psiccschet1)-3).."."..string.sub(psiccschet1,(string.len(psiccschet1)-2))
				end

				pszapuskanonsa("raid", psconclavhealbsname.." "..pscmrtxtoptt411.." "..temptxt, true,nil,0,1)

	strochkavezcrash=pscmrtxtoptt412.." "
	reportafterboitwotab("raid", true, vezaxname, vezaxcrash, nil, nil,0,1)
	strochkavezcrash=pscmrtxtoptt413.." "
	reportafterboitwotab("raid", true, vezaxname2, vezaxcrash2, nil, nil,0,1)
	strochkavezcrash=pscmrtxtoptt414.." "
	reportafterboitwotab("raid", true, vezaxname3, vezaxcrash3, nil, nil,0,1)
	strochkavezcrash=pscmrtxtoptt415.." "
	reportafterboitwotab("raid", true, vezaxname4, vezaxcrash4, nil, nil,0,1)
	strochkavezcrash=pscmrtxtoptt416.." "
	reportafterboitwotab("raid", true, vezaxname5, vezaxcrash5, nil, nil,0,1)


	psiccrefsvin()

	end

	if wipe then
		pswasonboss41=2
		pscheckbossincombatmcr=GetTime()+1
	end

end
end
end


function pscmrbossRESET411(wipe,try,reset,checkforwipe)
if reset or wipe==nil then

pswasonboss41=nil
--тут резет
psiccschet1=0
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



function pscombatlogboss41(...)
local arg1, arg2, argnew1, arg3,arg4,arg5,argNEW,arg6,arg7,arg8,argNEW2,arg9,arg10,arg11,arg12,arg13,arg14, arg15,arg16,arg17 = ...


--conclav damage count
if psraidoptionson[1][4][1][7]==1 then

if arg2=="SPELL_AURA_APPLIED" and (arg9==95865 or arg9==93059) then
psconclavshield=1
psiccschet2=psiccschet2+1
psiccschet3=GetTime()
psiccschet4=0
psconclavaddnewshield()
end

if psconclavshield then

if arg2=="DAMAGE_SHIELD_MISSED" or arg2=="SPELL_PERIODIC_MISSED" or arg2=="SPELL_MISSED" or arg2=="RANGE_MISSED" then
if arg14 then
local id=psGetUnitID(arg6)
if id==45872 then
psconclavdmgadd(arg4,arg6,arg14)
end
end
end


if arg2=="SWING_MISSED" then
if arg11 then
local id=psGetUnitID(arg6)
if id==45872 then
psconclavdmgadd(arg4,arg6,arg11)
end
end
end

if arg2=="SPELL_AURA_REMOVED" and (arg9==95865 or arg9==93059) then
psconclavparcialabsorb=GetTime()
psiccschet4=GetTime()
end

--partial dmg
if psconclavparcialabsorb and psconclavparcialabsorb+0.5>GetTime() then

if arg2=="SPELL_PERIODIC_DAMAGE" or arg2=="SPELL_DAMAGE" or arg2=="RANGE_DAMAGE" or arg2=="DAMAGE_SHIELD" then
if arg17 and arg17>0 then
local id=psGetUnitID(arg6)
if id==45872 then
local source=psgetpetownername(arg3, arg4, arg5)
psconclavdmgadd(source,arg6,arg17)
end
end
end


if arg2=="SWING_DAMAGE" then
if arg14 and arg14>0 then
local id=psGetUnitID(arg6)
if id==45872 then
local source=psgetpetownername(arg3, arg4, arg5)
psconclavdmgadd(source,arg6,arg14)
end
end
end

end


end --psconclavshield

end

if arg2=="SPELL_CAST_START" and arg9==86205 then
psconclavhealbsname=arg4
end

if arg2=="SPELL_HEAL" and (arg9==95218 or arg9==95219 or arg9==95220 or arg9==95221 or arg9==86206) then
pscmrboss411(arg6,arg7,arg12)
end

if (arg2=="SPELL_DAMAGE" or (arg2=="SPELL_MISSED" and arg12 and arg12=="ABSORB")) and (arg9==93140 or arg9==85483 or arg9==93138 or arg9==93139) then
pscmrboss412(arg6,arg7)
end

if (arg2=="SPELL_DAMAGE" or (arg2=="SPELL_MISSED" and arg12 and arg12=="ABSORB")) and (arg9==86133 or arg9==93141 or arg9==93142 or arg9==93143) then
pscmrboss413(arg6,arg7)
end

if arg2=="ENVIRONMENTAL_DAMAGE" and arg9=="FALLING" then
if arg10 and arg10>39999 then
pscmrboss414(arg6,arg7)
end
end

if arg2=="SPELL_DAMAGE" and (arg9==86111 or arg9==93129 or arg9==93130 or arg9==93131) then
pscmrboss415(arg1,arg3,arg6,arg7)
end

if arg2=="SPELL_AURA_APPLIED_DOSE" and (arg9==84645 or arg9==93125) and arg13 then
pscmrboss416(arg6,arg7,arg13)
end

end