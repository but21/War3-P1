local code = require "jass.code"
local jass = require "jass.common"
local japi = require "jass.japi"

local manager = {}
local string = string
local math = math
local table = table
local type = type
local rawset = rawset
local rawget = rawget

local assert = assert
local setmetatable = setmetatable
local getmetatable = getmetatable

LUIUpdate = {}
UIFunc_Table = {}

local LUIUpdate = LUIUpdate
local UIFunc_Table = UIFunc_Table


local ipairs = ipairs
local math_modf = math.modf
local string_format = string.format
local string_len = string.len
local table_insert = table.insert
local table_remove = table.remove

--- 插值计算
---@param lerp any 参数表
-- - P: 返回值
-- - ty: 变换类型
-- - t: 变换总时间
-- - endP: 结束点
local function Lerp(lerp)
	-- 将表放到,每帧绘制里面, 计算差值
	-- 参数:  ty, 时间, 起始位置, 结束位置
	local tween = {}
	local s = {}
	for index, value in ipairs(lerp.P) do
		s[index] = lerp.P[index]
	end
	tween.P = lerp.P
	tween.ty = lerp.ty
	tween.t = lerp.t
	tween.nowT = 0
	tween.startP = s
	tween.endP = lerp.endP
	tween.sel = lerp.sel
	tween.ctlP1 = lerp.ctlP1
	tween.ctlP2 = lerp.ctlP2
	table_insert(LUIUpdate, tween)
	return tween
end

local loclerp = Lerp

--- 序列帧
--- @param argTable any 参数表
-- - image: 一个放序列帧路劲的表
-- - complete: 完成时调用的函数
-- - time: 每帧时间
-- - UI: 播放序列帧的图标(UI - image)
-- - isLoop: 是否循环播放, 默认为false
-- - moreAction: 是否有更多操作, 如达到某个条件后终止, 默认为无(函数)
function manager:SequenceFrame(argTable)
	local image      = argTable.image
	local time       = argTable.time
	local UI         = argTable.UI
	local isLoop     = argTable.isLoop
	local moreAction = argTable.moreAction
	local len        = #image
	local lerp       = { 1, len + 1 }
	UI:set_icon(image[1])
	local tween = loclerp({ P = lerp, ty = "线性", t = time * len, endP = { len + 1, 1 } })
	local function Main(key)
		if lerp.interrupt then
			table_remove(UIFunc_Table, key)
			return
		end
		if lerp.complete and isLoop then
			-- lerp = { 1, len + 1 }
			-- loclerp({ P = lerp, ty = "线性", t = time * len, endP = { len + 1, 1 } })
			lerp = { 1, len + 1 }
			tween.P = lerp
			tween.nowT = 0
			-- tween.complete = false
			tween.P.complete = false
			-- argTable.complete = false
			table.insert(LUIUpdate, tween)
		end
		local index = math_modf(lerp[1])
		if index > len then index = len end
		UI:set_icon(image[index])
		if moreAction then
			moreAction(UI, index)
		end
		if lerp.complete or UI.stop then
			if argTable.complete then argTable.complete(UI) end
			table_remove(UIFunc_Table, key)
		end
	end
	table_insert(UIFunc_Table, Main)
	return tween
end

---淡入淡出
---@param tab any 传入一张表作为参数，表内元素如下
-- - show：淡入或淡出，布尔值
-- - time：时间（默认为0.35秒），实数
-- - UI: 需要淡入淡出的UI
-- - complete: 完成时调用的函数
-- - moreAction： 是否有额外的操作（默认没有），函数
function manager:FadeAlpha(tab)
	local alpha = {}
	local endP = {}
	local time = 0.35 -- 默认时间
	local func
	if tab.show then
		alpha[1] = 0
		endP[1] = 1
	else
		alpha[1] = 1
		endP[1] = 0
	end
	if tab.time then
		time = tab.time
	end
	local tween = loclerp({
		P = alpha,
		ty = '线性',
		t = time,
		endP = endP
	})
	tab.UI:set_alpha(alpha[1])
	func = function(key)
		--- 中断 -- 1
		if alpha.interrupt then
			table_remove(UIFunc_Table, key)
			return
		end
		--- 中断 -- 2
		if tab.UI.alpha_interrupt then
			table_remove(UIFunc_Table, key)
			return
		end

		tab.UI:set_alpha(alpha[1])
		if tab.moreAction then
			tab.moreAction(tab.UI, alpha[1])
		end
		if alpha.complete then
			if tab.complete then tab.complete(tab.UI) end
			table_remove(UIFunc_Table, key)
		end
	end
	table_insert(UIFunc_Table, func)
	return tween
