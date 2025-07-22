local code = require "jass.code"
local jass = require "jass.common"
local japi = require "jass.japi"

local Module = require "my_base.base_module_manager"
local newUI = Module.UICreate
local myFunc = Module.MyFunc
local font = "fonts\\LXWK_Bold.ttf"
local players = jass.udg_Player
local excel = excel
local tipDialogUp = Module.UITipDialog.tipDialogUp
local bmLv = jass.udg_BlackMarketLv
local bmSalesAmount = jass.udg_BlackMarketSalesAmount
local common = Module.Common

local BlackMarket = {}
local blackMarket = {}
BlackMarket.ui = blackMarket

-- [playerID][shopID] = buyCount
-- [playerID][shopLv][index] = id

-- 每个玩家当前黑市等级对应的商品品质概率
local qualityPro = {}
local qualityProID = 11
for playerID = 1, 4 do
	qualityPro[playerID] = {}
	qualityPro[playerID] = { excel["概率"][qualityProID]["概率1"], excel["概率"][qualityProID]["概率2"], excel["概率"][qualityProID]["概率3"], excel["概率"][qualityProID]["概率4"] }
end
-- 当前黑市商品id
local currentSalesID = {}
-- 每个玩家对应商品id的购买次数
local buyCount = {}
-- 每个玩家对应的不同等级的黑市可以刷出的商品id
local commodityID = {}
for playerID, _ in ipairs(players) do
	buyCount[playerID] = {}
	currentSalesID[playerID] = {}
	commodityID[playerID] = {}
	commodityID[playerID][1] = {}
	commodityID[playerID][2] = {}
	commodityID[playerID][3] = {}
	commodityID[playerID][4] = {}
	for shopID = 1, #excel["黑市"] do
		local commodityLv = excel["黑市"][shopID]["Quality"]
		local length = #commodityID[playerID][commodityLv] + 1
		commodityID[playerID][commodityLv][length] = shopID
	end
end


blackMarket.panel = newUI:CreateUIAbsolute("panel", gameui, "中心", 1620, 305, 1, 1)
local size = 65
blackMarket.background = newUI:CreateUIRelative("image", blackMarket.panel, "中心", blackMarket.panel, "中心", 0, 0, size * 2, size, { image = [[Survival\UI\BlackMarket\icon.tga]] })
blackMarket.cdShadow = newUI:CreateUIRelative("image", blackMarket.background, "中心", blackMarket.background, "中心", 0, 0, size * 2, size,
	{ alpha = 0.5, image = [[UI\Widgets\ToolTips\Human\human-tooltip-background.blp]] })
blackMarket.showTime = newUI:CreateUIRelative("text", blackMarket.cdShadow, "中心", blackMarket.cdShadow, "中心", 0, 0, 100, 0, { font = font, fontSize = 25, align = "居中" })
blackMarket.leaveTime = newUI:CreateUIRelative("text", blackMarket.background, "底部", blackMarket.background, "顶部", 0, 5, 200, 0, { isShow = false, font = font, fontSize = 20, align = "居中" })
blackMarket.btn = newUI:CreateUIRelative("button", blackMarket.background, "中心", blackMarket.background, "中心", 0, 0, size * 2, size)
blackMarket.btn:event "进入" (function()
	local playerID = common:GetLocalPlayerID()
	tipDialogUp.icon:set_image(blackMarket.background.image)
	tipDialogUp.name:set_text("黑市")
	tipDialogUp.intro:set_text("|cff00ffff类别 - 说明")
	local tip = "当前黑市等级：" .. bmLv[playerID] .. " (上限10级)"
	tip = tip .. "|n当前黑市出售数量：" .. bmSalesAmount[playerID]
	tip = tip .. "|n|n黑市每隔一定时间出现一次，并刷新其中的商品，一段时间后黑市会隐藏。|n|n黑市等级越高，黑市中刷出更稀有商品的概率越高。|n|n击杀Boss会提升1级黑市等级，黑市每提升2级，出售数量+1。"
	tip = myFunc:SetNumColor(tip, "|cfaffff00", "|r")
	tipDialogUp.tips:set_text(tip)
	tipDialogUp.panel:reset_allpoint()
	tipDialogUp.panel:set_point("中心", blackMarket.btn, "右上", -10, 15)
	tipDialogUp.panel:set_show(true)
end)
blackMarket.btn:event "离开" (function()
	tipDialogUp.panel:set_show(false)
end)
blackMarket.btn:event "点击" (function()
	common:SendSync("SelectBlackMarket", 0)
end)


