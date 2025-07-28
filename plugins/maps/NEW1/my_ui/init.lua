--require 'ui.message_Refresh'
local jass  = require "jass.common"
local code  = require "jass.code"
local debug = require 'jass.debug'

local japi  = require 'jass.japi'
japi.DzUnlockBlpSizeLimit(true)
japi.UnlockFps(true)

require 'my_ui.tween'

require "my_ui.ui_message_queue"

require 'my_ui.屏幕-我的界面'
require "my_ui.函数-物品世界坐标"

require 'my_ui.UI-每帧绘制'
require 'my_ui.UI-模拟血条'

local BaseModule = require "my_base.base_module_manager"
local archive = BaseModule.Archive
local myFunc = BaseModule.MyFunc

for i = 1, 4 do
	BaseModule.Event:PlayerChat(i, function(playerID, message)
		local welfareData = archive:LoadStr(playerID, "welfare")
		if message == "gzhlb" then
			code.AddMessage(playerID, "已激活公众号礼包!")
			welfareData = myFunc:ReplaceCharAt(welfareData, 4, "b")
			archive:SaveStr(playerID, "welfare", welfareData)
			return
		end
		if message == "kkhlb" then
			code.AddMessage(playerID, "已激活KK号礼包!")
			welfareData = myFunc:ReplaceCharAt(welfareData, 5, "b")
			archive:SaveStr(playerID, "welfare", welfareData)
			return
		end
		if message == "rqlb" then
			code.AddMessage(playerID, "已激活入群礼包!")
			welfareData = myFunc:ReplaceCharAt(welfareData, 6, "b")
			archive:SaveStr(playerID, "welfare", welfareData)
			return
		end
	end)
end

local UIModule = require "my_ui.ui_module_manager"
UIModule.BossComing:Init()

UIModule.Card:Init()
UIModule.Swallow:Init()

-- UIModule.Challenge:Init()

UIModule.ArchiveUI:Init()
UIModule.TalentTreeUI:Init()
UIModule.HeroExpUI:Init()
UIModule.TreasureHunt:Init()
UIModule.ActivityUI:Init()
UIModule.QrqdUI:Init()
UIModule.Settings:Init()
UIModule.Decorate:Init()


UIModule.ModeSelect:Init()

-- 分为base_module 和 ui_module
