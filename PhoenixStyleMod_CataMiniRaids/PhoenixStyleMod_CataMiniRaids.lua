function pscatamrload()

pscrmlocalem()

if GetLocale()=="deDE" or GetLocale()=="ruRU" or GetLocale()=="zhTW" or GetLocale()=="zhCN" or GetLocale()=="frFR" or GetLocale()=="koKR" or GetLocale()=="esES" or GetLocale()=="esMX" then
pscrmlocale()
end

--description of the menu
psraidoptionstxtt1={}
psraidoptionstxtt1[1]={{pscmrtxtopt111},{pscmrtxtopt121}}
psraidoptionstxtt1[2]={{pscmrtxtopt211,pscmrtxtopt212,pscmrtxtopt213,pscmrtxtopt214,pscmrtxtopt215},
{pscmrtxtopt221,pscmrtxtopt222,pscmrtxtopt223,pscmrtxtopt224,pscmrtxtopt225,pscmrtxtopt226,pscmrtxtopt227,pscmrtxtopt228,pscmrtxtopt229,pscmrtxtopt2210,pscmrtxtopt2211,pscmrtxtopt2212,pscmrtxtopt2213,pscmrtxtopt2214,pscmrtxtopt2215,pscmrtxtoptincomb,pscmrtxtopt2217},
{pscmrtxtopt231,pscmrtxtoptincomb,pscmrtxtopt233,pscmrtxtopt234,pscmrtxtopt235},{pscmrtxtopt241,pscmrtxtopt242,pscmrtxtopt243,pscmrtxtopt244,pscmrtxtopt245},{"no info...",pscmrtxtopt252},{pscmrtxtopt261,pscmrtxtopt262,pscmrtxtoptincomb,pscmrtxtopt264,pscmrtxtopt265,pscmrtxtopt266}}
psraidoptionstxtt1[3]={{pscmrtxtopt311,pscmrtxtoptincomb},{pscmrtxtopt321,pscmrtxtopt322,pscmrtxtopt323,pscmrtxtopt324,pscmrtxtopt325,pscmrtxtopt326},{pscmrtxtopt331,pscmrtxtopt332,pscmrtxtopt333,pscmrtxtopt334,pscmrtxtopt335,pscmrtxtopt336,pscmrtxtoptincomb,pscmrtxtopt337,pscmrtxtopt338,pscmrtxtopt3310,pscmrtxtopt3311,pscmrtxtopt3312,pscmrtxtopt3313,pscmrtxtopt3314,pscmrtxtopt3315},{pscmrtxtopt341,pscmrtxtopt342,pscmrtxtoptincomb,pscmrtxtopt344,pscmrtxtopt345,pscmrtxtopt346,pscmrtxtopt347,pscmrtxtopt348},{pscmrtxtopt351,pscmrtxtopt352,pscmrtxtopt353,pscmrtxtopt354,pscmrtxtopt355,pscmrtxtopt356}}
psraidoptionstxtt1[4]={{pscmrtxtopt411,pscmrtxtopt412,pscmrtxtopt413,pscmrtxtopt414,pscmrtxtopt415,pscmrtxtopt416,pscmrtxtopt417,pscmrtxtopt418,pscmrtxtopt419,pscmrtxtopt4110},{pscmrtxtopt421,pscmrtxtopt422,pscmrtxtopt423,pscmrtxtopt424,pscmrtxtopt425,pscmrtxtopt426,pscmrtxtopt427,pscmrtxtopt428}}

for i=1,#psraidoptionstxtt1 do
	for j=1,#psraidoptionstxtt1[i] do
		for k=1,#psraidoptionstxtt1[i][j] do
			psraidoptionstxtt1[i][j][k]=psspellfilter(psraidoptionstxtt1[i][j][k])
		end
	end
end

--chat settings 1 or 2 or 3
psraidoptionschatdeft1={}
psraidoptionschatdeft1[1]={{1},{1}}
psraidoptionschatdeft1[2]={{1,1,1,1,1},{2,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0},{1,0,1,0,1},{1,1,1,1,1},{1,0},{1,1,0,1,1,1}}
psraidoptionschatdeft1[3]={{1,0},{1,2,1,1,1,0},{1,1,1,1,0,0,0,0,0,1,1,1,1,1,1},{1,1,0,1,1,1,1,1},{1,1,1,1,0,1}}
psraidoptionschatdeft1[4]={{1,1,1,1,1,1,0,1,0,1},{2,1,1,1,1,1,1,0}}


--chat settings on or off
psraidoptionsondeft1={}
psraidoptionsondeft1[1]={{1},{1}}
psraidoptionsondeft1[2]={{1,1,1,1,1},{0,1,0,1,0,0,1,1,1,1,1,0,0,0,1,1,0},{1,1,1,0,1},{1,1,1,1,1},{1,0},{1,1,1,1,1,1}}
psraidoptionsondeft1[3]={{1,1},{1,1,1,1,1,1},{1,1,1,1,1,1,1,1,1,1,1,0,0,1,1},{1,1,1,1,1,1,1,0},{1,1,1,1,0,1}}
psraidoptionsondeft1[4]={{1,0,0,0,0,0,1,0,1,0},{1,1,1,1,1,1,1,1}}



onyxidspellname=GetSpellInfo(77943)
psidhalspell=GetSpellInfo(83734)
pszvukimpuls=GetSpellInfo(77675)

SetMapToCurrentZone()
if GetCurrentMapAreaID()==754 or GetCurrentMapAreaID()==758 or GetCurrentMapAreaID()==773 or GetCurrentMapAreaID()==752 then
	PhoenixStyleMod_Catamr:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
end
	PhoenixStyleMod_Catamr:RegisterEvent("PLAYER_REGEN_DISABLED")
	PhoenixStyleMod_Catamr:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	PhoenixStyleMod_Catamr:RegisterEvent("ADDON_LOADED")
	PhoenixStyleMod_Catamr:RegisterEvent("CHAT_MSG_ADDON")
	PhoenixStyleMod_Catamr:RegisterEvent("UNIT_POWER")

end



--онапдейт
function pscatamronupdate(curtime)



if psnefariantabltime and curtime>psnefariantabltime+12 then
psnefariantabltime=nil
end

--omnitarget for SA
if ps_sa_omni1 and curtime>ps_sa_omni1 then
ps_sa_omni1=nil
ps_sa_sendinfo(ps_sa_omni2, ps_sa_omni3.." "..psmain_sa_phrase1, 5, nil, nil)
ps_sa_omni2=nil
ps_sa_omni3=nil
end


if pscmrnefdominion4 and #pscmrnefdominion4>0 then
	if pscmrdelaynef==nil or (pscmrdelaynef and curtime>pscmrdelaynef) then
		pscmrdelaynef=curtime+0.1
		local i=1
		while i<=#pscmrnefdominion4 do
			if pscmrnefdominion4[i]~=0 and curtime>pscmrnefdominion4[i] then
				nefdominionwork(i)
				i=1000
			end
			i=i+1
		end
	end
