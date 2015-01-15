local function fs_TeleportPlayer(Player, Cmd, Args)
	if not Player:IsTrialModerator() then return end
	if Args[1] == nil then Player:ChatPrint("No arguement!") return end
	local target = fs_FindPlayer(Args[1])
	if not IsValid(target) then Player:ChatPrint("No target found!") return end
	if(target) == nil then Player:ChatPrint("No target found!") return end
	
	local trace = {}
		trace.start = Player:GetShootPos()
		trace.endpos = Player:GetShootPos() + Player:GetAimVector() * 99999999999
		trace.filter = Player
	local line = util.TraceLine( trace ) 
		target:SetPos( line.HitPos + line.HitNormal * Vector( 35, 35, 1 ) )
		target:SetLocalVelocity( Vector( 0, 0, 0 ) )
	Player:ChatPrint("Teleported: " .. target:Nick())
end
concommand.Add("fs_TeleportPlayer", fs_TeleportPlayer)

local function fs_GoToPlayer(Player, Cmd, Args)
	if not Player:IsTrialModerator() then return end
	if Args[1] == nil then Player:ChatPrint("No arguement!") return end
	local target = fs_FindPlayer(Args[1])
	if not IsValid(target) then Player:ChatPrint("No target found!") return end
	if(target) == nil then Player:ChatPrint("No target found!") return end
	
	if Player:GetMoveType() == MOVETYPE_NOCLIP then
		Player:SetPos( target:GetPos() + target:GetForward() * 50 )
				return
		end
		if Player:InVehicle() then
			Player:ExitVehicle()
		end
		if !Player:Alive() then
			return
		end

		local pos = {}
		for i = 1, 360 do table.insert( pos, target:GetPos() + Vector( math.sin( i ) * 50, math.cos( i ) * 50, 37 ) ) end
			table.insert( pos, target:GetPos() + Vector( 0, 0, 112 ) )
				for k,v in pairs( pos ) do
					local trace = {}
					trace.start = v
					trace.endpos = v 
					trace.mins = Vector( -25, -25, -37 )
					trace.maxs = Vector( 25, 25, 37 )
					local hull = util.TraceHull( trace )

					if !hull.Hit then
						Player:SetPos( v - Vector( 0, 0, 37 ) )
						Player:SetLocalVelocity( Vector( 0, 0, 0 ) )
						Player:SetEyeAngles( ( target:GetShootPos() - Player:GetShootPos() ):Angle() )
						return
					end
				end
	Player:ChatPrint("Went to: " .. target:Nick())
end
concommand.Add("fs_GoToPlayer", fs_GoToPlayer)

local function fs_Bring(Player, Cmd, Args)
	if not Player:IsTrialModerator() then return end
	if Args[1] == nil then Player:ChatPrint("No arguement!") return end
	local target = fs_FindPlayer(Args[1])
	if not IsValid(target) then Player:ChatPrint("No target found!") return end
	if(target) == nil then Player:ChatPrint("No target found!") return end
	
	if target:GetMoveType() == MOVETYPE_NOCLIP then
		target:SetPos( Player:GetPos() + Player:GetForward() * 50 )
		return
	end
	if target:InVehicle() then
		target:ExitVehicle()
	end
	if !target:Alive() then
		return
	end
		local pos = {}
				for i = 1, 360 do table.insert( pos, Player:GetPos() + Vector( math.sin( i ) * 35, math.cos( i ) * 35, 37 ) ) end
				table.insert( pos, Player:GetPos() + Vector( 0, 0, 112 ) )

				for k,v in pairs( pos ) do
					local trace = {}
					trace.start = v
					trace.endpos = v 
					trace.mins = Vector( -16, -16, -36 )
					trace.maxs = Vector( 16, 16, 36 )
					local hull = util.TraceHull( trace )

					if !hull.Hit then
						target:SetPos( v - Vector( 0, 0, 37 ) )
						target:SetLocalVelocity( Vector( 0, 0, 0 ) )
						target:SetEyeAngles( ( Player:GetShootPos() - target:GetShootPos() ):Angle() )
						return
					end
				end
	Player:ChatPrint("Brought: " .. target:Nick())
end
concommand.Add("fs_Bring", fs_Bring)