--require 'ui.message_Refresh'
local jass = Jass
local code = require "jass.code"

local japi = require 'jass.japi'
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
local atkAttr = { ["攻击攻击"] = "攻击", ["攻击力量"] = "力量", ["攻击敏捷"] = "敏捷", ["攻击智力"] = "智力", ["攻击生命"] = "生命", ["攻击物理固伤"] = "物理固伤", ["攻击法术固伤"] = "法术固伤", }
local atkedAttr = { ["被攻击攻击"] = "攻击", ["被攻击力量"] = "力量", ["被攻击敏捷"] = "敏捷", ["被攻击智力"] = "智力", ["被攻击生命"] = "生命", ["被攻击物理固伤"] = "物理固伤", ["被攻击法术固伤"] = "法术固伤", }
local lvUpAttr = { ["升级攻击攻击"] = "攻击", ["升级攻击力量"] = "力量", ["升级攻击敏捷"] = "敏捷", ["升级攻击智力"] = "智力", ["升级攻击生命"] = "生命", ["升级攻击物理固伤"] = "物理固伤", ["升级攻击法术固伤"] = "法术固伤", }

for playerID, value in ipairs(jass.udg_Player) do
	BaseModule.Event:PlayerChat(playerID, function(pID, message)
		local welfareData = archive:LoadStr(pID, "welfare")
		if message == "gzhlb" then
			code.AddMessage(pID, "已激活公众号礼包!")
			welfareData = myFunc:ReplaceCharAt(welfareData, 5, "b")
			archive:SaveStr(pID, "welfare", welfareData)
			return
		end
		if message == "kkhlb" then
			code.AddMessage(pID, "已激活KK号礼包!")
			welfareData = myFunc:ReplaceCharAt(welfareData, 6, "b")
			archive:SaveStr(pID, "welfare", welfareData)
			return
		end
		if message == "rqlb" then
			code.AddMessage(pID, "已激活入群礼包!")
			welfareData = myFunc:ReplaceCharAt(welfareData, 7, "b")
			archive:SaveStr(pID, "welfare", welfareData)
			return
		end
	end)
	BaseModule.Event:On("HeroAtk", playerID, function(_, pID, hero)
		for valAttr, addedAttr in pairs(atkAttr) do
			BaseModule.AttrSystem:SetObjAttrEx_Str(hero, addedAttr, 0, BaseModule.AttrSystem:GetObjAttrFromStr(hero, valAttr))
		end
	end)
	BaseModule.Event:On("HeroAtked", playerID, function(_, pID, atker, hero)
		for valAttr, addedAttr in pairs(atkedAttr) do
			BaseModule.AttrSystem:SetObjAttrEx_Str(hero, addedAttr, 0, BaseModule.AttrSystem:GetObjAttrFromStr(hero, valAttr))
		end
	end)
	BaseModule.Event:On("HeroLvUp", playerID, function(_, pID, hero)
		for valAttr, addedAttr in pairs(lvUpAttr) do
			BaseModule.AttrSystem:SetObjAttrEx_Str(hero, addedAttr, 0, BaseModule.AttrSystem:GetObjAttrFromStr(hero, valAttr))
		end
	end)
end
local UIModule = require "my_ui.ui_module_manager"
UIModule.BossComing:Init()
BaseModule.DamageSystem():Init(UIModule.BossBlood)

UIModule.Card:Init()
UIModule.Swallow:Init()
UIModule.Challenge:Init()
UIModule.Treasure:Init()

UIModule.ArchiveUI:Init()
UIModule.TalentTreeUI:Init()
UIModule.HeroExpUI:Init()
UIModule.TreasureHunt:Init()
UIModule.ActivityUI:Init()
UIModule.QrqdUI:Init()
UIModule.Settings:Init()
UIModule.Decorate:Init()


UIModule.ModeSelect:Init()
