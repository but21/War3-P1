local code = require 'jass.code'
local jass = require 'jass.common'
local japi = require 'jass.japi'

local font = [[fonts\LXWK_Bold.ttf]]

local Module = require "my_base.base_module_manager"
local sequenceFrameImage = Module.Constant.sequenceFrameImage
local imagePool = Module.ImagePool
local tipDialogUp = Module.UITipDialog.tipDialogUp
local common = Module.Common
local excelSystem = Module.ExcelSystem
local myFunc = Module.MyFunc
local createUI = Module.UICreate
local excel = excel
local players = jass.udg_Player

local bloodSacrificeCount = jass.udg_BloodSacrificeCount
local heartLv = jass.udg_HeartLv
local heartType = jass.udg_HeartType

local heartUI = {}
local Heart = {}
Heart.ui = heartUI

--- 是否正在修改血祭加成
local inChangeAttr = false

-- 获得的词条, .attrName, .attrValue, .text
local ownedAttr = {}
for i = 1, 4 do
	ownedAttr[i] = {}
end

local artifactName = { "浮生剑", "鬼眼弓", "星落杖" }
local artifactIcon = { [[Survival\UI\Qzzx\1.blp]], [[Survival\UI\Qzzx\2.blp]], [[Survival\UI\Qzzx\3.blp]] }

-- 血祭加成品质颜色字符串
local qualityColor = { "|cff00ff00[C]|r", "|cff00acf5[B]|r", "|cffc400f5[A]|r", "|cffff0000[S]|r" }
-- 对应品质的概率
local qualityPro = {}
for i = 1, 4 do
	qualityPro[i] = {}
	qualityPro[i] = { excel["概率"][2]["概率1"], excel["概率"][2]["概率2"], excel["概率"][2]["概率3"], excel["概率"][2]["概率4"] }
end

local size       = 65
heartUI["panel"] = gameui:builder 'panel' { w = 1, h = 1, xy = { '中心', 0, 0 }, isShow = true }
heartUI['panel']:set_point2("中心", 1330, 305)
--背景图片
heartUI["icon"]       = heartUI["panel"]:builder 'image' { w = size, h = size, xy = { '中心', heartUI["panel"], '中心', 0, 0 },
	image = [[Survival\UI\Qzzx\qzzx.blp]], alpha = 1 }
--本源之心升级所需杀敌数
heartUI["killsCount"] = heartUI["icon"]:builder 'text' { w = size, h = 0, xy = { "底部", heartUI["icon"], "底部", 0, 0 },
	font = { [[fonts\LXWK_Bold.ttf]], 30, align = '居中' } }
--本源之心按钮
heartUI["btn"]        = heartUI["icon"]:builder 'button' { w = size, h = size, xy = { '中心', heartUI["panel"], '中心', 0, 0 } }
-- 右下文本背景
heartUI.lvBg          = createUI:CreateUIRelative("image", heartUI.icon, "右下", heartUI.icon, "右下", 0, 0, 30, 15, { image = [[UI\Widgets\ToolTips\Human\human-tooltip-background.blp]] })
-- 右下文本(等级/杀敌数)
heartUI.lvText        = createUI:CreateUIRelative("text", heartUI.lvBg, "中心", heartUI.lvBg, "中心", 0, 0, 40, 0, { font = font, fontSize = 12, align = "居中" }):set_text("Lv:1")
-- 选择血祭加成背景
heartUI.selectBg      = createUI:CreateUIAbsolute("image", gameui, "中心", 960, 700, 300, 110, { isShow = false, image = [[UI\Widgets\ToolTips\Human\human-tooltip-background.blp]] })
japi.FrameSetIgnoreTrackEvents(heartUI.selectBg.handle, false)
-- 选择血祭加成标题
heartUI.selectTitle    = createUI:CreateUIRelative("text", heartUI.selectBg, "顶部", heartUI.selectBg, "顶部", 0, -10, 300, 0, { font = font, fontSize = 25, align = "居中" }):set_text("修改血祭加成")
local textBgW, textBgH = 240, 40
-- 选择血祭加成选项
heartUI.optionBg       = {}
-- 选择血祭加成文本
heartUI.optionText     = {}
-- 选择血祭加成按钮
heartUI.optionBtn      = {}

-- 选择需要修改的血祭加成
local function SelectOne(btn)
	local index = btn.index
	common:SendSync("SelectBloodSacrificeAttr", index)
	heartUI.selectBg:set_show(false)
