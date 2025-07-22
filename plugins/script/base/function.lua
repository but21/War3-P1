
local slk = require 'jass.slk'

acnz={}

function get_player_list()
    local list = {}
    for i=1,12 do 
        local player = acnz.player(i)
        --判断 玩家控制者==用户 and 游戏状态==正在游戏
        if GetPlayerController(player.handle) == ConvertMapControl(0) 
            and GetPlayerSlotState(player.handle) == ConvertPlayerSlotState(1)
        then 
            table.insert(list,player)
        end 
    end 
    return list 
end 

function get_real_player_list()
    local list = {}
    for i=1,12 do 
        local player = acnz.player(i)
        --判断 玩家控制者==用户 and 游戏状态==正在游戏
        if GetPlayerController(player.handle) == ConvertMapControl(0) 
            and GetPlayerSlotState(player.handle) == ConvertPlayerSlotState(1)
            and not player.is_replay
        then 
            table.insert(list,player)
        end 
    end 
    return list 
end 

--获取在线玩家数量
function get_player_count()
    local list = get_player_list()
    return #list
end 

function get_first_player()
    local list = get_player_list()
    return list[1] 
end 

function get_dead_count()
    local list = get_player_list()
    local count = 0
    for index,player in ipairs(list) do 
        local hero = player:get_hero()
        if hero and not hero:is_alive() then 
            count = count + 1
        end 
    end 
    return count 
end 


--获取物体编辑器上的单位数据
function get_unit_slk(name,key)
    local data = acnz.table.unit[name]
    if data == nil or data.id == nil then 
        return 
    end 

    local info = slk.unit[data.id]
    if info == nil then 
        return 
    end 
    local value = info[key]

    if type(value) == 'number' then 
        return tonumber(value) or value 
    end 

    return value
end 


function copy_table(old)
    local new = {}
    for key,value in pairs(old) do
        if type(value) == 'table' then
            new[key] = copy_table(value)
        else
            new[key] = value
        end
    end
    return new
end

function get_table_size(tbl)
    local count = 0 
    for key,value in pairs(tbl) do
        count = count + 1
    end
    return count
end

function get_hash(str)
    local function uint32_t (int)
        return int & 0xffffffff
    end
    local hash = uint32_t(5381)
    local length = str:len()
    for i = 1,length do
        local byte = str:sub(i,i):byte()
        hash = uint32_t(uint32_t(uint32_t(hash << 5) + hash) + byte)
    end
    return hash 
end

--36进制
local bytes_str = "0123456789abcdefghijklmnopqrstuvwxyz"
local len = bytes_str:len()
local bytes = {}
for i = 1, len do 
    bytes[i - 1] = bytes_str:sub(i,i)
end 

function number2str(number)
    local s = {}
    local num = number 
    while (math.modf(num / len) > 0) do 
        local int = num % len
        table.insert(s,1,bytes[int])
        num = math.modf(num / len)
    end 

    table.insert(s,1,bytes[num])
    return table.concat(s)
end 

function str2short(str)
    return number2str(get_hash(str))
end 

