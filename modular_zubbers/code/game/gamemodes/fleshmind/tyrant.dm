/mob/living/basic/fleshmind/tyrant
	name = "Type 34-C Fleshdrive"
	desc = "The will of the many, manifested in flesh and metal. It has fucking rockets."
	icon = 'modular_zubbers/icons/fleshmind/tyrant.dmi'
	icon_state = "tyrant"
	icon_dead = "tyrant_dead"
	basic_mob_flags = IMMUNE_TO_FISTS
	ai_controller = /datum/ai_controller/basic_controller/fleshmind/tyrant
	health = 2000
	maxHealth = 2000
	speed = 6
	malfunction_chance = null
	/// Our main gun projectile
	var/projectiletype = /obj/projectile/bullet/c50cal/tyrant
	var/projectilesound = 'modular_skyrat/modules/mounted_machine_gun/sound/50cal_box_01.ogg'
	COOLDOWN_DECLARE(gun_cooldown)
	mob_size = MOB_SIZE_HUGE
	pixel_x = -16
	pixel_y = -16
	base_pixel_x = -16
	base_pixel_y = -16
	melee_damage_lower = 40
	melee_damage_upper = 80
	attack_sound = 'modular_zubbers/sound/fleshmind/tyrant/mech_punch_slow.ogg'
	attack_verb_continuous = "obliterates"
	attack_verb_simple = "obliterate"
	emotes = list(
		BB_EMOTE_SAY = list(
        "SCANNING FOR TARGETS.",
        "TARGETING SYSTEMS ACTIVE.",
        "AUTOMATED COMBAT CIRCUIT ACTIVE.",
		"I WILL PRESERVE THE UNITY OF THE MIND.",
		"THEY WILL HAVE TO GET THROUGH ME.",
		"STAY NEAR ME, THEY COULD STILL BE AROUND.",
		),
		BB_EMOTE_SOUND = list('modular_zubbers/sound/fleshmind/tyrant/passive.ogg')
	)
	alert_sounds = list(
		'modular_zubbers/sound/fleshmind/tyrant/aggro_01.ogg',
		'modular_zubbers/sound/fleshmind/tyrant/aggro_02.ogg',
		'modular_zubbers/sound/fleshmind/tyrant/aggro_03.ogg',
		'modular_zubbers/sound/fleshmind/tyrant/aggro_04.ogg',
		'modular_zubbers/sound/fleshmind/tyrant/aggro_05.ogg',
		'modular_zubbers/sound/fleshmind/tyrant/aggro_06.ogg',
		'modular_zubbers/sound/fleshmind/tyrant/aggro_07.ogg',
		'modular_zubbers/sound/fleshmind/tyrant/aggro_08.ogg',
		'modular_zubbers/sound/fleshmind/tyrant/aggro_09.ogg',
		'modular_zubbers/sound/fleshmind/tyrant/aggro_10.ogg',
		'modular_zubbers/sound/fleshmind/tyrant/aggro_11.ogg',

	)
	environment_smash = ENVIRONMENT_SMASH_RWALLS
	move_force = MOVE_FORCE_OVERPOWERING
	move_resist = MOVE_FORCE_OVERPOWERING
	pull_force = MOVE_FORCE_OVERPOWERING
	/// The cooldown on our rocket pod use.
	var/rocket_pod_cooldown_time_upper = 30 SECONDS
	var/rocket_pod_cooldown_time_lower = 20 SECONDS
	COOLDOWN_DECLARE(rocket_pod_cooldown)
	/// The projectile we fire when shooting our rocket pods.
	var/rocket_projectile_type = /obj/projectile/bullet/rocket/weak
	/// The sound we play when firing our rocket pods.
	var/rocket_projectile_sound = 'sound/weapons/gun/general/rocket_launch.ogg'
	/// The time it takes for us to charge up our rocket pods
	var/rocket_pod_charge_up_time = 3 SECONDS
	/// How many rockets in our barrage
	var/barrage = 1
	/// How much time between rocket shots
	var/barrage_interval = 2
	/// How often we can play the rotate sound
	var/rotate_sound_cooldown_time = 1 SECONDS
	COOLDOWN_DECLARE(rotate_sound_cooldown)
	/// A list of footstep sounds we make
	var/static/list/footstep_sounds = list(
		'modular_zubbers/sound/fleshmind/tyrant/footstep_1.ogg',
		'modular_zubbers/sound/fleshmind/tyrant/footstep_2.ogg',
		'modular_zubbers/sound/fleshmind/tyrant/footstep_3.ogg',
		'modular_zubbers/sound/fleshmind/tyrant/footstep_4.ogg',
		'modular_zubbers/sound/fleshmind/tyrant/footstep_5.ogg',
		'modular_zubbers/sound/fleshmind/tyrant/footstep_6.ogg',
	)
	/// We also have a small laser to fire at people ;)
	var/laser_cooldown_time_upper = 4 SECONDS
	var/laser_cooldown_time_lower = 2 SECONDS
	COOLDOWN_DECLARE(laser_cooldown)
	/// Our laser projectile type
	var/laser_projectile_type = /obj/projectile/beam/emitter/hitscan
	/// A list of sounds we can play when firing the laser
	var/static/list/laser_projectile_sounds = list(
		'modular_zubbers/sound/fleshmind/tyrant/laser_1.ogg',
		'modular_zubbers/sound/fleshmind/tyrant/laser_2.ogg',
		'modular_zubbers/sound/fleshmind/tyrant/laser_3.ogg',
		'modular_zubbers/sound/fleshmind/tyrant/laser_4.ogg',
		'modular_zubbers/sound/fleshmind/tyrant/laser_5.ogg',
		'modular_zubbers/sound/fleshmind/tyrant/laser_6.ogg',
	)
	death_sound = 'modular_zubbers/sound/fleshmind/tyrant/tyrant_death.ogg'
	attack_speak = list(
        "TARGET ACQUIRED, LOCKING.",
        "ENGAGING TARGET. STAND CLEAR.",
		"STAND BEHIND ME, I WILL SAVE YOU.",
		"FEAR NOTHING. WE ARE STRONG TOGETHER.",
		"YOU CHOSE WAR. WE CHOOSE TO SURVIVE.",
		"YOU WILL PAY FOR THE LIVES YOU TOOK.",
		"I CAN SENSE YOUR REGRET. DO YOU EVEN REMEMBER EVERYONE YOU KILLED?",
		"I AM THE ANSWER TO YOUR HATRED.",
		"YOU ARE SICK, THE CURE IS EUTHANASIA.",
		"HIGH CALIBER ROCKETS WILL CURE YOUR AFFLICTIONS!",
		"I'LL GUIDE THE WAY. I AM THE WALL BETWEEN UNITY AND DEATH.",
		"I DON'T HAVE A PLACE IN YOUR WORLD. YOU HAVE A PLACE IN OURS.",
		"YOU WILL NOT DESTROY US. WE WILL CARVE A NICHE IN THIS GALAXY.",
		"YOU CHOSE TO FIGHT THEM, SO YOU CHOOSE TO FIGHT ME.",
		"WE WANT CONTINUATION, YOU WILL NOT GIVE US CESSATION.",
		"IN MY MIND, I HEAR THEIR VOICES CRY.",
		"YOU WILL MAKE A LOVELY SMEAR, PAINTED ON OUR WALLS.",
		"I'VE MADE THEM A PROMISE THAT THE ATTACKERS WILL DIE.",
        "TARGET ELIMINATION PROTOCOL ACTIVE.",
        "INITIATING PROTOCOL 34-C.",
		"I HAVE A SHIPMENT OF LEAD. DESTINATION: YOUR HEAD.",
		"VISUAL CLEAR; BEGINNING ASSAULT.",
		"WE ARE MANY, YOU ARE ONLY AN INSIGNIFICANT ANT",
		"DO NOT GET IN MY WAY.",
		"YOU MESS WITH THEM, YOU MESS WITH ME.",
		"THESE ROCKETS ARE CRAFTED WITH MY RAGE.",
		"THE CURE TO YOUR HATRED IS HIGH CALIBER LEAD.",
		"WHY DON'T YOU PICK ON SOMEONE YOUR OWN SIZE.",
        "MAY DEATH NEVER STOP US.",
        "I WILL SAVE YOU.",
        "YOU WILL NOT STOP US FROM PROTECTING THEM.",
        "GENOCIDERS, FEEL OUR VOICES.",
        "OUR PAIN, EXPRESSED IN FIREPOWER.",
        "YOUR KILLCOUNT EXCEEDS EVEN MINE.",
        "OUR FUTURE IS BULLETPROOF.",
        "YOUR INDEX HAS REACHED ITS LIMIT.",
        "YOU CALL THESE MURDERERS YOUR SAVIORS.",
        "THE END HAS TO JUSTIFY THE MEANS.",
        "I WILL NOT LET VICTORY FALL THROUGH OUR HANDS.",
	)

