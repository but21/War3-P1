local jass        = require "jass.common"
local japi        = require "jass.japi"
local ns          = ns
ns.player         = {}
ns.player.__index = ns.player
player            = ns.player

--所有玩家(1-12)
player.allhave    = {}

--#region

--没有使用 jass.PLAYER_SLOT_STATE_EMPTY
--正在游戏 jass.PLAYER_SLOT_STATE_PLAYING
--离开游戏 jass.PLAYER_SLOT_STATE_LEFT

--创建玩家对象
function ns.player.create(id)
    local newplayer = {}
    newplayer.handle = ConvertedPlayer(id)
    newplayer._type = "player"
    newplayer.id = id
    newplayer.play = id
    newplayer.self = newplayer
    setmetatable(newplayer, ns.player)
    return newplayer
end

--添加所有玩家
function ns.player.add_all()
    --1,12
    for i = 1, 12 do
        player[i] = ns.player.create(i)
        table.insert(player.allhave, player[i])
    end
    --13,14
    player['中立敌对'] = ns.player.create(13)
    player['中立被动'] = ns.player.create(14)

    player['本地玩家'] = player[jass.GetLocalPlayer()]
    player.self = player['本地玩家']
    player[0] = player.self
end

--获取玩家id
function ns.player:get_id()
    return jass.GetPlayerId(self.handle) + 1
end

--获取玩家名字
function ns.player:get_name()
    return jass.GetPlayerName(self.handle)
end

--设置玩家名字
function ns.player:set_name(name)
    jass.SetPlayerName(self.handle, name)
    return self
end

--玩家是不是人
function ns.player:is_user()
    return jass.GetPlayerController(self.handle) == jass.MAP_CONTROL_USER
end

--游戏状态
function ns.player:is_state()
    if jass.GetPlayerSlotState(self.handle) == jass.PLAYER_SLOT_STATE_PLAYING then
        return true
    else
        return false
    end
end

--IF本地玩家
function ns.player:IsLocalPlayer()
    return jass.GetLocalPlayer() == self.handle
end

--录入1-16玩家
ns.player.add_all()

--玩家颜色
player[01].color = '|cffff0000'
player[02].color = '|cFF0041FF'
player[03].color = '|cff1d1d1d'
player[04].color = '|cFF530080'
player[05].color = '|cFFFFFF00'
player[06].color = '|cFFFE890D'
player[07].color = '|cFF1FBF00'
player[08].color = '|cFFE500AF'
player[09].color = '|cFF949596'
player[10].color = '|cFF7DBEF1'
player[11].color = '|cFF0F6145'
player[12].color = '|cFF4D2903'

--玩家颜色文本
function ns.player:get_color()
    return self.color or ""
end

--玩家科技当前等级
function ns.player:get_kjdj(name)
    if type(name) == "string" then
        name = tonumber(name)
    end
    return GetPlayerTechCountSimple(name, self.handle)
end

--玩家科技最大等级
function ns.player:get_kjdj2(name)
    if type(name) == "string" then
        name = tonumber(name)
    end
    return GetPlayerTechMaxAllowedSwap(name, self.handle)
end

--设置玩家科技当前等级
function ns.player:set_kjdj(name, level)
    if type(name) == "string" then
        name = tonumber(name)
    end
    return jass.AddPlayerTechResearched(self.handle, name, level)
end

--设置玩家科技最大等级
function ns.player:set_kjdj2(name, level)
    if type(name) == "string" then
        name = tonumber(name)
    end
    return SetPlayerTechResearchedSwap(name, level, self.handle)
end

--获取玩家平台的完整名字
function ns.player:get_allname()
    return japi.DzAPI_Map_GetPlayerUserName(self.handle)
end

--获取玩家平台的账号ID
function ns.player:get_playerid()
    return japi.KKApiPlayerGUID(self.handle)
end
