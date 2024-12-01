extends Node

var intro_details = {
	0: LevelIntroDetail.create(
		"Agent N! Do you copy? Before you go to the field, we need to go through the basics.", 
		"Avoid enemy agents, and collect all the nuts you can locate. If you found every nut, deliver them to the secret stash. Press E to Evacuate in the Evatuation Zone.", 
		load("res://Scenes/LevelIntro/MiniLevels/level_001.png")
	),
	1: LevelIntroDetail.create(
		"You will need to sneak past patrols. Study their movement. They are following", 
		"orders, they will not go off-course.", 
		load("res://Scenes/LevelIntro/MiniLevels/level_002.png")
	),
	2: LevelIntroDetail.create(
		"When near a hiding spot, hold F to stay undetected.", 
		"", 
		load("res://Scenes/LevelIntro/MiniLevels/level_003.png")
	),
	3: LevelIntroDetail.create(
		"In real missions you have 5 nuts to collect. You need a minimum of 3 nuts to finish a stage. ", 
		"Some nuts are TOP SECRET. You need to search in the most obscure or well-guarded places to find them.", 
		load("res://Scenes/LevelIntro/MiniLevels/level_004.png")
	),
	4: LevelIntroDetail.create(
		"You can choose a gadget to make your life easier. Press E to use a gadget. Some of them can be used", 
		"once, others are passive and works by default. Agent N! Now, it's time for you to prove what you've learned.", 
		load("res://Scenes/LevelIntro/MiniLevels/level_005.png")
	),
	5: LevelIntroDetail.create(
		"Agent N, I have to say, you are pretty... ... pretty impressive, I mean. Ahem.", 
		"Your first mission is to rob the ancient Crackanut Pyramids. The Squirrel Pharaoh was sitting on a mountain of delicious treasures... Go ahead and stash as many nuts as you can! ", 
		load("res://Scenes/LevelIntro/MiniLevels/level_101.png")
	),
	6: LevelIntroDetail.create(
		"Let’s show the rich that sometimes, the nutty ones come out on top!", 
		"", 
		load("res://Scenes/LevelIntro/MiniLevels/level_102.png")
	),
	7: LevelIntroDetail.create(
		"Ha! Someone already got here before you? This tombs are almost completely cleaned out? It", 
		"must’ve been our arch-enemy, the nefarious Dr. Hamm...", 
		load("res://Scenes/LevelIntro/MiniLevels/level_103.png")
	),
	8: LevelIntroDetail.create(
		"Better watch your tail on the way out – his crew might still be lurking around...", 
		"", 
		load("res://Scenes/LevelIntro/MiniLevels/level_104.png")
	),
	9: LevelIntroDetail.create(
		"Looking good, Agent N! I'm glad you made it! Your next mission should be obvious – you", 
		"must rob the banks of Dr. Hamm. That greedy little rodent’s got half the city stuffed in his cheek pouches! Time to show him he’s messing with the wrong crew.", 
		load("res://Scenes/LevelIntro/MiniLevels/level_105.png")
	),
	10: LevelIntroDetail.create(
		"Fortu-nut-ely, I'm not keeping my money at this bank. I don't even have money. I'm a squirrel.", 
		"", 
		load("res://Scenes/LevelIntro/MiniLevels/level_106.png")
	),
	11: LevelIntroDetail.create(
		"These hyenas are sneaky, be extra cautious!", 
		"", 
		load("res://Scenes/LevelIntro/MiniLevels/level_107.png")
	),
	12: LevelIntroDetail.create(
		"Wow, you are amazing at this, let's keep on going!", 
		"", 
		load("res://Scenes/LevelIntro/MiniLevels/level_108.png")
	),
	13: LevelIntroDetail.create(
		"The last bank of Dr. Sterling Hamm... Set it all on fire!!!", 
		"", 
		load("res://Scenes/LevelIntro/MiniLevels/level_109.png")
	),
	14: LevelIntroDetail.create(
		"Alright, it's getting hot in here...", 
		"", 
		load("res://Scenes/LevelIntro/MiniLevels/level_110.png")
	),
	15: LevelIntroDetail.create(
		"Bad news, Agent N: it seems like we have been barking up the wrong tree... But I’ve just", 
		"got an intel on where that hamster’s secret warehouse is! On the North Pole! Dangerous and nut-urally tempting, huh? Just like you... Ahem. Good luck, Agent N!",  
		load("res://Scenes/LevelIntro/MiniLevels/level_201.png")
	),
	16: LevelIntroDetail.create(
		"Don't leave a single nut for this rascal...", 
		"", 
		load("res://Scenes/LevelIntro/MiniLevels/level_202.png")
	),
	17: LevelIntroDetail.create(
		"Where could that fat, greedy, bastard-of-a-hamster be?", 
		"", 
		load("res://Scenes/LevelIntro/MiniLevels/level_203.png")
	),
	18: LevelIntroDetail.create(
		"Here it is. The Royal Nut Hacienda... You gonna need all your nuts to do it, Agent.", 
		"Ready? Let’s get cracking!", 
		load("res://Scenes/LevelIntro/MiniLevels/level_204.png")
	),
	19: LevelIntroDetail.create(
		"These bad guys aren’t playing with pinecones... I’m rooting for you, Agent N! Legends say the", 
		"Nutcracker Blade is hidden here. It’s time to prove yourself worthy of such a weapon.", 
		load("res://Scenes/LevelIntro/MiniLevels/level_205.png")
	),
	20: LevelIntroDetail.create(
		"Hiding like a coward, hamster... Agent Nut is much-much braver than you...  ", 
		"", 
		load("res://Scenes/LevelIntro/MiniLevels/level_206.png")
	),
	21: LevelIntroDetail.create(
		"Oh my, oh my, you make me go nuts, Mr. N!", 
		"", 
		load("res://Scenes/LevelIntro/MiniLevels/level_207.png")
	),
	22: LevelIntroDetail.create(
		"Ha! Look, the nuts all have a message engraved: 'If found, please return to The", 
		" Royal Nut Hacienda.' So that's where your base is! We've got you, you little hoarder! I bet you wouldn’t want to lose a single one, huh? Agent N is coming for you, you little scoundrel...", 
		load("res://Scenes/LevelIntro/MiniLevels/level_208.png")
	),
	23: LevelIntroDetail.create(
		"Damn, I could imagine myself chilling in a castle like this all day long... Make sure to", 
		"look around, maybe there are some hidden nuts here.", 
		load("res://Scenes/LevelIntro/MiniLevels/level_209.png")
	),
	24: LevelIntroDetail.create(
		"Good rodent, my heart is racing... Best of luck, Agent N.", 
		"", 
		load("res://Scenes/LevelIntro/MiniLevels/level_210.png")
	),
	25: LevelIntroDetail.create(
		"Victory!!! Dr. Sterling Hamm is gone! I know you could do this, Agent N... Wait! You have a last", 
		"mission! Which is... Taking me on a date. :$ <3", 
		load("res://Scenes/LevelIntro/MiniLevels/level_210.png")
	)
}
