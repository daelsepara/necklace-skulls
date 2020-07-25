<INSERT-FILE "numbers">

<GLOBAL CHARACTERS-ENABLED T>
<GLOBAL STARTING-POINT PROLOGUE>

<CONSTANT BAD-ENDING "Your adventure ends here.">
<CONSTANT GOOD-ENDING "You have found your brother! Now your journey home begins!">

<OBJECT CURRENCY (DESC "cacao")>
<OBJECT VEHICLE (DESC "none")>

<CONSTANT DRINK-POTION-KEY-CAPS !\D>
<CONSTANT DRINK-POTION-KEY !\d>

<ROUTINE SPECIAL-INTERRUPT-ROUTINE (KEY)
	<COND (<EQUAL? .KEY DRINK-POTION-KEY-CAPS DRINK-POTION-KEY>
		<COND (<CHECK-ITEM ,MAGIC-POTION>
			<CRLF><CRLF>
			<TELL "Drink magic potion?">
			<COND (<YES?>
				<SETG LIFE-POINTS <+ ,LIFE-POINTS 5>>
				<COND (<G? ,LIFE-POINTS ,MAX-LIFE-POINTS> <SETG LIFE-POINTS ,MAX-LIFE-POINTS>)>
				<REMOVE ,MAGIC-POTION>
			)>
			<RTRUE>
		)>
	)>
	<RFALSE>>

<ROUTINE RESET-OBJECTS ()
	<RETURN>>

<ROUTINE RESET-STORY ()
	<RESET-TEMP-LIST>
	<PUT <GETP ,STORY008 ,P?DESTINATIONS> 1 ,STORY275>
	<PUT <GETP ,STORY048 ,P?DESTINATIONS> 1 ,STORY117>
	<PUT <GETP ,STORY060 ,P?DESTINATIONS> 3 ,STORY194>
	<PUT <GETP ,STORY071 ,P?DESTINATIONS> 1 ,STORY117>
	<PUT <GETP ,STORY091 ,P?DESTINATIONS> 2 ,STORY136>
	<PUT <GETP ,STORY094 ,P?DESTINATIONS> 2 ,STORY063>
	<PUTP ,STORY004 ,P?DEATH T>
	<PUTP ,STORY013 ,P?DEATH T>
	<PUTP ,STORY022 ,P?DEATH T>
	<PUTP ,STORY028 ,P?DEATH T>
	<PUTP ,STORY033 ,P?DEATH T>
	<PUTP ,STORY051 ,P?DEATH T>
	<PUTP ,STORY062 ,P?DEATH T>
	<PUTP ,STORY063 ,P?DEATH T>
	<PUTP ,STORY068 ,P?DEATH T>
	<PUTP ,STORY073 ,P?DEATH T>
	<PUTP ,STORY085 ,P?DEATH T>
	<PUTP ,STORY092 ,P?DEATH T>
	<PUTP ,STORY094 ,P?DEATH T>
	<PUTP ,STORY102 ,P?DEATH T>
	<PUTP ,STORY110 ,P?DEATH T>
	<RETURN>>

<CONSTANT DIED-IN-COMBAT "You died in combat">
<CONSTANT DIED-OF-HUNGER "You died of hunger and thirst">
<CONSTANT DIED-GREW-WEAKER "You grow weaker and eventually died">
<CONSTANT DIED-OF-THIRST "You go mad from thirst">
<CONSTANT KILLED-AT-ONCE "You are killed at once">

<ROUTINE ADD-QUANTITY (OBJECT "OPT" AMOUNT CONTAINER "AUX" QUANTITY CURRENT)
	<COND (<NOT .OBJECT> <RETURN>)>
	<COND (<NOT .CONTAINER> <SET CONTAINER ,PLAYER>)>
	<COND (<NOT .AMOUNT> <SET AMOUNT 1>)>
	<COND (<EQUAL? .CONTAINER ,PLAYER>
		<DO (I 1 .AMOUNT)
			<TAKE-ITEM .OBJECT>
		>
	)(ELSE
		<SET CURRENT <GETP .OBJECT ,P?QUANTITY>>
		<SET QUANTITY <+ .CURRENT .AMOUNT>>
		<PUTP .OBJECT ,P?QUANTITY .QUANTITY>
	)>>

<OBJECT LOST-SKILLS
	(DESC "skills lost")
	(SYNONYM SKILLS)
	(ADJECTIVE LOST)
	(FLAGS CONTBIT OPENBIT)>

<GLOBAL POINTS 0>

<ROUTINE LOSE-SKILLS ("OPT" MAX "AUX" COUNT ITEMS)
	<COND (<NOT .MAX> <SET MAX 1>)>
	<COND (<G? <COUNT-CONTAINER ,SKILLS> .MAX>
		<RESET-TEMP-LIST>
		<SET ITEMS <COUNT-CONTAINER ,SKILLS>>
		<SET COUNT 0>
		<DO (I 1 .ITEMS)
			<SET COUNT <+ .COUNT 1>>
			<COND (<L=? .COUNT .ITEMS>
				<PUT TEMP-LIST .COUNT <GET-ITEM .I ,SKILLS>>
			)>
		>
		<REPEAT ()
			<RESET-SKILLS>
			<SELECT-FROM-LIST TEMP-LIST .COUNT .MAX "skill" ,SKILLS>
			<COND (<EQUAL? <COUNT-CONTAINER ,SKILLS> .MAX>
				<CRLF>
				<TELL "You have selected: ">
				<PRINT-CONTAINER ,SKILLS>
				<CRLF>
				<TELL "Do you agree?">
				<COND (<YES?> <RETURN>)>
			)(ELSE
				<CRLF>
				<HLIGHT ,H-BOLD>
				<TELL "You must select " N .MAX " skill">
				<COND (<G? .MAX 1> <TELL "s">)>
				<TELL ,PERIOD-CR>
				<HLIGHT 0>
			)>
		>
		<DO (I 1 .COUNT)
			<COND (<NOT <IN? <GET TEMP-LIST .I> ,SKILLS>>
				<MOVE <GET TEMP-LIST .I> ,LOST-SKILLS>
			)>
		>
	)>>

<CONSTANT TEXT "This story has not been written yet.">

<CONSTANT PROLOGUE-TEXT "Last night you dreamed you saw your brother again. He was walking through a desert, his sandals scuffing up plumes of sooty black sand from the low endless dunes. It seemed you were hurrying to catch him up, but the sand slipped away under your feet and you could make no headway up the slop. You heard your own voice call his name: \"Morning Star!\" But muffled by distance, the words went rolling off the sky unheeded.||You struggled on. Cresting the dune, you saw your brother standing close by, staring at something in his hands. Your heart thudded with relief as you stumbled through the dream towards him. But even as your hand reached out for his shoulder, a sense of dread was growing like a storm cloud to blot out any joy. You saw the object Morning Star was holding: an obsidian mirror. You leaned forward and gazed at the face of your brother reflected in the dark green glass.||Your twin brother's face was the face of a skull.|||The soothsayer nods as you finish recounting the dream. He plays idly with his carved stone prophecy-markers, pouring them from one hand to the other with a light rattling sound.||\"Today is the day of Lamat,\" he says in his thin old voice. \"And the symbol of Lamat is the death's head. On this day, the morning-star has ended its cycle and will not be visible in the heavens for ninety days, when it will reappear as the evening-star. The meaning of the dream is therefore that in the absence of your brother it falls to you, Evening Star to fulfil his duties.\"||You cannot resist a smile, even though the ominous import of the dream weighs heavily on your soul. \"So it only concerns the importance of duty? I wonder if my clan elders have been speaking to you?\"||The soothsayer snorts and casts the prophecy-markers back into his bag with a pretence of indignation, but he has too good a heart to overlook your concern for your brother. Turning at the door, he adds, \"The King gave Morning Star a great honour when he made him his ambassador. But it is no less honourable to stay at home and help with the affairs of one's clan. You are young, Evening Star; your chance for glory will come.\"||\"Do the prophecy-makers also tell you that?\"||He rattles the bag. \"These? They're just for show; it's the two old stones on either side of my nose that tell me everything I need to know about the future!\" He points to his eyes and hobbles out in a gale of wheezing laughter.||You lean back, feeling the cool of the stone wall press against your bare shoulders. The soothsayer intended to set your mind at rest, but you have shared a bond with Morning Star since the two of you were born. To be troubled by such a dream is not, you feel sure, a mere quirk of the imagination. Somehow you sense that something terrible has befallen your brother.||You are still brooding an hour later when a servant comes scurrying into the room. \"There is news of Lord Morning Star's expedition...\" he begins, almost too frightened of your reaction to blurt out the words.||You are on your feet in an instant. \"What news?\"||The servant bows. \"The Council of Nobles is holding an emergency session. The rumour... I have heard a rumour that only a single member of the expedition returned alive.\"||Pausing only to draw on your cloak, you hurry outside and head along the street towards the city centre. All around you sprawl the tall thatched roofs of the city, spreading out towards the distant fields. Each clan or group of families has its own dwellings of stone or mud-brick, according to status. These rest upon raised platforms above the level of the street, their height determined again by status. But not even the most exalted noble has a home to match the grand dwellings of the gods, which you now see towering ahead of you atop their immense pyramids. They shimmer with the colours of fresh blood and polished bone in the noonday sunlight, covered with demonic carvings which stare endlessly down across the city of Koba.||The central plaza of the city is a blaze of white stone in the sunshine. Quickening your step, you approach the amphitheatre where the Council of Nobles is meeting. As you step under the arch of the entrance, your way is barred by two burly warriors of the King's guard, each armed with an obsidian-edged sword. \"You may not enter.\"||\"I am Evening Star. The ambassador is my brother. Has he returned to Koba?\"||One of them peers at you, recognition trickling like cold honey into his gaze. \"I know you now. Morning Star has not returned, no.\"||The other says, \"Look, I suppose you'd better go in. One of the ambassador's retinue came back this morning. He's telling the Council what happened.\"||You walk in to the amphitheatre and numbly find a seat. You can hardly take in the guard's words; they sit like stones in your head, impossible to accept. Can it be true? Your twin brother -- dead?||A man you recognize as one of Morning Star's veteran warriors stands in the centre of the amphitheatre, giving his report. The seats on either side are crowded with the lords and ladies of Koba, each face a picture of grave deliberation. At the far end is the King himself, resplendent in a turquoise mantle of quetzal feathers, his throne carved to resemble the open jaws of some titanic monster on whose tongue he seems to sit like the very decree of the gods.||\"...arrived at the Great City,\" the veteran is saying. \"We found it ransacked -- the temples torn down, whole palaces burned. Some poor wretches still live there, eking out a stark existence in the ruins, but it is like the carcass of a beast who lies with a death-wound. Whenever we asked how this destruction had come about, we received the same reply: werewolves from the land of the dead, beyond the west, had descended from the desert and slain all the Great City's defenders in a single night of carnage.\"||There is a murmuring at this. The Great City had endured for centuries before Koba was even built. The King raises his hand for silence. \"What was Lord Morning Star's decision when he heard this?\"||\"Majesty, he led us into the desert. He believed it his duty to uncover the truth of the matter and report it to you. After many days of trekking almost all our water was used up. We had faced monsters along the way, and many of us bore grievous injuries. Then we came to a place like a royal palace, but entirely deserted except for dogs and owls. We camped outside the walls there, and on the next day Morning Star told us he had dreamed of a sorcerer called Necklace of Skulls who dwelt within the palace. He said he would enter and find out if this sorcerer had sent the werewolves to destroy the Great City. We watched him enter the portals of the palace, and we waited for his return for eight days, but he did not emerge. Then we began the long march back here to Koba, but sickness and the creatures of the desert gradually took their toll, and I alone remain to tell the tale.\"||The King rises to his feet. \"Morning Star must be considered slain by this sorcerer. His mission shall not be recorded as a failure, since he died attempting to carry out his duty. Prayers shall be said for the safe journey of his soul through the underworld. This meeting is ended.\"||The others file out in groups, heads bent together in urgent debate. For most of them the veteran's report carried that special thrill of a distant alarm. A great but far-off city reduced to ruin; a disaster from halfway across the world. Cataclysmic news, but an event comfortingly remote from the day to day affairs at home. A matter for the noblemen to worry over when they sit with their cigars at night. The reverberations of a toppling temple in the Great City will be heard here in Koba as no more than the droning discussions of old men.||For you it is different. Left alone in the amphitheatre, you sit like a figure of clay, eerily detached from your own turbulent emotions. Fractured images and words whirl through your stunned brain. Morning Star is dead. Your twin brother, lost for ever...||A single sudden thought of burning clarity impels you to your feet. In that instant you seem to see your destiny unrolling in front of you like along straight carpet. You turn your face to the west, eyes narrowing in the glare of the declining sun.||Your brother might not be dead. There is only one place you can learn the truth.||You must journey to the western desert, to the palace of the sorcerer called Necklace of Skulls.">

<ROOM PROLOGUE
	(IN ROOMS)
	(DESC "PROLOGUE")
	(STORY PROLOGUE-TEXT)
	(CONTINUE STORY001)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT001 "Seeking an audience with the Matriarch of your clan, you are shown into a narrow steep-vaulted hall. Sunlight burns through the high window slits to leave hovering blocks of dazzling yellow light on the whitewashed wall, but the room is cool.||The Matriarch sits cross-legged on a stone bench at the end of the room, below a large painted glyph which is the symbol of the clan. A stout woman in late middle-age, she has a soft and even jolly appearance which is belied by the look of stern contemplation in her eyes. The beads sewn across here cotton mantle make a rustling sound as she waves you towards a straw mat. You bow in greeting before sitting, and a servant brings you a cup of frothy peppered cocoa.||The Matriarch fixes you with her glass-bead gaze. \"Evening Star, I understand you wish to leave Koba and travel in search of your brother.\"||\"I must learn what has happened to him, my lady. If he is alive, perhaps I can rescue him; if dead, it is my duty to avenge him.\"||The Matriarch folds her fat jade-ringed fingers and rests her chin on them, watching you as though weighing the worth of your soul. \"You speak of duty,\" she says. \"Have you no duty to your clan here in Koba? Does honour demand that we lose another scion in pursuit of a hopeless quest?\"||You sip cocoa while considering your next words carefully.">
<CONSTANT CHOICES001 <LTABLE "reply that the life of your brother is more important than your duty to the clan" "that on the contrary, clan honour demands that you go" "will you say nothing">>

