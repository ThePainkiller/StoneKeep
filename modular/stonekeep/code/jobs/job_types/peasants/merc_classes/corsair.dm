/datum/advclass/mercenary/sk/corsair
	name = "Corsair"
	tutorial = "Banished from polite society, you once found kin with privateers, working adjacent to a royal navy. After the Red Flag battered itself in the wind one last time, your purse was still not satisfied... And yet he complained that his belly was not full."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Tiefling"
	)
	outfit = /datum/outfit/job/stonekeep/merc/corsair
	category_tags = list(CTAG_SKMERCENARY)
	cmode_music = 'modular/stonekeep/sound/cmode/combat_duelist.ogg'
	maximum_possible_slots = 5

/datum/outfit/job/stonekeep/merc/corsair
	head = /obj/item/clothing/head/helmet/leather/headscarf
	pants = /obj/item/clothing/pants/tights/sailor
	belt = /obj/item/storage/belt/leather/mercenary
	armor = /obj/item/clothing/armor/leather/jacket/sea
	backl = /obj/item/storage/backpack/satchel
	backpack_contents = list(/obj/item/natural/worms/leech = 2,/obj/item/storage/belt/pouch/coins/mid)
	backr = /obj/item/fishingrod/fisher
	beltl = /obj/item/weapon/sword/sabre/cutlass
	beltr = /obj/item/weapon/knife/throwingknife
	shoes = /obj/item/clothing/shoes/boots

/datum/outfit/job/stonekeep/merc/corsair/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)

		H.mind?.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE) // Swords / Nonlethal.
		H.mind?.adjust_skillrank(/datum/skill/labor/fishing, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/swimming, 4, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/climbing, 5, TRUE) // For jumping off roofs. Don't lower.
		H.mind?.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE) // Most other classes have better Sneaking.
		H.mind?.adjust_skillrank(/datum/skill/misc/lockpicking, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/craft/cooking, 3, TRUE)

	shirt = pick(/obj/item/clothing/shirt/undershirt/sailor, /obj/item/clothing/shirt/undershirt/sailor/red)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	H.change_stat("endurance", 2)
	H.change_stat("speed", 2)
