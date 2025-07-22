local code = require "jass.code"
local jass = require "jass.common"
local japi = require "jass.japi"

local Module = require "my_base.base_module_manager"
local createUI = Module.UICreate
local myFunc = Module.MyFunc
local tipDialogDown = Module.UITipDialog.tipDialogDown
local common = Module.Common

local artifactName = { "浮生剑", "鬼眼弓", "星落杖" }
local artifactIcon = { [[Survival\UI\Qzzx\1.blp]], [[Survival\UI\Qzzx\2.blp]], [[Survival\UI\Qzzx\3.blp]] }
local artifaceTips = { "该神器在成功血祭后获得的属性偏向于力量型兵器", "该神器在成功血祭后获得的属性偏向于敏捷型兵器", "该神器在成功血祭后获得的属性偏向于智力型兵器" }

local selectUI = {}
local ArtifactSelect = {}
ArtifactSelect.ui = selectUI

local w = 360
local h = 100
selectUI.panel = createUI:CreateUIAbsolute("panel", gameui, "中心", 0, 0, 0, 0, { isShow = false })
selectUI.background = createUI:CreateUIRelative("image", selectUI.panel, "中心", selectUI.panel, "中心", 960, 600, w, h,
	{ image = [[UI\Widgets\ToolTips\Human\human-tooltip-background.blp]], alpha = 0.5 })
japi.FrameSetIgnoreTrackEvents(selectUI.background.handle, false)

local function EnterOptionBtn(btn)
	local index = btn.index
	tipDialogDown.name:set_text(artifactName[index])
	tipDialogDown.icon:set_image(artifactIcon[index])
	tipDialogDown.tips:set_text(artifaceTips[index])
	tipDialogDown.panel:reset_allpoint()
	tipDialogDown.panel:set_point("中心", btn, "右上", 15, -10)
	tipDialogDown.panel:set_show(true)
end
local function LeaveOptionBtn(btn)
	tipDialogDown.panel:set_show(false)
end
local function ClickOptionBtn(btn)
	selectUI.panel:set_show(false)
	common:SendSync("SelectArtifact", btn.index)
end

common:ReceiveSync("SelectArtifact")(function(index)
	local player = common:GetSyncPlayer()
	local playerID = common:ConvertPlayerToID(player)
	jass.udg_HeartType[playerID] = index
	jass.udg_HeartKillsCount[playerID] = excel["本源附魔"][1]["KillsCount"]
	jass.udg_HeartLv[playerID] = jass.udg_HeartLv[playerID] + 1
	code.HeartCountChange(jass.udg_HeartKillsCount[playerID], playerID)
	code.HeartLevelUp(playerID)
	myFunc:SetCustomValue(jass.udg_Hero[playerID], "真值", "In神器试炼", false)
end)

selectUI.optionIcon = {}
selectUI.optionBtn = {}
for i = 1, 3 do
	selectUI.optionIcon[i] = createUI:CreateUIRelative("image", selectUI.background, "左侧", selectUI.background, "左侧", (i - 1) * (h + 30), 0, h, h, { image = [[StarRail\star_3.tga]] })
	selectUI.optionBtn[i] = createUI:CreateUIRelative("button", selectUI.optionIcon[i], "中心", selectUI.optionIcon[i], "中心", 0, 0, h, h)
	selectUI.optionBtn[i].index = i
	selectUI.optionBtn[i]:event "进入" (EnterOptionBtn)
	selectUI.optionBtn[i]:event "离开" (LeaveOptionBtn)
	selectUI.optionBtn[i]:event "点击" (ClickOptionBtn)
end


--选择神器类别
function code.SelectArtifact(playerID)
	-- 弹出三选一UI, 提示框
	if common:IsLocalPlayer(jass.udg_Player[playerID]) then
		for i = 1, 3 do
			selectUI.optionIcon[i]:set_image(artifactIcon[i])
		end
		selectUI.panel:set_show(true)
	end
end

return ArtifactSelect
