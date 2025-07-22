local jass = require "jass.common"
local dzapi = require "jass.dzapi"
local code = require "jass.code"
local japi = require "jass.japi"

local event = {}



--1是按下,2是释放

--按下
local function triggerEventon()
    local anniu = dzapi.DzGetTriggerKey()
    --玩家对象
    local play = GetConvertedPlayerId(dzapi.DzGetTriggerKeyPlayer())
    if japi.GetChatState() == false then
        --回调
        if event[1][anniu] then
            for _, callback in ipairs(event[1][anniu]) do
                callback(play)
            end
        end
    end
end

--释放
local function triggerEventoff()
    local anniu = dzapi.DzGetTriggerKey()
    --玩家对象
    local play = GetConvertedPlayerId(dzapi.DzGetTriggerKeyPlayer())

    --回调
    if event[2][anniu] then
        for _, callback in ipairs(event[2][anniu]) do
            callback(play)
        end
    end
end

--键盘按键注册事件,按下[1]or释放[2],按钮数字
function ns.anniufunc(name, numb)
    if not event[name] then
        event[name] = {}
    end
    if not event[name][numb] then
        event[name][numb] = {}
        local trg         = jass.CreateTrigger()
        local id          = 0
        if name == 1 then
            id = 1
            jass.TriggerAddAction(trg, triggerEventon)
        end
        if name == 2 then
            id = 0
            jass.TriggerAddAction(trg, triggerEventoff)
        end
        code.DzTriggerRegisterKeyEventTrg(trg, id, numb)
    else

    end

    return function(callback)
        table.insert(event[name][numb], callback)
    end
end

--测试
--[[ ns.anniufunc(1,113)(function(play)
    print("按下113")
    print(play)
end)

ns.anniufunc(2,113)(function(play)
    print("释放113")
    print(play)
end)

ns.anniufunc(1,114)(function(play)
    print("oookkkk1142222")
    print(play)
end)
 ]]
