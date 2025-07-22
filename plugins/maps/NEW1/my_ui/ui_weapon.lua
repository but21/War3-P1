local code = require "jass.code"
local jass = require "jass.common"
local japi = require "jass.japi"

local font = "fonts\\LXWK_Bold.ttf"

--- 玩家
local players = jass.udg_Player

local Module = require "my_base.base_module_manager"
local sequenceFrameImage = Module.Constant.sequenceFrameImage
local common = Module.Common
local imagePool = Module.ImagePool
local createUI = Module.UICreate
local excelSystem = Module.ExcelSystem
local weaponCurrentCount = jass.udg_WeaponCurrentCount
local myFunc = Module.MyFunc
local excel = excel
local tipDialogUp = Module.UITipDialog.tipDialogUp

---@class Weapon
local Weapon = {}
local weaponUI = {}
Weapon.ui = weaponUI

-- 未拥有的武器池
local _notOwnedWeapon = { {}, {}, {}, {} }
-- 已拥有的武器池
local _ownedWeapon = {}
for playerID, value in ipairs(jass.udg_Player) do
	_ownedWeapon[playerID] = {}
	for i = 1, #excel["兵器"] do
		_notOwnedWeapon[playerID][i] = i
	end
end

Weapon.ownedWeapon = _ownedWeapon


-- 存储武器等级哈希表
local _htWeaponLv = jass.udg_HTWeaponLv
-- 存储武器是否超限的哈希表
local _htWeaponIsCX = jass.udg_HTWeaponIsCX
-- 武器效果马甲单位
local _vsetUnit = jass.udg_VestUnit

