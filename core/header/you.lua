nrc.you = {}

function nrc.you.starving()
	return you.hunger_name and (you.hunger_name() == "starving" or you.hunger_name() == "fainting")
end

function nrc.you.castable(spell, fail)
	return (
		-- Normally castable?
		spells.memorised(spell)
		and you.mp() >= spells.mana_cost(spell)
		-- Penalized?
		and not spells.god_hates(spell)
		and spells.fail_severity(spell) <= (fail or 0)
		-- Statuses.
		and not you.confused()
		and not you.paralysed()
		and not you.berserk()
		and not you.silenced()
		and not nrc.you.starving()
		-- Actions.
		and not you.turn_is_over()
		and not you.taking_stairs()
	)
end

function nrc.you.cast(spell, force)
	crawl.sendkeys(crawl.get_command(force and "CMD_FORCE_CAST_SPELL" or "CMD_CAST_SPELL"), spells.letter(spell))
end