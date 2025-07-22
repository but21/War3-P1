local jass = require 'jass.common'
local code = require 'jass.code'
local japi = require 'jass.japi'

local string = string
local table = table
local manager = {}

---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
--- 如果用纯lua作图最好重新写属性系统和事件系统, 因为现在的属性系统主要为T服务, 纯lua作图的话新的属性系统和事件系统比现在好用--------------------
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------

--- 之前的方式使用的属性表, 把自己的直接复制过来就行
local attr_d = {
	-- 基础属性
	{ key = "生命值", index = 1 },
	{ key = "护甲", index = 2 },
	{ key = "力量", index = 3 },
	{ key = "敏捷", index = 4 },
	{ key = "智力", index = 5 },
	{ key = "每秒回血", index = 6 },
	{ key = "生命百分比恢复%", index = 7 },
	{ key = "法力值", index = 8 },
	{ key = "法力回复", index = 9 },
	{ key = "攻击速度%", index = 10 },
	{ key = "攻击间隔", index = 11 },
	{ key = "攻击距离", index = 12 },
	{ key = "冷却急速", index = 13 },
	{ key = "持续时间%", index = 14 },
	{ key = "发射数量", index = 15 },
	{ key = "运气", index = 16 },
	{ key = "移动速度", index = 17 },
	{ key = "每秒金币", index = 18 },
	{ key = "攻击力", index = 19 },
	{ key = "伤害范围%", index = 20 },

	-- 杀敌属性
	{ key = "杀敌力量", index = 30 },
	{ key = "杀敌敏捷", index = 31 },
	{ key = "杀敌智力", index = 32 },
	{ key = "杀敌生命", index = 33 },

	-- 每秒属性
	{ key = "每秒力量", index = 40 },
	{ key = "每秒敏捷", index = 41 },
	{ key = "每秒智力", index = 42 },
	{ key = "每秒生命", index = 43 },
	{ key = "每秒护甲", index = 44 },

	-- 加成
	{ key = "生命加成%", index = 50 },
	{ key = "护甲加成%", index = 51 },
	{ key = "每秒回血加成%", index = 52 },
	{ key = "力量加成%", index = 53 },
	{ key = "敏捷加成%", index = 54 },
	{ key = "智力加成%", index = 55 },
	{ key = "经验加成%", index = 56 },
	{ key = "金币加成%", index = 57 },
	{ key = "杀敌加成%", index = 58 },
	{ key = "钻石加成%", index = 59 },
	{ key = "移速加成%", index = 60 },
	{ key = "攻击加成%", index = 61 },

	-- 伤害
	{ key = "伤害加深%", index = 70 },
	{ key = "最终伤害%", index = 71 },
	{ key = "物理伤害%", index = 72 },
	{ key = "法术伤害%", index = 73 },
	{ key = "真实伤害%", index = 74 },
	{ key = "物理暴击率%", index = 75 },
	{ key = "物理暴击伤害%", index = 76 },
	{ key = "法术暴击率%", index = 77 },
	{ key = "法术暴击伤害%", index = 78 },
	{ key = "伤害减免%", index = 79 },

	-- 结算
	{ key = "结算物理伤害", index = 90 },
	{ key = "结算法术伤害", index = 91 },
	{ key = "结算真实伤害", index = 92 },
	{ key = "结算物理暴伤", index = 93 },
	{ key = "结算法术暴伤", index = 94 },

	-- 面板
	{ key = "面板攻击", index = 100 },
	{ key = "面板力量", index = 101 },
	{ key = "面板敏捷", index = 102 },
	{ key = "面板智力", index = 103 },
	{ key = "面板每秒回血", index = 104 },

	-- 当前属性
	{ key = "当前力量%", index = 110 },
	{ key = "当前敏捷%", index = 111 },
	{ key = "当前智力%", index = 112 },
	{ key = "当前护甲%", index = 113 },
	{ key = "当前每秒回血%", index = 114 },
	{ key = "当前伤害范围%", index = 115 },
	{ key = "当前持续时间%", index = 116 },
	{ key = "当前生命%", index = 117 },
	{ key = "当前运气%", index = 118 },
	{ key = "当前每秒金币%", index = 119 }
}

