nrc.ready_f = {}
function nrc.register_ready(f)
	table.insert(nrc.ready_f, f)
end

nrc.ready_start_f = {}
function nrc.register_ready_start(f)
	table.insert(nrc.ready_start_f, f)
end

local fired = false
nrc.register_ready(function()
	if you.turns() == 0 and not fired then
		fired = true
		for _,v in ipairs(nrc.ready_start_f) do
			v()
		end
	end
end)
