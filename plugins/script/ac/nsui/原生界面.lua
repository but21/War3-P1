local japi = require "jass.japi"
local dzapi = require "jass.dzapi"
local ns = ns

ysui = setmetatable({}, ns.ui)

--常量
--japi.DzFrameGetTopMessage()

ysui['游戏界面'] = ns.ui.add('panel', japi.DzGetGameUI())
ysui['小地图'] = ns.ui.add('panel', japi.DzFrameGetMinimap())
ysui['聊天消息'] = ns.ui.add('panel', japi.DzFrameGetChatMessage())
ysui['系统消息'] = ns.ui.add('panel', japi.DzFrameGetUnitMessage())
ysui['鼠标提示'] = ns.ui.add('panel', japi.DzFrameGetTooltip())

ysui['单位大头像'] = ns.ui.add('mdl', japi.DzFrameGetPortrait())

ysui['底层控件'] = ns.ui.add('panel', japi.FrameGetParent(japi.DzFrameGetPortrait()))

ysui['助手头像'] = ns.ui.add('panel', japi.FrameGetUnitButton())

ysui['技能栏'] = {}
for a = 0, 2 do
    for b = 0, 3 do
        table.insert(ysui['技能栏'], ns.ui.add('button', japi.DzFrameGetCommandBarButton(a, b)))
    end
end


ysui['物品栏'] = {}
for i = 1, 6 do
    table.insert(ysui['物品栏'], ns.ui.add('button', japi.DzFrameGetItemBarButton(i - 1)))
end
ysui['小地图按钮'] = {}
for i = 1, 5 do
    table.insert(ysui['小地图按钮'], ns.ui.add('button', japi.DzFrameGetMinimapButton(i - 1)))
end
ysui['英雄头像'] = {}
for i = 1, 7 do
    table.insert(ysui['英雄头像'], ns.ui.add('button', japi.DzFrameGetHeroBarButton(i - 1)))
end
ysui['英雄血条'] = {}
for i = 1, 7 do
    table.insert(ysui['英雄血条'], ns.ui.add('button', japi.DzFrameGetHeroHPBar(i - 1)))
end
ysui['英雄蓝条'] = {}
for i = 1, 7 do
    table.insert(ysui['英雄蓝条'], ns.ui.add('button', japi.DzFrameGetHeroManaBar(i - 1)))
end
ysui['系统按钮'] = {}

for i = 1, 4 do
    table.insert(ysui['系统按钮'], ns.ui.add('button', japi.DzFrameGetUpperButtonBarButton(i - 1)))
end


--原生界面-获取
ysui['物品提示'] = ns.ui.add('text', dzapi.DzSimpleFontStringFindByName("SimpleItemNameValue", 3))
ysui['物品说明'] = ns.ui.add('text', dzapi.DzSimpleFontStringFindByName("SimpleItemDescriptionValue", 3))

--单位面板
ysui['单位面板'] = {
    ['主要控件'] = ns.ui.add('panel', dzapi.DzSimpleFrameFindByName("SimpleInfoPanelIconDamage", 0)),
    ['单位属性'] = ns.ui.add('panel', dzapi.DzSimpleFrameFindByName('SimpleInfoPanelUnitDetail', 0)),

    ['英雄称谓'] = ns.ui.add('text', dzapi.DzSimpleFontStringFindByName("SimpleNameValue", 0) - 0xb4),
    ['单位名字'] = ns.ui.add('text', dzapi.DzSimpleFontStringFindByName("SimpleClassValue", 0)),

    ['经验条'] = ns.ui.add('panel', dzapi.DzSimpleFrameFindByName("SimpleHeroLevelBar", 0)),
    ['生命周期'] = ns.ui.add('panel', dzapi.DzSimpleFrameFindByName("SimpleProgressIndicator", 0)),

    ['主属性'] = {
        ['控件'] = ns.ui.add('panel', dzapi.DzSimpleFrameFindByName("SimpleInfoPanelIconHero", 6)),
        ['图标'] = ns.ui.add('image', dzapi.DzSimpleTextureFindByName("InfoPanelIconHeroIcon", 6)),
    },
    ['攻击'] = {
        ['图标'] = ns.ui.add('image', dzapi.DzSimpleTextureFindByName("InfoPanelIconBackdrop", 0)),
        ['名字'] = ns.ui.add('text', dzapi.DzSimpleFontStringFindByName("InfoPanelIconLabel", 0)),
        ['数值'] = ns.ui.add('text', dzapi.DzSimpleFontStringFindByName("InfoPanelIconValue", 0)),
    },
    ['护甲'] = {
        ['图标'] = ns.ui.add('image', dzapi.DzSimpleTextureFindByName("InfoPanelIconBackdrop", 2)),
        ['名字'] = ns.ui.add('text', dzapi.DzSimpleFontStringFindByName("InfoPanelIconLabel", 2)),
        ['数值'] = ns.ui.add('text', dzapi.DzSimpleFontStringFindByName("InfoPanelIconValue", 2)),
    },
    ['力量'] = {
        ['名字'] = ns.ui.add('text', dzapi.DzSimpleFontStringFindByName("InfoPanelIconHeroStrengthLabel", 6)),
        ['数值'] = ns.ui.add('text', dzapi.DzSimpleFontStringFindByName("InfoPanelIconHeroStrengthValue", 6)),
    },
    ['敏捷'] = {
        ['名字'] = ns.ui.add('text', dzapi.DzSimpleFontStringFindByName("InfoPanelIconHeroAgilityLabel", 6)),
        ['数值'] = ns.ui.add('text', dzapi.DzSimpleFontStringFindByName("InfoPanelIconHeroAgilityValue", 6)),
    },
    ['智力'] = {
        ['名字'] = ns.ui.add('text', dzapi.DzSimpleFontStringFindByName("InfoPanelIconHeroIntellectLabel", 6)),
        ['数值'] = ns.ui.add('text', dzapi.DzSimpleFontStringFindByName("InfoPanelIconHeroIntellectValue", 6)),
    },
}
--原生界面-BUFF
ysui['BUFF'] = {}
for i = 1, 8 do
    table.insert(ysui['BUFF'], ns.ui.add('button', japi.FrameGetBuffButton(i-1)))
end



--资源面板
ysui['资源面板'] = {
    ['主要控件'] = ns.ui.add('panel', dzapi.DzSimpleFrameFindByName("ResourceBarFrame", 0)),
    --黄金数值
    ns.ui.add('text', dzapi.DzSimpleFontStringFindByName("ResourceBarGoldText", 0)),
    --['木材数值']
    ns.ui.add('text', dzapi.DzSimpleFontStringFindByName("ResourceBarLumberText", 0)),
    --['人口数值']
    ns.ui.add('text', dzapi.DzSimpleFontStringFindByName("ResourceBarSupplyText", 0)),
    --['修理数值']
    ns.ui.add('text', dzapi.DzSimpleFontStringFindByName("ResourceBarUpkeepText", 0)),
}


--载入原生
gameui = ysui['游戏界面']
ns.gameui = ysui['游戏界面']

--gameui = ns.gameui
