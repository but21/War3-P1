local event = require 'ev'
local wtgloader = require 'fix-wtg.loader'

local ignore_once = nil
event.on('virtual_mpq: open map', function(mappath)
    if ignore_once == mappath then
        ignore_once = nil
        return
    end
    ignore_once = mappath
    log.info('Open map', mappath)
    wtgloader(mappath)
end)
