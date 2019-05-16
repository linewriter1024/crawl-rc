local f = {}
nrc.features = f

-- Shortcuts.
local v = nrc.check_version

-- You are a two-state vampire.
f.you_two_state_vampire = you.race() == "Vampire" and ({Alive = true, Bloodless = true})[you.hunger_name()]
-- You are a blood-potion vampire.
f.you_blood_vampire = you.race() == "Vampire" and not f.you_two_state_vampire

-- You can select which skills to train.
f.you_select_skills = you.race() ~= "Gnoll"

-- You can mutate.
f.you_mutate = not ({Mummy = true, Ghoul = true})[you.race()]
