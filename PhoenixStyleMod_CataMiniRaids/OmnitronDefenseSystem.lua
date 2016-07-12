psbossfile22=1
function pscmrbossaplly222(arg3,arg7)
	if #pstableofomniatten1>0 then
		local byl=0
		for i=1,#pstableofomniatten1 do
			if pstableofomniatten1[i]==arg3 then
				byl=1
			end
		end
		if byl==0 then
			table.insert(pstableofomniatten1,arg3)
			table.insert(pstableofomniatten2,arg7)
		end
	else
		table.insert(pstableofomniatten1,arg3)
		table.insert(pstableofomniatten2,arg7)
	end
end

function pscmrboss222(arg3,arg7)
if psomnitronbombdelay==nil then
	psiccldghosttrigid={}
	psiccldghosttrigname={}

	psiccldghostdmgtime={}
	psiccldghostdmgid={}
	psiccldghostdmgname={}
end
psomnitronbombdelay=GetTime()+10

local norm=0
local nm2=""
if pstableofomniatten1 and #pstableofomniatten1>0 then
	for i=1,#pstableofomniatten1 do
		if pstableofomniatten1[i]==arg3 then
			if pstableofomniatten2[i]~=arg7 then
				norm=1
				nm2=pstableofomniatten2[i]
				if #pstableofomniatten3>0 then
					local bul=0
					for j=1,#pstableofomniatten3 do
						if pstableofomniatten3[j]==arg7 then
							bul=1
							pstableofomniatten4[j]=pstableofomniatten4[j]+1
						end
					end
					if bul==0 then
						table.insert(pstableofomniatten3,arg7)
						table.insert(pstableofomniatten4,1)
					end
				else
					table.insert(pstableofomniatten3,arg7)
					table.insert(pstableofomniatten4,1)
				end
			end
		end
	end
end

local ac=""
if norm==1 then
ac=" ("..pscmrtxtoptt2222.." - "..nm2..")"
end

if pswasonboss22 and pswasonboss22~=2 then
if psraidoptionson[1][2][2][2]==1 then
	if UnitSex(arg7) and UnitSex(arg7)==3 then
		pszapuskanonsa(psraidchats3[psraidoptionschat[1][2][2][2]], "{rt8} "..arg7.." "..pscmrtxtoptt222f..ac)
	else
		pszapuskanonsa(psraidchats3[psraidoptionschat[1][2][2][2]], "{rt8} "..arg7.." "..pscmrtxtoptt222m..ac)
	end
end
addtotwotables3(arg7)
vezaxsort3()
end

local nnnmm=GetSpellInfo(91498)
pscaststartinfo(0,nnnmm..": "..psaddcolortxt(1,arg7)..arg7..psaddcolortxt(2,arg7)..ac, -1, "id1", 3, nnnmm.." - "..psinfo,psbossnames[1][2][2],2)


table.insert(psiccldghosttrigid, arg3)
table.insert(psiccldghosttrigname, arg7)


end


function pscmrboss225(arg4,arg6,arg7)
psunitisplayer(arg6,arg7)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss22~=2 then
		psiccwipereport("wipe", "try")
	end
		addtotwotables4(arg4)
		vezaxsort4()
		addtotwotables5(arg7)
		vezaxsort5()
end
end




function psiccladydeathghostcheck(pstm, psnm,ttt,classch)

if psiccldghostdmgname then
	if classch then

		local _, classhunt = UnitClass(psnm)

		if classhunt and classhunt=="HUNTER" then

			if psomnitronbombdelay then
				psomnitronbombdelay=psomnitronbombdelay+5
			end

			if psicchunterdiedelay==nil then
				psicchunterdiedelay=GetTime()+3
				psicchunterdiedelaytable={psnm}
				psicchunterdiedelayboss=1
				psicchunterdiedelayarg1=pstm+3
			else
				psicchunterdiedelay=GetTime()+3
				table.insert(psicchunterdiedelaytable,psnm)
				psicchunterdiedelayarg1=pstm+3
			end

		else
			psiccladydeathghostcheck(pstm, psnm,ttt)
		end


	else

		local pstableid={} --ид бомб что били трупа
		local pstablename={}
		local pstableaftertarchanged={}

		for i=1,#psiccldghostdmgname do
			if psiccldghostdmgname[i]==psnm then
				if pstm-psiccldghostdmgtime[i]<ttt then
					table.insert(pstableid,psiccldghostdmgid[i])
				end
			end
		end


