local japi = require "jass.japi"
local jass = require "jass.common"
local BaseModule = require "my_base.base_module_manager"
local common = BaseModule.Common
local myFunc = BaseModule.MyFunc
local uiCreate = BaseModule.UICreate
local font = "fonts\\LXWK_Bold.ttf"
local players = jass.udg_Player
-- local wheel = require "ac.nsui.滚轮镜头"


local ModeSelect = {}
function ModeSelect:Init()
	local UIModule = require "my_ui.ui_module_manager"

	local ui = {}
	ModeSelect.ui = ui
	ui.panel = uiCreate:CreateUIAbsolute("panel", gameui, "中心", 960, 540, 1, 1, { isShow = true })
	ui.background = uiCreate:CreateUIRelative("image", ui.panel, "中心", ui.panel, "中心", 0, 0, 1920, 1080, { alpha = 1, image = [[Survival\UI\SelectMode\background.tga]] })
	japi.FrameSetIgnoreTrackEvents(ui.background.handle, false)
	ui.button = uiCreate:CreateUIRelative("button", ui.background, "中心", ui.background, "中心", 0, 0, 1920, 1080)
	--[[ 	ui.button:event("进入")(function()
		-- wheel.inUI = true
	end)
	ui.button:event("离开")(function()
		-- wheel.inUI = false
	end)
	-- 鼠标滚轮
	japi.DzFrameSetScriptByCode(ui.button.handle, 6, function()
		local dir = common:GetWheelData()
	end, false)
	]]
	local optionW = 196
	local optionH = 74
	local modeIntro = { "普通模式：|n在30分钟内不断击杀怪物，使其数量不超过上限，并击败最终Boss获胜。",
		"挂机模式：|n可通过挂机获得寻宝点，寻宝点可用于寻宝获得随机奖励。|n|n每10秒获得1寻宝点。|n|n每局最大挂机时长7.5小时。" }
	local mode = 0
	local function EnterModeBtn(btn)
		local index = btn.index
		if btn.index == 2 then
			ui.difficultyPanel:set_show(false)
		elseif btn.index == 1 then
			-- todo: 根据已解锁难度显示不同数量的难度选项
			ui.difficultyPanel:set_show(true)
		end
		ui.introText:set_text(modeIntro[index])
		myFunc:FadeSize({ UI = ui.modeOptionBg[index], time = 0.1, startP = { optionW, optionH }, endP = { optionW * 1.1, optionH * 1.1 }, ty = "二元出" })
		mode = index
	end
	local function LeaveModeBtn(btn)
		local index = btn.index
		myFunc:FadeSize({ UI = ui.modeOptionBg[index], time = 0.1, endP = { optionW, optionH }, startP = { optionW * 1.1, optionH * 1.1 }, ty = "二元入" })
	end
	local function ClickModeBtn(btn)
		if btn.index == 2 then
			ui.panel:set_show(false)
			common:SendSync("SelectMode", btn.index .. "|0")
		end
	end
	common:ReceiveSync("SelectMode")(function(val)
		local realMode, difficulty = string.match(val, "(%d+)|(%d+)")
		realMode = tonumber(realMode)
		difficulty = tonumber(difficulty)
		jass.udg_GameMode = realMode
		jass.udg_GameDifficulty = difficulty
		for playerID, player in ipairs(players) do
			if common:IsLocalPlayer(player) then
				ui.panel:set_show(false)
			end
		end
		if realMode ~= 2 then
			jass.udg_IsGameStart = true
		else
			jass.udg_IsGameStart = false
		end
		common:RunTrigger(jass.gg_trg_GameStart)
		require "my_ui.archive_data_load"
	end)
	ui.modePanel = uiCreate:CreateUIRelative("panel", ui.background, "中心", ui.background, "左上", 600, -150, 1, 1, { isShow = false })
	ui.modeTitle = uiCreate:CreateUIRelative("text", ui.modePanel, "中心", ui.modePanel, "中心", 0, 0, 100, 0, { text = "模式", font = font, fontSize = 30, align = "居中" })
	ui.modeOptionBg = {}
	ui.modeOptionBtn = {}
	ui.modeOptionText = {}
	for i = 1, 2 do
		ui.modeOptionBg[i] = uiCreate:CreateUIRelative("image", ui.modeTitle, "顶部", ui.modeTitle, "底部", 0, -30 - (optionH + 30) * (i - 1), optionW, optionH,
			{ image = "Survival\\UI\\SelectMode\\mode" .. i .. ".tga" })
		ui.modeOptionBtn[i] = uiCreate:CreateUIRelative("button", ui.modeOptionBg[i], "中心", ui.modeOptionBg[i], "中心", 0, 0, optionW, optionH)
		ui.modeOptionBtn[i].index = i
		ui.modeOptionText[i] = uiCreate:CreateUIRelative("text", ui.modeOptionBtn[i], "中心", ui.modeOptionBtn[i], "中心", 0, 0, 100, 0, { font = font, fontSize = 25, align = "居中" })
		ui.modeOptionBtn[i]:event("进入")(EnterModeBtn)
		ui.modeOptionBtn[i]:event("离开")(LeaveModeBtn)
		ui.modeOptionBtn[i]:event("点击")(ClickModeBtn)
	end
	-- ui.modeOptionText[1]:set_text("普通模式")
	-- ui.modeOptionText[2]:set_text("挂机模式")

	local optionW2 = 203
	local optionH2 = 50
	local difficultyIntro = { [1] = { "N1", "N2", "N3", "N4", "N5", "N6", "N7", "N8" } }
	local function EnterDifficultyBtn(btn)
		local index = btn.index
		ui.introText:set_text(difficultyIntro[mode][index])
		myFunc:FadeSize({ UI = ui.difficultyOptionBg[index], time = 0.1, startP = { optionW2, optionH2 }, endP = { optionW2 * 1.1, optionH2 * 1.1 }, ty = "二元出" })
	end
	local function LeaveDifficultyBtn(btn)
		local index = btn.index
		myFunc:FadeSize({ UI = ui.difficultyOptionBg[index], time = 0.1, endP = { optionW2, optionH2 }, startP = { optionW2 * 1.1, optionH2 * 1.1 }, ty = "二元入" })
	end
	local function ClickDifficultyBtn(btn)
		ui.panel:set_show(false)
		local index = btn.index
		common:SendSync("SelectMode", mode .. "|" .. index)
	end
	ui.difficultyPanel = uiCreate:CreateUIRelative("panel", ui.background, "中心", ui.background, "左上", 960, -150, 1, 1, { isShow = false })
	ui.difficultyTitle = uiCreate:CreateUIRelative("text", ui.difficultyPanel, "中心", ui.difficultyPanel, "中心", 0, 0, 100, 0, { text = "难度", font = font, fontSize = 30, align = "居中" })
	ui.difficultyOptionBg = {}
	ui.difficultyOptionBtn = {}
	ui.difficultyOptionText = {}
	for i = 1, 8 do
		ui.difficultyOptionBg[i] = uiCreate:CreateUIRelative("image", ui.difficultyTitle, "顶部", ui.difficultyTitle, "底部", 0, -30 - (optionH2 + 20) * (i - 1), optionW2, optionH2,
			{ image = "Survival\\UI\\SelectMode\\Button_Difficulty0" .. i .. ".tga" })
		ui.difficultyOptionBtn[i] = uiCreate:CreateUIRelative("button", ui.difficultyOptionBg[i], "中心", ui.difficultyOptionBg[i], "中心", 0, 0, optionW2, optionH2)
		ui.difficultyOptionBtn[i].index = i
		ui.difficultyOptionBtn[i]:event("进入")(EnterDifficultyBtn)
		ui.difficultyOptionBtn[i]:event("离开")(LeaveDifficultyBtn)
		ui.difficultyOptionBtn[i]:event("点击")(ClickDifficultyBtn)
		ui.difficultyOptionText[i] = uiCreate:CreateUIRelative("text", ui.difficultyOptionBtn[i], "中心", ui.difficultyOptionBtn[i], "中心", 0, 0, 100, 0, { font = font, fontSize = 25, align = "居中" })
		-- ui.difficultyOptionText[i]:set_text("N" .. i)
	end

	ui.introPanel = uiCreate:CreateUIRelative("panel", ui.background, "中心", ui.background, "左上", 1460, -150, 1, 1, { isShow = false })
	ui.introTitle = uiCreate:CreateUIRelative("text", ui.introPanel, "中心", ui.introPanel, "中心", 0, 0, 100, 0, { text = "说明", font = font, fontSize = 30, align = "居中" })
	ui.introBg = uiCreate:CreateUIRelative("image", ui.introTitle, "顶部", ui.introTitle, "底部", 0, -30, 400, 400, { alpha = 0.6, image = [[Survival\UI\SeizeBody\textBg.tga]] })
	ui.introText = uiCreate:CreateUIRelative("text", ui.introBg, "左上", ui.introBg, "左上", 10, -10, 380, 0, { font = font, fontSize = 25, align = "左侧" })
	for playerID, player in ipairs(players) do
		if common:PlayerInGame(player) then
			if common:IsLocalPlayer(player) then
				ui.introPanel:set_show(true)
				ui.modePanel:set_show(true)
			end
			break
		end
	end
end

return ModeSelect
