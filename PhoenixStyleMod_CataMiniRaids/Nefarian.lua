psbossfile26=1

function psnefdominadddmg(i,arg4,arg10)
if arg4==nil then
	arg4=psiccunknown
end
	if pscmrnefdominion6[i] then
		local bil=0
		for j=1,#pscmrnefdominion6[i] do
			if pscmrnefdominion6[i][j]==arg4 then
				bil=1
				pscmrnefdominion7[i][j]=pscmrnefdominion7[i][j]+arg10
				psnefdominsort(i)
			end
		end
		if bil==0 then
			table.insert(pscmrnefdominion7[i],arg10)
			table.insert(pscmrnefdominion6[i],arg4)
			psnefdominsort(i)
		end
	end
end

function psnefdominsort(i)
local vzxnn= #pscmrnefdominion6[i]
while vzxnn>1 do
if pscmrnefdominion7[i][vzxnn]>pscmrnefdominion7[i][vzxnn-1] then
local vezaxtemp1=pscmrnefdominion7[i][vzxnn-1]
local vezaxtemp2=pscmrnefdominion6[i][vzxnn-1]
pscmrnefdominion7[i][vzxnn-1]=pscmrnefdominion7[i][vzxnn]
pscmrnefdominion6[i][vzxnn-1]=pscmrnefdominion6[i][vzxnn]
pscmrnefdominion7[i][vzxnn]=vezaxtemp1
pscmrnefdominion6[i][vzxnn]=vezaxtemp2
end
vzxnn=vzxnn-1
end
end


function pscmrboss261(arg6,arg7)
psunitisplayer(arg6,arg7)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss26~=2 then
		psiccwipereport("wipe", "try")
	end
		addtotwotables(arg7)
		vezaxsort1()
end
end


function pscmrboss262(arg6,arg7,arg13)
psunitisplayer(arg6,arg7)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss26~=2 then
		psiccwipereport("wipe", "try")
	end

		--проверка что человек без бомбы
		local ok=0
		if #psnefmagmaignor1>0 then
			for nb=1,#psnefmagmaignor1 do
				if psnefmagmaignor1[nb]==arg7 then
					if psnefmagmaignor2[nb]>GetTime() then
						ok=1
					end
				end
			end
		end
		if ok==0 then
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
end



