local code = require "jass.code"
local jass = require "jass.common"
local japi = require "jass.japi"

local manager = {}
local string = string
local math = math
local table = table

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
---@param object integer 被获取自定义值的对象: 单位 / 特效 / 触发器 / 物品
---@param type string 自定义值类型 - 单位, 整数, 实数, 真值, 特效, 字符串
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
---@param object integer 被设置自定义值的对象: 单位 / 特效 / 触发器 / 物品
---@param type string 自定义值类型: 单位, 整数, 实数, 字符串
---@param name string 自定义值名称
---@param value any 设置的值
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
	return v
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

---移除表中指定元素值和指定值相等的元素
---@param t table
---@param index any
---@param var string|number
---@return boolean
function manager:removeValue(t, index, var)
	local n = #t
	for i = 1, n do
		if t[i][var] == index then
			-- 将后面的元素依次前移
			for j = i, n - 1 do
				t[j] = t[j + 1]
			end
			t[n] = nil -- 移除最后一个元素
			return true -- 移除成功
		end
	end
	return false -- 没有找到目标值
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
		local mid = math.floor(left + (right - left) / 2)
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

return manager
-- #region 战斗力飙升 版1
-- 火焰序列帧图片
-- local icon = {}
-- for i = 1, 7 do
--     icon[i] = "FirstProject\\Strength\\Image " .. i .. ".blp"
-- end
-- -- 战力飙升图片
-- StrengthFont = gameui:builder 'image' { w = 120, h = 60, xy = { "中心", 100, 0 },
-- image = [[FirstProject\Strength\StrengthFont.tga]], alpha = 1 }
-- StrengthFont:set_point2("中心", 100, 440)

-- -- 火焰序列帧UI
-- Fire = StrengthFont:builder 'image' { w = 180, h = 220, xy = { "底部", StrengthFont, "底部", -7, -100 },
--     image = [[FirstProject\Strength\Image 1.blp]], alpha = 1 }

-- -- 战力飙升数字图片
-- local numberImage = {}
-- for i = 0, 12 do
--     numberImage[i] = "FirstProject\\Strength\\" .. i .. ".blp"
-- end

-- -- 战力飙升数字UI
-- Number = {}
-- Number[1] = StrengthFont:builder 'image' { w = 30, h = 50, xy = { "左侧", StrengthFont, "右侧", 0, 0 },
--     image = numberImage[0] }
-- for i = 2, 5 do
--     Number[i] = StrengthFont:builder 'image' { w = 30, h = 50, xy = { "左下", Number[i - 1], "右下", 0, 0 },
--         image = numberImage[i - 1], show = true }
-- end
-- for i = 1, 4 do
--     Number[i].right = Number[i + 1]
-- end

-- -- 战力数字变化
-- -- 10 - .  11 - 万  12 - 亿
-- function ValueToImage(startP, endP)
--     local lerp = { startP }
--     Lerp({ P = lerp, ty = "线性", t = 1.2, endP = { endP } })
--     FadePosition({
--         UI = Number[1],
--         fUI = StrengthFont,
--         time = 1.2,
--         startP = { 0, 30 },
--         endP = { 0, 0 },
--         anchor = { "左侧", "右侧" },
--         ty =
--         "二元出"
--     })
--     FadeSize({
--         UI = Number[1],
--         time = 1.2,
--         startP = { 60, 100 },
--         endP = { 30, 50 },
--         ty = "二元出",
--     })
--     local function Main(key)
--         local valueStr = NumToChinese(lerp[1])
--         local length = #valueStr
--         if #valueStr >= 6 then
--             length = length - 2
--         end
--         for i = 1, length do
--             if tonumber(valueStr:sub(i, i)) then
--                 local digit = tonumber(valueStr:sub(i, i))
--                 Number[i]:set_image(numberImage[digit])
--             elseif valueStr:sub(i, i + 3) == "万" then
--                 Number[i]:set_image(numberImage[11])
--             elseif valueStr:sub(i, i + 3) == "亿" then
--                 Number[i]:set_image(numberImage[12])
--             elseif valueStr:sub(i, i) == "." then
--                 Number[i]:set_image(numberImage[10])
--             end
--             Number[i]:set_show(true)
--         end
--         if length < 5 then
--             for i = 5, length + 1, -1 do
--                 Number[i]:set_show(false)
--             end
--         end
--         if lerp[1] == endP then
--             table.remove(UIFunc_Table, key)
--         end
--     end
--     table.insert(UIFunc_Table, Main)
-- end

