local code = require "jass.code"
local jass = require "jass.common"
local japi = require "jass.japi"

local Module = require "my_base.base_module_manager"
local common = Module.Common
local myFunc = Module.MyFunc
local createUI = Module.UICreate
local tipDialogDown = Module.UITipDialog.tipDialogDown
local tipDialogUp = Module.UITipDialog.tipDialogUp
local font = "fonts\\LXWK_Bold.ttf"
local tipOnlyTextDown = Module.UITipDialog.tipOnlyTextDown

local talentUI = {}
local Talent = {}
Talent.ui = talentUI
local excel = excel

-- 未拥有通用天赋
local notOwnedNormalTalent = {}
-- 已拥有通用天赋
local ownedNormalTalent = {}
-- 已拥有专精天赋
local ownedSpTalent = {}
-- 未拥有专精天赋
local notOwnedSpTalent = {}
-- 专精天赋随机的id
local ranSpTalentID = {}
-- 是否正在选择专精天赋
local inSelecting = false
-- 是否正在进行专精挑战
local inChallenge = false


for playerID, _ in ipairs(jass.udg_Player) do
	ownedNormalTalent[playerID] = {}
	ownedSpTalent[playerID] = {}
	notOwnedNormalTalent[playerID] = {}
	notOwnedSpTalent[playerID] = {}
	ranSpTalentID[playerID] = {}
	for i = 1, #excel["通用天赋"] do
		notOwnedNormalTalent[playerID][i] = i
	end
	for i = 1, #excel["专精天赋"] do
		notOwnedSpTalent[playerID][i] = i
	end
end


--#region 专精天赋选择UI

local w = 360
local h = 100
talentUI.panel = createUI:CreateUIAbsolute("panel", gameui, "中心", 0, 0, 1, 1, { isShow = false })
talentUI.background = createUI:CreateUIRelative("image", talentUI.panel, "中心", talentUI.panel, "中心", 960, 600, w, h,
	{ image = [[UI\Widgets\ToolTips\Human\human-tooltip-background.blp]], alpha = 0.5 })

local function EnterOptionBtn(btn)
	local index = btn.index
	local playerID = common:GetLocalPlayerID()
	local id = ranSpTalentID[playerID][index]
	if id > 0 then
		tipDialogDown.name:set_text(excel["专精天赋"][id]["Name"])
		tipDialogDown.icon:set_image(excel["专精天赋"][id]["Icon"])
		tipDialogDown.tips:set_text(excel["专精天赋"][id]["Tips"])
		tipDialogDown.intro:set_text("|cff00ffff类别 - 专精天赋")
	else
		tipDialogDown.name:set_text("无更多专精天赋")
		tipDialogDown.icon:set_image([[Survival\UI\Other\cancel.blp]])
		tipDialogDown.tips:set_text("没有更多的专精天赋了")
		tipDialogDown.intro:set_text("")
	end
	tipDialogDown.panel:reset_allpoint()
	tipDialogDown.panel:set_point("中心", btn, "右上", 15, -10)
	tipDialogDown.panel:set_show(true)
end

local function LeaveOptionBtn(btn)
	tipDialogDown.panel:set_show(false)
end
local function ClickOptionBtn(btn)
	local playerID = common:GetLocalPlayerID()
	-- common:SendSync("SelectSpTalent", ranSpTalentID[playerID][btn.index])
	if ranSpTalentID[playerID][btn.index] > 0 then
		talentUI.panel:set_show(false)
		common:SendSync("SelectSpTalent", btn.index)
	end
end

common:ReceiveSync("SelectSpTalent")(function(talentIndex)
	local player   = common:GetSyncPlayer()
	local playerID = common:ConvertPlayerToID(player)
	local talentID = ranSpTalentID[playerID][talentIndex]
	for index, value in ipairs(ranSpTalentID[playerID]) do
		if index ~= talentIndex and value > 0 then
			table.insert(notOwnedSpTalent[playerID], value)
		end
	end
	ranSpTalentID[playerID] = {}
	table.insert(ownedSpTalent[playerID], talentID)
	code.AddMessage(playerID, "获得专精天赋：|cfaffff00" .. excel["专精天赋"][talentID]["Name"])
	common:SaveInteger(jass.udg_HTSpTalent, playerID, talentID, 1)
	myFunc:SetCustomValue(jass.gg_trg_GetSpTalent, "整数", "talentID", talentID)
	myFunc:SetCustomValue(jass.gg_trg_GetSpTalent, "整数", "playerID", playerID)
	common:RunTrigger(jass.gg_trg_GetSpTalent)
	if common:IsLocalPlayer(player) then
		inSelecting = false
	end
end)

