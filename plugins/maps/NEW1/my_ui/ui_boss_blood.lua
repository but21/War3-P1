local code = require "jass.code"
local jass = Jass
local japi = require "jass.japi"
local font = [[fonts\LXWK_Bold.ttf]]
local floor = math.floor

---@class BossBlood Boss血条
local BossBlood = {}

local bloodBar = {}
-- 血条UI
BossBlood.bloodBar = bloodBar

local Module = require "my_base.base_module_manager"
local common = Module.Common
local myFunc = Module.MyFunc

local _scale = 0.8
local _textScale = 0.8
local _w, _h = 800 * _scale, 40 * _scale -- 800, 60 * 0.7

local function _Init()
	bloodBar.panel = gameui:builder "panel" { w = 1, h = 1, xy = { "中心", 0, 0 }, show = false }
	bloodBar.panel:set_point2("中心", 960 + 60, 900)
	bloodBar["真血2"] = bloodBar.panel:builder "image" { w = _w, h = 10 * _scale, xy = { "左侧", bloodBar.panel, "左侧", -_w / 2, -28.5 * _scale },
		image = [[Survival\UI\BossBlood\red.tga]], show = true }
	-- 虚血, 真血, 底
	bloodBar["底"] = bloodBar.panel:builder "image" { w = _w, h = _h, xy = { "中心", bloodBar.panel, "中心", 0, 0 },
		image = [[Bloodbar\Bloodblack.tga]], show = true }
	bloodBar["虚血"] = bloodBar.panel:builder "image" { w = _w, h = _h, xy = { "左侧", bloodBar["底"], "左侧", 0, 0 },
		image = [[Survival\UI\BossBlood\gray.tga]], show = true, alpha = 0.7 }
	bloodBar["真血"] = bloodBar.panel:builder "image" { w = _w, h = _h, xy = { "左侧", bloodBar["底"], "左侧", 0, 0 },
		image = [[Survival\UI\BossBlood\red.tga]], show = true }
	bloodBar.background = bloodBar.panel:builder "image" { w = _w * 1.02, h = 97 * _scale, xy = { "左侧", bloodBar["底"], "左侧", -5 * _scale, 10.5 * _scale },
		image = [[Survival\UI\BossBlood\bgFrame.tga]], show = true }

	bloodBar["名字"] = bloodBar.background:builder "text" { w = _w, h = 0, xy = { "左侧", bloodBar["底"], "左侧", 20, 37 * _textScale }, font = { font, 32 * _textScale, align = "左侧" } }
	bloodBar["名字"]:set_text("Boss名")
	bloodBar["命数"] = bloodBar.background:builder "text" { w = _w, h = 0, xy = { "右侧", bloodBar["底"], "右侧", -10, -2 }, font = { font, 32 * _textScale, align = "右侧" } }
	bloodBar["命数"]:set_text("X99")
	bloodBar.headFrame = bloodBar.panel:builder "image" { w = 150 * _scale, h = 150 * _scale, xy = { "右侧", bloodBar["底"], "左侧", 30 * _scale, 15 * _scale },
		image = [[Survival\UI\BossBlood\headFrame.tga]], show = true }
	bloodBar.headIcon = bloodBar.panel:builder "image" { w = 92 * _scale, h = 92 * _scale, xy = { "中心", bloodBar.headFrame, "中心", 0, 0 },
		image = [[Survival\UI\BossBlood\bossHead.tga]], show = true }
	bloodBar.panel:set_level(2)
end


local _colorBlood = { [[Survival\UI\BossBlood\red.tga]], [[Survival\UI\BossBlood\purple.tga]], [[Survival\UI\BossBlood\blue.tga]], [[Survival\UI\BossBlood\greed.tga]],
	[[Survival\UI\BossBlood\yellow.tga]] }

--[[
	真血渐变
	记录一个假血, 假血和实际血量相差小于1%时相等,
	把假血丢到calc里面, 假血和实际血量 类似于 虚血条和真血条
]]

-- 多少血量对应一条命
local _perLifeToHp = 5000

--- 获取boss当前命数及对应最大血量
---@param boss any
---@return integer currentLife 当前命数
---@return integer currentLifeToHp 当前命数最大血量
---@return integer allLife 总命数
local function _Calc(boss)
	local allHp = common:GetUnitState(boss, "最大生命值")
	local allLife = 1
	local firstLifeToHp = allHp
	if allHp >= _perLifeToHp then
		allLife = allHp // _perLifeToHp
		firstLifeToHp = allHp % _perLifeToHp + _perLifeToHp
	end
	local hp = common:GetUnitState(boss, "生命值")
	local currentLife = hp // _perLifeToHp + 1
	if hp > allHp - firstLifeToHp then
		currentLife = allLife
	end
	local currentLifeToHp = firstLifeToHp
	if currentLife ~= allLife then
		currentLifeToHp = _perLifeToHp
	end
	return currentLife, currentLifeToHp, allLife
end

-- 对应玩家的当前目标boss
BossBlood.targetBoss = {}

-- 刷新
local function _Refresh()
	for playerID, player in ipairs(jass.udg_Player) do
		local boss = BossBlood.targetBoss[playerID]
		-- if boss then
		-- 	print(boss)
		-- end
		if boss and boss > 0 and common:GetUnitState(boss, "生命值") > 0 and myFunc:GetCustomValue(boss, "真值", "IsBOSS") then
			-- print(boss, common:GetUnitTip(boss), myFunc:GetCustomValue(boss, "字符串", "name"))
			if common:IsLocalPlayer(player) then
				bloodBar.panel:set_show(true)
				bloodBar["名字"]:set_text(myFunc:GetCustomValue(boss, "字符串", "name"))
				local currentLife, currentLifeToHp, allLife = _Calc(boss)
				local colorIndex = (allLife - currentLife) % #_colorBlood + 1
				local bloodColor = _colorBlood[colorIndex]
				bloodBar["真血"]:set_image(bloodColor)
				local backBlood = [[Bloodbar\Bloodblack.tga]]
				if currentLife > 1 then
					backBlood = _colorBlood[colorIndex == #_colorBlood and 1 or colorIndex + 1]
				end
				bloodBar["底"]:set_image(backBlood)

				bloodBar["命数"]:set_text("X" .. floor(currentLife))
				local currentHp = common:GetUnitState(boss, "生命值")
				local maxHp = common:GetUnitState(boss, "最大生命值")
				local hp = currentHp - (currentLife - 1) * _perLifeToHp
				local rate = hp / currentLifeToHp
				bloodBar["真血"]:set_w(_w * rate)
				bloodBar["真血2"]:set_w(_w * (currentHp / maxHp))
				local gap = bloodBar["虚血"].w - bloodBar["真血"].w
				if gap > 10 then
					bloodBar["虚血"]:set_w(bloodBar["虚血"].w - 0.07 * gap)
				else
					bloodBar["虚血"]:set_w(bloodBar["真血"].w)
				end
			end
		else
			BossBlood.targetBoss[playerID] = nil
			if common:IsLocalPlayer(player) then
				bloodBar.panel:set_show(false)
			end
		end
	end
end

_Init()
ac.time(0.02, _Refresh)

return BossBlood
