psbossfile11=1
function pscmrboss111(arg6,arg7)
psunitisplayer(arg6,arg7)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss11~=2 then
		psiccwipereport("wipe", "try")
	end
		addtotwotables(arg7)
		vezaxsort1()
end
end


function pscmrbossREPORT111(wipe,try,reset,checkforwipe)
if reset==nil then
if checkforwipe==nil or (checkforwipe and pswasonboss11 and pswasonboss11==1) then

	if pswasonboss11==1 then
		pssetcrossbeforereport1=GetTime()
		if psraidoptionson[1][1][1][1]==1 then
			strochkavezcrash=pscmrtxtoptt111.." "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][1][1][1]], true, vezaxname, vezaxcrash, 1)
		end

	end
	if pswasonboss11==1 or (pswasonboss11==2 and try==nil) then

	psiccsavinginf(psbossnames[1][1][1], try, pswasonboss11)
	strochkavezcrash=pscmrtxtoptt111.." "
	reportafterboitwotab("raid", true, vezaxname, vezaxcrash, nil, nil,0,1)

	psiccrefsvin()

	end

	if wipe then
		pswasonboss11=2
		pscheckbossincombatmcr=GetTime()+1
	end
end
end
end


function  pscmrbossRESET111(wipe,try,reset,checkforwipe)
if reset or wipe==nil then
pswasonboss11=nil
table.wipe(vezaxname)
table.wipe(vezaxcrash)
end
end