end

---淡入淡出
---@param tab any 传入一张表作为参数，表内元素如下
-- - show：淡入或淡出，布尔值
-- - time：时间（默认为0.35秒），实数
-- - UI: 需要淡入淡出的UI数组
-- - complete: 完成时调用的函数
-- - moreAction： 是否有额外的操作（默认没有），函数
function FadeAlphas(tab)
	local UI = tab.UI
	local alpha = {}
	local endP = {}
	local time = 0.35 -- 默认时间
	local func
	if tab.show then
		alpha[1] = 0
		endP[1] = 1
	else
		alpha[1] = 1
		endP[1] = 0
	end
	if tab.time then
		time = tab.time
	end
	local tween = Lerp({
		P = alpha,
		ty = '线性',
		t = time,
		endP = endP
	})
	for i = #UI, 1, -1 do
		UI[i]:set_alpha(alpha[1])
	end
	func = function(key)
		if alpha.interrupt then
			table_remove(UIFunc_Table, key)
			return
		end
		for i = #UI, 1, -1 do
			UI[i]:set_alpha(alpha[1])
		end
		if tab.moreAction then
			tab.moreAction(UI, alpha[1])
		end
		if alpha.complete then
			if tab.complete then tab.complete(UI) end
			table_remove(UIFunc_Table, key)
		end
	end
	table_insert(UIFunc_Table, func)
	return tween
end

--- UI位置变换
--- @param argTable any 表
-- - UI: 进行位置变换的UI
-- - fUI: 跟随的UI(没有跟随的UI则为设置绝对位置)
-- - time: 变换UI所用的时间
-- - startP: 起始点 (表) (相对位置)
-- - endP: 终点 (表) (相对位置)
-- - moreAction: 更多操作 (函数)
-- - anchor: 表 锚点(默认中心)
-- - ty: 变换类型
-- - complete:  完成时调用的函数
-- - ctlP1: 类型为贝塞尔时的控制点1(二阶贝塞尔)
-- - ctlP2: 类型为贝塞尔时的控制点2(三阶贝塞尔)
function manager:FadePosition(argTable)
	local UI = argTable.UI
	local fUI = argTable.fUI
	local time = argTable.time
	local startP = argTable.startP
	local endP = argTable.endP
	local ty = argTable.ty
	local ctlP1 = argTable.ctlP1
	local ctlP2 = argTable.ctlP2


	-- 判断是否传入锚点, 默认为中心
	local anchor = {}
	if argTable.anchor then
		anchor = argTable.anchor
	else
		anchor = { "中心", "中心" }
	end

	local position = { startP[1], startP[2] }

	local tween = loclerp({
		P = position,
		ty = ty,
		t = time,
		endP = endP,
		ctlP1 = ctlP1,
		ctlP2 = ctlP2,
	})


	local function Main(key)
		if position.interrupt then
			table_remove(UIFunc_Table, key)
			return
		end
		if fUI then
			UI:set_point(anchor[1], fUI, anchor[2], position[1], position[2])
			if argTable.moreAction then
				argTable.moreAction(argTable.UI, position[1], position[2])
			end
			if position.complete then
				if argTable.complete then argTable.complete(UI) end
				table_remove(UIFunc_Table, key)
			end
		else
			UI:set_point2(anchor[1], position[1], position[2])
			if argTable.moreAction then
				argTable.moreAction(argTable.UI, position[1], position[2])
			end
			if position.complete then
				if argTable.complete then argTable.complete(UI) end
				table_remove(UIFunc_Table, key)
			end
		end
	end
	table_insert(UIFunc_Table, Main)
	return tween
end