--- 获得随机一个武器ID, 只能同步用
---@param playerID integer  玩家ID
---@return integer
function Weapon:GetWeapon(playerID)
	-- 确定是随机新武器还是升级/洗练武器
	local ty = common:GetRandomInt(1, 2)
	local weaponID = 0
	if weaponCurrentCount[playerID] >= 6 then
		ty = 2
	end
	if ty == 2 and #_ownedWeapon[playerID] > 0 then
		weaponID        = _ownedWeapon[playerID][common:GetRandomInt(1, #_ownedWeapon[playerID])]
		local condition = common:LoadInteger(_htWeaponLv, playerID, weaponID) < 9 or (common:LoadInteger(_htWeaponIsCX, playerID, weaponID) == 1)
		local count     = 0
		while not condition do
			weaponID  = _ownedWeapon[playerID][common:GetRandomInt(1, #_ownedWeapon[playerID])]
			condition = common:LoadInteger(_htWeaponLv, playerID, weaponID) < 9 or (common:LoadInteger(_htWeaponIsCX, playerID, weaponID) == 1)
			count     = count + 1
			if count >= 50 then
				condition = true
				weaponID = 0
			end
		end
	end
	if weaponID == 0 and weaponCurrentCount[playerID] < 6 then
		weaponID = _notOwnedWeapon[playerID][common:GetRandomInt(1, #_notOwnedWeapon[playerID])]
	end
	return weaponID
end

--- 移除指定武器ID, 只能同步用
---@param playerID integer  玩家ID
---@param weaponID integer  武器ID
function Weapon:RemoveWeapon(playerID, weaponID)
	for index, value in ipairs(_notOwnedWeapon[playerID]) do
		if value == weaponID then
			table.remove(_notOwnedWeapon[playerID], index)
			break
		end
	end
end

local _changeSize = 3
---设置武器UI
function code.SetWeaponUI(playerID, weaponID, index)
	if not weaponUI.frame[index] then
		Weapon:AddNewSlot(index)
	end
	-- 设置图标, 等级
	local icon = excelSystem:GetData("兵器", weaponID, "Icon")
	local lv = common:LoadInteger(_htWeaponLv, playerID, weaponID)
	if lv == 0 then
		-- 如果是第一次获得该武器, 从未拥有武器池中移除, 加入已有武器池
		Weapon:RemoveWeapon(playerID, weaponID)
		table.insert(_ownedWeapon[playerID], weaponID)
		if common:IsLocalPlayer(players[playerID]) then
			local image = imagePool:GetImage()
			image:set_point("中心", weaponUI.icon[index], "中心", -1, 153)
			local w, h = weaponUI.icon[index]:get_wh()
			local x, y = image:get_xy()
			image:set_show(true)
			image:set_image(icon)
			myFunc:FadeSize { UI = image, time = 0.3, startP = { w * _changeSize, h * _changeSize }, endP = { w, h }, ty = '二元入', complete = function()
				myFunc:FadePosition { UI = image, fUI = weaponUI.icon[index], time = 0.2, startP = { x, y }, endP = { x, y - 150 }, ty = '二元入', complete = function()
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
	end
	local text = "Lv:" .. lv
	if common:LoadInteger(_htWeaponIsCX, playerID, weaponID) == 1 then
		text = "MAX"
		-- 显示超限外框
		if common:IsLocalPlayer(players[playerID]) then
			weaponUI.cxFrame[index]:set_show(true)
			-- 播放序列帧
			local image = imagePool:GetImage()
			image:set_point("底部", weaponUI.icon[index], "底部", -20, 0)
			image:set_wh(159, 129)
			image:set_show(true)
			myFunc:SequenceFrame({
				UI = image,
				image = sequenceFrameImage.cx2,
				time = sequenceFrameImage.cx2.time,
				isLoop = false,
				complete = function()
					imagePool:RecycleImage(image)
				end
			})
		end
	elseif lv > 0 then
		-- 升级序列帧, 存储起来, 判断是否正在播放完成, 未播放完成则重置
		if common:IsLocalPlayer(players[playerID]) then
			if not weaponUI.icon[index].sequenceFrame or weaponUI.icon[index].sequenceFrame.P.complete then
				local image = imagePool:GetImage()
				image:set_point("中心", weaponUI.icon[index], "中心", 0, 0)
				local w, h = weaponUI.icon[index]:get_wh()
				image:set_wh(w * 2, h * 2)
				image:set_show(true)
				weaponUI.icon[index].sequenceFrame = myFunc:SequenceFrame({
					UI = image,
					image = sequenceFrameImage.lvUp,
					time = sequenceFrameImage.lvUp.time,
					isLoop = false,
					complete = function()
						imagePool:RecycleImage(image)
					end
				})
			else
				weaponUI.icon[index].sequenceFrame.nowT = 0
				-- 设置nowt为0
			end
		end
	end
	if common:IsLocalPlayer(players[playerID]) then
		weaponUI.frame[index]:set_show(true)
		weaponUI.icon[index]:set_show(true)
		weaponUI.icon[index]:set_image(icon)
		weaponUI.lvText[index]:set_text(text)
	end
end

-- 武器品质颜色字符串
local _qualityColor = { "|cff00ff00[C]|r", "|cff00acf5[B]|r", "|cffc400f5[A]|r", "|cffff0000[S]|r" }
-- 对应品质的概率
local _qualityPro = {}
for i = 1, 4 do
	_qualityPro[i] = {}
	_qualityPro[i] = { excel["概率"][1]["概率1"], excel["概率"][1]["概率2"], excel["概率"][1]["概率3"], excel["概率"][1]["概率4"] }
end
-- 获得的词条
local _ownedAttr = {}
for i = 1, 4 do
	_ownedAttr[i] = {}
end
---@type table<integer, table> 对应玩家对应武器拥有的词条
Weapon.ownedAttr = _ownedAttr

---随机武器词条
function code.RandomWeaponAttr(playerID, weaponID)
	local hero = jass.udg_Hero[playerID]
	local randomInt = common:GetRandomInt(1, 100)
	local quality = 1
	for i = 1, 4 do
		if randomInt <= _qualityPro[playerID][i] then
			quality = i
			break
		end
	end
	local randomAttrID = common:GetRandomInt(1, #excel["兵器随机词条"])
	local randomAttr = excel["兵器随机词条"][randomAttrID]["Name"]
	local minAttrVal = excel["兵器随机词条"][randomAttrID]["Value" .. quality]
	local maxAttrVal = excel["兵器随机词条"][randomAttrID]["Value" .. (quality + 4)]
	local randomAttrVal = tonumber(string.format("%.1f", common:GetRandomReal(minAttrVal, maxAttrVal)))
	local attrText = " " .. _qualityColor[quality] .. " " .. randomAttr .. "+" .. randomAttrVal
	if randomAttr:sub(-1) == '%' then
		attrText = " " .. _qualityColor[quality] .. " " .. randomAttr:gsub("%%", "") .. "+" .. randomAttrVal .. "%"
	end
	_ownedAttr[playerID][weaponID] = _ownedAttr[playerID][weaponID] or {}
	local length = #_ownedAttr[playerID][weaponID] + 1
	_ownedAttr[playerID][weaponID][length] = {}
	_ownedAttr[playerID][weaponID][length].attrName = randomAttr
	_ownedAttr[playerID][weaponID][length].attrValue = randomAttrVal
	_ownedAttr[playerID][weaponID][length].text = attrText
	code.SetUnitAttr_Ex_Str(hero, randomAttr, 0, randomAttrVal)

	-- table.insert(ownedAttr[playerID][uiIndex], attrText)
end

--#region 创建武器UI

-- 背景高
local _bgH = 65
-- 背景宽
local _bgW = _bgH * 6 - 2

-- 父控件
weaponUI.panel = createUI:CreateUIAbsolute("panel", gameui, "中心", 3, 407 - 37, 1, 1)
-- 背景
weaponUI.background = createUI:CreateUIRelative("image", weaponUI.panel, "左侧", weaponUI.panel, "中心", 0, 0, _bgW, _bgH, {
	image = [[UI\Widgets\ToolTips\Human\human-tooltip-background.blp]],
	alpha = 0.5
})

-- 底框大小
local _frameSize = _bgH - 2
-- 图标大小
local _slotSize = _bgH - 2

local function _WeaponBtnEnterFunc(btn)
	local playerID   = common:GetLocalPlayerID()
	local index      = btn.index
	local vestIndex  = index + 10 * playerID
	local weaponID   = myFunc:GetCustomValue(_vsetUnit[vestIndex], "整数", "WeaponID")
	local name       = excel["兵器"][weaponID]["Name"]
	local icon       = excel["兵器"][weaponID]["Icon"]
	local tips       = excel["兵器"][weaponID]["Tips"]
	local cxNeed     = excel["兵器"][weaponID]["超限需求"]
	local cxAddition = excel["兵器"][weaponID]["超限效果"]
	tips             = myFunc:SetNumColor(tips, "|cfaffff00", "|r")
	tips             = code.StringFormat1(tips)
	tips             = "|cff00f5a4[兵器效果]|r|n" .. tips .. "|cfaffff00" .. string.format("%0.1f", common:GetUnitState(_vsetUnit[vestIndex], "攻击间隔")) .. "|r秒"
	if common:LoadInteger(_htWeaponIsCX, playerID, weaponID) == 1 then
		name = name .. " |cff00ffff[已超限]|r"
		tips = tips .. "|n|n|cff00f5a4[超限效果]|r|n" .. myFunc:SetNumColor(cxAddition, "|cfaffff00", "|r")
	else
		tips = tips .. "|n|n|cff00f5a4[超限需求]|r|n" .. myFunc:SetNumColor(cxNeed, "|cfaffff00", "|r")
	end
	if _ownedAttr[playerID][weaponID] and #_ownedAttr[playerID][weaponID] > 0 then
		local attrStr = "|n|n|cff00f5a4[附魔]|r"
		for _, value in ipairs(_ownedAttr[playerID][weaponID]) do
			attrStr = attrStr .. "|n※" .. value.text
		end
		tips = tips .. attrStr
	end
	tips = tips .. "|n|n|cff00f5a4[注]|r|n|ca7848484" .. myFunc:SetNumColor(excel["兵器"][weaponID]["TipsEx"], "|cfaffff00", "|ca7848484")

	myFunc:FadeSize({ UI = weaponUI.icon[index], time = 0.1, startP = { _slotSize, _slotSize }, endP = { _slotSize * 1.1, _slotSize * 1.1 }, ty = "二元出" })

	tipDialogUp.icon:set_image(icon)
	tipDialogUp.icon:set_show(true)
	tipDialogUp.name:set_text(name)
	tipDialogUp.tips:set_text(tips)
	tipDialogUp.intro:set_text("|cff00ffff类别 - 兵器")
	tipDialogUp.panel:set_point2("中心", 415, 430)
	tipDialogUp.panel:set_show(true)
end

local function _WeaponBtnLeaveFunc(btn)
	local index = btn.index
	myFunc:FadeSize({ UI = weaponUI.icon[index], time = 0.1, startP = { _slotSize * 1.1, _slotSize * 1.1 }, endP = { _slotSize, _slotSize }, ty = "二元入" })
	tipDialogUp.panel:set_show(false)
end

-- local sequenceImage = {}
-- for i = 1, 13, 1 do
-- 	sequenceImage[i] = "Survival\\UI\\XLZ\\cx" .. i .. ".tga"
-- end
weaponUI.frame, weaponUI.icon, weaponUI.btn, weaponUI.lvBg, weaponUI.lvText = {}, {}, {}, {}, {}
weaponUI.cxFrame = {}
-- 底框, 图标, 右下小黑背景, 右下等级, 按钮, 进入高光/进入略微放大
for i = 1, 6 do
	weaponUI.frame[i]   = createUI:CreateUIRelative("image", weaponUI.background, "中心", weaponUI.background, "左侧", _frameSize / 2 + (_frameSize + 2) * (i - 1), 0, _frameSize, _frameSize,
		{ image = [[UI\Widgets\ToolTips\Human\human-tooltip-background.blp]] })
	weaponUI.icon[i]    = createUI:CreateUIRelative("image", weaponUI.frame[i], "中心", weaponUI.frame[i], "中心", 0, 0, _slotSize, _slotSize, { image = [[StarRail\star_3.tga]], isShow = false })
	weaponUI.btn[i]     = createUI:CreateUIRelative("button", weaponUI.icon[i], "中心", weaponUI.icon[i], "中心", 0, 0, _slotSize, _slotSize)
	weaponUI.cxFrame[i] = createUI:CreateUIRelative("image", weaponUI.frame[i], "中心", weaponUI.frame[i], "中心", 0, 0, _slotSize, _slotSize, {
		image = [[Survival\UI\Weapon\cxFrame.tga]], isShow = false })
	-- myFunc:SequenceFrame({ UI = weaponUI.cxFrame[i], time = 0.05, isLoop = true, image = sequenceImage })
	weaponUI.lvBg[i]    = createUI:CreateUIRelative("image", weaponUI.icon[i], "右下", weaponUI.icon[i], "右下", 0, 0, 30, 15, { image = [[UI\Widgets\ToolTips\Human\human-tooltip-background.blp]], alpha = 0.9 })
	weaponUI.lvText[i]  = createUI:CreateUIRelative("text", weaponUI.lvBg[i], "中心", weaponUI.lvBg[i], "中心", 0, 0, 30, 0, { font = font, fontSize = 12, align = "居中" }):set_text("Lv:0")
	local button        = weaponUI.btn[i]
	button.index        = i
	button:event "进入" (_WeaponBtnEnterFunc)
	button:event "离开" (_WeaponBtnLeaveFunc)
end

--#endregion


--#region 洗练附魔UI

-- 修改兵器附魔背景
weaponUI.selectBg = createUI:CreateUIAbsolute("image", gameui, "中心", 960, 700, 300, 110, { isShow = false, image = [[UI\Widgets\ToolTips\Human\human-tooltip-background.blp]] })
japi.FrameSetIgnoreTrackEvents(weaponUI.selectBg.handle, false)
-- 修改兵器附魔标题
weaponUI.selectTitle = createUI:CreateUIRelative("text", weaponUI.selectBg, "顶部", weaponUI.selectBg, "顶部", 0, -10, 300, 0, { font = font, fontSize = 25, align = "居中" }):set_text("修改兵器附魔")
local w, h           = 220, 40
-- 修改兵器附魔选项
weaponUI.optionBg    = {}
-- 修改兵器附魔文本
weaponUI.optionText  = {}
-- 修改兵器附魔按钮
weaponUI.optionBtn   = {}

-- 选择修改的兵器附魔
local function _SelectOne(btn)
	local weaponID = btn.weaponID
	local index = btn.index
	common:SendSync("ChangeWeaponEnchant", weaponID .. "|" .. index)
	weaponUI.selectBg:set_show(false)
end

common:ReceiveSync("ChangeWeaponEnchant")(function(data)
	local weaponID, index = data:match("(%d+)|(%d+)")
	weaponID = tonumber(weaponID)
	index = tonumber(index)
	local player = common:GetSyncPlayer()
	local playerID = common:ConvertPlayerToID(player)
	local hero = jass.udg_Hero[playerID]
	local attrName = _ownedAttr[playerID][weaponID][index].attrName
	local attrValue = _ownedAttr[playerID][weaponID][index].attrValue
	code.SetUnitAttr_Ex_Str(jass.udg_Hero[playerID], attrName, 1, attrValue)
	local randomInt = common:GetRandomInt(1, 100)
	local quality = 1
	for i = 1, 4 do
		if randomInt <= _qualityPro[playerID][i] then
			quality = i
			break
		end
	end
	local randomAttrID = common:GetRandomInt(1, #excel["兵器随机词条"])
	local randomAttr = excel["兵器随机词条"][randomAttrID]["Name"]
	local minAttrVal = excel["兵器随机词条"][randomAttrID]["Value" .. quality]
	local maxAttrVal = excel["兵器随机词条"][randomAttrID]["Value" .. (quality + 4)]
	local randomAttrVal = tonumber(string.format("%.1f", common:GetRandomReal(minAttrVal, maxAttrVal)))
	local attrText = " " .. _qualityColor[quality] .. " " .. randomAttr .. "+" .. randomAttrVal
	if randomAttr:sub(-1) == '%' then
		attrText = " " .. _qualityColor[quality] .. " " .. randomAttr:gsub("%%", "") .. "+" .. randomAttrVal .. "%"
	end
	_ownedAttr[playerID][weaponID][index].attrName = randomAttr
	_ownedAttr[playerID][weaponID][index].attrValue = randomAttrVal
	_ownedAttr[playerID][weaponID][index].text = attrText
	code.SetUnitAttr_Ex_Str(hero, randomAttr, 0, randomAttrVal)

	code.AddMessage(playerID, "洗练附魔词条:" .. attrText)
end)

for i = 1, 5 do
	weaponUI.optionBg[i] = createUI:CreateUIRelative("image", weaponUI.selectBg, "顶部", weaponUI.selectTitle, "底部", 0, -20 - (i - 1) * (h + 15), w, h,
		{ isShow = false, image = [[Survival\UI\SelectOne\optionsBg.tga]] })
	weaponUI.optionText[i] = createUI:CreateUIRelative("text", weaponUI.optionBg[i], "中心", weaponUI.optionBg[i], "中心", 0, 0, w, 0, { font = font, fontSize = 18, align = "居中" })
	weaponUI.optionBtn[i] = createUI:CreateUIRelative("button", weaponUI.optionBg[i], "中心", weaponUI.optionBg[i], "中心", 0, 0, w, h)
	weaponUI.optionBtn[i].index = i
	weaponUI.optionBtn[i].weaponID = 0
	weaponUI.optionBtn[i]:event "点击" (_SelectOne)
end

--#endregion

-- 初始可以清怪的武器id
local _originWeapon = { 1, 14, 16, 17 }
-- 获得初始武器(防止初始刷不了怪)
function code.GetOriginWeapon(playerID)
	local weaponID = _originWeapon[common:GetRandomInt(1, #_originWeapon)]
	if common:IsLocalPlayer(players[playerID]) then
		common:SendSync("GetWeapon", weaponID)
	end
end

-- 修改武器词条
function code.ChangeWeaponEnchant(playerID, weaponID)
	-- 按下f的时候需要判断选择词条是否显示, 显示则提示完成当前选项
	-- 直接设置文本, 然后显示	
	if common:IsLocalPlayer(players[playerID]) then
		for index, ui in ipairs(weaponUI.optionBg) do
			if index <= #_ownedAttr[playerID][weaponID] then
				weaponUI.optionText[index]:set_text(_ownedAttr[playerID][weaponID][index].text)
				weaponUI.optionBg[index]:set_show(true)
				weaponUI.optionBtn[index].weaponID = weaponID
			else
				weaponUI.optionBg[index]:set_show(false)
				weaponUI.optionBtn[index].weaponID = 0
			end
		end
		weaponUI.selectBg:set_wh(300, 70 + #_ownedAttr[playerID][weaponID] * 55)
		weaponUI.selectBg:set_show(true)
	end
end

-- 获得新武器
function code.GetNewWeapon(playerID)
	-- 随机新武器id
	local weaponID = _notOwnedWeapon[playerID][common:GetRandomInt(1, #_notOwnedWeapon[playerID])]
	myFunc:SetCustomValue(jass.gg_trg_GetWeaponLua, "整数", "playerID", playerID)
	myFunc:SetCustomValue(jass.gg_trg_GetWeaponLua, "整数", "weaponID", weaponID)
	common:RunTrigger(jass.gg_trg_GetWeaponLua)
end

-- 一个添加新格子的函数, 当装备已满时获得新装备, 调用该函数
function Weapon:AddNewSlot(index)
	-- 创建对应的UI, 图标, 等级, btn
	weaponUI.frame[index]   = createUI:CreateUIRelative("image", weaponUI.background, "中心", weaponUI.background, "左侧", _frameSize / 2 + (_frameSize + 2) * (index - 1), 0, _frameSize, _frameSize,
		{ image = [[UI\Widgets\ToolTips\Human\human-tooltip-background.blp]] })
	weaponUI.icon[index]    = createUI:CreateUIRelative("image", weaponUI.frame[index], "中心", weaponUI.frame[index], "中心", 0, 0, _slotSize, _slotSize, { image = [[StarRail\star_3.tga]], isShow = false })
	weaponUI.btn[index]     = createUI:CreateUIRelative("button", weaponUI.icon[index], "中心", weaponUI.icon[index], "中心", 0, 0, _slotSize, _slotSize)
	weaponUI.lvBg[index]    = createUI:CreateUIRelative("image", weaponUI.icon[index], "右下", weaponUI.icon[index], "右下", 0, 0, 30, 15,
		{ image = [[UI\Widgets\ToolTips\Human\human-tooltip-background.blp]], alpha = 0.9 })
	weaponUI.lvText[index]  = createUI:CreateUIRelative("text", weaponUI.lvBg[index], "中心", weaponUI.lvBg[index], "中心", 0, 0, 30, 0, { font = font, fontSize = 12, align = "居中" }):set_text("Lv:0")
	local button            = weaponUI.btn[index]
	weaponUI.cxFrame[index] = createUI:CreateUIRelative("image", weaponUI.frame[index], "中心", weaponUI.frame[index], "中心", 0, 0, _slotSize, _slotSize, {
		image = [[Survival\UI\Weapon\cxFrame.tga]], isShow = false
	})
	button.index            = index
	button:event "进入" (_WeaponBtnEnterFunc)
	button:event "离开" (_WeaponBtnLeaveFunc)
end

return Weapon
