tempdmgshowvar=1
function psdamageshow_3(play,ar1,ar2,ar3)

if pssidamageinf_indexboss[play][ar1][ar2]>199 and pssidamageinf_indexboss[play][ar1][ar2]<399 then

--deathwing

local uron=psiccdmgfrom


local psstrochka=""

if ar1==1 then
psstrochka="|CFFFFFF00"..psrestorelinksforexport2(pssidamageinf_title2[play][ar1][ar2]).."\n\r"..uron..":|r "
else
psstrochka="|CFFFFFF00"..pssidamageinf_additioninfo[play][ar1][ar2][1].." - "..psrestorelinksforexport2(pssidamageinf_title2[play][ar1][ar2]).."\n\r"..uron..":|r "
end
local maxnick=#pssidamageinf_damageinfo[play][ar1][ar2][1]
local items = {psiccall, 5, 7, 10, 12, 15, 17, 20}
local psinfoshieldtempdamage=0
local pstochki="."


if pssichose5==1 then else
if items[pssichose5]<maxnick then
maxnick=items[pssichose5]
pstochki=",..."
end
end



if #pssidamageinf_damageinfo[play][ar1][ar2][1]>0 then
for i = 1,maxnick do


	psinfoshieldtempdamage=psdamageceil(pssidamageinf_damageinfo[play][ar1][ar2][2][i])


	local rsccodeclass=0

	for j=1,#pssidamageinf_classcolor[play][ar1][1] do
		if pssidamageinf_classcolor[play][ar1][1][j]==pssidamageinf_damageinfo[play][ar1][ar2][1][i] then rsccodeclass=pssidamageinf_classcolor[play][ar1][2][j]
		end
	end


local colorname=pssidamageinf_damageinfo[play][ar1][ar2][1][i]
local tablecolor={"|CFFC69B6D","|CFFC41F3B","|CFFF48CBA","|CFFFFFFFF","|CFF1a3caa","|CFFFF7C0A","|CFFFFF468","|CFF68CCEF","|CFF9382C9","|CFFAAD372","","|cff999999"}

if rsccodeclass==nil or rsccodeclass==0 then rsccodeclass=12 end

if rsccodeclass>0 then
colorname=tablecolor[rsccodeclass]..pssidamageinf_damageinfo[play][ar1][ar2][1][i].."|r"
end

	local timesw=""
	if (pssidamageinf_indexboss[play][ar1][ar2]==202 or pssidamageinf_indexboss[play][ar1][ar2]==203) and #pssidamageinf_switchinfo[play][ar1][ar2][1]>0 then
		local bjl=0
		for jj=1,#pssidamageinf_switchinfo[play][ar1][ar2][1] do
			if pssidamageinf_switchinfo[play][ar1][ar2][1][jj]==pssidamageinf_damageinfo[play][ar1][ar2][1][i] then
				timesw=" - "..pssidamageinf_switchinfo[play][ar1][ar2][2][jj].."s"
				bjl=1
			end
		end
		if bjl==0 then
			timesw=" - ??s"
		end
	end

if i==maxnick then
	--for omnitron to show quantity of attack
	--if pssidamageinf_indexboss[play][ar1][ar2]==4 then
	--	psstrochka=psstrochka..colorname.." ("..psinfoshieldtempdamage.." - "..pssidamageinf_damageinfo[play][ar1][ar2][3][i]..")"..pstochki
	--else
	psstrochka=psstrochka..colorname.." ("..psinfoshieldtempdamage..timesw..")"..pstochki
	--end
	if #pssidamageinf_additioninfo[play][ar1][ar2]>1 then
		for tg=2,#pssidamageinf_additioninfo[play][ar1][ar2] do
			if tg==2 then
				psstrochka=psstrochka.."\n\r"..pssidamageinf_additioninfo[play][ar1][ar2][tg]
			else
				psstrochka=psstrochka.."\n"..pssidamageinf_additioninfo[play][ar1][ar2][tg]
			end
		end
	end
	pssavedinfotextframe1:SetText(psstrochka)
else
	--for omnitron to show quantity of attack
	--if pssidamageinf_indexboss[play][ar1][ar2]==4 then
	--	psstrochka=psstrochka..colorname.." ("..psinfoshieldtempdamage.." - "..pssidamageinf_damageinfo[play][ar1][ar2][3][i].."), "
	--else
	psstrochka=psstrochka..colorname.." ("..psinfoshieldtempdamage..timesw.."), "
	--end
