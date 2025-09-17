local ns = ns
local jass = Jass
local japi = require "jass.japi"
local event = {}

--判定字符串还是纯数值
local function isPureDigit(str)
    return str:match("^%d+$") ~= nil
end

--发送同步
function ns.sync_send(name, val)
    japi.DzSyncData(name, val)
end

--注册同步事件
function ns.sync_set(name)
    if not event[name] then
        event[name] = {}
        local trg = jass.CreateTrigger()
        jass.TriggerAddAction(trg, function()
            --获取同步数据和同步玩家
            --如何判断val这个字符串里面只是纯数字还是字符串
            local val = nil
            local SyncData = japi.DzGetTriggerSyncData() or ""
            if isPureDigit(SyncData) then
                val = tonumber(SyncData)
            else
                val = SyncData
            end
            local play = GetConvertedPlayerId(japi.DzGetTriggerSyncPlayer()) or 1
            if #event[name] > 0 then
                for _, callback in ipairs(event[name]) do
                    callback(play, val)
                end
            end
        end)
        japi.DzTriggerRegisterSyncData(trg, name, false)
    end
    return function(callback)
        table.insert(event[name], callback)
    end
end

--获取同步玩家
function ns.get_tbwj()
    return GetConvertedPlayerId(japi.DzGetTriggerSyncPlayer())
end
