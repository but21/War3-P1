local ns = ns
--按下F11-热更新UI
ns.anniufunc(1, 122)(function()
	--重载每帧绘制
	mzhz = {}
	for i = 1, #ns.ui.allui do
		ns.ui.allui[i]:rem()
	end
	ns.ui.allui = {}
	--同步
	ac.time:clearAll()
	--异步
	ac.loctime:clearAll()
	for name in pairs(package.loaded) do
		if name:find("ui") then
			-- print('UI类', name)
			package.loaded[name] = nil
		end
	end
	require 'ui'
	--血条
	for _, v in pairs(ns.dwc) do
		if type(v)=="table" and v._type then
			v:blood()
		end
	end

end)

--按下F9调试(做技能好)
ns.anniufunc(1, 120)(function()
	--同步
	-- ac.time:clearAll()
	for name in pairs(package.loaded) do
		if name:find("调试") then
			-- print('DEBUG', name)
			package.loaded[name] = nil
		end
	end
	require '调试'
end)
