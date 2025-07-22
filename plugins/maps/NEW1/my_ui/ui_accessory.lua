local code = require "jass.code"
local jass = require "jass.common"
local japi = require "jass.japi"

local font = "fonts\\LXWK_Bold.ttf"

--- 玩家
local players = jass.udg_Player
local Module = require "my_base.base_module_manager"

local imagePool = Module.ImagePool
local sequenceFrameImage = Module.Constant.sequenceFrameImage
local common = Module.Common
local createUI = Module.UICreate
local excelSystem = Module.ExcelSystem
local myFunc = Module.MyFunc
local excel = excel
local tipDialogUp = Module.UITipDialog.tipDialogUp
local accessoryCurrentCount = jass.udg_AccessoryCurrentCount

---@class Accessory
local Accessory = {}
local accessoryUI = {}
Accessory.ui = accessoryUI



-- 已拥有的饰品
local ownedAccessory = {}
-- 未拥有的饰品
local notOwnedAccessory = { {}, {}, {}, {} }
for playerID, value in ipairs(jass.udg_Player) do
	ownedAccessory[playerID] = {}
	for i = 1, #excel["饰品"] do
		notOwnedAccessory[playerID][i] = i
	end
end

Accessory.ownedAccessory = ownedAccessory

-- 存储饰品等级哈希表
local htAccessoryLv = jass.udg_HTAccessoryLv
-- 存储饰品ID哈希表
local htAccessoryID = jass.udg_HTAccessoryID

