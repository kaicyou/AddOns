psbossfile34=1
function pscmrboss341(arg6,arg7,arg10,spellid)
psunitisplayer(arg6,arg7)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss34~=2 then
		psiccwipereport("wipe", "try")
	end
		addtotwotables(arg7)
		vezaxsort1()

		if psraidoptionson[1][3][4][3]==1 then
			pscaststartinfo(0,arg10..": "..psaddcolortxt(1,arg7)..arg7..psaddcolortxt(2,arg7), -1, "id1", 2, "|s4id"..spellid.."|id - "..psinfo,psbossnames[1][3][4],2)
		end
end
end

function pscmrboss342(arg6,arg7,arg13)
psunitisplayer(arg6,arg7)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss34~=2 then
		psiccwipereport("wipe", "try")
	end
		local bililine=0
		for i,getcrash in ipairs(vezaxname2) do 
			if getcrash == arg7 then
				bililine=1
				if arg13>vezaxcrash2[i] then
					vezaxcrash2[i]=arg13
				end
			end
		end
		if(bililine==0)then
			table.insert(vezaxname2,arg7) 
			table.insert(vezaxcrash2,arg13) 
		end
		vezaxsort2()
end
end



function pscmrbossREPORT341(wipe,try,reset,checkforwipe)
if reset==nil then
if checkforwipe==nil or (checkforwipe and pswasonboss34 and pswasonboss34==1) then

	if pswasonboss34==1 then
		pssetcrossbeforereport1=GetTime()
		--тут репорт
		if psraidoptionson[1][3][4][1]==1 then
			strochkavezcrash=pscmrtxtoptt341.." "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][3][4][1]], true, vezaxname, vezaxcrash, 1)
		end
		if psraidoptionson[1][3][4][2]==1 then
			strochkavezcrash=pscmrtxtoptt342.." "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][3][4][2]], true, vezaxname2, vezaxcrash2, 1)
		end
		if psraidoptionson[1][3][4][5]==1 then
			strochkavezcrash=pscmrchogaldopmod1..": "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][3][4][5]], true, vezaxname3, vezaxcrash3, 1)
		end
		if psraidoptionson[1][3][4][6]==1 then
			strochkavezcrash=pscmrtxtoptt346.." "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][3][4][6]], true, vezaxname5, vezaxcrash5, 1)
		end
		if psraidoptionson[1][3][4][7]==1 then
			strochkadamageout=pscmrtxtoptt347a..": "
			reportfromtwodamagetables(psraidchats3[psraidoptionschat[1][3][4][7]], 1, 30000,nil, true)
		end
		if psraidoptionson[1][3][4][8]==1 then
			strochkadamageout=pscmrtxtoptt347b..": "
			reportfromtwodamagetables3(psraidchats3[psraidoptionschat[1][3][4][8]], 1, 30000,nil, true)
		end

	end
	if pswasonboss34==1 or (pswasonboss34==2 and try==nil) then

	psiccsavinginf(psbossnames[1][3][4], try, pswasonboss34)
		--тут сохранение
	strochkavezcrash=pscmrtxtoptt341.." "
	reportafterboitwotab("raid", true, vezaxname, vezaxcrash, nil, nil,0,1)
	strochkavezcrash=pscmrtxtoptt342.." "
	reportafterboitwotab("raid", true, vezaxname2, vezaxcrash2, nil, nil,0,1)
	strochkavezcrash=pscmrchogaldopmod1..": "
	reportafterboitwotab("raid", true, vezaxname3, vezaxcrash3, nil, nil,0,1)
	strochkavezcrash=pscmrtxtoptt346.." "
	reportafterboitwotab("raid", true, vezaxname5, vezaxcrash5, nil, nil,0,1)
	strochkadamageout=pscmrtxtoptt347a..": "
	reportfromtwodamagetables("raid", 1, 30000, nil, true,0,1)
	strochkadamageout=pscmrtxtoptt347b..": "
	reportfromtwodamagetables3("raid", 1, 30000, nil, true,0,1)

	psiccrefsvin()

	end

	if wipe then
		pswasonboss34=2
		pscheckbossincombatmcr=GetTime()+1
	end
end
end
end


