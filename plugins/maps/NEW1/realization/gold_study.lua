local Module                 = require "my_base.base_module_manager"
local jass                   = require "jass.common"
local code                   = require "jass.code"
local excelStm               = Module.ExcelSystem
local myFunc                 = Module.MyFunc
local common                 = Module.Common
local attrStm                = Module.AttrSystem
local math                   = math
local equip                  = require "realization.equip"

local playerGold             = jass.udg_PlayerGold
local drawedCount            = jass.udg_GoldStudyDrawedCount
local goldNpc                = jass.udg_GoldStudyNpc

local GoldStudy              = {}

---@class GoldStudyData
local GoldStudyData          = {}
GoldStudyData.__index        = GoldStudyData

GoldStudyData.originCost     = excelStm:GetData("其它", 18, "Value1")
GoldStudyData.raiseCost      = excelStm:GetData("其它", 18, "Value2")
GoldStudyData.twoTimesPro    = excelStm:GetData("其它", 18, "Value3")
GoldStudyData.threeTimesPro  = excelStm:GetData("其它", 18, "Value4")
GoldStudyData.drawLimitCount = excelStm:GetData("其它", 18, "Value5")

function GoldStudyData:New()
	---@class GoldStudyData
	local obj = setmetatable({}, self)
	GoldStudyData.allAttrs = {}
	for id = 1, excelStm:GetLength("学习"), 1 do
		local attr = {
			id = id,
			weight = excelStm:GetData("学习", id, "Weight"),
			name = excelStm:GetData("学习", id, "Attr"),
			minVal = excelStm:GetData("学习", id, "MinVal"),
			maxVal = excelStm:GetData("学习", id, "MaxVal"),
			canRaise = excelStm:GetData("学习", id, "CanRaise") == 1,
		}
		table.insert(GoldStudyData.allAttrs, attr)
	end
	-- 二阶段抽奖消耗
	obj.lotteryCost = {}
	-- 二阶段抽到的属性倍率
	obj.lotteryAttrRate = {}
	-- 二阶段装备品质概率
	obj.lotteryEquipPro = {}
	-- 二阶段不同物品概率
	obj.lotteryTyPro = {}
	for i = 1, 3 do
		obj.lotteryCost[i] = excelStm:GetData("其它", 18 + i, "Value1")
		obj.lotteryAttrRate[i] = excelStm:GetData("其它", 18 + i, "Value2")
		obj.lotteryEquipPro[i] = {}
		obj.lotteryTyPro[i] = {}
		for j = 1, 5, 1 do
			table.insert(obj.lotteryEquipPro[i], excelStm:GetData("概率", i, "Pro" .. j))
		end
		for j = 6, 8, 1 do
			table.insert(obj.lotteryTyPro[i], excelStm:GetData("概率", i, "Pro" .. j))
		end
	end
	return obj
end

function GoldStudyData:DrawAttr(count)
	local result = myFunc:RWS(self.allAttrs, count)
	return result
end

