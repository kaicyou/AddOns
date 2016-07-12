psbossfile61=1
function pscmrboss611(guid2,name2,spellid,spellname,arg12,arg13)
if pswasonboss61==nil then
	pswasonboss61=1
end
psunitisplayer(guid2,name2)
if psunitplayertrue then
	pscheckwipe1()
	if pswipetrue and pswasonboss61~=2 then
		psiccwipereport_3("wipe", "try")
	end
		addtotwotables(name2)
		vezaxsort1()
		local sta=0
		if psblackgamno1 and #psblackgamno1>0 then
      for i=1,#psblackgamno1 do
        if psblackgamno1[i]==name2 and GetTime()<psblackgamno3[i]+8 then
          sta=psblackgamno2[i]
        end
      end
    end
    
      local sst=""
      if sta>0 then
        sst=", "..psstacks..": "..sta
      end
      
		if psraidoptionson[1][6][1][1]==1 and pswasonboss61==1 and arg13 and arg13>=0 then
			pszapuskanonsa(psraidchats3[psraidoptionschat[1][6][1][1]], "{rt8} "..psnoservername(name2).." "..psmainmdiedfrom.." |s4id"..spellid.."|id ("..psdamageceil(arg12-arg13).." "..psulhp..", "..psoverkill..": "..psdamageceil(arg13)..sst..")")
		end
		local overkill=""
		if arg13 and arg13>=0 then
			overkill=" |cffff0000("..psoverkill..": "..psdamageceil(arg13)..sst..")|r"
		end
		      
		pscaststartinfo(0,spellname..": "..psaddcolortxt(1,name2)..name2..psaddcolortxt(2,name2).." > "..psdamageceil(arg12-arg13).." "..psulhp..overkill, -1, "id1", 1, "|s4id"..spellid.."|id - "..psinfo,psbossnames[1][6][1],2)

end
end





function pscmrbossREPORT611(wipe,try,reset,checkforwipe)
if reset==nil then
if checkforwipe==nil or (checkforwipe and pswasonboss61 and pswasonboss61==1) then

	if pswasonboss61==1 then
		pssetcrossbeforereport1=GetTime()
		if psraidoptionson[1][6][1][2]==1 then
			strochkavezcrash=psmainmgot.." |s4id108570,103785,110287,110288|id ("..psmainmtotal.."): "
			reportafterboitwotab(psraidchats3[psraidoptionschat[1][6][1][2]], true, vezaxname, vezaxcrash, 1)
		end



	end
	if pswasonboss61==1 or (pswasonboss61==2 and try==nil) then

		psiccsavinginf(psbossnames[1][6][1], try, pswasonboss61)

		strochkavezcrash=psmainmgot.." |s4id108570,103785,110287,110288|id: "
		reportafterboitwotab("raid", true, vezaxname, vezaxcrash, nil, nil,0,1)


		psiccrefsvin()

	end



	if wipe then
		pswasonboss61=2
		pscheckbossincombatmcr_3=GetTime()+1
	end
end
end
end


function pscmrbossRESET611(wipe,try,reset,checkforwipe)
if reset or wipe==nil then
pswasonboss61=nil
table.wipe(vezaxname)
table.wipe(vezaxcrash)
table.wipe(vezaxname2)
table.wipe(vezaxcrash2)
morchokcrush1=nil
morchokcrush2=nil
morchokcrush3=nil
psblackgamno1=nil
psblackgamno2=nil
psblackgamno3=nil
end
end


function pscombatlogboss61(arg1, arg2, hideCaster, guid1, name1, flag1, new1, guid2, name2, flag2, new2, spellid, spellname, arg11,arg12,arg13,arg14,arg15)


--сейанонсеры
--if arg2=="SPELL_SUMMON" and (spellid==99836) then
--if ps_saoptions[1][6][1][1]==1 then
--ps_sa_checktargets(GetTime()+0.17,guid1,0.2,spellname.." "..psmain_sa_phrase1,3,0)
--end
--end

if arg2=="SPELL_DAMAGE" and (spellid==103785 or spellid==108570 or spellid==110287 or spellid==110288) then
pscmrboss611(guid2,name2,spellid,spellname,arg12,arg13)
end

if (arg2=="SPELL_AURA_APPLIED_DOSE" or arg2=="SPELL_AURA_APPLIED") and (spellid==103785 or spellid==108570 or spellid==110287 or spellid==110288) then
  if psblackgamno1==nil then
    psblackgamno1={} --ник
    psblackgamno2={} --дебафов
    psblackgamno3={} --время
  end
  local bil=0
  if arg2=="SPELL_AURA_APPLIED_DOSE" and arg13 then
    bil=arg13
  else
    bil=1
  end
  local ok=0
  if # psblackgamno1>0 then
    for i=1,#psblackgamno1 do
      if psblackgamno1[i]==name2 then
        psblackgamno2[i]=bil
        psblackgamno3[i]=GetTime()
        ok=1
      end
    end
  end
  if ok==0 then
    table.insert(psblackgamno1,name2)
    table.insert(psblackgamno2,bil)
    table.insert(psblackgamno3,GetTime())
  end
