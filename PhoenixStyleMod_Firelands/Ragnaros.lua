psbossfile57=1
function pscmrboss571(guid2,name2,spellid,spellname)
if pswasonboss57==nil then
	pswasonboss57=1
end
psunitisplayer(guid2,name2)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss57~=2 then
		psiccwipereport_2("wipe", "try")
	end
		addtotwotables(name2)
		vezaxsort1()
		pscaststartinfo(0,spellname..": "..psaddcolortxt(1,name2)..name2..psaddcolortxt(2,name2), -1, "id1", 1, spellname.." - "..psinfo,psbossnames[1][5][7],2)
end
end

function pscmrboss572(guid2,name2,spellid,spellname)
if pswasonboss57==nil then
	pswasonboss57=1
end
psunitisplayer(guid2,name2)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss57~=2 then
		psiccwipereport_2("wipe", "try")
	end
		if pswasonboss57 and pswasonboss57==1 then
			if psraidoptionson[1][5][7][5]==1 then
				pszapuskanonsa(psraidchats3[psraidoptionschat[1][5][7][5]], "{rt8} "..name2.." "..psfirelgotinm.." |s4id"..spellid.."|id")
			end
		end
		addtotwotables2(name2)
		vezaxsort2()
		pscaststartinfo(0,spellname..": "..psaddcolortxt(1,name2)..name2..psaddcolortxt(2,name2), -1, "id1", 2, spellname.." - "..psinfo,psbossnames[1][5][7],2)
end
end


function pscmrboss573(guid2,name2,spellid,spellname)
if pswasonboss57==nil then
	pswasonboss57=1
end
psunitisplayer(guid2,name2)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss57~=2 then
		psiccwipereport_2("wipe", "try")
	end
		if pswasonboss57 and pswasonboss57==1 then
			if psraidoptionson[1][5][7][7]==1 then
				pszapuskanonsa(psraidchats3[psraidoptionschat[1][5][7][7]], "{rt8} "..name2.." "..psfirelgotinm.." |s4id"..spellid.."|id")
			end
		end
		addtotwotables3(name2)
		vezaxsort3()
		pscaststartinfo(0,spellname..": "..psaddcolortxt(1,name2)..name2..psaddcolortxt(2,name2), -1, "id1", 3, spellname.." - "..psinfo,psbossnames[1][5][7],2)
end
end


function pscmrboss574(guid2,name2,spellid,spellname)
if pswasonboss57==nil then
	pswasonboss57=1
end
psunitisplayer(guid2,name2)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss57~=2 then
		psiccwipereport_2("wipe", "try")
	end
		addtotwotables4(name2)
		vezaxsort4()
		pscaststartinfo(0,spellname..": "..psaddcolortxt(1,name2)..name2..psaddcolortxt(2,name2), -1, "id1", 4, spellname.." - "..psinfo,psbossnames[1][5][7],2)
end
end

function pscmrboss575(guid2,name2,spellid,spellname)
if pswasonboss57==nil then
	pswasonboss57=1
end
psunitisplayer(guid2,name2)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss57~=2 then
		psiccwipereport_2("wipe", "try")
	end
		addtotwotables5(name2)
		vezaxsort5()
		pscaststartinfo(0,spellname..": "..psaddcolortxt(1,name2)..name2..psaddcolortxt(2,name2), -1, "id1", 5, spellname.." - "..psinfo,psbossnames[1][5][7],2)
end
end

function pscmrboss576(guid2,name2,spellid,spellname)
if pswasonboss57==nil then
	pswasonboss57=1
end
psunitisplayer(guid2,name2)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss57~=2 then
		psiccwipereport_2("wipe", "try")
	end
		addtotwotables6(name2)
		vezaxsort6()
		pscaststartinfo(0,spellname..": "..psaddcolortxt(1,name2)..name2..psaddcolortxt(2,name2), -1, "id1", 6, spellname.." - "..psinfo,psbossnames[1][5][7],2)
end
end