function nefdominionwork(i)

				local spelname1=GetSpellInfo(79318)
				local ttime=pscmrnefdominion3[i]-pscombatstarttime
				--что-то не так с инфой, ничего не делаем...
				if pscmrnefdominion5[i]==1 then
				elseif pscmrnefdominion5[i]==3 then
					--прописать аое нефа зеленым
					pscaststartinfo(0,pscmrnefdominion6[i][1], 0, "id1", 23, spelname1.." - "..psinfo,psbossnames[1][2][6],nil,nil,nil,nil,nil,ttime)
					psnefdomwas=1
				elseif pscmrnefdominion5[i]==4 then
					--прописать 3 зеленые полоски
					pscaststartinfo(0,"---", 0, "id1", 23, spelname1.." - "..psinfo,psbossnames[1][2][6],nil,nil,nil,nil,nil,ttime)
					psnefdomwas=1
				elseif pscmrnefdominion5[i]==2 and pscmrnefdominion3[i]~=0 then
					--сделать норм запись

					--Доминион 1: Шуршик, в контроле: 14 сек. (прожал бафф через: 0.5) Снято: неизвестно/ УМЕР! Умер через 1.3 после снятия. 80627 Похищенная сила: ? - ? Урон от: .... ник цветной


					local txt=spelname1.." %s: "..psaddcolortxt(1,pscmrnefdominion1[i])..pscmrnefdominion1[i]..psaddcolortxt(2,pscmrnefdominion1[i])..", "
					local inmc=0
					local inmc=math.ceil((pscmrnefdominion3[i]-pscmrnefdominion2[i])*10)/10
					--если нет стаков и время более N сек пишем красным
					local write="?"
					if inmc>0 then
						write=inmc
					end
					if pscmrnefdominion9[i]<0 and inmc>1.5 then
						write="|cffff0000"..inmc.."|r"
					end
					txt=txt..pscmrnefdom4..": "..write.." "..pssec.." "

					--потеря времени перед прожатием
					local losttime=0
					if pscmrnefdominion12[i]>0 then
						losttime=math.ceil((pscmrnefdominion12[i]-pscmrnefdominion2[i])*10)/10
						if losttime>1.5 then
							losttime="|cffff0000"..losttime.."|r"
						end
						txt=txt.."("..pscmrnefdom5..": "..losttime.."). "
					end

					if pscmrnefdominion10[i]>0 and pscmrnefdominion11[i]==0 then
					elseif pscmrnefdominion10[i]==0 and pscmrnefdominion11[i]==0 then
						if inmc>18 then
						else
							txt=txt.."|cffff0000"..pscmrnefdom1.."|r. "
						end
					elseif pscmrnefdominion10[i]==0 and pscmrnefdominion11[i]>0 then
						txt=txt.."|cffff0000"..pscmrnefdom2.."|r. "
					elseif pscmrnefdominion10[i]>0 and pscmrnefdominion11[i]>0 then
						local inmc2=math.ceil((pscmrnefdominion11[i]-pscmrnefdominion10[i])*10)/10
						txt=txt.."|cffff0000"..format(pscmrnefdom3,inmc2).."|r. "
					end

					--похищенная сила
					local spr1=GetSpellInfo(80627)
					txt=txt..spr1..": "
					local ff=""
					if pscmrnefdominion8[i]>=0 then
						ff=ff..pscmrnefdominion8[i].." - "
						if pscmrnefdominion9[i]>=0 then
							ff=ff..pscmrnefdominion9[i]..". "
						else
							if pscmrnefdominion8[i]<150 then
								ff=ff..(pscmrnefdominion8[i]+1)..". "
							else
								ff=ff..(pscmrnefdominion8[i])..". "
							end
						end
					else
						ff=ff.."? - ? "
					end
					txt=txt..ff


					if #pscmrnefdominion6[i]>0 and pscmrnefdominion7[i][1]>3000 then
						--урон от
						txt=txt..psiccdmgfrom..": "
						local max=7
						for j=1,#pscmrnefdominion6[i] do
							if max>j and (pscmrnefdominion7[i][j]>3000 or j==1) then
								if j>1 then
									txt=txt..", "
								end
								local dmmg="?"
								if (string.len(pscmrnefdominion7[i][j])) > 3 then
									dmmg=string.sub(pscmrnefdominion7[i][j], 1, string.len(pscmrnefdominion7[i][j])-3)
									dmmg=dmmg.."k"
								else
									dmmg=pscmrnefdominion7[i][j]
								end
								txt=txt..psaddcolortxt(1,pscmrnefdominion6[i][j])..pscmrnefdominion6[i][j]..psaddcolortxt(2,pscmrnefdominion6[i][j]).." ("..dmmg..")"
							end
						end
						txt=txt.."."
					end
					pscaststartinfo(0,txt, -1, "id55", 23, spelname1.." - "..psinfo,psbossnames[1][2][6],2,nil,nil,nil,nil,ttime)
					psnefdomwas=1
				end


					table.remove(pscmrnefdominion1,i)
					table.remove(pscmrnefdominion2,i)
					table.remove(pscmrnefdominion3,i)
					table.remove(pscmrnefdominion4,i)
					table.remove(pscmrnefdominion5,i)
					table.remove(pscmrnefdominion6,i)
					table.remove(pscmrnefdominion7,i)
					table.remove(pscmrnefdominion8,i)
					table.remove(pscmrnefdominion9,i)
					table.remove(pscmrnefdominion10,i)
					table.remove(pscmrnefdominion11,i)
					table.remove(pscmrnefdominion12,i)
end



function psneffunccaststart(arg3,arg10,arg4,arg9)
local bbb=0
local bil=1




if psnefariantabl1 then
if #psnefariantabl1>0 then
	for i=1,#psnefariantabl1 do
		if psnefariantabl1[i]==arg3 then
			bil=i
			bbb=1
		end
	end
else
	psnefariantabltime=GetTime()
end

if bbb==0 then
	table.insert(psnefariantabl1,arg3)
	bil=#psnefariantabl1
end
end


pscheckrunningbossid(arg3)
pscaststartinfo(arg9,arg10..": %s.", 2.5, arg3, bil, arg4.." ("..psmob1.." "..bil.."): "..pscmreventsincomb2,psbossnames[1][2][6])
pshromoaddname=arg4
end


