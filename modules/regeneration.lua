-- Start regeneration when (hp < mhp * X).
nrc.settings.default("regen_hp_limit", 0.9)
-- Don't regenerate unless (mp > mmp * X).
nrc.settings.default("regen_mp_limit", 0.5)

-- Cast regeneration when necessary and it wouldn't use too much mp or turns.
nrc.register_ready(function()
	local hp, mhp = you.hp()
	local mp, mmp = you.mp()
	if not you.regenerating() and nrc.you.castable("Regeneration") and hp < mhp * nrc.settings.get("regen_hp_limit") and mp >= mmp * nrc.settings.get("regen_mp_limit") and you.feel_safe() then
		nrc.you.cast("Regeneration")
	end
end)
