psbossfile55=1


function pscmrbossREPORT551(wipe,try,reset,checkforwipe)
if reset==nil then
if checkforwipe==nil or (checkforwipe and pswasonboss55 and pswasonboss55==1) then

	if pswasonboss55==1 then
	--	pssetcrossbeforereport1=GetTime()
	--	if psraidoptionson[1][5][5][1]==1 then
	--		strochkavezcrash=psfireldamagefrom.." |s4id98463|id: "
	--		reportafterboitwotab(psraidchats3[psraidoptionschat[1][5][5][1]], true, vezaxname, vezaxcrash, 1)
	--	end




	end
	if pswasonboss55==1 or (pswasonboss55==2 and try==nil) then

		psiccsavinginf(psbossnames[1][5][5], try, pswasonboss55)

	--	strochkavezcrash=psfireldamagefrom.." |s4id98463|id: "
	--	reportafterboitwotab("raid", true, vezaxname, vezaxcrash, nil, nil,0,1)



		psiccrefsvin()

	end




	if wipe then
		pswasonboss55=2
		pscheckbossincombatmcr_2=GetTime()+1
	end
end
end
end


function  pscmrbossRESET551(wipe,try,reset,checkforwipe)
if reset or wipe==nil then
pswasonboss55=nil
table.wipe(vezaxname)
table.wipe(vezaxcrash)
table.wipe(psbalerok1)
table.wipe(psbalerok2)
table.wipe(psbalerok3)
table.wipe(psbalerok4)
table.wipe(psbalerok5)

psbalecount1=nil
psbalecount2=nil

balerotabsta1=nil
balerotabsta2=nil
balerotabsta3=nil

psbalmax3=nil

balerochealmod01=nil
balerochealmod02=nil
balerochealmod03=nil
balerochealmod04=nil
psbalertanks=nil

psbalerocforserest=GetTime()+20

end
end


function pscombatlogboss55(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)
--local arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15 = ...

if arg2=="SPELL_AURA_REMOVED" and (spellid==100231 or spellid==100230 or spellid==100232 or spellid==99256) then
--тормент спал, 1 сек на накладывание тормендеда
table.insert(psbalerok4,1,name2)
table.insert(psbalerok5,1,GetTime())
end

if (arg2=="SPELL_AURA_APPLIED" or arg2=="SPELL_AURA_REFRESH") and (spellid==99257 or spellid==99402 or spellid==99403 or spellid==99404) and psbalerok1 then 
--ыытест только в героике проверять дистанцию 99403 99404

if pswasonboss55==nil then
	pswasonboss55=1
end

local bil=0
pstormenteddeb=spellid
pstormenteddeb2=spellname
if #psbalerok4>0 then
	for i=1,#psbalerok4 do
		if psbalerok4[i]==name2 and psbalerok5[i]+1>GetTime() then
			bil=1
		end
	end
end
if select(3,GetInstanceInfo())==2 or select(3,GetInstanceInfo())==3 then
bil=1
end

if bil==1 then
	table.insert(psbalerok1,1,1)
	table.insert(psbalerok2,1,name2)
	table.insert(psbalerok3,1,GetTime())
	local add=""
	if balerotabsta1 and #balerotabsta1>0 then
		for i=1,#balerotabsta1 do
			if balerotabsta1[i]==name2 then
				if balerotabsta3[i]+5>GetTime() then
					add=" ("..balerotabsta2[i].." "..psfirestaks..")"
				end
			end
		end
	end
	pscaststartinfo(0,spellname..": "..psfirebaleroccrystal.." -> "..psaddcolortxt(1,name2)..name2..psaddcolortxt(2,name2)..add, -1, "id1", 1, spellname.." - "..psinfo.." ("..psfirenotsure..")",psbossnames[1][5][5],2)


	--отображать так же в репорте хилов, если передали хилеру!
	if balerochealmod01 and #balerochealmod01>0 then
		for m=1,#balerochealmod01 do
			if balerochealmod01[m]==name2 then
				local a1=GetSpellInfo(99262)
				local a2=GetSpellInfo(99263)
				pscaststartinfo(0,"|cffff0000"..spellname..": "..psfirebaleroccrystal.." -> "..psaddcolortxt(1,name2)..name2..psaddcolortxt(2,name2)..add.."|r", -1, "id1", 97, a1.." & "..a2.." - "..psinfo,psbossnames[1][5][5],2)
			end
		end
	end


