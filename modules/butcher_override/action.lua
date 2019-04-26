function butcher_override()
	-- Two-state vampires.
	-- Idea derived from kitchen_ace: https://crawl.develz.org/tavern/viewtopic.php?p=338233#p338233
	if nrc.check_version(0, 24) and you.race() == "Vampire" then
		if you.hunger_name() == "alive" then
			crawl.sendkeys("af")
		else
			crawl.sendkeys("ag")
		end
	-- If no special option, just butcher as usual.
	else
		crawl.do_commands{"CMD_BUTCHER"}
	end
end
