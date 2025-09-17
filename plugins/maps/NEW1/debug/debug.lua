local code = require 'jass.code'
local jass = Jass
local slk = require "jass.slk"

local UIModule = require "my_ui.ui_module_manager"
local Module = require "my_base.base_module_manager"
local common = Module.Common
local myFunc = Module.MyFunc
local RefineEquipUI = Module.UITipDialog.RefineEquipUI
local attrSystem = Module.AttrSystem
local excel = Module.Excel
local archive = Module.Archive
local equip = require "realization.equip"

print("\ndebug...\n")
-- equip:CreateEquip(1, 1, 30)
-- common:CreateItem(equip.allItemType[601], 500, 0)
jass.udg_PlayerGold[1] = 100000
jass.udg_PlayerKills[1] = 100000
jass.udg_PlayerDiamond[1] = 100000

UIModule.Treasure.drawCount[1] = 999
UIModule.Treasure.refreshCount[1] = 999
archive:SaveStr(1, "heroSkin", string.rep("b", 6))

-- equip:CreateEquip(1, 6, 1)
-- 英雄升级
for i = 1, 12, 1 do
	-- jass.SetHeroLevel(jass.udg_Hero[1], jass.GetHeroLevel(jass.udg_Hero[1]) + 1, true)
end

-- 夺舍
-- code.BeginSeizeBody(1)

-- 英雄立即复活次数
-- jass.udg_HeroImmediatelyRelive[1] = 1

-- 控制游戏波数
-- jass.udg_GameTime = 118 + 120 * 0


-- UIModule.Challenge.challengeData[1][1].remainCD = 1
-- print(attrSystem:GetObjAttrFromStr(jass.udg_Hero[1], "每秒回血"))


code.SetUnitAttr_Str(jass.udg_Hero[1], "生命", 100000)
code.SetUnitAttr_Str(jass.udg_Hero[1], "多重几率", 100)
code.SetUnitAttr_Str(jass.udg_Hero[1], "法术暴率%", 50)
code.SetUnitAttr_Str(jass.udg_Hero[1], "物理暴率%", 50)
code.SetUnitAttr_Str(jass.udg_Hero[1], "攻击", 1000)
-- code.SetUnitAttr_Str(jass.udg_Hero[1], "护甲", 1000)
code.SetUnitAttr_Str(jass.udg_Hero[1], "攻击射程", 1000)
code.SetUnitAttr_Str(jass.udg_Hero[1], "攻击速度%", 300)