function pscmrbossREPORT571(wipe,try,reset,checkforwipe)
if reset==nil then
if checkforwipe==nil or (checkforwipe and pswasonboss57 and pswasonboss57==1) then

	if pslivemeteorname==nil then pslivemeteorname="Live Meteor" end

	if pswasonboss57==1 then
		pssetcrossbeforereport1=GetTime()
		if psraidoptionson[1][5][7][4]==1 then
			strochkavezcrash=psfireldamagefrom.." |s4id98170,101233,101234,101235|id: "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][5][7][4]], true, vezaxname, vezaxcrash, 1)
		end
		if psraidoptionson[1][5][7][6]==1 then
			strochkavezcrash=psfireldamagefrom.." |s4id98928,100292,100293,100294|id: "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][5][7][6]], true, vezaxname2, vezaxcrash2, 1)
		end
		if psraidoptionson[1][5][7][8]==1 then
			strochkavezcrash=psfireldamagefrom.." |s4id98708,100256,100257,100258|id: "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][5][7][8]], true, vezaxname3, vezaxcrash3, 1)
		end
		if psraidoptionson[1][5][7][9]==1 then
			strochkavezcrash=psfireldamagefrom.." |s4id100455,101229,101230,101231|id: "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][5][7][9]], true, vezaxname4, vezaxcrash4, 1)
		end
		if psraidoptionson[1][5][7][10]==1 then
			strochkavezcrash=psfireldamagefrom.." |s4id99224,100187,100188,100189|id: "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][5][7][10]], true, vezaxname5, vezaxcrash5, 1)
		end
		if psraidoptionson[1][5][7][11]==1 then
			strochkavezcrash=psfireldamagefrom.." |s4id99287,100299,100300,100301|id: "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][5][7][11]], true, vezaxname6, vezaxcrash6, 1)
		end
		if psraidoptionson[1][5][7][1]==1 then
		if psdamagevalue2 and psdamagevalue2[1] and psdamagevalue2[1]>250000 then
			if string.find(psiccinst,psiccheroic)==nil then
				strochkadamageout=psfiremaybeexcessd.." "..pslivemeteorname..": "
				reportfromtwodamagetables(psraidchats3[psraidoptionschat[1][5][7][1]], 1, 250000,nil, true)
			end
		end
		end




	end
	if pswasonboss57==1 or (pswasonboss57==2 and try==nil) then

		psiccsavinginf(psbossnames[1][5][7], try, pswasonboss57)

		strochkavezcrash=psfireldamagefrom.." |s4id98170,101233,101234,101235|id: "
		reportafterboitwotab("raid", true, vezaxname, vezaxcrash, nil, nil,0,1)
		strochkavezcrash=psfireldamagefrom.." |s4id98928,100292,100293,100294|id: "
		reportafterboitwotab("raid", true, vezaxname2, vezaxcrash2, nil, nil,0,1)
		strochkavezcrash=psfireldamagefrom.." |s4id98708,100256,100257,100258|id: "
		reportafterboitwotab("raid", true, vezaxname3, vezaxcrash3, nil, nil,0,1)
		strochkavezcrash=psfireldamagefrom.." |s4id100455,101229,101230,101231|id: "
		reportafterboitwotab("raid", true, vezaxname4, vezaxcrash4, nil, nil,0,1)
		strochkavezcrash=psfireldamagefrom.." |s4id99224,100187,100188,100189|id: "
		reportafterboitwotab("raid", true, vezaxname5, vezaxcrash5, nil, nil,0,1)
		strochkavezcrash=psfireldamagefrom.." |s4id99287,100299,100300,100301|id: "
		reportafterboitwotab("raid", true, vezaxname6, vezaxcrash6, nil, nil,0,1)
		if psdamagevalue2 and psdamagevalue2[1] and psdamagevalue2[1]>250000 then
			strochkadamageout=psfiremaybeexcessd.." "..pslivemeteorname..": "
			reportfromtwodamagetables("raid", 1, 250000, nil, true,0,1)
		end



		psiccrefsvin()

	end




	if wipe then
		pswasonboss57=2
		pscheckbossincombatmcr_2=GetTime()+1
	end
end
end
end


