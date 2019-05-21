nrc.settings.default("regen_hp_limit", 0.9)
nrc.settings.default("regen_mp_limit", 0.5)

nrc.register_ready(function()
	local hp, mhp = you.hp()
	local mp, mmp = you.mp()
	if not you.regenerating() and nrc.you.castable("Regeneration") and (hp < mhp * nrc.settings.get("regen_hp_limit") or you.poisoned()) and mp >= mmp * nrc.settings.get("regen_mp_limit") and you.feel_safe() then
		nrc.you.cast("Regeneration")
	end
end)