local nm22=""
if #pstableid>0 then
for i=1,#pstableid do
	local j=1
	while j<=#psiccldghosttrigid do
		if psiccldghosttrigid[j]==pstableid[i] then
			table.insert(pstablename,psiccldghosttrigname[j])
			local butl=0
			if pstableofomniatten1 and #pstableofomniatten1>0 then
				for gf=1,#pstableofomniatten1 do
					if pstableofomniatten1[gf]==pstableid[i] then
						if pstableofomniatten2[gf]~=psiccldghosttrigname[j] then
							butl=1
							nm22=pstableofomniatten2[gf]
						end
					end
				end
			end
			if butl==0 then
				table.insert(pstableaftertarchanged,0)
			else
				table.insert(pstableaftertarchanged,1)
			end

			j=1000
		end
		if j==#psiccldghosttrigid and pstablename[i]==nil then
			pstablename[i]=psiccunknown
			pstableaftertarchanged[i]=0
		end
	j=j+1
	end
end

local psstringa=""
local vinovat=""
if pstableaftertarchanged and pstableaftertarchanged[1] and pstableaftertarchanged[1]==1 then
vinovat=" ("..pscmrtxtoptt2222.." - "..nm22..")"
end

if GetTime()-psiccschet2<3 then
psiccschet3=psiccschet3+1
else
psiccschet3=0
end
psiccschet2=GetTime()


	if psiccschet3<=4 then
if #pstableid==1 then
if pstablename[1] and pstablename[1]~=psiccunknown and UnitSex(pstablename[1]) and UnitSex(pstablename[1])==3 then
if UnitSex(psnm) and UnitSex(psnm)==3 then
psstringa=psaddcolortxt(1,psnm)..psnm..psaddcolortxt(2,psnm).." "..pscmrfailtxt11511fem.." 1 "..pscmrldfail261fem.." "..psaddcolortxt(1,pstablename[1])..pstablename[1]..psaddcolortxt(2,pstablename[1])..vinovat
else
psstringa=psaddcolortxt(1,psnm)..psnm..psaddcolortxt(2,psnm).." "..pscmrfailtxt11511.." 1 "..pscmrldfail261fem.." "..psaddcolortxt(1,pstablename[1])..pstablename[1]..psaddcolortxt(2,pstablename[1])..vinovat
end
else

if UnitSex(psnm) and UnitSex(psnm)==3 then
psstringa=psaddcolortxt(1,psnm)..psnm..psaddcolortxt(2,psnm).." "..pscmrfailtxt11511fem.." 1 "..pscmrldfail261.." "..psaddcolortxt(1,pstablename[1])..pstablename[1]..psaddcolortxt(2,pstablename[1])..vinovat
else
psstringa=psaddcolortxt(1,psnm)..psnm..psaddcolortxt(2,psnm).." "..pscmrfailtxt11511.." 1 "..pscmrldfail261.." "..psaddcolortxt(1,pstablename[1])..pstablename[1]..psaddcolortxt(2,pstablename[1])..vinovat
end

