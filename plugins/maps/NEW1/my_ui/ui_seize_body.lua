local Module               = require "my_base.base_module_manager"
local code                 = require "jass.code"
local jass                 = Jass
local font                 = "fonts\\LXWK_Bold.ttf"

local uiCreate             = Module.UICreate
local attrSystem           = Module.AttrSystem
local tipOnlyTextDown      = Module.UITipDialog.tipOnlyTextDown
local myFunc               = Module.MyFunc
local common               = Module.Common
local excel                = Module.Excel
local excelSystem          = Module.ExcelSystem
local players              = jass.udg_Player
local tipDialogDown        = Module.UITipDialog.tipDialogDown
local acTime               = ac.time

local heros                = jass.udg_Hero
local SeizeBody            = {}
local _ui                  = {}
SeizeBody.ui               = _ui
SeizeBody.swallowedHeroes  = {}

local freeRefreshCount     = { 0, 0, 0, 0 }
SeizeBody.freeRefreshCount = freeRefreshCount
local _drawAmount          = { 2, 2, 2, 2 }

local waitAmount           = { 0, 0, 0, 0 }
local inSeizeBody          = { false, false, false, false }


local refreshCost = {}
local drawPool    = {}


---@type table<integer, table<integer, integer>> 对应玩家的选项ID
local _optionsID = {}
for playerID, value in ipairs(jass.udg_Player) do
	_optionsID[playerID] = {}
	drawPool[playerID]   = {}
	for i = 1, #excel["夺舍"], 1 do
		drawPool[playerID][i] = i
	end
	refreshCost[playerID]               = {}
	refreshCost[playerID].originCost    = excel["其它"][8]["Value2"]
	refreshCost[playerID].raiseCost     = excel["其它"][8]["Value3"]
	refreshCost[playerID].refreshCount  = 0
	SeizeBody.swallowedHeroes[playerID] = {}
end

-- 模型数据
local modelDatas     = {
	[1] = { stand = 0, modelPosition = { -30, 0, -25 }, cameraRotate = { 0, 20, 0 }, scale = 0.2 },
	[2] = { stand = 10, modelPosition = { -38, 0, -26 }, cameraRotate = { 0, 20, 0 }, scale = 0.2 },
	[3] = { stand = 0, modelPosition = { -25, 2, -25 }, cameraRotate = { 0, 10, 0 }, scale = 0.2 },
	[4] = { stand = 0, modelPosition = { -20, 0, -18 }, cameraRotate = { 0, 10, 0 }, scale = 0.2 },
	[5] = { stand = 0, modelPosition = { -25, 0, -25 }, cameraRotate = { 0, 20, 0 }, scale = 0.2 },
	[6] = { stand = 0, modelPosition = { -25, 0, -20 }, cameraRotate = { 0, 20, 0 }, scale = 0.2 },
	[7] = { stand = 0, modelPosition = { -25, 0, -15 }, cameraRotate = { 0, 20, 0 }, scale = 0.2 },
	[8] = { stand = 0, modelPosition = { -30, 0, -20 }, cameraRotate = { 0, 15, 0 }, scale = 0.2 },
	[9] = { stand = 0, modelPosition = { -25, 0, -20 }, cameraRotate = { 0, 15, 0 }, scale = 0.2 },
	[10] = { stand = 0, modelPosition = { -25, 0, -23 }, cameraRotate = { 0, 10, 0 }, scale = 0.2 },
	[11] = { stand = 0, modelPosition = { -18, 0, -18 }, cameraRotate = { 0, 10, 0 }, scale = 0.2 },
	[12] = { stand = 0, modelPosition = { -25, 0, -25 }, cameraRotate = { 0, 15, 0 }, scale = 0.2 },
	[13] = { stand = 4, modelPosition = { -20, 0, -22 }, cameraRotate = { 0, 15, 0 }, scale = 0.2 },
	[14] = { stand = 12, modelPosition = { -25, 0, -25 }, cameraRotate = { 0, 15, 0 }, scale = 0.2 },
	[15] = { stand = 6, modelPosition = { -22, 0, -25 }, cameraRotate = { 0, 15, 0 }, scale = 0.2 },
	[16] = { stand = 0, modelPosition = { -25, 0, -25 }, cameraRotate = { 0, 20, 0 }, scale = 0.2 },
}