function  pscmrbossRESET341(wipe,try,reset,checkforwipe)
if reset or wipe==nil then
pswasonboss34=nil
--тут резет
table.wipe(vezaxname)
table.wipe(vezaxcrash)
table.wipe(vezaxname2)
table.wipe(vezaxcrash2)
table.wipe(vezaxname3)
table.wipe(vezaxcrash3)
-- 4 табл занята
table.wipe(vezaxname5)
table.wipe(vezaxcrash5)
table.wipe(psdamagename2)
table.wipe(psdamagevalue2)
table.wipe(psdamagename3)
table.wipe(psdamagevalue3)
end
end



function pscombatlogboss34(...)
local arg1, arg2, argnew1, arg3,arg4,arg5,argNEW,arg6,arg7,arg8,argNEW2,arg9,arg10,arg11,arg12,arg13,arg14, arg15 = ...


if arg2=="SPELL_CAST_START" and (arg9==81713 or arg9==93175 or arg9==93176 or arg9==93177) and psraidoptionson[1][3][4][3]==1 then
local bil=5
local bil2=0
if pscogaltable1 and #pscogaltable1>0 then
	for i=1,#pscogaltable1 do
		if pscogaltable1[i]==arg3 then
			bil2=1
			bil=i+4
		end
	end
end
if bil2==0 then
	table.insert(pscogaltable1,arg3)
	bil=#pscogaltable1+4
end


pscheckrunningbossid(arg3)
pscaststartinfo(arg9,arg10.." ("..psmob1..": "..(bil-4).."): %s.", 2.5, arg3, bil, arg10.." ("..psmob1.." "..(bil-4)..") - "..pscmreventsincomb2,psbossnames[1][3][4])
end


if arg2=="SPELL_CAST_START" and (arg9==82411 or arg9==93132 or arg9==93133 or arg9==93134) and psraidoptionson[1][3][4][3]==1 then
pscheckrunningbossid(arg3)
pscaststartinfo(arg9,arg10..": %s.", 10, arg3, 1, arg10.." - "..pscmreventsincomb2,psbossnames[1][3][4],1,1)
end


--поклонение
if arg2=="SPELL_AURA_APPLIED" and (arg9==91317 or arg9==93365 or arg9==93366 or arg9==93367) and psraidoptionson[1][3][4][3]==1 then
if psiccschet3~=0 and (chogalrazdelenie1==nil or (chogalrazdelenie1 and GetTime()>chogalrazdelenie1+1)) then
pscaststartinfo(arg9,"---", 0, "id1", 4, "|s4id"..arg9.."|id - "..pscmreventsincomb2,psbossnames[1][3][4])
end
psiccschet3=1
chogalrazdelenie1=GetTime()
pscheckrunningbossid(arg3)
pscaststartinfo(arg9,arg10..": %s ("..psaddcolortxt(1,arg7)..arg7..psaddcolortxt(2,arg7)..").", 9, arg3, 4, "|s4id"..arg9.."|id - "..pscmreventsincomb2,psbossnames[1][3][4],2,nil,nil,nil,3)
end



if (arg2=="SPELL_DAMAGE" or (arg2=="SPELL_MISSED" and arg12 and arg12=="ABSORB")) and (arg9==81689 or arg9==93184 or arg9==93185 or arg9==93186) then
pscmrboss341(arg6,arg7,arg10,arg9)
end

if arg2=="SPELL_AURA_APPLIED" and (arg9==82361 or arg9==94144 or arg9==94145 or arg9==94146) then
psiccschet1=1
end


--баффс диспелед!

if arg2=="SPELL_AURA_APPLIED" and (arg9==91317 or arg9==93365 or arg9==93366 or arg9==93367) then
pschonomoredisp1={} --кто сбил
pschonomoredisp2={} --кому сбил
pschonomoredisp3={} --время сбития

if pschogaldisp1==nil then
	pschogaldisp1=GetTime()+10
	pschogaldisp2={}
	table.wipe(vezaxname4)
	table.wipe(vezaxcrash4)
	psiccschet2=0
end
psiccschet2=psiccschet2+1
end


if arg2=="SPELL_AURA_REMOVED" and (arg9==91317 or arg9==93365 or arg9==93366 or arg9==93367) and pschogaldisp1 then
psiccschet2=psiccschet2-1
if psiccschet2==0 then
pschogaldisp1=GetTime()+1
end
end

