local japi = require "jass.japi"
local ns = ns


--设置颜色,id是队伍颜色(具体可以在玩家情节里面看每个玩家颜色)
function ns.ui:set_mxys(color)
    self.color_id = color or 0
    japi.FrameSetModel2(self.handle, self.moxing, color or 0)
    return self
end


--设置模型(第二个颜色可以不传,有单独改队伍颜色函数)
function ns.ui:set_model(model, color_id)
    self.moxing = model
    self.color_id = color_id or 0
    japi.FrameSetModel2(self.handle, model, color_id or 0)
    return self
end

--获取模型
function ns.ui:get_model()
    return self.moxing or ""
end

--设置模型xyz尺寸
function ns.ui:set_scale(x, y, z)
    self.mdx_x = x
    self.mdx_y = y
    self.mdx_z = z
    japi.FrameSetModelScale(self.handle, x, y, z)
    return self
end

--模型缩放
function ns.ui:set_Size(sf)
    self.mdx_sf = sf
    japi.FrameSetModelSize(self.handle, sf)
    return self
end

--获取缩放
function ns.ui:get_Size()
    return japi.FrameGetModelSize(self.handle)
end

--设置模型与控件的偏移坐标
function ns.ui:set_offset(x, y)
    self.mdx_pyx = x
    self.mdx_pyy = y
    x = x / 1920 * 0.8
    y = (-y / 1080) * 0.6
    japi.FrameSetModelXY(self.handle, x, y)
    return self
end

--获取模型与控件的偏移坐标
function ns.ui:get_offset()
    local xy = {}
    local x = japi.FrameGetModelX(self.handle)
    local y = japi.FrameGetModelY(self.handle)
    x = x / 0.8 * 1920
    y = y / 0.6 * 1080 * -1
    xy[x] = x
    xy[y] = y
    return xy
end

--模型旋转x轴
function ns.ui:set_x(val)
    japi.FrameSetModelRotateX(self.handle, 0.00)
    japi.FrameSetModelRotateX(self.handle, val)
    self.xz_x = val
    return self
end

--模型旋转y轴
function ns.ui:set_y(val)
    japi.FrameSetModelRotateY(self.handle, 0.00)
    japi.FrameSetModelRotateY(self.handle, val)
    self.xz_y = val
    return self
end

--模型旋转z轴
function ns.ui:set_z(val)
    japi.FrameSetModelRotateZ(self.handle, 0.00)
    japi.FrameSetModelRotateZ(self.handle, val)
    self.xz_z = val
    return self
end


--添加附加点特效
function ns.ui:tx_add(origin, txmx)
    origin = origin or "origin"
    local handle = japi.FrameAddModelEffect(self.handle, origin, txmx)
    local ui = ns.ui.add("SPRITE",handle)
    self[origin]=ui
    if not self.txbd then
        self.txbd={}
    end
    self.txbd[origin]=self.ui
    return ui
end

--删除对应附加点特效
function ns.ui:tx_rem(origin)
    if self.txbd and self.txbd[origin] then
    japi.FrameRemoveModelEffect(self.handle, self[origin].handle)
    self[origin]=nil
    end
    return self
end

--清除所有附加点特效
function ns.ui:tx_allrem()
    if self.txbd then
    for i,_ in ipairs(self.txbd)do
        self:tx_rem(i)
    end
end
return self
end


--设置镜头位置
function ns.ui:set_camera_source(x, y, z)
    self.mdx_jt_x=x or 0
    self.mdx_jt_y=y or 0
    self.mdx_jt_z=z or 0
    japi.FrameSetModelCameraSource(self.handle, x, y, z)
    return self
end

--设置镜头目标位置
function ns.ui:set_camera_target(x, y, z)
    self.mdx_jtmb_x=x or 0
    self.mdx_jtmb_y=y or 0
    self.mdx_jtmb_z=z or 0
    japi.FrameSetModelCameraTarget(self.handle, x, y, z)
    return self
end

--设置模型在 场景内的位置,跟镜头有关系
function ns.ui:set_model_position(x, y, z)
    self.mdx_wz = { x, y, z }
    japi.FrameSetModelX(self.handle, x)
    japi.FrameSetModelY(self.handle, y)
    japi.FrameSetModelZ(self.handle, z)
    return self
end


--获取模型位置
function ns.ui:get_cjwz()
    local xyz = {japi.FrameGetModelX(self.handle), japi.FrameGetModelY(self.handle), japi.FrameGetModelZ(self.handle)}
    return xyz
end


--1,动画序号 2,是否自动播放 true 或者false
function ns.ui:set_moive_loop(id, zdbf)
    id = id or 0
    zdbf = zdbf or false
    japi.FrameSetAnimate(self.handle, id, zdbf)
    return self
end

--设置动画播放速度
function ns.ui:set_moive_speed(val)
    japi.FrameSetModelSpeed(self.handle, val or 1.00)
    return self
end

--设置动画序号
function ns.ui:set_moive_id(id)
    japi.FrameSetAnimationByIndex(self.handle, id)
    return self
end

--设置动画进度
function ns.ui:set_progress(val)
    japi.FrameSetAnimateOffset(self.handle, val)
    return self
end

--设置原版2D模型(panel)类型
function ns.ui:set_model2d(model,id,flag)
    id = id or 0
    flag = flag or 0
    self.model2d = model
    japi.DzFrameSetModel(self.handle,model,id,flag)
    return self
end


--设置禁止鼠标点击模型,填false是禁止(我还没有试过这个功能)
function ns.ui:set_jzdj(ok)
    self.mdx_dj = ok
    japi.FrameSetIgnoreTrackEvents(self.handle, ok)
    return self
end



--获取模型的动画名字,时长,索引
function ns.ui:get_dhmz()
    local list = {}
    local count = japi.FrameGetModelAnimationCount(self.handle)
    if count > 0 then
        for i = 0, count - 1 do
            local info = {
                name = japi.FrameGetModelAnimationName(self.handle, i),
                time = japi.FrameGetModelAnimationTime(self.handle, i),
                index = i,
            }
            table.insert(list, info)
        end
    end
    return list
end


--播放动画,动画名字,动画索引
function ns.ui:bfdh(movie, dhmz)
    return japi.FramePlayAnimation(self.handle, movie, dhmz or '')
end


--japi 清理
--[[ function ns.ui:reset ()
    self:set_model(self.model, self.color_id)
    self:set_animation(self.animation, self.animation_loop)
    self:set_progress(1)
    self:set_size(self.size)
    self:init()

    self:set_scale(self.scale_x, self.scale_y, self.scale_z)

    self:set_rotate_x(self.rotate_x)
    self:set_rotate_y(self.rotate_y)
    self:set_rotate_z(self.rotate_z)
    self:set_model_offset(self.offset_x, self.offset_y)

    
    if self.point then 
        self:set_model_position(table.unpack(self.point))
    end 
    if self.camera_source then 
        self:set_camera_source(table.unpack(self.camera_source))
    end 
    if self.camera_target then 
        self:set_camera_target(table.unpack(self.camera_target))
    end 

    if rawget(self, 'animation_index') then 
        self:set_animation_by_index(self.animation_index)
    end 
end ]]