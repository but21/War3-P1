-- 封装(包括内置)
local code = require 'jass.code'
-- 原生
local jass = Jass
-- YDWE
local japi = require "jass.japi"

local Module = require "my_base.base_module_manager"
local myFunc = Module.MyFunc
local attrSystem = Module.AttrSystem
local common = Module.Common
local htSeizeBody = jass.udg_HTSeizeBodyID
local excel = Module.Excel
local math = math
local players = jass.udg_Player
---@class UIModule
local UIModule


---@class DamageSystem
local DamageSystem = {}

-- 存储自定义值的哈希表 jass.YDHT

local _floatTextModel = {}
_floatTextModel['物理伤害'] = { ['.'] = 'Survival\\FloatText\\character_TD_point.mdx', ['+'] = 'Survival\\FloatText\\character_TD_add.mdx', ['icon'] = "Survival\\FloatText\\character_TD.mdx" }
local num = '0123456789'
local t = { ["万"] = "wan", ['亿'] = '1', ["兆"] = 'zhao' }
for key, value in pairs(t) do
	_floatTextModel['物理伤害'][key] = 'Survival\\FloatText\\character_TD_' .. value .. '.mdx'
end
for i = 1, #num do
	_floatTextModel['物理伤害'][num:sub(i, i)] = 'Survival\\FloatText\\character_TD_' .. num:sub(i, i) .. '.mdx'
end
local _scale = 1
local _d = 40 * _scale
local function _DamageText(damage, damageType, x, y, z, playerID)
	if damage <= 0 or UIModule.Settings.state[playerID][3] then
		return
	end
	local damageText = myFunc:NumToChinese(damage)
	if not _floatTextModel[damageType] then
		damageType = "物理伤害"
	end
	local damageTextVal = damageText
	local length = #damageTextVal
	local pivotX = common:GetRandomInt(-100, 100)
	local pivotY = common:GetRandomInt(-100, 0)
	x = x + pivotX
	y = y + pivotY

	if damage >= 10000 then
		local damageUnit = damageText:sub(-3)
		damageTextVal = damageText:sub(1, -4)
		length = #damageTextVal + 1
		local effectStr = ""
		if common:IsLocalPlayer(players[playerID]) then
			effectStr = _floatTextModel[damageType][damageUnit]
		end
		local effect = common:CreateEffectInXY(effectStr, x + length / 2 * _d, y)
		common:SetEffectHeight(effect, z)
		common:PlayAnimIndex(effect, 1)
		common:SetEffectSize(effect, _scale)
		common:DestroyEffect(effect)
	end
	-- 在指定位置创建特效
	local effectStr = ""
	if common:IsLocalPlayer(players[playerID]) then
		effectStr = _floatTextModel[damageType]["Icon"]
	end
	local effect = common:CreateEffectInXY(effectStr, x - length / 2 * _d, y)
	-- 设置特效高度
	common:SetEffectHeight(effect, z)
	-- 播放特效动画(根据索引)
	common:PlayAnimIndex(effect, 1)
	-- 设置特效大小
	common:SetEffectSize(effect, _scale)
	-- 删除特效
	common:DestroyEffect(effect)
	for i = 1, #damageTextVal do
		local str = damageTextVal:sub(i, i)
		local effectStr2 = ""
		if common:IsLocalPlayer(players[playerID]) then
			effectStr2 = _floatTextModel[damageType][str]
		end
		-- print(effectStr2)
		effect = common:CreateEffectInXY(effectStr2, x + (i - length / 2) * _d, y)
		common:SetEffectHeight(effect, z)
		common:PlayAnimIndex(effect, 1)
		common:SetEffectSize(effect, _scale)
		common:DestroyEffect(effect)
	end
end
---@param bossBlood BossBlood
function DamageSystem:Init(bossBlood)
	DamageSystem.bossBlood = bossBlood
	UIModule = require "my_ui.ui_module_manager"
end

--#region 伤害系统

