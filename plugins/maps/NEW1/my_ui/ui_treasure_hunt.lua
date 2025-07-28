local BaseModule      = require "my_base.base_module_manager"
local code            = require "jass.code"
local jass            = require "jass.common"
local myFunc          = BaseModule.MyFunc
local uiCreate        = BaseModule.UICreate
local common          = BaseModule.Common
local archive         = BaseModule.Archive
local tipDown         = BaseModule.UITipDialog.tipDialogDown
local excel           = BaseModule.Excel
local tipOnlyTextDown = BaseModule.UITipDialog.tipOnlyTextDown

local players         = jass.udg_Player
local font            = "fonts\\LXWK_Bold.ttf"
local japi            = require "jass.japi"
local shadowIcon      = [[UI\Widgets\ToolTips\Human\human-tooltip-background.blp]]

local TreasureHunt    = {}
local ui              = {}
TreasureHunt.ui       = ui

function TreasureHunt:Init()
	ui.highlightIcon = uiCreate:CreateUIAbsolute("image", gameui, "中心", 0, 0, 1, 1, { image = "Survival\\UI\\highlight.tga", alpha = 0.7, isShow = false })
	ui.highlightIcon:set_level(2)

	local wBtn, hBtn = 55, 55
	local xBtn, yBtn = 385 + 55 * 1, 215 - 55 * 1 -- 功能按钮绝对位置

	local OpenUI = {}
	OpenUI["Panel"] = gameui:builder 'panel' { w = 1, h = 1, xy = { '中心', 0, 0 }, show = true }
	OpenUI["Panel"]:set_point2("中心", xBtn, yBtn)
	OpenUI["Icon"] = OpenUI["Panel"]:builder "image" { w = wBtn, h = hBtn, xy = { "中心", OpenUI["Panel"], "中心", 0, 0 }, image = [[Survival\UI\Archive\treasureHunt.tga]] }
	OpenUI["Button"] = OpenUI["Icon"]:builder "button" { w = wBtn, h = hBtn, xy = { "中心", OpenUI["Icon"], "中心", 0, 0 } }
	local uiButton = OpenUI["Button"]
	uiButton:event "点击" (function()
		ui.panel:set_show(not ui.panel._show)
	end)

	ui.panel = gameui:builder 'panel' { w = 1, h = 1, xy = { '中心', 0, 0 }, show = false }
	ui.panel:set_point2("中心", 960, 900)
	ui.background = ui.panel:builder 'image' { w = 1060 * 0.8, h = 650 * 0.8, xy = { "顶部", ui.panel, "中心", 0, 0 }, image = [[Survival\UI\Archive\background.tga]] }
	japi.FrameSetIgnoreTrackEvents(ui.background.handle, false)
	-- ui.title = uiCreate:CreateUIRelative("text", ui.background, "顶部", ui.background, "顶部", 0, -20, 300, 0, { font = font, align = "居中", fontSize = 30, text = "挂机寻宝" })
	ui.title = ui.background:builder "image" { w = 300 * 0.7, h = 128 * 0.7, xy = { "中心", ui.background, "顶部", 0, 0 }, image = [[Survival\UI\Archive\TreasureHunt\title.tga]] }
	ui.points = uiCreate:CreateUIRelative("text", ui.background, "右上", ui.background, "右上", -50, -40, 200, 0, { font = font, align = "右侧", fontSize = 20, text = "寻宝点: 0" })

	ui.infoBg = uiCreate:CreateUIRelative("image", ui.background, "顶部", ui.background, "顶部", 0, -80, 320, 340, { image = [[Survival\UI\SeizeBody\textBg.tga]] })
	ui.allLvText = uiCreate:CreateUIRelative("text", ui.infoBg, "左上", ui.infoBg, "左上", 10, -10, 300, 0, { font = font, fontSize = 25, align = "左侧" })
	ui.allLvText:set_text("寻宝总等级: |cfaffff000")
	ui.allLvRewardsText = uiCreate:CreateUIRelative("text", ui.infoBg, "左上", ui.allLvText, "左下", 0, -20, 300, 0, { font = font, fontSize = 20, align = "左侧" })

	-- ui.closeIcon = ui.background:builder 'image' { w = 40, h = 40, xy = { "中心", ui.background, "右上", 0, 0 }, image = [[GS\UI\Refine\close.tga]] }
	ui.closeIcon = ui.background:builder 'image' { w = 40, h = 40, xy = { "中心", ui.background, "右上", -10, -10 }, image = [[Survival\UI\Archive\close.tga]] }
	ui.closeBtn = ui.closeIcon:builder 'button' { w = 40, h = 40, xy = { "中心", ui.closeIcon, "中心", 0, 0 } }
	ui.closeBtn:event "点击" (function()
		ui.panel:set_show(false)
	end)

	ui.huntIcon = uiCreate:CreateUIRelative("image", ui.background, "底部", ui.background, "底部", 0, 40, 105, 53, { image = [[Survival\UI\Archive\TreasureHunt\click.tga]] })
	ui.huntText = uiCreate:CreateUIRelative("text", ui.huntIcon, "中心", ui.huntIcon, "中心", 0, 0, 100, 0, { font = font, fontSize = 20, align = "居中", text = "点击寻宝" })
	ui.huntBtn = uiCreate:CreateUIRelative("button", ui.huntIcon, "中心", ui.huntIcon, "中心", 0, 0, 105, 53)
	ui.huntBtn:event("进入")(function(btn)
		local playerID = common:GetLocalPlayerID()
		tipOnlyTextDown.panel:reset_allpoint()
		tipOnlyTextDown.panel:set_point("中心", btn, "右上", 25, -11)
		tipOnlyTextDown.panel:set_show(true)
		local cost = TreasureHunt:CalcP(ui.allLv[playerID])
		tipOnlyTextDown.tips:set_text("消耗|cfaffff00" .. cost .. "|r寻宝点进行一次寻宝")
	end)
	ui.huntBtn:event("离开")(function()
		tipOnlyTextDown.panel:set_show(false)
	end)
	ui.huntBtn:event("点击")(function()
		common:SendSync("TreasureHunt")
	end)
	common:ReceiveSync("TreasureHunt")(function()
		local player = common:GetSyncPlayer()
		local playerID = common:ConvertPlayerToID(player)
		local cost = TreasureHunt:CalcP(ui.allLv[playerID])
		local treasureHuntP = archive:LoadInt(playerID, "treasureHuntP")
		if cost <= treasureHuntP then
			treasureHuntP = treasureHuntP - cost
			archive:SaveInt(playerID, "treasureHuntP", treasureHuntP)
			ui.allLv[playerID] = ui.allLv[playerID] + 1
			local treasureHuntLv = archive:LoadStr(playerID, "treasureHuntLv")
			local result = myFunc:Split(treasureHuntLv, "|")
			local condition = true
			local index = common:GetRandomInt(1, 16)
			if result[index] < 99 then
				condition = false
			end
			while condition do
				index = common:GetRandomInt(1, 16)
				if result[index] < 99 then
					condition = false
				end
			end
			result[index] = result[index] + 1
			archive:SaveStr(playerID, "treasureHuntLv", table.concat(result, "|"))
			if common:IsLocalPlayer(player) then
				cost = TreasureHunt:CalcP(ui.allLv[playerID])
				tipOnlyTextDown.tips:set_text("消耗|cfaffff00" .. cost .. "|r寻宝点进行一次寻宝")
				ui.points:set_text("寻宝点: " .. treasureHuntP)
				ui.slotsLv[index]:set_text(result[index])
				ui.allLvText:set_text("寻宝总等级: |cfaffff00" .. ui.allLv[playerID])
			end
		end
	end)

	local function EnterBtn(btn)
		local index = btn.index
		local id = index + 400
		local name = excel["存档"][id]["Name"]
		local icon = excel["存档"][id]["Icon"]
		local tip = myFunc:SetNumColor(excel["存档"][id]["Tip"], "|cfaffff00", "|r")
		tipDown.name:set_text(name)
		tipDown.tips:set_text(tip)
		tipDown.intro:set_text("")
		tipDown.icon:set_image(icon)
		tipDown.panel:rem_allpoint():set_point("中心", btn, "右上", 16, -13)
		tipDown.panel:set_show(true)
		ui.highlightIcon:set_wh(btn:get_wh())
		ui.highlightIcon:rem_allpoint():set_point("中心", btn, "中心", 0, 0)
		ui.highlightIcon:set_show(true)
	end
	local function LeaveBtn()
		ui.highlightIcon:set_show(false)
		tipDown.panel:set_show(false)
	end
	ui.allLv = { 0, 0, 0, 0 }
	ui.slots = {}
	ui.slotsBtn = {}
	ui.slotsLvBg = {}
	ui.slotsLv = {}
	local w, h = 70, 70
	local d = 18
	local frame = [[StarRail\star_3.tga]]
	local column = 2
	local row = 4
	for i = 1, row do
		for j = 1, column do
			local l = (i - 1) * column + j
			if j == 1 then
				ui.slots[l] = ui.background:builder 'image' { w = w, h = h, xy = { '中心', ui.background, '左上', 200 - math.floor(column / 2) * (d + w), -120 - (i - 1) * (d + h) }, image = frame }
			else
				ui.slots[l] = ui.background:builder 'image' { w = w, h = h, xy = { '中心', ui.slots[l - 1], '中心', w + d, 0 }, image = frame }
			end
			ui.slotsBtn[l] = ui.slots[l]:builder 'button' { w = w, h = h, xy = { "中心", ui.slots[l], "中心", 0, 0 } }
			ui.slotsBtn[l].index = l
			ui.slotsBtn[l]:event("进入")(EnterBtn)
			ui.slotsBtn[l]:event("离开")(LeaveBtn)
			ui.slotsLvBg[l] = uiCreate:CreateUIRelative("image", ui.slots[l], "右下", ui.slots[l], "右下", 0, 0, 15, 15, { image = shadowIcon })
			ui.slotsLv[l] = ui.slots[l]:builder "text" { w = 30, h = 0, xy = { "中心", ui.slotsLvBg[l], '中心', 0, 0 }, font = { font, 13, align = "居中" } }
			ui.slotsLv[l]:set_text(0)

			l = l + 8
			if j == 1 then
				ui.slots[l] = ui.background:builder 'image' { w = w, h = h, xy = { '中心', ui.background, '左上', 730 - math.floor(column / 2) * (d + w), -120 - (i - 1) * (d + h) }, image = frame }
			else
				ui.slots[l] = ui.background:builder 'image' { w = w, h = h, xy = { '中心', ui.slots[l - 1], '中心', w + d, 0 }, image = frame }
			end
			ui.slotsBtn[l] = ui.slots[l]:builder 'button' { w = w, h = h, xy = { "中心", ui.slots[l], "中心", 0, 0 } }
			ui.slotsBtn[l].index = l
			ui.slotsBtn[l]:event("进入")(EnterBtn)
			ui.slotsBtn[l]:event("离开")(LeaveBtn)
			ui.slotsLvBg[l] = uiCreate:CreateUIRelative("image", ui.slots[l], "右下", ui.slots[l], "右下", 0, 0, 15, 15, { image = shadowIcon })
			ui.slotsLv[l] = ui.slots[l]:builder "text" { w = 30, h = 0, xy = { "中心", ui.slotsLvBg[l], '中心', 0, 0 }, font = { font, 13, align = "居中" } }
			ui.slotsLv[l]:set_text(0)
		end
	end



	local baseCost = excel["其它"][15]["Value1"]
	local raiseCost = excel["其它"][15]["Value2"]
	function TreasureHunt:CalcP(lv)
		return baseCost + raiseCost * lv
	end

	function TreasureHunt:CalcPRange(startLv, endLv)
		local gapLv = endLv - startLv
		local val = gapLv * baseCost + (gapLv * (startLv + endLv - 1) / 2) * raiseCost
		return math.floor(val)
	end
end

return TreasureHunt
