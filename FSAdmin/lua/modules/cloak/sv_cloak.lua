local function fs_cloak(Player, Cmd, Args)
	if not Player:IsTrialModerator() then return end
	if Args[1] == nil then Player:ChatPrint("No arguement!") return end
	local target = fs_FindPlayer(Args[1])
	if not IsValid(target) then Player:ChatPrint("No target found!") return end
	if(target) == nil then Player:ChatPrint("No target found!") return end
	
	target:SetNoDraw(true)
	Player:ChatPrint("Cloaked: " .. target:Nick())
end
concommand.Add("fs_cloak", fs_cloak)

local function fs_uncloak(Player, Cmd, Args)
	if not Player:IsTrialModerator() then return end
	if Args[1] == nil then Player:ChatPrint("No arguement!") return end
	local target = fs_FindPlayer(Args[1])
	if not IsValid(target) then Player:ChatPrint("No target found!") return end
	if(target) == nil then Player:ChatPrint("No target found!") return end
	
	target:SetNoDraw(false)
	Player:ChatPrint("Uncloaked: " .. target:Nick())
end
concommand.Add("fs_uncloak", fs_uncloak)