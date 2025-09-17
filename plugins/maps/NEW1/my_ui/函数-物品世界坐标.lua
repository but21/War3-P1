local console = require 'jass.console'
local message = require 'jass.message'
local code = require 'jass.code'
local jass = Jass
print = console.write 
for name, func in pairs(jass) do 
    _G[name] = func
end 

itempoint=Location(0,0)

local loc = Location(0, 0)
local screen_x = 0
local screen_y = 0
local scale = 0
function code.ConverItemWorldPosition(item)

    local x, y, z = GetItemX(item), GetItemY(item), 0
    MoveLocation(loc, x, y)
    MoveLocation(itempoint, x, y)
    local z = jass.GetLocationZ(itempoint)

    screen_x, screen_y ,scale = ns.world_to_screen(x, y, z) 
end 
function code.GetItemScreenX()
    return screen_x
end 
function code.GetItemScreenY()
    return 0.6 - screen_y
end 
function code.GetItemScreenScale()
    return scale
end 

