local jass = require "jass.common"
local japi = require "jass.japi"
local ns = ns

ns.gametime = 0

local textone = '%d年/%d月/%d日'
local texttwo = '%02d:%02d:%02d'

--转化转换文本
local function timetodate(t)
    local time
    if t >= 0 then
        local year, month, day, hour, min, sec = os.date("%Y-%m-%d-%H-%M-%S", t):match("^(%d+)-(%d+)-(%d+)-(%d+)-(%d+)-(%d+)$")
        time = {tonumber(year), tonumber(month), tonumber(day), tonumber(hour), tonumber(min), tonumber(sec)}
    end
    return time
end

-- 计算已过去的时间并将其转换为小时、分钟和秒
local function formatElapsedTime(elapsed)
    local hours = math.floor(elapsed / 3600)
    local minutes = math.floor((elapsed % 3600) / 60)
    local seconds = elapsed % 60

    return string.format("%d时%02d分%02d秒", hours, minutes, seconds)
end

--获取日期截
local function get_time()
    return ns.gametime
end


--原神启动
function kaishi.gogotime()
    ns.gametime = japi.DzAPI_Map_GetGameStartTime() or 0.00
    --夏时令和南半球
    --
    --初始时间
    local maxtips = textone .. "/" .. texttwo
    local maxtext = maxtips:format(table.unpack(timetodate(ns.gametime)))
    -- print(maxtext)
    --时间计时
    ac.time(1, function(self)
        ns.gametime = ns.gametime + 1
    end)

    ac.time(60, function(self)
        local maxtext = maxtips:format(table.unpack(timetodate(ns.gametime)))
        local elapsedTime = formatElapsedTime(self:get_runtime())
        --print((maxtext .. " 游戏时间 " .. elapsedTime))
    end)
end

--时间戳
--[[ %a	abbreviated weekday name (e.g., Wed)
%A	full weekday name (e.g., Wednesday)
%b	abbreviated month name (e.g., Sep)
%B	full month name (e.g., September)
%c	date and time (e.g., 09/16/98 23:48:10)
%d	day of the month (16) [01-31]
%H	hour, using a 24-hour clock (23) [00-23]
%I	hour, using a 12-hour clock (11) [01-12]
%M	minute (48) [00-59]
%m	month (09) [01-12]
%p	either "am" or "pm" (pm)
%S	second (10) [00-61]
%w	weekday (3) [0-6 = Sunday-Saturday]
%x	date (e.g., 09/16/98)
%X	time (e.g., 23:48:10)
%Y	full year (1998)
%y	two-digit year (98) [00-99]
%%	the character `%´ ]]
