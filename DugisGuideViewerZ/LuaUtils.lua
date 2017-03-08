-------------------------- LUA UTILS ---------------------------
LuaUtils = {}

DugisGuideUser = {
	QuestState = {}, --Tristate either skipped (x), finished (check) or neither (empty)
	turnedinquests = {},
	toskip = {},
	Debug = {},
}

DugisGuideUser.NoQuestLogUpdateTrigger = nil

--Vector
local function NormalizeVector(x, y)
    local length = math.sqrt(x * x + y * y)
    
    if length == 0 then
        return 0, 0
    end 
    
    return x / length, y / length
end


function LuaUtils:split(pString, pPattern)
    local Table = {}
    local fpat = "(.-)" .. pPattern
    local last_end = 1
    local s, e, cap = pString:find(fpat, 1)
    
    while s do
        if s ~= 1 or cap ~= "" then
            table.insert(Table, cap)
        end
        last_end = e + 1
        s, e, cap = pString:find(fpat, last_end)
    end
    
    if last_end <= #pString then
        cap = pString:sub(last_end)
        table.insert(Table, cap)
    end
    
    return Table
end

function LuaUtils:separateCamelCase(aString)
    aString = aString:gsub( "(%l)(%u)", "%1 %2" )
    aString = aString:gsub( "(%u)(%u)(%l)", "%1 %2%3" )
    local result = ""
    
    aString:gsub( "%a+", function(item) 
        result = result..item.." "
    end)
    
    return LuaUtils:trim(result)
end

function LuaUtils:CamelCase(text)
    return text:gsub("(%l)(%w*)", function(a,b) return string.upper(a)..b end)
end



function LuaUtils:trim(text)
    return text:gsub("^%s*(.-)%s*$", "%1")
end

function LuaUtils:crop(text, length)
    return string.sub(text, 1, length)
end

function LuaUtils:IsNilOrEmpty(text)
    return text == nil or self:trim(text) == ""
end

function LuaUtils:matchString(input, pattern)
    local val = input:match(pattern)
    
    if val == nil then
        val = ""
    end
    
    return val
end

--Breaks in case func returns "break" string
function LuaUtils:foreach(items, func)
    local index = 1
    for key, value in pairs (items) do
      local result = func(value, key, index)
      if result == "break" then return end
      index = index + 1
    end 
end

function LuaUtils:indexOf(item, table)
    local result = nil
    LuaUtils:foreach(table, function(value, index)
        if value == item then
            result = index
        end
    end)
    
    return result
end

function LuaUtils:loop(times, func, unpackResults)
    local results = {}
    for i = 1, times do
      local result = func(i)
      
      if result == "break" then
        break
      end
      
      results[i] = result
    end 
    if unpackResults ~= true then
        return results
    else
        return unpack(results)
    end
end

function LuaUtils:loopAndUnpack(times, func)
    return self:loop(times, func, true)
end

function LuaUtils:isInTable(item, tbl)
    for key, value in pairs(tbl) do
        if value == item then return key end
    end
    return false
end


function LuaUtils:dumpVar ( t )
    local print_r_cache={}
    local function sub_print_r(t,indent)
        if (print_r_cache[tostring(t)]) then
        print(indent.."*"..tostring(t))
        else
            print_r_cache[tostring(t)]=true
            if (type(t)=="table") then
                for pos,val in pairs(t) do
                    if (type(val)=="table") then
                        print(indent.."["..pos.."] => "..tostring(t).." {")
                        sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
                        print(indent..string.rep(" ",string.len(pos)+6).."}")
                    else
                        print(indent.."["..pos.."] => "..tostring(val))
                    end
                end
            else
                print(indent..tostring(t))
            end
        end
    end
    sub_print_r(t," ")
end      
 
LuaUtils.Profiler = {}
LuaUtils.Profiler.Counters = {}
LuaUtils.Profiler.Sums = {}

--Label is optional if you don't have nested timers
function LuaUtils.Profiler:Start(label)
    if label then
      --  print("START: ", label)
        LuaUtils.Profiler.Counters[label] = debugprofilestop()
    else
        debugprofilestart()
    end
    
    LuaUtils.Profiler.Sums[label] = 0
end

