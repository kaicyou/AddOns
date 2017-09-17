function psoldcheck1()
if IsAddOnLoaded("PhoenixStyleMod_CataMiniRaids") then psiccwipereport("wipe", "try", nil, "checkforwipe") end
if IsAddOnLoaded("PhoenixStyleMod_Firelands") then psiccwipereport_2("wipe", "try", nil, "checkforwipe") end
if IsAddOnLoaded("PhoenixStyleMod_DragonSoul") then psiccwipereport_3("wipe", "try", nil, "checkforwipe") end
end

psversionCata=7.300

function psoldcheck2()
if IsAddOnLoaded("PhoenixStyleMod_CataMiniRaids") then psiccwipereport() end
if IsAddOnLoaded("PhoenixStyleMod_Firelands") then psiccwipereport_2() end
if IsAddOnLoaded("PhoenixStyleMod_DragonSoul") then psiccwipereport_3() end
end


function psoldcataradiobutchange(aa,bb)
--ыытест дл€ т1 каты ката
if psmenuchoose1==1 or psmenuchoose1==2 or psmenuchoose1==3 or psmenuchoose1==4 then
psicctableradiobut[1][bb]:SetChecked(false)
psicctableradiobut[2][bb]:SetChecked(false)
psicctableradiobut[3][bb]:SetChecked(false)
psraidoptionschatt1[psmenuchoose1][psmenuchoose2][bb]=aa
psicctableradiobut[aa][bb]:SetChecked(true)
if aa==1 then
psicctablecifr[bb]:SetText("|cff00ff001|r")
elseif aa==2 then
psicctablecifr[bb]:SetText("|cffff00002|r")
elseif aa==3 then
psicctablecifr[bb]:SetText("|CFFFFFF003|r")
end
end

--ыытест дл€ т2 каты ката
if psmenuchoose1==5 then
psicctableradiobut[1][bb]:SetChecked(false)
psicctableradiobut[2][bb]:SetChecked(false)
psicctableradiobut[3][bb]:SetChecked(false)
psraidoptionschatt2[1][psmenuchoose2][bb]=aa
psicctableradiobut[aa][bb]:SetChecked(true)
if aa==1 then
psicctablecifr[bb]:SetText("|cff00ff001|r")
elseif aa==2 then
psicctablecifr[bb]:SetText("|cffff00002|r")
elseif aa==3 then
psicctablecifr[bb]:SetText("|CFFFFFF003|r")
end
end

--ыытест дл€ т3 каты ката
if psmenuchoose1==6 then
psicctableradiobut[1][bb]:SetChecked(false)
psicctableradiobut[2][bb]:SetChecked(false)
psicctableradiobut[3][bb]:SetChecked(false)
psraidoptionschatt3[1][psmenuchoose2][bb]=aa
psicctableradiobut[aa][bb]:SetChecked(true)
if aa==1 then
psicctablecifr[bb]:SetText("|cff00ff001|r")
elseif aa==2 then
psicctablecifr[bb]:SetText("|cffff00002|r")
elseif aa==3 then
psicctablecifr[bb]:SetText("|CFFFFFF003|r")
end
end
end


function psoldcatacheckik(nrmenu)
if psmenuchoose1==1 or psmenuchoose1==2 or psmenuchoose1==3 or psmenuchoose1==4 then
	if psraidoptionsont1[psmenuchoose1][psmenuchoose2] and psraidoptionsont1[psmenuchoose1][psmenuchoose2][nrmenu] then
		if psraidoptionsont1[psmenuchoose1][psmenuchoose2][nrmenu]==1 then
			psraidoptionsont1[psmenuchoose1][psmenuchoose2][nrmenu]=0 else psraidoptionsont1[psmenuchoose1][psmenuchoose2][nrmenu]=1
		end
	else
		--SA плай изменений
		local whichsais=0
		for i=1,nrmenu do
			if psraidoptionsont1[psmenuchoose1][psmenuchoose2][i]==nil then
				whichsais=whichsais+1
			end
		end
		if ps_saoptions[pssetexpans][psmenuchoose1][psmenuchoose2][whichsais] then
			if ps_saoptions[pssetexpans][psmenuchoose1][psmenuchoose2][whichsais]==1 then
				ps_saoptions[pssetexpans][psmenuchoose1][psmenuchoose2][whichsais]=0
			else
				ps_saoptions[pssetexpans][psmenuchoose1][psmenuchoose2][whichsais]=1
			end
		end
	end