talentUI.optionIcon = {}
talentUI.optionBtn = {}
for i = 1, 3 do
	talentUI.optionIcon[i] = createUI:CreateUIRelative("image", talentUI.background, "左侧", talentUI.background, "左侧", (i - 1) * (h + 30), 0, h, h, { image = [[StarRail\star_3.tga]], isShow = false })
	talentUI.optionBtn[i] = createUI:CreateUIRelative("button", talentUI.optionIcon[i], "中心", talentUI.optionIcon[i], "中心", 0, 0, h, h)
	talentUI.optionBtn[i].index = i
	talentUI.optionBtn[i]:event "进入" (EnterOptionBtn)
	talentUI.optionBtn[i]:event "离开" (LeaveOptionBtn)
	talentUI.optionBtn[i]:event "点击" (ClickOptionBtn)
end

-- 刷新按钮, 放弃按钮(在点击放弃时判断通用天赋是否大于0, 否则的话提示没有通用天赋, 无法放弃)
local refreshW = 100
local refreshH = 50
talentUI.refreshBg = createUI:CreateUIRelative("image", talentUI.background, "左上", talentUI.background, "左下", 0, -10, refreshW, refreshH, { image = [[Survival\UI\refresh.tga]] })
talentUI.refreshBtn = createUI:CreateUIRelative("button", talentUI.refreshBg, "中心", talentUI.refreshBg, "中心", 0, 0, refreshW, refreshH)
talentUI.refreshText = createUI:CreateUIRelative("text", talentUI.refreshBg, "中心", talentUI.refreshBg, "中心", 0, 0, refreshW, 0, { font = font, fontSize = 18, align = "居中" })
-- talentUI.refreshText:set_text("刷新")
talentUI.refreshBtn:event "进入" (function(btn)
	tipOnlyTextDown.tips:set_text("点击消耗|cfaffff00100|r钻石刷新")
	tipOnlyTextDown.panel:reset_allpoint()
	tipOnlyTextDown.panel:set_point("中心", btn, "右上", 15, -15)
	tipOnlyTextDown.panel:set_show(true)
end)
talentUI.refreshBtn:event "离开" (function(btn)
	tipOnlyTextDown.panel:set_show(false)
end)
talentUI.refreshBtn:event "点击" (function(btn)
	local playerID = common:GetLocalPlayerID()
	if jass.udg_PlayerDiamond[playerID] >= 100 then
		-- 重新随机专精天赋
		common:SendSync("RefreshSpTalent")
		common:SendSync("ReduceDiamond", 100)
	else
		code.AddMessage(playerID, "|cffff0000钻石不足")
	end
end)

talentUI.quitBg = createUI:CreateUIRelative("image", talentUI.background, "右上", talentUI.background, "右下", 0, -10, refreshW, refreshH, { image = [[Survival\UI\SelectOne\option.tga]] })
talentUI.quitBtn = createUI:CreateUIRelative("button", talentUI.quitBg, "中心", talentUI.quitBg, "中心", 0, 0, refreshW, refreshH)
talentUI.quitText = createUI:CreateUIRelative("text", talentUI.quitBg, "中心", talentUI.quitBg, "中心", 0, 0, refreshW, 0, { font = font, fontSize = 18, align = "居中" })
talentUI.quitText:set_text("放弃")
talentUI.quitBtn:event "进入" (function(btn)
	tipOnlyTextDown.tips:set_text("放弃本次选择，随机获得一个通用天赋")
	tipOnlyTextDown.panel:reset_allpoint()
	tipOnlyTextDown.panel:set_point("中心", btn, "右上", 15, -15)
	tipOnlyTextDown.panel:set_show(true)
end)
talentUI.quitBtn:event "离开" (function(btn)
	tipOnlyTextDown.panel:set_show(false)
end)
talentUI.quitBtn:event "点击" (function(btn)
	local playerID = common:GetLocalPlayerID()
	-- 判断是否有多余的通用天赋
	if #notOwnedNormalTalent[playerID] > 0 then
		talentUI.panel:set_show(false)
		common:SendSync("QuitSelectSpTalent", 0)
	else
		code.AddMessage(playerID, "无法放弃，|cffff0000已获得所有通用天赋")
	end
end)

