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
local ghBuyCount = jass.udg_GamblingHouseBuyCount
local common = Module.Common

local GamblingHouse = {}
local gamblingHouse = {}
GamblingHouse.ui = gamblingHouse

gamblingHouse.panel = newUI:CreateUIAbsolute("panel", gameui, "中心", 1800, 305, 1, 1)
local size = 65
gamblingHouse.background = newUI:CreateUIRelative("image", gamblingHouse.panel, "中心", gamblingHouse.panel, "中心", 0, 0, size * 2, size, { image = [[Survival\UI\gamblingHouse.tga]] })
gamblingHouse.cdShadow = newUI:CreateUIRelative("image", gamblingHouse.background, "中心", gamblingHouse.background, "中心", 0, 0, size * 2, size,
	{ alpha = 0.5, image = [[UI\Widgets\ToolTips\Human\human-tooltip-background.blp]] })
gamblingHouse.showTime = newUI:CreateUIRelative("text", gamblingHouse.cdShadow, "中心", gamblingHouse.cdShadow, "中心", 0, 0, 100, 0, { font = font, fontSize = 25, align = "居中" })
gamblingHouse.leaveTime = newUI:CreateUIRelative("text", gamblingHouse.background, "底部", gamblingHouse.background, "顶部", 0, 5, 200, 0, { isShow = false, font = font, fontSize = 20, align = "居中" })
gamblingHouse.btn = newUI:CreateUIRelative("button", gamblingHouse.background, "中心", gamblingHouse.background, "中心", 0, 0, size * 2, size)
gamblingHouse.btn:event "进入" (function()
	local playerID = common:GetLocalPlayerID()
	tipDialogUp.icon:set_image(gamblingHouse.background.image)
	tipDialogUp.name:set_text("赌坊")
	tipDialogUp.intro:set_text("|cff00ffff类别 - 说明")
	local tip = "赌坊每隔一定时间开放一次，每次开放会随机一种资源，可消耗对应资源抽取更多资源，一段时间后赌坊会隐藏。"
	tipDialogUp.tips:set_text(tip)
	tipDialogUp.panel:reset_allpoint()
	tipDialogUp.panel:set_point("中心", gamblingHouse.btn, "右上", -10, 15)
	tipDialogUp.panel:set_show(true)
end)
gamblingHouse.btn:event "离开" (function()
	tipDialogUp.panel:set_show(false)
end)
gamblingHouse.btn:event "点击" (function()
	common:SendSync("SelectGamblingHouse")
end)

-- 设置黑市商品提示框
function code.SetGHSalesTip(playerID, salesID, index)
	-- 根据id确定类别,
	local typeName = "金币"
	if salesID == 6 then
		typeName = "杀敌"
	end
	if salesID == 7 then
		typeName = "钻石"
	end
	local consume = excel["其它"][salesID]["Value" .. index + 1]
	local tip = "消耗：" .. typeName .. "|cfaffff00" .. consume .. "|r"
	local min = math.floor(consume / 5)
	local max = consume * 5
	tip = tip .. "|n|n获得：" .. typeName .. "|cfaffff00" .. min .. "~" .. max .. "|r"
	tip = tip .. "|n|n购买次数：(" .. ghBuyCount[3 * (playerID - 1) + index] .. "/" .. excel["其它"][salesID]["Value5"] .. ")"
	return tip
end

function code.BuyGHSales(playerID, salesID, index)
	-- 随机资源并加上
	local consume = excel["其它"][salesID]["Value" .. index + 1]
	local rate = 100
	if consume < 500 then
		rate = 10
	end
	consume = consume / rate
	local min = math.floor(consume / 5)
	local max = consume * 5
	local pro = excel["其它"][salesID]["Value7"]
	local ranVal = rate * common:GetRandomInt(consume, max)
	if common:GetRandomInt(1, 100) <= pro then
		ranVal = rate * common:GetRandomInt(min, consume)
	end
	return ranVal
end

-- 赌坊持续时间
local duration = 120
-- 赌坊刷新时间
local refershTime = 360
-- 赌坊计时器
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
						-- manager:SetBMSalesID(i)
						-- 显示赌坊
						common:SetUnitShow(jass.udg_GamblingHouse[i], true)
						code.AddMessage(i, "赌坊已刷新!!!")
						local nameEffect = myFunc:GetCustomValue(jass.udg_GamblingHouse[i], "特效", "nameEffect")
						common:SetEffectShow(nameEffect, true)
					end
				end
				common:RunTrigger(jass.gg_trg_SetGHSales)
				timer = 0
				gamblingHouse.cdShadow:set_show(false)
				gamblingHouse.leaveTime:set_text("|cff00ffff" .. duration - timer .. "秒后离开")
				gamblingHouse.leaveTime:set_show(true)
			else
				gamblingHouse.showTime:set_text(refershTime - timer)
			end
			if refershTime - timer == 60 then
				for i = 1, 4 do
					if jass.udg_Hero[i] then
						code.AddMessage(i, "赌坊将在60秒后刷新!!!")
					end
				end
			end
		else
			if timer == duration then
				ty = 1
				for i = 1, 4 do
					if jass.udg_Hero[i] then
						-- 隐藏赌坊
						common:SetUnitShow(jass.udg_GamblingHouse[i], false)
						code.AddMessage(i, "赌坊已暂时关闭!!!")
						local nameEffect = myFunc:GetCustomValue(jass.udg_GamblingHouse[i], "特效", "nameEffect")
						common:SetEffectShow(nameEffect, false)
					end
				end
				timer = 0
				gamblingHouse.leaveTime:set_show(false)
				gamblingHouse.cdShadow:set_show(true)
				gamblingHouse.showTime:set_text(refershTime - timer)
			else
				gamblingHouse.leaveTime:set_text("|cff00ffff" .. duration - timer .. "秒后离开")
			end
			if duration - timer == 60 then
				for i = 1, 4 do
					if jass.udg_Hero[i] then
						code.AddMessage(i, "赌坊将在60秒后关闭!!!")
					end
				end
			end
		end
	end
end)


return GamblingHouse
