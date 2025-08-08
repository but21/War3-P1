-- 封装(包括内置)
local code = require 'jass.code'
-- 原生
local jass = require 'jass.common'
-- YDWE
local japi = require "jass.japi"

local Module = require "my_base.base_module_manager"
local myFunc = Module.MyFunc
local attrSystem = Module.AttrSystem
local common = Module.Common
local htSeizeBody = jass.udg_HTSeizeBodyID
local htMagicalPower = jass.udg_HTMagicalPower
local excel = Module.Excel
local math = math
local players = jass.udg_Player

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
	if damage <= 0 then
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
end

--#region 伤害系统


-- 备注:物理和法术都算技能吸血,攻击吸血算平A不算多重
-- 攻击吸血,技能吸血,伤害减免,免伤几率这个几个公式和护甲计算方法一样,越多越收益越低
-- 备注:只有技能伤害和被动效果才会造成物理和法术,多重箭和攻击都走攻击


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
		if damage == 0 then
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
		-- 护甲
		local armor = common:GetUnitState(triggerUnit, "护甲")
		-- 伤害减免
		local damageReduce = attrSystem:GetObjAttrFromStr(triggerUnit, "伤害减免%")
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


		--#region 调整英雄普攻并吸血
		if common:IsAttackDamage() == true and common:IsEventAttackType(common.AtkTypeMelee) then
			damage = attrSystem:GetObjAttrFromStr(hero, "面板攻击")
			local critValue = attrSystem:GetObjAttrFromStr(hero, "攻击暴率%")
			local attackAddition = attrSystem:GetObjAttrFromStr(hero, "结算攻击伤害%")
			local critDamage = attrSystem:GetObjAttrFromStr(hero, "结算攻击暴伤%")

			--#region 判断普攻是否暴击并调整伤害
			if common:GetRandomInt(1, 100) <= critValue then -- 暴击
				damage = damage * critDamage * attackAddition
				-- DisplayTextToPlayer(jass.udg_Player[playerID], 0, 0, "|cfffe0000平A暴击")
			else
				-- 不暴击
				damage = damage * attackAddition
			end
			--#endregion
		end
		--#endregion


		--#region 通用伤害加成
		--#endregion 通用伤害加成
		

		--#region攻击伤害
		if common:IsAttackDamage() then
			if common:LoadInteger(htSeizeBody, playerID, 9) == 1 then
				damage = damage * excel["夺舍"][9].Value1
			end

			if common:LoadInteger(htSeizeBody, playerID, 11) == 1 then
				if common:GetRandomInt(1, 100) <= excel["夺舍"][11].Value1 then
					damage = damage * excel["夺舍"][11].Value2
				end
			end

			-- 附加真伤
			local realDamage = 0
			if common:LoadInteger(htSeizeBody, playerID, 4) == 1 then
				realDamage = realDamage + attrSystem:GetObjAttrFromStr(hero, "每秒回血") * excel["夺舍"][4].Value1 * (1 + excel["夺舍"][4].Value2 * common:GetHeroLv(hero))
			end
			if common:LoadInteger(htSeizeBody, playerID, 12) == 1 then
				realDamage = realDamage + attrSystem:GetObjAttrFromStr(hero, "护甲") * excel["夺舍"][12].Value1 * (1 + excel["夺舍"][12].Value2 * common:GetHeroLv(hero))
			end
			if realDamage > 0 then
				realDamage = realDamage * attrSystem:GetObjAttrFromStr(hero, "结算真实伤害%")
				common:UnitDamageTarget(hero, triggerUnit, realDamage, false, false, common.AtkTypeChaos, common.DamageTypeUniversal, common.WeaponTypeNone)
			end


			-- 普攻吸血
			if common:IsAttackDamage() == true and common:IsEventAttackType(common.AtkTypeMelee) then
				local atkRecover = attrSystem:GetObjAttrFromStr(hero, "攻击吸血%")
				atkRecover = atkRecover / (100 + atkRecover)
				common:SetUnitState(hero, "生命值", common:GetUnitState(hero, "生命值") + damage * atkRecover)
			end


			_DamageText(damage, "攻击伤害", enemyX, enemyY, 250, playerID)
			common:SetEventDamage(damage)
			-- DisplayTextToPlayer(jass.udg_Player[playerID], 0, 0, "|cff00fd4c普攻: " .. myFunc:NumToChinese(damage))
			return
		end
		--#endregion

		--#region 真实伤害
		if common:IsEventAttackType(common.AtkTypeChaos) == true then
			_DamageText(damage, "真实伤害", enemyX, enemyY, 250, playerID)
			common:SetEventDamage(damage)
			return
		end
		--#endregion

		--护甲和伤害减免
		damage = damage * (100 / (100 + armor)) * (100 / (100 + damageReduce))


		--#region 物理技能
		if common:IsEventAttackType(common.AtkTypeHero) == true then
			local skillRecover = attrSystem:GetObjAttrFromStr(hero, "技能吸血%")
			skillRecover = skillRecover / (100 + skillRecover)
			common:SetUnitState(hero, "生命值", common:GetUnitState(hero, "生命值") + damage * skillRecover)
			_DamageText(damage, "物理伤害", enemyX, enemyY, 250, playerID)
			common:SetEventDamage(damage)
			-- DisplayTextToPlayer(jass.udg_Player[playerID], 0, 0, "|cffefa00d物理伤害: " .. myFunc:NumToChinese(damage))
			return
		end
		--#endregion 物理技能


		--#region 法术伤害
		if common:IsEventAttackType(common.AtkTypeNormal) == true then
			local skillRecover = attrSystem:GetObjAttrFromStr(hero, "技能吸血%")
			skillRecover = skillRecover / (100 + skillRecover)
			common:SetUnitState(hero, "生命值", common:GetUnitState(hero, "生命值") + damage * skillRecover)
			_DamageText(damage, "法术伤害", enemyX, enemyY, 250, playerID)
			common:SetEventDamage(damage)
			-- DisplayTextToPlayer(jass.udg_Player[playerID], 0, 0, "|cff008afc法术伤害: " .. myFunc:NumToChinese(damage))
			return
		end
		--#endregion 法术技能
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
			if common:LoadInteger(htSeizeBody, playerID, 8) == 1 then
				if myFunc:GetCustomValue(hero, "整数", "夺舍8持续时间") > 0 then
					damage = damage * excel["夺舍"][8].Value2
				end
			end

			if not common:IsAttackDamage() and common:IsEventAttackType(common.AtkTypeHero) then
				if common:LoadInteger(htSeizeBody, playerID, 10) == 1 then
					damage = damage * excel["夺舍"][10].Value1
				end
			end

			if common:IsAttackDamage() then
				if common:LoadInteger(htSeizeBody, playerID, 11) == 1 then
					if common:GetRandomInt(1, 100) <= excel["夺舍"][11].Value3 then
						damage = 0
					end
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