end

common:ReceiveSync("SelectBloodSacrificeAttr")(function(index)
	local player = common:GetSyncPlayer()
	local playerID = common:ConvertPlayerToID(player)
	local attrName = ownedAttr[playerID][index].attrName
	local attrValue = ownedAttr[playerID][index].attrValue
	local randomInt = common:GetRandomInt(1, 100)
	local quality = 1
	for i = 1, 4 do
		if randomInt <= qualityPro[playerID][i] then
			quality = i
			break
		end
	end
	local minAttrVal = excel["本源附魔"][index]["Value" .. quality]
	local maxAttrVal = excel["本源附魔"][index]["Value" .. (quality + 4)]
	local newAttrVal = tonumber(string.format("%.1f", common:GetRandomReal(minAttrVal, maxAttrVal)))
	code.SetUnitAttr_Ex_Str(jass.udg_Hero[playerID], attrName, 0, newAttrVal - attrValue)
	local attrText = " " .. qualityColor[quality] .. " " .. attrName .. "+" .. newAttrVal
	if attrName:sub(-1) == '%' then
		attrText = " " .. qualityColor[quality] .. " " .. attrName:gsub("%%", "") .. "+" .. newAttrVal .. "%"
	end
	code.AddMessage(playerID, "刷新血祭加成:" .. attrText)
	ownedAttr[playerID][index] = {}
	ownedAttr[playerID][index].attrName = attrName
	ownedAttr[playerID][index].attrValue = newAttrVal
	ownedAttr[playerID][index].text = attrText
	if common:IsLocalPlayer(player) then
		inChangeAttr = false
	end
end)

for i = 1, #excel["本源附魔"] / 3 do
	heartUI.optionBg[i] = createUI:CreateUIRelative("image", heartUI.selectBg, "顶部", heartUI.selectTitle, "底部", 0, -20 - (i - 1) * (textBgH + 15), textBgW, textBgH,
		{ isShow = false, image = [[Survival\UI\SelectOne\optionsBg.tga]] })
	heartUI.optionText[i] = createUI:CreateUIRelative("text", heartUI.optionBg[i], "中心", heartUI.optionBg[i], "中心", 0, 0, textBgW, 0, { font = font, fontSize = 18, align = "居中" })
	heartUI.optionBtn[i] = createUI:CreateUIRelative("button", heartUI.optionBg[i], "中心", heartUI.optionBg[i], "中心", 0, 0, textBgW, textBgH)
	heartUI.optionBtn[i].index = i
	heartUI.optionBtn[i]:event "点击" (SelectOne)
end

