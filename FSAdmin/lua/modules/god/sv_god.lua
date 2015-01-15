local function fs_god(Player, Cmd, Args)
	if not Player:IsTrialModerator() then return end
	if Args[1] == nil then Player:ChatPrint("No arguement!") return end
	local target = fs_FindPlayer(Args[1])
	if not IsValid(target) then Player:ChatPrint("No target found!") return end
	if(target) == nil then Player:ChatPrint("No target found!") return end
	
	target:GodEnable()
	Player:ChatPrint("God Moded: " .. target:Nick())
end
concommand.Add("fs_god", fs_god)

local function fs_ungod(Player, Cmd, Args)
	if not Player:IsTrialModerator() then return end
	if Args[1] == nil then Player:ChatPrint("No arguement!") return end
	local target = fs_FindPlayer(Args[1])
	if not IsValid(target) then Player:ChatPrint("No target found!") return end
	if(target) == nil then Player:ChatPrint("No target found!") return end
	
	target:GodDisable()
	Player:ChatPrint("UnGoded: " .. target:Nick())
end
concommand.Add("fs_ungod", fs_ungod)