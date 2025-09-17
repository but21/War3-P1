local code = require "jass.code"
local jass = Jass
local japi = require "jass.japi"
local font = "fonts\\LXWK_Bold.ttf"

local Module = require "my_base.base_module_manager"
local createUI = Module.UICreate
local common = Module.Common
local attrSystem = Module.AttrSystem
local tipDialogUp = Module.UITipDialog.tipDialogUp

local resourceUI = {}
local Resource = {}
Resource.ui = resourceUI

local _name = { "金币", "杀敌", "木材" }
local _icon = { [[Survival\UI\Console\gold.tga]], [[Survival\UI\Console\kills.tga]], [[Survival\UI\Console\diamond.tga]] }
local _tip = { "主要从每秒金币和金币挑战中获得|n|n可用于黑市购买、强者之心升级。", "击杀敌人获取|n|n可用于杀敌兑换", "击杀精英敌人概率掉落，击杀Boss必定掉落|n|n可用于各种选择的刷新" }

local function _EnterBtn(btn)
	local index = btn.index
	tipDialogUp.name:set_text(_name[index])
	tipDialogUp.icon:set_image(_icon[index])
	tipDialogUp.tips:set_text(_tip[index])
	tipDialogUp.panel:reset_allpoint()
	tipDialogUp.panel:set_show(true)
	tipDialogUp.intro:set_text("|cff00ffff类别 - 资源")
	tipDialogUp.panel:set_point2("中心", 1900, 301 - 14)
	tipDialogUp.panel:set_show(true)
end
local function _LeaveBtn(btn)
	tipDialogUp.panel:set_show(false)
end
resourceUI.panel = createUI:CreateUIAbsolute("panel", gameui, "中心", 1470, 1060, 200, 200)
local _size = 30
local _fontLength = 270
resourceUI.background = createUI:CreateUIRelative("image", resourceUI.panel, "中心", resourceUI.panel, "中心", 0, 0, 700, 100,
	{ alpha = 0, image = [[UI\Widgets\ToolTips\Human\human-tooltip-background.blp]] })
resourceUI.icon = {}
resourceUI.btn = {}
resourceUI.text = {}
resourceUI.addition = {}
for i = 1, 3 do
	resourceUI.icon[i] = createUI:CreateUIRelative("image", resourceUI.background, "左侧", resourceUI.background, "左侧", (i - 1) * _fontLength, -10, 52, 61, { image = _icon[i] })
	resourceUI.btn[i] = createUI:CreateUIRelative("button", resourceUI.icon[i], "中心", resourceUI.icon[i], "中心", 0, 0, 52 + 100, 61)
	resourceUI.btn[i].index = i
	resourceUI.text[i] = createUI:CreateUIRelative("text", resourceUI.icon[i], "左上", resourceUI.icon[i], "右上", 5, -5, _fontLength, 0, { font = font, fontSize = 20, align = "左侧" })
	resourceUI.addition[i] = createUI:CreateUIRelative("text", resourceUI.text[i], "左上", resourceUI.text[i], "左下", 50, -10, _fontLength, 0, { font = font, fontSize = 20, align = "左侧" })
	resourceUI.btn[i]:event "进入" (_EnterBtn)
	resourceUI.btn[i]:event "离开" (_LeaveBtn)
	-- resourceUI.text[i]:set_text("资源: 10000")
end
-- resourceUI.icon[i]:set_image([[UI\Icons\Misc\GoldIcon.blp]])

local function _SetResourceUI()
	for playerID, player in ipairs(jass.udg_Player) do
		if jass.udg_Hero[playerID] and common:IsLocalPlayer(player) then
			resourceUI.text[1]:set_text("|cfaffff00金币|r " ..
				math.floor(jass.udg_PlayerGold[playerID]) .. " |cff00ff00(+" .. string.format("%.1f", attrSystem:GetObjAttrFromStr(jass.udg_Hero[playerID], "每秒金币")) .. ")")
			resourceUI.text[2]:set_text("|cffff0000杀敌|r " ..
				math.floor(jass.udg_PlayerKills[playerID]) .. " |cff00ff00(+" .. string.format("%.1f", attrSystem:GetObjAttrFromStr(jass.udg_Hero[playerID], "每秒杀敌")) .. ")")
			resourceUI.text[3]:set_text("|cff00ffff木材|r " ..
				math.floor(jass.udg_PlayerDiamond[playerID]) .. " |cff00ff00(+" .. string.format("%.1f", attrSystem:GetObjAttrFromStr(jass.udg_Hero[playerID], "每秒木材")) .. ")")
			resourceUI.addition[1]:set_text("|cff00ff00(+" .. math.floor(attrSystem:GetObjAttrFromStr(jass.udg_Hero[playerID], "金币加成")) .. "%)|r")
			resourceUI.addition[2]:set_text("|cff00ff00(+" .. math.floor(attrSystem:GetObjAttrFromStr(jass.udg_Hero[playerID], "杀敌加成")) .. "%)|r")
			resourceUI.addition[3]:set_text("|cff00ff00(+" .. math.floor(attrSystem:GetObjAttrFromStr(jass.udg_Hero[playerID], "木材加成")) .. "%)|r")
		end
	end
end
ac.time(0.5, _SetResourceUI)

return Resource