end



--chimaeron marks
--проверка на дебафф мало здоровья
if ps_chimaerontab3 and #ps_chimaerontab3>0 then
	if pschimadelay==nil then
		pschimadelay=curtime+0.3
	end
	if curtime>pschimadelay then
		pschimadelay=curtime+0.3
		for i=1,#ps_chimaerontab3 do
			if ps_chimaerontab3[i] then
				if curtime>ps_chimaerontab5[i]+3.6 then
					local a=GetSpellInfo(89084)
					if UnitDebuff(ps_chimaerontab3[i], a)==nil then
						if(IsRaidOfficer()==1) then
							SetRaidTarget(ps_chimaerontab3[i], 0)
						end
						table.remove(ps_chimaerontab3,i)
						table.remove(ps_chimaerontab4,i)
						table.remove(ps_chimaerontab5,i)
					end
				end
			end
		end
		if UnitName("boss1")==nil then
			if #ps_chimaerontab3>0 then
				for i=1,#ps_chimaerontab3 do
					SetRaidTarget(ps_chimaerontab3[i], 0)
				end
				table.wipe(ps_chimaerontab3)
				table.wipe(ps_chimaerontab4)
				table.wipe(ps_chimaerontab5)
			end

		end
	end
end

--chogal report
if pschogaldisp1 and curtime>pschogaldisp1 then
	pschogaldisp1=nil
	if #pschogaldisp2>0 then
		local txtreport=""
		for i=1,#pschogaldisp2 do
			txtreport=txtreport..pschogaldisp2[i]
			if i~=#pschogaldisp2 then
				txtreport=txtreport..", "
			end
		end
		if #pschogaldisp2>1 then
			txtreport=txtreport.." "..pscmrchogaldopmod23
		else
			if UnitSex(pschogaldisp2[1]) and UnitSex(pschogaldisp2[1])==3 then
				txtreport=txtreport.." "..pscmrchogaldopmod22
			else
				txtreport=txtreport.." "..pscmrchogaldopmod21
			end
		end
		txtreport=txtreport..": "
		for j=1,#vezaxname4 do
			txtreport=txtreport..vezaxname4[j]
			if vezaxcrash4[j] and vezaxcrash4[j]~=1 then
				txtreport=txtreport.." ("..vezaxcrash4[j]..")"
			end
			if j==#vezaxname4 then
				txtreport=txtreport.."."
			else
				txtreport=txtreport..", "
			end
		end

		pscheckwipe1()
		if pswipetrue and pswasonboss34~=2 then
			psiccwipereport("wipe", "try")
		end

		if psraidoptionson[1][3][4][4]==1 and pswasonboss34==1 then
			pszapuskanonsa(psraidchats3[psraidoptionschat[1][3][4][4]], "{rt8} "..txtreport)
		end
	end

	pschogaldisp2=nil
	table.wipe(vezaxname4)
	table.wipe(vezaxcrash4)
	psiccschet2=0
end


--синестра, смятие репорт
if pssinestrawrach5 and #pssinestrawrach5>0 then
	local bil=0
	for i=1,#pssinestrawrach5 do
		if bil==0 and pssinestrawrach5[i]~=0 and curtime>pssinestrawrach5[i]+2 then

			local timeevent=pssinestrawrach5[i]-pscombatstarttime

			if pssinestrawrach99[pssinestrawrach3[i]]==1 or pssinestrawrach99[pssinestrawrach3[i]]==3 or pssinestrawrach99[pssinestrawrach3[i]]==7 or pssinestrawrach99[pssinestrawrach3[i]]==15 or pssinestrawrach99[pssinestrawrach3[i]]==31 then
				pscaststartinfo(0,"---", 0, "id1", pssinestrawrach3[i], pssinestrasmyat,psbossnames[1][3][5],nil,nil,nil,nil,nil,timeevent)
			end
			local smyat=GetSpellInfo(89421)
			local prich=psiccunknown
			if pssinestrawrach4[i]~="0" then
				prich=pssinestrawrach4[i]
			else
				local tmp=math.ceil((pssinestrawrach5[i]-pssinestrawrach1[i])*10)/10
				if GetTime()>pssinestrawrach88[pssinestrawrach3[i]]+57 then
					prich=pscmrsinestraadd8.." "..tmp.." "..pssec
				else
					prich=prich.." "..tmp.." "..pssec
					prich="|cffff0000"..prich.."|r"
				end
			end
			local nr="?"
			if pssinestrawrach3[i] then
				nr=pssinestrawrach3[i]
			end
			local lasttick=""
			if pssinestrawrach6[i]==2 or pssinestrawrach6[i]==3 then
				for n=1,#pssinestralastperiodic[1] do
					if pssinestralastperiodic[1][n]==pssinestrawrach2[i] then
						if GetTime()<pssinestralastperiodic[3][n]+3.9 then
							lasttick=" "..pscmrsinestraadd5..": "..pssinestralastperiodic[2][n]
						end
					end
				end
			end

			pscaststartinfo(0,smyat..": %s ("..psaddcolortxt(1,pssinestrawrach2[i])..pssinestrawrach2[i]..psaddcolortxt(2,pssinestrawrach2[i]).."). "..prich..lasttick, -1, "id1", nr, pssinestrasmyat..": "..nr.." - "..psdispellinfo,psbossnames[1][3][5],2,nil,nil,nil,nil,timeevent)
			pssinestrawrach99[pssinestrawrach3[i]]=pssinestrawrach99[pssinestrawrach3[i]]+1
			bil=1
			table.remove(pssinestrawrach1,i)
			table.remove(pssinestrawrach2,i)
			table.remove(pssinestrawrach3,i)
			table.remove(pssinestrawrach4,i)
			table.remove(pssinestrawrach5,i)
			table.remove(pssinestrawrach6,i)
		end
	end
end



--evade after 3 sec
if pscmrcheckforevade and curtime>pscmrcheckforevade then
pscmrcheckforevade=pscmrcheckforevade+7
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
psiccwipereport(nil,"try")
end
end

if psconclavparcialabsorb and curtime>psconclavparcialabsorb+0.5 then
psconclavparcialabsorb=nil
psconclavshield=nil
psconclavshieldoff()
psiccschet3=0
psiccschet4=0
end

--delay last absorb council
if pscouncillastabsorb1 and curtime>pscouncillastabsorb1+0.5 then
pscouncillastabsorb1=nil
pscouncilshield1=nil
pscouncilshieldoff(1)
psiccschet3=0
psiccschet4=0
end

if shieldoffcounctp2 and curtime>shieldoffcounctp2 then
shieldoffcounctp2=nil
pscouncilshield2=nil
pscouncilshieldoff(2)
psiccschet3=0
psiccschet4=0
end

