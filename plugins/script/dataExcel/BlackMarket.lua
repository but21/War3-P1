local ns = ns
local excel = ns.excel.create()
excel:set_name('黑市')
excel.type = {[1]="ID",[2]="Name",[3]="Weight",[4]="Tip",[5]="初始消耗",[6]="递增消耗",[7]="Limit",[8]="Type",[9]="Icon",[10]="Value1",[11]="Value2",[12]="Value3"}
excel[1] = {
    ["Name"] = [=[力量之石]=],
    ["Weight"] = 75,
    ["Tip"] = [=[力量加成+5%~10%]=],
    ["初始消耗"] = 800,
    ["递增消耗"] = 200,
    ["Limit"] = 999,
    ["Type"] = [=[随机属性]=],
    ["Icon"] = [=[Survival\UI\BlackMarket\blackmarket101.blp]=],
    ["Value1"] = [=[力量加成]=],
    ["Value2"] = 5,
    ["Value3"] = 10
}
excel[2] = {
    ["Name"] = [=[敏捷之石]=],
    ["Weight"] = 75,
    ["Tip"] = [=[敏捷加成+5%~10%]=],
    ["初始消耗"] = 800,
    ["递增消耗"] = 200,
    ["Limit"] = 999,
    ["Type"] = [=[随机属性]=],
    ["Icon"] = [=[Survival\UI\BlackMarket\blackmarket102.blp]=],
    ["Value1"] = [=[敏捷加成]=],
    ["Value2"] = 5,
    ["Value3"] = 10
}
excel[3] = {
    ["Name"] = [=[智力之石]=],
    ["Weight"] = 75,
    ["Tip"] = [=[智力加成+5%~10%]=],
    ["初始消耗"] = 800,
    ["递增消耗"] = 200,
    ["Limit"] = 999,
    ["Type"] = [=[随机属性]=],
    ["Icon"] = [=[Survival\UI\BlackMarket\blackmarket103.blp]=],
    ["Value1"] = [=[智力加成]=],
    ["Value2"] = 5,
    ["Value3"] = 10
}
excel[4] = {
    ["Name"] = [=[金币效率]=],
    ["Weight"] = 100,
    ["Tip"] = [=[金币效率+5%~15%]=],
    ["初始消耗"] = 600,
    ["递增消耗"] = 150,
    ["Limit"] = 999,
    ["Type"] = [=[随机属性]=],
    ["Icon"] = [=[Survival\UI\BlackMarket\blackmarket104.blp]=],
    ["Value1"] = [=[金币加成]=],
    ["Value2"] = 5,
    ["Value3"] = 15
}
excel[5] = {
    ["Name"] = [=[杀敌效率]=],
    ["Weight"] = 100,
    ["Tip"] = [=[杀敌效率+5%~15%]=],
    ["初始消耗"] = 600,
    ["递增消耗"] = 150,
    ["Limit"] = 999,
    ["Type"] = [=[随机属性]=],
    ["Icon"] = [=[Survival\UI\BlackMarket\blackmarket105.blp]=],
    ["Value1"] = [=[杀敌加成]=],
    ["Value2"] = 5,
    ["Value3"] = 15
}
excel[6] = {
    ["Name"] = [=[金币]=],
    ["Weight"] = 100,
    ["Tip"] = [=[随机获得金币1000-5000,每秒金币+1]=],
    ["初始消耗"] = 1000,
    ["递增消耗"] = 150,
    ["Limit"] = 999,
    ["Type"] = [=[其它]=],
    ["Icon"] = [=[Survival\UI\BlackMarket\blackmarket106.blp]=],
    ["Value1"] = [=[每秒金币+1]=],
    ["Value2"] = 1000,
    ["Value3"] = 5000
}
excel[7] = {
    ["Name"] = [=[木材]=],
    ["Weight"] = 100,
    ["Tip"] = [=[随机获得木材10-100]=],
    ["初始消耗"] = 1000,
    ["递增消耗"] = 150,
    ["Limit"] = 999,
    ["Type"] = [=[其它]=],
    ["Icon"] = [=[Survival\UI\BlackMarket\blackmarket107.blp]=],
    ["Value1"] = 10,
    ["Value2"] = 100
}
excel[8] = {
    ["Name"] = [=[生命恢复]=],
    ["Weight"] = 100,
    ["Tip"] = [=[每秒回血+100~500]=],
    ["初始消耗"] = 800,
    ["递增消耗"] = 200,
    ["Limit"] = 999,
    ["Type"] = [=[随机属性]=],
    ["Icon"] = [=[Survival\UI\BlackMarket\blackmarket108.blp]=],
    ["Value1"] = [=[每秒回血]=],
    ["Value2"] = 100,
    ["Value3"] = 500
}
excel[9] = {
    ["Name"] = [=[护甲]=],
    ["Weight"] = 100,
    ["Tip"] = [=[护甲+10~50]=],
    ["初始消耗"] = 800,
    ["递增消耗"] = 200,
    ["Limit"] = 999,
    ["Type"] = [=[随机属性]=],
    ["Icon"] = [=[Survival\UI\BlackMarket\blackmarket109.blp]=],
    ["Value1"] = [=[护甲]=],
    ["Value2"] = 10,
    ["Value3"] = 50
}
excel[10] = {
    ["Name"] = [=[物理伤害]=],
    ["Weight"] = 100,
    ["Tip"] = [=[物理伤害+5%~25%]=],
    ["初始消耗"] = 600,
    ["递增消耗"] = 150,
    ["Limit"] = 999,
    ["Type"] = [=[随机属性]=],
    ["Icon"] = [=[Survival\UI\BlackMarket\blackmarket110.blp]=],
    ["Value1"] = [=[物理伤害]=],
    ["Value2"] = 5,
    ["Value3"] = 25
}
excel[11] = {
    ["Name"] = [=[法术伤害]=],
    ["Weight"] = 100,
    ["Tip"] = [=[法术伤害+5%~25%]=],
    ["初始消耗"] = 600,
    ["递增消耗"] = 150,
    ["Limit"] = 999,
    ["Type"] = [=[随机属性]=],
    ["Icon"] = [=[Survival\UI\BlackMarket\blackmarket111.blp]=],
    ["Value1"] = [=[法术伤害]=],
    ["Value2"] = 5,
    ["Value3"] = 25
}
excel[12] = {
    ["Name"] = [=[力量抉择]=],
    ["Weight"] = 50,
    ["Tip"] = [=[当前力量提升10%~15%]=],
    ["初始消耗"] = 3000,
    ["递增消耗"] = 1000,
    ["Limit"] = 3,
    ["Type"] = [=[随机属性]=],
    ["Icon"] = [=[Survival\UI\BlackMarket\blackmarket112.blp]=],
    ["Value1"] = [=[当前力量]=],
    ["Value2"] = 10,
    ["Value3"] = 15
}
excel[13] = {
    ["Name"] = [=[敏捷抉择]=],
    ["Weight"] = 50,
    ["Tip"] = [=[当前敏捷提升10%~15%]=],
    ["初始消耗"] = 3000,
    ["递增消耗"] = 1000,
    ["Limit"] = 3,
    ["Type"] = [=[随机属性]=],
    ["Icon"] = [=[Survival\UI\BlackMarket\blackmarket113.blp]=],
    ["Value1"] = [=[当前敏捷]=],
    ["Value2"] = 10,
    ["Value3"] = 15
}
excel[14] = {
    ["Name"] = [=[智力抉择]=],
    ["Weight"] = 50,
    ["Tip"] = [=[当前智力提升10%~15%]=],
    ["初始消耗"] = 3000,
    ["递增消耗"] = 1000,
    ["Limit"] = 3,
    ["Type"] = [=[随机属性]=],
    ["Icon"] = [=[Survival\UI\BlackMarket\blackmarket114.blp]=],
    ["Value1"] = [=[当前智力]=],
    ["Value2"] = 10,
    ["Value3"] = 15
}
excel[15] = {
    ["Name"] = [=[卡牌刷新]=],
    ["Weight"] = 100,
    ["Tip"] = [=[卡牌刷新次数+1]=],
    ["初始消耗"] = 1000,
    ["递增消耗"] = 200,
    ["Limit"] = 999,
    ["Type"] = [=[其它]=],
    ["Icon"] = [=[Survival\UI\BlackMarket\blackmarket115.blp]=]
}
excel[16] = {
    ["Name"] = [=[英雄进化卡]=],
    ["Weight"] = 50,
    ["Tip"] = [=[立即获得1次进化机会]=],
    ["初始消耗"] = 4000,
    ["递增消耗"] = 1000,
    ["Limit"] = 999,
    ["Type"] = [=[其它]=],
    ["Icon"] = [=[Survival\UI\BlackMarket\blackmarket116.blp]=]
}
excel[17] = {
    ["Name"] = [=[卡牌吞噬丹]=],
    ["Weight"] = 100,
    ["Tip"] = [=[卡牌吞噬丹]=],
    ["初始消耗"] = 3000,
    ["递增消耗"] = 500,
    ["Limit"] = 999,
    ["Type"] = [=[其它]=],
    ["Icon"] = [=[Survival\UI\BlackMarket\blackmarket117.blp]=]
}
excel[18] = {
    ["Name"] = [=[临时工]=],
    ["Weight"] = 80,
    ["Tip"] = [=[怪物上限+5,持续30秒,多次使用只增加持续时间]=],
    ["初始消耗"] = 1500,
    ["递增消耗"] = 500,
    ["Limit"] = 10,
    ["Type"] = [=[其它]=],
    ["Icon"] = [=[Survival\UI\BlackMarket\blackmarket118.blp]=],
    ["Value1"] = 5,
    ["Value2"] = 30
}
excel[19] = {
    ["Name"] = [=[爆发]=],
    ["Weight"] = 100,
    ["Tip"] = [=[绝对伤害+50%,持续30秒,多次使用只增加持续时间]=],
    ["初始消耗"] = 2000,
    ["递增消耗"] = 500,
    ["Limit"] = 999,
    ["Type"] = [=[其它]=],
    ["Icon"] = [=[Survival\UI\BlackMarket\blackmarket119.blp]=],
    ["Value1"] = [=[绝对伤害+50%]=],
    ["Value2"] = 30
}
excel[20] = {
    ["Name"] = [=[置换卷]=],
    ["Weight"] = 100,
    ["Tip"] = [=[可以把1件装备置换成同级的,置换的时候不会置换到自己]=],
    ["初始消耗"] = 500,
    ["递增消耗"] = 150,
    ["Limit"] = 999,
    ["Type"] = [=[其它]=],
    ["Icon"] = [=[Survival\UI\BlackMarket\blackmarket120.blp]=]
}

return excel