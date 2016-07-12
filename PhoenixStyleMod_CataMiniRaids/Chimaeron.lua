psbossfile25=1
function psmarkchimaeron(arg7)
if ps_chimaerontab4 then
if chimabugfix1==nil then chimabugfix1=GetTime() chimabugfix2=0 end
if GetTime()>chimabugfix1+1.5 then
chimabugfix2=0
end
chimabugfix1=GetTime()
chimabugfix2=chimabugfix2+1
	if chimabugfix2<9 then
			local mark=0
			if #ps_chimaerontab4>0 then
				for l=1,8 do
					if mark==0 then
						local byl=0
						for qq=1,#ps_chimaerontab3 do
							if ps_chimaerontab3[qq] and ps_chimaerontab3[qq]==arg7 then
								table.remove(ps_chimaerontab3,qq)
								table.remove(ps_chimaerontab4,qq)
								table.remove(ps_chimaerontab5,qq)
							end
						end

						if #ps_chimaerontab4>0 then
						for g=1,#ps_chimaerontab4 do
							if ps_chimaerontab4[g] and ps_chimaerontab4[g]==l and GetTime()-ps_chimaerontab5[g]<3 then
								byl=1
							end
						end
						if byl==0 then
							mark=l
						end
						else
							mark=1
						end
					end
				end						
			else
				mark=1
			end
			if mark>0 then
				table.insert(ps_chimaerontab3,arg7)
				table.insert(ps_chimaerontab5,GetTime())
				table.insert(ps_chimaerontab4,mark)
				if GetRaidTargetIndex(arg7)==nil or (GetRaidTargetIndex(arg7) and GetRaidTargetIndex(arg7)~=mark) then
					if(IsRaidOfficer()==1) then
						SetRaidTarget(arg7, mark)
					end
				end
			end
	end
end
end




function pscmrbossREPORT251(wipe,try,reset,checkforwipe)
if reset==nil then
if checkforwipe==nil or (checkforwipe and pswasonboss25 and pswasonboss25==1) then

	if pswasonboss25==1 then
		--тут репорт
		pssetcrossbeforereport1=GetTime()

	end
	if pswasonboss25==1 or (pswasonboss25==2 and try==nil) then

	psiccsavinginf(psbossnames[1][2][5], try, pswasonboss25)
		--тут сохранение

	psiccrefsvin()

	end

	if wipe then
		pswasonboss25=2
		pscheckbossincombatmcr=GetTime()+1
	end
end
end
end


function  pscmrbossRESET251(wipe,try,reset,checkforwipe)
if reset or wipe==nil then
pswasonboss25=nil
--тут резет

end
end



function pscombatlogboss25(...)
local arg1, arg2, argnew1, arg3,arg4,arg5,argNEW,arg6,arg7,arg8,argNEW2,arg9,arg10,arg11,arg12,arg13,arg14, arg15 = ...


--chimaeron marks
if arg2=="SPELL_DAMAGE" and (arg9==88917 or arg9==82935 or arg9==88916 or arg9==88915) then
	if psraidoptionson[1][2][5][2]==1 then
	if IsRaidOfficer()==1 and (pschimaeronmarksstopfor60==nil or (pschimaeronmarksstopfor60 and GetTime()>pschimaeronmarksstopfor60)) then

	if pschimadelayspam==nil or (pschimadelayspam and GetTime()>pschimadelayspam) then
		pschimadelayspam=GetTime()+10
		SendAddonMessage("PSaddmod", "10"..UnitName("player"), "RAID")
	end

	psunitisplayer(arg6,arg7)
	if psunitplayertrue then
		psmarkchimaeron(arg7)
	end
	end
	end
end
end