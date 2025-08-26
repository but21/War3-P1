local ns = ns
local excel = ns.excel.create()
excel:set_name('夺舍')
excel.type = {[1]="ID",[2]="Name",[3]="Tips",[4]="Icon",[5]="Model",[6]="ModelSize",[7]="Attr",[8]="Value1",[9]="Value2",[10]="Value3"}
excel[1] = {
    ["Name"] = [=[夺舍1]=],
    ["Tips"] = [=[力量加成+15%|n|n每1秒对周围敌人成[力量*1.5]的物理伤害]=],
    ["Icon"] = [=[Survival\UI\Hero\Hero_01.blp]=],
    ["Model"] = [=[Survival\SeizeBody\1\1.mdl]=],
    ["ModelSize"] = 1.2,
    ["Attr"] = [=[力量加成+15%]=],
    ["Value1"] = 1,
    ["Value2"] = 1.5
}
excel[2] = {
    ["Name"] = [=[夺舍2]=],
    ["Tips"] = [=[敏捷加成+15%|n|n攻击有几率造成直线[敏捷*5]的物理伤害]=],
    ["Icon"] = [=[Survival\UI\Hero\Hero_02.blp]=],
    ["Model"] = [=[Survival\SeizeBody\2\1.mdl]=],
    ["ModelSize"] = 1.2,
    ["Attr"] = [=[敏捷加成+15%]=],
    ["Value1"] = 2,
    ["Value2"] = 15,
    ["Value3"] = 5
}
excel[3] = {
    ["Name"] = [=[夺舍3]=],
    ["Tips"] = [=[智力加成+15%|n|n每3秒对目标范围内敌人造成[智力*5]法术伤害]=],
    ["Icon"] = [=[Survival\UI\Hero\Hero_03.blp]=],
    ["Model"] = [=[Survival\SeizeBody\3\1.mdl]=],
    ["ModelSize"] = 1.2,
    ["Attr"] = [=[智力加成+15%]=],
    ["Value1"] = 3,
    ["Value2"] = 5
}
excel[4] = {
    ["Name"] = [=[夺舍4]=],
    ["Tips"] = [=[生命加成+15%|n|n攻击附加[每秒回血]*8*(1+英雄等级*1%)的真实伤害,多重箭有效]=],
    ["Icon"] = [=[Survival\UI\Hero\Hero_04.blp]=],
    ["Model"] = [=[Survival\SeizeBody\4\1.mdl]=],
    ["ModelSize"] = 1.2,
    ["Attr"] = [=[生命加成+15%]=],
    ["Value1"] = 8,
    ["Value2"] = 0.01
}
excel[5] = {
    ["Name"] = [=[夺舍5]=],
    ["Tips"] = [=[随机获得1~300点木材,每次抽卡返还10%的消耗木材]=],
    ["Icon"] = [=[Survival\UI\Hero\Hero_05.blp]=],
    ["Model"] = [=[Survival\SeizeBody\5\1.mdl]=],
    ["ModelSize"] = 1.2,
    ["Value1"] = 1,
    ["Value2"] = 300,
    ["Value3"] = 0.1
}
excel[6] = {
    ["Name"] = [=[夺舍6]=],
    ["Tips"] = [=[杀敌金币+3|n每秒木材+0.5]=],
    ["Icon"] = [=[Survival\UI\Hero\Hero_06.blp]=],
    ["Model"] = [=[Survival\SeizeBody\6\1.mdl]=],
    ["ModelSize"] = 1.2,
    ["Attr"] = [=[杀敌金币+3|n每秒木材+0.5]=]
}
excel[7] = {
    ["Name"] = [=[夺舍7]=],
    ["Tips"] = [=[攻击间隔-0.2|n攻击速度+50%]=],
    ["Icon"] = [=[Survival\UI\Hero\Hero_07.blp]=],
    ["Model"] = [=[Survival\SeizeBody\7\1.mdl]=],
    ["ModelSize"] = 1.2,
    ["Attr"] = [=[攻击间隔-0.2|n攻击速度+50%]=]
}
excel[8] = {
    ["Name"] = [=[夺舍8]=],
    ["Tips"] = [=[每秒护甲+0.5|n|n每20秒获得一个护盾.护盾在身上的受到的伤害减少50%,持续5秒.]=],
    ["Icon"] = [=[Survival\UI\Hero\Hero_08.blp]=],
    ["Model"] = [=[Survival\SeizeBody\8\1.mdl]=],
    ["ModelSize"] = 1.2,
    ["Attr"] = [=[每秒护甲+0.5]=],
    ["Value1"] = 20,
    ["Value2"] = 0.5,
    ["Value3"] = 5
}
excel[9] = {
    ["Name"] = [=[夺舍9]=],
    ["Tips"] = [=[攻击速度+50%|n|n每次造成的攻击伤害提升20%(乘法叠加)]=],
    ["Icon"] = [=[Survival\UI\Hero\Hero_09.blp]=],
    ["Model"] = [=[Survival\SeizeBody\9\1.mdl]=],
    ["ModelSize"] = 1.2,
    ["Attr"] = [=[攻击速度+50%]=],
    ["Value1"] = 1.2
}
excel[10] = {
    ["Name"] = [=[夺舍10]=],
    ["Tips"] = [=[生命恢复+3%|n|n受到BOSS技能伤害减少75%]=],
    ["Icon"] = [=[Survival\UI\Hero\Hero_10.blp]=],
    ["Model"] = [=[Survival\SeizeBody\10\1.mdl]=],
    ["ModelSize"] = 1.2,
    ["Attr"] = [=[生命恢复+3%]=],
    ["Value1"] = 0.25
}
excel[11] = {
    ["Name"] = [=[夺舍11]=],
    ["Tips"] = [=[攻击有15%几率造成4倍伤害,有15%几率闪避攻击伤害(独立计算)]=],
    ["Icon"] = [=[Survival\UI\Hero\Hero_11.blp]=],
    ["Model"] = [=[Survival\SeizeBody\11\1.mdl]=],
    ["ModelSize"] = 1.2,
    ["Value1"] = 15,
    ["Value2"] = 4,
    ["Value3"] = 15
}
excel[12] = {
    ["Name"] = [=[夺舍12]=],
    ["Tips"] = [=[护甲加成+15%|n|n攻击附加[护甲]*8*(1+英雄等级*1%)的真实伤害,多重箭有效]=],
    ["Icon"] = [=[Survival\UI\Hero\Hero_12.blp]=],
    ["Model"] = [=[Survival\SeizeBody\12\1.mdl]=],
    ["ModelSize"] = 1.2,
    ["Attr"] = [=[护甲加成+15%]=],
    ["Value1"] = 8,
    ["Value2"] = 0.01
}
excel[13] = {
    ["Name"] = [=[夺舍13]=],
    ["Tips"] = [=[杀敌力量+1|n|n被攻击的时候对攻击来源周围成[力量*4]的物理伤害]=],
    ["Icon"] = [=[Survival\UI\Hero\Hero_13.blp]=],
    ["Model"] = [=[Survival\SeizeBody\13\1.mdl]=],
    ["ModelSize"] = 1.2,
    ["Attr"] = [=[杀敌力量+1]=],
    ["Value1"] = 1,
    ["Value2"] = 4
}
excel[14] = {
    ["Name"] = [=[夺舍14]=],
    ["Tips"] = [=[杀敌敏捷+1|n|n攻击有几率造成三段直线(爪型)[敏捷*2.5]的物理伤害]=],
    ["Icon"] = [=[Survival\UI\Hero\Hero_14.blp]=],
    ["Model"] = [=[Survival\SeizeBody\14\1.mdl]=],
    ["ModelSize"] = 1.2,
    ["Attr"] = [=[杀敌敏捷+1]=],
    ["Value1"] = 2,
    ["Value2"] = 2.5
}
excel[15] = {
    ["Name"] = [=[夺舍15]=],
    ["Tips"] = [=[杀敌智力+1|n|n每3秒对目标直线内敌人造成[智力*5]法术伤害]=],
    ["Icon"] = [=[Survival\UI\Hero\Hero_15.blp]=],
    ["Model"] = [=[Survival\SeizeBody\15\1.mdl]=],
    ["ModelSize"] = 1.2,
    ["Attr"] = [=[杀敌智力+1]=],
    ["Value1"] = 3,
    ["Value2"] = 5
}
excel[16] = {
    ["Name"] = [=[夺舍16]=],
    ["Tips"] = [=[多重数量+1|n|n造成的所有真实伤害提升50%]=],
    ["Icon"] = [=[Survival\UI\Hero\Hero_16.blp]=],
    ["Model"] = [=[Survival\SeizeBody\16\1.mdl]=],
    ["ModelSize"] = 1.2,
    ["Attr"] = [=[多重数量+1|n|n真实伤害+50%]=]
}

return excel