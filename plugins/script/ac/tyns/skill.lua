local jass    = Jass
local code    = require "jass.code"
local message = require 'jass.message'
local slk     = require 'jass.slk'
local ns      = ns

--过滤类型

--获取技能位置上的东西[1-12]
function ns.Getskill(id)
	local i = 0
	local date1, date2
	local obj
	for y = 0, 2 do
		for x = 0, 3 do
			i = i + 1
			if id == i then
				date1, date2 = message.button(x, y)
				if date1 then
					date1 = jass.S2I(date1)
					if date1 == 1095263602 or 1098081641 or 1097954661 then
						obj = date2
					else
						obj = date1
					end
					break
				end
			end
		end
	end
	obj = date1
	return obj
end

--判断类型
function ns.gettype(id)
	local typename = ""
	if slk.ability[id] then
		typename = [[ability]]
	end
	if slk.unit[id] then
		typename = [[unit]]
	end
	if slk.item[id] then
		typename = [[item]]
	end
	if slk.upgrade[id] then
		typename = [[upgrade]]
	end
	return typename
end

--返回对应的项目
function ns.getslk(id)
	local objtable = ""
	if slk.ability[id] then
		objtable = slk.ability[id]
	end
	if slk.unit[id] then
		objtable = slk.unit[id]
	end
	if slk.item[id] then
		objtable = slk.item[id]
	end
	if slk.upgrade[id] then
		objtable = slk.upgrade[id]
	end
	return objtable
end

--获取技能位置上的需求科技[表]返回格式:[1][2]...[N]
function ns.Needupgrade(id)
	local upgrade = {}
	local objtable = ns.getslk(id)
	local text = objtable["Requires"]
	if text then
		upgrade = ac.string(text, ",")
	end
	return upgrade
end

--获取技能位置上的需求数量[表]返回格式:[1][2]...[N]
function ns.Needupgrade2(id)
	local upgrade = {}
	local objtable = ns.getslk(id)
	local text = objtable["Requiresamount"]
	if text then
		upgrade = ac.string(text, ",")
		for i = 1, 10 do
			upgrade[i] = tonumber(upgrade[i])
		end
	else
		--预留10个1级,防止报错
		for i = 1, 10 do
			upgrade[i] = 1
		end
	end
	return upgrade
end

--返还需求名字
function ns.Getneedname(id)
	local need = ns.Needupgrade(id)
	local playerID = GetLocalPlayerID()
	local text
	for i = 1, #need do
		local name = ns.id2i(need[i])
		local obj = ns.getslk(name)
		if CountLivingPlayerUnitsOfTypeId(name, jass.Player(playerID - 1)) >= 1 then
			text = (not text) and ("|cff00fc11★ " .. obj["tip"] .. "|r") or (text .. "|n|cff00fc11★ " .. obj["tip"] .. "|r")
		else
			text = (not text) and ("|cffebfc00★ " .. obj["tip"] .. "|r") or (text .. "|n|cffebfc00★ " .. obj["tip"] .. "|r")
		end
	end
	return text or ""
end

--默认颜色
local needcolor = "|cffc0c0c0"
local havecolor = "|cffffcc00"
--分割符号
local needstring = "- "
--后缀,需要自己添加在文本后面
local neednumb = " *"
local needicon = " √"

--返还需求完整文字和颜色
function ns.upgradestring(id)
	local text = ""
	local need = ns.Needupgrade(id)
	local numb = ns.Needupgrade2(id)
	local play = GetLocalPlayerID()

	for i = 1, #need do
		local name = ns.id2i(need[i])
		local ty = ns.gettype(name)
		local losticon = "" --后缀,自己看着加
		if ty == "unit" then
			if GetPlayerTechCountSimple(name, jass.Player(play - 1)) >= numb[i] then
				text = text .. havecolor .. needstring .. ns.Getneedname(name) .. losticon
			else
				text = text .. needcolor .. needstring .. ns.Getneedname(name) .. losticon
			end
		end
		if ty == "upgrade" then
			if CountLivingPlayerUnitsOfTypeId(name, jass.Player(play - 1)) >= numb[i] then
				text = text .. havecolor .. needstring .. ns.Getneedname(name) .. losticon
			else
				text = text .. needcolor .. needstring .. ns.Getneedname(name) .. losticon
			end
		end
		if i ~= #need then
			text = text .. "|n"
		end
	end

	return text
end

--获取当前技能面板的X,Y位置的技能id
function code.GetAbilityXY(id)
	return ns.Getskill(id)
end

--test()
--message.button(0, 0)
--第一个参数是对象 第二个参数是类型


--英雄:1095263602
--Asei:1098081641(物品)
--单位:1097954661

--需求科技:Requires
--需求科技数值:Requiresamount


--print(ns.i2id(1097954661))
