/mob/inanimate/tree
	icon = 'tree.dmi'
/mob/inanimate/tree/Click()
	if(/obj/item/axe in /mob/player/)
		usr << "You swing your axe at the tree!" // I know, thatr's what runeScape says.
		new/obj/item/logs(loc) // get wood
		usr << "You get some logs."
		del src