--- 所有属性类型  index - name
local AttrType_Table = {}

--- 所有属性类型(第二种存储方式) name - index
local AttrType_Table2 = {}

for _, value in pairs(attr_d) do
	AttrType_Table[value.index] = value.key
	AttrType_Table2[value.key] = value.index
end

--- 全部属性的循环, 全部属性的数量, 为该功能创建的表
local AttrType_LoopTable = {}

--- 将所有的属性依次存入到表中, 用于实现全部属性的循环, 全部属性的数量
local t                  = {}
for keys, _ in pairs(AttrType_Table) do
	table.insert(t, keys)
end
table.sort(t)
-- 按照键的顺序遍历表
for _, value in ipairs(t) do
	table.insert(AttrType_LoopTable, value)
end

--- 存储对象属性类型值的表
manager.Attr_Table = {}

---  修改属性时对应的触发器
local AttrEventTrigger = {}

--- 属性单位
local AttrEventUnit = {}

--- 事件属性
local EventAttr = {}

--- 事件索引
local EventIndex = 0

-------------------------------  预处理 ~ lua函数 分割线 -------------------------------

--- 解析字符串, 获取其中的属性 - lua
---@param str string 需要解析的字符串
---@return table<string, number>  -- key: 属性名称, value: 属性数值
function manager:ParseAttributes2(str)
	local parsedAttributes = {}
	str = string.gsub(str, "|n", "\0")
	for part in string.gmatch(str, "[^\0]+") do
		-- 拆解属性
		local attrType, sign, attrValue = part:match("([^%+%-%%]+)([%+%-]?)(%d*%.?%d+[Ww万]?)%%?")
		-- print(attrType, sign, attrValue, str, part)
		if sign == "+" or sign == "-" then
			if sign == "-" then
				attrValue = "-" .. attrValue
			end
			if attrType and attrValue then
				if attrValue:match("[Ww万]") then
					attrValue = tonumber(attrValue:sub(1, -2)) * 10000
				end

				attrType = AttrType_Table[self:Str_GetAttr(attrType)]
				-- 在属性表中查找匹配的属性
				if AttrType_Table2[attrType] then
					parsedAttributes[attrType] = (parsedAttributes[attrType] or 0) + attrValue
				end
			end
		end
	end

	return parsedAttributes
end

---修改对象属性(lua, 会触发t中事件)
---@param handle integer
---@param attrName string -- 属性名称
---@param operator integer -- 运算符  (+, -, =, *, /)
---@param value number -- 修改值
function manager:SetAttr(handle, attrName, operator, value)
	self:SetObjAttrEx_Str(handle, attrName, operator, value)
	self:ChangeUnitAttrEvent_Response(handle, self:Str_GetAttr(attrName))
end

--- 修改对象属性(拓展) - lua
---@param id integer 属性对象索引 - (单位, 物品, 物品类型)
---@param attrType integer 属性类型
---@param operator integer 运算符  (+, -, =)
---@param value number 修改值
function manager:SetObjAttrEx(id, attrType, operator, value)
	if not manager.Attr_Table[id] then
		manager.Attr_Table[id] = {}
	end

	if not manager.Attr_Table[id][attrType] then
		manager.Attr_Table[id][attrType] = 0
	end
	-- +
	if operator == 0 then
		manager:SetObjAttr(id, attrType, manager.Attr_Table[id][attrType] + value)
	end
	-- -
	if operator == 1 then
		manager:SetObjAttr(id, attrType, manager.Attr_Table[id][attrType] - value)
	end

	-- =
	if operator == 2 then
		manager:SetObjAttr(id, attrType, value)
	end

	-- *
	if operator == 3 then
		manager:SetObjAttr(id, attrType, manager.Attr_Table[id][attrType] * value)
	end

	-- /
	if operator == 4 then
		manager:SetObjAttr(id, attrType, manager.Attr_Table[id][attrType] / value)
	end
end

