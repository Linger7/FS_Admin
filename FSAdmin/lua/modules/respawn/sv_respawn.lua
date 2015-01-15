local function fs_Kill(Player, Cmd, Args)
	if not Player:IsTrialModerator() then return end
	if Args[1] == nil then Player:ChatPrint("No arguement!") return end
	local target = fs_FindPlayer(Args[1])
	if not IsValid(target) then Player:ChatPrint("No target found!") return end
	if(target) == nil then Player:ChatPrint("No target found!") return end
	
	target:Kill()
	Player:ChatPrint("Killed: " .. target:Nick())
end
concommand.Add("fs_kill", fs_Kill)

local function fs_Respawn(Player, Cmd, Args)
	if not Player:IsTrialModerator() then return end
	if Args[1] == nil then Player:ChatPrint("No arguement!") return end
	local target = fs_FindPlayer(Args[1])
	if not IsValid(target) then Player:ChatPrint("No target found!") return end
	if(target) == nil then Player:ChatPrint("No target found!") return end
	
	target:Spawn()
	Player:ChatPrint("Respawned: " .. target:Nick())
end
concommand.Add("fs_Respawn", fs_Respawn)
