local BaseModule = require "my_base.base_module_manager"
local code       = require "jass.code"
local jass       = require "jass.common"
local myFunc     = BaseModule.MyFunc
local uiCreate   = BaseModule.UICreate
local common     = BaseModule.Common
local archive    = BaseModule.Archive
local tipDown    = BaseModule.UITipDialog.tipDialogDown
local excel      =  BaseModule.Excel

local players    = jass.udg_Player
local font       = "fonts\\LXWK_Bold.ttf"
local japi       = require "jass.japi"
local shadowIcon = [[UI\Widgets\ToolTips\Human\human-tooltip-background.blp]]

local Decorate   = {}
local ui         = {}
Decorate.ui      = ui

function Decorate:Init()
	ui.highlightIcon = uiCreate:CreateUIAbsolute("image", gameui, "中心", 0, 0, 1, 1, { image = "Survival\\UI\\highlight.tga", alpha = 0.7, isShow = false })
	ui.highlightIcon:set_level(2)
	ui.panelList   = {}
	ui.currentList = 1
	local function CategoryInit()
		local column, totalRow = 1, 1
		local w, h, h_view = 100, 42, 520
		local d = 15
		local wBtn, hBtn = 55, 55
		local xBtn, yBtn = 385 + 55 * 0, 215 - 55 * 2 -- 功能按钮绝对位置
		local frame = [[Survival\UI\Archive\option.tga]]
		local OpenUI = {}
		OpenUI["Panel"] = gameui:builder 'panel' { w = 1, h = 1, xy = { '中心', 0, 0 }, show = true }
		OpenUI["Panel"]:set_point2("中心", xBtn, yBtn)
		OpenUI["Icon"] = OpenUI["Panel"]:builder "image" { w = wBtn, h = hBtn, xy = { "中心", OpenUI["Panel"], "中心", 0, 0 }, image = [[Survival\UI\Archive\decorate.tga]] }
		OpenUI["Button"] = OpenUI["Icon"]:builder "button" { w = wBtn, h = hBtn, xy = { "中心", OpenUI["Icon"], "中心", 0, 0 } }
		local uiButton = OpenUI["Button"]
		uiButton:event "点击" (function()
			ui.panel:set_show(not ui.panel._show)
		end)

		ui.panel = gameui:builder 'panel' { w = 1, h = 1, xy = { '中心', 0, 0 }, show = false }
		ui.panel:set_point2("中心", 960, 930)
		ui.background = ui.panel:builder 'image' { w = 1060 * 0.8, h = 650 * 0.8, xy = { "顶部", ui.panel, "中心", 0, 0 }, image = [[Survival\UI\Archive\background.tga]] }
		japi.FrameSetIgnoreTrackEvents(ui.background.handle, false)
		ui.title = ui.background:builder "image" { w = 300 * 0.8, h = 128 * 0.8, xy = { "中心", ui.background, "顶部", 0, 0 }, image = [[Survival\UI\Archive\decorateTitle.tga]] }
		ui.tip = uiCreate:CreateUIRelative("text", ui.background, "左下", ui.background, "左下", 55, 40, 500, 0, { font = font, align = '左侧', fontSize = 20 })
		ui.tip:set_text("|cffaaaaaa左键点击对应皮肤穿戴, 右键点击可直接脱下")


		ui.closeIcon = ui.panel:builder 'image' { w = 50, h = 50, xy = { "中心", ui.background, "右上", -10, -10 }, image = [[Survival\UI\Archive\close.tga]] }
		ui.closeBtn = ui.closeIcon:builder 'button' { w = 50, h = 50, xy = { "中心", ui.closeIcon, "中心", 0, 0 } }
		ui.closeBtn:event "点击" (function()
			ui.panel:set_show(false)
		end)

		ui.categoryPanel = ui.background:builder 'button' { w = w, h = h_view, xy = { '左侧', ui.background, '左侧', 55, -52 } }
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
		ui.slotsName[1]:set_text("英雄皮肤")
	end

	local function HeroSkinInit()
		local w, h = 70, 70
		local d = 14
		local frame = [[StarRail\star_3.tga]]
		ui.heroSkin = {}
		ui.heroSkin.firstIndex = 700
		ui.heroSkin.count = 7
		local firstIndex, count = ui.heroSkin.firstIndex, ui.heroSkin.count
		local column = 7
		local row = math.ceil(count / column)
		row = math.min(row, 6)

		ui.heroSkin.panel = ui.background:builder 'panel' { w = 750, h = 500, xy = { '中心', ui.background, '中心', 50, -50 } }
		ui.panelList[#ui.panelList + 1] = ui.heroSkin.panel
		ui.heroSkin.view = ui.heroSkin.panel:builder 'button' { w = 750 * 0.8, h = 500 * 0.8, xy = { '中心', ui.heroSkin.panel, '中心', 0, 0 } }
		ui.heroSkin.slots = {}
		ui.heroSkin.slotsBtn = {}
		ui.heroSkin.shadowIcon = {}
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
		local function LeftClick(btn)
			local index = btn.index
			local playerID = common:GetLocalPlayerID()
			local heroSkin = archive:LoadStr(playerID, "heroSkin")
			if heroSkin:sub(index, index) == "b" then
				common:SendSync("HeroApparel", index)
			else
				code.AddMessage(playerID, "该外观未解锁!!!")
			end
		end
		common:ReceiveSync("HeroApparel")(function(data)
			local player = common:GetSyncPlayer()
			local playerID = common:ConvertPlayerToID(player)
			if archive:LoadInt(playerID, "currentSkin") ~= data then
				local id = ui.heroSkin.firstIndex + data
				archive:SaveInt(playerID, "currentSkin", data)
				local name = excel["存档"][id]["Name"]
				local model = excel["存档"][id]["Value1"]
				code.SetUnitModel(jass.udg_Hero[playerID], model)
				code.SetUnitName(jass.udg_Hero[playerID], name)
				myFunc:SetCustomValue(jass.udg_Hero[playerID], "字符串", "model", model)
				jass.udg_CurrentHeroSkin[playerID] = data
				code.SelectUnitForPlayerSingle(jass.udg_Hero[playerID], common.Player[playerID])
			end
		end)
		local function RightClick(btn)
			local index = btn.index
			common:SendSync("HeroUnfix", index)
		end
		common:ReceiveSync("HeroUnfix")(function(data)
			local player = common:GetSyncPlayer()
			local playerID = common:ConvertPlayerToID(player)
			if archive:LoadInt(playerID, "currentSkin") > 0 then
				archive:SaveInt(playerID, "currentSkin", 0)
				local name = myFunc:GetCustomValue(jass.udg_Hero[playerID], "字符串", "originName")
				local model = myFunc:GetCustomValue(jass.udg_Hero[playerID], "字符串", "originModel")
				code.SetUnitModel(jass.udg_Hero[playerID], model)
				code.SetUnitName(jass.udg_Hero[playerID], name)
				myFunc:SetCustomValue(jass.udg_Hero[playerID], "字符串", "model", model)
				jass.udg_CurrentHeroSkin[playerID] = 0
				code.SelectUnitForPlayerSingle(jass.udg_Hero[playerID], common.Player[playerID])
			end
		end)
		for i = 1, row do
			for j = 1, column do
				local l = (i - 1) * column + j
				if l > count then
					break
				end
				if j == 1 then
					ui.heroSkin.slots[l] = ui.heroSkin.view:builder 'image' { w = w, h = h, xy = { '中心', ui.heroSkin.view, '中心', -math.floor(column / 2) * (d + w), 200 - (i - 1) * (d + h) },
						image = frame }
				else
					ui.heroSkin.slots[l] = ui.heroSkin.view:builder 'image' { w = w, h = h, xy = { '中心', ui.heroSkin.slots[l - 1], '中心', w + d, 0 }, image = frame }
				end
				ui.heroSkin.shadowIcon[l] = ui.heroSkin.slots[l]:builder 'image' { w = w, h = h, xy = { '中心', ui.heroSkin.slots[l], '中心', 0, 0 }, image = shadowIcon, alpha = 0.7 }
				ui.heroSkin.slotsBtn[l] = ui.heroSkin.slots[l]:builder 'button' { w = w, h = h, xy = { "中心", ui.heroSkin.slots[l], "中心", 0, 0 } }
				ui.heroSkin.slotsBtn[l].index = l

				ui.heroSkin.slotsBtn[l]:event('进入')(ShowTip)
				ui.heroSkin.slotsBtn[l]:event('离开')(CloseTip)
				ui.heroSkin.slotsBtn[l]:event('点击')(LeftClick)
				ui.heroSkin.slotsBtn[l]:event('右键点击')(RightClick)
			end
		end
	end

	CategoryInit()
	HeroSkinInit()
end

return Decorate
