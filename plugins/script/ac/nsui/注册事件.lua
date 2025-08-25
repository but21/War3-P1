local japi = require "jass.japi"
local ns = ns

local xuanze, uix, uiy
local mouseX, mouseY
local sbx, sby
local player = ns.player

-- 左键
-- 点击
local function zjdj()
    local play = GetLocalPlayerID()
    local ui = get_sbui()
    local tiggername = ""

    if ui and ui.ydui then
        ui = ui.ydui
    end
    if ui and ui.tuoxy then
        xuanze = ui
        mouseX, mouseY = sbx, sby
        uix = mouseX - ui:get_x()
        uiy = mouseY - ui:get_y()
    end
    if ui and ui.uisj then
        tiggername = "左键点击"
        if ui.uisj[tiggername] then
            for _, callback in ipairs(ui.uisj[tiggername]) do
                callback(ui, play)
            end
        end
    end
    if player[play].sbsj and player[play].sbsj.left[1] then
        for _, callback in ipairs(player[play].sbsj.left[1]) do
            callback(ui, play)
        end
    end
end
-- 松开
local function zjsk()
    local ui = get_sbui()
    local play = GetLocalPlayerID()
    local tiggername = ""
    xuanze = nil
    if ui and ui.uisj then
        tiggername = "左键松开"
        if ui.uisj[tiggername] then
            for _, callback in ipairs(ui.uisj[tiggername]) do
                callback(ui, play)
            end
        end
    end
    if player[play].sbsj and player[play].sbsj.left[2] then
        for _, callback in ipairs(player[play].sbsj.left[2]) do
            callback(ui, play)
        end
    end
end

-- 右键
-- 点击
local function yjdj()
    local ui = get_sbui()
    local play = GetLocalPlayerID()
    local tiggername = ""
    if ui and ui.uisj then
        tiggername = "右键点击"
        if ui.uisj[tiggername] then
            for _, callback in ipairs(ui.uisj[tiggername]) do
                callback(ui, play)
            end
        end
    end
    if player[play].sbsj and player[play].sbsj.right and player[play].sbsj.right[1] then
        for _, callback in ipairs(player[play].sbsj.right[1]) do
            callback(ui, play)
        end
    end
end
-- 松开
local function yjsk()
    local ui = get_sbui()
    local play = GetLocalPlayerID()
    local tiggername = ""
    if ui and ui.uisj then
        tiggername = "右键松开"
        if ui.uisj[tiggername] then
            for _, callback in ipairs(ui.uisj[tiggername]) do
                callback(ui, play)
            end
        end
    end
    if player[play].sbsj and player[play].sbsj.right and player[play].sbsj.right[2] then
        for _, callback in ipairs(player[play].sbsj.right[2]) do
            callback(ui, play)
        end
    end
end

--注册左右键事件
function kaishi.sbzc()
    japi.DzTriggerRegisterMouseEventByCode(nil, 1, 1, false, zjdj)
    japi.DzTriggerRegisterMouseEventByCode(nil, 1, 0, false, zjsk)

    japi.DzTriggerRegisterMouseEventByCode(nil, 2, 1, false, yjdj)
    japi.DzTriggerRegisterMouseEventByCode(nil, 2, 0, false, yjsk)
end

--移动UI
local function ydui(x, y)
    local ui = xuanze

    local maodian1 = ui:get_maodian1()
    local gensui = ui:get_gensui()
    local maodian2 = ui:get_maodian2()

    local uiW = ui:get_w() -- 获取UI元素的宽度
    local uiH = ui:get_h() -- 获取UI元素的高度

    -- 计算新位置，同时确保它不会超出屏幕边界
    local newX = math.max(-960, math.min(x, 960 - uiW / 2))
    local newY = math.max(-540, math.min(y, 540 - uiH / 2))

    ui:set_point(maodian1, gensui, maodian2, newX, newY)
end


