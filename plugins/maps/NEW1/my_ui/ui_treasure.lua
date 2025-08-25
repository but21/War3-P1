local jass              = require "jass.common"
local code              = require "jass.code"
local Module            = require "my_base.base_module_manager"
local myFunc            = Module.MyFunc
local common            = Module.Common
local uiCreate          = Module.UICreate
local excel             = require "ac.tyns.excel"
local font              = "fonts\\LXWK_Bold.ttf"
local table             = table
local attrSystem        = Module.AttrSystem
local textTipDown       = Module.UITipDialog.tipOnlyTextDown
local tipDialogUp       = Module.UITipDialog.tipDialogUp

local heros             = jass.udg_Hero
local playerGold        = jass.udg_PlayerGold
local playerKills       = jass.udg_PlayerKills
local playerDiamond     = jass.udg_PlayerDiamond

local Treasure          = {}

local ui                = {}
Treasure.ui             = ui

local ownedTreasures    = {}
local drawTreasurePool  = {}
local drawShowAmount    = { 3, 3, 3, 3 }
local drawAmount        = { 10, 0, 0, 0 }
local refreshCount      = { 10, 0, 0, 0 }
local currentOptions    = {}
Treasure.drawAmount     = drawAmount
Treasure.drawShowAmount = drawShowAmount
Treasure.refreshCount   = refreshCount

local countDown         = 0
local inSelecting       = false

local function InitData()
	for playerID, player in ipairs(jass.udg_Player) do
		currentOptions[playerID] = {}
		drawTreasurePool[playerID] = {}
		ownedTreasures[playerID] = {}
		for i = 1, 20, 1 do
			table.insert(drawTreasurePool[playerID], i + 100)
		end
	end
end

local function OnOptionEnter(btn)
	local w, h = btn:get_wh()
	ui.highlight:set_wh(w, h)
	ui.highlight:reset_allpoint()
	ui.highlight:set_point("中心", btn, "中心", 0, 0)
	ui.highlight:set_show(true)
end
local function OnOptionLeave(btn)
	ui.highlight:set_show(false)
end
local function OnOptionClick(btn)
	local index = btn.index
	local playerID = common:GetLocalPlayerID()
	ui.Hide(drawShowAmount[playerID])
	countDown = 0
	common:SendSync("SelectTreasure", index)
