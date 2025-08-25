local code = require 'jass.code'
local jass = require 'jass.common'
local japi = require 'jass.japi'

local UIModule = require "my_ui.ui_module_manager"
local Module = require "my_base.base_module_manager"
local common = Module.Common
local myFunc = Module.MyFunc
local RefineEquipUI = Module.UITipDialog.RefineEquipUI
local attrSystem = Module.AttrSystem
local excel = excel
local archive = Module.Archive

-- local weapon = require "my_ui.ui_weapon"
-- local accessory = require "my_ui.ui_accessory"

print("\ndebug...\n")
-- local weaponID = weapon:GetWeapon(1)
-- local accessoryID = accessory:GetAccessory(1)
if common:IsLocalPlayer(common.Player[1]) then
	-- common:SendSync("GetAccessory", 13)

	-- 超限, 武器9级后把weaponID改成武器ID即可
	-- common:SendSync("GetWeapon", 16)
end
-- print(common:GetUnitState(jass.udg_Hero[1], "攻击距离"))
-- archive:SaveInt(1, "treasureHuntP", 100000)
-- archive:SaveInt(1, "heroExp", 10000)
-- archive:SaveInt(1, "summerTimeP", 5)
-- jass.udg_IsGameStart = true
-- 挑战时间
-- common:SaveInteger(jass.udg_HTChallenge[1], 1, 3, 5)
-- code.BossComing(1, 86)
-- 金币
-- archive:SaveInt(1, "talentP", 0)
-- archive:SaveInt(1, "heroExp", 0)
-- jass.udg_GameTime = 118 + 120 * 0


jass.udg_PlayerGold[1] = 100000
jass.udg_PlayerKills[1] = 100000
jass.udg_PlayerDiamond[1] = 100000
-- 杀敌
-- 黑市等级
-- jass.udg_BlackMarketLv[1] = 10
-- 黑市售卖数量
-- jass.udg_BlackMarketSalesAmount[1] = 10
-- 藏兵阁次数
-- jass.udg_CBGCount[1] = 100
-- 英雄升级
for i = 1, 12, 1 do
	-- jass.SetHeroLevel(jass.udg_Hero[1], jass.GetHeroLevel(jass.udg_Hero[1]) + 1, true)
end
-- UIModule.ResultFeedback:PlaySuccess(1)
-- UIModule.ResultFeedback:PlayFailed(1)


-- UIModule.SeizeBody.modelDatas[16] = { stand = 0, modelPosition = { -25, 0, -25 }, cameraRotate = { 0, 20, 0 }, scale = 0.2 }

-- jass.udg_MpMaxExtractCount[1] = 100
-- 夺舍
-- code.BeginSeizeBody(1)

-- 英雄立即复活次数
-- jass.udg_HeroImmediatelyRelive[1] = 1

-- require "my_ui.UICbg".CbgUI.panel:set_point2("中心", 1800, 345)
-- code.SetUnitName(jass.udg_Hero[1], "设置名字")
-- print(jass.GetUnitName(jass.udg_Hero[1]))

-- 打开黑市
-- require "my_ui.ui_blackmarket":SetBMSalesID(1)
-- common:SetUnitShow(jass.udg_BlackMarket[1], true)
-- common:RunTrigger(jass.gg_trg_SetBMSales)

-- 打开赌坊
-- common:SetUnitShow(jass.udg_GamblingHouse[1], true)
-- common:RunTrigger(jass.gg_trg_SetGHSales)

-- 设置物品类型属性
-- 提示拓展
--[[ code.YDWESetItemDataString(math.floor(myFunc:ID2Int("I0GT")), 3, "333")
-- 提示
code.YDWESetItemDataString(math.floor(myFunc:ID2Int("I0GT")), 4, "111")
-- 图标
code.YDWESetItemDataString(math.floor(myFunc:ID2Int("I0GT")), 1, "111") ]]

-- print(myFunc:GetCustomValue(jass.udg_Hero[1], "字符串", "str"))
-- print(jass.udg_PlayerGold[1])

-- for key, value in ipairs(jass.udg_Player) do
-- 	print(key,value)
-- end
-- code.SetUnitAttr_Str(jass.udg_Hero[1], "运气", 100)

-- common:ReceiveSync("SendSync")(function(val)
-- end)
-- Module.UI_TipDialog.TipDialogUp.panel:set_show(true):set_point2("中心", 415, 460)
-- print(Module.UI_TipDialog.TipDialogUp.tips)
-- code.SetUnitAttr_Str(jass.udg_Hero[1], "运气", 100)
-- code.AddUnitAttrStr(jass.udg_Hero[1], "每秒金币+100")
-- code.SetUnitAttr_Str(jass.udg_Hero[1], "攻击加成%", 100)
code.SetUnitAttr_Str(jass.udg_Hero[1], "生命", 100000)
-- code.SetUnitAttr_Str(jass.udg_Hero[1], "多重几率", 100)
code.SetUnitAttr_Str(jass.udg_Hero[1], "法术暴率%", 50)
code.SetUnitAttr_Str(jass.udg_Hero[1], "物理暴率%", 50)
code.SetUnitAttr_Str(jass.udg_Hero[1], "攻击", 1000)
code.SetUnitAttr_Str(jass.udg_Hero[1], "攻击射程", 1000)
code.SetUnitAttr_Str(jass.udg_Hero[1], "攻击速度%", 200)
-- code.SetUnitAttr_Str(jass.udg_Hero[1], "智力", 1000)
-- require "my_ui.UIWeapon".weaponUI.btn[1]:set_show(false)

-- require "my_ui.UIWeapon".weaponUI.btn[1]:set_show(true)

-- code.AddMessage(1, 1, "消息")
-- code.AddMessage(1, 1, "消息")
