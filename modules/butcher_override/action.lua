function butcher_override()
	-- Animate skeleton.
	if nrc.you.castable("Animate Skeleton") and nrc.world.has_skeleton(0, 0) then
		nrc.you.cast("Animate Skeleton")
	-- If no special option, just butcher as usual.
	elseif nrc.features.hunger_exists then
		crawl.do_commands{"CMD_BUTCHER"}
	end
end