function GoldStudyData:Lottery(playerID, lv)
	local lotteryResult = { 0, 0, 0 }
	for count = 1, math.min(playerGold[playerID] // self.lotteryCost[lv], 10) do
		local ran = math.RandomInt(1, 100)
		for index, value in ipairs(self.lotteryTyPro[lv]) do
			if ran <= value then
				lotteryResult[index] = lotteryResult[index] + 1
				break
			end
		end
	end
	-- 根据抽奖类型给奖励
	for ty, amount in ipairs(lotteryResult) do
		if amount > 0 then
			playerGold[playerID] = playerGold[playerID] - amount * self.lotteryCost[lv]
			if ty == 1 then
				for index, attrT in ipairs(self:DrawAttr(amount)) do
					local attrVal = math.RandomInt(attrT.minVal, attrT.maxVal)
					if attrT.canRaise then
						attrVal = attrVal * self.lotteryAttrRate[lv]
					end
					if attrT.name:sub(-1) == "%" then
						code.AddMessage(playerID, "获得属性: " .. attrT.name:sub(-1) .. " +|cfaffff00" .. attrVal .. "%")
					else
						code.AddMessage(playerID, "获得属性: " .. attrT.name .. " +|cfaffff00" .. attrVal)
					end
					attrStm:SetObjAttrEx_Str(jass.udg_Hero[playerID], attrT.name, 0, attrVal)
				end
			end
			if ty == 2 then
				for i = 1, amount do
					local equipLv = 0
					local ran = math.RandomInt(1, 100)
					for index, value in ipairs(self.lotteryEquipPro[lv]) do
						if ran <= value then
							equipLv = index
							break
						end
					end
					local item = equip:CreateEquip(playerID, equipLv, 1)
					code.AddMessage(playerID, "获得装备: " .. common:GetItemTypeData(common:GetItemcode(item), "名字"))
				end
			end
			if ty == 3 then
				for i = 1, amount do
					common:CreateItem(myFunc:ID2Int("I05B"), common:GetPointX(jass.udg_PropsPoint[playerID]), common:GetPointY(jass.udg_PropsPoint[playerID]))
				end
				code.AddMessage(playerID, "|cfaffff00获得 [装备吞噬丹]*" .. amount)
			end
		end
	end
	-- 设置对应技能文本
end

local picker = GoldStudyData:New()

local function EnterStage2(playerID)
	common:UnitRemoveAbility(goldNpc[playerID], myFunc:ID2Int("A01H"))
	common:UnitAddAbility(goldNpc[playerID], myFunc:ID2Int("A01I"))
	common:UnitAddAbility(goldNpc[playerID], myFunc:ID2Int("A01J"))
	common:UnitAddAbility(goldNpc[playerID], myFunc:ID2Int("A01K"))
	local skill = myFunc:ID2Int("A01I")
	local tip = "|cffB4C4E2消耗：金币 |cffFF6E21" .. picker.lotteryCost[1] .. "|r|n"
	tip = tip .. "|cffB4C4E2随机抽取属性，E~C级装备|n|n"
	tip = tip .. "|cff696E6E自动十连"
	common:SetSkillDataStr(goldNpc[playerID], skill, 218, tip)
	skill = myFunc:ID2Int("A01J")
	tip = "|cffB4C4E2消耗：金币 |cffFF6E21" .. picker.lotteryCost[2] .. "|r|n"
	tip = tip .. "|cffB4C4E2随机抽取属性，D~B级装备|n|n"
	tip = tip .. "|cff696E6E自动十连"
	common:SetSkillDataStr(goldNpc[playerID], skill, 218, tip)
	skill = myFunc:ID2Int("A01K")
	tip = "|cffB4C4E2消耗：金币 |cffFF6E21" .. picker.lotteryCost[3] .. "|r|n"
	tip = tip .. "|cffB4C4E2随机抽取属性，C~A级装备，小概率获得装备吞噬丹|n|n"
	tip = tip .. "|cff696E6E自动十连"
	common:SetSkillDataStr(goldNpc[playerID], skill, 218, tip)
end

function code.GoldStudy(playerID, ID)
	if ID == 1 then
		for index, attrT in ipairs(picker:DrawAttr(10)) do
			if drawedCount[playerID] < picker.drawLimitCount then
				local cost = picker.originCost + drawedCount[playerID] * picker.raiseCost
				if playerGold[playerID] >= cost then
					playerGold[playerID] = playerGold[playerID] - cost
					drawedCount[playerID] = drawedCount[playerID] + 1
					local attrVal = math.RandomInt(attrT.minVal, attrT.maxVal)
					local pro = math.RandomInt(1, 100)
					local tip = ""
					if pro <= picker.threeTimesPro then
						attrVal = attrVal * 3
						tip = "<三倍效果>"
					elseif pro <= picker.twoTimesPro then
						attrVal = attrVal * 2
						tip = "<双倍效果>"
					end
					if attrT.name:sub(-1) == "%" then
						code.AddMessage(playerID, tip .. "获得属性: " .. attrT.name:sub(-1) .. " +|cfaffff00" .. attrVal .. "%")
					else
						code.AddMessage(playerID, tip .. "获得属性: " .. attrT.name .. " +|cfaffff00" .. attrVal)
					end
					attrStm:SetObjAttrEx_Str(jass.udg_Hero[playerID], attrT.name, 0, attrVal)
					if drawedCount[playerID] == picker.drawLimitCount then
						EnterStage2(playerID)
					end
				else
					code.AddMessage(playerID, "|cfff43232金币不足!!!")
					break
				end
			else
				EnterStage2(playerID)
				code.AddMessage(playerID, "|cfff43232已达到抽取上限!!!")
				break
			end
		end
		local skill = myFunc:ID2Int("A01H")
		local tip = "|cffB4C4E2消耗：金币 |cffFF6E21" .. picker.originCost + drawedCount[playerID] * picker.raiseCost .. "|r|n"
		tip = tip .. "|cffB4C4E2随机抽取属性，概率获得双倍或三倍属性|n"
		tip = tip .. "抽取次数：|cffFF6E21(" .. drawedCount[playerID] .. " / " .. picker.drawLimitCount .. ")|n|n"
		tip = tip .. "|cff696E6E自动十连"
		if common:IsLocalPlayer(common.Player[playerID]) then
			common:SetSkillDataStr(goldNpc[playerID], skill, 218, tip)
		end
	elseif ID >= 11 then
		picker:Lottery(playerID, ID - 10)
	end
end

local skill = myFunc:ID2Int("A01H")
local tip = "|cffB4C4E2消耗：金币 |cffFF6E21" .. picker.originCost .. "|r|n"
tip = tip .. "|cffB4C4E2随机抽取属性，概率获得双倍或三倍属性|n"
tip = tip .. "抽取次数：|cffFF6E21(" .. "0 / " .. picker.drawLimitCount .. ")|n|n"
tip = tip .. "|cff696E6E自动十连"
common:SetSkillDataStr(goldNpc[1], skill, 218, tip)

return GoldStudy
