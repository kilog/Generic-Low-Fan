/mob/player
	icon='player.dmi'
	var/list/equipment
	var/obj/item/activehand = 1
	var/obj/item/w_lefthand = null
	var/obj/item/w_righthand = null
/mob/player/New()
	w_lefthand = new /obj/item/axe(src)
	..()

/mob/player/Login()
	if(!loc) //new player
		loc = locate(3,3,1)
	usr << sound('bensound-acousticbreeze.ogg',1, volume=100)


/mob/player/Stat()
	statpanel("Inventory", contents)
//	Logout()
//		src.SaveProc()
//		world<<"[src] has Logged Out."

/mob/player/verb/say(msg as text)
	set category = "IC"
	view(usr)<<"[usr] says: [msg]"

/mob/player/verb/OOC(msg as text)
		set category = "OOC"
		world<<"<b>[src]: [msg] </b>"

/mob/player/verb/Who()
	set category = "OOC"
	var/counter=0
	for(var/mob/player in world)
		counter+=1
	src<<"<b>[counter] Players Online"

/mob/player/verb/Drop()
	var/currenthand=null
	set category = "Actions"
	if (activehand == 1)
		currenthand = w_lefthand
	else
		currenthand = w_righthand
	if (!currenthand)
		src << "You're not holding anything to drop!"
		return
	if (currenthand == w_lefthand)
		src <<"Item dropped."
		w_lefthand.loc = loc // Set the location of the item to our location (aka the floor)
		w_lefthand = null
		return
	if (currenthand == w_righthand)
		src <<"Item dropped."
		w_righthand.loc = loc
		w_righthand = null
	return

/mob/player/verb/Swaphand()
	set category = "Actions"
	if (activehand == 1)
		activehand = 0
		src <<"Hand swapped!"
		return
	if (activehand == 0)
		activehand = 1
		src <<"Hand swapped back!"
		return