else
	--героик мод
	--если на игрока 3 сек не вешали ничего - тогда только ищем КТО
	local track=1
	for i=1,#psbalerok2 do
		if psbalerok2[i]==name2 and GetTime()<psbalerok3[i]+3 then
			track=0
		end
	end
	--получаем у кого посл 60 сек есть дебафф, расчитываем растояние между нейм2 и ими, выбираем самое короткое
	if track==1 then
		local playersnear={}
		for i=1,#psbalerok2 do
			if psbalerok3[i]+63>GetTime() and psbalerok2[i]~=name2 and (UnitDebuff(psbalerok2[i], spellname) or UnitBuff(psbalerok2[i], spellname)) then
				local uje=0
				for j=1,#playersnear do
					if playersnear[j]==psbalerok2[i] then
						uje=1
					end
				end
				table.insert(playersnear,psbalerok2[i])
			end
		end
		if #playersnear>0 then
			--проверяем найближайшего игрока к нейм2
			local x,y=GetPlayerMapPosition(name2)
			if x and y then
				local minnumr=999999999999999
				local whomin=0
				for i=1,#playersnear do
					local x2,y2=GetPlayerMapPosition(playersnear[i])
					if x2 and y2 then
						local dist=math.sqrt(math.pow((x-x2),2)+math.pow((y-y2),2))
						if dist<minnumr then
							minnumr=dist
							whomin=i
						end
					end
				end
				if whomin>0 then
					table.insert(psbalerok1,1,playersnear[whomin])
					table.insert(psbalerok2,1,name2)
					table.insert(psbalerok3,1,GetTime())
					local cound=0 --на игроках найден каундаун, передача не учитывается!
					if psbalecount1 and #psbalecount1>0 then
						for v=1,#psbalecount1 do
							if psbalecount1[v]==name2..playersnear[whomin] or psbalecount1[v]==playersnear[whomin]..name2 then
								if GetTime()<psbalecount2[v]+10 then
									cound=1
								end
							end
						end
					end
					local addt=""
					if cound==1 then
						addt=" ("..GetSpellInfo(99516)..")"
					end
					pscaststartinfo(0,spellname..": "..psaddcolortxt(1,playersnear[whomin])..playersnear[whomin]..psaddcolortxt(2,playersnear[whomin]).."|cffff0000 -> |r"..psaddcolortxt(1,name2)..name2..psaddcolortxt(2,name2)..addt, -1, "id1", 1, spellname.." - "..psinfo.." ("..psfirenotsure..")",psbossnames[1][5][5],2)


					--отображать так же в репорте хилов, если передали хилеру!
					if balerochealmod01 and #balerochealmod01>0 then
						for m=1,#balerochealmod01 do
							if balerochealmod01[m]==name2 then
								local a1=GetSpellInfo(99262)
								local a2=GetSpellInfo(99263)
								pscaststartinfo(0,"|cffff0000"..spellname..": "..psaddcolortxt(1,playersnear[whomin])..playersnear[whomin]..psaddcolortxt(2,playersnear[whomin]).."|cffff0000 -> |r"..psaddcolortxt(1,name2)..name2..psaddcolortxt(2,name2)..addt.."|r", -1, "id1", 97, a1.." & "..a2.." - "..psinfo,psbossnames[1][5][5],2)
							end
						end
					end
				end
					
			else
				table.insert(psbalerok1,1,0)
				table.insert(psbalerok2,1,name2)
				table.insert(psbalerok3,1,GetTime())
				pscaststartinfo(0,spellname..": |cffff0000"..psiccunknown.."|r -> "..psaddcolortxt(1,name2)..name2..psaddcolortxt(2,name2), -1, "id1", 1, spellname.." - "..psinfo.." ("..psfirenotsure..")",psbossnames[1][5][5],2)
			end
		else
			table.insert(psbalerok1,1,0)
			table.insert(psbalerok2,1,name2)
			table.insert(psbalerok3,1,GetTime())
			pscaststartinfo(0,spellname..": |cffff0000"..psiccunknown.."|r -> "..psaddcolortxt(1,name2)..name2..psaddcolortxt(2,name2), -1, "id1", 1, spellname.." - "..psinfo.." ("..psfirenotsure..")",psbossnames[1][5][5],2)
		end
	end
end
end


