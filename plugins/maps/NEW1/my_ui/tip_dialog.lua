local japi = require 'jass.japi'
local font = [[fonts\LXWK_Bold.ttf]]


local TipDialog = {}

local itemTip = {}
-- 鼠标指向物品提示框
TipDialog.itemTip = itemTip

local tipDialogUp = {}
-- 向上拉伸提示框
TipDialog.tipDialogUp = tipDialogUp

local tipDialogDown = {}
-- 向下拉伸提示框
TipDialog.tipDialogDown = tipDialogDown

local tipOnlyTextUp = {}
-- 纯文本提示框(向上拉伸)
TipDialog.tipOnlyTextUp = tipOnlyTextUp

local tipOnlyTextDown = {}
-- 纯文本提示框(向下拉伸)
TipDialog.tipOnlyTextDown = tipOnlyTextDown

--- 初始化
---@param createUI UICreate
function TipDialog:Init(createUI)
	-- 从下往上拉伸的提示框

	-- 父控件
	tipDialogUp.panel = createUI:CreateUIAbsolute("panel", gameui, "中心", 600, 600, 1, 1, { isShow = false })
	tipDialogUp.background = ns.ui.create2("Tips1", tipDialogUp.panel, 0)
	-- 提示
	tipDialogUp.tips = createUI:CreateUIRelative("text", tipDialogUp.panel, "右下", tipDialogUp.panel, "右下", 0, 0, 400, 0, { font = font, fontSize = 20, align = "左" })
	tipDialogUp.splitLine = createUI:CreateUIRelative("image", tipDialogUp.panel, "左下", tipDialogUp.tips, "左上", 0, 15, 400, 2, { image = [[Survival\UI\TipDialog\splitLine.tga]] })
	-- 图标
	tipDialogUp.icon = createUI:CreateUIRelative("image", tipDialogUp.panel, "左下", tipDialogUp.splitLine, "左上", 0, 15, 60, 60, { image = [[StarRail\star_3.tga]] })
	-- 名字
	tipDialogUp.name = createUI:CreateUIRelative("text", tipDialogUp.panel, "左上", tipDialogUp.icon, "右上", 10, 0, 350, 0, { font = font, fontSize = 22, align = "左" })
	-- 介绍
	tipDialogUp.intro = createUI:CreateUIRelative("text", tipDialogUp.panel, "左下", tipDialogUp.icon, "右下", 10, 0, 350, 0, { font = font, fontSize = 18, align = "左" })
	tipDialogUp.background:reset_allpoint()
	tipDialogUp.background:set_point("左上", tipDialogUp.icon, "左上", -20, 20)
	tipDialogUp.background:set_point("右下", tipDialogUp.tips, "右下", 20, -20)


	-- 父控件
	tipDialogDown.panel = createUI:CreateUIAbsolute("panel", gameui, "中心", 600, 600, 1, 1, { isShow = false })
	tipDialogDown.background = ns.ui.create2("Tips2", tipDialogDown.panel, 0)
	-- 图标
	tipDialogDown.icon = createUI:CreateUIRelative("image", tipDialogDown.panel, "左上", tipDialogDown.panel, "左上", 0, 0, 60, 60, { image = [[StarRail\star_3.tga]] })
	-- 名字
	tipDialogDown.name = createUI:CreateUIRelative("text", tipDialogDown.panel, "左上", tipDialogDown.icon, "右上", 10, 0, 350, 0, { font = font, fontSize = 22, align = "左" })
	-- 介绍
	tipDialogDown.intro = createUI:CreateUIRelative("text", tipDialogDown.panel, "左下", tipDialogDown.icon, "右下", 10, 0, 350, 0, { font = font, fontSize = 18, align = "左" })
	tipDialogDown.splitLine = createUI:CreateUIRelative("image", tipDialogDown.panel, "左上", tipDialogDown.icon, "左下", 0, -15, 400, 2, { image = [[Survival\UI\TipDialog\splitLine.tga]] })
	-- 提示
	tipDialogDown.tips = createUI:CreateUIRelative("text", tipDialogDown.panel, "左上", tipDialogDown.splitLine, "左下", 0, -15, 400, 0, { font = font, fontSize = 20, align = "左" })
	tipDialogDown.background:reset_allpoint()
	tipDialogDown.background:set_point("右下", tipDialogDown.tips, "右下", 20, -20)
	tipDialogDown.background:set_point("左上", tipDialogDown.icon, "左上", -20, 20)


	-- 父控件	
	tipOnlyTextUp.panel = gameui:builder 'panel' { w = 1, h = 1, xy = { "中心", 0, 0 }, show = false }
	-- 背景
	tipOnlyTextUp.background = ns.ui.create2("Tips3", tipOnlyTextUp.panel, 0)
	-- 描述
	tipOnlyTextUp.tips = tipOnlyTextUp["panel"]:builder "text" { w = 350, h = 0, xy = { "左下", tipOnlyTextUp.panel, "左下", 0, 0 },
		font = { font, 20, align = "左" }, show = true, alpha = 1 }
	tipOnlyTextUp.background:reset_allpoint()
	tipOnlyTextUp.background:set_point("左上", tipOnlyTextUp.tips, "左上", -20, 20)
	tipOnlyTextUp.background:set_point("右下", tipOnlyTextUp.tips, "右下", 20, -20)


	-- 父控件	
	tipOnlyTextDown.panel = gameui:builder 'panel' { w = 1, h = 1, xy = { "中心", 0, 0 }, show = false }
	-- 背景
	tipOnlyTextDown.background = ns.ui.create2("Tips4", tipOnlyTextDown.panel, 0)
	-- 描述
	tipOnlyTextDown.tips = tipOnlyTextDown.panel:builder "text" { w = 350, h = 0, xy = { "左上", tipOnlyTextDown.panel, "左上", 0, 0 },
		font = { font, 20, align = "左" }, show = true, alpha = 1 }
	tipOnlyTextDown.background:reset_allpoint()
	tipOnlyTextDown.background:set_point("左上", tipOnlyTextDown.tips, "左上", -20, 20)
	tipOnlyTextDown.background:set_point("右下", tipOnlyTextDown.tips, "右下", 20, -20)

	-- 父控件
	itemTip.panel = createUI:CreateUIAbsolute("panel", gameui, "中心", 600, 600, 1, 1, { isShow = false })
	itemTip.background = ns.ui.create2("Tips5", itemTip.panel, 0)
	-- 提示
	itemTip.tips = createUI:CreateUIRelative("text", itemTip.panel, "右下", itemTip.panel, "右下", 0, 0, 400, 0, { font = font, fontSize = 20, align = "左" })
	itemTip.splitLine = createUI:CreateUIRelative("image", itemTip.panel, "左下", itemTip.tips, "左上", 0, 15, 400, 2, { image = [[Survival\UI\TipDialog\splitLine.tga]] })
	-- 图标
	itemTip.icon = createUI:CreateUIRelative("image", itemTip.panel, "左下", itemTip.splitLine, "左上", 0, 15, 60, 60, { image = [[StarRail\star_3.tga]] })
	-- 名字
	itemTip.name = createUI:CreateUIRelative("text", itemTip.panel, "左上", itemTip.icon, "右上", 10, 0, 350, 0, { font = font, fontSize = 22, align = "左" })
	-- 介绍
	itemTip.intro = createUI:CreateUIRelative("text", itemTip.panel, "左下", itemTip.icon, "右下", 10, 0, 350, 0, { font = font, fontSize = 18, align = "左" })
	itemTip.background:reset_allpoint()
	itemTip.background:set_point("左上", itemTip.icon, "左上", -20, 20)
	itemTip.background:set_point("右下", itemTip.tips, "右下", 20, -20)
end

return TipDialog

-- 跟随鼠标
--[[ UI_Panel = gameui:builder 'panel' { w = 1, h = 1, xy = { '中心', 0, 0 }, show = true }

UI_Test = gameui:builder 'button' { w = 100, h = 100, xy = { '中心', 0, 0 } }
UI_Icon = UI_Test:builder 'image' { w = 60, h = 60,
    xy = { '中心', UI_Test, '中心', 0, 0 }, image = [ [ ] ], show = true }
UI_Test:ui_click()
function UI_Test:ui_click()
    print('aaa')
    local x, y = UI_Panel:get_xy()
    print(x, y)
end

ac.time(0.2, function()
    local x, y = uiex.get_mouse_xy()
    UI_Panel:set_point2('中心', x, y)
    UI_Test:set_point2('中心', x, y)
end)
 ]]
