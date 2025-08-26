local ns = ns
local excel = ns.excel.create()
excel:set_name('存档')
excel.type = {[1]="ID",[2]="Name",[3]="MallKey",[4]="Tip",[5]="Icon",[6]="Condition",[7]="Value1",[8]="Value2",[9]="Value3"}
excel[1] = {
    ["Name"] = [=[金币礼包]=],
    ["MallKey"] = [=[JBLB]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Welfare\1.tga]=],
    ["Condition"] = [=[|cfff83636解锁条件:商城购买]=],
    ["Value1"] = [=[攻击力+1]=]
}
excel[2] = {
    ["Name"] = [=[属性礼包]=],
    ["MallKey"] = [=[SXLB]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Welfare\2.tga]=],
    ["Condition"] = [=[|cfff83636解锁条件:商城购买]=],
    ["Value1"] = [=[攻击力+1]=]
}
excel[3] = {
    ["Name"] = [=[1元礼包]=],
    ["MallKey"] = [=[YYLB]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Welfare\3.tga]=],
    ["Condition"] = [=[|cfff83636解锁条件:商城购买]=],
    ["Value1"] = [=[攻击力+1]=]
}
excel[4] = {
    ["Name"] = [=[公众号礼包]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Welfare\4.tga]=],
    ["Condition"] = [=[|cfff83636解锁条件:公众号获取]=],
    ["Value1"] = [=[攻击力+1]=]
}
excel[5] = {
    ["Name"] = [=[KK号礼包]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Welfare\5.tga]=],
    ["Condition"] = [=[|cfff83636解锁条件:公众号获取]=],
    ["Value1"] = [=[攻击力+1]=]
}
excel[6] = {
    ["Name"] = [=[入群礼包]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Welfare\6.tga]=],
    ["Condition"] = [=[|cfff83636解锁条件:入群]=],
    ["Value1"] = [=[攻击力+1]=]
}
excel[7] = {
    ["Name"] = [=[收藏礼包]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Welfare\7.tga]=],
    ["Condition"] = [=[|cfff83636解锁条件:收藏地图]=],
    ["Value1"] = [=[攻击力+1]=]
}
excel[8] = {
    ["Name"] = [=[预约礼包]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Welfare\8.tga]=],
    ["Condition"] = [=[|cfff83636解锁条件:预约地图]=],
    ["Value1"] = [=[攻击力+1]=]
}
excel[9] = {
    ["Name"] = [=[测试礼包]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Welfare\9.tga]=],
    ["Condition"] = [=[|cfff83636解锁条件:参与地图测试]=],
    ["Value1"] = [=[攻击力+1]=]
}
excel[10] = {
    ["Name"] = [=[测试等级礼包1]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Welfare\10.tga]=],
    ["Condition"] = [=[|cfff83636解锁条件:测试地图等级达到20]=],
    ["Value1"] = [=[攻击力+1]=]
}
excel[11] = {
    ["Name"] = [=[测试等级礼包2]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Welfare\10.tga]=],
    ["Condition"] = [=[|cfff83636解锁条件:测试地图等级达到40]=],
    ["Value1"] = [=[攻击力+1]=]
}
excel[12] = {
    ["Name"] = [=[预约人数礼包1]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Welfare\12.tga]=],
    ["Condition"] = [=[|cfff83636解锁条件:预约人数达到188]=],
    ["Value1"] = [=[攻击力+1]=]
}
excel[13] = {
    ["Name"] = [=[预约人数礼包2]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Welfare\12.tga]=],
    ["Condition"] = [=[|cfff83636解锁条件:预约人数达到588]=],
    ["Value1"] = [=[攻击力+1]=]
}
excel[14] = {
    ["Name"] = [=[预约人数礼包3]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Welfare\12.tga]=],
    ["Condition"] = [=[|cfff83636解锁条件:预约人数达到1888]=],
    ["Value1"] = [=[攻击力+1]=]
}
excel[15] = {
    ["Name"] = [=[预约人数礼包4]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Welfare\12.tga]=],
    ["Condition"] = [=[|cfff83636解锁条件:预约人数达到2888]=],
    ["Value1"] = [=[攻击力+1]=]
}
excel[16] = {
    ["Name"] = [=[预约人数礼包5]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Welfare\12.tga]=],
    ["Condition"] = [=[|cfff83636解锁条件:预约人数达到3888]=],
    ["Value1"] = [=[攻击力+1]=]
}
excel[17] = {
    ["Name"] = [=[水贴1]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Welfare\17.tga]=],
    ["Condition"] = [=[|cfff83636解锁条件:发1次贴]=],
    ["Value1"] = [=[攻击力+1]=]
}
excel[18] = {
    ["Name"] = [=[水贴2]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Welfare\17.tga]=],
    ["Condition"] = [=[|cfff83636解锁条件:发5次贴]=],
    ["Value1"] = [=[攻击力+1]=]
}
excel[19] = {
    ["Name"] = [=[水贴3]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Welfare\17.tga]=],
    ["Condition"] = [=[|cfff83636解锁条件:发10次贴]=],
    ["Value1"] = [=[攻击力+1]=]
}
excel[20] = {
    ["Name"] = [=[精华贴1]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Welfare\20.tga]=],
    ["Condition"] = [=[|cfff83636解锁条件:发1次精华贴]=],
    ["Value1"] = [=[攻击力+1]=]
}
excel[21] = {
    ["Name"] = [=[点赞1]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Welfare\21.tga]=],
    ["Condition"] = [=[|cfff83636解锁条件:获得1次点赞]=],
    ["Value1"] = [=[攻击力+1]=]
}
excel[22] = {
    ["Name"] = [=[点赞2]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Welfare\21.tga]=],
    ["Condition"] = [=[|cfff83636解锁条件:获得3次点赞]=],
    ["Value1"] = [=[攻击力+1]=]
}
excel[23] = {
    ["Name"] = [=[反馈礼包]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Welfare\23.tga]=],
    ["Condition"] = [=[|cfff83636解锁条件:反馈bug和建议]=],
    ["Value1"] = [=[攻击力+1]=]
}
excel[24] = {
    ["Name"] = [=[星曜礼包]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Welfare\24.tga]=],
    ["Condition"] = [=[|cfff83636解锁条件:发行福利]=],
    ["Value1"] = [=[攻击力+1]=]
}
excel[25] = {
    ["Name"] = [=[王者礼包]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Welfare\25.tga]=],
    ["Condition"] = [=[|cfff83636解锁条件:发行福利]=],
    ["Value1"] = [=[攻击力+1]=]
}
excel[101] = {
    ["Name"] = [=[总通关次数]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Archive\WinCount\N000.blp]=],
    ["Value1"] = [=[攻击力+1]=],
    ["Value2"] = [=[攻击力+2]=],
    ["Value3"] = [=[攻击力+3]=]
}
excel[102] = {
    ["Name"] = [=[首通N1]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Archive\WinCount\N101.blp]=],
    ["Condition"] = [=[该难度首次通过]=],
    ["Value1"] = [=[攻击力+1]=],
    ["Value2"] = 1,
    ["Value3"] = 1
}
excel[103] = {
    ["Name"] = [=[首通N2]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Archive\WinCount\N102.blp]=],
    ["Condition"] = [=[该难度首次通过]=],
    ["Value1"] = [=[攻击力+1]=],
    ["Value2"] = 1,
    ["Value3"] = 2
}
excel[104] = {
    ["Name"] = [=[首通N3]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Archive\WinCount\N103.blp]=],
    ["Condition"] = [=[该难度首次通过]=],
    ["Value1"] = [=[攻击力+1]=],
    ["Value2"] = 1,
    ["Value3"] = 3
}
excel[105] = {
    ["Name"] = [=[首通N4]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Archive\WinCount\N104.blp]=],
    ["Condition"] = [=[该难度首次通过]=],
    ["Value1"] = [=[攻击力+1]=],
    ["Value2"] = 1,
    ["Value3"] = 4
}
excel[106] = {
    ["Name"] = [=[首通N5]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Archive\WinCount\N105.blp]=],
    ["Condition"] = [=[该难度首次通过]=],
    ["Value1"] = [=[攻击力+1]=],
    ["Value2"] = 1,
    ["Value3"] = 5
}
excel[107] = {
    ["Name"] = [=[首通N6]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Archive\WinCount\N106.blp]=],
    ["Condition"] = [=[该难度首次通过]=],
    ["Value1"] = [=[攻击力+1]=],
    ["Value2"] = 1,
    ["Value3"] = 6
}
excel[108] = {
    ["Name"] = [=[首通N7]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Archive\WinCount\N107.blp]=],
    ["Condition"] = [=[该难度首次通过]=],
    ["Value1"] = [=[攻击力+1]=],
    ["Value2"] = 1,
    ["Value3"] = 7
}
excel[109] = {
    ["Name"] = [=[首通N8]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Archive\WinCount\N108.blp]=],
    ["Condition"] = [=[该难度首次通过]=],
    ["Value1"] = [=[攻击力+1]=],
    ["Value2"] = 1,
    ["Value3"] = 8
}
excel[110] = {
    ["Name"] = [=[首通N9]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Archive\WinCount\N109.blp]=],
    ["Condition"] = [=[该难度首次通过]=],
    ["Value1"] = [=[攻击力+1]=],
    ["Value2"] = 1,
    ["Value3"] = 9
}
excel[111] = {
    ["Name"] = [=[首通N10]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Archive\WinCount\N110.blp]=],
    ["Condition"] = [=[该难度首次通过]=],
    ["Value1"] = [=[攻击力+1]=],
    ["Value2"] = 1,
    ["Value3"] = 10
}
excel[112] = {
    ["Name"] = [=[多通[3]N2]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Archive\WinCount\N202.blp]=],
    ["Condition"] = [=[该难度通过达到3次]=],
    ["Value1"] = [=[攻击力+1]=],
    ["Value2"] = 3,
    ["Value3"] = 2
}
excel[113] = {
    ["Name"] = [=[多通[3]N3]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Archive\WinCount\N203.blp]=],
    ["Condition"] = [=[该难度通过达到3次]=],
    ["Value1"] = [=[攻击力+1]=],
    ["Value2"] = 3,
    ["Value3"] = 3
}
excel[114] = {
    ["Name"] = [=[多通[3]N4]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Archive\WinCount\N204.blp]=],
    ["Condition"] = [=[该难度通过达到3次]=],
    ["Value1"] = [=[攻击力+1]=],
    ["Value2"] = 3,
    ["Value3"] = 4
}
excel[115] = {
    ["Name"] = [=[多通[3]N5]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Archive\WinCount\N205.blp]=],
    ["Condition"] = [=[该难度通过达到3次]=],
    ["Value1"] = [=[攻击力+1]=],
    ["Value2"] = 3,
    ["Value3"] = 5
}
excel[116] = {
    ["Name"] = [=[多通[3]N6]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Archive\WinCount\N206.blp]=],
    ["Condition"] = [=[该难度通过达到3次]=],
    ["Value1"] = [=[攻击力+1]=],
    ["Value2"] = 3,
    ["Value3"] = 6
}
excel[117] = {
    ["Name"] = [=[多通[3]N7]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Archive\WinCount\N207.blp]=],
    ["Condition"] = [=[该难度通过达到3次]=],
    ["Value1"] = [=[攻击力+1]=],
    ["Value2"] = 3,
    ["Value3"] = 7
}
excel[118] = {
    ["Name"] = [=[多通[3]N8]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Archive\WinCount\N208.blp]=],
    ["Condition"] = [=[该难度通过达到3次]=],
    ["Value1"] = [=[攻击力+1]=],
    ["Value2"] = 3,
    ["Value3"] = 8
}
excel[119] = {
    ["Name"] = [=[多通[3]N9]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Archive\WinCount\N209.blp]=],
    ["Condition"] = [=[该难度通过达到3次]=],
    ["Value1"] = [=[攻击力+1]=],
    ["Value2"] = 3,
    ["Value3"] = 9
}
excel[120] = {
    ["Name"] = [=[多通[3]N10]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Archive\WinCount\N210.blp]=],
    ["Condition"] = [=[该难度通过达到3次]=],
    ["Value1"] = [=[攻击力+1]=],
    ["Value2"] = 3,
    ["Value3"] = 10
}
excel[121] = {
    ["Name"] = [=[多通[10]N3]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Archive\WinCount\N303.blp]=],
    ["Condition"] = [=[该难度通过达到10次]=],
    ["Value1"] = [=[攻击力+1]=],
    ["Value2"] = 10,
    ["Value3"] = 3
}
excel[122] = {
    ["Name"] = [=[多通[10]N4]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Archive\WinCount\N304.blp]=],
    ["Condition"] = [=[该难度通过达到10次]=],
    ["Value1"] = [=[攻击力+1]=],
    ["Value2"] = 10,
    ["Value3"] = 4
}
excel[123] = {
    ["Name"] = [=[多通[10]N5]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Archive\WinCount\N305.blp]=],
    ["Condition"] = [=[该难度通过达到10次]=],
    ["Value1"] = [=[攻击力+1]=],
    ["Value2"] = 10,
    ["Value3"] = 5
}
excel[124] = {
    ["Name"] = [=[多通[10]N6]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Archive\WinCount\N306.blp]=],
    ["Condition"] = [=[该难度通过达到10次]=],
    ["Value1"] = [=[攻击力+1]=],
    ["Value2"] = 10,
    ["Value3"] = 6
}
excel[125] = {
    ["Name"] = [=[多通[10]N7]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Archive\WinCount\N307.blp]=],
    ["Condition"] = [=[该难度通过达到10次]=],
    ["Value1"] = [=[攻击力+1]=],
    ["Value2"] = 10,
    ["Value3"] = 7
}
excel[126] = {
    ["Name"] = [=[多通[10]N8]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Archive\WinCount\N308.blp]=],
    ["Condition"] = [=[该难度通过达到10次]=],
    ["Value1"] = [=[攻击力+1]=],
    ["Value2"] = 10,
    ["Value3"] = 8
}
excel[127] = {
    ["Name"] = [=[多通[10]N9]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Archive\WinCount\N309.blp]=],
    ["Condition"] = [=[该难度通过达到10次]=],
    ["Value1"] = [=[攻击力+1]=],
    ["Value2"] = 10,
    ["Value3"] = 9
}
excel[128] = {
    ["Name"] = [=[多通[10]N10]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Archive\WinCount\N310.blp]=],
    ["Condition"] = [=[该难度通过达到10次]=],
    ["Value1"] = [=[攻击力+1]=],
    ["Value2"] = 10,
    ["Value3"] = 10
}
excel[129] = {
    ["Name"] = [=[多通[20]N5]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Archive\WinCount\N405.blp]=],
    ["Condition"] = [=[该难度通过达到20次]=],
    ["Value1"] = [=[攻击力+1]=],
    ["Value2"] = 20,
    ["Value3"] = 5
}
excel[130] = {
    ["Name"] = [=[多通[20]N6]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Archive\WinCount\N406.blp]=],
    ["Condition"] = [=[该难度通过达到20次]=],
    ["Value1"] = [=[攻击力+1]=],
    ["Value2"] = 20,
    ["Value3"] = 6
}
excel[131] = {
    ["Name"] = [=[多通[20]N7]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Archive\WinCount\N407.blp]=],
    ["Condition"] = [=[该难度通过达到20次]=],
    ["Value1"] = [=[攻击力+1]=],
    ["Value2"] = 20,
    ["Value3"] = 7
}
excel[132] = {
    ["Name"] = [=[多通[20]N8]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Archive\WinCount\N408.blp]=],
    ["Condition"] = [=[该难度通过达到20次]=],
    ["Value1"] = [=[攻击力+1]=],
    ["Value2"] = 20,
    ["Value3"] = 8
}
excel[133] = {
    ["Name"] = [=[多通[20]N9]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Archive\WinCount\N409.blp]=],
    ["Condition"] = [=[该难度通过达到20次]=],
    ["Value1"] = [=[攻击力+1]=],
    ["Value2"] = 20,
    ["Value3"] = 9
}
excel[134] = {
    ["Name"] = [=[多通[20]N10]=],
    ["Tip"] = [=[获得属性]=],
    ["Icon"] = [=[Survival\UI\Archive\WinCount\N410.blp]=],
    ["Condition"] = [=[该难度通过达到20次]=],
    ["Value1"] = [=[攻击力+1]=],
    ["Value2"] = 20,
    ["Value3"] = 10
}
excel[201] = {
    ["Name"] = [=[攻击力]=],
    ["Tip"] = [=[每级获得攻击力+1]=],
    ["Icon"] = [=[Survival\UI\Archive\TalentTree\Talent101.blp]=],
    ["Condition"] = [=[需要[本源]0级]=],
    ["Value1"] = 0,
    ["Value2"] = 30,
    ["Value3"] = [=[攻击力+1]=]
}
excel[202] = {
    ["Name"] = [=[生命值]=],
    ["Tip"] = [=[每级获得生命值+1]=],
    ["Icon"] = [=[Survival\UI\Archive\TalentTree\Talent102.blp]=],
    ["Condition"] = [=[需要[本源]5级]=],
    ["Value1"] = 5,
    ["Value2"] = 30,
    ["Value3"] = [=[生命值+1]=]
}
excel[203] = {
    ["Name"] = [=[每秒回血]=],
    ["Tip"] = [=[每级获得每秒回血+1]=],
    ["Icon"] = [=[Survival\UI\Archive\TalentTree\Talent103.blp]=],
    ["Condition"] = [=[需要[本源]10级]=],
    ["Value1"] = 10,
    ["Value2"] = 30,
    ["Value3"] = [=[每秒回血+1]=]
}
excel[204] = {
    ["Name"] = [=[力量]=],
    ["Tip"] = [=[每级获得力量+1]=],
    ["Icon"] = [=[Survival\UI\Archive\TalentTree\Talent104.blp]=],
    ["Condition"] = [=[需要[本源]20级]=],
    ["Value1"] = 20,
    ["Value2"] = 30,
    ["Value3"] = [=[力量+1]=]
}
excel[205] = {
    ["Name"] = [=[敏捷]=],
    ["Tip"] = [=[每级获得敏捷+1]=],
    ["Icon"] = [=[Survival\UI\Archive\TalentTree\Talent105.blp]=],
    ["Condition"] = [=[需要[本源]40级]=],
    ["Value1"] = 40,
    ["Value2"] = 30,
    ["Value3"] = [=[敏捷+1]=]
}
excel[206] = {
    ["Name"] = [=[智力]=],
    ["Tip"] = [=[每级获得智力+1]=],
    ["Icon"] = [=[Survival\UI\Archive\TalentTree\Talent106.blp]=],
    ["Condition"] = [=[需要[本源]80级]=],
    ["Value1"] = 80,
    ["Value2"] = 30,
    ["Value3"] = [=[智力+1]=]
}
excel[207] = {
    ["Name"] = [=[护甲]=],
    ["Tip"] = [=[每级获得护甲+1]=],
    ["Icon"] = [=[Survival\UI\Archive\TalentTree\Talent107.blp]=],
    ["Condition"] = [=[需要[本源]120级]=],
    ["Value1"] = 120,
    ["Value2"] = 30,
    ["Value3"] = [=[护甲+1]=]
}
excel[208] = {
    ["Name"] = [=[金币加成]=],
    ["Tip"] = [=[每级获得金币加成+1%]=],
    ["Icon"] = [=[Survival\UI\Archive\TalentTree\Talent108.blp]=],
    ["Condition"] = [=[需要[本源]160级]=],
    ["Value1"] = 160,
    ["Value2"] = 30,
    ["Value3"] = [=[金币加成+1%]=]
}
excel[209] = {
    ["Name"] = [=[杀敌加成]=],
    ["Tip"] = [=[每级获得杀敌加成+1%]=],
    ["Icon"] = [=[Survival\UI\Archive\TalentTree\Talent109.blp]=],
    ["Condition"] = [=[需要[本源]200级]=],
    ["Value1"] = 200,
    ["Value2"] = 30,
    ["Value3"] = [=[杀敌加成+1%]=]
}
excel[231] = {
    ["Name"] = [=[攻击力]=],
    ["Tip"] = [=[每级获得攻击力+1]=],
    ["Icon"] = [=[Survival\UI\Archive\TalentTree\Talent201.blp]=],
    ["Condition"] = [=[需要[战斗]0级]=],
    ["Value1"] = 0,
    ["Value2"] = 30,
    ["Value3"] = [=[攻击力+1]=]
}
excel[232] = {
    ["Name"] = [=[生命值]=],
    ["Tip"] = [=[每级获得生命值+1]=],
    ["Icon"] = [=[Survival\UI\Archive\TalentTree\Talent202.blp]=],
    ["Condition"] = [=[需要[战斗]5级]=],
    ["Value1"] = 5,
    ["Value2"] = 30,
    ["Value3"] = [=[生命值+1]=]
}
excel[233] = {
    ["Name"] = [=[每秒回血]=],
    ["Tip"] = [=[每级获得每秒回血+1]=],
    ["Icon"] = [=[Survival\UI\Archive\TalentTree\Talent203.blp]=],
    ["Condition"] = [=[需要[战斗]10级]=],
    ["Value1"] = 10,
    ["Value2"] = 30,
    ["Value3"] = [=[每秒回血+1]=]
}
excel[234] = {
    ["Name"] = [=[物理伤害]=],
    ["Tip"] = [=[每级获得物理伤害+1%]=],
    ["Icon"] = [=[Survival\UI\Archive\TalentTree\Talent204.blp]=],
    ["Condition"] = [=[需要[战斗]20级]=],
    ["Value1"] = 20,
    ["Value2"] = 30,
    ["Value3"] = [=[物理伤害+1%]=]
}
excel[235] = {
    ["Name"] = [=[物理暴击伤害]=],
    ["Tip"] = [=[每级获得物理暴击伤害+1%]=],
    ["Icon"] = [=[Survival\UI\Archive\TalentTree\Talent205.blp]=],
    ["Condition"] = [=[需要[战斗]40级]=],
    ["Value1"] = 40,
    ["Value2"] = 30,
    ["Value3"] = [=[物理暴击伤害+1%]=]
}
excel[236] = {
    ["Name"] = [=[物理暴击率]=],
    ["Tip"] = [=[每级获得物理暴击率+1%]=],
    ["Icon"] = [=[Survival\UI\Archive\TalentTree\Talent206.blp]=],
    ["Condition"] = [=[需要[战斗]80级]=],
    ["Value1"] = 80,
    ["Value2"] = 30,
    ["Value3"] = [=[物理暴击率+1%]=]
}
excel[237] = {
    ["Name"] = [=[攻击速度]=],
    ["Tip"] = [=[每级获得攻击速度+1%]=],
    ["Icon"] = [=[Survival\UI\Archive\TalentTree\Talent207.blp]=],
    ["Condition"] = [=[需要[战斗]120级]=],
    ["Value1"] = 120,
    ["Value2"] = 30,
    ["Value3"] = [=[攻击速度+1%]=]
}
excel[238] = {
    ["Name"] = [=[真实伤害]=],
    ["Tip"] = [=[每级获得真实伤害+1%]=],
    ["Icon"] = [=[Survival\UI\Archive\TalentTree\Talent208.blp]=],
    ["Condition"] = [=[需要[战斗]160级]=],
    ["Value1"] = 160,
    ["Value2"] = 30,
    ["Value3"] = [=[真实伤害+1%]=]
}
excel[239] = {
    ["Name"] = [=[伤害减免]=],
    ["Tip"] = [=[每级获得伤害减免+1%]=],
    ["Icon"] = [=[Survival\UI\Archive\TalentTree\Talent209.blp]=],
    ["Condition"] = [=[需要[战斗]200级]=],
    ["Value1"] = 200,
    ["Value2"] = 30,
    ["Value3"] = [=[伤害减免+1%]=]
}
excel[261] = {
    ["Name"] = [=[攻击力]=],
    ["Tip"] = [=[每级获得攻击力+1]=],
    ["Icon"] = [=[Survival\UI\Archive\TalentTree\Talent301.blp]=],
    ["Condition"] = [=[需要[技巧]0级]=],
    ["Value1"] = 0,
    ["Value2"] = 30,
    ["Value3"] = [=[攻击力+1]=]
}
excel[262] = {
    ["Name"] = [=[生命值]=],
    ["Tip"] = [=[每级获得生命值+1]=],
    ["Icon"] = [=[Survival\UI\Archive\TalentTree\Talent302.blp]=],
    ["Condition"] = [=[需要[技巧]5级]=],
    ["Value1"] = 5,
    ["Value2"] = 30,
    ["Value3"] = [=[生命值+1]=]
}
excel[263] = {
    ["Name"] = [=[每秒回血]=],
    ["Tip"] = [=[每级获得每秒回血+1]=],
    ["Icon"] = [=[Survival\UI\Archive\TalentTree\Talent303.blp]=],
    ["Condition"] = [=[需要[技巧]10级]=],
    ["Value1"] = 10,
    ["Value2"] = 30,
    ["Value3"] = [=[每秒回血+1]=]
}
excel[264] = {
    ["Name"] = [=[法术伤害]=],
    ["Tip"] = [=[每级获得法术伤害+1%]=],
    ["Icon"] = [=[Survival\UI\Archive\TalentTree\Talent304.blp]=],
    ["Condition"] = [=[需要[技巧]20级]=],
    ["Value1"] = 20,
    ["Value2"] = 30,
    ["Value3"] = [=[法术伤害+1%]=]
}
excel[265] = {
    ["Name"] = [=[法术暴击伤害]=],
    ["Tip"] = [=[每级获得法术暴击伤害+1%]=],
    ["Icon"] = [=[Survival\UI\Archive\TalentTree\Talent305.blp]=],
    ["Condition"] = [=[需要[技巧]40级]=],
    ["Value1"] = 40,
    ["Value2"] = 30,
    ["Value3"] = [=[法术暴击伤害+1%]=]
}
excel[266] = {
    ["Name"] = [=[法术暴击率]=],
    ["Tip"] = [=[每级获得法术暴击率+1%]=],
    ["Icon"] = [=[Survival\UI\Archive\TalentTree\Talent306.blp]=],
    ["Condition"] = [=[需要[技巧]80级]=],
    ["Value1"] = 80,
    ["Value2"] = 30,
    ["Value3"] = [=[法术暴击率+1%]=]
}
excel[267] = {
    ["Name"] = [=[冷却急速]=],
    ["Tip"] = [=[每级获得冷却急速+1]=],
    ["Icon"] = [=[Survival\UI\Archive\TalentTree\Talent307.blp]=],
    ["Condition"] = [=[需要[技巧]120级]=],
    ["Value1"] = 120,
    ["Value2"] = 30,
    ["Value3"] = [=[冷却急速+1]=]
}
excel[268] = {
    ["Name"] = [=[法力值]=],
    ["Tip"] = [=[每级获得法力值+1]=],
    ["Icon"] = [=[Survival\UI\Archive\TalentTree\Talent308.blp]=],
    ["Condition"] = [=[需要[技巧]160级]=],
    ["Value1"] = 160,
    ["Value2"] = 30,
    ["Value3"] = [=[法力值+1]=]
}
excel[269] = {
    ["Name"] = [=[伤害加深]=],
    ["Tip"] = [=[每级获得伤害加深+1%]=],
    ["Icon"] = [=[Survival\UI\Archive\TalentTree\Talent309.blp]=],
    ["Condition"] = [=[需要[技巧]200级]=],
    ["Value1"] = 200,
    ["Value2"] = 30,
    ["Value3"] = [=[伤害加深+1%]=]
}
excel[301] = {
    ["Name"] = 1,
    ["Tip"] = [=[每级获得全属性+5]=],
    ["Icon"] = [=[Survival\UI\Hero\Hero_01.blp]=],
    ["Value1"] = 50,
    ["Value2"] = [=[力量+5|n敏捷+5|n智力+5]=]
}
excel[302] = {
    ["Name"] = 2,
    ["Tip"] = [=[每级获得全属性+5]=],
    ["Icon"] = [=[Survival\UI\Hero\Hero_02.blp]=],
    ["Value1"] = 50,
    ["Value2"] = [=[力量+5|n敏捷+5|n智力+5]=]
}
excel[303] = {
    ["Name"] = 3,
    ["Tip"] = [=[每级获得全属性+5]=],
    ["Icon"] = [=[Survival\UI\Hero\Hero_03.blp]=],
    ["Value1"] = 50,
    ["Value2"] = [=[力量+5|n敏捷+5|n智力+5]=]
}
excel[304] = {
    ["Name"] = 4,
    ["Tip"] = [=[每级获得全属性+5]=],
    ["Icon"] = [=[Survival\UI\Hero\Hero_04.blp]=],
    ["Value1"] = 50,
    ["Value2"] = [=[力量+5|n敏捷+5|n智力+5]=]
}
excel[305] = {
    ["Name"] = 5,
    ["Tip"] = [=[每级获得全属性+5]=],
    ["Icon"] = [=[Survival\UI\Hero\Hero_05.blp]=],
    ["Value1"] = 50,
    ["Value2"] = [=[力量+5|n敏捷+5|n智力+5]=]
}
excel[306] = {
    ["Name"] = 6,
    ["Tip"] = [=[每级获得全属性+5]=],
    ["Icon"] = [=[Survival\UI\Hero\Hero_06.blp]=],
    ["Value1"] = 50,
    ["Value2"] = [=[力量+5|n敏捷+5|n智力+5]=]
}
excel[307] = {
    ["Name"] = 7,
    ["Tip"] = [=[每级获得全属性+5]=],
    ["Icon"] = [=[Survival\UI\Hero\Hero_07.blp]=],
    ["Value1"] = 50,
    ["Value2"] = [=[力量+5|n敏捷+5|n智力+5]=]
}
excel[308] = {
    ["Name"] = 8,
    ["Tip"] = [=[每级获得全属性+5]=],
    ["Icon"] = [=[Survival\UI\Hero\Hero_08.blp]=],
    ["Value1"] = 50,
    ["Value2"] = [=[力量+5|n敏捷+5|n智力+5]=]
}
excel[309] = {
    ["Name"] = 9,
    ["Tip"] = [=[每级获得全属性+5]=],
    ["Icon"] = [=[Survival\UI\Hero\Hero_09.blp]=],
    ["Value1"] = 50,
    ["Value2"] = [=[力量+5|n敏捷+5|n智力+5]=]
}
excel[310] = {
    ["Name"] = 10,
    ["Tip"] = [=[每级获得全属性+5]=],
    ["Icon"] = [=[Survival\UI\Hero\Hero_10.blp]=],
    ["Value1"] = 50,
    ["Value2"] = [=[力量+5|n敏捷+5|n智力+5]=]
}
excel[311] = {
    ["Name"] = 11,
    ["Tip"] = [=[每级获得全属性+5]=],
    ["Icon"] = [=[Survival\UI\Hero\Hero_11.blp]=],
    ["Value1"] = 50,
    ["Value2"] = [=[力量+5|n敏捷+5|n智力+5]=]
}
excel[312] = {
    ["Name"] = 12,
    ["Tip"] = [=[每级获得全属性+5]=],
    ["Icon"] = [=[Survival\UI\Hero\Hero_12.blp]=],
    ["Value1"] = 50,
    ["Value2"] = [=[力量+5|n敏捷+5|n智力+5]=]
}
excel[313] = {
    ["Name"] = 13,
    ["Tip"] = [=[每级获得全属性+5]=],
    ["Icon"] = [=[Survival\UI\Hero\Hero_13.blp]=],
    ["Value1"] = 50,
    ["Value2"] = [=[力量+5|n敏捷+5|n智力+5]=]
}
excel[314] = {
    ["Name"] = 14,
    ["Tip"] = [=[每级获得全属性+5]=],
    ["Icon"] = [=[Survival\UI\Hero\Hero_14.blp]=],
    ["Value1"] = 50,
    ["Value2"] = [=[力量+5|n敏捷+5|n智力+5]=]
}
excel[315] = {
    ["Name"] = 15,
    ["Tip"] = [=[每级获得全属性+5]=],
    ["Icon"] = [=[Survival\UI\Hero\Hero_15.blp]=],
    ["Value1"] = 50,
    ["Value2"] = [=[力量+5|n敏捷+5|n智力+5]=]
}
excel[316] = {
    ["Name"] = 16,
    ["Tip"] = [=[每级获得全属性+5]=],
    ["Icon"] = [=[Survival\UI\Hero\Hero_16.blp]=],
    ["Value1"] = 50,
    ["Value2"] = [=[力量+5|n敏捷+5|n智力+5]=]
}
excel[401] = {
    ["Name"] = [=[物品01]=],
    ["Tip"] = [=[每级获得力量+1,最大99级]=],
    ["Icon"] = [=[Survival\UI\Archive\TreasureHunt\TreasureHunt01.blp]=],
    ["Value1"] = 99,
    ["Value2"] = [=[力量+1]=]
}
excel[402] = {
    ["Name"] = [=[物品02]=],
    ["Tip"] = [=[每级获得力量+1,最大99级]=],
    ["Icon"] = [=[Survival\UI\Archive\TreasureHunt\TreasureHunt02.blp]=],
    ["Value1"] = 99,
    ["Value2"] = [=[力量+1]=]
}
excel[403] = {
    ["Name"] = [=[物品03]=],
    ["Tip"] = [=[每级获得力量+1,最大99级]=],
    ["Icon"] = [=[Survival\UI\Archive\TreasureHunt\TreasureHunt03.blp]=],
    ["Value1"] = 99,
    ["Value2"] = [=[力量+1]=]
}
excel[404] = {
    ["Name"] = [=[物品04]=],
    ["Tip"] = [=[每级获得力量+1,最大99级]=],
    ["Icon"] = [=[Survival\UI\Archive\TreasureHunt\TreasureHunt04.blp]=],
    ["Value1"] = 99,
    ["Value2"] = [=[力量+1]=]
}
excel[405] = {
    ["Name"] = [=[物品05]=],
    ["Tip"] = [=[每级获得力量+1,最大99级]=],
    ["Icon"] = [=[Survival\UI\Archive\TreasureHunt\TreasureHunt05.blp]=],
    ["Value1"] = 99,
    ["Value2"] = [=[力量+1]=]
}
excel[406] = {
    ["Name"] = [=[物品06]=],
    ["Tip"] = [=[每级获得力量+1,最大99级]=],
    ["Icon"] = [=[Survival\UI\Archive\TreasureHunt\TreasureHunt06.blp]=],
    ["Value1"] = 99,
    ["Value2"] = [=[力量+1]=]
}
excel[407] = {
    ["Name"] = [=[物品07]=],
    ["Tip"] = [=[每级获得力量+1,最大99级]=],
    ["Icon"] = [=[Survival\UI\Archive\TreasureHunt\TreasureHunt07.blp]=],
    ["Value1"] = 99,
    ["Value2"] = [=[力量+1]=]
}
excel[408] = {
    ["Name"] = [=[物品08]=],
    ["Tip"] = [=[每级获得力量+1,最大99级]=],
    ["Icon"] = [=[Survival\UI\Archive\TreasureHunt\TreasureHunt08.blp]=],
    ["Value1"] = 99,
    ["Value2"] = [=[力量+1]=]
}
excel[409] = {
    ["Name"] = [=[物品09]=],
    ["Tip"] = [=[每级获得力量+1,最大99级]=],
    ["Icon"] = [=[Survival\UI\Archive\TreasureHunt\TreasureHunt09.blp]=],
    ["Value1"] = 99,
    ["Value2"] = [=[力量+1]=]
}
excel[410] = {
    ["Name"] = [=[物品10]=],
    ["Tip"] = [=[每级获得力量+1,最大99级]=],
    ["Icon"] = [=[Survival\UI\Archive\TreasureHunt\TreasureHunt10.blp]=],
    ["Value1"] = 99,
    ["Value2"] = [=[力量+1]=]
}
excel[411] = {
    ["Name"] = [=[物品11]=],
    ["Tip"] = [=[每级获得力量+1,最大99级]=],
    ["Icon"] = [=[Survival\UI\Archive\TreasureHunt\TreasureHunt11.blp]=],
    ["Value1"] = 99,
    ["Value2"] = [=[力量+1]=]
}
excel[412] = {
    ["Name"] = [=[物品12]=],
    ["Tip"] = [=[每级获得力量+1,最大99级]=],
    ["Icon"] = [=[Survival\UI\Archive\TreasureHunt\TreasureHunt12.blp]=],
    ["Value1"] = 99,
    ["Value2"] = [=[力量+1]=]
}
excel[413] = {
    ["Name"] = [=[物品13]=],
    ["Tip"] = [=[每级获得力量+1,最大99级]=],
    ["Icon"] = [=[Survival\UI\Archive\TreasureHunt\TreasureHunt13.blp]=],
    ["Value1"] = 99,
    ["Value2"] = [=[力量+1]=]
}
excel[414] = {
    ["Name"] = [=[物品14]=],
    ["Tip"] = [=[每级获得力量+1,最大99级]=],
    ["Icon"] = [=[Survival\UI\Archive\TreasureHunt\TreasureHunt14.blp]=],
    ["Value1"] = 99,
    ["Value2"] = [=[力量+1]=]
}
excel[415] = {
    ["Name"] = [=[物品15]=],
    ["Tip"] = [=[每级获得力量+1,最大99级]=],
    ["Icon"] = [=[Survival\UI\Archive\TreasureHunt\TreasureHunt15.blp]=],
    ["Value1"] = 99,
    ["Value2"] = [=[力量+1]=]
}
excel[416] = {
    ["Name"] = [=[物品16]=],
    ["Tip"] = [=[每级获得力量+1,最大99级]=],
    ["Icon"] = [=[Survival\UI\Archive\TreasureHunt\TreasureHunt16.blp]=],
    ["Value1"] = 99,
    ["Value2"] = [=[力量+1]=]
}
excel[501] = {
    ["Name"] = [=[水上冲浪<1>]=],
    ["Icon"] = [=[Survival\UI\Archive\Activity\1.blp]=],
    ["Condition"] = [=[需要暑假活动点数:]=],
    ["Value1"] = 1,
    ["Value2"] = [=[攻击力+1]=]
}
excel[502] = {
    ["Name"] = [=[水上冲浪<2>]=],
    ["Icon"] = [=[Survival\UI\Archive\Activity\1.blp]=],
    ["Condition"] = [=[需要暑假活动点数:]=],
    ["Value1"] = 2,
    ["Value2"] = [=[生命值+1]=]
}
excel[503] = {
    ["Name"] = [=[水上冲浪<3>]=],
    ["Icon"] = [=[Survival\UI\Archive\Activity\1.blp]=],
    ["Condition"] = [=[需要暑假活动点数:]=],
    ["Value1"] = 3,
    ["Value2"] = [=[每秒回血+1]=]
}
excel[504] = {
    ["Name"] = [=[水上冲浪<4>]=],
    ["Icon"] = [=[Survival\UI\Archive\Activity\1.blp]=],
    ["Condition"] = [=[需要暑假活动点数:]=],
    ["Value1"] = 4,
    ["Value2"] = [=[力量+1]=]
}
excel[505] = {
    ["Name"] = [=[水上冲浪<5>]=],
    ["Icon"] = [=[Survival\UI\Archive\Activity\1.blp]=],
    ["Condition"] = [=[需要暑假活动点数:]=],
    ["Value1"] = 5,
    ["Value2"] = [=[敏捷+1]=]
}
excel[506] = {
    ["Name"] = [=[水上冲浪<6>]=],
    ["Icon"] = [=[Survival\UI\Archive\Activity\1.blp]=],
    ["Condition"] = [=[需要暑假活动点数:]=],
    ["Value1"] = 6,
    ["Value2"] = [=[智力+1]=]
}
excel[507] = {
    ["Name"] = [=[水上冲浪<7>]=],
    ["Icon"] = [=[Survival\UI\Archive\Activity\1.blp]=],
    ["Condition"] = [=[需要暑假活动点数:]=],
    ["Value1"] = 7,
    ["Value2"] = [=[护甲+1]=]
}
excel[508] = {
    ["Name"] = [=[水上冲浪<8>]=],
    ["Icon"] = [=[Survival\UI\Archive\Activity\1.blp]=],
    ["Condition"] = [=[需要暑假活动点数:]=],
    ["Value1"] = 8,
    ["Value2"] = [=[金币加成+1%]=]
}
excel[509] = {
    ["Name"] = [=[水上冲浪<9>]=],
    ["Icon"] = [=[Survival\UI\Archive\Activity\1.blp]=],
    ["Condition"] = [=[需要暑假活动点数:]=],
    ["Value1"] = 9,
    ["Value2"] = [=[杀敌加成+1%]=]
}
excel[510] = {
    ["Name"] = [=[水上冲浪<10>]=],
    ["Icon"] = [=[Survival\UI\Archive\Activity\1.blp]=],
    ["Condition"] = [=[需要暑假活动点数:]=],
    ["Value1"] = 10,
    ["Value2"] = [=[钻石加成+1%]=]
}
excel[601] = {
    ["Name"] = [=[第一天]=],
    ["Tip"] = [=[奖励]=],
    ["Icon"] = [=[Survival\UI\QRQD\reward.tga]=],
    ["Value1"] = [=[力量+1]=]
}
excel[602] = {
    ["Name"] = [=[第二天]=],
    ["Tip"] = [=[奖励]=],
    ["Icon"] = [=[Survival\UI\QRQD\reward.tga]=],
    ["Value1"] = [=[敏捷+1]=]
}
excel[603] = {
    ["Name"] = [=[第三天]=],
    ["Tip"] = [=[奖励]=],
    ["Icon"] = [=[Survival\UI\QRQD\reward.tga]=],
    ["Value1"] = [=[智力+1]=]
}
excel[604] = {
    ["Name"] = [=[第四天]=],
    ["Tip"] = [=[奖励]=],
    ["Icon"] = [=[Survival\UI\QRQD\reward.tga]=],
    ["Value1"] = [=[护甲+1]=]
}
excel[605] = {
    ["Name"] = [=[第五天]=],
    ["Tip"] = [=[奖励]=],
    ["Icon"] = [=[Survival\UI\QRQD\reward.tga]=],
    ["Value1"] = [=[金币加成+1%]=]
}
excel[606] = {
    ["Name"] = [=[第六天]=],
    ["Tip"] = [=[奖励]=],
    ["Icon"] = [=[Survival\UI\QRQD\reward.tga]=],
    ["Value1"] = [=[杀敌加成+1%]=]
}
excel[607] = {
    ["Name"] = [=[第七天]=],
    ["Tip"] = [=[奖励]=],
    ["Icon"] = [=[Survival\UI\QRQD\reward.tga]=],
    ["Value1"] = [=[钻石加成+1%]=]
}
excel[701] = {
    ["Name"] = [=[皮肤1]=],
    ["Tip"] = [=[奖励]=],
    ["Icon"] = [=[StarRail\star_1.tga]=],
    ["Condition"] = [=[解锁条件:]=],
    ["Value1"] = [=[Survival\Skin\1\1.mdx]=],
    ["Value2"] = [=[力量+1]=]
}
excel[702] = {
    ["Name"] = [=[皮肤2]=],
    ["Tip"] = [=[奖励]=],
    ["Icon"] = [=[StarRail\star_3.tga]=],
    ["Condition"] = [=[解锁条件:]=],
    ["Value1"] = [=[Survival\Skin\2\1.mdx]=],
    ["Value2"] = [=[力量+1]=]
}
excel[703] = {
    ["Name"] = [=[皮肤3]=],
    ["Tip"] = [=[奖励]=],
    ["Icon"] = [=[StarRail\star_4.tga]=],
    ["Condition"] = [=[解锁条件:]=],
    ["Value1"] = [=[Survival\Skin\3\1.mdx]=],
    ["Value2"] = [=[力量+1]=]
}
excel[704] = {
    ["Name"] = [=[皮肤4]=],
    ["Tip"] = [=[奖励]=],
    ["Icon"] = [=[StarRail\star_5.tga]=],
    ["Condition"] = [=[解锁条件:]=],
    ["Value1"] = [=[Survival\Skin\4\1.mdx]=],
    ["Value2"] = [=[力量+1]=]
}
excel[705] = {
    ["Name"] = [=[皮肤5]=],
    ["Tip"] = [=[奖励]=],
    ["Icon"] = [=[StarRail\star_6.tga]=],
    ["Condition"] = [=[解锁条件:]=],
    ["Value1"] = [=[Survival\Skin\5\1.mdx]=],
    ["Value2"] = [=[力量+1]=]
}
excel[706] = {
    ["Name"] = [=[皮肤6]=],
    ["Tip"] = [=[奖励]=],
    ["Icon"] = [=[StarRail\star_7.tga]=],
    ["Condition"] = [=[解锁条件:]=],
    ["Value1"] = [=[Survival\Skin\6\1.mdx]=],
    ["Value2"] = [=[力量+1]=]
}

return excel