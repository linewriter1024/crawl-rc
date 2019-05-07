if nrc.features.blood_vampires and you.race() == "Vampire" then
	crawl.setopt("item_slot += potion of blood:q")
	crawl.setopt("spell_slots += regeneration:R")
	crawl.setopt("macros += M 6 qqzR5")
end
