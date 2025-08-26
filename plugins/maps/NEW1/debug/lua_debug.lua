print("\n------------------lua - debug------------------")


--[[
    (只有副职业为换装备的玩家才能进行抽奖, 其他玩家只能继续叠层数, 且没有额外奖励)

    特殊字符:    ※    ★

    颜色字符串:	|cff00f5a4	|cfff43232	|cff00f51d	|cff00acf5	|cffc400f5 |cff04ffee |cffff8604
				|cff11924b |cffacb71a |cffaaaaaa  |cffdfc497
				
    装备技能颜色:|cffffffff  |cff00ff00	|cff00ffff	|cffd400ff	|cffff0000	|cfaffff00
    装备品质: 破旧, 普通, 优秀, 秘银, 精金, 陨铁, 星云, 龙骨, 永恒

    技能品质: 基础, 精通, 奥术, 秘传, 龙语, 神圣, 禁忌

	标题: |cff73FFFE
	数值: |cffC9E750
	消耗: |cffFF6E21
	备注: |cff696E6E
	文本: |cffB4C4E2
]]
-- 取余(实数)


-- 文件名用小写加下划线（如 attr_system.lua）。
-- 全局变量(少用), 函数和模块名用驼峰式（如 AttrSystem）。
-- 局部变量用小写驼峰式，私有加下划线前缀（如 _privateFunc）。
-- 常量全大写加下划线（如 MAX_LEVEL）。
-- 模块引用使用小写驼峰式局部变量