function psnefswingtrack(arg6,arg4)
		local bil=0
		for i=1,#psnefariantabl1 do
			if psnefariantabl1[i]==arg6 then
				if #psnefariantabl2[i]==0 then
					SetMapToCurrentZone()
					local locx2, locy2 = GetPlayerMapPosition(arg4)
					if locx2~=0 then
						table.insert(psnefariantabl2[i],locx2)
						table.insert(psnefariantabl2[i],locy2)
						bil=1
					end
				end
			end
		end
		if bil==1 then
			if psnefariantabl2[1][1] and psnefariantabl2[2][1] and psnefariantabl2[3][1] then
				psnefariantabltime=nil

				local pleft=0
				local pright=0
				local pbottom=0
				if psnefariantabl2[1][1]<psnefariantabl2[2][1] and psnefariantabl2[1][1]<psnefariantabl2[3][1] then
					pleft=1
				elseif psnefariantabl2[2][1]<psnefariantabl2[1][1] and psnefariantabl2[2][1]<psnefariantabl2[3][1] then
					pleft=2
				elseif psnefariantabl2[3][1]<psnefariantabl2[1][1] and psnefariantabl2[3][1]<psnefariantabl2[2][1] then
					pleft=3
				end

				if psnefariantabl2[1][1]>psnefariantabl2[2][1] and psnefariantabl2[1][1]>psnefariantabl2[3][1] then
					pright=1
				elseif psnefariantabl2[2][1]>psnefariantabl2[1][1] and psnefariantabl2[2][1]>psnefariantabl2[3][1] then
					pright=2
				elseif psnefariantabl2[3][1]>psnefariantabl2[1][1] and psnefariantabl2[3][1]>psnefariantabl2[2][1] then
					pright=3
				end

				if psnefariantabl2[1][2]>psnefariantabl2[2][2] and psnefariantabl2[1][2]>psnefariantabl2[3][2] then
					pbottom=1
				elseif psnefariantabl2[2][2]>psnefariantabl2[1][2] and psnefariantabl2[2][2]>psnefariantabl2[3][2] then
					pbottom=2
				elseif psnefariantabl2[3][2]>psnefariantabl2[1][2] and psnefariantabl2[3][2]>psnefariantabl2[2][2] then
					pbottom=3
				end

				if pleft>0 and pright>0 and pbottom>0 and pbottom~=pleft and pleft~=pright and pbottom~=pright then
					local add=0
					if psnefdomwas and psnefdomwas==1 then
						add=1
					end
          local playerid=0
          for vv=1,#pssisavedfailsplayern[2] do
            if pssisavedfailsplayern[2][vv]==UnitGUID("player") then
              playerid=vv
            end
          end
					pssicombatin_title2[playerid][1][pleft+add+1]=pshromoaddname.." ("..pscmraddsign1.."): "..pscmreventsincomb2
					pssicombatin_title2[playerid][1][pright+add+1]=pshromoaddname.." ("..pscmraddsign2.."): "..pscmreventsincomb2
					pssicombatin_title2[playerid][1][pbottom+add+1]=pshromoaddname.." ("..pscmraddsign3.."): "..pscmreventsincomb2

psupdateframewithnewinfo()
				end

			end
		end
end





