if not game:IsLoaded() then
    game.Loaded:Wait();
end;
if not LPH_OBFUSCATED then
    function LPH_ENCFUNC(f, encKey, decKey) return f end
    function LPH_ENCSTR(s) return s end
    function LPH_ENCNUM(n) return n end
    function LPH_CRASH() (nil)() end
    function LPH_JIT(f) return f end
    function LPH_JIT_MAX(f) return f end
    function LPH_NO_VIRTUALIZE(f) return f end
    function LPH_NO_UPVALUES(f) return f end
    LPH_OBFUSCATED = false
    LPH_LINE = 0
    LRM_IsUserPremium = true
    LRM_ScriptName = 'ScriptName'
    LRM_TotalExecutions = 0
    LRM_SecondsLeft = 999999
    LRM_UserNote = 'UserNote'
end
local kickPlayerFunction = LPH_NO_VIRTUALIZE(function(index)
    local playersService = game:GetService("Players");
    if not playersService.LocalPlayer then
        playersService:GetPropertyChangedSignal("LocalPlayer"):Wait();
    end;
    return playersService.LocalPlayer:Kick(`MSPROTECT - {N_0}\10`);
end);
for i = 1, 1000, 1 do
    if not debug.info(i, "f") then
        if i == 3 then
            break;
        end;
        return kickPlayerFunction("Please ensure the script is being ran from the loader!");
    end;
end;
local debugInfoFunction = nil;
local unknownValue = nil;
local iteratorFunction = nil;
local gameService = game;
local workspaceService = workspace;
local httpRequestFunction = http_request or request or http and http.request;
local messageBoxFunction = messagebox or function()
    return ;
end;
local ypcallFunction = ypcall;
local xpcallFunction = xpcall;
local setEnvironmentFunction = setfenv;
local setMetatableFunction = setmetatable;
local debugInfo = debug.info;
local taskSpawnFunction = task.spawn;
local taskWaitFunction = task.wait;
local stringFormatFunction = string.format;
local stringSplitFunction = string.split;
local stringSub = string.sub;
local stringCache = {};
local errorHandlerFunction = function(...)
    local arg1, arg2, arguments = ...;
    local unknownBoolean = nil;
    taskSpawnFunction(function()
        unknownBoolean = true;
        return ;
    end);
    if unknownBoolean then
    end;
    if arg2 then
        return ;
    end;
    taskSpawnFunction(ypcallFunction, function()
        messageBoxFunction((function(...)
            local varArgs = ...;
            local counter = 670504900 + ((bit32.band((bit32.lrotate(string.len("\030\147") + 123, 3))) >= 152 and 14 or 182) - 307);
            local stackTable = STACK;
            local stringChar = string.char;
            local stringByte = string.byte;
            local setMetatableLocal = setmetatable;
            local getMetatableFunction = getmetatable;
            local nextFunction = next;
            local matrix = { [0] = { [0] = 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 }, { [0] = 1, 0, 3, 2, 5, 4, 7, 6, 9, 8, 11, 10, 13, 12, 15, 14 }, { [0] = 2, 3, 0, 1, 6, 7, 4, 5, 10, 11, 8, 9, 14, 15, 12, 13 }, { [0] = 3, 2, 1, 0, 7, 6, 5, 4, 11, 10, 9, 8, 15, 14, 13, 12 }, { [0] = 4, 5, 6, 7, 0, 1, 2, 3, 12, 13, 14, 15, 8, 9, 10, 11 }, { [0] = 5, 4, 7, 6, 1, 0, 3, 2, 13, 12, 15, 14, 9, 8, 11, 10 }, { [0] = 6, 7, 4, 5, 2, 3, 0, 1, 14, 15, 12, 13, 10, 11, 8, 9 }, { [0] = 7, 6, 5, 4, 3, 2, 1, 0, 15, 14, 13, 12, 11, 10, 9, 8 }, { [0] = 8, 9, 10, 11, 12, 13, 14, 15, 0, 1, 2, 3, 4, 5, 6, 7 }, { [0] = 9, 8, 11, 10, 13, 12, 15, 14, 1, 0, 3, 2, 5, 4, 7, 6 }, { [0] = 10, 11, 8, 9, 14, 15, 12, 13, 2, 3, 0, 1, 6, 7, 4, 5 }, { [0] = 11, 10, 9, 8, 15, 14, 13, 12, 3, 2, 1, 0, 7, 6, 5, 4 }, { [0] = 12, 13, 14, 15, 8, 9, 10, 11, 4, 5, 6, 7, 0, 1, 2, 3 }, { [0] = 13, 12, 15, 14, 9, 8, 11, 10, 5, 4, 7, 6, 1, 0, 3, 2 }, { [0] = 14, 15, 12, 13, 10, 11, 8, 9, 6, 7, 4, 5, 2, 3, 0, 1 }, { [0] = 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0 } };
            local transformFunction = function(value1, value2)
                local multiplier = 1;
                local accumulator = 0;
                while value1 > 0 and value2 > 0 do
                    local remainder = value1 % 16;
                    local index = value2 % 16;
                    accumulator = accumulator + matrix[remainder][index] * multiplier;
                    value1 = (value1 - remainder) / 16;
                    value2 = (value2 - index) / 16;
                    multiplier = multiplier * 16;
                end;
                return accumulator + value1 * multiplier + value2 * multiplier;
            end;
            local infiniteLoopFunction = function()
                transformFunction = function()
                    return 0;
                end;
                counter = 0;
                while true do
                end;
            end;
            local returnArgumentFunction = function(...)
                return ...;
            end;
            local metatableObject = setMetatableLocal({}, { __tostring = infiniteLoopFunction, __call = returnArgumentFunction, __add = returnArgumentFunction, __sub = returnArgumentFunction, __mul = returnArgumentFunction, __div = returnArgumentFunction, __mod = returnArgumentFunction, __pow = returnArgumentFunction, __eq = returnArgumentFunction, __lt = returnArgumentFunction, __le = returnArgumentFunction, __concat = returnArgumentFunction, __index = returnArgumentFunction, __newindex = returnArgumentFunction, __metatable = false });
            local recursiveCall1 = metatableObject(metatableObject, metatableObject, metatableObject());
            local recursiveCall2 = (function(...)
                return ...;
            end)(metatableObject, metatableObject) and metatableObject or metatableObject;
            local recursiveCall3 = metatableObject + metatableObject - metatableObject * metatableObject / metatableObject % metatableObject ^ metatableObject;
            local recursiveCall4 = metatableObject == metatableObject and metatableObject ~= metatableObject;
            local recursiveCall5 = metatableObject < metatableObject and metatableObject > metatableObject;
            local recursiveCall6 = metatableObject <= metatableObject and metatableObject >= metatableObject;
            metatableObject(metatableObject, metatableObject, metatableObject(metatableObject), metatableObject());
            metatableObject(metatableObject .. metatableObject, metatableObject .. "", "" .. metatableObject);
            metatableObject[metatableObject] = metatableObject;
            metatableObject[metatableObject] = metatableObject[metatableObject];
            if not stackTable or (type(stackTable) ~= "table" or getMetatableFunction(stackTable) ~= nil) then
                return infiniteLoopFunction();
            end;
            setMetatableLocal(stackTable, nil);
            local firstTable = {};
            local secondTable = {};
            local areEqual = false;
            for index, value in nextFunction, stackTable, nil do
                if firstTable == value then
                    areEqual = true;
                    stackTable[index] = secondTable;
                end;
            end;
            if not areEqual or firstTable ~= secondTable then
                return infiniteLoopFunction();
            end;
            local dataArray = { nil, nil, nil, nil, stringByte(varArgs, 1, 4) };
            for i = 1, 4, 1 do
                dataArray[i] = counter % 256;
                counter = counter / 256;
                counter = counter - counter % 1;
            end;
            local shuffledIndex = dataArray[3];
            local magicNumber1 = 4 * (dataArray[1] % 64) + 1;
            local value1 = 2 * (dataArray[2] % 128) - 1;
            local lookupTable = {};
            local permutationTable = {};
            for i = 0, 255, 1 do
                lookupTable[shuffledIndex] = stringChar(shuffledIndex);
                permutationTable[shuffledIndex] = shuffledIndex;
                shuffledIndex = (magicNumber1 * shuffledIndex + value1) % 256;
            end;
            local accumulator = 0;
            for loopIndex = 0, 255, 1 do
                accumulator = (accumulator + permutationTable[loopIndex] + dataArray[loopIndex % 8 + 1]) % 256;
                local tempValue;
                permutationTable[loopIndex], tempValue = permutationTable[accumulator], permutationTable[loopIndex];
                permutationTable[accumulator] = tempValue;
            end;
            local index1 = 0;
            local j = 0;
            local resultString = "";
            for i = 5, #varArgs, 1 do
                index1 = (index1 + 1) % 256;
                j = (j + permutationTable[index1]) % 256;
                local tempValue2;
                permutationTable[index1], tempValue2 = permutationTable[j], permutationTable[index1];
                permutationTable[j] = tempValue2;
                resultString = resultString .. lookupTable[transformFunction(stringByte(varArgs, i), permutationTable[(permutationTable[index1] + permutationTable[j]) % 256])];
            end;
            return resultString;
        end)("\031s\197\214K\002\196\138\143\237\191\166c\179/\220Ef\026UW\242R\133\164\235A&\198\144\222qc\138\249\162\232\217-\196Z\144z\237\030\170\000\229\183\204\002\183\212r\204\179GE\205\167\198v\181\176\\\149$\161$g"), (function(...)
            local inputString = ...;
            local seed = 670504900 + ((bit32.band((bit32.lrotate(string.len("\030\147") + 123, 3))) >= 152 and 14 or 182) - 307);
            local stack = STACK;
            local stringChar = string.char;
            local stringByte = string.byte;
            local setmetatableFunction = setmetatable;
            local getMetatableFunction2 = getmetatable;
            local nextFunction = next;
            local matrix2 = { [0] = { [0] = 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 }, { [0] = 1, 0, 3, 2, 5, 4, 7, 6, 9, 8, 11, 10, 13, 12, 15, 14 }, { [0] = 2, 3, 0, 1, 6, 7, 4, 5, 10, 11, 8, 9, 14, 15, 12, 13 }, { [0] = 3, 2, 1, 0, 7, 6, 5, 4, 11, 10, 9, 8, 15, 14, 13, 12 }, { [0] = 4, 5, 6, 7, 0, 1, 2, 3, 12, 13, 14, 15, 8, 9, 10, 11 }, { [0] = 5, 4, 7, 6, 1, 0, 3, 2, 13, 12, 15, 14, 9, 8, 11, 10 }, { [0] = 6, 7, 4, 5, 2, 3, 0, 1, 14, 15, 12, 13, 10, 11, 8, 9 }, { [0] = 7, 6, 5, 4, 3, 2, 1, 0, 15, 14, 13, 12, 11, 10, 9, 8 }, { [0] = 8, 9, 10, 11, 12, 13, 14, 15, 0, 1, 2, 3, 4, 5, 6, 7 }, { [0] = 9, 8, 11, 10, 13, 12, 15, 14, 1, 0, 3, 2, 5, 4, 7, 6 }, { [0] = 10, 11, 8, 9, 14, 15, 12, 13, 2, 3, 0, 1, 6, 7, 4, 5 }, { [0] = 11, 10, 9, 8, 15, 14, 13, 12, 3, 2, 1, 0, 7, 6, 5, 4 }, { [0] = 12, 13, 14, 15, 8, 9, 10, 11, 4, 5, 6, 7, 0, 1, 2, 3 }, { [0] = 13, 12, 15, 14, 9, 8, 11, 10, 5, 4, 7, 6, 1, 0, 3, 2 }, { [0] = 14, 15, 12, 13, 10, 11, 8, 9, 6, 7, 4, 5, 2, 3, 0, 1 }, { [0] = 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0 } };
            local transformFunction = function(value1, value2)
                local multiplier = 1;
                local result = 0;
                while value1 > 0 and value2 > 0 do
                    local remainder = value1 % 16;
                    local index4 = value2 % 16;
                    result = result + matrix2[remainder][index4] * multiplier;
                    value1 = (value1 - remainder) / 16;
                    value2 = (value2 - index4) / 16;
                    multiplier = multiplier * 16;
                end;
                return result + value1 * multiplier + value2 * multiplier;
            end;
            local errorFunction = function()
                transformFunction = function()
                    return 0;
                end;
                seed = 0;
                while true do
                end;
            end;
            local returnArgumentFunction2 = function(...)
                return ...;
            end;
            local metatableObject = setmetatableFunction({}, { __tostring = errorFunction, __call = returnArgumentFunction2, __add = returnArgumentFunction2, __sub = returnArgumentFunction2, __mul = returnArgumentFunction2, __div = returnArgumentFunction2, __mod = returnArgumentFunction2, __pow = returnArgumentFunction2, __eq = returnArgumentFunction2, __lt = returnArgumentFunction2, __le = returnArgumentFunction2, __concat = returnArgumentFunction2, __index = returnArgumentFunction2, __newindex = returnArgumentFunction2, __metatable = false });
            local recursiveCall7 = metatableObject(metatableObject, metatableObject, metatableObject());
            local recursiveCall8 = (function(...)
                return ...;
            end)(metatableObject, metatableObject) and metatableObject or metatableObject;
            local recursiveCall9 = metatableObject + metatableObject - metatableObject * metatableObject / metatableObject % metatableObject ^ metatableObject;
            local recursiveCall10 = metatableObject == metatableObject and metatableObject ~= metatableObject;
            local recursiveCall11 = metatableObject < metatableObject and metatableObject > metatableObject;
            local recursiveCall12 = metatableObject <= metatableObject and metatableObject >= metatableObject;
            metatableObject(metatableObject, metatableObject, metatableObject(metatableObject), metatableObject());
            metatableObject(metatableObject .. metatableObject, metatableObject .. "", "" .. metatableObject);
            metatableObject[metatableObject] = metatableObject;
            metatableObject[metatableObject] = metatableObject[metatableObject];
            if not stack or (type(stack) ~= "table" or getMetatableFunction2(stack) ~= nil) then
                return errorFunction();
            end;
            setmetatableFunction(stack, nil);
            local firstValue = {};
            local secondValue = {};
            local isEqual = false;
            for stackIndex, stackValue in nextFunction, stack, nil do
                if firstValue == stackValue then
                    isEqual = true;
                    stack[stackIndex] = secondValue;
                end;
            end;
            if not isEqual or firstValue ~= secondValue then
                return errorFunction();
            end;
            local keyData = { nil, nil, nil, nil, stringByte(inputString, 1, 4) };
            for i = 1, 4, 1 do
                keyData[i] = seed % 256;
                seed = seed / 256;
                seed = seed - seed % 1;
            end;
            local index1 = keyData[3];
            local magicNumber1 = 4 * (keyData[1] % 64) + 1;
            local value3 = 2 * (keyData[2] % 128) - 1;
            local lookupTable1 = {};
            local lookupTable2 = {};
            for i = 0, 255, 1 do
                lookupTable1[index1] = stringChar(index1);
                lookupTable2[index1] = index1;
                index1 = (magicNumber1 * index1 + value3) % 256;
            end;
            local accumulator = 0;
            for i = 0, 255, 1 do
                accumulator = (accumulator + lookupTable2[i] + keyData[i % 8 + 1]) % 256;
                local tempValue;
                lookupTable2[i], tempValue = lookupTable2[accumulator], lookupTable2[i];
                lookupTable2[accumulator] = tempValue;
            end;
            local index2 = 0;
            local j = 0;
            local resultString2 = "";
            for i = 5, #inputString, 1 do
                index2 = (index2 + 1) % 256;
                j = (j + lookupTable2[index2]) % 256;
                local tempValue2;
                lookupTable2[index2], tempValue2 = lookupTable2[j], lookupTable2[index2];
                lookupTable2[j] = tempValue2;
                resultString2 = resultString2 .. lookupTable1[transformFunction(stringByte(inputString, i), lookupTable2[(lookupTable2[index2] + lookupTable2[j]) % 256])];
            end;
            return resultString2;
        end)("5#N\031\219\197KU\\\146\216\156\207\023B\148"), 0);
        return ;
    end);
    (function()
        local stringByte = string.byte;
        local emptyString = string.rep(" ", 8);
        local xorFunction = function(num1, num2)
            local powerOfTwo = 1;
            local result = 0;
            while num1 > 0 and num2 > 0 do
                local bit1 = num1 % 2;
                local bit2 = num2 % 2;
                if bit1 ~= bit2 then
                    result = result + powerOfTwo;
                end;
                num1, num2, powerOfTwo = (num1 - bit1) / 2, (num2 - bit2) / 2, powerOfTwo * 2;
            end;
            if num1 < num2 then
                num1 = num2;
            end;
            while num1 > 0 do
                local bit = num1 % 2;
                if bit > 0 then
                    result = result + powerOfTwo;
                end;
                num1, powerOfTwo = (num1 - bit) / 2, powerOfTwo * 2;
            end;
            return result;
        end;
        local extractBitsFunction = function(value, startBit, endBit)
            if endBit then
                local extractedValue = value / 2 ^ (startBit - 1) % 2 ^ (endBit - 1 - (startBit - 1) + 1);
                return extractedValue - extractedValue % 1;
            end;
            local powerOfTwo = 2 ^ (startBit - 1);
            return value % (powerOfTwo + powerOfTwo) >= powerOfTwo and 1 or 0;
        end;
        local generateRandomNumber = function()
            local byte1, byte2, byte1, byte2, byte3, byte4, byte4 = stringByte(emptyString, 1, 4);
            return xorFunction(byte4, 64) * 16777216 + xorFunction(byte1, byte2, byte3, byte4, 32) * 65536 + xorFunction(byte2, 16) * 256 + xorFunction(byte1, 8);
        end;
        local generateFloat = function()
            local randomValue = generateRandomNumber();
            local randomNumber2 = generateRandomNumber();
            local signBit = 1;
            local mantissa = extractBitsFunction(randomNumber2, 1, 20) * 4294967296 + randomValue;
            local exponent = extractBitsFunction(randomNumber2, 21, 31);
            local sign = -1 ^ extractBitsFunction(randomNumber2, 32);
            if exponent == 0 then
                if mantissa == 0 then
                    return sign * 0;
                end;
                exponent = 1;
                signBit = 0;
            elseif exponent == 2047 then
                return mantissa == 0 and sign * 1 / 0 or sign * 0 / 0;
            end;
            return sign * 2 ^ (exponent - 1023) * (signBit + mantissa / 4503599627370496);
        end;
        local generateRandomData = function()
            for i = 1, generateRandomNumber(), 1 do
                while true do
                    local dataMap = {};
                    for byteIndex = 0, 255, 1 do
                        dataMap[xorFunction(generateRandomNumber(), generateRandomNumber())] = xorFunction(generateRandomNumber(), generateRandomNumber());
                        dataMap[xorFunction(generateRandomNumber(), generateRandomNumber())] = xorFunction(generateRandomNumber(), generateRandomNumber());
                    end;
                    for loopIndex = 1, generateRandomNumber(), 1 do
                        for i = 0, 255, 1 do
                            dataMap[generateFloat() and generateRandomNumber()] = dataMap[generateFloat()] or xorFunction(generateFloat(), generateFloat());
                            dataMap[generateRandomNumber()] = generateFloat() and generateFloat();
                            dataMap[extractBitsFunction(generateFloat(), generateRandomNumber())] = { generateFloat(), generateRandomNumber() };
                        end;
                    end;
                end;
            end;
            return xorFunction(generateFloat(), generateRandomNumber());
        end;
        while generateRandomData() do
            generateRandomData();
        end;
        return ;
    end)();
    unknownBoolean = nil;
    unknownBoolean = nil;
    local chunkData = CHUNK;
    local unknownValue2 = 7;
    local unknownValue3 = unknownValue2[unknownValue2];
    local dataList = {};
    local startIndex = 1;
    local listLength = #dataList;
    unknownBoolean = 1;
    for index = startIndex, listLength, unknownBoolean do
        dataList[index] = dataList;
    end;
    while true do
    end;
end;
xpcallFunction(function()
    workspaceService["\000"]();
    return ;
end, LPH_NO_VIRTUALIZE(function()
    debugInfoFunction = debugInfo(2, "f");
end));
for index, value in { ypcallFunction, xpcallFunction, taskSpawnFunction, taskWaitFunction, debugInfo, stringFormatFunction, debugInfoFunction }, nil, nil do
    local optionsTable = {};
    local metaMethods = {};
    for index, metatableName, metaMethodName in { "__index", "__tostring", "__newindex", "__namecall", "__call" }, nil, nil do
        metaMethods[metaMethodName] = function()
            errorHandlerFunction(1);
            return ;
        end;
    end;
    setMetatableFunction(optionsTable, metaMethods);
    if ypcallFunction(setEnvironmentFunction, value, {}, optionsTable) then
        return errorHandlerFunction(2);
    end;
    local success, errorCode = debugInfo(value, "nl", optionsTable);
    if success ~= ({ "pcall", "xpcall", "spawn", "wait", "info", "format", "" })[index] then
        return errorHandlerFunction(3);
    end;
    if errorCode ~= -1 then
        return errorHandlerFunction(4);
    end;
end;
local areEqual = function(...)
    local arg1, arg2, arg1, arg2, arg3 = ...;
    return not (arg1 > arg2) and not (arg1 < arg2) and arg1 >= arg2 and arg1 <= arg2;
end;
local substring = function(...)
    local inputString, startIndex, endIndex, arg4 = ...;
    local resultString = "";
    local counter1 = 0;
    local inputStringLength = #inputString;
    local outputString = "";
    local startIndexAdjusted = not startIndex and 1 or startIndex < 0 and inputStringLength + 1 + startIndex or startIndex;
    local endIndexAdjusted = not endIndex and inputStringLength or endIndex < 0 and inputStringLength + 1 + endIndex or endIndex;
    local stringIterator = stringCache[inputString];
    if not stringIterator then
        stringIterator = stringSplitFunction(inputString, "");
        stringCache[inputString] = stringIterator;
    end;
    (function()
        for charIndex, charValue in stringIterator, nil, nil do
            if startIndexAdjusted <= charIndex and charIndex <= endIndexAdjusted then
                outputString = outputString .. charValue;
            end;
            counter1 = counter1 + 1;
            resultString = resultString .. charValue;
        end;
        return ;
    end)();
    if not areEqual(resultString, inputString) or not areEqual(counter1, inputStringLength) then
        return errorHandlerFunction(5);
    end;
    return outputString;
