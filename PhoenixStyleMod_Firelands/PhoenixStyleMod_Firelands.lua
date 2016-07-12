function psfirelload()

psfirellocalem()

if GetLocale()=="deDE" or GetLocale()=="ruRU" or GetLocale()=="zhTW" or GetLocale()=="zhCN" or GetLocale()=="frFR" or GetLocale()=="koKR" or GetLocale()=="esES" or GetLocale()=="esMX" or GetLocale()=="ptBR" then
psfirellocale()
end

--description of the menu
psraidoptionstxtt2={}
psraidoptionstxtt2[1]={
{"|tip2 "..psfireldamagefrom.." |sid99076|id", psfiretxtopt512, "|tip2 "..psfireldamagefrom.." |sid99052|id", "|tip2 "..psfireldamagefrom.." |sid99278|id (|cffff0000"..psiccheroic.."|r)", psfiretxtopt515, psfiretxtopt516,psfiretxtopt517,psfiretxtopt518},
{"|tip2 "..psfireldamagefrom.." |sid97234|id", psfiretxtopt522},
{"|tip2 "..psfireldamagefrom.." |sid98463|id", "|tip2 "..psfireldamagefrom.." |sid99844|id",psfiretxtopt533, "|tip2 "..psfireldamagefrom.." |sid99794|id", "|tip2 "..psfireldamagefrom.." |sid99816|id", "|tip2 "..psfireldamagefrom.." |sid99336|id", "|tip2 "..psfireldamagefrom.." |sid98885|id", "|tip2 "..psfireldamagefrom.." |sid99427|id", "|tip1 "..psfirelwhogot.." |sid99558|id (|cffff0000"..psiccheroic.."|r)", "|tip2 "..psfirelwhogot.." |sid99558|id ("..psfireltotal..", |cffff0000"..psiccheroic.."|r)", "|tip1 "..psfirelwhogot.." |sid99605|id (|cffff0000"..psiccheroic.."|r)", "|tip2 "..psfirelwhogot.." |sid99605|id ("..psfireltotal..", |cffff0000"..psiccheroic.."|r)","|tip2 "..psfireldamagefrom.." |sid100640|id"},
{"|tip1 "..psfirelwhogot.. " |sid99837|id", "|tip2 "..psfirelwhogot.. " |sid99837|id ("..psfireltotal..")", "|tip2 "..psfirelwhogot.. " |sid99838|id ("..psfireltotal..")", psfiretxtopt544, "|tip2 "..psfireldamagefrom.." |sid100495|id ("..psfireshanaddopt1..")", "|tip2 "..psfireldamagefrom.." |sid100003|id ("..psfireshanaddopt2..")", "|tip2 "..psfireldamagefrom.." |sid99052|id ("..psfireshanaddopt3..")"},
{psfiretxtopt551.." |cffff0000DOES NOT WORK|r",psfiretxtopt552,psfiretxtopt553},
{psfiretxtopt561,psfiretxtopt562,psfiretxtopt563,psfiretxtopt564,psfiretxtopt565,"|tip2 "..psfireldamagefrom.." |sid98535|id ("..psfirenofistsec2..")"},
{psfiretxtopt572,psfiretxtopt571,"NOT READY - "..psfiretxtopt573,psfiretxtopt574, "|tip1 "..psfireldamagefrom.." |sid98928|id", "|tip2 "..psfireldamagefrom.." |sid98928|id", "|tip1 "..psfireldamagefrom.." |sid98708|id", "|tip2 "..psfireldamagefrom.." |sid98708|id", "|tip2 "..psfireldamagefrom.." |sid100455|id", "|tip2 "..psfireldamagefrom.." |sid99224|id", "|tip2 "..psfireldamagefrom.." |sid99287|id",psfiretxtopt5712,psfiretxtopt5713}
}


for i=1,#psraidoptionstxtt2 do
	for j=1,#psraidoptionstxtt2[i] do
		for k=1,#psraidoptionstxtt2[i][j] do
			psraidoptionstxtt2[i][j][k]=psspellfilter(psraidoptionstxtt2[i][j][k])
		end
	end
end

--chat settings 1 or 2 or 3
psraidoptionschatdeft2={}
psraidoptionschatdeft2[1]={{1,1,1,1,1,1,1,1},{1,1},{1,1,1,1,1,1,1,1,1,1,2,1,1},{1,1,1,1,1,1,1},{1,1,1},{1,1,1,1,1,1},{1,1,1,1,1,1,1,1,1,1,1,2,1}}


--chat settings on or off
psraidoptionsondeft2={}
psraidoptionsondeft2[1]={{1,1,1,1,1,1,1,1},{1,1},{1,1,1,1,1,1,1,1,1,1,1,1,1},{1,1,1,1,1,1,1},{1,1,1},{1,1,1,1,1,1},{1,1,1,1,1,1,1,1,1,1,1,1,1}}



