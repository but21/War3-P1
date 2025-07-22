local Bezier = {
    _VERSION     = 'Bezier 1.0.0',
    _DESCRIPTION = 'Bezier Tween library for Lua',
    _URL         = 'https://example.com',
    _LICENSE     = 'MIT License'
}

-- Utility functions
local function factorial(n)
    if n == 0 then return 1 end
    return n * factorial(n - 1)
end

local function binomialCoefficient(n, k)
    return factorial(n) / (factorial(k) * factorial(n - k))
end

-- Create a Bezier curve function
local function createBezierCurve(controlPoints)
    local n = #controlPoints - 1
    return function(t)
        local x, y = 0, 0
        for i, point in ipairs(controlPoints) do
            local binom = binomialCoefficient(n, i - 1)
            local a = binom * (t ^ (i - 1)) * ((1 - t) ^ (n - i + 1))
            x = x + a * point[1]
            y = y + a * point[2]
        end
        return x, y
    end
end

-- Bezier class
local BezierClass = {}
BezierClass.__index = BezierClass

function BezierClass:new(controlPoints, duration)
    local curve = createBezierCurve(controlPoints)
    return setmetatable({curve = curve, duration = duration, elapsed = 0}, BezierClass)
end

function BezierClass:update(dt)
    self.elapsed = math.min(self.elapsed + dt, self.duration)
    local t = self.elapsed / self.duration
    local x, y = self.curve(t)
    return {x = x, y = y}, self.elapsed == self.duration
end

Bezier.new = function(controlPoints, duration)
    return BezierClass:new(controlPoints, duration)
end

return Bezier