--- 根据属性名称修改对象属性(拓展) - lua
---@param id integer 属性对象索引 - (单位, 物品, 物品类型)
---@param attrName string 属性类型
---@param operator integer 运算符  (+, -, =, *, /)
---@param value number 修改值
function manager:SetObjAttrEx_Str(id, attrName, operator, value)
	local attrType = manager:Str_GetAttr(attrName)
	manager:SetObjAttrEx(id, attrType, operator, value)
end

--- 修改对象属性 - lua
---@param id integer 属性对象索引 - (单位, 物品, 物品类型)
---@param attrType integer 属性类型
---@param value number 修改值
function manager:SetObjAttr(id, attrType, value)
	if not manager.Attr_Table[id] then
		manager.Attr_Table[id] = {}
	end

	manager.Attr_Table[id][attrType] = value
end

--- 根据属性名称修改对象属性 - lua
---@param id integer 属性对象索引 - (单位, 物品, 物品类型)
---@param attrName string 属性名称
---@param value number 修改值
function manager:SetObjAttr_Str(id, attrName, value)
	local attrType = manager:Str_GetAttr(attrName)
	manager:SetObjAttr(id, attrType, value)
end

--- 获取对象属性 - lua
---@param id integer 属性对象索引 - (单位, 物品, 物品类型)
---@param attrType integer 属性类型
function manager:GetObjAttr(id, attrType)
	return manager.Attr_Table[id] and manager.Attr_Table[id][attrType] or 0
end

--- 根据字符串获取对象属性 - lua
---@param id integer 属性对象索引 - (单位, 物品, 物品类型)
---@param str string 属性名称
---@return number -- 属性数值
function manager:GetObjAttrFromStr(id, str)
	local attrType = manager:Str_GetAttr(str)
	return manager:GetObjAttr(id, attrType)
end

---获取属性名称 - lua
---@param attrType integer 属性类型
---@return string  --返回值 - 属性名称
function manager:GetAttrName(attrType)
	return AttrType_Table[attrType] or "没有该属性类型"
end

--- 根据名称获取属性类型 - lua
---@param attrName string 属性名
---@return integer --属性类型索引
function manager:Str_GetAttr(attrName)
	return AttrType_Table2[attrName] or AttrType_Table2[attrName .. "%"] or AttrType_Table2[attrName:gsub("%%", "")] or 0
end

--- 解析字符串, 获取其中的属性 - lua
---@param str string 需要解析的字符串
---@param attributeTable any 属性表
---@return table  --返回解析出来的属性, 存成了一个表
function manager:ParseAttributes(str, attributeTable)
	attributeTable = attributeTable or AttrType_Table
	local parsedAttributes = {}
	local index = 1
	local attrTemp = ""
	str = string.gsub(str, "|n", "\0")
	for part in string.gmatch(str, "[^\0]+") do
		-- 拆解属性
		local attrType, sign, attrValue = part:match("([^%+%-%%]+)([%+%-]?)(%d*%.?%d+[Ww万]?)%%?")
		-- print(attrType, sign, attrValue, str, part)
		if sign == "+" or sign == "-" then
			if sign == "-" then
				attrValue = "-" .. attrValue
			end
			if attrType and attrValue then
				if attrValue:match("[Ww万]") then
					attrValue = tonumber(attrValue:sub(1, -2)) * 10000
				end
				-- 当从复杂字符串中提取属性时使用
				-- if attrType then
				-- 	for attrIndex, attr in pairs(attributeTable) do
				-- 		local originAttr = attr
				-- 		if manager:AttrIsPercent(attrIndex) then
				-- 			attr = attr:sub(1, -2)
				-- 		end
				-- 		if string.find(attrType, attr) then
				-- 			if #attrTemp < #originAttr then
				-- 				attrTemp = originAttr
				-- 			end
				-- 		end
				-- 	end
				-- 	attrType = attrTemp
				-- 	attrTemp = ""
				-- end
				attrType = AttrType_Table[self:Str_GetAttr(attrType)]
				-- 在属性表中查找匹配的属性
				if AttrType_Table2[attrType] then
					parsedAttributes[index] = { attr = AttrType_Table2[attrType], value = attrValue }
					index = index + 1
				end
			end
		end
	end

	return parsedAttributes
