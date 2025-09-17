local ns = ns
local excel = ns.excel.create()
excel:set_name('概率')
excel.type = {[1]="ID",[2]="Pro1",[3]="Pro2",[4]="Pro3",[5]="Pro4",[6]="Pro5",[7]="Pro6",[8]="Pro7",[9]="Pro8"}
excel[1] = {
    ["Pro1"] = 80,
    ["Pro2"] = 97,
    ["Pro3"] = 100,
    ["Pro4"] = 100,
    ["Pro5"] = 100,
    ["Pro6"] = 50,
    ["Pro7"] = 100,
    ["Pro8"] = 100
}
excel[2] = {
    ["Pro1"] = 0,
    ["Pro2"] = 80,
    ["Pro3"] = 97,
    ["Pro4"] = 100,
    ["Pro5"] = 100,
    ["Pro6"] = 50,
    ["Pro7"] = 100,
    ["Pro8"] = 100
}
excel[3] = {
    ["Pro1"] = 0,
    ["Pro2"] = 0,
    ["Pro3"] = 80,
    ["Pro4"] = 97,
    ["Pro5"] = 100,
    ["Pro6"] = 50,
    ["Pro7"] = 99,
    ["Pro8"] = 100
}

return excel