--alakir HP check add
if psalakiraddstab and #psalakiraddstab[1]>0 and pslowthen20==nil then
	if psdelayhpcheckalakir==nil then
		psdelayhpcheckalakir=curtime+0.5
	end
	if curtime>psdelayhpcheckalakir then
		psdelayhpcheckalakir=curtime+0.5
		for ttg=1,GetNumGroupMembers() do
			if UnitGUID("raid"..ttg.."-target") then
				local id=psGetUnitID(UnitGUID("raid"..ttg.."-target"))
				if id==47175 then
					psalakiraddname=UnitName("raid"..ttg.."-target")
					pslowthen20=UnitHealthMax("raid"..ttg.."-target")*0.8
					ttg=41
					psdelayhpcheckalakir=nil
				end
			end
		end
	end
end

--maloriak damage from aoe
if psmalordmgcount1 and curtime>psmalordmgcount1 then
psmalordmgcount1=nil
	if psmalordmgcount2>0 then
		if #psincombattrack15_castid>0 then
			for i=1,#psincombattrack15_castid do
				if psincombattrack15_castid[i]==77896 or psincombattrack15_castid[i]==92961 or psincombattrack15_castid[i]==92962 or psincombattrack15_castid[i]==92963 then
					psincombattrack16_additionaltext[i]="("..pscmrdmgtoplayers..": "..psmalordmgcount2..") "
				end
			end
		end
	end
psmalordmgcount2=0
end

--target check on council
if pscounciltargetcheckupd1 then

if curtime<pscounciltargetcheckupd1+15 and (pscouncilshield1 or pscouncilshield2) then
--проверка ок
	if pscounciltargetcheckupd2 and curtime>pscounciltargetcheckupd2 then
		pscounciltargetcheckupd2=curtime+0.1
		for i=1,#pssidamageinf_switchinfo[pssavedplayerpos][1][#pssidamageinf_switchinfo[pssavedplayerpos][1]][1] do
			if pssidamageinf_switchinfo[pssavedplayerpos][1][#pssidamageinf_switchinfo[pssavedplayerpos][1]][2][i]=="--" then
				if UnitName(pssidamageinf_switchinfo[pssavedplayerpos][1][#pssidamageinf_switchinfo[pssavedplayerpos][1]][1][i].."-target")==pscounciltargetcheckupd3 then
					--считаем время
					local psswichspeed=math.ceil((GetTime()-pscounciltargetcheckupd1)*10)/10
					psswichspeed=math.ceil((psswichspeed)*10)/10
					pssidamageinf_switchinfo[pssavedplayerpos][1][#pssidamageinf_switchinfo[pssavedplayerpos][1]][2][i]=psswichspeed
				end
			end
		end
	end

else
pscounciltargetcheckupd1=nil
pscounciltargetcheckupd2=nil
pscounciltargetcheckupd3=nil
end

end

--репорт волнового дыхания атрамеда
if psatramednr1 and curtime>psatramednr1 then
psatramednr1=nil
if #vezaxname6>0 then
	local nm=psiccunknown
	if psatramednr2 then
		nm=psatramednr2
	end
	local nm2=psatramednr3 or "Sonic Breath"
	local txt="|s4id78100,92407,92408,92409|id".." ("..psaddcolortxt(1,nm)..nm..psaddcolortxt(2,nm).."). "..pscmrsoundgot..": "
	for i=1,#vezaxname6 do
		txt=txt..psaddcolortxt(1,vezaxname6[i])..vezaxname6[i]..psaddcolortxt(2,vezaxname6[i]).." ("..vezaxcrash6[i]..")"
		if i==#vezaxname6 then
			txt=txt.."."
		else
			txt=txt..", "
		end
	end
	pscaststartinfo(0,psspellfilter(txt), -1, "id1", 3, nm2.." - "..psinfo,psbossnames[1][2][4],2)

	if psraidoptionson[1][2][4][4]==1 and psatramednr4 then
		pszapuskanonsa(psraidchats3[psraidoptionschat[1][2][4][4]], "{rt8} "..psremovecolor(txt))
	end

end
table.wipe(vezaxname6)
table.wipe(vezaxcrash6)
psatramednr2=nil
psatramednr3=nil
psatramednr4=nil
end

--неф бомбы репорт
if psnefbombdelay and curtime>psnefbombdelay then
psnefbombdelay=nil
if #vezaxname4>0 then
		if psraidoptionson[1][2][6][4]==1 then
			strochkavezcrash="{rt8} "..pscmrtxtoptt264..": "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][2][6][4]], nil, vezaxname4, vezaxcrash4, 1)
		end
		if psraidoptionson[1][2][6][3]==1 then
			local nmsp=GetSpellInfo(79339)
			pscaststartinfo(0,psspellfilter(pscmrtxtoptt264)..": ", -1, "id1", 88, nmsp.." - "..psinfo,psbossnames[1][2][6],3,nil,vezaxname4,vezaxcrash4)
		end
end
table.wipe(vezaxname4)
table.wipe(vezaxcrash4)
end


--репорт трупов через 0,8 сек
if pscmrshowdeathinfoincombat and curtime>pscmrshowdeathinfoincombat then
pscmrshowdeathinfoincombat=nil
local txt="{rt8} "..pscmrtxtoptt3311.." "..#psgromtable4..". "..pscmrtxtoptt3312..": "
local incombtxt=pscmrtxtoptt3311.." "..#psgromtable4..". "..pscmrtxtoptt3312..": "
local txt2=""
if #psgromtable1>0 then
	for i=1,#psgromtable1 do
		txt2=txt2..psgromtable1[i]
		if i==#psgromtable1 then
			txt2=txt2.."."
		else
			txt2=txt2..", "
		end
	end
else
	txt2=psiccunknown.."."
end
txt=txt..txt2
incombtxt=incombtxt..txt2

if #psgromtable1>1 then
	txt=txt.." "..pscmrtxtoptt3313..": "
	incombtxt=incombtxt.." "..pscmrtxtoptt3313..": "
	local txt3=""
	if #psgromtable5>0 then
		local tabln={}
		local tablk={}
		for i=1,#psgromtable5 do
			if #tabln>0 then
				local bul=0
				for j=1,#tabln do
					if tabln[j]==psgromtable5[i] then
						bul=1
						tablk[j]=tablk[j]+1
					end
				end
				if bul==0 then
					table.insert(tabln,psgromtable5[i])
					table.insert(tablk,1)
				end
			else
				table.insert(tabln,psgromtable5[i])
				table.insert(tablk,1)
			end
		end
		for i=1,#tabln do
			txt3=txt3..tabln[i]
			if tablk[i]>1 then
				txt3=txt3.." ("..tablk[i]..")"
			end
			if i==#tabln then
				txt3=txt3.."."
			else
				txt3=txt3..", "
			end
		end
	else
		txt3=psiccunknown.."."
	end
	txt=txt..txt3
	incombtxt=incombtxt..txt3
end

if psraidoptionson[1][3][3][1]==1 then
	pszapuskanonsa(psraidchats3[psraidoptionschat[1][3][3][1]], txt)
end


if psraidoptionson[1][3][3][7]==1 then
local nmsp=GetSpellInfo(83282)
pscaststartinfo(0,psspellfilter(incombtxt), -1, "id1", 1, nmsp.." - "..psinfo,psbossnames[1][3][3],2)
end




table.wipe(psgromtable4)
table.wipe(psgromtable5)

end

--снятие громоотвода через 1 сек
if psgromtable3 and #psgromtable3>0 then
	if curtime>psgromtable3[1]+1 then
		if #psgromtable1>0 then
			for i=1,#psgromtable1 do
				if psgromtable1[i] and psgromtable1[i]==psgromtable2[1] then
					table.remove(psgromtable1,i)
				end
			end
		end
		table.remove(psgromtable3,1)
		table.remove(psgromtable2,1)
	end
end

if pscatamrdelayzone and curtime>pscatamrdelayzone then
pscatamrdelayzone=nil
local a1, a2, a3, a4, a5 = GetInstanceInfo()
if UnitInRaid("player") or (a2=="raid" or (a2=="party" and a3==2)) then
SetMapToCurrentZone()
end
if GetCurrentMapAreaID()==754 or GetCurrentMapAreaID()==758 or GetCurrentMapAreaID()==773 or GetCurrentMapAreaID()==752 then
PhoenixStyleMod_Catamr:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
else
PhoenixStyleMod_Catamr:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
end
end

--announce delay for phasing
if psiccrepupdate and curtime>psiccrepupdate then
psiccrepupdate=nil
psiccwipereport(psdelcount1,psdelcount2,psdelcount3)
psdelcount1=nil
psdelcount2=nil
psdelcount3=nil
end


--прерванные бои
if pscheckbossincombatmcr and GetTime()>pscheckbossincombatmcr then
	pscheckbossincombatmcr=pscheckbossincombatmcr+2


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
		pscheckbossincombatmcr=nil
		pscheckbossincombatmcr2=GetTime()+1
	end
end

if pscheckbossincombatmcr2 and GetTime()>pscheckbossincombatmcr2 then
	pscheckbossincombatmcr2=nil
	if psbossblock==nil then
		psiccwipereport(nil, nil, "reset")
	end
end

if pscatadelaycheckboss and curtime>pscatadelaycheckboss then
pscatadelaycheckboss=nil


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
			pscmroncombatstartcheckboss(id)
		else
			pscmrdelayofbosccheck=GetTime()+1
		end
	else
		pscmrdelayofbosccheck=GetTime()+1
	end
end


--постоянная проверка по ходу боя...
if pscmrdelayofbosccheck and curtime>pscmrdelayofbosccheck then
pscmrdelayofbosccheck=curtime+1


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
			pscmroncombatstartcheckboss(id)
			pscmrdelayofbosccheck=nil
		end
	end
end


--2 - 2
if psodsatrontemp1 and curtime>psodsatrontemp1+8 then
	psodsatrontemp1=nil
	SetMapToCurrentZone()
	if GetCurrentMapAreaID()==754 and #vezaxname>0 then
		if psraidoptionson[1][2][2][1]==1 then
			strochkavezcrash="{rt8} "..pscmrtxtoptt221.." ("..psodsatrontemp2.."): "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][2][2][1]], nil, vezaxname, vezaxcrash, 1)
		end
		local nmsp=GetSpellInfo(79504)
		pscaststartinfo(0,nmsp..": %s, "..psaddcolortxt(1,psodsatrontemp2)..psodsatrontemp2..psaddcolortxt(2,psodsatrontemp2)..". "..pscmrtxtoptt22111..": ", -1, "id1", 2, nmsp.." - "..psinfo,psbossnames[1][2][2],3,nil,vezaxname,vezaxcrash)
	end
	table.wipe(vezaxname)
	table.wipe(vezaxcrash)
	psodsatrontemp2=nil