end
else
if UnitSex(psnm) and UnitSex(psnm)==3 then
psstringa=psaddcolortxt(1,psnm)..psnm..psaddcolortxt(2,psnm).." "..pscmrfailtxt11511fem.." "..#pstableid.." "..pscmrldfail262.." "
else
psstringa=psaddcolortxt(1,psnm)..psnm..psaddcolortxt(2,psnm).." "..pscmrfailtxt11511.." "..#pstableid.." "..pscmrldfail262.." "
end
	for i=1,#pstablename do
		local vin=""
		if pstableaftertarchanged and pstableaftertarchanged[i] and pstableaftertarchanged[i]==1 then
			vin=" ("..pscmrtxtoptt2223..")"
		end
		psstringa=psstringa..psaddcolortxt(1,pstablename[i])..pstablename[i]..psaddcolortxt(2,pstablename[i])..vin
		if i==#pstablename then
			psstringa=psstringa.."."
		else
			psstringa=psstringa..", "
		end
	end
end

if pswasonboss22 and pswasonboss22~=2 then
if psraidoptionson[1][2][2][3]==1 then
	pszapuskanonsa(psraidchats3[psraidoptionschat[1][2][2][3]], "{rt8} "..psremovecolor(psstringa))
end
end

local nmsp=GetSpellInfo(80086)
pscaststartinfo(0,psstringa, -1, "id1", 3, nmsp.." - "..psinfo,psbossnames[1][2][2],2)


end
	end
end
end
end


function omniaddtotwotables6(nicktoadd,arg10)

local bililine=0
for i,getcrash in ipairs(vezaxname6) do 
	if getcrash == nicktoadd then
		vezaxcrash6[i]=vezaxcrash6[i]+1
		if UnitInRaid(nicktoadd) then
			local ok=0
			if #psomniabilities[i]>0 then
				for j=1,#psomniabilities[i] do
					if psomniabilities[i][j]==arg10 then
						psomniabilitiesq[i][j]=psomniabilitiesq[i][j]+1
						ok=1
					end
				end
			end
			if ok==0 then
				table.insert(psomniabilities[i],arg10)
				table.insert(psomniabilitiesq[i],1)
			end
		end
		bililine=1
	end
end
if(bililine==0)then
	table.insert(vezaxname6,nicktoadd) 
	table.insert(vezaxcrash6,1)
	if UnitInRaid(nicktoadd) then
		table.insert(psomniabilities,{arg10})
		table.insert(psomniabilitiesq,{1})
	else
		table.insert(psomniabilities,{})
		table.insert(psomniabilitiesq,{})
	end
end

end

function omnivezaxsort6()
local vzxnn= # vezaxname6
while vzxnn>1 do
if vezaxcrash6[vzxnn]>vezaxcrash6[vzxnn-1] then
local vezaxtemp1=vezaxcrash6[vzxnn-1]
local vezaxtemp2=vezaxname6[vzxnn-1]
local ab1=psomniabilities[vzxnn-1]
local ab2=psomniabilitiesq[vzxnn-1]

vezaxcrash6[vzxnn-1]=vezaxcrash6[vzxnn]
vezaxname6[vzxnn-1]=vezaxname6[vzxnn]
psomniabilities[vzxnn-1]=psomniabilities[vzxnn]
psomniabilitiesq[vzxnn-1]=psomniabilitiesq[vzxnn]
vezaxcrash6[vzxnn]=vezaxtemp1
vezaxname6[vzxnn]=vezaxtemp2
psomniabilities[vzxnn]=ab1
psomniabilitiesq[vzxnn]=ab2
end
vzxnn=vzxnn-1
end
end


function pscmromnishieldonlycifr1(arg4,arg10)
if psomnishield1 then
omniaddtotwotables6(arg4,arg10)
omnivezaxsort6()
end
if psbossblock==nil then
	pscheckwipe1()
	if pswipetrue and pswasonboss22~=2 then
		psiccwipereport("wipe", "try")
	end
		addtotwotables7(arg4)
		vezaxsort7()
end
end

function pscmromnishieldonlycifr3(arg4)
if psomnishield31 then
addtotwotables10(arg4)
vezaxsort10()
end
if psbossblock==nil then
	pscheckwipe1()
	if pswipetrue and pswasonboss22~=2 then
		psiccwipereport("wipe", "try")
	end
		addtotwotables11(arg4)
		vezaxsort11()
