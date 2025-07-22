local code = require "jass.code"
local jass = require "jass.common"

local Module = require "my_base.base_module_manager"
local common = Module.Common
local excel = excel
local MagicalPower = {}
local players = jass.udg_Player
local htMagicalPower = jass.udg_HTMagicalPower
local mpMaxExtractCount = jass.udg_MpMaxExtractCount
local mpCurrentExtractCount = jass.udg_MpCurrentExtractCount

-- 玩家神通id
local _mpID = {}
for playerID, _ in ipairs(players) do
	_mpID[playerID] = {}
	for i = 1, #excel["神通"] do
		_mpID[playerID][i] = i
	end
end


function code.ExtractMP(playerID, ty, lv)
	local index = common:GetRandomInt(1, #_mpID[playerID])
	local newID = table.remove(_mpID[playerID], index)
	local oldID = common:LoadInteger(htMagicalPower, playerID, ty + 50)
	-- 移除旧神通
	if oldID > 0 then
		common:SaveInteger(htMagicalPower, playerID, oldID, 0)
		table.insert(_mpID[playerID], oldID)
	end
	-- 添加新神通
	common:SaveInteger(htMagicalPower, playerID, newID, lv)
	return newID
end

function code.SetExtractMpTip(playerID, ty, lv)
	local extractCountIndex = ty * lv + 6 * (playerID - 1)
	local tip = "消耗：金币|cfaffff00" .. excel["其它"][8 + lv]["Value1"] + (mpCurrentExtractCount[extractCountIndex] or 0) * excel["其它"][8 + lv]["Value2"] .. "|r"
	if lv == 1 then
		tip = tip .. "|n|n抽取一个C级神通"
	end
	if lv == 2 then
		tip = tip .. "|n|n抽取一个B级神通"
	end
	if lv == 3 then
		tip = tip .. "|n|n抽取一个A级神通"
	end
	tip = tip .. "|n|n抽取次数：(" .. (mpCurrentExtractCount[extractCountIndex] or 0) .. "/" .. mpMaxExtractCount[playerID] .. ")"
	if (mpCurrentExtractCount[extractCountIndex] or 0) == mpMaxExtractCount[playerID] then
		tip = "|cfff43232已达到抽取上限!!!"
	end
	return tip
end

return MagicalPower
