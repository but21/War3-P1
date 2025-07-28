local BaseModule = require "my_base.base_module_manager"
local code       = require "jass.code"
local jass       = require "jass.common"
local myFunc     = BaseModule.MyFunc
local common     = BaseModule.Common
local archive    = BaseModule.Archive
local players    = jass.udg_Player
local excel = BaseModule.Excel
local font       = "fonts\\LXWK_Bold.ttf"

local BossComing = {}
local ui         = {}
BossComing.ui    = ui

function BossComing:Init()
	ui.background = gameui:builder 'image' { w = 1920, h = 1080, xy = { "中心", gameui, "中心", 0, 0 }, image = [[Survival\UI\BossComing.tga]], show = false }
	ui.countdownBg = gameui:builder 'image' { w = 100, h = 40, xy = { "顶部", gameui, "顶部", 200, -80 }, image = [[UI\Widgets\ToolTips\Human\human-tooltip-background.blp]], show = false }
	ui.countdownText = ui.countdownBg:builder 'text' { w = 100, h = 0, xy = { "中心", ui.countdownBg, "中心", 0, 0 }, font = { font, 20, align = "居中" } }
end

function code.GameWin()
	if jass.udg_GameResult == 0 then
		jass.udg_GameResult = 1
		code.AddMessage(0, "游戏胜利")
		for playerID, player in ipairs(jass.udg_Player) do
			if archive:GetValueLimit(player, "allWinCount") > 0 then
				local winCount = archive:LoadStr(playerID, "winCount")
				local sep = "|"
				local result = myFunc:Split(winCount, sep)
				result[jass.udg_GameDifficulty] = result[jass.udg_GameDifficulty] + 1
				archive:SaveStr(playerID, "winCount", table.concat(result, sep))
				archive:SaveInt(playerID, "allWinCount", archive:LoadInt(playerID, "allWinCount") + 1)
			end
			if archive:GetValueLimit(player, "allSTP") > 0 and archive:LoadInt(playerID, "summerTimeP") < excel["其它"][17]["Value2"] then
				local point = excel["其它"][17]["Value1"]
				local limit = archive:GetValueLimit(player, "allSTP")
				point = math.min(limit, point)
				archive:SaveInt(playerID, "summerTimeP", archive:LoadInt(playerID, "summerTimeP") + point)
				archive:SaveInt(playerID, "allSTP", archive:LoadInt(playerID, "allSTP") + point)
				code.AddMessage(playerID, "获得暑假活动点数: " .. point)
			end
		end
	end
end

function code.GameFailed(playerID)
	jass.udg_GameResult = 2
	code.AddMessage(playerID, "游戏失败")
	jass.CustomDefeatBJ(common.Player[playerID], "TRIGSTR_378")
end

function code.BossComing(playerID, bossID)
	if bossID == 86 then
		jass.udg_IsGameStart = false
		ac.time(1, function(self)
			if jass.udg_GameResult > 0 then
				if common:IsLocalPlayer(players[playerID]) then
					ui.countdownBg:set_show(true)
					ui.countdownText:set_text(120 - self.lostcount .. "秒")
				end
				code.GameWin()
				if common:IsLocalPlayer(players[playerID]) then
					ui.countdownBg:set_show(false)
				end
				self:rem()
			end
			if self.lostcount == 120 then
				code.GameFailed(playerID)
				self:rem()
			end
		end)
	end
	if common:IsLocalPlayer(jass.udg_Player[playerID]) then
		ui.background:set_show(true)
		ui.background:set_wh(1729 * 0.7, 332 * 0.7)
		ui.background:set_point2("中心", 960, 850)
		local count = 0
		local manager = {}
		manager.fun1 = function()
			count = count + 1
			if count <= 2 then
				myFunc:FadeAlpha({
					UI = ui.background,
					time = 1,
					show = true,
					ty = "二元入",
					complete = function()
						manager.fun2()
					end
				})
			end
		end
		manager.fun2 = function()
			myFunc:FadeAlpha({ UI = ui.background, time = 1, show = false, ty = "二元出", complete = manager.fun1 })
		end
		manager.fun1()
	end
end

return BossComing
