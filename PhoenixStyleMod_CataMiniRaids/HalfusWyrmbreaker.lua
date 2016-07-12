psbossfile31=1
function pscmrboss311(arg6,arg7,arg10)
psunitisplayer(arg6,arg7)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss31 and pswasonboss31~=2 then
		psiccwipereport("wipe", "try")
	end
		if pswasonboss31==nil then
			pswasonboss31=1
		end
		if psraidoptionson[1][3][1][2]==1 then
			pscaststartinfo(0,arg10, -1, "id1", 2, arg10.." - "..psinfo,psbossnames[1][3][1],1,arg7)
		end
		addtotwotables(arg7)
		vezaxsort1()
end
end






function pscmrbossREPORT311(wipe,try,reset,checkforwipe)
if reset==nil then
if checkforwipe==nil or (checkforwipe and pswasonboss31 and pswasonboss31==1) then

	if pswasonboss31==1 then
		pssetcrossbeforereport1=GetTime()
		--тут репорт
		if psraidoptionson[1][3][1][1]==1 then
			strochkavezcrash=pscmrtxtoptt311.." "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][3][1][1]], true, vezaxname, vezaxcrash, 1)
		end

	end
	if pswasonboss31==1 or (pswasonboss31==2 and try==nil) then

	psiccsavinginf(psbossnames[1][3][1], try, pswasonboss31)
		--тут сохранение
	strochkavezcrash=pscmrtxtoptt311.." "
	reportafterboitwotab("raid", true, vezaxname, vezaxcrash, nil, nil,0,1)

	psiccrefsvin()

	end

	if wipe then
		pswasonboss31=2
		pscheckbossincombatmcr=GetTime()+1
	end
end
end
end


function  pscmrbossRESET311(wipe,try,reset,checkforwipe)
if reset or wipe==nil then
pswasonboss31=nil
--тут резет
table.wipe(vezaxname)
table.wipe(vezaxcrash)
end
end



function pscombatlogboss31(...)
local arg1, arg2, argnew1, arg3,arg4,arg5,argNEW,arg6,arg7,arg8,argNEW2,arg9,arg10,arg11,arg12,arg13,arg14, arg15 = ...


if pstrackcasthalf==nil and arg2=="SPELL_CAST_START" and (arg9==86058 or arg9==83862) then
pstrackcasthalf=1
pstrackfirstcasthalf1={}
pstrackfirstcasthalf2={}
pstrackfirstcasthalf3={}
end

--трекерим все касты сбиваний что пытались сбить 1 каст босса
if pstrackfirstcasthalf1 then
if arg2=="SPELL_CAST_SUCCESS" and (arg9==57994 or arg9==2139 or arg9==6552 or arg9==26090 or arg9==1766 or arg9==72 or arg9==47528 or arg9==85285 or arg9==34490 or arg9==24259 or arg9==19647 or arg9==31935 or arg9==41378) then
local id=psGetUnitID(arg6)
if id==44600 then
if #pstrackfirstcasthalf1>0 then
	local bil=0
	for i=1,#pstrackfirstcasthalf1 do
		if pstrackfirstcasthalf1[i]==arg4 then
			pstrackfirstcasthalf2[i]=GetTime()
			pstrackfirstcasthalf3[i]=arg10
			bil=1
		end
	end
	if bil==0 then
		table.insert(pstrackfirstcasthalf1,arg4)
		table.insert(pstrackfirstcasthalf2,GetTime())
		table.insert(pstrackfirstcasthalf3,arg10)
	end
else
	table.insert(pstrackfirstcasthalf1,arg4)
	table.insert(pstrackfirstcasthalf2,GetTime())
	table.insert(pstrackfirstcasthalf3,arg10)
end
end
end
end


--halfus
if arg2=="SPELL_CAST_START" and (arg9==83703 or arg9==86166 or arg9==86167 or arg9==86168) and psraidoptionson[1][3][1][2]==1 then
pshalfustimes=GetTime()
pscheckrunningbossid(arg3)
pscaststartinfo(arg9,arg10..": %s.", 2.5, arg3, 1, arg10.." - "..pscmreventsincomb2,psbossnames[1][3][1])
--если это 1 каст до прекасты отображать
if pstrackfirstcasthalf1 and #pstrackfirstcasthalf1>0 and psincombattrack7_whocasted then
	for i=1,#pstrackfirstcasthalf1 do
		local tm=math.ceil((pstrackfirstcasthalf2[i]-GetTime())*10)/10
		if tm<0 and tm>-5 then
			for j=1,#psincombattrack1_bossid do
				if psincombattrack1_bossid[j]==arg3 then
					local bvo=0
					if #psincombattrack7_whocasted[j]>0 then
						for kl=1,#psincombattrack7_whocasted[j] do
							if psincombattrack7_whocasted[j][kl]==pstrackfirstcasthalf1[i] then
								bvo=1
							end
						end
					end
					if bvo==0 then
						table.insert(psincombattrack7_whocasted[j],pstrackfirstcasthalf1[i])
						table.insert(psincombattrack8_timecasted[j],pstrackfirstcasthalf3[i]..", "..tm)
					end
				end
			end
		end
	end
end
pstrackfirstcasthalf1=nil
pstrackfirstcasthalf2=nil
pstrackfirstcasthalf3=nil
end



if arg2=="SPELL_CAST_START" and (arg9==83710 or arg9==86169 or arg9==86170 or arg9==86171) and psraidoptionson[1][3][1][2]==1 then
if pshalfustimes and GetTime()>pshalfustimes-30 then
pscheckrunningbossid(arg3)
pscaststartinfo(arg9,arg10, 0, "id1", 1, arg10.." - "..pscmreventsincomb2,psbossnames[1][3][1])
end
end




--hal
if pstimewardenok and (arg2=="SPELL_DAMAGE") and psidhalspell and (arg10==psidhalspell) and GetTime()>pstimewardenok+4 then
pscmrboss311(arg6,arg7,arg10)
end
--учесть так же и замедление
if arg2=="SPELL_AURA_APPLIED" and arg9==83601 then
pstimewardenok=GetTime()
end
end