end

if psomnitronbombdelay and curtime>psomnitronbombdelay then
	psomnitronbombdelay=nil

	psiccldghosttrigid=nil
	psiccldghosttrigname=nil

	psiccldghostdmgtime=nil
	psiccldghostdmgid=nil
	psiccldghostdmgname=nil
end

--omnitron shield in combat report
if psomnishield1 and curtime>psomnishield1 then
psomnishield1=nil
	if #vezaxcrash6>0 then
		local kol=0
		for u=1,#vezaxcrash6 do
			kol=kol+vezaxcrash6[u]
		end
		if psraidoptionson[1][2][2][12]==1 and psomnishield11==1 then
			strochkavezcrash="{rt8} "..pscmrtxtoptt2212.." ("..kol.."): "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][2][2][12]], true, vezaxname6, vezaxcrash6, 1)
		end
		local nnnmm=GetSpellInfo(91467)
		local names=""
			for i=1,#vezaxname6 do
				names=names..psaddcolortxt(1,vezaxname6[i])..vezaxname6[i]..psaddcolortxt(2,vezaxname6[i]).." ("..vezaxcrash6[i]
				if psomniabilities[i] and #psomniabilities[i]>0 then
					names=names..": "
					local maxt=3
					if #psomniabilities[i]<4 then
						maxt=#psomniabilities[i]
					end
					for j=1,maxt do
						names=names..psomniabilities[i][j].."-"..psomniabilitiesq[i][j]
						if j==maxt then
							if #psomniabilities[i]>maxt then
								names=names..",...)"
							else
								names=names..")"
							end
						else
							names=names..", "
						end
					end
				else
					names=names..")"
				end

				if i==#vezaxname6 then
					names=names.."."
				else
					names=names..", "
				end
			end
		pscaststartinfo(0,pscmrtxtoptt229.." "..names, -1, "id1", 4, nnnmm.." - "..psinfo,psbossnames[1][2][2],2)
	end
table.wipe(vezaxname6)
table.wipe(vezaxcrash6)
table.wipe(psomniabilities)
table.wipe(psomniabilitiesq)
end

if psomnishield2 and curtime>psomnishield2 then
psomnishield2=nil
if psraidoptionson[1][2][2][13]==1 then
	if #vezaxcrash8>0 then
		local kol=0
		for u=1,#vezaxcrash8 do
			kol=kol+vezaxcrash8[u]
		end
		strochkavezcrash="{rt8} "..pscmrtxtoptt2213.." ("..kol.."): "
		reportafterboitwotab(psraidchats3[psraidoptionschat[1][2][2][13]], true, vezaxname8, vezaxcrash8, 1)
	end
end
table.wipe(vezaxname8)
table.wipe(vezaxcrash8)
end

if psomnishield3 and curtime>psomnishield3 then
psomnishield3=nil
if psraidoptionson[1][2][2][14]==1 then
	if #vezaxcrash10>0 then
		local kol=0
		for u=1,#vezaxcrash10 do
			kol=kol+vezaxcrash10[u]
		end
		strochkavezcrash="{rt8} "..pscmrtxtoptt2214.." ("..kol.."): "
		reportafterboitwotab(psraidchats3[psraidoptionschat[1][2][2][14]], true, vezaxname10, vezaxcrash10, 1)
	end
