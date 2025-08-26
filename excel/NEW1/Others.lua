local ns = ns
local excel = ns.excel.create()
excel:set_name('其它')
excel.type = {[1]="ID",[2]="Value1",[3]="Value2",[4]="Value3",[5]="Value4",[6]="Value5",[7]="Value6",[8]="Value7"}
excel[1] = {
    ["Value1"] = [=[宝物挑战]=],
    ["Value2"] = [=[限时30秒击杀,击杀成功后宝物选择次数+1]=],
    ["Value3"] = 180
}
excel[8] = {
    ["Value1"] = 10,
    ["Value2"] = 100,
    ["Value3"] = 50
}
excel[9] = {
    ["Value1"] = 200,
    ["Value2"] = 100
}
excel[12] = {
    ["Value1"] = 100,
    ["Value2"] = 10
}
excel[13] = {
    ["Value1"] = [=[每10级：攻击力+5，生命值+25。|n|n每20级：攻击加成+1%，生命加成+1%。|n|n每40级：力量加成+1%，敏捷加成+1%，智力加成+1%。]=],
    ["Value2"] = [=[攻击力+5|n生命值+25]=],
    ["Value3"] = [=[攻击加成+1%|n生命加成+1%]=],
    ["Value4"] = [=[力量加成+1%|n敏捷加成+1%|n智力加成+1%]=]
}
excel[14] = {
    ["Value1"] = 100,
    ["Value2"] = 10
}
excel[15] = {
    ["Value1"] = 100,
    ["Value2"] = 10
}
excel[16] = {
    ["Value1"] = [=[每10级：攻击力+5，生命值+25。|n|n每20级：攻击加成+1%，生命加成+1%。|n|n每40级：力量加成+1%，敏捷加成+1%，智力加成+1%。]=],
    ["Value2"] = [=[攻击力+5|n生命值+25]=],
    ["Value3"] = [=[攻击加成+1%|n生命加成+1%]=],
    ["Value4"] = [=[力量加成+1%|n敏捷加成+1%|n智力加成+1%]=]
}
excel[17] = {
    ["Value1"] = 1,
    ["Value2"] = 10
}
excel[18] = {
    ["Value1"] = 100,
    ["Value2"] = 10,
    ["Value3"] = 5,
    ["Value4"] = 1,
    ["Value5"] = 50
}
excel[19] = {
    ["Value1"] = 200,
    ["Value2"] = 1
}
excel[20] = {
    ["Value1"] = 300,
    ["Value2"] = 3
}
excel[21] = {
    ["Value1"] = 400,
    ["Value2"] = 6
}

return excel