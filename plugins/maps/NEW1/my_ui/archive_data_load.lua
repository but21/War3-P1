local code           = require "jass.code"
local jass           = Jass
local debug          = require 'jass.debug'
local japi           = require "jass.japi"
local BaseModule     = require "my_base.base_module_manager"
local archive        = require "my_base.archive"
local common         = BaseModule.Common
local myFunc         = BaseModule.MyFunc
local players        = jass.udg_Player
local attrSystem     = BaseModule.AttrSystem

local UIModule       = require "my_ui.ui_module_manager"
local qrqdUI         = UIModule.QrqdUI
local decorate       = UIModule.Decorate
local settingsUI     = UIModule.Settings
local talentTree     = UIModule.TalentTreeUI
local talentTreeUI   = talentTree.ui
local heroExp        = UIModule.HeroExpUI
local heroExpUI      = heroExp.ui
local treasureHunt   = UIModule.TreasureHunt
local treasureHuntUI = UIModule.TreasureHunt.ui
local summerTime     = UIModule.ActivityUI.ui.summerTime
local archiveUI      = UIModule.ArchiveUI.ui
local excel          = BaseModule.Excel

local function ReportCheat(message)
	code.AddMessage(0, "|cffff0000本局游戏存在存档异常玩家, 游戏即将结束!")
	-- require "界面.LUI-BarrageSP".startBarrage("|cffff0000本局游戏存在存档异常玩家,游戏即将结束!", 10, "二元出入", '|cfff83636系统消息')
	-- face.Delay(3, GameEnd)
	print(message)
end


local strArchiveKey = { "winCount", "talentLv_1", "talentLv_2", "talentLv_3", "heroExpLv_1", "treasureHuntLv", "settings", "heroSkin", "welfare" }
local intArchiveKey = { "allWinCount", "allTalentP", "talentP", "heroExp", "allHeroExp", "treasureHuntP", "allTHP", "allSTP", "summerTimeP", "qrqd", "currentSkin" }

