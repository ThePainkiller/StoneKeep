
/datum/advclass/combat/sk/vaquero
	name = "Vaquero"
	tutorial = "You have been taming beasts of burden all your life, and riding since you were old enough to walk. Perhaps these lands will have use for your skills?"
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list("Tiefling")
	outfit = /datum/outfit/job/sk/adventurer/vaquero
	horse = /mob/living/simple_animal/hostile/retaliate/saigabuck/tame/saddled
	cmode_music = 'modular/stonekeep/sound/cmode/combat_duelist.ogg'
	category_tags = list(CTAG_ADVENTURER)
	min_pq = 0
	pickprob = 30
	maximum_possible_slots = 1

/datum/advclass/combat/sk/vaquero/equipme(mob/living/carbon/human/H)
	if(H.gender == FEMALE)
		horse = /mob/living/simple_animal/hostile/retaliate/saiga/tame/saddled
	return ..()

/datum/outfit/job/sk/adventurer/vaquero/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind?.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
	H.mind?.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE) // Makes sense enough for an animal tamer
	H.mind?.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind?.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind?.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.mind?.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.mind?.adjust_skillrank(/datum/skill/misc/riding, 5, TRUE)
	H.mind?.adjust_skillrank(/datum/skill/labor/taming, 4, TRUE) // How did they not have this skill before?!
	H.mind?.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	H.mind?.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
	H.mind?.adjust_skillrank(/datum/skill/misc/stealing, 4, TRUE)
	H.mind?.adjust_skillrank(/datum/skill/misc/lockpicking, 1, TRUE)
	H.mind?.adjust_skillrank(/datum/skill/misc/music, rand(1,2), TRUE)
	H.mind?.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
	head = /obj/item/clothing/head/bardhat
	shoes = /obj/item/clothing/shoes/boots
	pants = /obj/item/clothing/pants/tights/random
	shirt = /obj/item/clothing/shirt/undershirt
	belt = /obj/item/storage/belt/leather
	armor = /obj/item/clothing/armor/leather/vest
	cloak = /obj/item/clothing/cloak/half/red
	backl = /obj/item/storage/backpack/satchel
	beltl = /obj/item/weapon/sword/rapier
	beltr = /obj/item/weapon/whip
	neck = /obj/item/clothing/neck/chaincoif
	H.change_stat("strength", 1)
	H.change_stat("speed", 2)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
