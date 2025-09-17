local dzapi   = require 'jass.dzapi'
local code    = require 'jass.code'
local japi    = require 'jass.japi'
local jass    = Jass
local gameui  = gameui

local Module  = require "my_base.base_module_manager"
local itemTip = Module.UITipDialog.itemTip


local LUIUpdate = LUIUpdate
local UIFunc_Table = UIFunc_Table
local Tween = Tween
local ipairs = ipairs
local table_remove = table.remove

function gameui.message_Refresh_action()
	--UI函数调用
	if #UIFunc_Table > 0 then
		for i = #UIFunc_Table, 1, -1 do
			UIFunc_Table[i](i)
		end
	end
	--插值计算
	if #LUIUpdate > 0 then
		--每帧时间
		local deltaTime = 1 / japi.GetFps()
		for i = #LUIUpdate, 1, -1 do
			local tween = LUIUpdate[i]
			if not tween.interrupt then
				if tween.nowT >= tween.t then
					tween.nowT = tween.t
					-- print('溢出')
					table.remove(LUIUpdate, i)
					tween.P.complete = true
				end
				--计算当前插值
				for index, _ in ipairs(tween.P) do
					if tween.ty == "贝塞尔" then
						if tween.ctlP2 then
							tween.P[index] = Tween['贝塞尔'](tween.nowT, tween.t, tween.startP[index], tween.ctlP1[index], tween.endP[index], tween.ctlP2[index])
						else
							tween.P[index] = Tween['贝塞尔'](tween.nowT, tween.t, tween.startP[index], tween.ctlP1[index], tween.endP[index])
						end
					else
						if tween.sel then
							tween.P[index] = Tween[tween.ty](tween.nowT, tween.startP[index], tween.endP[index] - tween.startP[index], tween.t, tween.sel)
						else
							tween.P[index] = Tween[tween.ty](tween.nowT, tween.startP[index], tween.endP[index] - tween.startP[index], tween.t)
						end
					end
				end
				tween.nowT = tween.nowT + deltaTime
			else
				table_remove(LUIUpdate, i)
				tween.P.interrupt = true
			end
		end
	end

	--#region 鼠标指向物品提示框
	-- 鼠标指向物品
	local item = japi.DzGetUnitUnderMouse()
	-- 鼠标指向物品的物品类型
	local itemType = jass.GetItemTypeId(item)
	if itemType > 0 then
		--- 图标
		local icon = code.YDWEGetItemDataString(itemType, 1)
		-- 名字
		local name = code.YDWEGetItemDataString(itemType, 4)
		--- 提示
		local text = code.YDWEGetItemDataString(itemType, 2)
		-- 说明
		local intro = code.YDWEGetItemDataString(itemType, 5)
		itemTip.icon:set_image(icon)
		itemTip.name:set_text(name)
		itemTip.tips:set_text(text)
		itemTip.intro:set_text("|cff696E6E类别 - " .. intro)
		itemTip.panel:reset_allpoint():set_point2("中心", 1900, 284)
		itemTip.panel:set_show(true)
	else
		itemTip.panel:set_show(false)
	end
	item = nil
	--#endregion
end

ac.mzhz(gameui.message_Refresh_action)