-- -- 火焰序列帧
-- SequenceFrame({ image = icon, time = 0.07, UI = Fire, isLoop = true })

-- -- ValueToImage(1000, code.Unit_GetAttr(jass.udg_Hero[1], 1))
-- -- 战力数字变化
-- -- 参数分别为 0, 战力变化值
-- ValueToImage(0, 3000)

-- -- 战力数字下落
-- ac.time(1.5, 1, function()
--     FadePosition({ UI = StrengthFont, time = 1.5, startP = { 100, 440 }, endP = { 100, 340 }, ty = "二元出" })
--     FadeAlpha({ show = false, t = 1.5, UITab = { StrengthFont, Number[1], Number[2] } })
-- end)
-- #endregion


-- #region 战斗力飙升 版2 非人哉...!
-- 火焰序列帧图片
-- local icon = {}
-- for i = 1, 7 do
--     icon[i] = "FirstProject\\Strength\\Image " .. i .. ".blp"
-- end
-- -- 战力飙升图片
-- StrengthFont = gameui:builder 'image' { w = 120, h = 60, xy = { "中心", 100, 0 },
--     image = [[FirstProject\Strength\StrengthFont.tga]], alpha = 1 }
-- StrengthFont:set_point2("中心", 100, 440)

-- -- 火焰序列帧UI
-- Fire = StrengthFont:builder 'image' { w = 180, h = 220, xy = { "底部", StrengthFont, "底部", -7, -100 },
--     image = [[FirstProject\Strength\Image 1.blp]], alpha = 1 }
-- -- 视口
-- Strength = StrengthFont:builder 'panel' { w = 300, h = 500, xy = { '左侧', StrengthFont, "右侧", 0, 0 }, show = true }
-- japi.FrameSetViewPort(Strength.handle, true)

-- -- 战力飙升数字图片
-- local numberImage = {}
-- for i = 0, 12 do
--     numberImage[i] = "FirstProject\\Strength\\" .. i .. ".blp"
-- end

-- -- 战力飙升数字UI
-- Number = {}
-- for i = 1, 5 do
--     Number[i] = Strength:builder 'image' { w = 30, h = 50, xy = { "左侧", StrengthFont, "右侧", -30 + i * 30, 0 },
--         image = numberImage[0], show = true }
--     Number[i].index = 0
-- end

-- -- - 为战斗力倾情打造, 独属于你的战斗力函数, 速速过来体验吧! ✪ ω ✪
-- -- - target: 为存在表中的对应数字的图片
-- -- - UI: 修改图片
-- local function OnlyStrength(target, UI, time)
--     local num = target
--     local x, y = UI:get_xy()
--     local _, h = UI:get_wh()
--     FadePosition({
--         UI = UI,
--         fUI = StrengthFont,
--         anchor = { "左侧", "右侧" },
--         time = time,
--         ty = "线性",
--         startP = { UI:get_xy() },
--         endP = { x, y - 50 },
--         complete = function()
--             x, y = UI:get_xy()
--             if y < 0 then
--                 UI.index = UI.index + 1
--                 if UI.index == 13 then
--                     UI.index = 0
--                 end
--                 UI:set_image(numberImage[UI.index])
--                 UI:set_point("左侧", StrengthFont, "右侧", x, y + 100)
--                 OnlyStrength(num, UI, time)
--             end
--             if y == 0 then
--                 if UI.index ~= num then
--                     OnlyStrength(num, UI, time)
--                 end
--             end
--         end
--     })
-- end

