local runtime  = require 'jass.runtime'
local console  = require 'jass.console'

local tostring = tostring
local debug    = debug

--[[ local storm    = require 'jass.storm'
local is_local = storm.load("war3map.wtg") ~= nil
if is_local then
    console.enable = true
end ]]

--console.enable = true

if console.enable then
    print = console.write

    --print = function  (...)
    --    console.write(...)
    --    console.write(debug.traceback())
    --end
else
    print = function(...)
        local args = { ... }
        local s = ''
        for index = 1, #args do
            s = s .. tostring(args[index]) .. '   '
        end
        BJDebugMsg(s)
    end
end

runtime.handle_level = 0
runtime.sleep = true
runtime.error_handle = function(msg)
    print("---------------------------------------")
    print("              LUA ERROR!!              ")
    print("---------------------------------------")
    print(tostring(msg) .. "\n")
    print(debug.traceback())
    print("---------------------------------------")
end

function printf(format, ...)
    print(string.format(format, ...))
end

function sortpairs(t)
    local mt
    local func
    local sort = {}
    for k, v in pairs(t) do
        sort[#sort + 1] = { k, v }
    end
    table.sort(sort, function(a, b)
        local first, second = a[1], b[1]

        if type(first) == 'number' and type(second) == 'string' then
            return true
        elseif type(first) == 'string' and type(second) == 'number' then
            return false
        end
        return a[1] < b[1]
    end)
    local n = 1
    return function()
        local v = sort[n]
        if not v then
            return
        end
        n = n + 1
        return v[1], v[2]
    end
end