function pscmrbossREPORT261(wipe,try,reset,checkforwipe)
if reset==nil then
if checkforwipe==nil or (checkforwipe and pswasonboss26 and pswasonboss26==1) then

	if pswasonboss26==1 then
		pssetcrossbeforereport1=GetTime()
		--тут репорт
		if psraidoptionson[1][2][6][1]==1 then
			strochkavezcrash=pscmrtxtoptt261.." "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][2][6][1]], true, vezaxname, vezaxcrash, 1)
		end
		if psraidoptionson[1][2][6][2]==1 then
			strochkavezcrash=pscmrtxtoptt262.." "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][2][6][2]], true, vezaxname2, vezaxcrash2, 1)
		end
		if psraidoptionson[1][2][6][5]==1 then
			strochkavezcrash=pscmrtxtoptt265..": "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][2][6][5]], true, vezaxname3, vezaxcrash3, 1)
		end
		if psraidoptionson[1][2][6][6]==1 then
			strochkavezcrash=pscmrtxtoptt266..": "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][2][6][6]], true, vezaxname5, vezaxcrash5, 1)
		end

	end
	if pswasonboss26==1 or (pswasonboss26==2 and try==nil) then

	psiccsavinginf(psbossnames[1][2][6], try, pswasonboss26)
		--тут сохранение
		strochkavezcrash=pscmrtxtoptt261.." "
		reportafterboitwotab("raid", true, vezaxname, vezaxcrash, nil, nil,0,1)
		strochkavezcrash=pscmrtxtoptt262.." "
		reportafterboitwotab("raid", true, vezaxname2, vezaxcrash2, nil, nil,0,1)
		strochkavezcrash=pscmrtxtoptt265..": "
		reportafterboitwotab("raid", true, vezaxname3, vezaxcrash3, nil, nil,0,1)
		strochkavezcrash=pscmrtxtoptt266..": "
		reportafterboitwotab("raid", true, vezaxname5, vezaxcrash5, nil, nil,0,1)
	psiccrefsvin()

	end

	if wipe then
		pswasonboss26=2
		pscheckbossincombatmcr=GetTime()+1
	end
end
end
end


function  pscmrbossRESET261(wipe,try,reset,checkforwipe)
if reset or wipe==nil then
pswasonboss26=nil
table.wipe(vezaxname)
table.wipe(vezaxcrash)
table.wipe(vezaxname2)
table.wipe(vezaxcrash2)
table.wipe(vezaxname3)
table.wipe(vezaxcrash3)
--4 занят
table.wipe(vezaxname5)
table.wipe(vezaxcrash5)
end
end


function pscombatlogboss26(...)
arg1, arg2, argnew1, arg3,arg4,arg5,argNEW,arg6,arg7,arg8,argNEW2,arg9,arg10,arg11,arg12,arg13,arg14, arg15 = ...



if arg2=="SPELL_CAST_START" and arg9==80734 and psraidoptionson[1][2][6][3]==1 then
psneffunccaststart(arg3,arg10,arg4,arg9)
end

--nef coords getting
if psnefariantabl1 and #psnefariantabl1>1 and psnefariantabltime then
	if arg2=="SWING_DAMAGE" and UnitInRaid(arg4) then
		psnefswingtrack(arg6,arg4)
	end
end

if (arg2=="SPELL_DAMAGE" or (arg2=="SPELL_MISSED" and arg12 and arg12=="ABSORB")) and onyxidspellname and arg10==onyxidspellname then
pscmrboss261(arg6,arg7)
end

if arg2=="SPELL_AURA_APPLIED_DOSE" and (arg9==81118 or arg9==94073 or arg9==94074 or arg9==94075) and arg13 and pswasonboss26 then
pscmrboss262(arg6,arg7,arg13)
end

if arg2=="SPELL_CAST_START" and arg9==79339 then
psnefbombdelay=GetTime()+12
table.wipe(vezaxname4)
table.wipe(vezaxcrash4)
end

if arg2=="SPELL_AURA_APPLIED" and arg9==79339 then
if ps_saoptions[1][2][6][1]==1 then
ps_sa_sendinfo(arg7, arg10.." "..psmain_sa_phrase1, 5, nil, nil)
end
local bil=0
if #psnefmagmaignor1>0 then
	for i=1,#psnefmagmaignor1 do
		if psnefmagmaignor1[i]==arg7 then
			psnefmagmaignor2[i]=GetTime()+20
			bil=1
		end
	end
end
if bil==0 then
	table.insert(psnefmagmaignor1,arg7)
	table.insert(psnefmagmaignor2,GetTime()+20)
end
end

if arg2=="SPELL_DAMAGE" and arg9==79347 then
psunitisplayer(arg6,arg7)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss26~=2 then
		psiccwipereport("wipe", "try")
	end
		addtotwotables3(arg4)
		vezaxsort3()
		if psnefbombdelay then
			addtotwotables4(arg4)
			vezaxsort4()
		end
local bil=0
if #psnefmagmaignor1>0 then
	for i=1,#psnefmagmaignor1 do
		if psnefmagmaignor1[i]==arg7 then
			psnefmagmaignor2[i]=GetTime()+20
			bil=1
		end
	end
