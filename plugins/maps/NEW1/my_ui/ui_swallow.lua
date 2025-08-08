local jass          = require "jass.common"
local japi          = require "jass.japi"
local code          = require "jass.code"
local Module        = require "my_base.base_module_manager"
local myFunc        = Module.MyFunc
local event         = Module.Event
local common        = Module.Common
local uiCreate      = Module.UICreate
local excel         = Module.ExcelSystem
local font          = "fonts\\LXWK_Bold.ttf"
local textTipUp     = Module.UITipDialog.tipOnlyTextUp
local math          = math

local tipDialogDown = Module.UITipDialog.tipDialogDown


local Swallow = {}

local _ui     = {}

Swallow.ui    = _ui


function Swallow:Init()
	local UIModule        = require "my_ui.ui_module_manager"
	local swallowedHeroes = UIModule.SeizeBody.swallowedHeroes
	local swallowEquip    = { {}, {}, {}, {} }
	local cardModule      = UIModule.Card
	local _currentPage    = 1
	local wBtn, hBtn      = 60, 60
	local xBtn, yBtn      = 1400, 300
	local OpenUI          = {}
	OpenUI.panel          = gameui:builder 'panel' { w = 1, h = 1, xy = { '中心', xBtn, yBtn }, show = true }
	OpenUI.background     = OpenUI.panel:builder "image" { w = wBtn, h = hBtn, xy = { "中心", OpenUI.panel, "中心", 0, 0 }, image = [[]] }
	OpenUI.btn            = OpenUI.background:builder "button" { w = wBtn, h = hBtn, xy = { "中心", OpenUI.background, "中心", 0, 0 } }
	OpenUI.btn:event("进入")(function(btn)
		local playerID = common:GetLocalPlayerID()
		local tip = "[当前羁绊]|n|n"
		for bondID, count in pairs(cardModule.ownedBonds[playerID]) do
			local bondName = excel:GetData("羁绊列表", bondID, "BondName")
			tip = tip .. bondName .. "：" .. count .. "|n"
		end
		textTipUp.panel:reset_allpoint()
		textTipUp.panel:set_show(true)
		textTipUp.panel:set_point("中心", btn, "左上", 12, 20)
		textTipUp.tips:set_text(tip)
	end)
	OpenUI.btn:event("离开")(function()
		textTipUp.panel:set_show(false)
	end)
	OpenUI.btn:event("点击")(function()
		local playerID = common:GetLocalPlayerID()
		local count = #cardModule.swallowCards[playerID] + #swallowedHeroes[playerID] + #swallowEquip[playerID]
		local allPage = (count - 1) // 35 + 1
		allPage = math.max(1, allPage)
		_currentPage = 1
		local uiIndex = 0
		for _, id in ipairs(swallowedHeroes[playerID]) do
			uiIndex = uiIndex + 1
			if uiIndex > 35 then
				break
			end
			local icon = excel:GetData("夺舍", id, "Icon")
			_ui.icon[uiIndex]:set_show(true)
			_ui.icon[uiIndex]:set_image(icon)
			_ui.iconBtn[uiIndex].ty = "英雄"
			_ui.iconBtn[uiIndex].id = id
		end
		for _, id in ipairs(swallowEquip[playerID]) do
			uiIndex = uiIndex + 1
			if uiIndex > 35 then
				break
			end
			local icon = excel:GetData("神通", id, "Icon")
			_ui.icon[uiIndex]:set_show(true)
			_ui.icon[uiIndex]:set_image(icon)
			_ui.iconBtn[uiIndex].ty = "装备"
			_ui.iconBtn[uiIndex].id = id
		end
		for _, cardID in ipairs(cardModule.swallowCards[playerID]) do
			uiIndex = uiIndex + 1
			if uiIndex > 35 then
				break
			end
			local icon = excel:GetData("卡牌", cardID, "Icon")
			_ui.icon[uiIndex]:set_show(true)
			_ui.icon[uiIndex]:set_image(icon)
			_ui.iconBtn[uiIndex].ty = "卡牌"
			_ui.iconBtn[uiIndex].id = cardID
		end
		_ui.title:set_text("已吞噬(" .. count .. ")")
		_ui.panel:set_show(not _ui.panel:is_show())
		_ui.pageText:set_text(_currentPage .. " / " .. allPage)
	end)

	_ui.panel = uiCreate:CreateUIAbsolute("panel", gameui, "中心", 960, 640, 1, 1, { isShow = false })
	_ui.background = uiCreate:CreateUIRelative("image", _ui.panel, "中心", _ui.panel, "中心", 0, 0, 610, 500, { image = [[UI\Widgets\ToolTips\Human\human-tooltip-background.blp]] })
	_ui.closeIcon = uiCreate:CreateUIRelative("image", _ui.panel, "中心", _ui.background, "右上", 0, 0, 50, 50, { image = [[Survival\UI\Archive\close.tga]] })
	_ui.closeBtn = uiCreate:CreateUIRelative("button", _ui.panel, "中心", _ui.closeIcon, "中心", 0, 0, 50, 50)
	_ui.closeBtn:event("点击")(function()
		_ui.panel:set_show(false)
	end)
	_ui.title     = uiCreate:CreateUIRelative("text", _ui.panel, "顶部", _ui.background, "顶部", 0, -10, 300, 0, { font = font, fontSize = 30, align = "居中" })
	_ui.highlight = uiCreate:CreateUIRelative("image", _ui.panel, "中心", _ui.panel, "中心", 0, 0, 1, 1, { isShow = false, image = [[Survival\UI\highlight.tga]] })
	_ui.highlight:set_level(2)
	_ui.pageText = uiCreate:CreateUIRelative("text", _ui.panel, "底部", _ui.background, "底部", 0, 10, 100, 0, { font = font, fontSize = 23, align = "居中" })
	_ui.pageText:set_text("1 / 1")
	_ui.prePageIcon = uiCreate:CreateUIRelative("image", _ui.pageText, "右侧", _ui.pageText, "左侧", 0, 0, 30, 30, { image = [[]] })
	_ui.prePageBtn = uiCreate:CreateUIRelative("button", _ui.prePageIcon, "中心", _ui.prePageIcon, "中心", 0, 0, 30, 30)
	local function _ClickPageBtn(firstIndex, playerID)
		local uiIndex = 0
		if firstIndex < #swallowedHeroes[playerID] then
			for i = firstIndex + 1, #swallowedHeroes[playerID], 1 do
				uiIndex = uiIndex + 1
				if uiIndex > 35 then
					break
				end
				local id = swallowedHeroes[playerID][i]
				local icon = excel:GetData("夺舍", id, "Icon")
				_ui.icon[uiIndex]:set_show(true)
				_ui.icon[uiIndex]:set_image(icon)
				_ui.iconBtn[uiIndex].ty = "英雄"
				_ui.iconBtn[uiIndex].id = id
			end
		end
		firstIndex = math.max(0, firstIndex - #swallowedHeroes[playerID])
		if firstIndex < #swallowEquip[playerID] then
			for i = firstIndex + 1, #swallowEquip[playerID] do
				uiIndex = uiIndex + 1
				if uiIndex > 35 then
					break
				end
				local id = swallowEquip[playerID][i]
				local icon = excel:GetData("神通", id, "Icon")
				_ui.icon[uiIndex]:set_show(true)
				_ui.icon[uiIndex]:set_image(icon)
				_ui.iconBtn[uiIndex].ty = "装备"
				_ui.iconBtn[uiIndex].id = id
			end
		end
		firstIndex = math.max(0, firstIndex - #swallowEquip[playerID])
		if firstIndex < #cardModule.swallowCards[playerID] then
			for i = firstIndex + 1, #cardModule.swallowCards[playerID], 1 do
				uiIndex = uiIndex + 1
				if uiIndex > 35 then
					break
				end
				local cardID = cardModule.swallowCards[playerID][i]
				local icon = excel:GetData("卡牌", cardID, "Icon")
				_ui.icon[uiIndex]:set_show(true)
				_ui.icon[uiIndex]:set_image(icon)
				_ui.iconBtn[uiIndex].ty = "卡牌"
				_ui.iconBtn[uiIndex].id = cardID
			end
		end
	end
	_ui.prePageBtn:event("点击")(function()
		local playerID = common:GetLocalPlayerID()
		local count = #cardModule.swallowCards[playerID] + #swallowedHeroes[playerID] + #swallowEquip[playerID]
		local allPage = (count - 1) // 35 + 1
		if allPage > 1 and _currentPage > 1 then
			for i = 1, 35 do
				_ui.icon[i]:set_show(false)
			end
			_currentPage = _currentPage - 1
			local firstIndex = (_currentPage - 1) * 35
			_ui.pageText:set_text(_currentPage .. " / " .. allPage)
			_ClickPageBtn(firstIndex, playerID)
		end
	end)
	_ui.nextPageIcon = uiCreate:CreateUIRelative("image", _ui.pageText, "左侧", _ui.pageText, "右侧", 0, 0, 30, 30, { image = [[]] })
	_ui.nextPageBtn = uiCreate:CreateUIRelative("button", _ui.nextPageIcon, "中心", _ui.nextPageIcon, "中心", 0, 0, 30, 30)
	_ui.nextPageBtn:event("点击")(function()
		local playerID = common:GetLocalPlayerID()
		local count = #cardModule.swallowCards[playerID] + #swallowedHeroes[playerID] + #swallowEquip[playerID]
		local allPage = (count - 1) // 35 + 1
		if allPage > 1 and _currentPage < allPage then
			for i = 1, 35 do
				_ui.icon[i]:set_show(false)
			end
			_currentPage = _currentPage + 1
			local firstIndex = (_currentPage - 1) * 35
			_ui.pageText:set_text(_currentPage .. " / " .. allPage)
			_ClickPageBtn(firstIndex, playerID)
		end
	end)


	local function _EnterBtn(btn)
		local ty = btn.ty
		local id = btn.id
		local icon, name, intro, tips
		if ty == "卡牌" then
			icon = excel:GetData("卡牌", id, "Icon")
			name = excel:GetData("卡牌", id, "CardName")
			intro = excel:GetData("卡牌", id, "BondName")
			tips = excel:GetData("卡牌", id, "Tip")
			intro = "羁绊: " .. intro
		end
		if ty == "英雄" then
			name = excel:GetData("夺舍", id, "Name")
			tips = excel:GetData("夺舍", id, "Tips")
			icon = excel:GetData("夺舍", id, "Icon")
			intro = "夺舍效果"
		end
		tipDialogDown.intro:set_text(intro)
		tipDialogDown.icon:set_image(icon)
		tipDialogDown.name:set_text(name)
		tipDialogDown.tips:set_text(tips)
		tipDialogDown.panel:reset_allpoint()
		tipDialogDown.panel:set_point("中心", btn, "右上", 12, -8)
		tipDialogDown.panel:set_show(true)
		local w, h = btn:get_wh()
		_ui.highlight:set_wh(w, h)
		_ui.highlight:reset_allpoint()
		_ui.highlight:set_point("中心", btn, "中心", 0, 0)
		_ui.highlight:set_show(true)
	end
	local function _LeaveBtn(btn)
		tipDialogDown.panel:set_show(false)
		_ui.highlight:set_show(false)
	end
	_ui.slots = {}
	_ui.icon = {}
	_ui.iconBtn = {}
	local w, h = 70, 70
	local d = 12
	local column = 7
	local row = 5
	local frame = [[Survival\UI\Console\itemSlot.tga]]
	for i = 1, row do
		for j = 1, column do
			local l = (i - 1) * column + j
			if j == 1 then
				_ui.slots[l] = uiCreate:CreateUIRelative("image", _ui.panel, "中心", _ui.background, "中心", (j - (column + 1) / 2) * (d + w), -5 - (i - (row + 1) / 2) * (d + h), w, h, { image = frame })
			else
				_ui.slots[l] = uiCreate:CreateUIRelative("image", _ui.panel, "中心", _ui.slots[l - 1], "中心", w + d, 0, w, h, { image = frame })
			end
			_ui.icon[l] = uiCreate:CreateUIRelative("image", _ui.slots[l], "中心", _ui.slots[l], "中心", 0, 0, w - 10, h - 10, { image = [[]], isShow = false })
			_ui.iconBtn[l] = uiCreate:CreateUIRelative("button", _ui.icon[l], "中心", _ui.icon[l], "中心", 0, 0, w, h)
			_ui.iconBtn[l].index = l
			_ui.iconBtn[l]:event("进入")(_EnterBtn)
			_ui.iconBtn[l]:event("离开")(_LeaveBtn)
		end
	end
end

return Swallow
