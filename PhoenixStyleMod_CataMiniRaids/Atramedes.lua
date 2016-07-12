psbossfile24=1
function pscmrboss241(arg7,arg13)
if UnitInRaid(arg7) then
	pscheckwipe1()
	if pswipetrue and pswasonboss24~=2 then
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


function pscmrboss242(arg6,arg7,arg10,arg9)
psunitisplayer(arg6,arg7)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss24~=2 then
		psiccwipereport("wipe", "try")
	end
		addtotwotables3(arg7)
		vezaxsort3()
pscaststartinfo(arg9,arg10, -1, "id1", 1, "|s4id"..arg9.."|id - "..psinfo,psbossnames[1][2][4],1,arg7)
end
end

function pscmrboss243(arg6,arg7,arg10,arg9)
psunitisplayer(arg6,arg7)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss24~=2 then
		psiccwipereport("wipe", "try")
	end
		addtotwotables4(arg7)
		vezaxsort4()
pscaststartinfo(arg9,arg10, -1, "id1", 2, "|s4id"..arg9.."|id - "..psinfo,psbossnames[1][2][4],1,arg7)
end
end


function psbesdmgadd(arg4,arg6,dmg,overkill,arg7)
if #psbesatrameddmgid>0 then
	local byl=0
	for u=1,#psbesatrameddmgid do
		if psbesatrameddmgid[u]==arg6 and byl==0 then
			byl=1
			psbesadddamage(arg4,arg6,dmg,overkill)
		end
	end
	if byl==0 then
		psbesaddnewadd(arg4,arg6,dmg,arg7)
	end
else
	--создаем новые табл
	
  pscreatesavedreports3(psbossnames[1][2][4])
  
	psaddclasscolors()
	psbesaddnewadd(arg4,arg6,dmg,arg7)
	--psdmgresetinglastfight()
end
end

function psbesaddnewadd(arg4,arg6,dmg,arg7)
	local h,m = GetGameTime()
	if h<10 then h="0"..h end
	if m<10 then m="0"..m end
	local time=h..":"..m

table.insert(psbesatrameddmgid,arg6)

local an=arg7 or "Mob"
table.insert(pssidamageinf_indexboss[pssavedplayerpos][1],1)
local a="?"
if #psbesatrameddmg1>0 then
	for i=1,#psbesatrameddmg1 do
		if psbesatrameddmg1[i]==arg6 then
			a=psbesatrameddmg2[i]
		end
	end
end

table.insert(pssidamageinf_title2[pssavedplayerpos][1],an..": "..#psbesatrameddmgid.." ("..a..")")
table.insert(pssidamageinf_additioninfo[pssavedplayerpos][1],{psbossnames[1][2][4]..", "..time})
table.insert(pssidamageinf_damageinfo[pssavedplayerpos][1],{{arg4},{dmg},{0}})
table.insert(pssidamageinf_switchinfo[pssavedplayerpos][1],{{},{}})

psupdateframewithnewinfo()
end


function psbesadddamage(arg4,arg6,dmg,overkill)
for ii=1,#psbesatrameddmgid do
	if psbesatrameddmgid[ii]==arg6 then
		local dmg2=dmg
		if overkill and overkill>1 then
			dmg2=dmg-overkill
		end
		psmoddmg_addinfodmg(arg4,dmg2,0,ii)
		psmoddmg_sortinfodmg(ii)
	end
end
end



function pscmrbossREPORT241(wipe,try,reset,checkforwipe)
if reset==nil then
if checkforwipe==nil or (checkforwipe and pswasonboss24 and pswasonboss24==1) then

	if pswasonboss24==1 then
		pssetcrossbeforereport1=GetTime()
		--тут репорт
		if psraidoptionson[1][2][4][1]==1 then
			strochkavezcrash=pscmrtxtoptt241.." "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][2][4][1]], true, vezaxname2, vezaxcrash2, 1)
		end
		if psraidoptionson[1][2][4][2]==1 then
			strochkavezcrash=pscmrtxtoptt242.." "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][2][4][2]], true, vezaxname3, vezaxcrash3, 1)
		end
		if psraidoptionson[1][2][4][3]==1 then
			strochkavezcrash=pscmrtxtoptt243.." "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][2][4][3]], true, vezaxname4, vezaxcrash4, 1)
		end
		if psraidoptionson[1][2][4][5]==1 then
			strochkavezcrash=pscmrtxtoptt245.." "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][2][4][5]], true, vezaxname5, vezaxcrash5, 1)
		end

	end
	if pswasonboss24==1 or (pswasonboss24==2 and try==nil) then

	psiccsavinginf(psbossnames[1][2][4], try, pswasonboss24)
		--тут сохранение
		strochkavezcrash=pscmrtxtoptt241.." "
		reportafterboitwotab("raid", true, vezaxname2, vezaxcrash2, nil, nil,0,1)
		strochkavezcrash=pscmrtxtoptt242.." "
		reportafterboitwotab("raid", true, vezaxname3, vezaxcrash3, nil, nil,0,1)
		strochkavezcrash=pscmrtxtoptt243.." "
		reportafterboitwotab("raid", true, vezaxname4, vezaxcrash4, nil, nil,0,1)
		strochkavezcrash=pscmrtxtoptt245.." "
		reportafterboitwotab("raid", true, vezaxname5, vezaxcrash5, nil, nil,0,1)

	psiccrefsvin()

	end

	if wipe then
		pswasonboss24=2
		pscheckbossincombatmcr=GetTime()+1
	end
end
end
end