-- 设置黑市商品id
function BlackMarket:SetBMSalesID(playerID)
	-- 根据黑市等级, 设置概率
	qualityProID = bmLv[playerID] + 10
	qualityPro[playerID] = { excel["概率"][qualityProID]["概率1"], excel["概率"][qualityProID]["概率2"], excel["概率"][qualityProID]["概率3"], excel["概率"][qualityProID]["概率4"] }
	currentSalesID[playerID] = {}
	local salesAmount = bmSalesAmount[playerID]
	local ownedSalesID = {}
	for _ = 1, salesAmount do
		local randomInt = common:GetRandomInt(1, 100)
		local quality = 1
		for i = 1, 4 do
			if randomInt <= qualityPro[playerID][i] then
				quality = i
				break
			end
		end
		-- 某个品质的商品数量不足的问题, 判断对应品质的商品数量是否大于0, <=0则随机品质
		-- 如果该品质商品已全部在本次黑市中出现, 则品质向后挪(挪3次), 直到找到未出现的商品, 否则则不去重
		local condition = true
		local loopCount = 0
		local ranID = commodityID[playerID][quality][common:GetRandomInt(1, #commodityID[playerID][quality])]
		if not ownedSalesID[ranID] then
			ownedSalesID[ranID] = true
			condition = false
		end
		while condition do
			loopCount = loopCount + 1
			ranID = commodityID[playerID][quality][common:GetRandomInt(1, #commodityID[playerID][quality])]
			if not ownedSalesID[ranID] then
				ownedSalesID[ranID] = true
				condition = false
			end
			if loopCount >= 10 then
				condition = false
				print("玩家黑市商品数量不足", quality, playerID)
			end
		end
		table.insert(currentSalesID[playerID], ranID)
	end
end

-- 获取黑市商品id
function code.GetBMSalesID(playerID, index)
	return currentSalesID[playerID][index]
end

-- 设置黑市商品提示框
function code.SetBMSalesTip(playerID, salesID)
	local tip = "消耗：金币|cfaffff00" .. excel["黑市"][salesID]["初始消耗"] .. "|r"
	tip = tip .. "|n|n获得：" .. excel["黑市"][salesID]["Tip"]
	tip = tip .. "|n|n购买次数：(" .. (buyCount[playerID][salesID] or 0) .. "/" .. excel["黑市"][salesID]["兑换上限"] .. ")"
	return tip
end

-- 玩家黑市等级提升
function code.BMLvUp(playerID)
	-- 获取最新等级, 重新设置概率	
	qualityProID = bmLv[playerID] + 10
	qualityPro[playerID] = { excel["概率"][qualityProID]["概率1"], excel["概率"][qualityProID]["概率2"], excel["概率"][qualityProID]["概率3"], excel["概率"][qualityProID]["概率4"] }
end

-- 获取某种商品的购买次数
function code.GetBMSalesBuyCount(playerID, salesID)
	return buyCount[playerID][salesID] or 0
end

-- 购买某种商品
function code.BuyBMSales(playerID, salesID)
	buyCount[playerID][salesID] = (buyCount[playerID][salesID] or 0) + 1
	local maxBuyCount = excel["黑市"][salesID]["兑换上限"]
	if buyCount[playerID][salesID] >= maxBuyCount then
		local lv = excel["黑市"][salesID]["Quality"]
		local index = myFunc:BinarySearch(commodityID[playerID][lv], salesID)
		table.remove(commodityID[playerID][lv], index)
	end
end

-- 一段时间后减少单位属性
function code.ReduceAttrAfterTime(hero, attrStr, time)
	ac.time(time, 1, function()
		code.ReduceUnitAttrStr(hero, attrStr)
	end)
end

-- 黑市持续时间
local duration = 60
-- 黑市刷新时间
local refershTime = 120
-- 黑市计时器
local timer = 0
-- 是刷新计时还是持续计时
local ty = 1
ac.time(1, function()
	if jass.udg_IsGameStart then
		timer = timer + 1
		if ty == 1 then
			if timer == refershTime then
				ty = 2
				for i = 1, 4 do
					if jass.udg_Hero[i] then
						BlackMarket:SetBMSalesID(i)
						-- 显示黑市
						common:SetUnitShow(jass.udg_BlackMarket[i], true)
						local nameEffect = myFunc:GetCustomValue(jass.udg_BlackMarket[i], "特效", "nameEffect")
						common:SetEffectShow(nameEffect, true)
						code.AddMessage(i, "黑市已刷新!!!")
					end
				end
				common:RunTrigger(jass.gg_trg_SetBMSales)
				timer = 0
				blackMarket.cdShadow:set_show(false)
				blackMarket.leaveTime:set_text("|cff00ffff" .. duration - timer .. "秒后离开")
				blackMarket.leaveTime:set_show(true)
			else
				blackMarket.showTime:set_text(refershTime - timer)
			end
			if refershTime - timer == 30 then
				for i = 1, 4 do
					if jass.udg_Hero[i] then
						code.AddMessage(i, "黑市将在30秒后刷新!!!")
					end
				end
			end
		else
			if timer == duration then
				ty = 1
				for i = 1, 4 do
					if jass.udg_Hero[i] then
						-- 隐藏黑市
						common:SetUnitShow(jass.udg_BlackMarket[i], false)
						code.AddMessage(i, "黑市已暂时关闭!!!")
						local nameEffect = myFunc:GetCustomValue(jass.udg_BlackMarket[i], "特效", "nameEffect")
						common:SetEffectShow(nameEffect, false)
					end
				end
				timer = 0
				blackMarket.leaveTime:set_show(false)
				blackMarket.cdShadow:set_show(true)
				blackMarket.showTime:set_text(refershTime - timer)
			else
				blackMarket.leaveTime:set_text("|cff00ffff" .. duration - timer .. "秒后离开")
			end
			if duration - timer == 30 then
				for i = 1, 4 do
					if jass.udg_Hero[i] then
						code.AddMessage(i, "黑市将在30秒后关闭!!!")
					end
				end
			end
		end
	end
end)

return BlackMarket