--глючит АПИ, таблицы боссов прописываю тут:
		psbalerok1={} --кто вешает дебафф
		psbalerok2={} --НА кого вешают, по этому проверяю 5 сек на не спам
		psbalerok3={} --время
		psbalerok4={} --с кого падает тормент (в течении сек знач он получит от кристалла бафф
		psbalerok5={} --время



		psragnatrap1={} --ид трапы
		psragnatrap2={} --время появления
		psragnatrap3={} --х координата
		psragnatrap4={} --у координата
		psragnatrap5={} --на кого кинулась изначально


		--мажордомо кто не разделил урон
		psmajordomoseed1={} --ник
		psmajordomoseed2={} --время

--

SetMapToCurrentZone()
if GetCurrentMapAreaID()==pslocations[1][5] then
	PhoenixStyleMod_firel:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
end
	PhoenixStyleMod_firel:RegisterEvent("PLAYER_REGEN_DISABLED")
	PhoenixStyleMod_firel:RegisterEvent("PLAYER_REGEN_ENABLED")
	PhoenixStyleMod_firel:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	PhoenixStyleMod_firel:RegisterEvent("ADDON_LOADED")
end



--онапдейт
function psfirelonupdate(curtime)


--reset not in combat 5 sec

if psrezetnotcomb and curtime>psrezetnotcomb then
	local a=GetSpellInfo(20711)
	local b=UnitBuff("player", a)
	if UnitAffectingCombat("player")==false and UnitIsDeadOrGhost("player")==false and b==nil and UnitName("boss1") then
		psiccwipereport_2(nil,"try")
	end
end



--ragna, his hand, who took damage.
if psragnahishandtimer and curtime>psragnahishandtimer then
psragnahishandtimer=nil
if #psragnahishand1>psragnamaxdam then
	local tabl={}
	local all=""
	for i=1,#psragnahishand1 do
		all=all..psragnahishand1[i]
		if #psragnahishand1==i then
		else
			all=all..", "
		end
		if psragnahishand1[i] and i~=#psragnahishand1 then
			local m=i+1
			for j=m,#psragnahishand1 do
				local dist=math.sqrt(math.pow((psragnahishand2[i]-psragnahishand2[j]),2)+math.pow((psragnahishand3[i]-psragnahishand3[j]),2))
				local yard=dist/0.0006957112131547
				if yard<=6 then
					local bil=0
					local bil2=0
					if #tabl>0 then
						for k=1,#tabl do
							if tabl[k]==psragnahishand1[i] then
								bil=1
							end
						end
						
						for k=1,#tabl do
							if tabl[k]==psragnahishand1[j] then
								bil2=1
							end
						end
					end
					if bil==0 then
						table.insert(tabl,psragnahishand1[i])
					end
					if bil2==0 then
						table.insert(tabl,psragnahishand1[j])
					end
				end
			end
		end
	end
	local spellname=GetSpellInfo(98263)
	if #tabl==0 then
		pscaststartinfo(0,spellname..": "..(#psragnahishand1-psragnamaxdam).." "..psfireragnaknock1.." ("..all..")", -1, "id1", 12, spellname.." - "..psinfo,psbossnames[1][5][7],2)
	else
		local txt1="{rt8} "..spellname.." "..format(psfireragnaknock2,#psragnahishand1).." "..psragnamaxdam..". "..psfireragnaknock3..": " --чат
		local txt2=spellname.." "..format(psfireragnaknock2,#psragnahishand1).." "..psragnamaxdam..". "..psfireragnaknock3..": " --фрейм
		for q=1,#tabl do
			txt1=txt1..tabl[q]
			txt2=txt2..psaddcolortxt(1,tabl[q])..tabl[q]..psaddcolortxt(2,tabl[q])
			if q==#tabl then
				txt1=txt1.."."
				txt2=txt2.."."
			else
				txt1=txt1..", "
				txt2=txt2..", "
			end
		end

		pscaststartinfo(0,txt2, -1, "id1", 12, spellname.." - "..psinfo,psbossnames[1][5][7],2)
		if psraidoptionson[1][5][7][12]==1 then
			pszapuskanonsa(psraidchats3[psraidoptionschat[1][5][7][12]], txt1)
		end
	end


end

psragnahishand1=nil
psragnahishand2=nil
psragnahishand3=nil

end



--ragna trap rep
if psragntorep2 and #psragntorep2>0 then
	if psdelayfixcheck2==nil then
		psdelayfixcheck2=curtime+0.2
	end
	if curtime>psdelayfixcheck2 then
		psdelayfixcheck2=curtime+0.2

		for i=1,#psragntorep2 do
			if psragntorep2[i] and curtime>psragntorep2[i] then
				if psragntorep1[i] then
					if psraidoptionson[1][5][7][2]==1 and #psragntorep4[i]>0 then
						local spellname=GetSpellInfo(98175)
						local txt1="{rt8} "..spellname.." "
						if #psragntorep4[i]>1 then
							txt1=txt1..format(psfirekilledplayers,#psragntorep4[i]).." "
						else
							txt1=txt1..psfirekilledplayer.." "
						end
						txt1=txt1..psragntorep3[i]
						pszapuskanonsa(psraidchats3[psraidoptionschat[1][5][7][2]], txt1)
					end
					local spellname=GetSpellInfo(98175)
					local txt1=spellname.." %s. " --мб это выделить красным если 4 таблица и сектор больше 0?
					if #psragntorep4[i]>1 then
						txt1=txt1..format(psfirekilledplayers,#psragntorep4[i]).." "
					elseif #psragntorep4[i]==1 then
						txt1=txt1..psfirekilledplayer.." "
					end
					txt1=txt1..psragntorep5[i]
					if #psragntorep4[i]>0 then
						txt1=txt1.."|cffff0000"..psfiredeadrag..":|r "
						for j=1,#psragntorep4[i] do
							txt1=txt1..psaddcolortxt(1,psragntorep4[i][j])..psragntorep4[i][j]..psaddcolortxt(2,psragntorep4[i][j])
							if j==#psragntorep4[i] then
								txt1=txt1.."."
							else
								txt1=txt1..", "
							end
						end
					end
					pscaststartinfo(0,txt1, -1, "id1", 52, spellname.." - "..psinfo,psbossnames[1][5][7],2)
					table.remove(psragntorep1,i)
					table.remove(psragntorep2,i)
					table.remove(psragntorep3,i)
					table.remove(psragntorep4,i)
					table.remove(psragntorep5,i)
				end
			end
		end
	end
end





--bethilac, fixate, conus aoe
if psbethddd2 and #psbethddd2>0 then
	if psdelayfixcheck==nil then
		psdelayfixcheck=curtime+0.2
	end
	if curtime>psdelayfixcheck then
		psdelayfixcheck=curtime+0.2
		local delet=0

		for i=1,#psbethddd2 do
			if psbethddd2[i] and curtime>psbethddd2[i] and delet==0 then
				delet=1
				if psbethddd3[i]==1 then
					local spellname=GetSpellInfo(99463)
					local txt1="{rt8} |s4id99463|id. " --для чата
					local txt2=spellname..". "

					txt1=txt1..format(psbethddd5[i],psbethddd6[i]).." "..psfirediddamageto.." ("..#psbethddd4[i].."): "
					txt2=txt2..format(psbethddd5[i],psaddcolortxt(1,psbethddd6[i])..psbethddd6[i]..psaddcolortxt(2,psbethddd6[i])).." "..psfirediddamageto.." ("..#psbethddd4[i].."): "

					for j=1,#psbethddd4[i] do
						if psbethddd4[i][j] then
							if j==#psbethddd4[i] then
								txt1=txt1..psbethddd4[i][j].."."
								txt2=txt2..psaddcolortxt(1,psbethddd4[i][j])..psbethddd4[i][j]..psaddcolortxt(2,psbethddd4[i][j]).."."
							else
								txt1=txt1..psbethddd4[i][j]..", "
								txt2=txt2..psaddcolortxt(1,psbethddd4[i][j])..psbethddd4[i][j]..psaddcolortxt(2,psbethddd4[i][j])..", "
							end
						end
					end
					if GetCurrentMapAreaID()==pslocations[1][5] then 
						pscaststartinfo(0,txt2, -1, "id1", 44, spellname.." - "..psinfo,psbossnames[1][5][1],2)
						if psraidoptionson[1][5][1][5]==1 and string.find(psiccinst,psiccheroic) then
							pszapuskanonsa(psraidchats3[psraidoptionschat[1][5][1][5]], txt1)
						end
					end
				end
			end
		end
		if delet>0 then
			table.remove(psbethddd1,delet)
			table.remove(psbethddd2,delet)
			table.remove(psbethddd3,delet)
			table.remove(psbethddd4,delet)
			table.remove(psbethddd5,delet)
			table.remove(psbethddd6,delet)
		end
	end
end



--bethilac, babah little spiders
if psbetbabeh2 and #psbetbabeh2>0 then
	if psdelayfixcheck2==nil then
		psdelayfixcheck2=curtime+0.2
	end
	if curtime>psdelayfixcheck2 then
		psdelayfixcheck2=curtime+0.2
		local delet=0
		for i=1,#psbetbabeh2 do
			if psbetbabeh2[i] and curtime>psbetbabeh2[i] and delet==0 then
				delet=1
				if #psbetbabeh3[i]>1 then
					local spellname=GetSpellInfo(99990)
					local txt1="{rt8} |s4id99990|id "..psfiredamshared..": " --для чата
					local txt2=spellname.." "..psfiredamshared..": "

					for j=1,#psbetbabeh3[i] do
						if psbetbabeh3[i][j] then
							if j==#psbetbabeh3[i] then
								txt1=txt1..psbetbabeh3[i][j].."."
								txt2=txt2..psaddcolortxt(1,psbetbabeh3[i][j])..psbetbabeh3[i][j]..psaddcolortxt(2,psbetbabeh3[i][j]).."."
							else
								txt1=txt1..psbetbabeh3[i][j]..", "
								txt2=txt2..psaddcolortxt(1,psbetbabeh3[i][j])..psbetbabeh3[i][j]..psaddcolortxt(2,psbetbabeh3[i][j])..", "
							end
						end
					end
					if GetCurrentMapAreaID()==pslocations[1][5] then 
						pscaststartinfo(0,txt2, -1, "id1", 66, spellname.." - "..psinfo,psbossnames[1][5][1],2)
						if psraidoptionson[1][5][1][6]==1 and string.find(psiccinst,psiccheroic) and pswasonboss51 and pswasonboss51==1 then
							pszapuskanonsa(psraidchats3[psraidoptionschat[1][5][1][6]], txt1)
						end
					end
				end
			end
		end
		if delet>0 then
			table.remove(psbetbabeh1,delet)
			table.remove(psbetbabeh2,delet)
			table.remove(psbetbabeh3,delet)
		end
	end
end


--получение цели мажордомо
if psmajotarget and curtime>psmajotarget then
psmajotarget=nil
			local targetfound="0"
			for ttg=1,GetNumGroupMembers() do
				if UnitGUID("raid"..ttg.."-target") and targetfound=="0" then
					local id=psGetUnitID(UnitGUID("raid"..ttg.."-target"))
					if id==52571 then
						if UnitName("raid"..ttg.."-target-target") and UnitInRaid(UnitName("raid"..ttg.."-target-target")) then
							targetfound=UnitName("raid"..ttg.."-target-target")
							psmajotargetna1=UnitName("raid"..ttg.."-target-target")
							psmajotargetna2=GetTime()+2
						end
					end
				end
			end
end

--получение цели трапы, рагнарос
if pschecktar and curtime>pschecktar then
	pschecktar=pschecktar+0.25
			local targetfound="0"
			for ttg=1,GetNumGroupMembers() do
				if UnitGUID("raid"..ttg.."-target") and targetfound=="0" then
					local id=psGetUnitID(UnitGUID("raid"..ttg.."-target"))
					if id==52409 then
						if UnitName("raid"..ttg.."-target-target") and UnitInRaid(UnitName("raid"..ttg.."-target-target")) then
							targetfound=UnitName("raid"..ttg.."-target-target")
							pschecktar=nil
							psragnatarget=UnitName("raid"..ttg.."-target-target")
							local x,y=GetPlayerMapPosition(UnitName("raid"..ttg.."-target-target"))
							psposx=x
							psposy=y
						else
							pschecktar=nil
						end
					end
				end
			end
end

--10 сек нет трапы = резет
if psragnawait10 and curtime>psragnawait10 then
psragnawait10=nil
pschecktar=nil
psragnatarget=nil
psposx=nil
psposy=nil
end


--majordomo no damage from cleave
if psmajordomowait and curtime>psmajordomowait then--and GetCurrentMapAreaID()==pslocations[1][5]
psmajordomowait=nil
local spellname=GetSpellInfo(98474)

--получили взрыв посл 7 сек
if #psmajordomonodamage>0 then
	local i=1
	while i<=#psmajordomonodamage do
		local bil=0
		if psmajordomonodamage[i] then
			for j=1,#psmajordomoseed1 do
				if bil==0 and psmajordomoseed2[j]+7>GetTime() then
					if psmajordomoseed1[j]==psmajordomonodamage[i] then
						bil=1
					end
				end
			end
		end
		if bil==1 then
			table.remove(psmajordomonodamage,i)
			i=i-1
		end
		i=i+1
	end
end



if #psmajordomonodamage==0 then
	pscaststartinfo(0,spellname..": %s. "..psfiremajodamag1, -1, "id1", 44, spellname.." - "..psinfo,psbossnames[1][5][6],2)
else
	if #psmajordomonodamage<=#psmajordomogotdamage then
		local txt=""
		local txt2=""
		for j=1,#psmajordomonodamage do
			if string.len(txt)>2 then
				txt=txt..", "
				txt2=txt2..", "
			end
			txt=txt..psaddcolortxt(1,psmajordomonodamage[j])..psmajordomonodamage[j]..psaddcolortxt(2,psmajordomonodamage[j])
			txt2=txt2..psmajordomonodamage[j]
			addtotwotables2(psmajordomonodamage[j])
			vezaxsort2()
		end
		pscaststartinfo(0,spellname..": %s, "..psfiremajodamag3.." ("..#psmajordomonodamage.."): "..txt, -1, "id1", 44, spellname.." - "..psinfo,psbossnames[1][5][6],2)
		--if psraidoptionson[1][5][6][3]==1 and (psmajonorepwipe==nil or (psmajonorepwipe and GetTime()>psmajonorepwipe+5)) and psmajosomeonedie and curtime<psmajosomeonedie+2 then
		if psraidoptionson[1][5][6][3]==1 and (psmajonorepwipe==nil or (psmajonorepwipe and GetTime()>psmajonorepwipe+5)) then
			pszapuskanonsa(psraidchats3[psraidoptionschat[1][5][6][3]], "{rt8} "..psfiremajodamag2.." ("..#psmajordomonodamage.."): "..txt2)
		end
	else


	if #psmajordomogotdamage>1 then
		local txt=""
		local txt2=""
		for j=1,#psmajordomogotdamage do
			if string.len(txt)>2 then
				txt=txt..", "
				txt2=txt2..", "
			end
			txt=txt..psaddcolortxt(1,psmajordomogotdamage[j])..psmajordomogotdamage[j]..psaddcolortxt(2,psmajordomogotdamage[j])
			txt2=txt2..psmajordomogotdamage[j]
		end
		pscaststartinfo(0,spellname..": %s, "..psfiremajogotdmg3.." ("..#psmajordomogotdamage.."): "..txt, -1, "id1", 44, spellname.." - "..psinfo,psbossnames[1][5][6],2)
		if psraidoptionson[1][5][6][3]==1 and (psmajonorepwipe==nil or (psmajonorepwipe and GetTime()>psmajonorepwipe+5)) then
			pszapuskanonsa(psraidchats3[psraidoptionschat[1][5][6][3]], "{rt8} "..psfiremajogotdmg1.." ("..#psmajordomogotdamage.."): "..txt2)
		end
	elseif #psmajordomogotdamage==1 then
		pscaststartinfo(0,spellname..": %s. "..psfiremajogotdmg2..": "..psaddcolortxt(1,psmajordomogotdamage[1])..psmajordomogotdamage[1]..psaddcolortxt(2,psmajordomogotdamage[1]), -1, "id1", 44, spellname.." - "..psinfo,psbossnames[1][5][6],2)
	else
		pscaststartinfo(0,spellname..": %s. NO damage", -1, "id1", 44, spellname.." - "..psinfo,psbossnames[1][5][6],2)
	end




	end
end



end


--majordomo
if psmajordomorep and curtime>psmajordomorep then
psmajordomorep=nil
local maxrep5=0
for i=1,#psmajordom1 do
	if psmajordom1[i] then
		local txt=""
		local txt2=""
		for j=1,#psmajordom2[i] do
			if string.len(txt)>2 then
				txt=txt..", "
				txt2=txt2..", "
			end
			txt=txt..psaddcolortxt(1,psmajordom2[i][j])..psmajordom2[i][j]..psaddcolortxt(2,psmajordom2[i][j])
			txt2=txt2..psmajordom2[i][j]
		end
		local spellname=GetSpellInfo(98620)

		--умер или просто взорвал?
		local trup=""
		if psmajordead1 and #psmajordead1>0 then
			for g=1,#psmajordead1 do
				if psmajordead1[g]==psmajordom1[i] then
					if curtime<=psmajordead2[g]+4 then
						--человек умер, НО мы проверим таблицы кто взрывал сам себя, если он там есть значит это не смерть
						local nnnm=0
						if majonodeath1 and #majonodeath1>0 then
							for n=1,#majonodeath1 do
								if majonodeath1[n]==psmajordom1[i] then
									nnnm=1
									if curtime<=majonodeath2[n]+3 then
									else
										trup=" ("..psdied..")"
									end
								end
							end
						end
						if nnnm==0 then
							trup=" ("..psdied..")"
						end
					end
				end
			end
		end
		pscaststartinfo(0,psaddcolortxt(1,psmajordom1[i])..psmajordom1[i]..psaddcolortxt(2,psmajordom1[i])..trup.." "..psfirebabah..": "..txt, -1, "id1", 24, spellname.." - "..psinfo,psbossnames[1][5][6],2)
		if psraidoptionson[1][5][6][1]==1 then
			maxrep5=maxrep5+1
			if maxrep5<8 then
				pszapuskanonsa(psraidchats3[psraidoptionschat[1][5][6][1]], "{rt8} "..psmajordom1[i]..trup.." "..psfirebabah..": "..txt2)
			end
		end
	end
end
end



--shannox face rage
if psshani8 and curtime>psshani8 and psshani2 then
local shan8=psshani8-1
psshani8=nil
	local spellname=GetSpellInfo(99947)

	local txt=spellname.." %s: "..psaddcolortxt(1,psshani2)..psshani2..psaddcolortxt(2,psshani2)
	if psshani7 and psshani7>0 then
		local time=(math.ceil((shan8-psshani1)*10))/10
		txt=txt.." - |cffff0000"..psdied.." ("..time.." "..pssec..")|r"
	end
	txt=txt..". "
	if psshani3 then
		txt=txt..psfireintershanox..": "..psaddcolortxt(1,psshani3)..psshani3..psaddcolortxt(2,psshani3).." ("..psshani6.." - "..psshani4..", "..psshani5.." "..pssec..")."
		pscheckwipe1()
		if pswipetrue and pswasonboss54~=2 then
			psiccwipereport_2("wipe", "try")
		end
		addtotwotables3(psshani3)
		vezaxsort3()
	end
	pscaststartinfo(0,txt, -1, "id1", 10, spellname.." - "..psinfo,psbossnames[1][5][4],2)
psshani1=nil
psshani2=nil
psshani3=nil
psshani4=nil
psshani5=nil
psshani6=nil
psshani7=nil
psshani8=nil
end



--baleroc
if psbalerokcount2 and curtime>psbalerokcount2 then
psbalerokcount2=nil
local a1=psbalerokcount11
local a2=psbalerokcount12 or "unknown"
pscaststartinfo(0,psbalercount.." %s: "..psaddcolortxt(1,a1)..a1..psaddcolortxt(2,a1)..", "..psaddcolortxt(1,a2)..a2..psaddcolortxt(2,a2), -1, "id1", 10, psbalercount.." - "..psinfo,psbossnames[1][5][5],2)
psbalerokcount11=nil
psbalerokcount12=nil
end

if psbalerokcount4 and curtime>psbalerokcount4 then
psbalerokcount4=nil
local a1=psbalerokcount31
local a2=psbalerokcount32 or "unknown"
pscaststartinfo(0,psbalercount.." FAIL: "..psaddcolortxt(1,a1)..a1..psaddcolortxt(2,a1)..", "..psaddcolortxt(1,a2)..a2..psaddcolortxt(2,a2), 0, "id1", 10, psbalercount.." - "..psinfo,psbossnames[1][5][5],2)
psbalerokcount31=nil
psbalerokcount32=nil
	pscheckwipe1()
	if pswipetrue and pswasonboss55~=2 then
		psiccwipereport_2("wipe", "try")
	end
		if pswasonboss55 and pswasonboss55~=2 then
if psraidoptionson[1][5][5][3]==1 then
	pszapuskanonsa(psraidchats3[psraidoptionschat[1][5][5][3]], "{rt8} |s4id99516|id FAIL: "..a1..", "..a2..".")
end
		end
end


--after baleroc stuck fix
if psbalerocforserest and curtime>psbalerocforserest then
psiccwipereport_2(nil,"try")
psbalerocforserest=nil
end




--evade after 3 sec
if pscmrcheckforevade2 and curtime>pscmrcheckforevade2 then
pscmrcheckforevade2=pscmrcheckforevade2+7
local id=0
if UnitGUID("boss1") then
	id=psGetUnitID(UnitGUID("boss1"))
end
local bil=0
if #psbossbugs>0 then
	for i=1,#psbossbugs do
		if psbossbugs[i]==id then
			bil=1
		end
	end
end
if (UnitName("boss1")==nil and UnitName("boss2")==nil and UnitName("boss3")==nil) or bil==1 or (UnitName("boss1") and UnitName("boss1")=="") then
psiccwipereport_2(nil,"try")
end
end


if pscatamrdelayzone_2 and curtime>pscatamrdelayzone_2 then
pscatamrdelayzone_2=nil
local a1, a2, a3, a4, a5 = GetInstanceInfo()
if UnitInRaid("player") or (a2=="raid" or (a2=="party" and a3==2)) then
SetMapToCurrentZone()
end
if GetCurrentMapAreaID()==pslocations[1][5] then
PhoenixStyleMod_firel:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
else
PhoenixStyleMod_firel:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
end
end

--announce delay for phasing
if psiccrepupdate_2 and curtime>psiccrepupdate_2 then
psiccrepupdate_2=nil
psiccwipereport_2(psdelcount1,psdelcount2,psdelcount3)
psdelcount1=nil
psdelcount2=nil
psdelcount3=nil
end

--прерванные бои
if pscheckbossincombatmcr_2 and GetTime()>pscheckbossincombatmcr_2 then
	pscheckbossincombatmcr_2=pscheckbossincombatmcr_2+2


local id=0
if UnitGUID("boss1") then
	id=psGetUnitID(UnitGUID("boss1"))
end
local bil=0
if #psbossbugs>0 then
	for i=1,#psbossbugs do
		if psbossbugs[i]==id then
			bil=1
		end
	end
end

	if UnitGUID("boss1") and bil==0 and UnitName("boss1")~="" then
	else
		pscheckbossincombatmcr_2=nil
		pscheckbossincombatmcr_22=GetTime()+1
	end
end

if pscheckbossincombatmcr_22 and GetTime()>pscheckbossincombatmcr_22 then
	pscheckbossincombatmcr_22=nil
	if psbossblock==nil then
		psiccwipereport_2(nil, nil, "reset")
	end
end

if pscatadelaycheckboss_2 and curtime>pscatadelaycheckboss_2 then
pscatadelaycheckboss_2=nil


	if UnitGUID("boss1") then
		local id2=UnitGUID("boss1")
		local id=psGetUnitID(id2)
local bil=0
if #psbossbugs>0 then
	for i=1,#psbossbugs do
		if psbossbugs[i]==id then
			bil=1
		end
	end
end
		if bil==0 and UnitName("boss1")~="" then
			pscmroncombatstartcheckboss_2(id)
		else
			pscmrdelayofbosccheck_2=GetTime()+1
		end
	else
		pscmrdelayofbosccheck_2=GetTime()+1
	end
end


--постоянная проверка по ходу боя...
if pscmrdelayofbosccheck_2 and curtime>pscmrdelayofbosccheck_2 then
pscmrdelayofbosccheck_2=curtime+1


	if UnitGUID("boss1") then
		local id2=UnitGUID("boss1")
		local id=psGetUnitID(id2)
local bil=0
if #psbossbugs>0 then
	for i=1,#psbossbugs do
		if psbossbugs[i]==id then
			bil=1
		end
	end
end
		if bil==0 and UnitName("boss1")~="" then
			pscmroncombatstartcheckboss_2(id)
			pscmrdelayofbosccheck_2=nil
		end
	end
end






end

function pscmroncombatstartcheckboss_2(id)


SetMapToCurrentZone()
if GetCurrentMapAreaID()==pslocations[1][5] then
pscmrcheckforevade2=GetTime()+10
end


	--ыыытест новые боссы прописывать тут (2 места)



if GetCurrentMapAreaID()==pslocations[1][5] then


		--psragnaadd1={} --ид адда
		--psragnaadd2={} --время когда адд появился
		--psragnaadd3={} --текущее ХП адда
		--psragnaadd4={} --ники кто бил адда // доп табл
		--psragnaadd5={} --цифры урона //доп табл
		--psragnaadd6={} --кто станил //доп табл
		--psragnaadd7={} --на какой сек станил //доп табл



	if id==52498 and psbossfile51 then
		pswasonboss51=1
	end
	if (id==52558 or id==52577 or id==53087) and psbossfile52 then
		pswasonboss52=1
	end
	if id==52530 and psbossfile53 then
		pswasonboss53=1
	end
	if id==53691 and psbossfile54 then
		pswasonboss54=1
	end
	if id==53494 and psbossfile55 then
		--pswasonboss55=1
	end
	if id==52571 and psbossfile56 then
		pswasonboss56=1
	end
	if id==52409 and psbossfile57 then
		pswasonboss57=1



		--до 50% общий урон, адд 1 (спавн 1)
	end
end


end


function psfirelonevent(self,event,...)


if event == "COMBAT_LOG_EVENT_UNFILTERED" then


--Inst 5
if GetCurrentMapAreaID()==pslocations[1][5] then

local arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15 = ...

if pswasonboss51 then
pscombatlogboss51(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)
elseif pswasonboss52 then
pscombatlogboss52(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)
elseif pswasonboss53 then
pscombatlogboss53(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)
elseif pswasonboss54 then
pscombatlogboss54(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)
elseif pswasonboss55 then
pscombatlogboss55(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)
elseif pswasonboss56 then
pscombatlogboss56(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)
elseif pswasonboss57 then
pscombatlogboss57(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)

else --cause Blizz fails with API we use more CPU:

pscombatlogboss51(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)
pscombatlogboss52(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)
pscombatlogboss53(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)
pscombatlogboss54(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)
pscombatlogboss55(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)
pscombatlogboss56(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)
pscombatlogboss57(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)
end


--res to reset info
if arg2=="SPELL_RESURRECT" and (spellid==83968 or spellid==7328 or spellid==50769 or spellid==2008 or spellid==2006) then
psiccwipereport_2(nil,"try")
end





end






else

--остальные евенты

local arg1, arg2, arg3,arg4,arg5,arg6 = ...

if event == "PLAYER_REGEN_DISABLED" then


if (psbilresnut and GetTime()<psbilresnut+3) or pscheckbossincombat then


else


if UnitGUID("boss1") then
local id2=UnitGUID("boss1")
local id=psGetUnitID(id2)
local bil=0
if #psbossbugs>0 then
	for i=1,#psbossbugs do
		if psbossbugs[i]==id then
			bil=1
		end
	end
end
if bil==0 and UnitName("boss1")~="" then
pscmroncombatstartcheckboss_2(id)
else
pscatadelaycheckboss_2=GetTime()+2
end

else
pscatadelaycheckboss_2=GetTime()+2
end


end
end


if event=="PLAYER_REGEN_ENABLED" then
	if UnitAffectingCombat("player")==false and UnitIsDeadOrGhost("player")==false and UnitName("boss1") then
		psrezetnotcomb=GetTime()+5
	end
end




if event == "ZONE_CHANGED_NEW_AREA" then


psiccwipereport_2(nil,"try")
pscatamrdelayzone_2=GetTime()+3

pspaukincombat=nil

end






if event == "ADDON_LOADED" then

if arg1=="PhoenixStyleMod_Firelands" then

--ыытест
--УБрать переменную что сейвит день!!!
--psgiveuslogs
--local _, month, day, year = CalendarGetDate()

reportinsec7=GetTime()+7


if psicctekver_2==nil then psicctekver_2=0 end


local psiccnewveranoncet={"NEW module: |cff00ff00Autoinvite|r, take a look and give your feedback on http://phoenixstyle.com please!","If you wanna |cff00ff00help me|r to promote my new site click here and learn how (it will only take a click) |cff00ff00http://phoenixstyle.com/help|r Thanks!","|cff00ff00Baleroc:|r many info was added in 'in combat module': Vital Spark info, tank death, who pass tormented, how much stack had etc. No report in chat for the moment."}
if GetLocale()=="ruRU" then
psiccnewveranoncet={"Новый модуль: |cff00ff00Автоинвайт|r, много интересных опций для Рейд Лидеров, пишите ваши предложения и замечания на сайте http://phoenixstyle.com !","Нужна небольшая |cff00ff00помощь|r с раскруткой нового сайта, если не сложно - детали по ссылке (потребуется всего минута) |cff00ff00http://phoenixstyle.com/help|r Спасибо!", "|cff00ff00Балерок:|r много новой инфо добавлено в модуль 'по ходу боя': активация целит. пламени у хилеров, кто передавал истязание, кто сколько стаков набрал, смерти танков и прочее. Инфо отображено только в аддоне (без чата)."}
end 


--NEW announce
	if 3-psicctekver_2>0 and psicctekver_2>0 then

local psvercoll=(3-psicctekver_2)

		if psvercoll>0 then
			--print ("|cff99ffffPhoenixStyle|r - "..pscolnewveranonce1)
		end

if psvercoll>3 then psvercoll=3 end

while psvercoll>0 do
		if psvercoll>0 then
--out ("|cff99ffffPhoenixStyle|r - "..psiccnewveranoncet[psvercoll])
		end
psvercoll=psvercoll-1
end
	end

psicctekver_2=3 --ТЕК ВЕРСИЯ!!! и так выше изменить цифру что отнимаем, всего 3 раза




pslastmoduleloadtxt=psfirellastmoduleloadtxt


--перенос переменных

pscmrpassvariables_2()


	if psraidoptionson[1][5]==nil then psraidoptionson[1][5]={}
	end
	for j=1,#psraidoptionsont2[1] do
		if psraidoptionson[1][5][j]==nil then
			psraidoptionson[1][5][j]={}
		end
		for t=1,#psraidoptionsont2[1][j] do
			if psraidoptionson[1][5][j][t]==nil then
				psraidoptionson[1][5][j][t]=psraidoptionsont2[1][j][t]
			end
		end
	end

	if psraidoptionstxt[5]==nil then psraidoptionstxt[5]={}
	end
	for j=1,#psraidoptionstxtt2[1] do
		if psraidoptionstxt[5][j]==nil then
			psraidoptionstxt[5][j]={}
		end
		for t=1,#psraidoptionstxtt2[1][j] do
			if psraidoptionstxt[5][j][t]==nil then
				psraidoptionstxt[5][j][t]=psraidoptionstxtt2[1][j][t]
			end
		end
	end

--ыытест

psraidoptionstxtt2=nil

	if psraidoptionschat[1][5]==nil then psraidoptionschat[1][5]={}
	end
	for j=1,#psraidoptionschatt2[1] do
		if psraidoptionschat[1][5][j]==nil then
			psraidoptionschat[1][5][j]={}
		end
		for t=1,#psraidoptionschatt2[1][j] do
			if psraidoptionschat[1][5][j][t]==nil then
				psraidoptionschat[1][5][j][t]=psraidoptionschatt2[1][j][t]
			end
		end
	end


--boss manual localization update
if psbossnames[1] then

end



end
end
--остальные евенты конец





end --рейд


end --КОНЕЦ ОНЕВЕНТ


--tryorkill - if try then true, if kill - nil, reset - only reset no report
--pswasonboss42 1 если мы в бою с боссом и трекерим, 2 если вайпнулись и продолжаем трекерить ПОСЛЕ анонса
function psiccwipereport_2(wipe, tryorkill, reset, checkforwipe)
local aa=""
if wipe then
aa=aa.."wipe:"..wipe.."."
end
if tryorkill then
aa=aa.."tryorkill:"..tryorkill.."."
end
if reset then
aa=aa.."reset:"..reset.."."
end
if checkforwipe then
aa=aa.."checkforwipe:"..checkforwipe.."."
end


	if pszapuskdelayphasing_2>0 then
	psiccrepupdate_2=pszapuskdelayphasing_2
	pszapuskdelayphasing_2=0
	if psiccrepupdate_2>7 then psiccrepupdate_2=7 end
	psiccrepupdate_2=psiccrepupdate_2+GetTime()
	psdelcount1=wipe
	psdelcount2=tryorkill
	psdelcount3=reset
	else

		if psiccrepupdate_2==nil then

--ыыытест новые боссы прописывать тут (2 места)
pscmrcheckforevade2=nil


if (pswasonboss51) then
pscmrbossREPORT511(wipe, tryorkill, reset, checkforwipe)
pscmrbossRESET511(wipe, tryorkill, reset, checkforwipe)
end
if (pswasonboss52) then
pscmrbossREPORT521(wipe, tryorkill, reset, checkforwipe)
pscmrbossRESET521(wipe, tryorkill, reset, checkforwipe)
end
if (pswasonboss53) then
pscmrbossREPORT531(wipe, tryorkill, reset, checkforwipe)
pscmrbossRESET531(wipe, tryorkill, reset, checkforwipe)
end
if (pswasonboss54) then
pscmrbossREPORT541(wipe, tryorkill, reset, checkforwipe)
pscmrbossRESET541(wipe, tryorkill, reset, checkforwipe)
end
if (pswasonboss55) then
pscmrbossREPORT551(wipe, tryorkill, reset, checkforwipe)
pscmrbossRESET551(wipe, tryorkill, reset, checkforwipe)
end
if (pswasonboss56) then
pscmrbossREPORT561(wipe, tryorkill, reset, checkforwipe)
pscmrbossRESET561(wipe, tryorkill, reset, checkforwipe)
end
if (pswasonboss57) then
pscmrbossREPORT571(wipe, tryorkill, reset, checkforwipe)
pscmrbossRESET571(wipe, tryorkill, reset, checkforwipe)
end

		end

	end

if wipe==nil and psbossblock==nil then
psbossblock=GetTime()
end

end


function pscmrpassvariables_2()

if psraidoptionschatt2==nil then psraidoptionschatt2={} end

for i=1,#psraidoptionschatdeft2 do
	if psraidoptionschatt2[i]==nil then
		psraidoptionschatt2[i]={}
	end
	for j=1,#psraidoptionschatdeft2[i] do
		if psraidoptionschatt2[i][j]==nil then
			psraidoptionschatt2[i][j]={}
		end
		for t=1,#psraidoptionschatdeft2[i][j] do
			if psraidoptionschatt2[i][j][t]==nil or (psraidoptionschatt2[i][j][t] and psraidoptionschatt2[i][j][t]==0) then
				psraidoptionschatt2[i][j][t]=psraidoptionschatdeft2[i][j][t]
			end
		end
	end
end

if psraidoptionsont2==nil then psraidoptionsont2={} end

for i=1,#psraidoptionsondeft2 do
	if psraidoptionsont2[i]==nil then
		psraidoptionsont2[i]={}
	end
	for j=1,#psraidoptionsondeft2[i] do
		if psraidoptionsont2[i][j]==nil then
			psraidoptionsont2[i][j]={}
		end
		for t=1,#psraidoptionsondeft2[i][j] do
			if psraidoptionsont2[i][j][t]==nil then
				psraidoptionsont2[i][j][t]=psraidoptionsondeft2[i][j][t]
			end
		end
	end
end

end