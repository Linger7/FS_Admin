local function fs_teamChange(Player, Cmd, Args)
	if not Player:IsTrialModerator() then return end
	if Args[1] == nil or Args[2] == nil then Player:ChatPrint("You need to enter a target and team number!") return end
	
	local target = fs_FindPlayer(Args[1])
	if not IsValid(target) then Player:ChatPrint("No target found!") return end
	if(target) == nil then Player:ChatPrint("No target found!") return end
	
	local teamNum = tonumber(Args[2]) or 1
	
	target:ChangeTeam2(teamNum)
	Player:ChatPrint("Changed Team: " .. target:Nick())
end
concommand.Add("fs_teamChange", fs_teamChange)