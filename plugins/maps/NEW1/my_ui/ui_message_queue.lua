local table = table
local japi = require "jass.japi"
local code = require "jass.code"
local Module = require "my_base.base_module_manager"
local common = Module.Common
local myFunc = Module.MyFunc

local CONFIG = {
	-- UI 尺寸和位置
	MESSAGE_WIDTH = 400,
	MESSAGE_HEIGHT = 30,
	VIEWPORT_X = 10,
	VIEWPORT_Y = 100,
	MESSAGE_GAP = 5, -- 消息之间的垂直间距

	-- 队列行为
	MAX_VISIBLE_MESSAGES = 10, -- 屏幕上最多同时显示的消息数量
	UI_POOL_SIZE = 15,      -- 预先创建的UI元素总数 (必须 >= MAX_VISIBLE_MESSAGES)
	MESSAGE_LIFETIME = 3.0, -- 消息显示时长（秒）

	-- 动画参数
	ANIM_MOVE_DURATION = 0.16, -- 消息进入和上移动画的时长
	ANIM_REMOVE_DURATION = 0.20, -- 消息移除动画的时长
	ANIM_ENTRY_OFFSET_X = 200, -- 消息从右侧进入时的偏移量
	CASCADE_DELAY = 0.1,      -- 快速填充模式下的消息间隔（秒）

	FONT_FILE = [[fonts\LXWK_Bold.ttf]],
	FONT_SIZE = 18,
	TEXT_MARGIN_LEFT = 10,
	BACKGROUND_IMAGE = [[Survival\UI\Message\background.tga]],
}

CONFIG.VIEWPORT_HEIGHT = (CONFIG.MESSAGE_HEIGHT + CONFIG.MESSAGE_GAP) * CONFIG.MAX_VISIBLE_MESSAGES - CONFIG.MESSAGE_GAP

---@class Message
local Message = {}
Message.__index = Message

function Message:new(viewport, index)
	---@class Message
	local obj = setmetatable({}, Message)
	obj.index = index

	obj.bg = viewport:builder "image" {
		w = CONFIG.MESSAGE_WIDTH, h = CONFIG.MESSAGE_HEIGHT,
		xy = { "左侧", viewport, "左侧", CONFIG.ANIM_ENTRY_OFFSET_X, (CONFIG.MESSAGE_HEIGHT - CONFIG.VIEWPORT_HEIGHT) / 2 },
		image = CONFIG.BACKGROUND_IMAGE,
		show = false
	}
	obj.text = gameui:builder "text" {
		w = CONFIG.MESSAGE_WIDTH * 2, h = 0,
		xy = { "左侧", obj.bg, "左侧", CONFIG.TEXT_MARGIN_LEFT, 0 },
		font = { CONFIG.FONT_FILE, CONFIG.FONT_SIZE, align = "左" },
		show = false
	}
	obj.lifetime = 0
	obj.isActive = false
	obj.message = ""
	return obj
end

---@param content string
---@param targetY number
function Message:show(content, targetY)
	self.isActive = true
	self.lifetime = CONFIG.MESSAGE_LIFETIME

	self.text:set_text(content)
	self.bg:set_show(true)
	self.text:set_show(true)
	self.bg:set_alpha(1)
	self.text:set_alpha(1)

	myFunc:FadePosition({
		UI = self.bg,
		fUI = self.bg:get_parent(),
		time = CONFIG.ANIM_MOVE_DURATION,
		ty = "二元出",
		startP = { CONFIG.ANIM_ENTRY_OFFSET_X, targetY },
		endP = { 0, targetY },
		anchor = { "左侧", "左侧" },
	})
end

--- 平滑移动到新的Y轴位置
---@param targetY number
function Message:animateToY(targetY)
	local currentX, currentY = self.bg:get_xy()
	if currentY == targetY then return end

	myFunc:FadePosition({
		UI = self.bg,
		fUI = self.bg:get_parent(),
		time = CONFIG.ANIM_MOVE_DURATION,
		ty = "二元出",
		startP = { 0, currentY },
		endP = { 0, targetY },
		anchor = { "左侧", "左侧" },
	})
end

