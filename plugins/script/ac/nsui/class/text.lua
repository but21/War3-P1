local japi = require "jass.japi"

local class = {}
class._stroke = { 'sLeft', 'sRight', 'sUp', 'sDown' }

-- 描边
function ns.ui:set_black()
	local sLeft, sRight, sUp, sDown
	if self.stroke then
		sLeft = self:builder 'text' { w = self.w, h = self.h, xy = { '中心', 0, 0 }, font = self.font[1] }
		sRight = self:builder 'text' { w = self.w, h = self.h, xy = { '中心', 0, 0 }, font = self.font[1] }
		sUp = self:builder 'text' { w = self.w, h = self.h, xy = { '中心', 0, 0 }, font = self.font[1] }
		sDown = self:builder 'text' { w = self.w, h = self.h, xy = { '中心', 0, 0 }, font = self.font[1] }
	end
	if self.stroke then
		self.sLeft, self.sRight, self.sUp, self.sDown = sLeft, sRight, sUp, sDown
		sLeft:set_point('中心', self, '中心', self.stroke, 0)
		sRight:set_point('中心', self, '中心', self.stroke, 0)
		sUp:set_point('中心', self, '中心', 0, self.stroke)
		sDown:set_point('中心', self, '中心', 0, self.stroke)
	end
	if self.stroke then
		function self:on_show(ojbk)
			for i = 1, 4, 1 do
				self[class._stroke[i]]:set_show(ojbk)
			end
		end

		function self:on_alpha(val)
			for i = 1, 4, 1 do
				self[class._stroke[i]]:set_alpha(val)
			end
		end
	end
	return self
end

--对齐
ns.ui.align = {}
ns.ui.align['左'] = 8
ns.ui.align['左侧'] = 8
ns.ui.align['中'] = 18
ns.ui.align['居中'] = 18
ns.ui.align['右'] = 34
ns.ui.align['右侧'] = 34

--设置文本
function ns.ui:set_text(text)
	self._text = text
	japi.DzFrameSetText(self.handle, text)
	return self
end

--获取文本
function ns.ui:get_text()
	return self._text or "获取文本丢失"
end

--字体路径
function ns.ui:set_zt(font)
	local dx = 11
	dx = dx / 1080 * 0.6
	self.font[1] = font
	self.font[2] = self.font[2] or dx
	japi.DzFrameSetFont(self.handle, self.font[1], self.font[2], self.font[3] or 0, 0)
	return self
end

--字体大小
function ns.ui:SetFontSize(val)
	val          = val / 1080 * 0.6
	self.font[1] = self.font[1] or [[fonts\fonts.ttf]]
	self.font[2] = val
	japi.DzFrameSetFont(self.handle, self.font[1], self.font[2], self.font[3] or 0, 0)
	return self
end

--字体对齐
function ns.ui:set_align(vert)
	japi.DzFrameSetTextAlignment(self.handle, ns.ui.align[vert])
	self.font.align = ns.ui.align[vert]
	return self
end

--添加字符串
function ns.ui:add_text(val)
	self:set_text(self:get_text() .. val)
	return self
end
