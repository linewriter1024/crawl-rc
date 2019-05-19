nrc.register_ready(function()
	local hp, mhp = you.hp()
	if not you.regenerating() and nrc.you.castable("Regeneration") and hp < mhp * 0.9 and you.feel_safe() then
		nrc.you.cast("Regeneration")
	end
end)
