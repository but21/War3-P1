local ns = ns
local excel = ns.excel.create()
excel:set_name('羁绊列表')
excel.type = {[1]="ID",[2]="BondName",[3]="FirstID",[4]="AllAmount",[5]="NeedAmount",[6]="InitAmount",[7]="SwallowTy",[8]="AttrTy",[9]="SwallowAttr",[10]="Value1",[11]="Value2",[12]="Value3"}
excel[1] = {
    ["BondName"] = [=[力量1]=],
    ["FirstID"] = 21,
    ["AllAmount"] = 4,
    ["NeedAmount"] = 4,
    ["InitAmount"] = 4,
    ["SwallowTy"] = 1,
    ["AttrTy"] = 1
}
excel[2] = {
    ["BondName"] = [=[力量2]=],
    ["FirstID"] = 31,
    ["AllAmount"] = 4,
    ["NeedAmount"] = 4,
    ["InitAmount"] = 4,
    ["SwallowTy"] = 1,
    ["AttrTy"] = 1
}
excel[3] = {
    ["BondName"] = [=[力量3]=],
    ["FirstID"] = 41,
    ["AllAmount"] = 4,
    ["NeedAmount"] = 4,
    ["InitAmount"] = 4,
    ["SwallowTy"] = 1,
    ["AttrTy"] = 1
}
excel[4] = {
    ["BondName"] = [=[力量4]=],
    ["FirstID"] = 51,
    ["AllAmount"] = 4,
    ["NeedAmount"] = 4,
    ["InitAmount"] = 4,
    ["SwallowTy"] = 1,
    ["AttrTy"] = 1
}
excel[5] = {
    ["BondName"] = [=[力量5]=],
    ["FirstID"] = 61,
    ["AllAmount"] = 5,
    ["NeedAmount"] = 5,
    ["InitAmount"] = 5,
    ["SwallowTy"] = 1,
    ["AttrTy"] = 1
}
excel[6] = {
    ["BondName"] = [=[力量6]=],
    ["FirstID"] = 71,
    ["AllAmount"] = 5,
    ["NeedAmount"] = 5,
    ["InitAmount"] = 5,
    ["SwallowTy"] = 1,
    ["AttrTy"] = 1
}
excel[7] = {
    ["BondName"] = [=[力量7]=],
    ["FirstID"] = 81,
    ["AllAmount"] = 5,
    ["NeedAmount"] = 5,
    ["InitAmount"] = 5,
    ["SwallowTy"] = 1,
    ["AttrTy"] = 1
}
excel[8] = {
    ["BondName"] = [=[敏捷1]=],
    ["FirstID"] = 91,
    ["AllAmount"] = 4,
    ["NeedAmount"] = 4,
    ["InitAmount"] = 4,
    ["SwallowTy"] = 1,
    ["AttrTy"] = 2
}
excel[9] = {
    ["BondName"] = [=[敏捷2]=],
    ["FirstID"] = 101,
    ["AllAmount"] = 4,
    ["NeedAmount"] = 4,
    ["InitAmount"] = 4,
    ["SwallowTy"] = 1,
    ["AttrTy"] = 2,
    ["SwallowAttr"] = [=[攻击射程+250]=]
}
excel[10] = {
    ["BondName"] = [=[敏捷3]=],
    ["FirstID"] = 111,
    ["AllAmount"] = 4,
    ["NeedAmount"] = 4,
    ["InitAmount"] = 4,
    ["SwallowTy"] = 1,
    ["AttrTy"] = 2,
    ["Value1"] = 0.05,
    ["Value2"] = [=[攻击速度+100]=]
}
excel[11] = {
    ["BondName"] = [=[敏捷4]=],
    ["FirstID"] = 121,
    ["AllAmount"] = 4,
    ["NeedAmount"] = 4,
    ["InitAmount"] = 4,
    ["SwallowTy"] = 1,
    ["AttrTy"] = 2,
    ["SwallowAttr"] = [=[攻击间隔-0.05]=]
}
excel[12] = {
    ["BondName"] = [=[敏捷5]=],
    ["FirstID"] = 131,
    ["AllAmount"] = 5,
    ["NeedAmount"] = 5,
    ["InitAmount"] = 5,
    ["SwallowTy"] = 1,
    ["AttrTy"] = 2,
    ["Value1"] = 50,
    ["Value2"] = 1.5
}
excel[13] = {
    ["BondName"] = [=[敏捷6]=],
    ["FirstID"] = 141,
    ["AllAmount"] = 5,
    ["NeedAmount"] = 5,
    ["InitAmount"] = 5,
    ["SwallowTy"] = 1,
    ["AttrTy"] = 2,
    ["Value1"] = 1.2
}
excel[14] = {
    ["BondName"] = [=[敏捷7]=],
    ["FirstID"] = 151,
    ["AllAmount"] = 5,
    ["NeedAmount"] = 5,
    ["InitAmount"] = 5,
    ["SwallowTy"] = 1,
    ["AttrTy"] = 2,
    ["Value1"] = 1.2
}
excel[15] = {
    ["BondName"] = [=[智力1]=],
    ["FirstID"] = 161,
    ["AllAmount"] = 4,
    ["NeedAmount"] = 4,
    ["InitAmount"] = 4,
    ["SwallowTy"] = 1,
    ["AttrTy"] = 3
}
excel[16] = {
    ["BondName"] = [=[智力2]=],
    ["FirstID"] = 171,
    ["AllAmount"] = 4,
    ["NeedAmount"] = 4,
    ["InitAmount"] = 4,
    ["SwallowTy"] = 1,
    ["AttrTy"] = 3,
    ["Value1"] = 25,
    ["Value2"] = 2
}
excel[17] = {
    ["BondName"] = [=[智力3]=],
    ["FirstID"] = 181,
    ["AllAmount"] = 4,
    ["NeedAmount"] = 4,
    ["InitAmount"] = 4,
    ["SwallowTy"] = 1,
    ["AttrTy"] = 3,
    ["Value1"] = 1.3,
    ["Value2"] = [=[法术暴击+20]=]
}
excel[18] = {
    ["BondName"] = [=[智力4]=],
    ["FirstID"] = 191,
    ["AllAmount"] = 4,
    ["NeedAmount"] = 4,
    ["InitAmount"] = 4,
    ["SwallowTy"] = 1,
    ["AttrTy"] = 3,
    ["Value1"] = 300,
    ["Value2"] = [=[当前法术伤害+6]=]
}
excel[19] = {
    ["BondName"] = [=[智力5]=],
    ["FirstID"] = 201,
    ["AllAmount"] = 5,
    ["NeedAmount"] = 5,
    ["InitAmount"] = 5,
    ["SwallowTy"] = 1,
    ["AttrTy"] = 3,
    ["Value1"] = 15,
    ["Value2"] = 2
}
excel[20] = {
    ["BondName"] = [=[智力6]=],
    ["FirstID"] = 211,
    ["AllAmount"] = 5,
    ["NeedAmount"] = 5,
    ["InitAmount"] = 5,
    ["SwallowTy"] = 1,
    ["AttrTy"] = 3,
    ["Value1"] = 1.2
}
excel[21] = {
    ["BondName"] = [=[智力7]=],
    ["FirstID"] = 221,
    ["AllAmount"] = 5,
    ["NeedAmount"] = 5,
    ["InitAmount"] = 5,
    ["SwallowTy"] = 1,
    ["AttrTy"] = 3,
    ["Value1"] = 20,
    ["Value2"] = 2
}
excel[22] = {
    ["BondName"] = [=[通用A]=],
    ["FirstID"] = 231,
    ["AllAmount"] = 4,
    ["NeedAmount"] = 4,
    ["InitAmount"] = 4,
    ["SwallowTy"] = 1,
    ["AttrTy"] = 4,
    ["Value1"] = 25,
    ["Value2"] = 75
}
excel[23] = {
    ["BondName"] = [=[通用B]=],
    ["FirstID"] = 241,
    ["AllAmount"] = 4,
    ["NeedAmount"] = 4,
    ["InitAmount"] = 4,
    ["SwallowTy"] = 1,
    ["AttrTy"] = 4,
    ["Value1"] = 1.15
}
excel[24] = {
    ["BondName"] = [=[通用C]=],
    ["FirstID"] = 251,
    ["AllAmount"] = 4,
    ["NeedAmount"] = 4,
    ["InitAmount"] = 4,
    ["SwallowTy"] = 1,
    ["AttrTy"] = 4,
    ["SwallowAttr"] = [=[攻击加成+5%|n生命加成+5%|n护甲加成+5%]=]
}
excel[25] = {
    ["BondName"] = [=[通用D]=],
    ["FirstID"] = 261,
    ["AllAmount"] = 4,
    ["NeedAmount"] = 4,
    ["InitAmount"] = 4,
    ["SwallowTy"] = 1,
    ["AttrTy"] = 4,
    ["Value1"] = 1.5
}
excel[26] = {
    ["BondName"] = [=[通用E]=],
    ["FirstID"] = 271,
    ["AllAmount"] = 4,
    ["NeedAmount"] = 4,
    ["InitAmount"] = 4,
    ["SwallowTy"] = 1,
    ["AttrTy"] = 4,
    ["SwallowAttr"] = [=[攻击间隔-0.05]=]
}
excel[27] = {
    ["BondName"] = [=[通用F]=],
    ["FirstID"] = 281,
    ["AllAmount"] = 3,
    ["NeedAmount"] = 3,
    ["InitAmount"] = 3,
    ["SwallowTy"] = 1,
    ["AttrTy"] = 4,
    ["Value1"] = 1.3,
    ["Value2"] = 1.4
}
excel[28] = {
    ["BondName"] = [=[通用G]=],
    ["FirstID"] = 291,
    ["AllAmount"] = 5,
    ["NeedAmount"] = 5,
    ["InitAmount"] = 5,
    ["SwallowTy"] = 1,
    ["AttrTy"] = 4,
    ["SwallowAttr"] = [=[物理暴率+10%]=]
}
excel[29] = {
    ["BondName"] = [=[通用H]=],
    ["FirstID"] = 301,
    ["AllAmount"] = 5,
    ["NeedAmount"] = 5,
    ["InitAmount"] = 5,
    ["SwallowTy"] = 1,
    ["AttrTy"] = 4,
    ["SwallowAttr"] = [=[法术暴率+10%]=]
}
excel[30] = {
    ["BondName"] = [=[通用I]=],
    ["FirstID"] = 311,
    ["AllAmount"] = 5,
    ["NeedAmount"] = 5,
    ["InitAmount"] = 5,
    ["SwallowTy"] = 0,
    ["AttrTy"] = 4,
    ["Value1"] = 1.25
}
excel[31] = {
    ["BondName"] = [=[通用J]=],
    ["FirstID"] = 321,
    ["AllAmount"] = 5,
    ["NeedAmount"] = 5,
    ["InitAmount"] = 5,
    ["SwallowTy"] = 0,
    ["AttrTy"] = 4,
    ["SwallowAttr"] = [=[每秒木材+0.5]=],
    ["Value1"] = 3
}
excel[32] = {
    ["BondName"] = [=[通用K]=],
    ["FirstID"] = 331,
    ["AllAmount"] = 5,
    ["NeedAmount"] = 5,
    ["InitAmount"] = 5,
    ["SwallowTy"] = 0,
    ["AttrTy"] = 4,
    ["Value1"] = 1.2
}
excel[33] = {
    ["BondName"] = [=[通用L]=],
    ["FirstID"] = 341,
    ["AllAmount"] = 5,
    ["NeedAmount"] = 5,
    ["InitAmount"] = 5,
    ["SwallowTy"] = 2,
    ["AttrTy"] = 4,
    ["Value1"] = 3
}
excel[100] = {
    ["BondName"] = [=[杂物]=],
    ["FirstID"] = 1,
    ["AllAmount"] = 4,
    ["NeedAmount"] = 999,
    ["InitAmount"] = 4,
    ["SwallowTy"] = 1,
    ["AttrTy"] = 4
}
excel[101] = {
    ["BondName"] = [=[三国风云]=],
    ["FirstID"] = 351,
    ["AllAmount"] = 16,
    ["InitAmount"] = 15,
    ["SwallowTy"] = 3,
    ["AttrTy"] = 4
}
excel[102] = {
    ["BondName"] = [=[复杂力量2]=],
    ["FirstID"] = 371,
    ["AllAmount"] = 8,
    ["InitAmount"] = 1,
    ["SwallowTy"] = 3,
    ["AttrTy"] = 4
}
excel[103] = {
    ["BondName"] = [=[复杂敏捷1]=],
    ["FirstID"] = 381,
    ["AllAmount"] = 13,
    ["InitAmount"] = 6,
    ["SwallowTy"] = 3,
    ["AttrTy"] = 4
}
excel[104] = {
    ["BondName"] = [=[复杂敏捷2]=],
    ["FirstID"] = 401,
    ["AllAmount"] = 10,
    ["InitAmount"] = 8,
    ["SwallowTy"] = 3,
    ["AttrTy"] = 4
}
excel[105] = {
    ["BondName"] = [=[复杂智力1]=],
    ["FirstID"] = 421,
    ["AllAmount"] = 7,
    ["InitAmount"] = 6,
    ["SwallowTy"] = 3,
    ["AttrTy"] = 4
}
excel[106] = {
    ["BondName"] = [=[复杂智力2]=],
    ["FirstID"] = 431,
    ["AllAmount"] = 7,
    ["InitAmount"] = 6,
    ["SwallowTy"] = 3,
    ["AttrTy"] = 4
}

return excel