end
end

end



end-- deathwing



end
















function psdamagerep_3(chat,play,ar1,ar2,ar3,reptype,quant,zapusk, endcombat)



--определяем тип боя
if pssidamageinf_indexboss[play][ar1][ar2]>199 and pssidamageinf_indexboss[play][ar1][ar2]<399 then


--deathwing
local psstrochkab=""
if ar1==1 then
psstrochkab="{rt4} PS: "..psrestorelinksforexport2(pssidamageinf_title2[play][ar1][ar2])
else
psstrochkab="{rt4} PS: "..pssidamageinf_additioninfo[play][ar1][ar2][1].." - "..psrestorelinksforexport2(pssidamageinf_title2[play][ar1][ar2])
end
local uron=psiccdmgfrom
--if pssidamageinf_indexboss[play][ar1][ar2]==4 then
--uron=psiccdmgfrom2
--end

--if spetsreport==1 then
--psstrochkab=psstrochkab..". "..pszzdragdiedtoquick
--pssidamageinf_title2[play][ar1][ar2]=pssidamageinf_title2[play][ar1][ar2]..". "..pszzdragdiedtoquick
--end

local psstrochka=""
psstrochka=psstrochka..uron..": "
--local psstrochka2=""
local maxnick=#pssidamageinf_damageinfo[play][ar1][ar2][1]
local items = {psiccall, 5, 7, 10, 12, 15, 17, 20}
local psinfoshieldtempdamage=0
local pstochki="."



if ar3==1 then else
if items[ar3]<maxnick then
maxnick=items[ar3]
pstochki=",..."
end
end



if #pssidamageinf_damageinfo[play][ar1][ar2][1]>0 then
for i = 1,maxnick do


	psinfoshieldtempdamage=psdamageceil(pssidamageinf_damageinfo[play][ar1][ar2][2][i])


local kolatak=pssidamageinf_damageinfo[play][ar1][ar2][3][i]

	local timesw=""
	if (pssidamageinf_indexboss[play][ar1][ar2]==202 or pssidamageinf_indexboss[play][ar1][ar2]==203) and #pssidamageinf_switchinfo[play][ar1][ar2][1]>0 then
		local bjl=0
		for jj=1,#pssidamageinf_switchinfo[play][ar1][ar2][1] do
			if pssidamageinf_switchinfo[play][ar1][ar2][1][jj]==pssidamageinf_damageinfo[play][ar1][ar2][1][i] then
				timesw=" - "..pssidamageinf_switchinfo[play][ar1][ar2][2][jj].."s"
				bjl=1
			end
		end
		if bjl==0 then
			timesw=" - ??s"
		end
	end

if i==maxnick then
	--if string.len(psstrochka)>230 and quant==2 then
		--psstrochka2=psstrochka2..pssidamageinf_damageinfo[play][ar1][ar2][1][i].." ("..psinfoshieldtempdamage..timesw..")"..pstochki
	--else
		--if pssidamageinf_indexboss[play][ar1][ar2]==4 then
		--	psstrochka=psstrochka..pssidamageinf_damageinfo[play][ar1][ar2][1][i].." ("..psinfoshieldtempdamage.." - "..kolatak..")"..pstochki
		--else
		psstrochka=psstrochka..pssidamageinf_damageinfo[play][ar1][ar2][1][i].." ("..psinfoshieldtempdamage..timesw..")"..pstochki
		--end
	--end
	if zapusk then
	pszapuskanonsa(chat, psstrochkab, endcombat)
	pszapuskanonsa(chat, psstrochka, endcombat)
	--pszapuskanonsa(chat, psstrochka2, endcombat)
	else
	local as={psstrochkab,psstrochka}
	if #pssidamageinf_additioninfo[play][ar1][ar2]>1 then
		for tg=2,#pssidamageinf_additioninfo[play][ar1][ar2] do
			table.insert(as,pssidamageinf_additioninfo[play][ar1][ar2][tg])
		end
	end
	if reptype then
		if reptype==1 then
			pssendchatmsg(chat,as)
		end
		if reptype==2 then
			pssendchatmsg("whisper",as,PSFmainfrainsavedinfo_edbox2:GetText())
		end
	end
	end
