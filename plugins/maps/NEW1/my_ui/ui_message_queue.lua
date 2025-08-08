local code = require "jass.code"
local jass = require "jass.common"
local japi = require "jass.japi"
local player = player

local Module = require "my_base.base_module_manager"
local common = Module.Common
local myFunc = Module.MyFunc

-- #region 类型一

--- 类型一: 消息UI
local MessageUI_Type1 = {}
--- 类型一: 消息UI队列
local MessageQueue_Type1 = {}
--- 类型一: 消息总数量
local count_Type1 = 10
--- 类型一: UI总数量
local uiCountType1 = 15
--- 类型一: 当前展示的消息数量
local currentCount_Type1 = 0
--- 类型一: 消息动作CD
local messageCD_Type1 = 0
--- 类型一: 消息UI背景
MessageUI_Type1["背景"] = {}
--- 类型一: 消息UI文本
MessageUI_Type1["消息"] = {}
--- 类型一: 消息缓存队列
local MessageCache_Type1 = {}

--- 类型一: 消息的宽高
local w1, h1 = 400, 30
--- 类型一: 视口的位置
local x1, y1 = 10, 100
--- 初始y轴
local positionY = (h1 + 5) * (count_Type1) - 5
--- 类型一: 进入的时候挪动的距离
local dis1 = 200
--- 类型一: 淡出时间
local deadline1 = 3
--- 类型一:  字体大小
local fontSize1 = 18
--- 类型一: 消息文本和背景左侧的间距
local TextBGDis1 = 10

-- #endregion


--- 消息队列UI初始化
local function MessageQueueFunc()
	MessageUI_Type1["视口"] = gameui:builder "panel" { w = w1, h = positionY, xy = { "左侧", gameui, "左侧", x1, y1 }, show = true }
	japi.FrameSetViewPort(MessageUI_Type1["视口"].handle, true)
	MessageUI_Type1.index = 0
	for i = 1, uiCountType1 do
		MessageUI_Type1["背景"][i] = MessageUI_Type1['视口']:builder "image" { w = w1, h = h1, xy = { "左侧", MessageUI_Type1["视口"], "左侧", dis1,
			(h1 - positionY) / 2 }, image = [[Survival\UI\Message\background.tga]], show = false, alpha = 1 }
		MessageUI_Type1["消息"][i] = gameui:builder "text" { w = w1 * 2, h = 0, xy = { "左侧", MessageUI_Type1["背景"][i], "左侧", TextBGDis1, 0 },
			font = { [[fonts\LXWK_Bold.ttf]], fontSize1, align = "左" }, show = false }
		MessageUI_Type1["消息"][i]:set_text("测试消息测试消息 -- " .. i)
		MessageUI_Type1["背景"][i].deadline = 0
		MessageUI_Type1["背景"][i].index = i
		MessageQueue_Type1[i] = MessageUI_Type1["背景"][i]
	end
end


---移除消息 (类型一和二)
local function RemoveMessage()
	local index = uiCountType1 - currentCount_Type1 + 1
	currentCount_Type1 = currentCount_Type1 - 1
	local ui = MessageQueue_Type1[index]
	myFunc:FadeSize({
		UI = ui,
		time = 0.1,
		startP = { w1, h1 },
		endP = { w1 * 1.2, h1 * 1.2 },
		ty = "二元入",
		complete = function()
			myFunc:FadeSize({
				UI = ui,
				time = 0.15,
				startP = { w1 * 1.2, h1 * 1.2 },
				endP = { w1 * 0.8, h1 * 0.8 },
				ty = "二元入",
				complete = function()
					ui:set_show(false)
					ui:set_alpha(1)
					ui:set_wh(w1, h1)
				end
			})
		end
	})
	myFunc:FadeAlpha({
		UI = ui,
		time = 0.25,
		show = false,
		ty = "二元入",
	})
	local textUI = MessageUI_Type1["消息"][ui.index]
	myFunc:FadeAlpha({
		UI = textUI,
		time = 0.25,
		show = false,
		ty = "二元入",
		complete = function()
			textUI:set_show(false)
			textUI:set_alpha(1)
		end
	})
end


---显示消息
---@param message string 消息文本
local function ShowMessage(message, t)
	messageCD_Type1 = t + 0.04
	local index = MessageQueue_Type1[1].index
	for i = uiCountType1 - currentCount_Type1 + 1, uiCountType1 do
		local ui = MessageQueue_Type1[i]
		if currentCount_Type1 == count_Type1 and i == uiCountType1 - currentCount_Type1 + 1 then
			-- 结束的时候隐藏
			local textUI = MessageUI_Type1["消息"][ui.index]
			myFunc:FadeAlpha({
				UI       = textUI,
				time     = t,
				show     = false,
				ty       = "二元入",
				complete = function()
					textUI:set_show(false)
					textUI:set_alpha(1)
				end
			})
		end
		if ui then
			local _, y = ui:get_xy()
			myFunc:FadePosition({
				UI = ui,
				fUI = MessageUI_Type1["视口"],
				time = t,
				ty = "二元出",
				startP = { 0, y },
				endP = { 0, y + h1 + 5 },
				anchor = { "左侧", "左侧" },
			})
		end
	end
	local ui = MessageQueue_Type1[1]
	ui.deadline = deadline1
	ui:set_show(true)
	MessageUI_Type1["消息"][index]:set_text(message)
	MessageUI_Type1["消息"][index]:set_show(true)
	table.insert(MessageQueue_Type1, table.remove(MessageQueue_Type1, 1))
	myFunc:FadePosition({
		UI = ui,
		fUI = MessageUI_Type1["视口"],
		time = t,
		ty = "二元出",
		startP = { dis1, (h1 - positionY) / 2 },
		endP = { 0, (h1 - positionY) / 2 },
		anchor = { "左侧", "左侧" },
		-- print(11 % 10)
	})
	ui:set_alpha(1)
end




---添加消息
---@param playerID integer 玩家ID
---@param message string 消息字符串
function code.AddMessage(playerID, message)
	if common:IsLocalPlayer(common.Player[playerID]) then
		-- if player[playerID]:IsLocalPlayer() then
		if messageCD_Type1 <= 0 and #MessageCache_Type1 == 0 then
			if currentCount_Type1 < count_Type1 then
				currentCount_Type1 = currentCount_Type1 + 1
			end
			-- print("ShowMessage")
			ShowMessage(message, 0.16)
		else
			-- print("进入缓存队列")
			table.insert(MessageCache_Type1, message)
		end
	end
end

ac.time(0.01, 1, MessageQueueFunc)


ac.time(0.02, function()
	for i = 1, 4 do
		if player[i]:IsLocalPlayer() then
			-- print("messageCD_Type1", messageCD_Type1, messageCD_Type1 > 0)
			if messageCD_Type1 > 0 then
				messageCD_Type1 = messageCD_Type1 - 0.02
				if #MessageCache_Type1 > 0 and messageCD_Type1 <= 0 then
					if currentCount_Type1 < count_Type1 then
						currentCount_Type1 = currentCount_Type1 + 1
					end
					ShowMessage(table.remove(MessageCache_Type1, 1), 0.16)
				end
			end
			for j = uiCountType1 - currentCount_Type1 + 1, uiCountType1 do
				-- print(j)
				local ui = MessageQueue_Type1[j]
				if ui.deadline > 0 and ui:is_show() then
					ui.deadline = ui.deadline - 0.02
					if ui.deadline <= 0 then
						RemoveMessage()
					end
				end
			end
		end
	end
end)
