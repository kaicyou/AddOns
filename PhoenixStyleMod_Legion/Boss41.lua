﻿psbossfileLegion41=1




function pscmrbossREPORTLegion411(wipe,try,reset,checkforwipe)
if reset==nil then
if checkforwipe==nil or (checkforwipe and pswasonbossLegion41 and pswasonbossLegion41==1) then

	if pswasonbossLegion41==1 then
		pssetcrossbeforereport1=GetTime()

		if psraidoptionson[4][4][1][1]==1 then
			strochkavezcrash=psiccdmgfrom.." |s4id233062|id ("..psmainmtotal.."): "
			reportafterboitwotab(psraidchats3[psraidoptionschat[4][4][1][1]], true, vezaxname, vezaxcrash, 1)
		end
		if psraidoptionson[4][4][1][2]==1 then
			strochkavezcrash=psiccdmgfrom.." |s4id233021|id ("..psmainmtotal.."): "
			reportafterboitwotab(psraidchats3[psraidoptionschat[4][4][1][2]], true, vezaxname2, vezaxcrash2, 1)
		end


	end
	if pswasonbossLegion41==1 or (pswasonbossLegion41==2 and try==nil) then

		psiccsavinginf(psbossnames[4][4][1], try, pswasonbossLegion41)

		strochkavezcrash=psiccdmgfrom.." |s4id233062|id ("..psmainmtotal.."): "
		reportafterboitwotab("raid", true, vezaxname, vezaxcrash, nil, nil,0,1)
		strochkavezcrash=psiccdmgfrom.." |s4id233021|id ("..psmainmtotal.."): "
		reportafterboitwotab("raid", true, vezaxname2, vezaxcrash2, nil, nil,0,1)

		psiccrefsvin()

	end




	if wipe then
		pswasonbossLegion41=2
		pscheckbossincombatmcr_legion1=GetTime()+1
	end
end
end
end


function pscmrbossRESETLegion411(wipe,try,reset,checkforwipe)
if reset or wipe==nil then
pswasonbossLegion41=nil


table.wipe(vezaxname)
table.wipe(vezaxcrash)
table.wipe(vezaxname2)
table.wipe(vezaxcrash2)

end
end



function pscombatlogbossLegion41(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)




if arg2=="SPELL_DAMAGE" and spellid==233062 and name2 then
  if pswasonbossLegion41==nil then
    pswasonbossLegion41=1
  end
  psunitisplayer(guid2,name2)
  if psunitplayertrue then

    pscheckwipe1()
    if pswipetrue and pswasonbossLegion41~=2 then
      psiccwipereport_legion1("wipe", "try")
    end
    addtotwotables1(name2)
    vezaxsort1()
    local tt2=", "..psdamageceil(arg12)
      if arg13>=0 then
        tt2=", "..psdamageceil(arg12-arg13).." |cffff0000("..psoverkill..": "..psdamageceil(arg13)..")|r"
      end
    pscaststartinfo(0,spellname..": "..psaddcolortxt(1,name2)..name2..psaddcolortxt(2,name2)..tt2, -1, "id1", 1, "|s4id"..spellid.."|id - "..psinfo,psbossnames[4][4][1],2)
  end
end

if arg2=="SPELL_DAMAGE" and spellid==233021 then
  if pswasonbossLegion41==nil then
    pswasonbossLegion41=1
  end
  psunitisplayer(guid2,name2)
  if psunitplayertrue then

    pscheckwipe1()
    if pswipetrue and pswasonbossLegion41~=2 then
      psiccwipereport_legion1("wipe", "try")
    end
    addtotwotables2(name2)
    vezaxsort2()
    local tt2=", "..psdamageceil(arg12)
      if arg13>=0 then
        tt2=", "..psdamageceil(arg12-arg13).." |cffff0000("..psoverkill..": "..psdamageceil(arg13)..")|r"
      end
    pscaststartinfo(0,spellname..": "..psaddcolortxt(1,name2)..name2..psaddcolortxt(2,name2)..tt2, -1, "id1", 2, "|s4id"..spellid.."|id - "..psinfo,psbossnames[4][4][1],2)
  end
end



if arg2=="SPELL_CAST_START" and spellid==99999999999999999 then
pscheckrunningbossid(guid1)
pscaststartinfo(spellid,spellname..": %s.", 2, guid1, 91, "|s4id"..spellid.."|id - "..pseventsincomb2,psbossnames[4][4][1])
end



end