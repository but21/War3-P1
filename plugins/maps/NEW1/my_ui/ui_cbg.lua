local code = require "jass.code"
local jass = require "jass.common"
local japi = require "jass.japi"

local Cbg  = {}

---@param weapon Weapon
---@param accessory Accessory
---@param selectOne SelectOne
function Cbg:Init(weapon, accessory, selectOne)
	local ownedWeapon        = weapon.ownedWeapon
	local ownedAccessory     = accessory.ownedAccessory
	local selectOneUI        = selectOne

	local Module             = require "my_base.base_module_manager"
	local sequenceFrameImage = Module.Constant.sequenceFrameImage
	local imagePool          = Module.ImagePool
	local font               = "fonts\\LXWK_Bold.ttf"
	local common             = Module.Common
	local UI                 = Module.UICreate
	local tipDialogUp        = Module.UITipDialog.tipDialogUp
	local myFunc             = Module.MyFunc
	local cbgCount           = jass.udg_CBGCount
	-- 是否正在开启藏兵阁(异步)
	local inOpenCbg          = false

	local cbgUI              = {}
	Cbg.ui                   = cbgUI

	cbgUI.panel              = UI:CreateUIAbsolute("panel", gameui, "中心", 1485, 125, 1, 1)
	local _iconW, _iconH     = 70, 70
	cbgUI.background         = UI:CreateUIRelative("image", cbgUI.panel, "中心", cbgUI.panel, "中心", 0, 0, _iconW, _iconH, { image = [[Survival\UI\cbg.blp]] })
	cbgUI.btn                = UI:CreateUIRelative("button", cbgUI.background, "中心", cbgUI.background, "中心", 0, 0, _iconW, _iconH)
	cbgUI.countBg            = UI:CreateUIRelative("image", cbgUI.background, "右下", cbgUI.background, "右下", 0, 0, 15, 15,
		{ image = [[UI\Widgets\ToolTips\Human\human-tooltip-background.blp]], alpha = 0.9 })
	cbgUI.countText          = UI:CreateUIRelative("text", cbgUI.countBg, "中心", cbgUI.countBg, "中心", 0, 0, 30, 0, { font = font, fontSize = 15, align = "居中" }):set_text("0")

	cbgUI.btn:event "进入" (function()
		local tip = "开启藏兵阁会获得不同品质的奖励，同时使随机兵器等级+1，当随机到的兵器满足超限条件时，兵器会进行超限。"
		local tip2 = "|n|n品质越高，随机兵器等级+1的次数越多，最多可提升3次。"
		tip = myFunc:SetNumColor(tip, "|cfaffff00", "|r")
		tip2 = "|ca7848484" .. myFunc:SetNumColor(tip2, "|cfaffff00", "|ca7848484")
		tipDialogUp.name:set_text("藏兵阁")
		tipDialogUp.tips:set_text(tip .. tip2)
		tipDialogUp.intro:set_text("|cff00ffff类别 - 强化")
		tipDialogUp.icon:set_image(cbgUI.background.image)
		tipDialogUp.panel:reset_allpoint()
		tipDialogUp.panel:set_point2("中心", 1900, 284)
		tipDialogUp.panel:set_show(true)
	end)
	cbgUI.btn:event "离开" (function()
		tipDialogUp.panel:set_show(false)
	end)
	cbgUI.btn:event "点击" (function()
		local playerID = common:GetLocalPlayerID()
		if cbgCount[playerID] > 0 then
			if selectOneUI.ui.background._show then
				code.AddMessage(playerID, "|cffff0000请先完成当前升级奖励的选择")
			else
				if not inOpenCbg then
					common:SendSync("OpenCBG")
					local image = imagePool:GetImage()
					local w, h  = cbgUI.background:get_wh()
					image:set_point("中心", cbgUI.background, "中心", 0, 0)
					image:set_wh(w, h)
					image:set_show(true)
					cbgUI.background.sequenceFrame = myFunc:SequenceFrame({
						UI = image,
						image = sequenceFrameImage.click,
						time = sequenceFrameImage.click.time,
						isLoop = false,
						complete = function()
							imagePool:RecycleImage(image)
						end
					})
					myFunc:ButtonShake({ UI = cbgUI.background })
					-- cbgUI.btn:set_show(false)
					inOpenCbg = true
				end
			end
		end
	end)

	local qualityPro = {}
	local qualityProID = 3
	for i = 1, 4 do
		qualityPro[i] = {}
		qualityPro[i] = { excel["概率"][qualityProID]["概率1"], excel["概率"][qualityProID]["概率2"], excel["概率"][qualityProID]["概率3"] }
	end
	common:ReceiveSync("OpenCBG")(function()
		local player = common:GetSyncPlayer()
		local playerID = common:ConvertPlayerToID(player)
		jass.udg_CBGCount[playerID] = jass.udg_CBGCount[playerID] - 1

		local randomInt = common:GetRandomInt(1, 100)
		local quality = 1
		for i = 1, #qualityPro[playerID] do
			if randomInt <= qualityPro[playerID][i] then
				quality = i
				break
			end
		end
		local playerAccessory = {}
		for index, value in ipairs(ownedAccessory[playerID]) do
			playerAccessory[value] = 1
		end
		for i = 1, quality do
			local loopCount = 0
			local condition = false
			local ranWeaponID = ownedWeapon[playerID][common:GetRandomInt(1, #ownedWeapon[playerID])]
			if common:LoadInteger(jass.udg_HTWeaponIsCX, playerID, ranWeaponID) == 1 then
				-- 已超限
				condition = true
			else
				if common:LoadInteger(jass.udg_HTWeaponLv, playerID, ranWeaponID) == 9 then
					-- 已满级, 判断是否有饰品
					local needAccessory = myFunc:Split(excel["兵器"][ranWeaponID]["饰品ID"], ",")
					for index, value in ipairs(needAccessory) do
						if not playerAccessory[value] then
							condition = true
							break
						end
					end
				end
			end

			while condition do
				condition = false
				ranWeaponID = ownedWeapon[playerID][common:GetRandomInt(1, #ownedWeapon[playerID])]
				if common:LoadInteger(jass.udg_HTWeaponIsCX, playerID, ranWeaponID) == 1 then
					-- 已超限
					condition = true
				else
					if common:LoadInteger(jass.udg_HTWeaponLv, playerID, ranWeaponID) == 9 then
						-- 已满级, 判断是否有饰品
						local needAccessory = myFunc:Split(excel["兵器"][ranWeaponID]["饰品ID"], ",")
						for index, value in ipairs(needAccessory) do
							if not playerAccessory[value] then
								condition = true
								break
							end
						end
					end
				end
				loopCount = loopCount + 1
				if loopCount > 20 then
					condition = false
				end
			end

			if loopCount <= 20 then
				if i == 1 then
					local gold = excel["其它"][4]["Value" .. 3 + quality] * quality
					code.AddMessage(playerID, "开启藏兵阁|cfff43232<" .. quality .. ">|r层，获得|cfaffff00金币" .. gold)
					jass.udg_PlayerGold[playerID] = jass.udg_PlayerGold[playerID] + gold
				end
				-- 运行获得武器的触发
				myFunc:SetCustomValue(jass.gg_trg_GetWeaponLua, "整数", "playerID", playerID)
				myFunc:SetCustomValue(jass.gg_trg_GetWeaponLua, "整数", "weaponID", ranWeaponID)
				common:RunTrigger(jass.gg_trg_GetWeaponLua)
			else
				local gold = excel["其它"][4]["Value" .. 3 + quality] * 2 * (quality - i + 1)
				code.AddMessage(playerID, "开启藏兵阁|cfff43232<" .. quality .. ">|r层，没有满足条件的兵器，补偿|cfaffff00金币" .. gold)
				jass.udg_PlayerGold[playerID] = jass.udg_PlayerGold[playerID] + gold
				break
			end
		end

		if common:IsLocalPlayer(player) then
			-- cbgUI.btn:set_show(true)
			inOpenCbg = false
		end
	end)

	local function RefreshCount()
		for playerID, player in ipairs(jass.udg_Player) do
			if common:IsLocalPlayer(player) then
				cbgUI.countText:set_text(jass.udg_CBGCount[playerID])
			end
		end
	end

	ac.time(0.5, RefreshCount)
end

return Cbg
