local code = require 'jass.code'
local jass = Jass
local japi = require 'jass.japi'
local excel = require "ac.tyns.excel"
local manager = {}

--[[
    表格数据读取方式:
    excel["表格名"][每行的ID][列名]         excel["怪物数值"][1001]["攻击力"]
    excel["表格名"]:get_val(行ID, 列名)     excel["怪物数值"]:get_val(1001, 攻击力)
    excel["表格名"]:get_val(行ID, 第几列)   excel["怪物数值"]:get_val(1001, 6)
]]


---从表格中提取实数
---@param excelName string 表格名
---@param rowID integer 行ID
---@param columnName string 列名
---@return number|nil -- 返回值
function manager:GetReal(excelName, rowID, columnName)
	if not excel[excelName] then
		return print("未读取到表格", excelName, rowID, columnName)
	end
	local val = excel[excelName]:get_val(rowID, columnName)
	val = type(val) == "number" and val or print("未提取到实数", "表格名: " .. excelName, "行: " .. rowID, "列: " .. columnName)
	return val or 0
end

function code.GetRealFromExcel(excelName, rowID, columnName)
	return manager:GetReal(excelName, rowID, columnName)
end

--- 从表格中提取整数
---@param excelName string 表格名
---@param rowID integer 行ID
---@param columnName string 列名
---@return integer|nil --返回值
function manager:GetInt(excelName, rowID, columnName)
	if not excel[excelName] then
		return print("未读取到表格", excelName, rowID, columnName)
	end
	local val = excel[excelName]:get_val(rowID, columnName)
	val = type(val) ~= "string" and val or print("未提取到整数", "表格名: " .. excelName, "行: " .. rowID, "列: " .. columnName)
	return val or 0
end

function code.GetIntegerFromExcel(excelName, rowID, columnName)
	return manager:GetInt(excelName, rowID, columnName)
end

--- 从表格中提取字符串
---@param excelName string 表格名
---@param rowID integer 行ID
---@param columnName string 列名
---@return string|nil --返回值
function manager:GetStr(excelName, rowID, columnName)
	if not excel[excelName] then
		return print("未读取到表格", excelName, rowID, columnName)
	end
	local val = excel[excelName]:get_val(rowID, columnName)
	val = val and tostring(val) or print("未提取到字符串", "表格名: " .. excelName, "行: " .. rowID, "列: " .. columnName)
	return val or ""
end

function code.GetStringFromExcel(excelName, rowID, columnName)
	return manager:GetStr(excelName, rowID, columnName)
end

---获取表格数据
---@param excelName string 表格名
---@param rowID integer 整数
---@param columnName string 列名
---@return any
function manager:GetData(excelName, rowID, columnName)
	if not excel[excelName] then
		return print("未读取到表格", excelName, rowID, columnName)
	end
	if not excel[excelName][rowID] then
		return print("未读取到ID", excelName, rowID, columnName)
	end
	return excel[excelName][rowID][columnName]
end

function manager:GetLength(excelName)
	return #excel[excelName]
end

return manager