end
local function UIInit()
	local UIModule   = require "my_ui.ui_module_manager"

	local wBtn, hBtn = 60, 60
	local xBtn, yBtn = 1600, 300 -- 功能按钮绝对位置
	ui.openIcon      = uiCreate:CreateUIAbsolute("image", gameui, "中心", 0, 0, wBtn, hBtn, { image = [[]], isShow = false })
	ui.openIcon:set_point2("中心", xBtn, yBtn)
	ui.openButton   = ui.openIcon:builder "button" { w = wBtn, h = hBtn, xy = { "中心", ui.openIcon, "中心", 0, 0 } }
	ui.openAmountBg = uiCreate:CreateUIRelative("image", ui.openIcon, "右下", ui.openIcon, "右下", 0, 0, 15, 15,
		{ image = [[UI\Widgets\ToolTips\Human\human-tooltip-background.blp]], alpha = 0.7 })
	ui.openAmount   = uiCreate:CreateUIRelative("text", ui.openAmountBg, "中心", ui.openAmountBg, "中心", 0, 0, 30, 0, { font = font, fontSize = 15, align = "居中" })
	local uiButton  = ui.openButton
	uiButton:event "点击" (function()
		local playerID = common:GetLocalPlayerID()
		if not inSelecting and drawAmount[playerID] > 0 then
			inSelecting = true
			ui.Show(drawShowAmount[playerID])
			countDown = 15
			ui.countdownText:set_text("倒计时: |cfaffff00" .. countDown .. "|r 秒")
			common:SendSync("TreasureDraw")
		end
	end)

	ui.panel     = uiCreate:CreateUIAbsolute("panel", gameui, "中心", 960, 250, 1, 1)
	ui.highlight = uiCreate:CreateUIAbsolute("image", ui.panel, "中心", 0, 0, 1, 1, { image = "Survival\\UI\\highlight.tga", alpha = 0.7, isShow = false })
	ui.highlight:set_level(2)

	ui.countdownBg = uiCreate:CreateUIRelative("image", ui.panel, "底部", ui.panel, "中心", 0, 600, 200, 50, { image = [[UI\Widgets\ToolTips\Human\human-tooltip-background.blp]], isShow = false })
	ui.countdownText = uiCreate:CreateUIRelative("text", ui.countdownBg, "中心", ui.countdownBg, "中心", 0, 0, 300, 0, { font = font, fontSize = 22, align = "居中" })

	local _refreshW, _refreshH = 100, 50
	ui.refreshBg = uiCreate:CreateUIRelative("image", ui.panel, "中心", ui.panel, "中心", 0, 150, _refreshW, _refreshH, { isShow = false, image = [[Survival\UI\refresh.tga]] })
	ui.refreshBtn = uiCreate:CreateUIRelative("button", ui.refreshBg, "中心", ui.refreshBg, "中心", 0, 0, _refreshW, _refreshH)
	ui.refreshBtn:event "进入" (function(btn)
		local playerID = common:GetLocalPlayerID()
		myFunc:FadeSize({ UI = ui.refreshBg, startP = { _refreshW, _refreshH }, endP = { _refreshW * 1.2, _refreshH * 1.2 }, time = 0.08, ty = "二元出" })
		textTipDown.panel:reset_allpoint()
		textTipDown.panel:set_point("中心", btn, "右上", 25, -11)
		textTipDown.panel:set_show(true)
		local cost = refreshCount[playerID]
		textTipDown.tips:set_text("剩余刷新次数：|cfaffff00" .. cost)
	end)
	ui.refreshBtn:event "离开" (function(btn)
		textTipDown.panel:set_show(false)
		myFunc:FadeSize({ UI = ui.refreshBg, endP = { _refreshW, _refreshH }, startP = { _refreshW * 1.2, _refreshH * 1.2 }, time = 0.08, ty = "二元入" })
	end)
	ui.refreshBtn:event "点击" (function(btn)
		local playerID = common:GetLocalPlayerID()
		if refreshCount[playerID] > 0 then
			textTipDown.tips:set_text("剩余刷新次数：|cfaffff00" .. refreshCount[playerID] - 1)
			common:SendSync("RefreshTreasureDraw")
		end
	end)

	ui.optionBg = {}
	ui.optionBtn = {}
	ui.optionName = {}
	ui.optionTip = {}
	ui.optionIcon = {}

	ui.optionPanel = uiCreate:CreateUIRelative("panel", ui.panel, "中心", ui.panel, "中心", 0, 380, 1, 1)
	local optionWidth, optionHeight = 204, 356

	for i = 1, 4 do
		ui.optionBg[i] = uiCreate:CreateUIRelative("image", ui.optionPanel, "中心", ui.optionPanel, "中心", 0, 0, optionWidth, optionHeight,
			{ isShow = false, image = [[Survival\UI\SeizeBody\background.tga]] })
		ui.optionBtn[i] = uiCreate:CreateUIRelative("button", ui.optionBg[i], "中心", ui.optionBg[i], "中心", 0, 0, optionWidth, optionHeight)
		ui.optionBtn[i].index = i
		ui.optionBtn[i]:event "进入" (OnOptionEnter)
		ui.optionBtn[i]:event "离开" (OnOptionLeave)
		ui.optionBtn[i]:event "点击" (OnOptionClick)
		ui.optionIcon[i] = uiCreate:CreateUIRelative("image", ui.optionBg[i], "顶部", ui.optionBg[i], "顶部", 0, -10, 60, 60)
		ui.optionName[i] = uiCreate:CreateUIRelative("text", ui.optionBg[i], "顶部", ui.optionIcon[i], "底部", 0, -10, 200, 0, { font = font, fontSize = 22, align = "居中" })
		ui.optionTip[i] = uiCreate:CreateUIRelative("text", ui.optionBg[i], "顶部", ui.optionName[i], "底部", 0, -20, 160, 0, { font = font, fontSize = 18, align = "左侧" })
	end
end
function ui.Show(showAmount)
	ui.countdownBg:set_show(true)
	ui.refreshBg:set_show(true)
	ui.countdownText:set_text("")
	for i = 1, #ui.optionBg do
		if i <= showAmount then
			ui.optionBg[i]:set_show(true)
			ui.optionBtn[i]:set_show(true)
			ui.optionName[i]:set_text("")
			ui.optionTip[i]:set_text("")
			myFunc:FadePosition({
				UI = ui.optionBg[i],
				ty = "二元出",
				time = 0.2,
				fUI = ui.optionPanel,
				startP = { 0, ui.optionBg[i].y },
				endP = { 300 * (i - (showAmount + 1) / 2), ui.optionBg[i].y },
			})
			myFunc:FadeAlpha({
				UI = ui.optionBg[i],
				ty = "线性",
				show = true,
				time = 0.2,
			})
		else
			ui.optionBg[i]:set_show(false)
		end
	end
