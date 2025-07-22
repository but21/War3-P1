-- 封装
local code = require 'jass.code'
-- 原生
local jass = require 'jass.common'
-- 内置
local japi = require "jass.japi"

local manager = {}

---@class Player

---@type Player 玩家1~16(0为本地玩家)
manager.Player = {}
for i = 1, 16 do
	manager.Player[i] = jass.Player(i - 1)
end
manager.Player[0] = jass.GetLocalPlayer()

--#region 伤害类型

---@type integer 伤害类型: 破坏
manager.DamageTypeDemolition = jass.DAMAGE_TYPE_DEMOLITION
---@type integer 伤害类型: 力量
manager.DamageTypeForce = jass.DAMAGE_TYPE_FORCE
---@type integer 伤害类型: 强化
manager.DamageTypeEnhanced = jass.DAMAGE_TYPE_ENHANCED
---@type integer 伤害类型: 普通
manager.DamageTypeNormal = jass.DAMAGE_TYPE_NORMAL
---@type integer 伤害类型: 通用
manager.DamageTypeUniversal = jass.DAMAGE_TYPE_UNIVERSAL

--#endregion

--#region 武器类型

---@type integer 武器类型: 无
manager.WeaponTypeNone = jass.WEAPON_TYPE_WHOKNOWS
---@type integer 武器类型: 金属轻砍
manager.WeaponTypeMLC = jass.WEAPON_TYPE_METAL_LIGHT_CHOP

--#endregion

--#region 攻击类型

---@type integer 攻击类型: 法术
manager.AtkTypeNormal = jass.ATTACK_TYPE_NORMAL
---@type integer 攻击类型: 普通
manager.AtkTypeMelee = jass.ATTACK_TYPE_MELEE
---@type integer 攻击类型: 穿刺
manager.AtkTypePierce = jass.ATTACK_TYPE_PIERCE
---@type integer 攻击类型: 攻城
manager.AtkTypeSiege = jass.ATTACK_TYPE_SIEGE
---@type integer 攻击类型: 混乱
manager.AtkTypeChaos = jass.ATTACK_TYPE_CHAOS
---@type integer 攻击类型: 英雄
manager.AtkTypeHero = jass.ATTACK_TYPE_HERO
---@type integer 攻击类型: 魔法
manager.AtkTypeMagic = jass.ATTACK_TYPE_MAGIC

--#endregion

--#region 单位类别

---@type integer 单位类别: 英雄
manager.UnitTypeHero = jass.UNIT_TYPE_HERO
---@type integer 单位类别: 泰坦
manager.UnitTypeGiant = jass.UNIT_TYPE_GIANT

--#endregion

---单位所受伤害(受伤事件)
---@return number
function manager:GetEventDamage()
	return jass.GetEventDamage()
end

---触发单位
---@return integer
function manager:GetTriggerUnit()
	return jass.GetTriggerUnit()
end

---伤害来源(单位, 受伤事件)
---@return integer
function manager:GetEventDamageSource()
	return jass.GetEventDamageSource()
end

---获取单位文本提示拓展
---@param unit integer
---@return string
function manager:GetUnitTip(unit)
	return jass.GetUnitName(unit)
end

---单位是否是玩家的敌对单位
---@param unit integer 判断单位
---@param player Player 玩家
---@return boolean -- 是则为true
function manager:IsUnitEnemy(unit, player)
	return jass.IsUnitEnemy(unit, player)
end

---获取单位所有者(玩家)
---@param unit integer 单位
---@return Player -- 玩家
function manager:GetOwningPlayer(unit)
	return jass.GetOwningPlayer(unit)
end

---转换玩家为ID(1~12)
---@param player Player 玩家
---@return integer -- 玩家ID
function manager:ConvertPlayerToID(player)
	return code.GetConvertedPlayerId(player)
end

---判断单位受到的伤害类型(受伤事件)
---@param damageType integer 伤害类型
---@return boolean
function manager:IsEventDamageType(damageType)
	return code.YDWEIsEventDamageType(damageType)
end

---设置单位所受伤害(受伤事件)
---@param damage number 伤害值
function manager:SetEventDamage(damage)
	code.YDWESetEventDamage(damage)
