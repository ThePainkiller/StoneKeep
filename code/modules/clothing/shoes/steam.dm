/obj/item/clothing/shoes/boots/armor/steam
	name = "steamknight boots"

	icon = 'icons/roguetown/clothing/steamknight.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/steamknight_onmob.dmi'
	icon_state = "steamknight_boots"

	sleeved =  'icons/roguetown/clothing/onmob/steamknight_onmob.dmi'
	sleevetype = "steamknight_boots"

	anvilrepair = /datum/skill/craft/engineering
	slowdown = 1.5
	item_weight = 6 * BRONZE_MULTIPLIER

/obj/item/clothing/shoes/boots/armor/steam/equipped(mob/living/user, slot)
	if(!(slotdefine2slotbit(slot) & slot_flags))
		return

	var/list/equipped_types = list()
	var/list/equipped_items = list()
	for(var/obj/item/clothing/V in user.get_equipped_items(FALSE))
		if(!is_type_in_list(V, GLOB.steam_armor))
			continue
		equipped_types |= V.type
		equipped_items |= V

	if(length(equipped_types) != length(GLOB.steam_armor))
		power_off(user)
		remove_status_effect(user)
		for(var/obj/item/clothing/clothing in equipped_items)
			clothing:power_off(user)
		return
	power_on(user)
	apply_status_effect(user)
	for(var/obj/item/clothing/clothing in equipped_items)
		clothing:power_on(user)
	. = ..()

/obj/item/clothing/shoes/boots/armor/steam/proc/try_steam_usage(mob/living/source)
	if(!SEND_SIGNAL(source, COMSIG_ATOM_PROXY_STEAM_USE, src, 0.5, "steam_armor"))
		for(var/obj/item/clothing/V in source.get_equipped_items(FALSE))
			if(!is_type_in_list(V, GLOB.steam_armor))
				continue
			V:power_off(source)
		power_off(source)
		remove_status_effect(source)
	return TRUE

/obj/item/clothing/shoes/boots/armor/steam/dropped(mob/living/user)
	var/list/equipped_types = list()
	var/list/equipped_items = list()
	for(var/obj/item/clothing/V in user.get_equipped_items(FALSE))
		if(!is_type_in_list(V, GLOB.steam_armor))
			continue
		equipped_types |= V.type
		equipped_items |= V

	if(length(equipped_types) != length(GLOB.steam_armor))
		power_off(user)
		remove_status_effect(user)
		for(var/obj/item/clothing/clothing in equipped_items)
			clothing:power_off(user)
		UnregisterSignal(user, COMSIG_MOVABLE_MOVED)
		return
	power_on(user)
	apply_status_effect(user)
	for(var/obj/item/clothing/clothing in equipped_items)
		clothing:power_on(user)
	. = ..()

/obj/item/clothing/shoes/boots/armor/steam/proc/power_on(mob/living/user)
	slowdown = 0
	user.update_equipment_speed_mods()
	RegisterSignal(user, COMSIG_MOVABLE_MOVED, PROC_REF(try_steam_usage), override = TRUE)
	return

/obj/item/clothing/shoes/boots/armor/steam/proc/power_off(mob/living/user)
	slowdown = 1.5
	user.update_equipment_speed_mods()
	return

/obj/item/clothing/shoes/boots/armor/steam/proc/apply_status_effect(mob/living/user)
	user.apply_status_effect(/datum/status_effect/buff/powered_steam_armor)

/obj/item/clothing/shoes/boots/armor/steam/proc/remove_status_effect(mob/living/user)
	user.remove_status_effect(/datum/status_effect/buff/powered_steam_armor)

