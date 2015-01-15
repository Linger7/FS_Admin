concommand.Add("gm_giveswep", function(Player, Cmd, Args)
	if Args[1] == nil then return end
	local swep = weapons.GetStored(Args[1])
	if (swep == nil) then return end
	
	if not Player:IsDivisionDirector() then return end
	
	Player:Give(swep.ClassName)
	Player:SelectWeapon(swep.ClassName)
end)

concommand.Add("gm_spawnswep", function(Player, Cmd, Args)
	if Args[1] == nil then return end
	local swep = weapons.GetStored(Args[1])
	if (swep == nil) then return end
	
	if not Player:IsDivisionDirector() then return end
	
	local tr = Player:GetEyeTraceNoCursor() 
	if ( !tr.Hit ) then return end 

	local entity = ents.Create( swep.ClassName ) 
	if ( IsValid( entity ) ) then 
		entity:SetPos( tr.HitPos + tr.HitNormal * 32 ) 
		entity:Spawn() 
	end 				
end)