end

---获取单位位置
---@param unit integer 单位
---@return integer
function manager:GetUnitLoc(unit)
	return jass.GetUnitLoc(unit)
end

---获取单位属性(护甲, 生命值, 魔法值, 最大生命值, 最大魔法值, 攻击距离, 攻击间隔, 攻击速度, 生命百分比, 魔法百分比)
---@param unit integer 单位
---@param ty string 属性
---@return number
function manager:GetUnitState(unit, ty)
	if ty == "护甲" then
		return japi.GetUnitState(unit, jass.ConvertUnitState(0x20))
	end
	if ty == "生命值" then
		return japi.GetUnitState(unit, jass.UNIT_STATE_LIFE)
	end
	if ty == "最大生命值" then
		return japi.GetUnitState(unit, jass.UNIT_STATE_MAX_LIFE)
	end
	if ty == "魔法值" then
		return japi.GetUnitState(unit, jass.UNIT_STATE_MANA)
	end
	if ty == "最大魔法值" then
		return japi.GetUnitState(unit, jass.UNIT_STATE_MAX_MANA)
	end
	if ty == "攻击距离" then
		return japi.GetUnitState(unit, jass.ConvertUnitState(0x16))
	end
	if ty == "攻击间隔" then
		return japi.GetUnitState(unit, jass.ConvertUnitState(0x25))
	end
	if ty == "攻击速度" then
		return japi.GetUnitState(unit, jass.ConvertUnitState(0x51))
	end
	if ty == "生命百分比" then
		return code.GetUnitLifePercent(unit)
	end
	if ty == "魔法百分比" then
		return code.GetUnitManaPercent(unit)
	end
	if ty == "移动速度" then
		return jass.GetUnitMoveSpeed(unit)
	end
	return 0
end

function manager:SetUnitState(unit, ty, val)
	if ty == "护甲" then
		jass.SetUnitState(unit, jass.ConvertUnitState(0x20), val)
	end
	if ty == "生命值" then
		jass.SetUnitState(unit, jass.UNIT_STATE_LIFE, val)
	end
	if ty == "魔法值" then
		jass.SetUnitState(unit, jass.UNIT_STATE_MANA, val)
	end
	if ty == "攻击距离" then
		jass.SetUnitState(unit, jass.ConvertUnitState(0x16), val)
	end
	if ty == "攻击间隔" then
		jass.SetUnitState(unit, jass.ConvertUnitState(0x25), val)
	end
	if ty == "攻击速度" then
		jass.SetUnitState(unit, jass.ConvertUnitState(0x51), val)
	end
end

---判断单位受到的攻击类型(受伤事件)
---@param attackType integer 攻击类型
---@return boolean
function manager:IsEventAttackType(attackType)
	return code.YDWEIsEventAttackType(attackType)
end

---判断单位受到的伤害是否为攻击伤害(受伤事件)
---@return boolean
function manager:IsAttackDamage()
	return code.YDWEIsEventAttackDamage()
end

---判断单位受到伤害的武器类型(受伤事件)
---@param weaponType integer 武器类型
---@return boolean
function manager:IsEventWeaponType(weaponType)
	return code.YDWEIsEventWeaponType(weaponType)
end

---获取随机整数
---@param min integer 最小值
---@param max integer 最大值
---@return integer
function manager:GetRandomInt(min, max)
	return jass.GetRandomInt(min, max)
end

---获取随机实数
---@param min number 最小值
---@param max number 最大值
---@return number
function manager:GetRandomReal(min, max)
	return jass.GetRandomReal(min, max)
end

---移除点
---@param point integer 点
function manager:RemoveLocation(point)
	jass.RemoveLocation(point)
end

---单位伤害目标
---@param unit integer 伤害单位
---@param target integer 受伤单位
---@param damage number 伤害值
---@param isAttackDamage boolean 是攻击伤害
---@param isFarAttack boolean 是远程攻击
---@param attackType integer 攻击类型
---@param damageType integer 伤害类型
---@param weaponType integer 武器类型
function manager:UnitDamageTarget(unit, target, damage, isAttackDamage, isFarAttack, attackType, damageType, weaponType)
	jass.UnitDamageTarget(unit, target, damage, isAttackDamage, isFarAttack, attackType, damageType, weaponType)