if arg2=="SPELL_DAMAGE" and (spellid==100231 or spellid==100230 or spellid==100232 or spellid==99256) and arg13>0 then
--смертельный удар от тормента, чекаем дебафы
local bil=0
for i=1,#psbalerok2 do
	if psbalerok2[i]==name2 and bil==0 and psbalerok3[i]+61>GetTime() then
		bil=1
		if pstormenteddeb==nil then
			pstormenteddeb=99257
			pstormenteddeb2="Tormented"
		end
		local who=""
		if psbalerok1[i]==0 then
			who=psiccunknown
		elseif psbalerok1[i]==1 then
			who=psfirebaleroccrystal
		else
			who=psbalerok1[i]
		end

	pscheckwipe1()
	if pswipetrue and pswasonboss55~=2 then
		psiccwipereport_2("wipe", "try")
	end
		if pswasonboss55 and pswasonboss55~=2 then
		if psraidoptionson[1][5][5][1]==1 then
			--временно выключил ыытест
			--pszapuskanonsa(psraidchats3[psraidoptionschat[1][5][5][1]], "{rt8} "..name2.." "..psfirediedfrom.." |s4id"..spellid.."|id "..psfirewith.." |s4id"..pstormenteddeb.."|id debuff "..psfireby.." "..who.." (~"..(math.ceil((60-(GetTime()-psbalerok3[i])))).." "..pssec..")")
		end
		end
		pscaststartinfo(0, psaddcolortxt(1,name2)..name2..psaddcolortxt(2,name2).." "..psfirediedfrom.." "..spellname.." "..psfirewith.." "..pstormenteddeb2.." debuff "..psfireby.." "..psaddcolortxt(1,who)..who..psaddcolortxt(2,who).." (~"..(math.ceil((60-(GetTime()-psbalerok3[i])))).." "..pssec..")", -1, "id1", 2, spellname.." - "..psfirewhodied.." ("..psfirenotsure..")",psbossnames[1][5][5],2)
	end
end
end


if arg2=="SPELL_DAMAGE" and spellid==99353 and arg13>0 then
--смертельный удар от Decimating Strike, чекаем дебафы
local bil=0
for i=1,#psbalerok2 do
	if psbalerok2[i]==name2 and bil==0 and psbalerok3[i]+61>GetTime() then
		bil=1
		if pstormenteddeb==nil then
			pstormenteddeb=99257
			pstormenteddeb2="Tormented"
		end
		local who=""
		if psbalerok1[i]==0 then
			who=psiccunknown
		elseif psbalerok1[i]==1 then
			who=psfirebaleroccrystal
		else
			who=psbalerok1[i]
		end

	pscheckwipe1()
	if pswipetrue and pswasonboss55~=2 then
		psiccwipereport_2("wipe", "try")
	end
		if pswasonboss55 and pswasonboss55~=2 then
		if psraidoptionson[1][5][5][2]==1 then
			pszapuskanonsa(psraidchats3[psraidoptionschat[1][5][5][2]], "{rt8} "..name2.." "..psfirediedfrom.." |s4id"..spellid.."|id "..psfirewith.." |s4id"..pstormenteddeb.."|id debuff "..psfireby.." "..who.." (~"..(math.ceil((60-(GetTime()-psbalerok3[i])))).." "..pssec..")")
		end
		end
		pscaststartinfo(0, psaddcolortxt(1,name2)..name2..psaddcolortxt(2,name2).." "..psfirediedfrom.." "..spellname.." "..psfirewith.." "..pstormenteddeb2.." debuff "..psfireby.." "..psaddcolortxt(1,who)..who..psaddcolortxt(2,who).." (~"..(math.ceil((60-(GetTime()-psbalerok3[i])))).." "..pssec..")", -1, "id1", 3, spellname.." - "..psfirewhodied.." ("..psfirenotsure..")",psbossnames[1][5][5],2)
	end
end
end


--записывать все каунтдауны )

if arg2=="SPELL_AURA_APPLIED" and spellid==99516 then
if psbalerokcount11==nil then
	psbalerokcount11=name2
	psbalerokcount2=GetTime()+1
else
	psbalerokcount12=name2
end
psbalercount=spellname

--имя и время каунтдауна, 10 сек после него если передал второму игроку то не считается...
if psbalecount1==nil then
psbalecount1={} --2 ника вместе
psbalecount2={} --время дебафа 1го
end

local biil=0
if #psbalecount2>0 then
	for i=1,#psbalecount2 do
		if GetTime()<psbalecount2[i]+1 then
			biil=1
			psbalecount1[i]=psbalecount1[i]..name2
		end
	end
end
if biil==0 then
table.insert(psbalecount2,GetTime())
table.insert(psbalecount1,name2)
end

