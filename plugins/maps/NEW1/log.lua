local init = function()
	-- 定义日志文件路径
	local logFilePath = "风铃冒险\\log.txt"

	-- 确保日志文件存在，并在运行时清空
	local function ensureLogFile()
		local file = io.open(logFilePath, "w") -- 以写入模式打开文件，清空内容
		if file then
			file:write("")              -- 清空内容
			file:close()
		else
			error("无法创建或清空日志文件: " .. logFilePath)
		end
	end

	-- 自定义 print 函数
	local function logPrint(...)
		local args = { ... }
		local output = ""
		for i, v in ipairs(args) do
			output = output .. tostring(v)
			if i < #args then
				output = output .. "\t" -- 添加分隔符
			end
		end

		-- 写入日志文件
		local file = io.open(logFilePath, "a")
		if file then
			file:write("[INFO] " .. output .. "\n")
			file:close()
		end

		-- 输出到控制台
		io.write(output .. "\n")
	end

	-- 自定义错误处理函数
	local function logError(err)
		local file = io.open(logFilePath, "a")
		if file then
			file:write("[ERROR] " .. tostring(err) .. "\n")
			file:close()
		end

		-- 原样抛出错误
		error(err)
	end

	-- 重定义全局的 print
	print = logPrint

	-- 设置全局错误处理
	xpcall(function()
		-- 确保日志文件存在并清空
		ensureLogFile()

		-- -- 示例用法
		-- print("This is a test message!")
		-- print("Another line with", 123, "and", true)

		-- -- 模拟错误
		-- error("This is a test error!")
	end, logError)
end
init()