if arg2=="SPELL_DISPEL" and pschogaldisp1 and arg12 then
local buffsname={pscmrbuffsnames1,pscmrbuffsnames2,pscmrbuffsnames3,pscmrbuffsnames4,pscmrbuffsnames5,pscmrbuffsnames6,pscmrbuffsnames7}
local buffsid={{79063,79061},{79102},{79038,79058},{79105},{79107},{54646},{85767,85768}}

for i=1,#buffsid do
	for j=1,#buffsid[i] do
		if buffsid[i][j] and buffsid[i][j]==arg9 then
			pscheckwipe1()
			if pswipetrue and pswasonboss34~=2 then
				psiccwipereport("wipe", "try")
			end
			addtotwotables3(arg4)
			vezaxsort3()
			addtotwotables4(buffsname[i])
			vezaxsort4()
			if psraidoptionson[1][3][4][3]==1 then
				local namsp=GetSpellInfo(arg9)
				if UnitSex(arg4) and UnitSex(arg4)==3 then
					pscaststartinfo(0,psaddcolortxt(1,arg4)..arg4..psaddcolortxt(2,arg4).." "..pscmrchogaldopmod22.." '"..namsp.."' "..pscmrtxtoptadd3216.." "..psaddcolortxt(1,arg7)..arg7..psaddcolortxt(2,arg7), -1, "id1", 3, pscmrchogaldopmod1.." - "..psinfo,psbossnames[1][3][4],2)
				else
					pscaststartinfo(0,psaddcolortxt(1,arg4)..arg4..psaddcolortxt(2,arg4).." "..pscmrchogaldopmod21.." '"..namsp.."' "..pscmrtxtoptadd3216.." "..psaddcolortxt(1,arg7)..arg7..psaddcolortxt(2,arg7), -1, "id1", 3, pscmrchogaldopmod1.." - "..psinfo,psbossnames[1][3][4],2)
				end
			end
			local bil=0
			if #pschogaldisp2>0 then
				for k=1,#pschogaldisp2 do
					if pschogaldisp2[k]==arg4 then
						bil=1
					end
				end
			end
			if bil==0 then
				table.insert(pschogaldisp2,arg4)
			end
		end
	end
end

end

--конец бафа на поклонение
if arg2=="SPELL_AURA_REMOVED" and (arg9==91317 or arg9==93365 or arg9==93366 or arg9==93367) and psraidoptionson[1][3][4][3]==1 then
if #psincombattrack1_bossid>0 then
	for i=1,#psincombattrack1_bossid do
		if psincombattrack1_bossid[i]==arg6 then
			if psincombattrack3_timestopcheck[i]>GetTime()+1.1 or #psincombattrack5_whokiked[i]>0 or #psincombattrack7_whocasted[i]>0 then
					local nbil=0
					if #psinterbystan2>0 then
						for nb=1,#psinterbystan2 do
							if psinterbystan2[nb]==psincombattrack1_bossid[i] then
								nbil=1
								psinterbystan3[nb]=1
							end
						end
					end
					if nbil==0 then
						table.insert(psinterbystan1,GetTime()+0.3)
						table.insert(psinterbystan2,psincombattrack1_bossid[i])
						table.insert(psinterbystan3,1)
					end
			end
		end
	end
end
end

--кик
if arg2=="SPELL_INTERRUPT" then
if pscogalplayerid and #pscogalplayerid>0 then
	local okbil=0
	for bv=1,#pscogalplayerid do
		if pscogalplayerid[bv]==arg6 then
			okbil=1
		end
	end
	if okbil==1 then
		local ok=0
		if #pschonomoredisp1>0 then
			for i=1,#pschonomoredisp1 do
				if pschonomoredisp1[i]==arg4 and pschonomoredisp2[i]==arg7 and GetTime()<pschonomoredisp3[i]+5 then
					ok=1
				end
			end
		end
		if ok==0 then
			addtotwotables5(arg4)
			vezaxsort5()
			table.insert(pschonomoredisp1,arg4)
			table.insert(pschonomoredisp2,arg7)
			table.insert(pschonomoredisp3,GetTime())
		end
	end
end
end