-- 单位受伤
function code.DamageSystem()
	-- 进入伤害事件时的伤害值
	local damage = common:GetEventDamage()
	-- 受伤单位
	local triggerUnit = common:GetTriggerUnit()
	-- 造成伤害单位
	local damageSource = common:GetEventDamageSource()

	-- 判断是否是玩家单位造成的伤害
	local isPlayerEnemy = common:IsUnitEnemy(damageSource, common.Player[1])
	if not isPlayerEnemy then
		if damage == 0 or common:IsAttackDamage() then
			common:SetEventDamage(0)
			return
		end

		-- 玩家ID
		local playerID = common:ConvertPlayerToID(common:GetOwningPlayer(damageSource))
		-- 英雄
		local hero = jass.udg_Hero[playerID]

		-- 敌人位置
		local enemyX = common:GetUnitX(triggerUnit)
		local enemyY = common:GetUnitY(triggerUnit)
		-- local enemyP = Common:GetUnitLoc(triggerUnit)
		-- 英雄位置
		local heroX = common:GetUnitX(hero)
		local heroY = common:GetUnitY(hero)
		-- local heroP = Common:GetUnitLoc(hero)
		local avoidDamage = attrSystem:GetObjAttrFromStr(triggerUnit, "免伤几率%")

		-- 判断是否是boss, 是的话则显示血条
		if myFunc:GetCustomValue(triggerUnit, "真值", "IsBOSS") then
			DamageSystem.bossBlood.targetBoss[playerID] = triggerUnit
		end

		-- 伤害免疫
		if common:GetRandomInt(1, 100) <= avoidDamage / (100 + avoidDamage) * 100 then
			damage = 0
			common:SetEventDamage(damage)
			return
		end


		local isCrit = false
		if common:IsEventWeaponType(common.WeaponTypeMLC) then
			isCrit = true
		end

		--#region 通用伤害加成
		if code.IsBondCompleted(playerID, 23) then
			damage = damage * excel["羁绊列表"][23].Value1
		end

		if code.IsBondCompleted(playerID, 27) then
			damage = damage * excel["羁绊列表"][27].Value1
		end

		if code.IsEquipSwallowed(playerID, 617) then
			if myFunc:GetCustomValue(triggerUnit, "真值", "IsBOSS") then
				damage = damage * excel["装备"][617].Value1
			end
		end

		damage = damage * (attrSystem:GetObjAttrFromStr(hero, "对怪物增伤%") * 0.01 + 1)
		if myFunc:GetCustomValue(triggerUnit, "真值", "Is小怪") then
			damage = damage * (attrSystem:GetObjAttrFromStr(hero, "对小怪增伤%") * 0.01 + 1)
		end
		if myFunc:GetCustomValue(triggerUnit, "真值", "Is挑战怪") then
			damage = damage * (attrSystem:GetObjAttrFromStr(hero, "对挑战怪增伤%") * 0.01 + 1)
		end
		if myFunc:GetCustomValue(triggerUnit, "真值", "IsBOSS") then
			damage = damage * (attrSystem:GetObjAttrFromStr(hero, "对首领增伤%") * 0.01 + 1)
		end
		--#endregion 通用伤害加成


		--#region 真实伤害
		if common:IsEventAttackType(common.AtkTypeChaos) == true then
			if code.IsBondCompleted(playerID, 32) then
				damage = damage * excel["羁绊列表"][32].Value1
			end

			if code.IsCardOwned(playerID, 378) then
				damage = damage * excel["卡牌"][378].Value3
			end

			_DamageText(damage, "真实伤害", enemyX, enemyY, 250, playerID)
			common:SetEventDamage(damage)
			-- DisplayTextToPlayer(jass.udg_Player[playerID], 0, 0, "|cfffc00a8真实伤害: " .. myFunc:NumToChinese(damage))
			return
		end
		--#endregion


		-- 护甲
		local armor = common:GetUnitState(triggerUnit, "护甲")
		armor = armor - attrSystem:GetObjAttrFromStr(hero, "护甲固穿")
		armor = math.max(0, armor - armor * attrSystem:GetObjAttrFromStr(hero, "护甲穿透%"))
		-- 伤害减免
		local damageReduce = attrSystem:GetObjAttrFromStr(triggerUnit, "伤害减免%") * 0.01
		local maxArmor = attrSystem:GetObjAttrFromStr(triggerUnit, "护甲减免上限%") * 0.01 + 0.9
		local extraDamage = attrSystem:GetObjAttrFromStr(triggerUnit, "承受伤害") * 0.01 + 1
		--护甲和伤害减免
		damage = damage * (1 - armor * maxArmor / (armor + 200)) * (1 / (1 + damageReduce)) * extraDamage


		--#region 物理伤害和普攻伤害都吃的加成
		if common:IsEventAttackType(common.AtkTypeHero) or common:IsEventAttackType(common.AtkTypeMelee) or common:IsEventAttackType(common.AtkTypePierce) then
			if code.IsBondCompleted(playerID, 13) then
				damage = damage * excel["羁绊列表"][13].Value1
			end

			if code.IsCardOwned(playerID, 378) then
				damage = damage * excel["卡牌"][378].Value2
			end

			if code.IsCardOwned(playerID, 410) then
				damage = damage * (1 + 0.01 * attrSystem:GetObjAttrFromStr(hero, "物理暴率%"))
			end
			if isCrit then
				if code.IsBondCompleted(playerID, 2) then
					if common:GetRandomInt(1, 100) <= excel["卡牌"][31].Value1 then
						damage = damage * excel["卡牌"][31].Value2
					end
				end
			end
		end
		--#endregion


		--#region 结算攻击伤害/多重箭
		if common:IsEventAttackType(common.AtkTypeMelee) or common:IsEventAttackType(common.AtkTypePierce) then
			-- 攻击闪避
			local atkAvoid = attrSystem:GetObjAttrFromStr(triggerUnit, "攻击闪避率%")
			if common:GetRandomInt(1, 100) <= atkAvoid then
				common:SetEventDamage(0)
				return
			end


			local critDamage = attrSystem:GetObjAttrFromStr(hero, "结算攻击暴伤%")

			-- 判断普攻/多重箭是否暴击并调整伤害
			if isCrit then
				damage = damage * critDamage
				if code.IsBondCompleted(playerID, 25) then
					damage = damage * excel["羁绊列表"][25].Value1
				end
			end

			if common:LoadInteger(htSeizeBody, playerID, 9) == 1 then
				damage = damage * excel["夺舍"][9].Value1
			end

			if common:LoadInteger(htSeizeBody, playerID, 11) == 1 then
				if common:GetRandomInt(1, 100) <= excel["夺舍"][11].Value1 then
					damage = damage * excel["夺舍"][11].Value2
				end
			end

			if code.IsBondCompleted(playerID, 14) then
				damage = damage * excel["羁绊列表"][14].Value1
			end

			-- 攻击附加真伤
			local realDamage = 0
			if common:LoadInteger(htSeizeBody, playerID, 4) == 1 then
				realDamage = realDamage + attrSystem:GetObjAttrFromStr(hero, "每秒回血") * excel["夺舍"][4].Value1 * (1 + excel["夺舍"][4].Value2 * common:GetHeroLv(hero))
			end
			if common:LoadInteger(htSeizeBody, playerID, 12) == 1 then
				realDamage = realDamage + attrSystem:GetObjAttrFromStr(hero, "护甲") * excel["夺舍"][12].Value1 * (1 + excel["夺舍"][12].Value2 * common:GetHeroLv(hero))
			end
			if code.IsCardOwned(playerID, 271) then
				realDamage = realDamage + attrSystem:GetObjAttrFromStr(hero, "每秒回血") * excel["卡牌"][271].Value1 * (1 + 0.01 * attrSystem:GetObjAttrFromStr(hero, "金币加成%"))
			end
			if code.IsCardOwned(playerID, 272) then
				realDamage = realDamage + attrSystem:GetObjAttrFromStr(hero, "每秒回血") * excel["卡牌"][272].Value1 * (1 + 0.01 * attrSystem:GetObjAttrFromStr(hero, "伤害减免%"))
			end
			if code.IsCardOwned(playerID, 376) then
				realDamage = realDamage + common:GetUnitState(hero, "最大生命值") * excel["卡牌"][376].Value1
			end
			if realDamage > 0 then
				realDamage = realDamage * attrSystem:GetObjAttrFromStr(hero, "结算真实伤害%")
				common:UnitDamageTarget(hero, triggerUnit, realDamage, false, false, common.AtkTypeChaos, common.DamageTypeUniversal, common.WeaponTypeNone)
			end

			if code.IsCardOwned(playerID, 393) then
				if attrSystem:GetObjAttrFromStr(hero, "攻击速度%") >= 600 then
					damage = damage * (1 + (attrSystem:GetObjAttrFromStr(hero, "攻击速度%") - 500) / 100 * excel["卡牌"][393].Value5)
				end
			end
			if code.IsCardOwned(playerID, 393) then
				local pro = common:GetRandomInt(1, 100)
				if pro <= excel["卡牌"][393].Value1 then
					damage = damage * excel["卡牌"][393].Value2
					if pro <= excel["卡牌"][393].Value3 then
						damage = damage * excel["卡牌"][393].Value4
					end
				end
			end
			if code.IsCardOwned(playerID, 75) then
				local extraDamage = common:GetUnitState(hero, "最大生命值") * excel["卡牌"][75].Value1
				if isCrit then
					extraDamage = extraDamage * attrSystem:GetObjAttrFromStr(hero, "结算物理暴伤%")
					common:UnitDamageTarget(hero, triggerUnit, extraDamage, false, false, common.AtkTypeHero, common.DamageTypeUniversal, common.WeaponTypeMLC)
				else
					common:UnitDamageTarget(hero, triggerUnit, extraDamage, false, false, common.AtkTypeHero, common.DamageTypeUniversal, common.WeaponTypeNone)
				end
			end

			--普攻吸血
			local atkRecover = attrSystem:GetObjAttrFromStr(hero, "攻击吸血")

			if code.IsBondCompleted(playerID, 12) then
				if common:GetUnitState(hero, "生命百分比") <= excel["羁绊列表"][12].Value1 then
					atkRecover = atkRecover * excel["羁绊列表"][12].Value2
				end
			end

			local physicsSteal = attrSystem:GetObjAttrFromStr(hero, "物理偷取%") * 0.01 + 1
			physicsSteal = damage * physicsSteal
			physicsSteal = math.min(physicsSteal, 0.05 * common:GetUnitState(hero, "最大生命值"))

			common:SetUnitState(hero, "生命值", common:GetUnitState(hero, "生命值") + atkRecover + physicsSteal)


			-- 物理固伤
			damage = damage + attrSystem:GetObjAttrFromStr(hero, "结算物理固伤")
			_DamageText(damage, "攻击伤害", enemyX, enemyY, 250, playerID)
			common:SetEventDamage(damage)
			-- DisplayTextToPlayer(jass.udg_Player[playerID], 0, 0, "|cff00fd4c普攻: " .. myFunc:NumToChinese(damage))
			return
		end
		--#endregion

		-- 技能闪避
		local atkAvoid = attrSystem:GetObjAttrFromStr(triggerUnit, "技能闪避率%")
		if common:GetRandomInt(1, 100) <= atkAvoid then
			common:SetEventDamage(0)
			return
		end

		--#region 结算物理技能伤害
		if common:IsEventAttackType(common.AtkTypeHero) == true then
			local physicsSteal = attrSystem:GetObjAttrFromStr(hero, "物理偷取%") * 0.01 + 1
			physicsSteal = damage * physicsSteal
			physicsSteal = math.min(physicsSteal, 0.05 * common:GetUnitState(hero, "最大生命值"))


			local skillRecover = attrSystem:GetObjAttrFromStr(hero, "技能吸血")
			common:SetUnitState(hero, "生命值", common:GetUnitState(hero, "生命值") + skillRecover + physicsSteal)

			damage = damage + attrSystem:GetObjAttrFromStr(hero, "结算物理固伤")
			_DamageText(damage, "物理伤害", enemyX, enemyY, 250, playerID)
			common:SetEventDamage(damage)
			-- DisplayTextToPlayer(jass.udg_Player[playerID], 0, 0, "|cffefa00d物理伤害: " .. myFunc:NumToChinese(damage))
			return
		end
		--#endregion 物理伤害


		--#region 结算法术技能伤害
		if common:IsEventAttackType(common.AtkTypeNormal) == true then
			if isCrit then
				if code.IsBondCompleted(playerID, 16) then
					if common:GetRandomInt(1, 100) <= excel["羁绊列表"][16].Value1 then
						myFunc:SetCustomValue(jass.gg_trg_Bond_16, "整数", "playerID", playerID)
						myFunc:SetCustomValue(jass.gg_trg_Bond_16, "单位", "enemy", triggerUnit)
						common:RunTrigger(jass.gg_trg_Bond_16)
					end
				end

				if code.IsCardOwned(playerID, 201) then
					attrSystem:SetObjAttrEx_Str(hero, "护甲", 0, excel["卡牌"][201].Value1)
				end
			end
			if code.IsCardOwned(playerID, 427) then
				if myFunc:GetCustomValue(triggerUnit, "真值", "IsBOSS") or myFunc:GetCustomValue(triggerUnit, "真值", "Is精英") then
					damage = damage * (1 + (1 - common:GetUnitState(triggerUnit, "生命百分比") * 0.01) * excel["卡牌"][427].Value1)
				end
			end

			if code.IsBondCompleted(playerID, 20) then
				damage = damage * excel["羁绊列表"][20].Value1
			end

			if code.IsBondCompleted(playerID, 21) then
				if common:GetRandomInt(1, 100) <= excel["羁绊列表"][21].Value1 then
					myFunc:SetCustomValue(jass.gg_trg_Bond_21, "整数", "playerID", playerID)
					myFunc:SetCustomValue(jass.gg_trg_Bond_21, "单位", "enemy", triggerUnit)
					common:RunTrigger(jass.gg_trg_Bond_21)
				end
			end

			local magicSteal = attrSystem:GetObjAttrFromStr(hero, "法术偷取%") * 0.01 + 1
			magicSteal = damage * magicSteal
			magicSteal = math.min(magicSteal, 0.05 * common:GetUnitState(hero, "最大生命值"))

			local skillRecover = attrSystem:GetObjAttrFromStr(hero, "技能吸血")
			common:SetUnitState(hero, "生命值", common:GetUnitState(hero, "生命值") + skillRecover + magicSteal)

			damage = damage + attrSystem:GetObjAttrFromStr(hero, "结算法术固伤")
			_DamageText(damage, "法术伤害", enemyX, enemyY, 250, playerID)
			common:SetEventDamage(damage)
			-- DisplayTextToPlayer(jass.udg_Player[playerID], 0, 0, "|cff008afc法术伤害: " .. myFunc:NumToChinese(damage))
			return
		end
		--#endregion
	else
		if common:IsAttackDamage() then
			damage = attrSystem:GetObjAttrFromStr(damageSource, "面板攻击")
		end
		-- 非玩家单位造成伤害
		-- print("不是玩家单位造成的伤害", GetUnitName(damageSource), GetUnitName(triggerUnit))
		-- 玩家ID
		local playerID = common:ConvertPlayerToID(common:GetOwningPlayer(damageSource))
		-- 英雄
		local hero = jass.udg_Hero[playerID]
		-- 护甲
		local armor = common:GetUnitState(triggerUnit, "护甲")
		-- 减免
		local damageReduce = attrSystem:GetObjAttrFromStr(triggerUnit, "伤害减免%")
		local avoidDamage = attrSystem:GetObjAttrFromStr(triggerUnit, "免伤几率%")
		-- 伤害免疫
		if common:GetRandomInt(1, 100) <= avoidDamage / (100 + avoidDamage) * 100 then
			damage = 0
			common:SetEventDamage(damage)
			return
		end

		--护甲和伤害减免
		damage = damage * (100 / (100 + armor)) * (100 / (100 + damageReduce))


		--#region 英雄受到伤害
		if common:IsUnitType(triggerUnit, common.UnitTypeHero) == true and triggerUnit == jass.udg_Hero[playerID] then
			if code.IsBondCompleted(playerID, 4) then
				damage = damage * excel["卡牌"][51].Value1
			end

			if code.IsBondCompleted(playerID, 27) then
				damage = damage * excel["羁绊列表"][27].Value2
			end

			if common:LoadInteger(htSeizeBody, playerID, 8) == 1 then
				if myFunc:GetCustomValue(hero, "整数", "夺舍8持续时间") > 0 then
					damage = damage * excel["夺舍"][8].Value2
				end
			end

			if not common:IsAttackDamage() and common:IsEventAttackType(common.AtkTypeHero) then
				if common:LoadInteger(htSeizeBody, playerID, 10) == 1 then
					damage = damage * excel["夺舍"][10].Value1
				end
				-- 技能闪避
				local atkAvoid = attrSystem:GetObjAttrFromStr(triggerUnit, "技能闪避率%")
				if common:GetRandomInt(1, 100) <= atkAvoid then
					common:SetEventDamage(0)
				end
			end

			if common:IsAttackDamage() then
				if code.IsEquipPassiveOwned(playerID, 2) then
					local pro = excel["装备"][2].Value1
					if code.IsEquipSwallowed(playerID, 604) then
						pro = excel["装备"][604].Value1
					end
					if common:GetRandomInt(1, 100) <= pro then
						damage = 0
					end
				end
				if common:LoadInteger(htSeizeBody, playerID, 11) == 1 then
					if common:GetRandomInt(1, 100) <= excel["夺舍"][11].Value3 then
						damage = 0
					end
				end
				-- 攻击闪避
				local atkAvoid = attrSystem:GetObjAttrFromStr(triggerUnit, "攻击闪避率%")
				if common:GetRandomInt(1, 100) <= atkAvoid then
					common:SetEventDamage(0)
				end
			end

			common:SetEventDamage(damage)
			return
		end
		--#endregion

		common:SetEventDamage(damage)
	end
end

--#endregion


return DamageSystem
-- local timer = 1
-- ac.time(1, function()
-- 	timer = timer + 1
-- 	print("计时器: ", timer, "s")
-- end)
