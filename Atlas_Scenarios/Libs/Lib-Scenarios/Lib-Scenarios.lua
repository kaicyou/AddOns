--[[
Name: Lib-Scenarios
Revision: $Rev: 4 $
Maintainers: Arith
Website: https://wow.curseforge.com/addons/lib-scenarios/
Dependencies: None
License: MIT

This library provide the ability to get scenario name, step name, and step description by ID. 
By default it will return user's language, but one can toggle to show the specified language.

Sample of function calls:
local lib = LibStub:GetLibrary("Lib-Scenarios"); 
local sName, stpName, stpDesc;

sName = lib:GetScenarioNameByID(53); 
stpName = lib:GetScenarioStepNameByID(53, 1); 
stpDesc = lib:GetScenarioStepDescByID(53, 1); 

]]

local MAJOR_VERSION = "Lib-Scenarios";
local MINOR_VERSION = 90000 + tonumber(("$Rev: 2$"):match("%d+"));

local lib = LibStub:NewLibrary(MAJOR_VERSION, MINOR_VERSION);
if not lib then return end

local LANGS = {
	["enUS"] =  1;  
	["deDE"] =  2;  
	["esES"] =  3;  
	["esMX"] =  4;  
	["frFR"] =  5;  
	["itIT"] =  6;  
	["koKR"] =  7;  
	["ptBR"] =  8;  
	["ruRU"] =  9;  
	["zhCN"] = 10; 
	["zhTW"] = 11;
};

local GAME_LOCALE = GetLocale();

local function CheckLang(lang)
	if ( lang == "enUS" or
	lang == "deDE" or
	lang == "esES" or
	lang == "esMX" or
	lang == "frFR" or
	lang == "itIT" or
	lang == "koKR" or
	lang == "ptBR" or
	lang == "ruRU" or
	lang == "zhCN" or
	lang == "zhTW") then
		return true;
	else
		return false;
	end
end

--[[
To get the scenario name by given the scenario ID
]]
function lib:GetScenarioNameByID(scID, lang)
	local key = tostring(scID);
	
	if (not key) then 
		return nil;
	end
	if (lang) then
		if ( CheckLang(lang) == false ) then
			return nil
		end
	else
		lang = GetLocale();
	end

	if (LibScenariosNames[key]) then
		return LibScenariosNames[key][LANGS[lang]];
	else
		return nil;
	end
end

--[[
To get the scenario step-name by given the scenario ID and step ID
]]
function lib:GetScenarioStepNameByID(scID, stID, lang)
	local key = tostring(scID);
	
	if (not key) then 
		return nil;
	end
	if (not LibScenariosStepsDB[key]) then
		return nil;
	end
	if (not stID) then
		return nil;
	end
	if (not LibScenariosStepsDB[key][stID]) then
		return nil;
	end
	if (lang) then
		if ( CheckLang(lang) == false ) then
			return nil
		end
	else
		lang = GetLocale();
	end

	return LibScenariosStepsDB[key][stID][LANGS[lang]];
end

--[[
To get the scenario step-description by given the scenario ID and step ID
]]
function lib:GetScenarioStepDescByID(scID, stID, lang)
	local key = tostring(scID);
	
	if (not key) then 
		return nil;
	end
	if (not LibScenariosDescriptionsDB[key]) then
		return nil;
	end
	if (not stID) then
		return nil;
	end
	if (not LibScenariosDescriptionsDB[key][stID]) then
		return nil;
	end
	if (lang) then
		if ( CheckLang(lang) == false ) then
			return nil
		end
	else
		lang = GetLocale();
	end

	return LibScenariosDescriptionsDB[key][stID][LANGS[lang]];
end

--[[
To get the number of steps from specified scenario
]]
function lib:GetNumberScenarioSteps(scID)
	local key = tostring(scID);

	if (not key) then 
		return nil;
	end
	if (not LibScenariosStepsDB[key]) then
		return nil;
	else
		return getn(LibScenariosStepsDB[key]);
	end
	
end

--[[
-- below was only used for new database conversion
function Convert_StepsTempDB()
	for k, v in ipairs(LibScenariosStepsTempDB) do
		local scID, stID, st, enUS, deDE, esES, esMX, frFR, itIT, koKR, ptBR, ruRU, zhCN, zhTW = v[1], v[2], v[3], v[4], v[5], v[6], v[7], v[8], v[9], v[10], v[11], v[12], v[13], v[14], v[15];
		local num = tonumber(st);
		num = num +1;
		--st = tostring(num);
		
		if (ScenariosDB == nil) then ScenariosDB = { }; end
		if (ScenariosDB.Steps == nil) then ScenariosDB.Steps = { }; end
		if (ScenariosDB.Steps[scID] == nil) then ScenariosDB.Steps[scID] = { }; end
		if (ScenariosDB.Steps[scID][num] == nil) then ScenariosDB.Steps[scID][num] = { }; end
		ScenariosDB.Steps[scID][num] = { enUS, deDE, esES, esMX, frFR, itIT, koKR, ptBR, ruRU, zhCN, zhTW };
	end
end

function Convert_DescTempDB()
	for k, v in ipairs(LibScenariosDescriptionsTempDB) do
		local scID, stID, st, enUS, deDE, esES, esMX, frFR, itIT, koKR, ptBR, ruRU, zhCN, zhTW = v[1], v[2], v[3], v[4], v[5], v[6], v[7], v[8], v[9], v[10], v[11], v[12], v[13], v[14], v[15];
		local num = tonumber(st);
		num = num +1;
		--st = tostring(num);
		
		if (ScenariosDB == nil) then ScenariosDB = { }; end
		if (ScenariosDB.Desc == nil) then ScenariosDB.Desc = { }; end
		if (ScenariosDB.Desc[scID] == nil) then ScenariosDB.Desc[scID] = { }; end
		if (ScenariosDB.Desc[scID][num] == nil) then ScenariosDB.Desc[scID][num] = { }; end
		ScenariosDB.Desc[scID][num] = { enUS, deDE, esES, esMX, frFR, itIT, koKR, ptBR, ruRU, zhCN, zhTW };
	end
end
]]