--юз спела, юз стана, диспелл
if arg2=="SPELL_CAST_SUCCESS" and arg6 and (arg9==57994 or arg9==2139 or arg9==6552 or arg9==26090 or arg9==72 or arg9==47528 or arg9==85285 or arg9==34490 or arg9==24259 or arg9==19647 or arg9==31935 or arg9==41378 or arg9==80964 or arg9==80965 or arg9==78675) then
if pscogalplayerid and #pscogalplayerid>0 then
	local okbil=0
	for bv=1,#pscogalplayerid do
		if pscogalplayerid[bv]==arg6 then
			okbil=1
		end
	end
	if okbil==1 then
		local ok=0
		if #pschonomoredisp1>0 then
			for i=1,#pschonomoredisp1 do
				if pschonomoredisp1[i]==arg4 and pschonomoredisp2[i]==arg7 and GetTime()<pschonomoredisp3[i]+5 then
					ok=1
				end
			end
		end
		if ok==0 then
			addtotwotables5(arg4)
			vezaxsort5()
			table.insert(pschonomoredisp1,arg4)
			table.insert(pschonomoredisp2,arg7)
			table.insert(pschonomoredisp3,GetTime())
		end
	end
end
end

if arg2=="SPELL_AURA_APPLIED" and (arg9==91807 or arg9==30283 or arg9==8122 or arg9==12355 or arg9==31661 or arg9==19503 or arg9==88625 or arg9==118 or arg9==61721 or arg9==28272 or arg9==61305 or arg9==28271 or arg9==853 or arg9==1776 or arg9==1833 or arg9==408 or arg9==2094 or arg9==47476 or arg9==82691 or arg9==44572 or arg9==22703 or arg9==89766 or arg9==605 or arg9==64044 or arg9==12809 or arg9==46968 or arg9==3355 or arg9==33786 or arg9==58861 or arg9==22570 or arg9==5211 or arg9==710 or arg9==24394 or arg9==51209 or arg9==2637 or arg9==9005 or arg9==2812 or arg9==6770 or arg9==76780 or arg9==51514 or arg9==39796 or arg9==93986 or arg9==6789 or arg9==54786 or arg9==5782 or arg9==5484 or arg9==6358 or arg9==5246 or arg9==85388 or arg9==30217 or arg9==67769 or arg9==30216 or arg9==13327 or arg9==56 or arg9==20549 or arg9==28730 or arg9==25046 or arg9==33390 or arg9==50613 or arg9==69179 or arg9==80483 or arg9==7922 or arg9==20253 or arg9==18498 or arg9==19386 or arg9==15487 or arg9==9484 or arg9==50519 or arg9==1513 or arg9==91800 or arg9==91797 or arg9==83047 or arg9==87204 or arg9==10326 or arg9==20066 or arg9==13181) then
if pscogalplayerid and #pscogalplayerid>0 and pswasonboss34 then
	local okbil=0
	for bv=1,#pscogalplayerid do
		if pscogalplayerid[bv]==arg6 then
			okbil=1
		end
	end
	if okbil==1 then
		local ok=0
		if #pschonomoredisp1>0 then
			for i=1,#pschonomoredisp1 do
				if pschonomoredisp1[i]==arg4 and pschonomoredisp2[i]==arg7 and GetTime()<pschonomoredisp3[i]+5 then
					ok=1
				end
			end
		end
		if ok==0 then
			addtotwotables5(arg4)
			vezaxsort5()
			table.insert(pschonomoredisp1,arg4)
			table.insert(pschonomoredisp2,arg7)
			table.insert(pschonomoredisp3,GetTime())
		end
	end
end
end

--урон от отбрасывания - прерывание
if (arg2=="SPELL_DAMAGE" or (arg2=="SPELL_MISSED" and arg12 and arg12=="ABSORB")) and (arg9==61391 or arg9==51490 or arg9==82207 or arg9==6360) then
if pscogalplayerid and #pscogalplayerid>0 and pswasonboss34 then
	local okbil=0
	for bv=1,#pscogalplayerid do
		if pscogalplayerid[bv]==arg6 then
			okbil=1
		end
	end
	if okbil==1 then
		local ok=0
		if #pschonomoredisp1>0 then
			for i=1,#pschonomoredisp1 do
				if pschonomoredisp1[i]==arg4 and pschonomoredisp2[i]==arg7 and GetTime()<pschonomoredisp3[i]+5 then
					ok=1
				end
			end
		end
		if ok==0 then
			addtotwotables5(arg4)
			vezaxsort5()
			table.insert(pschonomoredisp1,arg4)
			table.insert(pschonomoredisp2,arg7)
			table.insert(pschonomoredisp3,GetTime())
		end
	end