else
	--if string.len(psstrochka)>230 and quant==2 then
		--if pssidamageinf_indexboss[play][ar1][ar2]==4 then
		--	psstrochka2=psstrochka2..pssidamageinf_damageinfo[play][ar1][ar2][1][i].." ("..psinfoshieldtempdamage.." - "..kolatak.."), "
		--else
			--psstrochka2=psstrochka2..pssidamageinf_damageinfo[play][ar1][ar2][1][i].." ("..psinfoshieldtempdamage..timesw.."), "
		--end
	--else
		--if pssidamageinf_indexboss[play][ar1][ar2]==4 then
		--	psstrochka=psstrochka..pssidamageinf_damageinfo[play][ar1][ar2][1][i].." ("..psinfoshieldtempdamage.." - "..kolatak.."), "
		--else
			psstrochka=psstrochka..pssidamageinf_damageinfo[play][ar1][ar2][1][i].." ("..psinfoshieldtempdamage..timesw.."), "
		--end
	--end
end
end

end



end-- deathwing



end





--сохранение инфо об урон для Спины и Десвинга
function psdrakadddamage(tip,name1,guid2,arg12,arg13,spellid) --tip nr of trackers, 201 202 203 +tip


if psdragontabldamage1[1] and #psdragontabldamage1[1]>0 then
	local byl=0
	for u=1,#psdragontabldamage1[1] do
		if psdragontabldamage1[1][u]==guid2 and byl==0 then
			byl=1
			psdrakdamadddamage(tip,name1,guid2,arg12,arg13,spellid)
		end
	end
	if byl==0 then
		psdrakmodnewadd(tip,name1,guid2,arg12)
	end
else
	--создаем новые табл
	if tip==3 or tip==5 then
    pscreatesavedreports3(psbossnames[1][6][8])
	elseif tip==4 then
    pscreatesavedreports3(psbossnames[1][6][3])
	else
    pscreatesavedreports3(psbossnames[1][6][7])
  end
	
	pscreatefightincombat=1
	psaddclasscolors()
	psdrakmodnewadd(tip,name1,guid2,arg12)
	--psdmgresetinglastfight()
end
end

function psdrakmodnewadd(tip,name1,guid2,arg12,checkforalreadysum)
local check=0 --проверять на то что гуид уже создан если это надо:
if psdragontabldamage1[1] and #psdragontabldamage1[1]>0 and checkforalreadysum==nil then
  for i=1,#psdragontabldamage1[1] do
    if psdragontabldamage1[1][i]==guid2 then
      check=1
    end
  end
end

