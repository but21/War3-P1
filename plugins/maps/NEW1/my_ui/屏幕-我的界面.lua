local japi        = require "jass.japi"
local code        = require 'jass.code'
local jass        = require 'jass.common'
local slk         = require "jass.slk"
local message     = require 'jass.message'

local Module      = require "my_base.base_module_manager"
local myFunc      = Module.MyFunc
local tipDialogUp = Module.UITipDialog.tipDialogUp



--控制台
local ui      = ysui['底层控件']:builder "panel" { xy = { "中心", 0, 0 }, show = true }

--宽屏
--控制台下面
local w       = 1920
local h       = 280
ui.console_1  = ui:builder 'image' { w = w, h = h, xy = { '底部', gameui, '底部', 0, 0 }, image = [[ui\windos\kzt02.tga]], alpha = 1 }

--控制台上面
local w       = 1920
local h       = 86
ui.console_2  = ui:builder 'image' { w = w, h = h, xy = { '顶部', gameui, '顶部', 0, 0 }, image = [[ui\windos\kzt01.tga]], alpha = 1 }

ui.skillSlots = {}
ui.itemSlots  = {}
for i = 1, 12, 1 do
	if i <= 6 then
		ui.itemSlots[i] = ui:builder "image" { w = 1, h = 1, xy = { "中心", gameui, "中心", 0, 0 }, image = [[Survival\UI\Console\itemSlot.tga]] }
	end
	ui.skillSlots[i] = ui:builder "image" { w = 1, h = 1, xy = { "中心", gameui, "中心", 0, 0 }, image = [[Survival\UI\Console\skillSlot.tga]] }
end
ui.decorate = ui:builder "image" { w = 85 * 0.8, h = 119 * 0.8, xy = { "中心", 1485, 45 }, image = [[Survival\UI\Console\kt(3).tga]] }

