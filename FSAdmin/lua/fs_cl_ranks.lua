local function RetrievePlayerVar(userID, varName, newValue, tries)
	local ply = Player(userID);

	if not IsValid(ply) then
		if (tries or 0) >= 5 then return end
		//print("Not Valid")
		timer.Simple(0.5, function() RetrievePlayerVar(userID, varName, newValue, (tries or 0) + 1) end)
		return
	end
	
	ply.Vars = ply.Vars or {};

	ply.Vars[varName] = newValue

end

net.Receive("fs_SetPlayerRank", function()
	local userID = net.ReadUInt(16);
	local varName = net.ReadString()
	local newValue = net.ReadInt(7)

	RetrievePlayerVar(userID, varName, newValue)
end)

net.Receive("fs_SendPlayerVariables", function()
	local playerCount = net.ReadInt(16)
	
	for i = 1, playerCount, 1 do
		local userID = net.ReadUInt(16)
		local varName = net.ReadString()
		local newValue = net.ReadInt(7)
		
		RetrievePlayerVar(userID, varName, newValue)
	end
end)
timer.Simple(0, function()
	RunConsoleCommand("sendPlayerVariables")
end)
timer.Simple(60, function()
	RunConsoleCommand("sendPlayerVariables")
end)

timer.Create("FS_Check", 30, 0, function()
	for k,v in pairs(player.GetAll()) do
		if v.Vars != nil then 
			if v.Vars["FS_Rank"] then continue end
		end

		RunConsoleCommand("sendPlayerVariables")
		return
	end

	timer.Destroy("FS_Check")
end)