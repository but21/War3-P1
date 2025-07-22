#include "DzAPI.j"                 

//将resource  跟 plugin 导入到地图中
<?
    local seach_path
    local version = tonumber(tostring(ydwe_version):sub(1, 4)) or 0  --ydwe的版本号
    local count = 0
    if version == 1.31 or version == 0 then --计算当前地图mpq 的文件数量 扩容512
        local ffi = require 'ffi'
        local stormlib = ffi.load('stormlib')
        for _ in pairs(__map_handle__) do 
            count = count + 1
        end 
        stormlib.SFileSetMaxFileCount(__map_handle__.handle, count + 512)
    end

    function input_file(path, root)
        local full_path = path:string() --文件全路径
        local file_name = path:filename():string() --文件名
        local extension = path:extension():string() --文件后缀
        --if extension == '.lua' then 
            --全路径 替换成 script\ 开头的相对路径
            local target_path = full_path:gsub(root:string(), '')
            if version >= 1.32 then 
                --要先创建一个文件夹
                fs.create_directories((__map_path__ / target_path):parent_path())
                 --放到地图文件夹目录下
                fs.copy_file(path, __map_path__ / target_path, true)
            elseif version == 1.31 or version == 0 then
                --print("file_name" .. file_name)
                __map_handle__:add_file(file_name, path)
            end
        --end
    end
    --搜索文件
    local function seach_file(path, root)
        --遍历文件目录
        for child in path:list_directory() do 
            --如果是文件夹 则再进入一层
            if fs.is_directory(child) then 
                seach_file(child, root)
            else 
                --否则 直接处理文件
                --print(child)
                input_file(child, root)
            end
        end
    end
    local function split(str, p)
	    local rt = {}
    	string.gsub(str, '[^]' .. p .. ']+', function (w) table.insert(rt, w) end)
    	return rt
    end
    local function absolute(path)
        local str = path:string()
        local list = split(str, '\\')
        local i = #list 
        local result = {}
        while i > 0 do 
            local s = list[i]
            if s ~= '..' and s ~= '.' then 
                table.insert(result, 1, s)
            end
            if s == '..' then 
                i = i - 1
            end 
            i = i - 1
        end
        table.insert(result, '')
        return table.concat(result, '\\')
    end
    --路径
    local kkwe_path = [[F:\\KKWE\\]]
    local map_path = [[maps\\NEW1\\]]
    local excel_path = [[excel\\NEW1]]

    local root = fs.path[[plugins\]]
    local code = [[
local storm = require 'jass.storm'
local is_local = storm.load("war3map.wtg") ~= nil
if is_local then 
    local excelPath = ("path" .. "excel\\NEW1\\?.lua;"):gsub('plugins\\', '')
    package.path = package.path .. ";"
    .. "path" .. "?\\init.lua;"
    .. "path" .. "script\\?.lua;"
    .. "path" .. "script\\?\\init.lua;"
    .. "path" .. "script\\init.lua;"
    .. "path" .. "maps\\NEW1\\?.lua;"
    .. "path" .. "maps\\NEW1\\?\\init.lua;"
    .. excelPath

    package.local_map_path = "path" 

else 
    package.path = package.path .. ";"
        .. "?\\init.lua;"
        .. "script\\?.lua;"
        .. "script\\?\\init.lua;"
        .. "script\\init.lua;"
        .. "maps\\NEW1\\?.lua;"
        .. "maps\\NEW1\\?\\init.lua;"
        .. "excel\\NEW1\\?.lua;"
end

return is_local
]]
    code = code:gsub('"path"', string.format("%q",absolute(fs.absolute(root))))
    io.save(root / 'path.lua', code)
    --seach_file(root, root)
    if JAPI_PATH then 
        root = fs.path(JAPI_PATH) / 'plugin'

        local code2 = code:gsub('"path"', string.format("%q",absolute(fs.absolute(root))))
        io.save(root / 'path.lua', code2)
        seach_file(root, root)
    end 
    local excelPath = fs.path('F:\\KKWE\\excel\\NEW1')
    seach_file(excelPath, root)
?>

//导入内置的jass载入脚本
#include "macro.j"
#include "macro2.j"
#include "embedded.j"


