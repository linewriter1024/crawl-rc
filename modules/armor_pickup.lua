local slots = {
	cloak = "Cloak",
	helmet = "Helmet",
	gloves = "Gloves",
	boots = "Boots",
}

add_autopickup_func(function(it, name)
	if it.class(true) ~= "armour" then return nil end
	if it.is_useless then return nil end

	local sub = it.subtype()
	if not slots[sub] then return nil end

	if sub == "gloves" and you.has_claws() > 0 then return nil end

	local eq = items.equipped_at(slots[sub])
	return not eq
end)
