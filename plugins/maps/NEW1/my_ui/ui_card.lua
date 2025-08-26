local jass                       = require "jass.common"
local code                       = require "jass.code"
local Module                     = require "my_base.base_module_manager"
local myFunc                     = Module.MyFunc
local event                      = Module.Event
local common                     = Module.Common
local uiCreate                   = Module.UICreate
local imagePool                  = Module.ImagePool
local excel                      = require "ac.tyns.excel"
local font                       = "fonts\\LXWK_Bold.ttf"
local attrSystem                 = Module.AttrSystem
local textTipDown                = Module.UITipDialog.tipOnlyTextDown
local ac                         = ac
local tipDialogUp                = Module.UITipDialog.tipDialogUp
local math                       = math
local sequenceFrameImage         = Module.Constant.sequenceFrameImage

local heros                      = jass.udg_Hero
local refreshCardCount           = jass.udg_CardRefreshAmount
local playerGold                 = jass.udg_PlayerGold
local playerKills                = jass.udg_PlayerKills

-- 抽卡消耗
local drawCost                   = { 150, 150, 150, 150 }

local Card                       = {}

local _ui                        = {}

Card.ui                          = _ui

-- 每次抽卡数量
Card.drawCount                   = { 3, 3, 3, 3 }
-- 当前抽卡卡池
local drawCards                  = {}
-- 剩余羁绊
local availableBonds             = {}
-- 复杂羁绊
local specialBonds               = {}
-- 拥有的羁绊 playerID -> bondID -> count
local ownedBonds                 = {}
Card.ownedBonds                  = ownedBonds
-- 不同类型的羁绊数量(力, 敏, 智, 通用)
local ownedBondsTy               = {}
-- 已吞噬的卡牌
local swallowCards               = {}
Card.swallowCards                = swallowCards
-- 卡牌吞噬条件计数 playerID -> cardID -> count
local cardsSwallowConditionCount = {}
-- 等待替换的卡牌
local waitCard                   = {}
-- 已拥有的卡牌
local ownedCards                 = {}
-- 当前卡牌栏的牌(cardID -> uiIndex)
local currentCardsID             = {}
-- 当前卡牌栏的牌(uiIndex -> cardID)
local currentCards               = {}
-- 当前抽卡界面的卡牌ID
local selectedCards              = {}
-- 最后羁绊(没有其他卡牌抽了)
local finalBond                  = {}
-- 特殊羁绊数据 playerID -> bondID -> table
local specialBondData            = {}
-- 是否正在选择卡牌
local inSelecting                = { false, false, false, false }
-- 是否正在进行替换(异步)
local inReplacing                = false

local function SetCardTip(cardID)
	local icon = excel["卡牌"][cardID].Icon
	local name = excel["卡牌"][cardID].CardName
	local bondName = excel["卡牌"][cardID].BondName
	local tips
	if excel["卡牌"][cardID].Attr then
		tips = (tips or "") .. excel["卡牌"][cardID].Attr
	end
	if excel["卡牌"][cardID].CardEffect then
		tips = (tips and tips .. "|n|n" or "") .. excel["卡牌"][cardID].CardEffect
	end
	if excel["卡牌"][cardID].SwallowEffect then
		tips = (tips and tips .. "|n|n" or "") .. "集齐羁绊效果：|n" .. excel["卡牌"][cardID].SwallowEffect
	end
	tips = "|cffB4C4E2" .. myFunc:SetNumColor(tips, "|cffC9E750", "|cffB4C4E2")
	if excel["卡牌"][cardID].SwallowCondition then
		tips = (tips and tips .. "|n|n" or "") .. "|cff696E6E吞噬条件：|n" .. excel["卡牌"][cardID].SwallowCondition
	end
	tipDialogUp.icon:set_image(icon)
	tipDialogUp.name:set_text("|cff73FFFE" .. name)
	tipDialogUp.tips:set_text(tips)
	tipDialogUp.intro:set_text("|cff696E6E羁绊: " .. bondName)
end

local function onCardEnter(btn)
	local playerID = common:GetLocalPlayerID()
	local cardID = currentCards[playerID][btn.index]
	if cardID then
		SetCardTip(cardID)
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

local function onCardLeave(btn)
	tipDialogUp.panel:set_show(false)
	_ui.highlight:set_show(false)
end

local function onCardClick(btn)
	if inReplacing then
		inReplacing = false
		_ui.replaceIcon:set_show(false)
		local playerID = common:GetLocalPlayerID()
		local cardID = waitCard[playerID]
		if cardID then
			SetCardTip(cardID)
			tipDialogUp.panel:reset_allpoint()
			tipDialogUp.panel:set_point("中心", btn, "左上", 412, 20)
			tipDialogUp.panel:set_show(true)
			local w, h = btn:get_wh()
			_ui.highlight:set_wh(w, h)
			_ui.highlight:reset_allpoint()
			_ui.highlight:set_point("中心", btn, "中心", 0, 0)
			_ui.highlight:set_show(true)
		end
		_ui.cardCountBg[btn.index]:set_show(false)
		common:SendSync("ReplaceCard", btn.index)
	end
end
local function onOptionEnter(btn)
	local w, h = btn:get_wh()
	_ui.highlight:set_wh(w, h)
	_ui.highlight:reset_allpoint()
	_ui.highlight:set_point("中心", btn, "中心", 0, 0)
	_ui.highlight:set_show(true)
end

local function onOptionLeave(btn)
	_ui.highlight:set_show(false)
end

local function onOptionClick(btn)
	local playerID = common:GetLocalPlayerID()
	local index = btn.index
	_ui.Hide(Card.drawCount[playerID])
	common:SendSync("SelectCard", index)
end

local function onFuncBtnEnter(btn)
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

local function onFuncBtnLeave(btn)
	textTipDown.panel:set_show(false)
end

local function onFuncBtnClick(btn)
	local index = btn.index
	if index == 1 then
		_ui.optionPanel:set_show(false)
	end
	if index == 2 then
		common:SendSync("RefreshCard")
	end
	if index == 3 then
		_ui.Hide(Card.drawCount[common:GetLocalPlayerID()])
		common:SendSync("QuitSelectCard")
	end
end