end
if bil==0 then
	table.insert(psnefmagmaignor1,arg7)
	table.insert(psnefmagmaignor2,GetTime()+20)
end

end
end


--господство

--каст господства, для разделения
if arg2=="SPELL_CAST_START" and arg9==79318 then
psiccschet1=psiccschet1+1
if psiccschet1>1 then
table.insert(pscmrnefdominion1,"0")
table.insert(pscmrnefdominion2,0)
table.insert(pscmrnefdominion3,GetTime())
table.insert(pscmrnefdominion4,GetTime()+5)
table.insert(pscmrnefdominion5,4)
table.insert(pscmrnefdominion6,{})
table.insert(pscmrnefdominion7,{})
table.insert(pscmrnefdominion8,-1)
table.insert(pscmrnefdominion9,-1)
table.insert(pscmrnefdominion10,0)
table.insert(pscmrnefdominion11,0)
table.insert(pscmrnefdominion12,0)
end
end

--наложение господства
if arg2=="SPELL_AURA_APPLIED" and arg9==79318 then
if #pscmrnefdominion1>0 then
	local i=1
	while i<=#pscmrnefdominion1 do
		if pscmrnefdominion1[i]==arg7 then
			if pscmrnefdominion5[i]==1 then
				table.remove(pscmrnefdominion1,i)
				table.remove(pscmrnefdominion2,i)
				table.remove(pscmrnefdominion3,i)
				table.remove(pscmrnefdominion4,i)
				table.remove(pscmrnefdominion5,i)
				table.remove(pscmrnefdominion6,i)
				table.remove(pscmrnefdominion7,i)
				table.remove(pscmrnefdominion8,i)
				table.remove(pscmrnefdominion9,i)
				table.remove(pscmrnefdominion10,i)
				table.remove(pscmrnefdominion11,i)
				table.remove(pscmrnefdominion12,i)
			elseif pscmrnefdominion5[i]==2 then
				nefdominionwork(i)
				i=1000
			end
		end
	i=i+1
	end
end

--добавление инфы
table.insert(pscmrnefdominion1,arg7)
table.insert(pscmrnefdominion2,GetTime())
table.insert(pscmrnefdominion3,0)
table.insert(pscmrnefdominion4,0)
table.insert(pscmrnefdominion5,1)
table.insert(pscmrnefdominion6,{})
table.insert(pscmrnefdominion7,{})
table.insert(pscmrnefdominion8,-1)
table.insert(pscmrnefdominion9,-1)
table.insert(pscmrnefdominion10,0)
table.insert(pscmrnefdominion11,0)
table.insert(pscmrnefdominion12,0)
end

--снятие господства
if arg2=="SPELL_AURA_REMOVED" and arg9==79318 then
if #pscmrnefdominion1>0 then
	for i=1,#pscmrnefdominion1 do
		if pscmrnefdominion1[i]==arg7 then
			pscmrnefdominion3[i]=GetTime()
			pscmrnefdominion4[i]=GetTime()+5
			pscmrnefdominion5[i]=2
			local timetoadd=math.ceil((GetTime()-pscmrnefdominion2[i])*10)/10
			addtotwotables5(arg7,timetoadd)
			vezaxsort5()
		end
	end
end
end


--аое нефа
if arg2=="SPELL_CAST_SUCCESS" and (arg9==94089 or arg9==94090) then
table.insert(pscmrnefdominion1,"0")
table.insert(pscmrnefdominion2,0)
table.insert(pscmrnefdominion3,GetTime())
table.insert(pscmrnefdominion4,GetTime()+5)
table.insert(pscmrnefdominion5,3)
table.insert(pscmrnefdominion6,{arg10})
table.insert(pscmrnefdominion7,{})
table.insert(pscmrnefdominion8,-1)
table.insert(pscmrnefdominion9,-1)
table.insert(pscmrnefdominion10,0)
table.insert(pscmrnefdominion11,0)
table.insert(pscmrnefdominion12,0)
end

--получение стаков
if arg2=="SPELL_AURA_APPLIED" and (arg9==80627 or arg9==80591 or arg9==80592 or arg9==80621 or arg9==80622 or arg9==80623 or arg9==80624 or arg9==80625 or arg9==80626 or arg9==80573) then
if #pscmrnefdominion1>0 then
	for i=1,#pscmrnefdominion1 do
		if pscmrnefdominion1[i]==arg7 then
			if pscmrnefdominion8[i]==-1 then
				pscmrnefdominion8[i]=0
			end
		end
	end
