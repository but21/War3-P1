local BaseModule = require "my_base.base_module_manager"
local code       = require "jass.code"
local jass       = require "jass.common"
local myFunc     = BaseModule.MyFunc
local uiCreate   = BaseModule.UICreate
local common     = BaseModule.Common
local archive    = BaseModule.Archive
local tipDown    = BaseModule.UITipDialog.tipDialogDown
local excel      = excel

local players    = jass.udg_Player
local font       = "fonts\\LXWK_Bold.ttf"
local japi       = require "jass.japi"
local shadowIcon = [[UI\Widgets\ToolTips\Human\human-tooltip-background.blp]]

local Activity   = {}
local ui         = {}
Activity.ui      = ui

function Activity:Init()
	ui.highlightIcon = uiCreate:CreateUIAbsolute("image", gameui, "中心", 0, 0, 1, 1, { image = "Survival\\UI\\highlight.tga", alpha = 0.7, isShow = false })
	ui.highlightIcon:set_level(2)
	ui.panelList   = {}
	ui.currentList = 1


	local function CategoryInit()
		local column, totalRow = 1, 1
		local w, h, h_view = 100, 42, 520
		local d = 15
		local wBtn, hBtn = 55, 55
		local xBtn, yBtn = 385 + 55 * 2, 215 -- 功能按钮绝对位置
		local frame = [[Survival\UI\Archive\option.tga]]

		local OpenUI = {}
		OpenUI["Panel"] = gameui:builder 'panel' { w = 1, h = 1, xy = { '中心', 0, 0 }, show = true }
		OpenUI["Panel"]:set_point2("中心", xBtn, yBtn)
		OpenUI["Icon"] = OpenUI["Panel"]:builder "image" { w = wBtn, h = hBtn, xy = { "中心", OpenUI["Panel"], "中心", 0, 0 }, image = [[Survival\UI\Archive\activity.tga]] }
		OpenUI["Button"] = OpenUI["Icon"]:builder "button" { w = wBtn, h = hBtn, xy = { "中心", OpenUI["Icon"], "中心", 0, 0 } }
		local uiButton = OpenUI["Button"]
		uiButton:event "点击" (function()
			ui.panel:set_show(not ui.panel._show)
		end)

		ui.panel = gameui:builder 'panel' { w = 1, h = 1, xy = { '中心', 0, 0 }, show = false }
		ui.panel:set_point2("中心", 960, 930)
		ui.background = ui.panel:builder 'image' { w = 1060, h = 650, xy = { "顶部", ui.panel, "中心", 0, 0 }, image = [[Survival\UI\Archive\background.tga]] }
		japi.FrameSetIgnoreTrackEvents(ui.background.handle, false)
		ui.title = ui.background:builder "image" { w = 300, h = 128, xy = { "中心", ui.background, "顶部", 0, 0 }, image = [[Survival\UI\Archive\Activity\title.tga]] }


		ui.closeIcon = ui.panel:builder 'image' { w = 50, h = 50, xy = { "中心", ui.background, "右上", -10, -10 }, image = [[Survival\UI\Archive\close.tga]] }
		ui.closeBtn = ui.closeIcon:builder 'button' { w = 50, h = 50, xy = { "中心", ui.closeIcon, "中心", 0, 0 } }
		ui.closeBtn:event "点击" (function()
			ui.panel:set_show(false)
		end)

		ui.categoryPanel = ui.background:builder 'button' { w = w, h = h_view, xy = { '左侧', ui.background, '左侧', 65, -2 } }
		japi.FrameSetViewPort(ui.categoryPanel.handle, true)
		ui.slots = {}
		ui.slotsName = {}
		ui.slotsBtn = {}
		for i = 1, totalRow do
			for j = 1, column do
				ui.slots[i] = ui.categoryPanel:builder 'image' { w = w, h = h, xy = { '中心', ui.categoryPanel, '中心',
					0, (h_view - h) / 2 - (i - 1) * (d + h) - 25 }, image = frame, alpha = 1 }
				ui.slotsName[i] = ui.slots[i]:builder 'text' { w = w, h = 0, xy = { '中心', ui.slots[i], '中心', 0, 0 },
					font = { font, 25, 1, align = "居中" } }
				ui.slotsBtn[i] = ui.slots[i]:builder 'button' { w = w, h = h, xy = { "中心", ui.slots[i], "中心", 0, 0 } }
				ui.slotsBtn[i]:event '进入' (function()
					ui.slots[i]:set_image([[Survival\UI\Archive\optionHl.tga]])
				end)
				ui.slotsBtn[i]:event '离开' (function()
					if i ~= ui.currentList then
						ui.slots[i]:set_image(frame)
					end
				end)
				ui.slotsBtn[i]:event '点击' (function()
					if i <= #ui.panelList and i ~= ui.currentList then
						ui.slots[ui.currentList]:set_image(frame)
						ui.slots[i]:set_image [[Survival\UI\Archive\optionHl.tga]]
						ui.panelList[ui.currentList]:set_show(false)
						ui.currentList = i
						ui.panelList[ui.currentList]:set_show(true)
					end
				end)
			end
		end
		ui.slots[1]:set_image([[Survival\UI\Archive\optionHl.tga]])
		ui.slotsName[1]:set_text("暑假活动")
	end

	local function SummerTimeInit()
		local w, h = 70, 70
		local d = 14
		local frame = [[StarRail\star_3.tga]]
		ui.summerTime = {}
		ui.summerTime.firstIndex = 500
		ui.summerTime.count = 10
		local firstIndex, count = ui.summerTime.firstIndex, ui.summerTime.count
		local column = 6
		local row = math.ceil(count / column)
		row = math.min(row, 6)

		ui.summerTime.panel = ui.background:builder 'panel' { w = 750, h = 500, xy = { '中心', ui.background, '中心', 110, 0 } }
		ui.panelList[#ui.panelList + 1] = ui.summerTime.panel
		ui.summerTime.view = ui.summerTime.panel:builder 'button' { w = 750, h = 500, xy = { '中心', ui.summerTime.panel, '中心', 0, 0 } }
		ui.summerTime.slots = {}
		ui.summerTime.slotsBtn = {}
		ui.summerTime.shadowIcon = {}
		local function ShowTip(btn)
			local index = btn.index
			local playerID = common:GetLocalPlayerID()
			local id = firstIndex + index
			local name = excel["存档"][id]["Name"]
			local icon = excel["存档"][id]["Icon"]
			tipDown.name:set_text(name)
			local tip = "奖励: " .. excel["存档"][id]["Value2"] .. "|n|n" .. excel["存档"][id]["Condition"] .. " " .. excel["存档"][id]["Value1"]
			tip = tip .. "|n|n当前点数: " .. archive:LoadInt(playerID, "summerTimeP")
			tip = myFunc:SetNumColor(tip, "|cfaffff00", "|r")
			tipDown.tips:set_text(tip)
			tipDown.intro:set_text("")
			tipDown.icon:set_image(icon)
			tipDown.panel:rem_allpoint():set_point("中心", btn, "右上", 16, -13)
			tipDown.panel:set_show(true)
			ui.highlightIcon:set_wh(btn:get_wh())
			ui.highlightIcon:rem_allpoint():set_point("中心", btn, "中心", 0, 0)
			ui.highlightIcon:set_show(true)
		end
		local function CloseTip()
			tipDown.panel:set_show(false)
			ui.highlightIcon:set_show(false)
		end
		for i = 1, row do
			for j = 1, column do
				local l = (i - 1) * column + j
				if l > count then
					break
				end
				if j == 1 then
					ui.summerTime.slots[l] = ui.summerTime.view:builder 'image' { w = w, h = h, xy = { '中心', ui.summerTime.view, '中心',
						-160 - math.floor(column / 2) * (d + w), 200 - (i - 1) * (d + h) }, image = frame }
				else
					ui.summerTime.slots[l] = ui.summerTime.view:builder 'image' { w = w, h = h, xy = { '中心', ui.summerTime.slots[l - 1], '中心', w + d, 0 }, image = frame }
				end
				ui.summerTime.shadowIcon[l] = ui.summerTime.slots[l]:builder 'image' { w = w, h = h, xy = { '中心', ui.summerTime.slots[l], '中心', 0, 0 }, image = shadowIcon, alpha = 0.7 }
				ui.summerTime.slotsBtn[l] = ui.summerTime.slots[l]:builder 'button' { w = w, h = h, xy = { "中心", ui.summerTime.slots[l], "中心", 0, 0 } }
				ui.summerTime.slotsBtn[l].index = l

				ui.summerTime.slotsBtn[l]:event('进入')(ShowTip)
				ui.summerTime.slotsBtn[l]:event('离开')(CloseTip)
			end
		end
		-- 文本框, 提示文本
		ui.summerTime.introBg = uiCreate:CreateUIRelative("image", ui.summerTime.panel, "右上", ui.summerTime.view, "右上", -10, -14, 300, 300, {
			alpha = 0.7,
			image = [[Survival\UI\SeizeBody\textBg.tga]]
		})
		ui.summerTime.introText = uiCreate:CreateUIRelative("text", ui.summerTime.introBg, "左上", ui.summerTime.introBg, "左上", 10, -10, 280, 0, { font = font, fontSize = 22, align = "左侧" })
		ui.summerTime.introText:set_text("活动介绍:|n|n每次通关可获得1点暑假活动点数，每日最多获得1点。|n|n每获得一定活动点数可获得对应奖励，激活所有奖励后不再获得活动点数。")
	end

	CategoryInit()
	SummerTimeInit()
end

return Activity
