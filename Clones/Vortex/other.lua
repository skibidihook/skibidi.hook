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
if not game:IsLoaded() then
    game.Loaded:Wait();
end;
local L_0 = LPH_NO_VIRTUALIZE(function(N_0)
    local N_1 = game:GetService("Players");
    if not N_1.LocalPlayer then
        N_1:GetPropertyChangedSignal("LocalPlayer"):Wait();
    end;
    return N_1.LocalPlayer:Kick(`MSPROTECT - {N_0}\10`);
end);
for L_1 = 1, 1000, 1 do
    if not debug.info(L_1, "f") then
        if L_1 == 3 then
            break;
        end;
        return L_0("Please ensure the script is being ran from the loader!");
    end;
end;
local L_2 = nil;
local L_3 = nil;
local L_4 = nil;
local L_5 = game;
local L_6 = workspace;
local L_7 = http_request or request or http and http.request;
local L_8 = messagebox or function()
    return ;
end;
local L_9 = ypcall;
local L_10 = xpcall;
local L_11 = setfenv;
local L_12 = setmetatable;
local L_13 = debug.info;
local L_14 = task.spawn;
local L_15 = task.wait;
local L_16 = string.format;
local L_17 = string.split;
local L_18 = string.sub;
local L_19 = {};
local L_157 = function(...)
    local L_20, L_21, L_22 = ...;
    local L_23 = nil;
    L_14(function()
        L_23 = true;
        return ;
    end);
    if L_23 then
    end;
    if L_21 then
        return ;
    end;
    L_14(L_9, function()
        L_8((function(...)
            local L_24 = ...;
            local L_25 = 670504900 + ((bit32.band((bit32.lrotate(string.len("\030\147") + 123, 3))) >= 152 and 14 or 182) - 307);
            local L_26 = STACK;
            local L_27 = string.char;
            local L_28 = string.byte;
            local L_29 = setmetatable;
            local L_30 = getmetatable;
            local L_31 = next;
            local L_32 = { [0] = { [0] = 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 }, { [0] = 1, 0, 3, 2, 5, 4, 7, 6, 9, 8, 11, 10, 13, 12, 15, 14 }, { [0] = 2, 3, 0, 1, 6, 7, 4, 5, 10, 11, 8, 9, 14, 15, 12, 13 }, { [0] = 3, 2, 1, 0, 7, 6, 5, 4, 11, 10, 9, 8, 15, 14, 13, 12 }, { [0] = 4, 5, 6, 7, 0, 1, 2, 3, 12, 13, 14, 15, 8, 9, 10, 11 }, { [0] = 5, 4, 7, 6, 1, 0, 3, 2, 13, 12, 15, 14, 9, 8, 11, 10 }, { [0] = 6, 7, 4, 5, 2, 3, 0, 1, 14, 15, 12, 13, 10, 11, 8, 9 }, { [0] = 7, 6, 5, 4, 3, 2, 1, 0, 15, 14, 13, 12, 11, 10, 9, 8 }, { [0] = 8, 9, 10, 11, 12, 13, 14, 15, 0, 1, 2, 3, 4, 5, 6, 7 }, { [0] = 9, 8, 11, 10, 13, 12, 15, 14, 1, 0, 3, 2, 5, 4, 7, 6 }, { [0] = 10, 11, 8, 9, 14, 15, 12, 13, 2, 3, 0, 1, 6, 7, 4, 5 }, { [0] = 11, 10, 9, 8, 15, 14, 13, 12, 3, 2, 1, 0, 7, 6, 5, 4 }, { [0] = 12, 13, 14, 15, 8, 9, 10, 11, 4, 5, 6, 7, 0, 1, 2, 3 }, { [0] = 13, 12, 15, 14, 9, 8, 11, 10, 5, 4, 7, 6, 1, 0, 3, 2 }, { [0] = 14, 15, 12, 13, 10, 11, 8, 9, 6, 7, 4, 5, 2, 3, 0, 1 }, { [0] = 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0 } };
            local L_39 = function(L_33, L_34)
                local L_35 = 1;
                local L_36 = 0;
                while L_33 > 0 and L_34 > 0 do
                    local L_37 = L_33 % 16;
                    local L_38 = L_34 % 16;
                    L_36 = L_36 + L_32[L_37][L_38] * L_35;
                    L_33 = (L_33 - L_37) / 16;
                    L_34 = (L_34 - L_38) / 16;
                    L_35 = L_35 * 16;
                end;
                return L_36 + L_33 * L_35 + L_34 * L_35;
            end;
            local L_40 = function()
                L_39 = function()
                    return 0;
                end;
                L_25 = 0;
                while true do
                end;
            end;
            local L_41 = function(...)
                return ...;
            end;
            local L_42 = L_29({}, { __tostring = L_40, __call = L_41, __add = L_41, __sub = L_41, __mul = L_41, __div = L_41, __mod = L_41, __pow = L_41, __eq = L_41, __lt = L_41, __le = L_41, __concat = L_41, __index = L_41, __newindex = L_41, __metatable = false });
            local L_43 = L_42(L_42, L_42, L_42());
            local L_44 = (function(...)
                return ...;
            end)(L_42, L_42) and L_42 or L_42;
            local L_45 = L_42 + L_42 - L_42 * L_42 / L_42 % L_42 ^ L_42;
            local L_46 = L_42 == L_42 and L_42 ~= L_42;
            local L_47 = L_42 < L_42 and L_42 > L_42;
            local L_48 = L_42 <= L_42 and L_42 >= L_42;
            L_42(L_42, L_42, L_42(L_42), L_42());
            L_42(L_42 .. L_42, L_42 .. "", "" .. L_42);
            L_42[L_42] = L_42;
            L_42[L_42] = L_42[L_42];
            if not L_26 or (type(L_26) ~= "table" or L_30(L_26) ~= nil) then
                return L_40();
            end;
            L_29(L_26, nil);
            local L_49 = {};
            local L_50 = {};
            local L_51 = false;
            for L_52, L_53 in L_31, L_26, nil do
                if L_49 == L_53 then
                    L_51 = true;
                    L_26[L_52] = L_50;
                end;
            end;
            if not L_51 or L_49 ~= L_50 then
                return L_40();
            end;
            local L_54 = { nil, nil, nil, nil, L_28(L_24, 1, 4) };
            for L_55 = 1, 4, 1 do
                L_54[L_55] = L_25 % 256;
                L_25 = L_25 / 256;
                L_25 = L_25 - L_25 % 1;
            end;
            local L_56 = L_54[3];
            local L_57 = 4 * (L_54[1] % 64) + 1;
            local L_58 = 2 * (L_54[2] % 128) - 1;
            local L_59 = {};
            local L_60 = {};
            for L_61 = 0, 255, 1 do
                L_59[L_56] = L_27(L_56);
                L_60[L_56] = L_56;
                L_56 = (L_57 * L_56 + L_58) % 256;
            end;
            local L_62 = 0;
            for L_63 = 0, 255, 1 do
                L_62 = (L_62 + L_60[L_63] + L_54[L_63 % 8 + 1]) % 256;
                local L_64;
                L_60[L_63], L_64 = L_60[L_62], L_60[L_63];
                L_60[L_62] = L_64;
            end;
            local L_65 = 0;
            local L_66 = 0;
            local L_67 = "";
            for L_68 = 5, #L_24, 1 do
                L_65 = (L_65 + 1) % 256;
                L_66 = (L_66 + L_60[L_65]) % 256;
                local L_69;
                L_60[L_65], L_69 = L_60[L_66], L_60[L_65];
                L_60[L_66] = L_69;
                L_67 = L_67 .. L_59[L_39(L_28(L_24, L_68), L_60[(L_60[L_65] + L_60[L_66]) % 256])];
            end;
            return L_67;
        end)("\031s\197\214K\002\196\138\143\237\191\166c\179/\220Ef\026UW\242R\133\164\235A&\198\144\222qc\138\249\162\232\217-\196Z\144z\237\030\170\000\229\183\204\002\183\212r\204\179GE\205\167\198v\181\176\\\149$\161$g"), (function(...)
            local L_70 = ...;
            local L_71 = 670504900 + ((bit32.band((bit32.lrotate(string.len("\030\147") + 123, 3))) >= 152 and 14 or 182) - 307);
            local L_72 = STACK;
            local L_73 = string.char;
            local L_74 = string.byte;
            local L_75 = setmetatable;
            local L_76 = getmetatable;
            local L_77 = next;
            local L_78 = { [0] = { [0] = 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 }, { [0] = 1, 0, 3, 2, 5, 4, 7, 6, 9, 8, 11, 10, 13, 12, 15, 14 }, { [0] = 2, 3, 0, 1, 6, 7, 4, 5, 10, 11, 8, 9, 14, 15, 12, 13 }, { [0] = 3, 2, 1, 0, 7, 6, 5, 4, 11, 10, 9, 8, 15, 14, 13, 12 }, { [0] = 4, 5, 6, 7, 0, 1, 2, 3, 12, 13, 14, 15, 8, 9, 10, 11 }, { [0] = 5, 4, 7, 6, 1, 0, 3, 2, 13, 12, 15, 14, 9, 8, 11, 10 }, { [0] = 6, 7, 4, 5, 2, 3, 0, 1, 14, 15, 12, 13, 10, 11, 8, 9 }, { [0] = 7, 6, 5, 4, 3, 2, 1, 0, 15, 14, 13, 12, 11, 10, 9, 8 }, { [0] = 8, 9, 10, 11, 12, 13, 14, 15, 0, 1, 2, 3, 4, 5, 6, 7 }, { [0] = 9, 8, 11, 10, 13, 12, 15, 14, 1, 0, 3, 2, 5, 4, 7, 6 }, { [0] = 10, 11, 8, 9, 14, 15, 12, 13, 2, 3, 0, 1, 6, 7, 4, 5 }, { [0] = 11, 10, 9, 8, 15, 14, 13, 12, 3, 2, 1, 0, 7, 6, 5, 4 }, { [0] = 12, 13, 14, 15, 8, 9, 10, 11, 4, 5, 6, 7, 0, 1, 2, 3 }, { [0] = 13, 12, 15, 14, 9, 8, 11, 10, 5, 4, 7, 6, 1, 0, 3, 2 }, { [0] = 14, 15, 12, 13, 10, 11, 8, 9, 6, 7, 4, 5, 2, 3, 0, 1 }, { [0] = 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0 } };
            local L_85 = function(L_79, L_80)
                local L_81 = 1;
                local L_82 = 0;
                while L_79 > 0 and L_80 > 0 do
                    local L_83 = L_79 % 16;
                    local L_84 = L_80 % 16;
                    L_82 = L_82 + L_78[L_83][L_84] * L_81;
                    L_79 = (L_79 - L_83) / 16;
                    L_80 = (L_80 - L_84) / 16;
                    L_81 = L_81 * 16;
                end;
                return L_82 + L_79 * L_81 + L_80 * L_81;
            end;
            local L_86 = function()
                L_85 = function()
                    return 0;
                end;
                L_71 = 0;
                while true do
                end;
            end;
            local L_87 = function(...)
                return ...;
            end;
            local L_88 = L_75({}, { __tostring = L_86, __call = L_87, __add = L_87, __sub = L_87, __mul = L_87, __div = L_87, __mod = L_87, __pow = L_87, __eq = L_87, __lt = L_87, __le = L_87, __concat = L_87, __index = L_87, __newindex = L_87, __metatable = false });
            local L_89 = L_88(L_88, L_88, L_88());
            local L_90 = (function(...)
                return ...;
            end)(L_88, L_88) and L_88 or L_88;
            local L_91 = L_88 + L_88 - L_88 * L_88 / L_88 % L_88 ^ L_88;
            local L_92 = L_88 == L_88 and L_88 ~= L_88;
            local L_93 = L_88 < L_88 and L_88 > L_88;
            local L_94 = L_88 <= L_88 and L_88 >= L_88;
            L_88(L_88, L_88, L_88(L_88), L_88());
            L_88(L_88 .. L_88, L_88 .. "", "" .. L_88);
            L_88[L_88] = L_88;
            L_88[L_88] = L_88[L_88];
            if not L_72 or (type(L_72) ~= "table" or L_76(L_72) ~= nil) then
                return L_86();
            end;
            L_75(L_72, nil);
            local L_95 = {};
            local L_96 = {};
            local L_97 = false;
            for L_98, L_99 in L_77, L_72, nil do
                if L_95 == L_99 then
                    L_97 = true;
                    L_72[L_98] = L_96;
                end;
            end;
            if not L_97 or L_95 ~= L_96 then
                return L_86();
            end;
            local L_100 = { nil, nil, nil, nil, L_74(L_70, 1, 4) };
            for L_101 = 1, 4, 1 do
                L_100[L_101] = L_71 % 256;
                L_71 = L_71 / 256;
                L_71 = L_71 - L_71 % 1;
            end;
            local L_102 = L_100[3];
            local L_103 = 4 * (L_100[1] % 64) + 1;
            local L_104 = 2 * (L_100[2] % 128) - 1;
            local L_105 = {};
            local L_106 = {};
            for L_107 = 0, 255, 1 do
                L_105[L_102] = L_73(L_102);
                L_106[L_102] = L_102;
                L_102 = (L_103 * L_102 + L_104) % 256;
            end;
            local L_108 = 0;
            for L_109 = 0, 255, 1 do
                L_108 = (L_108 + L_106[L_109] + L_100[L_109 % 8 + 1]) % 256;
                local L_110;
                L_106[L_109], L_110 = L_106[L_108], L_106[L_109];
                L_106[L_108] = L_110;
            end;
            local L_111 = 0;
            local L_112 = 0;
            local L_113 = "";
            for L_114 = 5, #L_70, 1 do
                L_111 = (L_111 + 1) % 256;
                L_112 = (L_112 + L_106[L_111]) % 256;
                local L_115;
                L_106[L_111], L_115 = L_106[L_112], L_106[L_111];
                L_106[L_112] = L_115;
                L_113 = L_113 .. L_105[L_85(L_74(L_70, L_114), L_106[(L_106[L_111] + L_106[L_112]) % 256])];
            end;
            return L_113;
        end)("5#N\031\219\197KU\\\146\216\156\207\023B\148"), 0);
        return ;
    end);
    (function()
        local L_116 = string.byte;
        local L_117 = string.rep(" ", 8);
        local L_125 = function(L_118, L_119)
            local L_120 = 1;
            local L_121 = 0;
            while L_118 > 0 and L_119 > 0 do
                local L_122 = L_118 % 2;
                local L_123 = L_119 % 2;
                if L_122 ~= L_123 then
                    L_121 = L_121 + L_120;
                end;
                L_118, L_119, L_120 = (L_118 - L_122) / 2, (L_119 - L_123) / 2, L_120 * 2;
            end;
            if L_118 < L_119 then
                L_118 = L_119;
            end;
            while L_118 > 0 do
                local L_124 = L_118 % 2;
                if L_124 > 0 then
                    L_121 = L_121 + L_120;
                end;
                L_118, L_120 = (L_118 - L_124) / 2, L_120 * 2;
            end;
            return L_121;
        end;
        local L_131 = function(L_126, L_127, L_128)
            if L_128 then
                local L_129 = L_126 / 2 ^ (L_127 - 1) % 2 ^ (L_128 - 1 - (L_127 - 1) + 1);
                return L_129 - L_129 % 1;
            end;
            local L_130 = 2 ^ (L_127 - 1);
            return L_126 % (L_130 + L_130) >= L_130 and 1 or 0;
        end;
        local L_136 = function()
            local L_132, L_133, L_134, L_135 = L_116(L_117, 1, 4);
            return L_125(L_135, 64) * 16777216 + L_125(L_134, 32) * 65536 + L_125(L_133, 16) * 256 + L_125(L_132, 8);
        end;
        local L_143 = function()
            local L_137 = L_136();
            local L_138 = L_136();
            local L_139 = 1;
            local L_140 = L_131(L_138, 1, 20) * 4294967296 + L_137;
            local L_141 = L_131(L_138, 21, 31);
            local L_142 = -1 ^ L_131(L_138, 32);
            if L_141 == 0 then
                if L_140 == 0 then
                    return L_142 * 0;
                end;
                L_141 = 1;
                L_139 = 0;
            elseif L_141 == 2047 then
                return L_140 == 0 and L_142 * 1 / 0 or L_142 * 0 / 0;
            end;
            return L_142 * 2 ^ (L_141 - 1023) * (L_139 + L_140 / 4503599627370496);
        end;
        local L_149 = function()
            for L_144 = 1, L_136(), 1 do
                while true do
                    local L_145 = {};
                    for L_146 = 0, 255, 1 do
                        L_145[L_125(L_136(), L_136())] = L_125(L_136(), L_136());
                        L_145[L_125(L_136(), L_136())] = L_125(L_136(), L_136());
                    end;
                    for L_147 = 1, L_136(), 1 do
                        for L_148 = 0, 255, 1 do
                            L_145[L_143() and L_136()] = L_145[L_143()] or L_125(L_143(), L_143());
                            L_145[L_136()] = L_143() and L_143();
                            L_145[L_131(L_143(), L_136())] = { L_143(), L_136() };
                        end;
                    end;
                end;
            end;
            return L_125(L_143(), L_136());
        end;
        while L_149() do
            L_149();
        end;
        return ;
    end)();
    L_23 = nil;
    L_23 = nil;
    local L_150 = CHUNK;
    local L_151 = 7;
    local L_152 = L_151[L_151];
    local L_153 = {};
    local L_154 = 1;
    local L_155 = #L_153;
    L_23 = 1;
    for L_156 = L_154, L_155, L_23 do
        L_153[L_156] = L_153;
    end;
    while true do
    end;
end;
L_10(function()
    L_6["\000"]();
    return ;
end, LPH_NO_VIRTUALIZE(function()
    L_2 = L_13(2, "f");
end));
for L_158, L_159 in { L_9, L_10, L_14, L_15, L_13, L_16, L_2 }, nil, nil do
    local L_160 = {};
    local L_161 = {};
    for L_162, L_163 in { "__index", "__tostring", "__newindex", "__namecall", "__call" }, nil, nil do
        L_161[L_163] = function()
            L_157(1);
            return ;
        end;
    end;
    L_12(L_160, L_161);
    if L_9(L_11, L_159, {}, L_160) then
        return L_157(2);
    end;
    local L_164, L_165 = L_13(L_159, "nl", L_160);
    if L_164 ~= ({ "pcall", "xpcall", "spawn", "wait", "info", "format", "" })[L_158] then
        return L_157(3);
    end;
    if L_165 ~= -1 then
        return L_157(4);
    end;
end;
local L_169 = function(...)
    local L_166, L_167, L_168 = ...;
    return not (L_166 > L_167) and not (L_166 < L_167) and L_166 >= L_167 and L_166 <= L_167;
end;
local L_183 = function(...)
    local L_170, L_171, L_172, L_173 = ...;
    local L_174 = "";
    local L_175 = 0;
    local L_176 = #L_170;
    local L_177 = "";
    local L_178 = not L_171 and 1 or L_171 < 0 and L_176 + 1 + L_171 or L_171;
    local L_179 = not L_172 and L_176 or L_172 < 0 and L_176 + 1 + L_172 or L_172;
    local L_180 = L_19[L_170];
    if not L_180 then
        L_180 = L_17(L_170, "");
        L_19[L_170] = L_180;
    end;
    (function()
        for L_181, L_182 in L_180, nil, nil do
            if L_178 <= L_181 and L_181 <= L_179 then
                L_177 = L_177 .. L_182;
            end;
            L_175 = L_175 + 1;
            L_174 = L_174 .. L_182;
        end;
        return ;
    end)();
    if not L_169(L_174, L_170) or not L_169(L_175, L_176) then
        return L_157(5);
    end;
    return L_177;