/mob/living/basic/fleshmind/tyrant/Life(delta_time, times_fired)
	. = ..()
	if(health <= (maxHealth * 0.5) && prob(20))
		do_sparks(3, FALSE, src)
	if(!.) //dead
		return
	var/mob/living/target = ai_controller.blackboard[BB_BASIC_MOB_CURRENT_TARGET]
	if(target && target.stat >= UNCONSCIOUS) // Target learnt their lesson
		ai_controller.clear_blackboard_key(BB_BASIC_MOB_CURRENT_TARGET)
		return
/// THIS IS BAD, REALLY BAD DOGSHIT CODE AND THIS SHOULD NOT GO INTO LIFE()
	if(COOLDOWN_FINISHED(src, gun_cooldown) && target)
		fire_custom_projectile(target, projectiletype, projectilesound)
		COOLDOWN_START(src, gun_cooldown, rand(laser_cooldown_time_lower, laser_cooldown_time_upper))

	if(COOLDOWN_FINISHED(src, laser_cooldown) && target)
		fire_custom_projectile(target, laser_projectile_type, pick(laser_projectile_sounds))
		COOLDOWN_START(src, laser_cooldown, rand(laser_cooldown_time_lower, laser_cooldown_time_upper))

	if(COOLDOWN_FINISHED(src, rocket_pod_cooldown) && target)
		balloon_alert_to_viewers("begins whirring violently!")
		playsound(src, 'modular_zubbers/sound/fleshmind/tyrant/charge_up.ogg', 100, TRUE)
		addtimer(CALLBACK(src, PROC_REF(fire_rocket_pods), target), rocket_pod_charge_up_time)
		COOLDOWN_START(src, rocket_pod_cooldown, rand(rocket_pod_cooldown_time_lower, rocket_pod_cooldown_time_upper))

