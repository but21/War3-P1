print("\n------------------lua - debug------------------")


--[[
    (只有副职业为换装备的玩家才能进行抽奖, 其他玩家只能继续叠层数, 且没有额外奖励)

    特殊字符:    ※    ★

    颜色字符串:	|cff00f5a4	|cfff43232	|cff00f51d	|cff00acf5	|cffc400f5 |cff04ffee |cffff8604
				|cff11924b |cffacb71a |cffaaaaaa  |cffdfc497
				
    装备技能颜色:|cffffffff  |cff00ff00	|cff00ffff	|cffd400ff	|cffff0000	|cfaffff00

    装备品质: 破旧, 普通, 优秀, 秘银, 精金, 陨铁, 星云, 龙骨, 永恒

    技能品质: 基础, 精通, 奥术, 秘传, 龙语, 神圣, 禁忌
]]
-- 取余(实数)


-- 文件名用小写加下划线（如 attr_system.lua）。
-- 全局变量(少用), 函数和模块名用驼峰式（如 AttrSystem）。
-- 局部变量用小写驼峰式，私有加下划线前缀（如 _privateFunc）。
-- 常量全大写加下划线（如 MAX_LEVEL）。
-- 模块引用使用小写驼峰式局部变量


-- (100 / (100 + 技能急速))


--[[
    WeightedItemPicker 模块 v4 (最终性能优化版)
    作者: Gemini
    功能:
    1. 表重用: 最大限度减少内存分配和GC压力。
    2. 动态移除: 商品达到购买上限后，将从抽奖池中彻底移除，优化后续抽取性能。
    3. 逻辑分离: 抽取(draw)和购买(recordPurchase)行为分离。
    4. 刷新不重复: 刷新时，展示的商品不与上一次重复。
]]

local WeightedItemPicker = {}
WeightedItemPicker.__index = WeightedItemPicker

-- 内部辅助函数: 清空表 (如果你的环境有 table.wipe, 它是更好的选择)
local function clearTable(t)
	for k in pairs(t) do
		t[k] = nil
	end
end

local function GetLength(t)
	local count = 0
	for _ in pairs(t) do
		count = count + 1
	end
	return count
end

-- 构造函数
function WeightedItemPicker.new(items)
	local self = setmetatable({}, WeightedItemPicker)

	-- 存储原始配置，用于重置
	self.originalItems = items

	-- [优化] 预先分配可重用的表，避免在draw函数中重复创建
	self.tempPool = {}
	self.pickedItems = {}

	-- 调用重置函数来初始化所有状态
	-- self:reset()

	-- 1. 重置购买计数
	self.purchaseCounts = {}

	-- 2. 重置上次抽中的ID记录
	self.lastPickedIds = {}

	-- 3. 从原始备份中恢复所有商品
	self.allItems = {}
	self.itemMap = {} -- [优化] 用于O(1)查找的映射表

	for _, item in ipairs(self.originalItems) do
		-- 深拷贝，以防原始数据被意外修改
		local newItem = {
			id = item.id,
			weight = item.weight,
			limit = item.limit
		}
		table.insert(self.allItems, newItem)
		self.itemMap[item.id] = newItem
	end

	return self
end

-- 核心抽取/展示函数 (已优化)
function WeightedItemPicker:draw(n)
	-- [优化] 从 self 中获取可重用的表，并清空它们
	local tempPool = self.tempPool
	local pickedItems = self.pickedItems
	clearTable(tempPool)
	clearTable(pickedItems)

	-- 1. 确定源商品池
	local sourcePool

	-- 2. 应用“刷新不重复”逻辑
	-- 从当前可用的 allItems 中，过滤掉上一轮展示过的
	if GetLength(self.lastPickedIds) > 0 then
		for _, item in ipairs(self.allItems) do
			if not self.lastPickedIds[item.id] then
				table.insert(tempPool, item)
			end
		end
		-- 如果过滤后的池子足够大，就用它；否则放宽限制，用全部可用的商品
		if #tempPool >= n then
			sourcePool = tempPool
		else
			sourcePool = self.allItems
		end
	else
		sourcePool = self.allItems
	end

	local finalItemCount = math.min(n, #sourcePool)

	-- 3. 使用 A-Res 算法进行带权随机抽样
	for _, item in ipairs(sourcePool) do
		local key = math.random() ^ (1 / item.weight)
		table.insert(pickedItems, { id = item.id, key = key })
	end

	table.sort(pickedItems, function(a, b) return a.key > b.key end)

	-- 4. 准备最终结果，并更新“上一次展示”的记录
	local finalPickedIds = {}
	self.lastPickedIds = {} -- 清空上次记录

	for i = 1, finalItemCount do
		local pickedId = pickedItems[i].id
		table.insert(finalPickedIds, pickedId)
		self.lastPickedIds[pickedId] = true
	end
	return finalPickedIds
end

-- 记录购买行为 (已优化，包含移除逻辑)
function WeightedItemPicker:recordPurchase(itemId)
	-- [优化] O(1) 复杂度快速查找商品信息
	local itemData = self.itemMap[itemId]
	if not itemData then
		-- 即使商品已售罄从 allItems 中移除，itemMap 中可能还保留记录，所以这里检查是安全的
		print(string.format("警告: 尝试购买一个不存在或已售罄的商品ID: %s", tostring(itemId)))
		return
	end

	-- 更新购买计数
	local newCount = (self.purchaseCounts[itemId] or 0) + 1
	self.purchaseCounts[itemId] = newCount

	print(string.format("商品 '%s' 已被购买, 当前购买次数: %d", tostring(itemId), newCount))

	-- [核心优化] 如果达到购买上限，则从 allItems 中彻底移除该商品
	if itemData.limit and newCount >= itemData.limit then
		print(string.format("商品 '%s' 已达到购买上限，将从奖池中移除。", tostring(itemId)))
		-- 从后往前遍历以安全地移除元素
		for i = #self.allItems, 1, -1 do
			if self.allItems[i].id == itemId then
				table.remove(self.allItems, i)
				-- 无需再操作 itemMap，因为下次重置时会重建
				break -- 找到并移除后即可退出循环
			end
		end
	end
end

-- 商品数据，item_K 只能买1次
local allProducts = {
	{ id = 1, weight = 100 },
	{ id = 2, weight = 100 },
	{ id = 3, weight = 50 },
	{ id = 4, weight = 10, limit = 1 } -- 稀有，限购1次
}

-- 1. 创建商店实例
local blackMarket = WeightedItemPicker.new(allProducts)


local shops = blackMarket:draw(2)
for index, value in ipairs(shops) do
	print(index, value)
end
blackMarket:recordPurchase(shops[1])
blackMarket:recordPurchase(shops[2])

shops = blackMarket:draw(2)
for index, value in ipairs(shops) do
	print(index, value)
end
blackMarket:recordPurchase(shops[1])
blackMarket:recordPurchase(shops[2])

shops = blackMarket:draw(2)
for index, value in ipairs(shops) do
	print(index, value)
end
blackMarket:recordPurchase(shops[1])
blackMarket:recordPurchase(shops[2])
-- return WeightedItemPicker