end

---字符串哈希值
---@param str string 字符串
---@return integer
function manager:StringHash(str)
	return jass.StringHash(str)
end

---从哈希表提取整数
---@param hashTable integer 哈希表
---@param mainIndex integer 主索引
---@param subIndex integer 子索引
---@return integer
function manager:LoadInteger(hashTable, mainIndex, subIndex)
	return jass.LoadInteger(hashTable, mainIndex, subIndex)
end

---从哈希表提取实数
---@param hashTable integer 哈希表
---@param mainIndex integer 主索引
---@param subIndex integer 子索引
---@return number
function manager:LoadReal(hashTable, mainIndex, subIndex)
	return jass.LoadReal(hashTable, mainIndex, subIndex)
end

---保存整数到哈希表
---@param hashTable integer 哈希表
---@param mainIndex integer 主索引
---@param subIndex integer 子索引
---@param value integer 值
function manager:SaveInteger(hashTable, mainIndex, subIndex, value)
	jass.SaveInteger(hashTable, mainIndex, subIndex, value)
end

---新建特效, 创建到点
---@param effectStr string 特效字符串
---@param point integer 点
---@return integer --特效
function manager:CreateEffectInPoint(effectStr, point)
	return jass.AddSpecialEffectLoc(effectStr, point)
end

---新建特效, 创建到坐标
---@param effectStr string 特效字符串
---@param x number X坐标
---@param y number Y坐标
---@return integer --特效
function manager:CreateEffectInXY(effectStr, x, y)
	return jass.AddSpecialEffect(effectStr, x, y)
end

---删除特效
---@param effect integer 特效
function manager:DestroyEffect(effect)
	jass.DestroyEffect(effect)
end

---设置特效高度
---@param effect integer 特效
---@param height number 高度
function manager:SetEffectHeight(effect, height)
	japi.EXSetEffectZ(effect, height)
end

---获取点的高度
---@param point integer 点
---@return number
function manager:GetPointHeight(point)
	return jass.GetLocationZ(point)
end

---特效绕Z轴旋转
---@param effect integer 特效
---@param angle number 角度
function manager:RotateEffect_Z(effect, angle)
	japi.EXEffectMatRotateZ(effect, angle)
end

---两点间方向
---@param point1 integer 起始点
---@param point2 integer 终点
---@return number -- 角度
function manager:AngleBetweenPoints(point1, point2)
	return code.AngleBetweenPoints(point1, point2)
end

---单位类别检查
---@param unit integer 单位
---@param unitType integer 单位类别
---@return boolean --匹配则为true
function manager:IsUnitType(unit, unitType)
	return jass.IsUnitType(unit, unitType)
end

---运行触发器(无视条件)
---@param trigger integer 触发器
function manager:RunTrigger(trigger)
	jass.TriggerExecute(trigger)
end

---单位是否死亡
---@param unit integer
---@return boolean
function manager:IsUnitDead(unit)
	return jass.IsUnitType(unit, jass.UNIT_TYPE_DEAD)
end

---单位身上buff数量
---@param unit integer 单位
---@param ty1 boolean 正面buff
---@param ty2 boolean 负面buff
---@param ty3 boolean 魔法buff
---@param ty4 boolean 物理buff
---@param ty5 boolean 生命周期
---@param ty6 boolean 光环效果
---@param ty7 boolean 不可驱散buff
---@return integer
function manager:UnitCountBuffsEx(unit, ty1, ty2, ty3, ty4, ty5, ty6, ty7)
	return jass.UnitCountBuffsEx(unit, ty1, ty2, ty3, ty4, ty5, ty6, ty7)
end

---获取本地玩家ID
---@return integer -- 本地玩家id
function manager:GetLocalPlayerID()
	return code.GetConvertedPlayerId(jass.GetLocalPlayer())
end

---获取本地玩家
---@return Player -- 本地玩家
function manager:GetLocalPlayer()
	return jass.GetLocalPlayer()
end

