/obj/item
	var/weapondamage
/obj/item/Click()
	var/mob/player/user
	if(!istype(usr, /mob/player))
		return 0
	user = usr
	if(!(user in range(1, src)))
		return 0
	var/obj/item/in_current_hand
	if(user.activehand) //left hand
		in_current_hand = user.w_lefthand
	else
		in_current_hand = user.w_righthand
	if(in_current_hand)
		user << "Your hand is full!"
		return 0
	else
		user << "You pick up the [src]"
		if(user.activehand) //left hand
			user.w_lefthand = src
		else
			user.w_righthand = src
		user.contents += src


/obj/item/logs
	icon = 'logs.dmi'
	icon_state = "one"

/obj/item/axe
	icon = 'axe.dmi'
	weapondamage = 10