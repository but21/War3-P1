local jass = Jass
local ns = ns
local ac = ac

ns.timer = {}
ns.timer.__index = ns.timer

-- 创建定时器
local function create(group, t, numb, func, date)
	local newtime = {}
	t = math.max(0.01, t)
	local maxTicks = math.modf(t * 100)
	if type(numb) ~= 'number' then
		numb, func, date = 0, numb, func
	end
	newtime.maxTicks = maxTicks
	newtime.maxCount = numb
	newtime.count = 0
	newtime.lostcount = 0
	newtime.func = func
	newtime.date = date
	newtime.back = group
	setmetatable(newtime, ns.timer) -- 设置正确的元表
	table.insert(group, newtime)  -- 插入到group中
	return newtime
end

-- 创建定时器小组
function ns.timer.new()
	local newtimer = {}
	newtimer.group = {} -- 使用timers作为存储定时器的表
	setmetatable(newtimer, {
		__call = function(self, t, numb, func, date)
			return create(self.group, t, numb, func, date) -- 将self.group传给create
		end
	})
	-- 执行executeAll方法启动
	function newtimer:executeAll()
		for i = #self.group, 1, -1 do
			local obj = self.group[i]
			obj.count = obj.count + 1
			obj.counted = (obj.counted or 0) + 1
			if obj.count >= obj.maxTicks then
				obj.count = 0
				obj.maxCount = obj.maxCount - 1
				obj.lostcount = obj.lostcount + 1
				if obj.func then
					obj.func(obj, obj.maxCount, obj.date)
				end
				if obj.maxCount == 0 then
					obj:rem()
				end
			end
		end
	end

	-- 执行clearAll方法清理
	function newtimer:clearAll()
		for i = #self.group, 1, -1 do
			local obj = self.group[i]
			obj:rem()
		end
	end

	return newtimer
end

-- 调整定时器剩余次数
function ns.timer:get_numb(val)
	self.maxCount = math.max(0, self.maxCount + val)
end

-- 获取剩余时间
function ns.timer:get_losttime()
	return (self.maxTicks - self.counted) * 0.01 or 0
end

-- 获取已过时间(总数)
function ns.timer:get_runtime()
	return self.counted * 0.01 or 0
end

-- 获取定时器设定的总时间
function ns.timer:get_timemax()
	return self.maxTicks * 0.01 or 0
end

-- 获取定时器的剩余次数
function ns.timer:get_lostnumb()
	return self.maxCount or 0
end

-- 获取定时器的已走次数
function ns.timer:get_havenumb()
	return self.lostcount or 0
end

-- 调整定时器的间隔时间
function ns.timer:set_time(newt)
	self.maxTicks = math.modf(newt * 100)
	return self
end

-- 移除定时器
function ns.timer:rem()
	for i = #self.back, 1, -1 do
		if self == self.back[i] then
			table.remove(self.back, i)
			break
		end
	end
	self.date = nil
	self.func = nil
	self = nil
end

--初始化定时器系统
ac.time = ns.timer.new()
ac.loctime = ns.timer.new()

--游戏开始
local function timefunc()
	ac.time:executeAll()
	ac.loctime:executeAll()
end

--开启计时器
local time = jass.CreateTimer()
jass.TimerStart(time, 0.01, true, timefunc)
