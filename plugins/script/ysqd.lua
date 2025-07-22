local losttime = os.clock()
--载入快餐代码
require 'ing'
local times = os.date("%X", os.time())
local newtime = os.clock() - (losttime or 0)
local rom = ns.sjzs(1, 99)
--show
-- print(times.."  原神启动!!!".." 本次载入时间 "..newtime.."! 你已经超过全国"..tonumber(rom).."%的作者!!")
-- print(times .. "  原神启动!!!" .. " 本次载入时间 " .. newtime .. "! 你已经超过全国" .. tonumber(rom) .. "%的作者!!")
local bool, res = pcall(require, "path")
if not res then
	require "log"
end
print("\n－O－ 载入时间: " .. os.date("%Y-%m-%d %H:%M:%S", os.time()) .. " －O－ \n\n\\(@^0^@)/ 为世界上所有的美好而战!!! \\(@^0^@)/\n")