end

--ыытест дл€ т2 каты ката
if psmenuchoose1==5 then
	if psraidoptionsont2[1][psmenuchoose2] and psraidoptionsont2[1][psmenuchoose2][nrmenu] then
		if psraidoptionsont2[1][psmenuchoose2][nrmenu]==1 then
			psraidoptionsont2[1][psmenuchoose2][nrmenu]=0
		else
			psraidoptionsont2[1][psmenuchoose2][nrmenu]=1
		end
	else
		--SA плай изменений
		local whichsais=0
		for i=1,nrmenu do
			if psraidoptionsont2[1][psmenuchoose2][i]==nil then
				whichsais=whichsais+1
			end
		end
		if ps_saoptions[pssetexpans][psmenuchoose1][psmenuchoose2][whichsais] then
			if ps_saoptions[pssetexpans][psmenuchoose1][psmenuchoose2][whichsais]==1 then
				ps_saoptions[pssetexpans][psmenuchoose1][psmenuchoose2][whichsais]=0
			else
				ps_saoptions[pssetexpans][psmenuchoose1][psmenuchoose2][whichsais]=1
			end
		end
	end
end

--ыытест дл€ т3 каты ката
if psmenuchoose1==6 then
	if psraidoptionsont3[1][psmenuchoose2] and psraidoptionsont3[1][psmenuchoose2][nrmenu] then
		if psraidoptionsont3[1][psmenuchoose2][nrmenu]==1 then
			psraidoptionsont3[1][psmenuchoose2][nrmenu]=0
		else
			psraidoptionsont3[1][psmenuchoose2][nrmenu]=1
		end
	else
		--SA плай изменений
		local whichsais=0
		for i=1,nrmenu do
			if psraidoptionsont3[1][psmenuchoose2][i]==nil then
				whichsais=whichsais+1
			end
		end
		if ps_saoptions[pssetexpans][psmenuchoose1][psmenuchoose2][whichsais] then
			if ps_saoptions[pssetexpans][psmenuchoose1][psmenuchoose2][whichsais]==1 then
				ps_saoptions[pssetexpans][psmenuchoose1][psmenuchoose2][whichsais]=0
			else
				ps_saoptions[pssetexpans][psmenuchoose1][psmenuchoose2][whichsais]=1
			end
		end
	end
end
end


function psoldcataallrezet()
if psmenuchoose1>0 and psmenuchoose1<5 then

table.wipe(psraidoptionsont1[psmenuchoose1])
table.wipe(psraidoptionschatt1[psmenuchoose1])

pscmrpassvariables()


table.wipe(psraidoptionson[pssetexpans][psmenuchoose1])
table.wipe(psraidoptionschat[pssetexpans][psmenuchoose1])

local i=psmenuchoose1
	if psraidoptionson[pssetexpans][i]==nil then psraidoptionson[pssetexpans][i]={}
	end
	for j=1,#psraidoptionsont1[i] do
		if psraidoptionson[pssetexpans][i][j]==nil then
			psraidoptionson[pssetexpans][i][j]={}
		end
		for t=1,#psraidoptionsont1[i][j] do
			if psraidoptionson[pssetexpans][i][j][t]==nil then
				psraidoptionson[pssetexpans][i][j][t]=psraidoptionsont1[i][j][t]
			end
		end
	end



	if psraidoptionschat[pssetexpans][i]==nil then psraidoptionschat[pssetexpans][i]={}
	end
	for j=1,#psraidoptionschatt1[i] do
		if psraidoptionschat[pssetexpans][i][j]==nil then
			psraidoptionschat[pssetexpans][i][j]={}
		end
		for t=1,#psraidoptionschatt1[i][j] do
			if psraidoptionschat[pssetexpans][i][j][t]==nil then
				psraidoptionschat[pssetexpans][i][j][t]=psraidoptionschatt1[i][j][t]
			end
		end
	end