-- -- 战力数字变化
-- -- 10 - .  11 - 万  12 - 亿
-- local function ValueToImage(value)
--     local valueStr = NumToChinese(value)
--     local length = #valueStr
--     local allT = 0.5
--     if #valueStr >= 6 then
--         length = length - 2
--     end
--     for i = 1, length do
--         local time
--         if tonumber(valueStr:sub(i, i)) then
--             local digit = tonumber(valueStr:sub(i, i))
--             if Number[i].index == digit then
--                 time = allT / (digit - Number[i].index + 13)
--             else
--                 time = allT / (digit - Number[i].index)
--             end
--             time = time - time % 0.01
--             OnlyStrength(digit, Number[i], time)
--         elseif valueStr:sub(i, i + 3) == "万" then
--             if Number[i].index == 11 then
--                 time = allT / (11 - Number[i].index + 13)
--             else
--                 time = allT / (11 - Number[i].index)
--             end
--             time = time - time % 0.01
--             OnlyStrength(11, Number[i], time)
--         elseif valueStr:sub(i, i + 3) == "亿" then
--             if Number[i].index == 12 then
--                 time = allT / (12 - Number[i].index + 13)
--             else
--                 time = allT / (12 - Number[i].index)
--             end
--             time = time - time % 0.01
--             OnlyStrength(12, Number[i], time)
--         elseif valueStr:sub(i, i) == "." then
--             if Number[i].index == 10 then
--                 time = allT / (10 - Number[i].index + 13)
--             else
--                 time = allT / (10 - Number[i].index)
--             end
--             time = time - time % 0.01
--             OnlyStrength(10, Number[i], time)
--         end
--         Number[i]:set_show(true)
--     end
--     if length < 5 then
--         for i = 5, length + 1, -1 do
--             Number[i]:set_show(false)
--         end
--     end
-- end


-- -- 火焰序列帧
-- SequenceFrame({ image = icon, time = 0.07, UI = Fire, isLoop = true })

-- -- ValueToImage(1000, code.Unit_GetAttr(jass.udg_Hero[1], 1))
-- -- 战力数字变化
-- -- 参数分别为 0, 战力变化值
-- ValueToImage(45000)

-- #endregion


-- #region 战斗力飙升 版2改良版 非人哉...!
-- -- 火焰序列帧图片
-- local icon = {}
-- for i = 1, 7 do
--     icon[i] = "FirstProject\\Strength\\Image " .. i .. ".blp"
-- end
-- -- 战力飙升图片
-- StrengthFont = gameui:builder 'image' { w = 120, h = 60, xy = { "中心", 100, 0 },
--     image = [[FirstProject\Strength\StrengthFont.tga]], alpha = 1 }
-- StrengthFont:set_point2("中心", 100, 440)
-- -- 火焰序列帧UI
-- Fire = StrengthFont:builder 'image' { w = 180, h = 220, xy = { "底部", StrengthFont, "底部", -7, -100 },
--     image = [[FirstProject\Strength\Image 1.blp]], alpha = 1 }
-- -- 视口
-- Strength = StrengthFont:builder 'panel' { w = 300, h = 50, xy = { '左侧', StrengthFont, "右侧", 0, 0 }, show = true }
-- japi.FrameSetViewPort(Strength.handle, true)
-- -- 战力飙升数字图片
-- local numberImage = {}
-- for i = 0, 12 do
--     numberImage[i] = "FirstProject\\Strength\\" .. i .. ".blp"
-- end
-- -- 战力飙升数字UI
-- Number_1 = {}
-- Number_2 = {}
-- for i = 1, 5 do
--     Number_1[i] = Strength:builder 'image' { w = 30, h = 50, xy = { "左侧", StrengthFont, "右侧", -30 + i * 30, 0 },
--         image = numberImage[0], show = true }
--     Number_1[i].index = 0

