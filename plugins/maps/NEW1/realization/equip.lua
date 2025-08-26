local jass = require "jass.common"
local code = require "jass.code"
local japi = require "jass.japi"
local debug = require "jass.debug"
local slk = require "jass.slk"

local BaseModule = require "my_base.base_module_manager"
local event = BaseModule.Event
local common = BaseModule.Common
local attrSystem = BaseModule.AttrSystem
local myFunc = BaseModule.MyFunc
local excel = BaseModule.Excel

local heros = jass.udg_Hero
local playerGold = jass.udg_PlayerGold
local equipPoint = jass.udg_EquipPoint

local Equip = {}

local allItemType = {}
local itemLvAmount = {}
Equip.allItemType = allItemType
Equip.itemLvAmount = itemLvAmount

local ownedPassive = {}
local swallowEquip = {}
local swallowEquip2 = {}
for playerID, value in ipairs(jass.udg_Player) do
	ownedPassive[playerID] = {}
	swallowEquip[playerID] = {}
	swallowEquip2[playerID] = {}
end

local lvColor = { "|cffffffff", "|cff00ff00", "|cff00ffff", "|cffd400ff", "|cffff0000", "|cfaffff00" }

local function EquipInit()
	for itemcode, itemData in pairs(slk.item) do
		if itemData.class == "Permanent" then
			if itemcode:sub(1, 1) == "I" then
				local index = tonumber(itemData.Name)
				if index then
					allItemType[index] = myFunc:ID2Int(itemcode)
					local lv = tonumber(itemData.Level) or 0
					itemLvAmount[lv] = (itemLvAmount[lv] or 0) + 1
					common:DestroyItem(common:CreateItem(allItemType[index], 0, 0))
					myFunc:SetCustomValue(allItemType[index], "整数", "ID", index)
					common:SetItemTypeData(allItemType[index], "名字", lvColor[lv] .. excel["装备"][index].Name .. "|r")
					local tip
					if excel["装备"][index].Attr then
						tip = excel["装备"][index].Attr
					end
					if excel["装备"][index].Tip then
						tip = tip and (tip .. "|n|n" .. excel["装备"][index].Tip) or excel["装备"][index].Tip
					end
					if excel["装备"][index].SwallowTip then
						tip = tip and (tip .. "|n|n吞噬效果:|n" .. excel["装备"][index].SwallowTip) or excel["装备"][index].SwallowTip
					end
					common:SetItemTypeData(allItemType[index], "提示", tip)
				else
					print("装备加载错误: ", itemcode, itemData.Name)
				end
			end
		end
	end

	for playerID = 1, 4 do
		if common:PlayerInGame(common.Player[playerID]) then
			event:On("HeroAtk", playerID, function(hero, target, self)
				if code.IsEquipPassiveOwned(playerID, 5) then
					local val = excel["装备"][5].Value1
					playerGold[playerID] = playerGold[playerID] + val * (1 + 0.01 * attrSystem:GetObjAttrFromStr(hero, "金币加成"))
				end
				if code.IsEquipPassiveOwned(playerID, 8) then
					local val = math.RandomInt(excel["装备"][8].Value1, excel["装备"][8].Value2)
					attrSystem:SetObjAttrEx_Str(hero, "智力", 0, val)
				end
			end)
			event:On("HeroAtked", playerID, function(atker, hero, self)
				if code.IsEquipPassiveOwned(playerID, 3) then
					local val = math.RandomInt(excel["装备"][3].Value1, excel["装备"][3].Value2)
					attrSystem:SetObjAttrEx_Str(hero, "生命", 0, val)
				end
			end)
			event:On("HeroLvUp", playerID, function(hero, self)
				if code.IsEquipPassiveOwned(playerID, 8) then
					local val = excel["装备"][6].Value1
					local ranIndex = math.RandomInt(1, 3)
					if ranIndex == 1 then
						attrSystem:SetObjAttrEx_Str(hero, "每秒力量", 0, val)
					end
					if ranIndex == 2 then
						attrSystem:SetObjAttrEx_Str(hero, "每秒敏捷", 0, val)
					end
					if ranIndex == 3 then
						attrSystem:SetObjAttrEx_Str(hero, "每秒智力", 0, val)
					end
				end
			end)
			local killCount = 0
			event:On("HeroKill", playerID, function(hero, target, self)
				if code.IsEquipPassiveOwned(playerID, 10) then
					killCount = killCount + 1
					if killCount >= excel["装备"][10].Value1 then
						killCount = 0
						local val = math.RandomInt(excel["装备"][10].Value2, excel["装备"][10].Value3)
						attrSystem:SetObjAttrEx_Str(hero, "每秒回血", 0, val)
					end
				end
			end)
		end
	end