function Message:hideAndReset()
	self.isActive = false
	self.lifetime = 0

	myFunc:FadeAlpha({ UI = self.bg, time = CONFIG.ANIM_REMOVE_DURATION, show = false, ty = "二元入" })
	myFunc:FadeAlpha({
		UI = self.text,
		time = CONFIG.ANIM_REMOVE_DURATION,
		show = false,
		ty = "二元入",
		complete = function()
			self.bg:set_show(false)
			self.text:set_show(false)
			self.bg:set_alpha(1)
			self.text:set_alpha(1)
		end
	})
end

--- 每帧更新
function Message:update(deltaTime)
	if not self.isActive then return end

	self.lifetime = self.lifetime - deltaTime
	if self.lifetime <= 0 then
		self.isActive = false -- 标记为非活动，等待管理器回收
	end
end

local MessageQueueManager = {}

function MessageQueueManager:initialize()
	self.viewport = nil
	---@type table<integer, Message>
	self.messagePool = {} -- UI对象池
	---@type table<integer, Message>
	self.activeMessages = {} -- 当前显示的消息队列
	self.messageCache = {} -- 待显示的消息文本缓存
	self.cooldown = 0

	ac.time(0.01, 1, function() self:_createUI() end)
	ac.time(0.02, function() self:_update(0.02) end)
end

function MessageQueueManager:_createUI()
	self.viewport = gameui:builder "panel" {
		w = CONFIG.MESSAGE_WIDTH, h = CONFIG.VIEWPORT_HEIGHT,
		xy = { "左侧", gameui, "左侧", CONFIG.VIEWPORT_X, CONFIG.VIEWPORT_Y },
		show = true
	}
	japi.FrameSetViewPort(self.viewport.handle, true)

	for i = 1, CONFIG.UI_POOL_SIZE do
		self.messagePool[i] = Message:new(self.viewport, i)
	end
end

function MessageQueueManager:addMessage(playerID, text)
	if common:IsLocalPlayer(common.Player[playerID]) then
		table.insert(self.messageCache, text)
	end
end

function MessageQueueManager:_update(deltaTime)
	for playerID = 1, 4, 1 do
		if common:IsLocalPlayer(common.Player[playerID]) then
			for _, msgObj in ipairs(self.activeMessages) do
				msgObj:update(deltaTime)
			end

			for i = #self.activeMessages, 1, -1 do
				local msgObj = self.activeMessages[i]
				if not msgObj.isActive then
					msgObj:hideAndReset()
					table.remove(self.activeMessages, i)
					table.insert(self.messagePool, msgObj)
				end
			end
			if self.cooldown > 0 then
				self.cooldown = self.cooldown - deltaTime
			end

			if self.cooldown <= 0 and #self.messageCache > 0 then
				self:_showNewMessage(table.remove(self.messageCache, 1))

				if #self.activeMessages >= CONFIG.MAX_VISIBLE_MESSAGES then
					self.cooldown = CONFIG.ANIM_MOVE_DURATION
				else
					self.cooldown = CONFIG.CASCADE_DELAY
				end
			end
		end
	end
end

function MessageQueueManager:_showNewMessage(content)
	if #self.messagePool == 0 then return end

	if #self.activeMessages >= CONFIG.MAX_VISIBLE_MESSAGES then
		local oldestMsg = table.remove(self.activeMessages, 1)
		oldestMsg:hideAndReset()
		table.insert(self.messagePool, oldestMsg)
	end

	local newMessage = table.remove(self.messagePool, 1)
	newMessage.message = content
	table.insert(self.activeMessages, newMessage)

	self:_repositionActiveMessages(newMessage)
end

---@param newlyAddedMessage Message | nil
function MessageQueueManager:_repositionActiveMessages(newlyAddedMessage)
	for i, msgObj in ipairs(self.activeMessages) do
		local slotIndex = #self.activeMessages - i
		local targetY = (CONFIG.MESSAGE_HEIGHT - CONFIG.VIEWPORT_HEIGHT) / 2 + slotIndex * (CONFIG.MESSAGE_HEIGHT + CONFIG.MESSAGE_GAP)

		if newlyAddedMessage and msgObj == newlyAddedMessage then
			msgObj:show(msgObj.message, targetY)
		else
			msgObj:animateToY(targetY)
		end
	end
end

local MyMessageQueue = MessageQueueManager
MyMessageQueue:initialize()

code.AddMessage = function(playerID, message)
	MyMessageQueue:addMessage(playerID, message)
end
