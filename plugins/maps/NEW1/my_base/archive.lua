local japi = Japi
local code = require "jass.code"

local Archive = {}

Archive.data = { {}, {}, {}, {} }
Archive.archiveChanged = { false, false, false, false }

--- 保存字符串到本地
---@param playerID integer
---@param key string
---@param value string
function Archive:SaveStr(playerID, key, value)
	self.data[playerID][key] = value
	self.archiveChanged[playerID] = true
	code.DzAPI_Map_StoreString(self.handle, key, value)
end

--- 保存整数到本地
---@param playerID integer
---@param key string
---@param value integer
function Archive:SaveInt(playerID, key, value)
	self.data[playerID][key] = value
	self.archiveChanged[playerID] = true
	-- print("修改" .. key)
	-- code.DzAPI_Map_StoreInteger(self.handle, key, value)
end

--- 从本地读取字符串(未读取到返回 "" )
---@param playerID integer
---@param key string
---@return string
function Archive:LoadStr(playerID, key)
	return self.data[playerID][key]
	-- return code.DzAPI_Map_GetStoredString(self.handle, key)
end

--- 从本地读取整数(未读取到返回 0 )
---@param playerID integer
---@param key string
---@return integer
function Archive:LoadInt(playerID, key)
	return self.data[playerID][key]
	-- return code.DzAPI_Map_GetStoredInteger(self.handle, key)
end

--- 保存字符串到服务器
---@param player Player
---@param key string
---@param value string
function Archive:SaveStrToServer(player, key, value)
	code.DzAPI_Map_StoreString(player, key, value)
end

--- 保存整数到服务器
---@param player Player
---@param key string
---@param value integer
function Archive:SaveIntToServer(player, key, value)
	code.DzAPI_Map_StoreInteger(player, key, value)
end

--- 从服务器读取字符串(未读取到返回 "" )
---@param player Player
---@param key string
---@return string
function Archive:LoadStrFromServer(player, key)
	return code.DzAPI_Map_GetStoredString(player, key)
end

--- 从服务器读取整数(未读取到返回 0 )
---@param player Player
---@param key string
---@return integer
function Archive:LoadIntFromServer(player, key)
	return code.DzAPI_Map_GetStoredInteger(player, key)
end

---加载服务器数据
---@param player Player
---@param key string
---@return string
function Archive:LoadServerData(player, key)
	return japi.DzAPI_Map_GetServerValue(player, key)
end

---获取玩家地图等级
---@param player Player
---@return integer
function Archive:GetMapLv(player)
	return japi.RequestExtraIntegerData(3, player, nil, nil, false, 0, 0, 0)
end

---获取服务器存档剩余余额(无需在前面加上 I )
---@param player  Player
---@param key string
---@return integer
function Archive:GetValueLimit(player, key)
	return japi.RequestExtraIntegerData(82, player, "I" .. key, nil, false, 0, 0, 0)
end

---玩家是否有地图商城道具(已过期的时效性道具、剩余数量为0的数量型道具均视为无效)
---@param player Player
---@param key string itemKey
---@return boolean -- 拥有则返回true
function Archive:HasMallItem(player, key)
	return japi.DzAPI_Map_HasMallItem(player, key)
end

---获取玩家背包中指定道具的剩余数量
---@param player Player
---@param key string itemKey
---@return integer -- 剩余数量
function Archive:GetMallItemCount(player, key)
	return japi.RequestExtraIntegerData(41, player, key, nil, false, 0, 0, 0)
end

---玩家是否收藏地图
---@param player Player
---@return boolean
function Archive:IsCollectMap(player)
	return japi.RequestExtraBooleanData(53, player, nil, nil, false, 16, 0, 0)
end

---玩家在地图社区的互动数据
---@param player Player
---@param ty integer 互动类型(1=精华贴数量,4=发帖数量,6=主题数量)
---@return integer -- 对应数据项的统计数量
function Archive:GetMapInteraction(player, ty)
	return japi.RequestExtraIntegerData(65, player, nil, nil, false, ty, 0, 0)
end

---地图配置参数(全服数据)
---@param key string
---@return string|integer
function Archive:GetMapArgs(key)
	local val = japi.RequestExtraStringData(21, nil, key, nil, false, 0, 0, 0)
	if val == "" then
		val = "0"
	end
	local result = tonumber(val)
	if result then
		return result
	else
		return val
	end
end

---上传埋点数据
---@param player Player
---@param eventKey string
---@param value integer
function Archive:MapStatistics(player, eventKey, value)
	japi.RequestExtraBooleanData(34, player, eventKey, "", false, value, 0, 0)
end

---获取玩家在kk对战平台的完成名称
---@param player Player
function Archive:GetPlayerUserName(player)
	return japi.RequestExtraStringData(81, player, nil, nil, false, 0, 0, 0)
end

-- 获取论坛数据（0=累计获得赞数，1=精华帖数量，2=发表回复次数，3=收到的欢乐数，4=是否发过贴子，5=是否版主，6=主题数量）
---@param player Player
---@return integer
function Archive:GetForumData(player)
	return japi.DzAPI_Map_GetForumData(player, 0)
end

return Archive
