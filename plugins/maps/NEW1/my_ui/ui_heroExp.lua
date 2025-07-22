local BaseModule = require "my_base.base_module_manager"
local code       = require "jass.code"
local jass       = require "jass.common"
local myFunc     = BaseModule.MyFunc
local uiCreate   = BaseModule.UICreate
local common     = BaseModule.Common
local archive    = BaseModule.Archive
local tipDown    = BaseModule.UITipDialog.tipDialogDown
local excel      = excel

local players    = jass.udg_Player
local font       = "fonts\\LXWK_Bold.ttf"
local japi       = require "jass.japi"
local shadowIcon = [[UI\Widgets\ToolTips\Human\human-tooltip-background.blp]]

local HeroExp    = {}
local ui         = {}
HeroExp.ui       = ui

function HeroExp:Init()
	ui.highlightIcon = uiCreate:CreateUIAbsolute("image", gameui, "中心", 0, 0, 1, 1, { image = "Survival\\UI\\highlight.tga", alpha = 0.7, isShow = false })
	ui.highlightIcon:set_level(2)

	local wBtn, hBtn = 55, 55
	local xBtn, yBtn = 385 + 55 * 2, 215 - 55 * 1 -- 功能按钮绝对位置

	local OpenUI = {}
	OpenUI["Panel"] = gameui:builder 'panel' { w = 1, h = 1, xy = { '中心', 0, 0 }, show = true }
	OpenUI["Panel"]:set_point2("中心", xBtn, yBtn)
	OpenUI["Icon"] = OpenUI["Panel"]:builder "image" { w = wBtn, h = hBtn, xy = { "中心", OpenUI["Panel"], "中心", 0, 0 }, image = [[Survival\UI\Archive\exp.tga]] }
	OpenUI["Button"] = OpenUI["Icon"]:builder "button" { w = wBtn, h = hBtn, xy = { "中心", OpenUI["Icon"], "中心", 0, 0 } }
	local uiButton = OpenUI["Button"]
	uiButton:event "点击" (function()
		ui.panel:set_show(not ui.panel._show)
	end)
	ui.panel = gameui:builder 'panel' { w = 1, h = 1, xy = { '中心', 0, 0 }, show = false }
	ui.panel:set_point2("中心", 960, 900)
	ui.background = ui.panel:builder 'image' { w = 1060 * 0.8, h = 650 * 0.8, xy = { "顶部", ui.panel, "中心", 0, 0 }, image = [[Survival\UI\Archive\background.tga]] }
	japi.FrameSetIgnoreTrackEvents(ui.background.handle, false)
	-- ui.title = uiCreate:CreateUIRelative("text", ui.background, "顶部", ui.background, "顶部", 0, -20, 300, 0, { font = font, align = "居中", fontSize = 30, text = "英雄熟练度" })
	ui.title = ui.background:builder "image" { w = 300 * 0.7, h = 128 * 0.7, xy = { "中心", ui.background, "顶部", 0, 0 },
		image = [[Survival\UI\Archive\expTitle.tga]] }
	ui.closeIcon = ui.background:builder 'image' { w = 40, h = 40, xy = { "中心", ui.background, "右上", -10, -10 }, image = [[Survival\UI\Archive\close.tga]] }
	ui.closeBtn = ui.closeIcon:builder 'button' { w = 40, h = 40, xy = { "中心", ui.closeIcon, "中心", 0, 0 } }
	ui.closeBtn:event "点击" (function()
		ui.panel:set_show(false)
	end)
	ui.points = uiCreate:CreateUIRelative("text", ui.background, "右上", ui.background, "右上", -50, -50, 200, 0, { font = font, align = "右侧", fontSize = 22, text = "熟练点: 0" })
	ui.tip = uiCreate:CreateUIRelative("text", ui.background, "左上", ui.background, "左上", 50, -50, 300, 0, { font = font, align = "左侧", fontSize = 15 })
	ui.tip:set_text("|cffaaaaaa左键点击升级, 右键自动十连")
	ui.infoBg = uiCreate:CreateUIRelative("image", ui.background, "右上", ui.background, "右上", -50, -93, 320, 250, { image = [[Survival\UI\SeizeBody\textBg.tga]] })
	ui.allLvText = uiCreate:CreateUIRelative("text", ui.infoBg, "左上", ui.infoBg, "左上", 10, -10, 310, 0, { font = font, fontSize = 25, align = "左侧" })
	ui.allLvText:set_text("总熟练度等级: |cfaffff000")
	ui.allLvRewardsText = uiCreate:CreateUIRelative("text", ui.infoBg, "左上", ui.allLvText, "左下", 0, -20, 300, 0, { font = font, fontSize = 20, align = "左侧" })
	ui.ResetIcon = uiCreate:CreateUIRelative("image", ui.infoBg, "顶部", ui.infoBg, "底部", 0, -20, 150, 64, { image = [[Survival\UI\Archive\reset.tga]] })
	ui.ResetBtn = uiCreate:CreateUIRelative("button", ui.ResetIcon, "中心", ui.ResetIcon, "中心", 0, 0, 150, 64)
	ui.ResetBtn:event("点击")(function()
		common:SendSync("ResetHeroExp")
	end)
	common:ReceiveSync("ResetHeroExp")(function()
		local player = common:GetSyncPlayer()
		local playerID = common:ConvertPlayerToID(player)
		local returnP = HeroExp:CalcPRange(0, ui.allLv[playerID])
		archive:SaveInt(playerID, "heroExp", archive:LoadInt(playerID, "heroExp") + returnP)
		ui.allLv[playerID] = 0
		archive:SaveStr(playerID, "heroExpLv_1", string.rep(0, 20, "|"))
		for index = 1, 20 do
			if ui.slots[index] then
				if common:IsLocalPlayer(players[playerID]) then
					ui.heroLv[index]:set_text(0)
				end
			else
				break
			end
		end
		if common:IsLocalPlayer(player) then
			ui.points:set_text("熟练点: " .. archive:LoadInt(playerID, "heroExp"))
			ui.allLvText:set_text("总熟练度等级: |cfaffff000")
		end
	end)


	ui.allLv = { 0, 0, 0, 0 }
	local baseCost = excel["其它"][14]["Value1"]
	local raiseCost = excel["其它"][14]["Value2"]
	function HeroExp:CalcP(lv)
		return baseCost + raiseCost * lv
	end

	function HeroExp:CalcPRange(startLv, endLv)
		local gapLv = endLv - startLv
		local val = gapLv * baseCost + (gapLv * (startLv + endLv - 1) / 2) * raiseCost
		return math.floor(val)
	end

	local isInLvUp = false
	local w, h = 70, 70
	local d = 14
	local frame = [[StarRail\star_3.tga]]
	local count = #excel["夺舍"]
	local column = 5
	local row = math.ceil(count / column)
	row = math.min(row, 6)
	ui.slots = {}
	ui.slotsBtn = {}
	ui.heroLv = {}
	ui.heroLvBg = {}
	local function SetTip(index, playerID)
		local id = 300 + index
		local cost = HeroExp:CalcP(ui.allLv[playerID])
		local heroExpLv = archive:LoadStr(playerID, "heroExpLv_1")
		local currentLv = myFunc:SplitGetValue(heroExpLv, "|", index)
		local maxLv = excel["存档"][id]["Value1"]
		local startText = "消耗熟练点: " .. cost
		if currentLv >= maxLv then
			startText = "|cfff43232已满级|r"
		else
			startText = myFunc:SetNumColor(startText, "|cfaffff00", "|r")
		end
		local tip = "|n|n每级效果: " .. excel["存档"][id]["Tip"] .. "|n|n最大等级: " .. excel["存档"][id]["Value1"] .. "|n|n夺舍效果: " .. excel["夺舍"][index]["Tips"]
		tip = myFunc:SetNumColor(tip, "|cfaffff00", "|r")
		local name = excel["夺舍"][index]["Name"]
		local icon = excel["夺舍"][index]["Icon"]
		tipDown.name:set_text(name)
		tipDown.tips:set_text(startText .. tip)
		tipDown.intro:set_text("")
		tipDown.icon:set_image(icon)
	end
	local function EnterBtn(btn)
		local index = btn.index
		local playerID = common:GetLocalPlayerID()
		SetTip(index, playerID)
		ui.highlightIcon:set_wh(btn:get_wh())
		ui.highlightIcon:rem_allpoint():set_point("中心", btn, "中心", 0, 0)
		ui.highlightIcon:set_show(true)
		tipDown.panel:rem_allpoint():set_point("中心", btn, "右上", 16, -13)
		tipDown.panel:set_show(true)
	end
	local function LeaveBtn()
		tipDown.panel:set_show(false)
		ui.highlightIcon:set_show(false)
	end
	local function Click(btn, ty)
		local index = btn.index
		local playerID = common:GetLocalPlayerID()
		if not isInLvUp then
			local id = index + 300
			local heroExpLv = archive:LoadStr(playerID, "heroExpLv_1")
			local currentLv = myFunc:SplitGetValue(heroExpLv, "|", index)
			local maxLv = excel["存档"][id]["Value1"]
			if currentLv < maxLv then
				local cost = HeroExp:CalcP(ui.allLv[playerID])
				if cost <= archive:LoadInt(playerID, "heroExp") then
					isInLvUp = true
					common:SendSync("HeroExpLvUp", index .. "|" .. ty)
				end
			end
		end
	end
	local function LeftClickBtn(btn)
		Click(btn, 1)
	end
	local function RightClickBtn(btn)
		Click(btn, 10)
	end
	common:ReceiveSync("HeroExpLvUp")(function(data)
		local dataArray = myFunc:Split(data, "|")
		local index = dataArray[1]
		local id = index + 300
		local player = common:GetSyncPlayer()
		local playerID = common:ConvertPlayerToID(player)
		local heroExpLv = archive:LoadStr(playerID, "heroExpLv_1")
		local heroExp = archive:LoadInt(playerID, "heroExp")
		local result = myFunc:Split(heroExpLv, "|")
		local maxLv = excel["存档"][id]["Value1"]
		if dataArray[2] == 1 then
			local cost = HeroExp:CalcP(ui.allLv[playerID])
			if cost <= archive:LoadInt(playerID, "heroExp") then
				result[index] = result[index] + 1
				heroExp = heroExp - cost
				ui.allLv[playerID] = ui.allLv[playerID] + 1
			end
		else
			local cost = HeroExp:CalcPRange(ui.allLv[playerID], ui.allLv[playerID] + 10)
			if result[index] <= maxLv - 10 and cost <= heroExp then
				result[index] = result[index] + 10
				heroExp = heroExp - cost
				ui.allLv[playerID] = ui.allLv[playerID] + 10
			else
				for i = 1, 10, 1 do
					if result[index] < maxLv then
						cost = HeroExp:CalcP(ui.allLv[playerID])
						if cost <= heroExp then
							heroExp = heroExp - cost
							result[index] = result[index] + 1
							ui.allLv[playerID] = ui.allLv[playerID] + 1
						else
							break
						end
					else
						break
					end
				end
			end
		end
		archive:SaveInt(playerID, "heroExp", heroExp)
		archive:SaveStr(playerID, "heroExpLv_1", table.concat(result, "|"))
		if common:IsLocalPlayer(players[playerID]) then
			SetTip(index, playerID)
			isInLvUp = false
			ui.heroLv[index]:set_text(result[index])
			ui.points:set_text("熟练点: " .. archive:LoadInt(playerID, "heroExp"))
			ui.allLvText:set_text("总熟练度等级: |cfaffff00" .. ui.allLv[playerID])
		end
	end)
	for i = 1, row do
		for j = 1, column do
			local l = (i - 1) * column + j
			if l > count then
				break
			end
			if j == 1 then
				ui.slots[l] = ui.background:builder 'image' { w = w, h = h, xy = { '中心', ui.background, '左上', 255 - math.floor(column / 2) * (d + w), -130 - (i - 1) * (d + h) }, image = frame }
			else
				ui.slots[l] = ui.background:builder 'image' { w = w, h = h, xy = { '中心', ui.slots[l - 1], '中心', w + d, 0 }, image = frame }
			end
			ui.slotsBtn[l] = ui.slots[l]:builder 'button' { w = w, h = h, xy = { "中心", ui.slots[l], "中心", 0, 0 } }
			ui.slotsBtn[l].index = l
			ui.slotsBtn[l]:event("进入")(EnterBtn)
			ui.slotsBtn[l]:event("离开")(LeaveBtn)
			ui.slotsBtn[l]:event("点击")(LeftClickBtn)
			ui.slotsBtn[l]:event("右键点击")(RightClickBtn)
			ui.heroLvBg[l] = uiCreate:CreateUIRelative("image", ui.slots[l], "右下", ui.slots[l], "右下", 0, 0, 15, 15, { image = shadowIcon })
			ui.heroLv[l] = ui.slots[l]:builder "text" { w = 30, h = 0, xy = { "中心", ui.heroLvBg[l], '中心', 0, 0 }, font = { font, 13, align = "居中" } }
			ui.heroLv[l]:set_text(0)
		end
	end
end

return HeroExp
