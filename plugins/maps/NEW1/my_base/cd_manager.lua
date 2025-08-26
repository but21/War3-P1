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
local UIModule = require "my_ui.ui_module_manager"
local treasureHunt = require "my_ui.ui_treasure_hunt"
local excel = Module.Excel


local heros = jass.udg_Hero
local players = jass.udg_Player


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



function manager:Init()
	ac.time(0.01, function()
		common:RunTrigger(jass.gg_trg_001Timer)
	end)
	ac.time(0.02, function()
		common:RunTrigger(jass.gg_trg_002Timer)
		DDash()
	end)
	ac.time(0.1, function()
		common:RunTrigger(jass.gg_trg_01Timer)
	end)
	ac.time(0.2, function()
		SetHeroAtk()
	end)
	ac.time(0.5, function()
		common:RunTrigger(jass.gg_trg_05Timer)
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
	end)
	ac.time(1, function()
		jass.udg_GameTime = jass.udg_GameTime + 1
		local time = floor(jass.udg_GameTime)
		local hours = floor(time / 3600)    -- 计算小时
		local minutes = floor((time % 3600) / 60) -- 计算分钟
		local secs = time % 60
		local timeStr = string.format("%02d : %02d : %02d", hours, minutes, secs)
		UIModule.GameInformation.ui.gameTime:set_text(timeStr)

		common:RunTrigger(jass.gg_trg_1Timer)
		if jass.udg_GameTime > 27005 then
			jass.CustomVictoryBJ(common.Player[0], true, false)
		end
		for playerID = 1, 4 do
			if common:PlayerInGame(common.Player[playerID]) then
				if code.IsEquipPassiveOwned(playerID, 1) then
					myFunc:SetCustomValue(heros[playerID], "整数", "EquipPassive1", myFunc:GetCustomValue(heros[playerID], "整数", "EquipPassive1") + 1)
					if myFunc:GetCustomValue(heros[playerID], "整数", "EquipPassive1") == 60 then
						attrSystem:SetUnitAttrStr(heros[playerID], 0, excel["装备"][1].Value1)
						myFunc:SetCustomValue(heros[playerID], "整数", "EquipPassive1", 0)
					end
				else
					myFunc:SetCustomValue(heros[playerID], "整数", "EquipPassive1", 0)
				end
				if code.IsEquipPassiveOwned(playerID, 4) then
					myFunc:SetCustomValue(heros[playerID], "整数", "EquipPassive4", myFunc:GetCustomValue(heros[playerID], "整数", "EquipPassive4") + 1)
					if myFunc:GetCustomValue(heros[playerID], "整数", "EquipPassive4") == 60 then
						attrSystem:SetUnitAttrStr(heros[playerID], 0, excel["装备"][4].Value1)
						myFunc:SetCustomValue(heros[playerID], "整数", "EquipPassive4", 0)
					end
				else
					myFunc:SetCustomValue(heros[playerID], "整数", "EquipPassive4", 0)
				end
				if code.IsEquipPassiveOwned(playerID, 6) then
					myFunc:SetCustomValue(heros[playerID], "整数", "EquipPassive6", myFunc:GetCustomValue(heros[playerID], "整数", "EquipPassive6") + 1)
					if myFunc:GetCustomValue(heros[playerID], "整数", "EquipPassive6") == 60 then
						myFunc:SetCustomValue(heros[playerID], "整数", "EquipPassive6", 0)
						require "realization.equip":CreateEquip(playerID, excel["装备"][6].Value2, excel["装备"][6].Value1)
					end
				else
					myFunc:SetCustomValue(heros[playerID], "整数", "EquipPassive6", 0)
				end
				if code.IsEquipPassiveOwned(playerID, 7) then
					myFunc:SetCustomValue(heros[playerID], "整数", "EquipPassive7", myFunc:GetCustomValue(heros[playerID], "整数", "EquipPassive7") + 1)
					if myFunc:GetCustomValue(heros[playerID], "整数", "EquipPassive7") == 60 then
						attrSystem:SetUnitAttrStr(heros[playerID], 0, excel["装备"][7].Value1)
						myFunc:SetCustomValue(heros[playerID], "整数", "EquipPassive7", 0)
					end
				else
					myFunc:SetCustomValue(heros[playerID], "整数", "EquipPassive7", 0)
				end
			end
		end
	end)
	ac.time(3, function()
		common:RunTrigger(jass.gg_trg_3Timer)
	end)
	ac.time(10, function()
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
	end)
end

return manager