local uiButton = heartUI["btn"]
heartUI["btn"]:event "点击" (function()
	common:SendSync("HeartLvUp", 0)
end)
-- 右键点击修改血祭加成
heartUI.btn:event "右键点击" (function()
	-- 判断血祭加成数是否大于0, 大于0则弹出窗口显示洗练
	local playerID = common:GetLocalPlayerID()
	-- 首先判断有没有词条, 判断是否正在洗练词条, 判断金币是否足够, 然后根据数量设置UI, 弹出选项
	if not inChangeAttr then
		if #ownedAttr[playerID] > 0 then
			if jass.udg_PlayerGold[playerID] >= 10000 then
				-- 显示选项(异步), 发送同步扣除金币
				for index, bg in ipairs(heartUI.optionBg) do
					if index <= #ownedAttr[playerID] then
						bg:set_show(true)
						heartUI.optionText[index]:set_text(ownedAttr[playerID][index].text)
					else
						bg:set_show(false)
					end
				end
				inChangeAttr = true
				heartUI.selectBg:set_wh(300, 70 + #ownedAttr[playerID] * 55)
				heartUI.selectBg:set_show(true)
				common:SendSync("ReduceGold", 10000)
			else
				print("金币不足")
			end
		end
	else
		print("正在选择血祭加成")
	end
end)

common:ReceiveSync("ReduceGold")(function(val)
	local player = common:GetSyncPlayer()
	local playerID = common:ConvertPlayerToID(player)
	jass.udg_PlayerGold[playerID] = jass.udg_PlayerGold[playerID] - val
end)


-- 鼠标是否在本源之心按钮上(异步)
local inHeart = false


-- 显示提示框(异步)
local function ShowTip()
	local player = common:GetLocalPlayer()
	local playerID = common:GetLocalPlayerID()
	if common:IsLocalPlayer(player) then
		local level = heartLv[playerID]
		local heartTy = heartType[playerID]
		if level <= 29 then
			-- 初始等级为1
			-- 名字, 等级, 金币消耗, 属性加成, 图标
			local name = excelSystem:GetData("本源升级", level, "Name")
			local goldCost = excelSystem:GetData("本源升级", level, "GoldCost")
			local attrStr = excelSystem:GetData("本源升级", level, "Addition")
			local icon = excelSystem:GetData("本源升级", level, "Icon")
			tipDialogUp.name:set_text(name .. "  Lv-" .. level)
			tipDialogUp.icon:set_image(icon)
			local tip = "|cff00f5a4[属性加成]|r|n" .. myFunc:SetNumColor(myFunc:StringFormat(attrStr), "|cfaffff00", "|r") .. "|n|n"
			tip = tip .. "|cff00f5a4[升级消耗]|r|n※金币：|cfaffff00" .. goldCost .. "|r"
			tip = tip .. "|n|n|ca7848484左键点击消耗金币升级|n达到29级之后升级会试炼获得神器|r"
			tipDialogUp.tips:set_text(tip)
			tipDialogUp.panel:reset_allpoint()
			tipDialogUp.panel:set_show(true)
			tipDialogUp.intro:set_text("|cff00ffff类别 - 强化")
			tipDialogUp.panel:set_point2("中心", 1900, 301 - 14)
		else
			-- 初始等级为0, 血祭: 击杀一定数量的敌人后血祭神器获得一次强化(凡王之血, 必以剑终)
			-- 类别,
			-- 名字, 提示, 附魔, 属性加成, 图标
			local name = artifactName[heartTy]
			local icon = artifactIcon[heartTy]
			local attrStr = excelSystem:GetData("本源升级", level, "Addition")
			local tip = "|cff00f5a4[属性加成]|r|n" .. myFunc:SetNumColor(myFunc:StringFormat(attrStr), "|cfaffff00", "|r")
			if #ownedAttr[playerID] > 0 then
				-- attrStr = table.concat(ownedAttr[playerID], "|n※")
				attrStr = "|n|n|cffff0000[血祭加成]|r"
				for _, value in ipairs(ownedAttr[playerID]) do
					attrStr = attrStr .. "|n※" .. value.text
				end
				tip = tip .. attrStr
			end
			if bloodSacrificeCount[playerID] < #excel["本源附魔"] / 3 then
				tip = tip .. "|n|n开启血祭消耗：金币|cfaffff00" .. excelSystem:GetData("本源附魔", bloodSacrificeCount[playerID] + 1, "GoldCost") .. "|r"
			else
				tip = tip .. "|n|n已达到最大血祭次数"
			end
			tip = tip .. "|n重新随机消耗：金币|cfaffff00" .. 10000 .. "|r"
			tip = tip .. "|n|n|ca7848484每击杀一定数量的敌人可进行一次血祭获得属性加成。|n|n左键点击可开启血祭。|n右键点击可重新随机血祭获得的属性加成值。"
			tipDialogUp.name:set_text("|cffff0000" .. name)
			tipDialogUp.icon:set_image(icon)
			tipDialogUp.tips:set_text(tip)
			tipDialogUp.panel:reset_allpoint()
			tipDialogUp.panel:set_show(true)
			tipDialogUp.intro:set_text("|cffff0000凡王之血，必以剑终。")
			tipDialogUp.panel:set_point2("中心", 1900, 284)
		end
	end
end


--鼠标进入事件
uiButton:event "进入" (function()
	ShowTip()
	inHeart = true
end)


--鼠标离开事件
uiButton:event "离开" (function()
	tipDialogUp.panel:set_show(false)
	inHeart = false
end)


--本源之心升级所需杀敌数UI
function code.HeartCountChange(count, playerID)
	-- print(count)
	if heartType[playerID] > 0 and common:IsLocalPlayer(jass.udg_Player[playerID]) then
		if count <= 0 then
			heartUI.lvBg:set_show(false)
			-- heartUI.lvText:set_show(false)
		else
			heartUI.lvText:set_text("|cffff0000" .. tostring(count))
			heartUI.lvBg:set_show(true)
		end
	end
end

--本源之心升级刷新UI
function code.HeartLevelUp(playerID)
	-- 当附魔词条==0 and 等级<30时, 设置等级并且加属性, 否则设置附魔词条数
	local hero = jass.udg_Hero[playerID]
	local lv = heartLv[playerID]
	if #ownedAttr[playerID] == 0 and heartLv[playerID] < 30 then
		local attrStr = excelSystem:GetData("本源升级", lv - 1, "Addition")
		code.ReduceUnitAttrStr(hero, attrStr)
		attrStr = excelSystem:GetData("本源升级", lv, "Addition")
		code.AddUnitAttrStr(hero, attrStr)
		if common:IsLocalPlayer(jass.udg_Player[playerID]) then
			heartUI.lvText:set_text("Lv:" .. lv)
			if not heartUI.icon.sequenceFrame or heartUI.icon.sequenceFrame.P.complete then
				local image = imagePool:GetImage()
				image:set_point("中心", heartUI.icon, "中心", 0, 0)
				local w, h = heartUI.icon:get_wh()
				image:set_wh(w * 2.2, h * 2.2)
				image:set_show(true)
				heartUI.icon.sequenceFrame = myFunc:SequenceFrame({
					UI = image,
					image = sequenceFrameImage.lvUp,
					time = sequenceFrameImage.lvUp.time,
					isLoop = false,
					complete = function()
						imagePool:RecycleImage(image)
					end
				})
			else
				heartUI.icon.sequenceFrame.nowT = 0
				-- 设置nowt为0
			end
		end
	else
		-- 升级动画
		if common:IsLocalPlayer(jass.udg_Player[playerID]) then
			heartUI.icon:set_image(artifactIcon[heartType[playerID]])
			local image = imagePool:GetImage()
			image:set_point("底部", heartUI.icon, "底部", 0, -10)
			image:set_wh(64, 100)
			image:set_show(true)
			heartUI.icon.sequenceFrame = myFunc:SequenceFrame({
				UI = image,
				image = sequenceFrameImage.cx,
				time = sequenceFrameImage.cx.time,
				isLoop = false,
				complete = function()
					imagePool:RecycleImage(image)
				end
			})
		end
	end
	if common:IsLocalPlayer(jass.udg_Player[playerID]) then
		if inHeart then
			ShowTip()
		end
	end
end

--获得血祭加成
function code.GetBloodSacrificeAddition(playerID)
	-- 根据当前已有词条数量给词条, 然后随机品质
	local hero = jass.udg_Hero[playerID]
	local randomInt = common:GetRandomInt(1, 100)
	local quality = 1
	for i = 1, 4 do
		if randomInt <= qualityPro[playerID][i] then
			quality = i
			break
		end
	end
	local attrID = #ownedAttr[playerID] + 1 + #excel["本源附魔"] / 3 * (heartType[playerID] - 1)
	local attrName = excel["本源附魔"][attrID]["Name"]
	local minAttrVal = excel["本源附魔"][attrID]["Value" .. quality]
	local maxAttrVal = excel["本源附魔"][attrID]["Value" .. (quality + 4)]
	local randomAttrVal = tonumber(string.format("%.1f", common:GetRandomReal(minAttrVal, maxAttrVal)))
	local attrText = " " .. qualityColor[quality] .. " " .. attrName .. "+" .. randomAttrVal
	if attrName:sub(-1) == '%' then
		attrText = " " .. qualityColor[quality] .. " " .. attrName:gsub("%%", "") .. "+" .. randomAttrVal .. "%"
	end
	local length = #ownedAttr[playerID] + 1
	ownedAttr[playerID][length] = {}
	ownedAttr[playerID][length].attrName = attrName
	ownedAttr[playerID][length].attrValue = randomAttrVal
	ownedAttr[playerID][length].text = attrText
	code.SetUnitAttr_Ex_Str(hero, attrName, 0, randomAttrVal)
	-- table.insert(ownedAttr[playerID], attrText)
	if common:IsLocalPlayer(jass.udg_Player[playerID]) then
		if inHeart then
			ShowTip()
		end
		heartUI.icon:set_image(artifactIcon[heartType[playerID]])
		local image = imagePool:GetImage()
		image:set_point("底部", heartUI.icon, "底部", 0, -10)
		image:set_wh(64, 100)
		image:set_show(true)
		heartUI.icon.sequenceFrame = myFunc:SequenceFrame({
			UI = image,
			image = sequenceFrameImage.cx,
			time = sequenceFrameImage.cx.time,
			isLoop = false,
			complete = function()
				imagePool:RecycleImage(image)
			end
		})
	end
end

return Heart
