local ns = ns

ns.point = {}
ns.point.__index = ns.point

ns.area = {}
ns.area.__index = ns.area

--创建点
function ns.point.create(x, y, z)
    local point
    z = z or 0.00
    if type(x) == "table" then
        if x._type then
            point = x:get_xy()
        else
            point = { x[1], x[2], z }
        end
    else
        point = { x, y, z }
    end
    setmetatable(point, ns.point)
    point._type = "point"
    return point
end

--创建位移点
function ns.point.create2(x, y, angle, distance)
    local point
    local z = 0.00
    if type(x) == "table" then
        distance = angle
        angle = y
        if not x._type then
            point = { x[1], x[2], z }
        else
            point = x:get_xy()
        end
    else
        point = { x, y, z }
    end

    local radian = angle

    -- 计算新点的坐标
    local x = point[1] + distance * math.cos(radian)
    local y = point[2] + distance * math.sin(radian)

    local point = ns.point.create(x, y)

    return point
end

--创建圆心半径随机点(第一个参数必须是表)(1,起点 2,半径 3,数量 ,4,不均匀:true)
function ns.point.create3(point, range, numb, set)
    point = point:get_xy()
    local p = 0
    local points = {}
    if not set then
        numb = numb - 1
        table.insert(points, point)
        p = range / 3.5
    end
    for i = 1, numb do
        local angle
        if not set then
            angle = i * (360 / numb)
        else
            angle = ns.sjzs(1, 360)
        end
        local juli = ns.sjzs(p, range)
        local new = ns.point.create2(point, angle, juli)
        table.insert(points, new)
    end
    return points
end

--修改点的x
function ns.point:set_x(x)
    local x1 = x - self[1]
    if self.fkd then
        for _, v in pairs(self.fkd) do
            v[1] = v[1] + x1
        end
    end
    self[1] = x
    return self
end

--修改点的y
function ns.point:set_y(y)
    local y1 = y - self[2]
    if self.fkd then
        for _, v in pairs(self.fkd) do
            v[2] = v[2] + y1
        end
    end
    self[2] = y
    return self
end

--修改点的z
function ns.point:set_z(z)
    self[3] = z
    return self
end

--修改点的xy
function ns.point:set_xy(x, y)
    local point
    if type(x) == "table" then
        if x._type then
            point = x:get_xy()
        else
            point = { x[1], x[2] }
        end
    else
        point = { x, y }
    end
    self[1]=point[1]
    self[2]=point[2]
    return self
end

--修改点的xy(位移)
function ns.point:set_wy(angle, distance)
    local radian = angle
    -- 计算新点的坐标
    local x = self[1] + distance * math.cos(radian)
    local y = self[2] + distance * math.sin(radian)
    self:set_x(x)
    self:set_y(y)
    return self
end

--设置父节点
function ns.point:set_father(point)
    if not point.fkd then
        point.fkd = {}
    end
    self.baba = point
    point.fkd[self] = self
    return self
end

--获取父节点
function ns.point:get_parent()
    return self.baba
end

--创建方向均匀点
function ns.point:linear(angle, distance, numb)
    local radian = angle
    local points = {}

    -- 计算中心点的索引
    local center = math.ceil(numb / 2)
    local isEven = numb % 2 == 0
    points.more = 0

    for i = 1, numb do
        local offset = isEven and (i - center - 0.5) or (i - center)
        local x = self[1] + offset * distance * math.cos(radian)
        local y = self[2] + offset * distance * math.sin(radian)
        local point = ns.point.create(x, y)
        table.insert(points, point)
        points.more = points.more + 1
    end


    setmetatable(points, ns.point)
    return points
end

--通用返回点
function ns.point:get_xy()
    return self
end

--给点上目标(支持正向)
function ns.point:flag(angle, distance)
    if self.more then
        for i, v in ipairs(self) do
            v.mb = ns.point.create2(v, angle, distance)
        end
    else
        self.mb = ns.point.create2(self, angle, distance)
    end
    return self
end

--创建方形范围(随机用)
function ns.area.create(p, w, h)
    local area
    if type(p) == "table" then
        if p._type == "point" then
            area = { p = p, w = w, h = h }
        else
            area = { p = { p[1], p[2] }, w = w, h = h }
        end
    end
    setmetatable(area, ns.area)
    area._type = "area"
    return area
end

--范围里面的随机坐标
function ns.area:romponint()
    local newxy = {}
    local w = self.w
    local h = self.h
    local x = self.p[1]
    local y = self.p[2]
    newxy[1] = x + (ns.sjzs(-(w / 2), w / 2))
    newxy[2] = y + (ns.sjzs(-(h / 2), h / 2))

    return newxy
end

--判定是点还是范围
function ns.point.is_zuobiao(xy)
    if xy._type == "point" then
        return xy
    end
    if xy._type == "area" then
        local newxy = xy:romponint()

        return newxy
    end
end

--清掉点
function ns.point:rem()
    if ns.zbd[self] then
        ns.zbd:rem(self)
    end
    self = nil
end

--渐变转表和点
function ns.newxy(point)
    local newxy = {}
    if not point._type then
        newxy = ns.cjdian(point[1], point[2])
    end
    if point._type and point._type ~= "point" then
        newxy = point:get_xy()
    end
    return newxy
end
