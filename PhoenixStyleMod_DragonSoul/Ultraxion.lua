psbossfile65=1





function pscmrbossREPORT651(wipe,try,reset,checkforwipe)
if reset==nil then
if checkforwipe==nil or (checkforwipe and pswasonboss65 and pswasonboss65==1) then

	if pswasonboss65==1 then
		pssetcrossbeforereport1=GetTime()
		--if psraidoptionson[1][6][5][2]==1 then
		--	strochkavezcrash=psmainmgot.." |s4id99837|id ("..psmainmtotal.."): "
		--	reportafterboitwotab(psraidchats3[psraidoptionschat[1][6][5][2]], true, vezaxname, vezaxcrash, 1)
		--end



	end
	if pswasonboss65==1 or (pswasonboss65==2 and try==nil) then

		psiccsavinginf(psbossnames[1][6][5], try, pswasonboss65)

		--strochkavezcrash=psmainmgot.." |s4id99837|id: "
		--reportafterboitwotab("raid", true, vezaxname, vezaxcrash, nil, nil,0,1)


		psiccrefsvin()

	end




	if wipe then
		pswasonboss65=2
		pscheckbossincombatmcr_3=GetTime()+1
	end
end
end
end


function pscmrbossRESET651(wipe,try,reset,checkforwipe)
if reset or wipe==nil then
pswasonboss65=nil

end
end


function pscombatlogboss65(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)






end