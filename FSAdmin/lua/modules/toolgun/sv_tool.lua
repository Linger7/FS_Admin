local allowedTools = {
	"remover",
	"textscreen",
}
local vipTools = {
	"remover",
	"textscreen",
	"material",
	"nocollide",
}
hook.Add("CanTool", "FS_ToolCheck", function(Player, Trace, Mode)
	if not Player:IsVIP() then
		local found = false
		for k=1, #allowedTools do
			if(Mode == allowedTools[k]) then
				found = true
			end
		end
		if (found == false) then
			return false
		end
	else
		local found = false
		for k=1, #vipTools do
			if(Mode == vipTools[k]) then
				found = true
			end
		end
		if (found == false) then
			return false
		end
	end
end)