mob
	verb
		say(msg as text)
			set category = "IC"
			view(usr)<<"[usr] says: [msg]"

		OOC(msg as text)
			set category = "OOC"
			world<<"<b>[src]: [msg] </b>"
		Who()
			set category = "OOC"
			var/counter=0
			for(var/mob/player in world)
				counter+=1
			src<<"<b>[counter] Players Online"
		Drop()
			set category = "Actions"
			/mob/player/proc/drop_item(var/obj/item/I)
			if (I == w_lefthand)
				w_lefthand = null
				I.loc = loc // Set the location of the item to our location (aka the floor)