end

--ыытест firelands
if psmenuchoose1==5 then

--в 5ую табл вставл€ю 1ую табл с модул€
table.wipe(psraidoptionsont2[1])
table.wipe(psraidoptionschatt2[1])

pscmrpassvariables_2()


table.wipe(psraidoptionson[pssetexpans][psmenuchoose1])
table.wipe(psraidoptionschat[pssetexpans][psmenuchoose1])

local i=psmenuchoose1
	if psraidoptionson[pssetexpans][i]==nil then psraidoptionson[pssetexpans][i]={}
	end
	for j=1,#psraidoptionsont2[1] do
		if psraidoptionson[pssetexpans][i][j]==nil then
			psraidoptionson[pssetexpans][i][j]={}
		end
		for t=1,#psraidoptionsont2[1][j] do
			if psraidoptionson[pssetexpans][i][j][t]==nil then
				psraidoptionson[pssetexpans][i][j][t]=psraidoptionsont2[1][j][t]
			end
		end
	end


	if psraidoptionschat[pssetexpans][i]==nil then psraidoptionschat[pssetexpans][i]={}
	end
	for j=1,#psraidoptionschatt2[1] do
		if psraidoptionschat[pssetexpans][i][j]==nil then
			psraidoptionschat[pssetexpans][i][j]={}
		end
		for t=1,#psraidoptionschatt2[1][j] do
			if psraidoptionschat[pssetexpans][i][j][t]==nil then
				psraidoptionschat[pssetexpans][i][j][t]=psraidoptionschatt2[1][j][t]
			end
		end
	end


end

--ыытест dragon soul
if psmenuchoose1==6 then

--в 5ую табл вставл€ю 1ую табл с модул€
table.wipe(psraidoptionsont3[1])
table.wipe(psraidoptionschatt3[1])

pscmrpassvariables_3()


table.wipe(psraidoptionson[pssetexpans][psmenuchoose1])
table.wipe(psraidoptionschat[pssetexpans][psmenuchoose1])

local i=psmenuchoose1
	if psraidoptionson[pssetexpans][i]==nil then psraidoptionson[pssetexpans][i]={}
	end
	for j=1,#psraidoptionsont3[1] do
		if psraidoptionson[pssetexpans][i][j]==nil then
			psraidoptionson[pssetexpans][i][j]={}
		end
		for t=1,#psraidoptionsont3[1][j] do
			if psraidoptionson[pssetexpans][i][j][t]==nil then
				psraidoptionson[pssetexpans][i][j][t]=psraidoptionsont3[1][j][t]
			end
		end
	end


	if psraidoptionschat[pssetexpans][i]==nil then psraidoptionschat[pssetexpans][i]={}
	end
	for j=1,#psraidoptionschatt3[1] do
		if psraidoptionschat[pssetexpans][i][j]==nil then
			psraidoptionschat[pssetexpans][i][j]={}
		end
		for t=1,#psraidoptionschatt3[1][j] do
			if psraidoptionschat[pssetexpans][i][j][t]==nil then
				psraidoptionschat[pssetexpans][i][j][t]=psraidoptionschatt3[1][j][t]
			end
		end
	end


end
end


