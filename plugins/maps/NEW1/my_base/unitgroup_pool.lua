local code = require "jass.code"
local jass = require "jass.common"
local japi = require "jass.japi"

local UnitGroupPool = {}

---新建单位组进入单位组池

---@param count integer|nil 新建单位组数量
local function NewGroup(count)
	count = count or 10
	for _ = 1, count do
		table.insert(UnitGroupPool, jass.CreateGroup())
	end
end

-- 从池子中取出一个单位组
function code.GetGroup()
	-- 如果池子中单位组不够, 调用NewGroup()
	if #UnitGroupPool == 0 then
		NewGroup()
	end
	return table.remove(UnitGroupPool, #UnitGroupPool)
end

-- 回收单位组到池子
function code.RecycleGroup(group)
	if group > 0 then
		-- 清空单位组
		jass.GroupClear(group)
		-- 移回池子
		table.insert(UnitGroupPool, group)
	end
end
NewGroup()