function  pscmrbossRESET571(wipe,try,reset,checkforwipe)
if reset or wipe==nil then
pswasonboss57=nil
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
table.wipe(vezaxname7)
table.wipe(vezaxcrash7)
table.wipe(psdamagename2)
table.wipe(psdamagevalue2)

psragnaadd1=nil
psragnaadd2=nil
psragnaadd3=nil
psragnaadd4=nil
psragnaadd5=nil
psragnaadd6=nil
psragnaadd7=nil

psragnatrap1={}
psragnatrap2={}
psragnatrap3={}
psragnatrap4={}
psragnatrap5={}

psragntorep1=nil
psragntorep2=nil
psragntorep3=nil
psragntorep4=nil
psragntorep5=nil

end
end


function pscombatlogboss57(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)
--local arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15 = ...

--не отбежал от трапы
if arg2=="SPELL_DAMAGE" and (spellid==98170 or spellid==101233 or spellid==101234 or spellid==101235) then
pscmrboss571(guid2,name2,spellid,spellname)
end

--lava wave
if arg2=="SPELL_DAMAGE" and (spellid==98928 or spellid==100292 or spellid==100293 or spellid==100294) then
pscmrboss572(guid2,name2,spellid,spellname)
end

--sulf smash
if arg2=="SPELL_DAMAGE" and (spellid==98708 or spellid==100256 or spellid==100257 or spellid==100258) then
pscmrboss573(guid2,name2,spellid,spellname)
end

--sulf
if arg2=="SPELL_DAMAGE" and (spellid==100455 or spellid==101229 or spellid==101230 or spellid==101231) then
pscmrboss574(guid2,name2,spellid,spellname)
end

--пламя
if arg2=="SPELL_DAMAGE" and (spellid==99224 or spellid==100187 or spellid==100188 or spellid==100189) then
pscmrboss575(guid2,name2,spellid,spellname)
end

--meteor babah
if arg2=="SPELL_DAMAGE" and (spellid==99287 or spellid==100299 or spellid==100300 or spellid==100301) then
pscmrboss576(guid2,name2,spellid,spellname)
end




--сейанонсер
if arg2=="SPELL_CAST_SUCCESS" and (spellid==98164) then
if ps_saoptions[1][5][7][1]==1 then
ps_sa_checktargets(GetTime()+0.17,guid1,0.2,spellname.." "..psmain_sa_phrase1,3,0)
end
end








if arg2=="SPELL_CAST_SUCCESS" and spellid==98164 then
psragnawait10=GetTime()+10
pschecktar=GetTime()+0.2
end

if arg2=="SPELL_SUMMON" and (spellid==98170 or spellid==101233 or spellid==101234 or spellid==101235) then

if pswasonboss57==nil then
	pswasonboss57=1
end

if psragnatarget and psragnawait10 then
table.insert(psragnatrap1,guid2)
table.insert(psragnatrap2,GetTime())
table.insert(psragnatrap3,psposx)
table.insert(psragnatrap4,psposy)
table.insert(psragnatrap5,psragnatarget)
end
end



if arg2=="SPELL_DAMAGE" and (spellid==98175 or spellid==100106 or spellid==100107 or spellid==100108) then

local bil=0
local x2=0
local y2=0

for j=1,#psragnatrap1 do
	if psragnatrap1[j] and psragnatrap1[j]==guid1 then
		x2=psragnatrap3[j]
		y2=psragnatrap4[j]
		table.remove(psragnatrap1,j)
		table.remove(psragnatrap2,j)
		table.remove(psragnatrap3,j)
		table.remove(psragnatrap4,j)
		table.remove(psragnatrap5,j)
		bil=1
	end
end

if bil==1 then
local near1={}
local near2={}
for i=1,GetNumGroupMembers() do
	local x,y=GetPlayerMapPosition(UnitName("raid"..i))
	if x and y and x>0 then
		local dist=math.sqrt(math.pow((x-x2),2)+math.pow((y-y2),2))
		--тест ярдов:
		local yard=dist/0.0006957112131547
		yard=math.ceil(yard*10)/10
		if yard<=8 then
			if UnitName("raid"..i) then
			local a11=UnitName("raid"..i)
				table.insert(near1,a11)
				table.insert(near2,yard)
			end
		end
	end
