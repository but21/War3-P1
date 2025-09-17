local math = math

--由于在网易 double类型的数学函数 在窗口化时 会丢失精度 所以改用魔兽的float单精浮点数 统一丢掉4字节 防止异步
local jass = Jass

--弧度好
local deg = jass.Rad2Deg(1)
local rad = jass.Deg2Rad(1)


--正弦
local sin = jass.Sin
function math.sin(r)
	return sin(r * rad)
end

--余弦
local cos = jass.Cos
function math.cos(r)
	return cos(r * rad)
end

--正切
local tan = jass.Tan
function math.tan(r)
	return tan(r * rad)
end

--反正弦
local asin = jass.Asin
function math.asin(v)
	return asin(v) * deg
end

--反余弦
local acos = jass.Acos
function math.acos(v)
	return acos(v) * deg
end

--反正切
local atan = jass.Atan2
function math.atan(v1, v2)
	return atan(v1, v2) * deg
end

-- 平方根
local sqrt = jass.SquareRoot
function math.sqrt(v)
	return sqrt(v)
end

--实数转整数
function math.r2i(v)
	if v >= 0 then
		return v - v % 1
	else
		return v - v % -1
	end
end

--保留小数
function math.blxs(v, n)
	local i  = 10 ^ n
	local v2 = (v) * i + 0.01
	v2       = v2 - v2 % 1
	v2       = v2 / i
	return v2
end

--随机整数
function math.sjzs(min, max)
	return jass.GetRandomInt(min, max)
end

ns.sjzs = math.sjzs

--转百分小值
function math.bfxs(val) return val * 0.01 end

--随机百分
function math.sjbf()
	return jass.GetRandomInt(1, 10000) / 100
end

--两坐标之间的方向
function ns.angle(x, y, x2, y2)
	return jass.bj_RADTODEG * Atan2(y2 - y, x2 - x)
end

--两坐标之间的距离
function ns.juli(x, y, x2, y2)
	local dx = x2 - x
	local dy = y2 - y
	return math.sqrt(dx * dx + dy * dy)
end

-- 两个三维坐标之间的距离
function ns.juli3D(x, y, z, x2, y2, z2)
	local dx = x2 - x
	local dy = y2 - y
	local dz = z2 - z
	return math.sqrt(dx * dx + dy * dy + dz * dz)
end

-- 两个三维坐标之间的角度
function ns.angle3D(x, y, z, x2, y2, z2)
	local dx = x2 - x
	local dy = y2 - y
	local dz = z2 - z

	-- 计算水平面内的角度（方位角）
	local azimuth = jass.bj_RADTODEG * (Atan2(dy, dx))
	-- 计算水平距离
	local horizontalDistance = math.sqrt(dx * dx + dy * dy)

	-- 计算仰角
	local elevation = jass.bj_RADTODEG * (Atan2(dz, horizontalDistance))

	return azimuth, elevation, horizontalDistance
end

--最小值
function ns.zuixiao(val, val2)
	return math.min(val, val2)
end

--最大值
function ns.zuida(val, val2)
	return math.max(val, val2)
end

--获取表的完整长度
function ns.get_table(table)
	local count = 0
	for k, v in pairs(table) do
		count = count + 1
	end
	return count
end

--XY偏移
function ns.xy_move(x, y, face, distance)
	return x + (math.cos(face) * distance), y + (math.sin(face) * distance)
end

-- 弧度
function ns.hd(x1, y1, x2, y2)
	local angle = math.atan(y2 - y1, x2 - x1)
	return angle
end

-- 如果您想要将结果转换为度数
function ns.faceis(radians)
	local degrees = radians * (180 / math.pi)
	return degrees
end

--随机数字选取不重复(1-起点 ,2-最大值 ,3-选取数量)
function ns.sjzs2(min, max, num)
	if num > max then
		print("选取数字大于池子了")
	else
		local rom = {}
		for i = min, max do
			table.insert(rom, i)
		end

		-- 随机打乱表中的数字顺序
		for i = 1, #rom do
			local j = math.sjzs(i, #rom)
			rom[i], rom[j] = rom[j], rom[i]
		end

		-- 选择前NUM个数字（不重复）
		local xznumb = {}
		for i = 1, num do
			table.insert(xznumb, rom[i])
		end

		return xznumb
	end
end

--随机数字池
function ns.sjsz(...)
	local args = { ... }                   -- 将所有参数存储在一个表中
	local numargs = #args                  -- 获取参数的数量
	if numargs == 0 then
		return nil                         -- 如果没有提供参数，则返回 nil
	else
		local randomIndex = math.random(numargs) -- 随机选择一个索引
		return args[randomIndex]           -- 返回这个索引对应的参数
	end
end

--两个坐标角度(表或者单位,特效)
function ns.face(new1, new2)
	local x1, y1, x2, y2
	if type(new1) == "table" then
		if not new1._type then
			x1 = new1[1]
			y1 = new1[2]
		else
			new1 = new1:get_xy()
			x1 = new1[1]
			y1 = new1[2]
		end
	end
	if type(new2) == "table" then
		if not new2._type then
			x2 = new2[1]
			y2 = new2[2]
		else
			new2 = new2:get_xy()
			x2 = new2[1]
			y2 = new2[2]
		end
	end

	local face = ns.angle(x1, y1, x2, y2)
	return face
end

--两个坐标距离(表或者单位)
function ns.distance(new1, new2)
	local x1, y1, x2, y2
	if type(new1) == "table" then
		if not new1._type or new1._type == "point" then
			x1 = new1[1]
			y1 = new1[2]
		else
			new1 = new1:get_xy()
			x1 = new1[1]
			y1 = new1[2]
		end
	end
	if type(new2) == "table" then
		if not new2._type or new2._type == "point" then
			x2 = new2[1]
			y2 = new2[2]
		else
			new2 = new2:get_xy()
			x2 = new2[1]
			y2 = new2[2]
		end
	end

	local distance = ns.juli(x1, y1, x2, y2)

	return distance
end

--平方根
function ns.pfg(val)
	return math.sqrt(val)
end

--立体旋转换算
function ns.mdx_ang(x, y, z, ang)
	local newangle = 0
	local temp_x = 0
	local temp_y = 0
	local temp_z = 0
	return newangle
end

return math
