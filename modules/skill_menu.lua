-- Display skill menu on game start.
nrc.register_ready_start(function()
	-- If you select your skills or have random skills.
	if nrc.features.you_select_skills or you.class() == "Wanderer" then
		crawl.sendkeys("m")
	end
end)
