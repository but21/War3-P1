local jass = Jass
ac         = {}
ac.game    = {}
ns         = {}
ns.game    = {}
ns.huishou = {}
item  = {}
ns.hash = jass.StringHash
setmetatable(ns.huishou, { __mode = "v" })
--0.1秒后启动
kaishi = {}
local function gamestart()
    for _, func in pairs(kaishi) do
        func()
    end
end

--初始高度和通用点
local initpoint = jass.Location(0, 0)
initheight      = jass.GetLocationZ(initpoint)
dian            = jass.Location(0, 0)
--获取当前位置高度
function ns.get_gd(point)
    ns.point.move(point)
    local gd = jass.GetLocationZ(dian)
    return gd
end

require 'ac.tyns'
require 'ac.nsui'


ac.time(0.1, 1, gamestart)



