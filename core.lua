local greyout = CreateFrame("Frame");

function greyout:GreyOutAction()
	local name = self:GetName();
	local action = self.action;
	local Icon = _G[name.."Icon"];
	local start, duration, _ = GetActionCooldown(action);

	if ( duration >= 1.5 ) then
	    Icon:SetDesaturated(true);
	else
		Icon:SetDesaturated(false);
	end;
end;

hooksecurefunc("ActionButton_OnUpdate", greyout.GreyOutAction);