function LuaUtils.Profiler:PeriodStart(label)
    LuaUtils.Profiler.Counters[label] = debugprofilestop()
end

function LuaUtils.Profiler:PeriodEnd(label)
    LuaUtils.Profiler.Sums[label] = LuaUtils.Profiler.Sums[label] + (debugprofilestop() - LuaUtils.Profiler.Counters[label])
end

function LuaUtils.Profiler:Stop(label)
    if LuaUtils.Profiler.Counters[label] then
       -- print(label, " FINISHED. Duration: ", debugprofilestop() - LuaUtils.Profiler.Counters[label], "ms")
    else
       -- print(label, " FINISHED. Duration: ", debugprofilestop(), "ms")
    end
end

function LuaUtils.Profiler:StopSum(label)
     print(label, " SUM: ", LuaUtils.Profiler.Sums[label])
end

function IsFrameVisible(frameName)
    return _G[frameName]~= nil and _G[frameName]:IsVisible()
end

local currentPlayerFacing = 0

function GetPlayerFacing_dugi()
    local result
    if GetPlayerFacing then
        result = GetPlayerFacing()
    end
    
    if not result then
        result = currentPlayerFacing
    end

    return result
end

local lastPlayerPositionX
local lastPlayerPositionY

local function AngleBetween(_x1, _x2, _y1, _y2)
    local a = _x1 * _y2 - _x2 * _y1;  
    local b = _x1 * _x2 + _y1 * _y2;

    return math.atan2(a, b)
end

local function CalculateCurrentFacing()
    if not GetPlayerMapPosition then
        return
    end
    local unitX, unitY = GetPlayerMapPosition("player")
    
    if not unitX then
        return
    end
    
    if not lastPlayerPositionX then
        lastPlayerPositionX, lastPlayerPositionY = unitX, unitY
        return
    end
    
    local dX = unitX - lastPlayerPositionX
    local dY = unitY - lastPlayerPositionY
    
    dY = -dY
    
    --Player didn't move
    if dX == 0 or dY == 0 then
        return
    end
    
    dX, dY = NormalizeVector(dX, dY)
    
    local angle = AngleBetween(0.0, dX, -1.0, dY) + 3.14159265358
    
	--Correction:
	--angle = angle - (math.sin(angle)*0.2)
    currentPlayerFacing = angle
    
    lastPlayerPositionX, lastPlayerPositionY = unitX, unitY
end

dugisThreads = {}

-- threadThrottle (if == 1 then one execution per second)
function LuaUtils:CreateThread(threadName, threadFunction, onEnd, resumeAmountPerFrame, threadThrottle, arguments)

    --Default values
    threadThrottle = threadThrottle or 0.01
    resumeAmountPerFrame = resumeAmountPerFrame or 40
    arguments = arguments or {}

    if not DugiThreadFrame then
    
    CreateFrame("Frame", "DugiThreadFrame")
    
	DugiThreadFrame:SetScript("OnUpdate" , function(self, elapsed)
    
        LuaUtils:foreach(dugisThreads, function(thread, threadName_)
        
		thread.threadCounter = thread.threadCounter + elapsed
		if thread.threadCounter >= thread.threadThrottle then
			thread.threadCounter = thread.threadCounter - thread.threadThrottle
            
            if thread ~= nil then
                if coroutine.status(thread.thread) ~= "dead" then
                    for i=1, thread.resumeAmountPerFrame do
                        if coroutine.status(thread.thread) ~= "dead" then
                            local result, message = coroutine.resume(thread.thread, unpack(thread.arguments))
                            local status = coroutine.status(thread.thread)
                            if status=="dead"and result == false then
                                assert(false, threadName_..":\n" .. message)
                            end
                        end
                    end
                else
                    if thread.onEnd then
                        thread.onEnd()
                    end
                    dugisThreads[threadName_] = nil
                end
            end
		end
        
        end)
        
        CalculateCurrentFacing()
	end) 
    
    end

    local threadName = "thread_"..threadName
    
    dugisThreads[threadName] = {
        thread = coroutine.create(threadFunction),
        threadCounter = 0,
        threadThrottle = threadThrottle,
        resumeAmountPerFrame = resumeAmountPerFrame,
        onEnd = onEnd,
        arguments = arguments,
        threadFunction = threadFunction,
    }
    