end

event:On("GetItem", 0, function()
	local unit = common:GetTriggerUnit()
	local player = common:GetOwningPlayer(unit)
	local playerID = common:ConvertPlayerToID(player)
	local item = common:GetManipulatedItem()
	if common:JudgeItemClass(item, "永久") and unit == heros[playerID] then
		local itemcode = common:GetItemcode(item)
		local itemID = myFunc:GetCustomValue(itemcode, "整数", "ID")
		if code.IsEquipSwallowed(playerID, itemID) then
			common:DropItem(heros[playerID], item)
			code.AddMessage(playerID, "|cffff0000无法拾取已吞噬的装备!!!")
			return
		end
		local passiveID = excel["装备"][itemID].PID
		if passiveID then
			ownedPassive[playerID][passiveID] = (ownedPassive[playerID][passiveID] or 0) + 1
		end
		local attrStr = excel["装备"][itemID].Attr
		attrSystem:SetUnitAttrStr(unit, 0, attrStr)
	end
end)

event:On("DropItem", 0, function()
	local unit = common:GetTriggerUnit()
	local player = common:GetOwningPlayer(unit)
	local playerID = common:ConvertPlayerToID(player)
	local item = common:GetManipulatedItem()
	if common:JudgeItemClass(item, "永久") and unit == heros[playerID] then
		local itemcode = common:GetItemcode(item)
		local itemID = myFunc:GetCustomValue(itemcode, "整数", "ID")
		local passiveID = excel["装备"][itemID].PID
		if passiveID then
			ownedPassive[playerID][passiveID] = ownedPassive[playerID][passiveID] - 1
		end
		local attrStr = excel["装备"][itemID].Attr
		attrSystem:SetUnitAttrStr(unit, 1, attrStr)
	end
end)

local getItemTrg = jass.CreateTrigger()
local dropItemTrg = jass.CreateTrigger()
debug.handle_ref(getItemTrg)
debug.handle_ref(dropItemTrg)
for playerID = 1, 4 do
	jass.TriggerRegisterPlayerUnitEvent(getItemTrg, common.Player[playerID], jass.EVENT_PLAYER_UNIT_PICKUP_ITEM, nil)
	jass.TriggerRegisterPlayerUnitEvent(dropItemTrg, common.Player[playerID], jass.EVENT_PLAYER_UNIT_DROP_ITEM, nil)
end
jass.TriggerAddAction(getItemTrg, function()
	event:Emit("GetItem", 0)
end)

jass.TriggerAddAction(dropItemTrg, function()
	event:Emit("DropItem", 0)
end)

EquipInit()


function code.IsEquipPassiveOwned(playerID, pID)
	if ownedPassive[playerID][pID] and ownedPassive[playerID][pID] > 0 then
		return true
	else
		return false
	end
end

function code.IsEquipSwallowed(playerID, equipID)
	if swallowEquip[playerID][equipID] then
		return true
	else
		return false
	end
end

function Equip:CreateEquip(playerID, lv, count)
	local item
	for i = 1, count do
		local randIndex = math.RandomInt(1, itemLvAmount[lv])
		local id = 100 * lv + randIndex
		item = common:CreateItem(allItemType[id], common:GetPointX(equipPoint[playerID]), common:GetPointY(equipPoint[playerID]))
	end
	return item
end

function Equip:CreateEquip2(lv, count, x, y)
	for i = 1, count do
		local randIndex = math.RandomInt(1, itemLvAmount[lv])
		local id = 100 * lv + randIndex
		common:CreateItem(allItemType[id], x, y)
	end
end

function Equip:CreateEquip3(unit, slot, lv, equipID)
	local newID = math.RandomInt(1, itemLvAmount[lv]) + lv * 100
	while newID == equipID do
		newID = math.RandomInt(1, itemLvAmount[lv]) + lv * 100
	end
	local itemType = allItemType[newID]
	local item = common:CreateItemToSlot(unit, itemType, slot)
	return item
end

function code.CreateEquip1(lv, equipID, x, y)
	local newID = math.RandomInt(1, itemLvAmount[lv]) + lv * 100
	while newID == equipID do
		newID = math.RandomInt(1, itemLvAmount[lv]) + lv * 100
	end
	local itemType = allItemType[newID]
	return common:CreateItem(itemType, x, y)
end

function code.CreateEquip3(unit, slot, lv, equipID)
	return Equip:CreateEquip3(unit, slot, lv, equipID)
