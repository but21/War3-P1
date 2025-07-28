local jass             = require "jass.common"
local code             = require "jass.code"
local Module           = require "my_base.base_module_manager"
local myFunc           = Module.MyFunc
local event            = Module.Event
local common           = Module.Common
local uiCreate         = Module.UICreate
local excel            = require "ac.tyns.excel"
local font             = "fonts\\LXWK_Bold.ttf"
local attrSystem       = Module.AttrSystem
local textTipDown      = Module.UITipDialog.tipOnlyTextDown

local heros            = jass.udg_Hero
local tipDialogUp      = Module.UITipDialog.tipDialogUp

local refreshCardCount = { 12, 0, 0, 0 }
local drawCost         = { 150, 150, 150, 150 }


local Card = {}

local _ui  = {}

Card.ui    = _ui

function Card:Init()
	Card.drawCount        = { 3, 3, 3, 3 }
	local _drawCards      = {}
	local _availableBonds = {}
	local _ownedBonds     = {}
	Card.ownedBonds       = _ownedBonds
	local _swallowCards   = {}
	Card.swallowCards     = _swallowCards
	local _waitCard       = {}
	local _ownedCards     = {}
	local _currentCards   = {}
	local _selectedCards  = {}
	local _finalBond      = {}
	local _inSelecting    = { false, false, false, false }
	local _inReplacing    = false

	_ui.panel             = uiCreate:CreateUIAbsolute("panel", gameui, "中心", 950, 300, 1, 1)
	_ui.highlight         = uiCreate:CreateUIRelative("image", _ui.panel, "中心", _ui.panel, "中心", 0, 0, 1, 1, { isShow = false, image = [[Survival\UI\highlight.tga]] })
	_ui.highlight:set_level(2)
	local cardH    = 60
	local bgW      = (cardH + 2) * 10 - 2
	_ui.background = uiCreate:CreateUIRelative("image", _ui.panel, "中心", _ui.panel, "中心", 0, 0, bgW, cardH, { image = [[UI\Widgets\ToolTips\Human\human-tooltip-background.blp]], alpha = 0.5 })
	_ui.drawIcon   = uiCreate:CreateUIRelative("image", _ui.background, "右下", _ui.background, "左下", 0, 0, 90, 30, { image = [[]] })
	_ui.drawText   = uiCreate:CreateUIRelative("text", _ui.drawIcon, "中心", _ui.drawIcon, "中心", 0, 0, 90, 0, { font = font, fontSize = 15, align = "居中" })
	_ui.drawText:set_text("|cff000000(Z)抽卡 150")
	_ui.drawBtn = uiCreate:CreateUIRelative("button", _ui.drawIcon, "中心", _ui.drawIcon, "中心", 0, 0, 30, 30)
	local function _EnterCard(btn)
		local playerID = common:GetLocalPlayerID()
		local cardID = _currentCards[playerID][btn.index]
		if cardID then
			local icon = excel["卡牌"][cardID].Icon
			local name = excel["卡牌"][cardID].CardName
			local bondName = excel["卡牌"][cardID].BondName
			local tips = excel["卡牌"][cardID].Tip
			tipDialogUp.icon:set_image(icon)
			tipDialogUp.name:set_text(name)
			tipDialogUp.tips:set_text(tips)
			tipDialogUp.intro:set_text("羁绊: " .. bondName)
			tipDialogUp.panel:reset_allpoint()
			tipDialogUp.panel:set_point("中心", btn, "左上", 412, 20)
			tipDialogUp.panel:set_show(true)
			local w, h = btn:get_wh()
			_ui.highlight:set_wh(w, h)
			_ui.highlight:reset_allpoint()
			_ui.highlight:set_point("中心", btn, "中心", 0, 0)
			_ui.highlight:set_show(true)
		end
	end
	local function _LeaveCard(btn)
		tipDialogUp.panel:set_show(false)
		_ui.highlight:set_show(false)
	end
	local function _ClickCard(btn)
		if _inReplacing then
			_inReplacing = false
			_ui.replaceIcon:set_show(false)
			local playerID = common:GetLocalPlayerID()
			local cardID = _waitCard[playerID]
			if cardID then
				local icon = excel["卡牌"][cardID].Icon
				local name = excel["卡牌"][cardID].CardName
				local bondName = excel["卡牌"][cardID].BondName
				local tips = excel["卡牌"][cardID].Tip
				tipDialogUp.icon:set_image(icon)
				tipDialogUp.name:set_text(name)
				tipDialogUp.tips:set_text(tips)
				tipDialogUp.intro:set_text("羁绊: " .. bondName)
			end
			common:SendSync("ReplaceCard", btn.index)
		end
	end
	_ui.cardBg = {}
	_ui.cardIcon = {}
	_ui.cardBtn = {}
	for i = 1, 10 do
		_ui.cardBg[i] = uiCreate:CreateUIRelative("image", _ui.background, "中心", _ui.background, "左侧", cardH / 2 + (cardH + 2) * (i - 1), 0, cardH, cardH,
			{ image = [[UI\Widgets\ToolTips\Human\human-tooltip-background.blp]] })
		_ui.cardIcon[i] = uiCreate:CreateUIRelative("image", _ui.cardBg[i], "中心", _ui.cardBg[i], "中心", 0, 0, cardH, cardH, { image = [[]], isShow = false })
		_ui.cardBtn[i] = uiCreate:CreateUIRelative("button", _ui.cardBg[i], "中心", _ui.cardIcon[i], "中心", 0, 0, cardH, cardH)
		_ui.cardBtn[i].index = i
		_ui.cardBtn[i]:event "进入" (_EnterCard)
		_ui.cardBtn[i]:event "离开" (_LeaveCard)
		_ui.cardBtn[i]:event "点击" (_ClickCard)
	end
	_ui.replaceIcon = uiCreate:CreateUIRelative("image", _ui.background, "底部", _ui.background, "顶部", 0, 80, 60, 60, { isShow = false })
	_ui.replaceBtn = uiCreate:CreateUIRelative("button", _ui.replaceIcon, "中心", _ui.replaceIcon, "中心", 0, 0, 60, 60)
	_ui.replaceBtn:event("进入")(function(btn)
		local playerID = common:GetLocalPlayerID()
		local cardID = _waitCard[playerID]
		if cardID then
			local icon = excel["卡牌"][cardID].Icon
			local name = excel["卡牌"][cardID].CardName
			local bondName = excel["卡牌"][cardID].BondName
			local tips = excel["卡牌"][cardID].Tip
			tipDialogUp.icon:set_image(icon)
			tipDialogUp.icon:set_show(true)
			tipDialogUp.name:set_text(name)
			tipDialogUp.tips:set_text(tips)
			tipDialogUp.intro:set_text("羁绊: " .. bondName)
			tipDialogUp.panel:reset_allpoint()
			tipDialogUp.panel:set_point("中心", btn, "左上", 412, 20)
			tipDialogUp.panel:set_show(true)
			local w, h = btn:get_wh()
			_ui.highlight:set_wh(w, h)
			_ui.highlight:reset_allpoint()
			_ui.highlight:set_point("中心", btn, "中心", 0, 0)
			_ui.highlight:set_show(true)
		end
	end)
	_ui.replaceBtn:event("离开")(function()
		tipDialogUp.panel:set_show(false)
		_ui.highlight:set_show(false)
	end)
	_ui.replaceText = uiCreate:CreateUIRelative("text", _ui.replaceIcon, "顶部", _ui.replaceIcon, "底部", 0, -30, 200, 0, { font = font, fontSize = 20, align = "居中" })
	_ui.replaceText:set_text("点击下方卡牌进行替换")
	_ui.optionBg, _ui.optionBtn, _ui.optionBondName, _ui.optionCardName, _ui.optionTip, _ui.optionIcon = {}, {}, {}, {}, {}, {}
	local function _EnterOption(btn)
		local w, h = btn:get_wh()
		_ui.highlight:set_wh(w, h)
		_ui.highlight:reset_allpoint()
		_ui.highlight:set_point("中心", btn, "中心", 0, 0)
		_ui.highlight:set_show(true)
	end
	local function _LeaveOption(btn)
		_ui.highlight:set_show(false)
	end
	local function _ClickOption(btn)
		local playerID = common:GetLocalPlayerID()
		local index = btn.index
		_ui.Hide(Card.drawCount[playerID])
		common:SendSync("SelectCard", index)
	end
	_ui.optionPanel          = uiCreate:CreateUIRelative("panel", _ui.panel, "中心", _ui.panel, "中心", 0, 400, 1, 1)
	local _optionW, _optionH = 204, 356
	for i = 1, 4 do
		_ui.optionBg[i] = uiCreate:CreateUIRelative("image", _ui.optionPanel, "中心", _ui.optionPanel, "中心", 0, 0, _optionW, _optionH,
			{ isShow = false, image = [[Survival\UI\SeizeBody\background.tga]] })
		_ui.optionBtn[i] = uiCreate:CreateUIRelative("button", _ui.optionBg[i], "中心", _ui.optionBg[i], "中心", 0, 0, _optionW, _optionH)
		_ui.optionBtn[i].index = i
		_ui.optionBtn[i]:event "进入" (_EnterOption)
		_ui.optionBtn[i]:event "离开" (_LeaveOption)
		_ui.optionBtn[i]:event "点击" (_ClickOption)
		_ui.optionCardName[i] = uiCreate:CreateUIRelative("text", _ui.optionBg[i], "顶部", _ui.optionBg[i], "顶部", 0, -10, 200, 0, { font = font, fontSize = 22, align = "居中" })
		_ui.optionIcon[i] = uiCreate:CreateUIRelative("image", _ui.optionBg[i], "顶部", _ui.optionCardName[i], "底部", 0, -10, 60, 60)
		_ui.optionBondName[i] = uiCreate:CreateUIRelative("text", _ui.optionBg[i], "顶部", _ui.optionIcon[i], "底部", 0, -10, 180, 0, { font = font, fontSize = 22, align = "居中" })
		_ui.optionTip[i] = uiCreate:CreateUIRelative("text", _ui.optionBg[i], "顶部", _ui.optionBondName[i], "底部", 0, -20, 160, 0, { font = font, fontSize = 18, align = "左侧" })
	end
	local function _EnterFuncBtn(btn)
		local index = btn.index
		textTipDown.panel:set_show(true)
		textTipDown.panel:reset_allpoint()
		textTipDown.panel:set_point("中心", btn, "右上", 16, -11)
		local tip = "点击收起(Z键可快捷关闭/显示)"
		if index == 2 then
			tip = "点击刷新,剩余刷新次数:" .. refreshCardCount[common:GetLocalPlayerID()]
		end
		if index == 3 then
			tip = "点击放弃,获得1次刷新次数"
		end
		textTipDown.tips:set_text(tip)
	end
	local function _LeaveFuncBtn(btn)
		textTipDown.panel:set_show(false)
	end
	local function _ClickFuncBtn(btn)
		local index = btn.index
		if index == 1 then
			_ui.optionPanel:set_show(false)
		end
		if index == 2 then
			common:SendSync("RefreshCard")
		end
		if index == 3 then
			_ui.Hide(Card.drawCount[common:GetLocalPlayerID()])
			-- _ui.optionPanel:set_show(false)
			common:SendSync("QuitSelectCard")
		end
	end
	_ui.clickHideIcon = uiCreate:CreateUIRelative("image", _ui.optionPanel, "中心", _ui.optionPanel, "中心", -130, -250, 100, 40, { image = [[]] })
	_ui.clickHideIcon:set_show(false)
	_ui.clickHideBtn = uiCreate:CreateUIRelative("button", _ui.clickHideIcon, "中心", _ui.clickHideIcon, "中心", 0, 0, 100, 40)
	_ui.clickHideBtn.index = 1
	_ui.clickHideBtn:event("进入")(_EnterFuncBtn)
	_ui.clickHideBtn:event("离开")(_LeaveFuncBtn)
	_ui.clickHideBtn:event("点击")(_ClickFuncBtn)

	_ui.refreshIcon = uiCreate:CreateUIRelative("image", _ui.clickHideIcon, "左侧", _ui.clickHideIcon, "右侧", 30, 0, 100, 40, { image = [[]] })
	_ui.refreshBtn = uiCreate:CreateUIRelative("button", _ui.refreshIcon, "中心", _ui.refreshIcon, "中心", 0, 0, 100, 40)
	_ui.refreshBtn.index = 2
	_ui.refreshBtn:event("进入")(_EnterFuncBtn)
	_ui.refreshBtn:event("离开")(_LeaveFuncBtn)
	_ui.refreshBtn:event("点击")(_ClickFuncBtn)

	_ui.quitIcon = uiCreate:CreateUIRelative("image", _ui.clickHideIcon, "左侧", _ui.refreshIcon, "右侧", 30, 0, 100, 40, { image = [[]] })
	_ui.quitBtn = uiCreate:CreateUIRelative("button", _ui.quitIcon, "中心", _ui.quitIcon, "中心", 0, 0, 100, 40)
	_ui.quitBtn.index = 3
	_ui.quitBtn:event("进入")(_EnterFuncBtn)
	_ui.quitBtn:event("离开")(_LeaveFuncBtn)
	_ui.quitBtn:event("点击")(_ClickFuncBtn)

	function _ui.Show(showAmount)
		_ui.clickHideIcon:set_show(true)
		for i = 1, #_ui.optionBg do
			if i <= showAmount then
				_ui.optionBg[i]:set_show(true)
				_ui.optionBtn[i]:set_show(true)
				myFunc:FadePosition({
					UI = _ui.optionBg[i],
					ty = "二元出",
					time = 0.2,
					fUI = _ui.optionPanel,
					startP = { 0, _ui.optionBg[i].y },
					endP = { 300 * (i - (showAmount + 1) / 2), _ui.optionBg[i].y },
				})
				myFunc:FadeAlpha({
					UI = _ui.optionBg[i],
					ty = "线性",
					show = true,
					time = 0.2,
				})
			else
				_ui.optionBg[i]:set_show(false)
			end
		end
	end

	function _ui.Hide(showAmount)
		_ui.clickHideIcon:set_show(false)
		for i = 1, showAmount do
			_ui.optionBtn[i]:set_show(false)
			myFunc:FadePosition({
				UI = _ui.optionBg[i],
				ty = "二元入",
				time = 0.2,
				fUI = _ui.optionPanel,
				startP = { _ui.optionBg[i].x, _ui.optionBg[i].y },
				endP = { 0, _ui.optionBg[i].y },
			})
			myFunc:FadeAlpha({
				UI = _ui.optionBg[i],
				ty = "二元入",
				show = false,
				time = 0.2,
			})
		end
	end

	local function AddCardsToDrawPool(bondCount, playerID)
		for _ = 1, bondCount, 1 do
			if #_availableBonds[playerID] <= 0 then
				break
			end
			local randomBond = common:GetRandomInt(1, #_availableBonds[playerID])
			local bondIndex = _availableBonds[playerID][randomBond]
			table.remove(_availableBonds[playerID], randomBond)
			for index = 1, excel["羁绊列表"][bondIndex].Count, 1 do
				table.insert(_drawCards[playerID], excel["羁绊列表"][bondIndex].FirstID + index - 1)
			end
		end
		_finalBond[playerID] = {}
		for i = 1, excel["羁绊列表"][100].Count, 1 do
			_finalBond[playerID][i] = excel["羁绊列表"][100].FirstID + i - 1
		end
	end


	local function InitPlayerBonds()
		for playerID = 1, 4, 1 do
			_drawCards[playerID] = {}
			_ownedBonds[playerID] = {}
			_swallowCards[playerID] = {}
			_selectedCards[playerID] = {}
			_currentCards[playerID] = {}
			_ownedCards[playerID] = {}
			_currentCards[playerID].count = 0
			_availableBonds[playerID] = {}
			for index, value in ipairs(excel["羁绊列表"]) do
				_availableBonds[playerID][index] = index
			end
			AddCardsToDrawPool(2, playerID)
		end
	end

	local function DrawCard(playerID)
		local drawCount = Card.drawCount[playerID]
		_selectedCards[playerID] = {}
		for count = 1, drawCount do
			if #_drawCards[playerID] <= 0 then
				local randomIndex = common:GetRandomInt(1, #_finalBond[playerID])
				local cardID = _finalBond[playerID][randomIndex]
				table.insert(_selectedCards[playerID], cardID)
				table.remove(_finalBond[playerID], randomIndex)
			else
				local randomIndex = common:GetRandomInt(1, #_drawCards[playerID])
				local cardID = _drawCards[playerID][randomIndex]
				table.insert(_selectedCards[playerID], cardID)
				table.remove(_drawCards[playerID], randomIndex)
			end
		end
		if common:IsLocalPlayer(common.Player[playerID]) then
			if not _inSelecting[playerID] then
				_ui.Show(drawCount)
			end
		end
		for i = 1, drawCount do
			local cardID = _selectedCards[playerID][i]
			local cardName = excel["卡牌"][cardID].CardName
			local bondName = excel["卡牌"][cardID].BondName
			local icon = excel["卡牌"][cardID].Icon
			local tip = excel["卡牌"][cardID].Tip
			_ui.optionBondName[i]:set_text("羁绊:" .. bondName)
			_ui.optionCardName[i]:set_text(cardName)
			_ui.optionIcon[i]:set_image(icon)
			_ui.optionTip[i]:set_text(tip)
		end
	end

	local function CheckSwallow(playerID, bondID)
		local needCount = excel["羁绊列表"][bondID].NeedCount
		if _ownedBonds[playerID][bondID] >= needCount then
			for i = 1, 10, 1 do
				if _currentCards[playerID][i] then
					if bondID == excel["卡牌"][_currentCards[playerID][i]].BondID then
						table.insert(_swallowCards[playerID], _currentCards[playerID][i])
						_currentCards[playerID][i] = nil
						_currentCards[playerID].count = _currentCards[playerID].count - 1
						if common:IsLocalPlayer(common.Player[playerID]) then
							_ui.cardIcon[i]:set_show(false)
						end
						AddCardsToDrawPool(excel["羁绊列表"][bondID].AddBondCount, playerID)
					end
				end
			end
		end
	end

	common:ReceiveSync("SelectCard")(function(data)
		local player = common:GetSyncPlayer()
		local playerID = common:ConvertPlayerToID(player)
		local cardID = _selectedCards[playerID][data]
		for index, id in ipairs(_selectedCards[playerID]) do
			if id <= 20 then
				table.insert(_finalBond[playerID], id)
			elseif cardID ~= id then
				table.insert(_drawCards[playerID], id)
			end
		end
		if _currentCards[playerID].count < 10 then
			_inSelecting[playerID] = false
			_currentCards[playerID].count = _currentCards[playerID].count + 1
			_ownedCards[playerID][cardID] = (_ownedCards[playerID][cardID] or 0) + 1
			attrSystem:SetUnitAttrStr(heros[playerID], 0, excel["卡牌"][cardID].Attr)
			for i = 1, 10 do
				if not _currentCards[playerID][i] then
					_currentCards[playerID][i] = cardID
					local icon = excel["卡牌"][cardID].Icon
					if common:IsLocalPlayer(player) then
						_ui.cardIcon[i]:set_image(icon)
						_ui.cardIcon[i]:set_show(true)
					end
					local bondID = excel["卡牌"][cardID].BondID
					_ownedBonds[playerID][bondID] = (_ownedBonds[playerID][bondID] or 0) + 1
					CheckSwallow(playerID, bondID)
					break
				end
			end
		else
			_waitCard[playerID] = cardID
			if common:IsLocalPlayer(common.Player[playerID]) then
				_inReplacing = true
				_ui.replaceIcon:set_image(excel["卡牌"][cardID].Icon)
				_ui.replaceIcon:set_show(true)
			end
		end

		_selectedCards[playerID] = {}
	end)
	common:ReceiveSync("ReplaceCard")(function(data)
		local player = common:GetSyncPlayer()
		local playerID = common:ConvertPlayerToID(player)
		local cardID = _currentCards[playerID][data]
		if cardID then
			local bondID = excel["卡牌"][cardID].BondID
			_ownedBonds[playerID][bondID] = _ownedBonds[playerID][bondID] - 1
			_ownedCards[playerID][cardID] = _ownedCards[playerID][cardID] - 1
			attrSystem:SetUnitAttrStr(heros[playerID], 1, excel["卡牌"][cardID].Attr)
			if cardID <= 20 then
				table.insert(_finalBond[playerID], cardID)
			else
				table.insert(_drawCards[playerID], cardID)
			end
			cardID = _waitCard[playerID]
			_waitCard[playerID] = nil
			_currentCards[playerID][data] = cardID
			local icon = excel["卡牌"][cardID].Icon
			bondID = excel["卡牌"][cardID].BondID
			_ownedBonds[playerID][bondID] = (_ownedBonds[playerID][bondID] or 0) + 1
			_ownedCards[playerID][cardID] = (_ownedCards[playerID][cardID] or 0) + 1
			attrSystem:SetUnitAttrStr(heros[playerID], 0, excel["卡牌"][cardID].Attr)
			CheckSwallow(playerID, bondID)
			if common:IsLocalPlayer(player) then
				if _currentCards[playerID][data] then
					_ui.cardIcon[data]:set_image(icon)
				else
					_LeaveCard(_ui.cardBtn[data])
				end
			end
		end
		_inSelecting[playerID] = false
	end)

	common:ReceiveSync("RefreshCard")(function()
		local player = common:GetSyncPlayer()
		local playerID = common:ConvertPlayerToID(player)
		if refreshCardCount[playerID] > 0 then
			refreshCardCount[playerID] = refreshCardCount[playerID] - 1
			local tempCards = {}
			if #_finalBond[playerID] + #_drawCards[playerID] >= Card.drawCount[playerID] then
				for index, id in ipairs(_selectedCards[playerID]) do
					table.insert(tempCards, id)
				end
			else
				for index, id in ipairs(_selectedCards[playerID]) do
					if id <= 20 then
						table.insert(_finalBond[playerID], id)
					else
						table.insert(_drawCards[playerID], id)
					end
				end
			end
			_selectedCards[playerID] = {}
			DrawCard(playerID)
			for index, id in ipairs(tempCards) do
				if id <= 20 then
					table.insert(_finalBond[playerID], id)
				else
					table.insert(_drawCards[playerID], id)
				end
			end
			if common:IsLocalPlayer(common.Player[playerID]) then
				_EnterFuncBtn(_ui.refreshBtn)
			end
		else
			code.AddMessage("刷新次数不足", playerID)
		end
	end)

	common:ReceiveSync("QuitSelectCard")(function()
		local player = common:GetSyncPlayer()
		local playerID = common:ConvertPlayerToID(player)
		_inSelecting[playerID] = false
		refreshCardCount[playerID] = refreshCardCount[playerID] + 1
		for index, id in ipairs(_selectedCards[playerID]) do
			if id <= 20 then
				table.insert(_finalBond[playerID], id)
			else
				table.insert(_drawCards[playerID], id)
			end
		end
		_selectedCards[playerID] = {}
	end)

	InitPlayerBonds()

	event:OnKeyBoard("Z", 1, function(playerID)
		if _inSelecting[playerID] then
			if common:IsLocalPlayer(common.Player[playerID]) then
				_ui.optionPanel:set_show(not _ui.optionPanel:is_show())
			end
		else
			if jass.udg_PlayerKills[playerID] >= drawCost[playerID] then
				jass.udg_PlayerKills[playerID] = jass.udg_PlayerKills[playerID] - drawCost[playerID]
				drawCost[playerID] = drawCost[playerID] + 150
				DrawCard(playerID)
				_inSelecting[playerID] = true
				if common:IsLocalPlayer(common.Player[playerID]) then
					_ui.drawText:set_text("|cff000000(Z)抽卡 " .. drawCost[playerID])
				end
			end
		end
	end)
end

return Card
