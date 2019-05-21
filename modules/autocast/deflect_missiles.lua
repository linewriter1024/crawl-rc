nrc.settings.default("dmsl_mp_limit", 0.75)

nrc.register_ready(function()
	local hp, mhp = you.hp()
	local mp, mmp = you.mp()
	if not you.status("deflect missiles") and nrc.you.castable("Deflect Missiles") and mp >= mmp * nrc.settings.get("dmsl_mp_limit") and you.feel_safe() then
		nrc.you.cast("Deflect Missiles")
	end
end)
