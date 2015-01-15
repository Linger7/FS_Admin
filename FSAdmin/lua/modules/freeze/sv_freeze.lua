local function fs_freeze(Player, Cmd, Args)
	if not Player:IsTrialModerator() then return end
	if Args[1] == nil then Player:ChatPrint("No arguement!") return end
	local target = fs_FindPlayer(Args[1])
	if not IsValid(target) then Player:ChatPrint("No target found!") return end
	if(target) == nil then Player:ChatPrint("No target found!") return end
	
	target:Freeze(true)
	Player:ChatPrint("Froze: " .. target:Nick())
end
concommand.Add("fs_freeze", fs_freeze)

local function fs_unfreeze(Player, Cmd, Args)
	if not Player:IsTrialModerator() then return end
	if Args[1] == nil then Player:ChatPrint("No arguement!") return end
	local target = fs_FindPlayer(Args[1])
	if not IsValid(target) then Player:ChatPrint("No target found!") return end
	if(target) == nil then Player:ChatPrint("No target found!") return end
	
	target:Freeze(false)
	Player:ChatPrint("UnFroze: " .. target:Nick())
end
concommand.Add("fs_unfreeze", fs_unfreeze)