function psoldcatawipebossid(id)
  local bil2=0
	if IsAddOnLoaded("PhoenixStyleMod_CataMiniRaids") then
		--1 - 4 потому что эти модули загружены, дл€ других цифры иные
		for i=1,4 do
			for j=1,#psbossid[1][i] do
				for t=1,#psbossid[1][i][j] do
					if psbossid[1][i][j][t]==id then
						bil2=1
					end
				end
			end
		end
		if bil2==1 then
				psiccwipereport()
		end
	end

	bil2=0

	if IsAddOnLoaded("PhoenixStyleMod_Firelands") then
		--5 потому что эти модули загружены, дл€ других цифры иные
			for j=1,#psbossid[1][5] do
				for t=1,#psbossid[1][5][j] do
					if psbossid[1][5][j][t]==id then
						bil2=1
					end
				end
			end
		if bil2==1 then
				psiccwipereport_2()
		end
	end

	bil2=0

	if IsAddOnLoaded("PhoenixStyleMod_DragonSoul") then
		--6 потому что эти модули загружены, дл€ других цифры иные
			for j=1,#psbossid[1][6] do
				for t=1,#psbossid[1][6][j] do
					if psbossid[1][6][j][t]==id then
						bil2=1
					end
				end
			end
		if bil2==1 then
				psiccwipereport_3()
		end
	end
end


function psoldcatadeathgetbossname()
  if pswasonboss11 then
    psdeathrepbossnametemp=psbossnames[1][1][1]
  elseif pswasonboss12 then
    psdeathrepbossnametemp=psbossnames[1][1][2]
  elseif pswasonboss13 then
    psdeathrepbossnametemp=psbossnames[1][1][3]
  elseif pswasonboss21 then
    psdeathrepbossnametemp=psbossnames[1][2][1]
  elseif pswasonboss22 then
    psdeathrepbossnametemp=psbossnames[1][2][2]
  elseif pswasonboss23 then
    psdeathrepbossnametemp=psbossnames[1][2][3]
  elseif pswasonboss24 then
    psdeathrepbossnametemp=psbossnames[1][2][4]
  elseif pswasonboss25 then
    psdeathrepbossnametemp=psbossnames[1][2][5]
  elseif pswasonboss26 then
    psdeathrepbossnametemp=psbossnames[1][2][6]
  elseif pswasonboss31 then
    psdeathrepbossnametemp=psbossnames[1][3][1]
  elseif pswasonboss32 then
    psdeathrepbossnametemp=psbossnames[1][3][2]
  elseif pswasonboss33 then
    psdeathrepbossnametemp=psbossnames[1][3][3]
  elseif pswasonboss34 then
    psdeathrepbossnametemp=psbossnames[1][3][4]
  elseif pswasonboss35 then
    psdeathrepbossnametemp=psbossnames[1][3][5]
  elseif pswasonboss41 then
    psdeathrepbossnametemp=psbossnames[1][4][1]
  elseif pswasonboss42 then
    psdeathrepbossnametemp=psbossnames[1][4][2]
  elseif pswasonboss51 then
    psdeathrepbossnametemp=psbossnames[1][5][1]
  elseif pswasonboss52 then
    psdeathrepbossnametemp=psbossnames[1][5][2]
  elseif pswasonboss53 then
    psdeathrepbossnametemp=psbossnames[1][5][3]
  elseif pswasonboss54 then
    psdeathrepbossnametemp=psbossnames[1][5][4]
  elseif pswasonboss55 then
    psdeathrepbossnametemp=psbossnames[1][5][5]
  elseif pswasonboss56 then
    psdeathrepbossnametemp=psbossnames[1][5][6]
  elseif pswasonboss57 then
    psdeathrepbossnametemp=psbossnames[1][5][7]
  elseif pswasonboss61 then
    psdeathrepbossnametemp=psbossnames[1][6][1]
  elseif pswasonboss62 then
    psdeathrepbossnametemp=psbossnames[1][6][2]
  elseif pswasonboss63 then
    psdeathrepbossnametemp=psbossnames[1][6][3]
  elseif pswasonboss64 then
    psdeathrepbossnametemp=psbossnames[1][6][4]
  elseif pswasonboss65 then
    psdeathrepbossnametemp=psbossnames[1][6][5]
  elseif pswasonboss66 then
    psdeathrepbossnametemp=psbossnames[1][6][6]
  elseif pswasonboss67 then
    psdeathrepbossnametemp=psbossnames[1][6][7]
  elseif pswasonboss68 then
    psdeathrepbossnametemp=psbossnames[1][6][8]
  end
end