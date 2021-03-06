#define NISHTYAK_DELAY 1200
/obj/structure/toilet/parasha
  name = "BIDLOparasha X-1337"
  desc = "C������ ��� ������ ������� ����������, ��� �������� ���������� ��� � �������� ������������. ������� ������ � �������� ���� �������."
  icon = 'hyntatmta/icons/obj/parasha.dmi'
  var/nishtyak_cooldown

/obj/structure/toilet/parasha/attackby(obj/item/I, mob/living/user, params)
	..()
	if(istype(I, /obj/item/weapon/kitchen/utensil/fork))
		if(!open)
			user.visible_message("<span class='notice'><B>[user]</B> ������� ������ �� ��������� ������...</span>", "<span class='notice'>�� ������� ������ �� ������ �������. ��������, ����� �� �������?</span>")
			return
		to_chat(user, "<span class='notice'>�� ������ ������� ������ ������. �����, �����!</span>")
		playsound(loc, 'sound/effects/slime_squish.ogg', 50, 1)
		if(do_after(user, 30, target = src))
			user.visible_message("<span class='notice'><B>[user]</B> ������ ������!</span>", "<span class='notice'>�� �������� ������! �������! ���� ��� �� �����...</span>")
			spawnloot(user)
			return

/obj/structure/toilet/parasha/proc/spawnloot(var/mob/living/petuh)
  var/chosen_nishtyak
  var/list/nishtyaks = list (
 //useless shit below
    /obj/item/weapon/lighter = 50,
    /obj/item/weapon/bedsheet = 50,
    /obj/item/weapon/coin/silver = 50,
    /obj/item/clothing/under/shorts/red = 50,
    /obj/item/clothing/under/shorts/blue = 50,
    /obj/item/toy/balloon = 50,
    /obj/item/weapon/bikehorn = 50,
    /obj/item/toy/crayon/rainbow = 50,
    /obj/item/clothing/suit/ianshirt = 50,
    /obj/item/weapon/cane = 50,
    /obj/item/clothing/head/collectable/tophat = 50,
    /obj/item/clothing/mask/balaclava = 50,
    /obj/item/weapon/storage/belt/champion = 50,
    /obj/item/clothing/mask/luchador = 50,
    /obj/item/clothing/head/corgi = 50,
    /obj/item/clothing/suit/corgisuit = 50,
    /obj/item/clothing/head/bearpelt = 50,
    /obj/item/toy/balloon = 50,
    /obj/item/toy/syndicateballoon = 50,
    /obj/item/toy/katana = 50,
    /obj/item/clothing/accessory/petcollar = 50,
    /obj/item/clothing/gloves/color/yellow/fake = 50,
    /obj/item/weapon/reagent_containers/food/snacks/donkpocket = 50,
    /obj/item/pizzabox/meat = 50,
    /obj/item/weapon/spacecash/c100 = 50,
    /obj/item/clothing/head/kitty = 50,
//some of this maybe alright
    /obj/item/weapon/kitchen/utensil/fork = 30,
    /obj/item/weapon/reagent_containers/food/drinks/bottle/rum = 29,
    /obj/item/weapon/reagent_containers/food/drinks/bottle/whiskey = 28,
    /obj/item/weapon/hatchet = 27,
    /obj/item/clothing/gloves/color/yellow = 26,
    /obj/item/weapon/contraband/poster = 25,
    /obj/item/weapon/spacecash/c1000 = 24,
    /obj/item/clothing/mask/breath = 23,
    /obj/item/weapon/screwdriver = 22,
    /obj/item/weapon/storage/backpack/clown = 21,
//And this usefull or nice and shiny
    /obj/item/device/pda = 13,
    /obj/item/stack/sheet/mineral/diamond = 15,
    /obj/item/seeds/cash = 16,
    /obj/item/weapon/melee/classic_baton = 14,
    /obj/item/clothing/head/helmet/space = 12,
    /obj/item/weapon/tank/emergency_oxygen = 11,
    /obj/item/weapon/reagent_containers/food/snacks/monkeycube = 17,
    /obj/item/weapon/storage/backpack/satchel_flat = 16,
//Rare things
    /obj/item/weapon/storage/box/monkeycubes = 10,
    /obj/item/weapon/gun/energy/kinetic_accelerator = 6,
    /obj/item/clothing/suit/space = 8,
    /obj/item/weed_extract = 9,
    /obj/item/ammo_box/magazine/m10mm = 5,
    /obj/item/weapon/reagent_containers/food/snacks/grown/ambrosiadeus = 7,
    /obj/item/clothing/mask/gas = 8,
    /obj/item/weapon/grenade/smokebomb = 6,
    /obj/item/clothing/shoes/syndigaloshes = 9,
    /obj/item/weapon/dnascrambler = 5,
//FUCKING DANGEROUS SHIT
    /obj/item/clothing/under/chameleon = 3,
    /obj/item/weapon/implanter/freedom= 3,
    /obj/item/weapon/implanter/storage = 3,
    /obj/item/weapon/implanter/adrenalin = 3,
    /obj/item/clothing/under/contortionist = 3,
    /obj/item/toy/cards/deck/syndicate = 3,
    /obj/item/device/pizza_bomb = 3,
    /obj/item/weapon/scissors/safety = 2,
    /obj/item/weapon/grenade/bananade = 2,
    /obj/item/weapon/gun/projectile/automatic/pistol/empty = 2,
    /obj/item/weapon/storage/box/syndie_kit/caneshotgun = 2,
    /obj/item/weapon/grenade/plastic/x4 = 1,
    /obj/item/weapon/caution/proximity_sign = 1,
    /obj/item/weapon/bee_briefcase = 1,
    /obj/item/clothing/gloves/color/yellow/power = 1,
    /obj/item/weapon/storage/box/syndie_kit/space = 1
  )

  if(nishtyak_cooldown > world.time)
    return

  chosen_nishtyak = pickweight(nishtyaks)
  new chosen_nishtyak(src.loc)
  petuh.visible_message("�� ������� ������������� ���� �� ������� ������.", "<span class='notice'>�� ������� �������� ��� � �����. �� ������ ���-�� �������.</span>")
  playsound(src.loc, 'sound/effects/slosh.ogg', 50, 1)
  nishtyak_cooldown = world.time + NISHTYAK_DELAY
  return 1

#undef NISHTYAK_DELAY
