local ns = ns

ns.excel = {}
ns.excel.__index = ns.excel

local excel = {}

--新建excel
function ns.excel.create()
	local newexcel = {}
	setmetatable(newexcel, ns.excel)
	return newexcel
end

--设置表格名字方便回调
function ns.excel:set_name(name)
	self.name = name
	excel[name] = self
	return self
end

--获取表格内容(1.id, 2.类型(名字或列))
function ns.excel:get_val(id, name)
	local val

	if type(name) == "number" then
		return self:get_val(id, self.type[name])
	end
	if not self[id] then
		-- return print("没有这个id ".." "..tostring(id))
		return nil
	end

	if not self[id][name] then
		-- return print("没有这个类型 "..id.."的"..tostring(name))
		return nil
	end
	val = self[id][name]
	return val
end

--当局修改表格内容(1.id , 2.类型 3.内容)
function ns.excel:set_val(id, name, val)
	if not self[id] then
		return print("没有这个id " .. tostring(id))
	end
	if not self[id][name] then
		return print("没有这个类型 " .. id .. "的" .. tostring(name))
	end
	self[id][name] = val
	return val
end

--示范
--excel["怪物数值"]:get_val(101,"攻击力")
--excel["怪物数值"][101]["攻击力"]


--[[ ac.time(1,1,function ()
    print(excel["怪物数值"]:get_val(1001,6))
    print(excel["怪物数值"]:get_val(1001,"攻击力"))
end)
 ]]
return excel