SeizeBody.modelDatas = modelDatas

_ui.panel            = uiCreate:CreateUIAbsolute("panel", gameui, "中心", 960, 700, 1, 1, { isShow = false })
_ui.optionBg         = {}
_ui.optionBtn        = {}
_ui.optionModel      = {}
_ui.optionShadow     = {}
_ui.optionTip        = {}

local function _EnterOption(btn)
	local playerID = common:GetLocalPlayerID()
	local name = excel["夺舍"][_optionsID[playerID][btn.index]]["Name"]
	local tip = excelSystem:GetData("夺舍", _optionsID[playerID][btn.index], "Tips")
	local icon = excel["夺舍"][_optionsID[playerID][btn.index]]["Icon"]
	tipDialogDown.name:set_text(name)
	tipDialogDown.icon:set_image(icon)
	tipDialogDown.tips:set_text(tip)
	tipDialogDown.intro:set_text("|cff00ffff类别 - 夺舍")
	tipDialogDown.panel:reset_allpoint()
	tipDialogDown.panel:set_point("中心", btn, "右上", 20, -20)
	tipDialogDown.panel:set_show(true)
	_ui.highlight:reset_allpoint()
	_ui.highlight:set_point("中心", btn, "中心", 0, 0)
	_ui.highlight:set_show(true)
end
local function _LeaveOption(btn)
	tipDialogDown.panel:set_show(false)
	_ui.highlight:set_show(false)
end
local function _ClickOption(btn)
	local playerID = common:GetLocalPlayerID()
	_ui.Hide(_drawAmount[playerID])
	local id = _optionsID[playerID][btn.index]
	common:SendSync("SeizeBody", id)
end
local _optionW, _optionH = 204, 356
for i = 1, 3 do
	_ui.optionBg[i] = uiCreate:CreateUIRelative("image", _ui.panel, "中心", _ui.panel, "中心", 0, 0, _optionW, _optionH, { isShow = false, image = [[Survival\UI\SeizeBody\background.tga]] })
	_ui.optionBtn[i] = uiCreate:CreateUIRelative("button", _ui.optionBg[i], "中心", _ui.optionBg[i], "中心", 0, 0, _optionW, _optionH)
	_ui.optionBtn[i].index = i
	_ui.optionBtn[i]:event "进入" (_EnterOption)
	_ui.optionBtn[i]:event "离开" (_LeaveOption)
	_ui.optionBtn[i]:event "点击" (_ClickOption)
	_ui.optionModel[i] = uiCreate:CreateUIRelative("model", _ui.optionBg[i], "中心", _ui.optionBg[i], "中心", 0, 0, _optionW, _optionH)
	_ui.optionShadow[i] = uiCreate:CreateUIRelative("image", _ui.panel, "中心", _ui.optionBg[i], "中心", 0, 0, _optionW, _optionH, {
		image = [[UI\Widgets\ToolTips\Human\human-tooltip-background.blp]],
		alpha = 0.1
	})
	-- _ui.optionTip[i] = uiCreate:CreateUIRelative("text", _ui.optionShadow[i], "底部", _ui.optionBg[i], "底部", 0, 20, _optionW - 30, 0, { font = font, fontSize = 20, align = "居中" })