--- 设置UI大小
--- @param argTable any 表
-- - UI: 进行大小调整的UI
-- - time: 调整UI大小所用的时间
-- - startP: 起始大小 (表)
-- - endP: 结束大小 (表)
-- - moreAction: 更多操作 (函数)
-- - complete: 完成时调用的函数
-- - ty: 变换类型
function manager:FadeSize(argTable)
	local UI = argTable.UI
	local time = argTable.time
	local startP = argTable.startP
	local endP = argTable.endP
	local ty = argTable.ty

	local size = { startP[1], startP[2] }

	local tween = Lerp({
		P = size,
		ty = ty,
		t = time,
		endP = endP
	})
	local function Main(key)
		if size.interrupt then
			table_remove(UIFunc_Table, key)
			return
		end
		if size.interrupt then
			table_remove(UIFunc_Table, key)
			return
		end
		UI:set_wh(size[1], size[2])
		if argTable.moreAction then
			argTable.moreAction(argTable.UI)
		end
		if size.complete then
			if argTable.complete then argTable.complete(UI) end
			table_remove(UIFunc_Table, key)
		end
	end
	table_insert(UIFunc_Table, Main)
	return tween
end

--- 设置UI大小
--- @param argTable any 表
-- - UI: 进行大小调整的UI数组
-- - time: 调整UI大小所用的时间
-- - startP: 起始大小 (表)
-- - endP: 结束大小 (表)
-- - moreAction: 更多操作 (函数)
-- - complete: 完成时调用的函数
-- - ty: 变换类型
function FadeSizes(argTable)
	local UI = argTable.UI
	local time = argTable.time
	local startP = argTable.startP
	local endP = argTable.endP
	local ty = argTable.ty

	local size = { startP[1], startP[2] }

	local tween = Lerp({
		P = size,
		ty = ty,
		t = time,
		endP = endP
	})
	local function Main(key)
		if size.interrupt then
			table_remove(UIFunc_Table, key)
			return
		end
		if size.interrupt then
			table_remove(UIFunc_Table, key)
			return
		end
		for i = 1, #UI, 1 do
			UI[i]:set_wh(size[1], size[2])
		end
		if argTable.moreAction then
			argTable.moreAction(argTable.UI)
		end
		if size.complete then
			if argTable.complete then argTable.complete(UI) end
			table_remove(UIFunc_Table, key)
		end
	end
	table_insert(UIFunc_Table, Main)
	return tween
end

-- 当前正在抖动的按钮(异步)
local buttonShake = {}

--- 点击按钮抖动
--- @param argTable any 表
-- - UI: 进行按钮抖动的UI
-- - amp: 幅度,默认0.13
-- - freq：频率，默认1
-- - time: 变换时间，默认0.16
function manager:ButtonShake(argTable)
	local UI = argTable.UI
	local time = argTable.time or 0.16
	local amp = argTable.amp or 0.05
	local freq = argTable.freq or 1
	local w, h = UI:get_w(), UI:get_h()
	local size = { w, h }
	if not buttonShake[UI] then
		buttonShake[UI] = loclerp({ P = size, ty = '抖动', t = time, endP = { w + amp, h + amp }, sel = freq })
		function Main(key)
			UI:set_wh(size[1], size[2])
			if size.complete then
				-- UI.shake = nil
				buttonShake[UI] = nil
				table_remove(UIFunc_Table, key)
			end
		end

		table_insert(UIFunc_Table, Main)
	else
		--重头开始
		-- UI.shake.nowT = 0
		buttonShake[UI].nowT = 0
	end
end

local ChineseD = { '万', '亿', '兆', '京' }
---转换为万、千万制的字符串
---@param numb number 需要转换的值
---@return string -- 返回(单位: 万, 亿, 兆, 京)
function manager:NumToChinese(numb)
	local temp = numb / 10000
	if temp < 1 then
		return string_format("%.0f", numb)
	end
	local c = 0 -- ChieseD的下标
	local hz = '' -- 后缀
	local res  -- 返回结果
	while temp >= 1 do
		c = c + 1
		numb = numb / 10000
		temp = temp / 10000
	end
	if c > 0 then
		hz = ChineseD[c]
		temp = numb / 10
		c = 1
		while temp > 1 do
			temp = temp / 10
			c = c + 1
		end
		if c > 2 then
			-- 不保留小数
			res = string_format("%.0f", numb) .. hz
		else
			-- 保留两位小数
			res = string_format("%.1f", numb) .. hz
		end
	else
		res = string_format("%.0f", numb)
	end
	return res
