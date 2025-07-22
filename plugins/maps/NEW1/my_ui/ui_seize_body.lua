local Module          = require "my_base.base_module_manager"
local code            = require "jass.code"
local jass            = require "jass.common"
local font            = "fonts\\LXWK_Bold.ttf"

local uiCreate        = Module.UICreate
local tipOnlyTextDown = Module.UITipDialog.tipOnlyTextDown
local myFunc          = Module.MyFunc
local common          = Module.Common
local excel           = excel
local players         = jass.udg_Player
local tipDialogDown   = Module.UITipDialog.tipDialogDown

local SeizeBody       = {}
local _ui             = {}
SeizeBody.ui          = _ui

-- 刷新消耗
local _refreshCost    = {}

---@type table<integer, table<integer, integer>> 对应玩家的选项ID
local _optionsID      = {}
for playerID, value in ipairs(jass.udg_Player) do
	_optionsID[playerID]                = {}
	_refreshCost[playerID]              = {}
	_refreshCost[playerID].originCost   = excel["其它"][8]["Value2"]
	_refreshCost[playerID].raiseCost    = excel["其它"][8]["Value3"]
	_refreshCost[playerID].refreshCount = 0
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
	local tip = excel["夺舍"][_optionsID[playerID][btn.index]]["Tips"]
	local icon = excel["夺舍"][_optionsID[playerID][btn.index]]["Icon"]
	tipDialogDown.name:set_text(name)
	tipDialogDown.icon:set_image(icon)
	tipDialogDown.tips:set_text(tip)
	tipDialogDown.intro:set_text("|cff00ffff类别 - 夺舍")
	tipDialogDown.panel:reset_allpoint()
	tipDialogDown.panel:set_point("中心", btn, "右上", 20, -20)
	tipDialogDown.panel:set_show(true)
	-- 显示高光
	_ui.highlight:reset_allpoint()
	_ui.highlight:set_point("中心", btn, "中心", 0, 0)
	_ui.highlight:set_show(true)
end
local function _LeaveOption(btn)
	tipDialogDown.panel:set_show(false)
	_ui.highlight:set_show(false)
end
local function _ClickOption(btn)
	local amount = 3
	if not _ui.optionBg[3]._show then
		amount = 2
	end
	_ui.Hide(amount)
	local id = _optionsID[common:GetLocalPlayerID()][btn.index]
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
local _refreshW, _refreshH = 80, 40
_ui.refreshBg = uiCreate:CreateUIRelative("image", _ui.panel, "中心", _ui.panel, "中心", 0, -250, _refreshW, _refreshH, { image = [[Survival\UI\refresh.tga]] })
_ui.refreshBtn = uiCreate:CreateUIRelative("button", _ui.refreshBg, "中心", _ui.refreshBg, "中心", 0, 0, _refreshW, _refreshH)
_ui.refreshBtn:event "进入" (function(btn)
	local playerID = common:GetLocalPlayerID()
	myFunc:FadeSize({ UI = _ui.refreshBg, startP = { _refreshW, _refreshH }, endP = { _refreshW * 1.2, _refreshH * 1.2 }, time = 0.08, ty = "二元出" })
	tipOnlyTextDown.panel:reset_allpoint()
	tipOnlyTextDown.panel:set_point("中心", btn, "右上", 25, -11)
	tipOnlyTextDown.panel:set_show(true)
	local cost = _refreshCost[playerID].originCost + _refreshCost[playerID].raiseCost * _refreshCost[playerID].refreshCount
	tipOnlyTextDown.tips:set_text("点击消耗|cfaffff00" .. cost .. "|r钻石刷新")
end)
_ui.refreshBtn:event "离开" (function(btn)
	-- 隐藏提示框
	tipOnlyTextDown.panel:set_show(false)
	myFunc:FadeSize({ UI = _ui.refreshBg, endP = { _refreshW, _refreshH }, startP = { _refreshW * 1.2, _refreshH * 1.2 }, time = 0.08, ty = "二元入" })
end)
_ui.refreshBtn:event "点击" (function(btn)
	common:SendSync("RefreshSeizeSelect")
end)
common:ReceiveSync("RefreshSeizeSelect")(function()
	local player = common:GetSyncPlayer()
	local playerID = common:ConvertPlayerToID(player)
	local cost = _refreshCost[playerID].originCost + _refreshCost[playerID].raiseCost * _refreshCost[playerID].refreshCount
	if jass.udg_PlayerDiamond[playerID] >= cost then
		_refreshCost[playerID].refreshCount = _refreshCost[playerID].refreshCount + 1
		jass.udg_PlayerDiamond[playerID] = jass.udg_PlayerDiamond[playerID] - cost
		if common:IsLocalPlayer(player) then
			cost = _refreshCost[playerID].originCost + _refreshCost[playerID].raiseCost * _refreshCost[playerID].refreshCount
			tipOnlyTextDown.tips:set_text("点击消耗|cfaffff00" .. cost .. "|r钻石刷新")
		end
		code.BeginSeizeBody(playerID, true)
	else
		code.AddMessage(playerID, "|cfff43232钻石不足!!!")
	end
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

function code.BeginSeizeBody(playerID, isShowUI)
	local optionAmount = 3
	for i = 1, optionAmount, 1 do
		local condition = true
		local id = common:GetRandomInt(1, #excel["夺舍"])
		if id ~= jass.udg_CurrentSeizeBodyID[playerID] then
			condition = false
			for j = 1, i - 1 do
				if id == _optionsID[playerID][j] then
					condition = true
					break
				end
			end
		end
		local loopCount = 0
		while condition do
			id = common:GetRandomInt(1, #excel["夺舍"])
			if id ~= jass.udg_CurrentSeizeBodyID[playerID] then
				condition = false
				for j = 1, i - 1 do
					if id == _optionsID[playerID][j] then
						condition = true
						break
					end
				end
			end
			loopCount = loopCount + 1
			if loopCount > 10 then
				condition = false
			end
		end
		_optionsID[playerID][i] = id
		-- 设置模型和提示文本, 然后整体显示选项
		local modelData = modelDatas[id]
		_ui.optionModel[i]:set_model(excel["夺舍"][id]["Model"])
		_ui.optionModel[i]:set_camera_target(0, 0, 0):
			set_model_position(modelData.modelPosition[1], modelData.modelPosition[2], modelData.modelPosition[3])
			:set_x(modelData.cameraRotate[1]):set_y(modelData.cameraRotate[2]):set_z(modelData.cameraRotate[3])
			:set_camera_source(1, 0, 0)
			:set_moive_id(modelData.stand)
			:set_Size(modelData.scale)
		-- _ui.optionTip[i]:set_text(excel["夺舍"][id]["Tips"])
	end
	if not isShowUI then
		if common:IsLocalPlayer(players[playerID]) then
			_ui.Show(optionAmount)
		end
	end
end

return SeizeBody
