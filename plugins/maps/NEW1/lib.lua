local jass = require "jass.common"
---@class  tablelib
local table = table
---快速移除线性表中第index个元素(不保留顺序)
---@param self table
---@param index integer
---@return table|nil
function table:Remove2(index)
	local size = #self
	if index < 1 or index > size then
		return print("错误: 索引超出范围", index, size)
	end
	local temp = self[index]
	self[index] = self[size]
	self[size] = nil
	return temp
end

---获取无序表长度
---@param self table
---@return integer -- 返回表的长度
function table:GetLength()
	local length = 0
	for key, value in pairs(self) do
		length = length + 1
	end
	return length
end

---清空表
---@param self table
function table:ClearTable()
	for key, value in pairs(self) do
		self[key] = nil
	end
end

---@class mathlib
local math = math

---获取随机整数
---@param min integer 最小值
---@param max integer 最大值
---@return integer
function math:RandomInt(min, max)
	return jass.GetRandomInt(min, max)
end

---获取随机实数
---@param min number 最小值
---@param max number 最大值
---@return real 
function math:RandomReal(min, max)
	return jass.GetRandomReal(min, max)
end
