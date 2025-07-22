local code = require "jass.code"
local jass = require "jass.common"
local japi = require "jass.japi"
local sqrt = math.sqrt

local Module = require "my_base.base_module_manager"
local myFunc = Module.MyFunc

-- 在lua中打印消息
function code.Print(message)
	print("t - lua print: ", message)
end

-- 计算两点间的距离
function code.DistanceBetweenPoints_XY(x1, y1, x2, y2)
	return sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
end

-- 将字符串根据sep分割成数组,返回第index个值
function code.Split(inputstr, sep, index)
	return myFunc:SplitGetValue(inputstr, sep, index)
end