--鼠标坐标
local function sbyd()
    sbx, sby = japi.DzGetMouseX(), japi.DzGetMouseY()
    local pmx, pmy = japi.DzGetWindowX(), japi.DzGetWindowY()
    local pmw, pmh = japi.DzGetWindowWidth(), japi.DzGetWindowHeight()

    sbx = (sbx - pmx) / pmw * 1920
    sby = (1 - (sby - pmy) / pmh) * 1080

    sbx = sbx - (1920 / 2)
    sby = sby - (1080 / 2)

    if xuanze then
        ydui(sbx, sby)
    end
end

--获取鼠标坐标
function get_sbxy()
    return sbx, sby
end

--鼠标移动事件
function kaishi.sbyd()
    japi.DzTriggerRegisterMouseMoveEventByCode(nil, false, sbyd)
end

--按钮点击,进入和离开
local sbsj = {}
sbsj[1] = function()
    local ui = get_cfui()
    local play = GetLocalPlayerID()
    for _, callback in ipairs(ui.uisj[1]) do
        callback(ui, play)
    end
    if ui.anniushengyin then
        PlaySoundBJ(ui.anniushengyin)
    end
    -- print("sb0")
end
sbsj[2] = function()
    local ui = get_cfui()
    local play = GetLocalPlayerID()
    for _, callback in ipairs(ui.uisj[2]) do
        callback(ui, play)
    end
    -- print("sb1")
end
sbsj[3] = function()
    local ui = get_cfui()
    local play = GetLocalPlayerID()
    for _, callback in ipairs(ui.uisj[3]) do
        callback(ui, play)
    end
    -- print("sb2")
end

--注册按钮声音
function ns.ui:sound(sheng)
    sheng = sheng or ns.anniusheng
    self.anniushengyin = sheng
    return self
end

--滚轮事件表
local glsjb = {}

--注册判定鼠标是否在UI里面
function ns.ui:register_pointer()
    if not self.have_pointer then
        self:event "进入" (function(ui, play)
            player[play].zhizhen = self
        end)
        self:event "离开" (function(ui, play)
            player[play].zhizhen = nil
        end)
        self.have_pointer = true
    end
    return self
end

--注册事件
function ns.ui:event(numb)
    if self == gameui then
        return function(callback)
            for i = 1, 4 do
                player[i]:event(numb)(callback)
            end
        end
    end
    if self._leixing == "BUTTON" or "button" then
    else
        return print(" 6 " .. "UI类型错误")
    end
    if type(numb) == "string" then
        if numb == "点击" then
            numb = 1
        end
        if numb == "进入" then
            numb = 2
        end
        if numb == "离开" then
            numb = 3
        end
        if numb == "鼠标滚轮" then
            if not self.glsj then
                self.glsj = {}
                local count = #glsjb + 1
                for i = 1, #glsjb do
                    if self.level > glsjb[i].level then
                        count = i
                        break
                    end
                end
                table.insert(glsjb, count, self)
                self:register_pointer()
            end
            return function(callback)
                table.insert(self.glsj, callback)
            end
        end
        if numb == "指针滚轮" then
            if not self.glsj2 then
                self.glsj2 = {}
                self:register_pointer()
            end
            return function(callback)
                table.insert(self.glsj2, callback)
            end
        end
        if numb == "注册高亮" then
            return function(zfc, tmd)
                self:gaoguang(zfc, tmd)
            end
        end
    end
    if not self.uisj then
        self.uisj = {}
    end
    if not self.uisj[numb] then
        self.uisj[numb] = {}
        if numb == "左键点击" or numb == "左键松开" or numb == "右键点击" or numb =="右键松开" then
            self:register_pointer()
        else
            japi.DzFrameSetScriptByCode(self.handle, numb, sbsj[numb], false)
        end
    end
    return function(callback)
        table.insert(self.uisj[numb], callback)
    end
end

--注册拖动事件(鼠标进入一定需要按钮)
function ns.ui:tuodong()
    local ui = self
    if self.father ~= ns.gameui then --父控点必须是gameui
        if self.father.father == ns.gameui then
            self.ydui = self.father
            ui = self.ydui
        else
            return print(" 6 " .. "UI类型错误")
        end
    end
    if ui.gensui ~= ns.gameui then
        return print(" 6 " .. "锚点跟随必须是gameui")
    end
    ui.tuoxy = true
    return self
