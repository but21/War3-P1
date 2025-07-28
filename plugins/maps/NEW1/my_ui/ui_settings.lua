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

local Settings        = {}
local ui              = {}
Settings.ui           = ui

function Settings:Init()
	Settings.state   = { {}, {}, {}, {} }
	local wBtn, hBtn = 55, 55
	local xBtn, yBtn = 385, 215 -- 功能按钮绝对位置
	ui.panel         = gameui:builder 'panel' { w = 1, h = 1, xy = { '中心', 0, 0 }, show = true }
	ui.panel:set_point2("中心", xBtn, yBtn)

	ui.openUIIcon = ui.panel:builder "image" { w = wBtn, h = hBtn, xy = { "中心", ui.panel, "中心", 0, 0 }, image = [[Survival\UI\Settings\icon.tga]] }
	ui.openUIBtn = ui.openUIIcon:builder "button" { w = ui.openUIIcon.w, h = ui.openUIIcon.h, xy = { "中心", ui.openUIIcon, "中心", 0, 0 } }
	ui.openUIBtn:event "点击" (function()
		myFunc:ButtonShake({ UI = ui.openUIIcon })
		ui.background:set_show(not ui.background._show)
	end)
	ui.openUIBtn:event "进入" (function()
		ui.openUIIcon:set_image([[Survival\UI\Settings\iconHl.tga]])
	end)
	ui.openUIBtn:event "离开" (function()
		ui.openUIIcon:set_image([[Survival\UI\Settings\icon.tga]])
	end)

	Settings.count = 1
	local count = Settings.count
	ui.background = ui.panel:builder "image" { w = 250, h = 20 + count * 40, xy = { "左下", ui.openUIIcon, "右上", -10, -10 }, image = [[UI\Widgets\ToolTips\Human\human-tooltip-background.blp]],
		show = false }
	japi.FrameSetIgnoreTrackEvents(ui.background.handle, false)
	ui.optionsText = {}
	ui.optionsIcon = {}
	ui.openIcon = {}
	ui.optionsBtn = {}
	local tips = { '打开后，自动开启金币、经验、钻石、兵器挑战。' }
	local function EnterBtn(btn)
		local index = btn.index
		local tip = tips[index]
		tipOnlyTextDown.tips:set_text(tip)
		tipOnlyTextDown.panel:rem_allpoint():set_point("中心", btn, "右上", 35, 5)
		tipOnlyTextDown.panel:set_show(true)
	end
	local function LeaveBtn(btn)
		tipOnlyTextDown.panel:set_show(false)
	end
	local function ClickBtn(btn)
		common:SendSync("Settings", btn.index)
	end
	local size, sizeH = 24 * 1.25, 22 * 1.25
	for i = 1, count do
		for playerID, _ in ipairs(players) do
			Settings.state[playerID][i] = false
		end
		ui.optionsText[i] = ui.background:builder "text" { w = 190, h = 0, xy = { "左上", ui.background, "左上", 10, 20 - 40 * i }, font = { font, 23, align = "左侧" } }:set_text("设置" .. i)
		ui.optionsIcon[i] = ui.optionsText[i]:builder "image" { w = size, h = sizeH, xy = { "左侧", ui.optionsText[i], "右侧", 0, 0 }, image = [[Survival\UI\Settings\btnBG.tga]] }
		ui.openIcon[i] = ui.optionsIcon[i]:builder "image" { w = size, h = sizeH, xy = { "左侧", ui.optionsIcon[i], "左侧", 0, 0 }, image = [[Survival\UI\Settings\openIcon.tga]],
			show = false }
		ui.optionsBtn[i] = ui.optionsIcon[i]:builder "button" { w = size, h = sizeH, xy = { "中心", ui.optionsIcon[i], "中心", 0, 0 } }
		ui.optionsBtn[i].index = i
		ui.optionsBtn[i]:event "点击" (ClickBtn)
		ui.optionsBtn[i]:event "进入" (EnterBtn)
		ui.optionsBtn[i]:event "离开" (LeaveBtn)
	end
	common:ReceiveSync("Settings")(function(data)
		local player = common:GetSyncPlayer()
		local playerID = common:ConvertPlayerToID(player)
		local archiveSettings = archive:LoadStr(playerID, "settings")
		Settings.state[playerID][data] = not Settings.state[playerID][data]
		if Settings.state[playerID][data] then
			archive:SaveStr(playerID, "settings", myFunc:ReplaceCharAt(archiveSettings, data, "b"))
		else
			archive:SaveStr(playerID, "settings", myFunc:ReplaceCharAt(archiveSettings, data, "a"))
		end
		if data == 1 then
			if common:IsLocalPlayer(player) then
				ui.openIcon[data]:set_show(Settings.state[playerID][data])
			end
		end
	end)
	ui.optionsText[1]:set_text("|cffdfc497自动开启挑战")
end

return Settings