--#endregion


--#region 开启天赋挑战UI

local size = 65
local sequenceImage = {}
for i = 1, 16, 1 do
	sequenceImage[i] = "Survival\\UI\\XLZ\\light" .. i .. ".tga"
end

talentUI.challengeIcon = createUI:CreateUIAbsolute("image", gameui, "中心", 1130, 305, size, size, { image = [[Survival\UI\Talent\talentChallenge.blp]], isShow = false })
talentUI.challengeBtn = createUI:CreateUIRelative("button", talentUI.challengeIcon, "中心", talentUI.challengeIcon, "中心", 0, 0, size, size)
talentUI.iconFrame = createUI:CreateUIRelative("image", talentUI.challengeIcon, "中心", talentUI.challengeIcon, "中心", 0, 0, size, size, { show = true })
myFunc:SequenceFrame({ UI = talentUI.iconFrame, time = 0.05, isLoop = true, image = sequenceImage })


-- 点击的时候进行播放, 如果正在播放则重置
talentUI.challengeBtn:event("进入")(function()
	tipDialogUp.name:set_text("开启天赋挑战")
	tipDialogUp.icon:set_image([[Survival\UI\Talent\talentChallenge.blp]])
	tipDialogUp.tips:set_text("天赋挑战成功后可随机获得通用天赋，通用天赋有概率变成可选择的专精天赋")
	tipDialogUp.intro:set_text("|cff00ffff类别 - 挑战")
	tipDialogUp.panel:reset_allpoint()
	tipDialogUp.panel:set_point("中心", talentUI.challengeBtn, "左上", 410, 15)
	tipDialogUp.panel:set_show(true)
end)
talentUI.challengeBtn:event("离开")(function()
	tipDialogUp.panel:set_show(false)
end)
talentUI.challengeBtn:event("点击")(function()
	local playerID = common:GetLocalPlayerID()
	if jass.udg_TalentChallengeCount[playerID] > 0 and not inChallenge and not inSelecting then
		inChallenge = true
		talentUI.challengeBtn:set_show(false)
		myFunc:FadeSize({ UI = talentUI.challengeIcon, time = 0.2, startP = { size, size }, endP = { 1, 1 }, ty = "二元入" })
		myFunc:FadeAlpha({
			UI = talentUI.challengeIcon,
			time = 0.2,
			show = false,
			ty = "二元入",
			complete = function()
				talentUI.challengeIcon:set_show(false)
			end
		})
		-- talentUI.challengeIcon:set_show(false)
		common:SendSync("OpenTalentChallenge")
	end
end)

--#endregion