end

--- 文本逐字出现
--- @param argTable { UI:table;time:number;text:string;moreAction:function;complete:function }
-- - UI：设置文本的UI
-- - time：总时间
-- - text：文本
-- - moreAction：每帧的额外动作
-- - complete：完成时的动作
function FadeText(argTable)
	local UI = argTable.UI
	local time = argTable.time
	local text = argTable.text
	local moreAction = argTable.moreAction
	local complete = argTable.complete
	local l = { 1 }
	local i, cori = 1, 0
	UI:set_text('_')
	local tween = Lerp({ P = l, ty = '二元入', t = time, endP = { string_len(text) } })
	function Main(key)
		if l.interrupt then
			table_remove(UIFunc_Table, key)
			return
		end
		if i ~= math_modf(l[1]) then
			i = math_modf(l[1]) + cori
			local char = text:sub(i, i)
			if char == "|" then
				-- 获取特殊字符及其参数
				local specialChar = text:sub(i, i + 1) -- |n和|r 的长度为2
				if specialChar == "|n" or specialChar == "|r" then
					i = i + 1
					cori = cori + 1 -- 长度修正1
				elseif specialChar == "|c" then
					i = i + 9
					cori = cori + 9 -- 长度修正9
				end
			end
			UI:set_text(text:sub(1, i) .. '_')
			--if i % 2 == 0 then UI:set_text(text:sub(1, i)) else UI:set_text(text:sub(1, i) .. '_') end
		end
		if l.complete then
			UI:set_text(text)
			if complete then complete(UI) end
			table_remove(UIFunc_Table, key)
		end
	end

	table_insert(UIFunc_Table, Main)
	return tween
end

---等待一段时间后做动作
-- - time：等待的事件
-- - action：动作
function WaitToDo(argTable)
	local t = { 0 }
	local action = argTable.action
	local tween = Lerp({ P = t, t = argTable.time, ty = '线性', endP = { argTable.time } })
	local Main = function(key)
		if t.interrupt then
			table.remove(UIFunc_Table, key)
			return
		end
		if t.complete then
			action()
			table.remove(UIFunc_Table, key)
		end
	end
	table.insert(UIFunc_Table, Main)
	return tween
end

---获取自定义值
---@param object integer 被获取自定义值的对象: 单位 / 特效 / 触发器 / 物品 / 物品类型
---@param type "整数"|"单位"|"实数"|"真值"|"特效"|"字符串"
---@param name string 自定义值名称
---@return any
function manager:GetCustomValue(object, type, name)
	if type == "单位" then
		return jass.LoadUnitHandle(jass.YDHT, object, jass.StringHash(name))
	end
	if type == "整数" then
		return jass.LoadInteger(jass.YDHT, object, jass.StringHash(name))
	end
	if type == "实数" then
		return jass.LoadReal(jass.YDHT, object, jass.StringHash(name))
	end
	if type == "真值" then
		return jass.LoadBoolean(jass.YDHT, object, jass.StringHash(name))
	end
	if type == "特效" then
		return jass.LoadEffectHandle(jass.YDHT, object, jass.StringHash(name))
	end
	if type == "字符串" then
		return jass.LoadStr(jass.YDHT, object, jass.StringHash(name))
	end
	return print("提取自定义值失败", type, name)
end

---设置自定义值
---@param object integer 被设置自定义值的对象: 单位 / 特效 / 触发器 / 物品 / 物品类型
---@param type "整数"|"单位"|"实数"|"字符串"
---@param name string 自定义值名称
---@param value any  设置的值
function manager:SetCustomValue(object, type, name, value)
	if type == "单位" then
		jass.SaveUnitHandle(jass.YDHT, object, jass.StringHash(name), value)
		return
	end
	if type == "整数" then
		jass.SaveInteger(jass.YDHT, object, jass.StringHash(name), value)
		return
	end
	if type == "实数" then
		jass.SaveReal(jass.YDHT, object, jass.StringHash(name), value)
		return
	end
	if type == "字符串" then
		jass.SaveStr(jass.YDHT, object, jass.StringHash(name), value)
	end