--     Number_2[i] = Strength:builder 'image' { w = 30, h = 50, xy = { "左侧", StrengthFont, "右侧", -30 + i * 30, 50 },
--         image = numberImage[1], show = true }
--     Number_2[i].index = 1
--     Number_2[i].next = Number_1[i]
--     Number_1[i].next = Number_2[i]
-- end
-- -- - 为战斗力倾情打造, 独属于你的战斗力函数, 速速过来体验吧! ✪ ω ✪
-- -- - target: 为存在表中的对应数字的图片
-- -- - UI: 修改图片
-- local function OnlyStrength(target, UI, time)
--     local num = target
--     local x, y = UI:get_xy()
--     FadePosition({
--         UI = UI,
--         fUI = StrengthFont,
--         anchor = { "左侧", "右侧" },
--         time = time,
--         ty = "线性",
--         startP = { UI:get_xy() },
--         endP = { x, y - 50 },
--         complete = function()
--             x, y = UI:get_xy()
--             if y < 0 then
--                 UI.index = UI.next.index + 1
--                 if UI.index == 13 then
--                     UI.index = 0
--                 end
--                 UI:set_image(numberImage[UI.index])
--                 UI:set_point("左侧", StrengthFont, "右侧", x, y + 100)
--                 x, y = UI.next:get_xy()
--                 if UI.next.index ~= num then
--                     OnlyStrength(num, UI, time)
--                 end
--             end
--             if y == 0 then
--                 x, y = UI.next:get_xy()
--                 if UI.index == num or (UI.next.index == num and y == 0) then
--                 else
--                     OnlyStrength(num, UI, time)
--                 end
--             end
--         end
--     })
-- end
-- -- 战力数字变化
-- -- 10 - .  11 - 万  12 - 亿
-- local function ValueToImage(value)
--     local valueStr = NumToChinese(value)
--     local length = #valueStr
--     -- 转到指定值所用时间
--     local allT = 0.5
--     if #valueStr >= 6 then
--         length = length - 2
--     end
--     for i = 1, length do
--         local time
--         if tonumber(valueStr:sub(i, i)) then
--             local digit = tonumber(valueStr:sub(i, i))
--             if Number_1[i].index == digit then
--                 time = allT / (digit - Number_1[i].index + 13)
--             else
--                 time = allT / (digit - Number_1[i].index)
--             end
--             time = time - time % 0.01
--             OnlyStrength(digit, Number_1[i], time)
--             OnlyStrength(digit, Number_2[i], time)
--         elseif valueStr:sub(i, i + 3) == "万" then
--             if Number_1[i].index == 11 then
--                 time = allT / (11 - Number_1[i].index + 13)
--             else
--                 time = allT / (11 - Number_1[i].index)
--             end
--             time = time - time % 0.01
--             OnlyStrength(11, Number_1[i], time)
--             OnlyStrength(11, Number_2[i], time)
--         elseif valueStr:sub(i, i + 3) == "亿" then
--             if Number_1[i].index == 12 then
--                 time = allT / (12 - Number_1[i].index + 13)
--             else
--                 time = allT / (12 - Number_1[i].index)
--             end
--             time = time - time % 0.01
--             OnlyStrength(12, Number_1[i], time)
--             OnlyStrength(12, Number_2[i], time)
--         elseif valueStr:sub(i, i) == "." then
--             if Number_1[i].index == 10 then
--                 time = allT / (10 - Number_1[i].index + 13)
--             else
--                 time = allT / (10 - Number_1[i].index)
--             end
--             time = time - time % 0.01
--             OnlyStrength(10, Number_1[i], time)
--             OnlyStrength(10, Number_2[i], time)
--         end
--         Number_1[i]:set_show(true)
--     end
--     if length < 5 then
--         for i = 5, length + 1, -1 do
--             Number_1[i]:set_show(false)
--         end
--     end
-- end
-- -- 火焰序列帧
-- SequenceFrame({ image = icon, time = 0.07, UI = Fire, isLoop = true })

-- -- 战力数字变化
-- ValueToImage(1000)
-- WaitToDo({
--     time = 0.5,
--     action = function()
--         ValueToImage(2345)
--     end
-- })

-- #endregion