local function init()
	japi.DzFrameHideInterface()

	--单位大头像
	ysui['单位大头像']:reset_allpoint():set_wh(181, 170):set_point2('中心', 626, 150):set_level(1)

	--鼠标提示锁定
	ysui['鼠标提示']:set_point2("右下", 0, 0)

	--重设技能位置
	ac.time(0.01, 1, function()
		local skillIndex = 0
		for b = 1, 3 do
			for a = 1, 4 do
				skillIndex = skillIndex + 1
				local x = 1600 + (a - 1) * 90
				local y = 203 - (b - 1) * 81
				ysui['技能栏'][skillIndex]:reset_allpoint():set_wh(65, 65):set_point2('中心', x, y)
				ui.skillSlots[skillIndex]:reset_allpoint():set_wh(65, 65):set_point2('中心', x, y)

				local skillUI = ysui['技能栏'][skillIndex]
				ac.time(0.01, 1, function()
					skillUI:rem_allpoint()
					skillUI:set_wh(65, 65)
					skillUI:set_point2('中心', x, y)
				end)

				local px, py = a - 1, b - 1
				skillUI:event "进入" (function()
					local unit = japi.GetRealSelectUnit()
					local skill = message.button(px, py)
					-- print(skill)
					if skill ~= 0 and skill then
						--- 提示
						local name = code.YDWEGetUnitAbilityDataString(unit, skill, 1, 215)
						-- 施放间隔
						local cd = code.YDWEGetUnitAbilityDataReal(unit, skill, 1, 105)
						-- 魔法消耗
						local consume = code.YDWEGetUnitAbilityDataInteger(unit, skill, 1, 104)
						-- Name
						local intro = code.YDWEGetUnitAbilityDataString(unit, skill, 1, 203):sub(1, 6)
						--- 提示拓展
						local tip = code.YDWEGetUnitAbilityDataString(unit, skill, 1, 218)
						--- 图标
						local icon = code.YDWEGetUnitAbilityDataString(unit, skill, 1, 204)
						-- 热键
						local hotkey = slk.ability[myFunc:Int2ID(skill)]["Hotkey"]
						if cd > 0 then
							tip = tip .. "|n|n|cff696E6ECD：" .. string.format("%.1f", cd) .. "秒"
						end
						if consume > 0 then
							tip = tip .. "|n法力消耗：" .. consume
						end
						if hotkey and hotkey ~= "" then
							name = name .. "(|cffffcc00" .. hotkey .. "|r)"
						end
						tipDialogUp.icon:set_image(icon)
						tipDialogUp.name:set_text(name)
						tipDialogUp.tips:set_text(tip)
						tipDialogUp.intro:set_text("|cff696E6E类别 - " .. intro)
						tipDialogUp.panel:reset_allpoint():set_point2("中心", 1900, 284)
						tipDialogUp.panel:set_show(true)
					end
					unit = nil
					skill = nil
				end)

				skillUI:event "离开" (function()
					tipDialogUp.panel:set_show(false)
				end)
			end
		end
	end)

	--重设物品位置
	local itemIndex = 0
	for b = 1, 3 do
		for a = 1, 2 do
			itemIndex = itemIndex + 1
			local x = 1295 + (a - 1) * 65
			local y
			if itemIndex == 3 or itemIndex == 4 then
				y = 187 - (b - 1) * 72
			else
				y = 187 - (b - 1) * 74.5
			end
			y = 177 - (b - 1) * 65
			-- if b == 2 then y = y - 0.5 end
			ysui['物品栏'][itemIndex]:reset_allpoint():set_wh(55, 55):set_point2('中心', x, y)
			ui.itemSlots[itemIndex]:reset_allpoint():set_wh(55, 55):set_point2('中心', x, y)


			local itemUI = ysui['物品栏'][itemIndex]
			ac.time(0.01, 1, function()
				itemUI:reset_allpoint()
				itemUI:set_wh(55, 55)
				itemUI:set_point2('中心', x, y)
			end)
			local index = itemIndex - 1
			itemUI:event "离开" (function()
				tipDialogUp.panel:set_show(false)
			end)
			itemUI:event "进入" (function()
				local unit = japi.GetRealSelectUnit()
				local item = jass.UnitItemInSlot(unit, index)
				if item ~= 0 and item then
					--- 获取物品名字
					-- print("ttt")
					-- local type = slk.item[string.i2id(jass.GetItemTypeId(item))]["name"]
					local itemType = jass.GetItemTypeId(item)
					--- 图标
					local icon = code.YDWEGetItemDataString(itemType, 1)
					-- 名字
					local name = code.YDWEGetItemDataString(itemType, 4)
					--- 提示
					local text = code.YDWEGetItemDataString(itemType, 2)
					-- 说明
					local intro = code.YDWEGetItemDataString(itemType, 5)
					-- local intro = slk.item[myFunc:Int2ID(itemType)]["Name"]

					tipDialogUp.icon:set_image(icon)
					tipDialogUp.name:set_text(name)
					tipDialogUp.tips:set_text(text)
					tipDialogUp.intro:set_text("|cff696E6E类别 - " .. intro)
					tipDialogUp.panel:reset_allpoint():set_point2("中心", 1900, 284)
					tipDialogUp.panel:set_show(true)
				end
				unit = nil
				item = nil
			end)
		end
	end


	--左上角按钮
	ysui['系统按钮'][1]:reset_allpoint():set_wh(160, 40):set_point2('顶部', 0, 0)
	ysui['系统按钮'][2]:reset_allpoint():set_wh(160, 40):set_point2('顶部', 280, 1080)
	ysui['系统按钮'][3]:reset_allpoint():set_wh(160, 40):set_point2('顶部', 475, 1080)
	ysui['系统按钮'][4]:reset_allpoint():set_wh(160, 40):set_point2('顶部', 670, 1080)

	--英雄头像
	ac.time(0.01, 1, function()
		ysui['英雄头像'][1]:reset_allpoint():set_wh(80, 70):set_point2('中心', 48, 1000)
		ysui['英雄血条'][1]:set_wh(74, 7)
		ysui['英雄蓝条'][1]:set_wh(74, 7)
	end)

	ac.time(0.01, 1, function()
		for a = 2, 7 do
			ysui['英雄头像'][a]:reset_allpoint():set_wh(0.001, 0.001):set_point2('右上', 0, 0)
		end
	end)


	ysui["物品提示"]:reset_allpoint():set_point2('中心', 960, 195)

	ysui["物品说明"]:reset_allpoint():set_point2('中心', -1000, -1000)

	-- 助手头像
	ysui['助手头像']:set_wh(64, 64):reset_allpoint():set_point2('中心', 40, 300)

	-- 英雄称谓
	ysui['单位面板']['英雄称谓']:reset_allpoint():set_wh(500, 50):set_point2('中心', 960, 225)

	-- 单位名字
	ysui['单位面板']['单位名字']:reset_allpoint():set_point2('中心', 960, 195)
	-- 经验条
	ysui['单位面板']['经验条']:reset_allpoint():set_wh(385, 25):set_point2('中心', 960, 195)

	-- 生命周期
	ysui['单位面板']['生命周期']:reset_allpoint():set_wh(315, 25):set_point2('中心', 980 - 28, 195)

	-- 小地图按钮
	for a = 1, 5 do
		ysui['小地图按钮'][5 + 1 - a]:reset_allpoint():set_wh(24, 24):set_point2('中心', 280, 90 + (a - 1) * 33)
		japi.FrameShow(ysui['小地图按钮'][5 + 1 - a].handle, true)
	end

	-- 小地图
	ysui['小地图']:reset_allpoint():set_wh(230, 230):set_point('中心', gameui, '中心', -800, -405)

	-- 唠嗑框
	ysui['聊天消息']:reset_allpoint():set_wh(500, 185):set_point('中心', gameui, '中心', -700, 0)

	-- 单位属性面板
	-- 攻击-图标
	ysui['单位面板']['攻击']['图标']:reset_allpoint():set_wh(64, 64):set_point2('中心', 790, 2500)
	-- 攻击-数值
	ysui['单位面板']['攻击']['数值']:reset_allpoint():set_point2('中心', 2500, 130)
	-- 护甲-图标
	ysui['单位面板']['护甲']['图标']:reset_allpoint():set_wh(64, 64):set_point2('中心', 790, 2500)
	-- 主属性-图标
	ysui['单位面板']['主属性']['图标']:reset_allpoint():set_wh(64, 64):set_point2('中心', 1020, 2500)
	-- 力量-文本
	ysui['单位面板']['力量']['名字']:reset_allpoint():set_point2('左侧', 1060, 2500)
	-- 力量-数值
	ysui['单位面板']['力量']['数值']:reset_allpoint():set_point2('中心', 2500, 130)
	-- 敏捷-文本
	ysui['单位面板']['敏捷']['名字']:reset_allpoint():set_point2('左侧', 1060, 2500)
	-- 敏捷-数值
	ysui['单位面板']['敏捷']['数值']:reset_allpoint():set_point2('中心', 2500, 130)
	-- 智力-文本
	ysui['单位面板']['智力']['名字']:reset_allpoint():set_point2('左侧', 1060, 2500)
	-- 智力-数值
	ysui['单位面板']['智力']['数值']:reset_allpoint():set_point2('中心', 2500, 130)


	-- -- 资源属性面板
	local resources = { '主要控件', 1, 2, 3, 4 }
	local positions = { 1055, 1060, 1060, 1060, 1055 }
	for i, res in ipairs(resources) do
		ysui['资源面板'][res]:reset_allpoint():set_wh(80, 50):set_point2('中心', 1150 + (i - 1) * 100, 1000 + positions[i])
	end


	--BUFF图标调出
	ac.time(0.01, 1, function()
		for i = 1, 8 do
			local x = i * 26
			ysui['BUFF'][i]:reset_allpoint():set_wh(25, 25):set_point2('中心', 815 + x, 26):set_show(true)
		end
	end)