end
end


function psomnitronshieldisup(arg4,tt)
if psraidoptionson[1][2][2][15]==1 then
psiccschet4=psiccschet4+1
if psiccschet4==1 then
	--создаем новые табл

  pscreatesavedreports3(psbossnames[1][2][2])

	psaddclasscolors()
	--psdmgresetinglastfight()
end
--добавляем щит
	local h,m = GetGameTime()
	if h<10 then h="0"..h end
	if m<10 then m="0"..m end
	local time=h..":"..m

local mm=tt or 4
table.insert(pssidamageinf_indexboss[pssavedplayerpos][1],mm)
table.insert(pssidamageinf_title2[pssavedplayerpos][1],pscmrshield..": "..psiccschet4.." ("..arg4..")")
table.insert(pssidamageinf_additioninfo[pssavedplayerpos][1],{psbossnames[1][2][2]..", "..time})
table.insert(pssidamageinf_damageinfo[pssavedplayerpos][1],{{},{},{}})
table.insert(pssidamageinf_switchinfo[pssavedplayerpos][1],{{},{}})

psupdateframewithnewinfo()
end
end

function psomnidmgadd(arg4,arg6,dmg)
if psraidoptionson[1][2][2][15]==1 then
psmoddmg_addinfodmg(arg4,dmg,1,#pssidamageinf_damageinfo[pssavedplayerpos][1])
psmoddmg_sortinfodmg(#pssidamageinf_damageinfo[pssavedplayerpos][1])
end
end


function reportafterboitwotab_omni(inwhichchat, bojinterr, tabln, tablc, qq, maxpers,iccsv,norep)

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
if pstableofomniatten3 and #pstableofomniatten3>0 then
	for z=1,#pstableofomniatten3 do
		if pstableofomniatten3[z]==tabln[i] then
			if tablc[i]==pstableofomniatten4[z] then
				addj=" - "..pscmrtxtoptt2223
			else
				addj=" - "..pscmrtxtoptt2223..": "..pstableofomniatten4[z]
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

function pscmrbossREPORT221(wipe,try,reset,checkforwipe)
if reset==nil then
if checkforwipe==nil or (checkforwipe and pswasonboss22 and pswasonboss22==1) then
	if pswasonboss22==1 then
		--тут репорт
		pssetcrossbeforereport1=GetTime()
		if psraidoptionson[1][2][2][5]==1 then
			strochkavezcrash=pscmrtxtoptt225.." "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][2][2][5]], true, vezaxname4, vezaxcrash4, 1)
		end
		if psraidoptionson[1][2][2][6]==1 then
			strochkavezcrash=pscmrtxtoptt226.." "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][2][2][6]], true, vezaxname5, vezaxcrash5, 1)
		end
		if psraidoptionson[1][2][2][7]==1 then
			strochkavezcrash=pscmrtxtoptt227.." "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][2][2][7]], true, vezaxname2, vezaxcrash2, 1)
		end
		if psraidoptionson[1][2][2][8]==1 then
			strochkavezcrash=pscmrtxtoptt228.." "
			reportafterboitwotab_omni(psraidchats3[psraidoptionschat[1][2][2][8]], true, vezaxname3, vezaxcrash3, 1)
		end
		if psraidoptionson[1][2][2][9]==1 then
			strochkavezcrash=pscmrtxtoptt229.." "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][2][2][9]], true, vezaxname7, vezaxcrash7, 1)
		end
		if psraidoptionson[1][2][2][10]==1 then
			strochkavezcrash=pscmrtxtoptt2210.." "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][2][2][10]], true, vezaxname9, vezaxcrash9, 1)
		end
		if psraidoptionson[1][2][2][11]==1 then
			strochkavezcrash=pscmrtxtoptt2211.." "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][2][2][11]], true, vezaxname11, vezaxcrash11, 1)
		end

	end
	if pswasonboss22==1 or (pswasonboss22==2 and try==nil) then

	psiccsavinginf(psbossnames[1][2][2], try, pswasonboss22)
		--тут сохранение
	strochkavezcrash=pscmrtxtoptt225.." "
	reportafterboitwotab("raid", true, vezaxname4, vezaxcrash4, nil, nil,0,1)
	strochkavezcrash=pscmrtxtoptt226.." "
	reportafterboitwotab("raid", true, vezaxname5, vezaxcrash5, nil, nil,0,1)
	strochkavezcrash=pscmrtxtoptt227.." "
	reportafterboitwotab("raid", true, vezaxname2, vezaxcrash2, nil, nil,0,1)
	strochkavezcrash=pscmrtxtoptt228.." "
	reportafterboitwotab_omni("raid", true, vezaxname3, vezaxcrash3, nil, nil,0,1)
	strochkavezcrash=pscmrtxtoptt229.." "
	reportafterboitwotab("raid", true, vezaxname7, vezaxcrash7, nil, nil,0,1)
	strochkavezcrash=pscmrtxtoptt2210.." "
	reportafterboitwotab("raid", true, vezaxname9, vezaxcrash9, nil, nil,0,1)
	strochkavezcrash=pscmrtxtoptt2211.." "
	reportafterboitwotab("raid", true, vezaxname11, vezaxcrash11, nil, nil,0,1)

	psiccrefsvin()

	end

	if wipe then
		pswasonboss22=2
		pscheckbossincombatmcr=GetTime()+1
	end
