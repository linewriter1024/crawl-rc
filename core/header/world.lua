nrc.world = {}

function nrc.world.has_skeleton(x, y)
	for _,v in ipairs(items.get_items_at(x, y) or {}) do
		if v.has_skeleton then
			return true
		end
	end
	return false
end