end

--技能冷却UI

local buttonCooldownSet = {} -- 用于跟踪按钮CD模型是否已经设置的表
buttonCooldownSet.x = 0

-- 创建一个函数来设置CD模型
local function SetButtonCooldownModel(frame, t)
	local model = japi.FrameGetButtonCooldownModel(frame)
	if not buttonCooldownSet[model] then
		buttonCooldownSet[model] = true -- 设置按钮CD模型后，将状态设置为已设置
		japi.FrameSetModelScale(model, 0.71, 0.95, 1.0)
		japi.FrameClearAllPoints(model)
		japi.FrameSetPoint(model, 0, frame, 0, 0.0, 0.0)
		japi.FrameSetPoint(model, 8, frame, 8, 0.0, 0.0)
		buttonCooldownSet.x = buttonCooldownSet.x + 1
		if buttonCooldownSet.x >= 12 then t:rem() end
	end
end

-- 技能CD冷却模型


-- 初始化触发器

local t = ac.time(0.5, function(t)
	for y = 0, 3 do
		for x = 0, 2 do
			local frame = japi.FrameGetCommandBarButton(x, y)
			if frame > 0 then
				SetButtonCooldownModel(frame, t)
			end
		end
	end
end)


--单位组问题

local function zcdw()
	local FrameUI_DWZ     = {}

	local processedFrames = {} -- 用于记录已经处理过的FrameUI_DWZ索引
	processedFrames.x     = 0

	local t               = ac.time(0.5, function(t)
		local x = 30
		local y = 0
		local a = 0
		local b = 0
		local c1, c2 = x / (1920 * 0.8), x / (1080 * 0.6)
		local x2, y2 = 0, 0
		for i = 1, 12 do
			FrameUI_DWZ[i] = japi.FrameGetInfoSelectButton(i - 1)
			a = a + 1
			if a >= 7 then
				y = 30
				b = 6
			end
			-- 进行条件判断，确保FrameUI_DWZ[i]大于0且未被处理过
			if FrameUI_DWZ[i] > 0 and not processedFrames[i] then
				japi.FrameClearAllPoints(FrameUI_DWZ[i])
				x2 = (420 + ((x * 1.8) * (i - b)))
				y2 = (60 - y)
				japi.FrameSetAbsolutePoint(FrameUI_DWZ[i], 4, x2 / (1920 * 0.8), y2 / (1080 * 0.6))
				japi.FrameSetSize(FrameUI_DWZ[i], c1, c2)
				processedFrames[i] = true -- 记录已经处理过
				processedFrames.x = processedFrames.x + 1
				if processedFrames.x >= 12 then t:rem() end
			end
		end
	end)
end
--加个计时器怕优先级问题
ac.time(0.5, 1, zcdw)


local ffi = require "ffi"
local handle = ffi.cast("int *", japi.GetGameUI() + 249 * 4)[0]
--print(handle)
japi.FrameClearAllPoints(handle)
japi.FrameSetAbsolutePoint(handle, 4, 0.38, 0.2)

init()
