local code              = require "jass.code"
local jass              = require "jass.common"
local japi              = require "jass.japi"
local font              = "fonts\\LXWK_Bold.ttf"

local Module            = require "my_base.base_module_manager"
local createUI          = Module.UICreate
local excel             = excel
local common            = Module.Common
local tipDialogUp       = Module.UITipDialog.tipDialogUp
local myFunc            = Module.MyFunc

local ui                = {}
local Challenge         = {}
Challenge.ui            = ui

local challengeData     = {}
Challenge.challengeData = challengeData
for playerID, player in ipairs(jass.udg_Player) do
	challengeData[playerID] = {}
	for i = 1, 1 do
		challengeData[playerID][i] = {}
		challengeData[playerID][i].amount = 0
		challengeData[playerID][i].originCD = excel["其它"][i]["Value3"]
		challengeData[playerID][i].remainCD = challengeData[playerID][i].originCD
	end
	challengeData[playerID][1].remainCD = 150
end

ui.challengeImage = {}
ui.challengeBtn   = {}
ui.cdText         = {}
ui.cdShadow       = {}

local function EnterChallengeBtn(btn)
	local playerID = common:GetLocalPlayerID()
	local index    = btn.index
	local name     = excel["其它"][index]["Value1"]
	local tip      = excel["其它"][index]["Value2"]
	tip            = myFunc:SetNumColor(tip, "|cfaffff00", "|r")
	tipDialogUp.name:set_text(name)
	tipDialogUp.icon:set_image(ui.challengeImage[index].image)
	tipDialogUp.tips:set_text(tip)
	tipDialogUp.intro:set_text("|cff00ffff类别 - 挑战")
	tipDialogUp.panel:reset_allpoint()
	tipDialogUp.panel:set_point("中心", btn, "左上", 410, 15)
	tipDialogUp.panel:set_show(true)
end
local function LeaveChallengeBtn()
	tipDialogUp.panel:set_show(false)
end
local function ClickChallengeBtn(btn)
	local index = btn.index
	local playerID = common:GetLocalPlayerID()
	if not ui.cdShadow[index]._show then
		local originCD = challengeData[playerID][index].originCD
		ui.cdText[index]:set_text(originCD)
		ui.cdShadow[index]:set_show(true)
		common:SendSync("ClickChallenge", index)
	end
end

local function UIInit()
	local UIModule = require "my_ui.ui_module_manager"
	ui.panel       = createUI:CreateUIAbsolute("panel", gameui, "中心", 110, 305, 1, 1)
	local w, h     = 70 * 0 + 65, 65
	ui.background  = createUI:CreateUIRelative("image", ui.panel, "中心", ui.panel, "中心", 0, 0, w, h, { image = [[UI\Widgets\ToolTips\Human\human-tooltip-background.blp]] })
	ui.tipIcon     = createUI:CreateUIRelative("image", ui.background, "右侧", ui.background, "左侧", 0, 0, h + 10, h + 10, { image = [[Survival\UI\Challenge\tipIcon.tga]] })
	for i = 1, 1 do
		ui.challengeImage[i]     = createUI:CreateUIRelative("image", ui.background, "左侧", ui.background, "左侧", 0 + (i - 1) * (h + 5), 0, h, h,
			{ image = "Survival\\UI\\Challenge\\" .. i .. ".tga" })
		ui.challengeBtn[i]       = createUI:CreateUIRelative("button", ui.challengeImage[i], "中心", ui.challengeImage[i], "中心", 0, 0, h, h)
		ui.challengeBtn[i].index = i
		ui.challengeBtn[i]:event "进入" (EnterChallengeBtn)
		ui.challengeBtn[i]:event "离开" (LeaveChallengeBtn)
		ui.challengeBtn[i]:event "点击" (ClickChallengeBtn)
		ui.cdShadow[i] = createUI:CreateUIRelative("image", ui.challengeImage[i], "中心", ui.challengeImage[i], "中心", 0, 0, h, h,
			{ image = [[UI\Widgets\ToolTips\Human\human-tooltip-background.blp]], alpha = 0.5 })
		ui.cdText[i]   = createUI:CreateUIRelative("text", ui.cdShadow[i], "中心", ui.cdShadow[i], "中心", 0, 0, h, 0,
			{ font = font, fontSize = 25, align = "居中" })
	end


	local settings = UIModule.Settings
	local function SetChallengeCD()
		if not jass.udg_IsGameStart then
			return
		end
		for playerID, player in ipairs(jass.udg_Player) do
			for i = 1, 1 do
				local remainCD = challengeData[playerID][i].remainCD
				remainCD = remainCD - 1
				challengeData[playerID][i].remainCD = remainCD
				if remainCD > 0 then
					if common:IsLocalPlayer(player) then
						ui.cdText[i]:set_text(remainCD)
					end
				elseif remainCD == 0 then
					if common:IsLocalPlayer(player) then
						ui.cdShadow[i]:set_show(false)
						if settings.state[playerID][1] then
							ClickChallengeBtn(ui.challengeBtn[i])
						end
					end
				end
			end
		end
	end
	ac.time(1, SetChallengeCD)
end

function Challenge:Init()
	UIInit()
end

return Challenge