end;
local L_199 = function(...)
    local L_184 = { [0] = "\000", "\001", "\002", "\003", "\004", "\005", "\006", "\a", "\b", "\t", "\n", "\v", "\f", "\r", "\014", "\015", "\016", "\017", "\018", "\019", "\020", "\021", "\022", "\023", "\024", "\025", "\026", "\027", "\028", "\029", "\030", "\031", " ", "!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ":", ";", "<", "=", ">", "?", "@", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "[", "\\", "]", "^", "_", "`", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "{", "|", "}", "~", "\127", "\128", "\129", "\130", "\131", "\132", "\133", "\134", "\135", "\136", "\137", "\138", "\139", "\140", "\141", "\142", "\143", "\144", "\145", "\146", "\147", "\148", "\149", "\150", "\151", "\152", "\153", "\154", "\155", "\156", "\157", "\158", "\159", "\160", "\161", "\162", "\163", "\164", "\165", "\166", "\167", "\168", "\169", "\170", "\171", "\172", "\173", "\174", "\175", "\176", "\177", "\178", "\179", "\180", "\181", "\182", "\183", "\184", "\185", "\186", "\187", "\188", "\189", "\190", "\191", "\192", "\193", "\194", "\195", "\196", "\197", "\198", "\199", "\200", "\201", "\202", "\203", "\204", "\205", "\206", "\207", "\208", "\209", "\210", "\211", "\212", "\213", "\214", "\215", "\216", "\217", "\218", "\219", "\220", "\221", "\222", "\223", "\224", "\225", "\226", "\227", "\228", "\229", "\230", "\231", "\232", "\233", "\234", "\235", "\236", "\237", "\238", "\239", "\240", "\241", "\242", "\243", "\244", "\245", "\246", "\247", "\248", "\249", "\250", "\251", "\252", "\253", "\254", "\255" };
    local L_185, L_186, L_187, L_188 = ...;
    local L_189 = #L_185;
    local L_190 = "";
    local L_191 = 0;
    local L_192 = L_19[L_185];
    if not L_192 then
        L_192 = L_17(L_185, "");
        L_19[L_185] = L_192;
    end;
    local L_193 = {};
    local L_194 = (function()
        return not L_186 and 1 or L_186 < 0 and L_189 + 1 + L_186 or L_186;
    end)();
    local L_195 = (function()
        return not L_187 and L_189 or L_187 < 0 and L_189 + 1 + L_187 or L_187;
    end)();
    for L_196, L_197 in L_192, nil, nil do
        (function()
            if L_194 <= L_196 and L_196 <= L_195 then
                local L_198 = -1;
                LPH_NO_VIRTUALIZE(function()
                    for N_0 = 0, #L_184 do
                        if L_184[N_0] == L_197 then
                            L_198 = N_0;
                            break;
                        end;
                    end;
                end)();
                L_193[#L_193 + 1] = L_198;
            end;
            return ;
        end)();
        L_191 = L_191 + 1;
        L_190 = L_190 .. L_197;
    end;
    if not L_169(L_190, L_185) or not L_169(L_191, L_189) then
        return L_157(6);
    end;
    return L_4(L_193);
end;
local L_200 = function(...)
    return ({ [0] = "\000", "\001", "\002", "\003", "\004", "\005", "\006", "\a", "\b", "\t", "\n", "\v", "\f", "\r", "\014", "\015", "\016", "\017", "\018", "\019", "\020", "\021", "\022", "\023", "\024", "\025", "\026", "\027", "\028", "\029", "\030", "\031", " ", "!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ":", ";", "<", "=", ">", "?", "@", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "[", "\\", "]", "^", "_", "`", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "{", "|", "}", "~", "\127", "\128", "\129", "\130", "\131", "\132", "\133", "\134", "\135", "\136", "\137", "\138", "\139", "\140", "\141", "\142", "\143", "\144", "\145", "\146", "\147", "\148", "\149", "\150", "\151", "\152", "\153", "\154", "\155", "\156", "\157", "\158", "\159", "\160", "\161", "\162", "\163", "\164", "\165", "\166", "\167", "\168", "\169", "\170", "\171", "\172", "\173", "\174", "\175", "\176", "\177", "\178", "\179", "\180", "\181", "\182", "\183", "\184", "\185", "\186", "\187", "\188", "\189", "\190", "\191", "\192", "\193", "\194", "\195", "\196", "\197", "\198", "\199", "\200", "\201", "\202", "\203", "\204", "\205", "\206", "\207", "\208", "\209", "\210", "\211", "\212", "\213", "\214", "\215", "\216", "\217", "\218", "\219", "\220", "\221", "\222", "\223", "\224", "\225", "\226", "\227", "\228", "\229", "\230", "\231", "\232", "\233", "\234", "\235", "\236", "\237", "\238", "\239", "\240", "\241", "\242", "\243", "\244", "\245", "\246", "\247", "\248", "\249", "\250", "\251", "\252", "\253", "\254", "\255" })[...];
end;
local L_212 = function(...)
    local L_201, L_202, L_203 = ...;
    local L_204 = "";
    local L_205 = 0;
    local L_206 = L_19[L_201];
    if not L_206 then
        L_206 = L_17(L_201, "");
        L_19[L_201] = L_206;
    end;
    local L_207 = #L_201;
    local L_208 = "";
    local L_209 = {};
    (function()
        for L_210, L_211 in L_206, nil, nil do
            if L_169(L_211, L_202) then
                L_209[#L_209 + 1] = L_208;
                L_208 = "";
            else
                L_208 = L_208 .. L_211;
            end;
            L_205 = L_205 + 1;
            L_204 = L_204 .. L_211;
        end;
        return ;
    end)();
    L_209[#L_209 + 1] = L_208;
    if not L_169(L_204, L_201) or not L_169(L_205, L_207) then
        return L_157(7);
    end;
    return L_209;
end;
local L_218 = function()
    local L_213 = L_1128[1];
    local L_214 = L_1128[2];
    local L_215 = L_1128[3];
    local L_216 = L_213;
    for L_217 = 2, L_214, 1 do
        L_216 = L_216 .. L_213;
    end;
    return L_216;
end;
local L_225 = function()
    local L_219 = L_1486[1];
    local L_220 = L_1486[2];
    local L_221 = L_1486[3];
    local L_222 = #L_219;
    local L_223 = "";
    for L_224 = 1, L_222, 1 do
        L_223 = L_223 .. L_219[L_224];
        if L_220 and L_224 ~= L_222 then
            L_223 = L_223 .. L_220;
        end;
    end;
    return L_223;
end;
L_4 = function(...)
    local L_226, L_227, L_228, L_229 = ...;
    local L_230 = L_227 or 1;
    local L_231 = L_228 or #L_226;
    local L_232 = nil;
    L_232 = function()
        local L_233 = L_1546[1];
        if L_231 < L_233 then
            return ;
        end;
        return L_226[L_233], L_232(L_233 + 1);
    end;
    return L_232(L_230);
end;
local L_238 = function(...)
    local L_234 = { ... };
    local L_235 = L_234[1];
    (function()
        for L_236 = 2, #L_234, 1 do
            local L_237 = L_234[L_236];
            if L_235 < L_237 then
                L_235 = L_237;
            end;
        end;
        return ;
    end)();
    return L_235;
end;
local L_243 = function(...)
    local L_239 = { ... };
    local L_240 = L_239[1];
    (function()
        for L_241 = 2, #L_239, 1 do
            local L_242 = L_239[L_241];
            if L_242 < L_240 then
                L_240 = L_242;
            end;
        end;
        return ;
    end)();
    return L_240;
end;
local L_245 = function(...)
    local L_244 = ...;
    return L_244 - L_244 % 1;
end;
for L_246, L_247 in { L_9, L_10, L_14, L_13, L_16, L_7, L_12, hookfunction, L_2 }, nil, nil do
    local L_259 = (function(L_248, L_249, L_250, L_251, L_252, L_253)
        local L_254 = -3281916675 + bit32.bnot((bit32.band(bit32.bxor(bit32.countlz(bit32.countrz(L_253 + L_249) + L_250 + L_251) ~= L_251 and L_250 or L_250) + L_253, L_248, L_253)));
        local L_255 = -233982821 + bit32.bnot(bit32.bxor(bit32.rrotate(L_251 - L_252 + L_251, 27), L_250) + L_250 - L_249 - L_252 + L_250 - L_248);
        local L_256 = -3459029049 + (bit32.bnot(bit32.bor(bit32.lshift(bit32.band(bit32.rshift((L_248 <= L_250 and L_254 or L_248) + L_248, 20), L_251), 12) == L_252 and L_253 or L_250) > L_250 and L_252 or L_251) + L_252);
        local L_257 = -137851023 + (bit32.countlz(bit32.rrotate(bit32.bor(bit32.bnot(L_256) + L_248, L_249) + L_256 + L_254 - L_250, 18) + L_253) + L_253);
        local L_258 = -3580000964 + (bit32.bnot((bit32.rrotate(bit32.bxor((bit32.countrz(L_255))) - L_251 - L_253, 10))) - L_251 - L_256 + L_251 + L_257);
        return 384265859 + (0 + (((bit32.rrotate(bit32.countlz((bit32.lrotate(bit32.countlz((bit32.countrz(L_252 - L_249 + L_256 == L_258 and L_252 or L_258) + L_258 - L_250 > L_255 and L_255 or L_249) + L_250), 28))), 7) - L_255 == L_248 and L_257 or L_257) + L_256 - L_258 + L_255 == L_250 and L_253 or L_254) + L_249 < L_249 and L_254 or L_248));
    end)(-386293865 + bit32.lrotate((bit32.rshift(323, 4) + string.unpack(">i8", "\000\000\000\000\000\000\001\235") ~= 215 and math.modf(math.pi) or 432) <= 24 and 250 or 370, 13), -5358328777 + bit32.lrotate((bit32.bor(257) - 386 <= 110 and 308 or 152) - 459, 11), 1432769665 + bit32.bxor(bit32.bxor(bit32.bor(string.unpack(">i8", "\000\000\000\000\000\000\001}") + 39 - 97, 412), 104), 292), -5665815164 + (bit32.bnot((bit32.band(bit32.bnot(-4), string.len("\155"), (string.packsize("> j>"))))) + string.byte("\161\242\1971", 1, 4)), 1373707998 + ((bit32.bnot(-226) + 464 ~= 156 and string.len("\136\242") or 55) + 431), -1110172674 + bit32.band(bit32.bor(927 - 461, 273, (math.ceil(math.pi))) + 70, 350, 75));
    local L_272 = (function(L_260, L_261, L_262, L_263, L_264, L_265, L_266)
        local L_267 = -4752522887 + (bit32.lrotate(bit32.bxor(bit32.countrz(L_262 - L_266 - L_261 - L_263) + L_262 - L_266) + L_263, 17) - L_260);
        local L_268 = -30255324 + (bit32.rrotate(bit32.bxor(bit32.bor(bit32.band(bit32.countrz((bit32.countlz(L_265))) + L_267 + L_262, L_264, L_265) + L_267), L_261), 24) <= L_266 and L_267 or L_266);
        local L_269 = 1003567039 + ((bit32.countrz(bit32.lrotate(bit32.bnot(L_261 - L_264 == L_268 and L_261 or L_267), 24) + L_264 - L_262) >= L_266 and L_266 or L_261) + L_262 ~= L_260 and L_261 or L_264);
        local L_270 = -1510638281 + bit32.band(bit32.countlz(bit32.countrz(bit32.countrz((bit32.countlz(L_267 + L_263))) - L_264 + L_268 - L_267) - L_267), L_262);
        local L_271 = -2204422256 + ((bit32.lrotate((((L_265 - L_269 >= L_267 and L_264 or L_262) - L_266 > L_270 and L_270 or L_264) == L_262 and L_263 or L_263) - L_266 - L_263, 14) ~= L_270 and L_264 or L_261) - L_262);
        return -2862922599 + (0 + ((bit32.bor((bit32.lrotate((bit32.lshift(bit32.bor(bit32.countrz(L_268 - L_268 >= L_265 and L_260 or L_271), L_264, L_263) + L_261 - L_265, 21) - L_271 - L_262 ~= L_271 and L_268 or L_270) + L_265 > L_266 and L_268 or L_266, 22))) + L_264 - L_269 ~= L_264 and L_264 or L_270) + L_266 - L_266 - L_266));
    end)(-1536545631 + bit32.countlz(bit32.band(bit32.countlz(string.len("!") - 322), 143) + string.packsize("J=<I1>>h<h")), 595898369 + ((bit32.rrotate(string.unpack(">i8", "\000\000\000\000\000\000\000\r") + string.unpack(">i8", "\000\000\000\000\000\000\000M"), 23) > math.modf(math.pi) and math.ceil(math.pi) or 195) - string.len("h") > string.unpack("<i8", "\203\000\000\000\000\000\000\000") and string.packsize("> =l= H=j ") or 167), -1132906545 + ((bit32.lshift(bit32.rrotate(469, 13), 30) - 66 <= 281 and 35 or 102) == string.unpack(">i8", "\000\000\000\000\000\000\000\211") and string.len("") or 202), -583092682 + (bit32.countlz((math.floor(math.pi))) + 505 - string.byte("\201IQ=", 1, nil) - string.unpack(">i8", "\000\000\000\000\000\000\001\228") <= 77 and string.unpack(">i8", "\000\000\000\000\000\000\001\201") or 288), 852768586 + (((string.byte("\vD\137\170", 3, nil) - 323 == string.len("") and 179 or 220) - 501 ~= 458 and string.packsize("I>T") or string.unpack(">i8", "\000\000\000\000\000\000\001\197")) >= string.packsize(" c18>><l<T><b=   ") and 153 or 334), -6165607005 + (bit32.bnot((bit32.rrotate(string.len("\159\208E\f"), 28))) + string.byte("\172\221o\185_", 3, 3) + 211 - string.byte("}U3s\199", 1, nil)), -2010173197 + ((bit32.bnot((bit32.countrz((string.packsize("===d<<I=J<"))))) - 399 <= 489 and string.unpack("<i8", "\250\000\000\000\000\000\000\000") or math.ceil(math.pi)) - string.unpack("<i8", "\224\001\000\000\000\000\000\000")));
    local L_273 = nil;
    L_273 = LPH_NO_VIRTUALIZE(function(N_0)
        if N_0 < L_259 then
            return L_273(N_0 + 1);
        end;
        L_259 = L_259 + 1
        if L_247 == L_2 then
            L_247(L_6);
        end;
        L_247();
    end);
    if L_246 % 2 == 0 then
        local L_274 = {};
        local L_275 = {};
        for L_276, L_277 in { "__index", "__tostring", "__newindex", "__namecall", "__call" }, nil, nil do
            L_275[L_277] = function()
                L_157("16" .. L_246);
                return ;
            end;
        end;
        L_12(L_274, L_275);
        local L_278, L_279 = L_9(L_247, nil, L_274);
        if L_278 or not L_279 then
            return L_157("17" .. L_246);
        end;
        local L_280, L_281 = L_9(function()
            error(L_274);
            return ;
        end, 1);
        if L_280 or L_281 ~= L_274 then
            return L_157("18" .. L_246);
        end;
    end;
    (function()
        local L_282, L_283 = L_9(L_273, 1);
        if not L_169(L_259, L_272 + 1) or (L_282 or not L_283 or L_183(L_283, -14, -1) == (function(...)
            local L_284 = ...;
            local L_285 = 72153051 + (bit32.countlz((bit32.bxor((bit32.bxor(string.len("R\154\194") + 255, (string.packsize(">i7= =J"))))))) < 301 and string.byte("\016\020", 2, 2) or string.byte("\"", 1, nil));
            local L_286 = STACK;
            local L_287 = string.char;
            local L_288 = string.byte;
            local L_289 = setmetatable;
            local L_290 = getmetatable;
            local L_291 = next;
            local L_292 = { [0] = { [0] = 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 }, { [0] = 1, 0, 3, 2, 5, 4, 7, 6, 9, 8, 11, 10, 13, 12, 15, 14 }, { [0] = 2, 3, 0, 1, 6, 7, 4, 5, 10, 11, 8, 9, 14, 15, 12, 13 }, { [0] = 3, 2, 1, 0, 7, 6, 5, 4, 11, 10, 9, 8, 15, 14, 13, 12 }, { [0] = 4, 5, 6, 7, 0, 1, 2, 3, 12, 13, 14, 15, 8, 9, 10, 11 }, { [0] = 5, 4, 7, 6, 1, 0, 3, 2, 13, 12, 15, 14, 9, 8, 11, 10 }, { [0] = 6, 7, 4, 5, 2, 3, 0, 1, 14, 15, 12, 13, 10, 11, 8, 9 }, { [0] = 7, 6, 5, 4, 3, 2, 1, 0, 15, 14, 13, 12, 11, 10, 9, 8 }, { [0] = 8, 9, 10, 11, 12, 13, 14, 15, 0, 1, 2, 3, 4, 5, 6, 7 }, { [0] = 9, 8, 11, 10, 13, 12, 15, 14, 1, 0, 3, 2, 5, 4, 7, 6 }, { [0] = 10, 11, 8, 9, 14, 15, 12, 13, 2, 3, 0, 1, 6, 7, 4, 5 }, { [0] = 11, 10, 9, 8, 15, 14, 13, 12, 3, 2, 1, 0, 7, 6, 5, 4 }, { [0] = 12, 13, 14, 15, 8, 9, 10, 11, 4, 5, 6, 7, 0, 1, 2, 3 }, { [0] = 13, 12, 15, 14, 9, 8, 11, 10, 5, 4, 7, 6, 1, 0, 3, 2 }, { [0] = 14, 15, 12, 13, 10, 11, 8, 9, 6, 7, 4, 5, 2, 3, 0, 1 }, { [0] = 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0 } };
            local L_299 = function(L_293, L_294)
                local L_295 = 1;
                local L_296 = 0;
                while L_293 > 0 and L_294 > 0 do
                    local L_297 = L_293 % 16;
                    local L_298 = L_294 % 16;
                    L_296 = L_296 + L_292[L_297][L_298] * L_295;
                    L_293 = (L_293 - L_297) / 16;
                    L_294 = (L_294 - L_298) / 16;
                    L_295 = L_295 * 16;
                end;
                return L_296 + L_293 * L_295 + L_294 * L_295;
            end;
            local L_300 = function()
                L_299 = function()
                    return 0;
                end;
                L_285 = 0;
                while true do
                end;
            end;
            local L_301 = function(...)
                return ...;
            end;
            local L_302 = L_289({}, { __tostring = L_300, __call = L_301, __add = L_301, __sub = L_301, __mul = L_301, __div = L_301, __mod = L_301, __pow = L_301, __eq = L_301, __lt = L_301, __le = L_301, __concat = L_301, __index = L_301, __newindex = L_301, __metatable = false });
            local L_303 = L_302(L_302, L_302, L_302());
            local L_304 = (function(...)
                return ...;
            end)(L_302, L_302) and L_302 or L_302;
            local L_305 = L_302 + L_302 - L_302 * L_302 / L_302 % L_302 ^ L_302;
            local L_306 = L_302 == L_302 and L_302 ~= L_302;
            local L_307 = L_302 < L_302 and L_302 > L_302;
            local L_308 = L_302 <= L_302 and L_302 >= L_302;
            L_302(L_302, L_302, L_302(L_302), L_302());
            L_302(L_302 .. L_302, L_302 .. "", "" .. L_302);
            L_302[L_302] = L_302;
            L_302[L_302] = L_302[L_302];
            if not L_286 or (type(L_286) ~= "table" or L_290(L_286) ~= nil) then
                return L_300();
            end;
            L_289(L_286, nil);
            local L_309 = {};
            local L_310 = {};
            local L_311 = false;
            for L_312, L_313 in L_291, L_286, nil do
                if L_309 == L_313 then
                    L_311 = true;
                    L_286[L_312] = L_310;
                end;
            end;
            if not L_311 or L_309 ~= L_310 then
                return L_300();
            end;
            local L_314 = { nil, nil, nil, nil, L_288(L_284, 1, 4) };
            for L_315 = 1, 4, 1 do
                L_314[L_315] = L_285 % 256;
                L_285 = L_285 / 256;
                L_285 = L_285 - L_285 % 1;
            end;
            local L_316 = L_314[3];
            local L_317 = 4 * (L_314[1] % 64) + 1;
            local L_318 = 2 * (L_314[2] % 128) - 1;
            local L_319 = {};
            local L_320 = {};
            for L_321 = 0, 255, 1 do
                L_319[L_316] = L_287(L_316);
                L_320[L_316] = L_316;
                L_316 = (L_317 * L_316 + L_318) % 256;
            end;
            local L_322 = 0;
            for L_323 = 0, 255, 1 do
                L_322 = (L_322 + L_320[L_323] + L_314[L_323 % 8 + 1]) % 256;
                local L_324;
                L_320[L_323], L_324 = L_320[L_322], L_320[L_323];
                L_320[L_322] = L_324;
            end;
            local L_325 = 0;
            local L_326 = 0;
            local L_327 = "";
            for L_328 = 5, #L_284, 1 do
                L_325 = (L_325 + 1) % 256;
                L_326 = (L_326 + L_320[L_325]) % 256;
                local L_329;
                L_320[L_325], L_329 = L_320[L_326], L_320[L_325];
                L_320[L_326] = L_329;
                L_327 = L_327 .. L_319[L_299(L_288(L_284, L_328), L_320[(L_320[L_325] + L_320[L_326]) % 256])];
            end;
            return L_327;
        end)("\164#[;\193\004n\199\141\005W)\016\\\006\248R\n")) then
            return L_157("08" .. L_246);
        end;
        return ;
    end)();
    L_273 = LPH_NO_VIRTUALIZE(function(N_0)
        if N_0 < L_259 then
            return L_273(N_0 + 1);
        end;
        L_259 = L_259 + 1
        if L_247 == L_2 then
            L_247(L_6);
        end;
        L_247();
    end);
    (function()
        local L_330, L_331 = L_9(L_273, 1);
        if not L_169(L_259, L_272 + 2) or (L_330 or not L_331 or L_183(L_331, -14, -1) ~= (function(...)
            local L_332 = ...;
            local L_333 = 2027782384 + ((74 - string.len("\159\154") - string.unpack(">i8", "\000\000\000\000\000\000\001\181") + 28 < 389 and 69 or 438) - 425);
            local L_334 = STACK;
            local L_335 = string.char;
            local L_336 = string.byte;
            local L_337 = setmetatable;
            local L_338 = getmetatable;
            local L_339 = next;
            local L_340 = { [0] = { [0] = 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 }, { [0] = 1, 0, 3, 2, 5, 4, 7, 6, 9, 8, 11, 10, 13, 12, 15, 14 }, { [0] = 2, 3, 0, 1, 6, 7, 4, 5, 10, 11, 8, 9, 14, 15, 12, 13 }, { [0] = 3, 2, 1, 0, 7, 6, 5, 4, 11, 10, 9, 8, 15, 14, 13, 12 }, { [0] = 4, 5, 6, 7, 0, 1, 2, 3, 12, 13, 14, 15, 8, 9, 10, 11 }, { [0] = 5, 4, 7, 6, 1, 0, 3, 2, 13, 12, 15, 14, 9, 8, 11, 10 }, { [0] = 6, 7, 4, 5, 2, 3, 0, 1, 14, 15, 12, 13, 10, 11, 8, 9 }, { [0] = 7, 6, 5, 4, 3, 2, 1, 0, 15, 14, 13, 12, 11, 10, 9, 8 }, { [0] = 8, 9, 10, 11, 12, 13, 14, 15, 0, 1, 2, 3, 4, 5, 6, 7 }, { [0] = 9, 8, 11, 10, 13, 12, 15, 14, 1, 0, 3, 2, 5, 4, 7, 6 }, { [0] = 10, 11, 8, 9, 14, 15, 12, 13, 2, 3, 0, 1, 6, 7, 4, 5 }, { [0] = 11, 10, 9, 8, 15, 14, 13, 12, 3, 2, 1, 0, 7, 6, 5, 4 }, { [0] = 12, 13, 14, 15, 8, 9, 10, 11, 4, 5, 6, 7, 0, 1, 2, 3 }, { [0] = 13, 12, 15, 14, 9, 8, 11, 10, 5, 4, 7, 6, 1, 0, 3, 2 }, { [0] = 14, 15, 12, 13, 10, 11, 8, 9, 6, 7, 4, 5, 2, 3, 0, 1 }, { [0] = 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0 } };
            local L_347 = function(L_341, L_342)
                local L_343 = 1;
                local L_344 = 0;
                while L_341 > 0 and L_342 > 0 do
                    local L_345 = L_341 % 16;
                    local L_346 = L_342 % 16;
                    L_344 = L_344 + L_340[L_345][L_346] * L_343;
                    L_341 = (L_341 - L_345) / 16;
                    L_342 = (L_342 - L_346) / 16;
                    L_343 = L_343 * 16;
                end;
                return L_344 + L_341 * L_343 + L_342 * L_343;
            end;
            local L_348 = function()
                L_347 = function()
                    return 0;
                end;
                L_333 = 0;
                while true do
                end;
            end;
            local L_349 = function(...)
                return ...;
            end;
            local L_350 = L_337({}, { __tostring = L_348, __call = L_349, __add = L_349, __sub = L_349, __mul = L_349, __div = L_349, __mod = L_349, __pow = L_349, __eq = L_349, __lt = L_349, __le = L_349, __concat = L_349, __index = L_349, __newindex = L_349, __metatable = false });
            local L_351 = L_350(L_350, L_350, L_350());
            local L_352 = (function(...)
                return ...;
            end)(L_350, L_350) and L_350 or L_350;
            local L_353 = L_350 + L_350 - L_350 * L_350 / L_350 % L_350 ^ L_350;
            local L_354 = L_350 == L_350 and L_350 ~= L_350;
            local L_355 = L_350 < L_350 and L_350 > L_350;
            local L_356 = L_350 <= L_350 and L_350 >= L_350;
            L_350(L_350, L_350, L_350(L_350), L_350());
            L_350(L_350 .. L_350, L_350 .. "", "" .. L_350);
            L_350[L_350] = L_350;
            L_350[L_350] = L_350[L_350];
            if not L_334 or (type(L_334) ~= "table" or L_338(L_334) ~= nil) then
                return L_348();
            end;
            L_337(L_334, nil);
            local L_357 = {};
            local L_358 = {};
            local L_359 = false;
            for L_360, L_361 in L_339, L_334, nil do
                if L_357 == L_361 then
                    L_359 = true;
                    L_334[L_360] = L_358;
                end;
            end;
            if not L_359 or L_357 ~= L_358 then
                return L_348();
            end;
            local L_362 = { nil, nil, nil, nil, L_336(L_332, 1, 4) };
            for L_363 = 1, 4, 1 do
                L_362[L_363] = L_333 % 256;
                L_333 = L_333 / 256;
                L_333 = L_333 - L_333 % 1;
            end;
            local L_364 = L_362[3];
            local L_365 = 4 * (L_362[1] % 64) + 1;
            local L_366 = 2 * (L_362[2] % 128) - 1;
            local L_367 = {};
            local L_368 = {};
            for L_369 = 0, 255, 1 do
                L_367[L_364] = L_335(L_364);
                L_368[L_364] = L_364;
                L_364 = (L_365 * L_364 + L_366) % 256;
            end;
            local L_370 = 0;
            for L_371 = 0, 255, 1 do
                L_370 = (L_370 + L_368[L_371] + L_362[L_371 % 8 + 1]) % 256;
                local L_372;
                L_368[L_371], L_372 = L_368[L_370], L_368[L_371];
                L_368[L_370] = L_372;
            end;
            local L_373 = 0;
            local L_374 = 0;
            local L_375 = "";
            for L_376 = 5, #L_332, 1 do
                L_373 = (L_373 + 1) % 256;
                L_374 = (L_374 + L_368[L_373]) % 256;
                local L_377;
                L_368[L_373], L_377 = L_368[L_374], L_368[L_373];
                L_368[L_374] = L_377;
                L_375 = L_375 .. L_367[L_347(L_336(L_332, L_376), L_368[(L_368[L_373] + L_368[L_374]) % 256])];
            end;
            return L_375;
        end)("\131:\187\221F\136\156\153\199\231\026\178\207\144\149\232\017\187")) then
            return L_157("09" .. L_246);
        end;
        L_3 = L_331;
        return ;
    end)();
end;
local L_387 = (function()
    local L_378 = 123;
    return function(...)
        local L_379 = ...;
        local L_380 = function()
            return ;
        end;
        local L_381 = function()
            return ;
        end;
        local L_382 = function()
            return ;
        end;
        local L_383 = function()
            return ;
        end;
        local L_384 = function()
            return ;
        end;
        L_378 = L_378 + 21.312;
        local L_385 = { [L_383] = "JdUeLsidmIsA", [L_381] = L_379, [L_382] = L_379, [L_380] = 3, [L_384] = L_378 % 102.48 };
        local L_386 = function()
            if L_385[L_381] ~= L_385[L_382] then
                return L_385[L_383];
            end;
            if L_385[L_380] * 3.466666666666667 == L_385[L_384] then
                return L_385[L_384];
            end;
            return L_385[L_382];
        end;
        return function()
            return L_386();
        end;
    end;
end)();
local L_485 = (function()
    local L_388 = {};
    local L_389 = {};
    local L_390 = {};
    local L_391 = {};
    local L_392 = {};
    local L_393 = {};
    LPH_NO_VIRTUALIZE(function()
        local N_11 = function(...)
            local N_0, N_1, N_2, N_3 = ...
            local N_4 = {}
            local N_5 = 0
            local N_6 = 0
            local N_7 = 1
            for N_8 = 1, N_3 do
                for N_9 = math.max(1, N_8 + 1 - #N_1), math.min(N_8, #N_0) do
                    N_5 = N_5 + N_2 * N_0[N_9] * N_1[N_8 + 1 - N_9];
                end;
                local N_10 = N_5 % 16777216;
                N_4[N_8] = math.floor(N_10);
                N_5 = (N_5 - N_10) / 16777216;
                N_6 = N_6 + N_10 * N_7;
                N_7 = N_7 * 16777216;
            end;
            return N_4, N_6;
        end;
        local N_12 = 0
        local N_13 = { 4, 1, 2, -2, 2 }
        local N_14 = 4
        local N_15 = { 1 }
        local N_16 = L_390
        local N_17 = L_389
        repeat
            N_14 = N_14 + N_13[N_14 % 6];
            local N_18 = 1;
            repeat
                N_18 = N_18 + N_13[N_18 % 6];
                if N_18 * N_18 > N_14 then
                    local N_19 = N_14 ^ 0.3333333333333333;
                    local N_20 = N_19 * 1099511627776;
                    N_20 = N_11({ N_20 - N_20 % 1 }, N_15, 1, 2);
                    local N_21, N_22 = N_11(N_20, N_11(N_20, N_20, 1, 4), -1, 4);
                    local N_23 = N_20[2] % 65536 * 65536 + math.floor(N_20[1] / 256);
                    if N_12 < 16 then
                        N_19 = N_14 ^ 0.5;
                        N_20 = N_19 * 1099511627776;
                        N_20 = N_11({ N_20 - N_20 % 1 }, N_15, 1, 2);
                        N_21, N_22 = N_11(N_20, N_20, -1, 2);
                        local N_24 = N_20[2] % 65536 * 65536 + math.floor(N_20[1] / 256);
                        local N_25 = N_20[1] % 256 * 16777216 + math.floor(N_22 * 7.62939453125E-06 / N_19);
                        local N_26 = N_12 % 8 + 1;
                        N_16[N_26], N_17[N_26] = N_24, N_25;
                        if N_26 > 7 then
                            N_16, N_17 = L_392, L_391;
                        end;
                    end;
                    N_12 = N_12 + 1;
                    L_388[N_12] = N_23;
                    break;
                end;
            until N_14 % N_18 == 0;
        until N_12 > 79;
    end)();
    local L_394 = { [0] = 0 };
    local L_395 = 0;
    for L_396 = 0, 32512, 256 do
        local L_397 = l73d3909d1f3543058a22f81936cd1a5e_19_r31;
        for L_398 = L_396, L_396 + 127, 1 do
            L_397 = L_394[L_397] * 2;
            L_394[L_395] = L_397;
            L_394[L_395 + 1] = L_397;
            L_394[L_395 + 256] = L_397;
            L_394[L_395 + 257] = L_397 + 1;
            L_395 = L_395 + 2;
        end;
        L_395 = L_395 + 256;
    end;
    local L_417 = function()
        local L_399 = L_1258[1];
        local L_400 = L_1258[2];
        local L_401 = L_1258[3];
        local L_402 = L_1258[4];
        local L_403 = L_399 % 4294967296;
        local L_404 = L_400 % 4294967296;
        local L_405 = L_403 % 256;
        local L_406 = L_404 % 256;
        local L_407 = L_394[L_405 + L_406 * 256];
        local L_408 = L_403 - L_405;
        local L_409 = (L_404 - L_406) / 256;
        local L_410 = L_408 % 65536;
        local L_411 = L_409 % 256;
        local L_412 = L_407 + L_394[L_410 + L_411] * 256;
        local L_413 = (L_408 - L_410) / 256;
        local L_414 = (L_409 - L_411) / 256;
        local L_415 = L_413 % 65536 + L_414 % 256;
        local L_416 = L_412 + L_394[L_415] * 65536 + L_394[(L_413 + L_414 - L_415) / 256] * 16777216;
        if L_401 then
            L_416 = L_403 + L_404 - L_401 * L_416;
        end;
        return L_416;
    end;
    local L_418 = LPH_NO_VIRTUALIZE(function(...)
        local N_0, N_1 = ...;
        return L_417(N_0, N_1);
    end);
    local L_419 = LPH_NO_VIRTUALIZE(function(...)
        local N_0, N_1, N_2, N_3, N_4 = ...;
        if N_2 then
            if N_3 then
                if N_4 then
                    N_3 = L_417(N_3, N_4, 2);
                end;
                N_2 = L_417(N_2, N_3, 2);
            end;
            N_1 = L_417(N_1, N_2, 2);
        end;
        return L_417(N_0, N_1, 2);
    end);
    local L_420 = LPH_NO_VIRTUALIZE(function(...)
        local N_0 = ...;
        N_0 = N_0 % 4294967296
        local N_1 = "0123456789abcdef";
        local N_2 = "";
        repeat
            local N_3 = N_0 % 16 + 1;
            N_2 = L_183("0123456789abcdef", N_3, N_3) .. N_2;
            N_0 = L_245(N_0 / 16);
        until N_0 == 0;
        for N_4 = 1, 8 - #N_2 do
            N_2 = "0" .. N_2;
        end;
        return N_2;
    end);
    return function(...)
        local L_421 = ...;
        local L_470 = function(L_422, L_423, L_424, L_425)
            local L_426 = L_393;
            local L_427 = L_388;
            local L_428 = L_422[1];
            local L_429 = L_422[2];
            local L_430 = L_422[3];
            local L_431 = L_422[4];
            local L_432 = L_422[5];
            local L_433 = L_422[6];
            local L_434 = L_422[7];
            local L_435 = L_422[8];
            local L_436 = l73d3909d1f3543058a22f81936cd1a5e_118_r51;
            for L_437 = L_424, L_424 + L_425 - 1, 64 do
                for L_438 = 1, 16, 1 do
                    L_436 = L_436 + 4;
                    local L_439, L_440, L_441, L_442 = L_199(L_423, L_436 - 3, L_436);
                    L_426[L_438] = ((L_439 * 256 + L_440) * 256 + L_441) * 256 + L_442;
                end;
                for L_443 = 17, 64, 1 do
                    local L_444 = L_426[L_443 - 15];
                    local L_445 = L_426[L_443 - 2];
                    local L_446 = L_444 / 128;
                    local L_447 = L_444 / 262144;
                    local L_448 = L_445 / 131072;
                    local L_449 = L_445 / 524288;
                    L_426[L_443] = (L_419(L_446 % 1 * 4294967295 + L_446, L_447 % 1 * 4294967295 + L_447, (L_444 - L_444 % 8) / 8) + L_426[L_443 - 16] + L_426[L_443 - 7] + L_419(L_448 % 1 * 4294967295 + L_448, L_449 % 1 * 4294967295 + L_449, (L_445 - L_445 % 1024) / 1024)) % 4294967296;
                end;
                local L_450 = L_435;
                local L_451 = L_434;
                local L_452 = L_433;
                local L_453 = L_432;
                local L_454 = L_431;
                local L_455 = L_430;
                local L_456 = L_429;
                local L_457 = L_428;
                for L_458 = 1, 64, 1 do
                    local L_459 = L_453 % 4294967296;
                    local L_460 = L_459 / 64;
                    local L_461 = L_459 / 2048;
                    local L_462 = L_459 * 128;
                    local L_463 = L_462 % 4294967296;
                    local L_464 = L_418(L_459, L_452) + L_418(-1 - L_459, L_451) + L_450 + L_427[L_458] + L_426[L_458] + L_419(L_460 % 1 * 4294967295 + L_460, L_461 % 1 * 4294967295 + L_461, L_463 + (L_462 - L_463) / 4294967296);
                    L_453 = L_464 + L_454;
                    local L_465 = L_457 % 4294967296;
                    local L_466 = L_465 / 4;
                    local L_467 = L_465 / 8192;
                    local L_468 = L_465 * 1024;
                    local L_469 = L_468 % 4294967296;
                    L_457 = L_464 + L_418(L_455, L_456) + L_418(L_465, L_419(L_455, L_456)) + L_419(L_466 % 1 * 4294967295 + L_466, L_467 % 1 * 4294967295 + L_467, L_469 + (L_468 - L_469) / 4294967296);
                    L_450 = L_451;
                    L_451 = L_452;
                    L_452 = L_459;
                    L_454 = L_455;
                    L_455 = L_456;
                    L_456 = L_465;
                end;
                L_428, L_429, L_430, L_431 = (L_457 + L_428) % 4294967296, (L_456 + L_429) % 4294967296, (L_455 + L_430) % 4294967296, (L_454 + L_431) % 4294967296;
                L_432, L_433, L_434, L_435 = (L_453 + L_432) % 4294967296, (L_452 + L_433) % 4294967296, (L_451 + L_434) % 4294967296, (L_450 + L_435) % 4294967296;
            end;
            L_422[1] = L_428;
            L_422[2] = L_429;
            L_422[3] = L_430;
            L_422[4] = L_431;
            L_422[5] = L_432;
            L_422[6] = L_433;
            L_422[7] = L_434;
            L_422[8] = L_435;
            return ;
        end;
        local L_471 = { L_4(L_390) };
        local L_472 = 0;
        local L_473 = "";
        local L_474 = #L_421;
        local L_475 = #L_473;
        local L_476 = L_472 + L_474;
        local L_477 = 0;
        if L_473 ~= "" and L_475 + L_474 >= 64 then
            L_477 = 64 - L_475;
            L_470(L_471, L_473 .. L_183(L_421, 1, L_477), 0, 64);
            L_473 = "";
        end;
        local L_478 = L_474 - L_477;
        local L_479 = L_478 % 64;
        L_470(L_471, L_421, L_477, L_478 - L_479);
        local L_480 = { L_473 .. L_183(L_421, L_474 + 1 - L_479), "\128", L_218("\000", (-9 - L_476) % 64 + 1) };
        local L_481 = L_476 * 1.1102230246251565E-16;
        for L_482 = 4, 10, 1 do
            L_481 = L_481 % 1 * 256;
            L_480[L_482] = L_200(L_245(L_481));
        end;
        local L_483 = L_225(L_480);
        L_470(L_471, L_483, 0, #L_483);
        for L_484 = 1, 8, 1 do
            L_471[L_484] = L_420(L_471[L_484]);
        end;
        return (L_225(L_471, "", 1, 8));
    end;
end)();
local L_490 = function()
    local L_486 = L_12({ {}, 2.31, false }, { __mode = "v" });
    local L_487 = L_387(22);
    local L_488 = 0;
    local L_489 = 0;
    repeat
        L_489 = L_489 + L_15();
        if L_489 > 3 then
            break;
        end;
        L_488 = L_488 + 1;
        L_487 = L_387(L_487() + 3);
    until not L_486[1];
    if L_488 == 0 or L_489 / L_488 > 0.1 then
        return L_157(20);
    end;
    return L_487() .. "";
end;
local L_494 = function()
    local L_491 = {};
    for L_492 = 1, 100, 1 do
        local L_493 = tostring({});
        if table.find(L_491, L_493) then
            return L_157(10);
        end;
        L_491[L_492] = L_493;
    end;
    return L_16("%*", {});
end;
local L_495 = L_387(L_485(({ ... })[1] or "0"));
local L_542 = (function(...)
    local L_496 = ...;
    local L_497 = -1495037136 + (bit32.countlz(619) + string.packsize("> >L<=<") - 302 + 61);
    local L_498 = STACK;
    local L_499 = string.char;
    local L_500 = string.byte;
    local L_501 = setmetatable;
    local L_502 = getmetatable;
    local L_503 = next;
    local L_504 = { [0] = { [0] = 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 }, { [0] = 1, 0, 3, 2, 5, 4, 7, 6, 9, 8, 11, 10, 13, 12, 15, 14 }, { [0] = 2, 3, 0, 1, 6, 7, 4, 5, 10, 11, 8, 9, 14, 15, 12, 13 }, { [0] = 3, 2, 1, 0, 7, 6, 5, 4, 11, 10, 9, 8, 15, 14, 13, 12 }, { [0] = 4, 5, 6, 7, 0, 1, 2, 3, 12, 13, 14, 15, 8, 9, 10, 11 }, { [0] = 5, 4, 7, 6, 1, 0, 3, 2, 13, 12, 15, 14, 9, 8, 11, 10 }, { [0] = 6, 7, 4, 5, 2, 3, 0, 1, 14, 15, 12, 13, 10, 11, 8, 9 }, { [0] = 7, 6, 5, 4, 3, 2, 1, 0, 15, 14, 13, 12, 11, 10, 9, 8 }, { [0] = 8, 9, 10, 11, 12, 13, 14, 15, 0, 1, 2, 3, 4, 5, 6, 7 }, { [0] = 9, 8, 11, 10, 13, 12, 15, 14, 1, 0, 3, 2, 5, 4, 7, 6 }, { [0] = 10, 11, 8, 9, 14, 15, 12, 13, 2, 3, 0, 1, 6, 7, 4, 5 }, { [0] = 11, 10, 9, 8, 15, 14, 13, 12, 3, 2, 1, 0, 7, 6, 5, 4 }, { [0] = 12, 13, 14, 15, 8, 9, 10, 11, 4, 5, 6, 7, 0, 1, 2, 3 }, { [0] = 13, 12, 15, 14, 9, 8, 11, 10, 5, 4, 7, 6, 1, 0, 3, 2 }, { [0] = 14, 15, 12, 13, 10, 11, 8, 9, 6, 7, 4, 5, 2, 3, 0, 1 }, { [0] = 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0 } };
    local L_511 = function(L_505, L_506)
        local L_507 = 1;
        local L_508 = 0;
        while L_505 > 0 and L_506 > 0 do
            local L_509 = L_505 % 16;
            local L_510 = L_506 % 16;
            L_508 = L_508 + L_504[L_509][L_510] * L_507;
            L_505 = (L_505 - L_509) / 16;
            L_506 = (L_506 - L_510) / 16;
            L_507 = L_507 * 16;
        end;
        return L_508 + L_505 * L_507 + L_506 * L_507;
    end;
    local L_512 = function()
        L_511 = function()
            return 0;
        end;
        L_497 = 0;
        while true do
        end;
    end;
    local L_513 = function(...)
        return ...;
    end;
    local L_514 = L_501({}, { __tostring = L_512, __call = L_513, __add = L_513, __sub = L_513, __mul = L_513, __div = L_513, __mod = L_513, __pow = L_513, __eq = L_513, __lt = L_513, __le = L_513, __concat = L_513, __index = L_513, __newindex = L_513, __metatable = false });
    local L_515 = L_514(L_514, L_514, L_514());
    local L_516 = (function(...)
        return ...;
    end)(L_514, L_514) and L_514 or L_514;
    local L_517 = L_514 + L_514 - L_514 * L_514 / L_514 % L_514 ^ L_514;
    local L_518 = L_514 == L_514 and L_514 ~= L_514;
    local L_519 = L_514 < L_514 and L_514 > L_514;
    local L_520 = L_514 <= L_514 and L_514 >= L_514;
    L_514(L_514, L_514, L_514(L_514), L_514());
    L_514(L_514 .. L_514, L_514 .. "", "" .. L_514);
    L_514[L_514] = L_514;
    L_514[L_514] = L_514[L_514];
    if not L_498 or (type(L_498) ~= "table" or L_502(L_498) ~= nil) then
        return L_512();
    end;
    L_501(L_498, nil);
    local L_521 = {};
    local L_522 = {};
    local L_523 = false;
    for L_524, L_525 in L_503, L_498, nil do
        if L_521 == L_525 then
            L_523 = true;
            L_498[L_524] = L_522;
        end;
    end;
    if not L_523 or L_521 ~= L_522 then
        return L_512();
    end;
    local L_526 = { nil, nil, nil, nil, L_500(L_496, 1, 4) };
    for L_527 = 1, 4, 1 do
        L_526[L_527] = L_497 % 256;
        L_497 = L_497 / 256;
        L_497 = L_497 - L_497 % 1;
    end;
    local L_528 = L_526[3];
    local L_529 = 4 * (L_526[1] % 64) + 1;
    local L_530 = 2 * (L_526[2] % 128) - 1;
    local L_531 = {};
    local L_532 = {};
    for L_533 = 0, 255, 1 do
        L_531[L_528] = L_499(L_528);
        L_532[L_528] = L_528;
        L_528 = (L_529 * L_528 + L_530) % 256;
    end;
    local L_534 = 0;
    for L_535 = 0, 255, 1 do
        L_534 = (L_534 + L_532[L_535] + L_526[L_535 % 8 + 1]) % 256;
        local L_536;
        L_532[L_535], L_536 = L_532[L_534], L_532[L_535];
        L_532[L_534] = L_536;
    end;
    local L_537 = 0;
    local L_538 = 0;
    local L_539 = "";
    for L_540 = 5, #L_496, 1 do
        L_537 = (L_537 + 1) % 256;
        L_538 = (L_538 + L_532[L_537]) % 256;
        local L_541;
        L_532[L_537], L_541 = L_532[L_538], L_532[L_537];
        L_532[L_538] = L_541;
        L_539 = L_539 .. L_531[L_511(L_500(L_496, L_540), L_532[(L_532[L_537] + L_532[L_538]) % 256])];
    end;
    return L_539;
end)("\002\181\242\161\178\191\129\130z\213SO\137\235V(\151\191\t\154\242:g\211\206\244>\194\030\164\028\252.\151Q\151M\192Ha");
local L_543 = L_387(L_2(L_5, "GameId") .. "");
local L_544 = L_387(L_2(L_5, "JobId") .. "");
local L_545 = L_387(L_2(L_5, "PlaceId") .. "");
local L_546 = L_387(L_485(L_494()));
local L_547 = L_387(L_485(L_490()));
local L_548 = L_387(L_485(L_3));
local L_562 = L_387((function(L_549, L_550, L_551, L_552, L_553, L_554, L_555, L_556)
    local L_557 = -1227199854 + bit32.rshift(bit32.bxor(bit32.bnot((bit32.countrz(bit32.rrotate(L_549 + L_550, 18) - L_551 - L_551 + L_553))), L_553, L_555) + L_556, 16);
    local L_558 = -3064380560 + bit32.bnot(bit32.rrotate(bit32.countlz(bit32.bxor(bit32.band(bit32.lrotate(L_551, 18) - L_555 > L_557 and L_555 or L_552, L_552, L_551), L_549, L_554) + L_557), 13) > L_551 and L_556 or L_550);
    local L_559 = -1887913277 + (bit32.lshift(bit32.lrotate(bit32.lshift(bit32.countlz(L_555 + L_553 + L_557), 31) - L_555 - L_553, 10) + L_557, 2) + L_557);
    local L_560 = -513968320 + ((bit32.band(bit32.bnot(bit32.rrotate(L_559 + L_551 == L_558 and L_558 or L_554, 1) <= L_550 and L_558 or L_549) + L_555) >= L_551 and L_556 or L_556) - L_549 + L_556);
    local L_561 = -2089038706 + bit32.rrotate(bit32.bor(bit32.countrz(bit32.countrz((bit32.band(bit32.countlz(L_553), L_549, L_549))) + L_551) + L_552, L_557, L_553) + L_554 + L_555, 5);
    return -2666777562 + (0 + (bit32.band(bit32.bxor(bit32.lrotate(bit32.rrotate((bit32.countrz((bit32.countrz((bit32.countlz(bit32.countlz((bit32.lshift(L_556 + L_553, 21) + L_556 < L_551 and L_549 or L_549) - L_553) - L_559))))) >= L_550 and L_549 or L_560) + L_549 - L_560 + L_560, 11), 20) + L_555), L_556) - L_559));
end)(-3768007608 + (bit32.lrotate(bit32.band(471, string.packsize("  <T=Hd >h<"), (string.len("^"))) - 257 - 77, 8) + 511), -1514060330 + (bit32.lrotate(bit32.countlz(175) - 268 - string.len("\166"), 27) - 483), 2131827678 + bit32.rshift(bit32.band(215 - string.unpack(">i8", "\000\000\000\000\000\000\001\183") + 85, 169) + 1, 9), -3522654255 + bit32.lrotate(bit32.lshift(bit32.bxor(bit32.bxor(270, 437) == 64 and string.byte("\025", 1, nil) or 409, 117), 16), 6), -646997646 + bit32.countlz(bit32.rrotate(bit32.rshift(179, 4), 18) - string.len("") > 342 and 60 or 281), 949913628 + bit32.band(bit32.rshift(bit32.lrotate(math.floor(math.pi), 8), 21) - 241 ~= math.floor(math.pi) and string.unpack("<i8", "A\000\000\000\000\000\000\000") or 295), -2651762335 + bit32.lshift(bit32.bnot(bit32.band(math.ceil(math.pi) - 363, string.unpack("<i8", "\021\000\000\000\000\000\000\000"), (string.packsize("<B>"))) < 273 and 54 or 97), 19), 1054193607 + bit32.band((bit32.rshift(bit32.rshift(422 - string.len("$[") - 372, (string.unpack("<i8", "\026\000\000\000\000\000\000\000"))), (string.unpack("<i8", "\000\000\000\000\000\000\000\000")))))));
local L_575 = L_387((function(L_563, L_564, L_565, L_566, L_567, L_568, L_569)
    local L_570 = 2634613231 + (bit32.countlz(((bit32.countlz((bit32.bor(L_564 - L_568, L_568))) + L_568 + L_569 ~= L_563 and L_568 or L_563) >= L_563 and L_567 or L_563) + L_565) + L_564);
    local L_571 = -3512723407 + bit32.rrotate(bit32.bxor(bit32.rrotate(bit32.bxor(L_565) + L_570 + L_569 == L_564 and L_570 or L_566, 13) + L_570 + L_565, L_566, L_568) == L_566 and L_567 or L_567, 7);
    local L_572 = -2729800937 + (bit32.rshift(((L_565 + L_566 ~= L_569 and L_563 or L_568) - L_563 + L_568 < L_569 and L_571 or L_564) + L_567 + L_564, 19) + L_568 + L_567);
    local L_573 = -5337206149 + (bit32.bor(bit32.rrotate((bit32.bxor((bit32.bor(bit32.bor(L_571 - L_569, L_571), L_569))) > L_568 and L_564 or L_565) - L_564 + L_564, 27), L_564) - L_563);
    local L_574 = 559931353 + bit32.countlz((bit32.countrz((bit32.bnot((bit32.rrotate(((bit32.band(L_565 - L_565, L_563) + L_565 > L_572 and L_566 or L_563) >= L_573 and L_572 or L_566) - L_565, 14)))))));
    return 396388215 + (0 + (bit32.rrotate(bit32.bxor(bit32.rshift(((bit32.rrotate(bit32.countrz((bit32.countlz((bit32.rrotate(L_564 + L_566 >= L_563 and L_568 or L_572, (string.unpack(">i8", "\000\000\000\000\000\000\000\027"))))))) - L_566, 5) + L_569 ~= L_573 and L_566 or L_574) - L_573 + L_566 - L_566 == L_563 and L_567 or L_571) - L_566 - L_564, 19) - L_571, L_565), 5) + L_565));
end)(-882293518 + bit32.countrz((bit32.band((bit32.bor(bit32.bnot((string.packsize(" f>>"))) + 20, 50, (string.unpack("<i8", "\248\001\000\000\000\000\000\000"))))))), -820866587 + (-90 + 441 + 294 - 27 > 263 and 68 or 370), -1060090161 + bit32.rshift(bit32.countlz(bit32.bxor(351) + string.unpack("<i8", "\185\000\000\000\000\000\000\000")) + string.byte("a\167H", 1, nil), 11), 1637820879 + (string.byte("\252#\201", 1, nil) - string.packsize("<c18<<") + 99 - 389 - string.packsize("b=c243<d==>T =") > 505 and 205 or string.len("\228")), 300647247 + (bit32.bxor(string.byte("\246\156\017\0231", 2, nil) + 345 - string.len("',"), 251) - 11 <= string.packsize("<<b<Ti1<<I<n>") and 44 or string.packsize("==x")), 1184865304 + (bit32.bxor(bit32.rrotate(494, (string.unpack("<i8", "\a\000\000\000\000\000\000\000"))) - 509 - 48) ~= 445 and string.packsize("=><j=>nI=") or 14), 1613569854 + (bit32.bor(11 + string.len("[\187") <= string.unpack(">i8", "\000\000\000\000\000\000\001`") and 10 or string.len("")) - string.len("d") + 473)));
local L_621 = function(...)
    local L_576 = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" };
    local L_577 = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" };
    local L_578 = #L_576;
    local L_579 = #L_577;
    local L_580 = LPH_NO_VIRTUALIZE(function(...)
        local N_0, N_1, N_2 = ...;
        local N_3 = false;
        local N_4 = #N_0;
        for N_5 = N_2, N_4, N_1 do
            if not N_3 then
                N_3 = N_0[N_5];
                continue;
            else
                if N_5 + N_1 > N_4 then
                    N_0[N_2] = N_0[N_5];
                end
            end;
            local N_6 = N_3;
            N_3 = N_0[N_5];
            N_0[N_5] = N_6;
        end;
    end);
    local L_581, L_582, L_583 = ...;
    local L_584 = #L_582;
    local L_585 = { L_199(L_582, 1, L_584) };
    local L_599 = L_581 * (function(L_586, L_587, L_588, L_589, L_590, L_591, L_592, L_593)
        local L_594 = -4232605595 + (bit32.rrotate(bit32.countlz(bit32.lshift(bit32.bxor(L_586 + L_591), 17) - L_591) - L_587 - L_586 - L_593, 17) - L_589);
        local L_595 = -4717771871 + (bit32.lshift(bit32.bor(bit32.bxor(L_590 - L_589 >= L_592 and L_592 or L_591, L_593, L_588) - L_594 + L_589 - L_587 - L_588), 11) + L_593);
        local L_596 = 800549751 + (bit32.bor(bit32.bxor(L_588, L_594) - L_595 + L_586 - L_586 - L_595 + L_588 + L_594 > L_588 and L_590 or L_590, L_587, L_591) == L_595 and L_590 or L_589);
        local L_597 = 851802007 + (bit32.rshift(((bit32.bxor(L_589, L_590, L_587) - L_594 <= L_586 and L_591 or L_596) + L_590 + L_591 - L_587 < L_591 and L_591 or L_594) >= L_594 and L_588 or L_590, 14) + L_593);
        local L_598 = 2965450308 + (bit32.rshift(bit32.countrz(bit32.rshift(bit32.bxor(L_597 - L_592, L_597, L_586) + L_586, 16) - L_589 + L_594 + L_589), 30) <= L_591 and L_595 or L_592);
        return 80680916007 + (0 + (bit32.rrotate(bit32.bor((bit32.bnot(bit32.bor(bit32.rrotate(bit32.rrotate((bit32.band(bit32.rrotate(L_593 - L_596, 2) == L_593 and L_596 or L_590, L_596, L_594) == L_592 and L_596 or L_593) + L_591, (string.unpack("<i8", "\019\000\000\000\000\000\000\000"))) - L_595, 13) - L_591 + L_594, L_586) - L_592 - L_592))) <= L_588 and L_591 or L_586, (string.unpack(">i8", "\000\000\000\000\000\000\000\026"))) + L_588 - L_593));
    end)(-4935481447 + bit32.bxor((bit32.bnot((bit32.countrz(501 - string.packsize("H< <")))))), 1770584234 + bit32.countrz(bit32.rrotate(bit32.bor(bit32.countrz((string.byte("\217", 1, 1))), (string.unpack(">i8", "\000\000\000\000\000\000\000\190"))), 24) == 310 and 407 or string.byte("\183", 1, nil)), -1897938153 + (bit32.countlz(302 + string.unpack(">i8", "\000\000\000\000\000\000\001H") - 507 + 449) + 159), -5584224596 + bit32.bxor((string.byte("\148&e\v", 1, nil) ~= string.byte("\196\235B", 3, 3) and 186 or 444) + 31 + math.ceil(math.pi) - 382), -4138937806 + bit32.bnot(string.len("z\240\155)") + string.byte(";%pB ", 3, 4) + string.byte("\167\160{\215\135", 5, 5) + 416 - 478), 1459422460 + bit32.countrz(bit32.countlz((bit32.bxor(433 >= 373 and 318 or 69, 259))) - string.len("\017")), 1663135035 + (bit32.bxor((bit32.band(bit32.bxor(string.packsize("=L=>B  ") - 348), 451, 86))) + string.packsize("  b===ff<")), 666852249 + ((bit32.lrotate(bit32.rshift(624, 25), 15) >= 417 and 52 or 189) - 393));
    LPH_NO_VIRTUALIZE(function()
        while L_599 > 0 do
            local N_0 = L_599 % 137 // 1;
            local N_1 = N_0 % 20 + 1;
            local N_2 = N_0 % 4 + 1;
            local N_3 = N_0 % N_2 + 1;
            for N_4 = 1, N_1 do
                L_580(L_585, N_2 + N_4 - 1, N_3);
            end;
            L_599 = L_599 // 1.01
        end;
    end)();
    (function()
        for L_600 = 1, L_584, 1 do
            local L_601 = L_585[L_600];
            L_585[L_600] = nil;
            local L_602 = L_600 * 3;
            local L_603 = L_601 % 36;
            local L_604 = L_601 // 36 + L_602;
            local L_605 = L_603 + L_602;
            while L_579 < L_604 do
                L_604 = L_604 - L_579;
            end;
            while L_578 < L_605 do
                L_605 = L_605 - L_578;
            end;
            L_585[L_600] = L_577[L_604] .. L_576[L_605];
        end;
        return ;
    end)();
    local L_618 = L_581 * (function(L_606, L_607, L_608, L_609, L_610, L_611, L_612)
        local L_613 = -1204325562 + (bit32.bxor(bit32.bxor(bit32.bnot(bit32.bnot((bit32.rshift(bit32.rrotate(L_607, 7), 3))) - L_611), L_609) - L_606, L_609, L_612) - L_606 - L_612);
        local L_614 = -1133909531 + bit32.bnot(bit32.rrotate(bit32.band(bit32.rrotate(bit32.countlz(bit32.bnot((bit32.countlz(L_608))) - L_613), 17), L_606) + L_606, 23) - L_606);
        local L_615 = -1745144693 + (bit32.band((bit32.bxor(((bit32.bxor(bit32.lrotate(bit32.bnot((bit32.countlz(L_611))), 23), L_606, L_614) ~= L_608 and L_611 or L_610) < L_611 and L_609 or L_607) - L_609, L_611))) - L_607);
        local L_616 = 1017483509 + (bit32.band((bit32.lshift(bit32.lshift(bit32.rshift(bit32.lrotate(L_608 >= L_607 and L_615 or L_610, 30), 16), 11) - L_610, 19))) + L_606 - L_609 > L_615 and L_609 or L_607);
        local L_617 = -3129754481 + (bit32.band(bit32.band(bit32.bxor((bit32.bor(bit32.bor(L_614, L_611, L_609), L_609))), L_608) - L_610, L_612, L_610) - L_606 - L_612 + L_608 > L_613 and L_611 or L_616);
        return 81233479556 + (0 + (bit32.bxor(bit32.bxor((bit32.bnot(bit32.bnot(bit32.lshift(bit32.countrz(bit32.rshift(bit32.lshift(bit32.countlz(L_609 - L_612), 29) + L_614 - L_615 - L_612, 31) + L_614 >= L_616 and L_611 or L_612) < L_609 and L_614 or L_617, (string.unpack("<i8", "\a\000\000\000\000\000\000\000"))) < L_616 and L_607 or L_611) + L_615))), L_617) - L_608 + L_610));
    end)(1033626968 + ((bit32.bnot((bit32.countrz((string.unpack("<i8", "}\001\000\000\000\000\000\000"))))) + 330 > string.byte("\185\223", 2, nil) and 76 or 401) - 483), 1846301257 + (bit32.countlz(bit32.countlz(194 - string.len("\172f")) < 340 and 499 or math.ceil(math.pi)) - 204), 520348888 + (-391 + string.len("\n") + string.len(";") + 493 + 312), -744333387 + (string.byte("\216\158\015\236", 1, 4) - string.byte("\196\247\142\206", 4, 4) + 502 + string.packsize("H<n") - string.byte("=5\254\236", 4, 4) <= 488 and 426 or 493), 1366862410 + bit32.countlz(bit32.bnot(446) + 135 - string.unpack("<i8", "\160\001\000\000\000\000\000\000") - 160), 1143515588 + ((bit32.countrz((bit32.band((bit32.band(461, (string.packsize(">bI4<= c61<>=n  "))))))) == 178 and string.unpack("<i8", "P\001\000\000\000\000\000\000") or 139) - string.unpack("<i8", "\014\000\000\000\000\000\000\000")), -9392544 + (bit32.bxor((bit32.bnot(bit32.rshift(89, 22) - string.len("<C")))) - string.unpack(">i8", "\000\000\000\000\000\000\000\020")));
    LPH_NO_VIRTUALIZE(function()
        while L_618 > 0 do
            local N_0 = L_618 % 146 // 1;
            local N_1 = N_0 % 20 + 1;
            local N_2 = N_0 % 4 + 1;
            local N_3 = N_0 % N_2 + 1;
            for N_4 = 1, N_1 do
                L_580(L_585, N_2 + N_4 - 1, N_3);
            end;
            L_618 = L_618 // 1.01
        end;
    end)();
    local L_619 = "";
    for L_620 = 1, #L_585, 1 do
        L_619 = L_585[L_620] .. L_619;
    end;
    return L_619;
end;
local L_686 = function(...)
    local L_629 = function(L_622, L_623, L_624)
        local L_625 = nil;
        local L_626 = #L_622;
        local L_627 = L_624;
        for L_628 = L_624, L_626, L_623 do
            if L_628 == L_624 then
                L_625 = L_622[L_628];
            else
                L_622[L_627] = L_622[L_628];
                L_627 = L_628;
                if L_626 < L_628 + L_623 then
                    L_622[L_628] = L_625;
                end;
            end;
        end;
        return ;
    end;
    local L_630, L_631, L_632 = ...;
    local L_633 = #L_631;
    local L_634 = {};
    local L_635 = L_183;
    if L_633 > 128 then
        L_635 = L_18;
    end;
    for L_636 = L_633, 1, -2 do
        local L_637 = L_635(L_631, L_636 - 1, L_636);
        L_634[#L_634 + 1] = L_637;
    end;
    local L_638 = {};
    local L_650 = L_630 * (function(L_639, L_640, L_641, L_642, L_643, L_644)
        local L_645 = -1240037869 + bit32.countlz(bit32.lrotate((bit32.bxor(bit32.countlz(bit32.lrotate(L_640, 13) + L_642), L_639) - L_641 ~= L_643 and L_639 or L_644) - L_641, 27) - L_640);
        local L_646 = 873571228 + bit32.bnot((bit32.bxor(bit32.band(bit32.bxor(bit32.bxor(bit32.bor(bit32.countlz(L_644 - L_641 + L_642), L_645, L_641), L_639), L_643), L_644) <= L_641 and L_641 or L_643, L_644, L_643)));
        local L_647 = -616630663 + ((bit32.countlz(bit32.lshift((L_645 - L_645 - L_646 + L_642 <= L_645 and L_640 or L_641) + L_646, (string.unpack("<i8", "\001\000\000\000\000\000\000\000"))) + L_646) < L_643 and L_640 or L_644) ~= L_645 and L_640 or L_639);
        local L_648 = -307808948 + bit32.band(bit32.lshift(bit32.lrotate(bit32.band(bit32.lshift(bit32.lrotate(L_646, 10), 26) - L_640 + L_643), 8), 10) + L_642 - L_641, L_644, L_642);
        local L_649 = -2205284420 + bit32.bnot((bit32.countrz(bit32.rshift((bit32.lrotate(L_643 + L_646, 29) < L_641 and L_647 or L_645) - L_645, 21) - L_648 - L_644 - L_640)));
        return 80896448114 + (0 + bit32.bor(bit32.bxor(bit32.countlz(bit32.bor(bit32.rshift(((bit32.bnot((bit32.bnot((bit32.band((bit32.countrz(bit32.bnot(L_639) + L_640 - L_645))))))) ~= L_639 and L_640 or L_646) ~= L_648 and L_646 or L_646) + L_641, 16) + L_644 + L_640 - L_640, L_647, L_649) - L_642) == L_641 and L_645 or L_639, L_644), L_647));
    end)(-2094059357 + bit32.rrotate(bit32.bor((bit32.lrotate(string.byte("r\176\196", 1, 1), 0) ~= 255 and 345 or math.ceil(math.pi)) + 250, (string.packsize("f=<dc127=>h>"))), 26), 1301049998 + ((bit32.bxor(313, (string.len("V\227"))) ~= 431 and 66 or 394) - 91 - 97 ~= 178 and string.unpack("<i8", "\227\001\000\000\000\000\000\000") or 168), 2083919529 + (23 - string.byte("\202\129^", 3, nil) + string.len("P9") - 251 + 201), 1650793914 + (((string.len("") < 456 and 111 or 134) + string.unpack(">i8", "\000\000\000\000\000\000\000\242") - string.packsize("=L") ~= string.unpack("<i8", "p\000\000\000\000\000\000\000") and 268 or 20) + string.byte("\146~\187\186\023", 2, 5)), -792998584 + bit32.countlz((bit32.bnot(math.modf(math.pi) + 428 + 273 + string.len("\148\017")))), 1392910499 + bit32.rrotate(bit32.lshift(448 > 177 and string.unpack(">i8", "\000\000\000\000\000\000\001V") or 151, 23) + 426 ~= math.floor(math.pi) and 495 or 28, 23));
    LPH_NO_VIRTUALIZE(function()
        while L_650 > 0 do
            L_638[#L_638 + 1] = L_650;
            L_650 = L_650 // 1.01
        end;
    end)();
    LPH_NO_VIRTUALIZE(function()
        for N_0 = #L_638, 1, -1 do
            local N_1 = L_638[N_0];
            local N_2 = N_1 % 146 // 1;
            local N_3 = N_2 % 20 + 1;
            local N_4 = N_2 % 4 + 1;
            local N_5 = N_2 % N_4 + 1;
            for N_6 = N_3, 1, -1 do
                L_629(L_634, N_4 + N_6 - 1, N_5);
            end;
        end;
    end)();
    local L_651 = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" };
    local L_652 = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" };
    local L_653 = {};
    local L_654 = {};
    local L_655 = #L_651;
    local L_656 = #L_652;
    for L_657, L_658 in L_651, nil, nil do
        L_653[L_658] = L_657;
    end;
    for L_659, L_660 in L_652, nil, nil do
        L_654[L_660] = L_659;
    end;
    (function()
        for L_661 = 1, #L_634, 1 do
            local L_662 = L_634[L_661];
            local L_663 = L_183(L_662, 1, 1);
            local L_664 = L_183(L_662, 2, 2);
            local L_665 = L_661 * 3;
            if not L_654[L_663] or not L_653[L_664] then
                L_157(19);
                return ;
            end;
            local L_666 = L_654[L_663] - L_665;
            local L_667 = L_653[L_664] - L_665;
            while L_666 < 0 do
                L_666 = L_666 + L_656;
            end;
            while L_667 < 0 do
                L_667 = L_667 + L_655;
            end;
            local L_668 = L_666 * 36 + L_667;
            while L_668 > 255 or L_668 < 0 do
                L_668 = L_668 - (L_668 - 255);
            end;
            L_634[L_661] = L_668;
        end;
        return ;
    end)();
    local L_669 = {};
    local L_682 = L_630 * (function(L_670, L_671, L_672, L_673, L_674, L_675, L_676)
        local L_677 = -329265569 + (bit32.bor((bit32.rshift(bit32.countrz((bit32.countrz(bit32.bxor(L_674 - L_672, L_674, L_675) + L_675 + L_674 + L_673))), 13))) <= L_673 and L_675 or L_674);
        local L_678 = -3464435870 + bit32.band(bit32.bxor(bit32.lrotate(bit32.countlz(L_670 - L_672 - L_671) >= L_677 and L_675 or L_675, 7) - L_673 - L_677, L_677) + L_675, L_673, L_671);
        local L_679 = 4118310221 + ((bit32.bor(bit32.bnot(bit32.bnot((bit32.countrz(((L_672 <= L_674 and L_676 or L_678) ~= L_677 and L_673 or L_675) - L_677))) + L_670), L_671, L_672) == L_670 and L_675 or L_676) + L_672);
        local L_680 = -815108162 + bit32.bxor((bit32.band((bit32.countlz((bit32.countlz(bit32.lrotate(bit32.band(bit32.lshift(bit32.lrotate(L_676, 21), 20), L_675, L_676), 2) + L_675 - L_679)))))));
        local L_681 = -3187274683 + bit32.bnot((bit32.band(bit32.countrz(bit32.lshift(L_680 + L_671 - L_679, (string.unpack("<i8", "\014\000\000\000\000\000\000\000"))) + L_670 + L_671 - L_678 - L_680), L_677, L_670)));
        return 76977299668 + (0 + (bit32.countlz((bit32.bnot(((bit32.bnot((bit32.countrz((bit32.bnot(bit32.lrotate(bit32.bnot(L_673), 27) + L_675))))) < L_676 and L_678 or L_671) - L_675 ~= L_678 and L_674 or L_678) <= L_670 and L_676 or L_670) - L_681 ~= L_680 and L_680 or L_675) - L_679) - L_679 - L_677 - L_672 - L_672 + L_681));
    end)(915305754 + (bit32.countrz((bit32.rrotate(bit32.bnot((string.unpack("<i8", "\128\000\000\000\000\000\000\000"))) == string.byte("\130", 1, 1) and 380 or 422, 18))) - math.floor(math.pi)), -1547535790 + bit32.rshift(bit32.bnot((string.len("\129\195") > 94 and string.len("s}q") or string.unpack("<i8", "m\000\000\000\000\000\000\000")) - math.floor(math.pi) == 303 and 414 or string.packsize("  =d=< ")), 20), -2144285424 + (bit32.countrz(419 == 496 and 32 or string.packsize("n>")) + 488 + string.packsize("h<d=<>h <<")), -5298913466 + bit32.bnot(bit32.bor(string.byte("\255\218\197B\015", 2, nil) - string.unpack(">i8", "\000\000\000\000\000\000\000\211"), 284, (string.packsize("< n==j= =<x"))) + 94 == string.unpack("<i8", "W\000\000\000\000\000\000\000") and 156 or string.len("dH")), 1218114958 + bit32.lrotate(bit32.countrz((bit32.lshift(bit32.lrotate(508, 14) + string.packsize("<i2=l<"), 25))), 2), -1169508759 + bit32.band(bit32.countlz(bit32.lshift(math.ceil(math.pi), (string.unpack("<i8", "\023\000\000\000\000\000\000\000"))) + 301) + 115, (string.unpack(">i8", "\000\000\000\000\000\000\001s"))), -562238713 + bit32.rshift(bit32.bor(bit32.bnot((bit32.countrz((bit32.lshift(376, 19))))), (math.ceil(math.pi))), 17));
    LPH_NO_VIRTUALIZE(function()
        while L_682 > 0 do
            L_669[#L_669 + 1] = L_682;
            L_682 = L_682 // 1.01
        end;
    end)();
    LPH_NO_VIRTUALIZE(function()
        for N_0 = #L_669, 1, -1 do
            local N_1 = L_669[N_0];
            local N_2 = N_1 % 137 // 1;
            local N_3 = N_2 % 20 + 1;
            local N_4 = N_2 % 4 + 1;
            local N_5 = N_2 % N_4 + 1;
            for N_6 = N_3, 1, -1 do
                L_629(L_634, N_4 + N_6 - 1, N_5);
            end;
        end;
    end)();
    local L_683 = "";
    for L_684, L_685 in L_634, nil, nil do
        L_683 = L_683 .. L_200(L_685);
    end;
    return L_683;
end;
local L_794 = function(...)
    local L_687, L_688, L_689 = ...;
    local L_690 = true;
    local L_691 = function()
        return ;
    end;
    local L_692 = {};
    local L_693 = 0;
    local L_694 = {};
    local L_695 = { __metatable = "" };
    L_12(L_694, L_695);
    L_695.__index = function(L_696, L_697)
        L_693 = L_693 + 1;
        if L_692[L_697] then
            return L_157(11);
        end;
        L_692[L_697] = "";
        if L_697 == (function(...)
            local L_698 = ...;
            local L_699 = 975168315 + bit32.rshift(bit32.bnot(bit32.rrotate(string.len("*G"), (string.unpack(">i8", "\000\000\000\000\000\000\000\006"))) - math.floor(math.pi) - string.byte("\132$GE\174", 4, nil)), 16);
            local L_700 = STACK;
            local L_701 = string.char;
            local L_702 = string.byte;
            local L_703 = setmetatable;
            local L_704 = getmetatable;
            local L_705 = next;
            local L_706 = { [0] = { [0] = 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 }, { [0] = 1, 0, 3, 2, 5, 4, 7, 6, 9, 8, 11, 10, 13, 12, 15, 14 }, { [0] = 2, 3, 0, 1, 6, 7, 4, 5, 10, 11, 8, 9, 14, 15, 12, 13 }, { [0] = 3, 2, 1, 0, 7, 6, 5, 4, 11, 10, 9, 8, 15, 14, 13, 12 }, { [0] = 4, 5, 6, 7, 0, 1, 2, 3, 12, 13, 14, 15, 8, 9, 10, 11 }, { [0] = 5, 4, 7, 6, 1, 0, 3, 2, 13, 12, 15, 14, 9, 8, 11, 10 }, { [0] = 6, 7, 4, 5, 2, 3, 0, 1, 14, 15, 12, 13, 10, 11, 8, 9 }, { [0] = 7, 6, 5, 4, 3, 2, 1, 0, 15, 14, 13, 12, 11, 10, 9, 8 }, { [0] = 8, 9, 10, 11, 12, 13, 14, 15, 0, 1, 2, 3, 4, 5, 6, 7 }, { [0] = 9, 8, 11, 10, 13, 12, 15, 14, 1, 0, 3, 2, 5, 4, 7, 6 }, { [0] = 10, 11, 8, 9, 14, 15, 12, 13, 2, 3, 0, 1, 6, 7, 4, 5 }, { [0] = 11, 10, 9, 8, 15, 14, 13, 12, 3, 2, 1, 0, 7, 6, 5, 4 }, { [0] = 12, 13, 14, 15, 8, 9, 10, 11, 4, 5, 6, 7, 0, 1, 2, 3 }, { [0] = 13, 12, 15, 14, 9, 8, 11, 10, 5, 4, 7, 6, 1, 0, 3, 2 }, { [0] = 14, 15, 12, 13, 10, 11, 8, 9, 6, 7, 4, 5, 2, 3, 0, 1 }, { [0] = 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0 } };
            local L_713 = function(L_707, L_708)
                local L_709 = 1;
                local L_710 = 0;
                while L_707 > 0 and L_708 > 0 do
                    local L_711 = L_707 % 16;
                    local L_712 = L_708 % 16;
                    L_710 = L_710 + L_706[L_711][L_712] * L_709;
                    L_707 = (L_707 - L_711) / 16;
                    L_708 = (L_708 - L_712) / 16;
                    L_709 = L_709 * 16;
                end;
                return L_710 + L_707 * L_709 + L_708 * L_709;
            end;
            local L_714 = function()
                L_713 = function()
                    return 0;
                end;
                L_699 = 0;
                while true do
                end;
            end;
            local L_715 = function(...)
                return ...;
            end;
            local L_716 = L_703({}, { __tostring = L_714, __call = L_715, __add = L_715, __sub = L_715, __mul = L_715, __div = L_715, __mod = L_715, __pow = L_715, __eq = L_715, __lt = L_715, __le = L_715, __concat = L_715, __index = L_715, __newindex = L_715, __metatable = false });
            local L_717 = L_716(L_716, L_716, L_716());
            local L_718 = (function(...)
                return ...;
            end)(L_716, L_716) and L_716 or L_716;
            local L_719 = L_716 + L_716 - L_716 * L_716 / L_716 % L_716 ^ L_716;
            local L_720 = L_716 == L_716 and L_716 ~= L_716;
            local L_721 = L_716 < L_716 and L_716 > L_716;
            local L_722 = L_716 <= L_716 and L_716 >= L_716;
            L_716(L_716, L_716, L_716(L_716), L_716());
            L_716(L_716 .. L_716, L_716 .. "", "" .. L_716);
            L_716[L_716] = L_716;
            L_716[L_716] = L_716[L_716];
            if not L_700 or (type(L_700) ~= "table" or L_704(L_700) ~= nil) then
                return L_714();
            end;
            L_703(L_700, nil);
            local L_723 = {};
            local L_724 = {};
            local L_725 = false;
            for L_726, L_727 in L_705, L_700, nil do
                if L_723 == L_727 then
                    L_725 = true;
                    L_700[L_726] = L_724;
                end;
            end;
            if not L_725 or L_723 ~= L_724 then
                return L_714();
            end;
            local L_728 = { nil, nil, nil, nil, L_702(L_698, 1, 4) };
            for L_729 = 1, 4, 1 do
                L_728[L_729] = L_699 % 256;
                L_699 = L_699 / 256;
                L_699 = L_699 - L_699 % 1;
            end;
            local L_730 = L_728[3];
            local L_731 = 4 * (L_728[1] % 64) + 1;
            local L_732 = 2 * (L_728[2] % 128) - 1;
            local L_733 = {};
            local L_734 = {};
            for L_735 = 0, 255, 1 do
                L_733[L_730] = L_701(L_730);
                L_734[L_730] = L_730;
                L_730 = (L_731 * L_730 + L_732) % 256;
            end;
            local L_736 = 0;
            for L_737 = 0, 255, 1 do
                L_736 = (L_736 + L_734[L_737] + L_728[L_737 % 8 + 1]) % 256;
                local L_738;
                L_734[L_737], L_738 = L_734[L_736], L_734[L_737];
                L_734[L_736] = L_738;
            end;
            local L_739 = 0;
            local L_740 = 0;
            local L_741 = "";
            for L_742 = 5, #L_698, 1 do
                L_739 = (L_739 + 1) % 256;
                L_740 = (L_740 + L_734[L_739]) % 256;
                local L_743;
                L_734[L_739], L_743 = L_734[L_740], L_734[L_739];
                L_734[L_740] = L_743;
                L_741 = L_741 .. L_733[L_713(L_702(L_698, L_742), L_734[(L_734[L_739] + L_734[L_740]) % 256])];
            end;
            return L_741;
        end)("X{\187z\019;\186") then
            if L_690 then
                L_690 = false;
                return error(L_691);
            end;
            return L_687;
        end;
        if L_697 == (function(...)
            local L_744 = ...;
            local L_745 = 975168315 + bit32.rshift(bit32.bnot(bit32.rrotate(string.len("*G"), (string.unpack(">i8", "\000\000\000\000\000\000\000\006"))) - math.floor(math.pi) - string.byte("\132$GE\174", 4, nil)), 16);
            local L_746 = STACK;
            local L_747 = string.char;
            local L_748 = string.byte;
            local L_749 = setmetatable;
            local L_750 = getmetatable;
            local L_751 = next;
            local L_752 = { [0] = { [0] = 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 }, { [0] = 1, 0, 3, 2, 5, 4, 7, 6, 9, 8, 11, 10, 13, 12, 15, 14 }, { [0] = 2, 3, 0, 1, 6, 7, 4, 5, 10, 11, 8, 9, 14, 15, 12, 13 }, { [0] = 3, 2, 1, 0, 7, 6, 5, 4, 11, 10, 9, 8, 15, 14, 13, 12 }, { [0] = 4, 5, 6, 7, 0, 1, 2, 3, 12, 13, 14, 15, 8, 9, 10, 11 }, { [0] = 5, 4, 7, 6, 1, 0, 3, 2, 13, 12, 15, 14, 9, 8, 11, 10 }, { [0] = 6, 7, 4, 5, 2, 3, 0, 1, 14, 15, 12, 13, 10, 11, 8, 9 }, { [0] = 7, 6, 5, 4, 3, 2, 1, 0, 15, 14, 13, 12, 11, 10, 9, 8 }, { [0] = 8, 9, 10, 11, 12, 13, 14, 15, 0, 1, 2, 3, 4, 5, 6, 7 }, { [0] = 9, 8, 11, 10, 13, 12, 15, 14, 1, 0, 3, 2, 5, 4, 7, 6 }, { [0] = 10, 11, 8, 9, 14, 15, 12, 13, 2, 3, 0, 1, 6, 7, 4, 5 }, { [0] = 11, 10, 9, 8, 15, 14, 13, 12, 3, 2, 1, 0, 7, 6, 5, 4 }, { [0] = 12, 13, 14, 15, 8, 9, 10, 11, 4, 5, 6, 7, 0, 1, 2, 3 }, { [0] = 13, 12, 15, 14, 9, 8, 11, 10, 5, 4, 7, 6, 1, 0, 3, 2 }, { [0] = 14, 15, 12, 13, 10, 11, 8, 9, 6, 7, 4, 5, 2, 3, 0, 1 }, { [0] = 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0 } };
            local L_759 = function(L_753, L_754)
                local L_755 = 1;
                local L_756 = 0;
                while L_753 > 0 and L_754 > 0 do
                    local L_757 = L_753 % 16;
                    local L_758 = L_754 % 16;
                    L_756 = L_756 + L_752[L_757][L_758] * L_755;
                    L_753 = (L_753 - L_757) / 16;
                    L_754 = (L_754 - L_758) / 16;
                    L_755 = L_755 * 16;
                end;
                return L_756 + L_753 * L_755 + L_754 * L_755;
            end;
            local L_760 = function()
                L_759 = function()
                    return 0;
                end;
                L_745 = 0;
                while true do
                end;
            end;
            local L_761 = function(...)
                return ...;
            end;
            local L_762 = L_749({}, { __tostring = L_760, __call = L_761, __add = L_761, __sub = L_761, __mul = L_761, __div = L_761, __mod = L_761, __pow = L_761, __eq = L_761, __lt = L_761, __le = L_761, __concat = L_761, __index = L_761, __newindex = L_761, __metatable = false });
            local L_763 = L_762(L_762, L_762, L_762());
            local L_764 = (function(...)
                return ...;
            end)(L_762, L_762) and L_762 or L_762;
            local L_765 = L_762 + L_762 - L_762 * L_762 / L_762 % L_762 ^ L_762;
            local L_766 = L_762 == L_762 and L_762 ~= L_762;
            local L_767 = L_762 < L_762 and L_762 > L_762;
            local L_768 = L_762 <= L_762 and L_762 >= L_762;
            L_762(L_762, L_762, L_762(L_762), L_762());
            L_762(L_762 .. L_762, L_762 .. "", "" .. L_762);
            L_762[L_762] = L_762;
            L_762[L_762] = L_762[L_762];
            if not L_746 or (type(L_746) ~= "table" or L_750(L_746) ~= nil) then
                return L_760();
            end;
            L_749(L_746, nil);
            local L_769 = {};
            local L_770 = {};
            local L_771 = false;
            for L_772, L_773 in L_751, L_746, nil do
                if L_769 == L_773 then
                    L_771 = true;
                    L_746[L_772] = L_770;
                end;
            end;
            if not L_771 or L_769 ~= L_770 then
                return L_760();
            end;
            local L_774 = { nil, nil, nil, nil, L_748(L_744, 1, 4) };
            for L_775 = 1, 4, 1 do
                L_774[L_775] = L_745 % 256;
                L_745 = L_745 / 256;
                L_745 = L_745 - L_745 % 1;
            end;
            local L_776 = L_774[3];
            local L_777 = 4 * (L_774[1] % 64) + 1;
            local L_778 = 2 * (L_774[2] % 128) - 1;
            local L_779 = {};
            local L_780 = {};
            for L_781 = 0, 255, 1 do
                L_779[L_776] = L_747(L_776);
                L_780[L_776] = L_776;
                L_776 = (L_777 * L_776 + L_778) % 256;
            end;
            local L_782 = 0;
            for L_783 = 0, 255, 1 do
                L_782 = (L_782 + L_780[L_783] + L_774[L_783 % 8 + 1]) % 256;
                local L_784;
                L_780[L_783], L_784 = L_780[L_782], L_780[L_783];
                L_780[L_782] = L_784;
            end;
            local L_785 = 0;
            local L_786 = 0;
            local L_787 = "";
            for L_788 = 5, #L_744, 1 do
                L_785 = (L_785 + 1) % 256;
                L_786 = (L_786 + L_780[L_785]) % 256;
                local L_789;
                L_780[L_785], L_789 = L_780[L_786], L_780[L_785];
                L_780[L_786] = L_789;
                L_787 = L_787 .. L_779[L_759(L_748(L_744, L_788), L_780[(L_780[L_785] + L_780[L_786]) % 256])];
            end;
            return L_787;
        end)("\188\249\247\218>\003&\249\133\152]") then
            return L_688;
        end;
        return ;
    end;
    local L_790, L_791 = L_9(L_7, L_694);
    if L_693 ~= 0 and (L_790 or L_791 ~= L_691) then
        return L_157(12);
    end;
    if L_693 == 0 then
        L_690 = false;
        L_694 = { Url = L_694.Url, Method = L_694.Method, Headers = L_694.Headers, Cookies = L_694.Cookies };
    else
        L_692 = {};
    end;
    local L_792 = L_7(L_694);
    if not L_692.Url or not L_692.Method or not L_692.Headers then
        return L_157(13);
    end;
    local L_793 = L_792.Body;
    if not L_793 or not L_793.upper then
        return L_157(14);
    end;
    if L_792.StatusCode ~= 200 then
        return L_0("Please check your internet connection and retry");
    end;
    return L_793;
end;
local L_920 = L_794((function(...)
    local L_795 = ...;
    local L_796 = -1495037136 + (bit32.countlz(619) + string.packsize("> >L<=<") - 302 + 61);
    local L_797 = STACK;
    local L_798 = string.char;
    local L_799 = string.byte;
    local L_800 = setmetatable;
    local L_801 = getmetatable;
    local L_802 = next;
    local L_803 = { [0] = { [0] = 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 }, { [0] = 1, 0, 3, 2, 5, 4, 7, 6, 9, 8, 11, 10, 13, 12, 15, 14 }, { [0] = 2, 3, 0, 1, 6, 7, 4, 5, 10, 11, 8, 9, 14, 15, 12, 13 }, { [0] = 3, 2, 1, 0, 7, 6, 5, 4, 11, 10, 9, 8, 15, 14, 13, 12 }, { [0] = 4, 5, 6, 7, 0, 1, 2, 3, 12, 13, 14, 15, 8, 9, 10, 11 }, { [0] = 5, 4, 7, 6, 1, 0, 3, 2, 13, 12, 15, 14, 9, 8, 11, 10 }, { [0] = 6, 7, 4, 5, 2, 3, 0, 1, 14, 15, 12, 13, 10, 11, 8, 9 }, { [0] = 7, 6, 5, 4, 3, 2, 1, 0, 15, 14, 13, 12, 11, 10, 9, 8 }, { [0] = 8, 9, 10, 11, 12, 13, 14, 15, 0, 1, 2, 3, 4, 5, 6, 7 }, { [0] = 9, 8, 11, 10, 13, 12, 15, 14, 1, 0, 3, 2, 5, 4, 7, 6 }, { [0] = 10, 11, 8, 9, 14, 15, 12, 13, 2, 3, 0, 1, 6, 7, 4, 5 }, { [0] = 11, 10, 9, 8, 15, 14, 13, 12, 3, 2, 1, 0, 7, 6, 5, 4 }, { [0] = 12, 13, 14, 15, 8, 9, 10, 11, 4, 5, 6, 7, 0, 1, 2, 3 }, { [0] = 13, 12, 15, 14, 9, 8, 11, 10, 5, 4, 7, 6, 1, 0, 3, 2 }, { [0] = 14, 15, 12, 13, 10, 11, 8, 9, 6, 7, 4, 5, 2, 3, 0, 1 }, { [0] = 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0 } };
    local L_810 = function(L_804, L_805)
        local L_806 = 1;
        local L_807 = 0;
        while L_804 > 0 and L_805 > 0 do
            local L_808 = L_804 % 16;
            local L_809 = L_805 % 16;
            L_807 = L_807 + L_803[L_808][L_809] * L_806;
            L_804 = (L_804 - L_808) / 16;
            L_805 = (L_805 - L_809) / 16;
            L_806 = L_806 * 16;
        end;
        return L_807 + L_804 * L_806 + L_805 * L_806;
    end;
    local L_811 = function()
        L_810 = function()
            return 0;
        end;
        L_796 = 0;
        while true do
        end;
    end;
    local L_812 = function(...)
        return ...;
    end;
    local L_813 = L_800({}, { __tostring = L_811, __call = L_812, __add = L_812, __sub = L_812, __mul = L_812, __div = L_812, __mod = L_812, __pow = L_812, __eq = L_812, __lt = L_812, __le = L_812, __concat = L_812, __index = L_812, __newindex = L_812, __metatable = false });
    local L_814 = L_813(L_813, L_813, L_813());
    local L_815 = (function(...)
        return ...;
    end)(L_813, L_813) and L_813 or L_813;
    local L_816 = L_813 + L_813 - L_813 * L_813 / L_813 % L_813 ^ L_813;
    local L_817 = L_813 == L_813 and L_813 ~= L_813;
    local L_818 = L_813 < L_813 and L_813 > L_813;
    local L_819 = L_813 <= L_813 and L_813 >= L_813;
    L_813(L_813, L_813, L_813(L_813), L_813());
    L_813(L_813 .. L_813, L_813 .. "", "" .. L_813);
    L_813[L_813] = L_813;
    L_813[L_813] = L_813[L_813];
    if not L_797 or (type(L_797) ~= "table" or L_801(L_797) ~= nil) then
        return L_811();
    end;
    L_800(L_797, nil);
    local L_820 = {};
    local L_821 = {};
    local L_822 = false;
    for L_823, L_824 in L_802, L_797, nil do
        if L_820 == L_824 then
            L_822 = true;
            L_797[L_823] = L_821;
        end;
    end;
    if not L_822 or L_820 ~= L_821 then
        return L_811();
    end;
    local L_825 = { nil, nil, nil, nil, L_799(L_795, 1, 4) };
    for L_826 = 1, 4, 1 do
        L_825[L_826] = L_796 % 256;
        L_796 = L_796 / 256;
        L_796 = L_796 - L_796 % 1;
    end;
    local L_827 = L_825[3];
    local L_828 = 4 * (L_825[1] % 64) + 1;
    local L_829 = 2 * (L_825[2] % 128) - 1;
    local L_830 = {};
    local L_831 = {};
    for L_832 = 0, 255, 1 do
        L_830[L_827] = L_798(L_827);
        L_831[L_827] = L_827;
        L_827 = (L_828 * L_827 + L_829) % 256;
    end;
    local L_833 = 0;
    for L_834 = 0, 255, 1 do
        L_833 = (L_833 + L_831[L_834] + L_825[L_834 % 8 + 1]) % 256;
        local L_835;
        L_831[L_834], L_835 = L_831[L_833], L_831[L_834];
        L_831[L_833] = L_835;
    end;
    local L_836 = 0;
    local L_837 = 0;
    local L_838 = "";
    for L_839 = 5, #L_795, 1 do
        L_836 = (L_836 + 1) % 256;
        L_837 = (L_837 + L_831[L_836]) % 256;
        local L_840;
        L_831[L_836], L_840 = L_831[L_837], L_831[L_836];
        L_831[L_837] = L_840;
        L_838 = L_838 .. L_830[L_810(L_799(L_795, L_839), L_831[(L_831[L_836] + L_831[L_837]) % 256])];
    end;
    return L_838;
end)("\178D\fZ\25300\225^\0043\165B+}jtO\206\160\138S$\170(;\231GF\187\176\162a"), {
    data = L_621(L_562(), L_225({
        L_621(L_562(), L_542),
        L_621(L_575() + (function(L_841, L_842, L_843, L_844, L_845, L_846, L_847, L_848)
            local L_849 = -3446139719 + (bit32.countlz(bit32.rshift(bit32.bnot((bit32.lrotate(L_841 - L_844, (string.unpack("<i8", "\016\000\000\000\000\000\000\000"))))), 16) - L_848 - L_844 + L_841 <= L_847 and L_844 or L_844) - L_844);
            local L_850 = -3336546071 + bit32.bor(bit32.countrz((bit32.bor(((bit32.lrotate(L_846, 24) ~= L_846 and L_845 or L_847) < L_844 and L_846 or L_848) + L_847 + L_843 - L_842 - L_841))), L_848, L_844);
            local L_851 = -7009578943 + (bit32.bxor((bit32.countrz((bit32.bor(bit32.lshift(bit32.rrotate(L_847, 15), 13) + L_844, L_848, L_849))) == L_849 and L_847 or L_849) + L_848 + L_844, L_847) + L_841);
            local L_852 = -1051299943 + ((bit32.lshift(bit32.rrotate(bit32.lshift(bit32.bor(L_850 == L_846 and L_845 or L_842, L_841, L_850) > L_841 and L_842 or L_843, 28) - L_842 + L_847, 8), 23) ~= L_841 and L_846 or L_843) + L_848);
            local L_853 = -3792569755 + bit32.bnot((bit32.bnot(bit32.bxor(bit32.lshift(L_843, 15) + L_847 + L_848 - L_844) + L_844 - L_843 + L_847)));
            return -4143374318 + (0 + bit32.bxor((bit32.bor(bit32.bor((bit32.rshift(bit32.bnot(bit32.bor(bit32.band((bit32.countrz((bit32.countlz((bit32.lshift(bit32.bor(bit32.countlz((bit32.rrotate(L_842, 20))) + L_850, L_851, L_845) - L_847 - L_842 >= L_842 and L_843 or L_852, 25))))))) ~= L_850 and L_843 or L_852, L_843, L_853) - L_850) > L_852 and L_848 or L_842, 14))), L_849, L_850))));
        end)(2014599860 + (bit32.lshift(bit32.bor((bit32.bor(250))), 19) - 80), 561530221 + (bit32.bor(bit32.lrotate(bit32.lrotate(math.floor(math.pi), 11) > 450 and 255 or 145, 25), 234) < 380 and 503 or 148), -1036683850 + bit32.bxor(bit32.bnot((66 >= 188 and 313 or 486) - 278) < math.floor(math.pi) and 182 or 152, 437), -1937407090 + bit32.bor(bit32.rshift(bit32.bxor(bit32.countlz(math.floor(math.pi) - string.packsize(">l>=<I ")), (string.unpack(">i8", "\000\000\000\000\000\000\000\021"))), 13), 324), -685138696 + ((60 - 387 - 427 <= 103 and string.unpack(">i8", "\000\000\000\000\000\000\000\208") or 449) ~= 5 and 431 or 303), -559303470 + ((bit32.lrotate(math.ceil(math.pi) + 323 > 306 and string.packsize("< j i ") or 255, 18) < 160 and string.unpack("<i8", "\188\000\000\000\000\000\000\000") or 80) >= 146 and string.packsize(" i  T=j") or 223), -1084489260 + bit32.rshift(bit32.bxor(bit32.bxor(string.packsize("=j ><") + 163, 323, (string.packsize("j=x"))) ~= 267 and 21 or 323, (string.unpack("<i8", "\132\000\000\000\000\000\000\000"))), 0), 894511548 + (bit32.lrotate(bit32.rshift(string.len("") < 320 and 318 or 113, 26) + 60, 29) == 422 and 249 or string.byte("\179v\134\205 ", 1, nil))), L_495()),
        L_621(L_575() + (function(L_854, L_855, L_856, L_857, L_858, L_859, L_860)
            local L_861 = 1634596339 + bit32.countlz(((((bit32.countlz(L_860) >= L_855 and L_857 or L_858) == L_858 and L_859 or L_857) - L_860 + L_859 >= L_860 and L_859 or L_857) - L_856 > L_859 and L_856 or L_855) - L_856);
            local L_862 = -2510169813 + bit32.bxor(bit32.band(bit32.countrz(bit32.rshift(bit32.bor(bit32.lrotate(L_857, 20) + L_857) - L_857, 1) - L_861) - L_861), L_857, L_855);
            local L_863 = -449311828 + bit32.rrotate(bit32.lshift(bit32.lshift(bit32.bor(bit32.bor((bit32.countlz(L_861 - L_861 - L_862 - L_856))) + L_859, L_859), 21), 27), 10);
            local L_864 = -144471061 + bit32.lrotate(bit32.countlz(bit32.rrotate(bit32.band(L_854 - L_859, L_859, L_859) - L_862 - L_854 + L_863, 18) - L_861) - L_854, 12);
            local L_865 = -5654446426 + bit32.bxor(((bit32.rshift(L_860, 3) + L_856 + L_856 ~= L_857 and L_859 or L_863) > L_860 and L_858 or L_854) - L_858 - L_864 + L_863 + L_855);
            return 5 + (0 + bit32.band(bit32.lshift(bit32.lshift(bit32.bxor(bit32.countrz((bit32.rrotate(bit32.bnot((bit32.band(bit32.countrz(bit32.band(bit32.countrz(L_856 ~= L_856 and L_858 or L_865) - L_862 + L_854, L_864) < L_865 and L_854 or L_863), L_865))), (string.unpack("<i8", "\017\000\000\000\000\000\000\000"))))), L_855), 26) + L_859 + L_864 + L_860 + L_856 + L_854, 28), L_864));
        end)(-603151241 + bit32.bxor(bit32.bor((bit32.bxor(string.len("") + 461, (string.byte("~\135\138y\a", 1, 5))))) >= 299 and string.byte(" ", 1, 1) or math.floor(math.pi), string.byte("\212}7\135", 1, nil), 139), 748660066 + (bit32.bor((string.packsize("=>T<ll<>="))) - 65 - 283 + 323 - 230), 1391233461 + bit32.bor(bit32.rshift(bit32.countrz(65) == math.ceil(math.pi) and string.byte("\158\201\015", 3, 3) or 440, 6) + 82, 156), -352607976 + bit32.bor((bit32.countlz(bit32.countlz(372) + 341 + 57))), -1079181294 + bit32.lshift((bit32.bxor(424, (string.len("\146"))) >= 67 and 116 or string.len("2]")) + math.ceil(math.pi) + 60, 25), -2598334188 + bit32.lrotate(bit32.bnot(string.byte("(\180I\189\031", 4, nil) + 89 > 407 and 301 or 72) - 125, 5), -951204662 + bit32.countrz(bit32.bor(bit32.bor(521), string.byte("z\235h", 2, nil), 135) ~= 505 and 344 or math.floor(math.pi))), L_545()),
        L_621(L_575() + (function(L_866, L_867, L_868, L_869, L_870)
            local L_871 = -1747325983 + (bit32.lshift(bit32.band(bit32.lrotate(bit32.rshift(L_867 + L_870 > L_869 and L_870 or L_870, 7) + L_869 + L_866, 17) + L_867, L_866), 23) - L_868);
            local L_872 = -5343179670 + (bit32.bor((bit32.band(bit32.bxor(bit32.lrotate(bit32.countrz(L_869 + L_866 - L_869), (string.unpack("<i8", "\024\000\000\000\000\000\000\000"))), L_870) - L_870 > L_871 and L_869 or L_867))) - L_866);
            local L_873 = 1885295747 + (bit32.rrotate(bit32.bor(bit32.bor(bit32.bor(L_870, L_872) + L_868 - L_871 - L_868, L_871) == L_868 and L_870 or L_869) + L_872, 15) + L_870);
            local L_874 = 5945115908 + (((bit32.bnot(bit32.countlz(L_869) + L_870) ~= L_866 and L_872 or L_866) + L_866 + L_872 < L_869 and L_869 or L_869) + L_868 + L_872 - L_867);
            local L_875 = -5513108301 + (bit32.countrz(bit32.rshift(bit32.rshift(L_866, (string.unpack("<i8", "\024\000\000\000\000\000\000\000"))) - L_869 - L_872, 9) + L_874 - L_873 <= L_870 and L_866 or L_870) - L_866 - L_869);
            return -2323878649 + (0 + (bit32.countrz((bit32.rrotate(bit32.countlz((bit32.countrz(bit32.bor(bit32.lrotate(bit32.countlz(bit32.countrz(L_875) - L_870 + L_871 + L_872), 21) + L_867, L_873, L_871) - L_875 + L_874))) - L_870, 10) >= L_869 and L_868 or L_867) + L_873) - L_875 - L_868 + L_872));
        end)(-2779804391 + bit32.lshift((627 + 511 > 135 and 136 or string.byte("\160\176M", 1, nil)) - 251, 30), -539605640 + (bit32.countrz(bit32.rshift(228, (string.unpack(">i8", "\000\000\000\000\000\000\000\025"))) - 395) + string.len("@;") - 421), -1784446155 + bit32.bxor(bit32.bor(bit32.rrotate(bit32.rshift(398, 19), 8), 76), string.packsize("<=n"), (math.floor(math.pi))), -1962731679 + bit32.rshift(bit32.lrotate(bit32.countlz(string.packsize("  >Tb>d<>=") + string.unpack("<i8", "\161\001\000\000\000\000\000\000")) + 192, 4), 14), -1589105885 + (bit32.bor((bit32.countlz((bit32.countlz((bit32.countlz(374))))))) - 292)), L_544()),
        L_621(L_575() + (function(L_876, L_877, L_878, L_879, L_880, L_881, L_882)
            local L_883 = 100821703 + (bit32.countrz((bit32.countrz(bit32.bnot((bit32.rshift(bit32.bnot((bit32.lrotate(L_876 + L_882, 17))) - L_878, (string.unpack("<i8", "\r\000\000\000\000\000\000\000"))))) + L_879))) + L_881);
            local L_884 = -110673926 + (bit32.bor(bit32.bxor(bit32.bxor(L_878 + L_881 + L_877, L_881, L_883) - L_883), L_879, L_878) - L_883 - L_879 - L_877 + L_876);
            local L_885 = -5219299959 + (bit32.lrotate(bit32.bnot(bit32.lshift(L_883, 13) - L_880 + L_880 + L_877 == L_884 and L_878 or L_882) - L_884 - L_882, 7) + L_878);
            local L_886 = -660162398 + bit32.bor(bit32.band(bit32.band(L_879 + L_878 <= L_880 and L_884 or L_878) - L_876 + L_883, L_881) - L_880 + L_878 - L_880);
            local L_887 = 2463816265 + (bit32.countrz(bit32.band(bit32.rrotate(bit32.band(L_876 + L_884, L_881), 10) <= L_877 and L_886 or L_876) - L_884 + L_886) - L_884 - L_884);
            return 611995994 + (0 + (bit32.countrz(bit32.countlz((bit32.bnot(bit32.rrotate(bit32.lrotate(bit32.bnot(bit32.rshift(bit32.lshift(bit32.bnot(L_885 - L_879 - L_887), 31) + L_876, 13) + L_877 - L_882), 6) + L_885, (string.unpack(">i8", "\000\000\000\000\000\000\000\029"))) + L_878 + L_878))) - L_879 + L_878) - L_882));
        end)(1444479627 + bit32.band(bit32.countrz(bit32.countlz((bit32.lrotate(string.unpack("<i8", "~\000\000\000\000\000\000\000"), 23))) < string.packsize(">j<B") and string.unpack(">i8", "\000\000\000\000\000\000\000\000") or string.packsize("f =l>>=I")), 256, 74), -3990671445 + bit32.bnot((bit32.bnot((string.unpack(">i8", "\000\000\000\000\000\000\000\143"))) - string.byte("\0069O\157", 1, 3) <= 440 and string.packsize("=>d=j=j><") or 500) - 376), 1869588402 + bit32.bxor(bit32.rshift(bit32.band(69), (string.unpack(">i8", "\000\000\000\000\000\000\000\021"))) + string.unpack("<i8", "c\001\000\000\000\000\000\000"), 178, (string.byte("\182~`", 2, nil))), 1851905181 + (((102 == 467 and 180 or 82) + string.len("") + string.unpack(">i8", "\000\000\000\000\000\000\000\208") <= 299 and 110 or 321) - 163), 176302124 + (bit32.lrotate(bit32.bxor(133, string.len(""), (string.unpack("<i8", "\221\000\000\000\000\000\000\000"))) + 232, (string.unpack("<i8", "\016\000\000\000\000\000\000\000"))) - 352 - 181), 129789606 + (bit32.band(478, 368, 466) - 201 - 258 + 335 + 35), 611995983 + ((bit32.band(bit32.rshift(string.unpack(">i8", "\000\000\000\000\000\000\001G"), 21) + 107) ~= string.unpack("<i8", "O\000\000\000\000\000\000\000") and 242 or 385) >= 291 and string.packsize("B <") or string.len("\253\244R"))), L_543()),
        L_621(L_575() + (function(L_888, L_889, L_890, L_891, L_892, L_893)
            local L_894 = -3637178431 + bit32.lrotate(((bit32.lrotate(bit32.rrotate((L_890 < L_890 and L_889 or L_888) + L_891, 27) - L_892, 29) + L_888 > L_891 and L_892 or L_888) <= L_888 and L_892 or L_893) + L_893, 26);
            local L_895 = -1300022364 + (bit32.countlz((bit32.countrz((bit32.bor((bit32.countrz(L_892 + L_890 - L_888 < L_894 and L_891 or L_894))))) > L_888 and L_890 or L_893) + L_891) + L_893);
            local L_896 = -204195018 + ((L_890 - L_895 - L_893 + L_895 - L_888 - L_892 + L_888 - L_890 + L_892 ~= L_889 and L_895 or L_889) + L_895);
            local L_897 = -1114418443 + bit32.lshift(bit32.bor(bit32.rrotate((bit32.lrotate(bit32.band(L_891, L_891) + L_888 - L_896, 27) ~= L_889 and L_895 or L_895) + L_895 - L_896, 26), L_891, L_888), 3);
            local L_898 = -506856520 + (bit32.lrotate(bit32.lshift(L_893 - L_892, 11) - L_894 + L_894, 18) - L_894 + L_891 + L_889 - L_897 - L_895);
            return -131230530 + (0 + (bit32.bxor(bit32.band((bit32.rrotate(bit32.rshift(bit32.band((bit32.bnot((bit32.band(bit32.lshift((L_889 - L_894 + L_890 == L_890 and L_888 or L_888) - L_891 - L_888 + L_892, 4) + L_896 + L_895 + L_888 + L_893, L_895))))), 20) + L_888, (string.unpack(">i8", "\000\000\000\000\000\000\000\020"))))), L_889) ~= L_896 and L_894 or L_898));
        end)(-2066295167 + bit32.band((bit32.countlz((math.ceil(math.pi) < string.len("z0\238") and 243 or 24) - 288 - string.unpack("<i8", "\181\000\000\000\000\000\000\000")))), 169768796 + bit32.rshift(bit32.lrotate(bit32.bxor(string.packsize("=h>j < H="), (string.len("\227"))) + 31 - 305, 15), 8), 93310186 + (bit32.bor(bit32.rrotate(243, (string.unpack("<i8", "\t\000\000\000\000\000\000\000"))) + 38, (string.unpack("<i8", "j\001\000\000\000\000\000\000"))) + 482 - string.byte("$;L\149", 3, 3)), -1364541184 + (bit32.countrz((bit32.bxor((304 >= 416 and math.ceil(math.pi) or string.packsize("  B=B<>>xh= ")) - 387, (string.byte("\197\156Xe", 1, 3))))) + 368), -4205114668 + bit32.rrotate(bit32.bnot(string.packsize("c245>><d =L =LB<") + 75 + 454 <= 453 and string.byte("\127", 1, 1) or 314), (string.unpack(">i8", "\000\000\000\000\000\000\000\000"))), 213610684 + bit32.rrotate((string.packsize("= i5=<x=<") - 330 ~= string.len("") and 484 or 8) - 379 + string.packsize(">h>f="), 12)), L_546()),
        L_621(L_575() + (function(L_899, L_900, L_901, L_902, L_903)
            local L_904 = -2933766714 + (bit32.bxor((bit32.bnot((bit32.lshift(bit32.rrotate((bit32.countrz(L_902 + L_903 + L_901) < L_901 and L_901 or L_899) + L_899, 18), 12))))) - L_903);
            local L_905 = -3732079516 + bit32.band((bit32.band(L_901, L_904, L_903) - L_899 - L_903 == L_902 and L_902 or L_903) + L_899 - L_902 - L_904 + L_903 + L_904, L_902, L_903);
            local L_906 = -3021290666 + bit32.bxor((bit32.countlz(bit32.band((bit32.bnot((bit32.bor(L_899, L_899))))) - L_905 - L_902) - L_905 == L_905 and L_900 or L_900) >= L_901 and L_903 or L_901, L_902);
            local L_907 = 1542175003 + bit32.countrz((bit32.countlz((bit32.lrotate(bit32.rshift(bit32.countrz(L_903 - L_903) - L_905, 19) + L_900 - L_900 - L_903, 26)))));
            local L_908 = 1033681424 + (bit32.bnot((bit32.band(bit32.lshift(L_902 - L_902, 17) + L_903 - L_902, L_900))) + L_902 + L_900 + L_901 > L_899 and L_904 or L_903);
            return -5355777000 + (0 + (bit32.band(bit32.bnot(bit32.bxor(bit32.bor((bit32.bor(bit32.bor(bit32.lrotate(bit32.bxor(bit32.bxor(bit32.rrotate(bit32.countlz((bit32.bnot((bit32.bnot(L_899))))), 25) + L_904, L_900), L_903), 24), L_901) + L_899, L_902, L_905))), L_899, L_899) - L_905 - L_899 + L_899), L_905) - L_906 - L_905));
        end)(-790178285 + bit32.lrotate(bit32.bxor(bit32.band((string.byte("\181e", 1, nil))), string.unpack(">i8", "\000\000\000\000\000\000\001m"), 494) + 375 < string.unpack("<i8", "\031\000\000\000\000\000\000\000") and string.len("\243\180\142Y") or string.packsize("<>I  J I4f=<"), 31), 905518457 + bit32.rshift(bit32.bnot((bit32.bnot(string.byte("\145\2374", 1, 3) > 93 and 252 or string.packsize(" < h=><<n> = xI6>= ")))) - string.packsize("=><=i2<<>B"), 2), -1485641558 + (bit32.countrz((bit32.rrotate((string.packsize("=<Tj> H<") >= string.packsize("=<=n<=f==L") and 50 or string.unpack("<i8", "8\001\000\000\000\000\000\000")) ~= 168 and 254 or string.unpack(">i8", "\000\000\000\000\000\000\001\178"), 25))) == string.len("\004\190") and string.len("\2350") or string.byte("\210\15087", 4, nil)), -1369441243 + (((bit32.bor(bit32.band(string.unpack(">i8", "\000\000\000\000\000\000\000\220"), 364), 168) >= 303 and 384 or string.packsize("<h=jb=L>=")) < string.packsize("l j= <") and 280 or 344) - math.floor(math.pi)), -628790269 + (bit32.band(bit32.countlz(-243) + 221) ~= 27 and 439 or 265)), L_547()),
        L_621(L_575() + (function(L_909, L_910, L_911, L_912, L_913, L_914)
            local L_915 = 523822840 + ((bit32.lshift(bit32.rrotate(bit32.rrotate((bit32.bxor(L_913, L_909) ~= L_911 and L_914 or L_914) - L_911 + L_914, 2), 2), 13) == L_912 and L_909 or L_909) + L_914 + L_911);
            local L_916 = -1979392120 + (bit32.lshift(bit32.band((bit32.rshift(bit32.rshift(bit32.band((bit32.lrotate(bit32.bnot(L_915 - L_912), 0))), 23) - L_911, 27))), 22) + L_911);
            local L_917 = 957016649 + (bit32.countlz((bit32.bxor(bit32.band((bit32.rshift(bit32.countlz(L_915 + L_913 + L_913 - L_913) - L_912, 27))), L_909, L_912))) - L_913);
            local L_918 = 1444862003 + bit32.rrotate(bit32.countlz(bit32.rrotate(bit32.bnot(L_913) + L_916 - L_909 + L_911 <= L_912 and L_912 or L_915, 27) + L_913 - L_909), 20);
            local L_919 = -5884006329 + bit32.band((bit32.bor(bit32.bnot(bit32.countlz(bit32.rrotate(L_910 <= L_917 and L_915 or L_910, 24) + L_913 + L_918) > L_911 and L_910 or L_909) + L_910, L_913, L_913)));
            return -2316013420 + (0 + bit32.bnot(bit32.bnot(bit32.rshift(bit32.rshift(bit32.band(bit32.band(bit32.bxor(bit32.countrz(L_912 + L_919) + L_915, L_918) + L_915, L_917, L_917) - L_911, L_919) - L_914, 6) + L_911, 18) ~= L_919 and L_913 or L_915) - L_915 - L_911 + L_910 - L_918 > L_914 and L_917 or L_911));
        end)(-2035961846 + bit32.bxor((132 - string.unpack("<i8", "\179\001\000\000\000\000\000\000") <= string.packsize("=jJf<<c215=") and 59 or 397) + 361, 100, 123), 1563921729 + (bit32.countlz(-88) - 428 + 84 + 38), 1978953837 + bit32.countrz((bit32.countrz(bit32.bxor(bit32.countlz(397), (string.unpack(">i8", "\000\000\000\000\000\000\001\188"))) - 184))), -241892389 + (((bit32.band((bit32.lshift(string.unpack(">i8", "\000\000\000\000\000\000\001\171"), 17))) <= string.len("\027\167") and 190 or 221) < string.packsize("=B= h j ><") and 264 or 386) - 230), -2961582140 + (bit32.lrotate(379 <= 244 and 443 or 411, 26) + 425 - 349 - 149), 176185312 + bit32.rshift(bit32.band((bit32.lshift(254 - math.floor(math.pi), 27))) - 55, 26)), L_548())
    }, "\n"))
});
if not L_920 then
    return ;
end;
local L_934 = L_212(L_686(L_575() + (function(L_921, L_922, L_923, L_924, L_925, L_926, L_927, L_928)
    local L_929 = -3362251820 + (bit32.bor(bit32.lshift(((bit32.band(L_928, L_926) - L_921 <= L_926 and L_924 or L_922) + L_922 <= L_926 and L_923 or L_926) + L_927, 14) + L_921, L_927) - L_928);
    local L_930 = -25920954 + (bit32.countlz(bit32.bnot((bit32.rrotate((L_925 == L_927 and L_922 or L_922) - L_927, 9) == L_926 and L_929 or L_923) + L_925 + L_925) >= L_925 and L_923 or L_927) - L_928);
    local L_931 = 2887284279 + (bit32.countlz((bit32.band(bit32.lshift(bit32.bor((L_930 - L_927 + L_928 <= L_925 and L_924 or L_928) - L_926 + L_922), 31), L_922))) - L_928);
    local L_932 = -5745612275 + bit32.bnot((bit32.countlz(bit32.band(bit32.lrotate(bit32.countlz(L_923 <= L_928 and L_927 or L_924) - L_929, 0) + L_929, L_922, L_922) + L_925 - L_921)));
    local L_933 = 1115657564 + (bit32.bnot(bit32.bor(bit32.rshift((L_923 - L_930 < L_928 and L_927 or L_930) + L_932, 9), L_928) + L_930 + L_921) + L_921 <= L_921 and L_923 or L_929);
    return -543830298 + (0 + (bit32.bor((bit32.countlz((bit32.bnot((bit32.lrotate(L_928 + L_924 - L_921, (string.unpack("<i8", "\004\000\000\000\000\000\000\000"))) + L_923 - L_924 == L_923 and L_930 or L_925) - L_930))))) + L_925 - L_926 - L_924 + L_926 + L_923 + L_931 - L_933 + L_930 + L_925 - L_925));
end)(741610149 + bit32.lrotate(bit32.band(-27, (math.modf(math.pi))) - string.unpack(">i8", "\000\000\000\000\000\000\000\213") + 384, 18), -1400738043 + (303 + string.byte("`\"\004\183", 2, nil) + 440 - string.unpack(">i8", "\000\000\000\000\000\000\000V") + 61 - 23), 1564999163 + (bit32.bor((string.len("\2482") < 126 and 139 or 340) + 402 == 255 and 242 or math.modf(math.pi), 408) - 327), -506094685 + (bit32.countrz((bit32.bnot((491 > 214 and string.unpack("<i8", "\246\001\000\000\000\000\000\000") or string.byte("\223\151\249-", 4, nil)) ~= 182 and string.unpack("<i8", "\142\000\000\000\000\000\000\000") or 403))) + 11), -6020120764 + bit32.bnot((bit32.rshift(bit32.rshift(bit32.bnot(142), 20) + 381, 29))), 322336180 + bit32.lshift(bit32.countlz((bit32.bor(bit32.countlz((string.packsize(" ==nl="))), (string.packsize("<>d>H "))))) + math.ceil(math.pi), 22), -1081505899 + bit32.bxor(bit32.bxor((bit32.bxor(bit32.bor(bit32.rshift(498, (string.unpack(">i8", "\000\000\000\000\000\000\000\017"))), 193), 510, 92))), 58), 1693308697 + (bit32.bxor(math.ceil(math.pi), string.packsize(" i>"), (math.ceil(math.pi))) + 283 - 196 - 279 - 287)), L_920), "\n");
local L_935 = L_934[1];
local L_936 = L_387(L_225({ L_485(L_546()), L_485(L_547()), L_485(L_548()), L_485(L_545()), L_485(L_543()), L_485(L_544()), L_485(L_495()), L_485(L_542) }));
if not L_169(L_935, L_621(L_575() + (function(L_937, L_938, L_939, L_940, L_941, L_942)
    local L_943 = -3526842893 + bit32.band((bit32.bor((bit32.rrotate(bit32.lshift(bit32.bnot(bit32.bxor((bit32.countrz((bit32.bnot(L_937))))) + L_938) - L_938, 6), 23)))));
    local L_944 = 1168977887 + bit32.countlz((bit32.lrotate(bit32.bnot((bit32.rshift(bit32.lshift(L_939, 18), 5))) - L_938 + L_940, 25) + L_939 < L_937 and L_939 or L_939) + L_943);
    local L_945 = 443034632 + ((bit32.bxor(bit32.bxor(bit32.lrotate(bit32.rshift(L_944, (string.unpack("<i8", "\027\000\000\000\000\000\000\000"))) < L_940 and L_938 or L_939, 7) + L_943, L_941, L_940) - L_940 - L_944, L_942, L_939) < L_939 and L_944 or L_944) + L_937);
    local L_946 = -2488786761 + (bit32.rrotate((bit32.bnot((bit32.countrz(L_939 - L_939))) - L_938 + L_941 == L_940 and L_943 or L_944) ~= L_943 and L_941 or L_940, 16) + L_944 - L_942);
    local L_947 = -880944321 + (bit32.bnot((bit32.rshift(bit32.rrotate(bit32.rshift(bit32.bxor(L_943) <= L_938 and L_938 or L_939, 11) - L_938, 10) + L_946 + L_945, 13))) < L_937 and L_939 or L_940);
    return -5405602300 + (0 + (bit32.lrotate(bit32.rrotate(bit32.bxor((bit32.rshift(bit32.bor(bit32.countlz((bit32.lrotate(bit32.rshift(bit32.countlz(L_944) + L_940 ~= L_941 and L_937 or L_942, 15) + L_942, 25))), L_945), 16) == L_942 and L_939 or L_937) - L_939 + L_939 - L_940 >= L_943 and L_946 or L_946, L_947, L_946) + L_947, 11) == L_942 and L_944 or L_943, 21) - L_942));
end)(-1033586271 + bit32.bxor(string.packsize("j") - string.len("w") - 54 + 188 > string.packsize("=B<=<") and string.packsize(">fc199=>") or 373), -570215945 + (bit32.bxor((100 > 49 and string.packsize("<=x T j=>L=<L =") or string.byte("\188w\157\183\156", 4, nil)) + 287 + 388, 395) <= 35 and math.ceil(math.pi) or 346), 1164188260 + (((string.packsize(" >x==") < 326 and math.floor(math.pi) or math.modf(math.pi)) + 508 >= string.unpack("<i8", "\167\000\000\000\000\000\000\000") and 330 or 450) - 471 <= 458 and 152 or 96), 1234911489 + bit32.rshift(bit32.lshift(bit32.countlz(120 - string.unpack("<i8", "\210\001\000\000\000\000\000\000")), 10) - 8, 18), -1368714036 + bit32.countrz(bit32.lshift(896 - string.packsize("=< Hn= <"), 5) >= string.unpack(">i8", "\000\000\000\000\000\000\000\r") and 507 or 430), -1144235251 + (bit32.countrz((string.packsize(">< b <n = L<") + 133 <= string.packsize("==L<<x<<") and 354 or 298) + 212) ~= string.unpack("<i8", "p\001\000\000\000\000\000\000") and 473 or 40)), L_936())) then
    local L_948 = { "User is Blacklisted", "Executor not allowed", "Key doesn't exist", "Key has expired", "HWID mismatch", "Location mismatch" };
    local L_949 = L_934[3];
    local L_950 = "Whitelist Error!";
    for L_951, L_952 in L_948, nil, nil do
        if L_952 == L_949 then
            L_950 = L_952;
            break;
        end;
    end;
    L_0(L_950);
    return ;
end;
local L_953 = false;
local L_990 = L_621(L_562() - (function(L_954, L_955, L_956, L_957, L_958, L_959, L_960)
    local L_961 = -486742079 + (bit32.lshift(bit32.rshift(bit32.countrz((L_957 - L_956 + L_959 >= L_959 and L_959 or L_955) + L_954 - L_954), 28) < L_956 and L_954 or L_958, 15) - L_956);
    local L_962 = -194087703 + bit32.bxor(bit32.rrotate(bit32.bnot((bit32.rrotate(bit32.countlz((bit32.lshift(L_958 + L_958 - L_960 + L_959, 16))), 19))) + L_955, 9), L_960, L_958);
    local L_963 = -1399159151 + ((bit32.rrotate(L_960 - L_956, 0) ~= L_957 and L_955 or L_957) - L_955 + L_959 - L_955 - L_957 + L_962 + L_957 + L_961);
    local L_964 = -673737556 + ((bit32.bxor((bit32.rshift(L_956 + L_963, 16))) - L_961 < L_954 and L_963 or L_958) - L_959 - L_958 + L_958 + L_961 - L_963);
    local L_965 = 1426225641 + (bit32.countrz((bit32.countrz((bit32.lshift((L_962 - L_964 == L_958 and L_956 or L_962) + L_960, 22))) >= L_957 and L_956 or L_957) - L_961 - L_962) >= L_957 and L_954 or L_954);
    return -1251641695 + (0 + bit32.band(((bit32.rshift(bit32.bor((bit32.rshift(bit32.band(bit32.rrotate(bit32.countlz(bit32.countrz((bit32.rshift(bit32.band(bit32.bor(L_956, L_964, L_963), L_958) - L_963, 11))) - L_961 - L_955 - L_960), 13) + L_965 + L_959), 20))), 24) == L_954 and L_963 or L_965) >= L_962 and L_964 or L_963) + L_965));
end)(553971154 + (96 - string.unpack(">i8", "\000\000\000\000\000\000\001!") + string.len("\211") + 493 - string.unpack("<i8", "\165\001\000\000\000\000\000\000") - string.byte("\165", 1, nil)), 1631888278 + (bit32.countlz((string.unpack("<i8", "\235\001\000\000\000\000\000\000"))) - 289 + 209 - 172 - string.packsize("H=c34<<")), -4806379623 + bit32.bnot((bit32.bnot(bit32.bxor(281) - math.floor(math.pi) - string.unpack("<i8", "\223\001\000\000\000\000\000\000")))), -6208541710 + bit32.bnot(bit32.rshift(382 - string.unpack(">i8", "\000\000\000\000\000\000\000\200") >= string.byte("p", 1, 1) and 147 or string.len("%"), 17) + 201), 1857459036 + bit32.countrz(string.unpack("<i8", "\a\001\000\000\000\000\000\000") + 208 + string.packsize("j<B<T>=") - 466 + string.unpack("<i8", "}\000\000\000\000\000\000\000")), -2979304615 + bit32.bor((bit32.band((bit32.lrotate(bit32.bor(string.unpack("<i8", "\018\000\000\000\000\000\000\000") - 388, 238), 7))))), 1744046181 + ((bit32.lrotate(string.unpack(">i8", "\000\000\000\000\000\000\001\254") - string.unpack(">i8", "\000\000\000\000\000\000\001Z") + 223, 16) ~= 81 and 111 or 65) - 231)), L_225({
    L_621(L_562(), L_542),
    L_621(L_575() + (function(L_966, L_967, L_968, L_969, L_970, L_971, L_972, L_973, L_974)
        local L_975 = -4866179450 + (bit32.rrotate(bit32.countrz(bit32.countlz(L_971) <= L_973 and L_968 or L_973) - L_968 + L_969 + L_968, (string.unpack(">i8", "\000\000\000\000\000\000\000\016"))) - L_969 - L_974 + L_972);
        local L_976 = -7893193220 + (bit32.bor((bit32.lshift(L_971 - L_975 < L_966 and L_966 or L_966, 20) - L_970 - L_966 <= L_972 and L_974 or L_968) + L_975 - L_975, L_971) + L_971);
        local L_977 = -986796670 + ((bit32.countrz((bit32.bnot(L_969) > L_972 and L_976 or L_971) > L_967 and L_967 or L_970) + L_971 ~= L_975 and L_974 or L_975) + L_975 + L_970 + L_976 + L_970);
        local L_978 = 1408961093 + (bit32.rshift(bit32.rshift(bit32.bor(bit32.bnot(L_971 + L_976 - L_975) - L_972, L_977) - L_969 - L_968, 26), 30) - L_975);
        local L_979 = 2275542018 + (bit32.countlz(bit32.countlz(bit32.lrotate(bit32.rrotate(L_969, 29) - L_972, 31) - L_968 - L_967) - L_978 - L_966) ~= L_976 and L_974 or L_966);
        return -1106154847 + (0 + (bit32.band(bit32.countlz(bit32.bor(bit32.rrotate(bit32.countrz((bit32.countlz(bit32.bor(((L_971 + L_977 > L_968 and L_976 or L_968) > L_968 and L_971 or L_975) - L_974 + L_979, L_972, L_976) + L_978) > L_970 and L_972 or L_971) - L_971) + L_975, (string.unpack(">i8", "\000\000\000\000\000\000\000\006"))) - L_968) + L_970) >= L_977 and L_978 or L_974, L_970) - L_972));
    end)(-1704696402 + bit32.lrotate(bit32.countlz(bit32.bor((string.byte("]9\fg\006", 1, 5))) - 320) + string.unpack("<i8", "\249\000\000\000\000\000\000\000"), 14), 437400171 + bit32.bxor(((string.byte(";M", 1, 2) < 300 and string.len("") or string.byte("\190\161\194\162", 4, nil)) == 471 and 160 or 329) + 94 + 188), -1192890742 + bit32.bxor(bit32.countlz(bit32.bor(169, 374) > string.unpack(">i8", "\000\000\000\000\000\000\001\225") and 365 or string.unpack("<i8", "#\000\000\000\000\000\000\000")) + 3, (string.len("\1494"))), -782967267 + bit32.countrz(bit32.bnot(bit32.bnot((string.packsize("<>L=>J=<b >"))) == string.len("\017\021\017") and string.unpack("<i8", "\178\000\000\000\000\000\000\000") or 88) == 148 and string.byte("LV\002\164&", 4, nil) or string.byte("\001-", 2, nil)), 2121152158 + (bit32.rshift(bit32.countrz((bit32.lrotate(string.len("") - 264, 12))), 11) >= math.floor(math.pi) and string.packsize(" d<T><d=h< d=") or string.packsize("<<hB>> H=> ")), 2137975020 + (((458 == 232 and string.unpack("<i8", "j\001\000\000\000\000\000\000") or 188) - 402 > 5 and math.ceil(math.pi) or string.byte("\1615\b", 1, 1)) - 216 - 280), -1575776983 + (bit32.bxor(bit32.bnot((bit32.lrotate(string.packsize("<> <j<> Hi<") + 297, 27))), 170) - 328), -1929227424 + (bit32.countlz(string.len("\155\147") + math.modf(math.pi)) - 115 + string.len("r") + string.unpack("<i8", "=\001\000\000\000\000\000\000")), -871178069 + ((bit32.bor(bit32.band(386 - string.unpack(">i8", "\000\000\000\000\000\000\000\004"), string.packsize(">n> j<B= >"), 164), 307) == 22 and 9 or string.unpack("<i8", "O\001\000\000\000\000\000\000")) - string.unpack(">i8", "\000\000\000\000\000\000\001\000"))), L_495()),
    L_621(L_575() - (function(L_980, L_981, L_982, L_983, L_984)
        local L_985 = -6634156270 + (bit32.bxor(bit32.band(bit32.band(L_981 >= L_980 and L_980 or L_984, L_981) - L_982 + L_981 - L_981 + L_981), L_980) - L_984 - L_983);
        local L_986 = 1765695251 + bit32.countrz(bit32.rrotate(bit32.rrotate(bit32.countlz(bit32.bor(bit32.rrotate(bit32.countrz(L_981), 5), L_980) - L_980), 9), 12) + L_981 ~= L_984 and L_980 or L_982);
        local L_987 = 125945278 + (bit32.rrotate(bit32.bor(((bit32.lrotate(L_984, 26) - L_984 + L_986 == L_980 and L_981 or L_980) - L_985 < L_982 and L_982 or L_983) - L_981, L_983), 27) > L_982 and L_986 or L_986);
        local L_988 = 1810137330 + bit32.countrz((((bit32.bxor(bit32.bnot(L_981 + L_984) + L_985, L_987, L_984) < L_981 and L_986 or L_986) + L_983 >= L_982 and L_986 or L_984) > L_980 and L_983 or L_985) + L_984);
        local L_989 = -2316613036 + ((bit32.countrz(bit32.rshift(bit32.countrz(L_985 - L_980 - L_982 >= L_980 and L_988 or L_984), 0) <= L_985 and L_983 or L_986) < L_982 and L_985 or L_985) - L_983 + L_987);
        return -555766195 + (0 + bit32.bor(bit32.rrotate(bit32.band(bit32.bnot(bit32.bxor(bit32.bnot(bit32.rrotate(bit32.lshift(L_980 + L_989, 16) - L_980, 9) - L_989 + L_987 + L_983), L_981) + L_980 - L_985 - L_982 - L_989) + L_987, L_983) + L_988, 10) + L_981));
    end)(-2117600612 + bit32.lshift(string.len("") - string.byte("\199C\129\240I", 4, nil) - 45 + string.len("\196") - string.unpack("<i8", "\029\001\000\000\000\000\000\000"), 16), -806567105 + bit32.countrz((57 > 463 and 345 or math.ceil(math.pi)) + string.packsize(">i=>=x>h>L>>b=") - math.modf(math.pi) + 167), -1901859336 + (bit32.bnot(bit32.band((math.floor(math.pi))) - string.len("\193") - string.len("")) >= string.unpack(">i8", "\000\000\000\000\000\000\001\202") and string.byte("\156\249R", 3, 3) or 66), -469934546 + ((string.len("t\225") - string.len("\210\178") + 212 ~= string.unpack(">i8", "\000\000\000\000\000\000\000\243") and 472 or string.byte("w", 1, 1)) - string.unpack(">i8", "\000\000\000\000\000\000\000\235") - 455), -1696686632 + ((bit32.band(41 == 507 and 194 or string.packsize("i6L<=<d >")) ~= 494 and 5 or 140) - string.packsize("= J=J< ") <= string.packsize(" x >l>>") and string.byte("\203'", 2, nil) or 396)), L_936())
}, "\n"));
L_14(function()
    L_953 = true;
    local L_991 = {};
    local L_1003 = (function(L_992, L_993, L_994, L_995, L_996, L_997)
        local L_998 = 1274865552 + (bit32.rshift(bit32.rshift(bit32.lshift(((L_992 >= L_994 and L_994 or L_994) < L_996 and L_993 or L_994) + L_994 + L_994 - L_993 ~= L_995 and L_994 or L_994, 22), 24), 11) - L_993);
        local L_999 = -812163874 + bit32.rshift(bit32.countrz(bit32.bnot((bit32.lshift(bit32.countlz(bit32.lshift(L_992 <= L_997 and L_995 or L_998, 11) - L_992) + L_993, 24))) + L_998), 0);
        local L_1000 = -2574690238 + bit32.rrotate((bit32.bor(bit32.countlz(L_998) - L_996 - L_993 ~= L_998 and L_993 or L_999, L_996, L_996) >= L_996 and L_997 or L_997) - L_995 + L_998 - L_993, 4);
        local L_1001 = -615305589 + (bit32.countlz((bit32.bxor(bit32.lshift(L_997 - L_993 - L_993 + L_996, 19) - L_997, L_992, L_994))) - L_1000 + L_996 + L_1000);
        local L_1002 = -1733247127 + (bit32.rshift((L_1000 >= L_994 and L_992 or L_993) + L_994 + L_998 + L_997 - L_999 - L_994, 23) + L_994 - L_992 >= L_995 and L_993 or L_994);
        return 16 * ((3799911065889967 + (0 + (bit32.countlz((bit32.bnot((bit32.lshift(bit32.bnot(bit32.rshift(bit32.band(bit32.bor(bit32.bxor(bit32.bnot(bit32.rrotate(L_998 - L_998, 11) - L_1000 - L_996 - L_994 - L_993 + L_996), L_997, L_1002) + L_995) + L_1000, L_996), 22) + L_997), 0))))) - L_994))) / 4503599627370496 + 1);
    end)(-838797497 + (bit32.bor((108 == 472 and math.ceil(math.pi) or 505) > string.unpack(">i8", "\000\000\000\000\000\000\000\162") and string.packsize("=<=I5=I>b >L<>") or 406, 335) + 473 + 222), 284282458 + ((bit32.rrotate(861, 18) + 124 < string.len("\b") and string.len("\139") or 197) - 403), -1119703885 + bit32.countlz(bit32.countlz((bit32.bor(bit32.bnot(137), 106, (math.ceil(math.pi))))) - string.len("\141\251")), -1532112459 + (bit32.countlz((bit32.bnot(bit32.band(186, 263, (string.byte("Cdg\233", 3, 4))) - 37))) + 284), 2070483677 + (bit32.lrotate(bit32.bor((bit32.lshift(460, 22))), 17) - string.unpack("<i8", "\148\001\000\000\000\000\000\000") + 146), 200898027 + (bit32.countlz(458) - 163 - string.unpack("<i8", "P\001\000\000\000\000\000\000") > 300 and 192 or 219));
    local L_1004 = L_387(3);
    repeat
        local L_1005, L_1006 = L_9(function()
            return L_15();
        end);
        if not L_1005 or not L_169(L_1006, L_1006) then
            (function()
                local L_1007 = string.byte;
                local L_1008 = string.rep(" ", 8);
                local L_1016 = function(L_1009, L_1010)
                    local L_1011 = 1;
                    local L__1012 = 0;
                    while L_1009 > 0 and L_1010 > 0 do
                        local L_1013 = L_1009 % 2;
                        local L_1014 = L_1010 % 2;
                        if L_1013 ~= L_1014 then
                            L__1012 = L__1012 + L_1011;
                        end;
                        L_1009, L_1010, L_1011 = (L_1009 - L_1013) / 2, (L_1010 - L_1014) / 2, L_1011 * 2;
                    end;
                    if L_1009 < L_1010 then
                        L_1009 = L_1010;
                    end;
                    while L_1009 > 0 do
                        local L_1015 = L_1009 % 2;
                        if L_1015 > 0 then
                            L__1012 = L__1012 + L_1011;
                        end;
                        L_1009, L_1011 = (L_1009 - L_1015) / 2, L_1011 * 2;
                    end;
                    return L__1012;
                end;
                local L_1022 = function(L_1017, L_1018, L_1019)
                    if L_1019 then
                        local L_1020 = L_1017 / 2 ^ (L_1018 - 1) % 2 ^ (L_1019 - 1 - (L_1018 - 1) + 1);
                        return L_1020 - L_1020 % 1;
                    end;
                    local L_1021 = 2 ^ (L_1018 - 1);
                    return L_1017 % (L_1021 + L_1021) >= L_1021 and 1 or 0;
                end;
                local L_1027 = function()
                    local L_1023, L_1024, L_1025, L_1026 = L_1007(L_1008, 1, 4);
                    return L_1016(L_1026, 64) * 16777216 + L_1016(L_1025, 32) * 65536 + L_1016(L_1024, 16) * 256 + L_1016(L_1023, 8);
                end;
                local L_1034 = function()
                    local L_1028 = L_1027();
                    local L_1029 = L_1027();
                    local L_1030 = 1;
                    local L_1031 = L_1022(L_1029, 1, 20) * 4294967296 + L_1028;
                    local L_1032 = L_1022(L_1029, 21, 31);
                    local L_1033 = -1 ^ L_1022(L_1029, 32);
                    if L_1032 == 0 then
                        if L_1031 == 0 then
                            return L_1033 * 0;
                        end;
                        L_1032 = 1;
                        L_1030 = 0;
                    elseif L_1032 == 2047 then
                        return L_1031 == 0 and L_1033 * 1 / 0 or L_1033 * 0 / 0;
                    end;
                    return L_1033 * 2 ^ (L_1032 - 1023) * (L_1030 + L_1031 / 4503599627370496);
                end;
                local L_1040 = function()
                    for L_1035 = 1, L_1027(), 1 do
                        while true do
                            local L_1036 = {};
                            for L_1037 = 0, 255, 1 do
                                L_1036[L_1016(L_1027(), L_1027())] = L_1016(L_1027(), L_1027());
                                L_1036[L_1016(L_1027(), L_1027())] = L_1016(L_1027(), L_1027());
                            end;
                            for L_1038 = 1, L_1027(), 1 do
                                for L_1039 = 0, 255, 1 do
                                    L_1036[L_1034() and L_1027()] = L_1036[L_1034()] or L_1016(L_1034(), L_1034());
                                    L_1036[L_1027()] = L_1034() and L_1034();
                                    L_1036[L_1022(L_1034(), L_1027())] = { L_1034(), L_1027() };
                                end;
                            end;
                        end;
                    end;
                    return L_1016(L_1034(), L_1027());
                end;
                while L_1040() do
                    L_1040();
                end;
                return ;
            end)();
            local L_1041 = CHUNK;
            local L_1042 = 7;
            local L_1043 = L_1042[L_1042];
            local L_1044 = {};
            for L_1045 = 1, #L_1044, 1 do
                L_1044[L_1045] = L_1044;
            end;
            while true do
            end;
        end;
        L_1003 = L_1003 + L_1006;
    until not (L_1003 < (function(L_1046, L_1047, L_1048, L_1049, L_1050, L_1051, L_1052)
        local L_1053 = -1097001223 + (bit32.lrotate(bit32.band(bit32.countrz((bit32.countlz(bit32.lrotate(L_1048 + L_1047 + L_1050, 23) - L_1048))) + L_1048), 13) + L_1049);
        local L_1054 = -1840266034 + bit32.bxor(bit32.countlz((bit32.lrotate(bit32.rshift((L_1047 == L_1050 and L_1046 or L_1052) + L_1046 + L_1052 > L_1049 and L_1053 or L_1048, 0) + L_1053, 11))) + L_1048, L_1053);
        local L_1055 = -2649976018 + bit32.rrotate(bit32.bor(bit32.lshift(bit32.rrotate(L_1048 + L_1053, 11) + L_1054 + L_1048 - L_1052, 11) == L_1047 and L_1049 or L_1047, L_1054, L_1054) >= L_1050 and L_1046 or L_1052, 14);
        local L_1056 = 55978536 + ((bit32.countlz(L_1047) + L_1055 + L_1048 - L_1054 - L_1054 + L_1053 > L_1052 and L_1054 or L_1046) - L_1051 + L_1047 ~= L_1054 and L_1048 or L_1051);
        local L_1057 = 59394693 + bit32.countlz((bit32.bor(L_1052 - L_1049 - L_1048 - L_1046) + L_1054 + L_1054 <= L_1054 and L_1056 or L_1046) + L_1050 - L_1056);
        return -2 + (0 + bit32.countlz((bit32.rrotate(bit32.countrz(bit32.bnot((bit32.bor(bit32.rrotate(bit32.rrotate(bit32.lrotate(bit32.band((bit32.bxor(bit32.rrotate(L_1051, 24) + L_1055 - L_1051))) + L_1050, 23) - L_1052 + L_1052 + L_1050, 14), (string.unpack(">i8", "\000\000\000\000\000\000\000\015"))) + L_1046 + L_1047))) + L_1055), 18))));
    end)(1066481875 + (bit32.countlz(429 + string.packsize("==d> b>T>>>") + string.len("sN")) - string.unpack(">i8", "\000\000\000\000\000\000\000f") + string.unpack("<i8", "h\001\000\000\000\000\000\000")), 1387562548 + (bit32.rrotate(bit32.lshift(bit32.countlz((bit32.bnot(79))), 9), 8) + string.byte("\237b/\196R", 4, 5)), 816238789 + bit32.countrz((bit32.rshift(342 + string.len("\144") - string.len("") - 37, 29))), -744474634 + (bit32.bor(544 - string.byte("\132\002\157", 2, nil) + string.unpack(">i8", "\000\000\000\000\000\000\000D"), math.modf(math.pi), 231) - 297), -161711046 + bit32.band(bit32.bnot(333 + math.ceil(math.pi) + string.byte("\167T\250+", 4, nil)), 176, (string.byte("\237\227", 2, 2))), -1297206223 + (bit32.rrotate(bit32.lshift(bit32.countrz(479) + string.len("\183"), 19), 1) <= 178 and string.unpack(">i8", "\000\000\000\000\000\000\001.") or 146), 574651213 + (bit32.countlz((bit32.bxor(string.byte("\b", 1, nil) >= string.unpack(">i8", "\000\000\000\000\000\000\001\027") and math.modf(math.pi) or 20, string.len(""), 131))) - 238 - 372)));
    local L_1058 = L_387(L_1004() + 1);
    local L_1105 = L_794((function(...)
        local L_1059 = ...;
        local L_1060 = 324911313 + bit32.band((bit32.rshift(bit32.bnot((bit32.band(449, (string.len("P0"))))), 7)));
        local L_1061 = STACK;
        local L_1062 = string.char;
        local L_1063 = string.byte;
        local L_1064 = setmetatable;
        local L_1065 = getmetatable;
        local L_1066 = next;
        local L_1067 = { [0] = { [0] = 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 }, { [0] = 1, 0, 3, 2, 5, 4, 7, 6, 9, 8, 11, 10, 13, 12, 15, 14 }, { [0] = 2, 3, 0, 1, 6, 7, 4, 5, 10, 11, 8, 9, 14, 15, 12, 13 }, { [0] = 3, 2, 1, 0, 7, 6, 5, 4, 11, 10, 9, 8, 15, 14, 13, 12 }, { [0] = 4, 5, 6, 7, 0, 1, 2, 3, 12, 13, 14, 15, 8, 9, 10, 11 }, { [0] = 5, 4, 7, 6, 1, 0, 3, 2, 13, 12, 15, 14, 9, 8, 11, 10 }, { [0] = 6, 7, 4, 5, 2, 3, 0, 1, 14, 15, 12, 13, 10, 11, 8, 9 }, { [0] = 7, 6, 5, 4, 3, 2, 1, 0, 15, 14, 13, 12, 11, 10, 9, 8 }, { [0] = 8, 9, 10, 11, 12, 13, 14, 15, 0, 1, 2, 3, 4, 5, 6, 7 }, { [0] = 9, 8, 11, 10, 13, 12, 15, 14, 1, 0, 3, 2, 5, 4, 7, 6 }, { [0] = 10, 11, 8, 9, 14, 15, 12, 13, 2, 3, 0, 1, 6, 7, 4, 5 }, { [0] = 11, 10, 9, 8, 15, 14, 13, 12, 3, 2, 1, 0, 7, 6, 5, 4 }, { [0] = 12, 13, 14, 15, 8, 9, 10, 11, 4, 5, 6, 7, 0, 1, 2, 3 }, { [0] = 13, 12, 15, 14, 9, 8, 11, 10, 5, 4, 7, 6, 1, 0, 3, 2 }, { [0] = 14, 15, 12, 13, 10, 11, 8, 9, 6, 7, 4, 5, 2, 3, 0, 1 }, { [0] = 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0 } };
        local L_1074 = function(L_1068, L_1069)
            local L_1070 = 1;
            local L_1071 = 0;
            while L_1068 > 0 and L_1069 > 0 do
                local L_1072 = L_1068 % 16;
                local L_1073 = L_1069 % 16;
                L_1071 = L_1071 + L_1067[L_1072][L_1073] * L_1070;
                L_1068 = (L_1068 - L_1072) / 16;
                L_1069 = (L_1069 - L_1073) / 16;
                L_1070 = L_1070 * 16;
            end;
            return L_1071 + L_1068 * L_1070 + L_1069 * L_1070;
        end;
        local L_1075 = function()
            L_1074 = function()
                return 0;
            end;
            L_1060 = 0;
            while true do
            end;
        end;
        local L_1076 = function(...)
            return ...;
        end;
        local L_1077 = L_1064({}, { __tostring = L_1075, __call = L_1076, __add = L_1076, __sub = L_1076, __mul = L_1076, __div = L_1076, __mod = L_1076, __pow = L_1076, __eq = L_1076, __lt = L_1076, __le = L_1076, __concat = L_1076, __index = L_1076, __newindex = L_1076, __metatable = false });
        local L_1078 = L_1077(L_1077, L_1077, L_1077());
        local L_1079 = (function(...)
            return ...;
        end)(L_1077, L_1077) and L_1077 or L_1077;
        local L_1080 = L_1077 + L_1077 - L_1077 * L_1077 / L_1077 % L_1077 ^ L_1077;
        local L_1081 = L_1077 == L_1077 and L_1077 ~= L_1077;
        local L_1082 = L_1077 < L_1077 and L_1077 > L_1077;
        local L_1083 = L_1077 <= L_1077 and L_1077 >= L_1077;
        L_1077(L_1077, L_1077, L_1077(L_1077), L_1077());
        L_1077(L_1077 .. L_1077, L_1077 .. "", "" .. L_1077);
        L_1077[L_1077] = L_1077;
        L_1077[L_1077] = L_1077[L_1077];
        if not L_1061 or (type(L_1061) ~= "table" or L_1065(L_1061) ~= nil) then
            return L_1075();
        end;
        L_1064(L_1061, nil);
        local L_1084 = {};
        local L_1085 = {};
        local L_1086 = false;
        for L_1087, L_1088 in L_1066, L_1061, nil do
            if L_1084 == L_1088 then
                L_1086 = true;
                L_1061[L_1087] = L_1085;
            end;
        end;
        if not L_1086 or L_1084 ~= L_1085 then
            return L_1075();
        end;
        local L_1089 = { nil, nil, nil, nil, L_1063(L_1059, 1, 4) };
        for L_1090 = 1, 4, 1 do
            L_1089[L_1090] = L_1060 % 256;
            L_1060 = L_1060 / 256;
            L_1060 = L_1060 - L_1060 % 1;
        end;
        local L_1091 = L_1089[3];
        local L_1092 = 4 * (L_1089[1] % 64) + 1;
        local L_1093 = 2 * (L_1089[2] % 128) - 1;
        local L_1094 = {};
        local L_1095 = {};
        for L_1096 = 0, 255, 1 do
            L_1094[L_1091] = L_1062(L_1091);
            L_1095[L_1091] = L_1091;
            L_1091 = (L_1092 * L_1091 + L_1093) % 256;
        end;
        local L_1097 = 0;
        for L_1098 = 0, 255, 1 do
            L_1097 = (L_1097 + L_1095[L_1098] + L_1089[L_1098 % 8 + 1]) % 256;
            local L_1099;
            L_1095[L_1098], L_1099 = L_1095[L_1097], L_1095[L_1098];
            L_1095[L_1097] = L_1099;
        end;
        local L_1100 = 0;
        local L_1101 = 0;
        local L_1102 = "";
        for L_1103 = 5, #L_1059, 1 do
            L_1100 = (L_1100 + 1) % 256;
            L_1101 = (L_1101 + L_1095[L_1100]) % 256;
            local L_1104;
            L_1095[L_1100], L_1104 = L_1095[L_1101], L_1095[L_1100];
            L_1095[L_1101] = L_1104;
            L_1102 = L_1102 .. L_1094[L_1074(L_1063(L_1059, L_1103), L_1095[(L_1095[L_1100] + L_1095[L_1101]) % 256])];
        end;
        return L_1102;
    end)("\152\024r\196\165(\149Y\194rx\205\0170\144V\196KTL?a\140\rKz\187\179\027d\134<\173\2092\208oL"), { data = L_990 });
    local L_1106 = L_621(L_575() + 22, L_485(L_1058() .. "" .. L_1058() .. L_936() .. L_1058()));
    if not L_169(L_1105, L_1106) then
        (function()
            local L_1107 = string.byte;
            local L_1108 = string.rep(" ", 8);
            local L_1116 = function(L_1109, L_1110)
                local L_1111 = 1;
                local L_1112 = 0;
                while L_1109 > 0 and L_1110 > 0 do
                    local L_1113 = L_1109 % 2;
                    local L_1114 = L_1110 % 2;
                    if L_1113 ~= L_1114 then
                        L_1112 = L_1112 + L_1111;
                    end;
                    L_1109, L_1110, L_1111 = (L_1109 - L_1113) / 2, (L_1110 - L_1114) / 2, L_1111 * 2;
                end;
                if L_1109 < L_1110 then
                    L_1109 = L_1110;
                end;
                while L_1109 > 0 do
                    local L_1115 = L_1109 % 2;
                    if L_1115 > 0 then
                        L_1112 = L_1112 + L_1111;
                    end;
                    L_1109, L_1111 = (L_1109 - L_1115) / 2, L_1111 * 2;
                end;
                return L_1112;
            end;
            local L_1122 = function(L_1117, L_1118, L_1119)
                if L_1119 then
                    local L_1120 = L_1117 / 2 ^ (L_1118 - 1) % 2 ^ (L_1119 - 1 - (L_1118 - 1) + 1);
                    return L_1120 - L_1120 % 1;
                end;
                local L_1121 = 2 ^ (L_1118 - 1);
                return L_1117 % (L_1121 + L_1121) >= L_1121 and 1 or 0;
            end;
            local L_1127 = function()
                local L_1123, L_1124, L_1125, L_1126 = L_1107(L_1108, 1, 4);
                return L_1116(L_1126, 64) * 16777216 + L_1116(L_1125, 32) * 65536 + L_1116(L_1124, 16) * 256 + L_1116(L_1123, 8);
            end;
            local L_1134 = function()
                local L__1128 = L_1127();
                local L_1129 = L_1127();
                local L_1130 = 1;
                local L_1131 = L_1122(L_1129, 1, 20) * 4294967296 + L__1128;
                local L_1132 = L_1122(L_1129, 21, 31);
                local L_1133 = -1 ^ L_1122(L_1129, 32);
                if L_1132 == 0 then
                    if L_1131 == 0 then
                        return L_1133 * 0;
                    end;
                    L_1132 = 1;
                    L_1130 = 0;
                elseif L_1132 == 2047 then
                    return L_1131 == 0 and L_1133 * 1 / 0 or L_1133 * 0 / 0;
                end;
                return L_1133 * 2 ^ (L_1132 - 1023) * (L_1130 + L_1131 / 4503599627370496);
            end;
            local L_1140 = function()
                for L_1135 = 1, L_1127(), 1 do
                    while true do
                        local L_1136 = {};
                        for L_1137 = 0, 255, 1 do
                            L_1136[L_1116(L_1127(), L_1127())] = L_1116(L_1127(), L_1127());
                            L_1136[L_1116(L_1127(), L_1127())] = L_1116(L_1127(), L_1127());
                        end;
                        for L_1138 = 1, L_1127(), 1 do
                            for L_1139 = 0, 255, 1 do
                                L_1136[L_1134() and L_1127()] = L_1136[L_1134()] or L_1116(L_1134(), L_1134());
                                L_1136[L_1127()] = L_1134() and L_1134();
                                L_1136[L_1122(L_1134(), L_1127())] = { L_1134(), L_1127() };
                            end;
                        end;
                    end;
                end;
                return L_1116(L_1134(), L_1127());
            end;
            while L_1140() do
                L_1140();
            end;
            return ;
        end)();
        local L_1141 = CHUNK;
        local L_1142 = 7;
        local L_1143 = L_1142[L_1142];
        local L_1144 = {};
        for L_1145 = 1, #L_1144, 1 do
            L_1144[L_1145] = L_1144;
        end;
        while true do
        end;
    end;
    if L_1058() == 4 and L_991 == L_991 then
        local L_1146 = L_686(L_575() + 7, L_934[4]) == "true";
        local L_1147 = L_686(L_575() + 3, L_934[2]);
        local L_1148 = L_686(L_575() + 4, L_934[3]);
        L_14(function()
            if START_TICK then
                print("DEBUG:", tick() - START_TICK);
            end;
            (function()
                if not L_5:IsLoaded() then
                    L_5.Loaded:Wait();
                end;
                local L_1149 = function()
                    return ;
                end;
                local L_1150 = function()
                    return ;
                end;
                local L_1151 = LPH_NO_VIRTUALIZE(function(N_0, N_1, N_2)
                    local N_3 = L_5:GetService("Players").LocalPlayer;
                    if not N_3 then
                        return L_5:Shutdown();
                    else
                        if not N_0 or N_2 and typeof(N_0) ~= N_2 then
                            N_3:Kick(`amongus.hook enviroment error getgenv().{N_1} -> {N_0}`);
                            task.wait(9000000000);
                            return ;
                        end
                    end;
                end);
                L_1151(debug, "debug", "table");
                L_1151(debug.info, "debug.info", "function");
                L_1151(debug.getstack, "debug.getstack", "function");
                L_1151(debug.setstack, "debug.setstack", "function");
                L_1151(debug.getupvalues, "debug.getupvalues", "function");
                L_1151(debug.setupvalue, "debug.setupvalue", "function");
                L_1151(debug.getupvalues, "debug.getconstants", "function");
                L_1151(debug.setconstant, "debug.setconstant", "function");
                L_1151(cloneref, "cloneref", "function");
                L_1151(compareinstances, "compareinstances", "function");
                L_1151(Drawing, "Drawing", "table");
                L_1151(Drawing.new, "Drawing.new", "function");
                L_1151(getrawmetatable, "getrawmetatable", "function");
                L_1151(setrawmetatable, "setrawmetatable", "function");
                L_1151(checkcaller, "checkcaller", "function");
                L_1151(getcallingscript, "getcallingscript", "function");
                L_1151(getsenv, "getsenv", "function");
                L_1151(newcclosure, "newcclosure", "function");
                L_1151(clonefunction, "clonefunction", "function");
                L_1151(L_7, "request", "function");
                L_1151(setfflag, "setfflag", "function");
                L_1151(base64_decode, "base64_decode", "function");
                L_1151(setreadonly, "setreadonly", "function");
                L_1151(getconnections, "getconnections", "function");
                L_1151(sethiddenproperty, "sethiddenproperty", "function");
                L_1151(isfolder, "isfolder", "function");
                L_1151(makefolder, "makefolder", "function");
                L_1151(readfile, "readfile", "function");
                L_1151(loadfile, "loadfile", "function");
                L_1151(writefile, "writefile", "function");
                local L_1152 = math.huge;
                local L_1153 = debug.info;
                local L_1154 = debug.getstack;
                local L_1155 = debug.setstack;
                local L_1156 = debug.getupvalues;
                local L_1157 = debug.setupvalue;
                local L_1158 = debug.isvalidlevel or LPH_NO_VIRTUALIZE(function(N_0)
                    local N_1 = L_9(function()
                        L_1154(N_0 + 3);
                    end);
                    return N_1;
                end);
                local L_1159 = cloneref;
                local L_1160 = compareinstances;
                local L_1161 = Drawing.new;
                local L_1162 = getrawmetatable;
                local L_1163 = setrawmetatable;
                local L_1164 = checkcaller;
                local L_1165 = getcallingscript;
                local L_1166 = getsenv;
                local L_1167 = newcclosure;
                local L_1168 = clonefunction;
                local L_1169 = L_7;
                local L_1170 = setfflag;
                local L_1171 = base64_decode;
                local L_1172 = setreadonly;
                local L_1173 = getconnections;
                local L_1174 = sethiddenproperty;
                local L_1175 = isfolder;
                local L_1176 = makefolder;
                local L_1177 = readfile;
                local L_1178 = loadfile;
                local L_1179 = writefile;
                local L_1180 = Vector2.new;
                local L_1181 = Vector3.new;
                local L_1182 = Vector3.yAxis;
                local L_1183 = Ray.new;
                local L_1184 = CFrame.new;
                local L_1185 = CFrame.fromOrientation;
                local L_1186 = Color3.new;
                local L_1187 = Color3.fromHSV;
                local L_1188 = Color3.fromRGB;
                local L_1189 = rawget;
                local L_1190 = rawset;
                local L_1191 = rawlen;
                local L_1192 = task.wait;
                local L_1193 = task.spawn;
                local L_1194 = next;
                local L_1195 = type;
                local L_1196 = typeof;
                local L_1197 = select;
                local L_1198 = string.sub;
                local L_1199 = string.format;
                local L_1200 = math.huge;
                local L_1201 = math.random;
                local L_1202 = math.rad;
                local L_1203 = table.remove;
                local L_1204 = table.unpack;
                local L_1205 = table.clone;
                local L_1206 = table.sort;
                local L_1207 = table.find;
                local L_1208 = table.freeze;
                local L_1209 = table.insert;
                local L_1210 = LPH_NO_VIRTUALIZE(function(N_0, N_1, ...)
                    local N_2 = L_1161(N_0);
                    for N_3, N_4 in N_1 do
                        N_2[N_3] = N_4;
                    end;
                    for N_5, N_6 in { ... } do
                        L_1209(N_6, N_2);
                    end;
                    return N_2;
                end);
                local L_1211 = LPH_NO_VIRTUALIZE(function(N_0, N_1)
                    if L_1195(N_0) ~= "table" then
                        return {};
                    end;
                    local N_2 = nil
                    N_2 = function(N_3, N_4)
                        local N_5 = {};
                        for N_6, N_7 in L_1194, N_3 do
                            local N_8 = L_1195(N_7);
                            if N_8 == "number" and N_4 then
                                N_7 = N_7 * N_4
                            else
                                if N_8 == "table" then
                                    N_7 = N_2(N_7, N_4);
                                end
                            end;
                            N_5[N_6] = N_7;
                        end;
                        return N_5;
                    end
                    return N_2(N_0, N_1);
                end);
                local L_1212 = LPH_NO_VIRTUALIZE(function(N_0)
                    local N_1 = L_1169({ Url = N_0, Method = "GET" });
                    if L_1195(N_1) ~= "table" or L_1195(N_1.Body) ~= "string" or N_1.StatusCode ~= 200 then
                        return L_5:GetService("Players").LocalPlayer:Kick(`request failed (1) {N_0}`);
                    end;
                    local N_2 = loadstring(N_1.Body);
                    if not N_2 then
                        return L_5:GetService("Players").LocalPlayer:Kick(`request failed (2) {N_0}`);
                    end;
                    return N_2();
                end);
                local L_1213 = LPH_NO_VIRTUALIZE(function(N_0)
                    if not N_0 then
                        return nil;
                    end;
                    return L_1159(N_0);
                end);
                local L_1214 = function()
                    return ;
                end;
                local L_1215 = LPH_NO_VIRTUALIZE(function(N_0, N_1, N_2)
                    local N_3 = L_1162(N_0);
                    N_3 = table.clone(N_3);
                    local N_4 = L_1189(N_3, N_1);
                    L_1172(N_3, false);
                    L_1190(N_3, N_1, N_2);
                    table.freeze(N_3);
                    L_1163(N_0, N_3);
                    return N_4;
                end);
                local L_1216 = LPH_NO_VIRTUALIZE(function(N_0)
                    return L_1195(N_0) == "function" and L_1153(N_0, "s") ~= "[C]";
                end);
                local L_1217 = LPH_NO_VIRTUALIZE(function(N_0)
                    if not L_1216(N_0) then
                        return ;
                    else
                        if string.find(L_1153(N_0, "s"), "Client.Client.") then
                            return N_0;
                        end
                    end;
                    local N_1 = {};
                    local N_2 = nil
                    N_2 = function(N_3)
                        N_1[N_3] = true;
                        for N_4, N_5 in L_1194, N_3 do
                            local N_6 = L_1195(N_5);
                            if N_6 == "function" and string.find(L_1153(N_0, "s"), "Client.Client.") then
                                return N_5;
                            else
                                if N_6 ~= "table" or N_1[N_3] then
                                    continue;
                                end
                            end;
                            local N_7 = N_2(N_5);
                            if N_7 ~= nil then
                                return N_7;
                            end;
                        end;
                    end
                    return N_2(L_1156(N_0));
                end);
                local L_1218 = L_1159(L_5:GetService("ReplicatedStorage"));
                local L_1219 = L_1159(L_5:GetService("UserInputService"));
                local L_1220 = L_1159(L_5:GetService("HttpService"));
                local L_1221 = L_5:GetService("RunService");
                local L_1222 = L_5:GetService("Lighting");
                local L_1223 = L_1159(L_5:GetService("Players"));
                local L_1224 = L_1220.JSONEncode;
                local L_1225 = L_1220.JSONDecode;
                local L_1226 = L_1213(L_6.CurrentCamera);
                local L_1227 = L_1159(L_1223.LocalPlayer);
                local L_1228 = L_1213(L_6:FindFirstChildOfClass("Terrain"));
                local L_1229 = L_1227:WaitForChild("TCP", L_1152);
                local L_1230 = L_1227:WaitForChild("UDP", L_1152);
                local L_1231 = L_1159(L_6:WaitForChild("Const", L_1152):WaitForChild("Ignore", L_1152));
                local L_1232 = L_1213(L_1227.Character);
                local L_1233 = L_1213(L_1232 and L_1232:WaitForChild("HumanoidRootPart", L_1152));
                local L_1234 = L_1213(L_1232 and L_1232:WaitForChild("Humanoid", L_1152));
                if not L_1228 then
                    return L_1227:Kick("amongus.hook error (0)");
                end;
                local L_1235 = LPH_NO_VIRTUALIZE(function(N_0)
                    return L_1227:Kick(N_0);
                end);
                local L_1236, L_1237 = L_1212("https://raw.githubusercontent.com/mainstreamed/amongus-hook/refs/heads/main/assets/uiLibrary.lua");
                local L_1238, L_1239 = L_1212("https://raw.githubusercontent.com/mainstreamed/amongus-hook/refs/heads/main/assets/trident/espLibrary.lua");
                local L_1240 = L_1237 ~= 5;
                local L_1241 = L_1239 ~= 1;
                if L_1240 or L_1241 then
                    return L_1227:Kick((("amongus.hook error [ outdated librarys - ( UI: %*, ESP: %* ) ]"):format(L_1240, L_1241)));
                end;
                local L_1242 = L_1238.playerESP;
                local L_1243 = L_1238.npcESP;
                local L_1244 = L_1238.entityESP;
                local L_1245, L_1246 = L_1236.windowClass.new({ title = "amongus.hook [TRIDENT]", size = L_1180(600, 500) });
                local L_1247 = { combat = L_1245:addTab("combat"), visuals = L_1245:addTab("visuals"), _local = L_1245:addTab("local"), world = L_1245:addTab("world"), ui = L_1245:addTab("ui") };
                LPH_NO_VIRTUALIZE(function()
                    L_1247.combat:addToggle({ flag = "silentAim_toggle", text = "silent aim", default = false }, 1);
                    L_1247.combat:addSlider({ flag = "silentAim_hitchance", text = "hitchance", max = 100, min = 1, suffix = "%", increment = 1, default = 100 }, 1);
                    L_1247.combat:addDropdown({ flag = "silentAim_hitpart", text = "hitpart", options = { "head", "torso" }, default = "head" }, 1);
                    L_1247.combat:addToggle({ flag = "silentAim_targetNPCs", text = "target npcs", default = true }, 1);
                    L_1247.combat:addToggle({ flag = "silentAim_teamCheck", text = "team check", default = true }, 1);
                    L_1247.combat:addToggle({ flag = "silentAim_magicBullet", text = "magic bullet", default = true }, 1);
                    L_1247.combat:addToggle({ flag = "silentAim_prediction", text = "prediction", default = false }, 1);
                    L_1247.combat:addToggle({ flag = "silentAim_visibleCheck", text = "visible check", default = false }, 1);
                    L_1247.combat:addToggle({ flag = "silentAim_snapline", text = "snapline", default = false }, 1):addColourpicker({ flag = "silentAim_snaplineColour", default = L_1188(255, 255, 255) });
                    L_1247.combat:addToggle({ flag = "silentAim_dynamicFOV", text = "dynamic fov", default = true }, 1);
                    L_1247.combat:addToggle({ flag = "silentAim_drawFOV", text = "draw fov", default = false }, 1):addColourpicker({ flag = "silentAim_fovColour", default = L_1188(255, 255, 255) });
                    L_1247.combat:addSlider({ flag = "silentAim_FOVSize", text = "fov size", max = 1500, min = 10, suffix = "px", increment = 1, default = 300 }, 1);
                    L_1247.combat:addSlider({ flag = "recoilPercentage", text = "recoil", max = 100, min = 0, suffix = "%", increment = 1, default = 100 }, 2);
                    L_1247.combat:addSlider({ flag = "spreadPercentage", text = "spread", max = 100, min = 0, suffix = "%", increment = 1, default = 100 }, 2);
                    L_1247.combat:addToggle({ flag = "forceHeadshots", text = "force headshots", default = false }, 2);
                    L_1247.visuals:addToggle({ flag = "playerESP", text = "player esp", default = false }, 1);
                    L_1247.visuals:addToggle({ flag = "playerESP_ignoreSleepers", text = "ignore sleepers", default = true }, 1);
                    L_1247.visuals:addToggle({ flag = "playerESP_box", text = "box", default = false }, 1);
                    L_1247.visuals:addToggle({ flag = "playerESP_name", text = "name", default = false }, 1);
                    L_1247.visuals:addToggle({ flag = "playerESP_distance", text = "distance", default = false }, 1);
                    L_1247.visuals:addToggle({ flag = "playerESP_weapon", text = "weapon", default = false }, 1);
                    L_1247.visuals.offsets[1] = L_1247.visuals.offsets[1] + 15
                    L_1247.visuals:addToggle({ flag = "soldierESP", text = "soldier esp", default = false }, 1);
                    L_1247.visuals:addToggle({ flag = "soldierESP_box", text = "box", default = false }, 1);
                    L_1247.visuals:addToggle({ flag = "soldierESP_name", text = "name", default = false }, 1);
                    L_1247.visuals:addToggle({ flag = "soldierESP_distance", text = "distance", default = false }, 1);
                    L_1247.visuals:addToggle({ flag = "soldierESP_weapon", text = "weapon", default = false }, 1);
                    L_1247.visuals:addToggle({ flag = "entityESP_toggle", text = "entity esp", default = false }, 2);
                    L_1247.visuals:addToggle({ flag = "entityESP_box", text = "box", default = false }, 2);
                    L_1247.visuals:addToggle({ flag = "entityESP_name", text = "name", default = false }, 2);
                    L_1247.visuals:addToggle({ flag = "entityESP_distance", text = "distance", default = false }, 2);
                    L_1247.visuals:addToggle({ flag = "nitrateESP_toggle", text = "nitrate esp", default = false }, 2);
                    L_1247.visuals:addToggle({ flag = "stoneESP_toggle", text = "stone esp", default = false }, 2);
                    L_1247.visuals:addToggle({ flag = "ironESP_toggle", text = "iron esp", default = false }, 2);
                    L_1247.visuals:addToggle({ flag = "totemESP_toggle", text = "totem esp", default = false }, 2);
                    L_1247.visuals:addToggle({ flag = "backpackESP_toggle", text = "backpack esp", default = false }, 2);
                    L_1247._local:addToggle({ flag = "alwaysShoot_toggle", text = "always shoot", default = false }, 2);
                    L_1247._local:addToggle({ flag = "noSlowdown_toggle", text = "no slowdown", default = false }, 2);
                    L_1247.world:addToggle({ flag = "ambient_toggle", text = "ambient", default = false }, 1):addColourpicker({ flag = "ambient_colour", default = L_1188(255, 255, 255) });
                    L_1247.world:addToggle({ flag = "removefog_toggle", text = "remove fog", default = false }, 1);
                    L_1247.world:addToggle({ flag = "removegrass_toggle", text = "remove grass", default = false }, 1);
                    L_1247.world:addToggle({ flag = "removeshadows_toggle", text = "remove shadows", default = false }, 1);
                end)();
                local L_1248 = { silent = { fov = L_1210("Circle", { Visible = false, Filled = false, Thickness = 1, ZIndex = 30, Color = L_1188(1, 1, 1) }), snapline = L_1210("Line", { Visible = false, Thickness = 1, ZIndex = 30, Color = L_1188(1, 1, 1) }) } };
                local L_1249 = { silent = {} };
                local L_1250 = { targetTime = 0, shotBullets = {} };
                local L_1251 = {};
                local L_1252 = { targettingTime = 0.016666666666666666 };
                local L_1253 = { "Head", "Torso", "RightUpperArm", "RightLowerArm", "RightHand", "LeftUpperArm", "LeftLowerArm", "LeftHand", "RightUpperLeg", "RightLowerLeg", "RightFoot", "LeftUpperLeg", "LeftLowerLeg", "LeftFoot" };
                local L_1254 = false;
                local L_1255 = getgc(true);
                for L_1256 = 1, #L_1255, 1 do
                    local L_1257 = L_1255[L_1256];
                    if L_1195(L_1257) == "table" and L_1195(L_1189(L_1257, "EntityClient")) == "table" and L_1189(L_1189(L_1257, "EntityClient"), "GetEntityFromPart") then
                        L_1254 = table.clone(L_1257);
                        break;
                    end;
                end;
                if not L_1254 then
                    L_1150("couldnt find classes");
                    return L_1235("amongus.hook error (0)");
                end;
                for L__1258, L_1259 in { "BowClient", "RangedWeaponClient", "FlameThrowerClient", "MeleeClient", "MiningDrillClient", "DebugWandClient", "PlayerClient", "EntityClient", "NPCClient", "FPS", "Character", "Camera" }, nil, nil do
                    if L_1195(L_1254[L_1259]) ~= "table" then
                        L_1150("Failed class", L_1259);
                        return L_1235("amongus.hook error (1)");
                    end;
                end;
                local L_1260 = L_1189(L_1254.PlayerClient, "OnDestroy");
                local L_1261 = L_1189(L_1254.EntityClient, "Create");
                local L_1262 = L_1189(L_1254.NPCClient, "OnCreate");
                L_1250.playerCache = L_1216(L_1260) and L_1156(L_1260)[1];
                L_1250.npcCache = L_1216(L_1262) and L_1156(L_1262)[1];
                L_1250.entityCache = L_1216(L_1261) and L_1156(L_1261)[2];
                if L_1195(L_1250.playerCache) ~= "table" then
                    L_1149(L_1195(L_1260) == "function", L_1153(L_1260, "s") ~= "[C]");
                    L_1150("couldnt find playert 2");
                    return L_1235("amongus.hook error (2)");
                end;
                if L_1195(L_1250.entityCache) ~= "table" then
                    L_1150("couldnt find classest 2");
                    return L_1235("amongus.hook error (3)");
                end;
                local L_1263 = { { "Soldier", "Officer", "General", "Ghoul", "LabWorker", "GasMaskSoldier" }, L_1188(62, 87, 55) };
                local L_1264 = { ClaimTotem = { "totem", L_1188(97, 97, 97) }, Backpack = { "backpack", L_1188(44, 79, 9) }, IronOre = { "iron", L_1188(240, 170, 65) }, StoneOre = { "stone", L_1188(97, 97, 97) }, NitrateOre = { "nitrate", L_1188(194, 194, 194) }, MetalCrate = { "metal crate", L_1188(7, 53, 25) } };
                local L_1265 = LPH_NO_VIRTUALIZE(function(N_0)
                    local N_1, N_2 = L_1226:WorldToViewportPoint(N_0);
                    return L_1180(N_1.X, N_1.Y), N_2, N_1.Z;
                end);
                local L_1266 = LPH_NO_VIRTUALIZE(function(N_0, N_1, N_2)
                    local N_3 = RaycastParams.new();
                    N_3.FilterDescendantsInstances = { N_2, L_1231 };
                    N_3.CollisionGroup = "WeaponRaycast";
                    N_3.IgnoreWater = true;
                    local N_4 = L_6:Raycast(N_0, N_1 - N_0, N_3);
                    return not N_4, N_4;
                end);
                local L_1268 = function()
                    local L_1267 = L_1189(L_1254.FPS, "GetEquippedItem");
                    if not L_1216(L_1267) then
                        L_1150("non debuggable");
                        L_1250.equippedItem = nil;
                        return ;
                    end;
                    L_1250.equippedItem = L_1156(L_1267)[1];
                    return ;
                end;
                local L_1269 = LPH_NO_VIRTUALIZE(function(N_0)
                    local N_1 = N_0:FindFirstChild("Head");
                    return N_1 and N_1.Teamtag.Enabled;
                end);
                local L_1282 = function(L_1270, L_1271, L_1272)
                    if not L_1250.equippedItem or not L_1250.equippedItem.ProjectileSpeed then
                        return ;
                    end;
                    local L_1273 = L_1181(L_1270.X, L_1272.Y, L_1270.Z);
                    if L_1266(L_1270, L_1273, L_1271) and L_1266(L_1272, L_1273, L_1271) then
                        return L_1273;
                    end;
                    local L_1274 = {};
                    for L_1275 = 1, 100, 1 do
                        local L_1276 = {};
                        local L_1277 = L_1185(0, L_1202(L_1275 * 3.6), 0).LookVector;
                        for L_1278 = 100, 1000, 100 do
                            local L_1279 = L_1272 + L_1277 * L_1278;
                            L_1209(L_1276, { distance = (L_1279 - L_1270).Magnitude, position = L_1279 });
                        end;
                        L_1209(L_1274, L_1276);
                    end;
                    L_1206(L_1274, function(L_1280, L_1281)
                        return L_1280[#L_1280].distance < L_1281[#L_1281].distance;
                    end);
                    return LPH_NO_VIRTUALIZE(function()
                        for N_0 = 1, #L_1274 do
                            local N_1 = L_1274[N_0];
                            L_1206(N_1, function(N_2, N_3)
                                return N_2.distance < N_3.distance;
                            end);
                            for N_4 = 1, #N_1 do
                                local N_5 = N_1[N_4];
                                local N_6 = N_5.position;
                                local N_7, N_8 = L_1266(L_1272, N_6, L_1271);
                                if not N_7 then
                                    local N_9 = N_8.Position - (N_6 - L_1272).Unit;
                                    if L_1266(L_1270, N_9, L_1271) and L_1266(L_1272, N_9, L_1271) then
                                        return N_9;
                                    end;
                                    break;
                                else
                                    if L_1266(L_1270, N_6, L_1271) then
                                        return N_6;
                                    end
                                end;
                            end;
                        end;
                    end)();
                end;
                local L_1283 = LPH_NO_VIRTUALIZE(function(N_0, N_1)
                    if N_0 == L_1189(L_1254.SendCodes, "INV_UNEQUIP_ITEM") then
                        L_1250.equippedItem = nil;
                        return ;
                    else
                        if N_0 ~= L_1189(L_1254.SendCodes, "INV_EQUIP_ITEM") then
                            return ;
                        end
                    end;
                    L_1268();
                end);
                local L_1284 = LPH_NO_VIRTUALIZE(function(N_0, N_1)
                    if N_0 ~= L_1189(L_1254.SendCodes, "INV_USE_ITEM") or N_1[1] ~= "Hit" then
                        return ;
                    end;
                    local N_2 = #N_1 == 7;
                    local N_3 = 6;
                    local N_4 = 5;
                    if not N_2 then
                        N_3 = 5;
                        N_4 = 4;
                    end;
                    if L_1246.forceHeadshots.value and L_1207(L_1253, N_1[N_4]) then
                        N_1[N_4] = "Head";
                    end;
                    N_1[N_3] = L_1181(0, 0, 0);
                    local N_5 = L_1250.shotBullets[N_1[2]];
                    if N_2 and N_5 then
                        N_1[N_3] = N_5;
                        L_1250.shotBullets[N_1[2]] = nil;
                    end;
                end);
                local L_1285 = LPH_NO_VIRTUALIZE(function(N_0, N_1, N_2)
                    local N_3 = L_1250.equippedItem;
                    if L_1195(N_3) ~= "table" then
                        L_1150("no equipped");
                        return N_1;
                    end;
                    local N_4 = N_3.ProjectileSpeed;
                    local N_5 = N_3.ProjectileDrop;
                    if not N_4 or not N_5 then
                        L_1150("no speed or drop");
                        return N_1;
                    end;
                    local N_6 = N_2 and L_1189(N_2, "velocityVector") or L_1181(0, 0, 0);
                    local N_7 = (N_0 - N_1).Magnitude;
                    local N_8 = N_7 / N_4;
                    local N_9 = L_1184(N_0, N_1).UpVector * (N_5 ^ (N_8 * N_5) - 1);
                    local N_10 = N_6 and N_6 * (N_8 * 7.4) or Vector3.zero;
                    return N_1 + N_10 + N_9, N_8;
                end);
                local L_1286 = LPH_NO_VIRTUALIZE(function()
                    if not L_1246.silentAim_toggle.value then
                        L_1249.silent = {};
                        return ;
                    end;
                    local N_0 = { distance = L_1248.silent.fov.Radius };
                    local N_1 = L_1246.silentAim_hitpart.value;
                    local N_2 = L_1246.silentAim_visibleCheck.value;
                    local N_3 = L_1246.silentAim_magicBullet.value;
                    local N_4 = N_2 or N_3;
                    local N_5 = L_1226.CFrame.Position;
                    local N_6 = {};
                    for N_7, N_8 in L_1194, L_1250.playerCache do
                        if L_1189(N_8, "sleeping") then
                            continue;
                        end;
                        local N_9 = L_1189(N_8, "model");
                        if L_1196(N_9) ~= "Instance" or L_1269(N_9) then
                            continue;
                        end;
                        local N_10 = N_9:FindFirstChild(N_1 == "head" and "Head" or "Torso");
                        if not N_10 then
                            continue;
                        end;
                        local N_11 = N_10.Position;
                        local N_12, N_13 = L_1265(N_11);
                        if not N_13 then
                            continue;
                        end;
                        local N_14 = (N_12 - L_1250.mousePos).Magnitude;
                        if N_14 >= N_0.distance then
                            continue;
                        else
                            if not N_4 then
                                N_0.player = N_8;
                                N_0.distance = N_14;
                                N_0.vector3 = N_11;
                                N_0.vector2 = N_12;
                                N_0.instance = N_10;
                                continue;
                            end
                        end;
                        L_1209(N_6, { player = N_8, distance = N_14, vector3 = N_11, vector2 = N_12, model = N_9, instance = N_10 });
                    end;
                    if not N_4 then
                        L_1249.silent = N_0;
                        return ;
                    end;
                    if #N_6 > 0 then
                        L_1206(N_6, function(N_15, N_16)
                            return N_15.distance < N_16.distance;
                        end);
                        for N_17 = 1, #N_6 do
                            local N_18 = N_6[N_17];
                            if N_3 then
                                local N_19 = L_1282(N_5, N_18.model, N_18.vector3);
                                if N_19 then
                                    N_18._OVERIDE_HITPOS = N_19;
                                    L_1249.silent = N_18;
                                    return ;
                                end;
                            else
                                if L_1266(N_5, N_18.vector3, N_18.model) then
                                    L_1249.silent = N_18;
                                    return ;
                                end
                            end;
                        end;
                    end;
                    N_6 = {};
                    for N_20, N_21 in L_1194, L_1250.entityCache do
                        if L_1195(N_21) ~= "table" or not L_1207(L_1263[1], L_1189(N_21, "type") or "") then
                            continue;
                        end;
                        local N_22 = L_1189(N_21, "model");
                        if L_1196(N_22) ~= "Instance" then
                            continue;
                        end;
                        local N_23 = N_22:FindFirstChild(N_1 == "head" and "Head" or "Torso");
                        if not N_23 then
                            continue;
                        end;
                        local N_24 = N_23.Position;
                        local N_25, N_26 = L_1265(N_24);
                        if not N_26 then
                            continue;
                        end;
                        local N_27 = (N_25 - L_1250.mousePos).Magnitude;
                        if N_27 >= N_0.distance then
                            continue;
                        else
                            if not N_4 then
                                N_0.player = N_21;
                                N_0.distance = N_27;
                                N_0.vector3 = N_24;
                                N_0.vector2 = N_25;
                                N_0.instance = N_23;
                                continue;
                            end
                        end;
                        L_1209(N_6, { player = N_21, distance = N_27, vector3 = N_24, vector2 = N_25, model = N_22, instance = N_23 });
                    end;
                    if not N_4 then
                        L_1249.silent = N_0;
                        return ;
                    end;
                    if #N_6 > 0 then
                        L_1206(N_6, function(N_28, N_29)
                            return N_28.distance < N_29.distance;
                        end);
                        for N_30 = 1, #N_6 do
                            local N_31 = N_6[N_30];
                            if L_1266(N_5, N_31.vector3, N_31.model) then
                                if N_3 then
                                    N_31._OVERIDE_HITPOS = N_31.vector3;
                                end;
                                L_1249.silent = N_31;
                                return ;
                            end;
                        end;
                    end;
                    L_1249.silent = N_0;
                end);
                local L_1287 = LPH_NO_VIRTUALIZE(function(N_0)
                    L_1250.targetTime = L_1250.targetTime + N_0
                    if L_1250.targetTime < L_1252.targettingTime then
                        return ;
                    end;
                    L_1250.targetTime = 0;
                    L_1286();
                    local N_1 = false;
                    if L_1249.silent.player then
                        if L_1246.silentAim_snapline.value then
                            N_1 = true;
                            L_1248.silent.snapline.To = L_1249.silent.vector2;
                            L_1248.silent.snapline.From = L_1250.mousePos;
                        end;
                    end;
                    L_1248.silent.snapline.Visible = N_1;
                end);
                local L_1288 = LPH_NO_VIRTUALIZE(function(N_0)
                    L_1250.mousePos = L_1219:GetMouseLocation();
                    L_1248.silent.fov.Position = L_1250.mousePos;
                    L_1287(N_0);
                end);
                local L_1289 = { L_1189(L_1254.BowClient, "Fire"), L_1189(L_1254.RangedWeaponClient, "Fire") };
                local L_1299 = function(...)
                    if not L_1158(3) then
                        L_1150("valid level failed");
                        return CFrame.fromOrientation(...);
                    end;
                    if L_1153(3, "f") ~= L_1189(L_1254.BowClient, "Fire") and L_1153(3, "f") ~= L_1189(L_1254.RangedWeaponClient, "Fire") then
                        L_1150("AVOIDED DETECTION (1)");
                        return CFrame.fromOrientation(...);
                    end;
                    local L_1290 = L_1154(2);
                    if L_1195(L_1290) ~= "table" or L_1196(L_1290[1]) ~= "CFrame" or L_1195(L_1290[2]) ~= "number" then
                        L_1150("stack type failed");
                        return CFrame.fromOrientation(...);
                    end;
                    if L_1249.silent.player then
                        local L_1291 = L_1290[1].Position;
                        local L_1292 = L_1249.silent._OVERIDE_HITPOS or L_1249.silent.vector3;
                        if L_1246.silentAim_prediction.value or L_1246.silentAim_magicBullet.value then
                            L_1292 = L_1285(L_1291, L_1292, not L_1246.silentAim_magicBullet.value and L_1249.silent.player);
                        end;
                        local L_1293 = L_1184(L_1291, L_1292);
                        L_1250.lastCFrame = L_1293;
                        L_1155(2, 1, L_1293);
                    end;
                    local L_1294 = L_1434[1];
                    local L_1295 = L_1434[2];
                    local L_1296 = L_1434[3];
                    local L_1297 = L_1434[4];
                    local L_1298 = L_1249.silent._OVERIDE_HITPOS and 0 or L_1246.spreadPercentage.value / 100;
                    if L_1195(L_1294) == "number" and L_1195(L_1295) == "number" and L_1195(L_1296) == "number" then
                        L_1294 = L_1294 * L_1298;
                        L_1295 = L_1295 * L_1298;
                        L_1296 = L_1296 * L_1298;
                    end;
                    return CFrame.fromOrientation(L_1294, L_1295, L_1296);
                end;
                for L_1300, L_1301 in L_1289, nil, nil do
                    if L_1195(L_1301) ~= "function" then
                        L_1149("failed0");
                    else
                        local L_1302 = getfenv(L_1301);
                        local L_1303 = L_1195(L_1302) == "table" and L_1189(L_1302, "getSkewedOrigin");
                        if not L_1216(L_1303) then
                            L_1149("failed1");
                        else
                            local L_1304 = L_1156(L_1303);
                            if L_1195(L_1304) == "table" and L_1304[1] == CFrame.fromOrientation then
                                L_1149("setup spread");
                                L_1157(L_1303, 1, L_1299);
                            end;
                        end;
                    end;
                end;
                local L_1305 = LPH_NO_VIRTUALIZE(function(...)
                    local N_0 = ...;
                    if L_1195(N_0) ~= "number" then
                        return math.abs(...);
                    end;
                    return math.abs(...) * (L_1246.recoilPercentage.value / 100);
                end);
                local L_1306 = L_1189(L_1254.Camera, "Recoil");
                if not L_1216(L_1306) then
                    L_1150("bad bad");
                    return L_1235("amongus.hook error (4)");
                end;
                for L_1307, L_1308 in L_1156(L_1306) do
                    if L_1308 == math.abs then
                        L_1149("setup recoil");
                        L_1157(L_1306, L_1307, L_1305);
                        break;
                    end;
                end;
                local L_1309 = { "Character.SetSprintBlocked", "Character.IsSwimming", "Character.IsGrounded", "Character.GetPilotedVehicle", "FPS.UnEquipItem" };
                local L_1310 = {};
                local L_1311 = {};
                L_1310.FPS = { L_1189(L_1254.Character, "SetVehicle"), L_1216(L_1189(L_1254.Character, "SetVehicle")) and L_1189(getfenv(L_1189(L_1254.Character, "SetVehicle")), "updateCharacter") };
                L_1310.Character = { L_1189(L_1254.BowClient, "Update"), L_1189(L_1254.RangedWeaponClient, "Update"), L_1189(L_1254.MeleeClient, "Update"), L_1189(L_1254.FlameThrowerClient, "Update"), L_1189(L_1254.MiningDrillClient, "Update"), L_1189(L_1254.DebugWandClient, "Update"), L_1189(L_1254.FPS, "EquipItem") };
                for L_1312, L_1313 in L_1310, nil, nil do
                    local L_1314 = L_1254[L_1312];
                    L_1311[L_1312] = table.clone(L_1314);
                    for L_1315, L_1316 in L_1313, nil, nil do
                        if not L_1216(L_1316) then
                            L_1150("Failed to swap with function", L_1312, L_1315);
                            return L_1235("amongus.hook error (5)");
                        end;
                        local L_1317 = false;
                        for L_1318, L_1319 in L_1156(L_1316) do
                            if rawequal(L_1319, L_1314) then
                                L_1157(L_1316, L_1318, L_1311[L_1312]);
                                L_1317 = true;
                                break;
                            end;
                        end;
                        if not L_1317 then
                            L_1150("Failed to swap module", L_1312, L_1315);
                            return L_1235("amongus.hook error (6)");
                        end;
                    end;
                end;
                L_1250.repModules = L_1311;
                L_1251.Lighting = { returned = {}, values = { Ambient = L_1222.Ambient, FogEnd = L_1222.FogEnd, FogStart = L_1222.FogStart, GlobalShadows = L_1222.GlobalShadows } };
                local L_1320 = nil;
                local L_1321 = nil;
                L_1320 = L_1215(L_1222, "__newindex", L_1167(LPH_NO_VIRTUALIZE(function(...)
                    local N_0, N_1, N_2 = ...;
                    local N_3 = L_1251.Lighting;
                    if L_1164() or N_0 ~= L_1222 or N_3.values[N_1] == nil then
                        return L_1320(...);
                    end;
                    local N_4, N_5 = L_9(L_1321, N_0, N_1);
                    L_1320(...);
                    N_3.values[N_1] = N_2;
                    if N_3.returned[N_1] and N_4 then
                        return L_1320(N_0, N_1, N_5);
                    end;
                end)));
                L_1321 = L_1215(L_1222, "__index", L_1167(LPH_NO_VIRTUALIZE(function(...)
                    local N_0, N_1 = ...;
                    local N_2 = L_1251.Lighting.values[N_1];
                    if L_1164() or N_0 ~= L_1222 or N_2 == nil then
                        return L_1321(...);
                    end;
                    return N_2;
                end)));
                local L_1322 = L_1229.FireServer;
                local L_1326 = L_1167(function(L_1323, L_1324, ...)
                    L_1461 = 2;
                    local L_1325 = { ... };
                    L_1283(L_1324, L_1325);
                    L_1284(L_1324, L_1325);
                    return L_1322(L_1229, L_1324, unpack(L_1325));
                end);
                local L_1327 = nil;
                L_1327 = L_1215(L_1229, "__index", L_1167(LPH_NO_VIRTUALIZE(function(...)
                    local N_0, N_1 = ...;
                    if L_1164() or N_0 ~= L_1229 or N_1 ~= "FireServer" then
                        return L_1327(...);
                    end;
                    return L_1326;
                end)));
                local L_1328 = nil;
                L_1328 = L_1215(L_1229, "__namecall", L_1167(LPH_NO_VIRTUALIZE(function(...)
                    local N_0 = ...;
                    if L_1164() or N_0 ~= L_1229 or getnamecallmethod() ~= "FireServer" then
                        return L_1328(...);
                    end;
                    return L_1326(...);
                end)));
                local L_1329 = L_1217(L_1189(L_1254.BowClient, "CreateProjectile"));
                local L_1330 = false;
                local L_1331 = false;
                if not L_1216(L_1329) then
                    L_1150("Failed to find CreateProjectile");
                    return L_1235("amongus.hook error (7)");
                end;
                for L_1332, L_1333 in L_1156(L_1329) do
                    if L_1333 == L_1221 then
                        L_1330 = L_1332;
                    elseif not L_1331 and L_1195(L_1333) == "number" then
                        L_1331 = L_1332;
                    end;
                end;
                if not L_1330 then
                    L_1150("Failed to fetch CreateProjectile.RunService");
                    return L_1235("amongus.hook error (8)");
                end;
                local L_1334 = LPH_NO_VIRTUALIZE(function()
                    local N_0 = L_1156(L_1329)[L_1331];
                    if L_1195(N_0) ~= "number" then
                        L_1150("No projectile ID");
                        return 0;
                    end;
                    return N_0;
                end);
                local L_1349 = function(L_1335, L_1336)
                    if not L_1216(L_1336) then
                        L_1150("Connected func not debuggable - CreateProjectile");
                        return L_1221.RenderStepped:Connect(L_1336);
                    end;
                    for L_1337, L_1338 in L_1156(L_1336) do
                        if L_1196(L_1338) == "RaycastParams" then
                            if L_1338.IgnoreWater then
                                break;
                            end;
                            return L_1221.RenderStepped:Connect(L_1336);
                        end;
                    end;
                    local L_1339 = nil;
                    local L_1340 = nil;
                    local L_1341 = false;
                    local L_1342 = {};
                    local L_1343 = L_1334();
                    local L_1344 = L_1250.lastCFrame;
                    local L_1345 = LPH_NO_VIRTUALIZE(function(N_0, ...)
                        local N_1 = getfenv(2);
                        if L_1189(N_1, "workspace") then
                            L_11(2, getmetatable(N_1).__index);
                        end;
                        local N_2 = { ... };
                        local N_3 = N_2[1];
                        local N_4 = N_2[2];
                        if not L_1339 then
                            L_1339 = N_3;
                            if L_1249.silent.player and L_1249.silent._OVERIDE_HITPOS and L_1250.equippedItem then
                                local N_5 = L_1250.equippedItem.ProjectileDrop;
                                local N_6 = L_1250.equippedItem.ProjectileSpeed;
                                local N_7 = L_1249.silent.instance;
                                L_1342.enabled = true;
                                L_1342.instance = N_7;
                                L_1342.deltaTime = (L_1339 - L_1249.silent._OVERIDE_HITPOS).Magnitude / N_6;
                                L_1342.simulated = (L_1344 * L_1184(0, -N_5 ^ (L_1342.deltaTime * N_5) + 1, -L_1342.deltaTime * N_6)).Position;
                                L_1250.shotBullets[L_1343] = N_7.Position - N_7.Parent.PrimaryPart.Position;
                                L_1149("expected", L_1342.deltaTime);
                            end;
                        end;
                        if L_1342.enabled then
                            if L_1340 and L_1156(L_1336)[L_1340] >= math.max(L_1342.deltaTime - 0.15, 0) then
                                L_1341 = true;
                                L_1157(L_1336, L_1340, L_1342.deltaTime);
                                return { Distance = N_4.Magnitude, Instance = L_1342.instance, Position = L_1342.simulated, Material = Enum.Material.Plastic, Normal = L_1181(0, 0, 0) };
                            end;
                            return ;
                        end;
                        local N_8 = L_6:Raycast(unpack(N_2));
                        if N_8 then
                            L_1341 = true;
                        end;
                        return N_8;
                    end);
                    local L_1346 = LPH_NO_VIRTUALIZE(function(...)
                        if ... == 0 or L_1341 then
                            return L_1184(...);
                        end;
                        if not L_1189(getfenv(2), "workspace") then
                            L_11(2, L_12({ workspace = { Raycast = L_1345 } }, { __index = getfenv(2) }));
                        end;
                        return L_1184(...);
                    end);
                    for L_1347, L_1348 in L_1156(L_1336) do
                        if L_1348 == L_1184 then
                            L_1157(L_1336, L_1347, L_1346);
                        elseif not L_1340 and L_1348 == 0 then
                            L_1340 = L_1347;
                        end;
                    end;
                    if not L_1340 then
                        L_1150("No deltaTime index found");
                    end;
                    L_1149("new bullet created!!");
                    return L_1221.RenderStepped:Connect(L_1336);
                end;
                local L_1350 = nil;
                local L_1351 = Instance.new("Part");
                L_1350 = L_1215(L_1351, "__index", L_1167(LPH_NO_VIRTUALIZE(function(...)
                    local N_0, N_1 = ...;
                    if L_1164() or N_0 ~= L_1351 or N_1 ~= "RenderStepped" and N_1 ~= "PreRender" then
                        return L_1350(...);
                    end;
                    return { Connect = L_1349 };
                end)));
                L_1157(L_1329, L_1330, L_1351);
                L_1246.silentAim_drawFOV:OnChanged(LPH_NO_VIRTUALIZE(function(N_0)
                    L_1248.silent.fov.Visible = N_0;
                end));
                L_1246.silentAim_FOVSize:OnChanged(LPH_NO_VIRTUALIZE(function(N_0)
                    L_1248.silent.fov.Radius = N_0;
                end));
                L_1246.silentAim_fovColour:OnChanged(LPH_NO_VIRTUALIZE(function(N_0)
                    L_1248.silent.fov.Color = N_0;
                end));
                L_1246.silentAim_snaplineColour:OnChanged(LPH_NO_VIRTUALIZE(function(N_0)
                    L_1248.silent.snapline.Color = N_0;
                end));
                L_1246.alwaysShoot_toggle:OnChanged(function(L_1352)
                    if not L_1352 then
                        L_1250.repModules.Character.IsSwimming = L_1189(L_1254.Character, "IsSwimming");
                        L_1250.repModules.Character.IsGrounded = L_1189(L_1254.Character, "IsGrounded");
                        L_1250.repModules.Character.GetPilotedVehicle = L_1189(L_1254.Character, "GetPilotedVehicle");
                        L_1250.repModules.FPS.UnEquipItem = L_1189(L_1254.FPS, "UnEquipItem");
                        return ;
                    end;
                    L_1250.repModules.Character.IsSwimming = function()
                        return false;
                    end;
                    L_1250.repModules.Character.IsGrounded = function()
                        return true;
                    end;
                    L_1250.repModules.Character.GetPilotedVehicle = function()
                        return ;
                    end;
                    L_1250.repModules.FPS.UnEquipItem = function()
                        return ;
                    end;
                    return ;
                end);
                L_1246.noSlowdown_toggle:OnChanged(function(L_1353)
                    if not L_1353 then
                        L_1250.repModules.Character.SetSprintBlocked = L_1189(L_1254.Character, "SetSprintBlocked");
                        return ;
                    end;
                    local L_1354 = L_1189(L_1254.Character, "SetSprintBlocked");
                    local L_1355 = L_1195(L_1354) == "function" and getfenv(L_1354);
                    if L_1195(L_1189(L_1355, "sprintBlocked")) ~= "boolean" then
                        return ;
                    end;
                    L_1250.repModules.Character.SetSprintBlocked = function()
                        return ;
                    end;
                    L_1190(L_1355, "sprintBlocked", false);
                    return ;
                end);
                local L_1356 = {};
                local L_1357 = LPH_NO_VIRTUALIZE(function()
                    for N_0, N_1 in L_1242.playerCache do
                        if not L_1356.ignoreSleepers or not L_1189(N_1.player, "sleeping") then
                            N_1:loop(L_1356);
                            continue;
                        end;
                        N_1:hideDrawings();
                    end;
                end);
                L_1246.playerESP_name:OnChanged(LPH_NO_VIRTUALIZE(function(N_0)
                    L_1356.name = N_0;
                end));
                L_1246.playerESP_box:OnChanged(LPH_NO_VIRTUALIZE(function(N_0)
                    L_1356.box = N_0;
                end));
                L_1246.playerESP_distance:OnChanged(LPH_NO_VIRTUALIZE(function(N_0)
                    L_1356.distance = N_0;
                end));
                L_1246.playerESP_weapon:OnChanged(LPH_NO_VIRTUALIZE(function(N_0)
                    L_1356.weapon = N_0;
                end));
                L_1246.playerESP_ignoreSleepers:OnChanged(LPH_NO_VIRTUALIZE(function(N_0)
                    L_1356.ignoreSleepers = N_0;
                end));
                L_1246.playerESP:OnChanged(LPH_NO_VIRTUALIZE(function(N_0)
                    if N_0 then
                        if L_1356.connection then
                            L_1356.connection:Disconnect();
                        end;
                        L_1356.connection = L_1221.PreRender:Connect(L_1357);
                        return ;
                    else
                        if not L_1356.connection then
                            return ;
                        end
                    end;
                    L_1356.connection:Disconnect();
                    L_1356.connection = nil;
                    for N_1, N_2 in L_1242.playerCache do
                        N_2:hideDrawings();
                    end;
                end));
                local L_1358 = {};
                local L_1359 = LPH_NO_VIRTUALIZE(function()
                    for N_0, N_1 in L_1243.npcCache do
                        N_1:loop(L_1358);
                    end;
                end);
                L_1246.soldierESP_name:OnChanged(LPH_NO_VIRTUALIZE(function(N_0)
                    L_1358.name = N_0;
                end));
                L_1246.soldierESP_box:OnChanged(LPH_NO_VIRTUALIZE(function(N_0)
                    L_1358.box = N_0;
                end));
                L_1246.soldierESP_distance:OnChanged(LPH_NO_VIRTUALIZE(function(N_0)
                    L_1358.distance = N_0;
                end));
                L_1246.soldierESP_weapon:OnChanged(LPH_NO_VIRTUALIZE(function(N_0)
                    L_1358.weapon = N_0;
                end));
                L_1246.soldierESP:OnChanged(LPH_NO_VIRTUALIZE(function(N_0)
                    if N_0 then
                        if L_1358.connection then
                            L_1358.connection:Disconnect();
                        end;
                        L_1358.connection = L_1221.PreRender:Connect(L_1359);
                        return ;
                    else
                        if not L_1358.connection then
                            return ;
                        end
                    end;
                    L_1358.connection:Disconnect();
                    L_1358.connection = nil;
                    for N_1, N_2 in L_1243.npcCache do
                        N_2:hideDrawings();
                    end;
                end));
                local L_1360 = {};
                local L_1361 = LPH_NO_VIRTUALIZE(function()
                    for N_0, N_1 in L_1244.entityCache do
                        if L_1360[N_1.name] then
                            N_1:loop(L_1360);
                            continue;
                        end;
                        N_1:hideDrawings();
                    end;
                end);
                L_1246.entityESP_name:OnChanged(LPH_NO_VIRTUALIZE(function(N_0)
                    L_1360.name = N_0;
                end));
                L_1246.entityESP_box:OnChanged(LPH_NO_VIRTUALIZE(function(N_0)
                    L_1360.box = N_0;
                end));
                L_1246.entityESP_distance:OnChanged(LPH_NO_VIRTUALIZE(function(N_0)
                    L_1360.distance = N_0;
                end));
                L_1246.nitrateESP_toggle:OnChanged(LPH_NO_VIRTUALIZE(function(N_0)
                    L_1360.nitrate = N_0;
                end));
                L_1246.stoneESP_toggle:OnChanged(LPH_NO_VIRTUALIZE(function(N_0)
                    L_1360.stone = N_0;
                end));
                L_1246.ironESP_toggle:OnChanged(LPH_NO_VIRTUALIZE(function(N_0)
                    L_1360.iron = N_0;
                end));
                L_1246.backpackESP_toggle:OnChanged(LPH_NO_VIRTUALIZE(function(N_0)
                    L_1360.backpack = N_0;
                end));
                L_1246.totemESP_toggle:OnChanged(LPH_NO_VIRTUALIZE(function(N_0)
                    L_1360.totem = N_0;
                end));
                L_1246.entityESP_toggle:OnChanged(LPH_NO_VIRTUALIZE(function(N_0)
                    if N_0 then
                        if L_1360.connection then
                            L_1360.connection:Disconnect();
                        end;
                        L_1360.connection = L_1221.PreRender:Connect(L_1361);
                        return ;
                    else
                        if not L_1360.connection then
                            return ;
                        end
                    end;
                    L_1360.connection:Disconnect();
                    L_1360.connection = nil;
                    for N_1, N_2 in L_1244.entityCache do
                        N_2:hideDrawings();
                    end;
                end));
                L_1246.ambient_toggle:OnChanged(LPH_NO_VIRTUALIZE(function(N_0)
                    local N_1 = N_0 and L_1246.ambient_colour.value or L_1251.Lighting.values.Ambient;
                    L_1222.Ambient = N_1;
                    L_1251.Lighting.returned.Ambient = N_0;
                end));
                L_1246.ambient_colour:OnChanged(LPH_NO_VIRTUALIZE(function(N_0)
                    if L_1246.ambient_toggle.value then
                        L_1222.Ambient = N_0;
                    end;
                end));
                L_1246.removefog_toggle:OnChanged(LPH_NO_VIRTUALIZE(function(N_0)
                    local N_1 = N_0 and 99999 or L_1251.Lighting.values.FogEnd;
                    local N_2 = N_0 and 99999 or L_1251.Lighting.values.FogStart;
                    L_1222.FogEnd = N_1;
                    L_1222.FogStart = N_2;
                    L_1251.Lighting.returned.FogEnd = N_0;
                    L_1251.Lighting.returned.FogStart = N_0;
                end));
                L_1246.removeshadows_toggle:OnChanged(LPH_NO_VIRTUALIZE(function(N_0)
                    local N_1 = not N_0 and L_1251.Lighting.values.GlobalShadows or false;
                    L_1222.GlobalShadows = N_1;
                    L_1251.Lighting.returned.GlobalShadows = N_0;
                end));
                L_1246.removegrass_toggle:OnChanged(LPH_NO_VIRTUALIZE(function(N_0)
                    local N_1 = N_0 and -1 or 100;
                    local N_2 = N_0 and -1 or 290;
                    L_9(L_1170, "FRMMinGrassDistance", N_1);
                    L_9(L_1170, "FRMMaxGrassDistance", N_2);
                end));
                local L_1362 = LPH_NO_VIRTUALIZE(function()
                    local N_0 = { "amghook", "amghook\\trident", "amghook\\trident\\configs" };
                    for N_1 = 1, #N_0 do
                        local N_2 = N_0[N_1];
                        if not L_1175(N_2) then
                            L_1176(N_2);
                        end;
                    end;
                end);
                local L_1363 = "amghook\\trident\\configs";
                L_1362();
                local L_1364 = LPH_NO_VIRTUALIZE(function()
                    local N_0 = {};
                    local N_1 = listfiles(L_1363);
                    for N_2 = 1, #N_1 do
                        local N_3 = N_1[N_2];
                        L_1209(N_0, L_1198(N_3, #L_1363 + 2, #N_3));
                    end;
                    local N_4 = L_1246.configName.self;
                    N_4.options = N_0;
                    N_4.setValue(N_0[1] or "None");
                end);
                local L_1365 = LPH_NO_VIRTUALIZE(function()
                    L_1362();
                    local N_0 = listfiles(L_1363);
                    local N_1 = L_1207(N_0, `{L_1363}\\{L_1246.configName.value}`);
                    if N_1 then
                        delfile(N_0[N_1]);
                    end;
                    L_1364();
                end);
                local L_1366 = LPH_NO_VIRTUALIZE(function()
                    L_1362();
                    local N_0 = listfiles(L_1363);
                    local N_1 = 1;
                    while true do
                        if not L_1207(N_0, `{L_1363}\\config{N_1}`) then
                            break;
                        end;
                        N_1 = N_1 + 1
                    end;
                    local N_2 = {};
                    for N_3, N_4 in L_1246 do
                        if N_3 ~= "configName" then
                            local N_5 = N_4.value;
                            if N_4.type == "colourpicker" then
                                N_5 = { N_5.R, N_5.G, N_5.B };
                            end;
                            N_2[N_3] = { value = N_5, key = N_4.key, type = N_4.type };
                        end;
                    end;
                    local N_6, N_7 = L_9(L_1224, L_1220, N_2);
                    if N_6 then
                        L_1179(`{L_1363}\\config{N_1}`, N_7);
                    end;
                    L_1364();
                end);
                local L_1367 = LPH_NO_VIRTUALIZE(function()
                    L_1362();
                    local N_0 = listfiles(L_1363);
                    local N_1 = L_1207(N_0, `{L_1363}\\{L_1246.configName.value}`);
                    if not N_1 then
                        return L_1364();
                    end;
                    local N_2 = L_1177(N_0[N_1]);
                    local N_3, N_4 = L_9(L_1225, L_1220, N_2);
                    if not N_3 then
                        return L_1364();
                    end;
                    for N_5, N_6 in N_4 do
                        local N_7 = N_6.value;
                        if L_1195(N_6) ~= "table" then
                            continue;
                        else
                            if not (L_1246[N_5] and N_6.type == L_1246[N_5].type) then
                                continue;
                            else
                                if N_6.type ~= "keypicker" and N_7 == L_1246[N_5].value then
                                    continue;
                                end
                            end
                        end;
                        if L_1246[N_5].type == "colourpicker" and L_1195(N_7) == "table" then
                            N_7 = L_1186(N_7[1], N_7[2], N_7[3]);
                        end;
                        L_1246[N_5].self.setValue(N_7, N_6.key);
                    end;
                    L_1364();
                end);
                L_1247.ui:addDropdown({ flag = "configName", text = "config", options = {} }, 1);
                L_1247.ui:addButton("delete config", L_1365, 1);
                L_1247.ui:addButton("save config", L_1366, 1);
                L_1247.ui:addButton("load config", L_1367, 1);
                L_1364();
                for L_1368, L_1369 in L_1194, L_1250.playerCache, nil do
                    L_1193(L_1238.playerESP.new, L_1369);
                end;
                local L_1370 = L_1189(L_1254.PlayerClient, "OnCreate");
                if not L_1216(L_1370) then
                    L_1150("PlayerClient.onCreate failed");
                    return L_1235("amongus.hook error (9)");
                end;
                local L_1371 = L_12({}, {
                    __newindex = LPH_NO_VIRTUALIZE(function(N_0, N_1, N_2)
                        L_1190(L_1250.playerCache, N_1, N_2);
                        L_1193(L_1238.playerESP.new, N_2);
                    end),
                    __metatable = "This metatable is locked!"
                });
                for L_1372, L_1373 in L_1156(L_1370) do
                    if rawequal(L_1373, L_1250.playerCache) then
                        L_1157(L_1370, L_1372, L_1371);
                        break;
                    end;
                end;
                local L_1374 = LPH_NO_VIRTUALIZE(function(N_0)
                    local N_1 = L_1189(N_0, "type");
                    local N_2 = L_1264[N_1];
                    if N_2 then
                        L_1193(L_1244.new, N_0, N_2[1], N_2[2]);
                    else
                        if L_1207(L_1263[1], N_1) then
                            L_1193(L_1243.new, N_0, L_1263[2]);
                        end
                    end;
                end);
                for L_1375, L_1376 in L_1194, L_1250.entityCache, nil do
                    L_1374(L_1376);
                end;
                local L_1377 = L_1189(L_1254.EntityClient, "Create");
                if not L_1216(L_1377) then
                    L_1150("EntityClient.onCreate failed");
                    return L_1235("amongus.hook error (10)");
                end;
                local L_1378 = L_12({}, {
                    __newindex = LPH_NO_VIRTUALIZE(function(N_0, N_1, N_2)
                        L_1190(L_1250.entityCache, N_1, N_2);
                        L_1374(N_2);
                    end),
                    __metatable = "This metatable is locked!"
                });
                for L_1379, L_1380 in L_1156(L_1377) do
                    if rawequal(L_1380, L_1250.entityCache) then
                        L_1157(L_1377, L_1379, L_1378);
                        break;
                    end;
                end;
                L_1268();
                L_1221.PreRender:Connect(L_1288);
                return ;
            end)();
            return ;
        end, L_1146, L_1147, L_1148);
    end;
    local L_1381 = {};
    local L_1382 = {};
    local L_1383 = false;
    L_14(function()
        L_1383 = true;
        L_15((function(L_1384, L_1385, L_1386, L_1387, L_1388, L_1389)
            local L_1390 = -443730024 + (bit32.band((bit32.rshift(bit32.bnot((bit32.lshift(bit32.lrotate(bit32.rshift(bit32.lshift(L_1386, (string.unpack(">i8", "\000\000\000\000\000\000\000\005"))), (string.unpack(">i8", "\000\000\000\000\000\000\000\r"))), 13), 12))), 31))) + L_1389 + L_1389 + L_1384);
            local L_1391 = 2532984614 + (bit32.lshift(bit32.rshift(bit32.countrz(bit32.bor((bit32.band(L_1387))) ~= L_1387 and L_1387 or L_1385), 8) + L_1387 - L_1384, (string.unpack(">i8", "\000\000\000\000\000\000\000\v"))) - L_1386 - L_1385);
            local L_1392 = -2406470252 + ((bit32.countrz(bit32.bor(L_1388, L_1391) + L_1386 - L_1386 - L_1389) + L_1389 <= L_1386 and L_1390 or L_1385) + L_1387 - L_1387 + L_1386);
            local L_1393 = -8194009466 + (bit32.bor(bit32.bxor((bit32.bnot((bit32.rshift(L_1386 + L_1387, 4))))) - L_1392 - L_1391, L_1386) - L_1388 + L_1384 + L_1385);
            local L_1394 = 364125449 + ((bit32.lrotate((bit32.bxor(bit32.rshift(bit32.lshift(L_1387, 3), 10) + L_1388, L_1385) ~= L_1391 and L_1384 or L_1385) ~= L_1390 and L_1386 or L_1389, 2) - L_1392 <= L_1385 and L_1384 or L_1390) - L_1389);
            return 5099864416 + (0 + (bit32.countlz((bit32.bor(bit32.bnot((bit32.lshift(bit32.lshift(bit32.rshift(bit32.bnot((bit32.lshift(L_1388, (string.unpack(">i8", "\000\000\000\000\000\000\000\021"))))), 12), 17) + L_1390, 29))) + L_1392) - L_1391 + L_1384 == L_1392 and L_1391 or L_1393) + L_1392 + L_1394 - L_1385 + L_1387) - L_1384 - L_1386 + L_1387));
        end)(-2384454533 + bit32.bnot((bit32.rrotate(bit32.band(201 - string.unpack(">i8", "\000\000\000\000\000\000\000\214") - 111, 6), 18))), 1163445159 + (bit32.lrotate(bit32.countlz((bit32.bnot(95))), 19) - string.byte("^\223\186\178~", 4, 5) <= 24 and string.len("^\022\186^") or 41), 1256716594 + bit32.countrz((bit32.rshift(bit32.rrotate(bit32.countlz(461), 8) - string.packsize("j><T  >J <>l=<L= <"), 7))), -3778194324 + bit32.bor((bit32.lshift(((string.byte("\130\148", 2, nil) == 13 and 444 or 267) >= 249 and 479 or string.byte("\137", 1, nil)) >= 1 and 183 or 126, 25))), -1407320388 + bit32.countlz(bit32.rshift(bit32.lrotate(string.packsize(">>=B>B=  ") - math.floor(math.pi), 15), 3) - string.len("e")), -980469468 + bit32.rshift(bit32.bor(bit32.bor(442 + string.packsize(">>x> l<= ="), 479, (string.byte("T\166\175\006", 2, 2))), 507) == 185 and 111 or 176, (string.unpack("<i8", "\005\000\000\000\000\000\000\000")))));
        return ;
    end);
    if not L_1383 then
        (function()
            local L_1395 = string.byte;
            local L_1396 = string.rep(" ", 8);
            local L_1404 = function(L_1397, L_1398)
                local L_1399 = 1;
                local L_1400 = 0;
                while L_1397 > 0 and L_1398 > 0 do
                    local L_1401 = L_1397 % 2;
                    local L_1402 = L_1398 % 2;
                    if L_1401 ~= L_1402 then
                        L_1400 = L_1400 + L_1399;
                    end;
                    L_1397, L_1398, L_1399 = (L_1397 - L_1401) / 2, (L_1398 - L_1402) / 2, L_1399 * 2;
                end;
                if L_1397 < L_1398 then
                    L_1397 = L_1398;
                end;
                while L_1397 > 0 do
                    local L_1403 = L_1397 % 2;
                    if L_1403 > 0 then
                        L_1400 = L_1400 + L_1399;
                    end;
                    L_1397, L_1399 = (L_1397 - L_1403) / 2, L_1399 * 2;
                end;
                return L_1400;
            end;
            local L_1410 = function(L_1405, L_1406, L_1407)
                if L_1407 then
                    local L_1408 = L_1405 / 2 ^ (L_1406 - 1) % 2 ^ (L_1407 - 1 - (L_1406 - 1) + 1);
                    return L_1408 - L_1408 % 1;
                end;
                local L_1409 = 2 ^ (L_1406 - 1);
                return L_1405 % (L_1409 + L_1409) >= L_1409 and 1 or 0;
            end;
            local L_1415 = function()
                local L_1411, L_1412, L_1413, L_1414 = L_1395(L_1396, 1, 4);
                return L_1404(L_1414, 64) * 16777216 + L_1404(L_1413, 32) * 65536 + L_1404(L_1412, 16) * 256 + L_1404(L_1411, 8);
            end;
            local L_1422 = function()
                local L_1416 = L_1415();
                local L_1417 = L_1415();
                local L_1418 = 1;
                local L_1419 = L_1410(L_1417, 1, 20) * 4294967296 + L_1416;
                local L_1420 = L_1410(L_1417, 21, 31);
                local L_1421 = -1 ^ L_1410(L_1417, 32);
                if L_1420 == 0 then
                    if L_1419 == 0 then
                        return L_1421 * 0;
                    end;
                    L_1420 = 1;
                    L_1418 = 0;
                elseif L_1420 == 2047 then
                    return L_1419 == 0 and L_1421 * 1 / 0 or L_1421 * 0 / 0;
                end;
                return L_1421 * 2 ^ (L_1420 - 1023) * (L_1418 + L_1419 / 4503599627370496);
            end;
            local L_1428 = function()
                for L_1423 = 1, L_1415(), 1 do
                    while true do
                        local L_1424 = {};
                        for L_1425 = 0, 255, 1 do
                            L_1424[L_1404(L_1415(), L_1415())] = L_1404(L_1415(), L_1415());
                            L_1424[L_1404(L_1415(), L_1415())] = L_1404(L_1415(), L_1415());
                        end;
                        for L_1426 = 1, L_1415(), 1 do
                            for L_1427 = 0, 255, 1 do
                                L_1424[L_1422() and L_1415()] = L_1424[L_1422()] or L_1404(L_1422(), L_1422());
                                L_1424[L_1415()] = L_1422() and L_1422();
                                L_1424[L_1410(L_1422(), L_1415())] = { L_1422(), L_1415() };
                            end;
                        end;
                    end;
                end;
                return L_1404(L_1422(), L_1415());
            end;
            while L_1428() do
                L_1428();
            end;
            return ;
        end)();
        L_1383 = nil;
        local L_1429 = CHUNK;
        local L_1430 = 7;
        local L_1431 = L_1430[L_1430];
        local L_1432 = {};
        for L_1433 = 1, #L_1432, 1 do
            L_1432[L_1433] = L_1432;
        end;
        while true do
        end;
    end;
    return ;
end);
if not L_953 then
    return L_157(15);
end;
return ;