end
end
end


function  pscmrbossRESET221(wipe,try,reset,checkforwipe)
if reset or wipe==nil then
pswasonboss22=nil
--тут резет
table.wipe(vezaxname2)
table.wipe(vezaxcrash2)
table.wipe(vezaxname3)
table.wipe(vezaxcrash3)
table.wipe(vezaxname4)
table.wipe(vezaxcrash4)
table.wipe(vezaxname5)
table.wipe(vezaxcrash5)
table.wipe(vezaxname7)
table.wipe(vezaxcrash7)
table.wipe(vezaxname9)
table.wipe(vezaxcrash9)
table.wipe(vezaxname11)
table.wipe(vezaxcrash11)
end
end







function pscombatlogboss22(...)
local arg1, arg2, argnew1, arg3,arg4,arg5,argNEW,arg6,arg7,arg8,argNEW2,arg9,arg10,arg11,arg12,arg13,arg14, arg15,arg16,arg17 = ...


if psodsatrontemp1 and (arg2=="SPELL_DAMAGE" or arg2=="SPELL_MISSED") and (arg9==79504 or arg9==91535 or arg9==91536 or arg9==91537) and GetTime()<psodsatrontemp1+8 and psodsatrontemp2 and arg7~=psodsatrontemp2 then
psunitisplayer(arg6,arg7)
if psunitplayertrue then

if psomnifdfsf then
addtotwotables(arg7)
vezaxsort1()
end

addtotwotables2(arg7)
vezaxsort2()
end
end


if psomnitronbombdelay then

if arg2=="SPELL_DAMAGE" and (arg9==80092 or arg9==91498 or arg9==91499 or arg9==91500) then
psunitisplayer(arg6,arg7)
if psunitplayertrue then
table.insert(psiccldghostdmgtime, arg1)
table.insert(psiccldghostdmgid, arg3)
table.insert(psiccldghostdmgname, arg7)
end
end

if arg2=="UNIT_DIED" then
psunitisplayer(arg6,arg7)
if psunitplayertrue then
psiccladydeathghostcheck(arg1,arg7,5,1)
end
end

end


