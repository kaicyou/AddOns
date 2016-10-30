tempdmgshowvar=1
function psdamageshow_cmr(play,ar1,ar2,ar3)

if pssidamageinf_indexboss[play][ar1][ar2]==1 or pssidamageinf_indexboss[play][ar1][ar2]==2 or pssidamageinf_indexboss[play][ar1][ar2]==3 or pssidamageinf_indexboss[play][ar1][ar2]==4 or pssidamageinf_indexboss[play][ar1][ar2]==44 or pssidamageinf_indexboss[play][ar1][ar2]==5 then

--alakir + conclav mod + omni(4) + council(5)

local uron=psiccdmgfrom
if pssidamageinf_indexboss[play][ar1][ar2]==4 then
uron=psiccdmgfrom2
end

local psstrochka=""

if ar1==1 then
psstrochka="|CFFFFFF00"..psrestorelinksforexport(pssidamageinf_title2[play][ar1][ar2]).."\n\r"..uron..":|r "
else
psstrochka="|CFFFFFF00"..pssidamageinf_additioninfo[play][ar1][ar2][1].." - "..psrestorelinksforexport(pssidamageinf_title2[play][ar1][ar2]).."\n\r"..uron..":|r "
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
local tablecolor={"|CFFC69B6D","|CFFC41F3B","|CFFF48CBA","|CFFFFFFFF","|CFF1a3caa","|CFFFF7C0A","|CFFFFF468","|CFF68CCEF","|CFF9382C9","|CFFAAD372","|CFF00FF96","|cff999999","|CFFA330C9"}

if rsccodeclass==nil then rsccodeclass=12 end

if rsccodeclass>0 then
colorname=tablecolor[rsccodeclass]..pssidamageinf_damageinfo[play][ar1][ar2][1][i].."|r"
end

	local timesw=""
	if pssidamageinf_indexboss[play][ar1][ar2]==5 and #pssidamageinf_switchinfo[play][ar1][ar2][1]>0 then
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
	if pssidamageinf_indexboss[play][ar1][ar2]==4 then
		psstrochka=psstrochka..colorname.." ("..psinfoshieldtempdamage.." - "..pssidamageinf_damageinfo[play][ar1][ar2][3][i]..")"..pstochki
	else
		psstrochka=psstrochka..colorname.." ("..psinfoshieldtempdamage..timesw..")"..pstochki
	end
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
	if pssidamageinf_indexboss[play][ar1][ar2]==4 then
		psstrochka=psstrochka..colorname.." ("..psinfoshieldtempdamage.." - "..pssidamageinf_damageinfo[play][ar1][ar2][3][i].."), "
	else
		psstrochka=psstrochka..colorname.." ("..psinfoshieldtempdamage..timesw.."), "
	end
end
end

end



end-- alakir + conclav + omni + council

--ыытест определяем тип боя, для других
--if pssidamageinf_indexboss[play][ar1][ar2]==4 then
--end

end



function psdamagerep_cmr(chat,play,ar1,ar2,ar3,reptype,quant,zapusk, endcombat)

--определяем тип боя
if pssidamageinf_indexboss[play][ar1][ar2]==1 or pssidamageinf_indexboss[play][ar1][ar2]==2 or pssidamageinf_indexboss[play][ar1][ar2]==3 or pssidamageinf_indexboss[play][ar1][ar2]==4 or pssidamageinf_indexboss[play][ar1][ar2]==44 or pssidamageinf_indexboss[play][ar1][ar2]==5 then


--alakir + conclav + omni + council
local psstrochkab=""
if ar1==1 then
psstrochkab="{rt4} PS: "..pssidamageinf_title2[play][ar1][ar2]
else
psstrochkab="{rt4} PS: "..pssidamageinf_additioninfo[play][ar1][ar2][1].." - "..pssidamageinf_title2[play][ar1][ar2]
end
local uron=psiccdmgfrom
if pssidamageinf_indexboss[play][ar1][ar2]==4 then
uron=psiccdmgfrom2
end

local psstrochka=uron..": "
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
	if pssidamageinf_indexboss[play][ar1][ar2]==5 and #pssidamageinf_switchinfo[play][ar1][ar2][1]>0 then
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
		if pssidamageinf_indexboss[play][ar1][ar2]==4 then
			psstrochka=psstrochka..pssidamageinf_damageinfo[play][ar1][ar2][1][i].." ("..psinfoshieldtempdamage.." - "..kolatak..")"..pstochki
		else
			psstrochka=psstrochka..pssidamageinf_damageinfo[play][ar1][ar2][1][i].." ("..psinfoshieldtempdamage..timesw..")"..pstochki
		end
	if zapusk then
	pszapuskanonsa(chat, psstrochkab, endcombat)
	pszapuskanonsa(chat, psstrochka, endcombat)
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
		if pssidamageinf_indexboss[play][ar1][ar2]==4 then
			psstrochka=psstrochka..pssidamageinf_damageinfo[play][ar1][ar2][1][i].." ("..psinfoshieldtempdamage.." - "..kolatak.."), "
		else
			psstrochka=psstrochka..pssidamageinf_damageinfo[play][ar1][ar2][1][i].." ("..psinfoshieldtempdamage..timesw.."), "
		end
end
end

end



end-- alakir + conclav + omni


--определяем тип боя
--if psiccindexboss[ar1][ar2]==4 then

--end

end














function psdamageshow_cmr_allmerge(play,ar1,ar2,ar3,bosstitle,addemptyline)


--alakir + conclav mod + omni(4) + council(5)

local uron=psiccdmgfrom
local ret=0
if pssidamageinf_indexboss[play][ar1][ar2]==4 then
uron=psiccdmgfrom2
end

local psstrochka=""

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

    if rsccodeclass==nil then rsccodeclass=12 end

    if rsccodeclass>0 then
    colorname=tablecolor[rsccodeclass]..pssidamageinf_damageinfo[play][ar1][ar2][1][i].."|r"
    end

      local timesw=""
      if pssidamageinf_indexboss[play][ar1][ar2]==5 and #pssidamageinf_switchinfo[play][ar1][ar2][1]>0 then
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
        if pssidamageinf_indexboss[play][ar1][ar2]==4 then
          psstrochka=psstrochka..colorname.." ("..psinfoshieldtempdamage.." - "..pssidamageinf_damageinfo[play][ar1][ar2][3][i]..")"..pstochki
        else
          psstrochka=psstrochka..colorname.." ("..psinfoshieldtempdamage..timesw..")"..pstochki
        end
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
        if pssidamageinf_indexboss[play][ar1][ar2]==4 then
          psstrochka=psstrochka..colorname.." ("..psinfoshieldtempdamage.." - "..pssidamageinf_damageinfo[play][ar1][ar2][3][i].."), "
        else
          psstrochka=psstrochka..colorname.." ("..psinfoshieldtempdamage..timesw.."), "
        end
      end
    end

    ret=1
    return psstrochka, bosstitle

  end

  if ret==0 then
    return "", bosstitle
  end

end