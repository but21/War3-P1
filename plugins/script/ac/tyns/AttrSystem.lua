local jass = Jass
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
	{ key = 1, value = "攻击" },
	{ key = 2, value = "生命" },
	{ key = 3, value = "护甲" },
	{ key = 4, value = "力量" },
	{ key = 5, value = "敏捷" },
	{ key = 6, value = "智力" },
	{ key = 7, value = "全属" },
	{ key = 8, value = "移动速度" },
	{ key = 9, value = "攻击速度%" },
	{ key = 10, value = "攻击间隔" },
	{ key = 11, value = "攻击射程" },
	{ key = 12, value = "多重数量" },
	{ key = 13, value = "多重几率%" },
	{ key = 14, value = "多重伤害系数" },
	{ key = 15, value = "技能急速" },
	{ key = 16, value = "魔法值" },
	{ key = 17, value = "物理固伤" },
	{ key = 18, value = "法术固伤" },
	{ key = 19, value = "固定生命" },

	-- 杀敌
	{ key = 21, value = "杀敌攻击" },
	{ key = 22, value = "杀敌护甲" },
	{ key = 23, value = "杀敌生命" },
	{ key = 24, value = "杀敌力量" },
	{ key = 25, value = "杀敌敏捷" },
	{ key = 26, value = "杀敌智力" },
	{ key = 27, value = "杀敌全属" },
	{ key = 28, value = "杀敌金币" },
	{ key = 29, value = "杀敌物理固伤" },
	{ key = 30, value = "杀敌法术固伤" },
	{ key = 31, value = "杀敌木材" },


	-- 每秒
	{ key = 41, value = "每秒攻击" },
	{ key = 42, value = "每秒护甲" },
	{ key = 43, value = "每秒生命" },
	{ key = 44, value = "每秒力量" },
	{ key = 45, value = "每秒敏捷" },
	{ key = 46, value = "每秒智力" },
	{ key = 47, value = "每秒全属" },
	{ key = 48, value = "每秒金币" },
	{ key = 49, value = "每秒杀敌" },
	{ key = 50, value = "每秒木材" },
	{ key = 51, value = "每秒物理固伤" },
	{ key = 52, value = "每秒法术固伤" },


	-- 加成
	{ key = 61, value = "攻击加成%" },
	{ key = 62, value = "护甲加成%" },
	{ key = 63, value = "生命加成%" },
	{ key = 64, value = "力量加成%" },
	{ key = 65, value = "敏捷加成%" },
	{ key = 66, value = "智力加成%" },
	{ key = 67, value = "金币加成%" },
	{ key = 68, value = "杀敌加成%" },
	{ key = 69, value = "木材加成%" },
	{ key = 70, value = "经验加成%" },
	{ key = 71, value = "全属性加成%" },

	-- 伤害
	{ key = 81, value = "攻击伤害%" },
	{ key = 82, value = "物理伤害%" },
	{ key = 83, value = "法术伤害%" },
	{ key = 84, value = "最终伤害%" },
	{ key = 85, value = "绝对伤害%" },
	{ key = 86, value = "攻击暴率%" },
	{ key = 87, value = "物理暴率%" },
	{ key = 88, value = "法术暴率%" },
	{ key = 89, value = "攻击暴伤%" },
	{ key = 90, value = "物理暴伤%" },
	{ key = 91, value = "法术暴伤%" },
	{ key = 92, value = "真实伤害%" },
	{ key = 93, value = "伤害增幅%" },
	{ key = 94, value = "技能伤害%" },
	{ key = 95, value = "暴击率%" },
	{ key = 96, value = "技能暴率%" },
	{ key = 97, value = "物理固伤增幅%" },
	{ key = 98, value = "法术固伤增幅%" },
	{ key = 99, value = "护甲穿透%" },
	{ key = 100, value = "护甲固穿%" },

	-- 生存
	{ key = 101, value = "每秒回血" },
	{ key = 102, value = "每秒百分比回血%" },
	{ key = 103, value = "攻击吸血" },
	{ key = 104, value = "技能吸血" },
	{ key = 105, value = "伤害减免%" },
	{ key = 106, value = "免伤几率%" },
	{ key = 107, value = "每秒回血加成%" },
	{ key = 108, value = "物理偷取%" },
	{ key = 109, value = "法术偷取%" },
	{ key = 110, value = "护甲减免上限%" },
	{ key = 111, value = "攻击闪避率%" },
	{ key = 112, value = "技能闪避率%" },
	{ key = 113, value = "承受伤害%" },

	-- 结算
	{ key = 121, value = "结算物理伤害%" },
	{ key = 122, value = "结算法术伤害%" },
	{ key = 123, value = "结算攻击伤害%" },
	{ key = 124, value = "结算物理暴伤%" },
	{ key = 125, value = "结算法术暴伤%" },
	{ key = 126, value = "结算攻击暴伤%" },
	{ key = 127, value = "结算多重伤害%" },
	{ key = 128, value = "结算真实伤害%" },
	{ key = 129, value = "结算技能急速" },
	{ key = 130, value = "结算力量卡牌伤害%" },
	{ key = 131, value = "结算敏捷卡牌伤害%" },
	{ key = 132, value = "结算智力卡牌伤害%" },
	{ key = 133, value = "结算力量英雄伤害%" },
	{ key = 134, value = "结算敏捷英雄伤害%" },
	{ key = 135, value = "结算智力英雄伤害%" },

	-- 面板
	{ key = 141, value = "面板攻击" },
	{ key = 142, value = "面板力量" },
	{ key = 143, value = "面板敏捷" },
	{ key = 144, value = "面板智力" },
	{ key = 145, value = "面板每秒回血" },
	{ key = 146, value = "面板物理固伤" },
	{ key = 147, value = "面板法术固伤" },

	-- 当前
	{ key = 161, value = "当前力量%" },
	{ key = 162, value = "当前敏捷%" },
	{ key = 163, value = "当前智力%" },
	{ key = 164, value = "当前物理伤害%" },
	{ key = 165, value = "当前法术伤害%" },
	{ key = 166, value = "当前攻击伤害%" },
	{ key = 167, value = "当前金币%" },
	{ key = 168, value = "当前杀敌%" },

	-- 伤害2
	{ key = 181, value = "卡牌伤害%" },
	{ key = 182, value = "力量系卡牌伤害%" },
	{ key = 183, value = "敏捷系卡牌伤害%" },
	{ key = 184, value = "智力系卡牌伤害%" },
	{ key = 185, value = "英雄伤害%" },
	{ key = 186, value = "力量系英雄伤害%" },
	{ key = 187, value = "敏捷系英雄伤害%" },
	{ key = 188, value = "智力系英雄伤害%" },
	{ key = 189, value = "对怪物增伤%" },
	{ key = 190, value = "对小怪增伤%" },
	{ key = 191, value = "对挑战怪增伤%" },
	{ key = 192, value = "对首领增伤%" },
	{ key = 193, value = "对玩家增伤%" },

	-- 攻击
	{ key = 201, value = "攻击力量" },
	{ key = 202, value = "攻击敏捷" },
	{ key = 203, value = "攻击智力" },
	{ key = 204, value = "攻击攻击" },
	{ key = 205, value = "攻击生命" },
	{ key = 206, value = "攻击物理固伤" },
	{ key = 207, value = "攻击法术固伤" },

	-- 被攻击
	{ key = 221, value = "被攻击力量" },
	{ key = 222, value = "被攻击敏捷" },
	{ key = 223, value = "被攻击智力" },
	{ key = 224, value = "被攻击攻击" },
	{ key = 225, value = "被攻击生命" },
	{ key = 226, value = "被攻击物理固伤" },
	{ key = 227, value = "被攻击法术固伤" },

	-- 升级
	{ key = 241, value = "升级攻击力量" },
	{ key = 242, value = "升级攻击敏捷" },
	{ key = 243, value = "升级攻击智力" },
	{ key = 244, value = "升级攻击攻击" },
	{ key = 245, value = "升级攻击生命" },
	{ key = 246, value = "升级攻击物理固伤" },
	{ key = 247, value = "升级攻击法术固伤" },
}

--- 所有属性类型  index - name
local AttrType_Table = {}

--- 所有属性类型(第二种存储方式) name - index
local AttrType_Table2 = {}

for _, value in pairs(attr_d) do
	AttrType_Table[value.key] = value.value
	AttrType_Table2[value.value] = value.key
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

---根据属性字符串添加单位属性 - lua (会触发t中事件)
---@param unit integer 单位
---@param operator integer +(0), -, =, *, /
---@param attrStr string 属性字符串
function manager:SetUnitAttrStr(unit, operator, attrStr)
	for attrName, attrValue in pairs(self:ParseAttributes2(attrStr)) do
		self:SetAttr(unit, attrName, operator, attrValue)
	end
end

--- 解析字符串, 获取其中的属性 - lua
---@param str string 需要解析的字符串
---@return table<string, number>  -- key: 属性名称, value: 属性数值
function manager:ParseAttributes2(str)
	local parsedAttributes = {}
	if not str then
		return parsedAttributes
	end
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
---@param operator integer +(0), -, =, *, /
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
