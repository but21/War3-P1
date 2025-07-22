-- 封装
local code = require 'jass.code'
-- 原生
local jass = require 'jass.common'
-- 内置
local japi = require "jass.japi"


-- UI创建模块
---@class UICreate
local UICreate = {}

---创建UI(绝对位置)
---@param type string 类型
---@param parent table 父控件
---@param anchor string 锚点
---@param x number x坐标
---@param y number y坐标
---@param w number 宽
---@param h number 高
---@param args any 额外参数表
---@return table
function UICreate:CreateUIAbsolute(type, parent, anchor, x, y, w, h, args)
	args = args or {}
	if type == "panel" then
		return parent:builder "panel" { w = 1, h = 1, xy = { "中心", x, y }, show = args.isShow, alpha = args.alpha or 1 }
	end
	if type == "image" then
		return parent:builder "image" { w = w, h = h, xy = { anchor, x, y }, image = args.image or "", show = args.isShow, alpha = args.alpha or 1 }
	end
	if type == "button" then
		return parent:builder "button" { w = w, h = h, xy = { anchor, x, y }, show = args.isShow, alpha = args.alpha or 1 }
	end
	if type == "text" then
		return parent:builder "text" { w = w, h = h, xy = { anchor, x, y }, font = { args.font, args.fontSize, align = args.align }, show = args.isShow, text = args.text, alpha = args.alpha or 1 }
	end
	if type == "model" then
		return parent:builder "model" { w = w, h = h, xy = { anchor, x, y }, show = args.isShow }
	end
	-- print("没有该类型: " .. type)
	return { print("没有该类型: " .. type) }
end

---创建UI(相对位置)
---@param type string 类型
---@param parent table 父控件
---@param anchor1 string 锚点1
---@param follow table 跟随的控件
---@param anchor2 string 锚点2
---@param x number x坐标
---@param y number y坐标
---@param w number 宽
---@param h number 高
---@param args any 额外参数表
---@return table
function UICreate:CreateUIRelative(type, parent, anchor1, follow, anchor2, x, y, w, h, args)
	args = args or {}
	if type == "panel" then
		return parent:builder "panel" { w = w, h = h, xy = { anchor1, follow, anchor2, x, y }, show = args.isShow, alpha = args.alpha or 1 }
	end
	if type == "image" then
		return parent:builder "image" { w = w, h = h, xy = { anchor1, follow, anchor2, x, y }, image = args.image or "", show = args.isShow, alpha = args.alpha or 1 }
	end
	if type == "button" then
		return parent:builder "button" { w = w, h = h, xy = { anchor1, follow, anchor2, x, y }, show = args.isShow, alpha = args.alpha or 1 }
	end
	if type == "text" then
		return parent:builder "text" { w = w, h = h, xy = { anchor1, follow, anchor2, x, y }, font = { args.font, args.fontSize, align = args.align }, text = args.text, show = args.isShow,
			alpha = args.alpha or 1 }
	end
	if type == "model" then
		return parent:builder "model" { w = w, h = h, xy = { anchor1, follow, anchor2, x, y }, show = args.isShow }
	end
	return { print("没有该类型: " .. type) }
end

return UICreate
