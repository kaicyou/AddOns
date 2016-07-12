psbossfile12=1
function pscmrboss121(arg6,arg7)
--ptr test temp ыытест
if pswasonboss12==nil then
	pswasonboss12=1
end
if psdelaysecbh22==nil or (psdelaysecbh22 and GetTime()>psdelaysecbh22) then
psunitisplayer(arg6,arg7)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss12~=2 then
		psiccwipereport("wipe", "try")
	end
		addtotwotables(arg7)
		vezaxsort1()
end
end
end


function pscmrbossREPORT121(wipe,try,reset,checkforwipe)
if reset==nil then
if checkforwipe==nil or (checkforwipe and pswasonboss12 and pswasonboss12==1) then

	if pswasonboss12==1 then
		pssetcrossbeforereport1=GetTime()
		if psraidoptionson[1][1][2][1]==1 then
			strochkavezcrash=pscmrtxtoptt121.." "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][1][2][1]], true, vezaxname, vezaxcrash, 1)
		end

	end
	if pswasonboss12==1 or (pswasonboss12==2 and try==nil) then

	psiccsavinginf(psbossnames[1][1][2], try, pswasonboss12)
	strochkavezcrash=pscmrtxtoptt121.." "
	reportafterboitwotab("raid", true, vezaxname, vezaxcrash, nil, nil,0,1)

	psiccrefsvin()

	end

	if wipe then
		pswasonboss12=2
		pscheckbossincombatmcr=GetTime()+1
	end
end
end
end


function  pscmrbossRESET121(wipe,try,reset,checkforwipe)
if reset or wipe==nil then
pswasonboss12=nil
table.wipe(vezaxname)
table.wipe(vezaxcrash)
end
end