end
table.wipe(vezaxname10)
table.wipe(vezaxcrash10)
end

--maloriak
if psmaloriakwait50 and curtime>psmaloriakwait50 then
psmaloriakwait50=nil

if psraidoptionson[1][2][3][4]==0 or (psraidoptionson[1][2][3][4]==1 and psmaloriakphase==nil) then
table.insert(psmaloriakdisptable,0)
end


local a=GetSpellInfo(77912)

if psraidoptionson[1][2][3][2]==1 then
pscaststartinfo(0,a..". "..pscmrtxtoptt2313..": "..psiccschet5, -1, "id1", 3, a.." - "..psinfo,psbossnames[1][2][3],2)
end

psiccschet5=0
psiccschet1=0
psiccschet2=0
end

--hunter die delay

if psicchunterdiedelay and curtime>psicchunterdiedelay then
psicchunterdiedelay=nil
--deathwisper/omnitron
if psicchunterdiedelayboss==1 then
for tyu=1,#psicchunterdiedelaytable do
	for euu = 1,GetNumGroupMembers() do local name, _, _, _, _, _, _, _, isDead = GetRaidRosterInfo(euu)
		if (name==psicchunterdiedelaytable[tyu] and (isDead or UnitIsDeadOrGhost(name))) then
			psiccladydeathghostcheck(psicchunterdiedelayarg1, psicchunterdiedelaytable[tyu],8)
		end
	end
end

psicchunterdiedelayarg1=nil
end

psicchunterdiedelaytable=nil
psicchunterdiedelayboss=nil
end


if psshieldisonboss22 and curtime>psshieldisonboss22+20 then
psshieldisonboss22=nil
table.wipe(psdamagename2)
table.wipe(psdamagevalue2)
end


--valiona blackout
if pscmrvalionatabldelay and curtime>pscmrvalionatabldelay then
	pscmrvalionatabldelay=nil
	SetMapToCurrentZone()
	if GetCurrentMapAreaID()==758 and #pscmrvalionatabl1>0 and pscmrvalionatabl5 then
		local text=pscmrtxtoptadd3211.." "..pscmrvalionatabl5..", "
		local otlecheno=0
		local hptot=0
		if pscmrvalionatabl7-pscmrvalionatabl6<14.4 then
			otlecheno=1
		end
		if #psdamagevalue2>0 then
			for zx=1,#psdamagevalue2 do
				hptot=hptot+psdamagevalue2[zx]
			end
		end
		if hptot>0 and hptot>pscmrvalionatabl8*0.7 then
			otlecheno=1
		else
			otlecheno=0
		end
		local timetmpheal=""
		if pscmrvalionatabl7 and pscmrvalionatabl8 then
			timetmpheal=(math.ceil((pscmrvalionatabl7-pscmrvalionatabl6)*10))/10
		end
		if timetmpheal<15 and timetmpheal>0 then
			timetmpheal=" ("..timetmpheal.." "..pssec..")"
		else
			timetmpheal=""
		end

		if pscmrvalionatabl4 then
			text=text..pscmrtxtoptadd3212..timetmpheal..": "..pscmrvalionatabl4.." "..pscmrtxtoptadd3216.." "
		elseif #psdamagename2>0 and psdamagevalue2[1] and psdamagevalue2[1]>1000 and otlecheno==1 then
			if psdamagevalue2[2] and psdamagevalue2[1]/psdamagevalue2[2]<1.7 then
				text=text..pscmrtxtoptadd3213..timetmpheal..": "..psdamagename2[1].." ("..psdamagevalue2[1].."), "..psdamagename2[2].." ("..psdamagevalue2[2]..") "..pscmrtxtoptadd3216.." "
			else
				text=text..pscmrtxtoptadd3213..timetmpheal..": "..psdamagename2[1].." ("..psdamagevalue2[1]..") "..pscmrtxtoptadd3216.." "
			end
		else
			text=text..pscmrtxtoptadd3212.." "..psiccunknown.." "..pscmrtxtoptadd3216.." "
		end
		text=text..pscmrvalionatabl1[1].."."
		local text2=""

		local rscskokagrup=5
		if GetRaidDifficultyID()==1 or GetRaidDifficultyID()==3 then
			rscskokagrup=2
		end
		for i = 1,GetNumGroupMembers() do
			local name, _, subgroup, _, _, _, _, online, isDead = GetRaidRosterInfo(i)
			if (subgroup <= rscskokagrup and online and isDead==nil and UnitIsDeadOrGhost(name)==false) then
				local byl=0
				for j=1,#pscmrvalionatabl1 do
					if pscmrvalionatabl1[j]==name then
						byl=1
					end
				end
				if byl==0 then
					table.insert(pscmrvalionatabl2,name)
				end
			end
		end
		if #pscmrvalionatabl1<6 and #pscmrvalionatabl2>6 then
			text2=text2..pscmrtxtoptadd3214.." ("..#pscmrvalionatabl1.."): "
			table.sort(pscmrvalionatabl1)
			for i=1,#pscmrvalionatabl1 do
				if i==#pscmrvalionatabl1 then
					text2=text2..pscmrvalionatabl1[i].."."
				else
					text2=text2..pscmrvalionatabl1[i]..", "
				end
			end
		else
			text2=text2..pscmrtxtoptadd3215.." ("..#pscmrvalionatabl2.."): "
			table.sort(pscmrvalionatabl2)
			for i=1,#pscmrvalionatabl2 do
				if i==#pscmrvalionatabl2 then
					text2=text2..pscmrvalionatabl2[i].."."
				else
					text2=text2..pscmrvalionatabl2[i]..", "
				end
			end
		end
		if psraidoptionson[1][3][2][1]==1 then
			pszapuskanonsa(psraidchats3[psraidoptionschat[1][3][2][1]], "{rt8} "..text)
			pszapuskanonsa(psraidchats3[psraidoptionschat[1][3][2][1]], text2)
		end
		local nmsp=GetSpellInfo(86788)
		pscaststartinfo(0,psspellfilter(text), -1, "id1", 1, nmsp.." - "..psinfo,psbossnames[1][3][2],2)
		pscaststartinfo(0,psspellfilter(text2), -1, "id1", 1, nmsp.." - "..psinfo,psbossnames[1][3][2],2)
	end

pscmrvalionatabl1=nil
pscmrvalionatabl2=nil
table.wipe(psdamagename2)
table.wipe(psdamagevalue2)
pscmrvalionatabl4=nil
pscmrvalionatabl5=nil
end







end

function pscmroncombatstartcheckboss(id)



SetMapToCurrentZone()
if GetCurrentMapAreaID()==754 or GetCurrentMapAreaID()==758 or GetCurrentMapAreaID()==773 or GetCurrentMapAreaID()==752 then
pscmrcheckforevade=GetTime()+10
end


	--ыыытест новые боссы прописывать тут (2 места)


	if id==47120 and psbossfile11 then
		pswasonboss11=1
	end
	if id==52363 and psbossfile12 then
		pswasonboss12=1
	end