end

--注册按钮打开显示UI
function ns.ui:set_dkui(ui2)
    if not self.dkui then
        self.dkui = {}
        self:event "点击" (function(ui)
            for i = 1, #ui.dkui do
                if ui.dkui[i]:is_show() then
                    ui.dkui[i]:set_show(false)
                else
                    ui.dkui[i]:set_show(true)
                end
            end
        end)
    end
    table.insert(self.dkui, ui2)
    return self
end

--鼠标滚轮
local function sbgl()
    ns.gdjt()
    local play = GetLocalPlayerID()
    local zzui = player[play].zhizhen
    if zzui then
        -- for i = 1, #zzui.glsj2 do
            -- zzui.glsj2[i](zzui, play)
        -- end
    else
        for a = 1, #glsjb do
            if glsjb[a]:is_show() then
                for b = 1, #glsjb[a].glsj do
                    glsjb[a].glsj[b](play)
                end
                break
            end
        end
    end
end

--注册鼠标滚轮事件
function kaishi.sbgl()
    japi.DzTriggerRegisterMouseWheelEventByCode(nil, false, sbgl, false)
end

--每帧绘制事件表
mzhz = {}
function ac.mzhz(func)
    if func then
        table.insert(mzhz, func)
    end
end

--每帧绘制注册
function kaishi.mzhz()
    japi.DzFrameSetUpdateCallbackByCode(function()
        --ns.mzhz()
        for _, v in ipairs(mzhz) do
            v()
        end
    end)
end

--注册玩家左键右键点击松开
function ns.player:event(name)
    local numb = 0
    if type(name) == "string" then
        if name == "左键点击" then
            name = "left"
            numb = 1
        end
        if name == "左键松开" then
            name = "left"
            numb = 2
        end
        if name == "右键点击" then
            name = "right"
            numb = 1
        end
        if name == "右键松开" then
            name = "right"
            numb = 2
        end
    else
        return print("左键右键的名字错了")
    end
    if not self.sbsj then
        self.sbsj = {}
    end
    if not self.sbsj[name] then
        self.sbsj[name] = {}
    end
    if not self.sbsj[name][numb] then
        self.sbsj[name][numb] = {}
    end
    return function(callback)
        table.insert(self.sbsj[name][numb], callback)
    end
end

--偷懒整合

--按钮注册高亮(只能给按钮类型的注册,参数传不传都行.只是透明度或者自己设定有图片)
function ns.ui:gaoguang(zfc, tmd)
    if type(zfc) ~= "numb" then
        tmd = zfc
    end
    zfc = zfc or ns.gaoguang
    tmd = tmd or 1.00 --默认透明度
    local father = self:get_parent()
    if self._leixing ~= "BUTTON" then
        return print(" 6 " .. "UI类型错误")
    end
    if self.gaoliang then
        return print(" 6 " .. "注册过了")
    end
    local Newui = father:builder "image" { w = self:get_w(), h = self:get_h(), xy = { "中心", self, "中心", 0, 0 }, image = zfc }
        :set_show(false):set_alpha(tmd)

    self.gaoliang = Newui
    self:event "进入" (function(ui)
        ui.gaoliang:set_show(true)
        print(ui.gaoliang.image)
    end)
    self:event "离开" (function(ui)
        ui.gaoliang:set_show(false)
    end)
    return self
end

--设置高亮宽高
function ns.ui:set_glwh(w, h)
    if self.gaoliang then
        self.gaoliang:set_wh(w, h)
    end
    return self
end

--按钮注册暗图标(只能给按钮类型的注册,参数传不传都行.只是透明度或者自己设定有图片)
function ns.ui:antubiao(zfc, tmd)
    if type(zfc) ~= "string" then
        tmd = zfc
        zfc = zfc or ns.antubiao
    end

    tmd = tmd or 0.5 --默认透明度
    if self._leixing ~= "BUTTON" then
        return print(" 6 " .. "UI类型错误")
    end
    if self.antupian then
        return print(" 6 " .. "注册过了")
    end
    local Newui = self:image { w = self:get_w(), h = self:get_h(), xy = { "中心", self, "中心", 0, 0 }, tupian = zfc }
        :set_show(true):set_tmd(tmd)
    self.antupian = Newui
    return self
