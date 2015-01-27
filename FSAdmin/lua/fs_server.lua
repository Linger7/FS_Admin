require("tmysql4");

include("fs_sv_ranks.lua")
include("fs_shared.lua")

AddCSLuaFile("fs_client.lua")
AddCSLuaFile("fs_shared.lua")
AddCSLuaFile("fs_cl_ranks.lua")

//Include Modules
local fol = "modules/"
local files, folders = file.Find(fol .. "*", "LUA")
for k,v in pairs(files) do
	include(fol .. v)
end

for _, folder in SortedPairs(folders, true) do
	if folder == "." or folder == ".." then continue end

	for _, File in SortedPairs(file.Find(fol .. folder .."/sh_*.lua", "LUA"), true) do
		AddCSLuaFile(fol..folder .. "/" ..File)
		include(fol.. folder .. "/" ..File)
	end
	for _, File in SortedPairs(file.Find(fol .. folder .."/sv_*.lua", "LUA"), true) do
		include(fol.. folder .. "/" ..File)
	end

	for _, File in SortedPairs(file.Find(fol .. folder .."/cl_*.lua", "LUA"), true) do
		AddCSLuaFile(fol.. folder .. "/" ..File)
	end
end

local function initializeDB()
	FS_Admin_DB()
end
hook.Add("InitPostEntity", "DarkRP_LoadFonts", initializeDB)

local function fs_PlayerInitialSpawn( Player )
	fs_SetPlayerVariable(Player, "FS_Rank", 17)
	fs_SetPlayerRank(Player)
end
hook.Add("PlayerInitialSpawn", "fs_PlayerInitialSpawn", fs_PlayerInitialSpawn)