if check==0 then

  if pscreatefightincombat then
    local h,m = GetGameTime()
    if h<10 then h="0"..h end
    if m<10 then m="0"..m end
    local time=h..":"..m
    local cifra=0
    if tip==1 or tip==3 or tip==4 then
      psiccschet2=psiccschet2+1
      cifra=psiccschet2
    end
    if tip==5 then
      psiccschet3=psiccschet3+1
      cifra=psiccschet3
      psmadnessaddbegin=GetTime()
    end
    if psdragontabldamage1==nil then
      psdragontabldamage1={{},{},{},{}}
    end

    if tip==3 then
      table.insert(psdragontabldamage1[1],"777")
    else
      table.insert(psdragontabldamage1[1],guid2)
    end

    table.insert(psdragontabldamage1[2],arg12)
    table.insert(psdragontabldamage1[3],0)
    table.insert(psdragontabldamage1[4],cifra)
    if tip==1 and psdrakmaxHPadd1==nil then
      psdrakmaxHPadd1=0
    end
    if tip==2 and psdrakmaxHPadd2==nil then
      psdrakmaxHPadd2=0
    end
    if tip==4 and psdrakmaxHPadd4==nil then
      psdrakmaxHPadd4=0
    end

    if tip==2 then
      local bil=0
      for i=1,#psdragontabldamage1[1] do
        if psdragontabldamage1[1][i]==guid2 then
          bil=bil+1
        end
      end
      if bil==1 then
        psiccschet1=psiccschet1+1
        psiccschet3=1
      elseif bil>1 then
        psiccschet3=psiccschet3+1
      end
    end

    local an=""
    if tip==1 then
      an="|snpc"..psdraknamedamageadd1.."^53890|fnpc" or "Mob"
      local hptrack=pszzdragonly10
              --10% for LFR, 5% Normal, 2% HEROIC
              if string.find(psiccinst,psiccheroic) then
                hptrack=format(pszzdragonly10,2)
              else
                local _, instanceType, pppl, _, maxPlayers, dif = GetInstanceInfo()
                if select(3,GetInstanceInfo())==17 then
                  hptrack=format(pszzdragonly10,10)
                else
                  hptrack=format(pszzdragonly10,5)
                end
              end
      an=an..": "..cifra..". "..hptrack
    end
    if tip==4 then
      an="|snpc"..psdraknamedamageadd4.."^56231|fnpc" or "Mob"
      an=an..": "..cifra..". "..format(pszzdragonly10,10)
    end
    if tip==2 then
      an="|snpc"..psdraknamedamageadd2.."^56341|fnpc" or "Mob"
      an=an.." ("..psiccschet1.." - "..psiccschet3..")"
    end
    if tip==3 then
      an="|snpc"..psdraknamedamageadd3.."^56262|fnpc" or "Mob"
      an=an..": "..cifra
    end
    if tip==5 then
      an="|snpc"..psdraknamedamageadd5.."^57479|fnpc" or "Mob"
      an=an..": "..cifra
    end
      table.insert(pssidamageinf_indexboss[pssavedplayerpos][1],200+tip)
      table.insert(pssidamageinf_title2[pssavedplayerpos][1],an)
    if tip==3 or tip==5 then
      table.insert(pssidamageinf_additioninfo[pssavedplayerpos][1],{psbossnames[1][6][8]..", "..time})
    elseif tip==4 then
      table.insert(pssidamageinf_additioninfo[pssavedplayerpos][1],{psbossnames[1][6][3]..", "..time})
    else
      table.insert(pssidamageinf_additioninfo[pssavedplayerpos][1],{psbossnames[1][6][7]..", "..time})
    end
      table.insert(pssidamageinf_damageinfo[pssavedplayerpos][1],{{},{},{}})
      table.insert(pssidamageinf_switchinfo[pssavedplayerpos][1],{{},{}})

    if tip==2 then
      --тут запускаем проверку свитчей в guid2 на 10 сек и пока учитывается УРОН в щит!
      pscheckswitch_spine2(guid2)
    end
    if tip==5 then
      --тут запускаем проверку свитчей в guid2 на 10 сек и пока учитывается УРОН в щит!
      pscheckswitch_madness5(guid2)
    end
    if tip==3 then
      --ыытест!
      --тут запускаем проверку свитчей в guid2 на 10 сек и пока учитывается УРОН в щит!
      pscheckswitch_madness2("777")
    end

    psupdateframewithnewinfo()
  else
  --тест вставил проверку на созданную табл, если ее нету тоооо с нуля все!

    --создаем новые табл
    if tip==3 or tip==5 then
      pscreatesavedreports3(psbossnames[1][6][8])
    elseif tip==4 then
      pscreatesavedreports3(psbossnames[1][6][3])
    else
      pscreatesavedreports3(psbossnames[1][6][7])
    end
    
    pscreatefightincombat=1
    psaddclasscolors()
    psdrakmodnewadd(tip,name1,guid2,arg12)

  end--конец теста
end
end




