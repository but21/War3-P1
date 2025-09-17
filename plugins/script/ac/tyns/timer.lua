local jass = Jass
local ns = ns

ns.time = {}
ns.time.__index = ns.time

-- 创建新计时器的函数
function ns.time.create()
    local time = {}
    time.handle = jass.CreateTimer()
    time.losttime = 0
    setmetatable(time, ns.time)
    ns.jsq[time.handle]=time
    return time
end

-- 计时器运行的内部函数
local function timerRunFunc()
    local self = ns.jsq[jass.GetExpiredTimer()]
    local func = self.start_func
    self.run = self.run + 1
    if func then
        func(self, self.run)
    end
end

-- 开始计时器的方法
function ns.time:start(time, loop, func)
    self.run = 0
    self.start_func = func
    self.loop = loop
    jass.TimerStart(self.handle, time, loop, timerRunFunc)
    return self
end

-- 获取计时器函数
function ns.time:get_func()
    return self.start_func
end

-- 删除计时器
function ns.time:rem()
    self.start_func = nil
    ns.jsq[self.handle] = nil
    jass.DestroyTimer(self.handle)
    self = nil
end

--设置时间
function ns.time:set_time()
    return jass.TimerGetTimeout(self.handle) or 0
end

--获取剩余时间
function ns.time:get_losttime()
    return jass.TimerGetRemaining(self.handle) or 0
end

--逝去时间
function ns.time:get_runtime()
    return jass.TimerGetElapsed(self.handle) or 0
end

-- 暂停和恢复计时器
function ns.time:set_pause(ok)
    if ok then
        jass.PauseTimer(self.handle)
    else
        jass.ResumeTimer(self.handle)
    end
    return self
end
