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
	local pivotX = common:GetRandomInt(-150, 150)
	local pivotY = common:GetRandomInt(-200, 0)
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

-- 存储武器等级哈希表
local _htWeaponLv = jass.udg_HTWeaponLv
-- 存储武器是否超限的哈希表
local _htWeaponIsCX = jass.udg_HTWeaponIsCX

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
		local damageReduce = attrSystem:GetObjAttrFromStr(hero, "伤害减免%")

		--#region  马甲普攻
		if common:IsEventAttackType(common.AtkTypeChaos) == true and common:IsAttackDamage() == true then
			myFunc:SetCustomValue(jass.gg_trg_RunWeapon, "单位", "atkUnit", damageSource)
			myFunc:SetCustomValue(jass.gg_trg_RunWeapon, "单位", "target", triggerUnit)
			common:RunTrigger(jass.gg_trg_RunWeapon)
			common:SetEventDamage(0)
			return
		end
		--#endregion

		-- 判断是否是boss, 是的话则显示血条
		if myFunc:GetCustomValue(triggerUnit, "真值", "IsBOSS") then
			DamageSystem.bossBlood.targetBoss[playerID] = triggerUnit
		end

		-- 非真实伤害减伤
		if common:IsEventAttackType(common.AtkTypePierce) == false then
			damage = damage * (1 - armor / (100 + armor)) * (1 - damageReduce * 0.01)
		end

		--#region 调整英雄普攻
		if common:IsAttackDamage() == true and common:IsEventAttackType(common.AtkTypeMelee) then
			damage = attrSystem:GetObjAttrFromStr(hero, "面板攻击")

			-- 物理暴击率
			local critValue = attrSystem:GetObjAttrFromStr(hero, "物理暴击率%")

			-- 结算物理伤害
			local attackAddition = attrSystem:GetObjAttrFromStr(hero, "结算物理伤害")

			-- 物理暴伤
			local critDamage = attrSystem:GetObjAttrFromStr(hero, "结算物理暴伤")

			--#region 判断普攻是否暴击并调整伤害
			if common:GetRandomInt(1, 100) <= critValue then -- 暴击
				damage = damage * critDamage * attackAddition
				-- DisplayTextToPlayer(jass.udg_Player[playerID], 0, 0, "|cfffe0000平A暴击")
			else
				-- 不暴击
				damage = damage * attackAddition
			end
			--#endregion

			--#region 攻击特效
			local effect = common:CreateEffectInXY("Survival\\AttackEffect\\1.mdx", heroX, heroY)
			common:SetEffectHeight(effect, common:GetPointHeight(jass.udg_Height) - 100)
			common:SetEffectSize(effect, 1.5)
			common:RotateEffect_Z(effect, math.atan(enemyY - heroY, enemyX - heroX))
			common:DestroyEffect(effect)
			--#endregion
		end
		--#endregion

		--#region 通用伤害加成

		-- 葵花宝典
		if not myFunc:GetCustomValue(triggerUnit, "真值", "Is小怪") and common:LoadInteger(_htWeaponIsCX, playerID, 8) == 1 then
			damage = damage * 2
		end
		-- 夺舍 - 7
		if common:LoadInteger(htSeizeBody, playerID, 7) == 1 then
			damage = damage * excel["夺舍"][7]["Value2"]
		end


		--#endregion 通用伤害加成

		--#region 物理伤害加成
		if common:IsEventAttackType(common.AtkTypeHero) or common:IsAttackDamage() == true then

		end
		--#endregion 物理伤害

		--#region 普攻
		if common:IsAttackDamage() == true then
			_DamageText(damage, "物理伤害", enemyX, enemyY, 250, playerID)
			common:SetEventDamage(damage)
			-- DisplayTextToPlayer(jass.udg_Player[playerID], 0, 0, "|cff00fd4c普攻: " .. myFunc:NumToChinese(damage))
			if common:LoadInteger(htSeizeBody, playerID, 5) == 1 and attrSystem:GetObjAttrFromStr(hero, "攻击速度%") >= excel["夺舍"][5]["Value1"] then
				-- 附加真实伤害
				if common:GetUnitState(triggerUnit, "生命值") > 0 then
					damage = excel["夺舍"][5]["Value2"] * common:GetUnitState(triggerUnit, "最大生命值")
					common:UnitDamageTarget(hero, triggerUnit, damage, false, false, common.AtkTypePierce, common.DamageTypeUniversal, common.WeaponTypeNone)
				end
			end
			return
		end
		--#endregion 普攻

		--#region 非普攻物理伤害
		if common:IsEventAttackType(common.AtkTypeHero) == true and common:IsAttackDamage() == false then
			_DamageText(damage, "物理伤害", enemyX, enemyY, 250, playerID)
			common:SetEventDamage(damage)
			-- DisplayTextToPlayer(jass.udg_Player[playerID], 0, 0, "|cffefa00d物理伤害: " .. myFunc:NumToChinese(damage))
			return
		end
		--#endregion 物理技能

		--#region 法术伤害
		if common:IsEventAttackType(common.AtkTypeNormal) == true and common:IsAttackDamage() == false then
			_DamageText(damage, "法术伤害", enemyX, enemyY, 250, playerID)
			common:SetEventDamage(damage)
			-- DisplayTextToPlayer(jass.udg_Player[playerID], 0, 0, "|cff008afc法术伤害: " .. myFunc:NumToChinese(damage))
			local mpLv = common:LoadInteger(htMagicalPower, playerID, 6)
			if mpLv > 0 then
				local realID = 6 + (mpLv - 1) * 50
				local pro = excel["神通"][realID]["Value1"]
				if common:GetRandomInt(1, 100) <= pro then
					local value2 = excel["神通"][realID]["Value2"]
					code.SetUnitAttr_Ex_Str(hero, "智力", 0, value2)
				end
			end
			return
		end
		--#endregion 法术技能

		--#region 真实伤害
		if common:IsEventAttackType(common.AtkTypePierce) == true then
			-- damage = damage / (1 - armor / (100 + armor))
			-- damage = damage / (1 - damageReduce * 0.01)
			_DamageText(damage, "物理伤害", enemyX, enemyY, 250, playerID)
			common:SetEventDamage(damage)
			-- DisplayTextToPlayer(Player(playerID - 1), 0, 0, "|cffa11bfa真实伤害: " .. myFunc:NumToChinese(damage))
			return
		end
		--#endregion 真实伤害
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
		local damageReduce = attrSystem:GetObjAttrFromStr(hero, "伤害减免%")
		damage = damage * (1 - armor / (100 + armor)) * (1 - damageReduce * 0.01)

		--#region 英雄受到伤害
		if common:IsUnitType(triggerUnit, common.UnitTypeHero) == true and triggerUnit == jass.udg_Hero[playerID] then
			local mpID = 7

			local mpLv = common:LoadInteger(htMagicalPower, playerID, mpID)
			if mpLv > 0 then
				local realID = mpID + (mpLv - 1) * 50
				damage = damage * excel["神通"][realID]["Value1"]
			end
			-- 夺舍 - 1
			if common:LoadInteger(htSeizeBody, playerID, 1) == 1 then
				if common:GetRandomInt(1, 100) <= excel["夺舍"][1]["Value1"] then
					damage = 0
				else
					local minValue = excel["夺舍"][1]["Value2"]
					local maxValue = excel["夺舍"][1]["Value3"]
					damage = damage * common:GetRandomReal(minValue, maxValue)
				end
			end

			-- 夺舍 - 7
			if common:LoadInteger(htSeizeBody, playerID, 7) == 1 then
				damage = damage * excel["夺舍"][7]["Value1"]
			end

			common:SetEventDamage(damage)
			return
		end
		--#endregion

		--#region 玩家其他单位受到伤害
		if not common:IsUnitEnemy(damageSource, common.Player[1]) then
			common:SetEventDamage(damage)
			return
		end
		common:SetEventDamage(damage)
		--#endregion
	end
end

--#endregion


return DamageSystem
-- local timer = 1
-- ac.time(1, function()
-- 	timer = timer + 1
-- 	print("计时器: ", timer, "s")
-- end)
