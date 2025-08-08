local code = require "jass.code"
local jass = require "jass.common"
local japi = require "jass.japi"

local Module = require "my_base.base_module_manager"
local myFunc = Module.MyFunc
local font = "fonts\\LXWK_Bold.ttf"
local players = jass.udg_Player
local excel = Module.Excel
local bmSalesAmount = jass.udg_BlackMarketSalesAmount
local common = Module.Common
local math = math
local table = table

local BlackMarket = {}
local ui = {}
BlackMarket.ui = ui

---@class WeightedItemPicker
local WeightedItemPicker = {}
WeightedItemPicker.__index = WeightedItemPicker

function WeightedItemPicker.new()
	---@class WeightedItemPicker
	local self = setmetatable({}, WeightedItemPicker)

	self.tempPool = {}
	self.pickedItems = {}
	self.purchaseCounts = {}
	self.lastPickedIds = {}
	self.allItems = {}
	for id, item in ipairs(excel["黑市"]) do
		local newItem = {
			id = id,
			weight = item.Weight,
		}
		table.insert(self.allItems, newItem)
	end

	return self
end

function WeightedItemPicker:draw(n)
	local tempPool = self.tempPool
	local pickedItems = self.pickedItems
	myFunc:ClearTable(tempPool)
	myFunc:ClearTable(pickedItems)

	local sourcePool

	if myFunc:GetTableLength(self.lastPickedIds) > 0 then
		for _, item in ipairs(self.allItems) do
			if not self.lastPickedIds[item.id] then
				table.insert(tempPool, item)
			end
		end
		if #tempPool >= n then
			sourcePool = tempPool
		else
			sourcePool = self.allItems
		end
	else
		sourcePool = self.allItems
	end

	local finalItemCount = math.min(n, #sourcePool)

	for _, item in ipairs(sourcePool) do
		local key = common:GetRandomReal(0, 1) ^ (1 / item.weight)
		table.insert(pickedItems, { id = item.id, key = key })
	end

	table.sort(pickedItems, function(a, b) return a.key > b.key end)

	local finalPickedIds = {}
	myFunc:ClearTable(self.lastPickedIds)

	for i = 1, finalItemCount do
		local pickedId = pickedItems[i].id
		table.insert(finalPickedIds, pickedId)
		self.lastPickedIds[pickedId] = true
	end
	return finalPickedIds
end

function WeightedItemPicker:recordPurchase(itemId)
	local newCount = (self.purchaseCounts[itemId] or 0) + 1
	self.purchaseCounts[itemId] = newCount

	print(string.format("商品 '%s' 已被购买, 当前购买次数: %d", tostring(itemId), newCount))

	local limit = excel["黑市"][itemId].Limit
	if limit and newCount >= limit then
		print(string.format("商品 '%s' 已达到购买上限，将从奖池中移除。", tostring(itemId)))
		for i = #self.allItems, 1, -1 do
			if self.allItems[i].id == itemId then
				table.remove(self.allItems, i)
				break
			end
		end
	end
end

-- 当前黑市商品id
local currentSalesID = {}
---@type table<number, WeightedItemPicker>
local weightedPicker = {}
for playerID, _ in ipairs(players) do
	currentSalesID[playerID] = {}
	weightedPicker[playerID] = WeightedItemPicker.new()
end

-- 设置黑市商品id
function BlackMarket:SetBMSalesID(playerID)
	if bmSalesAmount[playerID] > 8 then
		bmSalesAmount[playerID] = 8
	end
	currentSalesID[playerID] = weightedPicker[playerID]:draw(bmSalesAmount[playerID])
end

-- 获取黑市商品id
function code.GetBMSalesID(playerID, index)
	return currentSalesID[playerID][index]
end

-- 设置黑市商品提示框
function code.SetBMSalesTip(playerID, salesID)
	local tip = "消耗：杀敌 " .. excel["黑市"][salesID]["初始消耗"] + excel["黑市"][salesID]["递增消耗"] * (weightedPicker[playerID].purchaseCounts[salesID] or 0)
	tip = tip .. "|n|n效果：" .. excel["黑市"][salesID]["Tip"]
	tip = tip .. "|n|n购买次数：(" .. (weightedPicker[playerID].purchaseCounts[salesID] or 0) .. "/" .. excel["黑市"][salesID]["Limit"] .. ")"
	return tip
end

-- 获取某种商品的购买次数
function code.GetBMSalesBuyCount(playerID, salesID)
	return weightedPicker[playerID].purchaseCounts[salesID] or 0
end

-- 购买某种商品
function code.BuyBMSales(playerID, salesID)
	weightedPicker[playerID]:recordPurchase(salesID)
end

function code.SetBMSales(playerID)
	BlackMarket:SetBMSalesID(playerID)
	common:RunTrigger(jass.gg_trg_SetBMSales)
end

return BlackMarket
