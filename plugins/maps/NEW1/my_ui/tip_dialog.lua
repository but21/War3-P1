local japi = require 'jass.japi'
local font = [[fonts\LXWK_Bold.ttf]]


local TipDialog = {}

-- 物品栏, 技能提示框
TipDialog.uiIASTip = {}
-- 鼠标指向物品提示框
TipDialog.uiItemTip = {}


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


	-- 物品栏, 技能提示框
	-- 物品栏提示框
	TipDialog.uiIASTip["父控件"] = gameui:builder 'panel' { w = 1, h = 1, xy = { "中心", 0, 0 }, show = false }
	TipDialog.uiIASTip["父控件"]:set_point2("中心", 1890, 300)
	-- 背景
	TipDialog.uiIASTip["background"] = ns.ui.create2("Tips7", TipDialog.uiIASTip["父控件"], 0)
	-- 描述
	TipDialog.uiIASTip["描述"] = TipDialog.uiIASTip["父控件"]:builder "text" { w = 400, h = 0, xy = { "右下", TipDialog.uiIASTip["父控件"], "右下", 0, 0 },
		font = { [[fonts\LXWK_Bold.ttf]], 20, align = "左" }, show = true, alpha = 1 }
	-- 分割线
	TipDialog.uiIASTip["分割线"] = TipDialog.uiIASTip["父控件"]:builder "image" { w = 400, h = 2, xy = { "左下", TipDialog.uiIASTip["描述"], "左上", 0, 20 },
		image = [[StarRail\star_1.tga]] }
	-- 物品图标
	TipDialog.uiIASTip["图标"] = TipDialog.uiIASTip["父控件"]:builder "image" { w = 60, h = 60, xy = { "左下", TipDialog.uiIASTip["分割线"], "左上", 0, 20 },
		image = [[StarRail\star_1.tga]] }
	-- 物品名称(提示)
	TipDialog.uiIASTip["名称"] = TipDialog.uiIASTip["父控件"]:builder "text" { w = 350, h = 0, xy = { "左上", TipDialog.uiIASTip["图标"], "右上", 15, 0 },
		font = { [[fonts\LXWK_Bold.ttf]], 24, align = "左" }, show = true, alpha = 1 }
	-- 物品类别 (装备, 道具, 技能书)
	TipDialog.uiIASTip["类别"] = TipDialog.uiIASTip["父控件"]:builder "text" { w = 350, h = 0, xy = { "左下", TipDialog.uiIASTip["图标"], "右下", 15, 0 },
		font = { [[fonts\LXWK_Bold.ttf]], 20, align = "左" }, show = true, alpha = 1 }
	TipDialog.uiIASTip["名称"]:set_text("|cffffcc00灵魂火符")
	TipDialog.uiIASTip["类别"]:set_text("|cff0091ff类别 -- 装备")
	TipDialog.uiIASTip["background"]:reset_allpoint()
	TipDialog.uiIASTip["background"]:set_point("左上", TipDialog.uiIASTip["图标"], "左上", -20, 20)
	TipDialog.uiIASTip["background"]:set_point("右下", TipDialog.uiIASTip["描述"], "右下", 20, -20)


	-- 鼠标指向物品提示框
	-- 物品栏提示框
	TipDialog.uiItemTip["父控件"] = gameui:builder 'panel' { w = 1, h = 1, xy = { "中心", 0, 0 }, show = false }
	TipDialog.uiItemTip["父控件"]:set_point2("中心", 1890, 300)
	-- 背景
	TipDialog.uiItemTip["background"] = ns.ui.create2("Tips8", TipDialog.uiItemTip["父控件"], 0)
	-- 描述
	TipDialog.uiItemTip["描述"] = TipDialog.uiItemTip["父控件"]:builder "text" { w = 400, h = 0, xy = { "右下", TipDialog.uiItemTip["父控件"], "右下", 0, 0 },
		font = { [[fonts\LXWK_Bold.ttf]], 20, align = "左" }, show = true, alpha = 1 }
	-- 分割线
	TipDialog.uiItemTip["分割线"] = TipDialog.uiItemTip["父控件"]:builder "image" { w = 400, h = 1, xy = { "左下", TipDialog.uiItemTip["描述"], "左上", 0, 20 },
		image = [[StarRail\star_1.tga]], alpha = 0.8 }
	-- 物品图标
	TipDialog.uiItemTip["图标"] = TipDialog.uiItemTip["父控件"]:builder "image" { w = 60, h = 60, xy = { "左下", TipDialog.uiItemTip["分割线"], "左上", 0, 20 },
		image = [[StarRail\star_1.tga]] }
	-- 物品名称(提示)
	TipDialog.uiItemTip["名称"] = TipDialog.uiItemTip["父控件"]:builder "text" { w = 350, h = 0, xy = { "左上", TipDialog.uiItemTip["图标"], "右上", 15, 0 },
		font = { [[fonts\LXWK_Bold.ttf]], 24, align = "左" }, show = true, alpha = 1 }
	-- 物品类别 (装备, 道具, 技能书)
	TipDialog.uiItemTip["类别"] = TipDialog.uiItemTip["父控件"]:builder "text" { w = 350, h = 0, xy = { "左下", TipDialog.uiItemTip["图标"], "右下", 15, 0 },
		font = { [[fonts\LXWK_Bold.ttf]], 20, align = "左" }, show = true, alpha = 1 }
	TipDialog.uiItemTip["background"]:reset_allpoint()
	TipDialog.uiItemTip["background"]:set_point("左上", TipDialog.uiItemTip["图标"], "左上", -20, 20)
	TipDialog.uiItemTip["background"]:set_point("右下", TipDialog.uiItemTip["描述"], "右下", 20, -20)
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
