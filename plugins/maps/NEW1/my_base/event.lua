local jass = Jass
local dzapi = require "jass.dzapi"
local code = require "jass.code"
local japi = require "jass.japi"
local debug = require "jass.debug"
local message = require "jass.message"
local table = table

local Event = {}

---@param common Common
function Event:Init(common)
	local _listeners = {}

	--- 订阅一个事件
	--- @param eventName string 事件名称
	--- @param playerID integer 玩家ID
	--- @param listener function 监听器函数
	function Event:On(eventName, playerID, listener)
		-- 参数校验
		if type(eventName) ~= "string" or type(listener) ~= "function" then
			error("Invalid arguments for Event:on. Expected (string, function)", 2)
		end

		-- 如果该事件还不存在，则为其创建一个新的表
		if not _listeners[eventName] then
			_listeners[eventName] = {}
		end
		if not _listeners[eventName][playerID] then
			_listeners[eventName][playerID] = {}
		end

		-- 将监听器添加到该事件的列表中
		table.insert(_listeners[eventName][playerID], listener)
	end

	--- 触发一个事件
	--- @param eventName string 事件名称
	--- @param playerID integer 玩家ID
	--- @param ... any 传递给监听器的可变参数
	function Event:Emit(eventName, playerID, ...)
		-- 检查是否存在该事件的监听器
		if _listeners[eventName] and _listeners[eventName][playerID] then
			-- 遍历并执行所有监听器
			for i = #_listeners[eventName][playerID], 1, -1 do
				_listeners[eventName][playerID][i](..., _listeners[eventName][playerID][i])
			end
		end
	end

	--- 取消订阅一个事件,  如果只提供了 eventName，则移除该事件的所有监听器
	--- @param eventName string 事件名称
	--- @param playerID integer 玩家ID
	--- @param listener function [可选] 要移除的特定监听器, 最后一个参数为监听器本身
	function Event:Off(eventName, playerID, listener)
		if not _listeners[eventName] then
			return -- 该事件没有任何监听器，直接返回
		end
		if not _listeners[eventName][playerID] then
			return -- 该事件没有任何监听器，直接返回
		end

		-- 如果没有指定特定的监听器，则移除该事件的所有监听器
		if not listener then
			_listeners[eventName][playerID] = nil
			return
		end

		-- 从后向前遍历，这样在移除元素时不会影响后续的遍历
		for i = #_listeners[eventName][playerID], 1, -1 do
			if _listeners[eventName][playerID][i] == listener then
				table.Remove2(_listeners[eventName][playerID], i)
			end
		end
	end

	--#region 触发英雄攻击事件
	function code.HeroAtk(attacker, target)
		local playerID = common:ConvertPlayerToID(common:GetOwningPlayer(attacker))
		Event:Emit("HeroAtk", playerID, attacker, target)
	end

	--#endregion


	-- 英雄被攻击
	function code.HeroAtked(attacker, target)
		local playerID = common:ConvertPlayerToID(common:GetOwningPlayer(target))
		Event:Emit("HeroAtked", playerID, attacker, target)
	end

	-- 英雄升级
	function code.HeroLvUp(hero)
		local playerID = common:ConvertPlayerToID(common:GetOwningPlayer(hero))
		Event:Emit("HeroLvUp", playerID, hero)
	end

	--#region 触发英雄击杀
	function code.HeroKill(killer, dead)
		local playerID = common:ConvertPlayerToID(common:GetOwningPlayer(killer))
		Event:Emit("HeroKill", playerID, killer, dead)
	end

	--#endregion


	--#region 按键事件
	local keyEvents = {}
	local keyboard = {}
	-- 0 ~ 9 映射 ( 右侧数字键盘 应该是 257 ~ 266 )
	for i = 48, 57, 1 do
		keyboard[tostring(i - 48)] = i
	end
	-- 字母 a ~ z 映射
	for i = 65, 90, 1 do
		keyboard[string.char(i)] = i
	end

	-- 按键按下事件
	local function onKeyDown()
		local keyCode = dzapi.DzGetTriggerKey()
		local playerId = common:ConvertPlayerToID(dzapi.DzGetTriggerKeyPlayer())
		if not japi.GetChatState() then
			if keyEvents[keyCode][1] then
				for _, callback in ipairs(keyEvents[keyCode][1]) do
					callback(playerId)
				end
			end
		end
	end


	-- 按键释放事件
	local function onKeyUp()
		local keyCode = dzapi.DzGetTriggerKey()
		local playerId = common:ConvertPlayerToID(dzapi.DzGetTriggerKeyPlayer())
		if keyEvents[keyCode][0] then
			for _, callback in ipairs(keyEvents[keyCode][0]) do
				callback(playerId)
			end
		end
	end



	---键盘事件
	---@param keyStr string
	---@param ty integer 1=点击, 0为释放
	---@param callback function
	function Event:OnKeyBoard(keyStr, ty, callback)
		keyStr = string.upper(keyStr)
		if not message.keyboard[keyStr] then
			print("该键位不存在", keyStr)
			return
		end
		if ty ~= 1 and ty ~= 0 then
			print("该事件类型不存在, 只能是1或0", ty)
			return
		end
		local key = keyboard[keyStr]
		if not keyEvents[key] then
			keyEvents[key] = {}
		end
		if not keyEvents[key][ty] then
			keyEvents[key][ty] = {}
			local trig = jass.CreateTrigger()
			debug.handle_ref(trig)
			code.DzTriggerRegisterKeyEventTrg(trig, ty, key)
			if ty == 1 then
				jass.TriggerAddAction(trig, onKeyDown)
			else
				jass.TriggerAddAction(trig, onKeyUp)
			end
		end
		table.insert(keyEvents[key][ty], callback)
	end

	--#endregion


	--#region 聊天事件
	local chatEvents = {}
	local function Chat()
		local player = jass.GetTriggerPlayer()
		local msg = jass.GetEventPlayerChatString()
		local playerID = common:ConvertPlayerToID(player)
		if chatEvents[playerID] then
			for _, callback in ipairs(chatEvents[playerID]) do
				callback(playerID, msg)
			end
		end
	end
	--- 玩家聊天事件
	---@param playerID integer
	---@param callback function
	function Event:PlayerChat(playerID, callback)
		local chatTrg = jass.CreateTrigger()
		debug.handle_ref(chatTrg)
		if not chatEvents[playerID] then
			chatEvents[playerID] = {}
			jass.TriggerRegisterPlayerChatEvent(chatTrg, common.Player[playerID], "", false)
			jass.TriggerAddAction(chatTrg, Chat)
		end
		table.insert(chatEvents[playerID], callback)
	end

	--#endregion
end

return Event