-- 获得通用天赋
local function GetNormalTalent(playerID)
	-- 随机通用天赋id, 存储起来, 存入哈希表, 从未拥有天赋表中删除, 运行获得天赋触发
	if #notOwnedNormalTalent[playerID] > 0 then
		local index = common:GetRandomInt(1, #notOwnedNormalTalent[playerID])
		local talentID = notOwnedNormalTalent[playerID][index]
		code.AddMessage(playerID, "获得通用天赋：|cfaffff00" .. excel["通用天赋"][talentID]["Name"])
		table.insert(ownedNormalTalent[playerID], talentID)
		table.remove(notOwnedNormalTalent[playerID], index)
		common:SaveInteger(jass.udg_HTNormalTalent, playerID, talentID, 1)
		myFunc:SetCustomValue(jass.gg_trg_GetNormalTalent, "整数", "talentID", talentID)
		myFunc:SetCustomValue(jass.gg_trg_GetNormalTalent, "整数", "playerID", playerID)
		common:RunTrigger(jass.gg_trg_GetNormalTalent)
		return true
	else
		return false
	end
end

-- 获得专精天赋
local function GetSpecializeTalent(playerID)
	if #notOwnedSpTalent[playerID] > 0 then
		-- 随机id个数
		local ranCount = 2

		for i = 1, ranCount do
			if #notOwnedSpTalent[playerID] > 0 then
				local ranIndex = common:GetRandomInt(1, #notOwnedSpTalent[playerID])
				local ranID = notOwnedSpTalent[playerID][ranIndex]
				table.remove(notOwnedSpTalent[playerID], ranIndex)
				ranSpTalentID[playerID][i] = ranID
			else
				ranSpTalentID[playerID][i] = 0
			end
			if common:IsLocalPlayer(jass.udg_Player[playerID]) then
				if ranSpTalentID[playerID][i] > 0 then
					talentUI.optionIcon[i]:set_image(excel["专精天赋"][ranSpTalentID[playerID][i]]["Icon"])
				else
					talentUI.optionIcon[i]:set_image([[Survival\UI\Other\cancel.blp]])
				end
				talentUI.optionIcon[i]:set_show(true)
				talentUI.panel:set_show(true)
				inSelecting = true
				talentUI.background:set_wh(h * ranCount + 30 * (ranCount - 1), h)
			end
		end
		return true
	else
		return false
	end
end

-- 刷新专精天赋
common:ReceiveSync("RefreshSpTalent")(function()
	local player = common:GetSyncPlayer()
	local playerID = common:ConvertPlayerToID(player)
	for index, value in ipairs(ranSpTalentID[playerID]) do
		if value > 0 then
			table.insert(notOwnedSpTalent[playerID], value)
		end
	end
	ranSpTalentID[playerID] = {}
	GetSpecializeTalent(playerID)
end)

-- 放弃选择专精天赋
common:ReceiveSync("QuitSelectSpTalent")(function()
	local player = common:GetSyncPlayer()
	local playerID = common:ConvertPlayerToID(player)
	for index, value in ipairs(ranSpTalentID[playerID]) do
		if value > 0 then
			table.insert(notOwnedSpTalent[playerID], value)
		end
	end
	ranSpTalentID[playerID] = {}
	GetNormalTalent(playerID)
	if common:IsLocalPlayer(player) then
		inSelecting = false
	end
end)

-- 获得天赋
function code.GetTalent(playerID)
	if common:IsLocalPlayer(jass.udg_Player[playerID]) then
		inChallenge = false
	end
	if common:GetRandomInt(1, 100) <= 20 then
		-- 专精天赋
		if not GetSpecializeTalent(playerID) then
			GetNormalTalent(playerID)
		end
	else
		-- 通用天赋
		if not GetNormalTalent(playerID) then
			GetSpecializeTalent(playerID)
		end
	end
end

-- 设置天赋技能的提示UI
function code.SetTalentTip(playerID)
	local tip = ""
	local count = 0
	for _, talentID in ipairs(ownedNormalTalent[playerID]) do
		count = count + 1
		tip = tip .. "|cff00f5a4※" .. excel["通用天赋"][talentID]["Name"] .. "|r：" .. excel["通用天赋"][talentID]["Tips"] .. "|n|n"
		if count >= 10 then
			break
		end
	end
	for _, talentID in ipairs(ownedSpTalent[playerID]) do
		if count >= 10 then
			break
		end
		count = count + 1
		tip = tip .. "|cff00f5a4※" .. excel["专精天赋"][talentID]["Name"] .. "|r：" .. excel["专精天赋"][talentID]["Tips"] .. "|n|n"
	end
	if count >= 10 then
		tip = tip .. "|cfaffff00★点击查看所有天赋|n|n" .. "|ca7848484每提升12级可获得一次天赋挑战|n天赋永久叠加"
	else
		tip = tip .. "|ca7848484每提升12级可获得一次天赋挑战|n天赋永久叠加"
	end
	return tip
end

-- 显示所有天赋界面
function code.ShowAllTalent(playerID)

end

-- 检查天赋挑战是否可以开启
local function CheckTalentChallenge()
	for playerID, player in ipairs(jass.udg_Player) do
		if common:IsLocalPlayer(player) then
			-- 判断挑战次数是否>0 大于0并且未在挑战, 未在选择专精天赋
			if jass.udg_TalentChallengeCount[playerID] > 0 and not inChallenge and not inSelecting then
				-- 判断图标是否显示, 未显示则进行动作, 显示, 淡入并变大
				if not talentUI.challengeIcon._show then
					talentUI.challengeIcon:set_show(true)
					myFunc:FadeSize({ UI = talentUI.challengeIcon, time = 0.2, startP = { 1, 1 }, endP = { size, size }, ty = "二元出" })
					myFunc:FadeAlpha({
						UI = talentUI.challengeIcon,
						time = 0.2,
						show = true,
						ty = "二元出",
						complete = function()
							talentUI.challengeBtn:set_show(true)
						end
					})
				end
				-- talentUI.challengeIcon:set_show(true)
			end
		end
	end
end

ac.time(0.5, CheckTalentChallenge)



return Talent
