local ns = ns
local excel = ns.excel.create()
excel:set_name('卡牌列表')
excel.type = {[1]="ID",[2]="BondName",[3]="FirstID",[4]="Count"}
excel[1] = {
    ["BondName"] = [=[杂物]=],
    ["FirstID"] = 1,
    ["Count"] = 3
}
excel[2] = {
    ["BondName"] = [=[芒果]=],
    ["FirstID"] = 21,
    ["Count"] = 4
}
excel[3] = {
    ["BondName"] = [=[炒蛋]=],
    ["FirstID"] = 41,
    ["Count"] = 3
}

return excel