end


if arg2=="SPELL_AURA_APPLIED_DOSE" and spellid==103687 then

if pswasonboss61==nil then
	pswasonboss61=1
end

if morchokcrush1==nil then
morchokcrush1={} --ник с краш дебафом
morchokcrush2={} --скока стаков
morchokcrush3={} --время наложения
end

local bil=0
if #morchokcrush1>0 then
	for i=1,#morchokcrush1 do
		if morchokcrush1[i]==name2 then
			morchokcrush2[i]=arg13
			morchokcrush3[i]=GetTime()
			bil=1
		end
	end
end
if bil==0 then
	table.insert(morchokcrush1,name2)
	table.insert(morchokcrush2,arg13)
	local atime=GetTime()
	table.insert(morchokcrush3,atime)
end

end


--снимание дебафа
if arg2=="SPELL_AURA_REMOVED" and (spellid==103687) then
	if morchokcrush1 and #morchokcrush1>0 then
		for i=1,#morchokcrush1 do
			if morchokcrush1[i] and morchokcrush1[i]==name2 then
				table.remove(morchokcrush1,i)
				table.remove(morchokcrush2,i)
				table.remove(morchokcrush3,i)
			end
		end
	end
end


--мили удар или спел удар от босса:
if arg2=="SWING_DAMAGE" and spellname>=0 and morchokcrush1 and #morchokcrush1>0 then --в мили ударе спелл нейм это избыточный урон
for i=1,#morchokcrush1 do
	if morchokcrush1[i] and morchokcrush1[i]==name2 then
		if GetTime()<morchokcrush3[i]+21 and morchokcrush2[i]>1 then
			--репорт
			if psraidoptionson[1][6][1][3]==1 and pswasonboss61==1 then
				pszapuskanonsa(psraidchats3[psraidoptionschat[1][6][1][3]], "{rt8} "..psnoservername(name2).." "..psdied.." > melee ("..psdamageceil(spellid-spellname).." "..psulhp..", "..psoverkill..": "..psdamageceil(spellname)..", "..psstacks.." |s4id103687|id: "..morchokcrush2[i]..")")
			end
			local aa=GetSpellInfo(103687)
			pscaststartinfo(0,aa..", "..psstacks.." "..morchokcrush2[i]..": "..psaddcolortxt(1,name2)..name2..psaddcolortxt(2,name2).." > melee "..psdamageceil(spellid-spellname).." "..psulhp..", "..psoverkill..": "..psdamageceil(spellname), -1, "id1", 5, "|s4id103687|id - "..psinfo,psbossnames[1][6][1],2)
		end
		table.remove(morchokcrush1,i)
		table.remove(morchokcrush2,i)
		table.remove(morchokcrush3,i)
	end
end
end

if arg2=="SPELL_DAMAGE" and arg13>=0 and spellid==103687 and morchokcrush1 and #morchokcrush1>0 then --ыытест мало ИД
for i=1,#morchokcrush1 do
	if morchokcrush1[i] and morchokcrush1[i]==name2 then
		if GetTime()<morchokcrush3[i]+21 and morchokcrush2[i]>1 then
			--репорт
			if psraidoptionson[1][6][1][3]==1 and pswasonboss61==1 then
				pszapuskanonsa(psraidchats3[psraidoptionschat[1][6][1][3]], "{rt8} "..psnoservername(name2).." "..psmainmdiedfrom.." |s4id"..spellid.."|id ("..psdamageceil(arg12-arg13).." "..psulhp..", "..psoverkill..": "..psdamageceil(arg13)..", "..psstacks.." |s4id103687|id: "..morchokcrush2[i]..")")
			end
			local aa=GetSpellInfo(103687)
			pscaststartinfo(0,aa..", "..psstacks.." "..morchokcrush2[i]..": "..psaddcolortxt(1,name2)..name2..psaddcolortxt(2,name2).." > "..spellname.." "..psdamageceil(arg12-arg13).." "..psulhp..", "..psoverkill..": "..psdamageceil(arg13), -1, "id1", 5, "|s4id103687|id - "..psinfo,psbossnames[1][6][1],2)
		end
		table.remove(morchokcrush1,i)
		table.remove(morchokcrush2,i)
		table.remove(morchokcrush3,i)
	end
end
end




end