end

---响应修改属性事件 - lua   主要用于T里面的事件, 如果用lua的话最好写一套事件系统
---@param unit any 修改属性的单位
---@param attrType any 被修改的属性
function manager:ChangeUnitAttrEvent_Response(unit, attrType)
	if AttrEventTrigger[attrType] then
		local isActive = false
		for i = 1, AttrEventTrigger[attrType].count do
			if jass.IsTriggerEnabled(AttrEventTrigger[attrType][i]) then
				isActive = true
			end
		end
		if isActive then
			EventIndex = EventIndex + 1
			AttrEventUnit[EventIndex] = unit
			EventAttr[EventIndex] = attrType
			for i = 1, AttrEventTrigger[attrType].count do
				if jass.IsTriggerEnabled(AttrEventTrigger[attrType][i]) then
					code.ConditionalTriggerExecute(AttrEventTrigger[attrType][i])
				end
			end
			EventIndex = EventIndex - 1
		end
	end
end

--- 判断某个属性是否是百分比 - lua
--- @param attr  integer 属性
---@return boolean -- 是百分比则返回true
function manager:AttrIsPercent(attr)
	local bool = false
	if AttrType_Table[attr] then
		bool = AttrType_Table[attr]:sub(-1) == "%"
	end
	return bool
end

--#region  lua ~ jass 分割线


--#region  修改单位属性

---修改单位属性(拓展) - jass
---@param obj any 单位
---@param attrType integer 属性类型
---@param operator integer 运算符  (+, -, =)
---@param value number 修改值
function code.Unit_SetAttrBJ(obj, attrType, operator, value)
	local id = jass.GetHandleId(obj)
	manager:SetObjAttrEx(id, attrType, operator, value)
	manager:ChangeUnitAttrEvent_Response(obj, attrType)
end

---根据属性名称设置单位属性(拓展) - jass
---@param obj any 单位
---@param attrName string 属性名称
---@param operator integer 运算符  (+, -, =)
---@param value number 修改值
function code.SetUnitAttr_Ex_Str(obj, attrName, operator, value)
	local id = jass.GetHandleId(obj)
	manager:SetObjAttrEx_Str(id, attrName, operator, value)
	manager:ChangeUnitAttrEvent_Response(obj, manager:Str_GetAttr(attrName))
end

---修改单位属性 - jass
---@param obj any 单位
---@param attrType integer 属性类型
---@param value number 修改值
function code.Unit_SetAttr(obj, attrType, value)
	local id = jass.GetHandleId(obj)
	manager:SetObjAttr(id, attrType, value)
	manager:ChangeUnitAttrEvent_Response(obj, attrType)
end

---根据属性名称设置单位属性 - jass
---@param obj any 单位
---@param attrName string 属性名称
---@param value number 修改值
function code.SetUnitAttr_Str(obj, attrName, value)
	local id = jass.GetHandleId(obj)
	manager:SetObjAttr_Str(id, attrName, value)
	manager:ChangeUnitAttrEvent_Response(obj, manager:Str_GetAttr(attrName))
end

---根据属性字符串添加单位属性 - jass
---@param unit integer
---@param attrStr string
function code.AddUnitAttrStr(unit, attrStr)
	local attrT = manager:ParseAttributes(attrStr)
	for key, value in ipairs(attrT) do
		code.Unit_SetAttrBJ(unit, value.attr, 0, value.value)
	end
end

---根据属性字符串减少单位属性 - jass
---@param unit any
---@param attrStr any
function code.ReduceUnitAttrStr(unit, attrStr)
	local attrT = manager:ParseAttributes(attrStr)
	for key, value in ipairs(attrT) do
		code.Unit_SetAttrBJ(unit, value.attr, 1, value.value)
	end
end

---根据属性字符串设置单位属性 - jass
---@param unit any
---@param attrStr any
function code.SetUnitAttrStr(unit, attrStr)
	local attrT = manager:ParseAttributes(attrStr)
	for key, value in ipairs(attrT) do
		code.Unit_SetAttrBJ(unit, value.attr, 2, value.value)
	end
