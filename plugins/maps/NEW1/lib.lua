local jass = require "jass.common"
local type = type
---@class  tablelib
local table = table
---@class mathlib
local math = math

---快速移除线性表中第index个元素(不保留顺序)
---@param t table
---@param index integer
---@return table|nil
function table.Remove2(t, index)
	local size = #t
	if index < 1 or index > size then
		return print("错误: 索引超出范围", index, size)
	end
	local temp = t[index]
	t[index] = t[size]
	t[size] = nil
	return temp
end

---获取无序表长度
---@param t table
---@return integer -- 返回表的长度
function table.GetLength(t)
	local length = 0
	for key, value in pairs(t) do
		length = length + 1
	end
	return length
end

---清空表(只遍历一层, 防止清空引用)
---@param t table
function table.ClearTable(t)
	for key, value in pairs(t) do
		t[key] = nil
	end
end

---清空表(递归, 清除所有)
---@param t table
function table.ClearTable2(t)
	for key, value in pairs(t) do
		if type(value) == "table" then
			table.ClearTable2(value)
		end
		t[key] = nil
	end
end

---pairs表中元素
---@param t table
function table.Pairs(t)
	for key, value in pairs(t) do
		print(key, value)
	end
end

---ipairs表中元素
---@param t table
function table.IPairs(t)
	for key, value in ipairs(t) do
		print(key, value)
	end
end

---获取随机整数
---@param min integer 最小值
---@param max integer 最大值
---@return integer
function math.RandomInt(min, max)
	return jass.GetRandomInt(min, max)
end

---获取随机实数
---@param min number 最小值
---@param max number 最大值
---@return real
function math.RandomReal(min, max)
	return jass.GetRandomReal(min, max)
end