--- 获得随机一个饰品ID, 只能同步用
---@param playerID integer  玩家ID
---@return integer
function Accessory:GetAccessory(playerID)
	-- 确定是随机新饰品还是升级饰品
	local ty = common:GetRandomInt(1, 2)
	local accessoryID = 0
	if accessoryCurrentCount[playerID] >= 6 then
		ty = 2
	end
	if ty == 2 and #ownedAccessory[playerID] > 0 then
		accessoryID     = ownedAccessory[playerID][common:GetRandomInt(1, #ownedAccessory[playerID])]
		local maxLv     = excel["饰品"][accessoryID]["MaxLv"]
		local condition = common:LoadInteger(htAccessoryLv, playerID, accessoryID) < maxLv
		local count     = 0
		while not condition do
			accessoryID = ownedAccessory[playerID][common:GetRandomInt(1, #ownedAccessory[playerID])]
			maxLv       = excel["饰品"][accessoryID]["MaxLv"]
			condition   = common:LoadInteger(htAccessoryLv, playerID, accessoryID) < maxLv
			count       = count + 1
			if count >= 50 then
				condition = true
				accessoryID = 0
			end
		end
	end
	if accessoryID == 0 and accessoryCurrentCount[playerID] < 6 then
		accessoryID = notOwnedAccessory[playerID][common:GetRandomInt(1, #notOwnedAccessory[playerID])]
	end
	return accessoryID
end

--- 移除指定饰品ID, 只能同步用
---@param playerID integer  玩家ID
---@param accessoryID integer  饰品ID
function Accessory:RemoveAccessory(playerID, accessoryID)
	for index, value in ipairs(notOwnedAccessory[playerID]) do
		if value == accessoryID then
			table.remove(notOwnedAccessory[playerID], index)
			break
		end
	end
end

local _changeSize = 3
---设置饰品UI
function code.SetAccessoryUI(playerID, accessoryID, index)
	if not accessoryUI.frame[index] then
		-- 添加一个新饰品格子
		Accessory:AddNewSlot(index)
	end
	-- 设置图标, 等级
	local icon = excelSystem:GetData("饰品", accessoryID, "Icon")
	local lv = common:LoadInteger(htAccessoryLv, playerID, accessoryID)
	if lv == 1 then
		-- 如果是第一次获得该饰品, 从未拥有饰品池中移除, 加入已有饰品池
		Accessory:RemoveAccessory(playerID, accessoryID)
		table.insert(ownedAccessory[playerID], accessoryID)
		if common:IsLocalPlayer(players[playerID]) then
			local image = imagePool:GetImage()
			image:set_point("中心", accessoryUI.icon[index], "中心", -1, 218)
			local w, h = accessoryUI.icon[index]:get_wh()
			local x, y = image:get_xy()
			image:set_show(true)
			image:set_image(icon)
			myFunc:FadeSize { UI = image, time = 0.3, startP = { w * _changeSize, h * _changeSize }, endP = { w, h }, ty = '二元入', complete = function()
				myFunc:FadePosition { UI = image, fUI = accessoryUI.icon[index], time = 0.2, startP = { x, y }, endP = { x, y - 215 }, ty = '二元入', complete = function()
					-- imagePool:RecycleImage(image)
					image:set_wh(w * 1.3, h * 1.3)
					myFunc:SequenceFrame({
						UI = image,
						image = sequenceFrameImage.selectOne,
						time = sequenceFrameImage.selectOne.time,
						isLoop = false,
						complete = function()
							imagePool:RecycleImage(image)
						end
					})
				end }
			end }
		end
	else
		if common:IsLocalPlayer(players[playerID]) then
			if not accessoryUI.icon[index].sequenceFrame or accessoryUI.icon[index].sequenceFrame.P.complete then
				local image = imagePool:GetImage()
				image:set_point("中心", accessoryUI.icon[index], "中心", 0, 0)
				local w, h = accessoryUI.icon[index]:get_wh()
				image:set_wh(w * 2, h * 2)
				image:set_show(true)
				accessoryUI.icon[index].sequenceFrame = myFunc:SequenceFrame({
					UI = image,
					image = sequenceFrameImage.lvUp,
					time = sequenceFrameImage.lvUp.time,
					isLoop = false,
					complete = function()
						imagePool:RecycleImage(image)
					end
				})
			else
				accessoryUI.icon[index].sequenceFrame.nowT = 0
				-- 设置nowt为0
			end
		end
	end
	local text = "Lv:" .. lv
	if lv == excel["饰品"][accessoryID]["MaxLv"] then
		text = "MAX"
	end
	if common:IsLocalPlayer(players[playerID]) then
		accessoryUI.frame[index]:set_show(true)
		accessoryUI.icon[index]:set_show(true)
		accessoryUI.icon[index]:set_image(icon)
		accessoryUI.lvText[index]:set_text(text)
	end
end

--#region 创建UI

-- 背景高
local bgH = 65
-- 背景宽
local bgW = bgH * 6 - 2

-- 父控件
accessoryUI.panel = createUI:CreateUIAbsolute("panel", gameui, "中心", bgW / 2 + 3, 305, 1, 1)
-- 背景
accessoryUI.background = createUI:CreateUIRelative("image", accessoryUI.panel, "中心", accessoryUI.panel, "中心", 0, 0, bgW, bgH, { image = [[UI\Widgets\ToolTips\Human\human-tooltip-background.blp]], alpha = 0.5 })

-- 底框大小
local frameSize = bgH - 2
-- 图标大小
local slotSize = bgH - 2

-- 进入按钮事件
local function AccessoryBtnEnterFunc(btn)
	local playerID    = common:GetLocalPlayerID()
	local index       = btn.index
	-- local accessoryID = ownedAccessory[playerID][index]

	local accessoryID = common:LoadInteger(htAccessoryID, playerID, index)
	local name        = excel["饰品"][accessoryID]["Name"]
	local icon        = excel["饰品"][accessoryID]["Icon"]
	local currentLv   = common:LoadInteger(htAccessoryLv, playerID, accessoryID)
	-- 当前加成
	local tip         = excel["饰品"][accessoryID]["TipsEx"] .. "|n|n|cff00f5a4[当前加成]|r|n"
	for i = 1, currentLv do
		tip = tip .. "※" .. myFunc:SetNumColor(excel["饰品"][accessoryID][i .. "级效果"], "|cfaffff00", "|r") .. "|n"
	end
	-- 最大等级
	local maxLv = excel["饰品"][accessoryID]["MaxLv"]
	tip = tip .. "|n|cff00f5a4[注]|r|n※最大等级：|cfaffff00" .. maxLv .. "|r"
	tip = tip .. "|n|n|ca7848484※" .. excel["饰品"][accessoryID]["Tips"]
	tipDialogUp.icon:set_image(icon)
	tipDialogUp.icon:set_show(true)
	tipDialogUp.name:set_text(name)
	tipDialogUp.tips:set_text(tip)
	tipDialogUp.intro:set_text("|cff00ffff类别 - 饰品")
	tipDialogUp.panel:set_point2("中心", 415, 430)
	tipDialogUp.panel:set_show(true)
	myFunc:FadeSize({ UI = accessoryUI.icon[index], time = 0.1, startP = { slotSize, slotSize }, endP = { slotSize * 1.1, slotSize * 1.1 }, ty = "二元出" })
end

-- 离开按钮事件
local function AccessoryBtnLeaveFunc(btn)
	local index = btn.index
	myFunc:FadeSize({ UI = accessoryUI.icon[index], time = 0.1, startP = { slotSize * 1.1, slotSize * 1.1 }, endP = { slotSize, slotSize }, ty = "二元入" })
	tipDialogUp.panel:set_show(false)
end

accessoryUI.frame, accessoryUI.icon, accessoryUI.btn, accessoryUI.lvBg, accessoryUI.lvText = {}, {}, {}, {}, {}
-- 底框, 图标, 右下小黑背景, 右下等级, 按钮, 进入高光/进入略微放大
for i = 1, 6 do
	accessoryUI.frame[i]  = createUI:CreateUIRelative("image", accessoryUI.background, "中心", accessoryUI.background, "左侧", frameSize / 2 + (frameSize + 2) * (i - 1), 0, frameSize, frameSize,
		{ image = [[UI\Widgets\ToolTips\Human\human-tooltip-background.blp]] })
	accessoryUI.icon[i]   = createUI:CreateUIRelative("image", accessoryUI.frame[i], "中心", accessoryUI.frame[i], "中心", 0, 0, slotSize, slotSize, { image = [[StarRail\star_3.tga]], isShow = false })
	accessoryUI.btn[i]    = createUI:CreateUIRelative("button", accessoryUI.icon[i], "中心", accessoryUI.icon[i], "中心", 0, 0, slotSize, slotSize)
	accessoryUI.lvBg[i]   = createUI:CreateUIRelative("image", accessoryUI.icon[i], "右下", accessoryUI.icon[i], "右下", 0, 0, 30, 15,
		{ image = [[UI\Widgets\ToolTips\Human\human-tooltip-background.blp]], alpha = 0.9 })
	accessoryUI.lvText[i] = createUI:CreateUIRelative("text", accessoryUI.lvBg[i], "中心", accessoryUI.lvBg[i], "中心", 0, 0, 30, 0, { font = font, fontSize = 12, align = "居中" }):set_text("Lv:0")
	local button          = accessoryUI.btn[i]
	button.index          = i
	button:event "进入" (AccessoryBtnEnterFunc)
	button:event "离开" (AccessoryBtnLeaveFunc)
end

--#endregion

function code.GetNewAccessory(playerID)
	-- 随机新武器id
	local accessoryID = notOwnedAccessory[playerID][common:GetRandomInt(1, #notOwnedAccessory[playerID])]
	myFunc:SetCustomValue(jass.gg_trg_GetAccessoryLua, "整数", "playerID", playerID)
	myFunc:SetCustomValue(jass.gg_trg_GetAccessoryLua, "整数", "accessoryID", accessoryID)
	common:RunTrigger(jass.gg_trg_GetAccessoryLua)
end

-- 一个添加新格子的函数, 当饰品已满时获得新饰品, 调用该函数
function Accessory:AddNewSlot(index)
	accessoryUI.frame[index]  = createUI:CreateUIRelative("image", accessoryUI.background, "中心", accessoryUI.background, "左侧", frameSize / 2 + (frameSize + 2) * (index - 1), 0, frameSize, frameSize,
		{ image = [[UI\Widgets\ToolTips\Human\human-tooltip-background.blp]] })
	accessoryUI.icon[index]   = createUI:CreateUIRelative("image", accessoryUI.frame[index], "中心", accessoryUI.frame[index], "中心", 0, 0, slotSize, slotSize, { image = [[StarRail\star_3.tga]], isShow = false })
	accessoryUI.btn[index]    = createUI:CreateUIRelative("button", accessoryUI.icon[index], "中心", accessoryUI.icon[index], "中心", 0, 0, slotSize, slotSize)
	accessoryUI.lvBg[index]   = createUI:CreateUIRelative("image", accessoryUI.icon[index], "右下", accessoryUI.icon[index], "右下", 0, 0, 30, 15,
		{ image = [[UI\Widgets\ToolTips\Human\human-tooltip-background.blp]], alpha = 0.9 })
	accessoryUI.lvText[index] = createUI:CreateUIRelative("text", accessoryUI.lvBg[index], "中心", accessoryUI.lvBg[index], "中心", 0, 0, 30, 0, { font = font, fontSize = 12, align = "居中" }):set_text("Lv:0")
	local button              = accessoryUI.btn[index]
	button.index              = index
	button:event "进入" (AccessoryBtnEnterFunc)
	button:event "离开" (AccessoryBtnLeaveFunc)
end

return Accessory
