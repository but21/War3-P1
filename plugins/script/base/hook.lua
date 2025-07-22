local jass = require "jass.common"
local hook = require 'jass.hook'

local Attr_Table = require "ac.tyns.AttrSystem".Attr_Table


--删除单位
local _RemoveUnit = jass.RemoveUnit
function hook.RemoveUnit(obj)
	local id = obj
	for i = 1, 4 do
		if id == jass.udg_Hero[i] then
			return
		end
	end
	Attr_Table[id] = nil
	_RemoveUnit(obj)
end

--删除物品
local _RemoveItem = jass.RemoveItem
function hook.RemoveItem(obj)
	local id = obj
	Attr_Table[id] = nil
	_RemoveItem(obj)
end
