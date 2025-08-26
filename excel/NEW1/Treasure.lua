local ns = ns
local excel = ns.excel.create()
excel:set_name('宝物')
excel.type = {[1]="ID",[2]="Name",[3]="Tip",[4]="TID",[5]="Lv",[6]="Attr",[7]="Icon",[8]="Value1",[9]="Value2",[10]="Value3"}
excel[101] = {
    ["Name"] = [=[木之卷]=],
    ["Tip"] = [=[木材50~100]=],
    ["TID"] = 1,
    ["Lv"] = 1,
    ["Icon"] = [=[Survival\UI\Treasure\BW101.blp]=],
    ["Value1"] = 50,
    ["Value2"] = 100
}
excel[102] = {
    ["Name"] = [=[乾坤一掷]=],
    ["Tip"] = [=[当前金币增加50%]=],
    ["TID"] = 2,
    ["Lv"] = 1,
    ["Attr"] = [=[当前金币+50%]=],
    ["Icon"] = [=[Survival\UI\Treasure\BW102.blp]=]
}
excel[103] = {
    ["Name"] = [=[貔貅]=],
    ["Tip"] = [=[当前杀敌增加50%]=],
    ["TID"] = 3,
    ["Lv"] = 1,
    ["Attr"] = [=[当前杀敌+50%]=],
    ["Icon"] = [=[Survival\UI\Treasure\BW103.blp]=]
}
excel[104] = {
    ["Name"] = [=[旋风盾]=],
    ["Tip"] = [=[护甲+50,每秒护甲+0.5]=],
    ["TID"] = 4,
    ["Lv"] = 1,
    ["Attr"] = [=[护甲+50|n每秒护甲+0.5]=],
    ["Icon"] = [=[Survival\UI\Treasure\BW104.blp]=]
}
excel[105] = {
    ["Name"] = [=[荷叶烧鸡]=],
    ["Tip"] = [=[增加宝物刷新次数+2]=],
    ["TID"] = 5,
    ["Lv"] = 1,
    ["Icon"] = [=[Survival\UI\Treasure\BW105.blp]=],
    ["Value1"] = 2
}
excel[106] = {
    ["Name"] = [=[南瓜]=],
    ["Tip"] = [=[英雄下次进化提高当前最高一个属性(力,敏,智)10%]=],
    ["TID"] = 6,
    ["Lv"] = 1,
    ["Icon"] = [=[Survival\UI\Treasure\BW106.blp]=],
    ["Value1"] = 0.1
}
excel[107] = {
    ["Name"] = [=[陈年老醋]=],
    ["Tip"] = [=[每秒全属+5,杀敌全属+1]=],
    ["TID"] = 7,
    ["Lv"] = 1,
    ["Attr"] = [=[每秒全属+5|n杀敌全属+1]=],
    ["Icon"] = [=[Survival\UI\Treasure\BW107.blp]=]
}
excel[108] = {
    ["Name"] = [=[剑箱]=],
    ["Tip"] = [=[攻击暴率+10%,攻击暴伤+25%]=],
    ["TID"] = 8,
    ["Lv"] = 1,
    ["Attr"] = [=[攻击暴率+10%|n攻击暴伤+25%]=],
    ["Icon"] = [=[Survival\UI\Treasure\BW108.blp]=]
}
excel[109] = {
    ["Name"] = [=[黄金丹]=],
    ["Tip"] = [=[杀敌500后随机获得金币1~20000]=],
    ["TID"] = 9,
    ["Lv"] = 1,
    ["Icon"] = [=[Survival\UI\Treasure\BW109.blp]=],
    ["Value1"] = 10,
    ["Value2"] = 1,
    ["Value3"] = 20000
}
excel[110] = {
    ["Name"] = [=[多重弓]=],
    ["Tip"] = [=[多重箭+1,最终伤害+15%]=],
    ["TID"] = 10,
    ["Lv"] = 1,
    ["Attr"] = [=[多重数量+1|n最终伤害+15%]=],
    ["Icon"] = [=[Survival\UI\Treasure\BW110.blp]=]
}
excel[111] = {
    ["Name"] = [=[信封]=],
    ["Tip"] = [=[黑市免费刷新次数+2]=],
    ["TID"] = 11,
    ["Lv"] = 1,
    ["Icon"] = [=[Survival\UI\Treasure\BW111.blp]=],
    ["Value1"] = 2
}
excel[112] = {
    ["Name"] = [=[英雄帖]=],
    ["Tip"] = [=[进化免费刷新次数+1]=],
    ["TID"] = 12,
    ["Lv"] = 1,
    ["Icon"] = [=[Survival\UI\Treasure\BW112.blp]=],
    ["Value1"] = 1
}
excel[113] = {
    ["Name"] = [=[神仙水]=],
    ["Tip"] = [=[当前力,敏,智随机其中1条的属性提升10%]=],
    ["TID"] = 13,
    ["Lv"] = 1,
    ["Icon"] = [=[Survival\UI\Treasure\BW113.blp]=],
    ["Value1"] = 10
}
excel[114] = {
    ["Name"] = [=[翡翠]=],
    ["Tip"] = [=[每秒回血+2500,生命恢复+1%]=],
    ["TID"] = 14,
    ["Lv"] = 1,
    ["Attr"] = [=[每秒回血+2500|n每秒百分比回血+1%]=],
    ["Icon"] = [=[Survival\UI\Treasure\BW114.blp]=]
}
excel[115] = {
    ["Name"] = [=[鲜血之书]=],
    ["Tip"] = [=[攻击吸血+2%,技能吸血+1%]=],
    ["TID"] = 15,
    ["Lv"] = 1,
    ["Attr"] = [=[攻击吸血+2%|n技能吸血+1%]=],
    ["Icon"] = [=[Survival\UI\Treasure\BW115.blp]=]
}
excel[116] = {
    ["Name"] = [=[卡牌吞噬丹]=],
    ["Tip"] = [=[获得卡牌吞噬丹*1]=],
    ["TID"] = 16,
    ["Lv"] = 1,
    ["Icon"] = [=[Survival\UI\Treasure\BW116.blp]=],
    ["Value1"] = 1
}
excel[117] = {
    ["Name"] = [=[装备吞噬丹]=],
    ["Tip"] = [=[获得装备吞噬丹*1]=],
    ["TID"] = 17,
    ["Lv"] = 1,
    ["Icon"] = [=[Survival\UI\Treasure\BW117.blp]=],
    ["Value1"] = 1
}
excel[118] = {
    ["Name"] = [=[金刚石]=],
    ["Tip"] = [=[装备吞噬上限+1]=],
    ["TID"] = 18,
    ["Lv"] = 1,
    ["Icon"] = [=[Survival\UI\Treasure\BW118.blp]=],
    ["Value1"] = 1
}
excel[119] = {
    ["Name"] = [=[装备箱]=],
    ["Tip"] = [=[随机获得1件1~5级装备]=],
    ["TID"] = 19,
    ["Lv"] = 1,
    ["Icon"] = [=[Survival\UI\Treasure\BW119.blp]=],
    ["Value1"] = 1,
    ["Value2"] = 5
}
excel[120] = {
    ["Name"] = [=[乌龟壳]=],
    ["Tip"] = [=[装备置换石1-11颗]=],
    ["TID"] = 20,
    ["Lv"] = 1,
    ["Icon"] = [=[Survival\UI\Treasure\BW120.blp]=],
    ["Value1"] = 1,
    ["Value2"] = 11
}
excel[201] = {
    ["Name"] = [=[木之卷]=],
    ["Tip"] = [=[木材100~200]=],
    ["TID"] = 1,
    ["Lv"] = 2,
    ["Icon"] = [=[Survival\UI\Treasure\BW201.blp]=],
    ["Value1"] = 100,
    ["Value2"] = 200
}
excel[202] = {
    ["Name"] = [=[乾坤一掷]=],
    ["Tip"] = [=[当前金币增加75%]=],
    ["TID"] = 2,
    ["Lv"] = 2,
    ["Attr"] = [=[当前金币+75%]=],
    ["Icon"] = [=[Survival\UI\Treasure\BW202.blp]=]
}
excel[203] = {
    ["Name"] = [=[貔貅]=],
    ["Tip"] = [=[当前杀敌增加75%]=],
    ["TID"] = 3,
    ["Lv"] = 2,
    ["Attr"] = [=[当前杀敌+75%]=],
    ["Icon"] = [=[Survival\UI\Treasure\BW203.blp]=]
}
excel[204] = {
    ["Name"] = [=[旋风盾]=],
    ["Tip"] = [=[护甲+150,每秒护甲+0.5]=],
    ["TID"] = 4,
    ["Lv"] = 2,
    ["Attr"] = [=[护甲+150|n每秒护甲+0.5]=],
    ["Icon"] = [=[Survival\UI\Treasure\BW204.blp]=]
}
excel[205] = {
    ["Name"] = [=[荷叶烧鸡]=],
    ["Tip"] = [=[增加宝物刷新次数+2]=],
    ["TID"] = 5,
    ["Lv"] = 2,
    ["Icon"] = [=[Survival\UI\Treasure\BW205.blp]=],
    ["Value1"] = 2
}
excel[206] = {
    ["Name"] = [=[南瓜]=],
    ["Tip"] = [=[英雄下次进化提高当前最高一个属性(力,敏,智)15%]=],
    ["TID"] = 6,
    ["Lv"] = 2,
    ["Icon"] = [=[Survival\UI\Treasure\BW206.blp]=],
    ["Value1"] = 0.15
}
excel[207] = {
    ["Name"] = [=[陈年老醋]=],
    ["Tip"] = [=[每秒全属+10,杀敌全属+2]=],
    ["TID"] = 7,
    ["Lv"] = 2,
    ["Attr"] = [=[每秒全属+10|n杀敌全属+2]=],
    ["Icon"] = [=[Survival\UI\Treasure\BW207.blp]=]
}
excel[208] = {
    ["Name"] = [=[剑箱]=],
    ["Tip"] = [=[攻击暴率+10%,攻击暴伤+40%]=],
    ["TID"] = 8,
    ["Lv"] = 2,
    ["Attr"] = [=[攻击暴率+10%|n攻击暴伤+40%]=],
    ["Icon"] = [=[Survival\UI\Treasure\BW208.blp]=]
}
excel[209] = {
    ["Name"] = [=[黄金丹]=],
    ["Tip"] = [=[杀敌500后随机获得金币1~30000]=],
    ["TID"] = 9,
    ["Lv"] = 2,
    ["Icon"] = [=[Survival\UI\Treasure\BW209.blp]=],
    ["Value1"] = 10,
    ["Value2"] = 1,
    ["Value3"] = 30000
}
excel[210] = {
    ["Name"] = [=[多重弓]=],
    ["Tip"] = [=[多重箭+1,最终伤害+20%]=],
    ["TID"] = 10,
    ["Lv"] = 2,
    ["Attr"] = [=[多重数量+1|n最终伤害+20%]=],
    ["Icon"] = [=[Survival\UI\Treasure\BW210.blp]=]
}
excel[211] = {
    ["Name"] = [=[信封]=],
    ["Tip"] = [=[黑市免费刷新次数+2]=],
    ["TID"] = 11,
    ["Lv"] = 2,
    ["Icon"] = [=[Survival\UI\Treasure\BW211.blp]=],
    ["Value1"] = 2
}
excel[212] = {
    ["Name"] = [=[英雄帖]=],
    ["Tip"] = [=[进化免费刷新次数+1]=],
    ["TID"] = 12,
    ["Lv"] = 2,
    ["Icon"] = [=[Survival\UI\Treasure\BW212.blp]=],
    ["Value1"] = 2
}
excel[213] = {
    ["Name"] = [=[神仙水]=],
    ["Tip"] = [=[当前力,敏,智随机其中1条的属性提升15%]=],
    ["TID"] = 13,
    ["Lv"] = 2,
    ["Icon"] = [=[Survival\UI\Treasure\BW213.blp]=],
    ["Value1"] = 15
}
excel[214] = {
    ["Name"] = [=[翡翠]=],
    ["Tip"] = [=[每秒回血+3500,生命恢复+1.5%]=],
    ["TID"] = 14,
    ["Lv"] = 2,
    ["Attr"] = [=[每秒回血+3500|n每秒百分比回血+1.5%]=],
    ["Icon"] = [=[Survival\UI\Treasure\BW214.blp]=]
}
excel[215] = {
    ["Name"] = [=[鲜血之书]=],
    ["Tip"] = [=[攻击吸血+3%,技能吸血+1.5%]=],
    ["TID"] = 15,
    ["Lv"] = 2,
    ["Attr"] = [=[攻击吸血+3%|n技能吸血+1.5%]=],
    ["Icon"] = [=[Survival\UI\Treasure\BW215.blp]=]
}
excel[216] = {
    ["Name"] = [=[卡牌吞噬丹]=],
    ["Tip"] = [=[获得卡牌吞噬丹*1]=],
    ["TID"] = 16,
    ["Lv"] = 2,
    ["Icon"] = [=[Survival\UI\Treasure\BW216.blp]=],
    ["Value1"] = 1
}
excel[217] = {
    ["Name"] = [=[装备吞噬丹]=],
    ["Tip"] = [=[获得装备吞噬丹*1]=],
    ["TID"] = 17,
    ["Lv"] = 2,
    ["Icon"] = [=[Survival\UI\Treasure\BW217.blp]=],
    ["Value1"] = 1
}
excel[218] = {
    ["Name"] = [=[金刚石]=],
    ["Tip"] = [=[装备吞噬上限+1]=],
    ["TID"] = 18,
    ["Lv"] = 2,
    ["Icon"] = [=[Survival\UI\Treasure\BW218.blp]=],
    ["Value1"] = 1
}
excel[219] = {
    ["Name"] = [=[装备箱]=],
    ["Tip"] = [=[随机获得1件2~5级装备]=],
    ["TID"] = 19,
    ["Lv"] = 2,
    ["Icon"] = [=[Survival\UI\Treasure\BW219.blp]=],
    ["Value1"] = 2,
    ["Value2"] = 5
}
excel[220] = {
    ["Name"] = [=[乌龟壳]=],
    ["Tip"] = [=[装备置换石1-11颗]=],
    ["TID"] = 20,
    ["Lv"] = 2,
    ["Icon"] = [=[Survival\UI\Treasure\BW220.blp]=],
    ["Value1"] = 1,
    ["Value2"] = 11
}
excel[301] = {
    ["Name"] = [=[木之卷]=],
    ["Tip"] = [=[木材150~300]=],
    ["TID"] = 1,
    ["Lv"] = 3,
    ["Icon"] = [=[Survival\UI\Treasure\BW301.blp]=],
    ["Value1"] = 150,
    ["Value2"] = 300
}
excel[302] = {
    ["Name"] = [=[乾坤一掷]=],
    ["Tip"] = [=[当前金币增加100%]=],
    ["TID"] = 2,
    ["Lv"] = 3,
    ["Attr"] = [=[当前金币+100%]=],
    ["Icon"] = [=[Survival\UI\Treasure\BW302.blp]=]
}
excel[303] = {
    ["Name"] = [=[貔貅]=],
    ["Tip"] = [=[当前杀敌增加100%]=],
    ["TID"] = 3,
    ["Lv"] = 3,
    ["Attr"] = [=[当前杀敌+100%]=],
    ["Icon"] = [=[Survival\UI\Treasure\BW303.blp]=]
}
excel[304] = {
    ["Name"] = [=[旋风盾]=],
    ["Tip"] = [=[护甲+250,每秒护甲+0.5]=],
    ["TID"] = 4,
    ["Lv"] = 3,
    ["Attr"] = [=[护甲+250|n每秒护甲+0.5]=],
    ["Icon"] = [=[Survival\UI\Treasure\BW304.blp]=]
}
excel[305] = {
    ["Name"] = [=[荷叶烧鸡]=],
    ["Tip"] = [=[增加宝物刷新次数+2]=],
    ["TID"] = 5,
    ["Lv"] = 3,
    ["Icon"] = [=[Survival\UI\Treasure\BW305.blp]=],
    ["Value1"] = 2
}
excel[306] = {
    ["Name"] = [=[南瓜]=],
    ["Tip"] = [=[英雄下次进化提高当前最高一个属性(力,敏,智)20%]=],
    ["TID"] = 6,
    ["Lv"] = 3,
    ["Icon"] = [=[Survival\UI\Treasure\BW306.blp]=],
    ["Value1"] = 0.2
}
excel[307] = {
    ["Name"] = [=[陈年老醋]=],
    ["Tip"] = [=[每秒全属+15,杀敌全属+3]=],
    ["TID"] = 7,
    ["Lv"] = 3,
    ["Attr"] = [=[每秒全属+15|n杀敌全属+3]=],
    ["Icon"] = [=[Survival\UI\Treasure\BW307.blp]=]
}
excel[308] = {
    ["Name"] = [=[剑箱]=],
    ["Tip"] = [=[攻击暴率+10%,攻击暴伤+60%]=],
    ["TID"] = 8,
    ["Lv"] = 3,
    ["Attr"] = [=[攻击暴率+10%|n攻击暴伤+60%]=],
    ["Icon"] = [=[Survival\UI\Treasure\BW308.blp]=]
}
excel[309] = {
    ["Name"] = [=[黄金丹]=],
    ["Tip"] = [=[杀敌500后随机获得金币1~40000]=],
    ["TID"] = 9,
    ["Lv"] = 3,
    ["Icon"] = [=[Survival\UI\Treasure\BW309.blp]=],
    ["Value1"] = 10,
    ["Value2"] = 1,
    ["Value3"] = 40000
}
excel[310] = {
    ["Name"] = [=[多重弓]=],
    ["Tip"] = [=[多重箭+1,最终伤害+30%]=],
    ["TID"] = 10,
    ["Lv"] = 3,
    ["Attr"] = [=[多重数量+1|n最终伤害+30%]=],
    ["Icon"] = [=[Survival\UI\Treasure\BW310.blp]=]
}
excel[311] = {
    ["Name"] = [=[信封]=],
    ["Tip"] = [=[黑市免费刷新次数+3]=],
    ["TID"] = 11,
    ["Lv"] = 3,
    ["Icon"] = [=[Survival\UI\Treasure\BW311.blp]=],
    ["Value1"] = 3
}
excel[312] = {
    ["Name"] = [=[英雄帖]=],
    ["Tip"] = [=[进化免费刷新次数+2]=],
    ["TID"] = 12,
    ["Lv"] = 3,
    ["Icon"] = [=[Survival\UI\Treasure\BW312.blp]=],
    ["Value1"] = 2
}
excel[313] = {
    ["Name"] = [=[神仙水]=],
    ["Tip"] = [=[当前力,敏,智随机其中1条的属性提升20%]=],
    ["TID"] = 13,
    ["Lv"] = 3,
    ["Icon"] = [=[Survival\UI\Treasure\BW313.blp]=],
    ["Value1"] = 20
}
excel[314] = {
    ["Name"] = [=[翡翠]=],
    ["Tip"] = [=[每秒回血+6500,生命恢复+2%]=],
    ["TID"] = 14,
    ["Lv"] = 3,
    ["Attr"] = [=[每秒回血+6500|n每秒百分比回血+2%]=],
    ["Icon"] = [=[Survival\UI\Treasure\BW314.blp]=]
}
excel[315] = {
    ["Name"] = [=[鲜血之书]=],
    ["Tip"] = [=[攻击吸血+5%,技能吸血+2.5%]=],
    ["TID"] = 15,
    ["Lv"] = 3,
    ["Attr"] = [=[攻击吸血+5%|n技能吸血+2.5%]=],
    ["Icon"] = [=[Survival\UI\Treasure\BW315.blp]=]
}
excel[316] = {
    ["Name"] = [=[卡牌吞噬丹]=],
    ["Tip"] = [=[获得卡牌吞噬丹*1]=],
    ["TID"] = 16,
    ["Lv"] = 3,
    ["Icon"] = [=[Survival\UI\Treasure\BW316.blp]=],
    ["Value1"] = 1
}
excel[317] = {
    ["Name"] = [=[装备吞噬丹]=],
    ["Tip"] = [=[获得装备吞噬丹*1]=],
    ["TID"] = 17,
    ["Lv"] = 3,
    ["Icon"] = [=[Survival\UI\Treasure\BW317.blp]=],
    ["Value1"] = 1
}
excel[318] = {
    ["Name"] = [=[金刚石]=],
    ["Tip"] = [=[装备吞噬上限+2]=],
    ["TID"] = 18,
    ["Lv"] = 3,
    ["Icon"] = [=[Survival\UI\Treasure\BW318.blp]=],
    ["Value1"] = 2
}
excel[319] = {
    ["Name"] = [=[装备箱]=],
    ["Tip"] = [=[随机获得1件3~5级装备]=],
    ["TID"] = 19,
    ["Lv"] = 3,
    ["Icon"] = [=[Survival\UI\Treasure\BW319.blp]=],
    ["Value1"] = 3,
    ["Value2"] = 5
}
excel[320] = {
    ["Name"] = [=[乌龟壳]=],
    ["Tip"] = [=[装备置换石1-11颗]=],
    ["TID"] = 20,
    ["Lv"] = 3,
    ["Icon"] = [=[Survival\UI\Treasure\BW320.blp]=],
    ["Value1"] = 1,
    ["Value2"] = 11
}

return excel