--щиты омнитрона
if arg2=="SPELL_AURA_APPLIED" and (arg9==79900 or arg9==91447 or arg9==91448 or arg9==91449) then
table.wipe(vezaxname6)
table.wipe(vezaxcrash6)
table.wipe(psomniabilities)
table.wipe(psomniabilitiesq)
psomnitronshieldisup(arg4)
psomnishield1=GetTime()+15
--psomnishieldonlydmgtrack1=GetTime()+15
if pswasonboss22 and pswasonboss22~=2 then
psomnishield11=1
else
psomnishield11=nil
end
end


if arg2=="SPELL_AURA_REMOVED" and (arg9==79900 or arg9==91447 or arg9==91448 or arg9==91449) then
psomnishield1=GetTime()-1
end

if arg2=="SPELL_AURA_APPLIED" and (arg9==79835 or arg9==91501 or arg9==91502 or arg9==91503) then
table.wipe(vezaxname8)
table.wipe(vezaxcrash8)
psomnishield2=GetTime()+15
psomnitronshieldisup(arg4)
psomnishieldonlydamage2=GetTime()
if pswasonboss22 and pswasonboss22~=2 then
psomnishield21=1
else
psomnishield21=nil
end
end

if arg2=="SPELL_AURA_REMOVED" and (arg9==79835 or arg9==91501 or arg9==91502 or arg9==91503) then
psomnishieldonlydamage2=nil
end


if arg2=="SPELL_AURA_APPLIED" and (arg9==79729 or arg9==91543 or arg9==91544 or arg9==91545) then
table.wipe(vezaxname10)
table.wipe(vezaxcrash10)
psomnishield3=GetTime()+15
psomnitronshieldisup(arg4)
if pswasonboss22 and pswasonboss22~=2 then
psomnishield31=1
else
psomnishield31=nil
end
end


if arg2=="SPELL_AURA_REMOVED" and (arg9==79729 or arg9==91543 or arg9==91544 or arg9==91545) then
psomnishield3=GetTime()-1
end

if psomnishield2 and arg2=="SPELL_AURA_APPLIED" and (arg9==80011 or arg9==91504 or arg9==91505 or arg9==91506) then
if psomnishield21 then
addtotwotables8(arg7)
vezaxsort8()
end
if psbossblock==nil then
	pscheckwipe1()
	if pswipetrue and pswasonboss22~=2 then
		psiccwipereport("wipe", "try")
	end
		addtotwotables9(arg7)
		vezaxsort9()
end
end

--счет урона
if psomnishield1 then
if arg2=="SPELL_DAMAGE" or arg2=="RANGE_DAMAGE" then
if arg9 and arg9~=3606 and arg9~=85455 then
if arg12 and arg12>0 then
local id=psGetUnitID(arg6)
if id==42179 then
--тут добавлять урон
psomnidmgadd(arg4,arg6,arg12)
pscmromnishieldonlycifr1(arg4,arg10)
end
end
end
end

if arg2=="SWING_DAMAGE" then
if arg9 and arg9>0 then
local id=psGetUnitID(arg6)
if id==42179 then
--тут добавлять урон
psomnidmgadd(arg4,arg6,arg9)
pscmromnishieldonlycifr1(arg4,"melee")
end
end
end
end

--2 босс, не добавял в стандартные таблицы а только в счетчик урона
if psomnishieldonlydamage2 and GetTime()<psomnishieldonlydamage2+11 then
if arg2=="SPELL_DAMAGE" or arg2=="RANGE_DAMAGE" then
if arg9 and arg9~=85455 and arg9~=3606 then
if arg12 and arg12>0 then
local id=psGetUnitID(arg6)
if id==42180 then
--тут добавлять урон
psomnidmgadd(arg4,arg6,arg12)
end
end
end
end

if arg2=="SWING_DAMAGE" then
if arg9 and arg9>0 then
local id=psGetUnitID(arg6)
if id==42180 then
--тут добавлять урон
psomnidmgadd(arg4,arg6,arg9)
end
end
end
end

