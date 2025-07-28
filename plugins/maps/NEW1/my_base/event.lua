local jass = require "jass.common"
local dzapi = require "jass.dzapi"
local code = require "jass.code"
local japi = require "jass.japi"
local debug = require "jass.debug"

local Event = {}

---@param common Common
function Event:Init(common)
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
		if not keyboard[keyStr] then
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
		local message = jass.GetEventPlayerChatString()
		local playerID = common:ConvertPlayerToID(player)
		if chatEvents[playerID] then
			for _, callback in ipairs(chatEvents[playerID]) do
				callback(playerID, message)
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
