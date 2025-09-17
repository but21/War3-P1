local code = require 'jass.code'
local jass = Jass
local japi = require 'jass.japi'
local message = require "jass.message"
local ns = ns

local funcG = {
	"Frame_SetModelRotateX",
	"Frame_SetModelRotateY",
	"Frame_SetModelRotateZ",
}

--设置模型旋转(叠加形)
function code.Frame_SetModelRotate(ui, ty, value)
	code[funcG[ty]](ui, 0)
	code[funcG[ty]](ui, value)
end

-- 返回需求名字
function code.Obje_ToNeedUpgradeTips(id)
	return ns.Getneedname(id) or ""
end

-- 获取鼠标指向物体
function code.Player_GetMouseItem()
	return japi.DzGetUnitUnderMouse()
end

-- 获取选中单位
function code.GetSelectUnit()
	-- return japi.GetRealSelectUnit()
	return message.selection()
end

-- 新建UI[普通] (模型)
function code.Frame_New(ty, fui)
	if ty == '3DMOD' then
		return japi.FrameAddModel(fui)
	else
		return 0
	end
end

-- 控制UI 显示/隐藏
function code.Frame_Show(ui, is_show)
	japi.FrameShow(ui, is_show)
end

-- 设置UI相对位置
function code.Frame_SetPoint(ui, po, gs_ui, gs_po, x, y)
	local x2 = (x / 1920 * 0.8)
	local y2 = (y / 1080 * 0.6)
	japi.FrameSetPoint(ui, po, gs_ui, gs_po, x2, y2)
end

-- 播放3d动画
function code.Frame_PlayAnimation(ui, animation_name, link_name)
	japi.FramePlayAnimation(ui, animation_name, link_name or '')
end

-- 设置镜头位置
function code.Frame_SetCameraSource(ui, x, y, z)
	japi.FrameSetModelCameraSource(ui, x, y, z)
end

-- 设置镜头目标位置
function code.Frame_SetCameraTarget(ui, x, y, z)
	japi.FrameSetModelCameraTarget(ui, x, y, z)
end

-- 设置3d模型
function code.Frame_Set3dModel(ui, path, color_id)
	japi.FrameSetModel2(ui, path, color_id or 0)
end

-- 设置3d模型在场景内的坐标
function code.Frame_SetModelPosition(ui, x, y, z)
	japi.FrameSetModelX(ui, x)
	japi.FrameSetModelY(ui, y)
	japi.FrameSetModelZ(ui, z)
end

-- 格式化字符串-1
function code.StringFormat1(str)
	local fStr = "※"
	str = string.gsub(str, "|n", "|n" .. fStr)
	str = fStr .. str
	return str
end
