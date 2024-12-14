/obj/screen/psi/hub
	name = "Psi"
	icon_state = "psi_suppressed"
	screen_loc = "EAST-1:28,CENTER-3:11"
	hidden = FALSE
	maptext_x = 6
	maptext_y = -8
	var/image/on_cooldown
	var/list/components

/obj/screen/psi/hub/New(var/mob/living/_owner)
	on_cooldown = image(icon, "cooldown")
	components = list(
		new /obj/screen/psi/armour(_owner),
		new /obj/screen/psi/toggle_psi_menu(_owner, src)
		)
	..()
	START_PROCESSING(SSprocessing, src)

/obj/screen/psi/hub/on_update_icon()
	if(!owner.psi)
		return

	icon_state = owner.psi.suppressed ? "psi_suppressed" : "psi_active"
	if(world.time < owner.psi.next_power_use)
		overlays |= on_cooldown
	else
		overlays.Cut()

	var/length = LAZYLEN(components)
	var/x_offset = 1
	var/y_offset = 3
	for(var/thing in components)
		var/obj/screen/psi/component = thing
		component.update_icon()

		var/is_menu_toggle = components.Find(component) == length
		if(x_offset > 3 && !is_menu_toggle)
			x_offset = y_offset > 4 ? 2 : 1
			y_offset++

		if(!component.invisibility)
			component.screen_loc = "EAST-[++x_offset]:28,CENTER-[y_offset]:11"

/obj/screen/psi/hub/Destroy()
	STOP_PROCESSING(SSprocessing, src)
	owner = null
	for(var/thing in components)
		qdel(thing)
	components.Cut()
	. = ..()

/obj/screen/psi/hub/Process()
	if(!istype(owner))
		qdel(src)
		return
	if(!owner.psi)
		return
	maptext = "[round((owner.psi.stamina/owner.psi.max_stamina)*100)]%"
	update_icon()

/obj/screen/psi/hub/Click(var/location, var/control, var/params)
	var/list/click_params = params2list(params)
	if(click_params["shift"])
		owner.show_psi_assay(owner)
		return

	if(owner.psi.suppressed && owner.psi.stun)
		to_chat(owner, "<span class='warning'>You are dazed and reeling, and cannot muster enough focus to do that!</span>")
		return

	owner.psi.suppressed = !owner.psi.suppressed
	to_chat(owner, "<span class='notice'>You are <b>[owner.psi.suppressed ? "now suppressing" : "no longer suppressing"]</b> your psi-power.</span>")
	if(owner.psi.suppressed)
		var/mob/living/carbon/human/A = owner
		if(A.levitation)
			A.levitation = FALSE
			A.pass_flags &= ~PASS_FLAG_TABLE
			A.pixel_y = 0
			A.overlays -= image('icons/screen/psi.dmi', "levitation")
			A.stop_floating()
		owner.psi.cancel()
		owner.psi.hide_auras()
	else
		sound_to(owner, sound('sound/effects/psi/power_unlock.ogg'))
		owner.psi.show_auras()
	update_icon()