if GetCurrentMapAreaID()==754 then
	if id==41570 and psbossfile21 then
		pswasonboss21=1
		if #psbossbugs>0 then
			for i=1,#psbossbugs do
				if psbossbugs[i] and psbossbugs[i]==42347 and psmagmawcantrelease==nil then
					table.remove(psbossbugs,i)
				end
			end
		end
	end
	if (id==42180 or id==42166 or id==42178 or id==42179) and psbossfile22 then
		pswasonboss22=1
		pstableofomniatten1={}
		table.wipe(pstableofomniatten1)
		pstableofomniatten2={}
		table.wipe(pstableofomniatten2)
		pstableofomniatten3={}
		table.wipe(pstableofomniatten3)
		pstableofomniatten4={}
		table.wipe(pstableofomniatten4)

		psomniabilities={} --абилки в щит, или 0 если пет
		psomniabilitiesq={} --количество юзов этой абилки! ограничение в 3 абилки?
	else
		pstableofomniatten1=nil
		pstableofomniatten2=nil
		pstableofomniatten3=nil
		pstableofomniatten4=nil
	end
	if id==41378 and psbossfile23 then
		pswasonboss23=1
		psmaloriakphase=1
	end
	if id==41442 and psbossfile24 then
		pswasonboss24=1
		pscountartamedsound=1
		psbesatramed1={} --ид аддов что делают каст
		psbesatrameddmgid={} --ид аддов что добавлены в модуль урона
		psbesatrameddmg1={} --ид кто бил
		psbesatrameddmg2={} --ид кого бил адд
		psforsaannounce1={} --кого бьет бес для СА
		psforsaannounce2={} --время блока
	else
		pscountartamedsound=nil
	end
	if id==43296 and psbossfile25 then
		pswasonboss25=1
		ps_chimaerontab3={} --ник с меткой
		ps_chimaerontab4={} --номер метки
		ps_chimaerontab5={} --время через которое снять нах метку
		table.wipe(ps_chimaerontab3)
		table.wipe(ps_chimaerontab4)
		table.wipe(ps_chimaerontab5)

		if IsRaidOfficer()==1 and (pschimaeronmarksstopfor60==nil or (pschimaeronmarksstopfor60 and GetTime()>pschimaeronmarksstopfor60)) then
			SendAddonMessage("PSaddmod", "10"..UnitName("player"), "RAID")
		end


	end
	if (id==41376 or id==41270) and psbossfile26 then
		pswasonboss26=1
		psnefariantabl1={}
		table.wipe(psnefariantabl1) --id мобов
		psnefariantabl2={{},{},{}}  --координаты игроков по которым прошел удар!
		table.wipe(psnefariantabl2[1])
		table.wipe(psnefariantabl2[2])
		table.wipe(psnefariantabl2[3])
		psnefariantabltime=nil      --время для чека мобов
pscmrnefdominion1={} --имя
pscmrnefdominion2={} --время начала бафа
pscmrnefdominion3={} --время конца бафа
pscmrnefdominion4={} --время когда нужно перенести это все в аддон, 5 сек после господства???
pscmrnefdominion5={} --тип перевода: 1 - бафф наложился // 2 - бафф снялся и считаем ток урон от игроков и лужи // 3 - Аое Нефа, просто прописать и все, 4 - разделение полосками
pscmrnefdominion6={} --ТАБЛИЦЫ внутри, имена кто бил по игроку
pscmrnefdominion7={} --ТАБЛИЦЫ внутри, кол-во урона от тех кто бил
pscmrnefdominion8={} --сколько баффов набрал игрок за этот раз, НАЧАЛЬНОЕ количество
pscmrnefdominion9={} --сколько баффов набрал игрок за этот раз, окончательное количество
pscmrnefdominion10={} --время когда прожал абилку снятия
pscmrnefdominion11={} --время когда умер // если нет этих данных ничего не пишем наверное, если оба то высчитываем что снял но все же умер через .. сек после снятия
pscmrnefdominion12={} --время когда прожиал абилку бафа!
psnefdomwas=nil

psnefmagmaignor1={} --имена тех кто получил бомбу
psnefmagmaignor2={} --время после которого их можно считать

	else
		psnefariantabl1=nil
		psnefariantabl2=nil
		psnefariantabltime=nil
	end
end

if GetCurrentMapAreaID()==758 then
	if id==44600 and psbossfile31 then --ыытест ИД не работал!
		pswasonboss31=1
	end
	if (id==45992 or id==45993) and psbossfile32 then
		pswasonboss32=1
	end
	if (id==43735 or id==43686 or id==43687 or id==43688 or id==43689) and psbossfile33 then
		pswasonboss33=1
		psgromtable1={}
		psgromtable2={}
		psgromtable3={}
		psgromtable4={}
		psgromtable5={}
		table.wipe(psgromtable1)
		table.wipe(psgromtable2)
		table.wipe(psgromtable3)
		table.wipe(psgromtable4)
		table.wipe(psgromtable5)
		psledsferka1={}
		psledsferka2={}
		psledsferka222={}
		psledsferka3={}
		psledsferka4={}
		psledsferkatt1={}
		psledsferkatt2={}
		psledsferkatt3={}
		table.wipe(psledsferka1)
		table.wipe(psledsferka2)
		table.wipe(psledsferka222)
		table.wipe(psledsferka3)
		table.wipe(psledsferka4)
		table.wipe(psledsferkatt1)
		table.wipe(psledsferkatt2)
		table.wipe(psledsferkatt3)
	else
		psgromtable1=nil
		psgromtable2=nil
		psgromtable3=nil
		psgromtable4=nil
		psgromtable5=nil
		psledsferka1=nil
		psledsferka2=nil
		psledsferka222=nil
		psledsferka3=nil
		psledsferka4=nil
		psledsferkatt1=nil
		psledsferkatt2=nil
		psledsferkatt3=nil
	end
	if id==43324 and psbossfile34 then
		pscheckprecastnotboss=1
		pswasonboss34=1
		pscogaltable1={}
		table.wipe(pscogaltable1)
		pscogalplayerid={}
		table.wipe(pscogalplayerid)
		for nm=1,GetNumGroupMembers() do
			local name2 = GetRaidRosterInfo(nm)
			local gggid=UnitGUID(name2)
			if gggid then
				table.insert(pscogalplayerid,gggid)
			end
		end
	else
		pscogalplayerid=nil
	end
	if id==45213 and psbossfile35 then
		pswasonboss35=1
		psaddsidtocast={}
		table.wipe(psaddsidtocast)
		psaddsidtocast2={}
		table.wipe(psaddsidtocast2)
		psaddsidtocast3={}
		table.wipe(psaddsidtocast3)

