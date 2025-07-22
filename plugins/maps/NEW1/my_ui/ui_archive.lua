local BaseModule      = require "my_base.base_module_manager"
local code            = require "jass.code"
local jass            = require "jass.common"
local players         = jass.udg_Player
local myFunc          = BaseModule.MyFunc
local uiCreate        = BaseModule.UICreate
local common          = BaseModule.Common
local archive         = BaseModule.Archive
local tipOnlyTextDown = BaseModule.UITipDialog.tipOnlyTextDown
local tipDown         = BaseModule.UITipDialog.tipDialogDown
local excel           = excel

local font            = "fonts\\LXWK_Bold.ttf"
local japi            = require "jass.japi"
local shadowIcon      = [[UI\Widgets\ToolTips\Human\human-tooltip-background.blp]]

local ArchiveUI       = {}
local ui              = {}
ArchiveUI.ui          = ui

function ArchiveUI:Init()
	ui.panelList     = {}
	ui.currentList   = 1

	ui.highlightIcon = uiCreate:CreateUIAbsolute("image", gameui, "中心", 0, 0, 1, 1, { image = "Survival\\UI\\highlight.tga", alpha = 0.7, isShow = false })
	ui.highlightIcon:set_level(2)

	local function UIArchiveInit()
		local wBtn, hBtn = 55, 55
		local xBtn, yBtn = 385 + 55 * 1, 215
		local column, totalRow = 1, 4
		local frame = [[Survival\UI\Archive\option.tga]]
		local w, h, h_view = 100, 42, 520
		local d = 15

		local OpenUI = {}
		OpenUI["父控件"] = gameui:builder 'panel' { w = 1, h = 1, xy = { '中心', 0, 0 }, show = true }
		OpenUI["父控件"]:set_point2("中心", xBtn, yBtn)
		OpenUI["存档图标"] = OpenUI["父控件"]:builder "image" { w = wBtn, h = hBtn, xy = { "中心", OpenUI["父控件"], "中心", 0, 0 }, image = [[Survival\UI\Archive\handbook.tga]] }
		OpenUI["存档按钮"] = OpenUI["存档图标"]:builder "button" { w = wBtn, h = hBtn, xy = { "中心", OpenUI["存档图标"], "中心", 0, 0 } }
		local uiButton = OpenUI["存档按钮"]
		uiButton:event "点击" (function()
			ui.panel:set_show(not ui.panel._show)
		end)
		uiButton:event "进入" (function()
			-- OpenUI["存档图标"]:set_image([[GS\UI\SavePoints\iconHl.tga]])
		end)
		uiButton:event "离开" (function()
			-- OpenUI["存档图标"]:set_image([[GS\UI\SavePoints\icon.tga]])
		end)


		ui.panel = gameui:builder 'panel' { w = 1, h = 1, xy = { '中心', 0, 0 }, show = false }
		ui.panel:set_point2("中心", 960, 605)

		ui.background = ui.panel:builder 'image' { w = 1060, h = 650, xy = { "中心", ui.panel, "中心", 0, 0 }, image = [[Survival\UI\Archive\background.tga]] }
		japi.FrameSetIgnoreTrackEvents(ui.background.handle, false)

		ui.closeIcon = ui.panel:builder 'image' { w = 50, h = 50, xy = { "中心", ui.background, "右上", -10, -10 }, image = [[Survival\UI\Archive\close.tga]] }
		ui.closeBtn = ui.closeIcon:builder 'button' { w = 50, h = 50, xy = { "中心", ui.closeIcon, "中心", 0, 0 } }
		ui.closeBtn:event "进入" (function()
			-- ui.closeIcon:set_image([[GS\UI\Refine\closeHl.tga]])
		end)
		ui.closeBtn:event "离开" (function()
			-- ui.closeIcon:set_image([[GS\UI\Refine\close.tga]])
		end)
		ui.closeBtn:event "点击" (function()
			ui.panel:set_show(false)
		end)

		ui.title = ui.background:builder "image" { w = 300, h = 128, xy = { "中心", ui.background, "顶部", 0, 0 }, image = [[Survival\UI\Archive\handbookTitle.tga]] }
		ui.categoryPanel = ui.background:builder 'button' { w = w, h = h_view, xy = { '左侧', ui.background, '左侧', 55, -2 } }
		japi.FrameSetViewPort(ui.categoryPanel.handle, true)
		ui.slots = {}
		ui.slotsName = {}
		ui.slotsBtn = {}
		for i = 1, totalRow do
			for j = 1, column do
				ui.slots[i] = ui.categoryPanel:builder 'image' { w = w, h = h, xy = { '中心', ui.categoryPanel, '中心',
					0, (h_view - h) / 2 - (i - 1) * (d + h) - 25 }, image = frame, alpha = 1 }
				ui.slotsName[i] = ui.slots[i]:builder 'text' { w = w, h = 0, xy = { '中心', ui.slots[i], '中心', 0, 0 },
					font = { font, 22, 1, align = "居中" } }
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
		ui.slotsName[1]:set_text("地图福利")
		ui.slotsName[2]:set_text("地图成就")
		ui.slotsName[3]:set_text("地图等级")
		ui.slotsName[4]:set_text("通关奖励")


		ui.perDayLimitIcon = ui.background:builder "image" { w = 80, h = 30, xy = { "左下", ui.background, "左上", 0, 0 }, image = frame }
		ui.perDayLimitBtn = ui.perDayLimitIcon:builder "button" { w = 80, h = 30, xy = { "中心", ui.perDayLimitIcon, "中心", 0, 0 } }
		uiButton = ui.perDayLimitBtn
		uiButton:event "进入" (function()
			local player = common:GetLocalPlayer()
			-- local tip = require "界面.UI-卡牌".miniCardTip
			tipOnlyTextDown.panel:rem_allpoint():set_point("中心", uiButton, "右上", 18, -15)
			-- tip.name:set_text("存档每日上限")
			local str = {}
			str[#str + 1] = "通关次数:  " .. 15 - archive:GetValueLimit(player, "allWinCount") .. " / " .. "15"
			str[#str + 1] = "天赋点:  " .. 1500 - archive:GetValueLimit(player, "allTalentP") .. " / " .. "1500"
			str[#str + 1] = "熟练点:  " .. 1500 - archive:GetValueLimit(player, "allHeroExp") .. " / " .. "1500"
			str[#str + 1] = "寻宝点:  " .. 1500 - archive:GetValueLimit(player, "allTHP") .. " / " .. "1500"
			tipOnlyTextDown.panel:set_show(true)
			tipOnlyTextDown.tips:set_text(table.concat(str, "|n"))
			ui.perDayLimitIcon:set_image([[Survival\UI\Archive\optionHl.tga]])
		end)
		uiButton:event "离开" (function()
			local tip = BaseModule.UITipDialog.tipOnlyTextDown
			tip.panel:set_show(false)
			ui.perDayLimitIcon:set_image(frame)
		end)
		ui.perDayLimitText = ui.perDayLimitIcon:builder "text" { w = 100, h = 0, xy = { "中心", ui.perDayLimitIcon, "中心", 0, 0 }, font = { font, 18, align = "居中" } }:set_text("每日上限")
	end


	local function UIWelfareInit()
		local w, h = 70, 70
		local d = 14
		local frame = [[StarRail\star_3.tga]]
		ui.welfare = {}
		ui.welfare.firstIndex = 0
		ui.welfare.count = 25
		local firstIndex, count = ui.welfare.firstIndex, 25
		local column = 10
		local row = math.ceil(count / column)
		row = math.min(row, 6)

		ui.welfare.panel = ui.background:builder 'panel' { w = 750, h = 500, xy = { '中心', ui.background, '中心', 100, 0 } }
		ui.panelList[#ui.panelList + 1] = ui.welfare.panel
		ui.welfare.view = ui.welfare.panel:builder 'button' { w = 750, h = 500, xy = { '中心', ui.welfare.panel, '中心', 0, 0 } }
		ui.welfare.slots = {}
		ui.welfare.slotsBtn = {}
		ui.welfare.shadowIcon = {}
		local function ShowTip(btn)
			ui.highlightIcon:set_wh(btn:get_wh())
			ui.highlightIcon:rem_allpoint():set_point("中心", btn, "中心", 0, 0)
			ui.highlightIcon:set_show(true)
			local index = btn.index
			local name = excel["存档"][index + firstIndex]["Name"]
			local icon = excel["存档"][index + firstIndex]["Icon"]
			local tip = excel["存档"][index + firstIndex]["Tip"]
			local condition = excel["存档"][index + firstIndex]["Condition"]
			tipDown.name:set_text(name)
			tipDown.icon:set_image(icon)
			tipDown.intro:set_text("")
			tipDown.tips:set_text(tip .. "|n|n" .. condition)
			tipDown.panel:rem_allpoint():set_point("中心", btn, "右上", 15, -15)
			tipDown.panel:set_show(true)
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
					-- ui.welfare.slots[l]:set_show(false)
				end
				if j == 1 then
					ui.welfare.slots[l] = ui.welfare.view:builder 'image' { w = w, h = h, xy = { '中心', ui.welfare.view, '中心', -math.floor(column / 2) * (d + w), 200 - (i - 1) * (d + h) },
						image = frame }
				else
					ui.welfare.slots[l] = ui.welfare.view:builder 'image' { w = w, h = h, xy = { '中心', ui.welfare.slots[l - 1], '中心', w + d, 0 }, image = frame }
				end
				ui.welfare.shadowIcon[l] = ui.welfare.slots[l]:builder 'image' { w = w, h = h, xy = { '中心', ui.welfare.slots[l], '中心', 0, 0 }, image = shadowIcon, alpha = 0.7 }
				ui.welfare.slotsBtn[l] = ui.welfare.slots[l]:builder 'button' { w = w, h = h, xy = { "中心", ui.welfare.slots[l], "中心", 0, 0 } }
				ui.welfare.slotsBtn[l].index = l

				ui.welfare.slotsBtn[l]:event('进入')(ShowTip)
				ui.welfare.slotsBtn[l]:event('离开')(CloseTip)
			end
		end
	end

	local function UIEffortInit()
		local w, h = 70, 70
		local d = 18
		local frame = [[StarRail\star_3.tga]]
		ui.effort = {}
		ui.effort.firstIndex = 0
		local firstIndex, count = ui.effort.firstIndex, 25
		local column = 10
		local row = math.ceil(count / column)
		row = math.min(row, 6)

		ui.effort.panel = ui.background:builder 'panel' { w = 750, h = 500, xy = { '中心', ui.background, '中心', 100, 0 }, show = false }
		ui.panelList[#ui.panelList + 1] = ui.effort.panel
	end

	local function UIMapLvInit()
		local w, h = 70, 70
		local d = 18
		local frame = [[StarRail\star_3.tga]]
		ui.mapLv = {}
		ui.mapLv.firstIndex = 0
		local firstIndex, count = ui.mapLv.firstIndex, 25
		local column = 10
		local row = math.ceil(count / column)
		row = math.min(row, 6)

		ui.mapLv.panel = ui.background:builder 'panel' { w = 750, h = 500, xy = { '中心', ui.background, '中心', 100, 0 }, show = false }
		ui.panelList[#ui.panelList + 1] = ui.mapLv.panel
	end

	local function UIWinCountInit()
		local w, h = 70, 70
		local d = 14
		local frame = [[StarRail\star_3.tga]]
		ui.winCount = {}
		ui.winCount.firstIndex = 100
		ui.winCount.count = 34
		local firstIndex, count = ui.winCount.firstIndex, ui.winCount.count
		local column = 10
		local row = math.ceil(count / column)
		row = math.min(row, 6)

		ui.winCount.panel = ui.background:builder 'panel' { w = 750, h = 500, xy = { '中心', ui.background, '中心', 100, 0 }, show = false }
		ui.panelList[#ui.panelList + 1] = ui.winCount.panel
		ui.winCount.view = ui.winCount.panel:builder 'button' { w = 750, h = 500, xy = { '中心', ui.winCount.panel, '中心', 0, 0 } }
		ui.winCount.slots = {}
		ui.winCount.slotsBtn = {}
		ui.winCount.shadowIcon = {}
		local function ShowTip(btn)
			local playerID = common:GetLocalPlayerID()
			ui.highlightIcon:set_wh(btn:get_wh())
			ui.highlightIcon:rem_allpoint():set_point("中心", btn, "中心", 0, 0)
			ui.highlightIcon:set_show(true)
			local index = btn.index
			local id = index + firstIndex
			local name = excel["存档"][id]["Name"]
			local icon = excel["存档"][id]["Icon"]
			local tip = excel["存档"][id]["Tip"]
			local condition = excel["存档"][id]["Condition"]
			tipDown.name:set_text(name)
			tipDown.icon:set_image(icon)
			tipDown.intro:set_text("")
			if index == 1 then
				tipDown.tips:set_text(tip .. "|n|n总通关次数: " .. archive:LoadInt(playerID, "allWinCount"))
			else
				local winCount = archive:LoadStr(playerID, "winCount")
				local sep = "|"
				local needDiff = excel["存档"][id]["Value3"]
				local result = myFunc:SplitGetValue(winCount, sep, needDiff)
				tipDown.tips:set_text(tip .. "|n|n" .. condition .. "|n已通过次数:" .. result)
			end
			tipDown.panel:rem_allpoint():set_point("中心", btn, "右上", 15, -15)
			tipDown.panel:set_show(true)
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
					-- ui.winCount.slots[l]:set_show(false)
				end
				if j == 1 then
					ui.winCount.slots[l] = ui.winCount.view:builder 'image' { w = w, h = h, xy = { '中心', ui.winCount.view, '中心',
						-math.floor(column / 2) * (d + w), 200 - (i - 1) * (d + h) }, image = frame }
				else
					ui.winCount.slots[l] = ui.winCount.view:builder 'image' { w = w, h = h, xy = { '中心', ui.winCount.slots[l - 1], '中心',
						w + d, 0 }, image = frame }
				end
				ui.winCount.shadowIcon[l] = ui.winCount.slots[l]:builder 'image' { w = w, h = h, xy = { '中心', ui.winCount.slots[l], '中心',
					0, 0 }, image = shadowIcon, alpha = 0.7 }
				ui.winCount.slotsBtn[l] = ui.winCount.slots[l]:builder 'button' { w = w, h = h, xy = { "中心", ui.winCount.slots[l], "中心",
					0, 0 } }
				ui.winCount.slotsBtn[l].index = l

				ui.winCount.slotsBtn[l]:event('进入')(ShowTip)
				ui.winCount.slotsBtn[l]:event('离开')(CloseTip)
			end
		end
	end

	UIArchiveInit()
	UIWelfareInit()
	UIEffortInit()
	UIMapLvInit()
	UIWinCountInit()
end

function code.KillArchiveBoss(bossID)
	if bossID == 180 then
		local point = 100 + (jass.udg_GameDifficulty - 1) * 10
		for playerID, player in ipairs(players) do
			if player > 0 then
				local limit = archive:GetValueLimit(player, "allTalentP")
				print("天赋点: 限额, 奖励", limit, point)
				point = math.min(limit, point)
				archive:SaveInt(playerID, "talentP", archive:LoadInt(playerID, "talentP") + point)
				archive:SaveInt(playerID, "allTalentP", archive:LoadInt(playerID, "allTalentP") + point)
				code.AddMessage(playerID, "获得天赋点数: " .. point)
			end
		end
	end
	if bossID == 181 then
		local point = 100 + (jass.udg_GameDifficulty - 1) * 10
		for playerID, player in ipairs(players) do
			if player > 0 then
				local limit = archive:GetValueLimit(player, "allHeroExp")
				print("熟练点: 限额, 奖励", limit, point)
				point = math.min(limit, point)
				archive:SaveInt(playerID, "heroExp", archive:LoadInt(playerID, "heroExp") + point)
				archive:SaveInt(playerID, "allHeroExp", archive:LoadInt(playerID, "allHeroExp") + point)
				code.AddMessage(playerID, "获得熟练点数: " .. point)
			end
		end
	end
end

return ArchiveUI