end

if arg2=="SPELL_DAMAGE" and spellid==99518 then
if psbalerokcount31==nil then
	psbalerokcount31=name1
	psbalerokcount4=GetTime()+1
else
	psbalerokcount32=name1
end
psbalercount=spellname
end





--отображать сколько стаков было от кристалла у человека (сколько он протанчил)

if arg2=="SPELL_AURA_APPLIED" and (spellid==100231 or spellid==100230 or spellid==100232 or spellid==99256) then
if pswasonboss55==nil then
	pswasonboss55=1
end
if balerotabsta1==nil then
	balerotabsta1={} --имя на ком стакается кристалл
	balerotabsta2={} --сколько стаков набрано
	balerotabsta3={} --время последнего стака (не более 5 сек чтоб прошло)
end

local bil=0
if #balerotabsta1>0 then
	for i=1,#balerotabsta1 do
		if balerotabsta1[i]==name2 then
			balerotabsta2[i]=1
			balerotabsta3[i]=GetTime()
			bil=1
		end
	end
end
if bil==0 then
	table.insert(balerotabsta1,name2)
	table.insert(balerotabsta2,1)
	table.insert(balerotabsta3,GetTime())
end
end

if arg2=="SPELL_AURA_APPLIED_DOSE" and (spellid==100231 or spellid==100230 or spellid==100232 or spellid==99256) then
if pswasonboss55==nil then
	pswasonboss55=1
end
if balerotabsta1==nil then
	balerotabsta1={} --имя на ком стакается кристалл
	balerotabsta2={} --сколько стаков набрано
	balerotabsta3={} --время последнего стака (не более 5 сек чтоб прошло)
end

local bil=0
if #balerotabsta1>0 then
	for i=1,#balerotabsta1 do
		if balerotabsta1[i]==name2 then
			balerotabsta2[i]=arg13
			balerotabsta3[i]=GetTime()
			bil=1
		end
	end
end
if bil==0 then
	table.insert(balerotabsta1,name2)
	table.insert(balerotabsta2,arg13)
	table.insert(balerotabsta3,GetTime())
end
end

















--спарки, хилеры, танки


if arg2=="SPELL_AURA_APPLIED_DOSE" and spellid==99262 then
if pswasonboss55==nil then
	pswasonboss55=1
end
if balerochealmod01==nil then
	balerochealmod01={} --имя хила
	balerochealmod02={} --цвет для выделения -- или "" если белым, и не требуется закрывать тогда цвет
	balerochealmod03={} --сколько стаков
	balerochealmod04={} --время посл стака --если больше 40 сек прошло то даже заражения этого человека не считать // 15 сек это норм
end

local bil=0
if #balerochealmod01>0 then
	for i=1,#balerochealmod01 do
		if balerochealmod01[i]==name1 then
			balerochealmod03[i]=arg13
			balerochealmod04[i]=GetTime()
			bil=1
		end
	end
end
if bil==0 then
	table.insert(balerochealmod01,name1)
	--выбираем цвет
	local col=psaddcolortxt(1,name1)
	local ok=0
	if #balerochealmod02>0 then
		for i=1,#balerochealmod02 do
			if balerochealmod02[i]==col then
				ok=1
			end
		end
	end
	if ok==1 then
		local colors={"|CFFFFF468","|CFF68CCEF","|CFF9382C9","|CFFAAD372","|CFFC69B6D","|CFFC41F3B","|CFFF48CBA","|CFFFFFFFF","|CFF1a3caa","|CFFFF7C0A"}
		local ba=0
		for i=1,#colors do
			if ba==0 then
				local ba2=0
				for j=1,#balerochealmod02 do
					if balerochealmod02[j]==colors[i] then
						ba2=1
					end
				end
				if ba2==0 then
					col=colors[i]
					ba=1
				end
			end
		end
	end
	table.insert(balerochealmod02,col)
	table.insert(balerochealmod03,arg13)
	table.insert(balerochealmod04,GetTime())
end
end


--флейм
if arg2=="SPELL_AURA_APPLIED" and spellid==99263 and balerochealmod01 then
if pswasonboss55==nil then
	pswasonboss55=1
end
local sta="?"
local col=""
for i=1,#balerochealmod01 do
	if balerochealmod01[i]==name1 then
		if balerochealmod04[i]+15>GetTime() then
			sta=balerochealmod03[i]
		end
		col=balerochealmod02[i]
	end