end

---ID转整数
---@param val string 单位类型/物品类型 ID
---@return integer -- 返回整数
function manager:ID2Int(val)
	assert(type(val) == "string", "Expected string for val")
	local n = #val
	local v = 0
	for i = 1, n do
		v = v + val:byte(i) * 256 ^ (n - i)
	end
	return math.floor(v)
end

---整数转ID
---@param val integer 单位类型/物品类型
---@return string -- 返回单位类型/物品类型的ID
function manager:Int2ID(val)
	assert(type(val) == "number" and val >= 0 and val == math.floor(val), "Expected non-negative integer for val")
	if val == 0 then return "\0" end
	local v = ''
	while val > 0 do
		v = string.char(val % 256) .. v
		val = math.floor(val / 256)
	end
	return v
end

---获取字符串中的指定索引的字符串
---@param inputstr string 输入字符串
---@param sep string 分割符
---@param index integer 索引
---@return string|number
function manager:SplitGetValue(inputstr, sep, index)
	sep = sep or "%s"
	local i = 0
	for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
		-- table.insert(t, tonumber(str) or str)
		i = i + 1
		if i == index then
			return tonumber(str) or str
		end
	end
	return "未获取到指定索引的字符串"
end

--- 将字符串按照分隔符分割为数组
---@param inputstr string 需要分割的字符串
---@param sep string 分隔符
---@return table<integer, integer|string> --分割后的数组
function manager:Split(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t = {}
	for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
		table.insert(t, tonumber(str) or str)
	end
	return t
end

---设置字符串中的数值颜色
---@param oriStr string 需要修改的字符串
---@param color string 数值前连接的颜色字符串
---@param str2 string 数值后面连接的字符串
---@return string
function manager:SetNumColor(oriStr, color, str2)
	local str = oriStr:gsub("(%d+%.?%d*)", function(number)
		return color .. number .. str2
	end)
	return str
end

---在字符串的字符串前面添加指定字符串
---@param str string 需要修改的字符串
---@param addStr string|nil 添加的字符串(默认为※)
---@param subStr string|nil 替换的字符串(默认为|n)
---@return string
function manager:StringFormat(str, addStr, subStr)
	-- 格式化字符串-1
	addStr = addStr or "※"
	subStr = subStr or "|n"
	str = string.gsub(str, subStr, subStr .. addStr)
	str = addStr .. str
	return str
end

---二分查找
---@param arr table  有序表
---@param target any 需要查找的目标值
---@return integer
function manager:BinarySearch(arr, target)
	local left = 1
	local right = #arr

	while left <= right do
		local mid = math.floor((right + left) / 2)
		if arr[mid] == target then
			return mid -- 找到目标值，返回索引
		elseif arr[mid] < target then
			left = mid + 1
		else
			right = mid - 1
		end
	end

	return -1 -- 未找到返回 -1
end

--- 修改字符串某个位置的字符值
---@param str string 需要修改的字符串
---@param pos integer 位置
---@param replacement string 修改后的值
---@return string
function manager:ReplaceCharAt(str, pos, replacement)
	if pos < 1 or pos > #str then
		error("位置超出字符串范围")
	end
	-- 将字符串拆分为三个部分：前缀、替换字符、后缀
	local prefix = string.sub(str, 1, pos - 1)
	local suffix = string.sub(str, pos + 1)

	-- 拼接新字符串
	return prefix .. replacement .. suffix
end

---清空表
---@param t table
function manager:ClearTable(t)
	for key, value in pairs(t) do
		-- if typeof(value) == "table" then
		-- 	table.ClearTable(value)
		-- end
		t[key] = nil
	end
end

---获取无序表长度
---@param t table
---@return integer -- 返回表的长度
function manager:GetTableLength(t)
	local length = 0
	for key, value in pairs(t) do
		length = length + 1
	end
	return length
end

---快速移除线性表中元素(不保留顺序)
---@param t table
---@param index integer
---@return table|nil
function manager:TableRemove(t, index)
	local size = #t
	if index < 1 or index > size then
		return print("错误: 索引超出范围", index, size)
	end
	local temp = t[index]
	t[index] = t[size]
	t[size] = nil
	return temp
end

local function sift_up(heap, index)
	local parent_index = math.floor(index / 2)
	while index > 1 and heap[index][1] < heap[parent_index][1] do
		heap[index], heap[parent_index] = heap[parent_index], heap[index]
		index = parent_index
		parent_index = math.floor(index / 2)
	end
end

local function sift_down(heap, index)
	local size = #heap
	while true do
		local left_child_index = 2 * index
		local right_child_index = 2 * index + 1
		local smallest_index = index

		if left_child_index <= size and heap[left_child_index][1] < heap[smallest_index][1] then
			smallest_index = left_child_index
		end
		if right_child_index <= size and heap[right_child_index][1] < heap[smallest_index][1] then
			smallest_index = right_child_index
		end

		if smallest_index ~= index then
			heap[index], heap[smallest_index] = heap[smallest_index], heap[index]
			index = smallest_index
		else
			break
		end
	end
end

local function heap_push(heap, element)
	table.insert(heap, element)
	sift_up(heap, #heap)
end

local heap = {}

---无放回加权随机抽样Ares, 样本数量较多时(几百)使用AExpJ算法
---@param samples table<integer, table<string, number>>  samples[index].weight为必须的权重字段
---@param m integer 样本数量
---@return table --结构和输入一样
function manager:ARes(samples, m)
	table.ClearTable(heap)
	for _, sample in ipairs(samples) do
		local weight = sample.weight
		if weight > 0 then
			local ui = math.RandomReal(0, 1)
			local ki = ui ^ (1 / weight)
			if #heap < m then
				heap_push(heap, { ki, sample })
			elseif ki > heap[1][1] then
				heap[1] = { ki, sample }
				sift_down(heap, 1)
			end
		end
	end
	local result = {}
	for _, entry in ipairs(heap) do
		table.insert(result, entry[2])
	end
	return result
end

local function find_index_binary_search(cumulative_weights, value)
	local low = 1
	local high = #cumulative_weights

	while low <= high do
		local mid = math.floor((low + high) / 2)
		if cumulative_weights[mid] < value then
			low = mid + 1
		else
			high = mid - 1
		end
	end
	return low
end
local cumulative_weights = {}
local original_indices = {} -- 存储有效权重的原始索引
--- 使用轮盘赌选择法（二分搜索优化）进行有放回的加权随机抽样。
--- @param samples table<integer, table>  samples[index].weight为必须的权重字段
--- @param k integer 需要抽样的次数
--- @return table --一个包含 k 个抽样结果的表
function manager:RWS(samples, k)
	if not samples or #samples == 0 then
		return {}
	end

	table.ClearTable2(cumulative_weights)
	table.ClearTable2(original_indices)

	local total_weight = 0

	-- 1. 计算累积权重，但只包含权重>0的项
	for index, sample in ipairs(samples) do
		local weight = sample.weight
		if weight > 0 then
			total_weight = total_weight + weight
			table.insert(cumulative_weights, total_weight)
			table.insert(original_indices, index)
		end
	end

	if total_weight == 0 then
		return {}
	end

	local results = {}
	for i = 1, k do
		local random_value = math.RandomReal(0, 1) * total_weight

		-- 使用二分搜索找到索引
		local found_idx = find_index_binary_search(cumulative_weights, random_value)
		local original_idx = original_indices[found_idx]

		table.insert(results, samples[original_idx])
	end

	return results
end

---深拷贝
---@param orig table
---@return table
function manager:DeepCopy(orig)
	local orig_type = type(orig)
	local copy
	if orig_type == 'table' then
		copy = {}
		for orig_key, orig_value in pairs(orig) do
			copy[orig_key] = self:DeepCopy(orig_value)
		end
		setmetatable(copy, self:DeepCopy(getmetatable(orig)))
	else
		copy = orig
	end
	return copy
end

return manager
