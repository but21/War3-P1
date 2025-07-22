local japi = require "jass.japi"
 

    --设置图片
    function ns.ui:set_image(icon)
        japi.DzFrameSetTexture(self.handle, icon, 0)
        self.image = icon
        return self
    end
    --设置图片
    function ns.ui:set_icon(icon)
        japi.DzFrameSetTexture(self.handle, icon, 0)
        self.image = icon
        return self
    end
    --获取图片
    function ns.ui:get_image()
        return self.image or ""
    end
