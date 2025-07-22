local jass = require "jass.common"
local path = ''
local bool, res = pcall(require, 'path')
local console = require 'jass.console'

print = console.write

if res then
    console.enable = true
    print('本地路径')
else
    print('地图内路径')
end
--[[ xpcall(function ()
    require 'script'
end, function (msg)
    --print(msg, '\n', debug.traceback())
end) ]]

require 'base'

local japi = require 'jass.japi'
japi.SetOwner('问号')

--宽屏模式
local GetWindowWidth = japi.GetWindowWidth
local GetWindowHeight = japi.GetWindowHeight
local IsWindowMode = japi.IsWindowMode
local SetWindowSize = japi.SetWindowSize

--启动宽屏 窗口模式下 强行 16:9
function Set_windows()
    local w, h = GetWindowWidth(), GetWindowHeight()
    if w / h ~= 17 / 9 and (IsWindowMode()) then
        SetWindowSize(h / 9 * 17, h)
    end
end

--初始化启动
ac.time(0.01, 1, function()
    Set_windows()
end)


--清理字符串乱码问题
local ing = false
function Set_string()
    if ing == false then
        ing = true
        local w, h = GetWindowWidth(), GetWindowHeight()
        if w / h ~= 16 / 8 and (IsWindowMode()) then
            SetWindowSize(h / 8 * 16, h)
        end
        ac.time(0.01, 1, function()
            Set_windows()
            ing = false
        end)
    end
end


-- 强制宽屏 
ac.time(1, function ()
    local w, h = japi.GetWindowWidth(), japi.GetWindowHeight()
    if  w / h ~= 16 / 9 and japi.IsWindowMode then
        japi.SetWindowSize(w, w / 16 * 9)
    end
end)

