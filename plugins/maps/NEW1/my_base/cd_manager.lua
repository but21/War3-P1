-- 封装
local code = require 'jass.code'
-- 原生
local jass = require 'jass.common'
-- 内置
local japi = require 'jass.japi'

local max = math.max
local floor = math.floor
local manager = {}

local Module = require "my_base.base_module_manager"
local archive = Module.Archive
local common = Module.Common
local myFunc = Module.MyFunc
local attrSystem = Module.AttrSystem
local players = jass.udg_Player
local UIModule = require "my_ui.ui_module_manager"
local treasureHunt = require "my_ui.ui_treasure_hunt"
-- print(UIModule)


local effectList = {}
local alphaList = {}

function code.AddEffect_D(effect)
	table.insert(effectList, effect)
	table.insert(alphaList, 255)
end

-- D跳特效变淡
local function DDash()
	for index, effect in ipairs(effectList) do
		alphaList[index] = alphaList[index] - 8
		-- 设置特效透明度
		code.Effect_SetColor(effect, 100, 100, 100, alphaList[index])
		if alphaList[index] <= 0 then
			-- 隐藏特效
			code.EXSetEffectVisible(effect, false)
			-- 销毁特效
			DestroyEffect(effect)
			table.remove(effectList, index)
			table.remove(alphaList, index)
		end
	end
end

-- 根据英雄力敏智中最大值设置英雄攻击力
local function SetHeroAtk()
	for playerID, value in ipairs(players) do
		local hero = jass.udg_Hero[playerID]
		if hero then
			local atk = 0.5 * max(attrSystem:GetObjAttrFromStr(hero, "面板力量"), attrSystem:GetObjAttrFromStr(hero, "面板敏捷"), attrSystem:GetObjAttrFromStr(hero, "面板智力"))
			local oldAtk = myFunc:GetCustomValue(hero, "实数", "oldAtk")
			myFunc:SetCustomValue(hero, "实数", "oldAtk", atk)
			code.SetUnitAttr_Str(hero, "攻击", attrSystem:GetObjAttrFromStr(hero, "攻击") + atk - oldAtk)
		end
	end
end



local timer = 0
ac.time(0.01, function()
	if jass.udg_IsGameStart or jass.udg_GameMode > 0 then
		timer = timer + 1
	else
		return
	end
	common:RunTrigger(jass.gg_trg_001Timer)
	-- 0.02秒触发
	if timer % 2 == 0 then
		common:RunTrigger(jass.gg_trg_002Timer)
		DDash()
	end
	-- 0.1秒触发
	if timer % 10 == 0 then
		common:RunTrigger(jass.gg_trg_01Timer)
	end
	-- 0.5秒触发
	if timer % 50 == 0 then
		common:RunTrigger(jass.gg_trg_05Timer)
		-- 判断特效是否显示, 显示则设置大小
		for playerID, value in ipairs(players) do
			local hero = jass.udg_Hero[playerID]
			local effect = myFunc:GetCustomValue(hero, "特效", "atkRangeEffect")
			local isShow = myFunc:GetCustomValue(effect, "真值", "isShow")
			if isShow then
				local atkRange = attrSystem:GetObjAttrFromStr(hero, "攻击射程")
				local size = atkRange / 100
				common:SetEffectSize(effect, size)
			end
		end
	end
	-- 1秒触发
	if timer % 100 == 0 then
		jass.udg_GameTime = jass.udg_GameTime + 1
		local time = floor(jass.udg_GameTime)
		local hours = floor(time / 3600)    -- 计算小时
		local minutes = floor((time % 3600) / 60) -- 计算分钟
		local secs = time % 60
		local timeStr = string.format("%02d : %02d : %02d", hours, minutes, secs)
		UIModule.GameInformation.ui.gameTime:set_text(timeStr)

		common:RunTrigger(jass.gg_trg_1Timer)
		SetHeroAtk()
		-- 挂机结束
		if jass.udg_GameTime > 27005 then
			CustomVictoryBJ(common.Player[0], true, false)
		end
	end

	-- 每十秒获得一点寻宝点数
	if timer % 1000 == 0 then
		if jass.udg_GameMode == 2 then
			for playerID, player in ipairs(players) do
				if common:PlayerInGame(player) then
					if archive:GetValueLimit(player, "allTHP") > 0 then
						archive:SaveInt(playerID, "treasureHuntP", archive:LoadInt(playerID, "treasureHuntP") + 1)
						archive:SaveInt(playerID, "allTHP", archive:LoadInt(playerID, "allTHP") + 1)
						treasureHunt.ui.points:set_text("寻宝点: " .. archive:LoadInt(playerID, "treasureHuntP"))
					end
				end
			end
		end
	end

	-- 每一定时间重置一次(100 = 1秒)
	if timer == 1000 then
		timer = 0
	end
end)




return manager