local function UIInit()
	_ui.panel     = uiCreate:CreateUIAbsolute("panel", gameui, "中心", 960, 300, 1, 1)
	_ui.highlight = uiCreate:CreateUIRelative("image", _ui.panel, "中心", _ui.panel, "中心", 0, 0, 1, 1, { isShow = false, image = [[Survival\UI\highlight.tga]] })
	_ui.highlight:set_level(2)

	local cardHeight      = 60
	local backgroundWidth = (cardHeight + 2) * 10 - 2

	_ui.background        = uiCreate:CreateUIRelative("image", _ui.panel, "中心", _ui.panel, "中心", 0, 0, backgroundWidth, cardHeight,
		{ image = [[UI\Widgets\ToolTips\Human\human-tooltip-background.blp]], alpha = 0.5 })
	_ui.drawIcon          = uiCreate:CreateUIRelative("image", _ui.background, "右下", _ui.background, "左下", 0, 0, 90, 30, { image = [[]] })
	_ui.drawText          = uiCreate:CreateUIRelative("text", _ui.drawIcon, "中心", _ui.drawIcon, "中心", 0, 0, 90, 0, { font = font, fontSize = 15, align = "居中" })
	_ui.drawText:set_text("|cff000000(Z)抽卡 150")
	_ui.drawBtn = uiCreate:CreateUIRelative("button", _ui.drawIcon, "中心", _ui.drawIcon, "中心", 0, 0, 30, 30)


	_ui.cardBg = {}
	_ui.cardIcon = {}
	_ui.cardBtn = {}
	_ui.cardCountBg = {}
	_ui.cardCount = {}
	for i = 1, 10 do
		_ui.cardBg[i]        = uiCreate:CreateUIRelative("image", _ui.background, "中心", _ui.background, "左侧", cardHeight / 2 + (cardHeight + 2) * (i - 1), 0, cardHeight, cardHeight,
			{ image = [[UI\Widgets\ToolTips\Human\human-tooltip-background.blp]] })
		_ui.cardIcon[i]      = uiCreate:CreateUIRelative("image", _ui.cardBg[i], "中心", _ui.cardBg[i], "中心", 0, 0, cardHeight, cardHeight, { image = [[]], isShow = false })
		_ui.cardBtn[i]       = uiCreate:CreateUIRelative("button", _ui.cardBg[i], "中心", _ui.cardIcon[i], "中心", 0, 0, cardHeight, cardHeight)
		_ui.cardCountBg[i]   = uiCreate:CreateUIRelative("image", _ui.cardIcon[i], "右下", _ui.cardIcon[i], "右下", 0, 0, 30, 15,
			{ image = [[UI\Widgets\ToolTips\Human\human-tooltip-background.blp]], alpha = 0.7, isShow = false })
		_ui.cardCount[i]     = uiCreate:CreateUIRelative("text", _ui.cardCountBg[i], "右下", _ui.cardCountBg[i], "右下", 0, 0, 30, 0, { font = font, fontSize = 15, align = "居中" })
		_ui.cardBtn[i].index = i
		_ui.cardBtn[i]:event "进入" (onCardEnter)
		_ui.cardBtn[i]:event "离开" (onCardLeave)
		_ui.cardBtn[i]:event "点击" (onCardClick)
	end

	_ui.replaceIcon = uiCreate:CreateUIRelative("image", _ui.background, "底部", _ui.background, "顶部", 0, 80, 60, 60, { isShow = false })
	_ui.replaceBtn = uiCreate:CreateUIRelative("button", _ui.replaceIcon, "中心", _ui.replaceIcon, "中心", 0, 0, 60, 60)

	_ui.replaceBtn:event("进入")(function(btn)
		local playerID = common:GetLocalPlayerID()
		local cardID = waitCard[playerID]
		if cardID then
			SetCardTip(cardID)
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
	_ui.optionPanel                                                                                    = uiCreate:CreateUIRelative("panel", _ui.panel, "中心", _ui.panel, "中心", 0, 400, 1, 1)
	local optionWidth, optionHeight                                                                    = 204, 356

	for i = 1, 4 do
		_ui.optionBg[i] = uiCreate:CreateUIRelative("image", _ui.optionPanel, "中心", _ui.optionPanel, "中心", 0, 0, optionWidth, optionHeight,
			{ isShow = false, image = [[Survival\UI\SeizeBody\background.tga]] })
		_ui.optionBtn[i] = uiCreate:CreateUIRelative("button", _ui.optionBg[i], "中心", _ui.optionBg[i], "中心", 0, 0, optionWidth, optionHeight)
		_ui.optionBtn[i].index = i
		_ui.optionBtn[i]:event "进入" (onOptionEnter)
		_ui.optionBtn[i]:event "离开" (onOptionLeave)
		_ui.optionBtn[i]:event "点击" (onOptionClick)
		_ui.optionCardName[i] = uiCreate:CreateUIRelative("text", _ui.optionBg[i], "顶部", _ui.optionBg[i], "顶部", 0, -10, 200, 0, { font = font, fontSize = 22, align = "居中" })
		_ui.optionIcon[i] = uiCreate:CreateUIRelative("image", _ui.optionBg[i], "顶部", _ui.optionCardName[i], "底部", 0, -10, 60, 60)
		_ui.optionBondName[i] = uiCreate:CreateUIRelative("text", _ui.optionBg[i], "顶部", _ui.optionIcon[i], "底部", 0, -10, 180, 0, { font = font, fontSize = 22, align = "居中" })
		_ui.optionTip[i] = uiCreate:CreateUIRelative("text", _ui.optionBg[i], "顶部", _ui.optionBondName[i], "底部", 0, -20, 160, 0, { font = font, fontSize = 18, align = "左侧" })
	end


	_ui.clickHideIcon = uiCreate:CreateUIRelative("image", _ui.optionPanel, "中心", _ui.optionPanel, "中心", -130, -250, 100, 40, { image = [[]] })
	_ui.clickHideIcon:set_show(false)
	_ui.clickHideBtn = uiCreate:CreateUIRelative("button", _ui.clickHideIcon, "中心", _ui.clickHideIcon, "中心", 0, 0, 100, 40)
	_ui.clickHideBtn.index = 1
	_ui.clickHideBtn:event("进入")(onFuncBtnEnter)
	_ui.clickHideBtn:event("离开")(onFuncBtnLeave)
	_ui.clickHideBtn:event("点击")(onFuncBtnClick)

	_ui.refreshIcon = uiCreate:CreateUIRelative("image", _ui.clickHideIcon, "左侧", _ui.clickHideIcon, "右侧", 30, 0, 100, 40, { image = [[]] })
	_ui.refreshBtn = uiCreate:CreateUIRelative("button", _ui.refreshIcon, "中心", _ui.refreshIcon, "中心", 0, 0, 100, 40)
	_ui.refreshBtn.index = 2
	_ui.refreshBtn:event("进入")(onFuncBtnEnter)
	_ui.refreshBtn:event("离开")(onFuncBtnLeave)
	_ui.refreshBtn:event("点击")(onFuncBtnClick)

	_ui.quitIcon = uiCreate:CreateUIRelative("image", _ui.clickHideIcon, "左侧", _ui.refreshIcon, "右侧", 30, 0, 100, 40, { image = [[]] })
	_ui.quitBtn = uiCreate:CreateUIRelative("button", _ui.quitIcon, "中心", _ui.quitIcon, "中心", 0, 0, 100, 40)
	_ui.quitBtn.index = 3
	_ui.quitBtn:event("进入")(onFuncBtnEnter)
	_ui.quitBtn:event("离开")(onFuncBtnLeave)
	_ui.quitBtn:event("点击")(onFuncBtnClick)

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
end

local function addCardsToDrawPool(playerID, ty)
	if #availableBonds[playerID] > 0 then
		if ty and ty < 4 and ownedBondsTy[playerID][ty] > 0 and ownedBondsTy[playerID][ty] % 3 == 0 then
			local bondTable = {}
			for index, bondID in ipairs(specialBonds[playerID]) do
				if excel["羁绊列表"][bondID].AttrTy == ty then
					table.insert(bondTable, index)
				end
			end
			if #bondTable >= 1 then
				local bondIndex = common:GetRandomInt(1, #bondTable)
				local bondID = myFunc:TableRemove(specialBonds[playerID], bondIndex)
				-- print(bondID)
				for index = 1, excel["羁绊列表"][bondID].InitAmount, 1 do
					table.insert(drawCards[playerID], excel["羁绊列表"][bondID].FirstID + index - 1)
				end
			end
		end
		local randomBond = common:GetRandomInt(1, #availableBonds[playerID])
		local bondIndex = availableBonds[playerID][randomBond]
		myFunc:TableRemove(availableBonds[playerID], randomBond)
		for index = 1, excel["羁绊列表"][bondIndex].InitAmount, 1 do
			table.insert(drawCards[playerID], excel["羁绊列表"][bondIndex].FirstID + index - 1)
		end
	end
end

local function InitPlayerBonds()
	for playerID = 1, 4, 1 do
		drawCards[playerID] = {}
		specialBondData[playerID] = {}
		ownedBonds[playerID] = {}
		ownedBondsTy[playerID] = { 0, 0, 0, 0 }
		swallowCards[playerID] = {}
		cardsSwallowConditionCount[playerID] = {}
		selectedCards[playerID] = {}
		ownedCards[playerID] = {}
		currentCardsID[playerID] = {}
		currentCards[playerID] = {}
		currentCards[playerID].count = 0
		availableBonds[playerID] = {}
		finalBond[playerID] = {}
		specialBonds[playerID] = {}
		for index, value in ipairs(excel["羁绊列表"]) do
			availableBonds[playerID][index] = index
		end
		for i = 1, excel["羁绊列表"][100].InitAmount, 1 do
			finalBond[playerID][i] = excel["羁绊列表"][100].FirstID + i - 1
		end
		for i = 1, 6 do
			if excel["羁绊列表"][100 + i] then
				specialBonds[playerID][i] = 100 + 1
			else
				break
			end
		end
		local bondIndex = {}
		bondIndex[1] = common:GetRandomInt(1, 7)
		bondIndex[2] = common:GetRandomInt(8, 14)
		bondIndex[3] = common:GetRandomInt(15, 21)
		bondIndex[4] = common:GetRandomInt(22, 33)
		bondIndex[5] = common:GetRandomInt(22, 33)
		while bondIndex[4] == bondIndex[5] do
			bondIndex[5] = common:GetRandomInt(22, 33)
		end
		if bondIndex[5] < bondIndex[4] then
			bondIndex[4], bondIndex[5] = bondIndex[5], bondIndex[4]
		end
		-- bondIndex[5] = 26
		for i = 5, 1, -1 do
			myFunc:TableRemove(availableBonds[playerID], bondIndex[i])
			for index = 1, excel["羁绊列表"][bondIndex[i]].InitAmount, 1 do
				table.insert(drawCards[playerID], excel["羁绊列表"][bondIndex[i]].FirstID + index - 1)
			end
		end
	end
end

local function drawCard(playerID)
	local drawAmount = Card.drawCount[playerID]
	myFunc:ClearTable(selectedCards[playerID])
	if #drawCards[playerID] <= drawAmount then
		for count = 1, drawAmount do
			if #drawCards[playerID] <= 0 then
				local randomIndex = common:GetRandomInt(1, #finalBond[playerID])
				local cardID = finalBond[playerID][randomIndex]
				table.insert(selectedCards[playerID], cardID)
				myFunc:TableRemove(finalBond[playerID], randomIndex)
			else
				table.insert(selectedCards[playerID], table.Remove2(drawCards[playerID], #drawCards[playerID]))
			end
		end
	else
		local samples = {}
		for index, cardID in ipairs(drawCards[playerID]) do
			samples[index] = { id = cardID, weight = excel["卡牌"][cardID].Weight, index = index }
		end
		local result = myFunc:ARes(samples, drawAmount)
		table.sort(result, function(a, b)
			return a.index > b.index
		end)
		for index, value in ipairs(result) do
			local cardID = myFunc:TableRemove(drawCards[playerID], value.index)
			table.insert(selectedCards[playerID], cardID)
		end
	end


	if common:IsLocalPlayer(common.Player[playerID]) then
		if not inSelecting[playerID] then
			_ui.Show(drawAmount)
		end
	end
	for i = 1, drawAmount do
		local cardID = selectedCards[playerID][i]
		local cardName = excel["卡牌"][cardID].CardName
		local bondName = excel["卡牌"][cardID].BondName
		local icon = excel["卡牌"][cardID].Icon
		local tip = ""
		if excel["卡牌"][cardID].Attr then
			tip = tip .. excel["卡牌"][cardID].Attr .. "|n|n"
		end
		if excel["卡牌"][cardID].CardEffect then
			tip = tip .. excel["卡牌"][cardID].CardEffect .. "|n|n"
		end
		if excel["卡牌"][cardID].SwallowEffect then
			tip = tip .. "集齐羁绊效果：|n" .. excel["卡牌"][cardID].SwallowEffect .. "|n|n"
		end
		if excel["卡牌"][cardID].SwallowCondition then
			tip = tip .. "吞噬条件：|n" .. excel["卡牌"][cardID].SwallowCondition
		end
		_ui.optionBondName[i]:set_text("羁绊:" .. bondName)
		_ui.optionCardName[i]:set_text(cardName)
		_ui.optionIcon[i]:set_image(icon)
		_ui.optionTip[i]:set_text(tip)
	end
end

local function SwallowBondGetAddition(playerID, bondID)
	if bondID == 22 then
		playerGold[playerID] = playerGold[playerID] + common:GetRandomInt(excel["羁绊列表"][bondID].Value1, excel["羁绊列表"][bondID].Value2) * 100
	end
	if bondID == 31 then
		jass.udg_LgfExtraMaxAmount[playerID] = jass.udg_LgfExtraMaxAmount[playerID] + excel["羁绊列表"][bondID].Value1
	end
	if bondID == 33 then
		if ownedBonds[playerID][bondID] // excel["羁绊列表"][bondID].AllAmount < 3 then
			for index = 1, excel["羁绊列表"][33].InitAmount, 1 do
				table.insert(drawCards[playerID], excel["羁绊列表"][33].FirstID + index - 1)
			end
		else
			local attrTy = excel["羁绊列表"][bondID].AttrTy
			ownedBondsTy[playerID][attrTy] = ownedBondsTy[playerID][attrTy] + 1
			addCardsToDrawPool(playerID, attrTy)
			attrSystem:SetUnitAttrStr(heros[playerID], 0, excel["羁绊列表"][bondID].SwallowAttr)
		end
	end
end

local function SwallowCardAnimEndAction(ui)
	if not _ui.panel.sequenceFrame or _ui.panel.sequenceFrame.P.complete then
		local image = imagePool:GetImage()
		image:set_point2("中心", 1400, 300)
		local w, h = 60, 60
		image:set_wh(w, h)
		image:set_show(true)
		_ui.panel.sequenceFrame = myFunc:SequenceFrame({
			UI = image,
			image = sequenceFrameImage.swallowCard,
			time = sequenceFrameImage.swallowCard.time,
			isLoop = false,
			complete = imagePool.RecycleImage
		})
	else
		_ui.panel.sequenceFrame.nowT = 0
	end
	imagePool.RecycleImage(ui)
end
local function SwallowCardAnim(playerID, index)
	local x, y = 1400, 300
	if common:IsLocalPlayer(common.Player[playerID]) then
		local w, h = _ui.cardIcon[index]:get_wh()
		local x0 = _ui.panel.x - _ui.background:get_w() / 2 + (index - 1) * (w + 2) + w / 2
		local y0 = _ui.panel.y
		local floatUI = imagePool.GetImage()
		floatUI:set_wh(w, h)
		floatUI:set_show(true)
		floatUI:set_image(_ui.cardIcon[index].image)
		floatUI:set_point2("中心", x0, y0)
		-- myFunc:FadePosition { UI = floatUI, time = 0.6 + index * 0.03, ty = '贝塞尔', startP = { x0, y0 }, endP = { x, y }, ctlP1 = { x0 + (x - x0) * 0.2, y0 + 200 + index * 15 },
		-- 	ctlP2 = { x - 150, y + 150 }, complete = SwallowCardAnimEndAction }
		-- myFunc:FadePosition { UI = floatUI, time = 0.65 + index * 0.05, ty = '贝塞尔', startP = { x0, y0 }, endP = { x, y }, ctlP1 = { x0 + 350, y0 + 100 + index * 10 },
		-- 	ctlP2 = { x - 300, y - 150 }, complete = SwallowCardAnimEndAction }
		local animTime = 0.65 + index * 0.03
		myFunc:FadePosition { UI = floatUI, time = animTime, ty = '贝塞尔', startP = { x0, y0 }, endP = { x, y }, ctlP1 = { x0 + (x - x0) * 0.2, y0 + 400 - index * 20 },
			ctlP2 = { x - (x - x0) * 0.2, y + 400 - index * 20 }, complete = SwallowCardAnimEndAction }
		myFunc:FadeSize { UI = floatUI, time = animTime, ty = '二元入出', startP = { w, h }, endP = { 20, 20 } }
	end
end
local _changeSize = 3
local function GetCardAnim(playerID, index)
	if common:IsLocalPlayer(common.Player[playerID]) then
		local image = imagePool:GetImage()
		image:set_point("中心", _ui.cardBg[index], "中心", -1, 153)
		local w, h = _ui.cardBg[index]:get_wh()
		local x, y = image:get_xy()
		image:set_show(true)
		image:set_image(_ui.cardIcon[index].image)
		myFunc:FadeSize { UI = image, time = 0.2, startP = { w * _changeSize, h * _changeSize }, endP = { w, h }, ty = '二元入', complete = function()
			myFunc:FadePosition { UI = image, fUI = _ui.cardBg[index], time = 0.1, startP = { x, y }, endP = { x, y - 150 }, ty = '二元入', complete = function()
				image:set_wh(w * 1.3, h * 1.3)
				myFunc:SequenceFrame({
					UI = image,
					image = sequenceFrameImage.selectOne,
					time = sequenceFrameImage.selectOne.time,
					isLoop = false,
					complete = function()
						imagePool.RecycleImage(image)
					end
				})
			end }
		end }
	end
end

local function SwallowCard(playerID, cardID, index)
	SwallowCardAnim(playerID, index)
	-- if ownedCards[playerID][cardID] <= 1 then
	table.insert(swallowCards[playerID], cardID)
	-- end
	currentCardsID[playerID][cardID] = nil
	currentCards[playerID][index] = nil
	currentCards[playerID].count = currentCards[playerID].count - 1
	if common:IsLocalPlayer(common.Player[playerID]) then
		_ui.cardIcon[index]:set_show(false)
		_ui.cardCountBg[index]:set_show(false)
	end
	local bondID = excel["卡牌"][cardID].BondID
	local ty = excel["羁绊列表"][bondID].SwallowTy
	if bondID == 101 and cardID ~= 366 then
		local count = 0
		for key, value in pairs(specialBondData[playerID][bondID]) do
			count = count + 1
			if value <= 4 then
				break
			end
			if count == 3 then
				table.insert(drawCards[playerID], 366)
			end
		end
	end
	if bondID == 103 and cardID ~= 393 then
		specialBondData[playerID][bondID] = specialBondData[playerID][bondID] or {}
		specialBondData[playerID][bondID].count = (specialBondData[playerID][bondID].count or 0) + 1
		if specialBondData[playerID][bondID].count == 12 then
			table.insert(drawCards[playerID], 393)
		end
	end
	if bondID == 104 and cardID < 409 then
		specialBondData[playerID][bondID] = specialBondData[playerID][bondID] or {}
		specialBondData[playerID][bondID][409] = (specialBondData[playerID][bondID][409] or 0) + 1
		if specialBondData[playerID][bondID][409] == 8 then
			table.insert(drawCards[playerID], 410)
		end
	end
	if ty ~= 1 then
		if ty == 0 then
			if code.IsBondCompleted(playerID, bondID) then
				local attrTy = excel["羁绊列表"][bondID].AttrTy
				ownedBondsTy[playerID][attrTy] = ownedBondsTy[playerID][attrTy] + 1
				addCardsToDrawPool(playerID, attrTy)
				attrSystem:SetUnitAttrStr(heros[playerID], 0, excel["羁绊列表"][bondID].SwallowAttr)
				SwallowBondGetAddition(playerID, bondID)
			end
		end
		if ty == 3 then
			if code.IsBondCompleted(playerID, bondID) then
				addCardsToDrawPool(playerID, 4)
			end
		end
	end
end

local function CheckSwallow(playerID, bondID, cardID, uiIndex)
	local ty = excel["羁绊列表"][bondID].SwallowTy
	if ty == 1 then
		local needCount = excel["羁绊列表"][bondID].NeedAmount
		if ownedBonds[playerID][bondID] >= needCount then
			for id, index in pairs(currentCardsID[playerID]) do
				if bondID == excel["卡牌"][id].BondID then
					SwallowCard(playerID, id, index)
				end
			end
			local attrTy = excel["羁绊列表"][bondID].AttrTy
			ownedBondsTy[playerID][attrTy] = ownedBondsTy[playerID][attrTy] + 1
			addCardsToDrawPool(playerID, attrTy)
			attrSystem:SetUnitAttrStr(heros[playerID], 0, excel["羁绊列表"][bondID].SwallowAttr)
			SwallowBondGetAddition(playerID, bondID)
		end
	end
end

local function GetCard(playerID, bondID, cardID, uiIndex)
	GetCardAnim(playerID, uiIndex)
	--#region 羁绊ID判断
	if bondID == 30 then
		cardsSwallowConditionCount[playerID][cardID] = 0
		if common:IsLocalPlayer(common.Player[playerID]) then
			_ui.cardCount[uiIndex]:set_text(cardsSwallowConditionCount[playerID][cardID])
		end
		local function HeroKill(killer, dead)
			if code.IsCardInColumn(playerID, cardID) then
				cardsSwallowConditionCount[playerID][cardID] = cardsSwallowConditionCount[playerID][cardID] + 1
				if common:IsLocalPlayer(common.Player[playerID]) then
					_ui.cardCountBg[uiIndex]:set_show(true)
					_ui.cardCount[uiIndex]:set_text(cardsSwallowConditionCount[playerID][cardID])
				end
				if cardsSwallowConditionCount[playerID][cardID] >= excel['卡牌'][cardID].Value1 then
					SwallowCard(playerID, cardID, uiIndex)
					event:Off("HeroKill", playerID, HeroKill)
				end
			else
				cardsSwallowConditionCount[playerID][cardID] = 0
				event:Off("HeroKill", playerID, HeroKill)
			end
		end
		event:On("HeroKill", playerID, HeroKill)
	end
	if bondID == 31 then
		cardsSwallowConditionCount[playerID][cardID] = 0
		if common:IsLocalPlayer(common.Player[playerID]) then
			_ui.cardCountBg[uiIndex]:set_show(true)
			_ui.cardCount[uiIndex]:set_text(cardsSwallowConditionCount[playerID][cardID])
		end
		ac.time(1, function(timer)
			if code.IsCardInColumn(playerID, cardID) then
				cardsSwallowConditionCount[playerID][cardID] = cardsSwallowConditionCount[playerID][cardID] + 1
				if common:IsLocalPlayer(common.Player[playerID]) then
					_ui.cardCount[uiIndex]:set_text(cardsSwallowConditionCount[playerID][cardID])
				end
				if cardsSwallowConditionCount[playerID][cardID] >= excel['卡牌'][cardID].Value1 then
					SwallowCard(playerID, cardID, uiIndex)
					timer:rem()
				end
			else
				cardsSwallowConditionCount[playerID][cardID] = 0
				timer:rem()
			end
		end)
	end
	if bondID == 32 then
		cardsSwallowConditionCount[playerID][cardID] = 0
		if common:IsLocalPlayer(common.Player[playerID]) then
			_ui.cardCount[uiIndex]:set_text(cardsSwallowConditionCount[playerID][cardID])
		end
		local function HeroAtk(attacker, target)
			if code.IsCardInColumn(playerID, cardID) then
				cardsSwallowConditionCount[playerID][cardID] = cardsSwallowConditionCount[playerID][cardID] + 1
				if common:IsLocalPlayer(common.Player[playerID]) then
					_ui.cardCountBg[uiIndex]:set_show(true)
					_ui.cardCount[uiIndex]:set_text(cardsSwallowConditionCount[playerID][cardID])
				end
				if cardsSwallowConditionCount[playerID][cardID] >= excel['卡牌'][cardID].Value1 then
					SwallowCard(playerID, cardID, uiIndex)
					event:Off("HeroAtk", playerID, HeroAtk)
				end
			else
				cardsSwallowConditionCount[playerID][cardID] = 0
				event:Off("HeroAtk", playerID, HeroAtk)
			end
		end
		event:On("HeroAtk", playerID, HeroAtk)
	end
	if bondID == 33 then
		local needCount = excel["羁绊列表"][bondID].NeedAmount
		if ownedBonds[playerID][bondID] % needCount == 0 then
			for i = 1, 10, 1 do
				local id = currentCards[playerID][i]
				if id then
					if bondID == excel["卡牌"][id].BondID then
						SwallowCard(playerID, id, i)
					end
				end
			end

			SwallowBondGetAddition(playerID, bondID)
		end
	end
	if bondID == 101 then
		if cardID == 366 then
			for key, value in pairs(currentCardsID[playerID]) do
				if excel["卡牌"][key].BondID == bondID and key ~= cardID then
					SwallowCard(playerID, key, value)
				end
			end
		end
		if (excel["卡牌"][cardID].Value1 or "") == "吞噬卡" then
			cardsSwallowConditionCount[playerID][cardID] = 0
			specialBondData[playerID][bondID] = specialBondData[playerID][bondID] or {}
			specialBondData[playerID][bondID][cardID] = specialBondData[playerID][bondID][cardID] or 1
			if common:IsLocalPlayer(common.Player[playerID]) then
				_ui.cardCount[uiIndex]:set_text(cardsSwallowConditionCount[playerID][cardID])
			end
			local function HeroKill(killer, dead)
				if code.IsCardOwned(playerID, cardID) and not code.IsCardOwned(playerID, 366) then
					cardsSwallowConditionCount[playerID][cardID] = cardsSwallowConditionCount[playerID][cardID] + 1
					if code.IsCardInColumn(playerID, cardID) then
						if common:IsLocalPlayer(common.Player[playerID]) then
							_ui.cardCountBg[uiIndex]:set_show(true)
							_ui.cardCount[uiIndex]:set_text(cardsSwallowConditionCount[playerID][cardID])
						end
					end

					if cardsSwallowConditionCount[playerID][cardID] >= excel['卡牌'][cardID].Value2 then
						if specialBondData[playerID][bondID][cardID] <= 4 then
							for i = 1, 4 do
								if code.IsCardInColumn(playerID, cardID + i) then
									specialBondData[playerID][bondID][cardID] = specialBondData[playerID][bondID][cardID] + 1
									SwallowCard(playerID, cardID + i, currentCardsID[playerID][cardID + i])
									break
								end
							end
						end
						cardsSwallowConditionCount[playerID][cardID] = 0
					end
				else
					cardsSwallowConditionCount[playerID][cardID] = 0
					event:Off("HeroKill", playerID, HeroKill)
				end
			end
			event:On("HeroKill", playerID, HeroKill)
		end
	end
	if bondID == 102 then
		if cardID == 371 then
			cardsSwallowConditionCount[playerID][cardID] = 0
			specialBondData[playerID][bondID] = specialBondData[playerID][bondID] or {}
			specialBondData[playerID][bondID][cardID] = specialBondData[playerID][bondID][cardID] or { 372, 373, 374, 375, 376, 377 }
			if common:IsLocalPlayer(common.Player[playerID]) then
				_ui.cardCount[uiIndex]:set_text(cardsSwallowConditionCount[playerID][cardID])
			end
			local function HeroKill(killer, dead)
				if code.IsCardOwned(playerID, cardID) and not code.IsCardOwned(playerID, 378) then
					cardsSwallowConditionCount[playerID][cardID] = cardsSwallowConditionCount[playerID][cardID] + 1
					if code.IsCardInColumn(playerID, cardID) then
						if common:IsLocalPlayer(common.Player[playerID]) then
							_ui.cardCountBg[uiIndex]:set_show(true)
							_ui.cardCount[uiIndex]:set_text(cardsSwallowConditionCount[playerID][cardID])
						end
					end
					if cardsSwallowConditionCount[playerID][cardID] >= excel['卡牌'][cardID].Value1 then
						if #specialBondData[playerID][bondID][cardID] > 0 then
							table.insert(drawCards[playerID], myFunc:TableRemove(specialBondData[playerID][bondID][cardID], common:GetRandomInt(1, #specialBondData[playerID][bondID][cardID])))
						else
							event:Off("HeroKill", playerID, HeroKill)
						end
						cardsSwallowConditionCount[playerID][cardID] = 0
					end
				else
					event:Off("HeroKill", playerID, HeroKill)
				end
			end
			event:On("HeroKill", playerID, HeroKill)
		end
		if cardID == 378 then
			for i = 1, 7 do
				if code.IsCardInColumn(playerID, 370 + i) then
					SwallowCard(playerID, 370 + i, currentCardsID[playerID][370 + i])
				end
			end
		end
		if not specialBondData[playerID][bondID][378] then
			for i = 1, 6 do
				if not code.IsCardOwned(playerID, 371 + i) then
					break
				else
					if i == 6 then
						table.insert(drawCards[playerID], 378)
						specialBondData[playerID][bondID][378] = true
					end
				end
			end
		end
	end
	if bondID == 103 then
		if excel["卡牌"][cardID].Value1 == "普通卡" then
			print(cardID, excel["卡牌"][cardID].Value1)
			table.insert(drawCards[playerID], cardID + 6)
		end
		if excel["卡牌"][cardID].Value1 == "吞噬卡" then
			cardsSwallowConditionCount[playerID][cardID] = 0
			if common:IsLocalPlayer(common.Player[playerID]) then
				_ui.cardCount[uiIndex]:set_text(cardsSwallowConditionCount[playerID][cardID])
			end
			local function HeroAtk(attacker, target)
				if code.IsCardOwned(playerID, cardID) then
					cardsSwallowConditionCount[playerID][cardID] = cardsSwallowConditionCount[playerID][cardID] + 1
					if code.IsCardInColumn(playerID, cardID) then
						if common:IsLocalPlayer(common.Player[playerID]) then
							_ui.cardCountBg[uiIndex]:set_show(true)
							_ui.cardCount[uiIndex]:set_text(cardsSwallowConditionCount[playerID][cardID])
						end
					end
					if cardsSwallowConditionCount[playerID][cardID] >= excel['卡牌'][cardID].Value2 then
						if code.IsCardOwned(playerID, cardID - 6) then
							if code.IsCardInColumn(playerID, cardID) then
								SwallowCard(playerID, cardID, uiIndex)
							end
							if code.IsCardInColumn(playerID, cardID - 6) then
								SwallowCard(playerID, cardID - 6, currentCardsID[playerID][cardID - 6])
							end
							event:Off("HeroAtk", playerID, HeroAtk)
						else
							cardsSwallowConditionCount[playerID][cardID] = 0
						end
					end
				end
			end
			event:On("HeroAtk", playerID, HeroAtk)
		end
	end
	if bondID == 104 then
		if excel["卡牌"][cardID].Value1 == "普通卡" then
			if ownedBonds[playerID][bondID] >= 5 and not specialBondData[playerID][410] then
				specialBondData[playerID][410] = true
				table.insert(drawCards[playerID], 409)
			end
			if code.IsCardOwned(playerID, 409) then
				SwallowCard(playerID, cardID, uiIndex)
			end
		end
		if cardID == 409 then
			for i = 1, 8 do
				if code.IsCardInColumn(playerID, 400 + i) then
					SwallowCard(playerID, 400 + i, currentCardsID[playerID][400 + i])
				end
			end
		end
		if cardID == 410 then
			if code.IsCardInColumn(playerID, 409) then
				SwallowCard(playerID, 409, currentCardsID[playerID][409])
			end
		end
	end
	if bondID == 105 then
		if cardID < 426 then
			table.insert(drawCards[playerID], cardID)
		end
		if cardID == 426 then
			specialBondData[playerID][bondID] = specialBondData[playerID][bondID] or {}
			specialBondData[playerID][bondID][cardID] = (specialBondData[playerID][bondID][cardID] or 0) + 1
			if specialBondData[playerID][bondID][cardID] < 3 then
				table.insert(drawCards[playerID], cardID)
			elseif specialBondData[playerID][bondID][cardID] == 3 then
				for i = #drawCards[playerID], 1, -1 do
					if excel["卡牌"][drawCards[playerID][i]].BondID == bondID then
						myFunc:TableRemove(drawCards[playerID], i)
					end
				end
				table.insert(drawCards[playerID], 427)
			end
			for i = 1, 10 do
				local id = currentCards[playerID][i]
				if id and excel["卡牌"][id].BondID == bondID and id < 426 then
					SwallowCard(playerID, id, i)
				end
			end
		end
		if cardID == 427 then
			for i = 1, 10 do
				local id = currentCards[playerID][i]
				if id and id == 426 then
					SwallowCard(playerID, id, i)
				end
			end
		end
	end
	if bondID == 106 then
		specialBondData[playerID][bondID] = specialBondData[playerID][bondID] or {}
		if cardID == 436 then
			specialBondData[playerID][bondID][cardID] = (specialBondData[playerID][bondID][cardID] or 0) + 1
			if specialBondData[playerID][bondID][cardID] < 10 then
				table.insert(drawCards[playerID], cardID)
			end
			if specialBondData[playerID][bondID][cardID] > 5 and not specialBondData[playerID][bondID][437] then
				specialBondData[playerID][bondID][437] = true
				table.insert(drawCards[playerID], 437)
			end
			local function HeroKill()
				if code.IsCardInColumn(playerID, cardID) then
					cardsSwallowConditionCount[playerID][cardID] = cardsSwallowConditionCount[playerID][cardID] or {}
					cardsSwallowConditionCount[playerID][cardID][uiIndex] = (cardsSwallowConditionCount[playerID][cardID][uiIndex] or 0) + 1
					if common:IsLocalPlayer(common.Player[playerID]) then
						_ui.cardCountBg[uiIndex]:set_show(true)
						_ui.cardCount[uiIndex]:set_text(cardsSwallowConditionCount[playerID][cardID][uiIndex])
					end
					if cardsSwallowConditionCount[playerID][cardID][uiIndex] >= excel['卡牌'][cardID].Value1 then
						SwallowCard(playerID, cardID, uiIndex)
						event:Off("HeroKill", playerID, HeroKill)
					end
				else
					cardsSwallowConditionCount[playerID][cardID][uiIndex] = 0
					event:Off("HeroKill", playerID, HeroKill)
				end
			end
			event:On("HeroKill", playerID, HeroKill)
		end
		if cardID == 437 then
			for i = 1, 10 do
				local id = currentCards[playerID][i]
				if id and excel["卡牌"][id].BondID == bondID and id < 437 then
					SwallowCard(playerID, id, i)
				end
			end
			for i = #drawCards[playerID], 1, -1 do
				if excel["卡牌"][drawCards[playerID][i]].BondID == bondID then
					myFunc:TableRemove(drawCards[playerID], i)
				end
			end
		end
	end
	--#endregion
	CheckSwallow(playerID, bondID, cardID, uiIndex)
end

common:ReceiveSync("SelectCard")(function(data)
	local player = common:GetSyncPlayer()
	local playerID = common:ConvertPlayerToID(player)
	local cardID = selectedCards[playerID][data]
	for index, id in ipairs(selectedCards[playerID]) do
		if id <= 20 then
			table.insert(finalBond[playerID], id)
		elseif cardID ~= id then
			table.insert(drawCards[playerID], id)
		end
	end
	if currentCards[playerID].count < 10 then
		inSelecting[playerID] = false
		currentCards[playerID].count = currentCards[playerID].count + 1
		ownedCards[playerID][cardID] = (ownedCards[playerID][cardID] or 0) + 1
		attrSystem:SetUnitAttrStr(heros[playerID], 0, excel["卡牌"][cardID].Attr)
		for i = 1, 10 do
			if not currentCards[playerID][i] then
				currentCards[playerID][i] = cardID
				local icon = excel["卡牌"][cardID].Icon
				if common:IsLocalPlayer(player) then
					_ui.cardIcon[i]:set_image(icon)
					_ui.cardIcon[i]:set_show(true)
				end
				currentCardsID[playerID][cardID] = i
				local bondID = excel["卡牌"][cardID].BondID
				ownedBonds[playerID][bondID] = (ownedBonds[playerID][bondID] or 0) + 1
				GetCard(playerID, bondID, cardID, i)
				-- CheckSwallow(playerID, bondID, cardID, i)
				break
			end
		end
	else
		waitCard[playerID] = cardID
		if common:IsLocalPlayer(common.Player[playerID]) then
			inReplacing = true
			_ui.replaceIcon:set_image(excel["卡牌"][cardID].Icon)
			_ui.replaceIcon:set_show(true)
		end
	end

	myFunc:ClearTable(selectedCards[playerID])
end)

common:ReceiveSync("ReplaceCard")(function(data)
	local player = common:GetSyncPlayer()
	local playerID = common:ConvertPlayerToID(player)
	local cardID = currentCards[playerID][data]
	if cardID then
		local bondID = excel["卡牌"][cardID].BondID
		ownedBonds[playerID][bondID] = ownedBonds[playerID][bondID] - 1
		ownedCards[playerID][cardID] = ownedCards[playerID][cardID] - 1
		currentCards[playerID].count = currentCards[playerID].count - 1
		currentCardsID[playerID][cardID] = nil
		attrSystem:SetUnitAttrStr(heros[playerID], 1, excel["卡牌"][cardID].Attr)
		if cardID <= 20 then
			-- table.insert(finalBond[playerID], cardID)
		else
			if not excel["卡牌"][cardID].MultiSel then
				table.insert(drawCards[playerID], cardID)
			end
		end
	end
	cardID = waitCard[playerID]
	currentCards[playerID].count = currentCards[playerID].count + 1
	waitCard[playerID] = nil
	currentCards[playerID][data] = cardID
	currentCardsID[playerID][cardID] = data
	local icon = excel["卡牌"][cardID].Icon
	local bondID = excel["卡牌"][cardID].BondID
	ownedBonds[playerID][bondID] = (ownedBonds[playerID][bondID] or 0) + 1
	ownedCards[playerID][cardID] = (ownedCards[playerID][cardID] or 0) + 1
	attrSystem:SetUnitAttrStr(heros[playerID], 0, excel["卡牌"][cardID].Attr)
	GetCard(playerID, bondID, cardID, data)
	-- CheckSwallow(playerID, bondID, cardID, data)
	if common:IsLocalPlayer(player) then
		if currentCards[playerID][data] then
			_ui.cardIcon[data]:set_image(icon)
			_ui.cardIcon[data]:set_show(true)
		else
			onCardLeave(_ui.cardBtn[data])
		end
	end
	inSelecting[playerID] = false
end)

common:ReceiveSync("RefreshCard")(function()
	local player = common:GetSyncPlayer()
	local playerID = common:ConvertPlayerToID(player)
	if refreshCardCount[playerID] > 0 then
		refreshCardCount[playerID] = refreshCardCount[playerID] - 1
		local tempCards = {}
		if #finalBond[playerID] + #drawCards[playerID] >= Card.drawCount[playerID] then
			for index, id in ipairs(selectedCards[playerID]) do
				table.insert(tempCards, id)
			end
		else
			for index, id in ipairs(selectedCards[playerID]) do
				if id <= 20 then
					table.insert(finalBond[playerID], id)
				else
					table.insert(drawCards[playerID], id)
				end
			end
		end
		myFunc:ClearTable(selectedCards[playerID])
		drawCard(playerID)
		for index, id in ipairs(tempCards) do
			if id <= 20 then
				table.insert(finalBond[playerID], id)
			else
				table.insert(drawCards[playerID], id)
			end
		end
		if common:IsLocalPlayer(common.Player[playerID]) then
			onFuncBtnEnter(_ui.refreshBtn)
		end
	else
		code.AddMessage("刷新次数不足", playerID)
	end
end)

common:ReceiveSync("QuitSelectCard")(function()
	local player = common:GetSyncPlayer()
	local playerID = common:ConvertPlayerToID(player)
	inSelecting[playerID] = false
	refreshCardCount[playerID] = refreshCardCount[playerID] + 1
	for index, id in ipairs(selectedCards[playerID]) do
		if id <= 20 then
			table.insert(finalBond[playerID], id)
		else
			table.insert(drawCards[playerID], id)
		end
	end
	myFunc:ClearTable(selectedCards[playerID])
end)

event:OnKeyBoard("Z", 1, function(playerID)
	if inSelecting[playerID] then
		if common:IsLocalPlayer(common.Player[playerID]) then
			_ui.optionPanel:set_show(not _ui.optionPanel:is_show())
		end
	else
		if playerKills[playerID] >= drawCost[playerID] then
			playerKills[playerID] = playerKills[playerID] - drawCost[playerID] * (1 - jass.udg_DrawCardCostReduce[playerID])
			drawCost[playerID] = drawCost[playerID] + 150
			drawCard(playerID)
			inSelecting[playerID] = true
			if common:IsLocalPlayer(common.Player[playerID]) then
				_ui.drawText:set_text("|cff000000(Z)抽卡 " .. drawCost[playerID])
			end
		end
	end
end)

function code.UseSwallowRock(playerID)
	if currentCards[playerID].count > 0 then
		local cardIndex = common:GetRandomInt(1, currentCards[playerID].count)
		for i = 1, 10 do
			local cardID = currentCards[playerID][i]
			if cardID then
				cardIndex = cardIndex - 1
				if cardIndex == 0 then
					SwallowCard(playerID, cardID, i)
					-- local bondID = excel["卡牌"][cardID].BondID
					-- if excel["羁绊列表"][bondID].SwallowTy == 1 then
					-- 	CheckSwallow(playerID, bondID, cardID, i)
					-- else
					-- end
					break
				end
			end
		end
		return true
	else
		return false
	end
end

function code.IsCardInColumn(playerID, cardID)
	if currentCardsID[playerID][cardID] then
		return true
	end
	return false
end

function code.IsCardOwned(playerID, cardID)
	if ownedCards[playerID][cardID] and ownedCards[playerID][cardID] > 0 then
		return true
	end
	return false
end

function code.IsBondCompleted(playerID, bondID)
	if bondID == 105 then
		if code.IsCardOwned(playerID, 427) and not code.IsCardInColumn(playerID, 427) then
			return true
		else
			return false
		end
	end
	if bondID == 106 then
		if code.IsCardOwned(playerID, 437) and not code.IsCardInColumn(playerID, 437) then
			return true
		else
			return false
		end
	end
	if ownedBonds[playerID][bondID] and ownedBonds[playerID][bondID] >= excel["羁绊列表"][bondID].AllAmount then
		if bondID == 30 or bondID == 31 or bondID == 32 then
			for cardID = excel["羁绊列表"][bondID].FirstID, excel["羁绊列表"][bondID].AllAmount + excel["羁绊列表"][bondID].FirstID, 1 do
				if code.IsCardInColumn(playerID, cardID) then
					return false
				end
			end
			return true
		end
		if bondID == 101 then
			if code.IsCardInColumn(playerID, 366) then
				return false
			else
				return true
			end
		end
		if bondID == 102 then
			if code.IsCardInColumn(playerID, 378) then
				return false
			else
				return true
			end
		end
		if bondID == 103 then
			if code.IsCardInColumn(playerID, 393) then
				return false
			else
				return true
			end
		end
		if bondID == 104 then
			if code.IsCardInColumn(playerID, 410) then
				return false
			else
				return true
			end
		end
		return true
	end
	return false
end

function code.OwnedCardAmount(playerID, cardID)
	return ownedCards[playerID][cardID] or 0
end

function Card:Init()
	UIInit()

	InitPlayerBonds()
end

return Card
