local BaseModule = {}

-- 自己封装的函数
BaseModule.MyFunc = require "my_ui.my_func"

---原生, 内置, YDWE
BaseModule.Common = require "my_base.common"

-- 事件
BaseModule.Event = require "my_base.event"
BaseModule.Event:Init(BaseModule.Common)

-- 创建UI函数
BaseModule.UICreate = require "my_base.ui_create"

-- 属性系统
BaseModule.AttrSystem = require "ac.tyns.AttrSystem"

-- 表格
BaseModule.Excel= require "ac.tyns.excel"

-- 表格
BaseModule.ExcelSystem = require "ac.tyns.ExcelSystem"

BaseModule.Constant = require "my_base.constant"
BaseModule.Constant:Init()

-- 伤害系统
---@return DamageSystem
BaseModule.DamageSystem = function()
	return require "my_base.damage_system"
end

-- 图片对象池
BaseModule.ImagePool = require "my_base.image_pool"
BaseModule.ImagePool:Init(BaseModule.UICreate)

BaseModule.Archive = require "my_base.archive"

-- 提示框
BaseModule.UITipDialog = require "my_ui.tip_dialog"
ac.time(0.1, 1, function()
	BaseModule.UITipDialog:Init(BaseModule.UICreate)
end)

return BaseModule
