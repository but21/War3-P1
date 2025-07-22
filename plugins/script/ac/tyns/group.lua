local ns = ns

ns.group = {}
ns.group__index = ns.group

-- 来张表
function ns.group.new()
    local group = {}
    setmetatable(group, ns.group )
    group.count = 0
    return group
end

-- 添加对象
function ns.group:add(obj)
    if not self[obj] then
        self[obj] = {}
        self[obj].handle = obj
        self.count = self.count + 1
    end
    return self[obj]
end

-- 删除对象
function ns.group:rem(obj)
    if not self[obj] then
        error("没有这个东西")
    else
        local keyToDelete
        for i, v in pairs(self) do
            if i == obj then
                keyToDelete = i
                break
            end
        end
        if keyToDelete then
            self[keyToDelete] = nil
            self.count = self.count - 1
        end
    end
end

--计时器组 
ns.jsq = ns.group.new()
--玩家组 
ns.playerz = ns.group.new()
--单位池 
ns.dwc = ns.group.new()
--物品组 
ns.wpz = ns.group.new()
--技能组 
ns.skz = ns.group.new()
--特效组 
ns.txz = ns.group.new()
--闪电链
ns.sdl = ns.group.new()
--函数组
ns.hsz = ns.group.new()
--点 
ns.zbd = ns.group.new()
--UI 
ns.uiz = ns.group.new()
--栈
ns.stack = ns.group.new()
