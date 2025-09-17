--i need bitch

--设置常用文件
local jass = Jass
local japi = require "jass.japi"
  

--获取帧数/变速
function ns.get_mzhz(jsd)
    jsd = jsd or 1.00
    return (1.00*jsd)/japi.GetFps()
end

ns.mrzt = [[fonts\fonts.ttf]]

ns.gaoguang=[[UI\ui_White.tga]]
ns.antubiao=[[UI\ui_black.tga]]

--初始化一些东西
function kaishi.zbsc()
 
end

--按钮声音
ns.anniusheng=jass.CreateSound("Sound\\Interface\\MouseClick1.wav", false, false, false, 10, 10, "")
jass.SetSoundParamsFromLabel(ns.anniusheng, "InterfaceClick")
jass.SetSoundDuration(ns.anniusheng, 239)