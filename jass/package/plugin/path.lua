local storm = require 'jass.storm'
local is_local = storm.load("war3map.wtg") ~= nil
if is_local then 
    local excelPath = ("F:\\KKWE\\plugins\\" .. "excel\\NEW1\\?.lua;"):gsub('plugins\\', '')
    package.path = package.path .. ";"
    .. "F:\\KKWE\\plugins\\" .. "?\\init.lua;"
    .. "F:\\KKWE\\plugins\\" .. "script\\?.lua;"
    .. "F:\\KKWE\\plugins\\" .. "script\\?\\init.lua;"
    .. "F:\\KKWE\\plugins\\" .. "script\\init.lua;"
    .. "F:\\KKWE\\plugins\\" .. "maps\\NEW1\\?.lua;"
    .. "F:\\KKWE\\plugins\\" .. "maps\\NEW1\\?\\init.lua;"
    .. excelPath
    package.local_map_path = "F:\\KKWE\\plugins\\" 
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
