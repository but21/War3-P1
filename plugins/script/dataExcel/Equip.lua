local ns = ns
local excel = ns.excel.create()
excel:set_name('装备')
excel.type = {[1]="ID",[2]="Name",[3]="Tip",[4]="SwallowTip",[5]="PID",[6]="Lv",[7]="Attr",[8]="Icon",[9]="Value1",[10]="Value2",[11]="Value3",[12]="Value4"}
excel[1] = {
    ["Tip"] = [=[[龙吟]|n每分钟获得力量加成+1%]=],
    ["Value1"] = [=[力量加成+1%]=]
}
excel[2] = {
    ["Tip"] = [=[[月下美人]|n有25%的几率免疫攻击伤害]=],
    ["Value1"] = 25
}
excel[3] = {
    ["Tip"] = [=[[观山]|n被攻击的增加15~30点生命值]=],
    ["Value1"] = 15,
    ["Value2"] = 30
}
excel[4] = {
    ["Tip"] = [=[[风行]|n每分钟获得敏捷加成+1%]=],
    ["Value1"] = [=[敏捷加成+1%]=]
}
excel[5] = {
    ["Tip"] = [=[[小贪心]|n攻击增加2点金币]=],
    ["Value1"] = 2
}
excel[6] = {
    ["Tip"] = [=[[灵笼宝物]|n每分钟获得1件1级装备]=],
    ["Value1"] = 1,
    ["Value2"] = 1
}
excel[7] = {
    ["Tip"] = [=[[符心咒]|n每分钟获得智力加成+1%]=],
    ["Value1"] = [=[智力加成+1%]=]
}
excel[8] = {
    ["Tip"] = [=[[提神]|n攻击增加1~2点智力]=],
    ["Value1"] = 1,
    ["Value2"] = 2
}
excel[9] = {
    ["Tip"] = [=[[灵根复苏]|n每次英雄升级每秒力量,敏捷,智力其中1个增加1点]=],
    ["Value1"] = 1
}
excel[10] = {
    ["Tip"] = [=[[不灭]|n每杀敌100增加10~15点每秒回血]=],
    ["Value1"] = 100,
    ["Value2"] = 10,
    ["Value3"] = 15
}
excel[101] = {
    ["Name"] = [=[龙纹刀「E级」]=],
    ["Attr"] = [=[力量+300]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB101.blp]=]
}
excel[102] = {
    ["Name"] = [=[贯日剑「E级」]=],
    ["Attr"] = [=[攻击速度+15%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB102.blp]=]
}
excel[103] = {
    ["Name"] = [=[流云扇「E级」]=],
    ["Attr"] = [=[每秒金币+2]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB103.blp]=]
}
excel[104] = {
    ["Name"] = [=[玉蚕衣「E级」]=],
    ["Attr"] = [=[生命值+1500]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB104.blp]=]
}
excel[105] = {
    ["Name"] = [=[破山锤「E级」]=],
    ["Attr"] = [=[力量+300]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB105.blp]=]
}
excel[106] = {
    ["Name"] = [=[火灵玉「E级」]=],
    ["Attr"] = [=[物理伤害+5%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB106.blp]=]
}
excel[107] = {
    ["Name"] = [=[逐月剑「E级」]=],
    ["Attr"] = [=[敏捷+300]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB107.blp]=]
}
excel[108] = {
    ["Name"] = [=[万象扇「E级」]=],
    ["Attr"] = [=[智力+300]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB108.blp]=]
}
excel[201] = {
    ["Name"] = [=[龙纹刀「D级」]=],
    ["Tip"] = [=[[龙吟]|n每分钟获得力量加成+1%]=],
    ["PID"] = 1,
    ["Lv"] = 2,
    ["Attr"] = [=[力量+300]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB201.blp]=]
}
excel[202] = {
    ["Name"] = [=[贯日剑「D级」]=],
    ["Attr"] = [=[攻击+300|n攻击速度+15%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB202.blp]=]
}
excel[203] = {
    ["Name"] = [=[流云扇「D级」]=],
    ["Attr"] = [=[每秒金币+5]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB203.blp]=]
}
excel[204] = {
    ["Name"] = [=[玉蚕衣「D级」]=],
    ["Tip"] = [=[[月下美人]|n有25%的几率免疫攻击伤害]=],
    ["PID"] = 2,
    ["Lv"] = 2,
    ["Attr"] = [=[生命值+1500|n护甲+25]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB204.blp]=]
}
excel[205] = {
    ["Name"] = [=[破山锤「D级」]=],
    ["Tip"] = [=[[观山]|n被攻击的增加15~30点生命值]=],
    ["PID"] = 3,
    ["Lv"] = 2,
    ["Attr"] = [=[力量+300]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB205.blp]=]
}
excel[206] = {
    ["Name"] = [=[火灵玉「D级」]=],
    ["Attr"] = [=[物理伤害+5%|n物理暴伤+10%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB206.blp]=]
}
excel[207] = {
    ["Name"] = [=[逐月剑「D级」]=],
    ["Tip"] = [=[[风行]|n每分钟获得敏捷加成+1%]=],
    ["PID"] = 4,
    ["Lv"] = 2,
    ["Attr"] = [=[敏捷+300]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB207.blp]=]
}
excel[208] = {
    ["Name"] = [=[万象扇「D级」]=],
    ["Attr"] = [=[智力+300|n技能急速+15%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB208.blp]=]
}
excel[209] = {
    ["Name"] = [=[灵蕴玉「D级」]=],
    ["Tip"] = [=[[小贪心]|n攻击增加2点金币]=],
    ["PID"] = 5,
    ["Lv"] = 2,
    ["Attr"] = [=[杀敌金币+1]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB209.blp]=]
}
excel[210] = {
    ["Name"] = [=[裂空戟「D级」]=],
    ["Attr"] = [=[攻击速度+15%|n物理伤害+5%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB210.blp]=]
}
excel[301] = {
    ["Name"] = [=[龙纹刀「C级」]=],
    ["Tip"] = [=[[龙吟]|n每分钟获得力量加成+1%]=],
    ["PID"] = 1,
    ["Lv"] = 3,
    ["Attr"] = [=[力量+1000]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB301.blp]=]
}
excel[302] = {
    ["Name"] = [=[贯日剑「C级」]=],
    ["Attr"] = [=[攻击+1000|n攻击速度+25%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB302.blp]=]
}
excel[303] = {
    ["Name"] = [=[流云扇「C级」]=],
    ["Attr"] = [=[每秒金币+10|n金币加成+5%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB303.blp]=]
}
excel[304] = {
    ["Name"] = [=[玉蚕衣「C级」]=],
    ["Tip"] = [=[[月下美人]|n有25%的几率免疫攻击伤害]=],
    ["PID"] = 2,
    ["Lv"] = 3,
    ["Attr"] = [=[生命值+5000|n护甲+50]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB304.blp]=]
}
excel[305] = {
    ["Name"] = [=[破山锤「C级」]=],
    ["Tip"] = [=[[观山]|n被攻击的增加15~30点生命值]=],
    ["PID"] = 3,
    ["Lv"] = 3,
    ["Attr"] = [=[力量+1000]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB305.blp]=]
}
excel[306] = {
    ["Name"] = [=[火灵玉「C级」]=],
    ["Attr"] = [=[物理伤害+10%|n物理暴伤+15%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB306.blp]=]
}
excel[307] = {
    ["Name"] = [=[逐月剑「C级」]=],
    ["Tip"] = [=[[风行]|n每分钟获得敏捷加成+1%]=],
    ["PID"] = 4,
    ["Lv"] = 3,
    ["Attr"] = [=[敏捷+1000]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB307.blp]=]
}
excel[308] = {
    ["Name"] = [=[万象扇「C级」]=],
    ["Attr"] = [=[智力+1000|n技能急速+25%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB308.blp]=]
}
excel[309] = {
    ["Name"] = [=[灵蕴玉「C级」]=],
    ["Tip"] = [=[[小贪心]|n攻击增加2点金币]=],
    ["PID"] = 5,
    ["Lv"] = 3,
    ["Attr"] = [=[杀敌金币+5|n金币加成+15%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB309.blp]=]
}
excel[310] = {
    ["Name"] = [=[裂空戟「C级」]=],
    ["Attr"] = [=[力量+1000|n物理伤害+25%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB310.blp]=]
}
excel[311] = {
    ["Name"] = [=[摄魄香「C级」]=],
    ["Tip"] = [=[[灵笼宝物]|n每分钟获得1件1级装备]=],
    ["PID"] = 6,
    ["Lv"] = 3,
    ["Attr"] = [=[每秒杀敌+2|n杀敌加成+5%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB311.blp]=]
}
excel[312] = {
    ["Name"] = [=[嗜血刀「C级」]=],
    ["Tip"] = [=[[符心咒]|n每分钟获得智力加成+1%]=],
    ["PID"] = 7,
    ["Lv"] = 3,
    ["Attr"] = [=[敏捷+1000|n物理暴率+5%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB312.blp]=]
}
excel[401] = {
    ["Name"] = [=[龙纹刀「B级」]=],
    ["Tip"] = [=[[龙吟]|n每分钟获得力量加成+1%]=],
    ["PID"] = 1,
    ["Lv"] = 4,
    ["Attr"] = [=[力量+3000]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB401.blp]=]
}
excel[402] = {
    ["Name"] = [=[贯日剑「B级」]=],
    ["Attr"] = [=[攻击+5000|n攻击速度+35%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB402.blp]=]
}
excel[403] = {
    ["Name"] = [=[流云扇「B级」]=],
    ["Attr"] = [=[每秒金币+15|n金币加成+10%|n经验加成+10%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB403.blp]=]
}
excel[404] = {
    ["Name"] = [=[玉蚕衣「B级」]=],
    ["Tip"] = [=[[月下美人]|n有25%的几率免疫攻击伤害]=],
    ["PID"] = 2,
    ["Lv"] = 4,
    ["Attr"] = [=[生命值+15000|n护甲+100]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB404.blp]=]
}
excel[405] = {
    ["Name"] = [=[破山锤「B级」]=],
    ["Tip"] = [=[[观山]|n被攻击的增加15~30点生命值]=],
    ["PID"] = 3,
    ["Lv"] = 4,
    ["Attr"] = [=[力量+3000]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB405.blp]=]
}
excel[406] = {
    ["Name"] = [=[火灵玉「B级」]=],
    ["Attr"] = [=[物理伤害+20%|n物理暴伤+35%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB406.blp]=]
}
excel[407] = {
    ["Name"] = [=[逐月剑「B级」]=],
    ["Tip"] = [=[[风行]|n每分钟获得敏捷加成+1%]=],
    ["PID"] = 4,
    ["Lv"] = 4,
    ["Attr"] = [=[敏捷+3000]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB407.blp]=]
}
excel[408] = {
    ["Name"] = [=[万象扇「B级」]=],
    ["Attr"] = [=[智力+3000|n技能急速+35%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB408.blp]=]
}
excel[409] = {
    ["Name"] = [=[灵蕴玉「B级」]=],
    ["Tip"] = [=[[小贪心]|n攻击增加2点金币]=],
    ["PID"] = 5,
    ["Lv"] = 4,
    ["Attr"] = [=[杀敌金币+5|n金币加成+15%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB409.blp]=]
}
excel[410] = {
    ["Name"] = [=[裂空戟「B级」]=],
    ["Attr"] = [=[力量+3000|n物理伤害+25%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB410.blp]=]
}
excel[411] = {
    ["Name"] = [=[摄魄香「B级」]=],
    ["Tip"] = [=[[灵笼宝物]|n每分钟获得1件1级装备]=],
    ["PID"] = 6,
    ["Lv"] = 4,
    ["Attr"] = [=[每秒杀敌+5|n杀敌加成+15%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB411.blp]=]
}
excel[412] = {
    ["Name"] = [=[嗜血刀「B级」]=],
    ["Tip"] = [=[[符心咒]|n每分钟获得智力加成+1%]=],
    ["PID"] = 7,
    ["Lv"] = 4,
    ["Attr"] = [=[敏捷+3000|n物理暴率+5%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB412.blp]=]
}
excel[413] = {
    ["Name"] = [=[幽冥拐杖「B级」]=],
    ["Attr"] = [=[智力+3000|n法术暴率+5%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB413.blp]=]
}
excel[414] = {
    ["Name"] = [=[锁魂钩「B级」]=],
    ["Attr"] = [=[攻击暴率+10%|n攻击暴伤+40%|n攻击速度+40%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB414.blp]=]
}
excel[501] = {
    ["Name"] = [=[龙纹刀「A级」]=],
    ["Tip"] = [=[[龙吟]|n每分钟获得力量加成+1%]=],
    ["PID"] = 1,
    ["Lv"] = 5,
    ["Attr"] = [=[力量+10000]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB501.blp]=]
}
excel[502] = {
    ["Name"] = [=[贯日剑「A级」]=],
    ["Attr"] = [=[攻击+10000|n攻击速度+45%|n多重数量+1]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB502.blp]=]
}
excel[503] = {
    ["Name"] = [=[流云扇「A级」]=],
    ["Attr"] = [=[每秒金币+20|n金币加成+15%|n经验加成+15%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB503.blp]=]
}
excel[504] = {
    ["Name"] = [=[玉蚕衣「A级」]=],
    ["Tip"] = [=[[月下美人]|n有25%的几率免疫攻击伤害]=],
    ["PID"] = 2,
    ["Lv"] = 5,
    ["Attr"] = [=[生命值+50000|n护甲+250]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB504.blp]=]
}
excel[505] = {
    ["Name"] = [=[破山锤「A级」]=],
    ["Tip"] = [=[[观山]|n被攻击的增加15~30点生命值]=],
    ["PID"] = 3,
    ["Lv"] = 5,
    ["Attr"] = [=[力量+10000]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB505.blp]=]
}
excel[506] = {
    ["Name"] = [=[火灵玉「A级」]=],
    ["Attr"] = [=[物理伤害+25%|n物理暴伤+45%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB506.blp]=]
}
excel[507] = {
    ["Name"] = [=[逐月剑「A级」]=],
    ["Tip"] = [=[[风行]|n每分钟获得敏捷加成+1%]=],
    ["PID"] = 4,
    ["Lv"] = 5,
    ["Attr"] = [=[敏捷+10000]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB507.blp]=]
}
excel[508] = {
    ["Name"] = [=[万象扇「A级」]=],
    ["Attr"] = [=[智力+10000|n技能急速+55%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB508.blp]=]
}
excel[509] = {
    ["Name"] = [=[灵蕴玉「A级」]=],
    ["Tip"] = [=[[小贪心]|n攻击增加2点金币]=],
    ["PID"] = 5,
    ["Lv"] = 5,
    ["Attr"] = [=[杀敌金币+5|n金币加成+15%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB509.blp]=]
}
excel[510] = {
    ["Name"] = [=[裂空戟「A级」]=],
    ["Attr"] = [=[力量+7000|n物理伤害+25%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB510.blp]=]
}
excel[511] = {
    ["Name"] = [=[摄魄香「A级」]=],
    ["Tip"] = [=[[灵笼宝物]|n每分钟获得1件1级装备]=],
    ["PID"] = 6,
    ["Lv"] = 5,
    ["Attr"] = [=[每秒杀敌+5|n杀敌加成+15%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB511.blp]=]
}
excel[512] = {
    ["Name"] = [=[嗜血刀「A级」]=],
    ["Tip"] = [=[[符心咒]|n每分钟获得智力加成+1%]=],
    ["PID"] = 7,
    ["Lv"] = 5,
    ["Attr"] = [=[敏捷+10000|n物理暴率+5%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB512.blp]=]
}
excel[513] = {
    ["Name"] = [=[幽冥拐杖「A级」]=],
    ["Attr"] = [=[智力+10000|n法术暴率+5%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB513.blp]=]
}
excel[514] = {
    ["Name"] = [=[锁魂钩「A级」]=],
    ["Attr"] = [=[攻击暴率+10%|n攻击暴伤+40%|n攻击速度+40%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB514.blp]=]
}
excel[515] = {
    ["Name"] = [=[焚天护符「A级」]=],
    ["Tip"] = [=[[符心咒]|n每分钟获得智力加成+1%]=],
    ["PID"] = 7,
    ["Lv"] = 5,
    ["Attr"] = [=[智力+10000]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB515.blp]=]
}
excel[516] = {
    ["Name"] = [=[点睛画笔「A级」]=],
    ["Tip"] = [=[[提神]|n攻击增加1~2点智力]=],
    ["PID"] = 8,
    ["Lv"] = 5,
    ["Attr"] = [=[法术伤害+25%|n法术暴伤+35%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB516.blp]=]
}
excel[601] = {
    ["Name"] = [=[斩天剑「S级」]=],
    ["Tip"] = [=[[龙吟]|n每分钟获得力量加成+1%]=],
    ["SwallowTip"] = [=[[龙之怒]|n被攻击的时候对目标发射一道冲击,伤害径400,距离1000.造成力量*4的伤害,冷却2秒]=],
    ["PID"] = 1,
    ["Lv"] = 6,
    ["Attr"] = [=[力量+30000]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB601.blp]=],
    ["Value1"] = 4,
    ["Value2"] = 2
}
excel[602] = {
    ["Name"] = [=[血弓「S级」]=],
    ["SwallowTip"] = [=[[急速]|n攻击间隔-0.1,攻击吸血+5%]=],
    ["Attr"] = [=[攻击+30000|n攻击速度+55%|n多重数量+1]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB602.blp]=],
    ["Value1"] = [=[攻击间隔-0.1,攻击吸血+5%]=]
}
excel[603] = {
    ["Name"] = [=[玉玺「S级」]=],
    ["SwallowTip"] = [=[[流金岁月]|n立即获得1次英雄进化的机会]=],
    ["Attr"] = [=[每秒金币+25|n金币加成+25%|n经验加成+15%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB603.blp]=]
}
excel[604] = {
    ["Name"] = [=[貂蝉衣「S级」]=],
    ["Tip"] = [=[[月下美人]|n有25%的几率免疫攻击伤害]=],
    ["SwallowTip"] = [=[[满月]|n月下美人几率从25%提升到38%]=],
    ["PID"] = 2,
    ["Lv"] = 6,
    ["Attr"] = [=[生命值+50000|n护甲+500]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB604.blp]=],
    ["Value1"] = 38
}
excel[605] = {
    ["Name"] = [=[狮驼斧「S级」]=],
    ["Tip"] = [=[[观山]|n被攻击的增加15~30点生命值]=],
    ["SwallowTip"] = [=[[望山血海]|n按照当前的最大生命值增加80%]=],
    ["PID"] = 3,
    ["Lv"] = 6,
    ["Attr"] = [=[力量+30000]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB605.blp]=],
    ["Value1"] = [=[当前生命+80]=]
}
excel[606] = {
    ["Name"] = [=[红岩剑「S级」]=],
    ["SwallowTip"] = [=[[火心决]|n物理暴率+5%~15%,当前物理暴伤提高20%]=],
    ["Attr"] = [=[物理伤害+35%|n物理暴伤+55%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB606.blp]=],
    ["Value1"] = 5,
    ["Value2"] = 15,
    ["Value3"] = 1.2
}
excel[607] = {
    ["Name"] = [=[凤鸣刃「S级」]=],
    ["Tip"] = [=[[风行]|n每分钟获得敏捷加成+1%]=],
    ["SwallowTip"] = [=[[行者]|n敏捷加成增加(英雄等级*1%)]=],
    ["PID"] = 4,
    ["Lv"] = 6,
    ["Attr"] = [=[敏捷+30000]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB607.blp]=],
    ["Value1"] = 1
}
excel[608] = {
    ["Name"] = [=[武穆遗书「S级」]=],
    ["SwallowTip"] = [=[[万象天]|n绝对伤害+40%]=],
    ["Attr"] = [=[技能吸血+5%|n技能急速+40%|n最终伤害+40%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB608.blp]=],
    ["Value1"] = [=[绝对伤害+40]=]
}
excel[609] = {
    ["Name"] = [=[黄金衣「S级」]=],
    ["Tip"] = [=[[小贪心]|n攻击增加2点金币]=],
    ["SwallowTip"] = [=[[麒麟金]|n抽取装备的时候返回20%金钱给你]=],
    ["PID"] = 5,
    ["Lv"] = 6,
    ["Attr"] = [=[杀敌金币+5|n金币加成+15%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB609.blp]=]
}
excel[610] = {
    ["Name"] = [=[青龙偃月刀「S级」]=],
    ["SwallowTip"] = [=[[霸王举鼎]|n当前的力量提高30%]=],
    ["Attr"] = [=[力量+25000|n物理伤害+25%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB610.blp]=],
    ["Value1"] = [=[当前力量+30]=]
}
excel[611] = {
    ["Name"] = [=[金榜题名「S级」]=],
    ["Tip"] = [=[[灵笼宝物]|n每分钟获得1件1级装备]=],
    ["SwallowTip"] = [=[[摄魂交易]|n黑市购买的时候返回20%杀敌给你]=],
    ["PID"] = 6,
    ["Lv"] = 6,
    ["Attr"] = [=[每秒杀敌+5|n杀敌加成+15%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB611.blp]=],
    ["Value1"] = 0.2
}
excel[612] = {
    ["Name"] = [=[永乐大典「S级」]=],
    ["Tip"] = [=[[符心咒]|n每分钟获得智力加成+1%]=],
    ["SwallowTip"] = [=[[噬魂]|n每杀敌300,获得1点物理伤害%]=],
    ["PID"] = 7,
    ["Lv"] = 6,
    ["Attr"] = [=[敏捷+30000|n物理暴率+5%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB612.blp]=],
    ["Value1"] = 300,
    ["Value2"] = 1
}
excel[613] = {
    ["Name"] = [=[古文尚书「S级」]=],
    ["SwallowTip"] = [=[[闻冥]|n每杀敌300,获得1点法术伤害%]=],
    ["Attr"] = [=[智力+30000|n法术暴率+5%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB613.blp]=],
    ["Value1"] = 300,
    ["Value2"] = 1
}
excel[614] = {
    ["Name"] = [=[方天画戟「S级」]=],
    ["SwallowTip"] = [=[[落井下石]|n当前的攻击暴伤提升100%]=],
    ["Attr"] = [=[攻击暴率+10%|n攻击暴伤+40%|n攻击速度+40%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB614.blp]=],
    ["Value1"] = 2
}
excel[615] = {
    ["Name"] = [=[紫金葫芦「S级」]=],
    ["Tip"] = [=[[符心咒]|n每分钟获得智力加成+1%]=],
    ["SwallowTip"] = [=[[焚天]|n随机获得(英雄等级*1~2%)的最终伤害]=],
    ["PID"] = 7,
    ["Lv"] = 6,
    ["Attr"] = [=[智力+30000]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB615.blp]=],
    ["Value1"] = 1,
    ["Value2"] = 2
}
excel[616] = {
    ["Name"] = [=[诗经「S级」]=],
    ["Tip"] = [=[[提神]|n攻击增加1~2点智力]=],
    ["SwallowTip"] = [=[[点睛]|n英雄每次升级获得1点法术暴率,最高15点]=],
    ["PID"] = 8,
    ["Lv"] = 6,
    ["Attr"] = [=[法术伤害+40%|n法术暴伤+40%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB616.blp]=],
    ["Value1"] = 1,
    ["Value2"] = 15
}
excel[617] = {
    ["Name"] = [=[天龙印「S级」]=],
    ["SwallowTip"] = [=[[弑神]|n对BOSS造成的伤害提升30%(乘法)]=],
    ["Attr"] = [=[护甲+250|n每秒回血+2500|n最终伤害+25%]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB617.blp]=],
    ["Value1"] = 1.3
}
excel[618] = {
    ["Name"] = [=[罄竹难书「S级」]=],
    ["Tip"] = [=[[灵根复苏]|n每次英雄升级每秒力量,敏捷,智力其中1个增加1点]=],
    ["SwallowTip"] = [=[[橡树之心]|n随机获得当前(英雄等级*0.8)的点数,随机分配到杀敌力量,敏捷,智力上(单个不能分配超过等级*0.5)]=],
    ["PID"] = 9,
    ["Lv"] = 6,
    ["Attr"] = [=[力量+20000|n敏捷+20000|n智力+20000]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB618.blp]=],
    ["Value1"] = 0.8,
    ["Value2"] = 0.5
}
excel[619] = {
    ["Name"] = [=[仙人衣「S级」]=],
    ["Tip"] = [=[[不灭]|n每杀敌100增加10~15点生命恢复]=],
    ["SwallowTip"] = [=[[硬汉]|n每秒回血(最终每秒回血)增幅100%(动态)]=],
    ["PID"] = 10,
    ["Lv"] = 6,
    ["Attr"] = [=[生命值+50000|n每秒回血+2500]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB619.blp]=],
    ["Value1"] = 2
}
excel[620] = {
    ["Name"] = [=[震天凌「S级」]=],
    ["SwallowTip"] = [=[[震天之音]|n增加按照当前吞噬的装备数量*5%的绝对伤害]=],
    ["Attr"] = [=[力量+20000|n敏捷+20000|n智力+20000]=],
    ["Icon"] = [=[Survival\UI\Equip\BTNZB620.blp]=],
    ["Value1"] = 5
}

return excel