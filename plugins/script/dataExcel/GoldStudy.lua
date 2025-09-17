local ns = ns
local excel = ns.excel.create()
excel:set_name('学习')
excel.type = {[1]="ID",[2]="Attr",[3]="Weight",[4]="MinVal",[5]="MaxVal",[6]="CanRaise"}
excel[1] = {
    ["Attr"] = [=[攻击力]=],
    ["Weight"] = 100,
    ["MinVal"] = 10,
    ["MaxVal"] = 20,
    ["CanRaise"] = 1
}
excel[2] = {
    ["Attr"] = [=[力量]=],
    ["Weight"] = 100,
    ["MinVal"] = 10,
    ["MaxVal"] = 20,
    ["CanRaise"] = 1
}
excel[3] = {
    ["Attr"] = [=[敏捷]=],
    ["Weight"] = 100,
    ["MinVal"] = 10,
    ["MaxVal"] = 20,
    ["CanRaise"] = 1
}
excel[4] = {
    ["Attr"] = [=[智力]=],
    ["Weight"] = 100,
    ["MinVal"] = 10,
    ["MaxVal"] = 20,
    ["CanRaise"] = 1
}
excel[5] = {
    ["Attr"] = [=[生命值]=],
    ["Weight"] = 100,
    ["MinVal"] = 100,
    ["MaxVal"] = 200,
    ["CanRaise"] = 1
}
excel[6] = {
    ["Attr"] = [=[护甲]=],
    ["Weight"] = 100,
    ["MinVal"] = 1,
    ["MaxVal"] = 3,
    ["CanRaise"] = 1
}
excel[7] = {
    ["Attr"] = [=[每秒回血]=],
    ["Weight"] = 100,
    ["MinVal"] = 10,
    ["MaxVal"] = 20,
    ["CanRaise"] = 1
}
excel[8] = {
    ["Attr"] = [=[每秒攻击]=],
    ["Weight"] = 25,
    ["MinVal"] = 1,
    ["MaxVal"] = 1,
    ["CanRaise"] = 0
}
excel[9] = {
    ["Attr"] = [=[每秒力量]=],
    ["Weight"] = 25,
    ["MinVal"] = 1,
    ["MaxVal"] = 1,
    ["CanRaise"] = 0
}
excel[10] = {
    ["Attr"] = [=[每秒敏捷]=],
    ["Weight"] = 25,
    ["MinVal"] = 1,
    ["MaxVal"] = 1,
    ["CanRaise"] = 0
}
excel[11] = {
    ["Attr"] = [=[每秒智力]=],
    ["Weight"] = 25,
    ["MinVal"] = 1,
    ["MaxVal"] = 1,
    ["CanRaise"] = 0
}
excel[12] = {
    ["Attr"] = [=[每秒生命]=],
    ["Weight"] = 25,
    ["MinVal"] = 5,
    ["MaxVal"] = 5,
    ["CanRaise"] = 0
}
excel[13] = {
    ["Attr"] = [=[技能急速]=],
    ["Weight"] = 10,
    ["MinVal"] = 1,
    ["MaxVal"] = 10,
    ["CanRaise"] = 0
}
excel[14] = {
    ["Attr"] = [=[攻击速度]=],
    ["Weight"] = 10,
    ["MinVal"] = 1,
    ["MaxVal"] = 10,
    ["CanRaise"] = 0
}
excel[15] = {
    ["Attr"] = [=[最终伤害]=],
    ["Weight"] = 5,
    ["MinVal"] = 1,
    ["MaxVal"] = 5,
    ["CanRaise"] = 0
}

return excel