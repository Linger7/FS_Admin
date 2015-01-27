//Insert your database information into the variables below
local fs_DBHost = "";	//Database Host IP/Domain Name/local host
local fs_DBUserName = "";	//Database Username
local fs_Password = "";	//Database Password
local fs_DBName = "";	//Database Name

local FS_Database = tmysql.initialize(fs_DBHost, fs_DBUserName, fs_Password, fs_DBName, "3306")

function FS_Admin_DB()
	FS_Database:Query( "CREATE TABLE IF NOT EXISTS fs_adminTable(packageid INTEGER(4) NOT NULL, user_steamid VARCHAR(25) NOT NULL)", fs_FindPlayerRank, 1, Player)
end

local function fs_FindPlayerRank(Player, results, status, error)
	if not IsValid(Player) then return end
	if(results[1].status) then
		//PrintTable(results)
	else
		ErrorNoHalt( error )
		fs_SetPlayerRank(Player, 17)
		return
	end
	if(results and results[1]) then
		//PrintTable(results[1].data)
		local rank = 17
		if results[1].data[1] then
			rank = results[1].data[1].packageid
			for k, v in pairs(results[1].data) do
				if(v.packageid > rank) then
					rank = v.packageid;
				end
			end
		end

		fs_SetPlayerRank(Player, rank)
	else
		fs_SetPlayerRank(Player, 17)
	end
end

local function fs_isValidValue(Value)
	if(Value == nil) then return false end
	Value = tonumber(Value)
	return(Value >= 1 and Value <= 17)
end

util.AddNetworkString("fs_SetPlayerRank")
function fs_SetPlayerVariable(Player, varName, newValue)
	if not IsValid(Player) then return end
	Player.Vars = Player.Vars or {}
	
	//Set the serverside Player Variable
	Player.Vars[varName] = tonumber(newValue)
	
	//Start a net message to set the clientside Player variable
	net.Start("fs_SetPlayerRank")
		net.WriteUInt(Player:UserID(), 16)
		net.WriteString(varName)
		net.WriteInt(newValue, 7)
	net.Broadcast()
	
end

util.AddNetworkString("fs_SendPlayerVariables")
concommand.Add("sendPlayerVariables", function(Player)
	if Player.SPV and Player.SPV > (CurTime() - 3) then return end -- prevent spammers
	Player.SPV = CurTime()
	local players = player.GetAll()
	net.Start("fs_SendPlayerVariables")
		net.WriteUInt(#players, 16)
		for k,v in pairs(players) do
			//if v != Player then
			if v.Vars then
				local rank = v.Vars["FS_Rank"];
				if rank == nil then
					rank = 17
				end
			
				net.WriteUInt(v:UserID(), 16)
				net.WriteString("FS_Rank")
				net.WriteInt(rank, 7)
			end
			//end
		end
	net.Send(Player)
end)

function fs_SetPlayerRank(Player, Value)
	if not IsValid(Player) then return end
	if (Value == nil) then
		FS_Database:Query( "SELECT packageid FROM fs_adminTable WHERE packageid < 9 AND user_steamid=\'" .. Player:SteamID() .. "\';", fs_FindPlayerRank, 1, Player)
		return
	end
	
	local Value2 = Value;
	//print("Value = " .. Value2);
	if not (fs_isValidValue(Value)) then return end
		
	fs_SetPlayerVariable(Player, "FS_Rank", Value)
end
//concommand.Add("dev", fs_SetPlayerRank)

function fs_GetPlayerRank(Player)
	if not IsValid(Player) then return end
	return Player.Vars["FS_Rank"];
end

local function onPOGAdd(Player, results, status, error)
	if(results[1].status) then
		print("Successfully added this STEAMID")
		Msg("Successfully added this STEAMID")
	else
		ErrorNoHalt( error )
		print("Error with this operation!")
		Msg("Error with this operation!")
	end
end

local function onPOGRemove(results, status, error)
	if(results[1].status) then
		print("Successfully removed this STEAMID")
		Msg("Successfully removed this STEAMID")
	else
		ErrorNoHalt( error )
		print("Error with this operation!")
		Msg("Error with this operation!")
	end
end

concommand.Add("pog_add", function(Player, cmd, args, fullstring)
	if Player:IsPlayer() and IsValid(Player) then
		if Player:IsDivisionDirector() then
			if(args[1] || args[2]) == nil then
				Player:ChatPrint("You need to enter a STEAMID and a rank Number between 2-8")
				return
			end
			local realText = string.Explode(" ", fullstring)

			local num = tonumber(realText[2])
			if (num > 8 || num < 2) then
				Player:ChatPrint("You need to enter a rank number between 2-8")
				return
			end
			
			if (!file.Exists("pogadd.txt", "DATA")) then file.Write("pogadd.txt", "") end 
			file.Append("pogadd.txt", tostring( os.date() ) .. "  " .. Player:Nick() .. " - " .. Player:SteamID() .. " ran this command: " .. fullstring .. "\n")

			FS_Database:Query( "REPLACE INTO fs_adminTable VALUES(".. SQLStr(realText[2]) .. ",".. SQLStr(realText[1]).. ");", onPOGAdd, 1, Player)
		end
	else
		if(args[1] || args[2]) == nil then
			print("You need to enter a STEAMID and a rank Number between 2-8")
			Msg("You need to enter a STEAMID and a rank Number between 2-8")
			return
		end
		
		local realText = string.Explode(" ", fullstring)
		
		local num = tonumber(realText[2])
		if (num > 8 || num < 2) then
			print("You need to enter a rank number between 2-8")
			Msg("You need to enter a rank number between 2-8")
			return
		end
	
		FS_Database:Query( "REPLACE INTO fs_adminTable VALUES(".. SQLStr(realText[2]) .. ",".. SQLStr(realText[1]).. ");", onPOGAdd, 1)
	end
end)

concommand.Add("pog_remove", function(Player, cmd, args, fullstring)
	print(SQLStr(fullstring, true))
	if Player:IsPlayer() and IsValid(Player) then
		if Player:IsDivisionDirector() then
			if(args[1]) == nil then
				Player:ChatPrint("You need to enter a STEAMID")
				return
			end
			
			if (!file.Exists("pogadd.txt", "DATA")) then file.Write("pogadd.txt", "") end 
			file.Append("pogadd.txt", tostring( os.date() ) .. "  " .. Player:Nick() .. " - " .. Player:SteamID() .. " ran this command: " .. fullstring .. "\n")
			
			FS_Database:Query( "DELETE FROM fs_adminTable WHERE user_steamid =\'" .. SQLStr(fullstring, true).. "\';", onPOGRemove, 1)
		end
	else
		if(args[1]) == nil then
			print("You need to enter a STEAMID")
			Msg("You need to enter a STEAMID")
			return
		end
	
		FS_Database:Query( "DELETE FROM fs_adminTable WHERE user_steamid =\'" .. SQLStr(fullstring, true).. "\';", onPOGRemove, 1)
	end	
end)