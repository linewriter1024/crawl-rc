local f = {}
nrc.features = f

-- Shortcuts.
local v = nrc.check_version

-- The hunger mechanic exists.
f.hunger_exists = not not you.hunger_name

-- You are a two-state vampire.
f.you_two_state_vampire = you.race() == "Vampire" and ({alive = true, bloodless = true})[nrc.you.hunger_name()]

-- You are a blood-potion vampire.
f.you_blood_vampire = you.race() == "Vampire" and not f.you_two_state_vampire

-- You can select which skills to train.
f.you_select_skills = you.race() ~= "Gnoll"

-- You can mutate.
f.you_mutate = not ({Mummy = true, Ghoul = true})[you.race()]

-- Holy damage does not affect you.
f.you_ignore_holy = not ({Mummy = true, Ghoul = true, Vampire = true, Demonspawn = true})[you.race()]

-- Torment does not affect you.
f.you_ignore_torment = ({Mummy = true, Ghoul = true})[you.race()]
