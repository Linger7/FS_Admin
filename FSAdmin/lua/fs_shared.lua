//Administration Ranks
local fs_Owner = 1
local fs_CommunityPresident = 2
local fs_CommunityManager = 3
local fs_DivisionDirector = 4
local fs_Administrator = 5
local fs_SeniorModerator = 6
local fs_Moderator = 7
local fs_TrialModerator = 8

//VIP Ranks
local fs_CommunitySupporter = 9
local fs_DeluxeMember = 10
local fs_GoldMember = 11
local fs_DiamondMember = 12
local fs_PlatinumMember = 13
local fs_PremiumMember = 14
local fs_AdvancedMember = 15
local fs_BasicMember = 16

//Normal Users
local fs_Guest = 17

local meta = FindMetaTable("Player")

//Taken from DarkRP
function fs_FindPlayer(Data)
	if not Data or Data == "" then return nil end
	local players = player.GetAll()

	for k = 1, #players do
		local v = players[k]
		if tonumber(Data) == v:UserID() then
			return v
		end

		if Data == v:SteamID() then
			return v
		end

		if string.find(string.lower(v:Nick()), string.lower(tostring(Data)), 1, true) ~= nil then
			return v
		end

		if string.find(string.lower(v:Name()), string.lower(tostring(Data)), 1, true) ~= nil then
			return v
		end
	end
	return nil
end

function meta:GetLevel()
	return self.Vars["FS_Rank"]
end

function meta:IsOwner()
	if self.Vars == nil or self.Vars["FS_Rank"] == nil then return false end
	return self.Vars["FS_Rank"] <= 1;
end

function meta:IsCommunityPresident()
	if self.Vars == nil or self.Vars["FS_Rank"] == nil then return false end
	return self.Vars["FS_Rank"] <= 2;
end

function meta:IsCommunityManager()
	if self.Vars == nil or self.Vars["FS_Rank"] == nil then return false end
	return self.Vars["FS_Rank"] <= 3;
end

function meta:IsDivisionDirector()
	if self.Vars == nil or self.Vars["FS_Rank"] == nil then return false end
	return self.Vars["FS_Rank"] <= 4;
end

function meta:IsAdministrator()
	if self.Vars == nil or self.Vars["FS_Rank"] == nil then return false end
	return self.Vars["FS_Rank"] <= 5;
end

function meta:IsSeniorModerator()
	if self.Vars == nil or self.Vars["FS_Rank"] == nil then return false end
	return self.Vars["FS_Rank"] <= 6;
end

function meta:IsModerator()
	if self.Vars == nil or self.Vars["FS_Rank"] == nil then return false end
	return self.Vars["FS_Rank"] <= 7;
end

function meta:IsTrialModerator()
	if self.Vars == nil or self.Vars["FS_Rank"] == nil then return false end
	return self.Vars["FS_Rank"] <= 8;
end

function meta:IsSupporter()
	if self.Vars == nil or self.Vars["FS_Rank"] == nil then return false end
	return self.Vars["FS_Rank"] <= 9;
end

function meta:IsDeluxeMember()
	if self.Vars == nil or self.Vars["FS_Rank"] == nil then return false end
	return self.Vars["FS_Rank"] <= 10;
end

function meta:IsGoldMember()
	if self.Vars == nil or self.Vars["FS_Rank"] == nil then return false end
	return self.Vars["FS_Rank"] <= 11;
end

function meta:IsDiamondMember()
	if self.Vars == nil or self.Vars["FS_Rank"] == nil then return false end
	return self.Vars["FS_Rank"] <= 12;
end

function meta:IsPlatinumMember()
	if self.Vars == nil or self.Vars["FS_Rank"] == nil then return false end
	return self.Vars["FS_Rank"] <= 13;
end

function meta:IsPremiumMember()
	if self.Vars == nil or self.Vars["FS_Rank"] == nil then return false end
	return self.Vars["FS_Rank"] <= 14;
end

function meta:IsAdvancedMember()
	if self.Vars == nil or self.Vars["FS_Rank"] == nil then return false end
	return self.Vars["FS_Rank"] <= 15;
end

function meta:IsBasicMember()
	if self.Vars == nil or self.Vars["FS_Rank"] == nil then return false end
	return self.Vars["FS_Rank"] <= 16;
end

function meta:IsVIP()
	return self:IsBasicMember()
end

//Older functions
function meta:IsSuperAdmin()
	return self:IsAdministrator()
end

function meta:IsAdmin()
	return self:IsTrialModerator()
end

function meta:IsDVL()
	return self:IsDivisionDirector()
end