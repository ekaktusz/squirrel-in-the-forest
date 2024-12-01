extends Node

var intro_details = {
	0: LevelIntroDetail.create(
		"Ha! Someone already got here before you? These tombs are almost completely", 
		"cleaned out? It must’ve been our arch-enemy, the nefarious Dr. Hamm... Better watch your tail on the way out – his crew might still be lurking around...", 
		load("res://Scenes/LevelIntro/MiniLevels/level_001.png")
	),
	1: LevelIntroDetail.create(
		"Agent N, I have to say, you are pretty... pretty impressive, I mean. Ahem.", 
		"Your first mission is to rob the ancient Crackanut Pyramids. The Squirrel Pharaoh was sitting on a mountain of delicious treasures... Go ahead and stash as many nuts as you can! Let’s show the rich that sometimes, the nutty ones come out on top!", 
		load("res://Scenes/LevelIntro/MiniLevels/level_002.png")
	),
	2: LevelIntroDetail.create(
		"The winds of adventure are blowing strong today, aren’t they, Agent N?", 
		"The tomb ahead is rumored to house the Gem of Eternal Crunch. A priceless artifact for squirrels like us! Be wary of traps – they don’t like uninvited guests.", 
		load("res://Scenes/LevelIntro/MiniLevels/level_003.png")
	),
	3: LevelIntroDetail.create(
		"This level is all about wits and reflexes, Agent N!", 
		"You’ll have to jump, dodge, and grab treasures while avoiding Dr. Hamm's goons. Keep your tail high and your spirit higher!", 
		load("res://Scenes/LevelIntro/MiniLevels/level_004.png")
	),
	4: LevelIntroDetail.create(
		"The treasures of the Squirrel Pharaoh await – deep within the labyrinth ahead.", 
		"Remember: stick to the shadows and keep your ears sharp for any signs of danger. You’ve got this!", 
		load("res://Scenes/LevelIntro/MiniLevels/level_005.png")
	),
	5: LevelIntroDetail.create(
		"A secret hideout? Perfect for sneaky squirrels like us!", 
		"Dr. Hamm’s crew may have left clues here. Gather what you can and escape before they return. Time is ticking!", 
		load("res://Scenes/LevelIntro/MiniLevels/level_101.png")
	),
	6: LevelIntroDetail.create(
		"The Crunch Forest is alive with danger.", 
		"Hidden among the trees lies a cache of nuts. But beware – it’s guarded by Hamm's robotic hawks. Stealth is your ally here!", 
		load("res://Scenes/LevelIntro/MiniLevels/level_102.png")
	),
	7: LevelIntroDetail.create(
		"The sands of time won’t wait, Agent N.", 
		"Some say the buried pyramid ahead has treasures older than squirrelkind itself. Unearth them and claim your rightful place in history!", 
		load("res://Scenes/LevelIntro/MiniLevels/level_103.png")
	),
	8: LevelIntroDetail.create(
		"The treasure maps led us to this desolate canyon.", 
		"Deep in the heart of this rocky maze, more treasures await. But tread carefully – the cliffs are unforgiving.", 
		load("res://Scenes/LevelIntro/MiniLevels/level_104.png")
	),
	9: LevelIntroDetail.create(
		"Dr. Hamm left his mark here, Agent N.", 
		"Deface his traps and outwit his goons. This is a test of agility and courage. Show him what squirrels are made of!", 
		load("res://Scenes/LevelIntro/MiniLevels/level_105.png")
	),
	10: LevelIntroDetail.create(
		"The whispers of the ancient keepers can still be heard here.", 
		"Hidden treasures lie beneath the ruins, guarded by Hamm's advanced security systems. Be swift, be smart.", 
		load("res://Scenes/LevelIntro/MiniLevels/level_106.png")
	),
	11: LevelIntroDetail.create(
		"Agent N, your daring escapades bring us to new heights!", 
		"The floating cliffs house treasures unseen by squirrel eyes. Glide carefully and gather the riches!", 
		load("res://Scenes/LevelIntro/MiniLevels/level_107.png")
	),
	12: LevelIntroDetail.create(
		"A shadow looms over the city ruins.", 
		"The nuts stored here are vital for our cause. Move fast, Agent N, before Hamm’s spies catch wind of your plans!", 
		load("res://Scenes/LevelIntro/MiniLevels/level_108.png")
	),
	13: LevelIntroDetail.create(
		"High tide, high stakes!", 
		"The coastal caves are rumored to house treasures washed ashore from shipwrecks. Beware of Hamm’s divers lurking nearby!", 
		load("res://Scenes/LevelIntro/MiniLevels/level_109.png")
	),
	14: LevelIntroDetail.create(
		"The great oak stands as a fortress of nature.", 
		"Deep within its branches lies the Squirrel’s Crown, an artifact of immeasurable value. Climb and claim it, Agent N!", 
		load("res://Scenes/LevelIntro/MiniLevels/level_110.png")
	),
	15: LevelIntroDetail.create(
		"Agent N, this icy fortress hides more than just cold secrets.", 
		"The treasures of the Glacier King are said to be guarded by frostbite traps. Bundle up and take the plunge!", 
		load("res://Scenes/LevelIntro/MiniLevels/level_201.png")
	),
	16: LevelIntroDetail.create(
		"The molten depths call to you, brave squirrel.", 
		"In the heart of the volcano lies the Golden Acorn. Be careful of Hamm’s lava-proof bots patrolling the area!", 
		load("res://Scenes/LevelIntro/MiniLevels/level_202.png")
	),
	17: LevelIntroDetail.create(
		"This abandoned space station is crawling with danger.", 
		"Treasure capsules float within zero gravity. Use your jetpack and cunning to outwit Hamm’s drones!", 
		load("res://Scenes/LevelIntro/MiniLevels/level_203.png")
	),
	18: LevelIntroDetail.create(
		"The Mystic Marshes are shrouded in fog and mystery.", 
		"Rumors speak of glowing acorns hidden among the reeds. Tread lightly and avoid the Marsh Spirits.", 
		load("res://Scenes/LevelIntro/MiniLevels/level_204.png")
	),
	19: LevelIntroDetail.create(
		"Agent N, this ancient castle holds secrets of a bygone era.", 
		"Legends say the Nutcracker Blade is hidden here. It’s time to prove yourself worthy of such a weapon.", 
		load("res://Scenes/LevelIntro/MiniLevels/level_205.png")
	),
	20: LevelIntroDetail.create(
		"The Starry Labyrinth is unlike anything you’ve faced before.", 
		"Navigate the floating platforms and claim the Cosmic Nut. One misstep, and you’re lost in the void!", 
		load("res://Scenes/LevelIntro/MiniLevels/level_206.png")
	),
	21: LevelIntroDetail.create(
		"The Underwater Caverns hold treasures left behind by ancient sea squirrels.", 
		"Navigate the currents and avoid Hamm’s submarines. It’s a deep dive to glory!", 
		load("res://Scenes/LevelIntro/MiniLevels/level_207.png")
	),
	22: LevelIntroDetail.create(
		"This desolate battlefield echoes with the cries of old wars.", 
		"The victory nuts are still buried in the rubble. Uncover them and bring honor to squirrelkind.", 
		load("res://Scenes/LevelIntro/MiniLevels/level_208.png")
	),
	23: LevelIntroDetail.create(
		"The Crystallized Caverns shimmer with untold riches.", 
		"Collect as many crystal nuts as you can, but beware – Hamm’s mining crew is on high alert.", 
		load("res://Scenes/LevelIntro/MiniLevels/level_209.png")
	),
	24: LevelIntroDetail.create(
		"This is it, Agent N. The final showdown awaits.", 
		"The Treasure of Ages lies at the heart of this domain. Face Hamm, his crew, and all the challenges head-on!", 
		load("res://Scenes/LevelIntro/MiniLevels/level_210.png")
	)
}
