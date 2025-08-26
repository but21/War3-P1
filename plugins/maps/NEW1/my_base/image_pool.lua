local ImagePool = {}

---初始化图片池
---@param uiCreate UICreate
function ImagePool:Init(uiCreate)
	local panel = uiCreate:CreateUIAbsolute("panel", gameui, "中心", 0, 0, 1, 1)
	panel:set_level(2)
	local pool = {}

	---@param count integer|nil 向对象池加入对象
	local function NewImage(count)
		count = count or 5
		for _ = 1, count do
			table.insert(pool, uiCreate:CreateUIAbsolute("image", panel, "中心", 0, 0, 1, 1, { isShow = false, image = [[UI\Widgets\ToolTips\Human\human-tooltip-background.blp]] }))
		end
	end

	---从图片池取出图片(异步处理)
	---@return table
	function ImagePool.GetImage()
		if #pool == 0 then
			NewImage()
		end
		local image = table.remove(pool, #pool)
		return image
	end

	---将图片放回池子(异步处理)
	---@param image table
	function ImagePool.RecycleImage(image)
		-- 移回池子
		image:reset_allpoint()
		image:set_show(false)
		table.insert(pool, image)
	end

	-- NewImage()
end

return ImagePool
