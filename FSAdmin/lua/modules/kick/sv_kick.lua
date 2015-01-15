local function fs_kick(Player, Cmd, Args)
	if not Player:IsTrialModerator() then return end
	if Args[1] == nil || Args[2] == nil then Player:ChatPrint("You need to specify a target and reason!") return end
	local target = fs_FindPlayer(Args[1])
	if not IsValid(target) then Player:ChatPrint("No target found!") return end
	if(target) == nil then Player:ChatPrint("No target found!") return end
	
	target:Kick(Args[2])
	Player:ChatPrint("Kicked: " .. target:Nick())
end
concommand.Add("fs_kick", fs_kick)