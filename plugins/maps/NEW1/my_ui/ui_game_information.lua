local jass            = Jass
local Module          = require "my_base.base_module_manager"
local uiCreate        = Module.UICreate

local floor           = math.floor

local font            = "fonts\\LXWK_Bold.ttf"

local GameInformation = {}

local _ui             = {}

GameInformation.ui    = _ui

-- 时间
-- 模式 -  难度
function GameInformation:Init()
	_ui.panel = uiCreate:CreateUIAbsolute("panel", gameui, "中心", 0, 0, 1, 1)
	_ui.panel:set_level(0)
	_ui.infoBg         = uiCreate:CreateUIRelative("image", _ui.panel, "顶部", _ui.panel, "中心", 960, 1080, 236, 154, { image = [[Survival\UI\Console\infoBg2.tga]] })
	_ui.infoBg2        = uiCreate:CreateUIRelative("image", _ui.panel, "顶部", _ui.panel, "中心", 960, 1090, 269, 62, { image = [[Survival\UI\Console\infoBg1.tga]] })
	_ui.gameTime       = uiCreate:CreateUIRelative("text", _ui.infoBg2, "中心", _ui.infoBg2, "中心", 0, 0, 200, 0, { font = font, fontSize = 25, align = "居中" }):set_text("00:00:00")
	-- 1代表普通模式, 2代表挂机模式
	_ui.gameDifficulty = uiCreate:CreateUIRelative("text", _ui.infoBg, "中心", _ui.infoBg, "中心", 0, 5, 200, 0, { font = font, fontSize = 20, align = "居中" })
	_ui.monsterCount   = uiCreate:CreateUIRelative("text", _ui.infoBg, "中心", _ui.infoBg, "中心", 0, -30, 200, 0, { font = font, fontSize = 23, align = "居中" })
	-- ac.time(0.2, function()
	-- 	if jass.udg_IsGameStart or jass.udg_GameMode > 0 then
	-- 		local time = floor(jass.udg_GameTime)
	-- 		local hours = floor(time / 3600) -- 计算小时
	-- 		local minutes = floor((time % 3600) / 60) -- 计算分钟
	-- 		local secs = time % 60
	-- 		local timeStr = string.format("%02d : %02d : %02d", hours, minutes, secs)
	-- 		_ui.gameTime:set_text(timeStr)
	-- 		-- _ui.monsterCount:set_text(jass.udg_CurrentEnemyCount .. " / " .. jass.udg_MaxEnemyCount)
	-- 		_ui.gameDifficulty:set_text(jass.udg_GameMode == 1 and "普通模式" .. " N" .. jass.udg_GameDifficulty or "挂机模式")
	-- 	end
	-- end)
end

return GameInformation
