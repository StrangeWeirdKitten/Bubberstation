// Is a global datum to register the login signal
GLOBAL_DATUM_INIT(lewd_visibility_clients, /datum/lewd_visibility_datum, new)

/datum/lewd_visibility_datum
	var/list/client/visibility_list = list()

/datum/lewd_visibility_datum/New()
	RegisterSignal(SSdcs, COMSIG_GLOB_MOB_LOGGED_IN, PROC_REF(on_mob_login))

/datum/lewd_visibility_datum/proc/on_mob_login(datum/source, mob/new_login)
	var/mob/owner = new_login
	if(!owner.client)
		return
	if(owner.client.prefs.read_preference(/datum/preference/toggle/erp/lewd_visibility) && !(owner.client in visibility_list))
		visibility_list += owner.client
	else
		visibility_list -= owner.client

/datum/preference/toggle/erp/lewd_visibility
	default_value = TRUE
	savefile_key = "lewd_visibility"

/datum/preference/toggle/erp/lewd_visibility/apply_to_client_updated(client/client, value)
	. = ..()
	var/client/player = client
	if(value)
		GLOB.lewd_visibility_clients.visibility_list += player
	else
		GLOB.lewd_visibility_clients.visibility_list -= player