end

function code.SwallowEquip(playerID, equipID)
	swallowEquip[playerID][equipID] = true
	table.insert(swallowEquip2[playerID], equipID)
	local passiveID = excel["装备"][equipID].PID
	if passiveID then
		ownedPassive[playerID][passiveID] = (ownedPassive[playerID][passiveID] or 0) + 1
	end
	local attrStr = excel["装备"][equipID].Attr
	attrSystem:SetUnitAttrStr(heros[playerID], 0, attrStr)
	if common:IsLocalPlayer(common.Player[playerID]) then
		common:SetItemTypeData(allItemType[equipID], "名字", common:GetItemTypeData(allItemType[equipID], "名字") .. "(已吞噬)")
		common:SetItemTypeData(allItemType[equipID], "图标", "ReplaceableTextures\\CommandButtons\\BTNCancel.blp")
	end
	if equipID == 602 or equipID == 605 or equipID == 608 or equipID == 609 then
		attrSystem:SetUnitAttrStr(heros[playerID], 0, excel["装备"][equipID].Value1)
	end
	if equipID == 603 then
		code.BeginSeizeBody(playerID)
	end
	if equipID == 606 then
		local val = math.RandomInt(excel["装备"][equipID].Value1, excel["装备"][equipID].Value2)
		attrSystem:SetObjAttrEx_Str(heros[playerID], "物理暴率%", 0, val)
		attrSystem:SetObjAttrEx_Str(heros[playerID], "物理暴伤%", 3, excel["装备"][equipID].Value3)
	end
	if equipID == 607 then
		attrSystem:SetObjAttrEx_Str(heros[playerID], "敏捷加成", 0, excel["装备"][equipID].Value1 * common:GetHeroLv(heros[playerID]))
	end
	if equipID == 612 then
		local count = 0
		event:On("HeroKill", playerID, function()
			count = count + 1
			if count >= excel["装备"][equipID].Value1 then
				attrSystem:SetObjAttrEx_Str(heros[playerID], "物理伤害%", 0, excel["装备"][equipID].Value2)
				count = 0
			end
		end)
	end
	if equipID == 613 then
		local count = 0
		event:On("HeroKill", playerID, function()
			count = count + 1
			if count >= excel["装备"][equipID].Value1 then
				attrSystem:SetObjAttrEx_Str(heros[playerID], "法术伤害%", 0, excel["装备"][equipID].Value2)
				count = 0
			end
		end)
	end
	if equipID == 614 then
		attrSystem:SetObjAttrEx_Str(heros[playerID], "攻击暴伤%", 3, excel["装备"][equipID].Value1)
	end
	if equipID == 615 then
		local val = math.RandomReal(excel["装备"][equipID].Value1, excel["装备"][equipID].Value2)

		attrSystem:SetObjAttrEx_Str(heros[playerID], "最终伤害", 0, val * common:GetHeroLv(heros[playerID]))
	end
	if equipID == 616 then
		local count = 0
		event:On("HeroLvUp", playerID, function(hero, self)
			local val = excel["装备"][equipID].Value1
			count = count + val
			attrSystem:SetObjAttrEx_Str(heros[playerID], "法术暴率%", 0, val)
			if count >= excel["装备"][equipID].Value2 then
				event:Off("HeroLvUp", playerID, self)
			end
		end)
	end
	if equipID == 618 then
		local all   = excel["装备"][equipID].Value1 * common:GetHeroLv(heros[playerID])
		local limit = excel["装备"][equipID].Value2 * common:GetHeroLv(heros[playerID])
		local val   = math.RandomReal(0, limit)
		attrSystem:SetObjAttrEx_Str(heros[playerID], "杀敌力量", 0, val)
		code.AddMessage(playerID, "获得杀敌力量+" .. string.format("%.1f", val))
		all = all - val
		val = math.RandomReal(0, math.min(all, limit))
		attrSystem:SetObjAttrEx_Str(heros[playerID], "杀敌敏捷", 0, val)
		code.AddMessage(playerID, "获得杀敌敏捷+" .. string.format("%.1f", val))
		all = all - val
		val = math.max(0, all)
		attrSystem:SetObjAttrEx_Str(heros[playerID], "杀敌智力", 0, val)
		code.AddMessage(playerID, "获得杀敌智力+" .. string.format("%.1f", val))
	end
	if equipID == 620 then
		attrSystem:SetObjAttrEx_Str(heros[playerID], "绝对伤害", 0, #swallowEquip2[playerID] * excel["装备"][equipID].Value1)
	end
end


return Equip
