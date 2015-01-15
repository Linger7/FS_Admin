if (SERVER) then
	include("fs_server.lua")
elseif (CLIENT) then
	include("fs_client.lua")
end