end
--через 1 сек репорт создаем временные таблицы
if psragntorep1==nil then
psragntorep1={} --ид ловушки
psragntorep2={} --время когда репорт сделать
psragntorep3={} --текст репорта
psragntorep4={} --список тех кто умер
psragntorep5={} --для репорта в фрейме с цветом
end
table.insert(psragntorep1,guid1)
table.insert(psragntorep2,GetTime()+1)

--spellname.." %s."
local tt="" --текст собираю для репорта
local tt2="" --текст для репорта в фрейме
if #near1==0 then
	tt=tt..psfiretrapragna2.." "
	tt2=tt2..psfiretrapragna2.." "
else
	tt=tt..psfiretrapragna1.." "
	tt2=tt2..psfiretrapragna1.." "
	for i=1,#near1 do
		tt=tt..near1[i].." ("..near2[i].." "..psfireyard..")"
		tt2=tt2..psaddcolortxt(1,near1[i])..near1[i]..psaddcolortxt(2,near1[i]).." ("..near2[i].." "..psfireyard..")"
		if #near1==i then
			tt=tt..". "
			tt2=tt2..". "
		else
			tt=tt..", "
			tt2=tt2..", "
		end
	end
end


table.insert(psragntorep3,tt)
table.insert(psragntorep4,{})
table.insert(psragntorep5,tt2)

end


--если убило
if arg13 and arg13>0 and psragntorep1 and #psragntorep1 then
psunitisplayer(guid2,name2)
	local qbil=0
	if psragntorep4 and #psragntorep4>0 then
		for tg=1,#psragntorep4 do
			if psragntorep4[tg]==name2 then
				qbil=1
			end
		end
	end
	if psunitplayertrue then
		for i=1,#psragntorep1 do
			if psragntorep1[i]==guid1 then
				if qbil==0 then
					table.insert(psragntorep4[i],name2)
				end
			end
		end
	end
end




end











--счет урона в метеоры! больше 250к репортим?!
if arg2=="SPELL_DAMAGE" or arg2=="RANGE_DAMAGE" or arg2=="DAMAGE_SHIELD" or arg2=="SPELL_PERIODIC_DAMAGE" then
if arg12 and arg12>1 then
local id=psGetUnitID(guid2)
if id==53500 then
local source=psgetpetownername(guid1, name1, flag1)
addtotwodamagetables(source, arg12)
psdamagetwotablsort1()

end
end
end

if arg2=="SWING_DAMAGE" then
if spellid and spellid>1 then --у свинга урон вместо спел ид отображен!
local id=psGetUnitID(guid2)
if id==53500 then
local source=psgetpetownername(guid1, name1, flag1)
addtotwodamagetables( source, spellid)
psdamagetwotablsort1()
end
end
end



--кто стоял оч близко при откидывании.
if (arg2=="SPELL_DAMAGE" or arg2=="SPELL_MISSED") and (spellid==98263 or spellid==100113 or spellid==100114 or spellid==100115) then
if select(3,GetInstanceInfo())==3 then
psragnamaxdam=1
end
if select(3,GetInstanceInfo())==4 then
psragnamaxdam=3
end
if select(3,GetInstanceInfo())==5 then
psragnamaxdam=2
end
if select(3,GetInstanceInfo())==6 then
psragnamaxdam=5
end

psunitisplayer(guid2,name2)
if psunitplayertrue then

psragnahishandtimer=GetTime()+1

if psragnahishand1==nil then
	psragnahishand1={} --ник кого отбросил
	psragnahishand2={} --координаты игрока X
	psragnahishand3={} --координаты игрока Y
end

local obil=0
if #psragnahishand1>0 then
	for i=1,#psragnahishand1 do
		if psragnahishand1[i]==name2 then
			obil=1
		end
	end
end
if obil==0 then
table.insert(psragnahishand1,name2)
local x,y=GetPlayerMapPosition(name2)
table.insert(psragnahishand2,x)
table.insert(psragnahishand3,y)
end


end

end




end