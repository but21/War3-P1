local BaseModule = require "my_base.base_module_manager"
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

local TalentTree = {}
local ui         = {}
TalentTree.ui    = ui

function TalentTree:Init()
	ui.highlightIcon = uiCreate:CreateUIAbsolute("image", gameui, "中心", 0, 0, 1, 1, { image = "Survival\\UI\\highlight.tga", alpha = 0.7, isShow = false })
	ui.highlightIcon:set_level(2)


	local wBtn, hBtn = 55, 55
	local xBtn, yBtn = 385 + 55 * 0, 215 - 55 * 1 -- 功能按钮绝对位置

	local OpenUI = {}
	OpenUI["Panel"] = gameui:builder 'panel' { w = 1, h = 1, xy = { '中心', 0, 0 }, show = true }
	OpenUI["Panel"]:set_point2("中心", xBtn, yBtn)
	OpenUI["Icon"] = OpenUI["Panel"]:builder "image" { w = wBtn, h = hBtn, xy = { "中心", OpenUI["Panel"], "中心", 0, 0 },
		image = [[Survival\UI\Archive\TalentTree.tga]] }
	OpenUI["Button"] = OpenUI["Icon"]:builder "button" { w = wBtn, h = hBtn, xy = { "中心", OpenUI["Icon"], "中心", 0, 0 } }
	local uiButton = OpenUI["Button"]
	uiButton:event "点击" (function()
		ui.panel:set_show(not ui.panel._show)
	end)
	uiButton:event "进入" (function()
		-- OpenUI["存档图标"]:set_image([[GS\UI\SavePoints\iconHl.tga]])
	end)
	uiButton:event "离开" (function()
		-- OpenUI["存档图标"]:set_image([[GS\UI\SavePoints\icon.tga]])
	end)
	ui.panel = gameui:builder 'panel' { w = 1, h = 1, xy = { '中心', 0, 0 }, show = false }
	ui.panel:set_point2("中心", 960, 900)

	ui.background = ui.panel:builder 'image' { w = 1060 * 0.8, h = 650 * 0.7, xy = { "顶部", ui.panel, "中心", 0, 0 }, image = [[Survival\UI\Archive\background.tga]] }
	japi.FrameSetIgnoreTrackEvents(ui.background.handle, false)

	-- ui.title = uiCreate:CreateUIRelative("text", ui.background, "顶部", ui.background, "顶部", 0, -20, 100, 0, { font = font, align = "居中", fontSize = 30, text = "天赋树" })
	ui.title = ui.background:builder "image" { w = 300 * 0.7, h = 128 * 0.7, xy = { "中心", ui.background, "顶部", 0, 0 },
		image = [[Survival\UI\Archive\TalentTree\title.tga]] }
	ui.tip = uiCreate:CreateUIRelative("text", ui.background, "左上", ui.background, "左上", 50, -50, 300, 0, { font = font, align = "左侧", fontSize = 15 })
	ui.tip:set_text("|cffaaaaaa左键点击升级, 右键自动十连")
	ui.points = uiCreate:CreateUIRelative("text", ui.background, "右上", ui.background, "右上", -50, -50, 200, 0, { font = font, align = "右侧", fontSize = 22, text = "天赋点:0" })
	ui.closeIcon = ui.background:builder 'image' { w = 40, h = 40, xy = { "中心", ui.background, "右上", -10, -10 }, image = [[Survival\UI\Archive\close.tga]] }
	ui.closeBtn = ui.closeIcon:builder 'button' { w = 40, h = 40, xy = { "中心", ui.closeIcon, "中心", 0, 0 } }
	ui.closeBtn:event "进入" (function()
		-- ui.closeIcon:set_image([[GS\UI\Refine\closeHl.tga]])
	end)
	ui.closeBtn:event "离开" (function()
		-- ui.closeIcon:set_image([[GS\UI\Refine\close.tga]])
	end)
	ui.closeBtn:event "点击" (function()
		ui.panel:set_show(false)
	end)


	local column, row = 3, 3
	local frame = [[GS\UI\SavePoints\leftOption.tga]]
	local w, h = 50, 50
	local d = 10
	ui.talentTitle = {}
	ui.talentSlots = { {}, {}, {} }
	ui.talentSlotsBtn = { {}, {}, {} }
	ui.talentSlotsLvBg = { {}, {}, {} }
	ui.talentSlotsLv = { {}, {}, {} }
	ui.talentSlotsIsCanUse = { {}, {}, {} }
	ui.talentSlotsShadow = { {}, {}, {} }
	ui.talentTitle[1] = uiCreate:CreateUIRelative("text", ui.background, "左上", ui.background, "左上", 100, -90, 200, 0, { font = font, align = "居中", fontSize = 25, text = "本源(0)" })
	ui.talentTitle[2] = uiCreate:CreateUIRelative("text", ui.background, "顶部", ui.background, "顶部", 0, -90, 200, 0, { font = font, align = "居中", fontSize = 25, text = "战斗(0)" })
	ui.talentTitle[3] = uiCreate:CreateUIRelative("text", ui.background, "右上", ui.background, "右上", -100, -90, 200, 0, { font = font, align = "居中", fontSize = 25, text = "技巧(0)" })

	local function SetTip(ty, index, playerID)
		local id = 200 + (ty - 1) * 30 + index
		local icon = excel["存档"][id]["Icon"]
		local name = excel["存档"][id]["Name"]
		tipDown.name:set_text(name)
		tipDown.icon:set_image(icon)
		local talentLv = archive:LoadStr(playerID, "talentLv_" .. ty)
		local currentLv = myFunc:SplitGetValue(talentLv, "|", index)
		local maxLv = excel["存档"][id]["Value2"]
		local startText = "消耗天赋点: " .. TalentTree:CalcP(ui.talentLv[playerID].allLv)
		if currentLv >= maxLv then
			startText = "|cfff43232已满级|r"
		else
			startText = myFunc:SetNumColor(startText, "|cfaffff00", "|r")
		end
		local tip = "|n|n" .. excel["存档"][id]["Tip"]
		tip = tip .. "|n|n最大等级: " .. excel["存档"][id]["Value2"]
		tip = tip .. "|n|n解锁条件: " .. excel["存档"][id]["Condition"]
		tip = myFunc:SetNumColor(tip, "|cfaffff00", "|r")
		tipDown.tips:set_text(startText .. tip)
		tipDown.intro:set_text("")
	end
	local function EnterBtn(btn)
		local ty = btn.ty
		local playerID = common:GetLocalPlayerID()
		local index = btn.index
		SetTip(ty, index, playerID)
		ui.highlightIcon:set_wh(btn:get_wh())
		ui.highlightIcon:rem_allpoint():set_point("中心", btn, "中心", 0, 0)
		ui.highlightIcon:set_show(true)
		tipDown.panel:rem_allpoint():set_point("中心", btn, "右上", 16, -13)
		tipDown.panel:set_show(true)
	end
	local function LeaveBtn(btn)
		tipDown.panel:set_show(false)
		ui.highlightIcon:set_show(false)
	end

	local baseCost = excel["其它"][12]["Value1"]
	local raiseCost = excel["其它"][12]["Value2"]
	function TalentTree:CalcP(lv)
		return baseCost + raiseCost * lv
	end

	function TalentTree:CalcPRange(startLv, endLv)
		local gapLv = endLv - startLv
		local val = gapLv * baseCost + (gapLv * (startLv + endLv - 1) / 2) * raiseCost
		return math.floor(val)
	end

	ui.talentLv = { { allLv = 0 }, { allLv = 0 }, { allLv = 0 }, { allLv = 0 } }

	local isInLvUp = false
	local function Click(btn, count)
		if not isInLvUp then
			local playerID = common:GetLocalPlayerID()
			local ty = btn.ty
			local index = btn.index
			local id = btn.index + (ty - 1) * 30 + 200
			local talentLv = archive:LoadStr(playerID, "talentLv_" .. ty)
			local result = myFunc:Split(talentLv, "|")
			local needLv = excel["存档"][id]["Value1"]
			local maxLv = excel["存档"][id]["Value2"]
			if result[index] < maxLv and ui.talentLv[playerID][ty] >= needLv then
				local cost = TalentTree:CalcP(ui.talentLv[playerID].allLv)
				if cost <= archive:LoadInt(playerID, "talentP") then
					isInLvUp = true
					common:SendSync("TalentTreeLvUp", ty .. "|" .. index .. "|" .. count)
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
	common:ReceiveSync("TalentTreeLvUp")(function(data)
		local dataArray = myFunc:Split(data, "|")
		local ty = dataArray[1]
		local index = dataArray[2]
		local player = common:GetSyncPlayer()
		local playerID = common:ConvertPlayerToID(player)
		local id = index + (ty - 1) * 30 + 200
		local maxLv = excel["存档"][id]["Value2"]
		local talentLv = archive:LoadStr(playerID, "talentLv_" .. ty)
		local result = myFunc:Split(talentLv, "|")
		local talentP = archive:LoadInt(playerID, "talentP")

		if dataArray[3] == 1 then
			local cost = TalentTree:CalcP(ui.talentLv[playerID].allLv)
			if cost <= talentP then
				talentP = talentP - cost
				result[index] = result[index] + 1
				ui.talentLv[playerID].allLv = ui.talentLv[playerID].allLv + 1
				ui.talentLv[playerID][ty] = ui.talentLv[playerID][ty] + 1
			end
		else
			local cost = TalentTree:CalcPRange(ui.talentLv[playerID].allLv, ui.talentLv[playerID].allLv + 10)
			if result[index] <= maxLv - 10 and cost <= talentP then
				result[index] = result[index] + 10
				talentP = talentP - cost
				ui.talentLv[playerID].allLv = ui.talentLv[playerID].allLv + 10
				ui.talentLv[playerID][ty] = ui.talentLv[playerID][ty] + 10
			else
				for _ = 1, 10 do
					if result[index] < maxLv then
						cost = TalentTree:CalcP(ui.talentLv[playerID].allLv)
						if cost <= talentP then
							talentP = talentP - cost
							result[index] = result[index] + 1
							ui.talentLv[playerID].allLv = ui.talentLv[playerID].allLv + 1
							ui.talentLv[playerID][ty] = ui.talentLv[playerID][ty] + 1
						else
							break
						end
					else
						break
					end
				end
			end
		end
		archive:SaveInt(playerID, "talentP", talentP)
		archive:SaveStr(playerID, "talentLv_" .. ty, table.concat(result, "|"))
		for i = index, 9 do
			local newID = i + (ty - 1) * 30 + 200
			local needLv = excel["存档"][newID]["Value1"]
			if ui.talentLv[playerID][ty] >= needLv then
				if result[i] == 0 and common:IsLocalPlayer(players[playerID]) then
					ui.talentSlotsIsCanUse[ty][i]:set_show(true)
				end
			else
				break
			end
		end
		if common:IsLocalPlayer(player) then
			ui.talentSlotsLv[ty][index]:set_text(result[index])
			ui.talentSlotsLvBg[ty][index]:set_show(true)
			ui.talentSlotsShadow[ty][index]:set_show(false)
			ui.points:set_text("天赋点: " .. archive:LoadInt(playerID, "talentP"))
			ui.talentTitle[ty]:set_text(ui.talentTitle[ty]._text:sub(1, 6) .. "(" .. ui.talentLv[playerID][ty] .. ")")
			ui.talentTitle[ty]:set_show(true)
			ui.talentSlotsIsCanUse[ty][index]:set_show(false)
			isInLvUp = false
			SetTip(ty, index, playerID)
		end
	end)

	for ty = 1, 3 do
		for i = 1, row do
			for j = 1, column do
				local index = (i - 1) * column + j
				if j == 1 then
					ui.talentSlots[ty][index] = ui.talentTitle[ty]:builder "image" { w = w, h = h, xy = { "顶部", ui.talentTitle[ty], '顶部',
						-(row - 1) * (w + d) / 2, -50 - (h + d) * (i - 1) }, image = frame }
				else
					ui.talentSlots[ty][index] = ui.talentTitle[ty]:builder "image" { w = w, h = h, xy = { "左侧", ui.talentSlots[ty][index - 1], '右侧', d, 0 }, image = frame }
				end
				ui.talentSlotsBtn[ty][index] = ui.talentSlots[ty][index]:builder "button" { w = w, h = h, xy = { "中心", ui.talentSlots[ty][index], '中心', 0, 0 } }
				ui.talentSlotsBtn[ty][index].ty = ty
				ui.talentSlotsBtn[ty][index].index = index
				ui.talentSlotsBtn[ty][index]:event("进入")(EnterBtn)
				ui.talentSlotsBtn[ty][index]:event("离开")(LeaveBtn)
				ui.talentSlotsBtn[ty][index]:event("点击")(LeftClickBtn)
				ui.talentSlotsBtn[ty][index]:event("右键点击")(RightClickBtn)
				ui.talentSlotsLvBg[ty][index] = uiCreate:CreateUIRelative("image", ui.talentSlots[ty][index], "右下", ui.talentSlots[ty][index], "右下", 0, 0, 15, 15, { image = shadowIcon })
				ui.talentSlotsLvBg[ty][index]:set_show(false)
				ui.talentSlotsLv[ty][index] = ui.talentSlotsLvBg[ty][index]:builder "text" { w = 30, h = 0, xy = { "中心", ui.talentSlotsLvBg[ty][index], '中心', 0, 0 },
					font = { font, 13, align = "居中" } }
				ui.talentSlotsShadow[ty][index] = ui.talentSlots[ty][index]:builder "image" { w = w, h = h, xy = { "中心", ui.talentSlots[ty][index], '中心', 0, 0 }, image = shadowIcon, alpha = 0.7 }
				ui.talentSlotsIsCanUse[ty][index] = ui.talentSlots[ty][index]:builder "text" { w = w, h = 0, xy = { "底部", ui.talentSlots[ty][index], '底部', 0, 0 }, font = { font, 16, align = "居中" } }
				ui.talentSlotsIsCanUse[ty][index]:set_show(false)
				ui.talentSlotsIsCanUse[ty][index]:set_text("|cff00ff00可激活")
			end
		end
	end

	local function ResetTalentTree(btn)
		common:SendSync("ResetTalentTree", btn.index)
	end
	common:ReceiveSync("ResetTalentTree")(function(data)
		local player = common:GetSyncPlayer()
		local playerID = common:ConvertPlayerToID(player)
		local returnP = TalentTree:CalcPRange(ui.talentLv[playerID].allLv - ui.talentLv[playerID][data], ui.talentLv[playerID].allLv)
		archive:SaveInt(playerID, "talentP", archive:LoadInt(playerID, "talentP") + returnP)
		archive:SaveStr(playerID, "talentLv_" .. data, string.rep(0, 9, "|"))
		ui.talentLv[playerID].allLv = ui.talentLv[playerID].allLv - ui.talentLv[playerID][data]
		ui.talentLv[playerID][data] = 0
		for index = 1, 9 do
			if common:IsLocalPlayer(player) then
				ui.talentSlotsIsCanUse[data][index]:set_show(false)
				ui.talentSlotsLvBg[data][index]:set_show(false)
				ui.talentSlotsShadow[data][index]:set_show(true)
				local id = index + (data - 1) * 30 + 200
				local needLv = excel["存档"][id]["Value1"]
				if ui.talentLv[playerID][data] >= needLv then
					ui.talentSlotsIsCanUse[data][index]:set_show(true)
				end
			end
		end
		if common:IsLocalPlayer(player) then
			ui.points:set_text("天赋点: " .. archive:LoadInt(playerID, "talentP"))
			ui.talentTitle[data]:set_text(ui.talentTitle[data]._text:sub(1, 6) .. "(0)")
		end
	end)
	ui.resetIcon = {}
	ui.resetBtn = {}
	for i = 1, 3 do
		ui.resetIcon[i] = uiCreate:CreateUIRelative("image", ui.talentTitle[i], "顶部", ui.talentTitle[i], "底部", 0, -215, 150, 64, { image = [[Survival\UI\Archive\reset.tga]] })
		ui.resetBtn[i] = uiCreate:CreateUIRelative("button", ui.resetIcon[i], "中心", ui.resetIcon[i], "中心", 0, 0, 150, 64)
		ui.resetBtn[i].index = i
		ui.resetBtn[i]:event("点击")(ResetTalentTree)
	end
end

return TalentTree
