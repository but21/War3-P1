local moduleName = {
	"Probability", "EnemyValue", "Others", "BlackMarket", "SeizeBody", "Archive", "Roster", "Card", "BondList", "Treasure", "Equip", "GoldStudy" }
for _, value in ipairs(moduleName) do
	pcall(require, "dataExcel." .. value)
end
