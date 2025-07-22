local ac = ac
local jass = require "jass.common"

--简用
--如果在函数内使用return false就会退出循环
function ac.loop(a, b, func)
    if type(b) == "function" then
        func = b
        b = a
        a = 1
    else
    end
    if a > b then
        for i = a, b, -1 do
            if func(i) == false then
                break
            end
        end
    else
        for i = a, b do
            if func(i) == false then
                break
            end
        end
    end
end

--拷贝
function ac.copyTable(original)
    local copy = {}
    for key, value in pairs(original) do
        if type(value) == "table" then
            copy[key] = ac.copyTable(value) -- 递归复制嵌套表
        else
            copy[key] = value
        end
    end
    return copy
end

--字符串和数值互转
function ac.is2(zfc)
    if type(zfc) == "string" then
        zfc = tonumber(zfc)
    else
        if type(zfc) == "number" then
            zfc = tostring(zfc)
        end
    end

    return zfc
end

--输入文字启动测试
local test = {}
function ac.test(zfc)
    if type(zfc) == "number" then
        zfc = tostring(zfc)
    end
    if not test[zfc] then
        test[zfc] = {}
    end
    return function(callback)
        table.insert(test[zfc], callback)
    end
end

local trg = jass.CreateTrigger()
jass.TriggerAddAction(trg, function()
    local play = GetConvertedPlayerId(jass.GetTriggerPlayer())
    local mess = jass.GetEventPlayerChatString()

    if test[mess] then
        for _, v in ipairs(test[mess]) do
            v(play, mess)
        end
    end
end)
for i = 0, jass.bj_MAX_PLAYER_SLOTS - 1 do
    jass.TriggerRegisterPlayerChatEvent(trg, jass.Player(i), "", false)
end

-- 使用示例
--[[ ac.test(1)(function (play,mess)
    print("cocss")
end) ]]

--切开连续文字
function ac.string(str, delimiter)
    local result = {}
    for match in (str .. delimiter):gmatch("(.-)" .. delimiter) do
        table.insert(result, match)
    end
    return result
end

-- 使用示例
--[[ local str = "a,b,c,d"
local tbl = ac.string(str, ",")
for i, v in ipairs(tbl) do
    print(i, v)
end ]]