end

--设置暗图宽高
function ns.ui:set_atwh(w, h)
    if self.antupian then
        self.antupian:set_wh(w, h)
    end
    return self
end

--[[ ns.ui:event "点击" (function(ui,play)
    print("test")
print(play,ui)
end) ]]


-----------------替换之前阿七的函数
--显示
function ns.ui:show(ok)
    self:set_show(ok)
    return self
end

--按钮进入和离开
local sbsj2 = {}
sbsj2[1] = function()
    local ui = get_cfui()
    local play = GetLocalPlayerID()
    if ui.on_button_clicked then
        ui:on_button_clicked(play)
    end
    -- 播放声音
    if ui.anniushengyin then
        PlaySoundBJ(ui.anniushengyin)
    end
    -- print("sbsb0")
end
sbsj2[2] = function()
    local ui = get_cfui()
    local play = GetLocalPlayerID()
    if ui.on_button_mouse_enter then
        ui:on_button_mouse_enter(play)
    end
    -- print("sbsb1")
end
sbsj2[3] = function()
    local ui = get_cfui()
    local play = GetLocalPlayerID()
    if ui.on_button_mouse_leave then
        ui:on_button_mouse_leave(play)
    end
    -- print("sbsb2")
end

--注册点击
--ui:on_button_clicked()
function ns.ui:register_click()
    -- print("注册点击")
    japi.DzFrameSetScriptByCode(self.handle, 1, sbsj2[1], false)
    return self
end

--鼠标进入
--ui:on_button_mouse_enter()
function ns.ui:register_mouse_enter()
    -- print("注册鼠标进入")
    japi.DzFrameSetScriptByCode(self.handle, 2, sbsj2[2], false)
    return self
end

--鼠标离开
--ui:on_button_mouse_leave()
function ns.ui:register_mouse_leave()
    -- print("注册鼠标离开")
    japi.DzFrameSetScriptByCode(self.handle, 3, sbsj2[3], false)
    return self
end

--[[ ac.time(1,1,function ()
    player[1]:event("左键点击")(function ()
        print("玩家1获得一个香蕉")
    end)

    player[1]:event("左键松开")(function ()
        print("玩家1获得一个芒果")
    end)

end) ]]


-- ac.time(1,1,function ()


-- gameui:event "左键点击" (function()
--     local playerid = get_bdwj()
--     print("玩家" .. tostring(playerid) .. "获得一个芒果")
-- end)

-- gameui:event "右键点击" (function()
--     local playerid = get_bdwj()
--     print("玩家" .. tostring(playerid) .. "获得一个香蕉")
-- end)

-- gameui:event "左键松开" (function()
--     local playerid = get_bdwj()
--     print("玩家" .. tostring(playerid) .. "左键松松的")
-- end)

-- gameui:event "右键松开" (function()
--     local playerid = get_bdwj()
--     print("玩家" .. tostring(playerid) .. "右键松松的")
-- end)

-- end)

-- 左键右键UI的注册按钮演示 -- 使用的时候记得加个ac.time 0.0x 秒后注册

-- local function testui()
--     local button = gameui:builder "button" { w = 128, h = 128, xy = { '中心', gameui, '中心', 0, 0 } }
--     button._name = "狮鹫牢笼"
--     local image = gameui:builder "image" { w = 128, h = 128, xy = { '中心', gameui, '中心', 0, 0 } }
--     image:set_image([[ReplaceableTextures\CommandButtons\BTNGryphonRider.blp]])
--     -----------------------------
--     button:event "左键点击" (function(ui, play)
--         print("左键点击了")
--         print(play, ui._name)
--     end)
--     button:event "左键松开" (function(ui, play)
--         print("左键松开了")
--         print(play, ui._name)
--     end)
--     button:event "右键点击" (function(ui, play)
--         print("右键点击了")
--         print(play, ui._name)
--     end)
--     button:event "右键松开" (function(ui, play)
--         print("右键松开了")
--         print(play, ui._name)
--     end)
-- end