end

function LuaUtils:ThreadInProgress(threadName)
    threadName = "thread_"..threadName
    return dugisThreads[threadName]~=nil
end


function LuaUtils:Yield(isInThread)
    if isInThread then
        coroutine.yield()
    end
end

function LuaUtils:RunInThreadIfNeeded(threadName, threadFunction, onEnd, arguments, alwaysTunInThread)
    arguments = arguments or {}

    if UnitAffectingCombat("player") or alwaysTunInThread then
        MainFramePreloader:ShowPreloader()
        if SmallFramePreloader then
            SmallFramePreloader:ShowPreloader()
        end
    
        LuaUtils:CreateThread(threadName, threadFunction, function() 
            if onEnd then
                onEnd()
            end
            MainFramePreloader:HidePreloader()
            if SmallFramePreloader then
                SmallFramePreloader:HidePreloader()
            end
        end, 20, nil, {true, unpack(arguments)})
    else
        return threadFunction(false, unpack(arguments))
    end
end

function LuaUtils:clone(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[LuaUtils:clone(orig_key)] = LuaUtils:clone(orig_value)
        end
        setmetatable(copy, LuaUtils:clone(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

function LuaUtils:MergeTables(t1, t2)
    local result = {}
    
    LuaUtils:foreach(t2, function(v, k)
        result[k] = v
    end)
    
    LuaUtils:foreach(t1, function(v, k)
        result[k] = v
    end)    
       
    return result
end

function LuaUtils:Delay(timeSec, function_)
    C_Timer.After(timeSec, function_)
end

table.filter = function(t, filterIter)
  if not t then
    return t
  end
  local out = {}

  for k, v in pairs(t) do
    if filterIter(v, k, t) then out[k] = v end
  end

  return out
end

function LuaUtils:WaitForCombatEnd(waitForever)
    if not UnitAffectingCombat("player") then
        return
    end
    
    if waitForever then
        while UnitAffectingCombat("player") do
            coroutine.yield()
            OnPlayerInCombat()
        end
    else
        for i = 1, 1000 do
            if UnitAffectingCombat("player") then
                coroutine.yield()
                OnPlayerInCombat()
            end
        end
    end
end

function LuaUtils:Round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end

function LuaUtils:normalized2HexColor(r,g,b)
    return string.format("ff%02x%02x%02x", r*255, g*255, b*255)
end

--Export functions

--/run ExportDungeonsInfo()
function ExportDungeonsInfo()
    DataExport = {} 
    DataExport.A = "dungeonId;name; typeID; subtypeID; minLevel; maxLevel; recLevel; minRecLevel; maxRecLevel; expansionLevel; groupID; textureFilename; difficulty; maxPlayers; description; isHoliday; bonusRepAmount; minPlayers"
    
    DataExport.B = "{"
    
    LuaUtils:loop(9000, function(index)
        local dungeonId = index - 1
        local name, typeID, subtypeID, minLevel, maxLevel, recLevel, minRecLevel, maxRecLevel, expansionLevel, groupID, textureFilename, difficulty, maxPlayers, description, isHoliday, bonusRepAmount, minPlayers = GetLFGDungeonInfo(dungeonId)
       
        if name then
            DataExport.A = DataExport.A ..
            string.format ("\n%s;%s;%s;%s;%s;%s;%s;%s;%s;%s;%s;%s;%s;%s;%s;%s;%s;%s"
            , dungeonId, name, typeID, subtypeID, minLevel, maxLevel, recLevel, minRecLevel, maxRecLevel, expansionLevel, groupID, textureFilename, difficulty, maxPlayers, description, tostring(isHoliday), bonusRepAmount, minPlayers or "")
            
            DataExport.B = DataExport.B .. "{\""..name .."\", \"".. dungeonId .. "\"},"
        end
    end)
    DataExport.B = DataExport.B .. "}"
end

--in bytes
function LuaUtils:getVariableSize(variable, step--[[, path]])
    if step == nil then
        step = 0
    end    
    
  --[[  if path == nil then
        path = ""
    end]]

    if variable == nil then
        return 0
    end
    
    if type(variable) == "boolean" then
        return 8
    end
    
    if type (variable) == "number" then
        return 32
    end    
    
    if type (variable) == "string" then
        return string.len(variable) * 16
    end      
    
    if type (variable) == "function" then
        return 32
    end  
    
    if type (variable) == "userdata" then
        return 32 -- pointer
    end      

    if type (variable) == "table" then
        local tableSize = 32 -- pointer
        for pos, val in pairs(variable) do
        
           -- path = path .. "." .. pos
            if step > 18 then
              --  print("max step: ", --[[path,]] step)
                return 0
            end        
        
            tableSize = tableSize + LuaUtils:getVariableSize(pos, step + 1--[[, path]])
            tableSize = tableSize + LuaUtils:getVariableSize(val, step + 1--[[, path]])
        end
        
        return tableSize
    end 

    print("Unknown type:", type(variable))
    return 0
end

--in KB
function LuaUtils:getVariableSizeInMB(variable--[[, path]])
    local inBytes = LuaUtils:getVariableSize(variable, nil--[[, path]])
    local inKb = inBytes / 1000
    local inKB = inKb / 8
    local inMB = inKB / 1000
    return inMB
end

--print global variables
--/run LuaUtils:printVariableSizeInMB()
function LuaUtils:printVariableSizeInMB(root)
    local variablesInfo = {}
    for pos, val in pairs(root) do
        local size = LuaUtils:getVariableSizeInMB(val, pos)
        local name = pos
        variablesInfo[#variablesInfo + 1] = {name=name, size=size}
    end
    table.sort(variablesInfo, function(a,b)  
        return a.size < b.size  
    end)
    
    local total = 0
    LuaUtils:foreach(variablesInfo, function(value)
        total = total + value.size
      --  print(value.name, " " , value.size, "MB")
    end)
    print("TOTAL", " " , total, "MB")
end



function GetItemInfo_dugi(itemLink, threadingMode)
    local a, b, c, d, e, f, g, h, i, j, k, l, m = GetItemInfo(itemLink)
    
    if threadingMode then
        local counter = 0
        while not a and counter < 1000 do
            counter = counter + 1
            coroutine.yield()
            coroutine.yield()
            a, b, c, d, e, f, g, h, i, j, k, l, m = GetItemInfo(itemLink)
        end
        if counter > 500 then
           -- print(itemLink, counter)
        end
    end
    
    return a, b, c, d, e, f, g, h, i, j, k, l, m
end

------Patch 7.0.3 legion GetQuestWorldMapAreaID, SetMapByID, SetMapToCurrentZone now triggers QUEST_LOG_UPDATE which spam our hook.

function LuaUtils:DugiGetQuestWorldMapAreaID(questId)
	DugisGuideUser.NoQuestLogUpdateTrigger = true
	return GetQuestWorldMapAreaID(questId)
end 

function LuaUtils:DugiSetMapByID(mapId)
	DugisGuideUser.NoQuestLogUpdateTrigger = true
    if tonumber(mapId) ~= nil then
        return SetMapByID(mapId)
    end
end 

function LuaUtils:DugiSetMapToCurrentZone()
	if not GetPlayerFacing() then return end
	DugisGuideUser.NoQuestLogUpdateTrigger = true
	SetMapToCurrentZone()
end

----Post combat loading
local postCombatRunQueue = {}
function LuaUtils:PostCombatRun(name, function_)
    if UnitAffectingCombat("player")  then
        if not postCombatRunQueue[name] then
            postCombatRunQueue[name] = function_
        end
    else
        function_(false)
    end
end

function LuaUtils:RunPostCombatFunctions()
    LuaUtils:foreach(postCombatRunQueue, function(function_)
        function_(true)
        coroutine.yield()
    end)
    
    postCombatRunQueue = {}
end

LuaUtils:CreateThread("dugi-post-combat-invoke", function()
    while UnitAffectingCombat("player") do
        coroutine.yield()
    end
    LuaUtils:RunPostCombatFunctions()
end)

function LuaUtils:collectgarbage(threading)
    if threading then
        LuaUtils:loop(100, function()
           coroutine.yield()
           collectgarbage ("step" , 100)
        end)
    else
        collectgarbage()
    end
end