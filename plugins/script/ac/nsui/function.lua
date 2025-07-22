local japi = require "jass.japi"




--设置 相对位置/绝对位置
ns.ui.point = {}
ns.ui.point['左上'] = 0
ns.ui.point['顶部'] = 1
ns.ui.point['右上'] = 2
ns.ui.point['左侧'] = 3
ns.ui.point['中心'] = 4
ns.ui.point['右侧'] = 5
ns.ui.point['左下'] = 6
ns.ui.point['底部'] = 7
ns.ui.point['右下'] = 8


--设置UI位置(相对论)
function ns.ui:set_point(maodian, gensuiui, maodian2, x, y)
	local NewX    = x / 1920 * 0.8
	local NewY    = y / 1080 * 0.6
	self.maodian  = maodian
	self.x        = x
	self.y        = y
	self.gensui   = gensuiui
	self.maodian1 = maodian
	self.maodian2 = maodian2
	self.juedui3  = nil
	japi.FrameSetPoint(self.handle, ns.ui.point[maodian], gensuiui.handle, ns.ui.point[maodian2], NewX, NewY)
	return self
end

--设置UI位置(绝对位置)
function ns.ui:set_point2(maodian, x, y)
	if maodian._type == "ui" then
		return self:set_point("中心", maodian, "中心", 0, 0)
	end
	local NewX    = x / 1920 * 0.8
	local NewY    = y / 1080 * 0.6
	self.maodian  = maodian
	self.x        = x
	self.y        = y
	self.gensui   = nil
	self.maodian1 = maodian
	self.maodian2 = nil
	self.world    = { x = x, y = y }
	self.juedui3  = nil
	japi.FrameSetAbsolutePoint(self.handle, ns.ui.point[maodian], NewX, NewY)
	return self
end

--设置UI位置(绝对位置中心版)
function ns.ui:set_point3(maodian, x, y)
	if x >= 960 then x = 960 end
	if y >= 540 then y = 540 end
	if x <= -960 then x = -960 end
	if y <= -540 then y = -540 end
	local odlx    = x + 960
	local odly    = y + 540
	local NewX    = odlx / 1920 * 0.8
	local NewY    = odly / 1080 * 0.6
	self.maodian  = maodian
	self.x        = x
	self.y        = y
	self.gensui   = nil
	self.maodian1 = maodian
	self.maodian2 = nil
	self.world    = { x = NewX, y = NewY }
	self.juedui3  = { NewX, NewY }
	japi.FrameSetAbsolutePoint(self.handle, ns.ui.point[maodian], NewX, NewY)
	return self
end

--设置宽高
function ns.ui:set_wh(w, h)
	local NewW = w / 1920 * 0.8
	local NewH = h / 1080 * 0.6
	japi.FrameSetSize(self.handle, NewW, NewH)
	self.w = w
	self.h = h
	return self
end

--设置宽
function ns.ui:set_w(w)
	local NewW = w / 1920 * 0.8
	local NewH = self.h / 1080 * 0.6
	japi.FrameSetSize(self.handle, NewW, NewH)
	self.w = w
	return self
end

--设置 高
function ns.ui:set_h(h)
	local NewW = self.w / 1920 * 0.8
	local NewH = h / 1080 * 0.6
	japi.FrameSetSize(self.handle, NewW, NewH)
	self.h = h
	return self
end

--获取宽
function ns.ui:get_w()
	return self.w or 0.00
end

--获取高
function ns.ui:get_h()
	return self.h or 0.00
end

--获取宽和高
function ns.ui:get_wh()
	return self:get_w(), self:get_h()
end

--缩放
function ns.ui:set_size(val)
	japi.FrameSetScale(self.handle, val or 0)
	return self
end

--显示
function ns.ui:set_show(ok)
	if self._show ~= ok then
		japi.FrameShow(self.handle, ok)
		self._show = ok
		--响应 关联事件
		if self.automatic then
			if ok == false then
				self:func_close()
			end
			if ok == true then
				self:func_open()
			end
		end
		if ok == false then
			if self.offui then
				for _, v in pairs(self.offui) do
					v:set_show(false)
				end
			end
		end
		if self.son then
			for _, v in pairs(self.son) do
				v:set_show(ok)
			end
		end
	end

	return self
end

--判定是否显示
function ns.ui:is_show()
	return self._show
end

--透明度
function ns.ui:set_alpha(val)
	-- 确保val在0到1之间
	val = math.max(0, math.min(val, 1))
	local val2 = math.floor(val * 255)
	-- 调用japi函数设置透明度
	japi.FrameSetAlpha(self.handle, val2)
	-- 保存透明度值
	self.alpha = val
	return self
end

--获取透明度
function ns.ui:get_alpha()
	return self.alpha or 0.00
end

--设置UI透明度,以当前透明度来增加或者减少
function ns.ui:set_tm(val)
	local now = self:get_alpha()
	if val >= 0 then
		if now + val >= 1.00 then now = 1.00 else now = now + val end
		self:set_alpha(now)
	else
		if now - val <= 0 then now = 0 else now = now - val end
		self:set_alpha(now)
	end
	return self
end

--获取锚点
function ns.ui:get_point()
	return self.maodian or '中心'
end

--获取锚点
function ns.ui:get_maodian1()
	return self.maodian1
end

function ns.ui:get_maodian2()
	return self.maodian2
end

--获取跟随
function ns.ui:get_gensui()
	return self.gensui
end

--获取当前坐标
function ns.ui:get_xy()
	return self.x or 0, self.y or 0
end

--获取当前X
function ns.ui:get_x()
	return self.x or 0
end

--获取当前Y
function ns.ui:get_y()
	return self.y or 0
end

--获取UI绝对坐标
function ns.ui:get_juedui()
	local bz
	if self.gensui then
		bz = self.gensui
	else
		return self
	end
	local md = self.maodian1
	while bz == ns.ganmeui or bz.world do
		bz = bz.gensui
	end
	return bz.world
end

--清空全部锚点
function ns.ui:reset_allpoint()
	japi.FrameClearAllPoints(self.handle)
	return self
end

ns.ui.rem_allpoint = ns.ui.reset_allpoint


--设置全部锚点
function ns.ui:set_allpoint(gensuiui)
	japi.FrameSetAllPoints(self.handle, gensuiui.handle)
	return self
end

--设置优先级
function ns.ui:set_level(level)
	level = math.floor(level)
	japi.FrameSetLevel(self.handle, level)
	return self
end

--父节点
function ns.ui:set_Father(parent)
	japi.FrameSetParent(self.handle, parent.handle)
	self.father = parent
	return self
end

--获取父节点
function ns.ui:get_father()
	return self.father
end

--设置鼠标限制窗口
function ns.ui:set_xzck()
	japi.FrameSetViewPort(self.handle, true)
	return self
end

--限制鼠标
function ns.ui:limit_mouse()
	japi.FrameCageMouse(self.handle)
	return self
end

--自动判定显示和关闭
function ns.ui:dk()
	if self:is_show() == true
	then
		self:set_show(false)
	else
		self:set_show(true)
	end
end

--删除UI
function ns.ui:rem()
	japi.DestroyFrame(self.handle)
	for _, v in pairs(self) do
		if type(v) == "table" then
			v = nil
		end
	end
	ns.uiz[self.handle] = nil
	self = nil
end
