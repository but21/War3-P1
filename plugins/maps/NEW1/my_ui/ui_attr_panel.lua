local code = require "jass.code"
local jass = require "jass.common"
local japi = require "jass.japi"
local font = [[fonts\LXWK_Bold.ttf]]

local Module = require "my_base.base_module_manager"
local attrSystem = Module.AttrSystem
local common = Module.Common
local createUI = Module.UICreate

local AttrPanel = {}

-- 属性界面
local attrUI = {}
AttrPanel.ui = attrUI


local _attr = {}
_attr[1] = { "每秒力量", "每秒敏捷", "每秒智力", "每秒生命", "每秒攻击", "每秒护甲", "每秒全属" }
_attr[2] = { "杀敌力量", "杀敌敏捷", "杀敌智力", "杀敌生命", "杀敌攻击", "杀敌护甲", "杀敌全属" }
_attr[3] = { "每秒回血", "生命恢复%", "攻击吸血%", "技能吸血%", "伤害减免%", "免伤几率%" }
_attr[4] = { "力量加成%", "敏捷加成%", "智力加成%", "生命加成%", "攻击加成%", "护甲加成%", }
_attr[5] = { "攻击伤害%", "物理伤害%", "法术伤害%", "最终伤害%", "绝对伤害%", "攻击暴率%", "物理暴率%", "法术暴率%", "攻击暴伤%", "物理暴伤%", "法术暴伤%" }


attrUI.parent = gameui:builder "panel" { w = 1, h = 1, xy = { "中心", 0, 0 }, show = false }
attrUI.parent:set_level(2)
attrUI.parent:set_point2("中心", 960, 670)

attrUI.fpsText = createUI:CreateUIAbsolute("text", gameui, "中心", 465, 10, 150, 0, { font = font, fontSize = 18, align = "居中" })

-- 背景
attrUI.background = attrUI.parent:builder "image" { w = 800, h = 600, xy = { "中心", attrUI.parent, "中心", 0, 0 },
	image = [[UI\Widgets\ToolTips\Human\human-tooltip-background.blp]], alpha = 0.8 }
japi.FrameSetIgnoreTrackEvents(attrUI.background.handle, false)

-- 每秒
attrUI.perSecond = attrUI.parent:builder "text" { w = 250, h = 0, xy = { "左上", attrUI.background, "左上", 20, -20 },
	font = { font, 25, align = "左" } }
attrUI.perSecond:set_text("|cff00f78c每秒")

-- 杀敌
attrUI.killEnemy = attrUI.parent:builder "text" { w = 250, h = 0, xy = { "左上", attrUI.perSecond, "右上", 10, 0 },
	font = { font, 25, align = "左" } }
attrUI.killEnemy:set_text("|cff00f78c杀敌")

-- 生存
attrUI.survival = attrUI.parent:builder "text" { w = 250, h = 0, xy = { "左上", attrUI.background, "左侧", 20, -20 },
	font = { font, 25, align = "左" } }
attrUI.survival:set_text("|cff00f78c生存")

-- 加成
attrUI.addition = attrUI.parent:builder "text" { w = 250, h = 0, xy = { "左上", attrUI.survival, "右上", 10, 0 },
	font = { font, 25, align = "左" } }
attrUI.addition:set_text("|cff00f78c加成")

-- 伤害
attrUI.damage = attrUI.parent:builder "text" { w = 250, h = 0, xy = { "左上", attrUI.killEnemy, "右上", 10, 0 },
	font = { font, 25, align = "左" } }
attrUI.damage:set_text("|cff00f78c伤害")

local _ui = { attrUI.perSecond, attrUI.killEnemy, attrUI.survival, attrUI.addition, attrUI.damage, }
for uiIndex, attrs in ipairs(_attr) do
	for index, attrName in ipairs(attrs) do
		if index == 1 then
			_ui[uiIndex][attrName] = _ui[uiIndex]:builder "text" { w = 400, h = 0, xy = { "左上", _ui[uiIndex], "左下", 0, -10 },
				font = { font, 20, align = "左" } }
		else
			_ui[uiIndex][attrName] = _ui[uiIndex]:builder "text" { w = 400, h = 0, xy = { "左上", _ui[uiIndex][attrs[index - 1]], "左下", 0, -10 },
				font = { font, 20, align = "左" } }
		end
		_ui[uiIndex][attrName]:set_text(attrName)
	end
end
-- attrUI.parent:set_alpha(0)
local hero = jass.udg_Hero

function code.ShowAttr(playerID)
	if common:IsLocalPlayer(jass.udg_Player[playerID]) then
		attrUI.parent:set_show(not attrUI.parent._show)
	end
end

local function _RefreshAttrPanel()
	for playerID, player in ipairs(jass.udg_Player) do
		if common:IsLocalPlayer(player) then
			attrUI.fpsText:set_text("|cff00eaffFPS: " .. string.format("%.1f", japi.GetFps()))
			if attrUI.parent._show then
				for uiIndex, attrs in ipairs(_attr) do
					for _, attrName in ipairs(attrs) do
						local name = attrName:gsub("%%", "")
						local str = string.format("%-20s", name) .. string.format("%0.1f", attrSystem:GetObjAttrFromStr(hero[playerID], attrName))
						str = str .. (attrName:sub(-1) == "%" and "%" or "")
						_ui[uiIndex][attrName]:set_text(str)
					end
				end
			end
		end
	end
end

ac.time(0.5, _RefreshAttrPanel)

return AttrPanel
