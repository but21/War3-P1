local japi = require "jass.japi"


ns.ui.numb = 0

ns.ui.type = {}

ns.ui.type["控件"] = "SPRITE"
ns.ui.type['背景'] = "BACKDROP"
ns.ui.type['文本'] = "TEXT"
ns.ui.type['按钮'] = "BUTTON"
ns.ui.type['模型'] = "SPRITE"
--PANEL一般拿来做控件
ns.ui.type["PANEL"] = "SPRITE"
ns.ui.type['BACKDROP'] = "BACKDROP"
ns.ui.type['IMAGE'] = "BACKDROP"
ns.ui.type["TEXT"] = "TEXT"
ns.ui.type["BUTTON"] = "BUTTON"
ns.ui.type["SPRITE"] = "SPRITE"
ns.ui.type["MDX"] = "SPRITE"
ns.ui.type["MDL"] = "SPRITE"
ns.ui.type["MODEL"] = "SPRITE"

ns.ui.allui = {}

-- 通用UI创建函数
function ns.ui.create(self, ty, val)
	local ty2 = ns.ui.type[ty]
	ns.ui.numb = ns.ui.numb + 1
	local zfc = "nsui" .. tostring(ns.ui.numb)
	local handle
	if ty2 == "SPRITE" and ty ~= "PANEL" then
		handle = japi.FrameAddModel(self.handle)
	else
		handle = japi.CreateFrameByTagName(ty2, zfc, self.handle, ty2, 0)
	end
	local ui = ns.ui.add(ty2, handle)
	table.insert(ns.ui.allui, ui)
	ui.father = self
	ui.level = ns.ui.numb
	-- 偷懒
	local mrset = {
		w = 0,
		h = 0,
		xy = { '中心', ns.gameui, '中心', 0, 0 },
		text = "bibi",
		image = [[ReplaceableTextures\CommandButtons\BTNPeasant.blp]],
		model = [[units\human\Peasant\Peasant.mdl]],
		font = { ns.mrzt, 10, align = "居中" },
		alpha = 1.00,
	}
	-- 应用默认值
	val = val or {}
	--设置宽高
	if val.w or val.h then
		ui:set_wh(val.w, val.h)
	end
	--透明度
	val.alpha = val.alpha or 1.00
	ui:set_alpha(val.alpha)

	--默认显示
	if val.show == false then
		ui:set_show(false)
	else
		ui:set_show(true)
	end
	--设置位置
	if val.xy then
		if #val.xy <= 3 then
			ui:set_point2(val.xy[1], val.xy[2], val.xy[3])
		else
			ui:set_point(val.xy[1], val.xy[2], val.xy[3], val.xy[4], val.xy[5])
		end
	end

	if ui._leixing == "TEXT" then
		if val.text then
			ui:set_text(val.text)
		end
		if val.font then
			ui.font = val.font
			ui:set_zt(val.font[1] or ns.mrzt)
			ui:SetFontSize(val.font[2] or mrset.ztdx)
			ui:set_align(val.font.align or mrset.ztdq)
		end
		japi.FrameSetEnable(ui.handle, false)
	end
	if ui._leixing == "BACKDROP" then
		if val.image then
			ui:set_image(val.image)
		end
	end
	if ui._leixing == "SPRITE" then
		if ty ~= "PANEL" then
			if val.model then
				ui:set_model(val.model)
			end
		else
			ui:set_jzdj(false)
		end
	end
	if ui._leixing == "BUTTON" then
		--注册按钮事件
	end
	for k, v in pairs(mrset) do
		if val[k] == nil then
			val[k] = v
		end
	end
	-- 将 val 的属性添加到 ui 表中
	for k, v in pairs(val) do
		ui[k] = v
	end

	return ui
end

-- 通用UI FDF创建函数
function ns.ui.create2(name, father, id)
	local handle = japi.DzCreateFrame(name, father.handle, id or 0)
	local ui     = ns.ui.add(name, handle)
	return ui
end

function ns.ui:builder(name)
	-- 转换为大写以匹配 ns.ui.type 中的键
	local nameUpper = string.upper(name)

	if not ns.ui.type[nameUpper] then
		return print("没这个类型 搞毛")
	end

	-- 转换为小写以找到正确的函数名
	local funcName = string.lower(name)

	local createFunc = ns.ui[funcName]
	if not createFunc then
		return print("未定义的创建函数: " .. funcName)
	end

	return function(val)
		return createFunc(self, val)
	end
end

-- Panel 类构建器(一般用于当控件)
function ns.ui:panel(val)
	return ns.ui.create(self, 'PANEL', val)
end

-- BACKDROP 类构建器(图片)("自己看习惯单词来用吧")
function ns.ui:backdrop(val)
	return ns.ui.create(self, 'BACKDROP', val)
end

function ns.ui:image(val)
	return ns.ui.create(self, 'BACKDROP', val)
end

function ns.ui:icon(val)
	return ns.ui.create(self, 'BACKDROP', val)
end

-- Button 类构建器
function ns.ui:button(val)
	return ns.ui.create(self, 'BUTTON', val)
end

-- Text 类构建器
function ns.ui:text(val)
	return ns.ui.create(self, 'TEXT', val)
end

-- Sprite 类构建器
function ns.ui:sprite(val)
	return ns.ui.create(self, 'SPRITE', val)
end

function ns.ui:model(val)
	return ns.ui.create(self, 'SPRITE', val)
end

function ns.ui:mdl(val)
	return ns.ui.create(self, 'SPRITE', val)
end

-- ac.time(1, 1, function()
--local panel = gameui:builder "model" { w = 128, h = 128, xy = { '中心', gameui, '中心', 0, 0 } }
--panel:set_model([[units\demon\FelgaurdBlue\FelgaurdBlue.mdl]])
--panel:set_camera_target(0,0,50)
--panel:set_camera_source(150,0,75)

-- end)