function  pscmrbossRESET241(wipe,try,reset,checkforwipe)
if reset or wipe==nil then
pswasonboss24=nil
--тут резет
pscountartamedsound=nil
table.wipe(vezaxname2)
table.wipe(vezaxcrash2)
table.wipe(vezaxname3)
table.wipe(vezaxcrash3)
table.wipe(vezaxname4)
table.wipe(vezaxcrash4)
table.wipe(vezaxname5)
table.wipe(vezaxcrash5)

--6 тоже используется

end
end


function pscombatlogboss24(...)
local arg1, arg2, argnew1, arg3,arg4,arg5,argNEW,arg6,arg7,arg8,argNEW2,arg9,arg10,arg11,arg12,arg13,arg14, arg15 = ...


if arg2=="SPELL_ENERGIZE" and pszvukimpuls and arg10==pszvukimpuls then
pscmrboss242(arg6,arg7,arg10,arg9)
end
if arg2=="SPELL_ENERGIZE" and (arg9==92553 or arg9==92554 or arg9==92555 or arg9==92556) then
pscmrboss243(arg6,arg7,arg10,arg9)
end

if arg2=="SPELL_CAST_START" and (arg9==78098 or arg9==92403 or arg9==92404 or arg9==92405) then
psatramednr1=GetTime()+12 --репорт через 12 сек
psatramednr3=arg10
pscheckwipe1()
if pswasonboss24==1 and pswipetrue==nil then
psatramednr4=GetTime()
end
end

if arg2=="SPELL_AURA_APPLIED" and arg9==78092 then
psatramednr2=arg7 --ник кто кайтит
if ps_saoptions[1][2][4][1]==1 then
ps_sa_sendinfo(arg7, arg10.." "..psmain_sa_phrase1, 5, nil, nil)
end
end

if arg2=="SPELL_ENERGIZE" and (arg9==78100 or arg9==92407 or arg9==92408 or arg9==92409) and arg13 and psatramednr1 then
psunitisplayer(arg6,arg7)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss24~=2 then
		psiccwipereport("wipe", "try")
	end
		addtotwotables5(arg7)
		vezaxsort5()
addtotwotables6(arg7,arg13)
vezaxsort6()
end
end



--интерапты беса
if arg2=="SPELL_CAST_START" and (arg9==92677 or arg9==92702) then
local bil=5
local bil2=0
if psbesatramed1 and #psbesatramed1>0 then
	for i=1,#psbesatramed1 do
		if psbesatramed1[i]==arg3 then
			bil2=1
			bil=i+4
		end
	end
end
if bil2==0 then
	table.insert(psbesatramed1,arg3)
	bil=#psbesatramed1+4
end


pscheckrunningbossid(arg3)
pscaststartinfo(arg9,arg10.." ("..psmob1..": "..(bil-4).."): %s.", 2.5, arg3, 5, "|s4id"..arg9.."|id - "..pscmreventsincomb2,psbossnames[1][2][4],1,1)
end


--бес, счетчик урона
if arg2=="DAMAGE_SHIELD" or arg2=="SPELL_PERIODIC_DAMAGE" or arg2=="SPELL_DAMAGE" or arg2=="RANGE_DAMAGE" then
if arg12 then
local id=psGetUnitID(arg6)
if id==49740 then
local source=psgetpetownername(arg3, arg4, arg5)
psbesdmgadd(source,arg6,arg12,arg13,arg7)
end
end
end


if arg2=="SWING_DAMAGE" then
if arg9 then
local id=psGetUnitID(arg6)
if id==49740 then
local source=psgetpetownername(arg3, arg4, arg5)
psbesdmgadd(source,arg6,arg9,arg10,arg7)
end
end
end

if arg2=="SWING_DAMAGE" or arg2=="SWING_MISSED" then
local id=psGetUnitID(arg3)
if id==49740 then
	local bil=0
	if #psbesatrameddmg1>0 then
		for i=1,#psbesatrameddmg1 do
			if arg3==psbesatrameddmg1[i] then
				bil=1
			end
		end
	end
	if bil==0 then
		table.insert(psbesatrameddmg1,arg3)
		table.insert(psbesatrameddmg2,arg7)

		if #psbesatrameddmgid>0 then
			for j=1,#psbesatrameddmgid do
				if psbesatrameddmgid[j]==arg3 then
					local aa=string.find(pssidamageinf_title2[pssavedplayerpos][1][j],"%(")
					pssidamageinf_title2[pssavedplayerpos][1][j]=string.sub(pssidamageinf_title2[pssavedplayerpos][1][j],1,aa)..arg7..")"
				end
			end
		end
	end
end
end

--конец урон в беса

-- анонс бес на мне
if arg2=="SWING_DAMAGE" or arg2=="SWING_MISSED" and psforsaannounce1 then
local id=psGetUnitID(arg3)
if id==49740 then
	local bil=0
	if #psforsaannounce1>0 then
		for i=1,#psforsaannounce1 do
			if psforsaannounce1[i]==arg7 then
				if GetTime()>psforsaannounce2[i] then
					bil=1
				else
					psforsaannounce2[i]=GetTime()+12
					bil=2
				end
			end
		end
	end
	if bil==0 then
		table.insert(psforsaannounce1,arg7)
		table.insert(psforsaannounce2,GetTime()+12)
	end
	if bil==0 or bil==1 then
		if ps_saoptions[1][2][4][2]==1 then
			ps_sa_sendinfo(arg7, arg4.." "..psmain_sa_phrase1, 5, nil, nil)
		end
	end
end
end


end