--- 判断是否为本地玩家
---@param player Player 玩家
---@return boolean
function manager:IsLocalPlayer(player)
	return player == jass.GetLocalPlayer()
end

---获取物品类型数据
---@param itemType integer 物品类型
---@param dataType string 数据类型(提示, 提示拓展, 图标)
---@return string
function manager:GetItemTypeData(itemType, dataType)
	if dataType == "提示" then
		return code.YDWEGetItemDataString(itemType, 4)
	end
	if dataType == "提示拓展" then
		return code.YDWEGetItemDataString(itemType, 3)
	end
	if dataType == "图标" then
		return code.YDWEGetItemDataString(itemType, 1)
	end
	return "获取" .. dataType .. "失败"
end

---获得物品的物品类型
---@param item integer 物品
---@return integer --物品类型
function manager:GetItemType(item)
	return jass.GetItemTypeId(item)
end

---获取单位X坐标
---@param unit integer 单位
---@return real
function manager:GetUnitX(unit)
	return jass.GetUnitX(unit)
end

---获取单位Y坐标
---@param unit integer 单位
---@return real
function manager:GetUnitY(unit)
	return jass.GetUnitY(unit)
end

---@param unit1 integer 获得两个单位之间的距离
---@param unit2 integer 获得两个单位之间的距离
---@return real
function manager:DistanceBetweenUnits(unit1, unit2)
	return math.sqrt((self:GetUnitX(unit1) - self:GetUnitX(unit2)) ^ 2 + (self:GetUnitY(unit1) - self:GetUnitY(unit2)) ^ 2)
end

---发送同步
---@param tag string
---@param val any
function manager:SendSync(tag, val)
	japi.DzSyncData(tag, val or "")
end

local event = {}
---接收同步
---@param tag string
---@return function<string>
function manager:ReceiveSync(tag)
	if not event[tag] then
		event[tag] = {}
		local trg = jass.CreateTrigger()
		jass.TriggerAddAction(trg, function()
			--获取同步数据和同步玩家
			--如何判断val这个字符串里面只是纯数字还是字符串
			local val = nil
			local syncData = japi.DzGetTriggerSyncData() or ""
			if syncData:match("^%d+$") ~= nil then
				val = tonumber(syncData)
			else
				val = syncData
			end
			-- local playerID = self:GetConvertedPlayerId(japi.DzGetTriggerSyncPlayer()) or 1
			if #event[tag] > 0 then
				for _, callback in ipairs(event[tag]) do
					callback(val)
				end
			end
		end)
		japi.DzTriggerRegisterSyncData(trg, tag, false)
	end
	return function(callback)
		table.insert(event[tag], callback)
	end
end

--- 获取同步玩家
---@return Player
function manager:GetSyncPlayer()
	return japi.DzGetTriggerSyncPlayer()
end

---根据索引播放特效动画
---@param effect integer
---@param index integer
function manager:PlayAnimIndex(effect, index)
	code.Effect_SetAnimationIndex(effect, index)
end

---根据索引播放特效动画
---@param effect integer
---@param name string
function manager:PlayAnimName(effect, name)
	code.Effect_SetAnimation(effect, name, "")
end

---设置特效大小
---@param effect integer
---@param size number
function manager:SetEffectSize(effect, size)
	code.EXSetEffectSize(effect, size)
end

---设置单位显示/隐藏
---@param unit integer
---@param isShow boolean
function manager:SetUnitShow(unit, isShow)
	jass.ShowUnit(unit, isShow)
end

---获取鼠标滚轮变化值(异步)
---@return integer (正数向上, 负数向下)
function manager:GetWheelData()
	return japi.DzGetWheelDelta()
end

---玩家是否在游戏中
---@param player Player 玩家
---@return boolean
function manager:PlayerInGame(player)
	if jass.GetPlayerSlotState(player) == jass.PLAYER_SLOT_STATE_PLAYING and jass.GetPlayerController(player) == jass.MAP_CONTROL_USER then
		return true
	else
		return false
	end
end

---设置特效显示/隐藏
---@param effect any
---@param isShow boolean
function manager:SetEffectShow(effect, isShow)
	code.Effect_Show(effect, isShow)
end

return manager