end
_ui.highlight = uiCreate:CreateUIRelative("image", _ui.panel, "中心", _ui.panel, "中心", 0, 0, _optionW, _optionH, { isShow = false, image = [[Survival\UI\SeizeBody\highlight.tga]] })
local _refreshW, _refreshH = 100, 50
_ui.refreshBg = uiCreate:CreateUIRelative("image", _ui.panel, "中心", _ui.panel, "中心", 0, -250, _refreshW, _refreshH, { image = [[Survival\UI\refresh.tga]] })
_ui.refreshBtn = uiCreate:CreateUIRelative("button", _ui.refreshBg, "中心", _ui.refreshBg, "中心", 0, 0, _refreshW, _refreshH)
_ui.refreshBtn:event "进入" (function(btn)
	local playerID = common:GetLocalPlayerID()
	myFunc:FadeSize({ UI = _ui.refreshBg, startP = { _refreshW, _refreshH }, endP = { _refreshW * 1.2, _refreshH * 1.2 }, time = 0.08, ty = "二元出" })
	tipOnlyTextDown.panel:reset_allpoint()
	tipOnlyTextDown.panel:set_point("中心", btn, "右上", 25, -11)
	tipOnlyTextDown.panel:set_show(true)
	local cost = refreshCost[playerID].originCost + refreshCost[playerID].raiseCost * refreshCost[playerID].refreshCount
	tipOnlyTextDown.tips:set_text("免费刷新次数：|cfaffff00" .. freeRefreshCount[playerID] .. "|r|n|n点击消耗|cfaffff00" .. cost .. "|n木材刷新")
end)
_ui.refreshBtn:event "离开" (function(btn)
	tipOnlyTextDown.panel:set_show(false)
	myFunc:FadeSize({ UI = _ui.refreshBg, endP = { _refreshW, _refreshH }, startP = { _refreshW * 1.2, _refreshH * 1.2 }, time = 0.08, ty = "二元入" })
end)
_ui.refreshBtn:event "点击" (function(btn)
	common:SendSync("RefreshSeizeSelect")
end)
_ui.refreshText = uiCreate:CreateUIRelative("text", _ui.refreshBg, "中心", _ui.refreshBg, "中心", 0, 0, _refreshW, 0, { font = font, fontSize = 22, align = "居中" })


--- 显示夺舍界面(异步调用)
--- @param showAmount integer 显示的选项数量
function _ui.Show(showAmount)
	_ui.panel:set_show(true)
	for i = 1, #_ui.optionBg do
		if i <= showAmount then
			_ui.optionBg[i]:set_show(true)
			_ui.optionShadow[i]:set_show(true)
			_ui.optionBtn[i]:set_show(true)
			_ui.refreshBg:set_show(true)
			myFunc:FadePosition({
				UI = _ui.optionBg[i],
				ty = "二元出",
				time = 0.2,
				fUI = _ui.panel,
				startP = { 0, 0 },
				endP = { 300 * (i - (showAmount + 1) / 2), 0 },
			})
			myFunc:FadeAlpha({
				UI = _ui.optionBg[i],
				ty = "线性",
				show = true,
				time = 0.2,
			})
		else
			_ui.optionBg[i]:set_show(false)
			_ui.optionShadow[i]:set_show(false)
		end
	end
end

--- 隐藏夺舍界面(异步调用)
--- @param showAmount integer 关闭的选项数量
function _ui.Hide(showAmount)
	_ui.refreshBg:set_show(false)
	for i = 1, showAmount do
		_ui.optionBtn[i]:set_show(false)
		myFunc:FadePosition({
			UI = _ui.optionBg[i],
			ty = "二元入",
			time = 0.2,
			fUI = _ui.panel,
			startP = { _ui.optionBg[i].x, 0 },
			endP = { 0, 0 },
			complete = function()
				_ui.panel:set_show(false)
				_ui.optionShadow[i]:set_show(false)
			end
		})
		myFunc:FadeAlpha({
			UI = _ui.optionBg[i],
			ty = "二元入",
			show = false,
			time = 0.2,
		})
	end
end