end

--#endregion

--#region  修改物品属性

---修改物品属性(拓展) - jass
---@param obj any 物品
---@param attrType integer 属性类型
---@param operator integer 运算符  (+, -, =)
---@param value number 修改值
function code.SetItemAttrEx(obj, attrType, operator, value)
	local id = jass.GetHandleId(obj)
	manager:SetObjAttrEx(id, attrType, operator, value)
end

---根据属性名称修改物品属性(拓展) - jass
---@param obj any 物品
---@param attrName string 属性名称
---@param operator integer 运算符  (+, -, =)
---@param value number 修改值
function code.SetItemAttrEx_Str(obj, attrName, operator, value)
	local id = jass.GetHandleId(obj)
	manager:SetObjAttrEx_Str(id, attrName, operator, value)
end

---修改物品属性 - jass
---@param obj any 物品
---@param attrType integer 属性类型
---@param value number 修改值
function code.SetItemAttr(obj, attrType, value)
	local id = jass.GetHandleId(obj)
	manager:SetObjAttr(id, attrType, value)
end

---根据属性名称修改物品属性 - jass
---@param obj any 物品
---@param attrName string 属性名称
---@param value number 修改值
function code.SetItemAttr_Str(obj, attrName, value)
	local id = jass.GetHandleId(obj)
	manager:SetObjAttr_Str(id, attrName, value)
end

--#endregion

--#region  修改物品类型属性

---修改物品类型属性(拓展) - jass
---@param obj any 物品类型
---@param attrType integer 属性类型
---@param operator integer 运算符  (+, -, =)
---@param value number 修改值
function code.SetItemTypeAttrEx(obj, attrType, operator, value)
	-- local id = jass.GetHandleId(obj)
	local id = obj
	manager:SetObjAttrEx(id, attrType, operator, value)
end

---根据属性名称修改物品类型属性(拓展) - jass
---@param obj any 物品类型
---@param attrName string 属性名称
---@param operator integer 运算符  (+, -, =)
---@param value number 修改值
function code.SetItemTypeAttrEx_Str(obj, attrName, operator, value)
	local id = obj
	manager:SetObjAttrEx_Str(id, attrName, operator, value)
end

---修改物品类型属性 - jass
---@param obj any 物品类型
---@param attrType integer 属性类型
---@param value number 修改值
function code.Itemtype_SetAttr(obj, attrType, value)
	local id = jass.GetHandleId(obj)
	manager:SetObjAttr(id, attrType, value)
end

---根据属性名称修改物品类型属性 - jass
---@param obj any 物品类型
---@param attrName string 属性名称
---@param value number 修改值
function code.Itemtype_SetAttr_Str(obj, attrName, value)
	local id = jass.GetHandleId(obj)
	manager:SetObjAttr_Str(id, attrName, value)
end

--#endregion

--#region  获取属性

---获取单位属性 - jass
---@param obj any 单位
---@param attrType integer 属性类型
---@return number -- 返回一个实数
function code.Unit_GetAttr(obj, attrType)
	return manager:GetObjAttr(jass.GetHandleId(obj), attrType) or 0
end

---获取物品属性 - jass
---@param obj any 物品
---@param attrType integer 属性类型
---@return number -- 返回一个实数
function code.Item_GetAttr(obj, attrType)
	return manager:GetObjAttr(jass.GetHandleId(obj), attrType) or 0
end

---获取物品类型属性 - jass
---@param obj any 物品类型
---@param attrType integer 属性类型
---@return number -- 返回一个实数
function code.Itemtype_GetAttr(obj, attrType)
	return manager:GetObjAttr(obj, attrType) or 0
end

---根据属性名称获取单位对应属性类型的的属性数值 - jass
---@param attrName string 属性字符串
---@param obj any 单位
function code.GetUnitAttrFromStr(attrName, obj)
	return manager:GetObjAttrFromStr(jass.GetHandleId(obj), attrName)
end