end
local a1=GetSpellInfo(99262)
local a2=GetSpellInfo(99263)

local col2=""
if col~="" then
	col2="|r"
end

local aasd=""
local torm=GetSpellInfo(99257)
if UnitDebuff(name1, torm) then
aasd=" |cffff0000("..torm..")|r"
end

pscaststartinfo(0,"|cff00ff00+|r "..col..name1.." - "..a2.." ("..psfirestaks..": "..sta..")"..col2..aasd, -1, "id1", 97, a1.." & "..a2.." - "..psinfo,psbossnames[1][5][5],2)

end

if arg2=="SPELL_AURA_REMOVED" and spellid==99263 and balerochealmod01 then
if pswasonboss55==nil then
	pswasonboss55=1
end
local col=""
for i=1,#balerochealmod01 do
	if balerochealmod01[i]==name1 then
		col=balerochealmod02[i]
	end
end
local a1=GetSpellInfo(99262)
local a2=GetSpellInfo(99263)

local col2=""
if col~="" then
	col2="|r"
end

local aasd=""
local torm=GetSpellInfo(99257)
if UnitDebuff(name1, torm) then
aasd=" |cffff0000("..torm..")|r"
end

pscaststartinfo(0,"|cffff0000-|r "..col..name1.." - "..a2.." "..psfireended..col2..aasd, -1, "id1", 97, a1.." & "..a2.." - "..psinfo,psbossnames[1][5][5],2)

end




--танки (если нада)
if arg2=="SPELL_AURA_APPLIED_DOSE" and spellid==99252 then
if pswasonboss55==nil then
	pswasonboss55=1
end
if psbalertanks==nil then
psbalertanks={}
end
local bil=0
if #psbalertanks>0 then
	for i=1,#psbalertanks do
		if psbalertanks[i]==name2 then
			bil=1
		end
	end
end
if bil==0 then
	table.insert(psbalertanks,name2)
end
end

--клинки макс 3 смерти -- ПЕРЕДЕЛАНО В любая смерть танка! + мили удары учесть
if arg2=="SPELL_DAMAGE" and arg13 and arg13>0 then
local bil=0
if spellid==99353 then
	bil=1
end
if bil==0 then
	local id=psGetUnitID(guid1)
	if id==53494 then
		local tank=0
		if psbalertanks and #psbalertanks>0 then
			for g=1,#psbalertanks do
				if psbalertanks[g]==name2 then
					bil=1
				end
			end
		end
	end
end

if bil==1 then

	if pswasonboss55==nil then
		pswasonboss55=1
	end
	if psbalmax3==nil then
		psbalmax3=0
	end
	if psbalmax3<=3 then
		psbalmax3=psbalmax3+1
		local a1=GetSpellInfo(99262)
		local a2=GetSpellInfo(99263)
		pscaststartinfo(0,"|cffff0000"..name1.." -> "..psaddcolortxt(1,name2)..name2..psaddcolortxt(2,name2).." ["..spellname.."] > "..arg12.."(O: "..arg13..")|r", -1, "id1", 97, a1.." & "..a2.." - "..psinfo,psbossnames[1][5][5],2)
	end
end
end



if arg2=="SWING_DAMAGE" and spellname and spellname>0 then
local bil=0
if bil==0 then
	local id=psGetUnitID(guid1)
	if id==53494 then
		local tank=0
		if psbalertanks and #psbalertanks>0 then
			for g=1,#psbalertanks do
				if psbalertanks[g]==name2 then
					bil=1
				end
			end
		end
	end
end

if bil==1 then

	if pswasonboss55==nil then
		pswasonboss55=1
	end
	if psbalmax3==nil then
		psbalmax3=0
	end
	if psbalmax3<=3 then
		psbalmax3=psbalmax3+1
		local a1=GetSpellInfo(99262)
		local a2=GetSpellInfo(99263)
		pscaststartinfo(0,"|cffff0000"..name1.." -> "..psaddcolortxt(1,name2)..name2..psaddcolortxt(2,name2).." [MELEE] > "..spellid.." (O: "..spellname..")|r", -1, "id1", 97, a1.." & "..a2.." - "..psinfo,psbossnames[1][5][5],2)
	end
end
end

--sayannouncer
if arg2=="SPELL_AURA_APPLIED" and spellid==99516 then
if ps_saoptions[1][5][5][1]==1 then
ps_sa_sendinfo(name2, spellname.." "..psmain_sa_phrase1, 5, nil, nil)
end
end


end