local function DrawHero(playerID)
	local drawAmount = _drawAmount[playerID]
	_optionsID[playerID] = {}
	for count = 1, drawAmount do
		local randomIndex = common:GetRandomInt(1, #drawPool[playerID])
		local id = drawPool[playerID][randomIndex]
		-- table.insert(_optionsID[playerID], id)
		table.remove(drawPool[playerID], randomIndex)
		_optionsID[playerID][count] = id
		local modelData = modelDatas[id]
		_ui.optionModel[count]:set_model(excel["夺舍"][id]["Model"])
		_ui.optionModel[count]:set_camera_target(0, 0, 0):
			set_model_position(modelData.modelPosition[1], modelData.modelPosition[2], modelData.modelPosition[3])
			:set_x(modelData.cameraRotate[1]):set_y(modelData.cameraRotate[2]):set_z(modelData.cameraRotate[3])
			:set_camera_source(1, 0, 0)
			:set_moive_id(modelData.stand)
			:set_Size(modelData.scale)
		-- _ui.optionTip[i]:set_text(excel["夺舍"][id]["Tips"])
	end
	if common:IsLocalPlayer(players[playerID]) then
		_ui.Show(drawAmount)
	end
end

common:ReceiveSync("RefreshSeizeSelect")(function()
	local player = common:GetSyncPlayer()
	local playerID = common:ConvertPlayerToID(player)
	local cost = refreshCost[playerID].originCost + refreshCost[playerID].raiseCost * refreshCost[playerID].refreshCount
	if freeRefreshCount[playerID] > 0 then
		freeRefreshCount[playerID] = freeRefreshCount[playerID] - 1
	else
		if jass.udg_PlayerDiamond[playerID] < cost then
			code.AddMessage(playerID, "|cfff43232木材不足!!!")
			return
		end
		jass.udg_PlayerDiamond[playerID] = jass.udg_PlayerDiamond[playerID] - cost
	end
	refreshCost[playerID].refreshCount = refreshCost[playerID].refreshCount + 1
	if common:IsLocalPlayer(player) then
		cost = refreshCost[playerID].originCost + refreshCost[playerID].raiseCost * refreshCost[playerID].refreshCount
		tipOnlyTextDown.tips:set_text("免费刷新次数：|cfaffff00" .. freeRefreshCount[playerID] .. "|r|n|n点击消耗|cfaffff00" .. cost .. "|r木材刷新")
	end
	local tempHeroes = {}
	if #drawPool[playerID] >= _drawAmount[playerID] * 2 then
		for _, id in ipairs(_optionsID[playerID]) do
			table.insert(tempHeroes, id)
		end
	else
		for _, id in ipairs(_optionsID[playerID]) do
			table.insert(drawPool[playerID], id)
		end
	end
	_optionsID[playerID] = {}
	DrawHero(playerID)
	for _, id in ipairs(tempHeroes) do
		table.insert(drawPool[playerID], id)
	end
end)
common:ReceiveSync("SeizeBody")(function(data)
	local player = common:GetSyncPlayer()
	local playerID = common:ConvertPlayerToID(player)
	if jass.udg_CurrentSeizeBodyID[playerID] > 0 then
		table.insert(SeizeBody.swallowedHeroes[playerID], jass.udg_CurrentSeizeBodyID[playerID])
	end
	for index, id in ipairs(_optionsID[playerID]) do
		if id ~= data then
			table.insert(drawPool[playerID], id)
		end
	end
	code.AddMessage(playerID, "夺舍英雄 |cfaffff00[" .. excelSystem:GetData("夺舍", data, "Name") .. "]")
	common:SaveInteger(jass.udg_HTSeizeBodyID, playerID, data, 1)
	jass.udg_CurrentSeizeBodyID[playerID] = data
	myFunc:SetCustomValue(jass.gg_trg_SeizeBodyLua, "整数", "playerID", playerID)
	common:RunTrigger(jass.gg_trg_SeizeBodyLua)
	local addition = myFunc:GetCustomValue(heros[playerID], "实数", "Treasure6")
	if addition > 0 then
		local max = attrSystem:GetObjAttrFromStr(heros[playerID], "面板力量") > attrSystem:GetObjAttrFromStr(heros[playerID], "面板敏捷") and "面板力量" or "面板敏捷"
		max = attrSystem:GetObjAttrFromStr(heros[playerID], max) > attrSystem:GetObjAttrFromStr(heros[playerID], "面板智力") and max or "面板智力"
		max = "当前" .. max:sub(-6)
		attrSystem:SetObjAttrEx_Str(heros[playerID], max, 0, addition + 1)
		myFunc:SetCustomValue(heros[playerID], "实数", "Treasure6", 0)
	end
	acTime(0.2, 1, function()
		inSeizeBody[playerID] = false
		if waitAmount[playerID] > 0 then
			waitAmount[playerID] = waitAmount[playerID] - 1
			code.BeginSeizeBody(playerID)
		end
	end)
end)


function code.BeginSeizeBody(playerID)
	if inSeizeBody[playerID] then
		waitAmount[playerID] = waitAmount[playerID] + 1
	else
		inSeizeBody[playerID] = true
		DrawHero(playerID)
	end
end

return SeizeBody
