local dzapi      = require 'jass.dzapi'
local code       = require 'jass.code'
local japi       = require 'jass.japi'
local jass       = require 'jass.common'

local Module     = require "my_base.base_module_manager"
local UI_ItemTip = Module.UITipDialog.uiItemTip


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
		local ty = jass.LoadInteger(jass.YDHT, itemType, jass.StringHash("id"))
		-- local type = slk.item[string.i2id(jass.GetItemTypeId(item))]["name"]
		if ty == 1 then
			UI_ItemTip["类别"]:set_text("|cff0091ff类别 -- 装备")
		elseif ty == -1 then
			UI_ItemTip["类别"]:set_text("|cff0091ff类别 -- 技能书")
		else
			UI_ItemTip["类别"]:set_text("|cff0091ff类别 -- 道具")
		end
		--- 提示
		local name = code.YDWEGetItemDataString(jass.GetItemTypeId(item), 4)
		--- 提示拓展
		local text = code.YDWEGetItemDataString(jass.GetItemTypeId(item), 3)
		--- 图标
		local icon = code.YDWEGetItemDataString(jass.GetItemTypeId(item), 1)
		UI_ItemTip["描述"]:set_text(text)
		UI_ItemTip["名称"]:set_text(name)
		UI_ItemTip["图标"]:set_image(icon)
		UI_ItemTip["父控件"]:set_point2("中心", 1900, 301)
		UI_ItemTip["父控件"]:set_show(true)
	else
		UI_ItemTip["父控件"]:set_show(false)
	end
	--#endregion
end

ac.mzhz(gameui.message_Refresh_action)