-- #region 按钮从左到右, 淡入弹入
-- local test = {}
-- test["父控件"] = gameui:builder 'panel' { w = 1, h = 1, xy = { '中心', 0, 0 }, show = true }

-- test["背景"] = gameui:builder 'image' { w = 800, h = 500, xy = { "中心", 0, 100 }, image = [[UI\Widgets\ToolTips\Human\human-tooltip-background.blp]], alpha = 0.8 }
-- test["背景"]:set_point("中心", test["父控件"], "中心", 0, 100)
-- test["图标"] = {}

-- for i = 1, 5 do
--     test["图标"][i] = gameui:builder 'image' { w = 100, h = 50, xy = { "左上", test["背景"], "左上", -300, 30 - 80 * i }, image = [[1\1.1\SelSkBG.tga]], alpha = 0 }
--     if test["图标"][i - 1] then
--         test["图标"][i - 1].down = test["图标"][i]
--     end
-- end
-- local function MoreAction(UI)
--     if UI.down and not UI.isRun then
--         local x1, y1 = UI:get_xy()
--         local x2, y2 = UI.down:get_xy()
--         print(x1 - x2)
--         if x1 - x2 > 300 then
--             UI.isRun = true
--             FadeAlpha({ show = true, UI = UI.down })
--             FadePosition({
--                 UI = UI.down,
--                 fUI = test["背景"],
--                 time = 0.5,
--                 ty = "后退出",
--                 startP = { -300, y1 - 80 },
--                 endP = { 50, y1 - 80 },
--                 anchor = { "左上", "左上" },
--                 moreAction =
--                     MoreAction
--             })
--         end
--     end
-- end

-- FadeAlpha({ show = true, UI = test["图标"][1] })
-- FadePosition({
--     UI = test["图标"][1],
--     fUI = test["背景"],
--     time = 0.5,
--     ty = "后退出",
--     startP = { -660, -50 },
--     endP = { 50, -50 },
--     anchor = { "左上", "左上" },
--     moreAction = MoreAction
-- })
-- #endregion


-- #region 三选一从右到左, 依次弹入
-- local test = {}
-- test["父控件"] = gameui:builder 'panel' { w = 1, h = 1, xy = { '中心', 0, 0 }, show = true }
-- test["父控件"]:set_point2("中心", 0, 0)
-- test["图标"] = {}
-- test["文本"] = {}

-- for i = 1, 3 do
--     test["图标"][i] = gameui:builder 'image' { w = 180, h = 300, xy = { "中心", test["父控件"], "中心", 800, 600 }, image = [[1\1.1\SelSkBG.tga]], alpha = 0 }
--     test["文本"][i] = test["图标"][i]:builder 'text' { w = 80, h = 0, xy = { "中心", test["图标"][i], "中心", 0, 0 },
--         font = { [[fonts\fonts.ttf]], 30, align = '居中' } }
--     test["文本"][i]:set_text(i)
--     test["图标"][i].x = 400 + 300 * i
--     if test["图标"][i - 1] then
--         test["图标"][i - 1].right = test["图标"][i]
--     end
-- end

-- local function MoreAction(UI)
--     if UI.right and not UI.isRun then
--         if UI:get_alpha() > 0.6 then
--             UI.isRun = true
--             FadeAlpha({ show = true,t = 0.1, UI = UI.right })
--             FadePosition({
--                 UI = UI.right,
--                 fUI = test["父控件"],
--                 time = 0.5,
--                 ty = "二元出",
--                 startP = { 1800, 600 },
--                 endP = { UI.right.x, 600 },
--                 moreAction =
--                     MoreAction
--             })
--         end
--     end
-- end

-- FadeAlpha({ show = true, UI = test["图标"][1],t = 0.1})
-- FadePosition({
--     UI = test["图标"][1],
--     fUI = test["父控件"],
--     time = 0.5,
--     ty = "二元出",
--     startP = { 1800, 600 },
--     endP = { 700, 600 },
--     moreAction = MoreAction
-- })
-- #endregion