---根据属性名称获取物品对应属性类型的的属性数值 - jass
---@param attrName string 属性字符串
---@param obj any 物品
function code.GetItemAttrFromStr(attrName, obj)
	return manager:GetObjAttrFromStr(jass.GetHandleId(obj), attrName)
end

---根据属性名称获取物品对应属性类型的的属性数值 - jass
---@param attrName string 属性字符串
---@param obj any 物品类型
function code.GetItemTypeAttrFromStr(attrName, obj)
	return manager:GetObjAttrFromStr(jass.GetHandleId(obj), attrName)
end

--#endregion



---获取属性名称 - jass
---@param attrType integer
---@return string --返回值 - 属性名称
function code.Attr_GetName(attrType)
	return manager:GetAttrName(attrType):gsub("%%", "") or "没有该属性类型"
end

--#region  返回属性类型

---转换整数为属性 - jass
---@param index integer 进行转换的整数
---@return number --返回值 - 属性类型
function code.Attr_I2A(index)
	return index or 0
end

---全部属性的循环 - jass
---@param index integer 索引
function code.AllAttr_GetFor(index)
	return AttrType_LoopTable[index] or 0
end

---字符串转属性, 指定索引的属性类型 - jass
---@param str string 进行转换的字符串
---@param index integer 指定索引
---@return integer -- 属性类型
function code.TipsToIndexAttrType(str, index)
	return manager:ParseAttributes(str, AttrType_Table)[index] and manager:ParseAttributes(str, AttrType_Table)[index].attr or 0
	-- return ParseAttributes(str, AttrType_Table)[index] and ParseAttributes(str, AttrType_Table)[index].attr or 0
end

---根据属性名称获取属性类型 - jass
---@param attrName string 属性名
---@return integer --属性类型索引
function code.Str_GetAttr(attrName)
	return manager:Str_GetAttr(attrName) or 0
end

--#endregion

--#region  返回整数 / 实数

---返回属性表中全部属性的数量 - jass
---@return integer
function code.AllAttr_GetNum()
	return #AttrType_LoopTable
end

---返回字符串中属性的数量 - jass
---@param str string
---@return integer -- 属性数量
function code.TipsToIndexAttrNum(str)
	return #manager:ParseAttributes(str, AttrType_Table)
end

---返回字符串中指定索引的属性数值 - jass
---@param str string 目标字符串
---@param index integer 指定索引
---@return number -- 属性数值
function code.TipsToIndexAttrVal(str, index)
	return manager:ParseAttributes(str, AttrType_Table)[index] and tonumber(manager:ParseAttributes(str, AttrType_Table)[index].value) or 0.0
	-- return ParseAttributes(str, AttrType_Table)[index] and tonumber(ParseAttributes(str, AttrType_Table)[index].value) or 0.0
end

---转换属性为整数 - jass
---@param attr integer 进行转换的属性
---@return number --返回值 - 整数
function code.Attr_A2I(attr)
	return attr
end

--#endregion

--#region  修改属性事件相关

---修改单位属性事件 - jass
---@param trig any 事件对应的触发器
---@param attr integer 被修改的属性
function code.Unit_AttrEvent(trig, attr)
	if not AttrEventTrigger[attr] then
		AttrEventTrigger[attr] = {}
	end
	if not AttrEventTrigger[attr].count then
		AttrEventTrigger[attr].count = 0
	end
	if trig then
		AttrEventTrigger[attr].count = AttrEventTrigger[attr].count + 1
		AttrEventTrigger[attr][AttrEventTrigger[attr].count] = trig
	end
end

---获取属性单位 - jass
---@return any -- 返回属性单位
function code.Unit_AttrEvent_GetUnit()
	return AttrEventUnit[EventIndex]
end

---获取事件属性 - jass
---@return any -- 返回事件属性
function code.Unit_AttrEvent_GetAttr()
	return EventAttr[EventIndex]
end

--#endregion

---判断属性是否是百分比
---@param attrType integer
---@return boolean -- 是百分比则为true
function code.Attr_IsBaiFen(attrType)
	return manager:AttrIsPercent(attrType)
end

-- #endregion


return manager
