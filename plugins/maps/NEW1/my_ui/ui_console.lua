local code = require 'jass.code'
local jass = require 'jass.common'
local japi = require 'jass.japi'


local Module = require "my_base.base_module_manager"
local myFunc = Module.MyFunc
local attrSystem = Module.AttrSystem
local common = Module.Common
local consoleTip = Module.UITipDialog.tipOnlyTextUp

local ConsoleUI = {}

local function ConsoleInit()
	-- 控制台面板UI
	ConsoleUI["父控件"] = gameui:builder 'panel' { w = 400, h = 150, xy = { '中心', 0, 0 }, show = false }
	ConsoleUI['父控件']:set_point2("中心", 985, 60)

	ConsoleUI["生命"] = ConsoleUI["父控件"]:builder 'text' { w = 148, h = 0, xy = { "右下", ConsoleUI["父控件"], "左下", -81, 53 - 10 },
		font = { [[fonts\LXWK_Bold.ttf]], 18, align = '居中' } }
	ConsoleUI["生命"]:set_text("10000/10000")

	-- ConsoleUI["test"] = ConsoleUI["生命"]:builder 'image' { w = 148, h = 10, xy = { "中心", ConsoleUI["生命"], "中心", 0, 0 } }

	ConsoleUI["生命增幅"] = ConsoleUI["父控件"]:builder 'text' { w = 100, h = 0, xy = { "右下", ConsoleUI["父控件"], "左下", -25, 49.5 },
		font = { [[fonts\LXWK_Bold.ttf]], 16, align = '左侧' }, show = false }
	ConsoleUI["生命增幅"]:set_text("|cff00f5a4(100%)")

	ConsoleUI["魔法值"] = ConsoleUI["父控件"]:builder 'text' { w = 148, h = 0, xy = { "右下", ConsoleUI["父控件"], "左下", -81, 20.5 - 5 },
		font = { [[fonts\LXWK_Bold.ttf]], 18, align = '居中' } }
	ConsoleUI["魔法值"]:set_text("100/100")

	ConsoleUI["魔法恢复"] = ConsoleUI["父控件"]:builder 'text' { w = 100, h = 0, xy = { "右下", ConsoleUI["父控件"], "左下", -25, 22 },
		font = { [[fonts\LXWK_Bold.ttf]], 16, align = '左' }, show = false }
	ConsoleUI["魔法恢复"]:set_text("|cff00f5a4(100/s)")


	ConsoleUI["攻击图标"] = ConsoleUI["父控件"]:builder 'image' { w = 30, h = 30, xy = { '左上', ConsoleUI["父控件"], '左上', 0, -15 },
		image = [[Survival\UI\Console\atk.tga]], alpha = 1 }
	ConsoleUI["攻击按钮"] = ConsoleUI["攻击图标"]:builder 'button' { w = 30, h = 30, xy = { '中心', ConsoleUI["攻击图标"], '中心', 0, 0 } }
	ConsoleUI["攻击文本"] = ConsoleUI["攻击图标"]:builder 'text' { w = 60, h = 0, xy = { "左侧", ConsoleUI["攻击图标"], "右侧", 5, 0 },
		font = { [[fonts\LXWK_Bold.ttf]], 23, align = '左' }, alpha = 0.5 }
	ConsoleUI["攻击文本"]:set_text("攻击:")
	ConsoleUI["攻击"] = ConsoleUI["攻击文本"]:builder 'text' { w = 80, h = 0, xy = { "左侧", ConsoleUI["攻击文本"], "右侧", 0, 0 },
		font = { [[fonts\LXWK_Bold.ttf]], 20, align = '左' } }
	ConsoleUI["攻击"]:set_text("100")
	ConsoleUI["攻击增幅"] = ConsoleUI["攻击"]:builder 'text' { w = 80, h = 0, xy = { "底部", ConsoleUI["攻击"], "顶部", 0, 0 },
		font = { [[fonts\LXWK_Bold.ttf]], 16, align = '左' } }
	ConsoleUI["攻击增幅"]:set_text("|cff00f5a4(100%)")

	local uiButton = ConsoleUI["攻击按钮"]
	uiButton:event "进入" (function()
		local u = code.GetSelectUnit()
		consoleTip["panel"]:set_show(true)
		consoleTip["panel"]:reset_allpoint()
		consoleTip["panel"]:set_point("左下", uiButton, "右上", 20, 20)
		-- local text = "※攻击力: " .. My_Func:NumToChinese(AttrSystem:GetObjAttrFromStr(u, "面板攻击")) .. "|n"
		local text = "※攻击力: " .. string.format("%.0f", attrSystem:GetObjAttrFromStr(u, "面板攻击")) .. "|n"
		text = text .. "※攻击速度: " .. string.format("%.0f", attrSystem:GetObjAttrFromStr(u, "攻击速度%")) .. "%|n"
		text = text .. "※攻击间隔: " .. string.format("%.2f", attrSystem:GetObjAttrFromStr(u, "攻击间隔")) .. " (最低为0.25)|n"
		text = text .. "※攻击距离: " .. string.format("%.0f", attrSystem:GetObjAttrFromStr(u, "攻击射程")) .. "|n|n"
		local armor = japi.GetUnitState(u, jass.ConvertUnitState(0x20)) + 0
		text = text .. "※防御: " .. string.format("%.0f", armor) .. "|n(受到伤害减少" .. string.format("%.2f", (armor / (100 + armor)) * 100) .. "%)|n|n"
		text = text .. "※移速: " .. string.format("%.0f", tostring(common:GetUnitState(u, "移动速度")))
		-- text = text .. "※移速: " .. string.format("%.0f", attrSystem:GetObjAttrFromStr(u, "移动速度"))
		consoleTip["tips"]:set_text(text)
		u = nil
	end)
	uiButton:event "离开" (function()
		consoleTip["panel"]:set_show(false)
	end)


	ConsoleUI["防御图标"] = ConsoleUI["父控件"]:builder 'image' { w = 30, h = 30, xy = { '左上', ConsoleUI["攻击图标"], '左下', 0, -20 },
		image = [[Survival\UI\Console\armor.tga]], alpha = 1 }
	ConsoleUI["防御按钮"] = ConsoleUI["防御图标"]:builder 'button' { w = 30, h = 30, xy = { '中心', ConsoleUI["防御图标"], '中心', 0, 0 } }
	ConsoleUI["防御文本"] = ConsoleUI["防御图标"]:builder 'text' { w = 60, h = 0, xy = { "左侧", ConsoleUI["防御图标"], "右侧", 5, 0 },
		font = { [[fonts\LXWK_Bold.ttf]], 23, align = '左' }, alpha = 0.5 }
	ConsoleUI["防御文本"]:set_text("防御:")
	ConsoleUI["防御"] = ConsoleUI["防御文本"]:builder 'text' { w = 80, h = 0, xy = { "左侧", ConsoleUI["防御文本"], "右侧", 0, 0 },
		font = { [[fonts\LXWK_Bold.ttf]], 20, align = '左' } }
	ConsoleUI["防御"]:set_text("100")
	ConsoleUI["防御增幅"] = ConsoleUI["防御"]:builder 'text' { w = 80, h = 0, xy = { "底部", ConsoleUI["防御"], "顶部", 0, 0 },
		font = { [[fonts\LXWK_Bold.ttf]], 16, align = '左' } }
	ConsoleUI["防御增幅"]:set_text("|cff00f5a4(100%)")

	local uiButton = ConsoleUI["防御按钮"]
	ConsoleUI["防御按钮"]:event "进入" (function()
		local u = code.GetSelectUnit()
		consoleTip["panel"]:set_show(true)
		consoleTip["panel"]:reset_allpoint()
		consoleTip["panel"]:set_point("左下", uiButton, "右上", 20, 20)
		-- local text = "※攻击力: " .. My_Func:NumToChinese(AttrSystem:GetObjAttrFromStr(u, "面板攻击")) .. "|n"
		local text = "※攻击力: " .. string.format("%.0f", attrSystem:GetObjAttrFromStr(u, "面板攻击")) .. "|n"
		text = text .. "※攻击速度: " .. string.format("%.0f", attrSystem:GetObjAttrFromStr(u, "攻击速度%")) .. "%|n"
		text = text .. "※攻击间隔: " .. string.format("%.2f", attrSystem:GetObjAttrFromStr(u, "攻击间隔")) .. " (最低为0.25)|n"
		text = text .. "※攻击距离: " .. string.format("%.0f", attrSystem:GetObjAttrFromStr(u, "攻击射程")) .. "|n|n"
		local armor = japi.GetUnitState(u, jass.ConvertUnitState(0x20)) + 0
		text = text .. "※防御: " .. string.format("%.0f", armor) .. "|n(受到伤害减少" .. string.format("%.2f", (armor / (100 + armor)) * 100) .. "%)|n|n"
		-- text = text .. "※移速: " .. string.format("%.0f", attrSystem:GetObjAttrFromStr(u, "移动速度"))
		text = text .. "※移速: " .. string.format("%.0f", tostring(common:GetUnitState(u, "移动速度")))
		consoleTip["tips"]:set_text(text)
		u = nil
	end)
	uiButton:event "离开" (function()
		consoleTip["panel"]:set_show(false)
	end)


	ConsoleUI["力量图标"] = ConsoleUI["父控件"]:builder 'image' { w = 30, h = 30, xy = { '右上', ConsoleUI["父控件"], '右上', -150, 0 },
		image = [[Survival\UI\Console\ll.tga]], alpha = 1 }
	ConsoleUI["力量按钮"] = ConsoleUI["力量图标"]:builder 'button' { w = 30, h = 30, xy = { '中心', ConsoleUI["力量图标"], '中心', 0, 0 } }
	ConsoleUI["力量文本"] = ConsoleUI["力量图标"]:builder 'text' { w = 60, h = 0, xy = { "左侧", ConsoleUI["力量图标"], "右侧", 5, 0 },
		font = { [[fonts\LXWK_Bold.ttf]], 23, align = '左' } }
	ConsoleUI["力量文本"]:set_text("力量:")
	ConsoleUI["力量"] = ConsoleUI["力量文本"]:builder 'text' { w = 80, h = 0, xy = { "左侧", ConsoleUI["力量文本"], "右侧", 0, 0 },
		font = { [[fonts\LXWK_Bold.ttf]], 20, align = '左' } }
	ConsoleUI["力量"]:set_text("100")
	ConsoleUI["力量增幅"] = ConsoleUI["力量"]:builder 'text' { w = 80, h = 0, xy = { "底部", ConsoleUI["力量"], "顶部", 0, 0 },
		font = { [[fonts\LXWK_Bold.ttf]], 16, align = '左' } }
	ConsoleUI["力量增幅"]:set_text("|cff00f5a4(100%)")
	local uiButton = ConsoleUI["力量按钮"]
	ConsoleUI["力量按钮"]:event "进入" (function()
		consoleTip["panel"]:set_show(true)
		consoleTip["panel"]:reset_allpoint()
		consoleTip["panel"]:set_point("左下", uiButton, "右上", 20, 20)
		local text = "力量: |n※每点力量提供5点生命值|n|n敏捷: |n※每点敏捷提供0.01护甲|n|n智力: |n※每点智力提供0.25每秒回血"
		-- local text = "力量、敏捷、智力中的最高值为英雄的攻击力。"
		consoleTip["tips"]:set_text(text)
	end)
	uiButton:event "离开" (function()
		consoleTip["panel"]:set_show(false)
	end)


	ConsoleUI["敏捷图标"] = ConsoleUI["力量图标"]:builder 'image' { w = 30, h = 30, xy = { '左上', ConsoleUI["力量图标"], '左下', 0, -10 },
		image = [[Survival\UI\Console\mj.tga]], alpha = 1 }
	ConsoleUI["敏捷按钮"] = ConsoleUI["敏捷图标"]:builder 'button' { w = 30, h = 30, xy = { '中心', ConsoleUI["敏捷图标"], '中心', 0, 0 } }
	ConsoleUI["敏捷文本"] = ConsoleUI["敏捷图标"]:builder 'text' { w = 60, h = 0, xy = { "左侧", ConsoleUI["敏捷图标"], "右侧", 5, 0 },
		font = { [[fonts\LXWK_Bold.ttf]], 23, align = '左' } }
	ConsoleUI["敏捷文本"]:set_text("敏捷:")
	ConsoleUI["敏捷"] = ConsoleUI["敏捷文本"]:builder 'text' { w = 80, h = 0, xy = { "左侧", ConsoleUI["敏捷文本"], "右侧", 0, 0 },
		font = { [[fonts\LXWK_Bold.ttf]], 20, align = '左' } }
	ConsoleUI["敏捷"]:set_text("100")
	ConsoleUI["敏捷增幅"] = ConsoleUI["敏捷"]:builder 'text' { w = 80, h = 0, xy = { "底部", ConsoleUI["敏捷"], "顶部", 0, 0 },
		font = { [[fonts\LXWK_Bold.ttf]], 16, align = '左' } }
	ConsoleUI["敏捷增幅"]:set_text("|cff00f5a4(100%)")

	local uiButton = ConsoleUI["敏捷按钮"]
	ConsoleUI["敏捷按钮"]:event "进入" (function()
		consoleTip["panel"]:set_show(true)
		consoleTip["panel"]:reset_allpoint()
		consoleTip["panel"]:set_point("左下", uiButton, "右上", 20, 20)
		local text = "力量: |n※每点力量提供5点生命值|n|n敏捷: |n※每点敏捷提供0.01护甲|n|n智力: |n※每点智力提供0.25每秒回血"
		-- local text = "力量、敏捷、智力中的最高值为英雄的攻击力。"
		consoleTip["tips"]:set_text(text)
		-- u = nil
	end)
	uiButton:event "离开" (function()
		consoleTip["panel"]:set_show(false)
	end)


	ConsoleUI["智力图标"] = ConsoleUI["敏捷图标"]:builder 'image' { w = 30, h = 30, xy = { '左上', ConsoleUI["敏捷图标"], '左下', 0, -10 },
		image = [[Survival\UI\Console\zl.tga]], alpha = 1 }
	ConsoleUI["智力按钮"] = ConsoleUI["智力图标"]:builder 'button' { w = 30, h = 30, xy = { '中心', ConsoleUI["智力图标"], '中心', 0, 0 } }
	ConsoleUI["智力文本"] = ConsoleUI["智力图标"]:builder 'text' { w = 60, h = 0, xy = { "左侧", ConsoleUI["智力图标"], "右侧", 5, 0 },
		font = { [[fonts\LXWK_Bold.ttf]], 23, align = '左' } }
	ConsoleUI["智力文本"]:set_text("智力:")
	ConsoleUI["智力"] = ConsoleUI["智力文本"]:builder 'text' { w = 80, h = 0, xy = { "左侧", ConsoleUI["智力文本"], "右侧", 0, 0 },
		font = { [[fonts\LXWK_Bold.ttf]], 20, align = '左' } }
	ConsoleUI["智力"]:set_text("100")
	ConsoleUI["智力增幅"] = ConsoleUI["智力"]:builder 'text' { w = 80, h = 0, xy = { "底部", ConsoleUI["智力"], "顶部", 0, 0 },
		font = { [[fonts\LXWK_Bold.ttf]], 16, align = '左' } }
	ConsoleUI["智力增幅"]:set_text("|cff00f5a4(100%)")
	local uiButton = ConsoleUI["智力按钮"]
	ConsoleUI["智力按钮"]:event "进入" (function()
		consoleTip["panel"]:set_show(true)
		consoleTip["panel"]:reset_allpoint()
		consoleTip["panel"]:set_point("左下", uiButton, "右上", 20, 20)
		local text = "力量: |n※每点力量提供5点生命值|n|n敏捷: |n※每点敏捷提供0.01护甲|n|n智力: |n※每点智力提供0.25每秒回血"
		-- local text = "力量: |n※每点力量提供1点生命值|n|n敏捷: |n※每点敏捷提供0.3攻击力|n|n智力: |n※智力提供法术伤害"
		-- local text = "力量、敏捷、智力中的最高值为英雄的攻击力。"
		consoleTip["tips"]:set_text(text)
	end)
	uiButton:event "离开" (function()
		consoleTip["panel"]:set_show(false)
	end)


	ac.time(0.03, function()
		local u = code.GetSelectUnit()
		if u ~= nil and GetUnitAbilityLevel(u, myFunc:ID2Int("Avul")) == 0 and u > 0 then
			ConsoleUI["父控件"]:set_show(true)
			if IsUnitType(u, UNIT_TYPE_HERO) == true then
				ConsoleUI["力量图标"]:set_show(true)
				ConsoleUI["攻击增幅"]:set_show(true)
				ConsoleUI["防御增幅"]:set_show(true)
				-- ConsoleUI["生命增幅"]:set_show(true)
				ConsoleUI["魔法值"]:set_show(true)
				-- ConsoleUI["魔法恢复"]:set_show(true)
				local hp = myFunc:NumToChinese(jass.GetUnitState(u, jass.UNIT_STATE_LIFE))
				local maxHp = myFunc:NumToChinese(jass.GetUnitState(u, jass.UNIT_STATE_MAX_LIFE))
				local mp = myFunc:NumToChinese(jass.GetUnitState(u, jass.UNIT_STATE_MANA))
				local maxMp = myFunc:NumToChinese(jass.GetUnitState(u, jass.UNIT_STATE_MAX_MANA))
				ConsoleUI["生命"]:set_text(hp .. "/" .. maxHp)
				ConsoleUI["魔法值"]:set_text(mp .. "/" .. maxMp)
				ConsoleUI["攻击"]:set_text(myFunc:NumToChinese(attrSystem:GetObjAttrFromStr(u, "面板攻击")))
				ConsoleUI["防御"]:set_text(myFunc:NumToChinese(japi.GetUnitState(u, jass.ConvertUnitState(0x20)) + 0))
				ConsoleUI["力量"]:set_text(myFunc:NumToChinese(attrSystem:GetObjAttrFromStr(u, "面板力量")))
				ConsoleUI["敏捷"]:set_text(myFunc:NumToChinese(attrSystem:GetObjAttrFromStr(u, "面板敏捷")))
				ConsoleUI["智力"]:set_text(myFunc:NumToChinese(attrSystem:GetObjAttrFromStr(u, "面板智力")))
				ConsoleUI["力量增幅"]:set_text("|cff00f5a4(" .. attrSystem:GetObjAttrFromStr(u, "力量加成%") .. "%)")
				ConsoleUI["敏捷增幅"]:set_text("|cff00f5a4(" .. attrSystem:GetObjAttrFromStr(u, "敏捷加成%") .. "%)")
				ConsoleUI["智力增幅"]:set_text("|cff00f5a4(" .. attrSystem:GetObjAttrFromStr(u, "智力加成%") .. "%)")
				ConsoleUI["攻击增幅"]:set_text("|cff00f5a4(" .. attrSystem:GetObjAttrFromStr(u, "攻击加成%") .. "%)")
				ConsoleUI["防御增幅"]:set_text("|cff00f5a4(" .. attrSystem:GetObjAttrFromStr(u, "护甲加成%") .. "%)")
				-- ConsoleUI["生命增幅"]:set_text("|cff00f5a4(" .. string.format("%d", AttrSystem:GetObjAttrFromStr(u, "生命增幅%")) .. "%)")
				-- ConsoleUI["魔法恢复"]:set_text("|cff00f5a4(" .. string.format("%d", AttrSystem:GetObjAttrFromStr(u, "魔法恢复")) .. "/s)")
			else
				ConsoleUI["力量图标"]:set_show(false)
				ConsoleUI["攻击增幅"]:set_show(false)
				ConsoleUI["防御增幅"]:set_show(false)
				-- ConsoleUI["生命增幅"]:set_show(false)
				ConsoleUI["魔法值"]:set_show(false)
				-- ConsoleUI["魔法恢复"]:set_show(false)
				local hp = myFunc:NumToChinese(jass.GetUnitState(u, jass.UNIT_STATE_LIFE))
				local maxHp = myFunc:NumToChinese(jass.GetUnitState(u, jass.UNIT_STATE_MAX_LIFE))
				ConsoleUI["生命"]:set_text(hp .. " / " .. maxHp)
				ConsoleUI["攻击"]:set_text(myFunc:NumToChinese(attrSystem:GetObjAttrFromStr(u, "面板攻击")))
				ConsoleUI["防御"]:set_text(myFunc:NumToChinese(japi.GetUnitState(u, jass.ConvertUnitState(0x20))))
			end
		else
			ConsoleUI["父控件"]:set_show(false)
		end
		u = nil
	end)
end

-- ac.time(0.1, 1, ConsoleInit)
ConsoleInit()

return ConsoleUI