function psdrakdamadddamage(tip,name1,guid2,arg12,arg13,spellid)
local lasttabletoaddfortendons=0
for ii=1,#psdragontabldamage1[1] do
	if psdragontabldamage1[1][ii]==guid2 then
    lasttabletoaddfortendons=ii
		if tip==1 then
			local dmg2=arg12
			if psdrakmaxHPadd1 and psdrakmaxHPadd1~=0 and psdragontabldamage1[2][ii]<psdrakmaxHPadd1 and psdragontabldamage1[2][ii]+dmg2>psdrakmaxHPadd1 then
				dmg2=math.ceil(psdragontabldamage1[2][ii]+arg12-psdrakmaxHPadd1)
			end

			psdragontabldamage1[2][ii]=psdragontabldamage1[2][ii]+arg12

			if psdrakmaxHPadd1 and psdrakmaxHPadd1~=0 and psdragontabldamage1[2][ii]>psdrakmaxHPadd1 then
				psmoddmg_addinfodmg(name1,dmg2,0,ii)
				psmoddmg_sortinfodmg(ii)
			end
		end
		if tip==4 then
			local dmg2=arg12
			if psdrakmaxHPadd4 and psdrakmaxHPadd4~=0 and psdragontabldamage1[2][ii]<psdrakmaxHPadd4 and psdragontabldamage1[2][ii]+dmg2>psdrakmaxHPadd4 then
				dmg2=math.ceil(psdragontabldamage1[2][ii]+arg12-psdrakmaxHPadd4)
			end

			psdragontabldamage1[2][ii]=psdragontabldamage1[2][ii]+arg12

			if psdrakmaxHPadd4 and psdrakmaxHPadd4~=0 and psdragontabldamage1[2][ii]>psdrakmaxHPadd4 then
				psmoddmg_addinfodmg(name1,dmg2,0,ii)
				psmoddmg_sortinfodmg(ii)
			end
		end

		if tip==3 or tip==5 then
			psmoddmg_addinfodmg(name1,arg12,0,ii)
			psmoddmg_sortinfodmg(ii)
      psdragontabldamage1[2][ii]=psdragontabldamage1[2][ii]+arg12
		end

		--if psdragontabldamage1[1][ii]==201 and overkill and overkill>0 and pssidamageinf_additioninfo[pssavedplayerpos][1][ii][2]==nil then
		--	if spellid and spellid>0 then
		--		pssidamageinf_additioninfo[pssavedplayerpos][1][ii][2]=pscmralakirloc3..": "..arg4.." -> \124cff71d5ff\124Hspell:"..spellid.."\124h["..GetSpellInfo(spellid).."]\124h\124r -> "..arg12
		--	else
		--		pssidamageinf_additioninfo[pssavedplayerpos][1][ii][2]=pscmralakirloc3..": "..arg4.." -> melee -> "..dmg
		--	end
		--end
	end
end
if lasttabletoaddfortendons>0 then
		if tip==2 then
			psmoddmg_addinfodmg(name1,arg12,0,lasttabletoaddfortendons)
			psmoddmg_sortinfodmg(lasttabletoaddfortendons)
      psdragontabldamage1[2][lasttabletoaddfortendons]=psdragontabldamage1[2][lasttabletoaddfortendons]+arg12
		end
end
end

function psyadernvzrivgo(guid1, spellname)
--psiccschet1=psiccschet1+1
local bil=0
for ii=1,#psdragontabldamage1[1] do
	if psdragontabldamage1[1][ii]==guid1 and bil==0 then
		if pssidamageinf_indexboss[pssavedplayerpos][1][ii]==201 then
			bil=1
			pssidamageinf_title2[pssavedplayerpos][1][ii]=pssidamageinf_title2[pssavedplayerpos][1][ii].." - "..spellname
		end
	end
end
psupdateframewithnewinfo()
end


function pscheckswitch_spine2(guid2)
local psgrups=5
if select(3,GetInstanceInfo())==3 or select(3,GetInstanceInfo())==5 then
psgrups=2
end

