 

--按钮注册背景(只能给按钮和panel类型的注册,参数传不传都行.只是透明度或者自己设定有图片)
function ns.ui:beijing(zfc, tmd)
    if type(zfc) == "string" then
        zfc = zfc or [[ReplaceableTextures\CommandButtons\BTNPeasant.blp]]
    else
        tmd = zfc
    end
    tmd = tmd or 1.00 --默认透明度
    if self._leixing ~= "BUTTON" then
        return print(" 6 " .. "UI类型错误")
    end

    local Newui = self:image { w = self:get_w(), h = self:get_h(), xy = { "中心", self, "中心", 0, 0 }, tupian = zfc, tmd = tmd }

    -- print(zfc)

    return Newui
end

