require "dataExcel"

--神话给的,暂时不知道有什么用
local japi = require 'jass.japi'

--判断游戏版本必须是1.27 
if not (japi.GetGameVersion() == 7000) then 
    return 
end 

local ffi = require 'ffi'

ffi.cdef [[
    uint32_t GetModuleHandleA(const char* name);

    int VirtualProtect(uint32_t address, uint32_t size, uint32_t new_protect, uint32_t* old_protect);
]]

local game_dll = ffi.C.GetModuleHandleA("game.dll")

local address = game_dll + 0x7F1A7B

local old_protect = ffi.new("uint32_t[1]")
local old_protect2 = ffi.new("uint32_t[1]")

--修改代码区内存权限
ffi.C.VirtualProtect(address, 0x8, 0x40, old_protect)

--修改机器码
local ptr = ffi.cast("unsigned char*", address)

local code = string.pack('I1 I1 I1 I4 I1', 0xc7, 0x43, 0x44, 10000000, 0x90)

for i = 1, #code do 
    ptr[i - 1] = code:sub(i, i):byte()
end 

--恢复权限
ffi.C.VirtualProtect(address, 0x8, old_protect[0], old_protect2)


