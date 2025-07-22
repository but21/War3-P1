local code = require "jass.code"
local jass = require "jass.common"
local japi = require "jass.japi"


---@class SelectOne
local SelectOne = {}

---@param weapon Weapon
---@param accessory Accessory
function SelectOne:Init(weapon, accessory)
	local selectOneUI = {}
	SelectOne.ui = selectOneUI
	local Module = require "my_base.base_module_manager"
	local sequenceFrameImage = Module.Constant.sequenceFrameImage
	local imagePool = Module.ImagePool
	local createUI = Module.UICreate
	local myFunc = Module.MyFunc
	local font = "fonts\\LXWK_Bold.ttf"
	local selectOneCount = jass.udg_SelectOneCount
	local common = Module.Common
	local attrSystem = Module.AttrSystem
	local tipDialogDown = Module.UITipDialog.tipDialogDown
	local tipDialogUp = Module.UITipDialog.tipDialogUp
	local tipOnlyTextUp = Module.UITipDialog.tipOnlyTextUp
	-- local weapon = require "my_ui.ui_weapon"
	-- local accessory = require "my_ui.ui_accessory"

	-- 存储武器是否超限的哈希表
	local htWeaponIsCX = jass.udg_HTWeaponIsCX

	local inSeleceOne = false

	local _openBgW, _openBgH = 70, 70
	-- 开启选择背景
	selectOneUI.openSelectIcon = createUI:CreateUIAbsolute("image", gameui, "中心", 1485, 205, _openBgW, _openBgH, { image = [[Survival\UI\SelectOne\selectIcon.blp]] })
	-- 开启选择按钮
	selectOneUI.openSelectBtn = createUI:CreateUIRelative("button", selectOneUI.openSelectIcon, "中心", selectOneUI.openSelectIcon, "中心", 0, 0, _openBgW, _openBgH)

	selectOneUI.openSelectBtn:event "进入" (function()
		-- myFunc:FadeSize({ UI = selectOneUI.openSelectIcon, time = 0.1, startP = { w, h }, endP = { w * 1.1, h * 1.1 }, ty = "二元出" })
		tipDialogUp.name:set_text("升级奖励(|cffffcc00F|r)")
		tipDialogUp.icon:set_image(selectOneUI.openSelectIcon.image)
		tipDialogUp.tips:set_text("获得奖励多选一，随机出现兵器、饰品。|n|n|ca7848484每次升级可获得一次选择次数|n按下F快捷使用")
		tipDialogUp.intro:set_text("|cff00ffff类别 - 强化")
		tipDialogUp.panel:reset_allpoint()
		tipDialogUp.panel:set_point2("中心", 1900, 284)
		tipDialogUp.panel:set_show(true)
	end)
	selectOneUI.openSelectBtn:event "离开" (function()
		-- myFunc:FadeSize({ UI = selectOneUI.openSelectIcon, time = 0.1, startP = { w * 1.1, h * 1.1 }, endP = { w, h }, ty = "二元出" })
		tipDialogUp.panel:set_show(false)
	end)
	selectOneUI.openSelectBtn:event "点击" (function()
		local playerID = common:GetLocalPlayerID()
		if not inSeleceOne and selectOneCount[playerID] > 0 and not weapon.ui.selectBg._show then
			inSeleceOne = true
			common:SendSync("OpenSelectOne", 0)
			local image = imagePool:GetImage()
			local w, h  = selectOneUI.openSelectIcon:get_wh()
			image:set_point("中心", selectOneUI.openSelectIcon, "中心", 0, 0)
			image:set_wh(w, h)
			image:set_show(true)
			selectOneUI.openSelectIcon.sequenceFrame = myFunc:SequenceFrame({
				UI = image,
				image = sequenceFrameImage.click,
				time = sequenceFrameImage.click.time,
				isLoop = false,
				complete = function()
					imagePool:RecycleImage(image)
				end
			})
			myFunc:ButtonShake({ UI = selectOneUI.openSelectIcon })
		end
	end)

	-- 选项内容(类别, id)
	local optionsContent = {}
	for playerID, player in ipairs(jass.udg_Player) do
		optionsContent[playerID] = {}
		for i = 1, 4 do
			optionsContent[playerID][i] = {}
		end
	end
	common:ReceiveSync("OpenSelectOne")(function(val)
		local player = common:GetSyncPlayer()
		local playerID = common:ConvertPlayerToID(player)
		if val ~= 1 then
			selectOneCount[playerID] = selectOneCount[playerID] - 1
		end
		local hero = jass.udg_Hero[playerID]
		-- 根据运气决定是否开启第四个选项
		local luck = attrSystem:GetObjAttrFromStr(hero, "运气")
		local luckRate = luck / (100 + luck) * 100
		local optionsCount = 3
		if common:GetRandomInt(1, 100) <= luckRate then
			optionsCount = optionsCount + 1
			if common:IsLocalPlayer(player) then
				selectOneUI.optionsBtn[4]:set_show(true)
			end
		else
			if common:IsLocalPlayer(player) then
				selectOneUI.optionsName[4]:set_text("未开启")
				selectOneUI.optionsTip[4]:set_text("提升运气，有几率增加至四个选项")
				selectOneUI.optionsBtn[4]:set_show(false)
			end
		end
		-- 随机选项内容
		if common:IsLocalPlayer(player) then
			selectOneUI.background:set_show(true)
		end
		for i = 1, optionsCount do
			if i == 1 then
				-- 固定为金币 / 经验(1是金币, 2是经验)
				optionsContent[playerID][i].id = common:GetRandomInt(1, 1)
				optionsContent[playerID][i].type = "保底奖励"
			else
				-- 随机奖励(1是兵器, 2是饰品)
				local ty = common:GetRandomInt(1, 2)
				local id = 0
				local ranCount = 0
				local condition = true

				repeat
					condition = false
					if ty == 1 then
						id = weapon:GetWeapon(playerID)
						if id == 0 then
							ty = 2 -- 如果没有找到兵器，则尝试饰品
							condition = true
						end
					elseif ty == 2 then
						id = accessory:GetAccessory(playerID)
						if id == 0 then
							ty = 1 -- 如果没有找到饰品，则尝试兵器
							condition = true
						end
					end

					if id > 0 then
						-- 检查去重
						for j = 2, i - 1 do
							if (ty == 1 and optionsContent[playerID][j].type == "兵器" and optionsContent[playerID][j].id == id) or
								(ty == 2 and optionsContent[playerID][j].type == "饰品" and optionsContent[playerID][j].id == id) then
								condition = true
								break
							end
						end
					end

					ranCount = ranCount + 1

					if ranCount > 15 and condition then
						ty = ty == 1 and 2 or 1
					end

					-- 限制循环次数避免死循环
					if ranCount > 30 then
						condition = false
					end
				until not condition

				if ranCount > 30 then
					-- 强制设置为保底奖励
					optionsContent[playerID][i].id = 1
					optionsContent[playerID][i].type = "保底奖励"
				else
					optionsContent[playerID][i].id = id
					optionsContent[playerID][i].type = (ty == 1) and "兵器" or "饰品"
				end
			end
			-- 设置UI
			if common:IsLocalPlayer(player) then
				local type = optionsContent[playerID][i].type
				local id = optionsContent[playerID][i].id
				local name = ""
				local tip = ""
				if type == "保底奖励" then
					if id == 1 then
						name = "金币+1000"
					end
					if i == 1 then
						tip = "选项1固定为金币+1000"
					else
						tip = "无更多可用选项"
					end
				else
					name = "[" .. type .. "] " .. excel[type][id]["Name"]
					if type == "兵器" then
						-- 未拥有, 升级, 洗练附魔词条
						if common:LoadInteger(jass.udg_HTWeaponIsCX, playerID, id) == 1 then
							name = name .. " (已超限)"
							tip = "可选择更换某一条附魔"
						else
							local notOwned = true
							for j = 1, jass.udg_WeaponCurrentCount[playerID] do
								if myFunc:GetCustomValue(jass.udg_VestUnit[10 * playerID + j], "整数", "WeaponID") == id then
									notOwned = false
									break
								end
							end
							if notOwned then
								name = name .. " (新)"
								tip = "获得新兵器"
							else
								local lv = common:LoadInteger(jass.udg_HTWeaponLv, playerID, id)
								name = name .. " (Lv: " .. lv .. ")"
								tip = excel["兵器"][id][lv + 1 .. "级效果"]
							end
						end
					else
						-- 未拥有, 升级
						if common:LoadInteger(jass.udg_HTAccessoryLv, playerID, id) > 0 then
							local lv = common:LoadInteger(jass.udg_HTAccessoryLv, playerID, id)
							name = name .. " (Lv: " .. lv .. ")"
							tip = excel["饰品"][id][lv + 1 .. "级效果"]
						else
							name = name .. " (新)"
							tip = excel["饰品"][id]["1级效果"]
						end
					end
				end
				selectOneUI.optionsName[i]:set_text(name)
				selectOneUI.optionsTip[i]:set_text(tip)
			end
		end
	end)


	-- 选择次数UI
	selectOneUI.openCountBg   = createUI:CreateUIRelative("image", selectOneUI.openSelectIcon, "右下", selectOneUI.openSelectIcon, "右下", -2, 2, 15, 15,
		{ image = [[UI\Widgets\ToolTips\Human\human-tooltip-background.blp]], alpha = 0 })
	selectOneUI.openCountText = createUI:CreateUIRelative("text", selectOneUI.openCountBg, "中心", selectOneUI.openCountBg, "中心", 0, 0, 30, 0, { font = font, fontSize = 15, align = "居中" })
		:set_text("0")


	-- 背景和标题
	selectOneUI.background = createUI:CreateUIAbsolute("image", gameui, "中心", 960, 680, 400, 500, { image = "Survival\\UI\\SelectOne\\bg.tga", isShow = false })
	japi.FrameSetIgnoreTrackEvents(selectOneUI.background.handle, false)
	selectOneUI.title = createUI:CreateUIRelative("text", selectOneUI.background, "顶部", selectOneUI.background, "顶部", 0, -20, 400, 0, { font = font, fontSize = 25, align = "居中" }):set_text("选 择 奖 励")

	-- 进入选项按钮
	local function optionsBtnEnter(btn)
		local index = btn.index
		tipDialogDown.panel:reset_allpoint()
		local playerID = common:GetLocalPlayerID()
		local type = optionsContent[playerID][index].type
		if type == "兵器" then
			local weaponID   = optionsContent[playerID][index].id
			local name       = excel["兵器"][weaponID]["Name"]
			local icon       = excel["兵器"][weaponID]["Icon"]
			local tips       = excel["兵器"][weaponID]["Tips"]
			local cxNeed     = excel["兵器"][weaponID]["超限需求"]
			local cxAddition = excel["兵器"][weaponID]["超限效果"]
			tips             = myFunc:SetNumColor(tips, "|cfaffff00", "|r")
			tips             = code.StringFormat1(tips)
			tips             = "|cff00f5a4[兵器效果]|r|n" .. tips .. string.format("%0.1f", excel["兵器"][weaponID]["触发间隔"]) .. "秒"
			if common:LoadInteger(htWeaponIsCX, playerID, weaponID) == 1 then
				name = name .. " |cff00ffff[已超限]|r"
				tips = tips .. "|n|n|cff00f5a4[超限效果]|r|n" .. myFunc:SetNumColor(cxAddition, "|cfaffff00", "|r")
			else
				tips = tips .. "|n|n|cff00f5a4[超限需求]|r|n" .. myFunc:SetNumColor(cxNeed, "|cfaffff00", "|r")
			end
			if weapon.ownedAttr[playerID][weaponID] and #weapon.ownedAttr[playerID][weaponID] > 0 then
				local attrStr = "|n|n|cff00f5a4[附魔]|r"
				for _, value in ipairs(weapon.ownedAttr[playerID][weaponID]) do
					attrStr = attrStr .. "|n※" .. value.text
				end
				tips = tips .. attrStr
			end
			tips = tips .. "|n|n|cff00f5a4[注]|r|n|ca7848484" .. myFunc:SetNumColor(excel["兵器"][weaponID]["TipsEx"], "|cfaffff00", "|ca7848484")
			tipDialogDown.name:set_text(name)
			tipDialogDown.icon:set_image(icon)
			tipDialogDown.tips:set_text(tips)
			tipDialogDown.panel:reset_allpoint()
			tipDialogDown.intro:set_text("|cff00ffff类别 - 兵器")
			tipDialogDown.panel:set_point("左上", btn, "右上", 12, -12)
			tipDialogDown.panel:set_show(true)
		else
			if type == "饰品" then
				local accessoryID = optionsContent[playerID][index].id
				local name        = excel["饰品"][accessoryID]["Name"]
				local icon        = excel["饰品"][accessoryID]["Icon"]
				local tips        = excel["饰品"][accessoryID]["TipsEx"]
				tipDialogDown.name:set_text(name)
				tipDialogDown.icon:set_image(icon)
				tipDialogDown.tips:set_text(tips)
				tipDialogDown.panel:reset_allpoint()
				tipDialogDown.intro:set_text("|cff00ffff类别 - 饰品")
				tipDialogDown.panel:set_point("左上", btn, "右上", 12, -12)
				tipDialogDown.panel:set_show(true)
			end
		end
	end

	-- 离开选项按钮
	local function optionsBtnLeave(btn)
		tipDialogDown.panel:set_show(false)
		tipDialogDown.panel:reset_allpoint()
	end

	-- 点击选项按钮
	local function optionsBtnClick(btn)
		local index = btn.index
		local playerID = common:GetLocalPlayerID()
		local type = optionsContent[playerID][index].type
		local id = optionsContent[playerID][index].id
		if type == "兵器" then
			common:SendSync("GetWeapon", id)
		end
		if type == "饰品" then
			common:SendSync("GetAccessory", id)
		end
		common:SendSync("SelectOne", index)
		selectOneUI.background:set_show(false)
	end

	common:ReceiveSync("SelectOne")(function(index)
		local player = common:GetSyncPlayer()
		local playerID = common:ConvertPlayerToID(player)
		local type = optionsContent[playerID][index].type
		local id = optionsContent[playerID][index].id
		if type == "保底奖励" then
			if id == 1 then
				-- 加金币
				jass.udg_PlayerGold[playerID] = jass.udg_PlayerGold[playerID] + 1000
			end
		end
		if common:IsLocalPlayer(player) then
			inSeleceOne = false
		end
	end)

	-- 创建四个选项
	local optionW = 300
	local optionH = 80
	selectOneUI.optionsBg = {}
	selectOneUI.optionsBtn = {}
	selectOneUI.optionsName = {}
	selectOneUI.optionsTip = {}
	for i = 1, 4 do
		selectOneUI.optionsBg[i] = createUI:CreateUIRelative("image", selectOneUI.title, "顶部", selectOneUI.title, "底部", 0, -20 - (i - 1) * (optionH + 15), optionW, optionH,
			{ image = "Survival\\UI\\SelectOne\\btn.tga" })
		selectOneUI.optionsBtn[i] = createUI:CreateUIRelative("button", selectOneUI.optionsBg[i], "中心", selectOneUI.optionsBg[i], "中心", 0, 0, optionW, optionH)
		selectOneUI.optionsBtn[i].index = i
		selectOneUI.optionsBtn[i]:event "进入" (optionsBtnEnter)
		selectOneUI.optionsBtn[i]:event "离开" (optionsBtnLeave)
		selectOneUI.optionsBtn[i]:event "点击" (optionsBtnClick)
		selectOneUI.optionsName[i] = createUI:CreateUIRelative("text", selectOneUI.optionsBg[i], "顶部", selectOneUI.optionsBg[i], "顶部", 0, -20, optionW, 0, { font = font, fontSize = 20, align = "居中" })
		selectOneUI.optionsName[i]:set_text("选项" .. i)
		selectOneUI.optionsTip[i] = createUI:CreateUIRelative("text", selectOneUI.optionsName[i], "顶部", selectOneUI.optionsName[i], "底部", 0, -15, optionW, 0, { font = font, fontSize = 15, align = "居中" })
		selectOneUI.optionsTip[i]:set_text("提示" .. i)
	end

	-- 背景, 按钮, 文本
	local refreshW = 100
	local refreshH = 50
	selectOneUI.refreshBg = createUI:CreateUIRelative("image", selectOneUI.background, "顶部", selectOneUI.background, "底部", 0, -10, refreshW, refreshH, { image = [[Survival\UI\refresh.tga]] })
	selectOneUI.refreshBtn = createUI:CreateUIRelative("button", selectOneUI.refreshBg, "中心", selectOneUI.refreshBg, "中心", 0, 0, refreshW, refreshH)
	selectOneUI.refreshText = createUI:CreateUIRelative("text", selectOneUI.refreshBg, "中心", selectOneUI.refreshBg, "中心", 0, 0, refreshW, 0, { font = font, fontSize = 18, align = "居中" })
	-- selectOneUI.refreshText:set_text("刷新")
	local function EnterRefreshBtn(btn)
		tipOnlyTextUp.tips:set_text("点击消耗|cfaffff00100|r钻石刷新")
		tipOnlyTextUp.panel:reset_allpoint()
		tipOnlyTextUp.panel:set_point("中心", btn, "右下", 20, 20)
		tipOnlyTextUp.panel:set_show(true)
	end
	local function LeaveRefreshBtn()
		tipOnlyTextUp.panel:set_show(false)
	end
	local function ClickRefreshBtn()
		local playerID = common:GetLocalPlayerID()
		if jass.udg_PlayerDiamond[playerID] >= 100 then
			common:SendSync("OpenSelectOne", 1)
			common:SendSync("ReduceDiamond", 100)
		else
			code.AddMessage(playerID, "|cffff0000钻石不足")
		end
	end
	local function ReduceDiamondSync(val)
		local player = common:GetSyncPlayer()
		local playerID = common:ConvertPlayerToID(player)
		jass.udg_PlayerDiamond[playerID] = jass.udg_PlayerDiamond[playerID] - val
	end
	common:ReceiveSync("ReduceDiamond")(ReduceDiamondSync)
	selectOneUI.refreshBtn:event "进入" (EnterRefreshBtn)
	selectOneUI.refreshBtn:event "离开" (LeaveRefreshBtn)
	selectOneUI.refreshBtn:event "点击" (ClickRefreshBtn)



	-- 刷新选择次数UI
	local function RefreshCount()
		for playerID, player in ipairs(jass.udg_Player) do
			if common:IsLocalPlayer(player) then
				selectOneUI.openCountText:set_text(selectOneCount[playerID])
			end
		end
	end

	ac.time(0.5, RefreshCount)

	-- 按下F键进行选择
	function code.PressKeyF(playerID)
		local player = jass.udg_Player[playerID]
		if common:IsLocalPlayer(player) then
			if not inSeleceOne and selectOneCount[playerID] > 0 and not weapon.ui.selectBg._show then
				inSeleceOne = true
				local image = imagePool:GetImage()
				local w, h  = selectOneUI.openSelectIcon:get_wh()
				image:set_point("中心", selectOneUI.openSelectIcon, "中心", 0, 0)
				image:set_wh(w, h)
				image:set_show(true)
				selectOneUI.openSelectIcon.sequenceFrame = myFunc:SequenceFrame({
					UI = image,
					image = sequenceFrameImage.click,
					time = sequenceFrameImage.click.time,
					isLoop = false,
					complete = function()
						imagePool:RecycleImage(image)
					end
				})
				myFunc:ButtonShake({ UI = selectOneUI.openSelectIcon })
				common:SendSync("OpenSelectOne", 0)
			end
		end
	end
end

return SelectOne
