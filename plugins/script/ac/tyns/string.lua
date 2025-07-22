local base = {}

--id转整数
function base.id2i(val)
    assert(type(val) == "string", "Expected string for val")
    local n = #val
    local v = 0
    for i = 1, n do
        v = v + val:byte(i) * 256 ^ (n - i)
    end
    return v
end

--整数转id
function base.i2id(val)
    assert(type(val) == "number" and val >= 0 and val == math.floor(val), "Expected non-negative integer for val")
    if val == 0 then return "\0" end
    local v = ''
    while val > 0 do
        v = string.char(val % 256) .. v
        val = math.floor(val / 256)
    end
    return v
end

ns.i2id = base.i2id
ns.id2i = base.id2i


--转换256进制整数
base.ids1 = {}
base.ids2 = {}

function base._id(a)
	local r = ('>I4'):pack(a)
	base.ids1[a] = r
	base.ids2[r] = a
	return r
end

function base.id2string(a)
	return base.ids1[a] or base._id(a)
end

function base.__id2(a)
	local r = ('>I4'):unpack(a)
	base.ids2[a] = r
	base.ids1[r] = a
	return r
end

function base.string2id(a)
	return base.ids2[a] or base.__id2(a)
end

--ns.i2id = base.id2string
--ns.id2i = base.string2id