end
end

if arg2=="SPELL_AURA_APPLIED_DOSE" and (arg9==80627 or arg9==80591 or arg9==80592 or arg9==80621 or arg9==80622 or arg9==80623 or arg9==80624 or arg9==80625 or arg9==80626 or arg9==80573) and arg13 then
if #pscmrnefdominion1>0 then
	for i=1,#pscmrnefdominion1 do
		if pscmrnefdominion1[i]==arg7 then
			if pscmrnefdominion8[i]==-1 then
				if arg13>2 then
					arg13=arg13-1
				end
				pscmrnefdominion8[i]=arg13
			else
				if arg13>pscmrnefdominion9[i] then
					pscmrnefdominion9[i]=arg13
				end
			end
		end
	end
end
end

--рефреш бывает только когда 150 стаков
if arg2=="SPELL_AURA_REFRESH" and (arg9==80627 or arg9==80591 or arg9==80592 or arg9==80621 or arg9==80622 or arg9==80623 or arg9==80624 or arg9==80625 or arg9==80626 or arg9==80573) then
if #pscmrnefdominion1>0 then
	for i=1,#pscmrnefdominion1 do
		if pscmrnefdominion1[i]==arg7 then
			if pscmrnefdominion8[i]==-1 then
				pscmrnefdominion8[i]=150
				pscmrnefdominion9[i]=150
			else
				if 150>pscmrnefdominion9[i] then
					pscmrnefdominion9[i]=150
				end
			end
		end
	end
end
end

--получение урона, от игроков, пламени и прочего зависимо от типа счетчика
if (arg2=="SPELL_DAMAGE" or arg2=="RANGE_DAMAGE" or arg2=="DAMAGE_SHIELD" or arg2=="SPELL_PERIODIC_DAMAGE") and arg12>1 then
	if #pscmrnefdominion1>0 then
		for i=1,#pscmrnefdominion1 do
			if pscmrnefdominion1[i] and pscmrnefdominion1[i]==arg7 then
			if pscmrnefdominion5[i]==2 then
				if ((arg4 and UnitInRaid(arg4)) or (arg9==94087 or arg9==94086)) then
					psnefdominadddmg(i,arg4,arg12)
				end
			elseif pscmrnefdominion5[i]==1 then
				psnefdominadddmg(i,arg4,arg12)
			end
			end
		end
	end
end

if arg2=="SWING_DAMAGE" and arg10>1 then
	if #pscmrnefdominion1>0 then
		for i=1,#pscmrnefdominion1 do
			if pscmrnefdominion1[i] and pscmrnefdominion1[i]==arg7 then
			if pscmrnefdominion5[i]==2 then
				if ((arg4 and UnitInRaid(arg4)) or (arg9==94087 or arg9==94086)) then
					psnefdominadddmg(i,arg4,arg9)
				end
			elseif pscmrnefdominion5[i]==1 then
				psnefdominadddmg(i,arg4,arg9)
			end
			end
		end
	end
end




--прожимал снятие контроля
if arg2=="SPELL_CAST_SUCCESS" and arg9==79323 then
if #pscmrnefdominion1>0 then
	for i=1,#pscmrnefdominion1 do
		if pscmrnefdominion1[i]==arg4 then
			pscmrnefdominion10[i]=GetTime()
		end
	end
end
end



--умер!
if arg2=="UNIT_DIED" then
local dead=arg7
if #pscmrnefdominion1>0 then
	for i=1,#pscmrnefdominion1 do
		if pscmrnefdominion1[i]==dead then
			pscmrnefdominion11[i]=GetTime()
		end
	end
end
end


--исп 1 абилку
if arg2=="SPELL_CAST_SUCCESS" and arg9==79319 then
if #pscmrnefdominion1>0 then
	for i=1,#pscmrnefdominion1 do
		if pscmrnefdominion1[i]==arg4 then
			if pscmrnefdominion12[i]==0 then
				pscmrnefdominion12[i]=GetTime()
			end
		end
	end
end
end





end