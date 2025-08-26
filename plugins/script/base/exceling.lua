--#载入excel

-- local N = 30 -- 假设你想尝试加载的模块数量
-- for i = 1, N do
--     local moduleName = "excel" .. i
--     local status, module = pcall(require, moduleName)
--     if status then
--         --print("Module loaded:", moduleName)
--         -- 这里可以使用模块
--     else
--         --print("Module not found:", moduleName)
--     end
-- end
local moduleName = {
	"Probability", "EnemyValue", "Others", "BlackMarket", "SeizeBody", "Archive", "Roster", "Card", "BondList", "Treasure", "Equip", "GoldStudy" }
for _, value in ipairs(moduleName) do
	pcall(require, value)
end
