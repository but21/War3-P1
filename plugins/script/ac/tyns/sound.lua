local jass = require "jass.common"

 

ns.sound={}

--local "Sound\\Interface\\MouseClick1.wav"

--添加声音
function ns.addsound(text)
    local sound = jass.CreateSound(text, false, false, false, 10, 10, "")
end



