local Constant = {}


function Constant:Init()
	local sequenceFrameImage = {}
	-- 序列帧图片表
	Constant.sequenceFrameImage = sequenceFrameImage

	-- 获得兵器/饰品
	sequenceFrameImage.selectOne = {}
	sequenceFrameImage.selectOne.time = 0.04
	for i = 1, 16 do
		sequenceFrameImage.selectOne[i] = "Survival\\UI\\XLZ\\selectOne (" .. i .. ").blp"
	end
	-- 升级
	sequenceFrameImage.lvUp = {}
	sequenceFrameImage.lvUp.time = 0.04
	for i = 1, 12 do
		sequenceFrameImage.lvUp[i] = "Survival\\UI\\XLZ\\lvUp (" .. i .. ").tga"
	end
	-- 选择神器
	sequenceFrameImage.cx = {}
	sequenceFrameImage.cx.time = 0.02
	for i = 1, 42 do
		sequenceFrameImage.cx[i] = "Survival\\UI\\XLZ\\cx (" .. i .. ").tga"
	end
	-- 超限
	sequenceFrameImage.cx2 = {}
	sequenceFrameImage.cx2.time = 0.07
	for i = 1, 15 do
		sequenceFrameImage.cx2[i] = "Survival\\UI\\XLZ\\cx2 (" .. i .. ").tga"
	end
	-- 点击
	sequenceFrameImage.click= {}
	sequenceFrameImage.click.time = 0.04
	for i = 1, 4 do
		sequenceFrameImage.click[i] = "Survival\\UI\\XLZ\\click (" .. i .. ").tga"
	end
end

return Constant