if psomnishield3 then
if arg2=="SPELL_DAMAGE" or arg2=="RANGE_DAMAGE" then
if arg9 and arg9~=85455 and arg9~=3606 then
if arg12 and arg12>0 then
local id=psGetUnitID(arg6)
if id==42166 then
--тут добавлять урон
psomnidmgadd(arg4,arg6,arg12)
pscmromnishieldonlycifr3(arg4)
end
end
end
end

if arg2=="SWING_DAMAGE" then
if arg9 and arg9>0 then
local id=psGetUnitID(arg6)
if id==42166 then
--тут добавлять урон
psomnidmgadd(arg4,arg6,arg9)
pscmromnishieldonlycifr3(arg4)
end
end
end


end
--счет урона


if arg2=="SPELL_CAST_START" and (arg9==79710 or arg9==91540 or arg9==91541 or arg9==91542) and psraidoptionson[1][2][2][16]==1 then
pscheckrunningbossid(arg3)
pscaststartinfo(arg9,arg10..": %s.", 2, arg3, 1, pscmreventsincomb1..": "..pscmreventsincomb2,psbossnames[1][2][2])
end

if arg2=="SPELL_CAST_START" and arg9==78746 and psraidoptionson[1][2][2][16]==1 then
local id=psGetUnitID(arg3)
if id==42166 then
pscheckrunningbossid(arg3)
pscaststartinfo(0,pscmreventsincomb1..": "..arg10, 0, "id1", 1, pscmreventsincomb1..": "..pscmreventsincomb2,psbossnames[1][2][2])
end
end





if arg2=="SPELL_AURA_APPLIED" and (arg9==79505 or arg9==91531 or arg9==91532 or arg9==91533) then
	pscheckwipe1()
	if pswipetrue and pswasonboss22~=2 then
		psiccwipereport("wipe", "try")
	end
		psodsatrontemp1=GetTime()
		psodsatrontemp2=arg7
		if pswasonboss22~=2 then
			psomnifdfsf=1
		else
			psomnifdfsf=nil
		end
end

if (arg2=="SWING_DAMAGE" or arg2=="SWING_MISSED") then
	local id=psGetUnitID(arg3)
	if id==42897 then
		pscmrboss222(arg3,arg7)
	end
end

if arg2=="SPELL_AURA_APPLIED" and arg9==80094 and pstableofomniatten1 then
	pscmrbossaplly222(arg3,arg7)
end



--щит аплаится, запуск всего!
if arg2=="SPELL_AURA_APPLIED" and (arg9==79582 or arg9==91516 or arg9==91517 or arg9==91518) then
	pscheckwipe1()
	if pswipetrue and pswasonboss22~=2 then
		psiccwipereport("wipe", "try")
	end
psshieldisonboss22=GetTime()
table.wipe(psdamagename2)
table.wipe(psdamagevalue2)
psomnitronshieldisup(arg4,44)
end

--считаем урон 10 сек
if psshieldisonboss22 and GetTime()<psshieldisonboss22+11 then
if arg2=="SPELL_PERIODIC_MISSED" or arg2=="SPELL_MISSED" or arg2=="RANGE_MISSED" then
local id=psGetUnitID(arg6)
if id==42178 then
if arg14 then
local source=psgetpetownername(arg3, arg4, arg5)
addtotwodamagetables(source, arg14)
psdamagetwotablsort1()
psomnidmgadd(source,arg6,arg14)
end
end
end

--учитывать ретриков под гневом
if arg2=="SPELL_DAMAGE" then
local id=psGetUnitID(arg6)
if id==42178 then
if arg17 and arg17>0 then
local source=psgetpetownername(arg3, arg4, arg5)
addtotwodamagetables(source, arg17)
psdamagetwotablsort1()
psomnidmgadd(source,arg6,arg17)
end
end
end