end
end

if arg2=="SPELL_DISPEL" and (arg9==91317 or arg9==93365 or arg9==93366 or arg9==93367) then
if pscogalplayerid and #pscogalplayerid>0 and pswasonboss34 then
	local okbil=0
	for bv=1,#pscogalplayerid do
		if pscogalplayerid[bv]==arg6 then
			okbil=1
		end
	end
	if okbil==1 then
		addtotwotables5(arg4)
		vezaxsort5()
	end
end
if #psincombattrack1_bossid>0 then
	for i=1,#psincombattrack1_bossid do
		if psincombattrack1_bossid[i]==arg6 and GetTime()<psincombattrack3_timestopcheck[i] then
			local bil=0
			for j=1,#psincombattrack5_whokiked[i] do
				if psincombattrack5_whokiked[i][j]==arg4 then
					bil=1
				end
			end
			if bil==0 then
				for j=1,#psincombattrack7_whocasted[i] do
					if psincombattrack7_whocasted[i][j] and psincombattrack7_whocasted[i][j]==arg4 then
						table.remove(psincombattrack7_whocasted[i],j)
						table.remove(psincombattrack8_timecasted[i],j)
					end
				end
			end

			if bil==0 then
				--если время больше чем 90% то красным пишем
				local timesbit=math.ceil((GetTime()-psincombattrack2_timecaststart[i])*10)/10
				if psincombattrack10_redtimeifmorethen[i]~=0 and GetTime()>psincombattrack10_redtimeifmorethen[i] then
					timesbit="|cffff0000"..timesbit.."|r"
				end

				--bnbn=1

				--удаляем сбития прекиками и прекастами
				if psincombattrack5_whokiked[i][1]=="1" or psincombattrack5_whokiked[i][1]=="2" or psincombattrack5_whokiked[i][1]=="3" then
					table.remove(psincombattrack5_whokiked[i],1)
					table.remove(psincombattrack6_timekiked[i],1)
				end

				if #psincombattrack5_whokiked[i]>0 then
					table.insert(psincombattrack7_whocasted[i],arg4)
					table.insert(psincombattrack8_timecasted[i],(arg10..", "..(math.ceil((GetTime()-psincombattrack2_timecaststart[i])*10)/10)))
				else
					table.insert(psincombattrack5_whokiked[i],arg4)
					table.insert(psincombattrack6_timekiked[i],(arg10..", "..timesbit))
				end
			end
		if psincombattrack3_timestopcheck[i]>GetTime()+2 then
			psincombattrack3_timestopcheck[i]=GetTime()+2
		end
		end
	end
end
end


--счет в аддов лишний, оверкилл
if arg2=="SPELL_DAMAGE" or arg2=="RANGE_DAMAGE" or arg2=="DAMAGE_SHIELD" then
if arg13 and arg13>1 then
local id=psGetUnitID(arg6)
if id==43592 or id==43406 then
addtotwodamagetables(arg4, arg13)
psdamagetwotablsort1()
addtotwodamagetables3(arg4, arg13)
psdamagetwotablsort3()
end
end
end

if arg2=="SPELL_PERIODIC_DAMAGE" then
if arg13 and arg13>1 then
local id=psGetUnitID(arg6)
if id==43592 or id==43406 then
addtotwodamagetables(arg4, arg13)
psdamagetwotablsort1()
end
end
end

if arg2=="SWING_DAMAGE" then
if arg10 and arg10>1 then
local id=psGetUnitID(arg6)
if id==43592 or id==43406 then
addtotwodamagetables(arg4, arg10)
psdamagetwotablsort1()
addtotwodamagetables3(arg4, arg10)
psdamagetwotablsort3()
end
end
end

if arg2=="SPELL_CAST_SUCCESS" and (arg9==93178 or arg9==93179 or arg9==93180 or arg9==81685) then
if ps_saoptions[1][3][4][1]==1 then
ps_sa_checktargets(GetTime()+0.17,arg3,0.2,arg10.." "..psmain_sa_phrase1,3,0)
end
end

end