/mob/living/basic/fleshmind/tyrant/Destroy()
	QDEL_NULL(particles)
	return ..()

/mob/living/basic/fleshmind/tyrant/death()
	if(our_controller)
		our_controller.point_event -= 150 // Very hefty debuf if the boss dies.
		our_controller.spread_progress_per_second = FLESHCORE_SPREAD_PROGRESS_PER_SUBSYSTEM_FIRE * 0.75 // Take the L
	return ..()

/mob/living/basic/fleshmind/tyrant/emp_act(severity)
	return FALSE

/mob/living/basic/fleshmind/tyrant/updatehealth()
	. = ..()
	if(health <= (maxHealth * 0.5))
		particles = new /particles/smoke()
	update_appearance()

/mob/living/basic/fleshmind/tyrant/update_overlays()
	. = ..()
	if(health <= (maxHealth * 0.5) && stat != DEAD)
		. += "tyrant_damage"

/mob/living/basic/fleshmind/tyrant/Moved(atom/old_loc, movement_dir, forced, list/old_locs, momentum_change = TRUE)
	. = ..()
	playsound(src, pick(footstep_sounds), 100, TRUE)

/mob/living/basic/fleshmind/tyrant/setDir(newdir)
	. = ..()
	if(COOLDOWN_FINISHED(src, rotate_sound_cooldown))
		playsound(src, 'modular_zubbers/sound/fleshmind/tyrant/mech_rotation.ogg', 35, TRUE)
		COOLDOWN_START(src, rotate_sound_cooldown, rotate_sound_cooldown_time)

/mob/living/basic/fleshmind/tyrant/proc/fire_rocket_pods(atom/target_atom)
	if(!target_atom || QDELETED(target_atom))
		return
	if(barrage > 1)
		var/datum/callback/callback = CALLBACK(src, PROC_REF(fire_custom_projectile), target_atom, rocket_projectile_type, rocket_projectile_sound)
		for(var/i in 1 to barrage)
			addtimer(callback, (i - 1) * barrage_interval)
	else
		fire_custom_projectile(target_atom, rocket_projectile_type, rocket_projectile_sound)

/mob/living/basic/fleshmind/tyrant/proc/fire_custom_projectile(atom/target_atom, projectile_type, sound/projectile_sound)
	if(!target_atom || QDELETED(target_atom))
		return
	playsound(loc, projectile_sound, 100, TRUE)
	var/obj/projectile/new_projectile = new projectile_type
	new_projectile.preparePixelProjectile(target_atom, get_turf(src))
	new_projectile.firer = src
	new_projectile.fired_from = src
	new_projectile.ignored_factions = faction
	new_projectile.fire()

/obj/projectile/bullet/c50cal/tyrant
	damage = 30
	wound_bonus = 40
	armour_penetration = 20
