local ns = ns
local excel = ns.excel.create()
excel:set_name('名单')
excel.type = {[1]="ID",[2]="Value1",[3]="Value2",[4]="Value3"}
excel["Name1"] = {
    ["Value1"] = 1,
    ["Value2"] = 1,
    ["Value3"] = 1
}

return excel