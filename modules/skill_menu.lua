-- Display skill menu on game start.
nrc.register_ready_start(function()
	if nrc.features.you_select_skills then
		crawl.sendkeys("m")
	end
end)
