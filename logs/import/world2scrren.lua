local console = require 'jass.console'
local message = require 'jass.message'
local code = require 'jass.code'
local jass = require 'jass.common'
print = console.write 
for name, func in pairs(jass) do 
    _G[name] = func
end 
local loc = Location(0, 0)
local screen_x = 0
local screen_y = 0
local scale = 0
function code.ConverUnitWorldPosition(unit)
    local x, y, z = GetUnitX(unit), GetUnitY(unit), GetUnitFlyHeight(unit)
    MoveLocation(loc, x, y)
    
    z = z + GetLocationZ(z) + 250
    --z = z + message.unit_overhead(unit)
    screen_x, screen_y, scale = ns.world_to_screen(x, y, z) 
    
end 
function code.GetScreenX()
    return screen_x
end 
function code.GetScreenY()
    return 0.6 - screen_y
end 
function code.GetScreenScale()
    return scale
end 
