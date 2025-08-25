local japi = require "jass.japi"
local code = require "jass.code"
local jass = require "jass.common"

ns.back = {}
local player = ns.player

--回调指定目标
function get_back(obj)
    if obj then
        if obj._type == "nuit" then
            obj = ns.dwc[obj]
        end
        if obj._type == "item" then
            obj = ns.wpz[obj]
        end
    end
    return obj
end

--------------------------------------------------------------------------------------------超级无敌分割线----------------------------------------------------------------------------------------------------------


--回调选择单位
function get_xzdw()
    local u = ns.dwc[japi.GetRealSelectUnit()] or {}
    return u
end

--回调触发单位
function get_cfdw()
    local u = ns.dwc[jass.GetTriggerUnit()] or {}
    return u
end

--回调选择单位
function get_swdw()
    local u = ns.dwc[jass.GetDyingUnit()] or {}
    return u
end

--回调攻击单位
function get_gjdw()
    local u = ns.dwc[jass.GetAttacker()] or {}
    return u
end

--回调选取单位
function get_xqdw()
    local u = ns.dwc[jass.GetEnumUnit()] or {}
    return u
end

--回调伤害来源
function get_shdw()
    local u = ns.dwc[jass.GetEventDamageSource()] or {}
    return u
end

--回调购买者
function get_gmdw()
    local u = ns.dwc[jass.GetBuyingUnit()] or {}
    return u
end

--回调凶手
function get_xsdw()
    local u = ns.dwc[GetKillingUnitBJ()] or {}
    return u
end

--回调召唤者
function get_zhz()
    local u = ns.dwc[jass.GetSummoningUnit()] or {}
    return u
end

--回调命令发布单位
function get_mldw()
    local u = ns.dwc[jass.GetOrderTargetUnit()] or {}
    return u
end

--回调技能发动目标
function get_jnmb()
    local u = ns.dwc[jass.GetSpellTargetUnit()] or {}
    return u
end

--------------------------------------------------------------------------------------------超级无敌分割线----------------------------------------------------------------------------------------------------------



--回调被操作的物品
function get_czwp()
    local it = ns.wpz[jass.GetManipulatedItem()] or {}
    return it
end

--回调被出售的物品
function get_cswp()
    local it = ns.wpz[jass.GetSoldItem()] or {}
    return it
end

--回调技能发动目标物品
function get_jnmb2()
    local it = ns.wpz[jass.GetSpellTargetItem()] or {}
    return it
end

--回调选取的物品
function get_xqwp()
    local it = ns.wpz[jass.GetEnumItem()] or {}
    return it
end

--回调单位格子物品
function get_gzwp(unit, numb)
    local it = jass.UnitItemInSlot(unit.handle, numb - 1)
    if it and ns.wpz[it] then
        return ns.wpz[it]
    end
end

--------------------------------------------------------------------------------------------超级无敌分割线----------------------------------------------------------------------------------------------------------


--回调触发玩家
function get_cfwj()
    local wj = player[GetConvertedPlayerId(jass.GetTriggerPlayer())] or {}
    return wj
end

--回调单位玩家
function get_dwwj()
    local wj = player[GetConvertedPlayerId(jass.GetOwningPlayer(jass.GetTriggerUnit()))] or {}
    return wj
end

--获取本地玩家id
function GetLocalPlayerID()
    return GetConvertedPlayerId(jass.GetLocalPlayer())
 end
 

--------------------------------------------------------------------------------------------超级无敌分割线----------------------------------------------------------------------------------------------------------

--回调触发UI
function get_cfui()
    local ui = ns.uiz[japi.DzGetTriggerUIEventFrame()] or {}
    return ui
end

--回调指针UI
function get_sbui()
    local ui = ns.uiz[japi.DzGetMouseFocus()] or {}
    return ui
end