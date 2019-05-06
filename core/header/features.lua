local f = {}
nrc.features = f

-- Shortcuts.
local v = nrc.check_version

-- Two-state vampires.
f.two_state_vampires = you.ability_table().f == "Exsanguinate"
-- Old multi-state vampires with blood potions.
f.blood_vampires = not f.two_state_vampires