if arg2=="SWING_DAMAGE" then
if arg14 and arg14>0 then
local id=psGetUnitID(arg6)
if id==42178 then
local source=psgetpetownername(arg3, arg4, arg5)
addtotwodamagetables(source, arg14)
psdamagetwotablsort1()
psomnidmgadd(source,arg6,arg14)
end
end
end

if arg2=="SWING_MISSED" then
if arg11 then
local id=psGetUnitID(arg6)
if id==42178 then
local source=psgetpetownername(arg3, arg4, arg5)
addtotwodamagetables(source, arg11)
psdamagetwotablsort1()
psomnidmgadd(source,arg6,arg11)
end
end
end

end


if psshieldisonboss22 and (arg2=="SPELL_CAST_SUCCESS" or arg2=="SPELL_DAMAGE") and (arg9==79617 or arg9==91528 or arg9==91529 or arg9==91530) then
psshieldisonboss22=nil

if psraidoptionson[1][2][2][4]==1 then
strochkadamageout="{rt8} "..pscmrtxtoptt224.." "
reportfromtwodamagetables(psraidchats3[psraidoptionschat[1][2][2][4]], 1, 2999)
end

if pssidamageinf_title2[pssavedplayerpos][1][#pssidamageinf_title2[pssavedplayerpos][1]] then
pssidamageinf_title2[pssavedplayerpos][1][#pssidamageinf_title2[pssavedplayerpos][1]]=pssidamageinf_title2[pssavedplayerpos][1][#pssidamageinf_title2[pssavedplayerpos][1]].." ("..pscmrshielddown..")"
psupdateframewithnewinfo()
end

table.wipe(psdamagename2)
table.wipe(psdamagevalue2)
end


if arg2=="SPELL_AURA_APPLIED" and (arg9==79888 or arg9==91431 or arg9==91432 or arg9==91433) then
psfriendlyfireboss22=arg7
end

if psfriendlyfireboss22 and arg2=="SPELL_DAMAGE" and (arg9==79889 or arg9==91438 or arg9==91439 or arg9==91440) then
pscmrboss225(psfriendlyfireboss22,arg6,arg7)
end

--SA
if arg2=="SPELL_AURA_APPLIED" and (arg9==79501 or arg9==92035 or arg9==92036 or arg9==92037) and ps_saoptions[1][2][2][1]==1 then
ps_sa_omni1=GetTime()+0.35
ps_sa_omni2=arg7
ps_sa_omni3=arg10
end

if arg2=="SPELL_CAST_SUCCESS" and arg9==92023 and ps_sa_omni1 then
ps_sa_omni1=nil
ps_sa_sendinfo(ps_sa_omni2, ps_sa_omni3.." "..psmain_sa_phrase1.." "..pscmrcantmove, 5, 1, nil)
ps_sa_omni2=nil
ps_sa_omni3=nil
end


if arg2=="SPELL_AURA_APPLIED" and (arg9==79888 or arg9==91431 or arg9==91432 or arg9==91433) then
if ps_saoptions[1][2][2][2]==1 then
ps_sa_sendinfo(arg7, arg10.." "..psmain_sa_phrase1, 5, nil, nil)
end
end

if arg2=="SPELL_AURA_APPLIED" and (arg9==79888 or arg9==91431 or arg9==91432 or arg9==91433) then
if ps_saoptions[1][2][2][2]==1 then
ps_sa_sendinfo(arg7, arg10.." "..psmain_sa_phrase1, 5, nil, nil)
end
end

if arg2=="SPELL_AURA_APPLIED" and arg9==92053 then
if ps_saoptions[1][2][2][3]==1 then
ps_sa_sendinfo(arg7, arg10.." "..psmain_sa_phrase1, 5, nil, nil)
end
end

if arg2=="SPELL_CAST_SUCCESS" and arg9==80157 then
if ps_saoptions[1][2][2][4]==1 then
ps_sa_checktargets(GetTime()+0.17,arg3,0.2,arg10.." "..psmain_sa_phrase1,3,0)
end
end


end