<ROOM STORY001
	(DESC "001")
	(STORY TEXT001)
	(CHOICES CHOICES001)
	(DESTINATIONS <LTABLE STORY024 STORY047 STORY070>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT002 "The priest accepts your offering, glancing at the cacao with a slight smile before dropping them into his belt pouch. \"I consulted the oracle before you came, and here is the advice given. Travel first to the town of Balak on the northern coast. Do not put to sea at once; wait a week before you set sail. You might be tempted to put in at the Isle of the Iguana, but be warned that only an accomplished seafarer should venture out of sight of land.\"||\"What about the desert?\" you ask.||\"I told you already, buy a waterskin. And there's one other thing that the oracle revealed. You must seek the blood that is like sap.\"||\"Enigmatic,\" you say, considering this, \"but I suppose that's the way of oracles.\"||The priest beams happily. \"Just so. Before you go, can I interest you in a companion for the journey?\" He claps his hands, and a novitiate priest steps out from around the side side of the shrine carrying a bird on his arm.||You look from the high priest to the bird to the novitiate. \"A companion, you say? Do you mean this lad, or the owl?\"||\"The owl. The lad is needed here to trim the votive lamps in the shrine each evening. But I think you will find the owl a personable companion. Just keep it fed on small rodents and the like. The price is three cacao.\"||You peer closely at the owl. \"Isn't the owl the symbol of death? Additionally, unless I am much mistaken this bird has only one leg.\"||The high priest shrugs. \"Call it two cacao, then. And let me set your mind at rest: the owl is also a symbol of night and the moon.\"">

<ROOM STORY002
	(DESC "002")
	(STORY TEXT002)
	(PRECHOICE STORY002-PRECHOICE)
	(CONTINUE STORY093)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY002-PRECHOICE ()
	<REPEAT ()
		<TELL CR "Buy the owl (2 " D ,CURRENCY ")?">
		<COND (<YES?>
			<COND (<G? ,MONEY 1>
				<CHARGE-MONEY 2>
				<TAKE-ITEM ,OWL>
				<RETURN>
			)(ELSE
				<HLIGHT ,H-BOLD>
				<TELL CR "You do not have enough " D ,CURRENCY ,EXCLAMATION-CR>
				<HLIGHT 0>
			)>
		)(ELSE
			<RETURN>
		)>
	>>

<CONSTANT TEXT003 "You are suddenly embroiled in a furious fight while clinging precariously ten metres off the ground. The tree shakes with the stirrings of the mighty beast as it twists its taloned hand to and fro, rumbling its rage in a voice like a hurricane.||You have barely seconds to decide your tactics.">
<CONSTANT CHOICES003 <LTABLE "grab the arm and let it pull you inside the bole of the dead tree" "chop at it as it flails blindly for you">>

<ROOM STORY003
	(DESC "003")
	(STORY TEXT003)
	(CHOICES CHOICES003)
	(DESTINATIONS <LTABLE STORY141 STORY164>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT004 "You are not sure which nuts and berries are safe to eat, but extreme hunger forces you to make do. You wash the berries down with water from a brook. The meal is meagre and unsatisfying, but at least it eases the pangs in your stomach. Even so, you realize that you cannot survive for long if you don't find your way back to civilization.">

<ROOM STORY004
	(DESC "004")
	(STORY TEXT004)
	(PRECHOICE STORY004-PRECHOICE)
	(CONTINUE STORY279)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY004-PRECHOICE ()
	<LOSE-LIFE 1 DIED-OF-HUNGER ,STORY004>>

<CONSTANT TEXT005 "You steel your nerves and leap over the edge. The water rushes up to meet you, enfolding you in a silent icy embrace. The shock of impact drives the air out of your lungs and you start to fail wildly as you go under. The weight of your gold regalia drags you down, and as you fumble with the straps it becomes obvious that you will run out of air long before you can get free.||Then you remember your blowgun. Thrusting up through the water with it, you pierce the glimmering pane of light that marks the surface and blow into the other end until you have forced water out and can draw down a mouthful of fresh air. Using the blowgun as a breathing tube buys you the time you need to struggle out of the encumbering regalia and swim up to safety.||The moment your head breaks the surface you know you are no longer at the bottom of the sacred well. Instead of the open sky overhead, there is just the roof of a large cavern. Grey light trickles from an unseen source.||A familiar sound echoes off the surrounding rocks. You turn to see a canoe being slowly paddled towards you. But the two oarsmen are like no others on earth...">

<ROOM STORY005
	(DESC "005")
	(STORY TEXT005)
	(CONTINUE STORY097)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT006 "The forest, so lushly appealing when you first entered it, now seems a hellish green labyrinth. The tangled paths are indistinguishable. You might be going in circles. From here:">
<CONSTANT CHOICES006 <LTABLE "go right" "left" "straight ahead">>

<ROOM STORY006
	(DESC "006")
	(STORY TEXT006)
	(CHOICES CHOICES006)
	(DESTINATIONS <LTABLE STORY075 STORY160 STORY098>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT007 "You hear a sound. It is quiet and unsettling. It sounded like a rattling intake of breath in a dry dead throat. You have the sudden impression that something has become aware of your presence here. Something is watching you.||You look back. The tunnel behind the boat is now filled with ochre mist that hangs in the air in long sparkling veils. As you watch, you see the cloud getting thicker as more mist seeps out of the edges of the rock tombs.||The demon in the back of the canoe also takes a glance back. He pauses stock-still for a moment, then explodes into frantic action. Paddling furiously, he yells to the other demon, \"They've woken up! Let's get out of here!\"||Too late. The ochre cloud suddenly comes rushing forward as though blown by a blast of wind. The boat is completely enveloped. The demons are obviously expecting trouble and do not wait around. \"Abandon ship!\" you hear the one in the prow yelling, and then two heavy splashes can be heard as they jump overboard.||Phantom figures loom out of the mist, pressing their skeletal faces close to yours and clutching at you with thin fingers of yellow bone. You are rigid with terror; you cannot even find the breath to scream. The mist sends a chill deep into you that no fire will ever be able to warm again.|||The mist retreats as rapidly as it appeared, drawing back in long wisps into the rock tombs like smoke being sucked back into a row of pipes. But the danger is not over. Without the two oarsmen, your canoe is being carried out of control by the river current.">
<CONSTANT CHOICES007 <LTABLE "use a" "otherwise">>

<ROOM STORY007
	(DESC "007")
	(STORY TEXT007)
	(PRECHOICE STORY007-PRECHOICE)
	(CHOICES CHOICES007)
	(DESTINATIONS <LTABLE STORY099 STORY214>)
	(REQUIREMENTS <LTABLE ROPE NONE>)
	(TYPES <LTABLE R-SKILL R-NONE>)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY007-PRECHOICE ()
	<COND (,RUN-ONCE
		<EMPHASIZE "Your maximum Life Points score is permanently reduced by 2.">
		<SETG MAX-LIFE-POINTS <- ,MAX-LIFE-POINTS 2>>
		<COND (<G? ,LIFE-POINTS ,MAX-LIFE-POINTS> <SETG LIFE-POINTS ,MAX-LIFE-POINTS>)>
		<COND (<CHECK-SKILL ,SKILL-SEAFARING> <STORY-JUMP ,STORY076>)>
	)>>

<CONSTANT TEXT008 "As you go west, the land rises and becomes drier. You leave behind the lush forest, trekking first through windswept moorland and then dusty gulches lined with sparse bracken.||Ashaka is a hilltop citadel with palaces set on high terraces cut into the mountainside. It stares down across the scattered farming communities it rules, like an eagle glowering atop a cactus. As you start up the red-paved road that wends up to the citadel, you pass a small man who is bent and toothless with age. \"Going up to Ashaka, are you?\" he cackles. \"They'll be pleased!\"||\"Why is that?\" you ask.||He puts a finger to one nostril and snorts a gobbet of mucus onto the ground. \"They're after sacrifices,\" he says. \"Priests reckon the gods are annoyed. Must be bloody furious, if you ask me!\"||\"Eh?\" You are puzzled.||He fixes you with a canny stare. \"The Great City -- it's been sacked by dog-men from the western desert. It's going to take heap of sacrifices to get the gods to rebuild it, hah!\"||What he says is inconvenient if true, since you were relying on getting provisions in Ashaka.">
<CONSTANT CHOICES008 <LTABLE "go up anyway" "decide against visiting Ashaka by continuing to travel overland" "you can detour to the sea and travel up the coast to Tahil">>

<ROOM STORY008
	(DESC "008")
	(STORY TEXT008)
	(PRECHOICE STORY008-PRECHOICE)
	(CHOICES CHOICES008)
	(DESTINATIONS <LTABLE STORY275 STORY298 STORY228>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY008-PRECHOICE ()
	<COND (,RUN-ONCE
		<COND (<AND <CHECK-SKILL ,SKILL-SWORDPLAY> <CHECK-SKILL ,SKILL-ETIQUETTE>>
			<PUT <GETP ,STORY008 ,P?DESTINATIONS> 1 ,STORY252>
		)(ELSE
			<PUT <GETP ,STORY008 ,P?DESTINATIONS> 1 ,STORY275>
		)>
	)>>

<CONSTANT TEXT009 "You descend into the pyramid. The staircase is narrow, steep and dank. Lighting-strokes cast a guttering white glare from above, plunging you into darkness as they pass. The thundercracks in the sky resound ominously through the heavy stone blocks of the pyramid. The steps are slippery with damp, forcing you to make the descent slowly. At last you reach the bottom and pass through a doorway draped with thick fleshy roots. A tunnel stretches ahead which you have to feel your way along. No light penetrates this far down. The smell in the air is of damp soil and limestone.||The walls vibrate as another thunderbolt shakes the earth. Suddenly you are knocked off your feet by a heavy weight of rubble dropping on you. You realize the tunnel has caved in. Claustrophobia seizes you. Struggling in panic, you claw at the rubble in a frantic attempt to dig yourself free.||Your hands break through to the air and you push up, gasping for breath. You are no longer in the underground tunnel, though. You have emerged into an unearthly landscape. A barren plain stretches away in all directions under a sky of red-tinged darkness. In the distance you can see a haze of sulphurous clouds lit by fiery light: the lip of volcanic fissure. You head towards it">

<ROOM STORY009
	(DESC "009")
	(PRECHOICE STORY009-PRECHOICE)
	(CONTINUE STORY080)
	(CODEWORD CODEWORD-PAKAL)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY009-PRECHOICE ()
	<COND (<CHECK-ITEM ,JADE-BEAD>
		<EMPHASIZE "You lodged the jade bead under your tongue as the spirit advised you.">
	)>
	<CRLF>
	<TELL TEXT009>
	<TELL ,PERIOD-CR>>

<CONSTANT TEXT010 "He pretends to listen with interest to your confident reply, but then gives a great whoop of mocking laughter. You realize he lied -- he knows nothing that can help you in your quest.">

<ROOM STORY010
	(DESC "010")
	(STORY TEXT010)
	(PRECHOICE STORY010-PRECHOICE)
	(CONTINUE STORY060)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY010-PRECHOICE ()
	<COND (<CHECK-ITEM ,JADE-BEAD> <STORY-JUMP ,STORY056>)>>

<CONSTANT TEXT011 "As the sun sets, the pitcher on the woman's shoulder tilts, falling to reveal that our guess was right -- there is a second head protruding from her neck!||The nightcrawler's eyes snap open and fix on you, and its mouth drops open in a gurgling snarl. Long strands of black hair shoot out from it like tentacles, some of them up to two metres long. These form into thin matted stalks resembling an insect's legs, which probe the ground, preparing to support the creature's weight- There is a grisly sucking sound as the nightcrawler pulls itself free of the sleeping woman's neck.||It comes scuttling forward eagerly on its limbs of twined hair and leaps up towards your neck, intending to make you its new host, but you are ready for it. It blunders straight into the net which your magic has woven out of moonbeams and river mist. It struggles and gnashes its long teeth, but it cannot break free of the net. Taking it to the river bank, you cast it into the water. \"And good riddance,\" you say as it sinks to a final resting place on the river bed.">

<ROOM STORY011
	(DESC "011")
	(STORY TEXT011)
	(CONTINUE STORY398)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT012 "Cleverness is not so much a question of intelligence. It has a lot to do with just having a smart attitude. Where others look for the obvious answer to any problem, you have a habit of being contrary -- of always trying the unexpected first. You find it usually works.||Like now: the average person would climb to the top of the steps and probably have to tackle some devious puzzle or demonic monster in the shrine above. You check out the opposite approach, and discover that the steps not only lead up but also descend beneath the water. It's a near certainty that this is the route you must take.">

<ROOM STORY012
	(DESC "012")
	(STORY TEXT012)
	(CONTINUE STORY105)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT013 "A peasant shows up at last, emerging on the adjacent ledge beside the river. Time passes in a dream-like way here; you cannot tell if hours or days have gone by while you were waiting. You keenly feel the urgency of your quest.||The noble gets to his feet. \"Since I was here first, I shall travel on with this man,\" he says to you once he has explained the situation to the peasant. \"No doubt another poor man will arrive eventually. I'll throw back the poles once I'm across, so that you will be able to use them.\"||Despite the fact that he was here first, you have to insist that you go across at once. He reacts with indignation, and a struggle ensues. A life of luxury has left him no match for you, with your ardency and youthful vigour. You subdue him and take the pole for yourself.">
<CONSTANT TEXT013-CONTINUED "Hooking your pole with the peasant's, the two of you are able to cross the obsidian beams by setting your feet against the flat sloping sides of the beams and using your weight to counterbalance each other. When you reach the far side, you throw the poles back to the noble, but he is so enraged that he allows them to fall into the river. \"May all the gods curse you!\" he cries, shaking his fist. \"You are without honour!\"||You shrug and turn away. Though you regret what you had to do, it was necessary if you are to save your brother.">

<ROOM STORY013
	(DESC "013")
	(STORY TEXT013)
	(PRECHOICE STORY013-PRECHOICE)
	(CONTINUE STORY036)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY013-PRECHOICE ()
	<COND (<NOT <OR <CHECK-SKILL ,SKILL-SWORDPLAY> <CHECK-SKILL ,SKILL-UNARMED-COMBAT>>>
		<LOSE-LIFE 1 DIED-IN-COMBAT ,STORY013>
	)>
	<IF-ALIVE TEXT013-CONTINUED>>

<CONSTANT TEXT014 "You address the sentinel by what you think is his name, only to realize your mistake at once. He gives a high howl of immortal outrage and lashes out with his bone sceptre. It slices through the air like a falling star, giving you no chance to react. You hear yourself cry out in agony at the blow, but the curious thing is that you never discover where you have been hurt. By the time you look down, you are already dead.">

<ROOM STORY014
	(DESC "014")
	(STORY TEXT014)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT015 "The warrior stands looking at the hydra's body for a few moments in frank astonishment, then turns and nods to you. \"Well done,\" he says. \"Few men could have equalled that feat.\"||\"My name is Evening Star,\" you tell him. \"I am from the city of Koba, and I have travelled the breadth of the world in search of my brother.\"||\"I am Stooping Eagle, until recently a lord of the Great City. I had been on a voyage, and returned to discover my home had been ransacked by werewolves and night demons. All my people are either slain or fled, and the Great City is now a sad empty ruin. Thus I have come to wreak vengeance on the one responsible: a sorcerer known as Necklace of Skulls.\"||\"Then we are partners in the same quest, for I too desire the sorcerer's death.\"||\"I had heard he was already dead, but none the less active for that,\" says Stooping Eagle. He turns and surveys the moonlit dunes. \"But the desert is wide, and I have been searching for his palace since the morning star last rose.\"||You smile at the unconscious aptness of his remark. \"It is close,\" you assure him. \"I feel sure of it.\"||You walk through the night, sheltering by day in the shade of a crag before heading on a sunset. After several hours Stooping Eagle unstoppers his waterskin and rations out a few sips. It is barely enough to moisten his lips, but he looks like a man who is used to austerity.">

<ROOM STORY015
	(DESC "015")
	(STORY TEXT015)
	(PRECHOICE STORY015-PRECHOICE)
	(CONTINUE STORY246)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY015-PRECHOICE ()
	<COND (<CHECK-ITEM ,WATERSKIN>
		<STORY-JUMP ,STORY220>
	)(<CHECK-SKILL ,SKILL-ETIQUETTE>
		<STORY-JUMP ,STORY223>
	)>>

<CONSTANT TEXT016 "You clear the pit with one athletic bound. Looking back at the watching courtiers, you see their expectant grins turn to hang-dog expressions of disappointment. Your cocksure mood is deflated a moment later, though, when they come bounding across the pit themselves. There is not a single one of them who is less agile than you.||You manage to muster a confident smile as you say, \"Well, I've passed your first test.\"||\"That little thing?\2 says the chief courtier with a scornful glance at the pit of coals. \"That wasn't a test -- more a sort of joke to welcome you. The real tests are still to come.\"">

<ROOM STORY016
	(DESC "016")
	(STORY TEXT016)
	(CONTINUE STORY431)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT017 "Your eyes can make out nothing in the inky darkness that engulfs you. As you squat down on the guano-crusted floor, there comes a flapping of leathery wings and the first of the bats comes swooping down towards you. You throw up your arm, fending it off with a sob of horror.||Although you try to stay alert throughout the night, fatigue finally overcomes you and you sink into a fitful sleep.">
<CONSTANT TEXT017-CONTINUED "You awaken hours later to discover that the bats have been gorging on your blood. You are covered with tiny sores where they have chewed into your veins. You huddle miserable against the wall to wait for dawn.">

<ROOM STORY017
	(DESC "017")
	(STORY TEXT017)
	(PRECHOICE STORY017-PRECHOICE)
	(CONTINUE STORY041)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY017-PRECHOICE ()
	<LOSE-LIFE 1 DIED-GREW-WEAKER ,STORY017>
	<IF-ALIVE TEXT017-CONTINUED>>

<CONSTANT TEXT018 "You set the skull gently on the dusty ground and take a few paces back, raising your wand.||Necklace of Skulls sees what you are planning and speaks in protest from the inner recesses of his shrine: \"You cannot resurrect him. You do not have that power.\"||\"Raw determination is the basis of all magic,\" you counter. \"My love for my brother will bring him back.\"||This is the hardest spell you will ever cast. For almost an hour you continue the chant. The wolfish courtiers do not intervene, fearing your power. For his part, Necklace of Skulls is happy to indulge you. He wants to see you fail. You are determined to disappoint him.||Searingly bright light envelops the skull like a phosphoric bubble from which long green sparks go crawling out along the ground. The wand grows hoot in your hand as it channels more magical force than it was ever intended to contain. At last you know you can do no more. Hoarsely uttering the last syllables of the spell, you slump to your knees.||There is a gasp from the watching courtiers, a howl of spite from the sorcerer. You look up. An hour of staring into the heart of the spell-glare has left a flickering after-image across your vision, but you are sure you can see something stirring. It looks like a man. He rises to his feet and steps towards you. You rub your eyes, then a familiar voice brings tears of joy to them. \"Evening Star,\" he says. Your brother is alive once more!||You have used up all your sorcery in working this miracle.">

<ROOM STORY018
	(DESC "018")
	(STORY TEXT018)
	(PRECHOICE STORY018-PRECHOICE)
	(CONTINUE STORY042)
	(CODEWORD CODEWORD-VENUS)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY018-PRECHOICE ()
	<COND (<CHECK-CODEWORD ,CODEWORD-ANGEL> <REMOVE ,CODEWORD-ANGEL>)>
	<EMPHASIZE "You have lost the SPELLS skill.">
	<MOVE ,SKILL-SPELLS ,LOST-SKILLS>>

<CONSTANT TEXT019 "You have time to take a single step towards the black pyramid, then a howl rings out from the shrine -- a howl of such gruesome fury that your sweat runs icy on your brow. The courtiers abandon any semblance of human form and, transforming into wild dogs, scatter with yelps of fear.||The shadow men dissolve as Necklace of Skulls draws all his power back into himself. There is a rumbling from deep within the pyramid. The roof of the shrine trembles, then splits apart as something rises up through it. The pillars topple; masonry blocks crack open. Necklace of Skulls stands revealed atop the pyramid.||He is twice the height of a man -- a parody of human form with dead grey features and grotesquely long limbs with too many joints. The eyes are deep sockets under a caul of shrivelled flesh. His robe is sewn from ragged strips of blood-drenched skin; you realize with a shudder they are the flayed skins of men. Around his neck hangs a long chain of gore-spattered skulls, each with living eyes filled with eternal torment.||Necklace of Skulls stands in the rubble of his shrine like a loathsome insect just emerged from a chrysalis. He points a thin finger at you. \"Evening Star,\" he hisses. \"Now you will know the taste of death.\"">
<CONSTANT CHOICES019 <LTABLE "use a blowgun" "a wand" "close in for a melee -- either by charging straight at him" "zigzagging as you run">>

<ROOM STORY019
	(DESC "019")
	(STORY TEXT019)
	(CHOICES CHOICES019)
	(DESTINATIONS <LTABLE STORY204 STORY227 STORY250 STORY273>)
	(REQUIREMENTS <LTABLE SKILL-TARGETING SKILL-SPELLS NONE NONE>)
	(TYPES <LTABLE R-SKILL R-SKILL R-NONE R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT020 "There is a raft moored beside the jetty. It starts to move of its own accord once you have climbed aboard and cast off. You are conveyed across the lake. You are shivering because of the deep chill in the air here. The waters stirs sluggishly in the raft's wake, as though on the point of freezing.||Green light seeps into the sky, which you now see resembles the roof of an unimaginably vast cavern. Perhaps you are gazing up the bedrock on which the living world rests. The notion sends a shudder through your whole body.||Your journey seems to take hours. Other than the faint sloshing of water past the sides of the raft, there is dead silence. At last you catch sight of something ahead. It is a steep pyramid built in the middle of the lake, with steps leading right up from the water to a shrine at the top.||The raft drifts to a halt beside the steps. You are puzzled. Is this the journey's end? Here, surrounded by leagues of water in all directions?">

<ROOM STORY020
	(DESC "020")
	(STORY TEXT020)
	(PRECHOICE STORY020-PRECHOICE)
	(CONTINUE STORY058)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY020-PRECHOICE ()
	<COND (<CHECK-SKILL ,SKILL-CUNNING>
		<STORY-JUMP ,STORY012>
	)(<CHECK-SKILL ,SKILL-CHARMS>
		<STORY-JUMP ,STORY035>
	)>>

<CONSTANT TEXT021 "You soon discover that it is possible to dig a tunnel throughout the sand underneath the barrier of flame. It is the work of just a few minutes to return Jade Thunder's wand to him.||\"I wonder why I never thought of that,\" he muses.\"When you have matchless magical power, why bother with ingenuity?\" you suggest.||He sucks his teeth and gives you a narrow look. \"Oh yes.\"">

<ROOM STORY021
	(DESC "021")
	(STORY TEXT021)
	(CONTINUE STORY091)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT022 "Blistering waves of heat rise form the rocks. Dazzled and soaked in sweat, you stumble on under the harsh sun. The ground is cracked and dry. Pinnacles of wind-blasted rock poke up like gnarled fingers into the sky. High above, the vultures circle in a long lazy sweep. They are content to wait until you are too weak to go on. Days and nights become a blur of torment.">

<ROOM STORY022
	(DESC "022")
	(STORY TEXT022)
	(PRECHOICE STORY022-PRECHOICE)
	(CONTINUE STORY069)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY022-PRECHOICE ()
	<COND (<CHECK-ITEM ,WATERSKIN>
		<LOSE-LIFE 2 DIED-OF-THIRST ,STORY022>
		<COND (<IS-ALIVE>
			<EMPHASIZE "You waterskin has been emptied.">
			<LOSE-ITEM ,WATERSKIN>
		)>
	)(ELSE
		<PUTP ,STORY022 ,P?DEATH F>
		<STORY-JUMP ,STORY322>
	)>>

<CONSTANT TEXT023 "\"Why were you counting the stars anyway?\" you ask him.||Brows like stone lintels tilt in a weighty frown. \"I can't remember,\" he admits at last.||\"But it must have been important?\"||\"I suppose so...\" he murmurs distractedly, still puzzling over the problem.||\"So I ought to get a reward?\"||His lips tighten like cooling lava. \"Ah, I see. You want payment for your service. Well, I suppose so. What will you take: health, wealth or sound advice?\"||You ponder the choice for a few moments, prompting him to a grunt of irritation: \"Decide quickly, since I now have another problem to occupy my time!\"">
<CONSTANT CHOICES023 <LTABLE "choose health" "wealth" "advice">>

<ROOM STORY023
	(DESC "023")
	(STORY TEXT023)
	(CHOICES CHOICES023)
	(DESTINATIONS <LTABLE STORY044 STORY067 STORY090>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT024 "Convinced though you are by the strength of this argument, the Matriarch seems unimpressed. \"I wonder what you will find?\" she muses. \"The truth as to Morning Star's fate, perhaps. But also you may discover a deeper truth.\"||She turns aside to gaze up at the shimmering sunbeams slanting through the windows, showing her profile in an expression of disdain. \"You are useless to the clan until you learn wisdom, Evening Star. Depart whenever you wish.\"||She says nothing more. Awkwardly, you get to your feet and retreat from the room with a hesitant bow.">

<ROOM STORY024
	(DESC "024")
	(STORY TEXT024)
	(CONTINUE STORY093)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT025 "The causeway to Yashuna is an arrow-straight road of packed limestone raised on stone blocks above the level of the countryside. As you walk, you scan the swaying fields of maize, the orchards and ranks of cotton plants that stretch off as far as the eye can see. Low stone walls mark the irrigation channels that ensure as much water as possible reaches the crops at this arid time of year. Peasant dwellings are scattered here and there across the countryside: oval single-storey buildings with sharply peaked roofs of dry thatch. It makes you thirsty just to watch the peasants at their back-breaking work, gathering cotton in long sacks under the sweltering sun.||A dusty grove of papaya trees overhangs the causeway. Your mouth waters as you look at them. Surely on one would mind if you took just one papaya? As you reach up to pick one of the fruits, there is a sudden flurry of movement from the bole of the tree. You go rigid, and a thrill of clammy fear chills you despite the heat of the day. Poised atop the fruit is a tarantula! Its huge black forelimbs are resting on your fingers, and you can see the wet coating of venom on its fangs.">
<CONSTANT CHOICES025 <LTABLE "jerk your hand away quickly" "slowly reach around with your other hand to seize the tarantula from behind">>

<ROOM STORY025
	(DESC "025")
	(STORY TEXT025)
	(PRECHOICE STORY025-PRECHOICE)
	(CHOICES CHOICES025)
	(DESTINATIONS <LTABLE STORY071 STORY094>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY025-PRECHOICE ()
	<COND (<CHECK-SKILL ,SKILL-WILDERNESS-LORE> <STORY-JUMP ,STORY048>)>>

<CONSTANT TEXT026 "With infinite care you delve into the gloomy hole and deftly remove the gold diadem. Clinging to the side of the tree, you clean off the moss and muck and examine your prize. It is a circlet such as a king or high priest might wear upon his row, patterned with holy sigils and bearing the cruciform symbol of the World Tree in inlaid plaques of jade. Such an item could fetch you a fortune in any market in the world.||Climbing back down to the ground, you sense the stabai hovering close beside you, bending heir elongated skulls closer as they admire your find. \"It is a great treasure, as we promised,\" says one with a trace of envy in her voice. \"Now return our shawl.\"||\"When I'm safely out of these woods, then I'll consider it,\" you snap back. \"Not before.\"">

<ROOM STORY026
	(DESC "026")
	(STORY TEXT026)
	(CONTINUE STORY390)
	(ITEM GOLD-DIADEM)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT027 "Seeing your look of horror, one of the men prods the fire with a stick and says, \"We're roasting a monkey. Looks pretty gruesome, doesn't it? Tastes delicious, though.\"||Filled with relief to discover that they are not cannibals after all, you join the jungle people in their meal. You soon learn that you have them to thank for the herbs that cured your fever.">
<CONSTANT TEXT027-CONTINUED "When you are ready, you leave the jungle people and resume your journey">

<ROOM STORY027
	(DESC "027")
	(STORY TEXT027)
	(PRECHOICE STORY027-PRECHOICE)
	(CONTINUE STORY118)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY027-PRECHOICE ()
	<COND (<CHECK-ITEM ,SHAWL>
		<STORY-JUMP ,STORY436>
	)(ELSE
		<CRLF>
		<TELL TEXT027-CONTINUED>
		<TELL ,PERIOD-CR>
	)>>

<CONSTANT TEXT028 "The sun casts its dusty gold light across the treetops to the west, awakening glints in your ceremonial regalia. Summoning up all your courage, you take the final step that carries you off the brink into oblivion. The water rushes up to meet you -- an icy slap, followed by darkness and a roaring silence. You are enfolded in a watery womb, numbly struggling out of the metal accoutrements that are carrying you down into the furthest depths of the well.||Bloody darkness thunders through your brain. There is no sign of the sunlit surface of the water overhead. You feel as though you are trapped on the border between sleeping and waking, and in the instant of departing consciousness you know you are not in the bottom of the well any more. You have plunged into the fabled river that leads out of the world of the living. You are on your way to the Deathlands.">

<ROOM STORY028
	(DESC "028")
	(STORY TEXT028)
	(PRECHOICE STORY028-PRECHOICE)
	(CONTINUE STORY119)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY028-PRECHOICE ()
	<LOSE-LIFE 3 DIED-GREW-WEAKER ,STORY028>>

<CONSTANT TEXT029 "You push through a bank of ferns and pause to get your breath back. You have been walking for hours in the sweltering heat. Moisture trickles down off the leaf canopy, but you cannot even tell if it is rain or just condensation. If only you could get a clear look at the sky, you might be able to tell which way to go.">
<CONSTANT CHOICES029 <LTABLE "decide to head left from here" "go right" "go straight on">>

<ROOM STORY029
	(DESC "029")
	(STORY TEXT029)
	(CHOICES CHOICES029)
	(DESTINATIONS <LTABLE STORY144 STORY075 STORY098>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT030 "Nachan is the busy hub of trade up and down the river, so there are hundreds of boats bobbing up and down at the jetty waiting to unload their wares. You wend your way between bales of grain, fruit, feathers, jade and animal pelts. Most of the trader's vessels are dug-out canoes, but you see one crescent-shaped boat constructed of interwoven reeds. You guess that the owner is not from the wooded country upriver, but must be a native of the fens which lie between here and the coast. Seeing you approach, he straightens up from the task of loading clay pots aboard the boat and winces as he rubs his aching back.||\"Good morning,\" you say to him. \"If you're going downriver, I wonder if you have room for a passenger?\"||He looks you up and down. \"If you have two cacao to spare.\"||\"Two cacao!\" you cry in outrage. \"That is an exorbitant sum. I will offer--\"||The fenman holds up his hand to interrupt you. \"Haggling is pointless,\" he says. \"You would take up as much space as two large pitchers, and the profit I make on each pitcher is one cacao. Consequently you must pay a fee of two cacao to compensate me for my loss of earnings if I take you aboard.\"">
<CONSTANT CHOICES030 <LTABLE "pay him" "else make your way north on foot">>

<ROOM STORY030
	(DESC "030")
	(STORY TEXT030)
	(PRECHOICE STORY030-PRECHOICE)
	(CHOICES CHOICES030)
	(DESTINATIONS <LTABLE STORY355 STORY264>)
	(REQUIREMENTS <LTABLE 2 NONE>)
	(TYPES <LTABLE R-MONEY R-NONE>)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY030-PRECHOICE ()
	<COND (<CHECK-SKILL ,SKILL-SEAFARING> <STORY-JUMP ,STORY332>)>>

<CONSTANT TEXT031 "The folktales of heroes who have ventured into the underworld are as fresh in your mind now as when they were first told to you in infancy. You know that on no account must you part with the bead until you reach the crossroads where four coloured paths meet. The two demons are just tying to trick you. You make curt gestures of dismissal and turn away from them.">

<ROOM STORY031
	(DESC "031")
	(STORY TEXT031)
	(CONTINUE STORY053)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT032 "You give them a puzzled look, your face the very picture of innocence as you reply: \"An owl? Not at all -- my gift was a fine cloak of quetzal feathers with a jade clasp. I think that fellow over there presented the owl...\"||You point to a fretful-looking gentleman who has been pacing along the colonnade for several minutes. You noticed him send in a gift earlier, but he failed to bribe the courtier sufficiently and does not realize he will be kept waiting as a result. He looks up with a bemused half-smile as the guards go striding over to him. The smile soon turns to a look of horror as they start to pummel him with their staves. Cowering under the hail of blows, he goes hobbling off through the crowd of onlookers. Meanwhile you take the opportunity to slink away before anyone finds out the truth.">

<ROOM STORY032
	(DESC "032")
	(STORY TEXT032)
	(CONTINUE STORY308)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT033 "You walk into the jaws of the dragon and descend the long tunnel of his throat until the only light is a dim flicker in the gloom far behind you. Hot gases bubble up out of the chambers of his stomach, forcing you to hold your hand over your face as you proceed.||It gets hotter. You cannot see much of your surroundings, but you reckon that you must now be passing through the dragons bowels. This is the part of his body that lies in the lava at the bottom of the canyon. Such intense temperatures obviously do not bother the dragon, but you are getting weaker by the minute. You stagger on, head swimming from the stinking gases and the burning heat.">
<CONSTANT TEXT033-CONTINUED "You realize that at last the passage is beginning to slop upwards again. You are climbing out of the canyon, towards the dragon's other head. Sure enough , the awful heat gradually subsides. When you reach the top of your gruelling ascent, however, a further shock awaits you. The dragon's hind and jaws are closed. You are trapped in here.">
<CONSTANT TEXT033-END "Your days will end in the maw of the the dragon">

<ROOM STORY033
	(DESC "033")
	(STORY TEXT033)
	(PRECHOICE STORY033-PRECHOICE)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY033-PRECHOICE ()
	<LOSE-LIFE 5 DIED-GREW-WEAKER ,STORY033>
	<COND (<IS-ALIVE>
		<CRLF>
		<TELL TEXT033-CONTINUED>
		<TELL ,PERIOD-CR>
		<COND (<CHECK-SKILL ,SKILL-SPELLS>
			<STORY-JUMP ,STORY439>
		)(<CHECK-SKILL ,SKILL-CUNNING>
			<STORY-JUMP ,STORY428>
		)(<CHECK-ITEM ,CHILLI-PEPPERS>
			<STORY-JUMP ,STORY125>
		)(ELSE
			<CRLF>
			<TELL TEXT033-END>
			<TELL ,PERIOD-CR>
			<PUTP ,STORY033 ,P?DEATH T>
		)>
	)>>

<CONSTANT TEXT034 "You moisten a little salt and rub it onto your neck as a precaution. You do not need much, so you can retain the rest of the parcel in case you need it later.">

<ROOM STORY034
	(DESC "034")
	(STORY TEXT034)
	(PRECHOICE STORY034-PRECHOICE)
	(CONTINUE STORY057)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY034-PRECHOICE ()
	<GAIN-CODEWORD ,CODEWORD-SALVATION>
	<COND (<CHECK-ITEM ,LOBSTER-POT> <STORY-JUMP ,STORY081>)>>

<CONSTANT TEXT035 "Your amulet is held around your neck by a thong, which snaps as you are getting off the raft. You give a yelp of alarm and try to grab the amulet before it falls into the water, but for once luck is not with you and it slips through your fingers. However, instead of sinking without trace the amulet comes to rest just under the surface. You stoop to retrieve it, and in doing so you notice something rather interesting; the stairway does not just lead up to the shrine atop the pyramid; it also leads down beneath the lake.||Is that the route you should take? Or is there some secret you must discover inside the shrine first? As you resecure the amulet around your neck, you ponder your next action.">
<CONSTANT CHOICES035 <LTABLE "ascend to the shrine" "descend into the water">>

<ROOM STORY035
	(DESC "035")
	(STORY TEXT035)
	(CHOICES CHOICES035)
	(DESTINATIONS <LTABLE STORY058 STORY105>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT036 "You trudge on until you come to a well. On a ridge ahead stands a kapok tree with its upper branches surrounded by the mass of water that hangs above the Deathlands. Squinting in the intense unremitting sunlight, you can make out some figures reclining in the shade of its foliage.">

<ROOM STORY036
	(DESC "036")
	(STORY TEXT036)
	(PRECHOICE STORY036-PRECHOICE)
	(CONTINUE STORY180)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY036-PRECHOICE ()
	<COND (<CHECK-ITEM ,JADE-BEAD>
		<CRLF>
		<TELL "Do you wish to discard the " D ,JADE-BEAD "?">
		<COND (<YES?>
			<LOSE-ITEM ,JADE-BEAD>
			<STORY-JUMP ,STORY174>
		)>
	)>>

<CONSTANT TEXT037 "You have passed two of the sentinels; there are two still to go. The next proves to be a lank bone-white demon with a sharply featured face that gives him an almost serpentine look. He holds a leaf-shaped knife of white onyx in each hand, tilting them like fans as he stoops to peer at you.||\"Your name?\" The words ooze out of his mouth like venom.||\"Evening Star,\" you reply.||He nods and an ugly lipless smile curls his long mouth, \"Good. Now address me with proper respect, Evening Star. Address me by name.\"||What do you think his name is:">
<CONSTANT CHOICES037 <LTABLE "say that his name is Lord Blood" "Lord Skull" "Thunderbolt Laughter">>

<ROOM STORY037
	(DESC "037")
	(STORY TEXT037)
	(CHOICES CHOICES037)
	(DESTINATIONS <LTABLE STORY084 STORY129 STORY062>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT038 "The servant falls to his knees with his arms clasped around your legs. he is racked with grief for his dead master, and begs you to restore the man to life. He must think you are some kind of miracle-worker. Understandable, since he has just seen you slay a monster that seemed more than a match for any ten normal men.">
<CONSTANT CHOICES038 <LTABLE "try to revivify the dead man, though it would probably use up all your magical power" "alternatively you can expend your magic using a" "or a" "otherwise">>

<ROOM STORY038
	(DESC "038")
	(STORY TEXT038)
	(CHOICES CHOICES038)
	(DESTINATIONS <LTABLE STORY108 STORY130 STORY153 STORY176>)
	(REQUIREMENTS <LTABLE SKILL-SPELLS GOLD-DIADEM CHALICE-OF-LIFE NONE>)
	(TYPES <LTABLE R-SKILL R-ITEM R-ITEM R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT039 "You place it across the pit and walk across. When you reach the other side and turn to retrieve your makeshift bridge, however, the chief courtier whisks it away and snaps it across his knee. \"That was cheating,\" he says ill-temperedly.||\"How was I to know? You didn't mention any rules.\"||His scowl melts into a sly smile. He is obviously a creature of volatile moods. \"That's the kind of game we play around here. You discover the rules when you break them.\"||He tosses the broken item aside and takes a great leap which carries him right across the pit. The other courtiers follow with equal agility.">

<ROOM STORY039
	(DESC "039")
	(STORY TEXT039)
	(PRECHOICE STORY039-PRECHOICE)
	(CONTINUE STORY431)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY039-PRECHOICE ()
	<COND (<CHECK-ITEM ,BLOWGUN>
		<LOSE-ITEM ,BLOWGUN>
	)(<CHECK-ITEM ,SPEAR>
		<LOSE-ITEM ,SPEAR>
	)>>

<CONSTANT TEXT040 "\"I have survived all the ordeals,\" you say to the courtiers, \"and now I demand to see your master -- the sorcerer Necklace of Skulls.\"||They watch you with smouldering eyes, but the cocksure sneering looks with which they first greeted you are gone now. By passing the five tests you have earned their respect -- perhaps even their fear. As they escort you to the gateway of bones at the rear of the courtyard, the chief courtier studies you with a long sidelong stare before saying, \"You have got further than any mortal I can remember. But our master will crush you as I might crack a flea between my fingernails.\"||With a hollow rattling noise, the great gates swing inwards to reveal an avenue whose walls slope outwards on either side of you. The black pyramid stands at the far end of the avenue, its steep flanks clad in a block of cold shade that defies the harsh sunlight. The courtiers scatter at a signal you do not hear, rushing off with loping gaits that betray their half-canine ancestry. Climbing stone staircases, they take up positions along the top of the sloping walls.||As you take a step forward along the avenue, you notice rings set hip on the side walls. It is like the arena in which the sacred ball contest is played, and those stone rings are the goals.||You round angrily on the chief courtier, who is still standing close at your shoulder. \"What is this?\" you shout. \"I haven't come to play games! You told me I was going to meet Necklace of Skulls at last!\"||\"I am here,\" echoes a sepulchral voice from the depths of the shrine atop the pyramid. \"Now let the game begin.\"">

<ROOM STORY040
	(DESC "040")
	(STORY TEXT040)
	(CONTINUE STORY317)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT041 "You are waiting by the door when the dog-like courtiers come to release you in th e morning. The chief is not with them, but later in the day he comes over to where you are sitting at the edge of the plaza and asks: \"How are you enjoying your stay?\"||\"If I were to be candid, I would say your hospitality leaves much to be desired,\" you reply, forcing a note of flippancy into your voice with some effort. \"But I feel this can be excused on the grounds that you received few visitors in these parts.\"||\"On the contrary,\" he says with a broad smile, \"we often have people for dinner.\"||Stifling a shudder at this veiled threat, you ask what your next ordeal is to be.||He glances at the sound, which is already declining in the sky. \"You will shortly discover that for yourself. We call it the House of Knives.\"||Soon afterwards you are taken to the third building. Here the floor is covered with knives of sharp green obsidian. As the sun sets, the knives come to life, springing up to slice at the air expectantly. The door crunches solidly into the place behind you. \"Now,\" the chief courtier calls through it, \"I expect you'll be cut down to size.\"">
<CONSTANT CHOICES041 <LTABLE "use a" "otherwise">>

<ROOM STORY041
	(DESC "041")
	(STORY TEXT041)
	(PRECHOICE STORY041-PRECHOICE)
	(CHOICES CHOICES041)
	(DESTINATIONS <LTABLE STORY087 STORY110>)
	(REQUIREMENTS <LTABLE STONE NONE>)
	(TYPES <LTABLE R-ITEM R-NONE>)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY041-PRECHOICE ()
	<COND (<CHECK-ITEM ,HAUNCH-OF-VENISON> <STORY-JUMP ,STORY064>)>>

<CONSTANT TEXT042 "The ball contest is played in every city of the civilized world. It is much more than just a game. Its exponents travel far and wide, earning fame for themselves and glory for their home cities. The priests say that the origins of the contest lie rooted in ancient tradition, and it is said that the playing of each game is like the unfolding of a mighty spell. Portents for the future are read in the outcome. Losers are often sacrificed to the gods.||The contest involves two players on each side. The aim is to bounce a large rubber ball off the sloping side walls of the arena using only your wrists, elbows and knees. At the same time you have to avoid the opposing players, who are allowed to ram into you with stunning force. You have seen men carried off with the broken necks after a vicious tackle.||The side walls are marked into zones. You score points for hitting these with the ball, and the winning team is the first to score seven points. Alternatively, you can win an immediate victory by getting the ball to go through one of the stone rings set high up in the middle of each wall. This is a very difficult feat, rarely achieved by even the best players.">

<ROOM STORY042
	(DESC "042")
	(STORY TEXT042)
	(PRECHOICE STORY042-PRECHOICE)
	(CONTINUE STORY088)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY042-PRECHOICE ()
	<COND (<CHECK-CODEWORD ,CODEWORD-POKTAPOK> <STORY-JUMP ,STORY065>)>>

<CONSTANT TEXT043 "To your own astonishment as much as anyone else's, the blood ball soars up and unerringly passes through the stone ring set in the middle of the wall. A howl of disbelief rises from the watching courtiers. They sound like hounds at the baying of the moon.||Your brother rushes over to join you. \"Can you feel it, Evening Star?\" he says excitedly. \"The tingle of magic on the air?\"||He is right. In some strange way your victory worked a spell which now empowers you both with an invigorating surge of energy.">
<CONSTANT TEXT043-CONTINUED "A wail of petulant rage echoes down from the sorcerer's sanctum. \"Apparently he's not happy with the result of the contest,\" you say to Morning Star.">
<CONSTANT CHOICES043 <LTABLE "attack the sorcerer now" "otherwise">>

<ROOM STORY043
	(DESC "043")
	(STORY TEXT043)
	(PRECHOICE STORY043-PRECHOICE)
	(CHOICES CHOICES043)
	(DESTINATIONS <LTABLE STORY019 STORY157>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY043-PRECHOICE ()
	<COND (,RUN-ONCE
		<COND (<L? ,LIFE-POINTS ,MAX-LIFE-POINTS>
			<EMPHASIZE "You are restored to full health.">
			<SETG LIFE-POINTS ,MAX-LIFE-POINTS>
		)>
		<COND (<G? <COUNT-CONTAINER ,LOST-SKILLS> 0>
			<CRLF>
			<TELL "You regained: ">
			<PRINT-CONTAINER ,LOST-SKILLS>
			<TRANSFER-CONTAINER ,LOST-SKILLS ,SKILLS>
		)>
		<UPDATE-STATUS-LINE>
	)>>

<CONSTANT TEXT044 "The giant adopts a look of furious concentration. He puffs out the huge boulders of his cheeks and screws his eyes tight. A rumbling groan escapes from the deep well of his throat, followed by a spluttering and a single cough like a lava plug being blown out of the ground.||He opens his mouth and there on his tongue lies a stone jar. \"What's that?\" you ask.||\"Ake it and thee,\" he replies.||\"I beg your pardon?\" you say, lifting the jar to examine it.||'I said, \"Take it and see,\"' he repeats impatiently. When he sees you grimace at the smell of the jar's contents, he adds: \"It's a healing drink. A magical recipe thousands of years old.\"||\"I think it's gone off!\"||\"No, it's supposed to smell like that,\" he says.||The potion can be drunk once at any time to restore 5 lost Life Points (press D).">

<ROOM STORY044
	(DESC "044")
	(STORY TEXT044)
	(CONTINUE STORY135)
	(ITEM MAGIC-POTION)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT045 "The golden manikin draws life from the warmth of your hand. Leaping down to the ground, he leaps through the flame barrier and emerge unscathed bearing the wand. You take the wand and give it to the Jade Thunder, who is delighted.||When you go to pick up the Man of Gold, you discover he has tunnelled down into the sand. \"I know the legend of that manikin,\" says Jade Thunder. \"It could only be used once.\"||\"Evidently,\" you reply, staring at the mound of sand where the Man of Gold dug down out of sight.">

<ROOM STORY045
	(DESC "045")
	(STORY TEXT045)
	(PRECHOICE STORY045-PRECHOICE)
	(CONTINUE STORY091)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY045-PRECHOICE ()
	<COND (<CHECK-ITEM ,MAN-OF-GOLD> <LOSE-ITEM ,MAN-OF-GOLD>)>>

<CONSTANT TEXT046 "You have never seen so many stars as fill the desert sky after sunset. The night is full of soft sinister rustlings: snakes gliding across the sand, insects and scorpions scuttling unseen in the darkness. It is as eerie as venturing into the underworld. When the moon rises, it outlines the wind-blasted crags in a ghostly silver glow that makes them look like towering clouds.||By day you shelter under overhanging rocks -- after first being sure to check that no venomous creatures have used the same patch of shade as a lair. Each evening, as the sun sinks in the west and the terrible heat of the day gives way to the cool of night, you take up your pack and journey on.">

<ROOM STORY046
	(DESC "046")
	(STORY TEXT046)
	(PRECHOICE STORY046-PRECHOICE)
	(CONTINUE STORY069)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY046-PRECHOICE ("AUX" (DAMAGE 3))
	<COND (<CHECK-ITEM ,WATERSKIN>
		<SET DAMAGE 1>
	)(<CHECK-SKILL ,SKILL-WILDERNESS-LORE>
		<SET DAMAGE <- .DAMAGE 1>>
	)>
	<LOSE-LIFE .DAMAGE DIED-OF-THIRST ,STORY046>
	<COND (<IS-ALIVE>
		<COND (<CHECK-SKILL ,SKILL-WILDERNESS-LORE>
			<EMPHASIZE "Your knowledge of WILDERNESS LORE made you tougher than most people.">
		)>
		<COND (<CHECK-ITEM ,WATERSKIN>
			<EMPHASIZE "You waterskin has been emptied.">
			<LOSE-ITEM ,WATERSKIN>
		)>
	)>>

<CONSTANT TEXT047 "\"What would others think of our clan,\" you assert, \"if we meekly ignored the loss of my brother? Honour is like the sun: it cannot hide its face.\"||The Matriarch thrusts her head forward and stares at you along the great hook of her nose. Perched thus on her stone seat, she reminds you of a fat owl watching a mouse. You begin to fear you have offended her with your frank answer, but then to your relief she gives a rumble of approving laughter. \"Well said, young Evening Star. How like your brother you are -- and both of you like your late father, always brimming over with impatient courage.\"||You set down your cup. \"Then have I your leave to go, my lady?\"||She nods. \"Yes, but since your determination glorifies the clan, I feel that the clan should give you assistance in this quest. Consider what help you need most, Evening Star. I could arrange for you to have an audience with one of our high priests, and you could seek their advice. Or I could allow you to equip yourself with the clan's special ancestral treasures. Or would you prefer a companion on your quest?\"">
<CONSTANT CHOICES047 <LTABLE "request a meeting with one of the high priests" "ask to see the ancestral treasures of the clan" "you think a companion would be useful">>

<ROOM STORY047
	(DESC "047")
	(STORY TEXT047)
	(CHOICES CHOICES047)
	(DESTINATIONS <LTABLE STORY116 STORY138 STORY162>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT048 "You know that the spider must be torpid from the heat. Tarantulas are night hunters. It is unlikely to bite if you jerk your hand away, and even if it did the venom is little worse than a wasp sting. Touching it would be far more unpleasant, since the bristles inject a powerful irritant.||The tarantula sleepily probes your fingers with its limbs. You snatch your hand back out of its clutches. Its only reaction is to slowly curl back into the shade of the papaya fruit. You breathe a sigh of relief and step back to the middle of the causeway.||\"Hey there! What're you doing?\"||You turn to see an old peasant coming through the dusty orchard towards you.">
<CONSTANT CHOICES048 <LTABLE "talk to him" "decide to hurry off before he gets here">>

<ROOM STORY048
	(DESC "048")
	(STORY TEXT048)
	(PRECHOICE STORY048-PRECHOICE)
	(CHOICES CHOICES048)
	(DESTINATIONS <LTABLE STORY117 STORY163>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY048-PRECHOICE ()
	<COND (,RUN-ONCE
		<COND (<CHECK-SKILL ,SKILL-ETIQUETTE>
			<PUT <GETP ,STORY048 ,P?DESTINATIONS> 1 ,STORY139>
		)(ELSE
			<PUT <GETP ,STORY048 ,P?DESTINATIONS> 1 ,STORY117>
		)>
	)>>

<CONSTANT TEXT049 "You reach into the forbidding hole and snatch up the diadem. As you bring it out into the leaf-spattered sunlight however, a baleful roar issues from the interior of the dead tree. You are started by a scaly moss-covered arm that suddenly thrusts forth, groping for you as a voice thunders: \"Who has taken my trinket? A curse be upon that sly long-fingered thief!">
<CONSTANT CHOICES049 <LTABLE "lose the shawl" "release your grip and fall back off the tree" "cling on and risk letting the monstrous arm seize you">>

<ROOM STORY049
	(DESC "049")
	(STORY TEXT049)
	(CHOICES CHOICES049)
	(DESTINATIONS <LTABLE STORY425 STORY400 STORY003>)
	(REQUIREMENTS <LTABLE SKILL-CUNNING NONE NONE>)
	(TYPES <LTABLE R-SKILL R-NONE R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT050 "You race off into the undergrowth. The mysterious cannibals make no attempt to stop you, nor do they come after you. They are content to keep your belongings and leave you to the mercy of the forest byways.">

<ROOM STORY050
	(DESC "050")
	(STORY TEXT050)
	(PRECHOICE STORY050-PRECHOICE)
	(CONTINUE STORY118)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY050-PRECHOICE ()
	<EMPHASIZE "You lost all your possessions.">
	<RESET-POSSESSIONS>
	<MOVE ,ALL-MONEY ,PLAYER>>

<CONSTANT TEXT051 "\"Struggling is futile!\" snaps the high priest as his guards rush at you. \"Submit to the will of the gods and at least you will be granted a noble death.\"||You give a groan of pain as one of the guards slams the butt of his spear across your shoulders. Another kicks you in the stomach as you slump forward.">

<ROOM STORY051
	(DESC "051")
	(STORY TEXT051)
	(PRECHOICE STORY051-PRECHOICE)
	(CONTINUE STORY327)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY051-PRECHOICE ()
	<LOSE-LIFE 2 DIED-GREW-WEAKER ,STORY051>>

<CONSTANT TEXT052 "A sense of panic begins to well up, churning your thoughts into a confused mixture of fact and fancy. You begin to imagine that you have strayed into the underworld and that the mighty trees surrounding you are no more than the smallest subterranean roots of the fabled Ceiba tree that supports the heavens. You jump in alarm at every tiny sound of scurrying insects or fluttering wings. If you cannot find your way out of the forest soon, our only fate will be madness followed by a slow torturing death by starvation.">
<CONSTANT CHOICES052 <LTABLE "bear of to the right" "continue in the direction you have been waling up till now" "decide to go left">>

<ROOM STORY052
	(DESC "052")
	(STORY TEXT052)
	(CHOICES CHOICES052)
	(DESTINATIONS <LTABLE STORY075 STORY098 STORY144>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT053 "A dry raised path stretches off across the dismal marshland. You set off to find where it leads, and have not been walking long when you come across a tiny wizened man with large round eyes and a very long nose. He is lying by the side of the path in a clump of reeds, gasping with exhaustion. When he catches sight of you he raises his head weakly and says in a high-pitched whine: \"I'm so thirsty. Please give me something to drink...\"">
<CONSTANT CHOICES053 <LTABLE "go back to the river and fetch some water for him" "ignore him and walk past">>

<ROOM STORY053
	(DESC "053")
	(STORY TEXT053)
	(CHOICES CHOICES053)
	(DESTINATIONS <LTABLE STORY284 STORY307>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT054 "You pause to admire the details of the frieze. It is divided into two long panels. In the upper part, two jaunty heroes are shown striding towards a gate where four stern sentinels await them. The faces of the heroes are identical. The lower panel is separated from this by a cornice, and the figures there are shown upside-down as though walking across the bottom of the world. You crane your neck to make out a picture, which the artisans have only half finished colouring in. It depicts a rich man and his servant trudging towards a pair of arches. Their crouched stance and tightly drawn features suggest an air of nervousness which contrasts with the bold manner of the two heroes in the upper mural.||The priestess smiles at you. \"You're a connoisseur of temple art? We're having to hurry to get it finished before the festivities tomorrow, of course.\"">
<CONSTANT CHOICES054 <LTABLE "ask her what the scene with the hero-twins represents" "ask about the noble and the servant" "you are more interested in finding out about the festival">>

<ROOM STORY054
	(DESC "054")
	(STORY TEXT054)
	(CHOICES CHOICES054)
	(DESTINATIONS <LTABLE STORY123 STORY146 STORY169>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT055 "The King is put in a foul temper because of your paltry gift. A group of royal guards emerge from the palace brandishing hard wooden staves and demand to know if you are the one who has insulted the King by presenting him with a one-legged owl.">
<CONSTANT CHOICES055 <LTABLE "fight the guards" "make no attempt to resist">>

<ROOM STORY055
	(DESC "055")
	(STORY TEXT055)
	(PRECHOICE STORY055-PRECHOICE)
	(CHOICES CHOICES055)
	(DESTINATIONS <LTABLE STORY102 STORY124>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY055-PRECHOICE ()
	<COND (<CHECK-SKILL ,SKILL-CUNNING> <STORY-JUMP ,STORY032>)>>

<CONSTANT TEXT056 "When you answered the riddle, the bead slipped out from under your tongue and fell to the ground. You drop to your knees and start frantically fumbling around for it, then you catch sight of it rolling towards a fissure in the rock. You make a desperate lunge, but your fingers close on thin air. The jade bead rolls into the fissure and is lost to view.">

<ROOM STORY056
	(DESC "056")
	(STORY TEXT056)
	(PRECHOICE STORY056-PRECHOICE)
	(CONTINUE STORY060)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY056-PRECHOICE ()
	<COND (<CHECK-ITEM ,JADE-BEAD> <LOSE-ITEM ,JADE-BEAD>)>>

<CONSTANT TEXT057 "Leaving while the creature is asleep would do no good. It would only come looking for you after dark. You must deal with it now.">
<CONSTANT TEXT057-CONTINUED "Your only option is to do battle with the creature">
<CONSTANT CHOICES057 <LTABLE "attack it now while it is still attached to its host" "wait until nightfall">>

<ROOM STORY057
	(DESC "057")
	(STORY TEXT057)
	(PRECHOICE STORY057-PRECHOICE)
	(CHOICES CHOICES057)
	(DESTINATIONS <LTABLE STORY104 STORY100>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY057-PRECHOICE ()
	<COND (<CHECK-SKILL ,SKILL-CUNNING>
		<STORY-JUMP ,STORY377>
	)(<CHECK-SKILL ,SKILL-SPELLS>
		<STORY-JUMP ,STORY011>
	)(ELSE
		<CRLF>
		<TELL TEXT057-CONTINUED>
		<TELL ,PERIOD-CR>
	)>>

<CONSTANT TEXT058 "Perhaps you will find the answers to your questions in the shrine. You climb to the top of the steps, pausing for a moment at the threshold of the shrine. The entrance is a block of shadow, dingy with foreboding. But you have no choice. Bowing as every mortal must when in the presence of the gods, you go inside.||It is a shrine to God of the Pole Star, as you can tell immediately by the striped glyphs on the altar. He is the celestial guide whom all travellers pray to when they have lost their way. You doubt if anyone has ever needed his help as much as you do now.">
<CONSTANT CHOICES058 <LTABLE "offer" "your own lifeblood">>

<ROOM STORY058
	(DESC "058")
	(STORY TEXT058)
	(PRECHOICE STORY058-PRECHOICE)
	(CHOICES CHOICES058)
	(DESTINATIONS <LTABLE STORY082 STORY082>)
	(REQUIREMENTS <LTABLE INCENSE 1>)
	(TYPES <LTABLE R-LOSE-ITEM R-LOSE-LIFE>)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY058-PRECHOICE ()
	<COND (<OR <CHECK-ITEM ,INCENSE> <IS-ALIVE 1>>
		<PUTP ,STORY058 ,P?DEATH F>
	)(ELSE
		<PUTP ,STORY058 ,P?DEATH T>
		<EMPHASIZE "You have nothing to offer.">
	)>>

<CONSTANT TEXT059 "The drink proves cool and invigorating.">
<CONSTANT TEXT059-CONTINUED "Your companion leads up to the kapok tree, where a group of nobles are resting under the canopy of foliage. They greet him cordially, but you are given a somewhat cooler reception until he explains how you helped him cross the river blood.||It is a relief to be out of the glaring light of the low underworld sun for a while. Out of the shade, you an see less fortunate souls moving to and fro with their hands pressed to their foreheads, squinting in the eternal sunshine. You settle down with your back to the tree and wait to hear what the nobles have to say">

<ROOM STORY059
	(DESC "059")
	(STORY TEXT059)
	(PRECHOICE STORY059-PRECHOICE)
	(CONTINUE STORY106)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY059-PRECHOICE ()
	<GAIN-LIFE 2>
	<CRLF>
	<TELL TEXT059-CONTINUED>
	<TELL ,PERIOD-CR>>

<CONSTANT TEXT060 "The stranger leaps up into the air, displaying a long thin body like a streak of lightning. Suddenly you realize you are not looking at a man at all, but a large iguana. It crouches on the rock, gives you a last lingering glare, and then goes darting off into the mist.||You trudge on, and gradually the mist breaks up to reveal that the path has become a raised stone causeway which snakes down towards a jetty in the distance. Beyond lies an endless green lake. An icy breeze blows in off the water, making you shiver. As you make your way along the causeway, you notice writhing movement under the thin veils of mist that still lie in the hollows. You stoop for a closer look, then recoil in disgust as you realize that the ground off the causeway consists of filth and mud infested with thousands of maggots.||\"You don't like my pets?\"||You look up. A bizarre creature is waiting for you a little way down the causeway. You could have sworn it wasn't there a moment before. It has a large globular body supported on three strong clawed legs. Its eyes are bright narrow slits, and as it watches you it runs its tongue greedily across its lips. You realize that to reach the jetty you will have to get past that monster -- or else wade through the mass of wriggling maggots.">
<CONSTANT CHOICES060 <LTABLE "use" "or a" "you can march along the causeway" "head directly for the jetty by leaving the causeway and wading through the maggots">>

<ROOM STORY060
	(DESC "060")
	(STORY TEXT060)
	(PRECHOICE STORY060-PRECHOICE)
	(CHOICES CHOICES060)
	(DESTINATIONS <LTABLE STORY217 STORY241 STORY194 STORY171>)
	(REQUIREMENTS <LTABLE SKILL-TARGETING MAN-OF-GOLD NONE NONE>)
	(TYPES <LTABLE R-SKILL R-ITEM R-NONE R-NONE>)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY060-PRECHOICE ()
	<COND (,RUN-ONCE
		<COND (<CHECK-ITEM ,JADE-BEAD>
			<PUT <GETP ,STORY060 ,P?DESTINATIONS> 3 ,STORY148>
		)(ELSE
			<PUT <GETP ,STORY060 ,P?DESTINATIONS> 3 ,STORY194>
		)>
	)>>

<CONSTANT TEXT061 "Grey clouds of fury darken the black pools of the sentinel's eyes. He lets his gory mouth drop open in a long appalling howl of fury that sounds like the heavens cracking in two. You drop cowering to the ground, so terrified that every muscle in your body loses all strength.||At last, like a storm, the awful sound passes. You uncurl yourself and glance timidly up. The sentinel has lost interest in you, having voiced his displeasure. He is once more staring directly ahead across the passage, giving you no more attention than he would give to an insect.||Still dazed, you lope on along the passage. It is only now that you realize how the sentinel's howl has addled your wits.">
<CONSTANT TEXT061-CONTINUED "Pray to all the gods that your single skill will be enough to see you through">

<ROOM STORY061
	(DESC "061")
	(STORY TEXT061)
	(PRECHOICE STORY061-PRECHOICE)
	(CONTINUE STORY037)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY061-PRECHOICE ()
	<EMPHASIZE "You lose all skills except one.">
	<LOSE-SKILLS 1>
	<CRLF>
	<TELL TEXT061-CONTINUED>
	<TELL ,PERIOD-CR>>

<CONSTANT TEXT062 "He gives a wild shriek of rage and drives both knives towards your breast. The attack is so fast that you have no time even to flinch. At the last instant, the sentinel pulls his blows so that instead of impaling you the tips of the blades just prick your skin. You gulp and look down. Two bright drops of blood are trickling down your chest. This is not a normal injury, however. The wounds inflicted by Lord Blood's knives can never be healed.">

<ROOM STORY062
	(DESC "062")
	(STORY TEXT062)
	(PRECHOICE STORY062-PRECHOICE)
	(CONTINUE STORY084)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY062-PRECHOICE ()
	<LOSE-LIFE 2 DIED-GREW-WEAKER ,STORY062>
	<COND (<IS-ALIVE>
		<SETG MAX-LIFE-POINTS <- ,MAX-LIFE-POINTS 2>>
	)>>

<CONSTANT TEXT063 "Your strongest leap carries you to the far side of the pit -- nearly. You teeter on the brink with just your toes on solid ground, arms spinning crazily in a vain attempt to save yourself. You fall back with a cry of alarm which turns into a scream of tortured pain as you land on the burning coals.">
<CONSTANT TEXT063-CONTINUED "The smell of your own sizzling flesh gives you the burst of frantic strength you need to scramble up out of the pit. You stagger on to the end of the passage to find the courtiers waiting for you. They have wide canine smirks on their faces. \"I hope you appreciated our little jest,\" the chief courtier says. \"Now the real tests begin.\"">

<ROOM STORY063
	(DESC "063")
	(STORY TEXT063)
	(PRECHOICE STORY063-PRECHOICE)
	(CONTINUE STORY431)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY063-PRECHOICE ()
	<LOSE-LIFE 3 DIED-GREW-WEAKER ,STORY063>
	<IF-ALIVE TEXT063-CONTINUED>>

<CONSTANT TEXT064 "You wedge yourself into a corner of the hall and watch the hovering knives. As they come sweeping towards you, you tear off a hunk of meat and throw it to them. They fall on it, shredding it quickly with stabbing blows, then retreat to float around in the centre of the hall. After a while they start to approach, and again you are able to distract them with a scrap of meat.||This continues throughout the knight. You get no sleep but at least you have kept the enchanted knives from your flesh. You have used up the last of the haunch of venison and are waiting nervously for the next assault of the knives, when they suddenly drop lifeless to the floor with the advent of morning.||The courtiers cannot disguise their ill temper when they open the door to find you unscathed. \"Your luck runs out tonight,\" snaps one. \"That's when you must enter the House of cold.\"">

<ROOM STORY064
	(DESC "064")
	(STORY TEXT064)
	(PRECHOICE STORY064-PRECHOICE)
	(CONTINUE STORY132)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY064-PRECHOICE ()
	<LOSE-ITEM ,HAUNCH-OF-VENISON>>

<CONSTANT TEXT065 "You think it might be worth going for a long shot along the arena as soon as the game starts. If you are lucky you might score a point straight away, thus gaining an advantage. In subsequent rounds you know you will have to play more cautiously -- perhaps even allowing the attacking enemy player to get past you so that you can close in on the defensive player.">

<ROOM STORY065
	(DESC "065")
	(STORY TEXT065)
	(CONTINUE STORY088)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT066 "On a signal from the chief courtier, both teams return to the end zones of the arena. It is your turn to serve again. You raise the ball and consider your best tactics. The first team to reach seven points wins the contest.">
<CONSTANT CHOICES066 <LTABLE "go for a long shot" "you prefer to be cautious and go for a safe point">>

<ROOM STORY066
	(DESC "066")
	(STORY TEXT066)
	(CHOICES CHOICES066)
	(DESTINATIONS <LTABLE STORY089 STORY112>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT067 "The giant blinks. Each time he does, there is a whooshing sound in thin air and a cacao drops from nowhere into your hand. He continues doing this until you have another twenty cacao.||\"A good trick,\" you say, smiling and nodding in the hope that this will encourage him to continue.||He sighs wearily. \"Once my magic was much grater than that. I fear I have squandered eternity.\"||\"By making a tally of all the stars?\" you say as you slip the cacao into your money-pouch. \"What could be more worthwhile!\"||A streak of light flickers across the heavens. \"what was that?\" says the giant grimly.||\"A falling star,\" you reply. \"Better reduce the total by one. Well, I'll be saying goodbye.\"">

<ROOM STORY067
	(DESC "067")
	(STORY TEXT067)
	(PRECHOICE STORY067-PRECHOICE)
	(CONTINUE STORY135)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY067-PRECHOICE ()
	<GAIN-MONEY 20>>

<CONSTANT TEXT068 "You dive through the magical flames. A cry of agony escapes your lips as you are terribly burned.">
<CONSTANT TEXT068-CONTINUED "Luckily, you survived. The flame barrier dies down now that you have broken the spell. As you are still recovering from the wave of pain, Jade Thunder steps forward and eagerly takes the wand from your hand.">

<ROOM STORY068
	(DESC "068")
	(STORY TEXT068)
	(PRECHOICE STORY068-PRECHOICE)
	(CONTINUE STORY091)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY068-PRECHOICE ("AUX" (DAMAGE 7))
	<COND (<CHECK-SKILL ,SKILL-CHARMS> <SET DAMAGE 3>)>
	<LOSE-LIFE .DAMAGE DIED-GREW-WEAKER ,STORY068>
	<IF-ALIVE TEXT068-CONTINUED>>

<CONSTANT TEXT069 "Cliffs rise in front of you, and you make your way along them until you find a long shoulder of rock by which you are able to scale to the top.||You have gone only a little further when you hear a distant keening noise. It sounds like the wind, but you do not feel even a breath of air in the sultry stillness. Then you notice half a dozen long plumes of dust moving along the ground in your direction. Above each dust-plume is a dark twisting funnel of air. Whirlwinds -- and they are bearing straight down on you. Superstitious dread crawls up your spine. You recall tales of the demons of the desert, who rip men limb from limb with the fury of their whirlwinds.">
<CONSTANT CHOICES069 <LTABLE "use a wand" "stand ready to fight the demons off" "run back towards the cliffs">>

<ROOM STORY069
	(DESC "069")
	(STORY TEXT069)
	(PRECHOICE STORY069-PRECHOICE)
	(CHOICES CHOICES069)
	(DESTINATIONS <LTABLE STORY092 STORY115 STORY137>)
	(REQUIREMENTS <LTABLE SKILL-SPELLS NONE NONE>)
	(TYPES <LTABLE R-SKILL R-NONE R-NONE>)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY069-PRECHOICE ()
	<COND (<CHECK-SKILL ,SKILL-FOLKLORE> <STORY-JUMP ,STORY345>)>>

<CONSTANT TEXT070 "\"I can give no easy answer, my lady,\" you tell the Matriarch. \"I do not wish to shirk my duty to the clan that has nurtured me, but neither can I ignore the demands of my heart. I must go in search of my brother, since I cannot rest until I know whether he is alive or dead.\"||She heaves a deep sigh, more of resignation than disapproval. \"I know you could not be dissuaded,\" she says. \"You have your late father's impetuosity. Morning Star shared that same quality. It is the mark of a hero -- but beware, Evening Star, for it can also get you killed.\"||\"I understand. I have your permission to undertake this quest, then?\"||\"You have.\" She produces a letter and hands it to you. \"Take this to the town of Balak on the northern coast. Ask there for a girl named Midnight Bloom. She is a distant cousin of yours. Present her with this letter, which will introduce you and request her assistance in your quest.\"||\"How can she assist me?\" you ask, taking the letter.||\"She is skilled in coastal trade, and will convey you by ship to Tahil. May the gods watch over you, Evening Star.\"||You rise and bow, as you leave, your heart is full of excitement.">

<ROOM STORY070
	(DESC "070")
	(STORY TEXT070)
	(CONTINUE STORY093)
	(ITEM LETTER-OF-INTRODUCTION)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT071 "The tarantula drowsily probes your fingers with its bristly limbs. Its movement evokes a feeling of fascination and revulsion -- you can well imagine how a mouse might feel as one of these hairy monsters came rushing out of the dark of night to seize it! You snatch your hand back quickly. The tarantula's only reaction is to slowly curl back into the shade of the papaya fruit. You breathe a sigh of relief and step back out from under the tree.||\"Hey, you there! What are you doing?\"||You turn to see an old peasant coming through the dusty orchard towards the causeway.">
<CONSTANT CHOICES071 <LTABLE "talk to him" "hurry off before he gets here">>

<ROOM STORY071
	(DESC "071")
	(STORY TEXT071)
	(PRECHOICE STORY071-PRECHOICE)
	(CHOICES CHOICES071)
	(DESTINATIONS <LTABLE STORY117 STORY163>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY071-PRECHOICE ()
	<COND (,RUN-ONCE
		<COND (<CHECK-SKILL ,SKILL-ETIQUETTE>
			<PUT <GETP ,STORY071 ,P?DESTINATIONS> 1 ,STORY139>
		)(ELSE
			<PUT <GETP ,STORY071 ,P?DESTINATIONS> 1 ,STORY117>
		)>
	)>>

<CONSTANT TEXT072 "A wave of dizziness warns you that your wound is becoming infected. You stop to gather puffballs. Their spores act as an antidote to fever. Finding a wild bees' nest, you mix the spores with honey to take away the dry noxious taste and gulp the mixture down. It is unpleasant, but it seems to do the trick.">

<ROOM STORY072
	(DESC "072")
	(STORY TEXT072)
	(CONTINUE STORY118)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT073 "With one bound you cross the veranda and snatch up your belongings. The cannibals are at first taken by surprise, but when you launch yourself at them with a bellow of righteous wrath they take up their weapons and stand ready to fight.">

<ROOM STORY073
	(DESC "073")
	(STORY TEXT073)
	(PRECHOICE STORY073-PRECHOICE)
	(CONTINUE STORY433)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY073-PRECHOICE ("AUX" (DAMAGE 6))
	<COND (<CHECK-SKILL ,SKILL-SWORDPLAY>
		<SET DAMAGE 2>
	)(<CHECK-SKILL ,SKILL-UNARMED-COMBAT>
		<SET DAMAGE 4>
	)>
	<LOSE-LIFE .DAMAGE DIED-IN-COMBAT ,STORY073>>

<CONSTANT TEXT074 "You glance back to reassure yourself that the demons are not going to abandon you here. \"We will wait,\" says one with a raw-gummed leer.||\"Take your time,\" cackles the other, nodding in grisly encouragement.||You brace yourself on the edge of the crevice and peer within. As your eyes adjust to the darkness, you see a narrow tunnel leading to a chamber inside the rock. Something gleams dully in the grey light. The smell is of rotting things: dank leaf mould and stagnant slime.">
<CONSTANT CHOICES074 <LTABLE "return to the canoe" "sneak into the tunnel" "enter into the tunnel">>

<ROOM STORY074
	(DESC "074")
	(STORY TEXT074)
	(CHOICES CHOICES074)
	(DESTINATIONS <LTABLE STORY258 STORY282 STORY140>)
	(REQUIREMENTS <LTABLE NONE SKILL-ROGUERY NONE>)
	(TYPES <LTABLE R-NONE R-SKILL R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT075 "You reach a clearing where one of the huge primeval trees has toppled, leaving a temporary rent in the leaf canopy. The great trunk lies like a fallen titan across the leaf littler. Already flowers are blossoming in its bark, their tendrils sucking nutriment out of the decaying wood, and great flanges of fungus thrive in its dank crevices. Other trees will son grow their branches across to exploit the sunlight, but for the moment the sky is revealed in a patch of glorious blue that makes your heart soar. You watch the sun slowly decline from its zenith, slanting off across the treetops to your left. Is this information enough to let you find your way out of the forest?">
<CONSTANT CHOICES075 <LTABLE "go straight ahead" "left" "right from here">>

<ROOM STORY075
	(DESC "075")
	(STORY TEXT075)
	(CHOICES CHOICES075)
	(DESTINATIONS <LTABLE STORY052 STORY412 STORY121>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT076 "Leaping to the back of the boat, you pick up the paddle and use it to steer over towards the cavern wall, where the current is not so fast-moving. After a short distance you find a side tunnel and see the gleam of daylight at the far end. Paddling along it, you emerge into the open under an overcast sky the colour of dead skin. The river has become no more than a muddy trickle winding through sickly grey marshland. A dreary landscape of sour white clay and colourless rushes stretches far off into the distance. There is a foul rancid odour in the air.||You put in at a rotting wooden jetty and tether the boat.">

<ROOM STORY076
	(DESC "076")
	(STORY TEXT076)
	(PRECHOICE STORY076-PRECHOICE)
	(CONTINUE STORY053)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY076-PRECHOICE ()
	<CRLF>
	<TELL "Take the " D ,PADDLE "?">
	<COND (<YES?>
		<TAKE-ITEM ,PADDLE>
	)>>

<CONSTANT TEXT077-WELCOMED "You are naturally recognized and welcomed as a noble of Koba">
<CONSTANT TEXT077-EXPERT "You are granted an audience">
<CONSTANT CHOICES077 <LTABLE "present the king with a lavish gift" "else give up any hope of being granted an audience">>

<ROOM STORY077
	(DESC "077")
	(PRECHOICE STORY077-PRECHOICE)
	(CHOICES CHOICES077)
	(DESTINATIONS <LTABLE STORY238 STORY262>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY077-PRECHOICE ()
	<COND (<CHECK-SKILL ,SKILL-ETIQUETTE>
		<CRLF>
		<TELL TEXT077-WELCOMED>
		<TELL ,PERIOD-CR>
		<STORY-JUMP ,STORY192>
	)(<CHECK-CODEWORD ,CODEWORD-POKTAPOK>
		<CRLF>
		<TELL TEXT077-EXPERT>
		<TELL ,PERIOD-CR>
		<STORY-JUMP ,STORY215>
	)>>

<CONSTANT TEXT078 "The courtier returns some time later and tells you that the King is pleased with your gift. A group of royal servants is assigned to take you to the house of a minor nobleman, Lord Fire Serpent. He proves to be a bearded old warrior with a scar across his lip that gives him a rather ferocious appearance. But he greets you cordially when the servants explain that you are a favourite of the King, who commands that you be shown every hospitality.||Clapping his hands, Fire Serpent summons his wife, who brings you a jug of spiced cocoa, then gestures for you to sit beside him. \"Tomorrow is the festival commemorating the old King's departure to the next life,\" he says. \"Is that why you have made the journey from Koba?\"||Sipping your cocoa, you explain that you are on a quest which will take you much further west than this. Fire Serpent nods interestedly and has food brought.">
<CONSTANT TEXT078-CONTINUED "You spend a restful night at Fire Serpent's home. The next day you must decide">
<CONSTANT CHOICES078 <LTABLE "head north" "west" "stay for the festivities">>

<ROOM STORY078
	(DESC "078")
	(STORY TEXT078)
	(PRECHOICE STORY078-PRECHOICE)
	(CHOICES CHOICES078)
	(DESTINATIONS <LTABLE STORY030 STORY008 STORY416>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY078-PRECHOICE ()
	<COND (,RUN-ONCE <GAIN-LIFE 1>)>
	<COND (<CHECK-CODEWORD ,CODEWORD-PSYCHODUCT>
		<STORY-JUMP ,STORY331>
	)(ELSE
		<CRLF>
		<TELL TEXT078-CONTINUED>
		<TELL ,PERIOD-CR>
	)>>

<CONSTANT TEXT079 "Seeing that you have no intention of paying his fee, Kawak closes his jaws with a crocodilian snap that sends shockwaves rattling through the ground underfoot. He thinks he has thwarted you, but the Man of Gold is more powerful than any dragon. You warm the manikin in your hands and set it down in from of Kawak's stubbornly sealed maw. Kawak squints at it warily along the length of his snout, then his glistening eyes widen in shocked recognition. The Man of Gold does not even need to do anything. Kawak immediately opens his mouth, extending his ridged tongue like a carpet laid before an honoured guest. \"Enter then, mortal, if you must,\" he growls grudgingly.||You stoop to retrieve the Man of Gold, but it suddenly darts away and leaps off into the abyss.">

<ROOM STORY079
	(DESC "079")
	(STORY TEXT079)
	(PRECHOICE STORY079-PRECHOICE)
	(CONTINUE STORY033)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY079-PRECHOICE ()
	<LOSE-ITEM ,MAN-OF-GOLD>>

<CONSTANT TEXT080 "You arrive at the edge of a canyon. Choking yellow vapour rises from the depths, obscuring a sullen fiery light from far below. You can hear distant rumblings, leading you to imagine a river of lava burning beneath the sulphur clouds.||There are thin spires of rock poking up out of the vapour at regular intervals almost two metres apart, leading in a straight line to the far side of the canyon. By jumping form one to another it might be possible to get across, but they would make precarious stepping-stones: the top of each spire is a flattened area no bigger than the palm of your hand.">
<CONSTANT CHOICES080 <LTABLE "cross the canyon by leaping from one spire to the next" "use a blowgun to cross more safely">>

<ROOM STORY080
	(DESC "080")
	(STORY TEXT080)
	(PRECHOICE STORY080-PRECHOICE)
	(CHOICES CHOICES080)
	(DESTINATIONS <LTABLE STORY147 STORY170>)
	(REQUIREMENTS <LTABLE NONE BLOWGUN>)
	(TYPES <LTABLE R-NONE R-ITEM>)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY080-PRECHOICE ()
	<COND (<CHECK-SKILL ,SKILL-FOLKLORE>
		<STORY-JUMP ,STORY286>
	)(<CHECK-CODEWORD ,CODEWORD-PAKAL>
		<STORY-JUMP ,STORY309>
	)>>

<CONSTANT TEXT081 "You settle down and wait for night to fall. As the sun dips across the network of canals and trees to the west, the pitcher on the woman's shoulder starts to stir as if of its own accord. It falls away to reveal what you expected: a second head protruding from her neck. The eyes snap open and fix on you, and the head's mouth drops open in a long hissing snarl. Long strands of black hair extend rapidly from it like tentacles -- some of them up to two metres long. These form into thin matted stalks like insectoid legs which probe the ground, preparing to support the creature's weight. There is a grisly sucking sound as the head pulls itself free of the sleeping woman's neck.||It comes scuttling forward eagerly on its limbs of twined hair and leaps up onto your neck, intending to make you its new host, but you are ready for it. The coating of salt cause it to recoil and it drops to the ground, momentarily helpless. You seize your chance to stuff it into the lobster pot, which you weight with stones before throwing it into the water. \"And good riddance,\" you say as it sinks to a final resting-place on the river bed.">

<ROOM STORY081
	(DESC "081")
	(STORY TEXT081)
	(PRECHOICE STORY081-PRECHOICE)
	(CONTINUE STORY398)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY081-PRECHOICE ()
	<LOSE-ITEM ,LOBSTER-POT>>

<CONSTANT TEXT082 "The god accepts your sacrifice and reveals the true path to you. You hear no words. Suddenly the knowledge is in your mind, where before there was confusion. You know that you must descend the steps back down to the lake -- and then keep going. The route to the Deathlands lies under the water.||Backing out of the shrine, you respectfully retreat one step at a time until you reach the water's edge. Now that you look closely, you can see that the stairway does indeed continue down into the icy green murk.">

<ROOM STORY082
	(DESC "082")
	(STORY TEXT082)
	(CONTINUE STORY105)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT083 "Your companion leads you past miserable souls who are doomed to mill about for ever in the blazing sunshine, eyes downcast and hands pressed to their foreheads. As you approach the kapok tree, you see that the figures sitting under it are living skeletons. Their bones are green with algae and moss, and creepers and insects twine through their open joints. One raises a grinning face made even more grotesque by a brilliantly patterned butterfly sitting above his eyeless sockets. It is strange juxtaposition of the imagery of life and death.||Your companion tells you that the denizens of the Deathlands are nobles like himself who, because of their status, are privileged to rest in the shade of the tree. Now you see that he too is changing. The appearance of flesh and sinew is dropping away to reveal another of the emerald skeletons with its covering of foliage and wildlife.">

<ROOM STORY083
	(DESC "083")
	(STORY TEXT083)
	(PRECHOICE STORY083-PRECHOICE)
	(CONTINUE STORY151)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY083-PRECHOICE ()
	<COND (<CHECK-SKILL ,SKILL-SPELLS> <STORY-JUMP ,STORY128>)>>

<CONSTANT TEXT084 "You reach the last of the sentinels -- a giant hunched figure with eyes like fiery mirrors. He crooks one of his taloned fingers and beckons you closer. \"Tell me,\" he says in a rasping whisper, \"by what name am I called?\"||This is your last test. Get past this demon unscathed and you can escape into the fresh air of the living world.">
<CONSTANT CHOICES084 <LTABLE "address him as Lord Skull" "call him Thunderbolt Laughter">>

<ROOM STORY084
	(DESC "084")
	(STORY TEXT084)
	(CHOICES CHOICES084)
	(DESTINATIONS <LTABLE STORY336 STORY349>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT085 "Food will be hard to come by in the arid sierra, so you make sure to pluck fruits from the abandoned orchards lining the first few kilometres of the causeway. The causeway dwindles to a stony road, then a dirt track, and finally you are trudging through open country.||Your fruit soon gives out but in the baking summer heat it is lack of water, not food, that is your main concern.">
<CONSTANT TEXT085-CONTINUED "Days turn to weeks. At last you catch sight of the town of Shakalla in the distance, its pyramids trembling in a haze of heat and dust. Beyond it lies a grim grey shadow: the desert, stretched like a basking serpent along the edge of the world.">

<ROOM STORY085
	(DESC "085")
	(STORY TEXT085)
	(PRECHOICE STORY085-PRECHOICE)
	(CONTINUE STORY321)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY085-PRECHOICE ()
	<COND (<OR <CHECK-SKILL ,SKILL-WILDERNESS-LORE> <CHECK-ITEM ,WATERSKIN>>
		<PUTP ,STORY085 ,P?DEATH F>
	)(ELSE
		<LOSE-LIFE 1 DIED-OF-THIRST ,STORY085>
	)>
	<IF-ALIVE TEXT085-CONTINUED>>

<CONSTANT TEXT086 "The arrangement of beams reminds you of a trap you were once asked to devise to foil tomb robbers. It is all down to a question of basic stress and strain: identifying which beams are taking the weight of the wall, and which you can safely remove without disturbing anything.||It takes you the better part of an hour, but at last you clear enough space to pick your way through the far end of the passage. You find the courtiers already waiting for you there, crouching around the sides of the wide sunlit courtyard. The chief courtier leaps to his feet as he sees you.||\"What kept you?\" he said. \"If you found that little puzzle of ours difficult, you're going to have real trouble with tests to come.\"">

<ROOM STORY086
	(DESC "086")
	(STORY TEXT086)
	(CONTINUE STORY431)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT087 "You wedge yourself into a corner of the hall and watch the hovering knives with a wary eye. As they come sweeping through the air towards you, you thrust out the stone. Sparks fly as the first of the knives strikes it, chipping its edge of volcanic glass.||The knives go darting away like startled birds, retreating to float around uncertainly in the centre of the hall. After a while they seem to recover themselves and again start to approach. Again you strike out with the stone, blunting one of the knives and sending them veering away -- but this time the attack took a chip out of the stone.||This continues throughout the night. You get no sleep, but at least you have kept the enchanted knives from your own flesh. Your stone shrinks to the size of a pebble, and finally a concerted attack by the knives shatters it entirely. You are waiting nervously for the knives' next assault when they suddenly drop lifeless to the floor with the coming of the dawn.||The courtiers cannot disguise their ill temper when they open the door to find you unscathed. \"You're a cool customer,\" snaps one, \"so you're probably looking forward to the House of Cold tonight.\"">

<ROOM STORY087
	(DESC "087")
	(STORY TEXT087)
	(PRECHOICE STORY087-PRECHOICE)
	(CONTINUE STORY132)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY087-PRECHOICE ()
	<LOSE-ITEM ,STONE>>

<CONSTANT TEXT088 "The chief courtier comes forwards and puts the ball into your hands. \"So we get to launch the first round?\" you say. \"Very sporting.\"||\"We are nothing if not magnanimous,\" he replies with a vaunting leer. \"Later, when you have lost, we will be equally be generous in dividing your carcass.\"||You watch him dart back to the sidelines. At the other end of the arena, the two shadow men stand ready.||\"Begin,\" commands Necklace of Skulls.||You throw the ball against the side wall and run forward to intercept it on the rebound. The nearer of the shadow men charges towards you.">
<CONSTANT CHOICES088 <LTABLE "tackle him head-on" "weave around him towards the rear shadow man" "try to score a point immediately">>

<ROOM STORY088
	(DESC "088")
	(STORY TEXT088)
	(CHOICES CHOICES088)
	(DESTINATIONS <LTABLE STORY111 STORY133 STORY156>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT089 "You aim the ball high up on the wall, so that it strikes the angle where the slope meets the vertical. As it rebounds in a long arc that carries it far out across the arena, you run forward and deflect it against the high-scoring zone on the opposite wall. The ball ricochets off towards your opponents, who leap in to seize possession.">

<ROOM STORY089
	(DESC "089")
	(STORY TEXT089)
	(PRECHOICE STORY089-PRECHOICE)
	(CONTINUE STORY181)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY089-PRECHOICE ()
	<SETG POINTS <+ ,POINTS 2>>
	<COND (<G? ,POINTS 6>
		<STORY-JUMP ,STORY134>
	)(<OR <CHECK-CODEWORD ,CODEWORD-SHADE> <CHECK-CODEWORD ,CODEWORD-ANGEL>>
		<STORY-JUMP ,STORY019>
	)>>

<CONSTANT TEXT090 "\"Buy a waterskin,\" the giant tells you.||\"Others have suggested the same thing.\"||\"Buy two, then. And a knife or sword. There is a four-headed serpent in the desert, and its one weak spot is at the branching of its four necks. You'll need to get close to land a killing blow, and my advice is to pretend to retreat at first. Dodge back a couple of times and the serpent will rush at you headlong -- er, heads-long. Then you can slay it.\"||\"What about just avoiding it?\"||\"Then you wouldn't get a drop of its blood -- a substance like sap, which hardens into rubber.\"||\"And what's the good of that?\"||\"The rubber ball will help you in the Necklace of Skull's contest. The ball contest is an ancient ritual which he uses to humiliate and weaken his foes, but by scoring a daring victory you can exploit the contest's magic for yourself.\"||\"How do I kill Necklace of Skulls?\"||He snorts contemptuously. \"You mortals are so predictable. There are greater victories than revenge. Do you know the ultimate triumph?\"||You can think of several replies, but you doubt if any of them are what he is driving at. \"No.\"||\"The ultimate triumph is to be greater than your enemy,\" he says. \"There, that is my best advice.\"">

<ROOM STORY090
	(DESC "090")
	(STORY TEXT090)
	(CONTINUE STORY135)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT091 "Jade Thunder goes down to the water's edge and sweeps his wand in a grand magical gesture. The water immediately in front of him becomes as smooth and flat as a sheet of glass. You blink in amazement as the effect stretches off into the distance, leaving a glassy causeway through the waves.||You test your weight on the causeway. It is solid. \"Neat trick,\"you say, impressed.||\"I used to be quite famous in my heyday.\" Jade Thunder starts out along the causeway.||\"Can't I join you?\" you call after him.||\"Not on this path. But if you care to sail south to the mainland, look along the coast for a giant who's buried to his neck in the sand. He has been counting stars since the dawn of time. Tell him the true number, which is one hundred thousand million and seven, and he will grant you one wish.\"||You watch him walk of towards the horizon, then go to rejoin the others at the ship. You are amazed to discover that instead of the flimsy vessel in which you set sail, you now have a magnificent craft of green-lacquered kikche wood with magical sails that can never lose the wind. You climb aboard and put out to sea, but now you must decide.">
<CONSTANT CHOICES091 <LTABLE "go east to Tahil" "south as the wizard suggested">>

<ROOM STORY091
	(DESC "091")
	(STORY TEXT091)
	(PRECHOICE STORY091-PRECHOICE)
	(CHOICES CHOICES091)
	(DESTINATIONS <LTABLE STORY300 STORY136>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY091-PRECHOICE ()
	<COND (,RUN-ONCE
		<COND (<CHECK-CODEWORD ,CODEWORD-SAKBE>
			<PUT <GETP ,STORY091 ,P?DESTINATIONS> 2 ,STORY114>
		)(ELSE
			<PUT <GETP ,STORY091 ,P?DESTINATIONS> 2 ,STORY136>
		)>
	)>>

<CONSTANT TEXT092 "You send a surge of occult power to drive the whirlwinds back, but there are too many of them. Here they are in their element, drawing strength from the sand and the rocks and the dry desert air. They penetrate your barrier of spells and come roaring forward, ripping at your body with invisible hands.">
<CONSTANT CHOICES092 <LTABLE "do battle with the demons" "run away from them">>

<ROOM STORY092
	(DESC "092")
	(STORY TEXT092)
	(PRECHOICE STORY092-PRECHOICE)
	(CHOICES CHOICES092)
	(DESTINATIONS <LTABLE STORY115 STORY137>)
	(TYPES TWO-NONES)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY092-PRECHOICE ()
	<COND (,RUN-ONCE
		<COND (<CHECK-SKILL ,SKILL-CHARMS>
			<LOSE-LIFE 2 KILLED-AT-ONCE ,STORY092>
		)(ELSE
			<EMPHASIZE KILLED-AT-ONCE>
		)>
	)>>

<CONSTANT TEXT093 "Realizing there are things you will need on your travels, you head to the market. Here, under a long colonnade festooned with coloured rugs, you can usually find almost anything. Unfortunately it is now late afternoon and many of the traders have packed up their wares and gone home, driven off by the waves of heat rising from the adjacent plaza.||Making your way along the colonnade, you identify the different goods at a glance according to the colours of the rugs. Green indicates sellers of maize, while yellow and red are used for other foodstuffs. Black is the colour of stone or glass items, with the addition of grey frets signifying weaponry. Wooden products are set out on ochre cloth, and white is reserved for clay pottery.||Soon you have found a few items which might prove useful. You count the cacao in your money-pouch while considering which to buy.">

<ROOM STORY093
	(DESC "093")
	(STORY TEXT093)
	(PRECHOICE STORY093-PRECHOICE)
	(CONTINUE STORY389)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY093-PRECHOICE ()
	<MERCHANT <LTABLE WATERSKIN ROPE FIREBRAND POT-OF-DYE CHILLI-PEPPERS> <LTABLE 2 3 2 2 1>>>

<CONSTANT TEXT094 "The spider's bristly limbs send a shiver through you as they slowly probe your outstretched hand. It takes every shred of nerve to remain motionless while you carefully reach around behind it with your other hand. Its multiple eyes gleam horribly, full of the ruthless intensity of the predator. It looks like a demon carved from polished mahogany, more nightmarish than any image on the walls of the Temple of Death.||As you take hold of it, it starts to twitch its legs furiously. With a sob of revulsion, you hurl it away. It falls with an audible thud somewhere off among the trees, but then a stab of pain convulses your hand. Did it bite you after all? You have to prise your fingers apart, but instead of a bite you find dozens of tiny pinpricks all over your palm. The tarantula's bristles were razor-sharp, and seem to have injected a stinging chemical into your skin.">
<CONSTANT TEXT094-CONTINUED "\"Hey, you there! What are you doing?\"||You look up to see an old peasant hurrying through the dusty orchard towards the causeway">
<CONSTANT CHOICES094 <LTABLE "talk to him" "leave before he gets here">>

<ROOM STORY094
	(DESC "094")
	(STORY TEXT094)
	(PRECHOICE STORY094-PRECHOICE)
	(CHOICES CHOICES094)
	(DESTINATIONS <LTABLE STORY117 STORY163>)
	(TYPES TWO-NONES)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY094-PRECHOICE ()
	<COND (,RUN-ONCE <LOSE-LIFE 1 DIED-GREW-WEAKER ,STORY094>)>
	<COND (<IS-ALIVE>
		<CRLF>
		<TELL TEXT094-CONTINUED>
		<TELL ,PERIOD-CR>
		<COND (,RUN-ONCE
			<COND (<CHECK-SKILL ,SKILL-ETIQUETTE>
				<PUT <GETP ,STORY094 ,P?DESTINATIONS> 2 ,STORY139>
			)(ELSE
				<PUT <GETP ,STORY094 ,P?DESTINATIONS> 2 ,STORY063>
			)>
		)>
	)>>

<CONSTANT TEXT095 "You trudge wearily on, but your wounds soon become infected and within a few hours you are too weak to continue. Slumping down against the trunk of a tree, you lapse into a fever while ants crawl uncaringly across your outstretched legs. Cold sweat pours off you as your limbs begin to shake, and gradually you slip into unconsciousness.||Tortured by the pain of fever, your mind retreats into delirium. You see your brother in the clutches of a grotesque phantom with fleshless features. Fire licks up across a sky drenched in blood, but there is no heat. The scene becomes smeared with lurid greens and violets from which skulls peer with eager watchfulness. Then, emerging from the image like a reflection in a stagnant pool, you see a colossal serpent with four leering faces...||You awaken to find yourself lying on a bed of wadded leaves. There is a smell of wood smoke and roasting meat in the air. Groaning at the ache deep in your bones, you sit up and take stock of your surroundings. You are in a hut with open walls, on the edge of a clearing. Outside you see a woodland pool surrounded by crude plots of tomato, manioc, peppers and sweet potatoes.||\"So you recovered. We expected you to die.\"||The accent is lilting and unfamiliar. Craning your neck, you see a group of men in plain white robes clustered around a fire. They have your possessions spread out among them. Then you see what is roasting on the fire, and the sight makes you gasp in horror. It is a tiny baby, hideously charred as the flames lick around its thin body!">
<CONSTANT CHOICES095 <LTABLE "leap up at once and rush off into the woods abandoning your belongings" "attack these cannibals at once" "wait to see what they have to say">>

<ROOM STORY095
	(DESC "095")
	(STORY TEXT095)
	(CHOICES CHOICES095)
	(DESTINATIONS <LTABLE STORY095-LOSE-ALL STORY073 STORY027>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<ROOM STORY095-LOSE-ALL
	(DESC "095")
	(EVENTS STORY095-EVENTS)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY095-EVENTS ()
	<EMPHASIZE "You lose all your belongings">
	<PRESS-A-KEY>
	<COND (,RUN-ONCE <RESET-CONTAINER ,PLAYER>)>
	<RETURN ,STORY050>>

<CONSTANT TEXT096 "They succeed in dislodging several fat plums without disturbing any spiders. You watch as they squabble happily over the distribution of their spoils Apparently you were just unlucky in finding a tarantula in the fruit you tried to pick, but the incident has deadened your appetite and you continue on your way without stopping to collect any of the plums yourself.">

<ROOM STORY096
	(DESC "096")
	(STORY TEXT096)
	(CONTINUE STORY350)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT097 "The oarsmen are demons with squinting eyes and shrunken toothless gums. Stingray spines hang from their brows and upper lips where a mortal might have hair, and their flesh is a sickly blue-white colour. One wears a headdress in the shape of a shark's fin, the other has a jaguar-pelt skullcap. As the canoe draws nearer, you see they have no lower limbs: their torsos end in shapeless blobs.||\"You wish to be conveyed to the Deathlands,\" says the shark paddler.||\"We will take you there,\" add the jaguar paddler.||Loathsome as these creatures are, you see no alternative. You climb into the boat and wait as they row through the wanly lit gloom of the cavern. Ahead lies a tunnel, but before you reach it the canoe glides to a halt beside a shelf of rock. You look up to see a narrow crevice in the wall of the cavern. It looks far from inviting, and you detect a gust of noxious air wafting out of the darkened interior.">
<CONSTANT CHOICES097 <LTABLE "disembark and climb up to the crevice" "wait for the strange demons to row on">>

<ROOM STORY097
	(DESC "097")
	(STORY TEXT097)
	(CHOICES CHOICES097)
	(DESTINATIONS <LTABLE STORY074 STORY258>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT098 "A cacophony of chitterings and gleeful screeches makes you look up. From the foliage overhead, dozens of beady pairs of eyes stare back at you. You laugh as you see the tiny comical faces of a troop of monkeys, teeth bared like grimacing old men.||Suddenly you feel small fingers probing at your clothes. A couple of monkeys have crept up on you while the others distracted your attention. One leaps onto your head and puts its hands over your eyes while the other rifles through your belongings. You give vent to a loud curse and lunge to grab the little thieves, but they are too quick for you. You can only stand and watch helplessly as they go swinging happily off the through the trees.">
<CONSTANT CHOICES098 <LTABLE "go straight on" "bear left from here" "bear right">>

<ROOM STORY098
	(DESC "098")
	(STORY TEXT098)
	(PRECHOICE STORY098-PRECHOICE)
	(CHOICES CHOICES098)
	(DESTINATIONS <LTABLE STORY121 STORY412 STORY029>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY098-PRECHOICE ("AUX" (COUNT 0))
	<COND (,RUN-ONCE
		<RESET-TEMP-LIST>
		<COND (<CHECK-ITEM ,MAGIC-AMULET> <SET COUNT <+ .COUNT 1>> <PUT TEMP-LIST .COUNT ,MAGIC-AMULET>)>
		<COND (<CHECK-ITEM ,SHAWL> <SET COUNT <+ .COUNT 1>> <PUT TEMP-LIST .COUNT ,SHAWL>)>
		<COND (<CHECK-ITEM ,JADE-BEAD> <SET COUNT <+ .COUNT 1>> <PUT TEMP-LIST .COUNT ,JADE-BEAD>)>
		<COND (<CHECK-ITEM ,MAGIC-POTION> <SET COUNT <+ .COUNT 1>> <PUT TEMP-LIST .COUNT ,MAGIC-POTION>)>
		<COND (<CHECK-ITEM ,MAIZE-CAKES> <SET COUNT <+ .COUNT 1>> <PUT TEMP-LIST .COUNT ,MAIZE-CAKES>)>
		<COND (<G? .COUNT 0>
			<COND (<G? .COUNT 1>
				<CRLF>
				<TELL "The monkeys managed to filch one of your items. Select which items to retain" ,PERIOD-CR>
				<REPEAT ()
					<DO (I 1 .COUNT)
						<REMOVE <GETP TEMP-LIST .I>>
					>
					<SELECT-FROM-LIST TEMP-LIST .COUNT <- .COUNT 1>>
					<CRLF>
					<TELL "Are you sure?">
					<COND (<YES?> <RETURN>)>
				>
			)(ELSE
				<CRLF>
				<TELL "The monkeys managed to filch your " D <GET TEMP-LIST 1> ,PERIOD-CR>
				<LOSE-ITEM <GET TEMP-LIST 1>>
			)>
		)(ELSE
			<CRLF>
			<TELL "The monkeys did not manage to filch anything" ,PERIOD-CR>
		)>
	)>>

<CONSTANT TEXT099 "You can hear the sound of rapids up ahead, and the current carries the boat faster and faster towards them. Hurriedly tying the rope into a loop, you cast it towards the side of the tunnel and manage to lasso an outcrop of rock. The boat is jerked to a halt and sent drifting towards a side tunnel where the current is not so strong. You are unable to dislodge the rope but at least you are safe.||A flicker of daylight shows at the end of the tunnel. You can smell the reek of stagnant marshland in the air. Paddling onwards, you come out into the open under an overcast sky the colour of dead skin. The river here is no more than a muddy trickle winding through sickly grey marshland. A dreary landscape of sour white clay and colourless rushes stretches far off into the distance.||You put in a rotting wooden jetty and tether the boat.">

<ROOM STORY099
	(DESC "099")
	(STORY TEXT099)
	(PRECHOICE STORY099-PRECHOICE)
	(CONTINUE STORY053)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY099-PRECHOICE ()
	<LOSE-ITEM ,ROPE>
	<CRLF>
	<TELL "Keep the paddle?">
	<COND (<YES?> <TAKE-ITEM ,PADDLE>)>>

<CONSTANT TEXT100 "The woman dozes until the long red rays of late afternoon are drawing back across the treetops. Suddenly her arms jerk up as though on strings, seizing the pitcher and lifting it to reveal a second head is superficially humanoid, there is no mistaking it for any human face with its staring bloodshot eyes and black slit of a mouth.|||Long black hair uncoils like tendrils from the monstrous head. Some of the tresses are up to two metres long, and you watch in revulsion as they form into thin matted stalks which remind you of an insect's legs. These probe the ground, preparing to support the creature's weight, and then with a grisly sucking sound the head pulls itself free of the sleeping woman's neck. As soon as it sets eyes on you it gives a gurgle of ghoulish glee and comes scuttling forward on its limbs of twisted hair. It uses some of these to propel itself up level with your face, snapping at your neck with its sharp chisel-shaped teeth while other strands of hair snake out to encircle your wrists. You cannot use a weapon now even if you have one; this struggle will be fought at close quarters.">

<ROOM STORY100
	(DESC "100")
	(STORY TEXT100)
	(PRECHOICE STORY100-PRECHOICE)
	(CONTINUE STORY149)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY100-PRECHOICE ()
	<COND (<CHECK-SKILL ,SKILL-UNARMED-COMBAT> <STORY-JUMP ,STORY126>)>>

<CONSTANT TEXT101 "You find a merchant who has heard of your clan and offer him one cacao to give you lodging.||\"Many people are pouring into the city from the surrounding countryside. They come to take part in the festival, and all will need a place to sleep off their excesses,\" he points out in a patient attempt to get you to offer more.||You are having none of it. \"They're just peasants,\" you counter. \"What little money they have will be spent on mead, and they'll happily sleep where they drop.\"||As an added incentive you take a cacao from your money-pouch and show it to him. This clinches the bargain, and you are given a meal and a bed in his house on the outskirts of the city.">
<CONSTANT TEXT101-CONTINUED "You rest for the night then decide what to do the next morning">
<CONSTANT CHOICES101 <LTABLE "head overland to Ashaka" "follow the river to the coast" "stay for the festival">>

<ROOM STORY101
	(DESC "101")
	(STORY TEXT101)
	(PRECHOICE STORY101-PRECHOICE)
	(CHOICES CHOICES101)
	(DESTINATIONS <LTABLE STORY008 STORY030 STORY416>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY101-PRECHOICE ()
	<COND (,RUN-ONCE
		<CHARGE-MONEY 1>
		<COND (<CHECK-CODEWORD ,CODEWORD-PSYCHODUCT>
			<STORY-JUMP ,STORY331>
		)(ELSE
			<GAIN-LIFE 1>
		)>
	)>>

<CONSTANT TEXT102 "You are too proud to submit to a beating. With a great shout of rage, you charge in among them and lay about you with powerful blows. The sudden attack takes them by surprise, allowing you to badly wound several before the sheer weight of numbers begins to tell against you. For all your courage and determination, at last you are overwhelmed and pushed to the ground. Once they have you down, the guards make sure to pay you back double for every blow you struck against them.">
<CONSTANT TEXT102-SURVIVED "The guards finally tire of pummelling you. One of them spits on your swollen bloodied face, then they stalk off into the palace.">

<ROOM STORY102
	(DESC "102")
	(STORY TEXT102)
	(PRECHOICE STORY102-PRECHOICE)
	(CONTINUE STORY262)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY102-PRECHOICE ("AUX" (DAMAGE 3))
	<COND (<CHECK-SKILL ,SKILL-SWORDPLAY>
		<SET DAMAGE 6>
	)(<CHECK-SKILL ,SKILL-UNARMED-COMBAT>
		<SET DAMAGE 5>
	)>
	<LOSE-LIFE .DAMAGE DIED-IN-COMBAT ,STORY102>
	<IF-ALIVE TEXT102-SURVIVED>>

<CONSTANT TEXT103 "\"Wait!\"||All eyes turn in your direction. The high priest scowls, \"Who is this outsider who dares to interrupt the sacred rite?\"||\"Release them,\" you say, ignoring him. \"I shall carry your petition into the underworld.\"||The priest strides over, pressing his face inches from yours with a look of black fury. \"You? Why should I let you undertake this journey?\"||\"Because I was sent here by a god.\"||He has no answer to that. For a moment his mouth works silently, ready to frame a protest, but he has already seen the light of truth in your eyes. Stepping back, he gives a nod and the young couple are set free.">
<CONSTANT CHOICES103 <LTABLE "jump into the sacred well" "cast a protective enchantment first">>

<ROOM STORY103
	(DESC "103")
	(STORY TEXT103)
	(CHOICES CHOICES103)
	(DESTINATIONS <LTABLE STORY327 STORY304>)
	(REQUIREMENTS <LTABLE NONE SKILL-SPELLS>)
	(TYPES <LTABLE R-NONE R-SKILL>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT104 "The woman whose body is host to the parasitical head remains in a deep sleep, but her limbs strike out like a living puppet's. The head gnashes its teeth, screeching horribly, as it guides its stolen body forward to attack you with jerking strides.">
<CONSTANT CHOICES104 <LTABLE "rush in to attack" "back away" "stand your ground and dodge to one side at the last moment">>

<ROOM STORY104
	(DESC "104")
	(STORY TEXT104)
	(CHOICES CHOICES104)
	(DESTINATIONS <LTABLE STORY195 STORY265 STORY242>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT105 "The green-tinted stone of the staircase is almost invisible through the murky depths. You bite your lip as you consider the water of the lake. It looks almost resinous with cold. You cannot expect to survive long once you are submerged -- you would freeze to death even before you had time to run out of air.">

<ROOM STORY105
	(DESC "105")
	(STORY TEXT105)
	(PRECHOICE STORY105-PRECHOICE)
	(CONTINUE STORY150)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY105-PRECHOICE ()
	<COND (<CHECK-ITEM ,HAUNCH-OF-VENISON> <STORY-JUMP ,STORY440>)>>

<CONSTANT TEXT106 "The nobles are discussing their route into the underworld. You are given to understand that at death most souls are conducted west across the world, entering the afterlife by means of the gate at the edge of the desert. This requires them to pass four sentinels whose duty is to prevent the living from trespassing into their realm. You catch the name of the last four sentinels whom the nobles passed on their way here, a frightful demon called Grandfather of Darkness.||One of the nobles is staring at you, and as you turn a quizzical look towards him he remarks on your resemblance to his late lord, Morning Star.||Excitement quickens your blood. \"Morning Star was my brother.\"||He tells you that he was in Morning Star's retinue when it reached the palace of the wizard. He reaches behind him and produces a skull which he puts into your hands, telling you that it is your brother's skull. Because Morning Star's soul was trapped by the wizard, he has not been able to travel on to the afterlife. This is all that remains of him.||You are filled with grief, followed by a rush of vengeful rage. You vow you will slay the wizard and free your brother's soul. Thanking the nobles for their help, you set out once again.">

<ROOM STORY106
	(DESC "106")
	(STORY TEXT106)
	(CONTINUE STORY200)
	(ITEM BROTHERS-SKULL)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT107 "Then sentinel's eyes flash with fury as he hears your words. Letting his gory maw drop open, he erupts into a long loud howl of fury that is terrifying enough to kill a weak man on the spot. Even you are flung to a cowering heap on the ground, forced to tuck your head under your arms and lie whimpering until the dreadful howling ends.||At last there is silence. You uncurl yourself and glance up towards the sentinel. Having given awful voice to his displeasure, he now shows no more interest in you. He resumes his imperious posture, sitting erect on his throne and staring directly across the passage. You might as well be a beetle for all the notice he gives you.||You slink off down the passage. You are dazed, but at first you think you have got off lightly. Then you realize how badly the sentinel's shriek addled your wits.">
<CONSTANT TEXT107-CONTINUED "You will need every scrap of luck to win through with just a single skill">

<ROOM STORY107
	(DESC "107")
	(STORY TEXT107)
	(PRECHOICE STORY107-PRECHOICE)
	(CONTINUE STORY037)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY107-PRECHOICE ()
	<EMPHASIZE "You lose all skills except one.">
	<LOSE-SKILLS 1>
	<CRLF>
	<TELL TEXT107-CONTINUED>
	<TELL ,PERIOD-CR>>

<CONSTANT TEXT108 "You get the servant to help you build a mound of sand roughly as long as a man's body. On top of this you sprinkle some of the dead warrior's blood, then you cover it with his jaguar-skin cloak and place his sword on top of this. At one end you carefully set his severed head. The dead eyes stare up at the stars.||\"What are you going to do?\" says the servant in a frightened voice||\"His spirit has but recently departed\" you reply as you take up your wand. \"I shall recall it and so rekindle the spark of life.\" So you begin what you know will be the hardest incantation of your life. For hours you continue the chant, never faltering, continually tracing occult designs in the sand around the head. The moon is dipping low across the dunes when you hoarsely utter the last syllables of the spell and slump to the ground in exhaustion.||There is a groan, but not from your lips. You look up to see the fallen warrior rising, the body beneath the cloak transformed from gore-soaked sand to living flesh and blood.||\"Master,\" you hear the servant saying, \"this kind magician brought you back from the dead.\"||\"Nonsense!\" scoffs the warrior. \"I must have been knocked out for a while, that's all.\"||He comes over and helps you to your feet. You have used up all your sorcery in a final miracle.">

<ROOM STORY108
	(DESC "108")
	(STORY TEXT108)
	(PRECHOICE STORY108-PRECHOICE)
	(CONTINUE STORY015)
	(CODEWORD CODEWORD-ANGEL)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY108-PRECHOICE ()
	<COND (<CHECK-SKILL ,SKILL-SPELLS>
		<EMPHASIZE "You have lost the SPELLS skill.">
		<MOVE ,SKILL-SPELLS ,LOST-SKILLS>
	)>>

<CONSTANT TEXT109 "You use your illusion magic to conjure up a miniature duplicate of the tunnel. Each of the beams appears as a glowing bar tagged with a number. By touching a bar with your wand and uttering the right number, you can select and move it. This allows you to experiment without actually having to remove any of the real beams just yet. Your first few attempts all lead to the illusory tunnel collapsing, but eventually you find a combination of beams that can be removed safely.||Dispelling your illusion, you try removing the same arrangement of beams from the real passage. Cracks appear in the stonework and the walls sag slightly, but you are able to get through safely to the far end. The courtiers are waiting for you there.||\"Magic, eh?\" says the chief courtier. \"Our master's good at magic. Better than you, perhaps.\"||\"Perhaps.\"">

<ROOM STORY109
	(DESC "109")
	(STORY TEXT109)
	(CONTINUE STORY431)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT110 "The knives drift in a circle around you as you move uneasily across the hall. Suddenly, one of them shoots forward and slices a gash in your arm. Recoiling in pain, you are jabbed by another. They are trying to herd you into a position where they can attack you from all directions, but you manage to duck under one as it flies in. Before they can regroup, you have run over to a corner and put back to the wall.||The ordeal continues through the night. You cannot afford to close your eyes for a moment, as the knives would then tear you to shreds. You dodge many attacks, but several cut you badly and soon your strength is ebbing along with your blood.">
<CONSTANT TEXT110-CONTINUED "At dawn, the knives suddenly fall lifeless to the floor and soon after the courtiers come to let you out.">

<ROOM STORY110
	(DESC "110")
	(STORY TEXT110)
	(PRECHOICE STORY110-PRECHOICE)
	(CONTINUE STORY132)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY110-PRECHOICE ("AUX" (DAMAGE 2))
	<COND (<CHECK-SKILL ,SKILL-AGILITY> <SET DAMAGE 1>)>
	<LOSE-LIFE .DAMAGE DIED-GREW-WEAKER ,STORY110>
	<IF-ALIVE TEXT110-CONTINUED>>

<ROOM STORY111
	(DESC "111")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY112
	(DESC "112")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY113
	(DESC "113")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY114
	(DESC "114")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY115
	(DESC "115")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY116
	(DESC "116")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY117
	(DESC "117")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY118
	(DESC "118")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY119
	(DESC "119")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY120
	(DESC "120")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY121
	(DESC "121")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY122
	(DESC "122")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY123
	(DESC "123")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY124
	(DESC "124")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY125
	(DESC "125")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY126
	(DESC "126")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY127
	(DESC "127")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY128
	(DESC "128")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY129
	(DESC "129")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY130
	(DESC "130")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY131
	(DESC "131")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY132
	(DESC "132")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY133
	(DESC "133")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY134
	(DESC "134")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY135
	(DESC "135")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY136
	(DESC "136")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY137
	(DESC "137")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY138
	(DESC "138")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY139
	(DESC "139")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY140
	(DESC "140")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY141
	(DESC "141")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY142
	(DESC "142")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY143
	(DESC "143")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY144
	(DESC "144")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY145
	(DESC "145")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY146
	(DESC "146")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY147
	(DESC "147")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY148
	(DESC "148")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY149
	(DESC "149")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY150
	(DESC "150")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY151
	(DESC "151")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY152
	(DESC "152")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY153
	(DESC "153")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY154
	(DESC "154")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY155
	(DESC "155")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY156
	(DESC "156")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY157
	(DESC "157")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY158
	(DESC "158")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY159
	(DESC "159")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY160
	(DESC "160")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY161
	(DESC "161")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY162
	(DESC "162")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY163
	(DESC "163")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY164
	(DESC "164")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY165
	(DESC "165")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY166
	(DESC "166")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY167
	(DESC "167")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY168
	(DESC "168")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY169
	(DESC "169")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY170
	(DESC "170")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY171
	(DESC "171")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY172
	(DESC "172")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY173
	(DESC "173")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY174
	(DESC "174")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY175
	(DESC "175")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY176
	(DESC "176")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY177
	(DESC "177")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY178
	(DESC "178")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY179
	(DESC "179")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY180
	(DESC "180")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY181
	(DESC "181")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY182
	(DESC "182")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY183
	(DESC "183")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY184
	(DESC "184")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY185
	(DESC "185")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY186
	(DESC "186")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY187
	(DESC "187")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY188
	(DESC "188")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY189
	(DESC "189")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY190
	(DESC "190")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY191
	(DESC "191")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY192
	(DESC "192")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY193
	(DESC "193")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY194
	(DESC "194")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY195
	(DESC "195")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY196
	(DESC "196")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY197
	(DESC "197")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY198
	(DESC "198")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY199
	(DESC "199")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY200
	(DESC "200")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY201
	(DESC "201")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY202
	(DESC "202")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY203
	(DESC "203")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY204
	(DESC "204")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY205
	(DESC "205")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY206
	(DESC "206")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY207
	(DESC "207")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY208
	(DESC "208")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY209
	(DESC "209")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY210
	(DESC "210")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY211
	(DESC "211")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY212
	(DESC "212")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY213
	(DESC "213")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY214
	(DESC "214")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY215
	(DESC "215")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY216
	(DESC "216")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY217
	(DESC "217")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY218
	(DESC "218")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY219
	(DESC "219")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY220
	(DESC "220")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY221
	(DESC "221")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY222
	(DESC "222")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY223
	(DESC "223")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY224
	(DESC "224")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY225
	(DESC "225")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY226
	(DESC "226")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY227
	(DESC "227")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY228
	(DESC "228")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY229
	(DESC "229")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY230
	(DESC "230")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY231
	(DESC "231")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY232
	(DESC "232")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY233
	(DESC "233")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY234
	(DESC "234")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY235
	(DESC "235")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY236
	(DESC "236")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY237
	(DESC "237")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY238
	(DESC "238")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY239
	(DESC "239")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY240
	(DESC "240")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY241
	(DESC "241")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY242
	(DESC "242")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY243
	(DESC "243")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY244
	(DESC "244")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY245
	(DESC "245")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY246
	(DESC "246")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY247
	(DESC "247")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY248
	(DESC "248")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY249
	(DESC "249")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY250
	(DESC "250")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY251
	(DESC "251")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY252
	(DESC "252")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY253
	(DESC "253")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY254
	(DESC "254")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY255
	(DESC "255")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY256
	(DESC "256")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY257
	(DESC "257")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY258
	(DESC "258")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY259
	(DESC "259")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY260
	(DESC "260")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY261
	(DESC "261")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY262
	(DESC "262")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY263
	(DESC "263")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY264
	(DESC "264")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY265
	(DESC "265")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY266
	(DESC "266")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY267
	(DESC "267")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY268
	(DESC "268")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY269
	(DESC "269")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY270
	(DESC "270")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY271
	(DESC "271")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY272
	(DESC "272")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY273
	(DESC "273")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY274
	(DESC "274")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY275
	(DESC "275")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY276
	(DESC "276")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY277
	(DESC "277")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY278
	(DESC "278")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY279
	(DESC "279")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY280
	(DESC "280")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY281
	(DESC "281")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY282
	(DESC "282")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY283
	(DESC "283")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY284
	(DESC "284")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY285
	(DESC "285")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY286
	(DESC "286")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY287
	(DESC "287")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY288
	(DESC "288")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY289
	(DESC "289")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY290
	(DESC "290")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY291
	(DESC "291")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY292
	(DESC "292")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY293
	(DESC "293")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY294
	(DESC "294")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY295
	(DESC "295")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY296
	(DESC "296")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY297
	(DESC "297")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY298
	(DESC "298")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY299
	(DESC "299")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY300
	(DESC "300")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY301
	(DESC "301")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY302
	(DESC "302")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY303
	(DESC "303")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY304
	(DESC "304")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY305
	(DESC "305")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY306
	(DESC "306")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY307
	(DESC "307")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY308
	(DESC "308")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY309
	(DESC "309")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY310
	(DESC "310")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY311
	(DESC "311")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY312
	(DESC "312")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY313
	(DESC "313")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY314
	(DESC "314")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY315
	(DESC "315")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY316
	(DESC "316")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY317
	(DESC "317")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY318
	(DESC "318")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY319
	(DESC "319")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY320
	(DESC "320")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY321
	(DESC "321")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY322
	(DESC "322")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY323
	(DESC "323")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY324
	(DESC "324")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY325
	(DESC "325")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY326
	(DESC "326")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY327
	(DESC "327")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY328
	(DESC "328")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY329
	(DESC "329")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY330
	(DESC "330")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY331
	(DESC "331")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY332
	(DESC "332")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY333
	(DESC "333")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY334
	(DESC "334")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY335
	(DESC "335")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY336
	(DESC "336")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY337
	(DESC "337")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY338
	(DESC "338")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY339
	(DESC "339")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY340
	(DESC "340")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY341
	(DESC "341")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY342
	(DESC "342")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY343
	(DESC "343")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY344
	(DESC "344")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY345
	(DESC "345")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY346
	(DESC "346")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY347
	(DESC "347")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY348
	(DESC "348")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY349
	(DESC "349")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY350
	(DESC "350")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY351
	(DESC "351")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY352
	(DESC "352")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY353
	(DESC "353")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY354
	(DESC "354")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY355
	(DESC "355")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY356
	(DESC "356")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY357
	(DESC "357")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY358
	(DESC "358")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY359
	(DESC "359")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY360
	(DESC "360")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY361
	(DESC "361")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY362
	(DESC "362")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY363
	(DESC "363")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY364
	(DESC "364")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY365
	(DESC "365")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY366
	(DESC "366")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY367
	(DESC "367")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY368
	(DESC "368")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY369
	(DESC "369")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY370
	(DESC "370")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY371
	(DESC "371")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY372
	(DESC "372")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY373
	(DESC "373")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY374
	(DESC "374")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY375
	(DESC "375")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY376
	(DESC "376")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY377
	(DESC "377")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY378
	(DESC "378")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY379
	(DESC "379")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY380
	(DESC "380")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY381
	(DESC "381")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY382
	(DESC "382")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY383
	(DESC "383")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY384
	(DESC "384")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY385
	(DESC "385")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY386
	(DESC "386")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY387
	(DESC "387")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY388
	(DESC "388")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY389
	(DESC "389")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY390
	(DESC "390")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY391
	(DESC "391")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY392
	(DESC "392")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY393
	(DESC "393")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY394
	(DESC "394")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY395
	(DESC "395")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY396
	(DESC "396")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY397
	(DESC "397")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY398
	(DESC "398")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY399
	(DESC "399")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY400
	(DESC "400")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY401
	(DESC "401")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY402
	(DESC "402")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY403
	(DESC "403")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY404
	(DESC "404")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY405
	(DESC "405")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY406
	(DESC "406")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY407
	(DESC "407")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY408
	(DESC "408")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY409
	(DESC "409")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY410
	(DESC "410")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY411
	(DESC "411")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY412
	(DESC "412")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY413
	(DESC "413")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY414
	(DESC "414")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY415
	(DESC "415")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY416
	(DESC "416")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY417
	(DESC "417")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY418
	(DESC "418")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY419
	(DESC "419")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY420
	(DESC "420")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY421
	(DESC "421")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY422
	(DESC "422")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY423
	(DESC "423")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY424
	(DESC "424")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY425
	(DESC "425")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY426
	(DESC "426")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY427
	(DESC "427")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY428
	(DESC "428")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY429
	(DESC "429")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY430
	(DESC "430")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY431
	(DESC "431")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY432
	(DESC "432")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY433
	(DESC "433")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY434
	(DESC "434")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY435
	(DESC "435")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY436
	(DESC "436")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY437
	(DESC "437")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY438
	(DESC "438")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY439
	(DESC "439")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY440
	(DESC "440")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY441
	(DESC "441")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<ROOM STORY442
	(DESC "442")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