for i=1,GetNumGroupMembers() do
local psname, _, pssubgroup = GetRaidRosterInfo(i)
	if pssubgroup <= psgrups then
		table.insert(pssidamageinf_switchinfo[pssavedplayerpos][1][#pssidamageinf_switchinfo[pssavedplayerpos][1]][1],(GetRaidRosterInfo(i)))
		if UnitGUID(psname.."-target")==guid2 then
		--таргет совпадает
		table.insert(pssidamageinf_switchinfo[pssavedplayerpos][1][#pssidamageinf_switchinfo[pssavedplayerpos][1]][2],0)
		else
		--таргет фейл
		table.insert(pssidamageinf_switchinfo[pssavedplayerpos][1][#pssidamageinf_switchinfo[pssavedplayerpos][1]][2],"--")
		end
	end
end

--делей перед первой проверкой и макс 10 сек трекерить, но не более чем висит щит
psdrakspinetargetcheckupd1=GetTime()
psdrakspinetargetcheckupd2=GetTime()+0.1
psdrakspinetargetcheckupd3=guid2

end

function pscheckswitch_madness5(guid2)
local psgrups=5
if select(3,GetInstanceInfo())==3 or select(3,GetInstanceInfo())==5 then
psgrups=2
end

for i=1,GetNumGroupMembers() do
local psname, _, pssubgroup = GetRaidRosterInfo(i)
	if pssubgroup <= psgrups then
		table.insert(pssidamageinf_switchinfo[pssavedplayerpos][1][#pssidamageinf_switchinfo[pssavedplayerpos][1]][1],(GetRaidRosterInfo(i)))
		if UnitGUID(psname.."-target")==guid2 then
		--таргет совпадает
		table.insert(pssidamageinf_switchinfo[pssavedplayerpos][1][#pssidamageinf_switchinfo[pssavedplayerpos][1]][2],0)
		else
		--таргет фейл
		table.insert(pssidamageinf_switchinfo[pssavedplayerpos][1][#pssidamageinf_switchinfo[pssavedplayerpos][1]][2],"--")
		end
	end
end

--делей перед первой проверкой и макс 10 сек трекерить, но не более чем висит щит
psdrakmadnesshertargetcheckupd1=GetTime()
psdrakmadnesshertargetcheckupd2=GetTime()+0.1
psdrakmadnesshertargetcheckupd3=guid2

end


function pscheckswitch_madness2(guid2)
--table.insert(pssidamageinf_switchinfo[pssavedplayerpos][1],{{},{}})
local psgrups=5
if select(3,GetInstanceInfo())==3 or select(3,GetInstanceInfo())==5 then
psgrups=2
end

for i=1,GetNumGroupMembers() do
local psname, _, pssubgroup = GetRaidRosterInfo(i)
	if pssubgroup <= psgrups then
		table.insert(pssidamageinf_switchinfo[pssavedplayerpos][1][#pssidamageinf_switchinfo[pssavedplayerpos][1]][1],(GetRaidRosterInfo(i)))
		if UnitGUID(psname.."-target")==guid2 then
		--таргет совпадает
		table.insert(pssidamageinf_switchinfo[pssavedplayerpos][1][#pssidamageinf_switchinfo[pssavedplayerpos][1]][2],0)
		else
		--таргет фейл
		table.insert(pssidamageinf_switchinfo[pssavedplayerpos][1][#pssidamageinf_switchinfo[pssavedplayerpos][1]][2],"--")
		end
	end
end

--делей перед первой проверкой и макс 10 сек трекерить, но не более чем висит щит
psdrakmadnesstargetcheckupd1=GetTime()
psdrakmadnesstargetcheckupd2=GetTime()+7
psdrakmadnesstargetcheckupd3=guid2

end

function psspinestunswrite(guid2,di)

local txt=""
	
if pscorruptstun1 and #pscorruptstun1>0 then
	for i=1,#pscorruptstun3 do
		if pscorruptstun3[i]==0 then
			pscorruptstun3[i]=GetTime()
		end
	end
	local tab1={}
	local tab2={}
	for i=1,#pscorruptstun1 do
		if pscorruptstun1[i] then
			local bil=0
			if #tab1>0 then
				for j=1,#tab1 do
					if tab1[j]==pscorruptstun1[i] then
						bil=1
						tab2[j]=tab2[j]+(pscorruptstun3[i]-pscorruptstun2[i])
					end
				end
			end
			if bil==0 then
				table.insert(tab1,pscorruptstun1[i])
				local nm=pscorruptstun3[i]-pscorruptstun2[i]
				table.insert(tab2,nm)
			end
		end
	end
	pscorruptstun1=nil
	pscorruptstun2=nil
	pscorruptstun3=nil


	if #tab1>0 then
		txt=txt..psspinestanenamespell..": "
		for i=1,#tab1 do
			local tem=math.ceil(tab2[i]*10)/10
			txt=txt..tab1[i].." ("..tem.." "..pssec..")"
			if i~=#tab1 then
				txt=txt..", "
			end
		end
	end
end


local bil=0
for ii=1,#psdragontabldamage1[1] do
	if psdragontabldamage1[1][ii]==guid2 then
		bil=ii
  end
end
if bil>0 then
		if txt~="" then
      pssidamageinf_additioninfo[pssavedplayerpos][1][bil][2]=txt
		end
		--ыытест пытаемся дописать скока ХП было на окончание каста
		if di then
      pssidamageinf_title2[pssavedplayerpos][1][bil]=pssidamageinf_title2[pssavedplayerpos][1][bil].." - "..psdied
		elseif psdrakmaxHPadd2 and psdragontabldamage1[2][bil] then
      --для героика отображает скока нанеслось урона
      if string.find(psiccinst,psiccheroic) then
          local remain=psdragontabldamage1[2][bil]
          local he=0
          if remain>0 then
              he=psdamageceil(remain)
          else
            he="?"
          end
          pssidamageinf_title2[pssavedplayerpos][1][bil]=pssidamageinf_title2[pssavedplayerpos][1][bil]..". "..pszzdragtotdamdone..": "..he
      else
        if psiccschet3<2 then
          local remain=psdrakmaxHPadd2-psdragontabldamage1[2][bil]
          --print (psdrakmaxHPadd2)
          --print (psdragontabldamage1[2][bil])
          
          local he=0
          if remain>0 then
              he=psdamageceil(remain)
          else
            he="?"
          end
          --print (he)
          pssidamageinf_title2[pssavedplayerpos][1][bil]=pssidamageinf_title2[pssavedplayerpos][1][bil]..", "..pszzdraghpontheendcast..": "..he
        end
			end
		end		
end




end




function psdamageshow_3_allmerge(play,ar1,ar2,ar3,bosstitle,addemptyline)
  local uron=psiccdmgfrom
  local psstrochka=""
  local ret=0

        local a1=""
        local a2=""
        if pssavedinfocheckexport[1]==1 then
          a1="[color=orange]"
          a2="[/color]"
        end
    psstrochka=addemptyline..a1..psrestorelinksforexport(pssidamageinf_title2[play][ar1][ar2]).."\n\r"..uron..": "..a2

  local maxnick=#pssidamageinf_damageinfo[play][ar1][ar2][1]
  local items = {psiccall, 5, 7, 10, 12, 15, 17, 20}
  local psinfoshieldtempdamage=0
  local pstochki="."

  if pssichose5==1 then else
    if items[pssichose5]<maxnick then
      maxnick=items[pssichose5]
      pstochki=",..."
    end
  end

  if #pssidamageinf_damageinfo[play][ar1][ar2][1]>0 then
    psstrochka=bosstitle..psstrochka
    bosstitle=""
    for i = 1,maxnick do

      psinfoshieldtempdamage=psdamageceil(pssidamageinf_damageinfo[play][ar1][ar2][2][i])
      local rsccodeclass=0

      for j=1,#pssidamageinf_classcolor[play][ar1][1] do
        if pssidamageinf_classcolor[play][ar1][1][j]==pssidamageinf_damageinfo[play][ar1][ar2][1][i] then rsccodeclass=pssidamageinf_classcolor[play][ar1][2][j]
        end
      end

      local colorname=pssidamageinf_damageinfo[play][ar1][ar2][1][i]
      local tablecolor={"|CFFC69B6D","|CFFC41F3B","|CFFF48CBA","|CFFFFFFFF","|CFF1a3caa","|CFFFF7C0A","|CFFFFF468","|CFF68CCEF","|CFF9382C9","|CFFAAD372","","|cff999999"}

      if rsccodeclass==nil or rsccodeclass==0 then rsccodeclass=12 end

      if rsccodeclass>0 then
        colorname=tablecolor[rsccodeclass]..pssidamageinf_damageinfo[play][ar1][ar2][1][i].."|r"
      end

      local timesw=""
      if (pssidamageinf_indexboss[play][ar1][ar2]==202 or pssidamageinf_indexboss[play][ar1][ar2]==203) and #pssidamageinf_switchinfo[play][ar1][ar2][1]>0 then
        local bjl=0
        for jj=1,#pssidamageinf_switchinfo[play][ar1][ar2][1] do
          if pssidamageinf_switchinfo[play][ar1][ar2][1][jj]==pssidamageinf_damageinfo[play][ar1][ar2][1][i] then
            timesw=" - "..pssidamageinf_switchinfo[play][ar1][ar2][2][jj].."s"
            bjl=1
          end
        end
        if bjl==0 then
          timesw=" - ??s"
        end
      end

      if i==maxnick then
        psstrochka=psstrochka..colorname.." ("..psinfoshieldtempdamage..timesw..")"..pstochki
        if #pssidamageinf_additioninfo[play][ar1][ar2]>1 then
          for tg=2,#pssidamageinf_additioninfo[play][ar1][ar2] do
            if tg==2 then
              psstrochka=psstrochka.."\n\r"..pssidamageinf_additioninfo[play][ar1][ar2][tg]
            else
              psstrochka=psstrochka.."\n"..pssidamageinf_additioninfo[play][ar1][ar2][tg]
            end
          end
        end
        pssavedinfotextframe1:SetText(psstrochka)
      else
        psstrochka=psstrochka..colorname.." ("..psinfoshieldtempdamage..timesw.."), "
      end
    end
    ret=1
    return psstrochka, bosstitle
  end
  if ret==0 then
    return "", bosstitle
  end
end