end

function ui.Hide(showAmount)
	ui.countdownBg:set_show(false)
	ui.refreshBg:set_show(false)
	for i = 1, showAmount do
		ui.optionBtn[i]:set_show(false)
		myFunc:FadePosition({
			UI = ui.optionBg[i],
			ty = "二元入",
			time = 0.2,
			fUI = ui.optionPanel,
			startP = { ui.optionBg[i].x, ui.optionBg[i].y },
			endP = { 0, ui.optionBg[i].y },
		})
		myFunc:FadeAlpha({
			UI = ui.optionBg[i],
			ty = "二元入",
			show = false,
			time = 0.2,
		})
	end
end

local function DrawTreasure(playerID)
	local player = common.Player[playerID]
	table.ClearTable(currentOptions[playerID])
	for count = 1, drawShowAmount[playerID], 1 do
		local randomIndex = common:GetRandomInt(1, #drawTreasurePool[playerID])
		local id = drawTreasurePool[playerID][randomIndex]
		currentOptions[playerID][count] = id
		myFunc:TableRemove(drawTreasurePool[playerID], randomIndex)
		local name = excel["宝物"][id].Name
		local tip = excel["宝物"][id].Tip
		local icon = excel["宝物"][id].Icon
		if common:IsLocalPlayer(player) then
			ui.optionIcon[count]:set_image(icon)
			ui.optionName[count]:set_text(name)
			ui.optionTip[count]:set_text(tip)
		end
	end
end
common:ReceiveSync("TreasureDraw")(function()
	local player = common:GetSyncPlayer()
	local playerID = common:ConvertPlayerToID(player)
	if drawAmount[playerID] > 0 then
		drawAmount[playerID] = drawAmount[playerID] - 1
		DrawTreasure(playerID)
	end
end)
common:ReceiveSync("SelectTreasure")(function(data)
	local player = common:GetSyncPlayer()
	local playerID = common:ConvertPlayerToID(player)
	local id = currentOptions[playerID][data]
	table.insert(ownedTreasures[playerID], id)
	for _, treasureID in ipairs(currentOptions[playerID]) do
		if treasureID ~= id then
			table.insert(drawTreasurePool[playerID], treasureID)
		end
	end
	local lv = excel["宝物"][id].Lv
	if lv < 3 then
		table.insert(drawTreasurePool[playerID], id + 100)
	end
	if common:IsLocalPlayer(player) then
		inSelecting = false
	end
	attrSystem:SetUnitAttrStr(heros[playerID], 0, excel["宝物"][id].Attr)
	local TID = excel["宝物"][id].TID
	if TID == 1 then
		local diamond = common:GetRandomInt(excel["宝物"][id].Value1, excel["宝物"][id].Value2)
		playerDiamond[playerID] = playerDiamond[playerID] + diamond
		code.AddMessage(playerID, "获得钻石: |cfaffff00" .. diamond)
	end
	common:RunTrigger(jass.gg_trg_Treasure)
	print("玩家" .. playerID, "获得宝物: " .. id)
end)
common:ReceiveSync("RefreshTreasureDraw")(function(data)
	local player = common:GetSyncPlayer()
	local playerID = common:ConvertPlayerToID(player)
	if refreshCount[playerID] > 0 then
		refreshCount[playerID] = refreshCount[playerID] - 1
		local temp = {}
		if #drawTreasurePool[playerID] >= drawShowAmount[playerID] then
			for index, id in ipairs(currentOptions[playerID]) do
				table.insert(temp, id)
			end
		else
			for index, id in ipairs(currentOptions[playerID]) do
				table.insert(drawTreasurePool[playerID], id)
			end
		end
		table.ClearTable(currentOptions[playerID])
		DrawTreasure(playerID)
	end
end)


function Treasure:Init()
	InitData()
	UIInit()
	ac.time(1, function()
		for playerID, player in ipairs(jass.udg_Player) do
			if common:IsLocalPlayer(player) then
				if drawAmount[playerID] > 0 then
					ui.openIcon:set_show(true)
					ui.openAmount:set_text(drawAmount[playerID])
				else
					ui.openIcon:set_show(false)
				end
				if countDown > 0 then
					countDown = countDown - 1
					ui.countdownText:set_text("倒计时: |cfaffff00" .. countDown .. "|r 秒")
					if countDown == 0 then
						ui.Hide(drawShowAmount[playerID])
						common:SendSync("SelectTreasure", 1)
					end
				end
			end
		end
	end)
end

return Treasure