pssinestrawrach1={} --время наложения дебафа
pssinestrawrach2={} --ник на кого наложили
pssinestrawrach3={} --ТИП дебафа, сначало дает 1, потом дастся 2, 3, 4, 5 и тд в какую таблицу заносить
pssinestrawrach4={} --"0" что произошло, умер, диспел за скока сек и тп инфо уже готовое
pssinestrawrach5={} --0 время СНЯТИЯ (после этого 2 сек ждем чтоб заполнить 4 табл, и добавляем в репорт // ЧЕРЕЗ 2 сек будем проверять
pssinestrawrach6={} --тип снятия, 0 неизвестно, 1 диспел, 2 смерть, 3 диспел и смерть ВМЕСТЕ
pssinestrawrach99={} --сколько рядков мы УЖЕ внесли в данные по ходу боя, после 1, 3, 7 и тд полосочки зеленые
pssinestrawrach88={} --1 дебафф повесился, время..

pssinestralastperiodic={{},{},{}} --ник, урон, время
pscheckprecastnotboss=1

	else
		psaddsidtocast=nil
		psaddsidtocast2=nil
		psaddsidtocast3=nil
	end
end


	if (id==45871 or id==45870 or id==45872) and psbossfile41 then
		pswasonboss41=1
	end
	if id==46753 and psbossfile42 then
		pswasonboss42=1
		psalakiraddstab={{},{},{},{}}
		table.wipe(psalakiraddstab[1])
		table.wipe(psalakiraddstab[2])
		table.wipe(psalakiraddstab[3])
		table.wipe(psalakiraddstab[4])
	else
		psalakiraddstab=nil
	end


end


function pscatamronevent(self,event,...)


--if GetNumGroupMembers() > 0 and event == "COMBAT_LOG_EVENT_UNFILTERED" then
if event == "COMBAT_LOG_EVENT_UNFILTERED" then


--Baradin Hold
if GetCurrentMapAreaID()==752 then

local arg1, arg2, arg3,arg4,arg5,arg6,argNEW1,arg7,arg8,arg9,argNEW2,arg10,arg11 = ...


if pswasonboss11 then
if (arg2=="SPELL_DAMAGE") and (arg10==89000 or arg10==95177) then
pscmrboss111(arg7,arg8)
end
end

--2 boss, ptr test API not work ыытест
--if pswasonboss12 then --ыытест
if arg2=="SPELL_CAST_SUCCESS" and (arg10==96884 or arg10==96886) then
psdelaysecbh22=GetTime()+2
end

if arg2=="SPELL_DAMAGE" and (arg10==97212 or arg10==96883) then
pscmrboss121(arg7,arg8)
end



--end --ыытест


end


--Inst 2
if GetCurrentMapAreaID()==754 then

if pswasonboss21 then
pscombatlogboss21(...)
elseif pswasonboss22 then
pscombatlogboss22(...)
elseif pswasonboss23 then
pscombatlogboss23(...)
elseif pswasonboss24 then
pscombatlogboss24(...)
elseif pswasonboss25 then
pscombatlogboss25(...)
elseif pswasonboss26 then
pscombatlogboss26(...)
end

end
--inst 2 end


--Inst 3
--Bastion of Twilight
if GetCurrentMapAreaID()==758 then

if pswasonboss32 then
pscombatlogboss32(...)
elseif pswasonboss33 then
pscombatlogboss33(...)
elseif pswasonboss34 then
pscombatlogboss34(...)
elseif pswasonboss35 then
pscombatlogboss35(...)
else
--halfus BUG ыытест
pscombatlogboss31(...)
end
end
--inst 3 end

--inst 4
if GetCurrentMapAreaID()==773 then
if pswasonboss41 then
pscombatlogboss41(...)
elseif pswasonboss42 then
pscombatlogboss42(...)
end
end
--inst 4 end





else

--остальные евенты

local arg1, arg2, arg3,arg4,arg5,arg6 = ...

if event == "PLAYER_REGEN_DISABLED" then


if (psbilresnut and GetTime()<psbilresnut+3) or pscheckbossincombat then


else

psmaloriakdisptable=nil
pstrackcasthalf=nil
pstimewardenok=nil
pslowthen20=nil
psconclavtabl415=nil
psconclavshield=nil
pscouncilshield1=nil
pscouncilshield2=nil


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
pscmroncombatstartcheckboss(id)
else
pscatadelaycheckboss=GetTime()+2
end

else
pscatadelaycheckboss=GetTime()+2
end


end
end




if event == "ZONE_CHANGED_NEW_AREA" then


psiccwipereport(nil,"try")
pscatamrdelayzone=GetTime()+3


end


if event == "CHAT_MSG_ADDON" then
if arg1=="PSaddmod" and arg2 and string.sub(arg2,1,2)=="10" and arg4~=UnitName("player") then

local nam=UnitName("player")
local tablecheckprof={}
table.insert(tablecheckprof,nam)
table.insert(tablecheckprof,arg2)
table.sort(tablecheckprof)
if tablecheckprof[1]~=nam then
pschimaeronmarksstopfor60=GetTime()+60
end


end
end

if event=="UNIT_POWER" then


if pscountartamedsound then
if arg2=="ALTERNATE" and arg1 then
	local power = UnitPower(arg1, 10)
	if power then
		local aa1=UnitName(arg1)
		if aa1 and pswasonboss24 then
			pscmrboss241(aa1,power)
		end
	end
end
end

if pswasonboss34 and psiccschet1==0 then
if arg2=="ALTERNATE" and arg1 then
	local power = UnitPower(arg1, 10)
	if power then
		local aa1=UnitName(arg1)
		local gugu=UnitGUID(arg1)
		if aa1 then
			pscmrboss342(gugu,aa1,power)
		end
	end
end
end


end




if event == "ADDON_LOADED" then

if arg1=="PhoenixStyleMod_CataMiniRaids" then


if psicctekver==nil then psicctekver=0 end


local psiccnewveranoncet={}
if GetLocale()=="ruRU" then
psiccnewveranoncet={}
end 


--NEW announce
	if 8-psicctekver>0 and #psiccnewveranoncet>0 then

local psvercoll=(8-psicctekver)

		if psvercoll>0 then
			print ("|cff99ffffPhoenixStyle|r - "..pscolnewveranonce1)
		end

if psvercoll>3 then psvercoll=3 end

while psvercoll>0 do
		if psvercoll>0 and psiccnewveranoncet[psvercoll] then
out ("|cff99ffffPhoenixStyle|r - "..psiccnewveranoncet[psvercoll])
		end
psvercoll=psvercoll-1
end
	end

psicctekver=8 --ТЕК ВЕРСИЯ!!! и так выше изменить цифру что отнимаем, всего 3 раза




pslastmoduleloadtxt=pscmrlastmoduleloadtxt


--перенос переменных

pscmrpassvariables()


for i=1,4 do
	if psraidoptionson[1][i]==nil then psraidoptionson[1][i]={}
	end
	for j=1,#psraidoptionsont1[i] do
		if psraidoptionson[1][i][j]==nil then
			psraidoptionson[1][i][j]={}
		end
		for t=1,#psraidoptionsont1[i][j] do
			if psraidoptionson[1][i][j][t]==nil then
				psraidoptionson[1][i][j][t]=psraidoptionsont1[i][j][t]
			end
		end
	end
end

for i=1,4 do
	if psraidoptionstxt[i]==nil then psraidoptionstxt[i]={}
	end
	for j=1,#psraidoptionstxtt1[i] do
		if psraidoptionstxt[i][j]==nil then
			psraidoptionstxt[i][j]={}
		end
		for t=1,#psraidoptionstxtt1[i][j] do
			if psraidoptionstxt[i][j][t]==nil then
				psraidoptionstxt[i][j][t]=psraidoptionstxtt1[i][j][t]
			end
		end
	end
end

--ыытест что мы тут убирали, тестим
psraidoptionstxtt1=nil



--psraidoptionstxtt11=nil
--psraidoptionstxtt12=nil
--psraidoptionstxtt13=nil
--psraidoptionstxtt14=nil

for i=1,4 do
	if psraidoptionschat[1][i]==nil then psraidoptionschat[1][i]={}
	end
	for j=1,#psraidoptionschatt1[i] do
		if psraidoptionschat[1][i][j]==nil then
			psraidoptionschat[1][i][j]={}
		end
		for t=1,#psraidoptionschatt1[i][j] do
			if psraidoptionschat[1][i][j][t]==nil then
				psraidoptionschat[1][i][j][t]=psraidoptionschatt1[i][j][t]
			end
		end
	end
end


--boss manual localization update
if psbossnames then
psbossnames[1][2][2]=pscmrmanualbossloc1
psbossnames[1][3][2]=pscmrmanualbossloc2
psbossnames[1][3][3]=pscmrmanualbossloc3
psbossnames[1][4][1]=pscmrmanualbossloc4
end



end
end
--остальные евенты конец





end --рейд


end --КОНЕЦ ОНЕВЕНТ


--tryorkill - if try then true, if kill - nil, reset - only reset no report
--pswasonboss42 1 если мы в бою с боссом и трекерим, 2 если вайпнулись и продолжаем трекерить ПОСЛЕ анонса
function psiccwipereport(wipe, tryorkill, reset, checkforwipe)
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


	if pszapuskdelayphasing>0 then
	psiccrepupdate=pszapuskdelayphasing
	pszapuskdelayphasing=0
	if psiccrepupdate>7 then psiccrepupdate=7 end
	psiccrepupdate=psiccrepupdate+GetTime()
	psdelcount1=wipe
	psdelcount2=tryorkill
	psdelcount3=reset
	else

		if psiccrepupdate==nil then

--ыыытест новые боссы прописывать тут (2 места)
pscmrcheckforevade=nil


if (pswasonboss11) then
pscmrbossREPORT111(wipe, tryorkill, reset, checkforwipe)
pscmrbossRESET111(wipe, tryorkill, reset, checkforwipe)
end

if (pswasonboss12) then
pscmrbossREPORT121(wipe, tryorkill, reset, checkforwipe)
pscmrbossRESET121(wipe, tryorkill, reset, checkforwipe)
end

if (pswasonboss21) then
pscmrbossREPORT211(wipe, tryorkill, reset, checkforwipe)
pscmrbossRESET211(wipe, tryorkill, reset, checkforwipe)
end

if (pswasonboss22) then
pscmrbossREPORT221(wipe, tryorkill, reset, checkforwipe)
pscmrbossRESET221(wipe, tryorkill, reset, checkforwipe)
end

if (pswasonboss23) then
pscmrbossREPORT231(wipe, tryorkill, reset, checkforwipe)
pscmrbossRESET231(wipe, tryorkill, reset, checkforwipe)
end

if (pswasonboss24) then
pscmrbossREPORT241(wipe, tryorkill, reset, checkforwipe)
pscmrbossRESET241(wipe, tryorkill, reset, checkforwipe)
end

if (pswasonboss25) then
pscmrbossREPORT251(wipe, tryorkill, reset, checkforwipe)
pscmrbossRESET251(wipe, tryorkill, reset, checkforwipe)
end

if (pswasonboss26) then
pscmrbossREPORT261(wipe, tryorkill, reset, checkforwipe)
pscmrbossRESET261(wipe, tryorkill, reset, checkforwipe)
end

if (pswasonboss31) then
pscmrbossREPORT311(wipe, tryorkill, reset, checkforwipe)
pscmrbossRESET311(wipe, tryorkill, reset, checkforwipe)
end

if (pswasonboss32) then
pscmrbossREPORT321(wipe, tryorkill, reset, checkforwipe)
pscmrbossRESET321(wipe, tryorkill, reset, checkforwipe)
end

if (pswasonboss33) then
pscmrbossREPORT331(wipe, tryorkill, reset, checkforwipe)
pscmrbossRESET331(wipe, tryorkill, reset, checkforwipe)
end

if (pswasonboss34) then
pscmrbossREPORT341(wipe, tryorkill, reset, checkforwipe)
pscmrbossRESET341(wipe, tryorkill, reset, checkforwipe)
end
if (pswasonboss35) then
pscmrbossREPORT351(wipe, tryorkill, reset, checkforwipe)
pscmrbossRESET351(wipe, tryorkill, reset, checkforwipe)
end

if (pswasonboss41) then
pscmrbossREPORT411(wipe, tryorkill, reset, checkforwipe)
pscmrbossRESET411(wipe, tryorkill, reset, checkforwipe)
end

if (pswasonboss42) then
pscmrbossREPORT421(wipe, tryorkill, reset, checkforwipe)
pscmrbossRESET421(wipe, tryorkill, reset, checkforwipe)
end


		end

	end

if wipe==nil and psbossblock==nil then
psbossblock=GetTime()
end

end


function pscmrpassvariables()

if psraidoptionschatt1==nil then psraidoptionschatt1={} end

for i=1,#psraidoptionschatdeft1 do
	if psraidoptionschatt1[i]==nil then
		psraidoptionschatt1[i]={}
	end
	for j=1,#psraidoptionschatdeft1[i] do
		if psraidoptionschatt1[i][j]==nil then
			psraidoptionschatt1[i][j]={}
		end
		for t=1,#psraidoptionschatdeft1[i][j] do
			if psraidoptionschatt1[i][j][t]==nil or (psraidoptionschatt1[i][j][t] and psraidoptionschatt1[i][j][t]==0) then
				psraidoptionschatt1[i][j][t]=psraidoptionschatdeft1[i][j][t]
			end
		end
	end
end

if psraidoptionsont1==nil then psraidoptionsont1={} end

for i=1,#psraidoptionsondeft1 do
	if psraidoptionsont1[i]==nil then
		psraidoptionsont1[i]={}
	end
	for j=1,#psraidoptionsondeft1[i] do
		if psraidoptionsont1[i][j]==nil then
			psraidoptionsont1[i][j]={}
		end
		for t=1,#psraidoptionsondeft1[i][j] do
			if psraidoptionsont1[i][j][t]==nil then
				psraidoptionsont1[i][j][t]=psraidoptionsondeft1[i][j][t]
			end
		end
	end
end

end