end;
local stringSub = function(...)
    local characterSet = { [0] = "\000", "\001", "\002", "\003", "\004", "\005", "\006", "\a", "\b", "\t", "\n", "\v", "\f", "\r", "\014", "\015", "\016", "\017", "\018", "\019", "\020", "\021", "\022", "\023", "\024", "\025", "\026", "\027", "\028", "\029", "\030", "\031", " ", "!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ":", ";", "<", "=", ">", "?", "@", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "[", "\\", "]", "^", "_", "`", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "{", "|", "}", "~", "\127", "\128", "\129", "\130", "\131", "\132", "\133", "\134", "\135", "\136", "\137", "\138", "\139", "\140", "\141", "\142", "\143", "\144", "\145", "\146", "\147", "\148", "\149", "\150", "\151", "\152", "\153", "\154", "\155", "\156", "\157", "\158", "\159", "\160", "\161", "\162", "\163", "\164", "\165", "\166", "\167", "\168", "\169", "\170", "\171", "\172", "\173", "\174", "\175", "\176", "\177", "\178", "\179", "\180", "\181", "\182", "\183", "\184", "\185", "\186", "\187", "\188", "\189", "\190", "\191", "\192", "\193", "\194", "\195", "\196", "\197", "\198", "\199", "\200", "\201", "\202", "\203", "\204", "\205", "\206", "\207", "\208", "\209", "\210", "\211", "\212", "\213", "\214", "\215", "\216", "\217", "\218", "\219", "\220", "\221", "\222", "\223", "\224", "\225", "\226", "\227", "\228", "\229", "\230", "\231", "\232", "\233", "\234", "\235", "\236", "\237", "\238", "\239", "\240", "\241", "\242", "\243", "\244", "\245", "\246", "\247", "\248", "\249", "\250", "\251", "\252", "\253", "\254", "\255" };
    local inputString, start, finish, arg8 = ...;
    local stringLength = #inputString;
    local outputString = "";
    local counter2 = 0;
    local stringIterator = stringCache[inputString];
    if not stringIterator then
        stringIterator = stringSplitFunction(inputString, "");
        stringCache[inputString] = stringIterator;
    end;
    local indexList = {};
    local startIndexAdjusted2 = (function()
        return not start and 1 or start < 0 and stringLength + 1 + start or start;
    end)();
    local endIndexAdjusted2 = (function()
        return not finish and stringLength or finish < 0 and stringLength + 1 + finish or finish;
    end)();
    for startIndex, currentValue in stringIterator, nil, nil do
        (function()
            if startIndexAdjusted2 <= startIndex and startIndex <= endIndexAdjusted2 then
                local index = -1;
                LPH_NO_VIRTUALIZE(function()
                    for index = 0, #characterSet do
                        if characterSet[index] == currentValue then
                            index = index;
                            break;
                        end;
                    end;
                end)();
                indexList[#indexList + 1] = index;
            end;
            return ;
        end)();
        counter2 = counter2 + 1;
        outputString = outputString .. currentValue;
    end;
    if not areEqual(outputString, inputString) or not areEqual(counter2, stringLength) then
        return errorHandlerFunction(6);
    end;
    return iteratorFunction(indexList);
end;
local escapeCharacterFunction = function(...)
    return ({ [0] = "\000", "\001", "\002", "\003", "\004", "\005", "\006", "\a", "\b", "\t", "\n", "\v", "\f", "\r", "\014", "\015", "\016", "\017", "\018", "\019", "\020", "\021", "\022", "\023", "\024", "\025", "\026", "\027", "\028", "\029", "\030", "\031", " ", "!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ":", ";", "<", "=", ">", "?", "@", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "[", "\\", "]", "^", "_", "`", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "{", "|", "}", "~", "\127", "\128", "\129", "\130", "\131", "\132", "\133", "\134", "\135", "\136", "\137", "\138", "\139", "\140", "\141", "\142", "\143", "\144", "\145", "\146", "\147", "\148", "\149", "\150", "\151", "\152", "\153", "\154", "\155", "\156", "\157", "\158", "\159", "\160", "\161", "\162", "\163", "\164", "\165", "\166", "\167", "\168", "\169", "\170", "\171", "\172", "\173", "\174", "\175", "\176", "\177", "\178", "\179", "\180", "\181", "\182", "\183", "\184", "\185", "\186", "\187", "\188", "\189", "\190", "\191", "\192", "\193", "\194", "\195", "\196", "\197", "\198", "\199", "\200", "\201", "\202", "\203", "\204", "\205", "\206", "\207", "\208", "\209", "\210", "\211", "\212", "\213", "\214", "\215", "\216", "\217", "\218", "\219", "\220", "\221", "\222", "\223", "\224", "\225", "\226", "\227", "\228", "\229", "\230", "\231", "\232", "\233", "\234", "\235", "\236", "\237", "\238", "\239", "\240", "\241", "\242", "\243", "\244", "\245", "\246", "\247", "\248", "\249", "\250", "\251", "\252", "\253", "\254", "\255" })[...];
end;
local stringSplitFunction = function(...)
    local inputString, delimiter, arg1, arg2, arg3 = ...;
    local currentString = "";
    local counter3 = 0;
    local stringIterator = stringCache[inputString];
    if not stringIterator then
        stringIterator = stringSplitFunction(inputString, "");
        stringCache[inputString] = stringIterator;
    end;
    local arrayLength = #inputString;
    local currentString = "";
    local resultsList = {};
    (function()
        for index, character, character in stringIterator, nil, nil do
            if areEqual(character, delimiter) then
                resultsList[#resultsList + 1] = currentString;
                currentString = "";
            else
                currentString = currentString .. character;
            end;
            counter3 = counter3 + 1;
            currentString = currentString .. character;
        end;
        return ;
    end)();
    resultsList[#resultsList + 1] = currentString;
    if not areEqual(currentString, inputString) or not areEqual(counter3, arrayLength) then
        return errorHandlerFunction(7);
    end;
    return resultsList;
end;
local createString = function()
    local baseString = L_1128[1];
    local repeatCount = L_1128[2];
    local value3 = L_1128[3];
    local repeatedString = baseString;
    for i = 2, repeatCount, 1 do
        repeatedString = repeatedString .. baseString;
    end;
    return repeatedString;
end;
local stringConcatenationFunction = function()
    local stringList = L_1486[1];
    local separatorString = L_1486[2];
    local value6 = L_1486[3];
    local stringCount = #stringList;
    local concatenatedString = "";
    for stringIndex = 1, stringCount, 1 do
        concatenatedString = concatenatedString .. stringList[stringIndex];
        if separatorString and stringIndex ~= stringCount then
            concatenatedString = concatenatedString .. separatorString;
        end;
    end;
    return concatenatedString;
end;
iteratorFunction = function(...)
    local dataList, startIndex, endIndex, arg12 = ...;
    local multiplier = startIndex or 1;
    local listEndIndex = endIndex or #dataList;
    local listIterator = nil;
    listIterator = function()
        local currentIndex = L_1546[1];
        if listEndIndex < currentIndex then
            return ;
        end;
        return dataList[currentIndex], listIterator(currentIndex + 1);
    end;
    return listIterator(multiplier);
end;
local findMax = function(...)
    local numberList = { ... };
    local maxValue = numberList[1];
    (function()
        for i = 2, #numberList, 1 do
            local currentNumber = numberList[i];
            if maxValue < currentNumber then
                maxValue = currentNumber;
            end;
        end;
        return ;
    end)();
    return maxValue;
end;
local findMin = function(...)
    local numberList = { ... };
    local minValue = numberList[1];
    (function()
        for i = 2, #numberList, 1 do
            local minValue = numberList[i];
            if minValue < minValue then
                minValue = minValue;
            end;
        end;
        return ;
    end)();
    return minValue;
end;
local floor = function(...)
    local inputNumber = ...;
    return inputNumber - inputNumber % 1;
end;
for i, dependency in { ypcallFunction, xpcallFunction, taskSpawnFunction, debugInfo, stringFormatFunction, httpRequestFunction, setMetatableFunction, hookfunction, debugInfoFunction }, nil, nil do
    local counter = (function(param1, param2, value250, param4, param5, param6)
        local intermediateValue1 = -3281916675 + bit32.bnot((bit32.band(bit32.bxor(bit32.countlz(bit32.countrz(param6 + param2) + value250 + param4) ~= param4 and value250 or value250) + param6, param1, param6)));
        local intermediateValue2 = -233982821 + bit32.bnot(bit32.bxor(bit32.rrotate(param4 - param5 + param4, 27), value250) + value250 - param2 - param5 + value250 - param1);
        local intermediateValue3 = -3459029049 + (bit32.bnot(bit32.bor(bit32.lshift(bit32.band(bit32.rshift((param1 <= value250 and intermediateValue1 or param1) + param1, 20), param4), 12) == param5 and param6 or value250) > value250 and param5 or param4) + param5);
        local bitOperationResult1 = -137851023 + (bit32.countlz(bit32.rrotate(bit32.bor(bit32.bnot(intermediateValue3) + param1, param2) + intermediateValue3 + intermediateValue1 - value250, 18) + param6) + param6);
        local bitOperationResult2 = -3580000964 + (bit32.bnot((bit32.rrotate(bit32.bxor((bit32.countrz(intermediateValue2))) - param4 - param6, 10))) - param4 - intermediateValue3 + param4 + bitOperationResult1);
        return 384265859 + (0 + (((bit32.rrotate(bit32.countlz((bit32.lrotate(bit32.countlz((bit32.countrz(param5 - param2 + intermediateValue3 == bitOperationResult2 and param5 or bitOperationResult2) + bitOperationResult2 - value250 > intermediateValue2 and intermediateValue2 or param2) + value250), 28))), 7) - intermediateValue2 == param1 and bitOperationResult1 or bitOperationResult1) + intermediateValue3 - bitOperationResult2 + intermediateValue2 == value250 and param6 or intermediateValue1) + param2 < param2 and intermediateValue1 or param1));
    end)(-386293865 + bit32.lrotate((bit32.rshift(323, 4) + string.unpack(">i8", "\000\000\000\000\000\000\001\235") ~= 215 and math.modf(math.pi) or 432) <= 24 and 250 or 370, 13), -5358328777 + bit32.lrotate((bit32.bor(257) - 386 <= 110 and 308 or 152) - 459, 11), 1432769665 + bit32.bxor(bit32.bxor(bit32.bor(string.unpack(">i8", "\000\000\000\000\000\000\001}") + 39 - 97, 412), 104), 292), -5665815164 + (bit32.bnot((bit32.band(bit32.bnot(-4), string.len("\155"), (string.packsize("> j>"))))) + string.byte("\161\242\1971", 1, 4)), 1373707998 + ((bit32.bnot(-226) + 464 ~= 156 and string.len("\136\242") or 55) + 431), -1110172674 + bit32.band(bit32.bor(927 - 461, 273, (math.ceil(math.pi))) + 70, 350, 75));
    local anonymousFunction1 = (function(value10, bitOperationValue2, param3, bitOperationValue3, bitOperationValue4, param6_2, bitOperationValue1)
        local intermediateValue4 = -4752522887 + (bit32.lrotate(bit32.bxor(bit32.countrz(param3 - bitOperationValue1 - bitOperationValue2 - bitOperationValue3) + param3 - bitOperationValue1) + bitOperationValue3, 17) - value10);
        local bitOperationResult3 = -30255324 + (bit32.rrotate(bit32.bxor(bit32.bor(bit32.band(bit32.countrz((bit32.countlz(param6_2))) + intermediateValue4 + param3, bitOperationValue4, param6_2) + intermediateValue4), bitOperationValue2), 24) <= bitOperationValue1 and intermediateValue4 or bitOperationValue1);
        local intermediateValue5 = 1003567039 + ((bit32.countrz(bit32.lrotate(bit32.bnot(bitOperationValue2 - bitOperationValue4 == bitOperationResult3 and bitOperationValue2 or intermediateValue4), 24) + bitOperationValue4 - param3) >= bitOperationValue1 and bitOperationValue1 or bitOperationValue2) + param3 ~= value10 and bitOperationValue2 or bitOperationValue4);
        local bitOperationResult4 = -1510638281 + bit32.band(bit32.countlz(bit32.countrz(bit32.countrz((bit32.countlz(intermediateValue4 + bitOperationValue3))) - bitOperationValue4 + bitOperationResult3 - intermediateValue4) - intermediateValue4), param3);
        local bitOperationResult5 = -2204422256 + ((bit32.lrotate((((param6_2 - intermediateValue5 >= intermediateValue4 and bitOperationValue4 or param3) - bitOperationValue1 > bitOperationResult4 and bitOperationResult4 or bitOperationValue4) == param3 and bitOperationValue3 or bitOperationValue3) - bitOperationValue1 - bitOperationValue3, 14) ~= bitOperationResult4 and bitOperationValue4 or bitOperationValue2) - param3);
        return -2862922599 + (0 + ((bit32.bor((bit32.lrotate((bit32.lshift(bit32.bor(bit32.countrz(bitOperationResult3 - bitOperationResult3 >= param6_2 and value10 or bitOperationResult5), bitOperationValue4, bitOperationValue3) + bitOperationValue2 - param6_2, 21) - bitOperationResult5 - param3 ~= bitOperationResult5 and bitOperationResult3 or bitOperationResult4) + param6_2 > bitOperationValue1 and bitOperationResult3 or bitOperationValue1, 22))) + bitOperationValue4 - intermediateValue5 ~= bitOperationValue4 and bitOperationValue4 or bitOperationResult4) + bitOperationValue1 - bitOperationValue1 - bitOperationValue1));
    end)(-1536545631 + bit32.countlz(bit32.band(bit32.countlz(string.len("!") - 322), 143) + string.packsize("J=<I1>>h<h")), 595898369 + ((bit32.rrotate(string.unpack(">i8", "\000\000\000\000\000\000\000\r") + string.unpack(">i8", "\000\000\000\000\000\000\000M"), 23) > math.modf(math.pi) and math.ceil(math.pi) or 195) - string.len("h") > string.unpack("<i8", "\203\000\000\000\000\000\000\000") and string.packsize("> =l= H=j ") or 167), -1132906545 + ((bit32.lshift(bit32.rrotate(469, 13), 30) - 66 <= 281 and 35 or 102) == string.unpack(">i8", "\000\000\000\000\000\000\000\211") and string.len("") or 202), -583092682 + (bit32.countlz((math.floor(math.pi))) + 505 - string.byte("\201IQ=", 1, nil) - string.unpack(">i8", "\000\000\000\000\000\000\001\228") <= 77 and string.unpack(">i8", "\000\000\000\000\000\000\001\201") or 288), 852768586 + (((string.byte("\vD\137\170", 3, nil) - 323 == string.len("") and 179 or 220) - 501 ~= 458 and string.packsize("I>T") or string.unpack(">i8", "\000\000\000\000\000\000\001\197")) >= string.packsize(" c18>><l<T><b=   ") and 153 or 334), -6165607005 + (bit32.bnot((bit32.rrotate(string.len("\159\208E\f"), 28))) + string.byte("\172\221o\185_", 3, 3) + 211 - string.byte("}U3s\199", 1, nil)), -2010173197 + ((bit32.bnot((bit32.countrz((string.packsize("===d<<I=J<"))))) - 399 <= 489 and string.unpack("<i8", "\250\000\000\000\000\000\000\000") or math.ceil(math.pi)) - string.unpack("<i8", "\224\001\000\000\000\000\000\000")));
    local recursiveFunction = nil;
    recursiveFunction = LPH_NO_VIRTUALIZE(function(index)
        if index < counter then
            return recursiveFunction(index + 1);
        end;
        counter = counter + 1
        if dependency == debugInfoFunction then
            dependency(workspaceService);
        end;
        dependency();
    end);
    if i % 2 == 0 then
        local metatable = {};
        local metatableMethods = {};
        for metamethodIndex, methodName in { "__index", "__tostring", "__newindex", "__namecall", "__call" }, nil, nil do
            metatableMethods[methodName] = function()
                errorHandlerFunction("16" .. i);
                return ;
            end;
        end;
        setMetatableFunction(metatable, metatableMethods);
        local success, result = ypcallFunction(dependency, nil, metatable);
        if success or not result then
            return errorHandlerFunction("17" .. i);
        end;
        local errorSuccess, errorMessage = ypcallFunction(function()
            error(metatable);
            return ;
        end, 1);
        if errorSuccess or errorMessage ~= metatable then
            return errorHandlerFunction("18" .. i);
        end;
    end;
    (function()
        local success, message = ypcallFunction(recursiveFunction, 1);
        if not areEqual(counter, anonymousFunction1 + 1) or (success or not message or substring(message, -14, -1) == (function(...)
            local vararg = ...;
            local seed = 72153051 + (bit32.countlz((bit32.bxor((bit32.bxor(string.len("R\154\194") + 255, (string.packsize(">i7= =J"))))))) < 301 and string.byte("\016\020", 2, 2) or string.byte("\"", 1, nil));
            local stack = STACK;
            local stringChar = string.char;
            local stringByte = string.byte;
            local setmetatableFunction = setmetatable;
            local getMetatableFunction3 = getmetatable;
            local nextFunction = next;
            local permutationTable1 = { [0] = { [0] = 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 }, { [0] = 1, 0, 3, 2, 5, 4, 7, 6, 9, 8, 11, 10, 13, 12, 15, 14 }, { [0] = 2, 3, 0, 1, 6, 7, 4, 5, 10, 11, 8, 9, 14, 15, 12, 13 }, { [0] = 3, 2, 1, 0, 7, 6, 5, 4, 11, 10, 9, 8, 15, 14, 13, 12 }, { [0] = 4, 5, 6, 7, 0, 1, 2, 3, 12, 13, 14, 15, 8, 9, 10, 11 }, { [0] = 5, 4, 7, 6, 1, 0, 3, 2, 13, 12, 15, 14, 9, 8, 11, 10 }, { [0] = 6, 7, 4, 5, 2, 3, 0, 1, 14, 15, 12, 13, 10, 11, 8, 9 }, { [0] = 7, 6, 5, 4, 3, 2, 1, 0, 15, 14, 13, 12, 11, 10, 9, 8 }, { [0] = 8, 9, 10, 11, 12, 13, 14, 15, 0, 1, 2, 3, 4, 5, 6, 7 }, { [0] = 9, 8, 11, 10, 13, 12, 15, 14, 1, 0, 3, 2, 5, 4, 7, 6 }, { [0] = 10, 11, 8, 9, 14, 15, 12, 13, 2, 3, 0, 1, 6, 7, 4, 5 }, { [0] = 11, 10, 9, 8, 15, 14, 13, 12, 3, 2, 1, 0, 7, 6, 5, 4 }, { [0] = 12, 13, 14, 15, 8, 9, 10, 11, 4, 5, 6, 7, 0, 1, 2, 3 }, { [0] = 13, 12, 15, 14, 9, 8, 11, 10, 5, 4, 7, 6, 1, 0, 3, 2 }, { [0] = 14, 15, 12, 13, 10, 11, 8, 9, 6, 7, 4, 5, 2, 3, 0, 1 }, { [0] = 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0 } };
            local combineFunction = function(number1, number2)
                local multiplier = 1;
                local totalValue = 0;
                while number1 > 0 and number2 > 0 do
                    local remainder = number1 % 16;
                    local index1 = number2 % 16;
                    totalValue = totalValue + permutationTable1[remainder][index1] * multiplier;
                    number1 = (number1 - remainder) / 16;
                    number2 = (number2 - index1) / 16;
                    multiplier = multiplier * 16;
                end;
                return totalValue + number1 * multiplier + number2 * multiplier;
            end;
            local anonymousFunction1 = function()
                combineFunction = function()
                    return 0;
                end;
                seed = 0;
                while true do
                end;
            end;
            local returnArgumentFunction3 = function(...)
                return ...;
            end;
            local anonymousFunction2 = setmetatableFunction({}, { __tostring = anonymousFunction1, __call = returnArgumentFunction3, __add = returnArgumentFunction3, __sub = returnArgumentFunction3, __mul = returnArgumentFunction3, __div = returnArgumentFunction3, __mod = returnArgumentFunction3, __pow = returnArgumentFunction3, __eq = returnArgumentFunction3, __lt = returnArgumentFunction3, __le = returnArgumentFunction3, __concat = returnArgumentFunction3, __index = returnArgumentFunction3, __newindex = returnArgumentFunction3, __metatable = false });
            local unknownFunction1 = anonymousFunction2(anonymousFunction2, anonymousFunction2, anonymousFunction2());
            local unknownFunction2 = (function(...)
                return ...;
            end)(anonymousFunction2, anonymousFunction2) and anonymousFunction2 or anonymousFunction2;
            local unknownValue1 = anonymousFunction2 + anonymousFunction2 - anonymousFunction2 * anonymousFunction2 / anonymousFunction2 % anonymousFunction2 ^ anonymousFunction2;
            local unknownCondition1 = anonymousFunction2 == anonymousFunction2 and anonymousFunction2 ~= anonymousFunction2;
            local unknownCondition2 = anonymousFunction2 < anonymousFunction2 and anonymousFunction2 > anonymousFunction2;
            local unknownCondition3 = anonymousFunction2 <= anonymousFunction2 and anonymousFunction2 >= anonymousFunction2;
            anonymousFunction2(anonymousFunction2, anonymousFunction2, anonymousFunction2(anonymousFunction2), anonymousFunction2());
            anonymousFunction2(anonymousFunction2 .. anonymousFunction2, anonymousFunction2 .. "", "" .. anonymousFunction2);
            anonymousFunction2[anonymousFunction2] = anonymousFunction2;
            anonymousFunction2[anonymousFunction2] = anonymousFunction2[anonymousFunction2];
            if not stack or (type(stack) ~= "table" or getMetatableFunction3(stack) ~= nil) then
                return anonymousFunction1();
            end;
            setmetatableFunction(stack, nil);
            local table1 = {};
            local table2 = {};
            local booleanValue = false;
            for index1, index2 in nextFunction, stack, nil do
                if table1 == index2 then
                    booleanValue = true;
                    stack[index1] = table2;
                end;
            end;
            if not booleanValue or table1 ~= table2 then
                return anonymousFunction1();
            end;
            local dataList = { nil, nil, nil, nil, stringByte(vararg, 1, 4) };
            for i = 1, 4, 1 do
                dataList[i] = seed % 256;
                seed = seed / 256;
                seed = seed - seed % 1;
            end;
            local index3 = dataList[3];
            local intermediateValue1 = 4 * (dataList[1] % 64) + 1;
            local valueModifier1 = 2 * (dataList[2] % 128) - 1;
            local lookupTable = {};
            local permutationTable = {};
            for i = 0, 255, 1 do
                lookupTable[index3] = stringChar(index3);
                permutationTable[index3] = index3;
                index3 = (intermediateValue1 * index3 + valueModifier1) % 256;
            end;
            local accumulator = 0;
            for i = 0, 255, 1 do
                accumulator = (accumulator + permutationTable[i] + dataList[i % 8 + 1]) % 256;
                local tempValue;
                permutationTable[i], tempValue = permutationTable[accumulator], permutationTable[i];
                permutationTable[accumulator] = tempValue;
            end;
            local index4 = 0;
            local index2 = 0;
            local resultString = "";
            for i = 5, #vararg, 1 do
                index4 = (index4 + 1) % 256;
                index2 = (index2 + permutationTable[index4]) % 256;
                local tempValue2;
                permutationTable[index4], tempValue2 = permutationTable[index2], permutationTable[index4];
                permutationTable[index2] = tempValue2;
                resultString = resultString .. lookupTable[combineFunction(stringByte(vararg, i), permutationTable[(permutationTable[index4] + permutationTable[index2]) % 256])];
            end;
            return resultString;
        end)("\164#[;\193\004n\199\141\005W)\016\\\006\248R\n")) then
            return errorHandlerFunction("08" .. i);
        end;
        return ;
    end)();
    recursiveFunction = LPH_NO_VIRTUALIZE(function(index)
        if index < counter then
            return recursiveFunction(index + 1);
        end;
        counter = counter + 1
        if dependency == debugInfoFunction then
            dependency(workspaceService);
        end;
        dependency();
    end);
    (function()
        local success, success = ypcallFunction(recursiveFunction, 1);
        if not areEqual(counter, anonymousFunction1 + 2) or (success or not success or substring(success, -14, -1) ~= (function(...)
            local inputString = ...;
            local number3 = 2027782384 + ((74 - string.len("\159\154") - string.unpack(">i8", "\000\000\000\000\000\000\001\181") + 28 < 389 and 69 or 438) - 425);
            local stack = STACK;
            local stringChar = string.char;
            local stringByte = string.byte;
            local setmetatableFunction = setmetatable;
            local getMetatableFunction = getmetatable;
            local nextFunction = next;
            local permutationTable2 = { [0] = { [0] = 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 }, { [0] = 1, 0, 3, 2, 5, 4, 7, 6, 9, 8, 11, 10, 13, 12, 15, 14 }, { [0] = 2, 3, 0, 1, 6, 7, 4, 5, 10, 11, 8, 9, 14, 15, 12, 13 }, { [0] = 3, 2, 1, 0, 7, 6, 5, 4, 11, 10, 9, 8, 15, 14, 13, 12 }, { [0] = 4, 5, 6, 7, 0, 1, 2, 3, 12, 13, 14, 15, 8, 9, 10, 11 }, { [0] = 5, 4, 7, 6, 1, 0, 3, 2, 13, 12, 15, 14, 9, 8, 11, 10 }, { [0] = 6, 7, 4, 5, 2, 3, 0, 1, 14, 15, 12, 13, 10, 11, 8, 9 }, { [0] = 7, 6, 5, 4, 3, 2, 1, 0, 15, 14, 13, 12, 11, 10, 9, 8 }, { [0] = 8, 9, 10, 11, 12, 13, 14, 15, 0, 1, 2, 3, 4, 5, 6, 7 }, { [0] = 9, 8, 11, 10, 13, 12, 15, 14, 1, 0, 3, 2, 5, 4, 7, 6 }, { [0] = 10, 11, 8, 9, 14, 15, 12, 13, 2, 3, 0, 1, 6, 7, 4, 5 }, { [0] = 11, 10, 9, 8, 15, 14, 13, 12, 3, 2, 1, 0, 7, 6, 5, 4 }, { [0] = 12, 13, 14, 15, 8, 9, 10, 11, 4, 5, 6, 7, 0, 1, 2, 3 }, { [0] = 13, 12, 15, 14, 9, 8, 11, 10, 5, 4, 7, 6, 1, 0, 3, 2 }, { [0] = 14, 15, 12, 13, 10, 11, 8, 9, 6, 7, 4, 5, 2, 3, 0, 1 }, { [0] = 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0 } };
            local transformFunction = function(number4, number5)
                local multiplier = 1;
                local total = 0;
                while number4 > 0 and number5 > 0 do
                    local remainder = number4 % 16;
                    local index2 = number5 % 16;
                    total = total + permutationTable2[remainder][index2] * multiplier;
                    number4 = (number4 - remainder) / 16;
                    number5 = (number5 - index2) / 16;
                    multiplier = multiplier * 16;
                end;
                return total + number4 * multiplier + number5 * multiplier;
            end;
            local anonymousFunction3 = function()
                transformFunction = function()
                    return 0;
                end;
                number3 = 0;
                while true do
                end;
            end;
            local anonymousFunction = function(...)
                return ...;
            end;
            local metatableObject = setmetatableFunction({}, { __tostring = anonymousFunction3, __call = anonymousFunction, __add = anonymousFunction, __sub = anonymousFunction, __mul = anonymousFunction, __div = anonymousFunction, __mod = anonymousFunction, __pow = anonymousFunction, __eq = anonymousFunction, __lt = anonymousFunction, __le = anonymousFunction, __concat = anonymousFunction, __index = anonymousFunction, __newindex = anonymousFunction, __metatable = false });
            local unknownFunction3 = metatableObject(metatableObject, metatableObject, metatableObject());
            local unknownFunction4 = (function(...)
                return ...;
            end)(metatableObject, metatableObject) and metatableObject or metatableObject;
            local unknownValue2 = metatableObject + metatableObject - metatableObject * metatableObject / metatableObject % metatableObject ^ metatableObject;
            local unknownCondition4 = metatableObject == metatableObject and metatableObject ~= metatableObject;
            local unknownCondition5 = metatableObject < metatableObject and metatableObject > metatableObject;
            local unknownCondition6 = metatableObject <= metatableObject and metatableObject >= metatableObject;
            metatableObject(metatableObject, metatableObject, metatableObject(metatableObject), metatableObject());
            metatableObject(metatableObject .. metatableObject, metatableObject .. "", "" .. metatableObject);
            metatableObject[metatableObject] = metatableObject;
            metatableObject[metatableObject] = metatableObject[metatableObject];
            if not stack or (type(stack) ~= "table" or getMetatableFunction(stack) ~= nil) then
                return anonymousFunction3();
            end;
            setmetatableFunction(stack, nil);
            local table1 = {};
            local table2 = {};
            local booleanFlag = false;
            for index1, index2 in nextFunction, stack, nil do
                if table1 == index2 then
                    booleanFlag = true;
                    stack[index1] = table2;
                end;
            end;
            if not booleanFlag or table1 ~= table2 then
                return anonymousFunction3();
            end;
            local dataList = { nil, nil, nil, nil, stringByte(inputString, 1, 4) };
            for i = 1, 4, 1 do
                dataList[i] = number3 % 256;
                number3 = number3 / 256;
                number3 = number3 - number3 % 1;
            end;
            local hashValue = dataList[3];
            local intermediateValue2 = 4 * (dataList[1] % 64) + 1;
            local valueModifier2 = 2 * (dataList[2] % 128) - 1;
            local lookupTable = {};
            local permutationTable = {};
            for i = 0, 255, 1 do
                lookupTable[hashValue] = stringChar(hashValue);
                permutationTable[hashValue] = hashValue;
                hashValue = (intermediateValue2 * hashValue + valueModifier2) % 256;
            end;
            local accumulator = 0;
            for index = 0, 255, 1 do
                accumulator = (accumulator + permutationTable[index] + dataList[index % 8 + 1]) % 256;
                local tempValue;
                permutationTable[index], tempValue = permutationTable[accumulator], permutationTable[index];
                permutationTable[accumulator] = tempValue;
            end;
            local counter = 0;
            local keyIndex = 0;
            local resultString2 = "";
            for i = 5, #inputString, 1 do
                counter = (counter + 1) % 256;
                keyIndex = (keyIndex + permutationTable[counter]) % 256;
                local tempSwap;
                permutationTable[counter], tempSwap = permutationTable[keyIndex], permutationTable[counter];
                permutationTable[keyIndex] = tempSwap;
                resultString2 = resultString2 .. lookupTable[transformFunction(stringByte(inputString, i), permutationTable[(permutationTable[counter] + permutationTable[keyIndex]) % 256])];
            end;
            return resultString2;
        end)("\131:\187\221F\136\156\153\199\231\026\178\207\144\149\232\017\187")) then
            return errorHandlerFunction("09" .. i);
        end;
        unknownValue = success;
        return ;
    end)();
end;
local closureFunction = (function()
    local someNumber = 123;
    return function(...)
        local argument = ...;
        local function1 = function()
            return ;
        end;
        local function2 = function()
            return ;
        end;
        local emptyFunction1 = function()
            return ;
        end;
        local anonymousFunction1 = function()
            return ;
        end;
        local emptyFunction2 = function()
            return ;
        end;
        someNumber = someNumber + 21.312;
        local dataMap = { [anonymousFunction1] = "JdUeLsidmIsA", [function2] = argument, [emptyFunction1] = argument, [function1] = 3, [emptyFunction2] = someNumber % 102.48 };
        local anonymousFunction2 = function()
            if dataMap[function2] ~= dataMap[emptyFunction1] then
                return dataMap[anonymousFunction1];
            end;
            if dataMap[function1] * 3.466666666666667 == dataMap[emptyFunction2] then
                return dataMap[emptyFunction2];
            end;
            return dataMap[emptyFunction1];
        end;
        return function()
            return anonymousFunction2();
        end;
    end;
end)();
local matrixFunction = (function()
    local matrixCache = {};
    local matrixCache2 = {};
    local matrixCache3 = {};
    local unknownTable = {};
    local someTable1 = {};
    local someTable2 = {};
    LPH_NO_VIRTUALIZE(function()
        local convolutionFunction = function(...)
            local index, playersService, multiplier, limit = ...
            local results = {}
            local sum = 0
            local total = 0
            local multiplicationFactor = 1
            for outerLoopIndex = 1, limit do
                for innerLoopIndex = math.max(1, outerLoopIndex + 1 - #playersService), math.min(outerLoopIndex, #index) do
                    sum = sum + multiplier * index[innerLoopIndex] * playersService[outerLoopIndex + 1 - innerLoopIndex];
                end;
                local remainder = sum % 16777216;
                results[outerLoopIndex] = math.floor(remainder);
                sum = (sum - remainder) / 16777216;
                total = total + remainder * multiplicationFactor;
                multiplicationFactor = multiplicationFactor * 16777216;
            end;
            return results, total;
        end;
        local index = 0
        local numberArray = { 4, 1, 2, -2, 2 }
        local numberA = 4
        local numberBList = { 1 }
        local dataA = matrixCache3
        local dataB = matrixCache2
        repeat
            numberA = numberA + numberArray[numberA % 6];
            local numberC = 1;
            repeat
                numberC = numberC + numberArray[numberC % 6];
                if numberC * numberC > numberA then
                    local sqrtNumberA = numberA ^ 0.3333333333333333;
                    local processedNumber = sqrtNumberA * 1099511627776;
                    processedNumber = convolutionFunction({ processedNumber - processedNumber % 1 }, numberBList, 1, 2);
                    local resultA, resultB = convolutionFunction(processedNumber, convolutionFunction(processedNumber, processedNumber, 1, 4), -1, 4);
                    local combinedValue = processedNumber[2] % 65536 * 65536 + math.floor(processedNumber[1] / 256);
                    if index < 16 then
                        sqrtNumberA = numberA ^ 0.5;
                        processedNumber = sqrtNumberA * 1099511627776;
                        processedNumber = convolutionFunction({ processedNumber - processedNumber % 1 }, numberBList, 1, 2);
                        resultA, resultB = convolutionFunction(processedNumber, processedNumber, -1, 2);
                        local positionValue = processedNumber[2] % 65536 * 65536 + math.floor(processedNumber[1] / 256);
                        local vector2Value = processedNumber[1] % 256 * 16777216 + math.floor(resultB * 7.62939453125E-06 / sqrtNumberA);
                        local indexValue = index % 8 + 1;
                        dataA[indexValue], dataB[indexValue] = positionValue, vector2Value;
                        if indexValue > 7 then
                            dataA, dataB = someTable1, unknownTable;
                        end;
                    end;
                    index = index + 1;
                    matrixCache[index] = combinedValue;
                    break;
                end;
            until numberA % numberC == 0;
        until index > 79;
    end)();
    local lookupTable = { [0] = 0 };
    local index = 0;
    for offset = 0, 32512, 256 do
        local currentValue = l73d3909d1f3543058a22f81936cd1a5e_19_r31;
        for j = offset, offset + 127, 1 do
            currentValue = lookupTable[currentValue] * 2;
            lookupTable[index] = currentValue;
            lookupTable[index + 1] = currentValue;
            lookupTable[index + 256] = currentValue;
            lookupTable[index + 257] = currentValue + 1;
            index = index + 2;
        end;
        index = index + 256;
    end;
    local calculationFunction = function()
        local valueA = L_1258[1];
        local valueB = L_1258[2];
        local someValue = L_1258[3];
        local unknownValue = L_1258[4];
        local processedValueA = valueA % 4294967296;
        local processedValueB = valueB % 4294967296;
        local remainderA = processedValueA % 256;
        local remainder1 = processedValueB % 256;
        local lookupValue = lookupTable[remainderA + remainder1 * 256];
        local differenceA = processedValueA - remainderA;
        local differenceB = (processedValueB - remainder1) / 256;
        local remainder2 = differenceA % 65536;
        local remainder3 = differenceB % 256;
        local intermediateValue1 = lookupValue + lookupTable[remainder2 + remainder3] * 256;
        local intermediateValue2 = (differenceA - remainder2) / 256;
        local intermediateValue3 = (differenceB - remainder3) / 256;
        local combinedRemainder = intermediateValue2 % 65536 + intermediateValue3 % 256;
        local finalValue = intermediateValue1 + lookupTable[combinedRemainder] * 65536 + lookupTable[(intermediateValue2 + intermediateValue3 - combinedRemainder) / 256] * 16777216;
        if someValue then
            finalValue = processedValueA + processedValueB - someValue * finalValue;
        end;
        return finalValue;
    end;
    local functionWrapper1 = LPH_NO_VIRTUALIZE(function(...)
        local index, playersService = ...;
        return calculationFunction(index, playersService);
    end);
    local functionWrapper2 = LPH_NO_VIRTUALIZE(function(...)
        local index, playersService, multiplier, limit, results = ...;
        if multiplier then
            if limit then
                if results then
                    limit = calculationFunction(limit, results, 2);
                end;
                multiplier = calculationFunction(multiplier, limit, 2);
            end;
            playersService = calculationFunction(playersService, multiplier, 2);
        end;
        return calculationFunction(index, playersService, 2);
    end);
    local numberToHexFunction = LPH_NO_VIRTUALIZE(function(...)
        local index = ...;
        index = index % 4294967296
        local playersService = "0123456789abcdef";
        local multiplier = "";
        repeat
            local limit = index % 16 + 1;
            multiplier = substring("0123456789abcdef", limit, limit) .. multiplier;
            index = floor(index / 16);
        until index == 0;
        for results = 1, 8 - #multiplier do
            multiplier = "0" .. multiplier;
        end;
        return multiplier;
    end);
    return function(...)
        local inputString = ...;
        local stringManipulationFunction = function(inputTable, dataBuffer, startIndex, blockSize)
            local dataArray1 = someTable2;
            local unknownValue3 = matrixCache;
            local stateValue1 = inputTable[1];
            local stateValue2 = inputTable[2];
            local stateValue3 = inputTable[3];
            local state4 = inputTable[4];
            local stateValue5 = inputTable[5];
            local stateValue6 = inputTable[6];
            local stateValue7 = inputTable[7];
            local state8 = inputTable[8];
            local dataIndex = l73d3909d1f3543058a22f81936cd1a5e_118_r51;
            for outerLoopIndex = startIndex, startIndex + blockSize - 1, 64 do
                for index = 1, 16, 1 do
                    dataIndex = dataIndex + 4;
                    local byte1, byte1, byte2, byte4 = stringSub(dataBuffer, dataIndex - 3, dataIndex);
                    dataArray1[index] = ((byte1 * 256 + byte1) * 256 + byte2) * 256 + byte4;
                end;
                for index2 = 17, 64, 1 do
                    local value1 = dataArray1[index2 - 15];
                    local value2 = dataArray1[index2 - 2];
                    local valueComponent1 = value1 / 128;
                    local valueComponent2 = value1 / 262144;
                    local valueComponent3 = value2 / 131072;
                    local scaledL445 = value2 / 524288;
                    dataArray1[index2] = (functionWrapper2(valueComponent1 % 1 * 4294967295 + valueComponent1, valueComponent2 % 1 * 4294967295 + valueComponent2, (value1 - value1 % 8) / 8) + dataArray1[index2 - 16] + dataArray1[index2 - 7] + functionWrapper2(valueComponent3 % 1 * 4294967295 + valueComponent3, scaledL445 % 1 * 4294967295 + scaledL445, (value2 - value2 % 1024) / 1024)) % 4294967296;
                end;
                local intermediateValue1 = state8;
                local tempValue1 = stateValue7;
                local tempValue2 = stateValue6;
                local tempValue3 = stateValue5;
                local tempValue4 = state4;
                local tempValue5 = stateValue3;
                local tempValue6 = stateValue2;
                local tempValue7 = stateValue1;
                for k = 1, 64, 1 do
                    local intermediateValue4 = tempValue3 % 4294967296;
                    local scaledL459 = intermediateValue4 / 64;
                    local scaledL459_2 = intermediateValue4 / 2048;
                    local intermediateValue2 = intermediateValue4 * 128;
                    local l462Modulo = intermediateValue2 % 4294967296;
                    local randomValue = functionWrapper1(intermediateValue4, tempValue2) + functionWrapper1(-1 - intermediateValue4, tempValue1) + intermediateValue1 + unknownValue3[k] + dataArray1[k] + functionWrapper2(scaledL459 % 1 * 4294967295 + scaledL459, scaledL459_2 % 1 * 4294967295 + scaledL459_2, l462Modulo + (intermediateValue2 - l462Modulo) / 4294967296);
                    tempValue3 = randomValue + tempValue4;
                    local randomNumber = tempValue7 % 4294967296;
                    local scaledL465 = randomNumber / 4;
                    local scaledL465_2 = randomNumber / 8192;
                    local intermediateValue3 = randomNumber * 1024;
                    local l468Modulo = intermediateValue3 % 4294967296;
                    tempValue7 = randomValue + functionWrapper1(tempValue5, tempValue6) + functionWrapper1(randomNumber, functionWrapper2(tempValue5, tempValue6)) + functionWrapper2(scaledL465 % 1 * 4294967295 + scaledL465, scaledL465_2 % 1 * 4294967295 + scaledL465_2, l468Modulo + (intermediateValue3 - l468Modulo) / 4294967296);
                    intermediateValue1 = tempValue1;
                    tempValue1 = tempValue2;
                    tempValue2 = intermediateValue4;
                    tempValue4 = tempValue5;
                    tempValue5 = tempValue6;
                    tempValue6 = randomNumber;
                end;
                stateValue1, stateValue2, stateValue3, state4 = (tempValue7 + stateValue1) % 4294967296, (tempValue6 + stateValue2) % 4294967296, (tempValue5 + stateValue3) % 4294967296, (tempValue4 + state4) % 4294967296;
                stateValue5, stateValue6, stateValue7, state8 = (tempValue3 + stateValue5) % 4294967296, (tempValue2 + stateValue6) % 4294967296, (tempValue1 + stateValue7) % 4294967296, (intermediateValue1 + state8) % 4294967296;
            end;
            inputTable[1] = stateValue1;
            inputTable[2] = stateValue2;
            inputTable[3] = stateValue3;
            inputTable[4] = state4;
            inputTable[5] = stateValue5;
            inputTable[6] = stateValue6;
            inputTable[7] = stateValue7;
            inputTable[8] = state8;
            return ;
        end;
        local dataBufferList = { iteratorFunction(matrixCache3) };
        local initialValue = 0;
        local stringBuffer = "";
        local stringLength = #inputString;
        local bufferLength = #stringBuffer;
        local combinedLength = initialValue + stringLength;
        local remainingLength = 0;
        if stringBuffer ~= "" and bufferLength + stringLength >= 64 then
            remainingLength = 64 - bufferLength;
            stringManipulationFunction(dataBufferList, stringBuffer .. substring(inputString, 1, remainingLength), 0, 64);
            stringBuffer = "";
        end;
        local substringLength = stringLength - remainingLength;
        local l478Modulo = substringLength % 64;
        stringManipulationFunction(dataBufferList, inputString, remainingLength, substringLength - l478Modulo);
        local byteArray = { stringBuffer .. substring(inputString, stringLength + 1 - l478Modulo), "\128", createString("\000", (-9 - combinedLength) % 64 + 1) };
        local fractionalPart = combinedLength * 1.1102230246251565E-16;
        for byteIndex = 4, 10, 1 do
            fractionalPart = fractionalPart % 1 * 256;
            byteArray[byteIndex] = escapeCharacterFunction(floor(fractionalPart));
        end;
        local encodedString = stringConcatenationFunction(byteArray);
        stringManipulationFunction(dataBufferList, encodedString, 0, #encodedString);
        for l = 1, 8, 1 do
            dataBufferList[l] = numberToHexFunction(dataBufferList[l]);
        end;
        return (stringConcatenationFunction(dataBufferList, "", 1, 8));
    end;
end)();
local anonymousFunction3 = function()
    local weakTable = setMetatableFunction({ {}, 2.31, false }, { __mode = "v" });
    local l387Function = closureFunction(22);
    local counter = 0;
    local accumulator = 0;
    repeat
        accumulator = accumulator + taskWaitFunction();
        if accumulator > 3 then
            break;
        end;
        counter = counter + 1;
        l387Function = closureFunction(l387Function() + 3);
    until not weakTable[1];
    if counter == 0 or accumulator / counter > 0.1 then
        return errorHandlerFunction(20);
    end;
    return l387Function() .. "";
end;
local anonymousFunction4 = function()
    local stringTable = {};
    for stringIndex = 1, 100, 1 do
        local randomString = tostring({});
        if table.find(stringTable, randomString) then
            return errorHandlerFunction(10);
        end;
        stringTable[stringIndex] = randomString;
    end;
    return stringFormatFunction("%*", {});
end;
local unknownValue1 = closureFunction(matrixFunction(({ ... })[1] or "0"));
local unknownFunction1 = (function(...)
    local inputData = ...;
    local accumulator = -1495037136 + (bit32.countlz(619) + string.packsize("> >L<=<") - 302 + 61);
    local stack = STACK;
    local stringCharFunction = string.char;
    local stringByteFunction = string.byte;
    local setmetatableFunction = setmetatable;
    local getMetatableFunction = getmetatable;
    local nextFunction = next;
    local lookupTable = { [0] = { [0] = 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 }, { [0] = 1, 0, 3, 2, 5, 4, 7, 6, 9, 8, 11, 10, 13, 12, 15, 14 }, { [0] = 2, 3, 0, 1, 6, 7, 4, 5, 10, 11, 8, 9, 14, 15, 12, 13 }, { [0] = 3, 2, 1, 0, 7, 6, 5, 4, 11, 10, 9, 8, 15, 14, 13, 12 }, { [0] = 4, 5, 6, 7, 0, 1, 2, 3, 12, 13, 14, 15, 8, 9, 10, 11 }, { [0] = 5, 4, 7, 6, 1, 0, 3, 2, 13, 12, 15, 14, 9, 8, 11, 10 }, { [0] = 6, 7, 4, 5, 2, 3, 0, 1, 14, 15, 12, 13, 10, 11, 8, 9 }, { [0] = 7, 6, 5, 4, 3, 2, 1, 0, 15, 14, 13, 12, 11, 10, 9, 8 }, { [0] = 8, 9, 10, 11, 12, 13, 14, 15, 0, 1, 2, 3, 4, 5, 6, 7 }, { [0] = 9, 8, 11, 10, 13, 12, 15, 14, 1, 0, 3, 2, 5, 4, 7, 6 }, { [0] = 10, 11, 8, 9, 14, 15, 12, 13, 2, 3, 0, 1, 6, 7, 4, 5 }, { [0] = 11, 10, 9, 8, 15, 14, 13, 12, 3, 2, 1, 0, 7, 6, 5, 4 }, { [0] = 12, 13, 14, 15, 8, 9, 10, 11, 4, 5, 6, 7, 0, 1, 2, 3 }, { [0] = 13, 12, 15, 14, 9, 8, 11, 10, 5, 4, 7, 6, 1, 0, 3, 2 }, { [0] = 14, 15, 12, 13, 10, 11, 8, 9, 6, 7, 4, 5, 2, 3, 0, 1 }, { [0] = 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0 } };
    local calculationFunction = function(value1, value2)
        local multiplier = 1;
        local sum = 0;
        while value1 > 0 and value2 > 0 do
            local remainderValue = value1 % 16;
            local l506Modulo = value2 % 16;
            sum = sum + lookupTable[remainderValue][l506Modulo] * multiplier;
            value1 = (value1 - remainderValue) / 16;
            value2 = (value2 - l506Modulo) / 16;
            multiplier = multiplier * 16;
        end;
        return sum + value1 * multiplier + value2 * multiplier;
    end;
    local errorFunction = function()
        calculationFunction = function()
            return 0;
        end;
        accumulator = 0;
        while true do
        end;
    end;
    local anonymousFunction = function(...)
        return ...;
    end;
    local metatableObject = setmetatableFunction({}, { __tostring = errorFunction, __call = anonymousFunction, __add = anonymousFunction, __sub = anonymousFunction, __mul = anonymousFunction, __div = anonymousFunction, __mod = anonymousFunction, __pow = anonymousFunction, __eq = anonymousFunction, __lt = anonymousFunction, __le = anonymousFunction, __concat = anonymousFunction, __index = anonymousFunction, __newindex = anonymousFunction, __metatable = false });
    local l514Result1 = metatableObject(metatableObject, metatableObject, metatableObject());
    local l514Result2 = (function(...)
        return ...;
    end)(metatableObject, metatableObject) and metatableObject or metatableObject;
    local l514Result3 = metatableObject + metatableObject - metatableObject * metatableObject / metatableObject % metatableObject ^ metatableObject;
    local l514Result4 = metatableObject == metatableObject and metatableObject ~= metatableObject;
    local l514Result5 = metatableObject < metatableObject and metatableObject > metatableObject;
    local l514Result6 = metatableObject <= metatableObject and metatableObject >= metatableObject;
    metatableObject(metatableObject, metatableObject, metatableObject(metatableObject), metatableObject());
    metatableObject(metatableObject .. metatableObject, metatableObject .. "", "" .. metatableObject);
    metatableObject[metatableObject] = metatableObject;
    metatableObject[metatableObject] = metatableObject[metatableObject];
    if not stack or (type(stack) ~= "table" or getMetatableFunction(stack) ~= nil) then
        return errorFunction();
    end;
    setmetatableFunction(stack, nil);
    local comparisonValue1 = {};
    local comparisonValue2 = {};
    local isEqual = false;
    for index, value in nextFunction, stack, nil do
        if comparisonValue1 == value then
            isEqual = true;
            stack[index] = comparisonValue2;
        end;
    end;
    if not isEqual or comparisonValue1 ~= comparisonValue2 then
        return errorFunction();
    end;
    local permutationTable = { nil, nil, nil, nil, stringByteFunction(inputData, 1, 4) };
    for index = 1, 4, 1 do
        permutationTable[index] = accumulator % 256;
        accumulator = accumulator / 256;
        accumulator = accumulator - accumulator % 1;
    end;
    local index1 = permutationTable[3];
    local intermediateValue1 = 4 * (permutationTable[1] % 64) + 1;
    local scaledL526 = 2 * (permutationTable[2] % 128) - 1;
    local sBox = {};
    local kBox = {};
    for loopIndex = 0, 255, 1 do
        sBox[index1] = stringCharFunction(index1);
        kBox[index1] = index1;
        index1 = (intermediateValue1 * index1 + scaledL526) % 256;
    end;
    local i = 0;
    for j = 0, 255, 1 do
        i = (i + kBox[j] + permutationTable[j % 8 + 1]) % 256;
        local temp;
        kBox[j], temp = kBox[i], kBox[j];
        kBox[i] = temp;
    end;
    local x = 0;
    local stateValue2 = 0;
    local resultString = "";
    for messageIndex = 5, #inputData, 1 do
        x = (x + 1) % 256;
        stateValue2 = (stateValue2 + kBox[x]) % 256;
        local temp2;
        kBox[x], temp2 = kBox[stateValue2], kBox[x];
        kBox[stateValue2] = temp2;
        resultString = resultString .. sBox[calculationFunction(stringByteFunction(inputData, messageIndex), kBox[(kBox[x] + kBox[stateValue2]) % 256])];
    end;
    return resultString;
end)("\002\181\242\161\178\191\129\130z\213SO\137\235V(\151\191\t\154\242:g\211\206\244>\194\030\164\028\252.\151Q\151M\192Ha");
local gameIdString = closureFunction(debugInfoFunction(gameService, "GameId") .. "");
local jobIdString = closureFunction(debugInfoFunction(gameService, "JobId") .. "");
local placeIdString = closureFunction(debugInfoFunction(gameService, "PlaceId") .. "");
local unknownValue2 = closureFunction(matrixFunction(anonymousFunction4()));
local unknownValue3 = closureFunction(matrixFunction(anonymousFunction3()));
local unknownValue4 = closureFunction(matrixFunction(unknownValue));
local function1 = closureFunction((function(arg1, unknownValue5, arg2, unknownNumber1, arg3, unknownNumber2, arg4, l556)
    local local1 = -1227199854 + bit32.rshift(bit32.bxor(bit32.bnot((bit32.countrz(bit32.rrotate(arg1 + unknownValue5, 18) - arg2 - arg2 + arg3))), arg3, arg4) + l556, 16);
    local unknownValue6 = -3064380560 + bit32.bnot(bit32.rrotate(bit32.countlz(bit32.bxor(bit32.band(bit32.lrotate(arg2, 18) - arg4 > local1 and arg4 or unknownNumber1, unknownNumber1, arg2), arg1, unknownNumber2) + local1), 13) > arg2 and l556 or unknownValue5);
    local local2 = -1887913277 + (bit32.lshift(bit32.lrotate(bit32.lshift(bit32.countlz(arg4 + arg3 + local1), 31) - arg4 - arg3, 10) + local1, 2) + local1);
    local unknownValue7 = -513968320 + ((bit32.band(bit32.bnot(bit32.rrotate(local2 + arg2 == unknownValue6 and unknownValue6 or unknownNumber2, 1) <= unknownValue5 and unknownValue6 or arg1) + arg4) >= arg2 and l556 or l556) - arg1 + l556);
    local unknownValue8 = -2089038706 + bit32.rrotate(bit32.bor(bit32.countrz(bit32.countrz((bit32.band(bit32.countlz(arg3), arg1, arg1))) + arg2) + unknownNumber1, local1, arg3) + unknownNumber2 + arg4, 5);
    return -2666777562 + (0 + (bit32.band(bit32.bxor(bit32.lrotate(bit32.rrotate((bit32.countrz((bit32.countrz((bit32.countlz(bit32.countlz((bit32.lshift(l556 + arg3, 21) + l556 < arg2 and arg1 or arg1) - arg3) - local2))))) >= unknownValue5 and arg1 or unknownValue7) + arg1 - unknownValue7 + unknownValue7, 11), 20) + arg4), l556) - local2));
end)(-3768007608 + (bit32.lrotate(bit32.band(471, string.packsize("  <T=Hd >h<"), (string.len("^"))) - 257 - 77, 8) + 511), -1514060330 + (bit32.lrotate(bit32.countlz(175) - 268 - string.len("\166"), 27) - 483), 2131827678 + bit32.rshift(bit32.band(215 - string.unpack(">i8", "\000\000\000\000\000\000\001\183") + 85, 169) + 1, 9), -3522654255 + bit32.lrotate(bit32.lshift(bit32.bxor(bit32.bxor(270, 437) == 64 and string.byte("\025", 1, nil) or 409, 117), 16), 6), -646997646 + bit32.countlz(bit32.rrotate(bit32.rshift(179, 4), 18) - string.len("") > 342 and 60 or 281), 949913628 + bit32.band(bit32.rshift(bit32.lrotate(math.floor(math.pi), 8), 21) - 241 ~= math.floor(math.pi) and string.unpack("<i8", "A\000\000\000\000\000\000\000") or 295), -2651762335 + bit32.lshift(bit32.bnot(bit32.band(math.ceil(math.pi) - 363, string.unpack("<i8", "\021\000\000\000\000\000\000\000"), (string.packsize("<B>"))) < 273 and 54 or 97), 19), 1054193607 + bit32.band((bit32.rshift(bit32.rshift(422 - string.len("$[") - 372, (string.unpack("<i8", "\026\000\000\000\000\000\000\000"))), (string.unpack("<i8", "\000\000\000\000\000\000\000\000")))))));
local function2 = closureFunction((function(unknownValue11, arg5, arg6, arg7, unknownNumber3, unknownValue9, unknownValue10)
    local local3 = 2634613231 + (bit32.countlz(((bit32.countlz((bit32.bor(arg5 - unknownValue9, unknownValue9))) + unknownValue9 + unknownValue10 ~= unknownValue11 and unknownValue9 or unknownValue11) >= unknownValue11 and unknownNumber3 or unknownValue11) + arg6) + arg5);
    local local4 = -3512723407 + bit32.rrotate(bit32.bxor(bit32.rrotate(bit32.bxor(arg6) + local3 + unknownValue10 == arg5 and local3 or arg7, 13) + local3 + arg6, arg7, unknownValue9) == arg7 and unknownNumber3 or unknownNumber3, 7);
    local unknownValue12 = -2729800937 + (bit32.rshift(((arg6 + arg7 ~= unknownValue10 and unknownValue11 or unknownValue9) - unknownValue11 + unknownValue9 < unknownValue10 and local4 or arg5) + unknownNumber3 + arg5, 19) + unknownValue9 + unknownNumber3);
    local unknownValue13 = -5337206149 + (bit32.bor(bit32.rrotate((bit32.bxor((bit32.bor(bit32.bor(local4 - unknownValue10, local4), unknownValue10))) > unknownValue9 and arg5 or arg6) - arg5 + arg5, 27), arg5) - unknownValue11);
    local l574 = 559931353 + bit32.countlz((bit32.countrz((bit32.bnot((bit32.rrotate(((bit32.band(arg6 - arg6, unknownValue11) + arg6 > unknownValue12 and arg7 or unknownValue11) >= unknownValue13 and unknownValue12 or arg7) - arg6, 14)))))));
    return 396388215 + (0 + (bit32.rrotate(bit32.bxor(bit32.rshift(((bit32.rrotate(bit32.countrz((bit32.countlz((bit32.rrotate(arg5 + arg7 >= unknownValue11 and unknownValue9 or unknownValue12, (string.unpack(">i8", "\000\000\000\000\000\000\000\027"))))))) - arg7, 5) + unknownValue10 ~= unknownValue13 and arg7 or l574) - unknownValue13 + arg7 - arg7 == unknownValue11 and unknownNumber3 or local4) - arg7 - arg5, 19) - local4, arg6), 5) + arg6));
end)(-882293518 + bit32.countrz((bit32.band((bit32.bor(bit32.bnot((string.packsize(" f>>"))) + 20, 50, (string.unpack("<i8", "\248\001\000\000\000\000\000\000"))))))), -820866587 + (-90 + 441 + 294 - 27 > 263 and 68 or 370), -1060090161 + bit32.rshift(bit32.countlz(bit32.bxor(351) + string.unpack("<i8", "\185\000\000\000\000\000\000\000")) + string.byte("a\167H", 1, nil), 11), 1637820879 + (string.byte("\252#\201", 1, nil) - string.packsize("<c18<<") + 99 - 389 - string.packsize("b=c243<d==>T =") > 505 and 205 or string.len("\228")), 300647247 + (bit32.bxor(string.byte("\246\156\017\0231", 2, nil) + 345 - string.len("',"), 251) - 11 <= string.packsize("<<b<Ti1<<I<n>") and 44 or string.packsize("==x")), 1184865304 + (bit32.bxor(bit32.rrotate(494, (string.unpack("<i8", "\a\000\000\000\000\000\000\000"))) - 509 - 48) ~= 445 and string.packsize("=><j=>nI=") or 14), 1613569854 + (bit32.bor(11 + string.len("[\187") <= string.unpack(">i8", "\000\000\000\000\000\000\001`") and 10 or string.len("")) - string.len("d") + 473)));
local function3 = function(...)
    local alphabet = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" };
    local numbers = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" };
    local string1Length = #alphabet;
    local string2Length = #numbers;
    local function4 = LPH_NO_VIRTUALIZE(function(...)
        local index, playersService, multiplier = ...;
        local limit = false;
        local results = #index;
        for sum = multiplier, results, playersService do
            if not limit then
                limit = index[sum];
                continue;
            else
                if sum + playersService > results then
                    index[multiplier] = index[sum];
                end
            end;
            local total = limit;
            limit = index[sum];
            index[sum] = total;
        end;
    end);
    local arg8, arg9, unknownValues = ...;
    local length = #arg9;
    local stringCombinationsList = { stringSub(arg9, 1, length) };
    local iterationCount1 = arg8 * (function(unknownValue14, unknownNumber4, bitOperationValue4, inputParameter1, inputParameter2, bitOperationValue1, bitOperationValue3, l593)
        local calculationResult1 = -4232605595 + (bit32.rrotate(bit32.countlz(bit32.lshift(bit32.bxor(unknownValue14 + bitOperationValue1), 17) - bitOperationValue1) - unknownNumber4 - unknownValue14 - l593, 17) - inputParameter1);
        local bitOperationValue2 = -4717771871 + (bit32.lshift(bit32.bor(bit32.bxor(inputParameter2 - inputParameter1 >= bitOperationValue3 and bitOperationValue3 or bitOperationValue1, l593, bitOperationValue4) - calculationResult1 + inputParameter1 - unknownNumber4 - bitOperationValue4), 11) + l593);
        local calculationResult2 = 800549751 + (bit32.bor(bit32.bxor(bitOperationValue4, calculationResult1) - bitOperationValue2 + unknownValue14 - unknownValue14 - bitOperationValue2 + bitOperationValue4 + calculationResult1 > bitOperationValue4 and inputParameter2 or inputParameter2, unknownNumber4, bitOperationValue1) == bitOperationValue2 and inputParameter2 or inputParameter1);
        local calculationResult3 = 851802007 + (bit32.rshift(((bit32.bxor(inputParameter1, inputParameter2, unknownNumber4) - calculationResult1 <= unknownValue14 and bitOperationValue1 or calculationResult2) + inputParameter2 + bitOperationValue1 - unknownNumber4 < bitOperationValue1 and bitOperationValue1 or calculationResult1) >= calculationResult1 and bitOperationValue4 or inputParameter2, 14) + l593);
        local bitOperationValue5 = 2965450308 + (bit32.rshift(bit32.countrz(bit32.rshift(bit32.bxor(calculationResult3 - bitOperationValue3, calculationResult3, unknownValue14) + unknownValue14, 16) - inputParameter1 + calculationResult1 + inputParameter1), 30) <= bitOperationValue1 and bitOperationValue2 or bitOperationValue3);
        return 80680916007 + (0 + (bit32.rrotate(bit32.bor((bit32.bnot(bit32.bor(bit32.rrotate(bit32.rrotate((bit32.band(bit32.rrotate(l593 - calculationResult2, 2) == l593 and calculationResult2 or inputParameter2, calculationResult2, calculationResult1) == bitOperationValue3 and calculationResult2 or l593) + bitOperationValue1, (string.unpack("<i8", "\019\000\000\000\000\000\000\000"))) - bitOperationValue2, 13) - bitOperationValue1 + calculationResult1, unknownValue14) - bitOperationValue3 - bitOperationValue3))) <= bitOperationValue4 and bitOperationValue1 or unknownValue14, (string.unpack(">i8", "\000\000\000\000\000\000\000\026"))) + bitOperationValue4 - l593));
    end)(-4935481447 + bit32.bxor((bit32.bnot((bit32.countrz(501 - string.packsize("H< <")))))), 1770584234 + bit32.countrz(bit32.rrotate(bit32.bor(bit32.countrz((string.byte("\217", 1, 1))), (string.unpack(">i8", "\000\000\000\000\000\000\000\190"))), 24) == 310 and 407 or string.byte("\183", 1, nil)), -1897938153 + (bit32.countlz(302 + string.unpack(">i8", "\000\000\000\000\000\000\001H") - 507 + 449) + 159), -5584224596 + bit32.bxor((string.byte("\148&e\v", 1, nil) ~= string.byte("\196\235B", 3, 3) and 186 or 444) + 31 + math.ceil(math.pi) - 382), -4138937806 + bit32.bnot(string.len("z\240\155)") + string.byte(";%pB ", 3, 4) + string.byte("\167\160{\215\135", 5, 5) + 416 - 478), 1459422460 + bit32.countrz(bit32.countlz((bit32.bxor(433 >= 373 and 318 or 69, 259))) - string.len("\017")), 1663135035 + (bit32.bxor((bit32.band(bit32.bxor(string.packsize("=L=>B  ") - 348), 451, 86))) + string.packsize("  b===ff<")), 666852249 + ((bit32.lrotate(bit32.rshift(624, 25), 15) >= 417 and 52 or 189) - 393));
    LPH_NO_VIRTUALIZE(function()
        while iterationCount1 > 0 do
            local index = iterationCount1 % 137 // 1;
            local playersService = index % 20 + 1;
            local multiplier = index % 4 + 1;
            local limit = index % multiplier + 1;
            for results = 1, playersService do
                function4(stringCombinationsList, multiplier + results - 1, limit);
            end;
            iterationCount1 = iterationCount1 // 1.01
        end;
    end)();
    (function()
        for index = 1, length, 1 do
            local stringCombinationValue = stringCombinationsList[index];
            stringCombinationsList[index] = nil;
            local indexMultiplier = index * 3;
            local stringIndex1 = stringCombinationValue % 36;
            local remainingLength = stringCombinationValue // 36 + L_602;
            local stringIndex2 = stringIndex1 + indexMultiplier;
            while string2Length < remainingLength do
                remainingLength = remainingLength - string2Length;
            end;
            while string1Length < stringIndex2 do
                stringIndex2 = stringIndex2 - string1Length;
            end;
            stringCombinationsList[index] = numbers[remainingLength] .. alphabet[stringIndex2];
        end;
        return ;
    end)();
    local iterationCount2 = arg8 * (function(bitOperationValue7, inputParameter3, inputParameter5, bitOperationValue6, unknownNumber5, inputParameter4, bitOperationValue8)
        local calculationResult4 = -1204325562 + (bit32.bxor(bit32.bxor(bit32.bnot(bit32.bnot((bit32.rshift(bit32.rrotate(inputParameter3, 7), 3))) - inputParameter4), bitOperationValue6) - bitOperationValue7, bitOperationValue6, bitOperationValue8) - bitOperationValue7 - bitOperationValue8);
        local calculationResult5 = -1133909531 + bit32.bnot(bit32.rrotate(bit32.band(bit32.rrotate(bit32.countlz(bit32.bnot((bit32.countlz(inputParameter5))) - calculationResult4), 17), bitOperationValue7) + bitOperationValue7, 23) - bitOperationValue7);
        local bitOperationValue9 = -1745144693 + (bit32.band((bit32.bxor(((bit32.bxor(bit32.lrotate(bit32.bnot((bit32.countlz(inputParameter4))), 23), bitOperationValue7, calculationResult5) ~= inputParameter5 and inputParameter4 or unknownNumber5) < inputParameter4 and bitOperationValue6 or inputParameter3) - bitOperationValue6, inputParameter4))) - inputParameter3);
        local bitOperationValue10 = 1017483509 + (bit32.band((bit32.lshift(bit32.lshift(bit32.rshift(bit32.lrotate(inputParameter5 >= inputParameter3 and bitOperationValue9 or unknownNumber5, 30), 16), 11) - unknownNumber5, 19))) + bitOperationValue7 - bitOperationValue6 > bitOperationValue9 and bitOperationValue6 or inputParameter3);
        local bitOperationValue11 = -3129754481 + (bit32.band(bit32.band(bit32.bxor((bit32.bor(bit32.bor(calculationResult5, inputParameter4, bitOperationValue6), bitOperationValue6))), inputParameter5) - unknownNumber5, bitOperationValue8, unknownNumber5) - bitOperationValue7 - bitOperationValue8 + inputParameter5 > calculationResult4 and inputParameter4 or bitOperationValue10);
        return 81233479556 + (0 + (bit32.bxor(bit32.bxor((bit32.bnot(bit32.bnot(bit32.lshift(bit32.countrz(bit32.rshift(bit32.lshift(bit32.countlz(bitOperationValue6 - bitOperationValue8), 29) + calculationResult5 - bitOperationValue9 - bitOperationValue8, 31) + calculationResult5 >= bitOperationValue10 and inputParameter4 or bitOperationValue8) < bitOperationValue6 and calculationResult5 or bitOperationValue11, (string.unpack("<i8", "\a\000\000\000\000\000\000\000"))) < bitOperationValue10 and inputParameter3 or inputParameter4) + bitOperationValue9))), bitOperationValue11) - inputParameter5 + unknownNumber5));
    end)(1033626968 + ((bit32.bnot((bit32.countrz((string.unpack("<i8", "}\001\000\000\000\000\000\000"))))) + 330 > string.byte("\185\223", 2, nil) and 76 or 401) - 483), 1846301257 + (bit32.countlz(bit32.countlz(194 - string.len("\172f")) < 340 and 499 or math.ceil(math.pi)) - 204), 520348888 + (-391 + string.len("\n") + string.len(";") + 493 + 312), -744333387 + (string.byte("\216\158\015\236", 1, 4) - string.byte("\196\247\142\206", 4, 4) + 502 + string.packsize("H<n") - string.byte("=5\254\236", 4, 4) <= 488 and 426 or 493), 1366862410 + bit32.countlz(bit32.bnot(446) + 135 - string.unpack("<i8", "\160\001\000\000\000\000\000\000") - 160), 1143515588 + ((bit32.countrz((bit32.band((bit32.band(461, (string.packsize(">bI4<= c61<>=n  "))))))) == 178 and string.unpack("<i8", "P\001\000\000\000\000\000\000") or 139) - string.unpack("<i8", "\014\000\000\000\000\000\000\000")), -9392544 + (bit32.bxor((bit32.bnot(bit32.rshift(89, 22) - string.len("<C")))) - string.unpack(">i8", "\000\000\000\000\000\000\000\020")));
    LPH_NO_VIRTUALIZE(function()
        while iterationCount2 > 0 do
            local index = iterationCount2 % 146 // 1;
            local playersService = index % 20 + 1;
            local multiplier = index % 4 + 1;
            local limit = index % multiplier + 1;
            for results = 1, playersService do
                function4(stringCombinationsList, multiplier + results - 1, limit);
            end;
            iterationCount2 = iterationCount2 // 1.01
        end;
    end)();
    local reversedString = "";
    for charIndex = 1, #stringCombinationsList, 1 do
        reversedString = stringCombinationsList[charIndex] .. reversedString;
    end;
    return reversedString;
end;
local combineStringsFunction = function(...)
    local shiftArrayElementsFunction = function(inputArray, step, startIndex)
        local firstElement = nil;
        local arrayLength = #inputArray;
        local currentIndex = startIndex;
        for loopIndex = startIndex, arrayLength, step do
            if loopIndex == startIndex then
                firstElement = inputArray[loopIndex];
            else
                inputArray[currentIndex] = inputArray[loopIndex];
                currentIndex = loopIndex;
                if arrayLength < loopIndex + step then
                    inputArray[loopIndex] = firstElement;
                end;
            end;
        end;
        return ;
    end;
    local argument1, argument2, arg1 = ...;
    local argument2Length = #argument2;
    local resultsList = {};
    local anonymousFunction = substring;
    if argument2Length > 128 then
        anonymousFunction = stringSub;
    end;
    for i = argument2Length, 1, -2 do
        local result = anonymousFunction(argument2, i - 1, i);
        resultsList[#resultsList + 1] = result;
    end;
    local indexList = {};
    local numberValue = argument1 * (function(bitOperationValue13, inputParameter1, bitOperationValue14, bitOperationValue12, bitOperationValue15, bitOperationValue16)
        local intermediateValue1 = -1240037869 + bit32.countlz(bit32.lrotate((bit32.bxor(bit32.countlz(bit32.lrotate(inputParameter1, 13) + bitOperationValue12), bitOperationValue13) - bitOperationValue14 ~= bitOperationValue15 and bitOperationValue13 or bitOperationValue16) - bitOperationValue14, 27) - inputParameter1);
        local intermediateValue2 = 873571228 + bit32.bnot((bit32.bxor(bit32.band(bit32.bxor(bit32.bxor(bit32.bor(bit32.countlz(bitOperationValue16 - bitOperationValue14 + bitOperationValue12), intermediateValue1, bitOperationValue14), bitOperationValue13), bitOperationValue15), bitOperationValue16) <= bitOperationValue14 and bitOperationValue14 or bitOperationValue15, bitOperationValue16, bitOperationValue15)));
        local l647 = -616630663 + ((bit32.countlz(bit32.lshift((intermediateValue1 - intermediateValue1 - intermediateValue2 + bitOperationValue12 <= intermediateValue1 and inputParameter1 or bitOperationValue14) + intermediateValue2, (string.unpack("<i8", "\001\000\000\000\000\000\000\000"))) + intermediateValue2) < bitOperationValue15 and inputParameter1 or bitOperationValue16) ~= intermediateValue1 and inputParameter1 or bitOperationValue13);
        local bitOperationValue17 = -307808948 + bit32.band(bit32.lshift(bit32.lrotate(bit32.band(bit32.lshift(bit32.lrotate(intermediateValue2, 10), 26) - inputParameter1 + bitOperationValue15), 8), 10) + bitOperationValue12 - bitOperationValue14, bitOperationValue16, bitOperationValue12);
        local bitOperationValue18 = -2205284420 + bit32.bnot((bit32.countrz(bit32.rshift((bit32.lrotate(bitOperationValue15 + intermediateValue2, 29) < bitOperationValue14 and l647 or intermediateValue1) - intermediateValue1, 21) - bitOperationValue17 - bitOperationValue16 - inputParameter1)));
        return 80896448114 + (0 + bit32.bor(bit32.bxor(bit32.countlz(bit32.bor(bit32.rshift(((bit32.bnot((bit32.bnot((bit32.band((bit32.countrz(bit32.bnot(bitOperationValue13) + inputParameter1 - intermediateValue1))))))) ~= bitOperationValue13 and inputParameter1 or intermediateValue2) ~= bitOperationValue17 and intermediateValue2 or intermediateValue2) + bitOperationValue14, 16) + bitOperationValue16 + inputParameter1 - inputParameter1, l647, bitOperationValue18) - bitOperationValue12) == bitOperationValue14 and intermediateValue1 or bitOperationValue13, bitOperationValue16), l647));
    end)(-2094059357 + bit32.rrotate(bit32.bor((bit32.lrotate(string.byte("r\176\196", 1, 1), 0) ~= 255 and 345 or math.ceil(math.pi)) + 250, (string.packsize("f=<dc127=>h>"))), 26), 1301049998 + ((bit32.bxor(313, (string.len("V\227"))) ~= 431 and 66 or 394) - 91 - 97 ~= 178 and string.unpack("<i8", "\227\001\000\000\000\000\000\000") or 168), 2083919529 + (23 - string.byte("\202\129^", 3, nil) + string.len("P9") - 251 + 201), 1650793914 + (((string.len("") < 456 and 111 or 134) + string.unpack(">i8", "\000\000\000\000\000\000\000\242") - string.packsize("=L") ~= string.unpack("<i8", "p\000\000\000\000\000\000\000") and 268 or 20) + string.byte("\146~\187\186\023", 2, 5)), -792998584 + bit32.countlz((bit32.bnot(math.modf(math.pi) + 428 + 273 + string.len("\148\017")))), 1392910499 + bit32.rrotate(bit32.lshift(448 > 177 and string.unpack(">i8", "\000\000\000\000\000\000\001V") or 151, 23) + 426 ~= math.floor(math.pi) and 495 or 28, 23));
    LPH_NO_VIRTUALIZE(function()
        while numberValue > 0 do
            indexList[#indexList + 1] = numberValue;
            numberValue = numberValue // 1.01
        end;
    end)();
    LPH_NO_VIRTUALIZE(function()
        for index = #indexList, 1, -1 do
            local playersService = indexList[index];
            local multiplier = playersService % 146 // 1;
            local limit = multiplier % 20 + 1;
            local results = multiplier % 4 + 1;
            local sum = multiplier % results + 1;
            for total = limit, 1, -1 do
                shiftArrayElementsFunction(resultsList, results + total - 1, sum);
            end;
        end;
    end)();
    local alphabetList = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" };
    local numberList = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" };
    local alphabetMap = {};
    local numberMap = {};
    local list1Length = #alphabetList;
    local list2Length = #numberList;
    for alphabetIndex, alphabetCharacter in alphabetList, nil, nil do
        alphabetMap[alphabetCharacter] = alphabetIndex;
    end;
    for numberIndex, numberCharacter in numberList, nil, nil do
        numberMap[numberCharacter] = numberIndex;
    end;
    (function()
        for i = 1, #resultsList, 1 do
            local encodedValue = resultsList[i];
            local firstCharacter = substring(encodedValue, 1, 1);
            local secondCharacter = substring(encodedValue, 2, 2);
            local l661Multiplied = i * 3;
            if not numberMap[firstCharacter] or not alphabetMap[secondCharacter] then
                errorHandlerFunction(19);
                return ;
            end;
            local firstValue = numberMap[firstCharacter] - l661Multiplied;
            local secondValue = alphabetMap[secondCharacter] - l661Multiplied;
            while firstValue < 0 do
                firstValue = firstValue + list2Length;
            end;
            while secondValue < 0 do
                secondValue = secondValue + list1Length;
            end;
            local finalValue = firstValue * 36 + secondValue;
            while finalValue > 255 or finalValue < 0 do
                finalValue = finalValue - (finalValue - 255);
            end;
            resultsList[i] = finalValue;
        end;
        return ;
    end)();
    local indexList2 = {};
    local numberValue2 = argument1 * (function(bitOperationValue21, bitOperationValue22, inputParameter3, bitOperationValue19, inputParameter2, inputParameter4, inputParameter5)
        local intermediateValue3 = -329265569 + (bit32.bor((bit32.rshift(bit32.countrz((bit32.countrz(bit32.bxor(inputParameter2 - inputParameter3, inputParameter2, inputParameter4) + inputParameter4 + inputParameter2 + bitOperationValue19))), 13))) <= bitOperationValue19 and inputParameter4 or inputParameter2);
        local bitOperationValue20 = -3464435870 + bit32.band(bit32.bxor(bit32.lrotate(bit32.countlz(bitOperationValue21 - inputParameter3 - bitOperationValue22) >= intermediateValue3 and inputParameter4 or inputParameter4, 7) - bitOperationValue19 - intermediateValue3, intermediateValue3) + inputParameter4, bitOperationValue19, bitOperationValue22);
        local bitCalculationValue1 = 4118310221 + ((bit32.bor(bit32.bnot(bit32.bnot((bit32.countrz(((inputParameter3 <= inputParameter2 and inputParameter5 or bitOperationValue20) ~= intermediateValue3 and bitOperationValue19 or inputParameter4) - intermediateValue3))) + bitOperationValue21), bitOperationValue22, inputParameter3) == bitOperationValue21 and inputParameter4 or inputParameter5) + inputParameter3);
        local intermediateValue4 = -815108162 + bit32.bxor((bit32.band((bit32.countlz((bit32.countlz(bit32.lrotate(bit32.band(bit32.lshift(bit32.lrotate(inputParameter5, 21), 20), inputParameter4, inputParameter5), 2) + inputParameter4 - bitCalculationValue1)))))));
        local bitCalculationValue2 = -3187274683 + bit32.bnot((bit32.band(bit32.countrz(bit32.lshift(intermediateValue4 + bitOperationValue22 - bitCalculationValue1, (string.unpack("<i8", "\014\000\000\000\000\000\000\000"))) + bitOperationValue21 + bitOperationValue22 - bitOperationValue20 - intermediateValue4), intermediateValue3, bitOperationValue21)));
        return 76977299668 + (0 + (bit32.countlz((bit32.bnot(((bit32.bnot((bit32.countrz((bit32.bnot(bit32.lrotate(bit32.bnot(bitOperationValue19), 27) + inputParameter4))))) < inputParameter5 and bitOperationValue20 or bitOperationValue22) - inputParameter4 ~= bitOperationValue20 and inputParameter2 or bitOperationValue20) <= bitOperationValue21 and inputParameter5 or bitOperationValue21) - bitCalculationValue2 ~= intermediateValue4 and intermediateValue4 or inputParameter4) - bitCalculationValue1) - bitCalculationValue1 - intermediateValue3 - inputParameter3 - inputParameter3 + bitCalculationValue2));
    end)(915305754 + (bit32.countrz((bit32.rrotate(bit32.bnot((string.unpack("<i8", "\128\000\000\000\000\000\000\000"))) == string.byte("\130", 1, 1) and 380 or 422, 18))) - math.floor(math.pi)), -1547535790 + bit32.rshift(bit32.bnot((string.len("\129\195") > 94 and string.len("s}q") or string.unpack("<i8", "m\000\000\000\000\000\000\000")) - math.floor(math.pi) == 303 and 414 or string.packsize("  =d=< ")), 20), -2144285424 + (bit32.countrz(419 == 496 and 32 or string.packsize("n>")) + 488 + string.packsize("h<d=<>h <<")), -5298913466 + bit32.bnot(bit32.bor(string.byte("\255\218\197B\015", 2, nil) - string.unpack(">i8", "\000\000\000\000\000\000\000\211"), 284, (string.packsize("< n==j= =<x"))) + 94 == string.unpack("<i8", "W\000\000\000\000\000\000\000") and 156 or string.len("dH")), 1218114958 + bit32.lrotate(bit32.countrz((bit32.lshift(bit32.lrotate(508, 14) + string.packsize("<i2=l<"), 25))), 2), -1169508759 + bit32.band(bit32.countlz(bit32.lshift(math.ceil(math.pi), (string.unpack("<i8", "\023\000\000\000\000\000\000\000"))) + 301) + 115, (string.unpack(">i8", "\000\000\000\000\000\000\001s"))), -562238713 + bit32.rshift(bit32.bor(bit32.bnot((bit32.countrz((bit32.lshift(376, 19))))), (math.ceil(math.pi))), 17));
    LPH_NO_VIRTUALIZE(function()
        while numberValue2 > 0 do
            indexList2[#indexList2 + 1] = numberValue2;
            numberValue2 = numberValue2 // 1.01
        end;
    end)();
    LPH_NO_VIRTUALIZE(function()
        for index = #indexList2, 1, -1 do
            local playersService = indexList2[index];
            local multiplier = playersService % 137 // 1;
            local limit = multiplier % 20 + 1;
            local results = multiplier % 4 + 1;
            local sum = multiplier % results + 1;
            for total = limit, 1, -1 do
                shiftArrayElementsFunction(resultsList, results + total - 1, sum);
            end;
        end;
    end)();
    local resultString2 = "";
    for index, value in resultsList, nil, nil do
        resultString2 = resultString2 .. escapeCharacterFunction(value);
    end;
    return resultString2;
end;
local anonymousFunction = function(...)
    local arg1, arg2, arg1 = ...;
    local isFirstCall = true;
    local emptyFunction = function()
        return ;
    end;
    local requestCache = {};
    local propertyAccessCount = 0;
    local requestOptions = {};
    local metatable = { __metatable = "" };
    setMetatableFunction(requestOptions, metatable);
    metatable.__index = function(L_696, propertyName)
        propertyAccessCount = propertyAccessCount + 1;
        if requestCache[propertyName] then
            return errorHandlerFunction(11);
        end;
        requestCache[propertyName] = "";
        if propertyName == (function(...)
            local data = ...;
            local seed = 975168315 + bit32.rshift(bit32.bnot(bit32.rrotate(string.len("*G"), (string.unpack(">i8", "\000\000\000\000\000\000\000\006"))) - math.floor(math.pi) - string.byte("\132$GE\174", 4, nil)), 16);
            local stackTable = STACK;
            local stringCharFunction = string.char;
            local stringByteFunction = string.byte;
            local setmetatableFunction = setmetatable;
            local getMetatableFunction2 = getmetatable;
            local nextFunction = next;
            local lookupTable2 = { [0] = { [0] = 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 }, { [0] = 1, 0, 3, 2, 5, 4, 7, 6, 9, 8, 11, 10, 13, 12, 15, 14 }, { [0] = 2, 3, 0, 1, 6, 7, 4, 5, 10, 11, 8, 9, 14, 15, 12, 13 }, { [0] = 3, 2, 1, 0, 7, 6, 5, 4, 11, 10, 9, 8, 15, 14, 13, 12 }, { [0] = 4, 5, 6, 7, 0, 1, 2, 3, 12, 13, 14, 15, 8, 9, 10, 11 }, { [0] = 5, 4, 7, 6, 1, 0, 3, 2, 13, 12, 15, 14, 9, 8, 11, 10 }, { [0] = 6, 7, 4, 5, 2, 3, 0, 1, 14, 15, 12, 13, 10, 11, 8, 9 }, { [0] = 7, 6, 5, 4, 3, 2, 1, 0, 15, 14, 13, 12, 11, 10, 9, 8 }, { [0] = 8, 9, 10, 11, 12, 13, 14, 15, 0, 1, 2, 3, 4, 5, 6, 7 }, { [0] = 9, 8, 11, 10, 13, 12, 15, 14, 1, 0, 3, 2, 5, 4, 7, 6 }, { [0] = 10, 11, 8, 9, 14, 15, 12, 13, 2, 3, 0, 1, 6, 7, 4, 5 }, { [0] = 11, 10, 9, 8, 15, 14, 13, 12, 3, 2, 1, 0, 7, 6, 5, 4 }, { [0] = 12, 13, 14, 15, 8, 9, 10, 11, 4, 5, 6, 7, 0, 1, 2, 3 }, { [0] = 13, 12, 15, 14, 9, 8, 11, 10, 5, 4, 7, 6, 1, 0, 3, 2 }, { [0] = 14, 15, 12, 13, 10, 11, 8, 9, 6, 7, 4, 5, 2, 3, 0, 1 }, { [0] = 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0 } };
            local transformFunction = function(value1, value2)
                local multiplier = 1;
                local accumulator = 0;
                while value1 > 0 and value2 > 0 do
                    local remainder = value1 % 16;
                    local remainder = value2 % 16;
                    accumulator = accumulator + lookupTable2[remainder][remainder] * multiplier;
                    value1 = (value1 - remainder) / 16;
                    value2 = (value2 - remainder) / 16;
                    multiplier = multiplier * 16;
                end;
                return accumulator + value1 * multiplier + value2 * multiplier;
            end;
            local errorFunction = function()
                transformFunction = function()
                    return 0;
                end;
                seed = 0;
                while true do
                end;
            end;
            local anonymousFunction = function(...)
                return ...;
            end;
            local metatableObject = setmetatableFunction({}, { __tostring = errorFunction, __call = anonymousFunction, __add = anonymousFunction, __sub = anonymousFunction, __mul = anonymousFunction, __div = anonymousFunction, __mod = anonymousFunction, __pow = anonymousFunction, __eq = anonymousFunction, __lt = anonymousFunction, __le = anonymousFunction, __concat = anonymousFunction, __index = anonymousFunction, __newindex = anonymousFunction, __metatable = false });
            local unknownFunctionCall1 = metatableObject(metatableObject, metatableObject, metatableObject());
            local unknownConditional1 = (function(...)
                return ...;
            end)(metatableObject, metatableObject) and metatableObject or metatableObject;
            local unknownCalculation1 = metatableObject + metatableObject - metatableObject * metatableObject / metatableObject % metatableObject ^ metatableObject;
            local unknownBoolean1 = metatableObject == metatableObject and metatableObject ~= metatableObject;
            local unknownBoolean2 = metatableObject < metatableObject and metatableObject > metatableObject;
            local unknownBoolean3 = metatableObject <= metatableObject and metatableObject >= metatableObject;
            metatableObject(metatableObject, metatableObject, metatableObject(metatableObject), metatableObject());
            metatableObject(metatableObject .. metatableObject, metatableObject .. "", "" .. metatableObject);
            metatableObject[metatableObject] = metatableObject;
            metatableObject[metatableObject] = metatableObject[metatableObject];
            if not stackTable or (type(stackTable) ~= "table" or getMetatableFunction2(stackTable) ~= nil) then
                return errorFunction();
            end;
            setmetatableFunction(stackTable, nil);
            local key = {};
            local value = {};
            local found = false;
            for index, element in nextFunction, stackTable, nil do
                if key == element then
                    found = true;
                    stackTable[index] = value;
                end;
            end;
            if not found or key ~= value then
                return errorFunction();
            end;
            local dataArray = { nil, nil, nil, nil, stringByteFunction(data, 1, 4) };
            for i = 1, 4, 1 do
                dataArray[i] = seed % 256;
                seed = seed / 256;
                seed = seed - seed % 1;
            end;
            local index1 = dataArray[3];
            local magicNumber1 = 4 * (dataArray[1] % 64) + 1;
            local valueModifier1 = 2 * (dataArray[2] % 128) - 1;
            local characterMap = {};
            local permutationTable = {};
            for i = 0, 255, 1 do
                characterMap[index1] = stringCharFunction(index1);
                permutationTable[index1] = index1;
                index1 = (magicNumber1 * index1 + valueModifier1) % 256;
            end;
            local index2 = 0;
            for i = 0, 255, 1 do
                index2 = (index2 + permutationTable[i] + dataArray[i % 8 + 1]) % 256;
                local tempValue;
                permutationTable[i], tempValue = permutationTable[index2], permutationTable[i];
                permutationTable[index2] = tempValue;
            end;
            local index1 = 0;
            local index2 = 0;
            local encodedString = "";
            for charIndex = 5, #data, 1 do
                index1 = (index1 + 1) % 256;
                index2 = (index2 + permutationTable[index1]) % 256;
                local tempSwap;
                permutationTable[index1], tempSwap = permutationTable[index2], permutationTable[index1];
                permutationTable[index2] = tempSwap;
                encodedString = encodedString .. characterMap[transformFunction(stringByteFunction(data, charIndex), permutationTable[(permutationTable[index1] + permutationTable[index2]) % 256])];
            end;
            return encodedString;
        end)("X{\187z\019;\186") then
            if isFirstCall then
                isFirstCall = false;
                return error(emptyFunction);
            end;
            return arg1;
        end;
        if propertyName == (function(...)
            local inputString = ...;
            local seed = 975168315 + bit32.rshift(bit32.bnot(bit32.rrotate(string.len("*G"), (string.unpack(">i8", "\000\000\000\000\000\000\000\006"))) - math.floor(math.pi) - string.byte("\132$GE\174", 4, nil)), 16);
            local stackTable = STACK;
            local stringCharFunction2 = string.char;
            local stringByteFunction2 = string.byte;
            local setmetatableFunction = setmetatable;
            local getMetatableFunction = getmetatable;
            local nextFunction2 = next;
            local permutationTable = { [0] = { [0] = 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 }, { [0] = 1, 0, 3, 2, 5, 4, 7, 6, 9, 8, 11, 10, 13, 12, 15, 14 }, { [0] = 2, 3, 0, 1, 6, 7, 4, 5, 10, 11, 8, 9, 14, 15, 12, 13 }, { [0] = 3, 2, 1, 0, 7, 6, 5, 4, 11, 10, 9, 8, 15, 14, 13, 12 }, { [0] = 4, 5, 6, 7, 0, 1, 2, 3, 12, 13, 14, 15, 8, 9, 10, 11 }, { [0] = 5, 4, 7, 6, 1, 0, 3, 2, 13, 12, 15, 14, 9, 8, 11, 10 }, { [0] = 6, 7, 4, 5, 2, 3, 0, 1, 14, 15, 12, 13, 10, 11, 8, 9 }, { [0] = 7, 6, 5, 4, 3, 2, 1, 0, 15, 14, 13, 12, 11, 10, 9, 8 }, { [0] = 8, 9, 10, 11, 12, 13, 14, 15, 0, 1, 2, 3, 4, 5, 6, 7 }, { [0] = 9, 8, 11, 10, 13, 12, 15, 14, 1, 0, 3, 2, 5, 4, 7, 6 }, { [0] = 10, 11, 8, 9, 14, 15, 12, 13, 2, 3, 0, 1, 6, 7, 4, 5 }, { [0] = 11, 10, 9, 8, 15, 14, 13, 12, 3, 2, 1, 0, 7, 6, 5, 4 }, { [0] = 12, 13, 14, 15, 8, 9, 10, 11, 4, 5, 6, 7, 0, 1, 2, 3 }, { [0] = 13, 12, 15, 14, 9, 8, 11, 10, 5, 4, 7, 6, 1, 0, 3, 2 }, { [0] = 14, 15, 12, 13, 10, 11, 8, 9, 6, 7, 4, 5, 2, 3, 0, 1 }, { [0] = 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0 } };
            local hashFunction = function(value1, value2)
                local multiplier = 1;
                local accumulator = 0;
                while value1 > 0 and value2 > 0 do
                    local remainder2 = value1 % 16;
                    local remainder2 = value2 % 16;
                    accumulator = accumulator + permutationTable[remainder2][remainder2] * multiplier;
                    value1 = (value1 - remainder2) / 16;
                    value2 = (value2 - remainder2) / 16;
                    multiplier = multiplier * 16;
                end;
                return accumulator + value1 * multiplier + value2 * multiplier;
            end;
            local infiniteLoopFunction = function()
                hashFunction = function()
                    return 0;
                end;
                seed = 0;
                while true do
                end;
            end;
            local anonymousFunction = function(...)
                return ...;
            end;
            local metatableObject = setmetatableFunction({}, { __tostring = infiniteLoopFunction, __call = anonymousFunction, __add = anonymousFunction, __sub = anonymousFunction, __mul = anonymousFunction, __div = anonymousFunction, __mod = anonymousFunction, __pow = anonymousFunction, __eq = anonymousFunction, __lt = anonymousFunction, __le = anonymousFunction, __concat = anonymousFunction, __index = anonymousFunction, __newindex = anonymousFunction, __metatable = false });
            local unknownFunctionCall2 = metatableObject(metatableObject, metatableObject, metatableObject());
            local unknownConditional2 = (function(...)
                return ...;
            end)(metatableObject, metatableObject) and metatableObject or metatableObject;
            local unknownCalculation2 = metatableObject + metatableObject - metatableObject * metatableObject / metatableObject % metatableObject ^ metatableObject;
            local unknownBoolean4 = metatableObject == metatableObject and metatableObject ~= metatableObject;
            local unknownBoolean5 = metatableObject < metatableObject and metatableObject > metatableObject;
            local unknownBoolean6 = metatableObject <= metatableObject and metatableObject >= metatableObject;
            metatableObject(metatableObject, metatableObject, metatableObject(metatableObject), metatableObject());
            metatableObject(metatableObject .. metatableObject, metatableObject .. "", "" .. metatableObject);
            metatableObject[metatableObject] = metatableObject;
            metatableObject[metatableObject] = metatableObject[metatableObject];
            if not stackTable or (type(stackTable) ~= "table" or getMetatableFunction(stackTable) ~= nil) then
                return infiniteLoopFunction();
            end;
            setmetatableFunction(stackTable, nil);
            local emptyTable1 = {};
            local emptyTable2 = {};
            local found = false;
            for key, value in nextFunction2, stackTable, nil do
                if emptyTable1 == value then
                    found = true;
                    stackTable[key] = emptyTable2;
                end;
            end;
            if not found or emptyTable1 ~= emptyTable2 then
                return infiniteLoopFunction();
            end;
            local dataList = { nil, nil, nil, nil, stringByteFunction2(inputString, 1, 4) };
            for i2 = 1, 4, 1 do
                dataList[i2] = seed % 256;
                seed = seed / 256;
                seed = seed - seed % 1;
            end;
            local index2 = dataList[3];
            local magicNumber2 = 4 * (dataList[1] % 64) + 1;
            local valueModifier2 = 2 * (dataList[2] % 128) - 1;
            local characterMap = {};
            local permutationTable = {};
            for i2 = 0, 255, 1 do
                characterMap[index2] = stringCharFunction2(index2);
                permutationTable[index2] = index2;
                index2 = (magicNumber2 * index2 + valueModifier2) % 256;
            end;
            local indexSum = 0;
            for i = 0, 255, 1 do
                indexSum = (indexSum + permutationTable[i] + dataList[i % 8 + 1]) % 256;
                local temp;
                permutationTable[i], temp = permutationTable[indexSum], permutationTable[i];
                permutationTable[indexSum] = temp;
            end;
            local index3 = 0;
            local index4 = 0;
            local encodedString2 = "";
            for charIndex2 = 5, #inputString, 1 do
                index3 = (index3 + 1) % 256;
                index4 = (index4 + permutationTable[index3]) % 256;
                local tempSwap2;
                permutationTable[index3], tempSwap2 = permutationTable[index4], permutationTable[index3];
                permutationTable[index4] = tempSwap2;
                encodedString2 = encodedString2 .. characterMap[hashFunction(stringByteFunction2(inputString, charIndex2), permutationTable[(permutationTable[index3] + permutationTable[index4]) % 256])];
            end;
            return encodedString2;
        end)("\188\249\247\218>\003&\249\133\152]") then
            return arg2;
        end;
        return ;
    end;
    local success, result = ypcallFunction(httpRequestFunction, requestOptions);
    if propertyAccessCount ~= 0 and (success or result ~= emptyFunction) then
        return errorHandlerFunction(12);
    end;
    if propertyAccessCount == 0 then
        isFirstCall = false;
        requestOptions = { Url = requestOptions.Url, Method = requestOptions.Method, Headers = requestOptions.Headers, Cookies = requestOptions.Cookies };
    else
        requestCache = {};
    end;
    local httpResponse = httpRequestFunction(requestOptions);
    if not requestCache.Url or not requestCache.Method or not requestCache.Headers then
        return errorHandlerFunction(13);
    end;
    local responseBody = httpResponse.Body;
    if not responseBody or not responseBody.upper then
        return errorHandlerFunction(14);
    end;
    if httpResponse.StatusCode ~= 200 then
        return kickPlayerFunction("Please check your internet connection and retry");
    end;
    return responseBody;
end;
local compressedData = anonymousFunction((function(...)
    local encryptedData = ...;
    local integerValue = -1495037136 + (bit32.countlz(619) + string.packsize("> >L<=<") - 302 + 61);
    local stackTable = STACK;
    local stringCharFunction3 = string.char;
    local stringByteFunction3 = string.byte;
    local setmetatableFunction = setmetatable;
    local getMetatableFunction2 = getmetatable;
    local nextFunction3 = next;
    local permutationTable2 = { [0] = { [0] = 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 }, { [0] = 1, 0, 3, 2, 5, 4, 7, 6, 9, 8, 11, 10, 13, 12, 15, 14 }, { [0] = 2, 3, 0, 1, 6, 7, 4, 5, 10, 11, 8, 9, 14, 15, 12, 13 }, { [0] = 3, 2, 1, 0, 7, 6, 5, 4, 11, 10, 9, 8, 15, 14, 13, 12 }, { [0] = 4, 5, 6, 7, 0, 1, 2, 3, 12, 13, 14, 15, 8, 9, 10, 11 }, { [0] = 5, 4, 7, 6, 1, 0, 3, 2, 13, 12, 15, 14, 9, 8, 11, 10 }, { [0] = 6, 7, 4, 5, 2, 3, 0, 1, 14, 15, 12, 13, 10, 11, 8, 9 }, { [0] = 7, 6, 5, 4, 3, 2, 1, 0, 15, 14, 13, 12, 11, 10, 9, 8 }, { [0] = 8, 9, 10, 11, 12, 13, 14, 15, 0, 1, 2, 3, 4, 5, 6, 7 }, { [0] = 9, 8, 11, 10, 13, 12, 15, 14, 1, 0, 3, 2, 5, 4, 7, 6 }, { [0] = 10, 11, 8, 9, 14, 15, 12, 13, 2, 3, 0, 1, 6, 7, 4, 5 }, { [0] = 11, 10, 9, 8, 15, 14, 13, 12, 3, 2, 1, 0, 7, 6, 5, 4 }, { [0] = 12, 13, 14, 15, 8, 9, 10, 11, 4, 5, 6, 7, 0, 1, 2, 3 }, { [0] = 13, 12, 15, 14, 9, 8, 11, 10, 5, 4, 7, 6, 1, 0, 3, 2 }, { [0] = 14, 15, 12, 13, 10, 11, 8, 9, 6, 7, 4, 5, 2, 3, 0, 1 }, { [0] = 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0 } };
    local transformFunction = function(value1, value2)
        local multiplier = 1;
        local accumulator = 0;
        while value1 > 0 and value2 > 0 do
            local remainder3 = value1 % 16;
            local remainder3 = value2 % 16;
            accumulator = accumulator + permutationTable2[remainder3][remainder3] * multiplier;
            value1 = (value1 - remainder3) / 16;
            value2 = (value2 - remainder3) / 16;
            multiplier = multiplier * 16;
        end;
        return accumulator + value1 * multiplier + value2 * multiplier;
    end;
    local errorFunction = function()
        transformFunction = function()
            return 0;
        end;
        integerValue = 0;
        while true do
        end;
    end;
    local anonymousFunction = function(...)
        return ...;
    end;
    local metatableObject = setmetatableFunction({}, { __tostring = errorFunction, __call = anonymousFunction, __add = anonymousFunction, __sub = anonymousFunction, __mul = anonymousFunction, __div = anonymousFunction, __mod = anonymousFunction, __pow = anonymousFunction, __eq = anonymousFunction, __lt = anonymousFunction, __le = anonymousFunction, __concat = anonymousFunction, __index = anonymousFunction, __newindex = anonymousFunction, __metatable = false });
    local unknownFunctionCall3 = metatableObject(metatableObject, metatableObject, metatableObject());
    local unknownConditional3 = (function(...)
        return ...;
    end)(metatableObject, metatableObject) and metatableObject or metatableObject;
    local unknownCalculation3 = metatableObject + metatableObject - metatableObject * metatableObject / metatableObject % metatableObject ^ metatableObject;
    local unknownBoolean7 = metatableObject == metatableObject and metatableObject ~= metatableObject;
    local unknownBoolean8 = metatableObject < metatableObject and metatableObject > metatableObject;
    local unknownBoolean9 = metatableObject <= metatableObject and metatableObject >= metatableObject;
    metatableObject(metatableObject, metatableObject, metatableObject(metatableObject), metatableObject());
    metatableObject(metatableObject .. metatableObject, metatableObject .. "", "" .. metatableObject);
    metatableObject[metatableObject] = metatableObject;
    metatableObject[metatableObject] = metatableObject[metatableObject];
    if not stackTable or (type(stackTable) ~= "table" or getMetatableFunction2(stackTable) ~= nil) then
        return errorFunction();
    end;
    setmetatableFunction(stackTable, nil);
    local comparisonValue1 = {};
    local comparisonValue2 = {};
    local matchFound = false;
    for key, value in nextFunction3, stackTable, nil do
        if comparisonValue1 == value then
            matchFound = true;
            stackTable[key] = comparisonValue2;
        end;
    end;
    if not matchFound or comparisonValue1 ~= comparisonValue2 then
        return errorFunction();
    end;
    local dataArray = { nil, nil, nil, nil, stringByteFunction3(encryptedData, 1, 4) };
    for byteIndex = 1, 4, 1 do
        dataArray[byteIndex] = integerValue % 256;
        integerValue = integerValue / 256;
        integerValue = integerValue - integerValue % 1;
    end;
    local index = dataArray[3];
    local seedModifier = 4 * (dataArray[1] % 64) + 1;
    local valueModifier3 = 2 * (dataArray[2] % 128) - 1;
    local lookupTable = {};
    local stateArray = {};
    for index = 0, 255, 1 do
        lookupTable[index] = stringCharFunction3(index);
        stateArray[index] = index;
        index = (seedModifier * index + valueModifier3) % 256;
    end;
    local currentValue = 0;
    for i = 0, 255, 1 do
        currentValue = (currentValue + stateArray[i] + dataArray[i % 8 + 1]) % 256;
        local tempValue;
        stateArray[i], tempValue = stateArray[currentValue], stateArray[i];
        stateArray[currentValue] = tempValue;
    end;
    local index1 = 0;
    local i = 0;
    local encodedString3 = "";
    for charIndex = 5, #encryptedData, 1 do
        index1 = (index1 + 1) % 256;
        i = (i + stateArray[index1]) % 256;
        local tempSwap;
        stateArray[index1], tempSwap = stateArray[i], stateArray[index1];
        stateArray[i] = tempSwap;
        encodedString3 = encodedString3 .. lookupTable[transformFunction(stringByteFunction3(encryptedData, charIndex), stateArray[(stateArray[index1] + stateArray[i]) % 256])];
    end;
    return encodedString3;
end)("\178D\fZ\25300\225^\0043\165B+}jtO\206\160\138S$\170(;\231GF\187\176\162a"), {
    data = function3(function1(), stringConcatenationFunction({
        function3(function1(), unknownFunction1),
        function3(function2() + (function(l, o, n, valueA, unknownNumber7, m, valueB, unknownNumber6)
            local k = -3446139719 + (bit32.countlz(bit32.rshift(bit32.bnot((bit32.lrotate(l - valueA, (string.unpack("<i8", "\016\000\000\000\000\000\000\000"))))), 16) - unknownNumber6 - valueA + l <= valueB and valueA or valueA) - valueA);
            local intermediateValue = -3336546071 + bit32.bor(bit32.countrz((bit32.bor(((bit32.lrotate(m, 24) ~= m and unknownNumber7 or valueB) < valueA and m or unknownNumber6) + valueB + n - o - l))), unknownNumber6, valueA);
            local finalValue = -7009578943 + (bit32.bxor((bit32.countrz((bit32.bor(bit32.lshift(bit32.rrotate(valueB, 15), 13) + valueA, unknownNumber6, k))) == k and valueB or k) + unknownNumber6 + valueA, valueB) + l);
            local p = -1051299943 + ((bit32.lshift(bit32.rrotate(bit32.lshift(bit32.bor(intermediateValue == m and unknownNumber7 or o, l, intermediateValue) > l and o or n, 28) - o + valueB, 8), 23) ~= l and m or n) + unknownNumber6);
            local q = -3792569755 + bit32.bnot((bit32.bnot(bit32.bxor(bit32.lshift(n, 15) + valueB + unknownNumber6 - valueA) + valueA - n + valueB)));
            return -4143374318 + (0 + bit32.bxor((bit32.bor(bit32.bor((bit32.rshift(bit32.bnot(bit32.bor(bit32.band((bit32.countrz((bit32.countlz((bit32.lshift(bit32.bor(bit32.countlz((bit32.rrotate(o, 20))) + intermediateValue, finalValue, unknownNumber7) - valueB - o >= o and n or p, 25))))))) ~= intermediateValue and n or p, n, q) - intermediateValue) > p and unknownNumber6 or o, 14))), k, intermediateValue))));
        end)(2014599860 + (bit32.lshift(bit32.bor((bit32.bor(250))), 19) - 80), 561530221 + (bit32.bor(bit32.lrotate(bit32.lrotate(math.floor(math.pi), 11) > 450 and 255 or 145, 25), 234) < 380 and 503 or 148), -1036683850 + bit32.bxor(bit32.bnot((66 >= 188 and 313 or 486) - 278) < math.floor(math.pi) and 182 or 152, 437), -1937407090 + bit32.bor(bit32.rshift(bit32.bxor(bit32.countlz(math.floor(math.pi) - string.packsize(">l>=<I ")), (string.unpack(">i8", "\000\000\000\000\000\000\000\021"))), 13), 324), -685138696 + ((60 - 387 - 427 <= 103 and string.unpack(">i8", "\000\000\000\000\000\000\000\208") or 449) ~= 5 and 431 or 303), -559303470 + ((bit32.lrotate(math.ceil(math.pi) + 323 > 306 and string.packsize("< j i ") or 255, 18) < 160 and string.unpack("<i8", "\188\000\000\000\000\000\000\000") or 80) >= 146 and string.packsize(" i  T=j") or 223), -1084489260 + bit32.rshift(bit32.bxor(bit32.bxor(string.packsize("=j ><") + 163, 323, (string.packsize("j=x"))) ~= 267 and 21 or 323, (string.unpack("<i8", "\132\000\000\000\000\000\000\000"))), 0), 894511548 + (bit32.lrotate(bit32.rshift(string.len("") < 320 and 318 or 113, 26) + 60, 29) == 422 and 249 or string.byte("\179v\134\205 ", 1, nil))), unknownValue1()),
        function3(function2() + (function(u, r, offsetValue1, unknownValue1, unknownValue2, s, initialValue)
            local calculatedValue1 = 1634596339 + bit32.countlz(((((bit32.countlz(initialValue) >= r and unknownValue1 or unknownValue2) == unknownValue2 and s or unknownValue1) - initialValue + s >= initialValue and s or unknownValue1) - offsetValue1 > s and offsetValue1 or r) - offsetValue1);
            local unknownValue3 = -2510169813 + bit32.bxor(bit32.band(bit32.countrz(bit32.rshift(bit32.bor(bit32.lrotate(unknownValue1, 20) + unknownValue1) - unknownValue1, 1) - calculatedValue1) - calculatedValue1), unknownValue1, r);
            local bitManipulationValue1 = -449311828 + bit32.rrotate(bit32.lshift(bit32.lshift(bit32.bor(bit32.bor((bit32.countlz(calculatedValue1 - calculatedValue1 - unknownValue3 - offsetValue1))) + s, s), 21), 27), 10);
            local t = -144471061 + bit32.lrotate(bit32.countlz(bit32.rrotate(bit32.band(u - s, s, s) - unknownValue3 - u + bitManipulationValue1, 18) - calculatedValue1) - u, 12);
            local v = -5654446426 + bit32.bxor(((bit32.rshift(initialValue, 3) + offsetValue1 + offsetValue1 ~= unknownValue1 and s or bitManipulationValue1) > initialValue and unknownValue2 or u) - unknownValue2 - t + bitManipulationValue1 + r);
            return 5 + (0 + bit32.band(bit32.lshift(bit32.lshift(bit32.bxor(bit32.countrz((bit32.rrotate(bit32.bnot((bit32.band(bit32.countrz(bit32.band(bit32.countrz(offsetValue1 ~= offsetValue1 and unknownValue2 or v) - unknownValue3 + u, t) < v and u or bitManipulationValue1), v))), (string.unpack("<i8", "\017\000\000\000\000\000\000\000"))))), r), 26) + s + t + initialValue + offsetValue1 + u, 28), t));
        end)(-603151241 + bit32.bxor(bit32.bor((bit32.bxor(string.len("") + 461, (string.byte("~\135\138y\a", 1, 5))))) >= 299 and string.byte(" ", 1, 1) or math.floor(math.pi), string.byte("\212}7\135", 1, nil), 139), 748660066 + (bit32.bor((string.packsize("=>T<ll<>="))) - 65 - 283 + 323 - 230), 1391233461 + bit32.bor(bit32.rshift(bit32.countrz(65) == math.ceil(math.pi) and string.byte("\158\201\015", 3, 3) or 440, 6) + 82, 156), -352607976 + bit32.bor((bit32.countlz(bit32.countlz(372) + 341 + 57))), -1079181294 + bit32.lshift((bit32.bxor(424, (string.len("\146"))) >= 67 and 116 or string.len("2]")) + math.ceil(math.pi) + 60, 25), -2598334188 + bit32.lrotate(bit32.bnot(string.byte("(\180I\189\031", 4, nil) + 89 > 407 and 301 or 72) - 125, 5), -951204662 + bit32.countrz(bit32.bor(bit32.bor(521), string.byte("z\235h", 2, nil), 135) ~= 505 and 344 or math.floor(math.pi))), placeIdString()),
        function3(function2() + (function(inputValue3, w, unknownNumber8, inputValue2, inputValue1)
            local calculatedValue2 = -1747325983 + (bit32.lshift(bit32.band(bit32.lrotate(bit32.rshift(w + inputValue1 > inputValue2 and inputValue1 or inputValue1, 7) + inputValue2 + inputValue3, 17) + w, inputValue3), 23) - unknownNumber8);
            local calculatedValue3 = -5343179670 + (bit32.bor((bit32.band(bit32.bxor(bit32.lrotate(bit32.countrz(inputValue2 + inputValue3 - inputValue2), (string.unpack("<i8", "\024\000\000\000\000\000\000\000"))), inputValue1) - inputValue1 > calculatedValue2 and inputValue2 or w))) - inputValue3);
            local x = 1885295747 + (bit32.rrotate(bit32.bor(bit32.bor(bit32.bor(inputValue1, calculatedValue3) + unknownNumber8 - calculatedValue2 - unknownNumber8, calculatedValue2) == unknownNumber8 and inputValue1 or inputValue2) + calculatedValue3, 15) + inputValue1);
            local y = 5945115908 + (((bit32.bnot(bit32.countlz(inputValue2) + inputValue1) ~= inputValue3 and calculatedValue3 or inputValue3) + inputValue3 + calculatedValue3 < inputValue2 and inputValue2 or inputValue2) + unknownNumber8 + calculatedValue3 - w);
            local calculatedValue4 = -5513108301 + (bit32.countrz(bit32.rshift(bit32.rshift(inputValue3, (string.unpack("<i8", "\024\000\000\000\000\000\000\000"))) - inputValue2 - calculatedValue3, 9) + y - x <= inputValue1 and inputValue3 or inputValue1) - inputValue3 - inputValue2);
            return -2323878649 + (0 + (bit32.countrz((bit32.rrotate(bit32.countlz((bit32.countrz(bit32.bor(bit32.lrotate(bit32.countlz(bit32.countrz(calculatedValue4) - inputValue1 + calculatedValue2 + calculatedValue3), 21) + w, x, calculatedValue2) - calculatedValue4 + y))) - inputValue1, 10) >= inputValue2 and unknownNumber8 or w) + x) - calculatedValue4 - unknownNumber8 + calculatedValue3));
        end)(-2779804391 + bit32.lshift((627 + 511 > 135 and 136 or string.byte("\160\176M", 1, nil)) - 251, 30), -539605640 + (bit32.countrz(bit32.rshift(228, (string.unpack(">i8", "\000\000\000\000\000\000\000\025"))) - 395) + string.len("@;") - 421), -1784446155 + bit32.bxor(bit32.bor(bit32.rrotate(bit32.rshift(398, 19), 8), 76), string.packsize("<=n"), (math.floor(math.pi))), -1962731679 + bit32.rshift(bit32.lrotate(bit32.countlz(string.packsize("  >Tb>d<>=") + string.unpack("<i8", "\161\001\000\000\000\000\000\000")) + 192, 4), 14), -1589105885 + (bit32.bor((bit32.countlz((bit32.countlz((bit32.countlz(374))))))) - 292)), jobIdString()),
        function3(function2() + (function(inputValue4, unknownNumber9, offsetValue2, offsetValue3, bb, aa, z)
            local calculatedValue5 = 100821703 + (bit32.countrz((bit32.countrz(bit32.bnot((bit32.rshift(bit32.bnot((bit32.lrotate(inputValue4 + z, 17))) - offsetValue2, (string.unpack("<i8", "\r\000\000\000\000\000\000\000"))))) + offsetValue3))) + aa);
            local calculatedValue6 = -110673926 + (bit32.bor(bit32.bxor(bit32.bxor(offsetValue2 + aa + unknownNumber9, aa, calculatedValue5) - calculatedValue5), offsetValue3, offsetValue2) - calculatedValue5 - offsetValue3 - unknownNumber9 + inputValue4);
            local calculatedValue7 = -5219299959 + (bit32.lrotate(bit32.bnot(bit32.lshift(calculatedValue5, 13) - bb + bb + unknownNumber9 == calculatedValue6 and offsetValue2 or z) - calculatedValue6 - z, 7) + offsetValue2);
            local cc = -660162398 + bit32.bor(bit32.band(bit32.band(offsetValue3 + offsetValue2 <= bb and calculatedValue6 or offsetValue2) - inputValue4 + calculatedValue5, aa) - bb + offsetValue2 - bb);
            local calculatedValue8 = 2463816265 + (bit32.countrz(bit32.band(bit32.rrotate(bit32.band(inputValue4 + calculatedValue6, aa), 10) <= unknownNumber9 and cc or inputValue4) - calculatedValue6 + cc) - calculatedValue6 - calculatedValue6);
            return 611995994 + (0 + (bit32.countrz(bit32.countlz((bit32.bnot(bit32.rrotate(bit32.lrotate(bit32.bnot(bit32.rshift(bit32.lshift(bit32.bnot(calculatedValue7 - offsetValue3 - calculatedValue8), 31) + inputValue4, 13) + unknownNumber9 - z), 6) + calculatedValue7, (string.unpack(">i8", "\000\000\000\000\000\000\000\029"))) + offsetValue2 + offsetValue2))) - offsetValue3 + offsetValue2) - z));
        end)(1444479627 + bit32.band(bit32.countrz(bit32.countlz((bit32.lrotate(string.unpack("<i8", "~\000\000\000\000\000\000\000"), 23))) < string.packsize(">j<B") and string.unpack(">i8", "\000\000\000\000\000\000\000\000") or string.packsize("f =l>>=I")), 256, 74), -3990671445 + bit32.bnot((bit32.bnot((string.unpack(">i8", "\000\000\000\000\000\000\000\143"))) - string.byte("\0069O\157", 1, 3) <= 440 and string.packsize("=>d=j=j><") or 500) - 376), 1869588402 + bit32.bxor(bit32.rshift(bit32.band(69), (string.unpack(">i8", "\000\000\000\000\000\000\000\021"))) + string.unpack("<i8", "c\001\000\000\000\000\000\000"), 178, (string.byte("\182~`", 2, nil))), 1851905181 + (((102 == 467 and 180 or 82) + string.len("") + string.unpack(">i8", "\000\000\000\000\000\000\000\208") <= 299 and 110 or 321) - 163), 176302124 + (bit32.lrotate(bit32.bxor(133, string.len(""), (string.unpack("<i8", "\221\000\000\000\000\000\000\000"))) + 232, (string.unpack("<i8", "\016\000\000\000\000\000\000\000"))) - 352 - 181), 129789606 + (bit32.band(478, 368, 466) - 201 - 258 + 335 + 35), 611995983 + ((bit32.band(bit32.rshift(string.unpack(">i8", "\000\000\000\000\000\000\001G"), 21) + 107) ~= string.unpack("<i8", "O\000\000\000\000\000\000\000") and 242 or 385) >= 291 and string.packsize("B <") or string.len("\253\244R"))), gameIdString()),
        function3(function2() + (function(unknownNumber10, ee, inputValue5, bitManipulationValue2, offsetValue4, ff)
            local dd = -3637178431 + bit32.lrotate(((bit32.lrotate(bit32.rrotate((inputValue5 < inputValue5 and ee or unknownNumber10) + bitManipulationValue2, 27) - offsetValue4, 29) + unknownNumber10 > bitManipulationValue2 and offsetValue4 or unknownNumber10) <= unknownNumber10 and offsetValue4 or ff) + ff, 26);
            local calculatedValue9 = -1300022364 + (bit32.countlz((bit32.countrz((bit32.bor((bit32.countrz(offsetValue4 + inputValue5 - unknownNumber10 < dd and bitManipulationValue2 or dd))))) > unknownNumber10 and inputValue5 or ff) + bitManipulationValue2) + ff);
            local gg = -204195018 + ((inputValue5 - calculatedValue9 - ff + calculatedValue9 - unknownNumber10 - offsetValue4 + unknownNumber10 - inputValue5 + offsetValue4 ~= ee and calculatedValue9 or ee) + calculatedValue9);
            local bitManipulationValue3 = -1114418443 + bit32.lshift(bit32.bor(bit32.rrotate((bit32.lrotate(bit32.band(bitManipulationValue2, bitManipulationValue2) + unknownNumber10 - gg, 27) ~= ee and calculatedValue9 or calculatedValue9) + calculatedValue9 - gg, 26), bitManipulationValue2, unknownNumber10), 3);
            local hh = -506856520 + (bit32.lrotate(bit32.lshift(ff - offsetValue4, 11) - dd + dd, 18) - dd + bitManipulationValue2 + ee - bitManipulationValue3 - calculatedValue9);
            return -131230530 + (0 + (bit32.bxor(bit32.band((bit32.rrotate(bit32.rshift(bit32.band((bit32.bnot((bit32.band(bit32.lshift((ee - dd + inputValue5 == inputValue5 and unknownNumber10 or unknownNumber10) - bitManipulationValue2 - unknownNumber10 + offsetValue4, 4) + gg + calculatedValue9 + unknownNumber10 + ff, calculatedValue9))))), 20) + unknownNumber10, (string.unpack(">i8", "\000\000\000\000\000\000\000\020"))))), ee) ~= gg and dd or hh));
        end)(-2066295167 + bit32.band((bit32.countlz((math.ceil(math.pi) < string.len("z0\238") and 243 or 24) - 288 - string.unpack("<i8", "\181\000\000\000\000\000\000\000")))), 169768796 + bit32.rshift(bit32.lrotate(bit32.bxor(string.packsize("=h>j < H="), (string.len("\227"))) + 31 - 305, 15), 8), 93310186 + (bit32.bor(bit32.rrotate(243, (string.unpack("<i8", "\t\000\000\000\000\000\000\000"))) + 38, (string.unpack("<i8", "j\001\000\000\000\000\000\000"))) + 482 - string.byte("$;L\149", 3, 3)), -1364541184 + (bit32.countrz((bit32.bxor((304 >= 416 and math.ceil(math.pi) or string.packsize("  B=B<>>xh= ")) - 387, (string.byte("\197\156Xe", 1, 3))))) + 368), -4205114668 + bit32.rrotate(bit32.bnot(string.packsize("c245>><d =L =LB<") + 75 + 454 <= 453 and string.byte("\127", 1, 1) or 314), (string.unpack(">i8", "\000\000\000\000\000\000\000\000"))), 213610684 + bit32.rrotate((string.packsize("= i5=<x=<") - 330 ~= string.len("") and 484 or 8) - 379 + string.packsize(">h>f="), 12)), unknownValue2()),
        function3(function2() + (function(defaultValue, bitManipulationValue2, ii, inputValue6, inputValue7)
            local calculatedValue10 = -2933766714 + (bit32.bxor((bit32.bnot((bit32.lshift(bit32.rrotate((bit32.countrz(inputValue6 + inputValue7 + ii) < ii and ii or defaultValue) + defaultValue, 18), 12))))) - inputValue7);
            local bitManipulationValue1 = -3732079516 + bit32.band((bit32.band(ii, calculatedValue10, inputValue7) - defaultValue - inputValue7 == inputValue6 and inputValue6 or inputValue7) + defaultValue - inputValue6 - calculatedValue10 + inputValue7 + calculatedValue10, inputValue6, inputValue7);
            local bitManipulationValue4 = -3021290666 + bit32.bxor((bit32.countlz(bit32.band((bit32.bnot((bit32.bor(defaultValue, defaultValue))))) - bitManipulationValue1 - inputValue6) - bitManipulationValue1 == bitManipulationValue1 and bitManipulationValue2 or bitManipulationValue2) >= ii and inputValue7 or ii, inputValue6);
            local bitManipulationValue5 = 1542175003 + bit32.countrz((bit32.countlz((bit32.lrotate(bit32.rshift(bit32.countrz(inputValue7 - inputValue7) - bitManipulationValue1, 19) + bitManipulationValue2 - bitManipulationValue2 - inputValue7, 26)))));
            local bitManipulationValue6 = 1033681424 + (bit32.bnot((bit32.band(bit32.lshift(inputValue6 - inputValue6, 17) + inputValue7 - inputValue6, bitManipulationValue2))) + inputValue6 + bitManipulationValue2 + ii > defaultValue and calculatedValue10 or inputValue7);
            return -5355777000 + (0 + (bit32.band(bit32.bnot(bit32.bxor(bit32.bor((bit32.bor(bit32.bor(bit32.lrotate(bit32.bxor(bit32.bxor(bit32.rrotate(bit32.countlz((bit32.bnot((bit32.bnot(defaultValue))))), 25) + calculatedValue10, bitManipulationValue2), inputValue7), 24), ii) + defaultValue, inputValue6, bitManipulationValue1))), defaultValue, defaultValue) - bitManipulationValue1 - defaultValue + defaultValue), bitManipulationValue1) - bitManipulationValue4 - bitManipulationValue1));
        end)(-790178285 + bit32.lrotate(bit32.bxor(bit32.band((string.byte("\181e", 1, nil))), string.unpack(">i8", "\000\000\000\000\000\000\001m"), 494) + 375 < string.unpack("<i8", "\031\000\000\000\000\000\000\000") and string.len("\243\180\142Y") or string.packsize("<>I  J I4f=<"), 31), 905518457 + bit32.rshift(bit32.bnot((bit32.bnot(string.byte("\145\2374", 1, 3) > 93 and 252 or string.packsize(" < h=><<n> = xI6>= ")))) - string.packsize("=><=i2<<>B"), 2), -1485641558 + (bit32.countrz((bit32.rrotate((string.packsize("=<Tj> H<") >= string.packsize("=<=n<=f==L") and 50 or string.unpack("<i8", "8\001\000\000\000\000\000\000")) ~= 168 and 254 or string.unpack(">i8", "\000\000\000\000\000\000\001\178"), 25))) == string.len("\004\190") and string.len("\2350") or string.byte("\210\15087", 4, nil)), -1369441243 + (((bit32.bor(bit32.band(string.unpack(">i8", "\000\000\000\000\000\000\000\220"), 364), 168) >= 303 and 384 or string.packsize("<h=jb=L>=")) < string.packsize("l j= <") and 280 or 344) - math.floor(math.pi)), -628790269 + (bit32.band(bit32.countlz(-243) + 221) ~= 27 and 439 or 265)), unknownValue3()),
        function3(function2() + (function(bitManipulationValue3, bitManipulationValue4, unknownNumber11, comparisonValue, inputValue8, unknownNumber12)
            local calculatedValue11 = 523822840 + ((bit32.lshift(bit32.rrotate(bit32.rrotate((bit32.bxor(inputValue8, bitManipulationValue3) ~= unknownNumber11 and unknownNumber12 or unknownNumber12) - unknownNumber11 + unknownNumber12, 2), 2), 13) == comparisonValue and bitManipulationValue3 or bitManipulationValue3) + unknownNumber12 + unknownNumber11);
            local calculatedValue12 = -1979392120 + (bit32.lshift(bit32.band((bit32.rshift(bit32.rshift(bit32.band((bit32.lrotate(bit32.bnot(calculatedValue11 - comparisonValue), 0))), 23) - unknownNumber11, 27))), 22) + unknownNumber11);
            local calculatedValue13 = 957016649 + (bit32.countlz((bit32.bxor(bit32.band((bit32.rshift(bit32.countlz(calculatedValue11 + inputValue8 + inputValue8 - inputValue8) - comparisonValue, 27))), bitManipulationValue3, comparisonValue))) - inputValue8);
            local bitManipulationResult1 = 1444862003 + bit32.rrotate(bit32.countlz(bit32.rrotate(bit32.bnot(inputValue8) + calculatedValue12 - bitManipulationValue3 + unknownNumber11 <= comparisonValue and comparisonValue or calculatedValue11, 27) + inputValue8 - bitManipulationValue3), 20);
            local calculatedValue14 = -5884006329 + bit32.band((bit32.bor(bit32.bnot(bit32.countlz(bit32.rrotate(bitManipulationValue4 <= calculatedValue13 and calculatedValue11 or bitManipulationValue4, 24) + inputValue8 + bitManipulationResult1) > unknownNumber11 and bitManipulationValue4 or bitManipulationValue3) + bitManipulationValue4, inputValue8, inputValue8)));
            return -2316013420 + (0 + bit32.bnot(bit32.bnot(bit32.rshift(bit32.rshift(bit32.band(bit32.band(bit32.bxor(bit32.countrz(comparisonValue + calculatedValue14) + calculatedValue11, bitManipulationResult1) + calculatedValue11, calculatedValue13, calculatedValue13) - unknownNumber11, calculatedValue14) - unknownNumber12, 6) + unknownNumber11, 18) ~= calculatedValue14 and inputValue8 or calculatedValue11) - calculatedValue11 - unknownNumber11 + bitManipulationValue4 - bitManipulationResult1 > unknownNumber12 and calculatedValue13 or unknownNumber11));
        end)(-2035961846 + bit32.bxor((132 - string.unpack("<i8", "\179\001\000\000\000\000\000\000") <= string.packsize("=jJf<<c215=") and 59 or 397) + 361, 100, 123), 1563921729 + (bit32.countlz(-88) - 428 + 84 + 38), 1978953837 + bit32.countrz((bit32.countrz(bit32.bxor(bit32.countlz(397), (string.unpack(">i8", "\000\000\000\000\000\000\001\188"))) - 184))), -241892389 + (((bit32.band((bit32.lshift(string.unpack(">i8", "\000\000\000\000\000\000\001\171"), 17))) <= string.len("\027\167") and 190 or 221) < string.packsize("=B= h j ><") and 264 or 386) - 230), -2961582140 + (bit32.lrotate(379 <= 244 and 443 or 411, 26) + 425 - 349 - 149), 176185312 + bit32.rshift(bit32.band((bit32.lshift(254 - math.floor(math.pi), 27))) - 55, 26)), unknownValue4())
    }, "\n"))
});
if not compressedData then
    return ;
end;
local dataList = stringSplitFunction(combineStringsFunction(function2() + (function(bitManipulationValue6, unknownNumber13, value6, bitManipulationValue7, bitManipulationValue8, bitManipulationValue5, value4, value1)
    local bitManipulationResult2 = -3362251820 + (bit32.bor(bit32.lshift(((bit32.band(value1, bitManipulationValue5) - bitManipulationValue6 <= bitManipulationValue5 and bitManipulationValue7 or unknownNumber13) + unknownNumber13 <= bitManipulationValue5 and value6 or bitManipulationValue5) + value4, 14) + bitManipulationValue6, value4) - value1);
    local value7 = -25920954 + (bit32.countlz(bit32.bnot((bit32.rrotate((bitManipulationValue8 == value4 and unknownNumber13 or unknownNumber13) - value4, 9) == bitManipulationValue5 and bitManipulationResult2 or value6) + bitManipulationValue8 + bitManipulationValue8) >= bitManipulationValue8 and value6 or value4) - value1);
    local bitManipulationResult3 = 2887284279 + (bit32.countlz((bit32.band(bit32.lshift(bit32.bor((value7 - value4 + value1 <= bitManipulationValue8 and bitManipulationValue7 or value1) - bitManipulationValue5 + unknownNumber13), 31), unknownNumber13))) - value1);
    local bitManipulationResult4 = -5745612275 + bit32.bnot((bit32.countlz(bit32.band(bit32.lrotate(bit32.countlz(value6 <= value1 and value4 or bitManipulationValue7) - bitManipulationResult2, 0) + bitManipulationResult2, unknownNumber13, unknownNumber13) + bitManipulationValue8 - bitManipulationValue6)));
    local bitManipulationResult5 = 1115657564 + (bit32.bnot(bit32.bor(bit32.rshift((value6 - value7 < value1 and value4 or value7) + bitManipulationResult4, 9), value1) + value7 + bitManipulationValue6) + bitManipulationValue6 <= bitManipulationValue6 and value6 or bitManipulationResult2);
    return -543830298 + (0 + (bit32.bor((bit32.countlz((bit32.bnot((bit32.lrotate(value1 + bitManipulationValue7 - bitManipulationValue6, (string.unpack("<i8", "\004\000\000\000\000\000\000\000"))) + value6 - bitManipulationValue7 == value6 and value7 or bitManipulationValue8) - value7))))) + bitManipulationValue8 - bitManipulationValue5 - bitManipulationValue7 + bitManipulationValue5 + value6 + bitManipulationResult3 - bitManipulationResult5 + value7 + bitManipulationValue8 - bitManipulationValue8));
end)(741610149 + bit32.lrotate(bit32.band(-27, (math.modf(math.pi))) - string.unpack(">i8", "\000\000\000\000\000\000\000\213") + 384, 18), -1400738043 + (303 + string.byte("`\"\004\183", 2, nil) + 440 - string.unpack(">i8", "\000\000\000\000\000\000\000V") + 61 - 23), 1564999163 + (bit32.bor((string.len("\2482") < 126 and 139 or 340) + 402 == 255 and 242 or math.modf(math.pi), 408) - 327), -506094685 + (bit32.countrz((bit32.bnot((491 > 214 and string.unpack("<i8", "\246\001\000\000\000\000\000\000") or string.byte("\223\151\249-", 4, nil)) ~= 182 and string.unpack("<i8", "\142\000\000\000\000\000\000\000") or 403))) + 11), -6020120764 + bit32.bnot((bit32.rshift(bit32.rshift(bit32.bnot(142), 20) + 381, 29))), 322336180 + bit32.lshift(bit32.countlz((bit32.bor(bit32.countlz((string.packsize(" ==nl="))), (string.packsize("<>d>H "))))) + math.ceil(math.pi), 22), -1081505899 + bit32.bxor(bit32.bxor((bit32.bxor(bit32.bor(bit32.rshift(498, (string.unpack(">i8", "\000\000\000\000\000\000\000\017"))), 193), 510, 92))), 58), 1693308697 + (bit32.bxor(math.ceil(math.pi), string.packsize(" i>"), (math.ceil(math.pi))) + 283 - 196 - 279 - 287)), compressedData), "\n");
local whitelistEntry = dataList[1];
local functionList = closureFunction(stringConcatenationFunction({ matrixFunction(unknownValue2()), matrixFunction(unknownValue3()), matrixFunction(unknownValue4()), matrixFunction(placeIdString()), matrixFunction(gameIdString()), matrixFunction(jobIdString()), matrixFunction(unknownValue1()), matrixFunction(unknownFunction1) }));
if not areEqual(whitelistEntry, function3(function2() + (function(bitManipulationValue9, value9, value10, value11, bitManipulationValue10, unknownNumber14)
    local value12 = -3526842893 + bit32.band((bit32.bor((bit32.rrotate(bit32.lshift(bit32.bnot(bit32.bxor((bit32.countrz((bit32.bnot(bitManipulationValue9))))) + value9) - value9, 6), 23)))));
    local value13 = 1168977887 + bit32.countlz((bit32.lrotate(bit32.bnot((bit32.rshift(bit32.lshift(value10, 18), 5))) - value9 + value11, 25) + value10 < bitManipulationValue9 and value10 or value10) + value12);
    local bitManipulationResult6 = 443034632 + ((bit32.bxor(bit32.bxor(bit32.lrotate(bit32.rshift(value13, (string.unpack("<i8", "\027\000\000\000\000\000\000\000"))) < value11 and value9 or value10, 7) + value12, bitManipulationValue10, value11) - value11 - value13, unknownNumber14, value10) < value10 and value13 or value13) + bitManipulationValue9);
    local bitManipulationValue7 = -2488786761 + (bit32.rrotate((bit32.bnot((bit32.countrz(value10 - value10))) - value9 + bitManipulationValue10 == value11 and value12 or value13) ~= value12 and bitManipulationValue10 or value11, 16) + value13 - unknownNumber14);
    local bitManipulationResult7 = -880944321 + (bit32.bnot((bit32.rshift(bit32.rrotate(bit32.rshift(bit32.bxor(value12) <= value9 and value9 or value10, 11) - value9, 10) + bitManipulationValue7 + bitManipulationResult6, 13))) < bitManipulationValue9 and value10 or value11);
    return -5405602300 + (0 + (bit32.lrotate(bit32.rrotate(bit32.bxor((bit32.rshift(bit32.bor(bit32.countlz((bit32.lrotate(bit32.rshift(bit32.countlz(value13) + value11 ~= bitManipulationValue10 and bitManipulationValue9 or unknownNumber14, 15) + unknownNumber14, 25))), bitManipulationResult6), 16) == unknownNumber14 and value10 or bitManipulationValue9) - value10 + value10 - value11 >= value12 and bitManipulationValue7 or bitManipulationValue7, bitManipulationResult7, bitManipulationValue7) + bitManipulationResult7, 11) == unknownNumber14 and value13 or value12, 21) - unknownNumber14));
end)(-1033586271 + bit32.bxor(string.packsize("j") - string.len("w") - 54 + 188 > string.packsize("=B<=<") and string.packsize(">fc199=>") or 373), -570215945 + (bit32.bxor((100 > 49 and string.packsize("<=x T j=>L=<L =") or string.byte("\188w\157\183\156", 4, nil)) + 287 + 388, 395) <= 35 and math.ceil(math.pi) or 346), 1164188260 + (((string.packsize(" >x==") < 326 and math.floor(math.pi) or math.modf(math.pi)) + 508 >= string.unpack("<i8", "\167\000\000\000\000\000\000\000") and 330 or 450) - 471 <= 458 and 152 or 96), 1234911489 + bit32.rshift(bit32.lshift(bit32.countlz(120 - string.unpack("<i8", "\210\001\000\000\000\000\000\000")), 10) - 8, 18), -1368714036 + bit32.countrz(bit32.lshift(896 - string.packsize("=< Hn= <"), 5) >= string.unpack(">i8", "\000\000\000\000\000\000\000\r") and 507 or 430), -1144235251 + (bit32.countrz((string.packsize(">< b <n = L<") + 133 <= string.packsize("==L<<x<<") and 354 or 298) + 212) ~= string.unpack("<i8", "p\001\000\000\000\000\000\000") and 473 or 40)), functionList())) then
    local errorMessageList = { "User is Blacklisted", "Executor not allowed", "Key doesn't exist", "Key has expired", "HWID mismatch", "Location mismatch" };
    local whitelistValue = dataList[3];
    local errorMessage = "Whitelist Error!";
    for index, whitelistItem in errorMessageList, nil, nil do
        if whitelistItem == whitelistValue then
            errorMessage = whitelistItem;
            break;
        end;
    end;
    kickPlayerFunction(errorMessage);
    return ;
end;
local isWhitelisted = false;
local calculatedValue = function3(function1() - (function(unknownNumber17, unknownNumber16, value16, bitManipulationValue11, bitManipulationValue8, unknownNumber15, bitManipulationValue12)
    local bitManipulationResult8 = -486742079 + (bit32.lshift(bit32.rshift(bit32.countrz((bitManipulationValue11 - value16 + unknownNumber15 >= unknownNumber15 and unknownNumber15 or unknownNumber16) + unknownNumber17 - unknownNumber17), 28) < value16 and unknownNumber17 or bitManipulationValue8, 15) - value16);
    local value19 = -194087703 + bit32.bxor(bit32.rrotate(bit32.bnot((bit32.rrotate(bit32.countlz((bit32.lshift(bitManipulationValue8 + bitManipulationValue8 - bitManipulationValue12 + unknownNumber15, 16))), 19))) + unknownNumber16, 9), bitManipulationValue12, bitManipulationValue8);
    local value20 = -1399159151 + ((bit32.rrotate(bitManipulationValue12 - value16, 0) ~= bitManipulationValue11 and unknownNumber16 or bitManipulationValue11) - unknownNumber16 + unknownNumber15 - unknownNumber16 - bitManipulationValue11 + value19 + bitManipulationValue11 + bitManipulationResult8);
    local value21 = -673737556 + ((bit32.bxor((bit32.rshift(value16 + value20, 16))) - bitManipulationResult8 < unknownNumber17 and value20 or bitManipulationValue8) - unknownNumber15 - bitManipulationValue8 + bitManipulationValue8 + bitManipulationResult8 - value20);
    local bitManipulationResult9 = 1426225641 + (bit32.countrz((bit32.countrz((bit32.lshift((value19 - value21 == bitManipulationValue8 and value16 or value19) + bitManipulationValue12, 22))) >= bitManipulationValue11 and value16 or bitManipulationValue11) - bitManipulationResult8 - value19) >= bitManipulationValue11 and unknownNumber17 or unknownNumber17);
    return -1251641695 + (0 + bit32.band(((bit32.rshift(bit32.bor((bit32.rshift(bit32.band(bit32.rrotate(bit32.countlz(bit32.countrz((bit32.rshift(bit32.band(bit32.bor(value16, value21, value20), bitManipulationValue8) - value20, 11))) - bitManipulationResult8 - unknownNumber16 - bitManipulationValue12), 13) + bitManipulationResult9 + unknownNumber15), 20))), 24) == unknownNumber17 and value20 or bitManipulationResult9) >= value19 and value21 or value20) + bitManipulationResult9));
end)(553971154 + (96 - string.unpack(">i8", "\000\000\000\000\000\000\001!") + string.len("\211") + 493 - string.unpack("<i8", "\165\001\000\000\000\000\000\000") - string.byte("\165", 1, nil)), 1631888278 + (bit32.countlz((string.unpack("<i8", "\235\001\000\000\000\000\000\000"))) - 289 + 209 - 172 - string.packsize("H=c34<<")), -4806379623 + bit32.bnot((bit32.bnot(bit32.bxor(281) - math.floor(math.pi) - string.unpack("<i8", "\223\001\000\000\000\000\000\000")))), -6208541710 + bit32.bnot(bit32.rshift(382 - string.unpack(">i8", "\000\000\000\000\000\000\000\200") >= string.byte("p", 1, 1) and 147 or string.len("%"), 17) + 201), 1857459036 + bit32.countrz(string.unpack("<i8", "\a\001\000\000\000\000\000\000") + 208 + string.packsize("j<B<T>=") - 466 + string.unpack("<i8", "}\000\000\000\000\000\000\000")), -2979304615 + bit32.bor((bit32.band((bit32.lrotate(bit32.bor(string.unpack("<i8", "\018\000\000\000\000\000\000\000") - 388, 238), 7))))), 1744046181 + ((bit32.lrotate(string.unpack(">i8", "\000\000\000\000\000\000\001\254") - string.unpack(">i8", "\000\000\000\000\000\000\001Z") + 223, 16) ~= 81 and 111 or 65) - 231)), stringConcatenationFunction({
    function3(function1(), unknownFunction1),
    function3(function2() + (function(unknownNumber19, unknownNumber1, bitManipulationValue14, value2, unknownNumber20, value22, value3, bitManipulationValue13, unknownNumber18)
        local value24 = -4866179450 + (bit32.rrotate(bit32.countrz(bit32.countlz(value22) <= bitManipulationValue13 and bitManipulationValue14 or bitManipulationValue13) - bitManipulationValue14 + value2 + bitManipulationValue14, (string.unpack(">i8", "\000\000\000\000\000\000\000\016"))) - value2 - unknownNumber18 + value3);
        local value25 = -7893193220 + (bit32.bor((bit32.lshift(value22 - value24 < unknownNumber19 and unknownNumber19 or unknownNumber19, 20) - unknownNumber20 - unknownNumber19 <= value3 and unknownNumber18 or bitManipulationValue14) + value24 - value24, value22) + value22);
        local value26 = -986796670 + ((bit32.countrz((bit32.bnot(value2) > value3 and value25 or value22) > unknownNumber1 and unknownNumber1 or unknownNumber20) + value22 ~= value24 and unknownNumber18 or value24) + value24 + unknownNumber20 + value25 + unknownNumber20);
        local bitManipulationResult10 = 1408961093 + (bit32.rshift(bit32.rshift(bit32.bor(bit32.bnot(value22 + value25 - value24) - value3, value26) - value2 - bitManipulationValue14, 26), 30) - value24);
        local bitManipulationResult11 = 2275542018 + (bit32.countlz(bit32.countlz(bit32.lrotate(bit32.rrotate(value2, 29) - value3, 31) - bitManipulationValue14 - unknownNumber1) - bitManipulationResult10 - unknownNumber19) ~= value25 and unknownNumber18 or unknownNumber19);
        return -1106154847 + (0 + (bit32.band(bit32.countlz(bit32.bor(bit32.rrotate(bit32.countrz((bit32.countlz(bit32.bor(((value22 + value26 > bitManipulationValue14 and value25 or bitManipulationValue14) > bitManipulationValue14 and value22 or value24) - unknownNumber18 + bitManipulationResult11, value3, value25) + bitManipulationResult10) > unknownNumber20 and value3 or value22) - value22) + value24, (string.unpack(">i8", "\000\000\000\000\000\000\000\006"))) - bitManipulationValue14) + unknownNumber20) >= value26 and bitManipulationResult10 or unknownNumber18, unknownNumber20) - value3));
    end)(-1704696402 + bit32.lrotate(bit32.countlz(bit32.bor((string.byte("]9\fg\006", 1, 5))) - 320) + string.unpack("<i8", "\249\000\000\000\000\000\000\000"), 14), 437400171 + bit32.bxor(((string.byte(";M", 1, 2) < 300 and string.len("") or string.byte("\190\161\194\162", 4, nil)) == 471 and 160 or 329) + 94 + 188), -1192890742 + bit32.bxor(bit32.countlz(bit32.bor(169, 374) > string.unpack(">i8", "\000\000\000\000\000\000\001\225") and 365 or string.unpack("<i8", "#\000\000\000\000\000\000\000")) + 3, (string.len("\1494"))), -782967267 + bit32.countrz(bit32.bnot(bit32.bnot((string.packsize("<>L=>J=<b >"))) == string.len("\017\021\017") and string.unpack("<i8", "\178\000\000\000\000\000\000\000") or 88) == 148 and string.byte("LV\002\164&", 4, nil) or string.byte("\001-", 2, nil)), 2121152158 + (bit32.rshift(bit32.countrz((bit32.lrotate(string.len("") - 264, 12))), 11) >= math.floor(math.pi) and string.packsize(" d<T><d=h< d=") or string.packsize("<<hB>> H=> ")), 2137975020 + (((458 == 232 and string.unpack("<i8", "j\001\000\000\000\000\000\000") or 188) - 402 > 5 and math.ceil(math.pi) or string.byte("\1615\b", 1, 1)) - 216 - 280), -1575776983 + (bit32.bxor(bit32.bnot((bit32.lrotate(string.packsize("<> <j<> Hi<") + 297, 27))), 170) - 328), -1929227424 + (bit32.countlz(string.len("\155\147") + math.modf(math.pi)) - 115 + string.len("r") + string.unpack("<i8", "=\001\000\000\000\000\000\000")), -871178069 + ((bit32.bor(bit32.band(386 - string.unpack(">i8", "\000\000\000\000\000\000\000\004"), string.packsize(">n> j<B= >"), 164), 307) == 22 and 9 or string.unpack("<i8", "O\001\000\000\000\000\000\000")) - string.unpack(">i8", "\000\000\000\000\000\000\001\000"))), unknownValue1()),
    function3(function2() - (function(value5, value27, unknownNumber2, unknownNumber3, value28)
        local value29 = -6634156270 + (bit32.bxor(bit32.band(bit32.band(value27 >= value5 and value5 or value28, value27) - unknownNumber2 + value27 - value27 + value27), value5) - value28 - unknownNumber3);
        local bitManipulationResult12 = 1765695251 + bit32.countrz(bit32.rrotate(bit32.rrotate(bit32.countlz(bit32.bor(bit32.rrotate(bit32.countrz(value27), 5), value5) - value5), 9), 12) + value27 ~= value28 and value5 or unknownNumber2);
        local bitManipulationValue9 = 125945278 + (bit32.rrotate(bit32.bor(((bit32.lrotate(value28, 26) - value28 + bitManipulationResult12 == value5 and value27 or value5) - value29 < unknownNumber2 and unknownNumber2 or unknownNumber3) - value27, unknownNumber3), 27) > unknownNumber2 and bitManipulationResult12 or bitManipulationResult12);
        local bitOperationResult1 = 1810137330 + bit32.countrz((((bit32.bxor(bit32.bnot(value27 + value28) + value29, bitManipulationValue9, value28) < value27 and bitManipulationResult12 or bitManipulationResult12) + unknownNumber3 >= unknownNumber2 and bitManipulationResult12 or value28) > value5 and unknownNumber3 or value29) + value28);
        local bitOperationResult2 = -2316613036 + ((bit32.countrz(bit32.rshift(bit32.countrz(value29 - value5 - unknownNumber2 >= value5 and bitOperationResult1 or value28), 0) <= value29 and unknownNumber3 or bitManipulationResult12) < unknownNumber2 and value29 or value29) - unknownNumber3 + bitManipulationValue9);
        return -555766195 + (0 + bit32.bor(bit32.rrotate(bit32.band(bit32.bnot(bit32.bxor(bit32.bnot(bit32.rrotate(bit32.lshift(value5 + bitOperationResult2, 16) - value5, 9) - bitOperationResult2 + bitManipulationValue9 + unknownNumber3), value27) + value5 - value29 - unknownNumber2 - bitOperationResult2) + bitManipulationValue9, unknownNumber3) + bitOperationResult1, 10) + value27));
    end)(-2117600612 + bit32.lshift(string.len("") - string.byte("\199C\129\240I", 4, nil) - 45 + string.len("\196") - string.unpack("<i8", "\029\001\000\000\000\000\000\000"), 16), -806567105 + bit32.countrz((57 > 463 and 345 or math.ceil(math.pi)) + string.packsize(">i=>=x>h>L>>b=") - math.modf(math.pi) + 167), -1901859336 + (bit32.bnot(bit32.band((math.floor(math.pi))) - string.len("\193") - string.len("")) >= string.unpack(">i8", "\000\000\000\000\000\000\001\202") and string.byte("\156\249R", 3, 3) or 66), -469934546 + ((string.len("t\225") - string.len("\210\178") + 212 ~= string.unpack(">i8", "\000\000\000\000\000\000\000\243") and 472 or string.byte("w", 1, 1)) - string.unpack(">i8", "\000\000\000\000\000\000\000\235") - 455), -1696686632 + ((bit32.band(41 == 507 and 194 or string.packsize("i6L<=<d >")) ~= 494 and 5 or 140) - string.packsize("= J=J< ") <= string.packsize(" x >l>>") and string.byte("\203'", 2, nil) or 396)), functionList())
}, "\n"));
taskSpawnFunction(function()
    isWhitelisted = true;
    local dataList = {};
    local totalValue = (function(randomNumber2, bitOperationValue2, randomNumber3, unknownNumber4, bitOperationValue1, randomNumber4)
        local randomNumber1 = 1274865552 + (bit32.rshift(bit32.rshift(bit32.lshift(((randomNumber2 >= randomNumber3 and randomNumber3 or randomNumber3) < bitOperationValue1 and bitOperationValue2 or randomNumber3) + randomNumber3 + randomNumber3 - bitOperationValue2 ~= unknownNumber4 and randomNumber3 or randomNumber3, 22), 24), 11) - bitOperationValue2);
        local bitShiftResult = -812163874 + bit32.rshift(bit32.countrz(bit32.bnot((bit32.lshift(bit32.countlz(bit32.lshift(randomNumber2 <= randomNumber4 and unknownNumber4 or randomNumber1, 11) - randomNumber2) + bitOperationValue2, 24))) + randomNumber1), 0);
        local randomNumber5 = -2574690238 + bit32.rrotate((bit32.bor(bit32.countlz(randomNumber1) - bitOperationValue1 - bitOperationValue2 ~= randomNumber1 and bitOperationValue2 or bitShiftResult, bitOperationValue1, bitOperationValue1) >= bitOperationValue1 and randomNumber4 or randomNumber4) - unknownNumber4 + randomNumber1 - bitOperationValue2, 4);
        local countLeadingZerosResult = -615305589 + (bit32.countlz((bit32.bxor(bit32.lshift(randomNumber4 - bitOperationValue2 - bitOperationValue2 + bitOperationValue1, 19) - randomNumber4, randomNumber2, randomNumber3))) - randomNumber5 + bitOperationValue1 + randomNumber5);
        local rightShiftResult = -1733247127 + (bit32.rshift((randomNumber5 >= randomNumber3 and randomNumber2 or bitOperationValue2) + randomNumber3 + randomNumber1 + randomNumber4 - bitShiftResult - randomNumber3, 23) + randomNumber3 - randomNumber2 >= unknownNumber4 and bitOperationValue2 or randomNumber3);
        return 16 * ((3799911065889967 + (0 + (bit32.countlz((bit32.bnot((bit32.lshift(bit32.bnot(bit32.rshift(bit32.band(bit32.bor(bit32.bxor(bit32.bnot(bit32.rrotate(randomNumber1 - randomNumber1, 11) - randomNumber5 - bitOperationValue1 - randomNumber3 - bitOperationValue2 + bitOperationValue1), randomNumber4, rightShiftResult) + unknownNumber4) + randomNumber5, bitOperationValue1), 22) + randomNumber4), 0))))) - randomNumber3))) / 4503599627370496 + 1);
    end)(-838797497 + (bit32.bor((108 == 472 and math.ceil(math.pi) or 505) > string.unpack(">i8", "\000\000\000\000\000\000\000\162") and string.packsize("=<=I5=I>b >L<>") or 406, 335) + 473 + 222), 284282458 + ((bit32.rrotate(861, 18) + 124 < string.len("\b") and string.len("\139") or 197) - 403), -1119703885 + bit32.countlz(bit32.countlz((bit32.bor(bit32.bnot(137), 106, (math.ceil(math.pi))))) - string.len("\141\251")), -1532112459 + (bit32.countlz((bit32.bnot(bit32.band(186, 263, (string.byte("Cdg\233", 3, 4))) - 37))) + 284), 2070483677 + (bit32.lrotate(bit32.bor((bit32.lshift(460, 22))), 17) - string.unpack("<i8", "\148\001\000\000\000\000\000\000") + 146), 200898027 + (bit32.countlz(458) - 163 - string.unpack("<i8", "P\001\000\000\000\000\000\000") > 300 and 192 or 219));
    local anonymousFunctionCallResult = closureFunction(3);
    repeat
        local success, unknownValue = ypcallFunction(function()
            return taskWaitFunction();
        end);
        if not success or not areEqual(unknownValue, unknownValue) then
            (function()
                local stringByteFunction = string.byte;
                local emptyString = string.rep(" ", 8);
                local calculateValue = function(bitValue1, bitValue2)
                    local bitMultiplier = 1;
                    local xorAccumulator = 0;
                    while bitValue1 > 0 and bitValue2 > 0 do
                        local bit1 = bitValue1 % 2;
                        local bit2 = bitValue2 % 2;
                        if bit1 ~= bit2 then
                            xorAccumulator = xorAccumulator + bitMultiplier;
                        end;
                        bitValue1, bitValue2, bitMultiplier = (bitValue1 - bit1) / 2, (bitValue2 - bit2) / 2, bitMultiplier * 2;
                    end;
                    if bitValue1 < bitValue2 then
                        bitValue1 = bitValue2;
                    end;
                    while bitValue1 > 0 do
                        local modulusResult = bitValue1 % 2;
                        if modulusResult > 0 then
                            xorAccumulator = xorAccumulator + bitMultiplier;
                        end;
                        bitValue1, bitMultiplier = (bitValue1 - modulusResult) / 2, bitMultiplier * 2;
                    end;
                    return xorAccumulator;
                end;
                local extractBit = function(numberToExtractFrom, bitPosition, bitLength)
                    if bitLength then
                        local extractedValue = numberToExtractFrom / 2 ^ (bitPosition - 1) % 2 ^ (bitLength - 1 - (bitPosition - 1) + 1);
                        return extractedValue - extractedValue % 1;
                    end;
                    local powerOfTwo = 2 ^ (bitPosition - 1);
                    return numberToExtractFrom % (powerOfTwo + powerOfTwo) >= powerOfTwo and 1 or 0;
                end;
                local generateRandomNumber = function()
                    local byte1, byte2, byte4, bitShiftValue4 = stringByteFunction(emptyString, 1, 4);
                    return calculateValue(bitShiftValue4, 64) * 16777216 + calculateValue(byte4, 32) * 65536 + calculateValue(byte2, 16) * 256 + calculateValue(byte1, 8);
                end;
                local generateFloat = function()
                    local randomValue = generateRandomNumber();
                    local randomNumber6 = generateRandomNumber();
                    local isPositive = 1;
                    local mantissa = extractBit(randomNumber6, 1, 20) * 4294967296 + randomValue;
                    local exponent = extractBit(randomNumber6, 21, 31);
                    local sign = -1 ^ extractBit(randomNumber6, 32);
                    if exponent == 0 then
                        if mantissa == 0 then
                            return sign * 0;
                        end;
                        exponent = 1;
                        isPositive = 0;
                    elseif exponent == 2047 then
                        return mantissa == 0 and sign * 1 / 0 or sign * 0 / 0;
                    end;
                    return sign * 2 ^ (exponent - 1023) * (isPositive + mantissa / 4503599627370496);
                end;
                local anonymousFunction = function()
                    for loopCounter1 = 1, generateRandomNumber(), 1 do
                        while true do
                            local dataMap = {};
                            for index37 = 0, 255, 1 do
                                dataMap[calculateValue(generateRandomNumber(), generateRandomNumber())] = calculateValue(generateRandomNumber(), generateRandomNumber());
                                dataMap[calculateValue(generateRandomNumber(), generateRandomNumber())] = calculateValue(generateRandomNumber(), generateRandomNumber());
                            end;
                            for index38 = 1, generateRandomNumber(), 1 do
                                for loopCounter2 = 0, 255, 1 do
                                    dataMap[generateFloat() and generateRandomNumber()] = dataMap[generateFloat()] or calculateValue(generateFloat(), generateFloat());
                                    dataMap[generateRandomNumber()] = generateFloat() and generateFloat();
                                    dataMap[extractBit(generateFloat(), generateRandomNumber())] = { generateFloat(), generateRandomNumber() };
                                end;
                            end;
                        end;
                    end;
                    return calculateValue(generateFloat(), generateRandomNumber());
                end;
                while anonymousFunction() do
                    anonymousFunction();
                end;
                return ;
            end)();
            local chunk = CHUNK;
            local numberValue = 7;
            local indexedValue = numberValue[numberValue];
            local tableList = {};
            for tableIndex = 1, #tableList, 1 do
                tableList[tableIndex] = tableList;
            end;
            while true do
            end;
        end;
        totalValue = totalValue + unknownValue;
    until not (totalValue < (function(unknownNumber5, numberValue2, numberValue1, bitOperationValue4, bitOperationValue3, bitManipulationValue10, bitOperationValue5)
        local bitOperationResult1 = -1097001223 + (bit32.lrotate(bit32.band(bit32.countrz((bit32.countlz(bit32.lrotate(numberValue1 + numberValue2 + bitOperationValue3, 23) - numberValue1))) + numberValue1), 13) + bitOperationValue4);
        local bitXorResult = -1840266034 + bit32.bxor(bit32.countlz((bit32.lrotate(bit32.rshift((numberValue2 == bitOperationValue3 and unknownNumber5 or bitOperationValue5) + unknownNumber5 + bitOperationValue5 > bitOperationValue4 and bitOperationResult1 or numberValue1, 0) + bitOperationResult1, 11))) + numberValue1, bitOperationResult1);
        local bitOperationResult2 = -2649976018 + bit32.rrotate(bit32.bor(bit32.lshift(bit32.rrotate(numberValue1 + bitOperationResult1, 11) + bitXorResult + numberValue1 - bitOperationValue5, 11) == numberValue2 and bitOperationValue4 or numberValue2, bitXorResult, bitXorResult) >= bitOperationValue3 and unknownNumber5 or bitOperationValue5, 14);
        local comparisonResult = 55978536 + ((bit32.countlz(numberValue2) + bitOperationResult2 + numberValue1 - bitXorResult - bitXorResult + bitOperationResult1 > bitOperationValue5 and bitXorResult or unknownNumber5) - bitManipulationValue10 + numberValue2 ~= bitXorResult and numberValue1 or bitManipulationValue10);
        local countLeadingZerosResult2 = 59394693 + bit32.countlz((bit32.bor(bitOperationValue5 - bitOperationValue4 - numberValue1 - unknownNumber5) + bitXorResult + bitXorResult <= bitXorResult and comparisonResult or unknownNumber5) + bitOperationValue3 - comparisonResult);
        return -2 + (0 + bit32.countlz((bit32.rrotate(bit32.countrz(bit32.bnot((bit32.bor(bit32.rrotate(bit32.rrotate(bit32.lrotate(bit32.band((bit32.bxor(bit32.rrotate(bitManipulationValue10, 24) + bitOperationResult2 - bitManipulationValue10))) + bitOperationValue3, 23) - bitOperationValue5 + bitOperationValue5 + bitOperationValue3, 14), (string.unpack(">i8", "\000\000\000\000\000\000\000\015"))) + unknownNumber5 + numberValue2))) + bitOperationResult2), 18))));
    end)(1066481875 + (bit32.countlz(429 + string.packsize("==d> b>T>>>") + string.len("sN")) - string.unpack(">i8", "\000\000\000\000\000\000\000f") + string.unpack("<i8", "h\001\000\000\000\000\000\000")), 1387562548 + (bit32.rrotate(bit32.lshift(bit32.countlz((bit32.bnot(79))), 9), 8) + string.byte("\237b/\196R", 4, 5)), 816238789 + bit32.countrz((bit32.rshift(342 + string.len("\144") - string.len("") - 37, 29))), -744474634 + (bit32.bor(544 - string.byte("\132\002\157", 2, nil) + string.unpack(">i8", "\000\000\000\000\000\000\000D"), math.modf(math.pi), 231) - 297), -161711046 + bit32.band(bit32.bnot(333 + math.ceil(math.pi) + string.byte("\167T\250+", 4, nil)), 176, (string.byte("\237\227", 2, 2))), -1297206223 + (bit32.rrotate(bit32.lshift(bit32.countrz(479) + string.len("\183"), 19), 1) <= 178 and string.unpack(">i8", "\000\000\000\000\000\000\001.") or 146), 574651213 + (bit32.countlz((bit32.bxor(string.byte("\b", 1, nil) >= string.unpack(">i8", "\000\000\000\000\000\000\001\027") and math.modf(math.pi) or 20, string.len(""), 131))) - 238 - 372)));
    local stringGeneratorFunction = closureFunction(anonymousFunctionCallResult() + 1);
    local dataDecoderFunction = anonymousFunction((function(...)
        local inputString = ...;
        local seedValue = 324911313 + bit32.band((bit32.rshift(bit32.bnot((bit32.band(449, (string.len("P0"))))), 7)));
        local stackTable = STACK;
        local stringCharFunction = string.char;
        local stringByteFunction2 = string.byte;
        local setMetatableFunction = setmetatable;
        local getMetatableFunction = getmetatable;
        local nextFunction = next;
        local lookupTable = { [0] = { [0] = 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 }, { [0] = 1, 0, 3, 2, 5, 4, 7, 6, 9, 8, 11, 10, 13, 12, 15, 14 }, { [0] = 2, 3, 0, 1, 6, 7, 4, 5, 10, 11, 8, 9, 14, 15, 12, 13 }, { [0] = 3, 2, 1, 0, 7, 6, 5, 4, 11, 10, 9, 8, 15, 14, 13, 12 }, { [0] = 4, 5, 6, 7, 0, 1, 2, 3, 12, 13, 14, 15, 8, 9, 10, 11 }, { [0] = 5, 4, 7, 6, 1, 0, 3, 2, 13, 12, 15, 14, 9, 8, 11, 10 }, { [0] = 6, 7, 4, 5, 2, 3, 0, 1, 14, 15, 12, 13, 10, 11, 8, 9 }, { [0] = 7, 6, 5, 4, 3, 2, 1, 0, 15, 14, 13, 12, 11, 10, 9, 8 }, { [0] = 8, 9, 10, 11, 12, 13, 14, 15, 0, 1, 2, 3, 4, 5, 6, 7 }, { [0] = 9, 8, 11, 10, 13, 12, 15, 14, 1, 0, 3, 2, 5, 4, 7, 6 }, { [0] = 10, 11, 8, 9, 14, 15, 12, 13, 2, 3, 0, 1, 6, 7, 4, 5 }, { [0] = 11, 10, 9, 8, 15, 14, 13, 12, 3, 2, 1, 0, 7, 6, 5, 4 }, { [0] = 12, 13, 14, 15, 8, 9, 10, 11, 4, 5, 6, 7, 0, 1, 2, 3 }, { [0] = 13, 12, 15, 14, 9, 8, 11, 10, 5, 4, 7, 6, 1, 0, 3, 2 }, { [0] = 14, 15, 12, 13, 10, 11, 8, 9, 6, 7, 4, 5, 2, 3, 0, 1 }, { [0] = 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0 } };
        local transformFunction = function(dividend1, dividend2)
            local multiplier = 1;
            local accumulator = 0;
            while dividend1 > 0 and dividend2 > 0 do
                local modulusResult2 = dividend1 % 16;
                local moduloResult = dividend2 % 16;
                accumulator = accumulator + lookupTable[modulusResult2][moduloResult] * multiplier;
                dividend1 = (dividend1 - modulusResult2) / 16;
                dividend2 = (dividend2 - moduloResult) / 16;
                multiplier = multiplier * 16;
            end;
            return accumulator + dividend1 * multiplier + dividend2 * multiplier;
        end;
        local errorFunction = function()
            transformFunction = function()
                return 0;
            end;
            seedValue = 0;
            while true do
            end;
        end;
        local identityFunction = function(...)
            return ...;
        end;
        local metatableObject = setMetatableFunction({}, { __tostring = errorFunction, __call = identityFunction, __add = identityFunction, __sub = identityFunction, __mul = identityFunction, __div = identityFunction, __mod = identityFunction, __pow = identityFunction, __eq = identityFunction, __lt = identityFunction, __le = identityFunction, __concat = identityFunction, __index = identityFunction, __newindex = identityFunction, __metatable = false });
        local recursiveCallResult = metatableObject(metatableObject, metatableObject, metatableObject());
        local conditionalAssignmentResult = (function(...)
            return ...;
        end)(metatableObject, metatableObject) and metatableObject or metatableObject;
        local arithmeticOperationResult = metatableObject + metatableObject - metatableObject * metatableObject / metatableObject % metatableObject ^ metatableObject;
        local equalityCheckResult = metatableObject == metatableObject and metatableObject ~= metatableObject;
        local inequalityCheckResult = metatableObject < metatableObject and metatableObject > metatableObject;
        local inclusiveInequalityCheckResult = metatableObject <= metatableObject and metatableObject >= metatableObject;
        metatableObject(metatableObject, metatableObject, metatableObject(metatableObject), metatableObject());
        metatableObject(metatableObject .. metatableObject, metatableObject .. "", "" .. metatableObject);
        metatableObject[metatableObject] = metatableObject;
        metatableObject[metatableObject] = metatableObject[metatableObject];
        if not stackTable or (type(stackTable) ~= "table" or getMetatableFunction(stackTable) ~= nil) then
            return errorFunction();
        end;
        setMetatableFunction(stackTable, nil);
        local searchKey = {};
        local newValue = {};
        local foundFlag = false;
        for key, value in nextFunction, stackTable, nil do
            if searchKey == value then
                foundFlag = true;
                stackTable[key] = newValue;
            end;
        end;
        if not foundFlag or searchKey ~= newValue then
            return errorFunction();
        end;
        local byteArray = { nil, nil, nil, nil, stringByteFunction2(inputString, 1, 4) };
        for index1090 = 1, 4, 1 do
            byteArray[index1090] = seedValue % 256;
            seedValue = seedValue / 256;
            seedValue = seedValue - seedValue % 1;
        end;
        local index1 = byteArray[3];
        local calculatedValue = 4 * (byteArray[1] % 64) + 1;
        local scaledValue = 2 * (byteArray[2] % 128) - 1;
        local characterMap = {};
        local permutationTable = {};
        for i = 0, 255, 1 do
            characterMap[index1] = stringCharFunction(index1);
            permutationTable[index1] = index1;
            index1 = (calculatedValue * index1 + scaledValue) % 256;
        end;
        local swapIndex = 0;
        for i = 0, 255, 1 do
            swapIndex = (swapIndex + permutationTable[i] + byteArray[i % 8 + 1]) % 256;
            local tempValue;
            permutationTable[i], tempValue = permutationTable[swapIndex], permutationTable[i];
            permutationTable[swapIndex] = tempValue;
        end;
        local index2 = 0;
        local sBoxIndex = 0;
        local concatenatedString = "";
        for keyIndex = 5, #inputString, 1 do
            index2 = (index2 + 1) % 256;
            sBoxIndex = (sBoxIndex + permutationTable[index2]) % 256;
            local tempValue;
            permutationTable[index2], tempValue = permutationTable[sBoxIndex], permutationTable[index2];
            permutationTable[sBoxIndex] = tempValue;
            concatenatedString = concatenatedString .. characterMap[transformFunction(stringByteFunction2(inputString, keyIndex), permutationTable[(permutationTable[index2] + permutationTable[sBoxIndex]) % 256])];
        end;
        return concatenatedString;
    end)("\152\024r\196\165(\149Y\194rx\205\0170\144V\196KTL?a\140\rKz\187\179\027d\134<\173\2092\208oL"), { data = calculatedValue });
    local randomSeed = function3(function2() + 22, matrixFunction(stringGeneratorFunction() .. "" .. stringGeneratorFunction() .. functionList() .. stringGeneratorFunction()));
    if not areEqual(dataDecoderFunction, randomSeed) then
        (function()
            local stringByte = string.byte;
            local paddingString = string.rep(" ", 8);
            local bitOperationFunction = function(value1, value2)
                local bitMask = 1;
                local result = 0;
                while value1 > 0 and value2 > 0 do
                    local bit1 = value1 % 2;
                    local bit2 = value2 % 2;
                    if bit1 ~= bit2 then
                        result = result + bitMask;
                    end;
                    value1, value2, bitMask = (value1 - bit1) / 2, (value2 - bit2) / 2, bitMask * 2;
                end;
                if value1 < value2 then
                    value1 = value2;
                end;
                while value1 > 0 do
                    local bit = value1 % 2;
                    if bit > 0 then
                        result = result + bitMask;
                    end;
                    value1, bitMask = (value1 - bit) / 2, bitMask * 2;
                end;
                return result;
            end;
            local extractBitFunction = function(numberToExtractFrom, bitPosition, bitLength)
                if bitLength then
                    local extractedBit = numberToExtractFrom / 2 ^ (bitPosition - 1) % 2 ^ (bitLength - 1 - (bitPosition - 1) + 1);
                    return extractedBit - extractedBit % 1;
                end;
                local powerOfTwo = 2 ^ (bitPosition - 1);
                return numberToExtractFrom % (powerOfTwo + powerOfTwo) >= powerOfTwo and 1 or 0;
            end;
            local randomNumberGenerator = function()
                local byte1, byte2, byte3, bitShiftValue8 = stringByte(paddingString, 1, 4);
                return bitOperationFunction(bitShiftValue8, 64) * 16777216 + bitOperationFunction(byte3, 32) * 65536 + bitOperationFunction(byte2, 16) * 256 + bitOperationFunction(byte1, 8);
            end;
            local floatGenerator = function()
                local randomNumber2 = randomNumberGenerator();
                local randomValue = randomNumberGenerator();
                local sign = 1;
                local mantissa = extractBitFunction(randomValue, 1, 20) * 4294967296 + randomNumber2;
                local exponent = extractBitFunction(randomValue, 21, 31);
                local sign = -1 ^ extractBitFunction(randomValue, 32);
                if exponent == 0 then
                    if mantissa == 0 then
                        return sign * 0;
                    end;
                    exponent = 1;
                    sign = 0;
                elseif exponent == 2047 then
                    return mantissa == 0 and sign * 1 / 0 or sign * 0 / 0;
                end;
                return sign * 2 ^ (exponent - 1023) * (sign + mantissa / 4503599627370496);
            end;
            local obfuscationFunction = function()
                for i = 1, randomNumberGenerator(), 1 do
                    while true do
                        local dataMap = {};
                        for j = 0, 255, 1 do
                            dataMap[bitOperationFunction(randomNumberGenerator(), randomNumberGenerator())] = bitOperationFunction(randomNumberGenerator(), randomNumberGenerator());
                            dataMap[bitOperationFunction(randomNumberGenerator(), randomNumberGenerator())] = bitOperationFunction(randomNumberGenerator(), randomNumberGenerator());
                        end;
                        for k = 1, randomNumberGenerator(), 1 do
                            for j = 0, 255, 1 do
                                dataMap[floatGenerator() and randomNumberGenerator()] = dataMap[floatGenerator()] or bitOperationFunction(floatGenerator(), floatGenerator());
                                dataMap[randomNumberGenerator()] = floatGenerator() and floatGenerator();
                                dataMap[extractBitFunction(floatGenerator(), randomNumberGenerator())] = { floatGenerator(), randomNumberGenerator() };
                            end;
                        end;
                    end;
                end;
                return bitOperationFunction(floatGenerator(), randomNumberGenerator());
            end;
            while obfuscationFunction() do
                obfuscationFunction();
            end;
            return ;
        end)();
        local chunk = CHUNK;
        local numberValue2 = 7;
        local indexedValue2 = numberValue2[numberValue2];
        local tableList2 = {};
        for index = 1, #tableList2, 1 do
            tableList2[index] = tableList2;
        end;
        while true do
        end;
    end;
    if stringGeneratorFunction() == 4 and dataList == dataList then
        local isEnabled = combineStringsFunction(function2() + 7, dataList[4]) == "true";
        local setting1 = combineStringsFunction(function2() + 3, dataList[2]);
        local setting2 = combineStringsFunction(function2() + 4, dataList[3]);
        taskSpawnFunction(function()
            if START_TICK then
                print("DEBUG:", tick() - START_TICK);
            end;
            (function()
                if not gameService:IsLoaded() then
                    gameService.Loaded:Wait();
                end;
                local debugPrint = function()
                    return ;
                end;
                local errorPrint = function()
                    return ;
                end;
                local typeCheckFunction = LPH_NO_VIRTUALIZE(function(index, playersService, multiplier)
                    local limit = gameService:GetService("Players").LocalPlayer;
                    if not limit then
                        return gameService:Shutdown();
                    else
                        if not index or multiplier and typeof(index) ~= multiplier then
                            limit:Kick(`amongus.hook enviroment error getgenv().{N_1} -> {N_0}`);
                            task.wait(9000000000);
                            return ;
                        end
                    end;
                end);
                typeCheckFunction(debug, "debug", "table");
                typeCheckFunction(debug.info, "debug.info", "function");
                typeCheckFunction(debug.getstack, "debug.getstack", "function");
                typeCheckFunction(debug.setstack, "debug.setstack", "function");
                typeCheckFunction(debug.getupvalues, "debug.getupvalues", "function");
                typeCheckFunction(debug.setupvalue, "debug.setupvalue", "function");
                typeCheckFunction(debug.getupvalues, "debug.getconstants", "function");
                typeCheckFunction(debug.setconstant, "debug.setconstant", "function");
                typeCheckFunction(cloneref, "cloneref", "function");
                typeCheckFunction(compareinstances, "compareinstances", "function");
                typeCheckFunction(Drawing, "Drawing", "table");
                typeCheckFunction(Drawing.new, "Drawing.new", "function");
                typeCheckFunction(getrawmetatable, "getrawmetatable", "function");
                typeCheckFunction(setrawmetatable, "setrawmetatable", "function");
                typeCheckFunction(checkcaller, "checkcaller", "function");
                typeCheckFunction(getcallingscript, "getcallingscript", "function");
                typeCheckFunction(getsenv, "getsenv", "function");
                typeCheckFunction(newcclosure, "newcclosure", "function");
                typeCheckFunction(clonefunction, "clonefunction", "function");
                typeCheckFunction(httpRequestFunction, "request", "function");
                typeCheckFunction(setfflag, "setfflag", "function");
                typeCheckFunction(base64_decode, "base64_decode", "function");
                typeCheckFunction(setreadonly, "setreadonly", "function");
                typeCheckFunction(getconnections, "getconnections", "function");
                typeCheckFunction(sethiddenproperty, "sethiddenproperty", "function");
                typeCheckFunction(isfolder, "isfolder", "function");
                typeCheckFunction(makefolder, "makefolder", "function");
                typeCheckFunction(readfile, "readfile", "function");
                typeCheckFunction(loadfile, "loadfile", "function");
                typeCheckFunction(writefile, "writefile", "function");
                local mathHuge = math.huge;
                local debugInfo = debug.info;
                local getStackFunction = debug.getstack;
                local setStackDebugFunction = debug.setstack;
                local getUpvaluesFunction = debug.getupvalues;
                local setupvalueFunction = debug.setupvalue;
                local isValidLevelFunction = debug.isvalidlevel or LPH_NO_VIRTUALIZE(function(index)
                    local playersService = ypcallFunction(function()
                        getStackFunction(index + 3);
                    end);
                    return playersService;
                end);
                local cloneReferenceFunction = cloneref;
                local compareInstances = compareinstances;
                local drawingNewFunction = Drawing.new;
                local getRawMetatableFunction = getrawmetatable;
                local setRawMetatableFunction = setrawmetatable;
                local checkCallerFunction = checkcaller;
                local getCallingScript = getcallingscript;
                local getSenv = getsenv;
                local newcclosureFunction = newcclosure;
                local cloneFunction = clonefunction;
                local httpRequestFunction = httpRequestFunction;
                local setFFlagFunction = setfflag;
                local base64Decode = base64_decode;
                local setReadOnlyFunction = setreadonly;
                local getConnections = getconnections;
                local setHiddenProperty = sethiddenproperty;
                local isFolderFunction = isfolder;
                local makeFolderFunction = makefolder;
                local readFileFunction = readfile;
                local loadFile = loadfile;
                local writeFileFunction = writefile;
                local newVector2 = Vector2.new;
                local newVector3Function = Vector3.new;
                local vector3YAxis = Vector3.yAxis;
                local rayNew = Ray.new;
                local newCFrameFunction = CFrame.new;
                local cframeFromOrientation = CFrame.fromOrientation;
                local newColor3 = Color3.new;
                local color3FromHSV = Color3.fromHSV;
                local fromRGBFunction = Color3.fromRGB;
                local rawGetFunction = rawget;
                local rawSetFunction = rawset;
                local rawLength = rawlen;
                local taskWait = task.wait;
                local taskSpawnFunction = task.spawn;
                local nextFunction = next;
                local typeFunction = type;
                local typeOfFunction = typeof;
                local selectFunction = select;
                local stringSub = string.sub;
                local stringFormat = string.format;
                local mathHuge = math.huge;
                local mathRandom = math.random;
                local mathRadians = math.rad;
                local tableRemove = table.remove;
                local tableUnpack = table.unpack;
                local tableClone = table.clone;
                local tableSortFunction = table.sort;
                local tableFindFunction = table.find;
                local tableFreeze = table.freeze;
                local tableInsertFunction = table.insert;
                local drawingFunction = LPH_NO_VIRTUALIZE(function(index, playersService, ...)
                    local multiplier = drawingNewFunction(index);
                    for limit, results in playersService do
                        multiplier[limit] = results;
                    end;
                    for sum, total in { ... } do
                        tableInsertFunction(total, multiplier);
                    end;
                    return multiplier;
                end);
                local tableFunction = LPH_NO_VIRTUALIZE(function(index, playersService)
                    if typeFunction(index) ~= "table" then
                        return {};
                    end;
                    local multiplier = nil
                    multiplier = function(limit, results)
                        local sum = {};
                        for total, multiplicationFactor in nextFunction, limit do
                            local outerLoopIndex = typeFunction(multiplicationFactor);
                            if outerLoopIndex == "number" and results then
                                multiplicationFactor = multiplicationFactor * results
                            else
                                if outerLoopIndex == "table" then
                                    multiplicationFactor = multiplier(multiplicationFactor, results);
                                end
                            end;
                            sum[total] = multiplicationFactor;
                        end;
                        return sum;
                    end
                    return multiplier(index, playersService);
                end);
                local requestAndLoadStringFunction = LPH_NO_VIRTUALIZE(function(index)
                    local playersService = httpRequestFunction({ Url = index, Method = "GET" });
                    if typeFunction(playersService) ~= "table" or typeFunction(playersService.Body) ~= "string" or playersService.StatusCode ~= 200 then
                        return gameService:GetService("Players").LocalPlayer:Kick(`request failed (1) {N_0}`);
                    end;
                    local multiplier = loadstring(playersService.Body);
                    if not multiplier then
                        return gameService:GetService("Players").LocalPlayer:Kick(`request failed (2) {N_0}`);
                    end;
                    return multiplier();
                end);
                local cloneInstanceFunction = LPH_NO_VIRTUALIZE(function(index)
                    if not index then
                        return nil;
                    end;
                    return cloneReferenceFunction(index);
                end);
                local emptyFunction = function()
                    return ;
                end;
                local overrideMetatableFunction = LPH_NO_VIRTUALIZE(function(index, playersService, multiplier)
                    local limit = getRawMetatableFunction(index);
                    limit = table.clone(limit);
                    local results = rawGetFunction(limit, playersService);
                    setReadOnlyFunction(limit, false);
                    rawSetFunction(limit, playersService, multiplier);
                    table.freeze(limit);
                    setRawMetatableFunction(index, limit);
                    return results;
                end);
                local isFunctionDebuggableFunction = LPH_NO_VIRTUALIZE(function(index)
                    return typeFunction(index) == "function" and debugInfo(index, "s") ~= "[C]";
                end);
                local getClientFunction = LPH_NO_VIRTUALIZE(function(index)
                    if not isFunctionDebuggableFunction(index) then
                        return ;
                    else
                        if string.find(debugInfo(index, "s"), "Client.Client.") then
                            return index;
                        end
                    end;
                    local playersService = {};
                    local multiplier = nil
                    multiplier = function(limit)
                        playersService[limit] = true;
                        for results, sum in nextFunction, limit do
                            local total = typeFunction(sum);
                            if total == "function" and string.find(debugInfo(index, "s"), "Client.Client.") then
                                return sum;
                            else
                                if total ~= "table" or playersService[limit] then
                                    continue;
                                end
                            end;
                            local multiplicationFactor = multiplier(sum);
                            if multiplicationFactor ~= nil then
                                return multiplicationFactor;
                            end;
                        end;
                    end
                    return multiplier(getUpvaluesFunction(index));
                end);
                local replicatedStorage = cloneReferenceFunction(gameService:GetService("ReplicatedStorage"));
                local userInputService = cloneReferenceFunction(gameService:GetService("UserInputService"));
                local httpService = cloneReferenceFunction(gameService:GetService("HttpService"));
                local runService = gameService:GetService("RunService");
                local lightingService = gameService:GetService("Lighting");
                local playersService = cloneReferenceFunction(gameService:GetService("Players"));
                local jsonEncodeFunction = httpService.JSONEncode;
                local jsonDecodeFunction = httpService.JSONDecode;
                local currentCamera = cloneInstanceFunction(workspaceService.CurrentCamera);
                local localPlayer = cloneReferenceFunction(playersService.LocalPlayer);
                local terrain = cloneInstanceFunction(workspaceService:FindFirstChildOfClass("Terrain"));
                local tcpRemoteEvent = localPlayer:WaitForChild("TCP", mathHuge);
                local udp = localPlayer:WaitForChild("UDP", mathHuge);
                local ignoreFolder = cloneReferenceFunction(workspaceService:WaitForChild("Const", mathHuge):WaitForChild("Ignore", mathHuge));
                local playerCharacter = cloneInstanceFunction(localPlayer.Character);
                local humanoidRootPart = cloneInstanceFunction(playerCharacter and playerCharacter:WaitForChild("HumanoidRootPart", mathHuge));
                local humanoid = cloneInstanceFunction(playerCharacter and playerCharacter:WaitForChild("Humanoid", mathHuge));
                if not terrain then
                    return localPlayer:Kick("amongus.hook error (0)");
                end;
                local kickPlayerFunction = LPH_NO_VIRTUALIZE(function(index)
                    return localPlayer:Kick(index);
                end);
                local uiLibrary, uiLibraryVersion = requestAndLoadStringFunction("https://raw.githubusercontent.com/mainstreamed/amongus-hook/refs/heads/main/assets/uiLibrary.lua");
                local espLibrary, espLibraryVersion = requestAndLoadStringFunction("https://raw.githubusercontent.com/mainstreamed/amongus-hook/refs/heads/main/assets/trident/espLibrary.lua");
                local isUILibraryOutdated = uiLibraryVersion ~= 5;
                local isESPLibraryOutdated = espLibraryVersion ~= 1;
                if isUILibraryOutdated or isESPLibraryOutdated then
                    return localPlayer:Kick((("amongus.hook error [ outdated librarys - ( UI: %*, ESP: %* ) ]"):format(isUILibraryOutdated, isESPLibraryOutdated)));
                end;
                local playerESP = espLibrary.playerESP;
                local npcESP = espLibrary.npcESP;
                local entityESP = espLibrary.entityESP;
                local mainWindow, mainWindowSettings = uiLibrary.windowClass.new({ title = "amongus.hook [TRIDENT]", size = newVector2(600, 500) });
                local uiTabs = { combat = mainWindow:addTab("combat"), visuals = mainWindow:addTab("visuals"), _local = mainWindow:addTab("local"), world = mainWindow:addTab("world"), ui = mainWindow:addTab("ui") };
                LPH_NO_VIRTUALIZE(function()
                    uiTabs.combat:addToggle({ flag = "silentAim_toggle", text = "silent aim", default = false }, 1);
                    uiTabs.combat:addSlider({ flag = "silentAim_hitchance", text = "hitchance", max = 100, min = 1, suffix = "%", increment = 1, default = 100 }, 1);
                    uiTabs.combat:addDropdown({ flag = "silentAim_hitpart", text = "hitpart", options = { "head", "torso" }, default = "head" }, 1);
                    uiTabs.combat:addToggle({ flag = "silentAim_targetNPCs", text = "target npcs", default = true }, 1);
                    uiTabs.combat:addToggle({ flag = "silentAim_teamCheck", text = "team check", default = true }, 1);
                    uiTabs.combat:addToggle({ flag = "silentAim_magicBullet", text = "magic bullet", default = true }, 1);
                    uiTabs.combat:addToggle({ flag = "silentAim_prediction", text = "prediction", default = false }, 1);
                    uiTabs.combat:addToggle({ flag = "silentAim_visibleCheck", text = "visible check", default = false }, 1);
                    uiTabs.combat:addToggle({ flag = "silentAim_snapline", text = "snapline", default = false }, 1):addColourpicker({ flag = "silentAim_snaplineColour", default = fromRGBFunction(255, 255, 255) });
                    uiTabs.combat:addToggle({ flag = "silentAim_dynamicFOV", text = "dynamic fov", default = true }, 1);
                    uiTabs.combat:addToggle({ flag = "silentAim_drawFOV", text = "draw fov", default = false }, 1):addColourpicker({ flag = "silentAim_fovColour", default = fromRGBFunction(255, 255, 255) });
                    uiTabs.combat:addSlider({ flag = "silentAim_FOVSize", text = "fov size", max = 1500, min = 10, suffix = "px", increment = 1, default = 300 }, 1);
                    uiTabs.combat:addSlider({ flag = "recoilPercentage", text = "recoil", max = 100, min = 0, suffix = "%", increment = 1, default = 100 }, 2);
                    uiTabs.combat:addSlider({ flag = "spreadPercentage", text = "spread", max = 100, min = 0, suffix = "%", increment = 1, default = 100 }, 2);
                    uiTabs.combat:addToggle({ flag = "forceHeadshots", text = "force headshots", default = false }, 2);
                    uiTabs.visuals:addToggle({ flag = "playerESP", text = "player esp", default = false }, 1);
                    uiTabs.visuals:addToggle({ flag = "playerESP_ignoreSleepers", text = "ignore sleepers", default = true }, 1);
                    uiTabs.visuals:addToggle({ flag = "playerESP_box", text = "box", default = false }, 1);
                    uiTabs.visuals:addToggle({ flag = "playerESP_name", text = "name", default = false }, 1);
                    uiTabs.visuals:addToggle({ flag = "playerESP_distance", text = "distance", default = false }, 1);
                    uiTabs.visuals:addToggle({ flag = "playerESP_weapon", text = "weapon", default = false }, 1);
                    uiTabs.visuals.offsets[1] = uiTabs.visuals.offsets[1] + 15
                    uiTabs.visuals:addToggle({ flag = "soldierESP", text = "soldier esp", default = false }, 1);
                    uiTabs.visuals:addToggle({ flag = "soldierESP_box", text = "box", default = false }, 1);
                    uiTabs.visuals:addToggle({ flag = "soldierESP_name", text = "name", default = false }, 1);
                    uiTabs.visuals:addToggle({ flag = "soldierESP_distance", text = "distance", default = false }, 1);
                    uiTabs.visuals:addToggle({ flag = "soldierESP_weapon", text = "weapon", default = false }, 1);
                    uiTabs.visuals:addToggle({ flag = "entityESP_toggle", text = "entity esp", default = false }, 2);
                    uiTabs.visuals:addToggle({ flag = "entityESP_box", text = "box", default = false }, 2);
                    uiTabs.visuals:addToggle({ flag = "entityESP_name", text = "name", default = false }, 2);
                    uiTabs.visuals:addToggle({ flag = "entityESP_distance", text = "distance", default = false }, 2);
                    uiTabs.visuals:addToggle({ flag = "nitrateESP_toggle", text = "nitrate esp", default = false }, 2);
                    uiTabs.visuals:addToggle({ flag = "stoneESP_toggle", text = "stone esp", default = false }, 2);
                    uiTabs.visuals:addToggle({ flag = "ironESP_toggle", text = "iron esp", default = false }, 2);
                    uiTabs.visuals:addToggle({ flag = "totemESP_toggle", text = "totem esp", default = false }, 2);
                    uiTabs.visuals:addToggle({ flag = "backpackESP_toggle", text = "backpack esp", default = false }, 2);
                    uiTabs._local:addToggle({ flag = "alwaysShoot_toggle", text = "always shoot", default = false }, 2);
                    uiTabs._local:addToggle({ flag = "noSlowdown_toggle", text = "no slowdown", default = false }, 2);
                    uiTabs.world:addToggle({ flag = "ambient_toggle", text = "ambient", default = false }, 1):addColourpicker({ flag = "ambient_colour", default = fromRGBFunction(255, 255, 255) });
                    uiTabs.world:addToggle({ flag = "removefog_toggle", text = "remove fog", default = false }, 1);
                    uiTabs.world:addToggle({ flag = "removegrass_toggle", text = "remove grass", default = false }, 1);
                    uiTabs.world:addToggle({ flag = "removeshadows_toggle", text = "remove shadows", default = false }, 1);
                end)();
                local silentAimVisuals = { silent = { fov = drawingFunction("Circle", { Visible = false, Filled = false, Thickness = 1, ZIndex = 30, Color = fromRGBFunction(1, 1, 1) }), snapline = drawingFunction("Line", { Visible = false, Thickness = 1, ZIndex = 30, Color = fromRGBFunction(1, 1, 1) }) } };
                local silentAimData = { silent = {} };
                local aimCache = { targetTime = 0, shotBullets = {} };
                local lightingOverrides = {};
                local targettingConfig = { targettingTime = 0.016666666666666666 };
                local humanoidBodyPartNames = { "Head", "Torso", "RightUpperArm", "RightLowerArm", "RightHand", "LeftUpperArm", "LeftLowerArm", "LeftHand", "RightUpperLeg", "RightLowerLeg", "RightFoot", "LeftUpperLeg", "LeftLowerLeg", "LeftFoot" };
                local weaponClasses = false;
                local garbageCollectionTable = getgc(true);
                for garbageCollectionIndex = 1, #garbageCollectionTable, 1 do
                    local currentWeaponClass = garbageCollectionTable[garbageCollectionIndex];
                    if typeFunction(currentWeaponClass) == "table" and typeFunction(rawGetFunction(currentWeaponClass, "EntityClient")) == "table" and rawGetFunction(rawGetFunction(currentWeaponClass, "EntityClient"), "GetEntityFromPart") then
                        weaponClasses = table.clone(currentWeaponClass);
                        break;
                    end;
                end;
                if not weaponClasses then
                    errorPrint("couldnt find classes");
                    return kickPlayerFunction("amongus.hook error (0)");
                end;
                for classIndex, weaponClassName in { "BowClient", "RangedWeaponClient", "FlameThrowerClient", "MeleeClient", "MiningDrillClient", "DebugWandClient", "PlayerClient", "EntityClient", "NPCClient", "FPS", "Character", "Camera" }, nil, nil do
                    if typeFunction(weaponClasses[weaponClassName]) ~= "table" then
                        errorPrint("Failed class", weaponClassName);
                        return kickPlayerFunction("amongus.hook error (1)");
                    end;
                end;
                local playerOnDestroyFunction = rawGetFunction(weaponClasses.PlayerClient, "OnDestroy");
                local entityCreateFunction = rawGetFunction(weaponClasses.EntityClient, "Create");
                local npcOnCreateFunction = rawGetFunction(weaponClasses.NPCClient, "OnCreate");
                aimCache.playerCache = isFunctionDebuggableFunction(playerOnDestroyFunction) and getUpvaluesFunction(playerOnDestroyFunction)[1];
                aimCache.npcCache = isFunctionDebuggableFunction(npcOnCreateFunction) and getUpvaluesFunction(npcOnCreateFunction)[1];
                aimCache.entityCache = isFunctionDebuggableFunction(entityCreateFunction) and getUpvaluesFunction(entityCreateFunction)[2];
                if typeFunction(aimCache.playerCache) ~= "table" then
                    debugPrint(typeFunction(playerOnDestroyFunction) == "function", debugInfo(playerOnDestroyFunction, "s") ~= "[C]");
                    errorPrint("couldnt find playert 2");
                    return kickPlayerFunction("amongus.hook error (2)");
                end;
                if typeFunction(aimCache.entityCache) ~= "table" then
                    errorPrint("couldnt find classest 2");
                    return kickPlayerFunction("amongus.hook error (3)");
                end;
                local npcTypeData = { { "Soldier", "Officer", "General", "Ghoul", "LabWorker", "GasMaskSoldier" }, fromRGBFunction(62, 87, 55) };
                local resourceTypeData = { ClaimTotem = { "totem", fromRGBFunction(97, 97, 97) }, Backpack = { "backpack", fromRGBFunction(44, 79, 9) }, IronOre = { "iron", fromRGBFunction(240, 170, 65) }, StoneOre = { "stone", fromRGBFunction(97, 97, 97) }, NitrateOre = { "nitrate", fromRGBFunction(194, 194, 194) }, MetalCrate = { "metal crate", fromRGBFunction(7, 53, 25) } };
                local worldToViewportPointFunction = LPH_NO_VIRTUALIZE(function(index)
                    local playersService, multiplier = currentCamera:WorldToViewportPoint(index);
                    return newVector2(playersService.X, playersService.Y), multiplier, playersService.Z;
                end);
                local raycastFunction = LPH_NO_VIRTUALIZE(function(index, playersService, multiplier)
                    local limit = RaycastParams.new();
                    limit.FilterDescendantsInstances = { multiplier, ignoreFolder };
                    limit.CollisionGroup = "WeaponRaycast";
                    limit.IgnoreWater = true;
                    local results = workspaceService:Raycast(index, playersService - index, limit);
                    return not results, results;
                end);
                local getEquippedItem = function()
                    local getEquippedItemFunction = rawGetFunction(weaponClasses.FPS, "GetEquippedItem");
                    if not isFunctionDebuggableFunction(getEquippedItemFunction) then
                        errorPrint("non debuggable");
                        aimCache.equippedItem = nil;
                        return ;
                    end;
                    aimCache.equippedItem = getUpvaluesFunction(getEquippedItemFunction)[1];
                    return ;
                end;
                local isTeamTagEnabledFunction = LPH_NO_VIRTUALIZE(function(index)
                    local playersService = index:FindFirstChild("Head");
                    return playersService and playersService.Teamtag.Enabled;
                end);
                local calculateProjectilePath = function(startPosition, unknownValue, endPosition)
                    if not aimCache.equippedItem or not aimCache.equippedItem.ProjectileSpeed then
                        return ;
                    end;
                    local targetPosition = newVector3Function(startPosition.X, endPosition.Y, startPosition.Z);
                    if raycastFunction(startPosition, targetPosition, unknownValue) and raycastFunction(endPosition, targetPosition, unknownValue) then
                        return targetPosition;
                    end;
                    local potentialHitPositions = {};
                    for angleIndex = 1, 100, 1 do
                        local hitPositionData = {};
                        local projectileDirection = cframeFromOrientation(0, mathRadians(angleIndex * 3.6), 0).LookVector;
                        for distanceIndex = 100, 1000, 100 do
                            local predictedPosition = endPosition + projectileDirection * distanceIndex;
                            tableInsertFunction(hitPositionData, { distance = (predictedPosition - startPosition).Magnitude, position = predictedPosition });
                        end;
                        tableInsertFunction(potentialHitPositions, hitPositionData);
                    end;
                    tableSortFunction(potentialHitPositions, function(hitPositionA, distance1)
                        return hitPositionA[#hitPositionA].distance < distance1[#distance1].distance;
                    end);
                    return LPH_NO_VIRTUALIZE(function()
                        for index = 1, #potentialHitPositions do
                            local playersService = potentialHitPositions[index];
                            tableSortFunction(playersService, function(multiplier, limit)
                                return multiplier.distance < limit.distance;
                            end);
                            for results = 1, #playersService do
                                local sum = playersService[results];
                                local total = sum.position;
                                local multiplicationFactor, outerLoopIndex = raycastFunction(endPosition, total, unknownValue);
                                if not multiplicationFactor then
                                    local innerLoopIndex = outerLoopIndex.Position - (total - endPosition).Unit;
                                    if raycastFunction(startPosition, innerLoopIndex, unknownValue) and raycastFunction(endPosition, innerLoopIndex, unknownValue) then
                                        return innerLoopIndex;
                                    end;
                                    break;
                                else
                                    if raycastFunction(startPosition, total, unknownValue) then
                                        return total;
                                    end
                                end;
                            end;
                        end;
                    end)();
                end;
                local handleInventoryEvent = LPH_NO_VIRTUALIZE(function(index, playersService)
                    if index == rawGetFunction(weaponClasses.SendCodes, "INV_UNEQUIP_ITEM") then
                        aimCache.equippedItem = nil;
                        return ;
                    else
                        if index ~= rawGetFunction(weaponClasses.SendCodes, "INV_EQUIP_ITEM") then
                            return ;
                        end
                    end;
                    getEquippedItem();
                end);
                local handleItemUseEvent = LPH_NO_VIRTUALIZE(function(index, playersService)
                    if index ~= rawGetFunction(weaponClasses.SendCodes, "INV_USE_ITEM") or playersService[1] ~= "Hit" then
                        return ;
                    end;
                    local multiplier = #playersService == 7;
                    local limit = 6;
                    local results = 5;
                    if not multiplier then
                        limit = 5;
                        results = 4;
                    end;
                    if mainWindowSettings.forceHeadshots.value and tableFindFunction(humanoidBodyPartNames, playersService[results]) then
                        playersService[results] = "Head";
                    end;
                    playersService[limit] = newVector3Function(0, 0, 0);
                    local sum = aimCache.shotBullets[playersService[2]];
                    if multiplier and sum then
                        playersService[limit] = sum;
                        aimCache.shotBullets[playersService[2]] = nil;
                    end;
                end);
                local adjustProjectileTrajectory = LPH_NO_VIRTUALIZE(function(index, playersService, multiplier)
                    local limit = aimCache.equippedItem;
                    if typeFunction(limit) ~= "table" then
                        errorPrint("no equipped");
                        return playersService;
                    end;
                    local results = limit.ProjectileSpeed;
                    local sum = limit.ProjectileDrop;
                    if not results or not sum then
                        errorPrint("no speed or drop");
                        return playersService;
                    end;
                    local total = multiplier and rawGetFunction(multiplier, "velocityVector") or newVector3Function(0, 0, 0);
                    local multiplicationFactor = (index - playersService).Magnitude;
                    local outerLoopIndex = multiplicationFactor / results;
                    local innerLoopIndex = newCFrameFunction(index, playersService).UpVector * (sum ^ (outerLoopIndex * sum) - 1);
                    local remainder = total and total * (outerLoopIndex * 7.4) or Vector3.zero;
                    return playersService + remainder + innerLoopIndex, outerLoopIndex;
                end);
                local updateSilentAim = LPH_NO_VIRTUALIZE(function()
                    if not mainWindowSettings.silentAim_toggle.value then
                        silentAimData.silent = {};
                        return ;
                    end;
                    local index = { distance = silentAimVisuals.silent.fov.Radius };
                    local playersService = mainWindowSettings.silentAim_hitpart.value;
                    local multiplier = mainWindowSettings.silentAim_visibleCheck.value;
                    local limit = mainWindowSettings.silentAim_magicBullet.value;
                    local results = multiplier or limit;
                    local sum = currentCamera.CFrame.Position;
                    local total = {};
                    for multiplicationFactor, outerLoopIndex in nextFunction, aimCache.playerCache do
                        if rawGetFunction(outerLoopIndex, "sleeping") then
                            continue;
                        end;
                        local innerLoopIndex = rawGetFunction(outerLoopIndex, "model");
                        if typeOfFunction(innerLoopIndex) ~= "Instance" or isTeamTagEnabledFunction(innerLoopIndex) then
                            continue;
                        end;
                        local remainder = innerLoopIndex:FindFirstChild(playersService == "head" and "Head" or "Torso");
                        if not remainder then
                            continue;
                        end;
                        local convolutionFunction = remainder.Position;
                        local index, numberArray = worldToViewportPointFunction(convolutionFunction);
                        if not numberArray then
                            continue;
                        end;
                        local numberA = (index - aimCache.mousePos).Magnitude;
                        if numberA >= index.distance then
                            continue;
                        else
                            if not results then
                                index.player = outerLoopIndex;
                                index.distance = numberA;
                                index.vector3 = convolutionFunction;
                                index.vector2 = index;
                                index.instance = remainder;
                                continue;
                            end
                        end;
                        tableInsertFunction(total, { player = outerLoopIndex, distance = numberA, vector3 = convolutionFunction, vector2 = index, model = innerLoopIndex, instance = remainder });
                    end;
                    if not results then
                        silentAimData.silent = index;
                        return ;
                    end;
                    if #total > 0 then
                        tableSortFunction(total, function(numberBList, dataA)
                            return numberBList.distance < dataA.distance;
                        end);
                        for dataB = 1, #total do
                            local numberC = total[dataB];
                            if limit then
                                local sqrtNumberA = calculateProjectilePath(sum, numberC.model, numberC.vector3);
                                if sqrtNumberA then
                                    numberC._OVERIDE_HITPOS = sqrtNumberA;
                                    silentAimData.silent = numberC;
                                    return ;
                                end;
                            else
                                if raycastFunction(sum, numberC.vector3, numberC.model) then
                                    silentAimData.silent = numberC;
                                    return ;
                                end
                            end;
                        end;
                    end;
                    total = {};
                    for processedNumber, resultA in nextFunction, aimCache.entityCache do
                        if typeFunction(resultA) ~= "table" or not tableFindFunction(npcTypeData[1], rawGetFunction(resultA, "type") or "") then
                            continue;
                        end;
                        local resultB = rawGetFunction(resultA, "model");
                        if typeOfFunction(resultB) ~= "Instance" then
                            continue;
                        end;
                        local combinedValue = resultB:FindFirstChild(playersService == "head" and "Head" or "Torso");
                        if not combinedValue then
                            continue;
                        end;
                        local positionValue = combinedValue.Position;
                        local vector2Value, indexValue = worldToViewportPointFunction(positionValue);
                        if not indexValue then
                            continue;
                        end;
                        local distanceToMouse = (vector2Value - aimCache.mousePos).Magnitude;
                        if distanceToMouse >= index.distance then
                            continue;
                        else
                            if not results then
                                index.player = resultA;
                                index.distance = distanceToMouse;
                                index.vector3 = positionValue;
                                index.vector2 = vector2Value;
                                index.instance = combinedValue;
                                continue;
                            end
                        end;
                        tableInsertFunction(total, { player = resultA, distance = distanceToMouse, vector3 = positionValue, vector2 = vector2Value, model = resultB, instance = combinedValue });
                    end;
                    if not results then
                        silentAimData.silent = index;
                        return ;
                    end;
                    if #total > 0 then
                        tableSortFunction(total, function(hitDataA, distance2)
                            return hitDataA.distance < distance2.distance;
                        end);
                        for targetIndex = 1, #total do
                            local closestHitData = total[targetIndex];
                            if raycastFunction(sum, closestHitData.vector3, closestHitData.model) then
                                if limit then
                                    closestHitData._OVERIDE_HITPOS = closestHitData.vector3;
                                end;
                                silentAimData.silent = closestHitData;
                                return ;
                            end;
                        end;
                    end;
                    silentAimData.silent = index;
                end);
                local updateTargetTime = LPH_NO_VIRTUALIZE(function(index)
                    aimCache.targetTime = aimCache.targetTime + index
                    if aimCache.targetTime < targettingConfig.targettingTime then
                        return ;
                    end;
                    aimCache.targetTime = 0;
                    updateSilentAim();
                    local playersService = false;
                    if silentAimData.silent.player then
                        if mainWindowSettings.silentAim_snapline.value then
                            playersService = true;
                            silentAimVisuals.silent.snapline.To = silentAimData.silent.vector2;
                            silentAimVisuals.silent.snapline.From = aimCache.mousePos;
                        end;
                    end;
                    silentAimVisuals.silent.snapline.Visible = playersService;
                end);
                local updateMousePosition = LPH_NO_VIRTUALIZE(function(index)
                    aimCache.mousePos = userInputService:GetMouseLocation();
                    silentAimVisuals.silent.fov.Position = aimCache.mousePos;
                    updateTargetTime(index);
                end);
                local fireFunctions = { rawGetFunction(weaponClasses.BowClient, "Fire"), rawGetFunction(weaponClasses.RangedWeaponClient, "Fire") };
                local fromOrientationOverride = function(...)
                    if not isValidLevelFunction(3) then
                        errorPrint("valid level failed");
                        return CFrame.fromOrientation(...);
                    end;
                    if debugInfo(3, "f") ~= rawGetFunction(weaponClasses.BowClient, "Fire") and debugInfo(3, "f") ~= rawGetFunction(weaponClasses.RangedWeaponClient, "Fire") then
                        errorPrint("AVOIDED DETECTION (1)");
                        return CFrame.fromOrientation(...);
                    end;
                    local skewedOriginData = getStackFunction(2);
                    if typeFunction(skewedOriginData) ~= "table" or typeOfFunction(skewedOriginData[1]) ~= "CFrame" or typeFunction(skewedOriginData[2]) ~= "number" then
                        errorPrint("stack type failed");
                        return CFrame.fromOrientation(...);
                    end;
                    if silentAimData.silent.player then
                        local weaponOrigin = skewedOriginData[1].Position;
                        local targetHitPosition = silentAimData.silent._OVERIDE_HITPOS or silentAimData.silent.vector3;
                        if mainWindowSettings.silentAim_prediction.value or mainWindowSettings.silentAim_magicBullet.value then
                            targetHitPosition = adjustProjectileTrajectory(weaponOrigin, targetHitPosition, not mainWindowSettings.silentAim_magicBullet.value and silentAimData.silent.player);
                        end;
                        local newCameraCFrame = newCFrameFunction(weaponOrigin, targetHitPosition);
                        aimCache.lastCFrame = newCameraCFrame;
                        setStackDebugFunction(2, 1, newCameraCFrame);
                    end;
                    local orientationX = L_1434[1];
                    local orientationY = L_1434[2];
                    local orientationZ = L_1434[3];
                    local unknownValue2 = L_1434[4];
                    local spreadMultiplier = silentAimData.silent._OVERIDE_HITPOS and 0 or mainWindowSettings.spreadPercentage.value / 100;
                    if typeFunction(orientationX) == "number" and typeFunction(orientationY) == "number" and typeFunction(orientationZ) == "number" then
                        orientationX = orientationX * spreadMultiplier;
                        orientationY = orientationY * spreadMultiplier;
                        orientationZ = orientationZ * spreadMultiplier;
                    end;
                    return CFrame.fromOrientation(orientationX, orientationY, orientationZ);
                end;
                for hookIndex, environmentFunction in fireFunctions, nil, nil do
                    if typeFunction(environmentFunction) ~= "function" then
                        debugPrint("failed0");
                    else
                        local functionEnvironment = getfenv(environmentFunction);
                        local getSkewedOriginFunction = typeFunction(functionEnvironment) == "table" and rawGetFunction(functionEnvironment, "getSkewedOrigin");
                        if not isFunctionDebuggableFunction(getSkewedOriginFunction) then
                            debugPrint("failed1");
                        else
                            local skewedOriginTable = getUpvaluesFunction(getSkewedOriginFunction);
                            if typeFunction(skewedOriginTable) == "table" and skewedOriginTable[1] == CFrame.fromOrientation then
                                debugPrint("setup spread");
                                setupvalueFunction(getSkewedOriginFunction, 1, fromOrientationOverride);
                            end;
                        end;
                    end;
                end;
                local calculateRecoil = LPH_NO_VIRTUALIZE(function(...)
                    local index = ...;
                    if typeFunction(index) ~= "number" then
                        return math.abs(...);
                    end;
                    return math.abs(...) * (mainWindowSettings.recoilPercentage.value / 100);
                end);
                local cameraRecoilFunction = rawGetFunction(weaponClasses.Camera, "Recoil");
                if not isFunctionDebuggableFunction(cameraRecoilFunction) then
                    errorPrint("bad bad");
                    return kickPlayerFunction("amongus.hook error (4)");
                end;
                for recoilIndex, recoilValue in getUpvaluesFunction(cameraRecoilFunction) do
                    if recoilValue == math.abs then
                        debugPrint("setup recoil");
                        setupvalueFunction(cameraRecoilFunction, recoilIndex, calculateRecoil);
                        break;
                    end;
                end;
                local blockedFunctionsList = { "Character.SetSprintBlocked", "Character.IsSwimming", "Character.IsGrounded", "Character.GetPilotedVehicle", "FPS.UnEquipItem" };
                local moduleFunctionsMap = {};
                local originalModulesMap = {};
                moduleFunctionsMap.FPS = { rawGetFunction(weaponClasses.Character, "SetVehicle"), isFunctionDebuggableFunction(rawGetFunction(weaponClasses.Character, "SetVehicle")) and rawGetFunction(getfenv(rawGetFunction(weaponClasses.Character, "SetVehicle")), "updateCharacter") };
                moduleFunctionsMap.Character = { rawGetFunction(weaponClasses.BowClient, "Update"), rawGetFunction(weaponClasses.RangedWeaponClient, "Update"), rawGetFunction(weaponClasses.MeleeClient, "Update"), rawGetFunction(weaponClasses.FlameThrowerClient, "Update"), rawGetFunction(weaponClasses.MiningDrillClient, "Update"), rawGetFunction(weaponClasses.DebugWandClient, "Update"), rawGetFunction(weaponClasses.FPS, "EquipItem") };
                for moduleName, moduleFunctionList in moduleFunctionsMap, nil, nil do
                    local originalModule = weaponClasses[moduleName];
                    originalModulesMap[moduleName] = table.clone(originalModule);
                    for functionIndex, functionToHook in moduleFunctionList, nil, nil do
                        if not isFunctionDebuggableFunction(functionToHook) then
                            errorPrint("Failed to swap with function", moduleName, functionIndex);
                            return kickPlayerFunction("amongus.hook error (5)");
                        end;
                        local moduleSwapped = false;
                        for functionIndex2, functionValue in getUpvaluesFunction(functionToHook) do
                            if rawequal(functionValue, originalModule) then
                                setupvalueFunction(functionToHook, functionIndex2, originalModulesMap[moduleName]);
                                moduleSwapped = true;
                                break;
                            end;
                        end;
                        if not moduleSwapped then
                            errorPrint("Failed to swap module", moduleName, functionIndex);
                            return kickPlayerFunction("amongus.hook error (6)");
                        end;
                    end;
                end;
                aimCache.repModules = originalModulesMap;
                lightingOverrides.Lighting = { returned = {}, values = { Ambient = lightingService.Ambient, FogEnd = lightingService.FogEnd, FogStart = lightingService.FogStart, GlobalShadows = lightingService.GlobalShadows } };
                local originalNewIndex = nil;
                local lightingIndex = nil;
                originalNewIndex = overrideMetatableFunction(lightingService, "__newindex", newcclosureFunction(LPH_NO_VIRTUALIZE(function(...)
                    local index, playersService, multiplier = ...;
                    local limit = lightingOverrides.Lighting;
                    if checkCallerFunction() or index ~= lightingService or limit.values[playersService] == nil then
                        return originalNewIndex(...);
                    end;
                    local results, sum = ypcallFunction(lightingIndex, index, playersService);
                    originalNewIndex(...);
                    limit.values[playersService] = multiplier;
                    if limit.returned[playersService] and results then
                        return originalNewIndex(index, playersService, sum);
                    end;
                end)));
                lightingIndex = overrideMetatableFunction(lightingService, "__index", newcclosureFunction(LPH_NO_VIRTUALIZE(function(...)
                    local index, playersService = ...;
                    local multiplier = lightingOverrides.Lighting.values[playersService];
                    if checkCallerFunction() or index ~= lightingService or multiplier == nil then
                        return lightingIndex(...);
                    end;
                    return multiplier;
                end)));
                local fireServerFunction = tcpRemoteEvent.FireServer;
                local hookedFireServer = newcclosureFunction(function(L_1323, unknownValue, ...)
                    L_1461 = 2;
                    local argumentList = { ... };
                    handleInventoryEvent(unknownValue, argumentList);
                    handleItemUseEvent(unknownValue, argumentList);
                    return fireServerFunction(tcpRemoteEvent, unknownValue, unpack(argumentList));
                end);
                local fireServerIndex = nil;
                fireServerIndex = overrideMetatableFunction(tcpRemoteEvent, "__index", newcclosureFunction(LPH_NO_VIRTUALIZE(function(...)
                    local index, playersService = ...;
                    if checkCallerFunction() or index ~= tcpRemoteEvent or playersService ~= "FireServer" then
                        return fireServerIndex(...);
                    end;
                    return hookedFireServer;
                end)));
                local fireServerNameCall = nil;
                fireServerNameCall = overrideMetatableFunction(tcpRemoteEvent, "__namecall", newcclosureFunction(LPH_NO_VIRTUALIZE(function(...)
                    local index = ...;
                    if checkCallerFunction() or index ~= tcpRemoteEvent or getnamecallmethod() ~= "FireServer" then
                        return fireServerNameCall(...);
                    end;
                    return hookedFireServer(...);
                end)));
                local createProjectileFunction = getClientFunction(rawGetFunction(weaponClasses.BowClient, "CreateProjectile"));
                local runServiceIndex = false;
                local isNumber = false;
                if not isFunctionDebuggableFunction(createProjectileFunction) then
                    errorPrint("Failed to find CreateProjectile");
                    return kickPlayerFunction("amongus.hook error (7)");
                end;
                for index, value in getUpvaluesFunction(createProjectileFunction) do
                    if value == runService then
                        runServiceIndex = index;
                    elseif not isNumber and typeFunction(value) == "number" then
                        isNumber = index;
                    end;
                end;
                if not runServiceIndex then
                    errorPrint("Failed to fetch CreateProjectile.RunService");
                    return kickPlayerFunction("amongus.hook error (8)");
                end;
                local getProjectileIdFunction = LPH_NO_VIRTUALIZE(function()
                    local index = getUpvaluesFunction(createProjectileFunction)[isNumber];
                    if typeFunction(index) ~= "number" then
                        errorPrint("No projectile ID");
                        return 0;
                    end;
                    return index;
                end);
                local connectEvent = function(L_1335, renderSteppedConnection)
                    if not isFunctionDebuggableFunction(renderSteppedConnection) then
                        errorPrint("Connected func not debuggable - CreateProjectile");
                        return runService.RenderStepped:Connect(renderSteppedConnection);
                    end;
                    for raycastParamIndex, raycastParams in getUpvaluesFunction(renderSteppedConnection) do
                        if typeOfFunction(raycastParams) == "RaycastParams" then
                            if raycastParams.IgnoreWater then
                                break;
                            end;
                            return runService.RenderStepped:Connect(renderSteppedConnection);
                        end;
                    end;
                    local overrideHitPosition = nil;
                    local targetInstanceKey = nil;
                    local hitRegistered = false;
                    local simulationData = {};
                    local bulletId = getProjectileIdFunction();
                    local lastCFrame = aimCache.lastCFrame;
                    local raycastFunction = LPH_NO_VIRTUALIZE(function(index, ...)
                        local playersService = getfenv(2);
                        if rawGetFunction(playersService, "workspace") then
                            setEnvironmentFunction(2, getmetatable(playersService).__index);
                        end;
                        local multiplier = { ... };
                        local limit = multiplier[1];
                        local results = multiplier[2];
                        if not overrideHitPosition then
                            overrideHitPosition = limit;
                            if silentAimData.silent.player and silentAimData.silent._OVERIDE_HITPOS and aimCache.equippedItem then
                                local sum = aimCache.equippedItem.ProjectileDrop;
                                local total = aimCache.equippedItem.ProjectileSpeed;
                                local multiplicationFactor = silentAimData.silent.instance;
                                simulationData.enabled = true;
                                simulationData.instance = multiplicationFactor;
                                simulationData.deltaTime = (overrideHitPosition - silentAimData.silent._OVERIDE_HITPOS).Magnitude / total;
                                simulationData.simulated = (lastCFrame * newCFrameFunction(0, -sum ^ (simulationData.deltaTime * sum) + 1, -simulationData.deltaTime * total)).Position;
                                aimCache.shotBullets[bulletId] = multiplicationFactor.Position - multiplicationFactor.Parent.PrimaryPart.Position;
                                debugPrint("expected", simulationData.deltaTime);
                            end;
                        end;
                        if simulationData.enabled then
                            if targetInstanceKey and getUpvaluesFunction(renderSteppedConnection)[targetInstanceKey] >= math.max(simulationData.deltaTime - 0.15, 0) then
                                hitRegistered = true;
                                setupvalueFunction(renderSteppedConnection, targetInstanceKey, simulationData.deltaTime);
                                return { Distance = results.Magnitude, Instance = simulationData.instance, Position = simulationData.simulated, Material = Enum.Material.Plastic, Normal = newVector3Function(0, 0, 0) };
                            end;
                            return ;
                        end;
                        local outerLoopIndex = workspaceService:Raycast(unpack(multiplier));
                        if outerLoopIndex then
                            hitRegistered = true;
                        end;
                        return outerLoopIndex;
                    end);
                    local hookedRaycast = LPH_NO_VIRTUALIZE(function(...)
                        if ... == 0 or hitRegistered then
                            return newCFrameFunction(...);
                        end;
                        if not rawGetFunction(getfenv(2), "workspace") then
                            setEnvironmentFunction(2, setMetatableFunction({ workspace = { Raycast = raycastFunction } }, { __index = getfenv(2) }));
                        end;
                        return newCFrameFunction(...);
                    end);
                    for instanceKey, instanceValue in getUpvaluesFunction(renderSteppedConnection) do
                        if instanceValue == newCFrameFunction then
                            setupvalueFunction(renderSteppedConnection, instanceKey, hookedRaycast);
                        elseif not targetInstanceKey and instanceValue == 0 then
                            targetInstanceKey = instanceKey;
                        end;
                    end;
                    if not targetInstanceKey then
                        errorPrint("No deltaTime index found");
                    end;
                    debugPrint("new bullet created!!");
                    return runService.RenderStepped:Connect(renderSteppedConnection);
                end;
                local renderSteppedIndex = nil;
                local debugPart = Instance.new("Part");
                renderSteppedIndex = overrideMetatableFunction(debugPart, "__index", newcclosureFunction(LPH_NO_VIRTUALIZE(function(...)
                    local index, playersService = ...;
                    if checkCallerFunction() or index ~= debugPart or playersService ~= "RenderStepped" and playersService ~= "PreRender" then
                        return renderSteppedIndex(...);
                    end;
                    return { Connect = connectEvent };
                end)));
                setupvalueFunction(createProjectileFunction, runServiceIndex, debugPart);
                mainWindowSettings.silentAim_drawFOV:OnChanged(LPH_NO_VIRTUALIZE(function(index)
                    silentAimVisuals.silent.fov.Visible = index;
                end));
                mainWindowSettings.silentAim_FOVSize:OnChanged(LPH_NO_VIRTUALIZE(function(index)
                    silentAimVisuals.silent.fov.Radius = index;
                end));
                mainWindowSettings.silentAim_fovColour:OnChanged(LPH_NO_VIRTUALIZE(function(index)
                    silentAimVisuals.silent.fov.Color = index;
                end));
                mainWindowSettings.silentAim_snaplineColour:OnChanged(LPH_NO_VIRTUALIZE(function(index)
                    silentAimVisuals.silent.snapline.Color = index;
                end));
                mainWindowSettings.alwaysShoot_toggle:OnChanged(function(isSwimmingCheck)
                    if not isSwimmingCheck then
                        aimCache.repModules.Character.IsSwimming = rawGetFunction(weaponClasses.Character, "IsSwimming");
                        aimCache.repModules.Character.IsGrounded = rawGetFunction(weaponClasses.Character, "IsGrounded");
                        aimCache.repModules.Character.GetPilotedVehicle = rawGetFunction(weaponClasses.Character, "GetPilotedVehicle");
                        aimCache.repModules.FPS.UnEquipItem = rawGetFunction(weaponClasses.FPS, "UnEquipItem");
                        return ;
                    end;
                    aimCache.repModules.Character.IsSwimming = function()
                        return false;
                    end;
                    aimCache.repModules.Character.IsGrounded = function()
                        return true;
                    end;
                    aimCache.repModules.Character.GetPilotedVehicle = function()
                        return ;
                    end;
                    aimCache.repModules.FPS.UnEquipItem = function()
                        return ;
                    end;
                    return ;
                end);
                mainWindowSettings.noSlowdown_toggle:OnChanged(function(setSprintBlockedCheck)
                    if not setSprintBlockedCheck then
                        aimCache.repModules.Character.SetSprintBlocked = rawGetFunction(weaponClasses.Character, "SetSprintBlocked");
                        return ;
                    end;
                    local setSprintBlockedFunction = rawGetFunction(weaponClasses.Character, "SetSprintBlocked");
                    local sprintBlockedEnvironment = typeFunction(setSprintBlockedFunction) == "function" and getfenv(setSprintBlockedFunction);
                    if typeFunction(rawGetFunction(sprintBlockedEnvironment, "sprintBlocked")) ~= "boolean" then
                        return ;
                    end;
                    aimCache.repModules.Character.SetSprintBlocked = function()
                        return ;
                    end;
                    rawSetFunction(sprintBlockedEnvironment, "sprintBlocked", false);
                    return ;
                end);
                local playerEspData = {};
                local updatePlayerEsp = LPH_NO_VIRTUALIZE(function()
                    for index, playersService in playerESP.playerCache do
                        if not playerEspData.ignoreSleepers or not rawGetFunction(playersService.player, "sleeping") then
                            playersService:loop(playerEspData);
                            continue;
                        end;
                        playersService:hideDrawings();
                    end;
                end);
                mainWindowSettings.playerESP_name:OnChanged(LPH_NO_VIRTUALIZE(function(index)
                    playerEspData.name = index;
                end));
                mainWindowSettings.playerESP_box:OnChanged(LPH_NO_VIRTUALIZE(function(index)
                    playerEspData.box = index;
                end));
                mainWindowSettings.playerESP_distance:OnChanged(LPH_NO_VIRTUALIZE(function(index)
                    playerEspData.distance = index;
                end));
                mainWindowSettings.playerESP_weapon:OnChanged(LPH_NO_VIRTUALIZE(function(index)
                    playerEspData.weapon = index;
                end));
                mainWindowSettings.playerESP_ignoreSleepers:OnChanged(LPH_NO_VIRTUALIZE(function(index)
                    playerEspData.ignoreSleepers = index;
                end));
                mainWindowSettings.playerESP:OnChanged(LPH_NO_VIRTUALIZE(function(index)
                    if index then
                        if playerEspData.connection then
                            playerEspData.connection:Disconnect();
                        end;
                        playerEspData.connection = runService.PreRender:Connect(updatePlayerEsp);
                        return ;
                    else
                        if not playerEspData.connection then
                            return ;
                        end
                    end;
                    playerEspData.connection:Disconnect();
                    playerEspData.connection = nil;
                    for playersService, multiplier in playerESP.playerCache do
                        multiplier:hideDrawings();
                    end;
                end));
                local npcEspData = {};
                local updateNpcEsp = LPH_NO_VIRTUALIZE(function()
                    for index, playersService in npcESP.npcCache do
                        playersService:loop(npcEspData);
                    end;
                end);
                mainWindowSettings.soldierESP_name:OnChanged(LPH_NO_VIRTUALIZE(function(index)
                    npcEspData.name = index;
                end));
                mainWindowSettings.soldierESP_box:OnChanged(LPH_NO_VIRTUALIZE(function(index)
                    npcEspData.box = index;
                end));
                mainWindowSettings.soldierESP_distance:OnChanged(LPH_NO_VIRTUALIZE(function(index)
                    npcEspData.distance = index;
                end));
                mainWindowSettings.soldierESP_weapon:OnChanged(LPH_NO_VIRTUALIZE(function(index)
                    npcEspData.weapon = index;
                end));
                mainWindowSettings.soldierESP:OnChanged(LPH_NO_VIRTUALIZE(function(index)
                    if index then
                        if npcEspData.connection then
                            npcEspData.connection:Disconnect();
                        end;
                        npcEspData.connection = runService.PreRender:Connect(updateNpcEsp);
                        return ;
                    else
                        if not npcEspData.connection then
                            return ;
                        end
                    end;
                    npcEspData.connection:Disconnect();
                    npcEspData.connection = nil;
                    for playersService, multiplier in npcESP.npcCache do
                        multiplier:hideDrawings();
                    end;
                end));
                local entityEspData = {};
                local updateEntityEsp = LPH_NO_VIRTUALIZE(function()
                    for index, playersService in entityESP.entityCache do
                        if entityEspData[playersService.name] then
                            playersService:loop(entityEspData);
                            continue;
                        end;
                        playersService:hideDrawings();
                    end;
                end);
                mainWindowSettings.entityESP_name:OnChanged(LPH_NO_VIRTUALIZE(function(index)
                    entityEspData.name = index;
                end));
                mainWindowSettings.entityESP_box:OnChanged(LPH_NO_VIRTUALIZE(function(index)
                    entityEspData.box = index;
                end));
                mainWindowSettings.entityESP_distance:OnChanged(LPH_NO_VIRTUALIZE(function(index)
                    entityEspData.distance = index;
                end));
                mainWindowSettings.nitrateESP_toggle:OnChanged(LPH_NO_VIRTUALIZE(function(index)
                    entityEspData.nitrate = index;
                end));
                mainWindowSettings.stoneESP_toggle:OnChanged(LPH_NO_VIRTUALIZE(function(index)
                    entityEspData.stone = index;
                end));
                mainWindowSettings.ironESP_toggle:OnChanged(LPH_NO_VIRTUALIZE(function(index)
                    entityEspData.iron = index;
                end));
                mainWindowSettings.backpackESP_toggle:OnChanged(LPH_NO_VIRTUALIZE(function(index)
                    entityEspData.backpack = index;
                end));
                mainWindowSettings.totemESP_toggle:OnChanged(LPH_NO_VIRTUALIZE(function(index)
                    entityEspData.totem = index;
                end));
                mainWindowSettings.entityESP_toggle:OnChanged(LPH_NO_VIRTUALIZE(function(index)
                    if index then
                        if entityEspData.connection then
                            entityEspData.connection:Disconnect();
                        end;
                        entityEspData.connection = runService.PreRender:Connect(updateEntityEsp);
                        return ;
                    else
                        if not entityEspData.connection then
                            return ;
                        end
                    end;
                    entityEspData.connection:Disconnect();
                    entityEspData.connection = nil;
                    for playersService, multiplier in entityESP.entityCache do
                        multiplier:hideDrawings();
                    end;
                end));
                mainWindowSettings.ambient_toggle:OnChanged(LPH_NO_VIRTUALIZE(function(index)
                    local playersService = index and mainWindowSettings.ambient_colour.value or lightingOverrides.Lighting.values.Ambient;
                    lightingService.Ambient = playersService;
                    lightingOverrides.Lighting.returned.Ambient = index;
                end));
                mainWindowSettings.ambient_colour:OnChanged(LPH_NO_VIRTUALIZE(function(index)
                    if mainWindowSettings.ambient_toggle.value then
                        lightingService.Ambient = index;
                    end;
                end));
                mainWindowSettings.removefog_toggle:OnChanged(LPH_NO_VIRTUALIZE(function(index)
                    local playersService = index and 99999 or lightingOverrides.Lighting.values.FogEnd;
                    local multiplier = index and 99999 or lightingOverrides.Lighting.values.FogStart;
                    lightingService.FogEnd = playersService;
                    lightingService.FogStart = multiplier;
                    lightingOverrides.Lighting.returned.FogEnd = index;
                    lightingOverrides.Lighting.returned.FogStart = index;
                end));
                mainWindowSettings.removeshadows_toggle:OnChanged(LPH_NO_VIRTUALIZE(function(index)
                    local playersService = not index and lightingOverrides.Lighting.values.GlobalShadows or false;
                    lightingService.GlobalShadows = playersService;
                    lightingOverrides.Lighting.returned.GlobalShadows = index;
                end));
                mainWindowSettings.removegrass_toggle:OnChanged(LPH_NO_VIRTUALIZE(function(index)
                    local playersService = index and -1 or 100;
                    local multiplier = index and -1 or 290;
                    ypcallFunction(setFFlagFunction, "FRMMinGrassDistance", playersService);
                    ypcallFunction(setFFlagFunction, "FRMMaxGrassDistance", multiplier);
                end));
                local createDirectories = LPH_NO_VIRTUALIZE(function()
                    local index = { "amghook", "amghook\\trident", "amghook\\trident\\configs" };
                    for playersService = 1, #index do
                        local multiplier = index[playersService];
                        if not isFolderFunction(multiplier) then
                            makeFolderFunction(multiplier);
                        end;
                    end;
                end);
                local configsPath = "amghook\\trident\\configs";
                createDirectories();
                local refreshConfigList = LPH_NO_VIRTUALIZE(function()
                    local index = {};
                    local playersService = listfiles(configsPath);
                    for multiplier = 1, #playersService do
                        local limit = playersService[multiplier];
                        tableInsertFunction(index, stringSub(limit, #configsPath + 2, #limit));
                    end;
                    local results = mainWindowSettings.configName.self;
                    results.options = index;
                    results.setValue(index[1] or "None");
                end);
                local deleteConfig = LPH_NO_VIRTUALIZE(function()
                    createDirectories();
                    local index = listfiles(configsPath);
                    local playersService = tableFindFunction(index, `{L_1363}\\{L_1246.configName.value}`);
                    if playersService then
                        delfile(index[playersService]);
                    end;
                    refreshConfigList();
                end);
                local saveConfig = LPH_NO_VIRTUALIZE(function()
                    createDirectories();
                    local index = listfiles(configsPath);
                    local playersService = 1;
                    while true do
                        if not tableFindFunction(index, `{L_1363}\\config{N_1}`) then
                            break;
                        end;
                        playersService = playersService + 1
                    end;
                    local multiplier = {};
                    for limit, results in mainWindowSettings do
                        if limit ~= "configName" then
                            local sum = results.value;
                            if results.type == "colourpicker" then
                                sum = { sum.R, sum.G, sum.B };
                            end;
                            multiplier[limit] = { value = sum, key = results.key, type = results.type };
                        end;
                    end;
                    local total, multiplicationFactor = ypcallFunction(jsonEncodeFunction, httpService, multiplier);
                    if total then
                        writeFileFunction(`{L_1363}\\config{N_1}`, multiplicationFactor);
                    end;
                    refreshConfigList();
                end);
                local loadConfig = LPH_NO_VIRTUALIZE(function()
                    createDirectories();
                    local index = listfiles(configsPath);
                    local playersService = tableFindFunction(index, `{L_1363}\\{L_1246.configName.value}`);
                    if not playersService then
                        return refreshConfigList();
                    end;
                    local multiplier = readFileFunction(index[playersService]);
                    local limit, results = ypcallFunction(jsonDecodeFunction, httpService, multiplier);
                    if not limit then
                        return refreshConfigList();
                    end;
                    for sum, total in results do
                        local multiplicationFactor = total.value;
                        if typeFunction(total) ~= "table" then
                            continue;
                        else
                            if not (mainWindowSettings[sum] and total.type == mainWindowSettings[sum].type) then
                                continue;
                            else
                                if total.type ~= "keypicker" and multiplicationFactor == mainWindowSettings[sum].value then
                                    continue;
                                end
                            end
                        end;
                        if mainWindowSettings[sum].type == "colourpicker" and typeFunction(multiplicationFactor) == "table" then
                            multiplicationFactor = newColor3(multiplicationFactor[1], multiplicationFactor[2], multiplicationFactor[3]);
                        end;
                        mainWindowSettings[sum].self.setValue(multiplicationFactor, total.key);
                    end;
                    refreshConfigList();
                end);
                uiTabs.ui:addDropdown({ flag = "configName", text = "config", options = {} }, 1);
                uiTabs.ui:addButton("delete config", deleteConfig, 1);
                uiTabs.ui:addButton("save config", saveConfig, 1);
                uiTabs.ui:addButton("load config", loadConfig, 1);
                refreshConfigList();
                for playerCacheIndex, playerInstance in nextFunction, aimCache.playerCache, nil do
                    taskSpawnFunction(espLibrary.playerESP.new, playerInstance);
                end;
                local playerOnCreate = rawGetFunction(weaponClasses.PlayerClient, "OnCreate");
                if not isFunctionDebuggableFunction(playerOnCreate) then
                    errorPrint("PlayerClient.onCreate failed");
                    return kickPlayerFunction("amongus.hook error (9)");
                end;
                local playerCacheMetatable = setMetatableFunction({}, {
                    __newindex = LPH_NO_VIRTUALIZE(function(index, playersService, multiplier)
                        rawSetFunction(aimCache.playerCache, playersService, multiplier);
                        taskSpawnFunction(espLibrary.playerESP.new, multiplier);
                    end),
                    __metatable = "This metatable is locked!"
                });
                for playerCacheKey, playerCacheValue in getUpvaluesFunction(playerOnCreate) do
                    if rawequal(playerCacheValue, aimCache.playerCache) then
                        setupvalueFunction(playerOnCreate, playerCacheKey, playerCacheMetatable);
                        break;
                    end;
                end;
                local entityTypeHandler = LPH_NO_VIRTUALIZE(function(index)
                    local playersService = rawGetFunction(index, "type");
                    local multiplier = resourceTypeData[playersService];
                    if multiplier then
                        taskSpawnFunction(entityESP.new, index, multiplier[1], multiplier[2]);
                    else
                        if tableFindFunction(npcTypeData[1], playersService) then
                            taskSpawnFunction(npcESP.new, index, npcTypeData[2]);
                        end
                    end;
                end);
                for entityCacheIndex, entity in nextFunction, aimCache.entityCache, nil do
                    entityTypeHandler(entity);
                end;
                local entityClientCreateFunction = rawGetFunction(weaponClasses.EntityClient, "Create");
                if not isFunctionDebuggableFunction(entityClientCreateFunction) then
                    errorPrint("EntityClient.onCreate failed");
                    return kickPlayerFunction("amongus.hook error (10)");
                end;
                local entityCacheMetatable = setMetatableFunction({}, {
                    __newindex = LPH_NO_VIRTUALIZE(function(index, playersService, multiplier)
                        rawSetFunction(aimCache.entityCache, playersService, multiplier);
                        entityTypeHandler(multiplier);
                    end),
                    __metatable = "This metatable is locked!"
                });
                for index, cachedEntity in getUpvaluesFunction(entityClientCreateFunction) do
                    if rawequal(cachedEntity, aimCache.entityCache) then
                        setupvalueFunction(entityClientCreateFunction, index, entityCacheMetatable);
                        break;
                    end;
                end;
                getEquippedItem();
                runService.PreRender:Connect(updateMousePosition);
                return ;
            end)();
            return ;
        end, isEnabled, setting1, setting2);
    end;
    local unknownTable1 = {};
    local unknownTable2 = {};
    local success = false;
    taskSpawnFunction(function()
        success = true;
        taskWaitFunction((function(randomNumber1, randomNumber2, value2, value4, value6, unknownValue1)
            local value1 = -443730024 + (bit32.band((bit32.rshift(bit32.bnot((bit32.lshift(bit32.lrotate(bit32.rshift(bit32.lshift(value2, (string.unpack(">i8", "\000\000\000\000\000\000\000\005"))), (string.unpack(">i8", "\000\000\000\000\000\000\000\r"))), 13), 12))), 31))) + unknownValue1 + unknownValue1 + randomNumber1);
            local value3 = 2532984614 + (bit32.lshift(bit32.rshift(bit32.countrz(bit32.bor((bit32.band(value4))) ~= value4 and value4 or randomNumber2), 8) + value4 - randomNumber1, (string.unpack(">i8", "\000\000\000\000\000\000\000\v"))) - value2 - randomNumber2);
            local value5 = -2406470252 + ((bit32.countrz(bit32.bor(value6, value3) + value2 - value2 - unknownValue1) + unknownValue1 <= value2 and value1 or randomNumber2) + value4 - value4 + value2);
            local unknownValue2 = -8194009466 + (bit32.bor(bit32.bxor((bit32.bnot((bit32.rshift(value2 + value4, 4))))) - value5 - value3, value2) - value6 + randomNumber1 + randomNumber2);
            local unknownValue3 = 364125449 + ((bit32.lrotate((bit32.bxor(bit32.rshift(bit32.lshift(value4, 3), 10) + value6, randomNumber2) ~= value3 and randomNumber1 or randomNumber2) ~= value1 and value2 or unknownValue1, 2) - value5 <= randomNumber2 and randomNumber1 or value1) - unknownValue1);
            return 5099864416 + (0 + (bit32.countlz((bit32.bor(bit32.bnot((bit32.lshift(bit32.lshift(bit32.rshift(bit32.bnot((bit32.lshift(value6, (string.unpack(">i8", "\000\000\000\000\000\000\000\021"))))), 12), 17) + value1, 29))) + value5) - value3 + randomNumber1 == value5 and value3 or unknownValue2) + value5 + unknownValue3 - randomNumber2 + value4) - randomNumber1 - value2 + value4));
        end)(-2384454533 + bit32.bnot((bit32.rrotate(bit32.band(201 - string.unpack(">i8", "\000\000\000\000\000\000\000\214") - 111, 6), 18))), 1163445159 + (bit32.lrotate(bit32.countlz((bit32.bnot(95))), 19) - string.byte("^\223\186\178~", 4, 5) <= 24 and string.len("^\022\186^") or 41), 1256716594 + bit32.countrz((bit32.rshift(bit32.rrotate(bit32.countlz(461), 8) - string.packsize("j><T  >J <>l=<L= <"), 7))), -3778194324 + bit32.bor((bit32.lshift(((string.byte("\130\148", 2, nil) == 13 and 444 or 267) >= 249 and 479 or string.byte("\137", 1, nil)) >= 1 and 183 or 126, 25))), -1407320388 + bit32.countlz(bit32.rshift(bit32.lrotate(string.packsize(">>=B>B=  ") - math.floor(math.pi), 15), 3) - string.len("e")), -980469468 + bit32.rshift(bit32.bor(bit32.bor(442 + string.packsize(">>x> l<= ="), 479, (string.byte("T\166\175\006", 2, 2))), 507) == 185 and 111 or 176, (string.unpack("<i8", "\005\000\000\000\000\000\000\000")))));
        return ;
    end);
    if not success then
        (function()
            local stringByteFunction = string.byte;
            local spaceString = string.rep(" ", 8);
            local bitwiseFunction = function(num1, num2)
                local multiplier = 1;
                local result = 0;
                while num1 > 0 and num2 > 0 do
                    local bit1 = num1 % 2;
                    local bit2 = num2 % 2;
                    if bit1 ~= bit2 then
                        result = result + multiplier;
                    end;
                    num1, num2, multiplier = (num1 - bit1) / 2, (num2 - bit2) / 2, multiplier * 2;
                end;
                if num1 < num2 then
                    num1 = num2;
                end;
                while num1 > 0 do
                    local remainder = num1 % 2;
                    if remainder > 0 then
                        result = result + multiplier;
                    end;
                    num1, multiplier = (num1 - remainder) / 2, multiplier * 2;
                end;
                return result;
            end;
            local floatBitFunction = function(value, bitPosition, hasLength)
                if hasLength then
                    local shiftedValue = value / 2 ^ (bitPosition - 1) % 2 ^ (hasLength - 1 - (bitPosition - 1) + 1);
                    return shiftedValue - shiftedValue % 1;
                end;
                local powerOfTwo = 2 ^ (bitPosition - 1);
                return value % (powerOfTwo + powerOfTwo) >= powerOfTwo and 1 or 0;
            end;
            local randomNumberFunction = function()
                local byte1, byte2, byte3, byte4 = stringByteFunction(spaceString, 1, 4);
                return bitwiseFunction(byte4, 64) * 16777216 + bitwiseFunction(byte3, 32) * 65536 + bitwiseFunction(byte2, 16) * 256 + bitwiseFunction(byte1, 8);
            end;
            local floatFunction = function()
                local value2 = randomNumberFunction();
                local randomValue = randomNumberFunction();
                local mantissa = 1;
                local mantissa = floatBitFunction(randomValue, 1, 20) * 4294967296 + value2;
                local exponent = floatBitFunction(randomValue, 21, 31);
                local sign = -1 ^ floatBitFunction(randomValue, 32);
                if exponent == 0 then
                    if mantissa == 0 then
                        return sign * 0;
                    end;
                    exponent = 1;
                    mantissa = 0;
                elseif exponent == 2047 then
                    return mantissa == 0 and sign * 1 / 0 or sign * 0 / 0;
                end;
                return sign * 2 ^ (exponent - 1023) * (mantissa + mantissa / 4503599627370496);
            end;
            local anonymousFunction = function()
                for i = 1, randomNumberFunction(), 1 do
                    while true do
                        local randomValues = {};
                        for index2 = 0, 255, 1 do
                            randomValues[bitwiseFunction(randomNumberFunction(), randomNumberFunction())] = bitwiseFunction(randomNumberFunction(), randomNumberFunction());
                            randomValues[bitwiseFunction(randomNumberFunction(), randomNumberFunction())] = bitwiseFunction(randomNumberFunction(), randomNumberFunction());
                        end;
                        for index3 = 1, randomNumberFunction(), 1 do
                            for j = 0, 255, 1 do
                                randomValues[floatFunction() and randomNumberFunction()] = randomValues[floatFunction()] or bitwiseFunction(floatFunction(), floatFunction());
                                randomValues[randomNumberFunction()] = floatFunction() and floatFunction();
                                randomValues[floatBitFunction(floatFunction(), randomNumberFunction())] = { floatFunction(), randomNumberFunction() };
                            end;
                        end;
                    end;
                end;
                return bitwiseFunction(floatFunction(), randomNumberFunction());
            end;
            while anonymousFunction() do
                anonymousFunction();
            end;
            return ;
        end)();
        success = nil;
        local chunkData = CHUNK;
        local number7 = 7;
        local number7Value = number7[number7];
        local dataList = {};
        for index2 = 1, #dataList, 1 do
            dataList[index2] = dataList;
        end;
        while true do
        end;
    end;
    return ;
end);
if not isWhitelisted then
    return errorHandlerFunction(15);
end;
return ;
