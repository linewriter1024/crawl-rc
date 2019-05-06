local f = {}
nrc.features = f

local v = nrc.check_version

f.two_state_vampires = you.ability_table().f == "Exsanguinate"
f.blood_vampires = not f.two_state_vampires
