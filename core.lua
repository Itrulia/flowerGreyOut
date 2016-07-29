local frame = CreateFrame("Frame")
frame.timer = 0;

function greyOut(button)
	local name = button:GetName();
	local action = button.action;
	local Icon = _G[name.."Icon"];
	local start, duration, _ = GetActionCooldown(action);

	if ( duration >= 1.5 ) then
	    Icon:SetDesaturated(true);
	else
		Icon:SetDesaturated(false);
	end;
end;

function onUpdate(self, elapsed)
  	self.timer = self.timer + elapsed; -- throtteling

	if self.timer >= 0.1 then
		for i=1, 12 do
			local button = _G["ActionButton"..i];
			greyOut(button);

			button = _G["MultiBarBottomLeftButton"..i];
			greyOut(button);

			button = _G["MultiBarBottomRightButton"..i];
			greyOut(button);

			button = _G["MultiBarRightButton"..i];
			greyOut(button);

			button = _G["MultiBarLeftButton"..i];
			greyOut(button);

			last = 0;
		end
	end
end;

frame:HookScript("OnUpdate", onUpdate);