---@param playerID integer
local function LoadArchive(playerID)
	local allAttrStr = ""
	---@type Player
	local player = players[playerID]

	for _, archiveKey in ipairs(strArchiveKey) do
		archive:SaveStr(playerID, archiveKey, archive:LoadStrFromServer(common.Player[playerID], archiveKey))
	end
	for _, archiveKey in ipairs(intArchiveKey) do
		archive:SaveInt(playerID, archiveKey, archive:LoadIntFromServer(common.Player[playerID], archiveKey))
	end

	if archive:LoadStr(playerID, "welfare") == "" then
		archive:SaveStr(playerID, "welfare", string.rep("a", 25))
	end
	if archive:LoadStr(playerID, "winCount") == "" then
		archive:SaveStr(playerID, "winCount", string.rep(0, 10, "|"))
	end
	if archive:LoadStr(playerID, "talentLv_1") == "" then
		archive:SaveStr(playerID, "talentLv_1", string.rep(0, 9, "|"))
		archive:SaveStr(playerID, "talentLv_2", string.rep(0, 9, "|"))
		archive:SaveStr(playerID, "talentLv_3", string.rep(0, 9, "|"))
	end
	if archive:LoadStr(playerID, "heroExpLv_1") == "" then
		archive:SaveStr(playerID, "heroExpLv_1", string.rep(0, 20, "|"))
	end
	if archive:LoadStr(playerID, "treasureHuntLv") == "" then
		archive:SaveStr(playerID, "treasureHuntLv", string.rep(0, 16, "|"))
	end
	if archive:LoadStr(playerID, "settings") == "" then
		archive:SaveStr(playerID, "settings", string.rep("a", settingsUI.count))
		archive:SaveStr(playerID, "settings", myFunc:ReplaceCharAt(archive:LoadStr(playerID, "settings"), 2, "b"))
	end
	if archive:LoadStr(playerID, "heroSkin") == "" then
		archive:SaveStr(playerID, "heroSkin", string.rep("a", decorate.ui.heroSkin.count))
	end

	local welfareData = archive:LoadStr(playerID, "welfare")
	if #welfareData < archiveUI.welfare.count then
		welfareData = welfareData .. string.rep("a", archiveUI.welfare.count - #welfareData)
		archive:SaveStr(playerID, "welfare", welfareData)
	end
	if archive:HasMallItem(player, "JBLB") then
		welfareData = myFunc:ReplaceCharAt(welfareData, 1, "b")
	end
	if archive:HasMallItem(player, "SXLB") then
		welfareData = myFunc:ReplaceCharAt(welfareData, 2, "b")
	end
	if archive:HasMallItem(player, "YYLB") then
		welfareData = myFunc:ReplaceCharAt(welfareData, 3, "b")
	end
	if archive:IsCollectMap(player) then
		welfareData = myFunc:ReplaceCharAt(welfareData, 7, "b")
	end
	if archive:LoadServerData(player, "prebook2023") == "1" then
		welfareData = myFunc:ReplaceCharAt(welfareData, 8, "b")
	end
	if archive:LoadServerData(player, "maptest2020") == "1" then
		welfareData = myFunc:ReplaceCharAt(welfareData, 9, "b")
	end
	if archive:LoadServerData(player, "pretest2024") == "1" then
		welfareData = myFunc:ReplaceCharAt(welfareData, 10, "b")
	end
	local yyrs = tonumber(archive:GetMapArgs("YYRS")) or 0
	if yyrs >= 188 then
		welfareData = myFunc:ReplaceCharAt(welfareData, 12, "b")
	end
	if yyrs >= 588 then
		welfareData = myFunc:ReplaceCharAt(welfareData, 13, "b")
	end
	if yyrs >= 1888 then
		welfareData = myFunc:ReplaceCharAt(welfareData, 14, "b")
	end
	if yyrs >= 2888 then
		welfareData = myFunc:ReplaceCharAt(welfareData, 15, "b")
	end
	if yyrs >= 2888 then
		welfareData = myFunc:ReplaceCharAt(welfareData, 16, "b")
	end
	if archive:GetMapInteraction(player, 4) >= 1 then
		welfareData = myFunc:ReplaceCharAt(welfareData, 17, "b")
	end
	if archive:GetMapInteraction(player, 4) >= 5 then
		welfareData = myFunc:ReplaceCharAt(welfareData, 18, "b")
	end
	if archive:GetMapInteraction(player, 4) >= 10 then
		welfareData = myFunc:ReplaceCharAt(welfareData, 19, "b")
	end
	if archive:GetMapInteraction(player, 1) >= 1 then
		welfareData = myFunc:ReplaceCharAt(welfareData, 20, "b")
	end
	if archive:GetMapInteraction(player, 1) >= 2 then
		welfareData = myFunc:ReplaceCharAt(welfareData, 21, "b")
	end
	if archive:GetMapInteraction(player, 1) >= 3 then
		welfareData = myFunc:ReplaceCharAt(welfareData, 22, "b")
	end
	local name = archive:GetPlayerUserName(player)
	if excel["名单"][name] and excel["名单"][name]["Value1"] then
		welfareData = myFunc:ReplaceCharAt(welfareData, 23, "b")
	end
	if excel["名单"][name] and excel["名单"][name]["Value2"] then
		welfareData = myFunc:ReplaceCharAt(welfareData, 24, "b")
	end
	if excel["名单"][name] and excel["名单"][name]["Value3"] then
		welfareData = myFunc:ReplaceCharAt(welfareData, 25, "b")
	end
	archive:SaveStr(playerID, "welfare", welfareData)

	for index = 1, #welfareData, 1 do
		local id = archiveUI.welfare.firstIndex + index
		local state = welfareData:sub(index, index)
		if state == "b" then
			if common:IsLocalPlayer(players[playerID]) then
				archiveUI.welfare.shadowIcon[index]:set_show(false)
			end
			allAttrStr = allAttrStr .. "|n" .. excel["存档"][id]["Value1"]
		end
		if common:IsLocalPlayer(players[playerID]) then
			archiveUI.welfare.slots[index]:set_image(excel["存档"][id]["Icon"])
		end
	end

	local winCount = archive:LoadStr(playerID, "winCount")
	local sep = "|"
	local result = myFunc:Split(winCount, sep)
	if #result < 10 then
		winCount = winCount .. string.rep("|0", 10 - #result)
		result = myFunc:Split(winCount, sep)
		archive:SaveStr(playerID, "winCount", table.concat(result, sep))
	end
	for i = 1, archiveUI.winCount.count do
		local id = archiveUI.winCount.firstIndex + i
		local icon = excel["存档"][id]["Icon"]
		if i == 1 then
			if common:IsLocalPlayer(players[playerID]) then
				archiveUI.winCount.shadowIcon[i]:set_show(false)
				archiveUI.winCount.slots[i]:set_image(icon)
			end
		else
			local needCount = excel["存档"][id]["Value2"]
			local needDiff = excel["存档"][id]["Value3"]
			if result[needDiff] >= needCount then
				if common:IsLocalPlayer(players[playerID]) then
					archiveUI.winCount.shadowIcon[i]:set_show(false)
				end
				allAttrStr = allAttrStr .. "|n" .. excel["存档"][id]["Value1"]
			end

			if common:IsLocalPlayer(players[playerID]) then
				archiveUI.winCount.slots[i]:set_image(icon)
			end
		end
	end
	local allWinCount = 0
	for _, value in ipairs(result) do
		allWinCount = allWinCount + value
	end
	if allWinCount > archive:GetMapArgs("maxWC") then
		ReportCheat("通关次数异常")
	end


	for ty = 1, 3 do
		local talentLv = archive:LoadStr(playerID, "talentLv_" .. ty)
		sep = "|"
		result = myFunc:Split(talentLv, sep)
		for count = 1, 9 do
			local id = 200 + (ty - 1) * 30 + count
			talentTreeUI.talentLv[playerID].allLv = talentTreeUI.talentLv[playerID].allLv + result[count]
			talentTreeUI.talentLv[playerID][ty] = (talentTreeUI.talentLv[playerID][ty] or 0) + result[count]
			local icon = excel["存档"][id]["Icon"]
			if common:IsLocalPlayer(players[playerID]) then
				talentTreeUI.talentSlots[ty][count]:set_image(icon)
			end
			if result[count] > 0 then
				local attrStr = excel["存档"][id]["Value3"]
				for attrName, value in pairs(attrSystem:ParseAttributes2(attrStr)) do
					attrSystem:SetAttr(jass.udg_Hero[playerID], attrName, 0, value * result[count])
				end
				if common:IsLocalPlayer(players[playerID]) then
					talentTreeUI.talentSlotsShadow[ty][count]:set_show(false)
					talentTreeUI.talentSlotsLv[ty][count]:set_text(result[count])
					talentTreeUI.talentSlotsLvBg[ty][count]:set_show(true)
				end
			else
				local needLv = excel["存档"][id]["Value1"]
				if talentTreeUI.talentLv[playerID][ty] >= needLv then
					if common:IsLocalPlayer(players[playerID]) then
						talentTreeUI.talentSlotsIsCanUse[ty][count]:set_show(true)
					end
				end
			end
		end
		if common:IsLocalPlayer(players[playerID]) then
			talentTreeUI.talentTitle[ty]:set_text(talentTreeUI.talentTitle[ty]._text:sub(1, 6) .. "(" .. talentTreeUI.talentLv[playerID][ty] .. ")")
		end
	end
	if talentTree:CalcPRange(0, talentTreeUI.talentLv[playerID].allLv) + archive:LoadInt(playerID, "talentP") > archive:GetMapArgs("maxTP") then
		ReportCheat("天赋点数异常")
	end
	if common:IsLocalPlayer(players[playerID]) then
		talentTreeUI.points:set_text("天赋点: " .. archive:LoadInt(playerID, "talentP"))
	end

	local heroExpLv = archive:LoadStr(playerID, "heroExpLv_1")
	result = myFunc:Split(heroExpLv, "|")
	for index = 1, 20 do
		local id = 300 + index
		heroExpUI.allLv[playerID] = heroExpUI.allLv[playerID] + result[index]
		if heroExpUI.slots[index] then
			if common:IsLocalPlayer(players[playerID]) then
				heroExpUI.slots[index]:set_image(excel["存档"][id]["Icon"])
				heroExpUI.heroLv[index]:set_text(result[index])
			end
		else
			break
		end
	end
	if common:IsLocalPlayer(players[playerID]) then
		heroExpUI.points:set_text("熟练点: " .. archive:LoadInt(playerID, "heroExp"))
		heroExpUI.allLvRewardsText:set_text(myFunc:SetNumColor(excel["其它"][13]["Value1"], "|cfaffff00", "|r"))
		heroExpUI.allLvText:set_text("总熟练度等级: |cfaffff00" .. heroExpUI.allLv[playerID])
	end
	for attrName, value in pairs(attrSystem:ParseAttributes2(excel["其它"][13]["Value2"])) do
		attrSystem:SetAttr(jass.udg_Hero[playerID], attrName, 0, value * (heroExpUI.allLv[playerID] // 10))
	end
	for attrName, value in pairs(attrSystem:ParseAttributes2(excel["其它"][13]["Value3"])) do
		attrSystem:SetAttr(jass.udg_Hero[playerID], attrName, 0, value * (heroExpUI.allLv[playerID] // 20))
	end
	for attrName, value in pairs(attrSystem:ParseAttributes2(excel["其它"][13]["Value4"])) do
		attrSystem:SetAttr(jass.udg_Hero[playerID], attrName, 0, value * (heroExpUI.allLv[playerID] // 40))
	end
	if heroExp:CalcPRange(0, heroExpUI.allLv[playerID]) + archive:LoadInt(playerID, "heroExp") > archive:GetMapArgs("maxHE") then
		ReportCheat("英雄熟练点异常")
	end


	local treasureHuntLv = archive:LoadStr(playerID, "treasureHuntLv")
	result = myFunc:Split(treasureHuntLv, "|")
	for index = 1, 16 do
		local id = 400 + index
		treasureHuntUI.allLv[playerID] = treasureHuntUI.allLv[playerID] + result[index]
		if result[index] > 0 then
			local attrStr = excel["存档"][id]["Value2"]
			for attrName, value in pairs(attrSystem:ParseAttributes2(attrStr)) do
				attrSystem:SetAttr(jass.udg_Hero[playerID], attrName, 0, value * result[index])
			end
		end
		if common:IsLocalPlayer(players[playerID]) then
			treasureHuntUI.slots[index]:set_image(excel["存档"][id]["Icon"])
			treasureHuntUI.slotsLv[index]:set_text(result[index])
		end
	end
	for attrName, value in pairs(attrSystem:ParseAttributes2(excel["其它"][16]["Value2"])) do
		attrSystem:SetAttr(jass.udg_Hero[playerID], attrName, 0, value * (heroExpUI.allLv[playerID] // 10))
	end
	for attrName, value in pairs(attrSystem:ParseAttributes2(excel["其它"][16]["Value3"])) do
		attrSystem:SetAttr(jass.udg_Hero[playerID], attrName, 0, value * (heroExpUI.allLv[playerID] // 20))
	end
	for attrName, value in pairs(attrSystem:ParseAttributes2(excel["其它"][16]["Value4"])) do
		attrSystem:SetAttr(jass.udg_Hero[playerID], attrName, 0, value * (heroExpUI.allLv[playerID] // 40))
	end
	if common:IsLocalPlayer(players[playerID]) then
		treasureHuntUI.allLvText:set_text("寻宝总等级: |cfaffff00" .. treasureHuntUI.allLv[playerID])
		treasureHuntUI.points:set_text("寻宝点: " .. archive:LoadInt(playerID, "treasureHuntP"))
		treasureHuntUI.allLvRewardsText:set_text(myFunc:SetNumColor(excel["其它"][16]["Value1"], "|cfaffff00", "|r"))
	end
	if treasureHunt:CalcPRange(0, treasureHuntUI.allLv[playerID]) + archive:LoadInt(playerID, "treasureHuntP") > archive:GetMapArgs("maxTHP") then
		ReportCheat("寻宝点数异常")
	end


	local summerTimeP = archive:LoadInt(playerID, "summerTimeP")
	for i = 1, summerTime.count do
		local id = summerTime.firstIndex + i
		local needP = excel["存档"][id]["Value1"]
		local icon = excel["存档"][id]["Icon"]
		if common:IsLocalPlayer(players[playerID]) then
			summerTime.slots[i]:set_image(icon)
		end
		if needP <= summerTimeP then
			local attrStr = excel["存档"][id]["Value2"]
			allAttrStr = allAttrStr .. "|n" .. attrStr
			if common:IsLocalPlayer(players[playerID]) then
				summerTime.shadowIcon[i]:set_show(false)
			end
		end
	end
	if summerTimeP > archive:GetMapArgs("maxSTP") then
		ReportCheat("暑假活动点数异常")
	end

	local qrqd = archive:LoadInt(playerID, "qrqd")
	if archive:GetValueLimit(players[playerID], "qrqd") > 0 and qrqd < 7 then
		qrqd = qrqd + 1
		archive:SaveInt(playerID, "qrqd", qrqd)
		code.AddMessage(playerID, "已自动进行七日签到!")
	end
	for i = 1, 7 do
		local icon = excel["存档"][600 + i]["Icon"]
		if common:IsLocalPlayer(players[playerID]) then
			if i <= qrqd then
				qrqdUI.ui.signedIcon[i]:set_show(true)
				qrqdUI.ui.signIcon[i]:set_alpha(0)
			end
			qrqdUI.ui.rewardIcon[i]:set_image(icon)
		end
		if i <= qrqd then
			local attrStr = excel["存档"][600 + i]["Value1"]
			allAttrStr = allAttrStr .. "|n" .. attrStr
		end
	end

	local settings = archive:LoadStr(playerID, "settings")
	if #settings < settingsUI.count then
		settings = settings .. string.rep("a", settingsUI.count - #settings)
		archive:SaveStr(playerID, "settings", settings)
	end
	for i = 1, settingsUI.count, 1 do
		local state = settings:sub(i, i)
		if state == "b" then
			settingsUI.state[playerID][i] = true
			if common:IsLocalPlayer(players[playerID]) then
				settingsUI.ui.openIcon[i]:set_show(true)
				if i == 2 then
					local w, h = japi.GetWindowWidth(), japi.GetWindowHeight()
					if w / h ~= 16 / 9 and japi.IsWindowMode then
						japi.SetWindowSize(w, w / 16 * 9)
					end
				end
			end
		end
	end

	local heroSkin = archive:LoadStr(playerID, "heroSkin")
	if #heroSkin < decorate.ui.heroSkin.count then
		heroSkin = heroSkin .. string.rep("a", decorate.ui.heroSkin.count - #heroSkin)
		archive:SaveStr(playerID, "heroSkin", heroSkin)
	end
	for i = 1, decorate.ui.heroSkin.count, 1 do
		local state = heroSkin:sub(i, i)
		if state == "b" then
			local attrStr = excel["存档"][decorate.ui.heroSkin.firstIndex + i]["Value2"]
			allAttrStr = allAttrStr .. "|n" .. attrStr
			if common:IsLocalPlayer(players[playerID]) then
				decorate.ui.heroSkin.shadowIcon[i]:set_show(false)
			end
		end
		if common:IsLocalPlayer(players[playerID]) then
			decorate.ui.heroSkin.slots[i]:set_image(excel["存档"][decorate.ui.heroSkin.firstIndex + i]["Icon"])
		end
	end
	if archive:LoadInt(playerID, "currentSkin") > 0 then
		local skinIndex = archive:LoadInt(playerID, "currentSkin")
		local id = decorate.ui.heroSkin.firstIndex + skinIndex
		local skinName = excel["存档"][id]["Name"]
		local model = excel["存档"][id]["Value1"]
		code.SetUnitModel(jass.udg_Hero[playerID], model)
		code.SetUnitName(jass.udg_Hero[playerID], skinName)
		myFunc:SetCustomValue(jass.udg_Hero[playerID], "字符串", "model", model)
		jass.udg_CurrentHeroSkin[playerID] = skinIndex
		code.SelectUnitForPlayerSingle(jass.udg_Hero[playerID], common.Player[playerID])
	end

	for attrName, value in pairs(attrSystem:ParseAttributes2(allAttrStr)) do
		attrSystem:SetAttr(jass.udg_Hero[playerID], attrName, 0, value)
	end
end


local function SaveArchiveRegularTime()
	ac.time(1, function()
		for playerID, player in ipairs(players) do
			if common:PlayerInGame(player) and archive.archiveChanged[playerID] then
				for _, key in ipairs(strArchiveKey) do
					archive:SaveStrToServer(player, key, archive:LoadStr(playerID, key))
				end
				for _, key in ipairs(intArchiveKey) do
					archive:SaveIntToServer(player, key, archive:LoadInt(playerID, key))
				end
				archive.archiveChanged[playerID] = false
			end
		end
	end)
end


local function ArchiveInit()
	for playerID, player in ipairs(players) do
		if common:PlayerInGame(player) then
			LoadArchive(playerID)
		end
	end
	SaveArchiveRegularTime()
end

ArchiveInit()
