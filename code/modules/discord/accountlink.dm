// IF you have linked your account, this will trigger a verify of the user
/client/verb/verify_in_discord()
	set category = "OOC"
	set name = "Verify Discord Account"
	set desc = "Verify your discord account with your BYOND account"

	// Safety checks
	if(!CONFIG_GET(flag/sql_enabled))
		to_chat(src, span_warning("This feature requires the SQL backend to be running."))
		return

	// Why this would ever be unset, who knows
	var/prefix = CONFIG_GET(string/discordbotcommandprefix)
	if(!prefix)
		to_chat(src, span_warning("This feature is disabled."))

	if(!SSdiscord || !SSdiscord.reverify_cache)
		to_chat(src, span_warning("Wait for the Discord subsystem to finish initialising"))
		return
	var/message = ""
	// Simple sanity check to prevent a user doing this too often
	var/cached_one_time_token = SSdiscord.reverify_cache[usr.ckey]
	if(cached_one_time_token && cached_one_time_token != "")
		message = "You already generated your one time token, it is [cached_one_time_token]. If you need a new one, you will have to wait until the round ends, or switch to another server; try verifying yourself on Discord by copying this command: <span class='code user-select'>[prefix]verify [cached_one_time_token]</span> and pasting it into the verification channel."


	else
// 					***** BUBBER EDIT START - REDOS THIS ELSE STATEMENT ENTIRELY *****
		var/datum/discord_link_record/existing_link = SSdiscord.find_discord_link_by_ckey(usr?.ckey, only_valid = TRUE)
		//Do not create a new entry if they already have a linked account
		if(existing_link?.discord_id)
			message = "You already have a linked account with discord ID ([existing_link.discord_id]) linked on [existing_link.timestamp]. If you desire to change your account please contact staff."
		else
			// Will generate one if an expired one doesn't exist already, otherwise will grab existing token
			var/one_time_token = SSdiscord.get_or_generate_one_time_token_for_ckey(ckey)
			SSdiscord.reverify_cache[usr.ckey] = one_time_token
			message = "Your one time token is: [one_time_token]. Assuming you have the required living minutes in game, you can now verify yourself on Discord by using the command: <span class='code user-select'>[prefix]verify [one_time_token]</span>"
		if(CONFIG_GET(flag/forced_discord_stay))
			message += span_warning("Remember that to mantain verification you MUST stay in the discord server")
// 					***** BUBBER EDIT END - REDOS THIS ELSE STATEMENT ENTIRELY *****
	//Now give them a browse window so they can't miss whatever we told them
	var/datum/browser/window = new/datum/browser(usr, "discordverification", "Discord Verification")
	window.set_content("<div>[message]</div>")
	window.open()


