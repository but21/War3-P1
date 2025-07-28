local BaseModule = require "my_base.base_module_manager"
local code       = require "jass.code"
local jass       = require "jass.common"
local myFunc     = BaseModule.MyFunc
local uiCreate   = BaseModule.UICreate
local common     = BaseModule.Common
local archive    = BaseModule.Archive
local tipDown    = BaseModule.UITipDialog.tipDialogDown
local excel      = BaseModule.Excel

local players    = jass.udg_Player
local font       = "fonts\\LXWK_Bold.ttf"
local japi       = require "jass.japi"

local Qrqd       = {}
local ui         = {}
Qrqd.ui          = ui
Qrqd.state       = { false, false, false, false }

-- 进入游戏自动签到
function Qrqd:Init()
	local wBtn, hBtn = 120 * 0.6, 130 * 0.6 -- 功能按钮宽高
	local xBtn, yBtn = 50, 860           -- 功能按钮绝对位置
	local OpenUI = {}
	OpenUI.panel = gameui:builder 'panel' { w = 1, h = 1, xy = { '中心', xBtn, yBtn }, show = true }
	OpenUI.background = OpenUI["panel"]:builder "image" { w = wBtn, h = hBtn, xy = { "中心", OpenUI["panel"], "中心", 0, 0 }, image = [[Survival\UI\QRQD\icon.tga]], alpha = 1 }
	OpenUI.btn = OpenUI["background"]:builder "button" { w = wBtn, h = hBtn, xy = { "中心", OpenUI["background"], "中心", 0, 0 } }
	OpenUI.btn:set_alpha(0)
	local uiButton = OpenUI.btn
	uiButton:event "点击" (function()
		myFunc:ButtonShake({ UI = OpenUI.background })
		local w, h = ui.background:get_wh()
		OpenUI.btn:set_show(false)
		if OpenUI.btn.alpha == 1 then
			myFunc:FadeSize {
				UI = ui.view,
				ty = "二元出",
				startP = { w, h },
				endP = { 0, h },
				complete = function()
					ui.panel:set_show(false)
					OpenUI.btn:set_show(true)
					OpenUI.btn.alpha = 0
				end,
				time = 0.2
			}
		elseif OpenUI.btn.alpha == 0 then
			myFunc:FadeSize {
				UI = ui.view,
				ty = "二元出",
				startP = { 0, h },
				endP = { w, h },
				complete = function()
					OpenUI.btn.alpha = 1
					OpenUI.btn:set_show(true)
				end,
				time = 0.2
			}
			ui.panel:set_show(true)
		end
	end)
	uiButton:event "进入" (function()
		OpenUI.background:set_image([[Survival\UI\QRQD\iconHl.tga]])
	end)
	uiButton:event "离开" (function()
		OpenUI.background:set_image([[Survival\UI\QRQD\icon.tga]])
	end)

	ui.view = gameui:builder "panel" { w = 1, h = 1, xy = { "中心", 1020, 650 } }
	japi.FrameSetViewPort(ui.view.handle, true)

	ui.panel = ui.view:builder "panel" { w = 1, h = 1, xy = { "中心", 1020, 650 }, show = false }
	ui.background = ui.panel:builder "image" { w = 1520 * 0.9, h = 760 * 0.9, xy = { "中心", ui.panel, "中心", 0, 0 }, image = [[Survival\UI\QRQD\background.tga]] }
	japi.FrameSetIgnoreTrackEvents(ui.background.handle, false)
	ui.optionsBackground = {}
	ui.signIcon = {}
	ui.signedIcon = {}
	ui.highlight = {}
	ui.signBtn = {}
	ui.rewardIcon = {}
	local function EnterBtn(btn)
		local index = btn.index
		ui.highlight[index]:set_show(true)
		local id   = 600 + index
		local name = excel["存档"][id]["Name"]
		local icon = excel["存档"][id]["Icon"]
		local tip  = excel["存档"][id]["Tip"]
		tipDown.name:set_text(name)
		tipDown.tips:set_text(tip)
		tipDown.intro:set_text("")
		tipDown.icon:set_image(icon)
		tipDown.panel:rem_allpoint():set_point("中心", btn, "右上", 16, -13)
		tipDown.panel:set_show(true)
	end
	local function LeaveBtn(btn)
		local index = btn.index
		ui.highlight[index]:set_show(false)
		tipDown.panel:set_show(false)
	end
	local function ClickBtn(btn)
		local index = btn.index
		common:SendSync("qrqd", index)
	end
	for i = 1, 7 do
		ui.optionsBackground[i] = ui.background:builder "image" { w = 100, h = 400, xy = { "左侧", ui.background, "左侧", 150 + 120 * (i - 1), -40 },
			image = "Survival\\UI\\QRQD\\day" .. i .. ".tga" }
		local size = 80
		ui.rewardIcon[i] = ui.optionsBackground[i]:builder "image" { w = size, h = size, xy = { "中心", ui.optionsBackground[i], "中心", 0, -40 }, }
		ui.signIcon[i] = ui.optionsBackground[i]:builder "image" { w = 104 * 0.8, h = 31 * 0.8, xy = { "底部", ui.optionsBackground[i], "底部", 0, 30 }, image = [[Survival\UI\QRQD\sign.tga]] }
		ui.signedIcon[i] = ui.optionsBackground[i]:builder "image" { w = 135 * 0.8, h = 89 * 0.8, xy = { "底部", ui.optionsBackground[i], "底部", 0, 30 }, image = [[Survival\UI\QRQD\signed.tga]],
			show = false }
		ui.highlight[i] = ui.optionsBackground[i]:builder "image" { w = 100, h = 400, xy = { "中心", ui.optionsBackground[i], "中心", 0, 0 }, image = "Survival\\UI\\QRQD\\dayHl.tga", show = false }
		ui.signBtn[i] = ui.signIcon[i]:builder "button" { w = 100, h = 400, xy = { "中心", ui.optionsBackground[i], "中心", 0, 0 } }
		ui.signBtn[i].index = i
		ui.signBtn[i]:event "进入" (EnterBtn)
		ui.signBtn[i]:event "离开" (LeaveBtn)
		ui.signBtn[i]:event "点击" (ClickBtn)
	end
	common:ReceiveSync("qrqd")(function(data)
		local player = common:GetSyncPlayer()
		local playerID = common:ConvertPlayerToID(player)
		if Qrqd.state[playerID] then
			code.AddMessage(playerID, "|cfff43232今日签到已完成,无法再次签到!")
		else
			code.AddMessage(playerID, "进入游戏即可自动签到!")
		end
	end)
end

return Qrqd
