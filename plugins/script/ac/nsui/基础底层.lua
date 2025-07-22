local japi = require "jass.japi"

ns.ui={}
ns.ui.__index = ns.ui

--添加模版
function ns.ui.add(leixing,handle)
    local ui = setmetatable({}, ns.ui)
    ui.handle = handle
    ui._leixing = leixing
    ui._type = "ui"
    ui._show=true
    if not ns.uiz[ui.handle] then
        ns.uiz[ui.handle]=ui
    end
    return ui
end

--读取toc
function ns.ui.loadtoc(path)
    return japi.DzLoadToc(path)
end

--隐藏原生界面
function ns.ui.ycysjm()
    japi.DzFrameHideInterface()
end

--宽屏模式
function ns.ui.kpms(ok)
    japi.DzEnableWideScreen(ok)
end

--渲染屏幕黑边
function ns.ui.xrhb(w, h)
    japi.DzFrameEditBlackBorders(w, h)
end


--世界与屏幕坐标互转
local message = require 'jass.message'
--世界坐标转屏幕
function ns.world_to_screen(x, y, z)
    local screen_x, screen_y, scale = message.world_to_screen(x, y, z)
    if screen_x and screen_y then
        return screen_x * 1920 / 0.8, (0.6 - screen_y) * 1080 / 0.6, scale
    end
end

--屏幕转世界坐标
function ns.screen_to_world(x, y)
    local screen_x, screen_y = x / 1920 * 0.8, y / 1080 * 0.6
    return message.screen_to_world(x, y)
end




    